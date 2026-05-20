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
  func.func @"%FN%%%test%%"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 8 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 1 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %12) : (i64, i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @cc_nil_value() : () -> i64
    %15 = llvm.mlir.addressof @str2 : !llvm.ptr
    %16 = arith.constant 37 : i64
    %17 = func.call @cc_make_string(%15, %16) : (!llvm.ptr, i64) -> i64
    %18 = func.call @cc_nil_value() : () -> i64
    %19 = func.call @cc_intern(%17, %18) : (i64, i64) -> i64
    %20 = func.call @cc_nil_value() : () -> i64
    %21 = func.call @cc_cons(%19, %20) : (i64, i64) -> i64
    %22 = func.call @cc_values_pack(%21) : (i64) -> i64
    %23 = func.call @cc_set_symbol_value(%19, %14) : (i64, i64) -> i64
    %24 = llvm.mlir.addressof @str3 : !llvm.ptr
    %25 = arith.constant 38 : i64
    %26 = func.call @cc_make_string(%24, %25) : (!llvm.ptr, i64) -> i64
    %27 = func.call @cc_nil_value() : () -> i64
    %28 = func.call @cc_intern(%26, %27) : (i64, i64) -> i64
    %29 = func.call @cc_nil_value() : () -> i64
    %30 = func.call @cc_cons(%28, %29) : (i64, i64) -> i64
    %31 = func.call @cc_values_pack(%30) : (i64) -> i64
    %32 = func.call @cc_set_symbol_value(%28, %14) : (i64, i64) -> i64
    %33 = llvm.mlir.addressof @str4 : !llvm.ptr
    %34 = arith.constant 39 : i64
    %35 = func.call @cc_make_string(%33, %34) : (!llvm.ptr, i64) -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_intern(%35, %36) : (i64, i64) -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_cons(%37, %38) : (i64, i64) -> i64
    %40 = func.call @cc_values_pack(%39) : (i64) -> i64
    %41 = func.call @cc_set_symbol_value(%37, %14) : (i64, i64) -> i64
    %42 = func.call @cc_nil_value() : () -> i64
    %43 = llvm.mlir.addressof @str5 : !llvm.ptr
    %44 = arith.constant 37 : i64
    %45 = func.call @cc_make_string(%43, %44) : (!llvm.ptr, i64) -> i64
    %46 = func.call @cc_nil_value() : () -> i64
    %47 = func.call @cc_intern(%45, %46) : (i64, i64) -> i64
    %48 = func.call @cc_nil_value() : () -> i64
    %49 = func.call @cc_cons(%47, %48) : (i64, i64) -> i64
    %50 = func.call @cc_values_pack(%49) : (i64) -> i64
    %51 = func.call @cc_set_symbol_value(%47, %42) : (i64, i64) -> i64
    %52 = llvm.mlir.addressof @str6 : !llvm.ptr
    %53 = arith.constant 38 : i64
    %54 = func.call @cc_make_string(%52, %53) : (!llvm.ptr, i64) -> i64
    %55 = func.call @cc_nil_value() : () -> i64
    %56 = func.call @cc_intern(%54, %55) : (i64, i64) -> i64
    %57 = func.call @cc_nil_value() : () -> i64
    %58 = func.call @cc_cons(%56, %57) : (i64, i64) -> i64
    %59 = func.call @cc_values_pack(%58) : (i64) -> i64
    %60 = func.call @cc_set_symbol_value(%56, %42) : (i64, i64) -> i64
    %61 = llvm.mlir.addressof @str7 : !llvm.ptr
    %62 = arith.constant 39 : i64
    %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
    %64 = func.call @cc_nil_value() : () -> i64
    %65 = func.call @cc_intern(%63, %64) : (i64, i64) -> i64
    %66 = func.call @cc_nil_value() : () -> i64
    %67 = func.call @cc_cons(%65, %66) : (i64, i64) -> i64
    %68 = func.call @cc_values_pack(%67) : (i64) -> i64
    %69 = func.call @cc_set_symbol_value(%65, %42) : (i64, i64) -> i64
    func.call @stack_push_pointer(%13) : (i64) -> ()
    %70 = func.call @stack_pop_pointer() : () -> i64
    %71 = arith.constant 2 : i64
    func.call @stack_push_fixnum(%71) : (i64) -> ()
    %72 = func.call @stack_pop_pointer() : () -> i64
    %74 = arith.constant 3 : i64
    %73 = arith.andi %70, %74 : i64
    %75 = arith.constant 0 : i64
    %76 = arith.cmpi eq, %73, %75 : i64
    %78 = arith.constant 3 : i64
    %77 = arith.andi %72, %78 : i64
    %79 = arith.constant 0 : i64
    %80 = arith.cmpi eq, %77, %79 : i64
    %81 = arith.andi %76, %80 : i1
    %82 = scf.if %81 -> (i64) {
      %83 = arith.constant 2 : i64
      %84 = arith.shrsi %70, %83 : i64
      %85 = arith.constant 2 : i64
      %86 = arith.shrsi %72, %85 : i64
      %87 = arith.constant 0 : i64
      %88 = arith.cmpi slt, %84, %87 : i64
      %89 = scf.if %88 -> (i64) {
        %90 = arith.subi %87, %84 : i64
        scf.yield %90 : i64
      } else {
        scf.yield %84 : i64
      }
      %91 = arith.constant 0 : i64
      %92 = arith.cmpi slt, %86, %91 : i64
      %93 = scf.if %92 -> (i64) {
        %94 = arith.subi %91, %86 : i64
        scf.yield %94 : i64
      } else {
        scf.yield %86 : i64
      }
      %95 = arith.constant 1518500249 : i64
      %96 = arith.cmpi sle, %89, %95 : i64
      %97 = arith.cmpi sle, %93, %95 : i64
      %98 = arith.andi %96, %97 : i1
      %99 = scf.if %98 -> (i64) {
        %100 = arith.muli %84, %86 : i64
        %101 = arith.constant 2 : i64
        %102 = arith.shli %100, %101 : i64
        scf.yield %102 : i64
      } else {
        %103 = func.call @cc_mul(%70, %72) : (i64, i64) -> i64
        scf.yield %103 : i64
      }
      scf.yield %99 : i64
    } else {
      %104 = func.call @cc_mul(%70, %72) : (i64, i64) -> i64
      scf.yield %104 : i64
    }
    func.call @stack_push_pointer(%82) : (i64) -> ()
    %105 = func.call @stack_pop_pointer() : () -> i64
    %106 = func.call @cc_multiple_value_list(%105) : (i64) -> i64
    %107 = llvm.mlir.addressof @str8 : !llvm.ptr
    %108 = arith.constant 37 : i64
    %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
    %110 = func.call @cc_nil_value() : () -> i64
    %111 = func.call @cc_intern(%109, %110) : (i64, i64) -> i64
    %112 = func.call @cc_nil_value() : () -> i64
    %113 = func.call @cc_cons(%111, %112) : (i64, i64) -> i64
    %114 = func.call @cc_values_pack(%113) : (i64) -> i64
    %115 = func.call @cc_symbol_value(%111) : (i64) -> i64
    %116 = llvm.mlir.addressof @str9 : !llvm.ptr
    %117 = arith.constant 38 : i64
    %118 = func.call @cc_make_string(%116, %117) : (!llvm.ptr, i64) -> i64
    %119 = func.call @cc_nil_value() : () -> i64
    %120 = func.call @cc_intern(%118, %119) : (i64, i64) -> i64
    %121 = func.call @cc_nil_value() : () -> i64
    %122 = func.call @cc_cons(%120, %121) : (i64, i64) -> i64
    %123 = func.call @cc_values_pack(%122) : (i64) -> i64
    %124 = func.call @cc_symbol_value(%120) : (i64) -> i64
    %125 = llvm.mlir.addressof @str10 : !llvm.ptr
    %126 = arith.constant 39 : i64
    %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
    %128 = func.call @cc_nil_value() : () -> i64
    %129 = func.call @cc_intern(%127, %128) : (i64, i64) -> i64
    %130 = func.call @cc_nil_value() : () -> i64
    %131 = func.call @cc_cons(%129, %130) : (i64, i64) -> i64
    %132 = func.call @cc_values_pack(%131) : (i64) -> i64
    %133 = func.call @cc_symbol_value(%129) : (i64) -> i64
    %134 = func.call @cc_nil_value() : () -> i64
    %135 = arith.cmpi ne, %115, %134 : i64
    %136 = scf.if %135 -> (i64) {
      scf.yield %133 : i64
    } else {
      scf.yield %106 : i64
    }
    %137 = func.call @cc_values_pack(%136) : (i64) -> i64
    func.call @stack_push_pointer(%137) : (i64) -> ()
    %138 = func.call @stack_pop_pointer() : () -> i64
    %139 = func.call @cc_multiple_value_list(%138) : (i64) -> i64
    %140 = llvm.mlir.addressof @str11 : !llvm.ptr
    %141 = arith.constant 37 : i64
    %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
    %143 = func.call @cc_nil_value() : () -> i64
    %144 = func.call @cc_intern(%142, %143) : (i64, i64) -> i64
    %145 = func.call @cc_nil_value() : () -> i64
    %146 = func.call @cc_cons(%144, %145) : (i64, i64) -> i64
    %147 = func.call @cc_values_pack(%146) : (i64) -> i64
    %148 = func.call @cc_symbol_value(%144) : (i64) -> i64
    %149 = llvm.mlir.addressof @str12 : !llvm.ptr
    %150 = arith.constant 39 : i64
    %151 = func.call @cc_make_string(%149, %150) : (!llvm.ptr, i64) -> i64
    %152 = func.call @cc_nil_value() : () -> i64
    %153 = func.call @cc_intern(%151, %152) : (i64, i64) -> i64
    %154 = func.call @cc_nil_value() : () -> i64
    %155 = func.call @cc_cons(%153, %154) : (i64, i64) -> i64
    %156 = func.call @cc_values_pack(%155) : (i64) -> i64
    %157 = func.call @cc_symbol_value(%153) : (i64) -> i64
    %158 = func.call @cc_nil_value() : () -> i64
    %159 = arith.cmpi ne, %148, %158 : i64
    %160 = scf.if %159 -> (i64) {
      scf.yield %157 : i64
    } else {
      scf.yield %139 : i64
    }
    %161 = func.call @cc_values_pack(%160) : (i64) -> i64
    func.call @stack_push_pointer(%161) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %162 = llvm.mlir.addressof @str13 : !llvm.ptr
    %163 = arith.constant 6 : i64
    %164 = func.call @cc_make_string(%162, %163) : (!llvm.ptr, i64) -> i64
    %165 = func.call @cc_nil_value() : () -> i64
    %166 = func.call @cc_intern(%164, %165) : (i64, i64) -> i64
    %167 = func.call @cc_nil_value() : () -> i64
    %168 = func.call @cc_cons(%166, %167) : (i64, i64) -> i64
    %169 = func.call @cc_values_pack(%168) : (i64) -> i64
    %170 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%166, %170) : (i64, i64) -> ()
    %171 = func.call @cc_nil_value() : () -> i64
    %172 = llvm.mlir.addressof @str14 : !llvm.ptr
    %173 = arith.constant 37 : i64
    %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
    %175 = func.call @cc_nil_value() : () -> i64
    %176 = func.call @cc_intern(%174, %175) : (i64, i64) -> i64
    %177 = func.call @cc_nil_value() : () -> i64
    %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
    %179 = func.call @cc_values_pack(%178) : (i64) -> i64
    %180 = func.call @cc_set_symbol_value(%176, %171) : (i64, i64) -> i64
    %181 = llvm.mlir.addressof @str15 : !llvm.ptr
    %182 = arith.constant 38 : i64
    %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
    %184 = func.call @cc_nil_value() : () -> i64
    %185 = func.call @cc_intern(%183, %184) : (i64, i64) -> i64
    %186 = func.call @cc_nil_value() : () -> i64
    %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
    %188 = func.call @cc_values_pack(%187) : (i64) -> i64
    %189 = func.call @cc_set_symbol_value(%185, %171) : (i64, i64) -> i64
    %190 = llvm.mlir.addressof @str16 : !llvm.ptr
    %191 = arith.constant 39 : i64
    %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
    %193 = func.call @cc_nil_value() : () -> i64
    %194 = func.call @cc_intern(%192, %193) : (i64, i64) -> i64
    %195 = func.call @cc_nil_value() : () -> i64
    %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
    %197 = func.call @cc_values_pack(%196) : (i64) -> i64
    %198 = func.call @cc_set_symbol_value(%194, %171) : (i64, i64) -> i64
    %199 = func.call @cc_nil_value() : () -> i64
    %200 = func.call @cc_nil_value() : () -> i64
    %201 = func.call @cc_errorp(%199) : (i64) -> i64
    %202 = arith.cmpi ne, %201, %200 : i64
    %203 = scf.if %202 -> (i64) {
      scf.yield %199 : i64
    } else {
      %204 = llvm.mlir.addressof @str17 : !llvm.ptr
      %205 = arith.constant 11 : i64
      %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
      %207 = func.call @cc_nil_value() : () -> i64
      %208 = func.call @cc_intern(%206, %207) : (i64, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_values_pack(%210) : (i64) -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @cc_in_package(%212) : (i64) -> i64
      func.call @stack_push_pointer(%213) : (i64) -> ()
      %214 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %214 : i64
    }
    %215 = func.call @cc_nil_value() : () -> i64
    %216 = func.call @cc_errorp(%203) : (i64) -> i64
    %217 = arith.cmpi ne, %216, %215 : i64
    %218 = scf.if %217 -> (i64) {
      scf.yield %203 : i64
    } else {
      %219 = llvm.mlir.addressof @str18 : !llvm.ptr
      %220 = arith.constant 7 : i64
      %221 = func.call @cc_make_string(%219, %220) : (!llvm.ptr, i64) -> i64
      %222 = func.call @cc_nil_value() : () -> i64
      %223 = func.call @cc_intern(%221, %222) : (i64, i64) -> i64
      %224 = func.call @cc_nil_value() : () -> i64
      %225 = func.call @cc_cons(%223, %224) : (i64, i64) -> i64
      %226 = func.call @cc_values_pack(%225) : (i64) -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %227 = func.call @stack_pop_pointer() : () -> i64
      %228 = llvm.mlir.addressof @str19 : !llvm.ptr
      %229 = arith.constant 13 : i64
      %230 = func.call @cc_make_string(%228, %229) : (!llvm.ptr, i64) -> i64
      %231 = llvm.mlir.addressof @str20 : !llvm.ptr
      %232 = arith.constant 11 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = func.call @cc_intern(%230, %233) : (i64, i64) -> i64
      %235 = func.call @cc_nil_value() : () -> i64
      %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
      %237 = func.call @cc_values_pack(%236) : (i64) -> i64
      func.call @stack_push_pointer(%234) : (i64) -> ()
      %238 = llvm.mlir.addressof @str21 : !llvm.ptr
      %239 = arith.constant 6 : i64
      %240 = func.call @cc_make_string(%238, %239) : (!llvm.ptr, i64) -> i64
      %241 = func.call @cc_nil_value() : () -> i64
      %242 = func.call @cc_intern(%240, %241) : (i64, i64) -> i64
      %243 = func.call @cc_nil_value() : () -> i64
      %244 = func.call @cc_cons(%242, %243) : (i64, i64) -> i64
      %245 = func.call @cc_values_pack(%244) : (i64) -> i64
      func.call @stack_push_pointer(%242) : (i64) -> ()
      %246 = llvm.mlir.addressof @str22 : !llvm.ptr
      %247 = arith.constant 19 : i64
      %248 = func.call @cc_make_string(%246, %247) : (!llvm.ptr, i64) -> i64
      %249 = func.call @cc_nil_value() : () -> i64
      %250 = func.call @cc_intern(%248, %249) : (i64, i64) -> i64
      %251 = func.call @cc_nil_value() : () -> i64
      %252 = func.call @cc_cons(%250, %251) : (i64, i64) -> i64
      %253 = func.call @cc_values_pack(%252) : (i64) -> i64
      func.call @stack_push_pointer(%250) : (i64) -> ()
      %254 = llvm.mlir.addressof @str23 : !llvm.ptr
      %255 = arith.constant 5 : i64
      %256 = func.call @cc_make_string(%254, %255) : (!llvm.ptr, i64) -> i64
      %257 = llvm.mlir.addressof @str24 : !llvm.ptr
      %258 = arith.constant 11 : i64
      %259 = func.call @cc_make_string(%257, %258) : (!llvm.ptr, i64) -> i64
      %260 = func.call @cc_intern(%256, %259) : (i64, i64) -> i64
      %261 = func.call @cc_nil_value() : () -> i64
      %262 = func.call @cc_cons(%260, %261) : (i64, i64) -> i64
      %263 = func.call @cc_values_pack(%262) : (i64) -> i64
      func.call @stack_push_pointer(%260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %264 = func.call @stack_pop_pointer() : () -> i64
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @cc_cons(%265, %264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%266) : (i64) -> ()
      %267 = func.call @stack_pop_pointer() : () -> i64
      %268 = func.call @stack_pop_pointer() : () -> i64
      %269 = func.call @cc_cons(%268, %267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%269) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %270 = func.call @stack_pop_pointer() : () -> i64
      %271 = func.call @stack_pop_pointer() : () -> i64
      %272 = func.call @cc_cons(%271, %270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%272) : (i64) -> ()
      %273 = func.call @stack_pop_pointer() : () -> i64
      %274 = func.call @stack_pop_pointer() : () -> i64
      %275 = func.call @cc_cons(%274, %273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%275) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %276 = func.call @stack_pop_pointer() : () -> i64
      %277 = func.call @stack_pop_pointer() : () -> i64
      %278 = func.call @cc_cons(%277, %276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%278) : (i64) -> ()
      %279 = func.call @stack_pop_pointer() : () -> i64
      %280 = func.call @stack_pop_pointer() : () -> i64
      %281 = func.call @cc_cons(%280, %279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%281) : (i64) -> ()
      %282 = func.call @stack_pop_pointer() : () -> i64
      %283 = func.call @stack_pop_pointer() : () -> i64
      %284 = func.call @cc_cons(%283, %282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%284) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %285 = func.call @stack_pop_pointer() : () -> i64
      %286 = func.call @stack_pop_pointer() : () -> i64
      %287 = func.call @cc_cons(%286, %285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%287) : (i64) -> ()
      %288 = func.call @stack_pop_pointer() : () -> i64
      %289 = func.call @stack_pop_pointer() : () -> i64
      %290 = func.call @cc_cons(%289, %288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%290) : (i64) -> ()
      %291 = func.call @stack_pop_pointer() : () -> i64
      %346 = arith.constant 51151114338307 : i64
      %347 = arith.constant 0 : i64
      %348 = func.call @cc_make_closure(%346, %347) : (i64, i64) -> i64
      func.call @stack_push_pointer(%348) : (i64) -> ()
      %349 = func.call @stack_pop_pointer() : () -> i64
      %350 = llvm.mlir.addressof @str26 : !llvm.ptr
      %351 = arith.constant 4 : i64
      %352 = func.call @cc_make_string(%350, %351) : (!llvm.ptr, i64) -> i64
      %353 = func.call @cc_nil_value() : () -> i64
      %354 = func.call @cc_intern(%352, %353) : (i64, i64) -> i64
      %355 = func.call @cc_nil_value() : () -> i64
      %356 = func.call @cc_cons(%354, %355) : (i64, i64) -> i64
      %357 = func.call @cc_values_pack(%356) : (i64) -> i64
      func.call @stack_push_pointer(%354) : (i64) -> ()
      %358 = llvm.mlir.addressof @str27 : !llvm.ptr
      %359 = arith.constant 10 : i64
      %360 = func.call @cc_make_string(%358, %359) : (!llvm.ptr, i64) -> i64
      %361 = llvm.mlir.addressof @str28 : !llvm.ptr
      %362 = arith.constant 11 : i64
      %363 = func.call @cc_make_string(%361, %362) : (!llvm.ptr, i64) -> i64
      %364 = func.call @cc_intern(%360, %363) : (i64, i64) -> i64
      %365 = func.call @cc_nil_value() : () -> i64
      %366 = func.call @cc_cons(%364, %365) : (i64, i64) -> i64
      %367 = func.call @cc_values_pack(%366) : (i64) -> i64
      func.call @stack_push_pointer(%364) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %368 = func.call @stack_pop_pointer() : () -> i64
      %369 = func.call @stack_pop_pointer() : () -> i64
      %370 = func.call @cc_cons(%369, %368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%370) : (i64) -> ()
      %371 = func.call @stack_pop_pointer() : () -> i64
      %372 = func.call @stack_pop_pointer() : () -> i64
      %373 = func.call @cc_cons(%372, %371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = llvm.mlir.addressof @str29 : !llvm.ptr
      %376 = arith.constant 11 : i64
      %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
      %378 = llvm.mlir.addressof @str30 : !llvm.ptr
      %379 = arith.constant 7 : i64
      %380 = func.call @cc_make_string(%378, %379) : (!llvm.ptr, i64) -> i64
      %381 = func.call @cc_intern(%377, %380) : (i64, i64) -> i64
      %382 = func.call @cc_nil_value() : () -> i64
      %383 = func.call @cc_cons(%381, %382) : (i64, i64) -> i64
      %384 = func.call @cc_values_pack(%383) : (i64) -> i64
      func.call @stack_push_pointer(%381) : (i64) -> ()
      %385 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %386 = func.call @stack_pop_pointer() : () -> i64
      %387 = llvm.mlir.addressof @str31 : !llvm.ptr
      %388 = arith.constant 4 : i64
      %389 = func.call @cc_make_string(%387, %388) : (!llvm.ptr, i64) -> i64
      %390 = llvm.mlir.addressof @str32 : !llvm.ptr
      %391 = arith.constant 7 : i64
      %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
      %393 = func.call @cc_intern(%389, %392) : (i64, i64) -> i64
      %394 = func.call @cc_nil_value() : () -> i64
      %395 = func.call @cc_cons(%393, %394) : (i64, i64) -> i64
      %396 = func.call @cc_values_pack(%395) : (i64) -> i64
      func.call @stack_push_pointer(%393) : (i64) -> ()
      %397 = func.call @stack_pop_pointer() : () -> i64
      %398 = llvm.mlir.addressof @str33 : !llvm.ptr
      %399 = arith.constant 5 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = func.call @cc_nil_value() : () -> i64
      %402 = func.call @cc_intern(%400, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      func.call @stack_push_pointer(%402) : (i64) -> ()
      %406 = func.call @stack_pop_pointer() : () -> i64
      %407 = func.call @cc_nil_value() : () -> i64
      %408 = func.call @cc_errorp(%227) : (i64) -> i64
      %409 = arith.cmpi ne, %408, %407 : i64
      %410 = arith.cmpi eq, %407, %407 : i64
      %411 = arith.andi %409, %410 : i1
      %412 = scf.if %411 -> (i64) {
        scf.yield %227 : i64
      } else {
        scf.yield %407 : i64
      }
      %413 = func.call @cc_errorp(%291) : (i64) -> i64
      %414 = arith.cmpi ne, %413, %407 : i64
      %415 = arith.cmpi eq, %412, %407 : i64
      %416 = arith.andi %414, %415 : i1
      %417 = scf.if %416 -> (i64) {
        scf.yield %291 : i64
      } else {
        scf.yield %412 : i64
      }
      %418 = func.call @cc_errorp(%349) : (i64) -> i64
      %419 = arith.cmpi ne, %418, %407 : i64
      %420 = arith.cmpi eq, %417, %407 : i64
      %421 = arith.andi %419, %420 : i1
      %422 = scf.if %421 -> (i64) {
        scf.yield %349 : i64
      } else {
        scf.yield %417 : i64
      }
      %423 = func.call @cc_errorp(%374) : (i64) -> i64
      %424 = arith.cmpi ne, %423, %407 : i64
      %425 = arith.cmpi eq, %422, %407 : i64
      %426 = arith.andi %424, %425 : i1
      %427 = scf.if %426 -> (i64) {
        scf.yield %374 : i64
      } else {
        scf.yield %422 : i64
      }
      %428 = func.call @cc_errorp(%385) : (i64) -> i64
      %429 = arith.cmpi ne, %428, %407 : i64
      %430 = arith.cmpi eq, %427, %407 : i64
      %431 = arith.andi %429, %430 : i1
      %432 = scf.if %431 -> (i64) {
        scf.yield %385 : i64
      } else {
        scf.yield %427 : i64
      }
      %433 = func.call @cc_errorp(%386) : (i64) -> i64
      %434 = arith.cmpi ne, %433, %407 : i64
      %435 = arith.cmpi eq, %432, %407 : i64
      %436 = arith.andi %434, %435 : i1
      %437 = scf.if %436 -> (i64) {
        scf.yield %386 : i64
      } else {
        scf.yield %432 : i64
      }
      %438 = func.call @cc_errorp(%397) : (i64) -> i64
      %439 = arith.cmpi ne, %438, %407 : i64
      %440 = arith.cmpi eq, %437, %407 : i64
      %441 = arith.andi %439, %440 : i1
      %442 = scf.if %441 -> (i64) {
        scf.yield %397 : i64
      } else {
        scf.yield %437 : i64
      }
      %443 = func.call @cc_errorp(%406) : (i64) -> i64
      %444 = arith.cmpi ne, %443, %407 : i64
      %445 = arith.cmpi eq, %442, %407 : i64
      %446 = arith.andi %444, %445 : i1
      %447 = scf.if %446 -> (i64) {
        scf.yield %406 : i64
      } else {
        scf.yield %442 : i64
      }
      %448 = arith.cmpi ne, %447, %407 : i64
      scf.if %448 {
        func.call @stack_push_pointer(%447) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%227) : (i64) -> ()
        func.call @stack_push_pointer(%291) : (i64) -> ()
        func.call @stack_push_pointer(%349) : (i64) -> ()
        func.call @stack_push_pointer(%374) : (i64) -> ()
        func.call @stack_push_pointer(%385) : (i64) -> ()
        func.call @stack_push_pointer(%386) : (i64) -> ()
        func.call @stack_push_pointer(%397) : (i64) -> ()
        func.call @stack_push_pointer(%406) : (i64) -> ()
        %449 = llvm.mlir.addressof @str34 : !llvm.ptr
        %450 = func.call @cc_make_function_ref_const(%449) : (!llvm.ptr) -> i64
        %451 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%450, %451) : (i64, i64) -> ()
      }
      %452 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %452 : i64
    }
    %453 = func.call @cc_nil_value() : () -> i64
    %454 = func.call @cc_errorp(%218) : (i64) -> i64
    %455 = arith.cmpi ne, %454, %453 : i64
    %456 = scf.if %455 -> (i64) {
      scf.yield %218 : i64
    } else {
      %457 = llvm.mlir.addressof @str35 : !llvm.ptr
      %458 = arith.constant 7 : i64
      %459 = func.call @cc_make_string(%457, %458) : (!llvm.ptr, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_intern(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_nil_value() : () -> i64
      %463 = func.call @cc_cons(%461, %462) : (i64, i64) -> i64
      %464 = func.call @cc_values_pack(%463) : (i64) -> i64
      func.call @stack_push_pointer(%461) : (i64) -> ()
      %465 = func.call @stack_pop_pointer() : () -> i64
      %466 = llvm.mlir.addressof @str36 : !llvm.ptr
      %467 = arith.constant 13 : i64
      %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
      %469 = llvm.mlir.addressof @str37 : !llvm.ptr
      %470 = arith.constant 11 : i64
      %471 = func.call @cc_make_string(%469, %470) : (!llvm.ptr, i64) -> i64
      %472 = func.call @cc_intern(%468, %471) : (i64, i64) -> i64
      %473 = func.call @cc_nil_value() : () -> i64
      %474 = func.call @cc_cons(%472, %473) : (i64, i64) -> i64
      %475 = func.call @cc_values_pack(%474) : (i64) -> i64
      func.call @stack_push_pointer(%472) : (i64) -> ()
      %476 = llvm.mlir.addressof @str38 : !llvm.ptr
      %477 = arith.constant 6 : i64
      %478 = func.call @cc_make_string(%476, %477) : (!llvm.ptr, i64) -> i64
      %479 = func.call @cc_nil_value() : () -> i64
      %480 = func.call @cc_intern(%478, %479) : (i64, i64) -> i64
      %481 = func.call @cc_nil_value() : () -> i64
      %482 = func.call @cc_cons(%480, %481) : (i64, i64) -> i64
      %483 = func.call @cc_values_pack(%482) : (i64) -> i64
      func.call @stack_push_pointer(%480) : (i64) -> ()
      %484 = llvm.mlir.addressof @str39 : !llvm.ptr
      %485 = arith.constant 19 : i64
      %486 = func.call @cc_make_string(%484, %485) : (!llvm.ptr, i64) -> i64
      %487 = func.call @cc_nil_value() : () -> i64
      %488 = func.call @cc_intern(%486, %487) : (i64, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_values_pack(%490) : (i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      %492 = llvm.mlir.addressof @str40 : !llvm.ptr
      %493 = arith.constant 5 : i64
      %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
      %495 = llvm.mlir.addressof @str41 : !llvm.ptr
      %496 = arith.constant 11 : i64
      %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
      %498 = func.call @cc_intern(%494, %497) : (i64, i64) -> i64
      %499 = func.call @cc_nil_value() : () -> i64
      %500 = func.call @cc_cons(%498, %499) : (i64, i64) -> i64
      %501 = func.call @cc_values_pack(%500) : (i64) -> i64
      func.call @stack_push_pointer(%498) : (i64) -> ()
      %502 = arith.constant 32 : i64
      %503 = func.call @cc_box_character(%502) : (i64) -> i64
      func.call @stack_push_pointer(%503) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %504 = func.call @stack_pop_pointer() : () -> i64
      %505 = func.call @stack_pop_pointer() : () -> i64
      %506 = func.call @cc_cons(%505, %504) : (i64, i64) -> i64
      func.call @stack_push_pointer(%506) : (i64) -> ()
      %507 = func.call @stack_pop_pointer() : () -> i64
      %508 = func.call @stack_pop_pointer() : () -> i64
      %509 = func.call @cc_cons(%508, %507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %510 = func.call @stack_pop_pointer() : () -> i64
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = func.call @cc_cons(%511, %510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%512) : (i64) -> ()
      %513 = func.call @stack_pop_pointer() : () -> i64
      %514 = func.call @stack_pop_pointer() : () -> i64
      %515 = func.call @cc_cons(%514, %513) : (i64, i64) -> i64
      func.call @stack_push_pointer(%515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %516 = func.call @stack_pop_pointer() : () -> i64
      %517 = func.call @stack_pop_pointer() : () -> i64
      %518 = func.call @cc_cons(%517, %516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%518) : (i64) -> ()
      %519 = func.call @stack_pop_pointer() : () -> i64
      %520 = func.call @stack_pop_pointer() : () -> i64
      %521 = func.call @cc_cons(%520, %519) : (i64, i64) -> i64
      func.call @stack_push_pointer(%521) : (i64) -> ()
      %522 = func.call @stack_pop_pointer() : () -> i64
      %523 = func.call @stack_pop_pointer() : () -> i64
      %524 = func.call @cc_cons(%523, %522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%524) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %525 = func.call @stack_pop_pointer() : () -> i64
      %526 = func.call @stack_pop_pointer() : () -> i64
      %527 = func.call @cc_cons(%526, %525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%527) : (i64) -> ()
      %528 = func.call @stack_pop_pointer() : () -> i64
      %529 = func.call @stack_pop_pointer() : () -> i64
      %530 = func.call @cc_cons(%529, %528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%530) : (i64) -> ()
      %531 = func.call @stack_pop_pointer() : () -> i64
      %588 = arith.constant 51151114338308 : i64
      %589 = arith.constant 0 : i64
      %590 = func.call @cc_make_closure(%588, %589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%590) : (i64) -> ()
      %591 = func.call @stack_pop_pointer() : () -> i64
      %592 = llvm.mlir.addressof @str43 : !llvm.ptr
      %593 = arith.constant 4 : i64
      %594 = func.call @cc_make_string(%592, %593) : (!llvm.ptr, i64) -> i64
      %595 = func.call @cc_nil_value() : () -> i64
      %596 = func.call @cc_intern(%594, %595) : (i64, i64) -> i64
      %597 = func.call @cc_nil_value() : () -> i64
      %598 = func.call @cc_cons(%596, %597) : (i64, i64) -> i64
      %599 = func.call @cc_values_pack(%598) : (i64) -> i64
      func.call @stack_push_pointer(%596) : (i64) -> ()
      %600 = llvm.mlir.addressof @str44 : !llvm.ptr
      %601 = arith.constant 10 : i64
      %602 = func.call @cc_make_string(%600, %601) : (!llvm.ptr, i64) -> i64
      %603 = llvm.mlir.addressof @str45 : !llvm.ptr
      %604 = arith.constant 11 : i64
      %605 = func.call @cc_make_string(%603, %604) : (!llvm.ptr, i64) -> i64
      %606 = func.call @cc_intern(%602, %605) : (i64, i64) -> i64
      %607 = func.call @cc_nil_value() : () -> i64
      %608 = func.call @cc_cons(%606, %607) : (i64, i64) -> i64
      %609 = func.call @cc_values_pack(%608) : (i64) -> i64
      func.call @stack_push_pointer(%606) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = func.call @cc_cons(%611, %610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @stack_pop_pointer() : () -> i64
      %615 = func.call @cc_cons(%614, %613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %616 = func.call @stack_pop_pointer() : () -> i64
      %617 = llvm.mlir.addressof @str46 : !llvm.ptr
      %618 = arith.constant 11 : i64
      %619 = func.call @cc_make_string(%617, %618) : (!llvm.ptr, i64) -> i64
      %620 = llvm.mlir.addressof @str47 : !llvm.ptr
      %621 = arith.constant 7 : i64
      %622 = func.call @cc_make_string(%620, %621) : (!llvm.ptr, i64) -> i64
      %623 = func.call @cc_intern(%619, %622) : (i64, i64) -> i64
      %624 = func.call @cc_nil_value() : () -> i64
      %625 = func.call @cc_cons(%623, %624) : (i64, i64) -> i64
      %626 = func.call @cc_values_pack(%625) : (i64) -> i64
      func.call @stack_push_pointer(%623) : (i64) -> ()
      %627 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = llvm.mlir.addressof @str48 : !llvm.ptr
      %630 = arith.constant 4 : i64
      %631 = func.call @cc_make_string(%629, %630) : (!llvm.ptr, i64) -> i64
      %632 = llvm.mlir.addressof @str49 : !llvm.ptr
      %633 = arith.constant 7 : i64
      %634 = func.call @cc_make_string(%632, %633) : (!llvm.ptr, i64) -> i64
      %635 = func.call @cc_intern(%631, %634) : (i64, i64) -> i64
      %636 = func.call @cc_nil_value() : () -> i64
      %637 = func.call @cc_cons(%635, %636) : (i64, i64) -> i64
      %638 = func.call @cc_values_pack(%637) : (i64) -> i64
      func.call @stack_push_pointer(%635) : (i64) -> ()
      %639 = func.call @stack_pop_pointer() : () -> i64
      %640 = llvm.mlir.addressof @str50 : !llvm.ptr
      %641 = arith.constant 5 : i64
      %642 = func.call @cc_make_string(%640, %641) : (!llvm.ptr, i64) -> i64
      %643 = func.call @cc_nil_value() : () -> i64
      %644 = func.call @cc_intern(%642, %643) : (i64, i64) -> i64
      %645 = func.call @cc_nil_value() : () -> i64
      %646 = func.call @cc_cons(%644, %645) : (i64, i64) -> i64
      %647 = func.call @cc_values_pack(%646) : (i64) -> i64
      func.call @stack_push_pointer(%644) : (i64) -> ()
      %648 = func.call @stack_pop_pointer() : () -> i64
      %649 = func.call @cc_nil_value() : () -> i64
      %650 = func.call @cc_errorp(%465) : (i64) -> i64
      %651 = arith.cmpi ne, %650, %649 : i64
      %652 = arith.cmpi eq, %649, %649 : i64
      %653 = arith.andi %651, %652 : i1
      %654 = scf.if %653 -> (i64) {
        scf.yield %465 : i64
      } else {
        scf.yield %649 : i64
      }
      %655 = func.call @cc_errorp(%531) : (i64) -> i64
      %656 = arith.cmpi ne, %655, %649 : i64
      %657 = arith.cmpi eq, %654, %649 : i64
      %658 = arith.andi %656, %657 : i1
      %659 = scf.if %658 -> (i64) {
        scf.yield %531 : i64
      } else {
        scf.yield %654 : i64
      }
      %660 = func.call @cc_errorp(%591) : (i64) -> i64
      %661 = arith.cmpi ne, %660, %649 : i64
      %662 = arith.cmpi eq, %659, %649 : i64
      %663 = arith.andi %661, %662 : i1
      %664 = scf.if %663 -> (i64) {
        scf.yield %591 : i64
      } else {
        scf.yield %659 : i64
      }
      %665 = func.call @cc_errorp(%616) : (i64) -> i64
      %666 = arith.cmpi ne, %665, %649 : i64
      %667 = arith.cmpi eq, %664, %649 : i64
      %668 = arith.andi %666, %667 : i1
      %669 = scf.if %668 -> (i64) {
        scf.yield %616 : i64
      } else {
        scf.yield %664 : i64
      }
      %670 = func.call @cc_errorp(%627) : (i64) -> i64
      %671 = arith.cmpi ne, %670, %649 : i64
      %672 = arith.cmpi eq, %669, %649 : i64
      %673 = arith.andi %671, %672 : i1
      %674 = scf.if %673 -> (i64) {
        scf.yield %627 : i64
      } else {
        scf.yield %669 : i64
      }
      %675 = func.call @cc_errorp(%628) : (i64) -> i64
      %676 = arith.cmpi ne, %675, %649 : i64
      %677 = arith.cmpi eq, %674, %649 : i64
      %678 = arith.andi %676, %677 : i1
      %679 = scf.if %678 -> (i64) {
        scf.yield %628 : i64
      } else {
        scf.yield %674 : i64
      }
      %680 = func.call @cc_errorp(%639) : (i64) -> i64
      %681 = arith.cmpi ne, %680, %649 : i64
      %682 = arith.cmpi eq, %679, %649 : i64
      %683 = arith.andi %681, %682 : i1
      %684 = scf.if %683 -> (i64) {
        scf.yield %639 : i64
      } else {
        scf.yield %679 : i64
      }
      %685 = func.call @cc_errorp(%648) : (i64) -> i64
      %686 = arith.cmpi ne, %685, %649 : i64
      %687 = arith.cmpi eq, %684, %649 : i64
      %688 = arith.andi %686, %687 : i1
      %689 = scf.if %688 -> (i64) {
        scf.yield %648 : i64
      } else {
        scf.yield %684 : i64
      }
      %690 = arith.cmpi ne, %689, %649 : i64
      scf.if %690 {
        func.call @stack_push_pointer(%689) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%465) : (i64) -> ()
        func.call @stack_push_pointer(%531) : (i64) -> ()
        func.call @stack_push_pointer(%591) : (i64) -> ()
        func.call @stack_push_pointer(%616) : (i64) -> ()
        func.call @stack_push_pointer(%627) : (i64) -> ()
        func.call @stack_push_pointer(%628) : (i64) -> ()
        func.call @stack_push_pointer(%639) : (i64) -> ()
        func.call @stack_push_pointer(%648) : (i64) -> ()
        %691 = llvm.mlir.addressof @str51 : !llvm.ptr
        %692 = func.call @cc_make_function_ref_const(%691) : (!llvm.ptr) -> i64
        %693 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%692, %693) : (i64, i64) -> ()
      }
      %694 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %694 : i64
    }
    %695 = func.call @cc_nil_value() : () -> i64
    %696 = func.call @cc_errorp(%456) : (i64) -> i64
    %697 = arith.cmpi ne, %696, %695 : i64
    %698 = scf.if %697 -> (i64) {
      scf.yield %456 : i64
    } else {
      %699 = llvm.mlir.addressof @str52 : !llvm.ptr
      %700 = arith.constant 7 : i64
      %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
      %702 = func.call @cc_nil_value() : () -> i64
      %703 = func.call @cc_intern(%701, %702) : (i64, i64) -> i64
      %704 = func.call @cc_nil_value() : () -> i64
      %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
      %706 = func.call @cc_values_pack(%705) : (i64) -> i64
      func.call @stack_push_pointer(%703) : (i64) -> ()
      %707 = func.call @stack_pop_pointer() : () -> i64
      %708 = llvm.mlir.addressof @str53 : !llvm.ptr
      %709 = arith.constant 13 : i64
      %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
      %711 = llvm.mlir.addressof @str54 : !llvm.ptr
      %712 = arith.constant 11 : i64
      %713 = func.call @cc_make_string(%711, %712) : (!llvm.ptr, i64) -> i64
      %714 = func.call @cc_intern(%710, %713) : (i64, i64) -> i64
      %715 = func.call @cc_nil_value() : () -> i64
      %716 = func.call @cc_cons(%714, %715) : (i64, i64) -> i64
      %717 = func.call @cc_values_pack(%716) : (i64) -> i64
      func.call @stack_push_pointer(%714) : (i64) -> ()
      %718 = llvm.mlir.addressof @str55 : !llvm.ptr
      %719 = arith.constant 6 : i64
      %720 = func.call @cc_make_string(%718, %719) : (!llvm.ptr, i64) -> i64
      %721 = func.call @cc_nil_value() : () -> i64
      %722 = func.call @cc_intern(%720, %721) : (i64, i64) -> i64
      %723 = func.call @cc_nil_value() : () -> i64
      %724 = func.call @cc_cons(%722, %723) : (i64, i64) -> i64
      %725 = func.call @cc_values_pack(%724) : (i64) -> i64
      func.call @stack_push_pointer(%722) : (i64) -> ()
      %726 = llvm.mlir.addressof @str56 : !llvm.ptr
      %727 = arith.constant 19 : i64
      %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
      %729 = func.call @cc_nil_value() : () -> i64
      %730 = func.call @cc_intern(%728, %729) : (i64, i64) -> i64
      %731 = func.call @cc_nil_value() : () -> i64
      %732 = func.call @cc_cons(%730, %731) : (i64, i64) -> i64
      %733 = func.call @cc_values_pack(%732) : (i64) -> i64
      func.call @stack_push_pointer(%730) : (i64) -> ()
      %734 = llvm.mlir.addressof @str57 : !llvm.ptr
      %735 = arith.constant 5 : i64
      %736 = func.call @cc_make_string(%734, %735) : (!llvm.ptr, i64) -> i64
      %737 = llvm.mlir.addressof @str58 : !llvm.ptr
      %738 = arith.constant 11 : i64
      %739 = func.call @cc_make_string(%737, %738) : (!llvm.ptr, i64) -> i64
      %740 = func.call @cc_intern(%736, %739) : (i64, i64) -> i64
      %741 = func.call @cc_nil_value() : () -> i64
      %742 = func.call @cc_cons(%740, %741) : (i64, i64) -> i64
      %743 = func.call @cc_values_pack(%742) : (i64) -> i64
      func.call @stack_push_pointer(%740) : (i64) -> ()
      %744 = arith.constant -1 : i64
      func.call @stack_push_fixnum(%744) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = func.call @stack_pop_pointer() : () -> i64
      %747 = func.call @cc_cons(%746, %745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%747) : (i64) -> ()
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @cc_cons(%749, %748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%750) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @cc_cons(%752, %751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%753) : (i64) -> ()
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @cc_cons(%755, %754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%756) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @stack_pop_pointer() : () -> i64
      %759 = func.call @cc_cons(%758, %757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%759) : (i64) -> ()
      %760 = func.call @stack_pop_pointer() : () -> i64
      %761 = func.call @stack_pop_pointer() : () -> i64
      %762 = func.call @cc_cons(%761, %760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%762) : (i64) -> ()
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = func.call @stack_pop_pointer() : () -> i64
      %765 = func.call @cc_cons(%764, %763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%765) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %766 = func.call @stack_pop_pointer() : () -> i64
      %767 = func.call @stack_pop_pointer() : () -> i64
      %768 = func.call @cc_cons(%767, %766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%768) : (i64) -> ()
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @cc_cons(%770, %769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%771) : (i64) -> ()
      %772 = func.call @stack_pop_pointer() : () -> i64
      %828 = arith.constant 51151114338309 : i64
      %829 = arith.constant 0 : i64
      %830 = func.call @cc_make_closure(%828, %829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%830) : (i64) -> ()
      %831 = func.call @stack_pop_pointer() : () -> i64
      %832 = llvm.mlir.addressof @str60 : !llvm.ptr
      %833 = arith.constant 4 : i64
      %834 = func.call @cc_make_string(%832, %833) : (!llvm.ptr, i64) -> i64
      %835 = func.call @cc_nil_value() : () -> i64
      %836 = func.call @cc_intern(%834, %835) : (i64, i64) -> i64
      %837 = func.call @cc_nil_value() : () -> i64
      %838 = func.call @cc_cons(%836, %837) : (i64, i64) -> i64
      %839 = func.call @cc_values_pack(%838) : (i64) -> i64
      func.call @stack_push_pointer(%836) : (i64) -> ()
      %840 = llvm.mlir.addressof @str61 : !llvm.ptr
      %841 = arith.constant 10 : i64
      %842 = func.call @cc_make_string(%840, %841) : (!llvm.ptr, i64) -> i64
      %843 = llvm.mlir.addressof @str62 : !llvm.ptr
      %844 = arith.constant 11 : i64
      %845 = func.call @cc_make_string(%843, %844) : (!llvm.ptr, i64) -> i64
      %846 = func.call @cc_intern(%842, %845) : (i64, i64) -> i64
      %847 = func.call @cc_nil_value() : () -> i64
      %848 = func.call @cc_cons(%846, %847) : (i64, i64) -> i64
      %849 = func.call @cc_values_pack(%848) : (i64) -> i64
      func.call @stack_push_pointer(%846) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = func.call @stack_pop_pointer() : () -> i64
      %852 = func.call @cc_cons(%851, %850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%852) : (i64) -> ()
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = func.call @stack_pop_pointer() : () -> i64
      %855 = func.call @cc_cons(%854, %853) : (i64, i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = llvm.mlir.addressof @str63 : !llvm.ptr
      %858 = arith.constant 11 : i64
      %859 = func.call @cc_make_string(%857, %858) : (!llvm.ptr, i64) -> i64
      %860 = llvm.mlir.addressof @str64 : !llvm.ptr
      %861 = arith.constant 7 : i64
      %862 = func.call @cc_make_string(%860, %861) : (!llvm.ptr, i64) -> i64
      %863 = func.call @cc_intern(%859, %862) : (i64, i64) -> i64
      %864 = func.call @cc_nil_value() : () -> i64
      %865 = func.call @cc_cons(%863, %864) : (i64, i64) -> i64
      %866 = func.call @cc_values_pack(%865) : (i64) -> i64
      func.call @stack_push_pointer(%863) : (i64) -> ()
      %867 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %868 = func.call @stack_pop_pointer() : () -> i64
      %869 = llvm.mlir.addressof @str65 : !llvm.ptr
      %870 = arith.constant 4 : i64
      %871 = func.call @cc_make_string(%869, %870) : (!llvm.ptr, i64) -> i64
      %872 = llvm.mlir.addressof @str66 : !llvm.ptr
      %873 = arith.constant 7 : i64
      %874 = func.call @cc_make_string(%872, %873) : (!llvm.ptr, i64) -> i64
      %875 = func.call @cc_intern(%871, %874) : (i64, i64) -> i64
      %876 = func.call @cc_nil_value() : () -> i64
      %877 = func.call @cc_cons(%875, %876) : (i64, i64) -> i64
      %878 = func.call @cc_values_pack(%877) : (i64) -> i64
      func.call @stack_push_pointer(%875) : (i64) -> ()
      %879 = func.call @stack_pop_pointer() : () -> i64
      %880 = llvm.mlir.addressof @str67 : !llvm.ptr
      %881 = arith.constant 5 : i64
      %882 = func.call @cc_make_string(%880, %881) : (!llvm.ptr, i64) -> i64
      %883 = func.call @cc_nil_value() : () -> i64
      %884 = func.call @cc_intern(%882, %883) : (i64, i64) -> i64
      %885 = func.call @cc_nil_value() : () -> i64
      %886 = func.call @cc_cons(%884, %885) : (i64, i64) -> i64
      %887 = func.call @cc_values_pack(%886) : (i64) -> i64
      func.call @stack_push_pointer(%884) : (i64) -> ()
      %888 = func.call @stack_pop_pointer() : () -> i64
      %889 = func.call @cc_nil_value() : () -> i64
      %890 = func.call @cc_errorp(%707) : (i64) -> i64
      %891 = arith.cmpi ne, %890, %889 : i64
      %892 = arith.cmpi eq, %889, %889 : i64
      %893 = arith.andi %891, %892 : i1
      %894 = scf.if %893 -> (i64) {
        scf.yield %707 : i64
      } else {
        scf.yield %889 : i64
      }
      %895 = func.call @cc_errorp(%772) : (i64) -> i64
      %896 = arith.cmpi ne, %895, %889 : i64
      %897 = arith.cmpi eq, %894, %889 : i64
      %898 = arith.andi %896, %897 : i1
      %899 = scf.if %898 -> (i64) {
        scf.yield %772 : i64
      } else {
        scf.yield %894 : i64
      }
      %900 = func.call @cc_errorp(%831) : (i64) -> i64
      %901 = arith.cmpi ne, %900, %889 : i64
      %902 = arith.cmpi eq, %899, %889 : i64
      %903 = arith.andi %901, %902 : i1
      %904 = scf.if %903 -> (i64) {
        scf.yield %831 : i64
      } else {
        scf.yield %899 : i64
      }
      %905 = func.call @cc_errorp(%856) : (i64) -> i64
      %906 = arith.cmpi ne, %905, %889 : i64
      %907 = arith.cmpi eq, %904, %889 : i64
      %908 = arith.andi %906, %907 : i1
      %909 = scf.if %908 -> (i64) {
        scf.yield %856 : i64
      } else {
        scf.yield %904 : i64
      }
      %910 = func.call @cc_errorp(%867) : (i64) -> i64
      %911 = arith.cmpi ne, %910, %889 : i64
      %912 = arith.cmpi eq, %909, %889 : i64
      %913 = arith.andi %911, %912 : i1
      %914 = scf.if %913 -> (i64) {
        scf.yield %867 : i64
      } else {
        scf.yield %909 : i64
      }
      %915 = func.call @cc_errorp(%868) : (i64) -> i64
      %916 = arith.cmpi ne, %915, %889 : i64
      %917 = arith.cmpi eq, %914, %889 : i64
      %918 = arith.andi %916, %917 : i1
      %919 = scf.if %918 -> (i64) {
        scf.yield %868 : i64
      } else {
        scf.yield %914 : i64
      }
      %920 = func.call @cc_errorp(%879) : (i64) -> i64
      %921 = arith.cmpi ne, %920, %889 : i64
      %922 = arith.cmpi eq, %919, %889 : i64
      %923 = arith.andi %921, %922 : i1
      %924 = scf.if %923 -> (i64) {
        scf.yield %879 : i64
      } else {
        scf.yield %919 : i64
      }
      %925 = func.call @cc_errorp(%888) : (i64) -> i64
      %926 = arith.cmpi ne, %925, %889 : i64
      %927 = arith.cmpi eq, %924, %889 : i64
      %928 = arith.andi %926, %927 : i1
      %929 = scf.if %928 -> (i64) {
        scf.yield %888 : i64
      } else {
        scf.yield %924 : i64
      }
      %930 = arith.cmpi ne, %929, %889 : i64
      scf.if %930 {
        func.call @stack_push_pointer(%929) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%707) : (i64) -> ()
        func.call @stack_push_pointer(%772) : (i64) -> ()
        func.call @stack_push_pointer(%831) : (i64) -> ()
        func.call @stack_push_pointer(%856) : (i64) -> ()
        func.call @stack_push_pointer(%867) : (i64) -> ()
        func.call @stack_push_pointer(%868) : (i64) -> ()
        func.call @stack_push_pointer(%879) : (i64) -> ()
        func.call @stack_push_pointer(%888) : (i64) -> ()
        %931 = llvm.mlir.addressof @str68 : !llvm.ptr
        %932 = func.call @cc_make_function_ref_const(%931) : (!llvm.ptr) -> i64
        %933 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%932, %933) : (i64, i64) -> ()
      }
      %934 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %934 : i64
    }
    %935 = func.call @cc_nil_value() : () -> i64
    %936 = func.call @cc_errorp(%698) : (i64) -> i64
    %937 = arith.cmpi ne, %936, %935 : i64
    %938 = scf.if %937 -> (i64) {
      scf.yield %698 : i64
    } else {
      %939 = llvm.mlir.addressof @str69 : !llvm.ptr
      %940 = func.call @cc_make_function_ref_const(%939) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%940) : (i64) -> ()
      %941 = func.call @stack_pop_pointer() : () -> i64
      %942 = llvm.mlir.addressof @str70 : !llvm.ptr
      %943 = arith.constant 8 : i64
      %944 = func.call @cc_make_string(%942, %943) : (!llvm.ptr, i64) -> i64
      %945 = llvm.mlir.addressof @str71 : !llvm.ptr
      %946 = arith.constant 15 : i64
      %947 = func.call @cc_make_string(%945, %946) : (!llvm.ptr, i64) -> i64
      %948 = func.call @cc_intern(%944, %947) : (i64, i64) -> i64
      %949 = func.call @cc_nil_value() : () -> i64
      %950 = func.call @cc_cons(%948, %949) : (i64, i64) -> i64
      %951 = func.call @cc_values_pack(%950) : (i64) -> i64
      %952 = func.call @cc_set_symbol_value(%948, %941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%941) : (i64) -> ()
      %953 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %953 : i64
    }
    %954 = func.call @cc_nil_value() : () -> i64
    %955 = func.call @cc_errorp(%938) : (i64) -> i64
    %956 = arith.cmpi ne, %955, %954 : i64
    %957 = scf.if %956 -> (i64) {
      scf.yield %938 : i64
    } else {
      %958 = llvm.mlir.addressof @str72 : !llvm.ptr
      %959 = func.call @cc_make_function_ref_const(%958) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%959) : (i64) -> ()
      %960 = func.call @stack_pop_pointer() : () -> i64
      %961 = llvm.mlir.addressof @str73 : !llvm.ptr
      %962 = arith.constant 8 : i64
      %963 = func.call @cc_make_string(%961, %962) : (!llvm.ptr, i64) -> i64
      %964 = llvm.mlir.addressof @str74 : !llvm.ptr
      %965 = arith.constant 15 : i64
      %966 = func.call @cc_make_string(%964, %965) : (!llvm.ptr, i64) -> i64
      %967 = func.call @cc_intern(%963, %966) : (i64, i64) -> i64
      %968 = func.call @cc_nil_value() : () -> i64
      %969 = func.call @cc_cons(%967, %968) : (i64, i64) -> i64
      %970 = func.call @cc_values_pack(%969) : (i64) -> i64
      %971 = func.call @cc_set_symbol_value(%967, %960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%960) : (i64) -> ()
      %972 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %972 : i64
    }
    %973 = func.call @cc_nil_value() : () -> i64
    %974 = func.call @cc_errorp(%957) : (i64) -> i64
    %975 = arith.cmpi ne, %974, %973 : i64
    %976 = scf.if %975 -> (i64) {
      scf.yield %957 : i64
    } else {
      %977 = llvm.mlir.addressof @str75 : !llvm.ptr
      %978 = func.call @cc_make_function_ref_const(%977) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%978) : (i64) -> ()
      %979 = func.call @stack_pop_pointer() : () -> i64
      %980 = llvm.mlir.addressof @str76 : !llvm.ptr
      %981 = arith.constant 8 : i64
      %982 = func.call @cc_make_string(%980, %981) : (!llvm.ptr, i64) -> i64
      %983 = llvm.mlir.addressof @str77 : !llvm.ptr
      %984 = arith.constant 15 : i64
      %985 = func.call @cc_make_string(%983, %984) : (!llvm.ptr, i64) -> i64
      %986 = func.call @cc_intern(%982, %985) : (i64, i64) -> i64
      %987 = func.call @cc_nil_value() : () -> i64
      %988 = func.call @cc_cons(%986, %987) : (i64, i64) -> i64
      %989 = func.call @cc_values_pack(%988) : (i64) -> i64
      %990 = func.call @cc_set_symbol_value(%986, %979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%979) : (i64) -> ()
      %991 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %991 : i64
    }
    %992 = func.call @cc_nil_value() : () -> i64
    %993 = func.call @cc_errorp(%976) : (i64) -> i64
    %994 = arith.cmpi ne, %993, %992 : i64
    %995 = scf.if %994 -> (i64) {
      scf.yield %976 : i64
    } else {
      %996 = llvm.mlir.addressof @str78 : !llvm.ptr
      %997 = func.call @cc_make_function_ref_const(%996) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%997) : (i64) -> ()
      %998 = func.call @stack_pop_pointer() : () -> i64
      %999 = llvm.mlir.addressof @str79 : !llvm.ptr
      %1000 = arith.constant 8 : i64
      %1001 = func.call @cc_make_string(%999, %1000) : (!llvm.ptr, i64) -> i64
      %1002 = llvm.mlir.addressof @str80 : !llvm.ptr
      %1003 = arith.constant 15 : i64
      %1004 = func.call @cc_make_string(%1002, %1003) : (!llvm.ptr, i64) -> i64
      %1005 = func.call @cc_intern(%1001, %1004) : (i64, i64) -> i64
      %1006 = func.call @cc_nil_value() : () -> i64
      %1007 = func.call @cc_cons(%1005, %1006) : (i64, i64) -> i64
      %1008 = func.call @cc_values_pack(%1007) : (i64) -> i64
      %1009 = func.call @cc_set_symbol_value(%1005, %998) : (i64, i64) -> i64
      func.call @stack_push_pointer(%998) : (i64) -> ()
      %1010 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1010 : i64
    }
    %1011 = func.call @cc_nil_value() : () -> i64
    %1012 = func.call @cc_errorp(%995) : (i64) -> i64
    %1013 = arith.cmpi ne, %1012, %1011 : i64
    %1014 = scf.if %1013 -> (i64) {
      scf.yield %995 : i64
    } else {
      %1015 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1016 = arith.constant 8 : i64
      %1017 = func.call @cc_make_string(%1015, %1016) : (!llvm.ptr, i64) -> i64
      %1018 = func.call @cc_nil_value() : () -> i64
      %1019 = func.call @cc_intern(%1017, %1018) : (i64, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_cons(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_values_pack(%1021) : (i64) -> i64
      func.call @stack_push_pointer(%1019) : (i64) -> ()
      %1092 = arith.constant 51151114338310 : i64
      %1093 = arith.constant 0 : i64
      %1094 = func.call @cc_make_closure(%1092, %1093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1094) : (i64) -> ()
      %1095 = func.call @stack_pop_pointer() : () -> i64
      %1096 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1095) : (i64) -> ()
      func.call @stack_push_pointer(%1096) : (i64) -> ()
      %1097 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1098 = func.call @cc_make_function_ref_const(%1097) : (!llvm.ptr) -> i64
      %1099 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%1098, %1099) : (i64, i64) -> ()
      %1100 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1100 : i64
    }
    %1101 = func.call @cc_nil_value() : () -> i64
    %1102 = func.call @cc_errorp(%1014) : (i64) -> i64
    %1103 = arith.cmpi ne, %1102, %1101 : i64
    %1104 = scf.if %1103 -> (i64) {
      scf.yield %1014 : i64
    } else {
      %1105 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1106 = arith.constant 35 : i64
      %1107 = func.call @cc_make_string(%1105, %1106) : (!llvm.ptr, i64) -> i64
      %1108 = func.call @cc_nil_value() : () -> i64
      %1109 = func.call @cc_intern(%1107, %1108) : (i64, i64) -> i64
      %1110 = func.call @cc_nil_value() : () -> i64
      %1111 = func.call @cc_cons(%1109, %1110) : (i64, i64) -> i64
      %1112 = func.call @cc_values_pack(%1111) : (i64) -> i64
      func.call @stack_push_pointer(%1109) : (i64) -> ()
      %1113 = func.call @stack_pop_pointer() : () -> i64
      %1114 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1115 = arith.constant 5 : i64
      %1116 = func.call @cc_make_string(%1114, %1115) : (!llvm.ptr, i64) -> i64
      %1117 = func.call @cc_nil_value() : () -> i64
      %1118 = func.call @cc_intern(%1116, %1117) : (i64, i64) -> i64
      %1119 = func.call @cc_nil_value() : () -> i64
      %1120 = func.call @cc_cons(%1118, %1119) : (i64, i64) -> i64
      %1121 = func.call @cc_values_pack(%1120) : (i64) -> i64
      func.call @stack_push_pointer(%1118) : (i64) -> ()
      %1122 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1123 = arith.constant 4 : i64
      %1124 = func.call @cc_make_string(%1122, %1123) : (!llvm.ptr, i64) -> i64
      %1125 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1126 = arith.constant 11 : i64
      %1127 = func.call @cc_make_string(%1125, %1126) : (!llvm.ptr, i64) -> i64
      %1128 = func.call @cc_intern(%1124, %1127) : (i64, i64) -> i64
      %1129 = func.call @cc_nil_value() : () -> i64
      %1130 = func.call @cc_cons(%1128, %1129) : (i64, i64) -> i64
      %1131 = func.call @cc_values_pack(%1130) : (i64) -> i64
      func.call @stack_push_pointer(%1128) : (i64) -> ()
      %1132 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1133 = arith.constant 13 : i64
      %1134 = func.call @cc_make_string(%1132, %1133) : (!llvm.ptr, i64) -> i64
      %1135 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1136 = arith.constant 11 : i64
      %1137 = func.call @cc_make_string(%1135, %1136) : (!llvm.ptr, i64) -> i64
      %1138 = func.call @cc_intern(%1134, %1137) : (i64, i64) -> i64
      %1139 = func.call @cc_nil_value() : () -> i64
      %1140 = func.call @cc_cons(%1138, %1139) : (i64, i64) -> i64
      %1141 = func.call @cc_values_pack(%1140) : (i64) -> i64
      func.call @stack_push_pointer(%1138) : (i64) -> ()
      %1142 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1142) : (i64) -> ()
      %1143 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1144 = arith.constant 8 : i64
      %1145 = func.call @cc_make_string(%1143, %1144) : (!llvm.ptr, i64) -> i64
      %1146 = func.call @cc_nil_value() : () -> i64
      %1147 = func.call @cc_intern(%1145, %1146) : (i64, i64) -> i64
      %1148 = func.call @cc_nil_value() : () -> i64
      %1149 = func.call @cc_cons(%1147, %1148) : (i64, i64) -> i64
      %1150 = func.call @cc_values_pack(%1149) : (i64) -> i64
      func.call @stack_push_pointer(%1147) : (i64) -> ()
      %1151 = func.call @stack_pop_pointer() : () -> i64
      %1152 = func.call @stack_pop_pointer() : () -> i64
      %1153 = func.call @cc_cons(%1151, %1152) : (i64, i64) -> i64
      %1154 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1155 = arith.constant 5 : i64
      %1156 = func.call @cc_make_string(%1154, %1155) : (!llvm.ptr, i64) -> i64
      %1157 = func.call @cc_nil_value() : () -> i64
      %1158 = func.call @cc_intern(%1156, %1157) : (i64, i64) -> i64
      %1159 = func.call @cc_nil_value() : () -> i64
      %1160 = func.call @cc_cons(%1158, %1159) : (i64, i64) -> i64
      %1161 = func.call @cc_values_pack(%1160) : (i64) -> i64
      %1162 = func.call @cc_cons(%1158, %1153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1162) : (i64) -> ()
      %1163 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1163) : (i64) -> ()
      %1164 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1165 = arith.constant 14 : i64
      %1166 = func.call @cc_make_string(%1164, %1165) : (!llvm.ptr, i64) -> i64
      %1167 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1168 = arith.constant 11 : i64
      %1169 = func.call @cc_make_string(%1167, %1168) : (!llvm.ptr, i64) -> i64
      %1170 = func.call @cc_intern(%1166, %1169) : (i64, i64) -> i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_cons(%1170, %1171) : (i64, i64) -> i64
      %1173 = func.call @cc_values_pack(%1172) : (i64) -> i64
      func.call @stack_push_pointer(%1170) : (i64) -> ()
      %1174 = func.call @stack_pop_pointer() : () -> i64
      %1175 = func.call @stack_pop_pointer() : () -> i64
      %1176 = func.call @cc_cons(%1174, %1175) : (i64, i64) -> i64
      %1177 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1178 = arith.constant 5 : i64
      %1179 = func.call @cc_make_string(%1177, %1178) : (!llvm.ptr, i64) -> i64
      %1180 = func.call @cc_nil_value() : () -> i64
      %1181 = func.call @cc_intern(%1179, %1180) : (i64, i64) -> i64
      %1182 = func.call @cc_nil_value() : () -> i64
      %1183 = func.call @cc_cons(%1181, %1182) : (i64, i64) -> i64
      %1184 = func.call @cc_values_pack(%1183) : (i64) -> i64
      %1185 = func.call @cc_cons(%1181, %1176) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1185) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1186 = func.call @stack_pop_pointer() : () -> i64
      %1187 = func.call @stack_pop_pointer() : () -> i64
      %1188 = func.call @cc_cons(%1187, %1186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1188) : (i64) -> ()
      %1189 = func.call @stack_pop_pointer() : () -> i64
      %1190 = func.call @stack_pop_pointer() : () -> i64
      %1191 = func.call @cc_cons(%1190, %1189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1191) : (i64) -> ()
      %1192 = func.call @stack_pop_pointer() : () -> i64
      %1193 = func.call @stack_pop_pointer() : () -> i64
      %1194 = func.call @cc_cons(%1193, %1192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1194) : (i64) -> ()
      %1195 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1196 = arith.constant 3 : i64
      %1197 = func.call @cc_make_string(%1195, %1196) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1197) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1198 = func.call @stack_pop_pointer() : () -> i64
      %1199 = func.call @stack_pop_pointer() : () -> i64
      %1200 = func.call @cc_cons(%1199, %1198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1200) : (i64) -> ()
      %1201 = func.call @stack_pop_pointer() : () -> i64
      %1202 = func.call @stack_pop_pointer() : () -> i64
      %1203 = func.call @cc_cons(%1202, %1201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1203) : (i64) -> ()
      %1204 = func.call @stack_pop_pointer() : () -> i64
      %1205 = func.call @stack_pop_pointer() : () -> i64
      %1206 = func.call @cc_cons(%1205, %1204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1206) : (i64) -> ()
      %1207 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1208 = arith.constant 13 : i64
      %1209 = func.call @cc_make_string(%1207, %1208) : (!llvm.ptr, i64) -> i64
      %1210 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1211 = arith.constant 11 : i64
      %1212 = func.call @cc_make_string(%1210, %1211) : (!llvm.ptr, i64) -> i64
      %1213 = func.call @cc_intern(%1209, %1212) : (i64, i64) -> i64
      %1214 = func.call @cc_nil_value() : () -> i64
      %1215 = func.call @cc_cons(%1213, %1214) : (i64, i64) -> i64
      %1216 = func.call @cc_values_pack(%1215) : (i64) -> i64
      func.call @stack_push_pointer(%1213) : (i64) -> ()
      %1217 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1217) : (i64) -> ()
      %1218 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1219 = arith.constant 8 : i64
      %1220 = func.call @cc_make_string(%1218, %1219) : (!llvm.ptr, i64) -> i64
      %1221 = func.call @cc_nil_value() : () -> i64
      %1222 = func.call @cc_intern(%1220, %1221) : (i64, i64) -> i64
      %1223 = func.call @cc_nil_value() : () -> i64
      %1224 = func.call @cc_cons(%1222, %1223) : (i64, i64) -> i64
      %1225 = func.call @cc_values_pack(%1224) : (i64) -> i64
      func.call @stack_push_pointer(%1222) : (i64) -> ()
      %1226 = func.call @stack_pop_pointer() : () -> i64
      %1227 = func.call @stack_pop_pointer() : () -> i64
      %1228 = func.call @cc_cons(%1226, %1227) : (i64, i64) -> i64
      %1229 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1230 = arith.constant 5 : i64
      %1231 = func.call @cc_make_string(%1229, %1230) : (!llvm.ptr, i64) -> i64
      %1232 = func.call @cc_nil_value() : () -> i64
      %1233 = func.call @cc_intern(%1231, %1232) : (i64, i64) -> i64
      %1234 = func.call @cc_nil_value() : () -> i64
      %1235 = func.call @cc_cons(%1233, %1234) : (i64, i64) -> i64
      %1236 = func.call @cc_values_pack(%1235) : (i64) -> i64
      %1237 = func.call @cc_cons(%1233, %1228) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1237) : (i64) -> ()
      %1238 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1238) : (i64) -> ()
      %1239 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1240 = arith.constant 14 : i64
      %1241 = func.call @cc_make_string(%1239, %1240) : (!llvm.ptr, i64) -> i64
      %1242 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1243 = arith.constant 11 : i64
      %1244 = func.call @cc_make_string(%1242, %1243) : (!llvm.ptr, i64) -> i64
      %1245 = func.call @cc_intern(%1241, %1244) : (i64, i64) -> i64
      %1246 = func.call @cc_nil_value() : () -> i64
      %1247 = func.call @cc_cons(%1245, %1246) : (i64, i64) -> i64
      %1248 = func.call @cc_values_pack(%1247) : (i64) -> i64
      func.call @stack_push_pointer(%1245) : (i64) -> ()
      %1249 = func.call @stack_pop_pointer() : () -> i64
      %1250 = func.call @stack_pop_pointer() : () -> i64
      %1251 = func.call @cc_cons(%1249, %1250) : (i64, i64) -> i64
      %1252 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1253 = arith.constant 5 : i64
      %1254 = func.call @cc_make_string(%1252, %1253) : (!llvm.ptr, i64) -> i64
      %1255 = func.call @cc_nil_value() : () -> i64
      %1256 = func.call @cc_intern(%1254, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_nil_value() : () -> i64
      %1258 = func.call @cc_cons(%1256, %1257) : (i64, i64) -> i64
      %1259 = func.call @cc_values_pack(%1258) : (i64) -> i64
      %1260 = func.call @cc_cons(%1256, %1251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = func.call @stack_pop_pointer() : () -> i64
      %1263 = func.call @cc_cons(%1262, %1261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      %1264 = func.call @stack_pop_pointer() : () -> i64
      %1265 = func.call @stack_pop_pointer() : () -> i64
      %1266 = func.call @cc_cons(%1265, %1264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1266) : (i64) -> ()
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_cons(%1268, %1267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1269) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1270 = func.call @stack_pop_pointer() : () -> i64
      %1271 = func.call @stack_pop_pointer() : () -> i64
      %1272 = func.call @cc_cons(%1271, %1270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1272) : (i64) -> ()
      %1273 = func.call @stack_pop_pointer() : () -> i64
      %1274 = func.call @stack_pop_pointer() : () -> i64
      %1275 = func.call @cc_cons(%1274, %1273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1275) : (i64) -> ()
      %1276 = func.call @stack_pop_pointer() : () -> i64
      %1277 = func.call @stack_pop_pointer() : () -> i64
      %1278 = func.call @cc_cons(%1277, %1276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1278) : (i64) -> ()
      %1279 = func.call @stack_pop_pointer() : () -> i64
      %1359 = arith.constant 51151114338311 : i64
      %1360 = arith.constant 0 : i64
      %1361 = func.call @cc_make_closure(%1359, %1360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1361) : (i64) -> ()
      %1362 = func.call @stack_pop_pointer() : () -> i64
      %1363 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1364 = arith.constant 3 : i64
      %1365 = func.call @cc_make_string(%1363, %1364) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1365) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1366 = func.call @stack_pop_pointer() : () -> i64
      %1367 = func.call @stack_pop_pointer() : () -> i64
      %1368 = func.call @cc_cons(%1367, %1366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1368) : (i64) -> ()
      %1369 = func.call @stack_pop_pointer() : () -> i64
      %1370 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1371 = arith.constant 11 : i64
      %1372 = func.call @cc_make_string(%1370, %1371) : (!llvm.ptr, i64) -> i64
      %1373 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1374 = arith.constant 7 : i64
      %1375 = func.call @cc_make_string(%1373, %1374) : (!llvm.ptr, i64) -> i64
      %1376 = func.call @cc_intern(%1372, %1375) : (i64, i64) -> i64
      %1377 = func.call @cc_nil_value() : () -> i64
      %1378 = func.call @cc_cons(%1376, %1377) : (i64, i64) -> i64
      %1379 = func.call @cc_values_pack(%1378) : (i64) -> i64
      func.call @stack_push_pointer(%1376) : (i64) -> ()
      %1380 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1381 = func.call @stack_pop_pointer() : () -> i64
      %1382 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1383 = arith.constant 4 : i64
      %1384 = func.call @cc_make_string(%1382, %1383) : (!llvm.ptr, i64) -> i64
      %1385 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1386 = arith.constant 7 : i64
      %1387 = func.call @cc_make_string(%1385, %1386) : (!llvm.ptr, i64) -> i64
      %1388 = func.call @cc_intern(%1384, %1387) : (i64, i64) -> i64
      %1389 = func.call @cc_nil_value() : () -> i64
      %1390 = func.call @cc_cons(%1388, %1389) : (i64, i64) -> i64
      %1391 = func.call @cc_values_pack(%1390) : (i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      %1392 = func.call @stack_pop_pointer() : () -> i64
      %1393 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1394 = arith.constant 6 : i64
      %1395 = func.call @cc_make_string(%1393, %1394) : (!llvm.ptr, i64) -> i64
      %1396 = func.call @cc_nil_value() : () -> i64
      %1397 = func.call @cc_intern(%1395, %1396) : (i64, i64) -> i64
      %1398 = func.call @cc_nil_value() : () -> i64
      %1399 = func.call @cc_cons(%1397, %1398) : (i64, i64) -> i64
      %1400 = func.call @cc_values_pack(%1399) : (i64) -> i64
      func.call @stack_push_pointer(%1397) : (i64) -> ()
      %1401 = func.call @stack_pop_pointer() : () -> i64
      %1402 = func.call @cc_nil_value() : () -> i64
      %1403 = func.call @cc_errorp(%1113) : (i64) -> i64
      %1404 = arith.cmpi ne, %1403, %1402 : i64
      %1405 = arith.cmpi eq, %1402, %1402 : i64
      %1406 = arith.andi %1404, %1405 : i1
      %1407 = scf.if %1406 -> (i64) {
        scf.yield %1113 : i64
      } else {
        scf.yield %1402 : i64
      }
      %1408 = func.call @cc_errorp(%1279) : (i64) -> i64
      %1409 = arith.cmpi ne, %1408, %1402 : i64
      %1410 = arith.cmpi eq, %1407, %1402 : i64
      %1411 = arith.andi %1409, %1410 : i1
      %1412 = scf.if %1411 -> (i64) {
        scf.yield %1279 : i64
      } else {
        scf.yield %1407 : i64
      }
      %1413 = func.call @cc_errorp(%1362) : (i64) -> i64
      %1414 = arith.cmpi ne, %1413, %1402 : i64
      %1415 = arith.cmpi eq, %1412, %1402 : i64
      %1416 = arith.andi %1414, %1415 : i1
      %1417 = scf.if %1416 -> (i64) {
        scf.yield %1362 : i64
      } else {
        scf.yield %1412 : i64
      }
      %1418 = func.call @cc_errorp(%1369) : (i64) -> i64
      %1419 = arith.cmpi ne, %1418, %1402 : i64
      %1420 = arith.cmpi eq, %1417, %1402 : i64
      %1421 = arith.andi %1419, %1420 : i1
      %1422 = scf.if %1421 -> (i64) {
        scf.yield %1369 : i64
      } else {
        scf.yield %1417 : i64
      }
      %1423 = func.call @cc_errorp(%1380) : (i64) -> i64
      %1424 = arith.cmpi ne, %1423, %1402 : i64
      %1425 = arith.cmpi eq, %1422, %1402 : i64
      %1426 = arith.andi %1424, %1425 : i1
      %1427 = scf.if %1426 -> (i64) {
        scf.yield %1380 : i64
      } else {
        scf.yield %1422 : i64
      }
      %1428 = func.call @cc_errorp(%1381) : (i64) -> i64
      %1429 = arith.cmpi ne, %1428, %1402 : i64
      %1430 = arith.cmpi eq, %1427, %1402 : i64
      %1431 = arith.andi %1429, %1430 : i1
      %1432 = scf.if %1431 -> (i64) {
        scf.yield %1381 : i64
      } else {
        scf.yield %1427 : i64
      }
      %1433 = func.call @cc_errorp(%1392) : (i64) -> i64
      %1434 = arith.cmpi ne, %1433, %1402 : i64
      %1435 = arith.cmpi eq, %1432, %1402 : i64
      %1436 = arith.andi %1434, %1435 : i1
      %1437 = scf.if %1436 -> (i64) {
        scf.yield %1392 : i64
      } else {
        scf.yield %1432 : i64
      }
      %1438 = func.call @cc_errorp(%1401) : (i64) -> i64
      %1439 = arith.cmpi ne, %1438, %1402 : i64
      %1440 = arith.cmpi eq, %1437, %1402 : i64
      %1441 = arith.andi %1439, %1440 : i1
      %1442 = scf.if %1441 -> (i64) {
        scf.yield %1401 : i64
      } else {
        scf.yield %1437 : i64
      }
      %1443 = arith.cmpi ne, %1442, %1402 : i64
      scf.if %1443 {
        func.call @stack_push_pointer(%1442) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1113) : (i64) -> ()
        func.call @stack_push_pointer(%1279) : (i64) -> ()
        func.call @stack_push_pointer(%1362) : (i64) -> ()
        func.call @stack_push_pointer(%1369) : (i64) -> ()
        func.call @stack_push_pointer(%1380) : (i64) -> ()
        func.call @stack_push_pointer(%1381) : (i64) -> ()
        func.call @stack_push_pointer(%1392) : (i64) -> ()
        func.call @stack_push_pointer(%1401) : (i64) -> ()
        %1444 = llvm.mlir.addressof @str118 : !llvm.ptr
        %1445 = func.call @cc_make_function_ref_const(%1444) : (!llvm.ptr) -> i64
        %1446 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1445, %1446) : (i64, i64) -> ()
      }
      %1447 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1447 : i64
    }
    %1448 = func.call @cc_nil_value() : () -> i64
    %1449 = func.call @cc_errorp(%1104) : (i64) -> i64
    %1450 = arith.cmpi ne, %1449, %1448 : i64
    %1451 = scf.if %1450 -> (i64) {
      scf.yield %1104 : i64
    } else {
      %1452 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1453 = arith.constant 22 : i64
      %1454 = func.call @cc_make_string(%1452, %1453) : (!llvm.ptr, i64) -> i64
      %1455 = func.call @cc_nil_value() : () -> i64
      %1456 = func.call @cc_intern(%1454, %1455) : (i64, i64) -> i64
      %1457 = func.call @cc_nil_value() : () -> i64
      %1458 = func.call @cc_cons(%1456, %1457) : (i64, i64) -> i64
      %1459 = func.call @cc_values_pack(%1458) : (i64) -> i64
      func.call @stack_push_pointer(%1456) : (i64) -> ()
      %1460 = func.call @stack_pop_pointer() : () -> i64
      %1461 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1462 = arith.constant 7 : i64
      %1463 = func.call @cc_make_string(%1461, %1462) : (!llvm.ptr, i64) -> i64
      %1464 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1465 = arith.constant 11 : i64
      %1466 = func.call @cc_make_string(%1464, %1465) : (!llvm.ptr, i64) -> i64
      %1467 = func.call @cc_intern(%1463, %1466) : (i64, i64) -> i64
      %1468 = func.call @cc_nil_value() : () -> i64
      %1469 = func.call @cc_cons(%1467, %1468) : (i64, i64) -> i64
      %1470 = func.call @cc_values_pack(%1469) : (i64) -> i64
      func.call @stack_push_pointer(%1467) : (i64) -> ()
      %1471 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1472 = arith.constant 23 : i64
      %1473 = func.call @cc_make_string(%1471, %1472) : (!llvm.ptr, i64) -> i64
      %1474 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1475 = arith.constant 11 : i64
      %1476 = func.call @cc_make_string(%1474, %1475) : (!llvm.ptr, i64) -> i64
      %1477 = func.call @cc_intern(%1473, %1476) : (i64, i64) -> i64
      %1478 = func.call @cc_nil_value() : () -> i64
      %1479 = func.call @cc_cons(%1477, %1478) : (i64, i64) -> i64
      %1480 = func.call @cc_values_pack(%1479) : (i64) -> i64
      func.call @stack_push_pointer(%1477) : (i64) -> ()
      %1481 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1481) : (i64) -> ()
      %1482 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1483 = arith.constant 8 : i64
      %1484 = func.call @cc_make_string(%1482, %1483) : (!llvm.ptr, i64) -> i64
      %1485 = func.call @cc_nil_value() : () -> i64
      %1486 = func.call @cc_intern(%1484, %1485) : (i64, i64) -> i64
      %1487 = func.call @cc_nil_value() : () -> i64
      %1488 = func.call @cc_cons(%1486, %1487) : (i64, i64) -> i64
      %1489 = func.call @cc_values_pack(%1488) : (i64) -> i64
      func.call @stack_push_pointer(%1486) : (i64) -> ()
      %1490 = func.call @stack_pop_pointer() : () -> i64
      %1491 = func.call @stack_pop_pointer() : () -> i64
      %1492 = func.call @cc_cons(%1490, %1491) : (i64, i64) -> i64
      %1493 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1494 = arith.constant 5 : i64
      %1495 = func.call @cc_make_string(%1493, %1494) : (!llvm.ptr, i64) -> i64
      %1496 = func.call @cc_nil_value() : () -> i64
      %1497 = func.call @cc_intern(%1495, %1496) : (i64, i64) -> i64
      %1498 = func.call @cc_nil_value() : () -> i64
      %1499 = func.call @cc_cons(%1497, %1498) : (i64, i64) -> i64
      %1500 = func.call @cc_values_pack(%1499) : (i64) -> i64
      %1501 = func.call @cc_cons(%1497, %1492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1502 = func.call @stack_pop_pointer() : () -> i64
      %1503 = func.call @stack_pop_pointer() : () -> i64
      %1504 = func.call @cc_cons(%1503, %1502) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1504) : (i64) -> ()
      %1505 = func.call @stack_pop_pointer() : () -> i64
      %1506 = func.call @stack_pop_pointer() : () -> i64
      %1507 = func.call @cc_cons(%1506, %1505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1507) : (i64) -> ()
      %1508 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1508) : (i64) -> ()
      %1509 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1510 = arith.constant 7 : i64
      %1511 = func.call @cc_make_string(%1509, %1510) : (!llvm.ptr, i64) -> i64
      %1512 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1513 = arith.constant 11 : i64
      %1514 = func.call @cc_make_string(%1512, %1513) : (!llvm.ptr, i64) -> i64
      %1515 = func.call @cc_intern(%1511, %1514) : (i64, i64) -> i64
      %1516 = func.call @cc_nil_value() : () -> i64
      %1517 = func.call @cc_cons(%1515, %1516) : (i64, i64) -> i64
      %1518 = func.call @cc_values_pack(%1517) : (i64) -> i64
      func.call @stack_push_pointer(%1515) : (i64) -> ()
      %1519 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1520 = arith.constant 8 : i64
      %1521 = func.call @cc_make_string(%1519, %1520) : (!llvm.ptr, i64) -> i64
      %1522 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1523 = arith.constant 11 : i64
      %1524 = func.call @cc_make_string(%1522, %1523) : (!llvm.ptr, i64) -> i64
      %1525 = func.call @cc_intern(%1521, %1524) : (i64, i64) -> i64
      %1526 = func.call @cc_nil_value() : () -> i64
      %1527 = func.call @cc_cons(%1525, %1526) : (i64, i64) -> i64
      %1528 = func.call @cc_values_pack(%1527) : (i64) -> i64
      func.call @stack_push_pointer(%1525) : (i64) -> ()
      %1529 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1530 = arith.constant 8 : i64
      %1531 = func.call @cc_make_string(%1529, %1530) : (!llvm.ptr, i64) -> i64
      %1532 = func.call @cc_nil_value() : () -> i64
      %1533 = func.call @cc_intern(%1531, %1532) : (i64, i64) -> i64
      %1534 = func.call @cc_nil_value() : () -> i64
      %1535 = func.call @cc_cons(%1533, %1534) : (i64, i64) -> i64
      %1536 = func.call @cc_values_pack(%1535) : (i64) -> i64
      func.call @stack_push_pointer(%1533) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1537 = func.call @stack_pop_pointer() : () -> i64
      %1538 = func.call @stack_pop_pointer() : () -> i64
      %1539 = func.call @cc_cons(%1538, %1537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1539) : (i64) -> ()
      %1540 = func.call @stack_pop_pointer() : () -> i64
      %1541 = func.call @stack_pop_pointer() : () -> i64
      %1542 = func.call @cc_cons(%1541, %1540) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1542) : (i64) -> ()
      %1543 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1543) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1544 = func.call @stack_pop_pointer() : () -> i64
      %1545 = func.call @stack_pop_pointer() : () -> i64
      %1546 = func.call @cc_cons(%1545, %1544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1546) : (i64) -> ()
      %1547 = func.call @stack_pop_pointer() : () -> i64
      %1548 = func.call @stack_pop_pointer() : () -> i64
      %1549 = func.call @cc_cons(%1548, %1547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1549) : (i64) -> ()
      %1550 = func.call @stack_pop_pointer() : () -> i64
      %1551 = func.call @stack_pop_pointer() : () -> i64
      %1552 = func.call @cc_cons(%1551, %1550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1552) : (i64) -> ()
      %1553 = func.call @stack_pop_pointer() : () -> i64
      %1554 = func.call @stack_pop_pointer() : () -> i64
      %1555 = func.call @cc_cons(%1553, %1554) : (i64, i64) -> i64
      %1556 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1557 = arith.constant 5 : i64
      %1558 = func.call @cc_make_string(%1556, %1557) : (!llvm.ptr, i64) -> i64
      %1559 = func.call @cc_nil_value() : () -> i64
      %1560 = func.call @cc_intern(%1558, %1559) : (i64, i64) -> i64
      %1561 = func.call @cc_nil_value() : () -> i64
      %1562 = func.call @cc_cons(%1560, %1561) : (i64, i64) -> i64
      %1563 = func.call @cc_values_pack(%1562) : (i64) -> i64
      %1564 = func.call @cc_cons(%1560, %1555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1564) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1565 = func.call @stack_pop_pointer() : () -> i64
      %1566 = func.call @stack_pop_pointer() : () -> i64
      %1567 = func.call @cc_cons(%1566, %1565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1567) : (i64) -> ()
      %1568 = func.call @stack_pop_pointer() : () -> i64
      %1569 = func.call @stack_pop_pointer() : () -> i64
      %1570 = func.call @cc_cons(%1569, %1568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1570) : (i64) -> ()
      %1571 = func.call @stack_pop_pointer() : () -> i64
      %1572 = func.call @stack_pop_pointer() : () -> i64
      %1573 = func.call @cc_cons(%1572, %1571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1573) : (i64) -> ()
      %1574 = func.call @stack_pop_pointer() : () -> i64
      %1575 = func.call @stack_pop_pointer() : () -> i64
      %1576 = func.call @cc_cons(%1575, %1574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1576) : (i64) -> ()
      %1577 = func.call @stack_pop_pointer() : () -> i64
      %1649 = arith.constant 51151114338312 : i64
      %1650 = arith.constant 0 : i64
      %1651 = func.call @cc_make_closure(%1649, %1650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1651) : (i64) -> ()
      %1652 = func.call @stack_pop_pointer() : () -> i64
      %1653 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%1653) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1654 = func.call @stack_pop_pointer() : () -> i64
      %1655 = func.call @stack_pop_pointer() : () -> i64
      %1656 = func.call @cc_cons(%1655, %1654) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1656) : (i64) -> ()
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1659 = arith.constant 11 : i64
      %1660 = func.call @cc_make_string(%1658, %1659) : (!llvm.ptr, i64) -> i64
      %1661 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1662 = arith.constant 7 : i64
      %1663 = func.call @cc_make_string(%1661, %1662) : (!llvm.ptr, i64) -> i64
      %1664 = func.call @cc_intern(%1660, %1663) : (i64, i64) -> i64
      %1665 = func.call @cc_nil_value() : () -> i64
      %1666 = func.call @cc_cons(%1664, %1665) : (i64, i64) -> i64
      %1667 = func.call @cc_values_pack(%1666) : (i64) -> i64
      func.call @stack_push_pointer(%1664) : (i64) -> ()
      %1668 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1671 = arith.constant 4 : i64
      %1672 = func.call @cc_make_string(%1670, %1671) : (!llvm.ptr, i64) -> i64
      %1673 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1674 = arith.constant 7 : i64
      %1675 = func.call @cc_make_string(%1673, %1674) : (!llvm.ptr, i64) -> i64
      %1676 = func.call @cc_intern(%1672, %1675) : (i64, i64) -> i64
      %1677 = func.call @cc_nil_value() : () -> i64
      %1678 = func.call @cc_cons(%1676, %1677) : (i64, i64) -> i64
      %1679 = func.call @cc_values_pack(%1678) : (i64) -> i64
      func.call @stack_push_pointer(%1676) : (i64) -> ()
      %1680 = func.call @stack_pop_pointer() : () -> i64
      %1681 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1682 = arith.constant 6 : i64
      %1683 = func.call @cc_make_string(%1681, %1682) : (!llvm.ptr, i64) -> i64
      %1684 = func.call @cc_nil_value() : () -> i64
      %1685 = func.call @cc_intern(%1683, %1684) : (i64, i64) -> i64
      %1686 = func.call @cc_nil_value() : () -> i64
      %1687 = func.call @cc_cons(%1685, %1686) : (i64, i64) -> i64
      %1688 = func.call @cc_values_pack(%1687) : (i64) -> i64
      func.call @stack_push_pointer(%1685) : (i64) -> ()
      %1689 = func.call @stack_pop_pointer() : () -> i64
      %1690 = func.call @cc_nil_value() : () -> i64
      %1691 = func.call @cc_errorp(%1460) : (i64) -> i64
      %1692 = arith.cmpi ne, %1691, %1690 : i64
      %1693 = arith.cmpi eq, %1690, %1690 : i64
      %1694 = arith.andi %1692, %1693 : i1
      %1695 = scf.if %1694 -> (i64) {
        scf.yield %1460 : i64
      } else {
        scf.yield %1690 : i64
      }
      %1696 = func.call @cc_errorp(%1577) : (i64) -> i64
      %1697 = arith.cmpi ne, %1696, %1690 : i64
      %1698 = arith.cmpi eq, %1695, %1690 : i64
      %1699 = arith.andi %1697, %1698 : i1
      %1700 = scf.if %1699 -> (i64) {
        scf.yield %1577 : i64
      } else {
        scf.yield %1695 : i64
      }
      %1701 = func.call @cc_errorp(%1652) : (i64) -> i64
      %1702 = arith.cmpi ne, %1701, %1690 : i64
      %1703 = arith.cmpi eq, %1700, %1690 : i64
      %1704 = arith.andi %1702, %1703 : i1
      %1705 = scf.if %1704 -> (i64) {
        scf.yield %1652 : i64
      } else {
        scf.yield %1700 : i64
      }
      %1706 = func.call @cc_errorp(%1657) : (i64) -> i64
      %1707 = arith.cmpi ne, %1706, %1690 : i64
      %1708 = arith.cmpi eq, %1705, %1690 : i64
      %1709 = arith.andi %1707, %1708 : i1
      %1710 = scf.if %1709 -> (i64) {
        scf.yield %1657 : i64
      } else {
        scf.yield %1705 : i64
      }
      %1711 = func.call @cc_errorp(%1668) : (i64) -> i64
      %1712 = arith.cmpi ne, %1711, %1690 : i64
      %1713 = arith.cmpi eq, %1710, %1690 : i64
      %1714 = arith.andi %1712, %1713 : i1
      %1715 = scf.if %1714 -> (i64) {
        scf.yield %1668 : i64
      } else {
        scf.yield %1710 : i64
      }
      %1716 = func.call @cc_errorp(%1669) : (i64) -> i64
      %1717 = arith.cmpi ne, %1716, %1690 : i64
      %1718 = arith.cmpi eq, %1715, %1690 : i64
      %1719 = arith.andi %1717, %1718 : i1
      %1720 = scf.if %1719 -> (i64) {
        scf.yield %1669 : i64
      } else {
        scf.yield %1715 : i64
      }
      %1721 = func.call @cc_errorp(%1680) : (i64) -> i64
      %1722 = arith.cmpi ne, %1721, %1690 : i64
      %1723 = arith.cmpi eq, %1720, %1690 : i64
      %1724 = arith.andi %1722, %1723 : i1
      %1725 = scf.if %1724 -> (i64) {
        scf.yield %1680 : i64
      } else {
        scf.yield %1720 : i64
      }
      %1726 = func.call @cc_errorp(%1689) : (i64) -> i64
      %1727 = arith.cmpi ne, %1726, %1690 : i64
      %1728 = arith.cmpi eq, %1725, %1690 : i64
      %1729 = arith.andi %1727, %1728 : i1
      %1730 = scf.if %1729 -> (i64) {
        scf.yield %1689 : i64
      } else {
        scf.yield %1725 : i64
      }
      %1731 = arith.cmpi ne, %1730, %1690 : i64
      scf.if %1731 {
        func.call @stack_push_pointer(%1730) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1460) : (i64) -> ()
        func.call @stack_push_pointer(%1577) : (i64) -> ()
        func.call @stack_push_pointer(%1652) : (i64) -> ()
        func.call @stack_push_pointer(%1657) : (i64) -> ()
        func.call @stack_push_pointer(%1668) : (i64) -> ()
        func.call @stack_push_pointer(%1669) : (i64) -> ()
        func.call @stack_push_pointer(%1680) : (i64) -> ()
        func.call @stack_push_pointer(%1689) : (i64) -> ()
        %1732 = llvm.mlir.addressof @str144 : !llvm.ptr
        %1733 = func.call @cc_make_function_ref_const(%1732) : (!llvm.ptr) -> i64
        %1734 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1733, %1734) : (i64, i64) -> ()
      }
      %1735 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1735 : i64
    }
    func.call @stack_push_pointer(%1451) : (i64) -> ()
    %1736 = func.call @stack_pop_pointer() : () -> i64
    %1737 = func.call @cc_multiple_value_list(%1736) : (i64) -> i64
    %1738 = llvm.mlir.addressof @str145 : !llvm.ptr
    %1739 = arith.constant 37 : i64
    %1740 = func.call @cc_make_string(%1738, %1739) : (!llvm.ptr, i64) -> i64
    %1741 = func.call @cc_nil_value() : () -> i64
    %1742 = func.call @cc_intern(%1740, %1741) : (i64, i64) -> i64
    %1743 = func.call @cc_nil_value() : () -> i64
    %1744 = func.call @cc_cons(%1742, %1743) : (i64, i64) -> i64
    %1745 = func.call @cc_values_pack(%1744) : (i64) -> i64
    %1746 = func.call @cc_symbol_value(%1742) : (i64) -> i64
    %1747 = llvm.mlir.addressof @str146 : !llvm.ptr
    %1748 = arith.constant 39 : i64
    %1749 = func.call @cc_make_string(%1747, %1748) : (!llvm.ptr, i64) -> i64
    %1750 = func.call @cc_nil_value() : () -> i64
    %1751 = func.call @cc_intern(%1749, %1750) : (i64, i64) -> i64
    %1752 = func.call @cc_nil_value() : () -> i64
    %1753 = func.call @cc_cons(%1751, %1752) : (i64, i64) -> i64
    %1754 = func.call @cc_values_pack(%1753) : (i64) -> i64
    %1755 = func.call @cc_symbol_value(%1751) : (i64) -> i64
    %1756 = func.call @cc_nil_value() : () -> i64
    %1757 = arith.cmpi ne, %1746, %1756 : i64
    %1758 = scf.if %1757 -> (i64) {
      scf.yield %1755 : i64
    } else {
      scf.yield %1737 : i64
    }
    %1759 = func.call @cc_values_pack(%1758) : (i64) -> i64
    func.call @stack_push_pointer(%1759) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_51151114338307"() {
    %292 = func.call @cc_nil_value() : () -> i64
    %293 = func.call @cc_nil_value() : () -> i64
    %294 = func.call @cc_errorp(%292) : (i64) -> i64
    %295 = arith.cmpi ne, %294, %293 : i64
    %296 = scf.if %295 -> (i64) {
      scf.yield %292 : i64
    } else {
      %297 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = func.call @cc_nil_value() : () -> i64
      %300 = func.call @cc_errorp(%298) : (i64) -> i64
      %301 = arith.cmpi ne, %300, %299 : i64
      %302 = scf.if %301 -> (i64) {
        scf.yield %298 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %303 = func.call @stack_pop_pointer() : () -> i64
        %304 = func.call @cc_nil_value() : () -> i64
        %305 = func.call @cc_errorp(%303) : (i64) -> i64
        %306 = arith.cmpi ne, %305, %304 : i64
        %307 = arith.cmpi eq, %304, %304 : i64
        %308 = arith.andi %306, %307 : i1
        %309 = scf.if %308 -> (i64) {
          scf.yield %303 : i64
        } else {
          scf.yield %304 : i64
        }
        %310 = arith.cmpi ne, %309, %304 : i64
        scf.if %310 {
          func.call @stack_push_pointer(%309) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%303) : (i64) -> ()
          %311 = llvm.mlir.addressof @str25 : !llvm.ptr
          %312 = func.call @cc_make_function_ref_const(%311) : (!llvm.ptr) -> i64
          %313 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%312, %313) : (i64, i64) -> ()
        }
        %314 = func.call @stack_pop_pointer() : () -> i64
        %315 = func.call @cc_errorp(%314) : (i64) -> i64
        %316 = func.call @cc_nil_value() : () -> i64
        %317 = arith.cmpi ne, %315, %316 : i64
        scf.if %317 {
          func.call @stack_push_pointer(%314) : (i64) -> ()
        } else {
          %318 = func.call @cc_multiple_value_list(%314) : (i64) -> i64
          func.call @stack_push_pointer(%318) : (i64) -> ()
        }
        %319 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %320 = func.call @stack_pop_pointer() : () -> i64
        %321 = func.call @cc_nil_value() : () -> i64
        %322 = func.call @cc_maybe_error_from_multiple_value_list(%319) : (i64) -> i64
        %323 = func.call @cc_errorp(%322) : (i64) -> i64
        %324 = arith.cmpi ne, %323, %321 : i64
        %325 = arith.cmpi eq, %321, %321 : i64
        %326 = arith.andi %324, %325 : i1
        %327 = scf.if %326 -> (i64) {
          scf.yield %322 : i64
        } else {
          scf.yield %321 : i64
        }
        %328 = arith.cmpi ne, %327, %321 : i64
        scf.if %328 {
          func.call @stack_push_pointer(%327) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %329 = func.call @stack_pop_pointer() : () -> i64
          %330 = func.call @cc_cons(%320, %329) : (i64, i64) -> i64
          func.call @stack_push_pointer(%330) : (i64) -> ()
          %331 = func.call @stack_pop_pointer() : () -> i64
          %332 = func.call @cc_cons(%319, %331) : (i64, i64) -> i64
          func.call @stack_push_pointer(%332) : (i64) -> ()
          %333 = func.call @stack_pop_pointer() : () -> i64
          %334 = func.call @cc_values_pack(%333) : (i64) -> i64
          func.call @stack_push_pointer(%334) : (i64) -> ()
        }
        %335 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %335 : i64
      }
      func.call @stack_push_pointer(%302) : (i64) -> ()
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %338 = func.call @cc_errorp(%336) : (i64) -> i64
      %339 = func.call @cc_nil_value() : () -> i64
      %340 = arith.cmpi ne, %338, %339 : i64
      scf.if %340 {
        %341 = func.call @cc_condition_value(%336) : (i64) -> i64
        %342 = func.call @cc_values2(%339, %341) : (i64, i64) -> i64
        func.call @stack_push_pointer(%342) : (i64) -> ()
      } else {
        %343 = func.call @cc_multiple_value_list(%336) : (i64) -> i64
        %344 = func.call @cc_values_pack(%343) : (i64) -> i64
        func.call @stack_push_pointer(%344) : (i64) -> ()
      }
      %345 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %345 : i64
    }
    func.call @stack_push_pointer(%296) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338308"() {
    %532 = func.call @cc_nil_value() : () -> i64
    %533 = func.call @cc_nil_value() : () -> i64
    %534 = func.call @cc_errorp(%532) : (i64) -> i64
    %535 = arith.cmpi ne, %534, %533 : i64
    %536 = scf.if %535 -> (i64) {
      scf.yield %532 : i64
    } else {
      %537 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %538 = func.call @cc_nil_value() : () -> i64
      %539 = func.call @cc_nil_value() : () -> i64
      %540 = func.call @cc_errorp(%538) : (i64) -> i64
      %541 = arith.cmpi ne, %540, %539 : i64
      %542 = scf.if %541 -> (i64) {
        scf.yield %538 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %543 = arith.constant 32 : i64
        %544 = func.call @cc_box_character(%543) : (i64) -> i64
        func.call @stack_push_pointer(%544) : (i64) -> ()
        %545 = func.call @stack_pop_pointer() : () -> i64
        %546 = func.call @cc_nil_value() : () -> i64
        %547 = func.call @cc_errorp(%545) : (i64) -> i64
        %548 = arith.cmpi ne, %547, %546 : i64
        %549 = arith.cmpi eq, %546, %546 : i64
        %550 = arith.andi %548, %549 : i1
        %551 = scf.if %550 -> (i64) {
          scf.yield %545 : i64
        } else {
          scf.yield %546 : i64
        }
        %552 = arith.cmpi ne, %551, %546 : i64
        scf.if %552 {
          func.call @stack_push_pointer(%551) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%545) : (i64) -> ()
          %553 = llvm.mlir.addressof @str42 : !llvm.ptr
          %554 = func.call @cc_make_function_ref_const(%553) : (!llvm.ptr) -> i64
          %555 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%554, %555) : (i64, i64) -> ()
        }
        %556 = func.call @stack_pop_pointer() : () -> i64
        %557 = func.call @cc_errorp(%556) : (i64) -> i64
        %558 = func.call @cc_nil_value() : () -> i64
        %559 = arith.cmpi ne, %557, %558 : i64
        scf.if %559 {
          func.call @stack_push_pointer(%556) : (i64) -> ()
        } else {
          %560 = func.call @cc_multiple_value_list(%556) : (i64) -> i64
          func.call @stack_push_pointer(%560) : (i64) -> ()
        }
        %561 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %562 = func.call @stack_pop_pointer() : () -> i64
        %563 = func.call @cc_nil_value() : () -> i64
        %564 = func.call @cc_maybe_error_from_multiple_value_list(%561) : (i64) -> i64
        %565 = func.call @cc_errorp(%564) : (i64) -> i64
        %566 = arith.cmpi ne, %565, %563 : i64
        %567 = arith.cmpi eq, %563, %563 : i64
        %568 = arith.andi %566, %567 : i1
        %569 = scf.if %568 -> (i64) {
          scf.yield %564 : i64
        } else {
          scf.yield %563 : i64
        }
        %570 = arith.cmpi ne, %569, %563 : i64
        scf.if %570 {
          func.call @stack_push_pointer(%569) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %571 = func.call @stack_pop_pointer() : () -> i64
          %572 = func.call @cc_cons(%562, %571) : (i64, i64) -> i64
          func.call @stack_push_pointer(%572) : (i64) -> ()
          %573 = func.call @stack_pop_pointer() : () -> i64
          %574 = func.call @cc_cons(%561, %573) : (i64, i64) -> i64
          func.call @stack_push_pointer(%574) : (i64) -> ()
          %575 = func.call @stack_pop_pointer() : () -> i64
          %576 = func.call @cc_values_pack(%575) : (i64) -> i64
          func.call @stack_push_pointer(%576) : (i64) -> ()
        }
        %577 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %577 : i64
      }
      func.call @stack_push_pointer(%542) : (i64) -> ()
      %578 = func.call @stack_pop_pointer() : () -> i64
      %579 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %580 = func.call @cc_errorp(%578) : (i64) -> i64
      %581 = func.call @cc_nil_value() : () -> i64
      %582 = arith.cmpi ne, %580, %581 : i64
      scf.if %582 {
        %583 = func.call @cc_condition_value(%578) : (i64) -> i64
        %584 = func.call @cc_values2(%581, %583) : (i64, i64) -> i64
        func.call @stack_push_pointer(%584) : (i64) -> ()
      } else {
        %585 = func.call @cc_multiple_value_list(%578) : (i64) -> i64
        %586 = func.call @cc_values_pack(%585) : (i64) -> i64
        func.call @stack_push_pointer(%586) : (i64) -> ()
      }
      %587 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %587 : i64
    }
    func.call @stack_push_pointer(%536) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338309"() {
    %773 = func.call @cc_nil_value() : () -> i64
    %774 = func.call @cc_nil_value() : () -> i64
    %775 = func.call @cc_errorp(%773) : (i64) -> i64
    %776 = arith.cmpi ne, %775, %774 : i64
    %777 = scf.if %776 -> (i64) {
      scf.yield %773 : i64
    } else {
      %778 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %779 = func.call @cc_nil_value() : () -> i64
      %780 = func.call @cc_nil_value() : () -> i64
      %781 = func.call @cc_errorp(%779) : (i64) -> i64
      %782 = arith.cmpi ne, %781, %780 : i64
      %783 = scf.if %782 -> (i64) {
        scf.yield %779 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %784 = arith.constant -1 : i64
        func.call @stack_push_fixnum(%784) : (i64) -> ()
        %785 = func.call @stack_pop_pointer() : () -> i64
        %786 = func.call @cc_nil_value() : () -> i64
        %787 = func.call @cc_errorp(%785) : (i64) -> i64
        %788 = arith.cmpi ne, %787, %786 : i64
        %789 = arith.cmpi eq, %786, %786 : i64
        %790 = arith.andi %788, %789 : i1
        %791 = scf.if %790 -> (i64) {
          scf.yield %785 : i64
        } else {
          scf.yield %786 : i64
        }
        %792 = arith.cmpi ne, %791, %786 : i64
        scf.if %792 {
          func.call @stack_push_pointer(%791) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%785) : (i64) -> ()
          %793 = llvm.mlir.addressof @str59 : !llvm.ptr
          %794 = func.call @cc_make_function_ref_const(%793) : (!llvm.ptr) -> i64
          %795 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%794, %795) : (i64, i64) -> ()
        }
        %796 = func.call @stack_pop_pointer() : () -> i64
        %797 = func.call @cc_errorp(%796) : (i64) -> i64
        %798 = func.call @cc_nil_value() : () -> i64
        %799 = arith.cmpi ne, %797, %798 : i64
        scf.if %799 {
          func.call @stack_push_pointer(%796) : (i64) -> ()
        } else {
          %800 = func.call @cc_multiple_value_list(%796) : (i64) -> i64
          func.call @stack_push_pointer(%800) : (i64) -> ()
        }
        %801 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %802 = func.call @stack_pop_pointer() : () -> i64
        %803 = func.call @cc_nil_value() : () -> i64
        %804 = func.call @cc_maybe_error_from_multiple_value_list(%801) : (i64) -> i64
        %805 = func.call @cc_errorp(%804) : (i64) -> i64
        %806 = arith.cmpi ne, %805, %803 : i64
        %807 = arith.cmpi eq, %803, %803 : i64
        %808 = arith.andi %806, %807 : i1
        %809 = scf.if %808 -> (i64) {
          scf.yield %804 : i64
        } else {
          scf.yield %803 : i64
        }
        %810 = arith.cmpi ne, %809, %803 : i64
        scf.if %810 {
          func.call @stack_push_pointer(%809) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %811 = func.call @stack_pop_pointer() : () -> i64
          %812 = func.call @cc_cons(%802, %811) : (i64, i64) -> i64
          func.call @stack_push_pointer(%812) : (i64) -> ()
          %813 = func.call @stack_pop_pointer() : () -> i64
          %814 = func.call @cc_cons(%801, %813) : (i64, i64) -> i64
          func.call @stack_push_pointer(%814) : (i64) -> ()
          %815 = func.call @stack_pop_pointer() : () -> i64
          %816 = func.call @cc_values_pack(%815) : (i64) -> i64
          func.call @stack_push_pointer(%816) : (i64) -> ()
        }
        %817 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %817 : i64
      }
      func.call @stack_push_pointer(%783) : (i64) -> ()
      %818 = func.call @stack_pop_pointer() : () -> i64
      %819 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %820 = func.call @cc_errorp(%818) : (i64) -> i64
      %821 = func.call @cc_nil_value() : () -> i64
      %822 = arith.cmpi ne, %820, %821 : i64
      scf.if %822 {
        %823 = func.call @cc_condition_value(%818) : (i64) -> i64
        %824 = func.call @cc_values2(%821, %823) : (i64, i64) -> i64
        func.call @stack_push_pointer(%824) : (i64) -> ()
      } else {
        %825 = func.call @cc_multiple_value_list(%818) : (i64) -> i64
        %826 = func.call @cc_values_pack(%825) : (i64) -> i64
        func.call @stack_push_pointer(%826) : (i64) -> ()
      }
      %827 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %827 : i64
    }
    func.call @stack_push_pointer(%777) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338310"() {
    %1023 = func.call @stack_pop_pointer() : () -> i64
    %1024 = func.call @stack_pop_pointer() : () -> i64
    %1025 = func.call @cc_nil_value() : () -> i64
    %1026 = func.call @cc_nil_value() : () -> i64
    %1027 = func.call @cc_errorp(%1025) : (i64) -> i64
    %1028 = arith.cmpi ne, %1027, %1026 : i64
    %1029 = scf.if %1028 -> (i64) {
      scf.yield %1025 : i64
    } else {
      func.call @stack_push_pointer(%1024) : (i64) -> ()
      %1030 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1024) : (i64) -> ()
      %1031 = func.call @stack_pop_pointer() : () -> i64
      %1032 = func.call @cc_cdr(%1031) : (i64) -> i64
      %1033 = func.call @cc_cdr(%1032) : (i64) -> i64
      %1034 = func.call @cc_car(%1033) : (i64) -> i64
      func.call @stack_push_pointer(%1034) : (i64) -> ()
      %1035 = func.call @stack_pop_pointer() : () -> i64
      %1036 = func.call @cc_nil_value() : () -> i64
      %1037 = func.call @cc_nil_value() : () -> i64
      %1038 = func.call @cc_errorp(%1036) : (i64) -> i64
      %1039 = arith.cmpi ne, %1038, %1037 : i64
      %1040 = scf.if %1039 -> (i64) {
        scf.yield %1036 : i64
      } else {
        func.call @stack_push_pointer(%1035) : (i64) -> ()
        %1041 = func.call @stack_pop_pointer() : () -> i64
        %1042 = func.call @cc_nil_value() : () -> i64
        %1043 = func.call @cc_errorp(%1041) : (i64) -> i64
        %1044 = arith.cmpi ne, %1043, %1042 : i64
        %1045 = arith.cmpi eq, %1042, %1042 : i64
        %1046 = arith.andi %1044, %1045 : i1
        %1047 = scf.if %1046 -> (i64) {
          scf.yield %1041 : i64
        } else {
          scf.yield %1042 : i64
        }
        %1048 = arith.cmpi ne, %1047, %1042 : i64
        scf.if %1048 {
          func.call @stack_push_pointer(%1047) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1041) : (i64) -> ()
          %1049 = llvm.mlir.addressof @str82 : !llvm.ptr
          %1050 = func.call @cc_make_function_ref_const(%1049) : (!llvm.ptr) -> i64
          %1051 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1050, %1051) : (i64, i64) -> ()
        }
        %1052 = func.call @stack_pop_pointer() : () -> i64
        %1053 = func.call @cc_nil_value() : () -> i64
        %1054 = arith.cmpi ne, %1052, %1053 : i64
        scf.if %1054 {
          func.call @stack_push_pointer(%1035) : (i64) -> ()
          %1055 = func.call @stack_pop_pointer() : () -> i64
          %1056 = arith.constant 2 : i64
          func.call @stack_push_fixnum(%1056) : (i64) -> ()
          %1057 = func.call @stack_pop_pointer() : () -> i64
          %1059 = arith.constant 3 : i64
          %1058 = arith.andi %1055, %1059 : i64
          %1060 = arith.constant 0 : i64
          %1061 = arith.cmpi eq, %1058, %1060 : i64
          %1063 = arith.constant 3 : i64
          %1062 = arith.andi %1057, %1063 : i64
          %1064 = arith.constant 0 : i64
          %1065 = arith.cmpi eq, %1062, %1064 : i64
          %1066 = arith.andi %1061, %1065 : i1
          %1067 = scf.if %1066 -> (i64) {
            %1068 = arith.constant 2 : i64
            %1069 = arith.shrsi %1055, %1068 : i64
            %1070 = arith.constant 2 : i64
            %1071 = arith.shrsi %1057, %1070 : i64
            %1072 = arith.constant 0 : i64
            %1073 = arith.cmpi slt, %1069, %1072 : i64
            %1074 = scf.if %1073 -> (i64) {
              %1075 = arith.subi %1072, %1069 : i64
              scf.yield %1075 : i64
            } else {
              scf.yield %1069 : i64
            }
            %1076 = arith.constant 0 : i64
            %1077 = arith.cmpi slt, %1071, %1076 : i64
            %1078 = scf.if %1077 -> (i64) {
              %1079 = arith.subi %1076, %1071 : i64
              scf.yield %1079 : i64
            } else {
              scf.yield %1071 : i64
            }
            %1080 = arith.constant 1518500249 : i64
            %1081 = arith.cmpi sle, %1074, %1080 : i64
            %1082 = arith.cmpi sle, %1078, %1080 : i64
            %1083 = arith.andi %1081, %1082 : i1
            %1084 = scf.if %1083 -> (i64) {
              %1085 = arith.muli %1069, %1071 : i64
              %1086 = arith.constant 2 : i64
              %1087 = arith.shli %1085, %1086 : i64
              scf.yield %1087 : i64
            } else {
              %1088 = func.call @cc_mul(%1055, %1057) : (i64, i64) -> i64
              scf.yield %1088 : i64
            }
            scf.yield %1084 : i64
          } else {
            %1089 = func.call @cc_mul(%1055, %1057) : (i64, i64) -> i64
            scf.yield %1089 : i64
          }
          func.call @stack_push_pointer(%1067) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1030) : (i64) -> ()
        }
        %1090 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1090 : i64
      }
      func.call @stack_push_pointer(%1040) : (i64) -> ()
      %1091 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1091 : i64
    }
    func.call @stack_push_pointer(%1029) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338311"() {
    %1280 = func.call @cc_nil_value() : () -> i64
    %1281 = func.call @cc_nil_value() : () -> i64
    %1282 = func.call @cc_errorp(%1280) : (i64) -> i64
    %1283 = arith.cmpi ne, %1282, %1281 : i64
    %1284 = scf.if %1283 -> (i64) {
      scf.yield %1280 : i64
    } else {
      %1285 = func.call @cc_nil_value() : () -> i64
      %1286 = func.call @cc_nil_value() : () -> i64
      %1287 = func.call @cc_errorp(%1285) : (i64) -> i64
      %1288 = arith.cmpi ne, %1287, %1286 : i64
      %1289 = scf.if %1288 -> (i64) {
        scf.yield %1285 : i64
      } else {
        %1290 = llvm.mlir.addressof @str103 : !llvm.ptr
        %1291 = arith.constant 8 : i64
        %1292 = func.call @cc_make_string(%1290, %1291) : (!llvm.ptr, i64) -> i64
        %1293 = func.call @cc_nil_value() : () -> i64
        %1294 = func.call @cc_intern(%1292, %1293) : (i64, i64) -> i64
        %1295 = func.call @cc_nil_value() : () -> i64
        %1296 = func.call @cc_cons(%1294, %1295) : (i64, i64) -> i64
        %1297 = func.call @cc_values_pack(%1296) : (i64) -> i64
        func.call @stack_push_pointer(%1294) : (i64) -> ()
        %1298 = llvm.mlir.addressof @str104 : !llvm.ptr
        %1299 = arith.constant 14 : i64
        %1300 = func.call @cc_make_string(%1298, %1299) : (!llvm.ptr, i64) -> i64
        %1301 = llvm.mlir.addressof @str105 : !llvm.ptr
        %1302 = arith.constant 11 : i64
        %1303 = func.call @cc_make_string(%1301, %1302) : (!llvm.ptr, i64) -> i64
        %1304 = func.call @cc_intern(%1300, %1303) : (i64, i64) -> i64
        %1305 = func.call @cc_nil_value() : () -> i64
        %1306 = func.call @cc_cons(%1304, %1305) : (i64, i64) -> i64
        %1307 = func.call @cc_values_pack(%1306) : (i64) -> i64
        func.call @stack_push_pointer(%1304) : (i64) -> ()
        %1308 = llvm.mlir.addressof @str106 : !llvm.ptr
        %1309 = arith.constant 3 : i64
        %1310 = func.call @cc_make_string(%1308, %1309) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1310) : (i64) -> ()
        %1311 = func.call @stack_pop_pointer() : () -> i64
        %1312 = func.call @stack_pop_pointer() : () -> i64
        %1313 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1311) : (i64) -> ()
        func.call @stack_push_pointer(%1313) : (i64) -> ()
        func.call @stack_push_pointer(%1312) : (i64) -> ()
        %1314 = llvm.mlir.addressof @str107 : !llvm.ptr
        %1315 = func.call @cc_make_function_ref_const(%1314) : (!llvm.ptr) -> i64
        %1316 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1315, %1316) : (i64, i64) -> ()
        %1317 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1317 : i64
      }
      %1318 = func.call @cc_nil_value() : () -> i64
      %1319 = func.call @cc_errorp(%1289) : (i64) -> i64
      %1320 = arith.cmpi ne, %1319, %1318 : i64
      %1321 = scf.if %1320 -> (i64) {
        scf.yield %1289 : i64
      } else {
        %1322 = llvm.mlir.addressof @str108 : !llvm.ptr
        %1323 = arith.constant 8 : i64
        %1324 = func.call @cc_make_string(%1322, %1323) : (!llvm.ptr, i64) -> i64
        %1325 = func.call @cc_nil_value() : () -> i64
        %1326 = func.call @cc_intern(%1324, %1325) : (i64, i64) -> i64
        %1327 = func.call @cc_nil_value() : () -> i64
        %1328 = func.call @cc_cons(%1326, %1327) : (i64, i64) -> i64
        %1329 = func.call @cc_values_pack(%1328) : (i64) -> i64
        func.call @stack_push_pointer(%1326) : (i64) -> ()
        %1330 = func.call @stack_pop_pointer() : () -> i64
        %1331 = llvm.mlir.addressof @str109 : !llvm.ptr
        %1332 = arith.constant 14 : i64
        %1333 = func.call @cc_make_string(%1331, %1332) : (!llvm.ptr, i64) -> i64
        %1334 = llvm.mlir.addressof @str110 : !llvm.ptr
        %1335 = arith.constant 11 : i64
        %1336 = func.call @cc_make_string(%1334, %1335) : (!llvm.ptr, i64) -> i64
        %1337 = func.call @cc_intern(%1333, %1336) : (i64, i64) -> i64
        %1338 = func.call @cc_nil_value() : () -> i64
        %1339 = func.call @cc_cons(%1337, %1338) : (i64, i64) -> i64
        %1340 = func.call @cc_values_pack(%1339) : (i64) -> i64
        func.call @stack_push_pointer(%1337) : (i64) -> ()
        %1341 = func.call @stack_pop_pointer() : () -> i64
        %1342 = func.call @cc_nil_value() : () -> i64
        %1343 = func.call @cc_errorp(%1330) : (i64) -> i64
        %1344 = arith.cmpi ne, %1343, %1342 : i64
        %1345 = arith.cmpi eq, %1342, %1342 : i64
        %1346 = arith.andi %1344, %1345 : i1
        %1347 = scf.if %1346 -> (i64) {
          scf.yield %1330 : i64
        } else {
          scf.yield %1342 : i64
        }
        %1348 = func.call @cc_errorp(%1341) : (i64) -> i64
        %1349 = arith.cmpi ne, %1348, %1342 : i64
        %1350 = arith.cmpi eq, %1347, %1342 : i64
        %1351 = arith.andi %1349, %1350 : i1
        %1352 = scf.if %1351 -> (i64) {
          scf.yield %1341 : i64
        } else {
          scf.yield %1347 : i64
        }
        %1353 = arith.cmpi ne, %1352, %1342 : i64
        scf.if %1353 {
          func.call @stack_push_pointer(%1352) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1330) : (i64) -> ()
          func.call @stack_push_pointer(%1341) : (i64) -> ()
          %1354 = llvm.mlir.addressof @str111 : !llvm.ptr
          %1355 = func.call @cc_make_function_ref_const(%1354) : (!llvm.ptr) -> i64
          %1356 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1355, %1356) : (i64, i64) -> ()
        }
        %1357 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1357 : i64
      }
      func.call @stack_push_pointer(%1321) : (i64) -> ()
      %1358 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1358 : i64
    }
    func.call @stack_push_pointer(%1284) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338312"() {
    %1578 = func.call @cc_nil_value() : () -> i64
    %1579 = func.call @cc_nil_value() : () -> i64
    %1580 = func.call @cc_errorp(%1578) : (i64) -> i64
    %1581 = arith.cmpi ne, %1580, %1579 : i64
    %1582 = scf.if %1581 -> (i64) {
      scf.yield %1578 : i64
    } else {
      %1583 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1584 = arith.constant 7 : i64
      %1585 = func.call @cc_make_string(%1583, %1584) : (!llvm.ptr, i64) -> i64
      %1586 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1587 = arith.constant 11 : i64
      %1588 = func.call @cc_make_string(%1586, %1587) : (!llvm.ptr, i64) -> i64
      %1589 = func.call @cc_intern(%1585, %1588) : (i64, i64) -> i64
      %1590 = func.call @cc_nil_value() : () -> i64
      %1591 = func.call @cc_cons(%1589, %1590) : (i64, i64) -> i64
      %1592 = func.call @cc_values_pack(%1591) : (i64) -> i64
      func.call @stack_push_pointer(%1589) : (i64) -> ()
      %1593 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1594 = arith.constant 8 : i64
      %1595 = func.call @cc_make_string(%1593, %1594) : (!llvm.ptr, i64) -> i64
      %1596 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1597 = arith.constant 11 : i64
      %1598 = func.call @cc_make_string(%1596, %1597) : (!llvm.ptr, i64) -> i64
      %1599 = func.call @cc_intern(%1595, %1598) : (i64, i64) -> i64
      %1600 = func.call @cc_nil_value() : () -> i64
      %1601 = func.call @cc_cons(%1599, %1600) : (i64, i64) -> i64
      %1602 = func.call @cc_values_pack(%1601) : (i64) -> i64
      func.call @stack_push_pointer(%1599) : (i64) -> ()
      %1603 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1604 = arith.constant 8 : i64
      %1605 = func.call @cc_make_string(%1603, %1604) : (!llvm.ptr, i64) -> i64
      %1606 = func.call @cc_nil_value() : () -> i64
      %1607 = func.call @cc_intern(%1605, %1606) : (i64, i64) -> i64
      %1608 = func.call @cc_nil_value() : () -> i64
      %1609 = func.call @cc_cons(%1607, %1608) : (i64, i64) -> i64
      %1610 = func.call @cc_values_pack(%1609) : (i64) -> i64
      func.call @stack_push_pointer(%1607) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1611 = func.call @stack_pop_pointer() : () -> i64
      %1612 = func.call @stack_pop_pointer() : () -> i64
      %1613 = func.call @cc_cons(%1612, %1611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1613) : (i64) -> ()
      %1614 = func.call @stack_pop_pointer() : () -> i64
      %1615 = func.call @stack_pop_pointer() : () -> i64
      %1616 = func.call @cc_cons(%1615, %1614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1616) : (i64) -> ()
      %1617 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1618 = func.call @stack_pop_pointer() : () -> i64
      %1619 = func.call @stack_pop_pointer() : () -> i64
      %1620 = func.call @cc_cons(%1619, %1618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1620) : (i64) -> ()
      %1621 = func.call @stack_pop_pointer() : () -> i64
      %1622 = func.call @stack_pop_pointer() : () -> i64
      %1623 = func.call @cc_cons(%1622, %1621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1623) : (i64) -> ()
      %1624 = func.call @stack_pop_pointer() : () -> i64
      %1625 = func.call @stack_pop_pointer() : () -> i64
      %1626 = func.call @cc_cons(%1625, %1624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1626) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1627 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1628 = arith.constant 8 : i64
      %1629 = func.call @cc_make_string(%1627, %1628) : (!llvm.ptr, i64) -> i64
      %1630 = func.call @cc_nil_value() : () -> i64
      %1631 = func.call @cc_intern(%1629, %1630) : (i64, i64) -> i64
      %1632 = func.call @cc_nil_value() : () -> i64
      %1633 = func.call @cc_cons(%1631, %1632) : (i64, i64) -> i64
      %1634 = func.call @cc_values_pack(%1633) : (i64) -> i64
      func.call @stack_push_pointer(%1631) : (i64) -> ()
      %1635 = func.call @stack_pop_pointer() : () -> i64
      %1636 = func.call @cc_nil_value() : () -> i64
      %1637 = func.call @cc_errorp(%1635) : (i64) -> i64
      %1638 = arith.cmpi ne, %1637, %1636 : i64
      %1639 = arith.cmpi eq, %1636, %1636 : i64
      %1640 = arith.andi %1638, %1639 : i1
      %1641 = scf.if %1640 -> (i64) {
        scf.yield %1635 : i64
      } else {
        scf.yield %1636 : i64
      }
      %1642 = arith.cmpi ne, %1641, %1636 : i64
      scf.if %1642 {
        func.call @stack_push_pointer(%1641) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1635) : (i64) -> ()
        %1643 = llvm.mlir.addressof @str138 : !llvm.ptr
        %1644 = func.call @cc_make_function_ref_const(%1643) : (!llvm.ptr) -> i64
        %1645 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1644, %1645) : (i64, i64) -> ()
      }
      %1646 = func.call @stack_pop_pointer() : () -> i64
      %1647 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%1646, %1647) : (i64, i64) -> ()
      %1648 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1648 : i64
    }
    func.call @stack_push_pointer(%1582) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_51151114338304*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_51151114338304*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_51151114338304*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_51151114338305*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_51151114338305*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_51151114338305*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETFLAG_51151114338305*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETVALUE_51151114338305*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETMVLIST_51151114338305*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETFLAG_51151114338304*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_51151114338304*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str13("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETFLAG_51151114338306*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETVALUE_51151114338306*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETMVLIST_51151114338306*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str17("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("SLEEP-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str20("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str23("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str26("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str27("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str32("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str33("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str34("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str35("SLEEP-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str37("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str38("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str39("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str40("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str43("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str44("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str45("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str46("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str48("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str51("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str52("SLEEP-3\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str53("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str54("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str56("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str57("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str60("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str61("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str64("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str65("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str66("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str67("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str68("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str69("%FN%%%test%%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str70("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str71("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str72("%FN%%%test%%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str73("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str74("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str75("%FN%%%test%%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str76("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str77("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str78("%FN%%%test%%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str79("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str80("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str81("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str82("CONSTANTP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str83("%FN%(setf compiler-macro-function)\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str84("DOCUMENTATION.LIST.COMPILER-MACRO.2\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str85("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str86("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("DOCUMENTATION\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str91("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str92("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str93("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str95("Buh\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str96("DOCUMENTATION\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str97("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str99("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str100("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str103("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str104("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("Buh\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str107("%FN%(setf COMMON-LISP::DOCUMENTATION)\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str108("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str109("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str110("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("DOCUMENTATION\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str112("Buh\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str113("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str115("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str118("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str119("FUNCALL-COMPILER-MACRO\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str120("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str122("COMPILER-MACRO-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str125("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str126("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str129("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str131("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str132("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str133("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str137("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str138("COMPILER-MACRO-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str139("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str142("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str143("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str144("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str145("*__MLIR_BLOCK_RETFLAG_51151114338306*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str146("*__MLIR_BLOCK_RETMVLIST_51151114338306*\00") : !llvm.array<40 x i8>
}
