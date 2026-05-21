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
  func.func @"%FN%finalized-objects"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 17 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 7 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = func.call @stack_pop_pointer() : () -> i64
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
    %42 = arith.constant 0 : i64
    func.call @stack_push_fixnum(%42) : (i64) -> ()
    %43 = func.call @stack_pop_pointer() : () -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_errorp(%43) : (i64) -> i64
    %46 = arith.cmpi ne, %45, %44 : i64
    %47 = arith.cmpi eq, %44, %44 : i64
    %48 = arith.andi %46, %47 : i1
    %49 = scf.if %48 -> (i64) {
      scf.yield %43 : i64
    } else {
      scf.yield %44 : i64
    }
    %50 = arith.cmpi ne, %49, %44 : i64
    scf.if %50 {
      func.call @stack_push_pointer(%49) : (i64) -> ()
    } else {
      %51 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%51) : (i64) -> ()
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %52 = arith.addi %43, %__rlasp_stack_elide_zero_0 : i64
      %53 = func.call @stack_pop_pointer() : () -> i64
      %54 = func.call @cc_cons(%52, %53) : (i64, i64) -> i64
      func.call @stack_push_pointer(%54) : (i64) -> ()
    }
    %55 = func.call @stack_pop_pointer() : () -> i64
    %56 = llvm.mlir.addressof @str5 : !llvm.ptr
    %57 = arith.constant 35 : i64
    %58 = func.call @cc_make_symbol(%56, %57) : (!llvm.ptr, i64) -> i64
    %59 = func.call @cc_persistent_root_value(%58) : (i64) -> i64
    %60 = func.call @cc_set_symbol_value(%59, %55) : (i64, i64) -> i64
    %61 = func.call @cc_nil_value() : () -> i64
    %62 = func.call @cc_nil_value() : () -> i64
    %63 = func.call @cc_errorp(%61) : (i64) -> i64
    %64 = arith.cmpi ne, %63, %62 : i64
    %65 = scf.if %64 -> (i64) {
      scf.yield %61 : i64
    } else {
      func.call @stack_push_pointer(%59) : (i64) -> ()
      %114 = arith.constant 236837129945091 : i64
      %115 = arith.constant 1 : i64
      %116 = func.call @cc_make_closure(%114, %115) : (i64, i64) -> i64
      %117 = llvm.mlir.addressof @str6 : !llvm.ptr
      %118 = arith.constant 3 : i64
      %119 = func.call @cc_bind_function_object_const(%117, %118, %116) : (!llvm.ptr, i64, i64) -> i64
      %120 = arith.constant 0 : i64
      %121 = func.call @cc_box_fixnum(%120) : (i64) -> i64
      %122 = func.call @cc_nil_value() : () -> i64
      %123 = func.call @cc_nil_value() : () -> i64
      %124 = func.call @cc_nil_value() : () -> i64
      %125 = func.call @cc_nil_value() : () -> i64
      %126 = func.call @cc_errorp(%124) : (i64) -> i64
      %127 = arith.cmpi ne, %126, %125 : i64
      %128 = scf.if %127 -> (i64) {
        scf.yield %124 : i64
      } else {
        %129 = func.call @cc_nil_value() : () -> i64
        %130 = llvm.mlir.addressof @str7 : !llvm.ptr
        %131 = arith.constant 38 : i64
        %132 = func.call @cc_make_string(%130, %131) : (!llvm.ptr, i64) -> i64
        %133 = func.call @cc_nil_value() : () -> i64
        %134 = func.call @cc_intern(%132, %133) : (i64, i64) -> i64
        %135 = func.call @cc_nil_value() : () -> i64
        %136 = func.call @cc_cons(%134, %135) : (i64, i64) -> i64
        %137 = func.call @cc_values_pack(%136) : (i64) -> i64
        %138 = func.call @cc_set_symbol_value(%134, %129) : (i64, i64) -> i64
        %139 = llvm.mlir.addressof @str8 : !llvm.ptr
        %140 = arith.constant 39 : i64
        %141 = func.call @cc_make_string(%139, %140) : (!llvm.ptr, i64) -> i64
        %142 = func.call @cc_nil_value() : () -> i64
        %143 = func.call @cc_intern(%141, %142) : (i64, i64) -> i64
        %144 = func.call @cc_nil_value() : () -> i64
        %145 = func.call @cc_cons(%143, %144) : (i64, i64) -> i64
        %146 = func.call @cc_values_pack(%145) : (i64) -> i64
        %147 = func.call @cc_set_symbol_value(%143, %129) : (i64, i64) -> i64
        %148 = llvm.mlir.addressof @str9 : !llvm.ptr
        %149 = arith.constant 40 : i64
        %150 = func.call @cc_make_string(%148, %149) : (!llvm.ptr, i64) -> i64
        %151 = func.call @cc_nil_value() : () -> i64
        %152 = func.call @cc_intern(%150, %151) : (i64, i64) -> i64
        %153 = func.call @cc_nil_value() : () -> i64
        %154 = func.call @cc_cons(%152, %153) : (i64, i64) -> i64
        %155 = func.call @cc_values_pack(%154) : (i64) -> i64
        %156 = func.call @cc_set_symbol_value(%152, %129) : (i64, i64) -> i64
        %157:3 = scf.while (%arg0 = %122, %arg1 = %123, %arg2 = %121) : (i64, i64, i64) -> (i64, i64, i64) {
          %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
          %158 = arith.addi %arg2, %__rlasp_stack_elide_zero_1 : i64
          %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
          %159 = arith.addi %12, %__rlasp_stack_elide_zero_2 : i64
          %160 = arith.constant 1 : i1
          %162 = arith.constant 3 : i64
          %161 = arith.andi %158, %162 : i64
          %163 = arith.constant 0 : i64
          %164 = arith.cmpi eq, %161, %163 : i64
          %166 = arith.constant 3 : i64
          %165 = arith.andi %159, %166 : i64
          %167 = arith.constant 0 : i64
          %168 = arith.cmpi eq, %165, %167 : i64
          %169 = arith.andi %164, %168 : i1
          %170 = scf.if %169 -> (i1) {
            %171 = arith.constant 2 : i64
            %172 = arith.shrsi %158, %171 : i64
            %173 = arith.constant 2 : i64
            %174 = arith.shrsi %159, %173 : i64
            %175 = arith.cmpi slt, %172, %174 : i64
            scf.yield %175 : i1
          } else {
            %176 = func.call @cc_lt(%158, %159) : (i64, i64) -> i64
            %177 = func.call @cc_nil_value() : () -> i64
            %178 = arith.cmpi ne, %176, %177 : i64
            scf.yield %178 : i1
          }
          %179 = arith.andi %160, %170 : i1
          %180 = func.call @cc_nil_value() : () -> i64
          %181 = func.call @cc_t_value() : () -> i64
          %182 = scf.if %179 -> (i64) {
            scf.yield %181 : i64
          } else {
            scf.yield %180 : i64
          }
          %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
          %183 = arith.addi %182, %__rlasp_stack_elide_zero_3 : i64
          %184 = func.call @cc_nil_value() : () -> i64
          %185 = arith.cmpi ne, %183, %184 : i64
          %186 = func.call @cc_nil_value() : () -> i64
          %187 = llvm.mlir.addressof @str10 : !llvm.ptr
          %188 = arith.constant 38 : i64
          %189 = func.call @cc_make_string(%187, %188) : (!llvm.ptr, i64) -> i64
          %190 = func.call @cc_nil_value() : () -> i64
          %191 = func.call @cc_intern(%189, %190) : (i64, i64) -> i64
          %192 = func.call @cc_nil_value() : () -> i64
          %193 = func.call @cc_cons(%191, %192) : (i64, i64) -> i64
          %194 = func.call @cc_values_pack(%193) : (i64) -> i64
          %195 = func.call @cc_symbol_value(%191) : (i64) -> i64
          %196 = arith.cmpi ne, %195, %186 : i64
          %197 = llvm.mlir.addressof @str11 : !llvm.ptr
          %198 = arith.constant 38 : i64
          %199 = func.call @cc_make_string(%197, %198) : (!llvm.ptr, i64) -> i64
          %200 = func.call @cc_nil_value() : () -> i64
          %201 = func.call @cc_intern(%199, %200) : (i64, i64) -> i64
          %202 = func.call @cc_nil_value() : () -> i64
          %203 = func.call @cc_cons(%201, %202) : (i64, i64) -> i64
          %204 = func.call @cc_values_pack(%203) : (i64) -> i64
          %205 = func.call @cc_symbol_value(%201) : (i64) -> i64
          %206 = arith.cmpi ne, %205, %186 : i64
          %207 = arith.ori %196, %206 : i1
          %208 = arith.constant 0 : i1
          %209 = arith.cmpi eq, %207, %208 : i1
          %210 = arith.andi %185, %209 : i1
          scf.condition(%210) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%211: i64, %212: i64, %213: i64):
          %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
          %214 = arith.addi %13, %__rlasp_stack_elide_zero_4 : i64
          %215 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%214, %215) : (i64, i64) -> ()
          %216 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%216) : (i64) -> ()
          %217 = func.call @stack_depth() : () -> i64
          %218 = arith.constant 0 : i64
          %219 = arith.cmpi sgt, %217, %218 : i64
          scf.if %219 {
            %220 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
          %221 = arith.addi %116, %__rlasp_stack_elide_zero_5 : i64
          %222 = func.call @cc_nil_value() : () -> i64
          %223 = func.call @cc_errorp(%216) : (i64) -> i64
          %224 = arith.cmpi ne, %223, %222 : i64
          %225 = arith.cmpi eq, %222, %222 : i64
          %226 = arith.andi %224, %225 : i1
          %227 = scf.if %226 -> (i64) {
            scf.yield %216 : i64
          } else {
            scf.yield %222 : i64
          }
          %228 = func.call @cc_errorp(%221) : (i64) -> i64
          %229 = arith.cmpi ne, %228, %222 : i64
          %230 = arith.cmpi eq, %227, %222 : i64
          %231 = arith.andi %229, %230 : i1
          %232 = scf.if %231 -> (i64) {
            scf.yield %221 : i64
          } else {
            scf.yield %227 : i64
          }
          %233 = arith.cmpi ne, %232, %222 : i64
          scf.if %233 {
            func.call @stack_push_pointer(%232) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%216) : (i64) -> ()
            func.call @stack_push_pointer(%221) : (i64) -> ()
            %234 = llvm.mlir.addressof @str12 : !llvm.ptr
            %235 = func.call @cc_make_function_ref_const(%234) : (!llvm.ptr) -> i64
            %236 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%235, %236) : (i64, i64) -> ()
          }
          %237 = func.call @stack_depth() : () -> i64
          %238 = arith.constant 0 : i64
          %239 = arith.cmpi sgt, %237, %238 : i64
          scf.if %239 {
            %240 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%212) : (i64) -> ()
          %241 = func.call @cc_nil_value() : () -> i64
          %242 = func.call @cc_errorp(%216) : (i64) -> i64
          %243 = arith.cmpi ne, %242, %241 : i64
          %244 = arith.cmpi eq, %241, %241 : i64
          %245 = arith.andi %243, %244 : i1
          %246 = scf.if %245 -> (i64) {
            scf.yield %216 : i64
          } else {
            scf.yield %241 : i64
          }
          %247 = arith.cmpi ne, %246, %241 : i64
          scf.if %247 {
            func.call @stack_push_pointer(%246) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%216) : (i64) -> ()
            %248 = llvm.mlir.addressof @str13 : !llvm.ptr
            %249 = func.call @cc_make_function_ref_const(%248) : (!llvm.ptr) -> i64
            %250 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%249, %250) : (i64, i64) -> ()
          }
          %251 = func.call @stack_pop_pointer() : () -> i64
          %252 = func.call @cc_nil_value() : () -> i64
          %253 = func.call @cc_errorp(%251) : (i64) -> i64
          %254 = arith.cmpi ne, %253, %252 : i64
          %255 = arith.cmpi eq, %252, %252 : i64
          %256 = arith.andi %254, %255 : i1
          %257 = scf.if %256 -> (i64) {
            scf.yield %251 : i64
          } else {
            scf.yield %252 : i64
          }
          %258 = arith.cmpi ne, %257, %252 : i64
          scf.if %258 {
            func.call @stack_push_pointer(%257) : (i64) -> ()
          } else {
            %259 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%259) : (i64) -> ()
            %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
            %260 = arith.addi %251, %__rlasp_stack_elide_zero_6 : i64
            %261 = func.call @stack_pop_pointer() : () -> i64
            %262 = func.call @cc_cons(%260, %261) : (i64, i64) -> i64
            func.call @stack_push_pointer(%262) : (i64) -> ()
          }
          %263 = func.call @stack_pop_pointer() : () -> i64
          %264 = func.call @stack_pop_pointer() : () -> i64
          %265 = func.call @cc_append(%264, %263) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
          %266 = arith.addi %265, %__rlasp_stack_elide_zero_7 : i64
          func.call @stack_push_pointer(%266) : (i64) -> ()
          %267 = func.call @stack_depth() : () -> i64
          %268 = arith.constant 0 : i64
          %269 = arith.cmpi sgt, %267, %268 : i64
          scf.if %269 {
            %270 = func.call @stack_pop_pointer() : () -> i64
          }
          %271 = arith.constant 1 : i64
          %272 = func.call @cc_box_fixnum(%271) : (i64) -> i64
          %274 = arith.constant 3 : i64
          %273 = arith.andi %213, %274 : i64
          %275 = arith.constant 0 : i64
          %276 = arith.cmpi eq, %273, %275 : i64
          %278 = arith.constant 3 : i64
          %277 = arith.andi %272, %278 : i64
          %279 = arith.constant 0 : i64
          %280 = arith.cmpi eq, %277, %279 : i64
          %281 = arith.andi %276, %280 : i1
          %282 = scf.if %281 -> (i64) {
            %283 = arith.constant 2 : i64
            %284 = arith.shrsi %213, %283 : i64
            %285 = arith.constant 2 : i64
            %286 = arith.shrsi %272, %285 : i64
            %287 = arith.addi %284, %286 : i64
            %288 = arith.constant -2305843009213693952 : i64
            %289 = arith.constant 2305843009213693951 : i64
            %290 = arith.cmpi sge, %287, %288 : i64
            %291 = arith.cmpi sle, %287, %289 : i64
            %292 = arith.andi %290, %291 : i1
            %293 = scf.if %292 -> (i64) {
              %294 = arith.constant 2 : i64
              %295 = arith.shli %287, %294 : i64
              scf.yield %295 : i64
            } else {
              %296 = func.call @cc_add(%213, %272) : (i64, i64) -> i64
              scf.yield %296 : i64
            }
            scf.yield %293 : i64
          } else {
            %297 = func.call @cc_add(%213, %272) : (i64, i64) -> i64
            scf.yield %297 : i64
          }
          %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
          %298 = arith.addi %282, %__rlasp_stack_elide_zero_8 : i64
          func.call @stack_push_pointer(%298) : (i64) -> ()
          %299 = func.call @stack_depth() : () -> i64
          %300 = arith.constant 0 : i64
          %301 = arith.cmpi sgt, %299, %300 : i64
          scf.if %301 {
            %302 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %216, %266, %298 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %303 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
        %304 = arith.addi %157#1, %__rlasp_stack_elide_zero_9 : i64
        %305 = func.call @cc_multiple_value_list(%304) : (i64) -> i64
        %306 = llvm.mlir.addressof @str14 : !llvm.ptr
        %307 = arith.constant 38 : i64
        %308 = func.call @cc_make_string(%306, %307) : (!llvm.ptr, i64) -> i64
        %309 = func.call @cc_nil_value() : () -> i64
        %310 = func.call @cc_intern(%308, %309) : (i64, i64) -> i64
        %311 = func.call @cc_nil_value() : () -> i64
        %312 = func.call @cc_cons(%310, %311) : (i64, i64) -> i64
        %313 = func.call @cc_values_pack(%312) : (i64) -> i64
        %314 = func.call @cc_symbol_value(%310) : (i64) -> i64
        %315 = llvm.mlir.addressof @str15 : !llvm.ptr
        %316 = arith.constant 39 : i64
        %317 = func.call @cc_make_string(%315, %316) : (!llvm.ptr, i64) -> i64
        %318 = func.call @cc_nil_value() : () -> i64
        %319 = func.call @cc_intern(%317, %318) : (i64, i64) -> i64
        %320 = func.call @cc_nil_value() : () -> i64
        %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
        %322 = func.call @cc_values_pack(%321) : (i64) -> i64
        %323 = func.call @cc_symbol_value(%319) : (i64) -> i64
        %324 = llvm.mlir.addressof @str16 : !llvm.ptr
        %325 = arith.constant 40 : i64
        %326 = func.call @cc_make_string(%324, %325) : (!llvm.ptr, i64) -> i64
        %327 = func.call @cc_nil_value() : () -> i64
        %328 = func.call @cc_intern(%326, %327) : (i64, i64) -> i64
        %329 = func.call @cc_nil_value() : () -> i64
        %330 = func.call @cc_cons(%328, %329) : (i64, i64) -> i64
        %331 = func.call @cc_values_pack(%330) : (i64) -> i64
        %332 = func.call @cc_symbol_value(%328) : (i64) -> i64
        %333 = func.call @cc_nil_value() : () -> i64
        %334 = arith.cmpi ne, %314, %333 : i64
        %335 = scf.if %334 -> (i64) {
          scf.yield %332 : i64
        } else {
          scf.yield %305 : i64
        }
        %336 = func.call @cc_values_pack(%335) : (i64) -> i64
        %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
        %337 = arith.addi %336, %__rlasp_stack_elide_zero_10 : i64
        scf.yield %337 : i64
      }
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %338 = arith.addi %128, %__rlasp_stack_elide_zero_11 : i64
      func.call @stack_push_pointer(%59) : (i64) -> ()
      %350 = arith.constant 236837129945093 : i64
      %351 = arith.constant 1 : i64
      %352 = func.call @cc_make_closure(%350, %351) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %353 = arith.addi %352, %__rlasp_stack_elide_zero_12 : i64
      func.call @stack_push_nil() : () -> ()
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @cc_cons(%353, %354) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %356 = arith.addi %355, %__rlasp_stack_elide_zero_13 : i64
      %357 = func.call @cc_cons(%338, %356) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %358 = arith.addi %357, %__rlasp_stack_elide_zero_14 : i64
      %359 = func.call @cc_values_pack(%358) : (i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %360 = arith.addi %359, %__rlasp_stack_elide_zero_15 : i64
      %361 = func.call @cc_multiple_value_list(%360) : (i64) -> i64
      %362 = func.call @cc_symbol_value(%59) : (i64) -> i64
      %363 = func.call @cc_values_pack(%361) : (i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %364 = arith.addi %363, %__rlasp_stack_elide_zero_16 : i64
      scf.yield %364 : i64
    }
    %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
    %365 = arith.addi %65, %__rlasp_stack_elide_zero_17 : i64
    %366 = func.call @cc_multiple_value_list(%365) : (i64) -> i64
    %367 = llvm.mlir.addressof @str17 : !llvm.ptr
    %368 = arith.constant 38 : i64
    %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
    %370 = func.call @cc_nil_value() : () -> i64
    %371 = func.call @cc_intern(%369, %370) : (i64, i64) -> i64
    %372 = func.call @cc_nil_value() : () -> i64
    %373 = func.call @cc_cons(%371, %372) : (i64, i64) -> i64
    %374 = func.call @cc_values_pack(%373) : (i64) -> i64
    %375 = func.call @cc_symbol_value(%371) : (i64) -> i64
    %376 = llvm.mlir.addressof @str18 : !llvm.ptr
    %377 = arith.constant 40 : i64
    %378 = func.call @cc_make_string(%376, %377) : (!llvm.ptr, i64) -> i64
    %379 = func.call @cc_nil_value() : () -> i64
    %380 = func.call @cc_intern(%378, %379) : (i64, i64) -> i64
    %381 = func.call @cc_nil_value() : () -> i64
    %382 = func.call @cc_cons(%380, %381) : (i64, i64) -> i64
    %383 = func.call @cc_values_pack(%382) : (i64) -> i64
    %384 = func.call @cc_symbol_value(%380) : (i64) -> i64
    %385 = func.call @cc_nil_value() : () -> i64
    %386 = arith.cmpi ne, %375, %385 : i64
    %387 = scf.if %386 -> (i64) {
      scf.yield %384 : i64
    } else {
      scf.yield %366 : i64
    }
    %388 = func.call @cc_values_pack(%387) : (i64) -> i64
    func.call @stack_push_pointer(%388) : (i64) -> ()
    func.return
  }
  func.func @"%FN%test-finalizers"() {
    %389 = llvm.mlir.addressof @str19 : !llvm.ptr
    %390 = arith.constant 15 : i64
    %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
    %392 = func.call @cc_nil_value() : () -> i64
    %393 = func.call @cc_intern(%391, %392) : (i64, i64) -> i64
    %394 = func.call @cc_nil_value() : () -> i64
    %395 = func.call @cc_cons(%393, %394) : (i64, i64) -> i64
    %396 = func.call @cc_values_pack(%395) : (i64) -> i64
    %397 = llvm.mlir.addressof @str20 : !llvm.ptr
    %398 = arith.constant 7 : i64
    %399 = func.call @cc_make_string(%397, %398) : (!llvm.ptr, i64) -> i64
    %400 = func.call @cc_register_function_lambda_list_metadata_raw(%393, %399) : (i64, i64) -> i64
    %401 = func.call @stack_pop_pointer() : () -> i64
    %402 = func.call @stack_pop_pointer() : () -> i64
    %403 = func.call @cc_nil_value() : () -> i64
    %404 = llvm.mlir.addressof @str21 : !llvm.ptr
    %405 = arith.constant 38 : i64
    %406 = func.call @cc_make_string(%404, %405) : (!llvm.ptr, i64) -> i64
    %407 = func.call @cc_nil_value() : () -> i64
    %408 = func.call @cc_intern(%406, %407) : (i64, i64) -> i64
    %409 = func.call @cc_nil_value() : () -> i64
    %410 = func.call @cc_cons(%408, %409) : (i64, i64) -> i64
    %411 = func.call @cc_values_pack(%410) : (i64) -> i64
    %412 = func.call @cc_set_symbol_value(%408, %403) : (i64, i64) -> i64
    %413 = llvm.mlir.addressof @str22 : !llvm.ptr
    %414 = arith.constant 39 : i64
    %415 = func.call @cc_make_string(%413, %414) : (!llvm.ptr, i64) -> i64
    %416 = func.call @cc_nil_value() : () -> i64
    %417 = func.call @cc_intern(%415, %416) : (i64, i64) -> i64
    %418 = func.call @cc_nil_value() : () -> i64
    %419 = func.call @cc_cons(%417, %418) : (i64, i64) -> i64
    %420 = func.call @cc_values_pack(%419) : (i64) -> i64
    %421 = func.call @cc_set_symbol_value(%417, %403) : (i64, i64) -> i64
    %422 = llvm.mlir.addressof @str23 : !llvm.ptr
    %423 = arith.constant 40 : i64
    %424 = func.call @cc_make_string(%422, %423) : (!llvm.ptr, i64) -> i64
    %425 = func.call @cc_nil_value() : () -> i64
    %426 = func.call @cc_intern(%424, %425) : (i64, i64) -> i64
    %427 = func.call @cc_nil_value() : () -> i64
    %428 = func.call @cc_cons(%426, %427) : (i64, i64) -> i64
    %429 = func.call @cc_values_pack(%428) : (i64) -> i64
    %430 = func.call @cc_set_symbol_value(%426, %403) : (i64, i64) -> i64
    %431 = func.call @cc_nil_value() : () -> i64
    %432 = func.call @cc_errorp(%402) : (i64) -> i64
    %433 = arith.cmpi ne, %432, %431 : i64
    %434 = arith.cmpi eq, %431, %431 : i64
    %435 = arith.andi %433, %434 : i1
    %436 = scf.if %435 -> (i64) {
      scf.yield %402 : i64
    } else {
      scf.yield %431 : i64
    }
    %437 = func.call @cc_errorp(%401) : (i64) -> i64
    %438 = arith.cmpi ne, %437, %431 : i64
    %439 = arith.cmpi eq, %436, %431 : i64
    %440 = arith.andi %438, %439 : i1
    %441 = scf.if %440 -> (i64) {
      scf.yield %401 : i64
    } else {
      scf.yield %436 : i64
    }
    %442 = arith.cmpi ne, %441, %431 : i64
    scf.if %442 {
      func.call @stack_push_pointer(%441) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%402) : (i64) -> ()
      func.call @stack_push_pointer(%401) : (i64) -> ()
      %443 = llvm.mlir.addressof @str24 : !llvm.ptr
      %444 = func.call @cc_make_function_ref_const(%443) : (!llvm.ptr) -> i64
      %445 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%444, %445) : (i64, i64) -> ()
    }
    %446 = func.call @stack_pop_pointer() : () -> i64
    %447 = func.call @cc_multiple_value_list(%446) : (i64) -> i64
    %448 = arith.constant 0 : i64
    %449 = func.call @cc_box_fixnum(%448) : (i64) -> i64
    %450 = func.call @cc_nth(%449, %447) : (i64, i64) -> i64
    %451 = arith.constant 1 : i64
    %452 = func.call @cc_box_fixnum(%451) : (i64) -> i64
    %453 = func.call @cc_nth(%452, %447) : (i64, i64) -> i64
    %454 = arith.constant 10 : i64
    %455 = func.call @cc_box_fixnum(%454) : (i64) -> i64
    %456 = arith.constant 0 : i64
    %457 = func.call @cc_box_fixnum(%456) : (i64) -> i64
    %458 = func.call @cc_nil_value() : () -> i64
    %459 = func.call @cc_nil_value() : () -> i64
    %460 = func.call @cc_errorp(%458) : (i64) -> i64
    %461 = arith.cmpi ne, %460, %459 : i64
    %462 = scf.if %461 -> (i64) {
      scf.yield %458 : i64
    } else {
      %463 = func.call @cc_nil_value() : () -> i64
      %464 = llvm.mlir.addressof @str25 : !llvm.ptr
      %465 = arith.constant 38 : i64
      %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
      %467 = func.call @cc_nil_value() : () -> i64
      %468 = func.call @cc_intern(%466, %467) : (i64, i64) -> i64
      %469 = func.call @cc_nil_value() : () -> i64
      %470 = func.call @cc_cons(%468, %469) : (i64, i64) -> i64
      %471 = func.call @cc_values_pack(%470) : (i64) -> i64
      %472 = func.call @cc_set_symbol_value(%468, %463) : (i64, i64) -> i64
      %473 = llvm.mlir.addressof @str26 : !llvm.ptr
      %474 = arith.constant 39 : i64
      %475 = func.call @cc_make_string(%473, %474) : (!llvm.ptr, i64) -> i64
      %476 = func.call @cc_nil_value() : () -> i64
      %477 = func.call @cc_intern(%475, %476) : (i64, i64) -> i64
      %478 = func.call @cc_nil_value() : () -> i64
      %479 = func.call @cc_cons(%477, %478) : (i64, i64) -> i64
      %480 = func.call @cc_values_pack(%479) : (i64) -> i64
      %481 = func.call @cc_set_symbol_value(%477, %463) : (i64, i64) -> i64
      %482 = llvm.mlir.addressof @str27 : !llvm.ptr
      %483 = arith.constant 40 : i64
      %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
      %485 = func.call @cc_nil_value() : () -> i64
      %486 = func.call @cc_intern(%484, %485) : (i64, i64) -> i64
      %487 = func.call @cc_nil_value() : () -> i64
      %488 = func.call @cc_cons(%486, %487) : (i64, i64) -> i64
      %489 = func.call @cc_values_pack(%488) : (i64) -> i64
      %490 = func.call @cc_set_symbol_value(%486, %463) : (i64, i64) -> i64
      %491:1 = scf.while (%arg0 = %457) : (i64) -> (i64) {
        %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
        %492 = arith.addi %arg0, %__rlasp_stack_elide_zero_18 : i64
        %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
        %493 = arith.addi %455, %__rlasp_stack_elide_zero_19 : i64
        %494 = arith.constant 1 : i1
        %496 = arith.constant 3 : i64
        %495 = arith.andi %492, %496 : i64
        %497 = arith.constant 0 : i64
        %498 = arith.cmpi eq, %495, %497 : i64
        %500 = arith.constant 3 : i64
        %499 = arith.andi %493, %500 : i64
        %501 = arith.constant 0 : i64
        %502 = arith.cmpi eq, %499, %501 : i64
        %503 = arith.andi %498, %502 : i1
        %504 = scf.if %503 -> (i1) {
          %505 = arith.constant 2 : i64
          %506 = arith.shrsi %492, %505 : i64
          %507 = arith.constant 2 : i64
          %508 = arith.shrsi %493, %507 : i64
          %509 = arith.cmpi slt, %506, %508 : i64
          scf.yield %509 : i1
        } else {
          %510 = func.call @cc_lt(%492, %493) : (i64, i64) -> i64
          %511 = func.call @cc_nil_value() : () -> i64
          %512 = arith.cmpi ne, %510, %511 : i64
          scf.yield %512 : i1
        }
        %513 = arith.andi %494, %504 : i1
        %514 = func.call @cc_nil_value() : () -> i64
        %515 = func.call @cc_t_value() : () -> i64
        %516 = scf.if %513 -> (i64) {
          scf.yield %515 : i64
        } else {
          scf.yield %514 : i64
        }
        %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
        %517 = arith.addi %516, %__rlasp_stack_elide_zero_20 : i64
        %518 = func.call @cc_nil_value() : () -> i64
        %519 = arith.cmpi ne, %517, %518 : i64
        %520 = func.call @cc_nil_value() : () -> i64
        %521 = llvm.mlir.addressof @str28 : !llvm.ptr
        %522 = arith.constant 38 : i64
        %523 = func.call @cc_make_string(%521, %522) : (!llvm.ptr, i64) -> i64
        %524 = func.call @cc_nil_value() : () -> i64
        %525 = func.call @cc_intern(%523, %524) : (i64, i64) -> i64
        %526 = func.call @cc_nil_value() : () -> i64
        %527 = func.call @cc_cons(%525, %526) : (i64, i64) -> i64
        %528 = func.call @cc_values_pack(%527) : (i64) -> i64
        %529 = func.call @cc_symbol_value(%525) : (i64) -> i64
        %530 = arith.cmpi ne, %529, %520 : i64
        %531 = llvm.mlir.addressof @str29 : !llvm.ptr
        %532 = arith.constant 38 : i64
        %533 = func.call @cc_make_string(%531, %532) : (!llvm.ptr, i64) -> i64
        %534 = func.call @cc_nil_value() : () -> i64
        %535 = func.call @cc_intern(%533, %534) : (i64, i64) -> i64
        %536 = func.call @cc_nil_value() : () -> i64
        %537 = func.call @cc_cons(%535, %536) : (i64, i64) -> i64
        %538 = func.call @cc_values_pack(%537) : (i64) -> i64
        %539 = func.call @cc_symbol_value(%535) : (i64) -> i64
        %540 = arith.cmpi ne, %539, %520 : i64
        %541 = arith.ori %530, %540 : i1
        %542 = arith.constant 0 : i1
        %543 = arith.cmpi eq, %541, %542 : i1
        %544 = arith.andi %519, %543 : i1
        scf.condition(%544) %arg0 : i64
      } do {
        ^bb0(%545: i64):
        %546 = func.call @cc_nil_value() : () -> i64
        %547 = arith.cmpi ne, %546, %546 : i64
        scf.if %547 {
          func.call @stack_push_pointer(%546) : (i64) -> ()
        } else {
          %548 = llvm.mlir.addressof @str30 : !llvm.ptr
          %549 = func.call @cc_make_function_ref_const(%548) : (!llvm.ptr) -> i64
          %550 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%549, %550) : (i64, i64) -> ()
        }
        %551 = func.call @stack_depth() : () -> i64
        %552 = arith.constant 0 : i64
        %553 = arith.cmpi sgt, %551, %552 : i64
        scf.if %553 {
          %554 = func.call @stack_pop_pointer() : () -> i64
        }
        %555 = arith.constant 1 : i64
        %556 = func.call @cc_box_fixnum(%555) : (i64) -> i64
        %558 = arith.constant 3 : i64
        %557 = arith.andi %545, %558 : i64
        %559 = arith.constant 0 : i64
        %560 = arith.cmpi eq, %557, %559 : i64
        %562 = arith.constant 3 : i64
        %561 = arith.andi %556, %562 : i64
        %563 = arith.constant 0 : i64
        %564 = arith.cmpi eq, %561, %563 : i64
        %565 = arith.andi %560, %564 : i1
        %566 = scf.if %565 -> (i64) {
          %567 = arith.constant 2 : i64
          %568 = arith.shrsi %545, %567 : i64
          %569 = arith.constant 2 : i64
          %570 = arith.shrsi %556, %569 : i64
          %571 = arith.addi %568, %570 : i64
          %572 = arith.constant -2305843009213693952 : i64
          %573 = arith.constant 2305843009213693951 : i64
          %574 = arith.cmpi sge, %571, %572 : i64
          %575 = arith.cmpi sle, %571, %573 : i64
          %576 = arith.andi %574, %575 : i1
          %577 = scf.if %576 -> (i64) {
            %578 = arith.constant 2 : i64
            %579 = arith.shli %571, %578 : i64
            scf.yield %579 : i64
          } else {
            %580 = func.call @cc_add(%545, %556) : (i64, i64) -> i64
            scf.yield %580 : i64
          }
          scf.yield %577 : i64
        } else {
          %581 = func.call @cc_add(%545, %556) : (i64, i64) -> i64
          scf.yield %581 : i64
        }
        %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
        %582 = arith.addi %566, %__rlasp_stack_elide_zero_21 : i64
        func.call @stack_push_pointer(%582) : (i64) -> ()
        %583 = func.call @stack_depth() : () -> i64
        %584 = arith.constant 0 : i64
        %585 = arith.cmpi sgt, %583, %584 : i64
        scf.if %585 {
          %586 = func.call @stack_pop_pointer() : () -> i64
        }
        scf.yield %582 : i64
      }
      func.call @stack_push_nil() : () -> ()
      %587 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %588 = func.call @stack_pop_pointer() : () -> i64
      %589 = func.call @cc_multiple_value_list(%588) : (i64) -> i64
      %590 = llvm.mlir.addressof @str31 : !llvm.ptr
      %591 = arith.constant 38 : i64
      %592 = func.call @cc_make_string(%590, %591) : (!llvm.ptr, i64) -> i64
      %593 = func.call @cc_nil_value() : () -> i64
      %594 = func.call @cc_intern(%592, %593) : (i64, i64) -> i64
      %595 = func.call @cc_nil_value() : () -> i64
      %596 = func.call @cc_cons(%594, %595) : (i64, i64) -> i64
      %597 = func.call @cc_values_pack(%596) : (i64) -> i64
      %598 = func.call @cc_symbol_value(%594) : (i64) -> i64
      %599 = llvm.mlir.addressof @str32 : !llvm.ptr
      %600 = arith.constant 39 : i64
      %601 = func.call @cc_make_string(%599, %600) : (!llvm.ptr, i64) -> i64
      %602 = func.call @cc_nil_value() : () -> i64
      %603 = func.call @cc_intern(%601, %602) : (i64, i64) -> i64
      %604 = func.call @cc_nil_value() : () -> i64
      %605 = func.call @cc_cons(%603, %604) : (i64, i64) -> i64
      %606 = func.call @cc_values_pack(%605) : (i64) -> i64
      %607 = func.call @cc_symbol_value(%603) : (i64) -> i64
      %608 = llvm.mlir.addressof @str33 : !llvm.ptr
      %609 = arith.constant 40 : i64
      %610 = func.call @cc_make_string(%608, %609) : (!llvm.ptr, i64) -> i64
      %611 = func.call @cc_nil_value() : () -> i64
      %612 = func.call @cc_intern(%610, %611) : (i64, i64) -> i64
      %613 = func.call @cc_nil_value() : () -> i64
      %614 = func.call @cc_cons(%612, %613) : (i64, i64) -> i64
      %615 = func.call @cc_values_pack(%614) : (i64) -> i64
      %616 = func.call @cc_symbol_value(%612) : (i64) -> i64
      %617 = func.call @cc_nil_value() : () -> i64
      %618 = arith.cmpi ne, %598, %617 : i64
      %619 = scf.if %618 -> (i64) {
        scf.yield %616 : i64
      } else {
        scf.yield %589 : i64
      }
      %620 = func.call @cc_values_pack(%619) : (i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %621 = arith.addi %620, %__rlasp_stack_elide_zero_22 : i64
      scf.yield %621 : i64
    }
    func.call @stack_push_pointer(%462) : (i64) -> ()
    %622 = func.call @stack_depth() : () -> i64
    %623 = arith.constant 0 : i64
    %624 = arith.cmpi sgt, %622, %623 : i64
    scf.if %624 {
      %625 = func.call @stack_pop_pointer() : () -> i64
    }
    %626 = func.call @cc_nil_value() : () -> i64
    %627 = arith.cmpi ne, %626, %626 : i64
    scf.if %627 {
      func.call @stack_push_pointer(%626) : (i64) -> ()
    } else {
      %628 = llvm.mlir.addressof @str34 : !llvm.ptr
      %629 = func.call @cc_make_function_ref_const(%628) : (!llvm.ptr) -> i64
      %630 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%629, %630) : (i64, i64) -> ()
    }
    %631 = func.call @stack_depth() : () -> i64
    %632 = arith.constant 0 : i64
    %633 = arith.cmpi sgt, %631, %632 : i64
    scf.if %633 {
      %634 = func.call @stack_pop_pointer() : () -> i64
    }
    %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
    %635 = arith.addi %453, %__rlasp_stack_elide_zero_23 : i64
    %636 = arith.constant 0 : i64
    func.call @cc_funcall_stack(%635, %636) : (i64, i64) -> ()
    %637 = func.call @stack_pop_pointer() : () -> i64
    %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
    %638 = arith.addi %637, %__rlasp_stack_elide_zero_24 : i64
    %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
    %639 = arith.addi %401, %__rlasp_stack_elide_zero_25 : i64
    %640 = func.call @cc_div(%638, %639) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
    %641 = arith.addi %640, %__rlasp_stack_elide_zero_26 : i64
    %642 = llvm.mlir.addressof @str35 : !llvm.ptr
    %643 = func.call @cc_make_function_ref_const(%642) : (!llvm.ptr) -> i64
    %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
    %644 = arith.addi %643, %__rlasp_stack_elide_zero_27 : i64
    %645 = func.call @cc_nil_value() : () -> i64
    %646 = func.call @cc_errorp(%644) : (i64) -> i64
    %647 = arith.cmpi ne, %646, %645 : i64
    %648 = arith.cmpi eq, %645, %645 : i64
    %649 = arith.andi %647, %648 : i1
    %650 = scf.if %649 -> (i64) {
      scf.yield %644 : i64
    } else {
      scf.yield %645 : i64
    }
    %651 = func.call @cc_errorp(%450) : (i64) -> i64
    %652 = arith.cmpi ne, %651, %645 : i64
    %653 = arith.cmpi eq, %650, %645 : i64
    %654 = arith.andi %652, %653 : i1
    %655 = scf.if %654 -> (i64) {
      scf.yield %450 : i64
    } else {
      scf.yield %650 : i64
    }
    %656 = arith.cmpi ne, %655, %645 : i64
    scf.if %656 {
      func.call @stack_push_pointer(%655) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%644) : (i64) -> ()
      func.call @stack_push_pointer(%450) : (i64) -> ()
      %657 = llvm.mlir.addressof @str36 : !llvm.ptr
      %658 = func.call @cc_make_function_ref_const(%657) : (!llvm.ptr) -> i64
      %659 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%658, %659) : (i64, i64) -> ()
    }
    %660 = func.call @stack_pop_pointer() : () -> i64
    %662 = arith.constant 3 : i64
    %661 = arith.andi %637, %662 : i64
    %663 = arith.constant 0 : i64
    %664 = arith.cmpi eq, %661, %663 : i64
    %666 = arith.constant 3 : i64
    %665 = arith.andi %660, %666 : i64
    %667 = arith.constant 0 : i64
    %668 = arith.cmpi eq, %665, %667 : i64
    %669 = arith.andi %664, %668 : i1
    %670 = scf.if %669 -> (i64) {
      %671 = arith.constant 2 : i64
      %672 = arith.shrsi %637, %671 : i64
      %673 = arith.constant 2 : i64
      %674 = arith.shrsi %660, %673 : i64
      %675 = arith.addi %672, %674 : i64
      %676 = arith.constant -2305843009213693952 : i64
      %677 = arith.constant 2305843009213693951 : i64
      %678 = arith.cmpi sge, %675, %676 : i64
      %679 = arith.cmpi sle, %675, %677 : i64
      %680 = arith.andi %678, %679 : i1
      %681 = scf.if %680 -> (i64) {
        %682 = arith.constant 2 : i64
        %683 = arith.shli %675, %682 : i64
        scf.yield %683 : i64
      } else {
        %684 = func.call @cc_add(%637, %660) : (i64, i64) -> i64
        scf.yield %684 : i64
      }
      scf.yield %681 : i64
    } else {
      %685 = func.call @cc_add(%637, %660) : (i64, i64) -> i64
      scf.yield %685 : i64
    }
    %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
    %686 = arith.addi %670, %__rlasp_stack_elide_zero_28 : i64
    %687 = func.call @cc_nil_value() : () -> i64
    %688 = func.call @cc_nil_value() : () -> i64
    %689 = func.call @cc_errorp(%687) : (i64) -> i64
    %690 = arith.cmpi ne, %689, %688 : i64
    %691 = scf.if %690 -> (i64) {
      scf.yield %687 : i64
    } else {
      %692 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %693 = arith.addi %641, %__rlasp_stack_elide_zero_29 : i64
      %694 = arith.constant 95 : i64
      func.call @stack_push_fixnum(%694) : (i64) -> ()
      %695 = func.call @stack_pop_pointer() : () -> i64
      %696 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%696) : (i64) -> ()
      %697 = func.call @stack_pop_pointer() : () -> i64
      %698 = func.call @cc_div(%695, %697) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %699 = arith.addi %698, %__rlasp_stack_elide_zero_30 : i64
      %700 = arith.constant 1 : i1
      %702 = arith.constant 3 : i64
      %701 = arith.andi %693, %702 : i64
      %703 = arith.constant 0 : i64
      %704 = arith.cmpi eq, %701, %703 : i64
      %706 = arith.constant 3 : i64
      %705 = arith.andi %699, %706 : i64
      %707 = arith.constant 0 : i64
      %708 = arith.cmpi eq, %705, %707 : i64
      %709 = arith.andi %704, %708 : i1
      %710 = scf.if %709 -> (i1) {
        %711 = arith.constant 2 : i64
        %712 = arith.shrsi %693, %711 : i64
        %713 = arith.constant 2 : i64
        %714 = arith.shrsi %699, %713 : i64
        %715 = arith.cmpi sgt, %712, %714 : i64
        scf.yield %715 : i1
      } else {
        %716 = func.call @cc_gt(%693, %699) : (i64, i64) -> i64
        %717 = func.call @cc_nil_value() : () -> i64
        %718 = arith.cmpi ne, %716, %717 : i64
        scf.yield %718 : i1
      }
      %719 = arith.andi %700, %710 : i1
      %720 = func.call @cc_nil_value() : () -> i64
      %721 = func.call @cc_t_value() : () -> i64
      %722 = scf.if %719 -> (i64) {
        scf.yield %721 : i64
      } else {
        scf.yield %720 : i64
      }
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %723 = arith.addi %722, %__rlasp_stack_elide_zero_31 : i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %724 = arith.addi %641, %__rlasp_stack_elide_zero_32 : i64
      %725 = func.call @cc_cons(%724, %692) : (i64, i64) -> i64
      %726 = func.call @cc_cons(%723, %725) : (i64, i64) -> i64
      %727 = func.call @cc_or(%726) : (i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %728 = arith.addi %727, %__rlasp_stack_elide_zero_33 : i64
      %729 = func.call @cc_nil_value() : () -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %730 = arith.addi %401, %__rlasp_stack_elide_zero_34 : i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %731 = arith.addi %686, %__rlasp_stack_elide_zero_35 : i64
      %732 = arith.constant 1 : i1
      %734 = arith.constant 3 : i64
      %733 = arith.andi %730, %734 : i64
      %735 = arith.constant 0 : i64
      %736 = arith.cmpi eq, %733, %735 : i64
      %738 = arith.constant 3 : i64
      %737 = arith.andi %731, %738 : i64
      %739 = arith.constant 0 : i64
      %740 = arith.cmpi eq, %737, %739 : i64
      %741 = arith.andi %736, %740 : i1
      %742 = scf.if %741 -> (i1) {
        %743 = arith.constant 2 : i64
        %744 = arith.shrsi %730, %743 : i64
        %745 = arith.constant 2 : i64
        %746 = arith.shrsi %731, %745 : i64
        %747 = arith.cmpi sge, %744, %746 : i64
        scf.yield %747 : i1
      } else {
        %748 = func.call @cc_ge(%730, %731) : (i64, i64) -> i64
        %749 = func.call @cc_nil_value() : () -> i64
        %750 = arith.cmpi ne, %748, %749 : i64
        scf.yield %750 : i1
      }
      %751 = arith.andi %732, %742 : i1
      %752 = func.call @cc_nil_value() : () -> i64
      %753 = func.call @cc_t_value() : () -> i64
      %754 = scf.if %751 -> (i64) {
        scf.yield %753 : i64
      } else {
        scf.yield %752 : i64
      }
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %755 = arith.addi %754, %__rlasp_stack_elide_zero_36 : i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %756 = arith.addi %686, %__rlasp_stack_elide_zero_37 : i64
      %757 = func.call @cc_cons(%756, %729) : (i64, i64) -> i64
      %758 = func.call @cc_cons(%755, %757) : (i64, i64) -> i64
      %759 = func.call @cc_or(%758) : (i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %760 = arith.addi %759, %__rlasp_stack_elide_zero_38 : i64
      func.call @stack_push_nil() : () -> ()
      %761 = func.call @stack_pop_pointer() : () -> i64
      %762 = func.call @cc_cons(%760, %761) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %763 = arith.addi %762, %__rlasp_stack_elide_zero_39 : i64
      %764 = func.call @cc_cons(%728, %763) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %765 = arith.addi %764, %__rlasp_stack_elide_zero_40 : i64
      %766 = func.call @cc_values_pack(%765) : (i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %767 = arith.addi %766, %__rlasp_stack_elide_zero_41 : i64
      scf.yield %767 : i64
    }
    %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
    %768 = arith.addi %691, %__rlasp_stack_elide_zero_42 : i64
    %769 = func.call @cc_multiple_value_list(%768) : (i64) -> i64
    %770 = llvm.mlir.addressof @str37 : !llvm.ptr
    %771 = arith.constant 38 : i64
    %772 = func.call @cc_make_string(%770, %771) : (!llvm.ptr, i64) -> i64
    %773 = func.call @cc_nil_value() : () -> i64
    %774 = func.call @cc_intern(%772, %773) : (i64, i64) -> i64
    %775 = func.call @cc_nil_value() : () -> i64
    %776 = func.call @cc_cons(%774, %775) : (i64, i64) -> i64
    %777 = func.call @cc_values_pack(%776) : (i64) -> i64
    %778 = func.call @cc_symbol_value(%774) : (i64) -> i64
    %779 = llvm.mlir.addressof @str38 : !llvm.ptr
    %780 = arith.constant 40 : i64
    %781 = func.call @cc_make_string(%779, %780) : (!llvm.ptr, i64) -> i64
    %782 = func.call @cc_nil_value() : () -> i64
    %783 = func.call @cc_intern(%781, %782) : (i64, i64) -> i64
    %784 = func.call @cc_nil_value() : () -> i64
    %785 = func.call @cc_cons(%783, %784) : (i64, i64) -> i64
    %786 = func.call @cc_values_pack(%785) : (i64) -> i64
    %787 = func.call @cc_symbol_value(%783) : (i64) -> i64
    %788 = func.call @cc_nil_value() : () -> i64
    %789 = arith.cmpi ne, %778, %788 : i64
    %790 = scf.if %789 -> (i64) {
      scf.yield %787 : i64
    } else {
      scf.yield %769 : i64
    }
    %791 = func.call @cc_values_pack(%790) : (i64) -> i64
    func.call @stack_push_pointer(%791) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %792 = llvm.mlir.addressof @str39 : !llvm.ptr
    %793 = arith.constant 6 : i64
    %794 = func.call @cc_make_string(%792, %793) : (!llvm.ptr, i64) -> i64
    %795 = func.call @cc_nil_value() : () -> i64
    %796 = func.call @cc_intern(%794, %795) : (i64, i64) -> i64
    %797 = func.call @cc_nil_value() : () -> i64
    %798 = func.call @cc_cons(%796, %797) : (i64, i64) -> i64
    %799 = func.call @cc_values_pack(%798) : (i64) -> i64
    %800 = func.call @cc_nil_value() : () -> i64
    %801 = llvm.mlir.addressof @str40 : !llvm.ptr
    %802 = arith.constant 38 : i64
    %803 = func.call @cc_make_string(%801, %802) : (!llvm.ptr, i64) -> i64
    %804 = func.call @cc_nil_value() : () -> i64
    %805 = func.call @cc_intern(%803, %804) : (i64, i64) -> i64
    %806 = func.call @cc_nil_value() : () -> i64
    %807 = func.call @cc_cons(%805, %806) : (i64, i64) -> i64
    %808 = func.call @cc_values_pack(%807) : (i64) -> i64
    %809 = func.call @cc_set_symbol_value(%805, %800) : (i64, i64) -> i64
    %810 = llvm.mlir.addressof @str41 : !llvm.ptr
    %811 = arith.constant 39 : i64
    %812 = func.call @cc_make_string(%810, %811) : (!llvm.ptr, i64) -> i64
    %813 = func.call @cc_nil_value() : () -> i64
    %814 = func.call @cc_intern(%812, %813) : (i64, i64) -> i64
    %815 = func.call @cc_nil_value() : () -> i64
    %816 = func.call @cc_cons(%814, %815) : (i64, i64) -> i64
    %817 = func.call @cc_values_pack(%816) : (i64) -> i64
    %818 = func.call @cc_set_symbol_value(%814, %800) : (i64, i64) -> i64
    %819 = llvm.mlir.addressof @str42 : !llvm.ptr
    %820 = arith.constant 40 : i64
    %821 = func.call @cc_make_string(%819, %820) : (!llvm.ptr, i64) -> i64
    %822 = func.call @cc_nil_value() : () -> i64
    %823 = func.call @cc_intern(%821, %822) : (i64, i64) -> i64
    %824 = func.call @cc_nil_value() : () -> i64
    %825 = func.call @cc_cons(%823, %824) : (i64, i64) -> i64
    %826 = func.call @cc_values_pack(%825) : (i64) -> i64
    %827 = func.call @cc_set_symbol_value(%823, %800) : (i64, i64) -> i64
    %828 = func.call @cc_nil_value() : () -> i64
    %829 = func.call @cc_nil_value() : () -> i64
    %830 = func.call @cc_errorp(%828) : (i64) -> i64
    %831 = arith.cmpi ne, %830, %829 : i64
    %832 = scf.if %831 -> (i64) {
      scf.yield %828 : i64
    } else {
      %833 = func.call @cc_nil_value() : () -> i64
      %834 = func.call @cc_nil_value() : () -> i64
      %835 = func.call @cc_errorp(%833) : (i64) -> i64
      %836 = arith.cmpi ne, %835, %834 : i64
      %837 = scf.if %836 -> (i64) {
        scf.yield %833 : i64
      } else {
        %838 = llvm.mlir.addressof @str43 : !llvm.ptr
        %839 = arith.constant 13 : i64
        %840 = func.call @cc_make_string(%838, %839) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
        %841 = arith.addi %840, %__rlasp_stack_elide_zero_43 : i64
        %842 = func.call @cc_nil_value() : () -> i64
        %843 = func.call @cc_errorp(%841) : (i64) -> i64
        %844 = arith.cmpi ne, %843, %842 : i64
        %845 = arith.cmpi eq, %842, %842 : i64
        %846 = arith.andi %844, %845 : i1
        %847 = scf.if %846 -> (i64) {
          scf.yield %841 : i64
        } else {
          scf.yield %842 : i64
        }
        %848 = arith.cmpi ne, %847, %842 : i64
        scf.if %848 {
          func.call @stack_push_pointer(%847) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%841) : (i64) -> ()
          %849 = llvm.mlir.addressof @str44 : !llvm.ptr
          %850 = func.call @cc_make_function_ref_const(%849) : (!llvm.ptr) -> i64
          %851 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%850, %851) : (i64, i64) -> ()
        }
        %852 = func.call @stack_pop_pointer() : () -> i64
        %853 = func.call @cc_nil_value() : () -> i64
        %854 = arith.cmpi ne, %852, %853 : i64
        scf.if %854 {
          %855 = llvm.mlir.addressof @str45 : !llvm.ptr
          %856 = arith.constant 13 : i64
          %857 = func.call @cc_make_string(%855, %856) : (!llvm.ptr, i64) -> i64
          %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
          %858 = arith.addi %857, %__rlasp_stack_elide_zero_44 : i64
          %859 = func.call @cc_nil_value() : () -> i64
          %860 = func.call @cc_errorp(%858) : (i64) -> i64
          %861 = arith.cmpi ne, %860, %859 : i64
          %862 = arith.cmpi eq, %859, %859 : i64
          %863 = arith.andi %861, %862 : i1
          %864 = scf.if %863 -> (i64) {
            scf.yield %858 : i64
          } else {
            scf.yield %859 : i64
          }
          %865 = arith.cmpi ne, %864, %859 : i64
          scf.if %865 {
            func.call @stack_push_pointer(%864) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%858) : (i64) -> ()
            %866 = llvm.mlir.addressof @str46 : !llvm.ptr
            %867 = func.call @cc_make_function_ref_const(%866) : (!llvm.ptr) -> i64
            %868 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%867, %868) : (i64, i64) -> ()
          }
        } else {
          %869 = llvm.mlir.addressof @str47 : !llvm.ptr
          %870 = arith.constant 13 : i64
          %871 = func.call @cc_make_string(%869, %870) : (!llvm.ptr, i64) -> i64
          %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
          %872 = arith.addi %871, %__rlasp_stack_elide_zero_45 : i64
          %873 = func.call @cc_nil_value() : () -> i64
          %874 = func.call @cc_errorp(%872) : (i64) -> i64
          %875 = arith.cmpi ne, %874, %873 : i64
          %876 = arith.cmpi eq, %873, %873 : i64
          %877 = arith.andi %875, %876 : i1
          %878 = scf.if %877 -> (i64) {
            scf.yield %872 : i64
          } else {
            scf.yield %873 : i64
          }
          %879 = arith.cmpi ne, %878, %873 : i64
          scf.if %879 {
            func.call @stack_push_pointer(%878) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%872) : (i64) -> ()
            %880 = llvm.mlir.addressof @str48 : !llvm.ptr
            %881 = func.call @cc_make_function_ref_const(%880) : (!llvm.ptr) -> i64
            %882 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%881, %882) : (i64, i64) -> ()
          }
        }
        %883 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %883 : i64
      }
      %884 = func.call @cc_nil_value() : () -> i64
      %885 = func.call @cc_errorp(%837) : (i64) -> i64
      %886 = arith.cmpi ne, %885, %884 : i64
      %887 = scf.if %886 -> (i64) {
        scf.yield %837 : i64
      } else {
        %888 = llvm.mlir.addressof @str49 : !llvm.ptr
        %889 = arith.constant 2 : i64
        %890 = func.call @cc_make_string(%888, %889) : (!llvm.ptr, i64) -> i64
        %891 = llvm.mlir.addressof @str50 : !llvm.ptr
        %892 = arith.constant 7 : i64
        %893 = func.call @cc_make_string(%891, %892) : (!llvm.ptr, i64) -> i64
        %894 = func.call @cc_intern(%890, %893) : (i64, i64) -> i64
        %895 = func.call @cc_nil_value() : () -> i64
        %896 = func.call @cc_cons(%894, %895) : (i64, i64) -> i64
        %897 = func.call @cc_values_pack(%896) : (i64) -> i64
        %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
        %898 = arith.addi %894, %__rlasp_stack_elide_zero_46 : i64
        %899 = llvm.mlir.addressof @str51 : !llvm.ptr
        %900 = arith.constant 13 : i64
        %901 = func.call @cc_make_string(%899, %900) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
        %902 = arith.addi %901, %__rlasp_stack_elide_zero_47 : i64
        %903 = func.call @cc_nil_value() : () -> i64
        %904 = func.call @cc_errorp(%898) : (i64) -> i64
        %905 = arith.cmpi ne, %904, %903 : i64
        %906 = arith.cmpi eq, %903, %903 : i64
        %907 = arith.andi %905, %906 : i1
        %908 = scf.if %907 -> (i64) {
          scf.yield %898 : i64
        } else {
          scf.yield %903 : i64
        }
        %909 = func.call @cc_errorp(%902) : (i64) -> i64
        %910 = arith.cmpi ne, %909, %903 : i64
        %911 = arith.cmpi eq, %908, %903 : i64
        %912 = arith.andi %910, %911 : i1
        %913 = scf.if %912 -> (i64) {
          scf.yield %902 : i64
        } else {
          scf.yield %908 : i64
        }
        %914 = arith.cmpi ne, %913, %903 : i64
        scf.if %914 {
          func.call @stack_push_pointer(%913) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%898) : (i64) -> ()
          func.call @stack_push_pointer(%902) : (i64) -> ()
          %915 = llvm.mlir.addressof @str52 : !llvm.ptr
          %916 = func.call @cc_make_function_ref_const(%915) : (!llvm.ptr) -> i64
          %917 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%916, %917) : (i64, i64) -> ()
        }
        %918 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %918 : i64
      }
      %919 = func.call @cc_nil_value() : () -> i64
      %920 = func.call @cc_errorp(%887) : (i64) -> i64
      %921 = arith.cmpi ne, %920, %919 : i64
      %922 = scf.if %921 -> (i64) {
        scf.yield %887 : i64
      } else {
        %923 = llvm.mlir.addressof @str53 : !llvm.ptr
        %924 = arith.constant 11 : i64
        %925 = func.call @cc_make_string(%923, %924) : (!llvm.ptr, i64) -> i64
        %926 = llvm.mlir.addressof @str54 : !llvm.ptr
        %927 = arith.constant 7 : i64
        %928 = func.call @cc_make_string(%926, %927) : (!llvm.ptr, i64) -> i64
        %929 = func.call @cc_intern(%925, %928) : (i64, i64) -> i64
        %930 = func.call @cc_nil_value() : () -> i64
        %931 = func.call @cc_cons(%929, %930) : (i64, i64) -> i64
        %932 = func.call @cc_values_pack(%931) : (i64) -> i64
        %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
        %933 = arith.addi %929, %__rlasp_stack_elide_zero_48 : i64
        %934 = llvm.mlir.addressof @str55 : !llvm.ptr
        %935 = arith.constant 13 : i64
        %936 = func.call @cc_make_string(%934, %935) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
        %937 = arith.addi %936, %__rlasp_stack_elide_zero_49 : i64
        %938 = func.call @cc_nil_value() : () -> i64
        %939 = func.call @cc_errorp(%933) : (i64) -> i64
        %940 = arith.cmpi ne, %939, %938 : i64
        %941 = arith.cmpi eq, %938, %938 : i64
        %942 = arith.andi %940, %941 : i1
        %943 = scf.if %942 -> (i64) {
          scf.yield %933 : i64
        } else {
          scf.yield %938 : i64
        }
        %944 = func.call @cc_errorp(%937) : (i64) -> i64
        %945 = arith.cmpi ne, %944, %938 : i64
        %946 = arith.cmpi eq, %943, %938 : i64
        %947 = arith.andi %945, %946 : i1
        %948 = scf.if %947 -> (i64) {
          scf.yield %937 : i64
        } else {
          scf.yield %943 : i64
        }
        %949 = arith.cmpi ne, %948, %938 : i64
        scf.if %949 {
          func.call @stack_push_pointer(%948) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%933) : (i64) -> ()
          func.call @stack_push_pointer(%937) : (i64) -> ()
          %950 = llvm.mlir.addressof @str56 : !llvm.ptr
          %951 = func.call @cc_make_function_ref_const(%950) : (!llvm.ptr) -> i64
          %952 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%951, %952) : (i64, i64) -> ()
        }
        %953 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %953 : i64
      }
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_errorp(%922) : (i64) -> i64
      %956 = arith.cmpi ne, %955, %954 : i64
      %957 = scf.if %956 -> (i64) {
        scf.yield %922 : i64
      } else {
        %958 = llvm.mlir.addressof @str57 : !llvm.ptr
        %959 = arith.constant 13 : i64
        %960 = func.call @cc_make_string(%958, %959) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
        %961 = arith.addi %960, %__rlasp_stack_elide_zero_50 : i64
        %962 = func.call @cc_nil_value() : () -> i64
        %963 = func.call @cc_errorp(%961) : (i64) -> i64
        %964 = arith.cmpi ne, %963, %962 : i64
        %965 = arith.cmpi eq, %962, %962 : i64
        %966 = arith.andi %964, %965 : i1
        %967 = scf.if %966 -> (i64) {
          scf.yield %961 : i64
        } else {
          scf.yield %962 : i64
        }
        %968 = arith.cmpi ne, %967, %962 : i64
        scf.if %968 {
          func.call @stack_push_pointer(%967) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%961) : (i64) -> ()
          %969 = llvm.mlir.addressof @str58 : !llvm.ptr
          %970 = func.call @cc_make_function_ref_const(%969) : (!llvm.ptr) -> i64
          %971 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%970, %971) : (i64, i64) -> ()
        }
        %972 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %972 : i64
      }
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %973 = arith.addi %957, %__rlasp_stack_elide_zero_51 : i64
      scf.yield %973 : i64
    }
    %974 = func.call @cc_nil_value() : () -> i64
    %975 = func.call @cc_errorp(%832) : (i64) -> i64
    %976 = arith.cmpi ne, %975, %974 : i64
    %977 = scf.if %976 -> (i64) {
      scf.yield %832 : i64
    } else {
      %978 = llvm.mlir.addressof @str59 : !llvm.ptr
      %979 = arith.constant 3 : i64
      %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
      %981 = func.call @cc_nil_value() : () -> i64
      %982 = func.call @cc_intern(%980, %981) : (i64, i64) -> i64
      %983 = func.call @cc_nil_value() : () -> i64
      %984 = func.call @cc_cons(%982, %983) : (i64, i64) -> i64
      %985 = func.call @cc_values_pack(%984) : (i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %986 = arith.addi %982, %__rlasp_stack_elide_zero_52 : i64
      scf.yield %986 : i64
    }
    %987 = func.call @cc_nil_value() : () -> i64
    %988 = func.call @cc_errorp(%977) : (i64) -> i64
    %989 = arith.cmpi ne, %988, %987 : i64
    %990 = scf.if %989 -> (i64) {
      scf.yield %977 : i64
    } else {
      %991 = llvm.mlir.addressof @str60 : !llvm.ptr
      %992 = arith.constant 7 : i64
      %993 = func.call @cc_make_string(%991, %992) : (!llvm.ptr, i64) -> i64
      %994 = func.call @cc_nil_value() : () -> i64
      %995 = func.call @cc_intern(%993, %994) : (i64, i64) -> i64
      %996 = func.call @cc_nil_value() : () -> i64
      %997 = func.call @cc_cons(%995, %996) : (i64, i64) -> i64
      %998 = func.call @cc_values_pack(%997) : (i64) -> i64
      %999 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%999) : (i64) -> ()
      %1000 = func.call @stack_pop_pointer() : () -> i64
      %1001 = func.call @cc_set_symbol_value(%995, %1000) : (i64, i64) -> i64
      %1002 = func.call @cc_errorp(%1001) : (i64) -> i64
      %1003 = func.call @cc_nil_value() : () -> i64
      %1004 = arith.cmpi ne, %1002, %1003 : i64
      scf.if %1004 {
        func.call @stack_push_pointer(%1001) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%995) : (i64) -> ()
      }
      %1005 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1005 : i64
    }
    %1006 = func.call @cc_nil_value() : () -> i64
    %1007 = func.call @cc_errorp(%990) : (i64) -> i64
    %1008 = arith.cmpi ne, %1007, %1006 : i64
    %1009 = scf.if %1008 -> (i64) {
      scf.yield %990 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1010 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1010 : i64
    }
    %1011 = func.call @cc_nil_value() : () -> i64
    %1012 = func.call @cc_errorp(%1009) : (i64) -> i64
    %1013 = arith.cmpi ne, %1012, %1011 : i64
    %1014 = scf.if %1013 -> (i64) {
      scf.yield %1009 : i64
    } else {
      %1015 = llvm.mlir.addressof @str61 : !llvm.ptr
      %1016 = arith.constant 15 : i64
      %1017 = func.call @cc_make_string(%1015, %1016) : (!llvm.ptr, i64) -> i64
      %1018 = func.call @cc_nil_value() : () -> i64
      %1019 = func.call @cc_intern(%1017, %1018) : (i64, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_cons(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_values_pack(%1021) : (i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1023 = arith.addi %1019, %__rlasp_stack_elide_zero_53 : i64
      %1024 = llvm.mlir.addressof @str62 : !llvm.ptr
      %1025 = arith.constant 15 : i64
      %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
      %1027 = func.call @cc_nil_value() : () -> i64
      %1028 = func.call @cc_intern(%1026, %1027) : (i64, i64) -> i64
      %1029 = func.call @cc_nil_value() : () -> i64
      %1030 = func.call @cc_cons(%1028, %1029) : (i64, i64) -> i64
      %1031 = func.call @cc_values_pack(%1030) : (i64) -> i64
      func.call @stack_push_pointer(%1028) : (i64) -> ()
      %1032 = llvm.mlir.addressof @str63 : !llvm.ptr
      %1033 = arith.constant 6 : i64
      %1034 = func.call @cc_make_string(%1032, %1033) : (!llvm.ptr, i64) -> i64
      %1035 = func.call @cc_nil_value() : () -> i64
      %1036 = func.call @cc_intern(%1034, %1035) : (i64, i64) -> i64
      %1037 = func.call @cc_nil_value() : () -> i64
      %1038 = func.call @cc_cons(%1036, %1037) : (i64, i64) -> i64
      %1039 = func.call @cc_values_pack(%1038) : (i64) -> i64
      func.call @stack_push_pointer(%1036) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1040 = llvm.mlir.addressof @str64 : !llvm.ptr
      %1041 = arith.constant 9 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = llvm.mlir.addressof @str65 : !llvm.ptr
      %1044 = arith.constant 11 : i64
      %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
      %1046 = func.call @cc_intern(%1042, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_nil_value() : () -> i64
      %1048 = func.call @cc_cons(%1046, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_values_pack(%1048) : (i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      %1050 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1050) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = func.call @stack_pop_pointer() : () -> i64
      %1053 = func.call @cc_cons(%1052, %1051) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1054 = arith.addi %1053, %__rlasp_stack_elide_zero_54 : i64
      %1055 = func.call @stack_pop_pointer() : () -> i64
      %1056 = func.call @cc_cons(%1055, %1054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1056) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = func.call @stack_pop_pointer() : () -> i64
      %1059 = func.call @cc_cons(%1058, %1057) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1060 = arith.addi %1059, %__rlasp_stack_elide_zero_55 : i64
      %1061 = func.call @stack_pop_pointer() : () -> i64
      %1062 = func.call @cc_cons(%1061, %1060) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1063 = arith.addi %1062, %__rlasp_stack_elide_zero_56 : i64
      %1064 = func.call @stack_pop_pointer() : () -> i64
      %1065 = func.call @cc_cons(%1064, %1063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1065) : (i64) -> ()
      %1066 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%1066) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1067 = func.call @stack_pop_pointer() : () -> i64
      %1068 = func.call @stack_pop_pointer() : () -> i64
      %1069 = func.call @cc_cons(%1068, %1067) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1070 = arith.addi %1069, %__rlasp_stack_elide_zero_57 : i64
      %1071 = func.call @stack_pop_pointer() : () -> i64
      %1072 = func.call @cc_cons(%1071, %1070) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1073 = arith.addi %1072, %__rlasp_stack_elide_zero_58 : i64
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = func.call @cc_cons(%1074, %1073) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1076 = arith.addi %1075, %__rlasp_stack_elide_zero_59 : i64
      %1115 = arith.constant 236837129945097 : i64
      %1116 = arith.constant 0 : i64
      %1117 = func.call @cc_make_closure(%1115, %1116) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1118 = arith.addi %1117, %__rlasp_stack_elide_zero_60 : i64
      %1119 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1119) : (i64) -> ()
      %1120 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1120) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1121 = func.call @stack_pop_pointer() : () -> i64
      %1122 = func.call @stack_pop_pointer() : () -> i64
      %1123 = func.call @cc_cons(%1122, %1121) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1124 = arith.addi %1123, %__rlasp_stack_elide_zero_61 : i64
      %1125 = func.call @stack_pop_pointer() : () -> i64
      %1126 = func.call @cc_cons(%1125, %1124) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1127 = arith.addi %1126, %__rlasp_stack_elide_zero_62 : i64
      %1128 = llvm.mlir.addressof @str67 : !llvm.ptr
      %1129 = arith.constant 11 : i64
      %1130 = func.call @cc_make_string(%1128, %1129) : (!llvm.ptr, i64) -> i64
      %1131 = llvm.mlir.addressof @str68 : !llvm.ptr
      %1132 = arith.constant 7 : i64
      %1133 = func.call @cc_make_string(%1131, %1132) : (!llvm.ptr, i64) -> i64
      %1134 = func.call @cc_intern(%1130, %1133) : (i64, i64) -> i64
      %1135 = func.call @cc_nil_value() : () -> i64
      %1136 = func.call @cc_cons(%1134, %1135) : (i64, i64) -> i64
      %1137 = func.call @cc_values_pack(%1136) : (i64) -> i64
      %1138 = llvm.mlir.addressof @str69 : !llvm.ptr
      %1139 = arith.constant 46 : i64
      %1140 = func.call @cc_make_string(%1138, %1139) : (!llvm.ptr, i64) -> i64
      %1141 = llvm.mlir.addressof @str70 : !llvm.ptr
      %1142 = arith.constant 4 : i64
      %1143 = func.call @cc_make_string(%1141, %1142) : (!llvm.ptr, i64) -> i64
      %1144 = llvm.mlir.addressof @str71 : !llvm.ptr
      %1145 = arith.constant 7 : i64
      %1146 = func.call @cc_make_string(%1144, %1145) : (!llvm.ptr, i64) -> i64
      %1147 = func.call @cc_intern(%1143, %1146) : (i64, i64) -> i64
      %1148 = func.call @cc_nil_value() : () -> i64
      %1149 = func.call @cc_cons(%1147, %1148) : (i64, i64) -> i64
      %1150 = func.call @cc_values_pack(%1149) : (i64) -> i64
      %1151 = llvm.mlir.addressof @str72 : !llvm.ptr
      %1152 = arith.constant 6 : i64
      %1153 = func.call @cc_make_string(%1151, %1152) : (!llvm.ptr, i64) -> i64
      %1154 = func.call @cc_nil_value() : () -> i64
      %1155 = func.call @cc_intern(%1153, %1154) : (i64, i64) -> i64
      %1156 = func.call @cc_nil_value() : () -> i64
      %1157 = func.call @cc_cons(%1155, %1156) : (i64, i64) -> i64
      %1158 = func.call @cc_values_pack(%1157) : (i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1159 = arith.addi %1155, %__rlasp_stack_elide_zero_63 : i64
      %1160 = func.call @cc_nil_value() : () -> i64
      %1161 = func.call @cc_errorp(%1023) : (i64) -> i64
      %1162 = arith.cmpi ne, %1161, %1160 : i64
      %1163 = arith.cmpi eq, %1160, %1160 : i64
      %1164 = arith.andi %1162, %1163 : i1
      %1165 = scf.if %1164 -> (i64) {
        scf.yield %1023 : i64
      } else {
        scf.yield %1160 : i64
      }
      %1166 = func.call @cc_errorp(%1076) : (i64) -> i64
      %1167 = arith.cmpi ne, %1166, %1160 : i64
      %1168 = arith.cmpi eq, %1165, %1160 : i64
      %1169 = arith.andi %1167, %1168 : i1
      %1170 = scf.if %1169 -> (i64) {
        scf.yield %1076 : i64
      } else {
        scf.yield %1165 : i64
      }
      %1171 = func.call @cc_errorp(%1118) : (i64) -> i64
      %1172 = arith.cmpi ne, %1171, %1160 : i64
      %1173 = arith.cmpi eq, %1170, %1160 : i64
      %1174 = arith.andi %1172, %1173 : i1
      %1175 = scf.if %1174 -> (i64) {
        scf.yield %1118 : i64
      } else {
        scf.yield %1170 : i64
      }
      %1176 = func.call @cc_errorp(%1127) : (i64) -> i64
      %1177 = arith.cmpi ne, %1176, %1160 : i64
      %1178 = arith.cmpi eq, %1175, %1160 : i64
      %1179 = arith.andi %1177, %1178 : i1
      %1180 = scf.if %1179 -> (i64) {
        scf.yield %1127 : i64
      } else {
        scf.yield %1175 : i64
      }
      %1181 = func.call @cc_errorp(%1134) : (i64) -> i64
      %1182 = arith.cmpi ne, %1181, %1160 : i64
      %1183 = arith.cmpi eq, %1180, %1160 : i64
      %1184 = arith.andi %1182, %1183 : i1
      %1185 = scf.if %1184 -> (i64) {
        scf.yield %1134 : i64
      } else {
        scf.yield %1180 : i64
      }
      %1186 = func.call @cc_errorp(%1140) : (i64) -> i64
      %1187 = arith.cmpi ne, %1186, %1160 : i64
      %1188 = arith.cmpi eq, %1185, %1160 : i64
      %1189 = arith.andi %1187, %1188 : i1
      %1190 = scf.if %1189 -> (i64) {
        scf.yield %1140 : i64
      } else {
        scf.yield %1185 : i64
      }
      %1191 = func.call @cc_errorp(%1147) : (i64) -> i64
      %1192 = arith.cmpi ne, %1191, %1160 : i64
      %1193 = arith.cmpi eq, %1190, %1160 : i64
      %1194 = arith.andi %1192, %1193 : i1
      %1195 = scf.if %1194 -> (i64) {
        scf.yield %1147 : i64
      } else {
        scf.yield %1190 : i64
      }
      %1196 = func.call @cc_errorp(%1159) : (i64) -> i64
      %1197 = arith.cmpi ne, %1196, %1160 : i64
      %1198 = arith.cmpi eq, %1195, %1160 : i64
      %1199 = arith.andi %1197, %1198 : i1
      %1200 = scf.if %1199 -> (i64) {
        scf.yield %1159 : i64
      } else {
        scf.yield %1195 : i64
      }
      %1201 = arith.cmpi ne, %1200, %1160 : i64
      scf.if %1201 {
        func.call @stack_push_pointer(%1200) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1023) : (i64) -> ()
        func.call @stack_push_pointer(%1076) : (i64) -> ()
        func.call @stack_push_pointer(%1118) : (i64) -> ()
        func.call @stack_push_pointer(%1127) : (i64) -> ()
        func.call @stack_push_pointer(%1134) : (i64) -> ()
        func.call @stack_push_pointer(%1140) : (i64) -> ()
        func.call @stack_push_pointer(%1147) : (i64) -> ()
        func.call @stack_push_pointer(%1159) : (i64) -> ()
        %1202 = llvm.mlir.addressof @str73 : !llvm.ptr
        %1203 = func.call @cc_make_function_ref_const(%1202) : (!llvm.ptr) -> i64
        %1204 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1203, %1204) : (i64, i64) -> ()
      }
      %1205 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1205 : i64
    }
    %1206 = func.call @cc_nil_value() : () -> i64
    %1207 = func.call @cc_errorp(%1014) : (i64) -> i64
    %1208 = arith.cmpi ne, %1207, %1206 : i64
    %1209 = scf.if %1208 -> (i64) {
      scf.yield %1014 : i64
    } else {
      %1210 = llvm.mlir.addressof @str74 : !llvm.ptr
      %1211 = arith.constant 22 : i64
      %1212 = func.call @cc_make_string(%1210, %1211) : (!llvm.ptr, i64) -> i64
      %1213 = func.call @cc_nil_value() : () -> i64
      %1214 = func.call @cc_intern(%1212, %1213) : (i64, i64) -> i64
      %1215 = func.call @cc_nil_value() : () -> i64
      %1216 = func.call @cc_cons(%1214, %1215) : (i64, i64) -> i64
      %1217 = func.call @cc_values_pack(%1216) : (i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1218 = arith.addi %1214, %__rlasp_stack_elide_zero_64 : i64
      %1219 = llvm.mlir.addressof @str75 : !llvm.ptr
      %1220 = arith.constant 3 : i64
      %1221 = func.call @cc_make_string(%1219, %1220) : (!llvm.ptr, i64) -> i64
      %1222 = func.call @cc_nil_value() : () -> i64
      %1223 = func.call @cc_intern(%1221, %1222) : (i64, i64) -> i64
      %1224 = func.call @cc_nil_value() : () -> i64
      %1225 = func.call @cc_cons(%1223, %1224) : (i64, i64) -> i64
      %1226 = func.call @cc_values_pack(%1225) : (i64) -> i64
      func.call @stack_push_pointer(%1223) : (i64) -> ()
      %1227 = llvm.mlir.addressof @str76 : !llvm.ptr
      %1228 = arith.constant 5 : i64
      %1229 = func.call @cc_make_string(%1227, %1228) : (!llvm.ptr, i64) -> i64
      %1230 = llvm.mlir.addressof @str77 : !llvm.ptr
      %1231 = arith.constant 11 : i64
      %1232 = func.call @cc_make_string(%1230, %1231) : (!llvm.ptr, i64) -> i64
      %1233 = func.call @cc_intern(%1229, %1232) : (i64, i64) -> i64
      %1234 = func.call @cc_nil_value() : () -> i64
      %1235 = func.call @cc_cons(%1233, %1234) : (i64, i64) -> i64
      %1236 = func.call @cc_values_pack(%1235) : (i64) -> i64
      func.call @stack_push_pointer(%1233) : (i64) -> ()
      %1237 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1237) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1238 = func.call @stack_pop_pointer() : () -> i64
      %1239 = func.call @stack_pop_pointer() : () -> i64
      %1240 = func.call @cc_cons(%1239, %1238) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1241 = arith.addi %1240, %__rlasp_stack_elide_zero_65 : i64
      %1242 = func.call @stack_pop_pointer() : () -> i64
      %1243 = func.call @cc_cons(%1242, %1241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1243) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1244 = func.call @stack_pop_pointer() : () -> i64
      %1245 = func.call @stack_pop_pointer() : () -> i64
      %1246 = func.call @cc_cons(%1245, %1244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1246) : (i64) -> ()
      %1247 = llvm.mlir.addressof @str78 : !llvm.ptr
      %1248 = arith.constant 3 : i64
      %1249 = func.call @cc_make_string(%1247, %1248) : (!llvm.ptr, i64) -> i64
      %1250 = func.call @cc_nil_value() : () -> i64
      %1251 = func.call @cc_intern(%1249, %1250) : (i64, i64) -> i64
      %1252 = func.call @cc_nil_value() : () -> i64
      %1253 = func.call @cc_cons(%1251, %1252) : (i64, i64) -> i64
      %1254 = func.call @cc_values_pack(%1253) : (i64) -> i64
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      %1255 = llvm.mlir.addressof @str79 : !llvm.ptr
      %1256 = arith.constant 1 : i64
      %1257 = func.call @cc_make_string(%1255, %1256) : (!llvm.ptr, i64) -> i64
      %1258 = func.call @cc_nil_value() : () -> i64
      %1259 = func.call @cc_intern(%1257, %1258) : (i64, i64) -> i64
      %1260 = func.call @cc_nil_value() : () -> i64
      %1261 = func.call @cc_cons(%1259, %1260) : (i64, i64) -> i64
      %1262 = func.call @cc_values_pack(%1261) : (i64) -> i64
      func.call @stack_push_pointer(%1259) : (i64) -> ()
      %1263 = llvm.mlir.addressof @str80 : !llvm.ptr
      %1264 = arith.constant 9 : i64
      %1265 = func.call @cc_make_string(%1263, %1264) : (!llvm.ptr, i64) -> i64
      %1266 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1267 = arith.constant 11 : i64
      %1268 = func.call @cc_make_string(%1266, %1267) : (!llvm.ptr, i64) -> i64
      %1269 = func.call @cc_intern(%1265, %1268) : (i64, i64) -> i64
      %1270 = func.call @cc_nil_value() : () -> i64
      %1271 = func.call @cc_cons(%1269, %1270) : (i64, i64) -> i64
      %1272 = func.call @cc_values_pack(%1271) : (i64) -> i64
      func.call @stack_push_pointer(%1269) : (i64) -> ()
      %1273 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1273) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1274 = func.call @stack_pop_pointer() : () -> i64
      %1275 = func.call @stack_pop_pointer() : () -> i64
      %1276 = func.call @cc_cons(%1275, %1274) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1277 = arith.addi %1276, %__rlasp_stack_elide_zero_66 : i64
      %1278 = func.call @stack_pop_pointer() : () -> i64
      %1279 = func.call @cc_cons(%1278, %1277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1279) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1280 = func.call @stack_pop_pointer() : () -> i64
      %1281 = func.call @stack_pop_pointer() : () -> i64
      %1282 = func.call @cc_cons(%1281, %1280) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1283 = arith.addi %1282, %__rlasp_stack_elide_zero_67 : i64
      %1284 = func.call @stack_pop_pointer() : () -> i64
      %1285 = func.call @cc_cons(%1284, %1283) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1285) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1286 = func.call @stack_pop_pointer() : () -> i64
      %1287 = func.call @stack_pop_pointer() : () -> i64
      %1288 = func.call @cc_cons(%1287, %1286) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1288) : (i64) -> ()
      %1289 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1290 = arith.constant 4 : i64
      %1291 = func.call @cc_make_string(%1289, %1290) : (!llvm.ptr, i64) -> i64
      %1292 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1293 = arith.constant 11 : i64
      %1294 = func.call @cc_make_string(%1292, %1293) : (!llvm.ptr, i64) -> i64
      %1295 = func.call @cc_intern(%1291, %1294) : (i64, i64) -> i64
      %1296 = func.call @cc_nil_value() : () -> i64
      %1297 = func.call @cc_cons(%1295, %1296) : (i64, i64) -> i64
      %1298 = func.call @cc_values_pack(%1297) : (i64) -> i64
      func.call @stack_push_pointer(%1295) : (i64) -> ()
      %1299 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1300 = arith.constant 3 : i64
      %1301 = func.call @cc_make_string(%1299, %1300) : (!llvm.ptr, i64) -> i64
      %1302 = func.call @cc_nil_value() : () -> i64
      %1303 = func.call @cc_intern(%1301, %1302) : (i64, i64) -> i64
      %1304 = func.call @cc_nil_value() : () -> i64
      %1305 = func.call @cc_cons(%1303, %1304) : (i64, i64) -> i64
      %1306 = func.call @cc_values_pack(%1305) : (i64) -> i64
      func.call @stack_push_pointer(%1303) : (i64) -> ()
      %1307 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1308 = arith.constant 1 : i64
      %1309 = func.call @cc_make_string(%1307, %1308) : (!llvm.ptr, i64) -> i64
      %1310 = func.call @cc_nil_value() : () -> i64
      %1311 = func.call @cc_intern(%1309, %1310) : (i64, i64) -> i64
      %1312 = func.call @cc_nil_value() : () -> i64
      %1313 = func.call @cc_cons(%1311, %1312) : (i64, i64) -> i64
      %1314 = func.call @cc_values_pack(%1313) : (i64) -> i64
      func.call @stack_push_pointer(%1311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1315 = func.call @stack_pop_pointer() : () -> i64
      %1316 = func.call @stack_pop_pointer() : () -> i64
      %1317 = func.call @cc_cons(%1316, %1315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1317) : (i64) -> ()
      %1318 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1319 = arith.constant 7 : i64
      %1320 = func.call @cc_make_string(%1318, %1319) : (!llvm.ptr, i64) -> i64
      %1321 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1322 = arith.constant 11 : i64
      %1323 = func.call @cc_make_string(%1321, %1322) : (!llvm.ptr, i64) -> i64
      %1324 = func.call @cc_intern(%1320, %1323) : (i64, i64) -> i64
      %1325 = func.call @cc_nil_value() : () -> i64
      %1326 = func.call @cc_cons(%1324, %1325) : (i64, i64) -> i64
      %1327 = func.call @cc_values_pack(%1326) : (i64) -> i64
      func.call @stack_push_pointer(%1324) : (i64) -> ()
      %1328 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1329 = arith.constant 6 : i64
      %1330 = func.call @cc_make_string(%1328, %1329) : (!llvm.ptr, i64) -> i64
      %1331 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1332 = arith.constant 11 : i64
      %1333 = func.call @cc_make_string(%1331, %1332) : (!llvm.ptr, i64) -> i64
      %1334 = func.call @cc_intern(%1330, %1333) : (i64, i64) -> i64
      %1335 = func.call @cc_nil_value() : () -> i64
      %1336 = func.call @cc_cons(%1334, %1335) : (i64, i64) -> i64
      %1337 = func.call @cc_values_pack(%1336) : (i64) -> i64
      func.call @stack_push_pointer(%1334) : (i64) -> ()
      %1338 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1339 = arith.constant 1 : i64
      %1340 = func.call @cc_make_string(%1338, %1339) : (!llvm.ptr, i64) -> i64
      %1341 = func.call @cc_nil_value() : () -> i64
      %1342 = func.call @cc_intern(%1340, %1341) : (i64, i64) -> i64
      %1343 = func.call @cc_nil_value() : () -> i64
      %1344 = func.call @cc_cons(%1342, %1343) : (i64, i64) -> i64
      %1345 = func.call @cc_values_pack(%1344) : (i64) -> i64
      func.call @stack_push_pointer(%1342) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1346 = func.call @stack_pop_pointer() : () -> i64
      %1347 = func.call @stack_pop_pointer() : () -> i64
      %1348 = func.call @cc_cons(%1347, %1346) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
      %1349 = arith.addi %1348, %__rlasp_stack_elide_zero_68 : i64
      %1350 = func.call @stack_pop_pointer() : () -> i64
      %1351 = func.call @cc_cons(%1350, %1349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1351) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1352 = func.call @stack_pop_pointer() : () -> i64
      %1353 = func.call @stack_pop_pointer() : () -> i64
      %1354 = func.call @cc_cons(%1353, %1352) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
      %1355 = arith.addi %1354, %__rlasp_stack_elide_zero_69 : i64
      %1356 = func.call @stack_pop_pointer() : () -> i64
      %1357 = func.call @cc_cons(%1356, %1355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1357) : (i64) -> ()
      %1358 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1359 = arith.constant 4 : i64
      %1360 = func.call @cc_make_string(%1358, %1359) : (!llvm.ptr, i64) -> i64
      %1361 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1362 = arith.constant 11 : i64
      %1363 = func.call @cc_make_string(%1361, %1362) : (!llvm.ptr, i64) -> i64
      %1364 = func.call @cc_intern(%1360, %1363) : (i64, i64) -> i64
      %1365 = func.call @cc_nil_value() : () -> i64
      %1366 = func.call @cc_cons(%1364, %1365) : (i64, i64) -> i64
      %1367 = func.call @cc_values_pack(%1366) : (i64) -> i64
      func.call @stack_push_pointer(%1364) : (i64) -> ()
      %1368 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1369 = arith.constant 5 : i64
      %1370 = func.call @cc_make_string(%1368, %1369) : (!llvm.ptr, i64) -> i64
      %1371 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1372 = arith.constant 11 : i64
      %1373 = func.call @cc_make_string(%1371, %1372) : (!llvm.ptr, i64) -> i64
      %1374 = func.call @cc_intern(%1370, %1373) : (i64, i64) -> i64
      %1375 = func.call @cc_nil_value() : () -> i64
      %1376 = func.call @cc_cons(%1374, %1375) : (i64, i64) -> i64
      %1377 = func.call @cc_values_pack(%1376) : (i64) -> i64
      func.call @stack_push_pointer(%1374) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = func.call @stack_pop_pointer() : () -> i64
      %1380 = func.call @cc_cons(%1379, %1378) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1381 = arith.addi %1380, %__rlasp_stack_elide_zero_70 : i64
      %1382 = func.call @stack_pop_pointer() : () -> i64
      %1383 = func.call @cc_cons(%1382, %1381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1383) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @stack_pop_pointer() : () -> i64
      %1386 = func.call @cc_cons(%1385, %1384) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %1387 = arith.addi %1386, %__rlasp_stack_elide_zero_71 : i64
      %1388 = func.call @stack_pop_pointer() : () -> i64
      %1389 = func.call @cc_cons(%1388, %1387) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
      %1390 = arith.addi %1389, %__rlasp_stack_elide_zero_72 : i64
      %1391 = func.call @stack_pop_pointer() : () -> i64
      %1392 = func.call @cc_cons(%1391, %1390) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
      %1393 = arith.addi %1392, %__rlasp_stack_elide_zero_73 : i64
      %1394 = func.call @stack_pop_pointer() : () -> i64
      %1395 = func.call @cc_cons(%1394, %1393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1396 = func.call @stack_pop_pointer() : () -> i64
      %1397 = func.call @stack_pop_pointer() : () -> i64
      %1398 = func.call @cc_cons(%1397, %1396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1398) : (i64) -> ()
      %1399 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1400 = arith.constant 4 : i64
      %1401 = func.call @cc_make_string(%1399, %1400) : (!llvm.ptr, i64) -> i64
      %1402 = func.call @cc_nil_value() : () -> i64
      %1403 = func.call @cc_intern(%1401, %1402) : (i64, i64) -> i64
      %1404 = func.call @cc_nil_value() : () -> i64
      %1405 = func.call @cc_cons(%1403, %1404) : (i64, i64) -> i64
      %1406 = func.call @cc_values_pack(%1405) : (i64) -> i64
      func.call @stack_push_pointer(%1403) : (i64) -> ()
      %1407 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1408 = arith.constant 6 : i64
      %1409 = func.call @cc_make_string(%1407, %1408) : (!llvm.ptr, i64) -> i64
      %1410 = func.call @cc_nil_value() : () -> i64
      %1411 = func.call @cc_intern(%1409, %1410) : (i64, i64) -> i64
      %1412 = func.call @cc_nil_value() : () -> i64
      %1413 = func.call @cc_cons(%1411, %1412) : (i64, i64) -> i64
      %1414 = func.call @cc_values_pack(%1413) : (i64) -> i64
      func.call @stack_push_pointer(%1411) : (i64) -> ()
      %1415 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1415) : (i64) -> ()
      %1416 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1417 = arith.constant 2 : i64
      %1418 = func.call @cc_make_string(%1416, %1417) : (!llvm.ptr, i64) -> i64
      %1419 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1420 = arith.constant 11 : i64
      %1421 = func.call @cc_make_string(%1419, %1420) : (!llvm.ptr, i64) -> i64
      %1422 = func.call @cc_intern(%1418, %1421) : (i64, i64) -> i64
      %1423 = func.call @cc_nil_value() : () -> i64
      %1424 = func.call @cc_cons(%1422, %1423) : (i64, i64) -> i64
      %1425 = func.call @cc_values_pack(%1424) : (i64) -> i64
      func.call @stack_push_pointer(%1422) : (i64) -> ()
      %1426 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1427 = arith.constant 8 : i64
      %1428 = func.call @cc_make_string(%1426, %1427) : (!llvm.ptr, i64) -> i64
      %1429 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1430 = arith.constant 7 : i64
      %1431 = func.call @cc_make_string(%1429, %1430) : (!llvm.ptr, i64) -> i64
      %1432 = func.call @cc_intern(%1428, %1431) : (i64, i64) -> i64
      %1433 = func.call @cc_nil_value() : () -> i64
      %1434 = func.call @cc_cons(%1432, %1433) : (i64, i64) -> i64
      %1435 = func.call @cc_values_pack(%1434) : (i64) -> i64
      func.call @stack_push_pointer(%1432) : (i64) -> ()
      %1436 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1437 = arith.constant 1 : i64
      %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
      %1439 = func.call @cc_nil_value() : () -> i64
      %1440 = func.call @cc_intern(%1438, %1439) : (i64, i64) -> i64
      %1441 = func.call @cc_nil_value() : () -> i64
      %1442 = func.call @cc_cons(%1440, %1441) : (i64, i64) -> i64
      %1443 = func.call @cc_values_pack(%1442) : (i64) -> i64
      func.call @stack_push_pointer(%1440) : (i64) -> ()
      %1444 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1445 = arith.constant 8 : i64
      %1446 = func.call @cc_make_string(%1444, %1445) : (!llvm.ptr, i64) -> i64
      %1447 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1448 = arith.constant 11 : i64
      %1449 = func.call @cc_make_string(%1447, %1448) : (!llvm.ptr, i64) -> i64
      %1450 = func.call @cc_intern(%1446, %1449) : (i64, i64) -> i64
      %1451 = func.call @cc_nil_value() : () -> i64
      %1452 = func.call @cc_cons(%1450, %1451) : (i64, i64) -> i64
      %1453 = func.call @cc_values_pack(%1452) : (i64) -> i64
      func.call @stack_push_pointer(%1450) : (i64) -> ()
      %1454 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1455 = arith.constant 3 : i64
      %1456 = func.call @cc_make_string(%1454, %1455) : (!llvm.ptr, i64) -> i64
      %1457 = func.call @cc_nil_value() : () -> i64
      %1458 = func.call @cc_intern(%1456, %1457) : (i64, i64) -> i64
      %1459 = func.call @cc_nil_value() : () -> i64
      %1460 = func.call @cc_cons(%1458, %1459) : (i64, i64) -> i64
      %1461 = func.call @cc_values_pack(%1460) : (i64) -> i64
      func.call @stack_push_pointer(%1458) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1462 = func.call @stack_pop_pointer() : () -> i64
      %1463 = func.call @stack_pop_pointer() : () -> i64
      %1464 = func.call @cc_cons(%1463, %1462) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1465 = arith.addi %1464, %__rlasp_stack_elide_zero_74 : i64
      %1466 = func.call @stack_pop_pointer() : () -> i64
      %1467 = func.call @cc_cons(%1466, %1465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1467) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1468 = func.call @stack_pop_pointer() : () -> i64
      %1469 = func.call @stack_pop_pointer() : () -> i64
      %1470 = func.call @cc_cons(%1469, %1468) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1471 = arith.addi %1470, %__rlasp_stack_elide_zero_75 : i64
      %1472 = func.call @stack_pop_pointer() : () -> i64
      %1473 = func.call @cc_cons(%1472, %1471) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
      %1474 = arith.addi %1473, %__rlasp_stack_elide_zero_76 : i64
      %1475 = func.call @stack_pop_pointer() : () -> i64
      %1476 = func.call @cc_cons(%1475, %1474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1476) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1477 = func.call @stack_pop_pointer() : () -> i64
      %1478 = func.call @stack_pop_pointer() : () -> i64
      %1479 = func.call @cc_cons(%1478, %1477) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %1480 = arith.addi %1479, %__rlasp_stack_elide_zero_77 : i64
      %1481 = func.call @stack_pop_pointer() : () -> i64
      %1482 = func.call @cc_cons(%1481, %1480) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %1483 = arith.addi %1482, %__rlasp_stack_elide_zero_78 : i64
      %1484 = func.call @stack_pop_pointer() : () -> i64
      %1485 = func.call @cc_cons(%1484, %1483) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %1486 = arith.addi %1485, %__rlasp_stack_elide_zero_79 : i64
      %1487 = func.call @stack_pop_pointer() : () -> i64
      %1488 = func.call @cc_cons(%1487, %1486) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %1489 = arith.addi %1488, %__rlasp_stack_elide_zero_80 : i64
      %1490 = func.call @stack_pop_pointer() : () -> i64
      %1491 = func.call @cc_cons(%1490, %1489) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1491) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1492 = func.call @stack_pop_pointer() : () -> i64
      %1493 = func.call @stack_pop_pointer() : () -> i64
      %1494 = func.call @cc_cons(%1493, %1492) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
      %1495 = arith.addi %1494, %__rlasp_stack_elide_zero_81 : i64
      %1496 = func.call @stack_pop_pointer() : () -> i64
      %1497 = func.call @cc_cons(%1496, %1495) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
      %1498 = arith.addi %1497, %__rlasp_stack_elide_zero_82 : i64
      %1499 = func.call @stack_pop_pointer() : () -> i64
      %1500 = func.call @cc_cons(%1499, %1498) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1500) : (i64) -> ()
      %1501 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1502 = arith.constant 10 : i64
      %1503 = func.call @cc_make_string(%1501, %1502) : (!llvm.ptr, i64) -> i64
      %1504 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1505 = arith.constant 7 : i64
      %1506 = func.call @cc_make_string(%1504, %1505) : (!llvm.ptr, i64) -> i64
      %1507 = func.call @cc_intern(%1503, %1506) : (i64, i64) -> i64
      %1508 = func.call @cc_nil_value() : () -> i64
      %1509 = func.call @cc_cons(%1507, %1508) : (i64, i64) -> i64
      %1510 = func.call @cc_values_pack(%1509) : (i64) -> i64
      func.call @stack_push_pointer(%1507) : (i64) -> ()
      %1511 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1512 = arith.constant 1 : i64
      %1513 = func.call @cc_make_string(%1511, %1512) : (!llvm.ptr, i64) -> i64
      %1514 = func.call @cc_nil_value() : () -> i64
      %1515 = func.call @cc_intern(%1513, %1514) : (i64, i64) -> i64
      %1516 = func.call @cc_nil_value() : () -> i64
      %1517 = func.call @cc_cons(%1515, %1516) : (i64, i64) -> i64
      %1518 = func.call @cc_values_pack(%1517) : (i64) -> i64
      func.call @stack_push_pointer(%1515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1519 = func.call @stack_pop_pointer() : () -> i64
      %1520 = func.call @stack_pop_pointer() : () -> i64
      %1521 = func.call @cc_cons(%1520, %1519) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
      %1522 = arith.addi %1521, %__rlasp_stack_elide_zero_83 : i64
      %1523 = func.call @stack_pop_pointer() : () -> i64
      %1524 = func.call @cc_cons(%1523, %1522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1524) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1525 = func.call @stack_pop_pointer() : () -> i64
      %1526 = func.call @stack_pop_pointer() : () -> i64
      %1527 = func.call @cc_cons(%1526, %1525) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1528 = arith.addi %1527, %__rlasp_stack_elide_zero_84 : i64
      %1529 = func.call @stack_pop_pointer() : () -> i64
      %1530 = func.call @cc_cons(%1529, %1528) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1531 = arith.addi %1530, %__rlasp_stack_elide_zero_85 : i64
      %1532 = func.call @stack_pop_pointer() : () -> i64
      %1533 = func.call @cc_cons(%1532, %1531) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1534 = arith.addi %1533, %__rlasp_stack_elide_zero_86 : i64
      %1535 = func.call @stack_pop_pointer() : () -> i64
      %1536 = func.call @cc_cons(%1535, %1534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1536) : (i64) -> ()
      %1537 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1538 = arith.constant 4 : i64
      %1539 = func.call @cc_make_string(%1537, %1538) : (!llvm.ptr, i64) -> i64
      %1540 = func.call @cc_nil_value() : () -> i64
      %1541 = func.call @cc_intern(%1539, %1540) : (i64, i64) -> i64
      %1542 = func.call @cc_nil_value() : () -> i64
      %1543 = func.call @cc_cons(%1541, %1542) : (i64, i64) -> i64
      %1544 = func.call @cc_values_pack(%1543) : (i64) -> i64
      func.call @stack_push_pointer(%1541) : (i64) -> ()
      %1545 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1546 = arith.constant 6 : i64
      %1547 = func.call @cc_make_string(%1545, %1546) : (!llvm.ptr, i64) -> i64
      %1548 = func.call @cc_nil_value() : () -> i64
      %1549 = func.call @cc_intern(%1547, %1548) : (i64, i64) -> i64
      %1550 = func.call @cc_nil_value() : () -> i64
      %1551 = func.call @cc_cons(%1549, %1550) : (i64, i64) -> i64
      %1552 = func.call @cc_values_pack(%1551) : (i64) -> i64
      func.call @stack_push_pointer(%1549) : (i64) -> ()
      %1553 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1553) : (i64) -> ()
      %1554 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1555 = arith.constant 2 : i64
      %1556 = func.call @cc_make_string(%1554, %1555) : (!llvm.ptr, i64) -> i64
      %1557 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1558 = arith.constant 11 : i64
      %1559 = func.call @cc_make_string(%1557, %1558) : (!llvm.ptr, i64) -> i64
      %1560 = func.call @cc_intern(%1556, %1559) : (i64, i64) -> i64
      %1561 = func.call @cc_nil_value() : () -> i64
      %1562 = func.call @cc_cons(%1560, %1561) : (i64, i64) -> i64
      %1563 = func.call @cc_values_pack(%1562) : (i64) -> i64
      func.call @stack_push_pointer(%1560) : (i64) -> ()
      %1564 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1565 = arith.constant 15 : i64
      %1566 = func.call @cc_make_string(%1564, %1565) : (!llvm.ptr, i64) -> i64
      %1567 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1568 = arith.constant 7 : i64
      %1569 = func.call @cc_make_string(%1567, %1568) : (!llvm.ptr, i64) -> i64
      %1570 = func.call @cc_intern(%1566, %1569) : (i64, i64) -> i64
      %1571 = func.call @cc_nil_value() : () -> i64
      %1572 = func.call @cc_cons(%1570, %1571) : (i64, i64) -> i64
      %1573 = func.call @cc_values_pack(%1572) : (i64) -> i64
      func.call @stack_push_pointer(%1570) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1574 = func.call @stack_pop_pointer() : () -> i64
      %1575 = func.call @stack_pop_pointer() : () -> i64
      %1576 = func.call @cc_cons(%1575, %1574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1576) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1577 = func.call @stack_pop_pointer() : () -> i64
      %1578 = func.call @stack_pop_pointer() : () -> i64
      %1579 = func.call @cc_cons(%1578, %1577) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1580 = arith.addi %1579, %__rlasp_stack_elide_zero_87 : i64
      %1581 = func.call @stack_pop_pointer() : () -> i64
      %1582 = func.call @cc_cons(%1581, %1580) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1583 = arith.addi %1582, %__rlasp_stack_elide_zero_88 : i64
      %1584 = func.call @stack_pop_pointer() : () -> i64
      %1585 = func.call @cc_cons(%1584, %1583) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1586 = arith.addi %1585, %__rlasp_stack_elide_zero_89 : i64
      %1587 = func.call @stack_pop_pointer() : () -> i64
      %1588 = func.call @cc_cons(%1587, %1586) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
      %1589 = arith.addi %1588, %__rlasp_stack_elide_zero_90 : i64
      %1590 = func.call @stack_pop_pointer() : () -> i64
      %1591 = func.call @cc_cons(%1590, %1589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1591) : (i64) -> ()
      %1592 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1593 = arith.constant 5 : i64
      %1594 = func.call @cc_make_string(%1592, %1593) : (!llvm.ptr, i64) -> i64
      %1595 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1596 = arith.constant 11 : i64
      %1597 = func.call @cc_make_string(%1595, %1596) : (!llvm.ptr, i64) -> i64
      %1598 = func.call @cc_intern(%1594, %1597) : (i64, i64) -> i64
      %1599 = func.call @cc_nil_value() : () -> i64
      %1600 = func.call @cc_cons(%1598, %1599) : (i64, i64) -> i64
      %1601 = func.call @cc_values_pack(%1600) : (i64) -> i64
      func.call @stack_push_pointer(%1598) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1602 = func.call @stack_pop_pointer() : () -> i64
      %1603 = func.call @stack_pop_pointer() : () -> i64
      %1604 = func.call @cc_cons(%1603, %1602) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
      %1605 = arith.addi %1604, %__rlasp_stack_elide_zero_91 : i64
      %1606 = func.call @stack_pop_pointer() : () -> i64
      %1607 = func.call @cc_cons(%1606, %1605) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
      %1608 = arith.addi %1607, %__rlasp_stack_elide_zero_92 : i64
      %1609 = func.call @stack_pop_pointer() : () -> i64
      %1610 = func.call @cc_cons(%1609, %1608) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
      %1611 = arith.addi %1610, %__rlasp_stack_elide_zero_93 : i64
      %1612 = func.call @stack_pop_pointer() : () -> i64
      %1613 = func.call @cc_cons(%1612, %1611) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1614 = arith.addi %1613, %__rlasp_stack_elide_zero_94 : i64
      %1615 = func.call @stack_pop_pointer() : () -> i64
      %1616 = func.call @cc_cons(%1615, %1614) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1617 = arith.addi %1616, %__rlasp_stack_elide_zero_95 : i64
      %2076 = llvm.mlir.addressof @str137 : !llvm.ptr
      %2077 = arith.constant 30 : i64
      %2078 = func.call @cc_make_symbol(%2076, %2077) : (!llvm.ptr, i64) -> i64
      %2079 = func.call @cc_persistent_root_value(%2078) : (i64) -> i64
      func.call @stack_push_pointer(%2079) : (i64) -> ()
      %2080 = arith.constant 236837129945099 : i64
      %2081 = arith.constant 1 : i64
      %2082 = func.call @cc_make_closure(%2080, %2081) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
      %2083 = arith.addi %2082, %__rlasp_stack_elide_zero_96 : i64
      %2084 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2084) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2085 = func.call @stack_pop_pointer() : () -> i64
      %2086 = func.call @stack_pop_pointer() : () -> i64
      %2087 = func.call @cc_cons(%2086, %2085) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
      %2088 = arith.addi %2087, %__rlasp_stack_elide_zero_97 : i64
      %2089 = llvm.mlir.addressof @str138 : !llvm.ptr
      %2090 = arith.constant 11 : i64
      %2091 = func.call @cc_make_string(%2089, %2090) : (!llvm.ptr, i64) -> i64
      %2092 = llvm.mlir.addressof @str139 : !llvm.ptr
      %2093 = arith.constant 7 : i64
      %2094 = func.call @cc_make_string(%2092, %2093) : (!llvm.ptr, i64) -> i64
      %2095 = func.call @cc_intern(%2091, %2094) : (i64, i64) -> i64
      %2096 = func.call @cc_nil_value() : () -> i64
      %2097 = func.call @cc_cons(%2095, %2096) : (i64, i64) -> i64
      %2098 = func.call @cc_values_pack(%2097) : (i64) -> i64
      %2099 = llvm.mlir.addressof @str140 : !llvm.ptr
      %2100 = arith.constant 47 : i64
      %2101 = func.call @cc_make_string(%2099, %2100) : (!llvm.ptr, i64) -> i64
      %2102 = llvm.mlir.addressof @str141 : !llvm.ptr
      %2103 = arith.constant 4 : i64
      %2104 = func.call @cc_make_string(%2102, %2103) : (!llvm.ptr, i64) -> i64
      %2105 = llvm.mlir.addressof @str142 : !llvm.ptr
      %2106 = arith.constant 7 : i64
      %2107 = func.call @cc_make_string(%2105, %2106) : (!llvm.ptr, i64) -> i64
      %2108 = func.call @cc_intern(%2104, %2107) : (i64, i64) -> i64
      %2109 = func.call @cc_nil_value() : () -> i64
      %2110 = func.call @cc_cons(%2108, %2109) : (i64, i64) -> i64
      %2111 = func.call @cc_values_pack(%2110) : (i64) -> i64
      %2112 = llvm.mlir.addressof @str143 : !llvm.ptr
      %2113 = arith.constant 6 : i64
      %2114 = func.call @cc_make_string(%2112, %2113) : (!llvm.ptr, i64) -> i64
      %2115 = func.call @cc_nil_value() : () -> i64
      %2116 = func.call @cc_intern(%2114, %2115) : (i64, i64) -> i64
      %2117 = func.call @cc_nil_value() : () -> i64
      %2118 = func.call @cc_cons(%2116, %2117) : (i64, i64) -> i64
      %2119 = func.call @cc_values_pack(%2118) : (i64) -> i64
      %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
      %2120 = arith.addi %2116, %__rlasp_stack_elide_zero_98 : i64
      %2121 = func.call @cc_nil_value() : () -> i64
      %2122 = func.call @cc_errorp(%1218) : (i64) -> i64
      %2123 = arith.cmpi ne, %2122, %2121 : i64
      %2124 = arith.cmpi eq, %2121, %2121 : i64
      %2125 = arith.andi %2123, %2124 : i1
      %2126 = scf.if %2125 -> (i64) {
        scf.yield %1218 : i64
      } else {
        scf.yield %2121 : i64
      }
      %2127 = func.call @cc_errorp(%1617) : (i64) -> i64
      %2128 = arith.cmpi ne, %2127, %2121 : i64
      %2129 = arith.cmpi eq, %2126, %2121 : i64
      %2130 = arith.andi %2128, %2129 : i1
      %2131 = scf.if %2130 -> (i64) {
        scf.yield %1617 : i64
      } else {
        scf.yield %2126 : i64
      }
      %2132 = func.call @cc_errorp(%2083) : (i64) -> i64
      %2133 = arith.cmpi ne, %2132, %2121 : i64
      %2134 = arith.cmpi eq, %2131, %2121 : i64
      %2135 = arith.andi %2133, %2134 : i1
      %2136 = scf.if %2135 -> (i64) {
        scf.yield %2083 : i64
      } else {
        scf.yield %2131 : i64
      }
      %2137 = func.call @cc_errorp(%2088) : (i64) -> i64
      %2138 = arith.cmpi ne, %2137, %2121 : i64
      %2139 = arith.cmpi eq, %2136, %2121 : i64
      %2140 = arith.andi %2138, %2139 : i1
      %2141 = scf.if %2140 -> (i64) {
        scf.yield %2088 : i64
      } else {
        scf.yield %2136 : i64
      }
      %2142 = func.call @cc_errorp(%2095) : (i64) -> i64
      %2143 = arith.cmpi ne, %2142, %2121 : i64
      %2144 = arith.cmpi eq, %2141, %2121 : i64
      %2145 = arith.andi %2143, %2144 : i1
      %2146 = scf.if %2145 -> (i64) {
        scf.yield %2095 : i64
      } else {
        scf.yield %2141 : i64
      }
      %2147 = func.call @cc_errorp(%2101) : (i64) -> i64
      %2148 = arith.cmpi ne, %2147, %2121 : i64
      %2149 = arith.cmpi eq, %2146, %2121 : i64
      %2150 = arith.andi %2148, %2149 : i1
      %2151 = scf.if %2150 -> (i64) {
        scf.yield %2101 : i64
      } else {
        scf.yield %2146 : i64
      }
      %2152 = func.call @cc_errorp(%2108) : (i64) -> i64
      %2153 = arith.cmpi ne, %2152, %2121 : i64
      %2154 = arith.cmpi eq, %2151, %2121 : i64
      %2155 = arith.andi %2153, %2154 : i1
      %2156 = scf.if %2155 -> (i64) {
        scf.yield %2108 : i64
      } else {
        scf.yield %2151 : i64
      }
      %2157 = func.call @cc_errorp(%2120) : (i64) -> i64
      %2158 = arith.cmpi ne, %2157, %2121 : i64
      %2159 = arith.cmpi eq, %2156, %2121 : i64
      %2160 = arith.andi %2158, %2159 : i1
      %2161 = scf.if %2160 -> (i64) {
        scf.yield %2120 : i64
      } else {
        scf.yield %2156 : i64
      }
      %2162 = arith.cmpi ne, %2161, %2121 : i64
      scf.if %2162 {
        func.call @stack_push_pointer(%2161) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1218) : (i64) -> ()
        func.call @stack_push_pointer(%1617) : (i64) -> ()
        func.call @stack_push_pointer(%2083) : (i64) -> ()
        func.call @stack_push_pointer(%2088) : (i64) -> ()
        func.call @stack_push_pointer(%2095) : (i64) -> ()
        func.call @stack_push_pointer(%2101) : (i64) -> ()
        func.call @stack_push_pointer(%2108) : (i64) -> ()
        func.call @stack_push_pointer(%2120) : (i64) -> ()
        %2163 = llvm.mlir.addressof @str144 : !llvm.ptr
        %2164 = func.call @cc_make_function_ref_const(%2163) : (!llvm.ptr) -> i64
        %2165 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2164, %2165) : (i64, i64) -> ()
      }
      %2166 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2166 : i64
    }
    %2167 = func.call @cc_nil_value() : () -> i64
    %2168 = func.call @cc_errorp(%1209) : (i64) -> i64
    %2169 = arith.cmpi ne, %2168, %2167 : i64
    %2170 = scf.if %2169 -> (i64) {
      scf.yield %1209 : i64
    } else {
      %2171 = llvm.mlir.addressof @str145 : !llvm.ptr
      %2172 = arith.constant 18 : i64
      %2173 = func.call @cc_make_string(%2171, %2172) : (!llvm.ptr, i64) -> i64
      %2174 = func.call @cc_nil_value() : () -> i64
      %2175 = func.call @cc_intern(%2173, %2174) : (i64, i64) -> i64
      %2176 = func.call @cc_nil_value() : () -> i64
      %2177 = func.call @cc_cons(%2175, %2176) : (i64, i64) -> i64
      %2178 = func.call @cc_values_pack(%2177) : (i64) -> i64
      %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
      %2179 = arith.addi %2175, %__rlasp_stack_elide_zero_99 : i64
      %2180 = llvm.mlir.addressof @str146 : !llvm.ptr
      %2181 = arith.constant 15 : i64
      %2182 = func.call @cc_make_string(%2180, %2181) : (!llvm.ptr, i64) -> i64
      %2183 = func.call @cc_nil_value() : () -> i64
      %2184 = func.call @cc_intern(%2182, %2183) : (i64, i64) -> i64
      %2185 = func.call @cc_nil_value() : () -> i64
      %2186 = func.call @cc_cons(%2184, %2185) : (i64, i64) -> i64
      %2187 = func.call @cc_values_pack(%2186) : (i64) -> i64
      func.call @stack_push_pointer(%2184) : (i64) -> ()
      %2188 = llvm.mlir.addressof @str147 : !llvm.ptr
      %2189 = arith.constant 6 : i64
      %2190 = func.call @cc_make_string(%2188, %2189) : (!llvm.ptr, i64) -> i64
      %2191 = func.call @cc_nil_value() : () -> i64
      %2192 = func.call @cc_intern(%2190, %2191) : (i64, i64) -> i64
      %2193 = func.call @cc_nil_value() : () -> i64
      %2194 = func.call @cc_cons(%2192, %2193) : (i64, i64) -> i64
      %2195 = func.call @cc_values_pack(%2194) : (i64) -> i64
      func.call @stack_push_pointer(%2192) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2196 = llvm.mlir.addressof @str148 : !llvm.ptr
      %2197 = arith.constant 10 : i64
      %2198 = func.call @cc_make_string(%2196, %2197) : (!llvm.ptr, i64) -> i64
      %2199 = llvm.mlir.addressof @str149 : !llvm.ptr
      %2200 = arith.constant 11 : i64
      %2201 = func.call @cc_make_string(%2199, %2200) : (!llvm.ptr, i64) -> i64
      %2202 = func.call @cc_intern(%2198, %2201) : (i64, i64) -> i64
      %2203 = func.call @cc_nil_value() : () -> i64
      %2204 = func.call @cc_cons(%2202, %2203) : (i64, i64) -> i64
      %2205 = func.call @cc_values_pack(%2204) : (i64) -> i64
      func.call @stack_push_pointer(%2202) : (i64) -> ()
      %2206 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2206) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2207 = func.call @stack_pop_pointer() : () -> i64
      %2208 = func.call @stack_pop_pointer() : () -> i64
      %2209 = func.call @cc_cons(%2208, %2207) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2210 = arith.addi %2209, %__rlasp_stack_elide_zero_100 : i64
      %2211 = func.call @stack_pop_pointer() : () -> i64
      %2212 = func.call @cc_cons(%2211, %2210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2212) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2213 = func.call @stack_pop_pointer() : () -> i64
      %2214 = func.call @stack_pop_pointer() : () -> i64
      %2215 = func.call @cc_cons(%2214, %2213) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2216 = arith.addi %2215, %__rlasp_stack_elide_zero_101 : i64
      %2217 = func.call @stack_pop_pointer() : () -> i64
      %2218 = func.call @cc_cons(%2217, %2216) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2219 = arith.addi %2218, %__rlasp_stack_elide_zero_102 : i64
      %2220 = func.call @stack_pop_pointer() : () -> i64
      %2221 = func.call @cc_cons(%2220, %2219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2221) : (i64) -> ()
      %2222 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%2222) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2223 = func.call @stack_pop_pointer() : () -> i64
      %2224 = func.call @stack_pop_pointer() : () -> i64
      %2225 = func.call @cc_cons(%2224, %2223) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2226 = arith.addi %2225, %__rlasp_stack_elide_zero_103 : i64
      %2227 = func.call @stack_pop_pointer() : () -> i64
      %2228 = func.call @cc_cons(%2227, %2226) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
      %2229 = arith.addi %2228, %__rlasp_stack_elide_zero_104 : i64
      %2230 = func.call @stack_pop_pointer() : () -> i64
      %2231 = func.call @cc_cons(%2230, %2229) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
      %2232 = arith.addi %2231, %__rlasp_stack_elide_zero_105 : i64
      %2278 = arith.constant 236837129945106 : i64
      %2279 = arith.constant 0 : i64
      %2280 = func.call @cc_make_closure(%2278, %2279) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
      %2281 = arith.addi %2280, %__rlasp_stack_elide_zero_106 : i64
      %2282 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2282) : (i64) -> ()
      %2283 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2283) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2284 = func.call @stack_pop_pointer() : () -> i64
      %2285 = func.call @stack_pop_pointer() : () -> i64
      %2286 = func.call @cc_cons(%2285, %2284) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
      %2287 = arith.addi %2286, %__rlasp_stack_elide_zero_107 : i64
      %2288 = func.call @stack_pop_pointer() : () -> i64
      %2289 = func.call @cc_cons(%2288, %2287) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
      %2290 = arith.addi %2289, %__rlasp_stack_elide_zero_108 : i64
      %2291 = llvm.mlir.addressof @str152 : !llvm.ptr
      %2292 = arith.constant 11 : i64
      %2293 = func.call @cc_make_string(%2291, %2292) : (!llvm.ptr, i64) -> i64
      %2294 = llvm.mlir.addressof @str153 : !llvm.ptr
      %2295 = arith.constant 7 : i64
      %2296 = func.call @cc_make_string(%2294, %2295) : (!llvm.ptr, i64) -> i64
      %2297 = func.call @cc_intern(%2293, %2296) : (i64, i64) -> i64
      %2298 = func.call @cc_nil_value() : () -> i64
      %2299 = func.call @cc_cons(%2297, %2298) : (i64, i64) -> i64
      %2300 = func.call @cc_values_pack(%2299) : (i64) -> i64
      %2301 = llvm.mlir.addressof @str154 : !llvm.ptr
      %2302 = arith.constant 49 : i64
      %2303 = func.call @cc_make_string(%2301, %2302) : (!llvm.ptr, i64) -> i64
      %2304 = llvm.mlir.addressof @str155 : !llvm.ptr
      %2305 = arith.constant 4 : i64
      %2306 = func.call @cc_make_string(%2304, %2305) : (!llvm.ptr, i64) -> i64
      %2307 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2308 = arith.constant 7 : i64
      %2309 = func.call @cc_make_string(%2307, %2308) : (!llvm.ptr, i64) -> i64
      %2310 = func.call @cc_intern(%2306, %2309) : (i64, i64) -> i64
      %2311 = func.call @cc_nil_value() : () -> i64
      %2312 = func.call @cc_cons(%2310, %2311) : (i64, i64) -> i64
      %2313 = func.call @cc_values_pack(%2312) : (i64) -> i64
      %2314 = llvm.mlir.addressof @str157 : !llvm.ptr
      %2315 = arith.constant 6 : i64
      %2316 = func.call @cc_make_string(%2314, %2315) : (!llvm.ptr, i64) -> i64
      %2317 = func.call @cc_nil_value() : () -> i64
      %2318 = func.call @cc_intern(%2316, %2317) : (i64, i64) -> i64
      %2319 = func.call @cc_nil_value() : () -> i64
      %2320 = func.call @cc_cons(%2318, %2319) : (i64, i64) -> i64
      %2321 = func.call @cc_values_pack(%2320) : (i64) -> i64
      %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
      %2322 = arith.addi %2318, %__rlasp_stack_elide_zero_109 : i64
      %2323 = func.call @cc_nil_value() : () -> i64
      %2324 = func.call @cc_errorp(%2179) : (i64) -> i64
      %2325 = arith.cmpi ne, %2324, %2323 : i64
      %2326 = arith.cmpi eq, %2323, %2323 : i64
      %2327 = arith.andi %2325, %2326 : i1
      %2328 = scf.if %2327 -> (i64) {
        scf.yield %2179 : i64
      } else {
        scf.yield %2323 : i64
      }
      %2329 = func.call @cc_errorp(%2232) : (i64) -> i64
      %2330 = arith.cmpi ne, %2329, %2323 : i64
      %2331 = arith.cmpi eq, %2328, %2323 : i64
      %2332 = arith.andi %2330, %2331 : i1
      %2333 = scf.if %2332 -> (i64) {
        scf.yield %2232 : i64
      } else {
        scf.yield %2328 : i64
      }
      %2334 = func.call @cc_errorp(%2281) : (i64) -> i64
      %2335 = arith.cmpi ne, %2334, %2323 : i64
      %2336 = arith.cmpi eq, %2333, %2323 : i64
      %2337 = arith.andi %2335, %2336 : i1
      %2338 = scf.if %2337 -> (i64) {
        scf.yield %2281 : i64
      } else {
        scf.yield %2333 : i64
      }
      %2339 = func.call @cc_errorp(%2290) : (i64) -> i64
      %2340 = arith.cmpi ne, %2339, %2323 : i64
      %2341 = arith.cmpi eq, %2338, %2323 : i64
      %2342 = arith.andi %2340, %2341 : i1
      %2343 = scf.if %2342 -> (i64) {
        scf.yield %2290 : i64
      } else {
        scf.yield %2338 : i64
      }
      %2344 = func.call @cc_errorp(%2297) : (i64) -> i64
      %2345 = arith.cmpi ne, %2344, %2323 : i64
      %2346 = arith.cmpi eq, %2343, %2323 : i64
      %2347 = arith.andi %2345, %2346 : i1
      %2348 = scf.if %2347 -> (i64) {
        scf.yield %2297 : i64
      } else {
        scf.yield %2343 : i64
      }
      %2349 = func.call @cc_errorp(%2303) : (i64) -> i64
      %2350 = arith.cmpi ne, %2349, %2323 : i64
      %2351 = arith.cmpi eq, %2348, %2323 : i64
      %2352 = arith.andi %2350, %2351 : i1
      %2353 = scf.if %2352 -> (i64) {
        scf.yield %2303 : i64
      } else {
        scf.yield %2348 : i64
      }
      %2354 = func.call @cc_errorp(%2310) : (i64) -> i64
      %2355 = arith.cmpi ne, %2354, %2323 : i64
      %2356 = arith.cmpi eq, %2353, %2323 : i64
      %2357 = arith.andi %2355, %2356 : i1
      %2358 = scf.if %2357 -> (i64) {
        scf.yield %2310 : i64
      } else {
        scf.yield %2353 : i64
      }
      %2359 = func.call @cc_errorp(%2322) : (i64) -> i64
      %2360 = arith.cmpi ne, %2359, %2323 : i64
      %2361 = arith.cmpi eq, %2358, %2323 : i64
      %2362 = arith.andi %2360, %2361 : i1
      %2363 = scf.if %2362 -> (i64) {
        scf.yield %2322 : i64
      } else {
        scf.yield %2358 : i64
      }
      %2364 = arith.cmpi ne, %2363, %2323 : i64
      scf.if %2364 {
        func.call @stack_push_pointer(%2363) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2179) : (i64) -> ()
        func.call @stack_push_pointer(%2232) : (i64) -> ()
        func.call @stack_push_pointer(%2281) : (i64) -> ()
        func.call @stack_push_pointer(%2290) : (i64) -> ()
        func.call @stack_push_pointer(%2297) : (i64) -> ()
        func.call @stack_push_pointer(%2303) : (i64) -> ()
        func.call @stack_push_pointer(%2310) : (i64) -> ()
        func.call @stack_push_pointer(%2322) : (i64) -> ()
        %2365 = llvm.mlir.addressof @str158 : !llvm.ptr
        %2366 = func.call @cc_make_function_ref_const(%2365) : (!llvm.ptr) -> i64
        %2367 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2366, %2367) : (i64, i64) -> ()
      }
      %2368 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2368 : i64
    }
    %2369 = func.call @cc_nil_value() : () -> i64
    %2370 = func.call @cc_errorp(%2170) : (i64) -> i64
    %2371 = arith.cmpi ne, %2370, %2369 : i64
    %2372 = scf.if %2371 -> (i64) {
      scf.yield %2170 : i64
    } else {
      %2373 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2374 = arith.constant 25 : i64
      %2375 = func.call @cc_make_string(%2373, %2374) : (!llvm.ptr, i64) -> i64
      %2376 = func.call @cc_nil_value() : () -> i64
      %2377 = func.call @cc_intern(%2375, %2376) : (i64, i64) -> i64
      %2378 = func.call @cc_nil_value() : () -> i64
      %2379 = func.call @cc_cons(%2377, %2378) : (i64, i64) -> i64
      %2380 = func.call @cc_values_pack(%2379) : (i64) -> i64
      %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
      %2381 = arith.addi %2377, %__rlasp_stack_elide_zero_110 : i64
      %2382 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2383 = arith.constant 3 : i64
      %2384 = func.call @cc_make_string(%2382, %2383) : (!llvm.ptr, i64) -> i64
      %2385 = func.call @cc_nil_value() : () -> i64
      %2386 = func.call @cc_intern(%2384, %2385) : (i64, i64) -> i64
      %2387 = func.call @cc_nil_value() : () -> i64
      %2388 = func.call @cc_cons(%2386, %2387) : (i64, i64) -> i64
      %2389 = func.call @cc_values_pack(%2388) : (i64) -> i64
      func.call @stack_push_pointer(%2386) : (i64) -> ()
      %2390 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2391 = arith.constant 5 : i64
      %2392 = func.call @cc_make_string(%2390, %2391) : (!llvm.ptr, i64) -> i64
      %2393 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2394 = arith.constant 11 : i64
      %2395 = func.call @cc_make_string(%2393, %2394) : (!llvm.ptr, i64) -> i64
      %2396 = func.call @cc_intern(%2392, %2395) : (i64, i64) -> i64
      %2397 = func.call @cc_nil_value() : () -> i64
      %2398 = func.call @cc_cons(%2396, %2397) : (i64, i64) -> i64
      %2399 = func.call @cc_values_pack(%2398) : (i64) -> i64
      func.call @stack_push_pointer(%2396) : (i64) -> ()
      %2400 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2400) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2401 = func.call @stack_pop_pointer() : () -> i64
      %2402 = func.call @stack_pop_pointer() : () -> i64
      %2403 = func.call @cc_cons(%2402, %2401) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
      %2404 = arith.addi %2403, %__rlasp_stack_elide_zero_111 : i64
      %2405 = func.call @stack_pop_pointer() : () -> i64
      %2406 = func.call @cc_cons(%2405, %2404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2406) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2407 = func.call @stack_pop_pointer() : () -> i64
      %2408 = func.call @stack_pop_pointer() : () -> i64
      %2409 = func.call @cc_cons(%2408, %2407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2409) : (i64) -> ()
      %2410 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2411 = arith.constant 3 : i64
      %2412 = func.call @cc_make_string(%2410, %2411) : (!llvm.ptr, i64) -> i64
      %2413 = func.call @cc_nil_value() : () -> i64
      %2414 = func.call @cc_intern(%2412, %2413) : (i64, i64) -> i64
      %2415 = func.call @cc_nil_value() : () -> i64
      %2416 = func.call @cc_cons(%2414, %2415) : (i64, i64) -> i64
      %2417 = func.call @cc_values_pack(%2416) : (i64) -> i64
      func.call @stack_push_pointer(%2414) : (i64) -> ()
      %2418 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2419 = arith.constant 1 : i64
      %2420 = func.call @cc_make_string(%2418, %2419) : (!llvm.ptr, i64) -> i64
      %2421 = func.call @cc_nil_value() : () -> i64
      %2422 = func.call @cc_intern(%2420, %2421) : (i64, i64) -> i64
      %2423 = func.call @cc_nil_value() : () -> i64
      %2424 = func.call @cc_cons(%2422, %2423) : (i64, i64) -> i64
      %2425 = func.call @cc_values_pack(%2424) : (i64) -> i64
      func.call @stack_push_pointer(%2422) : (i64) -> ()
      %2426 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2427 = arith.constant 10 : i64
      %2428 = func.call @cc_make_string(%2426, %2427) : (!llvm.ptr, i64) -> i64
      %2429 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2430 = arith.constant 11 : i64
      %2431 = func.call @cc_make_string(%2429, %2430) : (!llvm.ptr, i64) -> i64
      %2432 = func.call @cc_intern(%2428, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_nil_value() : () -> i64
      %2434 = func.call @cc_cons(%2432, %2433) : (i64, i64) -> i64
      %2435 = func.call @cc_values_pack(%2434) : (i64) -> i64
      func.call @stack_push_pointer(%2432) : (i64) -> ()
      %2436 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2437 = func.call @stack_pop_pointer() : () -> i64
      %2438 = func.call @stack_pop_pointer() : () -> i64
      %2439 = func.call @cc_cons(%2438, %2437) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
      %2440 = arith.addi %2439, %__rlasp_stack_elide_zero_112 : i64
      %2441 = func.call @stack_pop_pointer() : () -> i64
      %2442 = func.call @cc_cons(%2441, %2440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2443 = func.call @stack_pop_pointer() : () -> i64
      %2444 = func.call @stack_pop_pointer() : () -> i64
      %2445 = func.call @cc_cons(%2444, %2443) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
      %2446 = arith.addi %2445, %__rlasp_stack_elide_zero_113 : i64
      %2447 = func.call @stack_pop_pointer() : () -> i64
      %2448 = func.call @cc_cons(%2447, %2446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2448) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2449 = func.call @stack_pop_pointer() : () -> i64
      %2450 = func.call @stack_pop_pointer() : () -> i64
      %2451 = func.call @cc_cons(%2450, %2449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2451) : (i64) -> ()
      %2452 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2453 = arith.constant 4 : i64
      %2454 = func.call @cc_make_string(%2452, %2453) : (!llvm.ptr, i64) -> i64
      %2455 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2456 = arith.constant 11 : i64
      %2457 = func.call @cc_make_string(%2455, %2456) : (!llvm.ptr, i64) -> i64
      %2458 = func.call @cc_intern(%2454, %2457) : (i64, i64) -> i64
      %2459 = func.call @cc_nil_value() : () -> i64
      %2460 = func.call @cc_cons(%2458, %2459) : (i64, i64) -> i64
      %2461 = func.call @cc_values_pack(%2460) : (i64) -> i64
      func.call @stack_push_pointer(%2458) : (i64) -> ()
      %2462 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2463 = arith.constant 3 : i64
      %2464 = func.call @cc_make_string(%2462, %2463) : (!llvm.ptr, i64) -> i64
      %2465 = func.call @cc_nil_value() : () -> i64
      %2466 = func.call @cc_intern(%2464, %2465) : (i64, i64) -> i64
      %2467 = func.call @cc_nil_value() : () -> i64
      %2468 = func.call @cc_cons(%2466, %2467) : (i64, i64) -> i64
      %2469 = func.call @cc_values_pack(%2468) : (i64) -> i64
      func.call @stack_push_pointer(%2466) : (i64) -> ()
      %2470 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2471 = arith.constant 1 : i64
      %2472 = func.call @cc_make_string(%2470, %2471) : (!llvm.ptr, i64) -> i64
      %2473 = func.call @cc_nil_value() : () -> i64
      %2474 = func.call @cc_intern(%2472, %2473) : (i64, i64) -> i64
      %2475 = func.call @cc_nil_value() : () -> i64
      %2476 = func.call @cc_cons(%2474, %2475) : (i64, i64) -> i64
      %2477 = func.call @cc_values_pack(%2476) : (i64) -> i64
      func.call @stack_push_pointer(%2474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2478 = func.call @stack_pop_pointer() : () -> i64
      %2479 = func.call @stack_pop_pointer() : () -> i64
      %2480 = func.call @cc_cons(%2479, %2478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2480) : (i64) -> ()
      %2481 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2482 = arith.constant 7 : i64
      %2483 = func.call @cc_make_string(%2481, %2482) : (!llvm.ptr, i64) -> i64
      %2484 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2485 = arith.constant 11 : i64
      %2486 = func.call @cc_make_string(%2484, %2485) : (!llvm.ptr, i64) -> i64
      %2487 = func.call @cc_intern(%2483, %2486) : (i64, i64) -> i64
      %2488 = func.call @cc_nil_value() : () -> i64
      %2489 = func.call @cc_cons(%2487, %2488) : (i64, i64) -> i64
      %2490 = func.call @cc_values_pack(%2489) : (i64) -> i64
      func.call @stack_push_pointer(%2487) : (i64) -> ()
      %2491 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2492 = arith.constant 6 : i64
      %2493 = func.call @cc_make_string(%2491, %2492) : (!llvm.ptr, i64) -> i64
      %2494 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2495 = arith.constant 11 : i64
      %2496 = func.call @cc_make_string(%2494, %2495) : (!llvm.ptr, i64) -> i64
      %2497 = func.call @cc_intern(%2493, %2496) : (i64, i64) -> i64
      %2498 = func.call @cc_nil_value() : () -> i64
      %2499 = func.call @cc_cons(%2497, %2498) : (i64, i64) -> i64
      %2500 = func.call @cc_values_pack(%2499) : (i64) -> i64
      func.call @stack_push_pointer(%2497) : (i64) -> ()
      %2501 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2502 = arith.constant 1 : i64
      %2503 = func.call @cc_make_string(%2501, %2502) : (!llvm.ptr, i64) -> i64
      %2504 = func.call @cc_nil_value() : () -> i64
      %2505 = func.call @cc_intern(%2503, %2504) : (i64, i64) -> i64
      %2506 = func.call @cc_nil_value() : () -> i64
      %2507 = func.call @cc_cons(%2505, %2506) : (i64, i64) -> i64
      %2508 = func.call @cc_values_pack(%2507) : (i64) -> i64
      func.call @stack_push_pointer(%2505) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @stack_pop_pointer() : () -> i64
      %2511 = func.call @cc_cons(%2510, %2509) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
      %2512 = arith.addi %2511, %__rlasp_stack_elide_zero_114 : i64
      %2513 = func.call @stack_pop_pointer() : () -> i64
      %2514 = func.call @cc_cons(%2513, %2512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2515 = func.call @stack_pop_pointer() : () -> i64
      %2516 = func.call @stack_pop_pointer() : () -> i64
      %2517 = func.call @cc_cons(%2516, %2515) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
      %2518 = arith.addi %2517, %__rlasp_stack_elide_zero_115 : i64
      %2519 = func.call @stack_pop_pointer() : () -> i64
      %2520 = func.call @cc_cons(%2519, %2518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2520) : (i64) -> ()
      %2521 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2522 = arith.constant 4 : i64
      %2523 = func.call @cc_make_string(%2521, %2522) : (!llvm.ptr, i64) -> i64
      %2524 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2525 = arith.constant 11 : i64
      %2526 = func.call @cc_make_string(%2524, %2525) : (!llvm.ptr, i64) -> i64
      %2527 = func.call @cc_intern(%2523, %2526) : (i64, i64) -> i64
      %2528 = func.call @cc_nil_value() : () -> i64
      %2529 = func.call @cc_cons(%2527, %2528) : (i64, i64) -> i64
      %2530 = func.call @cc_values_pack(%2529) : (i64) -> i64
      func.call @stack_push_pointer(%2527) : (i64) -> ()
      %2531 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2532 = arith.constant 5 : i64
      %2533 = func.call @cc_make_string(%2531, %2532) : (!llvm.ptr, i64) -> i64
      %2534 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2535 = arith.constant 11 : i64
      %2536 = func.call @cc_make_string(%2534, %2535) : (!llvm.ptr, i64) -> i64
      %2537 = func.call @cc_intern(%2533, %2536) : (i64, i64) -> i64
      %2538 = func.call @cc_nil_value() : () -> i64
      %2539 = func.call @cc_cons(%2537, %2538) : (i64, i64) -> i64
      %2540 = func.call @cc_values_pack(%2539) : (i64) -> i64
      func.call @stack_push_pointer(%2537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2541 = func.call @stack_pop_pointer() : () -> i64
      %2542 = func.call @stack_pop_pointer() : () -> i64
      %2543 = func.call @cc_cons(%2542, %2541) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
      %2544 = arith.addi %2543, %__rlasp_stack_elide_zero_116 : i64
      %2545 = func.call @stack_pop_pointer() : () -> i64
      %2546 = func.call @cc_cons(%2545, %2544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2546) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2547 = func.call @stack_pop_pointer() : () -> i64
      %2548 = func.call @stack_pop_pointer() : () -> i64
      %2549 = func.call @cc_cons(%2548, %2547) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
      %2550 = arith.addi %2549, %__rlasp_stack_elide_zero_117 : i64
      %2551 = func.call @stack_pop_pointer() : () -> i64
      %2552 = func.call @cc_cons(%2551, %2550) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
      %2553 = arith.addi %2552, %__rlasp_stack_elide_zero_118 : i64
      %2554 = func.call @stack_pop_pointer() : () -> i64
      %2555 = func.call @cc_cons(%2554, %2553) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
      %2556 = arith.addi %2555, %__rlasp_stack_elide_zero_119 : i64
      %2557 = func.call @stack_pop_pointer() : () -> i64
      %2558 = func.call @cc_cons(%2557, %2556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2558) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2559 = func.call @stack_pop_pointer() : () -> i64
      %2560 = func.call @stack_pop_pointer() : () -> i64
      %2561 = func.call @cc_cons(%2560, %2559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2561) : (i64) -> ()
      %2562 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2563 = arith.constant 4 : i64
      %2564 = func.call @cc_make_string(%2562, %2563) : (!llvm.ptr, i64) -> i64
      %2565 = func.call @cc_nil_value() : () -> i64
      %2566 = func.call @cc_intern(%2564, %2565) : (i64, i64) -> i64
      %2567 = func.call @cc_nil_value() : () -> i64
      %2568 = func.call @cc_cons(%2566, %2567) : (i64, i64) -> i64
      %2569 = func.call @cc_values_pack(%2568) : (i64) -> i64
      func.call @stack_push_pointer(%2566) : (i64) -> ()
      %2570 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2571 = arith.constant 6 : i64
      %2572 = func.call @cc_make_string(%2570, %2571) : (!llvm.ptr, i64) -> i64
      %2573 = func.call @cc_nil_value() : () -> i64
      %2574 = func.call @cc_intern(%2572, %2573) : (i64, i64) -> i64
      %2575 = func.call @cc_nil_value() : () -> i64
      %2576 = func.call @cc_cons(%2574, %2575) : (i64, i64) -> i64
      %2577 = func.call @cc_values_pack(%2576) : (i64) -> i64
      func.call @stack_push_pointer(%2574) : (i64) -> ()
      %2578 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2578) : (i64) -> ()
      %2579 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2580 = arith.constant 2 : i64
      %2581 = func.call @cc_make_string(%2579, %2580) : (!llvm.ptr, i64) -> i64
      %2582 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2583 = arith.constant 11 : i64
      %2584 = func.call @cc_make_string(%2582, %2583) : (!llvm.ptr, i64) -> i64
      %2585 = func.call @cc_intern(%2581, %2584) : (i64, i64) -> i64
      %2586 = func.call @cc_nil_value() : () -> i64
      %2587 = func.call @cc_cons(%2585, %2586) : (i64, i64) -> i64
      %2588 = func.call @cc_values_pack(%2587) : (i64) -> i64
      func.call @stack_push_pointer(%2585) : (i64) -> ()
      %2589 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2590 = arith.constant 8 : i64
      %2591 = func.call @cc_make_string(%2589, %2590) : (!llvm.ptr, i64) -> i64
      %2592 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2593 = arith.constant 7 : i64
      %2594 = func.call @cc_make_string(%2592, %2593) : (!llvm.ptr, i64) -> i64
      %2595 = func.call @cc_intern(%2591, %2594) : (i64, i64) -> i64
      %2596 = func.call @cc_nil_value() : () -> i64
      %2597 = func.call @cc_cons(%2595, %2596) : (i64, i64) -> i64
      %2598 = func.call @cc_values_pack(%2597) : (i64) -> i64
      func.call @stack_push_pointer(%2595) : (i64) -> ()
      %2599 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2600 = arith.constant 1 : i64
      %2601 = func.call @cc_make_string(%2599, %2600) : (!llvm.ptr, i64) -> i64
      %2602 = func.call @cc_nil_value() : () -> i64
      %2603 = func.call @cc_intern(%2601, %2602) : (i64, i64) -> i64
      %2604 = func.call @cc_nil_value() : () -> i64
      %2605 = func.call @cc_cons(%2603, %2604) : (i64, i64) -> i64
      %2606 = func.call @cc_values_pack(%2605) : (i64) -> i64
      func.call @stack_push_pointer(%2603) : (i64) -> ()
      %2607 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2608 = arith.constant 8 : i64
      %2609 = func.call @cc_make_string(%2607, %2608) : (!llvm.ptr, i64) -> i64
      %2610 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2611 = arith.constant 11 : i64
      %2612 = func.call @cc_make_string(%2610, %2611) : (!llvm.ptr, i64) -> i64
      %2613 = func.call @cc_intern(%2609, %2612) : (i64, i64) -> i64
      %2614 = func.call @cc_nil_value() : () -> i64
      %2615 = func.call @cc_cons(%2613, %2614) : (i64, i64) -> i64
      %2616 = func.call @cc_values_pack(%2615) : (i64) -> i64
      func.call @stack_push_pointer(%2613) : (i64) -> ()
      %2617 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2618 = arith.constant 3 : i64
      %2619 = func.call @cc_make_string(%2617, %2618) : (!llvm.ptr, i64) -> i64
      %2620 = func.call @cc_nil_value() : () -> i64
      %2621 = func.call @cc_intern(%2619, %2620) : (i64, i64) -> i64
      %2622 = func.call @cc_nil_value() : () -> i64
      %2623 = func.call @cc_cons(%2621, %2622) : (i64, i64) -> i64
      %2624 = func.call @cc_values_pack(%2623) : (i64) -> i64
      func.call @stack_push_pointer(%2621) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2625 = func.call @stack_pop_pointer() : () -> i64
      %2626 = func.call @stack_pop_pointer() : () -> i64
      %2627 = func.call @cc_cons(%2626, %2625) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
      %2628 = arith.addi %2627, %__rlasp_stack_elide_zero_120 : i64
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @cc_cons(%2629, %2628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2630) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2631 = func.call @stack_pop_pointer() : () -> i64
      %2632 = func.call @stack_pop_pointer() : () -> i64
      %2633 = func.call @cc_cons(%2632, %2631) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
      %2634 = arith.addi %2633, %__rlasp_stack_elide_zero_121 : i64
      %2635 = func.call @stack_pop_pointer() : () -> i64
      %2636 = func.call @cc_cons(%2635, %2634) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2637 = arith.addi %2636, %__rlasp_stack_elide_zero_122 : i64
      %2638 = func.call @stack_pop_pointer() : () -> i64
      %2639 = func.call @cc_cons(%2638, %2637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2639) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2640 = func.call @stack_pop_pointer() : () -> i64
      %2641 = func.call @stack_pop_pointer() : () -> i64
      %2642 = func.call @cc_cons(%2641, %2640) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2643 = arith.addi %2642, %__rlasp_stack_elide_zero_123 : i64
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @cc_cons(%2644, %2643) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2646 = arith.addi %2645, %__rlasp_stack_elide_zero_124 : i64
      %2647 = func.call @stack_pop_pointer() : () -> i64
      %2648 = func.call @cc_cons(%2647, %2646) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2649 = arith.addi %2648, %__rlasp_stack_elide_zero_125 : i64
      %2650 = func.call @stack_pop_pointer() : () -> i64
      %2651 = func.call @cc_cons(%2650, %2649) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
      %2652 = arith.addi %2651, %__rlasp_stack_elide_zero_126 : i64
      %2653 = func.call @stack_pop_pointer() : () -> i64
      %2654 = func.call @cc_cons(%2653, %2652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2654) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2655 = func.call @stack_pop_pointer() : () -> i64
      %2656 = func.call @stack_pop_pointer() : () -> i64
      %2657 = func.call @cc_cons(%2656, %2655) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_127 = arith.constant 0 : i64
      %2658 = arith.addi %2657, %__rlasp_stack_elide_zero_127 : i64
      %2659 = func.call @stack_pop_pointer() : () -> i64
      %2660 = func.call @cc_cons(%2659, %2658) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_128 = arith.constant 0 : i64
      %2661 = arith.addi %2660, %__rlasp_stack_elide_zero_128 : i64
      %2662 = func.call @stack_pop_pointer() : () -> i64
      %2663 = func.call @cc_cons(%2662, %2661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2663) : (i64) -> ()
      %2664 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2665 = arith.constant 10 : i64
      %2666 = func.call @cc_make_string(%2664, %2665) : (!llvm.ptr, i64) -> i64
      %2667 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2668 = arith.constant 7 : i64
      %2669 = func.call @cc_make_string(%2667, %2668) : (!llvm.ptr, i64) -> i64
      %2670 = func.call @cc_intern(%2666, %2669) : (i64, i64) -> i64
      %2671 = func.call @cc_nil_value() : () -> i64
      %2672 = func.call @cc_cons(%2670, %2671) : (i64, i64) -> i64
      %2673 = func.call @cc_values_pack(%2672) : (i64) -> i64
      func.call @stack_push_pointer(%2670) : (i64) -> ()
      %2674 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2675 = arith.constant 1 : i64
      %2676 = func.call @cc_make_string(%2674, %2675) : (!llvm.ptr, i64) -> i64
      %2677 = func.call @cc_nil_value() : () -> i64
      %2678 = func.call @cc_intern(%2676, %2677) : (i64, i64) -> i64
      %2679 = func.call @cc_nil_value() : () -> i64
      %2680 = func.call @cc_cons(%2678, %2679) : (i64, i64) -> i64
      %2681 = func.call @cc_values_pack(%2680) : (i64) -> i64
      func.call @stack_push_pointer(%2678) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2682 = func.call @stack_pop_pointer() : () -> i64
      %2683 = func.call @stack_pop_pointer() : () -> i64
      %2684 = func.call @cc_cons(%2683, %2682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_129 = arith.constant 0 : i64
      %2685 = arith.addi %2684, %__rlasp_stack_elide_zero_129 : i64
      %2686 = func.call @stack_pop_pointer() : () -> i64
      %2687 = func.call @cc_cons(%2686, %2685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2687) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2688 = func.call @stack_pop_pointer() : () -> i64
      %2689 = func.call @stack_pop_pointer() : () -> i64
      %2690 = func.call @cc_cons(%2689, %2688) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_130 = arith.constant 0 : i64
      %2691 = arith.addi %2690, %__rlasp_stack_elide_zero_130 : i64
      %2692 = func.call @stack_pop_pointer() : () -> i64
      %2693 = func.call @cc_cons(%2692, %2691) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_131 = arith.constant 0 : i64
      %2694 = arith.addi %2693, %__rlasp_stack_elide_zero_131 : i64
      %2695 = func.call @stack_pop_pointer() : () -> i64
      %2696 = func.call @cc_cons(%2695, %2694) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_132 = arith.constant 0 : i64
      %2697 = arith.addi %2696, %__rlasp_stack_elide_zero_132 : i64
      %2698 = func.call @stack_pop_pointer() : () -> i64
      %2699 = func.call @cc_cons(%2698, %2697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2699) : (i64) -> ()
      %2700 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2701 = arith.constant 4 : i64
      %2702 = func.call @cc_make_string(%2700, %2701) : (!llvm.ptr, i64) -> i64
      %2703 = func.call @cc_nil_value() : () -> i64
      %2704 = func.call @cc_intern(%2702, %2703) : (i64, i64) -> i64
      %2705 = func.call @cc_nil_value() : () -> i64
      %2706 = func.call @cc_cons(%2704, %2705) : (i64, i64) -> i64
      %2707 = func.call @cc_values_pack(%2706) : (i64) -> i64
      func.call @stack_push_pointer(%2704) : (i64) -> ()
      %2708 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2709 = arith.constant 6 : i64
      %2710 = func.call @cc_make_string(%2708, %2709) : (!llvm.ptr, i64) -> i64
      %2711 = func.call @cc_nil_value() : () -> i64
      %2712 = func.call @cc_intern(%2710, %2711) : (i64, i64) -> i64
      %2713 = func.call @cc_nil_value() : () -> i64
      %2714 = func.call @cc_cons(%2712, %2713) : (i64, i64) -> i64
      %2715 = func.call @cc_values_pack(%2714) : (i64) -> i64
      func.call @stack_push_pointer(%2712) : (i64) -> ()
      %2716 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2716) : (i64) -> ()
      %2717 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2718 = arith.constant 2 : i64
      %2719 = func.call @cc_make_string(%2717, %2718) : (!llvm.ptr, i64) -> i64
      %2720 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2721 = arith.constant 11 : i64
      %2722 = func.call @cc_make_string(%2720, %2721) : (!llvm.ptr, i64) -> i64
      %2723 = func.call @cc_intern(%2719, %2722) : (i64, i64) -> i64
      %2724 = func.call @cc_nil_value() : () -> i64
      %2725 = func.call @cc_cons(%2723, %2724) : (i64, i64) -> i64
      %2726 = func.call @cc_values_pack(%2725) : (i64) -> i64
      func.call @stack_push_pointer(%2723) : (i64) -> ()
      %2727 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2728 = arith.constant 15 : i64
      %2729 = func.call @cc_make_string(%2727, %2728) : (!llvm.ptr, i64) -> i64
      %2730 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2731 = arith.constant 7 : i64
      %2732 = func.call @cc_make_string(%2730, %2731) : (!llvm.ptr, i64) -> i64
      %2733 = func.call @cc_intern(%2729, %2732) : (i64, i64) -> i64
      %2734 = func.call @cc_nil_value() : () -> i64
      %2735 = func.call @cc_cons(%2733, %2734) : (i64, i64) -> i64
      %2736 = func.call @cc_values_pack(%2735) : (i64) -> i64
      func.call @stack_push_pointer(%2733) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2737 = func.call @stack_pop_pointer() : () -> i64
      %2738 = func.call @stack_pop_pointer() : () -> i64
      %2739 = func.call @cc_cons(%2738, %2737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2739) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2740 = func.call @stack_pop_pointer() : () -> i64
      %2741 = func.call @stack_pop_pointer() : () -> i64
      %2742 = func.call @cc_cons(%2741, %2740) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_133 = arith.constant 0 : i64
      %2743 = arith.addi %2742, %__rlasp_stack_elide_zero_133 : i64
      %2744 = func.call @stack_pop_pointer() : () -> i64
      %2745 = func.call @cc_cons(%2744, %2743) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_134 = arith.constant 0 : i64
      %2746 = arith.addi %2745, %__rlasp_stack_elide_zero_134 : i64
      %2747 = func.call @stack_pop_pointer() : () -> i64
      %2748 = func.call @cc_cons(%2747, %2746) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_135 = arith.constant 0 : i64
      %2749 = arith.addi %2748, %__rlasp_stack_elide_zero_135 : i64
      %2750 = func.call @stack_pop_pointer() : () -> i64
      %2751 = func.call @cc_cons(%2750, %2749) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_136 = arith.constant 0 : i64
      %2752 = arith.addi %2751, %__rlasp_stack_elide_zero_136 : i64
      %2753 = func.call @stack_pop_pointer() : () -> i64
      %2754 = func.call @cc_cons(%2753, %2752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2754) : (i64) -> ()
      %2755 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2756 = arith.constant 5 : i64
      %2757 = func.call @cc_make_string(%2755, %2756) : (!llvm.ptr, i64) -> i64
      %2758 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2759 = arith.constant 11 : i64
      %2760 = func.call @cc_make_string(%2758, %2759) : (!llvm.ptr, i64) -> i64
      %2761 = func.call @cc_intern(%2757, %2760) : (i64, i64) -> i64
      %2762 = func.call @cc_nil_value() : () -> i64
      %2763 = func.call @cc_cons(%2761, %2762) : (i64, i64) -> i64
      %2764 = func.call @cc_values_pack(%2763) : (i64) -> i64
      func.call @stack_push_pointer(%2761) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2765 = func.call @stack_pop_pointer() : () -> i64
      %2766 = func.call @stack_pop_pointer() : () -> i64
      %2767 = func.call @cc_cons(%2766, %2765) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_137 = arith.constant 0 : i64
      %2768 = arith.addi %2767, %__rlasp_stack_elide_zero_137 : i64
      %2769 = func.call @stack_pop_pointer() : () -> i64
      %2770 = func.call @cc_cons(%2769, %2768) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_138 = arith.constant 0 : i64
      %2771 = arith.addi %2770, %__rlasp_stack_elide_zero_138 : i64
      %2772 = func.call @stack_pop_pointer() : () -> i64
      %2773 = func.call @cc_cons(%2772, %2771) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_139 = arith.constant 0 : i64
      %2774 = arith.addi %2773, %__rlasp_stack_elide_zero_139 : i64
      %2775 = func.call @stack_pop_pointer() : () -> i64
      %2776 = func.call @cc_cons(%2775, %2774) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_140 = arith.constant 0 : i64
      %2777 = arith.addi %2776, %__rlasp_stack_elide_zero_140 : i64
      %2778 = func.call @stack_pop_pointer() : () -> i64
      %2779 = func.call @cc_cons(%2778, %2777) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_141 = arith.constant 0 : i64
      %2780 = arith.addi %2779, %__rlasp_stack_elide_zero_141 : i64
      %3246 = llvm.mlir.addressof @str223 : !llvm.ptr
      %3247 = arith.constant 30 : i64
      %3248 = func.call @cc_make_symbol(%3246, %3247) : (!llvm.ptr, i64) -> i64
      %3249 = func.call @cc_persistent_root_value(%3248) : (i64) -> i64
      func.call @stack_push_pointer(%3249) : (i64) -> ()
      %3250 = arith.constant 236837129945108 : i64
      %3251 = arith.constant 1 : i64
      %3252 = func.call @cc_make_closure(%3250, %3251) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_142 = arith.constant 0 : i64
      %3253 = arith.addi %3252, %__rlasp_stack_elide_zero_142 : i64
      %3254 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3254) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3255 = func.call @stack_pop_pointer() : () -> i64
      %3256 = func.call @stack_pop_pointer() : () -> i64
      %3257 = func.call @cc_cons(%3256, %3255) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_143 = arith.constant 0 : i64
      %3258 = arith.addi %3257, %__rlasp_stack_elide_zero_143 : i64
      %3259 = llvm.mlir.addressof @str224 : !llvm.ptr
      %3260 = arith.constant 11 : i64
      %3261 = func.call @cc_make_string(%3259, %3260) : (!llvm.ptr, i64) -> i64
      %3262 = llvm.mlir.addressof @str225 : !llvm.ptr
      %3263 = arith.constant 7 : i64
      %3264 = func.call @cc_make_string(%3262, %3263) : (!llvm.ptr, i64) -> i64
      %3265 = func.call @cc_intern(%3261, %3264) : (i64, i64) -> i64
      %3266 = func.call @cc_nil_value() : () -> i64
      %3267 = func.call @cc_cons(%3265, %3266) : (i64, i64) -> i64
      %3268 = func.call @cc_values_pack(%3267) : (i64) -> i64
      %3269 = llvm.mlir.addressof @str226 : !llvm.ptr
      %3270 = arith.constant 50 : i64
      %3271 = func.call @cc_make_string(%3269, %3270) : (!llvm.ptr, i64) -> i64
      %3272 = llvm.mlir.addressof @str227 : !llvm.ptr
      %3273 = arith.constant 4 : i64
      %3274 = func.call @cc_make_string(%3272, %3273) : (!llvm.ptr, i64) -> i64
      %3275 = llvm.mlir.addressof @str228 : !llvm.ptr
      %3276 = arith.constant 7 : i64
      %3277 = func.call @cc_make_string(%3275, %3276) : (!llvm.ptr, i64) -> i64
      %3278 = func.call @cc_intern(%3274, %3277) : (i64, i64) -> i64
      %3279 = func.call @cc_nil_value() : () -> i64
      %3280 = func.call @cc_cons(%3278, %3279) : (i64, i64) -> i64
      %3281 = func.call @cc_values_pack(%3280) : (i64) -> i64
      %3282 = llvm.mlir.addressof @str229 : !llvm.ptr
      %3283 = arith.constant 6 : i64
      %3284 = func.call @cc_make_string(%3282, %3283) : (!llvm.ptr, i64) -> i64
      %3285 = func.call @cc_nil_value() : () -> i64
      %3286 = func.call @cc_intern(%3284, %3285) : (i64, i64) -> i64
      %3287 = func.call @cc_nil_value() : () -> i64
      %3288 = func.call @cc_cons(%3286, %3287) : (i64, i64) -> i64
      %3289 = func.call @cc_values_pack(%3288) : (i64) -> i64
      %__rlasp_stack_elide_zero_144 = arith.constant 0 : i64
      %3290 = arith.addi %3286, %__rlasp_stack_elide_zero_144 : i64
      %3291 = func.call @cc_nil_value() : () -> i64
      %3292 = func.call @cc_errorp(%2381) : (i64) -> i64
      %3293 = arith.cmpi ne, %3292, %3291 : i64
      %3294 = arith.cmpi eq, %3291, %3291 : i64
      %3295 = arith.andi %3293, %3294 : i1
      %3296 = scf.if %3295 -> (i64) {
        scf.yield %2381 : i64
      } else {
        scf.yield %3291 : i64
      }
      %3297 = func.call @cc_errorp(%2780) : (i64) -> i64
      %3298 = arith.cmpi ne, %3297, %3291 : i64
      %3299 = arith.cmpi eq, %3296, %3291 : i64
      %3300 = arith.andi %3298, %3299 : i1
      %3301 = scf.if %3300 -> (i64) {
        scf.yield %2780 : i64
      } else {
        scf.yield %3296 : i64
      }
      %3302 = func.call @cc_errorp(%3253) : (i64) -> i64
      %3303 = arith.cmpi ne, %3302, %3291 : i64
      %3304 = arith.cmpi eq, %3301, %3291 : i64
      %3305 = arith.andi %3303, %3304 : i1
      %3306 = scf.if %3305 -> (i64) {
        scf.yield %3253 : i64
      } else {
        scf.yield %3301 : i64
      }
      %3307 = func.call @cc_errorp(%3258) : (i64) -> i64
      %3308 = arith.cmpi ne, %3307, %3291 : i64
      %3309 = arith.cmpi eq, %3306, %3291 : i64
      %3310 = arith.andi %3308, %3309 : i1
      %3311 = scf.if %3310 -> (i64) {
        scf.yield %3258 : i64
      } else {
        scf.yield %3306 : i64
      }
      %3312 = func.call @cc_errorp(%3265) : (i64) -> i64
      %3313 = arith.cmpi ne, %3312, %3291 : i64
      %3314 = arith.cmpi eq, %3311, %3291 : i64
      %3315 = arith.andi %3313, %3314 : i1
      %3316 = scf.if %3315 -> (i64) {
        scf.yield %3265 : i64
      } else {
        scf.yield %3311 : i64
      }
      %3317 = func.call @cc_errorp(%3271) : (i64) -> i64
      %3318 = arith.cmpi ne, %3317, %3291 : i64
      %3319 = arith.cmpi eq, %3316, %3291 : i64
      %3320 = arith.andi %3318, %3319 : i1
      %3321 = scf.if %3320 -> (i64) {
        scf.yield %3271 : i64
      } else {
        scf.yield %3316 : i64
      }
      %3322 = func.call @cc_errorp(%3278) : (i64) -> i64
      %3323 = arith.cmpi ne, %3322, %3291 : i64
      %3324 = arith.cmpi eq, %3321, %3291 : i64
      %3325 = arith.andi %3323, %3324 : i1
      %3326 = scf.if %3325 -> (i64) {
        scf.yield %3278 : i64
      } else {
        scf.yield %3321 : i64
      }
      %3327 = func.call @cc_errorp(%3290) : (i64) -> i64
      %3328 = arith.cmpi ne, %3327, %3291 : i64
      %3329 = arith.cmpi eq, %3326, %3291 : i64
      %3330 = arith.andi %3328, %3329 : i1
      %3331 = scf.if %3330 -> (i64) {
        scf.yield %3290 : i64
      } else {
        scf.yield %3326 : i64
      }
      %3332 = arith.cmpi ne, %3331, %3291 : i64
      scf.if %3332 {
        func.call @stack_push_pointer(%3331) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2381) : (i64) -> ()
        func.call @stack_push_pointer(%2780) : (i64) -> ()
        func.call @stack_push_pointer(%3253) : (i64) -> ()
        func.call @stack_push_pointer(%3258) : (i64) -> ()
        func.call @stack_push_pointer(%3265) : (i64) -> ()
        func.call @stack_push_pointer(%3271) : (i64) -> ()
        func.call @stack_push_pointer(%3278) : (i64) -> ()
        func.call @stack_push_pointer(%3290) : (i64) -> ()
        %3333 = llvm.mlir.addressof @str230 : !llvm.ptr
        %3334 = func.call @cc_make_function_ref_const(%3333) : (!llvm.ptr) -> i64
        %3335 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3334, %3335) : (i64, i64) -> ()
      }
      %3336 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3336 : i64
    }
    %__rlasp_stack_elide_zero_145 = arith.constant 0 : i64
    %3337 = arith.addi %2372, %__rlasp_stack_elide_zero_145 : i64
    %3338 = func.call @cc_multiple_value_list(%3337) : (i64) -> i64
    %3339 = llvm.mlir.addressof @str231 : !llvm.ptr
    %3340 = arith.constant 38 : i64
    %3341 = func.call @cc_make_string(%3339, %3340) : (!llvm.ptr, i64) -> i64
    %3342 = func.call @cc_nil_value() : () -> i64
    %3343 = func.call @cc_intern(%3341, %3342) : (i64, i64) -> i64
    %3344 = func.call @cc_nil_value() : () -> i64
    %3345 = func.call @cc_cons(%3343, %3344) : (i64, i64) -> i64
    %3346 = func.call @cc_values_pack(%3345) : (i64) -> i64
    %3347 = func.call @cc_symbol_value(%3343) : (i64) -> i64
    %3348 = llvm.mlir.addressof @str232 : !llvm.ptr
    %3349 = arith.constant 40 : i64
    %3350 = func.call @cc_make_string(%3348, %3349) : (!llvm.ptr, i64) -> i64
    %3351 = func.call @cc_nil_value() : () -> i64
    %3352 = func.call @cc_intern(%3350, %3351) : (i64, i64) -> i64
    %3353 = func.call @cc_nil_value() : () -> i64
    %3354 = func.call @cc_cons(%3352, %3353) : (i64, i64) -> i64
    %3355 = func.call @cc_values_pack(%3354) : (i64) -> i64
    %3356 = func.call @cc_symbol_value(%3352) : (i64) -> i64
    %3357 = func.call @cc_nil_value() : () -> i64
    %3358 = arith.cmpi ne, %3347, %3357 : i64
    %3359 = scf.if %3358 -> (i64) {
      scf.yield %3356 : i64
    } else {
      scf.yield %3338 : i64
    }
    %3360 = func.call @cc_values_pack(%3359) : (i64) -> i64
    func.call @stack_push_pointer(%3360) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945091"() {
    %66 = func.call @stack_pop_pointer() : () -> i64
    %67 = func.call @stack_pop_pointer() : () -> i64
    %68 = func.call @cc_nil_value() : () -> i64
    %69 = func.call @cc_nil_value() : () -> i64
    %70 = func.call @cc_errorp(%68) : (i64) -> i64
    %71 = arith.cmpi ne, %70, %69 : i64
    %72 = scf.if %71 -> (i64) {
      scf.yield %68 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %73 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %73 : i64
    }
    %74 = func.call @cc_nil_value() : () -> i64
    %75 = func.call @cc_errorp(%72) : (i64) -> i64
    %76 = arith.cmpi ne, %75, %74 : i64
    %77 = scf.if %76 -> (i64) {
      scf.yield %72 : i64
    } else {
      %78 = func.call @cc_symbol_value(%67) : (i64) -> i64
      %__rlasp_stack_elide_zero_146 = arith.constant 0 : i64
      %79 = arith.addi %78, %__rlasp_stack_elide_zero_146 : i64
      %80 = func.call @cc_car(%79) : (i64) -> i64
      %__rlasp_stack_elide_zero_147 = arith.constant 0 : i64
      %81 = arith.addi %80, %__rlasp_stack_elide_zero_147 : i64
      %82 = arith.constant 1 : i64
      %83 = func.call @cc_box_fixnum(%82) : (i64) -> i64
      %__rlasp_stack_elide_zero_148 = arith.constant 0 : i64
      %84 = arith.addi %83, %__rlasp_stack_elide_zero_148 : i64
      %86 = arith.constant 3 : i64
      %85 = arith.andi %81, %86 : i64
      %87 = arith.constant 0 : i64
      %88 = arith.cmpi eq, %85, %87 : i64
      %90 = arith.constant 3 : i64
      %89 = arith.andi %84, %90 : i64
      %91 = arith.constant 0 : i64
      %92 = arith.cmpi eq, %89, %91 : i64
      %93 = arith.andi %88, %92 : i1
      %94 = scf.if %93 -> (i64) {
        %95 = arith.constant 2 : i64
        %96 = arith.shrsi %81, %95 : i64
        %97 = arith.constant 2 : i64
        %98 = arith.shrsi %84, %97 : i64
        %99 = arith.addi %96, %98 : i64
        %100 = arith.constant -2305843009213693952 : i64
        %101 = arith.constant 2305843009213693951 : i64
        %102 = arith.cmpi sge, %99, %100 : i64
        %103 = arith.cmpi sle, %99, %101 : i64
        %104 = arith.andi %102, %103 : i1
        %105 = scf.if %104 -> (i64) {
          %106 = arith.constant 2 : i64
          %107 = arith.shli %99, %106 : i64
          scf.yield %107 : i64
        } else {
          %108 = func.call @cc_add(%81, %84) : (i64, i64) -> i64
          scf.yield %108 : i64
        }
        scf.yield %105 : i64
      } else {
        %109 = func.call @cc_add(%81, %84) : (i64, i64) -> i64
        scf.yield %109 : i64
      }
      %110 = func.call @cc_symbol_value(%67) : (i64) -> i64
      %__rlasp_stack_elide_zero_149 = arith.constant 0 : i64
      %111 = arith.addi %110, %__rlasp_stack_elide_zero_149 : i64
      %112 = func.call @cc_set_car(%111, %94) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_150 = arith.constant 0 : i64
      %113 = arith.addi %112, %__rlasp_stack_elide_zero_150 : i64
      scf.yield %113 : i64
    }
    func.call @stack_push_pointer(%77) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945093"() {
    %339 = func.call @stack_pop_pointer() : () -> i64
    %340 = func.call @cc_nil_value() : () -> i64
    %341 = func.call @cc_nil_value() : () -> i64
    %342 = func.call @cc_errorp(%340) : (i64) -> i64
    %343 = arith.cmpi ne, %342, %341 : i64
    %344 = scf.if %343 -> (i64) {
      scf.yield %340 : i64
    } else {
      %345 = func.call @cc_symbol_value(%339) : (i64) -> i64
      %__rlasp_stack_elide_zero_151 = arith.constant 0 : i64
      %346 = arith.addi %345, %__rlasp_stack_elide_zero_151 : i64
      %347 = func.call @cc_car(%346) : (i64) -> i64
      %__rlasp_stack_elide_zero_152 = arith.constant 0 : i64
      %348 = arith.addi %347, %__rlasp_stack_elide_zero_152 : i64
      %__rlasp_stack_elide_zero_153 = arith.constant 0 : i64
      %349 = arith.addi %348, %__rlasp_stack_elide_zero_153 : i64
      scf.yield %349 : i64
    }
    func.call @stack_push_pointer(%344) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945098"() {
    %1082 = func.call @cc_nil_value() : () -> i64
    %1083 = func.call @cc_nil_value() : () -> i64
    %1084 = func.call @cc_errorp(%1082) : (i64) -> i64
    %1085 = arith.cmpi ne, %1084, %1083 : i64
    %1086 = scf.if %1085 -> (i64) {
      scf.yield %1082 : i64
    } else {
      %1087 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1087) : (i64) -> ()
      %1088 = func.call @stack_pop_pointer() : () -> i64
      %1089 = func.call @cc_unbox_fixnum(%1088) : (i64) -> i64
      %1090 = func.call @cc_nil_value() : () -> i64
      %1091 = func.call @cc_make_list(%1088) : (i64) -> i64
      %__rlasp_stack_elide_zero_154 = arith.constant 0 : i64
      %1092 = arith.addi %1091, %__rlasp_stack_elide_zero_154 : i64
      scf.yield %1092 : i64
    }
    func.call @stack_push_pointer(%1086) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945097"() {
    %1077 = func.call @cc_nil_value() : () -> i64
    %1078 = func.call @cc_nil_value() : () -> i64
    %1079 = func.call @cc_errorp(%1077) : (i64) -> i64
    %1080 = arith.cmpi ne, %1079, %1078 : i64
    %1081 = scf.if %1080 -> (i64) {
      scf.yield %1077 : i64
    } else {
      %1093 = arith.constant 236837129945098 : i64
      %1094 = arith.constant 0 : i64
      %1095 = func.call @cc_make_closure(%1093, %1094) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_155 = arith.constant 0 : i64
      %1096 = arith.addi %1095, %__rlasp_stack_elide_zero_155 : i64
      %1097 = arith.constant 100 : i64
      %1098 = func.call @cc_box_fixnum(%1097) : (i64) -> i64
      %1099 = func.call @cc_nil_value() : () -> i64
      %1100 = func.call @cc_errorp(%1096) : (i64) -> i64
      %1101 = arith.cmpi ne, %1100, %1099 : i64
      %1102 = arith.cmpi eq, %1099, %1099 : i64
      %1103 = arith.andi %1101, %1102 : i1
      %1104 = scf.if %1103 -> (i64) {
        scf.yield %1096 : i64
      } else {
        scf.yield %1099 : i64
      }
      %1105 = func.call @cc_errorp(%1098) : (i64) -> i64
      %1106 = arith.cmpi ne, %1105, %1099 : i64
      %1107 = arith.cmpi eq, %1104, %1099 : i64
      %1108 = arith.andi %1106, %1107 : i1
      %1109 = scf.if %1108 -> (i64) {
        scf.yield %1098 : i64
      } else {
        scf.yield %1104 : i64
      }
      %1110 = arith.cmpi ne, %1109, %1099 : i64
      scf.if %1110 {
        func.call @stack_push_pointer(%1109) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1096) : (i64) -> ()
        func.call @stack_push_pointer(%1098) : (i64) -> ()
        %1111 = llvm.mlir.addressof @str66 : !llvm.ptr
        %1112 = func.call @cc_make_function_ref_const(%1111) : (!llvm.ptr) -> i64
        %1113 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1112, %1113) : (i64, i64) -> ()
      }
      %1114 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1114 : i64
    }
    func.call @stack_push_pointer(%1081) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945102"() {
    %1647 = func.call @stack_pop_pointer() : () -> i64
    %1648 = func.call @stack_pop_pointer() : () -> i64
    %1649 = func.call @cc_nil_value() : () -> i64
    %1650 = func.call @cc_nil_value() : () -> i64
    %1651 = func.call @cc_errorp(%1649) : (i64) -> i64
    %1652 = arith.cmpi ne, %1651, %1650 : i64
    %1653 = scf.if %1652 -> (i64) {
      scf.yield %1649 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1654 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1654 : i64
    }
    %1655 = func.call @cc_nil_value() : () -> i64
    %1656 = func.call @cc_errorp(%1653) : (i64) -> i64
    %1657 = arith.cmpi ne, %1656, %1655 : i64
    %1658 = scf.if %1657 -> (i64) {
      scf.yield %1653 : i64
    } else {
      %1659 = func.call @cc_symbol_value(%1648) : (i64) -> i64
      %1660 = arith.constant 1 : i64
      %1661 = func.call @cc_box_fixnum(%1660) : (i64) -> i64
      %1663 = arith.constant 3 : i64
      %1662 = arith.andi %1659, %1663 : i64
      %1664 = arith.constant 0 : i64
      %1665 = arith.cmpi eq, %1662, %1664 : i64
      %1667 = arith.constant 3 : i64
      %1666 = arith.andi %1661, %1667 : i64
      %1668 = arith.constant 0 : i64
      %1669 = arith.cmpi eq, %1666, %1668 : i64
      %1670 = arith.andi %1665, %1669 : i1
      %1671 = scf.if %1670 -> (i64) {
        %1672 = arith.constant 2 : i64
        %1673 = arith.shrsi %1659, %1672 : i64
        %1674 = arith.constant 2 : i64
        %1675 = arith.shrsi %1661, %1674 : i64
        %1676 = arith.addi %1673, %1675 : i64
        %1677 = arith.constant -2305843009213693952 : i64
        %1678 = arith.constant 2305843009213693951 : i64
        %1679 = arith.cmpi sge, %1676, %1677 : i64
        %1680 = arith.cmpi sle, %1676, %1678 : i64
        %1681 = arith.andi %1679, %1680 : i1
        %1682 = scf.if %1681 -> (i64) {
          %1683 = arith.constant 2 : i64
          %1684 = arith.shli %1676, %1683 : i64
          scf.yield %1684 : i64
        } else {
          %1685 = func.call @cc_add(%1659, %1661) : (i64, i64) -> i64
          scf.yield %1685 : i64
        }
        scf.yield %1682 : i64
      } else {
        %1686 = func.call @cc_add(%1659, %1661) : (i64, i64) -> i64
        scf.yield %1686 : i64
      }
      %__rlasp_stack_elide_zero_156 = arith.constant 0 : i64
      %1687 = arith.addi %1671, %__rlasp_stack_elide_zero_156 : i64
      %1688 = func.call @cc_set_symbol_value(%1648, %1687) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_157 = arith.constant 0 : i64
      %1689 = arith.addi %1687, %__rlasp_stack_elide_zero_157 : i64
      scf.yield %1689 : i64
    }
    func.call @stack_push_pointer(%1658) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945099"() {
    %1618 = func.call @stack_pop_pointer() : () -> i64
    %1619 = func.call @cc_nil_value() : () -> i64
    %1620 = func.call @cc_nil_value() : () -> i64
    %1621 = func.call @cc_errorp(%1619) : (i64) -> i64
    %1622 = arith.cmpi ne, %1621, %1620 : i64
    %1623 = scf.if %1622 -> (i64) {
      scf.yield %1619 : i64
    } else {
      %1624 = arith.constant 0 : i64
      %1625 = func.call @cc_box_fixnum(%1624) : (i64) -> i64
      %1626 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1627 = arith.constant 34 : i64
      %1628 = func.call @cc_make_symbol(%1626, %1627) : (!llvm.ptr, i64) -> i64
      %1629 = func.call @cc_persistent_root_value(%1628) : (i64) -> i64
      %1630 = func.call @cc_set_symbol_value(%1629, %1625) : (i64, i64) -> i64
      %1631 = func.call @cc_nil_value() : () -> i64
      %1632 = func.call @cc_nil_value() : () -> i64
      %1633 = func.call @cc_errorp(%1631) : (i64) -> i64
      %1634 = arith.cmpi ne, %1633, %1632 : i64
      %1635 = scf.if %1634 -> (i64) {
        scf.yield %1631 : i64
      } else {
        %1636 = arith.constant 5 : i64
        func.call @stack_push_fixnum(%1636) : (i64) -> ()
        %1637 = func.call @stack_pop_pointer() : () -> i64
        %1638 = func.call @cc_unbox_fixnum(%1637) : (i64) -> i64
        %1639 = func.call @cc_nil_value() : () -> i64
        %1640 = func.call @cc_make_list(%1637) : (i64) -> i64
        %__rlasp_stack_elide_zero_158 = arith.constant 0 : i64
        %1641 = arith.addi %1640, %__rlasp_stack_elide_zero_158 : i64
        %1642 = func.call @cc_nil_value() : () -> i64
        %1643 = func.call @cc_nil_value() : () -> i64
        %1644 = func.call @cc_errorp(%1642) : (i64) -> i64
        %1645 = arith.cmpi ne, %1644, %1643 : i64
        %1646 = scf.if %1645 -> (i64) {
          scf.yield %1642 : i64
        } else {
          func.call @stack_push_pointer(%1629) : (i64) -> ()
          %1690 = arith.constant 236837129945102 : i64
          %1691 = arith.constant 1 : i64
          %1692 = func.call @cc_make_closure(%1690, %1691) : (i64, i64) -> i64
          %1693 = llvm.mlir.addressof @str117 : !llvm.ptr
          %1694 = arith.constant 3 : i64
          %1695 = func.call @cc_bind_function_object_const(%1693, %1694, %1692) : (!llvm.ptr, i64, i64) -> i64
          %1696 = arith.constant 5 : i64
          %1697 = func.call @cc_box_fixnum(%1696) : (i64) -> i64
          %1698 = arith.constant 0 : i64
          %1699 = func.call @cc_box_fixnum(%1698) : (i64) -> i64
          %1700 = func.call @cc_nil_value() : () -> i64
          %1701 = func.call @cc_nil_value() : () -> i64
          %1702 = func.call @cc_errorp(%1700) : (i64) -> i64
          %1703 = arith.cmpi ne, %1702, %1701 : i64
          %1704 = scf.if %1703 -> (i64) {
            scf.yield %1700 : i64
          } else {
            %1705 = func.call @cc_nil_value() : () -> i64
            %1706 = llvm.mlir.addressof @str118 : !llvm.ptr
            %1707 = arith.constant 38 : i64
            %1708 = func.call @cc_make_string(%1706, %1707) : (!llvm.ptr, i64) -> i64
            %1709 = func.call @cc_nil_value() : () -> i64
            %1710 = func.call @cc_intern(%1708, %1709) : (i64, i64) -> i64
            %1711 = func.call @cc_nil_value() : () -> i64
            %1712 = func.call @cc_cons(%1710, %1711) : (i64, i64) -> i64
            %1713 = func.call @cc_values_pack(%1712) : (i64) -> i64
            %1714 = func.call @cc_set_symbol_value(%1710, %1705) : (i64, i64) -> i64
            %1715 = llvm.mlir.addressof @str119 : !llvm.ptr
            %1716 = arith.constant 39 : i64
            %1717 = func.call @cc_make_string(%1715, %1716) : (!llvm.ptr, i64) -> i64
            %1718 = func.call @cc_nil_value() : () -> i64
            %1719 = func.call @cc_intern(%1717, %1718) : (i64, i64) -> i64
            %1720 = func.call @cc_nil_value() : () -> i64
            %1721 = func.call @cc_cons(%1719, %1720) : (i64, i64) -> i64
            %1722 = func.call @cc_values_pack(%1721) : (i64) -> i64
            %1723 = func.call @cc_set_symbol_value(%1719, %1705) : (i64, i64) -> i64
            %1724 = llvm.mlir.addressof @str120 : !llvm.ptr
            %1725 = arith.constant 40 : i64
            %1726 = func.call @cc_make_string(%1724, %1725) : (!llvm.ptr, i64) -> i64
            %1727 = func.call @cc_nil_value() : () -> i64
            %1728 = func.call @cc_intern(%1726, %1727) : (i64, i64) -> i64
            %1729 = func.call @cc_nil_value() : () -> i64
            %1730 = func.call @cc_cons(%1728, %1729) : (i64, i64) -> i64
            %1731 = func.call @cc_values_pack(%1730) : (i64) -> i64
            %1732 = func.call @cc_set_symbol_value(%1728, %1705) : (i64, i64) -> i64
            %1733:1 = scf.while (%arg0 = %1699) : (i64) -> (i64) {
              %__rlasp_stack_elide_zero_159 = arith.constant 0 : i64
              %1734 = arith.addi %arg0, %__rlasp_stack_elide_zero_159 : i64
              %__rlasp_stack_elide_zero_160 = arith.constant 0 : i64
              %1735 = arith.addi %1697, %__rlasp_stack_elide_zero_160 : i64
              %1736 = arith.constant 1 : i1
              %1738 = arith.constant 3 : i64
              %1737 = arith.andi %1734, %1738 : i64
              %1739 = arith.constant 0 : i64
              %1740 = arith.cmpi eq, %1737, %1739 : i64
              %1742 = arith.constant 3 : i64
              %1741 = arith.andi %1735, %1742 : i64
              %1743 = arith.constant 0 : i64
              %1744 = arith.cmpi eq, %1741, %1743 : i64
              %1745 = arith.andi %1740, %1744 : i1
              %1746 = scf.if %1745 -> (i1) {
                %1747 = arith.constant 2 : i64
                %1748 = arith.shrsi %1734, %1747 : i64
                %1749 = arith.constant 2 : i64
                %1750 = arith.shrsi %1735, %1749 : i64
                %1751 = arith.cmpi slt, %1748, %1750 : i64
                scf.yield %1751 : i1
              } else {
                %1752 = func.call @cc_lt(%1734, %1735) : (i64, i64) -> i64
                %1753 = func.call @cc_nil_value() : () -> i64
                %1754 = arith.cmpi ne, %1752, %1753 : i64
                scf.yield %1754 : i1
              }
              %1755 = arith.andi %1736, %1746 : i1
              %1756 = func.call @cc_nil_value() : () -> i64
              %1757 = func.call @cc_t_value() : () -> i64
              %1758 = scf.if %1755 -> (i64) {
                scf.yield %1757 : i64
              } else {
                scf.yield %1756 : i64
              }
              %__rlasp_stack_elide_zero_161 = arith.constant 0 : i64
              %1759 = arith.addi %1758, %__rlasp_stack_elide_zero_161 : i64
              %1760 = func.call @cc_nil_value() : () -> i64
              %1761 = arith.cmpi ne, %1759, %1760 : i64
              %1762 = func.call @cc_nil_value() : () -> i64
              %1763 = llvm.mlir.addressof @str121 : !llvm.ptr
              %1764 = arith.constant 38 : i64
              %1765 = func.call @cc_make_string(%1763, %1764) : (!llvm.ptr, i64) -> i64
              %1766 = func.call @cc_nil_value() : () -> i64
              %1767 = func.call @cc_intern(%1765, %1766) : (i64, i64) -> i64
              %1768 = func.call @cc_nil_value() : () -> i64
              %1769 = func.call @cc_cons(%1767, %1768) : (i64, i64) -> i64
              %1770 = func.call @cc_values_pack(%1769) : (i64) -> i64
              %1771 = func.call @cc_symbol_value(%1767) : (i64) -> i64
              %1772 = arith.cmpi ne, %1771, %1762 : i64
              %1773 = llvm.mlir.addressof @str122 : !llvm.ptr
              %1774 = arith.constant 38 : i64
              %1775 = func.call @cc_make_string(%1773, %1774) : (!llvm.ptr, i64) -> i64
              %1776 = func.call @cc_nil_value() : () -> i64
              %1777 = func.call @cc_intern(%1775, %1776) : (i64, i64) -> i64
              %1778 = func.call @cc_nil_value() : () -> i64
              %1779 = func.call @cc_cons(%1777, %1778) : (i64, i64) -> i64
              %1780 = func.call @cc_values_pack(%1779) : (i64) -> i64
              %1781 = func.call @cc_symbol_value(%1777) : (i64) -> i64
              %1782 = arith.cmpi ne, %1781, %1762 : i64
              %1783 = arith.ori %1772, %1782 : i1
              %1784 = arith.constant 0 : i1
              %1785 = arith.cmpi eq, %1783, %1784 : i1
              %1786 = arith.andi %1761, %1785 : i1
              scf.condition(%1786) %arg0 : i64
            } do {
              ^bb0(%1787: i64):
              %__rlasp_stack_elide_zero_162 = arith.constant 0 : i64
              %1788 = arith.addi %1692, %__rlasp_stack_elide_zero_162 : i64
              %1789 = func.call @cc_nil_value() : () -> i64
              %1790 = func.call @cc_errorp(%1641) : (i64) -> i64
              %1791 = arith.cmpi ne, %1790, %1789 : i64
              %1792 = arith.cmpi eq, %1789, %1789 : i64
              %1793 = arith.andi %1791, %1792 : i1
              %1794 = scf.if %1793 -> (i64) {
                scf.yield %1641 : i64
              } else {
                scf.yield %1789 : i64
              }
              %1795 = func.call @cc_errorp(%1788) : (i64) -> i64
              %1796 = arith.cmpi ne, %1795, %1789 : i64
              %1797 = arith.cmpi eq, %1794, %1789 : i64
              %1798 = arith.andi %1796, %1797 : i1
              %1799 = scf.if %1798 -> (i64) {
                scf.yield %1788 : i64
              } else {
                scf.yield %1794 : i64
              }
              %1800 = arith.cmpi ne, %1799, %1789 : i64
              scf.if %1800 {
                func.call @stack_push_pointer(%1799) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%1641) : (i64) -> ()
                func.call @stack_push_pointer(%1788) : (i64) -> ()
                %1801 = llvm.mlir.addressof @str123 : !llvm.ptr
                %1802 = func.call @cc_make_function_ref_const(%1801) : (!llvm.ptr) -> i64
                %1803 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%1802, %1803) : (i64, i64) -> ()
              }
              %1804 = func.call @stack_depth() : () -> i64
              %1805 = arith.constant 0 : i64
              %1806 = arith.cmpi sgt, %1804, %1805 : i64
              scf.if %1806 {
                %1807 = func.call @stack_pop_pointer() : () -> i64
              }
              %1808 = arith.constant 1 : i64
              %1809 = func.call @cc_box_fixnum(%1808) : (i64) -> i64
              %1811 = arith.constant 3 : i64
              %1810 = arith.andi %1787, %1811 : i64
              %1812 = arith.constant 0 : i64
              %1813 = arith.cmpi eq, %1810, %1812 : i64
              %1815 = arith.constant 3 : i64
              %1814 = arith.andi %1809, %1815 : i64
              %1816 = arith.constant 0 : i64
              %1817 = arith.cmpi eq, %1814, %1816 : i64
              %1818 = arith.andi %1813, %1817 : i1
              %1819 = scf.if %1818 -> (i64) {
                %1820 = arith.constant 2 : i64
                %1821 = arith.shrsi %1787, %1820 : i64
                %1822 = arith.constant 2 : i64
                %1823 = arith.shrsi %1809, %1822 : i64
                %1824 = arith.addi %1821, %1823 : i64
                %1825 = arith.constant -2305843009213693952 : i64
                %1826 = arith.constant 2305843009213693951 : i64
                %1827 = arith.cmpi sge, %1824, %1825 : i64
                %1828 = arith.cmpi sle, %1824, %1826 : i64
                %1829 = arith.andi %1827, %1828 : i1
                %1830 = scf.if %1829 -> (i64) {
                  %1831 = arith.constant 2 : i64
                  %1832 = arith.shli %1824, %1831 : i64
                  scf.yield %1832 : i64
                } else {
                  %1833 = func.call @cc_add(%1787, %1809) : (i64, i64) -> i64
                  scf.yield %1833 : i64
                }
                scf.yield %1830 : i64
              } else {
                %1834 = func.call @cc_add(%1787, %1809) : (i64, i64) -> i64
                scf.yield %1834 : i64
              }
              %__rlasp_stack_elide_zero_163 = arith.constant 0 : i64
              %1835 = arith.addi %1819, %__rlasp_stack_elide_zero_163 : i64
              func.call @stack_push_pointer(%1835) : (i64) -> ()
              %1836 = func.call @stack_depth() : () -> i64
              %1837 = arith.constant 0 : i64
              %1838 = arith.cmpi sgt, %1836, %1837 : i64
              scf.if %1838 {
                %1839 = func.call @stack_pop_pointer() : () -> i64
              }
              scf.yield %1835 : i64
            }
            func.call @stack_push_nil() : () -> ()
            %1840 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %1841 = func.call @stack_pop_pointer() : () -> i64
            %1842 = func.call @cc_multiple_value_list(%1841) : (i64) -> i64
            %1843 = llvm.mlir.addressof @str124 : !llvm.ptr
            %1844 = arith.constant 38 : i64
            %1845 = func.call @cc_make_string(%1843, %1844) : (!llvm.ptr, i64) -> i64
            %1846 = func.call @cc_nil_value() : () -> i64
            %1847 = func.call @cc_intern(%1845, %1846) : (i64, i64) -> i64
            %1848 = func.call @cc_nil_value() : () -> i64
            %1849 = func.call @cc_cons(%1847, %1848) : (i64, i64) -> i64
            %1850 = func.call @cc_values_pack(%1849) : (i64) -> i64
            %1851 = func.call @cc_symbol_value(%1847) : (i64) -> i64
            %1852 = llvm.mlir.addressof @str125 : !llvm.ptr
            %1853 = arith.constant 39 : i64
            %1854 = func.call @cc_make_string(%1852, %1853) : (!llvm.ptr, i64) -> i64
            %1855 = func.call @cc_nil_value() : () -> i64
            %1856 = func.call @cc_intern(%1854, %1855) : (i64, i64) -> i64
            %1857 = func.call @cc_nil_value() : () -> i64
            %1858 = func.call @cc_cons(%1856, %1857) : (i64, i64) -> i64
            %1859 = func.call @cc_values_pack(%1858) : (i64) -> i64
            %1860 = func.call @cc_symbol_value(%1856) : (i64) -> i64
            %1861 = llvm.mlir.addressof @str126 : !llvm.ptr
            %1862 = arith.constant 40 : i64
            %1863 = func.call @cc_make_string(%1861, %1862) : (!llvm.ptr, i64) -> i64
            %1864 = func.call @cc_nil_value() : () -> i64
            %1865 = func.call @cc_intern(%1863, %1864) : (i64, i64) -> i64
            %1866 = func.call @cc_nil_value() : () -> i64
            %1867 = func.call @cc_cons(%1865, %1866) : (i64, i64) -> i64
            %1868 = func.call @cc_values_pack(%1867) : (i64) -> i64
            %1869 = func.call @cc_symbol_value(%1865) : (i64) -> i64
            %1870 = func.call @cc_nil_value() : () -> i64
            %1871 = arith.cmpi ne, %1851, %1870 : i64
            %1872 = scf.if %1871 -> (i64) {
              scf.yield %1869 : i64
            } else {
              scf.yield %1842 : i64
            }
            %1873 = func.call @cc_values_pack(%1872) : (i64) -> i64
            %__rlasp_stack_elide_zero_164 = arith.constant 0 : i64
            %1874 = arith.addi %1873, %__rlasp_stack_elide_zero_164 : i64
            scf.yield %1874 : i64
          }
          %__rlasp_stack_elide_zero_165 = arith.constant 0 : i64
          %1875 = arith.addi %1704, %__rlasp_stack_elide_zero_165 : i64
          %1876 = func.call @cc_multiple_value_list(%1875) : (i64) -> i64
          %1877 = func.call @cc_symbol_value(%1629) : (i64) -> i64
          %1878 = func.call @cc_values_pack(%1876) : (i64) -> i64
          %__rlasp_stack_elide_zero_166 = arith.constant 0 : i64
          %1879 = arith.addi %1878, %__rlasp_stack_elide_zero_166 : i64
          scf.yield %1879 : i64
        }
        %1880 = func.call @cc_nil_value() : () -> i64
        %1881 = func.call @cc_errorp(%1646) : (i64) -> i64
        %1882 = arith.cmpi ne, %1881, %1880 : i64
        %1883 = scf.if %1882 -> (i64) {
          scf.yield %1646 : i64
        } else {
          %1884 = func.call @cc_nil_value() : () -> i64
          %1885 = func.call @cc_errorp(%1641) : (i64) -> i64
          %1886 = arith.cmpi ne, %1885, %1884 : i64
          %1887 = arith.cmpi eq, %1884, %1884 : i64
          %1888 = arith.andi %1886, %1887 : i1
          %1889 = scf.if %1888 -> (i64) {
            scf.yield %1641 : i64
          } else {
            scf.yield %1884 : i64
          }
          %1890 = arith.cmpi ne, %1889, %1884 : i64
          scf.if %1890 {
            func.call @stack_push_pointer(%1889) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1641) : (i64) -> ()
            %1891 = llvm.mlir.addressof @str127 : !llvm.ptr
            %1892 = func.call @cc_make_function_ref_const(%1891) : (!llvm.ptr) -> i64
            %1893 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1892, %1893) : (i64, i64) -> ()
          }
          %1894 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1894 : i64
        }
        %__rlasp_stack_elide_zero_167 = arith.constant 0 : i64
        %1895 = arith.addi %1883, %__rlasp_stack_elide_zero_167 : i64
        scf.yield %1895 : i64
      }
      %1896 = func.call @cc_nil_value() : () -> i64
      %1897 = func.call @cc_errorp(%1635) : (i64) -> i64
      %1898 = arith.cmpi ne, %1897, %1896 : i64
      %1899 = scf.if %1898 -> (i64) {
        scf.yield %1635 : i64
      } else {
        %1900 = arith.constant 10 : i64
        %1901 = func.call @cc_box_fixnum(%1900) : (i64) -> i64
        %1902 = arith.constant 0 : i64
        %1903 = func.call @cc_box_fixnum(%1902) : (i64) -> i64
        %1904 = func.call @cc_nil_value() : () -> i64
        %1905 = func.call @cc_nil_value() : () -> i64
        %1906 = func.call @cc_errorp(%1904) : (i64) -> i64
        %1907 = arith.cmpi ne, %1906, %1905 : i64
        %1908 = scf.if %1907 -> (i64) {
          scf.yield %1904 : i64
        } else {
          %1909 = func.call @cc_nil_value() : () -> i64
          %1910 = llvm.mlir.addressof @str128 : !llvm.ptr
          %1911 = arith.constant 38 : i64
          %1912 = func.call @cc_make_string(%1910, %1911) : (!llvm.ptr, i64) -> i64
          %1913 = func.call @cc_nil_value() : () -> i64
          %1914 = func.call @cc_intern(%1912, %1913) : (i64, i64) -> i64
          %1915 = func.call @cc_nil_value() : () -> i64
          %1916 = func.call @cc_cons(%1914, %1915) : (i64, i64) -> i64
          %1917 = func.call @cc_values_pack(%1916) : (i64) -> i64
          %1918 = func.call @cc_set_symbol_value(%1914, %1909) : (i64, i64) -> i64
          %1919 = llvm.mlir.addressof @str129 : !llvm.ptr
          %1920 = arith.constant 39 : i64
          %1921 = func.call @cc_make_string(%1919, %1920) : (!llvm.ptr, i64) -> i64
          %1922 = func.call @cc_nil_value() : () -> i64
          %1923 = func.call @cc_intern(%1921, %1922) : (i64, i64) -> i64
          %1924 = func.call @cc_nil_value() : () -> i64
          %1925 = func.call @cc_cons(%1923, %1924) : (i64, i64) -> i64
          %1926 = func.call @cc_values_pack(%1925) : (i64) -> i64
          %1927 = func.call @cc_set_symbol_value(%1923, %1909) : (i64, i64) -> i64
          %1928 = llvm.mlir.addressof @str130 : !llvm.ptr
          %1929 = arith.constant 40 : i64
          %1930 = func.call @cc_make_string(%1928, %1929) : (!llvm.ptr, i64) -> i64
          %1931 = func.call @cc_nil_value() : () -> i64
          %1932 = func.call @cc_intern(%1930, %1931) : (i64, i64) -> i64
          %1933 = func.call @cc_nil_value() : () -> i64
          %1934 = func.call @cc_cons(%1932, %1933) : (i64, i64) -> i64
          %1935 = func.call @cc_values_pack(%1934) : (i64) -> i64
          %1936 = func.call @cc_set_symbol_value(%1932, %1909) : (i64, i64) -> i64
          %1937:1 = scf.while (%arg0 = %1903) : (i64) -> (i64) {
            %__rlasp_stack_elide_zero_168 = arith.constant 0 : i64
            %1938 = arith.addi %arg0, %__rlasp_stack_elide_zero_168 : i64
            %__rlasp_stack_elide_zero_169 = arith.constant 0 : i64
            %1939 = arith.addi %1901, %__rlasp_stack_elide_zero_169 : i64
            %1940 = arith.constant 1 : i1
            %1942 = arith.constant 3 : i64
            %1941 = arith.andi %1938, %1942 : i64
            %1943 = arith.constant 0 : i64
            %1944 = arith.cmpi eq, %1941, %1943 : i64
            %1946 = arith.constant 3 : i64
            %1945 = arith.andi %1939, %1946 : i64
            %1947 = arith.constant 0 : i64
            %1948 = arith.cmpi eq, %1945, %1947 : i64
            %1949 = arith.andi %1944, %1948 : i1
            %1950 = scf.if %1949 -> (i1) {
              %1951 = arith.constant 2 : i64
              %1952 = arith.shrsi %1938, %1951 : i64
              %1953 = arith.constant 2 : i64
              %1954 = arith.shrsi %1939, %1953 : i64
              %1955 = arith.cmpi slt, %1952, %1954 : i64
              scf.yield %1955 : i1
            } else {
              %1956 = func.call @cc_lt(%1938, %1939) : (i64, i64) -> i64
              %1957 = func.call @cc_nil_value() : () -> i64
              %1958 = arith.cmpi ne, %1956, %1957 : i64
              scf.yield %1958 : i1
            }
            %1959 = arith.andi %1940, %1950 : i1
            %1960 = func.call @cc_nil_value() : () -> i64
            %1961 = func.call @cc_t_value() : () -> i64
            %1962 = scf.if %1959 -> (i64) {
              scf.yield %1961 : i64
            } else {
              scf.yield %1960 : i64
            }
            %__rlasp_stack_elide_zero_170 = arith.constant 0 : i64
            %1963 = arith.addi %1962, %__rlasp_stack_elide_zero_170 : i64
            %1964 = func.call @cc_nil_value() : () -> i64
            %1965 = arith.cmpi ne, %1963, %1964 : i64
            %1966 = func.call @cc_nil_value() : () -> i64
            %1967 = llvm.mlir.addressof @str131 : !llvm.ptr
            %1968 = arith.constant 38 : i64
            %1969 = func.call @cc_make_string(%1967, %1968) : (!llvm.ptr, i64) -> i64
            %1970 = func.call @cc_nil_value() : () -> i64
            %1971 = func.call @cc_intern(%1969, %1970) : (i64, i64) -> i64
            %1972 = func.call @cc_nil_value() : () -> i64
            %1973 = func.call @cc_cons(%1971, %1972) : (i64, i64) -> i64
            %1974 = func.call @cc_values_pack(%1973) : (i64) -> i64
            %1975 = func.call @cc_symbol_value(%1971) : (i64) -> i64
            %1976 = arith.cmpi ne, %1975, %1966 : i64
            %1977 = llvm.mlir.addressof @str132 : !llvm.ptr
            %1978 = arith.constant 38 : i64
            %1979 = func.call @cc_make_string(%1977, %1978) : (!llvm.ptr, i64) -> i64
            %1980 = func.call @cc_nil_value() : () -> i64
            %1981 = func.call @cc_intern(%1979, %1980) : (i64, i64) -> i64
            %1982 = func.call @cc_nil_value() : () -> i64
            %1983 = func.call @cc_cons(%1981, %1982) : (i64, i64) -> i64
            %1984 = func.call @cc_values_pack(%1983) : (i64) -> i64
            %1985 = func.call @cc_symbol_value(%1981) : (i64) -> i64
            %1986 = arith.cmpi ne, %1985, %1966 : i64
            %1987 = arith.ori %1976, %1986 : i1
            %1988 = arith.constant 0 : i1
            %1989 = arith.cmpi eq, %1987, %1988 : i1
            %1990 = arith.andi %1965, %1989 : i1
            scf.condition(%1990) %arg0 : i64
          } do {
            ^bb0(%1991: i64):
            %1992 = func.call @cc_nil_value() : () -> i64
            %1993 = arith.cmpi ne, %1992, %1992 : i64
            scf.if %1993 {
              func.call @stack_push_pointer(%1992) : (i64) -> ()
            } else {
              %1994 = llvm.mlir.addressof @str133 : !llvm.ptr
              %1995 = func.call @cc_make_function_ref_const(%1994) : (!llvm.ptr) -> i64
              %1996 = arith.constant 0 : i64
              func.call @cc_funcall_stack(%1995, %1996) : (i64, i64) -> ()
            }
            %1997 = func.call @stack_depth() : () -> i64
            %1998 = arith.constant 0 : i64
            %1999 = arith.cmpi sgt, %1997, %1998 : i64
            scf.if %1999 {
              %2000 = func.call @stack_pop_pointer() : () -> i64
            }
            %2001 = arith.constant 1 : i64
            %2002 = func.call @cc_box_fixnum(%2001) : (i64) -> i64
            %2004 = arith.constant 3 : i64
            %2003 = arith.andi %1991, %2004 : i64
            %2005 = arith.constant 0 : i64
            %2006 = arith.cmpi eq, %2003, %2005 : i64
            %2008 = arith.constant 3 : i64
            %2007 = arith.andi %2002, %2008 : i64
            %2009 = arith.constant 0 : i64
            %2010 = arith.cmpi eq, %2007, %2009 : i64
            %2011 = arith.andi %2006, %2010 : i1
            %2012 = scf.if %2011 -> (i64) {
              %2013 = arith.constant 2 : i64
              %2014 = arith.shrsi %1991, %2013 : i64
              %2015 = arith.constant 2 : i64
              %2016 = arith.shrsi %2002, %2015 : i64
              %2017 = arith.addi %2014, %2016 : i64
              %2018 = arith.constant -2305843009213693952 : i64
              %2019 = arith.constant 2305843009213693951 : i64
              %2020 = arith.cmpi sge, %2017, %2018 : i64
              %2021 = arith.cmpi sle, %2017, %2019 : i64
              %2022 = arith.andi %2020, %2021 : i1
              %2023 = scf.if %2022 -> (i64) {
                %2024 = arith.constant 2 : i64
                %2025 = arith.shli %2017, %2024 : i64
                scf.yield %2025 : i64
              } else {
                %2026 = func.call @cc_add(%1991, %2002) : (i64, i64) -> i64
                scf.yield %2026 : i64
              }
              scf.yield %2023 : i64
            } else {
              %2027 = func.call @cc_add(%1991, %2002) : (i64, i64) -> i64
              scf.yield %2027 : i64
            }
            %__rlasp_stack_elide_zero_171 = arith.constant 0 : i64
            %2028 = arith.addi %2012, %__rlasp_stack_elide_zero_171 : i64
            func.call @stack_push_pointer(%2028) : (i64) -> ()
            %2029 = func.call @stack_depth() : () -> i64
            %2030 = arith.constant 0 : i64
            %2031 = arith.cmpi sgt, %2029, %2030 : i64
            scf.if %2031 {
              %2032 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %2028 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %2033 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %2034 = func.call @stack_pop_pointer() : () -> i64
          %2035 = func.call @cc_multiple_value_list(%2034) : (i64) -> i64
          %2036 = llvm.mlir.addressof @str134 : !llvm.ptr
          %2037 = arith.constant 38 : i64
          %2038 = func.call @cc_make_string(%2036, %2037) : (!llvm.ptr, i64) -> i64
          %2039 = func.call @cc_nil_value() : () -> i64
          %2040 = func.call @cc_intern(%2038, %2039) : (i64, i64) -> i64
          %2041 = func.call @cc_nil_value() : () -> i64
          %2042 = func.call @cc_cons(%2040, %2041) : (i64, i64) -> i64
          %2043 = func.call @cc_values_pack(%2042) : (i64) -> i64
          %2044 = func.call @cc_symbol_value(%2040) : (i64) -> i64
          %2045 = llvm.mlir.addressof @str135 : !llvm.ptr
          %2046 = arith.constant 39 : i64
          %2047 = func.call @cc_make_string(%2045, %2046) : (!llvm.ptr, i64) -> i64
          %2048 = func.call @cc_nil_value() : () -> i64
          %2049 = func.call @cc_intern(%2047, %2048) : (i64, i64) -> i64
          %2050 = func.call @cc_nil_value() : () -> i64
          %2051 = func.call @cc_cons(%2049, %2050) : (i64, i64) -> i64
          %2052 = func.call @cc_values_pack(%2051) : (i64) -> i64
          %2053 = func.call @cc_symbol_value(%2049) : (i64) -> i64
          %2054 = llvm.mlir.addressof @str136 : !llvm.ptr
          %2055 = arith.constant 40 : i64
          %2056 = func.call @cc_make_string(%2054, %2055) : (!llvm.ptr, i64) -> i64
          %2057 = func.call @cc_nil_value() : () -> i64
          %2058 = func.call @cc_intern(%2056, %2057) : (i64, i64) -> i64
          %2059 = func.call @cc_nil_value() : () -> i64
          %2060 = func.call @cc_cons(%2058, %2059) : (i64, i64) -> i64
          %2061 = func.call @cc_values_pack(%2060) : (i64) -> i64
          %2062 = func.call @cc_symbol_value(%2058) : (i64) -> i64
          %2063 = func.call @cc_nil_value() : () -> i64
          %2064 = arith.cmpi ne, %2044, %2063 : i64
          %2065 = scf.if %2064 -> (i64) {
            scf.yield %2062 : i64
          } else {
            scf.yield %2035 : i64
          }
          %2066 = func.call @cc_values_pack(%2065) : (i64) -> i64
          %__rlasp_stack_elide_zero_172 = arith.constant 0 : i64
          %2067 = arith.addi %2066, %__rlasp_stack_elide_zero_172 : i64
          scf.yield %2067 : i64
        }
        %__rlasp_stack_elide_zero_173 = arith.constant 0 : i64
        %2068 = arith.addi %1908, %__rlasp_stack_elide_zero_173 : i64
        scf.yield %2068 : i64
      }
      %2069 = func.call @cc_nil_value() : () -> i64
      %2070 = func.call @cc_errorp(%1899) : (i64) -> i64
      %2071 = arith.cmpi ne, %2070, %2069 : i64
      %2072 = scf.if %2071 -> (i64) {
        scf.yield %1899 : i64
      } else {
        %2073 = func.call @cc_symbol_value(%1629) : (i64) -> i64
        %__rlasp_stack_elide_zero_174 = arith.constant 0 : i64
        %2074 = arith.addi %2073, %__rlasp_stack_elide_zero_174 : i64
        scf.yield %2074 : i64
      }
      %__rlasp_stack_elide_zero_175 = arith.constant 0 : i64
      %2075 = arith.addi %2072, %__rlasp_stack_elide_zero_175 : i64
      scf.yield %2075 : i64
    }
    func.call @stack_push_pointer(%1623) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945107"() {
    %2238 = func.call @cc_nil_value() : () -> i64
    %2239 = func.call @cc_nil_value() : () -> i64
    %2240 = func.call @cc_errorp(%2238) : (i64) -> i64
    %2241 = arith.cmpi ne, %2240, %2239 : i64
    %2242 = scf.if %2241 -> (i64) {
      scf.yield %2238 : i64
    } else {
      %2243 = arith.constant 5 : i64
      %2244 = func.call @cc_box_fixnum(%2243) : (i64) -> i64
      %2245 = func.call @cc_nil_value() : () -> i64
      %2246 = func.call @cc_errorp(%2244) : (i64) -> i64
      %2247 = arith.cmpi ne, %2246, %2245 : i64
      %2248 = arith.cmpi eq, %2245, %2245 : i64
      %2249 = arith.andi %2247, %2248 : i1
      %2250 = scf.if %2249 -> (i64) {
        scf.yield %2244 : i64
      } else {
        scf.yield %2245 : i64
      }
      %2251 = arith.cmpi ne, %2250, %2245 : i64
      scf.if %2251 {
        func.call @stack_push_pointer(%2250) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2244) : (i64) -> ()
        %2252 = llvm.mlir.addressof @str150 : !llvm.ptr
        %2253 = func.call @cc_make_function_ref_const(%2252) : (!llvm.ptr) -> i64
        %2254 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2253, %2254) : (i64, i64) -> ()
      }
      %2255 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2255 : i64
    }
    func.call @stack_push_pointer(%2242) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945106"() {
    %2233 = func.call @cc_nil_value() : () -> i64
    %2234 = func.call @cc_nil_value() : () -> i64
    %2235 = func.call @cc_errorp(%2233) : (i64) -> i64
    %2236 = arith.cmpi ne, %2235, %2234 : i64
    %2237 = scf.if %2236 -> (i64) {
      scf.yield %2233 : i64
    } else {
      %2256 = arith.constant 236837129945107 : i64
      %2257 = arith.constant 0 : i64
      %2258 = func.call @cc_make_closure(%2256, %2257) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_176 = arith.constant 0 : i64
      %2259 = arith.addi %2258, %__rlasp_stack_elide_zero_176 : i64
      %2260 = arith.constant 100 : i64
      %2261 = func.call @cc_box_fixnum(%2260) : (i64) -> i64
      %2262 = func.call @cc_nil_value() : () -> i64
      %2263 = func.call @cc_errorp(%2259) : (i64) -> i64
      %2264 = arith.cmpi ne, %2263, %2262 : i64
      %2265 = arith.cmpi eq, %2262, %2262 : i64
      %2266 = arith.andi %2264, %2265 : i1
      %2267 = scf.if %2266 -> (i64) {
        scf.yield %2259 : i64
      } else {
        scf.yield %2262 : i64
      }
      %2268 = func.call @cc_errorp(%2261) : (i64) -> i64
      %2269 = arith.cmpi ne, %2268, %2262 : i64
      %2270 = arith.cmpi eq, %2267, %2262 : i64
      %2271 = arith.andi %2269, %2270 : i1
      %2272 = scf.if %2271 -> (i64) {
        scf.yield %2261 : i64
      } else {
        scf.yield %2267 : i64
      }
      %2273 = arith.cmpi ne, %2272, %2262 : i64
      scf.if %2273 {
        func.call @stack_push_pointer(%2272) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2259) : (i64) -> ()
        func.call @stack_push_pointer(%2261) : (i64) -> ()
        %2274 = llvm.mlir.addressof @str151 : !llvm.ptr
        %2275 = func.call @cc_make_function_ref_const(%2274) : (!llvm.ptr) -> i64
        %2276 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2275, %2276) : (i64, i64) -> ()
      }
      %2277 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2277 : i64
    }
    func.call @stack_push_pointer(%2237) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945111"() {
    %2817 = func.call @stack_pop_pointer() : () -> i64
    %2818 = func.call @stack_pop_pointer() : () -> i64
    %2819 = func.call @cc_nil_value() : () -> i64
    %2820 = func.call @cc_nil_value() : () -> i64
    %2821 = func.call @cc_errorp(%2819) : (i64) -> i64
    %2822 = arith.cmpi ne, %2821, %2820 : i64
    %2823 = scf.if %2822 -> (i64) {
      scf.yield %2819 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2824 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2824 : i64
    }
    %2825 = func.call @cc_nil_value() : () -> i64
    %2826 = func.call @cc_errorp(%2823) : (i64) -> i64
    %2827 = arith.cmpi ne, %2826, %2825 : i64
    %2828 = scf.if %2827 -> (i64) {
      scf.yield %2823 : i64
    } else {
      %2829 = func.call @cc_symbol_value(%2818) : (i64) -> i64
      %2830 = arith.constant 1 : i64
      %2831 = func.call @cc_box_fixnum(%2830) : (i64) -> i64
      %2833 = arith.constant 3 : i64
      %2832 = arith.andi %2829, %2833 : i64
      %2834 = arith.constant 0 : i64
      %2835 = arith.cmpi eq, %2832, %2834 : i64
      %2837 = arith.constant 3 : i64
      %2836 = arith.andi %2831, %2837 : i64
      %2838 = arith.constant 0 : i64
      %2839 = arith.cmpi eq, %2836, %2838 : i64
      %2840 = arith.andi %2835, %2839 : i1
      %2841 = scf.if %2840 -> (i64) {
        %2842 = arith.constant 2 : i64
        %2843 = arith.shrsi %2829, %2842 : i64
        %2844 = arith.constant 2 : i64
        %2845 = arith.shrsi %2831, %2844 : i64
        %2846 = arith.addi %2843, %2845 : i64
        %2847 = arith.constant -2305843009213693952 : i64
        %2848 = arith.constant 2305843009213693951 : i64
        %2849 = arith.cmpi sge, %2846, %2847 : i64
        %2850 = arith.cmpi sle, %2846, %2848 : i64
        %2851 = arith.andi %2849, %2850 : i1
        %2852 = scf.if %2851 -> (i64) {
          %2853 = arith.constant 2 : i64
          %2854 = arith.shli %2846, %2853 : i64
          scf.yield %2854 : i64
        } else {
          %2855 = func.call @cc_add(%2829, %2831) : (i64, i64) -> i64
          scf.yield %2855 : i64
        }
        scf.yield %2852 : i64
      } else {
        %2856 = func.call @cc_add(%2829, %2831) : (i64, i64) -> i64
        scf.yield %2856 : i64
      }
      %__rlasp_stack_elide_zero_177 = arith.constant 0 : i64
      %2857 = arith.addi %2841, %__rlasp_stack_elide_zero_177 : i64
      %2858 = func.call @cc_set_symbol_value(%2818, %2857) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_178 = arith.constant 0 : i64
      %2859 = arith.addi %2857, %__rlasp_stack_elide_zero_178 : i64
      scf.yield %2859 : i64
    }
    func.call @stack_push_pointer(%2828) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945108"() {
    %2781 = func.call @stack_pop_pointer() : () -> i64
    %2782 = func.call @cc_nil_value() : () -> i64
    %2783 = func.call @cc_nil_value() : () -> i64
    %2784 = func.call @cc_errorp(%2782) : (i64) -> i64
    %2785 = arith.cmpi ne, %2784, %2783 : i64
    %2786 = scf.if %2785 -> (i64) {
      scf.yield %2782 : i64
    } else {
      %2787 = arith.constant 0 : i64
      %2788 = func.call @cc_box_fixnum(%2787) : (i64) -> i64
      %2789 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2790 = arith.constant 34 : i64
      %2791 = func.call @cc_make_symbol(%2789, %2790) : (!llvm.ptr, i64) -> i64
      %2792 = func.call @cc_persistent_root_value(%2791) : (i64) -> i64
      %2793 = func.call @cc_set_symbol_value(%2792, %2788) : (i64, i64) -> i64
      %2794 = func.call @cc_nil_value() : () -> i64
      %2795 = func.call @cc_nil_value() : () -> i64
      %2796 = func.call @cc_errorp(%2794) : (i64) -> i64
      %2797 = arith.cmpi ne, %2796, %2795 : i64
      %2798 = scf.if %2797 -> (i64) {
        scf.yield %2794 : i64
      } else {
        %2799 = arith.constant 5 : i64
        %2800 = func.call @cc_box_fixnum(%2799) : (i64) -> i64
        %2801 = func.call @cc_nil_value() : () -> i64
        %2802 = func.call @cc_errorp(%2800) : (i64) -> i64
        %2803 = arith.cmpi ne, %2802, %2801 : i64
        %2804 = arith.cmpi eq, %2801, %2801 : i64
        %2805 = arith.andi %2803, %2804 : i1
        %2806 = scf.if %2805 -> (i64) {
          scf.yield %2800 : i64
        } else {
          scf.yield %2801 : i64
        }
        %2807 = arith.cmpi ne, %2806, %2801 : i64
        scf.if %2807 {
          func.call @stack_push_pointer(%2806) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2800) : (i64) -> ()
          %2808 = llvm.mlir.addressof @str202 : !llvm.ptr
          %2809 = func.call @cc_make_function_ref_const(%2808) : (!llvm.ptr) -> i64
          %2810 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2809, %2810) : (i64, i64) -> ()
        }
        %2811 = func.call @stack_pop_pointer() : () -> i64
        %2812 = func.call @cc_nil_value() : () -> i64
        %2813 = func.call @cc_nil_value() : () -> i64
        %2814 = func.call @cc_errorp(%2812) : (i64) -> i64
        %2815 = arith.cmpi ne, %2814, %2813 : i64
        %2816 = scf.if %2815 -> (i64) {
          scf.yield %2812 : i64
        } else {
          func.call @stack_push_pointer(%2792) : (i64) -> ()
          %2860 = arith.constant 236837129945111 : i64
          %2861 = arith.constant 1 : i64
          %2862 = func.call @cc_make_closure(%2860, %2861) : (i64, i64) -> i64
          %2863 = llvm.mlir.addressof @str203 : !llvm.ptr
          %2864 = arith.constant 3 : i64
          %2865 = func.call @cc_bind_function_object_const(%2863, %2864, %2862) : (!llvm.ptr, i64, i64) -> i64
          %2866 = arith.constant 5 : i64
          %2867 = func.call @cc_box_fixnum(%2866) : (i64) -> i64
          %2868 = arith.constant 0 : i64
          %2869 = func.call @cc_box_fixnum(%2868) : (i64) -> i64
          %2870 = func.call @cc_nil_value() : () -> i64
          %2871 = func.call @cc_nil_value() : () -> i64
          %2872 = func.call @cc_errorp(%2870) : (i64) -> i64
          %2873 = arith.cmpi ne, %2872, %2871 : i64
          %2874 = scf.if %2873 -> (i64) {
            scf.yield %2870 : i64
          } else {
            %2875 = func.call @cc_nil_value() : () -> i64
            %2876 = llvm.mlir.addressof @str204 : !llvm.ptr
            %2877 = arith.constant 38 : i64
            %2878 = func.call @cc_make_string(%2876, %2877) : (!llvm.ptr, i64) -> i64
            %2879 = func.call @cc_nil_value() : () -> i64
            %2880 = func.call @cc_intern(%2878, %2879) : (i64, i64) -> i64
            %2881 = func.call @cc_nil_value() : () -> i64
            %2882 = func.call @cc_cons(%2880, %2881) : (i64, i64) -> i64
            %2883 = func.call @cc_values_pack(%2882) : (i64) -> i64
            %2884 = func.call @cc_set_symbol_value(%2880, %2875) : (i64, i64) -> i64
            %2885 = llvm.mlir.addressof @str205 : !llvm.ptr
            %2886 = arith.constant 39 : i64
            %2887 = func.call @cc_make_string(%2885, %2886) : (!llvm.ptr, i64) -> i64
            %2888 = func.call @cc_nil_value() : () -> i64
            %2889 = func.call @cc_intern(%2887, %2888) : (i64, i64) -> i64
            %2890 = func.call @cc_nil_value() : () -> i64
            %2891 = func.call @cc_cons(%2889, %2890) : (i64, i64) -> i64
            %2892 = func.call @cc_values_pack(%2891) : (i64) -> i64
            %2893 = func.call @cc_set_symbol_value(%2889, %2875) : (i64, i64) -> i64
            %2894 = llvm.mlir.addressof @str206 : !llvm.ptr
            %2895 = arith.constant 40 : i64
            %2896 = func.call @cc_make_string(%2894, %2895) : (!llvm.ptr, i64) -> i64
            %2897 = func.call @cc_nil_value() : () -> i64
            %2898 = func.call @cc_intern(%2896, %2897) : (i64, i64) -> i64
            %2899 = func.call @cc_nil_value() : () -> i64
            %2900 = func.call @cc_cons(%2898, %2899) : (i64, i64) -> i64
            %2901 = func.call @cc_values_pack(%2900) : (i64) -> i64
            %2902 = func.call @cc_set_symbol_value(%2898, %2875) : (i64, i64) -> i64
            %2903:1 = scf.while (%arg0 = %2869) : (i64) -> (i64) {
              %__rlasp_stack_elide_zero_179 = arith.constant 0 : i64
              %2904 = arith.addi %arg0, %__rlasp_stack_elide_zero_179 : i64
              %__rlasp_stack_elide_zero_180 = arith.constant 0 : i64
              %2905 = arith.addi %2867, %__rlasp_stack_elide_zero_180 : i64
              %2906 = arith.constant 1 : i1
              %2908 = arith.constant 3 : i64
              %2907 = arith.andi %2904, %2908 : i64
              %2909 = arith.constant 0 : i64
              %2910 = arith.cmpi eq, %2907, %2909 : i64
              %2912 = arith.constant 3 : i64
              %2911 = arith.andi %2905, %2912 : i64
              %2913 = arith.constant 0 : i64
              %2914 = arith.cmpi eq, %2911, %2913 : i64
              %2915 = arith.andi %2910, %2914 : i1
              %2916 = scf.if %2915 -> (i1) {
                %2917 = arith.constant 2 : i64
                %2918 = arith.shrsi %2904, %2917 : i64
                %2919 = arith.constant 2 : i64
                %2920 = arith.shrsi %2905, %2919 : i64
                %2921 = arith.cmpi slt, %2918, %2920 : i64
                scf.yield %2921 : i1
              } else {
                %2922 = func.call @cc_lt(%2904, %2905) : (i64, i64) -> i64
                %2923 = func.call @cc_nil_value() : () -> i64
                %2924 = arith.cmpi ne, %2922, %2923 : i64
                scf.yield %2924 : i1
              }
              %2925 = arith.andi %2906, %2916 : i1
              %2926 = func.call @cc_nil_value() : () -> i64
              %2927 = func.call @cc_t_value() : () -> i64
              %2928 = scf.if %2925 -> (i64) {
                scf.yield %2927 : i64
              } else {
                scf.yield %2926 : i64
              }
              %__rlasp_stack_elide_zero_181 = arith.constant 0 : i64
              %2929 = arith.addi %2928, %__rlasp_stack_elide_zero_181 : i64
              %2930 = func.call @cc_nil_value() : () -> i64
              %2931 = arith.cmpi ne, %2929, %2930 : i64
              %2932 = func.call @cc_nil_value() : () -> i64
              %2933 = llvm.mlir.addressof @str207 : !llvm.ptr
              %2934 = arith.constant 38 : i64
              %2935 = func.call @cc_make_string(%2933, %2934) : (!llvm.ptr, i64) -> i64
              %2936 = func.call @cc_nil_value() : () -> i64
              %2937 = func.call @cc_intern(%2935, %2936) : (i64, i64) -> i64
              %2938 = func.call @cc_nil_value() : () -> i64
              %2939 = func.call @cc_cons(%2937, %2938) : (i64, i64) -> i64
              %2940 = func.call @cc_values_pack(%2939) : (i64) -> i64
              %2941 = func.call @cc_symbol_value(%2937) : (i64) -> i64
              %2942 = arith.cmpi ne, %2941, %2932 : i64
              %2943 = llvm.mlir.addressof @str208 : !llvm.ptr
              %2944 = arith.constant 38 : i64
              %2945 = func.call @cc_make_string(%2943, %2944) : (!llvm.ptr, i64) -> i64
              %2946 = func.call @cc_nil_value() : () -> i64
              %2947 = func.call @cc_intern(%2945, %2946) : (i64, i64) -> i64
              %2948 = func.call @cc_nil_value() : () -> i64
              %2949 = func.call @cc_cons(%2947, %2948) : (i64, i64) -> i64
              %2950 = func.call @cc_values_pack(%2949) : (i64) -> i64
              %2951 = func.call @cc_symbol_value(%2947) : (i64) -> i64
              %2952 = arith.cmpi ne, %2951, %2932 : i64
              %2953 = arith.ori %2942, %2952 : i1
              %2954 = arith.constant 0 : i1
              %2955 = arith.cmpi eq, %2953, %2954 : i1
              %2956 = arith.andi %2931, %2955 : i1
              scf.condition(%2956) %arg0 : i64
            } do {
              ^bb0(%2957: i64):
              %__rlasp_stack_elide_zero_182 = arith.constant 0 : i64
              %2958 = arith.addi %2862, %__rlasp_stack_elide_zero_182 : i64
              %2959 = func.call @cc_nil_value() : () -> i64
              %2960 = func.call @cc_errorp(%2811) : (i64) -> i64
              %2961 = arith.cmpi ne, %2960, %2959 : i64
              %2962 = arith.cmpi eq, %2959, %2959 : i64
              %2963 = arith.andi %2961, %2962 : i1
              %2964 = scf.if %2963 -> (i64) {
                scf.yield %2811 : i64
              } else {
                scf.yield %2959 : i64
              }
              %2965 = func.call @cc_errorp(%2958) : (i64) -> i64
              %2966 = arith.cmpi ne, %2965, %2959 : i64
              %2967 = arith.cmpi eq, %2964, %2959 : i64
              %2968 = arith.andi %2966, %2967 : i1
              %2969 = scf.if %2968 -> (i64) {
                scf.yield %2958 : i64
              } else {
                scf.yield %2964 : i64
              }
              %2970 = arith.cmpi ne, %2969, %2959 : i64
              scf.if %2970 {
                func.call @stack_push_pointer(%2969) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%2811) : (i64) -> ()
                func.call @stack_push_pointer(%2958) : (i64) -> ()
                %2971 = llvm.mlir.addressof @str209 : !llvm.ptr
                %2972 = func.call @cc_make_function_ref_const(%2971) : (!llvm.ptr) -> i64
                %2973 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%2972, %2973) : (i64, i64) -> ()
              }
              %2974 = func.call @stack_depth() : () -> i64
              %2975 = arith.constant 0 : i64
              %2976 = arith.cmpi sgt, %2974, %2975 : i64
              scf.if %2976 {
                %2977 = func.call @stack_pop_pointer() : () -> i64
              }
              %2978 = arith.constant 1 : i64
              %2979 = func.call @cc_box_fixnum(%2978) : (i64) -> i64
              %2981 = arith.constant 3 : i64
              %2980 = arith.andi %2957, %2981 : i64
              %2982 = arith.constant 0 : i64
              %2983 = arith.cmpi eq, %2980, %2982 : i64
              %2985 = arith.constant 3 : i64
              %2984 = arith.andi %2979, %2985 : i64
              %2986 = arith.constant 0 : i64
              %2987 = arith.cmpi eq, %2984, %2986 : i64
              %2988 = arith.andi %2983, %2987 : i1
              %2989 = scf.if %2988 -> (i64) {
                %2990 = arith.constant 2 : i64
                %2991 = arith.shrsi %2957, %2990 : i64
                %2992 = arith.constant 2 : i64
                %2993 = arith.shrsi %2979, %2992 : i64
                %2994 = arith.addi %2991, %2993 : i64
                %2995 = arith.constant -2305843009213693952 : i64
                %2996 = arith.constant 2305843009213693951 : i64
                %2997 = arith.cmpi sge, %2994, %2995 : i64
                %2998 = arith.cmpi sle, %2994, %2996 : i64
                %2999 = arith.andi %2997, %2998 : i1
                %3000 = scf.if %2999 -> (i64) {
                  %3001 = arith.constant 2 : i64
                  %3002 = arith.shli %2994, %3001 : i64
                  scf.yield %3002 : i64
                } else {
                  %3003 = func.call @cc_add(%2957, %2979) : (i64, i64) -> i64
                  scf.yield %3003 : i64
                }
                scf.yield %3000 : i64
              } else {
                %3004 = func.call @cc_add(%2957, %2979) : (i64, i64) -> i64
                scf.yield %3004 : i64
              }
              %__rlasp_stack_elide_zero_183 = arith.constant 0 : i64
              %3005 = arith.addi %2989, %__rlasp_stack_elide_zero_183 : i64
              func.call @stack_push_pointer(%3005) : (i64) -> ()
              %3006 = func.call @stack_depth() : () -> i64
              %3007 = arith.constant 0 : i64
              %3008 = arith.cmpi sgt, %3006, %3007 : i64
              scf.if %3008 {
                %3009 = func.call @stack_pop_pointer() : () -> i64
              }
              scf.yield %3005 : i64
            }
            func.call @stack_push_nil() : () -> ()
            %3010 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %3011 = func.call @stack_pop_pointer() : () -> i64
            %3012 = func.call @cc_multiple_value_list(%3011) : (i64) -> i64
            %3013 = llvm.mlir.addressof @str210 : !llvm.ptr
            %3014 = arith.constant 38 : i64
            %3015 = func.call @cc_make_string(%3013, %3014) : (!llvm.ptr, i64) -> i64
            %3016 = func.call @cc_nil_value() : () -> i64
            %3017 = func.call @cc_intern(%3015, %3016) : (i64, i64) -> i64
            %3018 = func.call @cc_nil_value() : () -> i64
            %3019 = func.call @cc_cons(%3017, %3018) : (i64, i64) -> i64
            %3020 = func.call @cc_values_pack(%3019) : (i64) -> i64
            %3021 = func.call @cc_symbol_value(%3017) : (i64) -> i64
            %3022 = llvm.mlir.addressof @str211 : !llvm.ptr
            %3023 = arith.constant 39 : i64
            %3024 = func.call @cc_make_string(%3022, %3023) : (!llvm.ptr, i64) -> i64
            %3025 = func.call @cc_nil_value() : () -> i64
            %3026 = func.call @cc_intern(%3024, %3025) : (i64, i64) -> i64
            %3027 = func.call @cc_nil_value() : () -> i64
            %3028 = func.call @cc_cons(%3026, %3027) : (i64, i64) -> i64
            %3029 = func.call @cc_values_pack(%3028) : (i64) -> i64
            %3030 = func.call @cc_symbol_value(%3026) : (i64) -> i64
            %3031 = llvm.mlir.addressof @str212 : !llvm.ptr
            %3032 = arith.constant 40 : i64
            %3033 = func.call @cc_make_string(%3031, %3032) : (!llvm.ptr, i64) -> i64
            %3034 = func.call @cc_nil_value() : () -> i64
            %3035 = func.call @cc_intern(%3033, %3034) : (i64, i64) -> i64
            %3036 = func.call @cc_nil_value() : () -> i64
            %3037 = func.call @cc_cons(%3035, %3036) : (i64, i64) -> i64
            %3038 = func.call @cc_values_pack(%3037) : (i64) -> i64
            %3039 = func.call @cc_symbol_value(%3035) : (i64) -> i64
            %3040 = func.call @cc_nil_value() : () -> i64
            %3041 = arith.cmpi ne, %3021, %3040 : i64
            %3042 = scf.if %3041 -> (i64) {
              scf.yield %3039 : i64
            } else {
              scf.yield %3012 : i64
            }
            %3043 = func.call @cc_values_pack(%3042) : (i64) -> i64
            %__rlasp_stack_elide_zero_184 = arith.constant 0 : i64
            %3044 = arith.addi %3043, %__rlasp_stack_elide_zero_184 : i64
            scf.yield %3044 : i64
          }
          %__rlasp_stack_elide_zero_185 = arith.constant 0 : i64
          %3045 = arith.addi %2874, %__rlasp_stack_elide_zero_185 : i64
          %3046 = func.call @cc_multiple_value_list(%3045) : (i64) -> i64
          %3047 = func.call @cc_symbol_value(%2792) : (i64) -> i64
          %3048 = func.call @cc_values_pack(%3046) : (i64) -> i64
          %__rlasp_stack_elide_zero_186 = arith.constant 0 : i64
          %3049 = arith.addi %3048, %__rlasp_stack_elide_zero_186 : i64
          scf.yield %3049 : i64
        }
        %3050 = func.call @cc_nil_value() : () -> i64
        %3051 = func.call @cc_errorp(%2816) : (i64) -> i64
        %3052 = arith.cmpi ne, %3051, %3050 : i64
        %3053 = scf.if %3052 -> (i64) {
          scf.yield %2816 : i64
        } else {
          %3054 = func.call @cc_nil_value() : () -> i64
          %3055 = func.call @cc_errorp(%2811) : (i64) -> i64
          %3056 = arith.cmpi ne, %3055, %3054 : i64
          %3057 = arith.cmpi eq, %3054, %3054 : i64
          %3058 = arith.andi %3056, %3057 : i1
          %3059 = scf.if %3058 -> (i64) {
            scf.yield %2811 : i64
          } else {
            scf.yield %3054 : i64
          }
          %3060 = arith.cmpi ne, %3059, %3054 : i64
          scf.if %3060 {
            func.call @stack_push_pointer(%3059) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2811) : (i64) -> ()
            %3061 = llvm.mlir.addressof @str213 : !llvm.ptr
            %3062 = func.call @cc_make_function_ref_const(%3061) : (!llvm.ptr) -> i64
            %3063 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3062, %3063) : (i64, i64) -> ()
          }
          %3064 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3064 : i64
        }
        %__rlasp_stack_elide_zero_187 = arith.constant 0 : i64
        %3065 = arith.addi %3053, %__rlasp_stack_elide_zero_187 : i64
        scf.yield %3065 : i64
      }
      %3066 = func.call @cc_nil_value() : () -> i64
      %3067 = func.call @cc_errorp(%2798) : (i64) -> i64
      %3068 = arith.cmpi ne, %3067, %3066 : i64
      %3069 = scf.if %3068 -> (i64) {
        scf.yield %2798 : i64
      } else {
        %3070 = arith.constant 10 : i64
        %3071 = func.call @cc_box_fixnum(%3070) : (i64) -> i64
        %3072 = arith.constant 0 : i64
        %3073 = func.call @cc_box_fixnum(%3072) : (i64) -> i64
        %3074 = func.call @cc_nil_value() : () -> i64
        %3075 = func.call @cc_nil_value() : () -> i64
        %3076 = func.call @cc_errorp(%3074) : (i64) -> i64
        %3077 = arith.cmpi ne, %3076, %3075 : i64
        %3078 = scf.if %3077 -> (i64) {
          scf.yield %3074 : i64
        } else {
          %3079 = func.call @cc_nil_value() : () -> i64
          %3080 = llvm.mlir.addressof @str214 : !llvm.ptr
          %3081 = arith.constant 38 : i64
          %3082 = func.call @cc_make_string(%3080, %3081) : (!llvm.ptr, i64) -> i64
          %3083 = func.call @cc_nil_value() : () -> i64
          %3084 = func.call @cc_intern(%3082, %3083) : (i64, i64) -> i64
          %3085 = func.call @cc_nil_value() : () -> i64
          %3086 = func.call @cc_cons(%3084, %3085) : (i64, i64) -> i64
          %3087 = func.call @cc_values_pack(%3086) : (i64) -> i64
          %3088 = func.call @cc_set_symbol_value(%3084, %3079) : (i64, i64) -> i64
          %3089 = llvm.mlir.addressof @str215 : !llvm.ptr
          %3090 = arith.constant 39 : i64
          %3091 = func.call @cc_make_string(%3089, %3090) : (!llvm.ptr, i64) -> i64
          %3092 = func.call @cc_nil_value() : () -> i64
          %3093 = func.call @cc_intern(%3091, %3092) : (i64, i64) -> i64
          %3094 = func.call @cc_nil_value() : () -> i64
          %3095 = func.call @cc_cons(%3093, %3094) : (i64, i64) -> i64
          %3096 = func.call @cc_values_pack(%3095) : (i64) -> i64
          %3097 = func.call @cc_set_symbol_value(%3093, %3079) : (i64, i64) -> i64
          %3098 = llvm.mlir.addressof @str216 : !llvm.ptr
          %3099 = arith.constant 40 : i64
          %3100 = func.call @cc_make_string(%3098, %3099) : (!llvm.ptr, i64) -> i64
          %3101 = func.call @cc_nil_value() : () -> i64
          %3102 = func.call @cc_intern(%3100, %3101) : (i64, i64) -> i64
          %3103 = func.call @cc_nil_value() : () -> i64
          %3104 = func.call @cc_cons(%3102, %3103) : (i64, i64) -> i64
          %3105 = func.call @cc_values_pack(%3104) : (i64) -> i64
          %3106 = func.call @cc_set_symbol_value(%3102, %3079) : (i64, i64) -> i64
          %3107:1 = scf.while (%arg0 = %3073) : (i64) -> (i64) {
            %__rlasp_stack_elide_zero_188 = arith.constant 0 : i64
            %3108 = arith.addi %arg0, %__rlasp_stack_elide_zero_188 : i64
            %__rlasp_stack_elide_zero_189 = arith.constant 0 : i64
            %3109 = arith.addi %3071, %__rlasp_stack_elide_zero_189 : i64
            %3110 = arith.constant 1 : i1
            %3112 = arith.constant 3 : i64
            %3111 = arith.andi %3108, %3112 : i64
            %3113 = arith.constant 0 : i64
            %3114 = arith.cmpi eq, %3111, %3113 : i64
            %3116 = arith.constant 3 : i64
            %3115 = arith.andi %3109, %3116 : i64
            %3117 = arith.constant 0 : i64
            %3118 = arith.cmpi eq, %3115, %3117 : i64
            %3119 = arith.andi %3114, %3118 : i1
            %3120 = scf.if %3119 -> (i1) {
              %3121 = arith.constant 2 : i64
              %3122 = arith.shrsi %3108, %3121 : i64
              %3123 = arith.constant 2 : i64
              %3124 = arith.shrsi %3109, %3123 : i64
              %3125 = arith.cmpi slt, %3122, %3124 : i64
              scf.yield %3125 : i1
            } else {
              %3126 = func.call @cc_lt(%3108, %3109) : (i64, i64) -> i64
              %3127 = func.call @cc_nil_value() : () -> i64
              %3128 = arith.cmpi ne, %3126, %3127 : i64
              scf.yield %3128 : i1
            }
            %3129 = arith.andi %3110, %3120 : i1
            %3130 = func.call @cc_nil_value() : () -> i64
            %3131 = func.call @cc_t_value() : () -> i64
            %3132 = scf.if %3129 -> (i64) {
              scf.yield %3131 : i64
            } else {
              scf.yield %3130 : i64
            }
            %__rlasp_stack_elide_zero_190 = arith.constant 0 : i64
            %3133 = arith.addi %3132, %__rlasp_stack_elide_zero_190 : i64
            %3134 = func.call @cc_nil_value() : () -> i64
            %3135 = arith.cmpi ne, %3133, %3134 : i64
            %3136 = func.call @cc_nil_value() : () -> i64
            %3137 = llvm.mlir.addressof @str217 : !llvm.ptr
            %3138 = arith.constant 38 : i64
            %3139 = func.call @cc_make_string(%3137, %3138) : (!llvm.ptr, i64) -> i64
            %3140 = func.call @cc_nil_value() : () -> i64
            %3141 = func.call @cc_intern(%3139, %3140) : (i64, i64) -> i64
            %3142 = func.call @cc_nil_value() : () -> i64
            %3143 = func.call @cc_cons(%3141, %3142) : (i64, i64) -> i64
            %3144 = func.call @cc_values_pack(%3143) : (i64) -> i64
            %3145 = func.call @cc_symbol_value(%3141) : (i64) -> i64
            %3146 = arith.cmpi ne, %3145, %3136 : i64
            %3147 = llvm.mlir.addressof @str218 : !llvm.ptr
            %3148 = arith.constant 38 : i64
            %3149 = func.call @cc_make_string(%3147, %3148) : (!llvm.ptr, i64) -> i64
            %3150 = func.call @cc_nil_value() : () -> i64
            %3151 = func.call @cc_intern(%3149, %3150) : (i64, i64) -> i64
            %3152 = func.call @cc_nil_value() : () -> i64
            %3153 = func.call @cc_cons(%3151, %3152) : (i64, i64) -> i64
            %3154 = func.call @cc_values_pack(%3153) : (i64) -> i64
            %3155 = func.call @cc_symbol_value(%3151) : (i64) -> i64
            %3156 = arith.cmpi ne, %3155, %3136 : i64
            %3157 = arith.ori %3146, %3156 : i1
            %3158 = arith.constant 0 : i1
            %3159 = arith.cmpi eq, %3157, %3158 : i1
            %3160 = arith.andi %3135, %3159 : i1
            scf.condition(%3160) %arg0 : i64
          } do {
            ^bb0(%3161: i64):
            %3162 = func.call @cc_nil_value() : () -> i64
            %3163 = arith.cmpi ne, %3162, %3162 : i64
            scf.if %3163 {
              func.call @stack_push_pointer(%3162) : (i64) -> ()
            } else {
              %3164 = llvm.mlir.addressof @str219 : !llvm.ptr
              %3165 = func.call @cc_make_function_ref_const(%3164) : (!llvm.ptr) -> i64
              %3166 = arith.constant 0 : i64
              func.call @cc_funcall_stack(%3165, %3166) : (i64, i64) -> ()
            }
            %3167 = func.call @stack_depth() : () -> i64
            %3168 = arith.constant 0 : i64
            %3169 = arith.cmpi sgt, %3167, %3168 : i64
            scf.if %3169 {
              %3170 = func.call @stack_pop_pointer() : () -> i64
            }
            %3171 = arith.constant 1 : i64
            %3172 = func.call @cc_box_fixnum(%3171) : (i64) -> i64
            %3174 = arith.constant 3 : i64
            %3173 = arith.andi %3161, %3174 : i64
            %3175 = arith.constant 0 : i64
            %3176 = arith.cmpi eq, %3173, %3175 : i64
            %3178 = arith.constant 3 : i64
            %3177 = arith.andi %3172, %3178 : i64
            %3179 = arith.constant 0 : i64
            %3180 = arith.cmpi eq, %3177, %3179 : i64
            %3181 = arith.andi %3176, %3180 : i1
            %3182 = scf.if %3181 -> (i64) {
              %3183 = arith.constant 2 : i64
              %3184 = arith.shrsi %3161, %3183 : i64
              %3185 = arith.constant 2 : i64
              %3186 = arith.shrsi %3172, %3185 : i64
              %3187 = arith.addi %3184, %3186 : i64
              %3188 = arith.constant -2305843009213693952 : i64
              %3189 = arith.constant 2305843009213693951 : i64
              %3190 = arith.cmpi sge, %3187, %3188 : i64
              %3191 = arith.cmpi sle, %3187, %3189 : i64
              %3192 = arith.andi %3190, %3191 : i1
              %3193 = scf.if %3192 -> (i64) {
                %3194 = arith.constant 2 : i64
                %3195 = arith.shli %3187, %3194 : i64
                scf.yield %3195 : i64
              } else {
                %3196 = func.call @cc_add(%3161, %3172) : (i64, i64) -> i64
                scf.yield %3196 : i64
              }
              scf.yield %3193 : i64
            } else {
              %3197 = func.call @cc_add(%3161, %3172) : (i64, i64) -> i64
              scf.yield %3197 : i64
            }
            %__rlasp_stack_elide_zero_191 = arith.constant 0 : i64
            %3198 = arith.addi %3182, %__rlasp_stack_elide_zero_191 : i64
            func.call @stack_push_pointer(%3198) : (i64) -> ()
            %3199 = func.call @stack_depth() : () -> i64
            %3200 = arith.constant 0 : i64
            %3201 = arith.cmpi sgt, %3199, %3200 : i64
            scf.if %3201 {
              %3202 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %3198 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %3203 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %3204 = func.call @stack_pop_pointer() : () -> i64
          %3205 = func.call @cc_multiple_value_list(%3204) : (i64) -> i64
          %3206 = llvm.mlir.addressof @str220 : !llvm.ptr
          %3207 = arith.constant 38 : i64
          %3208 = func.call @cc_make_string(%3206, %3207) : (!llvm.ptr, i64) -> i64
          %3209 = func.call @cc_nil_value() : () -> i64
          %3210 = func.call @cc_intern(%3208, %3209) : (i64, i64) -> i64
          %3211 = func.call @cc_nil_value() : () -> i64
          %3212 = func.call @cc_cons(%3210, %3211) : (i64, i64) -> i64
          %3213 = func.call @cc_values_pack(%3212) : (i64) -> i64
          %3214 = func.call @cc_symbol_value(%3210) : (i64) -> i64
          %3215 = llvm.mlir.addressof @str221 : !llvm.ptr
          %3216 = arith.constant 39 : i64
          %3217 = func.call @cc_make_string(%3215, %3216) : (!llvm.ptr, i64) -> i64
          %3218 = func.call @cc_nil_value() : () -> i64
          %3219 = func.call @cc_intern(%3217, %3218) : (i64, i64) -> i64
          %3220 = func.call @cc_nil_value() : () -> i64
          %3221 = func.call @cc_cons(%3219, %3220) : (i64, i64) -> i64
          %3222 = func.call @cc_values_pack(%3221) : (i64) -> i64
          %3223 = func.call @cc_symbol_value(%3219) : (i64) -> i64
          %3224 = llvm.mlir.addressof @str222 : !llvm.ptr
          %3225 = arith.constant 40 : i64
          %3226 = func.call @cc_make_string(%3224, %3225) : (!llvm.ptr, i64) -> i64
          %3227 = func.call @cc_nil_value() : () -> i64
          %3228 = func.call @cc_intern(%3226, %3227) : (i64, i64) -> i64
          %3229 = func.call @cc_nil_value() : () -> i64
          %3230 = func.call @cc_cons(%3228, %3229) : (i64, i64) -> i64
          %3231 = func.call @cc_values_pack(%3230) : (i64) -> i64
          %3232 = func.call @cc_symbol_value(%3228) : (i64) -> i64
          %3233 = func.call @cc_nil_value() : () -> i64
          %3234 = arith.cmpi ne, %3214, %3233 : i64
          %3235 = scf.if %3234 -> (i64) {
            scf.yield %3232 : i64
          } else {
            scf.yield %3205 : i64
          }
          %3236 = func.call @cc_values_pack(%3235) : (i64) -> i64
          %__rlasp_stack_elide_zero_192 = arith.constant 0 : i64
          %3237 = arith.addi %3236, %__rlasp_stack_elide_zero_192 : i64
          scf.yield %3237 : i64
        }
        %__rlasp_stack_elide_zero_193 = arith.constant 0 : i64
        %3238 = arith.addi %3078, %__rlasp_stack_elide_zero_193 : i64
        scf.yield %3238 : i64
      }
      %3239 = func.call @cc_nil_value() : () -> i64
      %3240 = func.call @cc_errorp(%3069) : (i64) -> i64
      %3241 = arith.cmpi ne, %3240, %3239 : i64
      %3242 = scf.if %3241 -> (i64) {
        scf.yield %3069 : i64
      } else {
        %3243 = func.call @cc_symbol_value(%2792) : (i64) -> i64
        %__rlasp_stack_elide_zero_194 = arith.constant 0 : i64
        %3244 = arith.addi %3243, %__rlasp_stack_elide_zero_194 : i64
        scf.yield %3244 : i64
      }
      %__rlasp_stack_elide_zero_195 = arith.constant 0 : i64
      %3245 = arith.addi %3242, %__rlasp_stack_elide_zero_195 : i64
      scf.yield %3245 : i64
    }
    func.call @stack_push_pointer(%2786) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FINALIZED-OBJECTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1("maker\0An\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_236837129945088*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_236837129945088*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_236837129945088*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("#:%%DYN-CELL-236837129945089-COUNTC\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str6("inc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_236837129945092*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETVALUE_236837129945092*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETMVLIST_236837129945092*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_236837129945088*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETFLAG_236837129945092*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str12("gctools:finalize\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str13("ext:make-weak-pointer\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETFLAG_236837129945092*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETVALUE_236837129945092*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETMVLIST_236837129945092*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETFLAG_236837129945088*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETMVLIST_236837129945088*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str19("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str20("maker\0An\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETFLAG_236837129945094*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETVALUE_236837129945094*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETMVLIST_236837129945094*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str24("%FN%finalized-objects\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETFLAG_236837129945095*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETVALUE_236837129945095*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str27("*__MLIR_BLOCK_RETMVLIST_236837129945095*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETFLAG_236837129945094*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETFLAG_236837129945095*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str30("gctools:garbage-collect\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_236837129945095*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETVALUE_236837129945095*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str33("*__MLIR_BLOCK_RETMVLIST_236837129945095*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str34("gctools:invoke-finalizers\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str35("ext:weak-pointer-valid\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str36("COUNT-IF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETFLAG_236837129945094*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETMVLIST_236837129945094*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str39("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("*__MLIR_BLOCK_RETFLAG_236837129945096*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str41("*__MLIR_BLOCK_RETVALUE_236837129945096*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str42("*__MLIR_BLOCK_RETMVLIST_236837129945096*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str43("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str44("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str45("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str46("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str47("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str48("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str49("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str50("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str51("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str52("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str54("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str55("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str56("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str58("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str59("*A*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str60("*COUNT*\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("FINALIZERS-CONS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str62("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str63("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str64("MAKE-LIST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str65("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("%FN%test-finalizers\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str67("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str69("Check if list of cons finalizers were executed\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str70("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str71("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str72("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str73("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str74("FINALIZERS-CONS-REMOVE\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str75("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str76("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str79("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str80("MAKE-LIST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str83("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("INC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str85("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str86("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str91("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str94("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str96("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str97("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("FINALIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str100("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str101("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str102("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("INC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str105("DEFINALIZE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str106("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str108("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str109("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str110("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("GARBAGE-COLLECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str113("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("#:%%DYN-CELL-236837129945100-COUNT\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str117("inc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str118("*__MLIR_BLOCK_RETFLAG_236837129945103*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str119("*__MLIR_BLOCK_RETVALUE_236837129945103*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str120("*__MLIR_BLOCK_RETMVLIST_236837129945103*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str121("*__MLIR_BLOCK_RETFLAG_236837129945096*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str122("*__MLIR_BLOCK_RETFLAG_236837129945103*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str123("gctools:finalize\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str124("*__MLIR_BLOCK_RETFLAG_236837129945103*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str125("*__MLIR_BLOCK_RETVALUE_236837129945103*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str126("*__MLIR_BLOCK_RETMVLIST_236837129945103*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str127("gctools:definalize\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str128("*__MLIR_BLOCK_RETFLAG_236837129945104*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str129("*__MLIR_BLOCK_RETVALUE_236837129945104*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str130("*__MLIR_BLOCK_RETMVLIST_236837129945104*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str131("*__MLIR_BLOCK_RETFLAG_236837129945096*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str132("*__MLIR_BLOCK_RETFLAG_236837129945104*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str133("gctools:garbage-collect\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str134("*__MLIR_BLOCK_RETFLAG_236837129945104*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str135("*__MLIR_BLOCK_RETVALUE_236837129945104*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str136("*__MLIR_BLOCK_RETMVLIST_236837129945104*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str137("#:%%DYN-CELL-236837129945105-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str138("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str139("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str140("Check if list of cons finalizers were discarded\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str141("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str142("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str143("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str144("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str145("FINALIZERS-GENERAL\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str146("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str147("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str148("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str151("%FN%test-finalizers\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str152("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str153("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("Check if list of general finalizers were executed\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str155("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str156("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str157("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str158("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str159("FINALIZERS-GENERAL-REMOVE\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str160("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str161("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str162("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str163("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str164("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str165("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str168("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("INC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str170("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str171("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str172("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str173("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str174("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str176("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str178("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str179("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str180("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str181("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str182("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str183("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str184("FINALIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str185("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str186("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str187("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str188("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str189("INC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str190("DEFINALIZE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str191("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str192("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str193("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str194("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str195("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str196("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str197("GARBAGE-COLLECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str198("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str199("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str200("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str201("#:%%DYN-CELL-236837129945109-COUNT\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str202("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str203("inc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str204("*__MLIR_BLOCK_RETFLAG_236837129945112*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str205("*__MLIR_BLOCK_RETVALUE_236837129945112*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str206("*__MLIR_BLOCK_RETMVLIST_236837129945112*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str207("*__MLIR_BLOCK_RETFLAG_236837129945096*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str208("*__MLIR_BLOCK_RETFLAG_236837129945112*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str209("gctools:finalize\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str210("*__MLIR_BLOCK_RETFLAG_236837129945112*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str211("*__MLIR_BLOCK_RETVALUE_236837129945112*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str212("*__MLIR_BLOCK_RETMVLIST_236837129945112*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str213("gctools:definalize\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str214("*__MLIR_BLOCK_RETFLAG_236837129945113*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str215("*__MLIR_BLOCK_RETVALUE_236837129945113*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str216("*__MLIR_BLOCK_RETMVLIST_236837129945113*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str217("*__MLIR_BLOCK_RETFLAG_236837129945096*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str218("*__MLIR_BLOCK_RETFLAG_236837129945113*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str219("gctools:garbage-collect\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str220("*__MLIR_BLOCK_RETFLAG_236837129945113*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str221("*__MLIR_BLOCK_RETVALUE_236837129945113*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str222("*__MLIR_BLOCK_RETMVLIST_236837129945113*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str223("#:%%DYN-CELL-236837129945114-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str224("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str225("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str226("Check if list of general finalizers were discarded\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str227("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str228("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str229("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str230("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str231("*__MLIR_BLOCK_RETFLAG_236837129945096*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str232("*__MLIR_BLOCK_RETMVLIST_236837129945096*\00") : !llvm.array<41 x i8>
}
