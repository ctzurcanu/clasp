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
  func.func @"%FN%semaphore-p"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 11 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 6 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %12) : (i64, i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @cc_nil_value() : () -> i64
    %15 = llvm.mlir.addressof @str2 : !llvm.ptr
    %16 = arith.constant 38 : i64
    %17 = func.call @cc_make_string(%15, %16) : (!llvm.ptr, i64) -> i64
    %18 = func.call @cc_nil_value() : () -> i64
    %19 = func.call @cc_intern(%17, %18) : (i64, i64) -> i64
    %20 = func.call @cc_nil_value() : () -> i64
    %21 = func.call @cc_cons(%19, %20) : (i64, i64) -> i64
    %22 = func.call @cc_values_pack(%21) : (i64) -> i64
    %23 = func.call @cc_set_symbol_value(%19, %14) : (i64, i64) -> i64
    %24 = llvm.mlir.addressof @str3 : !llvm.ptr
    %25 = arith.constant 39 : i64
    %26 = func.call @cc_make_string(%24, %25) : (!llvm.ptr, i64) -> i64
    %27 = func.call @cc_nil_value() : () -> i64
    %28 = func.call @cc_intern(%26, %27) : (i64, i64) -> i64
    %29 = func.call @cc_nil_value() : () -> i64
    %30 = func.call @cc_cons(%28, %29) : (i64, i64) -> i64
    %31 = func.call @cc_values_pack(%30) : (i64) -> i64
    %32 = func.call @cc_set_symbol_value(%28, %14) : (i64, i64) -> i64
    %33 = llvm.mlir.addressof @str4 : !llvm.ptr
    %34 = arith.constant 40 : i64
    %35 = func.call @cc_make_string(%33, %34) : (!llvm.ptr, i64) -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_intern(%35, %36) : (i64, i64) -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_cons(%37, %38) : (i64, i64) -> i64
    %40 = func.call @cc_values_pack(%39) : (i64) -> i64
    %41 = func.call @cc_set_symbol_value(%37, %14) : (i64, i64) -> i64
    %42 = func.call @cc_nil_value() : () -> i64
    %43 = llvm.mlir.addressof @str5 : !llvm.ptr
    %44 = arith.constant 38 : i64
    %45 = func.call @cc_make_string(%43, %44) : (!llvm.ptr, i64) -> i64
    %46 = func.call @cc_nil_value() : () -> i64
    %47 = func.call @cc_intern(%45, %46) : (i64, i64) -> i64
    %48 = func.call @cc_nil_value() : () -> i64
    %49 = func.call @cc_cons(%47, %48) : (i64, i64) -> i64
    %50 = func.call @cc_values_pack(%49) : (i64) -> i64
    %51 = func.call @cc_set_symbol_value(%47, %42) : (i64, i64) -> i64
    %52 = llvm.mlir.addressof @str6 : !llvm.ptr
    %53 = arith.constant 39 : i64
    %54 = func.call @cc_make_string(%52, %53) : (!llvm.ptr, i64) -> i64
    %55 = func.call @cc_nil_value() : () -> i64
    %56 = func.call @cc_intern(%54, %55) : (i64, i64) -> i64
    %57 = func.call @cc_nil_value() : () -> i64
    %58 = func.call @cc_cons(%56, %57) : (i64, i64) -> i64
    %59 = func.call @cc_values_pack(%58) : (i64) -> i64
    %60 = func.call @cc_set_symbol_value(%56, %42) : (i64, i64) -> i64
    %61 = llvm.mlir.addressof @str7 : !llvm.ptr
    %62 = arith.constant 40 : i64
    %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
    %64 = func.call @cc_nil_value() : () -> i64
    %65 = func.call @cc_intern(%63, %64) : (i64, i64) -> i64
    %66 = func.call @cc_nil_value() : () -> i64
    %67 = func.call @cc_cons(%65, %66) : (i64, i64) -> i64
    %68 = func.call @cc_values_pack(%67) : (i64) -> i64
    %69 = func.call @cc_set_symbol_value(%65, %42) : (i64, i64) -> i64
    %70 = llvm.mlir.addressof @str8 : !llvm.ptr
    %71 = arith.constant 58 : i64
    %72 = func.call @cc_make_string(%70, %71) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%72) : (i64) -> ()
    %73 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%13) : (i64) -> ()
    %74 = llvm.mlir.addressof @str9 : !llvm.ptr
    %75 = arith.constant 9 : i64
    %76 = func.call @cc_make_string(%74, %75) : (!llvm.ptr, i64) -> i64
    %77 = func.call @cc_nil_value() : () -> i64
    %78 = func.call @cc_intern(%76, %77) : (i64, i64) -> i64
    %79 = func.call @cc_nil_value() : () -> i64
    %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
    %81 = func.call @cc_values_pack(%80) : (i64) -> i64
    func.call @stack_push_pointer(%78) : (i64) -> ()
    %82 = func.call @stack_pop_pointer() : () -> i64
    %83 = func.call @stack_pop_pointer() : () -> i64
    %84 = func.call @cc_typep(%83, %82) : (i64, i64) -> i64
    func.call @stack_push_pointer(%84) : (i64) -> ()
    %85 = func.call @stack_pop_pointer() : () -> i64
    %86 = func.call @cc_multiple_value_list(%85) : (i64) -> i64
    %87 = llvm.mlir.addressof @str10 : !llvm.ptr
    %88 = arith.constant 38 : i64
    %89 = func.call @cc_make_string(%87, %88) : (!llvm.ptr, i64) -> i64
    %90 = func.call @cc_nil_value() : () -> i64
    %91 = func.call @cc_intern(%89, %90) : (i64, i64) -> i64
    %92 = func.call @cc_nil_value() : () -> i64
    %93 = func.call @cc_cons(%91, %92) : (i64, i64) -> i64
    %94 = func.call @cc_values_pack(%93) : (i64) -> i64
    %95 = func.call @cc_symbol_value(%91) : (i64) -> i64
    %96 = llvm.mlir.addressof @str11 : !llvm.ptr
    %97 = arith.constant 39 : i64
    %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
    %99 = func.call @cc_nil_value() : () -> i64
    %100 = func.call @cc_intern(%98, %99) : (i64, i64) -> i64
    %101 = func.call @cc_nil_value() : () -> i64
    %102 = func.call @cc_cons(%100, %101) : (i64, i64) -> i64
    %103 = func.call @cc_values_pack(%102) : (i64) -> i64
    %104 = func.call @cc_symbol_value(%100) : (i64) -> i64
    %105 = llvm.mlir.addressof @str12 : !llvm.ptr
    %106 = arith.constant 40 : i64
    %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
    %108 = func.call @cc_nil_value() : () -> i64
    %109 = func.call @cc_intern(%107, %108) : (i64, i64) -> i64
    %110 = func.call @cc_nil_value() : () -> i64
    %111 = func.call @cc_cons(%109, %110) : (i64, i64) -> i64
    %112 = func.call @cc_values_pack(%111) : (i64) -> i64
    %113 = func.call @cc_symbol_value(%109) : (i64) -> i64
    %114 = func.call @cc_nil_value() : () -> i64
    %115 = arith.cmpi ne, %95, %114 : i64
    %116 = scf.if %115 -> (i64) {
      scf.yield %113 : i64
    } else {
      scf.yield %86 : i64
    }
    %117 = func.call @cc_values_pack(%116) : (i64) -> i64
    func.call @stack_push_pointer(%117) : (i64) -> ()
    %118 = func.call @stack_pop_pointer() : () -> i64
    %119 = func.call @cc_multiple_value_list(%118) : (i64) -> i64
    %120 = llvm.mlir.addressof @str13 : !llvm.ptr
    %121 = arith.constant 38 : i64
    %122 = func.call @cc_make_string(%120, %121) : (!llvm.ptr, i64) -> i64
    %123 = func.call @cc_nil_value() : () -> i64
    %124 = func.call @cc_intern(%122, %123) : (i64, i64) -> i64
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_cons(%124, %125) : (i64, i64) -> i64
    %127 = func.call @cc_values_pack(%126) : (i64) -> i64
    %128 = func.call @cc_symbol_value(%124) : (i64) -> i64
    %129 = llvm.mlir.addressof @str14 : !llvm.ptr
    %130 = arith.constant 40 : i64
    %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
    %132 = func.call @cc_nil_value() : () -> i64
    %133 = func.call @cc_intern(%131, %132) : (i64, i64) -> i64
    %134 = func.call @cc_nil_value() : () -> i64
    %135 = func.call @cc_cons(%133, %134) : (i64, i64) -> i64
    %136 = func.call @cc_values_pack(%135) : (i64) -> i64
    %137 = func.call @cc_symbol_value(%133) : (i64) -> i64
    %138 = func.call @cc_nil_value() : () -> i64
    %139 = arith.cmpi ne, %128, %138 : i64
    %140 = scf.if %139 -> (i64) {
      scf.yield %137 : i64
    } else {
      scf.yield %119 : i64
    }
    %141 = func.call @cc_values_pack(%140) : (i64) -> i64
    func.call @stack_push_pointer(%141) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %142 = llvm.mlir.addressof @str15 : !llvm.ptr
    %143 = arith.constant 6 : i64
    %144 = func.call @cc_make_string(%142, %143) : (!llvm.ptr, i64) -> i64
    %145 = func.call @cc_nil_value() : () -> i64
    %146 = func.call @cc_intern(%144, %145) : (i64, i64) -> i64
    %147 = func.call @cc_nil_value() : () -> i64
    %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
    %149 = func.call @cc_values_pack(%148) : (i64) -> i64
    %150 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%146, %150) : (i64, i64) -> ()
    %151 = func.call @cc_nil_value() : () -> i64
    %152 = llvm.mlir.addressof @str16 : !llvm.ptr
    %153 = arith.constant 38 : i64
    %154 = func.call @cc_make_string(%152, %153) : (!llvm.ptr, i64) -> i64
    %155 = func.call @cc_nil_value() : () -> i64
    %156 = func.call @cc_intern(%154, %155) : (i64, i64) -> i64
    %157 = func.call @cc_nil_value() : () -> i64
    %158 = func.call @cc_cons(%156, %157) : (i64, i64) -> i64
    %159 = func.call @cc_values_pack(%158) : (i64) -> i64
    %160 = func.call @cc_set_symbol_value(%156, %151) : (i64, i64) -> i64
    %161 = llvm.mlir.addressof @str17 : !llvm.ptr
    %162 = arith.constant 39 : i64
    %163 = func.call @cc_make_string(%161, %162) : (!llvm.ptr, i64) -> i64
    %164 = func.call @cc_nil_value() : () -> i64
    %165 = func.call @cc_intern(%163, %164) : (i64, i64) -> i64
    %166 = func.call @cc_nil_value() : () -> i64
    %167 = func.call @cc_cons(%165, %166) : (i64, i64) -> i64
    %168 = func.call @cc_values_pack(%167) : (i64) -> i64
    %169 = func.call @cc_set_symbol_value(%165, %151) : (i64, i64) -> i64
    %170 = llvm.mlir.addressof @str18 : !llvm.ptr
    %171 = arith.constant 40 : i64
    %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
    %173 = func.call @cc_nil_value() : () -> i64
    %174 = func.call @cc_intern(%172, %173) : (i64, i64) -> i64
    %175 = func.call @cc_nil_value() : () -> i64
    %176 = func.call @cc_cons(%174, %175) : (i64, i64) -> i64
    %177 = func.call @cc_values_pack(%176) : (i64) -> i64
    %178 = func.call @cc_set_symbol_value(%174, %151) : (i64, i64) -> i64
    %179 = func.call @cc_nil_value() : () -> i64
    %180 = func.call @cc_nil_value() : () -> i64
    %181 = func.call @cc_errorp(%179) : (i64) -> i64
    %182 = arith.cmpi ne, %181, %180 : i64
    %183 = scf.if %182 -> (i64) {
      scf.yield %179 : i64
    } else {
      %184 = llvm.mlir.addressof @str19 : !llvm.ptr
      %185 = arith.constant 11 : i64
      %186 = func.call @cc_make_string(%184, %185) : (!llvm.ptr, i64) -> i64
      %187 = func.call @cc_nil_value() : () -> i64
      %188 = func.call @cc_intern(%186, %187) : (i64, i64) -> i64
      %189 = func.call @cc_nil_value() : () -> i64
      %190 = func.call @cc_cons(%188, %189) : (i64, i64) -> i64
      %191 = func.call @cc_values_pack(%190) : (i64) -> i64
      func.call @stack_push_pointer(%188) : (i64) -> ()
      %192 = func.call @stack_pop_pointer() : () -> i64
      %193 = func.call @cc_in_package(%192) : (i64) -> i64
      func.call @stack_push_pointer(%193) : (i64) -> ()
      %194 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %194 : i64
    }
    %195 = func.call @cc_nil_value() : () -> i64
    %196 = func.call @cc_errorp(%183) : (i64) -> i64
    %197 = arith.cmpi ne, %196, %195 : i64
    %198 = scf.if %197 -> (i64) {
      scf.yield %183 : i64
    } else {
      %199 = llvm.mlir.addressof @str20 : !llvm.ptr
      %200 = func.call @cc_make_function_ref_const(%199) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%200) : (i64) -> ()
      %201 = func.call @stack_pop_pointer() : () -> i64
      %202 = llvm.mlir.addressof @str21 : !llvm.ptr
      %203 = arith.constant 13 : i64
      %204 = func.call @cc_make_string(%202, %203) : (!llvm.ptr, i64) -> i64
      %205 = llvm.mlir.addressof @str22 : !llvm.ptr
      %206 = arith.constant 15 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = func.call @cc_intern(%204, %207) : (i64, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_values_pack(%210) : (i64) -> i64
      %212 = func.call @cc_set_symbol_value(%208, %201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%201) : (i64) -> ()
      %213 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %213 : i64
    }
    %214 = func.call @cc_nil_value() : () -> i64
    %215 = func.call @cc_errorp(%198) : (i64) -> i64
    %216 = arith.cmpi ne, %215, %214 : i64
    %217 = scf.if %216 -> (i64) {
      scf.yield %198 : i64
    } else {
      %218 = llvm.mlir.addressof @str23 : !llvm.ptr
      %219 = func.call @cc_make_function_ref_const(%218) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%219) : (i64) -> ()
      %220 = func.call @stack_pop_pointer() : () -> i64
      %221 = llvm.mlir.addressof @str24 : !llvm.ptr
      %222 = arith.constant 13 : i64
      %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
      %224 = llvm.mlir.addressof @str25 : !llvm.ptr
      %225 = arith.constant 15 : i64
      %226 = func.call @cc_make_string(%224, %225) : (!llvm.ptr, i64) -> i64
      %227 = func.call @cc_intern(%223, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      %231 = func.call @cc_set_symbol_value(%227, %220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%220) : (i64) -> ()
      %232 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %232 : i64
    }
    %233 = func.call @cc_nil_value() : () -> i64
    %234 = func.call @cc_errorp(%217) : (i64) -> i64
    %235 = arith.cmpi ne, %234, %233 : i64
    %236 = scf.if %235 -> (i64) {
      scf.yield %217 : i64
    } else {
      %237 = llvm.mlir.addressof @str26 : !llvm.ptr
      %238 = func.call @cc_make_function_ref_const(%237) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%238) : (i64) -> ()
      %239 = func.call @stack_pop_pointer() : () -> i64
      %240 = llvm.mlir.addressof @str27 : !llvm.ptr
      %241 = arith.constant 13 : i64
      %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
      %243 = llvm.mlir.addressof @str28 : !llvm.ptr
      %244 = arith.constant 15 : i64
      %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
      %246 = func.call @cc_intern(%242, %245) : (i64, i64) -> i64
      %247 = func.call @cc_nil_value() : () -> i64
      %248 = func.call @cc_cons(%246, %247) : (i64, i64) -> i64
      %249 = func.call @cc_values_pack(%248) : (i64) -> i64
      %250 = func.call @cc_set_symbol_value(%246, %239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %251 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %251 : i64
    }
    %252 = func.call @cc_nil_value() : () -> i64
    %253 = func.call @cc_errorp(%236) : (i64) -> i64
    %254 = arith.cmpi ne, %253, %252 : i64
    %255 = scf.if %254 -> (i64) {
      scf.yield %236 : i64
    } else {
      %256 = llvm.mlir.addressof @str29 : !llvm.ptr
      %257 = func.call @cc_make_function_ref_const(%256) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%257) : (i64) -> ()
      %258 = func.call @stack_pop_pointer() : () -> i64
      %259 = llvm.mlir.addressof @str30 : !llvm.ptr
      %260 = arith.constant 13 : i64
      %261 = func.call @cc_make_string(%259, %260) : (!llvm.ptr, i64) -> i64
      %262 = llvm.mlir.addressof @str31 : !llvm.ptr
      %263 = arith.constant 15 : i64
      %264 = func.call @cc_make_string(%262, %263) : (!llvm.ptr, i64) -> i64
      %265 = func.call @cc_intern(%261, %264) : (i64, i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_cons(%265, %266) : (i64, i64) -> i64
      %268 = func.call @cc_values_pack(%267) : (i64) -> i64
      %269 = func.call @cc_set_symbol_value(%265, %258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%258) : (i64) -> ()
      %270 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %270 : i64
    }
    %271 = func.call @cc_nil_value() : () -> i64
    %272 = func.call @cc_errorp(%255) : (i64) -> i64
    %273 = arith.cmpi ne, %272, %271 : i64
    %274 = scf.if %273 -> (i64) {
      scf.yield %255 : i64
    } else {
      %275 = llvm.mlir.addressof @str32 : !llvm.ptr
      %276 = func.call @cc_make_function_ref_const(%275) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%276) : (i64) -> ()
      %277 = func.call @stack_pop_pointer() : () -> i64
      %278 = llvm.mlir.addressof @str33 : !llvm.ptr
      %279 = arith.constant 18 : i64
      %280 = func.call @cc_make_string(%278, %279) : (!llvm.ptr, i64) -> i64
      %281 = llvm.mlir.addressof @str34 : !llvm.ptr
      %282 = arith.constant 15 : i64
      %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
      %284 = func.call @cc_intern(%280, %283) : (i64, i64) -> i64
      %285 = func.call @cc_nil_value() : () -> i64
      %286 = func.call @cc_cons(%284, %285) : (i64, i64) -> i64
      %287 = func.call @cc_values_pack(%286) : (i64) -> i64
      %288 = func.call @cc_set_symbol_value(%284, %277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%277) : (i64) -> ()
      %289 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %289 : i64
    }
    %290 = func.call @cc_nil_value() : () -> i64
    %291 = func.call @cc_errorp(%274) : (i64) -> i64
    %292 = arith.cmpi ne, %291, %290 : i64
    %293 = scf.if %292 -> (i64) {
      scf.yield %274 : i64
    } else {
      %294 = llvm.mlir.addressof @str35 : !llvm.ptr
      %295 = func.call @cc_make_function_ref_const(%294) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%295) : (i64) -> ()
      %296 = func.call @stack_pop_pointer() : () -> i64
      %297 = llvm.mlir.addressof @str36 : !llvm.ptr
      %298 = arith.constant 18 : i64
      %299 = func.call @cc_make_string(%297, %298) : (!llvm.ptr, i64) -> i64
      %300 = llvm.mlir.addressof @str37 : !llvm.ptr
      %301 = arith.constant 15 : i64
      %302 = func.call @cc_make_string(%300, %301) : (!llvm.ptr, i64) -> i64
      %303 = func.call @cc_intern(%299, %302) : (i64, i64) -> i64
      %304 = func.call @cc_nil_value() : () -> i64
      %305 = func.call @cc_cons(%303, %304) : (i64, i64) -> i64
      %306 = func.call @cc_values_pack(%305) : (i64) -> i64
      %307 = func.call @cc_set_symbol_value(%303, %296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%296) : (i64) -> ()
      %308 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %308 : i64
    }
    %309 = func.call @cc_nil_value() : () -> i64
    %310 = func.call @cc_errorp(%293) : (i64) -> i64
    %311 = arith.cmpi ne, %310, %309 : i64
    %312 = scf.if %311 -> (i64) {
      scf.yield %293 : i64
    } else {
      %313 = llvm.mlir.addressof @str38 : !llvm.ptr
      %314 = func.call @cc_make_function_ref_const(%313) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%314) : (i64) -> ()
      %315 = func.call @stack_pop_pointer() : () -> i64
      %316 = llvm.mlir.addressof @str39 : !llvm.ptr
      %317 = arith.constant 18 : i64
      %318 = func.call @cc_make_string(%316, %317) : (!llvm.ptr, i64) -> i64
      %319 = llvm.mlir.addressof @str40 : !llvm.ptr
      %320 = arith.constant 15 : i64
      %321 = func.call @cc_make_string(%319, %320) : (!llvm.ptr, i64) -> i64
      %322 = func.call @cc_intern(%318, %321) : (i64, i64) -> i64
      %323 = func.call @cc_nil_value() : () -> i64
      %324 = func.call @cc_cons(%322, %323) : (i64, i64) -> i64
      %325 = func.call @cc_values_pack(%324) : (i64) -> i64
      %326 = func.call @cc_set_symbol_value(%322, %315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%315) : (i64) -> ()
      %327 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %327 : i64
    }
    %328 = func.call @cc_nil_value() : () -> i64
    %329 = func.call @cc_errorp(%312) : (i64) -> i64
    %330 = arith.cmpi ne, %329, %328 : i64
    %331 = scf.if %330 -> (i64) {
      scf.yield %312 : i64
    } else {
      %332 = llvm.mlir.addressof @str41 : !llvm.ptr
      %333 = func.call @cc_make_function_ref_const(%332) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%333) : (i64) -> ()
      %334 = func.call @stack_pop_pointer() : () -> i64
      %335 = llvm.mlir.addressof @str42 : !llvm.ptr
      %336 = arith.constant 18 : i64
      %337 = func.call @cc_make_string(%335, %336) : (!llvm.ptr, i64) -> i64
      %338 = llvm.mlir.addressof @str43 : !llvm.ptr
      %339 = arith.constant 15 : i64
      %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
      %341 = func.call @cc_intern(%337, %340) : (i64, i64) -> i64
      %342 = func.call @cc_nil_value() : () -> i64
      %343 = func.call @cc_cons(%341, %342) : (i64, i64) -> i64
      %344 = func.call @cc_values_pack(%343) : (i64) -> i64
      %345 = func.call @cc_set_symbol_value(%341, %334) : (i64, i64) -> i64
      func.call @stack_push_pointer(%334) : (i64) -> ()
      %346 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %346 : i64
    }
    %347 = func.call @cc_nil_value() : () -> i64
    %348 = func.call @cc_errorp(%331) : (i64) -> i64
    %349 = arith.cmpi ne, %348, %347 : i64
    %350 = scf.if %349 -> (i64) {
      scf.yield %331 : i64
    } else {
      %351 = llvm.mlir.addressof @str44 : !llvm.ptr
      %352 = arith.constant 15 : i64
      %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
      %354 = func.call @cc_nil_value() : () -> i64
      %355 = func.call @cc_intern(%353, %354) : (i64, i64) -> i64
      %356 = func.call @cc_nil_value() : () -> i64
      %357 = func.call @cc_cons(%355, %356) : (i64, i64) -> i64
      %358 = func.call @cc_values_pack(%357) : (i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      %359 = func.call @stack_pop_pointer() : () -> i64
      %360 = llvm.mlir.addressof @str45 : !llvm.ptr
      %361 = arith.constant 3 : i64
      %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
      %363 = func.call @cc_nil_value() : () -> i64
      %364 = func.call @cc_intern(%362, %363) : (i64, i64) -> i64
      %365 = func.call @cc_nil_value() : () -> i64
      %366 = func.call @cc_cons(%364, %365) : (i64, i64) -> i64
      %367 = func.call @cc_values_pack(%366) : (i64) -> i64
      func.call @stack_push_pointer(%364) : (i64) -> ()
      %368 = llvm.mlir.addressof @str46 : !llvm.ptr
      %369 = arith.constant 3 : i64
      %370 = func.call @cc_make_string(%368, %369) : (!llvm.ptr, i64) -> i64
      %371 = func.call @cc_nil_value() : () -> i64
      %372 = func.call @cc_intern(%370, %371) : (i64, i64) -> i64
      %373 = func.call @cc_nil_value() : () -> i64
      %374 = func.call @cc_cons(%372, %373) : (i64, i64) -> i64
      %375 = func.call @cc_values_pack(%374) : (i64) -> i64
      func.call @stack_push_pointer(%372) : (i64) -> ()
      %376 = llvm.mlir.addressof @str47 : !llvm.ptr
      %377 = arith.constant 19 : i64
      %378 = func.call @cc_make_string(%376, %377) : (!llvm.ptr, i64) -> i64
      %379 = llvm.mlir.addressof @str48 : !llvm.ptr
      %380 = arith.constant 11 : i64
      %381 = func.call @cc_make_string(%379, %380) : (!llvm.ptr, i64) -> i64
      %382 = func.call @cc_intern(%378, %381) : (i64, i64) -> i64
      %383 = func.call @cc_nil_value() : () -> i64
      %384 = func.call @cc_cons(%382, %383) : (i64, i64) -> i64
      %385 = func.call @cc_values_pack(%384) : (i64) -> i64
      func.call @stack_push_pointer(%382) : (i64) -> ()
      %386 = llvm.mlir.addressof @str49 : !llvm.ptr
      %387 = arith.constant 2 : i64
      %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
      %389 = llvm.mlir.addressof @str50 : !llvm.ptr
      %390 = arith.constant 11 : i64
      %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
      %392 = func.call @cc_intern(%388, %391) : (i64, i64) -> i64
      %393 = func.call @cc_nil_value() : () -> i64
      %394 = func.call @cc_cons(%392, %393) : (i64, i64) -> i64
      %395 = func.call @cc_values_pack(%394) : (i64) -> i64
      func.call @stack_push_pointer(%392) : (i64) -> ()
      %396 = llvm.mlir.addressof @str51 : !llvm.ptr
      %397 = arith.constant 2 : i64
      %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
      %399 = llvm.mlir.addressof @str52 : !llvm.ptr
      %400 = arith.constant 11 : i64
      %401 = func.call @cc_make_string(%399, %400) : (!llvm.ptr, i64) -> i64
      %402 = func.call @cc_intern(%398, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      func.call @stack_push_pointer(%402) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %406 = func.call @stack_pop_pointer() : () -> i64
      %407 = func.call @stack_pop_pointer() : () -> i64
      %408 = func.call @cc_cons(%407, %406) : (i64, i64) -> i64
      func.call @stack_push_pointer(%408) : (i64) -> ()
      %409 = func.call @stack_pop_pointer() : () -> i64
      %410 = func.call @stack_pop_pointer() : () -> i64
      %411 = func.call @cc_cons(%410, %409) : (i64, i64) -> i64
      func.call @stack_push_pointer(%411) : (i64) -> ()
      %412 = llvm.mlir.addressof @str53 : !llvm.ptr
      %413 = arith.constant 8 : i64
      %414 = func.call @cc_make_string(%412, %413) : (!llvm.ptr, i64) -> i64
      %415 = llvm.mlir.addressof @str54 : !llvm.ptr
      %416 = arith.constant 11 : i64
      %417 = func.call @cc_make_string(%415, %416) : (!llvm.ptr, i64) -> i64
      %418 = func.call @cc_intern(%414, %417) : (i64, i64) -> i64
      %419 = func.call @cc_nil_value() : () -> i64
      %420 = func.call @cc_cons(%418, %419) : (i64, i64) -> i64
      %421 = func.call @cc_values_pack(%420) : (i64) -> i64
      func.call @stack_push_pointer(%418) : (i64) -> ()
      %422 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%422) : (i64) -> ()
      %423 = llvm.mlir.addressof @str55 : !llvm.ptr
      %424 = arith.constant 6 : i64
      %425 = func.call @cc_make_string(%423, %424) : (!llvm.ptr, i64) -> i64
      %426 = llvm.mlir.addressof @str56 : !llvm.ptr
      %427 = arith.constant 11 : i64
      %428 = func.call @cc_make_string(%426, %427) : (!llvm.ptr, i64) -> i64
      %429 = func.call @cc_intern(%425, %428) : (i64, i64) -> i64
      %430 = func.call @cc_nil_value() : () -> i64
      %431 = func.call @cc_cons(%429, %430) : (i64, i64) -> i64
      %432 = func.call @cc_values_pack(%431) : (i64) -> i64
      func.call @stack_push_pointer(%429) : (i64) -> ()
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = func.call @stack_pop_pointer() : () -> i64
      %435 = func.call @cc_cons(%433, %434) : (i64, i64) -> i64
      %436 = llvm.mlir.addressof @str57 : !llvm.ptr
      %437 = arith.constant 5 : i64
      %438 = func.call @cc_make_string(%436, %437) : (!llvm.ptr, i64) -> i64
      %439 = func.call @cc_nil_value() : () -> i64
      %440 = func.call @cc_intern(%438, %439) : (i64, i64) -> i64
      %441 = func.call @cc_nil_value() : () -> i64
      %442 = func.call @cc_cons(%440, %441) : (i64, i64) -> i64
      %443 = func.call @cc_values_pack(%442) : (i64) -> i64
      %444 = func.call @cc_cons(%440, %435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%444) : (i64) -> ()
      %445 = llvm.mlir.addressof @str58 : !llvm.ptr
      %446 = arith.constant 10 : i64
      %447 = func.call @cc_make_string(%445, %446) : (!llvm.ptr, i64) -> i64
      %448 = llvm.mlir.addressof @str59 : !llvm.ptr
      %449 = arith.constant 11 : i64
      %450 = func.call @cc_make_string(%448, %449) : (!llvm.ptr, i64) -> i64
      %451 = func.call @cc_intern(%447, %450) : (i64, i64) -> i64
      %452 = func.call @cc_nil_value() : () -> i64
      %453 = func.call @cc_cons(%451, %452) : (i64, i64) -> i64
      %454 = func.call @cc_values_pack(%453) : (i64) -> i64
      func.call @stack_push_pointer(%451) : (i64) -> ()
      %455 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%455) : (i64) -> ()
      %456 = llvm.mlir.addressof @str60 : !llvm.ptr
      %457 = arith.constant 6 : i64
      %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
      %459 = llvm.mlir.addressof @str61 : !llvm.ptr
      %460 = arith.constant 11 : i64
      %461 = func.call @cc_make_string(%459, %460) : (!llvm.ptr, i64) -> i64
      %462 = func.call @cc_intern(%458, %461) : (i64, i64) -> i64
      %463 = func.call @cc_nil_value() : () -> i64
      %464 = func.call @cc_cons(%462, %463) : (i64, i64) -> i64
      %465 = func.call @cc_values_pack(%464) : (i64) -> i64
      func.call @stack_push_pointer(%462) : (i64) -> ()
      %466 = func.call @stack_pop_pointer() : () -> i64
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = func.call @cc_cons(%466, %467) : (i64, i64) -> i64
      %469 = llvm.mlir.addressof @str62 : !llvm.ptr
      %470 = arith.constant 5 : i64
      %471 = func.call @cc_make_string(%469, %470) : (!llvm.ptr, i64) -> i64
      %472 = func.call @cc_nil_value() : () -> i64
      %473 = func.call @cc_intern(%471, %472) : (i64, i64) -> i64
      %474 = func.call @cc_nil_value() : () -> i64
      %475 = func.call @cc_cons(%473, %474) : (i64, i64) -> i64
      %476 = func.call @cc_values_pack(%475) : (i64) -> i64
      %477 = func.call @cc_cons(%473, %468) : (i64, i64) -> i64
      func.call @stack_push_pointer(%477) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %478 = func.call @stack_pop_pointer() : () -> i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%480) : (i64) -> ()
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_cons(%482, %481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%483) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %484 = func.call @stack_pop_pointer() : () -> i64
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @cc_cons(%485, %484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%486) : (i64) -> ()
      %487 = func.call @stack_pop_pointer() : () -> i64
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @cc_cons(%488, %487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%489) : (i64) -> ()
      %490 = func.call @stack_pop_pointer() : () -> i64
      %491 = func.call @stack_pop_pointer() : () -> i64
      %492 = func.call @cc_cons(%491, %490) : (i64, i64) -> i64
      func.call @stack_push_pointer(%492) : (i64) -> ()
      %493 = llvm.mlir.addressof @str63 : !llvm.ptr
      %494 = arith.constant 3 : i64
      %495 = func.call @cc_make_string(%493, %494) : (!llvm.ptr, i64) -> i64
      %496 = llvm.mlir.addressof @str64 : !llvm.ptr
      %497 = arith.constant 11 : i64
      %498 = func.call @cc_make_string(%496, %497) : (!llvm.ptr, i64) -> i64
      %499 = func.call @cc_intern(%495, %498) : (i64, i64) -> i64
      %500 = func.call @cc_nil_value() : () -> i64
      %501 = func.call @cc_cons(%499, %500) : (i64, i64) -> i64
      %502 = func.call @cc_values_pack(%501) : (i64) -> i64
      func.call @stack_push_pointer(%499) : (i64) -> ()
      %503 = llvm.mlir.addressof @str65 : !llvm.ptr
      %504 = arith.constant 2 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = llvm.mlir.addressof @str66 : !llvm.ptr
      %507 = arith.constant 11 : i64
      %508 = func.call @cc_make_string(%506, %507) : (!llvm.ptr, i64) -> i64
      %509 = func.call @cc_intern(%505, %508) : (i64, i64) -> i64
      %510 = func.call @cc_nil_value() : () -> i64
      %511 = func.call @cc_cons(%509, %510) : (i64, i64) -> i64
      %512 = func.call @cc_values_pack(%511) : (i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %513 = llvm.mlir.addressof @str67 : !llvm.ptr
      %514 = arith.constant 2 : i64
      %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
      %516 = llvm.mlir.addressof @str68 : !llvm.ptr
      %517 = arith.constant 11 : i64
      %518 = func.call @cc_make_string(%516, %517) : (!llvm.ptr, i64) -> i64
      %519 = func.call @cc_intern(%515, %518) : (i64, i64) -> i64
      %520 = func.call @cc_nil_value() : () -> i64
      %521 = func.call @cc_cons(%519, %520) : (i64, i64) -> i64
      %522 = func.call @cc_values_pack(%521) : (i64) -> i64
      func.call @stack_push_pointer(%519) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %523 = func.call @stack_pop_pointer() : () -> i64
      %524 = func.call @stack_pop_pointer() : () -> i64
      %525 = func.call @cc_cons(%524, %523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%525) : (i64) -> ()
      %526 = func.call @stack_pop_pointer() : () -> i64
      %527 = func.call @stack_pop_pointer() : () -> i64
      %528 = func.call @cc_cons(%527, %526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%528) : (i64) -> ()
      %529 = func.call @stack_pop_pointer() : () -> i64
      %530 = func.call @stack_pop_pointer() : () -> i64
      %531 = func.call @cc_cons(%530, %529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%531) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %532 = func.call @stack_pop_pointer() : () -> i64
      %533 = func.call @stack_pop_pointer() : () -> i64
      %534 = func.call @cc_cons(%533, %532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%534) : (i64) -> ()
      %535 = func.call @stack_pop_pointer() : () -> i64
      %536 = func.call @stack_pop_pointer() : () -> i64
      %537 = func.call @cc_cons(%536, %535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%537) : (i64) -> ()
      %538 = func.call @stack_pop_pointer() : () -> i64
      %539 = func.call @stack_pop_pointer() : () -> i64
      %540 = func.call @cc_cons(%539, %538) : (i64, i64) -> i64
      func.call @stack_push_pointer(%540) : (i64) -> ()
      %541 = func.call @stack_pop_pointer() : () -> i64
      %542 = func.call @stack_pop_pointer() : () -> i64
      %543 = func.call @cc_cons(%542, %541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%543) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %544 = func.call @stack_pop_pointer() : () -> i64
      %545 = func.call @stack_pop_pointer() : () -> i64
      %546 = func.call @cc_cons(%545, %544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%546) : (i64) -> ()
      %547 = func.call @stack_pop_pointer() : () -> i64
      %548 = func.call @stack_pop_pointer() : () -> i64
      %549 = func.call @cc_cons(%548, %547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%549) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %550 = func.call @stack_pop_pointer() : () -> i64
      %551 = func.call @stack_pop_pointer() : () -> i64
      %552 = func.call @cc_cons(%551, %550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%552) : (i64) -> ()
      %553 = func.call @stack_pop_pointer() : () -> i64
      %554 = func.call @stack_pop_pointer() : () -> i64
      %555 = func.call @cc_cons(%554, %553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%555) : (i64) -> ()
      %556 = func.call @stack_pop_pointer() : () -> i64
      %619 = arith.constant 206494159077379 : i64
      %620 = arith.constant 0 : i64
      %621 = func.call @cc_make_closure(%619, %620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%621) : (i64) -> ()
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = llvm.mlir.addressof @str74 : !llvm.ptr
      %624 = arith.constant 1 : i64
      %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
      %626 = func.call @cc_nil_value() : () -> i64
      %627 = func.call @cc_intern(%625, %626) : (i64, i64) -> i64
      %628 = func.call @cc_nil_value() : () -> i64
      %629 = func.call @cc_cons(%627, %628) : (i64, i64) -> i64
      %630 = func.call @cc_values_pack(%629) : (i64) -> i64
      func.call @stack_push_pointer(%627) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %631 = func.call @stack_pop_pointer() : () -> i64
      %632 = func.call @stack_pop_pointer() : () -> i64
      %633 = func.call @cc_cons(%632, %631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%633) : (i64) -> ()
      %634 = func.call @stack_pop_pointer() : () -> i64
      %635 = llvm.mlir.addressof @str75 : !llvm.ptr
      %636 = arith.constant 11 : i64
      %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
      %638 = llvm.mlir.addressof @str76 : !llvm.ptr
      %639 = arith.constant 7 : i64
      %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
      %641 = func.call @cc_intern(%637, %640) : (i64, i64) -> i64
      %642 = func.call @cc_nil_value() : () -> i64
      %643 = func.call @cc_cons(%641, %642) : (i64, i64) -> i64
      %644 = func.call @cc_values_pack(%643) : (i64) -> i64
      func.call @stack_push_pointer(%641) : (i64) -> ()
      %645 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %646 = func.call @stack_pop_pointer() : () -> i64
      %647 = llvm.mlir.addressof @str77 : !llvm.ptr
      %648 = arith.constant 4 : i64
      %649 = func.call @cc_make_string(%647, %648) : (!llvm.ptr, i64) -> i64
      %650 = llvm.mlir.addressof @str78 : !llvm.ptr
      %651 = arith.constant 7 : i64
      %652 = func.call @cc_make_string(%650, %651) : (!llvm.ptr, i64) -> i64
      %653 = func.call @cc_intern(%649, %652) : (i64, i64) -> i64
      %654 = func.call @cc_nil_value() : () -> i64
      %655 = func.call @cc_cons(%653, %654) : (i64, i64) -> i64
      %656 = func.call @cc_values_pack(%655) : (i64) -> i64
      func.call @stack_push_pointer(%653) : (i64) -> ()
      %657 = func.call @stack_pop_pointer() : () -> i64
      %658 = llvm.mlir.addressof @str79 : !llvm.ptr
      %659 = arith.constant 6 : i64
      %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
      %661 = func.call @cc_nil_value() : () -> i64
      %662 = func.call @cc_intern(%660, %661) : (i64, i64) -> i64
      %663 = func.call @cc_nil_value() : () -> i64
      %664 = func.call @cc_cons(%662, %663) : (i64, i64) -> i64
      %665 = func.call @cc_values_pack(%664) : (i64) -> i64
      func.call @stack_push_pointer(%662) : (i64) -> ()
      %666 = func.call @stack_pop_pointer() : () -> i64
      %667 = func.call @cc_nil_value() : () -> i64
      %668 = func.call @cc_errorp(%359) : (i64) -> i64
      %669 = arith.cmpi ne, %668, %667 : i64
      %670 = arith.cmpi eq, %667, %667 : i64
      %671 = arith.andi %669, %670 : i1
      %672 = scf.if %671 -> (i64) {
        scf.yield %359 : i64
      } else {
        scf.yield %667 : i64
      }
      %673 = func.call @cc_errorp(%556) : (i64) -> i64
      %674 = arith.cmpi ne, %673, %667 : i64
      %675 = arith.cmpi eq, %672, %667 : i64
      %676 = arith.andi %674, %675 : i1
      %677 = scf.if %676 -> (i64) {
        scf.yield %556 : i64
      } else {
        scf.yield %672 : i64
      }
      %678 = func.call @cc_errorp(%622) : (i64) -> i64
      %679 = arith.cmpi ne, %678, %667 : i64
      %680 = arith.cmpi eq, %677, %667 : i64
      %681 = arith.andi %679, %680 : i1
      %682 = scf.if %681 -> (i64) {
        scf.yield %622 : i64
      } else {
        scf.yield %677 : i64
      }
      %683 = func.call @cc_errorp(%634) : (i64) -> i64
      %684 = arith.cmpi ne, %683, %667 : i64
      %685 = arith.cmpi eq, %682, %667 : i64
      %686 = arith.andi %684, %685 : i1
      %687 = scf.if %686 -> (i64) {
        scf.yield %634 : i64
      } else {
        scf.yield %682 : i64
      }
      %688 = func.call @cc_errorp(%645) : (i64) -> i64
      %689 = arith.cmpi ne, %688, %667 : i64
      %690 = arith.cmpi eq, %687, %667 : i64
      %691 = arith.andi %689, %690 : i1
      %692 = scf.if %691 -> (i64) {
        scf.yield %645 : i64
      } else {
        scf.yield %687 : i64
      }
      %693 = func.call @cc_errorp(%646) : (i64) -> i64
      %694 = arith.cmpi ne, %693, %667 : i64
      %695 = arith.cmpi eq, %692, %667 : i64
      %696 = arith.andi %694, %695 : i1
      %697 = scf.if %696 -> (i64) {
        scf.yield %646 : i64
      } else {
        scf.yield %692 : i64
      }
      %698 = func.call @cc_errorp(%657) : (i64) -> i64
      %699 = arith.cmpi ne, %698, %667 : i64
      %700 = arith.cmpi eq, %697, %667 : i64
      %701 = arith.andi %699, %700 : i1
      %702 = scf.if %701 -> (i64) {
        scf.yield %657 : i64
      } else {
        scf.yield %697 : i64
      }
      %703 = func.call @cc_errorp(%666) : (i64) -> i64
      %704 = arith.cmpi ne, %703, %667 : i64
      %705 = arith.cmpi eq, %702, %667 : i64
      %706 = arith.andi %704, %705 : i1
      %707 = scf.if %706 -> (i64) {
        scf.yield %666 : i64
      } else {
        scf.yield %702 : i64
      }
      %708 = arith.cmpi ne, %707, %667 : i64
      scf.if %708 {
        func.call @stack_push_pointer(%707) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%359) : (i64) -> ()
        func.call @stack_push_pointer(%556) : (i64) -> ()
        func.call @stack_push_pointer(%622) : (i64) -> ()
        func.call @stack_push_pointer(%634) : (i64) -> ()
        func.call @stack_push_pointer(%645) : (i64) -> ()
        func.call @stack_push_pointer(%646) : (i64) -> ()
        func.call @stack_push_pointer(%657) : (i64) -> ()
        func.call @stack_push_pointer(%666) : (i64) -> ()
        %709 = llvm.mlir.addressof @str80 : !llvm.ptr
        %710 = func.call @cc_make_function_ref_const(%709) : (!llvm.ptr) -> i64
        %711 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%710, %711) : (i64, i64) -> ()
      }
      %712 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %712 : i64
    }
    %713 = func.call @cc_nil_value() : () -> i64
    %714 = func.call @cc_errorp(%350) : (i64) -> i64
    %715 = arith.cmpi ne, %714, %713 : i64
    %716 = scf.if %715 -> (i64) {
      scf.yield %350 : i64
    } else {
      %717 = llvm.mlir.addressof @str81 : !llvm.ptr
      %718 = arith.constant 15 : i64
      %719 = func.call @cc_make_string(%717, %718) : (!llvm.ptr, i64) -> i64
      %720 = func.call @cc_nil_value() : () -> i64
      %721 = func.call @cc_intern(%719, %720) : (i64, i64) -> i64
      %722 = func.call @cc_nil_value() : () -> i64
      %723 = func.call @cc_cons(%721, %722) : (i64, i64) -> i64
      %724 = func.call @cc_values_pack(%723) : (i64) -> i64
      func.call @stack_push_pointer(%721) : (i64) -> ()
      %725 = func.call @stack_pop_pointer() : () -> i64
      %726 = llvm.mlir.addressof @str82 : !llvm.ptr
      %727 = arith.constant 3 : i64
      %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
      %729 = func.call @cc_nil_value() : () -> i64
      %730 = func.call @cc_intern(%728, %729) : (i64, i64) -> i64
      %731 = func.call @cc_nil_value() : () -> i64
      %732 = func.call @cc_cons(%730, %731) : (i64, i64) -> i64
      %733 = func.call @cc_values_pack(%732) : (i64) -> i64
      func.call @stack_push_pointer(%730) : (i64) -> ()
      %734 = llvm.mlir.addressof @str83 : !llvm.ptr
      %735 = arith.constant 3 : i64
      %736 = func.call @cc_make_string(%734, %735) : (!llvm.ptr, i64) -> i64
      %737 = func.call @cc_nil_value() : () -> i64
      %738 = func.call @cc_intern(%736, %737) : (i64, i64) -> i64
      %739 = func.call @cc_nil_value() : () -> i64
      %740 = func.call @cc_cons(%738, %739) : (i64, i64) -> i64
      %741 = func.call @cc_values_pack(%740) : (i64) -> i64
      func.call @stack_push_pointer(%738) : (i64) -> ()
      %742 = llvm.mlir.addressof @str84 : !llvm.ptr
      %743 = arith.constant 19 : i64
      %744 = func.call @cc_make_string(%742, %743) : (!llvm.ptr, i64) -> i64
      %745 = llvm.mlir.addressof @str85 : !llvm.ptr
      %746 = arith.constant 11 : i64
      %747 = func.call @cc_make_string(%745, %746) : (!llvm.ptr, i64) -> i64
      %748 = func.call @cc_intern(%744, %747) : (i64, i64) -> i64
      %749 = func.call @cc_nil_value() : () -> i64
      %750 = func.call @cc_cons(%748, %749) : (i64, i64) -> i64
      %751 = func.call @cc_values_pack(%750) : (i64) -> i64
      func.call @stack_push_pointer(%748) : (i64) -> ()
      %752 = llvm.mlir.addressof @str86 : !llvm.ptr
      %753 = arith.constant 2 : i64
      %754 = func.call @cc_make_string(%752, %753) : (!llvm.ptr, i64) -> i64
      %755 = llvm.mlir.addressof @str87 : !llvm.ptr
      %756 = arith.constant 11 : i64
      %757 = func.call @cc_make_string(%755, %756) : (!llvm.ptr, i64) -> i64
      %758 = func.call @cc_intern(%754, %757) : (i64, i64) -> i64
      %759 = func.call @cc_nil_value() : () -> i64
      %760 = func.call @cc_cons(%758, %759) : (i64, i64) -> i64
      %761 = func.call @cc_values_pack(%760) : (i64) -> i64
      func.call @stack_push_pointer(%758) : (i64) -> ()
      %762 = llvm.mlir.addressof @str88 : !llvm.ptr
      %763 = arith.constant 2 : i64
      %764 = func.call @cc_make_string(%762, %763) : (!llvm.ptr, i64) -> i64
      %765 = llvm.mlir.addressof @str89 : !llvm.ptr
      %766 = arith.constant 11 : i64
      %767 = func.call @cc_make_string(%765, %766) : (!llvm.ptr, i64) -> i64
      %768 = func.call @cc_intern(%764, %767) : (i64, i64) -> i64
      %769 = func.call @cc_nil_value() : () -> i64
      %770 = func.call @cc_cons(%768, %769) : (i64, i64) -> i64
      %771 = func.call @cc_values_pack(%770) : (i64) -> i64
      func.call @stack_push_pointer(%768) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %772 = func.call @stack_pop_pointer() : () -> i64
      %773 = func.call @stack_pop_pointer() : () -> i64
      %774 = func.call @cc_cons(%773, %772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%774) : (i64) -> ()
      %775 = func.call @stack_pop_pointer() : () -> i64
      %776 = func.call @stack_pop_pointer() : () -> i64
      %777 = func.call @cc_cons(%776, %775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      %778 = llvm.mlir.addressof @str90 : !llvm.ptr
      %779 = arith.constant 8 : i64
      %780 = func.call @cc_make_string(%778, %779) : (!llvm.ptr, i64) -> i64
      %781 = llvm.mlir.addressof @str91 : !llvm.ptr
      %782 = arith.constant 11 : i64
      %783 = func.call @cc_make_string(%781, %782) : (!llvm.ptr, i64) -> i64
      %784 = func.call @cc_intern(%780, %783) : (i64, i64) -> i64
      %785 = func.call @cc_nil_value() : () -> i64
      %786 = func.call @cc_cons(%784, %785) : (i64, i64) -> i64
      %787 = func.call @cc_values_pack(%786) : (i64) -> i64
      func.call @stack_push_pointer(%784) : (i64) -> ()
      %788 = llvm.mlir.addressof @str92 : !llvm.ptr
      %789 = arith.constant 10 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      %791 = llvm.mlir.addressof @str93 : !llvm.ptr
      %792 = arith.constant 11 : i64
      %793 = func.call @cc_make_string(%791, %792) : (!llvm.ptr, i64) -> i64
      %794 = func.call @cc_intern(%790, %793) : (i64, i64) -> i64
      %795 = func.call @cc_nil_value() : () -> i64
      %796 = func.call @cc_cons(%794, %795) : (i64, i64) -> i64
      %797 = func.call @cc_values_pack(%796) : (i64) -> i64
      func.call @stack_push_pointer(%794) : (i64) -> ()
      %798 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%798) : (i64) -> ()
      %799 = llvm.mlir.addressof @str94 : !llvm.ptr
      %800 = arith.constant 6 : i64
      %801 = func.call @cc_make_string(%799, %800) : (!llvm.ptr, i64) -> i64
      %802 = llvm.mlir.addressof @str95 : !llvm.ptr
      %803 = arith.constant 11 : i64
      %804 = func.call @cc_make_string(%802, %803) : (!llvm.ptr, i64) -> i64
      %805 = func.call @cc_intern(%801, %804) : (i64, i64) -> i64
      %806 = func.call @cc_nil_value() : () -> i64
      %807 = func.call @cc_cons(%805, %806) : (i64, i64) -> i64
      %808 = func.call @cc_values_pack(%807) : (i64) -> i64
      func.call @stack_push_pointer(%805) : (i64) -> ()
      %809 = func.call @stack_pop_pointer() : () -> i64
      %810 = func.call @stack_pop_pointer() : () -> i64
      %811 = func.call @cc_cons(%809, %810) : (i64, i64) -> i64
      %812 = llvm.mlir.addressof @str96 : !llvm.ptr
      %813 = arith.constant 5 : i64
      %814 = func.call @cc_make_string(%812, %813) : (!llvm.ptr, i64) -> i64
      %815 = func.call @cc_nil_value() : () -> i64
      %816 = func.call @cc_intern(%814, %815) : (i64, i64) -> i64
      %817 = func.call @cc_nil_value() : () -> i64
      %818 = func.call @cc_cons(%816, %817) : (i64, i64) -> i64
      %819 = func.call @cc_values_pack(%818) : (i64) -> i64
      %820 = func.call @cc_cons(%816, %811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @stack_pop_pointer() : () -> i64
      %823 = func.call @cc_cons(%822, %821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%823) : (i64) -> ()
      %824 = func.call @stack_pop_pointer() : () -> i64
      %825 = func.call @stack_pop_pointer() : () -> i64
      %826 = func.call @cc_cons(%825, %824) : (i64, i64) -> i64
      func.call @stack_push_pointer(%826) : (i64) -> ()
      %827 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%827) : (i64) -> ()
      %828 = llvm.mlir.addressof @str97 : !llvm.ptr
      %829 = arith.constant 6 : i64
      %830 = func.call @cc_make_string(%828, %829) : (!llvm.ptr, i64) -> i64
      %831 = llvm.mlir.addressof @str98 : !llvm.ptr
      %832 = arith.constant 11 : i64
      %833 = func.call @cc_make_string(%831, %832) : (!llvm.ptr, i64) -> i64
      %834 = func.call @cc_intern(%830, %833) : (i64, i64) -> i64
      %835 = func.call @cc_nil_value() : () -> i64
      %836 = func.call @cc_cons(%834, %835) : (i64, i64) -> i64
      %837 = func.call @cc_values_pack(%836) : (i64) -> i64
      func.call @stack_push_pointer(%834) : (i64) -> ()
      %838 = func.call @stack_pop_pointer() : () -> i64
      %839 = func.call @stack_pop_pointer() : () -> i64
      %840 = func.call @cc_cons(%838, %839) : (i64, i64) -> i64
      %841 = llvm.mlir.addressof @str99 : !llvm.ptr
      %842 = arith.constant 5 : i64
      %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
      %844 = func.call @cc_nil_value() : () -> i64
      %845 = func.call @cc_intern(%843, %844) : (i64, i64) -> i64
      %846 = func.call @cc_nil_value() : () -> i64
      %847 = func.call @cc_cons(%845, %846) : (i64, i64) -> i64
      %848 = func.call @cc_values_pack(%847) : (i64) -> i64
      %849 = func.call @cc_cons(%845, %840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%849) : (i64) -> ()
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
      %857 = func.call @stack_pop_pointer() : () -> i64
      %858 = func.call @cc_cons(%857, %856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%858) : (i64) -> ()
      %859 = llvm.mlir.addressof @str100 : !llvm.ptr
      %860 = arith.constant 3 : i64
      %861 = func.call @cc_make_string(%859, %860) : (!llvm.ptr, i64) -> i64
      %862 = llvm.mlir.addressof @str101 : !llvm.ptr
      %863 = arith.constant 11 : i64
      %864 = func.call @cc_make_string(%862, %863) : (!llvm.ptr, i64) -> i64
      %865 = func.call @cc_intern(%861, %864) : (i64, i64) -> i64
      %866 = func.call @cc_nil_value() : () -> i64
      %867 = func.call @cc_cons(%865, %866) : (i64, i64) -> i64
      %868 = func.call @cc_values_pack(%867) : (i64) -> i64
      func.call @stack_push_pointer(%865) : (i64) -> ()
      %869 = llvm.mlir.addressof @str102 : !llvm.ptr
      %870 = arith.constant 2 : i64
      %871 = func.call @cc_make_string(%869, %870) : (!llvm.ptr, i64) -> i64
      %872 = llvm.mlir.addressof @str103 : !llvm.ptr
      %873 = arith.constant 11 : i64
      %874 = func.call @cc_make_string(%872, %873) : (!llvm.ptr, i64) -> i64
      %875 = func.call @cc_intern(%871, %874) : (i64, i64) -> i64
      %876 = func.call @cc_nil_value() : () -> i64
      %877 = func.call @cc_cons(%875, %876) : (i64, i64) -> i64
      %878 = func.call @cc_values_pack(%877) : (i64) -> i64
      func.call @stack_push_pointer(%875) : (i64) -> ()
      %879 = llvm.mlir.addressof @str104 : !llvm.ptr
      %880 = arith.constant 2 : i64
      %881 = func.call @cc_make_string(%879, %880) : (!llvm.ptr, i64) -> i64
      %882 = llvm.mlir.addressof @str105 : !llvm.ptr
      %883 = arith.constant 11 : i64
      %884 = func.call @cc_make_string(%882, %883) : (!llvm.ptr, i64) -> i64
      %885 = func.call @cc_intern(%881, %884) : (i64, i64) -> i64
      %886 = func.call @cc_nil_value() : () -> i64
      %887 = func.call @cc_cons(%885, %886) : (i64, i64) -> i64
      %888 = func.call @cc_values_pack(%887) : (i64) -> i64
      func.call @stack_push_pointer(%885) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %889 = func.call @stack_pop_pointer() : () -> i64
      %890 = func.call @stack_pop_pointer() : () -> i64
      %891 = func.call @cc_cons(%890, %889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%891) : (i64) -> ()
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @cc_cons(%893, %892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%894) : (i64) -> ()
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = func.call @stack_pop_pointer() : () -> i64
      %897 = func.call @cc_cons(%896, %895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%897) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %898 = func.call @stack_pop_pointer() : () -> i64
      %899 = func.call @stack_pop_pointer() : () -> i64
      %900 = func.call @cc_cons(%899, %898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%900) : (i64) -> ()
      %901 = func.call @stack_pop_pointer() : () -> i64
      %902 = func.call @stack_pop_pointer() : () -> i64
      %903 = func.call @cc_cons(%902, %901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%903) : (i64) -> ()
      %904 = func.call @stack_pop_pointer() : () -> i64
      %905 = func.call @stack_pop_pointer() : () -> i64
      %906 = func.call @cc_cons(%905, %904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%906) : (i64) -> ()
      %907 = func.call @stack_pop_pointer() : () -> i64
      %908 = func.call @stack_pop_pointer() : () -> i64
      %909 = func.call @cc_cons(%908, %907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %910 = func.call @stack_pop_pointer() : () -> i64
      %911 = func.call @stack_pop_pointer() : () -> i64
      %912 = func.call @cc_cons(%911, %910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%912) : (i64) -> ()
      %913 = func.call @stack_pop_pointer() : () -> i64
      %914 = func.call @stack_pop_pointer() : () -> i64
      %915 = func.call @cc_cons(%914, %913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%915) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %916 = func.call @stack_pop_pointer() : () -> i64
      %917 = func.call @stack_pop_pointer() : () -> i64
      %918 = func.call @cc_cons(%917, %916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%918) : (i64) -> ()
      %919 = func.call @stack_pop_pointer() : () -> i64
      %920 = func.call @stack_pop_pointer() : () -> i64
      %921 = func.call @cc_cons(%920, %919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%921) : (i64) -> ()
      %922 = func.call @stack_pop_pointer() : () -> i64
      %985 = arith.constant 206494159077380 : i64
      %986 = arith.constant 0 : i64
      %987 = func.call @cc_make_closure(%985, %986) : (i64, i64) -> i64
      func.call @stack_push_pointer(%987) : (i64) -> ()
      %988 = func.call @stack_pop_pointer() : () -> i64
      %989 = llvm.mlir.addressof @str111 : !llvm.ptr
      %990 = arith.constant 1 : i64
      %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
      %992 = func.call @cc_nil_value() : () -> i64
      %993 = func.call @cc_intern(%991, %992) : (i64, i64) -> i64
      %994 = func.call @cc_nil_value() : () -> i64
      %995 = func.call @cc_cons(%993, %994) : (i64, i64) -> i64
      %996 = func.call @cc_values_pack(%995) : (i64) -> i64
      func.call @stack_push_pointer(%993) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %997 = func.call @stack_pop_pointer() : () -> i64
      %998 = func.call @stack_pop_pointer() : () -> i64
      %999 = func.call @cc_cons(%998, %997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%999) : (i64) -> ()
      %1000 = func.call @stack_pop_pointer() : () -> i64
      %1001 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1002 = arith.constant 11 : i64
      %1003 = func.call @cc_make_string(%1001, %1002) : (!llvm.ptr, i64) -> i64
      %1004 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1005 = arith.constant 7 : i64
      %1006 = func.call @cc_make_string(%1004, %1005) : (!llvm.ptr, i64) -> i64
      %1007 = func.call @cc_intern(%1003, %1006) : (i64, i64) -> i64
      %1008 = func.call @cc_nil_value() : () -> i64
      %1009 = func.call @cc_cons(%1007, %1008) : (i64, i64) -> i64
      %1010 = func.call @cc_values_pack(%1009) : (i64) -> i64
      func.call @stack_push_pointer(%1007) : (i64) -> ()
      %1011 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1012 = func.call @stack_pop_pointer() : () -> i64
      %1013 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1014 = arith.constant 4 : i64
      %1015 = func.call @cc_make_string(%1013, %1014) : (!llvm.ptr, i64) -> i64
      %1016 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1017 = arith.constant 7 : i64
      %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
      %1019 = func.call @cc_intern(%1015, %1018) : (i64, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_cons(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_values_pack(%1021) : (i64) -> i64
      func.call @stack_push_pointer(%1019) : (i64) -> ()
      %1023 = func.call @stack_pop_pointer() : () -> i64
      %1024 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1025 = arith.constant 6 : i64
      %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
      %1027 = func.call @cc_nil_value() : () -> i64
      %1028 = func.call @cc_intern(%1026, %1027) : (i64, i64) -> i64
      %1029 = func.call @cc_nil_value() : () -> i64
      %1030 = func.call @cc_cons(%1028, %1029) : (i64, i64) -> i64
      %1031 = func.call @cc_values_pack(%1030) : (i64) -> i64
      func.call @stack_push_pointer(%1028) : (i64) -> ()
      %1032 = func.call @stack_pop_pointer() : () -> i64
      %1033 = func.call @cc_nil_value() : () -> i64
      %1034 = func.call @cc_errorp(%725) : (i64) -> i64
      %1035 = arith.cmpi ne, %1034, %1033 : i64
      %1036 = arith.cmpi eq, %1033, %1033 : i64
      %1037 = arith.andi %1035, %1036 : i1
      %1038 = scf.if %1037 -> (i64) {
        scf.yield %725 : i64
      } else {
        scf.yield %1033 : i64
      }
      %1039 = func.call @cc_errorp(%922) : (i64) -> i64
      %1040 = arith.cmpi ne, %1039, %1033 : i64
      %1041 = arith.cmpi eq, %1038, %1033 : i64
      %1042 = arith.andi %1040, %1041 : i1
      %1043 = scf.if %1042 -> (i64) {
        scf.yield %922 : i64
      } else {
        scf.yield %1038 : i64
      }
      %1044 = func.call @cc_errorp(%988) : (i64) -> i64
      %1045 = arith.cmpi ne, %1044, %1033 : i64
      %1046 = arith.cmpi eq, %1043, %1033 : i64
      %1047 = arith.andi %1045, %1046 : i1
      %1048 = scf.if %1047 -> (i64) {
        scf.yield %988 : i64
      } else {
        scf.yield %1043 : i64
      }
      %1049 = func.call @cc_errorp(%1000) : (i64) -> i64
      %1050 = arith.cmpi ne, %1049, %1033 : i64
      %1051 = arith.cmpi eq, %1048, %1033 : i64
      %1052 = arith.andi %1050, %1051 : i1
      %1053 = scf.if %1052 -> (i64) {
        scf.yield %1000 : i64
      } else {
        scf.yield %1048 : i64
      }
      %1054 = func.call @cc_errorp(%1011) : (i64) -> i64
      %1055 = arith.cmpi ne, %1054, %1033 : i64
      %1056 = arith.cmpi eq, %1053, %1033 : i64
      %1057 = arith.andi %1055, %1056 : i1
      %1058 = scf.if %1057 -> (i64) {
        scf.yield %1011 : i64
      } else {
        scf.yield %1053 : i64
      }
      %1059 = func.call @cc_errorp(%1012) : (i64) -> i64
      %1060 = arith.cmpi ne, %1059, %1033 : i64
      %1061 = arith.cmpi eq, %1058, %1033 : i64
      %1062 = arith.andi %1060, %1061 : i1
      %1063 = scf.if %1062 -> (i64) {
        scf.yield %1012 : i64
      } else {
        scf.yield %1058 : i64
      }
      %1064 = func.call @cc_errorp(%1023) : (i64) -> i64
      %1065 = arith.cmpi ne, %1064, %1033 : i64
      %1066 = arith.cmpi eq, %1063, %1033 : i64
      %1067 = arith.andi %1065, %1066 : i1
      %1068 = scf.if %1067 -> (i64) {
        scf.yield %1023 : i64
      } else {
        scf.yield %1063 : i64
      }
      %1069 = func.call @cc_errorp(%1032) : (i64) -> i64
      %1070 = arith.cmpi ne, %1069, %1033 : i64
      %1071 = arith.cmpi eq, %1068, %1033 : i64
      %1072 = arith.andi %1070, %1071 : i1
      %1073 = scf.if %1072 -> (i64) {
        scf.yield %1032 : i64
      } else {
        scf.yield %1068 : i64
      }
      %1074 = arith.cmpi ne, %1073, %1033 : i64
      scf.if %1074 {
        func.call @stack_push_pointer(%1073) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%725) : (i64) -> ()
        func.call @stack_push_pointer(%922) : (i64) -> ()
        func.call @stack_push_pointer(%988) : (i64) -> ()
        func.call @stack_push_pointer(%1000) : (i64) -> ()
        func.call @stack_push_pointer(%1011) : (i64) -> ()
        func.call @stack_push_pointer(%1012) : (i64) -> ()
        func.call @stack_push_pointer(%1023) : (i64) -> ()
        func.call @stack_push_pointer(%1032) : (i64) -> ()
        %1075 = llvm.mlir.addressof @str117 : !llvm.ptr
        %1076 = func.call @cc_make_function_ref_const(%1075) : (!llvm.ptr) -> i64
        %1077 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1076, %1077) : (i64, i64) -> ()
      }
      %1078 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1078 : i64
    }
    %1079 = func.call @cc_nil_value() : () -> i64
    %1080 = func.call @cc_errorp(%716) : (i64) -> i64
    %1081 = arith.cmpi ne, %1080, %1079 : i64
    %1082 = scf.if %1081 -> (i64) {
      scf.yield %716 : i64
    } else {
      %1083 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1084 = arith.constant 15 : i64
      %1085 = func.call @cc_make_string(%1083, %1084) : (!llvm.ptr, i64) -> i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = func.call @cc_intern(%1085, %1086) : (i64, i64) -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_cons(%1087, %1088) : (i64, i64) -> i64
      %1090 = func.call @cc_values_pack(%1089) : (i64) -> i64
      func.call @stack_push_pointer(%1087) : (i64) -> ()
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1093 = arith.constant 3 : i64
      %1094 = func.call @cc_make_string(%1092, %1093) : (!llvm.ptr, i64) -> i64
      %1095 = func.call @cc_nil_value() : () -> i64
      %1096 = func.call @cc_intern(%1094, %1095) : (i64, i64) -> i64
      %1097 = func.call @cc_nil_value() : () -> i64
      %1098 = func.call @cc_cons(%1096, %1097) : (i64, i64) -> i64
      %1099 = func.call @cc_values_pack(%1098) : (i64) -> i64
      func.call @stack_push_pointer(%1096) : (i64) -> ()
      %1100 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1101 = arith.constant 3 : i64
      %1102 = func.call @cc_make_string(%1100, %1101) : (!llvm.ptr, i64) -> i64
      %1103 = func.call @cc_nil_value() : () -> i64
      %1104 = func.call @cc_intern(%1102, %1103) : (i64, i64) -> i64
      %1105 = func.call @cc_nil_value() : () -> i64
      %1106 = func.call @cc_cons(%1104, %1105) : (i64, i64) -> i64
      %1107 = func.call @cc_values_pack(%1106) : (i64) -> i64
      func.call @stack_push_pointer(%1104) : (i64) -> ()
      %1108 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1109 = arith.constant 19 : i64
      %1110 = func.call @cc_make_string(%1108, %1109) : (!llvm.ptr, i64) -> i64
      %1111 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1112 = arith.constant 11 : i64
      %1113 = func.call @cc_make_string(%1111, %1112) : (!llvm.ptr, i64) -> i64
      %1114 = func.call @cc_intern(%1110, %1113) : (i64, i64) -> i64
      %1115 = func.call @cc_nil_value() : () -> i64
      %1116 = func.call @cc_cons(%1114, %1115) : (i64, i64) -> i64
      %1117 = func.call @cc_values_pack(%1116) : (i64) -> i64
      func.call @stack_push_pointer(%1114) : (i64) -> ()
      %1118 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1119 = arith.constant 2 : i64
      %1120 = func.call @cc_make_string(%1118, %1119) : (!llvm.ptr, i64) -> i64
      %1121 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1122 = arith.constant 11 : i64
      %1123 = func.call @cc_make_string(%1121, %1122) : (!llvm.ptr, i64) -> i64
      %1124 = func.call @cc_intern(%1120, %1123) : (i64, i64) -> i64
      %1125 = func.call @cc_nil_value() : () -> i64
      %1126 = func.call @cc_cons(%1124, %1125) : (i64, i64) -> i64
      %1127 = func.call @cc_values_pack(%1126) : (i64) -> i64
      func.call @stack_push_pointer(%1124) : (i64) -> ()
      %1128 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1129 = arith.constant 2 : i64
      %1130 = func.call @cc_make_string(%1128, %1129) : (!llvm.ptr, i64) -> i64
      %1131 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1132 = arith.constant 11 : i64
      %1133 = func.call @cc_make_string(%1131, %1132) : (!llvm.ptr, i64) -> i64
      %1134 = func.call @cc_intern(%1130, %1133) : (i64, i64) -> i64
      %1135 = func.call @cc_nil_value() : () -> i64
      %1136 = func.call @cc_cons(%1134, %1135) : (i64, i64) -> i64
      %1137 = func.call @cc_values_pack(%1136) : (i64) -> i64
      func.call @stack_push_pointer(%1134) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1138 = func.call @stack_pop_pointer() : () -> i64
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @cc_cons(%1139, %1138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1140) : (i64) -> ()
      %1141 = func.call @stack_pop_pointer() : () -> i64
      %1142 = func.call @stack_pop_pointer() : () -> i64
      %1143 = func.call @cc_cons(%1142, %1141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1143) : (i64) -> ()
      %1144 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1145 = arith.constant 8 : i64
      %1146 = func.call @cc_make_string(%1144, %1145) : (!llvm.ptr, i64) -> i64
      %1147 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1148 = arith.constant 11 : i64
      %1149 = func.call @cc_make_string(%1147, %1148) : (!llvm.ptr, i64) -> i64
      %1150 = func.call @cc_intern(%1146, %1149) : (i64, i64) -> i64
      %1151 = func.call @cc_nil_value() : () -> i64
      %1152 = func.call @cc_cons(%1150, %1151) : (i64, i64) -> i64
      %1153 = func.call @cc_values_pack(%1152) : (i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1154 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1154) : (i64) -> ()
      %1155 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1156 = arith.constant 6 : i64
      %1157 = func.call @cc_make_string(%1155, %1156) : (!llvm.ptr, i64) -> i64
      %1158 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1159 = arith.constant 11 : i64
      %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
      %1161 = func.call @cc_intern(%1157, %1160) : (i64, i64) -> i64
      %1162 = func.call @cc_nil_value() : () -> i64
      %1163 = func.call @cc_cons(%1161, %1162) : (i64, i64) -> i64
      %1164 = func.call @cc_values_pack(%1163) : (i64) -> i64
      func.call @stack_push_pointer(%1161) : (i64) -> ()
      %1165 = func.call @stack_pop_pointer() : () -> i64
      %1166 = func.call @stack_pop_pointer() : () -> i64
      %1167 = func.call @cc_cons(%1165, %1166) : (i64, i64) -> i64
      %1168 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1169 = arith.constant 5 : i64
      %1170 = func.call @cc_make_string(%1168, %1169) : (!llvm.ptr, i64) -> i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_intern(%1170, %1171) : (i64, i64) -> i64
      %1173 = func.call @cc_nil_value() : () -> i64
      %1174 = func.call @cc_cons(%1172, %1173) : (i64, i64) -> i64
      %1175 = func.call @cc_values_pack(%1174) : (i64) -> i64
      %1176 = func.call @cc_cons(%1172, %1167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1176) : (i64) -> ()
      %1177 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1178 = arith.constant 10 : i64
      %1179 = func.call @cc_make_string(%1177, %1178) : (!llvm.ptr, i64) -> i64
      %1180 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1181 = arith.constant 11 : i64
      %1182 = func.call @cc_make_string(%1180, %1181) : (!llvm.ptr, i64) -> i64
      %1183 = func.call @cc_intern(%1179, %1182) : (i64, i64) -> i64
      %1184 = func.call @cc_nil_value() : () -> i64
      %1185 = func.call @cc_cons(%1183, %1184) : (i64, i64) -> i64
      %1186 = func.call @cc_values_pack(%1185) : (i64) -> i64
      func.call @stack_push_pointer(%1183) : (i64) -> ()
      %1187 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1187) : (i64) -> ()
      %1188 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1189 = arith.constant 6 : i64
      %1190 = func.call @cc_make_string(%1188, %1189) : (!llvm.ptr, i64) -> i64
      %1191 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1192 = arith.constant 11 : i64
      %1193 = func.call @cc_make_string(%1191, %1192) : (!llvm.ptr, i64) -> i64
      %1194 = func.call @cc_intern(%1190, %1193) : (i64, i64) -> i64
      %1195 = func.call @cc_nil_value() : () -> i64
      %1196 = func.call @cc_cons(%1194, %1195) : (i64, i64) -> i64
      %1197 = func.call @cc_values_pack(%1196) : (i64) -> i64
      func.call @stack_push_pointer(%1194) : (i64) -> ()
      %1198 = func.call @stack_pop_pointer() : () -> i64
      %1199 = func.call @stack_pop_pointer() : () -> i64
      %1200 = func.call @cc_cons(%1198, %1199) : (i64, i64) -> i64
      %1201 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1202 = arith.constant 5 : i64
      %1203 = func.call @cc_make_string(%1201, %1202) : (!llvm.ptr, i64) -> i64
      %1204 = func.call @cc_nil_value() : () -> i64
      %1205 = func.call @cc_intern(%1203, %1204) : (i64, i64) -> i64
      %1206 = func.call @cc_nil_value() : () -> i64
      %1207 = func.call @cc_cons(%1205, %1206) : (i64, i64) -> i64
      %1208 = func.call @cc_values_pack(%1207) : (i64) -> i64
      %1209 = func.call @cc_cons(%1205, %1200) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1209) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1210 = func.call @stack_pop_pointer() : () -> i64
      %1211 = func.call @stack_pop_pointer() : () -> i64
      %1212 = func.call @cc_cons(%1211, %1210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1212) : (i64) -> ()
      %1213 = func.call @stack_pop_pointer() : () -> i64
      %1214 = func.call @stack_pop_pointer() : () -> i64
      %1215 = func.call @cc_cons(%1214, %1213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1216 = func.call @stack_pop_pointer() : () -> i64
      %1217 = func.call @stack_pop_pointer() : () -> i64
      %1218 = func.call @cc_cons(%1217, %1216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1218) : (i64) -> ()
      %1219 = func.call @stack_pop_pointer() : () -> i64
      %1220 = func.call @stack_pop_pointer() : () -> i64
      %1221 = func.call @cc_cons(%1220, %1219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1221) : (i64) -> ()
      %1222 = func.call @stack_pop_pointer() : () -> i64
      %1223 = func.call @stack_pop_pointer() : () -> i64
      %1224 = func.call @cc_cons(%1223, %1222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1224) : (i64) -> ()
      %1225 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1226 = arith.constant 3 : i64
      %1227 = func.call @cc_make_string(%1225, %1226) : (!llvm.ptr, i64) -> i64
      %1228 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1229 = arith.constant 11 : i64
      %1230 = func.call @cc_make_string(%1228, %1229) : (!llvm.ptr, i64) -> i64
      %1231 = func.call @cc_intern(%1227, %1230) : (i64, i64) -> i64
      %1232 = func.call @cc_nil_value() : () -> i64
      %1233 = func.call @cc_cons(%1231, %1232) : (i64, i64) -> i64
      %1234 = func.call @cc_values_pack(%1233) : (i64) -> i64
      func.call @stack_push_pointer(%1231) : (i64) -> ()
      %1235 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1236 = arith.constant 2 : i64
      %1237 = func.call @cc_make_string(%1235, %1236) : (!llvm.ptr, i64) -> i64
      %1238 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1239 = arith.constant 11 : i64
      %1240 = func.call @cc_make_string(%1238, %1239) : (!llvm.ptr, i64) -> i64
      %1241 = func.call @cc_intern(%1237, %1240) : (i64, i64) -> i64
      %1242 = func.call @cc_nil_value() : () -> i64
      %1243 = func.call @cc_cons(%1241, %1242) : (i64, i64) -> i64
      %1244 = func.call @cc_values_pack(%1243) : (i64) -> i64
      func.call @stack_push_pointer(%1241) : (i64) -> ()
      %1245 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1246 = arith.constant 2 : i64
      %1247 = func.call @cc_make_string(%1245, %1246) : (!llvm.ptr, i64) -> i64
      %1248 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1249 = arith.constant 11 : i64
      %1250 = func.call @cc_make_string(%1248, %1249) : (!llvm.ptr, i64) -> i64
      %1251 = func.call @cc_intern(%1247, %1250) : (i64, i64) -> i64
      %1252 = func.call @cc_nil_value() : () -> i64
      %1253 = func.call @cc_cons(%1251, %1252) : (i64, i64) -> i64
      %1254 = func.call @cc_values_pack(%1253) : (i64) -> i64
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1255 = func.call @stack_pop_pointer() : () -> i64
      %1256 = func.call @stack_pop_pointer() : () -> i64
      %1257 = func.call @cc_cons(%1256, %1255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1257) : (i64) -> ()
      %1258 = func.call @stack_pop_pointer() : () -> i64
      %1259 = func.call @stack_pop_pointer() : () -> i64
      %1260 = func.call @cc_cons(%1259, %1258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1260) : (i64) -> ()
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = func.call @stack_pop_pointer() : () -> i64
      %1263 = func.call @cc_cons(%1262, %1261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1264 = func.call @stack_pop_pointer() : () -> i64
      %1265 = func.call @stack_pop_pointer() : () -> i64
      %1266 = func.call @cc_cons(%1265, %1264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1266) : (i64) -> ()
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_cons(%1268, %1267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1269) : (i64) -> ()
      %1270 = func.call @stack_pop_pointer() : () -> i64
      %1271 = func.call @stack_pop_pointer() : () -> i64
      %1272 = func.call @cc_cons(%1271, %1270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1272) : (i64) -> ()
      %1273 = func.call @stack_pop_pointer() : () -> i64
      %1274 = func.call @stack_pop_pointer() : () -> i64
      %1275 = func.call @cc_cons(%1274, %1273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1275) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1276 = func.call @stack_pop_pointer() : () -> i64
      %1277 = func.call @stack_pop_pointer() : () -> i64
      %1278 = func.call @cc_cons(%1277, %1276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1278) : (i64) -> ()
      %1279 = func.call @stack_pop_pointer() : () -> i64
      %1280 = func.call @stack_pop_pointer() : () -> i64
      %1281 = func.call @cc_cons(%1280, %1279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1281) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1282 = func.call @stack_pop_pointer() : () -> i64
      %1283 = func.call @stack_pop_pointer() : () -> i64
      %1284 = func.call @cc_cons(%1283, %1282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1284) : (i64) -> ()
      %1285 = func.call @stack_pop_pointer() : () -> i64
      %1286 = func.call @stack_pop_pointer() : () -> i64
      %1287 = func.call @cc_cons(%1286, %1285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1287) : (i64) -> ()
      %1288 = func.call @stack_pop_pointer() : () -> i64
      %1351 = arith.constant 206494159077381 : i64
      %1352 = arith.constant 0 : i64
      %1353 = func.call @cc_make_closure(%1351, %1352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1353) : (i64) -> ()
      %1354 = func.call @stack_pop_pointer() : () -> i64
      %1355 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1356 = arith.constant 1 : i64
      %1357 = func.call @cc_make_string(%1355, %1356) : (!llvm.ptr, i64) -> i64
      %1358 = func.call @cc_nil_value() : () -> i64
      %1359 = func.call @cc_intern(%1357, %1358) : (i64, i64) -> i64
      %1360 = func.call @cc_nil_value() : () -> i64
      %1361 = func.call @cc_cons(%1359, %1360) : (i64, i64) -> i64
      %1362 = func.call @cc_values_pack(%1361) : (i64) -> i64
      func.call @stack_push_pointer(%1359) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1363 = func.call @stack_pop_pointer() : () -> i64
      %1364 = func.call @stack_pop_pointer() : () -> i64
      %1365 = func.call @cc_cons(%1364, %1363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1365) : (i64) -> ()
      %1366 = func.call @stack_pop_pointer() : () -> i64
      %1367 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1368 = arith.constant 11 : i64
      %1369 = func.call @cc_make_string(%1367, %1368) : (!llvm.ptr, i64) -> i64
      %1370 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1371 = arith.constant 7 : i64
      %1372 = func.call @cc_make_string(%1370, %1371) : (!llvm.ptr, i64) -> i64
      %1373 = func.call @cc_intern(%1369, %1372) : (i64, i64) -> i64
      %1374 = func.call @cc_nil_value() : () -> i64
      %1375 = func.call @cc_cons(%1373, %1374) : (i64, i64) -> i64
      %1376 = func.call @cc_values_pack(%1375) : (i64) -> i64
      func.call @stack_push_pointer(%1373) : (i64) -> ()
      %1377 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1380 = arith.constant 4 : i64
      %1381 = func.call @cc_make_string(%1379, %1380) : (!llvm.ptr, i64) -> i64
      %1382 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1383 = arith.constant 7 : i64
      %1384 = func.call @cc_make_string(%1382, %1383) : (!llvm.ptr, i64) -> i64
      %1385 = func.call @cc_intern(%1381, %1384) : (i64, i64) -> i64
      %1386 = func.call @cc_nil_value() : () -> i64
      %1387 = func.call @cc_cons(%1385, %1386) : (i64, i64) -> i64
      %1388 = func.call @cc_values_pack(%1387) : (i64) -> i64
      func.call @stack_push_pointer(%1385) : (i64) -> ()
      %1389 = func.call @stack_pop_pointer() : () -> i64
      %1390 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1391 = arith.constant 6 : i64
      %1392 = func.call @cc_make_string(%1390, %1391) : (!llvm.ptr, i64) -> i64
      %1393 = func.call @cc_nil_value() : () -> i64
      %1394 = func.call @cc_intern(%1392, %1393) : (i64, i64) -> i64
      %1395 = func.call @cc_nil_value() : () -> i64
      %1396 = func.call @cc_cons(%1394, %1395) : (i64, i64) -> i64
      %1397 = func.call @cc_values_pack(%1396) : (i64) -> i64
      func.call @stack_push_pointer(%1394) : (i64) -> ()
      %1398 = func.call @stack_pop_pointer() : () -> i64
      %1399 = func.call @cc_nil_value() : () -> i64
      %1400 = func.call @cc_errorp(%1091) : (i64) -> i64
      %1401 = arith.cmpi ne, %1400, %1399 : i64
      %1402 = arith.cmpi eq, %1399, %1399 : i64
      %1403 = arith.andi %1401, %1402 : i1
      %1404 = scf.if %1403 -> (i64) {
        scf.yield %1091 : i64
      } else {
        scf.yield %1399 : i64
      }
      %1405 = func.call @cc_errorp(%1288) : (i64) -> i64
      %1406 = arith.cmpi ne, %1405, %1399 : i64
      %1407 = arith.cmpi eq, %1404, %1399 : i64
      %1408 = arith.andi %1406, %1407 : i1
      %1409 = scf.if %1408 -> (i64) {
        scf.yield %1288 : i64
      } else {
        scf.yield %1404 : i64
      }
      %1410 = func.call @cc_errorp(%1354) : (i64) -> i64
      %1411 = arith.cmpi ne, %1410, %1399 : i64
      %1412 = arith.cmpi eq, %1409, %1399 : i64
      %1413 = arith.andi %1411, %1412 : i1
      %1414 = scf.if %1413 -> (i64) {
        scf.yield %1354 : i64
      } else {
        scf.yield %1409 : i64
      }
      %1415 = func.call @cc_errorp(%1366) : (i64) -> i64
      %1416 = arith.cmpi ne, %1415, %1399 : i64
      %1417 = arith.cmpi eq, %1414, %1399 : i64
      %1418 = arith.andi %1416, %1417 : i1
      %1419 = scf.if %1418 -> (i64) {
        scf.yield %1366 : i64
      } else {
        scf.yield %1414 : i64
      }
      %1420 = func.call @cc_errorp(%1377) : (i64) -> i64
      %1421 = arith.cmpi ne, %1420, %1399 : i64
      %1422 = arith.cmpi eq, %1419, %1399 : i64
      %1423 = arith.andi %1421, %1422 : i1
      %1424 = scf.if %1423 -> (i64) {
        scf.yield %1377 : i64
      } else {
        scf.yield %1419 : i64
      }
      %1425 = func.call @cc_errorp(%1378) : (i64) -> i64
      %1426 = arith.cmpi ne, %1425, %1399 : i64
      %1427 = arith.cmpi eq, %1424, %1399 : i64
      %1428 = arith.andi %1426, %1427 : i1
      %1429 = scf.if %1428 -> (i64) {
        scf.yield %1378 : i64
      } else {
        scf.yield %1424 : i64
      }
      %1430 = func.call @cc_errorp(%1389) : (i64) -> i64
      %1431 = arith.cmpi ne, %1430, %1399 : i64
      %1432 = arith.cmpi eq, %1429, %1399 : i64
      %1433 = arith.andi %1431, %1432 : i1
      %1434 = scf.if %1433 -> (i64) {
        scf.yield %1389 : i64
      } else {
        scf.yield %1429 : i64
      }
      %1435 = func.call @cc_errorp(%1398) : (i64) -> i64
      %1436 = arith.cmpi ne, %1435, %1399 : i64
      %1437 = arith.cmpi eq, %1434, %1399 : i64
      %1438 = arith.andi %1436, %1437 : i1
      %1439 = scf.if %1438 -> (i64) {
        scf.yield %1398 : i64
      } else {
        scf.yield %1434 : i64
      }
      %1440 = arith.cmpi ne, %1439, %1399 : i64
      scf.if %1440 {
        func.call @stack_push_pointer(%1439) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1091) : (i64) -> ()
        func.call @stack_push_pointer(%1288) : (i64) -> ()
        func.call @stack_push_pointer(%1354) : (i64) -> ()
        func.call @stack_push_pointer(%1366) : (i64) -> ()
        func.call @stack_push_pointer(%1377) : (i64) -> ()
        func.call @stack_push_pointer(%1378) : (i64) -> ()
        func.call @stack_push_pointer(%1389) : (i64) -> ()
        func.call @stack_push_pointer(%1398) : (i64) -> ()
        %1441 = llvm.mlir.addressof @str154 : !llvm.ptr
        %1442 = func.call @cc_make_function_ref_const(%1441) : (!llvm.ptr) -> i64
        %1443 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1442, %1443) : (i64, i64) -> ()
      }
      %1444 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1444 : i64
    }
    %1445 = func.call @cc_nil_value() : () -> i64
    %1446 = func.call @cc_errorp(%1082) : (i64) -> i64
    %1447 = arith.cmpi ne, %1446, %1445 : i64
    %1448 = scf.if %1447 -> (i64) {
      scf.yield %1082 : i64
    } else {
      %1449 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1450 = arith.constant 15 : i64
      %1451 = func.call @cc_make_string(%1449, %1450) : (!llvm.ptr, i64) -> i64
      %1452 = func.call @cc_nil_value() : () -> i64
      %1453 = func.call @cc_intern(%1451, %1452) : (i64, i64) -> i64
      %1454 = func.call @cc_nil_value() : () -> i64
      %1455 = func.call @cc_cons(%1453, %1454) : (i64, i64) -> i64
      %1456 = func.call @cc_values_pack(%1455) : (i64) -> i64
      func.call @stack_push_pointer(%1453) : (i64) -> ()
      %1457 = func.call @stack_pop_pointer() : () -> i64
      %1458 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1459 = arith.constant 3 : i64
      %1460 = func.call @cc_make_string(%1458, %1459) : (!llvm.ptr, i64) -> i64
      %1461 = func.call @cc_nil_value() : () -> i64
      %1462 = func.call @cc_intern(%1460, %1461) : (i64, i64) -> i64
      %1463 = func.call @cc_nil_value() : () -> i64
      %1464 = func.call @cc_cons(%1462, %1463) : (i64, i64) -> i64
      %1465 = func.call @cc_values_pack(%1464) : (i64) -> i64
      func.call @stack_push_pointer(%1462) : (i64) -> ()
      %1466 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1467 = arith.constant 3 : i64
      %1468 = func.call @cc_make_string(%1466, %1467) : (!llvm.ptr, i64) -> i64
      %1469 = func.call @cc_nil_value() : () -> i64
      %1470 = func.call @cc_intern(%1468, %1469) : (i64, i64) -> i64
      %1471 = func.call @cc_nil_value() : () -> i64
      %1472 = func.call @cc_cons(%1470, %1471) : (i64, i64) -> i64
      %1473 = func.call @cc_values_pack(%1472) : (i64) -> i64
      func.call @stack_push_pointer(%1470) : (i64) -> ()
      %1474 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1475 = arith.constant 19 : i64
      %1476 = func.call @cc_make_string(%1474, %1475) : (!llvm.ptr, i64) -> i64
      %1477 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1478 = arith.constant 11 : i64
      %1479 = func.call @cc_make_string(%1477, %1478) : (!llvm.ptr, i64) -> i64
      %1480 = func.call @cc_intern(%1476, %1479) : (i64, i64) -> i64
      %1481 = func.call @cc_nil_value() : () -> i64
      %1482 = func.call @cc_cons(%1480, %1481) : (i64, i64) -> i64
      %1483 = func.call @cc_values_pack(%1482) : (i64) -> i64
      func.call @stack_push_pointer(%1480) : (i64) -> ()
      %1484 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1485 = arith.constant 2 : i64
      %1486 = func.call @cc_make_string(%1484, %1485) : (!llvm.ptr, i64) -> i64
      %1487 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1488 = arith.constant 11 : i64
      %1489 = func.call @cc_make_string(%1487, %1488) : (!llvm.ptr, i64) -> i64
      %1490 = func.call @cc_intern(%1486, %1489) : (i64, i64) -> i64
      %1491 = func.call @cc_nil_value() : () -> i64
      %1492 = func.call @cc_cons(%1490, %1491) : (i64, i64) -> i64
      %1493 = func.call @cc_values_pack(%1492) : (i64) -> i64
      func.call @stack_push_pointer(%1490) : (i64) -> ()
      %1494 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1495 = arith.constant 2 : i64
      %1496 = func.call @cc_make_string(%1494, %1495) : (!llvm.ptr, i64) -> i64
      %1497 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1498 = arith.constant 11 : i64
      %1499 = func.call @cc_make_string(%1497, %1498) : (!llvm.ptr, i64) -> i64
      %1500 = func.call @cc_intern(%1496, %1499) : (i64, i64) -> i64
      %1501 = func.call @cc_nil_value() : () -> i64
      %1502 = func.call @cc_cons(%1500, %1501) : (i64, i64) -> i64
      %1503 = func.call @cc_values_pack(%1502) : (i64) -> i64
      func.call @stack_push_pointer(%1500) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1504 = func.call @stack_pop_pointer() : () -> i64
      %1505 = func.call @stack_pop_pointer() : () -> i64
      %1506 = func.call @cc_cons(%1505, %1504) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1506) : (i64) -> ()
      %1507 = func.call @stack_pop_pointer() : () -> i64
      %1508 = func.call @stack_pop_pointer() : () -> i64
      %1509 = func.call @cc_cons(%1508, %1507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1509) : (i64) -> ()
      %1510 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1511 = arith.constant 8 : i64
      %1512 = func.call @cc_make_string(%1510, %1511) : (!llvm.ptr, i64) -> i64
      %1513 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1514 = arith.constant 11 : i64
      %1515 = func.call @cc_make_string(%1513, %1514) : (!llvm.ptr, i64) -> i64
      %1516 = func.call @cc_intern(%1512, %1515) : (i64, i64) -> i64
      %1517 = func.call @cc_nil_value() : () -> i64
      %1518 = func.call @cc_cons(%1516, %1517) : (i64, i64) -> i64
      %1519 = func.call @cc_values_pack(%1518) : (i64) -> i64
      func.call @stack_push_pointer(%1516) : (i64) -> ()
      %1520 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1521 = arith.constant 10 : i64
      %1522 = func.call @cc_make_string(%1520, %1521) : (!llvm.ptr, i64) -> i64
      %1523 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1524 = arith.constant 11 : i64
      %1525 = func.call @cc_make_string(%1523, %1524) : (!llvm.ptr, i64) -> i64
      %1526 = func.call @cc_intern(%1522, %1525) : (i64, i64) -> i64
      %1527 = func.call @cc_nil_value() : () -> i64
      %1528 = func.call @cc_cons(%1526, %1527) : (i64, i64) -> i64
      %1529 = func.call @cc_values_pack(%1528) : (i64) -> i64
      func.call @stack_push_pointer(%1526) : (i64) -> ()
      %1530 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1530) : (i64) -> ()
      %1531 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1532 = arith.constant 6 : i64
      %1533 = func.call @cc_make_string(%1531, %1532) : (!llvm.ptr, i64) -> i64
      %1534 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1535 = arith.constant 11 : i64
      %1536 = func.call @cc_make_string(%1534, %1535) : (!llvm.ptr, i64) -> i64
      %1537 = func.call @cc_intern(%1533, %1536) : (i64, i64) -> i64
      %1538 = func.call @cc_nil_value() : () -> i64
      %1539 = func.call @cc_cons(%1537, %1538) : (i64, i64) -> i64
      %1540 = func.call @cc_values_pack(%1539) : (i64) -> i64
      func.call @stack_push_pointer(%1537) : (i64) -> ()
      %1541 = func.call @stack_pop_pointer() : () -> i64
      %1542 = func.call @stack_pop_pointer() : () -> i64
      %1543 = func.call @cc_cons(%1541, %1542) : (i64, i64) -> i64
      %1544 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1545 = arith.constant 5 : i64
      %1546 = func.call @cc_make_string(%1544, %1545) : (!llvm.ptr, i64) -> i64
      %1547 = func.call @cc_nil_value() : () -> i64
      %1548 = func.call @cc_intern(%1546, %1547) : (i64, i64) -> i64
      %1549 = func.call @cc_nil_value() : () -> i64
      %1550 = func.call @cc_cons(%1548, %1549) : (i64, i64) -> i64
      %1551 = func.call @cc_values_pack(%1550) : (i64) -> i64
      %1552 = func.call @cc_cons(%1548, %1543) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1553 = func.call @stack_pop_pointer() : () -> i64
      %1554 = func.call @stack_pop_pointer() : () -> i64
      %1555 = func.call @cc_cons(%1554, %1553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1555) : (i64) -> ()
      %1556 = func.call @stack_pop_pointer() : () -> i64
      %1557 = func.call @stack_pop_pointer() : () -> i64
      %1558 = func.call @cc_cons(%1557, %1556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1558) : (i64) -> ()
      %1559 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1559) : (i64) -> ()
      %1560 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1561 = arith.constant 6 : i64
      %1562 = func.call @cc_make_string(%1560, %1561) : (!llvm.ptr, i64) -> i64
      %1563 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1564 = arith.constant 11 : i64
      %1565 = func.call @cc_make_string(%1563, %1564) : (!llvm.ptr, i64) -> i64
      %1566 = func.call @cc_intern(%1562, %1565) : (i64, i64) -> i64
      %1567 = func.call @cc_nil_value() : () -> i64
      %1568 = func.call @cc_cons(%1566, %1567) : (i64, i64) -> i64
      %1569 = func.call @cc_values_pack(%1568) : (i64) -> i64
      func.call @stack_push_pointer(%1566) : (i64) -> ()
      %1570 = func.call @stack_pop_pointer() : () -> i64
      %1571 = func.call @stack_pop_pointer() : () -> i64
      %1572 = func.call @cc_cons(%1570, %1571) : (i64, i64) -> i64
      %1573 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1574 = arith.constant 5 : i64
      %1575 = func.call @cc_make_string(%1573, %1574) : (!llvm.ptr, i64) -> i64
      %1576 = func.call @cc_nil_value() : () -> i64
      %1577 = func.call @cc_intern(%1575, %1576) : (i64, i64) -> i64
      %1578 = func.call @cc_nil_value() : () -> i64
      %1579 = func.call @cc_cons(%1577, %1578) : (i64, i64) -> i64
      %1580 = func.call @cc_values_pack(%1579) : (i64) -> i64
      %1581 = func.call @cc_cons(%1577, %1572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1581) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1582 = func.call @stack_pop_pointer() : () -> i64
      %1583 = func.call @stack_pop_pointer() : () -> i64
      %1584 = func.call @cc_cons(%1583, %1582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1584) : (i64) -> ()
      %1585 = func.call @stack_pop_pointer() : () -> i64
      %1586 = func.call @stack_pop_pointer() : () -> i64
      %1587 = func.call @cc_cons(%1586, %1585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1587) : (i64) -> ()
      %1588 = func.call @stack_pop_pointer() : () -> i64
      %1589 = func.call @stack_pop_pointer() : () -> i64
      %1590 = func.call @cc_cons(%1589, %1588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1590) : (i64) -> ()
      %1591 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1592 = arith.constant 3 : i64
      %1593 = func.call @cc_make_string(%1591, %1592) : (!llvm.ptr, i64) -> i64
      %1594 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1595 = arith.constant 11 : i64
      %1596 = func.call @cc_make_string(%1594, %1595) : (!llvm.ptr, i64) -> i64
      %1597 = func.call @cc_intern(%1593, %1596) : (i64, i64) -> i64
      %1598 = func.call @cc_nil_value() : () -> i64
      %1599 = func.call @cc_cons(%1597, %1598) : (i64, i64) -> i64
      %1600 = func.call @cc_values_pack(%1599) : (i64) -> i64
      func.call @stack_push_pointer(%1597) : (i64) -> ()
      %1601 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1602 = arith.constant 2 : i64
      %1603 = func.call @cc_make_string(%1601, %1602) : (!llvm.ptr, i64) -> i64
      %1604 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1605 = arith.constant 11 : i64
      %1606 = func.call @cc_make_string(%1604, %1605) : (!llvm.ptr, i64) -> i64
      %1607 = func.call @cc_intern(%1603, %1606) : (i64, i64) -> i64
      %1608 = func.call @cc_nil_value() : () -> i64
      %1609 = func.call @cc_cons(%1607, %1608) : (i64, i64) -> i64
      %1610 = func.call @cc_values_pack(%1609) : (i64) -> i64
      func.call @stack_push_pointer(%1607) : (i64) -> ()
      %1611 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1612 = arith.constant 2 : i64
      %1613 = func.call @cc_make_string(%1611, %1612) : (!llvm.ptr, i64) -> i64
      %1614 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1615 = arith.constant 11 : i64
      %1616 = func.call @cc_make_string(%1614, %1615) : (!llvm.ptr, i64) -> i64
      %1617 = func.call @cc_intern(%1613, %1616) : (i64, i64) -> i64
      %1618 = func.call @cc_nil_value() : () -> i64
      %1619 = func.call @cc_cons(%1617, %1618) : (i64, i64) -> i64
      %1620 = func.call @cc_values_pack(%1619) : (i64) -> i64
      func.call @stack_push_pointer(%1617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1621 = func.call @stack_pop_pointer() : () -> i64
      %1622 = func.call @stack_pop_pointer() : () -> i64
      %1623 = func.call @cc_cons(%1622, %1621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1623) : (i64) -> ()
      %1624 = func.call @stack_pop_pointer() : () -> i64
      %1625 = func.call @stack_pop_pointer() : () -> i64
      %1626 = func.call @cc_cons(%1625, %1624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1626) : (i64) -> ()
      %1627 = func.call @stack_pop_pointer() : () -> i64
      %1628 = func.call @stack_pop_pointer() : () -> i64
      %1629 = func.call @cc_cons(%1628, %1627) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1629) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1630 = func.call @stack_pop_pointer() : () -> i64
      %1631 = func.call @stack_pop_pointer() : () -> i64
      %1632 = func.call @cc_cons(%1631, %1630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1632) : (i64) -> ()
      %1633 = func.call @stack_pop_pointer() : () -> i64
      %1634 = func.call @stack_pop_pointer() : () -> i64
      %1635 = func.call @cc_cons(%1634, %1633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1635) : (i64) -> ()
      %1636 = func.call @stack_pop_pointer() : () -> i64
      %1637 = func.call @stack_pop_pointer() : () -> i64
      %1638 = func.call @cc_cons(%1637, %1636) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1638) : (i64) -> ()
      %1639 = func.call @stack_pop_pointer() : () -> i64
      %1640 = func.call @stack_pop_pointer() : () -> i64
      %1641 = func.call @cc_cons(%1640, %1639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1642 = func.call @stack_pop_pointer() : () -> i64
      %1643 = func.call @stack_pop_pointer() : () -> i64
      %1644 = func.call @cc_cons(%1643, %1642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1644) : (i64) -> ()
      %1645 = func.call @stack_pop_pointer() : () -> i64
      %1646 = func.call @stack_pop_pointer() : () -> i64
      %1647 = func.call @cc_cons(%1646, %1645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1647) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1648 = func.call @stack_pop_pointer() : () -> i64
      %1649 = func.call @stack_pop_pointer() : () -> i64
      %1650 = func.call @cc_cons(%1649, %1648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1650) : (i64) -> ()
      %1651 = func.call @stack_pop_pointer() : () -> i64
      %1652 = func.call @stack_pop_pointer() : () -> i64
      %1653 = func.call @cc_cons(%1652, %1651) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1653) : (i64) -> ()
      %1654 = func.call @stack_pop_pointer() : () -> i64
      %1717 = arith.constant 206494159077382 : i64
      %1718 = arith.constant 0 : i64
      %1719 = func.call @cc_make_closure(%1717, %1718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1719) : (i64) -> ()
      %1720 = func.call @stack_pop_pointer() : () -> i64
      %1721 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1722 = arith.constant 1 : i64
      %1723 = func.call @cc_make_string(%1721, %1722) : (!llvm.ptr, i64) -> i64
      %1724 = func.call @cc_nil_value() : () -> i64
      %1725 = func.call @cc_intern(%1723, %1724) : (i64, i64) -> i64
      %1726 = func.call @cc_nil_value() : () -> i64
      %1727 = func.call @cc_cons(%1725, %1726) : (i64, i64) -> i64
      %1728 = func.call @cc_values_pack(%1727) : (i64) -> i64
      func.call @stack_push_pointer(%1725) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1729 = func.call @stack_pop_pointer() : () -> i64
      %1730 = func.call @stack_pop_pointer() : () -> i64
      %1731 = func.call @cc_cons(%1730, %1729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1731) : (i64) -> ()
      %1732 = func.call @stack_pop_pointer() : () -> i64
      %1733 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1734 = arith.constant 11 : i64
      %1735 = func.call @cc_make_string(%1733, %1734) : (!llvm.ptr, i64) -> i64
      %1736 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1737 = arith.constant 7 : i64
      %1738 = func.call @cc_make_string(%1736, %1737) : (!llvm.ptr, i64) -> i64
      %1739 = func.call @cc_intern(%1735, %1738) : (i64, i64) -> i64
      %1740 = func.call @cc_nil_value() : () -> i64
      %1741 = func.call @cc_cons(%1739, %1740) : (i64, i64) -> i64
      %1742 = func.call @cc_values_pack(%1741) : (i64) -> i64
      func.call @stack_push_pointer(%1739) : (i64) -> ()
      %1743 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1744 = func.call @stack_pop_pointer() : () -> i64
      %1745 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1746 = arith.constant 4 : i64
      %1747 = func.call @cc_make_string(%1745, %1746) : (!llvm.ptr, i64) -> i64
      %1748 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1749 = arith.constant 7 : i64
      %1750 = func.call @cc_make_string(%1748, %1749) : (!llvm.ptr, i64) -> i64
      %1751 = func.call @cc_intern(%1747, %1750) : (i64, i64) -> i64
      %1752 = func.call @cc_nil_value() : () -> i64
      %1753 = func.call @cc_cons(%1751, %1752) : (i64, i64) -> i64
      %1754 = func.call @cc_values_pack(%1753) : (i64) -> i64
      func.call @stack_push_pointer(%1751) : (i64) -> ()
      %1755 = func.call @stack_pop_pointer() : () -> i64
      %1756 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1757 = arith.constant 6 : i64
      %1758 = func.call @cc_make_string(%1756, %1757) : (!llvm.ptr, i64) -> i64
      %1759 = func.call @cc_nil_value() : () -> i64
      %1760 = func.call @cc_intern(%1758, %1759) : (i64, i64) -> i64
      %1761 = func.call @cc_nil_value() : () -> i64
      %1762 = func.call @cc_cons(%1760, %1761) : (i64, i64) -> i64
      %1763 = func.call @cc_values_pack(%1762) : (i64) -> i64
      func.call @stack_push_pointer(%1760) : (i64) -> ()
      %1764 = func.call @stack_pop_pointer() : () -> i64
      %1765 = func.call @cc_nil_value() : () -> i64
      %1766 = func.call @cc_errorp(%1457) : (i64) -> i64
      %1767 = arith.cmpi ne, %1766, %1765 : i64
      %1768 = arith.cmpi eq, %1765, %1765 : i64
      %1769 = arith.andi %1767, %1768 : i1
      %1770 = scf.if %1769 -> (i64) {
        scf.yield %1457 : i64
      } else {
        scf.yield %1765 : i64
      }
      %1771 = func.call @cc_errorp(%1654) : (i64) -> i64
      %1772 = arith.cmpi ne, %1771, %1765 : i64
      %1773 = arith.cmpi eq, %1770, %1765 : i64
      %1774 = arith.andi %1772, %1773 : i1
      %1775 = scf.if %1774 -> (i64) {
        scf.yield %1654 : i64
      } else {
        scf.yield %1770 : i64
      }
      %1776 = func.call @cc_errorp(%1720) : (i64) -> i64
      %1777 = arith.cmpi ne, %1776, %1765 : i64
      %1778 = arith.cmpi eq, %1775, %1765 : i64
      %1779 = arith.andi %1777, %1778 : i1
      %1780 = scf.if %1779 -> (i64) {
        scf.yield %1720 : i64
      } else {
        scf.yield %1775 : i64
      }
      %1781 = func.call @cc_errorp(%1732) : (i64) -> i64
      %1782 = arith.cmpi ne, %1781, %1765 : i64
      %1783 = arith.cmpi eq, %1780, %1765 : i64
      %1784 = arith.andi %1782, %1783 : i1
      %1785 = scf.if %1784 -> (i64) {
        scf.yield %1732 : i64
      } else {
        scf.yield %1780 : i64
      }
      %1786 = func.call @cc_errorp(%1743) : (i64) -> i64
      %1787 = arith.cmpi ne, %1786, %1765 : i64
      %1788 = arith.cmpi eq, %1785, %1765 : i64
      %1789 = arith.andi %1787, %1788 : i1
      %1790 = scf.if %1789 -> (i64) {
        scf.yield %1743 : i64
      } else {
        scf.yield %1785 : i64
      }
      %1791 = func.call @cc_errorp(%1744) : (i64) -> i64
      %1792 = arith.cmpi ne, %1791, %1765 : i64
      %1793 = arith.cmpi eq, %1790, %1765 : i64
      %1794 = arith.andi %1792, %1793 : i1
      %1795 = scf.if %1794 -> (i64) {
        scf.yield %1744 : i64
      } else {
        scf.yield %1790 : i64
      }
      %1796 = func.call @cc_errorp(%1755) : (i64) -> i64
      %1797 = arith.cmpi ne, %1796, %1765 : i64
      %1798 = arith.cmpi eq, %1795, %1765 : i64
      %1799 = arith.andi %1797, %1798 : i1
      %1800 = scf.if %1799 -> (i64) {
        scf.yield %1755 : i64
      } else {
        scf.yield %1795 : i64
      }
      %1801 = func.call @cc_errorp(%1764) : (i64) -> i64
      %1802 = arith.cmpi ne, %1801, %1765 : i64
      %1803 = arith.cmpi eq, %1800, %1765 : i64
      %1804 = arith.andi %1802, %1803 : i1
      %1805 = scf.if %1804 -> (i64) {
        scf.yield %1764 : i64
      } else {
        scf.yield %1800 : i64
      }
      %1806 = arith.cmpi ne, %1805, %1765 : i64
      scf.if %1806 {
        func.call @stack_push_pointer(%1805) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1457) : (i64) -> ()
        func.call @stack_push_pointer(%1654) : (i64) -> ()
        func.call @stack_push_pointer(%1720) : (i64) -> ()
        func.call @stack_push_pointer(%1732) : (i64) -> ()
        func.call @stack_push_pointer(%1743) : (i64) -> ()
        func.call @stack_push_pointer(%1744) : (i64) -> ()
        func.call @stack_push_pointer(%1755) : (i64) -> ()
        func.call @stack_push_pointer(%1764) : (i64) -> ()
        %1807 = llvm.mlir.addressof @str191 : !llvm.ptr
        %1808 = func.call @cc_make_function_ref_const(%1807) : (!llvm.ptr) -> i64
        %1809 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1808, %1809) : (i64, i64) -> ()
      }
      %1810 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1810 : i64
    }
    %1811 = func.call @cc_nil_value() : () -> i64
    %1812 = func.call @cc_errorp(%1448) : (i64) -> i64
    %1813 = arith.cmpi ne, %1812, %1811 : i64
    %1814 = scf.if %1813 -> (i64) {
      scf.yield %1448 : i64
    } else {
      %1815 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1816 = arith.constant 15 : i64
      %1817 = func.call @cc_make_string(%1815, %1816) : (!llvm.ptr, i64) -> i64
      %1818 = func.call @cc_nil_value() : () -> i64
      %1819 = func.call @cc_intern(%1817, %1818) : (i64, i64) -> i64
      %1820 = func.call @cc_nil_value() : () -> i64
      %1821 = func.call @cc_cons(%1819, %1820) : (i64, i64) -> i64
      %1822 = func.call @cc_values_pack(%1821) : (i64) -> i64
      func.call @stack_push_pointer(%1819) : (i64) -> ()
      %1823 = func.call @stack_pop_pointer() : () -> i64
      %1824 = llvm.mlir.addressof @str193 : !llvm.ptr
      %1825 = arith.constant 3 : i64
      %1826 = func.call @cc_make_string(%1824, %1825) : (!llvm.ptr, i64) -> i64
      %1827 = func.call @cc_nil_value() : () -> i64
      %1828 = func.call @cc_intern(%1826, %1827) : (i64, i64) -> i64
      %1829 = func.call @cc_nil_value() : () -> i64
      %1830 = func.call @cc_cons(%1828, %1829) : (i64, i64) -> i64
      %1831 = func.call @cc_values_pack(%1830) : (i64) -> i64
      func.call @stack_push_pointer(%1828) : (i64) -> ()
      %1832 = llvm.mlir.addressof @str194 : !llvm.ptr
      %1833 = arith.constant 3 : i64
      %1834 = func.call @cc_make_string(%1832, %1833) : (!llvm.ptr, i64) -> i64
      %1835 = func.call @cc_nil_value() : () -> i64
      %1836 = func.call @cc_intern(%1834, %1835) : (i64, i64) -> i64
      %1837 = func.call @cc_nil_value() : () -> i64
      %1838 = func.call @cc_cons(%1836, %1837) : (i64, i64) -> i64
      %1839 = func.call @cc_values_pack(%1838) : (i64) -> i64
      func.call @stack_push_pointer(%1836) : (i64) -> ()
      %1840 = llvm.mlir.addressof @str195 : !llvm.ptr
      %1841 = arith.constant 19 : i64
      %1842 = func.call @cc_make_string(%1840, %1841) : (!llvm.ptr, i64) -> i64
      %1843 = llvm.mlir.addressof @str196 : !llvm.ptr
      %1844 = arith.constant 11 : i64
      %1845 = func.call @cc_make_string(%1843, %1844) : (!llvm.ptr, i64) -> i64
      %1846 = func.call @cc_intern(%1842, %1845) : (i64, i64) -> i64
      %1847 = func.call @cc_nil_value() : () -> i64
      %1848 = func.call @cc_cons(%1846, %1847) : (i64, i64) -> i64
      %1849 = func.call @cc_values_pack(%1848) : (i64) -> i64
      func.call @stack_push_pointer(%1846) : (i64) -> ()
      %1850 = llvm.mlir.addressof @str197 : !llvm.ptr
      %1851 = arith.constant 2 : i64
      %1852 = func.call @cc_make_string(%1850, %1851) : (!llvm.ptr, i64) -> i64
      %1853 = llvm.mlir.addressof @str198 : !llvm.ptr
      %1854 = arith.constant 11 : i64
      %1855 = func.call @cc_make_string(%1853, %1854) : (!llvm.ptr, i64) -> i64
      %1856 = func.call @cc_intern(%1852, %1855) : (i64, i64) -> i64
      %1857 = func.call @cc_nil_value() : () -> i64
      %1858 = func.call @cc_cons(%1856, %1857) : (i64, i64) -> i64
      %1859 = func.call @cc_values_pack(%1858) : (i64) -> i64
      func.call @stack_push_pointer(%1856) : (i64) -> ()
      %1860 = llvm.mlir.addressof @str199 : !llvm.ptr
      %1861 = arith.constant 2 : i64
      %1862 = func.call @cc_make_string(%1860, %1861) : (!llvm.ptr, i64) -> i64
      %1863 = llvm.mlir.addressof @str200 : !llvm.ptr
      %1864 = arith.constant 11 : i64
      %1865 = func.call @cc_make_string(%1863, %1864) : (!llvm.ptr, i64) -> i64
      %1866 = func.call @cc_intern(%1862, %1865) : (i64, i64) -> i64
      %1867 = func.call @cc_nil_value() : () -> i64
      %1868 = func.call @cc_cons(%1866, %1867) : (i64, i64) -> i64
      %1869 = func.call @cc_values_pack(%1868) : (i64) -> i64
      func.call @stack_push_pointer(%1866) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1870 = func.call @stack_pop_pointer() : () -> i64
      %1871 = func.call @stack_pop_pointer() : () -> i64
      %1872 = func.call @cc_cons(%1871, %1870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1872) : (i64) -> ()
      %1873 = func.call @stack_pop_pointer() : () -> i64
      %1874 = func.call @stack_pop_pointer() : () -> i64
      %1875 = func.call @cc_cons(%1874, %1873) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1875) : (i64) -> ()
      %1876 = llvm.mlir.addressof @str201 : !llvm.ptr
      %1877 = arith.constant 8 : i64
      %1878 = func.call @cc_make_string(%1876, %1877) : (!llvm.ptr, i64) -> i64
      %1879 = llvm.mlir.addressof @str202 : !llvm.ptr
      %1880 = arith.constant 11 : i64
      %1881 = func.call @cc_make_string(%1879, %1880) : (!llvm.ptr, i64) -> i64
      %1882 = func.call @cc_intern(%1878, %1881) : (i64, i64) -> i64
      %1883 = func.call @cc_nil_value() : () -> i64
      %1884 = func.call @cc_cons(%1882, %1883) : (i64, i64) -> i64
      %1885 = func.call @cc_values_pack(%1884) : (i64) -> i64
      func.call @stack_push_pointer(%1882) : (i64) -> ()
      %1886 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1886) : (i64) -> ()
      %1887 = llvm.mlir.addressof @str203 : !llvm.ptr
      %1888 = arith.constant 10 : i64
      %1889 = func.call @cc_make_string(%1887, %1888) : (!llvm.ptr, i64) -> i64
      %1890 = llvm.mlir.addressof @str204 : !llvm.ptr
      %1891 = arith.constant 11 : i64
      %1892 = func.call @cc_make_string(%1890, %1891) : (!llvm.ptr, i64) -> i64
      %1893 = func.call @cc_intern(%1889, %1892) : (i64, i64) -> i64
      %1894 = func.call @cc_nil_value() : () -> i64
      %1895 = func.call @cc_cons(%1893, %1894) : (i64, i64) -> i64
      %1896 = func.call @cc_values_pack(%1895) : (i64) -> i64
      func.call @stack_push_pointer(%1893) : (i64) -> ()
      %1897 = func.call @stack_pop_pointer() : () -> i64
      %1898 = func.call @stack_pop_pointer() : () -> i64
      %1899 = func.call @cc_cons(%1897, %1898) : (i64, i64) -> i64
      %1900 = llvm.mlir.addressof @str205 : !llvm.ptr
      %1901 = arith.constant 5 : i64
      %1902 = func.call @cc_make_string(%1900, %1901) : (!llvm.ptr, i64) -> i64
      %1903 = func.call @cc_nil_value() : () -> i64
      %1904 = func.call @cc_intern(%1902, %1903) : (i64, i64) -> i64
      %1905 = func.call @cc_nil_value() : () -> i64
      %1906 = func.call @cc_cons(%1904, %1905) : (i64, i64) -> i64
      %1907 = func.call @cc_values_pack(%1906) : (i64) -> i64
      %1908 = func.call @cc_cons(%1904, %1899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1908) : (i64) -> ()
      %1909 = llvm.mlir.addressof @str206 : !llvm.ptr
      %1910 = arith.constant 10 : i64
      %1911 = func.call @cc_make_string(%1909, %1910) : (!llvm.ptr, i64) -> i64
      %1912 = llvm.mlir.addressof @str207 : !llvm.ptr
      %1913 = arith.constant 11 : i64
      %1914 = func.call @cc_make_string(%1912, %1913) : (!llvm.ptr, i64) -> i64
      %1915 = func.call @cc_intern(%1911, %1914) : (i64, i64) -> i64
      %1916 = func.call @cc_nil_value() : () -> i64
      %1917 = func.call @cc_cons(%1915, %1916) : (i64, i64) -> i64
      %1918 = func.call @cc_values_pack(%1917) : (i64) -> i64
      func.call @stack_push_pointer(%1915) : (i64) -> ()
      %1919 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1919) : (i64) -> ()
      %1920 = llvm.mlir.addressof @str208 : !llvm.ptr
      %1921 = arith.constant 10 : i64
      %1922 = func.call @cc_make_string(%1920, %1921) : (!llvm.ptr, i64) -> i64
      %1923 = llvm.mlir.addressof @str209 : !llvm.ptr
      %1924 = arith.constant 11 : i64
      %1925 = func.call @cc_make_string(%1923, %1924) : (!llvm.ptr, i64) -> i64
      %1926 = func.call @cc_intern(%1922, %1925) : (i64, i64) -> i64
      %1927 = func.call @cc_nil_value() : () -> i64
      %1928 = func.call @cc_cons(%1926, %1927) : (i64, i64) -> i64
      %1929 = func.call @cc_values_pack(%1928) : (i64) -> i64
      func.call @stack_push_pointer(%1926) : (i64) -> ()
      %1930 = func.call @stack_pop_pointer() : () -> i64
      %1931 = func.call @stack_pop_pointer() : () -> i64
      %1932 = func.call @cc_cons(%1930, %1931) : (i64, i64) -> i64
      %1933 = llvm.mlir.addressof @str210 : !llvm.ptr
      %1934 = arith.constant 5 : i64
      %1935 = func.call @cc_make_string(%1933, %1934) : (!llvm.ptr, i64) -> i64
      %1936 = func.call @cc_nil_value() : () -> i64
      %1937 = func.call @cc_intern(%1935, %1936) : (i64, i64) -> i64
      %1938 = func.call @cc_nil_value() : () -> i64
      %1939 = func.call @cc_cons(%1937, %1938) : (i64, i64) -> i64
      %1940 = func.call @cc_values_pack(%1939) : (i64) -> i64
      %1941 = func.call @cc_cons(%1937, %1932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1941) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1943, %1942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1944) : (i64) -> ()
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @stack_pop_pointer() : () -> i64
      %1947 = func.call @cc_cons(%1946, %1945) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1947) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1948 = func.call @stack_pop_pointer() : () -> i64
      %1949 = func.call @stack_pop_pointer() : () -> i64
      %1950 = func.call @cc_cons(%1949, %1948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1950) : (i64) -> ()
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @stack_pop_pointer() : () -> i64
      %1953 = func.call @cc_cons(%1952, %1951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1953) : (i64) -> ()
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @stack_pop_pointer() : () -> i64
      %1956 = func.call @cc_cons(%1955, %1954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1956) : (i64) -> ()
      %1957 = llvm.mlir.addressof @str211 : !llvm.ptr
      %1958 = arith.constant 3 : i64
      %1959 = func.call @cc_make_string(%1957, %1958) : (!llvm.ptr, i64) -> i64
      %1960 = llvm.mlir.addressof @str212 : !llvm.ptr
      %1961 = arith.constant 11 : i64
      %1962 = func.call @cc_make_string(%1960, %1961) : (!llvm.ptr, i64) -> i64
      %1963 = func.call @cc_intern(%1959, %1962) : (i64, i64) -> i64
      %1964 = func.call @cc_nil_value() : () -> i64
      %1965 = func.call @cc_cons(%1963, %1964) : (i64, i64) -> i64
      %1966 = func.call @cc_values_pack(%1965) : (i64) -> i64
      func.call @stack_push_pointer(%1963) : (i64) -> ()
      %1967 = llvm.mlir.addressof @str213 : !llvm.ptr
      %1968 = arith.constant 2 : i64
      %1969 = func.call @cc_make_string(%1967, %1968) : (!llvm.ptr, i64) -> i64
      %1970 = llvm.mlir.addressof @str214 : !llvm.ptr
      %1971 = arith.constant 11 : i64
      %1972 = func.call @cc_make_string(%1970, %1971) : (!llvm.ptr, i64) -> i64
      %1973 = func.call @cc_intern(%1969, %1972) : (i64, i64) -> i64
      %1974 = func.call @cc_nil_value() : () -> i64
      %1975 = func.call @cc_cons(%1973, %1974) : (i64, i64) -> i64
      %1976 = func.call @cc_values_pack(%1975) : (i64) -> i64
      func.call @stack_push_pointer(%1973) : (i64) -> ()
      %1977 = llvm.mlir.addressof @str215 : !llvm.ptr
      %1978 = arith.constant 2 : i64
      %1979 = func.call @cc_make_string(%1977, %1978) : (!llvm.ptr, i64) -> i64
      %1980 = llvm.mlir.addressof @str216 : !llvm.ptr
      %1981 = arith.constant 11 : i64
      %1982 = func.call @cc_make_string(%1980, %1981) : (!llvm.ptr, i64) -> i64
      %1983 = func.call @cc_intern(%1979, %1982) : (i64, i64) -> i64
      %1984 = func.call @cc_nil_value() : () -> i64
      %1985 = func.call @cc_cons(%1983, %1984) : (i64, i64) -> i64
      %1986 = func.call @cc_values_pack(%1985) : (i64) -> i64
      func.call @stack_push_pointer(%1983) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1987 = func.call @stack_pop_pointer() : () -> i64
      %1988 = func.call @stack_pop_pointer() : () -> i64
      %1989 = func.call @cc_cons(%1988, %1987) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1989) : (i64) -> ()
      %1990 = func.call @stack_pop_pointer() : () -> i64
      %1991 = func.call @stack_pop_pointer() : () -> i64
      %1992 = func.call @cc_cons(%1991, %1990) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1992) : (i64) -> ()
      %1993 = func.call @stack_pop_pointer() : () -> i64
      %1994 = func.call @stack_pop_pointer() : () -> i64
      %1995 = func.call @cc_cons(%1994, %1993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1995) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1996 = func.call @stack_pop_pointer() : () -> i64
      %1997 = func.call @stack_pop_pointer() : () -> i64
      %1998 = func.call @cc_cons(%1997, %1996) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1998) : (i64) -> ()
      %1999 = func.call @stack_pop_pointer() : () -> i64
      %2000 = func.call @stack_pop_pointer() : () -> i64
      %2001 = func.call @cc_cons(%2000, %1999) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2001) : (i64) -> ()
      %2002 = func.call @stack_pop_pointer() : () -> i64
      %2003 = func.call @stack_pop_pointer() : () -> i64
      %2004 = func.call @cc_cons(%2003, %2002) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2004) : (i64) -> ()
      %2005 = func.call @stack_pop_pointer() : () -> i64
      %2006 = func.call @stack_pop_pointer() : () -> i64
      %2007 = func.call @cc_cons(%2006, %2005) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2007) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2008 = func.call @stack_pop_pointer() : () -> i64
      %2009 = func.call @stack_pop_pointer() : () -> i64
      %2010 = func.call @cc_cons(%2009, %2008) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2010) : (i64) -> ()
      %2011 = func.call @stack_pop_pointer() : () -> i64
      %2012 = func.call @stack_pop_pointer() : () -> i64
      %2013 = func.call @cc_cons(%2012, %2011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2013) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2014 = func.call @stack_pop_pointer() : () -> i64
      %2015 = func.call @stack_pop_pointer() : () -> i64
      %2016 = func.call @cc_cons(%2015, %2014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2016) : (i64) -> ()
      %2017 = func.call @stack_pop_pointer() : () -> i64
      %2018 = func.call @stack_pop_pointer() : () -> i64
      %2019 = func.call @cc_cons(%2018, %2017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2019) : (i64) -> ()
      %2020 = func.call @stack_pop_pointer() : () -> i64
      %2083 = arith.constant 206494159077383 : i64
      %2084 = arith.constant 0 : i64
      %2085 = func.call @cc_make_closure(%2083, %2084) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2085) : (i64) -> ()
      %2086 = func.call @stack_pop_pointer() : () -> i64
      %2087 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2088 = arith.constant 1 : i64
      %2089 = func.call @cc_make_string(%2087, %2088) : (!llvm.ptr, i64) -> i64
      %2090 = func.call @cc_nil_value() : () -> i64
      %2091 = func.call @cc_intern(%2089, %2090) : (i64, i64) -> i64
      %2092 = func.call @cc_nil_value() : () -> i64
      %2093 = func.call @cc_cons(%2091, %2092) : (i64, i64) -> i64
      %2094 = func.call @cc_values_pack(%2093) : (i64) -> i64
      func.call @stack_push_pointer(%2091) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2095 = func.call @stack_pop_pointer() : () -> i64
      %2096 = func.call @stack_pop_pointer() : () -> i64
      %2097 = func.call @cc_cons(%2096, %2095) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2097) : (i64) -> ()
      %2098 = func.call @stack_pop_pointer() : () -> i64
      %2099 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2100 = arith.constant 11 : i64
      %2101 = func.call @cc_make_string(%2099, %2100) : (!llvm.ptr, i64) -> i64
      %2102 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2103 = arith.constant 7 : i64
      %2104 = func.call @cc_make_string(%2102, %2103) : (!llvm.ptr, i64) -> i64
      %2105 = func.call @cc_intern(%2101, %2104) : (i64, i64) -> i64
      %2106 = func.call @cc_nil_value() : () -> i64
      %2107 = func.call @cc_cons(%2105, %2106) : (i64, i64) -> i64
      %2108 = func.call @cc_values_pack(%2107) : (i64) -> i64
      func.call @stack_push_pointer(%2105) : (i64) -> ()
      %2109 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2110 = func.call @stack_pop_pointer() : () -> i64
      %2111 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2112 = arith.constant 4 : i64
      %2113 = func.call @cc_make_string(%2111, %2112) : (!llvm.ptr, i64) -> i64
      %2114 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2115 = arith.constant 7 : i64
      %2116 = func.call @cc_make_string(%2114, %2115) : (!llvm.ptr, i64) -> i64
      %2117 = func.call @cc_intern(%2113, %2116) : (i64, i64) -> i64
      %2118 = func.call @cc_nil_value() : () -> i64
      %2119 = func.call @cc_cons(%2117, %2118) : (i64, i64) -> i64
      %2120 = func.call @cc_values_pack(%2119) : (i64) -> i64
      func.call @stack_push_pointer(%2117) : (i64) -> ()
      %2121 = func.call @stack_pop_pointer() : () -> i64
      %2122 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2123 = arith.constant 6 : i64
      %2124 = func.call @cc_make_string(%2122, %2123) : (!llvm.ptr, i64) -> i64
      %2125 = func.call @cc_nil_value() : () -> i64
      %2126 = func.call @cc_intern(%2124, %2125) : (i64, i64) -> i64
      %2127 = func.call @cc_nil_value() : () -> i64
      %2128 = func.call @cc_cons(%2126, %2127) : (i64, i64) -> i64
      %2129 = func.call @cc_values_pack(%2128) : (i64) -> i64
      func.call @stack_push_pointer(%2126) : (i64) -> ()
      %2130 = func.call @stack_pop_pointer() : () -> i64
      %2131 = func.call @cc_nil_value() : () -> i64
      %2132 = func.call @cc_errorp(%1823) : (i64) -> i64
      %2133 = arith.cmpi ne, %2132, %2131 : i64
      %2134 = arith.cmpi eq, %2131, %2131 : i64
      %2135 = arith.andi %2133, %2134 : i1
      %2136 = scf.if %2135 -> (i64) {
        scf.yield %1823 : i64
      } else {
        scf.yield %2131 : i64
      }
      %2137 = func.call @cc_errorp(%2020) : (i64) -> i64
      %2138 = arith.cmpi ne, %2137, %2131 : i64
      %2139 = arith.cmpi eq, %2136, %2131 : i64
      %2140 = arith.andi %2138, %2139 : i1
      %2141 = scf.if %2140 -> (i64) {
        scf.yield %2020 : i64
      } else {
        scf.yield %2136 : i64
      }
      %2142 = func.call @cc_errorp(%2086) : (i64) -> i64
      %2143 = arith.cmpi ne, %2142, %2131 : i64
      %2144 = arith.cmpi eq, %2141, %2131 : i64
      %2145 = arith.andi %2143, %2144 : i1
      %2146 = scf.if %2145 -> (i64) {
        scf.yield %2086 : i64
      } else {
        scf.yield %2141 : i64
      }
      %2147 = func.call @cc_errorp(%2098) : (i64) -> i64
      %2148 = arith.cmpi ne, %2147, %2131 : i64
      %2149 = arith.cmpi eq, %2146, %2131 : i64
      %2150 = arith.andi %2148, %2149 : i1
      %2151 = scf.if %2150 -> (i64) {
        scf.yield %2098 : i64
      } else {
        scf.yield %2146 : i64
      }
      %2152 = func.call @cc_errorp(%2109) : (i64) -> i64
      %2153 = arith.cmpi ne, %2152, %2131 : i64
      %2154 = arith.cmpi eq, %2151, %2131 : i64
      %2155 = arith.andi %2153, %2154 : i1
      %2156 = scf.if %2155 -> (i64) {
        scf.yield %2109 : i64
      } else {
        scf.yield %2151 : i64
      }
      %2157 = func.call @cc_errorp(%2110) : (i64) -> i64
      %2158 = arith.cmpi ne, %2157, %2131 : i64
      %2159 = arith.cmpi eq, %2156, %2131 : i64
      %2160 = arith.andi %2158, %2159 : i1
      %2161 = scf.if %2160 -> (i64) {
        scf.yield %2110 : i64
      } else {
        scf.yield %2156 : i64
      }
      %2162 = func.call @cc_errorp(%2121) : (i64) -> i64
      %2163 = arith.cmpi ne, %2162, %2131 : i64
      %2164 = arith.cmpi eq, %2161, %2131 : i64
      %2165 = arith.andi %2163, %2164 : i1
      %2166 = scf.if %2165 -> (i64) {
        scf.yield %2121 : i64
      } else {
        scf.yield %2161 : i64
      }
      %2167 = func.call @cc_errorp(%2130) : (i64) -> i64
      %2168 = arith.cmpi ne, %2167, %2131 : i64
      %2169 = arith.cmpi eq, %2166, %2131 : i64
      %2170 = arith.andi %2168, %2169 : i1
      %2171 = scf.if %2170 -> (i64) {
        scf.yield %2130 : i64
      } else {
        scf.yield %2166 : i64
      }
      %2172 = arith.cmpi ne, %2171, %2131 : i64
      scf.if %2172 {
        func.call @stack_push_pointer(%2171) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1823) : (i64) -> ()
        func.call @stack_push_pointer(%2020) : (i64) -> ()
        func.call @stack_push_pointer(%2086) : (i64) -> ()
        func.call @stack_push_pointer(%2098) : (i64) -> ()
        func.call @stack_push_pointer(%2109) : (i64) -> ()
        func.call @stack_push_pointer(%2110) : (i64) -> ()
        func.call @stack_push_pointer(%2121) : (i64) -> ()
        func.call @stack_push_pointer(%2130) : (i64) -> ()
        %2173 = llvm.mlir.addressof @str228 : !llvm.ptr
        %2174 = func.call @cc_make_function_ref_const(%2173) : (!llvm.ptr) -> i64
        %2175 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2174, %2175) : (i64, i64) -> ()
      }
      %2176 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2176 : i64
    }
    %2177 = func.call @cc_nil_value() : () -> i64
    %2178 = func.call @cc_errorp(%1814) : (i64) -> i64
    %2179 = arith.cmpi ne, %2178, %2177 : i64
    %2180 = scf.if %2179 -> (i64) {
      scf.yield %1814 : i64
    } else {
      %2181 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2182 = arith.constant 15 : i64
      %2183 = func.call @cc_make_string(%2181, %2182) : (!llvm.ptr, i64) -> i64
      %2184 = func.call @cc_nil_value() : () -> i64
      %2185 = func.call @cc_intern(%2183, %2184) : (i64, i64) -> i64
      %2186 = func.call @cc_nil_value() : () -> i64
      %2187 = func.call @cc_cons(%2185, %2186) : (i64, i64) -> i64
      %2188 = func.call @cc_values_pack(%2187) : (i64) -> i64
      func.call @stack_push_pointer(%2185) : (i64) -> ()
      %2189 = func.call @stack_pop_pointer() : () -> i64
      %2190 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2191 = arith.constant 3 : i64
      %2192 = func.call @cc_make_string(%2190, %2191) : (!llvm.ptr, i64) -> i64
      %2193 = func.call @cc_nil_value() : () -> i64
      %2194 = func.call @cc_intern(%2192, %2193) : (i64, i64) -> i64
      %2195 = func.call @cc_nil_value() : () -> i64
      %2196 = func.call @cc_cons(%2194, %2195) : (i64, i64) -> i64
      %2197 = func.call @cc_values_pack(%2196) : (i64) -> i64
      func.call @stack_push_pointer(%2194) : (i64) -> ()
      %2198 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2199 = arith.constant 3 : i64
      %2200 = func.call @cc_make_string(%2198, %2199) : (!llvm.ptr, i64) -> i64
      %2201 = func.call @cc_nil_value() : () -> i64
      %2202 = func.call @cc_intern(%2200, %2201) : (i64, i64) -> i64
      %2203 = func.call @cc_nil_value() : () -> i64
      %2204 = func.call @cc_cons(%2202, %2203) : (i64, i64) -> i64
      %2205 = func.call @cc_values_pack(%2204) : (i64) -> i64
      func.call @stack_push_pointer(%2202) : (i64) -> ()
      %2206 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2207 = arith.constant 19 : i64
      %2208 = func.call @cc_make_string(%2206, %2207) : (!llvm.ptr, i64) -> i64
      %2209 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2210 = arith.constant 11 : i64
      %2211 = func.call @cc_make_string(%2209, %2210) : (!llvm.ptr, i64) -> i64
      %2212 = func.call @cc_intern(%2208, %2211) : (i64, i64) -> i64
      %2213 = func.call @cc_nil_value() : () -> i64
      %2214 = func.call @cc_cons(%2212, %2213) : (i64, i64) -> i64
      %2215 = func.call @cc_values_pack(%2214) : (i64) -> i64
      func.call @stack_push_pointer(%2212) : (i64) -> ()
      %2216 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2217 = arith.constant 2 : i64
      %2218 = func.call @cc_make_string(%2216, %2217) : (!llvm.ptr, i64) -> i64
      %2219 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2220 = arith.constant 11 : i64
      %2221 = func.call @cc_make_string(%2219, %2220) : (!llvm.ptr, i64) -> i64
      %2222 = func.call @cc_intern(%2218, %2221) : (i64, i64) -> i64
      %2223 = func.call @cc_nil_value() : () -> i64
      %2224 = func.call @cc_cons(%2222, %2223) : (i64, i64) -> i64
      %2225 = func.call @cc_values_pack(%2224) : (i64) -> i64
      func.call @stack_push_pointer(%2222) : (i64) -> ()
      %2226 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2227 = arith.constant 2 : i64
      %2228 = func.call @cc_make_string(%2226, %2227) : (!llvm.ptr, i64) -> i64
      %2229 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2230 = arith.constant 11 : i64
      %2231 = func.call @cc_make_string(%2229, %2230) : (!llvm.ptr, i64) -> i64
      %2232 = func.call @cc_intern(%2228, %2231) : (i64, i64) -> i64
      %2233 = func.call @cc_nil_value() : () -> i64
      %2234 = func.call @cc_cons(%2232, %2233) : (i64, i64) -> i64
      %2235 = func.call @cc_values_pack(%2234) : (i64) -> i64
      func.call @stack_push_pointer(%2232) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2236 = func.call @stack_pop_pointer() : () -> i64
      %2237 = func.call @stack_pop_pointer() : () -> i64
      %2238 = func.call @cc_cons(%2237, %2236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2238) : (i64) -> ()
      %2239 = func.call @stack_pop_pointer() : () -> i64
      %2240 = func.call @stack_pop_pointer() : () -> i64
      %2241 = func.call @cc_cons(%2240, %2239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2241) : (i64) -> ()
      %2242 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2243 = arith.constant 8 : i64
      %2244 = func.call @cc_make_string(%2242, %2243) : (!llvm.ptr, i64) -> i64
      %2245 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2246 = arith.constant 11 : i64
      %2247 = func.call @cc_make_string(%2245, %2246) : (!llvm.ptr, i64) -> i64
      %2248 = func.call @cc_intern(%2244, %2247) : (i64, i64) -> i64
      %2249 = func.call @cc_nil_value() : () -> i64
      %2250 = func.call @cc_cons(%2248, %2249) : (i64, i64) -> i64
      %2251 = func.call @cc_values_pack(%2250) : (i64) -> i64
      func.call @stack_push_pointer(%2248) : (i64) -> ()
      %2252 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2253 = arith.constant 10 : i64
      %2254 = func.call @cc_make_string(%2252, %2253) : (!llvm.ptr, i64) -> i64
      %2255 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2256 = arith.constant 11 : i64
      %2257 = func.call @cc_make_string(%2255, %2256) : (!llvm.ptr, i64) -> i64
      %2258 = func.call @cc_intern(%2254, %2257) : (i64, i64) -> i64
      %2259 = func.call @cc_nil_value() : () -> i64
      %2260 = func.call @cc_cons(%2258, %2259) : (i64, i64) -> i64
      %2261 = func.call @cc_values_pack(%2260) : (i64) -> i64
      func.call @stack_push_pointer(%2258) : (i64) -> ()
      %2262 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2262) : (i64) -> ()
      %2263 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2264 = arith.constant 10 : i64
      %2265 = func.call @cc_make_string(%2263, %2264) : (!llvm.ptr, i64) -> i64
      %2266 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2267 = arith.constant 11 : i64
      %2268 = func.call @cc_make_string(%2266, %2267) : (!llvm.ptr, i64) -> i64
      %2269 = func.call @cc_intern(%2265, %2268) : (i64, i64) -> i64
      %2270 = func.call @cc_nil_value() : () -> i64
      %2271 = func.call @cc_cons(%2269, %2270) : (i64, i64) -> i64
      %2272 = func.call @cc_values_pack(%2271) : (i64) -> i64
      func.call @stack_push_pointer(%2269) : (i64) -> ()
      %2273 = func.call @stack_pop_pointer() : () -> i64
      %2274 = func.call @stack_pop_pointer() : () -> i64
      %2275 = func.call @cc_cons(%2273, %2274) : (i64, i64) -> i64
      %2276 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2277 = arith.constant 5 : i64
      %2278 = func.call @cc_make_string(%2276, %2277) : (!llvm.ptr, i64) -> i64
      %2279 = func.call @cc_nil_value() : () -> i64
      %2280 = func.call @cc_intern(%2278, %2279) : (i64, i64) -> i64
      %2281 = func.call @cc_nil_value() : () -> i64
      %2282 = func.call @cc_cons(%2280, %2281) : (i64, i64) -> i64
      %2283 = func.call @cc_values_pack(%2282) : (i64) -> i64
      %2284 = func.call @cc_cons(%2280, %2275) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2284) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2285 = func.call @stack_pop_pointer() : () -> i64
      %2286 = func.call @stack_pop_pointer() : () -> i64
      %2287 = func.call @cc_cons(%2286, %2285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2287) : (i64) -> ()
      %2288 = func.call @stack_pop_pointer() : () -> i64
      %2289 = func.call @stack_pop_pointer() : () -> i64
      %2290 = func.call @cc_cons(%2289, %2288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2290) : (i64) -> ()
      %2291 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2291) : (i64) -> ()
      %2292 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2293 = arith.constant 10 : i64
      %2294 = func.call @cc_make_string(%2292, %2293) : (!llvm.ptr, i64) -> i64
      %2295 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2296 = arith.constant 11 : i64
      %2297 = func.call @cc_make_string(%2295, %2296) : (!llvm.ptr, i64) -> i64
      %2298 = func.call @cc_intern(%2294, %2297) : (i64, i64) -> i64
      %2299 = func.call @cc_nil_value() : () -> i64
      %2300 = func.call @cc_cons(%2298, %2299) : (i64, i64) -> i64
      %2301 = func.call @cc_values_pack(%2300) : (i64) -> i64
      func.call @stack_push_pointer(%2298) : (i64) -> ()
      %2302 = func.call @stack_pop_pointer() : () -> i64
      %2303 = func.call @stack_pop_pointer() : () -> i64
      %2304 = func.call @cc_cons(%2302, %2303) : (i64, i64) -> i64
      %2305 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2306 = arith.constant 5 : i64
      %2307 = func.call @cc_make_string(%2305, %2306) : (!llvm.ptr, i64) -> i64
      %2308 = func.call @cc_nil_value() : () -> i64
      %2309 = func.call @cc_intern(%2307, %2308) : (i64, i64) -> i64
      %2310 = func.call @cc_nil_value() : () -> i64
      %2311 = func.call @cc_cons(%2309, %2310) : (i64, i64) -> i64
      %2312 = func.call @cc_values_pack(%2311) : (i64) -> i64
      %2313 = func.call @cc_cons(%2309, %2304) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2313) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2314 = func.call @stack_pop_pointer() : () -> i64
      %2315 = func.call @stack_pop_pointer() : () -> i64
      %2316 = func.call @cc_cons(%2315, %2314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2316) : (i64) -> ()
      %2317 = func.call @stack_pop_pointer() : () -> i64
      %2318 = func.call @stack_pop_pointer() : () -> i64
      %2319 = func.call @cc_cons(%2318, %2317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2319) : (i64) -> ()
      %2320 = func.call @stack_pop_pointer() : () -> i64
      %2321 = func.call @stack_pop_pointer() : () -> i64
      %2322 = func.call @cc_cons(%2321, %2320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2322) : (i64) -> ()
      %2323 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2324 = arith.constant 3 : i64
      %2325 = func.call @cc_make_string(%2323, %2324) : (!llvm.ptr, i64) -> i64
      %2326 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2327 = arith.constant 11 : i64
      %2328 = func.call @cc_make_string(%2326, %2327) : (!llvm.ptr, i64) -> i64
      %2329 = func.call @cc_intern(%2325, %2328) : (i64, i64) -> i64
      %2330 = func.call @cc_nil_value() : () -> i64
      %2331 = func.call @cc_cons(%2329, %2330) : (i64, i64) -> i64
      %2332 = func.call @cc_values_pack(%2331) : (i64) -> i64
      func.call @stack_push_pointer(%2329) : (i64) -> ()
      %2333 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2334 = arith.constant 2 : i64
      %2335 = func.call @cc_make_string(%2333, %2334) : (!llvm.ptr, i64) -> i64
      %2336 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2337 = arith.constant 11 : i64
      %2338 = func.call @cc_make_string(%2336, %2337) : (!llvm.ptr, i64) -> i64
      %2339 = func.call @cc_intern(%2335, %2338) : (i64, i64) -> i64
      %2340 = func.call @cc_nil_value() : () -> i64
      %2341 = func.call @cc_cons(%2339, %2340) : (i64, i64) -> i64
      %2342 = func.call @cc_values_pack(%2341) : (i64) -> i64
      func.call @stack_push_pointer(%2339) : (i64) -> ()
      %2343 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2344 = arith.constant 2 : i64
      %2345 = func.call @cc_make_string(%2343, %2344) : (!llvm.ptr, i64) -> i64
      %2346 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2347 = arith.constant 11 : i64
      %2348 = func.call @cc_make_string(%2346, %2347) : (!llvm.ptr, i64) -> i64
      %2349 = func.call @cc_intern(%2345, %2348) : (i64, i64) -> i64
      %2350 = func.call @cc_nil_value() : () -> i64
      %2351 = func.call @cc_cons(%2349, %2350) : (i64, i64) -> i64
      %2352 = func.call @cc_values_pack(%2351) : (i64) -> i64
      func.call @stack_push_pointer(%2349) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2353 = func.call @stack_pop_pointer() : () -> i64
      %2354 = func.call @stack_pop_pointer() : () -> i64
      %2355 = func.call @cc_cons(%2354, %2353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2355) : (i64) -> ()
      %2356 = func.call @stack_pop_pointer() : () -> i64
      %2357 = func.call @stack_pop_pointer() : () -> i64
      %2358 = func.call @cc_cons(%2357, %2356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2358) : (i64) -> ()
      %2359 = func.call @stack_pop_pointer() : () -> i64
      %2360 = func.call @stack_pop_pointer() : () -> i64
      %2361 = func.call @cc_cons(%2360, %2359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2361) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2362 = func.call @stack_pop_pointer() : () -> i64
      %2363 = func.call @stack_pop_pointer() : () -> i64
      %2364 = func.call @cc_cons(%2363, %2362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2364) : (i64) -> ()
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = func.call @stack_pop_pointer() : () -> i64
      %2367 = func.call @cc_cons(%2366, %2365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2367) : (i64) -> ()
      %2368 = func.call @stack_pop_pointer() : () -> i64
      %2369 = func.call @stack_pop_pointer() : () -> i64
      %2370 = func.call @cc_cons(%2369, %2368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2370) : (i64) -> ()
      %2371 = func.call @stack_pop_pointer() : () -> i64
      %2372 = func.call @stack_pop_pointer() : () -> i64
      %2373 = func.call @cc_cons(%2372, %2371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2373) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2374 = func.call @stack_pop_pointer() : () -> i64
      %2375 = func.call @stack_pop_pointer() : () -> i64
      %2376 = func.call @cc_cons(%2375, %2374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2376) : (i64) -> ()
      %2377 = func.call @stack_pop_pointer() : () -> i64
      %2378 = func.call @stack_pop_pointer() : () -> i64
      %2379 = func.call @cc_cons(%2378, %2377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2379) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2380 = func.call @stack_pop_pointer() : () -> i64
      %2381 = func.call @stack_pop_pointer() : () -> i64
      %2382 = func.call @cc_cons(%2381, %2380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2382) : (i64) -> ()
      %2383 = func.call @stack_pop_pointer() : () -> i64
      %2384 = func.call @stack_pop_pointer() : () -> i64
      %2385 = func.call @cc_cons(%2384, %2383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2385) : (i64) -> ()
      %2386 = func.call @stack_pop_pointer() : () -> i64
      %2449 = arith.constant 206494159077384 : i64
      %2450 = arith.constant 0 : i64
      %2451 = func.call @cc_make_closure(%2449, %2450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2451) : (i64) -> ()
      %2452 = func.call @stack_pop_pointer() : () -> i64
      %2453 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2454 = arith.constant 1 : i64
      %2455 = func.call @cc_make_string(%2453, %2454) : (!llvm.ptr, i64) -> i64
      %2456 = func.call @cc_nil_value() : () -> i64
      %2457 = func.call @cc_intern(%2455, %2456) : (i64, i64) -> i64
      %2458 = func.call @cc_nil_value() : () -> i64
      %2459 = func.call @cc_cons(%2457, %2458) : (i64, i64) -> i64
      %2460 = func.call @cc_values_pack(%2459) : (i64) -> i64
      func.call @stack_push_pointer(%2457) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2461 = func.call @stack_pop_pointer() : () -> i64
      %2462 = func.call @stack_pop_pointer() : () -> i64
      %2463 = func.call @cc_cons(%2462, %2461) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2463) : (i64) -> ()
      %2464 = func.call @stack_pop_pointer() : () -> i64
      %2465 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2466 = arith.constant 11 : i64
      %2467 = func.call @cc_make_string(%2465, %2466) : (!llvm.ptr, i64) -> i64
      %2468 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2469 = arith.constant 7 : i64
      %2470 = func.call @cc_make_string(%2468, %2469) : (!llvm.ptr, i64) -> i64
      %2471 = func.call @cc_intern(%2467, %2470) : (i64, i64) -> i64
      %2472 = func.call @cc_nil_value() : () -> i64
      %2473 = func.call @cc_cons(%2471, %2472) : (i64, i64) -> i64
      %2474 = func.call @cc_values_pack(%2473) : (i64) -> i64
      func.call @stack_push_pointer(%2471) : (i64) -> ()
      %2475 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2476 = func.call @stack_pop_pointer() : () -> i64
      %2477 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2478 = arith.constant 4 : i64
      %2479 = func.call @cc_make_string(%2477, %2478) : (!llvm.ptr, i64) -> i64
      %2480 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2481 = arith.constant 7 : i64
      %2482 = func.call @cc_make_string(%2480, %2481) : (!llvm.ptr, i64) -> i64
      %2483 = func.call @cc_intern(%2479, %2482) : (i64, i64) -> i64
      %2484 = func.call @cc_nil_value() : () -> i64
      %2485 = func.call @cc_cons(%2483, %2484) : (i64, i64) -> i64
      %2486 = func.call @cc_values_pack(%2485) : (i64) -> i64
      func.call @stack_push_pointer(%2483) : (i64) -> ()
      %2487 = func.call @stack_pop_pointer() : () -> i64
      %2488 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2489 = arith.constant 6 : i64
      %2490 = func.call @cc_make_string(%2488, %2489) : (!llvm.ptr, i64) -> i64
      %2491 = func.call @cc_nil_value() : () -> i64
      %2492 = func.call @cc_intern(%2490, %2491) : (i64, i64) -> i64
      %2493 = func.call @cc_nil_value() : () -> i64
      %2494 = func.call @cc_cons(%2492, %2493) : (i64, i64) -> i64
      %2495 = func.call @cc_values_pack(%2494) : (i64) -> i64
      func.call @stack_push_pointer(%2492) : (i64) -> ()
      %2496 = func.call @stack_pop_pointer() : () -> i64
      %2497 = func.call @cc_nil_value() : () -> i64
      %2498 = func.call @cc_errorp(%2189) : (i64) -> i64
      %2499 = arith.cmpi ne, %2498, %2497 : i64
      %2500 = arith.cmpi eq, %2497, %2497 : i64
      %2501 = arith.andi %2499, %2500 : i1
      %2502 = scf.if %2501 -> (i64) {
        scf.yield %2189 : i64
      } else {
        scf.yield %2497 : i64
      }
      %2503 = func.call @cc_errorp(%2386) : (i64) -> i64
      %2504 = arith.cmpi ne, %2503, %2497 : i64
      %2505 = arith.cmpi eq, %2502, %2497 : i64
      %2506 = arith.andi %2504, %2505 : i1
      %2507 = scf.if %2506 -> (i64) {
        scf.yield %2386 : i64
      } else {
        scf.yield %2502 : i64
      }
      %2508 = func.call @cc_errorp(%2452) : (i64) -> i64
      %2509 = arith.cmpi ne, %2508, %2497 : i64
      %2510 = arith.cmpi eq, %2507, %2497 : i64
      %2511 = arith.andi %2509, %2510 : i1
      %2512 = scf.if %2511 -> (i64) {
        scf.yield %2452 : i64
      } else {
        scf.yield %2507 : i64
      }
      %2513 = func.call @cc_errorp(%2464) : (i64) -> i64
      %2514 = arith.cmpi ne, %2513, %2497 : i64
      %2515 = arith.cmpi eq, %2512, %2497 : i64
      %2516 = arith.andi %2514, %2515 : i1
      %2517 = scf.if %2516 -> (i64) {
        scf.yield %2464 : i64
      } else {
        scf.yield %2512 : i64
      }
      %2518 = func.call @cc_errorp(%2475) : (i64) -> i64
      %2519 = arith.cmpi ne, %2518, %2497 : i64
      %2520 = arith.cmpi eq, %2517, %2497 : i64
      %2521 = arith.andi %2519, %2520 : i1
      %2522 = scf.if %2521 -> (i64) {
        scf.yield %2475 : i64
      } else {
        scf.yield %2517 : i64
      }
      %2523 = func.call @cc_errorp(%2476) : (i64) -> i64
      %2524 = arith.cmpi ne, %2523, %2497 : i64
      %2525 = arith.cmpi eq, %2522, %2497 : i64
      %2526 = arith.andi %2524, %2525 : i1
      %2527 = scf.if %2526 -> (i64) {
        scf.yield %2476 : i64
      } else {
        scf.yield %2522 : i64
      }
      %2528 = func.call @cc_errorp(%2487) : (i64) -> i64
      %2529 = arith.cmpi ne, %2528, %2497 : i64
      %2530 = arith.cmpi eq, %2527, %2497 : i64
      %2531 = arith.andi %2529, %2530 : i1
      %2532 = scf.if %2531 -> (i64) {
        scf.yield %2487 : i64
      } else {
        scf.yield %2527 : i64
      }
      %2533 = func.call @cc_errorp(%2496) : (i64) -> i64
      %2534 = arith.cmpi ne, %2533, %2497 : i64
      %2535 = arith.cmpi eq, %2532, %2497 : i64
      %2536 = arith.andi %2534, %2535 : i1
      %2537 = scf.if %2536 -> (i64) {
        scf.yield %2496 : i64
      } else {
        scf.yield %2532 : i64
      }
      %2538 = arith.cmpi ne, %2537, %2497 : i64
      scf.if %2538 {
        func.call @stack_push_pointer(%2537) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2189) : (i64) -> ()
        func.call @stack_push_pointer(%2386) : (i64) -> ()
        func.call @stack_push_pointer(%2452) : (i64) -> ()
        func.call @stack_push_pointer(%2464) : (i64) -> ()
        func.call @stack_push_pointer(%2475) : (i64) -> ()
        func.call @stack_push_pointer(%2476) : (i64) -> ()
        func.call @stack_push_pointer(%2487) : (i64) -> ()
        func.call @stack_push_pointer(%2496) : (i64) -> ()
        %2539 = llvm.mlir.addressof @str265 : !llvm.ptr
        %2540 = func.call @cc_make_function_ref_const(%2539) : (!llvm.ptr) -> i64
        %2541 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2540, %2541) : (i64, i64) -> ()
      }
      %2542 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2542 : i64
    }
    %2543 = func.call @cc_nil_value() : () -> i64
    %2544 = func.call @cc_errorp(%2180) : (i64) -> i64
    %2545 = arith.cmpi ne, %2544, %2543 : i64
    %2546 = scf.if %2545 -> (i64) {
      scf.yield %2180 : i64
    } else {
      %2547 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2548 = arith.constant 15 : i64
      %2549 = func.call @cc_make_string(%2547, %2548) : (!llvm.ptr, i64) -> i64
      %2550 = func.call @cc_nil_value() : () -> i64
      %2551 = func.call @cc_intern(%2549, %2550) : (i64, i64) -> i64
      %2552 = func.call @cc_nil_value() : () -> i64
      %2553 = func.call @cc_cons(%2551, %2552) : (i64, i64) -> i64
      %2554 = func.call @cc_values_pack(%2553) : (i64) -> i64
      func.call @stack_push_pointer(%2551) : (i64) -> ()
      %2555 = func.call @stack_pop_pointer() : () -> i64
      %2556 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2557 = arith.constant 3 : i64
      %2558 = func.call @cc_make_string(%2556, %2557) : (!llvm.ptr, i64) -> i64
      %2559 = func.call @cc_nil_value() : () -> i64
      %2560 = func.call @cc_intern(%2558, %2559) : (i64, i64) -> i64
      %2561 = func.call @cc_nil_value() : () -> i64
      %2562 = func.call @cc_cons(%2560, %2561) : (i64, i64) -> i64
      %2563 = func.call @cc_values_pack(%2562) : (i64) -> i64
      func.call @stack_push_pointer(%2560) : (i64) -> ()
      %2564 = llvm.mlir.addressof @str268 : !llvm.ptr
      %2565 = arith.constant 3 : i64
      %2566 = func.call @cc_make_string(%2564, %2565) : (!llvm.ptr, i64) -> i64
      %2567 = func.call @cc_nil_value() : () -> i64
      %2568 = func.call @cc_intern(%2566, %2567) : (i64, i64) -> i64
      %2569 = func.call @cc_nil_value() : () -> i64
      %2570 = func.call @cc_cons(%2568, %2569) : (i64, i64) -> i64
      %2571 = func.call @cc_values_pack(%2570) : (i64) -> i64
      func.call @stack_push_pointer(%2568) : (i64) -> ()
      %2572 = llvm.mlir.addressof @str269 : !llvm.ptr
      %2573 = arith.constant 19 : i64
      %2574 = func.call @cc_make_string(%2572, %2573) : (!llvm.ptr, i64) -> i64
      %2575 = llvm.mlir.addressof @str270 : !llvm.ptr
      %2576 = arith.constant 11 : i64
      %2577 = func.call @cc_make_string(%2575, %2576) : (!llvm.ptr, i64) -> i64
      %2578 = func.call @cc_intern(%2574, %2577) : (i64, i64) -> i64
      %2579 = func.call @cc_nil_value() : () -> i64
      %2580 = func.call @cc_cons(%2578, %2579) : (i64, i64) -> i64
      %2581 = func.call @cc_values_pack(%2580) : (i64) -> i64
      func.call @stack_push_pointer(%2578) : (i64) -> ()
      %2582 = llvm.mlir.addressof @str271 : !llvm.ptr
      %2583 = arith.constant 2 : i64
      %2584 = func.call @cc_make_string(%2582, %2583) : (!llvm.ptr, i64) -> i64
      %2585 = llvm.mlir.addressof @str272 : !llvm.ptr
      %2586 = arith.constant 11 : i64
      %2587 = func.call @cc_make_string(%2585, %2586) : (!llvm.ptr, i64) -> i64
      %2588 = func.call @cc_intern(%2584, %2587) : (i64, i64) -> i64
      %2589 = func.call @cc_nil_value() : () -> i64
      %2590 = func.call @cc_cons(%2588, %2589) : (i64, i64) -> i64
      %2591 = func.call @cc_values_pack(%2590) : (i64) -> i64
      func.call @stack_push_pointer(%2588) : (i64) -> ()
      %2592 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2593 = arith.constant 2 : i64
      %2594 = func.call @cc_make_string(%2592, %2593) : (!llvm.ptr, i64) -> i64
      %2595 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2596 = arith.constant 11 : i64
      %2597 = func.call @cc_make_string(%2595, %2596) : (!llvm.ptr, i64) -> i64
      %2598 = func.call @cc_intern(%2594, %2597) : (i64, i64) -> i64
      %2599 = func.call @cc_nil_value() : () -> i64
      %2600 = func.call @cc_cons(%2598, %2599) : (i64, i64) -> i64
      %2601 = func.call @cc_values_pack(%2600) : (i64) -> i64
      func.call @stack_push_pointer(%2598) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2602 = func.call @stack_pop_pointer() : () -> i64
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @cc_cons(%2603, %2602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2604) : (i64) -> ()
      %2605 = func.call @stack_pop_pointer() : () -> i64
      %2606 = func.call @stack_pop_pointer() : () -> i64
      %2607 = func.call @cc_cons(%2606, %2605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2607) : (i64) -> ()
      %2608 = llvm.mlir.addressof @str275 : !llvm.ptr
      %2609 = arith.constant 8 : i64
      %2610 = func.call @cc_make_string(%2608, %2609) : (!llvm.ptr, i64) -> i64
      %2611 = llvm.mlir.addressof @str276 : !llvm.ptr
      %2612 = arith.constant 11 : i64
      %2613 = func.call @cc_make_string(%2611, %2612) : (!llvm.ptr, i64) -> i64
      %2614 = func.call @cc_intern(%2610, %2613) : (i64, i64) -> i64
      %2615 = func.call @cc_nil_value() : () -> i64
      %2616 = func.call @cc_cons(%2614, %2615) : (i64, i64) -> i64
      %2617 = func.call @cc_values_pack(%2616) : (i64) -> i64
      func.call @stack_push_pointer(%2614) : (i64) -> ()
      %2618 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2618) : (i64) -> ()
      %2619 = llvm.mlir.addressof @str277 : !llvm.ptr
      %2620 = arith.constant 11 : i64
      %2621 = func.call @cc_make_string(%2619, %2620) : (!llvm.ptr, i64) -> i64
      %2622 = llvm.mlir.addressof @str278 : !llvm.ptr
      %2623 = arith.constant 11 : i64
      %2624 = func.call @cc_make_string(%2622, %2623) : (!llvm.ptr, i64) -> i64
      %2625 = func.call @cc_intern(%2621, %2624) : (i64, i64) -> i64
      %2626 = func.call @cc_nil_value() : () -> i64
      %2627 = func.call @cc_cons(%2625, %2626) : (i64, i64) -> i64
      %2628 = func.call @cc_values_pack(%2627) : (i64) -> i64
      func.call @stack_push_pointer(%2625) : (i64) -> ()
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @stack_pop_pointer() : () -> i64
      %2631 = func.call @cc_cons(%2629, %2630) : (i64, i64) -> i64
      %2632 = llvm.mlir.addressof @str279 : !llvm.ptr
      %2633 = arith.constant 5 : i64
      %2634 = func.call @cc_make_string(%2632, %2633) : (!llvm.ptr, i64) -> i64
      %2635 = func.call @cc_nil_value() : () -> i64
      %2636 = func.call @cc_intern(%2634, %2635) : (i64, i64) -> i64
      %2637 = func.call @cc_nil_value() : () -> i64
      %2638 = func.call @cc_cons(%2636, %2637) : (i64, i64) -> i64
      %2639 = func.call @cc_values_pack(%2638) : (i64) -> i64
      %2640 = func.call @cc_cons(%2636, %2631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2640) : (i64) -> ()
      %2641 = llvm.mlir.addressof @str280 : !llvm.ptr
      %2642 = arith.constant 10 : i64
      %2643 = func.call @cc_make_string(%2641, %2642) : (!llvm.ptr, i64) -> i64
      %2644 = llvm.mlir.addressof @str281 : !llvm.ptr
      %2645 = arith.constant 11 : i64
      %2646 = func.call @cc_make_string(%2644, %2645) : (!llvm.ptr, i64) -> i64
      %2647 = func.call @cc_intern(%2643, %2646) : (i64, i64) -> i64
      %2648 = func.call @cc_nil_value() : () -> i64
      %2649 = func.call @cc_cons(%2647, %2648) : (i64, i64) -> i64
      %2650 = func.call @cc_values_pack(%2649) : (i64) -> i64
      func.call @stack_push_pointer(%2647) : (i64) -> ()
      %2651 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2651) : (i64) -> ()
      %2652 = llvm.mlir.addressof @str282 : !llvm.ptr
      %2653 = arith.constant 11 : i64
      %2654 = func.call @cc_make_string(%2652, %2653) : (!llvm.ptr, i64) -> i64
      %2655 = llvm.mlir.addressof @str283 : !llvm.ptr
      %2656 = arith.constant 11 : i64
      %2657 = func.call @cc_make_string(%2655, %2656) : (!llvm.ptr, i64) -> i64
      %2658 = func.call @cc_intern(%2654, %2657) : (i64, i64) -> i64
      %2659 = func.call @cc_nil_value() : () -> i64
      %2660 = func.call @cc_cons(%2658, %2659) : (i64, i64) -> i64
      %2661 = func.call @cc_values_pack(%2660) : (i64) -> i64
      func.call @stack_push_pointer(%2658) : (i64) -> ()
      %2662 = func.call @stack_pop_pointer() : () -> i64
      %2663 = func.call @stack_pop_pointer() : () -> i64
      %2664 = func.call @cc_cons(%2662, %2663) : (i64, i64) -> i64
      %2665 = llvm.mlir.addressof @str284 : !llvm.ptr
      %2666 = arith.constant 5 : i64
      %2667 = func.call @cc_make_string(%2665, %2666) : (!llvm.ptr, i64) -> i64
      %2668 = func.call @cc_nil_value() : () -> i64
      %2669 = func.call @cc_intern(%2667, %2668) : (i64, i64) -> i64
      %2670 = func.call @cc_nil_value() : () -> i64
      %2671 = func.call @cc_cons(%2669, %2670) : (i64, i64) -> i64
      %2672 = func.call @cc_values_pack(%2671) : (i64) -> i64
      %2673 = func.call @cc_cons(%2669, %2664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2673) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2674 = func.call @stack_pop_pointer() : () -> i64
      %2675 = func.call @stack_pop_pointer() : () -> i64
      %2676 = func.call @cc_cons(%2675, %2674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2676) : (i64) -> ()
      %2677 = func.call @stack_pop_pointer() : () -> i64
      %2678 = func.call @stack_pop_pointer() : () -> i64
      %2679 = func.call @cc_cons(%2678, %2677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2680 = func.call @stack_pop_pointer() : () -> i64
      %2681 = func.call @stack_pop_pointer() : () -> i64
      %2682 = func.call @cc_cons(%2681, %2680) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2682) : (i64) -> ()
      %2683 = func.call @stack_pop_pointer() : () -> i64
      %2684 = func.call @stack_pop_pointer() : () -> i64
      %2685 = func.call @cc_cons(%2684, %2683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2685) : (i64) -> ()
      %2686 = func.call @stack_pop_pointer() : () -> i64
      %2687 = func.call @stack_pop_pointer() : () -> i64
      %2688 = func.call @cc_cons(%2687, %2686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2688) : (i64) -> ()
      %2689 = llvm.mlir.addressof @str285 : !llvm.ptr
      %2690 = arith.constant 3 : i64
      %2691 = func.call @cc_make_string(%2689, %2690) : (!llvm.ptr, i64) -> i64
      %2692 = llvm.mlir.addressof @str286 : !llvm.ptr
      %2693 = arith.constant 11 : i64
      %2694 = func.call @cc_make_string(%2692, %2693) : (!llvm.ptr, i64) -> i64
      %2695 = func.call @cc_intern(%2691, %2694) : (i64, i64) -> i64
      %2696 = func.call @cc_nil_value() : () -> i64
      %2697 = func.call @cc_cons(%2695, %2696) : (i64, i64) -> i64
      %2698 = func.call @cc_values_pack(%2697) : (i64) -> i64
      func.call @stack_push_pointer(%2695) : (i64) -> ()
      %2699 = llvm.mlir.addressof @str287 : !llvm.ptr
      %2700 = arith.constant 2 : i64
      %2701 = func.call @cc_make_string(%2699, %2700) : (!llvm.ptr, i64) -> i64
      %2702 = llvm.mlir.addressof @str288 : !llvm.ptr
      %2703 = arith.constant 11 : i64
      %2704 = func.call @cc_make_string(%2702, %2703) : (!llvm.ptr, i64) -> i64
      %2705 = func.call @cc_intern(%2701, %2704) : (i64, i64) -> i64
      %2706 = func.call @cc_nil_value() : () -> i64
      %2707 = func.call @cc_cons(%2705, %2706) : (i64, i64) -> i64
      %2708 = func.call @cc_values_pack(%2707) : (i64) -> i64
      func.call @stack_push_pointer(%2705) : (i64) -> ()
      %2709 = llvm.mlir.addressof @str289 : !llvm.ptr
      %2710 = arith.constant 2 : i64
      %2711 = func.call @cc_make_string(%2709, %2710) : (!llvm.ptr, i64) -> i64
      %2712 = llvm.mlir.addressof @str290 : !llvm.ptr
      %2713 = arith.constant 11 : i64
      %2714 = func.call @cc_make_string(%2712, %2713) : (!llvm.ptr, i64) -> i64
      %2715 = func.call @cc_intern(%2711, %2714) : (i64, i64) -> i64
      %2716 = func.call @cc_nil_value() : () -> i64
      %2717 = func.call @cc_cons(%2715, %2716) : (i64, i64) -> i64
      %2718 = func.call @cc_values_pack(%2717) : (i64) -> i64
      func.call @stack_push_pointer(%2715) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2719 = func.call @stack_pop_pointer() : () -> i64
      %2720 = func.call @stack_pop_pointer() : () -> i64
      %2721 = func.call @cc_cons(%2720, %2719) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2721) : (i64) -> ()
      %2722 = func.call @stack_pop_pointer() : () -> i64
      %2723 = func.call @stack_pop_pointer() : () -> i64
      %2724 = func.call @cc_cons(%2723, %2722) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2724) : (i64) -> ()
      %2725 = func.call @stack_pop_pointer() : () -> i64
      %2726 = func.call @stack_pop_pointer() : () -> i64
      %2727 = func.call @cc_cons(%2726, %2725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2727) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2728 = func.call @stack_pop_pointer() : () -> i64
      %2729 = func.call @stack_pop_pointer() : () -> i64
      %2730 = func.call @cc_cons(%2729, %2728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2730) : (i64) -> ()
      %2731 = func.call @stack_pop_pointer() : () -> i64
      %2732 = func.call @stack_pop_pointer() : () -> i64
      %2733 = func.call @cc_cons(%2732, %2731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2733) : (i64) -> ()
      %2734 = func.call @stack_pop_pointer() : () -> i64
      %2735 = func.call @stack_pop_pointer() : () -> i64
      %2736 = func.call @cc_cons(%2735, %2734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2736) : (i64) -> ()
      %2737 = func.call @stack_pop_pointer() : () -> i64
      %2738 = func.call @stack_pop_pointer() : () -> i64
      %2739 = func.call @cc_cons(%2738, %2737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2740 = func.call @stack_pop_pointer() : () -> i64
      %2741 = func.call @stack_pop_pointer() : () -> i64
      %2742 = func.call @cc_cons(%2741, %2740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2742) : (i64) -> ()
      %2743 = func.call @stack_pop_pointer() : () -> i64
      %2744 = func.call @stack_pop_pointer() : () -> i64
      %2745 = func.call @cc_cons(%2744, %2743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2745) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2746 = func.call @stack_pop_pointer() : () -> i64
      %2747 = func.call @stack_pop_pointer() : () -> i64
      %2748 = func.call @cc_cons(%2747, %2746) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2748) : (i64) -> ()
      %2749 = func.call @stack_pop_pointer() : () -> i64
      %2750 = func.call @stack_pop_pointer() : () -> i64
      %2751 = func.call @cc_cons(%2750, %2749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2751) : (i64) -> ()
      %2752 = func.call @stack_pop_pointer() : () -> i64
      %2815 = arith.constant 206494159077385 : i64
      %2816 = arith.constant 0 : i64
      %2817 = func.call @cc_make_closure(%2815, %2816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2817) : (i64) -> ()
      %2818 = func.call @stack_pop_pointer() : () -> i64
      %2819 = llvm.mlir.addressof @str296 : !llvm.ptr
      %2820 = arith.constant 1 : i64
      %2821 = func.call @cc_make_string(%2819, %2820) : (!llvm.ptr, i64) -> i64
      %2822 = func.call @cc_nil_value() : () -> i64
      %2823 = func.call @cc_intern(%2821, %2822) : (i64, i64) -> i64
      %2824 = func.call @cc_nil_value() : () -> i64
      %2825 = func.call @cc_cons(%2823, %2824) : (i64, i64) -> i64
      %2826 = func.call @cc_values_pack(%2825) : (i64) -> i64
      func.call @stack_push_pointer(%2823) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2827 = func.call @stack_pop_pointer() : () -> i64
      %2828 = func.call @stack_pop_pointer() : () -> i64
      %2829 = func.call @cc_cons(%2828, %2827) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2829) : (i64) -> ()
      %2830 = func.call @stack_pop_pointer() : () -> i64
      %2831 = llvm.mlir.addressof @str297 : !llvm.ptr
      %2832 = arith.constant 11 : i64
      %2833 = func.call @cc_make_string(%2831, %2832) : (!llvm.ptr, i64) -> i64
      %2834 = llvm.mlir.addressof @str298 : !llvm.ptr
      %2835 = arith.constant 7 : i64
      %2836 = func.call @cc_make_string(%2834, %2835) : (!llvm.ptr, i64) -> i64
      %2837 = func.call @cc_intern(%2833, %2836) : (i64, i64) -> i64
      %2838 = func.call @cc_nil_value() : () -> i64
      %2839 = func.call @cc_cons(%2837, %2838) : (i64, i64) -> i64
      %2840 = func.call @cc_values_pack(%2839) : (i64) -> i64
      func.call @stack_push_pointer(%2837) : (i64) -> ()
      %2841 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2842 = func.call @stack_pop_pointer() : () -> i64
      %2843 = llvm.mlir.addressof @str299 : !llvm.ptr
      %2844 = arith.constant 4 : i64
      %2845 = func.call @cc_make_string(%2843, %2844) : (!llvm.ptr, i64) -> i64
      %2846 = llvm.mlir.addressof @str300 : !llvm.ptr
      %2847 = arith.constant 7 : i64
      %2848 = func.call @cc_make_string(%2846, %2847) : (!llvm.ptr, i64) -> i64
      %2849 = func.call @cc_intern(%2845, %2848) : (i64, i64) -> i64
      %2850 = func.call @cc_nil_value() : () -> i64
      %2851 = func.call @cc_cons(%2849, %2850) : (i64, i64) -> i64
      %2852 = func.call @cc_values_pack(%2851) : (i64) -> i64
      func.call @stack_push_pointer(%2849) : (i64) -> ()
      %2853 = func.call @stack_pop_pointer() : () -> i64
      %2854 = llvm.mlir.addressof @str301 : !llvm.ptr
      %2855 = arith.constant 6 : i64
      %2856 = func.call @cc_make_string(%2854, %2855) : (!llvm.ptr, i64) -> i64
      %2857 = func.call @cc_nil_value() : () -> i64
      %2858 = func.call @cc_intern(%2856, %2857) : (i64, i64) -> i64
      %2859 = func.call @cc_nil_value() : () -> i64
      %2860 = func.call @cc_cons(%2858, %2859) : (i64, i64) -> i64
      %2861 = func.call @cc_values_pack(%2860) : (i64) -> i64
      func.call @stack_push_pointer(%2858) : (i64) -> ()
      %2862 = func.call @stack_pop_pointer() : () -> i64
      %2863 = func.call @cc_nil_value() : () -> i64
      %2864 = func.call @cc_errorp(%2555) : (i64) -> i64
      %2865 = arith.cmpi ne, %2864, %2863 : i64
      %2866 = arith.cmpi eq, %2863, %2863 : i64
      %2867 = arith.andi %2865, %2866 : i1
      %2868 = scf.if %2867 -> (i64) {
        scf.yield %2555 : i64
      } else {
        scf.yield %2863 : i64
      }
      %2869 = func.call @cc_errorp(%2752) : (i64) -> i64
      %2870 = arith.cmpi ne, %2869, %2863 : i64
      %2871 = arith.cmpi eq, %2868, %2863 : i64
      %2872 = arith.andi %2870, %2871 : i1
      %2873 = scf.if %2872 -> (i64) {
        scf.yield %2752 : i64
      } else {
        scf.yield %2868 : i64
      }
      %2874 = func.call @cc_errorp(%2818) : (i64) -> i64
      %2875 = arith.cmpi ne, %2874, %2863 : i64
      %2876 = arith.cmpi eq, %2873, %2863 : i64
      %2877 = arith.andi %2875, %2876 : i1
      %2878 = scf.if %2877 -> (i64) {
        scf.yield %2818 : i64
      } else {
        scf.yield %2873 : i64
      }
      %2879 = func.call @cc_errorp(%2830) : (i64) -> i64
      %2880 = arith.cmpi ne, %2879, %2863 : i64
      %2881 = arith.cmpi eq, %2878, %2863 : i64
      %2882 = arith.andi %2880, %2881 : i1
      %2883 = scf.if %2882 -> (i64) {
        scf.yield %2830 : i64
      } else {
        scf.yield %2878 : i64
      }
      %2884 = func.call @cc_errorp(%2841) : (i64) -> i64
      %2885 = arith.cmpi ne, %2884, %2863 : i64
      %2886 = arith.cmpi eq, %2883, %2863 : i64
      %2887 = arith.andi %2885, %2886 : i1
      %2888 = scf.if %2887 -> (i64) {
        scf.yield %2841 : i64
      } else {
        scf.yield %2883 : i64
      }
      %2889 = func.call @cc_errorp(%2842) : (i64) -> i64
      %2890 = arith.cmpi ne, %2889, %2863 : i64
      %2891 = arith.cmpi eq, %2888, %2863 : i64
      %2892 = arith.andi %2890, %2891 : i1
      %2893 = scf.if %2892 -> (i64) {
        scf.yield %2842 : i64
      } else {
        scf.yield %2888 : i64
      }
      %2894 = func.call @cc_errorp(%2853) : (i64) -> i64
      %2895 = arith.cmpi ne, %2894, %2863 : i64
      %2896 = arith.cmpi eq, %2893, %2863 : i64
      %2897 = arith.andi %2895, %2896 : i1
      %2898 = scf.if %2897 -> (i64) {
        scf.yield %2853 : i64
      } else {
        scf.yield %2893 : i64
      }
      %2899 = func.call @cc_errorp(%2862) : (i64) -> i64
      %2900 = arith.cmpi ne, %2899, %2863 : i64
      %2901 = arith.cmpi eq, %2898, %2863 : i64
      %2902 = arith.andi %2900, %2901 : i1
      %2903 = scf.if %2902 -> (i64) {
        scf.yield %2862 : i64
      } else {
        scf.yield %2898 : i64
      }
      %2904 = arith.cmpi ne, %2903, %2863 : i64
      scf.if %2904 {
        func.call @stack_push_pointer(%2903) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2555) : (i64) -> ()
        func.call @stack_push_pointer(%2752) : (i64) -> ()
        func.call @stack_push_pointer(%2818) : (i64) -> ()
        func.call @stack_push_pointer(%2830) : (i64) -> ()
        func.call @stack_push_pointer(%2841) : (i64) -> ()
        func.call @stack_push_pointer(%2842) : (i64) -> ()
        func.call @stack_push_pointer(%2853) : (i64) -> ()
        func.call @stack_push_pointer(%2862) : (i64) -> ()
        %2905 = llvm.mlir.addressof @str302 : !llvm.ptr
        %2906 = func.call @cc_make_function_ref_const(%2905) : (!llvm.ptr) -> i64
        %2907 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2906, %2907) : (i64, i64) -> ()
      }
      %2908 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2908 : i64
    }
    %2909 = func.call @cc_nil_value() : () -> i64
    %2910 = func.call @cc_errorp(%2546) : (i64) -> i64
    %2911 = arith.cmpi ne, %2910, %2909 : i64
    %2912 = scf.if %2911 -> (i64) {
      scf.yield %2546 : i64
    } else {
      %2913 = llvm.mlir.addressof @str303 : !llvm.ptr
      %2914 = arith.constant 15 : i64
      %2915 = func.call @cc_make_string(%2913, %2914) : (!llvm.ptr, i64) -> i64
      %2916 = func.call @cc_nil_value() : () -> i64
      %2917 = func.call @cc_intern(%2915, %2916) : (i64, i64) -> i64
      %2918 = func.call @cc_nil_value() : () -> i64
      %2919 = func.call @cc_cons(%2917, %2918) : (i64, i64) -> i64
      %2920 = func.call @cc_values_pack(%2919) : (i64) -> i64
      func.call @stack_push_pointer(%2917) : (i64) -> ()
      %2921 = func.call @stack_pop_pointer() : () -> i64
      %2922 = llvm.mlir.addressof @str304 : !llvm.ptr
      %2923 = arith.constant 3 : i64
      %2924 = func.call @cc_make_string(%2922, %2923) : (!llvm.ptr, i64) -> i64
      %2925 = func.call @cc_nil_value() : () -> i64
      %2926 = func.call @cc_intern(%2924, %2925) : (i64, i64) -> i64
      %2927 = func.call @cc_nil_value() : () -> i64
      %2928 = func.call @cc_cons(%2926, %2927) : (i64, i64) -> i64
      %2929 = func.call @cc_values_pack(%2928) : (i64) -> i64
      func.call @stack_push_pointer(%2926) : (i64) -> ()
      %2930 = llvm.mlir.addressof @str305 : !llvm.ptr
      %2931 = arith.constant 3 : i64
      %2932 = func.call @cc_make_string(%2930, %2931) : (!llvm.ptr, i64) -> i64
      %2933 = func.call @cc_nil_value() : () -> i64
      %2934 = func.call @cc_intern(%2932, %2933) : (i64, i64) -> i64
      %2935 = func.call @cc_nil_value() : () -> i64
      %2936 = func.call @cc_cons(%2934, %2935) : (i64, i64) -> i64
      %2937 = func.call @cc_values_pack(%2936) : (i64) -> i64
      func.call @stack_push_pointer(%2934) : (i64) -> ()
      %2938 = llvm.mlir.addressof @str306 : !llvm.ptr
      %2939 = arith.constant 19 : i64
      %2940 = func.call @cc_make_string(%2938, %2939) : (!llvm.ptr, i64) -> i64
      %2941 = llvm.mlir.addressof @str307 : !llvm.ptr
      %2942 = arith.constant 11 : i64
      %2943 = func.call @cc_make_string(%2941, %2942) : (!llvm.ptr, i64) -> i64
      %2944 = func.call @cc_intern(%2940, %2943) : (i64, i64) -> i64
      %2945 = func.call @cc_nil_value() : () -> i64
      %2946 = func.call @cc_cons(%2944, %2945) : (i64, i64) -> i64
      %2947 = func.call @cc_values_pack(%2946) : (i64) -> i64
      func.call @stack_push_pointer(%2944) : (i64) -> ()
      %2948 = llvm.mlir.addressof @str308 : !llvm.ptr
      %2949 = arith.constant 2 : i64
      %2950 = func.call @cc_make_string(%2948, %2949) : (!llvm.ptr, i64) -> i64
      %2951 = llvm.mlir.addressof @str309 : !llvm.ptr
      %2952 = arith.constant 11 : i64
      %2953 = func.call @cc_make_string(%2951, %2952) : (!llvm.ptr, i64) -> i64
      %2954 = func.call @cc_intern(%2950, %2953) : (i64, i64) -> i64
      %2955 = func.call @cc_nil_value() : () -> i64
      %2956 = func.call @cc_cons(%2954, %2955) : (i64, i64) -> i64
      %2957 = func.call @cc_values_pack(%2956) : (i64) -> i64
      func.call @stack_push_pointer(%2954) : (i64) -> ()
      %2958 = llvm.mlir.addressof @str310 : !llvm.ptr
      %2959 = arith.constant 2 : i64
      %2960 = func.call @cc_make_string(%2958, %2959) : (!llvm.ptr, i64) -> i64
      %2961 = llvm.mlir.addressof @str311 : !llvm.ptr
      %2962 = arith.constant 11 : i64
      %2963 = func.call @cc_make_string(%2961, %2962) : (!llvm.ptr, i64) -> i64
      %2964 = func.call @cc_intern(%2960, %2963) : (i64, i64) -> i64
      %2965 = func.call @cc_nil_value() : () -> i64
      %2966 = func.call @cc_cons(%2964, %2965) : (i64, i64) -> i64
      %2967 = func.call @cc_values_pack(%2966) : (i64) -> i64
      func.call @stack_push_pointer(%2964) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2968 = func.call @stack_pop_pointer() : () -> i64
      %2969 = func.call @stack_pop_pointer() : () -> i64
      %2970 = func.call @cc_cons(%2969, %2968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2970) : (i64) -> ()
      %2971 = func.call @stack_pop_pointer() : () -> i64
      %2972 = func.call @stack_pop_pointer() : () -> i64
      %2973 = func.call @cc_cons(%2972, %2971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2973) : (i64) -> ()
      %2974 = llvm.mlir.addressof @str312 : !llvm.ptr
      %2975 = arith.constant 8 : i64
      %2976 = func.call @cc_make_string(%2974, %2975) : (!llvm.ptr, i64) -> i64
      %2977 = llvm.mlir.addressof @str313 : !llvm.ptr
      %2978 = arith.constant 11 : i64
      %2979 = func.call @cc_make_string(%2977, %2978) : (!llvm.ptr, i64) -> i64
      %2980 = func.call @cc_intern(%2976, %2979) : (i64, i64) -> i64
      %2981 = func.call @cc_nil_value() : () -> i64
      %2982 = func.call @cc_cons(%2980, %2981) : (i64, i64) -> i64
      %2983 = func.call @cc_values_pack(%2982) : (i64) -> i64
      func.call @stack_push_pointer(%2980) : (i64) -> ()
      %2984 = llvm.mlir.addressof @str314 : !llvm.ptr
      %2985 = arith.constant 10 : i64
      %2986 = func.call @cc_make_string(%2984, %2985) : (!llvm.ptr, i64) -> i64
      %2987 = llvm.mlir.addressof @str315 : !llvm.ptr
      %2988 = arith.constant 11 : i64
      %2989 = func.call @cc_make_string(%2987, %2988) : (!llvm.ptr, i64) -> i64
      %2990 = func.call @cc_intern(%2986, %2989) : (i64, i64) -> i64
      %2991 = func.call @cc_nil_value() : () -> i64
      %2992 = func.call @cc_cons(%2990, %2991) : (i64, i64) -> i64
      %2993 = func.call @cc_values_pack(%2992) : (i64) -> i64
      func.call @stack_push_pointer(%2990) : (i64) -> ()
      %2994 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2994) : (i64) -> ()
      %2995 = llvm.mlir.addressof @str316 : !llvm.ptr
      %2996 = arith.constant 11 : i64
      %2997 = func.call @cc_make_string(%2995, %2996) : (!llvm.ptr, i64) -> i64
      %2998 = llvm.mlir.addressof @str317 : !llvm.ptr
      %2999 = arith.constant 11 : i64
      %3000 = func.call @cc_make_string(%2998, %2999) : (!llvm.ptr, i64) -> i64
      %3001 = func.call @cc_intern(%2997, %3000) : (i64, i64) -> i64
      %3002 = func.call @cc_nil_value() : () -> i64
      %3003 = func.call @cc_cons(%3001, %3002) : (i64, i64) -> i64
      %3004 = func.call @cc_values_pack(%3003) : (i64) -> i64
      func.call @stack_push_pointer(%3001) : (i64) -> ()
      %3005 = func.call @stack_pop_pointer() : () -> i64
      %3006 = func.call @stack_pop_pointer() : () -> i64
      %3007 = func.call @cc_cons(%3005, %3006) : (i64, i64) -> i64
      %3008 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3009 = arith.constant 5 : i64
      %3010 = func.call @cc_make_string(%3008, %3009) : (!llvm.ptr, i64) -> i64
      %3011 = func.call @cc_nil_value() : () -> i64
      %3012 = func.call @cc_intern(%3010, %3011) : (i64, i64) -> i64
      %3013 = func.call @cc_nil_value() : () -> i64
      %3014 = func.call @cc_cons(%3012, %3013) : (i64, i64) -> i64
      %3015 = func.call @cc_values_pack(%3014) : (i64) -> i64
      %3016 = func.call @cc_cons(%3012, %3007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3016) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3017 = func.call @stack_pop_pointer() : () -> i64
      %3018 = func.call @stack_pop_pointer() : () -> i64
      %3019 = func.call @cc_cons(%3018, %3017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3019) : (i64) -> ()
      %3020 = func.call @stack_pop_pointer() : () -> i64
      %3021 = func.call @stack_pop_pointer() : () -> i64
      %3022 = func.call @cc_cons(%3021, %3020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3022) : (i64) -> ()
      %3023 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3023) : (i64) -> ()
      %3024 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3025 = arith.constant 11 : i64
      %3026 = func.call @cc_make_string(%3024, %3025) : (!llvm.ptr, i64) -> i64
      %3027 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3028 = arith.constant 11 : i64
      %3029 = func.call @cc_make_string(%3027, %3028) : (!llvm.ptr, i64) -> i64
      %3030 = func.call @cc_intern(%3026, %3029) : (i64, i64) -> i64
      %3031 = func.call @cc_nil_value() : () -> i64
      %3032 = func.call @cc_cons(%3030, %3031) : (i64, i64) -> i64
      %3033 = func.call @cc_values_pack(%3032) : (i64) -> i64
      func.call @stack_push_pointer(%3030) : (i64) -> ()
      %3034 = func.call @stack_pop_pointer() : () -> i64
      %3035 = func.call @stack_pop_pointer() : () -> i64
      %3036 = func.call @cc_cons(%3034, %3035) : (i64, i64) -> i64
      %3037 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3038 = arith.constant 5 : i64
      %3039 = func.call @cc_make_string(%3037, %3038) : (!llvm.ptr, i64) -> i64
      %3040 = func.call @cc_nil_value() : () -> i64
      %3041 = func.call @cc_intern(%3039, %3040) : (i64, i64) -> i64
      %3042 = func.call @cc_nil_value() : () -> i64
      %3043 = func.call @cc_cons(%3041, %3042) : (i64, i64) -> i64
      %3044 = func.call @cc_values_pack(%3043) : (i64) -> i64
      %3045 = func.call @cc_cons(%3041, %3036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3046 = func.call @stack_pop_pointer() : () -> i64
      %3047 = func.call @stack_pop_pointer() : () -> i64
      %3048 = func.call @cc_cons(%3047, %3046) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3048) : (i64) -> ()
      %3049 = func.call @stack_pop_pointer() : () -> i64
      %3050 = func.call @stack_pop_pointer() : () -> i64
      %3051 = func.call @cc_cons(%3050, %3049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3051) : (i64) -> ()
      %3052 = func.call @stack_pop_pointer() : () -> i64
      %3053 = func.call @stack_pop_pointer() : () -> i64
      %3054 = func.call @cc_cons(%3053, %3052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3054) : (i64) -> ()
      %3055 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3056 = arith.constant 3 : i64
      %3057 = func.call @cc_make_string(%3055, %3056) : (!llvm.ptr, i64) -> i64
      %3058 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3059 = arith.constant 11 : i64
      %3060 = func.call @cc_make_string(%3058, %3059) : (!llvm.ptr, i64) -> i64
      %3061 = func.call @cc_intern(%3057, %3060) : (i64, i64) -> i64
      %3062 = func.call @cc_nil_value() : () -> i64
      %3063 = func.call @cc_cons(%3061, %3062) : (i64, i64) -> i64
      %3064 = func.call @cc_values_pack(%3063) : (i64) -> i64
      func.call @stack_push_pointer(%3061) : (i64) -> ()
      %3065 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3066 = arith.constant 2 : i64
      %3067 = func.call @cc_make_string(%3065, %3066) : (!llvm.ptr, i64) -> i64
      %3068 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3069 = arith.constant 11 : i64
      %3070 = func.call @cc_make_string(%3068, %3069) : (!llvm.ptr, i64) -> i64
      %3071 = func.call @cc_intern(%3067, %3070) : (i64, i64) -> i64
      %3072 = func.call @cc_nil_value() : () -> i64
      %3073 = func.call @cc_cons(%3071, %3072) : (i64, i64) -> i64
      %3074 = func.call @cc_values_pack(%3073) : (i64) -> i64
      func.call @stack_push_pointer(%3071) : (i64) -> ()
      %3075 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3076 = arith.constant 2 : i64
      %3077 = func.call @cc_make_string(%3075, %3076) : (!llvm.ptr, i64) -> i64
      %3078 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3079 = arith.constant 11 : i64
      %3080 = func.call @cc_make_string(%3078, %3079) : (!llvm.ptr, i64) -> i64
      %3081 = func.call @cc_intern(%3077, %3080) : (i64, i64) -> i64
      %3082 = func.call @cc_nil_value() : () -> i64
      %3083 = func.call @cc_cons(%3081, %3082) : (i64, i64) -> i64
      %3084 = func.call @cc_values_pack(%3083) : (i64) -> i64
      func.call @stack_push_pointer(%3081) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3085 = func.call @stack_pop_pointer() : () -> i64
      %3086 = func.call @stack_pop_pointer() : () -> i64
      %3087 = func.call @cc_cons(%3086, %3085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3087) : (i64) -> ()
      %3088 = func.call @stack_pop_pointer() : () -> i64
      %3089 = func.call @stack_pop_pointer() : () -> i64
      %3090 = func.call @cc_cons(%3089, %3088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3090) : (i64) -> ()
      %3091 = func.call @stack_pop_pointer() : () -> i64
      %3092 = func.call @stack_pop_pointer() : () -> i64
      %3093 = func.call @cc_cons(%3092, %3091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3093) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3094 = func.call @stack_pop_pointer() : () -> i64
      %3095 = func.call @stack_pop_pointer() : () -> i64
      %3096 = func.call @cc_cons(%3095, %3094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3096) : (i64) -> ()
      %3097 = func.call @stack_pop_pointer() : () -> i64
      %3098 = func.call @stack_pop_pointer() : () -> i64
      %3099 = func.call @cc_cons(%3098, %3097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3099) : (i64) -> ()
      %3100 = func.call @stack_pop_pointer() : () -> i64
      %3101 = func.call @stack_pop_pointer() : () -> i64
      %3102 = func.call @cc_cons(%3101, %3100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3102) : (i64) -> ()
      %3103 = func.call @stack_pop_pointer() : () -> i64
      %3104 = func.call @stack_pop_pointer() : () -> i64
      %3105 = func.call @cc_cons(%3104, %3103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3105) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3106 = func.call @stack_pop_pointer() : () -> i64
      %3107 = func.call @stack_pop_pointer() : () -> i64
      %3108 = func.call @cc_cons(%3107, %3106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3108) : (i64) -> ()
      %3109 = func.call @stack_pop_pointer() : () -> i64
      %3110 = func.call @stack_pop_pointer() : () -> i64
      %3111 = func.call @cc_cons(%3110, %3109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3111) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3112 = func.call @stack_pop_pointer() : () -> i64
      %3113 = func.call @stack_pop_pointer() : () -> i64
      %3114 = func.call @cc_cons(%3113, %3112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3114) : (i64) -> ()
      %3115 = func.call @stack_pop_pointer() : () -> i64
      %3116 = func.call @stack_pop_pointer() : () -> i64
      %3117 = func.call @cc_cons(%3116, %3115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3117) : (i64) -> ()
      %3118 = func.call @stack_pop_pointer() : () -> i64
      %3181 = arith.constant 206494159077386 : i64
      %3182 = arith.constant 0 : i64
      %3183 = func.call @cc_make_closure(%3181, %3182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3183) : (i64) -> ()
      %3184 = func.call @stack_pop_pointer() : () -> i64
      %3185 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3186 = arith.constant 1 : i64
      %3187 = func.call @cc_make_string(%3185, %3186) : (!llvm.ptr, i64) -> i64
      %3188 = func.call @cc_nil_value() : () -> i64
      %3189 = func.call @cc_intern(%3187, %3188) : (i64, i64) -> i64
      %3190 = func.call @cc_nil_value() : () -> i64
      %3191 = func.call @cc_cons(%3189, %3190) : (i64, i64) -> i64
      %3192 = func.call @cc_values_pack(%3191) : (i64) -> i64
      func.call @stack_push_pointer(%3189) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3193 = func.call @stack_pop_pointer() : () -> i64
      %3194 = func.call @stack_pop_pointer() : () -> i64
      %3195 = func.call @cc_cons(%3194, %3193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3195) : (i64) -> ()
      %3196 = func.call @stack_pop_pointer() : () -> i64
      %3197 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3198 = arith.constant 11 : i64
      %3199 = func.call @cc_make_string(%3197, %3198) : (!llvm.ptr, i64) -> i64
      %3200 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3201 = arith.constant 7 : i64
      %3202 = func.call @cc_make_string(%3200, %3201) : (!llvm.ptr, i64) -> i64
      %3203 = func.call @cc_intern(%3199, %3202) : (i64, i64) -> i64
      %3204 = func.call @cc_nil_value() : () -> i64
      %3205 = func.call @cc_cons(%3203, %3204) : (i64, i64) -> i64
      %3206 = func.call @cc_values_pack(%3205) : (i64) -> i64
      func.call @stack_push_pointer(%3203) : (i64) -> ()
      %3207 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3208 = func.call @stack_pop_pointer() : () -> i64
      %3209 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3210 = arith.constant 4 : i64
      %3211 = func.call @cc_make_string(%3209, %3210) : (!llvm.ptr, i64) -> i64
      %3212 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3213 = arith.constant 7 : i64
      %3214 = func.call @cc_make_string(%3212, %3213) : (!llvm.ptr, i64) -> i64
      %3215 = func.call @cc_intern(%3211, %3214) : (i64, i64) -> i64
      %3216 = func.call @cc_nil_value() : () -> i64
      %3217 = func.call @cc_cons(%3215, %3216) : (i64, i64) -> i64
      %3218 = func.call @cc_values_pack(%3217) : (i64) -> i64
      func.call @stack_push_pointer(%3215) : (i64) -> ()
      %3219 = func.call @stack_pop_pointer() : () -> i64
      %3220 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3221 = arith.constant 6 : i64
      %3222 = func.call @cc_make_string(%3220, %3221) : (!llvm.ptr, i64) -> i64
      %3223 = func.call @cc_nil_value() : () -> i64
      %3224 = func.call @cc_intern(%3222, %3223) : (i64, i64) -> i64
      %3225 = func.call @cc_nil_value() : () -> i64
      %3226 = func.call @cc_cons(%3224, %3225) : (i64, i64) -> i64
      %3227 = func.call @cc_values_pack(%3226) : (i64) -> i64
      func.call @stack_push_pointer(%3224) : (i64) -> ()
      %3228 = func.call @stack_pop_pointer() : () -> i64
      %3229 = func.call @cc_nil_value() : () -> i64
      %3230 = func.call @cc_errorp(%2921) : (i64) -> i64
      %3231 = arith.cmpi ne, %3230, %3229 : i64
      %3232 = arith.cmpi eq, %3229, %3229 : i64
      %3233 = arith.andi %3231, %3232 : i1
      %3234 = scf.if %3233 -> (i64) {
        scf.yield %2921 : i64
      } else {
        scf.yield %3229 : i64
      }
      %3235 = func.call @cc_errorp(%3118) : (i64) -> i64
      %3236 = arith.cmpi ne, %3235, %3229 : i64
      %3237 = arith.cmpi eq, %3234, %3229 : i64
      %3238 = arith.andi %3236, %3237 : i1
      %3239 = scf.if %3238 -> (i64) {
        scf.yield %3118 : i64
      } else {
        scf.yield %3234 : i64
      }
      %3240 = func.call @cc_errorp(%3184) : (i64) -> i64
      %3241 = arith.cmpi ne, %3240, %3229 : i64
      %3242 = arith.cmpi eq, %3239, %3229 : i64
      %3243 = arith.andi %3241, %3242 : i1
      %3244 = scf.if %3243 -> (i64) {
        scf.yield %3184 : i64
      } else {
        scf.yield %3239 : i64
      }
      %3245 = func.call @cc_errorp(%3196) : (i64) -> i64
      %3246 = arith.cmpi ne, %3245, %3229 : i64
      %3247 = arith.cmpi eq, %3244, %3229 : i64
      %3248 = arith.andi %3246, %3247 : i1
      %3249 = scf.if %3248 -> (i64) {
        scf.yield %3196 : i64
      } else {
        scf.yield %3244 : i64
      }
      %3250 = func.call @cc_errorp(%3207) : (i64) -> i64
      %3251 = arith.cmpi ne, %3250, %3229 : i64
      %3252 = arith.cmpi eq, %3249, %3229 : i64
      %3253 = arith.andi %3251, %3252 : i1
      %3254 = scf.if %3253 -> (i64) {
        scf.yield %3207 : i64
      } else {
        scf.yield %3249 : i64
      }
      %3255 = func.call @cc_errorp(%3208) : (i64) -> i64
      %3256 = arith.cmpi ne, %3255, %3229 : i64
      %3257 = arith.cmpi eq, %3254, %3229 : i64
      %3258 = arith.andi %3256, %3257 : i1
      %3259 = scf.if %3258 -> (i64) {
        scf.yield %3208 : i64
      } else {
        scf.yield %3254 : i64
      }
      %3260 = func.call @cc_errorp(%3219) : (i64) -> i64
      %3261 = arith.cmpi ne, %3260, %3229 : i64
      %3262 = arith.cmpi eq, %3259, %3229 : i64
      %3263 = arith.andi %3261, %3262 : i1
      %3264 = scf.if %3263 -> (i64) {
        scf.yield %3219 : i64
      } else {
        scf.yield %3259 : i64
      }
      %3265 = func.call @cc_errorp(%3228) : (i64) -> i64
      %3266 = arith.cmpi ne, %3265, %3229 : i64
      %3267 = arith.cmpi eq, %3264, %3229 : i64
      %3268 = arith.andi %3266, %3267 : i1
      %3269 = scf.if %3268 -> (i64) {
        scf.yield %3228 : i64
      } else {
        scf.yield %3264 : i64
      }
      %3270 = arith.cmpi ne, %3269, %3229 : i64
      scf.if %3270 {
        func.call @stack_push_pointer(%3269) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2921) : (i64) -> ()
        func.call @stack_push_pointer(%3118) : (i64) -> ()
        func.call @stack_push_pointer(%3184) : (i64) -> ()
        func.call @stack_push_pointer(%3196) : (i64) -> ()
        func.call @stack_push_pointer(%3207) : (i64) -> ()
        func.call @stack_push_pointer(%3208) : (i64) -> ()
        func.call @stack_push_pointer(%3219) : (i64) -> ()
        func.call @stack_push_pointer(%3228) : (i64) -> ()
        %3271 = llvm.mlir.addressof @str339 : !llvm.ptr
        %3272 = func.call @cc_make_function_ref_const(%3271) : (!llvm.ptr) -> i64
        %3273 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3272, %3273) : (i64, i64) -> ()
      }
      %3274 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3274 : i64
    }
    %3275 = func.call @cc_nil_value() : () -> i64
    %3276 = func.call @cc_errorp(%2912) : (i64) -> i64
    %3277 = arith.cmpi ne, %3276, %3275 : i64
    %3278 = scf.if %3277 -> (i64) {
      scf.yield %2912 : i64
    } else {
      %3279 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3280 = arith.constant 15 : i64
      %3281 = func.call @cc_make_string(%3279, %3280) : (!llvm.ptr, i64) -> i64
      %3282 = func.call @cc_nil_value() : () -> i64
      %3283 = func.call @cc_intern(%3281, %3282) : (i64, i64) -> i64
      %3284 = func.call @cc_nil_value() : () -> i64
      %3285 = func.call @cc_cons(%3283, %3284) : (i64, i64) -> i64
      %3286 = func.call @cc_values_pack(%3285) : (i64) -> i64
      func.call @stack_push_pointer(%3283) : (i64) -> ()
      %3287 = func.call @stack_pop_pointer() : () -> i64
      %3288 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3289 = arith.constant 8 : i64
      %3290 = func.call @cc_make_string(%3288, %3289) : (!llvm.ptr, i64) -> i64
      %3291 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3292 = arith.constant 11 : i64
      %3293 = func.call @cc_make_string(%3291, %3292) : (!llvm.ptr, i64) -> i64
      %3294 = func.call @cc_intern(%3290, %3293) : (i64, i64) -> i64
      %3295 = func.call @cc_nil_value() : () -> i64
      %3296 = func.call @cc_cons(%3294, %3295) : (i64, i64) -> i64
      %3297 = func.call @cc_values_pack(%3296) : (i64) -> i64
      func.call @stack_push_pointer(%3294) : (i64) -> ()
      %3298 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3299 = arith.constant 7 : i64
      %3300 = func.call @cc_make_string(%3298, %3299) : (!llvm.ptr, i64) -> i64
      %3301 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3302 = arith.constant 11 : i64
      %3303 = func.call @cc_make_string(%3301, %3302) : (!llvm.ptr, i64) -> i64
      %3304 = func.call @cc_intern(%3300, %3303) : (i64, i64) -> i64
      %3305 = func.call @cc_nil_value() : () -> i64
      %3306 = func.call @cc_cons(%3304, %3305) : (i64, i64) -> i64
      %3307 = func.call @cc_values_pack(%3306) : (i64) -> i64
      func.call @stack_push_pointer(%3304) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3308 = arith.constant 4 : i64
      %3309 = func.call @cc_box_fixnum(%3308) : (i64) -> i64
      %3310 = func.call @cc_make_vector(%3309) : (i64) -> i64
      %3311 = func.call @stack_pop_pointer() : () -> i64
      %3312 = arith.constant 3 : i64
      %3313 = func.call @cc_box_fixnum(%3312) : (i64) -> i64
      %3314 = func.call @cc_svset(%3310, %3313, %3311) : (i64, i64, i64) -> i64
      %3315 = func.call @stack_pop_pointer() : () -> i64
      %3316 = arith.constant 2 : i64
      %3317 = func.call @cc_box_fixnum(%3316) : (i64) -> i64
      %3318 = func.call @cc_svset(%3310, %3317, %3315) : (i64, i64, i64) -> i64
      %3319 = func.call @stack_pop_pointer() : () -> i64
      %3320 = arith.constant 1 : i64
      %3321 = func.call @cc_box_fixnum(%3320) : (i64) -> i64
      %3322 = func.call @cc_svset(%3310, %3321, %3319) : (i64, i64, i64) -> i64
      %3323 = func.call @stack_pop_pointer() : () -> i64
      %3324 = arith.constant 0 : i64
      %3325 = func.call @cc_box_fixnum(%3324) : (i64) -> i64
      %3326 = func.call @cc_svset(%3310, %3325, %3323) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%3310) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3327 = func.call @stack_pop_pointer() : () -> i64
      %3328 = func.call @stack_pop_pointer() : () -> i64
      %3329 = func.call @cc_cons(%3328, %3327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3329) : (i64) -> ()
      %3330 = func.call @stack_pop_pointer() : () -> i64
      %3331 = func.call @stack_pop_pointer() : () -> i64
      %3332 = func.call @cc_cons(%3331, %3330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3332) : (i64) -> ()
      %3333 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3334 = arith.constant 8 : i64
      %3335 = func.call @cc_make_string(%3333, %3334) : (!llvm.ptr, i64) -> i64
      %3336 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3337 = arith.constant 11 : i64
      %3338 = func.call @cc_make_string(%3336, %3337) : (!llvm.ptr, i64) -> i64
      %3339 = func.call @cc_intern(%3335, %3338) : (i64, i64) -> i64
      %3340 = func.call @cc_nil_value() : () -> i64
      %3341 = func.call @cc_cons(%3339, %3340) : (i64, i64) -> i64
      %3342 = func.call @cc_values_pack(%3341) : (i64) -> i64
      func.call @stack_push_pointer(%3339) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3343 = arith.constant 4 : i64
      %3344 = func.call @cc_box_fixnum(%3343) : (i64) -> i64
      %3345 = func.call @cc_make_vector(%3344) : (i64) -> i64
      %3346 = func.call @stack_pop_pointer() : () -> i64
      %3347 = arith.constant 3 : i64
      %3348 = func.call @cc_box_fixnum(%3347) : (i64) -> i64
      %3349 = func.call @cc_svset(%3345, %3348, %3346) : (i64, i64, i64) -> i64
      %3350 = func.call @stack_pop_pointer() : () -> i64
      %3351 = arith.constant 2 : i64
      %3352 = func.call @cc_box_fixnum(%3351) : (i64) -> i64
      %3353 = func.call @cc_svset(%3345, %3352, %3350) : (i64, i64, i64) -> i64
      %3354 = func.call @stack_pop_pointer() : () -> i64
      %3355 = arith.constant 1 : i64
      %3356 = func.call @cc_box_fixnum(%3355) : (i64) -> i64
      %3357 = func.call @cc_svset(%3345, %3356, %3354) : (i64, i64, i64) -> i64
      %3358 = func.call @stack_pop_pointer() : () -> i64
      %3359 = arith.constant 0 : i64
      %3360 = func.call @cc_box_fixnum(%3359) : (i64) -> i64
      %3361 = func.call @cc_svset(%3345, %3360, %3358) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%3345) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3362 = func.call @stack_pop_pointer() : () -> i64
      %3363 = func.call @stack_pop_pointer() : () -> i64
      %3364 = func.call @cc_cons(%3363, %3362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3364) : (i64) -> ()
      %3365 = func.call @stack_pop_pointer() : () -> i64
      %3366 = func.call @stack_pop_pointer() : () -> i64
      %3367 = func.call @cc_cons(%3366, %3365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3367) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3368 = func.call @stack_pop_pointer() : () -> i64
      %3369 = func.call @stack_pop_pointer() : () -> i64
      %3370 = func.call @cc_cons(%3369, %3368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3370) : (i64) -> ()
      %3371 = func.call @stack_pop_pointer() : () -> i64
      %3372 = func.call @stack_pop_pointer() : () -> i64
      %3373 = func.call @cc_cons(%3372, %3371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3373) : (i64) -> ()
      %3374 = func.call @stack_pop_pointer() : () -> i64
      %3375 = func.call @stack_pop_pointer() : () -> i64
      %3376 = func.call @cc_cons(%3375, %3374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3376) : (i64) -> ()
      %3377 = func.call @stack_pop_pointer() : () -> i64
      %3429 = arith.constant 206494159077387 : i64
      %3430 = arith.constant 0 : i64
      %3431 = func.call @cc_make_closure(%3429, %3430) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3431) : (i64) -> ()
      %3432 = func.call @stack_pop_pointer() : () -> i64
      %3433 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3433) : (i64) -> ()
      %3434 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3434) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3435 = func.call @stack_pop_pointer() : () -> i64
      %3436 = func.call @stack_pop_pointer() : () -> i64
      %3437 = func.call @cc_cons(%3436, %3435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3437) : (i64) -> ()
      %3438 = func.call @stack_pop_pointer() : () -> i64
      %3439 = func.call @stack_pop_pointer() : () -> i64
      %3440 = func.call @cc_cons(%3439, %3438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3440) : (i64) -> ()
      %3441 = func.call @stack_pop_pointer() : () -> i64
      %3442 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3443 = arith.constant 11 : i64
      %3444 = func.call @cc_make_string(%3442, %3443) : (!llvm.ptr, i64) -> i64
      %3445 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3446 = arith.constant 7 : i64
      %3447 = func.call @cc_make_string(%3445, %3446) : (!llvm.ptr, i64) -> i64
      %3448 = func.call @cc_intern(%3444, %3447) : (i64, i64) -> i64
      %3449 = func.call @cc_nil_value() : () -> i64
      %3450 = func.call @cc_cons(%3448, %3449) : (i64, i64) -> i64
      %3451 = func.call @cc_values_pack(%3450) : (i64) -> i64
      func.call @stack_push_pointer(%3448) : (i64) -> ()
      %3452 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3453 = func.call @stack_pop_pointer() : () -> i64
      %3454 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3455 = arith.constant 4 : i64
      %3456 = func.call @cc_make_string(%3454, %3455) : (!llvm.ptr, i64) -> i64
      %3457 = llvm.mlir.addressof @str350 : !llvm.ptr
      %3458 = arith.constant 7 : i64
      %3459 = func.call @cc_make_string(%3457, %3458) : (!llvm.ptr, i64) -> i64
      %3460 = func.call @cc_intern(%3456, %3459) : (i64, i64) -> i64
      %3461 = func.call @cc_nil_value() : () -> i64
      %3462 = func.call @cc_cons(%3460, %3461) : (i64, i64) -> i64
      %3463 = func.call @cc_values_pack(%3462) : (i64) -> i64
      func.call @stack_push_pointer(%3460) : (i64) -> ()
      %3464 = func.call @stack_pop_pointer() : () -> i64
      %3465 = llvm.mlir.addressof @str351 : !llvm.ptr
      %3466 = arith.constant 6 : i64
      %3467 = func.call @cc_make_string(%3465, %3466) : (!llvm.ptr, i64) -> i64
      %3468 = func.call @cc_nil_value() : () -> i64
      %3469 = func.call @cc_intern(%3467, %3468) : (i64, i64) -> i64
      %3470 = func.call @cc_nil_value() : () -> i64
      %3471 = func.call @cc_cons(%3469, %3470) : (i64, i64) -> i64
      %3472 = func.call @cc_values_pack(%3471) : (i64) -> i64
      func.call @stack_push_pointer(%3469) : (i64) -> ()
      %3473 = func.call @stack_pop_pointer() : () -> i64
      %3474 = func.call @cc_nil_value() : () -> i64
      %3475 = func.call @cc_errorp(%3287) : (i64) -> i64
      %3476 = arith.cmpi ne, %3475, %3474 : i64
      %3477 = arith.cmpi eq, %3474, %3474 : i64
      %3478 = arith.andi %3476, %3477 : i1
      %3479 = scf.if %3478 -> (i64) {
        scf.yield %3287 : i64
      } else {
        scf.yield %3474 : i64
      }
      %3480 = func.call @cc_errorp(%3377) : (i64) -> i64
      %3481 = arith.cmpi ne, %3480, %3474 : i64
      %3482 = arith.cmpi eq, %3479, %3474 : i64
      %3483 = arith.andi %3481, %3482 : i1
      %3484 = scf.if %3483 -> (i64) {
        scf.yield %3377 : i64
      } else {
        scf.yield %3479 : i64
      }
      %3485 = func.call @cc_errorp(%3432) : (i64) -> i64
      %3486 = arith.cmpi ne, %3485, %3474 : i64
      %3487 = arith.cmpi eq, %3484, %3474 : i64
      %3488 = arith.andi %3486, %3487 : i1
      %3489 = scf.if %3488 -> (i64) {
        scf.yield %3432 : i64
      } else {
        scf.yield %3484 : i64
      }
      %3490 = func.call @cc_errorp(%3441) : (i64) -> i64
      %3491 = arith.cmpi ne, %3490, %3474 : i64
      %3492 = arith.cmpi eq, %3489, %3474 : i64
      %3493 = arith.andi %3491, %3492 : i1
      %3494 = scf.if %3493 -> (i64) {
        scf.yield %3441 : i64
      } else {
        scf.yield %3489 : i64
      }
      %3495 = func.call @cc_errorp(%3452) : (i64) -> i64
      %3496 = arith.cmpi ne, %3495, %3474 : i64
      %3497 = arith.cmpi eq, %3494, %3474 : i64
      %3498 = arith.andi %3496, %3497 : i1
      %3499 = scf.if %3498 -> (i64) {
        scf.yield %3452 : i64
      } else {
        scf.yield %3494 : i64
      }
      %3500 = func.call @cc_errorp(%3453) : (i64) -> i64
      %3501 = arith.cmpi ne, %3500, %3474 : i64
      %3502 = arith.cmpi eq, %3499, %3474 : i64
      %3503 = arith.andi %3501, %3502 : i1
      %3504 = scf.if %3503 -> (i64) {
        scf.yield %3453 : i64
      } else {
        scf.yield %3499 : i64
      }
      %3505 = func.call @cc_errorp(%3464) : (i64) -> i64
      %3506 = arith.cmpi ne, %3505, %3474 : i64
      %3507 = arith.cmpi eq, %3504, %3474 : i64
      %3508 = arith.andi %3506, %3507 : i1
      %3509 = scf.if %3508 -> (i64) {
        scf.yield %3464 : i64
      } else {
        scf.yield %3504 : i64
      }
      %3510 = func.call @cc_errorp(%3473) : (i64) -> i64
      %3511 = arith.cmpi ne, %3510, %3474 : i64
      %3512 = arith.cmpi eq, %3509, %3474 : i64
      %3513 = arith.andi %3511, %3512 : i1
      %3514 = scf.if %3513 -> (i64) {
        scf.yield %3473 : i64
      } else {
        scf.yield %3509 : i64
      }
      %3515 = arith.cmpi ne, %3514, %3474 : i64
      scf.if %3515 {
        func.call @stack_push_pointer(%3514) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3287) : (i64) -> ()
        func.call @stack_push_pointer(%3377) : (i64) -> ()
        func.call @stack_push_pointer(%3432) : (i64) -> ()
        func.call @stack_push_pointer(%3441) : (i64) -> ()
        func.call @stack_push_pointer(%3452) : (i64) -> ()
        func.call @stack_push_pointer(%3453) : (i64) -> ()
        func.call @stack_push_pointer(%3464) : (i64) -> ()
        func.call @stack_push_pointer(%3473) : (i64) -> ()
        %3516 = llvm.mlir.addressof @str352 : !llvm.ptr
        %3517 = func.call @cc_make_function_ref_const(%3516) : (!llvm.ptr) -> i64
        %3518 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3517, %3518) : (i64, i64) -> ()
      }
      %3519 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3519 : i64
    }
    %3520 = func.call @cc_nil_value() : () -> i64
    %3521 = func.call @cc_errorp(%3278) : (i64) -> i64
    %3522 = arith.cmpi ne, %3521, %3520 : i64
    %3523 = scf.if %3522 -> (i64) {
      scf.yield %3278 : i64
    } else {
      %3524 = llvm.mlir.addressof @str353 : !llvm.ptr
      %3525 = arith.constant 16 : i64
      %3526 = func.call @cc_make_string(%3524, %3525) : (!llvm.ptr, i64) -> i64
      %3527 = func.call @cc_nil_value() : () -> i64
      %3528 = func.call @cc_intern(%3526, %3527) : (i64, i64) -> i64
      %3529 = func.call @cc_nil_value() : () -> i64
      %3530 = func.call @cc_cons(%3528, %3529) : (i64, i64) -> i64
      %3531 = func.call @cc_values_pack(%3530) : (i64) -> i64
      func.call @stack_push_pointer(%3528) : (i64) -> ()
      %3532 = func.call @stack_pop_pointer() : () -> i64
      %3533 = llvm.mlir.addressof @str354 : !llvm.ptr
      %3534 = arith.constant 8 : i64
      %3535 = func.call @cc_make_string(%3533, %3534) : (!llvm.ptr, i64) -> i64
      %3536 = llvm.mlir.addressof @str355 : !llvm.ptr
      %3537 = arith.constant 11 : i64
      %3538 = func.call @cc_make_string(%3536, %3537) : (!llvm.ptr, i64) -> i64
      %3539 = func.call @cc_intern(%3535, %3538) : (i64, i64) -> i64
      %3540 = func.call @cc_nil_value() : () -> i64
      %3541 = func.call @cc_cons(%3539, %3540) : (i64, i64) -> i64
      %3542 = func.call @cc_values_pack(%3541) : (i64) -> i64
      func.call @stack_push_pointer(%3539) : (i64) -> ()
      %3543 = llvm.mlir.addressof @str356 : !llvm.ptr
      %3544 = arith.constant 7 : i64
      %3545 = func.call @cc_make_string(%3543, %3544) : (!llvm.ptr, i64) -> i64
      %3546 = llvm.mlir.addressof @str357 : !llvm.ptr
      %3547 = arith.constant 11 : i64
      %3548 = func.call @cc_make_string(%3546, %3547) : (!llvm.ptr, i64) -> i64
      %3549 = func.call @cc_intern(%3545, %3548) : (i64, i64) -> i64
      %3550 = func.call @cc_nil_value() : () -> i64
      %3551 = func.call @cc_cons(%3549, %3550) : (i64, i64) -> i64
      %3552 = func.call @cc_values_pack(%3551) : (i64) -> i64
      func.call @stack_push_pointer(%3549) : (i64) -> ()
      %3553 = llvm.mlir.addressof @str358 : !llvm.ptr
      %3554 = arith.constant 8 : i64
      %3555 = func.call @cc_make_string(%3553, %3554) : (!llvm.ptr, i64) -> i64
      %3556 = llvm.mlir.addressof @str359 : !llvm.ptr
      %3557 = arith.constant 11 : i64
      %3558 = func.call @cc_make_string(%3556, %3557) : (!llvm.ptr, i64) -> i64
      %3559 = func.call @cc_intern(%3555, %3558) : (i64, i64) -> i64
      %3560 = func.call @cc_nil_value() : () -> i64
      %3561 = func.call @cc_cons(%3559, %3560) : (i64, i64) -> i64
      %3562 = func.call @cc_values_pack(%3561) : (i64) -> i64
      func.call @stack_push_pointer(%3559) : (i64) -> ()
      %3563 = llvm.mlir.addressof @str360 : !llvm.ptr
      %3564 = arith.constant 3 : i64
      %3565 = func.call @cc_make_string(%3563, %3564) : (!llvm.ptr, i64) -> i64
      %3566 = llvm.mlir.addressof @str361 : !llvm.ptr
      %3567 = arith.constant 11 : i64
      %3568 = func.call @cc_make_string(%3566, %3567) : (!llvm.ptr, i64) -> i64
      %3569 = func.call @cc_intern(%3565, %3568) : (i64, i64) -> i64
      %3570 = func.call @cc_nil_value() : () -> i64
      %3571 = func.call @cc_cons(%3569, %3570) : (i64, i64) -> i64
      %3572 = func.call @cc_values_pack(%3571) : (i64) -> i64
      func.call @stack_push_pointer(%3569) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3573 = func.call @stack_pop_pointer() : () -> i64
      %3574 = func.call @stack_pop_pointer() : () -> i64
      %3575 = func.call @cc_cons(%3574, %3573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3575) : (i64) -> ()
      %3576 = func.call @stack_pop_pointer() : () -> i64
      %3577 = func.call @stack_pop_pointer() : () -> i64
      %3578 = func.call @cc_cons(%3577, %3576) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3578) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3579 = func.call @stack_pop_pointer() : () -> i64
      %3580 = func.call @stack_pop_pointer() : () -> i64
      %3581 = func.call @cc_cons(%3580, %3579) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3581) : (i64) -> ()
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = func.call @stack_pop_pointer() : () -> i64
      %3584 = func.call @cc_cons(%3583, %3582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3584) : (i64) -> ()
      %3585 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3585) : (i64) -> ()
      %3586 = llvm.mlir.addressof @str362 : !llvm.ptr
      %3587 = arith.constant 8 : i64
      %3588 = func.call @cc_make_string(%3586, %3587) : (!llvm.ptr, i64) -> i64
      %3589 = llvm.mlir.addressof @str363 : !llvm.ptr
      %3590 = arith.constant 11 : i64
      %3591 = func.call @cc_make_string(%3589, %3590) : (!llvm.ptr, i64) -> i64
      %3592 = func.call @cc_intern(%3588, %3591) : (i64, i64) -> i64
      %3593 = func.call @cc_nil_value() : () -> i64
      %3594 = func.call @cc_cons(%3592, %3593) : (i64, i64) -> i64
      %3595 = func.call @cc_values_pack(%3594) : (i64) -> i64
      func.call @stack_push_pointer(%3592) : (i64) -> ()
      %3596 = func.call @stack_pop_pointer() : () -> i64
      %3597 = func.call @stack_pop_pointer() : () -> i64
      %3598 = func.call @cc_cons(%3596, %3597) : (i64, i64) -> i64
      %3599 = llvm.mlir.addressof @str364 : !llvm.ptr
      %3600 = arith.constant 5 : i64
      %3601 = func.call @cc_make_string(%3599, %3600) : (!llvm.ptr, i64) -> i64
      %3602 = func.call @cc_nil_value() : () -> i64
      %3603 = func.call @cc_intern(%3601, %3602) : (i64, i64) -> i64
      %3604 = func.call @cc_nil_value() : () -> i64
      %3605 = func.call @cc_cons(%3603, %3604) : (i64, i64) -> i64
      %3606 = func.call @cc_values_pack(%3605) : (i64) -> i64
      %3607 = func.call @cc_cons(%3603, %3598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3607) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3608 = func.call @stack_pop_pointer() : () -> i64
      %3609 = func.call @stack_pop_pointer() : () -> i64
      %3610 = func.call @cc_cons(%3609, %3608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3610) : (i64) -> ()
      %3611 = func.call @stack_pop_pointer() : () -> i64
      %3612 = func.call @stack_pop_pointer() : () -> i64
      %3613 = func.call @cc_cons(%3612, %3611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3613) : (i64) -> ()
      %3614 = func.call @stack_pop_pointer() : () -> i64
      %3615 = func.call @stack_pop_pointer() : () -> i64
      %3616 = func.call @cc_cons(%3615, %3614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3616) : (i64) -> ()
      %3617 = func.call @stack_pop_pointer() : () -> i64
      %3641 = arith.constant 206494159077388 : i64
      %3642 = arith.constant 0 : i64
      %3643 = func.call @cc_make_closure(%3641, %3642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3643) : (i64) -> ()
      %3644 = func.call @stack_pop_pointer() : () -> i64
      %3645 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3645) : (i64) -> ()
      %3646 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3646) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3647 = func.call @stack_pop_pointer() : () -> i64
      %3648 = func.call @stack_pop_pointer() : () -> i64
      %3649 = func.call @cc_cons(%3648, %3647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3649) : (i64) -> ()
      %3650 = func.call @stack_pop_pointer() : () -> i64
      %3651 = func.call @stack_pop_pointer() : () -> i64
      %3652 = func.call @cc_cons(%3651, %3650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3652) : (i64) -> ()
      %3653 = func.call @stack_pop_pointer() : () -> i64
      %3654 = llvm.mlir.addressof @str368 : !llvm.ptr
      %3655 = arith.constant 11 : i64
      %3656 = func.call @cc_make_string(%3654, %3655) : (!llvm.ptr, i64) -> i64
      %3657 = llvm.mlir.addressof @str369 : !llvm.ptr
      %3658 = arith.constant 7 : i64
      %3659 = func.call @cc_make_string(%3657, %3658) : (!llvm.ptr, i64) -> i64
      %3660 = func.call @cc_intern(%3656, %3659) : (i64, i64) -> i64
      %3661 = func.call @cc_nil_value() : () -> i64
      %3662 = func.call @cc_cons(%3660, %3661) : (i64, i64) -> i64
      %3663 = func.call @cc_values_pack(%3662) : (i64) -> i64
      func.call @stack_push_pointer(%3660) : (i64) -> ()
      %3664 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3665 = func.call @stack_pop_pointer() : () -> i64
      %3666 = llvm.mlir.addressof @str370 : !llvm.ptr
      %3667 = arith.constant 4 : i64
      %3668 = func.call @cc_make_string(%3666, %3667) : (!llvm.ptr, i64) -> i64
      %3669 = llvm.mlir.addressof @str371 : !llvm.ptr
      %3670 = arith.constant 7 : i64
      %3671 = func.call @cc_make_string(%3669, %3670) : (!llvm.ptr, i64) -> i64
      %3672 = func.call @cc_intern(%3668, %3671) : (i64, i64) -> i64
      %3673 = func.call @cc_nil_value() : () -> i64
      %3674 = func.call @cc_cons(%3672, %3673) : (i64, i64) -> i64
      %3675 = func.call @cc_values_pack(%3674) : (i64) -> i64
      func.call @stack_push_pointer(%3672) : (i64) -> ()
      %3676 = func.call @stack_pop_pointer() : () -> i64
      %3677 = llvm.mlir.addressof @str372 : !llvm.ptr
      %3678 = arith.constant 6 : i64
      %3679 = func.call @cc_make_string(%3677, %3678) : (!llvm.ptr, i64) -> i64
      %3680 = func.call @cc_nil_value() : () -> i64
      %3681 = func.call @cc_intern(%3679, %3680) : (i64, i64) -> i64
      %3682 = func.call @cc_nil_value() : () -> i64
      %3683 = func.call @cc_cons(%3681, %3682) : (i64, i64) -> i64
      %3684 = func.call @cc_values_pack(%3683) : (i64) -> i64
      func.call @stack_push_pointer(%3681) : (i64) -> ()
      %3685 = func.call @stack_pop_pointer() : () -> i64
      %3686 = func.call @cc_nil_value() : () -> i64
      %3687 = func.call @cc_errorp(%3532) : (i64) -> i64
      %3688 = arith.cmpi ne, %3687, %3686 : i64
      %3689 = arith.cmpi eq, %3686, %3686 : i64
      %3690 = arith.andi %3688, %3689 : i1
      %3691 = scf.if %3690 -> (i64) {
        scf.yield %3532 : i64
      } else {
        scf.yield %3686 : i64
      }
      %3692 = func.call @cc_errorp(%3617) : (i64) -> i64
      %3693 = arith.cmpi ne, %3692, %3686 : i64
      %3694 = arith.cmpi eq, %3691, %3686 : i64
      %3695 = arith.andi %3693, %3694 : i1
      %3696 = scf.if %3695 -> (i64) {
        scf.yield %3617 : i64
      } else {
        scf.yield %3691 : i64
      }
      %3697 = func.call @cc_errorp(%3644) : (i64) -> i64
      %3698 = arith.cmpi ne, %3697, %3686 : i64
      %3699 = arith.cmpi eq, %3696, %3686 : i64
      %3700 = arith.andi %3698, %3699 : i1
      %3701 = scf.if %3700 -> (i64) {
        scf.yield %3644 : i64
      } else {
        scf.yield %3696 : i64
      }
      %3702 = func.call @cc_errorp(%3653) : (i64) -> i64
      %3703 = arith.cmpi ne, %3702, %3686 : i64
      %3704 = arith.cmpi eq, %3701, %3686 : i64
      %3705 = arith.andi %3703, %3704 : i1
      %3706 = scf.if %3705 -> (i64) {
        scf.yield %3653 : i64
      } else {
        scf.yield %3701 : i64
      }
      %3707 = func.call @cc_errorp(%3664) : (i64) -> i64
      %3708 = arith.cmpi ne, %3707, %3686 : i64
      %3709 = arith.cmpi eq, %3706, %3686 : i64
      %3710 = arith.andi %3708, %3709 : i1
      %3711 = scf.if %3710 -> (i64) {
        scf.yield %3664 : i64
      } else {
        scf.yield %3706 : i64
      }
      %3712 = func.call @cc_errorp(%3665) : (i64) -> i64
      %3713 = arith.cmpi ne, %3712, %3686 : i64
      %3714 = arith.cmpi eq, %3711, %3686 : i64
      %3715 = arith.andi %3713, %3714 : i1
      %3716 = scf.if %3715 -> (i64) {
        scf.yield %3665 : i64
      } else {
        scf.yield %3711 : i64
      }
      %3717 = func.call @cc_errorp(%3676) : (i64) -> i64
      %3718 = arith.cmpi ne, %3717, %3686 : i64
      %3719 = arith.cmpi eq, %3716, %3686 : i64
      %3720 = arith.andi %3718, %3719 : i1
      %3721 = scf.if %3720 -> (i64) {
        scf.yield %3676 : i64
      } else {
        scf.yield %3716 : i64
      }
      %3722 = func.call @cc_errorp(%3685) : (i64) -> i64
      %3723 = arith.cmpi ne, %3722, %3686 : i64
      %3724 = arith.cmpi eq, %3721, %3686 : i64
      %3725 = arith.andi %3723, %3724 : i1
      %3726 = scf.if %3725 -> (i64) {
        scf.yield %3685 : i64
      } else {
        scf.yield %3721 : i64
      }
      %3727 = arith.cmpi ne, %3726, %3686 : i64
      scf.if %3727 {
        func.call @stack_push_pointer(%3726) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3532) : (i64) -> ()
        func.call @stack_push_pointer(%3617) : (i64) -> ()
        func.call @stack_push_pointer(%3644) : (i64) -> ()
        func.call @stack_push_pointer(%3653) : (i64) -> ()
        func.call @stack_push_pointer(%3664) : (i64) -> ()
        func.call @stack_push_pointer(%3665) : (i64) -> ()
        func.call @stack_push_pointer(%3676) : (i64) -> ()
        func.call @stack_push_pointer(%3685) : (i64) -> ()
        %3728 = llvm.mlir.addressof @str373 : !llvm.ptr
        %3729 = func.call @cc_make_function_ref_const(%3728) : (!llvm.ptr) -> i64
        %3730 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3729, %3730) : (i64, i64) -> ()
      }
      %3731 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3731 : i64
    }
    %3732 = func.call @cc_nil_value() : () -> i64
    %3733 = func.call @cc_errorp(%3523) : (i64) -> i64
    %3734 = arith.cmpi ne, %3733, %3732 : i64
    %3735 = scf.if %3734 -> (i64) {
      scf.yield %3523 : i64
    } else {
      %3736 = llvm.mlir.addressof @str374 : !llvm.ptr
      %3737 = arith.constant 9 : i64
      %3738 = func.call @cc_make_string(%3736, %3737) : (!llvm.ptr, i64) -> i64
      %3739 = func.call @cc_nil_value() : () -> i64
      %3740 = func.call @cc_intern(%3738, %3739) : (i64, i64) -> i64
      %3741 = func.call @cc_nil_value() : () -> i64
      %3742 = func.call @cc_cons(%3740, %3741) : (i64, i64) -> i64
      %3743 = func.call @cc_values_pack(%3742) : (i64) -> i64
      func.call @stack_push_pointer(%3740) : (i64) -> ()
      %3744 = func.call @stack_pop_pointer() : () -> i64
      %3745 = llvm.mlir.addressof @str375 : !llvm.ptr
      %3746 = arith.constant 3 : i64
      %3747 = func.call @cc_make_string(%3745, %3746) : (!llvm.ptr, i64) -> i64
      %3748 = func.call @cc_nil_value() : () -> i64
      %3749 = func.call @cc_intern(%3747, %3748) : (i64, i64) -> i64
      %3750 = func.call @cc_nil_value() : () -> i64
      %3751 = func.call @cc_cons(%3749, %3750) : (i64, i64) -> i64
      %3752 = func.call @cc_values_pack(%3751) : (i64) -> i64
      func.call @stack_push_pointer(%3749) : (i64) -> ()
      %3753 = llvm.mlir.addressof @str376 : !llvm.ptr
      %3754 = arith.constant 3 : i64
      %3755 = func.call @cc_make_string(%3753, %3754) : (!llvm.ptr, i64) -> i64
      %3756 = func.call @cc_nil_value() : () -> i64
      %3757 = func.call @cc_intern(%3755, %3756) : (i64, i64) -> i64
      %3758 = func.call @cc_nil_value() : () -> i64
      %3759 = func.call @cc_cons(%3757, %3758) : (i64, i64) -> i64
      %3760 = func.call @cc_values_pack(%3759) : (i64) -> i64
      func.call @stack_push_pointer(%3757) : (i64) -> ()
      %3761 = llvm.mlir.addressof @str377 : !llvm.ptr
      %3762 = arith.constant 3 : i64
      %3763 = func.call @cc_make_string(%3761, %3762) : (!llvm.ptr, i64) -> i64
      %3764 = func.call @cc_nil_value() : () -> i64
      %3765 = func.call @cc_intern(%3763, %3764) : (i64, i64) -> i64
      %3766 = func.call @cc_nil_value() : () -> i64
      %3767 = func.call @cc_cons(%3765, %3766) : (i64, i64) -> i64
      %3768 = func.call @cc_values_pack(%3767) : (i64) -> i64
      func.call @stack_push_pointer(%3765) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3769 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3770 = arith.constant 5 : i64
      %3771 = func.call @cc_make_string(%3769, %3770) : (!llvm.ptr, i64) -> i64
      %3772 = llvm.mlir.addressof @str379 : !llvm.ptr
      %3773 = arith.constant 11 : i64
      %3774 = func.call @cc_make_string(%3772, %3773) : (!llvm.ptr, i64) -> i64
      %3775 = func.call @cc_intern(%3771, %3774) : (i64, i64) -> i64
      %3776 = func.call @cc_nil_value() : () -> i64
      %3777 = func.call @cc_cons(%3775, %3776) : (i64, i64) -> i64
      %3778 = func.call @cc_values_pack(%3777) : (i64) -> i64
      func.call @stack_push_pointer(%3775) : (i64) -> ()
      %3779 = llvm.mlir.addressof @str380 : !llvm.ptr
      %3780 = arith.constant 1 : i64
      %3781 = func.call @cc_make_string(%3779, %3780) : (!llvm.ptr, i64) -> i64
      %3782 = func.call @cc_nil_value() : () -> i64
      %3783 = func.call @cc_intern(%3781, %3782) : (i64, i64) -> i64
      %3784 = func.call @cc_nil_value() : () -> i64
      %3785 = func.call @cc_cons(%3783, %3784) : (i64, i64) -> i64
      %3786 = func.call @cc_values_pack(%3785) : (i64) -> i64
      %3787 = func.call @cc_symbol_value(%3783) : (i64) -> i64
      func.call @stack_push_pointer(%3787) : (i64) -> ()
      %3788 = llvm.mlir.addressof @str381 : !llvm.ptr
      %3789 = arith.constant 1 : i64
      %3790 = func.call @cc_make_string(%3788, %3789) : (!llvm.ptr, i64) -> i64
      %3791 = func.call @cc_nil_value() : () -> i64
      %3792 = func.call @cc_intern(%3790, %3791) : (i64, i64) -> i64
      %3793 = func.call @cc_nil_value() : () -> i64
      %3794 = func.call @cc_cons(%3792, %3793) : (i64, i64) -> i64
      %3795 = func.call @cc_values_pack(%3794) : (i64) -> i64
      %3796 = func.call @cc_symbol_value(%3792) : (i64) -> i64
      func.call @stack_push_pointer(%3796) : (i64) -> ()
      %3797 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3798 = arith.constant 1 : i64
      %3799 = func.call @cc_make_string(%3797, %3798) : (!llvm.ptr, i64) -> i64
      %3800 = func.call @cc_nil_value() : () -> i64
      %3801 = func.call @cc_intern(%3799, %3800) : (i64, i64) -> i64
      %3802 = func.call @cc_nil_value() : () -> i64
      %3803 = func.call @cc_cons(%3801, %3802) : (i64, i64) -> i64
      %3804 = func.call @cc_values_pack(%3803) : (i64) -> i64
      %3805 = func.call @cc_symbol_value(%3801) : (i64) -> i64
      func.call @stack_push_pointer(%3805) : (i64) -> ()
      %3806 = llvm.mlir.addressof @str383 : !llvm.ptr
      %3807 = arith.constant 1 : i64
      %3808 = func.call @cc_make_string(%3806, %3807) : (!llvm.ptr, i64) -> i64
      %3809 = func.call @cc_nil_value() : () -> i64
      %3810 = func.call @cc_intern(%3808, %3809) : (i64, i64) -> i64
      %3811 = func.call @cc_nil_value() : () -> i64
      %3812 = func.call @cc_cons(%3810, %3811) : (i64, i64) -> i64
      %3813 = func.call @cc_values_pack(%3812) : (i64) -> i64
      %3814 = func.call @cc_symbol_value(%3810) : (i64) -> i64
      func.call @stack_push_pointer(%3814) : (i64) -> ()
      %3815 = llvm.mlir.addressof @str384 : !llvm.ptr
      %3816 = arith.constant 1 : i64
      %3817 = func.call @cc_make_string(%3815, %3816) : (!llvm.ptr, i64) -> i64
      %3818 = func.call @cc_nil_value() : () -> i64
      %3819 = func.call @cc_intern(%3817, %3818) : (i64, i64) -> i64
      %3820 = func.call @cc_nil_value() : () -> i64
      %3821 = func.call @cc_cons(%3819, %3820) : (i64, i64) -> i64
      %3822 = func.call @cc_values_pack(%3821) : (i64) -> i64
      %3823 = func.call @cc_symbol_value(%3819) : (i64) -> i64
      func.call @stack_push_pointer(%3823) : (i64) -> ()
      %3824 = llvm.mlir.addressof @str385 : !llvm.ptr
      %3825 = arith.constant 1 : i64
      %3826 = func.call @cc_make_string(%3824, %3825) : (!llvm.ptr, i64) -> i64
      %3827 = func.call @cc_nil_value() : () -> i64
      %3828 = func.call @cc_intern(%3826, %3827) : (i64, i64) -> i64
      %3829 = func.call @cc_nil_value() : () -> i64
      %3830 = func.call @cc_cons(%3828, %3829) : (i64, i64) -> i64
      %3831 = func.call @cc_values_pack(%3830) : (i64) -> i64
      %3832 = func.call @cc_symbol_value(%3828) : (i64) -> i64
      func.call @stack_push_pointer(%3832) : (i64) -> ()
      %3833 = arith.constant 6 : i64
      %3834 = func.call @cc_box_fixnum(%3833) : (i64) -> i64
      %3835 = func.call @cc_make_vector(%3834) : (i64) -> i64
      %3836 = func.call @stack_pop_pointer() : () -> i64
      %3837 = arith.constant 5 : i64
      %3838 = func.call @cc_box_fixnum(%3837) : (i64) -> i64
      %3839 = func.call @cc_svset(%3835, %3838, %3836) : (i64, i64, i64) -> i64
      %3840 = func.call @stack_pop_pointer() : () -> i64
      %3841 = arith.constant 4 : i64
      %3842 = func.call @cc_box_fixnum(%3841) : (i64) -> i64
      %3843 = func.call @cc_svset(%3835, %3842, %3840) : (i64, i64, i64) -> i64
      %3844 = func.call @stack_pop_pointer() : () -> i64
      %3845 = arith.constant 3 : i64
      %3846 = func.call @cc_box_fixnum(%3845) : (i64) -> i64
      %3847 = func.call @cc_svset(%3835, %3846, %3844) : (i64, i64, i64) -> i64
      %3848 = func.call @stack_pop_pointer() : () -> i64
      %3849 = arith.constant 2 : i64
      %3850 = func.call @cc_box_fixnum(%3849) : (i64) -> i64
      %3851 = func.call @cc_svset(%3835, %3850, %3848) : (i64, i64, i64) -> i64
      %3852 = func.call @stack_pop_pointer() : () -> i64
      %3853 = arith.constant 1 : i64
      %3854 = func.call @cc_box_fixnum(%3853) : (i64) -> i64
      %3855 = func.call @cc_svset(%3835, %3854, %3852) : (i64, i64, i64) -> i64
      %3856 = func.call @stack_pop_pointer() : () -> i64
      %3857 = arith.constant 0 : i64
      %3858 = func.call @cc_box_fixnum(%3857) : (i64) -> i64
      %3859 = func.call @cc_svset(%3835, %3858, %3856) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%3835) : (i64) -> ()
      %3860 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3860) : (i64) -> ()
      %3861 = llvm.mlir.addressof @str386 : !llvm.ptr
      %3862 = arith.constant 12 : i64
      %3863 = func.call @cc_make_string(%3861, %3862) : (!llvm.ptr, i64) -> i64
      %3864 = llvm.mlir.addressof @str387 : !llvm.ptr
      %3865 = arith.constant 11 : i64
      %3866 = func.call @cc_make_string(%3864, %3865) : (!llvm.ptr, i64) -> i64
      %3867 = func.call @cc_intern(%3863, %3866) : (i64, i64) -> i64
      %3868 = func.call @cc_nil_value() : () -> i64
      %3869 = func.call @cc_cons(%3867, %3868) : (i64, i64) -> i64
      %3870 = func.call @cc_values_pack(%3869) : (i64) -> i64
      func.call @stack_push_pointer(%3867) : (i64) -> ()
      %3871 = llvm.mlir.addressof @str388 : !llvm.ptr
      %3872 = arith.constant 1 : i64
      %3873 = func.call @cc_make_string(%3871, %3872) : (!llvm.ptr, i64) -> i64
      %3874 = llvm.mlir.addressof @str389 : !llvm.ptr
      %3875 = arith.constant 11 : i64
      %3876 = func.call @cc_make_string(%3874, %3875) : (!llvm.ptr, i64) -> i64
      %3877 = func.call @cc_intern(%3873, %3876) : (i64, i64) -> i64
      %3878 = func.call @cc_nil_value() : () -> i64
      %3879 = func.call @cc_cons(%3877, %3878) : (i64, i64) -> i64
      %3880 = func.call @cc_values_pack(%3879) : (i64) -> i64
      func.call @stack_push_pointer(%3877) : (i64) -> ()
      %3881 = llvm.mlir.addressof @str390 : !llvm.ptr
      %3882 = arith.constant 1 : i64
      %3883 = func.call @cc_make_string(%3881, %3882) : (!llvm.ptr, i64) -> i64
      %3884 = llvm.mlir.addressof @str391 : !llvm.ptr
      %3885 = arith.constant 11 : i64
      %3886 = func.call @cc_make_string(%3884, %3885) : (!llvm.ptr, i64) -> i64
      %3887 = func.call @cc_intern(%3883, %3886) : (i64, i64) -> i64
      %3888 = func.call @cc_nil_value() : () -> i64
      %3889 = func.call @cc_cons(%3887, %3888) : (i64, i64) -> i64
      %3890 = func.call @cc_values_pack(%3889) : (i64) -> i64
      func.call @stack_push_pointer(%3887) : (i64) -> ()
      %3891 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3891) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3892 = func.call @stack_pop_pointer() : () -> i64
      %3893 = func.call @stack_pop_pointer() : () -> i64
      %3894 = func.call @cc_cons(%3893, %3892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3894) : (i64) -> ()
      %3895 = func.call @stack_pop_pointer() : () -> i64
      %3896 = func.call @stack_pop_pointer() : () -> i64
      %3897 = func.call @cc_cons(%3896, %3895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3897) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3898 = func.call @stack_pop_pointer() : () -> i64
      %3899 = func.call @stack_pop_pointer() : () -> i64
      %3900 = func.call @cc_cons(%3899, %3898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3900) : (i64) -> ()
      %3901 = func.call @stack_pop_pointer() : () -> i64
      %3902 = func.call @stack_pop_pointer() : () -> i64
      %3903 = func.call @cc_cons(%3902, %3901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3903) : (i64) -> ()
      %3904 = func.call @stack_pop_pointer() : () -> i64
      %3905 = func.call @stack_pop_pointer() : () -> i64
      %3906 = func.call @cc_cons(%3905, %3904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3906) : (i64) -> ()
      %3907 = func.call @stack_pop_pointer() : () -> i64
      %3908 = func.call @stack_pop_pointer() : () -> i64
      %3909 = func.call @cc_cons(%3907, %3908) : (i64, i64) -> i64
      %3910 = llvm.mlir.addressof @str392 : !llvm.ptr
      %3911 = arith.constant 5 : i64
      %3912 = func.call @cc_make_string(%3910, %3911) : (!llvm.ptr, i64) -> i64
      %3913 = func.call @cc_nil_value() : () -> i64
      %3914 = func.call @cc_intern(%3912, %3913) : (i64, i64) -> i64
      %3915 = func.call @cc_nil_value() : () -> i64
      %3916 = func.call @cc_cons(%3914, %3915) : (i64, i64) -> i64
      %3917 = func.call @cc_values_pack(%3916) : (i64) -> i64
      %3918 = func.call @cc_cons(%3914, %3909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3918) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3919 = func.call @stack_pop_pointer() : () -> i64
      %3920 = func.call @stack_pop_pointer() : () -> i64
      %3921 = func.call @cc_cons(%3920, %3919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3921) : (i64) -> ()
      %3922 = func.call @stack_pop_pointer() : () -> i64
      %3923 = func.call @stack_pop_pointer() : () -> i64
      %3924 = func.call @cc_cons(%3923, %3922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3924) : (i64) -> ()
      %3925 = func.call @stack_pop_pointer() : () -> i64
      %3926 = func.call @stack_pop_pointer() : () -> i64
      %3927 = func.call @cc_cons(%3926, %3925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3927) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3928 = func.call @stack_pop_pointer() : () -> i64
      %3929 = func.call @stack_pop_pointer() : () -> i64
      %3930 = func.call @cc_cons(%3929, %3928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3930) : (i64) -> ()
      %3931 = func.call @stack_pop_pointer() : () -> i64
      %3932 = func.call @stack_pop_pointer() : () -> i64
      %3933 = func.call @cc_cons(%3932, %3931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3933) : (i64) -> ()
      %3934 = func.call @stack_pop_pointer() : () -> i64
      %3935 = func.call @stack_pop_pointer() : () -> i64
      %3936 = func.call @cc_cons(%3935, %3934) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3936) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3937 = func.call @stack_pop_pointer() : () -> i64
      %3938 = func.call @stack_pop_pointer() : () -> i64
      %3939 = func.call @cc_cons(%3938, %3937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3939) : (i64) -> ()
      %3940 = func.call @stack_pop_pointer() : () -> i64
      %3941 = func.call @stack_pop_pointer() : () -> i64
      %3942 = func.call @cc_cons(%3941, %3940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3942) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3943 = func.call @stack_pop_pointer() : () -> i64
      %3944 = func.call @stack_pop_pointer() : () -> i64
      %3945 = func.call @cc_cons(%3944, %3943) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3945) : (i64) -> ()
      %3946 = func.call @stack_pop_pointer() : () -> i64
      %3947 = func.call @stack_pop_pointer() : () -> i64
      %3948 = func.call @cc_cons(%3947, %3946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3948) : (i64) -> ()
      %3949 = func.call @stack_pop_pointer() : () -> i64
      %4058 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4059 = arith.constant 30 : i64
      %4060 = func.call @cc_make_symbol(%4058, %4059) : (!llvm.ptr, i64) -> i64
      %4061 = func.call @cc_persistent_root_value(%4060) : (i64) -> i64
      func.call @stack_push_pointer(%4061) : (i64) -> ()
      %4062 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4063 = arith.constant 30 : i64
      %4064 = func.call @cc_make_symbol(%4062, %4063) : (!llvm.ptr, i64) -> i64
      %4065 = func.call @cc_persistent_root_value(%4064) : (i64) -> i64
      func.call @stack_push_pointer(%4065) : (i64) -> ()
      %4066 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4067 = arith.constant 30 : i64
      %4068 = func.call @cc_make_symbol(%4066, %4067) : (!llvm.ptr, i64) -> i64
      %4069 = func.call @cc_persistent_root_value(%4068) : (i64) -> i64
      func.call @stack_push_pointer(%4069) : (i64) -> ()
      %4070 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4071 = arith.constant 30 : i64
      %4072 = func.call @cc_make_symbol(%4070, %4071) : (!llvm.ptr, i64) -> i64
      %4073 = func.call @cc_persistent_root_value(%4072) : (i64) -> i64
      func.call @stack_push_pointer(%4073) : (i64) -> ()
      %4074 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4075 = arith.constant 30 : i64
      %4076 = func.call @cc_make_symbol(%4074, %4075) : (!llvm.ptr, i64) -> i64
      %4077 = func.call @cc_persistent_root_value(%4076) : (i64) -> i64
      func.call @stack_push_pointer(%4077) : (i64) -> ()
      %4078 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4079 = arith.constant 30 : i64
      %4080 = func.call @cc_make_symbol(%4078, %4079) : (!llvm.ptr, i64) -> i64
      %4081 = func.call @cc_persistent_root_value(%4080) : (i64) -> i64
      func.call @stack_push_pointer(%4081) : (i64) -> ()
      %4082 = arith.constant 206494159077389 : i64
      %4083 = arith.constant 6 : i64
      %4084 = func.call @cc_make_closure(%4082, %4083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4084) : (i64) -> ()
      %4085 = func.call @stack_pop_pointer() : () -> i64
      %4086 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4087 = arith.constant 1 : i64
      %4088 = func.call @cc_make_string(%4086, %4087) : (!llvm.ptr, i64) -> i64
      %4089 = func.call @cc_nil_value() : () -> i64
      %4090 = func.call @cc_intern(%4088, %4089) : (i64, i64) -> i64
      %4091 = func.call @cc_nil_value() : () -> i64
      %4092 = func.call @cc_cons(%4090, %4091) : (i64, i64) -> i64
      %4093 = func.call @cc_values_pack(%4092) : (i64) -> i64
      func.call @stack_push_pointer(%4090) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4094 = func.call @stack_pop_pointer() : () -> i64
      %4095 = func.call @stack_pop_pointer() : () -> i64
      %4096 = func.call @cc_cons(%4095, %4094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4096) : (i64) -> ()
      %4097 = func.call @stack_pop_pointer() : () -> i64
      %4098 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4099 = arith.constant 11 : i64
      %4100 = func.call @cc_make_string(%4098, %4099) : (!llvm.ptr, i64) -> i64
      %4101 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4102 = arith.constant 7 : i64
      %4103 = func.call @cc_make_string(%4101, %4102) : (!llvm.ptr, i64) -> i64
      %4104 = func.call @cc_intern(%4100, %4103) : (i64, i64) -> i64
      %4105 = func.call @cc_nil_value() : () -> i64
      %4106 = func.call @cc_cons(%4104, %4105) : (i64, i64) -> i64
      %4107 = func.call @cc_values_pack(%4106) : (i64) -> i64
      func.call @stack_push_pointer(%4104) : (i64) -> ()
      %4108 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4109 = func.call @stack_pop_pointer() : () -> i64
      %4110 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4111 = arith.constant 4 : i64
      %4112 = func.call @cc_make_string(%4110, %4111) : (!llvm.ptr, i64) -> i64
      %4113 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4114 = arith.constant 7 : i64
      %4115 = func.call @cc_make_string(%4113, %4114) : (!llvm.ptr, i64) -> i64
      %4116 = func.call @cc_intern(%4112, %4115) : (i64, i64) -> i64
      %4117 = func.call @cc_nil_value() : () -> i64
      %4118 = func.call @cc_cons(%4116, %4117) : (i64, i64) -> i64
      %4119 = func.call @cc_values_pack(%4118) : (i64) -> i64
      func.call @stack_push_pointer(%4116) : (i64) -> ()
      %4120 = func.call @stack_pop_pointer() : () -> i64
      %4121 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4122 = arith.constant 6 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = func.call @cc_nil_value() : () -> i64
      %4125 = func.call @cc_intern(%4123, %4124) : (i64, i64) -> i64
      %4126 = func.call @cc_nil_value() : () -> i64
      %4127 = func.call @cc_cons(%4125, %4126) : (i64, i64) -> i64
      %4128 = func.call @cc_values_pack(%4127) : (i64) -> i64
      func.call @stack_push_pointer(%4125) : (i64) -> ()
      %4129 = func.call @stack_pop_pointer() : () -> i64
      %4130 = func.call @cc_nil_value() : () -> i64
      %4131 = func.call @cc_errorp(%3744) : (i64) -> i64
      %4132 = arith.cmpi ne, %4131, %4130 : i64
      %4133 = arith.cmpi eq, %4130, %4130 : i64
      %4134 = arith.andi %4132, %4133 : i1
      %4135 = scf.if %4134 -> (i64) {
        scf.yield %3744 : i64
      } else {
        scf.yield %4130 : i64
      }
      %4136 = func.call @cc_errorp(%3949) : (i64) -> i64
      %4137 = arith.cmpi ne, %4136, %4130 : i64
      %4138 = arith.cmpi eq, %4135, %4130 : i64
      %4139 = arith.andi %4137, %4138 : i1
      %4140 = scf.if %4139 -> (i64) {
        scf.yield %3949 : i64
      } else {
        scf.yield %4135 : i64
      }
      %4141 = func.call @cc_errorp(%4085) : (i64) -> i64
      %4142 = arith.cmpi ne, %4141, %4130 : i64
      %4143 = arith.cmpi eq, %4140, %4130 : i64
      %4144 = arith.andi %4142, %4143 : i1
      %4145 = scf.if %4144 -> (i64) {
        scf.yield %4085 : i64
      } else {
        scf.yield %4140 : i64
      }
      %4146 = func.call @cc_errorp(%4097) : (i64) -> i64
      %4147 = arith.cmpi ne, %4146, %4130 : i64
      %4148 = arith.cmpi eq, %4145, %4130 : i64
      %4149 = arith.andi %4147, %4148 : i1
      %4150 = scf.if %4149 -> (i64) {
        scf.yield %4097 : i64
      } else {
        scf.yield %4145 : i64
      }
      %4151 = func.call @cc_errorp(%4108) : (i64) -> i64
      %4152 = arith.cmpi ne, %4151, %4130 : i64
      %4153 = arith.cmpi eq, %4150, %4130 : i64
      %4154 = arith.andi %4152, %4153 : i1
      %4155 = scf.if %4154 -> (i64) {
        scf.yield %4108 : i64
      } else {
        scf.yield %4150 : i64
      }
      %4156 = func.call @cc_errorp(%4109) : (i64) -> i64
      %4157 = arith.cmpi ne, %4156, %4130 : i64
      %4158 = arith.cmpi eq, %4155, %4130 : i64
      %4159 = arith.andi %4157, %4158 : i1
      %4160 = scf.if %4159 -> (i64) {
        scf.yield %4109 : i64
      } else {
        scf.yield %4155 : i64
      }
      %4161 = func.call @cc_errorp(%4120) : (i64) -> i64
      %4162 = arith.cmpi ne, %4161, %4130 : i64
      %4163 = arith.cmpi eq, %4160, %4130 : i64
      %4164 = arith.andi %4162, %4163 : i1
      %4165 = scf.if %4164 -> (i64) {
        scf.yield %4120 : i64
      } else {
        scf.yield %4160 : i64
      }
      %4166 = func.call @cc_errorp(%4129) : (i64) -> i64
      %4167 = arith.cmpi ne, %4166, %4130 : i64
      %4168 = arith.cmpi eq, %4165, %4130 : i64
      %4169 = arith.andi %4167, %4168 : i1
      %4170 = scf.if %4169 -> (i64) {
        scf.yield %4129 : i64
      } else {
        scf.yield %4165 : i64
      }
      %4171 = arith.cmpi ne, %4170, %4130 : i64
      scf.if %4171 {
        func.call @stack_push_pointer(%4170) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3744) : (i64) -> ()
        func.call @stack_push_pointer(%3949) : (i64) -> ()
        func.call @stack_push_pointer(%4085) : (i64) -> ()
        func.call @stack_push_pointer(%4097) : (i64) -> ()
        func.call @stack_push_pointer(%4108) : (i64) -> ()
        func.call @stack_push_pointer(%4109) : (i64) -> ()
        func.call @stack_push_pointer(%4120) : (i64) -> ()
        func.call @stack_push_pointer(%4129) : (i64) -> ()
        %4172 = llvm.mlir.addressof @str411 : !llvm.ptr
        %4173 = func.call @cc_make_function_ref_const(%4172) : (!llvm.ptr) -> i64
        %4174 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4173, %4174) : (i64, i64) -> ()
      }
      %4175 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4175 : i64
    }
    %4176 = func.call @cc_nil_value() : () -> i64
    %4177 = func.call @cc_errorp(%3735) : (i64) -> i64
    %4178 = arith.cmpi ne, %4177, %4176 : i64
    %4179 = scf.if %4178 -> (i64) {
      scf.yield %3735 : i64
    } else {
      %4180 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4181 = arith.constant 18 : i64
      %4182 = func.call @cc_make_string(%4180, %4181) : (!llvm.ptr, i64) -> i64
      %4183 = func.call @cc_nil_value() : () -> i64
      %4184 = func.call @cc_intern(%4182, %4183) : (i64, i64) -> i64
      %4185 = func.call @cc_nil_value() : () -> i64
      %4186 = func.call @cc_cons(%4184, %4185) : (i64, i64) -> i64
      %4187 = func.call @cc_values_pack(%4186) : (i64) -> i64
      func.call @stack_push_pointer(%4184) : (i64) -> ()
      %4188 = func.call @stack_pop_pointer() : () -> i64
      %4189 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4190 = arith.constant 3 : i64
      %4191 = func.call @cc_make_string(%4189, %4190) : (!llvm.ptr, i64) -> i64
      %4192 = func.call @cc_nil_value() : () -> i64
      %4193 = func.call @cc_intern(%4191, %4192) : (i64, i64) -> i64
      %4194 = func.call @cc_nil_value() : () -> i64
      %4195 = func.call @cc_cons(%4193, %4194) : (i64, i64) -> i64
      %4196 = func.call @cc_values_pack(%4195) : (i64) -> i64
      func.call @stack_push_pointer(%4193) : (i64) -> ()
      %4197 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4198 = arith.constant 3 : i64
      %4199 = func.call @cc_make_string(%4197, %4198) : (!llvm.ptr, i64) -> i64
      %4200 = func.call @cc_nil_value() : () -> i64
      %4201 = func.call @cc_intern(%4199, %4200) : (i64, i64) -> i64
      %4202 = func.call @cc_nil_value() : () -> i64
      %4203 = func.call @cc_cons(%4201, %4202) : (i64, i64) -> i64
      %4204 = func.call @cc_values_pack(%4203) : (i64) -> i64
      func.call @stack_push_pointer(%4201) : (i64) -> ()
      %4205 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4206 = arith.constant 19 : i64
      %4207 = func.call @cc_make_string(%4205, %4206) : (!llvm.ptr, i64) -> i64
      %4208 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4209 = arith.constant 11 : i64
      %4210 = func.call @cc_make_string(%4208, %4209) : (!llvm.ptr, i64) -> i64
      %4211 = func.call @cc_intern(%4207, %4210) : (i64, i64) -> i64
      %4212 = func.call @cc_nil_value() : () -> i64
      %4213 = func.call @cc_cons(%4211, %4212) : (i64, i64) -> i64
      %4214 = func.call @cc_values_pack(%4213) : (i64) -> i64
      func.call @stack_push_pointer(%4211) : (i64) -> ()
      %4215 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4216 = arith.constant 2 : i64
      %4217 = func.call @cc_make_string(%4215, %4216) : (!llvm.ptr, i64) -> i64
      %4218 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4219 = arith.constant 11 : i64
      %4220 = func.call @cc_make_string(%4218, %4219) : (!llvm.ptr, i64) -> i64
      %4221 = func.call @cc_intern(%4217, %4220) : (i64, i64) -> i64
      %4222 = func.call @cc_nil_value() : () -> i64
      %4223 = func.call @cc_cons(%4221, %4222) : (i64, i64) -> i64
      %4224 = func.call @cc_values_pack(%4223) : (i64) -> i64
      func.call @stack_push_pointer(%4221) : (i64) -> ()
      %4225 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4226 = arith.constant 2 : i64
      %4227 = func.call @cc_make_string(%4225, %4226) : (!llvm.ptr, i64) -> i64
      %4228 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4229 = arith.constant 11 : i64
      %4230 = func.call @cc_make_string(%4228, %4229) : (!llvm.ptr, i64) -> i64
      %4231 = func.call @cc_intern(%4227, %4230) : (i64, i64) -> i64
      %4232 = func.call @cc_nil_value() : () -> i64
      %4233 = func.call @cc_cons(%4231, %4232) : (i64, i64) -> i64
      %4234 = func.call @cc_values_pack(%4233) : (i64) -> i64
      func.call @stack_push_pointer(%4231) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4235 = func.call @stack_pop_pointer() : () -> i64
      %4236 = func.call @stack_pop_pointer() : () -> i64
      %4237 = func.call @cc_cons(%4236, %4235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4237) : (i64) -> ()
      %4238 = func.call @stack_pop_pointer() : () -> i64
      %4239 = func.call @stack_pop_pointer() : () -> i64
      %4240 = func.call @cc_cons(%4239, %4238) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4240) : (i64) -> ()
      %4241 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4242 = arith.constant 8 : i64
      %4243 = func.call @cc_make_string(%4241, %4242) : (!llvm.ptr, i64) -> i64
      %4244 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4245 = arith.constant 11 : i64
      %4246 = func.call @cc_make_string(%4244, %4245) : (!llvm.ptr, i64) -> i64
      %4247 = func.call @cc_intern(%4243, %4246) : (i64, i64) -> i64
      %4248 = func.call @cc_nil_value() : () -> i64
      %4249 = func.call @cc_cons(%4247, %4248) : (i64, i64) -> i64
      %4250 = func.call @cc_values_pack(%4249) : (i64) -> i64
      func.call @stack_push_pointer(%4247) : (i64) -> ()
      %4251 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4251) : (i64) -> ()
      %4252 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4253 = arith.constant 6 : i64
      %4254 = func.call @cc_make_string(%4252, %4253) : (!llvm.ptr, i64) -> i64
      %4255 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4256 = arith.constant 11 : i64
      %4257 = func.call @cc_make_string(%4255, %4256) : (!llvm.ptr, i64) -> i64
      %4258 = func.call @cc_intern(%4254, %4257) : (i64, i64) -> i64
      %4259 = func.call @cc_nil_value() : () -> i64
      %4260 = func.call @cc_cons(%4258, %4259) : (i64, i64) -> i64
      %4261 = func.call @cc_values_pack(%4260) : (i64) -> i64
      func.call @stack_push_pointer(%4258) : (i64) -> ()
      %4262 = func.call @stack_pop_pointer() : () -> i64
      %4263 = func.call @stack_pop_pointer() : () -> i64
      %4264 = func.call @cc_cons(%4262, %4263) : (i64, i64) -> i64
      %4265 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4266 = arith.constant 5 : i64
      %4267 = func.call @cc_make_string(%4265, %4266) : (!llvm.ptr, i64) -> i64
      %4268 = func.call @cc_nil_value() : () -> i64
      %4269 = func.call @cc_intern(%4267, %4268) : (i64, i64) -> i64
      %4270 = func.call @cc_nil_value() : () -> i64
      %4271 = func.call @cc_cons(%4269, %4270) : (i64, i64) -> i64
      %4272 = func.call @cc_values_pack(%4271) : (i64) -> i64
      %4273 = func.call @cc_cons(%4269, %4264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4273) : (i64) -> ()
      %4274 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4275 = arith.constant 10 : i64
      %4276 = func.call @cc_make_string(%4274, %4275) : (!llvm.ptr, i64) -> i64
      %4277 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4278 = arith.constant 11 : i64
      %4279 = func.call @cc_make_string(%4277, %4278) : (!llvm.ptr, i64) -> i64
      %4280 = func.call @cc_intern(%4276, %4279) : (i64, i64) -> i64
      %4281 = func.call @cc_nil_value() : () -> i64
      %4282 = func.call @cc_cons(%4280, %4281) : (i64, i64) -> i64
      %4283 = func.call @cc_values_pack(%4282) : (i64) -> i64
      func.call @stack_push_pointer(%4280) : (i64) -> ()
      %4284 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4284) : (i64) -> ()
      %4285 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4286 = arith.constant 6 : i64
      %4287 = func.call @cc_make_string(%4285, %4286) : (!llvm.ptr, i64) -> i64
      %4288 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4289 = arith.constant 11 : i64
      %4290 = func.call @cc_make_string(%4288, %4289) : (!llvm.ptr, i64) -> i64
      %4291 = func.call @cc_intern(%4287, %4290) : (i64, i64) -> i64
      %4292 = func.call @cc_nil_value() : () -> i64
      %4293 = func.call @cc_cons(%4291, %4292) : (i64, i64) -> i64
      %4294 = func.call @cc_values_pack(%4293) : (i64) -> i64
      func.call @stack_push_pointer(%4291) : (i64) -> ()
      %4295 = func.call @stack_pop_pointer() : () -> i64
      %4296 = func.call @stack_pop_pointer() : () -> i64
      %4297 = func.call @cc_cons(%4295, %4296) : (i64, i64) -> i64
      %4298 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4299 = arith.constant 5 : i64
      %4300 = func.call @cc_make_string(%4298, %4299) : (!llvm.ptr, i64) -> i64
      %4301 = func.call @cc_nil_value() : () -> i64
      %4302 = func.call @cc_intern(%4300, %4301) : (i64, i64) -> i64
      %4303 = func.call @cc_nil_value() : () -> i64
      %4304 = func.call @cc_cons(%4302, %4303) : (i64, i64) -> i64
      %4305 = func.call @cc_values_pack(%4304) : (i64) -> i64
      %4306 = func.call @cc_cons(%4302, %4297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4306) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4307 = func.call @stack_pop_pointer() : () -> i64
      %4308 = func.call @stack_pop_pointer() : () -> i64
      %4309 = func.call @cc_cons(%4308, %4307) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4309) : (i64) -> ()
      %4310 = func.call @stack_pop_pointer() : () -> i64
      %4311 = func.call @stack_pop_pointer() : () -> i64
      %4312 = func.call @cc_cons(%4311, %4310) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4312) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4313 = func.call @stack_pop_pointer() : () -> i64
      %4314 = func.call @stack_pop_pointer() : () -> i64
      %4315 = func.call @cc_cons(%4314, %4313) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4315) : (i64) -> ()
      %4316 = func.call @stack_pop_pointer() : () -> i64
      %4317 = func.call @stack_pop_pointer() : () -> i64
      %4318 = func.call @cc_cons(%4317, %4316) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4318) : (i64) -> ()
      %4319 = func.call @stack_pop_pointer() : () -> i64
      %4320 = func.call @stack_pop_pointer() : () -> i64
      %4321 = func.call @cc_cons(%4320, %4319) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4321) : (i64) -> ()
      %4322 = llvm.mlir.addressof @str431 : !llvm.ptr
      %4323 = arith.constant 3 : i64
      %4324 = func.call @cc_make_string(%4322, %4323) : (!llvm.ptr, i64) -> i64
      %4325 = llvm.mlir.addressof @str432 : !llvm.ptr
      %4326 = arith.constant 11 : i64
      %4327 = func.call @cc_make_string(%4325, %4326) : (!llvm.ptr, i64) -> i64
      %4328 = func.call @cc_intern(%4324, %4327) : (i64, i64) -> i64
      %4329 = func.call @cc_nil_value() : () -> i64
      %4330 = func.call @cc_cons(%4328, %4329) : (i64, i64) -> i64
      %4331 = func.call @cc_values_pack(%4330) : (i64) -> i64
      func.call @stack_push_pointer(%4328) : (i64) -> ()
      %4332 = llvm.mlir.addressof @str433 : !llvm.ptr
      %4333 = arith.constant 2 : i64
      %4334 = func.call @cc_make_string(%4332, %4333) : (!llvm.ptr, i64) -> i64
      %4335 = llvm.mlir.addressof @str434 : !llvm.ptr
      %4336 = arith.constant 11 : i64
      %4337 = func.call @cc_make_string(%4335, %4336) : (!llvm.ptr, i64) -> i64
      %4338 = func.call @cc_intern(%4334, %4337) : (i64, i64) -> i64
      %4339 = func.call @cc_nil_value() : () -> i64
      %4340 = func.call @cc_cons(%4338, %4339) : (i64, i64) -> i64
      %4341 = func.call @cc_values_pack(%4340) : (i64) -> i64
      func.call @stack_push_pointer(%4338) : (i64) -> ()
      %4342 = llvm.mlir.addressof @str435 : !llvm.ptr
      %4343 = arith.constant 2 : i64
      %4344 = func.call @cc_make_string(%4342, %4343) : (!llvm.ptr, i64) -> i64
      %4345 = llvm.mlir.addressof @str436 : !llvm.ptr
      %4346 = arith.constant 11 : i64
      %4347 = func.call @cc_make_string(%4345, %4346) : (!llvm.ptr, i64) -> i64
      %4348 = func.call @cc_intern(%4344, %4347) : (i64, i64) -> i64
      %4349 = func.call @cc_nil_value() : () -> i64
      %4350 = func.call @cc_cons(%4348, %4349) : (i64, i64) -> i64
      %4351 = func.call @cc_values_pack(%4350) : (i64) -> i64
      func.call @stack_push_pointer(%4348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4352 = func.call @stack_pop_pointer() : () -> i64
      %4353 = func.call @stack_pop_pointer() : () -> i64
      %4354 = func.call @cc_cons(%4353, %4352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4354) : (i64) -> ()
      %4355 = func.call @stack_pop_pointer() : () -> i64
      %4356 = func.call @stack_pop_pointer() : () -> i64
      %4357 = func.call @cc_cons(%4356, %4355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4357) : (i64) -> ()
      %4358 = func.call @stack_pop_pointer() : () -> i64
      %4359 = func.call @stack_pop_pointer() : () -> i64
      %4360 = func.call @cc_cons(%4359, %4358) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4360) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4361 = func.call @stack_pop_pointer() : () -> i64
      %4362 = func.call @stack_pop_pointer() : () -> i64
      %4363 = func.call @cc_cons(%4362, %4361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4363) : (i64) -> ()
      %4364 = func.call @stack_pop_pointer() : () -> i64
      %4365 = func.call @stack_pop_pointer() : () -> i64
      %4366 = func.call @cc_cons(%4365, %4364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4366) : (i64) -> ()
      %4367 = func.call @stack_pop_pointer() : () -> i64
      %4368 = func.call @stack_pop_pointer() : () -> i64
      %4369 = func.call @cc_cons(%4368, %4367) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4369) : (i64) -> ()
      %4370 = func.call @stack_pop_pointer() : () -> i64
      %4371 = func.call @stack_pop_pointer() : () -> i64
      %4372 = func.call @cc_cons(%4371, %4370) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4372) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4373 = func.call @stack_pop_pointer() : () -> i64
      %4374 = func.call @stack_pop_pointer() : () -> i64
      %4375 = func.call @cc_cons(%4374, %4373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4375) : (i64) -> ()
      %4376 = func.call @stack_pop_pointer() : () -> i64
      %4377 = func.call @stack_pop_pointer() : () -> i64
      %4378 = func.call @cc_cons(%4377, %4376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4378) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4379 = func.call @stack_pop_pointer() : () -> i64
      %4380 = func.call @stack_pop_pointer() : () -> i64
      %4381 = func.call @cc_cons(%4380, %4379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4381) : (i64) -> ()
      %4382 = func.call @stack_pop_pointer() : () -> i64
      %4383 = func.call @stack_pop_pointer() : () -> i64
      %4384 = func.call @cc_cons(%4383, %4382) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4384) : (i64) -> ()
      %4385 = func.call @stack_pop_pointer() : () -> i64
      %4448 = arith.constant 206494159077396 : i64
      %4449 = arith.constant 0 : i64
      %4450 = func.call @cc_make_closure(%4448, %4449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4450) : (i64) -> ()
      %4451 = func.call @stack_pop_pointer() : () -> i64
      %4452 = llvm.mlir.addressof @str442 : !llvm.ptr
      %4453 = arith.constant 1 : i64
      %4454 = func.call @cc_make_string(%4452, %4453) : (!llvm.ptr, i64) -> i64
      %4455 = func.call @cc_nil_value() : () -> i64
      %4456 = func.call @cc_intern(%4454, %4455) : (i64, i64) -> i64
      %4457 = func.call @cc_nil_value() : () -> i64
      %4458 = func.call @cc_cons(%4456, %4457) : (i64, i64) -> i64
      %4459 = func.call @cc_values_pack(%4458) : (i64) -> i64
      func.call @stack_push_pointer(%4456) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4460 = func.call @stack_pop_pointer() : () -> i64
      %4461 = func.call @stack_pop_pointer() : () -> i64
      %4462 = func.call @cc_cons(%4461, %4460) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4462) : (i64) -> ()
      %4463 = func.call @stack_pop_pointer() : () -> i64
      %4464 = llvm.mlir.addressof @str443 : !llvm.ptr
      %4465 = arith.constant 11 : i64
      %4466 = func.call @cc_make_string(%4464, %4465) : (!llvm.ptr, i64) -> i64
      %4467 = llvm.mlir.addressof @str444 : !llvm.ptr
      %4468 = arith.constant 7 : i64
      %4469 = func.call @cc_make_string(%4467, %4468) : (!llvm.ptr, i64) -> i64
      %4470 = func.call @cc_intern(%4466, %4469) : (i64, i64) -> i64
      %4471 = func.call @cc_nil_value() : () -> i64
      %4472 = func.call @cc_cons(%4470, %4471) : (i64, i64) -> i64
      %4473 = func.call @cc_values_pack(%4472) : (i64) -> i64
      func.call @stack_push_pointer(%4470) : (i64) -> ()
      %4474 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4475 = func.call @stack_pop_pointer() : () -> i64
      %4476 = llvm.mlir.addressof @str445 : !llvm.ptr
      %4477 = arith.constant 4 : i64
      %4478 = func.call @cc_make_string(%4476, %4477) : (!llvm.ptr, i64) -> i64
      %4479 = llvm.mlir.addressof @str446 : !llvm.ptr
      %4480 = arith.constant 7 : i64
      %4481 = func.call @cc_make_string(%4479, %4480) : (!llvm.ptr, i64) -> i64
      %4482 = func.call @cc_intern(%4478, %4481) : (i64, i64) -> i64
      %4483 = func.call @cc_nil_value() : () -> i64
      %4484 = func.call @cc_cons(%4482, %4483) : (i64, i64) -> i64
      %4485 = func.call @cc_values_pack(%4484) : (i64) -> i64
      func.call @stack_push_pointer(%4482) : (i64) -> ()
      %4486 = func.call @stack_pop_pointer() : () -> i64
      %4487 = llvm.mlir.addressof @str447 : !llvm.ptr
      %4488 = arith.constant 6 : i64
      %4489 = func.call @cc_make_string(%4487, %4488) : (!llvm.ptr, i64) -> i64
      %4490 = func.call @cc_nil_value() : () -> i64
      %4491 = func.call @cc_intern(%4489, %4490) : (i64, i64) -> i64
      %4492 = func.call @cc_nil_value() : () -> i64
      %4493 = func.call @cc_cons(%4491, %4492) : (i64, i64) -> i64
      %4494 = func.call @cc_values_pack(%4493) : (i64) -> i64
      func.call @stack_push_pointer(%4491) : (i64) -> ()
      %4495 = func.call @stack_pop_pointer() : () -> i64
      %4496 = func.call @cc_nil_value() : () -> i64
      %4497 = func.call @cc_errorp(%4188) : (i64) -> i64
      %4498 = arith.cmpi ne, %4497, %4496 : i64
      %4499 = arith.cmpi eq, %4496, %4496 : i64
      %4500 = arith.andi %4498, %4499 : i1
      %4501 = scf.if %4500 -> (i64) {
        scf.yield %4188 : i64
      } else {
        scf.yield %4496 : i64
      }
      %4502 = func.call @cc_errorp(%4385) : (i64) -> i64
      %4503 = arith.cmpi ne, %4502, %4496 : i64
      %4504 = arith.cmpi eq, %4501, %4496 : i64
      %4505 = arith.andi %4503, %4504 : i1
      %4506 = scf.if %4505 -> (i64) {
        scf.yield %4385 : i64
      } else {
        scf.yield %4501 : i64
      }
      %4507 = func.call @cc_errorp(%4451) : (i64) -> i64
      %4508 = arith.cmpi ne, %4507, %4496 : i64
      %4509 = arith.cmpi eq, %4506, %4496 : i64
      %4510 = arith.andi %4508, %4509 : i1
      %4511 = scf.if %4510 -> (i64) {
        scf.yield %4451 : i64
      } else {
        scf.yield %4506 : i64
      }
      %4512 = func.call @cc_errorp(%4463) : (i64) -> i64
      %4513 = arith.cmpi ne, %4512, %4496 : i64
      %4514 = arith.cmpi eq, %4511, %4496 : i64
      %4515 = arith.andi %4513, %4514 : i1
      %4516 = scf.if %4515 -> (i64) {
        scf.yield %4463 : i64
      } else {
        scf.yield %4511 : i64
      }
      %4517 = func.call @cc_errorp(%4474) : (i64) -> i64
      %4518 = arith.cmpi ne, %4517, %4496 : i64
      %4519 = arith.cmpi eq, %4516, %4496 : i64
      %4520 = arith.andi %4518, %4519 : i1
      %4521 = scf.if %4520 -> (i64) {
        scf.yield %4474 : i64
      } else {
        scf.yield %4516 : i64
      }
      %4522 = func.call @cc_errorp(%4475) : (i64) -> i64
      %4523 = arith.cmpi ne, %4522, %4496 : i64
      %4524 = arith.cmpi eq, %4521, %4496 : i64
      %4525 = arith.andi %4523, %4524 : i1
      %4526 = scf.if %4525 -> (i64) {
        scf.yield %4475 : i64
      } else {
        scf.yield %4521 : i64
      }
      %4527 = func.call @cc_errorp(%4486) : (i64) -> i64
      %4528 = arith.cmpi ne, %4527, %4496 : i64
      %4529 = arith.cmpi eq, %4526, %4496 : i64
      %4530 = arith.andi %4528, %4529 : i1
      %4531 = scf.if %4530 -> (i64) {
        scf.yield %4486 : i64
      } else {
        scf.yield %4526 : i64
      }
      %4532 = func.call @cc_errorp(%4495) : (i64) -> i64
      %4533 = arith.cmpi ne, %4532, %4496 : i64
      %4534 = arith.cmpi eq, %4531, %4496 : i64
      %4535 = arith.andi %4533, %4534 : i1
      %4536 = scf.if %4535 -> (i64) {
        scf.yield %4495 : i64
      } else {
        scf.yield %4531 : i64
      }
      %4537 = arith.cmpi ne, %4536, %4496 : i64
      scf.if %4537 {
        func.call @stack_push_pointer(%4536) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4188) : (i64) -> ()
        func.call @stack_push_pointer(%4385) : (i64) -> ()
        func.call @stack_push_pointer(%4451) : (i64) -> ()
        func.call @stack_push_pointer(%4463) : (i64) -> ()
        func.call @stack_push_pointer(%4474) : (i64) -> ()
        func.call @stack_push_pointer(%4475) : (i64) -> ()
        func.call @stack_push_pointer(%4486) : (i64) -> ()
        func.call @stack_push_pointer(%4495) : (i64) -> ()
        %4538 = llvm.mlir.addressof @str448 : !llvm.ptr
        %4539 = func.call @cc_make_function_ref_const(%4538) : (!llvm.ptr) -> i64
        %4540 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4539, %4540) : (i64, i64) -> ()
      }
      %4541 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4541 : i64
    }
    %4542 = func.call @cc_nil_value() : () -> i64
    %4543 = func.call @cc_errorp(%4179) : (i64) -> i64
    %4544 = arith.cmpi ne, %4543, %4542 : i64
    %4545 = scf.if %4544 -> (i64) {
      scf.yield %4179 : i64
    } else {
      %4546 = llvm.mlir.addressof @str449 : !llvm.ptr
      %4547 = arith.constant 18 : i64
      %4548 = func.call @cc_make_string(%4546, %4547) : (!llvm.ptr, i64) -> i64
      %4549 = func.call @cc_nil_value() : () -> i64
      %4550 = func.call @cc_intern(%4548, %4549) : (i64, i64) -> i64
      %4551 = func.call @cc_nil_value() : () -> i64
      %4552 = func.call @cc_cons(%4550, %4551) : (i64, i64) -> i64
      %4553 = func.call @cc_values_pack(%4552) : (i64) -> i64
      func.call @stack_push_pointer(%4550) : (i64) -> ()
      %4554 = func.call @stack_pop_pointer() : () -> i64
      %4555 = llvm.mlir.addressof @str450 : !llvm.ptr
      %4556 = arith.constant 3 : i64
      %4557 = func.call @cc_make_string(%4555, %4556) : (!llvm.ptr, i64) -> i64
      %4558 = func.call @cc_nil_value() : () -> i64
      %4559 = func.call @cc_intern(%4557, %4558) : (i64, i64) -> i64
      %4560 = func.call @cc_nil_value() : () -> i64
      %4561 = func.call @cc_cons(%4559, %4560) : (i64, i64) -> i64
      %4562 = func.call @cc_values_pack(%4561) : (i64) -> i64
      func.call @stack_push_pointer(%4559) : (i64) -> ()
      %4563 = llvm.mlir.addressof @str451 : !llvm.ptr
      %4564 = arith.constant 3 : i64
      %4565 = func.call @cc_make_string(%4563, %4564) : (!llvm.ptr, i64) -> i64
      %4566 = func.call @cc_nil_value() : () -> i64
      %4567 = func.call @cc_intern(%4565, %4566) : (i64, i64) -> i64
      %4568 = func.call @cc_nil_value() : () -> i64
      %4569 = func.call @cc_cons(%4567, %4568) : (i64, i64) -> i64
      %4570 = func.call @cc_values_pack(%4569) : (i64) -> i64
      func.call @stack_push_pointer(%4567) : (i64) -> ()
      %4571 = llvm.mlir.addressof @str452 : !llvm.ptr
      %4572 = arith.constant 19 : i64
      %4573 = func.call @cc_make_string(%4571, %4572) : (!llvm.ptr, i64) -> i64
      %4574 = llvm.mlir.addressof @str453 : !llvm.ptr
      %4575 = arith.constant 11 : i64
      %4576 = func.call @cc_make_string(%4574, %4575) : (!llvm.ptr, i64) -> i64
      %4577 = func.call @cc_intern(%4573, %4576) : (i64, i64) -> i64
      %4578 = func.call @cc_nil_value() : () -> i64
      %4579 = func.call @cc_cons(%4577, %4578) : (i64, i64) -> i64
      %4580 = func.call @cc_values_pack(%4579) : (i64) -> i64
      func.call @stack_push_pointer(%4577) : (i64) -> ()
      %4581 = llvm.mlir.addressof @str454 : !llvm.ptr
      %4582 = arith.constant 2 : i64
      %4583 = func.call @cc_make_string(%4581, %4582) : (!llvm.ptr, i64) -> i64
      %4584 = llvm.mlir.addressof @str455 : !llvm.ptr
      %4585 = arith.constant 11 : i64
      %4586 = func.call @cc_make_string(%4584, %4585) : (!llvm.ptr, i64) -> i64
      %4587 = func.call @cc_intern(%4583, %4586) : (i64, i64) -> i64
      %4588 = func.call @cc_nil_value() : () -> i64
      %4589 = func.call @cc_cons(%4587, %4588) : (i64, i64) -> i64
      %4590 = func.call @cc_values_pack(%4589) : (i64) -> i64
      func.call @stack_push_pointer(%4587) : (i64) -> ()
      %4591 = llvm.mlir.addressof @str456 : !llvm.ptr
      %4592 = arith.constant 2 : i64
      %4593 = func.call @cc_make_string(%4591, %4592) : (!llvm.ptr, i64) -> i64
      %4594 = llvm.mlir.addressof @str457 : !llvm.ptr
      %4595 = arith.constant 11 : i64
      %4596 = func.call @cc_make_string(%4594, %4595) : (!llvm.ptr, i64) -> i64
      %4597 = func.call @cc_intern(%4593, %4596) : (i64, i64) -> i64
      %4598 = func.call @cc_nil_value() : () -> i64
      %4599 = func.call @cc_cons(%4597, %4598) : (i64, i64) -> i64
      %4600 = func.call @cc_values_pack(%4599) : (i64) -> i64
      func.call @stack_push_pointer(%4597) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4601 = func.call @stack_pop_pointer() : () -> i64
      %4602 = func.call @stack_pop_pointer() : () -> i64
      %4603 = func.call @cc_cons(%4602, %4601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4603) : (i64) -> ()
      %4604 = func.call @stack_pop_pointer() : () -> i64
      %4605 = func.call @stack_pop_pointer() : () -> i64
      %4606 = func.call @cc_cons(%4605, %4604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4606) : (i64) -> ()
      %4607 = llvm.mlir.addressof @str458 : !llvm.ptr
      %4608 = arith.constant 8 : i64
      %4609 = func.call @cc_make_string(%4607, %4608) : (!llvm.ptr, i64) -> i64
      %4610 = llvm.mlir.addressof @str459 : !llvm.ptr
      %4611 = arith.constant 11 : i64
      %4612 = func.call @cc_make_string(%4610, %4611) : (!llvm.ptr, i64) -> i64
      %4613 = func.call @cc_intern(%4609, %4612) : (i64, i64) -> i64
      %4614 = func.call @cc_nil_value() : () -> i64
      %4615 = func.call @cc_cons(%4613, %4614) : (i64, i64) -> i64
      %4616 = func.call @cc_values_pack(%4615) : (i64) -> i64
      func.call @stack_push_pointer(%4613) : (i64) -> ()
      %4617 = llvm.mlir.addressof @str460 : !llvm.ptr
      %4618 = arith.constant 10 : i64
      %4619 = func.call @cc_make_string(%4617, %4618) : (!llvm.ptr, i64) -> i64
      %4620 = llvm.mlir.addressof @str461 : !llvm.ptr
      %4621 = arith.constant 11 : i64
      %4622 = func.call @cc_make_string(%4620, %4621) : (!llvm.ptr, i64) -> i64
      %4623 = func.call @cc_intern(%4619, %4622) : (i64, i64) -> i64
      %4624 = func.call @cc_nil_value() : () -> i64
      %4625 = func.call @cc_cons(%4623, %4624) : (i64, i64) -> i64
      %4626 = func.call @cc_values_pack(%4625) : (i64) -> i64
      func.call @stack_push_pointer(%4623) : (i64) -> ()
      %4627 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4627) : (i64) -> ()
      %4628 = llvm.mlir.addressof @str462 : !llvm.ptr
      %4629 = arith.constant 6 : i64
      %4630 = func.call @cc_make_string(%4628, %4629) : (!llvm.ptr, i64) -> i64
      %4631 = llvm.mlir.addressof @str463 : !llvm.ptr
      %4632 = arith.constant 11 : i64
      %4633 = func.call @cc_make_string(%4631, %4632) : (!llvm.ptr, i64) -> i64
      %4634 = func.call @cc_intern(%4630, %4633) : (i64, i64) -> i64
      %4635 = func.call @cc_nil_value() : () -> i64
      %4636 = func.call @cc_cons(%4634, %4635) : (i64, i64) -> i64
      %4637 = func.call @cc_values_pack(%4636) : (i64) -> i64
      func.call @stack_push_pointer(%4634) : (i64) -> ()
      %4638 = func.call @stack_pop_pointer() : () -> i64
      %4639 = func.call @stack_pop_pointer() : () -> i64
      %4640 = func.call @cc_cons(%4638, %4639) : (i64, i64) -> i64
      %4641 = llvm.mlir.addressof @str464 : !llvm.ptr
      %4642 = arith.constant 5 : i64
      %4643 = func.call @cc_make_string(%4641, %4642) : (!llvm.ptr, i64) -> i64
      %4644 = func.call @cc_nil_value() : () -> i64
      %4645 = func.call @cc_intern(%4643, %4644) : (i64, i64) -> i64
      %4646 = func.call @cc_nil_value() : () -> i64
      %4647 = func.call @cc_cons(%4645, %4646) : (i64, i64) -> i64
      %4648 = func.call @cc_values_pack(%4647) : (i64) -> i64
      %4649 = func.call @cc_cons(%4645, %4640) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4649) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4650 = func.call @stack_pop_pointer() : () -> i64
      %4651 = func.call @stack_pop_pointer() : () -> i64
      %4652 = func.call @cc_cons(%4651, %4650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4652) : (i64) -> ()
      %4653 = func.call @stack_pop_pointer() : () -> i64
      %4654 = func.call @stack_pop_pointer() : () -> i64
      %4655 = func.call @cc_cons(%4654, %4653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4655) : (i64) -> ()
      %4656 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4656) : (i64) -> ()
      %4657 = llvm.mlir.addressof @str465 : !llvm.ptr
      %4658 = arith.constant 6 : i64
      %4659 = func.call @cc_make_string(%4657, %4658) : (!llvm.ptr, i64) -> i64
      %4660 = llvm.mlir.addressof @str466 : !llvm.ptr
      %4661 = arith.constant 11 : i64
      %4662 = func.call @cc_make_string(%4660, %4661) : (!llvm.ptr, i64) -> i64
      %4663 = func.call @cc_intern(%4659, %4662) : (i64, i64) -> i64
      %4664 = func.call @cc_nil_value() : () -> i64
      %4665 = func.call @cc_cons(%4663, %4664) : (i64, i64) -> i64
      %4666 = func.call @cc_values_pack(%4665) : (i64) -> i64
      func.call @stack_push_pointer(%4663) : (i64) -> ()
      %4667 = func.call @stack_pop_pointer() : () -> i64
      %4668 = func.call @stack_pop_pointer() : () -> i64
      %4669 = func.call @cc_cons(%4667, %4668) : (i64, i64) -> i64
      %4670 = llvm.mlir.addressof @str467 : !llvm.ptr
      %4671 = arith.constant 5 : i64
      %4672 = func.call @cc_make_string(%4670, %4671) : (!llvm.ptr, i64) -> i64
      %4673 = func.call @cc_nil_value() : () -> i64
      %4674 = func.call @cc_intern(%4672, %4673) : (i64, i64) -> i64
      %4675 = func.call @cc_nil_value() : () -> i64
      %4676 = func.call @cc_cons(%4674, %4675) : (i64, i64) -> i64
      %4677 = func.call @cc_values_pack(%4676) : (i64) -> i64
      %4678 = func.call @cc_cons(%4674, %4669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4678) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4679 = func.call @stack_pop_pointer() : () -> i64
      %4680 = func.call @stack_pop_pointer() : () -> i64
      %4681 = func.call @cc_cons(%4680, %4679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4681) : (i64) -> ()
      %4682 = func.call @stack_pop_pointer() : () -> i64
      %4683 = func.call @stack_pop_pointer() : () -> i64
      %4684 = func.call @cc_cons(%4683, %4682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4684) : (i64) -> ()
      %4685 = func.call @stack_pop_pointer() : () -> i64
      %4686 = func.call @stack_pop_pointer() : () -> i64
      %4687 = func.call @cc_cons(%4686, %4685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4687) : (i64) -> ()
      %4688 = llvm.mlir.addressof @str468 : !llvm.ptr
      %4689 = arith.constant 3 : i64
      %4690 = func.call @cc_make_string(%4688, %4689) : (!llvm.ptr, i64) -> i64
      %4691 = llvm.mlir.addressof @str469 : !llvm.ptr
      %4692 = arith.constant 11 : i64
      %4693 = func.call @cc_make_string(%4691, %4692) : (!llvm.ptr, i64) -> i64
      %4694 = func.call @cc_intern(%4690, %4693) : (i64, i64) -> i64
      %4695 = func.call @cc_nil_value() : () -> i64
      %4696 = func.call @cc_cons(%4694, %4695) : (i64, i64) -> i64
      %4697 = func.call @cc_values_pack(%4696) : (i64) -> i64
      func.call @stack_push_pointer(%4694) : (i64) -> ()
      %4698 = llvm.mlir.addressof @str470 : !llvm.ptr
      %4699 = arith.constant 2 : i64
      %4700 = func.call @cc_make_string(%4698, %4699) : (!llvm.ptr, i64) -> i64
      %4701 = llvm.mlir.addressof @str471 : !llvm.ptr
      %4702 = arith.constant 11 : i64
      %4703 = func.call @cc_make_string(%4701, %4702) : (!llvm.ptr, i64) -> i64
      %4704 = func.call @cc_intern(%4700, %4703) : (i64, i64) -> i64
      %4705 = func.call @cc_nil_value() : () -> i64
      %4706 = func.call @cc_cons(%4704, %4705) : (i64, i64) -> i64
      %4707 = func.call @cc_values_pack(%4706) : (i64) -> i64
      func.call @stack_push_pointer(%4704) : (i64) -> ()
      %4708 = llvm.mlir.addressof @str472 : !llvm.ptr
      %4709 = arith.constant 2 : i64
      %4710 = func.call @cc_make_string(%4708, %4709) : (!llvm.ptr, i64) -> i64
      %4711 = llvm.mlir.addressof @str473 : !llvm.ptr
      %4712 = arith.constant 11 : i64
      %4713 = func.call @cc_make_string(%4711, %4712) : (!llvm.ptr, i64) -> i64
      %4714 = func.call @cc_intern(%4710, %4713) : (i64, i64) -> i64
      %4715 = func.call @cc_nil_value() : () -> i64
      %4716 = func.call @cc_cons(%4714, %4715) : (i64, i64) -> i64
      %4717 = func.call @cc_values_pack(%4716) : (i64) -> i64
      func.call @stack_push_pointer(%4714) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4718 = func.call @stack_pop_pointer() : () -> i64
      %4719 = func.call @stack_pop_pointer() : () -> i64
      %4720 = func.call @cc_cons(%4719, %4718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4720) : (i64) -> ()
      %4721 = func.call @stack_pop_pointer() : () -> i64
      %4722 = func.call @stack_pop_pointer() : () -> i64
      %4723 = func.call @cc_cons(%4722, %4721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4723) : (i64) -> ()
      %4724 = func.call @stack_pop_pointer() : () -> i64
      %4725 = func.call @stack_pop_pointer() : () -> i64
      %4726 = func.call @cc_cons(%4725, %4724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4726) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4727 = func.call @stack_pop_pointer() : () -> i64
      %4728 = func.call @stack_pop_pointer() : () -> i64
      %4729 = func.call @cc_cons(%4728, %4727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4729) : (i64) -> ()
      %4730 = func.call @stack_pop_pointer() : () -> i64
      %4731 = func.call @stack_pop_pointer() : () -> i64
      %4732 = func.call @cc_cons(%4731, %4730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4732) : (i64) -> ()
      %4733 = func.call @stack_pop_pointer() : () -> i64
      %4734 = func.call @stack_pop_pointer() : () -> i64
      %4735 = func.call @cc_cons(%4734, %4733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4735) : (i64) -> ()
      %4736 = func.call @stack_pop_pointer() : () -> i64
      %4737 = func.call @stack_pop_pointer() : () -> i64
      %4738 = func.call @cc_cons(%4737, %4736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4738) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4739 = func.call @stack_pop_pointer() : () -> i64
      %4740 = func.call @stack_pop_pointer() : () -> i64
      %4741 = func.call @cc_cons(%4740, %4739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4741) : (i64) -> ()
      %4742 = func.call @stack_pop_pointer() : () -> i64
      %4743 = func.call @stack_pop_pointer() : () -> i64
      %4744 = func.call @cc_cons(%4743, %4742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4744) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4745 = func.call @stack_pop_pointer() : () -> i64
      %4746 = func.call @stack_pop_pointer() : () -> i64
      %4747 = func.call @cc_cons(%4746, %4745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4747) : (i64) -> ()
      %4748 = func.call @stack_pop_pointer() : () -> i64
      %4749 = func.call @stack_pop_pointer() : () -> i64
      %4750 = func.call @cc_cons(%4749, %4748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4750) : (i64) -> ()
      %4751 = func.call @stack_pop_pointer() : () -> i64
      %4814 = arith.constant 206494159077397 : i64
      %4815 = arith.constant 0 : i64
      %4816 = func.call @cc_make_closure(%4814, %4815) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4816) : (i64) -> ()
      %4817 = func.call @stack_pop_pointer() : () -> i64
      %4818 = llvm.mlir.addressof @str479 : !llvm.ptr
      %4819 = arith.constant 1 : i64
      %4820 = func.call @cc_make_string(%4818, %4819) : (!llvm.ptr, i64) -> i64
      %4821 = func.call @cc_nil_value() : () -> i64
      %4822 = func.call @cc_intern(%4820, %4821) : (i64, i64) -> i64
      %4823 = func.call @cc_nil_value() : () -> i64
      %4824 = func.call @cc_cons(%4822, %4823) : (i64, i64) -> i64
      %4825 = func.call @cc_values_pack(%4824) : (i64) -> i64
      func.call @stack_push_pointer(%4822) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4826 = func.call @stack_pop_pointer() : () -> i64
      %4827 = func.call @stack_pop_pointer() : () -> i64
      %4828 = func.call @cc_cons(%4827, %4826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4828) : (i64) -> ()
      %4829 = func.call @stack_pop_pointer() : () -> i64
      %4830 = llvm.mlir.addressof @str480 : !llvm.ptr
      %4831 = arith.constant 11 : i64
      %4832 = func.call @cc_make_string(%4830, %4831) : (!llvm.ptr, i64) -> i64
      %4833 = llvm.mlir.addressof @str481 : !llvm.ptr
      %4834 = arith.constant 7 : i64
      %4835 = func.call @cc_make_string(%4833, %4834) : (!llvm.ptr, i64) -> i64
      %4836 = func.call @cc_intern(%4832, %4835) : (i64, i64) -> i64
      %4837 = func.call @cc_nil_value() : () -> i64
      %4838 = func.call @cc_cons(%4836, %4837) : (i64, i64) -> i64
      %4839 = func.call @cc_values_pack(%4838) : (i64) -> i64
      func.call @stack_push_pointer(%4836) : (i64) -> ()
      %4840 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4841 = func.call @stack_pop_pointer() : () -> i64
      %4842 = llvm.mlir.addressof @str482 : !llvm.ptr
      %4843 = arith.constant 4 : i64
      %4844 = func.call @cc_make_string(%4842, %4843) : (!llvm.ptr, i64) -> i64
      %4845 = llvm.mlir.addressof @str483 : !llvm.ptr
      %4846 = arith.constant 7 : i64
      %4847 = func.call @cc_make_string(%4845, %4846) : (!llvm.ptr, i64) -> i64
      %4848 = func.call @cc_intern(%4844, %4847) : (i64, i64) -> i64
      %4849 = func.call @cc_nil_value() : () -> i64
      %4850 = func.call @cc_cons(%4848, %4849) : (i64, i64) -> i64
      %4851 = func.call @cc_values_pack(%4850) : (i64) -> i64
      func.call @stack_push_pointer(%4848) : (i64) -> ()
      %4852 = func.call @stack_pop_pointer() : () -> i64
      %4853 = llvm.mlir.addressof @str484 : !llvm.ptr
      %4854 = arith.constant 6 : i64
      %4855 = func.call @cc_make_string(%4853, %4854) : (!llvm.ptr, i64) -> i64
      %4856 = func.call @cc_nil_value() : () -> i64
      %4857 = func.call @cc_intern(%4855, %4856) : (i64, i64) -> i64
      %4858 = func.call @cc_nil_value() : () -> i64
      %4859 = func.call @cc_cons(%4857, %4858) : (i64, i64) -> i64
      %4860 = func.call @cc_values_pack(%4859) : (i64) -> i64
      func.call @stack_push_pointer(%4857) : (i64) -> ()
      %4861 = func.call @stack_pop_pointer() : () -> i64
      %4862 = func.call @cc_nil_value() : () -> i64
      %4863 = func.call @cc_errorp(%4554) : (i64) -> i64
      %4864 = arith.cmpi ne, %4863, %4862 : i64
      %4865 = arith.cmpi eq, %4862, %4862 : i64
      %4866 = arith.andi %4864, %4865 : i1
      %4867 = scf.if %4866 -> (i64) {
        scf.yield %4554 : i64
      } else {
        scf.yield %4862 : i64
      }
      %4868 = func.call @cc_errorp(%4751) : (i64) -> i64
      %4869 = arith.cmpi ne, %4868, %4862 : i64
      %4870 = arith.cmpi eq, %4867, %4862 : i64
      %4871 = arith.andi %4869, %4870 : i1
      %4872 = scf.if %4871 -> (i64) {
        scf.yield %4751 : i64
      } else {
        scf.yield %4867 : i64
      }
      %4873 = func.call @cc_errorp(%4817) : (i64) -> i64
      %4874 = arith.cmpi ne, %4873, %4862 : i64
      %4875 = arith.cmpi eq, %4872, %4862 : i64
      %4876 = arith.andi %4874, %4875 : i1
      %4877 = scf.if %4876 -> (i64) {
        scf.yield %4817 : i64
      } else {
        scf.yield %4872 : i64
      }
      %4878 = func.call @cc_errorp(%4829) : (i64) -> i64
      %4879 = arith.cmpi ne, %4878, %4862 : i64
      %4880 = arith.cmpi eq, %4877, %4862 : i64
      %4881 = arith.andi %4879, %4880 : i1
      %4882 = scf.if %4881 -> (i64) {
        scf.yield %4829 : i64
      } else {
        scf.yield %4877 : i64
      }
      %4883 = func.call @cc_errorp(%4840) : (i64) -> i64
      %4884 = arith.cmpi ne, %4883, %4862 : i64
      %4885 = arith.cmpi eq, %4882, %4862 : i64
      %4886 = arith.andi %4884, %4885 : i1
      %4887 = scf.if %4886 -> (i64) {
        scf.yield %4840 : i64
      } else {
        scf.yield %4882 : i64
      }
      %4888 = func.call @cc_errorp(%4841) : (i64) -> i64
      %4889 = arith.cmpi ne, %4888, %4862 : i64
      %4890 = arith.cmpi eq, %4887, %4862 : i64
      %4891 = arith.andi %4889, %4890 : i1
      %4892 = scf.if %4891 -> (i64) {
        scf.yield %4841 : i64
      } else {
        scf.yield %4887 : i64
      }
      %4893 = func.call @cc_errorp(%4852) : (i64) -> i64
      %4894 = arith.cmpi ne, %4893, %4862 : i64
      %4895 = arith.cmpi eq, %4892, %4862 : i64
      %4896 = arith.andi %4894, %4895 : i1
      %4897 = scf.if %4896 -> (i64) {
        scf.yield %4852 : i64
      } else {
        scf.yield %4892 : i64
      }
      %4898 = func.call @cc_errorp(%4861) : (i64) -> i64
      %4899 = arith.cmpi ne, %4898, %4862 : i64
      %4900 = arith.cmpi eq, %4897, %4862 : i64
      %4901 = arith.andi %4899, %4900 : i1
      %4902 = scf.if %4901 -> (i64) {
        scf.yield %4861 : i64
      } else {
        scf.yield %4897 : i64
      }
      %4903 = arith.cmpi ne, %4902, %4862 : i64
      scf.if %4903 {
        func.call @stack_push_pointer(%4902) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4554) : (i64) -> ()
        func.call @stack_push_pointer(%4751) : (i64) -> ()
        func.call @stack_push_pointer(%4817) : (i64) -> ()
        func.call @stack_push_pointer(%4829) : (i64) -> ()
        func.call @stack_push_pointer(%4840) : (i64) -> ()
        func.call @stack_push_pointer(%4841) : (i64) -> ()
        func.call @stack_push_pointer(%4852) : (i64) -> ()
        func.call @stack_push_pointer(%4861) : (i64) -> ()
        %4904 = llvm.mlir.addressof @str485 : !llvm.ptr
        %4905 = func.call @cc_make_function_ref_const(%4904) : (!llvm.ptr) -> i64
        %4906 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4905, %4906) : (i64, i64) -> ()
      }
      %4907 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4907 : i64
    }
    %4908 = func.call @cc_nil_value() : () -> i64
    %4909 = func.call @cc_errorp(%4545) : (i64) -> i64
    %4910 = arith.cmpi ne, %4909, %4908 : i64
    %4911 = scf.if %4910 -> (i64) {
      scf.yield %4545 : i64
    } else {
      %4912 = llvm.mlir.addressof @str486 : !llvm.ptr
      %4913 = arith.constant 18 : i64
      %4914 = func.call @cc_make_string(%4912, %4913) : (!llvm.ptr, i64) -> i64
      %4915 = func.call @cc_nil_value() : () -> i64
      %4916 = func.call @cc_intern(%4914, %4915) : (i64, i64) -> i64
      %4917 = func.call @cc_nil_value() : () -> i64
      %4918 = func.call @cc_cons(%4916, %4917) : (i64, i64) -> i64
      %4919 = func.call @cc_values_pack(%4918) : (i64) -> i64
      func.call @stack_push_pointer(%4916) : (i64) -> ()
      %4920 = func.call @stack_pop_pointer() : () -> i64
      %4921 = llvm.mlir.addressof @str487 : !llvm.ptr
      %4922 = arith.constant 3 : i64
      %4923 = func.call @cc_make_string(%4921, %4922) : (!llvm.ptr, i64) -> i64
      %4924 = func.call @cc_nil_value() : () -> i64
      %4925 = func.call @cc_intern(%4923, %4924) : (i64, i64) -> i64
      %4926 = func.call @cc_nil_value() : () -> i64
      %4927 = func.call @cc_cons(%4925, %4926) : (i64, i64) -> i64
      %4928 = func.call @cc_values_pack(%4927) : (i64) -> i64
      func.call @stack_push_pointer(%4925) : (i64) -> ()
      %4929 = llvm.mlir.addressof @str488 : !llvm.ptr
      %4930 = arith.constant 3 : i64
      %4931 = func.call @cc_make_string(%4929, %4930) : (!llvm.ptr, i64) -> i64
      %4932 = func.call @cc_nil_value() : () -> i64
      %4933 = func.call @cc_intern(%4931, %4932) : (i64, i64) -> i64
      %4934 = func.call @cc_nil_value() : () -> i64
      %4935 = func.call @cc_cons(%4933, %4934) : (i64, i64) -> i64
      %4936 = func.call @cc_values_pack(%4935) : (i64) -> i64
      func.call @stack_push_pointer(%4933) : (i64) -> ()
      %4937 = llvm.mlir.addressof @str489 : !llvm.ptr
      %4938 = arith.constant 19 : i64
      %4939 = func.call @cc_make_string(%4937, %4938) : (!llvm.ptr, i64) -> i64
      %4940 = llvm.mlir.addressof @str490 : !llvm.ptr
      %4941 = arith.constant 11 : i64
      %4942 = func.call @cc_make_string(%4940, %4941) : (!llvm.ptr, i64) -> i64
      %4943 = func.call @cc_intern(%4939, %4942) : (i64, i64) -> i64
      %4944 = func.call @cc_nil_value() : () -> i64
      %4945 = func.call @cc_cons(%4943, %4944) : (i64, i64) -> i64
      %4946 = func.call @cc_values_pack(%4945) : (i64) -> i64
      func.call @stack_push_pointer(%4943) : (i64) -> ()
      %4947 = llvm.mlir.addressof @str491 : !llvm.ptr
      %4948 = arith.constant 2 : i64
      %4949 = func.call @cc_make_string(%4947, %4948) : (!llvm.ptr, i64) -> i64
      %4950 = llvm.mlir.addressof @str492 : !llvm.ptr
      %4951 = arith.constant 11 : i64
      %4952 = func.call @cc_make_string(%4950, %4951) : (!llvm.ptr, i64) -> i64
      %4953 = func.call @cc_intern(%4949, %4952) : (i64, i64) -> i64
      %4954 = func.call @cc_nil_value() : () -> i64
      %4955 = func.call @cc_cons(%4953, %4954) : (i64, i64) -> i64
      %4956 = func.call @cc_values_pack(%4955) : (i64) -> i64
      func.call @stack_push_pointer(%4953) : (i64) -> ()
      %4957 = llvm.mlir.addressof @str493 : !llvm.ptr
      %4958 = arith.constant 2 : i64
      %4959 = func.call @cc_make_string(%4957, %4958) : (!llvm.ptr, i64) -> i64
      %4960 = llvm.mlir.addressof @str494 : !llvm.ptr
      %4961 = arith.constant 11 : i64
      %4962 = func.call @cc_make_string(%4960, %4961) : (!llvm.ptr, i64) -> i64
      %4963 = func.call @cc_intern(%4959, %4962) : (i64, i64) -> i64
      %4964 = func.call @cc_nil_value() : () -> i64
      %4965 = func.call @cc_cons(%4963, %4964) : (i64, i64) -> i64
      %4966 = func.call @cc_values_pack(%4965) : (i64) -> i64
      func.call @stack_push_pointer(%4963) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4967 = func.call @stack_pop_pointer() : () -> i64
      %4968 = func.call @stack_pop_pointer() : () -> i64
      %4969 = func.call @cc_cons(%4968, %4967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4969) : (i64) -> ()
      %4970 = func.call @stack_pop_pointer() : () -> i64
      %4971 = func.call @stack_pop_pointer() : () -> i64
      %4972 = func.call @cc_cons(%4971, %4970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4972) : (i64) -> ()
      %4973 = llvm.mlir.addressof @str495 : !llvm.ptr
      %4974 = arith.constant 8 : i64
      %4975 = func.call @cc_make_string(%4973, %4974) : (!llvm.ptr, i64) -> i64
      %4976 = llvm.mlir.addressof @str496 : !llvm.ptr
      %4977 = arith.constant 11 : i64
      %4978 = func.call @cc_make_string(%4976, %4977) : (!llvm.ptr, i64) -> i64
      %4979 = func.call @cc_intern(%4975, %4978) : (i64, i64) -> i64
      %4980 = func.call @cc_nil_value() : () -> i64
      %4981 = func.call @cc_cons(%4979, %4980) : (i64, i64) -> i64
      %4982 = func.call @cc_values_pack(%4981) : (i64) -> i64
      func.call @stack_push_pointer(%4979) : (i64) -> ()
      %4983 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4983) : (i64) -> ()
      %4984 = llvm.mlir.addressof @str497 : !llvm.ptr
      %4985 = arith.constant 11 : i64
      %4986 = func.call @cc_make_string(%4984, %4985) : (!llvm.ptr, i64) -> i64
      %4987 = llvm.mlir.addressof @str498 : !llvm.ptr
      %4988 = arith.constant 11 : i64
      %4989 = func.call @cc_make_string(%4987, %4988) : (!llvm.ptr, i64) -> i64
      %4990 = func.call @cc_intern(%4986, %4989) : (i64, i64) -> i64
      %4991 = func.call @cc_nil_value() : () -> i64
      %4992 = func.call @cc_cons(%4990, %4991) : (i64, i64) -> i64
      %4993 = func.call @cc_values_pack(%4992) : (i64) -> i64
      func.call @stack_push_pointer(%4990) : (i64) -> ()
      %4994 = func.call @stack_pop_pointer() : () -> i64
      %4995 = func.call @stack_pop_pointer() : () -> i64
      %4996 = func.call @cc_cons(%4994, %4995) : (i64, i64) -> i64
      %4997 = llvm.mlir.addressof @str499 : !llvm.ptr
      %4998 = arith.constant 5 : i64
      %4999 = func.call @cc_make_string(%4997, %4998) : (!llvm.ptr, i64) -> i64
      %5000 = func.call @cc_nil_value() : () -> i64
      %5001 = func.call @cc_intern(%4999, %5000) : (i64, i64) -> i64
      %5002 = func.call @cc_nil_value() : () -> i64
      %5003 = func.call @cc_cons(%5001, %5002) : (i64, i64) -> i64
      %5004 = func.call @cc_values_pack(%5003) : (i64) -> i64
      %5005 = func.call @cc_cons(%5001, %4996) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5005) : (i64) -> ()
      %5006 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5007 = arith.constant 10 : i64
      %5008 = func.call @cc_make_string(%5006, %5007) : (!llvm.ptr, i64) -> i64
      %5009 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5010 = arith.constant 11 : i64
      %5011 = func.call @cc_make_string(%5009, %5010) : (!llvm.ptr, i64) -> i64
      %5012 = func.call @cc_intern(%5008, %5011) : (i64, i64) -> i64
      %5013 = func.call @cc_nil_value() : () -> i64
      %5014 = func.call @cc_cons(%5012, %5013) : (i64, i64) -> i64
      %5015 = func.call @cc_values_pack(%5014) : (i64) -> i64
      func.call @stack_push_pointer(%5012) : (i64) -> ()
      %5016 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5016) : (i64) -> ()
      %5017 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5018 = arith.constant 11 : i64
      %5019 = func.call @cc_make_string(%5017, %5018) : (!llvm.ptr, i64) -> i64
      %5020 = llvm.mlir.addressof @str503 : !llvm.ptr
      %5021 = arith.constant 11 : i64
      %5022 = func.call @cc_make_string(%5020, %5021) : (!llvm.ptr, i64) -> i64
      %5023 = func.call @cc_intern(%5019, %5022) : (i64, i64) -> i64
      %5024 = func.call @cc_nil_value() : () -> i64
      %5025 = func.call @cc_cons(%5023, %5024) : (i64, i64) -> i64
      %5026 = func.call @cc_values_pack(%5025) : (i64) -> i64
      func.call @stack_push_pointer(%5023) : (i64) -> ()
      %5027 = func.call @stack_pop_pointer() : () -> i64
      %5028 = func.call @stack_pop_pointer() : () -> i64
      %5029 = func.call @cc_cons(%5027, %5028) : (i64, i64) -> i64
      %5030 = llvm.mlir.addressof @str504 : !llvm.ptr
      %5031 = arith.constant 5 : i64
      %5032 = func.call @cc_make_string(%5030, %5031) : (!llvm.ptr, i64) -> i64
      %5033 = func.call @cc_nil_value() : () -> i64
      %5034 = func.call @cc_intern(%5032, %5033) : (i64, i64) -> i64
      %5035 = func.call @cc_nil_value() : () -> i64
      %5036 = func.call @cc_cons(%5034, %5035) : (i64, i64) -> i64
      %5037 = func.call @cc_values_pack(%5036) : (i64) -> i64
      %5038 = func.call @cc_cons(%5034, %5029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5038) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5039 = func.call @stack_pop_pointer() : () -> i64
      %5040 = func.call @stack_pop_pointer() : () -> i64
      %5041 = func.call @cc_cons(%5040, %5039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5041) : (i64) -> ()
      %5042 = func.call @stack_pop_pointer() : () -> i64
      %5043 = func.call @stack_pop_pointer() : () -> i64
      %5044 = func.call @cc_cons(%5043, %5042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5044) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5045 = func.call @stack_pop_pointer() : () -> i64
      %5046 = func.call @stack_pop_pointer() : () -> i64
      %5047 = func.call @cc_cons(%5046, %5045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5047) : (i64) -> ()
      %5048 = func.call @stack_pop_pointer() : () -> i64
      %5049 = func.call @stack_pop_pointer() : () -> i64
      %5050 = func.call @cc_cons(%5049, %5048) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5050) : (i64) -> ()
      %5051 = func.call @stack_pop_pointer() : () -> i64
      %5052 = func.call @stack_pop_pointer() : () -> i64
      %5053 = func.call @cc_cons(%5052, %5051) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5053) : (i64) -> ()
      %5054 = llvm.mlir.addressof @str505 : !llvm.ptr
      %5055 = arith.constant 3 : i64
      %5056 = func.call @cc_make_string(%5054, %5055) : (!llvm.ptr, i64) -> i64
      %5057 = llvm.mlir.addressof @str506 : !llvm.ptr
      %5058 = arith.constant 11 : i64
      %5059 = func.call @cc_make_string(%5057, %5058) : (!llvm.ptr, i64) -> i64
      %5060 = func.call @cc_intern(%5056, %5059) : (i64, i64) -> i64
      %5061 = func.call @cc_nil_value() : () -> i64
      %5062 = func.call @cc_cons(%5060, %5061) : (i64, i64) -> i64
      %5063 = func.call @cc_values_pack(%5062) : (i64) -> i64
      func.call @stack_push_pointer(%5060) : (i64) -> ()
      %5064 = llvm.mlir.addressof @str507 : !llvm.ptr
      %5065 = arith.constant 2 : i64
      %5066 = func.call @cc_make_string(%5064, %5065) : (!llvm.ptr, i64) -> i64
      %5067 = llvm.mlir.addressof @str508 : !llvm.ptr
      %5068 = arith.constant 11 : i64
      %5069 = func.call @cc_make_string(%5067, %5068) : (!llvm.ptr, i64) -> i64
      %5070 = func.call @cc_intern(%5066, %5069) : (i64, i64) -> i64
      %5071 = func.call @cc_nil_value() : () -> i64
      %5072 = func.call @cc_cons(%5070, %5071) : (i64, i64) -> i64
      %5073 = func.call @cc_values_pack(%5072) : (i64) -> i64
      func.call @stack_push_pointer(%5070) : (i64) -> ()
      %5074 = llvm.mlir.addressof @str509 : !llvm.ptr
      %5075 = arith.constant 2 : i64
      %5076 = func.call @cc_make_string(%5074, %5075) : (!llvm.ptr, i64) -> i64
      %5077 = llvm.mlir.addressof @str510 : !llvm.ptr
      %5078 = arith.constant 11 : i64
      %5079 = func.call @cc_make_string(%5077, %5078) : (!llvm.ptr, i64) -> i64
      %5080 = func.call @cc_intern(%5076, %5079) : (i64, i64) -> i64
      %5081 = func.call @cc_nil_value() : () -> i64
      %5082 = func.call @cc_cons(%5080, %5081) : (i64, i64) -> i64
      %5083 = func.call @cc_values_pack(%5082) : (i64) -> i64
      func.call @stack_push_pointer(%5080) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5084 = func.call @stack_pop_pointer() : () -> i64
      %5085 = func.call @stack_pop_pointer() : () -> i64
      %5086 = func.call @cc_cons(%5085, %5084) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5086) : (i64) -> ()
      %5087 = func.call @stack_pop_pointer() : () -> i64
      %5088 = func.call @stack_pop_pointer() : () -> i64
      %5089 = func.call @cc_cons(%5088, %5087) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5089) : (i64) -> ()
      %5090 = func.call @stack_pop_pointer() : () -> i64
      %5091 = func.call @stack_pop_pointer() : () -> i64
      %5092 = func.call @cc_cons(%5091, %5090) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5092) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5093 = func.call @stack_pop_pointer() : () -> i64
      %5094 = func.call @stack_pop_pointer() : () -> i64
      %5095 = func.call @cc_cons(%5094, %5093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5095) : (i64) -> ()
      %5096 = func.call @stack_pop_pointer() : () -> i64
      %5097 = func.call @stack_pop_pointer() : () -> i64
      %5098 = func.call @cc_cons(%5097, %5096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5098) : (i64) -> ()
      %5099 = func.call @stack_pop_pointer() : () -> i64
      %5100 = func.call @stack_pop_pointer() : () -> i64
      %5101 = func.call @cc_cons(%5100, %5099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5101) : (i64) -> ()
      %5102 = func.call @stack_pop_pointer() : () -> i64
      %5103 = func.call @stack_pop_pointer() : () -> i64
      %5104 = func.call @cc_cons(%5103, %5102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5105 = func.call @stack_pop_pointer() : () -> i64
      %5106 = func.call @stack_pop_pointer() : () -> i64
      %5107 = func.call @cc_cons(%5106, %5105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5107) : (i64) -> ()
      %5108 = func.call @stack_pop_pointer() : () -> i64
      %5109 = func.call @stack_pop_pointer() : () -> i64
      %5110 = func.call @cc_cons(%5109, %5108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5110) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5111 = func.call @stack_pop_pointer() : () -> i64
      %5112 = func.call @stack_pop_pointer() : () -> i64
      %5113 = func.call @cc_cons(%5112, %5111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5113) : (i64) -> ()
      %5114 = func.call @stack_pop_pointer() : () -> i64
      %5115 = func.call @stack_pop_pointer() : () -> i64
      %5116 = func.call @cc_cons(%5115, %5114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5116) : (i64) -> ()
      %5117 = func.call @stack_pop_pointer() : () -> i64
      %5180 = arith.constant 206494159077398 : i64
      %5181 = arith.constant 0 : i64
      %5182 = func.call @cc_make_closure(%5180, %5181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5182) : (i64) -> ()
      %5183 = func.call @stack_pop_pointer() : () -> i64
      %5184 = llvm.mlir.addressof @str516 : !llvm.ptr
      %5185 = arith.constant 1 : i64
      %5186 = func.call @cc_make_string(%5184, %5185) : (!llvm.ptr, i64) -> i64
      %5187 = func.call @cc_nil_value() : () -> i64
      %5188 = func.call @cc_intern(%5186, %5187) : (i64, i64) -> i64
      %5189 = func.call @cc_nil_value() : () -> i64
      %5190 = func.call @cc_cons(%5188, %5189) : (i64, i64) -> i64
      %5191 = func.call @cc_values_pack(%5190) : (i64) -> i64
      func.call @stack_push_pointer(%5188) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5192 = func.call @stack_pop_pointer() : () -> i64
      %5193 = func.call @stack_pop_pointer() : () -> i64
      %5194 = func.call @cc_cons(%5193, %5192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5194) : (i64) -> ()
      %5195 = func.call @stack_pop_pointer() : () -> i64
      %5196 = llvm.mlir.addressof @str517 : !llvm.ptr
      %5197 = arith.constant 11 : i64
      %5198 = func.call @cc_make_string(%5196, %5197) : (!llvm.ptr, i64) -> i64
      %5199 = llvm.mlir.addressof @str518 : !llvm.ptr
      %5200 = arith.constant 7 : i64
      %5201 = func.call @cc_make_string(%5199, %5200) : (!llvm.ptr, i64) -> i64
      %5202 = func.call @cc_intern(%5198, %5201) : (i64, i64) -> i64
      %5203 = func.call @cc_nil_value() : () -> i64
      %5204 = func.call @cc_cons(%5202, %5203) : (i64, i64) -> i64
      %5205 = func.call @cc_values_pack(%5204) : (i64) -> i64
      func.call @stack_push_pointer(%5202) : (i64) -> ()
      %5206 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5207 = func.call @stack_pop_pointer() : () -> i64
      %5208 = llvm.mlir.addressof @str519 : !llvm.ptr
      %5209 = arith.constant 4 : i64
      %5210 = func.call @cc_make_string(%5208, %5209) : (!llvm.ptr, i64) -> i64
      %5211 = llvm.mlir.addressof @str520 : !llvm.ptr
      %5212 = arith.constant 7 : i64
      %5213 = func.call @cc_make_string(%5211, %5212) : (!llvm.ptr, i64) -> i64
      %5214 = func.call @cc_intern(%5210, %5213) : (i64, i64) -> i64
      %5215 = func.call @cc_nil_value() : () -> i64
      %5216 = func.call @cc_cons(%5214, %5215) : (i64, i64) -> i64
      %5217 = func.call @cc_values_pack(%5216) : (i64) -> i64
      func.call @stack_push_pointer(%5214) : (i64) -> ()
      %5218 = func.call @stack_pop_pointer() : () -> i64
      %5219 = llvm.mlir.addressof @str521 : !llvm.ptr
      %5220 = arith.constant 6 : i64
      %5221 = func.call @cc_make_string(%5219, %5220) : (!llvm.ptr, i64) -> i64
      %5222 = func.call @cc_nil_value() : () -> i64
      %5223 = func.call @cc_intern(%5221, %5222) : (i64, i64) -> i64
      %5224 = func.call @cc_nil_value() : () -> i64
      %5225 = func.call @cc_cons(%5223, %5224) : (i64, i64) -> i64
      %5226 = func.call @cc_values_pack(%5225) : (i64) -> i64
      func.call @stack_push_pointer(%5223) : (i64) -> ()
      %5227 = func.call @stack_pop_pointer() : () -> i64
      %5228 = func.call @cc_nil_value() : () -> i64
      %5229 = func.call @cc_errorp(%4920) : (i64) -> i64
      %5230 = arith.cmpi ne, %5229, %5228 : i64
      %5231 = arith.cmpi eq, %5228, %5228 : i64
      %5232 = arith.andi %5230, %5231 : i1
      %5233 = scf.if %5232 -> (i64) {
        scf.yield %4920 : i64
      } else {
        scf.yield %5228 : i64
      }
      %5234 = func.call @cc_errorp(%5117) : (i64) -> i64
      %5235 = arith.cmpi ne, %5234, %5228 : i64
      %5236 = arith.cmpi eq, %5233, %5228 : i64
      %5237 = arith.andi %5235, %5236 : i1
      %5238 = scf.if %5237 -> (i64) {
        scf.yield %5117 : i64
      } else {
        scf.yield %5233 : i64
      }
      %5239 = func.call @cc_errorp(%5183) : (i64) -> i64
      %5240 = arith.cmpi ne, %5239, %5228 : i64
      %5241 = arith.cmpi eq, %5238, %5228 : i64
      %5242 = arith.andi %5240, %5241 : i1
      %5243 = scf.if %5242 -> (i64) {
        scf.yield %5183 : i64
      } else {
        scf.yield %5238 : i64
      }
      %5244 = func.call @cc_errorp(%5195) : (i64) -> i64
      %5245 = arith.cmpi ne, %5244, %5228 : i64
      %5246 = arith.cmpi eq, %5243, %5228 : i64
      %5247 = arith.andi %5245, %5246 : i1
      %5248 = scf.if %5247 -> (i64) {
        scf.yield %5195 : i64
      } else {
        scf.yield %5243 : i64
      }
      %5249 = func.call @cc_errorp(%5206) : (i64) -> i64
      %5250 = arith.cmpi ne, %5249, %5228 : i64
      %5251 = arith.cmpi eq, %5248, %5228 : i64
      %5252 = arith.andi %5250, %5251 : i1
      %5253 = scf.if %5252 -> (i64) {
        scf.yield %5206 : i64
      } else {
        scf.yield %5248 : i64
      }
      %5254 = func.call @cc_errorp(%5207) : (i64) -> i64
      %5255 = arith.cmpi ne, %5254, %5228 : i64
      %5256 = arith.cmpi eq, %5253, %5228 : i64
      %5257 = arith.andi %5255, %5256 : i1
      %5258 = scf.if %5257 -> (i64) {
        scf.yield %5207 : i64
      } else {
        scf.yield %5253 : i64
      }
      %5259 = func.call @cc_errorp(%5218) : (i64) -> i64
      %5260 = arith.cmpi ne, %5259, %5228 : i64
      %5261 = arith.cmpi eq, %5258, %5228 : i64
      %5262 = arith.andi %5260, %5261 : i1
      %5263 = scf.if %5262 -> (i64) {
        scf.yield %5218 : i64
      } else {
        scf.yield %5258 : i64
      }
      %5264 = func.call @cc_errorp(%5227) : (i64) -> i64
      %5265 = arith.cmpi ne, %5264, %5228 : i64
      %5266 = arith.cmpi eq, %5263, %5228 : i64
      %5267 = arith.andi %5265, %5266 : i1
      %5268 = scf.if %5267 -> (i64) {
        scf.yield %5227 : i64
      } else {
        scf.yield %5263 : i64
      }
      %5269 = arith.cmpi ne, %5268, %5228 : i64
      scf.if %5269 {
        func.call @stack_push_pointer(%5268) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4920) : (i64) -> ()
        func.call @stack_push_pointer(%5117) : (i64) -> ()
        func.call @stack_push_pointer(%5183) : (i64) -> ()
        func.call @stack_push_pointer(%5195) : (i64) -> ()
        func.call @stack_push_pointer(%5206) : (i64) -> ()
        func.call @stack_push_pointer(%5207) : (i64) -> ()
        func.call @stack_push_pointer(%5218) : (i64) -> ()
        func.call @stack_push_pointer(%5227) : (i64) -> ()
        %5270 = llvm.mlir.addressof @str522 : !llvm.ptr
        %5271 = func.call @cc_make_function_ref_const(%5270) : (!llvm.ptr) -> i64
        %5272 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5271, %5272) : (i64, i64) -> ()
      }
      %5273 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5273 : i64
    }
    %5274 = func.call @cc_nil_value() : () -> i64
    %5275 = func.call @cc_errorp(%4911) : (i64) -> i64
    %5276 = arith.cmpi ne, %5275, %5274 : i64
    %5277 = scf.if %5276 -> (i64) {
      scf.yield %4911 : i64
    } else {
      %5278 = llvm.mlir.addressof @str523 : !llvm.ptr
      %5279 = arith.constant 18 : i64
      %5280 = func.call @cc_make_string(%5278, %5279) : (!llvm.ptr, i64) -> i64
      %5281 = func.call @cc_nil_value() : () -> i64
      %5282 = func.call @cc_intern(%5280, %5281) : (i64, i64) -> i64
      %5283 = func.call @cc_nil_value() : () -> i64
      %5284 = func.call @cc_cons(%5282, %5283) : (i64, i64) -> i64
      %5285 = func.call @cc_values_pack(%5284) : (i64) -> i64
      func.call @stack_push_pointer(%5282) : (i64) -> ()
      %5286 = func.call @stack_pop_pointer() : () -> i64
      %5287 = llvm.mlir.addressof @str524 : !llvm.ptr
      %5288 = arith.constant 3 : i64
      %5289 = func.call @cc_make_string(%5287, %5288) : (!llvm.ptr, i64) -> i64
      %5290 = func.call @cc_nil_value() : () -> i64
      %5291 = func.call @cc_intern(%5289, %5290) : (i64, i64) -> i64
      %5292 = func.call @cc_nil_value() : () -> i64
      %5293 = func.call @cc_cons(%5291, %5292) : (i64, i64) -> i64
      %5294 = func.call @cc_values_pack(%5293) : (i64) -> i64
      func.call @stack_push_pointer(%5291) : (i64) -> ()
      %5295 = llvm.mlir.addressof @str525 : !llvm.ptr
      %5296 = arith.constant 3 : i64
      %5297 = func.call @cc_make_string(%5295, %5296) : (!llvm.ptr, i64) -> i64
      %5298 = func.call @cc_nil_value() : () -> i64
      %5299 = func.call @cc_intern(%5297, %5298) : (i64, i64) -> i64
      %5300 = func.call @cc_nil_value() : () -> i64
      %5301 = func.call @cc_cons(%5299, %5300) : (i64, i64) -> i64
      %5302 = func.call @cc_values_pack(%5301) : (i64) -> i64
      func.call @stack_push_pointer(%5299) : (i64) -> ()
      %5303 = llvm.mlir.addressof @str526 : !llvm.ptr
      %5304 = arith.constant 19 : i64
      %5305 = func.call @cc_make_string(%5303, %5304) : (!llvm.ptr, i64) -> i64
      %5306 = llvm.mlir.addressof @str527 : !llvm.ptr
      %5307 = arith.constant 11 : i64
      %5308 = func.call @cc_make_string(%5306, %5307) : (!llvm.ptr, i64) -> i64
      %5309 = func.call @cc_intern(%5305, %5308) : (i64, i64) -> i64
      %5310 = func.call @cc_nil_value() : () -> i64
      %5311 = func.call @cc_cons(%5309, %5310) : (i64, i64) -> i64
      %5312 = func.call @cc_values_pack(%5311) : (i64) -> i64
      func.call @stack_push_pointer(%5309) : (i64) -> ()
      %5313 = llvm.mlir.addressof @str528 : !llvm.ptr
      %5314 = arith.constant 2 : i64
      %5315 = func.call @cc_make_string(%5313, %5314) : (!llvm.ptr, i64) -> i64
      %5316 = llvm.mlir.addressof @str529 : !llvm.ptr
      %5317 = arith.constant 11 : i64
      %5318 = func.call @cc_make_string(%5316, %5317) : (!llvm.ptr, i64) -> i64
      %5319 = func.call @cc_intern(%5315, %5318) : (i64, i64) -> i64
      %5320 = func.call @cc_nil_value() : () -> i64
      %5321 = func.call @cc_cons(%5319, %5320) : (i64, i64) -> i64
      %5322 = func.call @cc_values_pack(%5321) : (i64) -> i64
      func.call @stack_push_pointer(%5319) : (i64) -> ()
      %5323 = llvm.mlir.addressof @str530 : !llvm.ptr
      %5324 = arith.constant 2 : i64
      %5325 = func.call @cc_make_string(%5323, %5324) : (!llvm.ptr, i64) -> i64
      %5326 = llvm.mlir.addressof @str531 : !llvm.ptr
      %5327 = arith.constant 11 : i64
      %5328 = func.call @cc_make_string(%5326, %5327) : (!llvm.ptr, i64) -> i64
      %5329 = func.call @cc_intern(%5325, %5328) : (i64, i64) -> i64
      %5330 = func.call @cc_nil_value() : () -> i64
      %5331 = func.call @cc_cons(%5329, %5330) : (i64, i64) -> i64
      %5332 = func.call @cc_values_pack(%5331) : (i64) -> i64
      func.call @stack_push_pointer(%5329) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5333 = func.call @stack_pop_pointer() : () -> i64
      %5334 = func.call @stack_pop_pointer() : () -> i64
      %5335 = func.call @cc_cons(%5334, %5333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5335) : (i64) -> ()
      %5336 = func.call @stack_pop_pointer() : () -> i64
      %5337 = func.call @stack_pop_pointer() : () -> i64
      %5338 = func.call @cc_cons(%5337, %5336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5338) : (i64) -> ()
      %5339 = llvm.mlir.addressof @str532 : !llvm.ptr
      %5340 = arith.constant 8 : i64
      %5341 = func.call @cc_make_string(%5339, %5340) : (!llvm.ptr, i64) -> i64
      %5342 = llvm.mlir.addressof @str533 : !llvm.ptr
      %5343 = arith.constant 11 : i64
      %5344 = func.call @cc_make_string(%5342, %5343) : (!llvm.ptr, i64) -> i64
      %5345 = func.call @cc_intern(%5341, %5344) : (i64, i64) -> i64
      %5346 = func.call @cc_nil_value() : () -> i64
      %5347 = func.call @cc_cons(%5345, %5346) : (i64, i64) -> i64
      %5348 = func.call @cc_values_pack(%5347) : (i64) -> i64
      func.call @stack_push_pointer(%5345) : (i64) -> ()
      %5349 = llvm.mlir.addressof @str534 : !llvm.ptr
      %5350 = arith.constant 10 : i64
      %5351 = func.call @cc_make_string(%5349, %5350) : (!llvm.ptr, i64) -> i64
      %5352 = llvm.mlir.addressof @str535 : !llvm.ptr
      %5353 = arith.constant 11 : i64
      %5354 = func.call @cc_make_string(%5352, %5353) : (!llvm.ptr, i64) -> i64
      %5355 = func.call @cc_intern(%5351, %5354) : (i64, i64) -> i64
      %5356 = func.call @cc_nil_value() : () -> i64
      %5357 = func.call @cc_cons(%5355, %5356) : (i64, i64) -> i64
      %5358 = func.call @cc_values_pack(%5357) : (i64) -> i64
      func.call @stack_push_pointer(%5355) : (i64) -> ()
      %5359 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5359) : (i64) -> ()
      %5360 = llvm.mlir.addressof @str536 : !llvm.ptr
      %5361 = arith.constant 11 : i64
      %5362 = func.call @cc_make_string(%5360, %5361) : (!llvm.ptr, i64) -> i64
      %5363 = llvm.mlir.addressof @str537 : !llvm.ptr
      %5364 = arith.constant 11 : i64
      %5365 = func.call @cc_make_string(%5363, %5364) : (!llvm.ptr, i64) -> i64
      %5366 = func.call @cc_intern(%5362, %5365) : (i64, i64) -> i64
      %5367 = func.call @cc_nil_value() : () -> i64
      %5368 = func.call @cc_cons(%5366, %5367) : (i64, i64) -> i64
      %5369 = func.call @cc_values_pack(%5368) : (i64) -> i64
      func.call @stack_push_pointer(%5366) : (i64) -> ()
      %5370 = func.call @stack_pop_pointer() : () -> i64
      %5371 = func.call @stack_pop_pointer() : () -> i64
      %5372 = func.call @cc_cons(%5370, %5371) : (i64, i64) -> i64
      %5373 = llvm.mlir.addressof @str538 : !llvm.ptr
      %5374 = arith.constant 5 : i64
      %5375 = func.call @cc_make_string(%5373, %5374) : (!llvm.ptr, i64) -> i64
      %5376 = func.call @cc_nil_value() : () -> i64
      %5377 = func.call @cc_intern(%5375, %5376) : (i64, i64) -> i64
      %5378 = func.call @cc_nil_value() : () -> i64
      %5379 = func.call @cc_cons(%5377, %5378) : (i64, i64) -> i64
      %5380 = func.call @cc_values_pack(%5379) : (i64) -> i64
      %5381 = func.call @cc_cons(%5377, %5372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5382 = func.call @stack_pop_pointer() : () -> i64
      %5383 = func.call @stack_pop_pointer() : () -> i64
      %5384 = func.call @cc_cons(%5383, %5382) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5384) : (i64) -> ()
      %5385 = func.call @stack_pop_pointer() : () -> i64
      %5386 = func.call @stack_pop_pointer() : () -> i64
      %5387 = func.call @cc_cons(%5386, %5385) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5387) : (i64) -> ()
      %5388 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5388) : (i64) -> ()
      %5389 = llvm.mlir.addressof @str539 : !llvm.ptr
      %5390 = arith.constant 11 : i64
      %5391 = func.call @cc_make_string(%5389, %5390) : (!llvm.ptr, i64) -> i64
      %5392 = llvm.mlir.addressof @str540 : !llvm.ptr
      %5393 = arith.constant 11 : i64
      %5394 = func.call @cc_make_string(%5392, %5393) : (!llvm.ptr, i64) -> i64
      %5395 = func.call @cc_intern(%5391, %5394) : (i64, i64) -> i64
      %5396 = func.call @cc_nil_value() : () -> i64
      %5397 = func.call @cc_cons(%5395, %5396) : (i64, i64) -> i64
      %5398 = func.call @cc_values_pack(%5397) : (i64) -> i64
      func.call @stack_push_pointer(%5395) : (i64) -> ()
      %5399 = func.call @stack_pop_pointer() : () -> i64
      %5400 = func.call @stack_pop_pointer() : () -> i64
      %5401 = func.call @cc_cons(%5399, %5400) : (i64, i64) -> i64
      %5402 = llvm.mlir.addressof @str541 : !llvm.ptr
      %5403 = arith.constant 5 : i64
      %5404 = func.call @cc_make_string(%5402, %5403) : (!llvm.ptr, i64) -> i64
      %5405 = func.call @cc_nil_value() : () -> i64
      %5406 = func.call @cc_intern(%5404, %5405) : (i64, i64) -> i64
      %5407 = func.call @cc_nil_value() : () -> i64
      %5408 = func.call @cc_cons(%5406, %5407) : (i64, i64) -> i64
      %5409 = func.call @cc_values_pack(%5408) : (i64) -> i64
      %5410 = func.call @cc_cons(%5406, %5401) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5410) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5411 = func.call @stack_pop_pointer() : () -> i64
      %5412 = func.call @stack_pop_pointer() : () -> i64
      %5413 = func.call @cc_cons(%5412, %5411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5413) : (i64) -> ()
      %5414 = func.call @stack_pop_pointer() : () -> i64
      %5415 = func.call @stack_pop_pointer() : () -> i64
      %5416 = func.call @cc_cons(%5415, %5414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5416) : (i64) -> ()
      %5417 = func.call @stack_pop_pointer() : () -> i64
      %5418 = func.call @stack_pop_pointer() : () -> i64
      %5419 = func.call @cc_cons(%5418, %5417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5419) : (i64) -> ()
      %5420 = llvm.mlir.addressof @str542 : !llvm.ptr
      %5421 = arith.constant 3 : i64
      %5422 = func.call @cc_make_string(%5420, %5421) : (!llvm.ptr, i64) -> i64
      %5423 = llvm.mlir.addressof @str543 : !llvm.ptr
      %5424 = arith.constant 11 : i64
      %5425 = func.call @cc_make_string(%5423, %5424) : (!llvm.ptr, i64) -> i64
      %5426 = func.call @cc_intern(%5422, %5425) : (i64, i64) -> i64
      %5427 = func.call @cc_nil_value() : () -> i64
      %5428 = func.call @cc_cons(%5426, %5427) : (i64, i64) -> i64
      %5429 = func.call @cc_values_pack(%5428) : (i64) -> i64
      func.call @stack_push_pointer(%5426) : (i64) -> ()
      %5430 = llvm.mlir.addressof @str544 : !llvm.ptr
      %5431 = arith.constant 2 : i64
      %5432 = func.call @cc_make_string(%5430, %5431) : (!llvm.ptr, i64) -> i64
      %5433 = llvm.mlir.addressof @str545 : !llvm.ptr
      %5434 = arith.constant 11 : i64
      %5435 = func.call @cc_make_string(%5433, %5434) : (!llvm.ptr, i64) -> i64
      %5436 = func.call @cc_intern(%5432, %5435) : (i64, i64) -> i64
      %5437 = func.call @cc_nil_value() : () -> i64
      %5438 = func.call @cc_cons(%5436, %5437) : (i64, i64) -> i64
      %5439 = func.call @cc_values_pack(%5438) : (i64) -> i64
      func.call @stack_push_pointer(%5436) : (i64) -> ()
      %5440 = llvm.mlir.addressof @str546 : !llvm.ptr
      %5441 = arith.constant 2 : i64
      %5442 = func.call @cc_make_string(%5440, %5441) : (!llvm.ptr, i64) -> i64
      %5443 = llvm.mlir.addressof @str547 : !llvm.ptr
      %5444 = arith.constant 11 : i64
      %5445 = func.call @cc_make_string(%5443, %5444) : (!llvm.ptr, i64) -> i64
      %5446 = func.call @cc_intern(%5442, %5445) : (i64, i64) -> i64
      %5447 = func.call @cc_nil_value() : () -> i64
      %5448 = func.call @cc_cons(%5446, %5447) : (i64, i64) -> i64
      %5449 = func.call @cc_values_pack(%5448) : (i64) -> i64
      func.call @stack_push_pointer(%5446) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5450 = func.call @stack_pop_pointer() : () -> i64
      %5451 = func.call @stack_pop_pointer() : () -> i64
      %5452 = func.call @cc_cons(%5451, %5450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5452) : (i64) -> ()
      %5453 = func.call @stack_pop_pointer() : () -> i64
      %5454 = func.call @stack_pop_pointer() : () -> i64
      %5455 = func.call @cc_cons(%5454, %5453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5455) : (i64) -> ()
      %5456 = func.call @stack_pop_pointer() : () -> i64
      %5457 = func.call @stack_pop_pointer() : () -> i64
      %5458 = func.call @cc_cons(%5457, %5456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5458) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5459 = func.call @stack_pop_pointer() : () -> i64
      %5460 = func.call @stack_pop_pointer() : () -> i64
      %5461 = func.call @cc_cons(%5460, %5459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5461) : (i64) -> ()
      %5462 = func.call @stack_pop_pointer() : () -> i64
      %5463 = func.call @stack_pop_pointer() : () -> i64
      %5464 = func.call @cc_cons(%5463, %5462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5464) : (i64) -> ()
      %5465 = func.call @stack_pop_pointer() : () -> i64
      %5466 = func.call @stack_pop_pointer() : () -> i64
      %5467 = func.call @cc_cons(%5466, %5465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5467) : (i64) -> ()
      %5468 = func.call @stack_pop_pointer() : () -> i64
      %5469 = func.call @stack_pop_pointer() : () -> i64
      %5470 = func.call @cc_cons(%5469, %5468) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5470) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5471 = func.call @stack_pop_pointer() : () -> i64
      %5472 = func.call @stack_pop_pointer() : () -> i64
      %5473 = func.call @cc_cons(%5472, %5471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5473) : (i64) -> ()
      %5474 = func.call @stack_pop_pointer() : () -> i64
      %5475 = func.call @stack_pop_pointer() : () -> i64
      %5476 = func.call @cc_cons(%5475, %5474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5476) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5477 = func.call @stack_pop_pointer() : () -> i64
      %5478 = func.call @stack_pop_pointer() : () -> i64
      %5479 = func.call @cc_cons(%5478, %5477) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5479) : (i64) -> ()
      %5480 = func.call @stack_pop_pointer() : () -> i64
      %5481 = func.call @stack_pop_pointer() : () -> i64
      %5482 = func.call @cc_cons(%5481, %5480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5482) : (i64) -> ()
      %5483 = func.call @stack_pop_pointer() : () -> i64
      %5546 = arith.constant 206494159077399 : i64
      %5547 = arith.constant 0 : i64
      %5548 = func.call @cc_make_closure(%5546, %5547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5548) : (i64) -> ()
      %5549 = func.call @stack_pop_pointer() : () -> i64
      %5550 = llvm.mlir.addressof @str553 : !llvm.ptr
      %5551 = arith.constant 1 : i64
      %5552 = func.call @cc_make_string(%5550, %5551) : (!llvm.ptr, i64) -> i64
      %5553 = func.call @cc_nil_value() : () -> i64
      %5554 = func.call @cc_intern(%5552, %5553) : (i64, i64) -> i64
      %5555 = func.call @cc_nil_value() : () -> i64
      %5556 = func.call @cc_cons(%5554, %5555) : (i64, i64) -> i64
      %5557 = func.call @cc_values_pack(%5556) : (i64) -> i64
      func.call @stack_push_pointer(%5554) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5558 = func.call @stack_pop_pointer() : () -> i64
      %5559 = func.call @stack_pop_pointer() : () -> i64
      %5560 = func.call @cc_cons(%5559, %5558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5560) : (i64) -> ()
      %5561 = func.call @stack_pop_pointer() : () -> i64
      %5562 = llvm.mlir.addressof @str554 : !llvm.ptr
      %5563 = arith.constant 11 : i64
      %5564 = func.call @cc_make_string(%5562, %5563) : (!llvm.ptr, i64) -> i64
      %5565 = llvm.mlir.addressof @str555 : !llvm.ptr
      %5566 = arith.constant 7 : i64
      %5567 = func.call @cc_make_string(%5565, %5566) : (!llvm.ptr, i64) -> i64
      %5568 = func.call @cc_intern(%5564, %5567) : (i64, i64) -> i64
      %5569 = func.call @cc_nil_value() : () -> i64
      %5570 = func.call @cc_cons(%5568, %5569) : (i64, i64) -> i64
      %5571 = func.call @cc_values_pack(%5570) : (i64) -> i64
      func.call @stack_push_pointer(%5568) : (i64) -> ()
      %5572 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5573 = func.call @stack_pop_pointer() : () -> i64
      %5574 = llvm.mlir.addressof @str556 : !llvm.ptr
      %5575 = arith.constant 4 : i64
      %5576 = func.call @cc_make_string(%5574, %5575) : (!llvm.ptr, i64) -> i64
      %5577 = llvm.mlir.addressof @str557 : !llvm.ptr
      %5578 = arith.constant 7 : i64
      %5579 = func.call @cc_make_string(%5577, %5578) : (!llvm.ptr, i64) -> i64
      %5580 = func.call @cc_intern(%5576, %5579) : (i64, i64) -> i64
      %5581 = func.call @cc_nil_value() : () -> i64
      %5582 = func.call @cc_cons(%5580, %5581) : (i64, i64) -> i64
      %5583 = func.call @cc_values_pack(%5582) : (i64) -> i64
      func.call @stack_push_pointer(%5580) : (i64) -> ()
      %5584 = func.call @stack_pop_pointer() : () -> i64
      %5585 = llvm.mlir.addressof @str558 : !llvm.ptr
      %5586 = arith.constant 6 : i64
      %5587 = func.call @cc_make_string(%5585, %5586) : (!llvm.ptr, i64) -> i64
      %5588 = func.call @cc_nil_value() : () -> i64
      %5589 = func.call @cc_intern(%5587, %5588) : (i64, i64) -> i64
      %5590 = func.call @cc_nil_value() : () -> i64
      %5591 = func.call @cc_cons(%5589, %5590) : (i64, i64) -> i64
      %5592 = func.call @cc_values_pack(%5591) : (i64) -> i64
      func.call @stack_push_pointer(%5589) : (i64) -> ()
      %5593 = func.call @stack_pop_pointer() : () -> i64
      %5594 = func.call @cc_nil_value() : () -> i64
      %5595 = func.call @cc_errorp(%5286) : (i64) -> i64
      %5596 = arith.cmpi ne, %5595, %5594 : i64
      %5597 = arith.cmpi eq, %5594, %5594 : i64
      %5598 = arith.andi %5596, %5597 : i1
      %5599 = scf.if %5598 -> (i64) {
        scf.yield %5286 : i64
      } else {
        scf.yield %5594 : i64
      }
      %5600 = func.call @cc_errorp(%5483) : (i64) -> i64
      %5601 = arith.cmpi ne, %5600, %5594 : i64
      %5602 = arith.cmpi eq, %5599, %5594 : i64
      %5603 = arith.andi %5601, %5602 : i1
      %5604 = scf.if %5603 -> (i64) {
        scf.yield %5483 : i64
      } else {
        scf.yield %5599 : i64
      }
      %5605 = func.call @cc_errorp(%5549) : (i64) -> i64
      %5606 = arith.cmpi ne, %5605, %5594 : i64
      %5607 = arith.cmpi eq, %5604, %5594 : i64
      %5608 = arith.andi %5606, %5607 : i1
      %5609 = scf.if %5608 -> (i64) {
        scf.yield %5549 : i64
      } else {
        scf.yield %5604 : i64
      }
      %5610 = func.call @cc_errorp(%5561) : (i64) -> i64
      %5611 = arith.cmpi ne, %5610, %5594 : i64
      %5612 = arith.cmpi eq, %5609, %5594 : i64
      %5613 = arith.andi %5611, %5612 : i1
      %5614 = scf.if %5613 -> (i64) {
        scf.yield %5561 : i64
      } else {
        scf.yield %5609 : i64
      }
      %5615 = func.call @cc_errorp(%5572) : (i64) -> i64
      %5616 = arith.cmpi ne, %5615, %5594 : i64
      %5617 = arith.cmpi eq, %5614, %5594 : i64
      %5618 = arith.andi %5616, %5617 : i1
      %5619 = scf.if %5618 -> (i64) {
        scf.yield %5572 : i64
      } else {
        scf.yield %5614 : i64
      }
      %5620 = func.call @cc_errorp(%5573) : (i64) -> i64
      %5621 = arith.cmpi ne, %5620, %5594 : i64
      %5622 = arith.cmpi eq, %5619, %5594 : i64
      %5623 = arith.andi %5621, %5622 : i1
      %5624 = scf.if %5623 -> (i64) {
        scf.yield %5573 : i64
      } else {
        scf.yield %5619 : i64
      }
      %5625 = func.call @cc_errorp(%5584) : (i64) -> i64
      %5626 = arith.cmpi ne, %5625, %5594 : i64
      %5627 = arith.cmpi eq, %5624, %5594 : i64
      %5628 = arith.andi %5626, %5627 : i1
      %5629 = scf.if %5628 -> (i64) {
        scf.yield %5584 : i64
      } else {
        scf.yield %5624 : i64
      }
      %5630 = func.call @cc_errorp(%5593) : (i64) -> i64
      %5631 = arith.cmpi ne, %5630, %5594 : i64
      %5632 = arith.cmpi eq, %5629, %5594 : i64
      %5633 = arith.andi %5631, %5632 : i1
      %5634 = scf.if %5633 -> (i64) {
        scf.yield %5593 : i64
      } else {
        scf.yield %5629 : i64
      }
      %5635 = arith.cmpi ne, %5634, %5594 : i64
      scf.if %5635 {
        func.call @stack_push_pointer(%5634) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5286) : (i64) -> ()
        func.call @stack_push_pointer(%5483) : (i64) -> ()
        func.call @stack_push_pointer(%5549) : (i64) -> ()
        func.call @stack_push_pointer(%5561) : (i64) -> ()
        func.call @stack_push_pointer(%5572) : (i64) -> ()
        func.call @stack_push_pointer(%5573) : (i64) -> ()
        func.call @stack_push_pointer(%5584) : (i64) -> ()
        func.call @stack_push_pointer(%5593) : (i64) -> ()
        %5636 = llvm.mlir.addressof @str559 : !llvm.ptr
        %5637 = func.call @cc_make_function_ref_const(%5636) : (!llvm.ptr) -> i64
        %5638 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5637, %5638) : (i64, i64) -> ()
      }
      %5639 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5639 : i64
    }
    %5640 = func.call @cc_nil_value() : () -> i64
    %5641 = func.call @cc_errorp(%5277) : (i64) -> i64
    %5642 = arith.cmpi ne, %5641, %5640 : i64
    %5643 = scf.if %5642 -> (i64) {
      scf.yield %5277 : i64
    } else {
      %5644 = llvm.mlir.addressof @str560 : !llvm.ptr
      %5645 = arith.constant 18 : i64
      %5646 = func.call @cc_make_string(%5644, %5645) : (!llvm.ptr, i64) -> i64
      %5647 = func.call @cc_nil_value() : () -> i64
      %5648 = func.call @cc_intern(%5646, %5647) : (i64, i64) -> i64
      %5649 = func.call @cc_nil_value() : () -> i64
      %5650 = func.call @cc_cons(%5648, %5649) : (i64, i64) -> i64
      %5651 = func.call @cc_values_pack(%5650) : (i64) -> i64
      func.call @stack_push_pointer(%5648) : (i64) -> ()
      %5652 = func.call @stack_pop_pointer() : () -> i64
      %5653 = llvm.mlir.addressof @str561 : !llvm.ptr
      %5654 = arith.constant 3 : i64
      %5655 = func.call @cc_make_string(%5653, %5654) : (!llvm.ptr, i64) -> i64
      %5656 = func.call @cc_nil_value() : () -> i64
      %5657 = func.call @cc_intern(%5655, %5656) : (i64, i64) -> i64
      %5658 = func.call @cc_nil_value() : () -> i64
      %5659 = func.call @cc_cons(%5657, %5658) : (i64, i64) -> i64
      %5660 = func.call @cc_values_pack(%5659) : (i64) -> i64
      func.call @stack_push_pointer(%5657) : (i64) -> ()
      %5661 = llvm.mlir.addressof @str562 : !llvm.ptr
      %5662 = arith.constant 3 : i64
      %5663 = func.call @cc_make_string(%5661, %5662) : (!llvm.ptr, i64) -> i64
      %5664 = func.call @cc_nil_value() : () -> i64
      %5665 = func.call @cc_intern(%5663, %5664) : (i64, i64) -> i64
      %5666 = func.call @cc_nil_value() : () -> i64
      %5667 = func.call @cc_cons(%5665, %5666) : (i64, i64) -> i64
      %5668 = func.call @cc_values_pack(%5667) : (i64) -> i64
      func.call @stack_push_pointer(%5665) : (i64) -> ()
      %5669 = llvm.mlir.addressof @str563 : !llvm.ptr
      %5670 = arith.constant 19 : i64
      %5671 = func.call @cc_make_string(%5669, %5670) : (!llvm.ptr, i64) -> i64
      %5672 = llvm.mlir.addressof @str564 : !llvm.ptr
      %5673 = arith.constant 11 : i64
      %5674 = func.call @cc_make_string(%5672, %5673) : (!llvm.ptr, i64) -> i64
      %5675 = func.call @cc_intern(%5671, %5674) : (i64, i64) -> i64
      %5676 = func.call @cc_nil_value() : () -> i64
      %5677 = func.call @cc_cons(%5675, %5676) : (i64, i64) -> i64
      %5678 = func.call @cc_values_pack(%5677) : (i64) -> i64
      func.call @stack_push_pointer(%5675) : (i64) -> ()
      %5679 = llvm.mlir.addressof @str565 : !llvm.ptr
      %5680 = arith.constant 2 : i64
      %5681 = func.call @cc_make_string(%5679, %5680) : (!llvm.ptr, i64) -> i64
      %5682 = llvm.mlir.addressof @str566 : !llvm.ptr
      %5683 = arith.constant 11 : i64
      %5684 = func.call @cc_make_string(%5682, %5683) : (!llvm.ptr, i64) -> i64
      %5685 = func.call @cc_intern(%5681, %5684) : (i64, i64) -> i64
      %5686 = func.call @cc_nil_value() : () -> i64
      %5687 = func.call @cc_cons(%5685, %5686) : (i64, i64) -> i64
      %5688 = func.call @cc_values_pack(%5687) : (i64) -> i64
      func.call @stack_push_pointer(%5685) : (i64) -> ()
      %5689 = llvm.mlir.addressof @str567 : !llvm.ptr
      %5690 = arith.constant 2 : i64
      %5691 = func.call @cc_make_string(%5689, %5690) : (!llvm.ptr, i64) -> i64
      %5692 = llvm.mlir.addressof @str568 : !llvm.ptr
      %5693 = arith.constant 11 : i64
      %5694 = func.call @cc_make_string(%5692, %5693) : (!llvm.ptr, i64) -> i64
      %5695 = func.call @cc_intern(%5691, %5694) : (i64, i64) -> i64
      %5696 = func.call @cc_nil_value() : () -> i64
      %5697 = func.call @cc_cons(%5695, %5696) : (i64, i64) -> i64
      %5698 = func.call @cc_values_pack(%5697) : (i64) -> i64
      func.call @stack_push_pointer(%5695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5699 = func.call @stack_pop_pointer() : () -> i64
      %5700 = func.call @stack_pop_pointer() : () -> i64
      %5701 = func.call @cc_cons(%5700, %5699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5701) : (i64) -> ()
      %5702 = func.call @stack_pop_pointer() : () -> i64
      %5703 = func.call @stack_pop_pointer() : () -> i64
      %5704 = func.call @cc_cons(%5703, %5702) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5704) : (i64) -> ()
      %5705 = llvm.mlir.addressof @str569 : !llvm.ptr
      %5706 = arith.constant 8 : i64
      %5707 = func.call @cc_make_string(%5705, %5706) : (!llvm.ptr, i64) -> i64
      %5708 = llvm.mlir.addressof @str570 : !llvm.ptr
      %5709 = arith.constant 11 : i64
      %5710 = func.call @cc_make_string(%5708, %5709) : (!llvm.ptr, i64) -> i64
      %5711 = func.call @cc_intern(%5707, %5710) : (i64, i64) -> i64
      %5712 = func.call @cc_nil_value() : () -> i64
      %5713 = func.call @cc_cons(%5711, %5712) : (i64, i64) -> i64
      %5714 = func.call @cc_values_pack(%5713) : (i64) -> i64
      func.call @stack_push_pointer(%5711) : (i64) -> ()
      %5715 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5715) : (i64) -> ()
      %5716 = llvm.mlir.addressof @str571 : !llvm.ptr
      %5717 = arith.constant 13 : i64
      %5718 = func.call @cc_make_string(%5716, %5717) : (!llvm.ptr, i64) -> i64
      %5719 = llvm.mlir.addressof @str572 : !llvm.ptr
      %5720 = arith.constant 11 : i64
      %5721 = func.call @cc_make_string(%5719, %5720) : (!llvm.ptr, i64) -> i64
      %5722 = func.call @cc_intern(%5718, %5721) : (i64, i64) -> i64
      %5723 = func.call @cc_nil_value() : () -> i64
      %5724 = func.call @cc_cons(%5722, %5723) : (i64, i64) -> i64
      %5725 = func.call @cc_values_pack(%5724) : (i64) -> i64
      func.call @stack_push_pointer(%5722) : (i64) -> ()
      %5726 = func.call @stack_pop_pointer() : () -> i64
      %5727 = func.call @stack_pop_pointer() : () -> i64
      %5728 = func.call @cc_cons(%5726, %5727) : (i64, i64) -> i64
      %5729 = llvm.mlir.addressof @str573 : !llvm.ptr
      %5730 = arith.constant 5 : i64
      %5731 = func.call @cc_make_string(%5729, %5730) : (!llvm.ptr, i64) -> i64
      %5732 = func.call @cc_nil_value() : () -> i64
      %5733 = func.call @cc_intern(%5731, %5732) : (i64, i64) -> i64
      %5734 = func.call @cc_nil_value() : () -> i64
      %5735 = func.call @cc_cons(%5733, %5734) : (i64, i64) -> i64
      %5736 = func.call @cc_values_pack(%5735) : (i64) -> i64
      %5737 = func.call @cc_cons(%5733, %5728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5737) : (i64) -> ()
      %5738 = llvm.mlir.addressof @str574 : !llvm.ptr
      %5739 = arith.constant 10 : i64
      %5740 = func.call @cc_make_string(%5738, %5739) : (!llvm.ptr, i64) -> i64
      %5741 = llvm.mlir.addressof @str575 : !llvm.ptr
      %5742 = arith.constant 11 : i64
      %5743 = func.call @cc_make_string(%5741, %5742) : (!llvm.ptr, i64) -> i64
      %5744 = func.call @cc_intern(%5740, %5743) : (i64, i64) -> i64
      %5745 = func.call @cc_nil_value() : () -> i64
      %5746 = func.call @cc_cons(%5744, %5745) : (i64, i64) -> i64
      %5747 = func.call @cc_values_pack(%5746) : (i64) -> i64
      func.call @stack_push_pointer(%5744) : (i64) -> ()
      %5748 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5748) : (i64) -> ()
      %5749 = llvm.mlir.addressof @str576 : !llvm.ptr
      %5750 = arith.constant 13 : i64
      %5751 = func.call @cc_make_string(%5749, %5750) : (!llvm.ptr, i64) -> i64
      %5752 = llvm.mlir.addressof @str577 : !llvm.ptr
      %5753 = arith.constant 11 : i64
      %5754 = func.call @cc_make_string(%5752, %5753) : (!llvm.ptr, i64) -> i64
      %5755 = func.call @cc_intern(%5751, %5754) : (i64, i64) -> i64
      %5756 = func.call @cc_nil_value() : () -> i64
      %5757 = func.call @cc_cons(%5755, %5756) : (i64, i64) -> i64
      %5758 = func.call @cc_values_pack(%5757) : (i64) -> i64
      func.call @stack_push_pointer(%5755) : (i64) -> ()
      %5759 = func.call @stack_pop_pointer() : () -> i64
      %5760 = func.call @stack_pop_pointer() : () -> i64
      %5761 = func.call @cc_cons(%5759, %5760) : (i64, i64) -> i64
      %5762 = llvm.mlir.addressof @str578 : !llvm.ptr
      %5763 = arith.constant 5 : i64
      %5764 = func.call @cc_make_string(%5762, %5763) : (!llvm.ptr, i64) -> i64
      %5765 = func.call @cc_nil_value() : () -> i64
      %5766 = func.call @cc_intern(%5764, %5765) : (i64, i64) -> i64
      %5767 = func.call @cc_nil_value() : () -> i64
      %5768 = func.call @cc_cons(%5766, %5767) : (i64, i64) -> i64
      %5769 = func.call @cc_values_pack(%5768) : (i64) -> i64
      %5770 = func.call @cc_cons(%5766, %5761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5770) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5771 = func.call @stack_pop_pointer() : () -> i64
      %5772 = func.call @stack_pop_pointer() : () -> i64
      %5773 = func.call @cc_cons(%5772, %5771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5773) : (i64) -> ()
      %5774 = func.call @stack_pop_pointer() : () -> i64
      %5775 = func.call @stack_pop_pointer() : () -> i64
      %5776 = func.call @cc_cons(%5775, %5774) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5776) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5777 = func.call @stack_pop_pointer() : () -> i64
      %5778 = func.call @stack_pop_pointer() : () -> i64
      %5779 = func.call @cc_cons(%5778, %5777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5779) : (i64) -> ()
      %5780 = func.call @stack_pop_pointer() : () -> i64
      %5781 = func.call @stack_pop_pointer() : () -> i64
      %5782 = func.call @cc_cons(%5781, %5780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5782) : (i64) -> ()
      %5783 = func.call @stack_pop_pointer() : () -> i64
      %5784 = func.call @stack_pop_pointer() : () -> i64
      %5785 = func.call @cc_cons(%5784, %5783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5785) : (i64) -> ()
      %5786 = llvm.mlir.addressof @str579 : !llvm.ptr
      %5787 = arith.constant 3 : i64
      %5788 = func.call @cc_make_string(%5786, %5787) : (!llvm.ptr, i64) -> i64
      %5789 = llvm.mlir.addressof @str580 : !llvm.ptr
      %5790 = arith.constant 11 : i64
      %5791 = func.call @cc_make_string(%5789, %5790) : (!llvm.ptr, i64) -> i64
      %5792 = func.call @cc_intern(%5788, %5791) : (i64, i64) -> i64
      %5793 = func.call @cc_nil_value() : () -> i64
      %5794 = func.call @cc_cons(%5792, %5793) : (i64, i64) -> i64
      %5795 = func.call @cc_values_pack(%5794) : (i64) -> i64
      func.call @stack_push_pointer(%5792) : (i64) -> ()
      %5796 = llvm.mlir.addressof @str581 : !llvm.ptr
      %5797 = arith.constant 2 : i64
      %5798 = func.call @cc_make_string(%5796, %5797) : (!llvm.ptr, i64) -> i64
      %5799 = llvm.mlir.addressof @str582 : !llvm.ptr
      %5800 = arith.constant 11 : i64
      %5801 = func.call @cc_make_string(%5799, %5800) : (!llvm.ptr, i64) -> i64
      %5802 = func.call @cc_intern(%5798, %5801) : (i64, i64) -> i64
      %5803 = func.call @cc_nil_value() : () -> i64
      %5804 = func.call @cc_cons(%5802, %5803) : (i64, i64) -> i64
      %5805 = func.call @cc_values_pack(%5804) : (i64) -> i64
      func.call @stack_push_pointer(%5802) : (i64) -> ()
      %5806 = llvm.mlir.addressof @str583 : !llvm.ptr
      %5807 = arith.constant 2 : i64
      %5808 = func.call @cc_make_string(%5806, %5807) : (!llvm.ptr, i64) -> i64
      %5809 = llvm.mlir.addressof @str584 : !llvm.ptr
      %5810 = arith.constant 11 : i64
      %5811 = func.call @cc_make_string(%5809, %5810) : (!llvm.ptr, i64) -> i64
      %5812 = func.call @cc_intern(%5808, %5811) : (i64, i64) -> i64
      %5813 = func.call @cc_nil_value() : () -> i64
      %5814 = func.call @cc_cons(%5812, %5813) : (i64, i64) -> i64
      %5815 = func.call @cc_values_pack(%5814) : (i64) -> i64
      func.call @stack_push_pointer(%5812) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5816 = func.call @stack_pop_pointer() : () -> i64
      %5817 = func.call @stack_pop_pointer() : () -> i64
      %5818 = func.call @cc_cons(%5817, %5816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5818) : (i64) -> ()
      %5819 = func.call @stack_pop_pointer() : () -> i64
      %5820 = func.call @stack_pop_pointer() : () -> i64
      %5821 = func.call @cc_cons(%5820, %5819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5821) : (i64) -> ()
      %5822 = func.call @stack_pop_pointer() : () -> i64
      %5823 = func.call @stack_pop_pointer() : () -> i64
      %5824 = func.call @cc_cons(%5823, %5822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5824) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5825 = func.call @stack_pop_pointer() : () -> i64
      %5826 = func.call @stack_pop_pointer() : () -> i64
      %5827 = func.call @cc_cons(%5826, %5825) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5827) : (i64) -> ()
      %5828 = func.call @stack_pop_pointer() : () -> i64
      %5829 = func.call @stack_pop_pointer() : () -> i64
      %5830 = func.call @cc_cons(%5829, %5828) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5830) : (i64) -> ()
      %5831 = func.call @stack_pop_pointer() : () -> i64
      %5832 = func.call @stack_pop_pointer() : () -> i64
      %5833 = func.call @cc_cons(%5832, %5831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5833) : (i64) -> ()
      %5834 = func.call @stack_pop_pointer() : () -> i64
      %5835 = func.call @stack_pop_pointer() : () -> i64
      %5836 = func.call @cc_cons(%5835, %5834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5836) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5837 = func.call @stack_pop_pointer() : () -> i64
      %5838 = func.call @stack_pop_pointer() : () -> i64
      %5839 = func.call @cc_cons(%5838, %5837) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5839) : (i64) -> ()
      %5840 = func.call @stack_pop_pointer() : () -> i64
      %5841 = func.call @stack_pop_pointer() : () -> i64
      %5842 = func.call @cc_cons(%5841, %5840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5842) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5843 = func.call @stack_pop_pointer() : () -> i64
      %5844 = func.call @stack_pop_pointer() : () -> i64
      %5845 = func.call @cc_cons(%5844, %5843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5845) : (i64) -> ()
      %5846 = func.call @stack_pop_pointer() : () -> i64
      %5847 = func.call @stack_pop_pointer() : () -> i64
      %5848 = func.call @cc_cons(%5847, %5846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5848) : (i64) -> ()
      %5849 = func.call @stack_pop_pointer() : () -> i64
      %5912 = arith.constant 206494159077400 : i64
      %5913 = arith.constant 0 : i64
      %5914 = func.call @cc_make_closure(%5912, %5913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5914) : (i64) -> ()
      %5915 = func.call @stack_pop_pointer() : () -> i64
      %5916 = llvm.mlir.addressof @str590 : !llvm.ptr
      %5917 = arith.constant 1 : i64
      %5918 = func.call @cc_make_string(%5916, %5917) : (!llvm.ptr, i64) -> i64
      %5919 = func.call @cc_nil_value() : () -> i64
      %5920 = func.call @cc_intern(%5918, %5919) : (i64, i64) -> i64
      %5921 = func.call @cc_nil_value() : () -> i64
      %5922 = func.call @cc_cons(%5920, %5921) : (i64, i64) -> i64
      %5923 = func.call @cc_values_pack(%5922) : (i64) -> i64
      func.call @stack_push_pointer(%5920) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5924 = func.call @stack_pop_pointer() : () -> i64
      %5925 = func.call @stack_pop_pointer() : () -> i64
      %5926 = func.call @cc_cons(%5925, %5924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5926) : (i64) -> ()
      %5927 = func.call @stack_pop_pointer() : () -> i64
      %5928 = llvm.mlir.addressof @str591 : !llvm.ptr
      %5929 = arith.constant 11 : i64
      %5930 = func.call @cc_make_string(%5928, %5929) : (!llvm.ptr, i64) -> i64
      %5931 = llvm.mlir.addressof @str592 : !llvm.ptr
      %5932 = arith.constant 7 : i64
      %5933 = func.call @cc_make_string(%5931, %5932) : (!llvm.ptr, i64) -> i64
      %5934 = func.call @cc_intern(%5930, %5933) : (i64, i64) -> i64
      %5935 = func.call @cc_nil_value() : () -> i64
      %5936 = func.call @cc_cons(%5934, %5935) : (i64, i64) -> i64
      %5937 = func.call @cc_values_pack(%5936) : (i64) -> i64
      func.call @stack_push_pointer(%5934) : (i64) -> ()
      %5938 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5939 = func.call @stack_pop_pointer() : () -> i64
      %5940 = llvm.mlir.addressof @str593 : !llvm.ptr
      %5941 = arith.constant 4 : i64
      %5942 = func.call @cc_make_string(%5940, %5941) : (!llvm.ptr, i64) -> i64
      %5943 = llvm.mlir.addressof @str594 : !llvm.ptr
      %5944 = arith.constant 7 : i64
      %5945 = func.call @cc_make_string(%5943, %5944) : (!llvm.ptr, i64) -> i64
      %5946 = func.call @cc_intern(%5942, %5945) : (i64, i64) -> i64
      %5947 = func.call @cc_nil_value() : () -> i64
      %5948 = func.call @cc_cons(%5946, %5947) : (i64, i64) -> i64
      %5949 = func.call @cc_values_pack(%5948) : (i64) -> i64
      func.call @stack_push_pointer(%5946) : (i64) -> ()
      %5950 = func.call @stack_pop_pointer() : () -> i64
      %5951 = llvm.mlir.addressof @str595 : !llvm.ptr
      %5952 = arith.constant 6 : i64
      %5953 = func.call @cc_make_string(%5951, %5952) : (!llvm.ptr, i64) -> i64
      %5954 = func.call @cc_nil_value() : () -> i64
      %5955 = func.call @cc_intern(%5953, %5954) : (i64, i64) -> i64
      %5956 = func.call @cc_nil_value() : () -> i64
      %5957 = func.call @cc_cons(%5955, %5956) : (i64, i64) -> i64
      %5958 = func.call @cc_values_pack(%5957) : (i64) -> i64
      func.call @stack_push_pointer(%5955) : (i64) -> ()
      %5959 = func.call @stack_pop_pointer() : () -> i64
      %5960 = func.call @cc_nil_value() : () -> i64
      %5961 = func.call @cc_errorp(%5652) : (i64) -> i64
      %5962 = arith.cmpi ne, %5961, %5960 : i64
      %5963 = arith.cmpi eq, %5960, %5960 : i64
      %5964 = arith.andi %5962, %5963 : i1
      %5965 = scf.if %5964 -> (i64) {
        scf.yield %5652 : i64
      } else {
        scf.yield %5960 : i64
      }
      %5966 = func.call @cc_errorp(%5849) : (i64) -> i64
      %5967 = arith.cmpi ne, %5966, %5960 : i64
      %5968 = arith.cmpi eq, %5965, %5960 : i64
      %5969 = arith.andi %5967, %5968 : i1
      %5970 = scf.if %5969 -> (i64) {
        scf.yield %5849 : i64
      } else {
        scf.yield %5965 : i64
      }
      %5971 = func.call @cc_errorp(%5915) : (i64) -> i64
      %5972 = arith.cmpi ne, %5971, %5960 : i64
      %5973 = arith.cmpi eq, %5970, %5960 : i64
      %5974 = arith.andi %5972, %5973 : i1
      %5975 = scf.if %5974 -> (i64) {
        scf.yield %5915 : i64
      } else {
        scf.yield %5970 : i64
      }
      %5976 = func.call @cc_errorp(%5927) : (i64) -> i64
      %5977 = arith.cmpi ne, %5976, %5960 : i64
      %5978 = arith.cmpi eq, %5975, %5960 : i64
      %5979 = arith.andi %5977, %5978 : i1
      %5980 = scf.if %5979 -> (i64) {
        scf.yield %5927 : i64
      } else {
        scf.yield %5975 : i64
      }
      %5981 = func.call @cc_errorp(%5938) : (i64) -> i64
      %5982 = arith.cmpi ne, %5981, %5960 : i64
      %5983 = arith.cmpi eq, %5980, %5960 : i64
      %5984 = arith.andi %5982, %5983 : i1
      %5985 = scf.if %5984 -> (i64) {
        scf.yield %5938 : i64
      } else {
        scf.yield %5980 : i64
      }
      %5986 = func.call @cc_errorp(%5939) : (i64) -> i64
      %5987 = arith.cmpi ne, %5986, %5960 : i64
      %5988 = arith.cmpi eq, %5985, %5960 : i64
      %5989 = arith.andi %5987, %5988 : i1
      %5990 = scf.if %5989 -> (i64) {
        scf.yield %5939 : i64
      } else {
        scf.yield %5985 : i64
      }
      %5991 = func.call @cc_errorp(%5950) : (i64) -> i64
      %5992 = arith.cmpi ne, %5991, %5960 : i64
      %5993 = arith.cmpi eq, %5990, %5960 : i64
      %5994 = arith.andi %5992, %5993 : i1
      %5995 = scf.if %5994 -> (i64) {
        scf.yield %5950 : i64
      } else {
        scf.yield %5990 : i64
      }
      %5996 = func.call @cc_errorp(%5959) : (i64) -> i64
      %5997 = arith.cmpi ne, %5996, %5960 : i64
      %5998 = arith.cmpi eq, %5995, %5960 : i64
      %5999 = arith.andi %5997, %5998 : i1
      %6000 = scf.if %5999 -> (i64) {
        scf.yield %5959 : i64
      } else {
        scf.yield %5995 : i64
      }
      %6001 = arith.cmpi ne, %6000, %5960 : i64
      scf.if %6001 {
        func.call @stack_push_pointer(%6000) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5652) : (i64) -> ()
        func.call @stack_push_pointer(%5849) : (i64) -> ()
        func.call @stack_push_pointer(%5915) : (i64) -> ()
        func.call @stack_push_pointer(%5927) : (i64) -> ()
        func.call @stack_push_pointer(%5938) : (i64) -> ()
        func.call @stack_push_pointer(%5939) : (i64) -> ()
        func.call @stack_push_pointer(%5950) : (i64) -> ()
        func.call @stack_push_pointer(%5959) : (i64) -> ()
        %6002 = llvm.mlir.addressof @str596 : !llvm.ptr
        %6003 = func.call @cc_make_function_ref_const(%6002) : (!llvm.ptr) -> i64
        %6004 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6003, %6004) : (i64, i64) -> ()
      }
      %6005 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6005 : i64
    }
    %6006 = func.call @cc_nil_value() : () -> i64
    %6007 = func.call @cc_errorp(%5643) : (i64) -> i64
    %6008 = arith.cmpi ne, %6007, %6006 : i64
    %6009 = scf.if %6008 -> (i64) {
      scf.yield %5643 : i64
    } else {
      %6010 = llvm.mlir.addressof @str597 : !llvm.ptr
      %6011 = arith.constant 18 : i64
      %6012 = func.call @cc_make_string(%6010, %6011) : (!llvm.ptr, i64) -> i64
      %6013 = func.call @cc_nil_value() : () -> i64
      %6014 = func.call @cc_intern(%6012, %6013) : (i64, i64) -> i64
      %6015 = func.call @cc_nil_value() : () -> i64
      %6016 = func.call @cc_cons(%6014, %6015) : (i64, i64) -> i64
      %6017 = func.call @cc_values_pack(%6016) : (i64) -> i64
      func.call @stack_push_pointer(%6014) : (i64) -> ()
      %6018 = func.call @stack_pop_pointer() : () -> i64
      %6019 = llvm.mlir.addressof @str598 : !llvm.ptr
      %6020 = arith.constant 3 : i64
      %6021 = func.call @cc_make_string(%6019, %6020) : (!llvm.ptr, i64) -> i64
      %6022 = func.call @cc_nil_value() : () -> i64
      %6023 = func.call @cc_intern(%6021, %6022) : (i64, i64) -> i64
      %6024 = func.call @cc_nil_value() : () -> i64
      %6025 = func.call @cc_cons(%6023, %6024) : (i64, i64) -> i64
      %6026 = func.call @cc_values_pack(%6025) : (i64) -> i64
      func.call @stack_push_pointer(%6023) : (i64) -> ()
      %6027 = llvm.mlir.addressof @str599 : !llvm.ptr
      %6028 = arith.constant 3 : i64
      %6029 = func.call @cc_make_string(%6027, %6028) : (!llvm.ptr, i64) -> i64
      %6030 = func.call @cc_nil_value() : () -> i64
      %6031 = func.call @cc_intern(%6029, %6030) : (i64, i64) -> i64
      %6032 = func.call @cc_nil_value() : () -> i64
      %6033 = func.call @cc_cons(%6031, %6032) : (i64, i64) -> i64
      %6034 = func.call @cc_values_pack(%6033) : (i64) -> i64
      func.call @stack_push_pointer(%6031) : (i64) -> ()
      %6035 = llvm.mlir.addressof @str600 : !llvm.ptr
      %6036 = arith.constant 19 : i64
      %6037 = func.call @cc_make_string(%6035, %6036) : (!llvm.ptr, i64) -> i64
      %6038 = llvm.mlir.addressof @str601 : !llvm.ptr
      %6039 = arith.constant 11 : i64
      %6040 = func.call @cc_make_string(%6038, %6039) : (!llvm.ptr, i64) -> i64
      %6041 = func.call @cc_intern(%6037, %6040) : (i64, i64) -> i64
      %6042 = func.call @cc_nil_value() : () -> i64
      %6043 = func.call @cc_cons(%6041, %6042) : (i64, i64) -> i64
      %6044 = func.call @cc_values_pack(%6043) : (i64) -> i64
      func.call @stack_push_pointer(%6041) : (i64) -> ()
      %6045 = llvm.mlir.addressof @str602 : !llvm.ptr
      %6046 = arith.constant 2 : i64
      %6047 = func.call @cc_make_string(%6045, %6046) : (!llvm.ptr, i64) -> i64
      %6048 = llvm.mlir.addressof @str603 : !llvm.ptr
      %6049 = arith.constant 11 : i64
      %6050 = func.call @cc_make_string(%6048, %6049) : (!llvm.ptr, i64) -> i64
      %6051 = func.call @cc_intern(%6047, %6050) : (i64, i64) -> i64
      %6052 = func.call @cc_nil_value() : () -> i64
      %6053 = func.call @cc_cons(%6051, %6052) : (i64, i64) -> i64
      %6054 = func.call @cc_values_pack(%6053) : (i64) -> i64
      func.call @stack_push_pointer(%6051) : (i64) -> ()
      %6055 = llvm.mlir.addressof @str604 : !llvm.ptr
      %6056 = arith.constant 2 : i64
      %6057 = func.call @cc_make_string(%6055, %6056) : (!llvm.ptr, i64) -> i64
      %6058 = llvm.mlir.addressof @str605 : !llvm.ptr
      %6059 = arith.constant 11 : i64
      %6060 = func.call @cc_make_string(%6058, %6059) : (!llvm.ptr, i64) -> i64
      %6061 = func.call @cc_intern(%6057, %6060) : (i64, i64) -> i64
      %6062 = func.call @cc_nil_value() : () -> i64
      %6063 = func.call @cc_cons(%6061, %6062) : (i64, i64) -> i64
      %6064 = func.call @cc_values_pack(%6063) : (i64) -> i64
      func.call @stack_push_pointer(%6061) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6065 = func.call @stack_pop_pointer() : () -> i64
      %6066 = func.call @stack_pop_pointer() : () -> i64
      %6067 = func.call @cc_cons(%6066, %6065) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6067) : (i64) -> ()
      %6068 = func.call @stack_pop_pointer() : () -> i64
      %6069 = func.call @stack_pop_pointer() : () -> i64
      %6070 = func.call @cc_cons(%6069, %6068) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6070) : (i64) -> ()
      %6071 = llvm.mlir.addressof @str606 : !llvm.ptr
      %6072 = arith.constant 8 : i64
      %6073 = func.call @cc_make_string(%6071, %6072) : (!llvm.ptr, i64) -> i64
      %6074 = llvm.mlir.addressof @str607 : !llvm.ptr
      %6075 = arith.constant 11 : i64
      %6076 = func.call @cc_make_string(%6074, %6075) : (!llvm.ptr, i64) -> i64
      %6077 = func.call @cc_intern(%6073, %6076) : (i64, i64) -> i64
      %6078 = func.call @cc_nil_value() : () -> i64
      %6079 = func.call @cc_cons(%6077, %6078) : (i64, i64) -> i64
      %6080 = func.call @cc_values_pack(%6079) : (i64) -> i64
      func.call @stack_push_pointer(%6077) : (i64) -> ()
      %6081 = llvm.mlir.addressof @str608 : !llvm.ptr
      %6082 = arith.constant 10 : i64
      %6083 = func.call @cc_make_string(%6081, %6082) : (!llvm.ptr, i64) -> i64
      %6084 = llvm.mlir.addressof @str609 : !llvm.ptr
      %6085 = arith.constant 11 : i64
      %6086 = func.call @cc_make_string(%6084, %6085) : (!llvm.ptr, i64) -> i64
      %6087 = func.call @cc_intern(%6083, %6086) : (i64, i64) -> i64
      %6088 = func.call @cc_nil_value() : () -> i64
      %6089 = func.call @cc_cons(%6087, %6088) : (i64, i64) -> i64
      %6090 = func.call @cc_values_pack(%6089) : (i64) -> i64
      func.call @stack_push_pointer(%6087) : (i64) -> ()
      %6091 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6091) : (i64) -> ()
      %6092 = llvm.mlir.addressof @str610 : !llvm.ptr
      %6093 = arith.constant 13 : i64
      %6094 = func.call @cc_make_string(%6092, %6093) : (!llvm.ptr, i64) -> i64
      %6095 = llvm.mlir.addressof @str611 : !llvm.ptr
      %6096 = arith.constant 11 : i64
      %6097 = func.call @cc_make_string(%6095, %6096) : (!llvm.ptr, i64) -> i64
      %6098 = func.call @cc_intern(%6094, %6097) : (i64, i64) -> i64
      %6099 = func.call @cc_nil_value() : () -> i64
      %6100 = func.call @cc_cons(%6098, %6099) : (i64, i64) -> i64
      %6101 = func.call @cc_values_pack(%6100) : (i64) -> i64
      func.call @stack_push_pointer(%6098) : (i64) -> ()
      %6102 = func.call @stack_pop_pointer() : () -> i64
      %6103 = func.call @stack_pop_pointer() : () -> i64
      %6104 = func.call @cc_cons(%6102, %6103) : (i64, i64) -> i64
      %6105 = llvm.mlir.addressof @str612 : !llvm.ptr
      %6106 = arith.constant 5 : i64
      %6107 = func.call @cc_make_string(%6105, %6106) : (!llvm.ptr, i64) -> i64
      %6108 = func.call @cc_nil_value() : () -> i64
      %6109 = func.call @cc_intern(%6107, %6108) : (i64, i64) -> i64
      %6110 = func.call @cc_nil_value() : () -> i64
      %6111 = func.call @cc_cons(%6109, %6110) : (i64, i64) -> i64
      %6112 = func.call @cc_values_pack(%6111) : (i64) -> i64
      %6113 = func.call @cc_cons(%6109, %6104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6114 = func.call @stack_pop_pointer() : () -> i64
      %6115 = func.call @stack_pop_pointer() : () -> i64
      %6116 = func.call @cc_cons(%6115, %6114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6116) : (i64) -> ()
      %6117 = func.call @stack_pop_pointer() : () -> i64
      %6118 = func.call @stack_pop_pointer() : () -> i64
      %6119 = func.call @cc_cons(%6118, %6117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6119) : (i64) -> ()
      %6120 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6120) : (i64) -> ()
      %6121 = llvm.mlir.addressof @str613 : !llvm.ptr
      %6122 = arith.constant 13 : i64
      %6123 = func.call @cc_make_string(%6121, %6122) : (!llvm.ptr, i64) -> i64
      %6124 = llvm.mlir.addressof @str614 : !llvm.ptr
      %6125 = arith.constant 11 : i64
      %6126 = func.call @cc_make_string(%6124, %6125) : (!llvm.ptr, i64) -> i64
      %6127 = func.call @cc_intern(%6123, %6126) : (i64, i64) -> i64
      %6128 = func.call @cc_nil_value() : () -> i64
      %6129 = func.call @cc_cons(%6127, %6128) : (i64, i64) -> i64
      %6130 = func.call @cc_values_pack(%6129) : (i64) -> i64
      func.call @stack_push_pointer(%6127) : (i64) -> ()
      %6131 = func.call @stack_pop_pointer() : () -> i64
      %6132 = func.call @stack_pop_pointer() : () -> i64
      %6133 = func.call @cc_cons(%6131, %6132) : (i64, i64) -> i64
      %6134 = llvm.mlir.addressof @str615 : !llvm.ptr
      %6135 = arith.constant 5 : i64
      %6136 = func.call @cc_make_string(%6134, %6135) : (!llvm.ptr, i64) -> i64
      %6137 = func.call @cc_nil_value() : () -> i64
      %6138 = func.call @cc_intern(%6136, %6137) : (i64, i64) -> i64
      %6139 = func.call @cc_nil_value() : () -> i64
      %6140 = func.call @cc_cons(%6138, %6139) : (i64, i64) -> i64
      %6141 = func.call @cc_values_pack(%6140) : (i64) -> i64
      %6142 = func.call @cc_cons(%6138, %6133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6142) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6143 = func.call @stack_pop_pointer() : () -> i64
      %6144 = func.call @stack_pop_pointer() : () -> i64
      %6145 = func.call @cc_cons(%6144, %6143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6145) : (i64) -> ()
      %6146 = func.call @stack_pop_pointer() : () -> i64
      %6147 = func.call @stack_pop_pointer() : () -> i64
      %6148 = func.call @cc_cons(%6147, %6146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6148) : (i64) -> ()
      %6149 = func.call @stack_pop_pointer() : () -> i64
      %6150 = func.call @stack_pop_pointer() : () -> i64
      %6151 = func.call @cc_cons(%6150, %6149) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6151) : (i64) -> ()
      %6152 = llvm.mlir.addressof @str616 : !llvm.ptr
      %6153 = arith.constant 3 : i64
      %6154 = func.call @cc_make_string(%6152, %6153) : (!llvm.ptr, i64) -> i64
      %6155 = llvm.mlir.addressof @str617 : !llvm.ptr
      %6156 = arith.constant 11 : i64
      %6157 = func.call @cc_make_string(%6155, %6156) : (!llvm.ptr, i64) -> i64
      %6158 = func.call @cc_intern(%6154, %6157) : (i64, i64) -> i64
      %6159 = func.call @cc_nil_value() : () -> i64
      %6160 = func.call @cc_cons(%6158, %6159) : (i64, i64) -> i64
      %6161 = func.call @cc_values_pack(%6160) : (i64) -> i64
      func.call @stack_push_pointer(%6158) : (i64) -> ()
      %6162 = llvm.mlir.addressof @str618 : !llvm.ptr
      %6163 = arith.constant 2 : i64
      %6164 = func.call @cc_make_string(%6162, %6163) : (!llvm.ptr, i64) -> i64
      %6165 = llvm.mlir.addressof @str619 : !llvm.ptr
      %6166 = arith.constant 11 : i64
      %6167 = func.call @cc_make_string(%6165, %6166) : (!llvm.ptr, i64) -> i64
      %6168 = func.call @cc_intern(%6164, %6167) : (i64, i64) -> i64
      %6169 = func.call @cc_nil_value() : () -> i64
      %6170 = func.call @cc_cons(%6168, %6169) : (i64, i64) -> i64
      %6171 = func.call @cc_values_pack(%6170) : (i64) -> i64
      func.call @stack_push_pointer(%6168) : (i64) -> ()
      %6172 = llvm.mlir.addressof @str620 : !llvm.ptr
      %6173 = arith.constant 2 : i64
      %6174 = func.call @cc_make_string(%6172, %6173) : (!llvm.ptr, i64) -> i64
      %6175 = llvm.mlir.addressof @str621 : !llvm.ptr
      %6176 = arith.constant 11 : i64
      %6177 = func.call @cc_make_string(%6175, %6176) : (!llvm.ptr, i64) -> i64
      %6178 = func.call @cc_intern(%6174, %6177) : (i64, i64) -> i64
      %6179 = func.call @cc_nil_value() : () -> i64
      %6180 = func.call @cc_cons(%6178, %6179) : (i64, i64) -> i64
      %6181 = func.call @cc_values_pack(%6180) : (i64) -> i64
      func.call @stack_push_pointer(%6178) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6182 = func.call @stack_pop_pointer() : () -> i64
      %6183 = func.call @stack_pop_pointer() : () -> i64
      %6184 = func.call @cc_cons(%6183, %6182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6184) : (i64) -> ()
      %6185 = func.call @stack_pop_pointer() : () -> i64
      %6186 = func.call @stack_pop_pointer() : () -> i64
      %6187 = func.call @cc_cons(%6186, %6185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6187) : (i64) -> ()
      %6188 = func.call @stack_pop_pointer() : () -> i64
      %6189 = func.call @stack_pop_pointer() : () -> i64
      %6190 = func.call @cc_cons(%6189, %6188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6190) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6191 = func.call @stack_pop_pointer() : () -> i64
      %6192 = func.call @stack_pop_pointer() : () -> i64
      %6193 = func.call @cc_cons(%6192, %6191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6193) : (i64) -> ()
      %6194 = func.call @stack_pop_pointer() : () -> i64
      %6195 = func.call @stack_pop_pointer() : () -> i64
      %6196 = func.call @cc_cons(%6195, %6194) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6196) : (i64) -> ()
      %6197 = func.call @stack_pop_pointer() : () -> i64
      %6198 = func.call @stack_pop_pointer() : () -> i64
      %6199 = func.call @cc_cons(%6198, %6197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6199) : (i64) -> ()
      %6200 = func.call @stack_pop_pointer() : () -> i64
      %6201 = func.call @stack_pop_pointer() : () -> i64
      %6202 = func.call @cc_cons(%6201, %6200) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6202) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6203 = func.call @stack_pop_pointer() : () -> i64
      %6204 = func.call @stack_pop_pointer() : () -> i64
      %6205 = func.call @cc_cons(%6204, %6203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6205) : (i64) -> ()
      %6206 = func.call @stack_pop_pointer() : () -> i64
      %6207 = func.call @stack_pop_pointer() : () -> i64
      %6208 = func.call @cc_cons(%6207, %6206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6208) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6209 = func.call @stack_pop_pointer() : () -> i64
      %6210 = func.call @stack_pop_pointer() : () -> i64
      %6211 = func.call @cc_cons(%6210, %6209) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6211) : (i64) -> ()
      %6212 = func.call @stack_pop_pointer() : () -> i64
      %6213 = func.call @stack_pop_pointer() : () -> i64
      %6214 = func.call @cc_cons(%6213, %6212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6214) : (i64) -> ()
      %6215 = func.call @stack_pop_pointer() : () -> i64
      %6278 = arith.constant 206494159077401 : i64
      %6279 = arith.constant 0 : i64
      %6280 = func.call @cc_make_closure(%6278, %6279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6280) : (i64) -> ()
      %6281 = func.call @stack_pop_pointer() : () -> i64
      %6282 = llvm.mlir.addressof @str627 : !llvm.ptr
      %6283 = arith.constant 1 : i64
      %6284 = func.call @cc_make_string(%6282, %6283) : (!llvm.ptr, i64) -> i64
      %6285 = func.call @cc_nil_value() : () -> i64
      %6286 = func.call @cc_intern(%6284, %6285) : (i64, i64) -> i64
      %6287 = func.call @cc_nil_value() : () -> i64
      %6288 = func.call @cc_cons(%6286, %6287) : (i64, i64) -> i64
      %6289 = func.call @cc_values_pack(%6288) : (i64) -> i64
      func.call @stack_push_pointer(%6286) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6290 = func.call @stack_pop_pointer() : () -> i64
      %6291 = func.call @stack_pop_pointer() : () -> i64
      %6292 = func.call @cc_cons(%6291, %6290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6292) : (i64) -> ()
      %6293 = func.call @stack_pop_pointer() : () -> i64
      %6294 = llvm.mlir.addressof @str628 : !llvm.ptr
      %6295 = arith.constant 11 : i64
      %6296 = func.call @cc_make_string(%6294, %6295) : (!llvm.ptr, i64) -> i64
      %6297 = llvm.mlir.addressof @str629 : !llvm.ptr
      %6298 = arith.constant 7 : i64
      %6299 = func.call @cc_make_string(%6297, %6298) : (!llvm.ptr, i64) -> i64
      %6300 = func.call @cc_intern(%6296, %6299) : (i64, i64) -> i64
      %6301 = func.call @cc_nil_value() : () -> i64
      %6302 = func.call @cc_cons(%6300, %6301) : (i64, i64) -> i64
      %6303 = func.call @cc_values_pack(%6302) : (i64) -> i64
      func.call @stack_push_pointer(%6300) : (i64) -> ()
      %6304 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6305 = func.call @stack_pop_pointer() : () -> i64
      %6306 = llvm.mlir.addressof @str630 : !llvm.ptr
      %6307 = arith.constant 4 : i64
      %6308 = func.call @cc_make_string(%6306, %6307) : (!llvm.ptr, i64) -> i64
      %6309 = llvm.mlir.addressof @str631 : !llvm.ptr
      %6310 = arith.constant 7 : i64
      %6311 = func.call @cc_make_string(%6309, %6310) : (!llvm.ptr, i64) -> i64
      %6312 = func.call @cc_intern(%6308, %6311) : (i64, i64) -> i64
      %6313 = func.call @cc_nil_value() : () -> i64
      %6314 = func.call @cc_cons(%6312, %6313) : (i64, i64) -> i64
      %6315 = func.call @cc_values_pack(%6314) : (i64) -> i64
      func.call @stack_push_pointer(%6312) : (i64) -> ()
      %6316 = func.call @stack_pop_pointer() : () -> i64
      %6317 = llvm.mlir.addressof @str632 : !llvm.ptr
      %6318 = arith.constant 6 : i64
      %6319 = func.call @cc_make_string(%6317, %6318) : (!llvm.ptr, i64) -> i64
      %6320 = func.call @cc_nil_value() : () -> i64
      %6321 = func.call @cc_intern(%6319, %6320) : (i64, i64) -> i64
      %6322 = func.call @cc_nil_value() : () -> i64
      %6323 = func.call @cc_cons(%6321, %6322) : (i64, i64) -> i64
      %6324 = func.call @cc_values_pack(%6323) : (i64) -> i64
      func.call @stack_push_pointer(%6321) : (i64) -> ()
      %6325 = func.call @stack_pop_pointer() : () -> i64
      %6326 = func.call @cc_nil_value() : () -> i64
      %6327 = func.call @cc_errorp(%6018) : (i64) -> i64
      %6328 = arith.cmpi ne, %6327, %6326 : i64
      %6329 = arith.cmpi eq, %6326, %6326 : i64
      %6330 = arith.andi %6328, %6329 : i1
      %6331 = scf.if %6330 -> (i64) {
        scf.yield %6018 : i64
      } else {
        scf.yield %6326 : i64
      }
      %6332 = func.call @cc_errorp(%6215) : (i64) -> i64
      %6333 = arith.cmpi ne, %6332, %6326 : i64
      %6334 = arith.cmpi eq, %6331, %6326 : i64
      %6335 = arith.andi %6333, %6334 : i1
      %6336 = scf.if %6335 -> (i64) {
        scf.yield %6215 : i64
      } else {
        scf.yield %6331 : i64
      }
      %6337 = func.call @cc_errorp(%6281) : (i64) -> i64
      %6338 = arith.cmpi ne, %6337, %6326 : i64
      %6339 = arith.cmpi eq, %6336, %6326 : i64
      %6340 = arith.andi %6338, %6339 : i1
      %6341 = scf.if %6340 -> (i64) {
        scf.yield %6281 : i64
      } else {
        scf.yield %6336 : i64
      }
      %6342 = func.call @cc_errorp(%6293) : (i64) -> i64
      %6343 = arith.cmpi ne, %6342, %6326 : i64
      %6344 = arith.cmpi eq, %6341, %6326 : i64
      %6345 = arith.andi %6343, %6344 : i1
      %6346 = scf.if %6345 -> (i64) {
        scf.yield %6293 : i64
      } else {
        scf.yield %6341 : i64
      }
      %6347 = func.call @cc_errorp(%6304) : (i64) -> i64
      %6348 = arith.cmpi ne, %6347, %6326 : i64
      %6349 = arith.cmpi eq, %6346, %6326 : i64
      %6350 = arith.andi %6348, %6349 : i1
      %6351 = scf.if %6350 -> (i64) {
        scf.yield %6304 : i64
      } else {
        scf.yield %6346 : i64
      }
      %6352 = func.call @cc_errorp(%6305) : (i64) -> i64
      %6353 = arith.cmpi ne, %6352, %6326 : i64
      %6354 = arith.cmpi eq, %6351, %6326 : i64
      %6355 = arith.andi %6353, %6354 : i1
      %6356 = scf.if %6355 -> (i64) {
        scf.yield %6305 : i64
      } else {
        scf.yield %6351 : i64
      }
      %6357 = func.call @cc_errorp(%6316) : (i64) -> i64
      %6358 = arith.cmpi ne, %6357, %6326 : i64
      %6359 = arith.cmpi eq, %6356, %6326 : i64
      %6360 = arith.andi %6358, %6359 : i1
      %6361 = scf.if %6360 -> (i64) {
        scf.yield %6316 : i64
      } else {
        scf.yield %6356 : i64
      }
      %6362 = func.call @cc_errorp(%6325) : (i64) -> i64
      %6363 = arith.cmpi ne, %6362, %6326 : i64
      %6364 = arith.cmpi eq, %6361, %6326 : i64
      %6365 = arith.andi %6363, %6364 : i1
      %6366 = scf.if %6365 -> (i64) {
        scf.yield %6325 : i64
      } else {
        scf.yield %6361 : i64
      }
      %6367 = arith.cmpi ne, %6366, %6326 : i64
      scf.if %6367 {
        func.call @stack_push_pointer(%6366) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6018) : (i64) -> ()
        func.call @stack_push_pointer(%6215) : (i64) -> ()
        func.call @stack_push_pointer(%6281) : (i64) -> ()
        func.call @stack_push_pointer(%6293) : (i64) -> ()
        func.call @stack_push_pointer(%6304) : (i64) -> ()
        func.call @stack_push_pointer(%6305) : (i64) -> ()
        func.call @stack_push_pointer(%6316) : (i64) -> ()
        func.call @stack_push_pointer(%6325) : (i64) -> ()
        %6368 = llvm.mlir.addressof @str633 : !llvm.ptr
        %6369 = func.call @cc_make_function_ref_const(%6368) : (!llvm.ptr) -> i64
        %6370 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6369, %6370) : (i64, i64) -> ()
      }
      %6371 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6371 : i64
    }
    %6372 = func.call @cc_nil_value() : () -> i64
    %6373 = func.call @cc_errorp(%6009) : (i64) -> i64
    %6374 = arith.cmpi ne, %6373, %6372 : i64
    %6375 = scf.if %6374 -> (i64) {
      scf.yield %6009 : i64
    } else {
      %6376 = llvm.mlir.addressof @str634 : !llvm.ptr
      %6377 = arith.constant 18 : i64
      %6378 = func.call @cc_make_string(%6376, %6377) : (!llvm.ptr, i64) -> i64
      %6379 = func.call @cc_nil_value() : () -> i64
      %6380 = func.call @cc_intern(%6378, %6379) : (i64, i64) -> i64
      %6381 = func.call @cc_nil_value() : () -> i64
      %6382 = func.call @cc_cons(%6380, %6381) : (i64, i64) -> i64
      %6383 = func.call @cc_values_pack(%6382) : (i64) -> i64
      func.call @stack_push_pointer(%6380) : (i64) -> ()
      %6384 = func.call @stack_pop_pointer() : () -> i64
      %6385 = llvm.mlir.addressof @str635 : !llvm.ptr
      %6386 = arith.constant 3 : i64
      %6387 = func.call @cc_make_string(%6385, %6386) : (!llvm.ptr, i64) -> i64
      %6388 = func.call @cc_nil_value() : () -> i64
      %6389 = func.call @cc_intern(%6387, %6388) : (i64, i64) -> i64
      %6390 = func.call @cc_nil_value() : () -> i64
      %6391 = func.call @cc_cons(%6389, %6390) : (i64, i64) -> i64
      %6392 = func.call @cc_values_pack(%6391) : (i64) -> i64
      func.call @stack_push_pointer(%6389) : (i64) -> ()
      %6393 = llvm.mlir.addressof @str636 : !llvm.ptr
      %6394 = arith.constant 3 : i64
      %6395 = func.call @cc_make_string(%6393, %6394) : (!llvm.ptr, i64) -> i64
      %6396 = func.call @cc_nil_value() : () -> i64
      %6397 = func.call @cc_intern(%6395, %6396) : (i64, i64) -> i64
      %6398 = func.call @cc_nil_value() : () -> i64
      %6399 = func.call @cc_cons(%6397, %6398) : (i64, i64) -> i64
      %6400 = func.call @cc_values_pack(%6399) : (i64) -> i64
      func.call @stack_push_pointer(%6397) : (i64) -> ()
      %6401 = llvm.mlir.addressof @str637 : !llvm.ptr
      %6402 = arith.constant 19 : i64
      %6403 = func.call @cc_make_string(%6401, %6402) : (!llvm.ptr, i64) -> i64
      %6404 = llvm.mlir.addressof @str638 : !llvm.ptr
      %6405 = arith.constant 11 : i64
      %6406 = func.call @cc_make_string(%6404, %6405) : (!llvm.ptr, i64) -> i64
      %6407 = func.call @cc_intern(%6403, %6406) : (i64, i64) -> i64
      %6408 = func.call @cc_nil_value() : () -> i64
      %6409 = func.call @cc_cons(%6407, %6408) : (i64, i64) -> i64
      %6410 = func.call @cc_values_pack(%6409) : (i64) -> i64
      func.call @stack_push_pointer(%6407) : (i64) -> ()
      %6411 = llvm.mlir.addressof @str639 : !llvm.ptr
      %6412 = arith.constant 2 : i64
      %6413 = func.call @cc_make_string(%6411, %6412) : (!llvm.ptr, i64) -> i64
      %6414 = llvm.mlir.addressof @str640 : !llvm.ptr
      %6415 = arith.constant 11 : i64
      %6416 = func.call @cc_make_string(%6414, %6415) : (!llvm.ptr, i64) -> i64
      %6417 = func.call @cc_intern(%6413, %6416) : (i64, i64) -> i64
      %6418 = func.call @cc_nil_value() : () -> i64
      %6419 = func.call @cc_cons(%6417, %6418) : (i64, i64) -> i64
      %6420 = func.call @cc_values_pack(%6419) : (i64) -> i64
      func.call @stack_push_pointer(%6417) : (i64) -> ()
      %6421 = llvm.mlir.addressof @str641 : !llvm.ptr
      %6422 = arith.constant 2 : i64
      %6423 = func.call @cc_make_string(%6421, %6422) : (!llvm.ptr, i64) -> i64
      %6424 = llvm.mlir.addressof @str642 : !llvm.ptr
      %6425 = arith.constant 11 : i64
      %6426 = func.call @cc_make_string(%6424, %6425) : (!llvm.ptr, i64) -> i64
      %6427 = func.call @cc_intern(%6423, %6426) : (i64, i64) -> i64
      %6428 = func.call @cc_nil_value() : () -> i64
      %6429 = func.call @cc_cons(%6427, %6428) : (i64, i64) -> i64
      %6430 = func.call @cc_values_pack(%6429) : (i64) -> i64
      func.call @stack_push_pointer(%6427) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6431 = func.call @stack_pop_pointer() : () -> i64
      %6432 = func.call @stack_pop_pointer() : () -> i64
      %6433 = func.call @cc_cons(%6432, %6431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6433) : (i64) -> ()
      %6434 = func.call @stack_pop_pointer() : () -> i64
      %6435 = func.call @stack_pop_pointer() : () -> i64
      %6436 = func.call @cc_cons(%6435, %6434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6436) : (i64) -> ()
      %6437 = llvm.mlir.addressof @str643 : !llvm.ptr
      %6438 = arith.constant 8 : i64
      %6439 = func.call @cc_make_string(%6437, %6438) : (!llvm.ptr, i64) -> i64
      %6440 = llvm.mlir.addressof @str644 : !llvm.ptr
      %6441 = arith.constant 11 : i64
      %6442 = func.call @cc_make_string(%6440, %6441) : (!llvm.ptr, i64) -> i64
      %6443 = func.call @cc_intern(%6439, %6442) : (i64, i64) -> i64
      %6444 = func.call @cc_nil_value() : () -> i64
      %6445 = func.call @cc_cons(%6443, %6444) : (i64, i64) -> i64
      %6446 = func.call @cc_values_pack(%6445) : (i64) -> i64
      func.call @stack_push_pointer(%6443) : (i64) -> ()
      %6447 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6447) : (i64) -> ()
      %6448 = llvm.mlir.addressof @str645 : !llvm.ptr
      %6449 = arith.constant 18 : i64
      %6450 = func.call @cc_make_string(%6448, %6449) : (!llvm.ptr, i64) -> i64
      %6451 = llvm.mlir.addressof @str646 : !llvm.ptr
      %6452 = arith.constant 11 : i64
      %6453 = func.call @cc_make_string(%6451, %6452) : (!llvm.ptr, i64) -> i64
      %6454 = func.call @cc_intern(%6450, %6453) : (i64, i64) -> i64
      %6455 = func.call @cc_nil_value() : () -> i64
      %6456 = func.call @cc_cons(%6454, %6455) : (i64, i64) -> i64
      %6457 = func.call @cc_values_pack(%6456) : (i64) -> i64
      func.call @stack_push_pointer(%6454) : (i64) -> ()
      %6458 = func.call @stack_pop_pointer() : () -> i64
      %6459 = func.call @stack_pop_pointer() : () -> i64
      %6460 = func.call @cc_cons(%6458, %6459) : (i64, i64) -> i64
      %6461 = llvm.mlir.addressof @str647 : !llvm.ptr
      %6462 = arith.constant 5 : i64
      %6463 = func.call @cc_make_string(%6461, %6462) : (!llvm.ptr, i64) -> i64
      %6464 = func.call @cc_nil_value() : () -> i64
      %6465 = func.call @cc_intern(%6463, %6464) : (i64, i64) -> i64
      %6466 = func.call @cc_nil_value() : () -> i64
      %6467 = func.call @cc_cons(%6465, %6466) : (i64, i64) -> i64
      %6468 = func.call @cc_values_pack(%6467) : (i64) -> i64
      %6469 = func.call @cc_cons(%6465, %6460) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6469) : (i64) -> ()
      %6470 = llvm.mlir.addressof @str648 : !llvm.ptr
      %6471 = arith.constant 10 : i64
      %6472 = func.call @cc_make_string(%6470, %6471) : (!llvm.ptr, i64) -> i64
      %6473 = llvm.mlir.addressof @str649 : !llvm.ptr
      %6474 = arith.constant 11 : i64
      %6475 = func.call @cc_make_string(%6473, %6474) : (!llvm.ptr, i64) -> i64
      %6476 = func.call @cc_intern(%6472, %6475) : (i64, i64) -> i64
      %6477 = func.call @cc_nil_value() : () -> i64
      %6478 = func.call @cc_cons(%6476, %6477) : (i64, i64) -> i64
      %6479 = func.call @cc_values_pack(%6478) : (i64) -> i64
      func.call @stack_push_pointer(%6476) : (i64) -> ()
      %6480 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6480) : (i64) -> ()
      %6481 = llvm.mlir.addressof @str650 : !llvm.ptr
      %6482 = arith.constant 18 : i64
      %6483 = func.call @cc_make_string(%6481, %6482) : (!llvm.ptr, i64) -> i64
      %6484 = llvm.mlir.addressof @str651 : !llvm.ptr
      %6485 = arith.constant 11 : i64
      %6486 = func.call @cc_make_string(%6484, %6485) : (!llvm.ptr, i64) -> i64
      %6487 = func.call @cc_intern(%6483, %6486) : (i64, i64) -> i64
      %6488 = func.call @cc_nil_value() : () -> i64
      %6489 = func.call @cc_cons(%6487, %6488) : (i64, i64) -> i64
      %6490 = func.call @cc_values_pack(%6489) : (i64) -> i64
      func.call @stack_push_pointer(%6487) : (i64) -> ()
      %6491 = func.call @stack_pop_pointer() : () -> i64
      %6492 = func.call @stack_pop_pointer() : () -> i64
      %6493 = func.call @cc_cons(%6491, %6492) : (i64, i64) -> i64
      %6494 = llvm.mlir.addressof @str652 : !llvm.ptr
      %6495 = arith.constant 5 : i64
      %6496 = func.call @cc_make_string(%6494, %6495) : (!llvm.ptr, i64) -> i64
      %6497 = func.call @cc_nil_value() : () -> i64
      %6498 = func.call @cc_intern(%6496, %6497) : (i64, i64) -> i64
      %6499 = func.call @cc_nil_value() : () -> i64
      %6500 = func.call @cc_cons(%6498, %6499) : (i64, i64) -> i64
      %6501 = func.call @cc_values_pack(%6500) : (i64) -> i64
      %6502 = func.call @cc_cons(%6498, %6493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6502) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6503 = func.call @stack_pop_pointer() : () -> i64
      %6504 = func.call @stack_pop_pointer() : () -> i64
      %6505 = func.call @cc_cons(%6504, %6503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6505) : (i64) -> ()
      %6506 = func.call @stack_pop_pointer() : () -> i64
      %6507 = func.call @stack_pop_pointer() : () -> i64
      %6508 = func.call @cc_cons(%6507, %6506) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6508) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6509 = func.call @stack_pop_pointer() : () -> i64
      %6510 = func.call @stack_pop_pointer() : () -> i64
      %6511 = func.call @cc_cons(%6510, %6509) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6511) : (i64) -> ()
      %6512 = func.call @stack_pop_pointer() : () -> i64
      %6513 = func.call @stack_pop_pointer() : () -> i64
      %6514 = func.call @cc_cons(%6513, %6512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6514) : (i64) -> ()
      %6515 = func.call @stack_pop_pointer() : () -> i64
      %6516 = func.call @stack_pop_pointer() : () -> i64
      %6517 = func.call @cc_cons(%6516, %6515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6517) : (i64) -> ()
      %6518 = llvm.mlir.addressof @str653 : !llvm.ptr
      %6519 = arith.constant 3 : i64
      %6520 = func.call @cc_make_string(%6518, %6519) : (!llvm.ptr, i64) -> i64
      %6521 = llvm.mlir.addressof @str654 : !llvm.ptr
      %6522 = arith.constant 11 : i64
      %6523 = func.call @cc_make_string(%6521, %6522) : (!llvm.ptr, i64) -> i64
      %6524 = func.call @cc_intern(%6520, %6523) : (i64, i64) -> i64
      %6525 = func.call @cc_nil_value() : () -> i64
      %6526 = func.call @cc_cons(%6524, %6525) : (i64, i64) -> i64
      %6527 = func.call @cc_values_pack(%6526) : (i64) -> i64
      func.call @stack_push_pointer(%6524) : (i64) -> ()
      %6528 = llvm.mlir.addressof @str655 : !llvm.ptr
      %6529 = arith.constant 2 : i64
      %6530 = func.call @cc_make_string(%6528, %6529) : (!llvm.ptr, i64) -> i64
      %6531 = llvm.mlir.addressof @str656 : !llvm.ptr
      %6532 = arith.constant 11 : i64
      %6533 = func.call @cc_make_string(%6531, %6532) : (!llvm.ptr, i64) -> i64
      %6534 = func.call @cc_intern(%6530, %6533) : (i64, i64) -> i64
      %6535 = func.call @cc_nil_value() : () -> i64
      %6536 = func.call @cc_cons(%6534, %6535) : (i64, i64) -> i64
      %6537 = func.call @cc_values_pack(%6536) : (i64) -> i64
      func.call @stack_push_pointer(%6534) : (i64) -> ()
      %6538 = llvm.mlir.addressof @str657 : !llvm.ptr
      %6539 = arith.constant 2 : i64
      %6540 = func.call @cc_make_string(%6538, %6539) : (!llvm.ptr, i64) -> i64
      %6541 = llvm.mlir.addressof @str658 : !llvm.ptr
      %6542 = arith.constant 11 : i64
      %6543 = func.call @cc_make_string(%6541, %6542) : (!llvm.ptr, i64) -> i64
      %6544 = func.call @cc_intern(%6540, %6543) : (i64, i64) -> i64
      %6545 = func.call @cc_nil_value() : () -> i64
      %6546 = func.call @cc_cons(%6544, %6545) : (i64, i64) -> i64
      %6547 = func.call @cc_values_pack(%6546) : (i64) -> i64
      func.call @stack_push_pointer(%6544) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6548 = func.call @stack_pop_pointer() : () -> i64
      %6549 = func.call @stack_pop_pointer() : () -> i64
      %6550 = func.call @cc_cons(%6549, %6548) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6550) : (i64) -> ()
      %6551 = func.call @stack_pop_pointer() : () -> i64
      %6552 = func.call @stack_pop_pointer() : () -> i64
      %6553 = func.call @cc_cons(%6552, %6551) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6553) : (i64) -> ()
      %6554 = func.call @stack_pop_pointer() : () -> i64
      %6555 = func.call @stack_pop_pointer() : () -> i64
      %6556 = func.call @cc_cons(%6555, %6554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6556) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6557 = func.call @stack_pop_pointer() : () -> i64
      %6558 = func.call @stack_pop_pointer() : () -> i64
      %6559 = func.call @cc_cons(%6558, %6557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6559) : (i64) -> ()
      %6560 = func.call @stack_pop_pointer() : () -> i64
      %6561 = func.call @stack_pop_pointer() : () -> i64
      %6562 = func.call @cc_cons(%6561, %6560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6562) : (i64) -> ()
      %6563 = func.call @stack_pop_pointer() : () -> i64
      %6564 = func.call @stack_pop_pointer() : () -> i64
      %6565 = func.call @cc_cons(%6564, %6563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6565) : (i64) -> ()
      %6566 = func.call @stack_pop_pointer() : () -> i64
      %6567 = func.call @stack_pop_pointer() : () -> i64
      %6568 = func.call @cc_cons(%6567, %6566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6568) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6569 = func.call @stack_pop_pointer() : () -> i64
      %6570 = func.call @stack_pop_pointer() : () -> i64
      %6571 = func.call @cc_cons(%6570, %6569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6571) : (i64) -> ()
      %6572 = func.call @stack_pop_pointer() : () -> i64
      %6573 = func.call @stack_pop_pointer() : () -> i64
      %6574 = func.call @cc_cons(%6573, %6572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6574) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6575 = func.call @stack_pop_pointer() : () -> i64
      %6576 = func.call @stack_pop_pointer() : () -> i64
      %6577 = func.call @cc_cons(%6576, %6575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6577) : (i64) -> ()
      %6578 = func.call @stack_pop_pointer() : () -> i64
      %6579 = func.call @stack_pop_pointer() : () -> i64
      %6580 = func.call @cc_cons(%6579, %6578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6580) : (i64) -> ()
      %6581 = func.call @stack_pop_pointer() : () -> i64
      %6644 = arith.constant 206494159077402 : i64
      %6645 = arith.constant 0 : i64
      %6646 = func.call @cc_make_closure(%6644, %6645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6646) : (i64) -> ()
      %6647 = func.call @stack_pop_pointer() : () -> i64
      %6648 = llvm.mlir.addressof @str664 : !llvm.ptr
      %6649 = arith.constant 1 : i64
      %6650 = func.call @cc_make_string(%6648, %6649) : (!llvm.ptr, i64) -> i64
      %6651 = func.call @cc_nil_value() : () -> i64
      %6652 = func.call @cc_intern(%6650, %6651) : (i64, i64) -> i64
      %6653 = func.call @cc_nil_value() : () -> i64
      %6654 = func.call @cc_cons(%6652, %6653) : (i64, i64) -> i64
      %6655 = func.call @cc_values_pack(%6654) : (i64) -> i64
      func.call @stack_push_pointer(%6652) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6656 = func.call @stack_pop_pointer() : () -> i64
      %6657 = func.call @stack_pop_pointer() : () -> i64
      %6658 = func.call @cc_cons(%6657, %6656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6658) : (i64) -> ()
      %6659 = func.call @stack_pop_pointer() : () -> i64
      %6660 = llvm.mlir.addressof @str665 : !llvm.ptr
      %6661 = arith.constant 11 : i64
      %6662 = func.call @cc_make_string(%6660, %6661) : (!llvm.ptr, i64) -> i64
      %6663 = llvm.mlir.addressof @str666 : !llvm.ptr
      %6664 = arith.constant 7 : i64
      %6665 = func.call @cc_make_string(%6663, %6664) : (!llvm.ptr, i64) -> i64
      %6666 = func.call @cc_intern(%6662, %6665) : (i64, i64) -> i64
      %6667 = func.call @cc_nil_value() : () -> i64
      %6668 = func.call @cc_cons(%6666, %6667) : (i64, i64) -> i64
      %6669 = func.call @cc_values_pack(%6668) : (i64) -> i64
      func.call @stack_push_pointer(%6666) : (i64) -> ()
      %6670 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6671 = func.call @stack_pop_pointer() : () -> i64
      %6672 = llvm.mlir.addressof @str667 : !llvm.ptr
      %6673 = arith.constant 4 : i64
      %6674 = func.call @cc_make_string(%6672, %6673) : (!llvm.ptr, i64) -> i64
      %6675 = llvm.mlir.addressof @str668 : !llvm.ptr
      %6676 = arith.constant 7 : i64
      %6677 = func.call @cc_make_string(%6675, %6676) : (!llvm.ptr, i64) -> i64
      %6678 = func.call @cc_intern(%6674, %6677) : (i64, i64) -> i64
      %6679 = func.call @cc_nil_value() : () -> i64
      %6680 = func.call @cc_cons(%6678, %6679) : (i64, i64) -> i64
      %6681 = func.call @cc_values_pack(%6680) : (i64) -> i64
      func.call @stack_push_pointer(%6678) : (i64) -> ()
      %6682 = func.call @stack_pop_pointer() : () -> i64
      %6683 = llvm.mlir.addressof @str669 : !llvm.ptr
      %6684 = arith.constant 6 : i64
      %6685 = func.call @cc_make_string(%6683, %6684) : (!llvm.ptr, i64) -> i64
      %6686 = func.call @cc_nil_value() : () -> i64
      %6687 = func.call @cc_intern(%6685, %6686) : (i64, i64) -> i64
      %6688 = func.call @cc_nil_value() : () -> i64
      %6689 = func.call @cc_cons(%6687, %6688) : (i64, i64) -> i64
      %6690 = func.call @cc_values_pack(%6689) : (i64) -> i64
      func.call @stack_push_pointer(%6687) : (i64) -> ()
      %6691 = func.call @stack_pop_pointer() : () -> i64
      %6692 = func.call @cc_nil_value() : () -> i64
      %6693 = func.call @cc_errorp(%6384) : (i64) -> i64
      %6694 = arith.cmpi ne, %6693, %6692 : i64
      %6695 = arith.cmpi eq, %6692, %6692 : i64
      %6696 = arith.andi %6694, %6695 : i1
      %6697 = scf.if %6696 -> (i64) {
        scf.yield %6384 : i64
      } else {
        scf.yield %6692 : i64
      }
      %6698 = func.call @cc_errorp(%6581) : (i64) -> i64
      %6699 = arith.cmpi ne, %6698, %6692 : i64
      %6700 = arith.cmpi eq, %6697, %6692 : i64
      %6701 = arith.andi %6699, %6700 : i1
      %6702 = scf.if %6701 -> (i64) {
        scf.yield %6581 : i64
      } else {
        scf.yield %6697 : i64
      }
      %6703 = func.call @cc_errorp(%6647) : (i64) -> i64
      %6704 = arith.cmpi ne, %6703, %6692 : i64
      %6705 = arith.cmpi eq, %6702, %6692 : i64
      %6706 = arith.andi %6704, %6705 : i1
      %6707 = scf.if %6706 -> (i64) {
        scf.yield %6647 : i64
      } else {
        scf.yield %6702 : i64
      }
      %6708 = func.call @cc_errorp(%6659) : (i64) -> i64
      %6709 = arith.cmpi ne, %6708, %6692 : i64
      %6710 = arith.cmpi eq, %6707, %6692 : i64
      %6711 = arith.andi %6709, %6710 : i1
      %6712 = scf.if %6711 -> (i64) {
        scf.yield %6659 : i64
      } else {
        scf.yield %6707 : i64
      }
      %6713 = func.call @cc_errorp(%6670) : (i64) -> i64
      %6714 = arith.cmpi ne, %6713, %6692 : i64
      %6715 = arith.cmpi eq, %6712, %6692 : i64
      %6716 = arith.andi %6714, %6715 : i1
      %6717 = scf.if %6716 -> (i64) {
        scf.yield %6670 : i64
      } else {
        scf.yield %6712 : i64
      }
      %6718 = func.call @cc_errorp(%6671) : (i64) -> i64
      %6719 = arith.cmpi ne, %6718, %6692 : i64
      %6720 = arith.cmpi eq, %6717, %6692 : i64
      %6721 = arith.andi %6719, %6720 : i1
      %6722 = scf.if %6721 -> (i64) {
        scf.yield %6671 : i64
      } else {
        scf.yield %6717 : i64
      }
      %6723 = func.call @cc_errorp(%6682) : (i64) -> i64
      %6724 = arith.cmpi ne, %6723, %6692 : i64
      %6725 = arith.cmpi eq, %6722, %6692 : i64
      %6726 = arith.andi %6724, %6725 : i1
      %6727 = scf.if %6726 -> (i64) {
        scf.yield %6682 : i64
      } else {
        scf.yield %6722 : i64
      }
      %6728 = func.call @cc_errorp(%6691) : (i64) -> i64
      %6729 = arith.cmpi ne, %6728, %6692 : i64
      %6730 = arith.cmpi eq, %6727, %6692 : i64
      %6731 = arith.andi %6729, %6730 : i1
      %6732 = scf.if %6731 -> (i64) {
        scf.yield %6691 : i64
      } else {
        scf.yield %6727 : i64
      }
      %6733 = arith.cmpi ne, %6732, %6692 : i64
      scf.if %6733 {
        func.call @stack_push_pointer(%6732) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6384) : (i64) -> ()
        func.call @stack_push_pointer(%6581) : (i64) -> ()
        func.call @stack_push_pointer(%6647) : (i64) -> ()
        func.call @stack_push_pointer(%6659) : (i64) -> ()
        func.call @stack_push_pointer(%6670) : (i64) -> ()
        func.call @stack_push_pointer(%6671) : (i64) -> ()
        func.call @stack_push_pointer(%6682) : (i64) -> ()
        func.call @stack_push_pointer(%6691) : (i64) -> ()
        %6734 = llvm.mlir.addressof @str670 : !llvm.ptr
        %6735 = func.call @cc_make_function_ref_const(%6734) : (!llvm.ptr) -> i64
        %6736 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6735, %6736) : (i64, i64) -> ()
      }
      %6737 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6737 : i64
    }
    %6738 = func.call @cc_nil_value() : () -> i64
    %6739 = func.call @cc_errorp(%6375) : (i64) -> i64
    %6740 = arith.cmpi ne, %6739, %6738 : i64
    %6741 = scf.if %6740 -> (i64) {
      scf.yield %6375 : i64
    } else {
      %6742 = llvm.mlir.addressof @str671 : !llvm.ptr
      %6743 = arith.constant 18 : i64
      %6744 = func.call @cc_make_string(%6742, %6743) : (!llvm.ptr, i64) -> i64
      %6745 = func.call @cc_nil_value() : () -> i64
      %6746 = func.call @cc_intern(%6744, %6745) : (i64, i64) -> i64
      %6747 = func.call @cc_nil_value() : () -> i64
      %6748 = func.call @cc_cons(%6746, %6747) : (i64, i64) -> i64
      %6749 = func.call @cc_values_pack(%6748) : (i64) -> i64
      func.call @stack_push_pointer(%6746) : (i64) -> ()
      %6750 = func.call @stack_pop_pointer() : () -> i64
      %6751 = llvm.mlir.addressof @str672 : !llvm.ptr
      %6752 = arith.constant 3 : i64
      %6753 = func.call @cc_make_string(%6751, %6752) : (!llvm.ptr, i64) -> i64
      %6754 = func.call @cc_nil_value() : () -> i64
      %6755 = func.call @cc_intern(%6753, %6754) : (i64, i64) -> i64
      %6756 = func.call @cc_nil_value() : () -> i64
      %6757 = func.call @cc_cons(%6755, %6756) : (i64, i64) -> i64
      %6758 = func.call @cc_values_pack(%6757) : (i64) -> i64
      func.call @stack_push_pointer(%6755) : (i64) -> ()
      %6759 = llvm.mlir.addressof @str673 : !llvm.ptr
      %6760 = arith.constant 3 : i64
      %6761 = func.call @cc_make_string(%6759, %6760) : (!llvm.ptr, i64) -> i64
      %6762 = func.call @cc_nil_value() : () -> i64
      %6763 = func.call @cc_intern(%6761, %6762) : (i64, i64) -> i64
      %6764 = func.call @cc_nil_value() : () -> i64
      %6765 = func.call @cc_cons(%6763, %6764) : (i64, i64) -> i64
      %6766 = func.call @cc_values_pack(%6765) : (i64) -> i64
      func.call @stack_push_pointer(%6763) : (i64) -> ()
      %6767 = llvm.mlir.addressof @str674 : !llvm.ptr
      %6768 = arith.constant 19 : i64
      %6769 = func.call @cc_make_string(%6767, %6768) : (!llvm.ptr, i64) -> i64
      %6770 = llvm.mlir.addressof @str675 : !llvm.ptr
      %6771 = arith.constant 11 : i64
      %6772 = func.call @cc_make_string(%6770, %6771) : (!llvm.ptr, i64) -> i64
      %6773 = func.call @cc_intern(%6769, %6772) : (i64, i64) -> i64
      %6774 = func.call @cc_nil_value() : () -> i64
      %6775 = func.call @cc_cons(%6773, %6774) : (i64, i64) -> i64
      %6776 = func.call @cc_values_pack(%6775) : (i64) -> i64
      func.call @stack_push_pointer(%6773) : (i64) -> ()
      %6777 = llvm.mlir.addressof @str676 : !llvm.ptr
      %6778 = arith.constant 2 : i64
      %6779 = func.call @cc_make_string(%6777, %6778) : (!llvm.ptr, i64) -> i64
      %6780 = llvm.mlir.addressof @str677 : !llvm.ptr
      %6781 = arith.constant 11 : i64
      %6782 = func.call @cc_make_string(%6780, %6781) : (!llvm.ptr, i64) -> i64
      %6783 = func.call @cc_intern(%6779, %6782) : (i64, i64) -> i64
      %6784 = func.call @cc_nil_value() : () -> i64
      %6785 = func.call @cc_cons(%6783, %6784) : (i64, i64) -> i64
      %6786 = func.call @cc_values_pack(%6785) : (i64) -> i64
      func.call @stack_push_pointer(%6783) : (i64) -> ()
      %6787 = llvm.mlir.addressof @str678 : !llvm.ptr
      %6788 = arith.constant 2 : i64
      %6789 = func.call @cc_make_string(%6787, %6788) : (!llvm.ptr, i64) -> i64
      %6790 = llvm.mlir.addressof @str679 : !llvm.ptr
      %6791 = arith.constant 11 : i64
      %6792 = func.call @cc_make_string(%6790, %6791) : (!llvm.ptr, i64) -> i64
      %6793 = func.call @cc_intern(%6789, %6792) : (i64, i64) -> i64
      %6794 = func.call @cc_nil_value() : () -> i64
      %6795 = func.call @cc_cons(%6793, %6794) : (i64, i64) -> i64
      %6796 = func.call @cc_values_pack(%6795) : (i64) -> i64
      func.call @stack_push_pointer(%6793) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6797 = func.call @stack_pop_pointer() : () -> i64
      %6798 = func.call @stack_pop_pointer() : () -> i64
      %6799 = func.call @cc_cons(%6798, %6797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6799) : (i64) -> ()
      %6800 = func.call @stack_pop_pointer() : () -> i64
      %6801 = func.call @stack_pop_pointer() : () -> i64
      %6802 = func.call @cc_cons(%6801, %6800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6802) : (i64) -> ()
      %6803 = llvm.mlir.addressof @str680 : !llvm.ptr
      %6804 = arith.constant 8 : i64
      %6805 = func.call @cc_make_string(%6803, %6804) : (!llvm.ptr, i64) -> i64
      %6806 = llvm.mlir.addressof @str681 : !llvm.ptr
      %6807 = arith.constant 11 : i64
      %6808 = func.call @cc_make_string(%6806, %6807) : (!llvm.ptr, i64) -> i64
      %6809 = func.call @cc_intern(%6805, %6808) : (i64, i64) -> i64
      %6810 = func.call @cc_nil_value() : () -> i64
      %6811 = func.call @cc_cons(%6809, %6810) : (i64, i64) -> i64
      %6812 = func.call @cc_values_pack(%6811) : (i64) -> i64
      func.call @stack_push_pointer(%6809) : (i64) -> ()
      %6813 = llvm.mlir.addressof @str682 : !llvm.ptr
      %6814 = arith.constant 10 : i64
      %6815 = func.call @cc_make_string(%6813, %6814) : (!llvm.ptr, i64) -> i64
      %6816 = llvm.mlir.addressof @str683 : !llvm.ptr
      %6817 = arith.constant 11 : i64
      %6818 = func.call @cc_make_string(%6816, %6817) : (!llvm.ptr, i64) -> i64
      %6819 = func.call @cc_intern(%6815, %6818) : (i64, i64) -> i64
      %6820 = func.call @cc_nil_value() : () -> i64
      %6821 = func.call @cc_cons(%6819, %6820) : (i64, i64) -> i64
      %6822 = func.call @cc_values_pack(%6821) : (i64) -> i64
      func.call @stack_push_pointer(%6819) : (i64) -> ()
      %6823 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6823) : (i64) -> ()
      %6824 = llvm.mlir.addressof @str684 : !llvm.ptr
      %6825 = arith.constant 18 : i64
      %6826 = func.call @cc_make_string(%6824, %6825) : (!llvm.ptr, i64) -> i64
      %6827 = llvm.mlir.addressof @str685 : !llvm.ptr
      %6828 = arith.constant 11 : i64
      %6829 = func.call @cc_make_string(%6827, %6828) : (!llvm.ptr, i64) -> i64
      %6830 = func.call @cc_intern(%6826, %6829) : (i64, i64) -> i64
      %6831 = func.call @cc_nil_value() : () -> i64
      %6832 = func.call @cc_cons(%6830, %6831) : (i64, i64) -> i64
      %6833 = func.call @cc_values_pack(%6832) : (i64) -> i64
      func.call @stack_push_pointer(%6830) : (i64) -> ()
      %6834 = func.call @stack_pop_pointer() : () -> i64
      %6835 = func.call @stack_pop_pointer() : () -> i64
      %6836 = func.call @cc_cons(%6834, %6835) : (i64, i64) -> i64
      %6837 = llvm.mlir.addressof @str686 : !llvm.ptr
      %6838 = arith.constant 5 : i64
      %6839 = func.call @cc_make_string(%6837, %6838) : (!llvm.ptr, i64) -> i64
      %6840 = func.call @cc_nil_value() : () -> i64
      %6841 = func.call @cc_intern(%6839, %6840) : (i64, i64) -> i64
      %6842 = func.call @cc_nil_value() : () -> i64
      %6843 = func.call @cc_cons(%6841, %6842) : (i64, i64) -> i64
      %6844 = func.call @cc_values_pack(%6843) : (i64) -> i64
      %6845 = func.call @cc_cons(%6841, %6836) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6845) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6846 = func.call @stack_pop_pointer() : () -> i64
      %6847 = func.call @stack_pop_pointer() : () -> i64
      %6848 = func.call @cc_cons(%6847, %6846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6848) : (i64) -> ()
      %6849 = func.call @stack_pop_pointer() : () -> i64
      %6850 = func.call @stack_pop_pointer() : () -> i64
      %6851 = func.call @cc_cons(%6850, %6849) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6851) : (i64) -> ()
      %6852 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6852) : (i64) -> ()
      %6853 = llvm.mlir.addressof @str687 : !llvm.ptr
      %6854 = arith.constant 18 : i64
      %6855 = func.call @cc_make_string(%6853, %6854) : (!llvm.ptr, i64) -> i64
      %6856 = llvm.mlir.addressof @str688 : !llvm.ptr
      %6857 = arith.constant 11 : i64
      %6858 = func.call @cc_make_string(%6856, %6857) : (!llvm.ptr, i64) -> i64
      %6859 = func.call @cc_intern(%6855, %6858) : (i64, i64) -> i64
      %6860 = func.call @cc_nil_value() : () -> i64
      %6861 = func.call @cc_cons(%6859, %6860) : (i64, i64) -> i64
      %6862 = func.call @cc_values_pack(%6861) : (i64) -> i64
      func.call @stack_push_pointer(%6859) : (i64) -> ()
      %6863 = func.call @stack_pop_pointer() : () -> i64
      %6864 = func.call @stack_pop_pointer() : () -> i64
      %6865 = func.call @cc_cons(%6863, %6864) : (i64, i64) -> i64
      %6866 = llvm.mlir.addressof @str689 : !llvm.ptr
      %6867 = arith.constant 5 : i64
      %6868 = func.call @cc_make_string(%6866, %6867) : (!llvm.ptr, i64) -> i64
      %6869 = func.call @cc_nil_value() : () -> i64
      %6870 = func.call @cc_intern(%6868, %6869) : (i64, i64) -> i64
      %6871 = func.call @cc_nil_value() : () -> i64
      %6872 = func.call @cc_cons(%6870, %6871) : (i64, i64) -> i64
      %6873 = func.call @cc_values_pack(%6872) : (i64) -> i64
      %6874 = func.call @cc_cons(%6870, %6865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6874) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6875 = func.call @stack_pop_pointer() : () -> i64
      %6876 = func.call @stack_pop_pointer() : () -> i64
      %6877 = func.call @cc_cons(%6876, %6875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6877) : (i64) -> ()
      %6878 = func.call @stack_pop_pointer() : () -> i64
      %6879 = func.call @stack_pop_pointer() : () -> i64
      %6880 = func.call @cc_cons(%6879, %6878) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6880) : (i64) -> ()
      %6881 = func.call @stack_pop_pointer() : () -> i64
      %6882 = func.call @stack_pop_pointer() : () -> i64
      %6883 = func.call @cc_cons(%6882, %6881) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6883) : (i64) -> ()
      %6884 = llvm.mlir.addressof @str690 : !llvm.ptr
      %6885 = arith.constant 3 : i64
      %6886 = func.call @cc_make_string(%6884, %6885) : (!llvm.ptr, i64) -> i64
      %6887 = llvm.mlir.addressof @str691 : !llvm.ptr
      %6888 = arith.constant 11 : i64
      %6889 = func.call @cc_make_string(%6887, %6888) : (!llvm.ptr, i64) -> i64
      %6890 = func.call @cc_intern(%6886, %6889) : (i64, i64) -> i64
      %6891 = func.call @cc_nil_value() : () -> i64
      %6892 = func.call @cc_cons(%6890, %6891) : (i64, i64) -> i64
      %6893 = func.call @cc_values_pack(%6892) : (i64) -> i64
      func.call @stack_push_pointer(%6890) : (i64) -> ()
      %6894 = llvm.mlir.addressof @str692 : !llvm.ptr
      %6895 = arith.constant 2 : i64
      %6896 = func.call @cc_make_string(%6894, %6895) : (!llvm.ptr, i64) -> i64
      %6897 = llvm.mlir.addressof @str693 : !llvm.ptr
      %6898 = arith.constant 11 : i64
      %6899 = func.call @cc_make_string(%6897, %6898) : (!llvm.ptr, i64) -> i64
      %6900 = func.call @cc_intern(%6896, %6899) : (i64, i64) -> i64
      %6901 = func.call @cc_nil_value() : () -> i64
      %6902 = func.call @cc_cons(%6900, %6901) : (i64, i64) -> i64
      %6903 = func.call @cc_values_pack(%6902) : (i64) -> i64
      func.call @stack_push_pointer(%6900) : (i64) -> ()
      %6904 = llvm.mlir.addressof @str694 : !llvm.ptr
      %6905 = arith.constant 2 : i64
      %6906 = func.call @cc_make_string(%6904, %6905) : (!llvm.ptr, i64) -> i64
      %6907 = llvm.mlir.addressof @str695 : !llvm.ptr
      %6908 = arith.constant 11 : i64
      %6909 = func.call @cc_make_string(%6907, %6908) : (!llvm.ptr, i64) -> i64
      %6910 = func.call @cc_intern(%6906, %6909) : (i64, i64) -> i64
      %6911 = func.call @cc_nil_value() : () -> i64
      %6912 = func.call @cc_cons(%6910, %6911) : (i64, i64) -> i64
      %6913 = func.call @cc_values_pack(%6912) : (i64) -> i64
      func.call @stack_push_pointer(%6910) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6914 = func.call @stack_pop_pointer() : () -> i64
      %6915 = func.call @stack_pop_pointer() : () -> i64
      %6916 = func.call @cc_cons(%6915, %6914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6916) : (i64) -> ()
      %6917 = func.call @stack_pop_pointer() : () -> i64
      %6918 = func.call @stack_pop_pointer() : () -> i64
      %6919 = func.call @cc_cons(%6918, %6917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6919) : (i64) -> ()
      %6920 = func.call @stack_pop_pointer() : () -> i64
      %6921 = func.call @stack_pop_pointer() : () -> i64
      %6922 = func.call @cc_cons(%6921, %6920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6922) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6923 = func.call @stack_pop_pointer() : () -> i64
      %6924 = func.call @stack_pop_pointer() : () -> i64
      %6925 = func.call @cc_cons(%6924, %6923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6925) : (i64) -> ()
      %6926 = func.call @stack_pop_pointer() : () -> i64
      %6927 = func.call @stack_pop_pointer() : () -> i64
      %6928 = func.call @cc_cons(%6927, %6926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6928) : (i64) -> ()
      %6929 = func.call @stack_pop_pointer() : () -> i64
      %6930 = func.call @stack_pop_pointer() : () -> i64
      %6931 = func.call @cc_cons(%6930, %6929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6931) : (i64) -> ()
      %6932 = func.call @stack_pop_pointer() : () -> i64
      %6933 = func.call @stack_pop_pointer() : () -> i64
      %6934 = func.call @cc_cons(%6933, %6932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6934) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6935 = func.call @stack_pop_pointer() : () -> i64
      %6936 = func.call @stack_pop_pointer() : () -> i64
      %6937 = func.call @cc_cons(%6936, %6935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6937) : (i64) -> ()
      %6938 = func.call @stack_pop_pointer() : () -> i64
      %6939 = func.call @stack_pop_pointer() : () -> i64
      %6940 = func.call @cc_cons(%6939, %6938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6940) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6941 = func.call @stack_pop_pointer() : () -> i64
      %6942 = func.call @stack_pop_pointer() : () -> i64
      %6943 = func.call @cc_cons(%6942, %6941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6943) : (i64) -> ()
      %6944 = func.call @stack_pop_pointer() : () -> i64
      %6945 = func.call @stack_pop_pointer() : () -> i64
      %6946 = func.call @cc_cons(%6945, %6944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6946) : (i64) -> ()
      %6947 = func.call @stack_pop_pointer() : () -> i64
      %7010 = arith.constant 206494159077403 : i64
      %7011 = arith.constant 0 : i64
      %7012 = func.call @cc_make_closure(%7010, %7011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7012) : (i64) -> ()
      %7013 = func.call @stack_pop_pointer() : () -> i64
      %7014 = llvm.mlir.addressof @str701 : !llvm.ptr
      %7015 = arith.constant 1 : i64
      %7016 = func.call @cc_make_string(%7014, %7015) : (!llvm.ptr, i64) -> i64
      %7017 = func.call @cc_nil_value() : () -> i64
      %7018 = func.call @cc_intern(%7016, %7017) : (i64, i64) -> i64
      %7019 = func.call @cc_nil_value() : () -> i64
      %7020 = func.call @cc_cons(%7018, %7019) : (i64, i64) -> i64
      %7021 = func.call @cc_values_pack(%7020) : (i64) -> i64
      func.call @stack_push_pointer(%7018) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7022 = func.call @stack_pop_pointer() : () -> i64
      %7023 = func.call @stack_pop_pointer() : () -> i64
      %7024 = func.call @cc_cons(%7023, %7022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7024) : (i64) -> ()
      %7025 = func.call @stack_pop_pointer() : () -> i64
      %7026 = llvm.mlir.addressof @str702 : !llvm.ptr
      %7027 = arith.constant 11 : i64
      %7028 = func.call @cc_make_string(%7026, %7027) : (!llvm.ptr, i64) -> i64
      %7029 = llvm.mlir.addressof @str703 : !llvm.ptr
      %7030 = arith.constant 7 : i64
      %7031 = func.call @cc_make_string(%7029, %7030) : (!llvm.ptr, i64) -> i64
      %7032 = func.call @cc_intern(%7028, %7031) : (i64, i64) -> i64
      %7033 = func.call @cc_nil_value() : () -> i64
      %7034 = func.call @cc_cons(%7032, %7033) : (i64, i64) -> i64
      %7035 = func.call @cc_values_pack(%7034) : (i64) -> i64
      func.call @stack_push_pointer(%7032) : (i64) -> ()
      %7036 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7037 = func.call @stack_pop_pointer() : () -> i64
      %7038 = llvm.mlir.addressof @str704 : !llvm.ptr
      %7039 = arith.constant 4 : i64
      %7040 = func.call @cc_make_string(%7038, %7039) : (!llvm.ptr, i64) -> i64
      %7041 = llvm.mlir.addressof @str705 : !llvm.ptr
      %7042 = arith.constant 7 : i64
      %7043 = func.call @cc_make_string(%7041, %7042) : (!llvm.ptr, i64) -> i64
      %7044 = func.call @cc_intern(%7040, %7043) : (i64, i64) -> i64
      %7045 = func.call @cc_nil_value() : () -> i64
      %7046 = func.call @cc_cons(%7044, %7045) : (i64, i64) -> i64
      %7047 = func.call @cc_values_pack(%7046) : (i64) -> i64
      func.call @stack_push_pointer(%7044) : (i64) -> ()
      %7048 = func.call @stack_pop_pointer() : () -> i64
      %7049 = llvm.mlir.addressof @str706 : !llvm.ptr
      %7050 = arith.constant 6 : i64
      %7051 = func.call @cc_make_string(%7049, %7050) : (!llvm.ptr, i64) -> i64
      %7052 = func.call @cc_nil_value() : () -> i64
      %7053 = func.call @cc_intern(%7051, %7052) : (i64, i64) -> i64
      %7054 = func.call @cc_nil_value() : () -> i64
      %7055 = func.call @cc_cons(%7053, %7054) : (i64, i64) -> i64
      %7056 = func.call @cc_values_pack(%7055) : (i64) -> i64
      func.call @stack_push_pointer(%7053) : (i64) -> ()
      %7057 = func.call @stack_pop_pointer() : () -> i64
      %7058 = func.call @cc_nil_value() : () -> i64
      %7059 = func.call @cc_errorp(%6750) : (i64) -> i64
      %7060 = arith.cmpi ne, %7059, %7058 : i64
      %7061 = arith.cmpi eq, %7058, %7058 : i64
      %7062 = arith.andi %7060, %7061 : i1
      %7063 = scf.if %7062 -> (i64) {
        scf.yield %6750 : i64
      } else {
        scf.yield %7058 : i64
      }
      %7064 = func.call @cc_errorp(%6947) : (i64) -> i64
      %7065 = arith.cmpi ne, %7064, %7058 : i64
      %7066 = arith.cmpi eq, %7063, %7058 : i64
      %7067 = arith.andi %7065, %7066 : i1
      %7068 = scf.if %7067 -> (i64) {
        scf.yield %6947 : i64
      } else {
        scf.yield %7063 : i64
      }
      %7069 = func.call @cc_errorp(%7013) : (i64) -> i64
      %7070 = arith.cmpi ne, %7069, %7058 : i64
      %7071 = arith.cmpi eq, %7068, %7058 : i64
      %7072 = arith.andi %7070, %7071 : i1
      %7073 = scf.if %7072 -> (i64) {
        scf.yield %7013 : i64
      } else {
        scf.yield %7068 : i64
      }
      %7074 = func.call @cc_errorp(%7025) : (i64) -> i64
      %7075 = arith.cmpi ne, %7074, %7058 : i64
      %7076 = arith.cmpi eq, %7073, %7058 : i64
      %7077 = arith.andi %7075, %7076 : i1
      %7078 = scf.if %7077 -> (i64) {
        scf.yield %7025 : i64
      } else {
        scf.yield %7073 : i64
      }
      %7079 = func.call @cc_errorp(%7036) : (i64) -> i64
      %7080 = arith.cmpi ne, %7079, %7058 : i64
      %7081 = arith.cmpi eq, %7078, %7058 : i64
      %7082 = arith.andi %7080, %7081 : i1
      %7083 = scf.if %7082 -> (i64) {
        scf.yield %7036 : i64
      } else {
        scf.yield %7078 : i64
      }
      %7084 = func.call @cc_errorp(%7037) : (i64) -> i64
      %7085 = arith.cmpi ne, %7084, %7058 : i64
      %7086 = arith.cmpi eq, %7083, %7058 : i64
      %7087 = arith.andi %7085, %7086 : i1
      %7088 = scf.if %7087 -> (i64) {
        scf.yield %7037 : i64
      } else {
        scf.yield %7083 : i64
      }
      %7089 = func.call @cc_errorp(%7048) : (i64) -> i64
      %7090 = arith.cmpi ne, %7089, %7058 : i64
      %7091 = arith.cmpi eq, %7088, %7058 : i64
      %7092 = arith.andi %7090, %7091 : i1
      %7093 = scf.if %7092 -> (i64) {
        scf.yield %7048 : i64
      } else {
        scf.yield %7088 : i64
      }
      %7094 = func.call @cc_errorp(%7057) : (i64) -> i64
      %7095 = arith.cmpi ne, %7094, %7058 : i64
      %7096 = arith.cmpi eq, %7093, %7058 : i64
      %7097 = arith.andi %7095, %7096 : i1
      %7098 = scf.if %7097 -> (i64) {
        scf.yield %7057 : i64
      } else {
        scf.yield %7093 : i64
      }
      %7099 = arith.cmpi ne, %7098, %7058 : i64
      scf.if %7099 {
        func.call @stack_push_pointer(%7098) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6750) : (i64) -> ()
        func.call @stack_push_pointer(%6947) : (i64) -> ()
        func.call @stack_push_pointer(%7013) : (i64) -> ()
        func.call @stack_push_pointer(%7025) : (i64) -> ()
        func.call @stack_push_pointer(%7036) : (i64) -> ()
        func.call @stack_push_pointer(%7037) : (i64) -> ()
        func.call @stack_push_pointer(%7048) : (i64) -> ()
        func.call @stack_push_pointer(%7057) : (i64) -> ()
        %7100 = llvm.mlir.addressof @str707 : !llvm.ptr
        %7101 = func.call @cc_make_function_ref_const(%7100) : (!llvm.ptr) -> i64
        %7102 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7101, %7102) : (i64, i64) -> ()
      }
      %7103 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7103 : i64
    }
    %7104 = func.call @cc_nil_value() : () -> i64
    %7105 = func.call @cc_errorp(%6741) : (i64) -> i64
    %7106 = arith.cmpi ne, %7105, %7104 : i64
    %7107 = scf.if %7106 -> (i64) {
      scf.yield %6741 : i64
    } else {
      %7108 = llvm.mlir.addressof @str708 : !llvm.ptr
      %7109 = arith.constant 18 : i64
      %7110 = func.call @cc_make_string(%7108, %7109) : (!llvm.ptr, i64) -> i64
      %7111 = func.call @cc_nil_value() : () -> i64
      %7112 = func.call @cc_intern(%7110, %7111) : (i64, i64) -> i64
      %7113 = func.call @cc_nil_value() : () -> i64
      %7114 = func.call @cc_cons(%7112, %7113) : (i64, i64) -> i64
      %7115 = func.call @cc_values_pack(%7114) : (i64) -> i64
      func.call @stack_push_pointer(%7112) : (i64) -> ()
      %7116 = func.call @stack_pop_pointer() : () -> i64
      %7117 = llvm.mlir.addressof @str709 : !llvm.ptr
      %7118 = arith.constant 3 : i64
      %7119 = func.call @cc_make_string(%7117, %7118) : (!llvm.ptr, i64) -> i64
      %7120 = func.call @cc_nil_value() : () -> i64
      %7121 = func.call @cc_intern(%7119, %7120) : (i64, i64) -> i64
      %7122 = func.call @cc_nil_value() : () -> i64
      %7123 = func.call @cc_cons(%7121, %7122) : (i64, i64) -> i64
      %7124 = func.call @cc_values_pack(%7123) : (i64) -> i64
      func.call @stack_push_pointer(%7121) : (i64) -> ()
      %7125 = llvm.mlir.addressof @str710 : !llvm.ptr
      %7126 = arith.constant 3 : i64
      %7127 = func.call @cc_make_string(%7125, %7126) : (!llvm.ptr, i64) -> i64
      %7128 = func.call @cc_nil_value() : () -> i64
      %7129 = func.call @cc_intern(%7127, %7128) : (i64, i64) -> i64
      %7130 = func.call @cc_nil_value() : () -> i64
      %7131 = func.call @cc_cons(%7129, %7130) : (i64, i64) -> i64
      %7132 = func.call @cc_values_pack(%7131) : (i64) -> i64
      func.call @stack_push_pointer(%7129) : (i64) -> ()
      %7133 = llvm.mlir.addressof @str711 : !llvm.ptr
      %7134 = arith.constant 19 : i64
      %7135 = func.call @cc_make_string(%7133, %7134) : (!llvm.ptr, i64) -> i64
      %7136 = llvm.mlir.addressof @str712 : !llvm.ptr
      %7137 = arith.constant 11 : i64
      %7138 = func.call @cc_make_string(%7136, %7137) : (!llvm.ptr, i64) -> i64
      %7139 = func.call @cc_intern(%7135, %7138) : (i64, i64) -> i64
      %7140 = func.call @cc_nil_value() : () -> i64
      %7141 = func.call @cc_cons(%7139, %7140) : (i64, i64) -> i64
      %7142 = func.call @cc_values_pack(%7141) : (i64) -> i64
      func.call @stack_push_pointer(%7139) : (i64) -> ()
      %7143 = llvm.mlir.addressof @str713 : !llvm.ptr
      %7144 = arith.constant 2 : i64
      %7145 = func.call @cc_make_string(%7143, %7144) : (!llvm.ptr, i64) -> i64
      %7146 = llvm.mlir.addressof @str714 : !llvm.ptr
      %7147 = arith.constant 11 : i64
      %7148 = func.call @cc_make_string(%7146, %7147) : (!llvm.ptr, i64) -> i64
      %7149 = func.call @cc_intern(%7145, %7148) : (i64, i64) -> i64
      %7150 = func.call @cc_nil_value() : () -> i64
      %7151 = func.call @cc_cons(%7149, %7150) : (i64, i64) -> i64
      %7152 = func.call @cc_values_pack(%7151) : (i64) -> i64
      func.call @stack_push_pointer(%7149) : (i64) -> ()
      %7153 = llvm.mlir.addressof @str715 : !llvm.ptr
      %7154 = arith.constant 2 : i64
      %7155 = func.call @cc_make_string(%7153, %7154) : (!llvm.ptr, i64) -> i64
      %7156 = llvm.mlir.addressof @str716 : !llvm.ptr
      %7157 = arith.constant 11 : i64
      %7158 = func.call @cc_make_string(%7156, %7157) : (!llvm.ptr, i64) -> i64
      %7159 = func.call @cc_intern(%7155, %7158) : (i64, i64) -> i64
      %7160 = func.call @cc_nil_value() : () -> i64
      %7161 = func.call @cc_cons(%7159, %7160) : (i64, i64) -> i64
      %7162 = func.call @cc_values_pack(%7161) : (i64) -> i64
      func.call @stack_push_pointer(%7159) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7163 = func.call @stack_pop_pointer() : () -> i64
      %7164 = func.call @stack_pop_pointer() : () -> i64
      %7165 = func.call @cc_cons(%7164, %7163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7165) : (i64) -> ()
      %7166 = func.call @stack_pop_pointer() : () -> i64
      %7167 = func.call @stack_pop_pointer() : () -> i64
      %7168 = func.call @cc_cons(%7167, %7166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7168) : (i64) -> ()
      %7169 = llvm.mlir.addressof @str717 : !llvm.ptr
      %7170 = arith.constant 8 : i64
      %7171 = func.call @cc_make_string(%7169, %7170) : (!llvm.ptr, i64) -> i64
      %7172 = llvm.mlir.addressof @str718 : !llvm.ptr
      %7173 = arith.constant 11 : i64
      %7174 = func.call @cc_make_string(%7172, %7173) : (!llvm.ptr, i64) -> i64
      %7175 = func.call @cc_intern(%7171, %7174) : (i64, i64) -> i64
      %7176 = func.call @cc_nil_value() : () -> i64
      %7177 = func.call @cc_cons(%7175, %7176) : (i64, i64) -> i64
      %7178 = func.call @cc_values_pack(%7177) : (i64) -> i64
      func.call @stack_push_pointer(%7175) : (i64) -> ()
      %7179 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7179) : (i64) -> ()
      %7180 = llvm.mlir.addressof @str719 : !llvm.ptr
      %7181 = arith.constant 10 : i64
      %7182 = func.call @cc_make_string(%7180, %7181) : (!llvm.ptr, i64) -> i64
      %7183 = llvm.mlir.addressof @str720 : !llvm.ptr
      %7184 = arith.constant 11 : i64
      %7185 = func.call @cc_make_string(%7183, %7184) : (!llvm.ptr, i64) -> i64
      %7186 = func.call @cc_intern(%7182, %7185) : (i64, i64) -> i64
      %7187 = func.call @cc_nil_value() : () -> i64
      %7188 = func.call @cc_cons(%7186, %7187) : (i64, i64) -> i64
      %7189 = func.call @cc_values_pack(%7188) : (i64) -> i64
      func.call @stack_push_pointer(%7186) : (i64) -> ()
      %7190 = func.call @stack_pop_pointer() : () -> i64
      %7191 = func.call @stack_pop_pointer() : () -> i64
      %7192 = func.call @cc_cons(%7190, %7191) : (i64, i64) -> i64
      %7193 = llvm.mlir.addressof @str721 : !llvm.ptr
      %7194 = arith.constant 5 : i64
      %7195 = func.call @cc_make_string(%7193, %7194) : (!llvm.ptr, i64) -> i64
      %7196 = func.call @cc_nil_value() : () -> i64
      %7197 = func.call @cc_intern(%7195, %7196) : (i64, i64) -> i64
      %7198 = func.call @cc_nil_value() : () -> i64
      %7199 = func.call @cc_cons(%7197, %7198) : (i64, i64) -> i64
      %7200 = func.call @cc_values_pack(%7199) : (i64) -> i64
      %7201 = func.call @cc_cons(%7197, %7192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7201) : (i64) -> ()
      %7202 = llvm.mlir.addressof @str722 : !llvm.ptr
      %7203 = arith.constant 10 : i64
      %7204 = func.call @cc_make_string(%7202, %7203) : (!llvm.ptr, i64) -> i64
      %7205 = llvm.mlir.addressof @str723 : !llvm.ptr
      %7206 = arith.constant 11 : i64
      %7207 = func.call @cc_make_string(%7205, %7206) : (!llvm.ptr, i64) -> i64
      %7208 = func.call @cc_intern(%7204, %7207) : (i64, i64) -> i64
      %7209 = func.call @cc_nil_value() : () -> i64
      %7210 = func.call @cc_cons(%7208, %7209) : (i64, i64) -> i64
      %7211 = func.call @cc_values_pack(%7210) : (i64) -> i64
      func.call @stack_push_pointer(%7208) : (i64) -> ()
      %7212 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7212) : (i64) -> ()
      %7213 = llvm.mlir.addressof @str724 : !llvm.ptr
      %7214 = arith.constant 10 : i64
      %7215 = func.call @cc_make_string(%7213, %7214) : (!llvm.ptr, i64) -> i64
      %7216 = llvm.mlir.addressof @str725 : !llvm.ptr
      %7217 = arith.constant 11 : i64
      %7218 = func.call @cc_make_string(%7216, %7217) : (!llvm.ptr, i64) -> i64
      %7219 = func.call @cc_intern(%7215, %7218) : (i64, i64) -> i64
      %7220 = func.call @cc_nil_value() : () -> i64
      %7221 = func.call @cc_cons(%7219, %7220) : (i64, i64) -> i64
      %7222 = func.call @cc_values_pack(%7221) : (i64) -> i64
      func.call @stack_push_pointer(%7219) : (i64) -> ()
      %7223 = func.call @stack_pop_pointer() : () -> i64
      %7224 = func.call @stack_pop_pointer() : () -> i64
      %7225 = func.call @cc_cons(%7223, %7224) : (i64, i64) -> i64
      %7226 = llvm.mlir.addressof @str726 : !llvm.ptr
      %7227 = arith.constant 5 : i64
      %7228 = func.call @cc_make_string(%7226, %7227) : (!llvm.ptr, i64) -> i64
      %7229 = func.call @cc_nil_value() : () -> i64
      %7230 = func.call @cc_intern(%7228, %7229) : (i64, i64) -> i64
      %7231 = func.call @cc_nil_value() : () -> i64
      %7232 = func.call @cc_cons(%7230, %7231) : (i64, i64) -> i64
      %7233 = func.call @cc_values_pack(%7232) : (i64) -> i64
      %7234 = func.call @cc_cons(%7230, %7225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7234) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7235 = func.call @stack_pop_pointer() : () -> i64
      %7236 = func.call @stack_pop_pointer() : () -> i64
      %7237 = func.call @cc_cons(%7236, %7235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7237) : (i64) -> ()
      %7238 = func.call @stack_pop_pointer() : () -> i64
      %7239 = func.call @stack_pop_pointer() : () -> i64
      %7240 = func.call @cc_cons(%7239, %7238) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7240) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7241 = func.call @stack_pop_pointer() : () -> i64
      %7242 = func.call @stack_pop_pointer() : () -> i64
      %7243 = func.call @cc_cons(%7242, %7241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7243) : (i64) -> ()
      %7244 = func.call @stack_pop_pointer() : () -> i64
      %7245 = func.call @stack_pop_pointer() : () -> i64
      %7246 = func.call @cc_cons(%7245, %7244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7246) : (i64) -> ()
      %7247 = func.call @stack_pop_pointer() : () -> i64
      %7248 = func.call @stack_pop_pointer() : () -> i64
      %7249 = func.call @cc_cons(%7248, %7247) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7249) : (i64) -> ()
      %7250 = llvm.mlir.addressof @str727 : !llvm.ptr
      %7251 = arith.constant 3 : i64
      %7252 = func.call @cc_make_string(%7250, %7251) : (!llvm.ptr, i64) -> i64
      %7253 = llvm.mlir.addressof @str728 : !llvm.ptr
      %7254 = arith.constant 11 : i64
      %7255 = func.call @cc_make_string(%7253, %7254) : (!llvm.ptr, i64) -> i64
      %7256 = func.call @cc_intern(%7252, %7255) : (i64, i64) -> i64
      %7257 = func.call @cc_nil_value() : () -> i64
      %7258 = func.call @cc_cons(%7256, %7257) : (i64, i64) -> i64
      %7259 = func.call @cc_values_pack(%7258) : (i64) -> i64
      func.call @stack_push_pointer(%7256) : (i64) -> ()
      %7260 = llvm.mlir.addressof @str729 : !llvm.ptr
      %7261 = arith.constant 2 : i64
      %7262 = func.call @cc_make_string(%7260, %7261) : (!llvm.ptr, i64) -> i64
      %7263 = llvm.mlir.addressof @str730 : !llvm.ptr
      %7264 = arith.constant 11 : i64
      %7265 = func.call @cc_make_string(%7263, %7264) : (!llvm.ptr, i64) -> i64
      %7266 = func.call @cc_intern(%7262, %7265) : (i64, i64) -> i64
      %7267 = func.call @cc_nil_value() : () -> i64
      %7268 = func.call @cc_cons(%7266, %7267) : (i64, i64) -> i64
      %7269 = func.call @cc_values_pack(%7268) : (i64) -> i64
      func.call @stack_push_pointer(%7266) : (i64) -> ()
      %7270 = llvm.mlir.addressof @str731 : !llvm.ptr
      %7271 = arith.constant 2 : i64
      %7272 = func.call @cc_make_string(%7270, %7271) : (!llvm.ptr, i64) -> i64
      %7273 = llvm.mlir.addressof @str732 : !llvm.ptr
      %7274 = arith.constant 11 : i64
      %7275 = func.call @cc_make_string(%7273, %7274) : (!llvm.ptr, i64) -> i64
      %7276 = func.call @cc_intern(%7272, %7275) : (i64, i64) -> i64
      %7277 = func.call @cc_nil_value() : () -> i64
      %7278 = func.call @cc_cons(%7276, %7277) : (i64, i64) -> i64
      %7279 = func.call @cc_values_pack(%7278) : (i64) -> i64
      func.call @stack_push_pointer(%7276) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7280 = func.call @stack_pop_pointer() : () -> i64
      %7281 = func.call @stack_pop_pointer() : () -> i64
      %7282 = func.call @cc_cons(%7281, %7280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7282) : (i64) -> ()
      %7283 = func.call @stack_pop_pointer() : () -> i64
      %7284 = func.call @stack_pop_pointer() : () -> i64
      %7285 = func.call @cc_cons(%7284, %7283) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7285) : (i64) -> ()
      %7286 = func.call @stack_pop_pointer() : () -> i64
      %7287 = func.call @stack_pop_pointer() : () -> i64
      %7288 = func.call @cc_cons(%7287, %7286) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7288) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7289 = func.call @stack_pop_pointer() : () -> i64
      %7290 = func.call @stack_pop_pointer() : () -> i64
      %7291 = func.call @cc_cons(%7290, %7289) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7291) : (i64) -> ()
      %7292 = func.call @stack_pop_pointer() : () -> i64
      %7293 = func.call @stack_pop_pointer() : () -> i64
      %7294 = func.call @cc_cons(%7293, %7292) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7294) : (i64) -> ()
      %7295 = func.call @stack_pop_pointer() : () -> i64
      %7296 = func.call @stack_pop_pointer() : () -> i64
      %7297 = func.call @cc_cons(%7296, %7295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7297) : (i64) -> ()
      %7298 = func.call @stack_pop_pointer() : () -> i64
      %7299 = func.call @stack_pop_pointer() : () -> i64
      %7300 = func.call @cc_cons(%7299, %7298) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7300) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7301 = func.call @stack_pop_pointer() : () -> i64
      %7302 = func.call @stack_pop_pointer() : () -> i64
      %7303 = func.call @cc_cons(%7302, %7301) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7303) : (i64) -> ()
      %7304 = func.call @stack_pop_pointer() : () -> i64
      %7305 = func.call @stack_pop_pointer() : () -> i64
      %7306 = func.call @cc_cons(%7305, %7304) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7306) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7307 = func.call @stack_pop_pointer() : () -> i64
      %7308 = func.call @stack_pop_pointer() : () -> i64
      %7309 = func.call @cc_cons(%7308, %7307) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7309) : (i64) -> ()
      %7310 = func.call @stack_pop_pointer() : () -> i64
      %7311 = func.call @stack_pop_pointer() : () -> i64
      %7312 = func.call @cc_cons(%7311, %7310) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7312) : (i64) -> ()
      %7313 = func.call @stack_pop_pointer() : () -> i64
      %7376 = arith.constant 206494159077404 : i64
      %7377 = arith.constant 0 : i64
      %7378 = func.call @cc_make_closure(%7376, %7377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7378) : (i64) -> ()
      %7379 = func.call @stack_pop_pointer() : () -> i64
      %7380 = llvm.mlir.addressof @str738 : !llvm.ptr
      %7381 = arith.constant 1 : i64
      %7382 = func.call @cc_make_string(%7380, %7381) : (!llvm.ptr, i64) -> i64
      %7383 = func.call @cc_nil_value() : () -> i64
      %7384 = func.call @cc_intern(%7382, %7383) : (i64, i64) -> i64
      %7385 = func.call @cc_nil_value() : () -> i64
      %7386 = func.call @cc_cons(%7384, %7385) : (i64, i64) -> i64
      %7387 = func.call @cc_values_pack(%7386) : (i64) -> i64
      func.call @stack_push_pointer(%7384) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7388 = func.call @stack_pop_pointer() : () -> i64
      %7389 = func.call @stack_pop_pointer() : () -> i64
      %7390 = func.call @cc_cons(%7389, %7388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7390) : (i64) -> ()
      %7391 = func.call @stack_pop_pointer() : () -> i64
      %7392 = llvm.mlir.addressof @str739 : !llvm.ptr
      %7393 = arith.constant 11 : i64
      %7394 = func.call @cc_make_string(%7392, %7393) : (!llvm.ptr, i64) -> i64
      %7395 = llvm.mlir.addressof @str740 : !llvm.ptr
      %7396 = arith.constant 7 : i64
      %7397 = func.call @cc_make_string(%7395, %7396) : (!llvm.ptr, i64) -> i64
      %7398 = func.call @cc_intern(%7394, %7397) : (i64, i64) -> i64
      %7399 = func.call @cc_nil_value() : () -> i64
      %7400 = func.call @cc_cons(%7398, %7399) : (i64, i64) -> i64
      %7401 = func.call @cc_values_pack(%7400) : (i64) -> i64
      func.call @stack_push_pointer(%7398) : (i64) -> ()
      %7402 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7403 = func.call @stack_pop_pointer() : () -> i64
      %7404 = llvm.mlir.addressof @str741 : !llvm.ptr
      %7405 = arith.constant 4 : i64
      %7406 = func.call @cc_make_string(%7404, %7405) : (!llvm.ptr, i64) -> i64
      %7407 = llvm.mlir.addressof @str742 : !llvm.ptr
      %7408 = arith.constant 7 : i64
      %7409 = func.call @cc_make_string(%7407, %7408) : (!llvm.ptr, i64) -> i64
      %7410 = func.call @cc_intern(%7406, %7409) : (i64, i64) -> i64
      %7411 = func.call @cc_nil_value() : () -> i64
      %7412 = func.call @cc_cons(%7410, %7411) : (i64, i64) -> i64
      %7413 = func.call @cc_values_pack(%7412) : (i64) -> i64
      func.call @stack_push_pointer(%7410) : (i64) -> ()
      %7414 = func.call @stack_pop_pointer() : () -> i64
      %7415 = llvm.mlir.addressof @str743 : !llvm.ptr
      %7416 = arith.constant 6 : i64
      %7417 = func.call @cc_make_string(%7415, %7416) : (!llvm.ptr, i64) -> i64
      %7418 = func.call @cc_nil_value() : () -> i64
      %7419 = func.call @cc_intern(%7417, %7418) : (i64, i64) -> i64
      %7420 = func.call @cc_nil_value() : () -> i64
      %7421 = func.call @cc_cons(%7419, %7420) : (i64, i64) -> i64
      %7422 = func.call @cc_values_pack(%7421) : (i64) -> i64
      func.call @stack_push_pointer(%7419) : (i64) -> ()
      %7423 = func.call @stack_pop_pointer() : () -> i64
      %7424 = func.call @cc_nil_value() : () -> i64
      %7425 = func.call @cc_errorp(%7116) : (i64) -> i64
      %7426 = arith.cmpi ne, %7425, %7424 : i64
      %7427 = arith.cmpi eq, %7424, %7424 : i64
      %7428 = arith.andi %7426, %7427 : i1
      %7429 = scf.if %7428 -> (i64) {
        scf.yield %7116 : i64
      } else {
        scf.yield %7424 : i64
      }
      %7430 = func.call @cc_errorp(%7313) : (i64) -> i64
      %7431 = arith.cmpi ne, %7430, %7424 : i64
      %7432 = arith.cmpi eq, %7429, %7424 : i64
      %7433 = arith.andi %7431, %7432 : i1
      %7434 = scf.if %7433 -> (i64) {
        scf.yield %7313 : i64
      } else {
        scf.yield %7429 : i64
      }
      %7435 = func.call @cc_errorp(%7379) : (i64) -> i64
      %7436 = arith.cmpi ne, %7435, %7424 : i64
      %7437 = arith.cmpi eq, %7434, %7424 : i64
      %7438 = arith.andi %7436, %7437 : i1
      %7439 = scf.if %7438 -> (i64) {
        scf.yield %7379 : i64
      } else {
        scf.yield %7434 : i64
      }
      %7440 = func.call @cc_errorp(%7391) : (i64) -> i64
      %7441 = arith.cmpi ne, %7440, %7424 : i64
      %7442 = arith.cmpi eq, %7439, %7424 : i64
      %7443 = arith.andi %7441, %7442 : i1
      %7444 = scf.if %7443 -> (i64) {
        scf.yield %7391 : i64
      } else {
        scf.yield %7439 : i64
      }
      %7445 = func.call @cc_errorp(%7402) : (i64) -> i64
      %7446 = arith.cmpi ne, %7445, %7424 : i64
      %7447 = arith.cmpi eq, %7444, %7424 : i64
      %7448 = arith.andi %7446, %7447 : i1
      %7449 = scf.if %7448 -> (i64) {
        scf.yield %7402 : i64
      } else {
        scf.yield %7444 : i64
      }
      %7450 = func.call @cc_errorp(%7403) : (i64) -> i64
      %7451 = arith.cmpi ne, %7450, %7424 : i64
      %7452 = arith.cmpi eq, %7449, %7424 : i64
      %7453 = arith.andi %7451, %7452 : i1
      %7454 = scf.if %7453 -> (i64) {
        scf.yield %7403 : i64
      } else {
        scf.yield %7449 : i64
      }
      %7455 = func.call @cc_errorp(%7414) : (i64) -> i64
      %7456 = arith.cmpi ne, %7455, %7424 : i64
      %7457 = arith.cmpi eq, %7454, %7424 : i64
      %7458 = arith.andi %7456, %7457 : i1
      %7459 = scf.if %7458 -> (i64) {
        scf.yield %7414 : i64
      } else {
        scf.yield %7454 : i64
      }
      %7460 = func.call @cc_errorp(%7423) : (i64) -> i64
      %7461 = arith.cmpi ne, %7460, %7424 : i64
      %7462 = arith.cmpi eq, %7459, %7424 : i64
      %7463 = arith.andi %7461, %7462 : i1
      %7464 = scf.if %7463 -> (i64) {
        scf.yield %7423 : i64
      } else {
        scf.yield %7459 : i64
      }
      %7465 = arith.cmpi ne, %7464, %7424 : i64
      scf.if %7465 {
        func.call @stack_push_pointer(%7464) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7116) : (i64) -> ()
        func.call @stack_push_pointer(%7313) : (i64) -> ()
        func.call @stack_push_pointer(%7379) : (i64) -> ()
        func.call @stack_push_pointer(%7391) : (i64) -> ()
        func.call @stack_push_pointer(%7402) : (i64) -> ()
        func.call @stack_push_pointer(%7403) : (i64) -> ()
        func.call @stack_push_pointer(%7414) : (i64) -> ()
        func.call @stack_push_pointer(%7423) : (i64) -> ()
        %7466 = llvm.mlir.addressof @str744 : !llvm.ptr
        %7467 = func.call @cc_make_function_ref_const(%7466) : (!llvm.ptr) -> i64
        %7468 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7467, %7468) : (i64, i64) -> ()
      }
      %7469 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7469 : i64
    }
    %7470 = func.call @cc_nil_value() : () -> i64
    %7471 = func.call @cc_errorp(%7107) : (i64) -> i64
    %7472 = arith.cmpi ne, %7471, %7470 : i64
    %7473 = scf.if %7472 -> (i64) {
      scf.yield %7107 : i64
    } else {
      %7474 = llvm.mlir.addressof @str745 : !llvm.ptr
      %7475 = arith.constant 18 : i64
      %7476 = func.call @cc_make_string(%7474, %7475) : (!llvm.ptr, i64) -> i64
      %7477 = func.call @cc_nil_value() : () -> i64
      %7478 = func.call @cc_intern(%7476, %7477) : (i64, i64) -> i64
      %7479 = func.call @cc_nil_value() : () -> i64
      %7480 = func.call @cc_cons(%7478, %7479) : (i64, i64) -> i64
      %7481 = func.call @cc_values_pack(%7480) : (i64) -> i64
      func.call @stack_push_pointer(%7478) : (i64) -> ()
      %7482 = func.call @stack_pop_pointer() : () -> i64
      %7483 = llvm.mlir.addressof @str746 : !llvm.ptr
      %7484 = arith.constant 3 : i64
      %7485 = func.call @cc_make_string(%7483, %7484) : (!llvm.ptr, i64) -> i64
      %7486 = func.call @cc_nil_value() : () -> i64
      %7487 = func.call @cc_intern(%7485, %7486) : (i64, i64) -> i64
      %7488 = func.call @cc_nil_value() : () -> i64
      %7489 = func.call @cc_cons(%7487, %7488) : (i64, i64) -> i64
      %7490 = func.call @cc_values_pack(%7489) : (i64) -> i64
      func.call @stack_push_pointer(%7487) : (i64) -> ()
      %7491 = llvm.mlir.addressof @str747 : !llvm.ptr
      %7492 = arith.constant 3 : i64
      %7493 = func.call @cc_make_string(%7491, %7492) : (!llvm.ptr, i64) -> i64
      %7494 = func.call @cc_nil_value() : () -> i64
      %7495 = func.call @cc_intern(%7493, %7494) : (i64, i64) -> i64
      %7496 = func.call @cc_nil_value() : () -> i64
      %7497 = func.call @cc_cons(%7495, %7496) : (i64, i64) -> i64
      %7498 = func.call @cc_values_pack(%7497) : (i64) -> i64
      func.call @stack_push_pointer(%7495) : (i64) -> ()
      %7499 = llvm.mlir.addressof @str748 : !llvm.ptr
      %7500 = arith.constant 19 : i64
      %7501 = func.call @cc_make_string(%7499, %7500) : (!llvm.ptr, i64) -> i64
      %7502 = llvm.mlir.addressof @str749 : !llvm.ptr
      %7503 = arith.constant 11 : i64
      %7504 = func.call @cc_make_string(%7502, %7503) : (!llvm.ptr, i64) -> i64
      %7505 = func.call @cc_intern(%7501, %7504) : (i64, i64) -> i64
      %7506 = func.call @cc_nil_value() : () -> i64
      %7507 = func.call @cc_cons(%7505, %7506) : (i64, i64) -> i64
      %7508 = func.call @cc_values_pack(%7507) : (i64) -> i64
      func.call @stack_push_pointer(%7505) : (i64) -> ()
      %7509 = llvm.mlir.addressof @str750 : !llvm.ptr
      %7510 = arith.constant 2 : i64
      %7511 = func.call @cc_make_string(%7509, %7510) : (!llvm.ptr, i64) -> i64
      %7512 = llvm.mlir.addressof @str751 : !llvm.ptr
      %7513 = arith.constant 11 : i64
      %7514 = func.call @cc_make_string(%7512, %7513) : (!llvm.ptr, i64) -> i64
      %7515 = func.call @cc_intern(%7511, %7514) : (i64, i64) -> i64
      %7516 = func.call @cc_nil_value() : () -> i64
      %7517 = func.call @cc_cons(%7515, %7516) : (i64, i64) -> i64
      %7518 = func.call @cc_values_pack(%7517) : (i64) -> i64
      func.call @stack_push_pointer(%7515) : (i64) -> ()
      %7519 = llvm.mlir.addressof @str752 : !llvm.ptr
      %7520 = arith.constant 2 : i64
      %7521 = func.call @cc_make_string(%7519, %7520) : (!llvm.ptr, i64) -> i64
      %7522 = llvm.mlir.addressof @str753 : !llvm.ptr
      %7523 = arith.constant 11 : i64
      %7524 = func.call @cc_make_string(%7522, %7523) : (!llvm.ptr, i64) -> i64
      %7525 = func.call @cc_intern(%7521, %7524) : (i64, i64) -> i64
      %7526 = func.call @cc_nil_value() : () -> i64
      %7527 = func.call @cc_cons(%7525, %7526) : (i64, i64) -> i64
      %7528 = func.call @cc_values_pack(%7527) : (i64) -> i64
      func.call @stack_push_pointer(%7525) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7529 = func.call @stack_pop_pointer() : () -> i64
      %7530 = func.call @stack_pop_pointer() : () -> i64
      %7531 = func.call @cc_cons(%7530, %7529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7531) : (i64) -> ()
      %7532 = func.call @stack_pop_pointer() : () -> i64
      %7533 = func.call @stack_pop_pointer() : () -> i64
      %7534 = func.call @cc_cons(%7533, %7532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7534) : (i64) -> ()
      %7535 = llvm.mlir.addressof @str754 : !llvm.ptr
      %7536 = arith.constant 8 : i64
      %7537 = func.call @cc_make_string(%7535, %7536) : (!llvm.ptr, i64) -> i64
      %7538 = llvm.mlir.addressof @str755 : !llvm.ptr
      %7539 = arith.constant 11 : i64
      %7540 = func.call @cc_make_string(%7538, %7539) : (!llvm.ptr, i64) -> i64
      %7541 = func.call @cc_intern(%7537, %7540) : (i64, i64) -> i64
      %7542 = func.call @cc_nil_value() : () -> i64
      %7543 = func.call @cc_cons(%7541, %7542) : (i64, i64) -> i64
      %7544 = func.call @cc_values_pack(%7543) : (i64) -> i64
      func.call @stack_push_pointer(%7541) : (i64) -> ()
      %7545 = llvm.mlir.addressof @str756 : !llvm.ptr
      %7546 = arith.constant 10 : i64
      %7547 = func.call @cc_make_string(%7545, %7546) : (!llvm.ptr, i64) -> i64
      %7548 = llvm.mlir.addressof @str757 : !llvm.ptr
      %7549 = arith.constant 11 : i64
      %7550 = func.call @cc_make_string(%7548, %7549) : (!llvm.ptr, i64) -> i64
      %7551 = func.call @cc_intern(%7547, %7550) : (i64, i64) -> i64
      %7552 = func.call @cc_nil_value() : () -> i64
      %7553 = func.call @cc_cons(%7551, %7552) : (i64, i64) -> i64
      %7554 = func.call @cc_values_pack(%7553) : (i64) -> i64
      func.call @stack_push_pointer(%7551) : (i64) -> ()
      %7555 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7555) : (i64) -> ()
      %7556 = llvm.mlir.addressof @str758 : !llvm.ptr
      %7557 = arith.constant 10 : i64
      %7558 = func.call @cc_make_string(%7556, %7557) : (!llvm.ptr, i64) -> i64
      %7559 = llvm.mlir.addressof @str759 : !llvm.ptr
      %7560 = arith.constant 11 : i64
      %7561 = func.call @cc_make_string(%7559, %7560) : (!llvm.ptr, i64) -> i64
      %7562 = func.call @cc_intern(%7558, %7561) : (i64, i64) -> i64
      %7563 = func.call @cc_nil_value() : () -> i64
      %7564 = func.call @cc_cons(%7562, %7563) : (i64, i64) -> i64
      %7565 = func.call @cc_values_pack(%7564) : (i64) -> i64
      func.call @stack_push_pointer(%7562) : (i64) -> ()
      %7566 = func.call @stack_pop_pointer() : () -> i64
      %7567 = func.call @stack_pop_pointer() : () -> i64
      %7568 = func.call @cc_cons(%7566, %7567) : (i64, i64) -> i64
      %7569 = llvm.mlir.addressof @str760 : !llvm.ptr
      %7570 = arith.constant 5 : i64
      %7571 = func.call @cc_make_string(%7569, %7570) : (!llvm.ptr, i64) -> i64
      %7572 = func.call @cc_nil_value() : () -> i64
      %7573 = func.call @cc_intern(%7571, %7572) : (i64, i64) -> i64
      %7574 = func.call @cc_nil_value() : () -> i64
      %7575 = func.call @cc_cons(%7573, %7574) : (i64, i64) -> i64
      %7576 = func.call @cc_values_pack(%7575) : (i64) -> i64
      %7577 = func.call @cc_cons(%7573, %7568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7577) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7578 = func.call @stack_pop_pointer() : () -> i64
      %7579 = func.call @stack_pop_pointer() : () -> i64
      %7580 = func.call @cc_cons(%7579, %7578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7580) : (i64) -> ()
      %7581 = func.call @stack_pop_pointer() : () -> i64
      %7582 = func.call @stack_pop_pointer() : () -> i64
      %7583 = func.call @cc_cons(%7582, %7581) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7583) : (i64) -> ()
      %7584 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7584) : (i64) -> ()
      %7585 = llvm.mlir.addressof @str761 : !llvm.ptr
      %7586 = arith.constant 10 : i64
      %7587 = func.call @cc_make_string(%7585, %7586) : (!llvm.ptr, i64) -> i64
      %7588 = llvm.mlir.addressof @str762 : !llvm.ptr
      %7589 = arith.constant 11 : i64
      %7590 = func.call @cc_make_string(%7588, %7589) : (!llvm.ptr, i64) -> i64
      %7591 = func.call @cc_intern(%7587, %7590) : (i64, i64) -> i64
      %7592 = func.call @cc_nil_value() : () -> i64
      %7593 = func.call @cc_cons(%7591, %7592) : (i64, i64) -> i64
      %7594 = func.call @cc_values_pack(%7593) : (i64) -> i64
      func.call @stack_push_pointer(%7591) : (i64) -> ()
      %7595 = func.call @stack_pop_pointer() : () -> i64
      %7596 = func.call @stack_pop_pointer() : () -> i64
      %7597 = func.call @cc_cons(%7595, %7596) : (i64, i64) -> i64
      %7598 = llvm.mlir.addressof @str763 : !llvm.ptr
      %7599 = arith.constant 5 : i64
      %7600 = func.call @cc_make_string(%7598, %7599) : (!llvm.ptr, i64) -> i64
      %7601 = func.call @cc_nil_value() : () -> i64
      %7602 = func.call @cc_intern(%7600, %7601) : (i64, i64) -> i64
      %7603 = func.call @cc_nil_value() : () -> i64
      %7604 = func.call @cc_cons(%7602, %7603) : (i64, i64) -> i64
      %7605 = func.call @cc_values_pack(%7604) : (i64) -> i64
      %7606 = func.call @cc_cons(%7602, %7597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7606) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7607 = func.call @stack_pop_pointer() : () -> i64
      %7608 = func.call @stack_pop_pointer() : () -> i64
      %7609 = func.call @cc_cons(%7608, %7607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7609) : (i64) -> ()
      %7610 = func.call @stack_pop_pointer() : () -> i64
      %7611 = func.call @stack_pop_pointer() : () -> i64
      %7612 = func.call @cc_cons(%7611, %7610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7612) : (i64) -> ()
      %7613 = func.call @stack_pop_pointer() : () -> i64
      %7614 = func.call @stack_pop_pointer() : () -> i64
      %7615 = func.call @cc_cons(%7614, %7613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7615) : (i64) -> ()
      %7616 = llvm.mlir.addressof @str764 : !llvm.ptr
      %7617 = arith.constant 3 : i64
      %7618 = func.call @cc_make_string(%7616, %7617) : (!llvm.ptr, i64) -> i64
      %7619 = llvm.mlir.addressof @str765 : !llvm.ptr
      %7620 = arith.constant 11 : i64
      %7621 = func.call @cc_make_string(%7619, %7620) : (!llvm.ptr, i64) -> i64
      %7622 = func.call @cc_intern(%7618, %7621) : (i64, i64) -> i64
      %7623 = func.call @cc_nil_value() : () -> i64
      %7624 = func.call @cc_cons(%7622, %7623) : (i64, i64) -> i64
      %7625 = func.call @cc_values_pack(%7624) : (i64) -> i64
      func.call @stack_push_pointer(%7622) : (i64) -> ()
      %7626 = llvm.mlir.addressof @str766 : !llvm.ptr
      %7627 = arith.constant 2 : i64
      %7628 = func.call @cc_make_string(%7626, %7627) : (!llvm.ptr, i64) -> i64
      %7629 = llvm.mlir.addressof @str767 : !llvm.ptr
      %7630 = arith.constant 11 : i64
      %7631 = func.call @cc_make_string(%7629, %7630) : (!llvm.ptr, i64) -> i64
      %7632 = func.call @cc_intern(%7628, %7631) : (i64, i64) -> i64
      %7633 = func.call @cc_nil_value() : () -> i64
      %7634 = func.call @cc_cons(%7632, %7633) : (i64, i64) -> i64
      %7635 = func.call @cc_values_pack(%7634) : (i64) -> i64
      func.call @stack_push_pointer(%7632) : (i64) -> ()
      %7636 = llvm.mlir.addressof @str768 : !llvm.ptr
      %7637 = arith.constant 2 : i64
      %7638 = func.call @cc_make_string(%7636, %7637) : (!llvm.ptr, i64) -> i64
      %7639 = llvm.mlir.addressof @str769 : !llvm.ptr
      %7640 = arith.constant 11 : i64
      %7641 = func.call @cc_make_string(%7639, %7640) : (!llvm.ptr, i64) -> i64
      %7642 = func.call @cc_intern(%7638, %7641) : (i64, i64) -> i64
      %7643 = func.call @cc_nil_value() : () -> i64
      %7644 = func.call @cc_cons(%7642, %7643) : (i64, i64) -> i64
      %7645 = func.call @cc_values_pack(%7644) : (i64) -> i64
      func.call @stack_push_pointer(%7642) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7646 = func.call @stack_pop_pointer() : () -> i64
      %7647 = func.call @stack_pop_pointer() : () -> i64
      %7648 = func.call @cc_cons(%7647, %7646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7648) : (i64) -> ()
      %7649 = func.call @stack_pop_pointer() : () -> i64
      %7650 = func.call @stack_pop_pointer() : () -> i64
      %7651 = func.call @cc_cons(%7650, %7649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7651) : (i64) -> ()
      %7652 = func.call @stack_pop_pointer() : () -> i64
      %7653 = func.call @stack_pop_pointer() : () -> i64
      %7654 = func.call @cc_cons(%7653, %7652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7654) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7655 = func.call @stack_pop_pointer() : () -> i64
      %7656 = func.call @stack_pop_pointer() : () -> i64
      %7657 = func.call @cc_cons(%7656, %7655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7657) : (i64) -> ()
      %7658 = func.call @stack_pop_pointer() : () -> i64
      %7659 = func.call @stack_pop_pointer() : () -> i64
      %7660 = func.call @cc_cons(%7659, %7658) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7660) : (i64) -> ()
      %7661 = func.call @stack_pop_pointer() : () -> i64
      %7662 = func.call @stack_pop_pointer() : () -> i64
      %7663 = func.call @cc_cons(%7662, %7661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7663) : (i64) -> ()
      %7664 = func.call @stack_pop_pointer() : () -> i64
      %7665 = func.call @stack_pop_pointer() : () -> i64
      %7666 = func.call @cc_cons(%7665, %7664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7666) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7667 = func.call @stack_pop_pointer() : () -> i64
      %7668 = func.call @stack_pop_pointer() : () -> i64
      %7669 = func.call @cc_cons(%7668, %7667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7669) : (i64) -> ()
      %7670 = func.call @stack_pop_pointer() : () -> i64
      %7671 = func.call @stack_pop_pointer() : () -> i64
      %7672 = func.call @cc_cons(%7671, %7670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7672) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7673 = func.call @stack_pop_pointer() : () -> i64
      %7674 = func.call @stack_pop_pointer() : () -> i64
      %7675 = func.call @cc_cons(%7674, %7673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7675) : (i64) -> ()
      %7676 = func.call @stack_pop_pointer() : () -> i64
      %7677 = func.call @stack_pop_pointer() : () -> i64
      %7678 = func.call @cc_cons(%7677, %7676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7678) : (i64) -> ()
      %7679 = func.call @stack_pop_pointer() : () -> i64
      %7742 = arith.constant 206494159077405 : i64
      %7743 = arith.constant 0 : i64
      %7744 = func.call @cc_make_closure(%7742, %7743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7744) : (i64) -> ()
      %7745 = func.call @stack_pop_pointer() : () -> i64
      %7746 = llvm.mlir.addressof @str775 : !llvm.ptr
      %7747 = arith.constant 1 : i64
      %7748 = func.call @cc_make_string(%7746, %7747) : (!llvm.ptr, i64) -> i64
      %7749 = func.call @cc_nil_value() : () -> i64
      %7750 = func.call @cc_intern(%7748, %7749) : (i64, i64) -> i64
      %7751 = func.call @cc_nil_value() : () -> i64
      %7752 = func.call @cc_cons(%7750, %7751) : (i64, i64) -> i64
      %7753 = func.call @cc_values_pack(%7752) : (i64) -> i64
      func.call @stack_push_pointer(%7750) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7754 = func.call @stack_pop_pointer() : () -> i64
      %7755 = func.call @stack_pop_pointer() : () -> i64
      %7756 = func.call @cc_cons(%7755, %7754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7756) : (i64) -> ()
      %7757 = func.call @stack_pop_pointer() : () -> i64
      %7758 = llvm.mlir.addressof @str776 : !llvm.ptr
      %7759 = arith.constant 11 : i64
      %7760 = func.call @cc_make_string(%7758, %7759) : (!llvm.ptr, i64) -> i64
      %7761 = llvm.mlir.addressof @str777 : !llvm.ptr
      %7762 = arith.constant 7 : i64
      %7763 = func.call @cc_make_string(%7761, %7762) : (!llvm.ptr, i64) -> i64
      %7764 = func.call @cc_intern(%7760, %7763) : (i64, i64) -> i64
      %7765 = func.call @cc_nil_value() : () -> i64
      %7766 = func.call @cc_cons(%7764, %7765) : (i64, i64) -> i64
      %7767 = func.call @cc_values_pack(%7766) : (i64) -> i64
      func.call @stack_push_pointer(%7764) : (i64) -> ()
      %7768 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7769 = func.call @stack_pop_pointer() : () -> i64
      %7770 = llvm.mlir.addressof @str778 : !llvm.ptr
      %7771 = arith.constant 4 : i64
      %7772 = func.call @cc_make_string(%7770, %7771) : (!llvm.ptr, i64) -> i64
      %7773 = llvm.mlir.addressof @str779 : !llvm.ptr
      %7774 = arith.constant 7 : i64
      %7775 = func.call @cc_make_string(%7773, %7774) : (!llvm.ptr, i64) -> i64
      %7776 = func.call @cc_intern(%7772, %7775) : (i64, i64) -> i64
      %7777 = func.call @cc_nil_value() : () -> i64
      %7778 = func.call @cc_cons(%7776, %7777) : (i64, i64) -> i64
      %7779 = func.call @cc_values_pack(%7778) : (i64) -> i64
      func.call @stack_push_pointer(%7776) : (i64) -> ()
      %7780 = func.call @stack_pop_pointer() : () -> i64
      %7781 = llvm.mlir.addressof @str780 : !llvm.ptr
      %7782 = arith.constant 6 : i64
      %7783 = func.call @cc_make_string(%7781, %7782) : (!llvm.ptr, i64) -> i64
      %7784 = func.call @cc_nil_value() : () -> i64
      %7785 = func.call @cc_intern(%7783, %7784) : (i64, i64) -> i64
      %7786 = func.call @cc_nil_value() : () -> i64
      %7787 = func.call @cc_cons(%7785, %7786) : (i64, i64) -> i64
      %7788 = func.call @cc_values_pack(%7787) : (i64) -> i64
      func.call @stack_push_pointer(%7785) : (i64) -> ()
      %7789 = func.call @stack_pop_pointer() : () -> i64
      %7790 = func.call @cc_nil_value() : () -> i64
      %7791 = func.call @cc_errorp(%7482) : (i64) -> i64
      %7792 = arith.cmpi ne, %7791, %7790 : i64
      %7793 = arith.cmpi eq, %7790, %7790 : i64
      %7794 = arith.andi %7792, %7793 : i1
      %7795 = scf.if %7794 -> (i64) {
        scf.yield %7482 : i64
      } else {
        scf.yield %7790 : i64
      }
      %7796 = func.call @cc_errorp(%7679) : (i64) -> i64
      %7797 = arith.cmpi ne, %7796, %7790 : i64
      %7798 = arith.cmpi eq, %7795, %7790 : i64
      %7799 = arith.andi %7797, %7798 : i1
      %7800 = scf.if %7799 -> (i64) {
        scf.yield %7679 : i64
      } else {
        scf.yield %7795 : i64
      }
      %7801 = func.call @cc_errorp(%7745) : (i64) -> i64
      %7802 = arith.cmpi ne, %7801, %7790 : i64
      %7803 = arith.cmpi eq, %7800, %7790 : i64
      %7804 = arith.andi %7802, %7803 : i1
      %7805 = scf.if %7804 -> (i64) {
        scf.yield %7745 : i64
      } else {
        scf.yield %7800 : i64
      }
      %7806 = func.call @cc_errorp(%7757) : (i64) -> i64
      %7807 = arith.cmpi ne, %7806, %7790 : i64
      %7808 = arith.cmpi eq, %7805, %7790 : i64
      %7809 = arith.andi %7807, %7808 : i1
      %7810 = scf.if %7809 -> (i64) {
        scf.yield %7757 : i64
      } else {
        scf.yield %7805 : i64
      }
      %7811 = func.call @cc_errorp(%7768) : (i64) -> i64
      %7812 = arith.cmpi ne, %7811, %7790 : i64
      %7813 = arith.cmpi eq, %7810, %7790 : i64
      %7814 = arith.andi %7812, %7813 : i1
      %7815 = scf.if %7814 -> (i64) {
        scf.yield %7768 : i64
      } else {
        scf.yield %7810 : i64
      }
      %7816 = func.call @cc_errorp(%7769) : (i64) -> i64
      %7817 = arith.cmpi ne, %7816, %7790 : i64
      %7818 = arith.cmpi eq, %7815, %7790 : i64
      %7819 = arith.andi %7817, %7818 : i1
      %7820 = scf.if %7819 -> (i64) {
        scf.yield %7769 : i64
      } else {
        scf.yield %7815 : i64
      }
      %7821 = func.call @cc_errorp(%7780) : (i64) -> i64
      %7822 = arith.cmpi ne, %7821, %7790 : i64
      %7823 = arith.cmpi eq, %7820, %7790 : i64
      %7824 = arith.andi %7822, %7823 : i1
      %7825 = scf.if %7824 -> (i64) {
        scf.yield %7780 : i64
      } else {
        scf.yield %7820 : i64
      }
      %7826 = func.call @cc_errorp(%7789) : (i64) -> i64
      %7827 = arith.cmpi ne, %7826, %7790 : i64
      %7828 = arith.cmpi eq, %7825, %7790 : i64
      %7829 = arith.andi %7827, %7828 : i1
      %7830 = scf.if %7829 -> (i64) {
        scf.yield %7789 : i64
      } else {
        scf.yield %7825 : i64
      }
      %7831 = arith.cmpi ne, %7830, %7790 : i64
      scf.if %7831 {
        func.call @stack_push_pointer(%7830) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7482) : (i64) -> ()
        func.call @stack_push_pointer(%7679) : (i64) -> ()
        func.call @stack_push_pointer(%7745) : (i64) -> ()
        func.call @stack_push_pointer(%7757) : (i64) -> ()
        func.call @stack_push_pointer(%7768) : (i64) -> ()
        func.call @stack_push_pointer(%7769) : (i64) -> ()
        func.call @stack_push_pointer(%7780) : (i64) -> ()
        func.call @stack_push_pointer(%7789) : (i64) -> ()
        %7832 = llvm.mlir.addressof @str781 : !llvm.ptr
        %7833 = func.call @cc_make_function_ref_const(%7832) : (!llvm.ptr) -> i64
        %7834 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7833, %7834) : (i64, i64) -> ()
      }
      %7835 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7835 : i64
    }
    %7836 = func.call @cc_nil_value() : () -> i64
    %7837 = func.call @cc_errorp(%7473) : (i64) -> i64
    %7838 = arith.cmpi ne, %7837, %7836 : i64
    %7839 = scf.if %7838 -> (i64) {
      scf.yield %7473 : i64
    } else {
      %7840 = llvm.mlir.addressof @str782 : !llvm.ptr
      %7841 = arith.constant 16 : i64
      %7842 = func.call @cc_make_string(%7840, %7841) : (!llvm.ptr, i64) -> i64
      %7843 = func.call @cc_nil_value() : () -> i64
      %7844 = func.call @cc_intern(%7842, %7843) : (i64, i64) -> i64
      %7845 = func.call @cc_nil_value() : () -> i64
      %7846 = func.call @cc_cons(%7844, %7845) : (i64, i64) -> i64
      %7847 = func.call @cc_values_pack(%7846) : (i64) -> i64
      func.call @stack_push_pointer(%7844) : (i64) -> ()
      %7848 = func.call @stack_pop_pointer() : () -> i64
      %7849 = llvm.mlir.addressof @str783 : !llvm.ptr
      %7850 = arith.constant 8 : i64
      %7851 = func.call @cc_make_string(%7849, %7850) : (!llvm.ptr, i64) -> i64
      %7852 = llvm.mlir.addressof @str784 : !llvm.ptr
      %7853 = arith.constant 11 : i64
      %7854 = func.call @cc_make_string(%7852, %7853) : (!llvm.ptr, i64) -> i64
      %7855 = func.call @cc_intern(%7851, %7854) : (i64, i64) -> i64
      %7856 = func.call @cc_nil_value() : () -> i64
      %7857 = func.call @cc_cons(%7855, %7856) : (i64, i64) -> i64
      %7858 = func.call @cc_values_pack(%7857) : (i64) -> i64
      func.call @stack_push_pointer(%7855) : (i64) -> ()
      %7859 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7859) : (i64) -> ()
      %7860 = llvm.mlir.addressof @str785 : !llvm.ptr
      %7861 = arith.constant 1 : i64
      %7862 = func.call @cc_make_string(%7860, %7861) : (!llvm.ptr, i64) -> i64
      %7863 = func.call @cc_nil_value() : () -> i64
      %7864 = func.call @cc_intern(%7862, %7863) : (i64, i64) -> i64
      %7865 = func.call @cc_nil_value() : () -> i64
      %7866 = func.call @cc_cons(%7864, %7865) : (i64, i64) -> i64
      %7867 = func.call @cc_values_pack(%7866) : (i64) -> i64
      func.call @stack_push_pointer(%7864) : (i64) -> ()
      %7868 = func.call @stack_pop_pointer() : () -> i64
      %7869 = func.call @stack_pop_pointer() : () -> i64
      %7870 = func.call @cc_cons(%7868, %7869) : (i64, i64) -> i64
      %7871 = llvm.mlir.addressof @str786 : !llvm.ptr
      %7872 = arith.constant 5 : i64
      %7873 = func.call @cc_make_string(%7871, %7872) : (!llvm.ptr, i64) -> i64
      %7874 = func.call @cc_nil_value() : () -> i64
      %7875 = func.call @cc_intern(%7873, %7874) : (i64, i64) -> i64
      %7876 = func.call @cc_nil_value() : () -> i64
      %7877 = func.call @cc_cons(%7875, %7876) : (i64, i64) -> i64
      %7878 = func.call @cc_values_pack(%7877) : (i64) -> i64
      %7879 = func.call @cc_cons(%7875, %7870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7879) : (i64) -> ()
      %7880 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7880) : (i64) -> ()
      %7881 = llvm.mlir.addressof @str787 : !llvm.ptr
      %7882 = arith.constant 4 : i64
      %7883 = func.call @cc_make_string(%7881, %7882) : (!llvm.ptr, i64) -> i64
      %7884 = llvm.mlir.addressof @str788 : !llvm.ptr
      %7885 = arith.constant 11 : i64
      %7886 = func.call @cc_make_string(%7884, %7885) : (!llvm.ptr, i64) -> i64
      %7887 = func.call @cc_intern(%7883, %7886) : (i64, i64) -> i64
      %7888 = func.call @cc_nil_value() : () -> i64
      %7889 = func.call @cc_cons(%7887, %7888) : (i64, i64) -> i64
      %7890 = func.call @cc_values_pack(%7889) : (i64) -> i64
      func.call @stack_push_pointer(%7887) : (i64) -> ()
      %7891 = llvm.mlir.addressof @str789 : !llvm.ptr
      %7892 = arith.constant 3 : i64
      %7893 = func.call @cc_make_string(%7891, %7892) : (!llvm.ptr, i64) -> i64
      %7894 = llvm.mlir.addressof @str790 : !llvm.ptr
      %7895 = arith.constant 11 : i64
      %7896 = func.call @cc_make_string(%7894, %7895) : (!llvm.ptr, i64) -> i64
      %7897 = func.call @cc_intern(%7893, %7896) : (i64, i64) -> i64
      %7898 = func.call @cc_nil_value() : () -> i64
      %7899 = func.call @cc_cons(%7897, %7898) : (i64, i64) -> i64
      %7900 = func.call @cc_values_pack(%7899) : (i64) -> i64
      func.call @stack_push_pointer(%7897) : (i64) -> ()
      %7901 = llvm.mlir.addressof @str791 : !llvm.ptr
      %7902 = arith.constant 13 : i64
      %7903 = func.call @cc_make_string(%7901, %7902) : (!llvm.ptr, i64) -> i64
      %7904 = llvm.mlir.addressof @str792 : !llvm.ptr
      %7905 = arith.constant 11 : i64
      %7906 = func.call @cc_make_string(%7904, %7905) : (!llvm.ptr, i64) -> i64
      %7907 = func.call @cc_intern(%7903, %7906) : (i64, i64) -> i64
      %7908 = func.call @cc_nil_value() : () -> i64
      %7909 = func.call @cc_cons(%7907, %7908) : (i64, i64) -> i64
      %7910 = func.call @cc_values_pack(%7909) : (i64) -> i64
      func.call @stack_push_pointer(%7907) : (i64) -> ()
      %7911 = llvm.mlir.addressof @str793 : !llvm.ptr
      %7912 = arith.constant 6 : i64
      %7913 = func.call @cc_make_string(%7911, %7912) : (!llvm.ptr, i64) -> i64
      %7914 = llvm.mlir.addressof @str794 : !llvm.ptr
      %7915 = arith.constant 11 : i64
      %7916 = func.call @cc_make_string(%7914, %7915) : (!llvm.ptr, i64) -> i64
      %7917 = func.call @cc_intern(%7913, %7916) : (i64, i64) -> i64
      %7918 = func.call @cc_nil_value() : () -> i64
      %7919 = func.call @cc_cons(%7917, %7918) : (i64, i64) -> i64
      %7920 = func.call @cc_values_pack(%7919) : (i64) -> i64
      func.call @stack_push_pointer(%7917) : (i64) -> ()
      %7921 = arith.constant 64 : i64
      %7922 = func.call @cc_box_character(%7921) : (i64) -> i64
      func.call @stack_push_pointer(%7922) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7923 = func.call @stack_pop_pointer() : () -> i64
      %7924 = func.call @stack_pop_pointer() : () -> i64
      %7925 = func.call @cc_cons(%7924, %7923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7925) : (i64) -> ()
      %7926 = func.call @stack_pop_pointer() : () -> i64
      %7927 = func.call @stack_pop_pointer() : () -> i64
      %7928 = func.call @cc_cons(%7927, %7926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7928) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7929 = func.call @stack_pop_pointer() : () -> i64
      %7930 = func.call @stack_pop_pointer() : () -> i64
      %7931 = func.call @cc_cons(%7930, %7929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7931) : (i64) -> ()
      %7932 = func.call @stack_pop_pointer() : () -> i64
      %7933 = func.call @stack_pop_pointer() : () -> i64
      %7934 = func.call @cc_cons(%7933, %7932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7934) : (i64) -> ()
      %7935 = func.call @stack_pop_pointer() : () -> i64
      %7936 = func.call @stack_pop_pointer() : () -> i64
      %7937 = func.call @cc_cons(%7936, %7935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7937) : (i64) -> ()
      %7938 = llvm.mlir.addressof @str795 : !llvm.ptr
      %7939 = arith.constant 4 : i64
      %7940 = func.call @cc_make_string(%7938, %7939) : (!llvm.ptr, i64) -> i64
      %7941 = llvm.mlir.addressof @str796 : !llvm.ptr
      %7942 = arith.constant 11 : i64
      %7943 = func.call @cc_make_string(%7941, %7942) : (!llvm.ptr, i64) -> i64
      %7944 = func.call @cc_intern(%7940, %7943) : (i64, i64) -> i64
      %7945 = func.call @cc_nil_value() : () -> i64
      %7946 = func.call @cc_cons(%7944, %7945) : (i64, i64) -> i64
      %7947 = func.call @cc_values_pack(%7946) : (i64) -> i64
      func.call @stack_push_pointer(%7944) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7948 = func.call @stack_pop_pointer() : () -> i64
      %7949 = func.call @stack_pop_pointer() : () -> i64
      %7950 = func.call @cc_cons(%7949, %7948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7950) : (i64) -> ()
      %7951 = func.call @stack_pop_pointer() : () -> i64
      %7952 = func.call @stack_pop_pointer() : () -> i64
      %7953 = func.call @cc_cons(%7952, %7951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7953) : (i64) -> ()
      %7954 = func.call @stack_pop_pointer() : () -> i64
      %7955 = func.call @stack_pop_pointer() : () -> i64
      %7956 = func.call @cc_cons(%7955, %7954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7956) : (i64) -> ()
      %7957 = func.call @stack_pop_pointer() : () -> i64
      %7958 = func.call @stack_pop_pointer() : () -> i64
      %7959 = func.call @cc_cons(%7957, %7958) : (i64, i64) -> i64
      %7960 = llvm.mlir.addressof @str797 : !llvm.ptr
      %7961 = arith.constant 5 : i64
      %7962 = func.call @cc_make_string(%7960, %7961) : (!llvm.ptr, i64) -> i64
      %7963 = func.call @cc_nil_value() : () -> i64
      %7964 = func.call @cc_intern(%7962, %7963) : (i64, i64) -> i64
      %7965 = func.call @cc_nil_value() : () -> i64
      %7966 = func.call @cc_cons(%7964, %7965) : (i64, i64) -> i64
      %7967 = func.call @cc_values_pack(%7966) : (i64) -> i64
      %7968 = func.call @cc_cons(%7964, %7959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7968) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7969 = func.call @stack_pop_pointer() : () -> i64
      %7970 = func.call @stack_pop_pointer() : () -> i64
      %7971 = func.call @cc_cons(%7970, %7969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7971) : (i64) -> ()
      %7972 = func.call @stack_pop_pointer() : () -> i64
      %7973 = func.call @stack_pop_pointer() : () -> i64
      %7974 = func.call @cc_cons(%7973, %7972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7974) : (i64) -> ()
      %7975 = func.call @stack_pop_pointer() : () -> i64
      %7976 = func.call @stack_pop_pointer() : () -> i64
      %7977 = func.call @cc_cons(%7976, %7975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7977) : (i64) -> ()
      %7978 = func.call @stack_pop_pointer() : () -> i64
      %8072 = arith.constant 206494159077406 : i64
      %8073 = arith.constant 0 : i64
      %8074 = func.call @cc_make_closure(%8072, %8073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8074) : (i64) -> ()
      %8075 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8076 = func.call @stack_pop_pointer() : () -> i64
      %8077 = func.call @stack_pop_pointer() : () -> i64
      %8078 = func.call @cc_cons(%8077, %8076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8078) : (i64) -> ()
      %8079 = func.call @stack_pop_pointer() : () -> i64
      %8080 = func.call @stack_pop_pointer() : () -> i64
      %8081 = func.call @cc_cons(%8080, %8079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8081) : (i64) -> ()
      %8082 = func.call @stack_pop_pointer() : () -> i64
      %8083 = llvm.mlir.addressof @str809 : !llvm.ptr
      %8084 = arith.constant 11 : i64
      %8085 = func.call @cc_make_string(%8083, %8084) : (!llvm.ptr, i64) -> i64
      %8086 = llvm.mlir.addressof @str810 : !llvm.ptr
      %8087 = arith.constant 7 : i64
      %8088 = func.call @cc_make_string(%8086, %8087) : (!llvm.ptr, i64) -> i64
      %8089 = func.call @cc_intern(%8085, %8088) : (i64, i64) -> i64
      %8090 = func.call @cc_nil_value() : () -> i64
      %8091 = func.call @cc_cons(%8089, %8090) : (i64, i64) -> i64
      %8092 = func.call @cc_values_pack(%8091) : (i64) -> i64
      func.call @stack_push_pointer(%8089) : (i64) -> ()
      %8093 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %8094 = func.call @stack_pop_pointer() : () -> i64
      %8095 = llvm.mlir.addressof @str811 : !llvm.ptr
      %8096 = arith.constant 4 : i64
      %8097 = func.call @cc_make_string(%8095, %8096) : (!llvm.ptr, i64) -> i64
      %8098 = llvm.mlir.addressof @str812 : !llvm.ptr
      %8099 = arith.constant 7 : i64
      %8100 = func.call @cc_make_string(%8098, %8099) : (!llvm.ptr, i64) -> i64
      %8101 = func.call @cc_intern(%8097, %8100) : (i64, i64) -> i64
      %8102 = func.call @cc_nil_value() : () -> i64
      %8103 = func.call @cc_cons(%8101, %8102) : (i64, i64) -> i64
      %8104 = func.call @cc_values_pack(%8103) : (i64) -> i64
      func.call @stack_push_pointer(%8101) : (i64) -> ()
      %8105 = func.call @stack_pop_pointer() : () -> i64
      %8106 = llvm.mlir.addressof @str813 : !llvm.ptr
      %8107 = arith.constant 6 : i64
      %8108 = func.call @cc_make_string(%8106, %8107) : (!llvm.ptr, i64) -> i64
      %8109 = func.call @cc_nil_value() : () -> i64
      %8110 = func.call @cc_intern(%8108, %8109) : (i64, i64) -> i64
      %8111 = func.call @cc_nil_value() : () -> i64
      %8112 = func.call @cc_cons(%8110, %8111) : (i64, i64) -> i64
      %8113 = func.call @cc_values_pack(%8112) : (i64) -> i64
      func.call @stack_push_pointer(%8110) : (i64) -> ()
      %8114 = func.call @stack_pop_pointer() : () -> i64
      %8115 = func.call @cc_nil_value() : () -> i64
      %8116 = func.call @cc_errorp(%7848) : (i64) -> i64
      %8117 = arith.cmpi ne, %8116, %8115 : i64
      %8118 = arith.cmpi eq, %8115, %8115 : i64
      %8119 = arith.andi %8117, %8118 : i1
      %8120 = scf.if %8119 -> (i64) {
        scf.yield %7848 : i64
      } else {
        scf.yield %8115 : i64
      }
      %8121 = func.call @cc_errorp(%7978) : (i64) -> i64
      %8122 = arith.cmpi ne, %8121, %8115 : i64
      %8123 = arith.cmpi eq, %8120, %8115 : i64
      %8124 = arith.andi %8122, %8123 : i1
      %8125 = scf.if %8124 -> (i64) {
        scf.yield %7978 : i64
      } else {
        scf.yield %8120 : i64
      }
      %8126 = func.call @cc_errorp(%8075) : (i64) -> i64
      %8127 = arith.cmpi ne, %8126, %8115 : i64
      %8128 = arith.cmpi eq, %8125, %8115 : i64
      %8129 = arith.andi %8127, %8128 : i1
      %8130 = scf.if %8129 -> (i64) {
        scf.yield %8075 : i64
      } else {
        scf.yield %8125 : i64
      }
      %8131 = func.call @cc_errorp(%8082) : (i64) -> i64
      %8132 = arith.cmpi ne, %8131, %8115 : i64
      %8133 = arith.cmpi eq, %8130, %8115 : i64
      %8134 = arith.andi %8132, %8133 : i1
      %8135 = scf.if %8134 -> (i64) {
        scf.yield %8082 : i64
      } else {
        scf.yield %8130 : i64
      }
      %8136 = func.call @cc_errorp(%8093) : (i64) -> i64
      %8137 = arith.cmpi ne, %8136, %8115 : i64
      %8138 = arith.cmpi eq, %8135, %8115 : i64
      %8139 = arith.andi %8137, %8138 : i1
      %8140 = scf.if %8139 -> (i64) {
        scf.yield %8093 : i64
      } else {
        scf.yield %8135 : i64
      }
      %8141 = func.call @cc_errorp(%8094) : (i64) -> i64
      %8142 = arith.cmpi ne, %8141, %8115 : i64
      %8143 = arith.cmpi eq, %8140, %8115 : i64
      %8144 = arith.andi %8142, %8143 : i1
      %8145 = scf.if %8144 -> (i64) {
        scf.yield %8094 : i64
      } else {
        scf.yield %8140 : i64
      }
      %8146 = func.call @cc_errorp(%8105) : (i64) -> i64
      %8147 = arith.cmpi ne, %8146, %8115 : i64
      %8148 = arith.cmpi eq, %8145, %8115 : i64
      %8149 = arith.andi %8147, %8148 : i1
      %8150 = scf.if %8149 -> (i64) {
        scf.yield %8105 : i64
      } else {
        scf.yield %8145 : i64
      }
      %8151 = func.call @cc_errorp(%8114) : (i64) -> i64
      %8152 = arith.cmpi ne, %8151, %8115 : i64
      %8153 = arith.cmpi eq, %8150, %8115 : i64
      %8154 = arith.andi %8152, %8153 : i1
      %8155 = scf.if %8154 -> (i64) {
        scf.yield %8114 : i64
      } else {
        scf.yield %8150 : i64
      }
      %8156 = arith.cmpi ne, %8155, %8115 : i64
      scf.if %8156 {
        func.call @stack_push_pointer(%8155) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7848) : (i64) -> ()
        func.call @stack_push_pointer(%7978) : (i64) -> ()
        func.call @stack_push_pointer(%8075) : (i64) -> ()
        func.call @stack_push_pointer(%8082) : (i64) -> ()
        func.call @stack_push_pointer(%8093) : (i64) -> ()
        func.call @stack_push_pointer(%8094) : (i64) -> ()
        func.call @stack_push_pointer(%8105) : (i64) -> ()
        func.call @stack_push_pointer(%8114) : (i64) -> ()
        %8157 = llvm.mlir.addressof @str814 : !llvm.ptr
        %8158 = func.call @cc_make_function_ref_const(%8157) : (!llvm.ptr) -> i64
        %8159 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8158, %8159) : (i64, i64) -> ()
      }
      %8160 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8160 : i64
    }
    %8161 = func.call @cc_nil_value() : () -> i64
    %8162 = func.call @cc_errorp(%7839) : (i64) -> i64
    %8163 = arith.cmpi ne, %8162, %8161 : i64
    %8164 = scf.if %8163 -> (i64) {
      scf.yield %7839 : i64
    } else {
      %8165 = func.call @cc_nil_value() : () -> i64
      %8166 = func.call @cc_nil_value() : () -> i64
      %8167 = func.call @cc_errorp(%8165) : (i64) -> i64
      %8168 = arith.cmpi ne, %8167, %8166 : i64
      %8169 = scf.if %8168 -> (i64) {
        scf.yield %8165 : i64
      } else {
        %8453 = llvm.mlir.addressof @str837 : !llvm.ptr
        %8454 = arith.constant 31 : i64
        %8455 = func.call @cc_make_string(%8453, %8454) : (!llvm.ptr, i64) -> i64
        %8456 = llvm.mlir.addressof @str838 : !llvm.ptr
        %8457 = arith.constant 15 : i64
        %8458 = func.call @cc_make_string(%8456, %8457) : (!llvm.ptr, i64) -> i64
        %8459 = func.call @cc_nil_value() : () -> i64
        %8460 = func.call @cc_intern(%8458, %8459) : (i64, i64) -> i64
        %8461 = func.call @cc_nil_value() : () -> i64
        %8462 = func.call @cc_cons(%8460, %8461) : (i64, i64) -> i64
        %8463 = func.call @cc_values_pack(%8462) : (i64) -> i64
        %8464 = func.call @cc_register_function_lambda_list_metadata_raw(%8460, %8455) : (i64, i64) -> i64
        %8465 = llvm.mlir.addressof @str839 : !llvm.ptr
        %8466 = func.call @cc_make_function_ref_const(%8465) : (!llvm.ptr) -> i64
        %8467 = llvm.mlir.addressof @str840 : !llvm.ptr
        %8468 = arith.constant 15 : i64
        %8469 = func.call @cc_make_string(%8467, %8468) : (!llvm.ptr, i64) -> i64
        %8470 = func.call @cc_nil_value() : () -> i64
        %8471 = func.call @cc_intern(%8469, %8470) : (i64, i64) -> i64
        %8472 = func.call @cc_nil_value() : () -> i64
        %8473 = func.call @cc_cons(%8471, %8472) : (i64, i64) -> i64
        %8474 = func.call @cc_values_pack(%8473) : (i64) -> i64
        %8475 = func.call @cc_set_symbol_value(%8471, %8466) : (i64, i64) -> i64
        %8476 = llvm.mlir.addressof @str841 : !llvm.ptr
        %8477 = arith.constant 15 : i64
        %8478 = func.call @cc_make_string(%8476, %8477) : (!llvm.ptr, i64) -> i64
        %8479 = func.call @cc_nil_value() : () -> i64
        %8480 = func.call @cc_intern(%8478, %8479) : (i64, i64) -> i64
        %8481 = func.call @cc_nil_value() : () -> i64
        %8482 = func.call @cc_cons(%8480, %8481) : (i64, i64) -> i64
        %8483 = func.call @cc_values_pack(%8482) : (i64) -> i64
        func.call @stack_push_pointer(%8480) : (i64) -> ()
        %8484 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8484 : i64
      }
      %8485 = func.call @cc_nil_value() : () -> i64
      %8486 = func.call @cc_errorp(%8169) : (i64) -> i64
      %8487 = arith.cmpi ne, %8486, %8485 : i64
      %8488 = scf.if %8487 -> (i64) {
        scf.yield %8169 : i64
      } else {
        %8566 = llvm.mlir.addressof @str850 : !llvm.ptr
        %8567 = arith.constant 3 : i64
        %8568 = func.call @cc_make_string(%8566, %8567) : (!llvm.ptr, i64) -> i64
        %8569 = llvm.mlir.addressof @str851 : !llvm.ptr
        %8570 = arith.constant 12 : i64
        %8571 = func.call @cc_make_string(%8569, %8570) : (!llvm.ptr, i64) -> i64
        %8572 = func.call @cc_nil_value() : () -> i64
        %8573 = func.call @cc_intern(%8571, %8572) : (i64, i64) -> i64
        %8574 = func.call @cc_nil_value() : () -> i64
        %8575 = func.call @cc_cons(%8573, %8574) : (i64, i64) -> i64
        %8576 = func.call @cc_values_pack(%8575) : (i64) -> i64
        %8577 = func.call @cc_register_function_lambda_list_metadata_raw(%8573, %8568) : (i64, i64) -> i64
        %8578 = llvm.mlir.addressof @str852 : !llvm.ptr
        %8579 = func.call @cc_make_function_ref_const(%8578) : (!llvm.ptr) -> i64
        %8580 = llvm.mlir.addressof @str853 : !llvm.ptr
        %8581 = arith.constant 12 : i64
        %8582 = func.call @cc_make_string(%8580, %8581) : (!llvm.ptr, i64) -> i64
        %8583 = func.call @cc_nil_value() : () -> i64
        %8584 = func.call @cc_intern(%8582, %8583) : (i64, i64) -> i64
        %8585 = func.call @cc_nil_value() : () -> i64
        %8586 = func.call @cc_cons(%8584, %8585) : (i64, i64) -> i64
        %8587 = func.call @cc_values_pack(%8586) : (i64) -> i64
        %8588 = func.call @cc_set_symbol_value(%8584, %8579) : (i64, i64) -> i64
        %8589 = llvm.mlir.addressof @str854 : !llvm.ptr
        %8590 = arith.constant 12 : i64
        %8591 = func.call @cc_make_string(%8589, %8590) : (!llvm.ptr, i64) -> i64
        %8592 = func.call @cc_nil_value() : () -> i64
        %8593 = func.call @cc_intern(%8591, %8592) : (i64, i64) -> i64
        %8594 = func.call @cc_nil_value() : () -> i64
        %8595 = func.call @cc_cons(%8593, %8594) : (i64, i64) -> i64
        %8596 = func.call @cc_values_pack(%8595) : (i64) -> i64
        func.call @stack_push_pointer(%8593) : (i64) -> ()
        %8597 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8597 : i64
      }
      %8598 = func.call @cc_nil_value() : () -> i64
      %8599 = func.call @cc_errorp(%8488) : (i64) -> i64
      %8600 = arith.cmpi ne, %8599, %8598 : i64
      %8601 = scf.if %8600 -> (i64) {
        scf.yield %8488 : i64
      } else {
        %8685 = llvm.mlir.addressof @str863 : !llvm.ptr
        %8686 = arith.constant 3 : i64
        %8687 = func.call @cc_make_string(%8685, %8686) : (!llvm.ptr, i64) -> i64
        %8688 = llvm.mlir.addressof @str864 : !llvm.ptr
        %8689 = arith.constant 15 : i64
        %8690 = func.call @cc_make_string(%8688, %8689) : (!llvm.ptr, i64) -> i64
        %8691 = func.call @cc_nil_value() : () -> i64
        %8692 = func.call @cc_intern(%8690, %8691) : (i64, i64) -> i64
        %8693 = func.call @cc_nil_value() : () -> i64
        %8694 = func.call @cc_cons(%8692, %8693) : (i64, i64) -> i64
        %8695 = func.call @cc_values_pack(%8694) : (i64) -> i64
        %8696 = func.call @cc_register_function_lambda_list_metadata_raw(%8692, %8687) : (i64, i64) -> i64
        %8697 = llvm.mlir.addressof @str865 : !llvm.ptr
        %8698 = func.call @cc_make_function_ref_const(%8697) : (!llvm.ptr) -> i64
        %8699 = llvm.mlir.addressof @str866 : !llvm.ptr
        %8700 = arith.constant 15 : i64
        %8701 = func.call @cc_make_string(%8699, %8700) : (!llvm.ptr, i64) -> i64
        %8702 = func.call @cc_nil_value() : () -> i64
        %8703 = func.call @cc_intern(%8701, %8702) : (i64, i64) -> i64
        %8704 = func.call @cc_nil_value() : () -> i64
        %8705 = func.call @cc_cons(%8703, %8704) : (i64, i64) -> i64
        %8706 = func.call @cc_values_pack(%8705) : (i64) -> i64
        %8707 = func.call @cc_set_symbol_value(%8703, %8698) : (i64, i64) -> i64
        %8708 = llvm.mlir.addressof @str867 : !llvm.ptr
        %8709 = arith.constant 15 : i64
        %8710 = func.call @cc_make_string(%8708, %8709) : (!llvm.ptr, i64) -> i64
        %8711 = func.call @cc_nil_value() : () -> i64
        %8712 = func.call @cc_intern(%8710, %8711) : (i64, i64) -> i64
        %8713 = func.call @cc_nil_value() : () -> i64
        %8714 = func.call @cc_cons(%8712, %8713) : (i64, i64) -> i64
        %8715 = func.call @cc_values_pack(%8714) : (i64) -> i64
        func.call @stack_push_pointer(%8712) : (i64) -> ()
        %8716 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8716 : i64
      }
      %8717 = func.call @cc_nil_value() : () -> i64
      %8718 = func.call @cc_errorp(%8601) : (i64) -> i64
      %8719 = arith.cmpi ne, %8718, %8717 : i64
      %8720 = scf.if %8719 -> (i64) {
        scf.yield %8601 : i64
      } else {
        %8811 = llvm.mlir.addressof @str876 : !llvm.ptr
        %8812 = arith.constant 13 : i64
        %8813 = func.call @cc_make_string(%8811, %8812) : (!llvm.ptr, i64) -> i64
        %8814 = llvm.mlir.addressof @str877 : !llvm.ptr
        %8815 = arith.constant 22 : i64
        %8816 = func.call @cc_make_string(%8814, %8815) : (!llvm.ptr, i64) -> i64
        %8817 = func.call @cc_nil_value() : () -> i64
        %8818 = func.call @cc_intern(%8816, %8817) : (i64, i64) -> i64
        %8819 = func.call @cc_nil_value() : () -> i64
        %8820 = func.call @cc_cons(%8818, %8819) : (i64, i64) -> i64
        %8821 = func.call @cc_values_pack(%8820) : (i64) -> i64
        %8822 = func.call @cc_register_function_lambda_list_metadata_raw(%8818, %8813) : (i64, i64) -> i64
        %8823 = llvm.mlir.addressof @str878 : !llvm.ptr
        %8824 = func.call @cc_make_function_ref_const(%8823) : (!llvm.ptr) -> i64
        %8825 = llvm.mlir.addressof @str879 : !llvm.ptr
        %8826 = arith.constant 22 : i64
        %8827 = func.call @cc_make_string(%8825, %8826) : (!llvm.ptr, i64) -> i64
        %8828 = func.call @cc_nil_value() : () -> i64
        %8829 = func.call @cc_intern(%8827, %8828) : (i64, i64) -> i64
        %8830 = func.call @cc_nil_value() : () -> i64
        %8831 = func.call @cc_cons(%8829, %8830) : (i64, i64) -> i64
        %8832 = func.call @cc_values_pack(%8831) : (i64) -> i64
        %8833 = func.call @cc_set_symbol_value(%8829, %8824) : (i64, i64) -> i64
        %8834 = llvm.mlir.addressof @str880 : !llvm.ptr
        %8835 = arith.constant 22 : i64
        %8836 = func.call @cc_make_string(%8834, %8835) : (!llvm.ptr, i64) -> i64
        %8837 = func.call @cc_nil_value() : () -> i64
        %8838 = func.call @cc_intern(%8836, %8837) : (i64, i64) -> i64
        %8839 = func.call @cc_nil_value() : () -> i64
        %8840 = func.call @cc_cons(%8838, %8839) : (i64, i64) -> i64
        %8841 = func.call @cc_values_pack(%8840) : (i64) -> i64
        func.call @stack_push_pointer(%8838) : (i64) -> ()
        %8842 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8842 : i64
      }
      %8843 = func.call @cc_nil_value() : () -> i64
      %8844 = func.call @cc_errorp(%8720) : (i64) -> i64
      %8845 = arith.cmpi ne, %8844, %8843 : i64
      %8846 = scf.if %8845 -> (i64) {
        scf.yield %8720 : i64
      } else {
        %8930 = llvm.mlir.addressof @str889 : !llvm.ptr
        %8931 = arith.constant 3 : i64
        %8932 = func.call @cc_make_string(%8930, %8931) : (!llvm.ptr, i64) -> i64
        %8933 = llvm.mlir.addressof @str890 : !llvm.ptr
        %8934 = arith.constant 29 : i64
        %8935 = func.call @cc_make_string(%8933, %8934) : (!llvm.ptr, i64) -> i64
        %8936 = func.call @cc_nil_value() : () -> i64
        %8937 = func.call @cc_intern(%8935, %8936) : (i64, i64) -> i64
        %8938 = func.call @cc_nil_value() : () -> i64
        %8939 = func.call @cc_cons(%8937, %8938) : (i64, i64) -> i64
        %8940 = func.call @cc_values_pack(%8939) : (i64) -> i64
        %8941 = func.call @cc_register_function_lambda_list_metadata_raw(%8937, %8932) : (i64, i64) -> i64
        %8942 = llvm.mlir.addressof @str891 : !llvm.ptr
        %8943 = func.call @cc_make_function_ref_const(%8942) : (!llvm.ptr) -> i64
        %8944 = llvm.mlir.addressof @str892 : !llvm.ptr
        %8945 = arith.constant 29 : i64
        %8946 = func.call @cc_make_string(%8944, %8945) : (!llvm.ptr, i64) -> i64
        %8947 = func.call @cc_nil_value() : () -> i64
        %8948 = func.call @cc_intern(%8946, %8947) : (i64, i64) -> i64
        %8949 = func.call @cc_nil_value() : () -> i64
        %8950 = func.call @cc_cons(%8948, %8949) : (i64, i64) -> i64
        %8951 = func.call @cc_values_pack(%8950) : (i64) -> i64
        %8952 = func.call @cc_set_symbol_value(%8948, %8943) : (i64, i64) -> i64
        %8953 = llvm.mlir.addressof @str893 : !llvm.ptr
        %8954 = arith.constant 29 : i64
        %8955 = func.call @cc_make_string(%8953, %8954) : (!llvm.ptr, i64) -> i64
        %8956 = func.call @cc_nil_value() : () -> i64
        %8957 = func.call @cc_intern(%8955, %8956) : (i64, i64) -> i64
        %8958 = func.call @cc_nil_value() : () -> i64
        %8959 = func.call @cc_cons(%8957, %8958) : (i64, i64) -> i64
        %8960 = func.call @cc_values_pack(%8959) : (i64) -> i64
        func.call @stack_push_pointer(%8957) : (i64) -> ()
        %8961 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %8961 : i64
      }
      %8962 = func.call @cc_nil_value() : () -> i64
      %8963 = func.call @cc_errorp(%8846) : (i64) -> i64
      %8964 = arith.cmpi ne, %8963, %8962 : i64
      %8965 = scf.if %8964 -> (i64) {
        scf.yield %8846 : i64
      } else {
        %9056 = llvm.mlir.addressof @str902 : !llvm.ptr
        %9057 = arith.constant 13 : i64
        %9058 = func.call @cc_make_string(%9056, %9057) : (!llvm.ptr, i64) -> i64
        %9059 = llvm.mlir.addressof @str903 : !llvm.ptr
        %9060 = arith.constant 36 : i64
        %9061 = func.call @cc_make_string(%9059, %9060) : (!llvm.ptr, i64) -> i64
        %9062 = func.call @cc_nil_value() : () -> i64
        %9063 = func.call @cc_intern(%9061, %9062) : (i64, i64) -> i64
        %9064 = func.call @cc_nil_value() : () -> i64
        %9065 = func.call @cc_cons(%9063, %9064) : (i64, i64) -> i64
        %9066 = func.call @cc_values_pack(%9065) : (i64) -> i64
        %9067 = func.call @cc_register_function_lambda_list_metadata_raw(%9063, %9058) : (i64, i64) -> i64
        %9068 = llvm.mlir.addressof @str904 : !llvm.ptr
        %9069 = func.call @cc_make_function_ref_const(%9068) : (!llvm.ptr) -> i64
        %9070 = llvm.mlir.addressof @str905 : !llvm.ptr
        %9071 = arith.constant 36 : i64
        %9072 = func.call @cc_make_string(%9070, %9071) : (!llvm.ptr, i64) -> i64
        %9073 = func.call @cc_nil_value() : () -> i64
        %9074 = func.call @cc_intern(%9072, %9073) : (i64, i64) -> i64
        %9075 = func.call @cc_nil_value() : () -> i64
        %9076 = func.call @cc_cons(%9074, %9075) : (i64, i64) -> i64
        %9077 = func.call @cc_values_pack(%9076) : (i64) -> i64
        %9078 = func.call @cc_set_symbol_value(%9074, %9069) : (i64, i64) -> i64
        %9079 = llvm.mlir.addressof @str906 : !llvm.ptr
        %9080 = arith.constant 36 : i64
        %9081 = func.call @cc_make_string(%9079, %9080) : (!llvm.ptr, i64) -> i64
        %9082 = func.call @cc_nil_value() : () -> i64
        %9083 = func.call @cc_intern(%9081, %9082) : (i64, i64) -> i64
        %9084 = func.call @cc_nil_value() : () -> i64
        %9085 = func.call @cc_cons(%9083, %9084) : (i64, i64) -> i64
        %9086 = func.call @cc_values_pack(%9085) : (i64) -> i64
        func.call @stack_push_pointer(%9083) : (i64) -> ()
        %9087 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9087 : i64
      }
      %9088 = func.call @cc_nil_value() : () -> i64
      %9089 = func.call @cc_errorp(%8965) : (i64) -> i64
      %9090 = arith.cmpi ne, %9089, %9088 : i64
      %9091 = scf.if %9090 -> (i64) {
        scf.yield %8965 : i64
      } else {
        %9175 = llvm.mlir.addressof @str915 : !llvm.ptr
        %9176 = arith.constant 3 : i64
        %9177 = func.call @cc_make_string(%9175, %9176) : (!llvm.ptr, i64) -> i64
        %9178 = llvm.mlir.addressof @str916 : !llvm.ptr
        %9179 = arith.constant 18 : i64
        %9180 = func.call @cc_make_string(%9178, %9179) : (!llvm.ptr, i64) -> i64
        %9181 = func.call @cc_nil_value() : () -> i64
        %9182 = func.call @cc_intern(%9180, %9181) : (i64, i64) -> i64
        %9183 = func.call @cc_nil_value() : () -> i64
        %9184 = func.call @cc_cons(%9182, %9183) : (i64, i64) -> i64
        %9185 = func.call @cc_values_pack(%9184) : (i64) -> i64
        %9186 = func.call @cc_register_function_lambda_list_metadata_raw(%9182, %9177) : (i64, i64) -> i64
        %9187 = llvm.mlir.addressof @str917 : !llvm.ptr
        %9188 = func.call @cc_make_function_ref_const(%9187) : (!llvm.ptr) -> i64
        %9189 = llvm.mlir.addressof @str918 : !llvm.ptr
        %9190 = arith.constant 18 : i64
        %9191 = func.call @cc_make_string(%9189, %9190) : (!llvm.ptr, i64) -> i64
        %9192 = func.call @cc_nil_value() : () -> i64
        %9193 = func.call @cc_intern(%9191, %9192) : (i64, i64) -> i64
        %9194 = func.call @cc_nil_value() : () -> i64
        %9195 = func.call @cc_cons(%9193, %9194) : (i64, i64) -> i64
        %9196 = func.call @cc_values_pack(%9195) : (i64) -> i64
        %9197 = func.call @cc_set_symbol_value(%9193, %9188) : (i64, i64) -> i64
        %9198 = llvm.mlir.addressof @str919 : !llvm.ptr
        %9199 = arith.constant 18 : i64
        %9200 = func.call @cc_make_string(%9198, %9199) : (!llvm.ptr, i64) -> i64
        %9201 = func.call @cc_nil_value() : () -> i64
        %9202 = func.call @cc_intern(%9200, %9201) : (i64, i64) -> i64
        %9203 = func.call @cc_nil_value() : () -> i64
        %9204 = func.call @cc_cons(%9202, %9203) : (i64, i64) -> i64
        %9205 = func.call @cc_values_pack(%9204) : (i64) -> i64
        func.call @stack_push_pointer(%9202) : (i64) -> ()
        %9206 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9206 : i64
      }
      %9207 = func.call @cc_nil_value() : () -> i64
      %9208 = func.call @cc_errorp(%9091) : (i64) -> i64
      %9209 = arith.cmpi ne, %9208, %9207 : i64
      %9210 = scf.if %9209 -> (i64) {
        scf.yield %9091 : i64
      } else {
        %9301 = llvm.mlir.addressof @str928 : !llvm.ptr
        %9302 = arith.constant 13 : i64
        %9303 = func.call @cc_make_string(%9301, %9302) : (!llvm.ptr, i64) -> i64
        %9304 = llvm.mlir.addressof @str929 : !llvm.ptr
        %9305 = arith.constant 25 : i64
        %9306 = func.call @cc_make_string(%9304, %9305) : (!llvm.ptr, i64) -> i64
        %9307 = func.call @cc_nil_value() : () -> i64
        %9308 = func.call @cc_intern(%9306, %9307) : (i64, i64) -> i64
        %9309 = func.call @cc_nil_value() : () -> i64
        %9310 = func.call @cc_cons(%9308, %9309) : (i64, i64) -> i64
        %9311 = func.call @cc_values_pack(%9310) : (i64) -> i64
        %9312 = func.call @cc_register_function_lambda_list_metadata_raw(%9308, %9303) : (i64, i64) -> i64
        %9313 = llvm.mlir.addressof @str930 : !llvm.ptr
        %9314 = func.call @cc_make_function_ref_const(%9313) : (!llvm.ptr) -> i64
        %9315 = llvm.mlir.addressof @str931 : !llvm.ptr
        %9316 = arith.constant 25 : i64
        %9317 = func.call @cc_make_string(%9315, %9316) : (!llvm.ptr, i64) -> i64
        %9318 = func.call @cc_nil_value() : () -> i64
        %9319 = func.call @cc_intern(%9317, %9318) : (i64, i64) -> i64
        %9320 = func.call @cc_nil_value() : () -> i64
        %9321 = func.call @cc_cons(%9319, %9320) : (i64, i64) -> i64
        %9322 = func.call @cc_values_pack(%9321) : (i64) -> i64
        %9323 = func.call @cc_set_symbol_value(%9319, %9314) : (i64, i64) -> i64
        %9324 = llvm.mlir.addressof @str932 : !llvm.ptr
        %9325 = arith.constant 25 : i64
        %9326 = func.call @cc_make_string(%9324, %9325) : (!llvm.ptr, i64) -> i64
        %9327 = func.call @cc_nil_value() : () -> i64
        %9328 = func.call @cc_intern(%9326, %9327) : (i64, i64) -> i64
        %9329 = func.call @cc_nil_value() : () -> i64
        %9330 = func.call @cc_cons(%9328, %9329) : (i64, i64) -> i64
        %9331 = func.call @cc_values_pack(%9330) : (i64) -> i64
        func.call @stack_push_pointer(%9328) : (i64) -> ()
        %9332 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9332 : i64
      }
      %9333 = func.call @cc_nil_value() : () -> i64
      %9334 = func.call @cc_errorp(%9210) : (i64) -> i64
      %9335 = arith.cmpi ne, %9334, %9333 : i64
      %9336 = scf.if %9335 -> (i64) {
        scf.yield %9210 : i64
      } else {
        %9337 = llvm.mlir.addressof @str933 : !llvm.ptr
        %9338 = arith.constant 10 : i64
        %9339 = func.call @cc_make_string(%9337, %9338) : (!llvm.ptr, i64) -> i64
        %9340 = func.call @cc_nil_value() : () -> i64
        %9341 = func.call @cc_intern(%9339, %9340) : (i64, i64) -> i64
        %9342 = func.call @cc_nil_value() : () -> i64
        %9343 = func.call @cc_cons(%9341, %9342) : (i64, i64) -> i64
        %9344 = func.call @cc_values_pack(%9343) : (i64) -> i64
        func.call @stack_push_pointer(%9341) : (i64) -> ()
        %9345 = func.call @stack_pop_pointer() : () -> i64
        %9346 = llvm.mlir.addressof @str934 : !llvm.ptr
        %9347 = arith.constant 4 : i64
        %9348 = func.call @cc_make_string(%9346, %9347) : (!llvm.ptr, i64) -> i64
        %9349 = func.call @cc_nil_value() : () -> i64
        %9350 = func.call @cc_intern(%9348, %9349) : (i64, i64) -> i64
        %9351 = func.call @cc_nil_value() : () -> i64
        %9352 = func.call @cc_cons(%9350, %9351) : (i64, i64) -> i64
        %9353 = func.call @cc_values_pack(%9352) : (i64) -> i64
        func.call @stack_push_pointer(%9350) : (i64) -> ()
        %9354 = func.call @stack_pop_pointer() : () -> i64
        %9355 = llvm.mlir.addressof @str935 : !llvm.ptr
        %9356 = arith.constant 18 : i64
        %9357 = func.call @cc_make_string(%9355, %9356) : (!llvm.ptr, i64) -> i64
        %9358 = func.call @cc_nil_value() : () -> i64
        %9359 = func.call @cc_intern(%9357, %9358) : (i64, i64) -> i64
        %9360 = func.call @cc_nil_value() : () -> i64
        %9361 = func.call @cc_cons(%9359, %9360) : (i64, i64) -> i64
        %9362 = func.call @cc_values_pack(%9361) : (i64) -> i64
        func.call @stack_push_pointer(%9359) : (i64) -> ()
        %9363 = func.call @stack_pop_pointer() : () -> i64
        %9364 = llvm.mlir.addressof @str936 : !llvm.ptr
        %9365 = arith.constant 7 : i64
        %9366 = func.call @cc_make_string(%9364, %9365) : (!llvm.ptr, i64) -> i64
        %9367 = func.call @cc_nil_value() : () -> i64
        %9368 = func.call @cc_intern(%9366, %9367) : (i64, i64) -> i64
        %9369 = func.call @cc_nil_value() : () -> i64
        %9370 = func.call @cc_cons(%9368, %9369) : (i64, i64) -> i64
        %9371 = func.call @cc_values_pack(%9370) : (i64) -> i64
        func.call @stack_push_pointer(%9368) : (i64) -> ()
        %9372 = func.call @stack_pop_pointer() : () -> i64
        %9373 = func.call @cc_nil_value() : () -> i64
        %9374 = func.call @cc_errorp(%9354) : (i64) -> i64
        %9375 = arith.cmpi ne, %9374, %9373 : i64
        %9376 = arith.cmpi eq, %9373, %9373 : i64
        %9377 = arith.andi %9375, %9376 : i1
        %9378 = scf.if %9377 -> (i64) {
          scf.yield %9354 : i64
        } else {
          scf.yield %9373 : i64
        }
        %9379 = func.call @cc_errorp(%9363) : (i64) -> i64
        %9380 = arith.cmpi ne, %9379, %9373 : i64
        %9381 = arith.cmpi eq, %9378, %9373 : i64
        %9382 = arith.andi %9380, %9381 : i1
        %9383 = scf.if %9382 -> (i64) {
          scf.yield %9363 : i64
        } else {
          scf.yield %9378 : i64
        }
        %9384 = func.call @cc_errorp(%9372) : (i64) -> i64
        %9385 = arith.cmpi ne, %9384, %9373 : i64
        %9386 = arith.cmpi eq, %9383, %9373 : i64
        %9387 = arith.andi %9385, %9386 : i1
        %9388 = scf.if %9387 -> (i64) {
          scf.yield %9372 : i64
        } else {
          scf.yield %9383 : i64
        }
        %9389 = arith.cmpi ne, %9388, %9373 : i64
        scf.if %9389 {
          func.call @stack_push_pointer(%9388) : (i64) -> ()
        } else {
          %9390 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9390) : (i64) -> ()
          func.call @stack_push_pointer(%9372) : (i64) -> ()
          %9391 = func.call @stack_pop_pointer() : () -> i64
          %9392 = func.call @stack_pop_pointer() : () -> i64
          %9393 = func.call @cc_cons(%9391, %9392) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9393) : (i64) -> ()
          func.call @stack_push_pointer(%9363) : (i64) -> ()
          %9394 = func.call @stack_pop_pointer() : () -> i64
          %9395 = func.call @stack_pop_pointer() : () -> i64
          %9396 = func.call @cc_cons(%9394, %9395) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9396) : (i64) -> ()
          func.call @stack_push_pointer(%9354) : (i64) -> ()
          %9397 = func.call @stack_pop_pointer() : () -> i64
          %9398 = func.call @stack_pop_pointer() : () -> i64
          %9399 = func.call @cc_cons(%9397, %9398) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9399) : (i64) -> ()
        }
        %9400 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9401 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9402 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9403 = func.call @stack_pop_pointer() : () -> i64
        %9404 = func.call @cc_nil_value() : () -> i64
        %9405 = func.call @cc_errorp(%9401) : (i64) -> i64
        %9406 = arith.cmpi ne, %9405, %9404 : i64
        %9407 = arith.cmpi eq, %9404, %9404 : i64
        %9408 = arith.andi %9406, %9407 : i1
        %9409 = scf.if %9408 -> (i64) {
          scf.yield %9401 : i64
        } else {
          scf.yield %9404 : i64
        }
        %9410 = func.call @cc_errorp(%9402) : (i64) -> i64
        %9411 = arith.cmpi ne, %9410, %9404 : i64
        %9412 = arith.cmpi eq, %9409, %9404 : i64
        %9413 = arith.andi %9411, %9412 : i1
        %9414 = scf.if %9413 -> (i64) {
          scf.yield %9402 : i64
        } else {
          scf.yield %9409 : i64
        }
        %9415 = func.call @cc_errorp(%9403) : (i64) -> i64
        %9416 = arith.cmpi ne, %9415, %9404 : i64
        %9417 = arith.cmpi eq, %9414, %9404 : i64
        %9418 = arith.andi %9416, %9417 : i1
        %9419 = scf.if %9418 -> (i64) {
          scf.yield %9403 : i64
        } else {
          scf.yield %9414 : i64
        }
        %9420 = arith.cmpi ne, %9419, %9404 : i64
        scf.if %9420 {
          func.call @stack_push_pointer(%9419) : (i64) -> ()
        } else {
          %9421 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9421) : (i64) -> ()
          func.call @stack_push_pointer(%9403) : (i64) -> ()
          %9422 = func.call @stack_pop_pointer() : () -> i64
          %9423 = func.call @stack_pop_pointer() : () -> i64
          %9424 = func.call @cc_cons(%9422, %9423) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9424) : (i64) -> ()
          func.call @stack_push_pointer(%9402) : (i64) -> ()
          %9425 = func.call @stack_pop_pointer() : () -> i64
          %9426 = func.call @stack_pop_pointer() : () -> i64
          %9427 = func.call @cc_cons(%9425, %9426) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9427) : (i64) -> ()
          func.call @stack_push_pointer(%9401) : (i64) -> ()
          %9428 = func.call @stack_pop_pointer() : () -> i64
          %9429 = func.call @stack_pop_pointer() : () -> i64
          %9430 = func.call @cc_cons(%9428, %9429) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9430) : (i64) -> ()
        }
        %9431 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9432 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9433 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %9434 = func.call @stack_pop_pointer() : () -> i64
        %9435 = func.call @cc_nil_value() : () -> i64
        %9436 = func.call @cc_errorp(%9432) : (i64) -> i64
        %9437 = arith.cmpi ne, %9436, %9435 : i64
        %9438 = arith.cmpi eq, %9435, %9435 : i64
        %9439 = arith.andi %9437, %9438 : i1
        %9440 = scf.if %9439 -> (i64) {
          scf.yield %9432 : i64
        } else {
          scf.yield %9435 : i64
        }
        %9441 = func.call @cc_errorp(%9433) : (i64) -> i64
        %9442 = arith.cmpi ne, %9441, %9435 : i64
        %9443 = arith.cmpi eq, %9440, %9435 : i64
        %9444 = arith.andi %9442, %9443 : i1
        %9445 = scf.if %9444 -> (i64) {
          scf.yield %9433 : i64
        } else {
          scf.yield %9440 : i64
        }
        %9446 = func.call @cc_errorp(%9434) : (i64) -> i64
        %9447 = arith.cmpi ne, %9446, %9435 : i64
        %9448 = arith.cmpi eq, %9445, %9435 : i64
        %9449 = arith.andi %9447, %9448 : i1
        %9450 = scf.if %9449 -> (i64) {
          scf.yield %9434 : i64
        } else {
          scf.yield %9445 : i64
        }
        %9451 = arith.cmpi ne, %9450, %9435 : i64
        scf.if %9451 {
          func.call @stack_push_pointer(%9450) : (i64) -> ()
        } else {
          %9452 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9452) : (i64) -> ()
          func.call @stack_push_pointer(%9434) : (i64) -> ()
          %9453 = func.call @stack_pop_pointer() : () -> i64
          %9454 = func.call @stack_pop_pointer() : () -> i64
          %9455 = func.call @cc_cons(%9453, %9454) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9455) : (i64) -> ()
          func.call @stack_push_pointer(%9433) : (i64) -> ()
          %9456 = func.call @stack_pop_pointer() : () -> i64
          %9457 = func.call @stack_pop_pointer() : () -> i64
          %9458 = func.call @cc_cons(%9456, %9457) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9458) : (i64) -> ()
          func.call @stack_push_pointer(%9432) : (i64) -> ()
          %9459 = func.call @stack_pop_pointer() : () -> i64
          %9460 = func.call @stack_pop_pointer() : () -> i64
          %9461 = func.call @cc_cons(%9459, %9460) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9461) : (i64) -> ()
        }
        %9462 = func.call @stack_pop_pointer() : () -> i64
        %9463 = llvm.mlir.addressof @str937 : !llvm.ptr
        %9464 = arith.constant 15 : i64
        %9465 = func.call @cc_make_string(%9463, %9464) : (!llvm.ptr, i64) -> i64
        %9466 = func.call @cc_nil_value() : () -> i64
        %9467 = func.call @cc_intern(%9465, %9466) : (i64, i64) -> i64
        %9468 = func.call @cc_nil_value() : () -> i64
        %9469 = func.call @cc_cons(%9467, %9468) : (i64, i64) -> i64
        %9470 = func.call @cc_values_pack(%9469) : (i64) -> i64
        func.call @stack_push_pointer(%9467) : (i64) -> ()
        %9471 = func.call @stack_pop_pointer() : () -> i64
        %9472 = func.call @cc_nil_value() : () -> i64
        %9473 = func.call @cc_errorp(%9471) : (i64) -> i64
        %9474 = arith.cmpi ne, %9473, %9472 : i64
        %9475 = arith.cmpi eq, %9472, %9472 : i64
        %9476 = arith.andi %9474, %9475 : i1
        %9477 = scf.if %9476 -> (i64) {
          scf.yield %9471 : i64
        } else {
          scf.yield %9472 : i64
        }
        %9478 = arith.cmpi ne, %9477, %9472 : i64
        scf.if %9478 {
          func.call @stack_push_pointer(%9477) : (i64) -> ()
        } else {
          %9479 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9479) : (i64) -> ()
          func.call @stack_push_pointer(%9471) : (i64) -> ()
          %9480 = func.call @stack_pop_pointer() : () -> i64
          %9481 = func.call @stack_pop_pointer() : () -> i64
          %9482 = func.call @cc_cons(%9480, %9481) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9482) : (i64) -> ()
        }
        %9483 = func.call @stack_pop_pointer() : () -> i64
        %9484 = llvm.mlir.addressof @str938 : !llvm.ptr
        %9485 = arith.constant 29 : i64
        %9486 = func.call @cc_make_string(%9484, %9485) : (!llvm.ptr, i64) -> i64
        %9487 = func.call @cc_nil_value() : () -> i64
        %9488 = func.call @cc_intern(%9486, %9487) : (i64, i64) -> i64
        %9489 = func.call @cc_nil_value() : () -> i64
        %9490 = func.call @cc_cons(%9488, %9489) : (i64, i64) -> i64
        %9491 = func.call @cc_values_pack(%9490) : (i64) -> i64
        func.call @stack_push_pointer(%9488) : (i64) -> ()
        %9492 = func.call @stack_pop_pointer() : () -> i64
        %9493 = func.call @cc_nil_value() : () -> i64
        %9494 = func.call @cc_errorp(%9492) : (i64) -> i64
        %9495 = arith.cmpi ne, %9494, %9493 : i64
        %9496 = arith.cmpi eq, %9493, %9493 : i64
        %9497 = arith.andi %9495, %9496 : i1
        %9498 = scf.if %9497 -> (i64) {
          scf.yield %9492 : i64
        } else {
          scf.yield %9493 : i64
        }
        %9499 = arith.cmpi ne, %9498, %9493 : i64
        scf.if %9499 {
          func.call @stack_push_pointer(%9498) : (i64) -> ()
        } else {
          %9500 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9500) : (i64) -> ()
          func.call @stack_push_pointer(%9492) : (i64) -> ()
          %9501 = func.call @stack_pop_pointer() : () -> i64
          %9502 = func.call @stack_pop_pointer() : () -> i64
          %9503 = func.call @cc_cons(%9501, %9502) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9503) : (i64) -> ()
        }
        %9504 = func.call @stack_pop_pointer() : () -> i64
        %9505 = llvm.mlir.addressof @str939 : !llvm.ptr
        %9506 = arith.constant 18 : i64
        %9507 = func.call @cc_make_string(%9505, %9506) : (!llvm.ptr, i64) -> i64
        %9508 = func.call @cc_nil_value() : () -> i64
        %9509 = func.call @cc_intern(%9507, %9508) : (i64, i64) -> i64
        %9510 = func.call @cc_nil_value() : () -> i64
        %9511 = func.call @cc_cons(%9509, %9510) : (i64, i64) -> i64
        %9512 = func.call @cc_values_pack(%9511) : (i64) -> i64
        func.call @stack_push_pointer(%9509) : (i64) -> ()
        %9513 = func.call @stack_pop_pointer() : () -> i64
        %9514 = func.call @cc_nil_value() : () -> i64
        %9515 = func.call @cc_errorp(%9513) : (i64) -> i64
        %9516 = arith.cmpi ne, %9515, %9514 : i64
        %9517 = arith.cmpi eq, %9514, %9514 : i64
        %9518 = arith.andi %9516, %9517 : i1
        %9519 = scf.if %9518 -> (i64) {
          scf.yield %9513 : i64
        } else {
          scf.yield %9514 : i64
        }
        %9520 = arith.cmpi ne, %9519, %9514 : i64
        scf.if %9520 {
          func.call @stack_push_pointer(%9519) : (i64) -> ()
        } else {
          %9521 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9521) : (i64) -> ()
          func.call @stack_push_pointer(%9513) : (i64) -> ()
          %9522 = func.call @stack_pop_pointer() : () -> i64
          %9523 = func.call @stack_pop_pointer() : () -> i64
          %9524 = func.call @cc_cons(%9522, %9523) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9524) : (i64) -> ()
        }
        %9525 = func.call @stack_pop_pointer() : () -> i64
        %9526 = func.call @cc_nil_value() : () -> i64
        %9527 = func.call @cc_errorp(%9483) : (i64) -> i64
        %9528 = arith.cmpi ne, %9527, %9526 : i64
        %9529 = arith.cmpi eq, %9526, %9526 : i64
        %9530 = arith.andi %9528, %9529 : i1
        %9531 = scf.if %9530 -> (i64) {
          scf.yield %9483 : i64
        } else {
          scf.yield %9526 : i64
        }
        %9532 = func.call @cc_errorp(%9504) : (i64) -> i64
        %9533 = arith.cmpi ne, %9532, %9526 : i64
        %9534 = arith.cmpi eq, %9531, %9526 : i64
        %9535 = arith.andi %9533, %9534 : i1
        %9536 = scf.if %9535 -> (i64) {
          scf.yield %9504 : i64
        } else {
          scf.yield %9531 : i64
        }
        %9537 = func.call @cc_errorp(%9525) : (i64) -> i64
        %9538 = arith.cmpi ne, %9537, %9526 : i64
        %9539 = arith.cmpi eq, %9536, %9526 : i64
        %9540 = arith.andi %9538, %9539 : i1
        %9541 = scf.if %9540 -> (i64) {
          scf.yield %9525 : i64
        } else {
          scf.yield %9536 : i64
        }
        %9542 = arith.cmpi ne, %9541, %9526 : i64
        scf.if %9542 {
          func.call @stack_push_pointer(%9541) : (i64) -> ()
        } else {
          %9543 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9543) : (i64) -> ()
          func.call @stack_push_pointer(%9525) : (i64) -> ()
          %9544 = func.call @stack_pop_pointer() : () -> i64
          %9545 = func.call @stack_pop_pointer() : () -> i64
          %9546 = func.call @cc_cons(%9544, %9545) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9546) : (i64) -> ()
          func.call @stack_push_pointer(%9504) : (i64) -> ()
          %9547 = func.call @stack_pop_pointer() : () -> i64
          %9548 = func.call @stack_pop_pointer() : () -> i64
          %9549 = func.call @cc_cons(%9547, %9548) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9549) : (i64) -> ()
          func.call @stack_push_pointer(%9483) : (i64) -> ()
          %9550 = func.call @stack_pop_pointer() : () -> i64
          %9551 = func.call @stack_pop_pointer() : () -> i64
          %9552 = func.call @cc_cons(%9550, %9551) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9552) : (i64) -> ()
        }
        %9553 = func.call @stack_pop_pointer() : () -> i64
        %9554 = llvm.mlir.addressof @str940 : !llvm.ptr
        %9555 = arith.constant 10 : i64
        %9556 = func.call @cc_make_string(%9554, %9555) : (!llvm.ptr, i64) -> i64
        %9557 = func.call @cc_nil_value() : () -> i64
        %9558 = func.call @cc_intern(%9556, %9557) : (i64, i64) -> i64
        %9559 = func.call @cc_nil_value() : () -> i64
        %9560 = func.call @cc_cons(%9558, %9559) : (i64, i64) -> i64
        %9561 = func.call @cc_values_pack(%9560) : (i64) -> i64
        func.call @stack_push_pointer(%9558) : (i64) -> ()
        %9562 = func.call @stack_pop_pointer() : () -> i64
        %9563 = llvm.mlir.addressof @str941 : !llvm.ptr
        %9564 = arith.constant 10 : i64
        %9565 = func.call @cc_make_string(%9563, %9564) : (!llvm.ptr, i64) -> i64
        %9566 = func.call @cc_nil_value() : () -> i64
        %9567 = func.call @cc_intern(%9565, %9566) : (i64, i64) -> i64
        %9568 = func.call @cc_nil_value() : () -> i64
        %9569 = func.call @cc_cons(%9567, %9568) : (i64, i64) -> i64
        %9570 = func.call @cc_values_pack(%9569) : (i64) -> i64
        func.call @stack_push_pointer(%9567) : (i64) -> ()
        %9571 = func.call @stack_pop_pointer() : () -> i64
        %9572 = llvm.mlir.addressof @str942 : !llvm.ptr
        %9573 = arith.constant 16 : i64
        %9574 = func.call @cc_make_string(%9572, %9573) : (!llvm.ptr, i64) -> i64
        %9575 = func.call @cc_nil_value() : () -> i64
        %9576 = func.call @cc_intern(%9574, %9575) : (i64, i64) -> i64
        %9577 = func.call @cc_nil_value() : () -> i64
        %9578 = func.call @cc_cons(%9576, %9577) : (i64, i64) -> i64
        %9579 = func.call @cc_values_pack(%9578) : (i64) -> i64
        func.call @stack_push_pointer(%9576) : (i64) -> ()
        %9580 = func.call @stack_pop_pointer() : () -> i64
        %9581 = func.call @cc_nil_value() : () -> i64
        %9582 = func.call @cc_errorp(%9571) : (i64) -> i64
        %9583 = arith.cmpi ne, %9582, %9581 : i64
        %9584 = arith.cmpi eq, %9581, %9581 : i64
        %9585 = arith.andi %9583, %9584 : i1
        %9586 = scf.if %9585 -> (i64) {
          scf.yield %9571 : i64
        } else {
          scf.yield %9581 : i64
        }
        %9587 = func.call @cc_errorp(%9580) : (i64) -> i64
        %9588 = arith.cmpi ne, %9587, %9581 : i64
        %9589 = arith.cmpi eq, %9586, %9581 : i64
        %9590 = arith.andi %9588, %9589 : i1
        %9591 = scf.if %9590 -> (i64) {
          scf.yield %9580 : i64
        } else {
          scf.yield %9586 : i64
        }
        %9592 = arith.cmpi ne, %9591, %9581 : i64
        scf.if %9592 {
          func.call @stack_push_pointer(%9591) : (i64) -> ()
        } else {
          %9593 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%9593) : (i64) -> ()
          func.call @stack_push_pointer(%9580) : (i64) -> ()
          %9594 = func.call @stack_pop_pointer() : () -> i64
          %9595 = func.call @stack_pop_pointer() : () -> i64
          %9596 = func.call @cc_cons(%9594, %9595) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9596) : (i64) -> ()
          func.call @stack_push_pointer(%9571) : (i64) -> ()
          %9597 = func.call @stack_pop_pointer() : () -> i64
          %9598 = func.call @stack_pop_pointer() : () -> i64
          %9599 = func.call @cc_cons(%9597, %9598) : (i64, i64) -> i64
          func.call @stack_push_pointer(%9599) : (i64) -> ()
        }
        %9600 = func.call @stack_pop_pointer() : () -> i64
        %9601 = func.call @cc_nil_value() : () -> i64
        %9602 = func.call @cc_errorp(%9345) : (i64) -> i64
        %9603 = arith.cmpi ne, %9602, %9601 : i64
        %9604 = arith.cmpi eq, %9601, %9601 : i64
        %9605 = arith.andi %9603, %9604 : i1
        %9606 = scf.if %9605 -> (i64) {
          scf.yield %9345 : i64
        } else {
          scf.yield %9601 : i64
        }
        %9607 = func.call @cc_errorp(%9400) : (i64) -> i64
        %9608 = arith.cmpi ne, %9607, %9601 : i64
        %9609 = arith.cmpi eq, %9606, %9601 : i64
        %9610 = arith.andi %9608, %9609 : i1
        %9611 = scf.if %9610 -> (i64) {
          scf.yield %9400 : i64
        } else {
          scf.yield %9606 : i64
        }
        %9612 = func.call @cc_errorp(%9431) : (i64) -> i64
        %9613 = arith.cmpi ne, %9612, %9601 : i64
        %9614 = arith.cmpi eq, %9611, %9601 : i64
        %9615 = arith.andi %9613, %9614 : i1
        %9616 = scf.if %9615 -> (i64) {
          scf.yield %9431 : i64
        } else {
          scf.yield %9611 : i64
        }
        %9617 = func.call @cc_errorp(%9462) : (i64) -> i64
        %9618 = arith.cmpi ne, %9617, %9601 : i64
        %9619 = arith.cmpi eq, %9616, %9601 : i64
        %9620 = arith.andi %9618, %9619 : i1
        %9621 = scf.if %9620 -> (i64) {
          scf.yield %9462 : i64
        } else {
          scf.yield %9616 : i64
        }
        %9622 = func.call @cc_errorp(%9553) : (i64) -> i64
        %9623 = arith.cmpi ne, %9622, %9601 : i64
        %9624 = arith.cmpi eq, %9621, %9601 : i64
        %9625 = arith.andi %9623, %9624 : i1
        %9626 = scf.if %9625 -> (i64) {
          scf.yield %9553 : i64
        } else {
          scf.yield %9621 : i64
        }
        %9627 = func.call @cc_errorp(%9562) : (i64) -> i64
        %9628 = arith.cmpi ne, %9627, %9601 : i64
        %9629 = arith.cmpi eq, %9626, %9601 : i64
        %9630 = arith.andi %9628, %9629 : i1
        %9631 = scf.if %9630 -> (i64) {
          scf.yield %9562 : i64
        } else {
          scf.yield %9626 : i64
        }
        %9632 = func.call @cc_errorp(%9600) : (i64) -> i64
        %9633 = arith.cmpi ne, %9632, %9601 : i64
        %9634 = arith.cmpi eq, %9631, %9601 : i64
        %9635 = arith.andi %9633, %9634 : i1
        %9636 = scf.if %9635 -> (i64) {
          scf.yield %9600 : i64
        } else {
          scf.yield %9631 : i64
        }
        %9637 = arith.cmpi ne, %9636, %9601 : i64
        scf.if %9637 {
          func.call @stack_push_pointer(%9636) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%9345) : (i64) -> ()
          func.call @stack_push_pointer(%9400) : (i64) -> ()
          func.call @stack_push_pointer(%9431) : (i64) -> ()
          func.call @stack_push_pointer(%9462) : (i64) -> ()
          func.call @stack_push_pointer(%9553) : (i64) -> ()
          func.call @stack_push_pointer(%9562) : (i64) -> ()
          func.call @stack_push_pointer(%9600) : (i64) -> ()
          %9638 = llvm.mlir.addressof @str943 : !llvm.ptr
          %9639 = func.call @cc_make_function_ref_const(%9638) : (!llvm.ptr) -> i64
          %9640 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%9639, %9640) : (i64, i64) -> ()
        }
        %9641 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9641 : i64
      }
      %9642 = func.call @cc_nil_value() : () -> i64
      %9643 = func.call @cc_errorp(%9336) : (i64) -> i64
      %9644 = arith.cmpi ne, %9643, %9642 : i64
      %9645 = scf.if %9644 -> (i64) {
        scf.yield %9336 : i64
      } else {
        %9723 = llvm.mlir.addressof @str952 : !llvm.ptr
        %9724 = arith.constant 3 : i64
        %9725 = func.call @cc_make_string(%9723, %9724) : (!llvm.ptr, i64) -> i64
        %9726 = llvm.mlir.addressof @str953 : !llvm.ptr
        %9727 = arith.constant 15 : i64
        %9728 = func.call @cc_make_string(%9726, %9727) : (!llvm.ptr, i64) -> i64
        %9729 = func.call @cc_nil_value() : () -> i64
        %9730 = func.call @cc_intern(%9728, %9729) : (i64, i64) -> i64
        %9731 = func.call @cc_nil_value() : () -> i64
        %9732 = func.call @cc_cons(%9730, %9731) : (i64, i64) -> i64
        %9733 = func.call @cc_values_pack(%9732) : (i64) -> i64
        %9734 = func.call @cc_register_function_lambda_list_metadata_raw(%9730, %9725) : (i64, i64) -> i64
        %9735 = llvm.mlir.addressof @str954 : !llvm.ptr
        %9736 = func.call @cc_make_function_ref_const(%9735) : (!llvm.ptr) -> i64
        %9737 = llvm.mlir.addressof @str955 : !llvm.ptr
        %9738 = arith.constant 15 : i64
        %9739 = func.call @cc_make_string(%9737, %9738) : (!llvm.ptr, i64) -> i64
        %9740 = func.call @cc_nil_value() : () -> i64
        %9741 = func.call @cc_intern(%9739, %9740) : (i64, i64) -> i64
        %9742 = func.call @cc_nil_value() : () -> i64
        %9743 = func.call @cc_cons(%9741, %9742) : (i64, i64) -> i64
        %9744 = func.call @cc_values_pack(%9743) : (i64) -> i64
        %9745 = func.call @cc_set_symbol_value(%9741, %9736) : (i64, i64) -> i64
        %9746 = llvm.mlir.addressof @str956 : !llvm.ptr
        %9747 = arith.constant 15 : i64
        %9748 = func.call @cc_make_string(%9746, %9747) : (!llvm.ptr, i64) -> i64
        %9749 = func.call @cc_nil_value() : () -> i64
        %9750 = func.call @cc_intern(%9748, %9749) : (i64, i64) -> i64
        %9751 = func.call @cc_nil_value() : () -> i64
        %9752 = func.call @cc_cons(%9750, %9751) : (i64, i64) -> i64
        %9753 = func.call @cc_values_pack(%9752) : (i64) -> i64
        func.call @stack_push_pointer(%9750) : (i64) -> ()
        %9754 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9754 : i64
      }
      %9755 = func.call @cc_nil_value() : () -> i64
      %9756 = func.call @cc_errorp(%9645) : (i64) -> i64
      %9757 = arith.cmpi ne, %9756, %9755 : i64
      %9758 = scf.if %9757 -> (i64) {
        scf.yield %9645 : i64
      } else {
        %9759 = llvm.mlir.addressof @str957 : !llvm.ptr
        %9760 = arith.constant 10 : i64
        %9761 = func.call @cc_make_string(%9759, %9760) : (!llvm.ptr, i64) -> i64
        %9762 = func.call @cc_nil_value() : () -> i64
        %9763 = func.call @cc_intern(%9761, %9762) : (i64, i64) -> i64
        %9764 = func.call @cc_nil_value() : () -> i64
        %9765 = func.call @cc_cons(%9763, %9764) : (i64, i64) -> i64
        %9766 = func.call @cc_values_pack(%9765) : (i64) -> i64
        func.call @stack_push_pointer(%9763) : (i64) -> ()
        %9767 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9767 : i64
      }
      func.call @stack_push_pointer(%9758) : (i64) -> ()
      %9768 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9768 : i64
    }
    %9769 = func.call @cc_nil_value() : () -> i64
    %9770 = func.call @cc_errorp(%8164) : (i64) -> i64
    %9771 = arith.cmpi ne, %9770, %9769 : i64
    %9772 = scf.if %9771 -> (i64) {
      scf.yield %8164 : i64
    } else {
      %9773 = llvm.mlir.addressof @str958 : !llvm.ptr
      %9774 = arith.constant 9 : i64
      %9775 = func.call @cc_make_string(%9773, %9774) : (!llvm.ptr, i64) -> i64
      %9776 = func.call @cc_nil_value() : () -> i64
      %9777 = func.call @cc_intern(%9775, %9776) : (i64, i64) -> i64
      %9778 = func.call @cc_nil_value() : () -> i64
      %9779 = func.call @cc_cons(%9777, %9778) : (i64, i64) -> i64
      %9780 = func.call @cc_values_pack(%9779) : (i64) -> i64
      func.call @stack_push_pointer(%9777) : (i64) -> ()
      %9781 = func.call @stack_pop_pointer() : () -> i64
      %9796 = arith.constant 206494159077416 : i64
      %9797 = arith.constant 0 : i64
      %9798 = func.call @cc_make_closure(%9796, %9797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9798) : (i64) -> ()
      %9799 = func.call @stack_pop_pointer() : () -> i64
      %9800 = func.call @cc_nil_value() : () -> i64
      %9801 = func.call @cc_errorp(%9781) : (i64) -> i64
      %9802 = arith.cmpi ne, %9801, %9800 : i64
      %9803 = arith.cmpi eq, %9800, %9800 : i64
      %9804 = arith.andi %9802, %9803 : i1
      %9805 = scf.if %9804 -> (i64) {
        scf.yield %9781 : i64
      } else {
        scf.yield %9800 : i64
      }
      %9806 = func.call @cc_errorp(%9799) : (i64) -> i64
      %9807 = arith.cmpi ne, %9806, %9800 : i64
      %9808 = arith.cmpi eq, %9805, %9800 : i64
      %9809 = arith.andi %9807, %9808 : i1
      %9810 = scf.if %9809 -> (i64) {
        scf.yield %9799 : i64
      } else {
        scf.yield %9805 : i64
      }
      %9811 = arith.cmpi ne, %9810, %9800 : i64
      scf.if %9811 {
        func.call @stack_push_pointer(%9810) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9781) : (i64) -> ()
        func.call @stack_push_pointer(%9799) : (i64) -> ()
        %9812 = llvm.mlir.addressof @str960 : !llvm.ptr
        %9813 = func.call @cc_make_function_ref_const(%9812) : (!llvm.ptr) -> i64
        %9814 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%9813, %9814) : (i64, i64) -> ()
      }
      %9815 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9815 : i64
    }
    %9816 = func.call @cc_nil_value() : () -> i64
    %9817 = func.call @cc_errorp(%9772) : (i64) -> i64
    %9818 = arith.cmpi ne, %9817, %9816 : i64
    %9819 = scf.if %9818 -> (i64) {
      scf.yield %9772 : i64
    } else {
      %9820 = llvm.mlir.addressof @str961 : !llvm.ptr
      %9821 = func.call @cc_make_function_ref_const(%9820) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%9821) : (i64) -> ()
      %9822 = func.call @stack_pop_pointer() : () -> i64
      %9823 = llvm.mlir.addressof @str962 : !llvm.ptr
      %9824 = arith.constant 11 : i64
      %9825 = func.call @cc_make_string(%9823, %9824) : (!llvm.ptr, i64) -> i64
      %9826 = llvm.mlir.addressof @str963 : !llvm.ptr
      %9827 = arith.constant 15 : i64
      %9828 = func.call @cc_make_string(%9826, %9827) : (!llvm.ptr, i64) -> i64
      %9829 = func.call @cc_intern(%9825, %9828) : (i64, i64) -> i64
      %9830 = func.call @cc_nil_value() : () -> i64
      %9831 = func.call @cc_cons(%9829, %9830) : (i64, i64) -> i64
      %9832 = func.call @cc_values_pack(%9831) : (i64) -> i64
      %9833 = func.call @cc_set_symbol_value(%9829, %9822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9822) : (i64) -> ()
      %9834 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9834 : i64
    }
    %9835 = func.call @cc_nil_value() : () -> i64
    %9836 = func.call @cc_errorp(%9819) : (i64) -> i64
    %9837 = arith.cmpi ne, %9836, %9835 : i64
    %9838 = scf.if %9837 -> (i64) {
      scf.yield %9819 : i64
    } else {
      %9839 = llvm.mlir.addressof @str964 : !llvm.ptr
      %9840 = func.call @cc_make_function_ref_const(%9839) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%9840) : (i64) -> ()
      %9841 = func.call @stack_pop_pointer() : () -> i64
      %9842 = llvm.mlir.addressof @str965 : !llvm.ptr
      %9843 = arith.constant 11 : i64
      %9844 = func.call @cc_make_string(%9842, %9843) : (!llvm.ptr, i64) -> i64
      %9845 = llvm.mlir.addressof @str966 : !llvm.ptr
      %9846 = arith.constant 15 : i64
      %9847 = func.call @cc_make_string(%9845, %9846) : (!llvm.ptr, i64) -> i64
      %9848 = func.call @cc_intern(%9844, %9847) : (i64, i64) -> i64
      %9849 = func.call @cc_nil_value() : () -> i64
      %9850 = func.call @cc_cons(%9848, %9849) : (i64, i64) -> i64
      %9851 = func.call @cc_values_pack(%9850) : (i64) -> i64
      %9852 = func.call @cc_set_symbol_value(%9848, %9841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9841) : (i64) -> ()
      %9853 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9853 : i64
    }
    %9854 = func.call @cc_nil_value() : () -> i64
    %9855 = func.call @cc_errorp(%9838) : (i64) -> i64
    %9856 = arith.cmpi ne, %9855, %9854 : i64
    %9857 = scf.if %9856 -> (i64) {
      scf.yield %9838 : i64
    } else {
      %9858 = llvm.mlir.addressof @str967 : !llvm.ptr
      %9859 = func.call @cc_make_function_ref_const(%9858) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%9859) : (i64) -> ()
      %9860 = func.call @stack_pop_pointer() : () -> i64
      %9861 = llvm.mlir.addressof @str968 : !llvm.ptr
      %9862 = arith.constant 11 : i64
      %9863 = func.call @cc_make_string(%9861, %9862) : (!llvm.ptr, i64) -> i64
      %9864 = llvm.mlir.addressof @str969 : !llvm.ptr
      %9865 = arith.constant 15 : i64
      %9866 = func.call @cc_make_string(%9864, %9865) : (!llvm.ptr, i64) -> i64
      %9867 = func.call @cc_intern(%9863, %9866) : (i64, i64) -> i64
      %9868 = func.call @cc_nil_value() : () -> i64
      %9869 = func.call @cc_cons(%9867, %9868) : (i64, i64) -> i64
      %9870 = func.call @cc_values_pack(%9869) : (i64) -> i64
      %9871 = func.call @cc_set_symbol_value(%9867, %9860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9860) : (i64) -> ()
      %9872 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9872 : i64
    }
    %9873 = func.call @cc_nil_value() : () -> i64
    %9874 = func.call @cc_errorp(%9857) : (i64) -> i64
    %9875 = arith.cmpi ne, %9874, %9873 : i64
    %9876 = scf.if %9875 -> (i64) {
      scf.yield %9857 : i64
    } else {
      %9877 = llvm.mlir.addressof @str970 : !llvm.ptr
      %9878 = func.call @cc_make_function_ref_const(%9877) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%9878) : (i64) -> ()
      %9879 = func.call @stack_pop_pointer() : () -> i64
      %9880 = llvm.mlir.addressof @str971 : !llvm.ptr
      %9881 = arith.constant 11 : i64
      %9882 = func.call @cc_make_string(%9880, %9881) : (!llvm.ptr, i64) -> i64
      %9883 = llvm.mlir.addressof @str972 : !llvm.ptr
      %9884 = arith.constant 15 : i64
      %9885 = func.call @cc_make_string(%9883, %9884) : (!llvm.ptr, i64) -> i64
      %9886 = func.call @cc_intern(%9882, %9885) : (i64, i64) -> i64
      %9887 = func.call @cc_nil_value() : () -> i64
      %9888 = func.call @cc_cons(%9886, %9887) : (i64, i64) -> i64
      %9889 = func.call @cc_values_pack(%9888) : (i64) -> i64
      %9890 = func.call @cc_set_symbol_value(%9886, %9879) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9879) : (i64) -> ()
      %9891 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9891 : i64
    }
    %9892 = func.call @cc_nil_value() : () -> i64
    %9893 = func.call @cc_errorp(%9876) : (i64) -> i64
    %9894 = arith.cmpi ne, %9893, %9892 : i64
    %9895 = scf.if %9894 -> (i64) {
      scf.yield %9876 : i64
    } else {
      %9896 = llvm.mlir.addressof @str973 : !llvm.ptr
      %9897 = arith.constant 10 : i64
      %9898 = func.call @cc_make_string(%9896, %9897) : (!llvm.ptr, i64) -> i64
      %9899 = func.call @cc_nil_value() : () -> i64
      %9900 = func.call @cc_intern(%9898, %9899) : (i64, i64) -> i64
      %9901 = func.call @cc_nil_value() : () -> i64
      %9902 = func.call @cc_cons(%9900, %9901) : (i64, i64) -> i64
      %9903 = func.call @cc_values_pack(%9902) : (i64) -> i64
      func.call @stack_push_pointer(%9900) : (i64) -> ()
      %9904 = func.call @stack_pop_pointer() : () -> i64
      %9905 = llvm.mlir.addressof @str974 : !llvm.ptr
      %9906 = arith.constant 3 : i64
      %9907 = func.call @cc_make_string(%9905, %9906) : (!llvm.ptr, i64) -> i64
      %9908 = func.call @cc_nil_value() : () -> i64
      %9909 = func.call @cc_intern(%9907, %9908) : (i64, i64) -> i64
      %9910 = func.call @cc_nil_value() : () -> i64
      %9911 = func.call @cc_cons(%9909, %9910) : (i64, i64) -> i64
      %9912 = func.call @cc_values_pack(%9911) : (i64) -> i64
      func.call @stack_push_pointer(%9909) : (i64) -> ()
      %9913 = llvm.mlir.addressof @str975 : !llvm.ptr
      %9914 = arith.constant 3 : i64
      %9915 = func.call @cc_make_string(%9913, %9914) : (!llvm.ptr, i64) -> i64
      %9916 = func.call @cc_nil_value() : () -> i64
      %9917 = func.call @cc_intern(%9915, %9916) : (i64, i64) -> i64
      %9918 = func.call @cc_nil_value() : () -> i64
      %9919 = func.call @cc_cons(%9917, %9918) : (i64, i64) -> i64
      %9920 = func.call @cc_values_pack(%9919) : (i64) -> i64
      func.call @stack_push_pointer(%9917) : (i64) -> ()
      %9921 = llvm.mlir.addressof @str976 : !llvm.ptr
      %9922 = arith.constant 11 : i64
      %9923 = func.call @cc_make_string(%9921, %9922) : (!llvm.ptr, i64) -> i64
      %9924 = func.call @cc_nil_value() : () -> i64
      %9925 = func.call @cc_intern(%9923, %9924) : (i64, i64) -> i64
      %9926 = func.call @cc_nil_value() : () -> i64
      %9927 = func.call @cc_cons(%9925, %9926) : (i64, i64) -> i64
      %9928 = func.call @cc_values_pack(%9927) : (i64) -> i64
      func.call @stack_push_pointer(%9925) : (i64) -> ()
      %9929 = llvm.mlir.addressof @str977 : !llvm.ptr
      %9930 = arith.constant 15 : i64
      %9931 = func.call @cc_make_string(%9929, %9930) : (!llvm.ptr, i64) -> i64
      %9932 = func.call @cc_nil_value() : () -> i64
      %9933 = func.call @cc_intern(%9931, %9932) : (i64, i64) -> i64
      %9934 = func.call @cc_nil_value() : () -> i64
      %9935 = func.call @cc_cons(%9933, %9934) : (i64, i64) -> i64
      %9936 = func.call @cc_values_pack(%9935) : (i64) -> i64
      func.call @stack_push_pointer(%9933) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9937 = func.call @stack_pop_pointer() : () -> i64
      %9938 = func.call @stack_pop_pointer() : () -> i64
      %9939 = func.call @cc_cons(%9938, %9937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9939) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9940 = func.call @stack_pop_pointer() : () -> i64
      %9941 = func.call @stack_pop_pointer() : () -> i64
      %9942 = func.call @cc_cons(%9941, %9940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9942) : (i64) -> ()
      %9943 = func.call @stack_pop_pointer() : () -> i64
      %9944 = func.call @stack_pop_pointer() : () -> i64
      %9945 = func.call @cc_cons(%9944, %9943) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9945) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9946 = func.call @stack_pop_pointer() : () -> i64
      %9947 = func.call @stack_pop_pointer() : () -> i64
      %9948 = func.call @cc_cons(%9947, %9946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9948) : (i64) -> ()
      %9949 = func.call @stack_pop_pointer() : () -> i64
      %9950 = func.call @stack_pop_pointer() : () -> i64
      %9951 = func.call @cc_cons(%9950, %9949) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9951) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9952 = func.call @stack_pop_pointer() : () -> i64
      %9953 = func.call @stack_pop_pointer() : () -> i64
      %9954 = func.call @cc_cons(%9953, %9952) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9954) : (i64) -> ()
      %9955 = func.call @stack_pop_pointer() : () -> i64
      %9956 = func.call @stack_pop_pointer() : () -> i64
      %9957 = func.call @cc_cons(%9956, %9955) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9957) : (i64) -> ()
      %9958 = func.call @stack_pop_pointer() : () -> i64
      %9989 = arith.constant 206494159077417 : i64
      %9990 = arith.constant 0 : i64
      %9991 = func.call @cc_make_closure(%9989, %9990) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9991) : (i64) -> ()
      %9992 = func.call @stack_pop_pointer() : () -> i64
      %9993 = llvm.mlir.addressof @str980 : !llvm.ptr
      %9994 = arith.constant 1 : i64
      %9995 = func.call @cc_make_string(%9993, %9994) : (!llvm.ptr, i64) -> i64
      %9996 = func.call @cc_nil_value() : () -> i64
      %9997 = func.call @cc_intern(%9995, %9996) : (i64, i64) -> i64
      %9998 = func.call @cc_nil_value() : () -> i64
      %9999 = func.call @cc_cons(%9997, %9998) : (i64, i64) -> i64
      %10000 = func.call @cc_values_pack(%9999) : (i64) -> i64
      func.call @stack_push_pointer(%9997) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10001 = func.call @stack_pop_pointer() : () -> i64
      %10002 = func.call @stack_pop_pointer() : () -> i64
      %10003 = func.call @cc_cons(%10002, %10001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10003) : (i64) -> ()
      %10004 = func.call @stack_pop_pointer() : () -> i64
      %10005 = llvm.mlir.addressof @str981 : !llvm.ptr
      %10006 = arith.constant 11 : i64
      %10007 = func.call @cc_make_string(%10005, %10006) : (!llvm.ptr, i64) -> i64
      %10008 = llvm.mlir.addressof @str982 : !llvm.ptr
      %10009 = arith.constant 7 : i64
      %10010 = func.call @cc_make_string(%10008, %10009) : (!llvm.ptr, i64) -> i64
      %10011 = func.call @cc_intern(%10007, %10010) : (i64, i64) -> i64
      %10012 = func.call @cc_nil_value() : () -> i64
      %10013 = func.call @cc_cons(%10011, %10012) : (i64, i64) -> i64
      %10014 = func.call @cc_values_pack(%10013) : (i64) -> i64
      func.call @stack_push_pointer(%10011) : (i64) -> ()
      %10015 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10016 = func.call @stack_pop_pointer() : () -> i64
      %10017 = llvm.mlir.addressof @str983 : !llvm.ptr
      %10018 = arith.constant 4 : i64
      %10019 = func.call @cc_make_string(%10017, %10018) : (!llvm.ptr, i64) -> i64
      %10020 = llvm.mlir.addressof @str984 : !llvm.ptr
      %10021 = arith.constant 7 : i64
      %10022 = func.call @cc_make_string(%10020, %10021) : (!llvm.ptr, i64) -> i64
      %10023 = func.call @cc_intern(%10019, %10022) : (i64, i64) -> i64
      %10024 = func.call @cc_nil_value() : () -> i64
      %10025 = func.call @cc_cons(%10023, %10024) : (i64, i64) -> i64
      %10026 = func.call @cc_values_pack(%10025) : (i64) -> i64
      func.call @stack_push_pointer(%10023) : (i64) -> ()
      %10027 = func.call @stack_pop_pointer() : () -> i64
      %10028 = llvm.mlir.addressof @str985 : !llvm.ptr
      %10029 = arith.constant 6 : i64
      %10030 = func.call @cc_make_string(%10028, %10029) : (!llvm.ptr, i64) -> i64
      %10031 = func.call @cc_nil_value() : () -> i64
      %10032 = func.call @cc_intern(%10030, %10031) : (i64, i64) -> i64
      %10033 = func.call @cc_nil_value() : () -> i64
      %10034 = func.call @cc_cons(%10032, %10033) : (i64, i64) -> i64
      %10035 = func.call @cc_values_pack(%10034) : (i64) -> i64
      func.call @stack_push_pointer(%10032) : (i64) -> ()
      %10036 = func.call @stack_pop_pointer() : () -> i64
      %10037 = func.call @cc_nil_value() : () -> i64
      %10038 = func.call @cc_errorp(%9904) : (i64) -> i64
      %10039 = arith.cmpi ne, %10038, %10037 : i64
      %10040 = arith.cmpi eq, %10037, %10037 : i64
      %10041 = arith.andi %10039, %10040 : i1
      %10042 = scf.if %10041 -> (i64) {
        scf.yield %9904 : i64
      } else {
        scf.yield %10037 : i64
      }
      %10043 = func.call @cc_errorp(%9958) : (i64) -> i64
      %10044 = arith.cmpi ne, %10043, %10037 : i64
      %10045 = arith.cmpi eq, %10042, %10037 : i64
      %10046 = arith.andi %10044, %10045 : i1
      %10047 = scf.if %10046 -> (i64) {
        scf.yield %9958 : i64
      } else {
        scf.yield %10042 : i64
      }
      %10048 = func.call @cc_errorp(%9992) : (i64) -> i64
      %10049 = arith.cmpi ne, %10048, %10037 : i64
      %10050 = arith.cmpi eq, %10047, %10037 : i64
      %10051 = arith.andi %10049, %10050 : i1
      %10052 = scf.if %10051 -> (i64) {
        scf.yield %9992 : i64
      } else {
        scf.yield %10047 : i64
      }
      %10053 = func.call @cc_errorp(%10004) : (i64) -> i64
      %10054 = arith.cmpi ne, %10053, %10037 : i64
      %10055 = arith.cmpi eq, %10052, %10037 : i64
      %10056 = arith.andi %10054, %10055 : i1
      %10057 = scf.if %10056 -> (i64) {
        scf.yield %10004 : i64
      } else {
        scf.yield %10052 : i64
      }
      %10058 = func.call @cc_errorp(%10015) : (i64) -> i64
      %10059 = arith.cmpi ne, %10058, %10037 : i64
      %10060 = arith.cmpi eq, %10057, %10037 : i64
      %10061 = arith.andi %10059, %10060 : i1
      %10062 = scf.if %10061 -> (i64) {
        scf.yield %10015 : i64
      } else {
        scf.yield %10057 : i64
      }
      %10063 = func.call @cc_errorp(%10016) : (i64) -> i64
      %10064 = arith.cmpi ne, %10063, %10037 : i64
      %10065 = arith.cmpi eq, %10062, %10037 : i64
      %10066 = arith.andi %10064, %10065 : i1
      %10067 = scf.if %10066 -> (i64) {
        scf.yield %10016 : i64
      } else {
        scf.yield %10062 : i64
      }
      %10068 = func.call @cc_errorp(%10027) : (i64) -> i64
      %10069 = arith.cmpi ne, %10068, %10037 : i64
      %10070 = arith.cmpi eq, %10067, %10037 : i64
      %10071 = arith.andi %10069, %10070 : i1
      %10072 = scf.if %10071 -> (i64) {
        scf.yield %10027 : i64
      } else {
        scf.yield %10067 : i64
      }
      %10073 = func.call @cc_errorp(%10036) : (i64) -> i64
      %10074 = arith.cmpi ne, %10073, %10037 : i64
      %10075 = arith.cmpi eq, %10072, %10037 : i64
      %10076 = arith.andi %10074, %10075 : i1
      %10077 = scf.if %10076 -> (i64) {
        scf.yield %10036 : i64
      } else {
        scf.yield %10072 : i64
      }
      %10078 = arith.cmpi ne, %10077, %10037 : i64
      scf.if %10078 {
        func.call @stack_push_pointer(%10077) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9904) : (i64) -> ()
        func.call @stack_push_pointer(%9958) : (i64) -> ()
        func.call @stack_push_pointer(%9992) : (i64) -> ()
        func.call @stack_push_pointer(%10004) : (i64) -> ()
        func.call @stack_push_pointer(%10015) : (i64) -> ()
        func.call @stack_push_pointer(%10016) : (i64) -> ()
        func.call @stack_push_pointer(%10027) : (i64) -> ()
        func.call @stack_push_pointer(%10036) : (i64) -> ()
        %10079 = llvm.mlir.addressof @str986 : !llvm.ptr
        %10080 = func.call @cc_make_function_ref_const(%10079) : (!llvm.ptr) -> i64
        %10081 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10080, %10081) : (i64, i64) -> ()
      }
      %10082 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10082 : i64
    }
    %10083 = func.call @cc_nil_value() : () -> i64
    %10084 = func.call @cc_errorp(%9895) : (i64) -> i64
    %10085 = arith.cmpi ne, %10084, %10083 : i64
    %10086 = scf.if %10085 -> (i64) {
      scf.yield %9895 : i64
    } else {
      %10087 = llvm.mlir.addressof @str987 : !llvm.ptr
      %10088 = arith.constant 12 : i64
      %10089 = func.call @cc_make_string(%10087, %10088) : (!llvm.ptr, i64) -> i64
      %10090 = func.call @cc_nil_value() : () -> i64
      %10091 = func.call @cc_intern(%10089, %10090) : (i64, i64) -> i64
      %10092 = func.call @cc_nil_value() : () -> i64
      %10093 = func.call @cc_cons(%10091, %10092) : (i64, i64) -> i64
      %10094 = func.call @cc_values_pack(%10093) : (i64) -> i64
      func.call @stack_push_pointer(%10091) : (i64) -> ()
      %10095 = func.call @stack_pop_pointer() : () -> i64
      %10112 = arith.constant 206494159077418 : i64
      %10113 = arith.constant 0 : i64
      %10114 = func.call @cc_make_closure(%10112, %10113) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10114) : (i64) -> ()
      %10115 = func.call @stack_pop_pointer() : () -> i64
      %10116 = func.call @cc_nil_value() : () -> i64
      %10117 = func.call @cc_errorp(%10095) : (i64) -> i64
      %10118 = arith.cmpi ne, %10117, %10116 : i64
      %10119 = arith.cmpi eq, %10116, %10116 : i64
      %10120 = arith.andi %10118, %10119 : i1
      %10121 = scf.if %10120 -> (i64) {
        scf.yield %10095 : i64
      } else {
        scf.yield %10116 : i64
      }
      %10122 = func.call @cc_errorp(%10115) : (i64) -> i64
      %10123 = arith.cmpi ne, %10122, %10116 : i64
      %10124 = arith.cmpi eq, %10121, %10116 : i64
      %10125 = arith.andi %10123, %10124 : i1
      %10126 = scf.if %10125 -> (i64) {
        scf.yield %10115 : i64
      } else {
        scf.yield %10121 : i64
      }
      %10127 = arith.cmpi ne, %10126, %10116 : i64
      scf.if %10127 {
        func.call @stack_push_pointer(%10126) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10095) : (i64) -> ()
        func.call @stack_push_pointer(%10115) : (i64) -> ()
        %10128 = llvm.mlir.addressof @str990 : !llvm.ptr
        %10129 = func.call @cc_make_function_ref_const(%10128) : (!llvm.ptr) -> i64
        %10130 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%10129, %10130) : (i64, i64) -> ()
      }
      %10131 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10131 : i64
    }
    %10132 = func.call @cc_nil_value() : () -> i64
    %10133 = func.call @cc_errorp(%10086) : (i64) -> i64
    %10134 = arith.cmpi ne, %10133, %10132 : i64
    %10135 = scf.if %10134 -> (i64) {
      scf.yield %10086 : i64
    } else {
      %10136 = llvm.mlir.addressof @str991 : !llvm.ptr
      %10137 = arith.constant 11 : i64
      %10138 = func.call @cc_make_string(%10136, %10137) : (!llvm.ptr, i64) -> i64
      %10139 = func.call @cc_nil_value() : () -> i64
      %10140 = func.call @cc_intern(%10138, %10139) : (i64, i64) -> i64
      %10141 = func.call @cc_nil_value() : () -> i64
      %10142 = func.call @cc_cons(%10140, %10141) : (i64, i64) -> i64
      %10143 = func.call @cc_values_pack(%10142) : (i64) -> i64
      func.call @stack_push_pointer(%10140) : (i64) -> ()
      %10144 = func.call @stack_pop_pointer() : () -> i64
      %10145 = llvm.mlir.addressof @str992 : !llvm.ptr
      %10146 = arith.constant 3 : i64
      %10147 = func.call @cc_make_string(%10145, %10146) : (!llvm.ptr, i64) -> i64
      %10148 = func.call @cc_nil_value() : () -> i64
      %10149 = func.call @cc_intern(%10147, %10148) : (i64, i64) -> i64
      %10150 = func.call @cc_nil_value() : () -> i64
      %10151 = func.call @cc_cons(%10149, %10150) : (i64, i64) -> i64
      %10152 = func.call @cc_values_pack(%10151) : (i64) -> i64
      func.call @stack_push_pointer(%10149) : (i64) -> ()
      %10153 = llvm.mlir.addressof @str993 : !llvm.ptr
      %10154 = arith.constant 3 : i64
      %10155 = func.call @cc_make_string(%10153, %10154) : (!llvm.ptr, i64) -> i64
      %10156 = func.call @cc_nil_value() : () -> i64
      %10157 = func.call @cc_intern(%10155, %10156) : (i64, i64) -> i64
      %10158 = func.call @cc_nil_value() : () -> i64
      %10159 = func.call @cc_cons(%10157, %10158) : (i64, i64) -> i64
      %10160 = func.call @cc_values_pack(%10159) : (i64) -> i64
      func.call @stack_push_pointer(%10157) : (i64) -> ()
      %10161 = llvm.mlir.addressof @str994 : !llvm.ptr
      %10162 = arith.constant 3 : i64
      %10163 = func.call @cc_make_string(%10161, %10162) : (!llvm.ptr, i64) -> i64
      %10164 = func.call @cc_nil_value() : () -> i64
      %10165 = func.call @cc_intern(%10163, %10164) : (i64, i64) -> i64
      %10166 = func.call @cc_nil_value() : () -> i64
      %10167 = func.call @cc_cons(%10165, %10166) : (i64, i64) -> i64
      %10168 = func.call @cc_values_pack(%10167) : (i64) -> i64
      func.call @stack_push_pointer(%10165) : (i64) -> ()
      %10169 = llvm.mlir.addressof @str995 : !llvm.ptr
      %10170 = arith.constant 4 : i64
      %10171 = func.call @cc_make_string(%10169, %10170) : (!llvm.ptr, i64) -> i64
      %10172 = func.call @cc_nil_value() : () -> i64
      %10173 = func.call @cc_intern(%10171, %10172) : (i64, i64) -> i64
      %10174 = func.call @cc_nil_value() : () -> i64
      %10175 = func.call @cc_cons(%10173, %10174) : (i64, i64) -> i64
      %10176 = func.call @cc_values_pack(%10175) : (i64) -> i64
      func.call @stack_push_pointer(%10173) : (i64) -> ()
      %10177 = llvm.mlir.addressof @str996 : !llvm.ptr
      %10178 = arith.constant 5 : i64
      %10179 = func.call @cc_make_string(%10177, %10178) : (!llvm.ptr, i64) -> i64
      %10180 = llvm.mlir.addressof @str997 : !llvm.ptr
      %10181 = arith.constant 7 : i64
      %10182 = func.call @cc_make_string(%10180, %10181) : (!llvm.ptr, i64) -> i64
      %10183 = func.call @cc_intern(%10179, %10182) : (i64, i64) -> i64
      %10184 = func.call @cc_nil_value() : () -> i64
      %10185 = func.call @cc_cons(%10183, %10184) : (i64, i64) -> i64
      %10186 = func.call @cc_values_pack(%10185) : (i64) -> i64
      func.call @stack_push_pointer(%10183) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10187 = func.call @stack_pop_pointer() : () -> i64
      %10188 = func.call @stack_pop_pointer() : () -> i64
      %10189 = func.call @cc_cons(%10188, %10187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10189) : (i64) -> ()
      %10190 = func.call @stack_pop_pointer() : () -> i64
      %10191 = func.call @stack_pop_pointer() : () -> i64
      %10192 = func.call @cc_cons(%10191, %10190) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10192) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10193 = func.call @stack_pop_pointer() : () -> i64
      %10194 = func.call @stack_pop_pointer() : () -> i64
      %10195 = func.call @cc_cons(%10194, %10193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10195) : (i64) -> ()
      %10196 = llvm.mlir.addressof @str998 : !llvm.ptr
      %10197 = arith.constant 5 : i64
      %10198 = func.call @cc_make_string(%10196, %10197) : (!llvm.ptr, i64) -> i64
      %10199 = llvm.mlir.addressof @str999 : !llvm.ptr
      %10200 = arith.constant 11 : i64
      %10201 = func.call @cc_make_string(%10199, %10200) : (!llvm.ptr, i64) -> i64
      %10202 = func.call @cc_intern(%10198, %10201) : (i64, i64) -> i64
      %10203 = func.call @cc_nil_value() : () -> i64
      %10204 = func.call @cc_cons(%10202, %10203) : (i64, i64) -> i64
      %10205 = func.call @cc_values_pack(%10204) : (i64) -> i64
      func.call @stack_push_pointer(%10202) : (i64) -> ()
      %10206 = llvm.mlir.addressof @str1000 : !llvm.ptr
      %10207 = arith.constant 4 : i64
      %10208 = func.call @cc_make_string(%10206, %10207) : (!llvm.ptr, i64) -> i64
      %10209 = func.call @cc_nil_value() : () -> i64
      %10210 = func.call @cc_intern(%10208, %10209) : (i64, i64) -> i64
      %10211 = func.call @cc_nil_value() : () -> i64
      %10212 = func.call @cc_cons(%10210, %10211) : (i64, i64) -> i64
      %10213 = func.call @cc_values_pack(%10212) : (i64) -> i64
      func.call @stack_push_pointer(%10210) : (i64) -> ()
      %10214 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%10214) : (i64) -> ()
      %10215 = llvm.mlir.addressof @str1001 : !llvm.ptr
      %10216 = arith.constant 12 : i64
      %10217 = func.call @cc_make_string(%10215, %10216) : (!llvm.ptr, i64) -> i64
      %10218 = func.call @cc_nil_value() : () -> i64
      %10219 = func.call @cc_intern(%10217, %10218) : (i64, i64) -> i64
      %10220 = func.call @cc_nil_value() : () -> i64
      %10221 = func.call @cc_cons(%10219, %10220) : (i64, i64) -> i64
      %10222 = func.call @cc_values_pack(%10221) : (i64) -> i64
      func.call @stack_push_pointer(%10219) : (i64) -> ()
      %10223 = func.call @stack_pop_pointer() : () -> i64
      %10224 = func.call @stack_pop_pointer() : () -> i64
      %10225 = func.call @cc_cons(%10223, %10224) : (i64, i64) -> i64
      %10226 = llvm.mlir.addressof @str1002 : !llvm.ptr
      %10227 = arith.constant 5 : i64
      %10228 = func.call @cc_make_string(%10226, %10227) : (!llvm.ptr, i64) -> i64
      %10229 = func.call @cc_nil_value() : () -> i64
      %10230 = func.call @cc_intern(%10228, %10229) : (i64, i64) -> i64
      %10231 = func.call @cc_nil_value() : () -> i64
      %10232 = func.call @cc_cons(%10230, %10231) : (i64, i64) -> i64
      %10233 = func.call @cc_values_pack(%10232) : (i64) -> i64
      %10234 = func.call @cc_cons(%10230, %10225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10234) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10235 = func.call @stack_pop_pointer() : () -> i64
      %10236 = func.call @stack_pop_pointer() : () -> i64
      %10237 = func.call @cc_cons(%10236, %10235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10237) : (i64) -> ()
      %10238 = func.call @stack_pop_pointer() : () -> i64
      %10239 = func.call @stack_pop_pointer() : () -> i64
      %10240 = func.call @cc_cons(%10239, %10238) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10240) : (i64) -> ()
      %10241 = func.call @stack_pop_pointer() : () -> i64
      %10242 = func.call @stack_pop_pointer() : () -> i64
      %10243 = func.call @cc_cons(%10242, %10241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10243) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10244 = func.call @stack_pop_pointer() : () -> i64
      %10245 = func.call @stack_pop_pointer() : () -> i64
      %10246 = func.call @cc_cons(%10245, %10244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10246) : (i64) -> ()
      %10247 = func.call @stack_pop_pointer() : () -> i64
      %10248 = func.call @stack_pop_pointer() : () -> i64
      %10249 = func.call @cc_cons(%10248, %10247) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10249) : (i64) -> ()
      %10250 = func.call @stack_pop_pointer() : () -> i64
      %10251 = func.call @stack_pop_pointer() : () -> i64
      %10252 = func.call @cc_cons(%10251, %10250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10252) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10253 = func.call @stack_pop_pointer() : () -> i64
      %10254 = func.call @stack_pop_pointer() : () -> i64
      %10255 = func.call @cc_cons(%10254, %10253) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10255) : (i64) -> ()
      %10256 = func.call @stack_pop_pointer() : () -> i64
      %10257 = func.call @stack_pop_pointer() : () -> i64
      %10258 = func.call @cc_cons(%10257, %10256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10258) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10259 = func.call @stack_pop_pointer() : () -> i64
      %10260 = func.call @stack_pop_pointer() : () -> i64
      %10261 = func.call @cc_cons(%10260, %10259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10261) : (i64) -> ()
      %10262 = func.call @stack_pop_pointer() : () -> i64
      %10263 = func.call @stack_pop_pointer() : () -> i64
      %10264 = func.call @cc_cons(%10263, %10262) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10264) : (i64) -> ()
      %10265 = func.call @stack_pop_pointer() : () -> i64
      %10308 = arith.constant 206494159077419 : i64
      %10309 = arith.constant 0 : i64
      %10310 = func.call @cc_make_closure(%10308, %10309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10310) : (i64) -> ()
      %10311 = func.call @stack_pop_pointer() : () -> i64
      %10312 = llvm.mlir.addressof @str1006 : !llvm.ptr
      %10313 = arith.constant 1 : i64
      %10314 = func.call @cc_make_string(%10312, %10313) : (!llvm.ptr, i64) -> i64
      %10315 = func.call @cc_nil_value() : () -> i64
      %10316 = func.call @cc_intern(%10314, %10315) : (i64, i64) -> i64
      %10317 = func.call @cc_nil_value() : () -> i64
      %10318 = func.call @cc_cons(%10316, %10317) : (i64, i64) -> i64
      %10319 = func.call @cc_values_pack(%10318) : (i64) -> i64
      func.call @stack_push_pointer(%10316) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10320 = func.call @stack_pop_pointer() : () -> i64
      %10321 = func.call @stack_pop_pointer() : () -> i64
      %10322 = func.call @cc_cons(%10321, %10320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10322) : (i64) -> ()
      %10323 = func.call @stack_pop_pointer() : () -> i64
      %10324 = llvm.mlir.addressof @str1007 : !llvm.ptr
      %10325 = arith.constant 11 : i64
      %10326 = func.call @cc_make_string(%10324, %10325) : (!llvm.ptr, i64) -> i64
      %10327 = llvm.mlir.addressof @str1008 : !llvm.ptr
      %10328 = arith.constant 7 : i64
      %10329 = func.call @cc_make_string(%10327, %10328) : (!llvm.ptr, i64) -> i64
      %10330 = func.call @cc_intern(%10326, %10329) : (i64, i64) -> i64
      %10331 = func.call @cc_nil_value() : () -> i64
      %10332 = func.call @cc_cons(%10330, %10331) : (i64, i64) -> i64
      %10333 = func.call @cc_values_pack(%10332) : (i64) -> i64
      func.call @stack_push_pointer(%10330) : (i64) -> ()
      %10334 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10335 = func.call @stack_pop_pointer() : () -> i64
      %10336 = llvm.mlir.addressof @str1009 : !llvm.ptr
      %10337 = arith.constant 4 : i64
      %10338 = func.call @cc_make_string(%10336, %10337) : (!llvm.ptr, i64) -> i64
      %10339 = llvm.mlir.addressof @str1010 : !llvm.ptr
      %10340 = arith.constant 7 : i64
      %10341 = func.call @cc_make_string(%10339, %10340) : (!llvm.ptr, i64) -> i64
      %10342 = func.call @cc_intern(%10338, %10341) : (i64, i64) -> i64
      %10343 = func.call @cc_nil_value() : () -> i64
      %10344 = func.call @cc_cons(%10342, %10343) : (i64, i64) -> i64
      %10345 = func.call @cc_values_pack(%10344) : (i64) -> i64
      func.call @stack_push_pointer(%10342) : (i64) -> ()
      %10346 = func.call @stack_pop_pointer() : () -> i64
      %10347 = llvm.mlir.addressof @str1011 : !llvm.ptr
      %10348 = arith.constant 6 : i64
      %10349 = func.call @cc_make_string(%10347, %10348) : (!llvm.ptr, i64) -> i64
      %10350 = func.call @cc_nil_value() : () -> i64
      %10351 = func.call @cc_intern(%10349, %10350) : (i64, i64) -> i64
      %10352 = func.call @cc_nil_value() : () -> i64
      %10353 = func.call @cc_cons(%10351, %10352) : (i64, i64) -> i64
      %10354 = func.call @cc_values_pack(%10353) : (i64) -> i64
      func.call @stack_push_pointer(%10351) : (i64) -> ()
      %10355 = func.call @stack_pop_pointer() : () -> i64
      %10356 = func.call @cc_nil_value() : () -> i64
      %10357 = func.call @cc_errorp(%10144) : (i64) -> i64
      %10358 = arith.cmpi ne, %10357, %10356 : i64
      %10359 = arith.cmpi eq, %10356, %10356 : i64
      %10360 = arith.andi %10358, %10359 : i1
      %10361 = scf.if %10360 -> (i64) {
        scf.yield %10144 : i64
      } else {
        scf.yield %10356 : i64
      }
      %10362 = func.call @cc_errorp(%10265) : (i64) -> i64
      %10363 = arith.cmpi ne, %10362, %10356 : i64
      %10364 = arith.cmpi eq, %10361, %10356 : i64
      %10365 = arith.andi %10363, %10364 : i1
      %10366 = scf.if %10365 -> (i64) {
        scf.yield %10265 : i64
      } else {
        scf.yield %10361 : i64
      }
      %10367 = func.call @cc_errorp(%10311) : (i64) -> i64
      %10368 = arith.cmpi ne, %10367, %10356 : i64
      %10369 = arith.cmpi eq, %10366, %10356 : i64
      %10370 = arith.andi %10368, %10369 : i1
      %10371 = scf.if %10370 -> (i64) {
        scf.yield %10311 : i64
      } else {
        scf.yield %10366 : i64
      }
      %10372 = func.call @cc_errorp(%10323) : (i64) -> i64
      %10373 = arith.cmpi ne, %10372, %10356 : i64
      %10374 = arith.cmpi eq, %10371, %10356 : i64
      %10375 = arith.andi %10373, %10374 : i1
      %10376 = scf.if %10375 -> (i64) {
        scf.yield %10323 : i64
      } else {
        scf.yield %10371 : i64
      }
      %10377 = func.call @cc_errorp(%10334) : (i64) -> i64
      %10378 = arith.cmpi ne, %10377, %10356 : i64
      %10379 = arith.cmpi eq, %10376, %10356 : i64
      %10380 = arith.andi %10378, %10379 : i1
      %10381 = scf.if %10380 -> (i64) {
        scf.yield %10334 : i64
      } else {
        scf.yield %10376 : i64
      }
      %10382 = func.call @cc_errorp(%10335) : (i64) -> i64
      %10383 = arith.cmpi ne, %10382, %10356 : i64
      %10384 = arith.cmpi eq, %10381, %10356 : i64
      %10385 = arith.andi %10383, %10384 : i1
      %10386 = scf.if %10385 -> (i64) {
        scf.yield %10335 : i64
      } else {
        scf.yield %10381 : i64
      }
      %10387 = func.call @cc_errorp(%10346) : (i64) -> i64
      %10388 = arith.cmpi ne, %10387, %10356 : i64
      %10389 = arith.cmpi eq, %10386, %10356 : i64
      %10390 = arith.andi %10388, %10389 : i1
      %10391 = scf.if %10390 -> (i64) {
        scf.yield %10346 : i64
      } else {
        scf.yield %10386 : i64
      }
      %10392 = func.call @cc_errorp(%10355) : (i64) -> i64
      %10393 = arith.cmpi ne, %10392, %10356 : i64
      %10394 = arith.cmpi eq, %10391, %10356 : i64
      %10395 = arith.andi %10393, %10394 : i1
      %10396 = scf.if %10395 -> (i64) {
        scf.yield %10355 : i64
      } else {
        scf.yield %10391 : i64
      }
      %10397 = arith.cmpi ne, %10396, %10356 : i64
      scf.if %10397 {
        func.call @stack_push_pointer(%10396) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10144) : (i64) -> ()
        func.call @stack_push_pointer(%10265) : (i64) -> ()
        func.call @stack_push_pointer(%10311) : (i64) -> ()
        func.call @stack_push_pointer(%10323) : (i64) -> ()
        func.call @stack_push_pointer(%10334) : (i64) -> ()
        func.call @stack_push_pointer(%10335) : (i64) -> ()
        func.call @stack_push_pointer(%10346) : (i64) -> ()
        func.call @stack_push_pointer(%10355) : (i64) -> ()
        %10398 = llvm.mlir.addressof @str1012 : !llvm.ptr
        %10399 = func.call @cc_make_function_ref_const(%10398) : (!llvm.ptr) -> i64
        %10400 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10399, %10400) : (i64, i64) -> ()
      }
      %10401 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10401 : i64
    }
    %10402 = func.call @cc_nil_value() : () -> i64
    %10403 = func.call @cc_errorp(%10135) : (i64) -> i64
    %10404 = arith.cmpi ne, %10403, %10402 : i64
    %10405 = scf.if %10404 -> (i64) {
      scf.yield %10135 : i64
    } else {
      %10406 = llvm.mlir.addressof @str1013 : !llvm.ptr
      %10407 = arith.constant 10 : i64
      %10408 = func.call @cc_make_string(%10406, %10407) : (!llvm.ptr, i64) -> i64
      %10409 = func.call @cc_nil_value() : () -> i64
      %10410 = func.call @cc_intern(%10408, %10409) : (i64, i64) -> i64
      %10411 = func.call @cc_nil_value() : () -> i64
      %10412 = func.call @cc_cons(%10410, %10411) : (i64, i64) -> i64
      %10413 = func.call @cc_values_pack(%10412) : (i64) -> i64
      func.call @stack_push_pointer(%10410) : (i64) -> ()
      %10414 = func.call @stack_pop_pointer() : () -> i64
      %10415 = llvm.mlir.addressof @str1014 : !llvm.ptr
      %10416 = arith.constant 3 : i64
      %10417 = func.call @cc_make_string(%10415, %10416) : (!llvm.ptr, i64) -> i64
      %10418 = func.call @cc_nil_value() : () -> i64
      %10419 = func.call @cc_intern(%10417, %10418) : (i64, i64) -> i64
      %10420 = func.call @cc_nil_value() : () -> i64
      %10421 = func.call @cc_cons(%10419, %10420) : (i64, i64) -> i64
      %10422 = func.call @cc_values_pack(%10421) : (i64) -> i64
      func.call @stack_push_pointer(%10419) : (i64) -> ()
      %10423 = llvm.mlir.addressof @str1015 : !llvm.ptr
      %10424 = arith.constant 3 : i64
      %10425 = func.call @cc_make_string(%10423, %10424) : (!llvm.ptr, i64) -> i64
      %10426 = func.call @cc_nil_value() : () -> i64
      %10427 = func.call @cc_intern(%10425, %10426) : (i64, i64) -> i64
      %10428 = func.call @cc_nil_value() : () -> i64
      %10429 = func.call @cc_cons(%10427, %10428) : (i64, i64) -> i64
      %10430 = func.call @cc_values_pack(%10429) : (i64) -> i64
      func.call @stack_push_pointer(%10427) : (i64) -> ()
      %10431 = llvm.mlir.addressof @str1016 : !llvm.ptr
      %10432 = arith.constant 3 : i64
      %10433 = func.call @cc_make_string(%10431, %10432) : (!llvm.ptr, i64) -> i64
      %10434 = func.call @cc_nil_value() : () -> i64
      %10435 = func.call @cc_intern(%10433, %10434) : (i64, i64) -> i64
      %10436 = func.call @cc_nil_value() : () -> i64
      %10437 = func.call @cc_cons(%10435, %10436) : (i64, i64) -> i64
      %10438 = func.call @cc_values_pack(%10437) : (i64) -> i64
      func.call @stack_push_pointer(%10435) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10439 = llvm.mlir.addressof @str1017 : !llvm.ptr
      %10440 = arith.constant 4 : i64
      %10441 = func.call @cc_make_string(%10439, %10440) : (!llvm.ptr, i64) -> i64
      %10442 = llvm.mlir.addressof @str1018 : !llvm.ptr
      %10443 = arith.constant 11 : i64
      %10444 = func.call @cc_make_string(%10442, %10443) : (!llvm.ptr, i64) -> i64
      %10445 = func.call @cc_intern(%10441, %10444) : (i64, i64) -> i64
      %10446 = func.call @cc_nil_value() : () -> i64
      %10447 = func.call @cc_cons(%10445, %10446) : (i64, i64) -> i64
      %10448 = func.call @cc_values_pack(%10447) : (i64) -> i64
      func.call @stack_push_pointer(%10445) : (i64) -> ()
      %10449 = llvm.mlir.addressof @str1019 : !llvm.ptr
      %10450 = arith.constant 5 : i64
      %10451 = func.call @cc_make_string(%10449, %10450) : (!llvm.ptr, i64) -> i64
      %10452 = llvm.mlir.addressof @str1020 : !llvm.ptr
      %10453 = arith.constant 11 : i64
      %10454 = func.call @cc_make_string(%10452, %10453) : (!llvm.ptr, i64) -> i64
      %10455 = func.call @cc_intern(%10451, %10454) : (i64, i64) -> i64
      %10456 = func.call @cc_nil_value() : () -> i64
      %10457 = func.call @cc_cons(%10455, %10456) : (i64, i64) -> i64
      %10458 = func.call @cc_values_pack(%10457) : (i64) -> i64
      func.call @stack_push_pointer(%10455) : (i64) -> ()
      %10459 = arith.constant 0 : i64
      %10460 = func.call @cc_box_fixnum(%10459) : (i64) -> i64
      %10461 = func.call @cc_make_vector(%10460) : (i64) -> i64
      func.call @stack_push_pointer(%10461) : (i64) -> ()
      %10462 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%10462) : (i64) -> ()
      %10463 = llvm.mlir.addressof @str1021 : !llvm.ptr
      %10464 = arith.constant 5 : i64
      %10465 = func.call @cc_make_string(%10463, %10464) : (!llvm.ptr, i64) -> i64
      %10466 = llvm.mlir.addressof @str1022 : !llvm.ptr
      %10467 = arith.constant 11 : i64
      %10468 = func.call @cc_make_string(%10466, %10467) : (!llvm.ptr, i64) -> i64
      %10469 = func.call @cc_intern(%10465, %10468) : (i64, i64) -> i64
      %10470 = func.call @cc_nil_value() : () -> i64
      %10471 = func.call @cc_cons(%10469, %10470) : (i64, i64) -> i64
      %10472 = func.call @cc_values_pack(%10471) : (i64) -> i64
      func.call @stack_push_pointer(%10469) : (i64) -> ()
      %10473 = llvm.mlir.addressof @str1023 : !llvm.ptr
      %10474 = arith.constant 1 : i64
      %10475 = func.call @cc_make_string(%10473, %10474) : (!llvm.ptr, i64) -> i64
      %10476 = llvm.mlir.addressof @str1024 : !llvm.ptr
      %10477 = arith.constant 11 : i64
      %10478 = func.call @cc_make_string(%10476, %10477) : (!llvm.ptr, i64) -> i64
      %10479 = func.call @cc_intern(%10475, %10478) : (i64, i64) -> i64
      %10480 = func.call @cc_nil_value() : () -> i64
      %10481 = func.call @cc_cons(%10479, %10480) : (i64, i64) -> i64
      %10482 = func.call @cc_values_pack(%10481) : (i64) -> i64
      func.call @stack_push_pointer(%10479) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %10483 = func.call @stack_pop_pointer() : () -> i64
      %10484 = func.call @stack_pop_pointer() : () -> i64
      %10485 = func.call @cc_cons(%10484, %10483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10485) : (i64) -> ()
      %10486 = func.call @stack_pop_pointer() : () -> i64
      %10487 = func.call @stack_pop_pointer() : () -> i64
      %10488 = func.call @cc_cons(%10487, %10486) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10488) : (i64) -> ()
      %10489 = func.call @stack_pop_pointer() : () -> i64
      %10490 = func.call @stack_pop_pointer() : () -> i64
      %10491 = func.call @cc_cons(%10490, %10489) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10491) : (i64) -> ()
      %10492 = func.call @stack_pop_pointer() : () -> i64
      %10493 = func.call @stack_pop_pointer() : () -> i64
      %10494 = func.call @cc_cons(%10492, %10493) : (i64, i64) -> i64
      %10495 = llvm.mlir.addressof @str1025 : !llvm.ptr
      %10496 = arith.constant 5 : i64
      %10497 = func.call @cc_make_string(%10495, %10496) : (!llvm.ptr, i64) -> i64
      %10498 = func.call @cc_nil_value() : () -> i64
      %10499 = func.call @cc_intern(%10497, %10498) : (i64, i64) -> i64
      %10500 = func.call @cc_nil_value() : () -> i64
      %10501 = func.call @cc_cons(%10499, %10500) : (i64, i64) -> i64
      %10502 = func.call @cc_values_pack(%10501) : (i64) -> i64
      %10503 = func.call @cc_cons(%10499, %10494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10503) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10504 = func.call @stack_pop_pointer() : () -> i64
      %10505 = func.call @stack_pop_pointer() : () -> i64
      %10506 = func.call @cc_cons(%10505, %10504) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10506) : (i64) -> ()
      %10507 = func.call @stack_pop_pointer() : () -> i64
      %10508 = func.call @stack_pop_pointer() : () -> i64
      %10509 = func.call @cc_cons(%10508, %10507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10509) : (i64) -> ()
      %10510 = func.call @stack_pop_pointer() : () -> i64
      %10511 = func.call @stack_pop_pointer() : () -> i64
      %10512 = func.call @cc_cons(%10511, %10510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10512) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10513 = func.call @stack_pop_pointer() : () -> i64
      %10514 = func.call @stack_pop_pointer() : () -> i64
      %10515 = func.call @cc_cons(%10514, %10513) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10515) : (i64) -> ()
      %10516 = func.call @stack_pop_pointer() : () -> i64
      %10517 = func.call @stack_pop_pointer() : () -> i64
      %10518 = func.call @cc_cons(%10517, %10516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10518) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10519 = func.call @stack_pop_pointer() : () -> i64
      %10520 = func.call @stack_pop_pointer() : () -> i64
      %10521 = func.call @cc_cons(%10520, %10519) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10521) : (i64) -> ()
      %10522 = func.call @stack_pop_pointer() : () -> i64
      %10523 = func.call @stack_pop_pointer() : () -> i64
      %10524 = func.call @cc_cons(%10523, %10522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10524) : (i64) -> ()
      %10525 = func.call @stack_pop_pointer() : () -> i64
      %10526 = func.call @stack_pop_pointer() : () -> i64
      %10527 = func.call @cc_cons(%10526, %10525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10527) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10528 = func.call @stack_pop_pointer() : () -> i64
      %10529 = func.call @stack_pop_pointer() : () -> i64
      %10530 = func.call @cc_cons(%10529, %10528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10530) : (i64) -> ()
      %10531 = func.call @stack_pop_pointer() : () -> i64
      %10532 = func.call @stack_pop_pointer() : () -> i64
      %10533 = func.call @cc_cons(%10532, %10531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10533) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10534 = func.call @stack_pop_pointer() : () -> i64
      %10535 = func.call @stack_pop_pointer() : () -> i64
      %10536 = func.call @cc_cons(%10535, %10534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10536) : (i64) -> ()
      %10537 = func.call @stack_pop_pointer() : () -> i64
      %10538 = func.call @stack_pop_pointer() : () -> i64
      %10539 = func.call @cc_cons(%10538, %10537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10539) : (i64) -> ()
      %10540 = func.call @stack_pop_pointer() : () -> i64
      %10601 = arith.constant 206494159077420 : i64
      %10602 = arith.constant 0 : i64
      %10603 = func.call @cc_make_closure(%10601, %10602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10603) : (i64) -> ()
      %10604 = func.call @stack_pop_pointer() : () -> i64
      %10605 = llvm.mlir.addressof @str1030 : !llvm.ptr
      %10606 = arith.constant 1 : i64
      %10607 = func.call @cc_make_string(%10605, %10606) : (!llvm.ptr, i64) -> i64
      %10608 = func.call @cc_nil_value() : () -> i64
      %10609 = func.call @cc_intern(%10607, %10608) : (i64, i64) -> i64
      %10610 = func.call @cc_nil_value() : () -> i64
      %10611 = func.call @cc_cons(%10609, %10610) : (i64, i64) -> i64
      %10612 = func.call @cc_values_pack(%10611) : (i64) -> i64
      func.call @stack_push_pointer(%10609) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10613 = func.call @stack_pop_pointer() : () -> i64
      %10614 = func.call @stack_pop_pointer() : () -> i64
      %10615 = func.call @cc_cons(%10614, %10613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10615) : (i64) -> ()
      %10616 = func.call @stack_pop_pointer() : () -> i64
      %10617 = llvm.mlir.addressof @str1031 : !llvm.ptr
      %10618 = arith.constant 11 : i64
      %10619 = func.call @cc_make_string(%10617, %10618) : (!llvm.ptr, i64) -> i64
      %10620 = llvm.mlir.addressof @str1032 : !llvm.ptr
      %10621 = arith.constant 7 : i64
      %10622 = func.call @cc_make_string(%10620, %10621) : (!llvm.ptr, i64) -> i64
      %10623 = func.call @cc_intern(%10619, %10622) : (i64, i64) -> i64
      %10624 = func.call @cc_nil_value() : () -> i64
      %10625 = func.call @cc_cons(%10623, %10624) : (i64, i64) -> i64
      %10626 = func.call @cc_values_pack(%10625) : (i64) -> i64
      func.call @stack_push_pointer(%10623) : (i64) -> ()
      %10627 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10628 = func.call @stack_pop_pointer() : () -> i64
      %10629 = llvm.mlir.addressof @str1033 : !llvm.ptr
      %10630 = arith.constant 4 : i64
      %10631 = func.call @cc_make_string(%10629, %10630) : (!llvm.ptr, i64) -> i64
      %10632 = llvm.mlir.addressof @str1034 : !llvm.ptr
      %10633 = arith.constant 7 : i64
      %10634 = func.call @cc_make_string(%10632, %10633) : (!llvm.ptr, i64) -> i64
      %10635 = func.call @cc_intern(%10631, %10634) : (i64, i64) -> i64
      %10636 = func.call @cc_nil_value() : () -> i64
      %10637 = func.call @cc_cons(%10635, %10636) : (i64, i64) -> i64
      %10638 = func.call @cc_values_pack(%10637) : (i64) -> i64
      func.call @stack_push_pointer(%10635) : (i64) -> ()
      %10639 = func.call @stack_pop_pointer() : () -> i64
      %10640 = llvm.mlir.addressof @str1035 : !llvm.ptr
      %10641 = arith.constant 6 : i64
      %10642 = func.call @cc_make_string(%10640, %10641) : (!llvm.ptr, i64) -> i64
      %10643 = func.call @cc_nil_value() : () -> i64
      %10644 = func.call @cc_intern(%10642, %10643) : (i64, i64) -> i64
      %10645 = func.call @cc_nil_value() : () -> i64
      %10646 = func.call @cc_cons(%10644, %10645) : (i64, i64) -> i64
      %10647 = func.call @cc_values_pack(%10646) : (i64) -> i64
      func.call @stack_push_pointer(%10644) : (i64) -> ()
      %10648 = func.call @stack_pop_pointer() : () -> i64
      %10649 = func.call @cc_nil_value() : () -> i64
      %10650 = func.call @cc_errorp(%10414) : (i64) -> i64
      %10651 = arith.cmpi ne, %10650, %10649 : i64
      %10652 = arith.cmpi eq, %10649, %10649 : i64
      %10653 = arith.andi %10651, %10652 : i1
      %10654 = scf.if %10653 -> (i64) {
        scf.yield %10414 : i64
      } else {
        scf.yield %10649 : i64
      }
      %10655 = func.call @cc_errorp(%10540) : (i64) -> i64
      %10656 = arith.cmpi ne, %10655, %10649 : i64
      %10657 = arith.cmpi eq, %10654, %10649 : i64
      %10658 = arith.andi %10656, %10657 : i1
      %10659 = scf.if %10658 -> (i64) {
        scf.yield %10540 : i64
      } else {
        scf.yield %10654 : i64
      }
      %10660 = func.call @cc_errorp(%10604) : (i64) -> i64
      %10661 = arith.cmpi ne, %10660, %10649 : i64
      %10662 = arith.cmpi eq, %10659, %10649 : i64
      %10663 = arith.andi %10661, %10662 : i1
      %10664 = scf.if %10663 -> (i64) {
        scf.yield %10604 : i64
      } else {
        scf.yield %10659 : i64
      }
      %10665 = func.call @cc_errorp(%10616) : (i64) -> i64
      %10666 = arith.cmpi ne, %10665, %10649 : i64
      %10667 = arith.cmpi eq, %10664, %10649 : i64
      %10668 = arith.andi %10666, %10667 : i1
      %10669 = scf.if %10668 -> (i64) {
        scf.yield %10616 : i64
      } else {
        scf.yield %10664 : i64
      }
      %10670 = func.call @cc_errorp(%10627) : (i64) -> i64
      %10671 = arith.cmpi ne, %10670, %10649 : i64
      %10672 = arith.cmpi eq, %10669, %10649 : i64
      %10673 = arith.andi %10671, %10672 : i1
      %10674 = scf.if %10673 -> (i64) {
        scf.yield %10627 : i64
      } else {
        scf.yield %10669 : i64
      }
      %10675 = func.call @cc_errorp(%10628) : (i64) -> i64
      %10676 = arith.cmpi ne, %10675, %10649 : i64
      %10677 = arith.cmpi eq, %10674, %10649 : i64
      %10678 = arith.andi %10676, %10677 : i1
      %10679 = scf.if %10678 -> (i64) {
        scf.yield %10628 : i64
      } else {
        scf.yield %10674 : i64
      }
      %10680 = func.call @cc_errorp(%10639) : (i64) -> i64
      %10681 = arith.cmpi ne, %10680, %10649 : i64
      %10682 = arith.cmpi eq, %10679, %10649 : i64
      %10683 = arith.andi %10681, %10682 : i1
      %10684 = scf.if %10683 -> (i64) {
        scf.yield %10639 : i64
      } else {
        scf.yield %10679 : i64
      }
      %10685 = func.call @cc_errorp(%10648) : (i64) -> i64
      %10686 = arith.cmpi ne, %10685, %10649 : i64
      %10687 = arith.cmpi eq, %10684, %10649 : i64
      %10688 = arith.andi %10686, %10687 : i1
      %10689 = scf.if %10688 -> (i64) {
        scf.yield %10648 : i64
      } else {
        scf.yield %10684 : i64
      }
      %10690 = arith.cmpi ne, %10689, %10649 : i64
      scf.if %10690 {
        func.call @stack_push_pointer(%10689) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10414) : (i64) -> ()
        func.call @stack_push_pointer(%10540) : (i64) -> ()
        func.call @stack_push_pointer(%10604) : (i64) -> ()
        func.call @stack_push_pointer(%10616) : (i64) -> ()
        func.call @stack_push_pointer(%10627) : (i64) -> ()
        func.call @stack_push_pointer(%10628) : (i64) -> ()
        func.call @stack_push_pointer(%10639) : (i64) -> ()
        func.call @stack_push_pointer(%10648) : (i64) -> ()
        %10691 = llvm.mlir.addressof @str1036 : !llvm.ptr
        %10692 = func.call @cc_make_function_ref_const(%10691) : (!llvm.ptr) -> i64
        %10693 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10692, %10693) : (i64, i64) -> ()
      }
      %10694 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10694 : i64
    }
    func.call @stack_push_pointer(%10405) : (i64) -> ()
    %10695 = func.call @stack_pop_pointer() : () -> i64
    %10696 = func.call @cc_multiple_value_list(%10695) : (i64) -> i64
    %10697 = llvm.mlir.addressof @str1037 : !llvm.ptr
    %10698 = arith.constant 38 : i64
    %10699 = func.call @cc_make_string(%10697, %10698) : (!llvm.ptr, i64) -> i64
    %10700 = func.call @cc_nil_value() : () -> i64
    %10701 = func.call @cc_intern(%10699, %10700) : (i64, i64) -> i64
    %10702 = func.call @cc_nil_value() : () -> i64
    %10703 = func.call @cc_cons(%10701, %10702) : (i64, i64) -> i64
    %10704 = func.call @cc_values_pack(%10703) : (i64) -> i64
    %10705 = func.call @cc_symbol_value(%10701) : (i64) -> i64
    %10706 = llvm.mlir.addressof @str1038 : !llvm.ptr
    %10707 = arith.constant 40 : i64
    %10708 = func.call @cc_make_string(%10706, %10707) : (!llvm.ptr, i64) -> i64
    %10709 = func.call @cc_nil_value() : () -> i64
    %10710 = func.call @cc_intern(%10708, %10709) : (i64, i64) -> i64
    %10711 = func.call @cc_nil_value() : () -> i64
    %10712 = func.call @cc_cons(%10710, %10711) : (i64, i64) -> i64
    %10713 = func.call @cc_values_pack(%10712) : (i64) -> i64
    %10714 = func.call @cc_symbol_value(%10710) : (i64) -> i64
    %10715 = func.call @cc_nil_value() : () -> i64
    %10716 = arith.cmpi ne, %10705, %10715 : i64
    %10717 = scf.if %10716 -> (i64) {
      scf.yield %10714 : i64
    } else {
      scf.yield %10696 : i64
    }
    %10718 = func.call @cc_values_pack(%10717) : (i64) -> i64
    func.call @stack_push_pointer(%10718) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_206494159077379"() {
    %557 = func.call @cc_nil_value() : () -> i64
    %558 = func.call @cc_nil_value() : () -> i64
    %559 = func.call @cc_errorp(%557) : (i64) -> i64
    %560 = arith.cmpi ne, %559, %558 : i64
    %561 = scf.if %560 -> (i64) {
      scf.yield %557 : i64
    } else {
      %562 = llvm.mlir.addressof @str69 : !llvm.ptr
      %563 = arith.constant 6 : i64
      %564 = func.call @cc_make_string(%562, %563) : (!llvm.ptr, i64) -> i64
      %565 = llvm.mlir.addressof @str70 : !llvm.ptr
      %566 = arith.constant 11 : i64
      %567 = func.call @cc_make_string(%565, %566) : (!llvm.ptr, i64) -> i64
      %568 = func.call @cc_intern(%564, %567) : (i64, i64) -> i64
      %569 = func.call @cc_nil_value() : () -> i64
      %570 = func.call @cc_cons(%568, %569) : (i64, i64) -> i64
      %571 = func.call @cc_values_pack(%570) : (i64) -> i64
      func.call @stack_push_pointer(%568) : (i64) -> ()
      %572 = llvm.mlir.addressof @str71 : !llvm.ptr
      %573 = arith.constant 6 : i64
      %574 = func.call @cc_make_string(%572, %573) : (!llvm.ptr, i64) -> i64
      %575 = llvm.mlir.addressof @str72 : !llvm.ptr
      %576 = arith.constant 11 : i64
      %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
      %578 = func.call @cc_intern(%574, %577) : (i64, i64) -> i64
      %579 = func.call @cc_nil_value() : () -> i64
      %580 = func.call @cc_cons(%578, %579) : (i64, i64) -> i64
      %581 = func.call @cc_values_pack(%580) : (i64) -> i64
      func.call @stack_push_pointer(%578) : (i64) -> ()
      %582 = func.call @stack_pop_pointer() : () -> i64
      %583 = func.call @cc_nil_value() : () -> i64
      %584 = func.call @cc_errorp(%582) : (i64) -> i64
      %585 = arith.cmpi ne, %584, %583 : i64
      %586 = arith.cmpi eq, %583, %583 : i64
      %587 = arith.andi %585, %586 : i1
      %588 = scf.if %587 -> (i64) {
        scf.yield %582 : i64
      } else {
        scf.yield %583 : i64
      }
      %589 = arith.cmpi ne, %588, %583 : i64
      scf.if %589 {
        func.call @stack_push_pointer(%588) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%582) : (i64) -> ()
        %590 = llvm.mlir.addressof @str73 : !llvm.ptr
        %591 = func.call @cc_make_function_ref_const(%590) : (!llvm.ptr) -> i64
        %592 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%591, %592) : (i64, i64) -> ()
      }
      %593 = func.call @stack_pop_pointer() : () -> i64
      %594 = func.call @stack_pop_pointer() : () -> i64
      %595 = func.call @cc_subtypep(%594, %593) : (i64, i64) -> i64
      func.call @stack_push_pointer(%595) : (i64) -> ()
      %596 = func.call @stack_pop_pointer() : () -> i64
      %597 = func.call @cc_multiple_value_list(%596) : (i64) -> i64
      %598 = arith.constant 0 : i64
      %599 = func.call @cc_box_fixnum(%598) : (i64) -> i64
      %600 = func.call @cc_nth(%599, %597) : (i64, i64) -> i64
      %601 = arith.constant 1 : i64
      %602 = func.call @cc_box_fixnum(%601) : (i64) -> i64
      %603 = func.call @cc_nth(%602, %597) : (i64, i64) -> i64
      %604 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%600) : (i64) -> ()
      %605 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%603) : (i64) -> ()
      %606 = func.call @stack_pop_pointer() : () -> i64
      %607 = func.call @cc_cons(%606, %604) : (i64, i64) -> i64
      %608 = func.call @cc_cons(%605, %607) : (i64, i64) -> i64
      %609 = func.call @cc_and(%608) : (i64) -> i64
      func.call @stack_push_pointer(%609) : (i64) -> ()
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @cc_nil_value() : () -> i64
      %612 = func.call @cc_cons(%610, %611) : (i64, i64) -> i64
      %613 = func.call @cc_not(%612) : (i64) -> i64
      func.call @stack_push_pointer(%613) : (i64) -> ()
      %614 = func.call @stack_pop_pointer() : () -> i64
      %615 = func.call @cc_nil_value() : () -> i64
      %616 = func.call @cc_cons(%614, %615) : (i64, i64) -> i64
      %617 = func.call @cc_not(%616) : (i64) -> i64
      func.call @stack_push_pointer(%617) : (i64) -> ()
      %618 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %618 : i64
    }
    func.call @stack_push_pointer(%561) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077380"() {
    %923 = func.call @cc_nil_value() : () -> i64
    %924 = func.call @cc_nil_value() : () -> i64
    %925 = func.call @cc_errorp(%923) : (i64) -> i64
    %926 = arith.cmpi ne, %925, %924 : i64
    %927 = scf.if %926 -> (i64) {
      scf.yield %923 : i64
    } else {
      %928 = llvm.mlir.addressof @str106 : !llvm.ptr
      %929 = arith.constant 6 : i64
      %930 = func.call @cc_make_string(%928, %929) : (!llvm.ptr, i64) -> i64
      %931 = llvm.mlir.addressof @str107 : !llvm.ptr
      %932 = arith.constant 11 : i64
      %933 = func.call @cc_make_string(%931, %932) : (!llvm.ptr, i64) -> i64
      %934 = func.call @cc_intern(%930, %933) : (i64, i64) -> i64
      %935 = func.call @cc_nil_value() : () -> i64
      %936 = func.call @cc_cons(%934, %935) : (i64, i64) -> i64
      %937 = func.call @cc_values_pack(%936) : (i64) -> i64
      func.call @stack_push_pointer(%934) : (i64) -> ()
      %938 = func.call @stack_pop_pointer() : () -> i64
      %939 = func.call @cc_nil_value() : () -> i64
      %940 = func.call @cc_errorp(%938) : (i64) -> i64
      %941 = arith.cmpi ne, %940, %939 : i64
      %942 = arith.cmpi eq, %939, %939 : i64
      %943 = arith.andi %941, %942 : i1
      %944 = scf.if %943 -> (i64) {
        scf.yield %938 : i64
      } else {
        scf.yield %939 : i64
      }
      %945 = arith.cmpi ne, %944, %939 : i64
      scf.if %945 {
        func.call @stack_push_pointer(%944) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%938) : (i64) -> ()
        %946 = llvm.mlir.addressof @str108 : !llvm.ptr
        %947 = func.call @cc_make_function_ref_const(%946) : (!llvm.ptr) -> i64
        %948 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%947, %948) : (i64, i64) -> ()
      }
      %949 = llvm.mlir.addressof @str109 : !llvm.ptr
      %950 = arith.constant 6 : i64
      %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
      %952 = llvm.mlir.addressof @str110 : !llvm.ptr
      %953 = arith.constant 11 : i64
      %954 = func.call @cc_make_string(%952, %953) : (!llvm.ptr, i64) -> i64
      %955 = func.call @cc_intern(%951, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      func.call @stack_push_pointer(%955) : (i64) -> ()
      %959 = func.call @stack_pop_pointer() : () -> i64
      %960 = func.call @stack_pop_pointer() : () -> i64
      %961 = func.call @cc_subtypep(%960, %959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%961) : (i64) -> ()
      %962 = func.call @stack_pop_pointer() : () -> i64
      %963 = func.call @cc_multiple_value_list(%962) : (i64) -> i64
      %964 = arith.constant 0 : i64
      %965 = func.call @cc_box_fixnum(%964) : (i64) -> i64
      %966 = func.call @cc_nth(%965, %963) : (i64, i64) -> i64
      %967 = arith.constant 1 : i64
      %968 = func.call @cc_box_fixnum(%967) : (i64) -> i64
      %969 = func.call @cc_nth(%968, %963) : (i64, i64) -> i64
      %970 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%966) : (i64) -> ()
      %971 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%969) : (i64) -> ()
      %972 = func.call @stack_pop_pointer() : () -> i64
      %973 = func.call @cc_cons(%972, %970) : (i64, i64) -> i64
      %974 = func.call @cc_cons(%971, %973) : (i64, i64) -> i64
      %975 = func.call @cc_and(%974) : (i64) -> i64
      func.call @stack_push_pointer(%975) : (i64) -> ()
      %976 = func.call @stack_pop_pointer() : () -> i64
      %977 = func.call @cc_nil_value() : () -> i64
      %978 = func.call @cc_cons(%976, %977) : (i64, i64) -> i64
      %979 = func.call @cc_not(%978) : (i64) -> i64
      func.call @stack_push_pointer(%979) : (i64) -> ()
      %980 = func.call @stack_pop_pointer() : () -> i64
      %981 = func.call @cc_nil_value() : () -> i64
      %982 = func.call @cc_cons(%980, %981) : (i64, i64) -> i64
      %983 = func.call @cc_not(%982) : (i64) -> i64
      func.call @stack_push_pointer(%983) : (i64) -> ()
      %984 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %984 : i64
    }
    func.call @stack_push_pointer(%927) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077381"() {
    %1289 = func.call @cc_nil_value() : () -> i64
    %1290 = func.call @cc_nil_value() : () -> i64
    %1291 = func.call @cc_errorp(%1289) : (i64) -> i64
    %1292 = arith.cmpi ne, %1291, %1290 : i64
    %1293 = scf.if %1292 -> (i64) {
      scf.yield %1289 : i64
    } else {
      %1294 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1295 = arith.constant 6 : i64
      %1296 = func.call @cc_make_string(%1294, %1295) : (!llvm.ptr, i64) -> i64
      %1297 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1298 = arith.constant 11 : i64
      %1299 = func.call @cc_make_string(%1297, %1298) : (!llvm.ptr, i64) -> i64
      %1300 = func.call @cc_intern(%1296, %1299) : (i64, i64) -> i64
      %1301 = func.call @cc_nil_value() : () -> i64
      %1302 = func.call @cc_cons(%1300, %1301) : (i64, i64) -> i64
      %1303 = func.call @cc_values_pack(%1302) : (i64) -> i64
      func.call @stack_push_pointer(%1300) : (i64) -> ()
      %1304 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1305 = arith.constant 6 : i64
      %1306 = func.call @cc_make_string(%1304, %1305) : (!llvm.ptr, i64) -> i64
      %1307 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1308 = arith.constant 11 : i64
      %1309 = func.call @cc_make_string(%1307, %1308) : (!llvm.ptr, i64) -> i64
      %1310 = func.call @cc_intern(%1306, %1309) : (i64, i64) -> i64
      %1311 = func.call @cc_nil_value() : () -> i64
      %1312 = func.call @cc_cons(%1310, %1311) : (i64, i64) -> i64
      %1313 = func.call @cc_values_pack(%1312) : (i64) -> i64
      func.call @stack_push_pointer(%1310) : (i64) -> ()
      %1314 = func.call @stack_pop_pointer() : () -> i64
      %1315 = func.call @cc_nil_value() : () -> i64
      %1316 = func.call @cc_errorp(%1314) : (i64) -> i64
      %1317 = arith.cmpi ne, %1316, %1315 : i64
      %1318 = arith.cmpi eq, %1315, %1315 : i64
      %1319 = arith.andi %1317, %1318 : i1
      %1320 = scf.if %1319 -> (i64) {
        scf.yield %1314 : i64
      } else {
        scf.yield %1315 : i64
      }
      %1321 = arith.cmpi ne, %1320, %1315 : i64
      scf.if %1321 {
        func.call @stack_push_pointer(%1320) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1314) : (i64) -> ()
        %1322 = llvm.mlir.addressof @str147 : !llvm.ptr
        %1323 = func.call @cc_make_function_ref_const(%1322) : (!llvm.ptr) -> i64
        %1324 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1323, %1324) : (i64, i64) -> ()
      }
      %1325 = func.call @stack_pop_pointer() : () -> i64
      %1326 = func.call @stack_pop_pointer() : () -> i64
      %1327 = func.call @cc_subtypep(%1326, %1325) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1327) : (i64) -> ()
      %1328 = func.call @stack_pop_pointer() : () -> i64
      %1329 = func.call @cc_multiple_value_list(%1328) : (i64) -> i64
      %1330 = arith.constant 0 : i64
      %1331 = func.call @cc_box_fixnum(%1330) : (i64) -> i64
      %1332 = func.call @cc_nth(%1331, %1329) : (i64, i64) -> i64
      %1333 = arith.constant 1 : i64
      %1334 = func.call @cc_box_fixnum(%1333) : (i64) -> i64
      %1335 = func.call @cc_nth(%1334, %1329) : (i64, i64) -> i64
      %1336 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1332) : (i64) -> ()
      %1337 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1335) : (i64) -> ()
      %1338 = func.call @stack_pop_pointer() : () -> i64
      %1339 = func.call @cc_cons(%1338, %1336) : (i64, i64) -> i64
      %1340 = func.call @cc_cons(%1337, %1339) : (i64, i64) -> i64
      %1341 = func.call @cc_and(%1340) : (i64) -> i64
      func.call @stack_push_pointer(%1341) : (i64) -> ()
      %1342 = func.call @stack_pop_pointer() : () -> i64
      %1343 = func.call @cc_nil_value() : () -> i64
      %1344 = func.call @cc_cons(%1342, %1343) : (i64, i64) -> i64
      %1345 = func.call @cc_not(%1344) : (i64) -> i64
      func.call @stack_push_pointer(%1345) : (i64) -> ()
      %1346 = func.call @stack_pop_pointer() : () -> i64
      %1347 = func.call @cc_nil_value() : () -> i64
      %1348 = func.call @cc_cons(%1346, %1347) : (i64, i64) -> i64
      %1349 = func.call @cc_not(%1348) : (i64) -> i64
      func.call @stack_push_pointer(%1349) : (i64) -> ()
      %1350 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1350 : i64
    }
    func.call @stack_push_pointer(%1293) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077382"() {
    %1655 = func.call @cc_nil_value() : () -> i64
    %1656 = func.call @cc_nil_value() : () -> i64
    %1657 = func.call @cc_errorp(%1655) : (i64) -> i64
    %1658 = arith.cmpi ne, %1657, %1656 : i64
    %1659 = scf.if %1658 -> (i64) {
      scf.yield %1655 : i64
    } else {
      %1660 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1661 = arith.constant 6 : i64
      %1662 = func.call @cc_make_string(%1660, %1661) : (!llvm.ptr, i64) -> i64
      %1663 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1664 = arith.constant 11 : i64
      %1665 = func.call @cc_make_string(%1663, %1664) : (!llvm.ptr, i64) -> i64
      %1666 = func.call @cc_intern(%1662, %1665) : (i64, i64) -> i64
      %1667 = func.call @cc_nil_value() : () -> i64
      %1668 = func.call @cc_cons(%1666, %1667) : (i64, i64) -> i64
      %1669 = func.call @cc_values_pack(%1668) : (i64) -> i64
      func.call @stack_push_pointer(%1666) : (i64) -> ()
      %1670 = func.call @stack_pop_pointer() : () -> i64
      %1671 = func.call @cc_nil_value() : () -> i64
      %1672 = func.call @cc_errorp(%1670) : (i64) -> i64
      %1673 = arith.cmpi ne, %1672, %1671 : i64
      %1674 = arith.cmpi eq, %1671, %1671 : i64
      %1675 = arith.andi %1673, %1674 : i1
      %1676 = scf.if %1675 -> (i64) {
        scf.yield %1670 : i64
      } else {
        scf.yield %1671 : i64
      }
      %1677 = arith.cmpi ne, %1676, %1671 : i64
      scf.if %1677 {
        func.call @stack_push_pointer(%1676) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1670) : (i64) -> ()
        %1678 = llvm.mlir.addressof @str182 : !llvm.ptr
        %1679 = func.call @cc_make_function_ref_const(%1678) : (!llvm.ptr) -> i64
        %1680 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1679, %1680) : (i64, i64) -> ()
      }
      %1681 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1682 = arith.constant 6 : i64
      %1683 = func.call @cc_make_string(%1681, %1682) : (!llvm.ptr, i64) -> i64
      %1684 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1685 = arith.constant 11 : i64
      %1686 = func.call @cc_make_string(%1684, %1685) : (!llvm.ptr, i64) -> i64
      %1687 = func.call @cc_intern(%1683, %1686) : (i64, i64) -> i64
      %1688 = func.call @cc_nil_value() : () -> i64
      %1689 = func.call @cc_cons(%1687, %1688) : (i64, i64) -> i64
      %1690 = func.call @cc_values_pack(%1689) : (i64) -> i64
      func.call @stack_push_pointer(%1687) : (i64) -> ()
      %1691 = func.call @stack_pop_pointer() : () -> i64
      %1692 = func.call @stack_pop_pointer() : () -> i64
      %1693 = func.call @cc_subtypep(%1692, %1691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1693) : (i64) -> ()
      %1694 = func.call @stack_pop_pointer() : () -> i64
      %1695 = func.call @cc_multiple_value_list(%1694) : (i64) -> i64
      %1696 = arith.constant 0 : i64
      %1697 = func.call @cc_box_fixnum(%1696) : (i64) -> i64
      %1698 = func.call @cc_nth(%1697, %1695) : (i64, i64) -> i64
      %1699 = arith.constant 1 : i64
      %1700 = func.call @cc_box_fixnum(%1699) : (i64) -> i64
      %1701 = func.call @cc_nth(%1700, %1695) : (i64, i64) -> i64
      %1702 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1698) : (i64) -> ()
      %1703 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1701) : (i64) -> ()
      %1704 = func.call @stack_pop_pointer() : () -> i64
      %1705 = func.call @cc_cons(%1704, %1702) : (i64, i64) -> i64
      %1706 = func.call @cc_cons(%1703, %1705) : (i64, i64) -> i64
      %1707 = func.call @cc_and(%1706) : (i64) -> i64
      func.call @stack_push_pointer(%1707) : (i64) -> ()
      %1708 = func.call @stack_pop_pointer() : () -> i64
      %1709 = func.call @cc_nil_value() : () -> i64
      %1710 = func.call @cc_cons(%1708, %1709) : (i64, i64) -> i64
      %1711 = func.call @cc_not(%1710) : (i64) -> i64
      func.call @stack_push_pointer(%1711) : (i64) -> ()
      %1712 = func.call @stack_pop_pointer() : () -> i64
      %1713 = func.call @cc_nil_value() : () -> i64
      %1714 = func.call @cc_cons(%1712, %1713) : (i64, i64) -> i64
      %1715 = func.call @cc_not(%1714) : (i64) -> i64
      func.call @stack_push_pointer(%1715) : (i64) -> ()
      %1716 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1716 : i64
    }
    func.call @stack_push_pointer(%1659) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077383"() {
    %2021 = func.call @cc_nil_value() : () -> i64
    %2022 = func.call @cc_nil_value() : () -> i64
    %2023 = func.call @cc_errorp(%2021) : (i64) -> i64
    %2024 = arith.cmpi ne, %2023, %2022 : i64
    %2025 = scf.if %2024 -> (i64) {
      scf.yield %2021 : i64
    } else {
      %2026 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2027 = arith.constant 10 : i64
      %2028 = func.call @cc_make_string(%2026, %2027) : (!llvm.ptr, i64) -> i64
      %2029 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2030 = arith.constant 11 : i64
      %2031 = func.call @cc_make_string(%2029, %2030) : (!llvm.ptr, i64) -> i64
      %2032 = func.call @cc_intern(%2028, %2031) : (i64, i64) -> i64
      %2033 = func.call @cc_nil_value() : () -> i64
      %2034 = func.call @cc_cons(%2032, %2033) : (i64, i64) -> i64
      %2035 = func.call @cc_values_pack(%2034) : (i64) -> i64
      func.call @stack_push_pointer(%2032) : (i64) -> ()
      %2036 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2037 = arith.constant 10 : i64
      %2038 = func.call @cc_make_string(%2036, %2037) : (!llvm.ptr, i64) -> i64
      %2039 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2040 = arith.constant 11 : i64
      %2041 = func.call @cc_make_string(%2039, %2040) : (!llvm.ptr, i64) -> i64
      %2042 = func.call @cc_intern(%2038, %2041) : (i64, i64) -> i64
      %2043 = func.call @cc_nil_value() : () -> i64
      %2044 = func.call @cc_cons(%2042, %2043) : (i64, i64) -> i64
      %2045 = func.call @cc_values_pack(%2044) : (i64) -> i64
      func.call @stack_push_pointer(%2042) : (i64) -> ()
      %2046 = func.call @stack_pop_pointer() : () -> i64
      %2047 = func.call @cc_nil_value() : () -> i64
      %2048 = func.call @cc_errorp(%2046) : (i64) -> i64
      %2049 = arith.cmpi ne, %2048, %2047 : i64
      %2050 = arith.cmpi eq, %2047, %2047 : i64
      %2051 = arith.andi %2049, %2050 : i1
      %2052 = scf.if %2051 -> (i64) {
        scf.yield %2046 : i64
      } else {
        scf.yield %2047 : i64
      }
      %2053 = arith.cmpi ne, %2052, %2047 : i64
      scf.if %2053 {
        func.call @stack_push_pointer(%2052) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2046) : (i64) -> ()
        %2054 = llvm.mlir.addressof @str221 : !llvm.ptr
        %2055 = func.call @cc_make_function_ref_const(%2054) : (!llvm.ptr) -> i64
        %2056 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2055, %2056) : (i64, i64) -> ()
      }
      %2057 = func.call @stack_pop_pointer() : () -> i64
      %2058 = func.call @stack_pop_pointer() : () -> i64
      %2059 = func.call @cc_subtypep(%2058, %2057) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2059) : (i64) -> ()
      %2060 = func.call @stack_pop_pointer() : () -> i64
      %2061 = func.call @cc_multiple_value_list(%2060) : (i64) -> i64
      %2062 = arith.constant 0 : i64
      %2063 = func.call @cc_box_fixnum(%2062) : (i64) -> i64
      %2064 = func.call @cc_nth(%2063, %2061) : (i64, i64) -> i64
      %2065 = arith.constant 1 : i64
      %2066 = func.call @cc_box_fixnum(%2065) : (i64) -> i64
      %2067 = func.call @cc_nth(%2066, %2061) : (i64, i64) -> i64
      %2068 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2064) : (i64) -> ()
      %2069 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2067) : (i64) -> ()
      %2070 = func.call @stack_pop_pointer() : () -> i64
      %2071 = func.call @cc_cons(%2070, %2068) : (i64, i64) -> i64
      %2072 = func.call @cc_cons(%2069, %2071) : (i64, i64) -> i64
      %2073 = func.call @cc_and(%2072) : (i64) -> i64
      func.call @stack_push_pointer(%2073) : (i64) -> ()
      %2074 = func.call @stack_pop_pointer() : () -> i64
      %2075 = func.call @cc_nil_value() : () -> i64
      %2076 = func.call @cc_cons(%2074, %2075) : (i64, i64) -> i64
      %2077 = func.call @cc_not(%2076) : (i64) -> i64
      func.call @stack_push_pointer(%2077) : (i64) -> ()
      %2078 = func.call @stack_pop_pointer() : () -> i64
      %2079 = func.call @cc_nil_value() : () -> i64
      %2080 = func.call @cc_cons(%2078, %2079) : (i64, i64) -> i64
      %2081 = func.call @cc_not(%2080) : (i64) -> i64
      func.call @stack_push_pointer(%2081) : (i64) -> ()
      %2082 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2082 : i64
    }
    func.call @stack_push_pointer(%2025) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077384"() {
    %2387 = func.call @cc_nil_value() : () -> i64
    %2388 = func.call @cc_nil_value() : () -> i64
    %2389 = func.call @cc_errorp(%2387) : (i64) -> i64
    %2390 = arith.cmpi ne, %2389, %2388 : i64
    %2391 = scf.if %2390 -> (i64) {
      scf.yield %2387 : i64
    } else {
      %2392 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2393 = arith.constant 10 : i64
      %2394 = func.call @cc_make_string(%2392, %2393) : (!llvm.ptr, i64) -> i64
      %2395 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2396 = arith.constant 11 : i64
      %2397 = func.call @cc_make_string(%2395, %2396) : (!llvm.ptr, i64) -> i64
      %2398 = func.call @cc_intern(%2394, %2397) : (i64, i64) -> i64
      %2399 = func.call @cc_nil_value() : () -> i64
      %2400 = func.call @cc_cons(%2398, %2399) : (i64, i64) -> i64
      %2401 = func.call @cc_values_pack(%2400) : (i64) -> i64
      func.call @stack_push_pointer(%2398) : (i64) -> ()
      %2402 = func.call @stack_pop_pointer() : () -> i64
      %2403 = func.call @cc_nil_value() : () -> i64
      %2404 = func.call @cc_errorp(%2402) : (i64) -> i64
      %2405 = arith.cmpi ne, %2404, %2403 : i64
      %2406 = arith.cmpi eq, %2403, %2403 : i64
      %2407 = arith.andi %2405, %2406 : i1
      %2408 = scf.if %2407 -> (i64) {
        scf.yield %2402 : i64
      } else {
        scf.yield %2403 : i64
      }
      %2409 = arith.cmpi ne, %2408, %2403 : i64
      scf.if %2409 {
        func.call @stack_push_pointer(%2408) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2402) : (i64) -> ()
        %2410 = llvm.mlir.addressof @str256 : !llvm.ptr
        %2411 = func.call @cc_make_function_ref_const(%2410) : (!llvm.ptr) -> i64
        %2412 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2411, %2412) : (i64, i64) -> ()
      }
      %2413 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2414 = arith.constant 10 : i64
      %2415 = func.call @cc_make_string(%2413, %2414) : (!llvm.ptr, i64) -> i64
      %2416 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2417 = arith.constant 11 : i64
      %2418 = func.call @cc_make_string(%2416, %2417) : (!llvm.ptr, i64) -> i64
      %2419 = func.call @cc_intern(%2415, %2418) : (i64, i64) -> i64
      %2420 = func.call @cc_nil_value() : () -> i64
      %2421 = func.call @cc_cons(%2419, %2420) : (i64, i64) -> i64
      %2422 = func.call @cc_values_pack(%2421) : (i64) -> i64
      func.call @stack_push_pointer(%2419) : (i64) -> ()
      %2423 = func.call @stack_pop_pointer() : () -> i64
      %2424 = func.call @stack_pop_pointer() : () -> i64
      %2425 = func.call @cc_subtypep(%2424, %2423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2425) : (i64) -> ()
      %2426 = func.call @stack_pop_pointer() : () -> i64
      %2427 = func.call @cc_multiple_value_list(%2426) : (i64) -> i64
      %2428 = arith.constant 0 : i64
      %2429 = func.call @cc_box_fixnum(%2428) : (i64) -> i64
      %2430 = func.call @cc_nth(%2429, %2427) : (i64, i64) -> i64
      %2431 = arith.constant 1 : i64
      %2432 = func.call @cc_box_fixnum(%2431) : (i64) -> i64
      %2433 = func.call @cc_nth(%2432, %2427) : (i64, i64) -> i64
      %2434 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2430) : (i64) -> ()
      %2435 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2433) : (i64) -> ()
      %2436 = func.call @stack_pop_pointer() : () -> i64
      %2437 = func.call @cc_cons(%2436, %2434) : (i64, i64) -> i64
      %2438 = func.call @cc_cons(%2435, %2437) : (i64, i64) -> i64
      %2439 = func.call @cc_and(%2438) : (i64) -> i64
      func.call @stack_push_pointer(%2439) : (i64) -> ()
      %2440 = func.call @stack_pop_pointer() : () -> i64
      %2441 = func.call @cc_nil_value() : () -> i64
      %2442 = func.call @cc_cons(%2440, %2441) : (i64, i64) -> i64
      %2443 = func.call @cc_not(%2442) : (i64) -> i64
      func.call @stack_push_pointer(%2443) : (i64) -> ()
      %2444 = func.call @stack_pop_pointer() : () -> i64
      %2445 = func.call @cc_nil_value() : () -> i64
      %2446 = func.call @cc_cons(%2444, %2445) : (i64, i64) -> i64
      %2447 = func.call @cc_not(%2446) : (i64) -> i64
      func.call @stack_push_pointer(%2447) : (i64) -> ()
      %2448 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2448 : i64
    }
    func.call @stack_push_pointer(%2391) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077385"() {
    %2753 = func.call @cc_nil_value() : () -> i64
    %2754 = func.call @cc_nil_value() : () -> i64
    %2755 = func.call @cc_errorp(%2753) : (i64) -> i64
    %2756 = arith.cmpi ne, %2755, %2754 : i64
    %2757 = scf.if %2756 -> (i64) {
      scf.yield %2753 : i64
    } else {
      %2758 = llvm.mlir.addressof @str291 : !llvm.ptr
      %2759 = arith.constant 11 : i64
      %2760 = func.call @cc_make_string(%2758, %2759) : (!llvm.ptr, i64) -> i64
      %2761 = llvm.mlir.addressof @str292 : !llvm.ptr
      %2762 = arith.constant 11 : i64
      %2763 = func.call @cc_make_string(%2761, %2762) : (!llvm.ptr, i64) -> i64
      %2764 = func.call @cc_intern(%2760, %2763) : (i64, i64) -> i64
      %2765 = func.call @cc_nil_value() : () -> i64
      %2766 = func.call @cc_cons(%2764, %2765) : (i64, i64) -> i64
      %2767 = func.call @cc_values_pack(%2766) : (i64) -> i64
      func.call @stack_push_pointer(%2764) : (i64) -> ()
      %2768 = llvm.mlir.addressof @str293 : !llvm.ptr
      %2769 = arith.constant 11 : i64
      %2770 = func.call @cc_make_string(%2768, %2769) : (!llvm.ptr, i64) -> i64
      %2771 = llvm.mlir.addressof @str294 : !llvm.ptr
      %2772 = arith.constant 11 : i64
      %2773 = func.call @cc_make_string(%2771, %2772) : (!llvm.ptr, i64) -> i64
      %2774 = func.call @cc_intern(%2770, %2773) : (i64, i64) -> i64
      %2775 = func.call @cc_nil_value() : () -> i64
      %2776 = func.call @cc_cons(%2774, %2775) : (i64, i64) -> i64
      %2777 = func.call @cc_values_pack(%2776) : (i64) -> i64
      func.call @stack_push_pointer(%2774) : (i64) -> ()
      %2778 = func.call @stack_pop_pointer() : () -> i64
      %2779 = func.call @cc_nil_value() : () -> i64
      %2780 = func.call @cc_errorp(%2778) : (i64) -> i64
      %2781 = arith.cmpi ne, %2780, %2779 : i64
      %2782 = arith.cmpi eq, %2779, %2779 : i64
      %2783 = arith.andi %2781, %2782 : i1
      %2784 = scf.if %2783 -> (i64) {
        scf.yield %2778 : i64
      } else {
        scf.yield %2779 : i64
      }
      %2785 = arith.cmpi ne, %2784, %2779 : i64
      scf.if %2785 {
        func.call @stack_push_pointer(%2784) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2778) : (i64) -> ()
        %2786 = llvm.mlir.addressof @str295 : !llvm.ptr
        %2787 = func.call @cc_make_function_ref_const(%2786) : (!llvm.ptr) -> i64
        %2788 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2787, %2788) : (i64, i64) -> ()
      }
      %2789 = func.call @stack_pop_pointer() : () -> i64
      %2790 = func.call @stack_pop_pointer() : () -> i64
      %2791 = func.call @cc_subtypep(%2790, %2789) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2791) : (i64) -> ()
      %2792 = func.call @stack_pop_pointer() : () -> i64
      %2793 = func.call @cc_multiple_value_list(%2792) : (i64) -> i64
      %2794 = arith.constant 0 : i64
      %2795 = func.call @cc_box_fixnum(%2794) : (i64) -> i64
      %2796 = func.call @cc_nth(%2795, %2793) : (i64, i64) -> i64
      %2797 = arith.constant 1 : i64
      %2798 = func.call @cc_box_fixnum(%2797) : (i64) -> i64
      %2799 = func.call @cc_nth(%2798, %2793) : (i64, i64) -> i64
      %2800 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2796) : (i64) -> ()
      %2801 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2799) : (i64) -> ()
      %2802 = func.call @stack_pop_pointer() : () -> i64
      %2803 = func.call @cc_cons(%2802, %2800) : (i64, i64) -> i64
      %2804 = func.call @cc_cons(%2801, %2803) : (i64, i64) -> i64
      %2805 = func.call @cc_and(%2804) : (i64) -> i64
      func.call @stack_push_pointer(%2805) : (i64) -> ()
      %2806 = func.call @stack_pop_pointer() : () -> i64
      %2807 = func.call @cc_nil_value() : () -> i64
      %2808 = func.call @cc_cons(%2806, %2807) : (i64, i64) -> i64
      %2809 = func.call @cc_not(%2808) : (i64) -> i64
      func.call @stack_push_pointer(%2809) : (i64) -> ()
      %2810 = func.call @stack_pop_pointer() : () -> i64
      %2811 = func.call @cc_nil_value() : () -> i64
      %2812 = func.call @cc_cons(%2810, %2811) : (i64, i64) -> i64
      %2813 = func.call @cc_not(%2812) : (i64) -> i64
      func.call @stack_push_pointer(%2813) : (i64) -> ()
      %2814 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2814 : i64
    }
    func.call @stack_push_pointer(%2757) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077386"() {
    %3119 = func.call @cc_nil_value() : () -> i64
    %3120 = func.call @cc_nil_value() : () -> i64
    %3121 = func.call @cc_errorp(%3119) : (i64) -> i64
    %3122 = arith.cmpi ne, %3121, %3120 : i64
    %3123 = scf.if %3122 -> (i64) {
      scf.yield %3119 : i64
    } else {
      %3124 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3125 = arith.constant 11 : i64
      %3126 = func.call @cc_make_string(%3124, %3125) : (!llvm.ptr, i64) -> i64
      %3127 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3128 = arith.constant 11 : i64
      %3129 = func.call @cc_make_string(%3127, %3128) : (!llvm.ptr, i64) -> i64
      %3130 = func.call @cc_intern(%3126, %3129) : (i64, i64) -> i64
      %3131 = func.call @cc_nil_value() : () -> i64
      %3132 = func.call @cc_cons(%3130, %3131) : (i64, i64) -> i64
      %3133 = func.call @cc_values_pack(%3132) : (i64) -> i64
      func.call @stack_push_pointer(%3130) : (i64) -> ()
      %3134 = func.call @stack_pop_pointer() : () -> i64
      %3135 = func.call @cc_nil_value() : () -> i64
      %3136 = func.call @cc_errorp(%3134) : (i64) -> i64
      %3137 = arith.cmpi ne, %3136, %3135 : i64
      %3138 = arith.cmpi eq, %3135, %3135 : i64
      %3139 = arith.andi %3137, %3138 : i1
      %3140 = scf.if %3139 -> (i64) {
        scf.yield %3134 : i64
      } else {
        scf.yield %3135 : i64
      }
      %3141 = arith.cmpi ne, %3140, %3135 : i64
      scf.if %3141 {
        func.call @stack_push_pointer(%3140) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3134) : (i64) -> ()
        %3142 = llvm.mlir.addressof @str330 : !llvm.ptr
        %3143 = func.call @cc_make_function_ref_const(%3142) : (!llvm.ptr) -> i64
        %3144 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3143, %3144) : (i64, i64) -> ()
      }
      %3145 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3146 = arith.constant 11 : i64
      %3147 = func.call @cc_make_string(%3145, %3146) : (!llvm.ptr, i64) -> i64
      %3148 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3149 = arith.constant 11 : i64
      %3150 = func.call @cc_make_string(%3148, %3149) : (!llvm.ptr, i64) -> i64
      %3151 = func.call @cc_intern(%3147, %3150) : (i64, i64) -> i64
      %3152 = func.call @cc_nil_value() : () -> i64
      %3153 = func.call @cc_cons(%3151, %3152) : (i64, i64) -> i64
      %3154 = func.call @cc_values_pack(%3153) : (i64) -> i64
      func.call @stack_push_pointer(%3151) : (i64) -> ()
      %3155 = func.call @stack_pop_pointer() : () -> i64
      %3156 = func.call @stack_pop_pointer() : () -> i64
      %3157 = func.call @cc_subtypep(%3156, %3155) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3157) : (i64) -> ()
      %3158 = func.call @stack_pop_pointer() : () -> i64
      %3159 = func.call @cc_multiple_value_list(%3158) : (i64) -> i64
      %3160 = arith.constant 0 : i64
      %3161 = func.call @cc_box_fixnum(%3160) : (i64) -> i64
      %3162 = func.call @cc_nth(%3161, %3159) : (i64, i64) -> i64
      %3163 = arith.constant 1 : i64
      %3164 = func.call @cc_box_fixnum(%3163) : (i64) -> i64
      %3165 = func.call @cc_nth(%3164, %3159) : (i64, i64) -> i64
      %3166 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3162) : (i64) -> ()
      %3167 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3165) : (i64) -> ()
      %3168 = func.call @stack_pop_pointer() : () -> i64
      %3169 = func.call @cc_cons(%3168, %3166) : (i64, i64) -> i64
      %3170 = func.call @cc_cons(%3167, %3169) : (i64, i64) -> i64
      %3171 = func.call @cc_and(%3170) : (i64) -> i64
      func.call @stack_push_pointer(%3171) : (i64) -> ()
      %3172 = func.call @stack_pop_pointer() : () -> i64
      %3173 = func.call @cc_nil_value() : () -> i64
      %3174 = func.call @cc_cons(%3172, %3173) : (i64, i64) -> i64
      %3175 = func.call @cc_not(%3174) : (i64) -> i64
      func.call @stack_push_pointer(%3175) : (i64) -> ()
      %3176 = func.call @stack_pop_pointer() : () -> i64
      %3177 = func.call @cc_nil_value() : () -> i64
      %3178 = func.call @cc_cons(%3176, %3177) : (i64, i64) -> i64
      %3179 = func.call @cc_not(%3178) : (i64) -> i64
      func.call @stack_push_pointer(%3179) : (i64) -> ()
      %3180 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3180 : i64
    }
    func.call @stack_push_pointer(%3123) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077387"() {
    %3378 = func.call @cc_nil_value() : () -> i64
    %3379 = func.call @cc_nil_value() : () -> i64
    %3380 = func.call @cc_errorp(%3378) : (i64) -> i64
    %3381 = arith.cmpi ne, %3380, %3379 : i64
    %3382 = scf.if %3381 -> (i64) {
      scf.yield %3378 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3383 = arith.constant 4 : i64
      %3384 = func.call @cc_box_fixnum(%3383) : (i64) -> i64
      %3385 = func.call @cc_make_vector(%3384) : (i64) -> i64
      %3386 = func.call @stack_pop_pointer() : () -> i64
      %3387 = arith.constant 3 : i64
      %3388 = func.call @cc_box_fixnum(%3387) : (i64) -> i64
      %3389 = func.call @cc_svset(%3385, %3388, %3386) : (i64, i64, i64) -> i64
      %3390 = func.call @stack_pop_pointer() : () -> i64
      %3391 = arith.constant 2 : i64
      %3392 = func.call @cc_box_fixnum(%3391) : (i64) -> i64
      %3393 = func.call @cc_svset(%3385, %3392, %3390) : (i64, i64, i64) -> i64
      %3394 = func.call @stack_pop_pointer() : () -> i64
      %3395 = arith.constant 1 : i64
      %3396 = func.call @cc_box_fixnum(%3395) : (i64) -> i64
      %3397 = func.call @cc_svset(%3385, %3396, %3394) : (i64, i64, i64) -> i64
      %3398 = func.call @stack_pop_pointer() : () -> i64
      %3399 = arith.constant 0 : i64
      %3400 = func.call @cc_box_fixnum(%3399) : (i64) -> i64
      %3401 = func.call @cc_svset(%3385, %3400, %3398) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%3385) : (i64) -> ()
      %3402 = func.call @stack_pop_pointer() : () -> i64
      %3403 = func.call @cc_type_of(%3402) : (i64) -> i64
      func.call @stack_push_pointer(%3403) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3404 = arith.constant 4 : i64
      %3405 = func.call @cc_box_fixnum(%3404) : (i64) -> i64
      %3406 = func.call @cc_make_vector(%3405) : (i64) -> i64
      %3407 = func.call @stack_pop_pointer() : () -> i64
      %3408 = arith.constant 3 : i64
      %3409 = func.call @cc_box_fixnum(%3408) : (i64) -> i64
      %3410 = func.call @cc_svset(%3406, %3409, %3407) : (i64, i64, i64) -> i64
      %3411 = func.call @stack_pop_pointer() : () -> i64
      %3412 = arith.constant 2 : i64
      %3413 = func.call @cc_box_fixnum(%3412) : (i64) -> i64
      %3414 = func.call @cc_svset(%3406, %3413, %3411) : (i64, i64, i64) -> i64
      %3415 = func.call @stack_pop_pointer() : () -> i64
      %3416 = arith.constant 1 : i64
      %3417 = func.call @cc_box_fixnum(%3416) : (i64) -> i64
      %3418 = func.call @cc_svset(%3406, %3417, %3415) : (i64, i64, i64) -> i64
      %3419 = func.call @stack_pop_pointer() : () -> i64
      %3420 = arith.constant 0 : i64
      %3421 = func.call @cc_box_fixnum(%3420) : (i64) -> i64
      %3422 = func.call @cc_svset(%3406, %3421, %3419) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%3406) : (i64) -> ()
      %3423 = func.call @stack_pop_pointer() : () -> i64
      %3424 = func.call @cc_class_of(%3423) : (i64) -> i64
      func.call @stack_push_pointer(%3424) : (i64) -> ()
      %3425 = func.call @stack_pop_pointer() : () -> i64
      %3426 = func.call @stack_pop_pointer() : () -> i64
      %3427 = func.call @cc_subtypep(%3426, %3425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3427) : (i64) -> ()
      %3428 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3428 : i64
    }
    func.call @stack_push_pointer(%3382) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077388"() {
    %3618 = func.call @cc_nil_value() : () -> i64
    %3619 = func.call @cc_nil_value() : () -> i64
    %3620 = func.call @cc_errorp(%3618) : (i64) -> i64
    %3621 = arith.cmpi ne, %3620, %3619 : i64
    %3622 = scf.if %3621 -> (i64) {
      scf.yield %3618 : i64
    } else {
      %3623 = llvm.mlir.addressof @str365 : !llvm.ptr
      %3624 = func.call @cc_make_function_ref_const(%3623) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3624) : (i64) -> ()
      %3625 = func.call @stack_pop_pointer() : () -> i64
      %3626 = func.call @cc_type_of(%3625) : (i64) -> i64
      func.call @stack_push_pointer(%3626) : (i64) -> ()
      %3627 = llvm.mlir.addressof @str366 : !llvm.ptr
      %3628 = arith.constant 8 : i64
      %3629 = func.call @cc_make_string(%3627, %3628) : (!llvm.ptr, i64) -> i64
      %3630 = llvm.mlir.addressof @str367 : !llvm.ptr
      %3631 = arith.constant 11 : i64
      %3632 = func.call @cc_make_string(%3630, %3631) : (!llvm.ptr, i64) -> i64
      %3633 = func.call @cc_intern(%3629, %3632) : (i64, i64) -> i64
      %3634 = func.call @cc_nil_value() : () -> i64
      %3635 = func.call @cc_cons(%3633, %3634) : (i64, i64) -> i64
      %3636 = func.call @cc_values_pack(%3635) : (i64) -> i64
      func.call @stack_push_pointer(%3633) : (i64) -> ()
      %3637 = func.call @stack_pop_pointer() : () -> i64
      %3638 = func.call @stack_pop_pointer() : () -> i64
      %3639 = func.call @cc_subtypep(%3638, %3637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3639) : (i64) -> ()
      %3640 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3640 : i64
    }
    func.call @stack_push_pointer(%3622) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077389"() {
    %3950 = func.call @stack_pop_pointer() : () -> i64
    %3951 = func.call @stack_pop_pointer() : () -> i64
    %3952 = func.call @stack_pop_pointer() : () -> i64
    %3953 = func.call @stack_pop_pointer() : () -> i64
    %3954 = func.call @stack_pop_pointer() : () -> i64
    %3955 = func.call @stack_pop_pointer() : () -> i64
    %3956 = func.call @cc_nil_value() : () -> i64
    %3957 = func.call @cc_nil_value() : () -> i64
    %3958 = func.call @cc_errorp(%3956) : (i64) -> i64
    %3959 = arith.cmpi ne, %3958, %3957 : i64
    %3960 = scf.if %3959 -> (i64) {
      scf.yield %3956 : i64
    } else {
      %3961 = func.call @cc_nil_value() : () -> i64
      %3962 = func.call @cc_nil_value() : () -> i64
      %3963 = func.call @cc_errorp(%3961) : (i64) -> i64
      %3964 = arith.cmpi ne, %3963, %3962 : i64
      %3965 = scf.if %3964 -> (i64) {
        scf.yield %3961 : i64
      } else {
        %3966 = func.call @cc_symbol_value(%3955) : (i64) -> i64
        func.call @stack_push_pointer(%3966) : (i64) -> ()
        %3967 = func.call @cc_symbol_value(%3954) : (i64) -> i64
        func.call @stack_push_pointer(%3967) : (i64) -> ()
        %3968 = func.call @cc_symbol_value(%3953) : (i64) -> i64
        func.call @stack_push_pointer(%3968) : (i64) -> ()
        %3969 = func.call @cc_symbol_value(%3952) : (i64) -> i64
        func.call @stack_push_pointer(%3969) : (i64) -> ()
        %3970 = func.call @cc_symbol_value(%3951) : (i64) -> i64
        func.call @stack_push_pointer(%3970) : (i64) -> ()
        %3971 = func.call @cc_symbol_value(%3950) : (i64) -> i64
        func.call @stack_push_pointer(%3971) : (i64) -> ()
        %3972 = arith.constant 6 : i64
        %3973 = func.call @cc_box_fixnum(%3972) : (i64) -> i64
        %3974 = func.call @cc_make_vector(%3973) : (i64) -> i64
        %3975 = func.call @stack_pop_pointer() : () -> i64
        %3976 = arith.constant 5 : i64
        %3977 = func.call @cc_box_fixnum(%3976) : (i64) -> i64
        %3978 = func.call @cc_svset(%3974, %3977, %3975) : (i64, i64, i64) -> i64
        %3979 = func.call @stack_pop_pointer() : () -> i64
        %3980 = arith.constant 4 : i64
        %3981 = func.call @cc_box_fixnum(%3980) : (i64) -> i64
        %3982 = func.call @cc_svset(%3974, %3981, %3979) : (i64, i64, i64) -> i64
        %3983 = func.call @stack_pop_pointer() : () -> i64
        %3984 = arith.constant 3 : i64
        %3985 = func.call @cc_box_fixnum(%3984) : (i64) -> i64
        %3986 = func.call @cc_svset(%3974, %3985, %3983) : (i64, i64, i64) -> i64
        %3987 = func.call @stack_pop_pointer() : () -> i64
        %3988 = arith.constant 2 : i64
        %3989 = func.call @cc_box_fixnum(%3988) : (i64) -> i64
        %3990 = func.call @cc_svset(%3974, %3989, %3987) : (i64, i64, i64) -> i64
        %3991 = func.call @stack_pop_pointer() : () -> i64
        %3992 = arith.constant 1 : i64
        %3993 = func.call @cc_box_fixnum(%3992) : (i64) -> i64
        %3994 = func.call @cc_svset(%3974, %3993, %3991) : (i64, i64, i64) -> i64
        %3995 = func.call @stack_pop_pointer() : () -> i64
        %3996 = arith.constant 0 : i64
        %3997 = func.call @cc_box_fixnum(%3996) : (i64) -> i64
        %3998 = func.call @cc_svset(%3974, %3997, %3995) : (i64, i64, i64) -> i64
        func.call @stack_push_pointer(%3974) : (i64) -> ()
        %3999 = llvm.mlir.addressof @str393 : !llvm.ptr
        %4000 = arith.constant 12 : i64
        %4001 = func.call @cc_make_string(%3999, %4000) : (!llvm.ptr, i64) -> i64
        %4002 = llvm.mlir.addressof @str394 : !llvm.ptr
        %4003 = arith.constant 11 : i64
        %4004 = func.call @cc_make_string(%4002, %4003) : (!llvm.ptr, i64) -> i64
        %4005 = func.call @cc_intern(%4001, %4004) : (i64, i64) -> i64
        %4006 = func.call @cc_nil_value() : () -> i64
        %4007 = func.call @cc_cons(%4005, %4006) : (i64, i64) -> i64
        %4008 = func.call @cc_values_pack(%4007) : (i64) -> i64
        func.call @stack_push_pointer(%4005) : (i64) -> ()
        %4009 = llvm.mlir.addressof @str395 : !llvm.ptr
        %4010 = arith.constant 1 : i64
        %4011 = func.call @cc_make_string(%4009, %4010) : (!llvm.ptr, i64) -> i64
        %4012 = llvm.mlir.addressof @str396 : !llvm.ptr
        %4013 = arith.constant 11 : i64
        %4014 = func.call @cc_make_string(%4012, %4013) : (!llvm.ptr, i64) -> i64
        %4015 = func.call @cc_intern(%4011, %4014) : (i64, i64) -> i64
        %4016 = func.call @cc_nil_value() : () -> i64
        %4017 = func.call @cc_cons(%4015, %4016) : (i64, i64) -> i64
        %4018 = func.call @cc_values_pack(%4017) : (i64) -> i64
        func.call @stack_push_pointer(%4015) : (i64) -> ()
        %4019 = llvm.mlir.addressof @str397 : !llvm.ptr
        %4020 = arith.constant 1 : i64
        %4021 = func.call @cc_make_string(%4019, %4020) : (!llvm.ptr, i64) -> i64
        %4022 = llvm.mlir.addressof @str398 : !llvm.ptr
        %4023 = arith.constant 11 : i64
        %4024 = func.call @cc_make_string(%4022, %4023) : (!llvm.ptr, i64) -> i64
        %4025 = func.call @cc_intern(%4021, %4024) : (i64, i64) -> i64
        %4026 = func.call @cc_nil_value() : () -> i64
        %4027 = func.call @cc_cons(%4025, %4026) : (i64, i64) -> i64
        %4028 = func.call @cc_values_pack(%4027) : (i64) -> i64
        func.call @stack_push_pointer(%4025) : (i64) -> ()
        %4029 = arith.constant 2 : i64
        func.call @stack_push_fixnum(%4029) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %4030 = func.call @stack_pop_pointer() : () -> i64
        %4031 = func.call @stack_pop_pointer() : () -> i64
        %4032 = func.call @cc_cons(%4031, %4030) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4032) : (i64) -> ()
        %4033 = func.call @stack_pop_pointer() : () -> i64
        %4034 = func.call @stack_pop_pointer() : () -> i64
        %4035 = func.call @cc_cons(%4034, %4033) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4035) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %4036 = func.call @stack_pop_pointer() : () -> i64
        %4037 = func.call @stack_pop_pointer() : () -> i64
        %4038 = func.call @cc_cons(%4037, %4036) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4038) : (i64) -> ()
        %4039 = func.call @stack_pop_pointer() : () -> i64
        %4040 = func.call @stack_pop_pointer() : () -> i64
        %4041 = func.call @cc_cons(%4040, %4039) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4041) : (i64) -> ()
        %4042 = func.call @stack_pop_pointer() : () -> i64
        %4043 = func.call @stack_pop_pointer() : () -> i64
        %4044 = func.call @cc_cons(%4043, %4042) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4044) : (i64) -> ()
        %4045 = func.call @stack_pop_pointer() : () -> i64
        %4046 = func.call @stack_pop_pointer() : () -> i64
        %4047 = func.call @cc_typep(%4046, %4045) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4047) : (i64) -> ()
        %4048 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4048 : i64
      }
      func.call @stack_push_pointer(%3965) : (i64) -> ()
      %4049 = func.call @stack_pop_pointer() : () -> i64
      %4050 = func.call @cc_nil_value() : () -> i64
      %4051 = func.call @cc_cons(%4049, %4050) : (i64, i64) -> i64
      %4052 = func.call @cc_not(%4051) : (i64) -> i64
      func.call @stack_push_pointer(%4052) : (i64) -> ()
      %4053 = func.call @stack_pop_pointer() : () -> i64
      %4054 = func.call @cc_nil_value() : () -> i64
      %4055 = func.call @cc_cons(%4053, %4054) : (i64, i64) -> i64
      %4056 = func.call @cc_not(%4055) : (i64) -> i64
      func.call @stack_push_pointer(%4056) : (i64) -> ()
      %4057 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4057 : i64
    }
    func.call @stack_push_pointer(%3960) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077396"() {
    %4386 = func.call @cc_nil_value() : () -> i64
    %4387 = func.call @cc_nil_value() : () -> i64
    %4388 = func.call @cc_errorp(%4386) : (i64) -> i64
    %4389 = arith.cmpi ne, %4388, %4387 : i64
    %4390 = scf.if %4389 -> (i64) {
      scf.yield %4386 : i64
    } else {
      %4391 = llvm.mlir.addressof @str437 : !llvm.ptr
      %4392 = arith.constant 6 : i64
      %4393 = func.call @cc_make_string(%4391, %4392) : (!llvm.ptr, i64) -> i64
      %4394 = llvm.mlir.addressof @str438 : !llvm.ptr
      %4395 = arith.constant 11 : i64
      %4396 = func.call @cc_make_string(%4394, %4395) : (!llvm.ptr, i64) -> i64
      %4397 = func.call @cc_intern(%4393, %4396) : (i64, i64) -> i64
      %4398 = func.call @cc_nil_value() : () -> i64
      %4399 = func.call @cc_cons(%4397, %4398) : (i64, i64) -> i64
      %4400 = func.call @cc_values_pack(%4399) : (i64) -> i64
      func.call @stack_push_pointer(%4397) : (i64) -> ()
      %4401 = llvm.mlir.addressof @str439 : !llvm.ptr
      %4402 = arith.constant 6 : i64
      %4403 = func.call @cc_make_string(%4401, %4402) : (!llvm.ptr, i64) -> i64
      %4404 = llvm.mlir.addressof @str440 : !llvm.ptr
      %4405 = arith.constant 11 : i64
      %4406 = func.call @cc_make_string(%4404, %4405) : (!llvm.ptr, i64) -> i64
      %4407 = func.call @cc_intern(%4403, %4406) : (i64, i64) -> i64
      %4408 = func.call @cc_nil_value() : () -> i64
      %4409 = func.call @cc_cons(%4407, %4408) : (i64, i64) -> i64
      %4410 = func.call @cc_values_pack(%4409) : (i64) -> i64
      func.call @stack_push_pointer(%4407) : (i64) -> ()
      %4411 = func.call @stack_pop_pointer() : () -> i64
      %4412 = func.call @cc_nil_value() : () -> i64
      %4413 = func.call @cc_errorp(%4411) : (i64) -> i64
      %4414 = arith.cmpi ne, %4413, %4412 : i64
      %4415 = arith.cmpi eq, %4412, %4412 : i64
      %4416 = arith.andi %4414, %4415 : i1
      %4417 = scf.if %4416 -> (i64) {
        scf.yield %4411 : i64
      } else {
        scf.yield %4412 : i64
      }
      %4418 = arith.cmpi ne, %4417, %4412 : i64
      scf.if %4418 {
        func.call @stack_push_pointer(%4417) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4411) : (i64) -> ()
        %4419 = llvm.mlir.addressof @str441 : !llvm.ptr
        %4420 = func.call @cc_make_function_ref_const(%4419) : (!llvm.ptr) -> i64
        %4421 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%4420, %4421) : (i64, i64) -> ()
      }
      %4422 = func.call @stack_pop_pointer() : () -> i64
      %4423 = func.call @stack_pop_pointer() : () -> i64
      %4424 = func.call @cc_subtypep(%4423, %4422) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4424) : (i64) -> ()
      %4425 = func.call @stack_pop_pointer() : () -> i64
      %4426 = func.call @cc_multiple_value_list(%4425) : (i64) -> i64
      %4427 = arith.constant 0 : i64
      %4428 = func.call @cc_box_fixnum(%4427) : (i64) -> i64
      %4429 = func.call @cc_nth(%4428, %4426) : (i64, i64) -> i64
      %4430 = arith.constant 1 : i64
      %4431 = func.call @cc_box_fixnum(%4430) : (i64) -> i64
      %4432 = func.call @cc_nth(%4431, %4426) : (i64, i64) -> i64
      %4433 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4429) : (i64) -> ()
      %4434 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4432) : (i64) -> ()
      %4435 = func.call @stack_pop_pointer() : () -> i64
      %4436 = func.call @cc_cons(%4435, %4433) : (i64, i64) -> i64
      %4437 = func.call @cc_cons(%4434, %4436) : (i64, i64) -> i64
      %4438 = func.call @cc_and(%4437) : (i64) -> i64
      func.call @stack_push_pointer(%4438) : (i64) -> ()
      %4439 = func.call @stack_pop_pointer() : () -> i64
      %4440 = func.call @cc_nil_value() : () -> i64
      %4441 = func.call @cc_cons(%4439, %4440) : (i64, i64) -> i64
      %4442 = func.call @cc_not(%4441) : (i64) -> i64
      func.call @stack_push_pointer(%4442) : (i64) -> ()
      %4443 = func.call @stack_pop_pointer() : () -> i64
      %4444 = func.call @cc_nil_value() : () -> i64
      %4445 = func.call @cc_cons(%4443, %4444) : (i64, i64) -> i64
      %4446 = func.call @cc_not(%4445) : (i64) -> i64
      func.call @stack_push_pointer(%4446) : (i64) -> ()
      %4447 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4447 : i64
    }
    func.call @stack_push_pointer(%4390) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077397"() {
    %4752 = func.call @cc_nil_value() : () -> i64
    %4753 = func.call @cc_nil_value() : () -> i64
    %4754 = func.call @cc_errorp(%4752) : (i64) -> i64
    %4755 = arith.cmpi ne, %4754, %4753 : i64
    %4756 = scf.if %4755 -> (i64) {
      scf.yield %4752 : i64
    } else {
      %4757 = llvm.mlir.addressof @str474 : !llvm.ptr
      %4758 = arith.constant 6 : i64
      %4759 = func.call @cc_make_string(%4757, %4758) : (!llvm.ptr, i64) -> i64
      %4760 = llvm.mlir.addressof @str475 : !llvm.ptr
      %4761 = arith.constant 11 : i64
      %4762 = func.call @cc_make_string(%4760, %4761) : (!llvm.ptr, i64) -> i64
      %4763 = func.call @cc_intern(%4759, %4762) : (i64, i64) -> i64
      %4764 = func.call @cc_nil_value() : () -> i64
      %4765 = func.call @cc_cons(%4763, %4764) : (i64, i64) -> i64
      %4766 = func.call @cc_values_pack(%4765) : (i64) -> i64
      func.call @stack_push_pointer(%4763) : (i64) -> ()
      %4767 = func.call @stack_pop_pointer() : () -> i64
      %4768 = func.call @cc_nil_value() : () -> i64
      %4769 = func.call @cc_errorp(%4767) : (i64) -> i64
      %4770 = arith.cmpi ne, %4769, %4768 : i64
      %4771 = arith.cmpi eq, %4768, %4768 : i64
      %4772 = arith.andi %4770, %4771 : i1
      %4773 = scf.if %4772 -> (i64) {
        scf.yield %4767 : i64
      } else {
        scf.yield %4768 : i64
      }
      %4774 = arith.cmpi ne, %4773, %4768 : i64
      scf.if %4774 {
        func.call @stack_push_pointer(%4773) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4767) : (i64) -> ()
        %4775 = llvm.mlir.addressof @str476 : !llvm.ptr
        %4776 = func.call @cc_make_function_ref_const(%4775) : (!llvm.ptr) -> i64
        %4777 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%4776, %4777) : (i64, i64) -> ()
      }
      %4778 = llvm.mlir.addressof @str477 : !llvm.ptr
      %4779 = arith.constant 6 : i64
      %4780 = func.call @cc_make_string(%4778, %4779) : (!llvm.ptr, i64) -> i64
      %4781 = llvm.mlir.addressof @str478 : !llvm.ptr
      %4782 = arith.constant 11 : i64
      %4783 = func.call @cc_make_string(%4781, %4782) : (!llvm.ptr, i64) -> i64
      %4784 = func.call @cc_intern(%4780, %4783) : (i64, i64) -> i64
      %4785 = func.call @cc_nil_value() : () -> i64
      %4786 = func.call @cc_cons(%4784, %4785) : (i64, i64) -> i64
      %4787 = func.call @cc_values_pack(%4786) : (i64) -> i64
      func.call @stack_push_pointer(%4784) : (i64) -> ()
      %4788 = func.call @stack_pop_pointer() : () -> i64
      %4789 = func.call @stack_pop_pointer() : () -> i64
      %4790 = func.call @cc_subtypep(%4789, %4788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4790) : (i64) -> ()
      %4791 = func.call @stack_pop_pointer() : () -> i64
      %4792 = func.call @cc_multiple_value_list(%4791) : (i64) -> i64
      %4793 = arith.constant 0 : i64
      %4794 = func.call @cc_box_fixnum(%4793) : (i64) -> i64
      %4795 = func.call @cc_nth(%4794, %4792) : (i64, i64) -> i64
      %4796 = arith.constant 1 : i64
      %4797 = func.call @cc_box_fixnum(%4796) : (i64) -> i64
      %4798 = func.call @cc_nth(%4797, %4792) : (i64, i64) -> i64
      %4799 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4795) : (i64) -> ()
      %4800 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4798) : (i64) -> ()
      %4801 = func.call @stack_pop_pointer() : () -> i64
      %4802 = func.call @cc_cons(%4801, %4799) : (i64, i64) -> i64
      %4803 = func.call @cc_cons(%4800, %4802) : (i64, i64) -> i64
      %4804 = func.call @cc_and(%4803) : (i64) -> i64
      func.call @stack_push_pointer(%4804) : (i64) -> ()
      %4805 = func.call @stack_pop_pointer() : () -> i64
      %4806 = func.call @cc_nil_value() : () -> i64
      %4807 = func.call @cc_cons(%4805, %4806) : (i64, i64) -> i64
      %4808 = func.call @cc_not(%4807) : (i64) -> i64
      func.call @stack_push_pointer(%4808) : (i64) -> ()
      %4809 = func.call @stack_pop_pointer() : () -> i64
      %4810 = func.call @cc_nil_value() : () -> i64
      %4811 = func.call @cc_cons(%4809, %4810) : (i64, i64) -> i64
      %4812 = func.call @cc_not(%4811) : (i64) -> i64
      func.call @stack_push_pointer(%4812) : (i64) -> ()
      %4813 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4813 : i64
    }
    func.call @stack_push_pointer(%4756) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077398"() {
    %5118 = func.call @cc_nil_value() : () -> i64
    %5119 = func.call @cc_nil_value() : () -> i64
    %5120 = func.call @cc_errorp(%5118) : (i64) -> i64
    %5121 = arith.cmpi ne, %5120, %5119 : i64
    %5122 = scf.if %5121 -> (i64) {
      scf.yield %5118 : i64
    } else {
      %5123 = llvm.mlir.addressof @str511 : !llvm.ptr
      %5124 = arith.constant 11 : i64
      %5125 = func.call @cc_make_string(%5123, %5124) : (!llvm.ptr, i64) -> i64
      %5126 = llvm.mlir.addressof @str512 : !llvm.ptr
      %5127 = arith.constant 11 : i64
      %5128 = func.call @cc_make_string(%5126, %5127) : (!llvm.ptr, i64) -> i64
      %5129 = func.call @cc_intern(%5125, %5128) : (i64, i64) -> i64
      %5130 = func.call @cc_nil_value() : () -> i64
      %5131 = func.call @cc_cons(%5129, %5130) : (i64, i64) -> i64
      %5132 = func.call @cc_values_pack(%5131) : (i64) -> i64
      func.call @stack_push_pointer(%5129) : (i64) -> ()
      %5133 = llvm.mlir.addressof @str513 : !llvm.ptr
      %5134 = arith.constant 11 : i64
      %5135 = func.call @cc_make_string(%5133, %5134) : (!llvm.ptr, i64) -> i64
      %5136 = llvm.mlir.addressof @str514 : !llvm.ptr
      %5137 = arith.constant 11 : i64
      %5138 = func.call @cc_make_string(%5136, %5137) : (!llvm.ptr, i64) -> i64
      %5139 = func.call @cc_intern(%5135, %5138) : (i64, i64) -> i64
      %5140 = func.call @cc_nil_value() : () -> i64
      %5141 = func.call @cc_cons(%5139, %5140) : (i64, i64) -> i64
      %5142 = func.call @cc_values_pack(%5141) : (i64) -> i64
      func.call @stack_push_pointer(%5139) : (i64) -> ()
      %5143 = func.call @stack_pop_pointer() : () -> i64
      %5144 = func.call @cc_nil_value() : () -> i64
      %5145 = func.call @cc_errorp(%5143) : (i64) -> i64
      %5146 = arith.cmpi ne, %5145, %5144 : i64
      %5147 = arith.cmpi eq, %5144, %5144 : i64
      %5148 = arith.andi %5146, %5147 : i1
      %5149 = scf.if %5148 -> (i64) {
        scf.yield %5143 : i64
      } else {
        scf.yield %5144 : i64
      }
      %5150 = arith.cmpi ne, %5149, %5144 : i64
      scf.if %5150 {
        func.call @stack_push_pointer(%5149) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5143) : (i64) -> ()
        %5151 = llvm.mlir.addressof @str515 : !llvm.ptr
        %5152 = func.call @cc_make_function_ref_const(%5151) : (!llvm.ptr) -> i64
        %5153 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5152, %5153) : (i64, i64) -> ()
      }
      %5154 = func.call @stack_pop_pointer() : () -> i64
      %5155 = func.call @stack_pop_pointer() : () -> i64
      %5156 = func.call @cc_subtypep(%5155, %5154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5156) : (i64) -> ()
      %5157 = func.call @stack_pop_pointer() : () -> i64
      %5158 = func.call @cc_multiple_value_list(%5157) : (i64) -> i64
      %5159 = arith.constant 0 : i64
      %5160 = func.call @cc_box_fixnum(%5159) : (i64) -> i64
      %5161 = func.call @cc_nth(%5160, %5158) : (i64, i64) -> i64
      %5162 = arith.constant 1 : i64
      %5163 = func.call @cc_box_fixnum(%5162) : (i64) -> i64
      %5164 = func.call @cc_nth(%5163, %5158) : (i64, i64) -> i64
      %5165 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5161) : (i64) -> ()
      %5166 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%5164) : (i64) -> ()
      %5167 = func.call @stack_pop_pointer() : () -> i64
      %5168 = func.call @cc_cons(%5167, %5165) : (i64, i64) -> i64
      %5169 = func.call @cc_cons(%5166, %5168) : (i64, i64) -> i64
      %5170 = func.call @cc_and(%5169) : (i64) -> i64
      func.call @stack_push_pointer(%5170) : (i64) -> ()
      %5171 = func.call @stack_pop_pointer() : () -> i64
      %5172 = func.call @cc_nil_value() : () -> i64
      %5173 = func.call @cc_cons(%5171, %5172) : (i64, i64) -> i64
      %5174 = func.call @cc_not(%5173) : (i64) -> i64
      func.call @stack_push_pointer(%5174) : (i64) -> ()
      %5175 = func.call @stack_pop_pointer() : () -> i64
      %5176 = func.call @cc_nil_value() : () -> i64
      %5177 = func.call @cc_cons(%5175, %5176) : (i64, i64) -> i64
      %5178 = func.call @cc_not(%5177) : (i64) -> i64
      func.call @stack_push_pointer(%5178) : (i64) -> ()
      %5179 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5179 : i64
    }
    func.call @stack_push_pointer(%5122) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077399"() {
    %5484 = func.call @cc_nil_value() : () -> i64
    %5485 = func.call @cc_nil_value() : () -> i64
    %5486 = func.call @cc_errorp(%5484) : (i64) -> i64
    %5487 = arith.cmpi ne, %5486, %5485 : i64
    %5488 = scf.if %5487 -> (i64) {
      scf.yield %5484 : i64
    } else {
      %5489 = llvm.mlir.addressof @str548 : !llvm.ptr
      %5490 = arith.constant 11 : i64
      %5491 = func.call @cc_make_string(%5489, %5490) : (!llvm.ptr, i64) -> i64
      %5492 = llvm.mlir.addressof @str549 : !llvm.ptr
      %5493 = arith.constant 11 : i64
      %5494 = func.call @cc_make_string(%5492, %5493) : (!llvm.ptr, i64) -> i64
      %5495 = func.call @cc_intern(%5491, %5494) : (i64, i64) -> i64
      %5496 = func.call @cc_nil_value() : () -> i64
      %5497 = func.call @cc_cons(%5495, %5496) : (i64, i64) -> i64
      %5498 = func.call @cc_values_pack(%5497) : (i64) -> i64
      func.call @stack_push_pointer(%5495) : (i64) -> ()
      %5499 = func.call @stack_pop_pointer() : () -> i64
      %5500 = func.call @cc_nil_value() : () -> i64
      %5501 = func.call @cc_errorp(%5499) : (i64) -> i64
      %5502 = arith.cmpi ne, %5501, %5500 : i64
      %5503 = arith.cmpi eq, %5500, %5500 : i64
      %5504 = arith.andi %5502, %5503 : i1
      %5505 = scf.if %5504 -> (i64) {
        scf.yield %5499 : i64
      } else {
        scf.yield %5500 : i64
      }
      %5506 = arith.cmpi ne, %5505, %5500 : i64
      scf.if %5506 {
        func.call @stack_push_pointer(%5505) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5499) : (i64) -> ()
        %5507 = llvm.mlir.addressof @str550 : !llvm.ptr
        %5508 = func.call @cc_make_function_ref_const(%5507) : (!llvm.ptr) -> i64
        %5509 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5508, %5509) : (i64, i64) -> ()
      }
      %5510 = llvm.mlir.addressof @str551 : !llvm.ptr
      %5511 = arith.constant 11 : i64
      %5512 = func.call @cc_make_string(%5510, %5511) : (!llvm.ptr, i64) -> i64
      %5513 = llvm.mlir.addressof @str552 : !llvm.ptr
      %5514 = arith.constant 11 : i64
      %5515 = func.call @cc_make_string(%5513, %5514) : (!llvm.ptr, i64) -> i64
      %5516 = func.call @cc_intern(%5512, %5515) : (i64, i64) -> i64
      %5517 = func.call @cc_nil_value() : () -> i64
      %5518 = func.call @cc_cons(%5516, %5517) : (i64, i64) -> i64
      %5519 = func.call @cc_values_pack(%5518) : (i64) -> i64
      func.call @stack_push_pointer(%5516) : (i64) -> ()
      %5520 = func.call @stack_pop_pointer() : () -> i64
      %5521 = func.call @stack_pop_pointer() : () -> i64
      %5522 = func.call @cc_subtypep(%5521, %5520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5522) : (i64) -> ()
      %5523 = func.call @stack_pop_pointer() : () -> i64
      %5524 = func.call @cc_multiple_value_list(%5523) : (i64) -> i64
      %5525 = arith.constant 0 : i64
      %5526 = func.call @cc_box_fixnum(%5525) : (i64) -> i64
      %5527 = func.call @cc_nth(%5526, %5524) : (i64, i64) -> i64
      %5528 = arith.constant 1 : i64
      %5529 = func.call @cc_box_fixnum(%5528) : (i64) -> i64
      %5530 = func.call @cc_nth(%5529, %5524) : (i64, i64) -> i64
      %5531 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5527) : (i64) -> ()
      %5532 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%5530) : (i64) -> ()
      %5533 = func.call @stack_pop_pointer() : () -> i64
      %5534 = func.call @cc_cons(%5533, %5531) : (i64, i64) -> i64
      %5535 = func.call @cc_cons(%5532, %5534) : (i64, i64) -> i64
      %5536 = func.call @cc_and(%5535) : (i64) -> i64
      func.call @stack_push_pointer(%5536) : (i64) -> ()
      %5537 = func.call @stack_pop_pointer() : () -> i64
      %5538 = func.call @cc_nil_value() : () -> i64
      %5539 = func.call @cc_cons(%5537, %5538) : (i64, i64) -> i64
      %5540 = func.call @cc_not(%5539) : (i64) -> i64
      func.call @stack_push_pointer(%5540) : (i64) -> ()
      %5541 = func.call @stack_pop_pointer() : () -> i64
      %5542 = func.call @cc_nil_value() : () -> i64
      %5543 = func.call @cc_cons(%5541, %5542) : (i64, i64) -> i64
      %5544 = func.call @cc_not(%5543) : (i64) -> i64
      func.call @stack_push_pointer(%5544) : (i64) -> ()
      %5545 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5545 : i64
    }
    func.call @stack_push_pointer(%5488) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077400"() {
    %5850 = func.call @cc_nil_value() : () -> i64
    %5851 = func.call @cc_nil_value() : () -> i64
    %5852 = func.call @cc_errorp(%5850) : (i64) -> i64
    %5853 = arith.cmpi ne, %5852, %5851 : i64
    %5854 = scf.if %5853 -> (i64) {
      scf.yield %5850 : i64
    } else {
      %5855 = llvm.mlir.addressof @str585 : !llvm.ptr
      %5856 = arith.constant 13 : i64
      %5857 = func.call @cc_make_string(%5855, %5856) : (!llvm.ptr, i64) -> i64
      %5858 = llvm.mlir.addressof @str586 : !llvm.ptr
      %5859 = arith.constant 11 : i64
      %5860 = func.call @cc_make_string(%5858, %5859) : (!llvm.ptr, i64) -> i64
      %5861 = func.call @cc_intern(%5857, %5860) : (i64, i64) -> i64
      %5862 = func.call @cc_nil_value() : () -> i64
      %5863 = func.call @cc_cons(%5861, %5862) : (i64, i64) -> i64
      %5864 = func.call @cc_values_pack(%5863) : (i64) -> i64
      func.call @stack_push_pointer(%5861) : (i64) -> ()
      %5865 = llvm.mlir.addressof @str587 : !llvm.ptr
      %5866 = arith.constant 13 : i64
      %5867 = func.call @cc_make_string(%5865, %5866) : (!llvm.ptr, i64) -> i64
      %5868 = llvm.mlir.addressof @str588 : !llvm.ptr
      %5869 = arith.constant 11 : i64
      %5870 = func.call @cc_make_string(%5868, %5869) : (!llvm.ptr, i64) -> i64
      %5871 = func.call @cc_intern(%5867, %5870) : (i64, i64) -> i64
      %5872 = func.call @cc_nil_value() : () -> i64
      %5873 = func.call @cc_cons(%5871, %5872) : (i64, i64) -> i64
      %5874 = func.call @cc_values_pack(%5873) : (i64) -> i64
      func.call @stack_push_pointer(%5871) : (i64) -> ()
      %5875 = func.call @stack_pop_pointer() : () -> i64
      %5876 = func.call @cc_nil_value() : () -> i64
      %5877 = func.call @cc_errorp(%5875) : (i64) -> i64
      %5878 = arith.cmpi ne, %5877, %5876 : i64
      %5879 = arith.cmpi eq, %5876, %5876 : i64
      %5880 = arith.andi %5878, %5879 : i1
      %5881 = scf.if %5880 -> (i64) {
        scf.yield %5875 : i64
      } else {
        scf.yield %5876 : i64
      }
      %5882 = arith.cmpi ne, %5881, %5876 : i64
      scf.if %5882 {
        func.call @stack_push_pointer(%5881) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5875) : (i64) -> ()
        %5883 = llvm.mlir.addressof @str589 : !llvm.ptr
        %5884 = func.call @cc_make_function_ref_const(%5883) : (!llvm.ptr) -> i64
        %5885 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5884, %5885) : (i64, i64) -> ()
      }
      %5886 = func.call @stack_pop_pointer() : () -> i64
      %5887 = func.call @stack_pop_pointer() : () -> i64
      %5888 = func.call @cc_subtypep(%5887, %5886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5888) : (i64) -> ()
      %5889 = func.call @stack_pop_pointer() : () -> i64
      %5890 = func.call @cc_multiple_value_list(%5889) : (i64) -> i64
      %5891 = arith.constant 0 : i64
      %5892 = func.call @cc_box_fixnum(%5891) : (i64) -> i64
      %5893 = func.call @cc_nth(%5892, %5890) : (i64, i64) -> i64
      %5894 = arith.constant 1 : i64
      %5895 = func.call @cc_box_fixnum(%5894) : (i64) -> i64
      %5896 = func.call @cc_nth(%5895, %5890) : (i64, i64) -> i64
      %5897 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5893) : (i64) -> ()
      %5898 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%5896) : (i64) -> ()
      %5899 = func.call @stack_pop_pointer() : () -> i64
      %5900 = func.call @cc_cons(%5899, %5897) : (i64, i64) -> i64
      %5901 = func.call @cc_cons(%5898, %5900) : (i64, i64) -> i64
      %5902 = func.call @cc_and(%5901) : (i64) -> i64
      func.call @stack_push_pointer(%5902) : (i64) -> ()
      %5903 = func.call @stack_pop_pointer() : () -> i64
      %5904 = func.call @cc_nil_value() : () -> i64
      %5905 = func.call @cc_cons(%5903, %5904) : (i64, i64) -> i64
      %5906 = func.call @cc_not(%5905) : (i64) -> i64
      func.call @stack_push_pointer(%5906) : (i64) -> ()
      %5907 = func.call @stack_pop_pointer() : () -> i64
      %5908 = func.call @cc_nil_value() : () -> i64
      %5909 = func.call @cc_cons(%5907, %5908) : (i64, i64) -> i64
      %5910 = func.call @cc_not(%5909) : (i64) -> i64
      func.call @stack_push_pointer(%5910) : (i64) -> ()
      %5911 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5911 : i64
    }
    func.call @stack_push_pointer(%5854) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077401"() {
    %6216 = func.call @cc_nil_value() : () -> i64
    %6217 = func.call @cc_nil_value() : () -> i64
    %6218 = func.call @cc_errorp(%6216) : (i64) -> i64
    %6219 = arith.cmpi ne, %6218, %6217 : i64
    %6220 = scf.if %6219 -> (i64) {
      scf.yield %6216 : i64
    } else {
      %6221 = llvm.mlir.addressof @str622 : !llvm.ptr
      %6222 = arith.constant 13 : i64
      %6223 = func.call @cc_make_string(%6221, %6222) : (!llvm.ptr, i64) -> i64
      %6224 = llvm.mlir.addressof @str623 : !llvm.ptr
      %6225 = arith.constant 11 : i64
      %6226 = func.call @cc_make_string(%6224, %6225) : (!llvm.ptr, i64) -> i64
      %6227 = func.call @cc_intern(%6223, %6226) : (i64, i64) -> i64
      %6228 = func.call @cc_nil_value() : () -> i64
      %6229 = func.call @cc_cons(%6227, %6228) : (i64, i64) -> i64
      %6230 = func.call @cc_values_pack(%6229) : (i64) -> i64
      func.call @stack_push_pointer(%6227) : (i64) -> ()
      %6231 = func.call @stack_pop_pointer() : () -> i64
      %6232 = func.call @cc_nil_value() : () -> i64
      %6233 = func.call @cc_errorp(%6231) : (i64) -> i64
      %6234 = arith.cmpi ne, %6233, %6232 : i64
      %6235 = arith.cmpi eq, %6232, %6232 : i64
      %6236 = arith.andi %6234, %6235 : i1
      %6237 = scf.if %6236 -> (i64) {
        scf.yield %6231 : i64
      } else {
        scf.yield %6232 : i64
      }
      %6238 = arith.cmpi ne, %6237, %6232 : i64
      scf.if %6238 {
        func.call @stack_push_pointer(%6237) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6231) : (i64) -> ()
        %6239 = llvm.mlir.addressof @str624 : !llvm.ptr
        %6240 = func.call @cc_make_function_ref_const(%6239) : (!llvm.ptr) -> i64
        %6241 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6240, %6241) : (i64, i64) -> ()
      }
      %6242 = llvm.mlir.addressof @str625 : !llvm.ptr
      %6243 = arith.constant 13 : i64
      %6244 = func.call @cc_make_string(%6242, %6243) : (!llvm.ptr, i64) -> i64
      %6245 = llvm.mlir.addressof @str626 : !llvm.ptr
      %6246 = arith.constant 11 : i64
      %6247 = func.call @cc_make_string(%6245, %6246) : (!llvm.ptr, i64) -> i64
      %6248 = func.call @cc_intern(%6244, %6247) : (i64, i64) -> i64
      %6249 = func.call @cc_nil_value() : () -> i64
      %6250 = func.call @cc_cons(%6248, %6249) : (i64, i64) -> i64
      %6251 = func.call @cc_values_pack(%6250) : (i64) -> i64
      func.call @stack_push_pointer(%6248) : (i64) -> ()
      %6252 = func.call @stack_pop_pointer() : () -> i64
      %6253 = func.call @stack_pop_pointer() : () -> i64
      %6254 = func.call @cc_subtypep(%6253, %6252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6254) : (i64) -> ()
      %6255 = func.call @stack_pop_pointer() : () -> i64
      %6256 = func.call @cc_multiple_value_list(%6255) : (i64) -> i64
      %6257 = arith.constant 0 : i64
      %6258 = func.call @cc_box_fixnum(%6257) : (i64) -> i64
      %6259 = func.call @cc_nth(%6258, %6256) : (i64, i64) -> i64
      %6260 = arith.constant 1 : i64
      %6261 = func.call @cc_box_fixnum(%6260) : (i64) -> i64
      %6262 = func.call @cc_nth(%6261, %6256) : (i64, i64) -> i64
      %6263 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6259) : (i64) -> ()
      %6264 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%6262) : (i64) -> ()
      %6265 = func.call @stack_pop_pointer() : () -> i64
      %6266 = func.call @cc_cons(%6265, %6263) : (i64, i64) -> i64
      %6267 = func.call @cc_cons(%6264, %6266) : (i64, i64) -> i64
      %6268 = func.call @cc_and(%6267) : (i64) -> i64
      func.call @stack_push_pointer(%6268) : (i64) -> ()
      %6269 = func.call @stack_pop_pointer() : () -> i64
      %6270 = func.call @cc_nil_value() : () -> i64
      %6271 = func.call @cc_cons(%6269, %6270) : (i64, i64) -> i64
      %6272 = func.call @cc_not(%6271) : (i64) -> i64
      func.call @stack_push_pointer(%6272) : (i64) -> ()
      %6273 = func.call @stack_pop_pointer() : () -> i64
      %6274 = func.call @cc_nil_value() : () -> i64
      %6275 = func.call @cc_cons(%6273, %6274) : (i64, i64) -> i64
      %6276 = func.call @cc_not(%6275) : (i64) -> i64
      func.call @stack_push_pointer(%6276) : (i64) -> ()
      %6277 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6277 : i64
    }
    func.call @stack_push_pointer(%6220) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077402"() {
    %6582 = func.call @cc_nil_value() : () -> i64
    %6583 = func.call @cc_nil_value() : () -> i64
    %6584 = func.call @cc_errorp(%6582) : (i64) -> i64
    %6585 = arith.cmpi ne, %6584, %6583 : i64
    %6586 = scf.if %6585 -> (i64) {
      scf.yield %6582 : i64
    } else {
      %6587 = llvm.mlir.addressof @str659 : !llvm.ptr
      %6588 = arith.constant 18 : i64
      %6589 = func.call @cc_make_string(%6587, %6588) : (!llvm.ptr, i64) -> i64
      %6590 = llvm.mlir.addressof @str660 : !llvm.ptr
      %6591 = arith.constant 11 : i64
      %6592 = func.call @cc_make_string(%6590, %6591) : (!llvm.ptr, i64) -> i64
      %6593 = func.call @cc_intern(%6589, %6592) : (i64, i64) -> i64
      %6594 = func.call @cc_nil_value() : () -> i64
      %6595 = func.call @cc_cons(%6593, %6594) : (i64, i64) -> i64
      %6596 = func.call @cc_values_pack(%6595) : (i64) -> i64
      func.call @stack_push_pointer(%6593) : (i64) -> ()
      %6597 = llvm.mlir.addressof @str661 : !llvm.ptr
      %6598 = arith.constant 18 : i64
      %6599 = func.call @cc_make_string(%6597, %6598) : (!llvm.ptr, i64) -> i64
      %6600 = llvm.mlir.addressof @str662 : !llvm.ptr
      %6601 = arith.constant 11 : i64
      %6602 = func.call @cc_make_string(%6600, %6601) : (!llvm.ptr, i64) -> i64
      %6603 = func.call @cc_intern(%6599, %6602) : (i64, i64) -> i64
      %6604 = func.call @cc_nil_value() : () -> i64
      %6605 = func.call @cc_cons(%6603, %6604) : (i64, i64) -> i64
      %6606 = func.call @cc_values_pack(%6605) : (i64) -> i64
      func.call @stack_push_pointer(%6603) : (i64) -> ()
      %6607 = func.call @stack_pop_pointer() : () -> i64
      %6608 = func.call @cc_nil_value() : () -> i64
      %6609 = func.call @cc_errorp(%6607) : (i64) -> i64
      %6610 = arith.cmpi ne, %6609, %6608 : i64
      %6611 = arith.cmpi eq, %6608, %6608 : i64
      %6612 = arith.andi %6610, %6611 : i1
      %6613 = scf.if %6612 -> (i64) {
        scf.yield %6607 : i64
      } else {
        scf.yield %6608 : i64
      }
      %6614 = arith.cmpi ne, %6613, %6608 : i64
      scf.if %6614 {
        func.call @stack_push_pointer(%6613) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6607) : (i64) -> ()
        %6615 = llvm.mlir.addressof @str663 : !llvm.ptr
        %6616 = func.call @cc_make_function_ref_const(%6615) : (!llvm.ptr) -> i64
        %6617 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6616, %6617) : (i64, i64) -> ()
      }
      %6618 = func.call @stack_pop_pointer() : () -> i64
      %6619 = func.call @stack_pop_pointer() : () -> i64
      %6620 = func.call @cc_subtypep(%6619, %6618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6620) : (i64) -> ()
      %6621 = func.call @stack_pop_pointer() : () -> i64
      %6622 = func.call @cc_multiple_value_list(%6621) : (i64) -> i64
      %6623 = arith.constant 0 : i64
      %6624 = func.call @cc_box_fixnum(%6623) : (i64) -> i64
      %6625 = func.call @cc_nth(%6624, %6622) : (i64, i64) -> i64
      %6626 = arith.constant 1 : i64
      %6627 = func.call @cc_box_fixnum(%6626) : (i64) -> i64
      %6628 = func.call @cc_nth(%6627, %6622) : (i64, i64) -> i64
      %6629 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6625) : (i64) -> ()
      %6630 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%6628) : (i64) -> ()
      %6631 = func.call @stack_pop_pointer() : () -> i64
      %6632 = func.call @cc_cons(%6631, %6629) : (i64, i64) -> i64
      %6633 = func.call @cc_cons(%6630, %6632) : (i64, i64) -> i64
      %6634 = func.call @cc_and(%6633) : (i64) -> i64
      func.call @stack_push_pointer(%6634) : (i64) -> ()
      %6635 = func.call @stack_pop_pointer() : () -> i64
      %6636 = func.call @cc_nil_value() : () -> i64
      %6637 = func.call @cc_cons(%6635, %6636) : (i64, i64) -> i64
      %6638 = func.call @cc_not(%6637) : (i64) -> i64
      func.call @stack_push_pointer(%6638) : (i64) -> ()
      %6639 = func.call @stack_pop_pointer() : () -> i64
      %6640 = func.call @cc_nil_value() : () -> i64
      %6641 = func.call @cc_cons(%6639, %6640) : (i64, i64) -> i64
      %6642 = func.call @cc_not(%6641) : (i64) -> i64
      func.call @stack_push_pointer(%6642) : (i64) -> ()
      %6643 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6643 : i64
    }
    func.call @stack_push_pointer(%6586) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077403"() {
    %6948 = func.call @cc_nil_value() : () -> i64
    %6949 = func.call @cc_nil_value() : () -> i64
    %6950 = func.call @cc_errorp(%6948) : (i64) -> i64
    %6951 = arith.cmpi ne, %6950, %6949 : i64
    %6952 = scf.if %6951 -> (i64) {
      scf.yield %6948 : i64
    } else {
      %6953 = llvm.mlir.addressof @str696 : !llvm.ptr
      %6954 = arith.constant 18 : i64
      %6955 = func.call @cc_make_string(%6953, %6954) : (!llvm.ptr, i64) -> i64
      %6956 = llvm.mlir.addressof @str697 : !llvm.ptr
      %6957 = arith.constant 11 : i64
      %6958 = func.call @cc_make_string(%6956, %6957) : (!llvm.ptr, i64) -> i64
      %6959 = func.call @cc_intern(%6955, %6958) : (i64, i64) -> i64
      %6960 = func.call @cc_nil_value() : () -> i64
      %6961 = func.call @cc_cons(%6959, %6960) : (i64, i64) -> i64
      %6962 = func.call @cc_values_pack(%6961) : (i64) -> i64
      func.call @stack_push_pointer(%6959) : (i64) -> ()
      %6963 = func.call @stack_pop_pointer() : () -> i64
      %6964 = func.call @cc_nil_value() : () -> i64
      %6965 = func.call @cc_errorp(%6963) : (i64) -> i64
      %6966 = arith.cmpi ne, %6965, %6964 : i64
      %6967 = arith.cmpi eq, %6964, %6964 : i64
      %6968 = arith.andi %6966, %6967 : i1
      %6969 = scf.if %6968 -> (i64) {
        scf.yield %6963 : i64
      } else {
        scf.yield %6964 : i64
      }
      %6970 = arith.cmpi ne, %6969, %6964 : i64
      scf.if %6970 {
        func.call @stack_push_pointer(%6969) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6963) : (i64) -> ()
        %6971 = llvm.mlir.addressof @str698 : !llvm.ptr
        %6972 = func.call @cc_make_function_ref_const(%6971) : (!llvm.ptr) -> i64
        %6973 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6972, %6973) : (i64, i64) -> ()
      }
      %6974 = llvm.mlir.addressof @str699 : !llvm.ptr
      %6975 = arith.constant 18 : i64
      %6976 = func.call @cc_make_string(%6974, %6975) : (!llvm.ptr, i64) -> i64
      %6977 = llvm.mlir.addressof @str700 : !llvm.ptr
      %6978 = arith.constant 11 : i64
      %6979 = func.call @cc_make_string(%6977, %6978) : (!llvm.ptr, i64) -> i64
      %6980 = func.call @cc_intern(%6976, %6979) : (i64, i64) -> i64
      %6981 = func.call @cc_nil_value() : () -> i64
      %6982 = func.call @cc_cons(%6980, %6981) : (i64, i64) -> i64
      %6983 = func.call @cc_values_pack(%6982) : (i64) -> i64
      func.call @stack_push_pointer(%6980) : (i64) -> ()
      %6984 = func.call @stack_pop_pointer() : () -> i64
      %6985 = func.call @stack_pop_pointer() : () -> i64
      %6986 = func.call @cc_subtypep(%6985, %6984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6986) : (i64) -> ()
      %6987 = func.call @stack_pop_pointer() : () -> i64
      %6988 = func.call @cc_multiple_value_list(%6987) : (i64) -> i64
      %6989 = arith.constant 0 : i64
      %6990 = func.call @cc_box_fixnum(%6989) : (i64) -> i64
      %6991 = func.call @cc_nth(%6990, %6988) : (i64, i64) -> i64
      %6992 = arith.constant 1 : i64
      %6993 = func.call @cc_box_fixnum(%6992) : (i64) -> i64
      %6994 = func.call @cc_nth(%6993, %6988) : (i64, i64) -> i64
      %6995 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6991) : (i64) -> ()
      %6996 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%6994) : (i64) -> ()
      %6997 = func.call @stack_pop_pointer() : () -> i64
      %6998 = func.call @cc_cons(%6997, %6995) : (i64, i64) -> i64
      %6999 = func.call @cc_cons(%6996, %6998) : (i64, i64) -> i64
      %7000 = func.call @cc_and(%6999) : (i64) -> i64
      func.call @stack_push_pointer(%7000) : (i64) -> ()
      %7001 = func.call @stack_pop_pointer() : () -> i64
      %7002 = func.call @cc_nil_value() : () -> i64
      %7003 = func.call @cc_cons(%7001, %7002) : (i64, i64) -> i64
      %7004 = func.call @cc_not(%7003) : (i64) -> i64
      func.call @stack_push_pointer(%7004) : (i64) -> ()
      %7005 = func.call @stack_pop_pointer() : () -> i64
      %7006 = func.call @cc_nil_value() : () -> i64
      %7007 = func.call @cc_cons(%7005, %7006) : (i64, i64) -> i64
      %7008 = func.call @cc_not(%7007) : (i64) -> i64
      func.call @stack_push_pointer(%7008) : (i64) -> ()
      %7009 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7009 : i64
    }
    func.call @stack_push_pointer(%6952) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077404"() {
    %7314 = func.call @cc_nil_value() : () -> i64
    %7315 = func.call @cc_nil_value() : () -> i64
    %7316 = func.call @cc_errorp(%7314) : (i64) -> i64
    %7317 = arith.cmpi ne, %7316, %7315 : i64
    %7318 = scf.if %7317 -> (i64) {
      scf.yield %7314 : i64
    } else {
      %7319 = llvm.mlir.addressof @str733 : !llvm.ptr
      %7320 = arith.constant 10 : i64
      %7321 = func.call @cc_make_string(%7319, %7320) : (!llvm.ptr, i64) -> i64
      %7322 = llvm.mlir.addressof @str734 : !llvm.ptr
      %7323 = arith.constant 11 : i64
      %7324 = func.call @cc_make_string(%7322, %7323) : (!llvm.ptr, i64) -> i64
      %7325 = func.call @cc_intern(%7321, %7324) : (i64, i64) -> i64
      %7326 = func.call @cc_nil_value() : () -> i64
      %7327 = func.call @cc_cons(%7325, %7326) : (i64, i64) -> i64
      %7328 = func.call @cc_values_pack(%7327) : (i64) -> i64
      func.call @stack_push_pointer(%7325) : (i64) -> ()
      %7329 = llvm.mlir.addressof @str735 : !llvm.ptr
      %7330 = arith.constant 10 : i64
      %7331 = func.call @cc_make_string(%7329, %7330) : (!llvm.ptr, i64) -> i64
      %7332 = llvm.mlir.addressof @str736 : !llvm.ptr
      %7333 = arith.constant 11 : i64
      %7334 = func.call @cc_make_string(%7332, %7333) : (!llvm.ptr, i64) -> i64
      %7335 = func.call @cc_intern(%7331, %7334) : (i64, i64) -> i64
      %7336 = func.call @cc_nil_value() : () -> i64
      %7337 = func.call @cc_cons(%7335, %7336) : (i64, i64) -> i64
      %7338 = func.call @cc_values_pack(%7337) : (i64) -> i64
      func.call @stack_push_pointer(%7335) : (i64) -> ()
      %7339 = func.call @stack_pop_pointer() : () -> i64
      %7340 = func.call @cc_nil_value() : () -> i64
      %7341 = func.call @cc_errorp(%7339) : (i64) -> i64
      %7342 = arith.cmpi ne, %7341, %7340 : i64
      %7343 = arith.cmpi eq, %7340, %7340 : i64
      %7344 = arith.andi %7342, %7343 : i1
      %7345 = scf.if %7344 -> (i64) {
        scf.yield %7339 : i64
      } else {
        scf.yield %7340 : i64
      }
      %7346 = arith.cmpi ne, %7345, %7340 : i64
      scf.if %7346 {
        func.call @stack_push_pointer(%7345) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7339) : (i64) -> ()
        %7347 = llvm.mlir.addressof @str737 : !llvm.ptr
        %7348 = func.call @cc_make_function_ref_const(%7347) : (!llvm.ptr) -> i64
        %7349 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%7348, %7349) : (i64, i64) -> ()
      }
      %7350 = func.call @stack_pop_pointer() : () -> i64
      %7351 = func.call @stack_pop_pointer() : () -> i64
      %7352 = func.call @cc_subtypep(%7351, %7350) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7352) : (i64) -> ()
      %7353 = func.call @stack_pop_pointer() : () -> i64
      %7354 = func.call @cc_multiple_value_list(%7353) : (i64) -> i64
      %7355 = arith.constant 0 : i64
      %7356 = func.call @cc_box_fixnum(%7355) : (i64) -> i64
      %7357 = func.call @cc_nth(%7356, %7354) : (i64, i64) -> i64
      %7358 = arith.constant 1 : i64
      %7359 = func.call @cc_box_fixnum(%7358) : (i64) -> i64
      %7360 = func.call @cc_nth(%7359, %7354) : (i64, i64) -> i64
      %7361 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7357) : (i64) -> ()
      %7362 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%7360) : (i64) -> ()
      %7363 = func.call @stack_pop_pointer() : () -> i64
      %7364 = func.call @cc_cons(%7363, %7361) : (i64, i64) -> i64
      %7365 = func.call @cc_cons(%7362, %7364) : (i64, i64) -> i64
      %7366 = func.call @cc_and(%7365) : (i64) -> i64
      func.call @stack_push_pointer(%7366) : (i64) -> ()
      %7367 = func.call @stack_pop_pointer() : () -> i64
      %7368 = func.call @cc_nil_value() : () -> i64
      %7369 = func.call @cc_cons(%7367, %7368) : (i64, i64) -> i64
      %7370 = func.call @cc_not(%7369) : (i64) -> i64
      func.call @stack_push_pointer(%7370) : (i64) -> ()
      %7371 = func.call @stack_pop_pointer() : () -> i64
      %7372 = func.call @cc_nil_value() : () -> i64
      %7373 = func.call @cc_cons(%7371, %7372) : (i64, i64) -> i64
      %7374 = func.call @cc_not(%7373) : (i64) -> i64
      func.call @stack_push_pointer(%7374) : (i64) -> ()
      %7375 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7375 : i64
    }
    func.call @stack_push_pointer(%7318) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077405"() {
    %7680 = func.call @cc_nil_value() : () -> i64
    %7681 = func.call @cc_nil_value() : () -> i64
    %7682 = func.call @cc_errorp(%7680) : (i64) -> i64
    %7683 = arith.cmpi ne, %7682, %7681 : i64
    %7684 = scf.if %7683 -> (i64) {
      scf.yield %7680 : i64
    } else {
      %7685 = llvm.mlir.addressof @str770 : !llvm.ptr
      %7686 = arith.constant 10 : i64
      %7687 = func.call @cc_make_string(%7685, %7686) : (!llvm.ptr, i64) -> i64
      %7688 = llvm.mlir.addressof @str771 : !llvm.ptr
      %7689 = arith.constant 11 : i64
      %7690 = func.call @cc_make_string(%7688, %7689) : (!llvm.ptr, i64) -> i64
      %7691 = func.call @cc_intern(%7687, %7690) : (i64, i64) -> i64
      %7692 = func.call @cc_nil_value() : () -> i64
      %7693 = func.call @cc_cons(%7691, %7692) : (i64, i64) -> i64
      %7694 = func.call @cc_values_pack(%7693) : (i64) -> i64
      func.call @stack_push_pointer(%7691) : (i64) -> ()
      %7695 = func.call @stack_pop_pointer() : () -> i64
      %7696 = func.call @cc_nil_value() : () -> i64
      %7697 = func.call @cc_errorp(%7695) : (i64) -> i64
      %7698 = arith.cmpi ne, %7697, %7696 : i64
      %7699 = arith.cmpi eq, %7696, %7696 : i64
      %7700 = arith.andi %7698, %7699 : i1
      %7701 = scf.if %7700 -> (i64) {
        scf.yield %7695 : i64
      } else {
        scf.yield %7696 : i64
      }
      %7702 = arith.cmpi ne, %7701, %7696 : i64
      scf.if %7702 {
        func.call @stack_push_pointer(%7701) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7695) : (i64) -> ()
        %7703 = llvm.mlir.addressof @str772 : !llvm.ptr
        %7704 = func.call @cc_make_function_ref_const(%7703) : (!llvm.ptr) -> i64
        %7705 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%7704, %7705) : (i64, i64) -> ()
      }
      %7706 = llvm.mlir.addressof @str773 : !llvm.ptr
      %7707 = arith.constant 10 : i64
      %7708 = func.call @cc_make_string(%7706, %7707) : (!llvm.ptr, i64) -> i64
      %7709 = llvm.mlir.addressof @str774 : !llvm.ptr
      %7710 = arith.constant 11 : i64
      %7711 = func.call @cc_make_string(%7709, %7710) : (!llvm.ptr, i64) -> i64
      %7712 = func.call @cc_intern(%7708, %7711) : (i64, i64) -> i64
      %7713 = func.call @cc_nil_value() : () -> i64
      %7714 = func.call @cc_cons(%7712, %7713) : (i64, i64) -> i64
      %7715 = func.call @cc_values_pack(%7714) : (i64) -> i64
      func.call @stack_push_pointer(%7712) : (i64) -> ()
      %7716 = func.call @stack_pop_pointer() : () -> i64
      %7717 = func.call @stack_pop_pointer() : () -> i64
      %7718 = func.call @cc_subtypep(%7717, %7716) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7718) : (i64) -> ()
      %7719 = func.call @stack_pop_pointer() : () -> i64
      %7720 = func.call @cc_multiple_value_list(%7719) : (i64) -> i64
      %7721 = arith.constant 0 : i64
      %7722 = func.call @cc_box_fixnum(%7721) : (i64) -> i64
      %7723 = func.call @cc_nth(%7722, %7720) : (i64, i64) -> i64
      %7724 = arith.constant 1 : i64
      %7725 = func.call @cc_box_fixnum(%7724) : (i64) -> i64
      %7726 = func.call @cc_nth(%7725, %7720) : (i64, i64) -> i64
      %7727 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7723) : (i64) -> ()
      %7728 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%7726) : (i64) -> ()
      %7729 = func.call @stack_pop_pointer() : () -> i64
      %7730 = func.call @cc_cons(%7729, %7727) : (i64, i64) -> i64
      %7731 = func.call @cc_cons(%7728, %7730) : (i64, i64) -> i64
      %7732 = func.call @cc_and(%7731) : (i64) -> i64
      func.call @stack_push_pointer(%7732) : (i64) -> ()
      %7733 = func.call @stack_pop_pointer() : () -> i64
      %7734 = func.call @cc_nil_value() : () -> i64
      %7735 = func.call @cc_cons(%7733, %7734) : (i64, i64) -> i64
      %7736 = func.call @cc_not(%7735) : (i64) -> i64
      func.call @stack_push_pointer(%7736) : (i64) -> ()
      %7737 = func.call @stack_pop_pointer() : () -> i64
      %7738 = func.call @cc_nil_value() : () -> i64
      %7739 = func.call @cc_cons(%7737, %7738) : (i64, i64) -> i64
      %7740 = func.call @cc_not(%7739) : (i64) -> i64
      func.call @stack_push_pointer(%7740) : (i64) -> ()
      %7741 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7741 : i64
    }
    func.call @stack_push_pointer(%7684) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077406"() {
    %7979 = func.call @cc_nil_value() : () -> i64
    %7980 = func.call @cc_nil_value() : () -> i64
    %7981 = func.call @cc_errorp(%7979) : (i64) -> i64
    %7982 = arith.cmpi ne, %7981, %7980 : i64
    %7983 = scf.if %7982 -> (i64) {
      scf.yield %7979 : i64
    } else {
      %7984 = llvm.mlir.addressof @str798 : !llvm.ptr
      %7985 = arith.constant 1 : i64
      %7986 = func.call @cc_make_string(%7984, %7985) : (!llvm.ptr, i64) -> i64
      %7987 = func.call @cc_nil_value() : () -> i64
      %7988 = func.call @cc_intern(%7986, %7987) : (i64, i64) -> i64
      %7989 = func.call @cc_nil_value() : () -> i64
      %7990 = func.call @cc_cons(%7988, %7989) : (i64, i64) -> i64
      %7991 = func.call @cc_values_pack(%7990) : (i64) -> i64
      func.call @stack_push_pointer(%7988) : (i64) -> ()
      %7992 = llvm.mlir.addressof @str799 : !llvm.ptr
      %7993 = arith.constant 4 : i64
      %7994 = func.call @cc_make_string(%7992, %7993) : (!llvm.ptr, i64) -> i64
      %7995 = llvm.mlir.addressof @str800 : !llvm.ptr
      %7996 = arith.constant 11 : i64
      %7997 = func.call @cc_make_string(%7995, %7996) : (!llvm.ptr, i64) -> i64
      %7998 = func.call @cc_intern(%7994, %7997) : (i64, i64) -> i64
      %7999 = func.call @cc_nil_value() : () -> i64
      %8000 = func.call @cc_cons(%7998, %7999) : (i64, i64) -> i64
      %8001 = func.call @cc_values_pack(%8000) : (i64) -> i64
      func.call @stack_push_pointer(%7998) : (i64) -> ()
      %8002 = llvm.mlir.addressof @str801 : !llvm.ptr
      %8003 = arith.constant 3 : i64
      %8004 = func.call @cc_make_string(%8002, %8003) : (!llvm.ptr, i64) -> i64
      %8005 = llvm.mlir.addressof @str802 : !llvm.ptr
      %8006 = arith.constant 11 : i64
      %8007 = func.call @cc_make_string(%8005, %8006) : (!llvm.ptr, i64) -> i64
      %8008 = func.call @cc_intern(%8004, %8007) : (i64, i64) -> i64
      %8009 = func.call @cc_nil_value() : () -> i64
      %8010 = func.call @cc_cons(%8008, %8009) : (i64, i64) -> i64
      %8011 = func.call @cc_values_pack(%8010) : (i64) -> i64
      func.call @stack_push_pointer(%8008) : (i64) -> ()
      %8012 = llvm.mlir.addressof @str803 : !llvm.ptr
      %8013 = arith.constant 13 : i64
      %8014 = func.call @cc_make_string(%8012, %8013) : (!llvm.ptr, i64) -> i64
      %8015 = llvm.mlir.addressof @str804 : !llvm.ptr
      %8016 = arith.constant 11 : i64
      %8017 = func.call @cc_make_string(%8015, %8016) : (!llvm.ptr, i64) -> i64
      %8018 = func.call @cc_intern(%8014, %8017) : (i64, i64) -> i64
      %8019 = func.call @cc_nil_value() : () -> i64
      %8020 = func.call @cc_cons(%8018, %8019) : (i64, i64) -> i64
      %8021 = func.call @cc_values_pack(%8020) : (i64) -> i64
      func.call @stack_push_pointer(%8018) : (i64) -> ()
      %8022 = llvm.mlir.addressof @str805 : !llvm.ptr
      %8023 = arith.constant 6 : i64
      %8024 = func.call @cc_make_string(%8022, %8023) : (!llvm.ptr, i64) -> i64
      %8025 = llvm.mlir.addressof @str806 : !llvm.ptr
      %8026 = arith.constant 11 : i64
      %8027 = func.call @cc_make_string(%8025, %8026) : (!llvm.ptr, i64) -> i64
      %8028 = func.call @cc_intern(%8024, %8027) : (i64, i64) -> i64
      %8029 = func.call @cc_nil_value() : () -> i64
      %8030 = func.call @cc_cons(%8028, %8029) : (i64, i64) -> i64
      %8031 = func.call @cc_values_pack(%8030) : (i64) -> i64
      func.call @stack_push_pointer(%8028) : (i64) -> ()
      %8032 = arith.constant 64 : i64
      %8033 = func.call @cc_box_character(%8032) : (i64) -> i64
      func.call @stack_push_pointer(%8033) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8034 = func.call @stack_pop_pointer() : () -> i64
      %8035 = func.call @stack_pop_pointer() : () -> i64
      %8036 = func.call @cc_cons(%8035, %8034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8036) : (i64) -> ()
      %8037 = func.call @stack_pop_pointer() : () -> i64
      %8038 = func.call @stack_pop_pointer() : () -> i64
      %8039 = func.call @cc_cons(%8038, %8037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8039) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8040 = func.call @stack_pop_pointer() : () -> i64
      %8041 = func.call @stack_pop_pointer() : () -> i64
      %8042 = func.call @cc_cons(%8041, %8040) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8042) : (i64) -> ()
      %8043 = func.call @stack_pop_pointer() : () -> i64
      %8044 = func.call @stack_pop_pointer() : () -> i64
      %8045 = func.call @cc_cons(%8044, %8043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8045) : (i64) -> ()
      %8046 = func.call @stack_pop_pointer() : () -> i64
      %8047 = func.call @stack_pop_pointer() : () -> i64
      %8048 = func.call @cc_cons(%8047, %8046) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8048) : (i64) -> ()
      %8049 = llvm.mlir.addressof @str807 : !llvm.ptr
      %8050 = arith.constant 4 : i64
      %8051 = func.call @cc_make_string(%8049, %8050) : (!llvm.ptr, i64) -> i64
      %8052 = llvm.mlir.addressof @str808 : !llvm.ptr
      %8053 = arith.constant 11 : i64
      %8054 = func.call @cc_make_string(%8052, %8053) : (!llvm.ptr, i64) -> i64
      %8055 = func.call @cc_intern(%8051, %8054) : (i64, i64) -> i64
      %8056 = func.call @cc_nil_value() : () -> i64
      %8057 = func.call @cc_cons(%8055, %8056) : (i64, i64) -> i64
      %8058 = func.call @cc_values_pack(%8057) : (i64) -> i64
      func.call @stack_push_pointer(%8055) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8059 = func.call @stack_pop_pointer() : () -> i64
      %8060 = func.call @stack_pop_pointer() : () -> i64
      %8061 = func.call @cc_cons(%8060, %8059) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8061) : (i64) -> ()
      %8062 = func.call @stack_pop_pointer() : () -> i64
      %8063 = func.call @stack_pop_pointer() : () -> i64
      %8064 = func.call @cc_cons(%8063, %8062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8064) : (i64) -> ()
      %8065 = func.call @stack_pop_pointer() : () -> i64
      %8066 = func.call @stack_pop_pointer() : () -> i64
      %8067 = func.call @cc_cons(%8066, %8065) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8067) : (i64) -> ()
      %8068 = func.call @stack_pop_pointer() : () -> i64
      %8069 = func.call @stack_pop_pointer() : () -> i64
      %8070 = func.call @cc_subtypep(%8069, %8068) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8070) : (i64) -> ()
      %8071 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8071 : i64
    }
    func.call @stack_push_pointer(%7983) : (i64) -> ()
    func.return
  }
  func.func @"%FN%make-%semaphore"() {
    %8170 = llvm.mlir.addressof @str815 : !llvm.ptr
    %8171 = arith.constant 15 : i64
    %8172 = func.call @cc_make_string(%8170, %8171) : (!llvm.ptr, i64) -> i64
    %8173 = func.call @cc_nil_value() : () -> i64
    %8174 = func.call @cc_intern(%8172, %8173) : (i64, i64) -> i64
    %8175 = func.call @cc_nil_value() : () -> i64
    %8176 = func.call @cc_cons(%8174, %8175) : (i64, i64) -> i64
    %8177 = func.call @cc_values_pack(%8176) : (i64) -> i64
    %8178 = llvm.mlir.addressof @str816 : !llvm.ptr
    %8179 = arith.constant 31 : i64
    %8180 = func.call @cc_make_string(%8178, %8179) : (!llvm.ptr, i64) -> i64
    %8181 = func.call @cc_register_function_lambda_list_metadata_raw(%8174, %8180) : (i64, i64) -> i64
    %8182 = arith.constant 3 : i64
    func.call @cc_runtime_debug_stack_push_call(%8174, %8182) : (i64, i64) -> ()
    %8183 = func.call @stack_pop_pointer() : () -> i64
    %8184 = llvm.mlir.addressof @str817 : !llvm.ptr
    %8185 = arith.constant 4 : i64
    %8186 = func.call @cc_make_string(%8184, %8185) : (!llvm.ptr, i64) -> i64
    %8187 = func.call @cc_nil_value() : () -> i64
    %8188 = func.call @cc_intern(%8186, %8187) : (i64, i64) -> i64
    %8189 = func.call @cc_nil_value() : () -> i64
    %8190 = func.call @cc_cons(%8188, %8189) : (i64, i64) -> i64
    %8191 = func.call @cc_values_pack(%8190) : (i64) -> i64
    %8192 = func.call @cc_arg(%8183, %8188) : (i64, i64) -> i64
    %8193 = func.call @cc_arg_present(%8183, %8188) : (i64, i64) -> i64
    %8194 = func.call @cc_nil_value() : () -> i64
    %8195 = arith.cmpi ne, %8193, %8194 : i64
    %8196 = scf.if %8195 -> (i64) {
      scf.yield %8192 : i64
    } else {
      scf.yield %8194 : i64
    }
    %8197 = llvm.mlir.addressof @str818 : !llvm.ptr
    %8198 = arith.constant 18 : i64
    %8199 = func.call @cc_make_string(%8197, %8198) : (!llvm.ptr, i64) -> i64
    %8200 = func.call @cc_nil_value() : () -> i64
    %8201 = func.call @cc_intern(%8199, %8200) : (i64, i64) -> i64
    %8202 = func.call @cc_nil_value() : () -> i64
    %8203 = func.call @cc_cons(%8201, %8202) : (i64, i64) -> i64
    %8204 = func.call @cc_values_pack(%8203) : (i64) -> i64
    %8205 = func.call @cc_arg(%8183, %8201) : (i64, i64) -> i64
    %8206 = func.call @cc_arg_present(%8183, %8201) : (i64, i64) -> i64
    %8207 = func.call @cc_nil_value() : () -> i64
    %8208 = arith.cmpi ne, %8206, %8207 : i64
    %8209 = scf.if %8208 -> (i64) {
      scf.yield %8205 : i64
    } else {
      scf.yield %8207 : i64
    }
    %8210 = llvm.mlir.addressof @str819 : !llvm.ptr
    %8211 = arith.constant 7 : i64
    %8212 = func.call @cc_make_string(%8210, %8211) : (!llvm.ptr, i64) -> i64
    %8213 = func.call @cc_nil_value() : () -> i64
    %8214 = func.call @cc_intern(%8212, %8213) : (i64, i64) -> i64
    %8215 = func.call @cc_nil_value() : () -> i64
    %8216 = func.call @cc_cons(%8214, %8215) : (i64, i64) -> i64
    %8217 = func.call @cc_values_pack(%8216) : (i64) -> i64
    %8218 = func.call @cc_arg(%8183, %8214) : (i64, i64) -> i64
    %8219 = func.call @cc_arg_present(%8183, %8214) : (i64, i64) -> i64
    %8220 = func.call @cc_nil_value() : () -> i64
    %8221 = arith.cmpi ne, %8219, %8220 : i64
    %8222 = scf.if %8221 -> (i64) {
      scf.yield %8218 : i64
    } else {
      scf.yield %8220 : i64
    }
    %8223 = func.call @cc_nil_value() : () -> i64
    %8224 = llvm.mlir.addressof @str820 : !llvm.ptr
    %8225 = arith.constant 38 : i64
    %8226 = func.call @cc_make_string(%8224, %8225) : (!llvm.ptr, i64) -> i64
    %8227 = func.call @cc_nil_value() : () -> i64
    %8228 = func.call @cc_intern(%8226, %8227) : (i64, i64) -> i64
    %8229 = func.call @cc_nil_value() : () -> i64
    %8230 = func.call @cc_cons(%8228, %8229) : (i64, i64) -> i64
    %8231 = func.call @cc_values_pack(%8230) : (i64) -> i64
    %8232 = func.call @cc_set_symbol_value(%8228, %8223) : (i64, i64) -> i64
    %8233 = llvm.mlir.addressof @str821 : !llvm.ptr
    %8234 = arith.constant 39 : i64
    %8235 = func.call @cc_make_string(%8233, %8234) : (!llvm.ptr, i64) -> i64
    %8236 = func.call @cc_nil_value() : () -> i64
    %8237 = func.call @cc_intern(%8235, %8236) : (i64, i64) -> i64
    %8238 = func.call @cc_nil_value() : () -> i64
    %8239 = func.call @cc_cons(%8237, %8238) : (i64, i64) -> i64
    %8240 = func.call @cc_values_pack(%8239) : (i64) -> i64
    %8241 = func.call @cc_set_symbol_value(%8237, %8223) : (i64, i64) -> i64
    %8242 = llvm.mlir.addressof @str822 : !llvm.ptr
    %8243 = arith.constant 40 : i64
    %8244 = func.call @cc_make_string(%8242, %8243) : (!llvm.ptr, i64) -> i64
    %8245 = func.call @cc_nil_value() : () -> i64
    %8246 = func.call @cc_intern(%8244, %8245) : (i64, i64) -> i64
    %8247 = func.call @cc_nil_value() : () -> i64
    %8248 = func.call @cc_cons(%8246, %8247) : (i64, i64) -> i64
    %8249 = func.call @cc_values_pack(%8248) : (i64) -> i64
    %8250 = func.call @cc_set_symbol_value(%8246, %8223) : (i64, i64) -> i64
    %8251 = func.call @cc_nil_value() : () -> i64
    %8252 = func.call @cc_nil_value() : () -> i64
    %8253 = func.call @cc_errorp(%8251) : (i64) -> i64
    %8254 = arith.cmpi ne, %8253, %8252 : i64
    %8255 = scf.if %8254 -> (i64) {
      scf.yield %8251 : i64
    } else {
      %8256 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8256) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %8257 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%8257) : (i64) -> ()
      %8258 = func.call @stack_pop_pointer() : () -> i64
      %8259 = llvm.mlir.addressof @str823 : !llvm.ptr
      %8260 = arith.constant 3 : i64
      %8261 = func.call @cc_make_string(%8259, %8260) : (!llvm.ptr, i64) -> i64
      %8262 = func.call @cc_nil_value() : () -> i64
      %8263 = func.call @cc_intern(%8261, %8262) : (i64, i64) -> i64
      %8264 = func.call @cc_nil_value() : () -> i64
      %8265 = func.call @cc_cons(%8263, %8264) : (i64, i64) -> i64
      %8266 = func.call @cc_values_pack(%8265) : (i64) -> i64
      %8267 = func.call @cc_set_symbol_value(%8263, %8258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8258) : (i64) -> ()
      %8268 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8268 : i64
    }
    %8269 = func.call @cc_nil_value() : () -> i64
    %8270 = func.call @cc_errorp(%8255) : (i64) -> i64
    %8271 = arith.cmpi ne, %8270, %8269 : i64
    %8272 = scf.if %8271 -> (i64) {
      scf.yield %8255 : i64
    } else {
      %8273 = llvm.mlir.addressof @str824 : !llvm.ptr
      %8274 = arith.constant 3 : i64
      %8275 = func.call @cc_make_string(%8273, %8274) : (!llvm.ptr, i64) -> i64
      %8276 = func.call @cc_nil_value() : () -> i64
      %8277 = func.call @cc_intern(%8275, %8276) : (i64, i64) -> i64
      %8278 = func.call @cc_nil_value() : () -> i64
      %8279 = func.call @cc_cons(%8277, %8278) : (i64, i64) -> i64
      %8280 = func.call @cc_values_pack(%8279) : (i64) -> i64
      %8281 = func.call @cc_symbol_value(%8277) : (i64) -> i64
      func.call @stack_push_pointer(%8281) : (i64) -> ()
      %8282 = func.call @stack_pop_pointer() : () -> i64
      %8283 = llvm.mlir.addressof @str825 : !llvm.ptr
      %8284 = arith.constant 10 : i64
      %8285 = func.call @cc_make_string(%8283, %8284) : (!llvm.ptr, i64) -> i64
      %8286 = func.call @cc_nil_value() : () -> i64
      %8287 = func.call @cc_intern(%8285, %8286) : (i64, i64) -> i64
      %8288 = func.call @cc_nil_value() : () -> i64
      %8289 = func.call @cc_cons(%8287, %8288) : (i64, i64) -> i64
      %8290 = func.call @cc_values_pack(%8289) : (i64) -> i64
      func.call @stack_push_pointer(%8287) : (i64) -> ()
      %8291 = func.call @stack_pop_pointer() : () -> i64
      %8292 = llvm.mlir.addressof @str826 : !llvm.ptr
      %8293 = arith.constant 16 : i64
      %8294 = func.call @cc_make_string(%8292, %8293) : (!llvm.ptr, i64) -> i64
      %8295 = func.call @cc_nil_value() : () -> i64
      %8296 = func.call @cc_intern(%8294, %8295) : (i64, i64) -> i64
      %8297 = func.call @cc_nil_value() : () -> i64
      %8298 = func.call @cc_cons(%8296, %8297) : (i64, i64) -> i64
      %8299 = func.call @cc_values_pack(%8298) : (i64) -> i64
      func.call @stack_push_pointer(%8296) : (i64) -> ()
      %8300 = func.call @stack_pop_pointer() : () -> i64
      %8301 = func.call @cc_nil_value() : () -> i64
      %8302 = func.call @cc_errorp(%8291) : (i64) -> i64
      %8303 = arith.cmpi ne, %8302, %8301 : i64
      %8304 = arith.cmpi eq, %8301, %8301 : i64
      %8305 = arith.andi %8303, %8304 : i1
      %8306 = scf.if %8305 -> (i64) {
        scf.yield %8291 : i64
      } else {
        scf.yield %8301 : i64
      }
      %8307 = func.call @cc_errorp(%8300) : (i64) -> i64
      %8308 = arith.cmpi ne, %8307, %8301 : i64
      %8309 = arith.cmpi eq, %8306, %8301 : i64
      %8310 = arith.andi %8308, %8309 : i1
      %8311 = scf.if %8310 -> (i64) {
        scf.yield %8300 : i64
      } else {
        scf.yield %8306 : i64
      }
      %8312 = arith.cmpi ne, %8311, %8301 : i64
      scf.if %8312 {
        func.call @stack_push_pointer(%8311) : (i64) -> ()
      } else {
        %8313 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%8313) : (i64) -> ()
        func.call @stack_push_pointer(%8300) : (i64) -> ()
        %8314 = func.call @stack_pop_pointer() : () -> i64
        %8315 = func.call @stack_pop_pointer() : () -> i64
        %8316 = func.call @cc_cons(%8314, %8315) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8316) : (i64) -> ()
        func.call @stack_push_pointer(%8291) : (i64) -> ()
        %8317 = func.call @stack_pop_pointer() : () -> i64
        %8318 = func.call @stack_pop_pointer() : () -> i64
        %8319 = func.call @cc_cons(%8317, %8318) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8319) : (i64) -> ()
      }
      %8320 = func.call @stack_pop_pointer() : () -> i64
      %8321 = func.call @cc_nil_value() : () -> i64
      %8322 = func.call @cc_errorp(%8282) : (i64) -> i64
      %8323 = arith.cmpi ne, %8322, %8321 : i64
      %8324 = arith.cmpi eq, %8321, %8321 : i64
      %8325 = arith.andi %8323, %8324 : i1
      %8326 = scf.if %8325 -> (i64) {
        scf.yield %8282 : i64
      } else {
        scf.yield %8321 : i64
      }
      %8327 = func.call @cc_errorp(%8320) : (i64) -> i64
      %8328 = arith.cmpi ne, %8327, %8321 : i64
      %8329 = arith.cmpi eq, %8326, %8321 : i64
      %8330 = arith.andi %8328, %8329 : i1
      %8331 = scf.if %8330 -> (i64) {
        scf.yield %8320 : i64
      } else {
        scf.yield %8326 : i64
      }
      %8332 = arith.cmpi ne, %8331, %8321 : i64
      scf.if %8332 {
        func.call @stack_push_pointer(%8331) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8282) : (i64) -> ()
        func.call @stack_push_pointer(%8320) : (i64) -> ()
        %8333 = llvm.mlir.addressof @str827 : !llvm.ptr
        %8334 = func.call @cc_make_function_ref_const(%8333) : (!llvm.ptr) -> i64
        %8335 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%8334, %8335) : (i64, i64) -> ()
      }
      %8336 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8336 : i64
    }
    %8337 = func.call @cc_nil_value() : () -> i64
    %8338 = func.call @cc_errorp(%8272) : (i64) -> i64
    %8339 = arith.cmpi ne, %8338, %8337 : i64
    %8340 = scf.if %8339 -> (i64) {
      scf.yield %8272 : i64
    } else {
      %8341 = llvm.mlir.addressof @str828 : !llvm.ptr
      %8342 = arith.constant 4 : i64
      %8343 = func.call @cc_make_string(%8341, %8342) : (!llvm.ptr, i64) -> i64
      %8344 = func.call @cc_nil_value() : () -> i64
      %8345 = func.call @cc_intern(%8343, %8344) : (i64, i64) -> i64
      %8346 = func.call @cc_nil_value() : () -> i64
      %8347 = func.call @cc_cons(%8345, %8346) : (i64, i64) -> i64
      %8348 = func.call @cc_values_pack(%8347) : (i64) -> i64
      func.call @stack_push_pointer(%8345) : (i64) -> ()
      %8349 = llvm.mlir.addressof @str829 : !llvm.ptr
      %8350 = arith.constant 3 : i64
      %8351 = func.call @cc_make_string(%8349, %8350) : (!llvm.ptr, i64) -> i64
      %8352 = func.call @cc_nil_value() : () -> i64
      %8353 = func.call @cc_intern(%8351, %8352) : (i64, i64) -> i64
      %8354 = func.call @cc_nil_value() : () -> i64
      %8355 = func.call @cc_cons(%8353, %8354) : (i64, i64) -> i64
      %8356 = func.call @cc_values_pack(%8355) : (i64) -> i64
      %8357 = func.call @cc_symbol_value(%8353) : (i64) -> i64
      func.call @stack_push_pointer(%8357) : (i64) -> ()
      func.call @stack_push_pointer(%8196) : (i64) -> ()
      %8358 = func.call @stack_pop_pointer() : () -> i64
      %8359 = func.call @stack_pop_pointer() : () -> i64
      %8360 = func.call @stack_pop_pointer() : () -> i64
      %8361 = func.call @cc_puthash(%8360, %8358, %8359) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%8361) : (i64) -> ()
      %8362 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8362 : i64
    }
    %8363 = func.call @cc_nil_value() : () -> i64
    %8364 = func.call @cc_errorp(%8340) : (i64) -> i64
    %8365 = arith.cmpi ne, %8364, %8363 : i64
    %8366 = scf.if %8365 -> (i64) {
      scf.yield %8340 : i64
    } else {
      %8367 = llvm.mlir.addressof @str830 : !llvm.ptr
      %8368 = arith.constant 18 : i64
      %8369 = func.call @cc_make_string(%8367, %8368) : (!llvm.ptr, i64) -> i64
      %8370 = func.call @cc_nil_value() : () -> i64
      %8371 = func.call @cc_intern(%8369, %8370) : (i64, i64) -> i64
      %8372 = func.call @cc_nil_value() : () -> i64
      %8373 = func.call @cc_cons(%8371, %8372) : (i64, i64) -> i64
      %8374 = func.call @cc_values_pack(%8373) : (i64) -> i64
      func.call @stack_push_pointer(%8371) : (i64) -> ()
      %8375 = llvm.mlir.addressof @str831 : !llvm.ptr
      %8376 = arith.constant 3 : i64
      %8377 = func.call @cc_make_string(%8375, %8376) : (!llvm.ptr, i64) -> i64
      %8378 = func.call @cc_nil_value() : () -> i64
      %8379 = func.call @cc_intern(%8377, %8378) : (i64, i64) -> i64
      %8380 = func.call @cc_nil_value() : () -> i64
      %8381 = func.call @cc_cons(%8379, %8380) : (i64, i64) -> i64
      %8382 = func.call @cc_values_pack(%8381) : (i64) -> i64
      %8383 = func.call @cc_symbol_value(%8379) : (i64) -> i64
      func.call @stack_push_pointer(%8383) : (i64) -> ()
      func.call @stack_push_pointer(%8209) : (i64) -> ()
      %8384 = func.call @stack_pop_pointer() : () -> i64
      %8385 = func.call @stack_pop_pointer() : () -> i64
      %8386 = func.call @stack_pop_pointer() : () -> i64
      %8387 = func.call @cc_puthash(%8386, %8384, %8385) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%8387) : (i64) -> ()
      %8388 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8388 : i64
    }
    %8389 = func.call @cc_nil_value() : () -> i64
    %8390 = func.call @cc_errorp(%8366) : (i64) -> i64
    %8391 = arith.cmpi ne, %8390, %8389 : i64
    %8392 = scf.if %8391 -> (i64) {
      scf.yield %8366 : i64
    } else {
      %8393 = llvm.mlir.addressof @str832 : !llvm.ptr
      %8394 = arith.constant 7 : i64
      %8395 = func.call @cc_make_string(%8393, %8394) : (!llvm.ptr, i64) -> i64
      %8396 = func.call @cc_nil_value() : () -> i64
      %8397 = func.call @cc_intern(%8395, %8396) : (i64, i64) -> i64
      %8398 = func.call @cc_nil_value() : () -> i64
      %8399 = func.call @cc_cons(%8397, %8398) : (i64, i64) -> i64
      %8400 = func.call @cc_values_pack(%8399) : (i64) -> i64
      func.call @stack_push_pointer(%8397) : (i64) -> ()
      %8401 = llvm.mlir.addressof @str833 : !llvm.ptr
      %8402 = arith.constant 3 : i64
      %8403 = func.call @cc_make_string(%8401, %8402) : (!llvm.ptr, i64) -> i64
      %8404 = func.call @cc_nil_value() : () -> i64
      %8405 = func.call @cc_intern(%8403, %8404) : (i64, i64) -> i64
      %8406 = func.call @cc_nil_value() : () -> i64
      %8407 = func.call @cc_cons(%8405, %8406) : (i64, i64) -> i64
      %8408 = func.call @cc_values_pack(%8407) : (i64) -> i64
      %8409 = func.call @cc_symbol_value(%8405) : (i64) -> i64
      func.call @stack_push_pointer(%8409) : (i64) -> ()
      func.call @stack_push_pointer(%8222) : (i64) -> ()
      %8410 = func.call @stack_pop_pointer() : () -> i64
      %8411 = func.call @stack_pop_pointer() : () -> i64
      %8412 = func.call @stack_pop_pointer() : () -> i64
      %8413 = func.call @cc_puthash(%8412, %8410, %8411) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%8413) : (i64) -> ()
      %8414 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8414 : i64
    }
    %8415 = func.call @cc_nil_value() : () -> i64
    %8416 = func.call @cc_errorp(%8392) : (i64) -> i64
    %8417 = arith.cmpi ne, %8416, %8415 : i64
    %8418 = scf.if %8417 -> (i64) {
      scf.yield %8392 : i64
    } else {
      %8419 = llvm.mlir.addressof @str834 : !llvm.ptr
      %8420 = arith.constant 3 : i64
      %8421 = func.call @cc_make_string(%8419, %8420) : (!llvm.ptr, i64) -> i64
      %8422 = func.call @cc_nil_value() : () -> i64
      %8423 = func.call @cc_intern(%8421, %8422) : (i64, i64) -> i64
      %8424 = func.call @cc_nil_value() : () -> i64
      %8425 = func.call @cc_cons(%8423, %8424) : (i64, i64) -> i64
      %8426 = func.call @cc_values_pack(%8425) : (i64) -> i64
      %8427 = func.call @cc_symbol_value(%8423) : (i64) -> i64
      func.call @stack_push_pointer(%8427) : (i64) -> ()
      %8428 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8428 : i64
    }
    func.call @stack_push_pointer(%8418) : (i64) -> ()
    %8429 = func.call @stack_pop_pointer() : () -> i64
    %8430 = func.call @cc_multiple_value_list(%8429) : (i64) -> i64
    %8431 = llvm.mlir.addressof @str835 : !llvm.ptr
    %8432 = arith.constant 38 : i64
    %8433 = func.call @cc_make_string(%8431, %8432) : (!llvm.ptr, i64) -> i64
    %8434 = func.call @cc_nil_value() : () -> i64
    %8435 = func.call @cc_intern(%8433, %8434) : (i64, i64) -> i64
    %8436 = func.call @cc_nil_value() : () -> i64
    %8437 = func.call @cc_cons(%8435, %8436) : (i64, i64) -> i64
    %8438 = func.call @cc_values_pack(%8437) : (i64) -> i64
    %8439 = func.call @cc_symbol_value(%8435) : (i64) -> i64
    %8440 = llvm.mlir.addressof @str836 : !llvm.ptr
    %8441 = arith.constant 40 : i64
    %8442 = func.call @cc_make_string(%8440, %8441) : (!llvm.ptr, i64) -> i64
    %8443 = func.call @cc_nil_value() : () -> i64
    %8444 = func.call @cc_intern(%8442, %8443) : (i64, i64) -> i64
    %8445 = func.call @cc_nil_value() : () -> i64
    %8446 = func.call @cc_cons(%8444, %8445) : (i64, i64) -> i64
    %8447 = func.call @cc_values_pack(%8446) : (i64) -> i64
    %8448 = func.call @cc_symbol_value(%8444) : (i64) -> i64
    %8449 = func.call @cc_nil_value() : () -> i64
    %8450 = arith.cmpi ne, %8439, %8449 : i64
    %8451 = scf.if %8450 -> (i64) {
      scf.yield %8448 : i64
    } else {
      scf.yield %8430 : i64
    }
    %8452 = func.call @cc_values_pack(%8451) : (i64) -> i64
    func.call @stack_push_pointer(%8452) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%semaphore-p"() {
    %8489 = llvm.mlir.addressof @str842 : !llvm.ptr
    %8490 = arith.constant 12 : i64
    %8491 = func.call @cc_make_string(%8489, %8490) : (!llvm.ptr, i64) -> i64
    %8492 = func.call @cc_nil_value() : () -> i64
    %8493 = func.call @cc_intern(%8491, %8492) : (i64, i64) -> i64
    %8494 = func.call @cc_nil_value() : () -> i64
    %8495 = func.call @cc_cons(%8493, %8494) : (i64, i64) -> i64
    %8496 = func.call @cc_values_pack(%8495) : (i64) -> i64
    %8497 = llvm.mlir.addressof @str843 : !llvm.ptr
    %8498 = arith.constant 3 : i64
    %8499 = func.call @cc_make_string(%8497, %8498) : (!llvm.ptr, i64) -> i64
    %8500 = func.call @cc_register_function_lambda_list_metadata_raw(%8493, %8499) : (i64, i64) -> i64
    %8501 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%8493, %8501) : (i64, i64) -> ()
    %8502 = func.call @stack_pop_pointer() : () -> i64
    %8503 = func.call @cc_nil_value() : () -> i64
    %8504 = llvm.mlir.addressof @str844 : !llvm.ptr
    %8505 = arith.constant 38 : i64
    %8506 = func.call @cc_make_string(%8504, %8505) : (!llvm.ptr, i64) -> i64
    %8507 = func.call @cc_nil_value() : () -> i64
    %8508 = func.call @cc_intern(%8506, %8507) : (i64, i64) -> i64
    %8509 = func.call @cc_nil_value() : () -> i64
    %8510 = func.call @cc_cons(%8508, %8509) : (i64, i64) -> i64
    %8511 = func.call @cc_values_pack(%8510) : (i64) -> i64
    %8512 = func.call @cc_set_symbol_value(%8508, %8503) : (i64, i64) -> i64
    %8513 = llvm.mlir.addressof @str845 : !llvm.ptr
    %8514 = arith.constant 39 : i64
    %8515 = func.call @cc_make_string(%8513, %8514) : (!llvm.ptr, i64) -> i64
    %8516 = func.call @cc_nil_value() : () -> i64
    %8517 = func.call @cc_intern(%8515, %8516) : (i64, i64) -> i64
    %8518 = func.call @cc_nil_value() : () -> i64
    %8519 = func.call @cc_cons(%8517, %8518) : (i64, i64) -> i64
    %8520 = func.call @cc_values_pack(%8519) : (i64) -> i64
    %8521 = func.call @cc_set_symbol_value(%8517, %8503) : (i64, i64) -> i64
    %8522 = llvm.mlir.addressof @str846 : !llvm.ptr
    %8523 = arith.constant 40 : i64
    %8524 = func.call @cc_make_string(%8522, %8523) : (!llvm.ptr, i64) -> i64
    %8525 = func.call @cc_nil_value() : () -> i64
    %8526 = func.call @cc_intern(%8524, %8525) : (i64, i64) -> i64
    %8527 = func.call @cc_nil_value() : () -> i64
    %8528 = func.call @cc_cons(%8526, %8527) : (i64, i64) -> i64
    %8529 = func.call @cc_values_pack(%8528) : (i64) -> i64
    %8530 = func.call @cc_set_symbol_value(%8526, %8503) : (i64, i64) -> i64
    func.call @stack_push_pointer(%8502) : (i64) -> ()
    %8531 = llvm.mlir.addressof @str847 : !llvm.ptr
    %8532 = arith.constant 10 : i64
    %8533 = func.call @cc_make_string(%8531, %8532) : (!llvm.ptr, i64) -> i64
    %8534 = func.call @cc_nil_value() : () -> i64
    %8535 = func.call @cc_intern(%8533, %8534) : (i64, i64) -> i64
    %8536 = func.call @cc_nil_value() : () -> i64
    %8537 = func.call @cc_cons(%8535, %8536) : (i64, i64) -> i64
    %8538 = func.call @cc_values_pack(%8537) : (i64) -> i64
    func.call @stack_push_pointer(%8535) : (i64) -> ()
    %8539 = func.call @stack_pop_pointer() : () -> i64
    %8540 = func.call @stack_pop_pointer() : () -> i64
    %8541 = func.call @cc_typep(%8540, %8539) : (i64, i64) -> i64
    func.call @stack_push_pointer(%8541) : (i64) -> ()
    %8542 = func.call @stack_pop_pointer() : () -> i64
    %8543 = func.call @cc_multiple_value_list(%8542) : (i64) -> i64
    %8544 = llvm.mlir.addressof @str848 : !llvm.ptr
    %8545 = arith.constant 38 : i64
    %8546 = func.call @cc_make_string(%8544, %8545) : (!llvm.ptr, i64) -> i64
    %8547 = func.call @cc_nil_value() : () -> i64
    %8548 = func.call @cc_intern(%8546, %8547) : (i64, i64) -> i64
    %8549 = func.call @cc_nil_value() : () -> i64
    %8550 = func.call @cc_cons(%8548, %8549) : (i64, i64) -> i64
    %8551 = func.call @cc_values_pack(%8550) : (i64) -> i64
    %8552 = func.call @cc_symbol_value(%8548) : (i64) -> i64
    %8553 = llvm.mlir.addressof @str849 : !llvm.ptr
    %8554 = arith.constant 40 : i64
    %8555 = func.call @cc_make_string(%8553, %8554) : (!llvm.ptr, i64) -> i64
    %8556 = func.call @cc_nil_value() : () -> i64
    %8557 = func.call @cc_intern(%8555, %8556) : (i64, i64) -> i64
    %8558 = func.call @cc_nil_value() : () -> i64
    %8559 = func.call @cc_cons(%8557, %8558) : (i64, i64) -> i64
    %8560 = func.call @cc_values_pack(%8559) : (i64) -> i64
    %8561 = func.call @cc_symbol_value(%8557) : (i64) -> i64
    %8562 = func.call @cc_nil_value() : () -> i64
    %8563 = arith.cmpi ne, %8552, %8562 : i64
    %8564 = scf.if %8563 -> (i64) {
      scf.yield %8561 : i64
    } else {
      scf.yield %8543 : i64
    }
    %8565 = func.call @cc_values_pack(%8564) : (i64) -> i64
    func.call @stack_push_pointer(%8565) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%semaphore-lock"() {
    %8602 = llvm.mlir.addressof @str855 : !llvm.ptr
    %8603 = arith.constant 15 : i64
    %8604 = func.call @cc_make_string(%8602, %8603) : (!llvm.ptr, i64) -> i64
    %8605 = func.call @cc_nil_value() : () -> i64
    %8606 = func.call @cc_intern(%8604, %8605) : (i64, i64) -> i64
    %8607 = func.call @cc_nil_value() : () -> i64
    %8608 = func.call @cc_cons(%8606, %8607) : (i64, i64) -> i64
    %8609 = func.call @cc_values_pack(%8608) : (i64) -> i64
    %8610 = llvm.mlir.addressof @str856 : !llvm.ptr
    %8611 = arith.constant 3 : i64
    %8612 = func.call @cc_make_string(%8610, %8611) : (!llvm.ptr, i64) -> i64
    %8613 = func.call @cc_register_function_lambda_list_metadata_raw(%8606, %8612) : (i64, i64) -> i64
    %8614 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%8606, %8614) : (i64, i64) -> ()
    %8615 = func.call @stack_pop_pointer() : () -> i64
    %8616 = func.call @cc_nil_value() : () -> i64
    %8617 = llvm.mlir.addressof @str857 : !llvm.ptr
    %8618 = arith.constant 38 : i64
    %8619 = func.call @cc_make_string(%8617, %8618) : (!llvm.ptr, i64) -> i64
    %8620 = func.call @cc_nil_value() : () -> i64
    %8621 = func.call @cc_intern(%8619, %8620) : (i64, i64) -> i64
    %8622 = func.call @cc_nil_value() : () -> i64
    %8623 = func.call @cc_cons(%8621, %8622) : (i64, i64) -> i64
    %8624 = func.call @cc_values_pack(%8623) : (i64) -> i64
    %8625 = func.call @cc_set_symbol_value(%8621, %8616) : (i64, i64) -> i64
    %8626 = llvm.mlir.addressof @str858 : !llvm.ptr
    %8627 = arith.constant 39 : i64
    %8628 = func.call @cc_make_string(%8626, %8627) : (!llvm.ptr, i64) -> i64
    %8629 = func.call @cc_nil_value() : () -> i64
    %8630 = func.call @cc_intern(%8628, %8629) : (i64, i64) -> i64
    %8631 = func.call @cc_nil_value() : () -> i64
    %8632 = func.call @cc_cons(%8630, %8631) : (i64, i64) -> i64
    %8633 = func.call @cc_values_pack(%8632) : (i64) -> i64
    %8634 = func.call @cc_set_symbol_value(%8630, %8616) : (i64, i64) -> i64
    %8635 = llvm.mlir.addressof @str859 : !llvm.ptr
    %8636 = arith.constant 40 : i64
    %8637 = func.call @cc_make_string(%8635, %8636) : (!llvm.ptr, i64) -> i64
    %8638 = func.call @cc_nil_value() : () -> i64
    %8639 = func.call @cc_intern(%8637, %8638) : (i64, i64) -> i64
    %8640 = func.call @cc_nil_value() : () -> i64
    %8641 = func.call @cc_cons(%8639, %8640) : (i64, i64) -> i64
    %8642 = func.call @cc_values_pack(%8641) : (i64) -> i64
    %8643 = func.call @cc_set_symbol_value(%8639, %8616) : (i64, i64) -> i64
    %8644 = llvm.mlir.addressof @str860 : !llvm.ptr
    %8645 = arith.constant 4 : i64
    %8646 = func.call @cc_make_string(%8644, %8645) : (!llvm.ptr, i64) -> i64
    %8647 = func.call @cc_nil_value() : () -> i64
    %8648 = func.call @cc_intern(%8646, %8647) : (i64, i64) -> i64
    %8649 = func.call @cc_nil_value() : () -> i64
    %8650 = func.call @cc_cons(%8648, %8649) : (i64, i64) -> i64
    %8651 = func.call @cc_values_pack(%8650) : (i64) -> i64
    func.call @stack_push_pointer(%8648) : (i64) -> ()
    func.call @stack_push_pointer(%8615) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %8652 = func.call @stack_pop_pointer() : () -> i64
    %8653 = func.call @stack_pop_pointer() : () -> i64
    %8654 = func.call @stack_pop_pointer() : () -> i64
    %8655 = func.call @cc_gethash(%8654, %8653, %8652) : (i64, i64, i64) -> i64
    func.call @stack_push_pointer(%8655) : (i64) -> ()
    %8656 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %8657 = func.call @stack_pop_pointer() : () -> i64
    %8658 = func.call @cc_cons(%8656, %8657) : (i64, i64) -> i64
    func.call @stack_push_pointer(%8658) : (i64) -> ()
    %8659 = func.call @stack_pop_pointer() : () -> i64
    %8660 = func.call @cc_values_pack(%8659) : (i64) -> i64
    func.call @stack_push_pointer(%8660) : (i64) -> ()
    %8661 = func.call @stack_pop_pointer() : () -> i64
    %8662 = func.call @cc_multiple_value_list(%8661) : (i64) -> i64
    %8663 = llvm.mlir.addressof @str861 : !llvm.ptr
    %8664 = arith.constant 38 : i64
    %8665 = func.call @cc_make_string(%8663, %8664) : (!llvm.ptr, i64) -> i64
    %8666 = func.call @cc_nil_value() : () -> i64
    %8667 = func.call @cc_intern(%8665, %8666) : (i64, i64) -> i64
    %8668 = func.call @cc_nil_value() : () -> i64
    %8669 = func.call @cc_cons(%8667, %8668) : (i64, i64) -> i64
    %8670 = func.call @cc_values_pack(%8669) : (i64) -> i64
    %8671 = func.call @cc_symbol_value(%8667) : (i64) -> i64
    %8672 = llvm.mlir.addressof @str862 : !llvm.ptr
    %8673 = arith.constant 40 : i64
    %8674 = func.call @cc_make_string(%8672, %8673) : (!llvm.ptr, i64) -> i64
    %8675 = func.call @cc_nil_value() : () -> i64
    %8676 = func.call @cc_intern(%8674, %8675) : (i64, i64) -> i64
    %8677 = func.call @cc_nil_value() : () -> i64
    %8678 = func.call @cc_cons(%8676, %8677) : (i64, i64) -> i64
    %8679 = func.call @cc_values_pack(%8678) : (i64) -> i64
    %8680 = func.call @cc_symbol_value(%8676) : (i64) -> i64
    %8681 = func.call @cc_nil_value() : () -> i64
    %8682 = arith.cmpi ne, %8671, %8681 : i64
    %8683 = scf.if %8682 -> (i64) {
      scf.yield %8680 : i64
    } else {
      scf.yield %8662 : i64
    }
    %8684 = func.call @cc_values_pack(%8683) : (i64) -> i64
    func.call @stack_push_pointer(%8684) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%(setf %semaphore-lock)"() {
    %8721 = llvm.mlir.addressof @str868 : !llvm.ptr
    %8722 = arith.constant 22 : i64
    %8723 = func.call @cc_make_string(%8721, %8722) : (!llvm.ptr, i64) -> i64
    %8724 = func.call @cc_nil_value() : () -> i64
    %8725 = func.call @cc_intern(%8723, %8724) : (i64, i64) -> i64
    %8726 = func.call @cc_nil_value() : () -> i64
    %8727 = func.call @cc_cons(%8725, %8726) : (i64, i64) -> i64
    %8728 = func.call @cc_values_pack(%8727) : (i64) -> i64
    %8729 = llvm.mlir.addressof @str869 : !llvm.ptr
    %8730 = arith.constant 13 : i64
    %8731 = func.call @cc_make_string(%8729, %8730) : (!llvm.ptr, i64) -> i64
    %8732 = func.call @cc_register_function_lambda_list_metadata_raw(%8725, %8731) : (i64, i64) -> i64
    %8733 = arith.constant 2 : i64
    func.call @cc_runtime_debug_stack_push_call(%8725, %8733) : (i64, i64) -> ()
    %8734 = func.call @stack_pop_pointer() : () -> i64
    %8735 = func.call @stack_pop_pointer() : () -> i64
    %8736 = func.call @cc_nil_value() : () -> i64
    %8737 = llvm.mlir.addressof @str870 : !llvm.ptr
    %8738 = arith.constant 38 : i64
    %8739 = func.call @cc_make_string(%8737, %8738) : (!llvm.ptr, i64) -> i64
    %8740 = func.call @cc_nil_value() : () -> i64
    %8741 = func.call @cc_intern(%8739, %8740) : (i64, i64) -> i64
    %8742 = func.call @cc_nil_value() : () -> i64
    %8743 = func.call @cc_cons(%8741, %8742) : (i64, i64) -> i64
    %8744 = func.call @cc_values_pack(%8743) : (i64) -> i64
    %8745 = func.call @cc_set_symbol_value(%8741, %8736) : (i64, i64) -> i64
    %8746 = llvm.mlir.addressof @str871 : !llvm.ptr
    %8747 = arith.constant 39 : i64
    %8748 = func.call @cc_make_string(%8746, %8747) : (!llvm.ptr, i64) -> i64
    %8749 = func.call @cc_nil_value() : () -> i64
    %8750 = func.call @cc_intern(%8748, %8749) : (i64, i64) -> i64
    %8751 = func.call @cc_nil_value() : () -> i64
    %8752 = func.call @cc_cons(%8750, %8751) : (i64, i64) -> i64
    %8753 = func.call @cc_values_pack(%8752) : (i64) -> i64
    %8754 = func.call @cc_set_symbol_value(%8750, %8736) : (i64, i64) -> i64
    %8755 = llvm.mlir.addressof @str872 : !llvm.ptr
    %8756 = arith.constant 40 : i64
    %8757 = func.call @cc_make_string(%8755, %8756) : (!llvm.ptr, i64) -> i64
    %8758 = func.call @cc_nil_value() : () -> i64
    %8759 = func.call @cc_intern(%8757, %8758) : (i64, i64) -> i64
    %8760 = func.call @cc_nil_value() : () -> i64
    %8761 = func.call @cc_cons(%8759, %8760) : (i64, i64) -> i64
    %8762 = func.call @cc_values_pack(%8761) : (i64) -> i64
    %8763 = func.call @cc_set_symbol_value(%8759, %8736) : (i64, i64) -> i64
    %8764 = func.call @cc_nil_value() : () -> i64
    %8765 = func.call @cc_nil_value() : () -> i64
    %8766 = func.call @cc_errorp(%8764) : (i64) -> i64
    %8767 = arith.cmpi ne, %8766, %8765 : i64
    %8768 = scf.if %8767 -> (i64) {
      scf.yield %8764 : i64
    } else {
      %8769 = llvm.mlir.addressof @str873 : !llvm.ptr
      %8770 = arith.constant 4 : i64
      %8771 = func.call @cc_make_string(%8769, %8770) : (!llvm.ptr, i64) -> i64
      %8772 = func.call @cc_nil_value() : () -> i64
      %8773 = func.call @cc_intern(%8771, %8772) : (i64, i64) -> i64
      %8774 = func.call @cc_nil_value() : () -> i64
      %8775 = func.call @cc_cons(%8773, %8774) : (i64, i64) -> i64
      %8776 = func.call @cc_values_pack(%8775) : (i64) -> i64
      func.call @stack_push_pointer(%8773) : (i64) -> ()
      func.call @stack_push_pointer(%8734) : (i64) -> ()
      func.call @stack_push_pointer(%8735) : (i64) -> ()
      %8777 = func.call @stack_pop_pointer() : () -> i64
      %8778 = func.call @stack_pop_pointer() : () -> i64
      %8779 = func.call @stack_pop_pointer() : () -> i64
      %8780 = func.call @cc_puthash(%8779, %8777, %8778) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%8780) : (i64) -> ()
      %8781 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8781 : i64
    }
    %8782 = func.call @cc_nil_value() : () -> i64
    %8783 = func.call @cc_errorp(%8768) : (i64) -> i64
    %8784 = arith.cmpi ne, %8783, %8782 : i64
    %8785 = scf.if %8784 -> (i64) {
      scf.yield %8768 : i64
    } else {
      func.call @stack_push_pointer(%8735) : (i64) -> ()
      %8786 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8786 : i64
    }
    func.call @stack_push_pointer(%8785) : (i64) -> ()
    %8787 = func.call @stack_pop_pointer() : () -> i64
    %8788 = func.call @cc_multiple_value_list(%8787) : (i64) -> i64
    %8789 = llvm.mlir.addressof @str874 : !llvm.ptr
    %8790 = arith.constant 38 : i64
    %8791 = func.call @cc_make_string(%8789, %8790) : (!llvm.ptr, i64) -> i64
    %8792 = func.call @cc_nil_value() : () -> i64
    %8793 = func.call @cc_intern(%8791, %8792) : (i64, i64) -> i64
    %8794 = func.call @cc_nil_value() : () -> i64
    %8795 = func.call @cc_cons(%8793, %8794) : (i64, i64) -> i64
    %8796 = func.call @cc_values_pack(%8795) : (i64) -> i64
    %8797 = func.call @cc_symbol_value(%8793) : (i64) -> i64
    %8798 = llvm.mlir.addressof @str875 : !llvm.ptr
    %8799 = arith.constant 40 : i64
    %8800 = func.call @cc_make_string(%8798, %8799) : (!llvm.ptr, i64) -> i64
    %8801 = func.call @cc_nil_value() : () -> i64
    %8802 = func.call @cc_intern(%8800, %8801) : (i64, i64) -> i64
    %8803 = func.call @cc_nil_value() : () -> i64
    %8804 = func.call @cc_cons(%8802, %8803) : (i64, i64) -> i64
    %8805 = func.call @cc_values_pack(%8804) : (i64) -> i64
    %8806 = func.call @cc_symbol_value(%8802) : (i64) -> i64
    %8807 = func.call @cc_nil_value() : () -> i64
    %8808 = arith.cmpi ne, %8797, %8807 : i64
    %8809 = scf.if %8808 -> (i64) {
      scf.yield %8806 : i64
    } else {
      scf.yield %8788 : i64
    }
    %8810 = func.call @cc_values_pack(%8809) : (i64) -> i64
    func.call @stack_push_pointer(%8810) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%semaphore-condition-variable"() {
    %8847 = llvm.mlir.addressof @str881 : !llvm.ptr
    %8848 = arith.constant 29 : i64
    %8849 = func.call @cc_make_string(%8847, %8848) : (!llvm.ptr, i64) -> i64
    %8850 = func.call @cc_nil_value() : () -> i64
    %8851 = func.call @cc_intern(%8849, %8850) : (i64, i64) -> i64
    %8852 = func.call @cc_nil_value() : () -> i64
    %8853 = func.call @cc_cons(%8851, %8852) : (i64, i64) -> i64
    %8854 = func.call @cc_values_pack(%8853) : (i64) -> i64
    %8855 = llvm.mlir.addressof @str882 : !llvm.ptr
    %8856 = arith.constant 3 : i64
    %8857 = func.call @cc_make_string(%8855, %8856) : (!llvm.ptr, i64) -> i64
    %8858 = func.call @cc_register_function_lambda_list_metadata_raw(%8851, %8857) : (i64, i64) -> i64
    %8859 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%8851, %8859) : (i64, i64) -> ()
    %8860 = func.call @stack_pop_pointer() : () -> i64
    %8861 = func.call @cc_nil_value() : () -> i64
    %8862 = llvm.mlir.addressof @str883 : !llvm.ptr
    %8863 = arith.constant 38 : i64
    %8864 = func.call @cc_make_string(%8862, %8863) : (!llvm.ptr, i64) -> i64
    %8865 = func.call @cc_nil_value() : () -> i64
    %8866 = func.call @cc_intern(%8864, %8865) : (i64, i64) -> i64
    %8867 = func.call @cc_nil_value() : () -> i64
    %8868 = func.call @cc_cons(%8866, %8867) : (i64, i64) -> i64
    %8869 = func.call @cc_values_pack(%8868) : (i64) -> i64
    %8870 = func.call @cc_set_symbol_value(%8866, %8861) : (i64, i64) -> i64
    %8871 = llvm.mlir.addressof @str884 : !llvm.ptr
    %8872 = arith.constant 39 : i64
    %8873 = func.call @cc_make_string(%8871, %8872) : (!llvm.ptr, i64) -> i64
    %8874 = func.call @cc_nil_value() : () -> i64
    %8875 = func.call @cc_intern(%8873, %8874) : (i64, i64) -> i64
    %8876 = func.call @cc_nil_value() : () -> i64
    %8877 = func.call @cc_cons(%8875, %8876) : (i64, i64) -> i64
    %8878 = func.call @cc_values_pack(%8877) : (i64) -> i64
    %8879 = func.call @cc_set_symbol_value(%8875, %8861) : (i64, i64) -> i64
    %8880 = llvm.mlir.addressof @str885 : !llvm.ptr
    %8881 = arith.constant 40 : i64
    %8882 = func.call @cc_make_string(%8880, %8881) : (!llvm.ptr, i64) -> i64
    %8883 = func.call @cc_nil_value() : () -> i64
    %8884 = func.call @cc_intern(%8882, %8883) : (i64, i64) -> i64
    %8885 = func.call @cc_nil_value() : () -> i64
    %8886 = func.call @cc_cons(%8884, %8885) : (i64, i64) -> i64
    %8887 = func.call @cc_values_pack(%8886) : (i64) -> i64
    %8888 = func.call @cc_set_symbol_value(%8884, %8861) : (i64, i64) -> i64
    %8889 = llvm.mlir.addressof @str886 : !llvm.ptr
    %8890 = arith.constant 18 : i64
    %8891 = func.call @cc_make_string(%8889, %8890) : (!llvm.ptr, i64) -> i64
    %8892 = func.call @cc_nil_value() : () -> i64
    %8893 = func.call @cc_intern(%8891, %8892) : (i64, i64) -> i64
    %8894 = func.call @cc_nil_value() : () -> i64
    %8895 = func.call @cc_cons(%8893, %8894) : (i64, i64) -> i64
    %8896 = func.call @cc_values_pack(%8895) : (i64) -> i64
    func.call @stack_push_pointer(%8893) : (i64) -> ()
    func.call @stack_push_pointer(%8860) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %8897 = func.call @stack_pop_pointer() : () -> i64
    %8898 = func.call @stack_pop_pointer() : () -> i64
    %8899 = func.call @stack_pop_pointer() : () -> i64
    %8900 = func.call @cc_gethash(%8899, %8898, %8897) : (i64, i64, i64) -> i64
    func.call @stack_push_pointer(%8900) : (i64) -> ()
    %8901 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %8902 = func.call @stack_pop_pointer() : () -> i64
    %8903 = func.call @cc_cons(%8901, %8902) : (i64, i64) -> i64
    func.call @stack_push_pointer(%8903) : (i64) -> ()
    %8904 = func.call @stack_pop_pointer() : () -> i64
    %8905 = func.call @cc_values_pack(%8904) : (i64) -> i64
    func.call @stack_push_pointer(%8905) : (i64) -> ()
    %8906 = func.call @stack_pop_pointer() : () -> i64
    %8907 = func.call @cc_multiple_value_list(%8906) : (i64) -> i64
    %8908 = llvm.mlir.addressof @str887 : !llvm.ptr
    %8909 = arith.constant 38 : i64
    %8910 = func.call @cc_make_string(%8908, %8909) : (!llvm.ptr, i64) -> i64
    %8911 = func.call @cc_nil_value() : () -> i64
    %8912 = func.call @cc_intern(%8910, %8911) : (i64, i64) -> i64
    %8913 = func.call @cc_nil_value() : () -> i64
    %8914 = func.call @cc_cons(%8912, %8913) : (i64, i64) -> i64
    %8915 = func.call @cc_values_pack(%8914) : (i64) -> i64
    %8916 = func.call @cc_symbol_value(%8912) : (i64) -> i64
    %8917 = llvm.mlir.addressof @str888 : !llvm.ptr
    %8918 = arith.constant 40 : i64
    %8919 = func.call @cc_make_string(%8917, %8918) : (!llvm.ptr, i64) -> i64
    %8920 = func.call @cc_nil_value() : () -> i64
    %8921 = func.call @cc_intern(%8919, %8920) : (i64, i64) -> i64
    %8922 = func.call @cc_nil_value() : () -> i64
    %8923 = func.call @cc_cons(%8921, %8922) : (i64, i64) -> i64
    %8924 = func.call @cc_values_pack(%8923) : (i64) -> i64
    %8925 = func.call @cc_symbol_value(%8921) : (i64) -> i64
    %8926 = func.call @cc_nil_value() : () -> i64
    %8927 = arith.cmpi ne, %8916, %8926 : i64
    %8928 = scf.if %8927 -> (i64) {
      scf.yield %8925 : i64
    } else {
      scf.yield %8907 : i64
    }
    %8929 = func.call @cc_values_pack(%8928) : (i64) -> i64
    func.call @stack_push_pointer(%8929) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%(setf %semaphore-condition-variable)"() {
    %8966 = llvm.mlir.addressof @str894 : !llvm.ptr
    %8967 = arith.constant 36 : i64
    %8968 = func.call @cc_make_string(%8966, %8967) : (!llvm.ptr, i64) -> i64
    %8969 = func.call @cc_nil_value() : () -> i64
    %8970 = func.call @cc_intern(%8968, %8969) : (i64, i64) -> i64
    %8971 = func.call @cc_nil_value() : () -> i64
    %8972 = func.call @cc_cons(%8970, %8971) : (i64, i64) -> i64
    %8973 = func.call @cc_values_pack(%8972) : (i64) -> i64
    %8974 = llvm.mlir.addressof @str895 : !llvm.ptr
    %8975 = arith.constant 13 : i64
    %8976 = func.call @cc_make_string(%8974, %8975) : (!llvm.ptr, i64) -> i64
    %8977 = func.call @cc_register_function_lambda_list_metadata_raw(%8970, %8976) : (i64, i64) -> i64
    %8978 = arith.constant 2 : i64
    func.call @cc_runtime_debug_stack_push_call(%8970, %8978) : (i64, i64) -> ()
    %8979 = func.call @stack_pop_pointer() : () -> i64
    %8980 = func.call @stack_pop_pointer() : () -> i64
    %8981 = func.call @cc_nil_value() : () -> i64
    %8982 = llvm.mlir.addressof @str896 : !llvm.ptr
    %8983 = arith.constant 38 : i64
    %8984 = func.call @cc_make_string(%8982, %8983) : (!llvm.ptr, i64) -> i64
    %8985 = func.call @cc_nil_value() : () -> i64
    %8986 = func.call @cc_intern(%8984, %8985) : (i64, i64) -> i64
    %8987 = func.call @cc_nil_value() : () -> i64
    %8988 = func.call @cc_cons(%8986, %8987) : (i64, i64) -> i64
    %8989 = func.call @cc_values_pack(%8988) : (i64) -> i64
    %8990 = func.call @cc_set_symbol_value(%8986, %8981) : (i64, i64) -> i64
    %8991 = llvm.mlir.addressof @str897 : !llvm.ptr
    %8992 = arith.constant 39 : i64
    %8993 = func.call @cc_make_string(%8991, %8992) : (!llvm.ptr, i64) -> i64
    %8994 = func.call @cc_nil_value() : () -> i64
    %8995 = func.call @cc_intern(%8993, %8994) : (i64, i64) -> i64
    %8996 = func.call @cc_nil_value() : () -> i64
    %8997 = func.call @cc_cons(%8995, %8996) : (i64, i64) -> i64
    %8998 = func.call @cc_values_pack(%8997) : (i64) -> i64
    %8999 = func.call @cc_set_symbol_value(%8995, %8981) : (i64, i64) -> i64
    %9000 = llvm.mlir.addressof @str898 : !llvm.ptr
    %9001 = arith.constant 40 : i64
    %9002 = func.call @cc_make_string(%9000, %9001) : (!llvm.ptr, i64) -> i64
    %9003 = func.call @cc_nil_value() : () -> i64
    %9004 = func.call @cc_intern(%9002, %9003) : (i64, i64) -> i64
    %9005 = func.call @cc_nil_value() : () -> i64
    %9006 = func.call @cc_cons(%9004, %9005) : (i64, i64) -> i64
    %9007 = func.call @cc_values_pack(%9006) : (i64) -> i64
    %9008 = func.call @cc_set_symbol_value(%9004, %8981) : (i64, i64) -> i64
    %9009 = func.call @cc_nil_value() : () -> i64
    %9010 = func.call @cc_nil_value() : () -> i64
    %9011 = func.call @cc_errorp(%9009) : (i64) -> i64
    %9012 = arith.cmpi ne, %9011, %9010 : i64
    %9013 = scf.if %9012 -> (i64) {
      scf.yield %9009 : i64
    } else {
      %9014 = llvm.mlir.addressof @str899 : !llvm.ptr
      %9015 = arith.constant 18 : i64
      %9016 = func.call @cc_make_string(%9014, %9015) : (!llvm.ptr, i64) -> i64
      %9017 = func.call @cc_nil_value() : () -> i64
      %9018 = func.call @cc_intern(%9016, %9017) : (i64, i64) -> i64
      %9019 = func.call @cc_nil_value() : () -> i64
      %9020 = func.call @cc_cons(%9018, %9019) : (i64, i64) -> i64
      %9021 = func.call @cc_values_pack(%9020) : (i64) -> i64
      func.call @stack_push_pointer(%9018) : (i64) -> ()
      func.call @stack_push_pointer(%8979) : (i64) -> ()
      func.call @stack_push_pointer(%8980) : (i64) -> ()
      %9022 = func.call @stack_pop_pointer() : () -> i64
      %9023 = func.call @stack_pop_pointer() : () -> i64
      %9024 = func.call @stack_pop_pointer() : () -> i64
      %9025 = func.call @cc_puthash(%9024, %9022, %9023) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%9025) : (i64) -> ()
      %9026 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9026 : i64
    }
    %9027 = func.call @cc_nil_value() : () -> i64
    %9028 = func.call @cc_errorp(%9013) : (i64) -> i64
    %9029 = arith.cmpi ne, %9028, %9027 : i64
    %9030 = scf.if %9029 -> (i64) {
      scf.yield %9013 : i64
    } else {
      func.call @stack_push_pointer(%8980) : (i64) -> ()
      %9031 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9031 : i64
    }
    func.call @stack_push_pointer(%9030) : (i64) -> ()
    %9032 = func.call @stack_pop_pointer() : () -> i64
    %9033 = func.call @cc_multiple_value_list(%9032) : (i64) -> i64
    %9034 = llvm.mlir.addressof @str900 : !llvm.ptr
    %9035 = arith.constant 38 : i64
    %9036 = func.call @cc_make_string(%9034, %9035) : (!llvm.ptr, i64) -> i64
    %9037 = func.call @cc_nil_value() : () -> i64
    %9038 = func.call @cc_intern(%9036, %9037) : (i64, i64) -> i64
    %9039 = func.call @cc_nil_value() : () -> i64
    %9040 = func.call @cc_cons(%9038, %9039) : (i64, i64) -> i64
    %9041 = func.call @cc_values_pack(%9040) : (i64) -> i64
    %9042 = func.call @cc_symbol_value(%9038) : (i64) -> i64
    %9043 = llvm.mlir.addressof @str901 : !llvm.ptr
    %9044 = arith.constant 40 : i64
    %9045 = func.call @cc_make_string(%9043, %9044) : (!llvm.ptr, i64) -> i64
    %9046 = func.call @cc_nil_value() : () -> i64
    %9047 = func.call @cc_intern(%9045, %9046) : (i64, i64) -> i64
    %9048 = func.call @cc_nil_value() : () -> i64
    %9049 = func.call @cc_cons(%9047, %9048) : (i64, i64) -> i64
    %9050 = func.call @cc_values_pack(%9049) : (i64) -> i64
    %9051 = func.call @cc_symbol_value(%9047) : (i64) -> i64
    %9052 = func.call @cc_nil_value() : () -> i64
    %9053 = arith.cmpi ne, %9042, %9052 : i64
    %9054 = scf.if %9053 -> (i64) {
      scf.yield %9051 : i64
    } else {
      scf.yield %9033 : i64
    }
    %9055 = func.call @cc_values_pack(%9054) : (i64) -> i64
    func.call @stack_push_pointer(%9055) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%semaphore-counter"() {
    %9092 = llvm.mlir.addressof @str907 : !llvm.ptr
    %9093 = arith.constant 18 : i64
    %9094 = func.call @cc_make_string(%9092, %9093) : (!llvm.ptr, i64) -> i64
    %9095 = func.call @cc_nil_value() : () -> i64
    %9096 = func.call @cc_intern(%9094, %9095) : (i64, i64) -> i64
    %9097 = func.call @cc_nil_value() : () -> i64
    %9098 = func.call @cc_cons(%9096, %9097) : (i64, i64) -> i64
    %9099 = func.call @cc_values_pack(%9098) : (i64) -> i64
    %9100 = llvm.mlir.addressof @str908 : !llvm.ptr
    %9101 = arith.constant 3 : i64
    %9102 = func.call @cc_make_string(%9100, %9101) : (!llvm.ptr, i64) -> i64
    %9103 = func.call @cc_register_function_lambda_list_metadata_raw(%9096, %9102) : (i64, i64) -> i64
    %9104 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%9096, %9104) : (i64, i64) -> ()
    %9105 = func.call @stack_pop_pointer() : () -> i64
    %9106 = func.call @cc_nil_value() : () -> i64
    %9107 = llvm.mlir.addressof @str909 : !llvm.ptr
    %9108 = arith.constant 38 : i64
    %9109 = func.call @cc_make_string(%9107, %9108) : (!llvm.ptr, i64) -> i64
    %9110 = func.call @cc_nil_value() : () -> i64
    %9111 = func.call @cc_intern(%9109, %9110) : (i64, i64) -> i64
    %9112 = func.call @cc_nil_value() : () -> i64
    %9113 = func.call @cc_cons(%9111, %9112) : (i64, i64) -> i64
    %9114 = func.call @cc_values_pack(%9113) : (i64) -> i64
    %9115 = func.call @cc_set_symbol_value(%9111, %9106) : (i64, i64) -> i64
    %9116 = llvm.mlir.addressof @str910 : !llvm.ptr
    %9117 = arith.constant 39 : i64
    %9118 = func.call @cc_make_string(%9116, %9117) : (!llvm.ptr, i64) -> i64
    %9119 = func.call @cc_nil_value() : () -> i64
    %9120 = func.call @cc_intern(%9118, %9119) : (i64, i64) -> i64
    %9121 = func.call @cc_nil_value() : () -> i64
    %9122 = func.call @cc_cons(%9120, %9121) : (i64, i64) -> i64
    %9123 = func.call @cc_values_pack(%9122) : (i64) -> i64
    %9124 = func.call @cc_set_symbol_value(%9120, %9106) : (i64, i64) -> i64
    %9125 = llvm.mlir.addressof @str911 : !llvm.ptr
    %9126 = arith.constant 40 : i64
    %9127 = func.call @cc_make_string(%9125, %9126) : (!llvm.ptr, i64) -> i64
    %9128 = func.call @cc_nil_value() : () -> i64
    %9129 = func.call @cc_intern(%9127, %9128) : (i64, i64) -> i64
    %9130 = func.call @cc_nil_value() : () -> i64
    %9131 = func.call @cc_cons(%9129, %9130) : (i64, i64) -> i64
    %9132 = func.call @cc_values_pack(%9131) : (i64) -> i64
    %9133 = func.call @cc_set_symbol_value(%9129, %9106) : (i64, i64) -> i64
    %9134 = llvm.mlir.addressof @str912 : !llvm.ptr
    %9135 = arith.constant 7 : i64
    %9136 = func.call @cc_make_string(%9134, %9135) : (!llvm.ptr, i64) -> i64
    %9137 = func.call @cc_nil_value() : () -> i64
    %9138 = func.call @cc_intern(%9136, %9137) : (i64, i64) -> i64
    %9139 = func.call @cc_nil_value() : () -> i64
    %9140 = func.call @cc_cons(%9138, %9139) : (i64, i64) -> i64
    %9141 = func.call @cc_values_pack(%9140) : (i64) -> i64
    func.call @stack_push_pointer(%9138) : (i64) -> ()
    func.call @stack_push_pointer(%9105) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %9142 = func.call @stack_pop_pointer() : () -> i64
    %9143 = func.call @stack_pop_pointer() : () -> i64
    %9144 = func.call @stack_pop_pointer() : () -> i64
    %9145 = func.call @cc_gethash(%9144, %9143, %9142) : (i64, i64, i64) -> i64
    func.call @stack_push_pointer(%9145) : (i64) -> ()
    %9146 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %9147 = func.call @stack_pop_pointer() : () -> i64
    %9148 = func.call @cc_cons(%9146, %9147) : (i64, i64) -> i64
    func.call @stack_push_pointer(%9148) : (i64) -> ()
    %9149 = func.call @stack_pop_pointer() : () -> i64
    %9150 = func.call @cc_values_pack(%9149) : (i64) -> i64
    func.call @stack_push_pointer(%9150) : (i64) -> ()
    %9151 = func.call @stack_pop_pointer() : () -> i64
    %9152 = func.call @cc_multiple_value_list(%9151) : (i64) -> i64
    %9153 = llvm.mlir.addressof @str913 : !llvm.ptr
    %9154 = arith.constant 38 : i64
    %9155 = func.call @cc_make_string(%9153, %9154) : (!llvm.ptr, i64) -> i64
    %9156 = func.call @cc_nil_value() : () -> i64
    %9157 = func.call @cc_intern(%9155, %9156) : (i64, i64) -> i64
    %9158 = func.call @cc_nil_value() : () -> i64
    %9159 = func.call @cc_cons(%9157, %9158) : (i64, i64) -> i64
    %9160 = func.call @cc_values_pack(%9159) : (i64) -> i64
    %9161 = func.call @cc_symbol_value(%9157) : (i64) -> i64
    %9162 = llvm.mlir.addressof @str914 : !llvm.ptr
    %9163 = arith.constant 40 : i64
    %9164 = func.call @cc_make_string(%9162, %9163) : (!llvm.ptr, i64) -> i64
    %9165 = func.call @cc_nil_value() : () -> i64
    %9166 = func.call @cc_intern(%9164, %9165) : (i64, i64) -> i64
    %9167 = func.call @cc_nil_value() : () -> i64
    %9168 = func.call @cc_cons(%9166, %9167) : (i64, i64) -> i64
    %9169 = func.call @cc_values_pack(%9168) : (i64) -> i64
    %9170 = func.call @cc_symbol_value(%9166) : (i64) -> i64
    %9171 = func.call @cc_nil_value() : () -> i64
    %9172 = arith.cmpi ne, %9161, %9171 : i64
    %9173 = scf.if %9172 -> (i64) {
      scf.yield %9170 : i64
    } else {
      scf.yield %9152 : i64
    }
    %9174 = func.call @cc_values_pack(%9173) : (i64) -> i64
    func.call @stack_push_pointer(%9174) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%(setf %semaphore-counter)"() {
    %9211 = llvm.mlir.addressof @str920 : !llvm.ptr
    %9212 = arith.constant 25 : i64
    %9213 = func.call @cc_make_string(%9211, %9212) : (!llvm.ptr, i64) -> i64
    %9214 = func.call @cc_nil_value() : () -> i64
    %9215 = func.call @cc_intern(%9213, %9214) : (i64, i64) -> i64
    %9216 = func.call @cc_nil_value() : () -> i64
    %9217 = func.call @cc_cons(%9215, %9216) : (i64, i64) -> i64
    %9218 = func.call @cc_values_pack(%9217) : (i64) -> i64
    %9219 = llvm.mlir.addressof @str921 : !llvm.ptr
    %9220 = arith.constant 13 : i64
    %9221 = func.call @cc_make_string(%9219, %9220) : (!llvm.ptr, i64) -> i64
    %9222 = func.call @cc_register_function_lambda_list_metadata_raw(%9215, %9221) : (i64, i64) -> i64
    %9223 = arith.constant 2 : i64
    func.call @cc_runtime_debug_stack_push_call(%9215, %9223) : (i64, i64) -> ()
    %9224 = func.call @stack_pop_pointer() : () -> i64
    %9225 = func.call @stack_pop_pointer() : () -> i64
    %9226 = func.call @cc_nil_value() : () -> i64
    %9227 = llvm.mlir.addressof @str922 : !llvm.ptr
    %9228 = arith.constant 38 : i64
    %9229 = func.call @cc_make_string(%9227, %9228) : (!llvm.ptr, i64) -> i64
    %9230 = func.call @cc_nil_value() : () -> i64
    %9231 = func.call @cc_intern(%9229, %9230) : (i64, i64) -> i64
    %9232 = func.call @cc_nil_value() : () -> i64
    %9233 = func.call @cc_cons(%9231, %9232) : (i64, i64) -> i64
    %9234 = func.call @cc_values_pack(%9233) : (i64) -> i64
    %9235 = func.call @cc_set_symbol_value(%9231, %9226) : (i64, i64) -> i64
    %9236 = llvm.mlir.addressof @str923 : !llvm.ptr
    %9237 = arith.constant 39 : i64
    %9238 = func.call @cc_make_string(%9236, %9237) : (!llvm.ptr, i64) -> i64
    %9239 = func.call @cc_nil_value() : () -> i64
    %9240 = func.call @cc_intern(%9238, %9239) : (i64, i64) -> i64
    %9241 = func.call @cc_nil_value() : () -> i64
    %9242 = func.call @cc_cons(%9240, %9241) : (i64, i64) -> i64
    %9243 = func.call @cc_values_pack(%9242) : (i64) -> i64
    %9244 = func.call @cc_set_symbol_value(%9240, %9226) : (i64, i64) -> i64
    %9245 = llvm.mlir.addressof @str924 : !llvm.ptr
    %9246 = arith.constant 40 : i64
    %9247 = func.call @cc_make_string(%9245, %9246) : (!llvm.ptr, i64) -> i64
    %9248 = func.call @cc_nil_value() : () -> i64
    %9249 = func.call @cc_intern(%9247, %9248) : (i64, i64) -> i64
    %9250 = func.call @cc_nil_value() : () -> i64
    %9251 = func.call @cc_cons(%9249, %9250) : (i64, i64) -> i64
    %9252 = func.call @cc_values_pack(%9251) : (i64) -> i64
    %9253 = func.call @cc_set_symbol_value(%9249, %9226) : (i64, i64) -> i64
    %9254 = func.call @cc_nil_value() : () -> i64
    %9255 = func.call @cc_nil_value() : () -> i64
    %9256 = func.call @cc_errorp(%9254) : (i64) -> i64
    %9257 = arith.cmpi ne, %9256, %9255 : i64
    %9258 = scf.if %9257 -> (i64) {
      scf.yield %9254 : i64
    } else {
      %9259 = llvm.mlir.addressof @str925 : !llvm.ptr
      %9260 = arith.constant 7 : i64
      %9261 = func.call @cc_make_string(%9259, %9260) : (!llvm.ptr, i64) -> i64
      %9262 = func.call @cc_nil_value() : () -> i64
      %9263 = func.call @cc_intern(%9261, %9262) : (i64, i64) -> i64
      %9264 = func.call @cc_nil_value() : () -> i64
      %9265 = func.call @cc_cons(%9263, %9264) : (i64, i64) -> i64
      %9266 = func.call @cc_values_pack(%9265) : (i64) -> i64
      func.call @stack_push_pointer(%9263) : (i64) -> ()
      func.call @stack_push_pointer(%9224) : (i64) -> ()
      func.call @stack_push_pointer(%9225) : (i64) -> ()
      %9267 = func.call @stack_pop_pointer() : () -> i64
      %9268 = func.call @stack_pop_pointer() : () -> i64
      %9269 = func.call @stack_pop_pointer() : () -> i64
      %9270 = func.call @cc_puthash(%9269, %9267, %9268) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%9270) : (i64) -> ()
      %9271 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9271 : i64
    }
    %9272 = func.call @cc_nil_value() : () -> i64
    %9273 = func.call @cc_errorp(%9258) : (i64) -> i64
    %9274 = arith.cmpi ne, %9273, %9272 : i64
    %9275 = scf.if %9274 -> (i64) {
      scf.yield %9258 : i64
    } else {
      func.call @stack_push_pointer(%9225) : (i64) -> ()
      %9276 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9276 : i64
    }
    func.call @stack_push_pointer(%9275) : (i64) -> ()
    %9277 = func.call @stack_pop_pointer() : () -> i64
    %9278 = func.call @cc_multiple_value_list(%9277) : (i64) -> i64
    %9279 = llvm.mlir.addressof @str926 : !llvm.ptr
    %9280 = arith.constant 38 : i64
    %9281 = func.call @cc_make_string(%9279, %9280) : (!llvm.ptr, i64) -> i64
    %9282 = func.call @cc_nil_value() : () -> i64
    %9283 = func.call @cc_intern(%9281, %9282) : (i64, i64) -> i64
    %9284 = func.call @cc_nil_value() : () -> i64
    %9285 = func.call @cc_cons(%9283, %9284) : (i64, i64) -> i64
    %9286 = func.call @cc_values_pack(%9285) : (i64) -> i64
    %9287 = func.call @cc_symbol_value(%9283) : (i64) -> i64
    %9288 = llvm.mlir.addressof @str927 : !llvm.ptr
    %9289 = arith.constant 40 : i64
    %9290 = func.call @cc_make_string(%9288, %9289) : (!llvm.ptr, i64) -> i64
    %9291 = func.call @cc_nil_value() : () -> i64
    %9292 = func.call @cc_intern(%9290, %9291) : (i64, i64) -> i64
    %9293 = func.call @cc_nil_value() : () -> i64
    %9294 = func.call @cc_cons(%9292, %9293) : (i64, i64) -> i64
    %9295 = func.call @cc_values_pack(%9294) : (i64) -> i64
    %9296 = func.call @cc_symbol_value(%9292) : (i64) -> i64
    %9297 = func.call @cc_nil_value() : () -> i64
    %9298 = arith.cmpi ne, %9287, %9297 : i64
    %9299 = scf.if %9298 -> (i64) {
      scf.yield %9296 : i64
    } else {
      scf.yield %9278 : i64
    }
    %9300 = func.call @cc_values_pack(%9299) : (i64) -> i64
    func.call @stack_push_pointer(%9300) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%copy-%semaphore"() {
    %9646 = llvm.mlir.addressof @str944 : !llvm.ptr
    %9647 = arith.constant 15 : i64
    %9648 = func.call @cc_make_string(%9646, %9647) : (!llvm.ptr, i64) -> i64
    %9649 = func.call @cc_nil_value() : () -> i64
    %9650 = func.call @cc_intern(%9648, %9649) : (i64, i64) -> i64
    %9651 = func.call @cc_nil_value() : () -> i64
    %9652 = func.call @cc_cons(%9650, %9651) : (i64, i64) -> i64
    %9653 = func.call @cc_values_pack(%9652) : (i64) -> i64
    %9654 = llvm.mlir.addressof @str945 : !llvm.ptr
    %9655 = arith.constant 3 : i64
    %9656 = func.call @cc_make_string(%9654, %9655) : (!llvm.ptr, i64) -> i64
    %9657 = func.call @cc_register_function_lambda_list_metadata_raw(%9650, %9656) : (i64, i64) -> i64
    %9658 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%9650, %9658) : (i64, i64) -> ()
    %9659 = func.call @stack_pop_pointer() : () -> i64
    %9660 = func.call @cc_nil_value() : () -> i64
    %9661 = llvm.mlir.addressof @str946 : !llvm.ptr
    %9662 = arith.constant 38 : i64
    %9663 = func.call @cc_make_string(%9661, %9662) : (!llvm.ptr, i64) -> i64
    %9664 = func.call @cc_nil_value() : () -> i64
    %9665 = func.call @cc_intern(%9663, %9664) : (i64, i64) -> i64
    %9666 = func.call @cc_nil_value() : () -> i64
    %9667 = func.call @cc_cons(%9665, %9666) : (i64, i64) -> i64
    %9668 = func.call @cc_values_pack(%9667) : (i64) -> i64
    %9669 = func.call @cc_set_symbol_value(%9665, %9660) : (i64, i64) -> i64
    %9670 = llvm.mlir.addressof @str947 : !llvm.ptr
    %9671 = arith.constant 39 : i64
    %9672 = func.call @cc_make_string(%9670, %9671) : (!llvm.ptr, i64) -> i64
    %9673 = func.call @cc_nil_value() : () -> i64
    %9674 = func.call @cc_intern(%9672, %9673) : (i64, i64) -> i64
    %9675 = func.call @cc_nil_value() : () -> i64
    %9676 = func.call @cc_cons(%9674, %9675) : (i64, i64) -> i64
    %9677 = func.call @cc_values_pack(%9676) : (i64) -> i64
    %9678 = func.call @cc_set_symbol_value(%9674, %9660) : (i64, i64) -> i64
    %9679 = llvm.mlir.addressof @str948 : !llvm.ptr
    %9680 = arith.constant 40 : i64
    %9681 = func.call @cc_make_string(%9679, %9680) : (!llvm.ptr, i64) -> i64
    %9682 = func.call @cc_nil_value() : () -> i64
    %9683 = func.call @cc_intern(%9681, %9682) : (i64, i64) -> i64
    %9684 = func.call @cc_nil_value() : () -> i64
    %9685 = func.call @cc_cons(%9683, %9684) : (i64, i64) -> i64
    %9686 = func.call @cc_values_pack(%9685) : (i64) -> i64
    %9687 = func.call @cc_set_symbol_value(%9683, %9660) : (i64, i64) -> i64
    func.call @stack_push_pointer(%9659) : (i64) -> ()
    %9688 = func.call @stack_pop_pointer() : () -> i64
    %9689 = func.call @cc_nil_value() : () -> i64
    %9690 = func.call @cc_errorp(%9688) : (i64) -> i64
    %9691 = arith.cmpi ne, %9690, %9689 : i64
    %9692 = arith.cmpi eq, %9689, %9689 : i64
    %9693 = arith.andi %9691, %9692 : i1
    %9694 = scf.if %9693 -> (i64) {
      scf.yield %9688 : i64
    } else {
      scf.yield %9689 : i64
    }
    %9695 = arith.cmpi ne, %9694, %9689 : i64
    scf.if %9695 {
      func.call @stack_push_pointer(%9694) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%9688) : (i64) -> ()
      %9696 = llvm.mlir.addressof @str949 : !llvm.ptr
      %9697 = func.call @cc_make_function_ref_const(%9696) : (!llvm.ptr) -> i64
      %9698 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%9697, %9698) : (i64, i64) -> ()
    }
    %9699 = func.call @stack_pop_pointer() : () -> i64
    %9700 = func.call @cc_multiple_value_list(%9699) : (i64) -> i64
    %9701 = llvm.mlir.addressof @str950 : !llvm.ptr
    %9702 = arith.constant 38 : i64
    %9703 = func.call @cc_make_string(%9701, %9702) : (!llvm.ptr, i64) -> i64
    %9704 = func.call @cc_nil_value() : () -> i64
    %9705 = func.call @cc_intern(%9703, %9704) : (i64, i64) -> i64
    %9706 = func.call @cc_nil_value() : () -> i64
    %9707 = func.call @cc_cons(%9705, %9706) : (i64, i64) -> i64
    %9708 = func.call @cc_values_pack(%9707) : (i64) -> i64
    %9709 = func.call @cc_symbol_value(%9705) : (i64) -> i64
    %9710 = llvm.mlir.addressof @str951 : !llvm.ptr
    %9711 = arith.constant 40 : i64
    %9712 = func.call @cc_make_string(%9710, %9711) : (!llvm.ptr, i64) -> i64
    %9713 = func.call @cc_nil_value() : () -> i64
    %9714 = func.call @cc_intern(%9712, %9713) : (i64, i64) -> i64
    %9715 = func.call @cc_nil_value() : () -> i64
    %9716 = func.call @cc_cons(%9714, %9715) : (i64, i64) -> i64
    %9717 = func.call @cc_values_pack(%9716) : (i64) -> i64
    %9718 = func.call @cc_symbol_value(%9714) : (i64) -> i64
    %9719 = func.call @cc_nil_value() : () -> i64
    %9720 = arith.cmpi ne, %9709, %9719 : i64
    %9721 = scf.if %9720 -> (i64) {
      scf.yield %9718 : i64
    } else {
      scf.yield %9700 : i64
    }
    %9722 = func.call @cc_values_pack(%9721) : (i64) -> i64
    func.call @stack_push_pointer(%9722) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_206494159077416"() {
    %9782 = func.call @cc_nil_value() : () -> i64
    %9783 = func.call @cc_nil_value() : () -> i64
    %9784 = func.call @cc_errorp(%9782) : (i64) -> i64
    %9785 = arith.cmpi ne, %9784, %9783 : i64
    %9786 = scf.if %9785 -> (i64) {
      scf.yield %9782 : i64
    } else {
      %9787 = llvm.mlir.addressof @str959 : !llvm.ptr
      %9788 = arith.constant 10 : i64
      %9789 = func.call @cc_make_string(%9787, %9788) : (!llvm.ptr, i64) -> i64
      %9790 = func.call @cc_nil_value() : () -> i64
      %9791 = func.call @cc_intern(%9789, %9790) : (i64, i64) -> i64
      %9792 = func.call @cc_nil_value() : () -> i64
      %9793 = func.call @cc_cons(%9791, %9792) : (i64, i64) -> i64
      %9794 = func.call @cc_values_pack(%9793) : (i64) -> i64
      func.call @stack_push_pointer(%9791) : (i64) -> ()
      %9795 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9795 : i64
    }
    func.call @stack_push_pointer(%9786) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077417"() {
    %9959 = func.call @cc_nil_value() : () -> i64
    %9960 = func.call @cc_nil_value() : () -> i64
    %9961 = func.call @cc_errorp(%9959) : (i64) -> i64
    %9962 = arith.cmpi ne, %9961, %9960 : i64
    %9963 = scf.if %9962 -> (i64) {
      scf.yield %9959 : i64
    } else {
      %9964 = func.call @cc_nil_value() : () -> i64
      %9965 = arith.cmpi ne, %9964, %9964 : i64
      scf.if %9965 {
        func.call @stack_push_pointer(%9964) : (i64) -> ()
      } else {
        %9966 = llvm.mlir.addressof @str978 : !llvm.ptr
        %9967 = func.call @cc_make_function_ref_const(%9966) : (!llvm.ptr) -> i64
        %9968 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%9967, %9968) : (i64, i64) -> ()
      }
      %9969 = func.call @stack_pop_pointer() : () -> i64
      %9970 = func.call @cc_nil_value() : () -> i64
      %9971 = func.call @cc_errorp(%9969) : (i64) -> i64
      %9972 = arith.cmpi ne, %9971, %9970 : i64
      %9973 = arith.cmpi eq, %9970, %9970 : i64
      %9974 = arith.andi %9972, %9973 : i1
      %9975 = scf.if %9974 -> (i64) {
        scf.yield %9969 : i64
      } else {
        scf.yield %9970 : i64
      }
      %9976 = arith.cmpi ne, %9975, %9970 : i64
      scf.if %9976 {
        func.call @stack_push_pointer(%9975) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9969) : (i64) -> ()
        %9977 = llvm.mlir.addressof @str979 : !llvm.ptr
        %9978 = func.call @cc_make_function_ref_const(%9977) : (!llvm.ptr) -> i64
        %9979 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%9978, %9979) : (i64, i64) -> ()
      }
      %9980 = func.call @stack_pop_pointer() : () -> i64
      %9981 = func.call @cc_nil_value() : () -> i64
      %9982 = func.call @cc_cons(%9980, %9981) : (i64, i64) -> i64
      %9983 = func.call @cc_not(%9982) : (i64) -> i64
      func.call @stack_push_pointer(%9983) : (i64) -> ()
      %9984 = func.call @stack_pop_pointer() : () -> i64
      %9985 = func.call @cc_nil_value() : () -> i64
      %9986 = func.call @cc_cons(%9984, %9985) : (i64, i64) -> i64
      %9987 = func.call @cc_not(%9986) : (i64) -> i64
      func.call @stack_push_pointer(%9987) : (i64) -> ()
      %9988 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9988 : i64
    }
    func.call @stack_push_pointer(%9963) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077418"() {
    %10096 = func.call @cc_nil_value() : () -> i64
    %10097 = func.call @cc_nil_value() : () -> i64
    %10098 = func.call @cc_errorp(%10096) : (i64) -> i64
    %10099 = arith.cmpi ne, %10098, %10097 : i64
    %10100 = scf.if %10099 -> (i64) {
      scf.yield %10096 : i64
    } else {
      %10101 = llvm.mlir.addressof @str988 : !llvm.ptr
      %10102 = arith.constant 6 : i64
      %10103 = func.call @cc_make_string(%10101, %10102) : (!llvm.ptr, i64) -> i64
      %10104 = llvm.mlir.addressof @str989 : !llvm.ptr
      %10105 = arith.constant 11 : i64
      %10106 = func.call @cc_make_string(%10104, %10105) : (!llvm.ptr, i64) -> i64
      %10107 = func.call @cc_intern(%10103, %10106) : (i64, i64) -> i64
      %10108 = func.call @cc_nil_value() : () -> i64
      %10109 = func.call @cc_cons(%10107, %10108) : (i64, i64) -> i64
      %10110 = func.call @cc_values_pack(%10109) : (i64) -> i64
      func.call @stack_push_pointer(%10107) : (i64) -> ()
      %10111 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10111 : i64
    }
    func.call @stack_push_pointer(%10100) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077419"() {
    %10266 = func.call @cc_nil_value() : () -> i64
    %10267 = func.call @cc_nil_value() : () -> i64
    %10268 = func.call @cc_errorp(%10266) : (i64) -> i64
    %10269 = arith.cmpi ne, %10268, %10267 : i64
    %10270 = scf.if %10269 -> (i64) {
      scf.yield %10266 : i64
    } else {
      %10271 = llvm.mlir.addressof @str1003 : !llvm.ptr
      %10272 = arith.constant 5 : i64
      %10273 = func.call @cc_make_string(%10271, %10272) : (!llvm.ptr, i64) -> i64
      %10274 = llvm.mlir.addressof @str1004 : !llvm.ptr
      %10275 = arith.constant 7 : i64
      %10276 = func.call @cc_make_string(%10274, %10275) : (!llvm.ptr, i64) -> i64
      %10277 = func.call @cc_intern(%10273, %10276) : (i64, i64) -> i64
      %10278 = func.call @cc_nil_value() : () -> i64
      %10279 = func.call @cc_cons(%10277, %10278) : (i64, i64) -> i64
      %10280 = func.call @cc_values_pack(%10279) : (i64) -> i64
      func.call @stack_push_pointer(%10277) : (i64) -> ()
      %10281 = func.call @stack_pop_pointer() : () -> i64
      %10282 = func.call @cc_nil_value() : () -> i64
      %10283 = func.call @cc_nil_value() : () -> i64
      %10284 = func.call @cc_errorp(%10282) : (i64) -> i64
      %10285 = arith.cmpi ne, %10284, %10283 : i64
      %10286 = scf.if %10285 -> (i64) {
        scf.yield %10282 : i64
      } else {
        func.call @stack_push_pointer(%10281) : (i64) -> ()
        %10287 = llvm.mlir.addressof @str1005 : !llvm.ptr
        %10288 = arith.constant 12 : i64
        %10289 = func.call @cc_make_string(%10287, %10288) : (!llvm.ptr, i64) -> i64
        %10290 = func.call @cc_nil_value() : () -> i64
        %10291 = func.call @cc_intern(%10289, %10290) : (i64, i64) -> i64
        %10292 = func.call @cc_nil_value() : () -> i64
        %10293 = func.call @cc_cons(%10291, %10292) : (i64, i64) -> i64
        %10294 = func.call @cc_values_pack(%10293) : (i64) -> i64
        func.call @stack_push_pointer(%10291) : (i64) -> ()
        %10295 = func.call @stack_pop_pointer() : () -> i64
        %10296 = func.call @stack_pop_pointer() : () -> i64
        %10297 = func.call @cc_typep(%10296, %10295) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10297) : (i64) -> ()
        %10298 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10298 : i64
      }
      func.call @stack_push_pointer(%10286) : (i64) -> ()
      %10299 = func.call @stack_pop_pointer() : () -> i64
      %10300 = func.call @cc_nil_value() : () -> i64
      %10301 = func.call @cc_cons(%10299, %10300) : (i64, i64) -> i64
      %10302 = func.call @cc_not(%10301) : (i64) -> i64
      func.call @stack_push_pointer(%10302) : (i64) -> ()
      %10303 = func.call @stack_pop_pointer() : () -> i64
      %10304 = func.call @cc_nil_value() : () -> i64
      %10305 = func.call @cc_cons(%10303, %10304) : (i64, i64) -> i64
      %10306 = func.call @cc_not(%10305) : (i64) -> i64
      func.call @stack_push_pointer(%10306) : (i64) -> ()
      %10307 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10307 : i64
    }
    func.call @stack_push_pointer(%10270) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_206494159077420"() {
    %10541 = func.call @cc_nil_value() : () -> i64
    %10542 = func.call @cc_nil_value() : () -> i64
    %10543 = func.call @cc_errorp(%10541) : (i64) -> i64
    %10544 = arith.cmpi ne, %10543, %10542 : i64
    %10545 = scf.if %10544 -> (i64) {
      scf.yield %10541 : i64
    } else {
      %10546 = func.call @cc_nil_value() : () -> i64
      %10547 = func.call @cc_nil_value() : () -> i64
      %10548 = func.call @cc_errorp(%10546) : (i64) -> i64
      %10549 = arith.cmpi ne, %10548, %10547 : i64
      %10550 = scf.if %10549 -> (i64) {
        scf.yield %10546 : i64
      } else {
        %10551 = arith.constant 0 : i64
        %10552 = func.call @cc_box_fixnum(%10551) : (i64) -> i64
        %10553 = func.call @cc_make_vector(%10552) : (i64) -> i64
        func.call @stack_push_pointer(%10553) : (i64) -> ()
        %10554 = llvm.mlir.addressof @str1026 : !llvm.ptr
        %10555 = arith.constant 5 : i64
        %10556 = func.call @cc_make_string(%10554, %10555) : (!llvm.ptr, i64) -> i64
        %10557 = llvm.mlir.addressof @str1027 : !llvm.ptr
        %10558 = arith.constant 11 : i64
        %10559 = func.call @cc_make_string(%10557, %10558) : (!llvm.ptr, i64) -> i64
        %10560 = func.call @cc_intern(%10556, %10559) : (i64, i64) -> i64
        %10561 = func.call @cc_nil_value() : () -> i64
        %10562 = func.call @cc_cons(%10560, %10561) : (i64, i64) -> i64
        %10563 = func.call @cc_values_pack(%10562) : (i64) -> i64
        func.call @stack_push_pointer(%10560) : (i64) -> ()
        %10564 = llvm.mlir.addressof @str1028 : !llvm.ptr
        %10565 = arith.constant 1 : i64
        %10566 = func.call @cc_make_string(%10564, %10565) : (!llvm.ptr, i64) -> i64
        %10567 = llvm.mlir.addressof @str1029 : !llvm.ptr
        %10568 = arith.constant 11 : i64
        %10569 = func.call @cc_make_string(%10567, %10568) : (!llvm.ptr, i64) -> i64
        %10570 = func.call @cc_intern(%10566, %10569) : (i64, i64) -> i64
        %10571 = func.call @cc_nil_value() : () -> i64
        %10572 = func.call @cc_cons(%10570, %10571) : (i64, i64) -> i64
        %10573 = func.call @cc_values_pack(%10572) : (i64) -> i64
        func.call @stack_push_pointer(%10570) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        func.call @stack_push_nil() : () -> ()
        %10574 = func.call @stack_pop_pointer() : () -> i64
        %10575 = func.call @stack_pop_pointer() : () -> i64
        %10576 = func.call @cc_cons(%10575, %10574) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10576) : (i64) -> ()
        %10577 = func.call @stack_pop_pointer() : () -> i64
        %10578 = func.call @stack_pop_pointer() : () -> i64
        %10579 = func.call @cc_cons(%10578, %10577) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10579) : (i64) -> ()
        %10580 = func.call @stack_pop_pointer() : () -> i64
        %10581 = func.call @stack_pop_pointer() : () -> i64
        %10582 = func.call @cc_cons(%10581, %10580) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10582) : (i64) -> ()
        %10583 = func.call @stack_pop_pointer() : () -> i64
        %10584 = func.call @stack_pop_pointer() : () -> i64
        %10585 = func.call @cc_typep(%10584, %10583) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10585) : (i64) -> ()
        %10586 = func.call @stack_pop_pointer() : () -> i64
        %10587 = func.call @cc_nil_value() : () -> i64
        %10588 = arith.cmpi eq, %10586, %10587 : i64
        %10590 = func.call @cc_t_value() : () -> i64
        %10589 = arith.select %10588, %10590, %10587 : i64
        func.call @stack_push_pointer(%10589) : (i64) -> ()
        %10591 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %10591 : i64
      }
      func.call @stack_push_pointer(%10550) : (i64) -> ()
      %10592 = func.call @stack_pop_pointer() : () -> i64
      %10593 = func.call @cc_nil_value() : () -> i64
      %10594 = func.call @cc_cons(%10592, %10593) : (i64, i64) -> i64
      %10595 = func.call @cc_not(%10594) : (i64) -> i64
      func.call @stack_push_pointer(%10595) : (i64) -> ()
      %10596 = func.call @stack_pop_pointer() : () -> i64
      %10597 = func.call @cc_nil_value() : () -> i64
      %10598 = func.call @cc_cons(%10596, %10597) : (i64, i64) -> i64
      %10599 = func.call @cc_not(%10598) : (i64) -> i64
      func.call @stack_push_pointer(%10599) : (i64) -> ()
      %10600 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10600 : i64
    }
    func.call @stack_push_pointer(%10545) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("SEMAPHORE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1("object\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_206494159077376*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_206494159077376*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_206494159077376*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_206494159077377*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_206494159077377*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_206494159077377*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str8("Returns T if OBJECT is a semaphore; returns NIL otherwise.\00") : !llvm.array<59 x i8>
  llvm.mlir.global private constant @str9("SEMAPHORE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_206494159077377*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETVALUE_206494159077377*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_206494159077377*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_206494159077376*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETMVLIST_206494159077376*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str15("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETFLAG_206494159077378*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETVALUE_206494159077378*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETMVLIST_206494159077378*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str19("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("%FN%test-subtypep\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str21("TEST-SUBTYPEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str22("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str23("%FN%test-subtypep\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str24("TEST-SUBTYPEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str25("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str26("%FN%test-subtypep\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str27("TEST-SUBTYPEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str28("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str29("%FN%test-subtypep\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str30("TEST-SUBTYPEP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str31("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str32("%FN%test-types-classes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str33("TEST-TYPES-CLASSES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str34("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str35("%FN%test-types-classes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str36("TEST-TYPES-CLASSES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str37("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str38("%FN%test-types-classes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str39("TEST-TYPES-CLASSES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str40("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str41("%FN%test-types-classes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str42("TEST-TYPES-CLASSES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str43("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str44("TYPES-CLASSES-1\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str45("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str46("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str47("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str50("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str52("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str54("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str56("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str58("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str61("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str63("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str66("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str68("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str74("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str75("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str78("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str79("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str80("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str81("TYPES-CLASSES-2\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str82("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str83("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str84("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str85("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str87("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str89("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str91("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str93("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str95("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str97("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str100("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str103("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str105("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str107("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str109("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str110("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str112("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str117("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str118("TYPES-CLASSES-3\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str119("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str120("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str121("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str122("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str124("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str126("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str127("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str128("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str130("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str132("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str133("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str137("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str138("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str139("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str140("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str142("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str143("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str144("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str146("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str148("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str149("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str151("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str152("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str153("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str154("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str155("TYPES-CLASSES-4\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str156("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str157("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str158("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str159("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str160("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str161("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str162("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str163("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str164("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str165("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str166("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str167("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str168("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str171("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str172("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str173("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str174("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str175("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str176("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str177("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str178("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str179("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str180("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str181("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str182("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str183("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str184("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str185("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str186("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str187("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str188("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str189("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str190("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str191("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str192("TYPES-CLASSES-5\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str193("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str194("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str195("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str196("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str197("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str198("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str200("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str201("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str202("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str203("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str204("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str206("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str207("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str208("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str209("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str210("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str211("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str212("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str213("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str214("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str216("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str217("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str218("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str220("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str222("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str223("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str225("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str226("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str227("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str228("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str229("TYPES-CLASSES-6\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str230("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str231("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str232("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str233("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str234("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str235("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str236("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str237("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str238("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str239("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str240("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str241("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str242("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str243("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str245("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str246("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str248("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str249("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str250("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str251("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str252("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str253("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str255("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str257("LONG-FLOAT\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str258("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str259("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str260("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str261("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str262("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str263("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str264("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str265("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str266("TYPES-CLASSES-7\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str267("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str268("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str269("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str270("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str271("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str272("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str273("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str274("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str275("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str276("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str277("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str278("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str280("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str281("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str282("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str283("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str284("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str285("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str286("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str287("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str288("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str290("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str292("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str293("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str295("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str296("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str297("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str299("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str300("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str301("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str302("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str303("TYPES-CLASSES-8\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str304("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str305("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str306("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str307("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str308("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str309("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str310("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str311("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str312("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str313("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str314("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str315("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str317("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str318("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str319("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str321("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str322("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str323("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str324("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str325("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str326("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str327("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str329("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str331("SHORT-FLOAT\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str332("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str333("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str334("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str335("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str336("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str337("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str338("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str339("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str340("TYPES-CLASSES-9\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str341("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str342("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str343("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str344("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str345("CLASS-OF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str346("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str348("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str349("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str350("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str351("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str352("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str353("TYPES-CLASSES-10\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str354("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str355("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str356("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str357("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str358("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str359("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str360("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str361("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str362("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str363("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str364("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str365("COMMON-LISP::CAR\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str366("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str367("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str368("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str369("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str370("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str371("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str372("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str373("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str374("ARRAY.9.8\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str375("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str376("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str377("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str378("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str379("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str380("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str381("B\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str382("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str383("D\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str384("E\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str385("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str386("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str387("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str388("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str389("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str390("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str391("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str392("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str393("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str394("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str395("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str396("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str397("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str398("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str399("#:%%DYN-CELL-206494159077390-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str400("#:%%DYN-CELL-206494159077391-B\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str401("#:%%DYN-CELL-206494159077392-C\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str402("#:%%DYN-CELL-206494159077393-D\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str403("#:%%DYN-CELL-206494159077394-E\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str404("#:%%DYN-CELL-206494159077395-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str405("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str406("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str407("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str408("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str409("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str410("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str411("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str412("TYPES-CLASSES-11-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str413("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str414("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str415("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str416("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str417("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str418("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str419("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str420("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str421("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str422("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str423("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str424("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str425("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str426("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str427("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str428("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str429("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str430("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str431("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str432("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str433("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str434("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str436("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str437("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str438("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str439("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str440("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str441("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str442("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str443("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str445("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str446("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str447("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str448("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str449("TYPES-CLASSES-11-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str450("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str451("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str452("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str453("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str454("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str455("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str456("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str457("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str458("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str459("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str460("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str461("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str462("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str463("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str464("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str465("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str466("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str467("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str468("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str469("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str470("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str471("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str472("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str473("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str474("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str475("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str476("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str477("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str478("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str479("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str480("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str481("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str482("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str483("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str484("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str485("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str486("TYPES-CLASSES-12-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str487("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str488("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str489("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str490("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str491("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str492("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str493("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str494("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str495("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str496("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str497("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str498("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str499("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str500("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str501("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str502("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str503("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str504("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str505("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str506("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str507("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str508("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str509("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str510("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str511("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str512("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str513("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str514("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str515("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str516("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str517("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str518("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str519("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str520("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str521("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str522("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str523("TYPES-CLASSES-12-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str524("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str525("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str526("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str527("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str528("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str529("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str530("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str531("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str532("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str533("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str534("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str535("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str536("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str537("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str538("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str539("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str540("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str541("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str542("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str543("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str544("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str545("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str546("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str547("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str549("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str550("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str551("BASE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str552("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str553("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str554("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str555("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str556("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str557("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str558("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str559("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str560("TYPES-CLASSES-13-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str561("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str562("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str563("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str564("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str565("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str566("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str567("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str568("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str569("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str570("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str571("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str572("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str573("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str574("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str575("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str577("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str578("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str579("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str580("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str581("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str582("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str583("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str584("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str585("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str586("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str587("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str588("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str589("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str590("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str591("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str592("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str593("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str594("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str595("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str596("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str597("TYPES-CLASSES-13-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str598("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str599("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str600("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str601("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str602("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str603("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str604("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str605("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str606("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str607("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str608("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str609("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str610("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str611("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str612("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str613("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str614("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str615("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str616("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str617("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str618("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str619("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str620("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str621("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str622("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str623("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str624("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str625("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str626("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str627("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str628("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str629("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str630("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str631("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str632("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str633("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str634("TYPES-CLASSES-14-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str635("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str636("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str637("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str638("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str639("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str640("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str641("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str642("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str643("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str644("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str645("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str646("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str647("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str648("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str649("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str650("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str651("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str652("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str653("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str654("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str655("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str656("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str657("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str658("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str659("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str660("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str661("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str662("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str663("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str664("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str665("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str666("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str667("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str668("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str669("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str670("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str671("TYPES-CLASSES-14-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str672("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str673("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str674("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str675("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str676("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str677("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str678("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str679("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str680("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str681("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str682("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str683("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str684("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str685("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str686("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str687("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str688("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str689("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str690("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str691("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str692("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str693("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str694("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str695("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str696("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str697("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str698("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str699("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str700("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str701("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str702("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str703("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str704("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str705("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str706("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str707("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str708("TYPES-CLASSES-15-A\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str709("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str710("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str711("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str712("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str713("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str714("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str715("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str716("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str717("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str718("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str719("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str720("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str721("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str722("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str723("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str724("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str725("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str726("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str727("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str728("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str729("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str730("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str731("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str732("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str733("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str734("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str735("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str736("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str737("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str738("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str739("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str740("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str741("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str742("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str743("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str744("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str745("TYPES-CLASSES-15-B\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str746("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str747("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str748("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str749("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str750("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str751("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str752("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str753("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str754("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str755("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str756("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str757("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str758("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str759("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str760("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str761("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str762("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str763("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str764("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str765("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str766("ST\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str767("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str768("VP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str769("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str770("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str771("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str772("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str773("BIT-VECTOR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str774("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str775("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str776("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str777("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str778("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str779("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str780("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str781("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str782("SUBTYPEP-BUG-979\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str783("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str784("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str785("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str786("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str787("CONS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str788("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str789("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str790("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str791("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str792("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str793("MEMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str794("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str795("REAL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str796("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str797("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str798("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str799("CONS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str800("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str801("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str802("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str803("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str804("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str805("MEMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str806("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str807("REAL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str808("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str809("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str810("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str811("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str812("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str813("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str814("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str815("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str816("lock\0Acondition-variable\0Acounter\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str817("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str818("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str819("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str820("*__MLIR_BLOCK_RETFLAG_206494159077407*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str821("*__MLIR_BLOCK_RETVALUE_206494159077407*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str822("*__MLIR_BLOCK_RETMVLIST_206494159077407*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str823("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str824("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str825("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str826("STRUCTURE-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str827("si::mark-hash-table-structure\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str828("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str829("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str830("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str831("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str832("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str833("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str834("OBJ\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str835("*__MLIR_BLOCK_RETFLAG_206494159077407*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str836("*__MLIR_BLOCK_RETMVLIST_206494159077407*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str837("lock\0Acondition-variable\0Acounter\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str838("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str839("%FN%make-%semaphore\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str840("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str841("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str842("%SEMAPHORE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str843("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str844("*__MLIR_BLOCK_RETFLAG_206494159077408*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str845("*__MLIR_BLOCK_RETVALUE_206494159077408*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str846("*__MLIR_BLOCK_RETMVLIST_206494159077408*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str847("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str848("*__MLIR_BLOCK_RETFLAG_206494159077408*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str849("*__MLIR_BLOCK_RETMVLIST_206494159077408*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str850("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str851("%SEMAPHORE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str852("%FN%%semaphore-p\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str853("%SEMAPHORE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str854("%SEMAPHORE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str855("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str856("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str857("*__MLIR_BLOCK_RETFLAG_206494159077409*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str858("*__MLIR_BLOCK_RETVALUE_206494159077409*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str859("*__MLIR_BLOCK_RETMVLIST_206494159077409*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str860("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str861("*__MLIR_BLOCK_RETFLAG_206494159077409*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str862("*__MLIR_BLOCK_RETMVLIST_206494159077409*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str863("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str864("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str865("%FN%%semaphore-lock\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str866("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str867("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str868("(SETF %SEMAPHORE-LOCK)\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str869("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str870("*__MLIR_BLOCK_RETFLAG_206494159077410*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str871("*__MLIR_BLOCK_RETVALUE_206494159077410*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str872("*__MLIR_BLOCK_RETMVLIST_206494159077410*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str873("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str874("*__MLIR_BLOCK_RETFLAG_206494159077410*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str875("*__MLIR_BLOCK_RETMVLIST_206494159077410*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str876("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str877("(SETF %SEMAPHORE-LOCK)\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str878("%FN%(setf %semaphore-lock)\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str879("(SETF %SEMAPHORE-LOCK)\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str880("(SETF %SEMAPHORE-LOCK)\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str881("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str882("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str883("*__MLIR_BLOCK_RETFLAG_206494159077411*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str884("*__MLIR_BLOCK_RETVALUE_206494159077411*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str885("*__MLIR_BLOCK_RETMVLIST_206494159077411*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str886("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str887("*__MLIR_BLOCK_RETFLAG_206494159077411*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str888("*__MLIR_BLOCK_RETMVLIST_206494159077411*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str889("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str890("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str891("%FN%%semaphore-condition-variable\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str892("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str893("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str894("(SETF %SEMAPHORE-CONDITION-VARIABLE)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str895("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str896("*__MLIR_BLOCK_RETFLAG_206494159077412*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str897("*__MLIR_BLOCK_RETVALUE_206494159077412*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str898("*__MLIR_BLOCK_RETMVLIST_206494159077412*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str899("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str900("*__MLIR_BLOCK_RETFLAG_206494159077412*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str901("*__MLIR_BLOCK_RETMVLIST_206494159077412*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str902("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str903("(SETF %SEMAPHORE-CONDITION-VARIABLE)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str904("%FN%(setf %semaphore-condition-variable)\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str905("(SETF %SEMAPHORE-CONDITION-VARIABLE)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str906("(SETF %SEMAPHORE-CONDITION-VARIABLE)\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str907("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str908("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str909("*__MLIR_BLOCK_RETFLAG_206494159077413*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str910("*__MLIR_BLOCK_RETVALUE_206494159077413*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str911("*__MLIR_BLOCK_RETMVLIST_206494159077413*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str912("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str913("*__MLIR_BLOCK_RETFLAG_206494159077413*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str914("*__MLIR_BLOCK_RETMVLIST_206494159077413*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str915("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str916("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str917("%FN%%semaphore-counter\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str918("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str919("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str920("(SETF %SEMAPHORE-COUNTER)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str921("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str922("*__MLIR_BLOCK_RETFLAG_206494159077414*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str923("*__MLIR_BLOCK_RETVALUE_206494159077414*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str924("*__MLIR_BLOCK_RETMVLIST_206494159077414*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str925("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str926("*__MLIR_BLOCK_RETFLAG_206494159077414*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str927("*__MLIR_BLOCK_RETMVLIST_206494159077414*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str928("new-value\0Aobj\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str929("(SETF %SEMAPHORE-COUNTER)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str930("%FN%(setf %semaphore-counter)\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str931("(SETF %SEMAPHORE-COUNTER)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str932("(SETF %SEMAPHORE-COUNTER)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str933("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str934("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str935("CONDITION-VARIABLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str936("COUNTER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str937("%SEMAPHORE-LOCK\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str938("%SEMAPHORE-CONDITION-VARIABLE\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str939("%SEMAPHORE-COUNTER\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str940("HASH-TABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str941("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str942("STRUCTURE-OBJECT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str943("si::register-struct-definition\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str944("COPY-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str945("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str946("*__MLIR_BLOCK_RETFLAG_206494159077415*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str947("*__MLIR_BLOCK_RETVALUE_206494159077415*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str948("*__MLIR_BLOCK_RETMVLIST_206494159077415*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str949("copy-hash-table\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str950("*__MLIR_BLOCK_RETFLAG_206494159077415*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str951("*__MLIR_BLOCK_RETMVLIST_206494159077415*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str952("obj\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str953("COPY-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str954("%FN%copy-%semaphore\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str955("COPY-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str956("COPY-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str957("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str958("SEMAPHORE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str959("%SEMAPHORE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str960("register-deftype-alias\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str961("%FN%semaphore-p\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str962("SEMAPHORE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str963("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str964("%FN%semaphore-p\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str965("SEMAPHORE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str966("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str967("%FN%semaphore-p\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str968("SEMAPHORE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str969("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str970("%FN%semaphore-p\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str971("SEMAPHORE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str972("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str973("ISSUE-1252\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str974("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str975("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str976("SEMAPHORE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str977("MAKE-%SEMAPHORE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str978("%FN%make-%semaphore\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str979("%FN%semaphore-p\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str980("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str981("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str982("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str983("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str984("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str985("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str986("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str987("GESTURE-NAME\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str988("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str989("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str990("register-deftype-alias\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str991("ISSUE-1252A\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str992("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str993("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str994("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str995("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str996("ABORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str997("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str998("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str999("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1000("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1001("GESTURE-NAME\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1002("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1003("ABORT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1004("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1005("GESTURE-NAME\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str1006("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str1007("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1008("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1009("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1010("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1011("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1012("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1013("ISSUE-1308\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str1014("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str1015("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str1016("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str1017("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1018("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1019("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1020("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1021("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1022("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1023("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str1024("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1025("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1026("ARRAY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1027("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1028("*\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str1029("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1030("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str1031("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1032("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1033("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str1034("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1035("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1036("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1037("*__MLIR_BLOCK_RETFLAG_206494159077378*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str1038("*__MLIR_BLOCK_RETMVLIST_206494159077378*\00") : !llvm.array<41 x i8>
  llvm.mlir.global constant @__argslist_functions("%FN%make-%semaphore\00%FN%make-%semaphore\00\00") : !llvm.array<41 x i8>
}
