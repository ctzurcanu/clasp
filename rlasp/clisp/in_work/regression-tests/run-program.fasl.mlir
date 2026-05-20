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
  func.func @"%FN%slurp"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 5 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 18 : i64
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
    func.call @stack_push_nil() : () -> ()
    %70 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %71 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %72 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %73 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %74 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %75 = func.call @stack_pop_pointer() : () -> i64
    %76 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%76) : (i64) -> ()
    %77 = func.call @stack_pop_pointer() : () -> i64
    %78 = func.call @cc_nil_value() : () -> i64
    %79 = func.call @cc_nil_value() : () -> i64
    %80 = func.call @cc_errorp(%78) : (i64) -> i64
    %81 = arith.cmpi ne, %80, %79 : i64
    %82 = scf.if %81 -> (i64) {
      scf.yield %78 : i64
    } else {
      %83 = func.call @cc_nil_value() : () -> i64
      %84 = llvm.mlir.addressof @str8 : !llvm.ptr
      %85 = arith.constant 38 : i64
      %86 = func.call @cc_make_string(%84, %85) : (!llvm.ptr, i64) -> i64
      %87 = func.call @cc_nil_value() : () -> i64
      %88 = func.call @cc_intern(%86, %87) : (i64, i64) -> i64
      %89 = func.call @cc_nil_value() : () -> i64
      %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
      %91 = func.call @cc_values_pack(%90) : (i64) -> i64
      %92 = func.call @cc_set_symbol_value(%88, %83) : (i64, i64) -> i64
      %93 = llvm.mlir.addressof @str9 : !llvm.ptr
      %94 = arith.constant 39 : i64
      %95 = func.call @cc_make_string(%93, %94) : (!llvm.ptr, i64) -> i64
      %96 = func.call @cc_nil_value() : () -> i64
      %97 = func.call @cc_intern(%95, %96) : (i64, i64) -> i64
      %98 = func.call @cc_nil_value() : () -> i64
      %99 = func.call @cc_cons(%97, %98) : (i64, i64) -> i64
      %100 = func.call @cc_values_pack(%99) : (i64) -> i64
      %101 = func.call @cc_set_symbol_value(%97, %83) : (i64, i64) -> i64
      %102 = llvm.mlir.addressof @str10 : !llvm.ptr
      %103 = arith.constant 40 : i64
      %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
      %105 = func.call @cc_nil_value() : () -> i64
      %106 = func.call @cc_intern(%104, %105) : (i64, i64) -> i64
      %107 = func.call @cc_nil_value() : () -> i64
      %108 = func.call @cc_cons(%106, %107) : (i64, i64) -> i64
      %109 = func.call @cc_values_pack(%108) : (i64) -> i64
      %110 = func.call @cc_set_symbol_value(%106, %83) : (i64, i64) -> i64
      %111:4 = scf.while (%arg0 = %70, %arg1 = %71, %arg2 = %72, %arg3 = %77) : (i64, i64, i64, i64) -> (i64, i64, i64, i64) {
        %112 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%arg2) : (i64) -> ()
        %113 = func.call @stack_pop_pointer() : () -> i64
        %114 = func.call @cc_nil_value() : () -> i64
        %115 = func.call @cc_cons(%113, %114) : (i64, i64) -> i64
        %116 = func.call @cc_not(%115) : (i64) -> i64
        func.call @stack_push_pointer(%116) : (i64) -> ()
        %117 = func.call @stack_pop_pointer() : () -> i64
        %118 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%118) : (i64) -> ()
        %119 = func.call @stack_pop_pointer() : () -> i64
        %120 = func.call @cc_cons(%119, %112) : (i64, i64) -> i64
        %121 = func.call @cc_cons(%117, %120) : (i64, i64) -> i64
        %122 = func.call @cc_and(%121) : (i64) -> i64
        func.call @stack_push_pointer(%122) : (i64) -> ()
        %123 = func.call @stack_pop_pointer() : () -> i64
        %124 = func.call @cc_nil_value() : () -> i64
        %125 = arith.cmpi ne, %123, %124 : i64
        %126 = func.call @cc_nil_value() : () -> i64
        %127 = llvm.mlir.addressof @str11 : !llvm.ptr
        %128 = arith.constant 38 : i64
        %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
        %130 = func.call @cc_nil_value() : () -> i64
        %131 = func.call @cc_intern(%129, %130) : (i64, i64) -> i64
        %132 = func.call @cc_nil_value() : () -> i64
        %133 = func.call @cc_cons(%131, %132) : (i64, i64) -> i64
        %134 = func.call @cc_values_pack(%133) : (i64) -> i64
        %135 = func.call @cc_symbol_value(%131) : (i64) -> i64
        %136 = arith.cmpi ne, %135, %126 : i64
        %137 = llvm.mlir.addressof @str12 : !llvm.ptr
        %138 = arith.constant 38 : i64
        %139 = func.call @cc_make_string(%137, %138) : (!llvm.ptr, i64) -> i64
        %140 = func.call @cc_nil_value() : () -> i64
        %141 = func.call @cc_intern(%139, %140) : (i64, i64) -> i64
        %142 = func.call @cc_nil_value() : () -> i64
        %143 = func.call @cc_cons(%141, %142) : (i64, i64) -> i64
        %144 = func.call @cc_values_pack(%143) : (i64) -> i64
        %145 = func.call @cc_symbol_value(%141) : (i64) -> i64
        %146 = arith.cmpi ne, %145, %126 : i64
        %147 = arith.ori %136, %146 : i1
        %148 = llvm.mlir.addressof @str13 : !llvm.ptr
        %149 = arith.constant 38 : i64
        %150 = func.call @cc_make_string(%148, %149) : (!llvm.ptr, i64) -> i64
        %151 = func.call @cc_nil_value() : () -> i64
        %152 = func.call @cc_intern(%150, %151) : (i64, i64) -> i64
        %153 = func.call @cc_nil_value() : () -> i64
        %154 = func.call @cc_cons(%152, %153) : (i64, i64) -> i64
        %155 = func.call @cc_values_pack(%154) : (i64) -> i64
        %156 = func.call @cc_symbol_value(%152) : (i64) -> i64
        %157 = arith.cmpi ne, %156, %126 : i64
        %158 = arith.ori %147, %157 : i1
        %159 = arith.constant 0 : i1
        %160 = arith.cmpi eq, %158, %159 : i1
        %161 = arith.andi %125, %160 : i1
        scf.condition(%161) %arg0, %arg1, %arg2, %arg3 : i64, i64, i64, i64
      } do {
        ^bb0(%162: i64, %163: i64, %164: i64, %165: i64):
        func.call @stack_push_pointer(%165) : (i64) -> ()
        %166 = func.call @stack_pop_pointer() : () -> i64
        %167 = func.call @cc_nil_value() : () -> i64
        %168 = arith.cmpi ne, %166, %167 : i64
        %169:2 = scf.if %168 -> (i64, i64) {
          func.call @stack_push_nil() : () -> ()
          %170 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%170) : (i64) -> ()
          %171 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %171, %170 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %172 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %172, %162 : i64, i64
        }
        func.call @stack_push_pointer(%169#0) : (i64) -> ()
        %173 = func.call @stack_depth() : () -> i64
        %174 = arith.constant 0 : i64
        %175 = arith.cmpi sgt, %173, %174 : i64
        scf.if %175 {
          %176 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%13) : (i64) -> ()
        %177 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %178 = func.call @stack_pop_pointer() : () -> i64
        %179 = llvm.mlir.addressof @str14 : !llvm.ptr
        %180 = arith.constant 3 : i64
        %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
        %182 = llvm.mlir.addressof @str15 : !llvm.ptr
        %183 = arith.constant 7 : i64
        %184 = func.call @cc_make_string(%182, %183) : (!llvm.ptr, i64) -> i64
        %185 = func.call @cc_intern(%181, %184) : (i64, i64) -> i64
        %186 = func.call @cc_nil_value() : () -> i64
        %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
        %188 = func.call @cc_values_pack(%187) : (i64) -> i64
        func.call @stack_push_pointer(%185) : (i64) -> ()
        %189 = func.call @stack_pop_pointer() : () -> i64
        %190 = func.call @cc_nil_value() : () -> i64
        %191 = func.call @cc_errorp(%177) : (i64) -> i64
        %192 = arith.cmpi ne, %191, %190 : i64
        %193 = arith.cmpi eq, %190, %190 : i64
        %194 = arith.andi %192, %193 : i1
        %195 = scf.if %194 -> (i64) {
          scf.yield %177 : i64
        } else {
          scf.yield %190 : i64
        }
        %196 = func.call @cc_errorp(%178) : (i64) -> i64
        %197 = arith.cmpi ne, %196, %190 : i64
        %198 = arith.cmpi eq, %195, %190 : i64
        %199 = arith.andi %197, %198 : i1
        %200 = scf.if %199 -> (i64) {
          scf.yield %178 : i64
        } else {
          scf.yield %195 : i64
        }
        %201 = func.call @cc_errorp(%189) : (i64) -> i64
        %202 = arith.cmpi ne, %201, %190 : i64
        %203 = arith.cmpi eq, %200, %190 : i64
        %204 = arith.andi %202, %203 : i1
        %205 = scf.if %204 -> (i64) {
          scf.yield %189 : i64
        } else {
          scf.yield %200 : i64
        }
        %206 = arith.cmpi ne, %205, %190 : i64
        scf.if %206 {
          func.call @stack_push_pointer(%205) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%177) : (i64) -> ()
          func.call @stack_push_pointer(%178) : (i64) -> ()
          func.call @stack_push_pointer(%189) : (i64) -> ()
          %207 = llvm.mlir.addressof @str16 : !llvm.ptr
          %208 = func.call @cc_make_function_ref_const(%207) : (!llvm.ptr) -> i64
          %209 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%208, %209) : (i64, i64) -> ()
        }
        %210 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%210) : (i64) -> ()
        %211 = func.call @stack_depth() : () -> i64
        %212 = arith.constant 0 : i64
        %213 = arith.cmpi sgt, %211, %212 : i64
        scf.if %213 {
          %214 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%210) : (i64) -> ()
        %215 = llvm.mlir.addressof @str17 : !llvm.ptr
        %216 = arith.constant 3 : i64
        %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
        %218 = llvm.mlir.addressof @str18 : !llvm.ptr
        %219 = arith.constant 7 : i64
        %220 = func.call @cc_make_string(%218, %219) : (!llvm.ptr, i64) -> i64
        %221 = func.call @cc_intern(%217, %220) : (i64, i64) -> i64
        %222 = func.call @cc_nil_value() : () -> i64
        %223 = func.call @cc_cons(%221, %222) : (i64, i64) -> i64
        %224 = func.call @cc_values_pack(%223) : (i64) -> i64
        func.call @stack_push_pointer(%221) : (i64) -> ()
        %225 = func.call @stack_pop_pointer() : () -> i64
        %226 = func.call @stack_pop_pointer() : () -> i64
        %227 = func.call @cc_eq(%226, %225) : (i64, i64) -> i64
        func.call @stack_push_pointer(%227) : (i64) -> ()
        %228 = func.call @stack_pop_pointer() : () -> i64
        %229 = func.call @cc_nil_value() : () -> i64
        %230 = func.call @cc_cons(%228, %229) : (i64, i64) -> i64
        %231 = func.call @cc_not(%230) : (i64) -> i64
        func.call @stack_push_pointer(%231) : (i64) -> ()
        %232 = func.call @stack_pop_pointer() : () -> i64
        %233 = func.call @cc_nil_value() : () -> i64
        %234 = arith.cmpi ne, %232, %233 : i64
        %235:2 = scf.if %234 -> (i64, i64) {
          func.call @stack_push_nil() : () -> ()
          %236 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %236, %164 : i64, i64
        } else {
          %237 = func.call @cc_nil_value() : () -> i64
          %238 = func.call @cc_nil_value() : () -> i64
          %239 = func.call @cc_errorp(%237) : (i64) -> i64
          %240 = arith.cmpi ne, %239, %238 : i64
          %241:2 = scf.if %240 -> (i64, i64) {
            scf.yield %237, %164 : i64, i64
          } else {
            %242 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%242) : (i64) -> ()
            %243 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%243) : (i64) -> ()
            %244 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %244, %243 : i64, i64
          }
          func.call @stack_push_pointer(%241#0) : (i64) -> ()
          %245 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %245, %241#1 : i64, i64
        }
        func.call @stack_push_pointer(%235#0) : (i64) -> ()
        %246 = func.call @stack_depth() : () -> i64
        %247 = arith.constant 0 : i64
        %248 = arith.cmpi sgt, %246, %247 : i64
        scf.if %248 {
          %249 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%235#1) : (i64) -> ()
        %250 = func.call @stack_pop_pointer() : () -> i64
        %251 = func.call @cc_nil_value() : () -> i64
        %252 = arith.cmpi ne, %250, %251 : i64
        %253:2 = scf.if %252 -> (i64, i64) {
          func.call @stack_push_nil() : () -> ()
          %254 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %254, %169#1 : i64, i64
        } else {
          func.call @stack_push_pointer(%210) : (i64) -> ()
          %255 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%255) : (i64) -> ()
          %256 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %256, %255 : i64, i64
        }
        func.call @stack_push_pointer(%253#0) : (i64) -> ()
        %257 = func.call @stack_depth() : () -> i64
        %258 = arith.constant 0 : i64
        %259 = arith.cmpi sgt, %257, %258 : i64
        scf.if %259 {
          %260 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%235#1) : (i64) -> ()
        %261 = func.call @stack_pop_pointer() : () -> i64
        %262 = func.call @cc_nil_value() : () -> i64
        %263 = arith.cmpi ne, %261, %262 : i64
        %264:2 = scf.if %263 -> (i64, i64) {
          func.call @stack_push_nil() : () -> ()
          %265 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %265, %165 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %266 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%266) : (i64) -> ()
          %267 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %267, %266 : i64, i64
        }
        func.call @stack_push_pointer(%264#0) : (i64) -> ()
        %268 = func.call @stack_depth() : () -> i64
        %269 = arith.constant 0 : i64
        %270 = arith.cmpi sgt, %268, %269 : i64
        scf.if %270 {
          %271 = func.call @stack_pop_pointer() : () -> i64
        }
        scf.yield %253#1, %210, %235#1, %264#1 : i64, i64, i64, i64
      }
      func.call @stack_push_nil() : () -> ()
      %272 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%73) : (i64) -> ()
      %273 = func.call @stack_pop_pointer() : () -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = arith.cmpi ne, %273, %274 : i64
      scf.if %275 {
        func.call @stack_push_pointer(%75) : (i64) -> ()
        %276 = func.call @stack_pop_pointer() : () -> i64
        %277 = func.call @cc_values_pack(%276) : (i64) -> i64
        func.call @stack_push_pointer(%277) : (i64) -> ()
      } else {
        %278 = func.call @cc_nil_value() : () -> i64
        %279 = func.call @cc_nil_value() : () -> i64
        %280 = func.call @cc_errorp(%278) : (i64) -> i64
        %281 = arith.cmpi ne, %280, %279 : i64
        %282 = scf.if %281 -> (i64) {
          scf.yield %278 : i64
        } else {
          func.call @stack_push_pointer(%111#0) : (i64) -> ()
          %283 = func.call @stack_pop_pointer() : () -> i64
          %284 = func.call @cc_multiple_value_list(%283) : (i64) -> i64
          %285 = func.call @cc_t_value() : () -> i64
          %286 = llvm.mlir.addressof @str19 : !llvm.ptr
          %287 = arith.constant 38 : i64
          %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
          %289 = func.call @cc_nil_value() : () -> i64
          %290 = func.call @cc_intern(%288, %289) : (i64, i64) -> i64
          %291 = func.call @cc_nil_value() : () -> i64
          %292 = func.call @cc_cons(%290, %291) : (i64, i64) -> i64
          %293 = func.call @cc_values_pack(%292) : (i64) -> i64
          %294 = func.call @cc_set_symbol_value(%290, %285) : (i64, i64) -> i64
          %295 = llvm.mlir.addressof @str20 : !llvm.ptr
          %296 = arith.constant 39 : i64
          %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
          %298 = func.call @cc_nil_value() : () -> i64
          %299 = func.call @cc_intern(%297, %298) : (i64, i64) -> i64
          %300 = func.call @cc_nil_value() : () -> i64
          %301 = func.call @cc_cons(%299, %300) : (i64, i64) -> i64
          %302 = func.call @cc_values_pack(%301) : (i64) -> i64
          %303 = func.call @cc_set_symbol_value(%299, %283) : (i64, i64) -> i64
          %304 = llvm.mlir.addressof @str21 : !llvm.ptr
          %305 = arith.constant 40 : i64
          %306 = func.call @cc_make_string(%304, %305) : (!llvm.ptr, i64) -> i64
          %307 = func.call @cc_nil_value() : () -> i64
          %308 = func.call @cc_intern(%306, %307) : (i64, i64) -> i64
          %309 = func.call @cc_nil_value() : () -> i64
          %310 = func.call @cc_cons(%308, %309) : (i64, i64) -> i64
          %311 = func.call @cc_values_pack(%310) : (i64) -> i64
          %312 = func.call @cc_set_symbol_value(%308, %284) : (i64, i64) -> i64
          func.call @stack_push_pointer(%283) : (i64) -> ()
          %313 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %313 : i64
        }
        func.call @stack_push_pointer(%282) : (i64) -> ()
      }
      %314 = func.call @stack_pop_pointer() : () -> i64
      %315 = func.call @cc_multiple_value_list(%314) : (i64) -> i64
      %316 = llvm.mlir.addressof @str22 : !llvm.ptr
      %317 = arith.constant 38 : i64
      %318 = func.call @cc_make_string(%316, %317) : (!llvm.ptr, i64) -> i64
      %319 = func.call @cc_nil_value() : () -> i64
      %320 = func.call @cc_intern(%318, %319) : (i64, i64) -> i64
      %321 = func.call @cc_nil_value() : () -> i64
      %322 = func.call @cc_cons(%320, %321) : (i64, i64) -> i64
      %323 = func.call @cc_values_pack(%322) : (i64) -> i64
      %324 = func.call @cc_symbol_value(%320) : (i64) -> i64
      %325 = llvm.mlir.addressof @str23 : !llvm.ptr
      %326 = arith.constant 39 : i64
      %327 = func.call @cc_make_string(%325, %326) : (!llvm.ptr, i64) -> i64
      %328 = func.call @cc_nil_value() : () -> i64
      %329 = func.call @cc_intern(%327, %328) : (i64, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_cons(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_values_pack(%331) : (i64) -> i64
      %333 = func.call @cc_symbol_value(%329) : (i64) -> i64
      %334 = llvm.mlir.addressof @str24 : !llvm.ptr
      %335 = arith.constant 40 : i64
      %336 = func.call @cc_make_string(%334, %335) : (!llvm.ptr, i64) -> i64
      %337 = func.call @cc_nil_value() : () -> i64
      %338 = func.call @cc_intern(%336, %337) : (i64, i64) -> i64
      %339 = func.call @cc_nil_value() : () -> i64
      %340 = func.call @cc_cons(%338, %339) : (i64, i64) -> i64
      %341 = func.call @cc_values_pack(%340) : (i64) -> i64
      %342 = func.call @cc_symbol_value(%338) : (i64) -> i64
      %343 = func.call @cc_nil_value() : () -> i64
      %344 = arith.cmpi ne, %324, %343 : i64
      %345 = scf.if %344 -> (i64) {
        scf.yield %342 : i64
      } else {
        scf.yield %315 : i64
      }
      %346 = func.call @cc_values_pack(%345) : (i64) -> i64
      func.call @stack_push_pointer(%346) : (i64) -> ()
      %347 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %347 : i64
    }
    func.call @stack_push_pointer(%82) : (i64) -> ()
    %348 = func.call @stack_pop_pointer() : () -> i64
    %349 = func.call @cc_multiple_value_list(%348) : (i64) -> i64
    %350 = llvm.mlir.addressof @str25 : !llvm.ptr
    %351 = arith.constant 38 : i64
    %352 = func.call @cc_make_string(%350, %351) : (!llvm.ptr, i64) -> i64
    %353 = func.call @cc_nil_value() : () -> i64
    %354 = func.call @cc_intern(%352, %353) : (i64, i64) -> i64
    %355 = func.call @cc_nil_value() : () -> i64
    %356 = func.call @cc_cons(%354, %355) : (i64, i64) -> i64
    %357 = func.call @cc_values_pack(%356) : (i64) -> i64
    %358 = func.call @cc_symbol_value(%354) : (i64) -> i64
    %359 = llvm.mlir.addressof @str26 : !llvm.ptr
    %360 = arith.constant 39 : i64
    %361 = func.call @cc_make_string(%359, %360) : (!llvm.ptr, i64) -> i64
    %362 = func.call @cc_nil_value() : () -> i64
    %363 = func.call @cc_intern(%361, %362) : (i64, i64) -> i64
    %364 = func.call @cc_nil_value() : () -> i64
    %365 = func.call @cc_cons(%363, %364) : (i64, i64) -> i64
    %366 = func.call @cc_values_pack(%365) : (i64) -> i64
    %367 = func.call @cc_symbol_value(%363) : (i64) -> i64
    %368 = llvm.mlir.addressof @str27 : !llvm.ptr
    %369 = arith.constant 40 : i64
    %370 = func.call @cc_make_string(%368, %369) : (!llvm.ptr, i64) -> i64
    %371 = func.call @cc_nil_value() : () -> i64
    %372 = func.call @cc_intern(%370, %371) : (i64, i64) -> i64
    %373 = func.call @cc_nil_value() : () -> i64
    %374 = func.call @cc_cons(%372, %373) : (i64, i64) -> i64
    %375 = func.call @cc_values_pack(%374) : (i64) -> i64
    %376 = func.call @cc_symbol_value(%372) : (i64) -> i64
    %377 = func.call @cc_nil_value() : () -> i64
    %378 = arith.cmpi ne, %358, %377 : i64
    %379 = scf.if %378 -> (i64) {
      scf.yield %376 : i64
    } else {
      scf.yield %349 : i64
    }
    %380 = func.call @cc_values_pack(%379) : (i64) -> i64
    func.call @stack_push_pointer(%380) : (i64) -> ()
    %381 = func.call @stack_pop_pointer() : () -> i64
    %382 = func.call @cc_multiple_value_list(%381) : (i64) -> i64
    %383 = llvm.mlir.addressof @str28 : !llvm.ptr
    %384 = arith.constant 38 : i64
    %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
    %386 = func.call @cc_nil_value() : () -> i64
    %387 = func.call @cc_intern(%385, %386) : (i64, i64) -> i64
    %388 = func.call @cc_nil_value() : () -> i64
    %389 = func.call @cc_cons(%387, %388) : (i64, i64) -> i64
    %390 = func.call @cc_values_pack(%389) : (i64) -> i64
    %391 = func.call @cc_symbol_value(%387) : (i64) -> i64
    %392 = llvm.mlir.addressof @str29 : !llvm.ptr
    %393 = arith.constant 40 : i64
    %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
    %395 = func.call @cc_nil_value() : () -> i64
    %396 = func.call @cc_intern(%394, %395) : (i64, i64) -> i64
    %397 = func.call @cc_nil_value() : () -> i64
    %398 = func.call @cc_cons(%396, %397) : (i64, i64) -> i64
    %399 = func.call @cc_values_pack(%398) : (i64) -> i64
    %400 = func.call @cc_symbol_value(%396) : (i64) -> i64
    %401 = func.call @cc_nil_value() : () -> i64
    %402 = arith.cmpi ne, %391, %401 : i64
    %403 = scf.if %402 -> (i64) {
      scf.yield %400 : i64
    } else {
      scf.yield %382 : i64
    }
    %404 = func.call @cc_values_pack(%403) : (i64) -> i64
    func.call @stack_push_pointer(%404) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %405 = llvm.mlir.addressof @str30 : !llvm.ptr
    %406 = arith.constant 6 : i64
    %407 = func.call @cc_make_string(%405, %406) : (!llvm.ptr, i64) -> i64
    %408 = func.call @cc_nil_value() : () -> i64
    %409 = func.call @cc_intern(%407, %408) : (i64, i64) -> i64
    %410 = func.call @cc_nil_value() : () -> i64
    %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
    %412 = func.call @cc_values_pack(%411) : (i64) -> i64
    %413 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%409, %413) : (i64, i64) -> ()
    %414 = func.call @cc_nil_value() : () -> i64
    %415 = llvm.mlir.addressof @str31 : !llvm.ptr
    %416 = arith.constant 38 : i64
    %417 = func.call @cc_make_string(%415, %416) : (!llvm.ptr, i64) -> i64
    %418 = func.call @cc_nil_value() : () -> i64
    %419 = func.call @cc_intern(%417, %418) : (i64, i64) -> i64
    %420 = func.call @cc_nil_value() : () -> i64
    %421 = func.call @cc_cons(%419, %420) : (i64, i64) -> i64
    %422 = func.call @cc_values_pack(%421) : (i64) -> i64
    %423 = func.call @cc_set_symbol_value(%419, %414) : (i64, i64) -> i64
    %424 = llvm.mlir.addressof @str32 : !llvm.ptr
    %425 = arith.constant 39 : i64
    %426 = func.call @cc_make_string(%424, %425) : (!llvm.ptr, i64) -> i64
    %427 = func.call @cc_nil_value() : () -> i64
    %428 = func.call @cc_intern(%426, %427) : (i64, i64) -> i64
    %429 = func.call @cc_nil_value() : () -> i64
    %430 = func.call @cc_cons(%428, %429) : (i64, i64) -> i64
    %431 = func.call @cc_values_pack(%430) : (i64) -> i64
    %432 = func.call @cc_set_symbol_value(%428, %414) : (i64, i64) -> i64
    %433 = llvm.mlir.addressof @str33 : !llvm.ptr
    %434 = arith.constant 40 : i64
    %435 = func.call @cc_make_string(%433, %434) : (!llvm.ptr, i64) -> i64
    %436 = func.call @cc_nil_value() : () -> i64
    %437 = func.call @cc_intern(%435, %436) : (i64, i64) -> i64
    %438 = func.call @cc_nil_value() : () -> i64
    %439 = func.call @cc_cons(%437, %438) : (i64, i64) -> i64
    %440 = func.call @cc_values_pack(%439) : (i64) -> i64
    %441 = func.call @cc_set_symbol_value(%437, %414) : (i64, i64) -> i64
    %442 = func.call @cc_nil_value() : () -> i64
    %443 = func.call @cc_nil_value() : () -> i64
    %444 = func.call @cc_errorp(%442) : (i64) -> i64
    %445 = arith.cmpi ne, %444, %443 : i64
    %446 = scf.if %445 -> (i64) {
      scf.yield %442 : i64
    } else {
      %447 = llvm.mlir.addressof @str34 : !llvm.ptr
      %448 = arith.constant 11 : i64
      %449 = func.call @cc_make_string(%447, %448) : (!llvm.ptr, i64) -> i64
      %450 = func.call @cc_nil_value() : () -> i64
      %451 = func.call @cc_intern(%449, %450) : (i64, i64) -> i64
      %452 = func.call @cc_nil_value() : () -> i64
      %453 = func.call @cc_cons(%451, %452) : (i64, i64) -> i64
      %454 = func.call @cc_values_pack(%453) : (i64) -> i64
      func.call @stack_push_pointer(%451) : (i64) -> ()
      %455 = func.call @stack_pop_pointer() : () -> i64
      %456 = func.call @cc_in_package(%455) : (i64) -> i64
      func.call @stack_push_pointer(%456) : (i64) -> ()
      %457 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %457 : i64
    }
    %458 = func.call @cc_nil_value() : () -> i64
    %459 = func.call @cc_errorp(%446) : (i64) -> i64
    %460 = arith.cmpi ne, %459, %458 : i64
    %461 = scf.if %460 -> (i64) {
      scf.yield %446 : i64
    } else {
      %462 = llvm.mlir.addressof @str35 : !llvm.ptr
      %463 = arith.constant 8 : i64
      %464 = func.call @cc_make_string(%462, %463) : (!llvm.ptr, i64) -> i64
      %465 = func.call @cc_nil_value() : () -> i64
      %466 = func.call @cc_intern(%464, %465) : (i64, i64) -> i64
      %467 = func.call @cc_nil_value() : () -> i64
      %468 = func.call @cc_cons(%466, %467) : (i64, i64) -> i64
      %469 = func.call @cc_values_pack(%468) : (i64) -> i64
      %470 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%470) : (i64) -> ()
      %471 = func.call @stack_pop_pointer() : () -> i64
      %472 = func.call @cc_nil_value() : () -> i64
      %473 = func.call @cc_errorp(%471) : (i64) -> i64
      %474 = arith.cmpi ne, %473, %472 : i64
      %475 = arith.cmpi eq, %472, %472 : i64
      %476 = arith.andi %474, %475 : i1
      %477 = scf.if %476 -> (i64) {
        scf.yield %471 : i64
      } else {
        scf.yield %472 : i64
      }
      %478 = arith.cmpi ne, %477, %472 : i64
      scf.if %478 {
        func.call @stack_push_pointer(%477) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%471) : (i64) -> ()
        %479 = llvm.mlir.addressof @str36 : !llvm.ptr
        %480 = func.call @cc_make_function_ref_const(%479) : (!llvm.ptr) -> i64
        %481 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%480, %481) : (i64, i64) -> ()
      }
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_set_symbol_value(%466, %482) : (i64, i64) -> i64
      %484 = func.call @cc_errorp(%483) : (i64) -> i64
      %485 = func.call @cc_nil_value() : () -> i64
      %486 = arith.cmpi ne, %484, %485 : i64
      scf.if %486 {
        func.call @stack_push_pointer(%483) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%466) : (i64) -> ()
      }
      %487 = func.call @stack_pop_pointer() : () -> i64
      %488 = func.call @cc_nil_value() : () -> i64
      %489 = func.call @cc_errorp(%487) : (i64) -> i64
      %490 = arith.cmpi ne, %489, %488 : i64
      %491 = scf.if %490 -> (i64) {
        scf.yield %487 : i64
      } else {
        %492 = llvm.mlir.addressof @str37 : !llvm.ptr
        %493 = arith.constant 18 : i64
        %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
        %495 = func.call @cc_nil_value() : () -> i64
        %496 = func.call @cc_intern(%494, %495) : (i64, i64) -> i64
        %497 = func.call @cc_nil_value() : () -> i64
        %498 = func.call @cc_cons(%496, %497) : (i64, i64) -> i64
        %499 = func.call @cc_values_pack(%498) : (i64) -> i64
        %500 = llvm.mlir.addressof @str38 : !llvm.ptr
        %501 = arith.constant 60 : i64
        %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%502) : (i64) -> ()
        %503 = func.call @stack_pop_pointer() : () -> i64
        %504 = func.call @cc_set_symbol_value(%496, %503) : (i64, i64) -> i64
        %505 = func.call @cc_errorp(%504) : (i64) -> i64
        %506 = func.call @cc_nil_value() : () -> i64
        %507 = arith.cmpi ne, %505, %506 : i64
        scf.if %507 {
          func.call @stack_push_pointer(%504) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%496) : (i64) -> ()
        }
        %508 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %508 : i64
      }
      func.call @stack_push_pointer(%491) : (i64) -> ()
      %509 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %509 : i64
    }
    %510 = func.call @cc_nil_value() : () -> i64
    %511 = func.call @cc_errorp(%461) : (i64) -> i64
    %512 = arith.cmpi ne, %511, %510 : i64
    %513 = scf.if %512 -> (i64) {
      scf.yield %461 : i64
    } else {
      %514 = llvm.mlir.addressof @str39 : !llvm.ptr
      %515 = func.call @cc_make_function_ref_const(%514) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%515) : (i64) -> ()
      %516 = func.call @stack_pop_pointer() : () -> i64
      %517 = llvm.mlir.addressof @str40 : !llvm.ptr
      %518 = arith.constant 16 : i64
      %519 = func.call @cc_make_string(%517, %518) : (!llvm.ptr, i64) -> i64
      %520 = llvm.mlir.addressof @str41 : !llvm.ptr
      %521 = arith.constant 15 : i64
      %522 = func.call @cc_make_string(%520, %521) : (!llvm.ptr, i64) -> i64
      %523 = func.call @cc_intern(%519, %522) : (i64, i64) -> i64
      %524 = func.call @cc_nil_value() : () -> i64
      %525 = func.call @cc_cons(%523, %524) : (i64, i64) -> i64
      %526 = func.call @cc_values_pack(%525) : (i64) -> i64
      %527 = func.call @cc_set_symbol_value(%523, %516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%516) : (i64) -> ()
      %528 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %528 : i64
    }
    %529 = func.call @cc_nil_value() : () -> i64
    %530 = func.call @cc_errorp(%513) : (i64) -> i64
    %531 = arith.cmpi ne, %530, %529 : i64
    %532 = scf.if %531 -> (i64) {
      scf.yield %513 : i64
    } else {
      %533 = llvm.mlir.addressof @str42 : !llvm.ptr
      %534 = func.call @cc_make_function_ref_const(%533) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%534) : (i64) -> ()
      %535 = func.call @stack_pop_pointer() : () -> i64
      %536 = llvm.mlir.addressof @str43 : !llvm.ptr
      %537 = arith.constant 16 : i64
      %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
      %539 = llvm.mlir.addressof @str44 : !llvm.ptr
      %540 = arith.constant 15 : i64
      %541 = func.call @cc_make_string(%539, %540) : (!llvm.ptr, i64) -> i64
      %542 = func.call @cc_intern(%538, %541) : (i64, i64) -> i64
      %543 = func.call @cc_nil_value() : () -> i64
      %544 = func.call @cc_cons(%542, %543) : (i64, i64) -> i64
      %545 = func.call @cc_values_pack(%544) : (i64) -> i64
      %546 = func.call @cc_set_symbol_value(%542, %535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%535) : (i64) -> ()
      %547 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %547 : i64
    }
    %548 = func.call @cc_nil_value() : () -> i64
    %549 = func.call @cc_errorp(%532) : (i64) -> i64
    %550 = arith.cmpi ne, %549, %548 : i64
    %551 = scf.if %550 -> (i64) {
      scf.yield %532 : i64
    } else {
      %552 = llvm.mlir.addressof @str45 : !llvm.ptr
      %553 = func.call @cc_make_function_ref_const(%552) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%553) : (i64) -> ()
      %554 = func.call @stack_pop_pointer() : () -> i64
      %555 = llvm.mlir.addressof @str46 : !llvm.ptr
      %556 = arith.constant 16 : i64
      %557 = func.call @cc_make_string(%555, %556) : (!llvm.ptr, i64) -> i64
      %558 = llvm.mlir.addressof @str47 : !llvm.ptr
      %559 = arith.constant 15 : i64
      %560 = func.call @cc_make_string(%558, %559) : (!llvm.ptr, i64) -> i64
      %561 = func.call @cc_intern(%557, %560) : (i64, i64) -> i64
      %562 = func.call @cc_nil_value() : () -> i64
      %563 = func.call @cc_cons(%561, %562) : (i64, i64) -> i64
      %564 = func.call @cc_values_pack(%563) : (i64) -> i64
      %565 = func.call @cc_set_symbol_value(%561, %554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%554) : (i64) -> ()
      %566 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %566 : i64
    }
    %567 = func.call @cc_nil_value() : () -> i64
    %568 = func.call @cc_errorp(%551) : (i64) -> i64
    %569 = arith.cmpi ne, %568, %567 : i64
    %570 = scf.if %569 -> (i64) {
      scf.yield %551 : i64
    } else {
      %571 = llvm.mlir.addressof @str48 : !llvm.ptr
      %572 = func.call @cc_make_function_ref_const(%571) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%572) : (i64) -> ()
      %573 = func.call @stack_pop_pointer() : () -> i64
      %574 = llvm.mlir.addressof @str49 : !llvm.ptr
      %575 = arith.constant 16 : i64
      %576 = func.call @cc_make_string(%574, %575) : (!llvm.ptr, i64) -> i64
      %577 = llvm.mlir.addressof @str50 : !llvm.ptr
      %578 = arith.constant 15 : i64
      %579 = func.call @cc_make_string(%577, %578) : (!llvm.ptr, i64) -> i64
      %580 = func.call @cc_intern(%576, %579) : (i64, i64) -> i64
      %581 = func.call @cc_nil_value() : () -> i64
      %582 = func.call @cc_cons(%580, %581) : (i64, i64) -> i64
      %583 = func.call @cc_values_pack(%582) : (i64) -> i64
      %584 = func.call @cc_set_symbol_value(%580, %573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%573) : (i64) -> ()
      %585 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %585 : i64
    }
    %586 = func.call @cc_nil_value() : () -> i64
    %587 = func.call @cc_errorp(%570) : (i64) -> i64
    %588 = arith.cmpi ne, %587, %586 : i64
    %589 = scf.if %588 -> (i64) {
      scf.yield %570 : i64
    } else {
      %590 = llvm.mlir.addressof @str51 : !llvm.ptr
      %591 = func.call @cc_make_function_ref_const(%590) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%591) : (i64) -> ()
      %592 = func.call @stack_pop_pointer() : () -> i64
      %593 = llvm.mlir.addressof @str52 : !llvm.ptr
      %594 = arith.constant 5 : i64
      %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
      %596 = llvm.mlir.addressof @str53 : !llvm.ptr
      %597 = arith.constant 15 : i64
      %598 = func.call @cc_make_string(%596, %597) : (!llvm.ptr, i64) -> i64
      %599 = func.call @cc_intern(%595, %598) : (i64, i64) -> i64
      %600 = func.call @cc_nil_value() : () -> i64
      %601 = func.call @cc_cons(%599, %600) : (i64, i64) -> i64
      %602 = func.call @cc_values_pack(%601) : (i64) -> i64
      %603 = func.call @cc_set_symbol_value(%599, %592) : (i64, i64) -> i64
      func.call @stack_push_pointer(%592) : (i64) -> ()
      %604 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %604 : i64
    }
    %605 = func.call @cc_nil_value() : () -> i64
    %606 = func.call @cc_errorp(%589) : (i64) -> i64
    %607 = arith.cmpi ne, %606, %605 : i64
    %608 = scf.if %607 -> (i64) {
      scf.yield %589 : i64
    } else {
      %609 = llvm.mlir.addressof @str54 : !llvm.ptr
      %610 = func.call @cc_make_function_ref_const(%609) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%610) : (i64) -> ()
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = llvm.mlir.addressof @str55 : !llvm.ptr
      %613 = arith.constant 5 : i64
      %614 = func.call @cc_make_string(%612, %613) : (!llvm.ptr, i64) -> i64
      %615 = llvm.mlir.addressof @str56 : !llvm.ptr
      %616 = arith.constant 15 : i64
      %617 = func.call @cc_make_string(%615, %616) : (!llvm.ptr, i64) -> i64
      %618 = func.call @cc_intern(%614, %617) : (i64, i64) -> i64
      %619 = func.call @cc_nil_value() : () -> i64
      %620 = func.call @cc_cons(%618, %619) : (i64, i64) -> i64
      %621 = func.call @cc_values_pack(%620) : (i64) -> i64
      %622 = func.call @cc_set_symbol_value(%618, %611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%611) : (i64) -> ()
      %623 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %623 : i64
    }
    %624 = func.call @cc_nil_value() : () -> i64
    %625 = func.call @cc_errorp(%608) : (i64) -> i64
    %626 = arith.cmpi ne, %625, %624 : i64
    %627 = scf.if %626 -> (i64) {
      scf.yield %608 : i64
    } else {
      %628 = llvm.mlir.addressof @str57 : !llvm.ptr
      %629 = func.call @cc_make_function_ref_const(%628) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%629) : (i64) -> ()
      %630 = func.call @stack_pop_pointer() : () -> i64
      %631 = llvm.mlir.addressof @str58 : !llvm.ptr
      %632 = arith.constant 5 : i64
      %633 = func.call @cc_make_string(%631, %632) : (!llvm.ptr, i64) -> i64
      %634 = llvm.mlir.addressof @str59 : !llvm.ptr
      %635 = arith.constant 15 : i64
      %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
      %637 = func.call @cc_intern(%633, %636) : (i64, i64) -> i64
      %638 = func.call @cc_nil_value() : () -> i64
      %639 = func.call @cc_cons(%637, %638) : (i64, i64) -> i64
      %640 = func.call @cc_values_pack(%639) : (i64) -> i64
      %641 = func.call @cc_set_symbol_value(%637, %630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%630) : (i64) -> ()
      %642 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %642 : i64
    }
    %643 = func.call @cc_nil_value() : () -> i64
    %644 = func.call @cc_errorp(%627) : (i64) -> i64
    %645 = arith.cmpi ne, %644, %643 : i64
    %646 = scf.if %645 -> (i64) {
      scf.yield %627 : i64
    } else {
      %647 = llvm.mlir.addressof @str60 : !llvm.ptr
      %648 = func.call @cc_make_function_ref_const(%647) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%648) : (i64) -> ()
      %649 = func.call @stack_pop_pointer() : () -> i64
      %650 = llvm.mlir.addressof @str61 : !llvm.ptr
      %651 = arith.constant 5 : i64
      %652 = func.call @cc_make_string(%650, %651) : (!llvm.ptr, i64) -> i64
      %653 = llvm.mlir.addressof @str62 : !llvm.ptr
      %654 = arith.constant 15 : i64
      %655 = func.call @cc_make_string(%653, %654) : (!llvm.ptr, i64) -> i64
      %656 = func.call @cc_intern(%652, %655) : (i64, i64) -> i64
      %657 = func.call @cc_nil_value() : () -> i64
      %658 = func.call @cc_cons(%656, %657) : (i64, i64) -> i64
      %659 = func.call @cc_values_pack(%658) : (i64) -> i64
      %660 = func.call @cc_set_symbol_value(%656, %649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%649) : (i64) -> ()
      %661 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %661 : i64
    }
    %662 = func.call @cc_nil_value() : () -> i64
    %663 = func.call @cc_errorp(%646) : (i64) -> i64
    %664 = arith.cmpi ne, %663, %662 : i64
    %665 = scf.if %664 -> (i64) {
      scf.yield %646 : i64
    } else {
      %666 = llvm.mlir.addressof @str63 : !llvm.ptr
      %667 = arith.constant 20 : i64
      %668 = func.call @cc_make_string(%666, %667) : (!llvm.ptr, i64) -> i64
      %669 = func.call @cc_nil_value() : () -> i64
      %670 = func.call @cc_intern(%668, %669) : (i64, i64) -> i64
      %671 = func.call @cc_nil_value() : () -> i64
      %672 = func.call @cc_cons(%670, %671) : (i64, i64) -> i64
      %673 = func.call @cc_values_pack(%672) : (i64) -> i64
      func.call @stack_push_pointer(%670) : (i64) -> ()
      %674 = func.call @stack_pop_pointer() : () -> i64
      %675 = llvm.mlir.addressof @str64 : !llvm.ptr
      %676 = arith.constant 16 : i64
      %677 = func.call @cc_make_string(%675, %676) : (!llvm.ptr, i64) -> i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = func.call @cc_intern(%677, %678) : (i64, i64) -> i64
      %680 = func.call @cc_nil_value() : () -> i64
      %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
      %682 = func.call @cc_values_pack(%681) : (i64) -> i64
      func.call @stack_push_pointer(%679) : (i64) -> ()
      %683 = llvm.mlir.addressof @str65 : !llvm.ptr
      %684 = arith.constant 13 : i64
      %685 = func.call @cc_make_string(%683, %684) : (!llvm.ptr, i64) -> i64
      %686 = func.call @cc_nil_value() : () -> i64
      %687 = func.call @cc_intern(%685, %686) : (i64, i64) -> i64
      %688 = func.call @cc_nil_value() : () -> i64
      %689 = func.call @cc_cons(%687, %688) : (i64, i64) -> i64
      %690 = func.call @cc_values_pack(%689) : (i64) -> i64
      func.call @stack_push_pointer(%687) : (i64) -> ()
      %691 = llvm.mlir.addressof @str66 : !llvm.ptr
      %692 = arith.constant 1 : i64
      %693 = func.call @cc_make_string(%691, %692) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%693) : (i64) -> ()
      %694 = llvm.mlir.addressof @str67 : !llvm.ptr
      %695 = arith.constant 3 : i64
      %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%696) : (i64) -> ()
      %697 = llvm.mlir.addressof @str68 : !llvm.ptr
      %698 = arith.constant 3 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%699) : (i64) -> ()
      %700 = llvm.mlir.addressof @str69 : !llvm.ptr
      %701 = arith.constant 5 : i64
      %702 = func.call @cc_make_string(%700, %701) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%702) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %703 = func.call @stack_pop_pointer() : () -> i64
      %704 = func.call @stack_pop_pointer() : () -> i64
      %705 = func.call @cc_cons(%704, %703) : (i64, i64) -> i64
      func.call @stack_push_pointer(%705) : (i64) -> ()
      %706 = func.call @stack_pop_pointer() : () -> i64
      %707 = func.call @stack_pop_pointer() : () -> i64
      %708 = func.call @cc_cons(%707, %706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%708) : (i64) -> ()
      %709 = func.call @stack_pop_pointer() : () -> i64
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @cc_cons(%710, %709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%711) : (i64) -> ()
      %712 = func.call @stack_pop_pointer() : () -> i64
      %713 = func.call @stack_pop_pointer() : () -> i64
      %714 = func.call @cc_cons(%713, %712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%714) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %715 = func.call @stack_pop_pointer() : () -> i64
      %716 = func.call @stack_pop_pointer() : () -> i64
      %717 = func.call @cc_cons(%716, %715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%717) : (i64) -> ()
      %718 = func.call @stack_pop_pointer() : () -> i64
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = func.call @cc_cons(%719, %718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%720) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @stack_pop_pointer() : () -> i64
      %723 = func.call @cc_cons(%722, %721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%723) : (i64) -> ()
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @stack_pop_pointer() : () -> i64
      %726 = func.call @cc_cons(%725, %724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%726) : (i64) -> ()
      %727 = func.call @stack_pop_pointer() : () -> i64
      %968 = llvm.mlir.addressof @str97 : !llvm.ptr
      %969 = arith.constant 42 : i64
      %970 = func.call @cc_make_symbol(%968, %969) : (!llvm.ptr, i64) -> i64
      %971 = func.call @cc_persistent_root_value(%970) : (i64) -> i64
      func.call @stack_push_pointer(%971) : (i64) -> ()
      %972 = arith.constant 263377075044356 : i64
      %973 = arith.constant 1 : i64
      %974 = func.call @cc_make_closure(%972, %973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%974) : (i64) -> ()
      %975 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %976 = llvm.mlir.addressof @str98 : !llvm.ptr
      %977 = arith.constant 6 : i64
      %978 = func.call @cc_make_string(%976, %977) : (!llvm.ptr, i64) -> i64
      %979 = llvm.mlir.addressof @str99 : !llvm.ptr
      %980 = arith.constant 7 : i64
      %981 = func.call @cc_make_string(%979, %980) : (!llvm.ptr, i64) -> i64
      %982 = func.call @cc_intern(%978, %981) : (i64, i64) -> i64
      %983 = func.call @cc_nil_value() : () -> i64
      %984 = func.call @cc_cons(%982, %983) : (i64, i64) -> i64
      %985 = func.call @cc_values_pack(%984) : (i64) -> i64
      func.call @stack_push_pointer(%982) : (i64) -> ()
      %986 = arith.constant 19 : i64
      func.call @stack_push_fixnum(%986) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %987 = func.call @stack_pop_pointer() : () -> i64
      %988 = func.call @stack_pop_pointer() : () -> i64
      %989 = func.call @cc_cons(%988, %987) : (i64, i64) -> i64
      func.call @stack_push_pointer(%989) : (i64) -> ()
      %990 = func.call @stack_pop_pointer() : () -> i64
      %991 = func.call @stack_pop_pointer() : () -> i64
      %992 = func.call @cc_cons(%991, %990) : (i64, i64) -> i64
      func.call @stack_push_pointer(%992) : (i64) -> ()
      %993 = func.call @stack_pop_pointer() : () -> i64
      %994 = func.call @stack_pop_pointer() : () -> i64
      %995 = func.call @cc_cons(%994, %993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%995) : (i64) -> ()
      %996 = func.call @stack_pop_pointer() : () -> i64
      %997 = llvm.mlir.addressof @str100 : !llvm.ptr
      %998 = arith.constant 11 : i64
      %999 = func.call @cc_make_string(%997, %998) : (!llvm.ptr, i64) -> i64
      %1000 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1001 = arith.constant 7 : i64
      %1002 = func.call @cc_make_string(%1000, %1001) : (!llvm.ptr, i64) -> i64
      %1003 = func.call @cc_intern(%999, %1002) : (i64, i64) -> i64
      %1004 = func.call @cc_nil_value() : () -> i64
      %1005 = func.call @cc_cons(%1003, %1004) : (i64, i64) -> i64
      %1006 = func.call @cc_values_pack(%1005) : (i64) -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
      %1007 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1010 = arith.constant 4 : i64
      %1011 = func.call @cc_make_string(%1009, %1010) : (!llvm.ptr, i64) -> i64
      %1012 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1013 = arith.constant 7 : i64
      %1014 = func.call @cc_make_string(%1012, %1013) : (!llvm.ptr, i64) -> i64
      %1015 = func.call @cc_intern(%1011, %1014) : (i64, i64) -> i64
      %1016 = func.call @cc_nil_value() : () -> i64
      %1017 = func.call @cc_cons(%1015, %1016) : (i64, i64) -> i64
      %1018 = func.call @cc_values_pack(%1017) : (i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1019 = func.call @stack_pop_pointer() : () -> i64
      %1020 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1021 = arith.constant 6 : i64
      %1022 = func.call @cc_make_string(%1020, %1021) : (!llvm.ptr, i64) -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = func.call @cc_intern(%1022, %1023) : (i64, i64) -> i64
      %1025 = func.call @cc_nil_value() : () -> i64
      %1026 = func.call @cc_cons(%1024, %1025) : (i64, i64) -> i64
      %1027 = func.call @cc_values_pack(%1026) : (i64) -> i64
      func.call @stack_push_pointer(%1024) : (i64) -> ()
      %1028 = func.call @stack_pop_pointer() : () -> i64
      %1029 = func.call @cc_nil_value() : () -> i64
      %1030 = func.call @cc_errorp(%674) : (i64) -> i64
      %1031 = arith.cmpi ne, %1030, %1029 : i64
      %1032 = arith.cmpi eq, %1029, %1029 : i64
      %1033 = arith.andi %1031, %1032 : i1
      %1034 = scf.if %1033 -> (i64) {
        scf.yield %674 : i64
      } else {
        scf.yield %1029 : i64
      }
      %1035 = func.call @cc_errorp(%727) : (i64) -> i64
      %1036 = arith.cmpi ne, %1035, %1029 : i64
      %1037 = arith.cmpi eq, %1034, %1029 : i64
      %1038 = arith.andi %1036, %1037 : i1
      %1039 = scf.if %1038 -> (i64) {
        scf.yield %727 : i64
      } else {
        scf.yield %1034 : i64
      }
      %1040 = func.call @cc_errorp(%975) : (i64) -> i64
      %1041 = arith.cmpi ne, %1040, %1029 : i64
      %1042 = arith.cmpi eq, %1039, %1029 : i64
      %1043 = arith.andi %1041, %1042 : i1
      %1044 = scf.if %1043 -> (i64) {
        scf.yield %975 : i64
      } else {
        scf.yield %1039 : i64
      }
      %1045 = func.call @cc_errorp(%996) : (i64) -> i64
      %1046 = arith.cmpi ne, %1045, %1029 : i64
      %1047 = arith.cmpi eq, %1044, %1029 : i64
      %1048 = arith.andi %1046, %1047 : i1
      %1049 = scf.if %1048 -> (i64) {
        scf.yield %996 : i64
      } else {
        scf.yield %1044 : i64
      }
      %1050 = func.call @cc_errorp(%1007) : (i64) -> i64
      %1051 = arith.cmpi ne, %1050, %1029 : i64
      %1052 = arith.cmpi eq, %1049, %1029 : i64
      %1053 = arith.andi %1051, %1052 : i1
      %1054 = scf.if %1053 -> (i64) {
        scf.yield %1007 : i64
      } else {
        scf.yield %1049 : i64
      }
      %1055 = func.call @cc_errorp(%1008) : (i64) -> i64
      %1056 = arith.cmpi ne, %1055, %1029 : i64
      %1057 = arith.cmpi eq, %1054, %1029 : i64
      %1058 = arith.andi %1056, %1057 : i1
      %1059 = scf.if %1058 -> (i64) {
        scf.yield %1008 : i64
      } else {
        scf.yield %1054 : i64
      }
      %1060 = func.call @cc_errorp(%1019) : (i64) -> i64
      %1061 = arith.cmpi ne, %1060, %1029 : i64
      %1062 = arith.cmpi eq, %1059, %1029 : i64
      %1063 = arith.andi %1061, %1062 : i1
      %1064 = scf.if %1063 -> (i64) {
        scf.yield %1019 : i64
      } else {
        scf.yield %1059 : i64
      }
      %1065 = func.call @cc_errorp(%1028) : (i64) -> i64
      %1066 = arith.cmpi ne, %1065, %1029 : i64
      %1067 = arith.cmpi eq, %1064, %1029 : i64
      %1068 = arith.andi %1066, %1067 : i1
      %1069 = scf.if %1068 -> (i64) {
        scf.yield %1028 : i64
      } else {
        scf.yield %1064 : i64
      }
      %1070 = arith.cmpi ne, %1069, %1029 : i64
      scf.if %1070 {
        func.call @stack_push_pointer(%1069) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%674) : (i64) -> ()
        func.call @stack_push_pointer(%727) : (i64) -> ()
        func.call @stack_push_pointer(%975) : (i64) -> ()
        func.call @stack_push_pointer(%996) : (i64) -> ()
        func.call @stack_push_pointer(%1007) : (i64) -> ()
        func.call @stack_push_pointer(%1008) : (i64) -> ()
        func.call @stack_push_pointer(%1019) : (i64) -> ()
        func.call @stack_push_pointer(%1028) : (i64) -> ()
        %1071 = llvm.mlir.addressof @str105 : !llvm.ptr
        %1072 = func.call @cc_make_function_ref_const(%1071) : (!llvm.ptr) -> i64
        %1073 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1072, %1073) : (i64, i64) -> ()
      }
      %1074 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1074 : i64
    }
    %1075 = func.call @cc_nil_value() : () -> i64
    %1076 = func.call @cc_errorp(%665) : (i64) -> i64
    %1077 = arith.cmpi ne, %1076, %1075 : i64
    %1078 = scf.if %1077 -> (i64) {
      scf.yield %665 : i64
    } else {
      %1079 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1080 = arith.constant 16 : i64
      %1081 = func.call @cc_make_string(%1079, %1080) : (!llvm.ptr, i64) -> i64
      %1082 = func.call @cc_nil_value() : () -> i64
      %1083 = func.call @cc_intern(%1081, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_nil_value() : () -> i64
      %1085 = func.call @cc_cons(%1083, %1084) : (i64, i64) -> i64
      %1086 = func.call @cc_values_pack(%1085) : (i64) -> i64
      func.call @stack_push_pointer(%1083) : (i64) -> ()
      %1087 = func.call @stack_pop_pointer() : () -> i64
      %1088 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1089 = arith.constant 16 : i64
      %1090 = func.call @cc_make_string(%1088, %1089) : (!llvm.ptr, i64) -> i64
      %1091 = func.call @cc_nil_value() : () -> i64
      %1092 = func.call @cc_intern(%1090, %1091) : (i64, i64) -> i64
      %1093 = func.call @cc_nil_value() : () -> i64
      %1094 = func.call @cc_cons(%1092, %1093) : (i64, i64) -> i64
      %1095 = func.call @cc_values_pack(%1094) : (i64) -> i64
      func.call @stack_push_pointer(%1092) : (i64) -> ()
      %1096 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1097 = arith.constant 10 : i64
      %1098 = func.call @cc_make_string(%1096, %1097) : (!llvm.ptr, i64) -> i64
      %1099 = func.call @cc_nil_value() : () -> i64
      %1100 = func.call @cc_intern(%1098, %1099) : (i64, i64) -> i64
      %1101 = func.call @cc_nil_value() : () -> i64
      %1102 = func.call @cc_cons(%1100, %1101) : (i64, i64) -> i64
      %1103 = func.call @cc_values_pack(%1102) : (i64) -> i64
      func.call @stack_push_pointer(%1100) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1104 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1105 = arith.constant 6 : i64
      %1106 = func.call @cc_make_string(%1104, %1105) : (!llvm.ptr, i64) -> i64
      %1107 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1108 = arith.constant 7 : i64
      %1109 = func.call @cc_make_string(%1107, %1108) : (!llvm.ptr, i64) -> i64
      %1110 = func.call @cc_intern(%1106, %1109) : (i64, i64) -> i64
      %1111 = func.call @cc_nil_value() : () -> i64
      %1112 = func.call @cc_cons(%1110, %1111) : (i64, i64) -> i64
      %1113 = func.call @cc_values_pack(%1112) : (i64) -> i64
      func.call @stack_push_pointer(%1110) : (i64) -> ()
      %1114 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1115 = arith.constant 6 : i64
      %1116 = func.call @cc_make_string(%1114, %1115) : (!llvm.ptr, i64) -> i64
      %1117 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1118 = arith.constant 7 : i64
      %1119 = func.call @cc_make_string(%1117, %1118) : (!llvm.ptr, i64) -> i64
      %1120 = func.call @cc_intern(%1116, %1119) : (i64, i64) -> i64
      %1121 = func.call @cc_nil_value() : () -> i64
      %1122 = func.call @cc_cons(%1120, %1121) : (i64, i64) -> i64
      %1123 = func.call @cc_values_pack(%1122) : (i64) -> i64
      func.call @stack_push_pointer(%1120) : (i64) -> ()
      %1124 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1125 = arith.constant 5 : i64
      %1126 = func.call @cc_make_string(%1124, %1125) : (!llvm.ptr, i64) -> i64
      %1127 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1128 = arith.constant 7 : i64
      %1129 = func.call @cc_make_string(%1127, %1128) : (!llvm.ptr, i64) -> i64
      %1130 = func.call @cc_intern(%1126, %1129) : (i64, i64) -> i64
      %1131 = func.call @cc_nil_value() : () -> i64
      %1132 = func.call @cc_cons(%1130, %1131) : (i64, i64) -> i64
      %1133 = func.call @cc_values_pack(%1132) : (i64) -> i64
      func.call @stack_push_pointer(%1130) : (i64) -> ()
      %1134 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1135 = arith.constant 6 : i64
      %1136 = func.call @cc_make_string(%1134, %1135) : (!llvm.ptr, i64) -> i64
      %1137 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1138 = arith.constant 7 : i64
      %1139 = func.call @cc_make_string(%1137, %1138) : (!llvm.ptr, i64) -> i64
      %1140 = func.call @cc_intern(%1136, %1139) : (i64, i64) -> i64
      %1141 = func.call @cc_nil_value() : () -> i64
      %1142 = func.call @cc_cons(%1140, %1141) : (i64, i64) -> i64
      %1143 = func.call @cc_values_pack(%1142) : (i64) -> i64
      func.call @stack_push_pointer(%1140) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = func.call @stack_pop_pointer() : () -> i64
      %1146 = func.call @cc_cons(%1145, %1144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1146) : (i64) -> ()
      %1147 = func.call @stack_pop_pointer() : () -> i64
      %1148 = func.call @stack_pop_pointer() : () -> i64
      %1149 = func.call @cc_cons(%1148, %1147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1149) : (i64) -> ()
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = func.call @stack_pop_pointer() : () -> i64
      %1152 = func.call @cc_cons(%1151, %1150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1152) : (i64) -> ()
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @cc_cons(%1154, %1153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1155) : (i64) -> ()
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = func.call @stack_pop_pointer() : () -> i64
      %1158 = func.call @cc_cons(%1157, %1156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1158) : (i64) -> ()
      %1159 = func.call @stack_pop_pointer() : () -> i64
      %1160 = func.call @stack_pop_pointer() : () -> i64
      %1161 = func.call @cc_cons(%1160, %1159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1161) : (i64) -> ()
      %1162 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1163 = arith.constant 3 : i64
      %1164 = func.call @cc_make_string(%1162, %1163) : (!llvm.ptr, i64) -> i64
      %1165 = func.call @cc_nil_value() : () -> i64
      %1166 = func.call @cc_intern(%1164, %1165) : (i64, i64) -> i64
      %1167 = func.call @cc_nil_value() : () -> i64
      %1168 = func.call @cc_cons(%1166, %1167) : (i64, i64) -> i64
      %1169 = func.call @cc_values_pack(%1168) : (i64) -> i64
      func.call @stack_push_pointer(%1166) : (i64) -> ()
      %1170 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1171 = arith.constant 14 : i64
      %1172 = func.call @cc_make_string(%1170, %1171) : (!llvm.ptr, i64) -> i64
      %1173 = func.call @cc_nil_value() : () -> i64
      %1174 = func.call @cc_intern(%1172, %1173) : (i64, i64) -> i64
      %1175 = func.call @cc_nil_value() : () -> i64
      %1176 = func.call @cc_cons(%1174, %1175) : (i64, i64) -> i64
      %1177 = func.call @cc_values_pack(%1176) : (i64) -> i64
      func.call @stack_push_pointer(%1174) : (i64) -> ()
      %1178 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1179 = arith.constant 29 : i64
      %1180 = func.call @cc_make_string(%1178, %1179) : (!llvm.ptr, i64) -> i64
      %1181 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1182 = arith.constant 3 : i64
      %1183 = func.call @cc_make_string(%1181, %1182) : (!llvm.ptr, i64) -> i64
      %1184 = func.call @cc_intern(%1180, %1183) : (i64, i64) -> i64
      %1185 = func.call @cc_nil_value() : () -> i64
      %1186 = func.call @cc_cons(%1184, %1185) : (i64, i64) -> i64
      %1187 = func.call @cc_values_pack(%1186) : (i64) -> i64
      func.call @stack_push_pointer(%1184) : (i64) -> ()
      %1188 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1189 = arith.constant 7 : i64
      %1190 = func.call @cc_make_string(%1188, %1189) : (!llvm.ptr, i64) -> i64
      %1191 = func.call @cc_nil_value() : () -> i64
      %1192 = func.call @cc_intern(%1190, %1191) : (i64, i64) -> i64
      %1193 = func.call @cc_nil_value() : () -> i64
      %1194 = func.call @cc_cons(%1192, %1193) : (i64, i64) -> i64
      %1195 = func.call @cc_values_pack(%1194) : (i64) -> i64
      func.call @stack_push_pointer(%1192) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1196 = func.call @stack_pop_pointer() : () -> i64
      %1197 = func.call @stack_pop_pointer() : () -> i64
      %1198 = func.call @cc_cons(%1197, %1196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1198) : (i64) -> ()
      %1199 = func.call @stack_pop_pointer() : () -> i64
      %1200 = func.call @stack_pop_pointer() : () -> i64
      %1201 = func.call @cc_cons(%1200, %1199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1201) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1202 = func.call @stack_pop_pointer() : () -> i64
      %1203 = func.call @stack_pop_pointer() : () -> i64
      %1204 = func.call @cc_cons(%1203, %1202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1204) : (i64) -> ()
      %1205 = func.call @stack_pop_pointer() : () -> i64
      %1206 = func.call @stack_pop_pointer() : () -> i64
      %1207 = func.call @cc_cons(%1206, %1205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1207) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1208 = func.call @stack_pop_pointer() : () -> i64
      %1209 = func.call @stack_pop_pointer() : () -> i64
      %1210 = func.call @cc_cons(%1209, %1208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1210) : (i64) -> ()
      %1211 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1212 = arith.constant 6 : i64
      %1213 = func.call @cc_make_string(%1211, %1212) : (!llvm.ptr, i64) -> i64
      %1214 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1215 = arith.constant 11 : i64
      %1216 = func.call @cc_make_string(%1214, %1215) : (!llvm.ptr, i64) -> i64
      %1217 = func.call @cc_intern(%1213, %1216) : (i64, i64) -> i64
      %1218 = func.call @cc_nil_value() : () -> i64
      %1219 = func.call @cc_cons(%1217, %1218) : (i64, i64) -> i64
      %1220 = func.call @cc_values_pack(%1219) : (i64) -> i64
      func.call @stack_push_pointer(%1217) : (i64) -> ()
      %1221 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1222 = arith.constant 5 : i64
      %1223 = func.call @cc_make_string(%1221, %1222) : (!llvm.ptr, i64) -> i64
      %1224 = func.call @cc_nil_value() : () -> i64
      %1225 = func.call @cc_intern(%1223, %1224) : (i64, i64) -> i64
      %1226 = func.call @cc_nil_value() : () -> i64
      %1227 = func.call @cc_cons(%1225, %1226) : (i64, i64) -> i64
      %1228 = func.call @cc_values_pack(%1227) : (i64) -> i64
      func.call @stack_push_pointer(%1225) : (i64) -> ()
      %1229 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1230 = arith.constant 10 : i64
      %1231 = func.call @cc_make_string(%1229, %1230) : (!llvm.ptr, i64) -> i64
      %1232 = func.call @cc_nil_value() : () -> i64
      %1233 = func.call @cc_intern(%1231, %1232) : (i64, i64) -> i64
      %1234 = func.call @cc_nil_value() : () -> i64
      %1235 = func.call @cc_cons(%1233, %1234) : (i64, i64) -> i64
      %1236 = func.call @cc_values_pack(%1235) : (i64) -> i64
      func.call @stack_push_pointer(%1233) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1237 = func.call @stack_pop_pointer() : () -> i64
      %1238 = func.call @stack_pop_pointer() : () -> i64
      %1239 = func.call @cc_cons(%1238, %1237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1239) : (i64) -> ()
      %1240 = func.call @stack_pop_pointer() : () -> i64
      %1241 = func.call @stack_pop_pointer() : () -> i64
      %1242 = func.call @cc_cons(%1241, %1240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1242) : (i64) -> ()
      %1243 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1244 = arith.constant 5 : i64
      %1245 = func.call @cc_make_string(%1243, %1244) : (!llvm.ptr, i64) -> i64
      %1246 = func.call @cc_nil_value() : () -> i64
      %1247 = func.call @cc_intern(%1245, %1246) : (i64, i64) -> i64
      %1248 = func.call @cc_nil_value() : () -> i64
      %1249 = func.call @cc_cons(%1247, %1248) : (i64, i64) -> i64
      %1250 = func.call @cc_values_pack(%1249) : (i64) -> i64
      func.call @stack_push_pointer(%1247) : (i64) -> ()
      %1251 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1252 = arith.constant 14 : i64
      %1253 = func.call @cc_make_string(%1251, %1252) : (!llvm.ptr, i64) -> i64
      %1254 = func.call @cc_nil_value() : () -> i64
      %1255 = func.call @cc_intern(%1253, %1254) : (i64, i64) -> i64
      %1256 = func.call @cc_nil_value() : () -> i64
      %1257 = func.call @cc_cons(%1255, %1256) : (i64, i64) -> i64
      %1258 = func.call @cc_values_pack(%1257) : (i64) -> i64
      func.call @stack_push_pointer(%1255) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1259 = func.call @stack_pop_pointer() : () -> i64
      %1260 = func.call @stack_pop_pointer() : () -> i64
      %1261 = func.call @cc_cons(%1260, %1259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1261) : (i64) -> ()
      %1262 = func.call @stack_pop_pointer() : () -> i64
      %1263 = func.call @stack_pop_pointer() : () -> i64
      %1264 = func.call @cc_cons(%1263, %1262) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1264) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1265 = func.call @stack_pop_pointer() : () -> i64
      %1266 = func.call @stack_pop_pointer() : () -> i64
      %1267 = func.call @cc_cons(%1266, %1265) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1267) : (i64) -> ()
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @stack_pop_pointer() : () -> i64
      %1270 = func.call @cc_cons(%1269, %1268) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1270) : (i64) -> ()
      %1271 = func.call @stack_pop_pointer() : () -> i64
      %1272 = func.call @stack_pop_pointer() : () -> i64
      %1273 = func.call @cc_cons(%1272, %1271) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1273) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1274 = func.call @stack_pop_pointer() : () -> i64
      %1275 = func.call @stack_pop_pointer() : () -> i64
      %1276 = func.call @cc_cons(%1275, %1274) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1276) : (i64) -> ()
      %1277 = func.call @stack_pop_pointer() : () -> i64
      %1278 = func.call @stack_pop_pointer() : () -> i64
      %1279 = func.call @cc_cons(%1278, %1277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1279) : (i64) -> ()
      %1280 = func.call @stack_pop_pointer() : () -> i64
      %1281 = func.call @stack_pop_pointer() : () -> i64
      %1282 = func.call @cc_cons(%1281, %1280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1282) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1283 = func.call @stack_pop_pointer() : () -> i64
      %1284 = func.call @stack_pop_pointer() : () -> i64
      %1285 = func.call @cc_cons(%1284, %1283) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1285) : (i64) -> ()
      %1286 = func.call @stack_pop_pointer() : () -> i64
      %1287 = func.call @stack_pop_pointer() : () -> i64
      %1288 = func.call @cc_cons(%1287, %1286) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1288) : (i64) -> ()
      %1289 = func.call @stack_pop_pointer() : () -> i64
      %1290 = func.call @stack_pop_pointer() : () -> i64
      %1291 = func.call @cc_cons(%1290, %1289) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1291) : (i64) -> ()
      %1292 = func.call @stack_pop_pointer() : () -> i64
      %1628 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1629 = arith.constant 39 : i64
      %1630 = func.call @cc_make_symbol(%1628, %1629) : (!llvm.ptr, i64) -> i64
      %1631 = func.call @cc_persistent_root_value(%1630) : (i64) -> i64
      func.call @stack_push_pointer(%1631) : (i64) -> ()
      %1632 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1633 = arith.constant 36 : i64
      %1634 = func.call @cc_make_symbol(%1632, %1633) : (!llvm.ptr, i64) -> i64
      %1635 = func.call @cc_persistent_root_value(%1634) : (i64) -> i64
      func.call @stack_push_pointer(%1635) : (i64) -> ()
      %1636 = arith.constant 263377075044358 : i64
      %1637 = arith.constant 2 : i64
      %1638 = func.call @cc_make_closure(%1636, %1637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1638) : (i64) -> ()
      %1639 = func.call @stack_pop_pointer() : () -> i64
      %1640 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1641 = arith.constant 12 : i64
      %1642 = func.call @cc_make_string(%1640, %1641) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1642) : (i64) -> ()
      %1643 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1644 = arith.constant 12 : i64
      %1645 = func.call @cc_make_string(%1643, %1644) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1645) : (i64) -> ()
      %1646 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1647 = arith.constant 6 : i64
      %1648 = func.call @cc_make_string(%1646, %1647) : (!llvm.ptr, i64) -> i64
      %1649 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1650 = arith.constant 7 : i64
      %1651 = func.call @cc_make_string(%1649, %1650) : (!llvm.ptr, i64) -> i64
      %1652 = func.call @cc_intern(%1648, %1651) : (i64, i64) -> i64
      %1653 = func.call @cc_nil_value() : () -> i64
      %1654 = func.call @cc_cons(%1652, %1653) : (i64, i64) -> i64
      %1655 = func.call @cc_values_pack(%1654) : (i64) -> i64
      func.call @stack_push_pointer(%1652) : (i64) -> ()
      %1656 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1656) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @stack_pop_pointer() : () -> i64
      %1659 = func.call @cc_cons(%1658, %1657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1659) : (i64) -> ()
      %1660 = func.call @stack_pop_pointer() : () -> i64
      %1661 = func.call @stack_pop_pointer() : () -> i64
      %1662 = func.call @cc_cons(%1661, %1660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1662) : (i64) -> ()
      %1663 = func.call @stack_pop_pointer() : () -> i64
      %1664 = func.call @stack_pop_pointer() : () -> i64
      %1665 = func.call @cc_cons(%1664, %1663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1665) : (i64) -> ()
      %1666 = func.call @stack_pop_pointer() : () -> i64
      %1667 = func.call @stack_pop_pointer() : () -> i64
      %1668 = func.call @cc_cons(%1667, %1666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1668) : (i64) -> ()
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1671 = arith.constant 11 : i64
      %1672 = func.call @cc_make_string(%1670, %1671) : (!llvm.ptr, i64) -> i64
      %1673 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1674 = arith.constant 7 : i64
      %1675 = func.call @cc_make_string(%1673, %1674) : (!llvm.ptr, i64) -> i64
      %1676 = func.call @cc_intern(%1672, %1675) : (i64, i64) -> i64
      %1677 = func.call @cc_nil_value() : () -> i64
      %1678 = func.call @cc_cons(%1676, %1677) : (i64, i64) -> i64
      %1679 = func.call @cc_values_pack(%1678) : (i64) -> i64
      func.call @stack_push_pointer(%1676) : (i64) -> ()
      %1680 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1681 = func.call @stack_pop_pointer() : () -> i64
      %1682 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1683 = arith.constant 4 : i64
      %1684 = func.call @cc_make_string(%1682, %1683) : (!llvm.ptr, i64) -> i64
      %1685 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1686 = arith.constant 7 : i64
      %1687 = func.call @cc_make_string(%1685, %1686) : (!llvm.ptr, i64) -> i64
      %1688 = func.call @cc_intern(%1684, %1687) : (i64, i64) -> i64
      %1689 = func.call @cc_nil_value() : () -> i64
      %1690 = func.call @cc_cons(%1688, %1689) : (i64, i64) -> i64
      %1691 = func.call @cc_values_pack(%1690) : (i64) -> i64
      func.call @stack_push_pointer(%1688) : (i64) -> ()
      %1692 = func.call @stack_pop_pointer() : () -> i64
      %1693 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1694 = arith.constant 6 : i64
      %1695 = func.call @cc_make_string(%1693, %1694) : (!llvm.ptr, i64) -> i64
      %1696 = func.call @cc_nil_value() : () -> i64
      %1697 = func.call @cc_intern(%1695, %1696) : (i64, i64) -> i64
      %1698 = func.call @cc_nil_value() : () -> i64
      %1699 = func.call @cc_cons(%1697, %1698) : (i64, i64) -> i64
      %1700 = func.call @cc_values_pack(%1699) : (i64) -> i64
      func.call @stack_push_pointer(%1697) : (i64) -> ()
      %1701 = func.call @stack_pop_pointer() : () -> i64
      %1702 = func.call @cc_nil_value() : () -> i64
      %1703 = func.call @cc_errorp(%1087) : (i64) -> i64
      %1704 = arith.cmpi ne, %1703, %1702 : i64
      %1705 = arith.cmpi eq, %1702, %1702 : i64
      %1706 = arith.andi %1704, %1705 : i1
      %1707 = scf.if %1706 -> (i64) {
        scf.yield %1087 : i64
      } else {
        scf.yield %1702 : i64
      }
      %1708 = func.call @cc_errorp(%1292) : (i64) -> i64
      %1709 = arith.cmpi ne, %1708, %1702 : i64
      %1710 = arith.cmpi eq, %1707, %1702 : i64
      %1711 = arith.andi %1709, %1710 : i1
      %1712 = scf.if %1711 -> (i64) {
        scf.yield %1292 : i64
      } else {
        scf.yield %1707 : i64
      }
      %1713 = func.call @cc_errorp(%1639) : (i64) -> i64
      %1714 = arith.cmpi ne, %1713, %1702 : i64
      %1715 = arith.cmpi eq, %1712, %1702 : i64
      %1716 = arith.andi %1714, %1715 : i1
      %1717 = scf.if %1716 -> (i64) {
        scf.yield %1639 : i64
      } else {
        scf.yield %1712 : i64
      }
      %1718 = func.call @cc_errorp(%1669) : (i64) -> i64
      %1719 = arith.cmpi ne, %1718, %1702 : i64
      %1720 = arith.cmpi eq, %1717, %1702 : i64
      %1721 = arith.andi %1719, %1720 : i1
      %1722 = scf.if %1721 -> (i64) {
        scf.yield %1669 : i64
      } else {
        scf.yield %1717 : i64
      }
      %1723 = func.call @cc_errorp(%1680) : (i64) -> i64
      %1724 = arith.cmpi ne, %1723, %1702 : i64
      %1725 = arith.cmpi eq, %1722, %1702 : i64
      %1726 = arith.andi %1724, %1725 : i1
      %1727 = scf.if %1726 -> (i64) {
        scf.yield %1680 : i64
      } else {
        scf.yield %1722 : i64
      }
      %1728 = func.call @cc_errorp(%1681) : (i64) -> i64
      %1729 = arith.cmpi ne, %1728, %1702 : i64
      %1730 = arith.cmpi eq, %1727, %1702 : i64
      %1731 = arith.andi %1729, %1730 : i1
      %1732 = scf.if %1731 -> (i64) {
        scf.yield %1681 : i64
      } else {
        scf.yield %1727 : i64
      }
      %1733 = func.call @cc_errorp(%1692) : (i64) -> i64
      %1734 = arith.cmpi ne, %1733, %1702 : i64
      %1735 = arith.cmpi eq, %1732, %1702 : i64
      %1736 = arith.andi %1734, %1735 : i1
      %1737 = scf.if %1736 -> (i64) {
        scf.yield %1692 : i64
      } else {
        scf.yield %1732 : i64
      }
      %1738 = func.call @cc_errorp(%1701) : (i64) -> i64
      %1739 = arith.cmpi ne, %1738, %1702 : i64
      %1740 = arith.cmpi eq, %1737, %1702 : i64
      %1741 = arith.andi %1739, %1740 : i1
      %1742 = scf.if %1741 -> (i64) {
        scf.yield %1701 : i64
      } else {
        scf.yield %1737 : i64
      }
      %1743 = arith.cmpi ne, %1742, %1702 : i64
      scf.if %1743 {
        func.call @stack_push_pointer(%1742) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1087) : (i64) -> ()
        func.call @stack_push_pointer(%1292) : (i64) -> ()
        func.call @stack_push_pointer(%1639) : (i64) -> ()
        func.call @stack_push_pointer(%1669) : (i64) -> ()
        func.call @stack_push_pointer(%1680) : (i64) -> ()
        func.call @stack_push_pointer(%1681) : (i64) -> ()
        func.call @stack_push_pointer(%1692) : (i64) -> ()
        func.call @stack_push_pointer(%1701) : (i64) -> ()
        %1744 = llvm.mlir.addressof @str173 : !llvm.ptr
        %1745 = func.call @cc_make_function_ref_const(%1744) : (!llvm.ptr) -> i64
        %1746 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1745, %1746) : (i64, i64) -> ()
      }
      %1747 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1747 : i64
    }
    %1748 = func.call @cc_nil_value() : () -> i64
    %1749 = func.call @cc_errorp(%1078) : (i64) -> i64
    %1750 = arith.cmpi ne, %1749, %1748 : i64
    %1751 = scf.if %1750 -> (i64) {
      scf.yield %1078 : i64
    } else {
      %1752 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1753 = arith.constant 16 : i64
      %1754 = func.call @cc_make_string(%1752, %1753) : (!llvm.ptr, i64) -> i64
      %1755 = func.call @cc_nil_value() : () -> i64
      %1756 = func.call @cc_intern(%1754, %1755) : (i64, i64) -> i64
      %1757 = func.call @cc_nil_value() : () -> i64
      %1758 = func.call @cc_cons(%1756, %1757) : (i64, i64) -> i64
      %1759 = func.call @cc_values_pack(%1758) : (i64) -> i64
      func.call @stack_push_pointer(%1756) : (i64) -> ()
      %1760 = func.call @stack_pop_pointer() : () -> i64
      %1761 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1762 = arith.constant 16 : i64
      %1763 = func.call @cc_make_string(%1761, %1762) : (!llvm.ptr, i64) -> i64
      %1764 = func.call @cc_nil_value() : () -> i64
      %1765 = func.call @cc_intern(%1763, %1764) : (i64, i64) -> i64
      %1766 = func.call @cc_nil_value() : () -> i64
      %1767 = func.call @cc_cons(%1765, %1766) : (i64, i64) -> i64
      %1768 = func.call @cc_values_pack(%1767) : (i64) -> i64
      func.call @stack_push_pointer(%1765) : (i64) -> ()
      %1769 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1770 = arith.constant 10 : i64
      %1771 = func.call @cc_make_string(%1769, %1770) : (!llvm.ptr, i64) -> i64
      %1772 = func.call @cc_nil_value() : () -> i64
      %1773 = func.call @cc_intern(%1771, %1772) : (i64, i64) -> i64
      %1774 = func.call @cc_nil_value() : () -> i64
      %1775 = func.call @cc_cons(%1773, %1774) : (i64, i64) -> i64
      %1776 = func.call @cc_values_pack(%1775) : (i64) -> i64
      func.call @stack_push_pointer(%1773) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1777 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1778 = arith.constant 6 : i64
      %1779 = func.call @cc_make_string(%1777, %1778) : (!llvm.ptr, i64) -> i64
      %1780 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1781 = arith.constant 7 : i64
      %1782 = func.call @cc_make_string(%1780, %1781) : (!llvm.ptr, i64) -> i64
      %1783 = func.call @cc_intern(%1779, %1782) : (i64, i64) -> i64
      %1784 = func.call @cc_nil_value() : () -> i64
      %1785 = func.call @cc_cons(%1783, %1784) : (i64, i64) -> i64
      %1786 = func.call @cc_values_pack(%1785) : (i64) -> i64
      func.call @stack_push_pointer(%1783) : (i64) -> ()
      %1787 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1788 = arith.constant 6 : i64
      %1789 = func.call @cc_make_string(%1787, %1788) : (!llvm.ptr, i64) -> i64
      %1790 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1791 = arith.constant 7 : i64
      %1792 = func.call @cc_make_string(%1790, %1791) : (!llvm.ptr, i64) -> i64
      %1793 = func.call @cc_intern(%1789, %1792) : (i64, i64) -> i64
      %1794 = func.call @cc_nil_value() : () -> i64
      %1795 = func.call @cc_cons(%1793, %1794) : (i64, i64) -> i64
      %1796 = func.call @cc_values_pack(%1795) : (i64) -> i64
      func.call @stack_push_pointer(%1793) : (i64) -> ()
      %1797 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1798 = arith.constant 5 : i64
      %1799 = func.call @cc_make_string(%1797, %1798) : (!llvm.ptr, i64) -> i64
      %1800 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1801 = arith.constant 7 : i64
      %1802 = func.call @cc_make_string(%1800, %1801) : (!llvm.ptr, i64) -> i64
      %1803 = func.call @cc_intern(%1799, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_nil_value() : () -> i64
      %1805 = func.call @cc_cons(%1803, %1804) : (i64, i64) -> i64
      %1806 = func.call @cc_values_pack(%1805) : (i64) -> i64
      func.call @stack_push_pointer(%1803) : (i64) -> ()
      %1807 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1808 = arith.constant 6 : i64
      %1809 = func.call @cc_make_string(%1807, %1808) : (!llvm.ptr, i64) -> i64
      %1810 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1811 = arith.constant 7 : i64
      %1812 = func.call @cc_make_string(%1810, %1811) : (!llvm.ptr, i64) -> i64
      %1813 = func.call @cc_intern(%1809, %1812) : (i64, i64) -> i64
      %1814 = func.call @cc_nil_value() : () -> i64
      %1815 = func.call @cc_cons(%1813, %1814) : (i64, i64) -> i64
      %1816 = func.call @cc_values_pack(%1815) : (i64) -> i64
      func.call @stack_push_pointer(%1813) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1817 = func.call @stack_pop_pointer() : () -> i64
      %1818 = func.call @stack_pop_pointer() : () -> i64
      %1819 = func.call @cc_cons(%1818, %1817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1819) : (i64) -> ()
      %1820 = func.call @stack_pop_pointer() : () -> i64
      %1821 = func.call @stack_pop_pointer() : () -> i64
      %1822 = func.call @cc_cons(%1821, %1820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1822) : (i64) -> ()
      %1823 = func.call @stack_pop_pointer() : () -> i64
      %1824 = func.call @stack_pop_pointer() : () -> i64
      %1825 = func.call @cc_cons(%1824, %1823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1825) : (i64) -> ()
      %1826 = func.call @stack_pop_pointer() : () -> i64
      %1827 = func.call @stack_pop_pointer() : () -> i64
      %1828 = func.call @cc_cons(%1827, %1826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1828) : (i64) -> ()
      %1829 = func.call @stack_pop_pointer() : () -> i64
      %1830 = func.call @stack_pop_pointer() : () -> i64
      %1831 = func.call @cc_cons(%1830, %1829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1831) : (i64) -> ()
      %1832 = func.call @stack_pop_pointer() : () -> i64
      %1833 = func.call @stack_pop_pointer() : () -> i64
      %1834 = func.call @cc_cons(%1833, %1832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1834) : (i64) -> ()
      %1835 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1836 = arith.constant 3 : i64
      %1837 = func.call @cc_make_string(%1835, %1836) : (!llvm.ptr, i64) -> i64
      %1838 = func.call @cc_nil_value() : () -> i64
      %1839 = func.call @cc_intern(%1837, %1838) : (i64, i64) -> i64
      %1840 = func.call @cc_nil_value() : () -> i64
      %1841 = func.call @cc_cons(%1839, %1840) : (i64, i64) -> i64
      %1842 = func.call @cc_values_pack(%1841) : (i64) -> i64
      func.call @stack_push_pointer(%1839) : (i64) -> ()
      %1843 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1844 = arith.constant 14 : i64
      %1845 = func.call @cc_make_string(%1843, %1844) : (!llvm.ptr, i64) -> i64
      %1846 = func.call @cc_nil_value() : () -> i64
      %1847 = func.call @cc_intern(%1845, %1846) : (i64, i64) -> i64
      %1848 = func.call @cc_nil_value() : () -> i64
      %1849 = func.call @cc_cons(%1847, %1848) : (i64, i64) -> i64
      %1850 = func.call @cc_values_pack(%1849) : (i64) -> i64
      func.call @stack_push_pointer(%1847) : (i64) -> ()
      %1851 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1852 = arith.constant 29 : i64
      %1853 = func.call @cc_make_string(%1851, %1852) : (!llvm.ptr, i64) -> i64
      %1854 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1855 = arith.constant 3 : i64
      %1856 = func.call @cc_make_string(%1854, %1855) : (!llvm.ptr, i64) -> i64
      %1857 = func.call @cc_intern(%1853, %1856) : (i64, i64) -> i64
      %1858 = func.call @cc_nil_value() : () -> i64
      %1859 = func.call @cc_cons(%1857, %1858) : (i64, i64) -> i64
      %1860 = func.call @cc_values_pack(%1859) : (i64) -> i64
      func.call @stack_push_pointer(%1857) : (i64) -> ()
      %1861 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1862 = arith.constant 7 : i64
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
      func.call @stack_push_pointer(%1871) : (i64) -> ()
      %1872 = func.call @stack_pop_pointer() : () -> i64
      %1873 = func.call @stack_pop_pointer() : () -> i64
      %1874 = func.call @cc_cons(%1873, %1872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1874) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1875 = func.call @stack_pop_pointer() : () -> i64
      %1876 = func.call @stack_pop_pointer() : () -> i64
      %1877 = func.call @cc_cons(%1876, %1875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1877) : (i64) -> ()
      %1878 = func.call @stack_pop_pointer() : () -> i64
      %1879 = func.call @stack_pop_pointer() : () -> i64
      %1880 = func.call @cc_cons(%1879, %1878) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1880) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1881 = func.call @stack_pop_pointer() : () -> i64
      %1882 = func.call @stack_pop_pointer() : () -> i64
      %1883 = func.call @cc_cons(%1882, %1881) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1883) : (i64) -> ()
      %1884 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1885 = arith.constant 6 : i64
      %1886 = func.call @cc_make_string(%1884, %1885) : (!llvm.ptr, i64) -> i64
      %1887 = llvm.mlir.addressof @str191 : !llvm.ptr
      %1888 = arith.constant 11 : i64
      %1889 = func.call @cc_make_string(%1887, %1888) : (!llvm.ptr, i64) -> i64
      %1890 = func.call @cc_intern(%1886, %1889) : (i64, i64) -> i64
      %1891 = func.call @cc_nil_value() : () -> i64
      %1892 = func.call @cc_cons(%1890, %1891) : (i64, i64) -> i64
      %1893 = func.call @cc_values_pack(%1892) : (i64) -> i64
      func.call @stack_push_pointer(%1890) : (i64) -> ()
      %1894 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1895 = arith.constant 5 : i64
      %1896 = func.call @cc_make_string(%1894, %1895) : (!llvm.ptr, i64) -> i64
      %1897 = func.call @cc_nil_value() : () -> i64
      %1898 = func.call @cc_intern(%1896, %1897) : (i64, i64) -> i64
      %1899 = func.call @cc_nil_value() : () -> i64
      %1900 = func.call @cc_cons(%1898, %1899) : (i64, i64) -> i64
      %1901 = func.call @cc_values_pack(%1900) : (i64) -> i64
      func.call @stack_push_pointer(%1898) : (i64) -> ()
      %1902 = llvm.mlir.addressof @str193 : !llvm.ptr
      %1903 = arith.constant 10 : i64
      %1904 = func.call @cc_make_string(%1902, %1903) : (!llvm.ptr, i64) -> i64
      %1905 = func.call @cc_nil_value() : () -> i64
      %1906 = func.call @cc_intern(%1904, %1905) : (i64, i64) -> i64
      %1907 = func.call @cc_nil_value() : () -> i64
      %1908 = func.call @cc_cons(%1906, %1907) : (i64, i64) -> i64
      %1909 = func.call @cc_values_pack(%1908) : (i64) -> i64
      func.call @stack_push_pointer(%1906) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1910 = func.call @stack_pop_pointer() : () -> i64
      %1911 = func.call @stack_pop_pointer() : () -> i64
      %1912 = func.call @cc_cons(%1911, %1910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1912) : (i64) -> ()
      %1913 = func.call @stack_pop_pointer() : () -> i64
      %1914 = func.call @stack_pop_pointer() : () -> i64
      %1915 = func.call @cc_cons(%1914, %1913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1915) : (i64) -> ()
      %1916 = llvm.mlir.addressof @str194 : !llvm.ptr
      %1917 = arith.constant 5 : i64
      %1918 = func.call @cc_make_string(%1916, %1917) : (!llvm.ptr, i64) -> i64
      %1919 = func.call @cc_nil_value() : () -> i64
      %1920 = func.call @cc_intern(%1918, %1919) : (i64, i64) -> i64
      %1921 = func.call @cc_nil_value() : () -> i64
      %1922 = func.call @cc_cons(%1920, %1921) : (i64, i64) -> i64
      %1923 = func.call @cc_values_pack(%1922) : (i64) -> i64
      func.call @stack_push_pointer(%1920) : (i64) -> ()
      %1924 = llvm.mlir.addressof @str195 : !llvm.ptr
      %1925 = arith.constant 14 : i64
      %1926 = func.call @cc_make_string(%1924, %1925) : (!llvm.ptr, i64) -> i64
      %1927 = func.call @cc_nil_value() : () -> i64
      %1928 = func.call @cc_intern(%1926, %1927) : (i64, i64) -> i64
      %1929 = func.call @cc_nil_value() : () -> i64
      %1930 = func.call @cc_cons(%1928, %1929) : (i64, i64) -> i64
      %1931 = func.call @cc_values_pack(%1930) : (i64) -> i64
      func.call @stack_push_pointer(%1928) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1932 = func.call @stack_pop_pointer() : () -> i64
      %1933 = func.call @stack_pop_pointer() : () -> i64
      %1934 = func.call @cc_cons(%1933, %1932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1934) : (i64) -> ()
      %1935 = func.call @stack_pop_pointer() : () -> i64
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = func.call @cc_cons(%1936, %1935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1937) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1938 = func.call @stack_pop_pointer() : () -> i64
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @cc_cons(%1939, %1938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1940) : (i64) -> ()
      %1941 = func.call @stack_pop_pointer() : () -> i64
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @cc_cons(%1942, %1941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1943) : (i64) -> ()
      %1944 = func.call @stack_pop_pointer() : () -> i64
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @cc_cons(%1945, %1944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1946) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1947 = func.call @stack_pop_pointer() : () -> i64
      %1948 = func.call @stack_pop_pointer() : () -> i64
      %1949 = func.call @cc_cons(%1948, %1947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1949) : (i64) -> ()
      %1950 = func.call @stack_pop_pointer() : () -> i64
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @cc_cons(%1951, %1950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1952) : (i64) -> ()
      %1953 = func.call @stack_pop_pointer() : () -> i64
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @cc_cons(%1954, %1953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1955) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1956 = func.call @stack_pop_pointer() : () -> i64
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @cc_cons(%1957, %1956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1958) : (i64) -> ()
      %1959 = func.call @stack_pop_pointer() : () -> i64
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @cc_cons(%1960, %1959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1961) : (i64) -> ()
      %1962 = func.call @stack_pop_pointer() : () -> i64
      %1963 = func.call @stack_pop_pointer() : () -> i64
      %1964 = func.call @cc_cons(%1963, %1962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1964) : (i64) -> ()
      %1965 = func.call @stack_pop_pointer() : () -> i64
      %2301 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2302 = arith.constant 39 : i64
      %2303 = func.call @cc_make_symbol(%2301, %2302) : (!llvm.ptr, i64) -> i64
      %2304 = func.call @cc_persistent_root_value(%2303) : (i64) -> i64
      func.call @stack_push_pointer(%2304) : (i64) -> ()
      %2305 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2306 = arith.constant 36 : i64
      %2307 = func.call @cc_make_symbol(%2305, %2306) : (!llvm.ptr, i64) -> i64
      %2308 = func.call @cc_persistent_root_value(%2307) : (i64) -> i64
      func.call @stack_push_pointer(%2308) : (i64) -> ()
      %2309 = arith.constant 263377075044361 : i64
      %2310 = arith.constant 2 : i64
      %2311 = func.call @cc_make_closure(%2309, %2310) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2311) : (i64) -> ()
      %2312 = func.call @stack_pop_pointer() : () -> i64
      %2313 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2314 = arith.constant 12 : i64
      %2315 = func.call @cc_make_string(%2313, %2314) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2315) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2316 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2317 = arith.constant 6 : i64
      %2318 = func.call @cc_make_string(%2316, %2317) : (!llvm.ptr, i64) -> i64
      %2319 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2320 = arith.constant 7 : i64
      %2321 = func.call @cc_make_string(%2319, %2320) : (!llvm.ptr, i64) -> i64
      %2322 = func.call @cc_intern(%2318, %2321) : (i64, i64) -> i64
      %2323 = func.call @cc_nil_value() : () -> i64
      %2324 = func.call @cc_cons(%2322, %2323) : (i64, i64) -> i64
      %2325 = func.call @cc_values_pack(%2324) : (i64) -> i64
      func.call @stack_push_pointer(%2322) : (i64) -> ()
      %2326 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2327 = func.call @stack_pop_pointer() : () -> i64
      %2328 = func.call @stack_pop_pointer() : () -> i64
      %2329 = func.call @cc_cons(%2328, %2327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2329) : (i64) -> ()
      %2330 = func.call @stack_pop_pointer() : () -> i64
      %2331 = func.call @stack_pop_pointer() : () -> i64
      %2332 = func.call @cc_cons(%2331, %2330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2332) : (i64) -> ()
      %2333 = func.call @stack_pop_pointer() : () -> i64
      %2334 = func.call @stack_pop_pointer() : () -> i64
      %2335 = func.call @cc_cons(%2334, %2333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2335) : (i64) -> ()
      %2336 = func.call @stack_pop_pointer() : () -> i64
      %2337 = func.call @stack_pop_pointer() : () -> i64
      %2338 = func.call @cc_cons(%2337, %2336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2338) : (i64) -> ()
      %2339 = func.call @stack_pop_pointer() : () -> i64
      %2340 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2341 = arith.constant 11 : i64
      %2342 = func.call @cc_make_string(%2340, %2341) : (!llvm.ptr, i64) -> i64
      %2343 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2344 = arith.constant 7 : i64
      %2345 = func.call @cc_make_string(%2343, %2344) : (!llvm.ptr, i64) -> i64
      %2346 = func.call @cc_intern(%2342, %2345) : (i64, i64) -> i64
      %2347 = func.call @cc_nil_value() : () -> i64
      %2348 = func.call @cc_cons(%2346, %2347) : (i64, i64) -> i64
      %2349 = func.call @cc_values_pack(%2348) : (i64) -> i64
      func.call @stack_push_pointer(%2346) : (i64) -> ()
      %2350 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2351 = func.call @stack_pop_pointer() : () -> i64
      %2352 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2353 = arith.constant 4 : i64
      %2354 = func.call @cc_make_string(%2352, %2353) : (!llvm.ptr, i64) -> i64
      %2355 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2356 = arith.constant 7 : i64
      %2357 = func.call @cc_make_string(%2355, %2356) : (!llvm.ptr, i64) -> i64
      %2358 = func.call @cc_intern(%2354, %2357) : (i64, i64) -> i64
      %2359 = func.call @cc_nil_value() : () -> i64
      %2360 = func.call @cc_cons(%2358, %2359) : (i64, i64) -> i64
      %2361 = func.call @cc_values_pack(%2360) : (i64) -> i64
      func.call @stack_push_pointer(%2358) : (i64) -> ()
      %2362 = func.call @stack_pop_pointer() : () -> i64
      %2363 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2364 = arith.constant 6 : i64
      %2365 = func.call @cc_make_string(%2363, %2364) : (!llvm.ptr, i64) -> i64
      %2366 = func.call @cc_nil_value() : () -> i64
      %2367 = func.call @cc_intern(%2365, %2366) : (i64, i64) -> i64
      %2368 = func.call @cc_nil_value() : () -> i64
      %2369 = func.call @cc_cons(%2367, %2368) : (i64, i64) -> i64
      %2370 = func.call @cc_values_pack(%2369) : (i64) -> i64
      func.call @stack_push_pointer(%2367) : (i64) -> ()
      %2371 = func.call @stack_pop_pointer() : () -> i64
      %2372 = func.call @cc_nil_value() : () -> i64
      %2373 = func.call @cc_errorp(%1760) : (i64) -> i64
      %2374 = arith.cmpi ne, %2373, %2372 : i64
      %2375 = arith.cmpi eq, %2372, %2372 : i64
      %2376 = arith.andi %2374, %2375 : i1
      %2377 = scf.if %2376 -> (i64) {
        scf.yield %1760 : i64
      } else {
        scf.yield %2372 : i64
      }
      %2378 = func.call @cc_errorp(%1965) : (i64) -> i64
      %2379 = arith.cmpi ne, %2378, %2372 : i64
      %2380 = arith.cmpi eq, %2377, %2372 : i64
      %2381 = arith.andi %2379, %2380 : i1
      %2382 = scf.if %2381 -> (i64) {
        scf.yield %1965 : i64
      } else {
        scf.yield %2377 : i64
      }
      %2383 = func.call @cc_errorp(%2312) : (i64) -> i64
      %2384 = arith.cmpi ne, %2383, %2372 : i64
      %2385 = arith.cmpi eq, %2382, %2372 : i64
      %2386 = arith.andi %2384, %2385 : i1
      %2387 = scf.if %2386 -> (i64) {
        scf.yield %2312 : i64
      } else {
        scf.yield %2382 : i64
      }
      %2388 = func.call @cc_errorp(%2339) : (i64) -> i64
      %2389 = arith.cmpi ne, %2388, %2372 : i64
      %2390 = arith.cmpi eq, %2387, %2372 : i64
      %2391 = arith.andi %2389, %2390 : i1
      %2392 = scf.if %2391 -> (i64) {
        scf.yield %2339 : i64
      } else {
        scf.yield %2387 : i64
      }
      %2393 = func.call @cc_errorp(%2350) : (i64) -> i64
      %2394 = arith.cmpi ne, %2393, %2372 : i64
      %2395 = arith.cmpi eq, %2392, %2372 : i64
      %2396 = arith.andi %2394, %2395 : i1
      %2397 = scf.if %2396 -> (i64) {
        scf.yield %2350 : i64
      } else {
        scf.yield %2392 : i64
      }
      %2398 = func.call @cc_errorp(%2351) : (i64) -> i64
      %2399 = arith.cmpi ne, %2398, %2372 : i64
      %2400 = arith.cmpi eq, %2397, %2372 : i64
      %2401 = arith.andi %2399, %2400 : i1
      %2402 = scf.if %2401 -> (i64) {
        scf.yield %2351 : i64
      } else {
        scf.yield %2397 : i64
      }
      %2403 = func.call @cc_errorp(%2362) : (i64) -> i64
      %2404 = arith.cmpi ne, %2403, %2372 : i64
      %2405 = arith.cmpi eq, %2402, %2372 : i64
      %2406 = arith.andi %2404, %2405 : i1
      %2407 = scf.if %2406 -> (i64) {
        scf.yield %2362 : i64
      } else {
        scf.yield %2402 : i64
      }
      %2408 = func.call @cc_errorp(%2371) : (i64) -> i64
      %2409 = arith.cmpi ne, %2408, %2372 : i64
      %2410 = arith.cmpi eq, %2407, %2372 : i64
      %2411 = arith.andi %2409, %2410 : i1
      %2412 = scf.if %2411 -> (i64) {
        scf.yield %2371 : i64
      } else {
        scf.yield %2407 : i64
      }
      %2413 = arith.cmpi ne, %2412, %2372 : i64
      scf.if %2413 {
        func.call @stack_push_pointer(%2412) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1760) : (i64) -> ()
        func.call @stack_push_pointer(%1965) : (i64) -> ()
        func.call @stack_push_pointer(%2312) : (i64) -> ()
        func.call @stack_push_pointer(%2339) : (i64) -> ()
        func.call @stack_push_pointer(%2350) : (i64) -> ()
        func.call @stack_push_pointer(%2351) : (i64) -> ()
        func.call @stack_push_pointer(%2362) : (i64) -> ()
        func.call @stack_push_pointer(%2371) : (i64) -> ()
        %2414 = llvm.mlir.addressof @str240 : !llvm.ptr
        %2415 = func.call @cc_make_function_ref_const(%2414) : (!llvm.ptr) -> i64
        %2416 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2415, %2416) : (i64, i64) -> ()
      }
      %2417 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2417 : i64
    }
    %2418 = func.call @cc_nil_value() : () -> i64
    %2419 = func.call @cc_errorp(%1751) : (i64) -> i64
    %2420 = arith.cmpi ne, %2419, %2418 : i64
    %2421 = scf.if %2420 -> (i64) {
      scf.yield %1751 : i64
    } else {
      %2422 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2423 = arith.constant 19 : i64
      %2424 = func.call @cc_make_string(%2422, %2423) : (!llvm.ptr, i64) -> i64
      %2425 = func.call @cc_nil_value() : () -> i64
      %2426 = func.call @cc_intern(%2424, %2425) : (i64, i64) -> i64
      %2427 = func.call @cc_nil_value() : () -> i64
      %2428 = func.call @cc_cons(%2426, %2427) : (i64, i64) -> i64
      %2429 = func.call @cc_values_pack(%2428) : (i64) -> i64
      func.call @stack_push_pointer(%2426) : (i64) -> ()
      %2430 = func.call @stack_pop_pointer() : () -> i64
      %2431 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2432 = arith.constant 16 : i64
      %2433 = func.call @cc_make_string(%2431, %2432) : (!llvm.ptr, i64) -> i64
      %2434 = func.call @cc_nil_value() : () -> i64
      %2435 = func.call @cc_intern(%2433, %2434) : (i64, i64) -> i64
      %2436 = func.call @cc_nil_value() : () -> i64
      %2437 = func.call @cc_cons(%2435, %2436) : (i64, i64) -> i64
      %2438 = func.call @cc_values_pack(%2437) : (i64) -> i64
      func.call @stack_push_pointer(%2435) : (i64) -> ()
      %2439 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2440 = arith.constant 6 : i64
      %2441 = func.call @cc_make_string(%2439, %2440) : (!llvm.ptr, i64) -> i64
      %2442 = func.call @cc_nil_value() : () -> i64
      %2443 = func.call @cc_intern(%2441, %2442) : (i64, i64) -> i64
      %2444 = func.call @cc_nil_value() : () -> i64
      %2445 = func.call @cc_cons(%2443, %2444) : (i64, i64) -> i64
      %2446 = func.call @cc_values_pack(%2445) : (i64) -> i64
      func.call @stack_push_pointer(%2443) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2447 = func.call @stack_pop_pointer() : () -> i64
      %2448 = func.call @stack_pop_pointer() : () -> i64
      %2449 = func.call @cc_cons(%2448, %2447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2449) : (i64) -> ()
      %2450 = func.call @stack_pop_pointer() : () -> i64
      %2451 = func.call @stack_pop_pointer() : () -> i64
      %2452 = func.call @cc_cons(%2451, %2450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2452) : (i64) -> ()
      %2453 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2454 = arith.constant 6 : i64
      %2455 = func.call @cc_make_string(%2453, %2454) : (!llvm.ptr, i64) -> i64
      %2456 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2457 = arith.constant 11 : i64
      %2458 = func.call @cc_make_string(%2456, %2457) : (!llvm.ptr, i64) -> i64
      %2459 = func.call @cc_intern(%2455, %2458) : (i64, i64) -> i64
      %2460 = func.call @cc_nil_value() : () -> i64
      %2461 = func.call @cc_cons(%2459, %2460) : (i64, i64) -> i64
      %2462 = func.call @cc_values_pack(%2461) : (i64) -> i64
      func.call @stack_push_pointer(%2459) : (i64) -> ()
      %2463 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2464 = arith.constant 6 : i64
      %2465 = func.call @cc_make_string(%2463, %2464) : (!llvm.ptr, i64) -> i64
      %2466 = func.call @cc_nil_value() : () -> i64
      %2467 = func.call @cc_intern(%2465, %2466) : (i64, i64) -> i64
      %2468 = func.call @cc_nil_value() : () -> i64
      %2469 = func.call @cc_cons(%2467, %2468) : (i64, i64) -> i64
      %2470 = func.call @cc_values_pack(%2469) : (i64) -> i64
      func.call @stack_push_pointer(%2467) : (i64) -> ()
      %2471 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2472 = arith.constant 4 : i64
      %2473 = func.call @cc_make_string(%2471, %2472) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2473) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2474 = func.call @stack_pop_pointer() : () -> i64
      %2475 = func.call @stack_pop_pointer() : () -> i64
      %2476 = func.call @cc_cons(%2475, %2474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2476) : (i64) -> ()
      %2477 = func.call @stack_pop_pointer() : () -> i64
      %2478 = func.call @stack_pop_pointer() : () -> i64
      %2479 = func.call @cc_cons(%2478, %2477) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2479) : (i64) -> ()
      %2480 = func.call @stack_pop_pointer() : () -> i64
      %2481 = func.call @stack_pop_pointer() : () -> i64
      %2482 = func.call @cc_cons(%2481, %2480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2482) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2483 = func.call @stack_pop_pointer() : () -> i64
      %2484 = func.call @stack_pop_pointer() : () -> i64
      %2485 = func.call @cc_cons(%2484, %2483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2485) : (i64) -> ()
      %2486 = func.call @stack_pop_pointer() : () -> i64
      %2487 = func.call @stack_pop_pointer() : () -> i64
      %2488 = func.call @cc_cons(%2487, %2486) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2488) : (i64) -> ()
      %2489 = func.call @stack_pop_pointer() : () -> i64
      %2490 = func.call @stack_pop_pointer() : () -> i64
      %2491 = func.call @cc_cons(%2490, %2489) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2491) : (i64) -> ()
      %2492 = func.call @stack_pop_pointer() : () -> i64
      %2723 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2724 = arith.constant 35 : i64
      %2725 = func.call @cc_make_symbol(%2723, %2724) : (!llvm.ptr, i64) -> i64
      %2726 = func.call @cc_persistent_root_value(%2725) : (i64) -> i64
      func.call @stack_push_pointer(%2726) : (i64) -> ()
      %2727 = arith.constant 263377075044364 : i64
      %2728 = arith.constant 1 : i64
      %2729 = func.call @cc_make_closure(%2727, %2728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2729) : (i64) -> ()
      %2730 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2731 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2732 = arith.constant 6 : i64
      %2733 = func.call @cc_make_string(%2731, %2732) : (!llvm.ptr, i64) -> i64
      %2734 = llvm.mlir.addressof @str275 : !llvm.ptr
      %2735 = arith.constant 7 : i64
      %2736 = func.call @cc_make_string(%2734, %2735) : (!llvm.ptr, i64) -> i64
      %2737 = func.call @cc_intern(%2733, %2736) : (i64, i64) -> i64
      %2738 = func.call @cc_nil_value() : () -> i64
      %2739 = func.call @cc_cons(%2737, %2738) : (i64, i64) -> i64
      %2740 = func.call @cc_values_pack(%2739) : (i64) -> i64
      func.call @stack_push_pointer(%2737) : (i64) -> ()
      %2741 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2741) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2742 = func.call @stack_pop_pointer() : () -> i64
      %2743 = func.call @stack_pop_pointer() : () -> i64
      %2744 = func.call @cc_cons(%2743, %2742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2744) : (i64) -> ()
      %2745 = func.call @stack_pop_pointer() : () -> i64
      %2746 = func.call @stack_pop_pointer() : () -> i64
      %2747 = func.call @cc_cons(%2746, %2745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2747) : (i64) -> ()
      %2748 = func.call @stack_pop_pointer() : () -> i64
      %2749 = func.call @stack_pop_pointer() : () -> i64
      %2750 = func.call @cc_cons(%2749, %2748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2750) : (i64) -> ()
      %2751 = func.call @stack_pop_pointer() : () -> i64
      %2752 = llvm.mlir.addressof @str276 : !llvm.ptr
      %2753 = arith.constant 11 : i64
      %2754 = func.call @cc_make_string(%2752, %2753) : (!llvm.ptr, i64) -> i64
      %2755 = llvm.mlir.addressof @str277 : !llvm.ptr
      %2756 = arith.constant 7 : i64
      %2757 = func.call @cc_make_string(%2755, %2756) : (!llvm.ptr, i64) -> i64
      %2758 = func.call @cc_intern(%2754, %2757) : (i64, i64) -> i64
      %2759 = func.call @cc_nil_value() : () -> i64
      %2760 = func.call @cc_cons(%2758, %2759) : (i64, i64) -> i64
      %2761 = func.call @cc_values_pack(%2760) : (i64) -> i64
      func.call @stack_push_pointer(%2758) : (i64) -> ()
      %2762 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2763 = func.call @stack_pop_pointer() : () -> i64
      %2764 = llvm.mlir.addressof @str278 : !llvm.ptr
      %2765 = arith.constant 4 : i64
      %2766 = func.call @cc_make_string(%2764, %2765) : (!llvm.ptr, i64) -> i64
      %2767 = llvm.mlir.addressof @str279 : !llvm.ptr
      %2768 = arith.constant 7 : i64
      %2769 = func.call @cc_make_string(%2767, %2768) : (!llvm.ptr, i64) -> i64
      %2770 = func.call @cc_intern(%2766, %2769) : (i64, i64) -> i64
      %2771 = func.call @cc_nil_value() : () -> i64
      %2772 = func.call @cc_cons(%2770, %2771) : (i64, i64) -> i64
      %2773 = func.call @cc_values_pack(%2772) : (i64) -> i64
      func.call @stack_push_pointer(%2770) : (i64) -> ()
      %2774 = func.call @stack_pop_pointer() : () -> i64
      %2775 = llvm.mlir.addressof @str280 : !llvm.ptr
      %2776 = arith.constant 6 : i64
      %2777 = func.call @cc_make_string(%2775, %2776) : (!llvm.ptr, i64) -> i64
      %2778 = func.call @cc_nil_value() : () -> i64
      %2779 = func.call @cc_intern(%2777, %2778) : (i64, i64) -> i64
      %2780 = func.call @cc_nil_value() : () -> i64
      %2781 = func.call @cc_cons(%2779, %2780) : (i64, i64) -> i64
      %2782 = func.call @cc_values_pack(%2781) : (i64) -> i64
      func.call @stack_push_pointer(%2779) : (i64) -> ()
      %2783 = func.call @stack_pop_pointer() : () -> i64
      %2784 = func.call @cc_nil_value() : () -> i64
      %2785 = func.call @cc_errorp(%2430) : (i64) -> i64
      %2786 = arith.cmpi ne, %2785, %2784 : i64
      %2787 = arith.cmpi eq, %2784, %2784 : i64
      %2788 = arith.andi %2786, %2787 : i1
      %2789 = scf.if %2788 -> (i64) {
        scf.yield %2430 : i64
      } else {
        scf.yield %2784 : i64
      }
      %2790 = func.call @cc_errorp(%2492) : (i64) -> i64
      %2791 = arith.cmpi ne, %2790, %2784 : i64
      %2792 = arith.cmpi eq, %2789, %2784 : i64
      %2793 = arith.andi %2791, %2792 : i1
      %2794 = scf.if %2793 -> (i64) {
        scf.yield %2492 : i64
      } else {
        scf.yield %2789 : i64
      }
      %2795 = func.call @cc_errorp(%2730) : (i64) -> i64
      %2796 = arith.cmpi ne, %2795, %2784 : i64
      %2797 = arith.cmpi eq, %2794, %2784 : i64
      %2798 = arith.andi %2796, %2797 : i1
      %2799 = scf.if %2798 -> (i64) {
        scf.yield %2730 : i64
      } else {
        scf.yield %2794 : i64
      }
      %2800 = func.call @cc_errorp(%2751) : (i64) -> i64
      %2801 = arith.cmpi ne, %2800, %2784 : i64
      %2802 = arith.cmpi eq, %2799, %2784 : i64
      %2803 = arith.andi %2801, %2802 : i1
      %2804 = scf.if %2803 -> (i64) {
        scf.yield %2751 : i64
      } else {
        scf.yield %2799 : i64
      }
      %2805 = func.call @cc_errorp(%2762) : (i64) -> i64
      %2806 = arith.cmpi ne, %2805, %2784 : i64
      %2807 = arith.cmpi eq, %2804, %2784 : i64
      %2808 = arith.andi %2806, %2807 : i1
      %2809 = scf.if %2808 -> (i64) {
        scf.yield %2762 : i64
      } else {
        scf.yield %2804 : i64
      }
      %2810 = func.call @cc_errorp(%2763) : (i64) -> i64
      %2811 = arith.cmpi ne, %2810, %2784 : i64
      %2812 = arith.cmpi eq, %2809, %2784 : i64
      %2813 = arith.andi %2811, %2812 : i1
      %2814 = scf.if %2813 -> (i64) {
        scf.yield %2763 : i64
      } else {
        scf.yield %2809 : i64
      }
      %2815 = func.call @cc_errorp(%2774) : (i64) -> i64
      %2816 = arith.cmpi ne, %2815, %2784 : i64
      %2817 = arith.cmpi eq, %2814, %2784 : i64
      %2818 = arith.andi %2816, %2817 : i1
      %2819 = scf.if %2818 -> (i64) {
        scf.yield %2774 : i64
      } else {
        scf.yield %2814 : i64
      }
      %2820 = func.call @cc_errorp(%2783) : (i64) -> i64
      %2821 = arith.cmpi ne, %2820, %2784 : i64
      %2822 = arith.cmpi eq, %2819, %2784 : i64
      %2823 = arith.andi %2821, %2822 : i1
      %2824 = scf.if %2823 -> (i64) {
        scf.yield %2783 : i64
      } else {
        scf.yield %2819 : i64
      }
      %2825 = arith.cmpi ne, %2824, %2784 : i64
      scf.if %2825 {
        func.call @stack_push_pointer(%2824) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2430) : (i64) -> ()
        func.call @stack_push_pointer(%2492) : (i64) -> ()
        func.call @stack_push_pointer(%2730) : (i64) -> ()
        func.call @stack_push_pointer(%2751) : (i64) -> ()
        func.call @stack_push_pointer(%2762) : (i64) -> ()
        func.call @stack_push_pointer(%2763) : (i64) -> ()
        func.call @stack_push_pointer(%2774) : (i64) -> ()
        func.call @stack_push_pointer(%2783) : (i64) -> ()
        %2826 = llvm.mlir.addressof @str281 : !llvm.ptr
        %2827 = func.call @cc_make_function_ref_const(%2826) : (!llvm.ptr) -> i64
        %2828 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2827, %2828) : (i64, i64) -> ()
      }
      %2829 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2829 : i64
    }
    %2830 = func.call @cc_nil_value() : () -> i64
    %2831 = func.call @cc_errorp(%2421) : (i64) -> i64
    %2832 = arith.cmpi ne, %2831, %2830 : i64
    %2833 = scf.if %2832 -> (i64) {
      scf.yield %2421 : i64
    } else {
      %2834 = llvm.mlir.addressof @str282 : !llvm.ptr
      %2835 = arith.constant 19 : i64
      %2836 = func.call @cc_make_string(%2834, %2835) : (!llvm.ptr, i64) -> i64
      %2837 = func.call @cc_nil_value() : () -> i64
      %2838 = func.call @cc_intern(%2836, %2837) : (i64, i64) -> i64
      %2839 = func.call @cc_nil_value() : () -> i64
      %2840 = func.call @cc_cons(%2838, %2839) : (i64, i64) -> i64
      %2841 = func.call @cc_values_pack(%2840) : (i64) -> i64
      func.call @stack_push_pointer(%2838) : (i64) -> ()
      %2842 = func.call @stack_pop_pointer() : () -> i64
      %2843 = llvm.mlir.addressof @str283 : !llvm.ptr
      %2844 = arith.constant 16 : i64
      %2845 = func.call @cc_make_string(%2843, %2844) : (!llvm.ptr, i64) -> i64
      %2846 = func.call @cc_nil_value() : () -> i64
      %2847 = func.call @cc_intern(%2845, %2846) : (i64, i64) -> i64
      %2848 = func.call @cc_nil_value() : () -> i64
      %2849 = func.call @cc_cons(%2847, %2848) : (i64, i64) -> i64
      %2850 = func.call @cc_values_pack(%2849) : (i64) -> i64
      func.call @stack_push_pointer(%2847) : (i64) -> ()
      %2851 = llvm.mlir.addressof @str284 : !llvm.ptr
      %2852 = arith.constant 6 : i64
      %2853 = func.call @cc_make_string(%2851, %2852) : (!llvm.ptr, i64) -> i64
      %2854 = func.call @cc_nil_value() : () -> i64
      %2855 = func.call @cc_intern(%2853, %2854) : (i64, i64) -> i64
      %2856 = func.call @cc_nil_value() : () -> i64
      %2857 = func.call @cc_cons(%2855, %2856) : (i64, i64) -> i64
      %2858 = func.call @cc_values_pack(%2857) : (i64) -> i64
      func.call @stack_push_pointer(%2855) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2859 = llvm.mlir.addressof @str285 : !llvm.ptr
      %2860 = arith.constant 5 : i64
      %2861 = func.call @cc_make_string(%2859, %2860) : (!llvm.ptr, i64) -> i64
      %2862 = llvm.mlir.addressof @str286 : !llvm.ptr
      %2863 = arith.constant 7 : i64
      %2864 = func.call @cc_make_string(%2862, %2863) : (!llvm.ptr, i64) -> i64
      %2865 = func.call @cc_intern(%2861, %2864) : (i64, i64) -> i64
      %2866 = func.call @cc_nil_value() : () -> i64
      %2867 = func.call @cc_cons(%2865, %2866) : (i64, i64) -> i64
      %2868 = func.call @cc_values_pack(%2867) : (i64) -> i64
      func.call @stack_push_pointer(%2865) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2869 = func.call @stack_pop_pointer() : () -> i64
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @cc_cons(%2870, %2869) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2871) : (i64) -> ()
      %2872 = func.call @stack_pop_pointer() : () -> i64
      %2873 = func.call @stack_pop_pointer() : () -> i64
      %2874 = func.call @cc_cons(%2873, %2872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2874) : (i64) -> ()
      %2875 = func.call @stack_pop_pointer() : () -> i64
      %2876 = func.call @stack_pop_pointer() : () -> i64
      %2877 = func.call @cc_cons(%2876, %2875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2877) : (i64) -> ()
      %2878 = func.call @stack_pop_pointer() : () -> i64
      %2879 = func.call @stack_pop_pointer() : () -> i64
      %2880 = func.call @cc_cons(%2879, %2878) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2880) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2881 = func.call @stack_pop_pointer() : () -> i64
      %2882 = func.call @stack_pop_pointer() : () -> i64
      %2883 = func.call @cc_cons(%2882, %2881) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2883) : (i64) -> ()
      %2884 = func.call @stack_pop_pointer() : () -> i64
      %2885 = func.call @stack_pop_pointer() : () -> i64
      %2886 = func.call @cc_cons(%2885, %2884) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2886) : (i64) -> ()
      %2887 = func.call @stack_pop_pointer() : () -> i64
      %3126 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3127 = arith.constant 35 : i64
      %3128 = func.call @cc_make_symbol(%3126, %3127) : (!llvm.ptr, i64) -> i64
      %3129 = func.call @cc_persistent_root_value(%3128) : (i64) -> i64
      func.call @stack_push_pointer(%3129) : (i64) -> ()
      %3130 = arith.constant 263377075044366 : i64
      %3131 = arith.constant 1 : i64
      %3132 = func.call @cc_make_closure(%3130, %3131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3132) : (i64) -> ()
      %3133 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3134 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3135 = arith.constant 6 : i64
      %3136 = func.call @cc_make_string(%3134, %3135) : (!llvm.ptr, i64) -> i64
      %3137 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3138 = arith.constant 7 : i64
      %3139 = func.call @cc_make_string(%3137, %3138) : (!llvm.ptr, i64) -> i64
      %3140 = func.call @cc_intern(%3136, %3139) : (i64, i64) -> i64
      %3141 = func.call @cc_nil_value() : () -> i64
      %3142 = func.call @cc_cons(%3140, %3141) : (i64, i64) -> i64
      %3143 = func.call @cc_values_pack(%3142) : (i64) -> i64
      func.call @stack_push_pointer(%3140) : (i64) -> ()
      %3144 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%3144) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3145 = func.call @stack_pop_pointer() : () -> i64
      %3146 = func.call @stack_pop_pointer() : () -> i64
      %3147 = func.call @cc_cons(%3146, %3145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3147) : (i64) -> ()
      %3148 = func.call @stack_pop_pointer() : () -> i64
      %3149 = func.call @stack_pop_pointer() : () -> i64
      %3150 = func.call @cc_cons(%3149, %3148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3150) : (i64) -> ()
      %3151 = func.call @stack_pop_pointer() : () -> i64
      %3152 = func.call @stack_pop_pointer() : () -> i64
      %3153 = func.call @cc_cons(%3152, %3151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3153) : (i64) -> ()
      %3154 = func.call @stack_pop_pointer() : () -> i64
      %3155 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3156 = arith.constant 11 : i64
      %3157 = func.call @cc_make_string(%3155, %3156) : (!llvm.ptr, i64) -> i64
      %3158 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3159 = arith.constant 7 : i64
      %3160 = func.call @cc_make_string(%3158, %3159) : (!llvm.ptr, i64) -> i64
      %3161 = func.call @cc_intern(%3157, %3160) : (i64, i64) -> i64
      %3162 = func.call @cc_nil_value() : () -> i64
      %3163 = func.call @cc_cons(%3161, %3162) : (i64, i64) -> i64
      %3164 = func.call @cc_values_pack(%3163) : (i64) -> i64
      func.call @stack_push_pointer(%3161) : (i64) -> ()
      %3165 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3166 = func.call @stack_pop_pointer() : () -> i64
      %3167 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3168 = arith.constant 4 : i64
      %3169 = func.call @cc_make_string(%3167, %3168) : (!llvm.ptr, i64) -> i64
      %3170 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3171 = arith.constant 7 : i64
      %3172 = func.call @cc_make_string(%3170, %3171) : (!llvm.ptr, i64) -> i64
      %3173 = func.call @cc_intern(%3169, %3172) : (i64, i64) -> i64
      %3174 = func.call @cc_nil_value() : () -> i64
      %3175 = func.call @cc_cons(%3173, %3174) : (i64, i64) -> i64
      %3176 = func.call @cc_values_pack(%3175) : (i64) -> i64
      func.call @stack_push_pointer(%3173) : (i64) -> ()
      %3177 = func.call @stack_pop_pointer() : () -> i64
      %3178 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3179 = arith.constant 6 : i64
      %3180 = func.call @cc_make_string(%3178, %3179) : (!llvm.ptr, i64) -> i64
      %3181 = func.call @cc_nil_value() : () -> i64
      %3182 = func.call @cc_intern(%3180, %3181) : (i64, i64) -> i64
      %3183 = func.call @cc_nil_value() : () -> i64
      %3184 = func.call @cc_cons(%3182, %3183) : (i64, i64) -> i64
      %3185 = func.call @cc_values_pack(%3184) : (i64) -> i64
      func.call @stack_push_pointer(%3182) : (i64) -> ()
      %3186 = func.call @stack_pop_pointer() : () -> i64
      %3187 = func.call @cc_nil_value() : () -> i64
      %3188 = func.call @cc_errorp(%2842) : (i64) -> i64
      %3189 = arith.cmpi ne, %3188, %3187 : i64
      %3190 = arith.cmpi eq, %3187, %3187 : i64
      %3191 = arith.andi %3189, %3190 : i1
      %3192 = scf.if %3191 -> (i64) {
        scf.yield %2842 : i64
      } else {
        scf.yield %3187 : i64
      }
      %3193 = func.call @cc_errorp(%2887) : (i64) -> i64
      %3194 = arith.cmpi ne, %3193, %3187 : i64
      %3195 = arith.cmpi eq, %3192, %3187 : i64
      %3196 = arith.andi %3194, %3195 : i1
      %3197 = scf.if %3196 -> (i64) {
        scf.yield %2887 : i64
      } else {
        scf.yield %3192 : i64
      }
      %3198 = func.call @cc_errorp(%3133) : (i64) -> i64
      %3199 = arith.cmpi ne, %3198, %3187 : i64
      %3200 = arith.cmpi eq, %3197, %3187 : i64
      %3201 = arith.andi %3199, %3200 : i1
      %3202 = scf.if %3201 -> (i64) {
        scf.yield %3133 : i64
      } else {
        scf.yield %3197 : i64
      }
      %3203 = func.call @cc_errorp(%3154) : (i64) -> i64
      %3204 = arith.cmpi ne, %3203, %3187 : i64
      %3205 = arith.cmpi eq, %3202, %3187 : i64
      %3206 = arith.andi %3204, %3205 : i1
      %3207 = scf.if %3206 -> (i64) {
        scf.yield %3154 : i64
      } else {
        scf.yield %3202 : i64
      }
      %3208 = func.call @cc_errorp(%3165) : (i64) -> i64
      %3209 = arith.cmpi ne, %3208, %3187 : i64
      %3210 = arith.cmpi eq, %3207, %3187 : i64
      %3211 = arith.andi %3209, %3210 : i1
      %3212 = scf.if %3211 -> (i64) {
        scf.yield %3165 : i64
      } else {
        scf.yield %3207 : i64
      }
      %3213 = func.call @cc_errorp(%3166) : (i64) -> i64
      %3214 = arith.cmpi ne, %3213, %3187 : i64
      %3215 = arith.cmpi eq, %3212, %3187 : i64
      %3216 = arith.andi %3214, %3215 : i1
      %3217 = scf.if %3216 -> (i64) {
        scf.yield %3166 : i64
      } else {
        scf.yield %3212 : i64
      }
      %3218 = func.call @cc_errorp(%3177) : (i64) -> i64
      %3219 = arith.cmpi ne, %3218, %3187 : i64
      %3220 = arith.cmpi eq, %3217, %3187 : i64
      %3221 = arith.andi %3219, %3220 : i1
      %3222 = scf.if %3221 -> (i64) {
        scf.yield %3177 : i64
      } else {
        scf.yield %3217 : i64
      }
      %3223 = func.call @cc_errorp(%3186) : (i64) -> i64
      %3224 = arith.cmpi ne, %3223, %3187 : i64
      %3225 = arith.cmpi eq, %3222, %3187 : i64
      %3226 = arith.andi %3224, %3225 : i1
      %3227 = scf.if %3226 -> (i64) {
        scf.yield %3186 : i64
      } else {
        scf.yield %3222 : i64
      }
      %3228 = arith.cmpi ne, %3227, %3187 : i64
      scf.if %3228 {
        func.call @stack_push_pointer(%3227) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2842) : (i64) -> ()
        func.call @stack_push_pointer(%2887) : (i64) -> ()
        func.call @stack_push_pointer(%3133) : (i64) -> ()
        func.call @stack_push_pointer(%3154) : (i64) -> ()
        func.call @stack_push_pointer(%3165) : (i64) -> ()
        func.call @stack_push_pointer(%3166) : (i64) -> ()
        func.call @stack_push_pointer(%3177) : (i64) -> ()
        func.call @stack_push_pointer(%3186) : (i64) -> ()
        %3229 = llvm.mlir.addressof @str320 : !llvm.ptr
        %3230 = func.call @cc_make_function_ref_const(%3229) : (!llvm.ptr) -> i64
        %3231 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3230, %3231) : (i64, i64) -> ()
      }
      %3232 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3232 : i64
    }
    %3233 = func.call @cc_nil_value() : () -> i64
    %3234 = func.call @cc_errorp(%2833) : (i64) -> i64
    %3235 = arith.cmpi ne, %3234, %3233 : i64
    %3236 = scf.if %3235 -> (i64) {
      scf.yield %2833 : i64
    } else {
      %3237 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3238 = arith.constant 14 : i64
      %3239 = func.call @cc_make_string(%3237, %3238) : (!llvm.ptr, i64) -> i64
      %3240 = func.call @cc_nil_value() : () -> i64
      %3241 = func.call @cc_intern(%3239, %3240) : (i64, i64) -> i64
      %3242 = func.call @cc_nil_value() : () -> i64
      %3243 = func.call @cc_cons(%3241, %3242) : (i64, i64) -> i64
      %3244 = func.call @cc_values_pack(%3243) : (i64) -> i64
      func.call @stack_push_pointer(%3241) : (i64) -> ()
      %3245 = func.call @stack_pop_pointer() : () -> i64
      %3246 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3247 = arith.constant 5 : i64
      %3248 = func.call @cc_make_string(%3246, %3247) : (!llvm.ptr, i64) -> i64
      %3249 = func.call @cc_nil_value() : () -> i64
      %3250 = func.call @cc_intern(%3248, %3249) : (i64, i64) -> i64
      %3251 = func.call @cc_nil_value() : () -> i64
      %3252 = func.call @cc_cons(%3250, %3251) : (i64, i64) -> i64
      %3253 = func.call @cc_values_pack(%3252) : (i64) -> i64
      func.call @stack_push_pointer(%3250) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3254 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3255 = arith.constant 21 : i64
      %3256 = func.call @cc_make_string(%3254, %3255) : (!llvm.ptr, i64) -> i64
      %3257 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3258 = arith.constant 11 : i64
      %3259 = func.call @cc_make_string(%3257, %3258) : (!llvm.ptr, i64) -> i64
      %3260 = func.call @cc_intern(%3256, %3259) : (i64, i64) -> i64
      %3261 = func.call @cc_nil_value() : () -> i64
      %3262 = func.call @cc_cons(%3260, %3261) : (i64, i64) -> i64
      %3263 = func.call @cc_values_pack(%3262) : (i64) -> i64
      func.call @stack_push_pointer(%3260) : (i64) -> ()
      %3264 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3265 = arith.constant 13 : i64
      %3266 = func.call @cc_make_string(%3264, %3265) : (!llvm.ptr, i64) -> i64
      %3267 = func.call @cc_nil_value() : () -> i64
      %3268 = func.call @cc_intern(%3266, %3267) : (i64, i64) -> i64
      %3269 = func.call @cc_nil_value() : () -> i64
      %3270 = func.call @cc_cons(%3268, %3269) : (i64, i64) -> i64
      %3271 = func.call @cc_values_pack(%3270) : (i64) -> i64
      func.call @stack_push_pointer(%3268) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3272 = func.call @stack_pop_pointer() : () -> i64
      %3273 = func.call @stack_pop_pointer() : () -> i64
      %3274 = func.call @cc_cons(%3273, %3272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3274) : (i64) -> ()
      %3275 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3276 = arith.constant 21 : i64
      %3277 = func.call @cc_make_string(%3275, %3276) : (!llvm.ptr, i64) -> i64
      %3278 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3279 = arith.constant 11 : i64
      %3280 = func.call @cc_make_string(%3278, %3279) : (!llvm.ptr, i64) -> i64
      %3281 = func.call @cc_intern(%3277, %3280) : (i64, i64) -> i64
      %3282 = func.call @cc_nil_value() : () -> i64
      %3283 = func.call @cc_cons(%3281, %3282) : (i64, i64) -> i64
      %3284 = func.call @cc_values_pack(%3283) : (i64) -> i64
      func.call @stack_push_pointer(%3281) : (i64) -> ()
      %3285 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3286 = arith.constant 12 : i64
      %3287 = func.call @cc_make_string(%3285, %3286) : (!llvm.ptr, i64) -> i64
      %3288 = func.call @cc_nil_value() : () -> i64
      %3289 = func.call @cc_intern(%3287, %3288) : (i64, i64) -> i64
      %3290 = func.call @cc_nil_value() : () -> i64
      %3291 = func.call @cc_cons(%3289, %3290) : (i64, i64) -> i64
      %3292 = func.call @cc_values_pack(%3291) : (i64) -> i64
      func.call @stack_push_pointer(%3289) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3293 = func.call @stack_pop_pointer() : () -> i64
      %3294 = func.call @stack_pop_pointer() : () -> i64
      %3295 = func.call @cc_cons(%3294, %3293) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3295) : (i64) -> ()
      %3296 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3297 = arith.constant 22 : i64
      %3298 = func.call @cc_make_string(%3296, %3297) : (!llvm.ptr, i64) -> i64
      %3299 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3300 = arith.constant 11 : i64
      %3301 = func.call @cc_make_string(%3299, %3300) : (!llvm.ptr, i64) -> i64
      %3302 = func.call @cc_intern(%3298, %3301) : (i64, i64) -> i64
      %3303 = func.call @cc_nil_value() : () -> i64
      %3304 = func.call @cc_cons(%3302, %3303) : (i64, i64) -> i64
      %3305 = func.call @cc_values_pack(%3304) : (i64) -> i64
      func.call @stack_push_pointer(%3302) : (i64) -> ()
      %3306 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3307 = arith.constant 12 : i64
      %3308 = func.call @cc_make_string(%3306, %3307) : (!llvm.ptr, i64) -> i64
      %3309 = func.call @cc_nil_value() : () -> i64
      %3310 = func.call @cc_intern(%3308, %3309) : (i64, i64) -> i64
      %3311 = func.call @cc_nil_value() : () -> i64
      %3312 = func.call @cc_cons(%3310, %3311) : (i64, i64) -> i64
      %3313 = func.call @cc_values_pack(%3312) : (i64) -> i64
      func.call @stack_push_pointer(%3310) : (i64) -> ()
      %3314 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3315 = arith.constant 3 : i64
      %3316 = func.call @cc_make_string(%3314, %3315) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3316) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3317 = func.call @stack_pop_pointer() : () -> i64
      %3318 = func.call @stack_pop_pointer() : () -> i64
      %3319 = func.call @cc_cons(%3318, %3317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3319) : (i64) -> ()
      %3320 = func.call @stack_pop_pointer() : () -> i64
      %3321 = func.call @stack_pop_pointer() : () -> i64
      %3322 = func.call @cc_cons(%3321, %3320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3322) : (i64) -> ()
      %3323 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3324 = arith.constant 16 : i64
      %3325 = func.call @cc_make_string(%3323, %3324) : (!llvm.ptr, i64) -> i64
      %3326 = func.call @cc_nil_value() : () -> i64
      %3327 = func.call @cc_intern(%3325, %3326) : (i64, i64) -> i64
      %3328 = func.call @cc_nil_value() : () -> i64
      %3329 = func.call @cc_cons(%3327, %3328) : (i64, i64) -> i64
      %3330 = func.call @cc_values_pack(%3329) : (i64) -> i64
      func.call @stack_push_pointer(%3327) : (i64) -> ()
      %3331 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3332 = arith.constant 6 : i64
      %3333 = func.call @cc_make_string(%3331, %3332) : (!llvm.ptr, i64) -> i64
      %3334 = func.call @cc_nil_value() : () -> i64
      %3335 = func.call @cc_intern(%3333, %3334) : (i64, i64) -> i64
      %3336 = func.call @cc_nil_value() : () -> i64
      %3337 = func.call @cc_cons(%3335, %3336) : (i64, i64) -> i64
      %3338 = func.call @cc_values_pack(%3337) : (i64) -> i64
      func.call @stack_push_pointer(%3335) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3339 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3340 = arith.constant 5 : i64
      %3341 = func.call @cc_make_string(%3339, %3340) : (!llvm.ptr, i64) -> i64
      %3342 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3343 = arith.constant 7 : i64
      %3344 = func.call @cc_make_string(%3342, %3343) : (!llvm.ptr, i64) -> i64
      %3345 = func.call @cc_intern(%3341, %3344) : (i64, i64) -> i64
      %3346 = func.call @cc_nil_value() : () -> i64
      %3347 = func.call @cc_cons(%3345, %3346) : (i64, i64) -> i64
      %3348 = func.call @cc_values_pack(%3347) : (i64) -> i64
      func.call @stack_push_pointer(%3345) : (i64) -> ()
      %3349 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3350 = arith.constant 12 : i64
      %3351 = func.call @cc_make_string(%3349, %3350) : (!llvm.ptr, i64) -> i64
      %3352 = func.call @cc_nil_value() : () -> i64
      %3353 = func.call @cc_intern(%3351, %3352) : (i64, i64) -> i64
      %3354 = func.call @cc_nil_value() : () -> i64
      %3355 = func.call @cc_cons(%3353, %3354) : (i64, i64) -> i64
      %3356 = func.call @cc_values_pack(%3355) : (i64) -> i64
      func.call @stack_push_pointer(%3353) : (i64) -> ()
      %3357 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3358 = arith.constant 6 : i64
      %3359 = func.call @cc_make_string(%3357, %3358) : (!llvm.ptr, i64) -> i64
      %3360 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3361 = arith.constant 7 : i64
      %3362 = func.call @cc_make_string(%3360, %3361) : (!llvm.ptr, i64) -> i64
      %3363 = func.call @cc_intern(%3359, %3362) : (i64, i64) -> i64
      %3364 = func.call @cc_nil_value() : () -> i64
      %3365 = func.call @cc_cons(%3363, %3364) : (i64, i64) -> i64
      %3366 = func.call @cc_values_pack(%3365) : (i64) -> i64
      func.call @stack_push_pointer(%3363) : (i64) -> ()
      %3367 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3368 = arith.constant 13 : i64
      %3369 = func.call @cc_make_string(%3367, %3368) : (!llvm.ptr, i64) -> i64
      %3370 = func.call @cc_nil_value() : () -> i64
      %3371 = func.call @cc_intern(%3369, %3370) : (i64, i64) -> i64
      %3372 = func.call @cc_nil_value() : () -> i64
      %3373 = func.call @cc_cons(%3371, %3372) : (i64, i64) -> i64
      %3374 = func.call @cc_values_pack(%3373) : (i64) -> i64
      func.call @stack_push_pointer(%3371) : (i64) -> ()
      %3375 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3376 = arith.constant 5 : i64
      %3377 = func.call @cc_make_string(%3375, %3376) : (!llvm.ptr, i64) -> i64
      %3378 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3379 = arith.constant 7 : i64
      %3380 = func.call @cc_make_string(%3378, %3379) : (!llvm.ptr, i64) -> i64
      %3381 = func.call @cc_intern(%3377, %3380) : (i64, i64) -> i64
      %3382 = func.call @cc_nil_value() : () -> i64
      %3383 = func.call @cc_cons(%3381, %3382) : (i64, i64) -> i64
      %3384 = func.call @cc_values_pack(%3383) : (i64) -> i64
      func.call @stack_push_pointer(%3381) : (i64) -> ()
      %3385 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3386 = arith.constant 12 : i64
      %3387 = func.call @cc_make_string(%3385, %3386) : (!llvm.ptr, i64) -> i64
      %3388 = func.call @cc_nil_value() : () -> i64
      %3389 = func.call @cc_intern(%3387, %3388) : (i64, i64) -> i64
      %3390 = func.call @cc_nil_value() : () -> i64
      %3391 = func.call @cc_cons(%3389, %3390) : (i64, i64) -> i64
      %3392 = func.call @cc_values_pack(%3391) : (i64) -> i64
      func.call @stack_push_pointer(%3389) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3393 = func.call @stack_pop_pointer() : () -> i64
      %3394 = func.call @stack_pop_pointer() : () -> i64
      %3395 = func.call @cc_cons(%3394, %3393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3395) : (i64) -> ()
      %3396 = func.call @stack_pop_pointer() : () -> i64
      %3397 = func.call @stack_pop_pointer() : () -> i64
      %3398 = func.call @cc_cons(%3397, %3396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3398) : (i64) -> ()
      %3399 = func.call @stack_pop_pointer() : () -> i64
      %3400 = func.call @stack_pop_pointer() : () -> i64
      %3401 = func.call @cc_cons(%3400, %3399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3401) : (i64) -> ()
      %3402 = func.call @stack_pop_pointer() : () -> i64
      %3403 = func.call @stack_pop_pointer() : () -> i64
      %3404 = func.call @cc_cons(%3403, %3402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3404) : (i64) -> ()
      %3405 = func.call @stack_pop_pointer() : () -> i64
      %3406 = func.call @stack_pop_pointer() : () -> i64
      %3407 = func.call @cc_cons(%3406, %3405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3407) : (i64) -> ()
      %3408 = func.call @stack_pop_pointer() : () -> i64
      %3409 = func.call @stack_pop_pointer() : () -> i64
      %3410 = func.call @cc_cons(%3409, %3408) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3410) : (i64) -> ()
      %3411 = func.call @stack_pop_pointer() : () -> i64
      %3412 = func.call @stack_pop_pointer() : () -> i64
      %3413 = func.call @cc_cons(%3412, %3411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3413) : (i64) -> ()
      %3414 = func.call @stack_pop_pointer() : () -> i64
      %3415 = func.call @stack_pop_pointer() : () -> i64
      %3416 = func.call @cc_cons(%3415, %3414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3416) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3417 = func.call @stack_pop_pointer() : () -> i64
      %3418 = func.call @stack_pop_pointer() : () -> i64
      %3419 = func.call @cc_cons(%3418, %3417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3419) : (i64) -> ()
      %3420 = func.call @stack_pop_pointer() : () -> i64
      %3421 = func.call @stack_pop_pointer() : () -> i64
      %3422 = func.call @cc_cons(%3421, %3420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3422) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3423 = func.call @stack_pop_pointer() : () -> i64
      %3424 = func.call @stack_pop_pointer() : () -> i64
      %3425 = func.call @cc_cons(%3424, %3423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3425) : (i64) -> ()
      %3426 = func.call @stack_pop_pointer() : () -> i64
      %3427 = func.call @stack_pop_pointer() : () -> i64
      %3428 = func.call @cc_cons(%3427, %3426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3428) : (i64) -> ()
      %3429 = func.call @stack_pop_pointer() : () -> i64
      %3430 = func.call @stack_pop_pointer() : () -> i64
      %3431 = func.call @cc_cons(%3430, %3429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3431) : (i64) -> ()
      %3432 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3433 = arith.constant 11 : i64
      %3434 = func.call @cc_make_string(%3432, %3433) : (!llvm.ptr, i64) -> i64
      %3435 = func.call @cc_nil_value() : () -> i64
      %3436 = func.call @cc_intern(%3434, %3435) : (i64, i64) -> i64
      %3437 = func.call @cc_nil_value() : () -> i64
      %3438 = func.call @cc_cons(%3436, %3437) : (i64, i64) -> i64
      %3439 = func.call @cc_values_pack(%3438) : (i64) -> i64
      func.call @stack_push_pointer(%3436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3440 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3441 = arith.constant 6 : i64
      %3442 = func.call @cc_make_string(%3440, %3441) : (!llvm.ptr, i64) -> i64
      %3443 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3444 = arith.constant 11 : i64
      %3445 = func.call @cc_make_string(%3443, %3444) : (!llvm.ptr, i64) -> i64
      %3446 = func.call @cc_intern(%3442, %3445) : (i64, i64) -> i64
      %3447 = func.call @cc_nil_value() : () -> i64
      %3448 = func.call @cc_cons(%3446, %3447) : (i64, i64) -> i64
      %3449 = func.call @cc_values_pack(%3448) : (i64) -> i64
      func.call @stack_push_pointer(%3446) : (i64) -> ()
      %3450 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3451 = arith.constant 5 : i64
      %3452 = func.call @cc_make_string(%3450, %3451) : (!llvm.ptr, i64) -> i64
      %3453 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3454 = arith.constant 11 : i64
      %3455 = func.call @cc_make_string(%3453, %3454) : (!llvm.ptr, i64) -> i64
      %3456 = func.call @cc_intern(%3452, %3455) : (i64, i64) -> i64
      %3457 = func.call @cc_nil_value() : () -> i64
      %3458 = func.call @cc_cons(%3456, %3457) : (i64, i64) -> i64
      %3459 = func.call @cc_values_pack(%3458) : (i64) -> i64
      func.call @stack_push_pointer(%3456) : (i64) -> ()
      %3460 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3461 = arith.constant 6 : i64
      %3462 = func.call @cc_make_string(%3460, %3461) : (!llvm.ptr, i64) -> i64
      %3463 = llvm.mlir.addressof @str350 : !llvm.ptr
      %3464 = arith.constant 11 : i64
      %3465 = func.call @cc_make_string(%3463, %3464) : (!llvm.ptr, i64) -> i64
      %3466 = func.call @cc_intern(%3462, %3465) : (i64, i64) -> i64
      %3467 = func.call @cc_nil_value() : () -> i64
      %3468 = func.call @cc_cons(%3466, %3467) : (i64, i64) -> i64
      %3469 = func.call @cc_values_pack(%3468) : (i64) -> i64
      func.call @stack_push_pointer(%3466) : (i64) -> ()
      %3470 = llvm.mlir.addressof @str351 : !llvm.ptr
      %3471 = arith.constant 24 : i64
      %3472 = func.call @cc_make_string(%3470, %3471) : (!llvm.ptr, i64) -> i64
      %3473 = llvm.mlir.addressof @str352 : !llvm.ptr
      %3474 = arith.constant 11 : i64
      %3475 = func.call @cc_make_string(%3473, %3474) : (!llvm.ptr, i64) -> i64
      %3476 = func.call @cc_intern(%3472, %3475) : (i64, i64) -> i64
      %3477 = func.call @cc_nil_value() : () -> i64
      %3478 = func.call @cc_cons(%3476, %3477) : (i64, i64) -> i64
      %3479 = func.call @cc_values_pack(%3478) : (i64) -> i64
      func.call @stack_push_pointer(%3476) : (i64) -> ()
      %3480 = llvm.mlir.addressof @str353 : !llvm.ptr
      %3481 = arith.constant 13 : i64
      %3482 = func.call @cc_make_string(%3480, %3481) : (!llvm.ptr, i64) -> i64
      %3483 = func.call @cc_nil_value() : () -> i64
      %3484 = func.call @cc_intern(%3482, %3483) : (i64, i64) -> i64
      %3485 = func.call @cc_nil_value() : () -> i64
      %3486 = func.call @cc_cons(%3484, %3485) : (i64, i64) -> i64
      %3487 = func.call @cc_values_pack(%3486) : (i64) -> i64
      func.call @stack_push_pointer(%3484) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3488 = func.call @stack_pop_pointer() : () -> i64
      %3489 = func.call @stack_pop_pointer() : () -> i64
      %3490 = func.call @cc_cons(%3489, %3488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3490) : (i64) -> ()
      %3491 = func.call @stack_pop_pointer() : () -> i64
      %3492 = func.call @stack_pop_pointer() : () -> i64
      %3493 = func.call @cc_cons(%3492, %3491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3493) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3494 = func.call @stack_pop_pointer() : () -> i64
      %3495 = func.call @stack_pop_pointer() : () -> i64
      %3496 = func.call @cc_cons(%3495, %3494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3496) : (i64) -> ()
      %3497 = func.call @stack_pop_pointer() : () -> i64
      %3498 = func.call @stack_pop_pointer() : () -> i64
      %3499 = func.call @cc_cons(%3498, %3497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3499) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3500 = func.call @stack_pop_pointer() : () -> i64
      %3501 = func.call @stack_pop_pointer() : () -> i64
      %3502 = func.call @cc_cons(%3501, %3500) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3502) : (i64) -> ()
      %3503 = func.call @stack_pop_pointer() : () -> i64
      %3504 = func.call @stack_pop_pointer() : () -> i64
      %3505 = func.call @cc_cons(%3504, %3503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3505) : (i64) -> ()
      %3506 = llvm.mlir.addressof @str354 : !llvm.ptr
      %3507 = arith.constant 5 : i64
      %3508 = func.call @cc_make_string(%3506, %3507) : (!llvm.ptr, i64) -> i64
      %3509 = llvm.mlir.addressof @str355 : !llvm.ptr
      %3510 = arith.constant 11 : i64
      %3511 = func.call @cc_make_string(%3509, %3510) : (!llvm.ptr, i64) -> i64
      %3512 = func.call @cc_intern(%3508, %3511) : (i64, i64) -> i64
      %3513 = func.call @cc_nil_value() : () -> i64
      %3514 = func.call @cc_cons(%3512, %3513) : (i64, i64) -> i64
      %3515 = func.call @cc_values_pack(%3514) : (i64) -> i64
      func.call @stack_push_pointer(%3512) : (i64) -> ()
      %3516 = llvm.mlir.addressof @str356 : !llvm.ptr
      %3517 = arith.constant 6 : i64
      %3518 = func.call @cc_make_string(%3516, %3517) : (!llvm.ptr, i64) -> i64
      %3519 = llvm.mlir.addressof @str357 : !llvm.ptr
      %3520 = arith.constant 11 : i64
      %3521 = func.call @cc_make_string(%3519, %3520) : (!llvm.ptr, i64) -> i64
      %3522 = func.call @cc_intern(%3518, %3521) : (i64, i64) -> i64
      %3523 = func.call @cc_nil_value() : () -> i64
      %3524 = func.call @cc_cons(%3522, %3523) : (i64, i64) -> i64
      %3525 = func.call @cc_values_pack(%3524) : (i64) -> i64
      func.call @stack_push_pointer(%3522) : (i64) -> ()
      %3526 = llvm.mlir.addressof @str358 : !llvm.ptr
      %3527 = arith.constant 24 : i64
      %3528 = func.call @cc_make_string(%3526, %3527) : (!llvm.ptr, i64) -> i64
      %3529 = llvm.mlir.addressof @str359 : !llvm.ptr
      %3530 = arith.constant 11 : i64
      %3531 = func.call @cc_make_string(%3529, %3530) : (!llvm.ptr, i64) -> i64
      %3532 = func.call @cc_intern(%3528, %3531) : (i64, i64) -> i64
      %3533 = func.call @cc_nil_value() : () -> i64
      %3534 = func.call @cc_cons(%3532, %3533) : (i64, i64) -> i64
      %3535 = func.call @cc_values_pack(%3534) : (i64) -> i64
      func.call @stack_push_pointer(%3532) : (i64) -> ()
      %3536 = llvm.mlir.addressof @str360 : !llvm.ptr
      %3537 = arith.constant 12 : i64
      %3538 = func.call @cc_make_string(%3536, %3537) : (!llvm.ptr, i64) -> i64
      %3539 = func.call @cc_nil_value() : () -> i64
      %3540 = func.call @cc_intern(%3538, %3539) : (i64, i64) -> i64
      %3541 = func.call @cc_nil_value() : () -> i64
      %3542 = func.call @cc_cons(%3540, %3541) : (i64, i64) -> i64
      %3543 = func.call @cc_values_pack(%3542) : (i64) -> i64
      func.call @stack_push_pointer(%3540) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3544 = func.call @stack_pop_pointer() : () -> i64
      %3545 = func.call @stack_pop_pointer() : () -> i64
      %3546 = func.call @cc_cons(%3545, %3544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3546) : (i64) -> ()
      %3547 = func.call @stack_pop_pointer() : () -> i64
      %3548 = func.call @stack_pop_pointer() : () -> i64
      %3549 = func.call @cc_cons(%3548, %3547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3549) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3550 = func.call @stack_pop_pointer() : () -> i64
      %3551 = func.call @stack_pop_pointer() : () -> i64
      %3552 = func.call @cc_cons(%3551, %3550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3552) : (i64) -> ()
      %3553 = func.call @stack_pop_pointer() : () -> i64
      %3554 = func.call @stack_pop_pointer() : () -> i64
      %3555 = func.call @cc_cons(%3554, %3553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3555) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3556 = func.call @stack_pop_pointer() : () -> i64
      %3557 = func.call @stack_pop_pointer() : () -> i64
      %3558 = func.call @cc_cons(%3557, %3556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3558) : (i64) -> ()
      %3559 = func.call @stack_pop_pointer() : () -> i64
      %3560 = func.call @stack_pop_pointer() : () -> i64
      %3561 = func.call @cc_cons(%3560, %3559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3561) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3562 = func.call @stack_pop_pointer() : () -> i64
      %3563 = func.call @stack_pop_pointer() : () -> i64
      %3564 = func.call @cc_cons(%3563, %3562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3564) : (i64) -> ()
      %3565 = func.call @stack_pop_pointer() : () -> i64
      %3566 = func.call @stack_pop_pointer() : () -> i64
      %3567 = func.call @cc_cons(%3566, %3565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3567) : (i64) -> ()
      %3568 = func.call @stack_pop_pointer() : () -> i64
      %3569 = func.call @stack_pop_pointer() : () -> i64
      %3570 = func.call @cc_cons(%3569, %3568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3570) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3571 = func.call @stack_pop_pointer() : () -> i64
      %3572 = func.call @stack_pop_pointer() : () -> i64
      %3573 = func.call @cc_cons(%3572, %3571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3573) : (i64) -> ()
      %3574 = func.call @stack_pop_pointer() : () -> i64
      %3575 = func.call @stack_pop_pointer() : () -> i64
      %3576 = func.call @cc_cons(%3575, %3574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3576) : (i64) -> ()
      %3577 = func.call @stack_pop_pointer() : () -> i64
      %3578 = func.call @stack_pop_pointer() : () -> i64
      %3579 = func.call @cc_cons(%3578, %3577) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3579) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3580 = func.call @stack_pop_pointer() : () -> i64
      %3581 = func.call @stack_pop_pointer() : () -> i64
      %3582 = func.call @cc_cons(%3581, %3580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3582) : (i64) -> ()
      %3583 = func.call @stack_pop_pointer() : () -> i64
      %3584 = func.call @stack_pop_pointer() : () -> i64
      %3585 = func.call @cc_cons(%3584, %3583) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3585) : (i64) -> ()
      %3586 = func.call @stack_pop_pointer() : () -> i64
      %3587 = func.call @stack_pop_pointer() : () -> i64
      %3588 = func.call @cc_cons(%3587, %3586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3588) : (i64) -> ()
      %3589 = func.call @stack_pop_pointer() : () -> i64
      %3590 = func.call @stack_pop_pointer() : () -> i64
      %3591 = func.call @cc_cons(%3590, %3589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3591) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3592 = func.call @stack_pop_pointer() : () -> i64
      %3593 = func.call @stack_pop_pointer() : () -> i64
      %3594 = func.call @cc_cons(%3593, %3592) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3594) : (i64) -> ()
      %3595 = func.call @stack_pop_pointer() : () -> i64
      %3596 = func.call @stack_pop_pointer() : () -> i64
      %3597 = func.call @cc_cons(%3596, %3595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3597) : (i64) -> ()
      %3598 = func.call @stack_pop_pointer() : () -> i64
      %3599 = func.call @stack_pop_pointer() : () -> i64
      %3600 = func.call @cc_cons(%3599, %3598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3600) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3601 = func.call @stack_pop_pointer() : () -> i64
      %3602 = func.call @stack_pop_pointer() : () -> i64
      %3603 = func.call @cc_cons(%3602, %3601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3603) : (i64) -> ()
      %3604 = func.call @stack_pop_pointer() : () -> i64
      %3605 = func.call @stack_pop_pointer() : () -> i64
      %3606 = func.call @cc_cons(%3605, %3604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3606) : (i64) -> ()
      %3607 = func.call @stack_pop_pointer() : () -> i64
      %3608 = func.call @stack_pop_pointer() : () -> i64
      %3609 = func.call @cc_cons(%3608, %3607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3609) : (i64) -> ()
      %3610 = func.call @stack_pop_pointer() : () -> i64
      %4078 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4079 = arith.constant 35 : i64
      %4080 = func.call @cc_make_symbol(%4078, %4079) : (!llvm.ptr, i64) -> i64
      %4081 = func.call @cc_persistent_root_value(%4080) : (i64) -> i64
      func.call @stack_push_pointer(%4081) : (i64) -> ()
      %4082 = arith.constant 263377075044368 : i64
      %4083 = arith.constant 1 : i64
      %4084 = func.call @cc_make_closure(%4082, %4083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4084) : (i64) -> ()
      %4085 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4086 = func.call @stack_pop_pointer() : () -> i64
      %4087 = func.call @stack_pop_pointer() : () -> i64
      %4088 = func.call @cc_cons(%4087, %4086) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4088) : (i64) -> ()
      %4089 = func.call @stack_pop_pointer() : () -> i64
      %4090 = func.call @stack_pop_pointer() : () -> i64
      %4091 = func.call @cc_cons(%4090, %4089) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4091) : (i64) -> ()
      %4092 = func.call @stack_pop_pointer() : () -> i64
      %4093 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4094 = arith.constant 11 : i64
      %4095 = func.call @cc_make_string(%4093, %4094) : (!llvm.ptr, i64) -> i64
      %4096 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4097 = arith.constant 7 : i64
      %4098 = func.call @cc_make_string(%4096, %4097) : (!llvm.ptr, i64) -> i64
      %4099 = func.call @cc_intern(%4095, %4098) : (i64, i64) -> i64
      %4100 = func.call @cc_nil_value() : () -> i64
      %4101 = func.call @cc_cons(%4099, %4100) : (i64, i64) -> i64
      %4102 = func.call @cc_values_pack(%4101) : (i64) -> i64
      func.call @stack_push_pointer(%4099) : (i64) -> ()
      %4103 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4104 = func.call @stack_pop_pointer() : () -> i64
      %4105 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4106 = arith.constant 4 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4109 = arith.constant 7 : i64
      %4110 = func.call @cc_make_string(%4108, %4109) : (!llvm.ptr, i64) -> i64
      %4111 = func.call @cc_intern(%4107, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_nil_value() : () -> i64
      %4113 = func.call @cc_cons(%4111, %4112) : (i64, i64) -> i64
      %4114 = func.call @cc_values_pack(%4113) : (i64) -> i64
      func.call @stack_push_pointer(%4111) : (i64) -> ()
      %4115 = func.call @stack_pop_pointer() : () -> i64
      %4116 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4117 = arith.constant 6 : i64
      %4118 = func.call @cc_make_string(%4116, %4117) : (!llvm.ptr, i64) -> i64
      %4119 = func.call @cc_nil_value() : () -> i64
      %4120 = func.call @cc_intern(%4118, %4119) : (i64, i64) -> i64
      %4121 = func.call @cc_nil_value() : () -> i64
      %4122 = func.call @cc_cons(%4120, %4121) : (i64, i64) -> i64
      %4123 = func.call @cc_values_pack(%4122) : (i64) -> i64
      func.call @stack_push_pointer(%4120) : (i64) -> ()
      %4124 = func.call @stack_pop_pointer() : () -> i64
      %4125 = func.call @cc_nil_value() : () -> i64
      %4126 = func.call @cc_errorp(%3245) : (i64) -> i64
      %4127 = arith.cmpi ne, %4126, %4125 : i64
      %4128 = arith.cmpi eq, %4125, %4125 : i64
      %4129 = arith.andi %4127, %4128 : i1
      %4130 = scf.if %4129 -> (i64) {
        scf.yield %3245 : i64
      } else {
        scf.yield %4125 : i64
      }
      %4131 = func.call @cc_errorp(%3610) : (i64) -> i64
      %4132 = arith.cmpi ne, %4131, %4125 : i64
      %4133 = arith.cmpi eq, %4130, %4125 : i64
      %4134 = arith.andi %4132, %4133 : i1
      %4135 = scf.if %4134 -> (i64) {
        scf.yield %3610 : i64
      } else {
        scf.yield %4130 : i64
      }
      %4136 = func.call @cc_errorp(%4085) : (i64) -> i64
      %4137 = arith.cmpi ne, %4136, %4125 : i64
      %4138 = arith.cmpi eq, %4135, %4125 : i64
      %4139 = arith.andi %4137, %4138 : i1
      %4140 = scf.if %4139 -> (i64) {
        scf.yield %4085 : i64
      } else {
        scf.yield %4135 : i64
      }
      %4141 = func.call @cc_errorp(%4092) : (i64) -> i64
      %4142 = arith.cmpi ne, %4141, %4125 : i64
      %4143 = arith.cmpi eq, %4140, %4125 : i64
      %4144 = arith.andi %4142, %4143 : i1
      %4145 = scf.if %4144 -> (i64) {
        scf.yield %4092 : i64
      } else {
        scf.yield %4140 : i64
      }
      %4146 = func.call @cc_errorp(%4103) : (i64) -> i64
      %4147 = arith.cmpi ne, %4146, %4125 : i64
      %4148 = arith.cmpi eq, %4145, %4125 : i64
      %4149 = arith.andi %4147, %4148 : i1
      %4150 = scf.if %4149 -> (i64) {
        scf.yield %4103 : i64
      } else {
        scf.yield %4145 : i64
      }
      %4151 = func.call @cc_errorp(%4104) : (i64) -> i64
      %4152 = arith.cmpi ne, %4151, %4125 : i64
      %4153 = arith.cmpi eq, %4150, %4125 : i64
      %4154 = arith.andi %4152, %4153 : i1
      %4155 = scf.if %4154 -> (i64) {
        scf.yield %4104 : i64
      } else {
        scf.yield %4150 : i64
      }
      %4156 = func.call @cc_errorp(%4115) : (i64) -> i64
      %4157 = arith.cmpi ne, %4156, %4125 : i64
      %4158 = arith.cmpi eq, %4155, %4125 : i64
      %4159 = arith.andi %4157, %4158 : i1
      %4160 = scf.if %4159 -> (i64) {
        scf.yield %4115 : i64
      } else {
        scf.yield %4155 : i64
      }
      %4161 = func.call @cc_errorp(%4124) : (i64) -> i64
      %4162 = arith.cmpi ne, %4161, %4125 : i64
      %4163 = arith.cmpi eq, %4160, %4125 : i64
      %4164 = arith.andi %4162, %4163 : i1
      %4165 = scf.if %4164 -> (i64) {
        scf.yield %4124 : i64
      } else {
        scf.yield %4160 : i64
      }
      %4166 = arith.cmpi ne, %4165, %4125 : i64
      scf.if %4166 {
        func.call @stack_push_pointer(%4165) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3245) : (i64) -> ()
        func.call @stack_push_pointer(%3610) : (i64) -> ()
        func.call @stack_push_pointer(%4085) : (i64) -> ()
        func.call @stack_push_pointer(%4092) : (i64) -> ()
        func.call @stack_push_pointer(%4103) : (i64) -> ()
        func.call @stack_push_pointer(%4104) : (i64) -> ()
        func.call @stack_push_pointer(%4115) : (i64) -> ()
        func.call @stack_push_pointer(%4124) : (i64) -> ()
        %4167 = llvm.mlir.addressof @str410 : !llvm.ptr
        %4168 = func.call @cc_make_function_ref_const(%4167) : (!llvm.ptr) -> i64
        %4169 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4168, %4169) : (i64, i64) -> ()
      }
      %4170 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4170 : i64
    }
    %4171 = func.call @cc_nil_value() : () -> i64
    %4172 = func.call @cc_errorp(%3236) : (i64) -> i64
    %4173 = arith.cmpi ne, %4172, %4171 : i64
    %4174 = scf.if %4173 -> (i64) {
      scf.yield %3236 : i64
    } else {
      %4175 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4176 = arith.constant 25 : i64
      %4177 = func.call @cc_make_string(%4175, %4176) : (!llvm.ptr, i64) -> i64
      %4178 = func.call @cc_nil_value() : () -> i64
      %4179 = func.call @cc_intern(%4177, %4178) : (i64, i64) -> i64
      %4180 = func.call @cc_nil_value() : () -> i64
      %4181 = func.call @cc_cons(%4179, %4180) : (i64, i64) -> i64
      %4182 = func.call @cc_values_pack(%4181) : (i64) -> i64
      func.call @stack_push_pointer(%4179) : (i64) -> ()
      %4183 = func.call @stack_pop_pointer() : () -> i64
      %4184 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4185 = arith.constant 5 : i64
      %4186 = func.call @cc_make_string(%4184, %4185) : (!llvm.ptr, i64) -> i64
      %4187 = func.call @cc_nil_value() : () -> i64
      %4188 = func.call @cc_intern(%4186, %4187) : (i64, i64) -> i64
      %4189 = func.call @cc_nil_value() : () -> i64
      %4190 = func.call @cc_cons(%4188, %4189) : (i64, i64) -> i64
      %4191 = func.call @cc_values_pack(%4190) : (i64) -> i64
      func.call @stack_push_pointer(%4188) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4192 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4193 = arith.constant 21 : i64
      %4194 = func.call @cc_make_string(%4192, %4193) : (!llvm.ptr, i64) -> i64
      %4195 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4196 = arith.constant 11 : i64
      %4197 = func.call @cc_make_string(%4195, %4196) : (!llvm.ptr, i64) -> i64
      %4198 = func.call @cc_intern(%4194, %4197) : (i64, i64) -> i64
      %4199 = func.call @cc_nil_value() : () -> i64
      %4200 = func.call @cc_cons(%4198, %4199) : (i64, i64) -> i64
      %4201 = func.call @cc_values_pack(%4200) : (i64) -> i64
      func.call @stack_push_pointer(%4198) : (i64) -> ()
      %4202 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4203 = arith.constant 13 : i64
      %4204 = func.call @cc_make_string(%4202, %4203) : (!llvm.ptr, i64) -> i64
      %4205 = func.call @cc_nil_value() : () -> i64
      %4206 = func.call @cc_intern(%4204, %4205) : (i64, i64) -> i64
      %4207 = func.call @cc_nil_value() : () -> i64
      %4208 = func.call @cc_cons(%4206, %4207) : (i64, i64) -> i64
      %4209 = func.call @cc_values_pack(%4208) : (i64) -> i64
      func.call @stack_push_pointer(%4206) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4210 = func.call @stack_pop_pointer() : () -> i64
      %4211 = func.call @stack_pop_pointer() : () -> i64
      %4212 = func.call @cc_cons(%4211, %4210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4212) : (i64) -> ()
      %4213 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4214 = arith.constant 21 : i64
      %4215 = func.call @cc_make_string(%4213, %4214) : (!llvm.ptr, i64) -> i64
      %4216 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4217 = arith.constant 11 : i64
      %4218 = func.call @cc_make_string(%4216, %4217) : (!llvm.ptr, i64) -> i64
      %4219 = func.call @cc_intern(%4215, %4218) : (i64, i64) -> i64
      %4220 = func.call @cc_nil_value() : () -> i64
      %4221 = func.call @cc_cons(%4219, %4220) : (i64, i64) -> i64
      %4222 = func.call @cc_values_pack(%4221) : (i64) -> i64
      func.call @stack_push_pointer(%4219) : (i64) -> ()
      %4223 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4224 = arith.constant 12 : i64
      %4225 = func.call @cc_make_string(%4223, %4224) : (!llvm.ptr, i64) -> i64
      %4226 = func.call @cc_nil_value() : () -> i64
      %4227 = func.call @cc_intern(%4225, %4226) : (i64, i64) -> i64
      %4228 = func.call @cc_nil_value() : () -> i64
      %4229 = func.call @cc_cons(%4227, %4228) : (i64, i64) -> i64
      %4230 = func.call @cc_values_pack(%4229) : (i64) -> i64
      func.call @stack_push_pointer(%4227) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4231 = func.call @stack_pop_pointer() : () -> i64
      %4232 = func.call @stack_pop_pointer() : () -> i64
      %4233 = func.call @cc_cons(%4232, %4231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4233) : (i64) -> ()
      %4234 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4235 = arith.constant 22 : i64
      %4236 = func.call @cc_make_string(%4234, %4235) : (!llvm.ptr, i64) -> i64
      %4237 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4238 = arith.constant 11 : i64
      %4239 = func.call @cc_make_string(%4237, %4238) : (!llvm.ptr, i64) -> i64
      %4240 = func.call @cc_intern(%4236, %4239) : (i64, i64) -> i64
      %4241 = func.call @cc_nil_value() : () -> i64
      %4242 = func.call @cc_cons(%4240, %4241) : (i64, i64) -> i64
      %4243 = func.call @cc_values_pack(%4242) : (i64) -> i64
      func.call @stack_push_pointer(%4240) : (i64) -> ()
      %4244 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4245 = arith.constant 12 : i64
      %4246 = func.call @cc_make_string(%4244, %4245) : (!llvm.ptr, i64) -> i64
      %4247 = func.call @cc_nil_value() : () -> i64
      %4248 = func.call @cc_intern(%4246, %4247) : (i64, i64) -> i64
      %4249 = func.call @cc_nil_value() : () -> i64
      %4250 = func.call @cc_cons(%4248, %4249) : (i64, i64) -> i64
      %4251 = func.call @cc_values_pack(%4250) : (i64) -> i64
      func.call @stack_push_pointer(%4248) : (i64) -> ()
      %4252 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4253 = arith.constant 0 : i64
      %4254 = func.call @cc_make_string(%4252, %4253) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4254) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4255 = func.call @stack_pop_pointer() : () -> i64
      %4256 = func.call @stack_pop_pointer() : () -> i64
      %4257 = func.call @cc_cons(%4256, %4255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4257) : (i64) -> ()
      %4258 = func.call @stack_pop_pointer() : () -> i64
      %4259 = func.call @stack_pop_pointer() : () -> i64
      %4260 = func.call @cc_cons(%4259, %4258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4260) : (i64) -> ()
      %4261 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4262 = arith.constant 16 : i64
      %4263 = func.call @cc_make_string(%4261, %4262) : (!llvm.ptr, i64) -> i64
      %4264 = func.call @cc_nil_value() : () -> i64
      %4265 = func.call @cc_intern(%4263, %4264) : (i64, i64) -> i64
      %4266 = func.call @cc_nil_value() : () -> i64
      %4267 = func.call @cc_cons(%4265, %4266) : (i64, i64) -> i64
      %4268 = func.call @cc_values_pack(%4267) : (i64) -> i64
      func.call @stack_push_pointer(%4265) : (i64) -> ()
      %4269 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4270 = arith.constant 6 : i64
      %4271 = func.call @cc_make_string(%4269, %4270) : (!llvm.ptr, i64) -> i64
      %4272 = func.call @cc_nil_value() : () -> i64
      %4273 = func.call @cc_intern(%4271, %4272) : (i64, i64) -> i64
      %4274 = func.call @cc_nil_value() : () -> i64
      %4275 = func.call @cc_cons(%4273, %4274) : (i64, i64) -> i64
      %4276 = func.call @cc_values_pack(%4275) : (i64) -> i64
      func.call @stack_push_pointer(%4273) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4277 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4278 = arith.constant 5 : i64
      %4279 = func.call @cc_make_string(%4277, %4278) : (!llvm.ptr, i64) -> i64
      %4280 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4281 = arith.constant 7 : i64
      %4282 = func.call @cc_make_string(%4280, %4281) : (!llvm.ptr, i64) -> i64
      %4283 = func.call @cc_intern(%4279, %4282) : (i64, i64) -> i64
      %4284 = func.call @cc_nil_value() : () -> i64
      %4285 = func.call @cc_cons(%4283, %4284) : (i64, i64) -> i64
      %4286 = func.call @cc_values_pack(%4285) : (i64) -> i64
      func.call @stack_push_pointer(%4283) : (i64) -> ()
      %4287 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4288 = arith.constant 12 : i64
      %4289 = func.call @cc_make_string(%4287, %4288) : (!llvm.ptr, i64) -> i64
      %4290 = func.call @cc_nil_value() : () -> i64
      %4291 = func.call @cc_intern(%4289, %4290) : (i64, i64) -> i64
      %4292 = func.call @cc_nil_value() : () -> i64
      %4293 = func.call @cc_cons(%4291, %4292) : (i64, i64) -> i64
      %4294 = func.call @cc_values_pack(%4293) : (i64) -> i64
      func.call @stack_push_pointer(%4291) : (i64) -> ()
      %4295 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4296 = arith.constant 6 : i64
      %4297 = func.call @cc_make_string(%4295, %4296) : (!llvm.ptr, i64) -> i64
      %4298 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4299 = arith.constant 7 : i64
      %4300 = func.call @cc_make_string(%4298, %4299) : (!llvm.ptr, i64) -> i64
      %4301 = func.call @cc_intern(%4297, %4300) : (i64, i64) -> i64
      %4302 = func.call @cc_nil_value() : () -> i64
      %4303 = func.call @cc_cons(%4301, %4302) : (i64, i64) -> i64
      %4304 = func.call @cc_values_pack(%4303) : (i64) -> i64
      func.call @stack_push_pointer(%4301) : (i64) -> ()
      %4305 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4306 = arith.constant 13 : i64
      %4307 = func.call @cc_make_string(%4305, %4306) : (!llvm.ptr, i64) -> i64
      %4308 = func.call @cc_nil_value() : () -> i64
      %4309 = func.call @cc_intern(%4307, %4308) : (i64, i64) -> i64
      %4310 = func.call @cc_nil_value() : () -> i64
      %4311 = func.call @cc_cons(%4309, %4310) : (i64, i64) -> i64
      %4312 = func.call @cc_values_pack(%4311) : (i64) -> i64
      func.call @stack_push_pointer(%4309) : (i64) -> ()
      %4313 = llvm.mlir.addressof @str431 : !llvm.ptr
      %4314 = arith.constant 5 : i64
      %4315 = func.call @cc_make_string(%4313, %4314) : (!llvm.ptr, i64) -> i64
      %4316 = llvm.mlir.addressof @str432 : !llvm.ptr
      %4317 = arith.constant 7 : i64
      %4318 = func.call @cc_make_string(%4316, %4317) : (!llvm.ptr, i64) -> i64
      %4319 = func.call @cc_intern(%4315, %4318) : (i64, i64) -> i64
      %4320 = func.call @cc_nil_value() : () -> i64
      %4321 = func.call @cc_cons(%4319, %4320) : (i64, i64) -> i64
      %4322 = func.call @cc_values_pack(%4321) : (i64) -> i64
      func.call @stack_push_pointer(%4319) : (i64) -> ()
      %4323 = llvm.mlir.addressof @str433 : !llvm.ptr
      %4324 = arith.constant 12 : i64
      %4325 = func.call @cc_make_string(%4323, %4324) : (!llvm.ptr, i64) -> i64
      %4326 = func.call @cc_nil_value() : () -> i64
      %4327 = func.call @cc_intern(%4325, %4326) : (i64, i64) -> i64
      %4328 = func.call @cc_nil_value() : () -> i64
      %4329 = func.call @cc_cons(%4327, %4328) : (i64, i64) -> i64
      %4330 = func.call @cc_values_pack(%4329) : (i64) -> i64
      func.call @stack_push_pointer(%4327) : (i64) -> ()
      %4331 = llvm.mlir.addressof @str434 : !llvm.ptr
      %4332 = arith.constant 4 : i64
      %4333 = func.call @cc_make_string(%4331, %4332) : (!llvm.ptr, i64) -> i64
      %4334 = llvm.mlir.addressof @str435 : !llvm.ptr
      %4335 = arith.constant 7 : i64
      %4336 = func.call @cc_make_string(%4334, %4335) : (!llvm.ptr, i64) -> i64
      %4337 = func.call @cc_intern(%4333, %4336) : (i64, i64) -> i64
      %4338 = func.call @cc_nil_value() : () -> i64
      %4339 = func.call @cc_cons(%4337, %4338) : (i64, i64) -> i64
      %4340 = func.call @cc_values_pack(%4339) : (i64) -> i64
      func.call @stack_push_pointer(%4337) : (i64) -> ()
      %4341 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4341) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4342 = func.call @stack_pop_pointer() : () -> i64
      %4343 = func.call @stack_pop_pointer() : () -> i64
      %4344 = func.call @cc_cons(%4343, %4342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4344) : (i64) -> ()
      %4345 = func.call @stack_pop_pointer() : () -> i64
      %4346 = func.call @stack_pop_pointer() : () -> i64
      %4347 = func.call @cc_cons(%4346, %4345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4347) : (i64) -> ()
      %4348 = func.call @stack_pop_pointer() : () -> i64
      %4349 = func.call @stack_pop_pointer() : () -> i64
      %4350 = func.call @cc_cons(%4349, %4348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4350) : (i64) -> ()
      %4351 = func.call @stack_pop_pointer() : () -> i64
      %4352 = func.call @stack_pop_pointer() : () -> i64
      %4353 = func.call @cc_cons(%4352, %4351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4353) : (i64) -> ()
      %4354 = func.call @stack_pop_pointer() : () -> i64
      %4355 = func.call @stack_pop_pointer() : () -> i64
      %4356 = func.call @cc_cons(%4355, %4354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4356) : (i64) -> ()
      %4357 = func.call @stack_pop_pointer() : () -> i64
      %4358 = func.call @stack_pop_pointer() : () -> i64
      %4359 = func.call @cc_cons(%4358, %4357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4359) : (i64) -> ()
      %4360 = func.call @stack_pop_pointer() : () -> i64
      %4361 = func.call @stack_pop_pointer() : () -> i64
      %4362 = func.call @cc_cons(%4361, %4360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4362) : (i64) -> ()
      %4363 = func.call @stack_pop_pointer() : () -> i64
      %4364 = func.call @stack_pop_pointer() : () -> i64
      %4365 = func.call @cc_cons(%4364, %4363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4365) : (i64) -> ()
      %4366 = func.call @stack_pop_pointer() : () -> i64
      %4367 = func.call @stack_pop_pointer() : () -> i64
      %4368 = func.call @cc_cons(%4367, %4366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4368) : (i64) -> ()
      %4369 = func.call @stack_pop_pointer() : () -> i64
      %4370 = func.call @stack_pop_pointer() : () -> i64
      %4371 = func.call @cc_cons(%4370, %4369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4371) : (i64) -> ()
      %4372 = llvm.mlir.addressof @str436 : !llvm.ptr
      %4373 = arith.constant 11 : i64
      %4374 = func.call @cc_make_string(%4372, %4373) : (!llvm.ptr, i64) -> i64
      %4375 = func.call @cc_nil_value() : () -> i64
      %4376 = func.call @cc_intern(%4374, %4375) : (i64, i64) -> i64
      %4377 = func.call @cc_nil_value() : () -> i64
      %4378 = func.call @cc_cons(%4376, %4377) : (i64, i64) -> i64
      %4379 = func.call @cc_values_pack(%4378) : (i64) -> i64
      func.call @stack_push_pointer(%4376) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4380 = llvm.mlir.addressof @str437 : !llvm.ptr
      %4381 = arith.constant 6 : i64
      %4382 = func.call @cc_make_string(%4380, %4381) : (!llvm.ptr, i64) -> i64
      %4383 = llvm.mlir.addressof @str438 : !llvm.ptr
      %4384 = arith.constant 11 : i64
      %4385 = func.call @cc_make_string(%4383, %4384) : (!llvm.ptr, i64) -> i64
      %4386 = func.call @cc_intern(%4382, %4385) : (i64, i64) -> i64
      %4387 = func.call @cc_nil_value() : () -> i64
      %4388 = func.call @cc_cons(%4386, %4387) : (i64, i64) -> i64
      %4389 = func.call @cc_values_pack(%4388) : (i64) -> i64
      func.call @stack_push_pointer(%4386) : (i64) -> ()
      %4390 = llvm.mlir.addressof @str439 : !llvm.ptr
      %4391 = arith.constant 5 : i64
      %4392 = func.call @cc_make_string(%4390, %4391) : (!llvm.ptr, i64) -> i64
      %4393 = llvm.mlir.addressof @str440 : !llvm.ptr
      %4394 = arith.constant 11 : i64
      %4395 = func.call @cc_make_string(%4393, %4394) : (!llvm.ptr, i64) -> i64
      %4396 = func.call @cc_intern(%4392, %4395) : (i64, i64) -> i64
      %4397 = func.call @cc_nil_value() : () -> i64
      %4398 = func.call @cc_cons(%4396, %4397) : (i64, i64) -> i64
      %4399 = func.call @cc_values_pack(%4398) : (i64) -> i64
      func.call @stack_push_pointer(%4396) : (i64) -> ()
      %4400 = llvm.mlir.addressof @str441 : !llvm.ptr
      %4401 = arith.constant 6 : i64
      %4402 = func.call @cc_make_string(%4400, %4401) : (!llvm.ptr, i64) -> i64
      %4403 = llvm.mlir.addressof @str442 : !llvm.ptr
      %4404 = arith.constant 11 : i64
      %4405 = func.call @cc_make_string(%4403, %4404) : (!llvm.ptr, i64) -> i64
      %4406 = func.call @cc_intern(%4402, %4405) : (i64, i64) -> i64
      %4407 = func.call @cc_nil_value() : () -> i64
      %4408 = func.call @cc_cons(%4406, %4407) : (i64, i64) -> i64
      %4409 = func.call @cc_values_pack(%4408) : (i64) -> i64
      func.call @stack_push_pointer(%4406) : (i64) -> ()
      %4410 = llvm.mlir.addressof @str443 : !llvm.ptr
      %4411 = arith.constant 24 : i64
      %4412 = func.call @cc_make_string(%4410, %4411) : (!llvm.ptr, i64) -> i64
      %4413 = llvm.mlir.addressof @str444 : !llvm.ptr
      %4414 = arith.constant 11 : i64
      %4415 = func.call @cc_make_string(%4413, %4414) : (!llvm.ptr, i64) -> i64
      %4416 = func.call @cc_intern(%4412, %4415) : (i64, i64) -> i64
      %4417 = func.call @cc_nil_value() : () -> i64
      %4418 = func.call @cc_cons(%4416, %4417) : (i64, i64) -> i64
      %4419 = func.call @cc_values_pack(%4418) : (i64) -> i64
      func.call @stack_push_pointer(%4416) : (i64) -> ()
      %4420 = llvm.mlir.addressof @str445 : !llvm.ptr
      %4421 = arith.constant 13 : i64
      %4422 = func.call @cc_make_string(%4420, %4421) : (!llvm.ptr, i64) -> i64
      %4423 = func.call @cc_nil_value() : () -> i64
      %4424 = func.call @cc_intern(%4422, %4423) : (i64, i64) -> i64
      %4425 = func.call @cc_nil_value() : () -> i64
      %4426 = func.call @cc_cons(%4424, %4425) : (i64, i64) -> i64
      %4427 = func.call @cc_values_pack(%4426) : (i64) -> i64
      func.call @stack_push_pointer(%4424) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4428 = func.call @stack_pop_pointer() : () -> i64
      %4429 = func.call @stack_pop_pointer() : () -> i64
      %4430 = func.call @cc_cons(%4429, %4428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4430) : (i64) -> ()
      %4431 = func.call @stack_pop_pointer() : () -> i64
      %4432 = func.call @stack_pop_pointer() : () -> i64
      %4433 = func.call @cc_cons(%4432, %4431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4433) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4434 = func.call @stack_pop_pointer() : () -> i64
      %4435 = func.call @stack_pop_pointer() : () -> i64
      %4436 = func.call @cc_cons(%4435, %4434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4436) : (i64) -> ()
      %4437 = func.call @stack_pop_pointer() : () -> i64
      %4438 = func.call @stack_pop_pointer() : () -> i64
      %4439 = func.call @cc_cons(%4438, %4437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4439) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4440 = func.call @stack_pop_pointer() : () -> i64
      %4441 = func.call @stack_pop_pointer() : () -> i64
      %4442 = func.call @cc_cons(%4441, %4440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4442) : (i64) -> ()
      %4443 = func.call @stack_pop_pointer() : () -> i64
      %4444 = func.call @stack_pop_pointer() : () -> i64
      %4445 = func.call @cc_cons(%4444, %4443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4445) : (i64) -> ()
      %4446 = llvm.mlir.addressof @str446 : !llvm.ptr
      %4447 = arith.constant 5 : i64
      %4448 = func.call @cc_make_string(%4446, %4447) : (!llvm.ptr, i64) -> i64
      %4449 = llvm.mlir.addressof @str447 : !llvm.ptr
      %4450 = arith.constant 11 : i64
      %4451 = func.call @cc_make_string(%4449, %4450) : (!llvm.ptr, i64) -> i64
      %4452 = func.call @cc_intern(%4448, %4451) : (i64, i64) -> i64
      %4453 = func.call @cc_nil_value() : () -> i64
      %4454 = func.call @cc_cons(%4452, %4453) : (i64, i64) -> i64
      %4455 = func.call @cc_values_pack(%4454) : (i64) -> i64
      func.call @stack_push_pointer(%4452) : (i64) -> ()
      %4456 = llvm.mlir.addressof @str448 : !llvm.ptr
      %4457 = arith.constant 6 : i64
      %4458 = func.call @cc_make_string(%4456, %4457) : (!llvm.ptr, i64) -> i64
      %4459 = llvm.mlir.addressof @str449 : !llvm.ptr
      %4460 = arith.constant 11 : i64
      %4461 = func.call @cc_make_string(%4459, %4460) : (!llvm.ptr, i64) -> i64
      %4462 = func.call @cc_intern(%4458, %4461) : (i64, i64) -> i64
      %4463 = func.call @cc_nil_value() : () -> i64
      %4464 = func.call @cc_cons(%4462, %4463) : (i64, i64) -> i64
      %4465 = func.call @cc_values_pack(%4464) : (i64) -> i64
      func.call @stack_push_pointer(%4462) : (i64) -> ()
      %4466 = llvm.mlir.addressof @str450 : !llvm.ptr
      %4467 = arith.constant 24 : i64
      %4468 = func.call @cc_make_string(%4466, %4467) : (!llvm.ptr, i64) -> i64
      %4469 = llvm.mlir.addressof @str451 : !llvm.ptr
      %4470 = arith.constant 11 : i64
      %4471 = func.call @cc_make_string(%4469, %4470) : (!llvm.ptr, i64) -> i64
      %4472 = func.call @cc_intern(%4468, %4471) : (i64, i64) -> i64
      %4473 = func.call @cc_nil_value() : () -> i64
      %4474 = func.call @cc_cons(%4472, %4473) : (i64, i64) -> i64
      %4475 = func.call @cc_values_pack(%4474) : (i64) -> i64
      func.call @stack_push_pointer(%4472) : (i64) -> ()
      %4476 = llvm.mlir.addressof @str452 : !llvm.ptr
      %4477 = arith.constant 12 : i64
      %4478 = func.call @cc_make_string(%4476, %4477) : (!llvm.ptr, i64) -> i64
      %4479 = func.call @cc_nil_value() : () -> i64
      %4480 = func.call @cc_intern(%4478, %4479) : (i64, i64) -> i64
      %4481 = func.call @cc_nil_value() : () -> i64
      %4482 = func.call @cc_cons(%4480, %4481) : (i64, i64) -> i64
      %4483 = func.call @cc_values_pack(%4482) : (i64) -> i64
      func.call @stack_push_pointer(%4480) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4484 = func.call @stack_pop_pointer() : () -> i64
      %4485 = func.call @stack_pop_pointer() : () -> i64
      %4486 = func.call @cc_cons(%4485, %4484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4486) : (i64) -> ()
      %4487 = func.call @stack_pop_pointer() : () -> i64
      %4488 = func.call @stack_pop_pointer() : () -> i64
      %4489 = func.call @cc_cons(%4488, %4487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4489) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4490 = func.call @stack_pop_pointer() : () -> i64
      %4491 = func.call @stack_pop_pointer() : () -> i64
      %4492 = func.call @cc_cons(%4491, %4490) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4492) : (i64) -> ()
      %4493 = func.call @stack_pop_pointer() : () -> i64
      %4494 = func.call @stack_pop_pointer() : () -> i64
      %4495 = func.call @cc_cons(%4494, %4493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4495) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4496 = func.call @stack_pop_pointer() : () -> i64
      %4497 = func.call @stack_pop_pointer() : () -> i64
      %4498 = func.call @cc_cons(%4497, %4496) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4498) : (i64) -> ()
      %4499 = func.call @stack_pop_pointer() : () -> i64
      %4500 = func.call @stack_pop_pointer() : () -> i64
      %4501 = func.call @cc_cons(%4500, %4499) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4502 = func.call @stack_pop_pointer() : () -> i64
      %4503 = func.call @stack_pop_pointer() : () -> i64
      %4504 = func.call @cc_cons(%4503, %4502) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4504) : (i64) -> ()
      %4505 = func.call @stack_pop_pointer() : () -> i64
      %4506 = func.call @stack_pop_pointer() : () -> i64
      %4507 = func.call @cc_cons(%4506, %4505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4507) : (i64) -> ()
      %4508 = func.call @stack_pop_pointer() : () -> i64
      %4509 = func.call @stack_pop_pointer() : () -> i64
      %4510 = func.call @cc_cons(%4509, %4508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4510) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4511 = func.call @stack_pop_pointer() : () -> i64
      %4512 = func.call @stack_pop_pointer() : () -> i64
      %4513 = func.call @cc_cons(%4512, %4511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4513) : (i64) -> ()
      %4514 = func.call @stack_pop_pointer() : () -> i64
      %4515 = func.call @stack_pop_pointer() : () -> i64
      %4516 = func.call @cc_cons(%4515, %4514) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4516) : (i64) -> ()
      %4517 = func.call @stack_pop_pointer() : () -> i64
      %4518 = func.call @stack_pop_pointer() : () -> i64
      %4519 = func.call @cc_cons(%4518, %4517) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4519) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4520 = func.call @stack_pop_pointer() : () -> i64
      %4521 = func.call @stack_pop_pointer() : () -> i64
      %4522 = func.call @cc_cons(%4521, %4520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4522) : (i64) -> ()
      %4523 = func.call @stack_pop_pointer() : () -> i64
      %4524 = func.call @stack_pop_pointer() : () -> i64
      %4525 = func.call @cc_cons(%4524, %4523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4525) : (i64) -> ()
      %4526 = func.call @stack_pop_pointer() : () -> i64
      %4527 = func.call @stack_pop_pointer() : () -> i64
      %4528 = func.call @cc_cons(%4527, %4526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4528) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4529 = func.call @stack_pop_pointer() : () -> i64
      %4530 = func.call @stack_pop_pointer() : () -> i64
      %4531 = func.call @cc_cons(%4530, %4529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4531) : (i64) -> ()
      %4532 = func.call @stack_pop_pointer() : () -> i64
      %4533 = func.call @stack_pop_pointer() : () -> i64
      %4534 = func.call @cc_cons(%4533, %4532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4534) : (i64) -> ()
      %4535 = func.call @stack_pop_pointer() : () -> i64
      %4536 = func.call @stack_pop_pointer() : () -> i64
      %4537 = func.call @cc_cons(%4536, %4535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4538 = func.call @stack_pop_pointer() : () -> i64
      %4539 = func.call @stack_pop_pointer() : () -> i64
      %4540 = func.call @cc_cons(%4539, %4538) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4540) : (i64) -> ()
      %4541 = func.call @stack_pop_pointer() : () -> i64
      %4542 = func.call @stack_pop_pointer() : () -> i64
      %4543 = func.call @cc_cons(%4542, %4541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4543) : (i64) -> ()
      %4544 = func.call @stack_pop_pointer() : () -> i64
      %4545 = func.call @stack_pop_pointer() : () -> i64
      %4546 = func.call @cc_cons(%4545, %4544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4546) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4547 = func.call @stack_pop_pointer() : () -> i64
      %4548 = func.call @stack_pop_pointer() : () -> i64
      %4549 = func.call @cc_cons(%4548, %4547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4549) : (i64) -> ()
      %4550 = func.call @stack_pop_pointer() : () -> i64
      %4551 = func.call @stack_pop_pointer() : () -> i64
      %4552 = func.call @cc_cons(%4551, %4550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4552) : (i64) -> ()
      %4553 = func.call @stack_pop_pointer() : () -> i64
      %4554 = func.call @stack_pop_pointer() : () -> i64
      %4555 = func.call @cc_cons(%4554, %4553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4555) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4556 = func.call @stack_pop_pointer() : () -> i64
      %4557 = func.call @stack_pop_pointer() : () -> i64
      %4558 = func.call @cc_cons(%4557, %4556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4558) : (i64) -> ()
      %4559 = func.call @stack_pop_pointer() : () -> i64
      %4560 = func.call @stack_pop_pointer() : () -> i64
      %4561 = func.call @cc_cons(%4560, %4559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4561) : (i64) -> ()
      %4562 = func.call @stack_pop_pointer() : () -> i64
      %4563 = func.call @stack_pop_pointer() : () -> i64
      %4564 = func.call @cc_cons(%4563, %4562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4564) : (i64) -> ()
      %4565 = func.call @stack_pop_pointer() : () -> i64
      %5057 = llvm.mlir.addressof @str498 : !llvm.ptr
      %5058 = arith.constant 35 : i64
      %5059 = func.call @cc_make_symbol(%5057, %5058) : (!llvm.ptr, i64) -> i64
      %5060 = func.call @cc_persistent_root_value(%5059) : (i64) -> i64
      func.call @stack_push_pointer(%5060) : (i64) -> ()
      %5061 = arith.constant 263377075044371 : i64
      %5062 = arith.constant 1 : i64
      %5063 = func.call @cc_make_closure(%5061, %5062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5063) : (i64) -> ()
      %5064 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5065 = func.call @stack_pop_pointer() : () -> i64
      %5066 = func.call @stack_pop_pointer() : () -> i64
      %5067 = func.call @cc_cons(%5066, %5065) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5067) : (i64) -> ()
      %5068 = func.call @stack_pop_pointer() : () -> i64
      %5069 = func.call @stack_pop_pointer() : () -> i64
      %5070 = func.call @cc_cons(%5069, %5068) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5070) : (i64) -> ()
      %5071 = func.call @stack_pop_pointer() : () -> i64
      %5072 = llvm.mlir.addressof @str499 : !llvm.ptr
      %5073 = arith.constant 11 : i64
      %5074 = func.call @cc_make_string(%5072, %5073) : (!llvm.ptr, i64) -> i64
      %5075 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5076 = arith.constant 7 : i64
      %5077 = func.call @cc_make_string(%5075, %5076) : (!llvm.ptr, i64) -> i64
      %5078 = func.call @cc_intern(%5074, %5077) : (i64, i64) -> i64
      %5079 = func.call @cc_nil_value() : () -> i64
      %5080 = func.call @cc_cons(%5078, %5079) : (i64, i64) -> i64
      %5081 = func.call @cc_values_pack(%5080) : (i64) -> i64
      func.call @stack_push_pointer(%5078) : (i64) -> ()
      %5082 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5083 = func.call @stack_pop_pointer() : () -> i64
      %5084 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5085 = arith.constant 4 : i64
      %5086 = func.call @cc_make_string(%5084, %5085) : (!llvm.ptr, i64) -> i64
      %5087 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5088 = arith.constant 7 : i64
      %5089 = func.call @cc_make_string(%5087, %5088) : (!llvm.ptr, i64) -> i64
      %5090 = func.call @cc_intern(%5086, %5089) : (i64, i64) -> i64
      %5091 = func.call @cc_nil_value() : () -> i64
      %5092 = func.call @cc_cons(%5090, %5091) : (i64, i64) -> i64
      %5093 = func.call @cc_values_pack(%5092) : (i64) -> i64
      func.call @stack_push_pointer(%5090) : (i64) -> ()
      %5094 = func.call @stack_pop_pointer() : () -> i64
      %5095 = llvm.mlir.addressof @str503 : !llvm.ptr
      %5096 = arith.constant 6 : i64
      %5097 = func.call @cc_make_string(%5095, %5096) : (!llvm.ptr, i64) -> i64
      %5098 = func.call @cc_nil_value() : () -> i64
      %5099 = func.call @cc_intern(%5097, %5098) : (i64, i64) -> i64
      %5100 = func.call @cc_nil_value() : () -> i64
      %5101 = func.call @cc_cons(%5099, %5100) : (i64, i64) -> i64
      %5102 = func.call @cc_values_pack(%5101) : (i64) -> i64
      func.call @stack_push_pointer(%5099) : (i64) -> ()
      %5103 = func.call @stack_pop_pointer() : () -> i64
      %5104 = func.call @cc_nil_value() : () -> i64
      %5105 = func.call @cc_errorp(%4183) : (i64) -> i64
      %5106 = arith.cmpi ne, %5105, %5104 : i64
      %5107 = arith.cmpi eq, %5104, %5104 : i64
      %5108 = arith.andi %5106, %5107 : i1
      %5109 = scf.if %5108 -> (i64) {
        scf.yield %4183 : i64
      } else {
        scf.yield %5104 : i64
      }
      %5110 = func.call @cc_errorp(%4565) : (i64) -> i64
      %5111 = arith.cmpi ne, %5110, %5104 : i64
      %5112 = arith.cmpi eq, %5109, %5104 : i64
      %5113 = arith.andi %5111, %5112 : i1
      %5114 = scf.if %5113 -> (i64) {
        scf.yield %4565 : i64
      } else {
        scf.yield %5109 : i64
      }
      %5115 = func.call @cc_errorp(%5064) : (i64) -> i64
      %5116 = arith.cmpi ne, %5115, %5104 : i64
      %5117 = arith.cmpi eq, %5114, %5104 : i64
      %5118 = arith.andi %5116, %5117 : i1
      %5119 = scf.if %5118 -> (i64) {
        scf.yield %5064 : i64
      } else {
        scf.yield %5114 : i64
      }
      %5120 = func.call @cc_errorp(%5071) : (i64) -> i64
      %5121 = arith.cmpi ne, %5120, %5104 : i64
      %5122 = arith.cmpi eq, %5119, %5104 : i64
      %5123 = arith.andi %5121, %5122 : i1
      %5124 = scf.if %5123 -> (i64) {
        scf.yield %5071 : i64
      } else {
        scf.yield %5119 : i64
      }
      %5125 = func.call @cc_errorp(%5082) : (i64) -> i64
      %5126 = arith.cmpi ne, %5125, %5104 : i64
      %5127 = arith.cmpi eq, %5124, %5104 : i64
      %5128 = arith.andi %5126, %5127 : i1
      %5129 = scf.if %5128 -> (i64) {
        scf.yield %5082 : i64
      } else {
        scf.yield %5124 : i64
      }
      %5130 = func.call @cc_errorp(%5083) : (i64) -> i64
      %5131 = arith.cmpi ne, %5130, %5104 : i64
      %5132 = arith.cmpi eq, %5129, %5104 : i64
      %5133 = arith.andi %5131, %5132 : i1
      %5134 = scf.if %5133 -> (i64) {
        scf.yield %5083 : i64
      } else {
        scf.yield %5129 : i64
      }
      %5135 = func.call @cc_errorp(%5094) : (i64) -> i64
      %5136 = arith.cmpi ne, %5135, %5104 : i64
      %5137 = arith.cmpi eq, %5134, %5104 : i64
      %5138 = arith.andi %5136, %5137 : i1
      %5139 = scf.if %5138 -> (i64) {
        scf.yield %5094 : i64
      } else {
        scf.yield %5134 : i64
      }
      %5140 = func.call @cc_errorp(%5103) : (i64) -> i64
      %5141 = arith.cmpi ne, %5140, %5104 : i64
      %5142 = arith.cmpi eq, %5139, %5104 : i64
      %5143 = arith.andi %5141, %5142 : i1
      %5144 = scf.if %5143 -> (i64) {
        scf.yield %5103 : i64
      } else {
        scf.yield %5139 : i64
      }
      %5145 = arith.cmpi ne, %5144, %5104 : i64
      scf.if %5145 {
        func.call @stack_push_pointer(%5144) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4183) : (i64) -> ()
        func.call @stack_push_pointer(%4565) : (i64) -> ()
        func.call @stack_push_pointer(%5064) : (i64) -> ()
        func.call @stack_push_pointer(%5071) : (i64) -> ()
        func.call @stack_push_pointer(%5082) : (i64) -> ()
        func.call @stack_push_pointer(%5083) : (i64) -> ()
        func.call @stack_push_pointer(%5094) : (i64) -> ()
        func.call @stack_push_pointer(%5103) : (i64) -> ()
        %5146 = llvm.mlir.addressof @str504 : !llvm.ptr
        %5147 = func.call @cc_make_function_ref_const(%5146) : (!llvm.ptr) -> i64
        %5148 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5147, %5148) : (i64, i64) -> ()
      }
      %5149 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5149 : i64
    }
    func.call @stack_push_pointer(%4174) : (i64) -> ()
    %5150 = func.call @stack_pop_pointer() : () -> i64
    %5151 = func.call @cc_multiple_value_list(%5150) : (i64) -> i64
    %5152 = llvm.mlir.addressof @str505 : !llvm.ptr
    %5153 = arith.constant 38 : i64
    %5154 = func.call @cc_make_string(%5152, %5153) : (!llvm.ptr, i64) -> i64
    %5155 = func.call @cc_nil_value() : () -> i64
    %5156 = func.call @cc_intern(%5154, %5155) : (i64, i64) -> i64
    %5157 = func.call @cc_nil_value() : () -> i64
    %5158 = func.call @cc_cons(%5156, %5157) : (i64, i64) -> i64
    %5159 = func.call @cc_values_pack(%5158) : (i64) -> i64
    %5160 = func.call @cc_symbol_value(%5156) : (i64) -> i64
    %5161 = llvm.mlir.addressof @str506 : !llvm.ptr
    %5162 = arith.constant 40 : i64
    %5163 = func.call @cc_make_string(%5161, %5162) : (!llvm.ptr, i64) -> i64
    %5164 = func.call @cc_nil_value() : () -> i64
    %5165 = func.call @cc_intern(%5163, %5164) : (i64, i64) -> i64
    %5166 = func.call @cc_nil_value() : () -> i64
    %5167 = func.call @cc_cons(%5165, %5166) : (i64, i64) -> i64
    %5168 = func.call @cc_values_pack(%5167) : (i64) -> i64
    %5169 = func.call @cc_symbol_value(%5165) : (i64) -> i64
    %5170 = func.call @cc_nil_value() : () -> i64
    %5171 = arith.cmpi ne, %5160, %5170 : i64
    %5172 = scf.if %5171 -> (i64) {
      scf.yield %5169 : i64
    } else {
      scf.yield %5151 : i64
    }
    %5173 = func.call @cc_values_pack(%5172) : (i64) -> i64
    func.call @stack_push_pointer(%5173) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_263377075044356"() {
    %728 = func.call @stack_pop_pointer() : () -> i64
    %729 = func.call @cc_nil_value() : () -> i64
    %730 = func.call @cc_nil_value() : () -> i64
    %731 = func.call @cc_errorp(%729) : (i64) -> i64
    %732 = arith.cmpi ne, %731, %730 : i64
    %733 = scf.if %732 -> (i64) {
      scf.yield %729 : i64
    } else {
      %734 = llvm.mlir.addressof @str70 : !llvm.ptr
      %735 = arith.constant 8 : i64
      %736 = func.call @cc_make_string(%734, %735) : (!llvm.ptr, i64) -> i64
      %737 = llvm.mlir.addressof @str71 : !llvm.ptr
      %738 = arith.constant 11 : i64
      %739 = func.call @cc_make_string(%737, %738) : (!llvm.ptr, i64) -> i64
      %740 = func.call @cc_intern(%736, %739) : (i64, i64) -> i64
      %741 = func.call @cc_nil_value() : () -> i64
      %742 = func.call @cc_cons(%740, %741) : (i64, i64) -> i64
      %743 = func.call @cc_values_pack(%742) : (i64) -> i64
      %744 = func.call @cc_symbol_value(%740) : (i64) -> i64
      func.call @stack_push_pointer(%744) : (i64) -> ()
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = llvm.mlir.addressof @str72 : !llvm.ptr
      %747 = arith.constant 6 : i64
      %748 = func.call @cc_make_string(%746, %747) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%748) : (i64) -> ()
      %749 = llvm.mlir.addressof @str73 : !llvm.ptr
      %750 = arith.constant 6 : i64
      %751 = func.call @cc_make_string(%749, %750) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%751) : (i64) -> ()
      %752 = llvm.mlir.addressof @str74 : !llvm.ptr
      %753 = arith.constant 9 : i64
      %754 = func.call @cc_make_string(%752, %753) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%754) : (i64) -> ()
      %755 = llvm.mlir.addressof @str75 : !llvm.ptr
      %756 = arith.constant 17 : i64
      %757 = func.call @cc_make_string(%755, %756) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%757) : (i64) -> ()
      %758 = llvm.mlir.addressof @str76 : !llvm.ptr
      %759 = arith.constant 6 : i64
      %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%760) : (i64) -> ()
      %761 = llvm.mlir.addressof @str77 : !llvm.ptr
      %762 = arith.constant 31 : i64
      %763 = func.call @cc_make_string(%761, %762) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%763) : (i64) -> ()
      %764 = llvm.mlir.addressof @str78 : !llvm.ptr
      %765 = arith.constant 6 : i64
      %766 = func.call @cc_make_string(%764, %765) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%766) : (i64) -> ()
      %767 = llvm.mlir.addressof @str79 : !llvm.ptr
      %768 = arith.constant 25 : i64
      %769 = func.call @cc_make_string(%767, %768) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%769) : (i64) -> ()
      %770 = llvm.mlir.addressof @str80 : !llvm.ptr
      %771 = arith.constant 6 : i64
      %772 = func.call @cc_make_string(%770, %771) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%772) : (i64) -> ()
      %773 = llvm.mlir.addressof @str81 : !llvm.ptr
      %774 = arith.constant 60 : i64
      %775 = func.call @cc_make_string(%773, %774) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%775) : (i64) -> ()
      %776 = llvm.mlir.addressof @str82 : !llvm.ptr
      %777 = arith.constant 6 : i64
      %778 = func.call @cc_make_string(%776, %777) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%778) : (i64) -> ()
      %779 = llvm.mlir.addressof @str83 : !llvm.ptr
      %780 = arith.constant 15 : i64
      %781 = func.call @cc_make_string(%779, %780) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%781) : (i64) -> ()
      %782 = llvm.mlir.addressof @str84 : !llvm.ptr
      %783 = arith.constant 6 : i64
      %784 = func.call @cc_make_string(%782, %783) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%784) : (i64) -> ()
      %785 = llvm.mlir.addressof @str85 : !llvm.ptr
      %786 = arith.constant 2 : i64
      %787 = func.call @cc_make_string(%785, %786) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%787) : (i64) -> ()
      %788 = llvm.mlir.addressof @str86 : !llvm.ptr
      %789 = arith.constant 1 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%790) : (i64) -> ()
      %791 = llvm.mlir.addressof @str87 : !llvm.ptr
      %792 = arith.constant 3 : i64
      %793 = func.call @cc_make_string(%791, %792) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%793) : (i64) -> ()
      %794 = llvm.mlir.addressof @str88 : !llvm.ptr
      %795 = arith.constant 3 : i64
      %796 = func.call @cc_make_string(%794, %795) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%796) : (i64) -> ()
      %797 = llvm.mlir.addressof @str89 : !llvm.ptr
      %798 = arith.constant 5 : i64
      %799 = func.call @cc_make_string(%797, %798) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%799) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = func.call @stack_pop_pointer() : () -> i64
      %802 = func.call @cc_cons(%801, %800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%802) : (i64) -> ()
      %803 = func.call @stack_pop_pointer() : () -> i64
      %804 = func.call @stack_pop_pointer() : () -> i64
      %805 = func.call @cc_cons(%804, %803) : (i64, i64) -> i64
      func.call @stack_push_pointer(%805) : (i64) -> ()
      %806 = func.call @stack_pop_pointer() : () -> i64
      %807 = func.call @stack_pop_pointer() : () -> i64
      %808 = func.call @cc_cons(%807, %806) : (i64, i64) -> i64
      func.call @stack_push_pointer(%808) : (i64) -> ()
      %809 = func.call @stack_pop_pointer() : () -> i64
      %810 = func.call @stack_pop_pointer() : () -> i64
      %811 = func.call @cc_cons(%810, %809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%811) : (i64) -> ()
      %812 = func.call @stack_pop_pointer() : () -> i64
      %813 = func.call @stack_pop_pointer() : () -> i64
      %814 = func.call @cc_cons(%813, %812) : (i64, i64) -> i64
      func.call @stack_push_pointer(%814) : (i64) -> ()
      %815 = func.call @stack_pop_pointer() : () -> i64
      %816 = func.call @stack_pop_pointer() : () -> i64
      %817 = func.call @cc_cons(%816, %815) : (i64, i64) -> i64
      func.call @stack_push_pointer(%817) : (i64) -> ()
      %818 = func.call @stack_pop_pointer() : () -> i64
      %819 = func.call @stack_pop_pointer() : () -> i64
      %820 = func.call @cc_cons(%819, %818) : (i64, i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @stack_pop_pointer() : () -> i64
      %823 = func.call @cc_cons(%822, %821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%823) : (i64) -> ()
      %824 = func.call @stack_pop_pointer() : () -> i64
      %825 = func.call @stack_pop_pointer() : () -> i64
      %826 = func.call @cc_cons(%825, %824) : (i64, i64) -> i64
      func.call @stack_push_pointer(%826) : (i64) -> ()
      %827 = func.call @stack_pop_pointer() : () -> i64
      %828 = func.call @stack_pop_pointer() : () -> i64
      %829 = func.call @cc_cons(%828, %827) : (i64, i64) -> i64
      func.call @stack_push_pointer(%829) : (i64) -> ()
      %830 = func.call @stack_pop_pointer() : () -> i64
      %831 = func.call @stack_pop_pointer() : () -> i64
      %832 = func.call @cc_cons(%831, %830) : (i64, i64) -> i64
      func.call @stack_push_pointer(%832) : (i64) -> ()
      %833 = func.call @stack_pop_pointer() : () -> i64
      %834 = func.call @stack_pop_pointer() : () -> i64
      %835 = func.call @cc_cons(%834, %833) : (i64, i64) -> i64
      func.call @stack_push_pointer(%835) : (i64) -> ()
      %836 = func.call @stack_pop_pointer() : () -> i64
      %837 = func.call @stack_pop_pointer() : () -> i64
      %838 = func.call @cc_cons(%837, %836) : (i64, i64) -> i64
      func.call @stack_push_pointer(%838) : (i64) -> ()
      %839 = func.call @stack_pop_pointer() : () -> i64
      %840 = func.call @stack_pop_pointer() : () -> i64
      %841 = func.call @cc_cons(%840, %839) : (i64, i64) -> i64
      func.call @stack_push_pointer(%841) : (i64) -> ()
      %842 = func.call @stack_pop_pointer() : () -> i64
      %843 = func.call @stack_pop_pointer() : () -> i64
      %844 = func.call @cc_cons(%843, %842) : (i64, i64) -> i64
      func.call @stack_push_pointer(%844) : (i64) -> ()
      %845 = func.call @stack_pop_pointer() : () -> i64
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = func.call @cc_cons(%846, %845) : (i64, i64) -> i64
      func.call @stack_push_pointer(%847) : (i64) -> ()
      %848 = func.call @stack_pop_pointer() : () -> i64
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @cc_cons(%849, %848) : (i64, i64) -> i64
      func.call @stack_push_pointer(%850) : (i64) -> ()
      %851 = func.call @stack_pop_pointer() : () -> i64
      %852 = func.call @stack_pop_pointer() : () -> i64
      %853 = func.call @cc_cons(%852, %851) : (i64, i64) -> i64
      func.call @stack_push_pointer(%853) : (i64) -> ()
      %854 = func.call @stack_pop_pointer() : () -> i64
      %855 = llvm.mlir.addressof @str90 : !llvm.ptr
      %856 = arith.constant 4 : i64
      %857 = func.call @cc_make_string(%855, %856) : (!llvm.ptr, i64) -> i64
      %858 = llvm.mlir.addressof @str91 : !llvm.ptr
      %859 = arith.constant 7 : i64
      %860 = func.call @cc_make_string(%858, %859) : (!llvm.ptr, i64) -> i64
      %861 = func.call @cc_intern(%857, %860) : (i64, i64) -> i64
      %862 = func.call @cc_nil_value() : () -> i64
      %863 = func.call @cc_cons(%861, %862) : (i64, i64) -> i64
      %864 = func.call @cc_values_pack(%863) : (i64) -> i64
      func.call @stack_push_pointer(%861) : (i64) -> ()
      %865 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %866 = func.call @stack_pop_pointer() : () -> i64
      %867 = func.call @cc_nil_value() : () -> i64
      %868 = func.call @cc_errorp(%745) : (i64) -> i64
      %869 = arith.cmpi ne, %868, %867 : i64
      %870 = arith.cmpi eq, %867, %867 : i64
      %871 = arith.andi %869, %870 : i1
      %872 = scf.if %871 -> (i64) {
        scf.yield %745 : i64
      } else {
        scf.yield %867 : i64
      }
      %873 = func.call @cc_errorp(%854) : (i64) -> i64
      %874 = arith.cmpi ne, %873, %867 : i64
      %875 = arith.cmpi eq, %872, %867 : i64
      %876 = arith.andi %874, %875 : i1
      %877 = scf.if %876 -> (i64) {
        scf.yield %854 : i64
      } else {
        scf.yield %872 : i64
      }
      %878 = func.call @cc_errorp(%865) : (i64) -> i64
      %879 = arith.cmpi ne, %878, %867 : i64
      %880 = arith.cmpi eq, %877, %867 : i64
      %881 = arith.andi %879, %880 : i1
      %882 = scf.if %881 -> (i64) {
        scf.yield %865 : i64
      } else {
        scf.yield %877 : i64
      }
      %883 = func.call @cc_errorp(%866) : (i64) -> i64
      %884 = arith.cmpi ne, %883, %867 : i64
      %885 = arith.cmpi eq, %882, %867 : i64
      %886 = arith.andi %884, %885 : i1
      %887 = scf.if %886 -> (i64) {
        scf.yield %866 : i64
      } else {
        scf.yield %882 : i64
      }
      %888 = arith.cmpi ne, %887, %867 : i64
      scf.if %888 {
        func.call @stack_push_pointer(%887) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%745) : (i64) -> ()
        func.call @stack_push_pointer(%854) : (i64) -> ()
        func.call @stack_push_pointer(%865) : (i64) -> ()
        func.call @stack_push_pointer(%866) : (i64) -> ()
        %889 = llvm.mlir.addressof @str92 : !llvm.ptr
        %890 = func.call @cc_make_function_ref_const(%889) : (!llvm.ptr) -> i64
        %891 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%890, %891) : (i64, i64) -> ()
      }
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @cc_multiple_value_list(%892) : (i64) -> i64
      %894 = arith.constant 0 : i64
      %895 = func.call @cc_box_fixnum(%894) : (i64) -> i64
      %896 = func.call @cc_nth(%895, %893) : (i64, i64) -> i64
      %897 = arith.constant 1 : i64
      %898 = func.call @cc_box_fixnum(%897) : (i64) -> i64
      %899 = func.call @cc_nth(%898, %893) : (i64, i64) -> i64
      %900 = arith.constant 2 : i64
      %901 = func.call @cc_box_fixnum(%900) : (i64) -> i64
      %902 = func.call @cc_nth(%901, %893) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %903 = func.call @stack_depth() : () -> i64
      %904 = arith.constant 0 : i64
      %905 = arith.cmpi sgt, %903, %904 : i64
      scf.if %905 {
        %906 = func.call @stack_pop_pointer() : () -> i64
      }
      %907 = llvm.mlir.addressof @str93 : !llvm.ptr
      %908 = func.call @cc_make_function_ref_const(%907) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%908) : (i64) -> ()
      %909 = func.call @stack_pop_pointer() : () -> i64
      %910 = func.call @cc_nil_value() : () -> i64
      %911 = arith.constant 1 : i1
      %912 = arith.constant 0 : i1
      %913 = arith.constant 1 : i1
      %914:2 = scf.if %911 -> (i64, i1) {
        func.call @stack_push_nil() : () -> ()
        %915 = func.call @stack_pop_pointer() : () -> i64
        %916 = func.call @cc_multiple_value_list(%915) : (i64) -> i64
        %917 = func.call @cc_nil_value() : () -> i64
        %918 = llvm.mlir.addressof @str94 : !llvm.ptr
        %919 = arith.constant 38 : i64
        %920 = func.call @cc_make_string(%918, %919) : (!llvm.ptr, i64) -> i64
        %921 = func.call @cc_nil_value() : () -> i64
        %922 = func.call @cc_intern(%920, %921) : (i64, i64) -> i64
        %923 = func.call @cc_nil_value() : () -> i64
        %924 = func.call @cc_cons(%922, %923) : (i64, i64) -> i64
        %925 = func.call @cc_values_pack(%924) : (i64) -> i64
        %926 = func.call @cc_symbol_value(%922) : (i64) -> i64
        %927 = arith.cmpi ne, %926, %917 : i64
        %928:2 = scf.if %927 -> (i64, i1) {
          %929 = func.call @cc_values_pack(%916) : (i64) -> i64
          func.call @stack_push_pointer(%929) : (i64) -> ()
          scf.yield %910, %912 : i64, i1
        } else {
          %930 = func.call @cc_append(%910, %916) : (i64, i64) -> i64
          scf.yield %930, %913 : i64, i1
        }
        scf.yield %928#0, %928#1 : i64, i1
      } else {
        scf.yield %910, %912 : i64, i1
      }
      %931:2 = scf.if %914#1 -> (i64, i1) {
        func.call @stack_push_pointer(%902) : (i64) -> ()
        %932 = func.call @stack_pop_pointer() : () -> i64
        %933 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%933) : (i64) -> ()
        %934 = func.call @stack_pop_pointer() : () -> i64
        %935 = func.call @cc_nil_value() : () -> i64
        %936 = func.call @cc_errorp(%932) : (i64) -> i64
        %937 = arith.cmpi ne, %936, %935 : i64
        %938 = arith.cmpi eq, %935, %935 : i64
        %939 = arith.andi %937, %938 : i1
        %940 = scf.if %939 -> (i64) {
          scf.yield %932 : i64
        } else {
          scf.yield %935 : i64
        }
        %941 = func.call @cc_errorp(%934) : (i64) -> i64
        %942 = arith.cmpi ne, %941, %935 : i64
        %943 = arith.cmpi eq, %940, %935 : i64
        %944 = arith.andi %942, %943 : i1
        %945 = scf.if %944 -> (i64) {
          scf.yield %934 : i64
        } else {
          scf.yield %940 : i64
        }
        %946 = arith.cmpi ne, %945, %935 : i64
        scf.if %946 {
          func.call @stack_push_pointer(%945) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%932) : (i64) -> ()
          func.call @stack_push_pointer(%934) : (i64) -> ()
          %947 = llvm.mlir.addressof @str95 : !llvm.ptr
          %948 = func.call @cc_make_function_ref_const(%947) : (!llvm.ptr) -> i64
          %949 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%948, %949) : (i64, i64) -> ()
        }
        %950 = func.call @stack_pop_pointer() : () -> i64
        %951 = func.call @cc_multiple_value_list(%950) : (i64) -> i64
        %952 = func.call @cc_nil_value() : () -> i64
        %953 = llvm.mlir.addressof @str96 : !llvm.ptr
        %954 = arith.constant 38 : i64
        %955 = func.call @cc_make_string(%953, %954) : (!llvm.ptr, i64) -> i64
        %956 = func.call @cc_nil_value() : () -> i64
        %957 = func.call @cc_intern(%955, %956) : (i64, i64) -> i64
        %958 = func.call @cc_nil_value() : () -> i64
        %959 = func.call @cc_cons(%957, %958) : (i64, i64) -> i64
        %960 = func.call @cc_values_pack(%959) : (i64) -> i64
        %961 = func.call @cc_symbol_value(%957) : (i64) -> i64
        %962 = arith.cmpi ne, %961, %952 : i64
        %963:2 = scf.if %962 -> (i64, i1) {
          %964 = func.call @cc_values_pack(%951) : (i64) -> i64
          func.call @stack_push_pointer(%964) : (i64) -> ()
          scf.yield %914#0, %912 : i64, i1
        } else {
          %965 = func.call @cc_append(%914#0, %951) : (i64, i64) -> i64
          scf.yield %965, %913 : i64, i1
        }
        scf.yield %963#0, %963#1 : i64, i1
      } else {
        scf.yield %914#0, %912 : i64, i1
      }
      scf.if %931#1 {
        %966 = func.call @cc_apply(%909, %931#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%966) : (i64) -> ()
      } else {
      }
      %967 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %967 : i64
    }
    func.call @stack_push_pointer(%733) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044358"() {
    %1293 = func.call @stack_pop_pointer() : () -> i64
    %1294 = func.call @stack_pop_pointer() : () -> i64
    %1295 = func.call @cc_nil_value() : () -> i64
    %1296 = func.call @cc_nil_value() : () -> i64
    %1297 = func.call @cc_errorp(%1295) : (i64) -> i64
    %1298 = arith.cmpi ne, %1297, %1296 : i64
    %1299 = scf.if %1298 -> (i64) {
      scf.yield %1295 : i64
    } else {
      %1300 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1301 = arith.constant 8 : i64
      %1302 = func.call @cc_make_string(%1300, %1301) : (!llvm.ptr, i64) -> i64
      %1303 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1304 = arith.constant 11 : i64
      %1305 = func.call @cc_make_string(%1303, %1304) : (!llvm.ptr, i64) -> i64
      %1306 = func.call @cc_intern(%1302, %1305) : (i64, i64) -> i64
      %1307 = func.call @cc_nil_value() : () -> i64
      %1308 = func.call @cc_cons(%1306, %1307) : (i64, i64) -> i64
      %1309 = func.call @cc_values_pack(%1308) : (i64) -> i64
      %1310 = func.call @cc_symbol_value(%1306) : (i64) -> i64
      func.call @stack_push_pointer(%1310) : (i64) -> ()
      %1311 = func.call @stack_pop_pointer() : () -> i64
      %1312 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1313 = arith.constant 6 : i64
      %1314 = func.call @cc_make_string(%1312, %1313) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1314) : (i64) -> ()
      %1315 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1316 = arith.constant 6 : i64
      %1317 = func.call @cc_make_string(%1315, %1316) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1317) : (i64) -> ()
      %1318 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1319 = arith.constant 9 : i64
      %1320 = func.call @cc_make_string(%1318, %1319) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1320) : (i64) -> ()
      %1321 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1322 = arith.constant 17 : i64
      %1323 = func.call @cc_make_string(%1321, %1322) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1323) : (i64) -> ()
      %1324 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1325 = arith.constant 6 : i64
      %1326 = func.call @cc_make_string(%1324, %1325) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1326) : (i64) -> ()
      %1327 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1328 = arith.constant 31 : i64
      %1329 = func.call @cc_make_string(%1327, %1328) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1329) : (i64) -> ()
      %1330 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1331 = arith.constant 6 : i64
      %1332 = func.call @cc_make_string(%1330, %1331) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1332) : (i64) -> ()
      %1333 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1334 = arith.constant 25 : i64
      %1335 = func.call @cc_make_string(%1333, %1334) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1335) : (i64) -> ()
      %1336 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1337 = arith.constant 6 : i64
      %1338 = func.call @cc_make_string(%1336, %1337) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1338) : (i64) -> ()
      %1339 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1340 = arith.constant 60 : i64
      %1341 = func.call @cc_make_string(%1339, %1340) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1341) : (i64) -> ()
      %1342 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1343 = arith.constant 6 : i64
      %1344 = func.call @cc_make_string(%1342, %1343) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1344) : (i64) -> ()
      %1345 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1346 = arith.constant 12 : i64
      %1347 = func.call @cc_make_string(%1345, %1346) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1347) : (i64) -> ()
      %1348 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1349 = arith.constant 6 : i64
      %1350 = func.call @cc_make_string(%1348, %1349) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1350) : (i64) -> ()
      %1351 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1352 = arith.constant 2 : i64
      %1353 = func.call @cc_make_string(%1351, %1352) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1353) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1354 = func.call @stack_pop_pointer() : () -> i64
      %1355 = func.call @stack_pop_pointer() : () -> i64
      %1356 = func.call @cc_cons(%1355, %1354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1356) : (i64) -> ()
      %1357 = func.call @stack_pop_pointer() : () -> i64
      %1358 = func.call @stack_pop_pointer() : () -> i64
      %1359 = func.call @cc_cons(%1358, %1357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1359) : (i64) -> ()
      %1360 = func.call @stack_pop_pointer() : () -> i64
      %1361 = func.call @stack_pop_pointer() : () -> i64
      %1362 = func.call @cc_cons(%1361, %1360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1362) : (i64) -> ()
      %1363 = func.call @stack_pop_pointer() : () -> i64
      %1364 = func.call @stack_pop_pointer() : () -> i64
      %1365 = func.call @cc_cons(%1364, %1363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1365) : (i64) -> ()
      %1366 = func.call @stack_pop_pointer() : () -> i64
      %1367 = func.call @stack_pop_pointer() : () -> i64
      %1368 = func.call @cc_cons(%1367, %1366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1368) : (i64) -> ()
      %1369 = func.call @stack_pop_pointer() : () -> i64
      %1370 = func.call @stack_pop_pointer() : () -> i64
      %1371 = func.call @cc_cons(%1370, %1369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1371) : (i64) -> ()
      %1372 = func.call @stack_pop_pointer() : () -> i64
      %1373 = func.call @stack_pop_pointer() : () -> i64
      %1374 = func.call @cc_cons(%1373, %1372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1374) : (i64) -> ()
      %1375 = func.call @stack_pop_pointer() : () -> i64
      %1376 = func.call @stack_pop_pointer() : () -> i64
      %1377 = func.call @cc_cons(%1376, %1375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1377) : (i64) -> ()
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = func.call @stack_pop_pointer() : () -> i64
      %1380 = func.call @cc_cons(%1379, %1378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1380) : (i64) -> ()
      %1381 = func.call @stack_pop_pointer() : () -> i64
      %1382 = func.call @stack_pop_pointer() : () -> i64
      %1383 = func.call @cc_cons(%1382, %1381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1383) : (i64) -> ()
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @stack_pop_pointer() : () -> i64
      %1386 = func.call @cc_cons(%1385, %1384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1386) : (i64) -> ()
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = func.call @stack_pop_pointer() : () -> i64
      %1389 = func.call @cc_cons(%1388, %1387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1389) : (i64) -> ()
      %1390 = func.call @stack_pop_pointer() : () -> i64
      %1391 = func.call @stack_pop_pointer() : () -> i64
      %1392 = func.call @cc_cons(%1391, %1390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1392) : (i64) -> ()
      %1393 = func.call @stack_pop_pointer() : () -> i64
      %1394 = func.call @stack_pop_pointer() : () -> i64
      %1395 = func.call @cc_cons(%1394, %1393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1395) : (i64) -> ()
      %1396 = func.call @stack_pop_pointer() : () -> i64
      %1397 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1398 = arith.constant 6 : i64
      %1399 = func.call @cc_make_string(%1397, %1398) : (!llvm.ptr, i64) -> i64
      %1400 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1401 = arith.constant 7 : i64
      %1402 = func.call @cc_make_string(%1400, %1401) : (!llvm.ptr, i64) -> i64
      %1403 = func.call @cc_intern(%1399, %1402) : (i64, i64) -> i64
      %1404 = func.call @cc_nil_value() : () -> i64
      %1405 = func.call @cc_cons(%1403, %1404) : (i64, i64) -> i64
      %1406 = func.call @cc_values_pack(%1405) : (i64) -> i64
      func.call @stack_push_pointer(%1403) : (i64) -> ()
      %1407 = func.call @stack_pop_pointer() : () -> i64
      %1408 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1409 = arith.constant 6 : i64
      %1410 = func.call @cc_make_string(%1408, %1409) : (!llvm.ptr, i64) -> i64
      %1411 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1412 = arith.constant 7 : i64
      %1413 = func.call @cc_make_string(%1411, %1412) : (!llvm.ptr, i64) -> i64
      %1414 = func.call @cc_intern(%1410, %1413) : (i64, i64) -> i64
      %1415 = func.call @cc_nil_value() : () -> i64
      %1416 = func.call @cc_cons(%1414, %1415) : (i64, i64) -> i64
      %1417 = func.call @cc_values_pack(%1416) : (i64) -> i64
      func.call @stack_push_pointer(%1414) : (i64) -> ()
      %1418 = func.call @stack_pop_pointer() : () -> i64
      %1419 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1420 = arith.constant 5 : i64
      %1421 = func.call @cc_make_string(%1419, %1420) : (!llvm.ptr, i64) -> i64
      %1422 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1423 = arith.constant 7 : i64
      %1424 = func.call @cc_make_string(%1422, %1423) : (!llvm.ptr, i64) -> i64
      %1425 = func.call @cc_intern(%1421, %1424) : (i64, i64) -> i64
      %1426 = func.call @cc_nil_value() : () -> i64
      %1427 = func.call @cc_cons(%1425, %1426) : (i64, i64) -> i64
      %1428 = func.call @cc_values_pack(%1427) : (i64) -> i64
      func.call @stack_push_pointer(%1425) : (i64) -> ()
      %1429 = func.call @stack_pop_pointer() : () -> i64
      %1430 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1431 = arith.constant 6 : i64
      %1432 = func.call @cc_make_string(%1430, %1431) : (!llvm.ptr, i64) -> i64
      %1433 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1434 = arith.constant 7 : i64
      %1435 = func.call @cc_make_string(%1433, %1434) : (!llvm.ptr, i64) -> i64
      %1436 = func.call @cc_intern(%1432, %1435) : (i64, i64) -> i64
      %1437 = func.call @cc_nil_value() : () -> i64
      %1438 = func.call @cc_cons(%1436, %1437) : (i64, i64) -> i64
      %1439 = func.call @cc_values_pack(%1438) : (i64) -> i64
      func.call @stack_push_pointer(%1436) : (i64) -> ()
      %1440 = func.call @stack_pop_pointer() : () -> i64
      %1441 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1442 = arith.constant 4 : i64
      %1443 = func.call @cc_make_string(%1441, %1442) : (!llvm.ptr, i64) -> i64
      %1444 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1445 = arith.constant 7 : i64
      %1446 = func.call @cc_make_string(%1444, %1445) : (!llvm.ptr, i64) -> i64
      %1447 = func.call @cc_intern(%1443, %1446) : (i64, i64) -> i64
      %1448 = func.call @cc_nil_value() : () -> i64
      %1449 = func.call @cc_cons(%1447, %1448) : (i64, i64) -> i64
      %1450 = func.call @cc_values_pack(%1449) : (i64) -> i64
      func.call @stack_push_pointer(%1447) : (i64) -> ()
      %1451 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1452 = func.call @stack_pop_pointer() : () -> i64
      %1453 = func.call @cc_nil_value() : () -> i64
      %1454 = func.call @cc_errorp(%1311) : (i64) -> i64
      %1455 = arith.cmpi ne, %1454, %1453 : i64
      %1456 = arith.cmpi eq, %1453, %1453 : i64
      %1457 = arith.andi %1455, %1456 : i1
      %1458 = scf.if %1457 -> (i64) {
        scf.yield %1311 : i64
      } else {
        scf.yield %1453 : i64
      }
      %1459 = func.call @cc_errorp(%1396) : (i64) -> i64
      %1460 = arith.cmpi ne, %1459, %1453 : i64
      %1461 = arith.cmpi eq, %1458, %1453 : i64
      %1462 = arith.andi %1460, %1461 : i1
      %1463 = scf.if %1462 -> (i64) {
        scf.yield %1396 : i64
      } else {
        scf.yield %1458 : i64
      }
      %1464 = func.call @cc_errorp(%1407) : (i64) -> i64
      %1465 = arith.cmpi ne, %1464, %1453 : i64
      %1466 = arith.cmpi eq, %1463, %1453 : i64
      %1467 = arith.andi %1465, %1466 : i1
      %1468 = scf.if %1467 -> (i64) {
        scf.yield %1407 : i64
      } else {
        scf.yield %1463 : i64
      }
      %1469 = func.call @cc_errorp(%1418) : (i64) -> i64
      %1470 = arith.cmpi ne, %1469, %1453 : i64
      %1471 = arith.cmpi eq, %1468, %1453 : i64
      %1472 = arith.andi %1470, %1471 : i1
      %1473 = scf.if %1472 -> (i64) {
        scf.yield %1418 : i64
      } else {
        scf.yield %1468 : i64
      }
      %1474 = func.call @cc_errorp(%1429) : (i64) -> i64
      %1475 = arith.cmpi ne, %1474, %1453 : i64
      %1476 = arith.cmpi eq, %1473, %1453 : i64
      %1477 = arith.andi %1475, %1476 : i1
      %1478 = scf.if %1477 -> (i64) {
        scf.yield %1429 : i64
      } else {
        scf.yield %1473 : i64
      }
      %1479 = func.call @cc_errorp(%1440) : (i64) -> i64
      %1480 = arith.cmpi ne, %1479, %1453 : i64
      %1481 = arith.cmpi eq, %1478, %1453 : i64
      %1482 = arith.andi %1480, %1481 : i1
      %1483 = scf.if %1482 -> (i64) {
        scf.yield %1440 : i64
      } else {
        scf.yield %1478 : i64
      }
      %1484 = func.call @cc_errorp(%1451) : (i64) -> i64
      %1485 = arith.cmpi ne, %1484, %1453 : i64
      %1486 = arith.cmpi eq, %1483, %1453 : i64
      %1487 = arith.andi %1485, %1486 : i1
      %1488 = scf.if %1487 -> (i64) {
        scf.yield %1451 : i64
      } else {
        scf.yield %1483 : i64
      }
      %1489 = func.call @cc_errorp(%1452) : (i64) -> i64
      %1490 = arith.cmpi ne, %1489, %1453 : i64
      %1491 = arith.cmpi eq, %1488, %1453 : i64
      %1492 = arith.andi %1490, %1491 : i1
      %1493 = scf.if %1492 -> (i64) {
        scf.yield %1452 : i64
      } else {
        scf.yield %1488 : i64
      }
      %1494 = arith.cmpi ne, %1493, %1453 : i64
      scf.if %1494 {
        func.call @stack_push_pointer(%1493) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1311) : (i64) -> ()
        func.call @stack_push_pointer(%1396) : (i64) -> ()
        func.call @stack_push_pointer(%1407) : (i64) -> ()
        func.call @stack_push_pointer(%1418) : (i64) -> ()
        func.call @stack_push_pointer(%1429) : (i64) -> ()
        func.call @stack_push_pointer(%1440) : (i64) -> ()
        func.call @stack_push_pointer(%1451) : (i64) -> ()
        func.call @stack_push_pointer(%1452) : (i64) -> ()
        %1495 = llvm.mlir.addressof @str154 : !llvm.ptr
        %1496 = func.call @cc_make_function_ref_const(%1495) : (!llvm.ptr) -> i64
        %1497 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1496, %1497) : (i64, i64) -> ()
      }
      %1498 = func.call @stack_pop_pointer() : () -> i64
      %1499 = func.call @cc_multiple_value_list(%1498) : (i64) -> i64
      %1500 = arith.constant 0 : i64
      %1501 = func.call @cc_box_fixnum(%1500) : (i64) -> i64
      %1502 = func.call @cc_nth(%1501, %1499) : (i64, i64) -> i64
      %1503 = arith.constant 1 : i64
      %1504 = func.call @cc_box_fixnum(%1503) : (i64) -> i64
      %1505 = func.call @cc_nth(%1504, %1499) : (i64, i64) -> i64
      %1506 = arith.constant 2 : i64
      %1507 = func.call @cc_box_fixnum(%1506) : (i64) -> i64
      %1508 = func.call @cc_nth(%1507, %1499) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %1509 = func.call @stack_depth() : () -> i64
      %1510 = arith.constant 0 : i64
      %1511 = arith.cmpi sgt, %1509, %1510 : i64
      scf.if %1511 {
        %1512 = func.call @stack_pop_pointer() : () -> i64
      }
      %1513 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1514 = func.call @cc_make_function_ref_const(%1513) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1514) : (i64) -> ()
      %1515 = func.call @stack_pop_pointer() : () -> i64
      %1516 = func.call @cc_nil_value() : () -> i64
      %1517 = arith.constant 1 : i1
      %1518 = arith.constant 0 : i1
      %1519 = arith.constant 1 : i1
      %1520:2 = scf.if %1517 -> (i64, i1) {
        %1521 = func.call @cc_nil_value() : () -> i64
        %1522 = func.call @cc_nil_value() : () -> i64
        %1523 = func.call @cc_errorp(%1521) : (i64) -> i64
        %1524 = arith.cmpi ne, %1523, %1522 : i64
        %1525 = scf.if %1524 -> (i64) {
          scf.yield %1521 : i64
        } else {
          func.call @stack_push_pointer(%1508) : (i64) -> ()
          %1526 = func.call @stack_pop_pointer() : () -> i64
          %1527 = func.call @cc_nil_value() : () -> i64
          %1528 = func.call @cc_errorp(%1526) : (i64) -> i64
          %1529 = arith.cmpi ne, %1528, %1527 : i64
          %1530 = arith.cmpi eq, %1527, %1527 : i64
          %1531 = arith.andi %1529, %1530 : i1
          %1532 = scf.if %1531 -> (i64) {
            scf.yield %1526 : i64
          } else {
            scf.yield %1527 : i64
          }
          %1533 = arith.cmpi ne, %1532, %1527 : i64
          scf.if %1533 {
            func.call @stack_push_pointer(%1532) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1526) : (i64) -> ()
            %1534 = llvm.mlir.addressof @str156 : !llvm.ptr
            %1535 = func.call @cc_make_function_ref_const(%1534) : (!llvm.ptr) -> i64
            %1536 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1535, %1536) : (i64, i64) -> ()
          }
          %1537 = func.call @stack_pop_pointer() : () -> i64
          %1538 = func.call @cc_nil_value() : () -> i64
          %1539 = func.call @cc_nil_value() : () -> i64
          %1540 = func.call @cc_errorp(%1538) : (i64) -> i64
          %1541 = arith.cmpi ne, %1540, %1539 : i64
          %1542 = scf.if %1541 -> (i64) {
            scf.yield %1538 : i64
          } else {
            func.call @stack_push_pointer(%1502) : (i64) -> ()
            %1543 = func.call @stack_pop_pointer() : () -> i64
            %1544 = func.call @cc_nil_value() : () -> i64
            %1545 = func.call @cc_errorp(%1543) : (i64) -> i64
            %1546 = arith.cmpi ne, %1545, %1544 : i64
            %1547 = arith.cmpi eq, %1544, %1544 : i64
            %1548 = arith.andi %1546, %1547 : i1
            %1549 = scf.if %1548 -> (i64) {
              scf.yield %1543 : i64
            } else {
              scf.yield %1544 : i64
            }
            %1550 = arith.cmpi ne, %1549, %1544 : i64
            scf.if %1550 {
              func.call @stack_push_pointer(%1549) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1543) : (i64) -> ()
              %1551 = llvm.mlir.addressof @str157 : !llvm.ptr
              %1552 = func.call @cc_make_function_ref_const(%1551) : (!llvm.ptr) -> i64
              %1553 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1552, %1553) : (i64, i64) -> ()
            }
            %1554 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1537) : (i64) -> ()
            %1555 = func.call @stack_pop_pointer() : () -> i64
            %1556 = func.call @cc_nil_value() : () -> i64
            %1557 = func.call @cc_errorp(%1555) : (i64) -> i64
            %1558 = arith.cmpi ne, %1557, %1556 : i64
            %1559 = arith.cmpi eq, %1556, %1556 : i64
            %1560 = arith.andi %1558, %1559 : i1
            %1561 = scf.if %1560 -> (i64) {
              scf.yield %1555 : i64
            } else {
              scf.yield %1556 : i64
            }
            %1562 = arith.cmpi ne, %1561, %1556 : i64
            scf.if %1562 {
              func.call @stack_push_pointer(%1561) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1555) : (i64) -> ()
              %1563 = llvm.mlir.addressof @str158 : !llvm.ptr
              %1564 = func.call @cc_make_function_ref_const(%1563) : (!llvm.ptr) -> i64
              %1565 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1564, %1565) : (i64, i64) -> ()
            }
            %1566 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %1567 = func.call @stack_pop_pointer() : () -> i64
            %1568 = func.call @cc_cons(%1566, %1567) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1568) : (i64) -> ()
            %1569 = func.call @stack_pop_pointer() : () -> i64
            %1570 = func.call @cc_cons(%1554, %1569) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1570) : (i64) -> ()
            %1571 = func.call @stack_pop_pointer() : () -> i64
            %1572 = func.call @cc_values_pack(%1571) : (i64) -> i64
            func.call @stack_push_pointer(%1572) : (i64) -> ()
            %1573 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1573 : i64
          }
          func.call @stack_push_pointer(%1542) : (i64) -> ()
          %1574 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1574 : i64
        }
        func.call @stack_push_pointer(%1525) : (i64) -> ()
        %1575 = func.call @stack_pop_pointer() : () -> i64
        %1576 = func.call @cc_multiple_value_list(%1575) : (i64) -> i64
        %1577 = func.call @cc_nil_value() : () -> i64
        %1578 = llvm.mlir.addressof @str159 : !llvm.ptr
        %1579 = arith.constant 38 : i64
        %1580 = func.call @cc_make_string(%1578, %1579) : (!llvm.ptr, i64) -> i64
        %1581 = func.call @cc_nil_value() : () -> i64
        %1582 = func.call @cc_intern(%1580, %1581) : (i64, i64) -> i64
        %1583 = func.call @cc_nil_value() : () -> i64
        %1584 = func.call @cc_cons(%1582, %1583) : (i64, i64) -> i64
        %1585 = func.call @cc_values_pack(%1584) : (i64) -> i64
        %1586 = func.call @cc_symbol_value(%1582) : (i64) -> i64
        %1587 = arith.cmpi ne, %1586, %1577 : i64
        %1588:2 = scf.if %1587 -> (i64, i1) {
          %1589 = func.call @cc_values_pack(%1576) : (i64) -> i64
          func.call @stack_push_pointer(%1589) : (i64) -> ()
          scf.yield %1516, %1518 : i64, i1
        } else {
          %1590 = func.call @cc_append(%1516, %1576) : (i64, i64) -> i64
          scf.yield %1590, %1519 : i64, i1
        }
        scf.yield %1588#0, %1588#1 : i64, i1
      } else {
        scf.yield %1516, %1518 : i64, i1
      }
      %1591:2 = scf.if %1520#1 -> (i64, i1) {
        func.call @stack_push_pointer(%1508) : (i64) -> ()
        %1592 = func.call @stack_pop_pointer() : () -> i64
        %1593 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%1593) : (i64) -> ()
        %1594 = func.call @stack_pop_pointer() : () -> i64
        %1595 = func.call @cc_nil_value() : () -> i64
        %1596 = func.call @cc_errorp(%1592) : (i64) -> i64
        %1597 = arith.cmpi ne, %1596, %1595 : i64
        %1598 = arith.cmpi eq, %1595, %1595 : i64
        %1599 = arith.andi %1597, %1598 : i1
        %1600 = scf.if %1599 -> (i64) {
          scf.yield %1592 : i64
        } else {
          scf.yield %1595 : i64
        }
        %1601 = func.call @cc_errorp(%1594) : (i64) -> i64
        %1602 = arith.cmpi ne, %1601, %1595 : i64
        %1603 = arith.cmpi eq, %1600, %1595 : i64
        %1604 = arith.andi %1602, %1603 : i1
        %1605 = scf.if %1604 -> (i64) {
          scf.yield %1594 : i64
        } else {
          scf.yield %1600 : i64
        }
        %1606 = arith.cmpi ne, %1605, %1595 : i64
        scf.if %1606 {
          func.call @stack_push_pointer(%1605) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1592) : (i64) -> ()
          func.call @stack_push_pointer(%1594) : (i64) -> ()
          %1607 = llvm.mlir.addressof @str160 : !llvm.ptr
          %1608 = func.call @cc_make_function_ref_const(%1607) : (!llvm.ptr) -> i64
          %1609 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1608, %1609) : (i64, i64) -> ()
        }
        %1610 = func.call @stack_pop_pointer() : () -> i64
        %1611 = func.call @cc_multiple_value_list(%1610) : (i64) -> i64
        %1612 = func.call @cc_nil_value() : () -> i64
        %1613 = llvm.mlir.addressof @str161 : !llvm.ptr
        %1614 = arith.constant 38 : i64
        %1615 = func.call @cc_make_string(%1613, %1614) : (!llvm.ptr, i64) -> i64
        %1616 = func.call @cc_nil_value() : () -> i64
        %1617 = func.call @cc_intern(%1615, %1616) : (i64, i64) -> i64
        %1618 = func.call @cc_nil_value() : () -> i64
        %1619 = func.call @cc_cons(%1617, %1618) : (i64, i64) -> i64
        %1620 = func.call @cc_values_pack(%1619) : (i64) -> i64
        %1621 = func.call @cc_symbol_value(%1617) : (i64) -> i64
        %1622 = arith.cmpi ne, %1621, %1612 : i64
        %1623:2 = scf.if %1622 -> (i64, i1) {
          %1624 = func.call @cc_values_pack(%1611) : (i64) -> i64
          func.call @stack_push_pointer(%1624) : (i64) -> ()
          scf.yield %1520#0, %1518 : i64, i1
        } else {
          %1625 = func.call @cc_append(%1520#0, %1611) : (i64, i64) -> i64
          scf.yield %1625, %1519 : i64, i1
        }
        scf.yield %1623#0, %1623#1 : i64, i1
      } else {
        scf.yield %1520#0, %1518 : i64, i1
      }
      scf.if %1591#1 {
        %1626 = func.call @cc_apply(%1515, %1591#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1626) : (i64) -> ()
      } else {
      }
      %1627 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1627 : i64
    }
    func.call @stack_push_pointer(%1299) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044361"() {
    %1966 = func.call @stack_pop_pointer() : () -> i64
    %1967 = func.call @stack_pop_pointer() : () -> i64
    %1968 = func.call @cc_nil_value() : () -> i64
    %1969 = func.call @cc_nil_value() : () -> i64
    %1970 = func.call @cc_errorp(%1968) : (i64) -> i64
    %1971 = arith.cmpi ne, %1970, %1969 : i64
    %1972 = scf.if %1971 -> (i64) {
      scf.yield %1968 : i64
    } else {
      %1973 = llvm.mlir.addressof @str196 : !llvm.ptr
      %1974 = arith.constant 8 : i64
      %1975 = func.call @cc_make_string(%1973, %1974) : (!llvm.ptr, i64) -> i64
      %1976 = llvm.mlir.addressof @str197 : !llvm.ptr
      %1977 = arith.constant 11 : i64
      %1978 = func.call @cc_make_string(%1976, %1977) : (!llvm.ptr, i64) -> i64
      %1979 = func.call @cc_intern(%1975, %1978) : (i64, i64) -> i64
      %1980 = func.call @cc_nil_value() : () -> i64
      %1981 = func.call @cc_cons(%1979, %1980) : (i64, i64) -> i64
      %1982 = func.call @cc_values_pack(%1981) : (i64) -> i64
      %1983 = func.call @cc_symbol_value(%1979) : (i64) -> i64
      func.call @stack_push_pointer(%1983) : (i64) -> ()
      %1984 = func.call @stack_pop_pointer() : () -> i64
      %1985 = llvm.mlir.addressof @str198 : !llvm.ptr
      %1986 = arith.constant 6 : i64
      %1987 = func.call @cc_make_string(%1985, %1986) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1987) : (i64) -> ()
      %1988 = llvm.mlir.addressof @str199 : !llvm.ptr
      %1989 = arith.constant 6 : i64
      %1990 = func.call @cc_make_string(%1988, %1989) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1990) : (i64) -> ()
      %1991 = llvm.mlir.addressof @str200 : !llvm.ptr
      %1992 = arith.constant 9 : i64
      %1993 = func.call @cc_make_string(%1991, %1992) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1993) : (i64) -> ()
      %1994 = llvm.mlir.addressof @str201 : !llvm.ptr
      %1995 = arith.constant 17 : i64
      %1996 = func.call @cc_make_string(%1994, %1995) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1996) : (i64) -> ()
      %1997 = llvm.mlir.addressof @str202 : !llvm.ptr
      %1998 = arith.constant 6 : i64
      %1999 = func.call @cc_make_string(%1997, %1998) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1999) : (i64) -> ()
      %2000 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2001 = arith.constant 31 : i64
      %2002 = func.call @cc_make_string(%2000, %2001) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2002) : (i64) -> ()
      %2003 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2004 = arith.constant 6 : i64
      %2005 = func.call @cc_make_string(%2003, %2004) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2005) : (i64) -> ()
      %2006 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2007 = arith.constant 25 : i64
      %2008 = func.call @cc_make_string(%2006, %2007) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2008) : (i64) -> ()
      %2009 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2010 = arith.constant 6 : i64
      %2011 = func.call @cc_make_string(%2009, %2010) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2011) : (i64) -> ()
      %2012 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2013 = arith.constant 60 : i64
      %2014 = func.call @cc_make_string(%2012, %2013) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2014) : (i64) -> ()
      %2015 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2016 = arith.constant 6 : i64
      %2017 = func.call @cc_make_string(%2015, %2016) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2017) : (i64) -> ()
      %2018 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2019 = arith.constant 12 : i64
      %2020 = func.call @cc_make_string(%2018, %2019) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2020) : (i64) -> ()
      %2021 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2022 = arith.constant 6 : i64
      %2023 = func.call @cc_make_string(%2021, %2022) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2023) : (i64) -> ()
      %2024 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2025 = arith.constant 2 : i64
      %2026 = func.call @cc_make_string(%2024, %2025) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2026) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2027 = func.call @stack_pop_pointer() : () -> i64
      %2028 = func.call @stack_pop_pointer() : () -> i64
      %2029 = func.call @cc_cons(%2028, %2027) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2029) : (i64) -> ()
      %2030 = func.call @stack_pop_pointer() : () -> i64
      %2031 = func.call @stack_pop_pointer() : () -> i64
      %2032 = func.call @cc_cons(%2031, %2030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2032) : (i64) -> ()
      %2033 = func.call @stack_pop_pointer() : () -> i64
      %2034 = func.call @stack_pop_pointer() : () -> i64
      %2035 = func.call @cc_cons(%2034, %2033) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2035) : (i64) -> ()
      %2036 = func.call @stack_pop_pointer() : () -> i64
      %2037 = func.call @stack_pop_pointer() : () -> i64
      %2038 = func.call @cc_cons(%2037, %2036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2038) : (i64) -> ()
      %2039 = func.call @stack_pop_pointer() : () -> i64
      %2040 = func.call @stack_pop_pointer() : () -> i64
      %2041 = func.call @cc_cons(%2040, %2039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2041) : (i64) -> ()
      %2042 = func.call @stack_pop_pointer() : () -> i64
      %2043 = func.call @stack_pop_pointer() : () -> i64
      %2044 = func.call @cc_cons(%2043, %2042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2044) : (i64) -> ()
      %2045 = func.call @stack_pop_pointer() : () -> i64
      %2046 = func.call @stack_pop_pointer() : () -> i64
      %2047 = func.call @cc_cons(%2046, %2045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2047) : (i64) -> ()
      %2048 = func.call @stack_pop_pointer() : () -> i64
      %2049 = func.call @stack_pop_pointer() : () -> i64
      %2050 = func.call @cc_cons(%2049, %2048) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2050) : (i64) -> ()
      %2051 = func.call @stack_pop_pointer() : () -> i64
      %2052 = func.call @stack_pop_pointer() : () -> i64
      %2053 = func.call @cc_cons(%2052, %2051) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2053) : (i64) -> ()
      %2054 = func.call @stack_pop_pointer() : () -> i64
      %2055 = func.call @stack_pop_pointer() : () -> i64
      %2056 = func.call @cc_cons(%2055, %2054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2056) : (i64) -> ()
      %2057 = func.call @stack_pop_pointer() : () -> i64
      %2058 = func.call @stack_pop_pointer() : () -> i64
      %2059 = func.call @cc_cons(%2058, %2057) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2059) : (i64) -> ()
      %2060 = func.call @stack_pop_pointer() : () -> i64
      %2061 = func.call @stack_pop_pointer() : () -> i64
      %2062 = func.call @cc_cons(%2061, %2060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2062) : (i64) -> ()
      %2063 = func.call @stack_pop_pointer() : () -> i64
      %2064 = func.call @stack_pop_pointer() : () -> i64
      %2065 = func.call @cc_cons(%2064, %2063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2065) : (i64) -> ()
      %2066 = func.call @stack_pop_pointer() : () -> i64
      %2067 = func.call @stack_pop_pointer() : () -> i64
      %2068 = func.call @cc_cons(%2067, %2066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2068) : (i64) -> ()
      %2069 = func.call @stack_pop_pointer() : () -> i64
      %2070 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2071 = arith.constant 6 : i64
      %2072 = func.call @cc_make_string(%2070, %2071) : (!llvm.ptr, i64) -> i64
      %2073 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2074 = arith.constant 7 : i64
      %2075 = func.call @cc_make_string(%2073, %2074) : (!llvm.ptr, i64) -> i64
      %2076 = func.call @cc_intern(%2072, %2075) : (i64, i64) -> i64
      %2077 = func.call @cc_nil_value() : () -> i64
      %2078 = func.call @cc_cons(%2076, %2077) : (i64, i64) -> i64
      %2079 = func.call @cc_values_pack(%2078) : (i64) -> i64
      func.call @stack_push_pointer(%2076) : (i64) -> ()
      %2080 = func.call @stack_pop_pointer() : () -> i64
      %2081 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2082 = arith.constant 6 : i64
      %2083 = func.call @cc_make_string(%2081, %2082) : (!llvm.ptr, i64) -> i64
      %2084 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2085 = arith.constant 7 : i64
      %2086 = func.call @cc_make_string(%2084, %2085) : (!llvm.ptr, i64) -> i64
      %2087 = func.call @cc_intern(%2083, %2086) : (i64, i64) -> i64
      %2088 = func.call @cc_nil_value() : () -> i64
      %2089 = func.call @cc_cons(%2087, %2088) : (i64, i64) -> i64
      %2090 = func.call @cc_values_pack(%2089) : (i64) -> i64
      func.call @stack_push_pointer(%2087) : (i64) -> ()
      %2091 = func.call @stack_pop_pointer() : () -> i64
      %2092 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2093 = arith.constant 5 : i64
      %2094 = func.call @cc_make_string(%2092, %2093) : (!llvm.ptr, i64) -> i64
      %2095 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2096 = arith.constant 7 : i64
      %2097 = func.call @cc_make_string(%2095, %2096) : (!llvm.ptr, i64) -> i64
      %2098 = func.call @cc_intern(%2094, %2097) : (i64, i64) -> i64
      %2099 = func.call @cc_nil_value() : () -> i64
      %2100 = func.call @cc_cons(%2098, %2099) : (i64, i64) -> i64
      %2101 = func.call @cc_values_pack(%2100) : (i64) -> i64
      func.call @stack_push_pointer(%2098) : (i64) -> ()
      %2102 = func.call @stack_pop_pointer() : () -> i64
      %2103 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2104 = arith.constant 6 : i64
      %2105 = func.call @cc_make_string(%2103, %2104) : (!llvm.ptr, i64) -> i64
      %2106 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2107 = arith.constant 7 : i64
      %2108 = func.call @cc_make_string(%2106, %2107) : (!llvm.ptr, i64) -> i64
      %2109 = func.call @cc_intern(%2105, %2108) : (i64, i64) -> i64
      %2110 = func.call @cc_nil_value() : () -> i64
      %2111 = func.call @cc_cons(%2109, %2110) : (i64, i64) -> i64
      %2112 = func.call @cc_values_pack(%2111) : (i64) -> i64
      func.call @stack_push_pointer(%2109) : (i64) -> ()
      %2113 = func.call @stack_pop_pointer() : () -> i64
      %2114 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2115 = arith.constant 4 : i64
      %2116 = func.call @cc_make_string(%2114, %2115) : (!llvm.ptr, i64) -> i64
      %2117 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2118 = arith.constant 7 : i64
      %2119 = func.call @cc_make_string(%2117, %2118) : (!llvm.ptr, i64) -> i64
      %2120 = func.call @cc_intern(%2116, %2119) : (i64, i64) -> i64
      %2121 = func.call @cc_nil_value() : () -> i64
      %2122 = func.call @cc_cons(%2120, %2121) : (i64, i64) -> i64
      %2123 = func.call @cc_values_pack(%2122) : (i64) -> i64
      func.call @stack_push_pointer(%2120) : (i64) -> ()
      %2124 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2125 = func.call @stack_pop_pointer() : () -> i64
      %2126 = func.call @cc_nil_value() : () -> i64
      %2127 = func.call @cc_errorp(%1984) : (i64) -> i64
      %2128 = arith.cmpi ne, %2127, %2126 : i64
      %2129 = arith.cmpi eq, %2126, %2126 : i64
      %2130 = arith.andi %2128, %2129 : i1
      %2131 = scf.if %2130 -> (i64) {
        scf.yield %1984 : i64
      } else {
        scf.yield %2126 : i64
      }
      %2132 = func.call @cc_errorp(%2069) : (i64) -> i64
      %2133 = arith.cmpi ne, %2132, %2126 : i64
      %2134 = arith.cmpi eq, %2131, %2126 : i64
      %2135 = arith.andi %2133, %2134 : i1
      %2136 = scf.if %2135 -> (i64) {
        scf.yield %2069 : i64
      } else {
        scf.yield %2131 : i64
      }
      %2137 = func.call @cc_errorp(%2080) : (i64) -> i64
      %2138 = arith.cmpi ne, %2137, %2126 : i64
      %2139 = arith.cmpi eq, %2136, %2126 : i64
      %2140 = arith.andi %2138, %2139 : i1
      %2141 = scf.if %2140 -> (i64) {
        scf.yield %2080 : i64
      } else {
        scf.yield %2136 : i64
      }
      %2142 = func.call @cc_errorp(%2091) : (i64) -> i64
      %2143 = arith.cmpi ne, %2142, %2126 : i64
      %2144 = arith.cmpi eq, %2141, %2126 : i64
      %2145 = arith.andi %2143, %2144 : i1
      %2146 = scf.if %2145 -> (i64) {
        scf.yield %2091 : i64
      } else {
        scf.yield %2141 : i64
      }
      %2147 = func.call @cc_errorp(%2102) : (i64) -> i64
      %2148 = arith.cmpi ne, %2147, %2126 : i64
      %2149 = arith.cmpi eq, %2146, %2126 : i64
      %2150 = arith.andi %2148, %2149 : i1
      %2151 = scf.if %2150 -> (i64) {
        scf.yield %2102 : i64
      } else {
        scf.yield %2146 : i64
      }
      %2152 = func.call @cc_errorp(%2113) : (i64) -> i64
      %2153 = arith.cmpi ne, %2152, %2126 : i64
      %2154 = arith.cmpi eq, %2151, %2126 : i64
      %2155 = arith.andi %2153, %2154 : i1
      %2156 = scf.if %2155 -> (i64) {
        scf.yield %2113 : i64
      } else {
        scf.yield %2151 : i64
      }
      %2157 = func.call @cc_errorp(%2124) : (i64) -> i64
      %2158 = arith.cmpi ne, %2157, %2126 : i64
      %2159 = arith.cmpi eq, %2156, %2126 : i64
      %2160 = arith.andi %2158, %2159 : i1
      %2161 = scf.if %2160 -> (i64) {
        scf.yield %2124 : i64
      } else {
        scf.yield %2156 : i64
      }
      %2162 = func.call @cc_errorp(%2125) : (i64) -> i64
      %2163 = arith.cmpi ne, %2162, %2126 : i64
      %2164 = arith.cmpi eq, %2161, %2126 : i64
      %2165 = arith.andi %2163, %2164 : i1
      %2166 = scf.if %2165 -> (i64) {
        scf.yield %2125 : i64
      } else {
        scf.yield %2161 : i64
      }
      %2167 = arith.cmpi ne, %2166, %2126 : i64
      scf.if %2167 {
        func.call @stack_push_pointer(%2166) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1984) : (i64) -> ()
        func.call @stack_push_pointer(%2069) : (i64) -> ()
        func.call @stack_push_pointer(%2080) : (i64) -> ()
        func.call @stack_push_pointer(%2091) : (i64) -> ()
        func.call @stack_push_pointer(%2102) : (i64) -> ()
        func.call @stack_push_pointer(%2113) : (i64) -> ()
        func.call @stack_push_pointer(%2124) : (i64) -> ()
        func.call @stack_push_pointer(%2125) : (i64) -> ()
        %2168 = llvm.mlir.addressof @str222 : !llvm.ptr
        %2169 = func.call @cc_make_function_ref_const(%2168) : (!llvm.ptr) -> i64
        %2170 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2169, %2170) : (i64, i64) -> ()
      }
      %2171 = func.call @stack_pop_pointer() : () -> i64
      %2172 = func.call @cc_multiple_value_list(%2171) : (i64) -> i64
      %2173 = arith.constant 0 : i64
      %2174 = func.call @cc_box_fixnum(%2173) : (i64) -> i64
      %2175 = func.call @cc_nth(%2174, %2172) : (i64, i64) -> i64
      %2176 = arith.constant 1 : i64
      %2177 = func.call @cc_box_fixnum(%2176) : (i64) -> i64
      %2178 = func.call @cc_nth(%2177, %2172) : (i64, i64) -> i64
      %2179 = arith.constant 2 : i64
      %2180 = func.call @cc_box_fixnum(%2179) : (i64) -> i64
      %2181 = func.call @cc_nth(%2180, %2172) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2182 = func.call @stack_depth() : () -> i64
      %2183 = arith.constant 0 : i64
      %2184 = arith.cmpi sgt, %2182, %2183 : i64
      scf.if %2184 {
        %2185 = func.call @stack_pop_pointer() : () -> i64
      }
      %2186 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2187 = func.call @cc_make_function_ref_const(%2186) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2187) : (i64) -> ()
      %2188 = func.call @stack_pop_pointer() : () -> i64
      %2189 = func.call @cc_nil_value() : () -> i64
      %2190 = arith.constant 1 : i1
      %2191 = arith.constant 0 : i1
      %2192 = arith.constant 1 : i1
      %2193:2 = scf.if %2190 -> (i64, i1) {
        %2194 = func.call @cc_nil_value() : () -> i64
        %2195 = func.call @cc_nil_value() : () -> i64
        %2196 = func.call @cc_errorp(%2194) : (i64) -> i64
        %2197 = arith.cmpi ne, %2196, %2195 : i64
        %2198 = scf.if %2197 -> (i64) {
          scf.yield %2194 : i64
        } else {
          func.call @stack_push_pointer(%2181) : (i64) -> ()
          %2199 = func.call @stack_pop_pointer() : () -> i64
          %2200 = func.call @cc_nil_value() : () -> i64
          %2201 = func.call @cc_errorp(%2199) : (i64) -> i64
          %2202 = arith.cmpi ne, %2201, %2200 : i64
          %2203 = arith.cmpi eq, %2200, %2200 : i64
          %2204 = arith.andi %2202, %2203 : i1
          %2205 = scf.if %2204 -> (i64) {
            scf.yield %2199 : i64
          } else {
            scf.yield %2200 : i64
          }
          %2206 = arith.cmpi ne, %2205, %2200 : i64
          scf.if %2206 {
            func.call @stack_push_pointer(%2205) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2199) : (i64) -> ()
            %2207 = llvm.mlir.addressof @str224 : !llvm.ptr
            %2208 = func.call @cc_make_function_ref_const(%2207) : (!llvm.ptr) -> i64
            %2209 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2208, %2209) : (i64, i64) -> ()
          }
          %2210 = func.call @stack_pop_pointer() : () -> i64
          %2211 = func.call @cc_nil_value() : () -> i64
          %2212 = func.call @cc_nil_value() : () -> i64
          %2213 = func.call @cc_errorp(%2211) : (i64) -> i64
          %2214 = arith.cmpi ne, %2213, %2212 : i64
          %2215 = scf.if %2214 -> (i64) {
            scf.yield %2211 : i64
          } else {
            func.call @stack_push_pointer(%2175) : (i64) -> ()
            %2216 = func.call @stack_pop_pointer() : () -> i64
            %2217 = func.call @cc_nil_value() : () -> i64
            %2218 = func.call @cc_errorp(%2216) : (i64) -> i64
            %2219 = arith.cmpi ne, %2218, %2217 : i64
            %2220 = arith.cmpi eq, %2217, %2217 : i64
            %2221 = arith.andi %2219, %2220 : i1
            %2222 = scf.if %2221 -> (i64) {
              scf.yield %2216 : i64
            } else {
              scf.yield %2217 : i64
            }
            %2223 = arith.cmpi ne, %2222, %2217 : i64
            scf.if %2223 {
              func.call @stack_push_pointer(%2222) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2216) : (i64) -> ()
              %2224 = llvm.mlir.addressof @str225 : !llvm.ptr
              %2225 = func.call @cc_make_function_ref_const(%2224) : (!llvm.ptr) -> i64
              %2226 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2225, %2226) : (i64, i64) -> ()
            }
            %2227 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2210) : (i64) -> ()
            %2228 = func.call @stack_pop_pointer() : () -> i64
            %2229 = func.call @cc_nil_value() : () -> i64
            %2230 = func.call @cc_errorp(%2228) : (i64) -> i64
            %2231 = arith.cmpi ne, %2230, %2229 : i64
            %2232 = arith.cmpi eq, %2229, %2229 : i64
            %2233 = arith.andi %2231, %2232 : i1
            %2234 = scf.if %2233 -> (i64) {
              scf.yield %2228 : i64
            } else {
              scf.yield %2229 : i64
            }
            %2235 = arith.cmpi ne, %2234, %2229 : i64
            scf.if %2235 {
              func.call @stack_push_pointer(%2234) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2228) : (i64) -> ()
              %2236 = llvm.mlir.addressof @str226 : !llvm.ptr
              %2237 = func.call @cc_make_function_ref_const(%2236) : (!llvm.ptr) -> i64
              %2238 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2237, %2238) : (i64, i64) -> ()
            }
            %2239 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %2240 = func.call @stack_pop_pointer() : () -> i64
            %2241 = func.call @cc_cons(%2239, %2240) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2241) : (i64) -> ()
            %2242 = func.call @stack_pop_pointer() : () -> i64
            %2243 = func.call @cc_cons(%2227, %2242) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2243) : (i64) -> ()
            %2244 = func.call @stack_pop_pointer() : () -> i64
            %2245 = func.call @cc_values_pack(%2244) : (i64) -> i64
            func.call @stack_push_pointer(%2245) : (i64) -> ()
            %2246 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2246 : i64
          }
          func.call @stack_push_pointer(%2215) : (i64) -> ()
          %2247 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2247 : i64
        }
        func.call @stack_push_pointer(%2198) : (i64) -> ()
        %2248 = func.call @stack_pop_pointer() : () -> i64
        %2249 = func.call @cc_multiple_value_list(%2248) : (i64) -> i64
        %2250 = func.call @cc_nil_value() : () -> i64
        %2251 = llvm.mlir.addressof @str227 : !llvm.ptr
        %2252 = arith.constant 38 : i64
        %2253 = func.call @cc_make_string(%2251, %2252) : (!llvm.ptr, i64) -> i64
        %2254 = func.call @cc_nil_value() : () -> i64
        %2255 = func.call @cc_intern(%2253, %2254) : (i64, i64) -> i64
        %2256 = func.call @cc_nil_value() : () -> i64
        %2257 = func.call @cc_cons(%2255, %2256) : (i64, i64) -> i64
        %2258 = func.call @cc_values_pack(%2257) : (i64) -> i64
        %2259 = func.call @cc_symbol_value(%2255) : (i64) -> i64
        %2260 = arith.cmpi ne, %2259, %2250 : i64
        %2261:2 = scf.if %2260 -> (i64, i1) {
          %2262 = func.call @cc_values_pack(%2249) : (i64) -> i64
          func.call @stack_push_pointer(%2262) : (i64) -> ()
          scf.yield %2189, %2191 : i64, i1
        } else {
          %2263 = func.call @cc_append(%2189, %2249) : (i64, i64) -> i64
          scf.yield %2263, %2192 : i64, i1
        }
        scf.yield %2261#0, %2261#1 : i64, i1
      } else {
        scf.yield %2189, %2191 : i64, i1
      }
      %2264:2 = scf.if %2193#1 -> (i64, i1) {
        func.call @stack_push_pointer(%2181) : (i64) -> ()
        %2265 = func.call @stack_pop_pointer() : () -> i64
        %2266 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%2266) : (i64) -> ()
        %2267 = func.call @stack_pop_pointer() : () -> i64
        %2268 = func.call @cc_nil_value() : () -> i64
        %2269 = func.call @cc_errorp(%2265) : (i64) -> i64
        %2270 = arith.cmpi ne, %2269, %2268 : i64
        %2271 = arith.cmpi eq, %2268, %2268 : i64
        %2272 = arith.andi %2270, %2271 : i1
        %2273 = scf.if %2272 -> (i64) {
          scf.yield %2265 : i64
        } else {
          scf.yield %2268 : i64
        }
        %2274 = func.call @cc_errorp(%2267) : (i64) -> i64
        %2275 = arith.cmpi ne, %2274, %2268 : i64
        %2276 = arith.cmpi eq, %2273, %2268 : i64
        %2277 = arith.andi %2275, %2276 : i1
        %2278 = scf.if %2277 -> (i64) {
          scf.yield %2267 : i64
        } else {
          scf.yield %2273 : i64
        }
        %2279 = arith.cmpi ne, %2278, %2268 : i64
        scf.if %2279 {
          func.call @stack_push_pointer(%2278) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2265) : (i64) -> ()
          func.call @stack_push_pointer(%2267) : (i64) -> ()
          %2280 = llvm.mlir.addressof @str228 : !llvm.ptr
          %2281 = func.call @cc_make_function_ref_const(%2280) : (!llvm.ptr) -> i64
          %2282 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2281, %2282) : (i64, i64) -> ()
        }
        %2283 = func.call @stack_pop_pointer() : () -> i64
        %2284 = func.call @cc_multiple_value_list(%2283) : (i64) -> i64
        %2285 = func.call @cc_nil_value() : () -> i64
        %2286 = llvm.mlir.addressof @str229 : !llvm.ptr
        %2287 = arith.constant 38 : i64
        %2288 = func.call @cc_make_string(%2286, %2287) : (!llvm.ptr, i64) -> i64
        %2289 = func.call @cc_nil_value() : () -> i64
        %2290 = func.call @cc_intern(%2288, %2289) : (i64, i64) -> i64
        %2291 = func.call @cc_nil_value() : () -> i64
        %2292 = func.call @cc_cons(%2290, %2291) : (i64, i64) -> i64
        %2293 = func.call @cc_values_pack(%2292) : (i64) -> i64
        %2294 = func.call @cc_symbol_value(%2290) : (i64) -> i64
        %2295 = arith.cmpi ne, %2294, %2285 : i64
        %2296:2 = scf.if %2295 -> (i64, i1) {
          %2297 = func.call @cc_values_pack(%2284) : (i64) -> i64
          func.call @stack_push_pointer(%2297) : (i64) -> ()
          scf.yield %2193#0, %2191 : i64, i1
        } else {
          %2298 = func.call @cc_append(%2193#0, %2284) : (i64, i64) -> i64
          scf.yield %2298, %2192 : i64, i1
        }
        scf.yield %2296#0, %2296#1 : i64, i1
      } else {
        scf.yield %2193#0, %2191 : i64, i1
      }
      scf.if %2264#1 {
        %2299 = func.call @cc_apply(%2188, %2264#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2299) : (i64) -> ()
      } else {
      }
      %2300 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2300 : i64
    }
    func.call @stack_push_pointer(%1972) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044364"() {
    %2493 = func.call @stack_pop_pointer() : () -> i64
    %2494 = func.call @cc_nil_value() : () -> i64
    %2495 = func.call @cc_nil_value() : () -> i64
    %2496 = func.call @cc_errorp(%2494) : (i64) -> i64
    %2497 = arith.cmpi ne, %2496, %2495 : i64
    %2498 = scf.if %2497 -> (i64) {
      scf.yield %2494 : i64
    } else {
      %2499 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2500 = arith.constant 8 : i64
      %2501 = func.call @cc_make_string(%2499, %2500) : (!llvm.ptr, i64) -> i64
      %2502 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2503 = arith.constant 11 : i64
      %2504 = func.call @cc_make_string(%2502, %2503) : (!llvm.ptr, i64) -> i64
      %2505 = func.call @cc_intern(%2501, %2504) : (i64, i64) -> i64
      %2506 = func.call @cc_nil_value() : () -> i64
      %2507 = func.call @cc_cons(%2505, %2506) : (i64, i64) -> i64
      %2508 = func.call @cc_values_pack(%2507) : (i64) -> i64
      %2509 = func.call @cc_symbol_value(%2505) : (i64) -> i64
      func.call @stack_push_pointer(%2509) : (i64) -> ()
      %2510 = func.call @stack_pop_pointer() : () -> i64
      %2511 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2512 = arith.constant 6 : i64
      %2513 = func.call @cc_make_string(%2511, %2512) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2513) : (i64) -> ()
      %2514 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2515 = arith.constant 6 : i64
      %2516 = func.call @cc_make_string(%2514, %2515) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2516) : (i64) -> ()
      %2517 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2518 = arith.constant 9 : i64
      %2519 = func.call @cc_make_string(%2517, %2518) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2519) : (i64) -> ()
      %2520 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2521 = arith.constant 17 : i64
      %2522 = func.call @cc_make_string(%2520, %2521) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2522) : (i64) -> ()
      %2523 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2524 = arith.constant 6 : i64
      %2525 = func.call @cc_make_string(%2523, %2524) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2525) : (i64) -> ()
      %2526 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2527 = arith.constant 31 : i64
      %2528 = func.call @cc_make_string(%2526, %2527) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2528) : (i64) -> ()
      %2529 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2530 = arith.constant 6 : i64
      %2531 = func.call @cc_make_string(%2529, %2530) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2531) : (i64) -> ()
      %2532 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2533 = arith.constant 25 : i64
      %2534 = func.call @cc_make_string(%2532, %2533) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2534) : (i64) -> ()
      %2535 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2536 = arith.constant 6 : i64
      %2537 = func.call @cc_make_string(%2535, %2536) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2537) : (i64) -> ()
      %2538 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2539 = arith.constant 60 : i64
      %2540 = func.call @cc_make_string(%2538, %2539) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2540) : (i64) -> ()
      %2541 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2542 = arith.constant 6 : i64
      %2543 = func.call @cc_make_string(%2541, %2542) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2543) : (i64) -> ()
      %2544 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2545 = arith.constant 8 : i64
      %2546 = func.call @cc_make_string(%2544, %2545) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2546) : (i64) -> ()
      %2547 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2548 = arith.constant 6 : i64
      %2549 = func.call @cc_make_string(%2547, %2548) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2549) : (i64) -> ()
      %2550 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2551 = arith.constant 2 : i64
      %2552 = func.call @cc_make_string(%2550, %2551) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2553 = func.call @stack_pop_pointer() : () -> i64
      %2554 = func.call @stack_pop_pointer() : () -> i64
      %2555 = func.call @cc_cons(%2554, %2553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2555) : (i64) -> ()
      %2556 = func.call @stack_pop_pointer() : () -> i64
      %2557 = func.call @stack_pop_pointer() : () -> i64
      %2558 = func.call @cc_cons(%2557, %2556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2558) : (i64) -> ()
      %2559 = func.call @stack_pop_pointer() : () -> i64
      %2560 = func.call @stack_pop_pointer() : () -> i64
      %2561 = func.call @cc_cons(%2560, %2559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2561) : (i64) -> ()
      %2562 = func.call @stack_pop_pointer() : () -> i64
      %2563 = func.call @stack_pop_pointer() : () -> i64
      %2564 = func.call @cc_cons(%2563, %2562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2564) : (i64) -> ()
      %2565 = func.call @stack_pop_pointer() : () -> i64
      %2566 = func.call @stack_pop_pointer() : () -> i64
      %2567 = func.call @cc_cons(%2566, %2565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2567) : (i64) -> ()
      %2568 = func.call @stack_pop_pointer() : () -> i64
      %2569 = func.call @stack_pop_pointer() : () -> i64
      %2570 = func.call @cc_cons(%2569, %2568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2570) : (i64) -> ()
      %2571 = func.call @stack_pop_pointer() : () -> i64
      %2572 = func.call @stack_pop_pointer() : () -> i64
      %2573 = func.call @cc_cons(%2572, %2571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2573) : (i64) -> ()
      %2574 = func.call @stack_pop_pointer() : () -> i64
      %2575 = func.call @stack_pop_pointer() : () -> i64
      %2576 = func.call @cc_cons(%2575, %2574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2576) : (i64) -> ()
      %2577 = func.call @stack_pop_pointer() : () -> i64
      %2578 = func.call @stack_pop_pointer() : () -> i64
      %2579 = func.call @cc_cons(%2578, %2577) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2579) : (i64) -> ()
      %2580 = func.call @stack_pop_pointer() : () -> i64
      %2581 = func.call @stack_pop_pointer() : () -> i64
      %2582 = func.call @cc_cons(%2581, %2580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2582) : (i64) -> ()
      %2583 = func.call @stack_pop_pointer() : () -> i64
      %2584 = func.call @stack_pop_pointer() : () -> i64
      %2585 = func.call @cc_cons(%2584, %2583) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2585) : (i64) -> ()
      %2586 = func.call @stack_pop_pointer() : () -> i64
      %2587 = func.call @stack_pop_pointer() : () -> i64
      %2588 = func.call @cc_cons(%2587, %2586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2588) : (i64) -> ()
      %2589 = func.call @stack_pop_pointer() : () -> i64
      %2590 = func.call @stack_pop_pointer() : () -> i64
      %2591 = func.call @cc_cons(%2590, %2589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2591) : (i64) -> ()
      %2592 = func.call @stack_pop_pointer() : () -> i64
      %2593 = func.call @stack_pop_pointer() : () -> i64
      %2594 = func.call @cc_cons(%2593, %2592) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2594) : (i64) -> ()
      %2595 = func.call @stack_pop_pointer() : () -> i64
      %2596 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2597 = arith.constant 4 : i64
      %2598 = func.call @cc_make_string(%2596, %2597) : (!llvm.ptr, i64) -> i64
      %2599 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2600 = arith.constant 7 : i64
      %2601 = func.call @cc_make_string(%2599, %2600) : (!llvm.ptr, i64) -> i64
      %2602 = func.call @cc_intern(%2598, %2601) : (i64, i64) -> i64
      %2603 = func.call @cc_nil_value() : () -> i64
      %2604 = func.call @cc_cons(%2602, %2603) : (i64, i64) -> i64
      %2605 = func.call @cc_values_pack(%2604) : (i64) -> i64
      func.call @stack_push_pointer(%2602) : (i64) -> ()
      %2606 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = func.call @cc_nil_value() : () -> i64
      %2609 = func.call @cc_errorp(%2510) : (i64) -> i64
      %2610 = arith.cmpi ne, %2609, %2608 : i64
      %2611 = arith.cmpi eq, %2608, %2608 : i64
      %2612 = arith.andi %2610, %2611 : i1
      %2613 = scf.if %2612 -> (i64) {
        scf.yield %2510 : i64
      } else {
        scf.yield %2608 : i64
      }
      %2614 = func.call @cc_errorp(%2595) : (i64) -> i64
      %2615 = arith.cmpi ne, %2614, %2608 : i64
      %2616 = arith.cmpi eq, %2613, %2608 : i64
      %2617 = arith.andi %2615, %2616 : i1
      %2618 = scf.if %2617 -> (i64) {
        scf.yield %2595 : i64
      } else {
        scf.yield %2613 : i64
      }
      %2619 = func.call @cc_errorp(%2606) : (i64) -> i64
      %2620 = arith.cmpi ne, %2619, %2608 : i64
      %2621 = arith.cmpi eq, %2618, %2608 : i64
      %2622 = arith.andi %2620, %2621 : i1
      %2623 = scf.if %2622 -> (i64) {
        scf.yield %2606 : i64
      } else {
        scf.yield %2618 : i64
      }
      %2624 = func.call @cc_errorp(%2607) : (i64) -> i64
      %2625 = arith.cmpi ne, %2624, %2608 : i64
      %2626 = arith.cmpi eq, %2623, %2608 : i64
      %2627 = arith.andi %2625, %2626 : i1
      %2628 = scf.if %2627 -> (i64) {
        scf.yield %2607 : i64
      } else {
        scf.yield %2623 : i64
      }
      %2629 = arith.cmpi ne, %2628, %2608 : i64
      scf.if %2629 {
        func.call @stack_push_pointer(%2628) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2510) : (i64) -> ()
        func.call @stack_push_pointer(%2595) : (i64) -> ()
        func.call @stack_push_pointer(%2606) : (i64) -> ()
        func.call @stack_push_pointer(%2607) : (i64) -> ()
        %2630 = llvm.mlir.addressof @str266 : !llvm.ptr
        %2631 = func.call @cc_make_function_ref_const(%2630) : (!llvm.ptr) -> i64
        %2632 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%2631, %2632) : (i64, i64) -> ()
      }
      %2633 = func.call @stack_pop_pointer() : () -> i64
      %2634 = func.call @cc_multiple_value_list(%2633) : (i64) -> i64
      %2635 = arith.constant 0 : i64
      %2636 = func.call @cc_box_fixnum(%2635) : (i64) -> i64
      %2637 = func.call @cc_nth(%2636, %2634) : (i64, i64) -> i64
      %2638 = arith.constant 1 : i64
      %2639 = func.call @cc_box_fixnum(%2638) : (i64) -> i64
      %2640 = func.call @cc_nth(%2639, %2634) : (i64, i64) -> i64
      %2641 = arith.constant 2 : i64
      %2642 = func.call @cc_box_fixnum(%2641) : (i64) -> i64
      %2643 = func.call @cc_nth(%2642, %2634) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2644 = func.call @stack_depth() : () -> i64
      %2645 = arith.constant 0 : i64
      %2646 = arith.cmpi sgt, %2644, %2645 : i64
      scf.if %2646 {
        %2647 = func.call @stack_pop_pointer() : () -> i64
      }
      %2648 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2649 = func.call @cc_make_function_ref_const(%2648) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%2649) : (i64) -> ()
      %2650 = func.call @stack_pop_pointer() : () -> i64
      %2651 = func.call @cc_nil_value() : () -> i64
      %2652 = arith.constant 1 : i1
      %2653 = arith.constant 0 : i1
      %2654 = arith.constant 1 : i1
      %2655:2 = scf.if %2652 -> (i64, i1) {
        %2656 = func.call @cc_nil_value() : () -> i64
        %2657 = func.call @cc_nil_value() : () -> i64
        %2658 = func.call @cc_errorp(%2656) : (i64) -> i64
        %2659 = arith.cmpi ne, %2658, %2657 : i64
        %2660 = scf.if %2659 -> (i64) {
          scf.yield %2656 : i64
        } else {
          func.call @stack_push_pointer(%2637) : (i64) -> ()
          %2661 = func.call @stack_pop_pointer() : () -> i64
          %2662 = llvm.mlir.addressof @str268 : !llvm.ptr
          %2663 = arith.constant 4 : i64
          %2664 = func.call @cc_make_string(%2662, %2663) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%2664) : (i64) -> ()
          %2665 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2661) : (i64) -> ()
          func.call @stack_push_pointer(%2665) : (i64) -> ()
          %2666 = llvm.mlir.addressof @str269 : !llvm.ptr
          %2667 = func.call @cc_make_function_ref_const(%2666) : (!llvm.ptr) -> i64
          %2668 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2667, %2668) : (i64, i64) -> ()
          %2669 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2669 : i64
        }
        func.call @stack_push_pointer(%2660) : (i64) -> ()
        %2670 = func.call @stack_pop_pointer() : () -> i64
        %2671 = func.call @cc_multiple_value_list(%2670) : (i64) -> i64
        %2672 = func.call @cc_nil_value() : () -> i64
        %2673 = llvm.mlir.addressof @str270 : !llvm.ptr
        %2674 = arith.constant 38 : i64
        %2675 = func.call @cc_make_string(%2673, %2674) : (!llvm.ptr, i64) -> i64
        %2676 = func.call @cc_nil_value() : () -> i64
        %2677 = func.call @cc_intern(%2675, %2676) : (i64, i64) -> i64
        %2678 = func.call @cc_nil_value() : () -> i64
        %2679 = func.call @cc_cons(%2677, %2678) : (i64, i64) -> i64
        %2680 = func.call @cc_values_pack(%2679) : (i64) -> i64
        %2681 = func.call @cc_symbol_value(%2677) : (i64) -> i64
        %2682 = arith.cmpi ne, %2681, %2672 : i64
        %2683:2 = scf.if %2682 -> (i64, i1) {
          %2684 = func.call @cc_values_pack(%2671) : (i64) -> i64
          func.call @stack_push_pointer(%2684) : (i64) -> ()
          scf.yield %2651, %2653 : i64, i1
        } else {
          %2685 = func.call @cc_append(%2651, %2671) : (i64, i64) -> i64
          scf.yield %2685, %2654 : i64, i1
        }
        scf.yield %2683#0, %2683#1 : i64, i1
      } else {
        scf.yield %2651, %2653 : i64, i1
      }
      %2686:2 = scf.if %2655#1 -> (i64, i1) {
        func.call @stack_push_pointer(%2643) : (i64) -> ()
        %2687 = func.call @stack_pop_pointer() : () -> i64
        %2688 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%2688) : (i64) -> ()
        %2689 = func.call @stack_pop_pointer() : () -> i64
        %2690 = func.call @cc_nil_value() : () -> i64
        %2691 = func.call @cc_errorp(%2687) : (i64) -> i64
        %2692 = arith.cmpi ne, %2691, %2690 : i64
        %2693 = arith.cmpi eq, %2690, %2690 : i64
        %2694 = arith.andi %2692, %2693 : i1
        %2695 = scf.if %2694 -> (i64) {
          scf.yield %2687 : i64
        } else {
          scf.yield %2690 : i64
        }
        %2696 = func.call @cc_errorp(%2689) : (i64) -> i64
        %2697 = arith.cmpi ne, %2696, %2690 : i64
        %2698 = arith.cmpi eq, %2695, %2690 : i64
        %2699 = arith.andi %2697, %2698 : i1
        %2700 = scf.if %2699 -> (i64) {
          scf.yield %2689 : i64
        } else {
          scf.yield %2695 : i64
        }
        %2701 = arith.cmpi ne, %2700, %2690 : i64
        scf.if %2701 {
          func.call @stack_push_pointer(%2700) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2687) : (i64) -> ()
          func.call @stack_push_pointer(%2689) : (i64) -> ()
          %2702 = llvm.mlir.addressof @str271 : !llvm.ptr
          %2703 = func.call @cc_make_function_ref_const(%2702) : (!llvm.ptr) -> i64
          %2704 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2703, %2704) : (i64, i64) -> ()
        }
        %2705 = func.call @stack_pop_pointer() : () -> i64
        %2706 = func.call @cc_multiple_value_list(%2705) : (i64) -> i64
        %2707 = func.call @cc_nil_value() : () -> i64
        %2708 = llvm.mlir.addressof @str272 : !llvm.ptr
        %2709 = arith.constant 38 : i64
        %2710 = func.call @cc_make_string(%2708, %2709) : (!llvm.ptr, i64) -> i64
        %2711 = func.call @cc_nil_value() : () -> i64
        %2712 = func.call @cc_intern(%2710, %2711) : (i64, i64) -> i64
        %2713 = func.call @cc_nil_value() : () -> i64
        %2714 = func.call @cc_cons(%2712, %2713) : (i64, i64) -> i64
        %2715 = func.call @cc_values_pack(%2714) : (i64) -> i64
        %2716 = func.call @cc_symbol_value(%2712) : (i64) -> i64
        %2717 = arith.cmpi ne, %2716, %2707 : i64
        %2718:2 = scf.if %2717 -> (i64, i1) {
          %2719 = func.call @cc_values_pack(%2706) : (i64) -> i64
          func.call @stack_push_pointer(%2719) : (i64) -> ()
          scf.yield %2655#0, %2653 : i64, i1
        } else {
          %2720 = func.call @cc_append(%2655#0, %2706) : (i64, i64) -> i64
          scf.yield %2720, %2654 : i64, i1
        }
        scf.yield %2718#0, %2718#1 : i64, i1
      } else {
        scf.yield %2655#0, %2653 : i64, i1
      }
      scf.if %2686#1 {
        %2721 = func.call @cc_apply(%2650, %2686#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2721) : (i64) -> ()
      } else {
      }
      %2722 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2722 : i64
    }
    func.call @stack_push_pointer(%2498) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044366"() {
    %2888 = func.call @stack_pop_pointer() : () -> i64
    %2889 = func.call @cc_nil_value() : () -> i64
    %2890 = func.call @cc_nil_value() : () -> i64
    %2891 = func.call @cc_errorp(%2889) : (i64) -> i64
    %2892 = arith.cmpi ne, %2891, %2890 : i64
    %2893 = scf.if %2892 -> (i64) {
      scf.yield %2889 : i64
    } else {
      %2894 = llvm.mlir.addressof @str287 : !llvm.ptr
      %2895 = arith.constant 8 : i64
      %2896 = func.call @cc_make_string(%2894, %2895) : (!llvm.ptr, i64) -> i64
      %2897 = llvm.mlir.addressof @str288 : !llvm.ptr
      %2898 = arith.constant 11 : i64
      %2899 = func.call @cc_make_string(%2897, %2898) : (!llvm.ptr, i64) -> i64
      %2900 = func.call @cc_intern(%2896, %2899) : (i64, i64) -> i64
      %2901 = func.call @cc_nil_value() : () -> i64
      %2902 = func.call @cc_cons(%2900, %2901) : (i64, i64) -> i64
      %2903 = func.call @cc_values_pack(%2902) : (i64) -> i64
      %2904 = func.call @cc_symbol_value(%2900) : (i64) -> i64
      func.call @stack_push_pointer(%2904) : (i64) -> ()
      %2905 = func.call @stack_pop_pointer() : () -> i64
      %2906 = llvm.mlir.addressof @str289 : !llvm.ptr
      %2907 = arith.constant 6 : i64
      %2908 = func.call @cc_make_string(%2906, %2907) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2908) : (i64) -> ()
      %2909 = llvm.mlir.addressof @str290 : !llvm.ptr
      %2910 = arith.constant 6 : i64
      %2911 = func.call @cc_make_string(%2909, %2910) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2911) : (i64) -> ()
      %2912 = llvm.mlir.addressof @str291 : !llvm.ptr
      %2913 = arith.constant 9 : i64
      %2914 = func.call @cc_make_string(%2912, %2913) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2914) : (i64) -> ()
      %2915 = llvm.mlir.addressof @str292 : !llvm.ptr
      %2916 = arith.constant 17 : i64
      %2917 = func.call @cc_make_string(%2915, %2916) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2917) : (i64) -> ()
      %2918 = llvm.mlir.addressof @str293 : !llvm.ptr
      %2919 = arith.constant 6 : i64
      %2920 = func.call @cc_make_string(%2918, %2919) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2920) : (i64) -> ()
      %2921 = llvm.mlir.addressof @str294 : !llvm.ptr
      %2922 = arith.constant 31 : i64
      %2923 = func.call @cc_make_string(%2921, %2922) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2923) : (i64) -> ()
      %2924 = llvm.mlir.addressof @str295 : !llvm.ptr
      %2925 = arith.constant 6 : i64
      %2926 = func.call @cc_make_string(%2924, %2925) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2926) : (i64) -> ()
      %2927 = llvm.mlir.addressof @str296 : !llvm.ptr
      %2928 = arith.constant 25 : i64
      %2929 = func.call @cc_make_string(%2927, %2928) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2929) : (i64) -> ()
      %2930 = llvm.mlir.addressof @str297 : !llvm.ptr
      %2931 = arith.constant 6 : i64
      %2932 = func.call @cc_make_string(%2930, %2931) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2932) : (i64) -> ()
      %2933 = llvm.mlir.addressof @str298 : !llvm.ptr
      %2934 = arith.constant 60 : i64
      %2935 = func.call @cc_make_string(%2933, %2934) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2935) : (i64) -> ()
      %2936 = llvm.mlir.addressof @str299 : !llvm.ptr
      %2937 = arith.constant 6 : i64
      %2938 = func.call @cc_make_string(%2936, %2937) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2938) : (i64) -> ()
      %2939 = llvm.mlir.addressof @str300 : !llvm.ptr
      %2940 = arith.constant 8 : i64
      %2941 = func.call @cc_make_string(%2939, %2940) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2941) : (i64) -> ()
      %2942 = llvm.mlir.addressof @str301 : !llvm.ptr
      %2943 = arith.constant 6 : i64
      %2944 = func.call @cc_make_string(%2942, %2943) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2944) : (i64) -> ()
      %2945 = llvm.mlir.addressof @str302 : !llvm.ptr
      %2946 = arith.constant 2 : i64
      %2947 = func.call @cc_make_string(%2945, %2946) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2947) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2948 = func.call @stack_pop_pointer() : () -> i64
      %2949 = func.call @stack_pop_pointer() : () -> i64
      %2950 = func.call @cc_cons(%2949, %2948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2950) : (i64) -> ()
      %2951 = func.call @stack_pop_pointer() : () -> i64
      %2952 = func.call @stack_pop_pointer() : () -> i64
      %2953 = func.call @cc_cons(%2952, %2951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2953) : (i64) -> ()
      %2954 = func.call @stack_pop_pointer() : () -> i64
      %2955 = func.call @stack_pop_pointer() : () -> i64
      %2956 = func.call @cc_cons(%2955, %2954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2956) : (i64) -> ()
      %2957 = func.call @stack_pop_pointer() : () -> i64
      %2958 = func.call @stack_pop_pointer() : () -> i64
      %2959 = func.call @cc_cons(%2958, %2957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2959) : (i64) -> ()
      %2960 = func.call @stack_pop_pointer() : () -> i64
      %2961 = func.call @stack_pop_pointer() : () -> i64
      %2962 = func.call @cc_cons(%2961, %2960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2962) : (i64) -> ()
      %2963 = func.call @stack_pop_pointer() : () -> i64
      %2964 = func.call @stack_pop_pointer() : () -> i64
      %2965 = func.call @cc_cons(%2964, %2963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2965) : (i64) -> ()
      %2966 = func.call @stack_pop_pointer() : () -> i64
      %2967 = func.call @stack_pop_pointer() : () -> i64
      %2968 = func.call @cc_cons(%2967, %2966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2968) : (i64) -> ()
      %2969 = func.call @stack_pop_pointer() : () -> i64
      %2970 = func.call @stack_pop_pointer() : () -> i64
      %2971 = func.call @cc_cons(%2970, %2969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2971) : (i64) -> ()
      %2972 = func.call @stack_pop_pointer() : () -> i64
      %2973 = func.call @stack_pop_pointer() : () -> i64
      %2974 = func.call @cc_cons(%2973, %2972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2974) : (i64) -> ()
      %2975 = func.call @stack_pop_pointer() : () -> i64
      %2976 = func.call @stack_pop_pointer() : () -> i64
      %2977 = func.call @cc_cons(%2976, %2975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2977) : (i64) -> ()
      %2978 = func.call @stack_pop_pointer() : () -> i64
      %2979 = func.call @stack_pop_pointer() : () -> i64
      %2980 = func.call @cc_cons(%2979, %2978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2980) : (i64) -> ()
      %2981 = func.call @stack_pop_pointer() : () -> i64
      %2982 = func.call @stack_pop_pointer() : () -> i64
      %2983 = func.call @cc_cons(%2982, %2981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2983) : (i64) -> ()
      %2984 = func.call @stack_pop_pointer() : () -> i64
      %2985 = func.call @stack_pop_pointer() : () -> i64
      %2986 = func.call @cc_cons(%2985, %2984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2986) : (i64) -> ()
      %2987 = func.call @stack_pop_pointer() : () -> i64
      %2988 = func.call @stack_pop_pointer() : () -> i64
      %2989 = func.call @cc_cons(%2988, %2987) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2989) : (i64) -> ()
      %2990 = func.call @stack_pop_pointer() : () -> i64
      %2991 = llvm.mlir.addressof @str303 : !llvm.ptr
      %2992 = arith.constant 5 : i64
      %2993 = func.call @cc_make_string(%2991, %2992) : (!llvm.ptr, i64) -> i64
      %2994 = llvm.mlir.addressof @str304 : !llvm.ptr
      %2995 = arith.constant 7 : i64
      %2996 = func.call @cc_make_string(%2994, %2995) : (!llvm.ptr, i64) -> i64
      %2997 = func.call @cc_intern(%2993, %2996) : (i64, i64) -> i64
      %2998 = func.call @cc_nil_value() : () -> i64
      %2999 = func.call @cc_cons(%2997, %2998) : (i64, i64) -> i64
      %3000 = func.call @cc_values_pack(%2999) : (i64) -> i64
      func.call @stack_push_pointer(%2997) : (i64) -> ()
      %3001 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3002 = func.call @stack_pop_pointer() : () -> i64
      %3003 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3004 = arith.constant 4 : i64
      %3005 = func.call @cc_make_string(%3003, %3004) : (!llvm.ptr, i64) -> i64
      %3006 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3007 = arith.constant 7 : i64
      %3008 = func.call @cc_make_string(%3006, %3007) : (!llvm.ptr, i64) -> i64
      %3009 = func.call @cc_intern(%3005, %3008) : (i64, i64) -> i64
      %3010 = func.call @cc_nil_value() : () -> i64
      %3011 = func.call @cc_cons(%3009, %3010) : (i64, i64) -> i64
      %3012 = func.call @cc_values_pack(%3011) : (i64) -> i64
      func.call @stack_push_pointer(%3009) : (i64) -> ()
      %3013 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3014 = func.call @stack_pop_pointer() : () -> i64
      %3015 = func.call @cc_nil_value() : () -> i64
      %3016 = func.call @cc_errorp(%2905) : (i64) -> i64
      %3017 = arith.cmpi ne, %3016, %3015 : i64
      %3018 = arith.cmpi eq, %3015, %3015 : i64
      %3019 = arith.andi %3017, %3018 : i1
      %3020 = scf.if %3019 -> (i64) {
        scf.yield %2905 : i64
      } else {
        scf.yield %3015 : i64
      }
      %3021 = func.call @cc_errorp(%2990) : (i64) -> i64
      %3022 = arith.cmpi ne, %3021, %3015 : i64
      %3023 = arith.cmpi eq, %3020, %3015 : i64
      %3024 = arith.andi %3022, %3023 : i1
      %3025 = scf.if %3024 -> (i64) {
        scf.yield %2990 : i64
      } else {
        scf.yield %3020 : i64
      }
      %3026 = func.call @cc_errorp(%3001) : (i64) -> i64
      %3027 = arith.cmpi ne, %3026, %3015 : i64
      %3028 = arith.cmpi eq, %3025, %3015 : i64
      %3029 = arith.andi %3027, %3028 : i1
      %3030 = scf.if %3029 -> (i64) {
        scf.yield %3001 : i64
      } else {
        scf.yield %3025 : i64
      }
      %3031 = func.call @cc_errorp(%3002) : (i64) -> i64
      %3032 = arith.cmpi ne, %3031, %3015 : i64
      %3033 = arith.cmpi eq, %3030, %3015 : i64
      %3034 = arith.andi %3032, %3033 : i1
      %3035 = scf.if %3034 -> (i64) {
        scf.yield %3002 : i64
      } else {
        scf.yield %3030 : i64
      }
      %3036 = func.call @cc_errorp(%3013) : (i64) -> i64
      %3037 = arith.cmpi ne, %3036, %3015 : i64
      %3038 = arith.cmpi eq, %3035, %3015 : i64
      %3039 = arith.andi %3037, %3038 : i1
      %3040 = scf.if %3039 -> (i64) {
        scf.yield %3013 : i64
      } else {
        scf.yield %3035 : i64
      }
      %3041 = func.call @cc_errorp(%3014) : (i64) -> i64
      %3042 = arith.cmpi ne, %3041, %3015 : i64
      %3043 = arith.cmpi eq, %3040, %3015 : i64
      %3044 = arith.andi %3042, %3043 : i1
      %3045 = scf.if %3044 -> (i64) {
        scf.yield %3014 : i64
      } else {
        scf.yield %3040 : i64
      }
      %3046 = arith.cmpi ne, %3045, %3015 : i64
      scf.if %3046 {
        func.call @stack_push_pointer(%3045) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2905) : (i64) -> ()
        func.call @stack_push_pointer(%2990) : (i64) -> ()
        func.call @stack_push_pointer(%3001) : (i64) -> ()
        func.call @stack_push_pointer(%3002) : (i64) -> ()
        func.call @stack_push_pointer(%3013) : (i64) -> ()
        func.call @stack_push_pointer(%3014) : (i64) -> ()
        %3047 = llvm.mlir.addressof @str307 : !llvm.ptr
        %3048 = func.call @cc_make_function_ref_const(%3047) : (!llvm.ptr) -> i64
        %3049 = arith.constant 6 : i64
        func.call @cc_funcall_stack(%3048, %3049) : (i64, i64) -> ()
      }
      %3050 = func.call @stack_pop_pointer() : () -> i64
      %3051 = func.call @cc_multiple_value_list(%3050) : (i64) -> i64
      %3052 = arith.constant 0 : i64
      %3053 = func.call @cc_box_fixnum(%3052) : (i64) -> i64
      %3054 = func.call @cc_nth(%3053, %3051) : (i64, i64) -> i64
      %3055 = arith.constant 1 : i64
      %3056 = func.call @cc_box_fixnum(%3055) : (i64) -> i64
      %3057 = func.call @cc_nth(%3056, %3051) : (i64, i64) -> i64
      %3058 = arith.constant 2 : i64
      %3059 = func.call @cc_box_fixnum(%3058) : (i64) -> i64
      %3060 = func.call @cc_nth(%3059, %3051) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3061 = func.call @stack_depth() : () -> i64
      %3062 = arith.constant 0 : i64
      %3063 = arith.cmpi sgt, %3061, %3062 : i64
      scf.if %3063 {
        %3064 = func.call @stack_pop_pointer() : () -> i64
      }
      %3065 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3066 = func.call @cc_make_function_ref_const(%3065) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3066) : (i64) -> ()
      %3067 = func.call @stack_pop_pointer() : () -> i64
      %3068 = func.call @cc_nil_value() : () -> i64
      %3069 = arith.constant 1 : i1
      %3070 = arith.constant 0 : i1
      %3071 = arith.constant 1 : i1
      %3072:2 = scf.if %3069 -> (i64, i1) {
        func.call @stack_push_nil() : () -> ()
        %3073 = func.call @stack_pop_pointer() : () -> i64
        %3074 = func.call @cc_multiple_value_list(%3073) : (i64) -> i64
        %3075 = func.call @cc_nil_value() : () -> i64
        %3076 = llvm.mlir.addressof @str309 : !llvm.ptr
        %3077 = arith.constant 38 : i64
        %3078 = func.call @cc_make_string(%3076, %3077) : (!llvm.ptr, i64) -> i64
        %3079 = func.call @cc_nil_value() : () -> i64
        %3080 = func.call @cc_intern(%3078, %3079) : (i64, i64) -> i64
        %3081 = func.call @cc_nil_value() : () -> i64
        %3082 = func.call @cc_cons(%3080, %3081) : (i64, i64) -> i64
        %3083 = func.call @cc_values_pack(%3082) : (i64) -> i64
        %3084 = func.call @cc_symbol_value(%3080) : (i64) -> i64
        %3085 = arith.cmpi ne, %3084, %3075 : i64
        %3086:2 = scf.if %3085 -> (i64, i1) {
          %3087 = func.call @cc_values_pack(%3074) : (i64) -> i64
          func.call @stack_push_pointer(%3087) : (i64) -> ()
          scf.yield %3068, %3070 : i64, i1
        } else {
          %3088 = func.call @cc_append(%3068, %3074) : (i64, i64) -> i64
          scf.yield %3088, %3071 : i64, i1
        }
        scf.yield %3086#0, %3086#1 : i64, i1
      } else {
        scf.yield %3068, %3070 : i64, i1
      }
      %3089:2 = scf.if %3072#1 -> (i64, i1) {
        func.call @stack_push_pointer(%3060) : (i64) -> ()
        %3090 = func.call @stack_pop_pointer() : () -> i64
        %3091 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%3091) : (i64) -> ()
        %3092 = func.call @stack_pop_pointer() : () -> i64
        %3093 = func.call @cc_nil_value() : () -> i64
        %3094 = func.call @cc_errorp(%3090) : (i64) -> i64
        %3095 = arith.cmpi ne, %3094, %3093 : i64
        %3096 = arith.cmpi eq, %3093, %3093 : i64
        %3097 = arith.andi %3095, %3096 : i1
        %3098 = scf.if %3097 -> (i64) {
          scf.yield %3090 : i64
        } else {
          scf.yield %3093 : i64
        }
        %3099 = func.call @cc_errorp(%3092) : (i64) -> i64
        %3100 = arith.cmpi ne, %3099, %3093 : i64
        %3101 = arith.cmpi eq, %3098, %3093 : i64
        %3102 = arith.andi %3100, %3101 : i1
        %3103 = scf.if %3102 -> (i64) {
          scf.yield %3092 : i64
        } else {
          scf.yield %3098 : i64
        }
        %3104 = arith.cmpi ne, %3103, %3093 : i64
        scf.if %3104 {
          func.call @stack_push_pointer(%3103) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3090) : (i64) -> ()
          func.call @stack_push_pointer(%3092) : (i64) -> ()
          %3105 = llvm.mlir.addressof @str310 : !llvm.ptr
          %3106 = func.call @cc_make_function_ref_const(%3105) : (!llvm.ptr) -> i64
          %3107 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3106, %3107) : (i64, i64) -> ()
        }
        %3108 = func.call @stack_pop_pointer() : () -> i64
        %3109 = func.call @cc_multiple_value_list(%3108) : (i64) -> i64
        %3110 = func.call @cc_nil_value() : () -> i64
        %3111 = llvm.mlir.addressof @str311 : !llvm.ptr
        %3112 = arith.constant 38 : i64
        %3113 = func.call @cc_make_string(%3111, %3112) : (!llvm.ptr, i64) -> i64
        %3114 = func.call @cc_nil_value() : () -> i64
        %3115 = func.call @cc_intern(%3113, %3114) : (i64, i64) -> i64
        %3116 = func.call @cc_nil_value() : () -> i64
        %3117 = func.call @cc_cons(%3115, %3116) : (i64, i64) -> i64
        %3118 = func.call @cc_values_pack(%3117) : (i64) -> i64
        %3119 = func.call @cc_symbol_value(%3115) : (i64) -> i64
        %3120 = arith.cmpi ne, %3119, %3110 : i64
        %3121:2 = scf.if %3120 -> (i64, i1) {
          %3122 = func.call @cc_values_pack(%3109) : (i64) -> i64
          func.call @stack_push_pointer(%3122) : (i64) -> ()
          scf.yield %3072#0, %3070 : i64, i1
        } else {
          %3123 = func.call @cc_append(%3072#0, %3109) : (i64, i64) -> i64
          scf.yield %3123, %3071 : i64, i1
        }
        scf.yield %3121#0, %3121#1 : i64, i1
      } else {
        scf.yield %3072#0, %3070 : i64, i1
      }
      scf.if %3089#1 {
        %3124 = func.call @cc_apply(%3067, %3089#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3124) : (i64) -> ()
      } else {
      }
      %3125 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3125 : i64
    }
    func.call @stack_push_pointer(%2893) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044368"() {
    %3611 = func.call @stack_pop_pointer() : () -> i64
    %3612 = func.call @cc_nil_value() : () -> i64
    %3613 = func.call @cc_nil_value() : () -> i64
    %3614 = func.call @cc_errorp(%3612) : (i64) -> i64
    %3615 = arith.cmpi ne, %3614, %3613 : i64
    %3616 = scf.if %3615 -> (i64) {
      scf.yield %3612 : i64
    } else {
      %3617 = func.call @cc_nil_value() : () -> i64
      %3618 = llvm.mlir.addressof @str361 : !llvm.ptr
      %3619 = arith.constant 38 : i64
      %3620 = func.call @cc_make_string(%3618, %3619) : (!llvm.ptr, i64) -> i64
      %3621 = func.call @cc_nil_value() : () -> i64
      %3622 = func.call @cc_intern(%3620, %3621) : (i64, i64) -> i64
      %3623 = func.call @cc_nil_value() : () -> i64
      %3624 = func.call @cc_cons(%3622, %3623) : (i64, i64) -> i64
      %3625 = func.call @cc_values_pack(%3624) : (i64) -> i64
      %3626 = func.call @cc_set_symbol_value(%3622, %3617) : (i64, i64) -> i64
      %3627 = llvm.mlir.addressof @str362 : !llvm.ptr
      %3628 = arith.constant 39 : i64
      %3629 = func.call @cc_make_string(%3627, %3628) : (!llvm.ptr, i64) -> i64
      %3630 = func.call @cc_nil_value() : () -> i64
      %3631 = func.call @cc_intern(%3629, %3630) : (i64, i64) -> i64
      %3632 = func.call @cc_nil_value() : () -> i64
      %3633 = func.call @cc_cons(%3631, %3632) : (i64, i64) -> i64
      %3634 = func.call @cc_values_pack(%3633) : (i64) -> i64
      %3635 = func.call @cc_set_symbol_value(%3631, %3617) : (i64, i64) -> i64
      %3636 = llvm.mlir.addressof @str363 : !llvm.ptr
      %3637 = arith.constant 40 : i64
      %3638 = func.call @cc_make_string(%3636, %3637) : (!llvm.ptr, i64) -> i64
      %3639 = func.call @cc_nil_value() : () -> i64
      %3640 = func.call @cc_intern(%3638, %3639) : (i64, i64) -> i64
      %3641 = func.call @cc_nil_value() : () -> i64
      %3642 = func.call @cc_cons(%3640, %3641) : (i64, i64) -> i64
      %3643 = func.call @cc_values_pack(%3642) : (i64) -> i64
      %3644 = func.call @cc_set_symbol_value(%3640, %3617) : (i64, i64) -> i64
      %3645 = func.call @cc_make_string_output_stream() : () -> i64
      %3646 = func.call @cc_make_string_output_stream() : () -> i64
      %3647 = llvm.mlir.addressof @str364 : !llvm.ptr
      %3648 = arith.constant 3 : i64
      %3649 = func.call @cc_make_string(%3647, %3648) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3649) : (i64) -> ()
      %3650 = func.call @stack_pop_pointer() : () -> i64
      %3651 = func.call @cc_make_string_input_stream(%3650) : (i64) -> i64
      %3652 = llvm.mlir.addressof @str365 : !llvm.ptr
      %3653 = arith.constant 8 : i64
      %3654 = func.call @cc_make_string(%3652, %3653) : (!llvm.ptr, i64) -> i64
      %3655 = llvm.mlir.addressof @str366 : !llvm.ptr
      %3656 = arith.constant 11 : i64
      %3657 = func.call @cc_make_string(%3655, %3656) : (!llvm.ptr, i64) -> i64
      %3658 = func.call @cc_intern(%3654, %3657) : (i64, i64) -> i64
      %3659 = func.call @cc_nil_value() : () -> i64
      %3660 = func.call @cc_cons(%3658, %3659) : (i64, i64) -> i64
      %3661 = func.call @cc_values_pack(%3660) : (i64) -> i64
      %3662 = func.call @cc_symbol_value(%3658) : (i64) -> i64
      func.call @stack_push_pointer(%3662) : (i64) -> ()
      %3663 = func.call @stack_pop_pointer() : () -> i64
      %3664 = llvm.mlir.addressof @str367 : !llvm.ptr
      %3665 = arith.constant 6 : i64
      %3666 = func.call @cc_make_string(%3664, %3665) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3666) : (i64) -> ()
      %3667 = llvm.mlir.addressof @str368 : !llvm.ptr
      %3668 = arith.constant 6 : i64
      %3669 = func.call @cc_make_string(%3667, %3668) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3669) : (i64) -> ()
      %3670 = llvm.mlir.addressof @str369 : !llvm.ptr
      %3671 = arith.constant 9 : i64
      %3672 = func.call @cc_make_string(%3670, %3671) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3672) : (i64) -> ()
      %3673 = llvm.mlir.addressof @str370 : !llvm.ptr
      %3674 = arith.constant 17 : i64
      %3675 = func.call @cc_make_string(%3673, %3674) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3675) : (i64) -> ()
      %3676 = llvm.mlir.addressof @str371 : !llvm.ptr
      %3677 = arith.constant 6 : i64
      %3678 = func.call @cc_make_string(%3676, %3677) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3678) : (i64) -> ()
      %3679 = llvm.mlir.addressof @str372 : !llvm.ptr
      %3680 = arith.constant 31 : i64
      %3681 = func.call @cc_make_string(%3679, %3680) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3681) : (i64) -> ()
      %3682 = llvm.mlir.addressof @str373 : !llvm.ptr
      %3683 = arith.constant 6 : i64
      %3684 = func.call @cc_make_string(%3682, %3683) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3684) : (i64) -> ()
      %3685 = llvm.mlir.addressof @str374 : !llvm.ptr
      %3686 = arith.constant 25 : i64
      %3687 = func.call @cc_make_string(%3685, %3686) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3687) : (i64) -> ()
      %3688 = llvm.mlir.addressof @str375 : !llvm.ptr
      %3689 = arith.constant 6 : i64
      %3690 = func.call @cc_make_string(%3688, %3689) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3690) : (i64) -> ()
      %3691 = llvm.mlir.addressof @str376 : !llvm.ptr
      %3692 = arith.constant 60 : i64
      %3693 = func.call @cc_make_string(%3691, %3692) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3693) : (i64) -> ()
      %3694 = llvm.mlir.addressof @str377 : !llvm.ptr
      %3695 = arith.constant 6 : i64
      %3696 = func.call @cc_make_string(%3694, %3695) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3696) : (i64) -> ()
      %3697 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3698 = arith.constant 8 : i64
      %3699 = func.call @cc_make_string(%3697, %3698) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3699) : (i64) -> ()
      %3700 = llvm.mlir.addressof @str379 : !llvm.ptr
      %3701 = arith.constant 6 : i64
      %3702 = func.call @cc_make_string(%3700, %3701) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3702) : (i64) -> ()
      %3703 = llvm.mlir.addressof @str380 : !llvm.ptr
      %3704 = arith.constant 2 : i64
      %3705 = func.call @cc_make_string(%3703, %3704) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3705) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3706 = func.call @stack_pop_pointer() : () -> i64
      %3707 = func.call @stack_pop_pointer() : () -> i64
      %3708 = func.call @cc_cons(%3707, %3706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3708) : (i64) -> ()
      %3709 = func.call @stack_pop_pointer() : () -> i64
      %3710 = func.call @stack_pop_pointer() : () -> i64
      %3711 = func.call @cc_cons(%3710, %3709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3711) : (i64) -> ()
      %3712 = func.call @stack_pop_pointer() : () -> i64
      %3713 = func.call @stack_pop_pointer() : () -> i64
      %3714 = func.call @cc_cons(%3713, %3712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3714) : (i64) -> ()
      %3715 = func.call @stack_pop_pointer() : () -> i64
      %3716 = func.call @stack_pop_pointer() : () -> i64
      %3717 = func.call @cc_cons(%3716, %3715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3717) : (i64) -> ()
      %3718 = func.call @stack_pop_pointer() : () -> i64
      %3719 = func.call @stack_pop_pointer() : () -> i64
      %3720 = func.call @cc_cons(%3719, %3718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3720) : (i64) -> ()
      %3721 = func.call @stack_pop_pointer() : () -> i64
      %3722 = func.call @stack_pop_pointer() : () -> i64
      %3723 = func.call @cc_cons(%3722, %3721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3723) : (i64) -> ()
      %3724 = func.call @stack_pop_pointer() : () -> i64
      %3725 = func.call @stack_pop_pointer() : () -> i64
      %3726 = func.call @cc_cons(%3725, %3724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3726) : (i64) -> ()
      %3727 = func.call @stack_pop_pointer() : () -> i64
      %3728 = func.call @stack_pop_pointer() : () -> i64
      %3729 = func.call @cc_cons(%3728, %3727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3729) : (i64) -> ()
      %3730 = func.call @stack_pop_pointer() : () -> i64
      %3731 = func.call @stack_pop_pointer() : () -> i64
      %3732 = func.call @cc_cons(%3731, %3730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3732) : (i64) -> ()
      %3733 = func.call @stack_pop_pointer() : () -> i64
      %3734 = func.call @stack_pop_pointer() : () -> i64
      %3735 = func.call @cc_cons(%3734, %3733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3735) : (i64) -> ()
      %3736 = func.call @stack_pop_pointer() : () -> i64
      %3737 = func.call @stack_pop_pointer() : () -> i64
      %3738 = func.call @cc_cons(%3737, %3736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3738) : (i64) -> ()
      %3739 = func.call @stack_pop_pointer() : () -> i64
      %3740 = func.call @stack_pop_pointer() : () -> i64
      %3741 = func.call @cc_cons(%3740, %3739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3741) : (i64) -> ()
      %3742 = func.call @stack_pop_pointer() : () -> i64
      %3743 = func.call @stack_pop_pointer() : () -> i64
      %3744 = func.call @cc_cons(%3743, %3742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3744) : (i64) -> ()
      %3745 = func.call @stack_pop_pointer() : () -> i64
      %3746 = func.call @stack_pop_pointer() : () -> i64
      %3747 = func.call @cc_cons(%3746, %3745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3747) : (i64) -> ()
      %3748 = func.call @stack_pop_pointer() : () -> i64
      %3749 = llvm.mlir.addressof @str381 : !llvm.ptr
      %3750 = arith.constant 5 : i64
      %3751 = func.call @cc_make_string(%3749, %3750) : (!llvm.ptr, i64) -> i64
      %3752 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3753 = arith.constant 7 : i64
      %3754 = func.call @cc_make_string(%3752, %3753) : (!llvm.ptr, i64) -> i64
      %3755 = func.call @cc_intern(%3751, %3754) : (i64, i64) -> i64
      %3756 = func.call @cc_nil_value() : () -> i64
      %3757 = func.call @cc_cons(%3755, %3756) : (i64, i64) -> i64
      %3758 = func.call @cc_values_pack(%3757) : (i64) -> i64
      func.call @stack_push_pointer(%3755) : (i64) -> ()
      %3759 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3651) : (i64) -> ()
      %3760 = func.call @stack_pop_pointer() : () -> i64
      %3761 = llvm.mlir.addressof @str383 : !llvm.ptr
      %3762 = arith.constant 6 : i64
      %3763 = func.call @cc_make_string(%3761, %3762) : (!llvm.ptr, i64) -> i64
      %3764 = llvm.mlir.addressof @str384 : !llvm.ptr
      %3765 = arith.constant 7 : i64
      %3766 = func.call @cc_make_string(%3764, %3765) : (!llvm.ptr, i64) -> i64
      %3767 = func.call @cc_intern(%3763, %3766) : (i64, i64) -> i64
      %3768 = func.call @cc_nil_value() : () -> i64
      %3769 = func.call @cc_cons(%3767, %3768) : (i64, i64) -> i64
      %3770 = func.call @cc_values_pack(%3769) : (i64) -> i64
      func.call @stack_push_pointer(%3767) : (i64) -> ()
      %3771 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3645) : (i64) -> ()
      %3772 = func.call @stack_pop_pointer() : () -> i64
      %3773 = llvm.mlir.addressof @str385 : !llvm.ptr
      %3774 = arith.constant 5 : i64
      %3775 = func.call @cc_make_string(%3773, %3774) : (!llvm.ptr, i64) -> i64
      %3776 = llvm.mlir.addressof @str386 : !llvm.ptr
      %3777 = arith.constant 7 : i64
      %3778 = func.call @cc_make_string(%3776, %3777) : (!llvm.ptr, i64) -> i64
      %3779 = func.call @cc_intern(%3775, %3778) : (i64, i64) -> i64
      %3780 = func.call @cc_nil_value() : () -> i64
      %3781 = func.call @cc_cons(%3779, %3780) : (i64, i64) -> i64
      %3782 = func.call @cc_values_pack(%3781) : (i64) -> i64
      func.call @stack_push_pointer(%3779) : (i64) -> ()
      %3783 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3646) : (i64) -> ()
      %3784 = func.call @stack_pop_pointer() : () -> i64
      %3785 = llvm.mlir.addressof @str387 : !llvm.ptr
      %3786 = arith.constant 4 : i64
      %3787 = func.call @cc_make_string(%3785, %3786) : (!llvm.ptr, i64) -> i64
      %3788 = llvm.mlir.addressof @str388 : !llvm.ptr
      %3789 = arith.constant 7 : i64
      %3790 = func.call @cc_make_string(%3788, %3789) : (!llvm.ptr, i64) -> i64
      %3791 = func.call @cc_intern(%3787, %3790) : (i64, i64) -> i64
      %3792 = func.call @cc_nil_value() : () -> i64
      %3793 = func.call @cc_cons(%3791, %3792) : (i64, i64) -> i64
      %3794 = func.call @cc_values_pack(%3793) : (i64) -> i64
      func.call @stack_push_pointer(%3791) : (i64) -> ()
      %3795 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3796 = func.call @stack_pop_pointer() : () -> i64
      %3797 = func.call @cc_nil_value() : () -> i64
      %3798 = func.call @cc_errorp(%3663) : (i64) -> i64
      %3799 = arith.cmpi ne, %3798, %3797 : i64
      %3800 = arith.cmpi eq, %3797, %3797 : i64
      %3801 = arith.andi %3799, %3800 : i1
      %3802 = scf.if %3801 -> (i64) {
        scf.yield %3663 : i64
      } else {
        scf.yield %3797 : i64
      }
      %3803 = func.call @cc_errorp(%3748) : (i64) -> i64
      %3804 = arith.cmpi ne, %3803, %3797 : i64
      %3805 = arith.cmpi eq, %3802, %3797 : i64
      %3806 = arith.andi %3804, %3805 : i1
      %3807 = scf.if %3806 -> (i64) {
        scf.yield %3748 : i64
      } else {
        scf.yield %3802 : i64
      }
      %3808 = func.call @cc_errorp(%3759) : (i64) -> i64
      %3809 = arith.cmpi ne, %3808, %3797 : i64
      %3810 = arith.cmpi eq, %3807, %3797 : i64
      %3811 = arith.andi %3809, %3810 : i1
      %3812 = scf.if %3811 -> (i64) {
        scf.yield %3759 : i64
      } else {
        scf.yield %3807 : i64
      }
      %3813 = func.call @cc_errorp(%3760) : (i64) -> i64
      %3814 = arith.cmpi ne, %3813, %3797 : i64
      %3815 = arith.cmpi eq, %3812, %3797 : i64
      %3816 = arith.andi %3814, %3815 : i1
      %3817 = scf.if %3816 -> (i64) {
        scf.yield %3760 : i64
      } else {
        scf.yield %3812 : i64
      }
      %3818 = func.call @cc_errorp(%3771) : (i64) -> i64
      %3819 = arith.cmpi ne, %3818, %3797 : i64
      %3820 = arith.cmpi eq, %3817, %3797 : i64
      %3821 = arith.andi %3819, %3820 : i1
      %3822 = scf.if %3821 -> (i64) {
        scf.yield %3771 : i64
      } else {
        scf.yield %3817 : i64
      }
      %3823 = func.call @cc_errorp(%3772) : (i64) -> i64
      %3824 = arith.cmpi ne, %3823, %3797 : i64
      %3825 = arith.cmpi eq, %3822, %3797 : i64
      %3826 = arith.andi %3824, %3825 : i1
      %3827 = scf.if %3826 -> (i64) {
        scf.yield %3772 : i64
      } else {
        scf.yield %3822 : i64
      }
      %3828 = func.call @cc_errorp(%3783) : (i64) -> i64
      %3829 = arith.cmpi ne, %3828, %3797 : i64
      %3830 = arith.cmpi eq, %3827, %3797 : i64
      %3831 = arith.andi %3829, %3830 : i1
      %3832 = scf.if %3831 -> (i64) {
        scf.yield %3783 : i64
      } else {
        scf.yield %3827 : i64
      }
      %3833 = func.call @cc_errorp(%3784) : (i64) -> i64
      %3834 = arith.cmpi ne, %3833, %3797 : i64
      %3835 = arith.cmpi eq, %3832, %3797 : i64
      %3836 = arith.andi %3834, %3835 : i1
      %3837 = scf.if %3836 -> (i64) {
        scf.yield %3784 : i64
      } else {
        scf.yield %3832 : i64
      }
      %3838 = func.call @cc_errorp(%3795) : (i64) -> i64
      %3839 = arith.cmpi ne, %3838, %3797 : i64
      %3840 = arith.cmpi eq, %3837, %3797 : i64
      %3841 = arith.andi %3839, %3840 : i1
      %3842 = scf.if %3841 -> (i64) {
        scf.yield %3795 : i64
      } else {
        scf.yield %3837 : i64
      }
      %3843 = func.call @cc_errorp(%3796) : (i64) -> i64
      %3844 = arith.cmpi ne, %3843, %3797 : i64
      %3845 = arith.cmpi eq, %3842, %3797 : i64
      %3846 = arith.andi %3844, %3845 : i1
      %3847 = scf.if %3846 -> (i64) {
        scf.yield %3796 : i64
      } else {
        scf.yield %3842 : i64
      }
      %3848 = arith.cmpi ne, %3847, %3797 : i64
      scf.if %3848 {
        func.call @stack_push_pointer(%3847) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3663) : (i64) -> ()
        func.call @stack_push_pointer(%3748) : (i64) -> ()
        func.call @stack_push_pointer(%3759) : (i64) -> ()
        func.call @stack_push_pointer(%3760) : (i64) -> ()
        func.call @stack_push_pointer(%3771) : (i64) -> ()
        func.call @stack_push_pointer(%3772) : (i64) -> ()
        func.call @stack_push_pointer(%3783) : (i64) -> ()
        func.call @stack_push_pointer(%3784) : (i64) -> ()
        func.call @stack_push_pointer(%3795) : (i64) -> ()
        func.call @stack_push_pointer(%3796) : (i64) -> ()
        %3849 = llvm.mlir.addressof @str389 : !llvm.ptr
        %3850 = func.call @cc_make_function_ref_const(%3849) : (!llvm.ptr) -> i64
        %3851 = arith.constant 10 : i64
        func.call @cc_funcall_stack(%3850, %3851) : (i64, i64) -> ()
      }
      %3852 = func.call @stack_pop_pointer() : () -> i64
      %3853 = func.call @cc_multiple_value_list(%3852) : (i64) -> i64
      %3854 = arith.constant 0 : i64
      %3855 = func.call @cc_box_fixnum(%3854) : (i64) -> i64
      %3856 = func.call @cc_nth(%3855, %3853) : (i64, i64) -> i64
      %3857 = arith.constant 1 : i64
      %3858 = func.call @cc_box_fixnum(%3857) : (i64) -> i64
      %3859 = func.call @cc_nth(%3858, %3853) : (i64, i64) -> i64
      %3860 = arith.constant 2 : i64
      %3861 = func.call @cc_box_fixnum(%3860) : (i64) -> i64
      %3862 = func.call @cc_nth(%3861, %3853) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3863 = func.call @stack_depth() : () -> i64
      %3864 = arith.constant 0 : i64
      %3865 = arith.cmpi sgt, %3863, %3864 : i64
      scf.if %3865 {
        %3866 = func.call @stack_pop_pointer() : () -> i64
      }
      %3867 = llvm.mlir.addressof @str390 : !llvm.ptr
      %3868 = func.call @cc_make_function_ref_const(%3867) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3868) : (i64) -> ()
      %3869 = func.call @stack_pop_pointer() : () -> i64
      %3870 = func.call @cc_nil_value() : () -> i64
      %3871 = arith.constant 1 : i1
      %3872 = arith.constant 0 : i1
      %3873 = arith.constant 1 : i1
      %3874:2 = scf.if %3871 -> (i64, i1) {
        func.call @stack_push_nil() : () -> ()
        %3875 = func.call @stack_pop_pointer() : () -> i64
        %3876 = func.call @cc_multiple_value_list(%3875) : (i64) -> i64
        %3877 = func.call @cc_nil_value() : () -> i64
        %3878 = llvm.mlir.addressof @str391 : !llvm.ptr
        %3879 = arith.constant 38 : i64
        %3880 = func.call @cc_make_string(%3878, %3879) : (!llvm.ptr, i64) -> i64
        %3881 = func.call @cc_nil_value() : () -> i64
        %3882 = func.call @cc_intern(%3880, %3881) : (i64, i64) -> i64
        %3883 = func.call @cc_nil_value() : () -> i64
        %3884 = func.call @cc_cons(%3882, %3883) : (i64, i64) -> i64
        %3885 = func.call @cc_values_pack(%3884) : (i64) -> i64
        %3886 = func.call @cc_symbol_value(%3882) : (i64) -> i64
        %3887 = arith.cmpi ne, %3886, %3877 : i64
        %3888 = llvm.mlir.addressof @str392 : !llvm.ptr
        %3889 = arith.constant 38 : i64
        %3890 = func.call @cc_make_string(%3888, %3889) : (!llvm.ptr, i64) -> i64
        %3891 = func.call @cc_nil_value() : () -> i64
        %3892 = func.call @cc_intern(%3890, %3891) : (i64, i64) -> i64
        %3893 = func.call @cc_nil_value() : () -> i64
        %3894 = func.call @cc_cons(%3892, %3893) : (i64, i64) -> i64
        %3895 = func.call @cc_values_pack(%3894) : (i64) -> i64
        %3896 = func.call @cc_symbol_value(%3892) : (i64) -> i64
        %3897 = arith.cmpi ne, %3896, %3877 : i64
        %3898 = arith.ori %3887, %3897 : i1
        %3899:2 = scf.if %3898 -> (i64, i1) {
          %3900 = func.call @cc_values_pack(%3876) : (i64) -> i64
          func.call @stack_push_pointer(%3900) : (i64) -> ()
          scf.yield %3870, %3872 : i64, i1
        } else {
          %3901 = func.call @cc_append(%3870, %3876) : (i64, i64) -> i64
          scf.yield %3901, %3873 : i64, i1
        }
        scf.yield %3899#0, %3899#1 : i64, i1
      } else {
        scf.yield %3870, %3872 : i64, i1
      }
      %3902:2 = scf.if %3874#1 -> (i64, i1) {
        func.call @stack_push_pointer(%3862) : (i64) -> ()
        %3903 = func.call @stack_pop_pointer() : () -> i64
        %3904 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%3904) : (i64) -> ()
        %3905 = func.call @stack_pop_pointer() : () -> i64
        %3906 = func.call @cc_nil_value() : () -> i64
        %3907 = func.call @cc_errorp(%3903) : (i64) -> i64
        %3908 = arith.cmpi ne, %3907, %3906 : i64
        %3909 = arith.cmpi eq, %3906, %3906 : i64
        %3910 = arith.andi %3908, %3909 : i1
        %3911 = scf.if %3910 -> (i64) {
          scf.yield %3903 : i64
        } else {
          scf.yield %3906 : i64
        }
        %3912 = func.call @cc_errorp(%3905) : (i64) -> i64
        %3913 = arith.cmpi ne, %3912, %3906 : i64
        %3914 = arith.cmpi eq, %3911, %3906 : i64
        %3915 = arith.andi %3913, %3914 : i1
        %3916 = scf.if %3915 -> (i64) {
          scf.yield %3905 : i64
        } else {
          scf.yield %3911 : i64
        }
        %3917 = arith.cmpi ne, %3916, %3906 : i64
        scf.if %3917 {
          func.call @stack_push_pointer(%3916) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3903) : (i64) -> ()
          func.call @stack_push_pointer(%3905) : (i64) -> ()
          %3918 = llvm.mlir.addressof @str393 : !llvm.ptr
          %3919 = func.call @cc_make_function_ref_const(%3918) : (!llvm.ptr) -> i64
          %3920 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3919, %3920) : (i64, i64) -> ()
        }
        %3921 = func.call @stack_pop_pointer() : () -> i64
        %3922 = func.call @cc_multiple_value_list(%3921) : (i64) -> i64
        %3923 = func.call @cc_nil_value() : () -> i64
        %3924 = llvm.mlir.addressof @str394 : !llvm.ptr
        %3925 = arith.constant 38 : i64
        %3926 = func.call @cc_make_string(%3924, %3925) : (!llvm.ptr, i64) -> i64
        %3927 = func.call @cc_nil_value() : () -> i64
        %3928 = func.call @cc_intern(%3926, %3927) : (i64, i64) -> i64
        %3929 = func.call @cc_nil_value() : () -> i64
        %3930 = func.call @cc_cons(%3928, %3929) : (i64, i64) -> i64
        %3931 = func.call @cc_values_pack(%3930) : (i64) -> i64
        %3932 = func.call @cc_symbol_value(%3928) : (i64) -> i64
        %3933 = arith.cmpi ne, %3932, %3923 : i64
        %3934 = llvm.mlir.addressof @str395 : !llvm.ptr
        %3935 = arith.constant 38 : i64
        %3936 = func.call @cc_make_string(%3934, %3935) : (!llvm.ptr, i64) -> i64
        %3937 = func.call @cc_nil_value() : () -> i64
        %3938 = func.call @cc_intern(%3936, %3937) : (i64, i64) -> i64
        %3939 = func.call @cc_nil_value() : () -> i64
        %3940 = func.call @cc_cons(%3938, %3939) : (i64, i64) -> i64
        %3941 = func.call @cc_values_pack(%3940) : (i64) -> i64
        %3942 = func.call @cc_symbol_value(%3938) : (i64) -> i64
        %3943 = arith.cmpi ne, %3942, %3923 : i64
        %3944 = arith.ori %3933, %3943 : i1
        %3945:2 = scf.if %3944 -> (i64, i1) {
          %3946 = func.call @cc_values_pack(%3922) : (i64) -> i64
          func.call @stack_push_pointer(%3946) : (i64) -> ()
          scf.yield %3874#0, %3872 : i64, i1
        } else {
          %3947 = func.call @cc_append(%3874#0, %3922) : (i64, i64) -> i64
          scf.yield %3947, %3873 : i64, i1
        }
        scf.yield %3945#0, %3945#1 : i64, i1
      } else {
        scf.yield %3874#0, %3872 : i64, i1
      }
      scf.if %3902#1 {
        %3948 = func.call @cc_apply(%3869, %3902#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3948) : (i64) -> ()
      } else {
      }
      %3949 = func.call @stack_pop_pointer() : () -> i64
      %3950 = func.call @cc_nil_value() : () -> i64
      %3951 = func.call @cc_errorp(%3949) : (i64) -> i64
      %3952 = arith.cmpi ne, %3951, %3950 : i64
      %3953 = scf.if %3952 -> (i64) {
        scf.yield %3949 : i64
      } else {
        func.call @stack_push_pointer(%3645) : (i64) -> ()
        %3954 = func.call @stack_pop_pointer() : () -> i64
        %3955 = func.call @cc_nil_value() : () -> i64
        %3956 = func.call @cc_errorp(%3954) : (i64) -> i64
        %3957 = arith.cmpi ne, %3956, %3955 : i64
        %3958 = arith.cmpi eq, %3955, %3955 : i64
        %3959 = arith.andi %3957, %3958 : i1
        %3960 = scf.if %3959 -> (i64) {
          scf.yield %3954 : i64
        } else {
          scf.yield %3955 : i64
        }
        %3961 = arith.cmpi ne, %3960, %3955 : i64
        scf.if %3961 {
          func.call @stack_push_pointer(%3960) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3954) : (i64) -> ()
          %3962 = llvm.mlir.addressof @str396 : !llvm.ptr
          %3963 = func.call @cc_make_function_ref_const(%3962) : (!llvm.ptr) -> i64
          %3964 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3963, %3964) : (i64, i64) -> ()
        }
        %3965 = func.call @stack_pop_pointer() : () -> i64
        %3966 = func.call @cc_length(%3965) : (i64) -> i64
        func.call @stack_push_pointer(%3966) : (i64) -> ()
        %3967 = func.call @stack_pop_pointer() : () -> i64
        %3968 = func.call @cc_unbox_fixnum(%3967) : (i64) -> i64
        %3969 = arith.constant 0 : i64
        %3970 = arith.cmpi eq, %3968, %3969 : i64
        %3971 = func.call @cc_t_value() : () -> i64
        %3972 = func.call @cc_nil_value() : () -> i64
        %3973 = arith.select %3970, %3971, %3972 : i64
        func.call @stack_push_pointer(%3973) : (i64) -> ()
        %3974 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3646) : (i64) -> ()
        %3975 = func.call @stack_pop_pointer() : () -> i64
        %3976 = func.call @cc_nil_value() : () -> i64
        %3977 = func.call @cc_errorp(%3975) : (i64) -> i64
        %3978 = arith.cmpi ne, %3977, %3976 : i64
        %3979 = arith.cmpi eq, %3976, %3976 : i64
        %3980 = arith.andi %3978, %3979 : i1
        %3981 = scf.if %3980 -> (i64) {
          scf.yield %3975 : i64
        } else {
          scf.yield %3976 : i64
        }
        %3982 = arith.cmpi ne, %3981, %3976 : i64
        scf.if %3982 {
          func.call @stack_push_pointer(%3981) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3975) : (i64) -> ()
          %3983 = llvm.mlir.addressof @str397 : !llvm.ptr
          %3984 = func.call @cc_make_function_ref_const(%3983) : (!llvm.ptr) -> i64
          %3985 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3984, %3985) : (i64, i64) -> ()
        }
        %3986 = func.call @stack_pop_pointer() : () -> i64
        %3987 = func.call @cc_length(%3986) : (i64) -> i64
        func.call @stack_push_pointer(%3987) : (i64) -> ()
        %3988 = func.call @stack_pop_pointer() : () -> i64
        %3989 = func.call @cc_unbox_fixnum(%3988) : (i64) -> i64
        %3990 = arith.constant 0 : i64
        %3991 = arith.cmpi eq, %3989, %3990 : i64
        %3992 = func.call @cc_t_value() : () -> i64
        %3993 = func.call @cc_nil_value() : () -> i64
        %3994 = arith.select %3991, %3992, %3993 : i64
        func.call @stack_push_pointer(%3994) : (i64) -> ()
        %3995 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3996 = func.call @stack_pop_pointer() : () -> i64
        %3997 = func.call @cc_cons(%3995, %3996) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3997) : (i64) -> ()
        %3998 = func.call @stack_pop_pointer() : () -> i64
        %3999 = func.call @cc_cons(%3974, %3998) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3999) : (i64) -> ()
        %4000 = func.call @stack_pop_pointer() : () -> i64
        %4001 = func.call @cc_values_pack(%4000) : (i64) -> i64
        func.call @stack_push_pointer(%4001) : (i64) -> ()
        %4002 = func.call @stack_pop_pointer() : () -> i64
        %4003 = func.call @cc_multiple_value_list(%4002) : (i64) -> i64
        %4004 = func.call @cc_t_value() : () -> i64
        %4005 = llvm.mlir.addressof @str398 : !llvm.ptr
        %4006 = arith.constant 38 : i64
        %4007 = func.call @cc_make_string(%4005, %4006) : (!llvm.ptr, i64) -> i64
        %4008 = func.call @cc_nil_value() : () -> i64
        %4009 = func.call @cc_intern(%4007, %4008) : (i64, i64) -> i64
        %4010 = func.call @cc_nil_value() : () -> i64
        %4011 = func.call @cc_cons(%4009, %4010) : (i64, i64) -> i64
        %4012 = func.call @cc_values_pack(%4011) : (i64) -> i64
        %4013 = func.call @cc_set_symbol_value(%4009, %4004) : (i64, i64) -> i64
        %4014 = llvm.mlir.addressof @str399 : !llvm.ptr
        %4015 = arith.constant 39 : i64
        %4016 = func.call @cc_make_string(%4014, %4015) : (!llvm.ptr, i64) -> i64
        %4017 = func.call @cc_nil_value() : () -> i64
        %4018 = func.call @cc_intern(%4016, %4017) : (i64, i64) -> i64
        %4019 = func.call @cc_nil_value() : () -> i64
        %4020 = func.call @cc_cons(%4018, %4019) : (i64, i64) -> i64
        %4021 = func.call @cc_values_pack(%4020) : (i64) -> i64
        %4022 = func.call @cc_set_symbol_value(%4018, %4002) : (i64, i64) -> i64
        %4023 = llvm.mlir.addressof @str400 : !llvm.ptr
        %4024 = arith.constant 40 : i64
        %4025 = func.call @cc_make_string(%4023, %4024) : (!llvm.ptr, i64) -> i64
        %4026 = func.call @cc_nil_value() : () -> i64
        %4027 = func.call @cc_intern(%4025, %4026) : (i64, i64) -> i64
        %4028 = func.call @cc_nil_value() : () -> i64
        %4029 = func.call @cc_cons(%4027, %4028) : (i64, i64) -> i64
        %4030 = func.call @cc_values_pack(%4029) : (i64) -> i64
        %4031 = func.call @cc_set_symbol_value(%4027, %4003) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4002) : (i64) -> ()
        %4032 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4032 : i64
      }
      %4033 = func.call @cc_nil_value() : () -> i64
      %4034 = func.call @cc_errorp(%3953) : (i64) -> i64
      %4035 = arith.cmpi ne, %4034, %4033 : i64
      %4036 = scf.if %4035 -> (i64) {
        scf.yield %3953 : i64
      } else {
        %4037 = func.call @cc_get_output_stream_string(%3646) : (i64) -> i64
        scf.yield %4037 : i64
      }
      func.call @stack_push_pointer(%4036) : (i64) -> ()
      %4038 = func.call @stack_pop_pointer() : () -> i64
      %4039 = func.call @cc_nil_value() : () -> i64
      %4040 = func.call @cc_errorp(%4038) : (i64) -> i64
      %4041 = arith.cmpi ne, %4040, %4039 : i64
      %4042 = scf.if %4041 -> (i64) {
        scf.yield %4038 : i64
      } else {
        %4043 = func.call @cc_get_output_stream_string(%3645) : (i64) -> i64
        scf.yield %4043 : i64
      }
      func.call @stack_push_pointer(%4042) : (i64) -> ()
      %4044 = func.call @stack_pop_pointer() : () -> i64
      %4045 = func.call @cc_multiple_value_list(%4044) : (i64) -> i64
      %4046 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4047 = arith.constant 38 : i64
      %4048 = func.call @cc_make_string(%4046, %4047) : (!llvm.ptr, i64) -> i64
      %4049 = func.call @cc_nil_value() : () -> i64
      %4050 = func.call @cc_intern(%4048, %4049) : (i64, i64) -> i64
      %4051 = func.call @cc_nil_value() : () -> i64
      %4052 = func.call @cc_cons(%4050, %4051) : (i64, i64) -> i64
      %4053 = func.call @cc_values_pack(%4052) : (i64) -> i64
      %4054 = func.call @cc_symbol_value(%4050) : (i64) -> i64
      %4055 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4056 = arith.constant 39 : i64
      %4057 = func.call @cc_make_string(%4055, %4056) : (!llvm.ptr, i64) -> i64
      %4058 = func.call @cc_nil_value() : () -> i64
      %4059 = func.call @cc_intern(%4057, %4058) : (i64, i64) -> i64
      %4060 = func.call @cc_nil_value() : () -> i64
      %4061 = func.call @cc_cons(%4059, %4060) : (i64, i64) -> i64
      %4062 = func.call @cc_values_pack(%4061) : (i64) -> i64
      %4063 = func.call @cc_symbol_value(%4059) : (i64) -> i64
      %4064 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4065 = arith.constant 40 : i64
      %4066 = func.call @cc_make_string(%4064, %4065) : (!llvm.ptr, i64) -> i64
      %4067 = func.call @cc_nil_value() : () -> i64
      %4068 = func.call @cc_intern(%4066, %4067) : (i64, i64) -> i64
      %4069 = func.call @cc_nil_value() : () -> i64
      %4070 = func.call @cc_cons(%4068, %4069) : (i64, i64) -> i64
      %4071 = func.call @cc_values_pack(%4070) : (i64) -> i64
      %4072 = func.call @cc_symbol_value(%4068) : (i64) -> i64
      %4073 = func.call @cc_nil_value() : () -> i64
      %4074 = arith.cmpi ne, %4054, %4073 : i64
      %4075 = scf.if %4074 -> (i64) {
        scf.yield %4072 : i64
      } else {
        scf.yield %4045 : i64
      }
      %4076 = func.call @cc_values_pack(%4075) : (i64) -> i64
      func.call @stack_push_pointer(%4076) : (i64) -> ()
      %4077 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4077 : i64
    }
    func.call @stack_push_pointer(%3616) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_263377075044371"() {
    %4566 = func.call @stack_pop_pointer() : () -> i64
    %4567 = func.call @cc_nil_value() : () -> i64
    %4568 = func.call @cc_nil_value() : () -> i64
    %4569 = func.call @cc_errorp(%4567) : (i64) -> i64
    %4570 = arith.cmpi ne, %4569, %4568 : i64
    %4571 = scf.if %4570 -> (i64) {
      scf.yield %4567 : i64
    } else {
      %4572 = func.call @cc_nil_value() : () -> i64
      %4573 = llvm.mlir.addressof @str453 : !llvm.ptr
      %4574 = arith.constant 38 : i64
      %4575 = func.call @cc_make_string(%4573, %4574) : (!llvm.ptr, i64) -> i64
      %4576 = func.call @cc_nil_value() : () -> i64
      %4577 = func.call @cc_intern(%4575, %4576) : (i64, i64) -> i64
      %4578 = func.call @cc_nil_value() : () -> i64
      %4579 = func.call @cc_cons(%4577, %4578) : (i64, i64) -> i64
      %4580 = func.call @cc_values_pack(%4579) : (i64) -> i64
      %4581 = func.call @cc_set_symbol_value(%4577, %4572) : (i64, i64) -> i64
      %4582 = llvm.mlir.addressof @str454 : !llvm.ptr
      %4583 = arith.constant 39 : i64
      %4584 = func.call @cc_make_string(%4582, %4583) : (!llvm.ptr, i64) -> i64
      %4585 = func.call @cc_nil_value() : () -> i64
      %4586 = func.call @cc_intern(%4584, %4585) : (i64, i64) -> i64
      %4587 = func.call @cc_nil_value() : () -> i64
      %4588 = func.call @cc_cons(%4586, %4587) : (i64, i64) -> i64
      %4589 = func.call @cc_values_pack(%4588) : (i64) -> i64
      %4590 = func.call @cc_set_symbol_value(%4586, %4572) : (i64, i64) -> i64
      %4591 = llvm.mlir.addressof @str455 : !llvm.ptr
      %4592 = arith.constant 40 : i64
      %4593 = func.call @cc_make_string(%4591, %4592) : (!llvm.ptr, i64) -> i64
      %4594 = func.call @cc_nil_value() : () -> i64
      %4595 = func.call @cc_intern(%4593, %4594) : (i64, i64) -> i64
      %4596 = func.call @cc_nil_value() : () -> i64
      %4597 = func.call @cc_cons(%4595, %4596) : (i64, i64) -> i64
      %4598 = func.call @cc_values_pack(%4597) : (i64) -> i64
      %4599 = func.call @cc_set_symbol_value(%4595, %4572) : (i64, i64) -> i64
      %4600 = func.call @cc_make_string_output_stream() : () -> i64
      %4601 = func.call @cc_make_string_output_stream() : () -> i64
      %4602 = llvm.mlir.addressof @str456 : !llvm.ptr
      %4603 = arith.constant 0 : i64
      %4604 = func.call @cc_make_string(%4602, %4603) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4604) : (i64) -> ()
      %4605 = func.call @stack_pop_pointer() : () -> i64
      %4606 = func.call @cc_make_string_input_stream(%4605) : (i64) -> i64
      %4607 = llvm.mlir.addressof @str457 : !llvm.ptr
      %4608 = arith.constant 8 : i64
      %4609 = func.call @cc_make_string(%4607, %4608) : (!llvm.ptr, i64) -> i64
      %4610 = llvm.mlir.addressof @str458 : !llvm.ptr
      %4611 = arith.constant 11 : i64
      %4612 = func.call @cc_make_string(%4610, %4611) : (!llvm.ptr, i64) -> i64
      %4613 = func.call @cc_intern(%4609, %4612) : (i64, i64) -> i64
      %4614 = func.call @cc_nil_value() : () -> i64
      %4615 = func.call @cc_cons(%4613, %4614) : (i64, i64) -> i64
      %4616 = func.call @cc_values_pack(%4615) : (i64) -> i64
      %4617 = func.call @cc_symbol_value(%4613) : (i64) -> i64
      func.call @stack_push_pointer(%4617) : (i64) -> ()
      %4618 = func.call @stack_pop_pointer() : () -> i64
      %4619 = llvm.mlir.addressof @str459 : !llvm.ptr
      %4620 = arith.constant 6 : i64
      %4621 = func.call @cc_make_string(%4619, %4620) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4621) : (i64) -> ()
      %4622 = llvm.mlir.addressof @str460 : !llvm.ptr
      %4623 = arith.constant 6 : i64
      %4624 = func.call @cc_make_string(%4622, %4623) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4624) : (i64) -> ()
      %4625 = llvm.mlir.addressof @str461 : !llvm.ptr
      %4626 = arith.constant 9 : i64
      %4627 = func.call @cc_make_string(%4625, %4626) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4627) : (i64) -> ()
      %4628 = llvm.mlir.addressof @str462 : !llvm.ptr
      %4629 = arith.constant 17 : i64
      %4630 = func.call @cc_make_string(%4628, %4629) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4630) : (i64) -> ()
      %4631 = llvm.mlir.addressof @str463 : !llvm.ptr
      %4632 = arith.constant 6 : i64
      %4633 = func.call @cc_make_string(%4631, %4632) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4633) : (i64) -> ()
      %4634 = llvm.mlir.addressof @str464 : !llvm.ptr
      %4635 = arith.constant 31 : i64
      %4636 = func.call @cc_make_string(%4634, %4635) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4636) : (i64) -> ()
      %4637 = llvm.mlir.addressof @str465 : !llvm.ptr
      %4638 = arith.constant 6 : i64
      %4639 = func.call @cc_make_string(%4637, %4638) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4639) : (i64) -> ()
      %4640 = llvm.mlir.addressof @str466 : !llvm.ptr
      %4641 = arith.constant 25 : i64
      %4642 = func.call @cc_make_string(%4640, %4641) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4642) : (i64) -> ()
      %4643 = llvm.mlir.addressof @str467 : !llvm.ptr
      %4644 = arith.constant 6 : i64
      %4645 = func.call @cc_make_string(%4643, %4644) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4645) : (i64) -> ()
      %4646 = llvm.mlir.addressof @str468 : !llvm.ptr
      %4647 = arith.constant 60 : i64
      %4648 = func.call @cc_make_string(%4646, %4647) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4648) : (i64) -> ()
      %4649 = llvm.mlir.addressof @str469 : !llvm.ptr
      %4650 = arith.constant 6 : i64
      %4651 = func.call @cc_make_string(%4649, %4650) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4651) : (i64) -> ()
      %4652 = llvm.mlir.addressof @str470 : !llvm.ptr
      %4653 = arith.constant 8 : i64
      %4654 = func.call @cc_make_string(%4652, %4653) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4654) : (i64) -> ()
      %4655 = llvm.mlir.addressof @str471 : !llvm.ptr
      %4656 = arith.constant 6 : i64
      %4657 = func.call @cc_make_string(%4655, %4656) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4657) : (i64) -> ()
      %4658 = llvm.mlir.addressof @str472 : !llvm.ptr
      %4659 = arith.constant 2 : i64
      %4660 = func.call @cc_make_string(%4658, %4659) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4660) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4661 = func.call @stack_pop_pointer() : () -> i64
      %4662 = func.call @stack_pop_pointer() : () -> i64
      %4663 = func.call @cc_cons(%4662, %4661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4663) : (i64) -> ()
      %4664 = func.call @stack_pop_pointer() : () -> i64
      %4665 = func.call @stack_pop_pointer() : () -> i64
      %4666 = func.call @cc_cons(%4665, %4664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4666) : (i64) -> ()
      %4667 = func.call @stack_pop_pointer() : () -> i64
      %4668 = func.call @stack_pop_pointer() : () -> i64
      %4669 = func.call @cc_cons(%4668, %4667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4669) : (i64) -> ()
      %4670 = func.call @stack_pop_pointer() : () -> i64
      %4671 = func.call @stack_pop_pointer() : () -> i64
      %4672 = func.call @cc_cons(%4671, %4670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4672) : (i64) -> ()
      %4673 = func.call @stack_pop_pointer() : () -> i64
      %4674 = func.call @stack_pop_pointer() : () -> i64
      %4675 = func.call @cc_cons(%4674, %4673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4675) : (i64) -> ()
      %4676 = func.call @stack_pop_pointer() : () -> i64
      %4677 = func.call @stack_pop_pointer() : () -> i64
      %4678 = func.call @cc_cons(%4677, %4676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4678) : (i64) -> ()
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
      %4688 = func.call @stack_pop_pointer() : () -> i64
      %4689 = func.call @stack_pop_pointer() : () -> i64
      %4690 = func.call @cc_cons(%4689, %4688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4690) : (i64) -> ()
      %4691 = func.call @stack_pop_pointer() : () -> i64
      %4692 = func.call @stack_pop_pointer() : () -> i64
      %4693 = func.call @cc_cons(%4692, %4691) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4693) : (i64) -> ()
      %4694 = func.call @stack_pop_pointer() : () -> i64
      %4695 = func.call @stack_pop_pointer() : () -> i64
      %4696 = func.call @cc_cons(%4695, %4694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4696) : (i64) -> ()
      %4697 = func.call @stack_pop_pointer() : () -> i64
      %4698 = func.call @stack_pop_pointer() : () -> i64
      %4699 = func.call @cc_cons(%4698, %4697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4699) : (i64) -> ()
      %4700 = func.call @stack_pop_pointer() : () -> i64
      %4701 = func.call @stack_pop_pointer() : () -> i64
      %4702 = func.call @cc_cons(%4701, %4700) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4702) : (i64) -> ()
      %4703 = func.call @stack_pop_pointer() : () -> i64
      %4704 = llvm.mlir.addressof @str473 : !llvm.ptr
      %4705 = arith.constant 5 : i64
      %4706 = func.call @cc_make_string(%4704, %4705) : (!llvm.ptr, i64) -> i64
      %4707 = llvm.mlir.addressof @str474 : !llvm.ptr
      %4708 = arith.constant 7 : i64
      %4709 = func.call @cc_make_string(%4707, %4708) : (!llvm.ptr, i64) -> i64
      %4710 = func.call @cc_intern(%4706, %4709) : (i64, i64) -> i64
      %4711 = func.call @cc_nil_value() : () -> i64
      %4712 = func.call @cc_cons(%4710, %4711) : (i64, i64) -> i64
      %4713 = func.call @cc_values_pack(%4712) : (i64) -> i64
      func.call @stack_push_pointer(%4710) : (i64) -> ()
      %4714 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4606) : (i64) -> ()
      %4715 = func.call @stack_pop_pointer() : () -> i64
      %4716 = llvm.mlir.addressof @str475 : !llvm.ptr
      %4717 = arith.constant 6 : i64
      %4718 = func.call @cc_make_string(%4716, %4717) : (!llvm.ptr, i64) -> i64
      %4719 = llvm.mlir.addressof @str476 : !llvm.ptr
      %4720 = arith.constant 7 : i64
      %4721 = func.call @cc_make_string(%4719, %4720) : (!llvm.ptr, i64) -> i64
      %4722 = func.call @cc_intern(%4718, %4721) : (i64, i64) -> i64
      %4723 = func.call @cc_nil_value() : () -> i64
      %4724 = func.call @cc_cons(%4722, %4723) : (i64, i64) -> i64
      %4725 = func.call @cc_values_pack(%4724) : (i64) -> i64
      func.call @stack_push_pointer(%4722) : (i64) -> ()
      %4726 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4600) : (i64) -> ()
      %4727 = func.call @stack_pop_pointer() : () -> i64
      %4728 = llvm.mlir.addressof @str477 : !llvm.ptr
      %4729 = arith.constant 5 : i64
      %4730 = func.call @cc_make_string(%4728, %4729) : (!llvm.ptr, i64) -> i64
      %4731 = llvm.mlir.addressof @str478 : !llvm.ptr
      %4732 = arith.constant 7 : i64
      %4733 = func.call @cc_make_string(%4731, %4732) : (!llvm.ptr, i64) -> i64
      %4734 = func.call @cc_intern(%4730, %4733) : (i64, i64) -> i64
      %4735 = func.call @cc_nil_value() : () -> i64
      %4736 = func.call @cc_cons(%4734, %4735) : (i64, i64) -> i64
      %4737 = func.call @cc_values_pack(%4736) : (i64) -> i64
      func.call @stack_push_pointer(%4734) : (i64) -> ()
      %4738 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4601) : (i64) -> ()
      %4739 = func.call @stack_pop_pointer() : () -> i64
      %4740 = llvm.mlir.addressof @str479 : !llvm.ptr
      %4741 = arith.constant 4 : i64
      %4742 = func.call @cc_make_string(%4740, %4741) : (!llvm.ptr, i64) -> i64
      %4743 = llvm.mlir.addressof @str480 : !llvm.ptr
      %4744 = arith.constant 7 : i64
      %4745 = func.call @cc_make_string(%4743, %4744) : (!llvm.ptr, i64) -> i64
      %4746 = func.call @cc_intern(%4742, %4745) : (i64, i64) -> i64
      %4747 = func.call @cc_nil_value() : () -> i64
      %4748 = func.call @cc_cons(%4746, %4747) : (i64, i64) -> i64
      %4749 = func.call @cc_values_pack(%4748) : (i64) -> i64
      func.call @stack_push_pointer(%4746) : (i64) -> ()
      %4750 = func.call @stack_pop_pointer() : () -> i64
      %4751 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4751) : (i64) -> ()
      %4752 = func.call @stack_pop_pointer() : () -> i64
      %4753 = llvm.mlir.addressof @str481 : !llvm.ptr
      %4754 = arith.constant 4 : i64
      %4755 = func.call @cc_make_string(%4753, %4754) : (!llvm.ptr, i64) -> i64
      %4756 = llvm.mlir.addressof @str482 : !llvm.ptr
      %4757 = arith.constant 7 : i64
      %4758 = func.call @cc_make_string(%4756, %4757) : (!llvm.ptr, i64) -> i64
      %4759 = func.call @cc_intern(%4755, %4758) : (i64, i64) -> i64
      %4760 = func.call @cc_nil_value() : () -> i64
      %4761 = func.call @cc_cons(%4759, %4760) : (i64, i64) -> i64
      %4762 = func.call @cc_values_pack(%4761) : (i64) -> i64
      func.call @stack_push_pointer(%4759) : (i64) -> ()
      %4763 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4764 = func.call @stack_pop_pointer() : () -> i64
      %4765 = func.call @cc_nil_value() : () -> i64
      %4766 = func.call @cc_errorp(%4618) : (i64) -> i64
      %4767 = arith.cmpi ne, %4766, %4765 : i64
      %4768 = arith.cmpi eq, %4765, %4765 : i64
      %4769 = arith.andi %4767, %4768 : i1
      %4770 = scf.if %4769 -> (i64) {
        scf.yield %4618 : i64
      } else {
        scf.yield %4765 : i64
      }
      %4771 = func.call @cc_errorp(%4703) : (i64) -> i64
      %4772 = arith.cmpi ne, %4771, %4765 : i64
      %4773 = arith.cmpi eq, %4770, %4765 : i64
      %4774 = arith.andi %4772, %4773 : i1
      %4775 = scf.if %4774 -> (i64) {
        scf.yield %4703 : i64
      } else {
        scf.yield %4770 : i64
      }
      %4776 = func.call @cc_errorp(%4714) : (i64) -> i64
      %4777 = arith.cmpi ne, %4776, %4765 : i64
      %4778 = arith.cmpi eq, %4775, %4765 : i64
      %4779 = arith.andi %4777, %4778 : i1
      %4780 = scf.if %4779 -> (i64) {
        scf.yield %4714 : i64
      } else {
        scf.yield %4775 : i64
      }
      %4781 = func.call @cc_errorp(%4715) : (i64) -> i64
      %4782 = arith.cmpi ne, %4781, %4765 : i64
      %4783 = arith.cmpi eq, %4780, %4765 : i64
      %4784 = arith.andi %4782, %4783 : i1
      %4785 = scf.if %4784 -> (i64) {
        scf.yield %4715 : i64
      } else {
        scf.yield %4780 : i64
      }
      %4786 = func.call @cc_errorp(%4726) : (i64) -> i64
      %4787 = arith.cmpi ne, %4786, %4765 : i64
      %4788 = arith.cmpi eq, %4785, %4765 : i64
      %4789 = arith.andi %4787, %4788 : i1
      %4790 = scf.if %4789 -> (i64) {
        scf.yield %4726 : i64
      } else {
        scf.yield %4785 : i64
      }
      %4791 = func.call @cc_errorp(%4727) : (i64) -> i64
      %4792 = arith.cmpi ne, %4791, %4765 : i64
      %4793 = arith.cmpi eq, %4790, %4765 : i64
      %4794 = arith.andi %4792, %4793 : i1
      %4795 = scf.if %4794 -> (i64) {
        scf.yield %4727 : i64
      } else {
        scf.yield %4790 : i64
      }
      %4796 = func.call @cc_errorp(%4738) : (i64) -> i64
      %4797 = arith.cmpi ne, %4796, %4765 : i64
      %4798 = arith.cmpi eq, %4795, %4765 : i64
      %4799 = arith.andi %4797, %4798 : i1
      %4800 = scf.if %4799 -> (i64) {
        scf.yield %4738 : i64
      } else {
        scf.yield %4795 : i64
      }
      %4801 = func.call @cc_errorp(%4739) : (i64) -> i64
      %4802 = arith.cmpi ne, %4801, %4765 : i64
      %4803 = arith.cmpi eq, %4800, %4765 : i64
      %4804 = arith.andi %4802, %4803 : i1
      %4805 = scf.if %4804 -> (i64) {
        scf.yield %4739 : i64
      } else {
        scf.yield %4800 : i64
      }
      %4806 = func.call @cc_errorp(%4750) : (i64) -> i64
      %4807 = arith.cmpi ne, %4806, %4765 : i64
      %4808 = arith.cmpi eq, %4805, %4765 : i64
      %4809 = arith.andi %4807, %4808 : i1
      %4810 = scf.if %4809 -> (i64) {
        scf.yield %4750 : i64
      } else {
        scf.yield %4805 : i64
      }
      %4811 = func.call @cc_errorp(%4752) : (i64) -> i64
      %4812 = arith.cmpi ne, %4811, %4765 : i64
      %4813 = arith.cmpi eq, %4810, %4765 : i64
      %4814 = arith.andi %4812, %4813 : i1
      %4815 = scf.if %4814 -> (i64) {
        scf.yield %4752 : i64
      } else {
        scf.yield %4810 : i64
      }
      %4816 = func.call @cc_errorp(%4763) : (i64) -> i64
      %4817 = arith.cmpi ne, %4816, %4765 : i64
      %4818 = arith.cmpi eq, %4815, %4765 : i64
      %4819 = arith.andi %4817, %4818 : i1
      %4820 = scf.if %4819 -> (i64) {
        scf.yield %4763 : i64
      } else {
        scf.yield %4815 : i64
      }
      %4821 = func.call @cc_errorp(%4764) : (i64) -> i64
      %4822 = arith.cmpi ne, %4821, %4765 : i64
      %4823 = arith.cmpi eq, %4820, %4765 : i64
      %4824 = arith.andi %4822, %4823 : i1
      %4825 = scf.if %4824 -> (i64) {
        scf.yield %4764 : i64
      } else {
        scf.yield %4820 : i64
      }
      %4826 = arith.cmpi ne, %4825, %4765 : i64
      scf.if %4826 {
        func.call @stack_push_pointer(%4825) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4618) : (i64) -> ()
        func.call @stack_push_pointer(%4703) : (i64) -> ()
        func.call @stack_push_pointer(%4714) : (i64) -> ()
        func.call @stack_push_pointer(%4715) : (i64) -> ()
        func.call @stack_push_pointer(%4726) : (i64) -> ()
        func.call @stack_push_pointer(%4727) : (i64) -> ()
        func.call @stack_push_pointer(%4738) : (i64) -> ()
        func.call @stack_push_pointer(%4739) : (i64) -> ()
        func.call @stack_push_pointer(%4750) : (i64) -> ()
        func.call @stack_push_pointer(%4752) : (i64) -> ()
        func.call @stack_push_pointer(%4763) : (i64) -> ()
        func.call @stack_push_pointer(%4764) : (i64) -> ()
        %4827 = llvm.mlir.addressof @str483 : !llvm.ptr
        %4828 = func.call @cc_make_function_ref_const(%4827) : (!llvm.ptr) -> i64
        %4829 = arith.constant 12 : i64
        func.call @cc_funcall_stack(%4828, %4829) : (i64, i64) -> ()
      }
      %4830 = func.call @stack_pop_pointer() : () -> i64
      %4831 = func.call @cc_multiple_value_list(%4830) : (i64) -> i64
      %4832 = arith.constant 0 : i64
      %4833 = func.call @cc_box_fixnum(%4832) : (i64) -> i64
      %4834 = func.call @cc_nth(%4833, %4831) : (i64, i64) -> i64
      %4835 = arith.constant 1 : i64
      %4836 = func.call @cc_box_fixnum(%4835) : (i64) -> i64
      %4837 = func.call @cc_nth(%4836, %4831) : (i64, i64) -> i64
      %4838 = arith.constant 2 : i64
      %4839 = func.call @cc_box_fixnum(%4838) : (i64) -> i64
      %4840 = func.call @cc_nth(%4839, %4831) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %4841 = func.call @stack_depth() : () -> i64
      %4842 = arith.constant 0 : i64
      %4843 = arith.cmpi sgt, %4841, %4842 : i64
      scf.if %4843 {
        %4844 = func.call @stack_pop_pointer() : () -> i64
      }
      %4845 = llvm.mlir.addressof @str484 : !llvm.ptr
      %4846 = func.call @cc_make_function_ref_const(%4845) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4846) : (i64) -> ()
      %4847 = func.call @stack_pop_pointer() : () -> i64
      %4848 = func.call @cc_nil_value() : () -> i64
      %4849 = arith.constant 1 : i1
      %4850 = arith.constant 0 : i1
      %4851 = arith.constant 1 : i1
      %4852:2 = scf.if %4849 -> (i64, i1) {
        %4853 = func.call @cc_nil_value() : () -> i64
        %4854 = func.call @cc_nil_value() : () -> i64
        %4855 = func.call @cc_errorp(%4853) : (i64) -> i64
        %4856 = arith.cmpi ne, %4855, %4854 : i64
        %4857 = scf.if %4856 -> (i64) {
          scf.yield %4853 : i64
        } else {
          func.call @stack_push_pointer(%4600) : (i64) -> ()
          %4858 = func.call @stack_pop_pointer() : () -> i64
          %4859 = func.call @cc_nil_value() : () -> i64
          %4860 = func.call @cc_errorp(%4858) : (i64) -> i64
          %4861 = arith.cmpi ne, %4860, %4859 : i64
          %4862 = arith.cmpi eq, %4859, %4859 : i64
          %4863 = arith.andi %4861, %4862 : i1
          %4864 = scf.if %4863 -> (i64) {
            scf.yield %4858 : i64
          } else {
            scf.yield %4859 : i64
          }
          %4865 = arith.cmpi ne, %4864, %4859 : i64
          scf.if %4865 {
            func.call @stack_push_pointer(%4864) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4858) : (i64) -> ()
            %4866 = llvm.mlir.addressof @str485 : !llvm.ptr
            %4867 = func.call @cc_make_function_ref_const(%4866) : (!llvm.ptr) -> i64
            %4868 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4867, %4868) : (i64, i64) -> ()
          }
          %4869 = func.call @stack_pop_pointer() : () -> i64
          %4870 = func.call @cc_length(%4869) : (i64) -> i64
          func.call @stack_push_pointer(%4870) : (i64) -> ()
          %4871 = func.call @stack_pop_pointer() : () -> i64
          %4872 = func.call @cc_unbox_fixnum(%4871) : (i64) -> i64
          %4873 = arith.constant 0 : i64
          %4874 = arith.cmpi eq, %4872, %4873 : i64
          %4875 = func.call @cc_t_value() : () -> i64
          %4876 = func.call @cc_nil_value() : () -> i64
          %4877 = arith.select %4874, %4875, %4876 : i64
          func.call @stack_push_pointer(%4877) : (i64) -> ()
          %4878 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4601) : (i64) -> ()
          %4879 = func.call @stack_pop_pointer() : () -> i64
          %4880 = func.call @cc_nil_value() : () -> i64
          %4881 = func.call @cc_errorp(%4879) : (i64) -> i64
          %4882 = arith.cmpi ne, %4881, %4880 : i64
          %4883 = arith.cmpi eq, %4880, %4880 : i64
          %4884 = arith.andi %4882, %4883 : i1
          %4885 = scf.if %4884 -> (i64) {
            scf.yield %4879 : i64
          } else {
            scf.yield %4880 : i64
          }
          %4886 = arith.cmpi ne, %4885, %4880 : i64
          scf.if %4886 {
            func.call @stack_push_pointer(%4885) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%4879) : (i64) -> ()
            %4887 = llvm.mlir.addressof @str486 : !llvm.ptr
            %4888 = func.call @cc_make_function_ref_const(%4887) : (!llvm.ptr) -> i64
            %4889 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%4888, %4889) : (i64, i64) -> ()
          }
          %4890 = func.call @stack_pop_pointer() : () -> i64
          %4891 = func.call @cc_length(%4890) : (i64) -> i64
          func.call @stack_push_pointer(%4891) : (i64) -> ()
          %4892 = func.call @stack_pop_pointer() : () -> i64
          %4893 = func.call @cc_unbox_fixnum(%4892) : (i64) -> i64
          %4894 = arith.constant 0 : i64
          %4895 = arith.cmpi eq, %4893, %4894 : i64
          %4896 = func.call @cc_t_value() : () -> i64
          %4897 = func.call @cc_nil_value() : () -> i64
          %4898 = arith.select %4895, %4896, %4897 : i64
          func.call @stack_push_pointer(%4898) : (i64) -> ()
          %4899 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %4900 = func.call @stack_pop_pointer() : () -> i64
          %4901 = func.call @cc_cons(%4899, %4900) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4901) : (i64) -> ()
          %4902 = func.call @stack_pop_pointer() : () -> i64
          %4903 = func.call @cc_cons(%4878, %4902) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4903) : (i64) -> ()
          %4904 = func.call @stack_pop_pointer() : () -> i64
          %4905 = func.call @cc_values_pack(%4904) : (i64) -> i64
          func.call @stack_push_pointer(%4905) : (i64) -> ()
          %4906 = func.call @stack_pop_pointer() : () -> i64
          %4907 = func.call @cc_multiple_value_list(%4906) : (i64) -> i64
          %4908 = func.call @cc_t_value() : () -> i64
          %4909 = llvm.mlir.addressof @str487 : !llvm.ptr
          %4910 = arith.constant 38 : i64
          %4911 = func.call @cc_make_string(%4909, %4910) : (!llvm.ptr, i64) -> i64
          %4912 = func.call @cc_nil_value() : () -> i64
          %4913 = func.call @cc_intern(%4911, %4912) : (i64, i64) -> i64
          %4914 = func.call @cc_nil_value() : () -> i64
          %4915 = func.call @cc_cons(%4913, %4914) : (i64, i64) -> i64
          %4916 = func.call @cc_values_pack(%4915) : (i64) -> i64
          %4917 = func.call @cc_set_symbol_value(%4913, %4908) : (i64, i64) -> i64
          %4918 = llvm.mlir.addressof @str488 : !llvm.ptr
          %4919 = arith.constant 39 : i64
          %4920 = func.call @cc_make_string(%4918, %4919) : (!llvm.ptr, i64) -> i64
          %4921 = func.call @cc_nil_value() : () -> i64
          %4922 = func.call @cc_intern(%4920, %4921) : (i64, i64) -> i64
          %4923 = func.call @cc_nil_value() : () -> i64
          %4924 = func.call @cc_cons(%4922, %4923) : (i64, i64) -> i64
          %4925 = func.call @cc_values_pack(%4924) : (i64) -> i64
          %4926 = func.call @cc_set_symbol_value(%4922, %4906) : (i64, i64) -> i64
          %4927 = llvm.mlir.addressof @str489 : !llvm.ptr
          %4928 = arith.constant 40 : i64
          %4929 = func.call @cc_make_string(%4927, %4928) : (!llvm.ptr, i64) -> i64
          %4930 = func.call @cc_nil_value() : () -> i64
          %4931 = func.call @cc_intern(%4929, %4930) : (i64, i64) -> i64
          %4932 = func.call @cc_nil_value() : () -> i64
          %4933 = func.call @cc_cons(%4931, %4932) : (i64, i64) -> i64
          %4934 = func.call @cc_values_pack(%4933) : (i64) -> i64
          %4935 = func.call @cc_set_symbol_value(%4931, %4907) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4906) : (i64) -> ()
          %4936 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4936 : i64
        }
        func.call @stack_push_pointer(%4857) : (i64) -> ()
        %4937 = func.call @stack_pop_pointer() : () -> i64
        %4938 = func.call @cc_multiple_value_list(%4937) : (i64) -> i64
        %4939 = func.call @cc_nil_value() : () -> i64
        %4940 = llvm.mlir.addressof @str490 : !llvm.ptr
        %4941 = arith.constant 38 : i64
        %4942 = func.call @cc_make_string(%4940, %4941) : (!llvm.ptr, i64) -> i64
        %4943 = func.call @cc_nil_value() : () -> i64
        %4944 = func.call @cc_intern(%4942, %4943) : (i64, i64) -> i64
        %4945 = func.call @cc_nil_value() : () -> i64
        %4946 = func.call @cc_cons(%4944, %4945) : (i64, i64) -> i64
        %4947 = func.call @cc_values_pack(%4946) : (i64) -> i64
        %4948 = func.call @cc_symbol_value(%4944) : (i64) -> i64
        %4949 = arith.cmpi ne, %4948, %4939 : i64
        %4950 = llvm.mlir.addressof @str491 : !llvm.ptr
        %4951 = arith.constant 38 : i64
        %4952 = func.call @cc_make_string(%4950, %4951) : (!llvm.ptr, i64) -> i64
        %4953 = func.call @cc_nil_value() : () -> i64
        %4954 = func.call @cc_intern(%4952, %4953) : (i64, i64) -> i64
        %4955 = func.call @cc_nil_value() : () -> i64
        %4956 = func.call @cc_cons(%4954, %4955) : (i64, i64) -> i64
        %4957 = func.call @cc_values_pack(%4956) : (i64) -> i64
        %4958 = func.call @cc_symbol_value(%4954) : (i64) -> i64
        %4959 = arith.cmpi ne, %4958, %4939 : i64
        %4960 = arith.ori %4949, %4959 : i1
        %4961:2 = scf.if %4960 -> (i64, i1) {
          %4962 = func.call @cc_values_pack(%4938) : (i64) -> i64
          func.call @stack_push_pointer(%4962) : (i64) -> ()
          scf.yield %4848, %4850 : i64, i1
        } else {
          %4963 = func.call @cc_append(%4848, %4938) : (i64, i64) -> i64
          scf.yield %4963, %4851 : i64, i1
        }
        scf.yield %4961#0, %4961#1 : i64, i1
      } else {
        scf.yield %4848, %4850 : i64, i1
      }
      %4964:2 = scf.if %4852#1 -> (i64, i1) {
        func.call @stack_push_pointer(%4840) : (i64) -> ()
        %4965 = func.call @stack_pop_pointer() : () -> i64
        %4966 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%4966) : (i64) -> ()
        %4967 = func.call @stack_pop_pointer() : () -> i64
        %4968 = func.call @cc_nil_value() : () -> i64
        %4969 = func.call @cc_errorp(%4965) : (i64) -> i64
        %4970 = arith.cmpi ne, %4969, %4968 : i64
        %4971 = arith.cmpi eq, %4968, %4968 : i64
        %4972 = arith.andi %4970, %4971 : i1
        %4973 = scf.if %4972 -> (i64) {
          scf.yield %4965 : i64
        } else {
          scf.yield %4968 : i64
        }
        %4974 = func.call @cc_errorp(%4967) : (i64) -> i64
        %4975 = arith.cmpi ne, %4974, %4968 : i64
        %4976 = arith.cmpi eq, %4973, %4968 : i64
        %4977 = arith.andi %4975, %4976 : i1
        %4978 = scf.if %4977 -> (i64) {
          scf.yield %4967 : i64
        } else {
          scf.yield %4973 : i64
        }
        %4979 = arith.cmpi ne, %4978, %4968 : i64
        scf.if %4979 {
          func.call @stack_push_pointer(%4978) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4965) : (i64) -> ()
          func.call @stack_push_pointer(%4967) : (i64) -> ()
          %4980 = llvm.mlir.addressof @str492 : !llvm.ptr
          %4981 = func.call @cc_make_function_ref_const(%4980) : (!llvm.ptr) -> i64
          %4982 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%4981, %4982) : (i64, i64) -> ()
        }
        %4983 = func.call @stack_pop_pointer() : () -> i64
        %4984 = func.call @cc_multiple_value_list(%4983) : (i64) -> i64
        %4985 = func.call @cc_nil_value() : () -> i64
        %4986 = llvm.mlir.addressof @str493 : !llvm.ptr
        %4987 = arith.constant 38 : i64
        %4988 = func.call @cc_make_string(%4986, %4987) : (!llvm.ptr, i64) -> i64
        %4989 = func.call @cc_nil_value() : () -> i64
        %4990 = func.call @cc_intern(%4988, %4989) : (i64, i64) -> i64
        %4991 = func.call @cc_nil_value() : () -> i64
        %4992 = func.call @cc_cons(%4990, %4991) : (i64, i64) -> i64
        %4993 = func.call @cc_values_pack(%4992) : (i64) -> i64
        %4994 = func.call @cc_symbol_value(%4990) : (i64) -> i64
        %4995 = arith.cmpi ne, %4994, %4985 : i64
        %4996 = llvm.mlir.addressof @str494 : !llvm.ptr
        %4997 = arith.constant 38 : i64
        %4998 = func.call @cc_make_string(%4996, %4997) : (!llvm.ptr, i64) -> i64
        %4999 = func.call @cc_nil_value() : () -> i64
        %5000 = func.call @cc_intern(%4998, %4999) : (i64, i64) -> i64
        %5001 = func.call @cc_nil_value() : () -> i64
        %5002 = func.call @cc_cons(%5000, %5001) : (i64, i64) -> i64
        %5003 = func.call @cc_values_pack(%5002) : (i64) -> i64
        %5004 = func.call @cc_symbol_value(%5000) : (i64) -> i64
        %5005 = arith.cmpi ne, %5004, %4985 : i64
        %5006 = arith.ori %4995, %5005 : i1
        %5007:2 = scf.if %5006 -> (i64, i1) {
          %5008 = func.call @cc_values_pack(%4984) : (i64) -> i64
          func.call @stack_push_pointer(%5008) : (i64) -> ()
          scf.yield %4852#0, %4850 : i64, i1
        } else {
          %5009 = func.call @cc_append(%4852#0, %4984) : (i64, i64) -> i64
          scf.yield %5009, %4851 : i64, i1
        }
        scf.yield %5007#0, %5007#1 : i64, i1
      } else {
        scf.yield %4852#0, %4850 : i64, i1
      }
      scf.if %4964#1 {
        %5010 = func.call @cc_apply(%4847, %4964#0) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5010) : (i64) -> ()
      } else {
      }
      %5011 = func.call @stack_pop_pointer() : () -> i64
      %5012 = func.call @cc_nil_value() : () -> i64
      %5013 = func.call @cc_errorp(%5011) : (i64) -> i64
      %5014 = arith.cmpi ne, %5013, %5012 : i64
      %5015 = scf.if %5014 -> (i64) {
        scf.yield %5011 : i64
      } else {
        %5016 = func.call @cc_get_output_stream_string(%4601) : (i64) -> i64
        scf.yield %5016 : i64
      }
      func.call @stack_push_pointer(%5015) : (i64) -> ()
      %5017 = func.call @stack_pop_pointer() : () -> i64
      %5018 = func.call @cc_nil_value() : () -> i64
      %5019 = func.call @cc_errorp(%5017) : (i64) -> i64
      %5020 = arith.cmpi ne, %5019, %5018 : i64
      %5021 = scf.if %5020 -> (i64) {
        scf.yield %5017 : i64
      } else {
        %5022 = func.call @cc_get_output_stream_string(%4600) : (i64) -> i64
        scf.yield %5022 : i64
      }
      func.call @stack_push_pointer(%5021) : (i64) -> ()
      %5023 = func.call @stack_pop_pointer() : () -> i64
      %5024 = func.call @cc_multiple_value_list(%5023) : (i64) -> i64
      %5025 = llvm.mlir.addressof @str495 : !llvm.ptr
      %5026 = arith.constant 38 : i64
      %5027 = func.call @cc_make_string(%5025, %5026) : (!llvm.ptr, i64) -> i64
      %5028 = func.call @cc_nil_value() : () -> i64
      %5029 = func.call @cc_intern(%5027, %5028) : (i64, i64) -> i64
      %5030 = func.call @cc_nil_value() : () -> i64
      %5031 = func.call @cc_cons(%5029, %5030) : (i64, i64) -> i64
      %5032 = func.call @cc_values_pack(%5031) : (i64) -> i64
      %5033 = func.call @cc_symbol_value(%5029) : (i64) -> i64
      %5034 = llvm.mlir.addressof @str496 : !llvm.ptr
      %5035 = arith.constant 39 : i64
      %5036 = func.call @cc_make_string(%5034, %5035) : (!llvm.ptr, i64) -> i64
      %5037 = func.call @cc_nil_value() : () -> i64
      %5038 = func.call @cc_intern(%5036, %5037) : (i64, i64) -> i64
      %5039 = func.call @cc_nil_value() : () -> i64
      %5040 = func.call @cc_cons(%5038, %5039) : (i64, i64) -> i64
      %5041 = func.call @cc_values_pack(%5040) : (i64) -> i64
      %5042 = func.call @cc_symbol_value(%5038) : (i64) -> i64
      %5043 = llvm.mlir.addressof @str497 : !llvm.ptr
      %5044 = arith.constant 40 : i64
      %5045 = func.call @cc_make_string(%5043, %5044) : (!llvm.ptr, i64) -> i64
      %5046 = func.call @cc_nil_value() : () -> i64
      %5047 = func.call @cc_intern(%5045, %5046) : (i64, i64) -> i64
      %5048 = func.call @cc_nil_value() : () -> i64
      %5049 = func.call @cc_cons(%5047, %5048) : (i64, i64) -> i64
      %5050 = func.call @cc_values_pack(%5049) : (i64) -> i64
      %5051 = func.call @cc_symbol_value(%5047) : (i64) -> i64
      %5052 = func.call @cc_nil_value() : () -> i64
      %5053 = arith.cmpi ne, %5033, %5052 : i64
      %5054 = scf.if %5053 -> (i64) {
        scf.yield %5051 : i64
      } else {
        scf.yield %5024 : i64
      }
      %5055 = func.call @cc_values_pack(%5054) : (i64) -> i64
      func.call @stack_push_pointer(%5055) : (i64) -> ()
      %5056 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5056 : i64
    }
    func.call @stack_push_pointer(%4571) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str1("COMMON-LISP:STREAM\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_263377075044352*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_263377075044352*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_263377075044352*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_263377075044353*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_263377075044353*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_263377075044353*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETVALUE_263377075044354*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETMVLIST_263377075044354*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETFLAG_263377075044352*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETFLAG_263377075044353*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str14("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("READ-LINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str17("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETVALUE_263377075044354*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_263377075044354*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETFLAG_263377075044354*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETVALUE_263377075044354*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETMVLIST_263377075044354*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETFLAG_263377075044353*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETVALUE_263377075044353*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str27("*__MLIR_BLOCK_RETMVLIST_263377075044353*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETFLAG_263377075044352*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETMVLIST_263377075044352*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str30("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETVALUE_263377075044355*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str33("*__MLIR_BLOCK_RETMVLIST_263377075044355*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str34("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str36("si:argv\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str37("*PROGRAM-FILENAME*\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str38("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str39("%FN%with-run-program\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str40("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str41("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str42("%FN%with-run-program\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str43("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str44("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str45("%FN%with-run-program\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str46("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str47("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str48("%FN%with-run-program\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str49("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str50("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str51("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str52("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str53("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str54("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str55("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str56("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str57("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str58("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str59("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str60("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str61("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str62("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str63("RUN-PROGRAM-ARGCOUNT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str64("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str65("ARGCOUNT-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str66("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str67("b c\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str68("d \5C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str69("e 4\5C\0A\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str70("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str71("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str72("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str73("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str74("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str75("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str76("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str77("(defparameter *args-number* 18)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str78("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str79("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str80("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str81("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str82("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str83("(ARGCOUNT-TEST)\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str84("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str85("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str86("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str87("b c\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str88("d \5C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str89("e 4\5C\0A\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str90("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str91("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str92("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str93("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str94("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str95("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str96("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str97("#:%%DYN-CELL-263377075044357-ARGCOUNT-TEST\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str98("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str99("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str100("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str102("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str103("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str104("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str105("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str106("OUTPUT-STREAMS.1\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str107("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str108("PRINT-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str109("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str110("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str111("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str112("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str113("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str114("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str115("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str118("PRINT-TEST-ERR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str119("EXTERNAL-PROCESS-ERROR-STREAM\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str120("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str121("PROCESS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str122("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str125("PRINT-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str126("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str127("PRINT-TEST-ERR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str128("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str129("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str131("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str132("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str133("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str134("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str135("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str136("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str137("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str138("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str139("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str140("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str141("(PRINT-TEST)\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str142("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str143("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str144("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str145("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str146("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str147("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str148("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str149("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str150("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str151("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str153("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str155("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str156("ext::external-process-error-stream\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str157("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str158("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str159("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str160("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str161("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str162("#:%%DYN-CELL-263377075044359-PRINT-TEST\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str163("#:%%DYN-CELL-263377075044360-PROCESS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str164("Hello stdout\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str165("Hello stderr\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str166("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str167("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str168("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str170("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str171("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str172("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str173("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str174("OUTPUT-STREAMS.2\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str175("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str176("PRINT-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str177("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str178("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str179("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str180("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str181("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str182("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str183("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str184("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str186("PRINT-TEST-ERR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str187("EXTERNAL-PROCESS-ERROR-STREAM\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str188("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str189("PROCESS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str190("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str191("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str192("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str193("PRINT-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str194("SLURP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str195("PRINT-TEST-ERR\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str196("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str197("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str198("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str199("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str200("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str201("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str202("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str203("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str204("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str205("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str206("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str207("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str208("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str209("(PRINT-TEST)\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str210("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str211("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str212("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str213("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str214("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str215("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str216("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str217("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str218("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str219("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str220("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str221("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str222("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str223("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str224("ext::external-process-error-stream\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str225("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str226("%FN%slurp\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str227("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str228("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str229("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str230("#:%%DYN-CELL-263377075044362-PRINT-TEST\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str231("#:%%DYN-CELL-263377075044363-PROCESS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str232("Hello stderr\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str233("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str234("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str235("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str236("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str237("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str238("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str239("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str240("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str241("INTERACTIVE-INPUT.1\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str242("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str243("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str244("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str247("42~%\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str248("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str249("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str250("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str251("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str252("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str253("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str254("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str255("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str256("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str257("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str258("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str259("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str260("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str261("(IO/ERR)\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str262("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str263("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str264("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str265("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str266("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str267("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str268("42~%\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str269("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str270("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str271("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str272("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str273("#:%%DYN-CELL-263377075044365-IO/ERR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str274("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str275("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str276("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str277("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str278("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str279("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str280("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str281("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str282("INTERACTIVE-INPUT.2\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str283("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str284("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str285("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str288("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str290("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str291("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str292("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str293("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str294("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str295("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str296("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str297("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str298("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str299("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str300("(IO/ERR)\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str301("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str302("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str303("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str304("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str305("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str306("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str307("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str308("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str309("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str310("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str311("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str312("#:%%DYN-CELL-263377075044367-IO/ERR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str313("EXITED\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str314("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str315("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str317("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str318("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str319("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str320("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str321("NON-FD-STREAMS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str322("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str323("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str324("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str326("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str327("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str329("WITH-INPUT-FROM-STRING\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str330("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str331("INPUT-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str332("42 \00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str333("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str334("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str335("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str336("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str337("INPUT-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str338("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str339("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str340("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str341("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str342("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str343("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str344("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str345("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str346("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("ZEROP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str348("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str349("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str350("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str351("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str352("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str353("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str354("ZEROP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str355("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str356("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str357("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str358("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str359("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str360("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str361("*__MLIR_BLOCK_RETFLAG_263377075044369*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str362("*__MLIR_BLOCK_RETVALUE_263377075044369*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str363("*__MLIR_BLOCK_RETMVLIST_263377075044369*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str364("42 \00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str365("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str366("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str367("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str368("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str369("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str370("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str371("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str372("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str373("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str374("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str375("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str376("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str377("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str378("(IO/ERR)\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str379("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str380("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str381("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str382("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str383("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str384("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str385("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str386("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str387("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str388("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str389("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str390("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str391("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str392("*__MLIR_BLOCK_RETFLAG_263377075044369*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str393("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str394("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str395("*__MLIR_BLOCK_RETFLAG_263377075044369*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str396("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str397("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str398("*__MLIR_BLOCK_RETFLAG_263377075044369*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str399("*__MLIR_BLOCK_RETVALUE_263377075044369*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str400("*__MLIR_BLOCK_RETMVLIST_263377075044369*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str401("*__MLIR_BLOCK_RETFLAG_263377075044369*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str402("*__MLIR_BLOCK_RETVALUE_263377075044369*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str403("*__MLIR_BLOCK_RETMVLIST_263377075044369*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str404("#:%%DYN-CELL-263377075044370-IO/ERR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str405("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str406("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str407("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str408("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str409("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str410("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str411("EMPTY-STRING-INPUT-STREAM\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str412("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str413("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str414("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str415("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str416("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str417("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str418("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str419("WITH-INPUT-FROM-STRING\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str420("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str421("INPUT-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str422("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str423("WITH-RUN-PROGRAM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str424("IO/ERR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str425("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str426("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str427("INPUT-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str428("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str429("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str430("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str431("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str432("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str433("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str434("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str435("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str436("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str437("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str438("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str439("ZEROP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str440("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str441("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str442("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str443("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str444("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str445("OUTPUT-STREAM\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str446("ZEROP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str447("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str448("LENGTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str449("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str450("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str451("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str452("ERROR-STREAM\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str453("*__MLIR_BLOCK_RETFLAG_263377075044372*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str454("*__MLIR_BLOCK_RETVALUE_263377075044372*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str455("*__MLIR_BLOCK_RETMVLIST_263377075044372*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str456("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str457("*BINARY*\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str458("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str459("--norc\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str460("--base\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str461("--feature\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str462("ignore-extensions\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str463("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str464("(defparameter *args-number* 14)\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str465("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str466("(setf *load-verbose* nil)\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str467("--load\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str468("sys:src;lisp;regression-tests;external-process-programs.lisp\00") : !llvm.array<61 x i8>
  llvm.mlir.global private constant @str469("--eval\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str470("(IO/ERR)\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str471("--quit\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str472("--\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str473("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str474("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str475("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str476("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str477("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str478("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str479("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str480("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str481("WAIT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str482("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str483("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str484("COMMON-LISP::VALUES\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str485("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str486("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str487("*__MLIR_BLOCK_RETFLAG_263377075044372*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str488("*__MLIR_BLOCK_RETVALUE_263377075044372*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str489("*__MLIR_BLOCK_RETMVLIST_263377075044372*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str490("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str491("*__MLIR_BLOCK_RETFLAG_263377075044372*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str492("ext:external-process-wait\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str493("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str494("*__MLIR_BLOCK_RETFLAG_263377075044372*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str495("*__MLIR_BLOCK_RETFLAG_263377075044372*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str496("*__MLIR_BLOCK_RETVALUE_263377075044372*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str497("*__MLIR_BLOCK_RETMVLIST_263377075044372*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str498("#:%%DYN-CELL-263377075044373-IO/ERR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str499("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str500("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str501("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str502("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str503("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str504("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str505("*__MLIR_BLOCK_RETFLAG_263377075044355*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str506("*__MLIR_BLOCK_RETMVLIST_263377075044355*\00") : !llvm.array<41 x i8>
}
