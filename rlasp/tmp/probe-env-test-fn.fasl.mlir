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
  func.func @"%FN%foo-test-describe"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 17 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 5 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = arith.constant 3 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %12) : (i64, i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @stack_pop_pointer() : () -> i64
    %15 = func.call @stack_pop_pointer() : () -> i64
    %16 = func.call @cc_nil_value() : () -> i64
    %17 = llvm.mlir.addressof @str2 : !llvm.ptr
    %18 = arith.constant 38 : i64
    %19 = func.call @cc_make_string(%17, %18) : (!llvm.ptr, i64) -> i64
    %20 = func.call @cc_nil_value() : () -> i64
    %21 = func.call @cc_intern(%19, %20) : (i64, i64) -> i64
    %22 = func.call @cc_nil_value() : () -> i64
    %23 = func.call @cc_cons(%21, %22) : (i64, i64) -> i64
    %24 = func.call @cc_values_pack(%23) : (i64) -> i64
    %25 = func.call @cc_set_symbol_value(%21, %16) : (i64, i64) -> i64
    %26 = llvm.mlir.addressof @str3 : !llvm.ptr
    %27 = arith.constant 39 : i64
    %28 = func.call @cc_make_string(%26, %27) : (!llvm.ptr, i64) -> i64
    %29 = func.call @cc_nil_value() : () -> i64
    %30 = func.call @cc_intern(%28, %29) : (i64, i64) -> i64
    %31 = func.call @cc_nil_value() : () -> i64
    %32 = func.call @cc_cons(%30, %31) : (i64, i64) -> i64
    %33 = func.call @cc_values_pack(%32) : (i64) -> i64
    %34 = func.call @cc_set_symbol_value(%30, %16) : (i64, i64) -> i64
    %35 = llvm.mlir.addressof @str4 : !llvm.ptr
    %36 = arith.constant 40 : i64
    %37 = func.call @cc_make_string(%35, %36) : (!llvm.ptr, i64) -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_intern(%37, %38) : (i64, i64) -> i64
    %40 = func.call @cc_nil_value() : () -> i64
    %41 = func.call @cc_cons(%39, %40) : (i64, i64) -> i64
    %42 = func.call @cc_values_pack(%41) : (i64) -> i64
    %43 = func.call @cc_set_symbol_value(%39, %16) : (i64, i64) -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = llvm.mlir.addressof @str5 : !llvm.ptr
    %46 = arith.constant 38 : i64
    %47 = func.call @cc_make_string(%45, %46) : (!llvm.ptr, i64) -> i64
    %48 = func.call @cc_nil_value() : () -> i64
    %49 = func.call @cc_intern(%47, %48) : (i64, i64) -> i64
    %50 = func.call @cc_nil_value() : () -> i64
    %51 = func.call @cc_cons(%49, %50) : (i64, i64) -> i64
    %52 = func.call @cc_values_pack(%51) : (i64) -> i64
    %53 = func.call @cc_set_symbol_value(%49, %44) : (i64, i64) -> i64
    %54 = llvm.mlir.addressof @str6 : !llvm.ptr
    %55 = arith.constant 39 : i64
    %56 = func.call @cc_make_string(%54, %55) : (!llvm.ptr, i64) -> i64
    %57 = func.call @cc_nil_value() : () -> i64
    %58 = func.call @cc_intern(%56, %57) : (i64, i64) -> i64
    %59 = func.call @cc_nil_value() : () -> i64
    %60 = func.call @cc_cons(%58, %59) : (i64, i64) -> i64
    %61 = func.call @cc_values_pack(%60) : (i64) -> i64
    %62 = func.call @cc_set_symbol_value(%58, %44) : (i64, i64) -> i64
    %63 = llvm.mlir.addressof @str7 : !llvm.ptr
    %64 = arith.constant 40 : i64
    %65 = func.call @cc_make_string(%63, %64) : (!llvm.ptr, i64) -> i64
    %66 = func.call @cc_nil_value() : () -> i64
    %67 = func.call @cc_intern(%65, %66) : (i64, i64) -> i64
    %68 = func.call @cc_nil_value() : () -> i64
    %69 = func.call @cc_cons(%67, %68) : (i64, i64) -> i64
    %70 = func.call @cc_values_pack(%69) : (i64) -> i64
    %71 = func.call @cc_set_symbol_value(%67, %44) : (i64, i64) -> i64
    %72 = llvm.mlir.addressof @str8 : !llvm.ptr
    %73 = arith.constant 16 : i64
    %74 = func.call @cc_make_string(%72, %73) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%74) : (i64) -> ()
    %75 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%15) : (i64) -> ()
    %76 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%14) : (i64) -> ()
    %77 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%13) : (i64) -> ()
    %78 = func.call @stack_pop_pointer() : () -> i64
    %79 = func.call @cc_nil_value() : () -> i64
    %80 = func.call @cc_errorp(%76) : (i64) -> i64
    %81 = arith.cmpi ne, %80, %79 : i64
    %82 = arith.cmpi eq, %79, %79 : i64
    %83 = arith.andi %81, %82 : i1
    %84 = scf.if %83 -> (i64) {
      scf.yield %76 : i64
    } else {
      scf.yield %79 : i64
    }
    %85 = func.call @cc_errorp(%77) : (i64) -> i64
    %86 = arith.cmpi ne, %85, %79 : i64
    %87 = arith.cmpi eq, %84, %79 : i64
    %88 = arith.andi %86, %87 : i1
    %89 = scf.if %88 -> (i64) {
      scf.yield %77 : i64
    } else {
      scf.yield %84 : i64
    }
    %90 = func.call @cc_errorp(%78) : (i64) -> i64
    %91 = arith.cmpi ne, %90, %79 : i64
    %92 = arith.cmpi eq, %89, %79 : i64
    %93 = arith.andi %91, %92 : i1
    %94 = scf.if %93 -> (i64) {
      scf.yield %78 : i64
    } else {
      scf.yield %89 : i64
    }
    %95 = arith.cmpi ne, %94, %79 : i64
    scf.if %95 {
      func.call @stack_push_pointer(%94) : (i64) -> ()
    } else {
      %96 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%96) : (i64) -> ()
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %97 = func.call @stack_pop_pointer() : () -> i64
      %98 = func.call @stack_pop_pointer() : () -> i64
      %99 = func.call @cc_cons(%97, %98) : (i64, i64) -> i64
      func.call @stack_push_pointer(%99) : (i64) -> ()
      func.call @stack_push_pointer(%77) : (i64) -> ()
      %100 = func.call @stack_pop_pointer() : () -> i64
      %101 = func.call @stack_pop_pointer() : () -> i64
      %102 = func.call @cc_cons(%100, %101) : (i64, i64) -> i64
      func.call @stack_push_pointer(%102) : (i64) -> ()
      func.call @stack_push_pointer(%76) : (i64) -> ()
      %103 = func.call @stack_pop_pointer() : () -> i64
      %104 = func.call @stack_pop_pointer() : () -> i64
      %105 = func.call @cc_cons(%103, %104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%105) : (i64) -> ()
    }
    %106 = func.call @stack_pop_pointer() : () -> i64
    %107 = func.call @cc_multiple_value_list(%106) : (i64) -> i64
    %108 = llvm.mlir.addressof @str9 : !llvm.ptr
    %109 = arith.constant 38 : i64
    %110 = func.call @cc_make_string(%108, %109) : (!llvm.ptr, i64) -> i64
    %111 = func.call @cc_nil_value() : () -> i64
    %112 = func.call @cc_intern(%110, %111) : (i64, i64) -> i64
    %113 = func.call @cc_nil_value() : () -> i64
    %114 = func.call @cc_cons(%112, %113) : (i64, i64) -> i64
    %115 = func.call @cc_values_pack(%114) : (i64) -> i64
    %116 = func.call @cc_symbol_value(%112) : (i64) -> i64
    %117 = llvm.mlir.addressof @str10 : !llvm.ptr
    %118 = arith.constant 39 : i64
    %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
    %120 = func.call @cc_nil_value() : () -> i64
    %121 = func.call @cc_intern(%119, %120) : (i64, i64) -> i64
    %122 = func.call @cc_nil_value() : () -> i64
    %123 = func.call @cc_cons(%121, %122) : (i64, i64) -> i64
    %124 = func.call @cc_values_pack(%123) : (i64) -> i64
    %125 = func.call @cc_symbol_value(%121) : (i64) -> i64
    %126 = llvm.mlir.addressof @str11 : !llvm.ptr
    %127 = arith.constant 40 : i64
    %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
    %129 = func.call @cc_nil_value() : () -> i64
    %130 = func.call @cc_intern(%128, %129) : (i64, i64) -> i64
    %131 = func.call @cc_nil_value() : () -> i64
    %132 = func.call @cc_cons(%130, %131) : (i64, i64) -> i64
    %133 = func.call @cc_values_pack(%132) : (i64) -> i64
    %134 = func.call @cc_symbol_value(%130) : (i64) -> i64
    %135 = func.call @cc_nil_value() : () -> i64
    %136 = arith.cmpi ne, %116, %135 : i64
    %137 = scf.if %136 -> (i64) {
      scf.yield %134 : i64
    } else {
      scf.yield %107 : i64
    }
    %138 = func.call @cc_values_pack(%137) : (i64) -> i64
    func.call @stack_push_pointer(%138) : (i64) -> ()
    %139 = func.call @stack_pop_pointer() : () -> i64
    %140 = func.call @cc_multiple_value_list(%139) : (i64) -> i64
    %141 = llvm.mlir.addressof @str12 : !llvm.ptr
    %142 = arith.constant 38 : i64
    %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
    %144 = func.call @cc_nil_value() : () -> i64
    %145 = func.call @cc_intern(%143, %144) : (i64, i64) -> i64
    %146 = func.call @cc_nil_value() : () -> i64
    %147 = func.call @cc_cons(%145, %146) : (i64, i64) -> i64
    %148 = func.call @cc_values_pack(%147) : (i64) -> i64
    %149 = func.call @cc_symbol_value(%145) : (i64) -> i64
    %150 = llvm.mlir.addressof @str13 : !llvm.ptr
    %151 = arith.constant 40 : i64
    %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
    %153 = func.call @cc_nil_value() : () -> i64
    %154 = func.call @cc_intern(%152, %153) : (i64, i64) -> i64
    %155 = func.call @cc_nil_value() : () -> i64
    %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
    %157 = func.call @cc_values_pack(%156) : (i64) -> i64
    %158 = func.call @cc_symbol_value(%154) : (i64) -> i64
    %159 = func.call @cc_nil_value() : () -> i64
    %160 = arith.cmpi ne, %149, %159 : i64
    %161 = scf.if %160 -> (i64) {
      scf.yield %158 : i64
    } else {
      scf.yield %140 : i64
    }
    %162 = func.call @cc_values_pack(%161) : (i64) -> i64
    func.call @stack_push_pointer(%162) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%test-documentation-with-args"() {
    %163 = llvm.mlir.addressof @str14 : !llvm.ptr
    %164 = arith.constant 28 : i64
    %165 = func.call @cc_make_string(%163, %164) : (!llvm.ptr, i64) -> i64
    %166 = func.call @cc_nil_value() : () -> i64
    %167 = func.call @cc_intern(%165, %166) : (i64, i64) -> i64
    %168 = func.call @cc_nil_value() : () -> i64
    %169 = func.call @cc_cons(%167, %168) : (i64, i64) -> i64
    %170 = func.call @cc_values_pack(%169) : (i64) -> i64
    %171 = llvm.mlir.addressof @str15 : !llvm.ptr
    %172 = arith.constant 29 : i64
    %173 = func.call @cc_make_string(%171, %172) : (!llvm.ptr, i64) -> i64
    %174 = func.call @cc_register_function_lambda_list_metadata_raw(%167, %173) : (i64, i64) -> i64
    %175 = arith.constant 3 : i64
    func.call @cc_runtime_debug_stack_push_call(%167, %175) : (i64, i64) -> ()
    %176 = func.call @stack_pop_pointer() : () -> i64
    %177 = arith.constant 0 : i64
    %178 = func.call @cc_arg(%176, %177) : (i64, i64) -> i64
    %179 = arith.constant 4 : i64
    %180 = func.call @cc_arg(%176, %179) : (i64, i64) -> i64
    %181 = func.call @cc_arg_present(%176, %179) : (i64, i64) -> i64
    %182 = func.call @cc_nil_value() : () -> i64
    %183 = arith.cmpi ne, %181, %182 : i64
    %184 = scf.if %183 -> (i64) {
      scf.yield %180 : i64
    } else {
      %185 = llvm.mlir.addressof @str16 : !llvm.ptr
      %186 = arith.constant 8 : i64
      %187 = func.call @cc_make_string(%185, %186) : (!llvm.ptr, i64) -> i64
      %188 = llvm.mlir.addressof @str17 : !llvm.ptr
      %189 = arith.constant 11 : i64
      %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
      %191 = func.call @cc_intern(%187, %190) : (i64, i64) -> i64
      %192 = func.call @cc_nil_value() : () -> i64
      %193 = func.call @cc_cons(%191, %192) : (i64, i64) -> i64
      %194 = func.call @cc_values_pack(%193) : (i64) -> i64
      func.call @stack_push_pointer(%191) : (i64) -> ()
      %195 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %195 : i64
    }
    %196 = arith.constant 8 : i64
    %197 = func.call @cc_arg(%176, %196) : (i64, i64) -> i64
    %198 = func.call @cc_arg_present(%176, %196) : (i64, i64) -> i64
    %199 = func.call @cc_nil_value() : () -> i64
    %200 = arith.cmpi ne, %198, %199 : i64
    %201 = scf.if %200 -> (i64) {
      scf.yield %197 : i64
    } else {
      scf.yield %199 : i64
    }
    %202 = func.call @cc_nil_value() : () -> i64
    %203 = llvm.mlir.addressof @str18 : !llvm.ptr
    %204 = arith.constant 38 : i64
    %205 = func.call @cc_make_string(%203, %204) : (!llvm.ptr, i64) -> i64
    %206 = func.call @cc_nil_value() : () -> i64
    %207 = func.call @cc_intern(%205, %206) : (i64, i64) -> i64
    %208 = func.call @cc_nil_value() : () -> i64
    %209 = func.call @cc_cons(%207, %208) : (i64, i64) -> i64
    %210 = func.call @cc_values_pack(%209) : (i64) -> i64
    %211 = func.call @cc_set_symbol_value(%207, %202) : (i64, i64) -> i64
    %212 = llvm.mlir.addressof @str19 : !llvm.ptr
    %213 = arith.constant 39 : i64
    %214 = func.call @cc_make_string(%212, %213) : (!llvm.ptr, i64) -> i64
    %215 = func.call @cc_nil_value() : () -> i64
    %216 = func.call @cc_intern(%214, %215) : (i64, i64) -> i64
    %217 = func.call @cc_nil_value() : () -> i64
    %218 = func.call @cc_cons(%216, %217) : (i64, i64) -> i64
    %219 = func.call @cc_values_pack(%218) : (i64) -> i64
    %220 = func.call @cc_set_symbol_value(%216, %202) : (i64, i64) -> i64
    %221 = llvm.mlir.addressof @str20 : !llvm.ptr
    %222 = arith.constant 40 : i64
    %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
    %224 = func.call @cc_nil_value() : () -> i64
    %225 = func.call @cc_intern(%223, %224) : (i64, i64) -> i64
    %226 = func.call @cc_nil_value() : () -> i64
    %227 = func.call @cc_cons(%225, %226) : (i64, i64) -> i64
    %228 = func.call @cc_values_pack(%227) : (i64) -> i64
    %229 = func.call @cc_set_symbol_value(%225, %202) : (i64, i64) -> i64
    %230 = func.call @cc_nil_value() : () -> i64
    %231 = llvm.mlir.addressof @str21 : !llvm.ptr
    %232 = arith.constant 38 : i64
    %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
    %234 = func.call @cc_nil_value() : () -> i64
    %235 = func.call @cc_intern(%233, %234) : (i64, i64) -> i64
    %236 = func.call @cc_nil_value() : () -> i64
    %237 = func.call @cc_cons(%235, %236) : (i64, i64) -> i64
    %238 = func.call @cc_values_pack(%237) : (i64) -> i64
    %239 = func.call @cc_set_symbol_value(%235, %230) : (i64, i64) -> i64
    %240 = llvm.mlir.addressof @str22 : !llvm.ptr
    %241 = arith.constant 39 : i64
    %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
    %243 = func.call @cc_nil_value() : () -> i64
    %244 = func.call @cc_intern(%242, %243) : (i64, i64) -> i64
    %245 = func.call @cc_nil_value() : () -> i64
    %246 = func.call @cc_cons(%244, %245) : (i64, i64) -> i64
    %247 = func.call @cc_values_pack(%246) : (i64) -> i64
    %248 = func.call @cc_set_symbol_value(%244, %230) : (i64, i64) -> i64
    %249 = llvm.mlir.addressof @str23 : !llvm.ptr
    %250 = arith.constant 40 : i64
    %251 = func.call @cc_make_string(%249, %250) : (!llvm.ptr, i64) -> i64
    %252 = func.call @cc_nil_value() : () -> i64
    %253 = func.call @cc_intern(%251, %252) : (i64, i64) -> i64
    %254 = func.call @cc_nil_value() : () -> i64
    %255 = func.call @cc_cons(%253, %254) : (i64, i64) -> i64
    %256 = func.call @cc_values_pack(%255) : (i64) -> i64
    %257 = func.call @cc_set_symbol_value(%253, %230) : (i64, i64) -> i64
    func.call @stack_push_pointer(%178) : (i64) -> ()
    %258 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%184) : (i64) -> ()
    %259 = func.call @stack_pop_pointer() : () -> i64
    %260 = func.call @cc_nil_value() : () -> i64
    %261 = func.call @cc_errorp(%258) : (i64) -> i64
    %262 = arith.cmpi ne, %261, %260 : i64
    %263 = arith.cmpi eq, %260, %260 : i64
    %264 = arith.andi %262, %263 : i1
    %265 = scf.if %264 -> (i64) {
      scf.yield %258 : i64
    } else {
      scf.yield %260 : i64
    }
    %266 = func.call @cc_errorp(%259) : (i64) -> i64
    %267 = arith.cmpi ne, %266, %260 : i64
    %268 = arith.cmpi eq, %265, %260 : i64
    %269 = arith.andi %267, %268 : i1
    %270 = scf.if %269 -> (i64) {
      scf.yield %259 : i64
    } else {
      scf.yield %265 : i64
    }
    %271 = arith.cmpi ne, %270, %260 : i64
    scf.if %271 {
      func.call @stack_push_pointer(%270) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%258) : (i64) -> ()
      func.call @stack_push_pointer(%259) : (i64) -> ()
      %272 = llvm.mlir.addressof @str24 : !llvm.ptr
      %273 = func.call @cc_make_function_ref_const(%272) : (!llvm.ptr) -> i64
      %274 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%273, %274) : (i64, i64) -> ()
    }
    %275 = func.call @stack_pop_pointer() : () -> i64
    %276 = func.call @cc_nil_value() : () -> i64
    %277 = func.call @cc_nil_value() : () -> i64
    %278 = func.call @cc_errorp(%276) : (i64) -> i64
    %279 = arith.cmpi ne, %278, %277 : i64
    %280 = scf.if %279 -> (i64) {
      scf.yield %276 : i64
    } else {
      func.call @stack_push_pointer(%275) : (i64) -> ()
      %281 = func.call @stack_pop_pointer() : () -> i64
      %282 = func.call @cc_nil_value() : () -> i64
      %283 = arith.cmpi ne, %281, %282 : i64
      scf.if %283 {
        %284 = func.call @cc_make_string_output_stream() : () -> i64
        %285 = llvm.mlir.addressof @str25 : !llvm.ptr
        %286 = arith.constant 17 : i64
        %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
        %288 = func.call @cc_nil_value() : () -> i64
        %289 = func.call @cc_intern(%287, %288) : (i64, i64) -> i64
        %290 = func.call @cc_nil_value() : () -> i64
        %291 = func.call @cc_cons(%289, %290) : (i64, i64) -> i64
        %292 = func.call @cc_values_pack(%291) : (i64) -> i64
        %293 = func.call @cc_symbol_value(%289) : (i64) -> i64
        %294 = func.call @cc_set_symbol_value(%289, %284) : (i64, i64) -> i64
        func.call @stack_push_pointer(%178) : (i64) -> ()
        %295 = func.call @stack_pop_pointer() : () -> i64
        %296 = func.call @cc_nil_value() : () -> i64
        %297 = func.call @cc_errorp(%295) : (i64) -> i64
        %298 = arith.cmpi ne, %297, %296 : i64
        %299 = arith.cmpi eq, %296, %296 : i64
        %300 = arith.andi %298, %299 : i1
        %301 = scf.if %300 -> (i64) {
          scf.yield %295 : i64
        } else {
          scf.yield %296 : i64
        }
        %302 = arith.cmpi ne, %301, %296 : i64
        scf.if %302 {
          func.call @stack_push_pointer(%301) : (i64) -> ()
        } else {
          %303 = func.call @cc_nil_value() : () -> i64
          %304 = func.call @cc_cons(%295, %303) : (i64, i64) -> i64
          func.call @stack_push_pointer(%304) : (i64) -> ()
          func.call @cc_describe_stack() : () -> ()
        }
        %305 = func.call @stack_pop_pointer() : () -> i64
        %306 = func.call @cc_nil_value() : () -> i64
        %307 = func.call @cc_errorp(%305) : (i64) -> i64
        %308 = arith.cmpi ne, %307, %306 : i64
        %309 = scf.if %308 -> (i64) {
          scf.yield %305 : i64
        } else {
          %310 = func.call @cc_get_output_stream_string(%284) : (i64) -> i64
          scf.yield %310 : i64
        }
        func.call @stack_push_pointer(%309) : (i64) -> ()
        %311 = func.call @cc_set_symbol_value(%289, %293) : (i64, i64) -> i64
        %312 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%178) : (i64) -> ()
        %313 = func.call @stack_pop_pointer() : () -> i64
        %314 = func.call @cc_nil_value() : () -> i64
        %315 = func.call @cc_errorp(%313) : (i64) -> i64
        %316 = arith.cmpi ne, %315, %314 : i64
        %317 = arith.cmpi eq, %314, %314 : i64
        %318 = arith.andi %316, %317 : i1
        %319 = scf.if %318 -> (i64) {
          scf.yield %313 : i64
        } else {
          scf.yield %314 : i64
        }
        %320 = arith.cmpi ne, %319, %314 : i64
        scf.if %320 {
          func.call @stack_push_pointer(%319) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%313) : (i64) -> ()
          %321 = llvm.mlir.addressof @str26 : !llvm.ptr
          %322 = func.call @cc_make_function_ref_const(%321) : (!llvm.ptr) -> i64
          %323 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%322, %323) : (i64, i64) -> ()
        }
        %324 = func.call @stack_pop_pointer() : () -> i64
        %325 = func.call @cc_nil_value() : () -> i64
        %326 = func.call @cc_nil_value() : () -> i64
        %327 = func.call @cc_errorp(%325) : (i64) -> i64
        %328 = arith.cmpi ne, %327, %326 : i64
        %329 = scf.if %328 -> (i64) {
          scf.yield %325 : i64
        } else {
          %330 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%330) : (i64) -> ()
          %331 = func.call @stack_pop_pointer() : () -> i64
          %332 = llvm.mlir.addressof @str27 : !llvm.ptr
          %333 = arith.constant 29 : i64
          %334 = func.call @cc_make_string(%332, %333) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%334) : (i64) -> ()
          %335 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%178) : (i64) -> ()
          %336 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%184) : (i64) -> ()
          %337 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%331) : (i64) -> ()
          func.call @stack_push_pointer(%335) : (i64) -> ()
          func.call @stack_push_pointer(%336) : (i64) -> ()
          func.call @stack_push_pointer(%337) : (i64) -> ()
          %338 = llvm.mlir.addressof @str28 : !llvm.ptr
          %339 = func.call @cc_make_function_ref_const(%338) : (!llvm.ptr) -> i64
          %340 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%339, %340) : (i64, i64) -> ()
          %341 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %341 : i64
        }
        %342 = func.call @cc_nil_value() : () -> i64
        %343 = func.call @cc_errorp(%329) : (i64) -> i64
        %344 = arith.cmpi ne, %343, %342 : i64
        %345 = scf.if %344 -> (i64) {
          scf.yield %329 : i64
        } else {
          %346 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%346) : (i64) -> ()
          %347 = func.call @stack_pop_pointer() : () -> i64
          %348 = llvm.mlir.addressof @str29 : !llvm.ptr
          %349 = arith.constant 8 : i64
          %350 = func.call @cc_make_string(%348, %349) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%350) : (i64) -> ()
          %351 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%275) : (i64) -> ()
          %352 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%347) : (i64) -> ()
          func.call @stack_push_pointer(%351) : (i64) -> ()
          func.call @stack_push_pointer(%352) : (i64) -> ()
          %353 = llvm.mlir.addressof @str30 : !llvm.ptr
          %354 = func.call @cc_make_function_ref_const(%353) : (!llvm.ptr) -> i64
          %355 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%354, %355) : (i64, i64) -> ()
          %356 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %356 : i64
        }
        %357 = func.call @cc_nil_value() : () -> i64
        %358 = func.call @cc_errorp(%345) : (i64) -> i64
        %359 = arith.cmpi ne, %358, %357 : i64
        %360 = scf.if %359 -> (i64) {
          scf.yield %345 : i64
        } else {
          %361 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%361) : (i64) -> ()
          %362 = func.call @stack_pop_pointer() : () -> i64
          %363 = llvm.mlir.addressof @str31 : !llvm.ptr
          %364 = arith.constant 9 : i64
          %365 = func.call @cc_make_string(%363, %364) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%365) : (i64) -> ()
          %366 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%324) : (i64) -> ()
          %367 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%362) : (i64) -> ()
          func.call @stack_push_pointer(%366) : (i64) -> ()
          func.call @stack_push_pointer(%367) : (i64) -> ()
          %368 = llvm.mlir.addressof @str32 : !llvm.ptr
          %369 = func.call @cc_make_function_ref_const(%368) : (!llvm.ptr) -> i64
          %370 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%369, %370) : (i64, i64) -> ()
          %371 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %371 : i64
        }
        %372 = func.call @cc_nil_value() : () -> i64
        %373 = func.call @cc_errorp(%360) : (i64) -> i64
        %374 = arith.cmpi ne, %373, %372 : i64
        %375 = scf.if %374 -> (i64) {
          scf.yield %360 : i64
        } else {
          %376 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%376) : (i64) -> ()
          %377 = func.call @stack_pop_pointer() : () -> i64
          %378 = llvm.mlir.addressof @str33 : !llvm.ptr
          %379 = arith.constant 15 : i64
          %380 = func.call @cc_make_string(%378, %379) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%380) : (i64) -> ()
          %381 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%324) : (i64) -> ()
          %382 = func.call @stack_pop_pointer() : () -> i64
          %383 = llvm.mlir.addressof @str34 : !llvm.ptr
          %384 = arith.constant 6 : i64
          %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
          %386 = llvm.mlir.addressof @str35 : !llvm.ptr
          %387 = arith.constant 7 : i64
          %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
          %389 = func.call @cc_intern(%385, %388) : (i64, i64) -> i64
          %390 = func.call @cc_nil_value() : () -> i64
          %391 = func.call @cc_cons(%389, %390) : (i64, i64) -> i64
          %392 = func.call @cc_values_pack(%391) : (i64) -> i64
          func.call @stack_push_pointer(%389) : (i64) -> ()
          %393 = func.call @stack_pop_pointer() : () -> i64
          %394 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%394) : (i64) -> ()
          %395 = func.call @stack_pop_pointer() : () -> i64
          %396 = llvm.mlir.addressof @str36 : !llvm.ptr
          %397 = arith.constant 8 : i64
          %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
          %399 = llvm.mlir.addressof @str37 : !llvm.ptr
          %400 = arith.constant 7 : i64
          %401 = func.call @cc_make_string(%399, %400) : (!llvm.ptr, i64) -> i64
          %402 = func.call @cc_intern(%398, %401) : (i64, i64) -> i64
          %403 = func.call @cc_nil_value() : () -> i64
          %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
          %405 = func.call @cc_values_pack(%404) : (i64) -> i64
          func.call @stack_push_pointer(%402) : (i64) -> ()
          %406 = func.call @stack_pop_pointer() : () -> i64
          %407 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%407) : (i64) -> ()
          %408 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%382) : (i64) -> ()
          func.call @stack_push_pointer(%393) : (i64) -> ()
          func.call @stack_push_pointer(%395) : (i64) -> ()
          func.call @stack_push_pointer(%406) : (i64) -> ()
          func.call @stack_push_pointer(%408) : (i64) -> ()
          %409 = llvm.mlir.addressof @str38 : !llvm.ptr
          %410 = func.call @cc_make_function_ref_const(%409) : (!llvm.ptr) -> i64
          %411 = arith.constant 5 : i64
          func.call @cc_funcall_stack(%410, %411) : (i64, i64) -> ()
          %412 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%377) : (i64) -> ()
          func.call @stack_push_pointer(%381) : (i64) -> ()
          func.call @stack_push_pointer(%412) : (i64) -> ()
          %413 = llvm.mlir.addressof @str39 : !llvm.ptr
          %414 = func.call @cc_make_function_ref_const(%413) : (!llvm.ptr) -> i64
          %415 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%414, %415) : (i64, i64) -> ()
          %416 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %416 : i64
        }
        %417 = func.call @cc_nil_value() : () -> i64
        %418 = func.call @cc_errorp(%375) : (i64) -> i64
        %419 = arith.cmpi ne, %418, %417 : i64
        %420 = scf.if %419 -> (i64) {
          scf.yield %375 : i64
        } else {
          %421 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%421) : (i64) -> ()
          %422 = func.call @stack_pop_pointer() : () -> i64
          %423 = llvm.mlir.addressof @str40 : !llvm.ptr
          %424 = arith.constant 13 : i64
          %425 = func.call @cc_make_string(%423, %424) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%425) : (i64) -> ()
          %426 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%312) : (i64) -> ()
          %427 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%422) : (i64) -> ()
          func.call @stack_push_pointer(%426) : (i64) -> ()
          func.call @stack_push_pointer(%427) : (i64) -> ()
          %428 = llvm.mlir.addressof @str41 : !llvm.ptr
          %429 = func.call @cc_make_function_ref_const(%428) : (!llvm.ptr) -> i64
          %430 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%429, %430) : (i64, i64) -> ()
          %431 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %431 : i64
        }
        %432 = func.call @cc_nil_value() : () -> i64
        %433 = func.call @cc_errorp(%420) : (i64) -> i64
        %434 = arith.cmpi ne, %433, %432 : i64
        %435 = scf.if %434 -> (i64) {
          scf.yield %420 : i64
        } else {
          %436 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%436) : (i64) -> ()
          %437 = func.call @stack_pop_pointer() : () -> i64
          %438 = llvm.mlir.addressof @str42 : !llvm.ptr
          %439 = arith.constant 30 : i64
          %440 = func.call @cc_make_string(%438, %439) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%440) : (i64) -> ()
          %441 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%275) : (i64) -> ()
          %442 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%312) : (i64) -> ()
          %443 = func.call @stack_pop_pointer() : () -> i64
          %444 = func.call @cc_nil_value() : () -> i64
          %445 = func.call @cc_errorp(%442) : (i64) -> i64
          %446 = arith.cmpi ne, %445, %444 : i64
          %447 = arith.cmpi eq, %444, %444 : i64
          %448 = arith.andi %446, %447 : i1
          %449 = scf.if %448 -> (i64) {
            scf.yield %442 : i64
          } else {
            scf.yield %444 : i64
          }
          %450 = func.call @cc_errorp(%443) : (i64) -> i64
          %451 = arith.cmpi ne, %450, %444 : i64
          %452 = arith.cmpi eq, %449, %444 : i64
          %453 = arith.andi %451, %452 : i1
          %454 = scf.if %453 -> (i64) {
            scf.yield %443 : i64
          } else {
            scf.yield %449 : i64
          }
          %455 = arith.cmpi ne, %454, %444 : i64
          scf.if %455 {
            func.call @stack_push_pointer(%454) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%442) : (i64) -> ()
            func.call @stack_push_pointer(%443) : (i64) -> ()
            %456 = llvm.mlir.addressof @str43 : !llvm.ptr
            %457 = func.call @cc_make_function_ref_const(%456) : (!llvm.ptr) -> i64
            %458 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%457, %458) : (i64, i64) -> ()
          }
          %459 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%324) : (i64) -> ()
          %460 = func.call @stack_pop_pointer() : () -> i64
          %461 = llvm.mlir.addressof @str44 : !llvm.ptr
          %462 = arith.constant 6 : i64
          %463 = func.call @cc_make_string(%461, %462) : (!llvm.ptr, i64) -> i64
          %464 = llvm.mlir.addressof @str45 : !llvm.ptr
          %465 = arith.constant 7 : i64
          %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
          %467 = func.call @cc_intern(%463, %466) : (i64, i64) -> i64
          %468 = func.call @cc_nil_value() : () -> i64
          %469 = func.call @cc_cons(%467, %468) : (i64, i64) -> i64
          %470 = func.call @cc_values_pack(%469) : (i64) -> i64
          func.call @stack_push_pointer(%467) : (i64) -> ()
          %471 = func.call @stack_pop_pointer() : () -> i64
          %472 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%472) : (i64) -> ()
          %473 = func.call @stack_pop_pointer() : () -> i64
          %474 = llvm.mlir.addressof @str46 : !llvm.ptr
          %475 = arith.constant 8 : i64
          %476 = func.call @cc_make_string(%474, %475) : (!llvm.ptr, i64) -> i64
          %477 = llvm.mlir.addressof @str47 : !llvm.ptr
          %478 = arith.constant 7 : i64
          %479 = func.call @cc_make_string(%477, %478) : (!llvm.ptr, i64) -> i64
          %480 = func.call @cc_intern(%476, %479) : (i64, i64) -> i64
          %481 = func.call @cc_nil_value() : () -> i64
          %482 = func.call @cc_cons(%480, %481) : (i64, i64) -> i64
          %483 = func.call @cc_values_pack(%482) : (i64) -> i64
          func.call @stack_push_pointer(%480) : (i64) -> ()
          %484 = func.call @stack_pop_pointer() : () -> i64
          %485 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%485) : (i64) -> ()
          %486 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%460) : (i64) -> ()
          func.call @stack_push_pointer(%471) : (i64) -> ()
          func.call @stack_push_pointer(%473) : (i64) -> ()
          func.call @stack_push_pointer(%484) : (i64) -> ()
          func.call @stack_push_pointer(%486) : (i64) -> ()
          %487 = llvm.mlir.addressof @str48 : !llvm.ptr
          %488 = func.call @cc_make_function_ref_const(%487) : (!llvm.ptr) -> i64
          %489 = arith.constant 5 : i64
          func.call @cc_funcall_stack(%488, %489) : (i64, i64) -> ()
          %490 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%312) : (i64) -> ()
          %491 = func.call @stack_pop_pointer() : () -> i64
          %492 = func.call @cc_nil_value() : () -> i64
          %493 = func.call @cc_errorp(%490) : (i64) -> i64
          %494 = arith.cmpi ne, %493, %492 : i64
          %495 = arith.cmpi eq, %492, %492 : i64
          %496 = arith.andi %494, %495 : i1
          %497 = scf.if %496 -> (i64) {
            scf.yield %490 : i64
          } else {
            scf.yield %492 : i64
          }
          %498 = func.call @cc_errorp(%491) : (i64) -> i64
          %499 = arith.cmpi ne, %498, %492 : i64
          %500 = arith.cmpi eq, %497, %492 : i64
          %501 = arith.andi %499, %500 : i1
          %502 = scf.if %501 -> (i64) {
            scf.yield %491 : i64
          } else {
            scf.yield %497 : i64
          }
          %503 = arith.cmpi ne, %502, %492 : i64
          scf.if %503 {
            func.call @stack_push_pointer(%502) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%490) : (i64) -> ()
            func.call @stack_push_pointer(%491) : (i64) -> ()
            %504 = llvm.mlir.addressof @str49 : !llvm.ptr
            %505 = func.call @cc_make_function_ref_const(%504) : (!llvm.ptr) -> i64
            %506 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%505, %506) : (i64, i64) -> ()
          }
          %507 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%437) : (i64) -> ()
          func.call @stack_push_pointer(%441) : (i64) -> ()
          func.call @stack_push_pointer(%459) : (i64) -> ()
          func.call @stack_push_pointer(%507) : (i64) -> ()
          %508 = llvm.mlir.addressof @str50 : !llvm.ptr
          %509 = func.call @cc_make_function_ref_const(%508) : (!llvm.ptr) -> i64
          %510 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%509, %510) : (i64, i64) -> ()
          %511 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %511 : i64
        }
        %512 = func.call @cc_nil_value() : () -> i64
        %513 = func.call @cc_errorp(%435) : (i64) -> i64
        %514 = arith.cmpi ne, %513, %512 : i64
        %515 = scf.if %514 -> (i64) {
          scf.yield %435 : i64
        } else {
          %516 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%275) : (i64) -> ()
          %517 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%312) : (i64) -> ()
          %518 = func.call @stack_pop_pointer() : () -> i64
          %519 = func.call @cc_nil_value() : () -> i64
          %520 = func.call @cc_errorp(%517) : (i64) -> i64
          %521 = arith.cmpi ne, %520, %519 : i64
          %522 = arith.cmpi eq, %519, %519 : i64
          %523 = arith.andi %521, %522 : i1
          %524 = scf.if %523 -> (i64) {
            scf.yield %517 : i64
          } else {
            scf.yield %519 : i64
          }
          %525 = func.call @cc_errorp(%518) : (i64) -> i64
          %526 = arith.cmpi ne, %525, %519 : i64
          %527 = arith.cmpi eq, %524, %519 : i64
          %528 = arith.andi %526, %527 : i1
          %529 = scf.if %528 -> (i64) {
            scf.yield %518 : i64
          } else {
            scf.yield %524 : i64
          }
          %530 = arith.cmpi ne, %529, %519 : i64
          scf.if %530 {
            func.call @stack_push_pointer(%529) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%517) : (i64) -> ()
            func.call @stack_push_pointer(%518) : (i64) -> ()
            %531 = llvm.mlir.addressof @str51 : !llvm.ptr
            %532 = func.call @cc_make_function_ref_const(%531) : (!llvm.ptr) -> i64
            %533 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%532, %533) : (i64, i64) -> ()
          }
          %534 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%324) : (i64) -> ()
          %535 = func.call @stack_pop_pointer() : () -> i64
          %536 = llvm.mlir.addressof @str52 : !llvm.ptr
          %537 = arith.constant 6 : i64
          %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
          %539 = llvm.mlir.addressof @str53 : !llvm.ptr
          %540 = arith.constant 7 : i64
          %541 = func.call @cc_make_string(%539, %540) : (!llvm.ptr, i64) -> i64
          %542 = func.call @cc_intern(%538, %541) : (i64, i64) -> i64
          %543 = func.call @cc_nil_value() : () -> i64
          %544 = func.call @cc_cons(%542, %543) : (i64, i64) -> i64
          %545 = func.call @cc_values_pack(%544) : (i64) -> i64
          func.call @stack_push_pointer(%542) : (i64) -> ()
          %546 = func.call @stack_pop_pointer() : () -> i64
          %547 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%547) : (i64) -> ()
          %548 = func.call @stack_pop_pointer() : () -> i64
          %549 = llvm.mlir.addressof @str54 : !llvm.ptr
          %550 = arith.constant 8 : i64
          %551 = func.call @cc_make_string(%549, %550) : (!llvm.ptr, i64) -> i64
          %552 = llvm.mlir.addressof @str55 : !llvm.ptr
          %553 = arith.constant 7 : i64
          %554 = func.call @cc_make_string(%552, %553) : (!llvm.ptr, i64) -> i64
          %555 = func.call @cc_intern(%551, %554) : (i64, i64) -> i64
          %556 = func.call @cc_nil_value() : () -> i64
          %557 = func.call @cc_cons(%555, %556) : (i64, i64) -> i64
          %558 = func.call @cc_values_pack(%557) : (i64) -> i64
          func.call @stack_push_pointer(%555) : (i64) -> ()
          %559 = func.call @stack_pop_pointer() : () -> i64
          %560 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%560) : (i64) -> ()
          %561 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%535) : (i64) -> ()
          func.call @stack_push_pointer(%546) : (i64) -> ()
          func.call @stack_push_pointer(%548) : (i64) -> ()
          func.call @stack_push_pointer(%559) : (i64) -> ()
          func.call @stack_push_pointer(%561) : (i64) -> ()
          %562 = llvm.mlir.addressof @str56 : !llvm.ptr
          %563 = func.call @cc_make_function_ref_const(%562) : (!llvm.ptr) -> i64
          %564 = arith.constant 5 : i64
          func.call @cc_funcall_stack(%563, %564) : (i64, i64) -> ()
          %565 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%312) : (i64) -> ()
          %566 = func.call @stack_pop_pointer() : () -> i64
          %567 = func.call @cc_nil_value() : () -> i64
          %568 = func.call @cc_errorp(%565) : (i64) -> i64
          %569 = arith.cmpi ne, %568, %567 : i64
          %570 = arith.cmpi eq, %567, %567 : i64
          %571 = arith.andi %569, %570 : i1
          %572 = scf.if %571 -> (i64) {
            scf.yield %565 : i64
          } else {
            scf.yield %567 : i64
          }
          %573 = func.call @cc_errorp(%566) : (i64) -> i64
          %574 = arith.cmpi ne, %573, %567 : i64
          %575 = arith.cmpi eq, %572, %567 : i64
          %576 = arith.andi %574, %575 : i1
          %577 = scf.if %576 -> (i64) {
            scf.yield %566 : i64
          } else {
            scf.yield %572 : i64
          }
          %578 = arith.cmpi ne, %577, %567 : i64
          scf.if %578 {
            func.call @stack_push_pointer(%577) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%565) : (i64) -> ()
            func.call @stack_push_pointer(%566) : (i64) -> ()
            %579 = llvm.mlir.addressof @str57 : !llvm.ptr
            %580 = func.call @cc_make_function_ref_const(%579) : (!llvm.ptr) -> i64
            %581 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%580, %581) : (i64, i64) -> ()
          }
          %582 = func.call @stack_pop_pointer() : () -> i64
          %583 = func.call @cc_cons(%582, %516) : (i64, i64) -> i64
          %584 = func.call @cc_cons(%534, %583) : (i64, i64) -> i64
          %585 = func.call @cc_and(%584) : (i64) -> i64
          func.call @stack_push_pointer(%585) : (i64) -> ()
          %586 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %586 : i64
        }
        func.call @stack_push_pointer(%515) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%201) : (i64) -> ()
        %587 = func.call @stack_pop_pointer() : () -> i64
        %588 = func.call @cc_nil_value() : () -> i64
        %589 = arith.cmpi ne, %587, %588 : i64
        scf.if %589 {
          func.call @stack_push_nil() : () -> ()
        } else {
          %590 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%590) : (i64) -> ()
          %591 = func.call @stack_pop_pointer() : () -> i64
          %592 = func.call @cc_nil_value() : () -> i64
          %593 = arith.cmpi ne, %591, %592 : i64
          scf.if %593 {
            %594 = func.call @cc_make_string_output_stream() : () -> i64
            %595 = llvm.mlir.addressof @str58 : !llvm.ptr
            %596 = arith.constant 17 : i64
            %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
            %598 = func.call @cc_nil_value() : () -> i64
            %599 = func.call @cc_intern(%597, %598) : (i64, i64) -> i64
            %600 = func.call @cc_nil_value() : () -> i64
            %601 = func.call @cc_cons(%599, %600) : (i64, i64) -> i64
            %602 = func.call @cc_values_pack(%601) : (i64) -> i64
            %603 = func.call @cc_symbol_value(%599) : (i64) -> i64
            %604 = func.call @cc_set_symbol_value(%599, %594) : (i64, i64) -> i64
            func.call @stack_push_pointer(%178) : (i64) -> ()
            %605 = func.call @stack_pop_pointer() : () -> i64
            %606 = func.call @cc_nil_value() : () -> i64
            %607 = func.call @cc_errorp(%605) : (i64) -> i64
            %608 = arith.cmpi ne, %607, %606 : i64
            %609 = arith.cmpi eq, %606, %606 : i64
            %610 = arith.andi %608, %609 : i1
            %611 = scf.if %610 -> (i64) {
              scf.yield %605 : i64
            } else {
              scf.yield %606 : i64
            }
            %612 = arith.cmpi ne, %611, %606 : i64
            scf.if %612 {
              func.call @stack_push_pointer(%611) : (i64) -> ()
            } else {
              %613 = func.call @cc_nil_value() : () -> i64
              %614 = func.call @cc_cons(%605, %613) : (i64, i64) -> i64
              func.call @stack_push_pointer(%614) : (i64) -> ()
              func.call @cc_describe_stack() : () -> ()
            }
            %615 = func.call @stack_pop_pointer() : () -> i64
            %616 = func.call @cc_nil_value() : () -> i64
            %617 = func.call @cc_errorp(%615) : (i64) -> i64
            %618 = arith.cmpi ne, %617, %616 : i64
            %619 = scf.if %618 -> (i64) {
              scf.yield %615 : i64
            } else {
              %620 = func.call @cc_get_output_stream_string(%594) : (i64) -> i64
              scf.yield %620 : i64
            }
            func.call @stack_push_pointer(%619) : (i64) -> ()
            %621 = func.call @cc_set_symbol_value(%599, %603) : (i64, i64) -> i64
        }
      }
      }
      %622 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %622 : i64
    }
    func.call @stack_push_pointer(%280) : (i64) -> ()
    %623 = func.call @stack_pop_pointer() : () -> i64
    %624 = func.call @cc_multiple_value_list(%623) : (i64) -> i64
    %625 = llvm.mlir.addressof @str59 : !llvm.ptr
    %626 = arith.constant 38 : i64
    %627 = func.call @cc_make_string(%625, %626) : (!llvm.ptr, i64) -> i64
    %628 = func.call @cc_nil_value() : () -> i64
    %629 = func.call @cc_intern(%627, %628) : (i64, i64) -> i64
    %630 = func.call @cc_nil_value() : () -> i64
    %631 = func.call @cc_cons(%629, %630) : (i64, i64) -> i64
    %632 = func.call @cc_values_pack(%631) : (i64) -> i64
    %633 = func.call @cc_symbol_value(%629) : (i64) -> i64
    %634 = llvm.mlir.addressof @str60 : !llvm.ptr
    %635 = arith.constant 39 : i64
    %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
    %637 = func.call @cc_nil_value() : () -> i64
    %638 = func.call @cc_intern(%636, %637) : (i64, i64) -> i64
    %639 = func.call @cc_nil_value() : () -> i64
    %640 = func.call @cc_cons(%638, %639) : (i64, i64) -> i64
    %641 = func.call @cc_values_pack(%640) : (i64) -> i64
    %642 = func.call @cc_symbol_value(%638) : (i64) -> i64
    %643 = llvm.mlir.addressof @str61 : !llvm.ptr
    %644 = arith.constant 40 : i64
    %645 = func.call @cc_make_string(%643, %644) : (!llvm.ptr, i64) -> i64
    %646 = func.call @cc_nil_value() : () -> i64
    %647 = func.call @cc_intern(%645, %646) : (i64, i64) -> i64
    %648 = func.call @cc_nil_value() : () -> i64
    %649 = func.call @cc_cons(%647, %648) : (i64, i64) -> i64
    %650 = func.call @cc_values_pack(%649) : (i64) -> i64
    %651 = func.call @cc_symbol_value(%647) : (i64) -> i64
    %652 = func.call @cc_nil_value() : () -> i64
    %653 = arith.cmpi ne, %633, %652 : i64
    %654 = scf.if %653 -> (i64) {
      scf.yield %651 : i64
    } else {
      scf.yield %624 : i64
    }
    %655 = func.call @cc_values_pack(%654) : (i64) -> i64
    func.call @stack_push_pointer(%655) : (i64) -> ()
    %656 = func.call @stack_pop_pointer() : () -> i64
    %657 = func.call @cc_multiple_value_list(%656) : (i64) -> i64
    %658 = llvm.mlir.addressof @str62 : !llvm.ptr
    %659 = arith.constant 38 : i64
    %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
    %661 = func.call @cc_nil_value() : () -> i64
    %662 = func.call @cc_intern(%660, %661) : (i64, i64) -> i64
    %663 = func.call @cc_nil_value() : () -> i64
    %664 = func.call @cc_cons(%662, %663) : (i64, i64) -> i64
    %665 = func.call @cc_values_pack(%664) : (i64) -> i64
    %666 = func.call @cc_symbol_value(%662) : (i64) -> i64
    %667 = llvm.mlir.addressof @str63 : !llvm.ptr
    %668 = arith.constant 40 : i64
    %669 = func.call @cc_make_string(%667, %668) : (!llvm.ptr, i64) -> i64
    %670 = func.call @cc_nil_value() : () -> i64
    %671 = func.call @cc_intern(%669, %670) : (i64, i64) -> i64
    %672 = func.call @cc_nil_value() : () -> i64
    %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
    %674 = func.call @cc_values_pack(%673) : (i64) -> i64
    %675 = func.call @cc_symbol_value(%671) : (i64) -> i64
    %676 = func.call @cc_nil_value() : () -> i64
    %677 = arith.cmpi ne, %666, %676 : i64
    %678 = scf.if %677 -> (i64) {
      scf.yield %675 : i64
    } else {
      scf.yield %657 : i64
    }
    %679 = func.call @cc_values_pack(%678) : (i64) -> i64
    func.call @stack_push_pointer(%679) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %680 = llvm.mlir.addressof @str64 : !llvm.ptr
    %681 = arith.constant 6 : i64
    %682 = func.call @cc_make_string(%680, %681) : (!llvm.ptr, i64) -> i64
    %683 = func.call @cc_nil_value() : () -> i64
    %684 = func.call @cc_intern(%682, %683) : (i64, i64) -> i64
    %685 = func.call @cc_nil_value() : () -> i64
    %686 = func.call @cc_cons(%684, %685) : (i64, i64) -> i64
    %687 = func.call @cc_values_pack(%686) : (i64) -> i64
    %688 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%684, %688) : (i64, i64) -> ()
    %689 = func.call @cc_nil_value() : () -> i64
    %690 = llvm.mlir.addressof @str65 : !llvm.ptr
    %691 = arith.constant 38 : i64
    %692 = func.call @cc_make_string(%690, %691) : (!llvm.ptr, i64) -> i64
    %693 = func.call @cc_nil_value() : () -> i64
    %694 = func.call @cc_intern(%692, %693) : (i64, i64) -> i64
    %695 = func.call @cc_nil_value() : () -> i64
    %696 = func.call @cc_cons(%694, %695) : (i64, i64) -> i64
    %697 = func.call @cc_values_pack(%696) : (i64) -> i64
    %698 = func.call @cc_set_symbol_value(%694, %689) : (i64, i64) -> i64
    %699 = llvm.mlir.addressof @str66 : !llvm.ptr
    %700 = arith.constant 39 : i64
    %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
    %702 = func.call @cc_nil_value() : () -> i64
    %703 = func.call @cc_intern(%701, %702) : (i64, i64) -> i64
    %704 = func.call @cc_nil_value() : () -> i64
    %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
    %706 = func.call @cc_values_pack(%705) : (i64) -> i64
    %707 = func.call @cc_set_symbol_value(%703, %689) : (i64, i64) -> i64
    %708 = llvm.mlir.addressof @str67 : !llvm.ptr
    %709 = arith.constant 40 : i64
    %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
    %711 = func.call @cc_nil_value() : () -> i64
    %712 = func.call @cc_intern(%710, %711) : (i64, i64) -> i64
    %713 = func.call @cc_nil_value() : () -> i64
    %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
    %715 = func.call @cc_values_pack(%714) : (i64) -> i64
    %716 = func.call @cc_set_symbol_value(%712, %689) : (i64, i64) -> i64
    %717 = func.call @cc_nil_value() : () -> i64
    %718 = func.call @cc_nil_value() : () -> i64
    %719 = func.call @cc_errorp(%717) : (i64) -> i64
    %720 = arith.cmpi ne, %719, %718 : i64
    %721 = scf.if %720 -> (i64) {
      scf.yield %717 : i64
    } else {
      %722 = func.call @cc_nil_value() : () -> i64
      %723 = func.call @cc_nil_value() : () -> i64
      %724 = func.call @cc_errorp(%722) : (i64) -> i64
      %725 = arith.cmpi ne, %724, %723 : i64
      %726 = scf.if %725 -> (i64) {
        scf.yield %722 : i64
      } else {
        %727 = llvm.mlir.addressof @str68 : !llvm.ptr
        %728 = arith.constant 11 : i64
        %729 = func.call @cc_make_string(%727, %728) : (!llvm.ptr, i64) -> i64
        %730 = func.call @cc_nil_value() : () -> i64
        %731 = func.call @cc_intern(%729, %730) : (i64, i64) -> i64
        %732 = func.call @cc_nil_value() : () -> i64
        %733 = func.call @cc_cons(%731, %732) : (i64, i64) -> i64
        %734 = func.call @cc_values_pack(%733) : (i64) -> i64
        func.call @stack_push_pointer(%731) : (i64) -> ()
        %735 = func.call @stack_pop_pointer() : () -> i64
        %736 = func.call @cc_nil_value() : () -> i64
        %737 = func.call @cc_errorp(%735) : (i64) -> i64
        %738 = arith.cmpi ne, %737, %736 : i64
        %739 = arith.cmpi eq, %736, %736 : i64
        %740 = arith.andi %738, %739 : i1
        %741 = scf.if %740 -> (i64) {
          scf.yield %735 : i64
        } else {
          scf.yield %736 : i64
        }
        %742 = arith.cmpi ne, %741, %736 : i64
        scf.if %742 {
          func.call @stack_push_pointer(%741) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%735) : (i64) -> ()
          %743 = llvm.mlir.addressof @str69 : !llvm.ptr
          %744 = func.call @cc_make_function_ref_const(%743) : (!llvm.ptr) -> i64
          %745 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%744, %745) : (i64, i64) -> ()
        }
        %746 = func.call @stack_pop_pointer() : () -> i64
        %747 = func.call @cc_nil_value() : () -> i64
        %748 = arith.cmpi ne, %746, %747 : i64
        scf.if %748 {
          %749 = llvm.mlir.addressof @str70 : !llvm.ptr
          %750 = arith.constant 11 : i64
          %751 = func.call @cc_make_string(%749, %750) : (!llvm.ptr, i64) -> i64
          %752 = func.call @cc_nil_value() : () -> i64
          %753 = func.call @cc_intern(%751, %752) : (i64, i64) -> i64
          %754 = func.call @cc_nil_value() : () -> i64
          %755 = func.call @cc_cons(%753, %754) : (i64, i64) -> i64
          %756 = func.call @cc_values_pack(%755) : (i64) -> i64
          func.call @stack_push_pointer(%753) : (i64) -> ()
          %757 = func.call @stack_pop_pointer() : () -> i64
          %758 = func.call @cc_nil_value() : () -> i64
          %759 = func.call @cc_errorp(%757) : (i64) -> i64
          %760 = arith.cmpi ne, %759, %758 : i64
          %761 = arith.cmpi eq, %758, %758 : i64
          %762 = arith.andi %760, %761 : i1
          %763 = scf.if %762 -> (i64) {
            scf.yield %757 : i64
          } else {
            scf.yield %758 : i64
          }
          %764 = arith.cmpi ne, %763, %758 : i64
          scf.if %764 {
            func.call @stack_push_pointer(%763) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%757) : (i64) -> ()
            %765 = llvm.mlir.addressof @str71 : !llvm.ptr
            %766 = func.call @cc_make_function_ref_const(%765) : (!llvm.ptr) -> i64
            %767 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%766, %767) : (i64, i64) -> ()
          }
        } else {
          %768 = llvm.mlir.addressof @str72 : !llvm.ptr
          %769 = arith.constant 11 : i64
          %770 = func.call @cc_make_string(%768, %769) : (!llvm.ptr, i64) -> i64
          %771 = func.call @cc_nil_value() : () -> i64
          %772 = func.call @cc_intern(%770, %771) : (i64, i64) -> i64
          %773 = func.call @cc_nil_value() : () -> i64
          %774 = func.call @cc_cons(%772, %773) : (i64, i64) -> i64
          %775 = func.call @cc_values_pack(%774) : (i64) -> i64
          func.call @stack_push_pointer(%772) : (i64) -> ()
          %776 = func.call @stack_pop_pointer() : () -> i64
          %777 = func.call @cc_nil_value() : () -> i64
          %778 = func.call @cc_errorp(%776) : (i64) -> i64
          %779 = arith.cmpi ne, %778, %777 : i64
          %780 = arith.cmpi eq, %777, %777 : i64
          %781 = arith.andi %779, %780 : i1
          %782 = scf.if %781 -> (i64) {
            scf.yield %776 : i64
          } else {
            scf.yield %777 : i64
          }
          %783 = arith.cmpi ne, %782, %777 : i64
          scf.if %783 {
            func.call @stack_push_pointer(%782) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%776) : (i64) -> ()
            %784 = llvm.mlir.addressof @str73 : !llvm.ptr
            %785 = func.call @cc_make_function_ref_const(%784) : (!llvm.ptr) -> i64
            %786 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%785, %786) : (i64, i64) -> ()
          }
        }
        %787 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %787 : i64
      }
      %788 = func.call @cc_nil_value() : () -> i64
      %789 = func.call @cc_errorp(%726) : (i64) -> i64
      %790 = arith.cmpi ne, %789, %788 : i64
      %791 = scf.if %790 -> (i64) {
        scf.yield %726 : i64
      } else {
        %792 = llvm.mlir.addressof @str74 : !llvm.ptr
        %793 = arith.constant 2 : i64
        %794 = func.call @cc_make_string(%792, %793) : (!llvm.ptr, i64) -> i64
        %795 = func.call @cc_nil_value() : () -> i64
        %796 = func.call @cc_intern(%794, %795) : (i64, i64) -> i64
        %797 = func.call @cc_nil_value() : () -> i64
        %798 = func.call @cc_cons(%796, %797) : (i64, i64) -> i64
        %799 = func.call @cc_values_pack(%798) : (i64) -> i64
        func.call @stack_push_pointer(%796) : (i64) -> ()
        %800 = func.call @stack_pop_pointer() : () -> i64
        %801 = llvm.mlir.addressof @str75 : !llvm.ptr
        %802 = arith.constant 11 : i64
        %803 = func.call @cc_make_string(%801, %802) : (!llvm.ptr, i64) -> i64
        %804 = func.call @cc_nil_value() : () -> i64
        %805 = func.call @cc_intern(%803, %804) : (i64, i64) -> i64
        %806 = func.call @cc_nil_value() : () -> i64
        %807 = func.call @cc_cons(%805, %806) : (i64, i64) -> i64
        %808 = func.call @cc_values_pack(%807) : (i64) -> i64
        func.call @stack_push_pointer(%805) : (i64) -> ()
        %809 = func.call @stack_pop_pointer() : () -> i64
        %810 = func.call @cc_nil_value() : () -> i64
        %811 = func.call @cc_errorp(%800) : (i64) -> i64
        %812 = arith.cmpi ne, %811, %810 : i64
        %813 = arith.cmpi eq, %810, %810 : i64
        %814 = arith.andi %812, %813 : i1
        %815 = scf.if %814 -> (i64) {
          scf.yield %800 : i64
        } else {
          scf.yield %810 : i64
        }
        %816 = func.call @cc_errorp(%809) : (i64) -> i64
        %817 = arith.cmpi ne, %816, %810 : i64
        %818 = arith.cmpi eq, %815, %810 : i64
        %819 = arith.andi %817, %818 : i1
        %820 = scf.if %819 -> (i64) {
          scf.yield %809 : i64
        } else {
          scf.yield %815 : i64
        }
        %821 = arith.cmpi ne, %820, %810 : i64
        scf.if %821 {
          func.call @stack_push_pointer(%820) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%800) : (i64) -> ()
          func.call @stack_push_pointer(%809) : (i64) -> ()
          %822 = llvm.mlir.addressof @str76 : !llvm.ptr
          %823 = func.call @cc_make_function_ref_const(%822) : (!llvm.ptr) -> i64
          %824 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%823, %824) : (i64, i64) -> ()
        }
        %825 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %825 : i64
      }
      %826 = func.call @cc_nil_value() : () -> i64
      %827 = func.call @cc_errorp(%791) : (i64) -> i64
      %828 = arith.cmpi ne, %827, %826 : i64
      %829 = scf.if %828 -> (i64) {
        scf.yield %791 : i64
      } else {
        %830 = llvm.mlir.addressof @str77 : !llvm.ptr
        %831 = arith.constant 11 : i64
        %832 = func.call @cc_make_string(%830, %831) : (!llvm.ptr, i64) -> i64
        %833 = func.call @cc_nil_value() : () -> i64
        %834 = func.call @cc_intern(%832, %833) : (i64, i64) -> i64
        %835 = func.call @cc_nil_value() : () -> i64
        %836 = func.call @cc_cons(%834, %835) : (i64, i64) -> i64
        %837 = func.call @cc_values_pack(%836) : (i64) -> i64
        func.call @stack_push_pointer(%834) : (i64) -> ()
        %838 = func.call @stack_pop_pointer() : () -> i64
        %839 = func.call @cc_nil_value() : () -> i64
        %840 = func.call @cc_errorp(%838) : (i64) -> i64
        %841 = arith.cmpi ne, %840, %839 : i64
        %842 = arith.cmpi eq, %839, %839 : i64
        %843 = arith.andi %841, %842 : i1
        %844 = scf.if %843 -> (i64) {
          scf.yield %838 : i64
        } else {
          scf.yield %839 : i64
        }
        %845 = arith.cmpi ne, %844, %839 : i64
        scf.if %845 {
          func.call @stack_push_pointer(%844) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%838) : (i64) -> ()
          %846 = llvm.mlir.addressof @str78 : !llvm.ptr
          %847 = func.call @cc_make_function_ref_const(%846) : (!llvm.ptr) -> i64
          %848 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%847, %848) : (i64, i64) -> ()
        }
        %849 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %849 : i64
      }
      func.call @stack_push_pointer(%829) : (i64) -> ()
      %850 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %850 : i64
    }
    %851 = func.call @cc_nil_value() : () -> i64
    %852 = func.call @cc_errorp(%721) : (i64) -> i64
    %853 = arith.cmpi ne, %852, %851 : i64
    %854 = scf.if %853 -> (i64) {
      scf.yield %721 : i64
    } else {
      %855 = llvm.mlir.addressof @str79 : !llvm.ptr
      %856 = arith.constant 11 : i64
      %857 = func.call @cc_make_string(%855, %856) : (!llvm.ptr, i64) -> i64
      %858 = func.call @cc_nil_value() : () -> i64
      %859 = func.call @cc_intern(%857, %858) : (i64, i64) -> i64
      %860 = func.call @cc_nil_value() : () -> i64
      %861 = func.call @cc_cons(%859, %860) : (i64, i64) -> i64
      %862 = func.call @cc_values_pack(%861) : (i64) -> i64
      func.call @stack_push_pointer(%859) : (i64) -> ()
      %863 = func.call @stack_pop_pointer() : () -> i64
      %864 = func.call @cc_in_package(%863) : (i64) -> i64
      func.call @stack_push_pointer(%864) : (i64) -> ()
      %865 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %865 : i64
    }
    %866 = func.call @cc_nil_value() : () -> i64
    %867 = func.call @cc_errorp(%854) : (i64) -> i64
    %868 = arith.cmpi ne, %867, %866 : i64
    %869 = scf.if %868 -> (i64) {
      scf.yield %854 : i64
    } else {
      %870 = llvm.mlir.addressof @str80 : !llvm.ptr
      %871 = func.call @cc_make_function_ref_const(%870) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%871) : (i64) -> ()
      %872 = func.call @stack_pop_pointer() : () -> i64
      %873 = llvm.mlir.addressof @str81 : !llvm.ptr
      %874 = arith.constant 17 : i64
      %875 = func.call @cc_make_string(%873, %874) : (!llvm.ptr, i64) -> i64
      %876 = llvm.mlir.addressof @str82 : !llvm.ptr
      %877 = arith.constant 15 : i64
      %878 = func.call @cc_make_string(%876, %877) : (!llvm.ptr, i64) -> i64
      %879 = func.call @cc_intern(%875, %878) : (i64, i64) -> i64
      %880 = func.call @cc_nil_value() : () -> i64
      %881 = func.call @cc_cons(%879, %880) : (i64, i64) -> i64
      %882 = func.call @cc_values_pack(%881) : (i64) -> i64
      %883 = func.call @cc_set_symbol_value(%879, %872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%872) : (i64) -> ()
      %884 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %884 : i64
    }
    %885 = func.call @cc_nil_value() : () -> i64
    %886 = func.call @cc_errorp(%869) : (i64) -> i64
    %887 = arith.cmpi ne, %886, %885 : i64
    %888 = scf.if %887 -> (i64) {
      scf.yield %869 : i64
    } else {
      %889 = llvm.mlir.addressof @str83 : !llvm.ptr
      %890 = func.call @cc_make_function_ref_const(%889) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%890) : (i64) -> ()
      %891 = func.call @stack_pop_pointer() : () -> i64
      %892 = llvm.mlir.addressof @str84 : !llvm.ptr
      %893 = arith.constant 17 : i64
      %894 = func.call @cc_make_string(%892, %893) : (!llvm.ptr, i64) -> i64
      %895 = llvm.mlir.addressof @str85 : !llvm.ptr
      %896 = arith.constant 15 : i64
      %897 = func.call @cc_make_string(%895, %896) : (!llvm.ptr, i64) -> i64
      %898 = func.call @cc_intern(%894, %897) : (i64, i64) -> i64
      %899 = func.call @cc_nil_value() : () -> i64
      %900 = func.call @cc_cons(%898, %899) : (i64, i64) -> i64
      %901 = func.call @cc_values_pack(%900) : (i64) -> i64
      %902 = func.call @cc_set_symbol_value(%898, %891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%891) : (i64) -> ()
      %903 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %903 : i64
    }
    %904 = func.call @cc_nil_value() : () -> i64
    %905 = func.call @cc_errorp(%888) : (i64) -> i64
    %906 = arith.cmpi ne, %905, %904 : i64
    %907 = scf.if %906 -> (i64) {
      scf.yield %888 : i64
    } else {
      %908 = llvm.mlir.addressof @str86 : !llvm.ptr
      %909 = func.call @cc_make_function_ref_const(%908) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%909) : (i64) -> ()
      %910 = func.call @stack_pop_pointer() : () -> i64
      %911 = llvm.mlir.addressof @str87 : !llvm.ptr
      %912 = arith.constant 17 : i64
      %913 = func.call @cc_make_string(%911, %912) : (!llvm.ptr, i64) -> i64
      %914 = llvm.mlir.addressof @str88 : !llvm.ptr
      %915 = arith.constant 15 : i64
      %916 = func.call @cc_make_string(%914, %915) : (!llvm.ptr, i64) -> i64
      %917 = func.call @cc_intern(%913, %916) : (i64, i64) -> i64
      %918 = func.call @cc_nil_value() : () -> i64
      %919 = func.call @cc_cons(%917, %918) : (i64, i64) -> i64
      %920 = func.call @cc_values_pack(%919) : (i64) -> i64
      %921 = func.call @cc_set_symbol_value(%917, %910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%910) : (i64) -> ()
      %922 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %922 : i64
    }
    %923 = func.call @cc_nil_value() : () -> i64
    %924 = func.call @cc_errorp(%907) : (i64) -> i64
    %925 = arith.cmpi ne, %924, %923 : i64
    %926 = scf.if %925 -> (i64) {
      scf.yield %907 : i64
    } else {
      %927 = llvm.mlir.addressof @str89 : !llvm.ptr
      %928 = func.call @cc_make_function_ref_const(%927) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%928) : (i64) -> ()
      %929 = func.call @stack_pop_pointer() : () -> i64
      %930 = llvm.mlir.addressof @str90 : !llvm.ptr
      %931 = arith.constant 17 : i64
      %932 = func.call @cc_make_string(%930, %931) : (!llvm.ptr, i64) -> i64
      %933 = llvm.mlir.addressof @str91 : !llvm.ptr
      %934 = arith.constant 15 : i64
      %935 = func.call @cc_make_string(%933, %934) : (!llvm.ptr, i64) -> i64
      %936 = func.call @cc_intern(%932, %935) : (i64, i64) -> i64
      %937 = func.call @cc_nil_value() : () -> i64
      %938 = func.call @cc_cons(%936, %937) : (i64, i64) -> i64
      %939 = func.call @cc_values_pack(%938) : (i64) -> i64
      %940 = func.call @cc_set_symbol_value(%936, %929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%929) : (i64) -> ()
      %941 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %941 : i64
    }
    %942 = func.call @cc_nil_value() : () -> i64
    %943 = func.call @cc_errorp(%926) : (i64) -> i64
    %944 = arith.cmpi ne, %943, %942 : i64
    %945 = scf.if %944 -> (i64) {
      scf.yield %926 : i64
    } else {
      %946 = llvm.mlir.addressof @str92 : !llvm.ptr
      %947 = func.call @cc_make_function_ref_const(%946) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%947) : (i64) -> ()
      %948 = func.call @stack_pop_pointer() : () -> i64
      %949 = llvm.mlir.addressof @str93 : !llvm.ptr
      %950 = arith.constant 28 : i64
      %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
      %952 = llvm.mlir.addressof @str94 : !llvm.ptr
      %953 = arith.constant 15 : i64
      %954 = func.call @cc_make_string(%952, %953) : (!llvm.ptr, i64) -> i64
      %955 = func.call @cc_intern(%951, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      %959 = func.call @cc_set_symbol_value(%955, %948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%948) : (i64) -> ()
      %960 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %960 : i64
    }
    %961 = func.call @cc_nil_value() : () -> i64
    %962 = func.call @cc_errorp(%945) : (i64) -> i64
    %963 = arith.cmpi ne, %962, %961 : i64
    %964 = scf.if %963 -> (i64) {
      scf.yield %945 : i64
    } else {
      %965 = llvm.mlir.addressof @str95 : !llvm.ptr
      %966 = func.call @cc_make_function_ref_const(%965) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%966) : (i64) -> ()
      %967 = func.call @stack_pop_pointer() : () -> i64
      %968 = llvm.mlir.addressof @str96 : !llvm.ptr
      %969 = arith.constant 28 : i64
      %970 = func.call @cc_make_string(%968, %969) : (!llvm.ptr, i64) -> i64
      %971 = llvm.mlir.addressof @str97 : !llvm.ptr
      %972 = arith.constant 15 : i64
      %973 = func.call @cc_make_string(%971, %972) : (!llvm.ptr, i64) -> i64
      %974 = func.call @cc_intern(%970, %973) : (i64, i64) -> i64
      %975 = func.call @cc_nil_value() : () -> i64
      %976 = func.call @cc_cons(%974, %975) : (i64, i64) -> i64
      %977 = func.call @cc_values_pack(%976) : (i64) -> i64
      %978 = func.call @cc_set_symbol_value(%974, %967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%967) : (i64) -> ()
      %979 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %979 : i64
    }
    %980 = func.call @cc_nil_value() : () -> i64
    %981 = func.call @cc_errorp(%964) : (i64) -> i64
    %982 = arith.cmpi ne, %981, %980 : i64
    %983 = scf.if %982 -> (i64) {
      scf.yield %964 : i64
    } else {
      %984 = llvm.mlir.addressof @str98 : !llvm.ptr
      %985 = func.call @cc_make_function_ref_const(%984) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%985) : (i64) -> ()
      %986 = func.call @stack_pop_pointer() : () -> i64
      %987 = llvm.mlir.addressof @str99 : !llvm.ptr
      %988 = arith.constant 28 : i64
      %989 = func.call @cc_make_string(%987, %988) : (!llvm.ptr, i64) -> i64
      %990 = llvm.mlir.addressof @str100 : !llvm.ptr
      %991 = arith.constant 15 : i64
      %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
      %993 = func.call @cc_intern(%989, %992) : (i64, i64) -> i64
      %994 = func.call @cc_nil_value() : () -> i64
      %995 = func.call @cc_cons(%993, %994) : (i64, i64) -> i64
      %996 = func.call @cc_values_pack(%995) : (i64) -> i64
      %997 = func.call @cc_set_symbol_value(%993, %986) : (i64, i64) -> i64
      func.call @stack_push_pointer(%986) : (i64) -> ()
      %998 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %998 : i64
    }
    %999 = func.call @cc_nil_value() : () -> i64
    %1000 = func.call @cc_errorp(%983) : (i64) -> i64
    %1001 = arith.cmpi ne, %1000, %999 : i64
    %1002 = scf.if %1001 -> (i64) {
      scf.yield %983 : i64
    } else {
      %1003 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1004 = func.call @cc_make_function_ref_const(%1003) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1004) : (i64) -> ()
      %1005 = func.call @stack_pop_pointer() : () -> i64
      %1006 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1007 = arith.constant 28 : i64
      %1008 = func.call @cc_make_string(%1006, %1007) : (!llvm.ptr, i64) -> i64
      %1009 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1010 = arith.constant 15 : i64
      %1011 = func.call @cc_make_string(%1009, %1010) : (!llvm.ptr, i64) -> i64
      %1012 = func.call @cc_intern(%1008, %1011) : (i64, i64) -> i64
      %1013 = func.call @cc_nil_value() : () -> i64
      %1014 = func.call @cc_cons(%1012, %1013) : (i64, i64) -> i64
      %1015 = func.call @cc_values_pack(%1014) : (i64) -> i64
      %1016 = func.call @cc_set_symbol_value(%1012, %1005) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      %1017 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1017 : i64
    }
    %1018 = func.call @cc_nil_value() : () -> i64
    %1019 = func.call @cc_errorp(%1002) : (i64) -> i64
    %1020 = arith.cmpi ne, %1019, %1018 : i64
    %1021 = scf.if %1020 -> (i64) {
      scf.yield %1002 : i64
    } else {
      %1022 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1022) : (i64) -> ()
      %1023 = func.call @stack_pop_pointer() : () -> i64
      %1024 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1025 = arith.constant 35 : i64
      %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1026) : (i64) -> ()
      %1027 = func.call @stack_pop_pointer() : () -> i64
      %1028 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1029 = arith.constant 18 : i64
      %1030 = func.call @cc_make_string(%1028, %1029) : (!llvm.ptr, i64) -> i64
      %1031 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1032 = arith.constant 4 : i64
      %1033 = func.call @cc_make_string(%1031, %1032) : (!llvm.ptr, i64) -> i64
      %1034 = func.call @cc_intern(%1030, %1033) : (i64, i64) -> i64
      %1035 = func.call @cc_nil_value() : () -> i64
      %1036 = func.call @cc_cons(%1034, %1035) : (i64, i64) -> i64
      %1037 = func.call @cc_values_pack(%1036) : (i64) -> i64
      func.call @stack_push_pointer(%1034) : (i64) -> ()
      %1038 = func.call @stack_pop_pointer() : () -> i64
      %1039 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1040 = arith.constant 8 : i64
      %1041 = func.call @cc_make_string(%1039, %1040) : (!llvm.ptr, i64) -> i64
      %1042 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1043 = arith.constant 11 : i64
      %1044 = func.call @cc_make_string(%1042, %1043) : (!llvm.ptr, i64) -> i64
      %1045 = func.call @cc_intern(%1041, %1044) : (i64, i64) -> i64
      %1046 = func.call @cc_nil_value() : () -> i64
      %1047 = func.call @cc_cons(%1045, %1046) : (i64, i64) -> i64
      %1048 = func.call @cc_values_pack(%1047) : (i64) -> i64
      func.call @stack_push_pointer(%1045) : (i64) -> ()
      %1049 = func.call @stack_pop_pointer() : () -> i64
      %1050 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1050) : (i64) -> ()
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = func.call @cc_nil_value() : () -> i64
      %1053 = func.call @cc_errorp(%1038) : (i64) -> i64
      %1054 = arith.cmpi ne, %1053, %1052 : i64
      %1055 = arith.cmpi eq, %1052, %1052 : i64
      %1056 = arith.andi %1054, %1055 : i1
      %1057 = scf.if %1056 -> (i64) {
        scf.yield %1038 : i64
      } else {
        scf.yield %1052 : i64
      }
      %1058 = func.call @cc_errorp(%1049) : (i64) -> i64
      %1059 = arith.cmpi ne, %1058, %1052 : i64
      %1060 = arith.cmpi eq, %1057, %1052 : i64
      %1061 = arith.andi %1059, %1060 : i1
      %1062 = scf.if %1061 -> (i64) {
        scf.yield %1049 : i64
      } else {
        scf.yield %1057 : i64
      }
      %1063 = func.call @cc_errorp(%1051) : (i64) -> i64
      %1064 = arith.cmpi ne, %1063, %1052 : i64
      %1065 = arith.cmpi eq, %1062, %1052 : i64
      %1066 = arith.andi %1064, %1065 : i1
      %1067 = scf.if %1066 -> (i64) {
        scf.yield %1051 : i64
      } else {
        scf.yield %1062 : i64
      }
      %1068 = arith.cmpi ne, %1067, %1052 : i64
      scf.if %1068 {
        func.call @stack_push_pointer(%1067) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1038) : (i64) -> ()
        func.call @stack_push_pointer(%1049) : (i64) -> ()
        func.call @stack_push_pointer(%1051) : (i64) -> ()
        %1069 = llvm.mlir.addressof @str109 : !llvm.ptr
        %1070 = func.call @cc_make_function_ref_const(%1069) : (!llvm.ptr) -> i64
        %1071 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1070, %1071) : (i64, i64) -> ()
      }
      %1072 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1023) : (i64) -> ()
      func.call @stack_push_pointer(%1027) : (i64) -> ()
      func.call @stack_push_pointer(%1072) : (i64) -> ()
      %1073 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1074 = func.call @cc_make_function_ref_const(%1073) : (!llvm.ptr) -> i64
      %1075 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1074, %1075) : (i64, i64) -> ()
      %1076 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1076 : i64
    }
    %1077 = func.call @cc_nil_value() : () -> i64
    %1078 = func.call @cc_errorp(%1021) : (i64) -> i64
    %1079 = arith.cmpi ne, %1078, %1077 : i64
    %1080 = scf.if %1079 -> (i64) {
      scf.yield %1021 : i64
    } else {
      %1081 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1082 = func.call @stack_pop_pointer() : () -> i64
      %1083 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1084 = arith.constant 31 : i64
      %1085 = func.call @cc_make_string(%1083, %1084) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1085) : (i64) -> ()
      %1086 = func.call @stack_pop_pointer() : () -> i64
      %1087 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1088 = arith.constant 18 : i64
      %1089 = func.call @cc_make_string(%1087, %1088) : (!llvm.ptr, i64) -> i64
      %1090 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1091 = arith.constant 4 : i64
      %1092 = func.call @cc_make_string(%1090, %1091) : (!llvm.ptr, i64) -> i64
      %1093 = func.call @cc_intern(%1089, %1092) : (i64, i64) -> i64
      %1094 = func.call @cc_nil_value() : () -> i64
      %1095 = func.call @cc_cons(%1093, %1094) : (i64, i64) -> i64
      %1096 = func.call @cc_values_pack(%1095) : (i64) -> i64
      func.call @stack_push_pointer(%1093) : (i64) -> ()
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1099 = arith.constant 4 : i64
      %1100 = func.call @cc_make_string(%1098, %1099) : (!llvm.ptr, i64) -> i64
      %1101 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1102 = arith.constant 11 : i64
      %1103 = func.call @cc_make_string(%1101, %1102) : (!llvm.ptr, i64) -> i64
      %1104 = func.call @cc_intern(%1100, %1103) : (i64, i64) -> i64
      %1105 = func.call @cc_nil_value() : () -> i64
      %1106 = func.call @cc_cons(%1104, %1105) : (i64, i64) -> i64
      %1107 = func.call @cc_values_pack(%1106) : (i64) -> i64
      func.call @stack_push_pointer(%1104) : (i64) -> ()
      %1108 = func.call @stack_pop_pointer() : () -> i64
      %1109 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1109) : (i64) -> ()
      %1110 = func.call @stack_pop_pointer() : () -> i64
      %1111 = func.call @cc_nil_value() : () -> i64
      %1112 = func.call @cc_errorp(%1097) : (i64) -> i64
      %1113 = arith.cmpi ne, %1112, %1111 : i64
      %1114 = arith.cmpi eq, %1111, %1111 : i64
      %1115 = arith.andi %1113, %1114 : i1
      %1116 = scf.if %1115 -> (i64) {
        scf.yield %1097 : i64
      } else {
        scf.yield %1111 : i64
      }
      %1117 = func.call @cc_errorp(%1108) : (i64) -> i64
      %1118 = arith.cmpi ne, %1117, %1111 : i64
      %1119 = arith.cmpi eq, %1116, %1111 : i64
      %1120 = arith.andi %1118, %1119 : i1
      %1121 = scf.if %1120 -> (i64) {
        scf.yield %1108 : i64
      } else {
        scf.yield %1116 : i64
      }
      %1122 = func.call @cc_errorp(%1110) : (i64) -> i64
      %1123 = arith.cmpi ne, %1122, %1111 : i64
      %1124 = arith.cmpi eq, %1121, %1111 : i64
      %1125 = arith.andi %1123, %1124 : i1
      %1126 = scf.if %1125 -> (i64) {
        scf.yield %1110 : i64
      } else {
        scf.yield %1121 : i64
      }
      %1127 = arith.cmpi ne, %1126, %1111 : i64
      scf.if %1127 {
        func.call @stack_push_pointer(%1126) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1097) : (i64) -> ()
        func.call @stack_push_pointer(%1108) : (i64) -> ()
        func.call @stack_push_pointer(%1110) : (i64) -> ()
        %1128 = llvm.mlir.addressof @str116 : !llvm.ptr
        %1129 = func.call @cc_make_function_ref_const(%1128) : (!llvm.ptr) -> i64
        %1130 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1129, %1130) : (i64, i64) -> ()
      }
      %1131 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1082) : (i64) -> ()
      func.call @stack_push_pointer(%1086) : (i64) -> ()
      func.call @stack_push_pointer(%1131) : (i64) -> ()
      %1132 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1133 = func.call @cc_make_function_ref_const(%1132) : (!llvm.ptr) -> i64
      %1134 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1133, %1134) : (i64, i64) -> ()
      %1135 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1135 : i64
    }
    %1136 = func.call @cc_nil_value() : () -> i64
    %1137 = func.call @cc_errorp(%1080) : (i64) -> i64
    %1138 = arith.cmpi ne, %1137, %1136 : i64
    %1139 = scf.if %1138 -> (i64) {
      scf.yield %1080 : i64
    } else {
      %1140 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1140) : (i64) -> ()
      %1141 = func.call @stack_pop_pointer() : () -> i64
      %1142 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1143 = arith.constant 20 : i64
      %1144 = func.call @cc_make_string(%1142, %1143) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1144) : (i64) -> ()
      %1145 = func.call @stack_pop_pointer() : () -> i64
      %1146 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1147 = arith.constant 3 : i64
      %1148 = func.call @cc_make_string(%1146, %1147) : (!llvm.ptr, i64) -> i64
      %1149 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1150 = arith.constant 2 : i64
      %1151 = func.call @cc_make_string(%1149, %1150) : (!llvm.ptr, i64) -> i64
      %1152 = func.call @cc_intern(%1148, %1151) : (i64, i64) -> i64
      %1153 = func.call @cc_nil_value() : () -> i64
      %1154 = func.call @cc_cons(%1152, %1153) : (i64, i64) -> i64
      %1155 = func.call @cc_values_pack(%1154) : (i64) -> i64
      func.call @stack_push_pointer(%1152) : (i64) -> ()
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1158 = arith.constant 8 : i64
      %1159 = func.call @cc_make_string(%1157, %1158) : (!llvm.ptr, i64) -> i64
      %1160 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1161 = arith.constant 11 : i64
      %1162 = func.call @cc_make_string(%1160, %1161) : (!llvm.ptr, i64) -> i64
      %1163 = func.call @cc_intern(%1159, %1162) : (i64, i64) -> i64
      %1164 = func.call @cc_nil_value() : () -> i64
      %1165 = func.call @cc_cons(%1163, %1164) : (i64, i64) -> i64
      %1166 = func.call @cc_values_pack(%1165) : (i64) -> i64
      func.call @stack_push_pointer(%1163) : (i64) -> ()
      %1167 = func.call @stack_pop_pointer() : () -> i64
      %1168 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1168) : (i64) -> ()
      %1169 = func.call @stack_pop_pointer() : () -> i64
      %1170 = func.call @cc_nil_value() : () -> i64
      %1171 = func.call @cc_errorp(%1156) : (i64) -> i64
      %1172 = arith.cmpi ne, %1171, %1170 : i64
      %1173 = arith.cmpi eq, %1170, %1170 : i64
      %1174 = arith.andi %1172, %1173 : i1
      %1175 = scf.if %1174 -> (i64) {
        scf.yield %1156 : i64
      } else {
        scf.yield %1170 : i64
      }
      %1176 = func.call @cc_errorp(%1167) : (i64) -> i64
      %1177 = arith.cmpi ne, %1176, %1170 : i64
      %1178 = arith.cmpi eq, %1175, %1170 : i64
      %1179 = arith.andi %1177, %1178 : i1
      %1180 = scf.if %1179 -> (i64) {
        scf.yield %1167 : i64
      } else {
        scf.yield %1175 : i64
      }
      %1181 = func.call @cc_errorp(%1169) : (i64) -> i64
      %1182 = arith.cmpi ne, %1181, %1170 : i64
      %1183 = arith.cmpi eq, %1180, %1170 : i64
      %1184 = arith.andi %1182, %1183 : i1
      %1185 = scf.if %1184 -> (i64) {
        scf.yield %1169 : i64
      } else {
        scf.yield %1180 : i64
      }
      %1186 = arith.cmpi ne, %1185, %1170 : i64
      scf.if %1186 {
        func.call @stack_push_pointer(%1185) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1156) : (i64) -> ()
        func.call @stack_push_pointer(%1167) : (i64) -> ()
        func.call @stack_push_pointer(%1169) : (i64) -> ()
        %1187 = llvm.mlir.addressof @str123 : !llvm.ptr
        %1188 = func.call @cc_make_function_ref_const(%1187) : (!llvm.ptr) -> i64
        %1189 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1188, %1189) : (i64, i64) -> ()
      }
      %1190 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1141) : (i64) -> ()
      func.call @stack_push_pointer(%1145) : (i64) -> ()
      func.call @stack_push_pointer(%1190) : (i64) -> ()
      %1191 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1192 = func.call @cc_make_function_ref_const(%1191) : (!llvm.ptr) -> i64
      %1193 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1192, %1193) : (i64, i64) -> ()
      %1194 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1194 : i64
    }
    %1195 = func.call @cc_nil_value() : () -> i64
    %1196 = func.call @cc_errorp(%1139) : (i64) -> i64
    %1197 = arith.cmpi ne, %1196, %1195 : i64
    %1198 = scf.if %1197 -> (i64) {
      scf.yield %1139 : i64
    } else {
      %1199 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1199) : (i64) -> ()
      %1200 = func.call @stack_pop_pointer() : () -> i64
      %1201 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1202 = arith.constant 16 : i64
      %1203 = func.call @cc_make_string(%1201, %1202) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1203) : (i64) -> ()
      %1204 = func.call @stack_pop_pointer() : () -> i64
      %1205 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1206 = arith.constant 3 : i64
      %1207 = func.call @cc_make_string(%1205, %1206) : (!llvm.ptr, i64) -> i64
      %1208 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1209 = arith.constant 2 : i64
      %1210 = func.call @cc_make_string(%1208, %1209) : (!llvm.ptr, i64) -> i64
      %1211 = func.call @cc_intern(%1207, %1210) : (i64, i64) -> i64
      %1212 = func.call @cc_nil_value() : () -> i64
      %1213 = func.call @cc_cons(%1211, %1212) : (i64, i64) -> i64
      %1214 = func.call @cc_values_pack(%1213) : (i64) -> i64
      func.call @stack_push_pointer(%1211) : (i64) -> ()
      %1215 = func.call @stack_pop_pointer() : () -> i64
      %1216 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1217 = arith.constant 4 : i64
      %1218 = func.call @cc_make_string(%1216, %1217) : (!llvm.ptr, i64) -> i64
      %1219 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1220 = arith.constant 11 : i64
      %1221 = func.call @cc_make_string(%1219, %1220) : (!llvm.ptr, i64) -> i64
      %1222 = func.call @cc_intern(%1218, %1221) : (i64, i64) -> i64
      %1223 = func.call @cc_nil_value() : () -> i64
      %1224 = func.call @cc_cons(%1222, %1223) : (i64, i64) -> i64
      %1225 = func.call @cc_values_pack(%1224) : (i64) -> i64
      func.call @stack_push_pointer(%1222) : (i64) -> ()
      %1226 = func.call @stack_pop_pointer() : () -> i64
      %1227 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1227) : (i64) -> ()
      %1228 = func.call @stack_pop_pointer() : () -> i64
      %1229 = func.call @cc_nil_value() : () -> i64
      %1230 = func.call @cc_errorp(%1215) : (i64) -> i64
      %1231 = arith.cmpi ne, %1230, %1229 : i64
      %1232 = arith.cmpi eq, %1229, %1229 : i64
      %1233 = arith.andi %1231, %1232 : i1
      %1234 = scf.if %1233 -> (i64) {
        scf.yield %1215 : i64
      } else {
        scf.yield %1229 : i64
      }
      %1235 = func.call @cc_errorp(%1226) : (i64) -> i64
      %1236 = arith.cmpi ne, %1235, %1229 : i64
      %1237 = arith.cmpi eq, %1234, %1229 : i64
      %1238 = arith.andi %1236, %1237 : i1
      %1239 = scf.if %1238 -> (i64) {
        scf.yield %1226 : i64
      } else {
        scf.yield %1234 : i64
      }
      %1240 = func.call @cc_errorp(%1228) : (i64) -> i64
      %1241 = arith.cmpi ne, %1240, %1229 : i64
      %1242 = arith.cmpi eq, %1239, %1229 : i64
      %1243 = arith.andi %1241, %1242 : i1
      %1244 = scf.if %1243 -> (i64) {
        scf.yield %1228 : i64
      } else {
        scf.yield %1239 : i64
      }
      %1245 = arith.cmpi ne, %1244, %1229 : i64
      scf.if %1245 {
        func.call @stack_push_pointer(%1244) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1215) : (i64) -> ()
        func.call @stack_push_pointer(%1226) : (i64) -> ()
        func.call @stack_push_pointer(%1228) : (i64) -> ()
        %1246 = llvm.mlir.addressof @str130 : !llvm.ptr
        %1247 = func.call @cc_make_function_ref_const(%1246) : (!llvm.ptr) -> i64
        %1248 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1247, %1248) : (i64, i64) -> ()
      }
      %1249 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1200) : (i64) -> ()
      func.call @stack_push_pointer(%1204) : (i64) -> ()
      func.call @stack_push_pointer(%1249) : (i64) -> ()
      %1250 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1251 = func.call @cc_make_function_ref_const(%1250) : (!llvm.ptr) -> i64
      %1252 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1251, %1252) : (i64, i64) -> ()
      %1253 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1253 : i64
    }
    func.call @stack_push_pointer(%1198) : (i64) -> ()
    %1254 = func.call @stack_pop_pointer() : () -> i64
    %1255 = func.call @cc_multiple_value_list(%1254) : (i64) -> i64
    %1256 = llvm.mlir.addressof @str132 : !llvm.ptr
    %1257 = arith.constant 38 : i64
    %1258 = func.call @cc_make_string(%1256, %1257) : (!llvm.ptr, i64) -> i64
    %1259 = func.call @cc_nil_value() : () -> i64
    %1260 = func.call @cc_intern(%1258, %1259) : (i64, i64) -> i64
    %1261 = func.call @cc_nil_value() : () -> i64
    %1262 = func.call @cc_cons(%1260, %1261) : (i64, i64) -> i64
    %1263 = func.call @cc_values_pack(%1262) : (i64) -> i64
    %1264 = func.call @cc_symbol_value(%1260) : (i64) -> i64
    %1265 = llvm.mlir.addressof @str133 : !llvm.ptr
    %1266 = arith.constant 40 : i64
    %1267 = func.call @cc_make_string(%1265, %1266) : (!llvm.ptr, i64) -> i64
    %1268 = func.call @cc_nil_value() : () -> i64
    %1269 = func.call @cc_intern(%1267, %1268) : (i64, i64) -> i64
    %1270 = func.call @cc_nil_value() : () -> i64
    %1271 = func.call @cc_cons(%1269, %1270) : (i64, i64) -> i64
    %1272 = func.call @cc_values_pack(%1271) : (i64) -> i64
    %1273 = func.call @cc_symbol_value(%1269) : (i64) -> i64
    %1274 = func.call @cc_nil_value() : () -> i64
    %1275 = arith.cmpi ne, %1264, %1274 : i64
    %1276 = scf.if %1275 -> (i64) {
      scf.yield %1273 : i64
    } else {
      scf.yield %1255 : i64
    }
    %1277 = func.call @cc_values_pack(%1276) : (i64) -> i64
    func.call @stack_push_pointer(%1277) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FOO-TEST-DESCRIBE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1("a\0Ab\0Ac\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_219606274801664*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_219606274801664*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_219606274801664*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_219606274801665*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_219606274801665*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_219606274801665*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str8("to test describe\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETFLAG_219606274801665*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETVALUE_219606274801665*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETMVLIST_219606274801665*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETFLAG_219606274801664*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETMVLIST_219606274801664*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str14("TEST-DOCUMENTATION-WITH-ARGS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str15("object\0Adoc-category\0Arequiredp\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str16("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETFLAG_219606274801666*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETVALUE_219606274801666*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETMVLIST_219606274801666*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETFLAG_219606274801667*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETVALUE_219606274801667*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETMVLIST_219606274801667*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str24("DOCUMENTATION\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str25("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str26("ext:function-lambda-list\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str27("~&object=~s doc-category=~s~%\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str28("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str29("doc=~s~%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str30("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("args=~s~%\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str32("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str33("arg-string=~s~%\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str34("ESCAPE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("READABLY\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str37("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("WRITE-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str39("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("describe=~s~%\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str41("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str42("doc-search=~s args-search=~s~%\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str43("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str44("ESCAPE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str45("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str46("READABLY\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str47("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str48("WRITE-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str49("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str51("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str52("ESCAPE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("READABLY\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("WRITE-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str57("SEARCH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str58("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str59("*__MLIR_BLOCK_RETFLAG_219606274801667*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str60("*__MLIR_BLOCK_RETVALUE_219606274801667*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str61("*__MLIR_BLOCK_RETMVLIST_219606274801667*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str62("*__MLIR_BLOCK_RETFLAG_219606274801666*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str63("*__MLIR_BLOCK_RETMVLIST_219606274801666*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str64("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str65("*__MLIR_BLOCK_RETFLAG_219606274801668*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str66("*__MLIR_BLOCK_RETVALUE_219606274801668*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETMVLIST_219606274801668*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str68("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str70("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str72("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str74("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str75("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str77("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str79("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("%FN%foo-test-describe\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str81("FOO-TEST-DESCRIBE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str82("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str83("%FN%foo-test-describe\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str84("FOO-TEST-DESCRIBE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str85("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str86("%FN%foo-test-describe\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str87("FOO-TEST-DESCRIBE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str88("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str89("%FN%foo-test-describe\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str90("FOO-TEST-DESCRIBE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str91("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str92("%FN%test-documentation-with-args\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str93("TEST-DOCUMENTATION-WITH-ARGS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str94("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str95("%FN%test-documentation-with-args\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str96("TEST-DOCUMENTATION-WITH-ARGS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str97("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str98("%FN%test-documentation-with-args\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str99("TEST-DOCUMENTATION-WITH-ARGS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str100("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str101("%FN%test-documentation-with-args\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str102("TEST-DOCUMENTATION-WITH-ARGS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str103("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str104("function-docstring/function => ~s~%\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str105("FUNCTION-DOCSTRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str106("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str107("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str108("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("%FN%test-documentation-with-args\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str110("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str111("function-docstring/setf => ~s~%\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str112("FUNCTION-DOCSTRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str113("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str114("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("%FN%test-documentation-with-args\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str117("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str118("car/function => ~s~%\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str119("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str120("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str121("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str122("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("%FN%test-documentation-with-args\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str124("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str125("car/setf => ~s~%\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str126("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str127("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str128("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str129("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("%FN%test-documentation-with-args\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str131("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str132("*__MLIR_BLOCK_RETFLAG_219606274801668*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str133("*__MLIR_BLOCK_RETMVLIST_219606274801668*\00") : !llvm.array<41 x i8>
  llvm.mlir.global constant @__argslist_functions("%FN%test-documentation-with-args\00%FN%test-documentation-with-args\00\00") : !llvm.array<67 x i8>
}
