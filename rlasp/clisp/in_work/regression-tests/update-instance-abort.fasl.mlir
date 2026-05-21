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
      %41 = func.call @cc_nil_value() : () -> i64
      %42 = func.call @cc_nil_value() : () -> i64
      %43 = func.call @cc_errorp(%41) : (i64) -> i64
      %44 = arith.cmpi ne, %43, %42 : i64
      %45 = scf.if %44 -> (i64) {
        scf.yield %41 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %46 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %47 = llvm.mlir.addressof @str4 : !llvm.ptr
        %48 = arith.constant 5 : i64
        %49 = func.call @cc_make_string(%47, %48) : (!llvm.ptr, i64) -> i64
        %50 = llvm.mlir.addressof @str5 : !llvm.ptr
        %51 = arith.constant 11 : i64
        %52 = func.call @cc_make_string(%50, %51) : (!llvm.ptr, i64) -> i64
        %53 = func.call @cc_intern(%49, %52) : (i64, i64) -> i64
        %54 = func.call @cc_nil_value() : () -> i64
        %55 = func.call @cc_cons(%53, %54) : (i64, i64) -> i64
        %56 = func.call @cc_values_pack(%55) : (i64) -> i64
        %57 = func.call @stack_pop_pointer() : () -> i64
        %58 = func.call @cc_cons(%53, %57) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
        %59 = arith.addi %58, %__rlasp_stack_elide_zero_0 : i64
        %60 = llvm.mlir.addressof @str6 : !llvm.ptr
        %61 = arith.constant 13 : i64
        %62 = func.call @cc_make_string(%60, %61) : (!llvm.ptr, i64) -> i64
        %63 = func.call @cc_nil_value() : () -> i64
        %64 = func.call @cc_intern(%62, %63) : (i64, i64) -> i64
        %65 = func.call @cc_nil_value() : () -> i64
        %66 = func.call @cc_cons(%64, %65) : (i64, i64) -> i64
        %67 = func.call @cc_values_pack(%66) : (i64) -> i64
        %68 = func.call @cc_defclass(%64, %46, %59) : (i64, i64, i64) -> i64
        %69 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%69) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %70 = func.call @stack_pop_pointer() : () -> i64
        %71 = func.call @stack_pop_pointer() : () -> i64
        %72 = func.call @cc_cons(%70, %71) : (i64, i64) -> i64
        func.call @stack_push_pointer(%72) : (i64) -> ()
        %73 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%73) : (i64) -> ()
        %74 = llvm.mlir.addressof @str7 : !llvm.ptr
        %75 = arith.constant 5 : i64
        %76 = func.call @cc_make_string(%74, %75) : (!llvm.ptr, i64) -> i64
        %77 = llvm.mlir.addressof @str8 : !llvm.ptr
        %78 = arith.constant 11 : i64
        %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
        %80 = func.call @cc_intern(%76, %79) : (i64, i64) -> i64
        %81 = func.call @cc_nil_value() : () -> i64
        %82 = func.call @cc_cons(%80, %81) : (i64, i64) -> i64
        %83 = func.call @cc_values_pack(%82) : (i64) -> i64
        %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
        %84 = arith.addi %80, %__rlasp_stack_elide_zero_1 : i64
        %85 = func.call @stack_pop_pointer() : () -> i64
        %86 = func.call @cc_cons(%84, %85) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
        %87 = arith.addi %86, %__rlasp_stack_elide_zero_2 : i64
        %88 = func.call @stack_pop_pointer() : () -> i64
        %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
        func.call @stack_push_pointer(%89) : (i64) -> ()
        %90 = llvm.mlir.addressof @str9 : !llvm.ptr
        %91 = arith.constant 13 : i64
        %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
        %93 = func.call @cc_nil_value() : () -> i64
        %94 = func.call @cc_intern(%92, %93) : (i64, i64) -> i64
        %95 = func.call @cc_nil_value() : () -> i64
        %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
        %97 = func.call @cc_values_pack(%96) : (i64) -> i64
        %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
        %98 = arith.addi %94, %__rlasp_stack_elide_zero_3 : i64
        %99 = func.call @stack_pop_pointer() : () -> i64
        %100 = func.call @cc_cons(%98, %99) : (i64, i64) -> i64
        func.call @stack_push_pointer(%100) : (i64) -> ()
        %101 = llvm.mlir.addressof @str10 : !llvm.ptr
        %102 = arith.constant 8 : i64
        %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
        %104 = func.call @cc_nil_value() : () -> i64
        %105 = func.call @cc_intern(%103, %104) : (i64, i64) -> i64
        %106 = func.call @cc_nil_value() : () -> i64
        %107 = func.call @cc_cons(%105, %106) : (i64, i64) -> i64
        %108 = func.call @cc_values_pack(%107) : (i64) -> i64
        %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
        %109 = arith.addi %105, %__rlasp_stack_elide_zero_4 : i64
        %110 = func.call @stack_pop_pointer() : () -> i64
        %111 = func.call @cc_cons(%109, %110) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
        %112 = arith.addi %111, %__rlasp_stack_elide_zero_5 : i64
        %113 = func.call @cc_nil_value() : () -> i64
        %114 = func.call @cc_cons(%112, %113) : (i64, i64) -> i64
        %115 = func.call @cc_eval(%114) : (i64) -> i64
        %116 = func.call @cc_multiple_value_list(%115) : (i64) -> i64
        %117 = func.call @cc_values_pack(%116) : (i64) -> i64
        func.call @stack_push_pointer(%117) : (i64) -> ()
        %118 = func.call @stack_depth() : () -> i64
        %119 = arith.constant 0 : i64
        %120 = arith.cmpi sgt, %118, %119 : i64
        scf.if %120 {
          %121 = func.call @stack_pop_pointer() : () -> i64
        }
        %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
        %122 = arith.addi %64, %__rlasp_stack_elide_zero_6 : i64
        scf.yield %122 : i64
      }
      %123 = func.call @cc_nil_value() : () -> i64
      %124 = func.call @cc_errorp(%45) : (i64) -> i64
      %125 = arith.cmpi ne, %124, %123 : i64
      %126 = scf.if %125 -> (i64) {
        scf.yield %45 : i64
      } else {
        %127 = llvm.mlir.addressof @str11 : !llvm.ptr
        %128 = arith.constant 13 : i64
        %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
        %130 = func.call @cc_nil_value() : () -> i64
        %131 = func.call @cc_intern(%129, %130) : (i64, i64) -> i64
        %132 = func.call @cc_nil_value() : () -> i64
        %133 = func.call @cc_cons(%131, %132) : (i64, i64) -> i64
        %134 = func.call @cc_values_pack(%133) : (i64) -> i64
        %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
        %135 = arith.addi %131, %__rlasp_stack_elide_zero_7 : i64
        scf.yield %135 : i64
      }
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %136 = arith.addi %126, %__rlasp_stack_elide_zero_8 : i64
      scf.yield %136 : i64
    }
    %137 = func.call @cc_nil_value() : () -> i64
    %138 = func.call @cc_errorp(%40) : (i64) -> i64
    %139 = arith.cmpi ne, %138, %137 : i64
    %140 = scf.if %139 -> (i64) {
      scf.yield %40 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %141 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %142 = llvm.mlir.addressof @str12 : !llvm.ptr
      %143 = arith.constant 14 : i64
      %144 = func.call @cc_make_string(%142, %143) : (!llvm.ptr, i64) -> i64
      %145 = llvm.mlir.addressof @str13 : !llvm.ptr
      %146 = arith.constant 11 : i64
      %147 = func.call @cc_make_string(%145, %146) : (!llvm.ptr, i64) -> i64
      %148 = func.call @cc_intern(%144, %147) : (i64, i64) -> i64
      %149 = func.call @cc_nil_value() : () -> i64
      %150 = func.call @cc_cons(%148, %149) : (i64, i64) -> i64
      %151 = func.call @cc_values_pack(%150) : (i64) -> i64
      %152 = func.call @stack_pop_pointer() : () -> i64
      %153 = func.call @cc_cons(%148, %152) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %154 = arith.addi %153, %__rlasp_stack_elide_zero_9 : i64
      %155 = llvm.mlir.addressof @str14 : !llvm.ptr
      %156 = arith.constant 15 : i64
      %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
      %158 = func.call @cc_nil_value() : () -> i64
      %159 = func.call @cc_intern(%157, %158) : (i64, i64) -> i64
      %160 = func.call @cc_nil_value() : () -> i64
      %161 = func.call @cc_cons(%159, %160) : (i64, i64) -> i64
      %162 = func.call @cc_values_pack(%161) : (i64) -> i64
      %163 = func.call @cc_defclass(%159, %141, %154) : (i64, i64, i64) -> i64
      %164 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%164) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @stack_pop_pointer() : () -> i64
      %167 = func.call @cc_cons(%165, %166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%167) : (i64) -> ()
      %168 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%168) : (i64) -> ()
      %169 = llvm.mlir.addressof @str15 : !llvm.ptr
      %170 = arith.constant 14 : i64
      %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
      %172 = llvm.mlir.addressof @str16 : !llvm.ptr
      %173 = arith.constant 11 : i64
      %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
      %175 = func.call @cc_intern(%171, %174) : (i64, i64) -> i64
      %176 = func.call @cc_nil_value() : () -> i64
      %177 = func.call @cc_cons(%175, %176) : (i64, i64) -> i64
      %178 = func.call @cc_values_pack(%177) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %179 = arith.addi %175, %__rlasp_stack_elide_zero_10 : i64
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @cc_cons(%179, %180) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %182 = arith.addi %181, %__rlasp_stack_elide_zero_11 : i64
      %183 = func.call @stack_pop_pointer() : () -> i64
      %184 = func.call @cc_cons(%182, %183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%184) : (i64) -> ()
      %185 = llvm.mlir.addressof @str17 : !llvm.ptr
      %186 = arith.constant 15 : i64
      %187 = func.call @cc_make_string(%185, %186) : (!llvm.ptr, i64) -> i64
      %188 = func.call @cc_nil_value() : () -> i64
      %189 = func.call @cc_intern(%187, %188) : (i64, i64) -> i64
      %190 = func.call @cc_nil_value() : () -> i64
      %191 = func.call @cc_cons(%189, %190) : (i64, i64) -> i64
      %192 = func.call @cc_values_pack(%191) : (i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %193 = arith.addi %189, %__rlasp_stack_elide_zero_12 : i64
      %194 = func.call @stack_pop_pointer() : () -> i64
      %195 = func.call @cc_cons(%193, %194) : (i64, i64) -> i64
      func.call @stack_push_pointer(%195) : (i64) -> ()
      %196 = llvm.mlir.addressof @str18 : !llvm.ptr
      %197 = arith.constant 8 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = func.call @cc_nil_value() : () -> i64
      %200 = func.call @cc_intern(%198, %199) : (i64, i64) -> i64
      %201 = func.call @cc_nil_value() : () -> i64
      %202 = func.call @cc_cons(%200, %201) : (i64, i64) -> i64
      %203 = func.call @cc_values_pack(%202) : (i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %204 = arith.addi %200, %__rlasp_stack_elide_zero_13 : i64
      %205 = func.call @stack_pop_pointer() : () -> i64
      %206 = func.call @cc_cons(%204, %205) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %207 = arith.addi %206, %__rlasp_stack_elide_zero_14 : i64
      %208 = func.call @cc_nil_value() : () -> i64
      %209 = func.call @cc_cons(%207, %208) : (i64, i64) -> i64
      %210 = func.call @cc_eval(%209) : (i64) -> i64
      %211 = func.call @cc_multiple_value_list(%210) : (i64) -> i64
      %212 = func.call @cc_values_pack(%211) : (i64) -> i64
      func.call @stack_push_pointer(%212) : (i64) -> ()
      %213 = func.call @stack_depth() : () -> i64
      %214 = arith.constant 0 : i64
      %215 = arith.cmpi sgt, %213, %214 : i64
      scf.if %215 {
        %216 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %217 = arith.addi %159, %__rlasp_stack_elide_zero_15 : i64
      scf.yield %217 : i64
    }
    %218 = func.call @cc_nil_value() : () -> i64
    %219 = func.call @cc_errorp(%140) : (i64) -> i64
    %220 = arith.cmpi ne, %219, %218 : i64
    %221 = scf.if %220 -> (i64) {
      scf.yield %140 : i64
    } else {
      %225 = llvm.mlir.addressof @method_name_47863920852993 : !llvm.ptr
      %226 = func.call @cc_make_lambda_ref_str(%225) : (!llvm.ptr) -> i64
      %227 = llvm.mlir.addressof @str20 : !llvm.ptr
      %228 = arith.constant 19 : i64
      %229 = func.call @cc_make_string(%227, %228) : (!llvm.ptr, i64) -> i64
      %230 = llvm.mlir.addressof @str21 : !llvm.ptr
      %231 = arith.constant 4 : i64
      %232 = func.call @cc_make_string(%230, %231) : (!llvm.ptr, i64) -> i64
      %233 = func.call @cc_intern(%229, %232) : (i64, i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_cons(%233, %234) : (i64, i64) -> i64
      %236 = func.call @cc_values_pack(%235) : (i64) -> i64
      %237 = func.call @cc_nil() : () -> i64
      %238 = llvm.mlir.addressof @str22 : !llvm.ptr
      %239 = arith.constant 14 : i64
      %240 = func.call @cc_make_string(%238, %239) : (!llvm.ptr, i64) -> i64
      %241 = llvm.mlir.addressof @str23 : !llvm.ptr
      %242 = arith.constant 11 : i64
      %243 = func.call @cc_make_string(%241, %242) : (!llvm.ptr, i64) -> i64
      %244 = func.call @cc_intern(%240, %243) : (i64, i64) -> i64
      %245 = func.call @cc_nil_value() : () -> i64
      %246 = func.call @cc_cons(%244, %245) : (i64, i64) -> i64
      %247 = func.call @cc_values_pack(%246) : (i64) -> i64
      %248 = func.call @cc_cons(%244, %237) : (i64, i64) -> i64
      %249 = llvm.mlir.addressof @str24 : !llvm.ptr
      %250 = arith.constant 15 : i64
      %251 = func.call @cc_make_string(%249, %250) : (!llvm.ptr, i64) -> i64
      %252 = func.call @cc_nil_value() : () -> i64
      %253 = func.call @cc_intern(%251, %252) : (i64, i64) -> i64
      %254 = func.call @cc_nil_value() : () -> i64
      %255 = func.call @cc_cons(%253, %254) : (i64, i64) -> i64
      %256 = func.call @cc_values_pack(%255) : (i64) -> i64
      %257 = func.call @cc_cons(%253, %248) : (i64, i64) -> i64
      %258 = arith.constant 2 : i64
      %259 = func.call @cc_box_fixnum(%258) : (i64) -> i64
      %260 = arith.constant 0 : i64
      %261 = func.call @cc_defmethod_qualified(%233, %257, %226, %259, %260) : (i64, i64, i64, i64, i64) -> i64
      %262 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%262) : (i64) -> ()
      %263 = func.call @cc_t_value() : () -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %264 = arith.addi %263, %__rlasp_stack_elide_zero_16 : i64
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @cc_cons(%264, %265) : (i64, i64) -> i64
      func.call @stack_push_pointer(%266) : (i64) -> ()
      %267 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%267) : (i64) -> ()
      %268 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%268) : (i64) -> ()
      %269 = llvm.mlir.addressof @str25 : !llvm.ptr
      %270 = arith.constant 14 : i64
      %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
      %272 = llvm.mlir.addressof @str26 : !llvm.ptr
      %273 = arith.constant 11 : i64
      %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
      %275 = func.call @cc_intern(%271, %274) : (i64, i64) -> i64
      %276 = func.call @cc_nil_value() : () -> i64
      %277 = func.call @cc_cons(%275, %276) : (i64, i64) -> i64
      %278 = func.call @cc_values_pack(%277) : (i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %279 = arith.addi %275, %__rlasp_stack_elide_zero_17 : i64
      %280 = func.call @stack_pop_pointer() : () -> i64
      %281 = func.call @cc_cons(%279, %280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%281) : (i64) -> ()
      %282 = llvm.mlir.addressof @str27 : !llvm.ptr
      %283 = arith.constant 1 : i64
      %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
      %285 = func.call @cc_nil_value() : () -> i64
      %286 = func.call @cc_intern(%284, %285) : (i64, i64) -> i64
      %287 = func.call @cc_nil_value() : () -> i64
      %288 = func.call @cc_cons(%286, %287) : (i64, i64) -> i64
      %289 = func.call @cc_values_pack(%288) : (i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %290 = arith.addi %286, %__rlasp_stack_elide_zero_18 : i64
      %291 = func.call @stack_pop_pointer() : () -> i64
      %292 = func.call @cc_cons(%290, %291) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %293 = arith.addi %292, %__rlasp_stack_elide_zero_19 : i64
      %294 = func.call @stack_pop_pointer() : () -> i64
      %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
      func.call @stack_push_pointer(%295) : (i64) -> ()
      %296 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%296) : (i64) -> ()
      %297 = llvm.mlir.addressof @str28 : !llvm.ptr
      %298 = arith.constant 15 : i64
      %299 = func.call @cc_make_string(%297, %298) : (!llvm.ptr, i64) -> i64
      %300 = func.call @cc_nil_value() : () -> i64
      %301 = func.call @cc_intern(%299, %300) : (i64, i64) -> i64
      %302 = func.call @cc_nil_value() : () -> i64
      %303 = func.call @cc_cons(%301, %302) : (i64, i64) -> i64
      %304 = func.call @cc_values_pack(%303) : (i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %305 = arith.addi %301, %__rlasp_stack_elide_zero_20 : i64
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @cc_cons(%305, %306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%307) : (i64) -> ()
      %308 = llvm.mlir.addressof @str29 : !llvm.ptr
      %309 = arith.constant 1 : i64
      %310 = func.call @cc_make_string(%308, %309) : (!llvm.ptr, i64) -> i64
      %311 = func.call @cc_nil_value() : () -> i64
      %312 = func.call @cc_intern(%310, %311) : (i64, i64) -> i64
      %313 = func.call @cc_nil_value() : () -> i64
      %314 = func.call @cc_cons(%312, %313) : (i64, i64) -> i64
      %315 = func.call @cc_values_pack(%314) : (i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %316 = arith.addi %312, %__rlasp_stack_elide_zero_21 : i64
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = func.call @cc_cons(%316, %317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %319 = arith.addi %318, %__rlasp_stack_elide_zero_22 : i64
      %320 = func.call @stack_pop_pointer() : () -> i64
      %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %322 = arith.addi %321, %__rlasp_stack_elide_zero_23 : i64
      %323 = func.call @stack_pop_pointer() : () -> i64
      %324 = func.call @cc_cons(%322, %323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%324) : (i64) -> ()
      %325 = llvm.mlir.addressof @str30 : !llvm.ptr
      %326 = arith.constant 19 : i64
      %327 = func.call @cc_make_string(%325, %326) : (!llvm.ptr, i64) -> i64
      %328 = llvm.mlir.addressof @str31 : !llvm.ptr
      %329 = arith.constant 4 : i64
      %330 = func.call @cc_make_string(%328, %329) : (!llvm.ptr, i64) -> i64
      %331 = func.call @cc_intern(%327, %330) : (i64, i64) -> i64
      %332 = func.call @cc_nil_value() : () -> i64
      %333 = func.call @cc_cons(%331, %332) : (i64, i64) -> i64
      %334 = func.call @cc_values_pack(%333) : (i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %335 = arith.addi %331, %__rlasp_stack_elide_zero_24 : i64
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = func.call @cc_cons(%335, %336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%337) : (i64) -> ()
      %338 = llvm.mlir.addressof @str32 : !llvm.ptr
      %339 = arith.constant 9 : i64
      %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
      %341 = func.call @cc_nil_value() : () -> i64
      %342 = func.call @cc_intern(%340, %341) : (i64, i64) -> i64
      %343 = func.call @cc_nil_value() : () -> i64
      %344 = func.call @cc_cons(%342, %343) : (i64, i64) -> i64
      %345 = func.call @cc_values_pack(%344) : (i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %346 = arith.addi %342, %__rlasp_stack_elide_zero_25 : i64
      %347 = func.call @stack_pop_pointer() : () -> i64
      %348 = func.call @cc_cons(%346, %347) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %349 = arith.addi %348, %__rlasp_stack_elide_zero_26 : i64
      %350 = func.call @cc_nil_value() : () -> i64
      %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
      %352 = func.call @cc_eval(%351) : (i64) -> i64
      %353 = func.call @cc_multiple_value_list(%352) : (i64) -> i64
      %354 = func.call @cc_values_pack(%353) : (i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %355 = arith.addi %354, %__rlasp_stack_elide_zero_27 : i64
      scf.yield %355 : i64
    }
    %356 = func.call @cc_nil_value() : () -> i64
    %357 = func.call @cc_errorp(%221) : (i64) -> i64
    %358 = arith.cmpi ne, %357, %356 : i64
    %359 = scf.if %358 -> (i64) {
      scf.yield %221 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %360 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %361 = llvm.mlir.addressof @str33 : !llvm.ptr
      %362 = arith.constant 15 : i64
      %363 = func.call @cc_make_string(%361, %362) : (!llvm.ptr, i64) -> i64
      %364 = llvm.mlir.addressof @str34 : !llvm.ptr
      %365 = arith.constant 11 : i64
      %366 = func.call @cc_make_string(%364, %365) : (!llvm.ptr, i64) -> i64
      %367 = func.call @cc_intern(%363, %366) : (i64, i64) -> i64
      %368 = func.call @cc_nil_value() : () -> i64
      %369 = func.call @cc_cons(%367, %368) : (i64, i64) -> i64
      %370 = func.call @cc_values_pack(%369) : (i64) -> i64
      %371 = func.call @stack_pop_pointer() : () -> i64
      %372 = func.call @cc_cons(%367, %371) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %373 = arith.addi %372, %__rlasp_stack_elide_zero_28 : i64
      %374 = llvm.mlir.addressof @str35 : !llvm.ptr
      %375 = arith.constant 16 : i64
      %376 = func.call @cc_make_string(%374, %375) : (!llvm.ptr, i64) -> i64
      %377 = func.call @cc_nil_value() : () -> i64
      %378 = func.call @cc_intern(%376, %377) : (i64, i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_cons(%378, %379) : (i64, i64) -> i64
      %381 = func.call @cc_values_pack(%380) : (i64) -> i64
      %382 = func.call @cc_defclass(%378, %360, %373) : (i64, i64, i64) -> i64
      %383 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%383) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %384 = func.call @stack_pop_pointer() : () -> i64
      %385 = func.call @stack_pop_pointer() : () -> i64
      %386 = func.call @cc_cons(%384, %385) : (i64, i64) -> i64
      func.call @stack_push_pointer(%386) : (i64) -> ()
      %387 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%387) : (i64) -> ()
      %388 = llvm.mlir.addressof @str36 : !llvm.ptr
      %389 = arith.constant 15 : i64
      %390 = func.call @cc_make_string(%388, %389) : (!llvm.ptr, i64) -> i64
      %391 = llvm.mlir.addressof @str37 : !llvm.ptr
      %392 = arith.constant 11 : i64
      %393 = func.call @cc_make_string(%391, %392) : (!llvm.ptr, i64) -> i64
      %394 = func.call @cc_intern(%390, %393) : (i64, i64) -> i64
      %395 = func.call @cc_nil_value() : () -> i64
      %396 = func.call @cc_cons(%394, %395) : (i64, i64) -> i64
      %397 = func.call @cc_values_pack(%396) : (i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %398 = arith.addi %394, %__rlasp_stack_elide_zero_29 : i64
      %399 = func.call @stack_pop_pointer() : () -> i64
      %400 = func.call @cc_cons(%398, %399) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %401 = arith.addi %400, %__rlasp_stack_elide_zero_30 : i64
      %402 = func.call @stack_pop_pointer() : () -> i64
      %403 = func.call @cc_cons(%401, %402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%403) : (i64) -> ()
      %404 = llvm.mlir.addressof @str38 : !llvm.ptr
      %405 = arith.constant 16 : i64
      %406 = func.call @cc_make_string(%404, %405) : (!llvm.ptr, i64) -> i64
      %407 = func.call @cc_nil_value() : () -> i64
      %408 = func.call @cc_intern(%406, %407) : (i64, i64) -> i64
      %409 = func.call @cc_nil_value() : () -> i64
      %410 = func.call @cc_cons(%408, %409) : (i64, i64) -> i64
      %411 = func.call @cc_values_pack(%410) : (i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %412 = arith.addi %408, %__rlasp_stack_elide_zero_31 : i64
      %413 = func.call @stack_pop_pointer() : () -> i64
      %414 = func.call @cc_cons(%412, %413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%414) : (i64) -> ()
      %415 = llvm.mlir.addressof @str39 : !llvm.ptr
      %416 = arith.constant 8 : i64
      %417 = func.call @cc_make_string(%415, %416) : (!llvm.ptr, i64) -> i64
      %418 = func.call @cc_nil_value() : () -> i64
      %419 = func.call @cc_intern(%417, %418) : (i64, i64) -> i64
      %420 = func.call @cc_nil_value() : () -> i64
      %421 = func.call @cc_cons(%419, %420) : (i64, i64) -> i64
      %422 = func.call @cc_values_pack(%421) : (i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %423 = arith.addi %419, %__rlasp_stack_elide_zero_32 : i64
      %424 = func.call @stack_pop_pointer() : () -> i64
      %425 = func.call @cc_cons(%423, %424) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %426 = arith.addi %425, %__rlasp_stack_elide_zero_33 : i64
      %427 = func.call @cc_nil_value() : () -> i64
      %428 = func.call @cc_cons(%426, %427) : (i64, i64) -> i64
      %429 = func.call @cc_eval(%428) : (i64) -> i64
      %430 = func.call @cc_multiple_value_list(%429) : (i64) -> i64
      %431 = func.call @cc_values_pack(%430) : (i64) -> i64
      func.call @stack_push_pointer(%431) : (i64) -> ()
      %432 = func.call @stack_depth() : () -> i64
      %433 = arith.constant 0 : i64
      %434 = arith.cmpi sgt, %432, %433 : i64
      scf.if %434 {
        %435 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %436 = arith.addi %378, %__rlasp_stack_elide_zero_34 : i64
      scf.yield %436 : i64
    }
    %437 = func.call @cc_nil_value() : () -> i64
    %438 = func.call @cc_errorp(%359) : (i64) -> i64
    %439 = arith.cmpi ne, %438, %437 : i64
    %440 = scf.if %439 -> (i64) {
      scf.yield %359 : i64
    } else {
      %526 = llvm.mlir.addressof @method_name_47863920852994 : !llvm.ptr
      %527 = func.call @cc_make_lambda_ref_str(%526) : (!llvm.ptr) -> i64
      %528 = llvm.mlir.addressof @str49 : !llvm.ptr
      %529 = arith.constant 17 : i64
      %530 = func.call @cc_make_string(%528, %529) : (!llvm.ptr, i64) -> i64
      %531 = llvm.mlir.addressof @str50 : !llvm.ptr
      %532 = arith.constant 11 : i64
      %533 = func.call @cc_make_string(%531, %532) : (!llvm.ptr, i64) -> i64
      %534 = func.call @cc_intern(%530, %533) : (i64, i64) -> i64
      %535 = func.call @cc_nil_value() : () -> i64
      %536 = func.call @cc_cons(%534, %535) : (i64, i64) -> i64
      %537 = func.call @cc_values_pack(%536) : (i64) -> i64
      %538 = func.call @cc_nil() : () -> i64
      %539 = llvm.mlir.addressof @str51 : !llvm.ptr
      %540 = arith.constant 1 : i64
      %541 = func.call @cc_make_string(%539, %540) : (!llvm.ptr, i64) -> i64
      %542 = func.call @cc_nil_value() : () -> i64
      %543 = func.call @cc_intern(%541, %542) : (i64, i64) -> i64
      %544 = func.call @cc_nil_value() : () -> i64
      %545 = func.call @cc_cons(%543, %544) : (i64, i64) -> i64
      %546 = func.call @cc_values_pack(%545) : (i64) -> i64
      %547 = func.call @cc_cons(%543, %538) : (i64, i64) -> i64
      %548 = llvm.mlir.addressof @str52 : !llvm.ptr
      %549 = arith.constant 1 : i64
      %550 = func.call @cc_make_string(%548, %549) : (!llvm.ptr, i64) -> i64
      %551 = func.call @cc_nil_value() : () -> i64
      %552 = func.call @cc_intern(%550, %551) : (i64, i64) -> i64
      %553 = func.call @cc_nil_value() : () -> i64
      %554 = func.call @cc_cons(%552, %553) : (i64, i64) -> i64
      %555 = func.call @cc_values_pack(%554) : (i64) -> i64
      %556 = func.call @cc_cons(%552, %547) : (i64, i64) -> i64
      %557 = llvm.mlir.addressof @str53 : !llvm.ptr
      %558 = arith.constant 1 : i64
      %559 = func.call @cc_make_string(%557, %558) : (!llvm.ptr, i64) -> i64
      %560 = func.call @cc_nil_value() : () -> i64
      %561 = func.call @cc_intern(%559, %560) : (i64, i64) -> i64
      %562 = func.call @cc_nil_value() : () -> i64
      %563 = func.call @cc_cons(%561, %562) : (i64, i64) -> i64
      %564 = func.call @cc_values_pack(%563) : (i64) -> i64
      %565 = func.call @cc_cons(%561, %556) : (i64, i64) -> i64
      %566 = llvm.mlir.addressof @str54 : !llvm.ptr
      %567 = arith.constant 1 : i64
      %568 = func.call @cc_make_string(%566, %567) : (!llvm.ptr, i64) -> i64
      %569 = func.call @cc_nil_value() : () -> i64
      %570 = func.call @cc_intern(%568, %569) : (i64, i64) -> i64
      %571 = func.call @cc_nil_value() : () -> i64
      %572 = func.call @cc_cons(%570, %571) : (i64, i64) -> i64
      %573 = func.call @cc_values_pack(%572) : (i64) -> i64
      %574 = func.call @cc_cons(%570, %565) : (i64, i64) -> i64
      %575 = llvm.mlir.addressof @str55 : !llvm.ptr
      %576 = arith.constant 1 : i64
      %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
      %578 = func.call @cc_nil_value() : () -> i64
      %579 = func.call @cc_intern(%577, %578) : (i64, i64) -> i64
      %580 = func.call @cc_nil_value() : () -> i64
      %581 = func.call @cc_cons(%579, %580) : (i64, i64) -> i64
      %582 = func.call @cc_values_pack(%581) : (i64) -> i64
      %583 = func.call @cc_cons(%579, %574) : (i64, i64) -> i64
      %584 = llvm.mlir.addressof @str56 : !llvm.ptr
      %585 = arith.constant 15 : i64
      %586 = func.call @cc_make_string(%584, %585) : (!llvm.ptr, i64) -> i64
      %587 = func.call @cc_nil_value() : () -> i64
      %588 = func.call @cc_intern(%586, %587) : (i64, i64) -> i64
      %589 = func.call @cc_nil_value() : () -> i64
      %590 = func.call @cc_cons(%588, %589) : (i64, i64) -> i64
      %591 = func.call @cc_values_pack(%590) : (i64) -> i64
      %592 = func.call @cc_cons(%588, %583) : (i64, i64) -> i64
      %593 = arith.constant 6 : i64
      %594 = func.call @cc_box_fixnum(%593) : (i64) -> i64
      %595 = arith.constant 3 : i64
      %596 = func.call @cc_defmethod_qualified(%534, %592, %527, %594, %595) : (i64, i64, i64, i64, i64) -> i64
      %597 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%597) : (i64) -> ()
      %598 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%598) : (i64) -> ()
      %599 = llvm.mlir.addressof @str57 : !llvm.ptr
      %600 = arith.constant 4 : i64
      %601 = func.call @cc_make_string(%599, %600) : (!llvm.ptr, i64) -> i64
      %602 = llvm.mlir.addressof @str58 : !llvm.ptr
      %603 = arith.constant 11 : i64
      %604 = func.call @cc_make_string(%602, %603) : (!llvm.ptr, i64) -> i64
      %605 = func.call @cc_intern(%601, %604) : (i64, i64) -> i64
      %606 = func.call @cc_nil_value() : () -> i64
      %607 = func.call @cc_cons(%605, %606) : (i64, i64) -> i64
      %608 = func.call @cc_values_pack(%607) : (i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %609 = arith.addi %605, %__rlasp_stack_elide_zero_35 : i64
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @cc_cons(%609, %610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%611) : (i64) -> ()
      %612 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      %613 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%613) : (i64) -> ()
      %614 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%614) : (i64) -> ()
      %615 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %616 = llvm.mlir.addressof @str59 : !llvm.ptr
      %617 = arith.constant 16 : i64
      %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
      %619 = func.call @cc_nil_value() : () -> i64
      %620 = func.call @cc_intern(%618, %619) : (i64, i64) -> i64
      %621 = func.call @cc_nil_value() : () -> i64
      %622 = func.call @cc_cons(%620, %621) : (i64, i64) -> i64
      %623 = func.call @cc_values_pack(%622) : (i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %624 = arith.addi %620, %__rlasp_stack_elide_zero_36 : i64
      %625 = func.call @stack_pop_pointer() : () -> i64
      %626 = func.call @cc_cons(%624, %625) : (i64, i64) -> i64
      %627 = llvm.mlir.addressof @str60 : !llvm.ptr
      %628 = arith.constant 5 : i64
      %629 = func.call @cc_make_string(%627, %628) : (!llvm.ptr, i64) -> i64
      %630 = func.call @cc_nil_value() : () -> i64
      %631 = func.call @cc_intern(%629, %630) : (i64, i64) -> i64
      %632 = func.call @cc_nil_value() : () -> i64
      %633 = func.call @cc_cons(%631, %632) : (i64, i64) -> i64
      %634 = func.call @cc_values_pack(%633) : (i64) -> i64
      %635 = func.call @cc_cons(%631, %626) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %636 = arith.addi %635, %__rlasp_stack_elide_zero_37 : i64
      %637 = func.call @stack_pop_pointer() : () -> i64
      %638 = func.call @cc_cons(%636, %637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%638) : (i64) -> ()
      %639 = llvm.mlir.addressof @str61 : !llvm.ptr
      %640 = arith.constant 10 : i64
      %641 = func.call @cc_make_string(%639, %640) : (!llvm.ptr, i64) -> i64
      %642 = llvm.mlir.addressof @str62 : !llvm.ptr
      %643 = arith.constant 11 : i64
      %644 = func.call @cc_make_string(%642, %643) : (!llvm.ptr, i64) -> i64
      %645 = func.call @cc_intern(%641, %644) : (i64, i64) -> i64
      %646 = func.call @cc_nil_value() : () -> i64
      %647 = func.call @cc_cons(%645, %646) : (i64, i64) -> i64
      %648 = func.call @cc_values_pack(%647) : (i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %649 = arith.addi %645, %__rlasp_stack_elide_zero_38 : i64
      %650 = func.call @stack_pop_pointer() : () -> i64
      %651 = func.call @cc_cons(%649, %650) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %652 = arith.addi %651, %__rlasp_stack_elide_zero_39 : i64
      %653 = func.call @stack_pop_pointer() : () -> i64
      %654 = func.call @cc_cons(%652, %653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%654) : (i64) -> ()
      %655 = llvm.mlir.addressof @str63 : !llvm.ptr
      %656 = arith.constant 4 : i64
      %657 = func.call @cc_make_string(%655, %656) : (!llvm.ptr, i64) -> i64
      %658 = llvm.mlir.addressof @str64 : !llvm.ptr
      %659 = arith.constant 11 : i64
      %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
      %661 = func.call @cc_intern(%657, %660) : (i64, i64) -> i64
      %662 = func.call @cc_nil_value() : () -> i64
      %663 = func.call @cc_cons(%661, %662) : (i64, i64) -> i64
      %664 = func.call @cc_values_pack(%663) : (i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %665 = arith.addi %661, %__rlasp_stack_elide_zero_40 : i64
      %666 = func.call @stack_pop_pointer() : () -> i64
      %667 = func.call @cc_cons(%665, %666) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %668 = arith.addi %667, %__rlasp_stack_elide_zero_41 : i64
      %669 = func.call @stack_pop_pointer() : () -> i64
      %670 = func.call @cc_cons(%668, %669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%670) : (i64) -> ()
      %671 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      %672 = llvm.mlir.addressof @str65 : !llvm.ptr
      %673 = arith.constant 19 : i64
      %674 = func.call @cc_make_string(%672, %673) : (!llvm.ptr, i64) -> i64
      %675 = func.call @cc_nil_value() : () -> i64
      %676 = func.call @cc_intern(%674, %675) : (i64, i64) -> i64
      %677 = func.call @cc_nil_value() : () -> i64
      %678 = func.call @cc_cons(%676, %677) : (i64, i64) -> i64
      %679 = func.call @cc_values_pack(%678) : (i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %680 = arith.addi %676, %__rlasp_stack_elide_zero_42 : i64
      %681 = func.call @stack_pop_pointer() : () -> i64
      %682 = func.call @cc_cons(%680, %681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%682) : (i64) -> ()
      %683 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%683) : (i64) -> ()
      %684 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%684) : (i64) -> ()
      %685 = llvm.mlir.addressof @str66 : !llvm.ptr
      %686 = arith.constant 15 : i64
      %687 = func.call @cc_make_string(%685, %686) : (!llvm.ptr, i64) -> i64
      %688 = llvm.mlir.addressof @str67 : !llvm.ptr
      %689 = arith.constant 11 : i64
      %690 = func.call @cc_make_string(%688, %689) : (!llvm.ptr, i64) -> i64
      %691 = func.call @cc_intern(%687, %690) : (i64, i64) -> i64
      %692 = func.call @cc_nil_value() : () -> i64
      %693 = func.call @cc_cons(%691, %692) : (i64, i64) -> i64
      %694 = func.call @cc_values_pack(%693) : (i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %695 = arith.addi %691, %__rlasp_stack_elide_zero_43 : i64
      %696 = func.call @stack_pop_pointer() : () -> i64
      %697 = func.call @cc_cons(%695, %696) : (i64, i64) -> i64
      %698 = llvm.mlir.addressof @str68 : !llvm.ptr
      %699 = arith.constant 5 : i64
      %700 = func.call @cc_make_string(%698, %699) : (!llvm.ptr, i64) -> i64
      %701 = func.call @cc_nil_value() : () -> i64
      %702 = func.call @cc_intern(%700, %701) : (i64, i64) -> i64
      %703 = func.call @cc_nil_value() : () -> i64
      %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
      %705 = func.call @cc_values_pack(%704) : (i64) -> i64
      %706 = func.call @cc_cons(%702, %697) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %707 = arith.addi %706, %__rlasp_stack_elide_zero_44 : i64
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @cc_cons(%707, %708) : (i64, i64) -> i64
      func.call @stack_push_pointer(%709) : (i64) -> ()
      %710 = llvm.mlir.addressof @str69 : !llvm.ptr
      %711 = arith.constant 10 : i64
      %712 = func.call @cc_make_string(%710, %711) : (!llvm.ptr, i64) -> i64
      %713 = llvm.mlir.addressof @str70 : !llvm.ptr
      %714 = arith.constant 11 : i64
      %715 = func.call @cc_make_string(%713, %714) : (!llvm.ptr, i64) -> i64
      %716 = func.call @cc_intern(%712, %715) : (i64, i64) -> i64
      %717 = func.call @cc_nil_value() : () -> i64
      %718 = func.call @cc_cons(%716, %717) : (i64, i64) -> i64
      %719 = func.call @cc_values_pack(%718) : (i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %720 = arith.addi %716, %__rlasp_stack_elide_zero_45 : i64
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @cc_cons(%720, %721) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %723 = arith.addi %722, %__rlasp_stack_elide_zero_46 : i64
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @cc_cons(%723, %724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%725) : (i64) -> ()
      %726 = llvm.mlir.addressof @str71 : !llvm.ptr
      %727 = arith.constant 6 : i64
      %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
      %729 = llvm.mlir.addressof @str72 : !llvm.ptr
      %730 = arith.constant 11 : i64
      %731 = func.call @cc_make_string(%729, %730) : (!llvm.ptr, i64) -> i64
      %732 = func.call @cc_intern(%728, %731) : (i64, i64) -> i64
      %733 = func.call @cc_nil_value() : () -> i64
      %734 = func.call @cc_cons(%732, %733) : (i64, i64) -> i64
      %735 = func.call @cc_values_pack(%734) : (i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %736 = arith.addi %732, %__rlasp_stack_elide_zero_47 : i64
      %737 = func.call @stack_pop_pointer() : () -> i64
      %738 = func.call @cc_cons(%736, %737) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %739 = arith.addi %738, %__rlasp_stack_elide_zero_48 : i64
      %740 = func.call @stack_pop_pointer() : () -> i64
      %741 = func.call @cc_cons(%739, %740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%741) : (i64) -> ()
      %742 = llvm.mlir.addressof @str73 : !llvm.ptr
      %743 = arith.constant 6 : i64
      %744 = func.call @cc_make_string(%742, %743) : (!llvm.ptr, i64) -> i64
      %745 = llvm.mlir.addressof @str74 : !llvm.ptr
      %746 = arith.constant 11 : i64
      %747 = func.call @cc_make_string(%745, %746) : (!llvm.ptr, i64) -> i64
      %748 = func.call @cc_intern(%744, %747) : (i64, i64) -> i64
      %749 = func.call @cc_nil_value() : () -> i64
      %750 = func.call @cc_cons(%748, %749) : (i64, i64) -> i64
      %751 = func.call @cc_values_pack(%750) : (i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %752 = arith.addi %748, %__rlasp_stack_elide_zero_49 : i64
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @cc_cons(%752, %753) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %755 = arith.addi %754, %__rlasp_stack_elide_zero_50 : i64
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @cc_cons(%755, %756) : (i64, i64) -> i64
      func.call @stack_push_pointer(%757) : (i64) -> ()
      %758 = llvm.mlir.addressof @str75 : !llvm.ptr
      %759 = arith.constant 19 : i64
      %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
      %761 = llvm.mlir.addressof @str76 : !llvm.ptr
      %762 = arith.constant 7 : i64
      %763 = func.call @cc_make_string(%761, %762) : (!llvm.ptr, i64) -> i64
      %764 = func.call @cc_intern(%760, %763) : (i64, i64) -> i64
      %765 = func.call @cc_nil_value() : () -> i64
      %766 = func.call @cc_cons(%764, %765) : (i64, i64) -> i64
      %767 = func.call @cc_values_pack(%766) : (i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %768 = arith.addi %764, %__rlasp_stack_elide_zero_51 : i64
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @cc_cons(%768, %769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%770) : (i64) -> ()
      %771 = llvm.mlir.addressof @str77 : !llvm.ptr
      %772 = arith.constant 10 : i64
      %773 = func.call @cc_make_string(%771, %772) : (!llvm.ptr, i64) -> i64
      %774 = func.call @cc_nil_value() : () -> i64
      %775 = func.call @cc_intern(%773, %774) : (i64, i64) -> i64
      %776 = func.call @cc_nil_value() : () -> i64
      %777 = func.call @cc_cons(%775, %776) : (i64, i64) -> i64
      %778 = func.call @cc_values_pack(%777) : (i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %779 = arith.addi %775, %__rlasp_stack_elide_zero_52 : i64
      %780 = func.call @stack_pop_pointer() : () -> i64
      %781 = func.call @cc_cons(%779, %780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%781) : (i64) -> ()
      %782 = llvm.mlir.addressof @str78 : !llvm.ptr
      %783 = arith.constant 5 : i64
      %784 = func.call @cc_make_string(%782, %783) : (!llvm.ptr, i64) -> i64
      %785 = llvm.mlir.addressof @str79 : !llvm.ptr
      %786 = arith.constant 11 : i64
      %787 = func.call @cc_make_string(%785, %786) : (!llvm.ptr, i64) -> i64
      %788 = func.call @cc_intern(%784, %787) : (i64, i64) -> i64
      %789 = func.call @cc_nil_value() : () -> i64
      %790 = func.call @cc_cons(%788, %789) : (i64, i64) -> i64
      %791 = func.call @cc_values_pack(%790) : (i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %792 = arith.addi %788, %__rlasp_stack_elide_zero_53 : i64
      %793 = func.call @stack_pop_pointer() : () -> i64
      %794 = func.call @cc_cons(%792, %793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%794) : (i64) -> ()
      %795 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%795) : (i64) -> ()
      %796 = llvm.mlir.addressof @str80 : !llvm.ptr
      %797 = arith.constant 16 : i64
      %798 = func.call @cc_make_string(%796, %797) : (!llvm.ptr, i64) -> i64
      %799 = llvm.mlir.addressof @str81 : !llvm.ptr
      %800 = arith.constant 11 : i64
      %801 = func.call @cc_make_string(%799, %800) : (!llvm.ptr, i64) -> i64
      %802 = func.call @cc_intern(%798, %801) : (i64, i64) -> i64
      %803 = func.call @cc_nil_value() : () -> i64
      %804 = func.call @cc_cons(%802, %803) : (i64, i64) -> i64
      %805 = func.call @cc_values_pack(%804) : (i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %806 = arith.addi %802, %__rlasp_stack_elide_zero_54 : i64
      %807 = func.call @stack_pop_pointer() : () -> i64
      %808 = func.call @cc_cons(%806, %807) : (i64, i64) -> i64
      func.call @stack_push_pointer(%808) : (i64) -> ()
      %809 = llvm.mlir.addressof @str82 : !llvm.ptr
      %810 = arith.constant 8 : i64
      %811 = func.call @cc_make_string(%809, %810) : (!llvm.ptr, i64) -> i64
      %812 = func.call @cc_nil_value() : () -> i64
      %813 = func.call @cc_intern(%811, %812) : (i64, i64) -> i64
      %814 = func.call @cc_nil_value() : () -> i64
      %815 = func.call @cc_cons(%813, %814) : (i64, i64) -> i64
      %816 = func.call @cc_values_pack(%815) : (i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %817 = arith.addi %813, %__rlasp_stack_elide_zero_55 : i64
      %818 = func.call @stack_pop_pointer() : () -> i64
      %819 = func.call @cc_cons(%817, %818) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %820 = arith.addi %819, %__rlasp_stack_elide_zero_56 : i64
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @cc_cons(%820, %821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%822) : (i64) -> ()
      %823 = llvm.mlir.addressof @str83 : !llvm.ptr
      %824 = arith.constant 5 : i64
      %825 = func.call @cc_make_string(%823, %824) : (!llvm.ptr, i64) -> i64
      %826 = llvm.mlir.addressof @str84 : !llvm.ptr
      %827 = arith.constant 11 : i64
      %828 = func.call @cc_make_string(%826, %827) : (!llvm.ptr, i64) -> i64
      %829 = func.call @cc_intern(%825, %828) : (i64, i64) -> i64
      %830 = func.call @cc_nil_value() : () -> i64
      %831 = func.call @cc_cons(%829, %830) : (i64, i64) -> i64
      %832 = func.call @cc_values_pack(%831) : (i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %833 = arith.addi %829, %__rlasp_stack_elide_zero_57 : i64
      %834 = func.call @stack_pop_pointer() : () -> i64
      %835 = func.call @cc_cons(%833, %834) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %836 = arith.addi %835, %__rlasp_stack_elide_zero_58 : i64
      %837 = func.call @stack_pop_pointer() : () -> i64
      %838 = func.call @cc_cons(%836, %837) : (i64, i64) -> i64
      func.call @stack_push_pointer(%838) : (i64) -> ()
      %839 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%839) : (i64) -> ()
      %840 = llvm.mlir.addressof @str85 : !llvm.ptr
      %841 = arith.constant 19 : i64
      %842 = func.call @cc_make_string(%840, %841) : (!llvm.ptr, i64) -> i64
      %843 = func.call @cc_nil_value() : () -> i64
      %844 = func.call @cc_intern(%842, %843) : (i64, i64) -> i64
      %845 = func.call @cc_nil_value() : () -> i64
      %846 = func.call @cc_cons(%844, %845) : (i64, i64) -> i64
      %847 = func.call @cc_values_pack(%846) : (i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %848 = arith.addi %844, %__rlasp_stack_elide_zero_59 : i64
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @cc_cons(%848, %849) : (i64, i64) -> i64
      func.call @stack_push_pointer(%850) : (i64) -> ()
      %851 = llvm.mlir.addressof @str86 : !llvm.ptr
      %852 = arith.constant 4 : i64
      %853 = func.call @cc_make_string(%851, %852) : (!llvm.ptr, i64) -> i64
      %854 = llvm.mlir.addressof @str87 : !llvm.ptr
      %855 = arith.constant 11 : i64
      %856 = func.call @cc_make_string(%854, %855) : (!llvm.ptr, i64) -> i64
      %857 = func.call @cc_intern(%853, %856) : (i64, i64) -> i64
      %858 = func.call @cc_nil_value() : () -> i64
      %859 = func.call @cc_cons(%857, %858) : (i64, i64) -> i64
      %860 = func.call @cc_values_pack(%859) : (i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %861 = arith.addi %857, %__rlasp_stack_elide_zero_60 : i64
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @cc_cons(%861, %862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%863) : (i64) -> ()
      %864 = llvm.mlir.addressof @str88 : !llvm.ptr
      %865 = arith.constant 4 : i64
      %866 = func.call @cc_make_string(%864, %865) : (!llvm.ptr, i64) -> i64
      %867 = llvm.mlir.addressof @str89 : !llvm.ptr
      %868 = arith.constant 11 : i64
      %869 = func.call @cc_make_string(%867, %868) : (!llvm.ptr, i64) -> i64
      %870 = func.call @cc_intern(%866, %869) : (i64, i64) -> i64
      %871 = func.call @cc_nil_value() : () -> i64
      %872 = func.call @cc_cons(%870, %871) : (i64, i64) -> i64
      %873 = func.call @cc_values_pack(%872) : (i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %874 = arith.addi %870, %__rlasp_stack_elide_zero_61 : i64
      %875 = func.call @stack_pop_pointer() : () -> i64
      %876 = func.call @cc_cons(%874, %875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%876) : (i64) -> ()
      %877 = llvm.mlir.addressof @str90 : !llvm.ptr
      %878 = arith.constant 5 : i64
      %879 = func.call @cc_make_string(%877, %878) : (!llvm.ptr, i64) -> i64
      %880 = llvm.mlir.addressof @str91 : !llvm.ptr
      %881 = arith.constant 11 : i64
      %882 = func.call @cc_make_string(%880, %881) : (!llvm.ptr, i64) -> i64
      %883 = func.call @cc_intern(%879, %882) : (i64, i64) -> i64
      %884 = func.call @cc_nil_value() : () -> i64
      %885 = func.call @cc_cons(%883, %884) : (i64, i64) -> i64
      %886 = func.call @cc_values_pack(%885) : (i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %887 = arith.addi %883, %__rlasp_stack_elide_zero_62 : i64
      %888 = func.call @stack_pop_pointer() : () -> i64
      %889 = func.call @cc_cons(%887, %888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%889) : (i64) -> ()
      %890 = llvm.mlir.addressof @str92 : !llvm.ptr
      %891 = arith.constant 10 : i64
      %892 = func.call @cc_make_string(%890, %891) : (!llvm.ptr, i64) -> i64
      %893 = func.call @cc_nil_value() : () -> i64
      %894 = func.call @cc_intern(%892, %893) : (i64, i64) -> i64
      %895 = func.call @cc_nil_value() : () -> i64
      %896 = func.call @cc_cons(%894, %895) : (i64, i64) -> i64
      %897 = func.call @cc_values_pack(%896) : (i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %898 = arith.addi %894, %__rlasp_stack_elide_zero_63 : i64
      %899 = func.call @stack_pop_pointer() : () -> i64
      %900 = func.call @cc_cons(%898, %899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%900) : (i64) -> ()
      %901 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%901) : (i64) -> ()
      %902 = llvm.mlir.addressof @str93 : !llvm.ptr
      %903 = arith.constant 15 : i64
      %904 = func.call @cc_make_string(%902, %903) : (!llvm.ptr, i64) -> i64
      %905 = func.call @cc_nil_value() : () -> i64
      %906 = func.call @cc_intern(%904, %905) : (i64, i64) -> i64
      %907 = func.call @cc_nil_value() : () -> i64
      %908 = func.call @cc_cons(%906, %907) : (i64, i64) -> i64
      %909 = func.call @cc_values_pack(%908) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %910 = arith.addi %906, %__rlasp_stack_elide_zero_64 : i64
      %911 = func.call @stack_pop_pointer() : () -> i64
      %912 = func.call @cc_cons(%910, %911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%912) : (i64) -> ()
      %913 = llvm.mlir.addressof @str94 : !llvm.ptr
      %914 = arith.constant 5 : i64
      %915 = func.call @cc_make_string(%913, %914) : (!llvm.ptr, i64) -> i64
      %916 = llvm.mlir.addressof @str95 : !llvm.ptr
      %917 = arith.constant 11 : i64
      %918 = func.call @cc_make_string(%916, %917) : (!llvm.ptr, i64) -> i64
      %919 = func.call @cc_intern(%915, %918) : (i64, i64) -> i64
      %920 = func.call @cc_nil_value() : () -> i64
      %921 = func.call @cc_cons(%919, %920) : (i64, i64) -> i64
      %922 = func.call @cc_values_pack(%921) : (i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %923 = arith.addi %919, %__rlasp_stack_elide_zero_65 : i64
      %924 = func.call @stack_pop_pointer() : () -> i64
      %925 = func.call @cc_cons(%923, %924) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %926 = arith.addi %925, %__rlasp_stack_elide_zero_66 : i64
      %927 = func.call @stack_pop_pointer() : () -> i64
      %928 = func.call @cc_cons(%926, %927) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %929 = arith.addi %928, %__rlasp_stack_elide_zero_67 : i64
      %930 = func.call @stack_pop_pointer() : () -> i64
      %931 = func.call @cc_cons(%929, %930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%931) : (i64) -> ()
      %932 = llvm.mlir.addressof @str96 : !llvm.ptr
      %933 = arith.constant 6 : i64
      %934 = func.call @cc_make_string(%932, %933) : (!llvm.ptr, i64) -> i64
      %935 = llvm.mlir.addressof @str97 : !llvm.ptr
      %936 = arith.constant 7 : i64
      %937 = func.call @cc_make_string(%935, %936) : (!llvm.ptr, i64) -> i64
      %938 = func.call @cc_intern(%934, %937) : (i64, i64) -> i64
      %939 = func.call @cc_nil_value() : () -> i64
      %940 = func.call @cc_cons(%938, %939) : (i64, i64) -> i64
      %941 = func.call @cc_values_pack(%940) : (i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %942 = arith.addi %938, %__rlasp_stack_elide_zero_68 : i64
      %943 = func.call @stack_pop_pointer() : () -> i64
      %944 = func.call @cc_cons(%942, %943) : (i64, i64) -> i64
      func.call @stack_push_pointer(%944) : (i64) -> ()
      %945 = llvm.mlir.addressof @str98 : !llvm.ptr
      %946 = arith.constant 17 : i64
      %947 = func.call @cc_make_string(%945, %946) : (!llvm.ptr, i64) -> i64
      %948 = llvm.mlir.addressof @str99 : !llvm.ptr
      %949 = arith.constant 11 : i64
      %950 = func.call @cc_make_string(%948, %949) : (!llvm.ptr, i64) -> i64
      %951 = func.call @cc_intern(%947, %950) : (i64, i64) -> i64
      %952 = func.call @cc_nil_value() : () -> i64
      %953 = func.call @cc_cons(%951, %952) : (i64, i64) -> i64
      %954 = func.call @cc_values_pack(%953) : (i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %955 = arith.addi %951, %__rlasp_stack_elide_zero_69 : i64
      %956 = func.call @stack_pop_pointer() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%957) : (i64) -> ()
      %958 = llvm.mlir.addressof @str100 : !llvm.ptr
      %959 = arith.constant 9 : i64
      %960 = func.call @cc_make_string(%958, %959) : (!llvm.ptr, i64) -> i64
      %961 = func.call @cc_nil_value() : () -> i64
      %962 = func.call @cc_intern(%960, %961) : (i64, i64) -> i64
      %963 = func.call @cc_nil_value() : () -> i64
      %964 = func.call @cc_cons(%962, %963) : (i64, i64) -> i64
      %965 = func.call @cc_values_pack(%964) : (i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %966 = arith.addi %962, %__rlasp_stack_elide_zero_70 : i64
      %967 = func.call @stack_pop_pointer() : () -> i64
      %968 = func.call @cc_cons(%966, %967) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %969 = arith.addi %968, %__rlasp_stack_elide_zero_71 : i64
      %970 = func.call @cc_nil_value() : () -> i64
      %971 = func.call @cc_cons(%969, %970) : (i64, i64) -> i64
      %972 = func.call @cc_eval(%971) : (i64) -> i64
      %973 = func.call @cc_multiple_value_list(%972) : (i64) -> i64
      %974 = func.call @cc_values_pack(%973) : (i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %975 = arith.addi %974, %__rlasp_stack_elide_zero_72 : i64
      scf.yield %975 : i64
    }
    %976 = func.call @cc_nil_value() : () -> i64
    %977 = func.call @cc_errorp(%440) : (i64) -> i64
    %978 = arith.cmpi ne, %977, %976 : i64
    %979 = scf.if %978 -> (i64) {
      scf.yield %440 : i64
    } else {
      %1008 = llvm.mlir.addressof @method_name_47863920852995 : !llvm.ptr
      %1009 = func.call @cc_make_lambda_ref_str(%1008) : (!llvm.ptr) -> i64
      %1010 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1011 = arith.constant 35 : i64
      %1012 = func.call @cc_make_string(%1010, %1011) : (!llvm.ptr, i64) -> i64
      %1013 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1014 = arith.constant 11 : i64
      %1015 = func.call @cc_make_string(%1013, %1014) : (!llvm.ptr, i64) -> i64
      %1016 = func.call @cc_intern(%1012, %1015) : (i64, i64) -> i64
      %1017 = func.call @cc_nil_value() : () -> i64
      %1018 = func.call @cc_cons(%1016, %1017) : (i64, i64) -> i64
      %1019 = func.call @cc_values_pack(%1018) : (i64) -> i64
      %1020 = func.call @cc_nil() : () -> i64
      %1021 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1022 = arith.constant 1 : i64
      %1023 = func.call @cc_make_string(%1021, %1022) : (!llvm.ptr, i64) -> i64
      %1024 = func.call @cc_nil_value() : () -> i64
      %1025 = func.call @cc_intern(%1023, %1024) : (i64, i64) -> i64
      %1026 = func.call @cc_nil_value() : () -> i64
      %1027 = func.call @cc_cons(%1025, %1026) : (i64, i64) -> i64
      %1028 = func.call @cc_values_pack(%1027) : (i64) -> i64
      %1029 = func.call @cc_cons(%1025, %1020) : (i64, i64) -> i64
      %1030 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1031 = arith.constant 1 : i64
      %1032 = func.call @cc_make_string(%1030, %1031) : (!llvm.ptr, i64) -> i64
      %1033 = func.call @cc_nil_value() : () -> i64
      %1034 = func.call @cc_intern(%1032, %1033) : (i64, i64) -> i64
      %1035 = func.call @cc_nil_value() : () -> i64
      %1036 = func.call @cc_cons(%1034, %1035) : (i64, i64) -> i64
      %1037 = func.call @cc_values_pack(%1036) : (i64) -> i64
      %1038 = func.call @cc_cons(%1034, %1029) : (i64, i64) -> i64
      %1039 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1040 = arith.constant 1 : i64
      %1041 = func.call @cc_make_string(%1039, %1040) : (!llvm.ptr, i64) -> i64
      %1042 = func.call @cc_nil_value() : () -> i64
      %1043 = func.call @cc_intern(%1041, %1042) : (i64, i64) -> i64
      %1044 = func.call @cc_nil_value() : () -> i64
      %1045 = func.call @cc_cons(%1043, %1044) : (i64, i64) -> i64
      %1046 = func.call @cc_values_pack(%1045) : (i64) -> i64
      %1047 = func.call @cc_cons(%1043, %1038) : (i64, i64) -> i64
      %1048 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1049 = arith.constant 1 : i64
      %1050 = func.call @cc_make_string(%1048, %1049) : (!llvm.ptr, i64) -> i64
      %1051 = func.call @cc_nil_value() : () -> i64
      %1052 = func.call @cc_intern(%1050, %1051) : (i64, i64) -> i64
      %1053 = func.call @cc_nil_value() : () -> i64
      %1054 = func.call @cc_cons(%1052, %1053) : (i64, i64) -> i64
      %1055 = func.call @cc_values_pack(%1054) : (i64) -> i64
      %1056 = func.call @cc_cons(%1052, %1047) : (i64, i64) -> i64
      %1057 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1058 = arith.constant 1 : i64
      %1059 = func.call @cc_make_string(%1057, %1058) : (!llvm.ptr, i64) -> i64
      %1060 = func.call @cc_nil_value() : () -> i64
      %1061 = func.call @cc_intern(%1059, %1060) : (i64, i64) -> i64
      %1062 = func.call @cc_nil_value() : () -> i64
      %1063 = func.call @cc_cons(%1061, %1062) : (i64, i64) -> i64
      %1064 = func.call @cc_values_pack(%1063) : (i64) -> i64
      %1065 = func.call @cc_cons(%1061, %1056) : (i64, i64) -> i64
      %1066 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1067 = arith.constant 16 : i64
      %1068 = func.call @cc_make_string(%1066, %1067) : (!llvm.ptr, i64) -> i64
      %1069 = func.call @cc_nil_value() : () -> i64
      %1070 = func.call @cc_intern(%1068, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_nil_value() : () -> i64
      %1072 = func.call @cc_cons(%1070, %1071) : (i64, i64) -> i64
      %1073 = func.call @cc_values_pack(%1072) : (i64) -> i64
      %1074 = func.call @cc_cons(%1070, %1065) : (i64, i64) -> i64
      %1075 = arith.constant 6 : i64
      %1076 = func.call @cc_box_fixnum(%1075) : (i64) -> i64
      %1077 = arith.constant 1 : i64
      %1078 = func.call @cc_defmethod_qualified(%1016, %1074, %1009, %1076, %1077) : (i64, i64, i64, i64, i64) -> i64
      %1079 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1079) : (i64) -> ()
      %1080 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1080) : (i64) -> ()
      %1081 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1082 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1083 = arith.constant 13 : i64
      %1084 = func.call @cc_make_string(%1082, %1083) : (!llvm.ptr, i64) -> i64
      %1085 = func.call @cc_nil_value() : () -> i64
      %1086 = func.call @cc_intern(%1084, %1085) : (i64, i64) -> i64
      %1087 = func.call @cc_nil_value() : () -> i64
      %1088 = func.call @cc_cons(%1086, %1087) : (i64, i64) -> i64
      %1089 = func.call @cc_values_pack(%1088) : (i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1090 = arith.addi %1086, %__rlasp_stack_elide_zero_73 : i64
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @cc_cons(%1090, %1091) : (i64, i64) -> i64
      %1093 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1094 = arith.constant 5 : i64
      %1095 = func.call @cc_make_string(%1093, %1094) : (!llvm.ptr, i64) -> i64
      %1096 = func.call @cc_nil_value() : () -> i64
      %1097 = func.call @cc_intern(%1095, %1096) : (i64, i64) -> i64
      %1098 = func.call @cc_nil_value() : () -> i64
      %1099 = func.call @cc_cons(%1097, %1098) : (i64, i64) -> i64
      %1100 = func.call @cc_values_pack(%1099) : (i64) -> i64
      %1101 = func.call @cc_cons(%1097, %1092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1102 = arith.addi %1101, %__rlasp_stack_elide_zero_74 : i64
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @cc_cons(%1102, %1103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1104) : (i64) -> ()
      %1105 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1106 = arith.constant 5 : i64
      %1107 = func.call @cc_make_string(%1105, %1106) : (!llvm.ptr, i64) -> i64
      %1108 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1109 = arith.constant 11 : i64
      %1110 = func.call @cc_make_string(%1108, %1109) : (!llvm.ptr, i64) -> i64
      %1111 = func.call @cc_intern(%1107, %1110) : (i64, i64) -> i64
      %1112 = func.call @cc_nil_value() : () -> i64
      %1113 = func.call @cc_cons(%1111, %1112) : (i64, i64) -> i64
      %1114 = func.call @cc_values_pack(%1113) : (i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1115 = arith.addi %1111, %__rlasp_stack_elide_zero_75 : i64
      %1116 = func.call @stack_pop_pointer() : () -> i64
      %1117 = func.call @cc_cons(%1115, %1116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1118 = arith.addi %1117, %__rlasp_stack_elide_zero_76 : i64
      %1119 = func.call @stack_pop_pointer() : () -> i64
      %1120 = func.call @cc_cons(%1118, %1119) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1120) : (i64) -> ()
      %1121 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1121) : (i64) -> ()
      %1122 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1122) : (i64) -> ()
      %1123 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1124 = arith.constant 8 : i64
      %1125 = func.call @cc_make_string(%1123, %1124) : (!llvm.ptr, i64) -> i64
      %1126 = func.call @cc_nil_value() : () -> i64
      %1127 = func.call @cc_intern(%1125, %1126) : (i64, i64) -> i64
      %1128 = func.call @cc_nil_value() : () -> i64
      %1129 = func.call @cc_cons(%1127, %1128) : (i64, i64) -> i64
      %1130 = func.call @cc_values_pack(%1129) : (i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1131 = arith.addi %1127, %__rlasp_stack_elide_zero_77 : i64
      %1132 = func.call @stack_pop_pointer() : () -> i64
      %1133 = func.call @cc_cons(%1131, %1132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1133) : (i64) -> ()
      %1134 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1135 = arith.constant 13 : i64
      %1136 = func.call @cc_make_string(%1134, %1135) : (!llvm.ptr, i64) -> i64
      %1137 = func.call @cc_nil_value() : () -> i64
      %1138 = func.call @cc_intern(%1136, %1137) : (i64, i64) -> i64
      %1139 = func.call @cc_nil_value() : () -> i64
      %1140 = func.call @cc_cons(%1138, %1139) : (i64, i64) -> i64
      %1141 = func.call @cc_values_pack(%1140) : (i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1142 = arith.addi %1138, %__rlasp_stack_elide_zero_78 : i64
      %1143 = func.call @stack_pop_pointer() : () -> i64
      %1144 = func.call @cc_cons(%1142, %1143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1144) : (i64) -> ()
      %1145 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1146 = arith.constant 15 : i64
      %1147 = func.call @cc_make_string(%1145, %1146) : (!llvm.ptr, i64) -> i64
      %1148 = func.call @cc_nil_value() : () -> i64
      %1149 = func.call @cc_intern(%1147, %1148) : (i64, i64) -> i64
      %1150 = func.call @cc_nil_value() : () -> i64
      %1151 = func.call @cc_cons(%1149, %1150) : (i64, i64) -> i64
      %1152 = func.call @cc_values_pack(%1151) : (i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1153 = arith.addi %1149, %__rlasp_stack_elide_zero_79 : i64
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @cc_cons(%1153, %1154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1155) : (i64) -> ()
      %1156 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1157 = arith.constant 11 : i64
      %1158 = func.call @cc_make_string(%1156, %1157) : (!llvm.ptr, i64) -> i64
      %1159 = func.call @cc_nil_value() : () -> i64
      %1160 = func.call @cc_intern(%1158, %1159) : (i64, i64) -> i64
      %1161 = func.call @cc_nil_value() : () -> i64
      %1162 = func.call @cc_cons(%1160, %1161) : (i64, i64) -> i64
      %1163 = func.call @cc_values_pack(%1162) : (i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1164 = arith.addi %1160, %__rlasp_stack_elide_zero_80 : i64
      %1165 = func.call @stack_pop_pointer() : () -> i64
      %1166 = func.call @cc_cons(%1164, %1165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1166) : (i64) -> ()
      %1167 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1168 = arith.constant 6 : i64
      %1169 = func.call @cc_make_string(%1167, %1168) : (!llvm.ptr, i64) -> i64
      %1170 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1171 = arith.constant 11 : i64
      %1172 = func.call @cc_make_string(%1170, %1171) : (!llvm.ptr, i64) -> i64
      %1173 = func.call @cc_intern(%1169, %1172) : (i64, i64) -> i64
      %1174 = func.call @cc_nil_value() : () -> i64
      %1175 = func.call @cc_cons(%1173, %1174) : (i64, i64) -> i64
      %1176 = func.call @cc_values_pack(%1175) : (i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1177 = arith.addi %1173, %__rlasp_stack_elide_zero_81 : i64
      %1178 = func.call @stack_pop_pointer() : () -> i64
      %1179 = func.call @cc_cons(%1177, %1178) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1180 = arith.addi %1179, %__rlasp_stack_elide_zero_82 : i64
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = func.call @cc_cons(%1180, %1181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1182) : (i64) -> ()
      %1183 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1184 = arith.constant 7 : i64
      %1185 = func.call @cc_make_string(%1183, %1184) : (!llvm.ptr, i64) -> i64
      %1186 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1187 = arith.constant 11 : i64
      %1188 = func.call @cc_make_string(%1186, %1187) : (!llvm.ptr, i64) -> i64
      %1189 = func.call @cc_intern(%1185, %1188) : (i64, i64) -> i64
      %1190 = func.call @cc_nil_value() : () -> i64
      %1191 = func.call @cc_cons(%1189, %1190) : (i64, i64) -> i64
      %1192 = func.call @cc_values_pack(%1191) : (i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1193 = arith.addi %1189, %__rlasp_stack_elide_zero_83 : i64
      %1194 = func.call @stack_pop_pointer() : () -> i64
      %1195 = func.call @cc_cons(%1193, %1194) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1196 = arith.addi %1195, %__rlasp_stack_elide_zero_84 : i64
      %1197 = func.call @stack_pop_pointer() : () -> i64
      %1198 = func.call @cc_cons(%1196, %1197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1198) : (i64) -> ()
      %1199 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1199) : (i64) -> ()
      %1200 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1201 = arith.constant 8 : i64
      %1202 = func.call @cc_make_string(%1200, %1201) : (!llvm.ptr, i64) -> i64
      %1203 = func.call @cc_nil_value() : () -> i64
      %1204 = func.call @cc_intern(%1202, %1203) : (i64, i64) -> i64
      %1205 = func.call @cc_nil_value() : () -> i64
      %1206 = func.call @cc_cons(%1204, %1205) : (i64, i64) -> i64
      %1207 = func.call @cc_values_pack(%1206) : (i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1208 = arith.addi %1204, %__rlasp_stack_elide_zero_85 : i64
      %1209 = func.call @stack_pop_pointer() : () -> i64
      %1210 = func.call @cc_cons(%1208, %1209) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1210) : (i64) -> ()
      %1211 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1212 = arith.constant 5 : i64
      %1213 = func.call @cc_make_string(%1211, %1212) : (!llvm.ptr, i64) -> i64
      %1214 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1215 = arith.constant 11 : i64
      %1216 = func.call @cc_make_string(%1214, %1215) : (!llvm.ptr, i64) -> i64
      %1217 = func.call @cc_intern(%1213, %1216) : (i64, i64) -> i64
      %1218 = func.call @cc_nil_value() : () -> i64
      %1219 = func.call @cc_cons(%1217, %1218) : (i64, i64) -> i64
      %1220 = func.call @cc_values_pack(%1219) : (i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1221 = arith.addi %1217, %__rlasp_stack_elide_zero_86 : i64
      %1222 = func.call @stack_pop_pointer() : () -> i64
      %1223 = func.call @cc_cons(%1221, %1222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1223) : (i64) -> ()
      %1224 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1225 = arith.constant 13 : i64
      %1226 = func.call @cc_make_string(%1224, %1225) : (!llvm.ptr, i64) -> i64
      %1227 = func.call @cc_nil_value() : () -> i64
      %1228 = func.call @cc_intern(%1226, %1227) : (i64, i64) -> i64
      %1229 = func.call @cc_nil_value() : () -> i64
      %1230 = func.call @cc_cons(%1228, %1229) : (i64, i64) -> i64
      %1231 = func.call @cc_values_pack(%1230) : (i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1232 = arith.addi %1228, %__rlasp_stack_elide_zero_87 : i64
      %1233 = func.call @stack_pop_pointer() : () -> i64
      %1234 = func.call @cc_cons(%1232, %1233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1234) : (i64) -> ()
      %1235 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1236 = arith.constant 15 : i64
      %1237 = func.call @cc_make_string(%1235, %1236) : (!llvm.ptr, i64) -> i64
      %1238 = func.call @cc_nil_value() : () -> i64
      %1239 = func.call @cc_intern(%1237, %1238) : (i64, i64) -> i64
      %1240 = func.call @cc_nil_value() : () -> i64
      %1241 = func.call @cc_cons(%1239, %1240) : (i64, i64) -> i64
      %1242 = func.call @cc_values_pack(%1241) : (i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1243 = arith.addi %1239, %__rlasp_stack_elide_zero_88 : i64
      %1244 = func.call @stack_pop_pointer() : () -> i64
      %1245 = func.call @cc_cons(%1243, %1244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1245) : (i64) -> ()
      %1246 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1247 = arith.constant 11 : i64
      %1248 = func.call @cc_make_string(%1246, %1247) : (!llvm.ptr, i64) -> i64
      %1249 = func.call @cc_nil_value() : () -> i64
      %1250 = func.call @cc_intern(%1248, %1249) : (i64, i64) -> i64
      %1251 = func.call @cc_nil_value() : () -> i64
      %1252 = func.call @cc_cons(%1250, %1251) : (i64, i64) -> i64
      %1253 = func.call @cc_values_pack(%1252) : (i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1254 = arith.addi %1250, %__rlasp_stack_elide_zero_89 : i64
      %1255 = func.call @stack_pop_pointer() : () -> i64
      %1256 = func.call @cc_cons(%1254, %1255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1256) : (i64) -> ()
      %1257 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1257) : (i64) -> ()
      %1258 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1259 = arith.constant 16 : i64
      %1260 = func.call @cc_make_string(%1258, %1259) : (!llvm.ptr, i64) -> i64
      %1261 = func.call @cc_nil_value() : () -> i64
      %1262 = func.call @cc_intern(%1260, %1261) : (i64, i64) -> i64
      %1263 = func.call @cc_nil_value() : () -> i64
      %1264 = func.call @cc_cons(%1262, %1263) : (i64, i64) -> i64
      %1265 = func.call @cc_values_pack(%1264) : (i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1266 = arith.addi %1262, %__rlasp_stack_elide_zero_90 : i64
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @cc_cons(%1266, %1267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1268) : (i64) -> ()
      %1269 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1270 = arith.constant 8 : i64
      %1271 = func.call @cc_make_string(%1269, %1270) : (!llvm.ptr, i64) -> i64
      %1272 = func.call @cc_nil_value() : () -> i64
      %1273 = func.call @cc_intern(%1271, %1272) : (i64, i64) -> i64
      %1274 = func.call @cc_nil_value() : () -> i64
      %1275 = func.call @cc_cons(%1273, %1274) : (i64, i64) -> i64
      %1276 = func.call @cc_values_pack(%1275) : (i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1277 = arith.addi %1273, %__rlasp_stack_elide_zero_91 : i64
      %1278 = func.call @stack_pop_pointer() : () -> i64
      %1279 = func.call @cc_cons(%1277, %1278) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1280 = arith.addi %1279, %__rlasp_stack_elide_zero_92 : i64
      %1281 = func.call @stack_pop_pointer() : () -> i64
      %1282 = func.call @cc_cons(%1280, %1281) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1283 = arith.addi %1282, %__rlasp_stack_elide_zero_93 : i64
      %1284 = func.call @stack_pop_pointer() : () -> i64
      %1285 = func.call @cc_cons(%1283, %1284) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1285) : (i64) -> ()
      %1286 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1287 = arith.constant 6 : i64
      %1288 = func.call @cc_make_string(%1286, %1287) : (!llvm.ptr, i64) -> i64
      %1289 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1290 = arith.constant 7 : i64
      %1291 = func.call @cc_make_string(%1289, %1290) : (!llvm.ptr, i64) -> i64
      %1292 = func.call @cc_intern(%1288, %1291) : (i64, i64) -> i64
      %1293 = func.call @cc_nil_value() : () -> i64
      %1294 = func.call @cc_cons(%1292, %1293) : (i64, i64) -> i64
      %1295 = func.call @cc_values_pack(%1294) : (i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1296 = arith.addi %1292, %__rlasp_stack_elide_zero_94 : i64
      %1297 = func.call @stack_pop_pointer() : () -> i64
      %1298 = func.call @cc_cons(%1296, %1297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1298) : (i64) -> ()
      %1299 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1300 = arith.constant 35 : i64
      %1301 = func.call @cc_make_string(%1299, %1300) : (!llvm.ptr, i64) -> i64
      %1302 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1303 = arith.constant 11 : i64
      %1304 = func.call @cc_make_string(%1302, %1303) : (!llvm.ptr, i64) -> i64
      %1305 = func.call @cc_intern(%1301, %1304) : (i64, i64) -> i64
      %1306 = func.call @cc_nil_value() : () -> i64
      %1307 = func.call @cc_cons(%1305, %1306) : (i64, i64) -> i64
      %1308 = func.call @cc_values_pack(%1307) : (i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1309 = arith.addi %1305, %__rlasp_stack_elide_zero_95 : i64
      %1310 = func.call @stack_pop_pointer() : () -> i64
      %1311 = func.call @cc_cons(%1309, %1310) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1311) : (i64) -> ()
      %1312 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1313 = arith.constant 9 : i64
      %1314 = func.call @cc_make_string(%1312, %1313) : (!llvm.ptr, i64) -> i64
      %1315 = func.call @cc_nil_value() : () -> i64
      %1316 = func.call @cc_intern(%1314, %1315) : (i64, i64) -> i64
      %1317 = func.call @cc_nil_value() : () -> i64
      %1318 = func.call @cc_cons(%1316, %1317) : (i64, i64) -> i64
      %1319 = func.call @cc_values_pack(%1318) : (i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %1320 = arith.addi %1316, %__rlasp_stack_elide_zero_96 : i64
      %1321 = func.call @stack_pop_pointer() : () -> i64
      %1322 = func.call @cc_cons(%1320, %1321) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %1323 = arith.addi %1322, %__rlasp_stack_elide_zero_97 : i64
      %1324 = func.call @cc_nil_value() : () -> i64
      %1325 = func.call @cc_cons(%1323, %1324) : (i64, i64) -> i64
      %1326 = func.call @cc_eval(%1325) : (i64) -> i64
      %1327 = func.call @cc_multiple_value_list(%1326) : (i64) -> i64
      %1328 = func.call @cc_values_pack(%1327) : (i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %1329 = arith.addi %1328, %__rlasp_stack_elide_zero_98 : i64
      scf.yield %1329 : i64
    }
    %1330 = func.call @cc_nil_value() : () -> i64
    %1331 = func.call @cc_errorp(%979) : (i64) -> i64
    %1332 = arith.cmpi ne, %1331, %1330 : i64
    %1333 = scf.if %1332 -> (i64) {
      scf.yield %979 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1334 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1335 = func.call @stack_pop_pointer() : () -> i64
      %1336 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1337 = arith.constant 9 : i64
      %1338 = func.call @cc_make_string(%1336, %1337) : (!llvm.ptr, i64) -> i64
      %1339 = func.call @cc_nil_value() : () -> i64
      %1340 = func.call @cc_intern(%1338, %1339) : (i64, i64) -> i64
      %1341 = func.call @cc_nil_value() : () -> i64
      %1342 = func.call @cc_cons(%1340, %1341) : (i64, i64) -> i64
      %1343 = func.call @cc_values_pack(%1342) : (i64) -> i64
      %1345 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1346 = arith.constant 15 : i64
      %1347 = func.call @cc_make_string(%1345, %1346) : (!llvm.ptr, i64) -> i64
      %1348 = func.call @cc_nil_value() : () -> i64
      %1349 = func.call @cc_intern(%1347, %1348) : (i64, i64) -> i64
      %1350 = func.call @cc_nil_value() : () -> i64
      %1351 = func.call @cc_cons(%1349, %1350) : (i64, i64) -> i64
      %1352 = func.call @cc_values_pack(%1351) : (i64) -> i64
      %1344 = func.call @cc_defclass_with_metaclass(%1340, %1334, %1335, %1349) : (i64, i64, i64, i64) -> i64
      %1353 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1353) : (i64) -> ()
      %1354 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1354) : (i64) -> ()
      %1355 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1356 = arith.constant 15 : i64
      %1357 = func.call @cc_make_string(%1355, %1356) : (!llvm.ptr, i64) -> i64
      %1358 = func.call @cc_nil_value() : () -> i64
      %1359 = func.call @cc_intern(%1357, %1358) : (i64, i64) -> i64
      %1360 = func.call @cc_nil_value() : () -> i64
      %1361 = func.call @cc_cons(%1359, %1360) : (i64, i64) -> i64
      %1362 = func.call @cc_values_pack(%1361) : (i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %1363 = arith.addi %1359, %__rlasp_stack_elide_zero_99 : i64
      %1364 = func.call @stack_pop_pointer() : () -> i64
      %1365 = func.call @cc_cons(%1363, %1364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1365) : (i64) -> ()
      %1366 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1367 = arith.constant 9 : i64
      %1368 = func.call @cc_make_string(%1366, %1367) : (!llvm.ptr, i64) -> i64
      %1369 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1370 = arith.constant 7 : i64
      %1371 = func.call @cc_make_string(%1369, %1370) : (!llvm.ptr, i64) -> i64
      %1372 = func.call @cc_intern(%1368, %1371) : (i64, i64) -> i64
      %1373 = func.call @cc_nil_value() : () -> i64
      %1374 = func.call @cc_cons(%1372, %1373) : (i64, i64) -> i64
      %1375 = func.call @cc_values_pack(%1374) : (i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %1376 = arith.addi %1372, %__rlasp_stack_elide_zero_100 : i64
      %1377 = func.call @stack_pop_pointer() : () -> i64
      %1378 = func.call @cc_cons(%1376, %1377) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %1379 = arith.addi %1378, %__rlasp_stack_elide_zero_101 : i64
      %1380 = func.call @stack_pop_pointer() : () -> i64
      %1381 = func.call @cc_cons(%1379, %1380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1382 = func.call @stack_pop_pointer() : () -> i64
      %1383 = func.call @stack_pop_pointer() : () -> i64
      %1384 = func.call @cc_cons(%1382, %1383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1384) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1385 = func.call @stack_pop_pointer() : () -> i64
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @cc_cons(%1385, %1386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1387) : (i64) -> ()
      %1388 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1389 = arith.constant 9 : i64
      %1390 = func.call @cc_make_string(%1388, %1389) : (!llvm.ptr, i64) -> i64
      %1391 = func.call @cc_nil_value() : () -> i64
      %1392 = func.call @cc_intern(%1390, %1391) : (i64, i64) -> i64
      %1393 = func.call @cc_nil_value() : () -> i64
      %1394 = func.call @cc_cons(%1392, %1393) : (i64, i64) -> i64
      %1395 = func.call @cc_values_pack(%1394) : (i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %1396 = arith.addi %1392, %__rlasp_stack_elide_zero_102 : i64
      %1397 = func.call @stack_pop_pointer() : () -> i64
      %1398 = func.call @cc_cons(%1396, %1397) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1398) : (i64) -> ()
      %1399 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1400 = arith.constant 8 : i64
      %1401 = func.call @cc_make_string(%1399, %1400) : (!llvm.ptr, i64) -> i64
      %1402 = func.call @cc_nil_value() : () -> i64
      %1403 = func.call @cc_intern(%1401, %1402) : (i64, i64) -> i64
      %1404 = func.call @cc_nil_value() : () -> i64
      %1405 = func.call @cc_cons(%1403, %1404) : (i64, i64) -> i64
      %1406 = func.call @cc_values_pack(%1405) : (i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %1407 = arith.addi %1403, %__rlasp_stack_elide_zero_103 : i64
      %1408 = func.call @stack_pop_pointer() : () -> i64
      %1409 = func.call @cc_cons(%1407, %1408) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %1410 = arith.addi %1409, %__rlasp_stack_elide_zero_104 : i64
      %1411 = func.call @cc_nil_value() : () -> i64
      %1412 = func.call @cc_cons(%1410, %1411) : (i64, i64) -> i64
      %1413 = func.call @cc_eval(%1412) : (i64) -> i64
      %1414 = func.call @cc_multiple_value_list(%1413) : (i64) -> i64
      %1415 = func.call @cc_values_pack(%1414) : (i64) -> i64
      func.call @stack_push_pointer(%1415) : (i64) -> ()
      %1416 = func.call @stack_depth() : () -> i64
      %1417 = arith.constant 0 : i64
      %1418 = arith.cmpi sgt, %1416, %1417 : i64
      scf.if %1418 {
        %1419 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %1420 = arith.addi %1340, %__rlasp_stack_elide_zero_105 : i64
      scf.yield %1420 : i64
    }
    %1421 = func.call @cc_nil_value() : () -> i64
    %1422 = func.call @cc_errorp(%1333) : (i64) -> i64
    %1423 = arith.cmpi ne, %1422, %1421 : i64
    %1424 = scf.if %1423 -> (i64) {
      scf.yield %1333 : i64
    } else {
      %1425 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1426 = arith.constant 11 : i64
      %1427 = func.call @cc_make_string(%1425, %1426) : (!llvm.ptr, i64) -> i64
      %1428 = func.call @cc_nil_value() : () -> i64
      %1429 = func.call @cc_intern(%1427, %1428) : (i64, i64) -> i64
      %1430 = func.call @cc_nil_value() : () -> i64
      %1431 = func.call @cc_cons(%1429, %1430) : (i64, i64) -> i64
      %1432 = func.call @cc_values_pack(%1431) : (i64) -> i64
      %1433 = func.call @cc_nil_value() : () -> i64
      %1434 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1435 = arith.constant 9 : i64
      %1436 = func.call @cc_make_string(%1434, %1435) : (!llvm.ptr, i64) -> i64
      %1437 = func.call @cc_nil_value() : () -> i64
      %1438 = func.call @cc_intern(%1436, %1437) : (i64, i64) -> i64
      %1439 = func.call @cc_nil_value() : () -> i64
      %1440 = func.call @cc_cons(%1438, %1439) : (i64, i64) -> i64
      %1441 = func.call @cc_values_pack(%1440) : (i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %1442 = arith.addi %1438, %__rlasp_stack_elide_zero_106 : i64
      %1443 = func.call @cc_make_instance(%1442, %1433) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %1444 = arith.addi %1443, %__rlasp_stack_elide_zero_107 : i64
      %1445 = func.call @cc_set_symbol_value(%1429, %1444) : (i64, i64) -> i64
      %1446 = func.call @cc_errorp(%1445) : (i64) -> i64
      %1447 = func.call @cc_nil_value() : () -> i64
      %1448 = arith.cmpi ne, %1446, %1447 : i64
      scf.if %1448 {
        func.call @stack_push_pointer(%1445) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1429) : (i64) -> ()
      }
      %1449 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1449 : i64
    }
    %1450 = func.call @cc_nil_value() : () -> i64
    %1451 = func.call @cc_errorp(%1424) : (i64) -> i64
    %1452 = arith.cmpi ne, %1451, %1450 : i64
    %1453 = scf.if %1452 -> (i64) {
      scf.yield %1424 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1454 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1455 = arith.constant 4 : i64
      %1456 = func.call @cc_make_string(%1454, %1455) : (!llvm.ptr, i64) -> i64
      %1457 = func.call @cc_nil_value() : () -> i64
      %1458 = func.call @cc_intern(%1456, %1457) : (i64, i64) -> i64
      %1459 = func.call @cc_nil_value() : () -> i64
      %1460 = func.call @cc_cons(%1458, %1459) : (i64, i64) -> i64
      %1461 = func.call @cc_values_pack(%1460) : (i64) -> i64
      %1462 = func.call @stack_pop_pointer() : () -> i64
      %1463 = func.call @cc_cons(%1458, %1462) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %1464 = arith.addi %1463, %__rlasp_stack_elide_zero_108 : i64
      func.call @stack_push_nil() : () -> ()
      %1465 = func.call @stack_pop_pointer() : () -> i64
      %1466 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1467 = arith.constant 9 : i64
      %1468 = func.call @cc_make_string(%1466, %1467) : (!llvm.ptr, i64) -> i64
      %1469 = func.call @cc_nil_value() : () -> i64
      %1470 = func.call @cc_intern(%1468, %1469) : (i64, i64) -> i64
      %1471 = func.call @cc_nil_value() : () -> i64
      %1472 = func.call @cc_cons(%1470, %1471) : (i64, i64) -> i64
      %1473 = func.call @cc_values_pack(%1472) : (i64) -> i64
      %1475 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1476 = arith.constant 15 : i64
      %1477 = func.call @cc_make_string(%1475, %1476) : (!llvm.ptr, i64) -> i64
      %1478 = func.call @cc_nil_value() : () -> i64
      %1479 = func.call @cc_intern(%1477, %1478) : (i64, i64) -> i64
      %1480 = func.call @cc_nil_value() : () -> i64
      %1481 = func.call @cc_cons(%1479, %1480) : (i64, i64) -> i64
      %1482 = func.call @cc_values_pack(%1481) : (i64) -> i64
      %1474 = func.call @cc_defclass_with_metaclass(%1470, %1464, %1465, %1479) : (i64, i64, i64, i64) -> i64
      %1483 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1483) : (i64) -> ()
      %1484 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1484) : (i64) -> ()
      %1485 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1486 = arith.constant 15 : i64
      %1487 = func.call @cc_make_string(%1485, %1486) : (!llvm.ptr, i64) -> i64
      %1488 = func.call @cc_nil_value() : () -> i64
      %1489 = func.call @cc_intern(%1487, %1488) : (i64, i64) -> i64
      %1490 = func.call @cc_nil_value() : () -> i64
      %1491 = func.call @cc_cons(%1489, %1490) : (i64, i64) -> i64
      %1492 = func.call @cc_values_pack(%1491) : (i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %1493 = arith.addi %1489, %__rlasp_stack_elide_zero_109 : i64
      %1494 = func.call @stack_pop_pointer() : () -> i64
      %1495 = func.call @cc_cons(%1493, %1494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1495) : (i64) -> ()
      %1496 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1497 = arith.constant 9 : i64
      %1498 = func.call @cc_make_string(%1496, %1497) : (!llvm.ptr, i64) -> i64
      %1499 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1500 = arith.constant 7 : i64
      %1501 = func.call @cc_make_string(%1499, %1500) : (!llvm.ptr, i64) -> i64
      %1502 = func.call @cc_intern(%1498, %1501) : (i64, i64) -> i64
      %1503 = func.call @cc_nil_value() : () -> i64
      %1504 = func.call @cc_cons(%1502, %1503) : (i64, i64) -> i64
      %1505 = func.call @cc_values_pack(%1504) : (i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %1506 = arith.addi %1502, %__rlasp_stack_elide_zero_110 : i64
      %1507 = func.call @stack_pop_pointer() : () -> i64
      %1508 = func.call @cc_cons(%1506, %1507) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %1509 = arith.addi %1508, %__rlasp_stack_elide_zero_111 : i64
      %1510 = func.call @stack_pop_pointer() : () -> i64
      %1511 = func.call @cc_cons(%1509, %1510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1511) : (i64) -> ()
      %1512 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1512) : (i64) -> ()
      %1513 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1513) : (i64) -> ()
      %1514 = arith.constant 42 : i64
      func.call @stack_push_fixnum(%1514) : (i64) -> ()
      %1515 = func.call @stack_pop_pointer() : () -> i64
      %1516 = func.call @stack_pop_pointer() : () -> i64
      %1517 = func.call @cc_cons(%1515, %1516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1517) : (i64) -> ()
      %1518 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1519 = arith.constant 8 : i64
      %1520 = func.call @cc_make_string(%1518, %1519) : (!llvm.ptr, i64) -> i64
      %1521 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1522 = arith.constant 7 : i64
      %1523 = func.call @cc_make_string(%1521, %1522) : (!llvm.ptr, i64) -> i64
      %1524 = func.call @cc_intern(%1520, %1523) : (i64, i64) -> i64
      %1525 = func.call @cc_nil_value() : () -> i64
      %1526 = func.call @cc_cons(%1524, %1525) : (i64, i64) -> i64
      %1527 = func.call @cc_values_pack(%1526) : (i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %1528 = arith.addi %1524, %__rlasp_stack_elide_zero_112 : i64
      %1529 = func.call @stack_pop_pointer() : () -> i64
      %1530 = func.call @cc_cons(%1528, %1529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1530) : (i64) -> ()
      %1531 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1532 = arith.constant 4 : i64
      %1533 = func.call @cc_make_string(%1531, %1532) : (!llvm.ptr, i64) -> i64
      %1534 = func.call @cc_nil_value() : () -> i64
      %1535 = func.call @cc_intern(%1533, %1534) : (i64, i64) -> i64
      %1536 = func.call @cc_nil_value() : () -> i64
      %1537 = func.call @cc_cons(%1535, %1536) : (i64, i64) -> i64
      %1538 = func.call @cc_values_pack(%1537) : (i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %1539 = arith.addi %1535, %__rlasp_stack_elide_zero_113 : i64
      %1540 = func.call @stack_pop_pointer() : () -> i64
      %1541 = func.call @cc_cons(%1539, %1540) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %1542 = arith.addi %1541, %__rlasp_stack_elide_zero_114 : i64
      %1543 = func.call @stack_pop_pointer() : () -> i64
      %1544 = func.call @cc_cons(%1542, %1543) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %1545 = arith.addi %1544, %__rlasp_stack_elide_zero_115 : i64
      %1546 = func.call @stack_pop_pointer() : () -> i64
      %1547 = func.call @cc_cons(%1545, %1546) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1547) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1548 = func.call @stack_pop_pointer() : () -> i64
      %1549 = func.call @stack_pop_pointer() : () -> i64
      %1550 = func.call @cc_cons(%1548, %1549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1550) : (i64) -> ()
      %1551 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1552 = arith.constant 9 : i64
      %1553 = func.call @cc_make_string(%1551, %1552) : (!llvm.ptr, i64) -> i64
      %1554 = func.call @cc_nil_value() : () -> i64
      %1555 = func.call @cc_intern(%1553, %1554) : (i64, i64) -> i64
      %1556 = func.call @cc_nil_value() : () -> i64
      %1557 = func.call @cc_cons(%1555, %1556) : (i64, i64) -> i64
      %1558 = func.call @cc_values_pack(%1557) : (i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %1559 = arith.addi %1555, %__rlasp_stack_elide_zero_116 : i64
      %1560 = func.call @stack_pop_pointer() : () -> i64
      %1561 = func.call @cc_cons(%1559, %1560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1561) : (i64) -> ()
      %1562 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1563 = arith.constant 8 : i64
      %1564 = func.call @cc_make_string(%1562, %1563) : (!llvm.ptr, i64) -> i64
      %1565 = func.call @cc_nil_value() : () -> i64
      %1566 = func.call @cc_intern(%1564, %1565) : (i64, i64) -> i64
      %1567 = func.call @cc_nil_value() : () -> i64
      %1568 = func.call @cc_cons(%1566, %1567) : (i64, i64) -> i64
      %1569 = func.call @cc_values_pack(%1568) : (i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %1570 = arith.addi %1566, %__rlasp_stack_elide_zero_117 : i64
      %1571 = func.call @stack_pop_pointer() : () -> i64
      %1572 = func.call @cc_cons(%1570, %1571) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %1573 = arith.addi %1572, %__rlasp_stack_elide_zero_118 : i64
      %1574 = func.call @cc_nil_value() : () -> i64
      %1575 = func.call @cc_cons(%1573, %1574) : (i64, i64) -> i64
      %1576 = func.call @cc_eval(%1575) : (i64) -> i64
      %1577 = func.call @cc_multiple_value_list(%1576) : (i64) -> i64
      %1578 = func.call @cc_values_pack(%1577) : (i64) -> i64
      func.call @stack_push_pointer(%1578) : (i64) -> ()
      %1579 = func.call @stack_depth() : () -> i64
      %1580 = arith.constant 0 : i64
      %1581 = arith.cmpi sgt, %1579, %1580 : i64
      scf.if %1581 {
        %1582 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %1583 = arith.addi %1470, %__rlasp_stack_elide_zero_119 : i64
      scf.yield %1583 : i64
    }
    %1584 = func.call @cc_nil_value() : () -> i64
    %1585 = func.call @cc_errorp(%1453) : (i64) -> i64
    %1586 = arith.cmpi ne, %1585, %1584 : i64
    %1587 = scf.if %1586 -> (i64) {
      scf.yield %1453 : i64
    } else {
      %1588 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1589 = arith.constant 13 : i64
      %1590 = func.call @cc_make_string(%1588, %1589) : (!llvm.ptr, i64) -> i64
      %1591 = func.call @cc_nil_value() : () -> i64
      %1592 = func.call @cc_intern(%1590, %1591) : (i64, i64) -> i64
      %1593 = func.call @cc_nil_value() : () -> i64
      %1594 = func.call @cc_cons(%1592, %1593) : (i64, i64) -> i64
      %1595 = func.call @cc_values_pack(%1594) : (i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %1596 = arith.addi %1592, %__rlasp_stack_elide_zero_120 : i64
      %1597 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1598 = arith.constant 13 : i64
      %1599 = func.call @cc_make_string(%1597, %1598) : (!llvm.ptr, i64) -> i64
      %1600 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1601 = arith.constant 11 : i64
      %1602 = func.call @cc_make_string(%1600, %1601) : (!llvm.ptr, i64) -> i64
      %1603 = func.call @cc_intern(%1599, %1602) : (i64, i64) -> i64
      %1604 = func.call @cc_nil_value() : () -> i64
      %1605 = func.call @cc_cons(%1603, %1604) : (i64, i64) -> i64
      %1606 = func.call @cc_values_pack(%1605) : (i64) -> i64
      func.call @stack_push_pointer(%1603) : (i64) -> ()
      %1607 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1608 = arith.constant 6 : i64
      %1609 = func.call @cc_make_string(%1607, %1608) : (!llvm.ptr, i64) -> i64
      %1610 = func.call @cc_nil_value() : () -> i64
      %1611 = func.call @cc_intern(%1609, %1610) : (i64, i64) -> i64
      %1612 = func.call @cc_nil_value() : () -> i64
      %1613 = func.call @cc_cons(%1611, %1612) : (i64, i64) -> i64
      %1614 = func.call @cc_values_pack(%1613) : (i64) -> i64
      func.call @stack_push_pointer(%1611) : (i64) -> ()
      %1615 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1616 = arith.constant 19 : i64
      %1617 = func.call @cc_make_string(%1615, %1616) : (!llvm.ptr, i64) -> i64
      %1618 = func.call @cc_nil_value() : () -> i64
      %1619 = func.call @cc_intern(%1617, %1618) : (i64, i64) -> i64
      %1620 = func.call @cc_nil_value() : () -> i64
      %1621 = func.call @cc_cons(%1619, %1620) : (i64, i64) -> i64
      %1622 = func.call @cc_values_pack(%1621) : (i64) -> i64
      func.call @stack_push_pointer(%1619) : (i64) -> ()
      %1623 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1624 = arith.constant 10 : i64
      %1625 = func.call @cc_make_string(%1623, %1624) : (!llvm.ptr, i64) -> i64
      %1626 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1627 = arith.constant 11 : i64
      %1628 = func.call @cc_make_string(%1626, %1627) : (!llvm.ptr, i64) -> i64
      %1629 = func.call @cc_intern(%1625, %1628) : (i64, i64) -> i64
      %1630 = func.call @cc_nil_value() : () -> i64
      %1631 = func.call @cc_cons(%1629, %1630) : (i64, i64) -> i64
      %1632 = func.call @cc_values_pack(%1631) : (i64) -> i64
      func.call @stack_push_pointer(%1629) : (i64) -> ()
      %1633 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1634 = arith.constant 11 : i64
      %1635 = func.call @cc_make_string(%1633, %1634) : (!llvm.ptr, i64) -> i64
      %1636 = func.call @cc_nil_value() : () -> i64
      %1637 = func.call @cc_intern(%1635, %1636) : (i64, i64) -> i64
      %1638 = func.call @cc_nil_value() : () -> i64
      %1639 = func.call @cc_cons(%1637, %1638) : (i64, i64) -> i64
      %1640 = func.call @cc_values_pack(%1639) : (i64) -> i64
      func.call @stack_push_pointer(%1637) : (i64) -> ()
      %1641 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1641) : (i64) -> ()
      %1642 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1643 = arith.constant 4 : i64
      %1644 = func.call @cc_make_string(%1642, %1643) : (!llvm.ptr, i64) -> i64
      %1645 = func.call @cc_nil_value() : () -> i64
      %1646 = func.call @cc_intern(%1644, %1645) : (i64, i64) -> i64
      %1647 = func.call @cc_nil_value() : () -> i64
      %1648 = func.call @cc_cons(%1646, %1647) : (i64, i64) -> i64
      %1649 = func.call @cc_values_pack(%1648) : (i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %1650 = arith.addi %1646, %__rlasp_stack_elide_zero_121 : i64
      %1651 = func.call @stack_pop_pointer() : () -> i64
      %1652 = func.call @cc_cons(%1650, %1651) : (i64, i64) -> i64
      %1653 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1654 = arith.constant 5 : i64
      %1655 = func.call @cc_make_string(%1653, %1654) : (!llvm.ptr, i64) -> i64
      %1656 = func.call @cc_nil_value() : () -> i64
      %1657 = func.call @cc_intern(%1655, %1656) : (i64, i64) -> i64
      %1658 = func.call @cc_nil_value() : () -> i64
      %1659 = func.call @cc_cons(%1657, %1658) : (i64, i64) -> i64
      %1660 = func.call @cc_values_pack(%1659) : (i64) -> i64
      %1661 = func.call @cc_cons(%1657, %1652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1661) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1662 = func.call @stack_pop_pointer() : () -> i64
      %1663 = func.call @stack_pop_pointer() : () -> i64
      %1664 = func.call @cc_cons(%1663, %1662) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %1665 = arith.addi %1664, %__rlasp_stack_elide_zero_122 : i64
      %1666 = func.call @stack_pop_pointer() : () -> i64
      %1667 = func.call @cc_cons(%1666, %1665) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %1668 = arith.addi %1667, %__rlasp_stack_elide_zero_123 : i64
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = func.call @cc_cons(%1669, %1668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1670) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1671 = func.call @stack_pop_pointer() : () -> i64
      %1672 = func.call @stack_pop_pointer() : () -> i64
      %1673 = func.call @cc_cons(%1672, %1671) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %1674 = arith.addi %1673, %__rlasp_stack_elide_zero_124 : i64
      %1675 = func.call @stack_pop_pointer() : () -> i64
      %1676 = func.call @cc_cons(%1675, %1674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1676) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1677 = func.call @stack_pop_pointer() : () -> i64
      %1678 = func.call @stack_pop_pointer() : () -> i64
      %1679 = func.call @cc_cons(%1678, %1677) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %1680 = arith.addi %1679, %__rlasp_stack_elide_zero_125 : i64
      %1681 = func.call @stack_pop_pointer() : () -> i64
      %1682 = func.call @cc_cons(%1681, %1680) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %1683 = arith.addi %1682, %__rlasp_stack_elide_zero_126 : i64
      %1684 = func.call @stack_pop_pointer() : () -> i64
      %1685 = func.call @cc_cons(%1684, %1683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1685) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1686 = func.call @stack_pop_pointer() : () -> i64
      %1687 = func.call @stack_pop_pointer() : () -> i64
      %1688 = func.call @cc_cons(%1687, %1686) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %1689 = arith.addi %1688, %__rlasp_stack_elide_zero_127 : i64
      %1690 = func.call @stack_pop_pointer() : () -> i64
      %1691 = func.call @cc_cons(%1690, %1689) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %1692 = arith.addi %1691, %__rlasp_stack_elide_zero_128 : i64
      %1769 = arith.constant 47863920852996 : i64
      %1770 = arith.constant 0 : i64
      %1771 = func.call @cc_make_closure(%1769, %1770) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %1772 = arith.addi %1771, %__rlasp_stack_elide_zero_129 : i64
      %1773 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1774 = arith.constant 4 : i64
      %1775 = func.call @cc_make_string(%1773, %1774) : (!llvm.ptr, i64) -> i64
      %1776 = func.call @cc_nil_value() : () -> i64
      %1777 = func.call @cc_intern(%1775, %1776) : (i64, i64) -> i64
      %1778 = func.call @cc_nil_value() : () -> i64
      %1779 = func.call @cc_cons(%1777, %1778) : (i64, i64) -> i64
      %1780 = func.call @cc_values_pack(%1779) : (i64) -> i64
      func.call @stack_push_pointer(%1777) : (i64) -> ()
      %1781 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1782 = arith.constant 13 : i64
      %1783 = func.call @cc_make_string(%1781, %1782) : (!llvm.ptr, i64) -> i64
      %1784 = func.call @cc_nil_value() : () -> i64
      %1785 = func.call @cc_intern(%1783, %1784) : (i64, i64) -> i64
      %1786 = func.call @cc_nil_value() : () -> i64
      %1787 = func.call @cc_cons(%1785, %1786) : (i64, i64) -> i64
      %1788 = func.call @cc_values_pack(%1787) : (i64) -> i64
      func.call @stack_push_pointer(%1785) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1789 = func.call @stack_pop_pointer() : () -> i64
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = func.call @cc_cons(%1790, %1789) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %1792 = arith.addi %1791, %__rlasp_stack_elide_zero_130 : i64
      %1793 = func.call @stack_pop_pointer() : () -> i64
      %1794 = func.call @cc_cons(%1793, %1792) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %1795 = arith.addi %1794, %__rlasp_stack_elide_zero_131 : i64
      %1796 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1797 = arith.constant 11 : i64
      %1798 = func.call @cc_make_string(%1796, %1797) : (!llvm.ptr, i64) -> i64
      %1799 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1800 = arith.constant 7 : i64
      %1801 = func.call @cc_make_string(%1799, %1800) : (!llvm.ptr, i64) -> i64
      %1802 = func.call @cc_intern(%1798, %1801) : (i64, i64) -> i64
      %1803 = func.call @cc_nil_value() : () -> i64
      %1804 = func.call @cc_cons(%1802, %1803) : (i64, i64) -> i64
      %1805 = func.call @cc_values_pack(%1804) : (i64) -> i64
      %1806 = func.call @cc_nil_value() : () -> i64
      %1807 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1808 = arith.constant 4 : i64
      %1809 = func.call @cc_make_string(%1807, %1808) : (!llvm.ptr, i64) -> i64
      %1810 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1811 = arith.constant 7 : i64
      %1812 = func.call @cc_make_string(%1810, %1811) : (!llvm.ptr, i64) -> i64
      %1813 = func.call @cc_intern(%1809, %1812) : (i64, i64) -> i64
      %1814 = func.call @cc_nil_value() : () -> i64
      %1815 = func.call @cc_cons(%1813, %1814) : (i64, i64) -> i64
      %1816 = func.call @cc_values_pack(%1815) : (i64) -> i64
      %1817 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1818 = arith.constant 5 : i64
      %1819 = func.call @cc_make_string(%1817, %1818) : (!llvm.ptr, i64) -> i64
      %1820 = func.call @cc_nil_value() : () -> i64
      %1821 = func.call @cc_intern(%1819, %1820) : (i64, i64) -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = func.call @cc_cons(%1821, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_values_pack(%1823) : (i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %1825 = arith.addi %1821, %__rlasp_stack_elide_zero_132 : i64
      %1826 = func.call @cc_nil_value() : () -> i64
      %1827 = func.call @cc_errorp(%1596) : (i64) -> i64
      %1828 = arith.cmpi ne, %1827, %1826 : i64
      %1829 = arith.cmpi eq, %1826, %1826 : i64
      %1830 = arith.andi %1828, %1829 : i1
      %1831 = scf.if %1830 -> (i64) {
        scf.yield %1596 : i64
      } else {
        scf.yield %1826 : i64
      }
      %1832 = func.call @cc_errorp(%1692) : (i64) -> i64
      %1833 = arith.cmpi ne, %1832, %1826 : i64
      %1834 = arith.cmpi eq, %1831, %1826 : i64
      %1835 = arith.andi %1833, %1834 : i1
      %1836 = scf.if %1835 -> (i64) {
        scf.yield %1692 : i64
      } else {
        scf.yield %1831 : i64
      }
      %1837 = func.call @cc_errorp(%1772) : (i64) -> i64
      %1838 = arith.cmpi ne, %1837, %1826 : i64
      %1839 = arith.cmpi eq, %1836, %1826 : i64
      %1840 = arith.andi %1838, %1839 : i1
      %1841 = scf.if %1840 -> (i64) {
        scf.yield %1772 : i64
      } else {
        scf.yield %1836 : i64
      }
      %1842 = func.call @cc_errorp(%1795) : (i64) -> i64
      %1843 = arith.cmpi ne, %1842, %1826 : i64
      %1844 = arith.cmpi eq, %1841, %1826 : i64
      %1845 = arith.andi %1843, %1844 : i1
      %1846 = scf.if %1845 -> (i64) {
        scf.yield %1795 : i64
      } else {
        scf.yield %1841 : i64
      }
      %1847 = func.call @cc_errorp(%1802) : (i64) -> i64
      %1848 = arith.cmpi ne, %1847, %1826 : i64
      %1849 = arith.cmpi eq, %1846, %1826 : i64
      %1850 = arith.andi %1848, %1849 : i1
      %1851 = scf.if %1850 -> (i64) {
        scf.yield %1802 : i64
      } else {
        scf.yield %1846 : i64
      }
      %1852 = func.call @cc_errorp(%1806) : (i64) -> i64
      %1853 = arith.cmpi ne, %1852, %1826 : i64
      %1854 = arith.cmpi eq, %1851, %1826 : i64
      %1855 = arith.andi %1853, %1854 : i1
      %1856 = scf.if %1855 -> (i64) {
        scf.yield %1806 : i64
      } else {
        scf.yield %1851 : i64
      }
      %1857 = func.call @cc_errorp(%1813) : (i64) -> i64
      %1858 = arith.cmpi ne, %1857, %1826 : i64
      %1859 = arith.cmpi eq, %1856, %1826 : i64
      %1860 = arith.andi %1858, %1859 : i1
      %1861 = scf.if %1860 -> (i64) {
        scf.yield %1813 : i64
      } else {
        scf.yield %1856 : i64
      }
      %1862 = func.call @cc_errorp(%1825) : (i64) -> i64
      %1863 = arith.cmpi ne, %1862, %1826 : i64
      %1864 = arith.cmpi eq, %1861, %1826 : i64
      %1865 = arith.andi %1863, %1864 : i1
      %1866 = scf.if %1865 -> (i64) {
        scf.yield %1825 : i64
      } else {
        scf.yield %1861 : i64
      }
      %1867 = arith.cmpi ne, %1866, %1826 : i64
      scf.if %1867 {
        func.call @stack_push_pointer(%1866) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1596) : (i64) -> ()
        func.call @stack_push_pointer(%1692) : (i64) -> ()
        func.call @stack_push_pointer(%1772) : (i64) -> ()
        func.call @stack_push_pointer(%1795) : (i64) -> ()
        func.call @stack_push_pointer(%1802) : (i64) -> ()
        func.call @stack_push_pointer(%1806) : (i64) -> ()
        func.call @stack_push_pointer(%1813) : (i64) -> ()
        func.call @stack_push_pointer(%1825) : (i64) -> ()
        %1868 = llvm.mlir.addressof @str177 : !llvm.ptr
        %1869 = func.call @cc_make_function_ref_const(%1868) : (!llvm.ptr) -> i64
        %1870 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1869, %1870) : (i64, i64) -> ()
      }
      %1871 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1871 : i64
    }
    %1872 = func.call @cc_nil_value() : () -> i64
    %1873 = func.call @cc_errorp(%1587) : (i64) -> i64
    %1874 = arith.cmpi ne, %1873, %1872 : i64
    %1875 = scf.if %1874 -> (i64) {
      scf.yield %1587 : i64
    } else {
      %1876 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1877 = arith.constant 13 : i64
      %1878 = func.call @cc_make_string(%1876, %1877) : (!llvm.ptr, i64) -> i64
      %1879 = func.call @cc_nil_value() : () -> i64
      %1880 = func.call @cc_intern(%1878, %1879) : (i64, i64) -> i64
      %1881 = func.call @cc_nil_value() : () -> i64
      %1882 = func.call @cc_cons(%1880, %1881) : (i64, i64) -> i64
      %1883 = func.call @cc_values_pack(%1882) : (i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %1884 = arith.addi %1880, %__rlasp_stack_elide_zero_133 : i64
      %1885 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1886 = arith.constant 13 : i64
      %1887 = func.call @cc_make_string(%1885, %1886) : (!llvm.ptr, i64) -> i64
      %1888 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1889 = arith.constant 11 : i64
      %1890 = func.call @cc_make_string(%1888, %1889) : (!llvm.ptr, i64) -> i64
      %1891 = func.call @cc_intern(%1887, %1890) : (i64, i64) -> i64
      %1892 = func.call @cc_nil_value() : () -> i64
      %1893 = func.call @cc_cons(%1891, %1892) : (i64, i64) -> i64
      %1894 = func.call @cc_values_pack(%1893) : (i64) -> i64
      func.call @stack_push_pointer(%1891) : (i64) -> ()
      %1895 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1896 = arith.constant 6 : i64
      %1897 = func.call @cc_make_string(%1895, %1896) : (!llvm.ptr, i64) -> i64
      %1898 = func.call @cc_nil_value() : () -> i64
      %1899 = func.call @cc_intern(%1897, %1898) : (i64, i64) -> i64
      %1900 = func.call @cc_nil_value() : () -> i64
      %1901 = func.call @cc_cons(%1899, %1900) : (i64, i64) -> i64
      %1902 = func.call @cc_values_pack(%1901) : (i64) -> i64
      func.call @stack_push_pointer(%1899) : (i64) -> ()
      %1903 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1904 = arith.constant 19 : i64
      %1905 = func.call @cc_make_string(%1903, %1904) : (!llvm.ptr, i64) -> i64
      %1906 = func.call @cc_nil_value() : () -> i64
      %1907 = func.call @cc_intern(%1905, %1906) : (i64, i64) -> i64
      %1908 = func.call @cc_nil_value() : () -> i64
      %1909 = func.call @cc_cons(%1907, %1908) : (i64, i64) -> i64
      %1910 = func.call @cc_values_pack(%1909) : (i64) -> i64
      func.call @stack_push_pointer(%1907) : (i64) -> ()
      %1911 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1912 = arith.constant 10 : i64
      %1913 = func.call @cc_make_string(%1911, %1912) : (!llvm.ptr, i64) -> i64
      %1914 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1915 = arith.constant 11 : i64
      %1916 = func.call @cc_make_string(%1914, %1915) : (!llvm.ptr, i64) -> i64
      %1917 = func.call @cc_intern(%1913, %1916) : (i64, i64) -> i64
      %1918 = func.call @cc_nil_value() : () -> i64
      %1919 = func.call @cc_cons(%1917, %1918) : (i64, i64) -> i64
      %1920 = func.call @cc_values_pack(%1919) : (i64) -> i64
      func.call @stack_push_pointer(%1917) : (i64) -> ()
      %1921 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1922 = arith.constant 11 : i64
      %1923 = func.call @cc_make_string(%1921, %1922) : (!llvm.ptr, i64) -> i64
      %1924 = func.call @cc_nil_value() : () -> i64
      %1925 = func.call @cc_intern(%1923, %1924) : (i64, i64) -> i64
      %1926 = func.call @cc_nil_value() : () -> i64
      %1927 = func.call @cc_cons(%1925, %1926) : (i64, i64) -> i64
      %1928 = func.call @cc_values_pack(%1927) : (i64) -> i64
      func.call @stack_push_pointer(%1925) : (i64) -> ()
      %1929 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1929) : (i64) -> ()
      %1930 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1931 = arith.constant 4 : i64
      %1932 = func.call @cc_make_string(%1930, %1931) : (!llvm.ptr, i64) -> i64
      %1933 = func.call @cc_nil_value() : () -> i64
      %1934 = func.call @cc_intern(%1932, %1933) : (i64, i64) -> i64
      %1935 = func.call @cc_nil_value() : () -> i64
      %1936 = func.call @cc_cons(%1934, %1935) : (i64, i64) -> i64
      %1937 = func.call @cc_values_pack(%1936) : (i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %1938 = arith.addi %1934, %__rlasp_stack_elide_zero_134 : i64
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @cc_cons(%1938, %1939) : (i64, i64) -> i64
      %1941 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1942 = arith.constant 5 : i64
      %1943 = func.call @cc_make_string(%1941, %1942) : (!llvm.ptr, i64) -> i64
      %1944 = func.call @cc_nil_value() : () -> i64
      %1945 = func.call @cc_intern(%1943, %1944) : (i64, i64) -> i64
      %1946 = func.call @cc_nil_value() : () -> i64
      %1947 = func.call @cc_cons(%1945, %1946) : (i64, i64) -> i64
      %1948 = func.call @cc_values_pack(%1947) : (i64) -> i64
      %1949 = func.call @cc_cons(%1945, %1940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1949) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1950 = func.call @stack_pop_pointer() : () -> i64
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @cc_cons(%1951, %1950) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %1953 = arith.addi %1952, %__rlasp_stack_elide_zero_135 : i64
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @cc_cons(%1954, %1953) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %1956 = arith.addi %1955, %__rlasp_stack_elide_zero_136 : i64
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @cc_cons(%1957, %1956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1958) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1959 = func.call @stack_pop_pointer() : () -> i64
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @cc_cons(%1960, %1959) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %1962 = arith.addi %1961, %__rlasp_stack_elide_zero_137 : i64
      %1963 = func.call @stack_pop_pointer() : () -> i64
      %1964 = func.call @cc_cons(%1963, %1962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1964) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1965 = func.call @stack_pop_pointer() : () -> i64
      %1966 = func.call @stack_pop_pointer() : () -> i64
      %1967 = func.call @cc_cons(%1966, %1965) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %1968 = arith.addi %1967, %__rlasp_stack_elide_zero_138 : i64
      %1969 = func.call @stack_pop_pointer() : () -> i64
      %1970 = func.call @cc_cons(%1969, %1968) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %1971 = arith.addi %1970, %__rlasp_stack_elide_zero_139 : i64
      %1972 = func.call @stack_pop_pointer() : () -> i64
      %1973 = func.call @cc_cons(%1972, %1971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1973) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1974 = func.call @stack_pop_pointer() : () -> i64
      %1975 = func.call @stack_pop_pointer() : () -> i64
      %1976 = func.call @cc_cons(%1975, %1974) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %1977 = arith.addi %1976, %__rlasp_stack_elide_zero_140 : i64
      %1978 = func.call @stack_pop_pointer() : () -> i64
      %1979 = func.call @cc_cons(%1978, %1977) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %1980 = arith.addi %1979, %__rlasp_stack_elide_zero_141 : i64
      %2057 = arith.constant 47863920852997 : i64
      %2058 = arith.constant 0 : i64
      %2059 = func.call @cc_make_closure(%2057, %2058) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %2060 = arith.addi %2059, %__rlasp_stack_elide_zero_142 : i64
      %2061 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2062 = arith.constant 4 : i64
      %2063 = func.call @cc_make_string(%2061, %2062) : (!llvm.ptr, i64) -> i64
      %2064 = func.call @cc_nil_value() : () -> i64
      %2065 = func.call @cc_intern(%2063, %2064) : (i64, i64) -> i64
      %2066 = func.call @cc_nil_value() : () -> i64
      %2067 = func.call @cc_cons(%2065, %2066) : (i64, i64) -> i64
      %2068 = func.call @cc_values_pack(%2067) : (i64) -> i64
      func.call @stack_push_pointer(%2065) : (i64) -> ()
      %2069 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2070 = arith.constant 13 : i64
      %2071 = func.call @cc_make_string(%2069, %2070) : (!llvm.ptr, i64) -> i64
      %2072 = func.call @cc_nil_value() : () -> i64
      %2073 = func.call @cc_intern(%2071, %2072) : (i64, i64) -> i64
      %2074 = func.call @cc_nil_value() : () -> i64
      %2075 = func.call @cc_cons(%2073, %2074) : (i64, i64) -> i64
      %2076 = func.call @cc_values_pack(%2075) : (i64) -> i64
      func.call @stack_push_pointer(%2073) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2077 = func.call @stack_pop_pointer() : () -> i64
      %2078 = func.call @stack_pop_pointer() : () -> i64
      %2079 = func.call @cc_cons(%2078, %2077) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %2080 = arith.addi %2079, %__rlasp_stack_elide_zero_143 : i64
      %2081 = func.call @stack_pop_pointer() : () -> i64
      %2082 = func.call @cc_cons(%2081, %2080) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %2083 = arith.addi %2082, %__rlasp_stack_elide_zero_144 : i64
      %2084 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2085 = arith.constant 11 : i64
      %2086 = func.call @cc_make_string(%2084, %2085) : (!llvm.ptr, i64) -> i64
      %2087 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2088 = arith.constant 7 : i64
      %2089 = func.call @cc_make_string(%2087, %2088) : (!llvm.ptr, i64) -> i64
      %2090 = func.call @cc_intern(%2086, %2089) : (i64, i64) -> i64
      %2091 = func.call @cc_nil_value() : () -> i64
      %2092 = func.call @cc_cons(%2090, %2091) : (i64, i64) -> i64
      %2093 = func.call @cc_values_pack(%2092) : (i64) -> i64
      %2094 = func.call @cc_nil_value() : () -> i64
      %2095 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2096 = arith.constant 4 : i64
      %2097 = func.call @cc_make_string(%2095, %2096) : (!llvm.ptr, i64) -> i64
      %2098 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2099 = arith.constant 7 : i64
      %2100 = func.call @cc_make_string(%2098, %2099) : (!llvm.ptr, i64) -> i64
      %2101 = func.call @cc_intern(%2097, %2100) : (i64, i64) -> i64
      %2102 = func.call @cc_nil_value() : () -> i64
      %2103 = func.call @cc_cons(%2101, %2102) : (i64, i64) -> i64
      %2104 = func.call @cc_values_pack(%2103) : (i64) -> i64
      %2105 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2106 = arith.constant 5 : i64
      %2107 = func.call @cc_make_string(%2105, %2106) : (!llvm.ptr, i64) -> i64
      %2108 = func.call @cc_nil_value() : () -> i64
      %2109 = func.call @cc_intern(%2107, %2108) : (i64, i64) -> i64
      %2110 = func.call @cc_nil_value() : () -> i64
      %2111 = func.call @cc_cons(%2109, %2110) : (i64, i64) -> i64
      %2112 = func.call @cc_values_pack(%2111) : (i64) -> i64
      %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
      %2113 = arith.addi %2109, %__rlasp_stack_elide_zero_145 : i64
      %2114 = func.call @cc_nil_value() : () -> i64
      %2115 = func.call @cc_errorp(%1884) : (i64) -> i64
      %2116 = arith.cmpi ne, %2115, %2114 : i64
      %2117 = arith.cmpi eq, %2114, %2114 : i64
      %2118 = arith.andi %2116, %2117 : i1
      %2119 = scf.if %2118 -> (i64) {
        scf.yield %1884 : i64
      } else {
        scf.yield %2114 : i64
      }
      %2120 = func.call @cc_errorp(%1980) : (i64) -> i64
      %2121 = arith.cmpi ne, %2120, %2114 : i64
      %2122 = arith.cmpi eq, %2119, %2114 : i64
      %2123 = arith.andi %2121, %2122 : i1
      %2124 = scf.if %2123 -> (i64) {
        scf.yield %1980 : i64
      } else {
        scf.yield %2119 : i64
      }
      %2125 = func.call @cc_errorp(%2060) : (i64) -> i64
      %2126 = arith.cmpi ne, %2125, %2114 : i64
      %2127 = arith.cmpi eq, %2124, %2114 : i64
      %2128 = arith.andi %2126, %2127 : i1
      %2129 = scf.if %2128 -> (i64) {
        scf.yield %2060 : i64
      } else {
        scf.yield %2124 : i64
      }
      %2130 = func.call @cc_errorp(%2083) : (i64) -> i64
      %2131 = arith.cmpi ne, %2130, %2114 : i64
      %2132 = arith.cmpi eq, %2129, %2114 : i64
      %2133 = arith.andi %2131, %2132 : i1
      %2134 = scf.if %2133 -> (i64) {
        scf.yield %2083 : i64
      } else {
        scf.yield %2129 : i64
      }
      %2135 = func.call @cc_errorp(%2090) : (i64) -> i64
      %2136 = arith.cmpi ne, %2135, %2114 : i64
      %2137 = arith.cmpi eq, %2134, %2114 : i64
      %2138 = arith.andi %2136, %2137 : i1
      %2139 = scf.if %2138 -> (i64) {
        scf.yield %2090 : i64
      } else {
        scf.yield %2134 : i64
      }
      %2140 = func.call @cc_errorp(%2094) : (i64) -> i64
      %2141 = arith.cmpi ne, %2140, %2114 : i64
      %2142 = arith.cmpi eq, %2139, %2114 : i64
      %2143 = arith.andi %2141, %2142 : i1
      %2144 = scf.if %2143 -> (i64) {
        scf.yield %2094 : i64
      } else {
        scf.yield %2139 : i64
      }
      %2145 = func.call @cc_errorp(%2101) : (i64) -> i64
      %2146 = arith.cmpi ne, %2145, %2114 : i64
      %2147 = arith.cmpi eq, %2144, %2114 : i64
      %2148 = arith.andi %2146, %2147 : i1
      %2149 = scf.if %2148 -> (i64) {
        scf.yield %2101 : i64
      } else {
        scf.yield %2144 : i64
      }
      %2150 = func.call @cc_errorp(%2113) : (i64) -> i64
      %2151 = arith.cmpi ne, %2150, %2114 : i64
      %2152 = arith.cmpi eq, %2149, %2114 : i64
      %2153 = arith.andi %2151, %2152 : i1
      %2154 = scf.if %2153 -> (i64) {
        scf.yield %2113 : i64
      } else {
        scf.yield %2149 : i64
      }
      %2155 = arith.cmpi ne, %2154, %2114 : i64
      scf.if %2155 {
        func.call @stack_push_pointer(%2154) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1884) : (i64) -> ()
        func.call @stack_push_pointer(%1980) : (i64) -> ()
        func.call @stack_push_pointer(%2060) : (i64) -> ()
        func.call @stack_push_pointer(%2083) : (i64) -> ()
        func.call @stack_push_pointer(%2090) : (i64) -> ()
        func.call @stack_push_pointer(%2094) : (i64) -> ()
        func.call @stack_push_pointer(%2101) : (i64) -> ()
        func.call @stack_push_pointer(%2113) : (i64) -> ()
        %2156 = llvm.mlir.addressof @str198 : !llvm.ptr
        %2157 = func.call @cc_make_function_ref_const(%2156) : (!llvm.ptr) -> i64
        %2158 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2157, %2158) : (i64, i64) -> ()
      }
      %2159 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2159 : i64
    }
    %2160 = func.call @cc_nil_value() : () -> i64
    %2161 = func.call @cc_errorp(%1875) : (i64) -> i64
    %2162 = arith.cmpi ne, %2161, %2160 : i64
    %2163 = scf.if %2162 -> (i64) {
      scf.yield %1875 : i64
    } else {
      %2169 = llvm.mlir.addressof @method_name_47863920852998 : !llvm.ptr
      %2170 = func.call @cc_make_lambda_ref_str(%2169) : (!llvm.ptr) -> i64
      %2171 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2172 = arith.constant 35 : i64
      %2173 = func.call @cc_make_string(%2171, %2172) : (!llvm.ptr, i64) -> i64
      %2174 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2175 = arith.constant 11 : i64
      %2176 = func.call @cc_make_string(%2174, %2175) : (!llvm.ptr, i64) -> i64
      %2177 = func.call @cc_intern(%2173, %2176) : (i64, i64) -> i64
      %2178 = func.call @cc_nil_value() : () -> i64
      %2179 = func.call @cc_cons(%2177, %2178) : (i64, i64) -> i64
      %2180 = func.call @cc_values_pack(%2179) : (i64) -> i64
      %2181 = func.call @cc_nil() : () -> i64
      %2182 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2183 = arith.constant 1 : i64
      %2184 = func.call @cc_make_string(%2182, %2183) : (!llvm.ptr, i64) -> i64
      %2185 = func.call @cc_nil_value() : () -> i64
      %2186 = func.call @cc_intern(%2184, %2185) : (i64, i64) -> i64
      %2187 = func.call @cc_nil_value() : () -> i64
      %2188 = func.call @cc_cons(%2186, %2187) : (i64, i64) -> i64
      %2189 = func.call @cc_values_pack(%2188) : (i64) -> i64
      %2190 = func.call @cc_cons(%2186, %2181) : (i64, i64) -> i64
      %2191 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2192 = arith.constant 1 : i64
      %2193 = func.call @cc_make_string(%2191, %2192) : (!llvm.ptr, i64) -> i64
      %2194 = func.call @cc_nil_value() : () -> i64
      %2195 = func.call @cc_intern(%2193, %2194) : (i64, i64) -> i64
      %2196 = func.call @cc_nil_value() : () -> i64
      %2197 = func.call @cc_cons(%2195, %2196) : (i64, i64) -> i64
      %2198 = func.call @cc_values_pack(%2197) : (i64) -> i64
      %2199 = func.call @cc_cons(%2195, %2190) : (i64, i64) -> i64
      %2200 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2201 = arith.constant 1 : i64
      %2202 = func.call @cc_make_string(%2200, %2201) : (!llvm.ptr, i64) -> i64
      %2203 = func.call @cc_nil_value() : () -> i64
      %2204 = func.call @cc_intern(%2202, %2203) : (i64, i64) -> i64
      %2205 = func.call @cc_nil_value() : () -> i64
      %2206 = func.call @cc_cons(%2204, %2205) : (i64, i64) -> i64
      %2207 = func.call @cc_values_pack(%2206) : (i64) -> i64
      %2208 = func.call @cc_cons(%2204, %2199) : (i64, i64) -> i64
      %2209 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2210 = arith.constant 1 : i64
      %2211 = func.call @cc_make_string(%2209, %2210) : (!llvm.ptr, i64) -> i64
      %2212 = func.call @cc_nil_value() : () -> i64
      %2213 = func.call @cc_intern(%2211, %2212) : (i64, i64) -> i64
      %2214 = func.call @cc_nil_value() : () -> i64
      %2215 = func.call @cc_cons(%2213, %2214) : (i64, i64) -> i64
      %2216 = func.call @cc_values_pack(%2215) : (i64) -> i64
      %2217 = func.call @cc_cons(%2213, %2208) : (i64, i64) -> i64
      %2218 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2219 = arith.constant 1 : i64
      %2220 = func.call @cc_make_string(%2218, %2219) : (!llvm.ptr, i64) -> i64
      %2221 = func.call @cc_nil_value() : () -> i64
      %2222 = func.call @cc_intern(%2220, %2221) : (i64, i64) -> i64
      %2223 = func.call @cc_nil_value() : () -> i64
      %2224 = func.call @cc_cons(%2222, %2223) : (i64, i64) -> i64
      %2225 = func.call @cc_values_pack(%2224) : (i64) -> i64
      %2226 = func.call @cc_cons(%2222, %2217) : (i64, i64) -> i64
      %2227 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2228 = arith.constant 16 : i64
      %2229 = func.call @cc_make_string(%2227, %2228) : (!llvm.ptr, i64) -> i64
      %2230 = func.call @cc_nil_value() : () -> i64
      %2231 = func.call @cc_intern(%2229, %2230) : (i64, i64) -> i64
      %2232 = func.call @cc_nil_value() : () -> i64
      %2233 = func.call @cc_cons(%2231, %2232) : (i64, i64) -> i64
      %2234 = func.call @cc_values_pack(%2233) : (i64) -> i64
      %2235 = func.call @cc_cons(%2231, %2226) : (i64, i64) -> i64
      %2236 = arith.constant 6 : i64
      %2237 = func.call @cc_box_fixnum(%2236) : (i64) -> i64
      %2238 = arith.constant 1 : i64
      %2239 = func.call @cc_defmethod_qualified(%2177, %2235, %2170, %2237, %2238) : (i64, i64, i64, i64, i64) -> i64
      %2240 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2240) : (i64) -> ()
      %2241 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2241) : (i64) -> ()
      %2242 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2242) : (i64) -> ()
      %2243 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2244 = arith.constant 8 : i64
      %2245 = func.call @cc_make_string(%2243, %2244) : (!llvm.ptr, i64) -> i64
      %2246 = func.call @cc_nil_value() : () -> i64
      %2247 = func.call @cc_intern(%2245, %2246) : (i64, i64) -> i64
      %2248 = func.call @cc_nil_value() : () -> i64
      %2249 = func.call @cc_cons(%2247, %2248) : (i64, i64) -> i64
      %2250 = func.call @cc_values_pack(%2249) : (i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %2251 = arith.addi %2247, %__rlasp_stack_elide_zero_146 : i64
      %2252 = func.call @stack_pop_pointer() : () -> i64
      %2253 = func.call @cc_cons(%2251, %2252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2253) : (i64) -> ()
      %2254 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2255 = arith.constant 13 : i64
      %2256 = func.call @cc_make_string(%2254, %2255) : (!llvm.ptr, i64) -> i64
      %2257 = func.call @cc_nil_value() : () -> i64
      %2258 = func.call @cc_intern(%2256, %2257) : (i64, i64) -> i64
      %2259 = func.call @cc_nil_value() : () -> i64
      %2260 = func.call @cc_cons(%2258, %2259) : (i64, i64) -> i64
      %2261 = func.call @cc_values_pack(%2260) : (i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %2262 = arith.addi %2258, %__rlasp_stack_elide_zero_147 : i64
      %2263 = func.call @stack_pop_pointer() : () -> i64
      %2264 = func.call @cc_cons(%2262, %2263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2264) : (i64) -> ()
      %2265 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2266 = arith.constant 15 : i64
      %2267 = func.call @cc_make_string(%2265, %2266) : (!llvm.ptr, i64) -> i64
      %2268 = func.call @cc_nil_value() : () -> i64
      %2269 = func.call @cc_intern(%2267, %2268) : (i64, i64) -> i64
      %2270 = func.call @cc_nil_value() : () -> i64
      %2271 = func.call @cc_cons(%2269, %2270) : (i64, i64) -> i64
      %2272 = func.call @cc_values_pack(%2271) : (i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %2273 = arith.addi %2269, %__rlasp_stack_elide_zero_148 : i64
      %2274 = func.call @stack_pop_pointer() : () -> i64
      %2275 = func.call @cc_cons(%2273, %2274) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2275) : (i64) -> ()
      %2276 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2277 = arith.constant 11 : i64
      %2278 = func.call @cc_make_string(%2276, %2277) : (!llvm.ptr, i64) -> i64
      %2279 = func.call @cc_nil_value() : () -> i64
      %2280 = func.call @cc_intern(%2278, %2279) : (i64, i64) -> i64
      %2281 = func.call @cc_nil_value() : () -> i64
      %2282 = func.call @cc_cons(%2280, %2281) : (i64, i64) -> i64
      %2283 = func.call @cc_values_pack(%2282) : (i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %2284 = arith.addi %2280, %__rlasp_stack_elide_zero_149 : i64
      %2285 = func.call @stack_pop_pointer() : () -> i64
      %2286 = func.call @cc_cons(%2284, %2285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2286) : (i64) -> ()
      %2287 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2288 = arith.constant 6 : i64
      %2289 = func.call @cc_make_string(%2287, %2288) : (!llvm.ptr, i64) -> i64
      %2290 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2291 = arith.constant 11 : i64
      %2292 = func.call @cc_make_string(%2290, %2291) : (!llvm.ptr, i64) -> i64
      %2293 = func.call @cc_intern(%2289, %2292) : (i64, i64) -> i64
      %2294 = func.call @cc_nil_value() : () -> i64
      %2295 = func.call @cc_cons(%2293, %2294) : (i64, i64) -> i64
      %2296 = func.call @cc_values_pack(%2295) : (i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %2297 = arith.addi %2293, %__rlasp_stack_elide_zero_150 : i64
      %2298 = func.call @stack_pop_pointer() : () -> i64
      %2299 = func.call @cc_cons(%2297, %2298) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %2300 = arith.addi %2299, %__rlasp_stack_elide_zero_151 : i64
      %2301 = func.call @stack_pop_pointer() : () -> i64
      %2302 = func.call @cc_cons(%2300, %2301) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2302) : (i64) -> ()
      %2303 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2304 = arith.constant 7 : i64
      %2305 = func.call @cc_make_string(%2303, %2304) : (!llvm.ptr, i64) -> i64
      %2306 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2307 = arith.constant 11 : i64
      %2308 = func.call @cc_make_string(%2306, %2307) : (!llvm.ptr, i64) -> i64
      %2309 = func.call @cc_intern(%2305, %2308) : (i64, i64) -> i64
      %2310 = func.call @cc_nil_value() : () -> i64
      %2311 = func.call @cc_cons(%2309, %2310) : (i64, i64) -> i64
      %2312 = func.call @cc_values_pack(%2311) : (i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %2313 = arith.addi %2309, %__rlasp_stack_elide_zero_152 : i64
      %2314 = func.call @stack_pop_pointer() : () -> i64
      %2315 = func.call @cc_cons(%2313, %2314) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %2316 = arith.addi %2315, %__rlasp_stack_elide_zero_153 : i64
      %2317 = func.call @stack_pop_pointer() : () -> i64
      %2318 = func.call @cc_cons(%2316, %2317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2318) : (i64) -> ()
      %2319 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2319) : (i64) -> ()
      %2320 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2321 = arith.constant 8 : i64
      %2322 = func.call @cc_make_string(%2320, %2321) : (!llvm.ptr, i64) -> i64
      %2323 = func.call @cc_nil_value() : () -> i64
      %2324 = func.call @cc_intern(%2322, %2323) : (i64, i64) -> i64
      %2325 = func.call @cc_nil_value() : () -> i64
      %2326 = func.call @cc_cons(%2324, %2325) : (i64, i64) -> i64
      %2327 = func.call @cc_values_pack(%2326) : (i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %2328 = arith.addi %2324, %__rlasp_stack_elide_zero_154 : i64
      %2329 = func.call @stack_pop_pointer() : () -> i64
      %2330 = func.call @cc_cons(%2328, %2329) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2330) : (i64) -> ()
      %2331 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2332 = arith.constant 5 : i64
      %2333 = func.call @cc_make_string(%2331, %2332) : (!llvm.ptr, i64) -> i64
      %2334 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2335 = arith.constant 11 : i64
      %2336 = func.call @cc_make_string(%2334, %2335) : (!llvm.ptr, i64) -> i64
      %2337 = func.call @cc_intern(%2333, %2336) : (i64, i64) -> i64
      %2338 = func.call @cc_nil_value() : () -> i64
      %2339 = func.call @cc_cons(%2337, %2338) : (i64, i64) -> i64
      %2340 = func.call @cc_values_pack(%2339) : (i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %2341 = arith.addi %2337, %__rlasp_stack_elide_zero_155 : i64
      %2342 = func.call @stack_pop_pointer() : () -> i64
      %2343 = func.call @cc_cons(%2341, %2342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2343) : (i64) -> ()
      %2344 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2345 = arith.constant 13 : i64
      %2346 = func.call @cc_make_string(%2344, %2345) : (!llvm.ptr, i64) -> i64
      %2347 = func.call @cc_nil_value() : () -> i64
      %2348 = func.call @cc_intern(%2346, %2347) : (i64, i64) -> i64
      %2349 = func.call @cc_nil_value() : () -> i64
      %2350 = func.call @cc_cons(%2348, %2349) : (i64, i64) -> i64
      %2351 = func.call @cc_values_pack(%2350) : (i64) -> i64
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %2352 = arith.addi %2348, %__rlasp_stack_elide_zero_156 : i64
      %2353 = func.call @stack_pop_pointer() : () -> i64
      %2354 = func.call @cc_cons(%2352, %2353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2354) : (i64) -> ()
      %2355 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2356 = arith.constant 15 : i64
      %2357 = func.call @cc_make_string(%2355, %2356) : (!llvm.ptr, i64) -> i64
      %2358 = func.call @cc_nil_value() : () -> i64
      %2359 = func.call @cc_intern(%2357, %2358) : (i64, i64) -> i64
      %2360 = func.call @cc_nil_value() : () -> i64
      %2361 = func.call @cc_cons(%2359, %2360) : (i64, i64) -> i64
      %2362 = func.call @cc_values_pack(%2361) : (i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %2363 = arith.addi %2359, %__rlasp_stack_elide_zero_157 : i64
      %2364 = func.call @stack_pop_pointer() : () -> i64
      %2365 = func.call @cc_cons(%2363, %2364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2365) : (i64) -> ()
      %2366 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2367 = arith.constant 11 : i64
      %2368 = func.call @cc_make_string(%2366, %2367) : (!llvm.ptr, i64) -> i64
      %2369 = func.call @cc_nil_value() : () -> i64
      %2370 = func.call @cc_intern(%2368, %2369) : (i64, i64) -> i64
      %2371 = func.call @cc_nil_value() : () -> i64
      %2372 = func.call @cc_cons(%2370, %2371) : (i64, i64) -> i64
      %2373 = func.call @cc_values_pack(%2372) : (i64) -> i64
      %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
      %2374 = arith.addi %2370, %__rlasp_stack_elide_zero_158 : i64
      %2375 = func.call @stack_pop_pointer() : () -> i64
      %2376 = func.call @cc_cons(%2374, %2375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2376) : (i64) -> ()
      %2377 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2377) : (i64) -> ()
      %2378 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2379 = arith.constant 16 : i64
      %2380 = func.call @cc_make_string(%2378, %2379) : (!llvm.ptr, i64) -> i64
      %2381 = func.call @cc_nil_value() : () -> i64
      %2382 = func.call @cc_intern(%2380, %2381) : (i64, i64) -> i64
      %2383 = func.call @cc_nil_value() : () -> i64
      %2384 = func.call @cc_cons(%2382, %2383) : (i64, i64) -> i64
      %2385 = func.call @cc_values_pack(%2384) : (i64) -> i64
      %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
      %2386 = arith.addi %2382, %__rlasp_stack_elide_zero_159 : i64
      %2387 = func.call @stack_pop_pointer() : () -> i64
      %2388 = func.call @cc_cons(%2386, %2387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2388) : (i64) -> ()
      %2389 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2390 = arith.constant 8 : i64
      %2391 = func.call @cc_make_string(%2389, %2390) : (!llvm.ptr, i64) -> i64
      %2392 = func.call @cc_nil_value() : () -> i64
      %2393 = func.call @cc_intern(%2391, %2392) : (i64, i64) -> i64
      %2394 = func.call @cc_nil_value() : () -> i64
      %2395 = func.call @cc_cons(%2393, %2394) : (i64, i64) -> i64
      %2396 = func.call @cc_values_pack(%2395) : (i64) -> i64
      %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
      %2397 = arith.addi %2393, %__rlasp_stack_elide_zero_160 : i64
      %2398 = func.call @stack_pop_pointer() : () -> i64
      %2399 = func.call @cc_cons(%2397, %2398) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
      %2400 = arith.addi %2399, %__rlasp_stack_elide_zero_161 : i64
      %2401 = func.call @stack_pop_pointer() : () -> i64
      %2402 = func.call @cc_cons(%2400, %2401) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
      %2403 = arith.addi %2402, %__rlasp_stack_elide_zero_162 : i64
      %2404 = func.call @stack_pop_pointer() : () -> i64
      %2405 = func.call @cc_cons(%2403, %2404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2405) : (i64) -> ()
      %2406 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2407 = arith.constant 6 : i64
      %2408 = func.call @cc_make_string(%2406, %2407) : (!llvm.ptr, i64) -> i64
      %2409 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2410 = arith.constant 7 : i64
      %2411 = func.call @cc_make_string(%2409, %2410) : (!llvm.ptr, i64) -> i64
      %2412 = func.call @cc_intern(%2408, %2411) : (i64, i64) -> i64
      %2413 = func.call @cc_nil_value() : () -> i64
      %2414 = func.call @cc_cons(%2412, %2413) : (i64, i64) -> i64
      %2415 = func.call @cc_values_pack(%2414) : (i64) -> i64
      %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
      %2416 = arith.addi %2412, %__rlasp_stack_elide_zero_163 : i64
      %2417 = func.call @stack_pop_pointer() : () -> i64
      %2418 = func.call @cc_cons(%2416, %2417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2418) : (i64) -> ()
      %2419 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2420 = arith.constant 35 : i64
      %2421 = func.call @cc_make_string(%2419, %2420) : (!llvm.ptr, i64) -> i64
      %2422 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2423 = arith.constant 11 : i64
      %2424 = func.call @cc_make_string(%2422, %2423) : (!llvm.ptr, i64) -> i64
      %2425 = func.call @cc_intern(%2421, %2424) : (i64, i64) -> i64
      %2426 = func.call @cc_nil_value() : () -> i64
      %2427 = func.call @cc_cons(%2425, %2426) : (i64, i64) -> i64
      %2428 = func.call @cc_values_pack(%2427) : (i64) -> i64
      %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
      %2429 = arith.addi %2425, %__rlasp_stack_elide_zero_164 : i64
      %2430 = func.call @stack_pop_pointer() : () -> i64
      %2431 = func.call @cc_cons(%2429, %2430) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2431) : (i64) -> ()
      %2432 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2433 = arith.constant 9 : i64
      %2434 = func.call @cc_make_string(%2432, %2433) : (!llvm.ptr, i64) -> i64
      %2435 = func.call @cc_nil_value() : () -> i64
      %2436 = func.call @cc_intern(%2434, %2435) : (i64, i64) -> i64
      %2437 = func.call @cc_nil_value() : () -> i64
      %2438 = func.call @cc_cons(%2436, %2437) : (i64, i64) -> i64
      %2439 = func.call @cc_values_pack(%2438) : (i64) -> i64
      %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
      %2440 = arith.addi %2436, %__rlasp_stack_elide_zero_165 : i64
      %2441 = func.call @stack_pop_pointer() : () -> i64
      %2442 = func.call @cc_cons(%2440, %2441) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
      %2443 = arith.addi %2442, %__rlasp_stack_elide_zero_166 : i64
      %2444 = func.call @cc_nil_value() : () -> i64
      %2445 = func.call @cc_cons(%2443, %2444) : (i64, i64) -> i64
      %2446 = func.call @cc_eval(%2445) : (i64) -> i64
      %2447 = func.call @cc_multiple_value_list(%2446) : (i64) -> i64
      %2448 = func.call @cc_values_pack(%2447) : (i64) -> i64
      %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
      %2449 = arith.addi %2448, %__rlasp_stack_elide_zero_167 : i64
      scf.yield %2449 : i64
    }
    %2450 = func.call @cc_nil_value() : () -> i64
    %2451 = func.call @cc_errorp(%2163) : (i64) -> i64
    %2452 = arith.cmpi ne, %2451, %2450 : i64
    %2453 = scf.if %2452 -> (i64) {
      scf.yield %2163 : i64
    } else {
      %2454 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2455 = arith.constant 13 : i64
      %2456 = func.call @cc_make_string(%2454, %2455) : (!llvm.ptr, i64) -> i64
      %2457 = func.call @cc_nil_value() : () -> i64
      %2458 = func.call @cc_intern(%2456, %2457) : (i64, i64) -> i64
      %2459 = func.call @cc_nil_value() : () -> i64
      %2460 = func.call @cc_cons(%2458, %2459) : (i64, i64) -> i64
      %2461 = func.call @cc_values_pack(%2460) : (i64) -> i64
      %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
      %2462 = arith.addi %2458, %__rlasp_stack_elide_zero_168 : i64
      %2463 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2464 = arith.constant 10 : i64
      %2465 = func.call @cc_make_string(%2463, %2464) : (!llvm.ptr, i64) -> i64
      %2466 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2467 = arith.constant 11 : i64
      %2468 = func.call @cc_make_string(%2466, %2467) : (!llvm.ptr, i64) -> i64
      %2469 = func.call @cc_intern(%2465, %2468) : (i64, i64) -> i64
      %2470 = func.call @cc_nil_value() : () -> i64
      %2471 = func.call @cc_cons(%2469, %2470) : (i64, i64) -> i64
      %2472 = func.call @cc_values_pack(%2471) : (i64) -> i64
      func.call @stack_push_pointer(%2469) : (i64) -> ()
      %2473 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2474 = arith.constant 11 : i64
      %2475 = func.call @cc_make_string(%2473, %2474) : (!llvm.ptr, i64) -> i64
      %2476 = func.call @cc_nil_value() : () -> i64
      %2477 = func.call @cc_intern(%2475, %2476) : (i64, i64) -> i64
      %2478 = func.call @cc_nil_value() : () -> i64
      %2479 = func.call @cc_cons(%2477, %2478) : (i64, i64) -> i64
      %2480 = func.call @cc_values_pack(%2479) : (i64) -> i64
      func.call @stack_push_pointer(%2477) : (i64) -> ()
      %2481 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2481) : (i64) -> ()
      %2482 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2483 = arith.constant 4 : i64
      %2484 = func.call @cc_make_string(%2482, %2483) : (!llvm.ptr, i64) -> i64
      %2485 = func.call @cc_nil_value() : () -> i64
      %2486 = func.call @cc_intern(%2484, %2485) : (i64, i64) -> i64
      %2487 = func.call @cc_nil_value() : () -> i64
      %2488 = func.call @cc_cons(%2486, %2487) : (i64, i64) -> i64
      %2489 = func.call @cc_values_pack(%2488) : (i64) -> i64
      %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
      %2490 = arith.addi %2486, %__rlasp_stack_elide_zero_169 : i64
      %2491 = func.call @stack_pop_pointer() : () -> i64
      %2492 = func.call @cc_cons(%2490, %2491) : (i64, i64) -> i64
      %2493 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2494 = arith.constant 5 : i64
      %2495 = func.call @cc_make_string(%2493, %2494) : (!llvm.ptr, i64) -> i64
      %2496 = func.call @cc_nil_value() : () -> i64
      %2497 = func.call @cc_intern(%2495, %2496) : (i64, i64) -> i64
      %2498 = func.call @cc_nil_value() : () -> i64
      %2499 = func.call @cc_cons(%2497, %2498) : (i64, i64) -> i64
      %2500 = func.call @cc_values_pack(%2499) : (i64) -> i64
      %2501 = func.call @cc_cons(%2497, %2492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2502 = func.call @stack_pop_pointer() : () -> i64
      %2503 = func.call @stack_pop_pointer() : () -> i64
      %2504 = func.call @cc_cons(%2503, %2502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
      %2505 = arith.addi %2504, %__rlasp_stack_elide_zero_170 : i64
      %2506 = func.call @stack_pop_pointer() : () -> i64
      %2507 = func.call @cc_cons(%2506, %2505) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
      %2508 = arith.addi %2507, %__rlasp_stack_elide_zero_171 : i64
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @cc_cons(%2509, %2508) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
      %2511 = arith.addi %2510, %__rlasp_stack_elide_zero_172 : i64
      %2551 = arith.constant 47863920852999 : i64
      %2552 = arith.constant 0 : i64
      %2553 = func.call @cc_make_closure(%2551, %2552) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
      %2554 = arith.addi %2553, %__rlasp_stack_elide_zero_173 : i64
      %2555 = arith.constant 42 : i64
      func.call @stack_push_fixnum(%2555) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2556 = func.call @stack_pop_pointer() : () -> i64
      %2557 = func.call @stack_pop_pointer() : () -> i64
      %2558 = func.call @cc_cons(%2557, %2556) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
      %2559 = arith.addi %2558, %__rlasp_stack_elide_zero_174 : i64
      %2560 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2561 = arith.constant 11 : i64
      %2562 = func.call @cc_make_string(%2560, %2561) : (!llvm.ptr, i64) -> i64
      %2563 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2564 = arith.constant 7 : i64
      %2565 = func.call @cc_make_string(%2563, %2564) : (!llvm.ptr, i64) -> i64
      %2566 = func.call @cc_intern(%2562, %2565) : (i64, i64) -> i64
      %2567 = func.call @cc_nil_value() : () -> i64
      %2568 = func.call @cc_cons(%2566, %2567) : (i64, i64) -> i64
      %2569 = func.call @cc_values_pack(%2568) : (i64) -> i64
      %2570 = func.call @cc_nil_value() : () -> i64
      %2571 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2572 = arith.constant 4 : i64
      %2573 = func.call @cc_make_string(%2571, %2572) : (!llvm.ptr, i64) -> i64
      %2574 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2575 = arith.constant 7 : i64
      %2576 = func.call @cc_make_string(%2574, %2575) : (!llvm.ptr, i64) -> i64
      %2577 = func.call @cc_intern(%2573, %2576) : (i64, i64) -> i64
      %2578 = func.call @cc_nil_value() : () -> i64
      %2579 = func.call @cc_cons(%2577, %2578) : (i64, i64) -> i64
      %2580 = func.call @cc_values_pack(%2579) : (i64) -> i64
      %2581 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2582 = arith.constant 6 : i64
      %2583 = func.call @cc_make_string(%2581, %2582) : (!llvm.ptr, i64) -> i64
      %2584 = func.call @cc_nil_value() : () -> i64
      %2585 = func.call @cc_intern(%2583, %2584) : (i64, i64) -> i64
      %2586 = func.call @cc_nil_value() : () -> i64
      %2587 = func.call @cc_cons(%2585, %2586) : (i64, i64) -> i64
      %2588 = func.call @cc_values_pack(%2587) : (i64) -> i64
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %2589 = arith.addi %2585, %__rlasp_stack_elide_zero_175 : i64
      %2590 = func.call @cc_nil_value() : () -> i64
      %2591 = func.call @cc_errorp(%2462) : (i64) -> i64
      %2592 = arith.cmpi ne, %2591, %2590 : i64
      %2593 = arith.cmpi eq, %2590, %2590 : i64
      %2594 = arith.andi %2592, %2593 : i1
      %2595 = scf.if %2594 -> (i64) {
        scf.yield %2462 : i64
      } else {
        scf.yield %2590 : i64
      }
      %2596 = func.call @cc_errorp(%2511) : (i64) -> i64
      %2597 = arith.cmpi ne, %2596, %2590 : i64
      %2598 = arith.cmpi eq, %2595, %2590 : i64
      %2599 = arith.andi %2597, %2598 : i1
      %2600 = scf.if %2599 -> (i64) {
        scf.yield %2511 : i64
      } else {
        scf.yield %2595 : i64
      }
      %2601 = func.call @cc_errorp(%2554) : (i64) -> i64
      %2602 = arith.cmpi ne, %2601, %2590 : i64
      %2603 = arith.cmpi eq, %2600, %2590 : i64
      %2604 = arith.andi %2602, %2603 : i1
      %2605 = scf.if %2604 -> (i64) {
        scf.yield %2554 : i64
      } else {
        scf.yield %2600 : i64
      }
      %2606 = func.call @cc_errorp(%2559) : (i64) -> i64
      %2607 = arith.cmpi ne, %2606, %2590 : i64
      %2608 = arith.cmpi eq, %2605, %2590 : i64
      %2609 = arith.andi %2607, %2608 : i1
      %2610 = scf.if %2609 -> (i64) {
        scf.yield %2559 : i64
      } else {
        scf.yield %2605 : i64
      }
      %2611 = func.call @cc_errorp(%2566) : (i64) -> i64
      %2612 = arith.cmpi ne, %2611, %2590 : i64
      %2613 = arith.cmpi eq, %2610, %2590 : i64
      %2614 = arith.andi %2612, %2613 : i1
      %2615 = scf.if %2614 -> (i64) {
        scf.yield %2566 : i64
      } else {
        scf.yield %2610 : i64
      }
      %2616 = func.call @cc_errorp(%2570) : (i64) -> i64
      %2617 = arith.cmpi ne, %2616, %2590 : i64
      %2618 = arith.cmpi eq, %2615, %2590 : i64
      %2619 = arith.andi %2617, %2618 : i1
      %2620 = scf.if %2619 -> (i64) {
        scf.yield %2570 : i64
      } else {
        scf.yield %2615 : i64
      }
      %2621 = func.call @cc_errorp(%2577) : (i64) -> i64
      %2622 = arith.cmpi ne, %2621, %2590 : i64
      %2623 = arith.cmpi eq, %2620, %2590 : i64
      %2624 = arith.andi %2622, %2623 : i1
      %2625 = scf.if %2624 -> (i64) {
        scf.yield %2577 : i64
      } else {
        scf.yield %2620 : i64
      }
      %2626 = func.call @cc_errorp(%2589) : (i64) -> i64
      %2627 = arith.cmpi ne, %2626, %2590 : i64
      %2628 = arith.cmpi eq, %2625, %2590 : i64
      %2629 = arith.andi %2627, %2628 : i1
      %2630 = scf.if %2629 -> (i64) {
        scf.yield %2589 : i64
      } else {
        scf.yield %2625 : i64
      }
      %2631 = arith.cmpi ne, %2630, %2590 : i64
      scf.if %2631 {
        func.call @stack_push_pointer(%2630) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2462) : (i64) -> ()
        func.call @stack_push_pointer(%2511) : (i64) -> ()
        func.call @stack_push_pointer(%2554) : (i64) -> ()
        func.call @stack_push_pointer(%2559) : (i64) -> ()
        func.call @stack_push_pointer(%2566) : (i64) -> ()
        func.call @stack_push_pointer(%2570) : (i64) -> ()
        func.call @stack_push_pointer(%2577) : (i64) -> ()
        func.call @stack_push_pointer(%2589) : (i64) -> ()
        %2632 = llvm.mlir.addressof @str243 : !llvm.ptr
        %2633 = func.call @cc_make_function_ref_const(%2632) : (!llvm.ptr) -> i64
        %2634 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2633, %2634) : (i64, i64) -> ()
      }
      %2635 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2635 : i64
    }
    %2636 = func.call @cc_nil_value() : () -> i64
    %2637 = func.call @cc_errorp(%2453) : (i64) -> i64
    %2638 = arith.cmpi ne, %2637, %2636 : i64
    %2639 = scf.if %2638 -> (i64) {
      scf.yield %2453 : i64
    } else {
      %2640 = func.call @cc_nil_value() : () -> i64
      %2641 = func.call @cc_nil_value() : () -> i64
      %2642 = func.call @cc_errorp(%2640) : (i64) -> i64
      %2643 = arith.cmpi ne, %2642, %2641 : i64
      %2644 = scf.if %2643 -> (i64) {
        scf.yield %2640 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %2645 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2646 = llvm.mlir.addressof @str244 : !llvm.ptr
        %2647 = arith.constant 5 : i64
        %2648 = func.call @cc_make_string(%2646, %2647) : (!llvm.ptr, i64) -> i64
        %2649 = llvm.mlir.addressof @str245 : !llvm.ptr
        %2650 = arith.constant 11 : i64
        %2651 = func.call @cc_make_string(%2649, %2650) : (!llvm.ptr, i64) -> i64
        %2652 = func.call @cc_intern(%2648, %2651) : (i64, i64) -> i64
        %2653 = func.call @cc_nil_value() : () -> i64
        %2654 = func.call @cc_cons(%2652, %2653) : (i64, i64) -> i64
        %2655 = func.call @cc_values_pack(%2654) : (i64) -> i64
        %2656 = func.call @stack_pop_pointer() : () -> i64
        %2657 = func.call @cc_cons(%2652, %2656) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
        %2658 = arith.addi %2657, %__rlasp_stack_elide_zero_176 : i64
        %2659 = llvm.mlir.addressof @str246 : !llvm.ptr
        %2660 = arith.constant 13 : i64
        %2661 = func.call @cc_make_string(%2659, %2660) : (!llvm.ptr, i64) -> i64
        %2662 = func.call @cc_nil_value() : () -> i64
        %2663 = func.call @cc_intern(%2661, %2662) : (i64, i64) -> i64
        %2664 = func.call @cc_nil_value() : () -> i64
        %2665 = func.call @cc_cons(%2663, %2664) : (i64, i64) -> i64
        %2666 = func.call @cc_values_pack(%2665) : (i64) -> i64
        %2667 = func.call @cc_defclass(%2663, %2645, %2658) : (i64, i64, i64) -> i64
        %2668 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2668) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %2669 = func.call @stack_pop_pointer() : () -> i64
        %2670 = func.call @stack_pop_pointer() : () -> i64
        %2671 = func.call @cc_cons(%2669, %2670) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2671) : (i64) -> ()
        %2672 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2672) : (i64) -> ()
        %2673 = llvm.mlir.addressof @str247 : !llvm.ptr
        %2674 = arith.constant 5 : i64
        %2675 = func.call @cc_make_string(%2673, %2674) : (!llvm.ptr, i64) -> i64
        %2676 = llvm.mlir.addressof @str248 : !llvm.ptr
        %2677 = arith.constant 11 : i64
        %2678 = func.call @cc_make_string(%2676, %2677) : (!llvm.ptr, i64) -> i64
        %2679 = func.call @cc_intern(%2675, %2678) : (i64, i64) -> i64
        %2680 = func.call @cc_nil_value() : () -> i64
        %2681 = func.call @cc_cons(%2679, %2680) : (i64, i64) -> i64
        %2682 = func.call @cc_values_pack(%2681) : (i64) -> i64
        %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
        %2683 = arith.addi %2679, %__rlasp_stack_elide_zero_177 : i64
        %2684 = func.call @stack_pop_pointer() : () -> i64
        %2685 = func.call @cc_cons(%2683, %2684) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
        %2686 = arith.addi %2685, %__rlasp_stack_elide_zero_178 : i64
        %2687 = func.call @stack_pop_pointer() : () -> i64
        %2688 = func.call @cc_cons(%2686, %2687) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2688) : (i64) -> ()
        %2689 = llvm.mlir.addressof @str249 : !llvm.ptr
        %2690 = arith.constant 13 : i64
        %2691 = func.call @cc_make_string(%2689, %2690) : (!llvm.ptr, i64) -> i64
        %2692 = func.call @cc_nil_value() : () -> i64
        %2693 = func.call @cc_intern(%2691, %2692) : (i64, i64) -> i64
        %2694 = func.call @cc_nil_value() : () -> i64
        %2695 = func.call @cc_cons(%2693, %2694) : (i64, i64) -> i64
        %2696 = func.call @cc_values_pack(%2695) : (i64) -> i64
        %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
        %2697 = arith.addi %2693, %__rlasp_stack_elide_zero_179 : i64
        %2698 = func.call @stack_pop_pointer() : () -> i64
        %2699 = func.call @cc_cons(%2697, %2698) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2699) : (i64) -> ()
        %2700 = llvm.mlir.addressof @str250 : !llvm.ptr
        %2701 = arith.constant 8 : i64
        %2702 = func.call @cc_make_string(%2700, %2701) : (!llvm.ptr, i64) -> i64
        %2703 = func.call @cc_nil_value() : () -> i64
        %2704 = func.call @cc_intern(%2702, %2703) : (i64, i64) -> i64
        %2705 = func.call @cc_nil_value() : () -> i64
        %2706 = func.call @cc_cons(%2704, %2705) : (i64, i64) -> i64
        %2707 = func.call @cc_values_pack(%2706) : (i64) -> i64
        %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
        %2708 = arith.addi %2704, %__rlasp_stack_elide_zero_180 : i64
        %2709 = func.call @stack_pop_pointer() : () -> i64
        %2710 = func.call @cc_cons(%2708, %2709) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
        %2711 = arith.addi %2710, %__rlasp_stack_elide_zero_181 : i64
        %2712 = func.call @cc_nil_value() : () -> i64
        %2713 = func.call @cc_cons(%2711, %2712) : (i64, i64) -> i64
        %2714 = func.call @cc_eval(%2713) : (i64) -> i64
        %2715 = func.call @cc_multiple_value_list(%2714) : (i64) -> i64
        %2716 = func.call @cc_values_pack(%2715) : (i64) -> i64
        func.call @stack_push_pointer(%2716) : (i64) -> ()
        %2717 = func.call @stack_depth() : () -> i64
        %2718 = arith.constant 0 : i64
        %2719 = arith.cmpi sgt, %2717, %2718 : i64
        scf.if %2719 {
          %2720 = func.call @stack_pop_pointer() : () -> i64
        }
        %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
        %2721 = arith.addi %2663, %__rlasp_stack_elide_zero_182 : i64
        scf.yield %2721 : i64
      }
      %2722 = func.call @cc_nil_value() : () -> i64
      %2723 = func.call @cc_errorp(%2644) : (i64) -> i64
      %2724 = arith.cmpi ne, %2723, %2722 : i64
      %2725 = scf.if %2724 -> (i64) {
        scf.yield %2644 : i64
      } else {
        %2726 = llvm.mlir.addressof @str251 : !llvm.ptr
        %2727 = arith.constant 13 : i64
        %2728 = func.call @cc_make_string(%2726, %2727) : (!llvm.ptr, i64) -> i64
        %2729 = func.call @cc_nil_value() : () -> i64
        %2730 = func.call @cc_intern(%2728, %2729) : (i64, i64) -> i64
        %2731 = func.call @cc_nil_value() : () -> i64
        %2732 = func.call @cc_cons(%2730, %2731) : (i64, i64) -> i64
        %2733 = func.call @cc_values_pack(%2732) : (i64) -> i64
        %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
        %2734 = arith.addi %2730, %__rlasp_stack_elide_zero_183 : i64
        scf.yield %2734 : i64
      }
      %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
      %2735 = arith.addi %2725, %__rlasp_stack_elide_zero_184 : i64
      scf.yield %2735 : i64
    }
    %2736 = func.call @cc_nil_value() : () -> i64
    %2737 = func.call @cc_errorp(%2639) : (i64) -> i64
    %2738 = arith.cmpi ne, %2737, %2736 : i64
    %2739 = scf.if %2738 -> (i64) {
      scf.yield %2639 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2740 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2741 = func.call @stack_pop_pointer() : () -> i64
      %2742 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2743 = arith.constant 9 : i64
      %2744 = func.call @cc_make_string(%2742, %2743) : (!llvm.ptr, i64) -> i64
      %2745 = func.call @cc_nil_value() : () -> i64
      %2746 = func.call @cc_intern(%2744, %2745) : (i64, i64) -> i64
      %2747 = func.call @cc_nil_value() : () -> i64
      %2748 = func.call @cc_cons(%2746, %2747) : (i64, i64) -> i64
      %2749 = func.call @cc_values_pack(%2748) : (i64) -> i64
      %2750 = func.call @cc_defclass(%2746, %2740, %2741) : (i64, i64, i64) -> i64
      %2751 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2752 = func.call @stack_pop_pointer() : () -> i64
      %2753 = func.call @stack_pop_pointer() : () -> i64
      %2754 = func.call @cc_cons(%2752, %2753) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2754) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2755 = func.call @stack_pop_pointer() : () -> i64
      %2756 = func.call @stack_pop_pointer() : () -> i64
      %2757 = func.call @cc_cons(%2755, %2756) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2757) : (i64) -> ()
      %2758 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2759 = arith.constant 9 : i64
      %2760 = func.call @cc_make_string(%2758, %2759) : (!llvm.ptr, i64) -> i64
      %2761 = func.call @cc_nil_value() : () -> i64
      %2762 = func.call @cc_intern(%2760, %2761) : (i64, i64) -> i64
      %2763 = func.call @cc_nil_value() : () -> i64
      %2764 = func.call @cc_cons(%2762, %2763) : (i64, i64) -> i64
      %2765 = func.call @cc_values_pack(%2764) : (i64) -> i64
      %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
      %2766 = arith.addi %2762, %__rlasp_stack_elide_zero_185 : i64
      %2767 = func.call @stack_pop_pointer() : () -> i64
      %2768 = func.call @cc_cons(%2766, %2767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2768) : (i64) -> ()
      %2769 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2770 = arith.constant 8 : i64
      %2771 = func.call @cc_make_string(%2769, %2770) : (!llvm.ptr, i64) -> i64
      %2772 = func.call @cc_nil_value() : () -> i64
      %2773 = func.call @cc_intern(%2771, %2772) : (i64, i64) -> i64
      %2774 = func.call @cc_nil_value() : () -> i64
      %2775 = func.call @cc_cons(%2773, %2774) : (i64, i64) -> i64
      %2776 = func.call @cc_values_pack(%2775) : (i64) -> i64
      %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
      %2777 = arith.addi %2773, %__rlasp_stack_elide_zero_186 : i64
      %2778 = func.call @stack_pop_pointer() : () -> i64
      %2779 = func.call @cc_cons(%2777, %2778) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
      %2780 = arith.addi %2779, %__rlasp_stack_elide_zero_187 : i64
      %2781 = func.call @cc_nil_value() : () -> i64
      %2782 = func.call @cc_cons(%2780, %2781) : (i64, i64) -> i64
      %2783 = func.call @cc_eval(%2782) : (i64) -> i64
      %2784 = func.call @cc_multiple_value_list(%2783) : (i64) -> i64
      %2785 = func.call @cc_values_pack(%2784) : (i64) -> i64
      func.call @stack_push_pointer(%2785) : (i64) -> ()
      %2786 = func.call @stack_depth() : () -> i64
      %2787 = arith.constant 0 : i64
      %2788 = arith.cmpi sgt, %2786, %2787 : i64
      scf.if %2788 {
        %2789 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
      %2790 = arith.addi %2746, %__rlasp_stack_elide_zero_188 : i64
      scf.yield %2790 : i64
    }
    %2791 = func.call @cc_nil_value() : () -> i64
    %2792 = func.call @cc_errorp(%2739) : (i64) -> i64
    %2793 = arith.cmpi ne, %2792, %2791 : i64
    %2794 = scf.if %2793 -> (i64) {
      scf.yield %2739 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2795 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2796 = arith.constant 4 : i64
      %2797 = func.call @cc_make_string(%2795, %2796) : (!llvm.ptr, i64) -> i64
      %2798 = func.call @cc_nil_value() : () -> i64
      %2799 = func.call @cc_intern(%2797, %2798) : (i64, i64) -> i64
      %2800 = func.call @cc_nil_value() : () -> i64
      %2801 = func.call @cc_cons(%2799, %2800) : (i64, i64) -> i64
      %2802 = func.call @cc_values_pack(%2801) : (i64) -> i64
      %2803 = func.call @stack_pop_pointer() : () -> i64
      %2804 = func.call @cc_cons(%2799, %2803) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
      %2805 = arith.addi %2804, %__rlasp_stack_elide_zero_189 : i64
      func.call @stack_push_nil() : () -> ()
      %2806 = func.call @stack_pop_pointer() : () -> i64
      %2807 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2808 = arith.constant 9 : i64
      %2809 = func.call @cc_make_string(%2807, %2808) : (!llvm.ptr, i64) -> i64
      %2810 = func.call @cc_nil_value() : () -> i64
      %2811 = func.call @cc_intern(%2809, %2810) : (i64, i64) -> i64
      %2812 = func.call @cc_nil_value() : () -> i64
      %2813 = func.call @cc_cons(%2811, %2812) : (i64, i64) -> i64
      %2814 = func.call @cc_values_pack(%2813) : (i64) -> i64
      %2815 = func.call @cc_defclass(%2811, %2805, %2806) : (i64, i64, i64) -> i64
      %2816 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2816) : (i64) -> ()
      %2817 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2817) : (i64) -> ()
      %2818 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2818) : (i64) -> ()
      %2819 = arith.constant 42 : i64
      func.call @stack_push_fixnum(%2819) : (i64) -> ()
      %2820 = func.call @stack_pop_pointer() : () -> i64
      %2821 = func.call @stack_pop_pointer() : () -> i64
      %2822 = func.call @cc_cons(%2820, %2821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2822) : (i64) -> ()
      %2823 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2824 = arith.constant 8 : i64
      %2825 = func.call @cc_make_string(%2823, %2824) : (!llvm.ptr, i64) -> i64
      %2826 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2827 = arith.constant 7 : i64
      %2828 = func.call @cc_make_string(%2826, %2827) : (!llvm.ptr, i64) -> i64
      %2829 = func.call @cc_intern(%2825, %2828) : (i64, i64) -> i64
      %2830 = func.call @cc_nil_value() : () -> i64
      %2831 = func.call @cc_cons(%2829, %2830) : (i64, i64) -> i64
      %2832 = func.call @cc_values_pack(%2831) : (i64) -> i64
      %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
      %2833 = arith.addi %2829, %__rlasp_stack_elide_zero_190 : i64
      %2834 = func.call @stack_pop_pointer() : () -> i64
      %2835 = func.call @cc_cons(%2833, %2834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2835) : (i64) -> ()
      %2836 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2837 = arith.constant 4 : i64
      %2838 = func.call @cc_make_string(%2836, %2837) : (!llvm.ptr, i64) -> i64
      %2839 = func.call @cc_nil_value() : () -> i64
      %2840 = func.call @cc_intern(%2838, %2839) : (i64, i64) -> i64
      %2841 = func.call @cc_nil_value() : () -> i64
      %2842 = func.call @cc_cons(%2840, %2841) : (i64, i64) -> i64
      %2843 = func.call @cc_values_pack(%2842) : (i64) -> i64
      %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
      %2844 = arith.addi %2840, %__rlasp_stack_elide_zero_191 : i64
      %2845 = func.call @stack_pop_pointer() : () -> i64
      %2846 = func.call @cc_cons(%2844, %2845) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
      %2847 = arith.addi %2846, %__rlasp_stack_elide_zero_192 : i64
      %2848 = func.call @stack_pop_pointer() : () -> i64
      %2849 = func.call @cc_cons(%2847, %2848) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
      %2850 = arith.addi %2849, %__rlasp_stack_elide_zero_193 : i64
      %2851 = func.call @stack_pop_pointer() : () -> i64
      %2852 = func.call @cc_cons(%2850, %2851) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2852) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2853 = func.call @stack_pop_pointer() : () -> i64
      %2854 = func.call @stack_pop_pointer() : () -> i64
      %2855 = func.call @cc_cons(%2853, %2854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2855) : (i64) -> ()
      %2856 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2857 = arith.constant 9 : i64
      %2858 = func.call @cc_make_string(%2856, %2857) : (!llvm.ptr, i64) -> i64
      %2859 = func.call @cc_nil_value() : () -> i64
      %2860 = func.call @cc_intern(%2858, %2859) : (i64, i64) -> i64
      %2861 = func.call @cc_nil_value() : () -> i64
      %2862 = func.call @cc_cons(%2860, %2861) : (i64, i64) -> i64
      %2863 = func.call @cc_values_pack(%2862) : (i64) -> i64
      %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
      %2864 = arith.addi %2860, %__rlasp_stack_elide_zero_194 : i64
      %2865 = func.call @stack_pop_pointer() : () -> i64
      %2866 = func.call @cc_cons(%2864, %2865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2866) : (i64) -> ()
      %2867 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2868 = arith.constant 8 : i64
      %2869 = func.call @cc_make_string(%2867, %2868) : (!llvm.ptr, i64) -> i64
      %2870 = func.call @cc_nil_value() : () -> i64
      %2871 = func.call @cc_intern(%2869, %2870) : (i64, i64) -> i64
      %2872 = func.call @cc_nil_value() : () -> i64
      %2873 = func.call @cc_cons(%2871, %2872) : (i64, i64) -> i64
      %2874 = func.call @cc_values_pack(%2873) : (i64) -> i64
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %2875 = arith.addi %2871, %__rlasp_stack_elide_zero_195 : i64
      %2876 = func.call @stack_pop_pointer() : () -> i64
      %2877 = func.call @cc_cons(%2875, %2876) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_196 = arith.constant 0 : i64
      %2878 = arith.addi %2877, %__rlasp_stack_elide_zero_196 : i64
      %2879 = func.call @cc_nil_value() : () -> i64
      %2880 = func.call @cc_cons(%2878, %2879) : (i64, i64) -> i64
      %2881 = func.call @cc_eval(%2880) : (i64) -> i64
      %2882 = func.call @cc_multiple_value_list(%2881) : (i64) -> i64
      %2883 = func.call @cc_values_pack(%2882) : (i64) -> i64
      func.call @stack_push_pointer(%2883) : (i64) -> ()
      %2884 = func.call @stack_depth() : () -> i64
      %2885 = arith.constant 0 : i64
      %2886 = arith.cmpi sgt, %2884, %2885 : i64
      scf.if %2886 {
        %2887 = func.call @stack_pop_pointer() : () -> i64
      }
      %__rlasp_stack_elide_zero_197 = arith.constant 0 : i64
      %2888 = arith.addi %2811, %__rlasp_stack_elide_zero_197 : i64
      scf.yield %2888 : i64
    }
    %2889 = func.call @cc_nil_value() : () -> i64
    %2890 = func.call @cc_errorp(%2794) : (i64) -> i64
    %2891 = arith.cmpi ne, %2890, %2889 : i64
    %2892 = scf.if %2891 -> (i64) {
      scf.yield %2794 : i64
    } else {
      %2919 = llvm.mlir.addressof @method_name_47863920853000 : !llvm.ptr
      %2920 = func.call @cc_make_lambda_ref_str(%2919) : (!llvm.ptr) -> i64
      %2921 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2922 = arith.constant 35 : i64
      %2923 = func.call @cc_make_string(%2921, %2922) : (!llvm.ptr, i64) -> i64
      %2924 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2925 = arith.constant 11 : i64
      %2926 = func.call @cc_make_string(%2924, %2925) : (!llvm.ptr, i64) -> i64
      %2927 = func.call @cc_intern(%2923, %2926) : (i64, i64) -> i64
      %2928 = func.call @cc_nil_value() : () -> i64
      %2929 = func.call @cc_cons(%2927, %2928) : (i64, i64) -> i64
      %2930 = func.call @cc_values_pack(%2929) : (i64) -> i64
      %2931 = func.call @cc_nil() : () -> i64
      %2932 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2933 = arith.constant 1 : i64
      %2934 = func.call @cc_make_string(%2932, %2933) : (!llvm.ptr, i64) -> i64
      %2935 = func.call @cc_nil_value() : () -> i64
      %2936 = func.call @cc_intern(%2934, %2935) : (i64, i64) -> i64
      %2937 = func.call @cc_nil_value() : () -> i64
      %2938 = func.call @cc_cons(%2936, %2937) : (i64, i64) -> i64
      %2939 = func.call @cc_values_pack(%2938) : (i64) -> i64
      %2940 = func.call @cc_cons(%2936, %2931) : (i64, i64) -> i64
      %2941 = llvm.mlir.addressof @str268 : !llvm.ptr
      %2942 = arith.constant 1 : i64
      %2943 = func.call @cc_make_string(%2941, %2942) : (!llvm.ptr, i64) -> i64
      %2944 = func.call @cc_nil_value() : () -> i64
      %2945 = func.call @cc_intern(%2943, %2944) : (i64, i64) -> i64
      %2946 = func.call @cc_nil_value() : () -> i64
      %2947 = func.call @cc_cons(%2945, %2946) : (i64, i64) -> i64
      %2948 = func.call @cc_values_pack(%2947) : (i64) -> i64
      %2949 = func.call @cc_cons(%2945, %2940) : (i64, i64) -> i64
      %2950 = llvm.mlir.addressof @str269 : !llvm.ptr
      %2951 = arith.constant 9 : i64
      %2952 = func.call @cc_make_string(%2950, %2951) : (!llvm.ptr, i64) -> i64
      %2953 = func.call @cc_nil_value() : () -> i64
      %2954 = func.call @cc_intern(%2952, %2953) : (i64, i64) -> i64
      %2955 = func.call @cc_nil_value() : () -> i64
      %2956 = func.call @cc_cons(%2954, %2955) : (i64, i64) -> i64
      %2957 = func.call @cc_values_pack(%2956) : (i64) -> i64
      %2958 = func.call @cc_cons(%2954, %2949) : (i64, i64) -> i64
      %2959 = llvm.mlir.addressof @str270 : !llvm.ptr
      %2960 = arith.constant 9 : i64
      %2961 = func.call @cc_make_string(%2959, %2960) : (!llvm.ptr, i64) -> i64
      %2962 = func.call @cc_nil_value() : () -> i64
      %2963 = func.call @cc_intern(%2961, %2962) : (i64, i64) -> i64
      %2964 = func.call @cc_nil_value() : () -> i64
      %2965 = func.call @cc_cons(%2963, %2964) : (i64, i64) -> i64
      %2966 = func.call @cc_values_pack(%2965) : (i64) -> i64
      %2967 = func.call @cc_cons(%2963, %2958) : (i64, i64) -> i64
      %2968 = arith.constant 4 : i64
      %2969 = func.call @cc_box_fixnum(%2968) : (i64) -> i64
      %2970 = arith.constant 1 : i64
      %2971 = func.call @cc_defmethod_qualified(%2927, %2967, %2920, %2969, %2970) : (i64, i64, i64, i64, i64) -> i64
      %2972 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2972) : (i64) -> ()
      %2973 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2973) : (i64) -> ()
      %2974 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2974) : (i64) -> ()
      %2975 = llvm.mlir.addressof @str271 : !llvm.ptr
      %2976 = arith.constant 13 : i64
      %2977 = func.call @cc_make_string(%2975, %2976) : (!llvm.ptr, i64) -> i64
      %2978 = func.call @cc_nil_value() : () -> i64
      %2979 = func.call @cc_intern(%2977, %2978) : (i64, i64) -> i64
      %2980 = func.call @cc_nil_value() : () -> i64
      %2981 = func.call @cc_cons(%2979, %2980) : (i64, i64) -> i64
      %2982 = func.call @cc_values_pack(%2981) : (i64) -> i64
      %__rlasp_stack_elide_zero_198 = arith.constant 0 : i64
      %2983 = arith.addi %2979, %__rlasp_stack_elide_zero_198 : i64
      %2984 = func.call @stack_pop_pointer() : () -> i64
      %2985 = func.call @cc_cons(%2983, %2984) : (i64, i64) -> i64
      %2986 = llvm.mlir.addressof @str272 : !llvm.ptr
      %2987 = arith.constant 5 : i64
      %2988 = func.call @cc_make_string(%2986, %2987) : (!llvm.ptr, i64) -> i64
      %2989 = func.call @cc_nil_value() : () -> i64
      %2990 = func.call @cc_intern(%2988, %2989) : (i64, i64) -> i64
      %2991 = func.call @cc_nil_value() : () -> i64
      %2992 = func.call @cc_cons(%2990, %2991) : (i64, i64) -> i64
      %2993 = func.call @cc_values_pack(%2992) : (i64) -> i64
      %2994 = func.call @cc_cons(%2990, %2985) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_199 = arith.constant 0 : i64
      %2995 = arith.addi %2994, %__rlasp_stack_elide_zero_199 : i64
      %2996 = func.call @stack_pop_pointer() : () -> i64
      %2997 = func.call @cc_cons(%2995, %2996) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2997) : (i64) -> ()
      %2998 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2999 = arith.constant 5 : i64
      %3000 = func.call @cc_make_string(%2998, %2999) : (!llvm.ptr, i64) -> i64
      %3001 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3002 = arith.constant 11 : i64
      %3003 = func.call @cc_make_string(%3001, %3002) : (!llvm.ptr, i64) -> i64
      %3004 = func.call @cc_intern(%3000, %3003) : (i64, i64) -> i64
      %3005 = func.call @cc_nil_value() : () -> i64
      %3006 = func.call @cc_cons(%3004, %3005) : (i64, i64) -> i64
      %3007 = func.call @cc_values_pack(%3006) : (i64) -> i64
      %__rlasp_stack_elide_zero_200 = arith.constant 0 : i64
      %3008 = arith.addi %3004, %__rlasp_stack_elide_zero_200 : i64
      %3009 = func.call @stack_pop_pointer() : () -> i64
      %3010 = func.call @cc_cons(%3008, %3009) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_201 = arith.constant 0 : i64
      %3011 = arith.addi %3010, %__rlasp_stack_elide_zero_201 : i64
      %3012 = func.call @stack_pop_pointer() : () -> i64
      %3013 = func.call @cc_cons(%3011, %3012) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3013) : (i64) -> ()
      %3014 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3014) : (i64) -> ()
      %3015 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3015) : (i64) -> ()
      %3016 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3017 = arith.constant 8 : i64
      %3018 = func.call @cc_make_string(%3016, %3017) : (!llvm.ptr, i64) -> i64
      %3019 = func.call @cc_nil_value() : () -> i64
      %3020 = func.call @cc_intern(%3018, %3019) : (i64, i64) -> i64
      %3021 = func.call @cc_nil_value() : () -> i64
      %3022 = func.call @cc_cons(%3020, %3021) : (i64, i64) -> i64
      %3023 = func.call @cc_values_pack(%3022) : (i64) -> i64
      %__rlasp_stack_elide_zero_202 = arith.constant 0 : i64
      %3024 = arith.addi %3020, %__rlasp_stack_elide_zero_202 : i64
      %3025 = func.call @stack_pop_pointer() : () -> i64
      %3026 = func.call @cc_cons(%3024, %3025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3026) : (i64) -> ()
      %3027 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3028 = arith.constant 6 : i64
      %3029 = func.call @cc_make_string(%3027, %3028) : (!llvm.ptr, i64) -> i64
      %3030 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3031 = arith.constant 11 : i64
      %3032 = func.call @cc_make_string(%3030, %3031) : (!llvm.ptr, i64) -> i64
      %3033 = func.call @cc_intern(%3029, %3032) : (i64, i64) -> i64
      %3034 = func.call @cc_nil_value() : () -> i64
      %3035 = func.call @cc_cons(%3033, %3034) : (i64, i64) -> i64
      %3036 = func.call @cc_values_pack(%3035) : (i64) -> i64
      %__rlasp_stack_elide_zero_203 = arith.constant 0 : i64
      %3037 = arith.addi %3033, %__rlasp_stack_elide_zero_203 : i64
      %3038 = func.call @stack_pop_pointer() : () -> i64
      %3039 = func.call @cc_cons(%3037, %3038) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_204 = arith.constant 0 : i64
      %3040 = arith.addi %3039, %__rlasp_stack_elide_zero_204 : i64
      %3041 = func.call @stack_pop_pointer() : () -> i64
      %3042 = func.call @cc_cons(%3040, %3041) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3042) : (i64) -> ()
      %3043 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3044 = arith.constant 7 : i64
      %3045 = func.call @cc_make_string(%3043, %3044) : (!llvm.ptr, i64) -> i64
      %3046 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3047 = arith.constant 11 : i64
      %3048 = func.call @cc_make_string(%3046, %3047) : (!llvm.ptr, i64) -> i64
      %3049 = func.call @cc_intern(%3045, %3048) : (i64, i64) -> i64
      %3050 = func.call @cc_nil_value() : () -> i64
      %3051 = func.call @cc_cons(%3049, %3050) : (i64, i64) -> i64
      %3052 = func.call @cc_values_pack(%3051) : (i64) -> i64
      %__rlasp_stack_elide_zero_205 = arith.constant 0 : i64
      %3053 = arith.addi %3049, %__rlasp_stack_elide_zero_205 : i64
      %3054 = func.call @stack_pop_pointer() : () -> i64
      %3055 = func.call @cc_cons(%3053, %3054) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_206 = arith.constant 0 : i64
      %3056 = arith.addi %3055, %__rlasp_stack_elide_zero_206 : i64
      %3057 = func.call @stack_pop_pointer() : () -> i64
      %3058 = func.call @cc_cons(%3056, %3057) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3058) : (i64) -> ()
      %3059 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3059) : (i64) -> ()
      %3060 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3061 = arith.constant 8 : i64
      %3062 = func.call @cc_make_string(%3060, %3061) : (!llvm.ptr, i64) -> i64
      %3063 = func.call @cc_nil_value() : () -> i64
      %3064 = func.call @cc_intern(%3062, %3063) : (i64, i64) -> i64
      %3065 = func.call @cc_nil_value() : () -> i64
      %3066 = func.call @cc_cons(%3064, %3065) : (i64, i64) -> i64
      %3067 = func.call @cc_values_pack(%3066) : (i64) -> i64
      %__rlasp_stack_elide_zero_207 = arith.constant 0 : i64
      %3068 = arith.addi %3064, %__rlasp_stack_elide_zero_207 : i64
      %3069 = func.call @stack_pop_pointer() : () -> i64
      %3070 = func.call @cc_cons(%3068, %3069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3070) : (i64) -> ()
      %3071 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3072 = arith.constant 5 : i64
      %3073 = func.call @cc_make_string(%3071, %3072) : (!llvm.ptr, i64) -> i64
      %3074 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3075 = arith.constant 11 : i64
      %3076 = func.call @cc_make_string(%3074, %3075) : (!llvm.ptr, i64) -> i64
      %3077 = func.call @cc_intern(%3073, %3076) : (i64, i64) -> i64
      %3078 = func.call @cc_nil_value() : () -> i64
      %3079 = func.call @cc_cons(%3077, %3078) : (i64, i64) -> i64
      %3080 = func.call @cc_values_pack(%3079) : (i64) -> i64
      %__rlasp_stack_elide_zero_208 = arith.constant 0 : i64
      %3081 = arith.addi %3077, %__rlasp_stack_elide_zero_208 : i64
      %3082 = func.call @stack_pop_pointer() : () -> i64
      %3083 = func.call @cc_cons(%3081, %3082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3083) : (i64) -> ()
      %3084 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3084) : (i64) -> ()
      %3085 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3086 = arith.constant 9 : i64
      %3087 = func.call @cc_make_string(%3085, %3086) : (!llvm.ptr, i64) -> i64
      %3088 = func.call @cc_nil_value() : () -> i64
      %3089 = func.call @cc_intern(%3087, %3088) : (i64, i64) -> i64
      %3090 = func.call @cc_nil_value() : () -> i64
      %3091 = func.call @cc_cons(%3089, %3090) : (i64, i64) -> i64
      %3092 = func.call @cc_values_pack(%3091) : (i64) -> i64
      %__rlasp_stack_elide_zero_209 = arith.constant 0 : i64
      %3093 = arith.addi %3089, %__rlasp_stack_elide_zero_209 : i64
      %3094 = func.call @stack_pop_pointer() : () -> i64
      %3095 = func.call @cc_cons(%3093, %3094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3095) : (i64) -> ()
      %3096 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3097 = arith.constant 3 : i64
      %3098 = func.call @cc_make_string(%3096, %3097) : (!llvm.ptr, i64) -> i64
      %3099 = func.call @cc_nil_value() : () -> i64
      %3100 = func.call @cc_intern(%3098, %3099) : (i64, i64) -> i64
      %3101 = func.call @cc_nil_value() : () -> i64
      %3102 = func.call @cc_cons(%3100, %3101) : (i64, i64) -> i64
      %3103 = func.call @cc_values_pack(%3102) : (i64) -> i64
      %__rlasp_stack_elide_zero_210 = arith.constant 0 : i64
      %3104 = arith.addi %3100, %__rlasp_stack_elide_zero_210 : i64
      %3105 = func.call @stack_pop_pointer() : () -> i64
      %3106 = func.call @cc_cons(%3104, %3105) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_211 = arith.constant 0 : i64
      %3107 = arith.addi %3106, %__rlasp_stack_elide_zero_211 : i64
      %3108 = func.call @stack_pop_pointer() : () -> i64
      %3109 = func.call @cc_cons(%3107, %3108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3109) : (i64) -> ()
      %3110 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3110) : (i64) -> ()
      %3111 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3112 = arith.constant 9 : i64
      %3113 = func.call @cc_make_string(%3111, %3112) : (!llvm.ptr, i64) -> i64
      %3114 = func.call @cc_nil_value() : () -> i64
      %3115 = func.call @cc_intern(%3113, %3114) : (i64, i64) -> i64
      %3116 = func.call @cc_nil_value() : () -> i64
      %3117 = func.call @cc_cons(%3115, %3116) : (i64, i64) -> i64
      %3118 = func.call @cc_values_pack(%3117) : (i64) -> i64
      %__rlasp_stack_elide_zero_212 = arith.constant 0 : i64
      %3119 = arith.addi %3115, %__rlasp_stack_elide_zero_212 : i64
      %3120 = func.call @stack_pop_pointer() : () -> i64
      %3121 = func.call @cc_cons(%3119, %3120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3121) : (i64) -> ()
      %3122 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3123 = arith.constant 3 : i64
      %3124 = func.call @cc_make_string(%3122, %3123) : (!llvm.ptr, i64) -> i64
      %3125 = func.call @cc_nil_value() : () -> i64
      %3126 = func.call @cc_intern(%3124, %3125) : (i64, i64) -> i64
      %3127 = func.call @cc_nil_value() : () -> i64
      %3128 = func.call @cc_cons(%3126, %3127) : (i64, i64) -> i64
      %3129 = func.call @cc_values_pack(%3128) : (i64) -> i64
      %__rlasp_stack_elide_zero_213 = arith.constant 0 : i64
      %3130 = arith.addi %3126, %__rlasp_stack_elide_zero_213 : i64
      %3131 = func.call @stack_pop_pointer() : () -> i64
      %3132 = func.call @cc_cons(%3130, %3131) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_214 = arith.constant 0 : i64
      %3133 = arith.addi %3132, %__rlasp_stack_elide_zero_214 : i64
      %3134 = func.call @stack_pop_pointer() : () -> i64
      %3135 = func.call @cc_cons(%3133, %3134) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_215 = arith.constant 0 : i64
      %3136 = arith.addi %3135, %__rlasp_stack_elide_zero_215 : i64
      %3137 = func.call @stack_pop_pointer() : () -> i64
      %3138 = func.call @cc_cons(%3136, %3137) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3138) : (i64) -> ()
      %3139 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3140 = arith.constant 6 : i64
      %3141 = func.call @cc_make_string(%3139, %3140) : (!llvm.ptr, i64) -> i64
      %3142 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3143 = arith.constant 7 : i64
      %3144 = func.call @cc_make_string(%3142, %3143) : (!llvm.ptr, i64) -> i64
      %3145 = func.call @cc_intern(%3141, %3144) : (i64, i64) -> i64
      %3146 = func.call @cc_nil_value() : () -> i64
      %3147 = func.call @cc_cons(%3145, %3146) : (i64, i64) -> i64
      %3148 = func.call @cc_values_pack(%3147) : (i64) -> i64
      %__rlasp_stack_elide_zero_216 = arith.constant 0 : i64
      %3149 = arith.addi %3145, %__rlasp_stack_elide_zero_216 : i64
      %3150 = func.call @stack_pop_pointer() : () -> i64
      %3151 = func.call @cc_cons(%3149, %3150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3151) : (i64) -> ()
      %3152 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3153 = arith.constant 35 : i64
      %3154 = func.call @cc_make_string(%3152, %3153) : (!llvm.ptr, i64) -> i64
      %3155 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3156 = arith.constant 11 : i64
      %3157 = func.call @cc_make_string(%3155, %3156) : (!llvm.ptr, i64) -> i64
      %3158 = func.call @cc_intern(%3154, %3157) : (i64, i64) -> i64
      %3159 = func.call @cc_nil_value() : () -> i64
      %3160 = func.call @cc_cons(%3158, %3159) : (i64, i64) -> i64
      %3161 = func.call @cc_values_pack(%3160) : (i64) -> i64
      %__rlasp_stack_elide_zero_217 = arith.constant 0 : i64
      %3162 = arith.addi %3158, %__rlasp_stack_elide_zero_217 : i64
      %3163 = func.call @stack_pop_pointer() : () -> i64
      %3164 = func.call @cc_cons(%3162, %3163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3164) : (i64) -> ()
      %3165 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3166 = arith.constant 9 : i64
      %3167 = func.call @cc_make_string(%3165, %3166) : (!llvm.ptr, i64) -> i64
      %3168 = func.call @cc_nil_value() : () -> i64
      %3169 = func.call @cc_intern(%3167, %3168) : (i64, i64) -> i64
      %3170 = func.call @cc_nil_value() : () -> i64
      %3171 = func.call @cc_cons(%3169, %3170) : (i64, i64) -> i64
      %3172 = func.call @cc_values_pack(%3171) : (i64) -> i64
      %__rlasp_stack_elide_zero_218 = arith.constant 0 : i64
      %3173 = arith.addi %3169, %__rlasp_stack_elide_zero_218 : i64
      %3174 = func.call @stack_pop_pointer() : () -> i64
      %3175 = func.call @cc_cons(%3173, %3174) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_219 = arith.constant 0 : i64
      %3176 = arith.addi %3175, %__rlasp_stack_elide_zero_219 : i64
      %3177 = func.call @cc_nil_value() : () -> i64
      %3178 = func.call @cc_cons(%3176, %3177) : (i64, i64) -> i64
      %3179 = func.call @cc_eval(%3178) : (i64) -> i64
      %3180 = func.call @cc_multiple_value_list(%3179) : (i64) -> i64
      %3181 = func.call @cc_values_pack(%3180) : (i64) -> i64
      %__rlasp_stack_elide_zero_220 = arith.constant 0 : i64
      %3182 = arith.addi %3181, %__rlasp_stack_elide_zero_220 : i64
      scf.yield %3182 : i64
    }
    %3183 = func.call @cc_nil_value() : () -> i64
    %3184 = func.call @cc_errorp(%2892) : (i64) -> i64
    %3185 = arith.cmpi ne, %3184, %3183 : i64
    %3186 = scf.if %3185 -> (i64) {
      scf.yield %2892 : i64
    } else {
      %3187 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3188 = arith.constant 11 : i64
      %3189 = func.call @cc_make_string(%3187, %3188) : (!llvm.ptr, i64) -> i64
      %3190 = func.call @cc_nil_value() : () -> i64
      %3191 = func.call @cc_intern(%3189, %3190) : (i64, i64) -> i64
      %3192 = func.call @cc_nil_value() : () -> i64
      %3193 = func.call @cc_cons(%3191, %3192) : (i64, i64) -> i64
      %3194 = func.call @cc_values_pack(%3193) : (i64) -> i64
      %3195 = func.call @cc_nil_value() : () -> i64
      %3196 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3197 = arith.constant 9 : i64
      %3198 = func.call @cc_make_string(%3196, %3197) : (!llvm.ptr, i64) -> i64
      %3199 = func.call @cc_nil_value() : () -> i64
      %3200 = func.call @cc_intern(%3198, %3199) : (i64, i64) -> i64
      %3201 = func.call @cc_nil_value() : () -> i64
      %3202 = func.call @cc_cons(%3200, %3201) : (i64, i64) -> i64
      %3203 = func.call @cc_values_pack(%3202) : (i64) -> i64
      %__rlasp_stack_elide_zero_221 = arith.constant 0 : i64
      %3204 = arith.addi %3200, %__rlasp_stack_elide_zero_221 : i64
      %3205 = func.call @cc_make_instance(%3204, %3195) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_222 = arith.constant 0 : i64
      %3206 = arith.addi %3205, %__rlasp_stack_elide_zero_222 : i64
      %3207 = func.call @cc_set_symbol_value(%3191, %3206) : (i64, i64) -> i64
      %3208 = func.call @cc_errorp(%3207) : (i64) -> i64
      %3209 = func.call @cc_nil_value() : () -> i64
      %3210 = arith.cmpi ne, %3208, %3209 : i64
      scf.if %3210 {
        func.call @stack_push_pointer(%3207) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3191) : (i64) -> ()
      }
      %3211 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3211 : i64
    }
    %3212 = func.call @cc_nil_value() : () -> i64
    %3213 = func.call @cc_errorp(%3186) : (i64) -> i64
    %3214 = arith.cmpi ne, %3213, %3212 : i64
    %3215 = scf.if %3214 -> (i64) {
      scf.yield %3186 : i64
    } else {
      %3216 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3217 = arith.constant 13 : i64
      %3218 = func.call @cc_make_string(%3216, %3217) : (!llvm.ptr, i64) -> i64
      %3219 = func.call @cc_nil_value() : () -> i64
      %3220 = func.call @cc_intern(%3218, %3219) : (i64, i64) -> i64
      %3221 = func.call @cc_nil_value() : () -> i64
      %3222 = func.call @cc_cons(%3220, %3221) : (i64, i64) -> i64
      %3223 = func.call @cc_values_pack(%3222) : (i64) -> i64
      %__rlasp_stack_elide_zero_223 = arith.constant 0 : i64
      %3224 = arith.addi %3220, %__rlasp_stack_elide_zero_223 : i64
      %3225 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3226 = arith.constant 13 : i64
      %3227 = func.call @cc_make_string(%3225, %3226) : (!llvm.ptr, i64) -> i64
      %3228 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3229 = arith.constant 11 : i64
      %3230 = func.call @cc_make_string(%3228, %3229) : (!llvm.ptr, i64) -> i64
      %3231 = func.call @cc_intern(%3227, %3230) : (i64, i64) -> i64
      %3232 = func.call @cc_nil_value() : () -> i64
      %3233 = func.call @cc_cons(%3231, %3232) : (i64, i64) -> i64
      %3234 = func.call @cc_values_pack(%3233) : (i64) -> i64
      func.call @stack_push_pointer(%3231) : (i64) -> ()
      %3235 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3236 = arith.constant 6 : i64
      %3237 = func.call @cc_make_string(%3235, %3236) : (!llvm.ptr, i64) -> i64
      %3238 = func.call @cc_nil_value() : () -> i64
      %3239 = func.call @cc_intern(%3237, %3238) : (i64, i64) -> i64
      %3240 = func.call @cc_nil_value() : () -> i64
      %3241 = func.call @cc_cons(%3239, %3240) : (i64, i64) -> i64
      %3242 = func.call @cc_values_pack(%3241) : (i64) -> i64
      func.call @stack_push_pointer(%3239) : (i64) -> ()
      %3243 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3244 = arith.constant 19 : i64
      %3245 = func.call @cc_make_string(%3243, %3244) : (!llvm.ptr, i64) -> i64
      %3246 = func.call @cc_nil_value() : () -> i64
      %3247 = func.call @cc_intern(%3245, %3246) : (i64, i64) -> i64
      %3248 = func.call @cc_nil_value() : () -> i64
      %3249 = func.call @cc_cons(%3247, %3248) : (i64, i64) -> i64
      %3250 = func.call @cc_values_pack(%3249) : (i64) -> i64
      func.call @stack_push_pointer(%3247) : (i64) -> ()
      %3251 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3252 = arith.constant 12 : i64
      %3253 = func.call @cc_make_string(%3251, %3252) : (!llvm.ptr, i64) -> i64
      %3254 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3255 = arith.constant 11 : i64
      %3256 = func.call @cc_make_string(%3254, %3255) : (!llvm.ptr, i64) -> i64
      %3257 = func.call @cc_intern(%3253, %3256) : (i64, i64) -> i64
      %3258 = func.call @cc_nil_value() : () -> i64
      %3259 = func.call @cc_cons(%3257, %3258) : (i64, i64) -> i64
      %3260 = func.call @cc_values_pack(%3259) : (i64) -> i64
      func.call @stack_push_pointer(%3257) : (i64) -> ()
      %3261 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3262 = arith.constant 11 : i64
      %3263 = func.call @cc_make_string(%3261, %3262) : (!llvm.ptr, i64) -> i64
      %3264 = func.call @cc_nil_value() : () -> i64
      %3265 = func.call @cc_intern(%3263, %3264) : (i64, i64) -> i64
      %3266 = func.call @cc_nil_value() : () -> i64
      %3267 = func.call @cc_cons(%3265, %3266) : (i64, i64) -> i64
      %3268 = func.call @cc_values_pack(%3267) : (i64) -> i64
      func.call @stack_push_pointer(%3265) : (i64) -> ()
      %3269 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3269) : (i64) -> ()
      %3270 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3271 = arith.constant 9 : i64
      %3272 = func.call @cc_make_string(%3270, %3271) : (!llvm.ptr, i64) -> i64
      %3273 = func.call @cc_nil_value() : () -> i64
      %3274 = func.call @cc_intern(%3272, %3273) : (i64, i64) -> i64
      %3275 = func.call @cc_nil_value() : () -> i64
      %3276 = func.call @cc_cons(%3274, %3275) : (i64, i64) -> i64
      %3277 = func.call @cc_values_pack(%3276) : (i64) -> i64
      %__rlasp_stack_elide_zero_224 = arith.constant 0 : i64
      %3278 = arith.addi %3274, %__rlasp_stack_elide_zero_224 : i64
      %3279 = func.call @stack_pop_pointer() : () -> i64
      %3280 = func.call @cc_cons(%3278, %3279) : (i64, i64) -> i64
      %3281 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3282 = arith.constant 5 : i64
      %3283 = func.call @cc_make_string(%3281, %3282) : (!llvm.ptr, i64) -> i64
      %3284 = func.call @cc_nil_value() : () -> i64
      %3285 = func.call @cc_intern(%3283, %3284) : (i64, i64) -> i64
      %3286 = func.call @cc_nil_value() : () -> i64
      %3287 = func.call @cc_cons(%3285, %3286) : (i64, i64) -> i64
      %3288 = func.call @cc_values_pack(%3287) : (i64) -> i64
      %3289 = func.call @cc_cons(%3285, %3280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3289) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3290 = func.call @stack_pop_pointer() : () -> i64
      %3291 = func.call @stack_pop_pointer() : () -> i64
      %3292 = func.call @cc_cons(%3291, %3290) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_225 = arith.constant 0 : i64
      %3293 = arith.addi %3292, %__rlasp_stack_elide_zero_225 : i64
      %3294 = func.call @stack_pop_pointer() : () -> i64
      %3295 = func.call @cc_cons(%3294, %3293) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_226 = arith.constant 0 : i64
      %3296 = arith.addi %3295, %__rlasp_stack_elide_zero_226 : i64
      %3297 = func.call @stack_pop_pointer() : () -> i64
      %3298 = func.call @cc_cons(%3297, %3296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3298) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3299 = func.call @stack_pop_pointer() : () -> i64
      %3300 = func.call @stack_pop_pointer() : () -> i64
      %3301 = func.call @cc_cons(%3300, %3299) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_227 = arith.constant 0 : i64
      %3302 = arith.addi %3301, %__rlasp_stack_elide_zero_227 : i64
      %3303 = func.call @stack_pop_pointer() : () -> i64
      %3304 = func.call @cc_cons(%3303, %3302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3304) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3305 = func.call @stack_pop_pointer() : () -> i64
      %3306 = func.call @stack_pop_pointer() : () -> i64
      %3307 = func.call @cc_cons(%3306, %3305) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_228 = arith.constant 0 : i64
      %3308 = arith.addi %3307, %__rlasp_stack_elide_zero_228 : i64
      %3309 = func.call @stack_pop_pointer() : () -> i64
      %3310 = func.call @cc_cons(%3309, %3308) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_229 = arith.constant 0 : i64
      %3311 = arith.addi %3310, %__rlasp_stack_elide_zero_229 : i64
      %3312 = func.call @stack_pop_pointer() : () -> i64
      %3313 = func.call @cc_cons(%3312, %3311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3314 = func.call @stack_pop_pointer() : () -> i64
      %3315 = func.call @stack_pop_pointer() : () -> i64
      %3316 = func.call @cc_cons(%3315, %3314) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_230 = arith.constant 0 : i64
      %3317 = arith.addi %3316, %__rlasp_stack_elide_zero_230 : i64
      %3318 = func.call @stack_pop_pointer() : () -> i64
      %3319 = func.call @cc_cons(%3318, %3317) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_231 = arith.constant 0 : i64
      %3320 = arith.addi %3319, %__rlasp_stack_elide_zero_231 : i64
      %3384 = arith.constant 47863920853001 : i64
      %3385 = arith.constant 0 : i64
      %3386 = func.call @cc_make_closure(%3384, %3385) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_232 = arith.constant 0 : i64
      %3387 = arith.addi %3386, %__rlasp_stack_elide_zero_232 : i64
      %3388 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3389 = arith.constant 4 : i64
      %3390 = func.call @cc_make_string(%3388, %3389) : (!llvm.ptr, i64) -> i64
      %3391 = func.call @cc_nil_value() : () -> i64
      %3392 = func.call @cc_intern(%3390, %3391) : (i64, i64) -> i64
      %3393 = func.call @cc_nil_value() : () -> i64
      %3394 = func.call @cc_cons(%3392, %3393) : (i64, i64) -> i64
      %3395 = func.call @cc_values_pack(%3394) : (i64) -> i64
      func.call @stack_push_pointer(%3392) : (i64) -> ()
      %3396 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3397 = arith.constant 13 : i64
      %3398 = func.call @cc_make_string(%3396, %3397) : (!llvm.ptr, i64) -> i64
      %3399 = func.call @cc_nil_value() : () -> i64
      %3400 = func.call @cc_intern(%3398, %3399) : (i64, i64) -> i64
      %3401 = func.call @cc_nil_value() : () -> i64
      %3402 = func.call @cc_cons(%3400, %3401) : (i64, i64) -> i64
      %3403 = func.call @cc_values_pack(%3402) : (i64) -> i64
      func.call @stack_push_pointer(%3400) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3404 = func.call @stack_pop_pointer() : () -> i64
      %3405 = func.call @stack_pop_pointer() : () -> i64
      %3406 = func.call @cc_cons(%3405, %3404) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_233 = arith.constant 0 : i64
      %3407 = arith.addi %3406, %__rlasp_stack_elide_zero_233 : i64
      %3408 = func.call @stack_pop_pointer() : () -> i64
      %3409 = func.call @cc_cons(%3408, %3407) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_234 = arith.constant 0 : i64
      %3410 = arith.addi %3409, %__rlasp_stack_elide_zero_234 : i64
      %3411 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3412 = arith.constant 11 : i64
      %3413 = func.call @cc_make_string(%3411, %3412) : (!llvm.ptr, i64) -> i64
      %3414 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3415 = arith.constant 7 : i64
      %3416 = func.call @cc_make_string(%3414, %3415) : (!llvm.ptr, i64) -> i64
      %3417 = func.call @cc_intern(%3413, %3416) : (i64, i64) -> i64
      %3418 = func.call @cc_nil_value() : () -> i64
      %3419 = func.call @cc_cons(%3417, %3418) : (i64, i64) -> i64
      %3420 = func.call @cc_values_pack(%3419) : (i64) -> i64
      %3421 = func.call @cc_nil_value() : () -> i64
      %3422 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3423 = arith.constant 4 : i64
      %3424 = func.call @cc_make_string(%3422, %3423) : (!llvm.ptr, i64) -> i64
      %3425 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3426 = arith.constant 7 : i64
      %3427 = func.call @cc_make_string(%3425, %3426) : (!llvm.ptr, i64) -> i64
      %3428 = func.call @cc_intern(%3424, %3427) : (i64, i64) -> i64
      %3429 = func.call @cc_nil_value() : () -> i64
      %3430 = func.call @cc_cons(%3428, %3429) : (i64, i64) -> i64
      %3431 = func.call @cc_values_pack(%3430) : (i64) -> i64
      %3432 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3433 = arith.constant 5 : i64
      %3434 = func.call @cc_make_string(%3432, %3433) : (!llvm.ptr, i64) -> i64
      %3435 = func.call @cc_nil_value() : () -> i64
      %3436 = func.call @cc_intern(%3434, %3435) : (i64, i64) -> i64
      %3437 = func.call @cc_nil_value() : () -> i64
      %3438 = func.call @cc_cons(%3436, %3437) : (i64, i64) -> i64
      %3439 = func.call @cc_values_pack(%3438) : (i64) -> i64
      %__rlasp_stack_elide_zero_235 = arith.constant 0 : i64
      %3440 = arith.addi %3436, %__rlasp_stack_elide_zero_235 : i64
      %3441 = func.call @cc_nil_value() : () -> i64
      %3442 = func.call @cc_errorp(%3224) : (i64) -> i64
      %3443 = arith.cmpi ne, %3442, %3441 : i64
      %3444 = arith.cmpi eq, %3441, %3441 : i64
      %3445 = arith.andi %3443, %3444 : i1
      %3446 = scf.if %3445 -> (i64) {
        scf.yield %3224 : i64
      } else {
        scf.yield %3441 : i64
      }
      %3447 = func.call @cc_errorp(%3320) : (i64) -> i64
      %3448 = arith.cmpi ne, %3447, %3441 : i64
      %3449 = arith.cmpi eq, %3446, %3441 : i64
      %3450 = arith.andi %3448, %3449 : i1
      %3451 = scf.if %3450 -> (i64) {
        scf.yield %3320 : i64
      } else {
        scf.yield %3446 : i64
      }
      %3452 = func.call @cc_errorp(%3387) : (i64) -> i64
      %3453 = arith.cmpi ne, %3452, %3441 : i64
      %3454 = arith.cmpi eq, %3451, %3441 : i64
      %3455 = arith.andi %3453, %3454 : i1
      %3456 = scf.if %3455 -> (i64) {
        scf.yield %3387 : i64
      } else {
        scf.yield %3451 : i64
      }
      %3457 = func.call @cc_errorp(%3410) : (i64) -> i64
      %3458 = arith.cmpi ne, %3457, %3441 : i64
      %3459 = arith.cmpi eq, %3456, %3441 : i64
      %3460 = arith.andi %3458, %3459 : i1
      %3461 = scf.if %3460 -> (i64) {
        scf.yield %3410 : i64
      } else {
        scf.yield %3456 : i64
      }
      %3462 = func.call @cc_errorp(%3417) : (i64) -> i64
      %3463 = arith.cmpi ne, %3462, %3441 : i64
      %3464 = arith.cmpi eq, %3461, %3441 : i64
      %3465 = arith.andi %3463, %3464 : i1
      %3466 = scf.if %3465 -> (i64) {
        scf.yield %3417 : i64
      } else {
        scf.yield %3461 : i64
      }
      %3467 = func.call @cc_errorp(%3421) : (i64) -> i64
      %3468 = arith.cmpi ne, %3467, %3441 : i64
      %3469 = arith.cmpi eq, %3466, %3441 : i64
      %3470 = arith.andi %3468, %3469 : i1
      %3471 = scf.if %3470 -> (i64) {
        scf.yield %3421 : i64
      } else {
        scf.yield %3466 : i64
      }
      %3472 = func.call @cc_errorp(%3428) : (i64) -> i64
      %3473 = arith.cmpi ne, %3472, %3441 : i64
      %3474 = arith.cmpi eq, %3471, %3441 : i64
      %3475 = arith.andi %3473, %3474 : i1
      %3476 = scf.if %3475 -> (i64) {
        scf.yield %3428 : i64
      } else {
        scf.yield %3471 : i64
      }
      %3477 = func.call @cc_errorp(%3440) : (i64) -> i64
      %3478 = arith.cmpi ne, %3477, %3441 : i64
      %3479 = arith.cmpi eq, %3476, %3441 : i64
      %3480 = arith.andi %3478, %3479 : i1
      %3481 = scf.if %3480 -> (i64) {
        scf.yield %3440 : i64
      } else {
        scf.yield %3476 : i64
      }
      %3482 = arith.cmpi ne, %3481, %3441 : i64
      scf.if %3482 {
        func.call @stack_push_pointer(%3481) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3224) : (i64) -> ()
        func.call @stack_push_pointer(%3320) : (i64) -> ()
        func.call @stack_push_pointer(%3387) : (i64) -> ()
        func.call @stack_push_pointer(%3410) : (i64) -> ()
        func.call @stack_push_pointer(%3417) : (i64) -> ()
        func.call @stack_push_pointer(%3421) : (i64) -> ()
        func.call @stack_push_pointer(%3428) : (i64) -> ()
        func.call @stack_push_pointer(%3440) : (i64) -> ()
        %3483 = llvm.mlir.addressof @str313 : !llvm.ptr
        %3484 = func.call @cc_make_function_ref_const(%3483) : (!llvm.ptr) -> i64
        %3485 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3484, %3485) : (i64, i64) -> ()
      }
      %3486 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3486 : i64
    }
    %3487 = func.call @cc_nil_value() : () -> i64
    %3488 = func.call @cc_errorp(%3215) : (i64) -> i64
    %3489 = arith.cmpi ne, %3488, %3487 : i64
    %3490 = scf.if %3489 -> (i64) {
      scf.yield %3215 : i64
    } else {
      %3491 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3492 = arith.constant 13 : i64
      %3493 = func.call @cc_make_string(%3491, %3492) : (!llvm.ptr, i64) -> i64
      %3494 = func.call @cc_nil_value() : () -> i64
      %3495 = func.call @cc_intern(%3493, %3494) : (i64, i64) -> i64
      %3496 = func.call @cc_nil_value() : () -> i64
      %3497 = func.call @cc_cons(%3495, %3496) : (i64, i64) -> i64
      %3498 = func.call @cc_values_pack(%3497) : (i64) -> i64
      %__rlasp_stack_elide_zero_236 = arith.constant 0 : i64
      %3499 = arith.addi %3495, %__rlasp_stack_elide_zero_236 : i64
      %3500 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3501 = arith.constant 6 : i64
      %3502 = func.call @cc_make_string(%3500, %3501) : (!llvm.ptr, i64) -> i64
      %3503 = func.call @cc_nil_value() : () -> i64
      %3504 = func.call @cc_intern(%3502, %3503) : (i64, i64) -> i64
      %3505 = func.call @cc_nil_value() : () -> i64
      %3506 = func.call @cc_cons(%3504, %3505) : (i64, i64) -> i64
      %3507 = func.call @cc_values_pack(%3506) : (i64) -> i64
      func.call @stack_push_pointer(%3504) : (i64) -> ()
      %3508 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3509 = arith.constant 11 : i64
      %3510 = func.call @cc_make_string(%3508, %3509) : (!llvm.ptr, i64) -> i64
      %3511 = func.call @cc_nil_value() : () -> i64
      %3512 = func.call @cc_intern(%3510, %3511) : (i64, i64) -> i64
      %3513 = func.call @cc_nil_value() : () -> i64
      %3514 = func.call @cc_cons(%3512, %3513) : (i64, i64) -> i64
      %3515 = func.call @cc_values_pack(%3514) : (i64) -> i64
      func.call @stack_push_pointer(%3512) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3516 = func.call @stack_pop_pointer() : () -> i64
      %3517 = func.call @stack_pop_pointer() : () -> i64
      %3518 = func.call @cc_cons(%3517, %3516) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_237 = arith.constant 0 : i64
      %3519 = arith.addi %3518, %__rlasp_stack_elide_zero_237 : i64
      %3520 = func.call @stack_pop_pointer() : () -> i64
      %3521 = func.call @cc_cons(%3520, %3519) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_238 = arith.constant 0 : i64
      %3522 = arith.addi %3521, %__rlasp_stack_elide_zero_238 : i64
      %3543 = arith.constant 47863920853002 : i64
      %3544 = arith.constant 0 : i64
      %3545 = func.call @cc_make_closure(%3543, %3544) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_239 = arith.constant 0 : i64
      %3546 = arith.addi %3545, %__rlasp_stack_elide_zero_239 : i64
      %3547 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3548 = arith.constant 9 : i64
      %3549 = func.call @cc_make_string(%3547, %3548) : (!llvm.ptr, i64) -> i64
      %3550 = func.call @cc_nil_value() : () -> i64
      %3551 = func.call @cc_intern(%3549, %3550) : (i64, i64) -> i64
      %3552 = func.call @cc_nil_value() : () -> i64
      %3553 = func.call @cc_cons(%3551, %3552) : (i64, i64) -> i64
      %3554 = func.call @cc_values_pack(%3553) : (i64) -> i64
      func.call @stack_push_pointer(%3551) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3555 = func.call @stack_pop_pointer() : () -> i64
      %3556 = func.call @stack_pop_pointer() : () -> i64
      %3557 = func.call @cc_cons(%3556, %3555) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_240 = arith.constant 0 : i64
      %3558 = arith.addi %3557, %__rlasp_stack_elide_zero_240 : i64
      %3559 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3560 = arith.constant 11 : i64
      %3561 = func.call @cc_make_string(%3559, %3560) : (!llvm.ptr, i64) -> i64
      %3562 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3563 = arith.constant 7 : i64
      %3564 = func.call @cc_make_string(%3562, %3563) : (!llvm.ptr, i64) -> i64
      %3565 = func.call @cc_intern(%3561, %3564) : (i64, i64) -> i64
      %3566 = func.call @cc_nil_value() : () -> i64
      %3567 = func.call @cc_cons(%3565, %3566) : (i64, i64) -> i64
      %3568 = func.call @cc_values_pack(%3567) : (i64) -> i64
      %3569 = func.call @cc_nil_value() : () -> i64
      %3570 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3571 = arith.constant 4 : i64
      %3572 = func.call @cc_make_string(%3570, %3571) : (!llvm.ptr, i64) -> i64
      %3573 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3574 = arith.constant 7 : i64
      %3575 = func.call @cc_make_string(%3573, %3574) : (!llvm.ptr, i64) -> i64
      %3576 = func.call @cc_intern(%3572, %3575) : (i64, i64) -> i64
      %3577 = func.call @cc_nil_value() : () -> i64
      %3578 = func.call @cc_cons(%3576, %3577) : (i64, i64) -> i64
      %3579 = func.call @cc_values_pack(%3578) : (i64) -> i64
      %3580 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3581 = arith.constant 5 : i64
      %3582 = func.call @cc_make_string(%3580, %3581) : (!llvm.ptr, i64) -> i64
      %3583 = func.call @cc_nil_value() : () -> i64
      %3584 = func.call @cc_intern(%3582, %3583) : (i64, i64) -> i64
      %3585 = func.call @cc_nil_value() : () -> i64
      %3586 = func.call @cc_cons(%3584, %3585) : (i64, i64) -> i64
      %3587 = func.call @cc_values_pack(%3586) : (i64) -> i64
      %__rlasp_stack_elide_zero_241 = arith.constant 0 : i64
      %3588 = arith.addi %3584, %__rlasp_stack_elide_zero_241 : i64
      %3589 = func.call @cc_nil_value() : () -> i64
      %3590 = func.call @cc_errorp(%3499) : (i64) -> i64
      %3591 = arith.cmpi ne, %3590, %3589 : i64
      %3592 = arith.cmpi eq, %3589, %3589 : i64
      %3593 = arith.andi %3591, %3592 : i1
      %3594 = scf.if %3593 -> (i64) {
        scf.yield %3499 : i64
      } else {
        scf.yield %3589 : i64
      }
      %3595 = func.call @cc_errorp(%3522) : (i64) -> i64
      %3596 = arith.cmpi ne, %3595, %3589 : i64
      %3597 = arith.cmpi eq, %3594, %3589 : i64
      %3598 = arith.andi %3596, %3597 : i1
      %3599 = scf.if %3598 -> (i64) {
        scf.yield %3522 : i64
      } else {
        scf.yield %3594 : i64
      }
      %3600 = func.call @cc_errorp(%3546) : (i64) -> i64
      %3601 = arith.cmpi ne, %3600, %3589 : i64
      %3602 = arith.cmpi eq, %3599, %3589 : i64
      %3603 = arith.andi %3601, %3602 : i1
      %3604 = scf.if %3603 -> (i64) {
        scf.yield %3546 : i64
      } else {
        scf.yield %3599 : i64
      }
      %3605 = func.call @cc_errorp(%3558) : (i64) -> i64
      %3606 = arith.cmpi ne, %3605, %3589 : i64
      %3607 = arith.cmpi eq, %3604, %3589 : i64
      %3608 = arith.andi %3606, %3607 : i1
      %3609 = scf.if %3608 -> (i64) {
        scf.yield %3558 : i64
      } else {
        scf.yield %3604 : i64
      }
      %3610 = func.call @cc_errorp(%3565) : (i64) -> i64
      %3611 = arith.cmpi ne, %3610, %3589 : i64
      %3612 = arith.cmpi eq, %3609, %3589 : i64
      %3613 = arith.andi %3611, %3612 : i1
      %3614 = scf.if %3613 -> (i64) {
        scf.yield %3565 : i64
      } else {
        scf.yield %3609 : i64
      }
      %3615 = func.call @cc_errorp(%3569) : (i64) -> i64
      %3616 = arith.cmpi ne, %3615, %3589 : i64
      %3617 = arith.cmpi eq, %3614, %3589 : i64
      %3618 = arith.andi %3616, %3617 : i1
      %3619 = scf.if %3618 -> (i64) {
        scf.yield %3569 : i64
      } else {
        scf.yield %3614 : i64
      }
      %3620 = func.call @cc_errorp(%3576) : (i64) -> i64
      %3621 = arith.cmpi ne, %3620, %3589 : i64
      %3622 = arith.cmpi eq, %3619, %3589 : i64
      %3623 = arith.andi %3621, %3622 : i1
      %3624 = scf.if %3623 -> (i64) {
        scf.yield %3576 : i64
      } else {
        scf.yield %3619 : i64
      }
      %3625 = func.call @cc_errorp(%3588) : (i64) -> i64
      %3626 = arith.cmpi ne, %3625, %3589 : i64
      %3627 = arith.cmpi eq, %3624, %3589 : i64
      %3628 = arith.andi %3626, %3627 : i1
      %3629 = scf.if %3628 -> (i64) {
        scf.yield %3588 : i64
      } else {
        scf.yield %3624 : i64
      }
      %3630 = arith.cmpi ne, %3629, %3589 : i64
      scf.if %3630 {
        func.call @stack_push_pointer(%3629) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3499) : (i64) -> ()
        func.call @stack_push_pointer(%3522) : (i64) -> ()
        func.call @stack_push_pointer(%3546) : (i64) -> ()
        func.call @stack_push_pointer(%3558) : (i64) -> ()
        func.call @stack_push_pointer(%3565) : (i64) -> ()
        func.call @stack_push_pointer(%3569) : (i64) -> ()
        func.call @stack_push_pointer(%3576) : (i64) -> ()
        func.call @stack_push_pointer(%3588) : (i64) -> ()
        %3631 = llvm.mlir.addressof @str324 : !llvm.ptr
        %3632 = func.call @cc_make_function_ref_const(%3631) : (!llvm.ptr) -> i64
        %3633 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3632, %3633) : (i64, i64) -> ()
      }
      %3634 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3634 : i64
    }
    %3635 = func.call @cc_nil_value() : () -> i64
    %3636 = func.call @cc_errorp(%3490) : (i64) -> i64
    %3637 = arith.cmpi ne, %3636, %3635 : i64
    %3638 = scf.if %3637 -> (i64) {
      scf.yield %3490 : i64
    } else {
      %3639 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3640 = arith.constant 13 : i64
      %3641 = func.call @cc_make_string(%3639, %3640) : (!llvm.ptr, i64) -> i64
      %3642 = func.call @cc_nil_value() : () -> i64
      %3643 = func.call @cc_intern(%3641, %3642) : (i64, i64) -> i64
      %3644 = func.call @cc_nil_value() : () -> i64
      %3645 = func.call @cc_cons(%3643, %3644) : (i64, i64) -> i64
      %3646 = func.call @cc_values_pack(%3645) : (i64) -> i64
      %__rlasp_stack_elide_zero_242 = arith.constant 0 : i64
      %3647 = arith.addi %3643, %__rlasp_stack_elide_zero_242 : i64
      %3648 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3649 = arith.constant 13 : i64
      %3650 = func.call @cc_make_string(%3648, %3649) : (!llvm.ptr, i64) -> i64
      %3651 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3652 = arith.constant 11 : i64
      %3653 = func.call @cc_make_string(%3651, %3652) : (!llvm.ptr, i64) -> i64
      %3654 = func.call @cc_intern(%3650, %3653) : (i64, i64) -> i64
      %3655 = func.call @cc_nil_value() : () -> i64
      %3656 = func.call @cc_cons(%3654, %3655) : (i64, i64) -> i64
      %3657 = func.call @cc_values_pack(%3656) : (i64) -> i64
      func.call @stack_push_pointer(%3654) : (i64) -> ()
      %3658 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3659 = arith.constant 6 : i64
      %3660 = func.call @cc_make_string(%3658, %3659) : (!llvm.ptr, i64) -> i64
      %3661 = func.call @cc_nil_value() : () -> i64
      %3662 = func.call @cc_intern(%3660, %3661) : (i64, i64) -> i64
      %3663 = func.call @cc_nil_value() : () -> i64
      %3664 = func.call @cc_cons(%3662, %3663) : (i64, i64) -> i64
      %3665 = func.call @cc_values_pack(%3664) : (i64) -> i64
      func.call @stack_push_pointer(%3662) : (i64) -> ()
      %3666 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3667 = arith.constant 19 : i64
      %3668 = func.call @cc_make_string(%3666, %3667) : (!llvm.ptr, i64) -> i64
      %3669 = func.call @cc_nil_value() : () -> i64
      %3670 = func.call @cc_intern(%3668, %3669) : (i64, i64) -> i64
      %3671 = func.call @cc_nil_value() : () -> i64
      %3672 = func.call @cc_cons(%3670, %3671) : (i64, i64) -> i64
      %3673 = func.call @cc_values_pack(%3672) : (i64) -> i64
      func.call @stack_push_pointer(%3670) : (i64) -> ()
      %3674 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3675 = arith.constant 12 : i64
      %3676 = func.call @cc_make_string(%3674, %3675) : (!llvm.ptr, i64) -> i64
      %3677 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3678 = arith.constant 11 : i64
      %3679 = func.call @cc_make_string(%3677, %3678) : (!llvm.ptr, i64) -> i64
      %3680 = func.call @cc_intern(%3676, %3679) : (i64, i64) -> i64
      %3681 = func.call @cc_nil_value() : () -> i64
      %3682 = func.call @cc_cons(%3680, %3681) : (i64, i64) -> i64
      %3683 = func.call @cc_values_pack(%3682) : (i64) -> i64
      func.call @stack_push_pointer(%3680) : (i64) -> ()
      %3684 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3685 = arith.constant 11 : i64
      %3686 = func.call @cc_make_string(%3684, %3685) : (!llvm.ptr, i64) -> i64
      %3687 = func.call @cc_nil_value() : () -> i64
      %3688 = func.call @cc_intern(%3686, %3687) : (i64, i64) -> i64
      %3689 = func.call @cc_nil_value() : () -> i64
      %3690 = func.call @cc_cons(%3688, %3689) : (i64, i64) -> i64
      %3691 = func.call @cc_values_pack(%3690) : (i64) -> i64
      func.call @stack_push_pointer(%3688) : (i64) -> ()
      %3692 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3692) : (i64) -> ()
      %3693 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3694 = arith.constant 9 : i64
      %3695 = func.call @cc_make_string(%3693, %3694) : (!llvm.ptr, i64) -> i64
      %3696 = func.call @cc_nil_value() : () -> i64
      %3697 = func.call @cc_intern(%3695, %3696) : (i64, i64) -> i64
      %3698 = func.call @cc_nil_value() : () -> i64
      %3699 = func.call @cc_cons(%3697, %3698) : (i64, i64) -> i64
      %3700 = func.call @cc_values_pack(%3699) : (i64) -> i64
      %__rlasp_stack_elide_zero_243 = arith.constant 0 : i64
      %3701 = arith.addi %3697, %__rlasp_stack_elide_zero_243 : i64
      %3702 = func.call @stack_pop_pointer() : () -> i64
      %3703 = func.call @cc_cons(%3701, %3702) : (i64, i64) -> i64
      %3704 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3705 = arith.constant 5 : i64
      %3706 = func.call @cc_make_string(%3704, %3705) : (!llvm.ptr, i64) -> i64
      %3707 = func.call @cc_nil_value() : () -> i64
      %3708 = func.call @cc_intern(%3706, %3707) : (i64, i64) -> i64
      %3709 = func.call @cc_nil_value() : () -> i64
      %3710 = func.call @cc_cons(%3708, %3709) : (i64, i64) -> i64
      %3711 = func.call @cc_values_pack(%3710) : (i64) -> i64
      %3712 = func.call @cc_cons(%3708, %3703) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3712) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3713 = func.call @stack_pop_pointer() : () -> i64
      %3714 = func.call @stack_pop_pointer() : () -> i64
      %3715 = func.call @cc_cons(%3714, %3713) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_244 = arith.constant 0 : i64
      %3716 = arith.addi %3715, %__rlasp_stack_elide_zero_244 : i64
      %3717 = func.call @stack_pop_pointer() : () -> i64
      %3718 = func.call @cc_cons(%3717, %3716) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_245 = arith.constant 0 : i64
      %3719 = arith.addi %3718, %__rlasp_stack_elide_zero_245 : i64
      %3720 = func.call @stack_pop_pointer() : () -> i64
      %3721 = func.call @cc_cons(%3720, %3719) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3721) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3722 = func.call @stack_pop_pointer() : () -> i64
      %3723 = func.call @stack_pop_pointer() : () -> i64
      %3724 = func.call @cc_cons(%3723, %3722) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_246 = arith.constant 0 : i64
      %3725 = arith.addi %3724, %__rlasp_stack_elide_zero_246 : i64
      %3726 = func.call @stack_pop_pointer() : () -> i64
      %3727 = func.call @cc_cons(%3726, %3725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3727) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3728 = func.call @stack_pop_pointer() : () -> i64
      %3729 = func.call @stack_pop_pointer() : () -> i64
      %3730 = func.call @cc_cons(%3729, %3728) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_247 = arith.constant 0 : i64
      %3731 = arith.addi %3730, %__rlasp_stack_elide_zero_247 : i64
      %3732 = func.call @stack_pop_pointer() : () -> i64
      %3733 = func.call @cc_cons(%3732, %3731) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_248 = arith.constant 0 : i64
      %3734 = arith.addi %3733, %__rlasp_stack_elide_zero_248 : i64
      %3735 = func.call @stack_pop_pointer() : () -> i64
      %3736 = func.call @cc_cons(%3735, %3734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3736) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3737 = func.call @stack_pop_pointer() : () -> i64
      %3738 = func.call @stack_pop_pointer() : () -> i64
      %3739 = func.call @cc_cons(%3738, %3737) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_249 = arith.constant 0 : i64
      %3740 = arith.addi %3739, %__rlasp_stack_elide_zero_249 : i64
      %3741 = func.call @stack_pop_pointer() : () -> i64
      %3742 = func.call @cc_cons(%3741, %3740) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_250 = arith.constant 0 : i64
      %3743 = arith.addi %3742, %__rlasp_stack_elide_zero_250 : i64
      %3807 = arith.constant 47863920853003 : i64
      %3808 = arith.constant 0 : i64
      %3809 = func.call @cc_make_closure(%3807, %3808) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_251 = arith.constant 0 : i64
      %3810 = arith.addi %3809, %__rlasp_stack_elide_zero_251 : i64
      %3811 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3812 = arith.constant 4 : i64
      %3813 = func.call @cc_make_string(%3811, %3812) : (!llvm.ptr, i64) -> i64
      %3814 = func.call @cc_nil_value() : () -> i64
      %3815 = func.call @cc_intern(%3813, %3814) : (i64, i64) -> i64
      %3816 = func.call @cc_nil_value() : () -> i64
      %3817 = func.call @cc_cons(%3815, %3816) : (i64, i64) -> i64
      %3818 = func.call @cc_values_pack(%3817) : (i64) -> i64
      func.call @stack_push_pointer(%3815) : (i64) -> ()
      %3819 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3820 = arith.constant 13 : i64
      %3821 = func.call @cc_make_string(%3819, %3820) : (!llvm.ptr, i64) -> i64
      %3822 = func.call @cc_nil_value() : () -> i64
      %3823 = func.call @cc_intern(%3821, %3822) : (i64, i64) -> i64
      %3824 = func.call @cc_nil_value() : () -> i64
      %3825 = func.call @cc_cons(%3823, %3824) : (i64, i64) -> i64
      %3826 = func.call @cc_values_pack(%3825) : (i64) -> i64
      func.call @stack_push_pointer(%3823) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3827 = func.call @stack_pop_pointer() : () -> i64
      %3828 = func.call @stack_pop_pointer() : () -> i64
      %3829 = func.call @cc_cons(%3828, %3827) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_252 = arith.constant 0 : i64
      %3830 = arith.addi %3829, %__rlasp_stack_elide_zero_252 : i64
      %3831 = func.call @stack_pop_pointer() : () -> i64
      %3832 = func.call @cc_cons(%3831, %3830) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_253 = arith.constant 0 : i64
      %3833 = arith.addi %3832, %__rlasp_stack_elide_zero_253 : i64
      %3834 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3835 = arith.constant 11 : i64
      %3836 = func.call @cc_make_string(%3834, %3835) : (!llvm.ptr, i64) -> i64
      %3837 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3838 = arith.constant 7 : i64
      %3839 = func.call @cc_make_string(%3837, %3838) : (!llvm.ptr, i64) -> i64
      %3840 = func.call @cc_intern(%3836, %3839) : (i64, i64) -> i64
      %3841 = func.call @cc_nil_value() : () -> i64
      %3842 = func.call @cc_cons(%3840, %3841) : (i64, i64) -> i64
      %3843 = func.call @cc_values_pack(%3842) : (i64) -> i64
      %3844 = func.call @cc_nil_value() : () -> i64
      %3845 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3846 = arith.constant 4 : i64
      %3847 = func.call @cc_make_string(%3845, %3846) : (!llvm.ptr, i64) -> i64
      %3848 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3849 = arith.constant 7 : i64
      %3850 = func.call @cc_make_string(%3848, %3849) : (!llvm.ptr, i64) -> i64
      %3851 = func.call @cc_intern(%3847, %3850) : (i64, i64) -> i64
      %3852 = func.call @cc_nil_value() : () -> i64
      %3853 = func.call @cc_cons(%3851, %3852) : (i64, i64) -> i64
      %3854 = func.call @cc_values_pack(%3853) : (i64) -> i64
      %3855 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3856 = arith.constant 5 : i64
      %3857 = func.call @cc_make_string(%3855, %3856) : (!llvm.ptr, i64) -> i64
      %3858 = func.call @cc_nil_value() : () -> i64
      %3859 = func.call @cc_intern(%3857, %3858) : (i64, i64) -> i64
      %3860 = func.call @cc_nil_value() : () -> i64
      %3861 = func.call @cc_cons(%3859, %3860) : (i64, i64) -> i64
      %3862 = func.call @cc_values_pack(%3861) : (i64) -> i64
      %__rlasp_stack_elide_zero_254 = arith.constant 0 : i64
      %3863 = arith.addi %3859, %__rlasp_stack_elide_zero_254 : i64
      %3864 = func.call @cc_nil_value() : () -> i64
      %3865 = func.call @cc_errorp(%3647) : (i64) -> i64
      %3866 = arith.cmpi ne, %3865, %3864 : i64
      %3867 = arith.cmpi eq, %3864, %3864 : i64
      %3868 = arith.andi %3866, %3867 : i1
      %3869 = scf.if %3868 -> (i64) {
        scf.yield %3647 : i64
      } else {
        scf.yield %3864 : i64
      }
      %3870 = func.call @cc_errorp(%3743) : (i64) -> i64
      %3871 = arith.cmpi ne, %3870, %3864 : i64
      %3872 = arith.cmpi eq, %3869, %3864 : i64
      %3873 = arith.andi %3871, %3872 : i1
      %3874 = scf.if %3873 -> (i64) {
        scf.yield %3743 : i64
      } else {
        scf.yield %3869 : i64
      }
      %3875 = func.call @cc_errorp(%3810) : (i64) -> i64
      %3876 = arith.cmpi ne, %3875, %3864 : i64
      %3877 = arith.cmpi eq, %3874, %3864 : i64
      %3878 = arith.andi %3876, %3877 : i1
      %3879 = scf.if %3878 -> (i64) {
        scf.yield %3810 : i64
      } else {
        scf.yield %3874 : i64
      }
      %3880 = func.call @cc_errorp(%3833) : (i64) -> i64
      %3881 = arith.cmpi ne, %3880, %3864 : i64
      %3882 = arith.cmpi eq, %3879, %3864 : i64
      %3883 = arith.andi %3881, %3882 : i1
      %3884 = scf.if %3883 -> (i64) {
        scf.yield %3833 : i64
      } else {
        scf.yield %3879 : i64
      }
      %3885 = func.call @cc_errorp(%3840) : (i64) -> i64
      %3886 = arith.cmpi ne, %3885, %3864 : i64
      %3887 = arith.cmpi eq, %3884, %3864 : i64
      %3888 = arith.andi %3886, %3887 : i1
      %3889 = scf.if %3888 -> (i64) {
        scf.yield %3840 : i64
      } else {
        scf.yield %3884 : i64
      }
      %3890 = func.call @cc_errorp(%3844) : (i64) -> i64
      %3891 = arith.cmpi ne, %3890, %3864 : i64
      %3892 = arith.cmpi eq, %3889, %3864 : i64
      %3893 = arith.andi %3891, %3892 : i1
      %3894 = scf.if %3893 -> (i64) {
        scf.yield %3844 : i64
      } else {
        scf.yield %3889 : i64
      }
      %3895 = func.call @cc_errorp(%3851) : (i64) -> i64
      %3896 = arith.cmpi ne, %3895, %3864 : i64
      %3897 = arith.cmpi eq, %3894, %3864 : i64
      %3898 = arith.andi %3896, %3897 : i1
      %3899 = scf.if %3898 -> (i64) {
        scf.yield %3851 : i64
      } else {
        scf.yield %3894 : i64
      }
      %3900 = func.call @cc_errorp(%3863) : (i64) -> i64
      %3901 = arith.cmpi ne, %3900, %3864 : i64
      %3902 = arith.cmpi eq, %3899, %3864 : i64
      %3903 = arith.andi %3901, %3902 : i1
      %3904 = scf.if %3903 -> (i64) {
        scf.yield %3863 : i64
      } else {
        scf.yield %3899 : i64
      }
      %3905 = arith.cmpi ne, %3904, %3864 : i64
      scf.if %3905 {
        func.call @stack_push_pointer(%3904) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3647) : (i64) -> ()
        func.call @stack_push_pointer(%3743) : (i64) -> ()
        func.call @stack_push_pointer(%3810) : (i64) -> ()
        func.call @stack_push_pointer(%3833) : (i64) -> ()
        func.call @stack_push_pointer(%3840) : (i64) -> ()
        func.call @stack_push_pointer(%3844) : (i64) -> ()
        func.call @stack_push_pointer(%3851) : (i64) -> ()
        func.call @stack_push_pointer(%3863) : (i64) -> ()
        %3906 = llvm.mlir.addressof @str344 : !llvm.ptr
        %3907 = func.call @cc_make_function_ref_const(%3906) : (!llvm.ptr) -> i64
        %3908 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3907, %3908) : (i64, i64) -> ()
      }
      %3909 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3909 : i64
    }
    %3910 = func.call @cc_nil_value() : () -> i64
    %3911 = func.call @cc_errorp(%3638) : (i64) -> i64
    %3912 = arith.cmpi ne, %3911, %3910 : i64
    %3913 = scf.if %3912 -> (i64) {
      scf.yield %3638 : i64
    } else {
      %3914 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3915 = arith.constant 13 : i64
      %3916 = func.call @cc_make_string(%3914, %3915) : (!llvm.ptr, i64) -> i64
      %3917 = func.call @cc_nil_value() : () -> i64
      %3918 = func.call @cc_intern(%3916, %3917) : (i64, i64) -> i64
      %3919 = func.call @cc_nil_value() : () -> i64
      %3920 = func.call @cc_cons(%3918, %3919) : (i64, i64) -> i64
      %3921 = func.call @cc_values_pack(%3920) : (i64) -> i64
      %__rlasp_stack_elide_zero_255 = arith.constant 0 : i64
      %3922 = arith.addi %3918, %__rlasp_stack_elide_zero_255 : i64
      %3923 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3924 = arith.constant 6 : i64
      %3925 = func.call @cc_make_string(%3923, %3924) : (!llvm.ptr, i64) -> i64
      %3926 = func.call @cc_nil_value() : () -> i64
      %3927 = func.call @cc_intern(%3925, %3926) : (i64, i64) -> i64
      %3928 = func.call @cc_nil_value() : () -> i64
      %3929 = func.call @cc_cons(%3927, %3928) : (i64, i64) -> i64
      %3930 = func.call @cc_values_pack(%3929) : (i64) -> i64
      func.call @stack_push_pointer(%3927) : (i64) -> ()
      %3931 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3932 = arith.constant 11 : i64
      %3933 = func.call @cc_make_string(%3931, %3932) : (!llvm.ptr, i64) -> i64
      %3934 = func.call @cc_nil_value() : () -> i64
      %3935 = func.call @cc_intern(%3933, %3934) : (i64, i64) -> i64
      %3936 = func.call @cc_nil_value() : () -> i64
      %3937 = func.call @cc_cons(%3935, %3936) : (i64, i64) -> i64
      %3938 = func.call @cc_values_pack(%3937) : (i64) -> i64
      func.call @stack_push_pointer(%3935) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3939 = func.call @stack_pop_pointer() : () -> i64
      %3940 = func.call @stack_pop_pointer() : () -> i64
      %3941 = func.call @cc_cons(%3940, %3939) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_256 = arith.constant 0 : i64
      %3942 = arith.addi %3941, %__rlasp_stack_elide_zero_256 : i64
      %3943 = func.call @stack_pop_pointer() : () -> i64
      %3944 = func.call @cc_cons(%3943, %3942) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_257 = arith.constant 0 : i64
      %3945 = arith.addi %3944, %__rlasp_stack_elide_zero_257 : i64
      %3966 = arith.constant 47863920853004 : i64
      %3967 = arith.constant 0 : i64
      %3968 = func.call @cc_make_closure(%3966, %3967) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_258 = arith.constant 0 : i64
      %3969 = arith.addi %3968, %__rlasp_stack_elide_zero_258 : i64
      %3970 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3971 = arith.constant 9 : i64
      %3972 = func.call @cc_make_string(%3970, %3971) : (!llvm.ptr, i64) -> i64
      %3973 = func.call @cc_nil_value() : () -> i64
      %3974 = func.call @cc_intern(%3972, %3973) : (i64, i64) -> i64
      %3975 = func.call @cc_nil_value() : () -> i64
      %3976 = func.call @cc_cons(%3974, %3975) : (i64, i64) -> i64
      %3977 = func.call @cc_values_pack(%3976) : (i64) -> i64
      func.call @stack_push_pointer(%3974) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3978 = func.call @stack_pop_pointer() : () -> i64
      %3979 = func.call @stack_pop_pointer() : () -> i64
      %3980 = func.call @cc_cons(%3979, %3978) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_259 = arith.constant 0 : i64
      %3981 = arith.addi %3980, %__rlasp_stack_elide_zero_259 : i64
      %3982 = llvm.mlir.addressof @str350 : !llvm.ptr
      %3983 = arith.constant 11 : i64
      %3984 = func.call @cc_make_string(%3982, %3983) : (!llvm.ptr, i64) -> i64
      %3985 = llvm.mlir.addressof @str351 : !llvm.ptr
      %3986 = arith.constant 7 : i64
      %3987 = func.call @cc_make_string(%3985, %3986) : (!llvm.ptr, i64) -> i64
      %3988 = func.call @cc_intern(%3984, %3987) : (i64, i64) -> i64
      %3989 = func.call @cc_nil_value() : () -> i64
      %3990 = func.call @cc_cons(%3988, %3989) : (i64, i64) -> i64
      %3991 = func.call @cc_values_pack(%3990) : (i64) -> i64
      %3992 = func.call @cc_nil_value() : () -> i64
      %3993 = llvm.mlir.addressof @str352 : !llvm.ptr
      %3994 = arith.constant 4 : i64
      %3995 = func.call @cc_make_string(%3993, %3994) : (!llvm.ptr, i64) -> i64
      %3996 = llvm.mlir.addressof @str353 : !llvm.ptr
      %3997 = arith.constant 7 : i64
      %3998 = func.call @cc_make_string(%3996, %3997) : (!llvm.ptr, i64) -> i64
      %3999 = func.call @cc_intern(%3995, %3998) : (i64, i64) -> i64
      %4000 = func.call @cc_nil_value() : () -> i64
      %4001 = func.call @cc_cons(%3999, %4000) : (i64, i64) -> i64
      %4002 = func.call @cc_values_pack(%4001) : (i64) -> i64
      %4003 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4004 = arith.constant 5 : i64
      %4005 = func.call @cc_make_string(%4003, %4004) : (!llvm.ptr, i64) -> i64
      %4006 = func.call @cc_nil_value() : () -> i64
      %4007 = func.call @cc_intern(%4005, %4006) : (i64, i64) -> i64
      %4008 = func.call @cc_nil_value() : () -> i64
      %4009 = func.call @cc_cons(%4007, %4008) : (i64, i64) -> i64
      %4010 = func.call @cc_values_pack(%4009) : (i64) -> i64
      %__rlasp_stack_elide_zero_260 = arith.constant 0 : i64
      %4011 = arith.addi %4007, %__rlasp_stack_elide_zero_260 : i64
      %4012 = func.call @cc_nil_value() : () -> i64
      %4013 = func.call @cc_errorp(%3922) : (i64) -> i64
      %4014 = arith.cmpi ne, %4013, %4012 : i64
      %4015 = arith.cmpi eq, %4012, %4012 : i64
      %4016 = arith.andi %4014, %4015 : i1
      %4017 = scf.if %4016 -> (i64) {
        scf.yield %3922 : i64
      } else {
        scf.yield %4012 : i64
      }
      %4018 = func.call @cc_errorp(%3945) : (i64) -> i64
      %4019 = arith.cmpi ne, %4018, %4012 : i64
      %4020 = arith.cmpi eq, %4017, %4012 : i64
      %4021 = arith.andi %4019, %4020 : i1
      %4022 = scf.if %4021 -> (i64) {
        scf.yield %3945 : i64
      } else {
        scf.yield %4017 : i64
      }
      %4023 = func.call @cc_errorp(%3969) : (i64) -> i64
      %4024 = arith.cmpi ne, %4023, %4012 : i64
      %4025 = arith.cmpi eq, %4022, %4012 : i64
      %4026 = arith.andi %4024, %4025 : i1
      %4027 = scf.if %4026 -> (i64) {
        scf.yield %3969 : i64
      } else {
        scf.yield %4022 : i64
      }
      %4028 = func.call @cc_errorp(%3981) : (i64) -> i64
      %4029 = arith.cmpi ne, %4028, %4012 : i64
      %4030 = arith.cmpi eq, %4027, %4012 : i64
      %4031 = arith.andi %4029, %4030 : i1
      %4032 = scf.if %4031 -> (i64) {
        scf.yield %3981 : i64
      } else {
        scf.yield %4027 : i64
      }
      %4033 = func.call @cc_errorp(%3988) : (i64) -> i64
      %4034 = arith.cmpi ne, %4033, %4012 : i64
      %4035 = arith.cmpi eq, %4032, %4012 : i64
      %4036 = arith.andi %4034, %4035 : i1
      %4037 = scf.if %4036 -> (i64) {
        scf.yield %3988 : i64
      } else {
        scf.yield %4032 : i64
      }
      %4038 = func.call @cc_errorp(%3992) : (i64) -> i64
      %4039 = arith.cmpi ne, %4038, %4012 : i64
      %4040 = arith.cmpi eq, %4037, %4012 : i64
      %4041 = arith.andi %4039, %4040 : i1
      %4042 = scf.if %4041 -> (i64) {
        scf.yield %3992 : i64
      } else {
        scf.yield %4037 : i64
      }
      %4043 = func.call @cc_errorp(%3999) : (i64) -> i64
      %4044 = arith.cmpi ne, %4043, %4012 : i64
      %4045 = arith.cmpi eq, %4042, %4012 : i64
      %4046 = arith.andi %4044, %4045 : i1
      %4047 = scf.if %4046 -> (i64) {
        scf.yield %3999 : i64
      } else {
        scf.yield %4042 : i64
      }
      %4048 = func.call @cc_errorp(%4011) : (i64) -> i64
      %4049 = arith.cmpi ne, %4048, %4012 : i64
      %4050 = arith.cmpi eq, %4047, %4012 : i64
      %4051 = arith.andi %4049, %4050 : i1
      %4052 = scf.if %4051 -> (i64) {
        scf.yield %4011 : i64
      } else {
        scf.yield %4047 : i64
      }
      %4053 = arith.cmpi ne, %4052, %4012 : i64
      scf.if %4053 {
        func.call @stack_push_pointer(%4052) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3922) : (i64) -> ()
        func.call @stack_push_pointer(%3945) : (i64) -> ()
        func.call @stack_push_pointer(%3969) : (i64) -> ()
        func.call @stack_push_pointer(%3981) : (i64) -> ()
        func.call @stack_push_pointer(%3988) : (i64) -> ()
        func.call @stack_push_pointer(%3992) : (i64) -> ()
        func.call @stack_push_pointer(%3999) : (i64) -> ()
        func.call @stack_push_pointer(%4011) : (i64) -> ()
        %4054 = llvm.mlir.addressof @str355 : !llvm.ptr
        %4055 = func.call @cc_make_function_ref_const(%4054) : (!llvm.ptr) -> i64
        %4056 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4055, %4056) : (i64, i64) -> ()
      }
      %4057 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4057 : i64
    }
    %4058 = func.call @cc_nil_value() : () -> i64
    %4059 = func.call @cc_errorp(%3913) : (i64) -> i64
    %4060 = arith.cmpi ne, %4059, %4058 : i64
    %4061 = scf.if %4060 -> (i64) {
      scf.yield %3913 : i64
    } else {
      %4065 = llvm.mlir.addressof @method_name_47863920853005 : !llvm.ptr
      %4066 = func.call @cc_make_lambda_ref_str(%4065) : (!llvm.ptr) -> i64
      %4067 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4068 = arith.constant 35 : i64
      %4069 = func.call @cc_make_string(%4067, %4068) : (!llvm.ptr, i64) -> i64
      %4070 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4071 = arith.constant 11 : i64
      %4072 = func.call @cc_make_string(%4070, %4071) : (!llvm.ptr, i64) -> i64
      %4073 = func.call @cc_intern(%4069, %4072) : (i64, i64) -> i64
      %4074 = func.call @cc_nil_value() : () -> i64
      %4075 = func.call @cc_cons(%4073, %4074) : (i64, i64) -> i64
      %4076 = func.call @cc_values_pack(%4075) : (i64) -> i64
      %4077 = func.call @cc_nil() : () -> i64
      %4078 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4079 = arith.constant 1 : i64
      %4080 = func.call @cc_make_string(%4078, %4079) : (!llvm.ptr, i64) -> i64
      %4081 = func.call @cc_nil_value() : () -> i64
      %4082 = func.call @cc_intern(%4080, %4081) : (i64, i64) -> i64
      %4083 = func.call @cc_nil_value() : () -> i64
      %4084 = func.call @cc_cons(%4082, %4083) : (i64, i64) -> i64
      %4085 = func.call @cc_values_pack(%4084) : (i64) -> i64
      %4086 = func.call @cc_cons(%4082, %4077) : (i64, i64) -> i64
      %4087 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4088 = arith.constant 1 : i64
      %4089 = func.call @cc_make_string(%4087, %4088) : (!llvm.ptr, i64) -> i64
      %4090 = func.call @cc_nil_value() : () -> i64
      %4091 = func.call @cc_intern(%4089, %4090) : (i64, i64) -> i64
      %4092 = func.call @cc_nil_value() : () -> i64
      %4093 = func.call @cc_cons(%4091, %4092) : (i64, i64) -> i64
      %4094 = func.call @cc_values_pack(%4093) : (i64) -> i64
      %4095 = func.call @cc_cons(%4091, %4086) : (i64, i64) -> i64
      %4096 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4097 = arith.constant 9 : i64
      %4098 = func.call @cc_make_string(%4096, %4097) : (!llvm.ptr, i64) -> i64
      %4099 = func.call @cc_nil_value() : () -> i64
      %4100 = func.call @cc_intern(%4098, %4099) : (i64, i64) -> i64
      %4101 = func.call @cc_nil_value() : () -> i64
      %4102 = func.call @cc_cons(%4100, %4101) : (i64, i64) -> i64
      %4103 = func.call @cc_values_pack(%4102) : (i64) -> i64
      %4104 = func.call @cc_cons(%4100, %4095) : (i64, i64) -> i64
      %4105 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4106 = arith.constant 9 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = func.call @cc_nil_value() : () -> i64
      %4109 = func.call @cc_intern(%4107, %4108) : (i64, i64) -> i64
      %4110 = func.call @cc_nil_value() : () -> i64
      %4111 = func.call @cc_cons(%4109, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_values_pack(%4111) : (i64) -> i64
      %4113 = func.call @cc_cons(%4109, %4104) : (i64, i64) -> i64
      %4114 = arith.constant 4 : i64
      %4115 = func.call @cc_box_fixnum(%4114) : (i64) -> i64
      %4116 = arith.constant 1 : i64
      %4117 = func.call @cc_defmethod_qualified(%4073, %4113, %4066, %4115, %4116) : (i64, i64, i64, i64, i64) -> i64
      %4118 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4118) : (i64) -> ()
      %4119 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4119) : (i64) -> ()
      %4120 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4120) : (i64) -> ()
      %4121 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4122 = arith.constant 8 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = func.call @cc_nil_value() : () -> i64
      %4125 = func.call @cc_intern(%4123, %4124) : (i64, i64) -> i64
      %4126 = func.call @cc_nil_value() : () -> i64
      %4127 = func.call @cc_cons(%4125, %4126) : (i64, i64) -> i64
      %4128 = func.call @cc_values_pack(%4127) : (i64) -> i64
      %__rlasp_stack_elide_zero_261 = arith.constant 0 : i64
      %4129 = arith.addi %4125, %__rlasp_stack_elide_zero_261 : i64
      %4130 = func.call @stack_pop_pointer() : () -> i64
      %4131 = func.call @cc_cons(%4129, %4130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4131) : (i64) -> ()
      %4132 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4133 = arith.constant 6 : i64
      %4134 = func.call @cc_make_string(%4132, %4133) : (!llvm.ptr, i64) -> i64
      %4135 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4136 = arith.constant 11 : i64
      %4137 = func.call @cc_make_string(%4135, %4136) : (!llvm.ptr, i64) -> i64
      %4138 = func.call @cc_intern(%4134, %4137) : (i64, i64) -> i64
      %4139 = func.call @cc_nil_value() : () -> i64
      %4140 = func.call @cc_cons(%4138, %4139) : (i64, i64) -> i64
      %4141 = func.call @cc_values_pack(%4140) : (i64) -> i64
      %__rlasp_stack_elide_zero_262 = arith.constant 0 : i64
      %4142 = arith.addi %4138, %__rlasp_stack_elide_zero_262 : i64
      %4143 = func.call @stack_pop_pointer() : () -> i64
      %4144 = func.call @cc_cons(%4142, %4143) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_263 = arith.constant 0 : i64
      %4145 = arith.addi %4144, %__rlasp_stack_elide_zero_263 : i64
      %4146 = func.call @stack_pop_pointer() : () -> i64
      %4147 = func.call @cc_cons(%4145, %4146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4147) : (i64) -> ()
      %4148 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4149 = arith.constant 7 : i64
      %4150 = func.call @cc_make_string(%4148, %4149) : (!llvm.ptr, i64) -> i64
      %4151 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4152 = arith.constant 11 : i64
      %4153 = func.call @cc_make_string(%4151, %4152) : (!llvm.ptr, i64) -> i64
      %4154 = func.call @cc_intern(%4150, %4153) : (i64, i64) -> i64
      %4155 = func.call @cc_nil_value() : () -> i64
      %4156 = func.call @cc_cons(%4154, %4155) : (i64, i64) -> i64
      %4157 = func.call @cc_values_pack(%4156) : (i64) -> i64
      %__rlasp_stack_elide_zero_264 = arith.constant 0 : i64
      %4158 = arith.addi %4154, %__rlasp_stack_elide_zero_264 : i64
      %4159 = func.call @stack_pop_pointer() : () -> i64
      %4160 = func.call @cc_cons(%4158, %4159) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_265 = arith.constant 0 : i64
      %4161 = arith.addi %4160, %__rlasp_stack_elide_zero_265 : i64
      %4162 = func.call @stack_pop_pointer() : () -> i64
      %4163 = func.call @cc_cons(%4161, %4162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4163) : (i64) -> ()
      %4164 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4164) : (i64) -> ()
      %4165 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4166 = arith.constant 8 : i64
      %4167 = func.call @cc_make_string(%4165, %4166) : (!llvm.ptr, i64) -> i64
      %4168 = func.call @cc_nil_value() : () -> i64
      %4169 = func.call @cc_intern(%4167, %4168) : (i64, i64) -> i64
      %4170 = func.call @cc_nil_value() : () -> i64
      %4171 = func.call @cc_cons(%4169, %4170) : (i64, i64) -> i64
      %4172 = func.call @cc_values_pack(%4171) : (i64) -> i64
      %__rlasp_stack_elide_zero_266 = arith.constant 0 : i64
      %4173 = arith.addi %4169, %__rlasp_stack_elide_zero_266 : i64
      %4174 = func.call @stack_pop_pointer() : () -> i64
      %4175 = func.call @cc_cons(%4173, %4174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4175) : (i64) -> ()
      %4176 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4177 = arith.constant 5 : i64
      %4178 = func.call @cc_make_string(%4176, %4177) : (!llvm.ptr, i64) -> i64
      %4179 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4180 = arith.constant 11 : i64
      %4181 = func.call @cc_make_string(%4179, %4180) : (!llvm.ptr, i64) -> i64
      %4182 = func.call @cc_intern(%4178, %4181) : (i64, i64) -> i64
      %4183 = func.call @cc_nil_value() : () -> i64
      %4184 = func.call @cc_cons(%4182, %4183) : (i64, i64) -> i64
      %4185 = func.call @cc_values_pack(%4184) : (i64) -> i64
      %__rlasp_stack_elide_zero_267 = arith.constant 0 : i64
      %4186 = arith.addi %4182, %__rlasp_stack_elide_zero_267 : i64
      %4187 = func.call @stack_pop_pointer() : () -> i64
      %4188 = func.call @cc_cons(%4186, %4187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4188) : (i64) -> ()
      %4189 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4189) : (i64) -> ()
      %4190 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4191 = arith.constant 9 : i64
      %4192 = func.call @cc_make_string(%4190, %4191) : (!llvm.ptr, i64) -> i64
      %4193 = func.call @cc_nil_value() : () -> i64
      %4194 = func.call @cc_intern(%4192, %4193) : (i64, i64) -> i64
      %4195 = func.call @cc_nil_value() : () -> i64
      %4196 = func.call @cc_cons(%4194, %4195) : (i64, i64) -> i64
      %4197 = func.call @cc_values_pack(%4196) : (i64) -> i64
      %__rlasp_stack_elide_zero_268 = arith.constant 0 : i64
      %4198 = arith.addi %4194, %__rlasp_stack_elide_zero_268 : i64
      %4199 = func.call @stack_pop_pointer() : () -> i64
      %4200 = func.call @cc_cons(%4198, %4199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4200) : (i64) -> ()
      %4201 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4202 = arith.constant 3 : i64
      %4203 = func.call @cc_make_string(%4201, %4202) : (!llvm.ptr, i64) -> i64
      %4204 = func.call @cc_nil_value() : () -> i64
      %4205 = func.call @cc_intern(%4203, %4204) : (i64, i64) -> i64
      %4206 = func.call @cc_nil_value() : () -> i64
      %4207 = func.call @cc_cons(%4205, %4206) : (i64, i64) -> i64
      %4208 = func.call @cc_values_pack(%4207) : (i64) -> i64
      %__rlasp_stack_elide_zero_269 = arith.constant 0 : i64
      %4209 = arith.addi %4205, %__rlasp_stack_elide_zero_269 : i64
      %4210 = func.call @stack_pop_pointer() : () -> i64
      %4211 = func.call @cc_cons(%4209, %4210) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_270 = arith.constant 0 : i64
      %4212 = arith.addi %4211, %__rlasp_stack_elide_zero_270 : i64
      %4213 = func.call @stack_pop_pointer() : () -> i64
      %4214 = func.call @cc_cons(%4212, %4213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4214) : (i64) -> ()
      %4215 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4215) : (i64) -> ()
      %4216 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4217 = arith.constant 9 : i64
      %4218 = func.call @cc_make_string(%4216, %4217) : (!llvm.ptr, i64) -> i64
      %4219 = func.call @cc_nil_value() : () -> i64
      %4220 = func.call @cc_intern(%4218, %4219) : (i64, i64) -> i64
      %4221 = func.call @cc_nil_value() : () -> i64
      %4222 = func.call @cc_cons(%4220, %4221) : (i64, i64) -> i64
      %4223 = func.call @cc_values_pack(%4222) : (i64) -> i64
      %__rlasp_stack_elide_zero_271 = arith.constant 0 : i64
      %4224 = arith.addi %4220, %__rlasp_stack_elide_zero_271 : i64
      %4225 = func.call @stack_pop_pointer() : () -> i64
      %4226 = func.call @cc_cons(%4224, %4225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4226) : (i64) -> ()
      %4227 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4228 = arith.constant 3 : i64
      %4229 = func.call @cc_make_string(%4227, %4228) : (!llvm.ptr, i64) -> i64
      %4230 = func.call @cc_nil_value() : () -> i64
      %4231 = func.call @cc_intern(%4229, %4230) : (i64, i64) -> i64
      %4232 = func.call @cc_nil_value() : () -> i64
      %4233 = func.call @cc_cons(%4231, %4232) : (i64, i64) -> i64
      %4234 = func.call @cc_values_pack(%4233) : (i64) -> i64
      %__rlasp_stack_elide_zero_272 = arith.constant 0 : i64
      %4235 = arith.addi %4231, %__rlasp_stack_elide_zero_272 : i64
      %4236 = func.call @stack_pop_pointer() : () -> i64
      %4237 = func.call @cc_cons(%4235, %4236) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_273 = arith.constant 0 : i64
      %4238 = arith.addi %4237, %__rlasp_stack_elide_zero_273 : i64
      %4239 = func.call @stack_pop_pointer() : () -> i64
      %4240 = func.call @cc_cons(%4238, %4239) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_274 = arith.constant 0 : i64
      %4241 = arith.addi %4240, %__rlasp_stack_elide_zero_274 : i64
      %4242 = func.call @stack_pop_pointer() : () -> i64
      %4243 = func.call @cc_cons(%4241, %4242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4243) : (i64) -> ()
      %4244 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4245 = arith.constant 6 : i64
      %4246 = func.call @cc_make_string(%4244, %4245) : (!llvm.ptr, i64) -> i64
      %4247 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4248 = arith.constant 7 : i64
      %4249 = func.call @cc_make_string(%4247, %4248) : (!llvm.ptr, i64) -> i64
      %4250 = func.call @cc_intern(%4246, %4249) : (i64, i64) -> i64
      %4251 = func.call @cc_nil_value() : () -> i64
      %4252 = func.call @cc_cons(%4250, %4251) : (i64, i64) -> i64
      %4253 = func.call @cc_values_pack(%4252) : (i64) -> i64
      %__rlasp_stack_elide_zero_275 = arith.constant 0 : i64
      %4254 = arith.addi %4250, %__rlasp_stack_elide_zero_275 : i64
      %4255 = func.call @stack_pop_pointer() : () -> i64
      %4256 = func.call @cc_cons(%4254, %4255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4256) : (i64) -> ()
      %4257 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4258 = arith.constant 35 : i64
      %4259 = func.call @cc_make_string(%4257, %4258) : (!llvm.ptr, i64) -> i64
      %4260 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4261 = arith.constant 11 : i64
      %4262 = func.call @cc_make_string(%4260, %4261) : (!llvm.ptr, i64) -> i64
      %4263 = func.call @cc_intern(%4259, %4262) : (i64, i64) -> i64
      %4264 = func.call @cc_nil_value() : () -> i64
      %4265 = func.call @cc_cons(%4263, %4264) : (i64, i64) -> i64
      %4266 = func.call @cc_values_pack(%4265) : (i64) -> i64
      %__rlasp_stack_elide_zero_276 = arith.constant 0 : i64
      %4267 = arith.addi %4263, %__rlasp_stack_elide_zero_276 : i64
      %4268 = func.call @stack_pop_pointer() : () -> i64
      %4269 = func.call @cc_cons(%4267, %4268) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4269) : (i64) -> ()
      %4270 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4271 = arith.constant 9 : i64
      %4272 = func.call @cc_make_string(%4270, %4271) : (!llvm.ptr, i64) -> i64
      %4273 = func.call @cc_nil_value() : () -> i64
      %4274 = func.call @cc_intern(%4272, %4273) : (i64, i64) -> i64
      %4275 = func.call @cc_nil_value() : () -> i64
      %4276 = func.call @cc_cons(%4274, %4275) : (i64, i64) -> i64
      %4277 = func.call @cc_values_pack(%4276) : (i64) -> i64
      %__rlasp_stack_elide_zero_277 = arith.constant 0 : i64
      %4278 = arith.addi %4274, %__rlasp_stack_elide_zero_277 : i64
      %4279 = func.call @stack_pop_pointer() : () -> i64
      %4280 = func.call @cc_cons(%4278, %4279) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_278 = arith.constant 0 : i64
      %4281 = arith.addi %4280, %__rlasp_stack_elide_zero_278 : i64
      %4282 = func.call @cc_nil_value() : () -> i64
      %4283 = func.call @cc_cons(%4281, %4282) : (i64, i64) -> i64
      %4284 = func.call @cc_eval(%4283) : (i64) -> i64
      %4285 = func.call @cc_multiple_value_list(%4284) : (i64) -> i64
      %4286 = func.call @cc_values_pack(%4285) : (i64) -> i64
      %__rlasp_stack_elide_zero_279 = arith.constant 0 : i64
      %4287 = arith.addi %4286, %__rlasp_stack_elide_zero_279 : i64
      scf.yield %4287 : i64
    }
    %4288 = func.call @cc_nil_value() : () -> i64
    %4289 = func.call @cc_errorp(%4061) : (i64) -> i64
    %4290 = arith.cmpi ne, %4289, %4288 : i64
    %4291 = scf.if %4290 -> (i64) {
      scf.yield %4061 : i64
    } else {
      %4292 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4293 = arith.constant 13 : i64
      %4294 = func.call @cc_make_string(%4292, %4293) : (!llvm.ptr, i64) -> i64
      %4295 = func.call @cc_nil_value() : () -> i64
      %4296 = func.call @cc_intern(%4294, %4295) : (i64, i64) -> i64
      %4297 = func.call @cc_nil_value() : () -> i64
      %4298 = func.call @cc_cons(%4296, %4297) : (i64, i64) -> i64
      %4299 = func.call @cc_values_pack(%4298) : (i64) -> i64
      %__rlasp_stack_elide_zero_280 = arith.constant 0 : i64
      %4300 = arith.addi %4296, %__rlasp_stack_elide_zero_280 : i64
      %4301 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4302 = arith.constant 5 : i64
      %4303 = func.call @cc_make_string(%4301, %4302) : (!llvm.ptr, i64) -> i64
      %4304 = func.call @cc_nil_value() : () -> i64
      %4305 = func.call @cc_intern(%4303, %4304) : (i64, i64) -> i64
      %4306 = func.call @cc_nil_value() : () -> i64
      %4307 = func.call @cc_cons(%4305, %4306) : (i64, i64) -> i64
      %4308 = func.call @cc_values_pack(%4307) : (i64) -> i64
      func.call @stack_push_pointer(%4305) : (i64) -> ()
      %4309 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4310 = arith.constant 12 : i64
      %4311 = func.call @cc_make_string(%4309, %4310) : (!llvm.ptr, i64) -> i64
      %4312 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4313 = arith.constant 11 : i64
      %4314 = func.call @cc_make_string(%4312, %4313) : (!llvm.ptr, i64) -> i64
      %4315 = func.call @cc_intern(%4311, %4314) : (i64, i64) -> i64
      %4316 = func.call @cc_nil_value() : () -> i64
      %4317 = func.call @cc_cons(%4315, %4316) : (i64, i64) -> i64
      %4318 = func.call @cc_values_pack(%4317) : (i64) -> i64
      func.call @stack_push_pointer(%4315) : (i64) -> ()
      %4319 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4320 = arith.constant 11 : i64
      %4321 = func.call @cc_make_string(%4319, %4320) : (!llvm.ptr, i64) -> i64
      %4322 = func.call @cc_nil_value() : () -> i64
      %4323 = func.call @cc_intern(%4321, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_nil_value() : () -> i64
      %4325 = func.call @cc_cons(%4323, %4324) : (i64, i64) -> i64
      %4326 = func.call @cc_values_pack(%4325) : (i64) -> i64
      func.call @stack_push_pointer(%4323) : (i64) -> ()
      %4327 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4327) : (i64) -> ()
      %4328 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4329 = arith.constant 9 : i64
      %4330 = func.call @cc_make_string(%4328, %4329) : (!llvm.ptr, i64) -> i64
      %4331 = func.call @cc_nil_value() : () -> i64
      %4332 = func.call @cc_intern(%4330, %4331) : (i64, i64) -> i64
      %4333 = func.call @cc_nil_value() : () -> i64
      %4334 = func.call @cc_cons(%4332, %4333) : (i64, i64) -> i64
      %4335 = func.call @cc_values_pack(%4334) : (i64) -> i64
      %__rlasp_stack_elide_zero_281 = arith.constant 0 : i64
      %4336 = arith.addi %4332, %__rlasp_stack_elide_zero_281 : i64
      %4337 = func.call @stack_pop_pointer() : () -> i64
      %4338 = func.call @cc_cons(%4336, %4337) : (i64, i64) -> i64
      %4339 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4340 = arith.constant 5 : i64
      %4341 = func.call @cc_make_string(%4339, %4340) : (!llvm.ptr, i64) -> i64
      %4342 = func.call @cc_nil_value() : () -> i64
      %4343 = func.call @cc_intern(%4341, %4342) : (i64, i64) -> i64
      %4344 = func.call @cc_nil_value() : () -> i64
      %4345 = func.call @cc_cons(%4343, %4344) : (i64, i64) -> i64
      %4346 = func.call @cc_values_pack(%4345) : (i64) -> i64
      %4347 = func.call @cc_cons(%4343, %4338) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4347) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4348 = func.call @stack_pop_pointer() : () -> i64
      %4349 = func.call @stack_pop_pointer() : () -> i64
      %4350 = func.call @cc_cons(%4349, %4348) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_282 = arith.constant 0 : i64
      %4351 = arith.addi %4350, %__rlasp_stack_elide_zero_282 : i64
      %4352 = func.call @stack_pop_pointer() : () -> i64
      %4353 = func.call @cc_cons(%4352, %4351) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_283 = arith.constant 0 : i64
      %4354 = arith.addi %4353, %__rlasp_stack_elide_zero_283 : i64
      %4355 = func.call @stack_pop_pointer() : () -> i64
      %4356 = func.call @cc_cons(%4355, %4354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4356) : (i64) -> ()
      %4357 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4358 = arith.constant 10 : i64
      %4359 = func.call @cc_make_string(%4357, %4358) : (!llvm.ptr, i64) -> i64
      %4360 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4361 = arith.constant 11 : i64
      %4362 = func.call @cc_make_string(%4360, %4361) : (!llvm.ptr, i64) -> i64
      %4363 = func.call @cc_intern(%4359, %4362) : (i64, i64) -> i64
      %4364 = func.call @cc_nil_value() : () -> i64
      %4365 = func.call @cc_cons(%4363, %4364) : (i64, i64) -> i64
      %4366 = func.call @cc_values_pack(%4365) : (i64) -> i64
      func.call @stack_push_pointer(%4363) : (i64) -> ()
      %4367 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4368 = arith.constant 11 : i64
      %4369 = func.call @cc_make_string(%4367, %4368) : (!llvm.ptr, i64) -> i64
      %4370 = func.call @cc_nil_value() : () -> i64
      %4371 = func.call @cc_intern(%4369, %4370) : (i64, i64) -> i64
      %4372 = func.call @cc_nil_value() : () -> i64
      %4373 = func.call @cc_cons(%4371, %4372) : (i64, i64) -> i64
      %4374 = func.call @cc_values_pack(%4373) : (i64) -> i64
      func.call @stack_push_pointer(%4371) : (i64) -> ()
      %4375 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4375) : (i64) -> ()
      %4376 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4377 = arith.constant 4 : i64
      %4378 = func.call @cc_make_string(%4376, %4377) : (!llvm.ptr, i64) -> i64
      %4379 = func.call @cc_nil_value() : () -> i64
      %4380 = func.call @cc_intern(%4378, %4379) : (i64, i64) -> i64
      %4381 = func.call @cc_nil_value() : () -> i64
      %4382 = func.call @cc_cons(%4380, %4381) : (i64, i64) -> i64
      %4383 = func.call @cc_values_pack(%4382) : (i64) -> i64
      %__rlasp_stack_elide_zero_284 = arith.constant 0 : i64
      %4384 = arith.addi %4380, %__rlasp_stack_elide_zero_284 : i64
      %4385 = func.call @stack_pop_pointer() : () -> i64
      %4386 = func.call @cc_cons(%4384, %4385) : (i64, i64) -> i64
      %4387 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4388 = arith.constant 5 : i64
      %4389 = func.call @cc_make_string(%4387, %4388) : (!llvm.ptr, i64) -> i64
      %4390 = func.call @cc_nil_value() : () -> i64
      %4391 = func.call @cc_intern(%4389, %4390) : (i64, i64) -> i64
      %4392 = func.call @cc_nil_value() : () -> i64
      %4393 = func.call @cc_cons(%4391, %4392) : (i64, i64) -> i64
      %4394 = func.call @cc_values_pack(%4393) : (i64) -> i64
      %4395 = func.call @cc_cons(%4391, %4386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4396 = func.call @stack_pop_pointer() : () -> i64
      %4397 = func.call @stack_pop_pointer() : () -> i64
      %4398 = func.call @cc_cons(%4397, %4396) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_285 = arith.constant 0 : i64
      %4399 = arith.addi %4398, %__rlasp_stack_elide_zero_285 : i64
      %4400 = func.call @stack_pop_pointer() : () -> i64
      %4401 = func.call @cc_cons(%4400, %4399) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_286 = arith.constant 0 : i64
      %4402 = arith.addi %4401, %__rlasp_stack_elide_zero_286 : i64
      %4403 = func.call @stack_pop_pointer() : () -> i64
      %4404 = func.call @cc_cons(%4403, %4402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4404) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4405 = func.call @stack_pop_pointer() : () -> i64
      %4406 = func.call @stack_pop_pointer() : () -> i64
      %4407 = func.call @cc_cons(%4406, %4405) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_287 = arith.constant 0 : i64
      %4408 = arith.addi %4407, %__rlasp_stack_elide_zero_287 : i64
      %4409 = func.call @stack_pop_pointer() : () -> i64
      %4410 = func.call @cc_cons(%4409, %4408) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_288 = arith.constant 0 : i64
      %4411 = arith.addi %4410, %__rlasp_stack_elide_zero_288 : i64
      %4412 = func.call @stack_pop_pointer() : () -> i64
      %4413 = func.call @cc_cons(%4412, %4411) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_289 = arith.constant 0 : i64
      %4414 = arith.addi %4413, %__rlasp_stack_elide_zero_289 : i64
      %4485 = arith.constant 47863920853006 : i64
      %4486 = arith.constant 0 : i64
      %4487 = func.call @cc_make_closure(%4485, %4486) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_290 = arith.constant 0 : i64
      %4488 = arith.addi %4487, %__rlasp_stack_elide_zero_290 : i64
      %4489 = arith.constant 42 : i64
      func.call @stack_push_fixnum(%4489) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4490 = func.call @stack_pop_pointer() : () -> i64
      %4491 = func.call @stack_pop_pointer() : () -> i64
      %4492 = func.call @cc_cons(%4491, %4490) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_291 = arith.constant 0 : i64
      %4493 = arith.addi %4492, %__rlasp_stack_elide_zero_291 : i64
      %4494 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4495 = arith.constant 11 : i64
      %4496 = func.call @cc_make_string(%4494, %4495) : (!llvm.ptr, i64) -> i64
      %4497 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4498 = arith.constant 7 : i64
      %4499 = func.call @cc_make_string(%4497, %4498) : (!llvm.ptr, i64) -> i64
      %4500 = func.call @cc_intern(%4496, %4499) : (i64, i64) -> i64
      %4501 = func.call @cc_nil_value() : () -> i64
      %4502 = func.call @cc_cons(%4500, %4501) : (i64, i64) -> i64
      %4503 = func.call @cc_values_pack(%4502) : (i64) -> i64
      %4504 = func.call @cc_nil_value() : () -> i64
      %4505 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4506 = arith.constant 4 : i64
      %4507 = func.call @cc_make_string(%4505, %4506) : (!llvm.ptr, i64) -> i64
      %4508 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4509 = arith.constant 7 : i64
      %4510 = func.call @cc_make_string(%4508, %4509) : (!llvm.ptr, i64) -> i64
      %4511 = func.call @cc_intern(%4507, %4510) : (i64, i64) -> i64
      %4512 = func.call @cc_nil_value() : () -> i64
      %4513 = func.call @cc_cons(%4511, %4512) : (i64, i64) -> i64
      %4514 = func.call @cc_values_pack(%4513) : (i64) -> i64
      %4515 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4516 = arith.constant 6 : i64
      %4517 = func.call @cc_make_string(%4515, %4516) : (!llvm.ptr, i64) -> i64
      %4518 = func.call @cc_nil_value() : () -> i64
      %4519 = func.call @cc_intern(%4517, %4518) : (i64, i64) -> i64
      %4520 = func.call @cc_nil_value() : () -> i64
      %4521 = func.call @cc_cons(%4519, %4520) : (i64, i64) -> i64
      %4522 = func.call @cc_values_pack(%4521) : (i64) -> i64
      %__rlasp_stack_elide_zero_292 = arith.constant 0 : i64
      %4523 = arith.addi %4519, %__rlasp_stack_elide_zero_292 : i64
      %4524 = func.call @cc_nil_value() : () -> i64
      %4525 = func.call @cc_errorp(%4300) : (i64) -> i64
      %4526 = arith.cmpi ne, %4525, %4524 : i64
      %4527 = arith.cmpi eq, %4524, %4524 : i64
      %4528 = arith.andi %4526, %4527 : i1
      %4529 = scf.if %4528 -> (i64) {
        scf.yield %4300 : i64
      } else {
        scf.yield %4524 : i64
      }
      %4530 = func.call @cc_errorp(%4414) : (i64) -> i64
      %4531 = arith.cmpi ne, %4530, %4524 : i64
      %4532 = arith.cmpi eq, %4529, %4524 : i64
      %4533 = arith.andi %4531, %4532 : i1
      %4534 = scf.if %4533 -> (i64) {
        scf.yield %4414 : i64
      } else {
        scf.yield %4529 : i64
      }
      %4535 = func.call @cc_errorp(%4488) : (i64) -> i64
      %4536 = arith.cmpi ne, %4535, %4524 : i64
      %4537 = arith.cmpi eq, %4534, %4524 : i64
      %4538 = arith.andi %4536, %4537 : i1
      %4539 = scf.if %4538 -> (i64) {
        scf.yield %4488 : i64
      } else {
        scf.yield %4534 : i64
      }
      %4540 = func.call @cc_errorp(%4493) : (i64) -> i64
      %4541 = arith.cmpi ne, %4540, %4524 : i64
      %4542 = arith.cmpi eq, %4539, %4524 : i64
      %4543 = arith.andi %4541, %4542 : i1
      %4544 = scf.if %4543 -> (i64) {
        scf.yield %4493 : i64
      } else {
        scf.yield %4539 : i64
      }
      %4545 = func.call @cc_errorp(%4500) : (i64) -> i64
      %4546 = arith.cmpi ne, %4545, %4524 : i64
      %4547 = arith.cmpi eq, %4544, %4524 : i64
      %4548 = arith.andi %4546, %4547 : i1
      %4549 = scf.if %4548 -> (i64) {
        scf.yield %4500 : i64
      } else {
        scf.yield %4544 : i64
      }
      %4550 = func.call @cc_errorp(%4504) : (i64) -> i64
      %4551 = arith.cmpi ne, %4550, %4524 : i64
      %4552 = arith.cmpi eq, %4549, %4524 : i64
      %4553 = arith.andi %4551, %4552 : i1
      %4554 = scf.if %4553 -> (i64) {
        scf.yield %4504 : i64
      } else {
        scf.yield %4549 : i64
      }
      %4555 = func.call @cc_errorp(%4511) : (i64) -> i64
      %4556 = arith.cmpi ne, %4555, %4524 : i64
      %4557 = arith.cmpi eq, %4554, %4524 : i64
      %4558 = arith.andi %4556, %4557 : i1
      %4559 = scf.if %4558 -> (i64) {
        scf.yield %4511 : i64
      } else {
        scf.yield %4554 : i64
      }
      %4560 = func.call @cc_errorp(%4523) : (i64) -> i64
      %4561 = arith.cmpi ne, %4560, %4524 : i64
      %4562 = arith.cmpi eq, %4559, %4524 : i64
      %4563 = arith.andi %4561, %4562 : i1
      %4564 = scf.if %4563 -> (i64) {
        scf.yield %4523 : i64
      } else {
        scf.yield %4559 : i64
      }
      %4565 = arith.cmpi ne, %4564, %4524 : i64
      scf.if %4565 {
        func.call @stack_push_pointer(%4564) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4300) : (i64) -> ()
        func.call @stack_push_pointer(%4414) : (i64) -> ()
        func.call @stack_push_pointer(%4488) : (i64) -> ()
        func.call @stack_push_pointer(%4493) : (i64) -> ()
        func.call @stack_push_pointer(%4500) : (i64) -> ()
        func.call @stack_push_pointer(%4504) : (i64) -> ()
        func.call @stack_push_pointer(%4511) : (i64) -> ()
        func.call @stack_push_pointer(%4523) : (i64) -> ()
        %4566 = llvm.mlir.addressof @str402 : !llvm.ptr
        %4567 = func.call @cc_make_function_ref_const(%4566) : (!llvm.ptr) -> i64
        %4568 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4567, %4568) : (i64, i64) -> ()
      }
      %4569 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4569 : i64
    }
    %4570 = func.call @cc_nil_value() : () -> i64
    %4571 = func.call @cc_errorp(%4291) : (i64) -> i64
    %4572 = arith.cmpi ne, %4571, %4570 : i64
    %4573 = scf.if %4572 -> (i64) {
      scf.yield %4291 : i64
    } else {
      %4574 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4575 = arith.constant 13 : i64
      %4576 = func.call @cc_make_string(%4574, %4575) : (!llvm.ptr, i64) -> i64
      %4577 = func.call @cc_nil_value() : () -> i64
      %4578 = func.call @cc_intern(%4576, %4577) : (i64, i64) -> i64
      %4579 = func.call @cc_nil_value() : () -> i64
      %4580 = func.call @cc_cons(%4578, %4579) : (i64, i64) -> i64
      %4581 = func.call @cc_values_pack(%4580) : (i64) -> i64
      %__rlasp_stack_elide_zero_293 = arith.constant 0 : i64
      %4582 = arith.addi %4578, %__rlasp_stack_elide_zero_293 : i64
      %4583 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4584 = arith.constant 6 : i64
      %4585 = func.call @cc_make_string(%4583, %4584) : (!llvm.ptr, i64) -> i64
      %4586 = func.call @cc_nil_value() : () -> i64
      %4587 = func.call @cc_intern(%4585, %4586) : (i64, i64) -> i64
      %4588 = func.call @cc_nil_value() : () -> i64
      %4589 = func.call @cc_cons(%4587, %4588) : (i64, i64) -> i64
      %4590 = func.call @cc_values_pack(%4589) : (i64) -> i64
      func.call @stack_push_pointer(%4587) : (i64) -> ()
      %4591 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4592 = arith.constant 11 : i64
      %4593 = func.call @cc_make_string(%4591, %4592) : (!llvm.ptr, i64) -> i64
      %4594 = func.call @cc_nil_value() : () -> i64
      %4595 = func.call @cc_intern(%4593, %4594) : (i64, i64) -> i64
      %4596 = func.call @cc_nil_value() : () -> i64
      %4597 = func.call @cc_cons(%4595, %4596) : (i64, i64) -> i64
      %4598 = func.call @cc_values_pack(%4597) : (i64) -> i64
      func.call @stack_push_pointer(%4595) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4599 = func.call @stack_pop_pointer() : () -> i64
      %4600 = func.call @stack_pop_pointer() : () -> i64
      %4601 = func.call @cc_cons(%4600, %4599) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_294 = arith.constant 0 : i64
      %4602 = arith.addi %4601, %__rlasp_stack_elide_zero_294 : i64
      %4603 = func.call @stack_pop_pointer() : () -> i64
      %4604 = func.call @cc_cons(%4603, %4602) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_295 = arith.constant 0 : i64
      %4605 = arith.addi %4604, %__rlasp_stack_elide_zero_295 : i64
      %4626 = arith.constant 47863920853007 : i64
      %4627 = arith.constant 0 : i64
      %4628 = func.call @cc_make_closure(%4626, %4627) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_296 = arith.constant 0 : i64
      %4629 = arith.addi %4628, %__rlasp_stack_elide_zero_296 : i64
      %4630 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4631 = arith.constant 9 : i64
      %4632 = func.call @cc_make_string(%4630, %4631) : (!llvm.ptr, i64) -> i64
      %4633 = func.call @cc_nil_value() : () -> i64
      %4634 = func.call @cc_intern(%4632, %4633) : (i64, i64) -> i64
      %4635 = func.call @cc_nil_value() : () -> i64
      %4636 = func.call @cc_cons(%4634, %4635) : (i64, i64) -> i64
      %4637 = func.call @cc_values_pack(%4636) : (i64) -> i64
      func.call @stack_push_pointer(%4634) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4638 = func.call @stack_pop_pointer() : () -> i64
      %4639 = func.call @stack_pop_pointer() : () -> i64
      %4640 = func.call @cc_cons(%4639, %4638) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_297 = arith.constant 0 : i64
      %4641 = arith.addi %4640, %__rlasp_stack_elide_zero_297 : i64
      %4642 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4643 = arith.constant 11 : i64
      %4644 = func.call @cc_make_string(%4642, %4643) : (!llvm.ptr, i64) -> i64
      %4645 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4646 = arith.constant 7 : i64
      %4647 = func.call @cc_make_string(%4645, %4646) : (!llvm.ptr, i64) -> i64
      %4648 = func.call @cc_intern(%4644, %4647) : (i64, i64) -> i64
      %4649 = func.call @cc_nil_value() : () -> i64
      %4650 = func.call @cc_cons(%4648, %4649) : (i64, i64) -> i64
      %4651 = func.call @cc_values_pack(%4650) : (i64) -> i64
      %4652 = func.call @cc_nil_value() : () -> i64
      %4653 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4654 = arith.constant 4 : i64
      %4655 = func.call @cc_make_string(%4653, %4654) : (!llvm.ptr, i64) -> i64
      %4656 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4657 = arith.constant 7 : i64
      %4658 = func.call @cc_make_string(%4656, %4657) : (!llvm.ptr, i64) -> i64
      %4659 = func.call @cc_intern(%4655, %4658) : (i64, i64) -> i64
      %4660 = func.call @cc_nil_value() : () -> i64
      %4661 = func.call @cc_cons(%4659, %4660) : (i64, i64) -> i64
      %4662 = func.call @cc_values_pack(%4661) : (i64) -> i64
      %4663 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4664 = arith.constant 5 : i64
      %4665 = func.call @cc_make_string(%4663, %4664) : (!llvm.ptr, i64) -> i64
      %4666 = func.call @cc_nil_value() : () -> i64
      %4667 = func.call @cc_intern(%4665, %4666) : (i64, i64) -> i64
      %4668 = func.call @cc_nil_value() : () -> i64
      %4669 = func.call @cc_cons(%4667, %4668) : (i64, i64) -> i64
      %4670 = func.call @cc_values_pack(%4669) : (i64) -> i64
      %__rlasp_stack_elide_zero_298 = arith.constant 0 : i64
      %4671 = arith.addi %4667, %__rlasp_stack_elide_zero_298 : i64
      %4672 = func.call @cc_nil_value() : () -> i64
      %4673 = func.call @cc_errorp(%4582) : (i64) -> i64
      %4674 = arith.cmpi ne, %4673, %4672 : i64
      %4675 = arith.cmpi eq, %4672, %4672 : i64
      %4676 = arith.andi %4674, %4675 : i1
      %4677 = scf.if %4676 -> (i64) {
        scf.yield %4582 : i64
      } else {
        scf.yield %4672 : i64
      }
      %4678 = func.call @cc_errorp(%4605) : (i64) -> i64
      %4679 = arith.cmpi ne, %4678, %4672 : i64
      %4680 = arith.cmpi eq, %4677, %4672 : i64
      %4681 = arith.andi %4679, %4680 : i1
      %4682 = scf.if %4681 -> (i64) {
        scf.yield %4605 : i64
      } else {
        scf.yield %4677 : i64
      }
      %4683 = func.call @cc_errorp(%4629) : (i64) -> i64
      %4684 = arith.cmpi ne, %4683, %4672 : i64
      %4685 = arith.cmpi eq, %4682, %4672 : i64
      %4686 = arith.andi %4684, %4685 : i1
      %4687 = scf.if %4686 -> (i64) {
        scf.yield %4629 : i64
      } else {
        scf.yield %4682 : i64
      }
      %4688 = func.call @cc_errorp(%4641) : (i64) -> i64
      %4689 = arith.cmpi ne, %4688, %4672 : i64
      %4690 = arith.cmpi eq, %4687, %4672 : i64
      %4691 = arith.andi %4689, %4690 : i1
      %4692 = scf.if %4691 -> (i64) {
        scf.yield %4641 : i64
      } else {
        scf.yield %4687 : i64
      }
      %4693 = func.call @cc_errorp(%4648) : (i64) -> i64
      %4694 = arith.cmpi ne, %4693, %4672 : i64
      %4695 = arith.cmpi eq, %4692, %4672 : i64
      %4696 = arith.andi %4694, %4695 : i1
      %4697 = scf.if %4696 -> (i64) {
        scf.yield %4648 : i64
      } else {
        scf.yield %4692 : i64
      }
      %4698 = func.call @cc_errorp(%4652) : (i64) -> i64
      %4699 = arith.cmpi ne, %4698, %4672 : i64
      %4700 = arith.cmpi eq, %4697, %4672 : i64
      %4701 = arith.andi %4699, %4700 : i1
      %4702 = scf.if %4701 -> (i64) {
        scf.yield %4652 : i64
      } else {
        scf.yield %4697 : i64
      }
      %4703 = func.call @cc_errorp(%4659) : (i64) -> i64
      %4704 = arith.cmpi ne, %4703, %4672 : i64
      %4705 = arith.cmpi eq, %4702, %4672 : i64
      %4706 = arith.andi %4704, %4705 : i1
      %4707 = scf.if %4706 -> (i64) {
        scf.yield %4659 : i64
      } else {
        scf.yield %4702 : i64
      }
      %4708 = func.call @cc_errorp(%4671) : (i64) -> i64
      %4709 = arith.cmpi ne, %4708, %4672 : i64
      %4710 = arith.cmpi eq, %4707, %4672 : i64
      %4711 = arith.andi %4709, %4710 : i1
      %4712 = scf.if %4711 -> (i64) {
        scf.yield %4671 : i64
      } else {
        scf.yield %4707 : i64
      }
      %4713 = arith.cmpi ne, %4712, %4672 : i64
      scf.if %4713 {
        func.call @stack_push_pointer(%4712) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4582) : (i64) -> ()
        func.call @stack_push_pointer(%4605) : (i64) -> ()
        func.call @stack_push_pointer(%4629) : (i64) -> ()
        func.call @stack_push_pointer(%4641) : (i64) -> ()
        func.call @stack_push_pointer(%4648) : (i64) -> ()
        func.call @stack_push_pointer(%4652) : (i64) -> ()
        func.call @stack_push_pointer(%4659) : (i64) -> ()
        func.call @stack_push_pointer(%4671) : (i64) -> ()
        %4714 = llvm.mlir.addressof @str413 : !llvm.ptr
        %4715 = func.call @cc_make_function_ref_const(%4714) : (!llvm.ptr) -> i64
        %4716 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4715, %4716) : (i64, i64) -> ()
      }
      %4717 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4717 : i64
    }
    %__rlasp_stack_elide_zero_299 = arith.constant 0 : i64
    %4718 = arith.addi %4573, %__rlasp_stack_elide_zero_299 : i64
    %4719 = func.call @cc_multiple_value_list(%4718) : (i64) -> i64
    %4720 = llvm.mlir.addressof @str414 : !llvm.ptr
    %4721 = arith.constant 37 : i64
    %4722 = func.call @cc_make_string(%4720, %4721) : (!llvm.ptr, i64) -> i64
    %4723 = func.call @cc_nil_value() : () -> i64
    %4724 = func.call @cc_intern(%4722, %4723) : (i64, i64) -> i64
    %4725 = func.call @cc_nil_value() : () -> i64
    %4726 = func.call @cc_cons(%4724, %4725) : (i64, i64) -> i64
    %4727 = func.call @cc_values_pack(%4726) : (i64) -> i64
    %4728 = func.call @cc_symbol_value(%4724) : (i64) -> i64
    %4729 = llvm.mlir.addressof @str415 : !llvm.ptr
    %4730 = arith.constant 39 : i64
    %4731 = func.call @cc_make_string(%4729, %4730) : (!llvm.ptr, i64) -> i64
    %4732 = func.call @cc_nil_value() : () -> i64
    %4733 = func.call @cc_intern(%4731, %4732) : (i64, i64) -> i64
    %4734 = func.call @cc_nil_value() : () -> i64
    %4735 = func.call @cc_cons(%4733, %4734) : (i64, i64) -> i64
    %4736 = func.call @cc_values_pack(%4735) : (i64) -> i64
    %4737 = func.call @cc_symbol_value(%4733) : (i64) -> i64
    %4738 = func.call @cc_nil_value() : () -> i64
    %4739 = arith.cmpi ne, %4728, %4738 : i64
    %4740 = scf.if %4739 -> (i64) {
      scf.yield %4737 : i64
    } else {
      scf.yield %4719 : i64
    }
    %4741 = func.call @cc_values_pack(%4740) : (i64) -> i64
    func.call @stack_push_pointer(%4741) : (i64) -> ()
    func.return
  }
  func.func @"clos:validate-superclass_47863920852993_primary"() {
    %222 = func.call @stack_pop_pointer() : () -> i64
    %223 = func.call @stack_pop_pointer() : () -> i64
    %224 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%224) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:SHARED-INITIALIZE_47863920852994_around"() {
    %441 = func.call @stack_pop_pointer() : () -> i64
    %442 = func.call @stack_pop_pointer() : () -> i64
    %443 = func.call @stack_pop_pointer() : () -> i64
    %444 = func.call @stack_pop_pointer() : () -> i64
    %445 = llvm.mlir.addressof @str40 : !llvm.ptr
    %446 = func.call @cc_make_function_ref_const(%445) : (!llvm.ptr) -> i64
    %__rlasp_stack_elide_zero_300 = arith.constant 0 : i64
    %447 = arith.addi %446, %__rlasp_stack_elide_zero_300 : i64
    func.call @stack_push_pointer(%444) : (i64) -> ()
    func.call @stack_push_pointer(%443) : (i64) -> ()
    %448 = llvm.mlir.addressof @str41 : !llvm.ptr
    %449 = arith.constant 19 : i64
    %450 = func.call @cc_make_string(%448, %449) : (!llvm.ptr, i64) -> i64
    %451 = llvm.mlir.addressof @str42 : !llvm.ptr
    %452 = arith.constant 7 : i64
    %453 = func.call @cc_make_string(%451, %452) : (!llvm.ptr, i64) -> i64
    %454 = func.call @cc_intern(%450, %453) : (i64, i64) -> i64
    %455 = func.call @cc_nil_value() : () -> i64
    %456 = func.call @cc_cons(%454, %455) : (i64, i64) -> i64
    %457 = func.call @cc_values_pack(%456) : (i64) -> i64
    func.call @stack_push_pointer(%454) : (i64) -> ()
    %458 = llvm.mlir.addressof @str43 : !llvm.ptr
    %459 = arith.constant 15 : i64
    %460 = func.call @cc_make_string(%458, %459) : (!llvm.ptr, i64) -> i64
    %461 = llvm.mlir.addressof @str44 : !llvm.ptr
    %462 = arith.constant 11 : i64
    %463 = func.call @cc_make_string(%461, %462) : (!llvm.ptr, i64) -> i64
    %464 = func.call @cc_intern(%460, %463) : (i64, i64) -> i64
    %465 = func.call @cc_nil_value() : () -> i64
    %466 = func.call @cc_cons(%464, %465) : (i64, i64) -> i64
    %467 = func.call @cc_values_pack(%466) : (i64) -> i64
    %__rlasp_stack_elide_zero_301 = arith.constant 0 : i64
    %468 = arith.addi %464, %__rlasp_stack_elide_zero_301 : i64
    %469 = func.call @cc_nil_value() : () -> i64
    %470 = func.call @cc_errorp(%468) : (i64) -> i64
    %471 = arith.cmpi ne, %470, %469 : i64
    %472 = arith.cmpi eq, %469, %469 : i64
    %473 = arith.andi %471, %472 : i1
    %474 = scf.if %473 -> (i64) {
      scf.yield %468 : i64
    } else {
      scf.yield %469 : i64
    }
    %475 = arith.cmpi ne, %474, %469 : i64
    scf.if %475 {
      func.call @stack_push_pointer(%474) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%468) : (i64) -> ()
      %476 = llvm.mlir.addressof @str45 : !llvm.ptr
      %477 = func.call @cc_make_function_ref_const(%476) : (!llvm.ptr) -> i64
      %478 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%477, %478) : (i64, i64) -> ()
    }
    %__rlasp_stack_elide_zero_302 = arith.constant 0 : i64
    %479 = arith.addi %441, %__rlasp_stack_elide_zero_302 : i64
    %480 = func.call @stack_pop_pointer() : () -> i64
    %481 = func.call @cc_remove(%480, %479) : (i64, i64) -> i64
    func.call @stack_push_pointer(%481) : (i64) -> ()
    %482 = llvm.mlir.addressof @str46 : !llvm.ptr
    %483 = arith.constant 16 : i64
    %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
    %485 = func.call @cc_nil_value() : () -> i64
    %486 = func.call @cc_intern(%484, %485) : (i64, i64) -> i64
    %487 = func.call @cc_nil_value() : () -> i64
    %488 = func.call @cc_cons(%486, %487) : (i64, i64) -> i64
    %489 = func.call @cc_values_pack(%488) : (i64) -> i64
    %__rlasp_stack_elide_zero_303 = arith.constant 0 : i64
    %490 = arith.addi %486, %__rlasp_stack_elide_zero_303 : i64
    %491 = func.call @cc_nil_value() : () -> i64
    %492 = func.call @cc_errorp(%490) : (i64) -> i64
    %493 = arith.cmpi ne, %492, %491 : i64
    %494 = arith.cmpi eq, %491, %491 : i64
    %495 = arith.andi %493, %494 : i1
    %496 = scf.if %495 -> (i64) {
      scf.yield %490 : i64
    } else {
      scf.yield %491 : i64
    }
    %497 = arith.cmpi ne, %496, %491 : i64
    scf.if %497 {
      func.call @stack_push_pointer(%496) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%490) : (i64) -> ()
      %498 = llvm.mlir.addressof @str47 : !llvm.ptr
      %499 = func.call @cc_make_function_ref_const(%498) : (!llvm.ptr) -> i64
      %500 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%499, %500) : (i64, i64) -> ()
    }
    %501 = func.call @stack_pop_pointer() : () -> i64
    %502 = func.call @cc_nil_value() : () -> i64
    %503 = func.call @cc_errorp(%501) : (i64) -> i64
    %504 = arith.cmpi ne, %503, %502 : i64
    %505 = arith.cmpi eq, %502, %502 : i64
    %506 = arith.andi %504, %505 : i1
    %507 = scf.if %506 -> (i64) {
      scf.yield %501 : i64
    } else {
      scf.yield %502 : i64
    }
    %508 = arith.cmpi ne, %507, %502 : i64
    scf.if %508 {
      func.call @stack_push_pointer(%507) : (i64) -> ()
    } else {
      %509 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %__rlasp_stack_elide_zero_304 = arith.constant 0 : i64
      %510 = arith.addi %501, %__rlasp_stack_elide_zero_304 : i64
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = func.call @cc_cons(%510, %511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%512) : (i64) -> ()
    }
    %513 = func.call @stack_pop_pointer() : () -> i64
    %514 = func.call @stack_pop_pointer() : () -> i64
    %515 = func.call @cc_append(%514, %513) : (i64, i64) -> i64
    func.call @stack_push_pointer(%515) : (i64) -> ()
    %__rlasp_stack_elide_zero_305 = arith.constant 0 : i64
    %516 = arith.addi %442, %__rlasp_stack_elide_zero_305 : i64
    %517 = func.call @stack_pop_pointer() : () -> i64
    %518 = func.call @cc_cons(%517, %516) : (i64, i64) -> i64
    %519 = func.call @stack_pop_pointer() : () -> i64
    %520 = func.call @cc_cons(%519, %518) : (i64, i64) -> i64
    %521 = func.call @stack_pop_pointer() : () -> i64
    %522 = func.call @cc_cons(%521, %520) : (i64, i64) -> i64
    %523 = func.call @stack_pop_pointer() : () -> i64
    %524 = func.call @cc_cons(%523, %522) : (i64, i64) -> i64
    %525 = func.call @cc_apply(%447, %524) : (i64, i64) -> i64
    func.call @stack_push_pointer(%525) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:UPDATE-INSTANCE-FOR-REDEFINED-CLASS_47863920852995_before"() {
    %980 = func.call @stack_pop_pointer() : () -> i64
    %981 = func.call @stack_pop_pointer() : () -> i64
    %982 = func.call @stack_pop_pointer() : () -> i64
    %983 = func.call @stack_pop_pointer() : () -> i64
    %984 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %985 = func.call @stack_depth() : () -> i64
    %986 = arith.constant 0 : i64
    %987 = arith.cmpi sgt, %985, %986 : i64
    scf.if %987 {
      %988 = func.call @stack_pop_pointer() : () -> i64
    }
    %989 = llvm.mlir.addressof @str101 : !llvm.ptr
    %990 = arith.constant 13 : i64
    %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
    %992 = func.call @cc_nil_value() : () -> i64
    %993 = func.call @cc_intern(%991, %992) : (i64, i64) -> i64
    %994 = func.call @cc_nil_value() : () -> i64
    %995 = func.call @cc_cons(%993, %994) : (i64, i64) -> i64
    %996 = func.call @cc_values_pack(%995) : (i64) -> i64
    %__rlasp_stack_elide_zero_306 = arith.constant 0 : i64
    %997 = arith.addi %993, %__rlasp_stack_elide_zero_306 : i64
    %998 = func.call @cc_nil_value() : () -> i64
    %999 = func.call @cc_errorp(%997) : (i64) -> i64
    %1000 = arith.cmpi ne, %999, %998 : i64
    %1001 = arith.cmpi eq, %998, %998 : i64
    %1002 = arith.andi %1000, %1001 : i1
    %1003 = scf.if %1002 -> (i64) {
      scf.yield %997 : i64
    } else {
      scf.yield %998 : i64
    }
    %1004 = arith.cmpi ne, %1003, %998 : i64
    scf.if %1004 {
      func.call @stack_push_pointer(%1003) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%997) : (i64) -> ()
      %1005 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1006 = func.call @cc_make_function_ref_const(%1005) : (!llvm.ptr) -> i64
      %1007 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%1006, %1007) : (i64, i64) -> ()
    }
    func.return
  }
  func.func @"__lambda_47863920852996"() {
    %1693 = func.call @cc_nil_value() : () -> i64
    %1694 = func.call @cc_nil_value() : () -> i64
    %1695 = func.call @cc_errorp(%1693) : (i64) -> i64
    %1696 = arith.cmpi ne, %1695, %1694 : i64
    %1697 = scf.if %1696 -> (i64) {
      scf.yield %1693 : i64
    } else {
      %1698 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1699 = func.call @cc_nil_value() : () -> i64
      %1700 = func.call @cc_nil_value() : () -> i64
      %1701 = func.call @cc_errorp(%1699) : (i64) -> i64
      %1702 = arith.cmpi ne, %1701, %1700 : i64
      %1703 = scf.if %1702 -> (i64) {
        scf.yield %1699 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1704 = llvm.mlir.addressof @str167 : !llvm.ptr
        %1705 = arith.constant 11 : i64
        %1706 = func.call @cc_make_string(%1704, %1705) : (!llvm.ptr, i64) -> i64
        %1707 = func.call @cc_nil_value() : () -> i64
        %1708 = func.call @cc_intern(%1706, %1707) : (i64, i64) -> i64
        %1709 = func.call @cc_nil_value() : () -> i64
        %1710 = func.call @cc_cons(%1708, %1709) : (i64, i64) -> i64
        %1711 = func.call @cc_values_pack(%1710) : (i64) -> i64
        %1712 = func.call @cc_symbol_value(%1708) : (i64) -> i64
        %1713 = llvm.mlir.addressof @str168 : !llvm.ptr
        %1714 = arith.constant 4 : i64
        %1715 = func.call @cc_make_string(%1713, %1714) : (!llvm.ptr, i64) -> i64
        %1716 = func.call @cc_nil_value() : () -> i64
        %1717 = func.call @cc_intern(%1715, %1716) : (i64, i64) -> i64
        %1718 = func.call @cc_nil_value() : () -> i64
        %1719 = func.call @cc_cons(%1717, %1718) : (i64, i64) -> i64
        %1720 = func.call @cc_values_pack(%1719) : (i64) -> i64
        %__rlasp_stack_elide_zero_307 = arith.constant 0 : i64
        %1721 = arith.addi %1717, %__rlasp_stack_elide_zero_307 : i64
        %1722 = func.call @cc_nil_value() : () -> i64
        %1723 = func.call @cc_errorp(%1712) : (i64) -> i64
        %1724 = arith.cmpi ne, %1723, %1722 : i64
        %1725 = arith.cmpi eq, %1722, %1722 : i64
        %1726 = arith.andi %1724, %1725 : i1
        %1727 = scf.if %1726 -> (i64) {
          scf.yield %1712 : i64
        } else {
          scf.yield %1722 : i64
        }
        %1728 = func.call @cc_errorp(%1721) : (i64) -> i64
        %1729 = arith.cmpi ne, %1728, %1722 : i64
        %1730 = arith.cmpi eq, %1727, %1722 : i64
        %1731 = arith.andi %1729, %1730 : i1
        %1732 = scf.if %1731 -> (i64) {
          scf.yield %1721 : i64
        } else {
          scf.yield %1727 : i64
        }
        %1733 = arith.cmpi ne, %1732, %1722 : i64
        scf.if %1733 {
          func.call @stack_push_pointer(%1732) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1712) : (i64) -> ()
          func.call @stack_push_pointer(%1721) : (i64) -> ()
          %1734 = llvm.mlir.addressof @str169 : !llvm.ptr
          %1735 = func.call @cc_make_function_ref_const(%1734) : (!llvm.ptr) -> i64
          %1736 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1735, %1736) : (i64, i64) -> ()
        }
        %1737 = func.call @stack_pop_pointer() : () -> i64
        %1738 = func.call @cc_errorp(%1737) : (i64) -> i64
        %1739 = func.call @cc_nil_value() : () -> i64
        %1740 = arith.cmpi ne, %1738, %1739 : i64
        scf.if %1740 {
          func.call @stack_push_pointer(%1737) : (i64) -> ()
        } else {
          %1741 = func.call @cc_multiple_value_list(%1737) : (i64) -> i64
          func.call @stack_push_pointer(%1741) : (i64) -> ()
        }
        %1742 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1743 = func.call @stack_pop_pointer() : () -> i64
        %1744 = func.call @cc_nil_value() : () -> i64
        %1745 = func.call @cc_maybe_error_from_multiple_value_list(%1742) : (i64) -> i64
        %1746 = func.call @cc_errorp(%1745) : (i64) -> i64
        %1747 = arith.cmpi ne, %1746, %1744 : i64
        %1748 = arith.cmpi eq, %1744, %1744 : i64
        %1749 = arith.andi %1747, %1748 : i1
        %1750 = scf.if %1749 -> (i64) {
          scf.yield %1745 : i64
        } else {
          scf.yield %1744 : i64
        }
        %1751 = arith.cmpi ne, %1750, %1744 : i64
        scf.if %1751 {
          func.call @stack_push_pointer(%1750) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1752 = func.call @stack_pop_pointer() : () -> i64
          %1753 = func.call @cc_cons(%1743, %1752) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_308 = arith.constant 0 : i64
          %1754 = arith.addi %1753, %__rlasp_stack_elide_zero_308 : i64
          %1755 = func.call @cc_cons(%1742, %1754) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_309 = arith.constant 0 : i64
          %1756 = arith.addi %1755, %__rlasp_stack_elide_zero_309 : i64
          %1757 = func.call @cc_values_pack(%1756) : (i64) -> i64
          func.call @stack_push_pointer(%1757) : (i64) -> ()
        }
        %1758 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1758 : i64
      }
      %__rlasp_stack_elide_zero_310 = arith.constant 0 : i64
      %1759 = arith.addi %1703, %__rlasp_stack_elide_zero_310 : i64
      %1760 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1761 = func.call @cc_errorp(%1759) : (i64) -> i64
      %1762 = func.call @cc_nil_value() : () -> i64
      %1763 = arith.cmpi ne, %1761, %1762 : i64
      scf.if %1763 {
        %1764 = func.call @cc_condition_value(%1759) : (i64) -> i64
        %1765 = func.call @cc_values2(%1762, %1764) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1765) : (i64) -> ()
      } else {
        %1766 = func.call @cc_multiple_value_list(%1759) : (i64) -> i64
        %1767 = func.call @cc_values_pack(%1766) : (i64) -> i64
        func.call @stack_push_pointer(%1767) : (i64) -> ()
      }
      %1768 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1768 : i64
    }
    func.call @stack_push_pointer(%1697) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920852997"() {
    %1981 = func.call @cc_nil_value() : () -> i64
    %1982 = func.call @cc_nil_value() : () -> i64
    %1983 = func.call @cc_errorp(%1981) : (i64) -> i64
    %1984 = arith.cmpi ne, %1983, %1982 : i64
    %1985 = scf.if %1984 -> (i64) {
      scf.yield %1981 : i64
    } else {
      %1986 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1987 = func.call @cc_nil_value() : () -> i64
      %1988 = func.call @cc_nil_value() : () -> i64
      %1989 = func.call @cc_errorp(%1987) : (i64) -> i64
      %1990 = arith.cmpi ne, %1989, %1988 : i64
      %1991 = scf.if %1990 -> (i64) {
        scf.yield %1987 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1992 = llvm.mlir.addressof @str188 : !llvm.ptr
        %1993 = arith.constant 11 : i64
        %1994 = func.call @cc_make_string(%1992, %1993) : (!llvm.ptr, i64) -> i64
        %1995 = func.call @cc_nil_value() : () -> i64
        %1996 = func.call @cc_intern(%1994, %1995) : (i64, i64) -> i64
        %1997 = func.call @cc_nil_value() : () -> i64
        %1998 = func.call @cc_cons(%1996, %1997) : (i64, i64) -> i64
        %1999 = func.call @cc_values_pack(%1998) : (i64) -> i64
        %2000 = func.call @cc_symbol_value(%1996) : (i64) -> i64
        %2001 = llvm.mlir.addressof @str189 : !llvm.ptr
        %2002 = arith.constant 4 : i64
        %2003 = func.call @cc_make_string(%2001, %2002) : (!llvm.ptr, i64) -> i64
        %2004 = func.call @cc_nil_value() : () -> i64
        %2005 = func.call @cc_intern(%2003, %2004) : (i64, i64) -> i64
        %2006 = func.call @cc_nil_value() : () -> i64
        %2007 = func.call @cc_cons(%2005, %2006) : (i64, i64) -> i64
        %2008 = func.call @cc_values_pack(%2007) : (i64) -> i64
        %__rlasp_stack_elide_zero_311 = arith.constant 0 : i64
        %2009 = arith.addi %2005, %__rlasp_stack_elide_zero_311 : i64
        %2010 = func.call @cc_nil_value() : () -> i64
        %2011 = func.call @cc_errorp(%2000) : (i64) -> i64
        %2012 = arith.cmpi ne, %2011, %2010 : i64
        %2013 = arith.cmpi eq, %2010, %2010 : i64
        %2014 = arith.andi %2012, %2013 : i1
        %2015 = scf.if %2014 -> (i64) {
          scf.yield %2000 : i64
        } else {
          scf.yield %2010 : i64
        }
        %2016 = func.call @cc_errorp(%2009) : (i64) -> i64
        %2017 = arith.cmpi ne, %2016, %2010 : i64
        %2018 = arith.cmpi eq, %2015, %2010 : i64
        %2019 = arith.andi %2017, %2018 : i1
        %2020 = scf.if %2019 -> (i64) {
          scf.yield %2009 : i64
        } else {
          scf.yield %2015 : i64
        }
        %2021 = arith.cmpi ne, %2020, %2010 : i64
        scf.if %2021 {
          func.call @stack_push_pointer(%2020) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2000) : (i64) -> ()
          func.call @stack_push_pointer(%2009) : (i64) -> ()
          %2022 = llvm.mlir.addressof @str190 : !llvm.ptr
          %2023 = func.call @cc_make_function_ref_const(%2022) : (!llvm.ptr) -> i64
          %2024 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2023, %2024) : (i64, i64) -> ()
        }
        %2025 = func.call @stack_pop_pointer() : () -> i64
        %2026 = func.call @cc_errorp(%2025) : (i64) -> i64
        %2027 = func.call @cc_nil_value() : () -> i64
        %2028 = arith.cmpi ne, %2026, %2027 : i64
        scf.if %2028 {
          func.call @stack_push_pointer(%2025) : (i64) -> ()
        } else {
          %2029 = func.call @cc_multiple_value_list(%2025) : (i64) -> i64
          func.call @stack_push_pointer(%2029) : (i64) -> ()
        }
        %2030 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2031 = func.call @stack_pop_pointer() : () -> i64
        %2032 = func.call @cc_nil_value() : () -> i64
        %2033 = func.call @cc_maybe_error_from_multiple_value_list(%2030) : (i64) -> i64
        %2034 = func.call @cc_errorp(%2033) : (i64) -> i64
        %2035 = arith.cmpi ne, %2034, %2032 : i64
        %2036 = arith.cmpi eq, %2032, %2032 : i64
        %2037 = arith.andi %2035, %2036 : i1
        %2038 = scf.if %2037 -> (i64) {
          scf.yield %2033 : i64
        } else {
          scf.yield %2032 : i64
        }
        %2039 = arith.cmpi ne, %2038, %2032 : i64
        scf.if %2039 {
          func.call @stack_push_pointer(%2038) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2040 = func.call @stack_pop_pointer() : () -> i64
          %2041 = func.call @cc_cons(%2031, %2040) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_312 = arith.constant 0 : i64
          %2042 = arith.addi %2041, %__rlasp_stack_elide_zero_312 : i64
          %2043 = func.call @cc_cons(%2030, %2042) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_313 = arith.constant 0 : i64
          %2044 = arith.addi %2043, %__rlasp_stack_elide_zero_313 : i64
          %2045 = func.call @cc_values_pack(%2044) : (i64) -> i64
          func.call @stack_push_pointer(%2045) : (i64) -> ()
        }
        %2046 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2046 : i64
      }
      %__rlasp_stack_elide_zero_314 = arith.constant 0 : i64
      %2047 = arith.addi %1991, %__rlasp_stack_elide_zero_314 : i64
      %2048 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2049 = func.call @cc_errorp(%2047) : (i64) -> i64
      %2050 = func.call @cc_nil_value() : () -> i64
      %2051 = arith.cmpi ne, %2049, %2050 : i64
      scf.if %2051 {
        %2052 = func.call @cc_condition_value(%2047) : (i64) -> i64
        %2053 = func.call @cc_values2(%2050, %2052) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2053) : (i64) -> ()
      } else {
        %2054 = func.call @cc_multiple_value_list(%2047) : (i64) -> i64
        %2055 = func.call @cc_values_pack(%2054) : (i64) -> i64
        func.call @stack_push_pointer(%2055) : (i64) -> ()
      }
      %2056 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2056 : i64
    }
    func.call @stack_push_pointer(%1985) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:UPDATE-INSTANCE-FOR-REDEFINED-CLASS_47863920852998_before"() {
    %2164 = func.call @stack_pop_pointer() : () -> i64
    %2165 = func.call @stack_pop_pointer() : () -> i64
    %2166 = func.call @stack_pop_pointer() : () -> i64
    %2167 = func.call @stack_pop_pointer() : () -> i64
    %2168 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    func.return
  }
  func.func @"__lambda_47863920852999"() {
    %2512 = func.call @cc_nil_value() : () -> i64
    %2513 = func.call @cc_nil_value() : () -> i64
    %2514 = func.call @cc_errorp(%2512) : (i64) -> i64
    %2515 = arith.cmpi ne, %2514, %2513 : i64
    %2516 = scf.if %2515 -> (i64) {
      scf.yield %2512 : i64
    } else {
      %2517 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2518 = arith.constant 11 : i64
      %2519 = func.call @cc_make_string(%2517, %2518) : (!llvm.ptr, i64) -> i64
      %2520 = func.call @cc_nil_value() : () -> i64
      %2521 = func.call @cc_intern(%2519, %2520) : (i64, i64) -> i64
      %2522 = func.call @cc_nil_value() : () -> i64
      %2523 = func.call @cc_cons(%2521, %2522) : (i64, i64) -> i64
      %2524 = func.call @cc_values_pack(%2523) : (i64) -> i64
      %2525 = func.call @cc_symbol_value(%2521) : (i64) -> i64
      %2526 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2527 = arith.constant 4 : i64
      %2528 = func.call @cc_make_string(%2526, %2527) : (!llvm.ptr, i64) -> i64
      %2529 = func.call @cc_nil_value() : () -> i64
      %2530 = func.call @cc_intern(%2528, %2529) : (i64, i64) -> i64
      %2531 = func.call @cc_nil_value() : () -> i64
      %2532 = func.call @cc_cons(%2530, %2531) : (i64, i64) -> i64
      %2533 = func.call @cc_values_pack(%2532) : (i64) -> i64
      %__rlasp_stack_elide_zero_315 = arith.constant 0 : i64
      %2534 = arith.addi %2530, %__rlasp_stack_elide_zero_315 : i64
      %2535 = func.call @cc_nil_value() : () -> i64
      %2536 = func.call @cc_errorp(%2525) : (i64) -> i64
      %2537 = arith.cmpi ne, %2536, %2535 : i64
      %2538 = arith.cmpi eq, %2535, %2535 : i64
      %2539 = arith.andi %2537, %2538 : i1
      %2540 = scf.if %2539 -> (i64) {
        scf.yield %2525 : i64
      } else {
        scf.yield %2535 : i64
      }
      %2541 = func.call @cc_errorp(%2534) : (i64) -> i64
      %2542 = arith.cmpi ne, %2541, %2535 : i64
      %2543 = arith.cmpi eq, %2540, %2535 : i64
      %2544 = arith.andi %2542, %2543 : i1
      %2545 = scf.if %2544 -> (i64) {
        scf.yield %2534 : i64
      } else {
        scf.yield %2540 : i64
      }
      %2546 = arith.cmpi ne, %2545, %2535 : i64
      scf.if %2546 {
        func.call @stack_push_pointer(%2545) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2525) : (i64) -> ()
        func.call @stack_push_pointer(%2534) : (i64) -> ()
        %2547 = llvm.mlir.addressof @str237 : !llvm.ptr
        %2548 = func.call @cc_make_function_ref_const(%2547) : (!llvm.ptr) -> i64
        %2549 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2548, %2549) : (i64, i64) -> ()
      }
      %2550 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2550 : i64
    }
    func.call @stack_push_pointer(%2516) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:UPDATE-INSTANCE-FOR-DIFFERENT-CLASS_47863920853000_before"() {
    %2893 = func.call @stack_pop_pointer() : () -> i64
    %2894 = func.call @stack_pop_pointer() : () -> i64
    %2895 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %2896 = func.call @stack_depth() : () -> i64
    %2897 = arith.constant 0 : i64
    %2898 = arith.cmpi sgt, %2896, %2897 : i64
    scf.if %2898 {
      %2899 = func.call @stack_pop_pointer() : () -> i64
    }
    %2900 = llvm.mlir.addressof @str262 : !llvm.ptr
    %2901 = arith.constant 13 : i64
    %2902 = func.call @cc_make_string(%2900, %2901) : (!llvm.ptr, i64) -> i64
    %2903 = func.call @cc_nil_value() : () -> i64
    %2904 = func.call @cc_intern(%2902, %2903) : (i64, i64) -> i64
    %2905 = func.call @cc_nil_value() : () -> i64
    %2906 = func.call @cc_cons(%2904, %2905) : (i64, i64) -> i64
    %2907 = func.call @cc_values_pack(%2906) : (i64) -> i64
    %__rlasp_stack_elide_zero_316 = arith.constant 0 : i64
    %2908 = arith.addi %2904, %__rlasp_stack_elide_zero_316 : i64
    %2909 = func.call @cc_nil_value() : () -> i64
    %2910 = func.call @cc_errorp(%2908) : (i64) -> i64
    %2911 = arith.cmpi ne, %2910, %2909 : i64
    %2912 = arith.cmpi eq, %2909, %2909 : i64
    %2913 = arith.andi %2911, %2912 : i1
    %2914 = scf.if %2913 -> (i64) {
      scf.yield %2908 : i64
    } else {
      scf.yield %2909 : i64
    }
    %2915 = arith.cmpi ne, %2914, %2909 : i64
    scf.if %2915 {
      func.call @stack_push_pointer(%2914) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%2908) : (i64) -> ()
      %2916 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2917 = func.call @cc_make_function_ref_const(%2916) : (!llvm.ptr) -> i64
      %2918 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%2917, %2918) : (i64, i64) -> ()
    }
    func.return
  }
  func.func @"__lambda_47863920853001"() {
    %3321 = func.call @cc_nil_value() : () -> i64
    %3322 = func.call @cc_nil_value() : () -> i64
    %3323 = func.call @cc_errorp(%3321) : (i64) -> i64
    %3324 = arith.cmpi ne, %3323, %3322 : i64
    %3325 = scf.if %3324 -> (i64) {
      scf.yield %3321 : i64
    } else {
      %3326 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3327 = func.call @cc_nil_value() : () -> i64
      %3328 = func.call @cc_nil_value() : () -> i64
      %3329 = func.call @cc_errorp(%3327) : (i64) -> i64
      %3330 = arith.cmpi ne, %3329, %3328 : i64
      %3331 = scf.if %3330 -> (i64) {
        scf.yield %3327 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3332 = llvm.mlir.addressof @str304 : !llvm.ptr
        %3333 = arith.constant 11 : i64
        %3334 = func.call @cc_make_string(%3332, %3333) : (!llvm.ptr, i64) -> i64
        %3335 = func.call @cc_nil_value() : () -> i64
        %3336 = func.call @cc_intern(%3334, %3335) : (i64, i64) -> i64
        %3337 = func.call @cc_nil_value() : () -> i64
        %3338 = func.call @cc_cons(%3336, %3337) : (i64, i64) -> i64
        %3339 = func.call @cc_values_pack(%3338) : (i64) -> i64
        %3340 = func.call @cc_symbol_value(%3336) : (i64) -> i64
        func.call @stack_push_pointer(%3340) : (i64) -> ()
        %3341 = llvm.mlir.addressof @str305 : !llvm.ptr
        %3342 = arith.constant 9 : i64
        %3343 = func.call @cc_make_string(%3341, %3342) : (!llvm.ptr, i64) -> i64
        %3344 = func.call @cc_nil_value() : () -> i64
        %3345 = func.call @cc_intern(%3343, %3344) : (i64, i64) -> i64
        %3346 = func.call @cc_nil_value() : () -> i64
        %3347 = func.call @cc_cons(%3345, %3346) : (i64, i64) -> i64
        %3348 = func.call @cc_values_pack(%3347) : (i64) -> i64
        %__rlasp_stack_elide_zero_317 = arith.constant 0 : i64
        %3349 = arith.addi %3345, %__rlasp_stack_elide_zero_317 : i64
        %3350 = func.call @stack_pop_pointer() : () -> i64
        %3351 = func.call @cc_change_class(%3350, %3349) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_318 = arith.constant 0 : i64
        %3352 = arith.addi %3351, %__rlasp_stack_elide_zero_318 : i64
        %3353 = func.call @cc_errorp(%3352) : (i64) -> i64
        %3354 = func.call @cc_nil_value() : () -> i64
        %3355 = arith.cmpi ne, %3353, %3354 : i64
        scf.if %3355 {
          func.call @stack_push_pointer(%3352) : (i64) -> ()
        } else {
          %3356 = func.call @cc_multiple_value_list(%3352) : (i64) -> i64
          func.call @stack_push_pointer(%3356) : (i64) -> ()
        }
        %3357 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3358 = func.call @stack_pop_pointer() : () -> i64
        %3359 = func.call @cc_nil_value() : () -> i64
        %3360 = func.call @cc_maybe_error_from_multiple_value_list(%3357) : (i64) -> i64
        %3361 = func.call @cc_errorp(%3360) : (i64) -> i64
        %3362 = arith.cmpi ne, %3361, %3359 : i64
        %3363 = arith.cmpi eq, %3359, %3359 : i64
        %3364 = arith.andi %3362, %3363 : i1
        %3365 = scf.if %3364 -> (i64) {
          scf.yield %3360 : i64
        } else {
          scf.yield %3359 : i64
        }
        %3366 = arith.cmpi ne, %3365, %3359 : i64
        scf.if %3366 {
          func.call @stack_push_pointer(%3365) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3367 = func.call @stack_pop_pointer() : () -> i64
          %3368 = func.call @cc_cons(%3358, %3367) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_319 = arith.constant 0 : i64
          %3369 = arith.addi %3368, %__rlasp_stack_elide_zero_319 : i64
          %3370 = func.call @cc_cons(%3357, %3369) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_320 = arith.constant 0 : i64
          %3371 = arith.addi %3370, %__rlasp_stack_elide_zero_320 : i64
          %3372 = func.call @cc_values_pack(%3371) : (i64) -> i64
          func.call @stack_push_pointer(%3372) : (i64) -> ()
        }
        %3373 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3373 : i64
      }
      %__rlasp_stack_elide_zero_321 = arith.constant 0 : i64
      %3374 = arith.addi %3331, %__rlasp_stack_elide_zero_321 : i64
      %3375 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3376 = func.call @cc_errorp(%3374) : (i64) -> i64
      %3377 = func.call @cc_nil_value() : () -> i64
      %3378 = arith.cmpi ne, %3376, %3377 : i64
      scf.if %3378 {
        %3379 = func.call @cc_condition_value(%3374) : (i64) -> i64
        %3380 = func.call @cc_values2(%3377, %3379) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3380) : (i64) -> ()
      } else {
        %3381 = func.call @cc_multiple_value_list(%3374) : (i64) -> i64
        %3382 = func.call @cc_values_pack(%3381) : (i64) -> i64
        func.call @stack_push_pointer(%3382) : (i64) -> ()
      }
      %3383 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3383 : i64
    }
    func.call @stack_push_pointer(%3325) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920853002"() {
    %3523 = func.call @cc_nil_value() : () -> i64
    %3524 = func.call @cc_nil_value() : () -> i64
    %3525 = func.call @cc_errorp(%3523) : (i64) -> i64
    %3526 = arith.cmpi ne, %3525, %3524 : i64
    %3527 = scf.if %3526 -> (i64) {
      scf.yield %3523 : i64
    } else {
      %3528 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3529 = arith.constant 11 : i64
      %3530 = func.call @cc_make_string(%3528, %3529) : (!llvm.ptr, i64) -> i64
      %3531 = func.call @cc_nil_value() : () -> i64
      %3532 = func.call @cc_intern(%3530, %3531) : (i64, i64) -> i64
      %3533 = func.call @cc_nil_value() : () -> i64
      %3534 = func.call @cc_cons(%3532, %3533) : (i64, i64) -> i64
      %3535 = func.call @cc_values_pack(%3534) : (i64) -> i64
      %3536 = func.call @cc_symbol_value(%3532) : (i64) -> i64
      %__rlasp_stack_elide_zero_322 = arith.constant 0 : i64
      %3537 = arith.addi %3536, %__rlasp_stack_elide_zero_322 : i64
      func.call @stack_push_nil() : () -> ()
      %3538 = func.call @stack_pop_pointer() : () -> i64
      %3539 = func.call @cc_cons(%3537, %3538) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_323 = arith.constant 0 : i64
      %3540 = arith.addi %3539, %__rlasp_stack_elide_zero_323 : i64
      %3541 = func.call @cc_values_pack(%3540) : (i64) -> i64
      %__rlasp_stack_elide_zero_324 = arith.constant 0 : i64
      %3542 = arith.addi %3541, %__rlasp_stack_elide_zero_324 : i64
      scf.yield %3542 : i64
    }
    func.call @stack_push_pointer(%3527) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920853003"() {
    %3744 = func.call @cc_nil_value() : () -> i64
    %3745 = func.call @cc_nil_value() : () -> i64
    %3746 = func.call @cc_errorp(%3744) : (i64) -> i64
    %3747 = arith.cmpi ne, %3746, %3745 : i64
    %3748 = scf.if %3747 -> (i64) {
      scf.yield %3744 : i64
    } else {
      %3749 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3750 = func.call @cc_nil_value() : () -> i64
      %3751 = func.call @cc_nil_value() : () -> i64
      %3752 = func.call @cc_errorp(%3750) : (i64) -> i64
      %3753 = arith.cmpi ne, %3752, %3751 : i64
      %3754 = scf.if %3753 -> (i64) {
        scf.yield %3750 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3755 = llvm.mlir.addressof @str335 : !llvm.ptr
        %3756 = arith.constant 11 : i64
        %3757 = func.call @cc_make_string(%3755, %3756) : (!llvm.ptr, i64) -> i64
        %3758 = func.call @cc_nil_value() : () -> i64
        %3759 = func.call @cc_intern(%3757, %3758) : (i64, i64) -> i64
        %3760 = func.call @cc_nil_value() : () -> i64
        %3761 = func.call @cc_cons(%3759, %3760) : (i64, i64) -> i64
        %3762 = func.call @cc_values_pack(%3761) : (i64) -> i64
        %3763 = func.call @cc_symbol_value(%3759) : (i64) -> i64
        func.call @stack_push_pointer(%3763) : (i64) -> ()
        %3764 = llvm.mlir.addressof @str336 : !llvm.ptr
        %3765 = arith.constant 9 : i64
        %3766 = func.call @cc_make_string(%3764, %3765) : (!llvm.ptr, i64) -> i64
        %3767 = func.call @cc_nil_value() : () -> i64
        %3768 = func.call @cc_intern(%3766, %3767) : (i64, i64) -> i64
        %3769 = func.call @cc_nil_value() : () -> i64
        %3770 = func.call @cc_cons(%3768, %3769) : (i64, i64) -> i64
        %3771 = func.call @cc_values_pack(%3770) : (i64) -> i64
        %__rlasp_stack_elide_zero_325 = arith.constant 0 : i64
        %3772 = arith.addi %3768, %__rlasp_stack_elide_zero_325 : i64
        %3773 = func.call @stack_pop_pointer() : () -> i64
        %3774 = func.call @cc_change_class(%3773, %3772) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_326 = arith.constant 0 : i64
        %3775 = arith.addi %3774, %__rlasp_stack_elide_zero_326 : i64
        %3776 = func.call @cc_errorp(%3775) : (i64) -> i64
        %3777 = func.call @cc_nil_value() : () -> i64
        %3778 = arith.cmpi ne, %3776, %3777 : i64
        scf.if %3778 {
          func.call @stack_push_pointer(%3775) : (i64) -> ()
        } else {
          %3779 = func.call @cc_multiple_value_list(%3775) : (i64) -> i64
          func.call @stack_push_pointer(%3779) : (i64) -> ()
        }
        %3780 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3781 = func.call @stack_pop_pointer() : () -> i64
        %3782 = func.call @cc_nil_value() : () -> i64
        %3783 = func.call @cc_maybe_error_from_multiple_value_list(%3780) : (i64) -> i64
        %3784 = func.call @cc_errorp(%3783) : (i64) -> i64
        %3785 = arith.cmpi ne, %3784, %3782 : i64
        %3786 = arith.cmpi eq, %3782, %3782 : i64
        %3787 = arith.andi %3785, %3786 : i1
        %3788 = scf.if %3787 -> (i64) {
          scf.yield %3783 : i64
        } else {
          scf.yield %3782 : i64
        }
        %3789 = arith.cmpi ne, %3788, %3782 : i64
        scf.if %3789 {
          func.call @stack_push_pointer(%3788) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3790 = func.call @stack_pop_pointer() : () -> i64
          %3791 = func.call @cc_cons(%3781, %3790) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_327 = arith.constant 0 : i64
          %3792 = arith.addi %3791, %__rlasp_stack_elide_zero_327 : i64
          %3793 = func.call @cc_cons(%3780, %3792) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_328 = arith.constant 0 : i64
          %3794 = arith.addi %3793, %__rlasp_stack_elide_zero_328 : i64
          %3795 = func.call @cc_values_pack(%3794) : (i64) -> i64
          func.call @stack_push_pointer(%3795) : (i64) -> ()
        }
        %3796 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3796 : i64
      }
      %__rlasp_stack_elide_zero_329 = arith.constant 0 : i64
      %3797 = arith.addi %3754, %__rlasp_stack_elide_zero_329 : i64
      %3798 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3799 = func.call @cc_errorp(%3797) : (i64) -> i64
      %3800 = func.call @cc_nil_value() : () -> i64
      %3801 = arith.cmpi ne, %3799, %3800 : i64
      scf.if %3801 {
        %3802 = func.call @cc_condition_value(%3797) : (i64) -> i64
        %3803 = func.call @cc_values2(%3800, %3802) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3803) : (i64) -> ()
      } else {
        %3804 = func.call @cc_multiple_value_list(%3797) : (i64) -> i64
        %3805 = func.call @cc_values_pack(%3804) : (i64) -> i64
        func.call @stack_push_pointer(%3805) : (i64) -> ()
      }
      %3806 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3806 : i64
    }
    func.call @stack_push_pointer(%3748) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920853004"() {
    %3946 = func.call @cc_nil_value() : () -> i64
    %3947 = func.call @cc_nil_value() : () -> i64
    %3948 = func.call @cc_errorp(%3946) : (i64) -> i64
    %3949 = arith.cmpi ne, %3948, %3947 : i64
    %3950 = scf.if %3949 -> (i64) {
      scf.yield %3946 : i64
    } else {
      %3951 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3952 = arith.constant 11 : i64
      %3953 = func.call @cc_make_string(%3951, %3952) : (!llvm.ptr, i64) -> i64
      %3954 = func.call @cc_nil_value() : () -> i64
      %3955 = func.call @cc_intern(%3953, %3954) : (i64, i64) -> i64
      %3956 = func.call @cc_nil_value() : () -> i64
      %3957 = func.call @cc_cons(%3955, %3956) : (i64, i64) -> i64
      %3958 = func.call @cc_values_pack(%3957) : (i64) -> i64
      %3959 = func.call @cc_symbol_value(%3955) : (i64) -> i64
      %__rlasp_stack_elide_zero_330 = arith.constant 0 : i64
      %3960 = arith.addi %3959, %__rlasp_stack_elide_zero_330 : i64
      func.call @stack_push_nil() : () -> ()
      %3961 = func.call @stack_pop_pointer() : () -> i64
      %3962 = func.call @cc_cons(%3960, %3961) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_331 = arith.constant 0 : i64
      %3963 = arith.addi %3962, %__rlasp_stack_elide_zero_331 : i64
      %3964 = func.call @cc_values_pack(%3963) : (i64) -> i64
      %__rlasp_stack_elide_zero_332 = arith.constant 0 : i64
      %3965 = arith.addi %3964, %__rlasp_stack_elide_zero_332 : i64
      scf.yield %3965 : i64
    }
    func.call @stack_push_pointer(%3950) : (i64) -> ()
    func.return
  }
  func.func @"COMMON-LISP:UPDATE-INSTANCE-FOR-DIFFERENT-CLASS_47863920853005_before"() {
    %4062 = func.call @stack_pop_pointer() : () -> i64
    %4063 = func.call @stack_pop_pointer() : () -> i64
    %4064 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    func.return
  }
  func.func @"__lambda_47863920853006"() {
    %4415 = func.call @cc_nil_value() : () -> i64
    %4416 = func.call @cc_nil_value() : () -> i64
    %4417 = func.call @cc_errorp(%4415) : (i64) -> i64
    %4418 = arith.cmpi ne, %4417, %4416 : i64
    %4419 = scf.if %4418 -> (i64) {
      scf.yield %4415 : i64
    } else {
      %4420 = func.call @cc_nil_value() : () -> i64
      %4421 = func.call @cc_nil_value() : () -> i64
      %4422 = func.call @cc_errorp(%4420) : (i64) -> i64
      %4423 = arith.cmpi ne, %4422, %4421 : i64
      %4424 = scf.if %4423 -> (i64) {
        scf.yield %4420 : i64
      } else {
        %4425 = llvm.mlir.addressof @str392 : !llvm.ptr
        %4426 = arith.constant 11 : i64
        %4427 = func.call @cc_make_string(%4425, %4426) : (!llvm.ptr, i64) -> i64
        %4428 = func.call @cc_nil_value() : () -> i64
        %4429 = func.call @cc_intern(%4427, %4428) : (i64, i64) -> i64
        %4430 = func.call @cc_nil_value() : () -> i64
        %4431 = func.call @cc_cons(%4429, %4430) : (i64, i64) -> i64
        %4432 = func.call @cc_values_pack(%4431) : (i64) -> i64
        %4433 = func.call @cc_symbol_value(%4429) : (i64) -> i64
        func.call @stack_push_pointer(%4433) : (i64) -> ()
        %4434 = llvm.mlir.addressof @str393 : !llvm.ptr
        %4435 = arith.constant 9 : i64
        %4436 = func.call @cc_make_string(%4434, %4435) : (!llvm.ptr, i64) -> i64
        %4437 = func.call @cc_nil_value() : () -> i64
        %4438 = func.call @cc_intern(%4436, %4437) : (i64, i64) -> i64
        %4439 = func.call @cc_nil_value() : () -> i64
        %4440 = func.call @cc_cons(%4438, %4439) : (i64, i64) -> i64
        %4441 = func.call @cc_values_pack(%4440) : (i64) -> i64
        %__rlasp_stack_elide_zero_333 = arith.constant 0 : i64
        %4442 = arith.addi %4438, %__rlasp_stack_elide_zero_333 : i64
        %4443 = func.call @stack_pop_pointer() : () -> i64
        %4444 = func.call @cc_change_class(%4443, %4442) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_334 = arith.constant 0 : i64
        %4445 = arith.addi %4444, %__rlasp_stack_elide_zero_334 : i64
        scf.yield %4445 : i64
      }
      %4446 = func.call @cc_nil_value() : () -> i64
      %4447 = func.call @cc_errorp(%4424) : (i64) -> i64
      %4448 = arith.cmpi ne, %4447, %4446 : i64
      %4449 = scf.if %4448 -> (i64) {
        scf.yield %4424 : i64
      } else {
        %4450 = llvm.mlir.addressof @str394 : !llvm.ptr
        %4451 = arith.constant 11 : i64
        %4452 = func.call @cc_make_string(%4450, %4451) : (!llvm.ptr, i64) -> i64
        %4453 = func.call @cc_nil_value() : () -> i64
        %4454 = func.call @cc_intern(%4452, %4453) : (i64, i64) -> i64
        %4455 = func.call @cc_nil_value() : () -> i64
        %4456 = func.call @cc_cons(%4454, %4455) : (i64, i64) -> i64
        %4457 = func.call @cc_values_pack(%4456) : (i64) -> i64
        %4458 = func.call @cc_symbol_value(%4454) : (i64) -> i64
        %4459 = llvm.mlir.addressof @str395 : !llvm.ptr
        %4460 = arith.constant 4 : i64
        %4461 = func.call @cc_make_string(%4459, %4460) : (!llvm.ptr, i64) -> i64
        %4462 = func.call @cc_nil_value() : () -> i64
        %4463 = func.call @cc_intern(%4461, %4462) : (i64, i64) -> i64
        %4464 = func.call @cc_nil_value() : () -> i64
        %4465 = func.call @cc_cons(%4463, %4464) : (i64, i64) -> i64
        %4466 = func.call @cc_values_pack(%4465) : (i64) -> i64
        %__rlasp_stack_elide_zero_335 = arith.constant 0 : i64
        %4467 = arith.addi %4463, %__rlasp_stack_elide_zero_335 : i64
        %4468 = func.call @cc_nil_value() : () -> i64
        %4469 = func.call @cc_errorp(%4458) : (i64) -> i64
        %4470 = arith.cmpi ne, %4469, %4468 : i64
        %4471 = arith.cmpi eq, %4468, %4468 : i64
        %4472 = arith.andi %4470, %4471 : i1
        %4473 = scf.if %4472 -> (i64) {
          scf.yield %4458 : i64
        } else {
          scf.yield %4468 : i64
        }
        %4474 = func.call @cc_errorp(%4467) : (i64) -> i64
        %4475 = arith.cmpi ne, %4474, %4468 : i64
        %4476 = arith.cmpi eq, %4473, %4468 : i64
        %4477 = arith.andi %4475, %4476 : i1
        %4478 = scf.if %4477 -> (i64) {
          scf.yield %4467 : i64
        } else {
          scf.yield %4473 : i64
        }
        %4479 = arith.cmpi ne, %4478, %4468 : i64
        scf.if %4479 {
          func.call @stack_push_pointer(%4478) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4458) : (i64) -> ()
          func.call @stack_push_pointer(%4467) : (i64) -> ()
          %4480 = llvm.mlir.addressof @str396 : !llvm.ptr
          %4481 = func.call @cc_make_function_ref_const(%4480) : (!llvm.ptr) -> i64
          %4482 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%4481, %4482) : (i64, i64) -> ()
        }
        %4483 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4483 : i64
      }
      %__rlasp_stack_elide_zero_336 = arith.constant 0 : i64
      %4484 = arith.addi %4449, %__rlasp_stack_elide_zero_336 : i64
      scf.yield %4484 : i64
    }
    func.call @stack_push_pointer(%4419) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_47863920853007"() {
    %4606 = func.call @cc_nil_value() : () -> i64
    %4607 = func.call @cc_nil_value() : () -> i64
    %4608 = func.call @cc_errorp(%4606) : (i64) -> i64
    %4609 = arith.cmpi ne, %4608, %4607 : i64
    %4610 = scf.if %4609 -> (i64) {
      scf.yield %4606 : i64
    } else {
      %4611 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4612 = arith.constant 11 : i64
      %4613 = func.call @cc_make_string(%4611, %4612) : (!llvm.ptr, i64) -> i64
      %4614 = func.call @cc_nil_value() : () -> i64
      %4615 = func.call @cc_intern(%4613, %4614) : (i64, i64) -> i64
      %4616 = func.call @cc_nil_value() : () -> i64
      %4617 = func.call @cc_cons(%4615, %4616) : (i64, i64) -> i64
      %4618 = func.call @cc_values_pack(%4617) : (i64) -> i64
      %4619 = func.call @cc_symbol_value(%4615) : (i64) -> i64
      %__rlasp_stack_elide_zero_337 = arith.constant 0 : i64
      %4620 = arith.addi %4619, %__rlasp_stack_elide_zero_337 : i64
      func.call @stack_push_nil() : () -> ()
      %4621 = func.call @stack_pop_pointer() : () -> i64
      %4622 = func.call @cc_cons(%4620, %4621) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_338 = arith.constant 0 : i64
      %4623 = arith.addi %4622, %__rlasp_stack_elide_zero_338 : i64
      %4624 = func.call @cc_values_pack(%4623) : (i64) -> i64
      %__rlasp_stack_elide_zero_339 = arith.constant 0 : i64
      %4625 = arith.addi %4624, %__rlasp_stack_elide_zero_339 : i64
      scf.yield %4625 : i64
    }
    func.call @stack_push_pointer(%4610) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_47863920852992*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_47863920852992*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_47863920852992*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str5("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str6("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str8("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str10("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str11("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str12("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str15("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str16("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str18("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @method_name_47863920852993("clos:validate-superclass_47863920852993_primary\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str20("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str21("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str22("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str23("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str25("STANDARD-CLASS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str28("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str29("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str30("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str31("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str32("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str33("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str34("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str36("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str37("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str38("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str39("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP:CALL-NEXT-METHOD\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str41("DIRECT-SUPERCLASSES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str46("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str47("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @method_name_47863920852994("COMMON-LISP:SHARED-INITIALIZE_47863920852994_around\00") : !llvm.array<52 x i8>
  llvm.mlir.global private constant @str49("SHARED-INITIALIZE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str50("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str52("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str53("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str54("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str55("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str56("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str57("REST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str60("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str61("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("DIRECT-SUPERCLASSES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str66("STANDARD-OBJECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str67("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str69("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("REMOVE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str75("DIRECT-SUPERCLASSES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("SLOT-NAMES\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str78("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str79("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("CALL-NEXT-METHOD\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str83("APPLY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("DIRECT-SUPERCLASSES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str86("&KEY\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("REST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str91("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("SLOT-NAMES\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str93("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str94("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str95("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("AROUND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str97("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str98("SHARED-INITIALIZE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str99("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str101("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str102("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @method_name_47863920852995("COMMON-LISP:UPDATE-INSTANCE-FOR-REDEFINED-CLASS_47863920852995_before\00") : !llvm.array<70 x i8>
  llvm.mlir.global private constant @str104("UPDATE-INSTANCE-FOR-REDEFINED-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str107("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str108("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str109("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str110("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str111("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str112("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str113("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str114("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str117("PROPERTY-LIST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str118("DISCARDED-SLOTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str119("ADDED-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str122("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str125("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str126("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str127("PROPERTY-LIST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str128("DISCARDED-SLOTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str129("ADDED-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str131("INSTANCE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str132("BEFORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("UPDATE-INSTANCE-FOR-REDEFINED-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str137("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str138("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str139("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str140("METACLASS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str141("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str142("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str143("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str144("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str146("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str147("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str148("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str149("UIFRC-FOO-CLASS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str150("METACLASS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str151("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("INITFORM\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str153("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str155("UIFRC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str156("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str157("UIFRC.ABORT.1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str158("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str159("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str160("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str161("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str162("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str163("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str164("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str165("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str166("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str167("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str168("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str169("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str170("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str171("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str172("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str173("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str174("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str175("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str176("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str177("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str178("UIFRC.ABORT.2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str179("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str180("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str181("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str182("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str183("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str184("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str185("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str188("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str190("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str191("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str192("UIFRC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str193("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str195("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str196("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str197("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str198("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @method_name_47863920852998("COMMON-LISP:UPDATE-INSTANCE-FOR-REDEFINED-CLASS_47863920852998_before\00") : !llvm.array<70 x i8>
  llvm.mlir.global private constant @str200("UPDATE-INSTANCE-FOR-REDEFINED-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str201("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str202("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str203("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str204("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str205("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str206("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str207("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str208("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str209("PROPERTY-LIST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str210("DISCARDED-SLOTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str211("ADDED-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str212("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str213("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str214("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str217("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str218("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("PROPERTY-LIST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str220("DISCARDED-SLOTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str221("ADDED-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("UIFRC-FOO-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str223("INSTANCE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str224("BEFORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str225("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str226("UPDATE-INSTANCE-FOR-REDEFINED-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str227("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str228("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str229("UIFRC.ABORT.3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str230("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str232("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str234("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str235("*UIFRC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str236("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str237("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str238("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str239("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str240("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str241("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str242("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str243("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str244("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str247("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str248("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str249("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str250("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str251("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str252("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str253("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str254("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str255("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str256("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str257("INITFORM\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str258("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str259("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str260("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str261("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str262("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str263("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @method_name_47863920853000("COMMON-LISP:UPDATE-INSTANCE-FOR-DIFFERENT-CLASS_47863920853000_before\00") : !llvm.array<70 x i8>
  llvm.mlir.global private constant @str265("UPDATE-INSTANCE-FOR-DIFFERENT-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str266("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str267("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str268("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str269("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str270("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str271("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str272("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str273("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str274("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str275("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str276("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str277("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str278("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str279("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str280("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str281("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str282("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str283("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str284("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str285("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str286("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str287("BEFORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str288("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str289("UPDATE-INSTANCE-FOR-DIFFERENT-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str290("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str292("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str293("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str294("UIFDC.ABORT.1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str295("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str296("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str297("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str298("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str299("CHANGE-CLASS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str300("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str301("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str302("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str303("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str304("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str305("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str306("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str307("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str308("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str309("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str310("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str311("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str312("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str313("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str314("UIFDC-ABORT.2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str315("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str316("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str317("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str318("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str319("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str321("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str322("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str323("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str324("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str325("UIFDC.ABORT.3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str326("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str327("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str329("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str330("CHANGE-CLASS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str331("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str332("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str333("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str334("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str335("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str336("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str337("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str338("UIFDC-FAILURE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str339("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str340("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str341("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str342("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str343("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str344("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str345("UIFDC-ABORT.4\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str346("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str347("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str348("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str349("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str350("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str351("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str352("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str353("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str354("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str355("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @method_name_47863920853005("COMMON-LISP:UPDATE-INSTANCE-FOR-DIFFERENT-CLASS_47863920853005_before\00") : !llvm.array<70 x i8>
  llvm.mlir.global private constant @str357("UPDATE-INSTANCE-FOR-DIFFERENT-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str358("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str359("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str360("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str361("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str362("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str363("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str364("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str365("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str366("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str367("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str368("INITARGS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str369("&REST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str370("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str371("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str372("BAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str373("UIFDC-FOO\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str374("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str375("BEFORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str376("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str377("UPDATE-INSTANCE-FOR-DIFFERENT-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str378("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str379("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str380("UIFDC.ABORT.5\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str381("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str382("CHANGE-CLASS\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str383("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str384("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str385("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str386("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str387("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str388("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str389("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str390("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str391("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str392("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str393("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str394("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str395("SLOT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str396("SLOT-VALUE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str397("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str398("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str399("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str400("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str401("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str402("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str403("UIFDC.ABORT.6\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str404("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str405("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str406("*UIFDC-FOO*\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str407("UIFDC-BAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str408("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str409("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str410("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str411("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str412("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str413("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str414("*__MLIR_BLOCK_RETFLAG_47863920852992*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str415("*__MLIR_BLOCK_RETMVLIST_47863920852992*\00") : !llvm.array<40 x i8>
}
