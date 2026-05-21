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
  func.func private @cc_aref_raw_index(i64, i64) -> i64
  func.func private @cc_aref_raw_index_eq_fixnum(i64, i64, i64) -> i64
  func.func private @cc_aref_stack()
  func.func private @cc_set_aref(i64, i64, i64) -> i64
  func.func private @cc_set_aref_raw_index(i64, i64, i64) -> i64
  
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
  func.func @"%FN%message"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 7 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 25 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = func.call @stack_pop_pointer() : () -> i64
    %13 = arith.constant 0 : i64
    %14 = func.call @cc_arg(%12, %13) : (i64, i64) -> i64
    %15 = arith.constant 4 : i64
    %16 = func.call @cc_arg(%12, %15) : (i64, i64) -> i64
    %17 = arith.constant 2 : i64
    %18 = func.call @cc_box_fixnum(%17) : (i64) -> i64
    %19 = func.call @cc_collect_rest_args(%12, %18) : (i64, i64) -> i64
    %20 = func.call @cc_nil_value() : () -> i64
    %21 = llvm.mlir.addressof @str2 : !llvm.ptr
    %22 = arith.constant 37 : i64
    %23 = func.call @cc_make_string(%21, %22) : (!llvm.ptr, i64) -> i64
    %24 = func.call @cc_nil_value() : () -> i64
    %25 = func.call @cc_intern(%23, %24) : (i64, i64) -> i64
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_cons(%25, %26) : (i64, i64) -> i64
    %28 = func.call @cc_values_pack(%27) : (i64) -> i64
    %29 = func.call @cc_set_symbol_value(%25, %20) : (i64, i64) -> i64
    %30 = llvm.mlir.addressof @str3 : !llvm.ptr
    %31 = arith.constant 38 : i64
    %32 = func.call @cc_make_string(%30, %31) : (!llvm.ptr, i64) -> i64
    %33 = func.call @cc_nil_value() : () -> i64
    %34 = func.call @cc_intern(%32, %33) : (i64, i64) -> i64
    %35 = func.call @cc_nil_value() : () -> i64
    %36 = func.call @cc_cons(%34, %35) : (i64, i64) -> i64
    %37 = func.call @cc_values_pack(%36) : (i64) -> i64
    %38 = func.call @cc_set_symbol_value(%34, %20) : (i64, i64) -> i64
    %39 = llvm.mlir.addressof @str4 : !llvm.ptr
    %40 = arith.constant 39 : i64
    %41 = func.call @cc_make_string(%39, %40) : (!llvm.ptr, i64) -> i64
    %42 = func.call @cc_nil_value() : () -> i64
    %43 = func.call @cc_intern(%41, %42) : (i64, i64) -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_cons(%43, %44) : (i64, i64) -> i64
    %46 = func.call @cc_values_pack(%45) : (i64) -> i64
    %47 = func.call @cc_set_symbol_value(%43, %20) : (i64, i64) -> i64
    %48 = func.call @cc_nil_value() : () -> i64
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_errorp(%48) : (i64) -> i64
    %51 = arith.cmpi ne, %50, %49 : i64
    %52 = scf.if %51 -> (i64) {
      scf.yield %48 : i64
    } else {
      %53 = llvm.mlir.addressof @str5 : !llvm.ptr
      %54 = arith.constant 97 : i64
      %55 = func.call @cc_make_string(%53, %54) : (!llvm.ptr, i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %56 = arith.addi %55, %__rlasp_stack_elide_zero_0 : i64
      scf.yield %56 : i64
    }
    %57 = func.call @cc_nil_value() : () -> i64
    %58 = func.call @cc_errorp(%52) : (i64) -> i64
    %59 = arith.cmpi ne, %58, %57 : i64
    %60 = scf.if %59 -> (i64) {
      scf.yield %52 : i64
    } else {
      %61 = llvm.mlir.addressof @str6 : !llvm.ptr
      %62 = arith.constant 17 : i64
      %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
      %64 = llvm.mlir.addressof @str7 : !llvm.ptr
      %65 = arith.constant 11 : i64
      %66 = func.call @cc_make_string(%64, %65) : (!llvm.ptr, i64) -> i64
      %67 = func.call @cc_intern(%63, %66) : (i64, i64) -> i64
      %68 = func.call @cc_nil_value() : () -> i64
      %69 = func.call @cc_cons(%67, %68) : (i64, i64) -> i64
      %70 = func.call @cc_values_pack(%69) : (i64) -> i64
      %71 = func.call @cc_symbol_value(%67) : (i64) -> i64
      %72 = func.call @cc_nil_value() : () -> i64
      %73 = func.call @cc_errorp(%71) : (i64) -> i64
      %74 = arith.cmpi ne, %73, %72 : i64
      %75 = arith.cmpi eq, %72, %72 : i64
      %76 = arith.andi %74, %75 : i1
      %77 = scf.if %76 -> (i64) {
        scf.yield %71 : i64
      } else {
        scf.yield %72 : i64
      }
      %78 = arith.cmpi ne, %77, %72 : i64
      scf.if %78 {
        func.call @stack_push_pointer(%77) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%71) : (i64) -> ()
        %79 = llvm.mlir.addressof @str8 : !llvm.ptr
        %80 = func.call @cc_make_function_ref_const(%79) : (!llvm.ptr) -> i64
        %81 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%80, %81) : (i64, i64) -> ()
      }
      %82 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %82 : i64
    }
    %83 = func.call @cc_nil_value() : () -> i64
    %84 = func.call @cc_errorp(%60) : (i64) -> i64
    %85 = arith.cmpi ne, %84, %83 : i64
    %86 = scf.if %85 -> (i64) {
      scf.yield %60 : i64
    } else {
      %87 = llvm.mlir.addressof @str9 : !llvm.ptr
      %88 = arith.constant 17 : i64
      %89 = func.call @cc_make_string(%87, %88) : (!llvm.ptr, i64) -> i64
      %90 = llvm.mlir.addressof @str10 : !llvm.ptr
      %91 = arith.constant 11 : i64
      %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
      %93 = func.call @cc_intern(%89, %92) : (i64, i64) -> i64
      %94 = func.call @cc_nil_value() : () -> i64
      %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
      %96 = func.call @cc_values_pack(%95) : (i64) -> i64
      %97 = func.call @cc_symbol_value(%93) : (i64) -> i64
      %98 = func.call @cc_nil_value() : () -> i64
      %99 = func.call @cc_errorp(%97) : (i64) -> i64
      %100 = arith.cmpi ne, %99, %98 : i64
      %101 = arith.cmpi eq, %98, %98 : i64
      %102 = arith.andi %100, %101 : i1
      %103 = scf.if %102 -> (i64) {
        scf.yield %97 : i64
      } else {
        scf.yield %98 : i64
      }
      %104 = arith.cmpi ne, %103, %98 : i64
      scf.if %104 {
        func.call @stack_push_pointer(%103) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%97) : (i64) -> ()
        %105 = llvm.mlir.addressof @str11 : !llvm.ptr
        %106 = func.call @cc_make_function_ref_const(%105) : (!llvm.ptr) -> i64
        %107 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%106, %107) : (i64, i64) -> ()
      }
      %108 = func.call @stack_pop_pointer() : () -> i64
      %109 = func.call @cc_nil_value() : () -> i64
      %110 = arith.cmpi ne, %108, %109 : i64
      scf.if %110 {
        %111 = func.call @cc_nil_value() : () -> i64
        %112 = func.call @cc_nil_value() : () -> i64
        %113 = func.call @cc_errorp(%111) : (i64) -> i64
        %114 = arith.cmpi ne, %113, %112 : i64
        %115 = scf.if %114 -> (i64) {
          scf.yield %111 : i64
        } else {
          %116 = func.call @cc_t_value() : () -> i64
          %117 = llvm.mlir.addressof @str12 : !llvm.ptr
          %118 = arith.constant 6 : i64
          %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
          %120 = arith.constant 27 : i64
          %121 = func.call @cc_box_character(%120) : (i64) -> i64
          %122 = func.call @cc_nil_value() : () -> i64
          %123 = func.call @cc_nil_value() : () -> i64
          %124 = func.call @cc_errorp(%122) : (i64) -> i64
          %125 = arith.cmpi ne, %124, %123 : i64
          %126 = scf.if %125 -> (i64) {
            scf.yield %122 : i64
          } else {
            func.call @stack_push_pointer(%14) : (i64) -> ()
            %127 = llvm.mlir.addressof @str13 : !llvm.ptr
            %128 = arith.constant 3 : i64
            %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
            %130 = llvm.mlir.addressof @str14 : !llvm.ptr
            %131 = arith.constant 7 : i64
            %132 = func.call @cc_make_string(%130, %131) : (!llvm.ptr, i64) -> i64
            %133 = func.call @cc_intern(%129, %132) : (i64, i64) -> i64
            %134 = func.call @cc_nil_value() : () -> i64
            %135 = func.call @cc_cons(%133, %134) : (i64, i64) -> i64
            %136 = func.call @cc_values_pack(%135) : (i64) -> i64
            %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
            %137 = arith.addi %133, %__rlasp_stack_elide_zero_1 : i64
            %138 = func.call @stack_pop_pointer() : () -> i64
            %139 = func.call @cc_eq(%138, %137) : (i64, i64) -> i64
            %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
            %140 = arith.addi %139, %__rlasp_stack_elide_zero_2 : i64
            %141 = func.call @cc_nil_value() : () -> i64
            %142 = arith.cmpi ne, %140, %141 : i64
            scf.if %142 {
              %143 = arith.constant 31 : i64
              func.call @stack_push_fixnum(%143) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%14) : (i64) -> ()
              %144 = llvm.mlir.addressof @str15 : !llvm.ptr
              %145 = arith.constant 4 : i64
              %146 = func.call @cc_make_string(%144, %145) : (!llvm.ptr, i64) -> i64
              %147 = llvm.mlir.addressof @str16 : !llvm.ptr
              %148 = arith.constant 7 : i64
              %149 = func.call @cc_make_string(%147, %148) : (!llvm.ptr, i64) -> i64
              %150 = func.call @cc_intern(%146, %149) : (i64, i64) -> i64
              %151 = func.call @cc_nil_value() : () -> i64
              %152 = func.call @cc_cons(%150, %151) : (i64, i64) -> i64
              %153 = func.call @cc_values_pack(%152) : (i64) -> i64
              %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
              %154 = arith.addi %150, %__rlasp_stack_elide_zero_3 : i64
              %155 = func.call @stack_pop_pointer() : () -> i64
              %156 = func.call @cc_eq(%155, %154) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
              %157 = arith.addi %156, %__rlasp_stack_elide_zero_4 : i64
              %158 = func.call @cc_nil_value() : () -> i64
              %159 = arith.cmpi ne, %157, %158 : i64
              scf.if %159 {
                %160 = arith.constant 33 : i64
                func.call @stack_push_fixnum(%160) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%14) : (i64) -> ()
                %161 = llvm.mlir.addressof @str17 : !llvm.ptr
                %162 = arith.constant 4 : i64
                %163 = func.call @cc_make_string(%161, %162) : (!llvm.ptr, i64) -> i64
                %164 = llvm.mlir.addressof @str18 : !llvm.ptr
                %165 = arith.constant 7 : i64
                %166 = func.call @cc_make_string(%164, %165) : (!llvm.ptr, i64) -> i64
                %167 = func.call @cc_intern(%163, %166) : (i64, i64) -> i64
                %168 = func.call @cc_nil_value() : () -> i64
                %169 = func.call @cc_cons(%167, %168) : (i64, i64) -> i64
                %170 = func.call @cc_values_pack(%169) : (i64) -> i64
                %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
                %171 = arith.addi %167, %__rlasp_stack_elide_zero_5 : i64
                %172 = func.call @stack_pop_pointer() : () -> i64
                %173 = func.call @cc_eq(%172, %171) : (i64, i64) -> i64
                %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
                %174 = arith.addi %173, %__rlasp_stack_elide_zero_6 : i64
                %175 = func.call @cc_nil_value() : () -> i64
                %176 = arith.cmpi ne, %174, %175 : i64
                scf.if %176 {
                  %177 = arith.constant 32 : i64
                  func.call @stack_push_fixnum(%177) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%14) : (i64) -> ()
                  %178 = llvm.mlir.addressof @str19 : !llvm.ptr
                  %179 = arith.constant 9 : i64
                  %180 = func.call @cc_make_string(%178, %179) : (!llvm.ptr, i64) -> i64
                  %181 = llvm.mlir.addressof @str20 : !llvm.ptr
                  %182 = arith.constant 11 : i64
                  %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
                  %184 = func.call @cc_intern(%180, %183) : (i64, i64) -> i64
                  %185 = func.call @cc_nil_value() : () -> i64
                  %186 = func.call @cc_cons(%184, %185) : (i64, i64) -> i64
                  %187 = func.call @cc_values_pack(%186) : (i64) -> i64
                  %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
                  %188 = arith.addi %184, %__rlasp_stack_elide_zero_7 : i64
                  %189 = func.call @stack_pop_pointer() : () -> i64
                  %190 = func.call @cc_eq(%189, %188) : (i64, i64) -> i64
                  %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
                  %191 = arith.addi %190, %__rlasp_stack_elide_zero_8 : i64
                  %192 = func.call @cc_nil_value() : () -> i64
                  %193 = arith.cmpi ne, %191, %192 : i64
                  scf.if %193 {
                    %194 = arith.constant 0 : i64
                    func.call @stack_push_fixnum(%194) : (i64) -> ()
                }
              }
            }
            }
            %195 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %195 : i64
          }
          %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
          %196 = arith.addi %126, %__rlasp_stack_elide_zero_9 : i64
          func.call @stack_push_pointer(%116) : (i64) -> ()
          func.call @stack_push_pointer(%119) : (i64) -> ()
          func.call @stack_push_pointer(%121) : (i64) -> ()
          func.call @stack_push_pointer(%196) : (i64) -> ()
          %197 = llvm.mlir.addressof @str21 : !llvm.ptr
          %198 = func.call @cc_make_function_ref_const(%197) : (!llvm.ptr) -> i64
          %199 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%198, %199) : (i64, i64) -> ()
          %200 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %200 : i64
        }
        func.call @stack_push_pointer(%115) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %201 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %201 : i64
    }
    %202 = func.call @cc_nil_value() : () -> i64
    %203 = func.call @cc_errorp(%86) : (i64) -> i64
    %204 = arith.cmpi ne, %203, %202 : i64
    %205 = scf.if %204 -> (i64) {
      scf.yield %86 : i64
    } else {
      %206 = llvm.mlir.addressof @str22 : !llvm.ptr
      %207 = func.call @cc_make_function_ref_const(%206) : (!llvm.ptr) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %208 = arith.addi %207, %__rlasp_stack_elide_zero_10 : i64
      %209 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      func.call @stack_push_pointer(%16) : (i64) -> ()
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %210 = arith.addi %19, %__rlasp_stack_elide_zero_11 : i64
      %211 = func.call @stack_pop_pointer() : () -> i64
      %212 = func.call @cc_cons(%211, %210) : (i64, i64) -> i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%213, %212) : (i64, i64) -> i64
      %215 = func.call @cc_apply(%208, %214) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %216 = arith.addi %215, %__rlasp_stack_elide_zero_12 : i64
      scf.yield %216 : i64
    }
    %217 = func.call @cc_nil_value() : () -> i64
    %218 = func.call @cc_errorp(%205) : (i64) -> i64
    %219 = arith.cmpi ne, %218, %217 : i64
    %220 = scf.if %219 -> (i64) {
      scf.yield %205 : i64
    } else {
      %221 = llvm.mlir.addressof @str23 : !llvm.ptr
      %222 = arith.constant 17 : i64
      %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
      %224 = llvm.mlir.addressof @str24 : !llvm.ptr
      %225 = arith.constant 11 : i64
      %226 = func.call @cc_make_string(%224, %225) : (!llvm.ptr, i64) -> i64
      %227 = func.call @cc_intern(%223, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      %231 = func.call @cc_symbol_value(%227) : (i64) -> i64
      %232 = func.call @cc_nil_value() : () -> i64
      %233 = func.call @cc_errorp(%231) : (i64) -> i64
      %234 = arith.cmpi ne, %233, %232 : i64
      %235 = arith.cmpi eq, %232, %232 : i64
      %236 = arith.andi %234, %235 : i1
      %237 = scf.if %236 -> (i64) {
        scf.yield %231 : i64
      } else {
        scf.yield %232 : i64
      }
      %238 = arith.cmpi ne, %237, %232 : i64
      scf.if %238 {
        func.call @stack_push_pointer(%237) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%231) : (i64) -> ()
        %239 = llvm.mlir.addressof @str25 : !llvm.ptr
        %240 = func.call @cc_make_function_ref_const(%239) : (!llvm.ptr) -> i64
        %241 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%240, %241) : (i64, i64) -> ()
      }
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @cc_nil_value() : () -> i64
      %244 = arith.cmpi ne, %242, %243 : i64
      scf.if %244 {
        %245 = func.call @cc_nil_value() : () -> i64
        %246 = func.call @cc_nil_value() : () -> i64
        %247 = func.call @cc_errorp(%245) : (i64) -> i64
        %248 = arith.cmpi ne, %247, %246 : i64
        %249 = scf.if %248 -> (i64) {
          scf.yield %245 : i64
        } else {
          %250 = func.call @cc_t_value() : () -> i64
          %251 = llvm.mlir.addressof @str26 : !llvm.ptr
          %252 = arith.constant 5 : i64
          %253 = func.call @cc_make_string(%251, %252) : (!llvm.ptr, i64) -> i64
          %254 = arith.constant 27 : i64
          %255 = func.call @cc_box_character(%254) : (i64) -> i64
          func.call @stack_push_pointer(%250) : (i64) -> ()
          func.call @stack_push_pointer(%253) : (i64) -> ()
          func.call @stack_push_pointer(%255) : (i64) -> ()
          %256 = llvm.mlir.addressof @str27 : !llvm.ptr
          %257 = func.call @cc_make_function_ref_const(%256) : (!llvm.ptr) -> i64
          %258 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%257, %258) : (i64, i64) -> ()
          %259 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %259 : i64
        }
        func.call @stack_push_pointer(%249) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %260 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %260 : i64
    }
    %261 = func.call @cc_nil_value() : () -> i64
    %262 = func.call @cc_errorp(%220) : (i64) -> i64
    %263 = arith.cmpi ne, %262, %261 : i64
    %264 = scf.if %263 -> (i64) {
      scf.yield %220 : i64
    } else {
      %265 = llvm.mlir.addressof @str28 : !llvm.ptr
      %266 = arith.constant 17 : i64
      %267 = func.call @cc_make_string(%265, %266) : (!llvm.ptr, i64) -> i64
      %268 = llvm.mlir.addressof @str29 : !llvm.ptr
      %269 = arith.constant 11 : i64
      %270 = func.call @cc_make_string(%268, %269) : (!llvm.ptr, i64) -> i64
      %271 = func.call @cc_intern(%267, %270) : (i64, i64) -> i64
      %272 = func.call @cc_nil_value() : () -> i64
      %273 = func.call @cc_cons(%271, %272) : (i64, i64) -> i64
      %274 = func.call @cc_values_pack(%273) : (i64) -> i64
      %275 = func.call @cc_symbol_value(%271) : (i64) -> i64
      %276 = func.call @cc_nil_value() : () -> i64
      %277 = func.call @cc_errorp(%275) : (i64) -> i64
      %278 = arith.cmpi ne, %277, %276 : i64
      %279 = arith.cmpi eq, %276, %276 : i64
      %280 = arith.andi %278, %279 : i1
      %281 = scf.if %280 -> (i64) {
        scf.yield %275 : i64
      } else {
        scf.yield %276 : i64
      }
      %282 = arith.cmpi ne, %281, %276 : i64
      scf.if %282 {
        func.call @stack_push_pointer(%281) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%275) : (i64) -> ()
        %283 = llvm.mlir.addressof @str30 : !llvm.ptr
        %284 = func.call @cc_make_function_ref_const(%283) : (!llvm.ptr) -> i64
        %285 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%284, %285) : (i64, i64) -> ()
      }
      %286 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %286 : i64
    }
    %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
    %287 = arith.addi %264, %__rlasp_stack_elide_zero_13 : i64
    %288 = func.call @cc_multiple_value_list(%287) : (i64) -> i64
    %289 = llvm.mlir.addressof @str31 : !llvm.ptr
    %290 = arith.constant 37 : i64
    %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
    %292 = func.call @cc_nil_value() : () -> i64
    %293 = func.call @cc_intern(%291, %292) : (i64, i64) -> i64
    %294 = func.call @cc_nil_value() : () -> i64
    %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
    %296 = func.call @cc_values_pack(%295) : (i64) -> i64
    %297 = func.call @cc_symbol_value(%293) : (i64) -> i64
    %298 = llvm.mlir.addressof @str32 : !llvm.ptr
    %299 = arith.constant 39 : i64
    %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
    %301 = func.call @cc_nil_value() : () -> i64
    %302 = func.call @cc_intern(%300, %301) : (i64, i64) -> i64
    %303 = func.call @cc_nil_value() : () -> i64
    %304 = func.call @cc_cons(%302, %303) : (i64, i64) -> i64
    %305 = func.call @cc_values_pack(%304) : (i64) -> i64
    %306 = func.call @cc_symbol_value(%302) : (i64) -> i64
    %307 = func.call @cc_nil_value() : () -> i64
    %308 = arith.cmpi ne, %297, %307 : i64
    %309 = scf.if %308 -> (i64) {
      scf.yield %306 : i64
    } else {
      scf.yield %288 : i64
    }
    %310 = func.call @cc_values_pack(%309) : (i64) -> i64
    func.call @stack_push_pointer(%310) : (i64) -> ()
    func.return
  }
  func.func @"%FN%reset-clasp-tests"() {
    %311 = llvm.mlir.addressof @str33 : !llvm.ptr
    %312 = arith.constant 17 : i64
    %313 = func.call @cc_make_string(%311, %312) : (!llvm.ptr, i64) -> i64
    %314 = func.call @cc_nil_value() : () -> i64
    %315 = func.call @cc_intern(%313, %314) : (i64, i64) -> i64
    %316 = func.call @cc_nil_value() : () -> i64
    %317 = func.call @cc_cons(%315, %316) : (i64, i64) -> i64
    %318 = func.call @cc_values_pack(%317) : (i64) -> i64
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = llvm.mlir.addressof @str34 : !llvm.ptr
    %321 = arith.constant 37 : i64
    %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
    %323 = func.call @cc_nil_value() : () -> i64
    %324 = func.call @cc_intern(%322, %323) : (i64, i64) -> i64
    %325 = func.call @cc_nil_value() : () -> i64
    %326 = func.call @cc_cons(%324, %325) : (i64, i64) -> i64
    %327 = func.call @cc_values_pack(%326) : (i64) -> i64
    %328 = func.call @cc_set_symbol_value(%324, %319) : (i64, i64) -> i64
    %329 = llvm.mlir.addressof @str35 : !llvm.ptr
    %330 = arith.constant 38 : i64
    %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
    %332 = func.call @cc_nil_value() : () -> i64
    %333 = func.call @cc_intern(%331, %332) : (i64, i64) -> i64
    %334 = func.call @cc_nil_value() : () -> i64
    %335 = func.call @cc_cons(%333, %334) : (i64, i64) -> i64
    %336 = func.call @cc_values_pack(%335) : (i64) -> i64
    %337 = func.call @cc_set_symbol_value(%333, %319) : (i64, i64) -> i64
    %338 = llvm.mlir.addressof @str36 : !llvm.ptr
    %339 = arith.constant 39 : i64
    %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
    %341 = func.call @cc_nil_value() : () -> i64
    %342 = func.call @cc_intern(%340, %341) : (i64, i64) -> i64
    %343 = func.call @cc_nil_value() : () -> i64
    %344 = func.call @cc_cons(%342, %343) : (i64, i64) -> i64
    %345 = func.call @cc_values_pack(%344) : (i64) -> i64
    %346 = func.call @cc_set_symbol_value(%342, %319) : (i64, i64) -> i64
    %347 = func.call @cc_nil_value() : () -> i64
    %348 = func.call @cc_nil_value() : () -> i64
    %349 = func.call @cc_errorp(%347) : (i64) -> i64
    %350 = arith.cmpi ne, %349, %348 : i64
    %351 = scf.if %350 -> (i64) {
      scf.yield %347 : i64
    } else {
      %352 = func.call @cc_nil_value() : () -> i64
      %353 = llvm.mlir.addressof @str37 : !llvm.ptr
      %354 = arith.constant 23 : i64
      %355 = func.call @cc_make_string(%353, %354) : (!llvm.ptr, i64) -> i64
      %356 = func.call @cc_nil_value() : () -> i64
      %357 = func.call @cc_intern(%355, %356) : (i64, i64) -> i64
      %358 = func.call @cc_nil_value() : () -> i64
      %359 = func.call @cc_cons(%357, %358) : (i64, i64) -> i64
      %360 = func.call @cc_values_pack(%359) : (i64) -> i64
      %361 = func.call @cc_set_symbol_value(%357, %352) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %362 = arith.addi %352, %__rlasp_stack_elide_zero_14 : i64
      scf.yield %362 : i64
    }
    %363 = func.call @cc_nil_value() : () -> i64
    %364 = func.call @cc_errorp(%351) : (i64) -> i64
    %365 = arith.cmpi ne, %364, %363 : i64
    %366 = scf.if %365 -> (i64) {
      scf.yield %351 : i64
    } else {
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = llvm.mlir.addressof @str38 : !llvm.ptr
      %369 = arith.constant 25 : i64
      %370 = func.call @cc_make_string(%368, %369) : (!llvm.ptr, i64) -> i64
      %371 = func.call @cc_nil_value() : () -> i64
      %372 = func.call @cc_intern(%370, %371) : (i64, i64) -> i64
      %373 = func.call @cc_nil_value() : () -> i64
      %374 = func.call @cc_cons(%372, %373) : (i64, i64) -> i64
      %375 = func.call @cc_values_pack(%374) : (i64) -> i64
      %376 = func.call @cc_set_symbol_value(%372, %367) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %377 = arith.addi %367, %__rlasp_stack_elide_zero_15 : i64
      scf.yield %377 : i64
    }
    %378 = func.call @cc_nil_value() : () -> i64
    %379 = func.call @cc_errorp(%366) : (i64) -> i64
    %380 = arith.cmpi ne, %379, %378 : i64
    %381 = scf.if %380 -> (i64) {
      scf.yield %366 : i64
    } else {
      %382 = func.call @cc_nil_value() : () -> i64
      %383 = llvm.mlir.addressof @str39 : !llvm.ptr
      %384 = arith.constant 23 : i64
      %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
      %386 = func.call @cc_nil_value() : () -> i64
      %387 = func.call @cc_intern(%385, %386) : (i64, i64) -> i64
      %388 = func.call @cc_nil_value() : () -> i64
      %389 = func.call @cc_cons(%387, %388) : (i64, i64) -> i64
      %390 = func.call @cc_values_pack(%389) : (i64) -> i64
      %391 = func.call @cc_set_symbol_value(%387, %382) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %392 = arith.addi %382, %__rlasp_stack_elide_zero_16 : i64
      scf.yield %392 : i64
    }
    %393 = func.call @cc_nil_value() : () -> i64
    %394 = func.call @cc_errorp(%381) : (i64) -> i64
    %395 = arith.cmpi ne, %394, %393 : i64
    %396 = scf.if %395 -> (i64) {
      scf.yield %381 : i64
    } else {
      %397 = func.call @cc_nil_value() : () -> i64
      %398 = llvm.mlir.addressof @str40 : !llvm.ptr
      %399 = arith.constant 25 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = func.call @cc_nil_value() : () -> i64
      %402 = func.call @cc_intern(%400, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      %406 = func.call @cc_set_symbol_value(%402, %397) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %407 = arith.addi %397, %__rlasp_stack_elide_zero_17 : i64
      scf.yield %407 : i64
    }
    %408 = func.call @cc_nil_value() : () -> i64
    %409 = func.call @cc_errorp(%396) : (i64) -> i64
    %410 = arith.cmpi ne, %409, %408 : i64
    %411 = scf.if %410 -> (i64) {
      scf.yield %396 : i64
    } else {
      %412 = func.call @cc_nil_value() : () -> i64
      %413 = llvm.mlir.addressof @str41 : !llvm.ptr
      %414 = arith.constant 25 : i64
      %415 = func.call @cc_make_string(%413, %414) : (!llvm.ptr, i64) -> i64
      %416 = func.call @cc_nil_value() : () -> i64
      %417 = func.call @cc_intern(%415, %416) : (i64, i64) -> i64
      %418 = func.call @cc_nil_value() : () -> i64
      %419 = func.call @cc_cons(%417, %418) : (i64, i64) -> i64
      %420 = func.call @cc_values_pack(%419) : (i64) -> i64
      %421 = func.call @cc_set_symbol_value(%417, %412) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %422 = arith.addi %412, %__rlasp_stack_elide_zero_18 : i64
      scf.yield %422 : i64
    }
    %423 = func.call @cc_nil_value() : () -> i64
    %424 = func.call @cc_errorp(%411) : (i64) -> i64
    %425 = arith.cmpi ne, %424, %423 : i64
    %426 = scf.if %425 -> (i64) {
      scf.yield %411 : i64
    } else {
      %427 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%427) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %428 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %429 = arith.addi %428, %__rlasp_stack_elide_zero_19 : i64
      %430 = llvm.mlir.addressof @str42 : !llvm.ptr
      %431 = arith.constant 19 : i64
      %432 = func.call @cc_make_string(%430, %431) : (!llvm.ptr, i64) -> i64
      %433 = func.call @cc_nil_value() : () -> i64
      %434 = func.call @cc_intern(%432, %433) : (i64, i64) -> i64
      %435 = func.call @cc_nil_value() : () -> i64
      %436 = func.call @cc_cons(%434, %435) : (i64, i64) -> i64
      %437 = func.call @cc_values_pack(%436) : (i64) -> i64
      %438 = func.call @cc_set_symbol_value(%434, %429) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %439 = arith.addi %429, %__rlasp_stack_elide_zero_20 : i64
      scf.yield %439 : i64
    }
    %440 = func.call @cc_nil_value() : () -> i64
    %441 = func.call @cc_errorp(%426) : (i64) -> i64
    %442 = arith.cmpi ne, %441, %440 : i64
    %443 = scf.if %442 -> (i64) {
      scf.yield %426 : i64
    } else {
      %444 = func.call @cc_nil_value() : () -> i64
      %445 = llvm.mlir.addressof @str43 : !llvm.ptr
      %446 = arith.constant 17 : i64
      %447 = func.call @cc_make_string(%445, %446) : (!llvm.ptr, i64) -> i64
      %448 = func.call @cc_nil_value() : () -> i64
      %449 = func.call @cc_intern(%447, %448) : (i64, i64) -> i64
      %450 = func.call @cc_nil_value() : () -> i64
      %451 = func.call @cc_cons(%449, %450) : (i64, i64) -> i64
      %452 = func.call @cc_values_pack(%451) : (i64) -> i64
      %453 = func.call @cc_set_symbol_value(%449, %444) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %454 = arith.addi %444, %__rlasp_stack_elide_zero_21 : i64
      scf.yield %454 : i64
    }
    %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
    %455 = arith.addi %443, %__rlasp_stack_elide_zero_22 : i64
    %456 = func.call @cc_multiple_value_list(%455) : (i64) -> i64
    %457 = llvm.mlir.addressof @str44 : !llvm.ptr
    %458 = arith.constant 37 : i64
    %459 = func.call @cc_make_string(%457, %458) : (!llvm.ptr, i64) -> i64
    %460 = func.call @cc_nil_value() : () -> i64
    %461 = func.call @cc_intern(%459, %460) : (i64, i64) -> i64
    %462 = func.call @cc_nil_value() : () -> i64
    %463 = func.call @cc_cons(%461, %462) : (i64, i64) -> i64
    %464 = func.call @cc_values_pack(%463) : (i64) -> i64
    %465 = func.call @cc_symbol_value(%461) : (i64) -> i64
    %466 = llvm.mlir.addressof @str45 : !llvm.ptr
    %467 = arith.constant 39 : i64
    %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
    %469 = func.call @cc_nil_value() : () -> i64
    %470 = func.call @cc_intern(%468, %469) : (i64, i64) -> i64
    %471 = func.call @cc_nil_value() : () -> i64
    %472 = func.call @cc_cons(%470, %471) : (i64, i64) -> i64
    %473 = func.call @cc_values_pack(%472) : (i64) -> i64
    %474 = func.call @cc_symbol_value(%470) : (i64) -> i64
    %475 = func.call @cc_nil_value() : () -> i64
    %476 = arith.cmpi ne, %465, %475 : i64
    %477 = scf.if %476 -> (i64) {
      scf.yield %474 : i64
    } else {
      scf.yield %456 : i64
    }
    %478 = func.call @cc_values_pack(%477) : (i64) -> i64
    func.call @stack_push_pointer(%478) : (i64) -> ()
    func.return
  }
  func.func @"%FN%note-test"() {
    %479 = llvm.mlir.addressof @str46 : !llvm.ptr
    %480 = arith.constant 9 : i64
    %481 = func.call @cc_make_string(%479, %480) : (!llvm.ptr, i64) -> i64
    %482 = func.call @cc_nil_value() : () -> i64
    %483 = func.call @cc_intern(%481, %482) : (i64, i64) -> i64
    %484 = func.call @cc_nil_value() : () -> i64
    %485 = func.call @cc_cons(%483, %484) : (i64, i64) -> i64
    %486 = func.call @cc_values_pack(%485) : (i64) -> i64
    %487 = llvm.mlir.addressof @str47 : !llvm.ptr
    %488 = arith.constant 4 : i64
    %489 = func.call @cc_make_string(%487, %488) : (!llvm.ptr, i64) -> i64
    %490 = func.call @cc_register_function_lambda_list_metadata_raw(%483, %489) : (i64, i64) -> i64
    %491 = func.call @stack_pop_pointer() : () -> i64
    %492 = func.call @cc_nil_value() : () -> i64
    %493 = llvm.mlir.addressof @str48 : !llvm.ptr
    %494 = arith.constant 37 : i64
    %495 = func.call @cc_make_string(%493, %494) : (!llvm.ptr, i64) -> i64
    %496 = func.call @cc_nil_value() : () -> i64
    %497 = func.call @cc_intern(%495, %496) : (i64, i64) -> i64
    %498 = func.call @cc_nil_value() : () -> i64
    %499 = func.call @cc_cons(%497, %498) : (i64, i64) -> i64
    %500 = func.call @cc_values_pack(%499) : (i64) -> i64
    %501 = func.call @cc_set_symbol_value(%497, %492) : (i64, i64) -> i64
    %502 = llvm.mlir.addressof @str49 : !llvm.ptr
    %503 = arith.constant 38 : i64
    %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
    %505 = func.call @cc_nil_value() : () -> i64
    %506 = func.call @cc_intern(%504, %505) : (i64, i64) -> i64
    %507 = func.call @cc_nil_value() : () -> i64
    %508 = func.call @cc_cons(%506, %507) : (i64, i64) -> i64
    %509 = func.call @cc_values_pack(%508) : (i64) -> i64
    %510 = func.call @cc_set_symbol_value(%506, %492) : (i64, i64) -> i64
    %511 = llvm.mlir.addressof @str50 : !llvm.ptr
    %512 = arith.constant 39 : i64
    %513 = func.call @cc_make_string(%511, %512) : (!llvm.ptr, i64) -> i64
    %514 = func.call @cc_nil_value() : () -> i64
    %515 = func.call @cc_intern(%513, %514) : (i64, i64) -> i64
    %516 = func.call @cc_nil_value() : () -> i64
    %517 = func.call @cc_cons(%515, %516) : (i64, i64) -> i64
    %518 = func.call @cc_values_pack(%517) : (i64) -> i64
    %519 = func.call @cc_set_symbol_value(%515, %492) : (i64, i64) -> i64
    %520 = llvm.mlir.addressof @str51 : !llvm.ptr
    %521 = arith.constant 19 : i64
    %522 = func.call @cc_make_string(%520, %521) : (!llvm.ptr, i64) -> i64
    %523 = func.call @cc_nil_value() : () -> i64
    %524 = func.call @cc_intern(%522, %523) : (i64, i64) -> i64
    %525 = func.call @cc_nil_value() : () -> i64
    %526 = func.call @cc_cons(%524, %525) : (i64, i64) -> i64
    %527 = func.call @cc_values_pack(%526) : (i64) -> i64
    %528 = func.call @cc_symbol_value(%524) : (i64) -> i64
    %529 = func.call @cc_nil_value() : () -> i64
    %530 = func.call @cc_gethash(%491, %528, %529) : (i64, i64, i64) -> i64
    %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
    %531 = arith.addi %530, %__rlasp_stack_elide_zero_23 : i64
    %532 = func.call @cc_nil_value() : () -> i64
    %533 = arith.cmpi ne, %531, %532 : i64
    scf.if %533 {
      %534 = func.call @cc_nil_value() : () -> i64
      %535 = func.call @cc_nil_value() : () -> i64
      %536 = func.call @cc_errorp(%534) : (i64) -> i64
      %537 = arith.cmpi ne, %536, %535 : i64
      %538 = scf.if %537 -> (i64) {
        scf.yield %534 : i64
      } else {
        %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
        %539 = arith.addi %491, %__rlasp_stack_elide_zero_24 : i64
        %540 = llvm.mlir.addressof @str52 : !llvm.ptr
        %541 = arith.constant 17 : i64
        %542 = func.call @cc_make_string(%540, %541) : (!llvm.ptr, i64) -> i64
        %543 = func.call @cc_nil_value() : () -> i64
        %544 = func.call @cc_intern(%542, %543) : (i64, i64) -> i64
        %545 = func.call @cc_nil_value() : () -> i64
        %546 = func.call @cc_cons(%544, %545) : (i64, i64) -> i64
        %547 = func.call @cc_values_pack(%546) : (i64) -> i64
        %548 = func.call @cc_symbol_value(%544) : (i64) -> i64
        %549 = func.call @cc_cons(%539, %548) : (i64, i64) -> i64
        %550 = llvm.mlir.addressof @str53 : !llvm.ptr
        %551 = arith.constant 17 : i64
        %552 = func.call @cc_make_string(%550, %551) : (!llvm.ptr, i64) -> i64
        %553 = func.call @cc_nil_value() : () -> i64
        %554 = func.call @cc_intern(%552, %553) : (i64, i64) -> i64
        %555 = func.call @cc_nil_value() : () -> i64
        %556 = func.call @cc_cons(%554, %555) : (i64, i64) -> i64
        %557 = func.call @cc_values_pack(%556) : (i64) -> i64
        %558 = func.call @cc_set_symbol_value(%554, %549) : (i64, i64) -> i64
        %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
        %559 = arith.addi %549, %__rlasp_stack_elide_zero_25 : i64
        scf.yield %559 : i64
      }
      %560 = func.call @cc_nil_value() : () -> i64
      %561 = func.call @cc_errorp(%538) : (i64) -> i64
      %562 = arith.cmpi ne, %561, %560 : i64
      %563 = scf.if %562 -> (i64) {
        scf.yield %538 : i64
      } else {
        %564 = llvm.mlir.addressof @str54 : !llvm.ptr
        %565 = arith.constant 21 : i64
        %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
        %567 = func.call @cc_nil_value() : () -> i64
        %568 = func.call @cc_errorp(%566) : (i64) -> i64
        %569 = arith.cmpi ne, %568, %567 : i64
        %570 = arith.cmpi eq, %567, %567 : i64
        %571 = arith.andi %569, %570 : i1
        %572 = scf.if %571 -> (i64) {
          scf.yield %566 : i64
        } else {
          scf.yield %567 : i64
        }
        %573 = func.call @cc_errorp(%491) : (i64) -> i64
        %574 = arith.cmpi ne, %573, %567 : i64
        %575 = arith.cmpi eq, %572, %567 : i64
        %576 = arith.andi %574, %575 : i1
        %577 = scf.if %576 -> (i64) {
          scf.yield %491 : i64
        } else {
          scf.yield %572 : i64
        }
        %578 = arith.cmpi ne, %577, %567 : i64
        scf.if %578 {
          func.call @stack_push_pointer(%577) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%566) : (i64) -> ()
          func.call @stack_push_pointer(%491) : (i64) -> ()
          %579 = llvm.mlir.addressof @str55 : !llvm.ptr
          %580 = func.call @cc_make_function_ref_const(%579) : (!llvm.ptr) -> i64
          %581 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%580, %581) : (i64, i64) -> ()
        }
        %582 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %582 : i64
      }
      func.call @stack_push_pointer(%563) : (i64) -> ()
    } else {
      %583 = func.call @cc_t_value() : () -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %584 = arith.addi %583, %__rlasp_stack_elide_zero_26 : i64
      %585 = func.call @cc_nil_value() : () -> i64
      %586 = arith.cmpi ne, %584, %585 : i64
      scf.if %586 {
        %587 = llvm.mlir.addressof @str56 : !llvm.ptr
        %588 = arith.constant 19 : i64
        %589 = func.call @cc_make_string(%587, %588) : (!llvm.ptr, i64) -> i64
        %590 = func.call @cc_nil_value() : () -> i64
        %591 = func.call @cc_intern(%589, %590) : (i64, i64) -> i64
        %592 = func.call @cc_nil_value() : () -> i64
        %593 = func.call @cc_cons(%591, %592) : (i64, i64) -> i64
        %594 = func.call @cc_values_pack(%593) : (i64) -> i64
        %595 = func.call @cc_symbol_value(%591) : (i64) -> i64
        %596 = func.call @cc_t_value() : () -> i64
        %597 = func.call @cc_puthash(%491, %596, %595) : (i64, i64, i64) -> i64
        func.call @stack_push_pointer(%597) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
    }
    %598 = func.call @stack_pop_pointer() : () -> i64
    %599 = func.call @cc_multiple_value_list(%598) : (i64) -> i64
    %600 = llvm.mlir.addressof @str57 : !llvm.ptr
    %601 = arith.constant 37 : i64
    %602 = func.call @cc_make_string(%600, %601) : (!llvm.ptr, i64) -> i64
    %603 = func.call @cc_nil_value() : () -> i64
    %604 = func.call @cc_intern(%602, %603) : (i64, i64) -> i64
    %605 = func.call @cc_nil_value() : () -> i64
    %606 = func.call @cc_cons(%604, %605) : (i64, i64) -> i64
    %607 = func.call @cc_values_pack(%606) : (i64) -> i64
    %608 = func.call @cc_symbol_value(%604) : (i64) -> i64
    %609 = llvm.mlir.addressof @str58 : !llvm.ptr
    %610 = arith.constant 39 : i64
    %611 = func.call @cc_make_string(%609, %610) : (!llvm.ptr, i64) -> i64
    %612 = func.call @cc_nil_value() : () -> i64
    %613 = func.call @cc_intern(%611, %612) : (i64, i64) -> i64
    %614 = func.call @cc_nil_value() : () -> i64
    %615 = func.call @cc_cons(%613, %614) : (i64, i64) -> i64
    %616 = func.call @cc_values_pack(%615) : (i64) -> i64
    %617 = func.call @cc_symbol_value(%613) : (i64) -> i64
    %618 = func.call @cc_nil_value() : () -> i64
    %619 = arith.cmpi ne, %608, %618 : i64
    %620 = scf.if %619 -> (i64) {
      scf.yield %617 : i64
    } else {
      scf.yield %599 : i64
    }
    %621 = func.call @cc_values_pack(%620) : (i64) -> i64
    func.call @stack_push_pointer(%621) : (i64) -> ()
    func.return
  }
  func.func @"%FN%note-compile-error"() {
    %622 = llvm.mlir.addressof @str59 : !llvm.ptr
    %623 = arith.constant 18 : i64
    %624 = func.call @cc_make_string(%622, %623) : (!llvm.ptr, i64) -> i64
    %625 = func.call @cc_nil_value() : () -> i64
    %626 = func.call @cc_intern(%624, %625) : (i64, i64) -> i64
    %627 = func.call @cc_nil_value() : () -> i64
    %628 = func.call @cc_cons(%626, %627) : (i64, i64) -> i64
    %629 = func.call @cc_values_pack(%628) : (i64) -> i64
    %630 = llvm.mlir.addressof @str60 : !llvm.ptr
    %631 = arith.constant 10 : i64
    %632 = func.call @cc_make_string(%630, %631) : (!llvm.ptr, i64) -> i64
    %633 = func.call @cc_register_function_lambda_list_metadata_raw(%626, %632) : (i64, i64) -> i64
    %634 = func.call @stack_pop_pointer() : () -> i64
    %635 = func.call @cc_nil_value() : () -> i64
    %636 = llvm.mlir.addressof @str61 : !llvm.ptr
    %637 = arith.constant 37 : i64
    %638 = func.call @cc_make_string(%636, %637) : (!llvm.ptr, i64) -> i64
    %639 = func.call @cc_nil_value() : () -> i64
    %640 = func.call @cc_intern(%638, %639) : (i64, i64) -> i64
    %641 = func.call @cc_nil_value() : () -> i64
    %642 = func.call @cc_cons(%640, %641) : (i64, i64) -> i64
    %643 = func.call @cc_values_pack(%642) : (i64) -> i64
    %644 = func.call @cc_set_symbol_value(%640, %635) : (i64, i64) -> i64
    %645 = llvm.mlir.addressof @str62 : !llvm.ptr
    %646 = arith.constant 38 : i64
    %647 = func.call @cc_make_string(%645, %646) : (!llvm.ptr, i64) -> i64
    %648 = func.call @cc_nil_value() : () -> i64
    %649 = func.call @cc_intern(%647, %648) : (i64, i64) -> i64
    %650 = func.call @cc_nil_value() : () -> i64
    %651 = func.call @cc_cons(%649, %650) : (i64, i64) -> i64
    %652 = func.call @cc_values_pack(%651) : (i64) -> i64
    %653 = func.call @cc_set_symbol_value(%649, %635) : (i64, i64) -> i64
    %654 = llvm.mlir.addressof @str63 : !llvm.ptr
    %655 = arith.constant 39 : i64
    %656 = func.call @cc_make_string(%654, %655) : (!llvm.ptr, i64) -> i64
    %657 = func.call @cc_nil_value() : () -> i64
    %658 = func.call @cc_intern(%656, %657) : (i64, i64) -> i64
    %659 = func.call @cc_nil_value() : () -> i64
    %660 = func.call @cc_cons(%658, %659) : (i64, i64) -> i64
    %661 = func.call @cc_values_pack(%660) : (i64) -> i64
    %662 = func.call @cc_set_symbol_value(%658, %635) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
    %663 = arith.addi %634, %__rlasp_stack_elide_zero_27 : i64
    %664 = llvm.mlir.addressof @str64 : !llvm.ptr
    %665 = arith.constant 25 : i64
    %666 = func.call @cc_make_string(%664, %665) : (!llvm.ptr, i64) -> i64
    %667 = func.call @cc_nil_value() : () -> i64
    %668 = func.call @cc_intern(%666, %667) : (i64, i64) -> i64
    %669 = func.call @cc_nil_value() : () -> i64
    %670 = func.call @cc_cons(%668, %669) : (i64, i64) -> i64
    %671 = func.call @cc_values_pack(%670) : (i64) -> i64
    %672 = func.call @cc_symbol_value(%668) : (i64) -> i64
    %673 = func.call @cc_cons(%663, %672) : (i64, i64) -> i64
    %674 = llvm.mlir.addressof @str65 : !llvm.ptr
    %675 = arith.constant 25 : i64
    %676 = func.call @cc_make_string(%674, %675) : (!llvm.ptr, i64) -> i64
    %677 = func.call @cc_nil_value() : () -> i64
    %678 = func.call @cc_intern(%676, %677) : (i64, i64) -> i64
    %679 = func.call @cc_nil_value() : () -> i64
    %680 = func.call @cc_cons(%678, %679) : (i64, i64) -> i64
    %681 = func.call @cc_values_pack(%680) : (i64) -> i64
    %682 = func.call @cc_set_symbol_value(%678, %673) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
    %683 = arith.addi %673, %__rlasp_stack_elide_zero_28 : i64
    %684 = func.call @cc_multiple_value_list(%683) : (i64) -> i64
    %685 = llvm.mlir.addressof @str66 : !llvm.ptr
    %686 = arith.constant 37 : i64
    %687 = func.call @cc_make_string(%685, %686) : (!llvm.ptr, i64) -> i64
    %688 = func.call @cc_nil_value() : () -> i64
    %689 = func.call @cc_intern(%687, %688) : (i64, i64) -> i64
    %690 = func.call @cc_nil_value() : () -> i64
    %691 = func.call @cc_cons(%689, %690) : (i64, i64) -> i64
    %692 = func.call @cc_values_pack(%691) : (i64) -> i64
    %693 = func.call @cc_symbol_value(%689) : (i64) -> i64
    %694 = llvm.mlir.addressof @str67 : !llvm.ptr
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
  func.func @"%FN%show-test-summary"() {
    %707 = llvm.mlir.addressof @str68 : !llvm.ptr
    %708 = arith.constant 17 : i64
    %709 = func.call @cc_make_string(%707, %708) : (!llvm.ptr, i64) -> i64
    %710 = func.call @cc_nil_value() : () -> i64
    %711 = func.call @cc_intern(%709, %710) : (i64, i64) -> i64
    %712 = func.call @cc_nil_value() : () -> i64
    %713 = func.call @cc_cons(%711, %712) : (i64, i64) -> i64
    %714 = func.call @cc_values_pack(%713) : (i64) -> i64
    %715 = func.call @cc_nil_value() : () -> i64
    %716 = llvm.mlir.addressof @str69 : !llvm.ptr
    %717 = arith.constant 37 : i64
    %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
    %719 = func.call @cc_nil_value() : () -> i64
    %720 = func.call @cc_intern(%718, %719) : (i64, i64) -> i64
    %721 = func.call @cc_nil_value() : () -> i64
    %722 = func.call @cc_cons(%720, %721) : (i64, i64) -> i64
    %723 = func.call @cc_values_pack(%722) : (i64) -> i64
    %724 = func.call @cc_set_symbol_value(%720, %715) : (i64, i64) -> i64
    %725 = llvm.mlir.addressof @str70 : !llvm.ptr
    %726 = arith.constant 38 : i64
    %727 = func.call @cc_make_string(%725, %726) : (!llvm.ptr, i64) -> i64
    %728 = func.call @cc_nil_value() : () -> i64
    %729 = func.call @cc_intern(%727, %728) : (i64, i64) -> i64
    %730 = func.call @cc_nil_value() : () -> i64
    %731 = func.call @cc_cons(%729, %730) : (i64, i64) -> i64
    %732 = func.call @cc_values_pack(%731) : (i64) -> i64
    %733 = func.call @cc_set_symbol_value(%729, %715) : (i64, i64) -> i64
    %734 = llvm.mlir.addressof @str71 : !llvm.ptr
    %735 = arith.constant 39 : i64
    %736 = func.call @cc_make_string(%734, %735) : (!llvm.ptr, i64) -> i64
    %737 = func.call @cc_nil_value() : () -> i64
    %738 = func.call @cc_intern(%736, %737) : (i64, i64) -> i64
    %739 = func.call @cc_nil_value() : () -> i64
    %740 = func.call @cc_cons(%738, %739) : (i64, i64) -> i64
    %741 = func.call @cc_values_pack(%740) : (i64) -> i64
    %742 = func.call @cc_set_symbol_value(%738, %715) : (i64, i64) -> i64
    %743 = func.call @cc_nil_value() : () -> i64
    %744 = func.call @cc_nil_value() : () -> i64
    %745 = func.call @cc_errorp(%743) : (i64) -> i64
    %746 = arith.cmpi ne, %745, %744 : i64
    %747 = scf.if %746 -> (i64) {
      scf.yield %743 : i64
    } else {
      %748 = llvm.mlir.addressof @str72 : !llvm.ptr
      %749 = arith.constant 4 : i64
      %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
      %751 = llvm.mlir.addressof @str73 : !llvm.ptr
      %752 = arith.constant 7 : i64
      %753 = func.call @cc_make_string(%751, %752) : (!llvm.ptr, i64) -> i64
      %754 = func.call @cc_intern(%750, %753) : (i64, i64) -> i64
      %755 = func.call @cc_nil_value() : () -> i64
      %756 = func.call @cc_cons(%754, %755) : (i64, i64) -> i64
      %757 = func.call @cc_values_pack(%756) : (i64) -> i64
      %758 = llvm.mlir.addressof @str74 : !llvm.ptr
      %759 = arith.constant 147 : i64
      %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
      %761 = llvm.mlir.addressof @str75 : !llvm.ptr
      %762 = arith.constant 25 : i64
      %763 = func.call @cc_make_string(%761, %762) : (!llvm.ptr, i64) -> i64
      %764 = func.call @cc_nil_value() : () -> i64
      %765 = func.call @cc_intern(%763, %764) : (i64, i64) -> i64
      %766 = func.call @cc_nil_value() : () -> i64
      %767 = func.call @cc_cons(%765, %766) : (i64, i64) -> i64
      %768 = func.call @cc_values_pack(%767) : (i64) -> i64
      %769 = func.call @cc_symbol_value(%765) : (i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %770 = arith.addi %769, %__rlasp_stack_elide_zero_29 : i64
      %771 = func.call @cc_reverse(%770) : (i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %772 = arith.addi %771, %__rlasp_stack_elide_zero_30 : i64
      %773 = llvm.mlir.addressof @str76 : !llvm.ptr
      %774 = arith.constant 25 : i64
      %775 = func.call @cc_make_string(%773, %774) : (!llvm.ptr, i64) -> i64
      %776 = func.call @cc_nil_value() : () -> i64
      %777 = func.call @cc_intern(%775, %776) : (i64, i64) -> i64
      %778 = func.call @cc_nil_value() : () -> i64
      %779 = func.call @cc_cons(%777, %778) : (i64, i64) -> i64
      %780 = func.call @cc_values_pack(%779) : (i64) -> i64
      %781 = func.call @cc_symbol_value(%777) : (i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %782 = arith.addi %781, %__rlasp_stack_elide_zero_31 : i64
      %783 = func.call @cc_reverse(%782) : (i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %784 = arith.addi %783, %__rlasp_stack_elide_zero_32 : i64
      %785 = llvm.mlir.addressof @str77 : !llvm.ptr
      %786 = arith.constant 23 : i64
      %787 = func.call @cc_make_string(%785, %786) : (!llvm.ptr, i64) -> i64
      %788 = func.call @cc_nil_value() : () -> i64
      %789 = func.call @cc_intern(%787, %788) : (i64, i64) -> i64
      %790 = func.call @cc_nil_value() : () -> i64
      %791 = func.call @cc_cons(%789, %790) : (i64, i64) -> i64
      %792 = func.call @cc_values_pack(%791) : (i64) -> i64
      %793 = func.call @cc_symbol_value(%789) : (i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %794 = arith.addi %793, %__rlasp_stack_elide_zero_33 : i64
      %795 = func.call @cc_reverse(%794) : (i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %796 = arith.addi %795, %__rlasp_stack_elide_zero_34 : i64
      %797 = llvm.mlir.addressof @str78 : !llvm.ptr
      %798 = arith.constant 23 : i64
      %799 = func.call @cc_make_string(%797, %798) : (!llvm.ptr, i64) -> i64
      %800 = func.call @cc_nil_value() : () -> i64
      %801 = func.call @cc_intern(%799, %800) : (i64, i64) -> i64
      %802 = func.call @cc_nil_value() : () -> i64
      %803 = func.call @cc_cons(%801, %802) : (i64, i64) -> i64
      %804 = func.call @cc_values_pack(%803) : (i64) -> i64
      %805 = func.call @cc_symbol_value(%801) : (i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %806 = arith.addi %805, %__rlasp_stack_elide_zero_35 : i64
      %807 = func.call @cc_length(%806) : (i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %808 = arith.addi %807, %__rlasp_stack_elide_zero_36 : i64
      func.call @stack_push_pointer(%754) : (i64) -> ()
      func.call @stack_push_pointer(%760) : (i64) -> ()
      func.call @stack_push_pointer(%772) : (i64) -> ()
      func.call @stack_push_pointer(%784) : (i64) -> ()
      func.call @stack_push_pointer(%796) : (i64) -> ()
      func.call @stack_push_pointer(%808) : (i64) -> ()
      %809 = llvm.mlir.addressof @str79 : !llvm.ptr
      %810 = func.call @cc_make_function_ref_const(%809) : (!llvm.ptr) -> i64
      %811 = arith.constant 6 : i64
      func.call @cc_funcall_stack(%810, %811) : (i64, i64) -> ()
      %812 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %812 : i64
    }
    %813 = func.call @cc_nil_value() : () -> i64
    %814 = func.call @cc_errorp(%747) : (i64) -> i64
    %815 = arith.cmpi ne, %814, %813 : i64
    %816 = scf.if %815 -> (i64) {
      scf.yield %747 : i64
    } else {
      %817 = llvm.mlir.addressof @str80 : !llvm.ptr
      %818 = arith.constant 25 : i64
      %819 = func.call @cc_make_string(%817, %818) : (!llvm.ptr, i64) -> i64
      %820 = func.call @cc_nil_value() : () -> i64
      %821 = func.call @cc_intern(%819, %820) : (i64, i64) -> i64
      %822 = func.call @cc_nil_value() : () -> i64
      %823 = func.call @cc_cons(%821, %822) : (i64, i64) -> i64
      %824 = func.call @cc_values_pack(%823) : (i64) -> i64
      %825 = func.call @cc_symbol_value(%821) : (i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %826 = arith.addi %825, %__rlasp_stack_elide_zero_37 : i64
      %827 = func.call @cc_nil_value() : () -> i64
      %828 = arith.cmpi ne, %826, %827 : i64
      scf.if %828 {
        %829 = func.call @cc_nil_value() : () -> i64
        %830 = func.call @cc_nil_value() : () -> i64
        %831 = func.call @cc_errorp(%829) : (i64) -> i64
        %832 = arith.cmpi ne, %831, %830 : i64
        %833 = scf.if %832 -> (i64) {
          scf.yield %829 : i64
        } else {
          %834 = llvm.mlir.addressof @str81 : !llvm.ptr
          %835 = arith.constant 25 : i64
          %836 = func.call @cc_make_string(%834, %835) : (!llvm.ptr, i64) -> i64
          %837 = func.call @cc_nil_value() : () -> i64
          %838 = func.call @cc_intern(%836, %837) : (i64, i64) -> i64
          %839 = func.call @cc_nil_value() : () -> i64
          %840 = func.call @cc_cons(%838, %839) : (i64, i64) -> i64
          %841 = func.call @cc_values_pack(%840) : (i64) -> i64
          %842 = func.call @cc_symbol_value(%838) : (i64) -> i64
          %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
          %843 = arith.addi %842, %__rlasp_stack_elide_zero_38 : i64
          %844:1 = scf.while (%arg0 = %843) : (i64) -> (i64) {
            %845 = func.call @cc_is_cons(%arg0) : (i64) -> i32
            %846 = arith.constant 0 : i32
            %847 = arith.cmpi ne, %845, %846 : i32
            scf.condition(%847) %arg0 : i64
          } do {
            ^bb0(%848: i64):
            %849 = func.call @cc_car(%848) : (i64) -> i64
            %850 = llvm.mlir.addressof @str82 : !llvm.ptr
            %851 = arith.constant 3 : i64
            %852 = func.call @cc_make_string(%850, %851) : (!llvm.ptr, i64) -> i64
            %853 = llvm.mlir.addressof @str83 : !llvm.ptr
            %854 = arith.constant 7 : i64
            %855 = func.call @cc_make_string(%853, %854) : (!llvm.ptr, i64) -> i64
            %856 = func.call @cc_intern(%852, %855) : (i64, i64) -> i64
            %857 = func.call @cc_nil_value() : () -> i64
            %858 = func.call @cc_cons(%856, %857) : (i64, i64) -> i64
            %859 = func.call @cc_values_pack(%858) : (i64) -> i64
            %860 = llvm.mlir.addressof @str84 : !llvm.ptr
            %861 = arith.constant 44 : i64
            %862 = func.call @cc_make_string(%860, %861) : (!llvm.ptr, i64) -> i64
            %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
            %863 = arith.addi %849, %__rlasp_stack_elide_zero_39 : i64
            %864 = func.call @cc_car(%863) : (i64) -> i64
            %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
            %865 = arith.addi %864, %__rlasp_stack_elide_zero_40 : i64
            %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
            %866 = arith.addi %849, %__rlasp_stack_elide_zero_41 : i64
            %867 = func.call @cc_cdr(%866) : (i64) -> i64
            %868 = func.call @cc_car(%867) : (i64) -> i64
            %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
            %869 = arith.addi %868, %__rlasp_stack_elide_zero_42 : i64
            func.call @stack_push_pointer(%856) : (i64) -> ()
            func.call @stack_push_pointer(%862) : (i64) -> ()
            func.call @stack_push_pointer(%865) : (i64) -> ()
            func.call @stack_push_pointer(%869) : (i64) -> ()
            %870 = llvm.mlir.addressof @str85 : !llvm.ptr
            %871 = func.call @cc_make_function_ref_const(%870) : (!llvm.ptr) -> i64
            %872 = arith.constant 4 : i64
            func.call @cc_funcall_stack(%871, %872) : (i64, i64) -> ()
            %873 = func.call @stack_depth() : () -> i64
            %874 = arith.constant 0 : i64
            %875 = arith.cmpi sgt, %873, %874 : i64
            scf.if %875 {
              %876 = func.call @stack_pop_pointer() : () -> i64
            }
            %877 = func.call @cc_cdr(%848) : (i64) -> i64
            scf.yield %877 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %878 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %878 : i64
        }
        func.call @stack_push_pointer(%833) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %879 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %879 : i64
    }
    %880 = func.call @cc_nil_value() : () -> i64
    %881 = func.call @cc_errorp(%816) : (i64) -> i64
    %882 = arith.cmpi ne, %881, %880 : i64
    %883 = scf.if %882 -> (i64) {
      scf.yield %816 : i64
    } else {
      %884 = llvm.mlir.addressof @str86 : !llvm.ptr
      %885 = arith.constant 17 : i64
      %886 = func.call @cc_make_string(%884, %885) : (!llvm.ptr, i64) -> i64
      %887 = func.call @cc_nil_value() : () -> i64
      %888 = func.call @cc_intern(%886, %887) : (i64, i64) -> i64
      %889 = func.call @cc_nil_value() : () -> i64
      %890 = func.call @cc_cons(%888, %889) : (i64, i64) -> i64
      %891 = func.call @cc_values_pack(%890) : (i64) -> i64
      %892 = func.call @cc_symbol_value(%888) : (i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %893 = arith.addi %892, %__rlasp_stack_elide_zero_43 : i64
      %894 = func.call @cc_nil_value() : () -> i64
      %895 = arith.cmpi ne, %893, %894 : i64
      scf.if %895 {
        %896 = func.call @cc_nil_value() : () -> i64
        %897 = func.call @cc_nil_value() : () -> i64
        %898 = func.call @cc_errorp(%896) : (i64) -> i64
        %899 = arith.cmpi ne, %898, %897 : i64
        %900 = scf.if %899 -> (i64) {
          scf.yield %896 : i64
        } else {
          %901 = llvm.mlir.addressof @str87 : !llvm.ptr
          %902 = arith.constant 17 : i64
          %903 = func.call @cc_make_string(%901, %902) : (!llvm.ptr, i64) -> i64
          %904 = func.call @cc_nil_value() : () -> i64
          %905 = func.call @cc_intern(%903, %904) : (i64, i64) -> i64
          %906 = func.call @cc_nil_value() : () -> i64
          %907 = func.call @cc_cons(%905, %906) : (i64, i64) -> i64
          %908 = func.call @cc_values_pack(%907) : (i64) -> i64
          %909 = func.call @cc_symbol_value(%905) : (i64) -> i64
          %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
          %910 = arith.addi %909, %__rlasp_stack_elide_zero_44 : i64
          %911:1 = scf.while (%arg0 = %910) : (i64) -> (i64) {
            %912 = func.call @cc_is_cons(%arg0) : (i64) -> i32
            %913 = arith.constant 0 : i32
            %914 = arith.cmpi ne, %912, %913 : i32
            scf.condition(%914) %arg0 : i64
          } do {
            ^bb0(%915: i64):
            %916 = func.call @cc_car(%915) : (i64) -> i64
            %917 = llvm.mlir.addressof @str88 : !llvm.ptr
            %918 = arith.constant 4 : i64
            %919 = func.call @cc_make_string(%917, %918) : (!llvm.ptr, i64) -> i64
            %920 = llvm.mlir.addressof @str89 : !llvm.ptr
            %921 = arith.constant 7 : i64
            %922 = func.call @cc_make_string(%920, %921) : (!llvm.ptr, i64) -> i64
            %923 = func.call @cc_intern(%919, %922) : (i64, i64) -> i64
            %924 = func.call @cc_nil_value() : () -> i64
            %925 = func.call @cc_cons(%923, %924) : (i64, i64) -> i64
            %926 = func.call @cc_values_pack(%925) : (i64) -> i64
            %927 = llvm.mlir.addressof @str90 : !llvm.ptr
            %928 = arith.constant 17 : i64
            %929 = func.call @cc_make_string(%927, %928) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%923) : (i64) -> ()
            func.call @stack_push_pointer(%929) : (i64) -> ()
            func.call @stack_push_pointer(%916) : (i64) -> ()
            %930 = llvm.mlir.addressof @str91 : !llvm.ptr
            %931 = func.call @cc_make_function_ref_const(%930) : (!llvm.ptr) -> i64
            %932 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%931, %932) : (i64, i64) -> ()
            %933 = func.call @stack_depth() : () -> i64
            %934 = arith.constant 0 : i64
            %935 = arith.cmpi sgt, %933, %934 : i64
            scf.if %935 {
              %936 = func.call @stack_pop_pointer() : () -> i64
            }
            %937 = func.call @cc_cdr(%915) : (i64) -> i64
            scf.yield %937 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %938 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %938 : i64
        }
        func.call @stack_push_pointer(%900) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %939 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %939 : i64
    }
    %940 = func.call @cc_nil_value() : () -> i64
    %941 = func.call @cc_errorp(%883) : (i64) -> i64
    %942 = arith.cmpi ne, %941, %940 : i64
    %943 = scf.if %942 -> (i64) {
      scf.yield %883 : i64
    } else {
      %944 = llvm.mlir.addressof @str92 : !llvm.ptr
      %945 = arith.constant 25 : i64
      %946 = func.call @cc_make_string(%944, %945) : (!llvm.ptr, i64) -> i64
      %947 = func.call @cc_nil_value() : () -> i64
      %948 = func.call @cc_intern(%946, %947) : (i64, i64) -> i64
      %949 = func.call @cc_nil_value() : () -> i64
      %950 = func.call @cc_cons(%948, %949) : (i64, i64) -> i64
      %951 = func.call @cc_values_pack(%950) : (i64) -> i64
      %952 = func.call @cc_symbol_value(%948) : (i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %953 = arith.addi %952, %__rlasp_stack_elide_zero_45 : i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_cons(%953, %954) : (i64, i64) -> i64
      %956 = func.call @cc_not(%955) : (i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %957 = arith.addi %956, %__rlasp_stack_elide_zero_46 : i64
      scf.yield %957 : i64
    }
    %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
    %958 = arith.addi %943, %__rlasp_stack_elide_zero_47 : i64
    %959 = func.call @cc_multiple_value_list(%958) : (i64) -> i64
    %960 = llvm.mlir.addressof @str93 : !llvm.ptr
    %961 = arith.constant 37 : i64
    %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
    %963 = func.call @cc_nil_value() : () -> i64
    %964 = func.call @cc_intern(%962, %963) : (i64, i64) -> i64
    %965 = func.call @cc_nil_value() : () -> i64
    %966 = func.call @cc_cons(%964, %965) : (i64, i64) -> i64
    %967 = func.call @cc_values_pack(%966) : (i64) -> i64
    %968 = func.call @cc_symbol_value(%964) : (i64) -> i64
    %969 = llvm.mlir.addressof @str94 : !llvm.ptr
    %970 = arith.constant 39 : i64
    %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
    %972 = func.call @cc_nil_value() : () -> i64
    %973 = func.call @cc_intern(%971, %972) : (i64, i64) -> i64
    %974 = func.call @cc_nil_value() : () -> i64
    %975 = func.call @cc_cons(%973, %974) : (i64, i64) -> i64
    %976 = func.call @cc_values_pack(%975) : (i64) -> i64
    %977 = func.call @cc_symbol_value(%973) : (i64) -> i64
    %978 = func.call @cc_nil_value() : () -> i64
    %979 = arith.cmpi ne, %968, %978 : i64
    %980 = scf.if %979 -> (i64) {
      scf.yield %977 : i64
    } else {
      scf.yield %959 : i64
    }
    %981 = func.call @cc_values_pack(%980) : (i64) -> i64
    func.call @stack_push_pointer(%981) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%fail-test-with-error"() {
    %982 = llvm.mlir.addressof @str95 : !llvm.ptr
    %983 = arith.constant 21 : i64
    %984 = func.call @cc_make_string(%982, %983) : (!llvm.ptr, i64) -> i64
    %985 = func.call @cc_nil_value() : () -> i64
    %986 = func.call @cc_intern(%984, %985) : (i64, i64) -> i64
    %987 = func.call @cc_nil_value() : () -> i64
    %988 = func.call @cc_cons(%986, %987) : (i64, i64) -> i64
    %989 = func.call @cc_values_pack(%988) : (i64) -> i64
    %990 = llvm.mlir.addressof @str96 : !llvm.ptr
    %991 = arith.constant 48 : i64
    %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
    %993 = func.call @cc_register_function_lambda_list_metadata_raw(%986, %992) : (i64, i64) -> i64
    %994 = func.call @stack_pop_pointer() : () -> i64
    %995 = func.call @stack_pop_pointer() : () -> i64
    %996 = func.call @stack_pop_pointer() : () -> i64
    %997 = func.call @stack_pop_pointer() : () -> i64
    %998 = func.call @stack_pop_pointer() : () -> i64
    %999 = func.call @cc_nil_value() : () -> i64
    %1000 = llvm.mlir.addressof @str97 : !llvm.ptr
    %1001 = arith.constant 37 : i64
    %1002 = func.call @cc_make_string(%1000, %1001) : (!llvm.ptr, i64) -> i64
    %1003 = func.call @cc_nil_value() : () -> i64
    %1004 = func.call @cc_intern(%1002, %1003) : (i64, i64) -> i64
    %1005 = func.call @cc_nil_value() : () -> i64
    %1006 = func.call @cc_cons(%1004, %1005) : (i64, i64) -> i64
    %1007 = func.call @cc_values_pack(%1006) : (i64) -> i64
    %1008 = func.call @cc_set_symbol_value(%1004, %999) : (i64, i64) -> i64
    %1009 = llvm.mlir.addressof @str98 : !llvm.ptr
    %1010 = arith.constant 38 : i64
    %1011 = func.call @cc_make_string(%1009, %1010) : (!llvm.ptr, i64) -> i64
    %1012 = func.call @cc_nil_value() : () -> i64
    %1013 = func.call @cc_intern(%1011, %1012) : (i64, i64) -> i64
    %1014 = func.call @cc_nil_value() : () -> i64
    %1015 = func.call @cc_cons(%1013, %1014) : (i64, i64) -> i64
    %1016 = func.call @cc_values_pack(%1015) : (i64) -> i64
    %1017 = func.call @cc_set_symbol_value(%1013, %999) : (i64, i64) -> i64
    %1018 = llvm.mlir.addressof @str99 : !llvm.ptr
    %1019 = arith.constant 39 : i64
    %1020 = func.call @cc_make_string(%1018, %1019) : (!llvm.ptr, i64) -> i64
    %1021 = func.call @cc_nil_value() : () -> i64
    %1022 = func.call @cc_intern(%1020, %1021) : (i64, i64) -> i64
    %1023 = func.call @cc_nil_value() : () -> i64
    %1024 = func.call @cc_cons(%1022, %1023) : (i64, i64) -> i64
    %1025 = func.call @cc_values_pack(%1024) : (i64) -> i64
    %1026 = func.call @cc_set_symbol_value(%1022, %999) : (i64, i64) -> i64
    %1027 = func.call @cc_nil_value() : () -> i64
    %1028 = func.call @cc_nil_value() : () -> i64
    %1029 = func.call @cc_errorp(%1027) : (i64) -> i64
    %1030 = arith.cmpi ne, %1029, %1028 : i64
    %1031 = scf.if %1030 -> (i64) {
      scf.yield %1027 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1032 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1032 : i64
    }
    %1033 = func.call @cc_nil_value() : () -> i64
    %1034 = func.call @cc_errorp(%1031) : (i64) -> i64
    %1035 = arith.cmpi ne, %1034, %1033 : i64
    %1036 = scf.if %1035 -> (i64) {
      scf.yield %1031 : i64
    } else {
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1037 = arith.addi %998, %__rlasp_stack_elide_zero_48 : i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1038 = arith.addi %995, %__rlasp_stack_elide_zero_49 : i64
      %1039 = func.call @cc_nil_value() : () -> i64
      %1040 = func.call @cc_errorp(%1037) : (i64) -> i64
      %1041 = arith.cmpi ne, %1040, %1039 : i64
      %1042 = arith.cmpi eq, %1039, %1039 : i64
      %1043 = arith.andi %1041, %1042 : i1
      %1044 = scf.if %1043 -> (i64) {
        scf.yield %1037 : i64
      } else {
        scf.yield %1039 : i64
      }
      %1045 = func.call @cc_errorp(%1038) : (i64) -> i64
      %1046 = arith.cmpi ne, %1045, %1039 : i64
      %1047 = arith.cmpi eq, %1044, %1039 : i64
      %1048 = arith.andi %1046, %1047 : i1
      %1049 = scf.if %1048 -> (i64) {
        scf.yield %1038 : i64
      } else {
        scf.yield %1044 : i64
      }
      %1050 = arith.cmpi ne, %1049, %1039 : i64
      scf.if %1050 {
        func.call @stack_push_pointer(%1049) : (i64) -> ()
      } else {
        %1051 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1051) : (i64) -> ()
        %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
        %1052 = arith.addi %1038, %__rlasp_stack_elide_zero_50 : i64
        %1053 = func.call @stack_pop_pointer() : () -> i64
        %1054 = func.call @cc_cons(%1052, %1053) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1054) : (i64) -> ()
        %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
        %1055 = arith.addi %1037, %__rlasp_stack_elide_zero_51 : i64
        %1056 = func.call @stack_pop_pointer() : () -> i64
        %1057 = func.call @cc_cons(%1055, %1056) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1057) : (i64) -> ()
      }
      %1058 = func.call @stack_pop_pointer() : () -> i64
      %1059 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1060 = arith.constant 20 : i64
      %1061 = func.call @cc_make_string(%1059, %1060) : (!llvm.ptr, i64) -> i64
      %1062 = func.call @cc_nil_value() : () -> i64
      %1063 = func.call @cc_intern(%1061, %1062) : (i64, i64) -> i64
      %1064 = func.call @cc_nil_value() : () -> i64
      %1065 = func.call @cc_cons(%1063, %1064) : (i64, i64) -> i64
      %1066 = func.call @cc_values_pack(%1065) : (i64) -> i64
      %1067 = func.call @cc_symbol_value(%1063) : (i64) -> i64
      %1068 = func.call @cc_cons(%1058, %1067) : (i64, i64) -> i64
      %1069 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1070 = arith.constant 20 : i64
      %1071 = func.call @cc_make_string(%1069, %1070) : (!llvm.ptr, i64) -> i64
      %1072 = func.call @cc_nil_value() : () -> i64
      %1073 = func.call @cc_intern(%1071, %1072) : (i64, i64) -> i64
      %1074 = func.call @cc_nil_value() : () -> i64
      %1075 = func.call @cc_cons(%1073, %1074) : (i64, i64) -> i64
      %1076 = func.call @cc_values_pack(%1075) : (i64) -> i64
      %1077 = func.call @cc_set_symbol_value(%1073, %1068) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1078 = arith.addi %1068, %__rlasp_stack_elide_zero_52 : i64
      scf.yield %1078 : i64
    }
    %1079 = func.call @cc_nil_value() : () -> i64
    %1080 = func.call @cc_errorp(%1036) : (i64) -> i64
    %1081 = arith.cmpi ne, %1080, %1079 : i64
    %1082 = scf.if %1081 -> (i64) {
      scf.yield %1036 : i64
    } else {
      func.call @stack_push_pointer(%998) : (i64) -> ()
      %1083 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1084 = arith.constant 19 : i64
      %1085 = func.call @cc_make_string(%1083, %1084) : (!llvm.ptr, i64) -> i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = func.call @cc_intern(%1085, %1086) : (i64, i64) -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_cons(%1087, %1088) : (i64, i64) -> i64
      %1090 = func.call @cc_values_pack(%1089) : (i64) -> i64
      %1091 = func.call @cc_symbol_value(%1087) : (i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1092 = arith.addi %1091, %__rlasp_stack_elide_zero_53 : i64
      %1093 = func.call @stack_pop_pointer() : () -> i64
      %1094 = func.call @cc_member(%1093, %1092) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1095 = arith.addi %1094, %__rlasp_stack_elide_zero_54 : i64
      %1096 = func.call @cc_nil_value() : () -> i64
      %1097 = arith.cmpi ne, %1095, %1096 : i64
      scf.if %1097 {
        %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
        %1098 = arith.addi %998, %__rlasp_stack_elide_zero_55 : i64
        %1099 = llvm.mlir.addressof @str103 : !llvm.ptr
        %1100 = arith.constant 23 : i64
        %1101 = func.call @cc_make_string(%1099, %1100) : (!llvm.ptr, i64) -> i64
        %1102 = func.call @cc_nil_value() : () -> i64
        %1103 = func.call @cc_intern(%1101, %1102) : (i64, i64) -> i64
        %1104 = func.call @cc_nil_value() : () -> i64
        %1105 = func.call @cc_cons(%1103, %1104) : (i64, i64) -> i64
        %1106 = func.call @cc_values_pack(%1105) : (i64) -> i64
        %1107 = func.call @cc_symbol_value(%1103) : (i64) -> i64
        %1108 = func.call @cc_cons(%1098, %1107) : (i64, i64) -> i64
        %1109 = llvm.mlir.addressof @str104 : !llvm.ptr
        %1110 = arith.constant 23 : i64
        %1111 = func.call @cc_make_string(%1109, %1110) : (!llvm.ptr, i64) -> i64
        %1112 = func.call @cc_nil_value() : () -> i64
        %1113 = func.call @cc_intern(%1111, %1112) : (i64, i64) -> i64
        %1114 = func.call @cc_nil_value() : () -> i64
        %1115 = func.call @cc_cons(%1113, %1114) : (i64, i64) -> i64
        %1116 = func.call @cc_values_pack(%1115) : (i64) -> i64
        %1117 = func.call @cc_set_symbol_value(%1113, %1108) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1108) : (i64) -> ()
      } else {
        %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
        %1118 = arith.addi %998, %__rlasp_stack_elide_zero_56 : i64
        %1119 = llvm.mlir.addressof @str105 : !llvm.ptr
        %1120 = arith.constant 25 : i64
        %1121 = func.call @cc_make_string(%1119, %1120) : (!llvm.ptr, i64) -> i64
        %1122 = func.call @cc_nil_value() : () -> i64
        %1123 = func.call @cc_intern(%1121, %1122) : (i64, i64) -> i64
        %1124 = func.call @cc_nil_value() : () -> i64
        %1125 = func.call @cc_cons(%1123, %1124) : (i64, i64) -> i64
        %1126 = func.call @cc_values_pack(%1125) : (i64) -> i64
        %1127 = func.call @cc_symbol_value(%1123) : (i64) -> i64
        %1128 = func.call @cc_cons(%1118, %1127) : (i64, i64) -> i64
        %1129 = llvm.mlir.addressof @str106 : !llvm.ptr
        %1130 = arith.constant 25 : i64
        %1131 = func.call @cc_make_string(%1129, %1130) : (!llvm.ptr, i64) -> i64
        %1132 = func.call @cc_nil_value() : () -> i64
        %1133 = func.call @cc_intern(%1131, %1132) : (i64, i64) -> i64
        %1134 = func.call @cc_nil_value() : () -> i64
        %1135 = func.call @cc_cons(%1133, %1134) : (i64, i64) -> i64
        %1136 = func.call @cc_values_pack(%1135) : (i64) -> i64
        %1137 = func.call @cc_set_symbol_value(%1133, %1128) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1128) : (i64) -> ()
      }
      %1138 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1138 : i64
    }
    %1139 = func.call @cc_nil_value() : () -> i64
    %1140 = func.call @cc_errorp(%1082) : (i64) -> i64
    %1141 = arith.cmpi ne, %1140, %1139 : i64
    %1142 = scf.if %1141 -> (i64) {
      scf.yield %1082 : i64
    } else {
      %1143 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1144 = arith.constant 3 : i64
      %1145 = func.call @cc_make_string(%1143, %1144) : (!llvm.ptr, i64) -> i64
      %1146 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1147 = arith.constant 7 : i64
      %1148 = func.call @cc_make_string(%1146, %1147) : (!llvm.ptr, i64) -> i64
      %1149 = func.call @cc_intern(%1145, %1148) : (i64, i64) -> i64
      %1150 = func.call @cc_nil_value() : () -> i64
      %1151 = func.call @cc_cons(%1149, %1150) : (i64, i64) -> i64
      %1152 = func.call @cc_values_pack(%1151) : (i64) -> i64
      %1153 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1154 = arith.constant 9 : i64
      %1155 = func.call @cc_make_string(%1153, %1154) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1149) : (i64) -> ()
      func.call @stack_push_pointer(%1155) : (i64) -> ()
      func.call @stack_push_pointer(%998) : (i64) -> ()
      %1156 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1157 = func.call @cc_make_function_ref_const(%1156) : (!llvm.ptr) -> i64
      %1158 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1157, %1158) : (i64, i64) -> ()
      %1159 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1159 : i64
    }
    %1160 = func.call @cc_nil_value() : () -> i64
    %1161 = func.call @cc_errorp(%1142) : (i64) -> i64
    %1162 = arith.cmpi ne, %1161, %1160 : i64
    %1163 = scf.if %1162 -> (i64) {
      scf.yield %1142 : i64
    } else {
      %1164 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1165 = arith.constant 4 : i64
      %1166 = func.call @cc_make_string(%1164, %1165) : (!llvm.ptr, i64) -> i64
      %1167 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1168 = arith.constant 7 : i64
      %1169 = func.call @cc_make_string(%1167, %1168) : (!llvm.ptr, i64) -> i64
      %1170 = func.call @cc_intern(%1166, %1169) : (i64, i64) -> i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_cons(%1170, %1171) : (i64, i64) -> i64
      %1173 = func.call @cc_values_pack(%1172) : (i64) -> i64
      %1174 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1175 = arith.constant 46 : i64
      %1176 = func.call @cc_make_string(%1174, %1175) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1170) : (i64) -> ()
      func.call @stack_push_pointer(%1176) : (i64) -> ()
      func.call @stack_push_pointer(%995) : (i64) -> ()
      func.call @stack_push_pointer(%997) : (i64) -> ()
      %1177 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1178 = func.call @cc_make_function_ref_const(%1177) : (!llvm.ptr) -> i64
      %1179 = arith.constant 4 : i64
      func.call @cc_funcall_stack(%1178, %1179) : (i64, i64) -> ()
      %1180 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1180 : i64
    }
    %1181 = func.call @cc_nil_value() : () -> i64
    %1182 = func.call @cc_errorp(%1163) : (i64) -> i64
    %1183 = arith.cmpi ne, %1182, %1181 : i64
    %1184 = scf.if %1183 -> (i64) {
      scf.yield %1163 : i64
    } else {
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1185 = arith.addi %994, %__rlasp_stack_elide_zero_57 : i64
      %1186 = func.call @cc_nil_value() : () -> i64
      %1187 = arith.cmpi ne, %1185, %1186 : i64
      scf.if %1187 {
        %1188 = func.call @cc_nil_value() : () -> i64
        %1189 = func.call @cc_nil_value() : () -> i64
        %1190 = func.call @cc_errorp(%1188) : (i64) -> i64
        %1191 = arith.cmpi ne, %1190, %1189 : i64
        %1192 = scf.if %1191 -> (i64) {
          scf.yield %1188 : i64
        } else {
          %1193 = llvm.mlir.addressof @str115 : !llvm.ptr
          %1194 = arith.constant 4 : i64
          %1195 = func.call @cc_make_string(%1193, %1194) : (!llvm.ptr, i64) -> i64
          %1196 = llvm.mlir.addressof @str116 : !llvm.ptr
          %1197 = arith.constant 7 : i64
          %1198 = func.call @cc_make_string(%1196, %1197) : (!llvm.ptr, i64) -> i64
          %1199 = func.call @cc_intern(%1195, %1198) : (i64, i64) -> i64
          %1200 = func.call @cc_nil_value() : () -> i64
          %1201 = func.call @cc_cons(%1199, %1200) : (i64, i64) -> i64
          %1202 = func.call @cc_values_pack(%1201) : (i64) -> i64
          %1203 = llvm.mlir.addressof @str117 : !llvm.ptr
          %1204 = arith.constant 2 : i64
          %1205 = func.call @cc_make_string(%1203, %1204) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%1199) : (i64) -> ()
          func.call @stack_push_pointer(%1205) : (i64) -> ()
          func.call @stack_push_pointer(%994) : (i64) -> ()
          %1206 = llvm.mlir.addressof @str118 : !llvm.ptr
          %1207 = func.call @cc_make_function_ref_const(%1206) : (!llvm.ptr) -> i64
          %1208 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1207, %1208) : (i64, i64) -> ()
          %1209 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1209 : i64
        }
        func.call @stack_push_pointer(%1192) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1210 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1210 : i64
    }
    %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
    %1211 = arith.addi %1184, %__rlasp_stack_elide_zero_58 : i64
    %1212 = func.call @cc_multiple_value_list(%1211) : (i64) -> i64
    %1213 = llvm.mlir.addressof @str119 : !llvm.ptr
    %1214 = arith.constant 37 : i64
    %1215 = func.call @cc_make_string(%1213, %1214) : (!llvm.ptr, i64) -> i64
    %1216 = func.call @cc_nil_value() : () -> i64
    %1217 = func.call @cc_intern(%1215, %1216) : (i64, i64) -> i64
    %1218 = func.call @cc_nil_value() : () -> i64
    %1219 = func.call @cc_cons(%1217, %1218) : (i64, i64) -> i64
    %1220 = func.call @cc_values_pack(%1219) : (i64) -> i64
    %1221 = func.call @cc_symbol_value(%1217) : (i64) -> i64
    %1222 = llvm.mlir.addressof @str120 : !llvm.ptr
    %1223 = arith.constant 39 : i64
    %1224 = func.call @cc_make_string(%1222, %1223) : (!llvm.ptr, i64) -> i64
    %1225 = func.call @cc_nil_value() : () -> i64
    %1226 = func.call @cc_intern(%1224, %1225) : (i64, i64) -> i64
    %1227 = func.call @cc_nil_value() : () -> i64
    %1228 = func.call @cc_cons(%1226, %1227) : (i64, i64) -> i64
    %1229 = func.call @cc_values_pack(%1228) : (i64) -> i64
    %1230 = func.call @cc_symbol_value(%1226) : (i64) -> i64
    %1231 = func.call @cc_nil_value() : () -> i64
    %1232 = arith.cmpi ne, %1221, %1231 : i64
    %1233 = scf.if %1232 -> (i64) {
      scf.yield %1230 : i64
    } else {
      scf.yield %1212 : i64
    }
    %1234 = func.call @cc_values_pack(%1233) : (i64) -> i64
    func.call @stack_push_pointer(%1234) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%fail-test"() {
    %1235 = llvm.mlir.addressof @str121 : !llvm.ptr
    %1236 = arith.constant 10 : i64
    %1237 = func.call @cc_make_string(%1235, %1236) : (!llvm.ptr, i64) -> i64
    %1238 = func.call @cc_nil_value() : () -> i64
    %1239 = func.call @cc_intern(%1237, %1238) : (i64, i64) -> i64
    %1240 = func.call @cc_nil_value() : () -> i64
    %1241 = func.call @cc_cons(%1239, %1240) : (i64, i64) -> i64
    %1242 = func.call @cc_values_pack(%1241) : (i64) -> i64
    %1243 = llvm.mlir.addressof @str122 : !llvm.ptr
    %1244 = arith.constant 42 : i64
    %1245 = func.call @cc_make_string(%1243, %1244) : (!llvm.ptr, i64) -> i64
    %1246 = func.call @cc_register_function_lambda_list_metadata_raw(%1239, %1245) : (i64, i64) -> i64
    %1247 = func.call @stack_pop_pointer() : () -> i64
    %1248 = func.call @stack_pop_pointer() : () -> i64
    %1249 = func.call @stack_pop_pointer() : () -> i64
    %1250 = func.call @stack_pop_pointer() : () -> i64
    %1251 = func.call @stack_pop_pointer() : () -> i64
    %1252 = func.call @stack_pop_pointer() : () -> i64
    %1253 = func.call @cc_nil_value() : () -> i64
    %1254 = llvm.mlir.addressof @str123 : !llvm.ptr
    %1255 = arith.constant 37 : i64
    %1256 = func.call @cc_make_string(%1254, %1255) : (!llvm.ptr, i64) -> i64
    %1257 = func.call @cc_nil_value() : () -> i64
    %1258 = func.call @cc_intern(%1256, %1257) : (i64, i64) -> i64
    %1259 = func.call @cc_nil_value() : () -> i64
    %1260 = func.call @cc_cons(%1258, %1259) : (i64, i64) -> i64
    %1261 = func.call @cc_values_pack(%1260) : (i64) -> i64
    %1262 = func.call @cc_set_symbol_value(%1258, %1253) : (i64, i64) -> i64
    %1263 = llvm.mlir.addressof @str124 : !llvm.ptr
    %1264 = arith.constant 38 : i64
    %1265 = func.call @cc_make_string(%1263, %1264) : (!llvm.ptr, i64) -> i64
    %1266 = func.call @cc_nil_value() : () -> i64
    %1267 = func.call @cc_intern(%1265, %1266) : (i64, i64) -> i64
    %1268 = func.call @cc_nil_value() : () -> i64
    %1269 = func.call @cc_cons(%1267, %1268) : (i64, i64) -> i64
    %1270 = func.call @cc_values_pack(%1269) : (i64) -> i64
    %1271 = func.call @cc_set_symbol_value(%1267, %1253) : (i64, i64) -> i64
    %1272 = llvm.mlir.addressof @str125 : !llvm.ptr
    %1273 = arith.constant 39 : i64
    %1274 = func.call @cc_make_string(%1272, %1273) : (!llvm.ptr, i64) -> i64
    %1275 = func.call @cc_nil_value() : () -> i64
    %1276 = func.call @cc_intern(%1274, %1275) : (i64, i64) -> i64
    %1277 = func.call @cc_nil_value() : () -> i64
    %1278 = func.call @cc_cons(%1276, %1277) : (i64, i64) -> i64
    %1279 = func.call @cc_values_pack(%1278) : (i64) -> i64
    %1280 = func.call @cc_set_symbol_value(%1276, %1253) : (i64, i64) -> i64
    %1281 = func.call @cc_nil_value() : () -> i64
    %1282 = func.call @cc_nil_value() : () -> i64
    %1283 = func.call @cc_errorp(%1281) : (i64) -> i64
    %1284 = arith.cmpi ne, %1283, %1282 : i64
    %1285 = scf.if %1284 -> (i64) {
      scf.yield %1281 : i64
    } else {
      func.call @stack_push_pointer(%1252) : (i64) -> ()
      %1286 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1287 = arith.constant 19 : i64
      %1288 = func.call @cc_make_string(%1286, %1287) : (!llvm.ptr, i64) -> i64
      %1289 = func.call @cc_nil_value() : () -> i64
      %1290 = func.call @cc_intern(%1288, %1289) : (i64, i64) -> i64
      %1291 = func.call @cc_nil_value() : () -> i64
      %1292 = func.call @cc_cons(%1290, %1291) : (i64, i64) -> i64
      %1293 = func.call @cc_values_pack(%1292) : (i64) -> i64
      %1294 = func.call @cc_symbol_value(%1290) : (i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1295 = arith.addi %1294, %__rlasp_stack_elide_zero_59 : i64
      %1296 = func.call @stack_pop_pointer() : () -> i64
      %1297 = func.call @cc_member(%1296, %1295) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1298 = arith.addi %1297, %__rlasp_stack_elide_zero_60 : i64
      %1299 = func.call @cc_nil_value() : () -> i64
      %1300 = arith.cmpi ne, %1298, %1299 : i64
      scf.if %1300 {
        %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
        %1301 = arith.addi %1252, %__rlasp_stack_elide_zero_61 : i64
        %1302 = llvm.mlir.addressof @str127 : !llvm.ptr
        %1303 = arith.constant 23 : i64
        %1304 = func.call @cc_make_string(%1302, %1303) : (!llvm.ptr, i64) -> i64
        %1305 = func.call @cc_nil_value() : () -> i64
        %1306 = func.call @cc_intern(%1304, %1305) : (i64, i64) -> i64
        %1307 = func.call @cc_nil_value() : () -> i64
        %1308 = func.call @cc_cons(%1306, %1307) : (i64, i64) -> i64
        %1309 = func.call @cc_values_pack(%1308) : (i64) -> i64
        %1310 = func.call @cc_symbol_value(%1306) : (i64) -> i64
        %1311 = func.call @cc_cons(%1301, %1310) : (i64, i64) -> i64
        %1312 = llvm.mlir.addressof @str128 : !llvm.ptr
        %1313 = arith.constant 23 : i64
        %1314 = func.call @cc_make_string(%1312, %1313) : (!llvm.ptr, i64) -> i64
        %1315 = func.call @cc_nil_value() : () -> i64
        %1316 = func.call @cc_intern(%1314, %1315) : (i64, i64) -> i64
        %1317 = func.call @cc_nil_value() : () -> i64
        %1318 = func.call @cc_cons(%1316, %1317) : (i64, i64) -> i64
        %1319 = func.call @cc_values_pack(%1318) : (i64) -> i64
        %1320 = func.call @cc_set_symbol_value(%1316, %1311) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1311) : (i64) -> ()
      } else {
        %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
        %1321 = arith.addi %1252, %__rlasp_stack_elide_zero_62 : i64
        %1322 = llvm.mlir.addressof @str129 : !llvm.ptr
        %1323 = arith.constant 25 : i64
        %1324 = func.call @cc_make_string(%1322, %1323) : (!llvm.ptr, i64) -> i64
        %1325 = func.call @cc_nil_value() : () -> i64
        %1326 = func.call @cc_intern(%1324, %1325) : (i64, i64) -> i64
        %1327 = func.call @cc_nil_value() : () -> i64
        %1328 = func.call @cc_cons(%1326, %1327) : (i64, i64) -> i64
        %1329 = func.call @cc_values_pack(%1328) : (i64) -> i64
        %1330 = func.call @cc_symbol_value(%1326) : (i64) -> i64
        %1331 = func.call @cc_cons(%1321, %1330) : (i64, i64) -> i64
        %1332 = llvm.mlir.addressof @str130 : !llvm.ptr
        %1333 = arith.constant 25 : i64
        %1334 = func.call @cc_make_string(%1332, %1333) : (!llvm.ptr, i64) -> i64
        %1335 = func.call @cc_nil_value() : () -> i64
        %1336 = func.call @cc_intern(%1334, %1335) : (i64, i64) -> i64
        %1337 = func.call @cc_nil_value() : () -> i64
        %1338 = func.call @cc_cons(%1336, %1337) : (i64, i64) -> i64
        %1339 = func.call @cc_values_pack(%1338) : (i64) -> i64
        %1340 = func.call @cc_set_symbol_value(%1336, %1331) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1331) : (i64) -> ()
      }
      %1341 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1341 : i64
    }
    %1342 = func.call @cc_nil_value() : () -> i64
    %1343 = func.call @cc_errorp(%1285) : (i64) -> i64
    %1344 = arith.cmpi ne, %1343, %1342 : i64
    %1345 = scf.if %1344 -> (i64) {
      scf.yield %1285 : i64
    } else {
      %1346 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1347 = arith.constant 3 : i64
      %1348 = func.call @cc_make_string(%1346, %1347) : (!llvm.ptr, i64) -> i64
      %1349 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1350 = arith.constant 7 : i64
      %1351 = func.call @cc_make_string(%1349, %1350) : (!llvm.ptr, i64) -> i64
      %1352 = func.call @cc_intern(%1348, %1351) : (i64, i64) -> i64
      %1353 = func.call @cc_nil_value() : () -> i64
      %1354 = func.call @cc_cons(%1352, %1353) : (i64, i64) -> i64
      %1355 = func.call @cc_values_pack(%1354) : (i64) -> i64
      %1356 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1357 = arith.constant 9 : i64
      %1358 = func.call @cc_make_string(%1356, %1357) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1352) : (i64) -> ()
      func.call @stack_push_pointer(%1358) : (i64) -> ()
      func.call @stack_push_pointer(%1252) : (i64) -> ()
      %1359 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1360 = func.call @cc_make_function_ref_const(%1359) : (!llvm.ptr) -> i64
      %1361 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1360, %1361) : (i64, i64) -> ()
      %1362 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1362 : i64
    }
    %1363 = func.call @cc_nil_value() : () -> i64
    %1364 = func.call @cc_errorp(%1345) : (i64) -> i64
    %1365 = arith.cmpi ne, %1364, %1363 : i64
    %1366 = scf.if %1365 -> (i64) {
      scf.yield %1345 : i64
    } else {
      %1367 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1368 = arith.constant 4 : i64
      %1369 = func.call @cc_make_string(%1367, %1368) : (!llvm.ptr, i64) -> i64
      %1370 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1371 = arith.constant 7 : i64
      %1372 = func.call @cc_make_string(%1370, %1371) : (!llvm.ptr, i64) -> i64
      %1373 = func.call @cc_intern(%1369, %1372) : (i64, i64) -> i64
      %1374 = func.call @cc_nil_value() : () -> i64
      %1375 = func.call @cc_cons(%1373, %1374) : (i64, i64) -> i64
      %1376 = func.call @cc_values_pack(%1375) : (i64) -> i64
      %1377 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1378 = arith.constant 50 : i64
      %1379 = func.call @cc_make_string(%1377, %1378) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1373) : (i64) -> ()
      func.call @stack_push_pointer(%1379) : (i64) -> ()
      func.call @stack_push_pointer(%1247) : (i64) -> ()
      func.call @stack_push_pointer(%1250) : (i64) -> ()
      func.call @stack_push_pointer(%1249) : (i64) -> ()
      %1380 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1381 = func.call @cc_make_function_ref_const(%1380) : (!llvm.ptr) -> i64
      %1382 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%1381, %1382) : (i64, i64) -> ()
      %1383 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1383 : i64
    }
    %1384 = func.call @cc_nil_value() : () -> i64
    %1385 = func.call @cc_errorp(%1366) : (i64) -> i64
    %1386 = arith.cmpi ne, %1385, %1384 : i64
    %1387 = scf.if %1386 -> (i64) {
      scf.yield %1366 : i64
    } else {
      %1388 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1389 = arith.constant 4 : i64
      %1390 = func.call @cc_make_string(%1388, %1389) : (!llvm.ptr, i64) -> i64
      %1391 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1392 = arith.constant 7 : i64
      %1393 = func.call @cc_make_string(%1391, %1392) : (!llvm.ptr, i64) -> i64
      %1394 = func.call @cc_intern(%1390, %1393) : (i64, i64) -> i64
      %1395 = func.call @cc_nil_value() : () -> i64
      %1396 = func.call @cc_cons(%1394, %1395) : (i64, i64) -> i64
      %1397 = func.call @cc_values_pack(%1396) : (i64) -> i64
      %1398 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1399 = arith.constant 24 : i64
      %1400 = func.call @cc_make_string(%1398, %1399) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1394) : (i64) -> ()
      func.call @stack_push_pointer(%1400) : (i64) -> ()
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      %1401 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1402 = func.call @cc_make_function_ref_const(%1401) : (!llvm.ptr) -> i64
      %1403 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1402, %1403) : (i64, i64) -> ()
      %1404 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1404 : i64
    }
    %1405 = func.call @cc_nil_value() : () -> i64
    %1406 = func.call @cc_errorp(%1387) : (i64) -> i64
    %1407 = arith.cmpi ne, %1406, %1405 : i64
    %1408 = scf.if %1407 -> (i64) {
      scf.yield %1387 : i64
    } else {
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1409 = arith.addi %1248, %__rlasp_stack_elide_zero_63 : i64
      %1410 = func.call @cc_nil_value() : () -> i64
      %1411 = arith.cmpi ne, %1409, %1410 : i64
      scf.if %1411 {
        %1412 = func.call @cc_nil_value() : () -> i64
        %1413 = func.call @cc_nil_value() : () -> i64
        %1414 = func.call @cc_errorp(%1412) : (i64) -> i64
        %1415 = arith.cmpi ne, %1414, %1413 : i64
        %1416 = scf.if %1415 -> (i64) {
          scf.yield %1412 : i64
        } else {
          %1417 = llvm.mlir.addressof @str143 : !llvm.ptr
          %1418 = arith.constant 4 : i64
          %1419 = func.call @cc_make_string(%1417, %1418) : (!llvm.ptr, i64) -> i64
          %1420 = llvm.mlir.addressof @str144 : !llvm.ptr
          %1421 = arith.constant 7 : i64
          %1422 = func.call @cc_make_string(%1420, %1421) : (!llvm.ptr, i64) -> i64
          %1423 = func.call @cc_intern(%1419, %1422) : (i64, i64) -> i64
          %1424 = func.call @cc_nil_value() : () -> i64
          %1425 = func.call @cc_cons(%1423, %1424) : (i64, i64) -> i64
          %1426 = func.call @cc_values_pack(%1425) : (i64) -> i64
          %1427 = llvm.mlir.addressof @str145 : !llvm.ptr
          %1428 = arith.constant 2 : i64
          %1429 = func.call @cc_make_string(%1427, %1428) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%1423) : (i64) -> ()
          func.call @stack_push_pointer(%1429) : (i64) -> ()
          func.call @stack_push_pointer(%1248) : (i64) -> ()
          %1430 = llvm.mlir.addressof @str146 : !llvm.ptr
          %1431 = func.call @cc_make_function_ref_const(%1430) : (!llvm.ptr) -> i64
          %1432 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1431, %1432) : (i64, i64) -> ()
          %1433 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1433 : i64
        }
        func.call @stack_push_pointer(%1416) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %1434 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1434 : i64
    }
    %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
    %1435 = arith.addi %1408, %__rlasp_stack_elide_zero_64 : i64
    %1436 = func.call @cc_multiple_value_list(%1435) : (i64) -> i64
    %1437 = llvm.mlir.addressof @str147 : !llvm.ptr
    %1438 = arith.constant 37 : i64
    %1439 = func.call @cc_make_string(%1437, %1438) : (!llvm.ptr, i64) -> i64
    %1440 = func.call @cc_nil_value() : () -> i64
    %1441 = func.call @cc_intern(%1439, %1440) : (i64, i64) -> i64
    %1442 = func.call @cc_nil_value() : () -> i64
    %1443 = func.call @cc_cons(%1441, %1442) : (i64, i64) -> i64
    %1444 = func.call @cc_values_pack(%1443) : (i64) -> i64
    %1445 = func.call @cc_symbol_value(%1441) : (i64) -> i64
    %1446 = llvm.mlir.addressof @str148 : !llvm.ptr
    %1447 = arith.constant 39 : i64
    %1448 = func.call @cc_make_string(%1446, %1447) : (!llvm.ptr, i64) -> i64
    %1449 = func.call @cc_nil_value() : () -> i64
    %1450 = func.call @cc_intern(%1448, %1449) : (i64, i64) -> i64
    %1451 = func.call @cc_nil_value() : () -> i64
    %1452 = func.call @cc_cons(%1450, %1451) : (i64, i64) -> i64
    %1453 = func.call @cc_values_pack(%1452) : (i64) -> i64
    %1454 = func.call @cc_symbol_value(%1450) : (i64) -> i64
    %1455 = func.call @cc_nil_value() : () -> i64
    %1456 = arith.cmpi ne, %1445, %1455 : i64
    %1457 = scf.if %1456 -> (i64) {
      scf.yield %1454 : i64
    } else {
      scf.yield %1436 : i64
    }
    %1458 = func.call @cc_values_pack(%1457) : (i64) -> i64
    func.call @stack_push_pointer(%1458) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%succeed-test"() {
    %1459 = llvm.mlir.addressof @str149 : !llvm.ptr
    %1460 = arith.constant 13 : i64
    %1461 = func.call @cc_make_string(%1459, %1460) : (!llvm.ptr, i64) -> i64
    %1462 = func.call @cc_nil_value() : () -> i64
    %1463 = func.call @cc_intern(%1461, %1462) : (i64, i64) -> i64
    %1464 = func.call @cc_nil_value() : () -> i64
    %1465 = func.call @cc_cons(%1463, %1464) : (i64, i64) -> i64
    %1466 = func.call @cc_values_pack(%1465) : (i64) -> i64
    %1467 = llvm.mlir.addressof @str150 : !llvm.ptr
    %1468 = arith.constant 4 : i64
    %1469 = func.call @cc_make_string(%1467, %1468) : (!llvm.ptr, i64) -> i64
    %1470 = func.call @cc_register_function_lambda_list_metadata_raw(%1463, %1469) : (i64, i64) -> i64
    %1471 = func.call @stack_pop_pointer() : () -> i64
    %1472 = func.call @cc_nil_value() : () -> i64
    %1473 = llvm.mlir.addressof @str151 : !llvm.ptr
    %1474 = arith.constant 37 : i64
    %1475 = func.call @cc_make_string(%1473, %1474) : (!llvm.ptr, i64) -> i64
    %1476 = func.call @cc_nil_value() : () -> i64
    %1477 = func.call @cc_intern(%1475, %1476) : (i64, i64) -> i64
    %1478 = func.call @cc_nil_value() : () -> i64
    %1479 = func.call @cc_cons(%1477, %1478) : (i64, i64) -> i64
    %1480 = func.call @cc_values_pack(%1479) : (i64) -> i64
    %1481 = func.call @cc_set_symbol_value(%1477, %1472) : (i64, i64) -> i64
    %1482 = llvm.mlir.addressof @str152 : !llvm.ptr
    %1483 = arith.constant 38 : i64
    %1484 = func.call @cc_make_string(%1482, %1483) : (!llvm.ptr, i64) -> i64
    %1485 = func.call @cc_nil_value() : () -> i64
    %1486 = func.call @cc_intern(%1484, %1485) : (i64, i64) -> i64
    %1487 = func.call @cc_nil_value() : () -> i64
    %1488 = func.call @cc_cons(%1486, %1487) : (i64, i64) -> i64
    %1489 = func.call @cc_values_pack(%1488) : (i64) -> i64
    %1490 = func.call @cc_set_symbol_value(%1486, %1472) : (i64, i64) -> i64
    %1491 = llvm.mlir.addressof @str153 : !llvm.ptr
    %1492 = arith.constant 39 : i64
    %1493 = func.call @cc_make_string(%1491, %1492) : (!llvm.ptr, i64) -> i64
    %1494 = func.call @cc_nil_value() : () -> i64
    %1495 = func.call @cc_intern(%1493, %1494) : (i64, i64) -> i64
    %1496 = func.call @cc_nil_value() : () -> i64
    %1497 = func.call @cc_cons(%1495, %1496) : (i64, i64) -> i64
    %1498 = func.call @cc_values_pack(%1497) : (i64) -> i64
    %1499 = func.call @cc_set_symbol_value(%1495, %1472) : (i64, i64) -> i64
    %1500 = func.call @cc_nil_value() : () -> i64
    %1501 = func.call @cc_nil_value() : () -> i64
    %1502 = func.call @cc_errorp(%1500) : (i64) -> i64
    %1503 = arith.cmpi ne, %1502, %1501 : i64
    %1504 = scf.if %1503 -> (i64) {
      scf.yield %1500 : i64
    } else {
      func.call @stack_push_pointer(%1471) : (i64) -> ()
      %1505 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1506 = arith.constant 19 : i64
      %1507 = func.call @cc_make_string(%1505, %1506) : (!llvm.ptr, i64) -> i64
      %1508 = func.call @cc_nil_value() : () -> i64
      %1509 = func.call @cc_intern(%1507, %1508) : (i64, i64) -> i64
      %1510 = func.call @cc_nil_value() : () -> i64
      %1511 = func.call @cc_cons(%1509, %1510) : (i64, i64) -> i64
      %1512 = func.call @cc_values_pack(%1511) : (i64) -> i64
      %1513 = func.call @cc_symbol_value(%1509) : (i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1514 = arith.addi %1513, %__rlasp_stack_elide_zero_65 : i64
      %1515 = func.call @stack_pop_pointer() : () -> i64
      %1516 = func.call @cc_member(%1515, %1514) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1517 = arith.addi %1516, %__rlasp_stack_elide_zero_66 : i64
      %1518 = func.call @cc_nil_value() : () -> i64
      %1519 = arith.cmpi ne, %1517, %1518 : i64
      scf.if %1519 {
        %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
        %1520 = arith.addi %1471, %__rlasp_stack_elide_zero_67 : i64
        %1521 = llvm.mlir.addressof @str155 : !llvm.ptr
        %1522 = arith.constant 25 : i64
        %1523 = func.call @cc_make_string(%1521, %1522) : (!llvm.ptr, i64) -> i64
        %1524 = func.call @cc_nil_value() : () -> i64
        %1525 = func.call @cc_intern(%1523, %1524) : (i64, i64) -> i64
        %1526 = func.call @cc_nil_value() : () -> i64
        %1527 = func.call @cc_cons(%1525, %1526) : (i64, i64) -> i64
        %1528 = func.call @cc_values_pack(%1527) : (i64) -> i64
        %1529 = func.call @cc_symbol_value(%1525) : (i64) -> i64
        %1530 = func.call @cc_cons(%1520, %1529) : (i64, i64) -> i64
        %1531 = llvm.mlir.addressof @str156 : !llvm.ptr
        %1532 = arith.constant 25 : i64
        %1533 = func.call @cc_make_string(%1531, %1532) : (!llvm.ptr, i64) -> i64
        %1534 = func.call @cc_nil_value() : () -> i64
        %1535 = func.call @cc_intern(%1533, %1534) : (i64, i64) -> i64
        %1536 = func.call @cc_nil_value() : () -> i64
        %1537 = func.call @cc_cons(%1535, %1536) : (i64, i64) -> i64
        %1538 = func.call @cc_values_pack(%1537) : (i64) -> i64
        %1539 = func.call @cc_set_symbol_value(%1535, %1530) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1530) : (i64) -> ()
      } else {
        %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
        %1540 = arith.addi %1471, %__rlasp_stack_elide_zero_68 : i64
        %1541 = llvm.mlir.addressof @str157 : !llvm.ptr
        %1542 = arith.constant 23 : i64
        %1543 = func.call @cc_make_string(%1541, %1542) : (!llvm.ptr, i64) -> i64
        %1544 = func.call @cc_nil_value() : () -> i64
        %1545 = func.call @cc_intern(%1543, %1544) : (i64, i64) -> i64
        %1546 = func.call @cc_nil_value() : () -> i64
        %1547 = func.call @cc_cons(%1545, %1546) : (i64, i64) -> i64
        %1548 = func.call @cc_values_pack(%1547) : (i64) -> i64
        %1549 = func.call @cc_symbol_value(%1545) : (i64) -> i64
        %1550 = func.call @cc_cons(%1540, %1549) : (i64, i64) -> i64
        %1551 = llvm.mlir.addressof @str158 : !llvm.ptr
        %1552 = arith.constant 23 : i64
        %1553 = func.call @cc_make_string(%1551, %1552) : (!llvm.ptr, i64) -> i64
        %1554 = func.call @cc_nil_value() : () -> i64
        %1555 = func.call @cc_intern(%1553, %1554) : (i64, i64) -> i64
        %1556 = func.call @cc_nil_value() : () -> i64
        %1557 = func.call @cc_cons(%1555, %1556) : (i64, i64) -> i64
        %1558 = func.call @cc_values_pack(%1557) : (i64) -> i64
        %1559 = func.call @cc_set_symbol_value(%1555, %1550) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1550) : (i64) -> ()
      }
      %1560 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1560 : i64
    }
    %1561 = func.call @cc_nil_value() : () -> i64
    %1562 = func.call @cc_errorp(%1504) : (i64) -> i64
    %1563 = arith.cmpi ne, %1562, %1561 : i64
    %1564 = scf.if %1563 -> (i64) {
      scf.yield %1504 : i64
    } else {
      %1565 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1566 = arith.constant 4 : i64
      %1567 = func.call @cc_make_string(%1565, %1566) : (!llvm.ptr, i64) -> i64
      %1568 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1569 = arith.constant 7 : i64
      %1570 = func.call @cc_make_string(%1568, %1569) : (!llvm.ptr, i64) -> i64
      %1571 = func.call @cc_intern(%1567, %1570) : (i64, i64) -> i64
      %1572 = func.call @cc_nil_value() : () -> i64
      %1573 = func.call @cc_cons(%1571, %1572) : (i64, i64) -> i64
      %1574 = func.call @cc_values_pack(%1573) : (i64) -> i64
      %1575 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1576 = arith.constant 9 : i64
      %1577 = func.call @cc_make_string(%1575, %1576) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1571) : (i64) -> ()
      func.call @stack_push_pointer(%1577) : (i64) -> ()
      func.call @stack_push_pointer(%1471) : (i64) -> ()
      %1578 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1579 = func.call @cc_make_function_ref_const(%1578) : (!llvm.ptr) -> i64
      %1580 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1579, %1580) : (i64, i64) -> ()
      %1581 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1581 : i64
    }
    %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
    %1582 = arith.addi %1564, %__rlasp_stack_elide_zero_69 : i64
    %1583 = func.call @cc_multiple_value_list(%1582) : (i64) -> i64
    %1584 = llvm.mlir.addressof @str163 : !llvm.ptr
    %1585 = arith.constant 37 : i64
    %1586 = func.call @cc_make_string(%1584, %1585) : (!llvm.ptr, i64) -> i64
    %1587 = func.call @cc_nil_value() : () -> i64
    %1588 = func.call @cc_intern(%1586, %1587) : (i64, i64) -> i64
    %1589 = func.call @cc_nil_value() : () -> i64
    %1590 = func.call @cc_cons(%1588, %1589) : (i64, i64) -> i64
    %1591 = func.call @cc_values_pack(%1590) : (i64) -> i64
    %1592 = func.call @cc_symbol_value(%1588) : (i64) -> i64
    %1593 = llvm.mlir.addressof @str164 : !llvm.ptr
    %1594 = arith.constant 39 : i64
    %1595 = func.call @cc_make_string(%1593, %1594) : (!llvm.ptr, i64) -> i64
    %1596 = func.call @cc_nil_value() : () -> i64
    %1597 = func.call @cc_intern(%1595, %1596) : (i64, i64) -> i64
    %1598 = func.call @cc_nil_value() : () -> i64
    %1599 = func.call @cc_cons(%1597, %1598) : (i64, i64) -> i64
    %1600 = func.call @cc_values_pack(%1599) : (i64) -> i64
    %1601 = func.call @cc_symbol_value(%1597) : (i64) -> i64
    %1602 = func.call @cc_nil_value() : () -> i64
    %1603 = arith.cmpi ne, %1592, %1602 : i64
    %1604 = scf.if %1603 -> (i64) {
      scf.yield %1601 : i64
    } else {
      scf.yield %1583 : i64
    }
    %1605 = func.call @cc_values_pack(%1604) : (i64) -> i64
    func.call @stack_push_pointer(%1605) : (i64) -> ()
    func.return
  }
  func.func @"%FN%%test"() {
    %1606 = llvm.mlir.addressof @str165 : !llvm.ptr
    %1607 = arith.constant 5 : i64
    %1608 = func.call @cc_make_string(%1606, %1607) : (!llvm.ptr, i64) -> i64
    %1609 = func.call @cc_nil_value() : () -> i64
    %1610 = func.call @cc_intern(%1608, %1609) : (i64, i64) -> i64
    %1611 = func.call @cc_nil_value() : () -> i64
    %1612 = func.call @cc_cons(%1610, %1611) : (i64, i64) -> i64
    %1613 = func.call @cc_values_pack(%1612) : (i64) -> i64
    %1614 = llvm.mlir.addressof @str166 : !llvm.ptr
    %1615 = arith.constant 41 : i64
    %1616 = func.call @cc_make_string(%1614, %1615) : (!llvm.ptr, i64) -> i64
    %1617 = func.call @cc_register_function_lambda_list_metadata_raw(%1610, %1616) : (i64, i64) -> i64
    %1618 = func.call @stack_pop_pointer() : () -> i64
    %1619 = arith.constant 0 : i64
    %1620 = func.call @cc_arg(%1618, %1619) : (i64, i64) -> i64
    %1621 = arith.constant 4 : i64
    %1622 = func.call @cc_arg(%1618, %1621) : (i64, i64) -> i64
    %1623 = arith.constant 8 : i64
    %1624 = func.call @cc_arg(%1618, %1623) : (i64, i64) -> i64
    %1625 = arith.constant 12 : i64
    %1626 = func.call @cc_arg(%1618, %1625) : (i64, i64) -> i64
    %1627 = llvm.mlir.addressof @str167 : !llvm.ptr
    %1628 = arith.constant 11 : i64
    %1629 = func.call @cc_make_string(%1627, %1628) : (!llvm.ptr, i64) -> i64
    %1630 = func.call @cc_nil_value() : () -> i64
    %1631 = func.call @cc_intern(%1629, %1630) : (i64, i64) -> i64
    %1632 = func.call @cc_nil_value() : () -> i64
    %1633 = func.call @cc_cons(%1631, %1632) : (i64, i64) -> i64
    %1634 = func.call @cc_values_pack(%1633) : (i64) -> i64
    %1635 = func.call @cc_arg(%1618, %1631) : (i64, i64) -> i64
    %1636 = func.call @cc_arg_present(%1618, %1631) : (i64, i64) -> i64
    %1637 = func.call @cc_nil_value() : () -> i64
    %1638 = arith.cmpi ne, %1636, %1637 : i64
    %1639 = scf.if %1638 -> (i64) {
      scf.yield %1635 : i64
    } else {
      scf.yield %1637 : i64
    }
    %1640 = llvm.mlir.addressof @str168 : !llvm.ptr
    %1641 = arith.constant 4 : i64
    %1642 = func.call @cc_make_string(%1640, %1641) : (!llvm.ptr, i64) -> i64
    %1643 = func.call @cc_nil_value() : () -> i64
    %1644 = func.call @cc_intern(%1642, %1643) : (i64, i64) -> i64
    %1645 = func.call @cc_nil_value() : () -> i64
    %1646 = func.call @cc_cons(%1644, %1645) : (i64, i64) -> i64
    %1647 = func.call @cc_values_pack(%1646) : (i64) -> i64
    %1648 = func.call @cc_arg(%1618, %1644) : (i64, i64) -> i64
    %1649 = func.call @cc_arg_present(%1618, %1644) : (i64, i64) -> i64
    %1650 = func.call @cc_nil_value() : () -> i64
    %1651 = arith.cmpi ne, %1649, %1650 : i64
    %1652 = scf.if %1651 -> (i64) {
      scf.yield %1648 : i64
    } else {
      %1653 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1654 = arith.constant 6 : i64
      %1655 = func.call @cc_make_string(%1653, %1654) : (!llvm.ptr, i64) -> i64
      %1656 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1657 = arith.constant 11 : i64
      %1658 = func.call @cc_make_string(%1656, %1657) : (!llvm.ptr, i64) -> i64
      %1659 = func.call @cc_intern(%1655, %1658) : (i64, i64) -> i64
      %1660 = func.call @cc_nil_value() : () -> i64
      %1661 = func.call @cc_cons(%1659, %1660) : (i64, i64) -> i64
      %1662 = func.call @cc_values_pack(%1661) : (i64) -> i64
      %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
      %1663 = arith.addi %1659, %__rlasp_stack_elide_zero_70 : i64
      scf.yield %1663 : i64
    }
    %1664 = func.call @cc_nil_value() : () -> i64
    %1665 = llvm.mlir.addressof @str171 : !llvm.ptr
    %1666 = arith.constant 37 : i64
    %1667 = func.call @cc_make_string(%1665, %1666) : (!llvm.ptr, i64) -> i64
    %1668 = func.call @cc_nil_value() : () -> i64
    %1669 = func.call @cc_intern(%1667, %1668) : (i64, i64) -> i64
    %1670 = func.call @cc_nil_value() : () -> i64
    %1671 = func.call @cc_cons(%1669, %1670) : (i64, i64) -> i64
    %1672 = func.call @cc_values_pack(%1671) : (i64) -> i64
    %1673 = func.call @cc_set_symbol_value(%1669, %1664) : (i64, i64) -> i64
    %1674 = llvm.mlir.addressof @str172 : !llvm.ptr
    %1675 = arith.constant 38 : i64
    %1676 = func.call @cc_make_string(%1674, %1675) : (!llvm.ptr, i64) -> i64
    %1677 = func.call @cc_nil_value() : () -> i64
    %1678 = func.call @cc_intern(%1676, %1677) : (i64, i64) -> i64
    %1679 = func.call @cc_nil_value() : () -> i64
    %1680 = func.call @cc_cons(%1678, %1679) : (i64, i64) -> i64
    %1681 = func.call @cc_values_pack(%1680) : (i64) -> i64
    %1682 = func.call @cc_set_symbol_value(%1678, %1664) : (i64, i64) -> i64
    %1683 = llvm.mlir.addressof @str173 : !llvm.ptr
    %1684 = arith.constant 39 : i64
    %1685 = func.call @cc_make_string(%1683, %1684) : (!llvm.ptr, i64) -> i64
    %1686 = func.call @cc_nil_value() : () -> i64
    %1687 = func.call @cc_intern(%1685, %1686) : (i64, i64) -> i64
    %1688 = func.call @cc_nil_value() : () -> i64
    %1689 = func.call @cc_cons(%1687, %1688) : (i64, i64) -> i64
    %1690 = func.call @cc_values_pack(%1689) : (i64) -> i64
    %1691 = func.call @cc_set_symbol_value(%1687, %1664) : (i64, i64) -> i64
    %1692 = func.call @cc_nil_value() : () -> i64
    %1693 = func.call @cc_nil_value() : () -> i64
    %1694 = func.call @cc_errorp(%1692) : (i64) -> i64
    %1695 = arith.cmpi ne, %1694, %1693 : i64
    %1696 = scf.if %1695 -> (i64) {
      scf.yield %1692 : i64
    } else {
      %1697 = func.call @cc_nil_value() : () -> i64
      %1698 = func.call @cc_errorp(%1620) : (i64) -> i64
      %1699 = arith.cmpi ne, %1698, %1697 : i64
      %1700 = arith.cmpi eq, %1697, %1697 : i64
      %1701 = arith.andi %1699, %1700 : i1
      %1702 = scf.if %1701 -> (i64) {
        scf.yield %1620 : i64
      } else {
        scf.yield %1697 : i64
      }
      %1703 = arith.cmpi ne, %1702, %1697 : i64
      scf.if %1703 {
        func.call @stack_push_pointer(%1702) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1620) : (i64) -> ()
        %1704 = llvm.mlir.addressof @str174 : !llvm.ptr
        %1705 = func.call @cc_make_function_ref_const(%1704) : (!llvm.ptr) -> i64
        %1706 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1705, %1706) : (i64, i64) -> ()
      }
      %1707 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1707 : i64
    }
    %1708 = func.call @cc_nil_value() : () -> i64
    %1709 = func.call @cc_errorp(%1696) : (i64) -> i64
    %1710 = arith.cmpi ne, %1709, %1708 : i64
    %1711 = scf.if %1710 -> (i64) {
      scf.yield %1696 : i64
    } else {
      %1712 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1713 = func.call @cc_nil_value() : () -> i64
      %1714 = func.call @cc_nil_value() : () -> i64
      %1715 = func.call @cc_errorp(%1713) : (i64) -> i64
      %1716 = arith.cmpi ne, %1715, %1714 : i64
      %1717 = scf.if %1716 -> (i64) {
        scf.yield %1713 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
        %1718 = arith.addi %1624, %__rlasp_stack_elide_zero_71 : i64
        %1719 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1718, %1719) : (i64, i64) -> ()
        %1720 = func.call @stack_pop_pointer() : () -> i64
        %1721 = func.call @cc_errorp(%1720) : (i64) -> i64
        %1722 = func.call @cc_nil_value() : () -> i64
        %1723 = arith.cmpi ne, %1721, %1722 : i64
        scf.if %1723 {
          func.call @stack_push_pointer(%1720) : (i64) -> ()
        } else {
          %1724 = func.call @cc_multiple_value_list(%1720) : (i64) -> i64
          func.call @stack_push_pointer(%1724) : (i64) -> ()
        }
        %1725 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1726 = func.call @stack_pop_pointer() : () -> i64
        %1727 = func.call @cc_nil_value() : () -> i64
        %1728 = func.call @cc_maybe_error_from_multiple_value_list(%1725) : (i64) -> i64
        %1729 = func.call @cc_errorp(%1728) : (i64) -> i64
        %1730 = arith.cmpi ne, %1729, %1727 : i64
        %1731 = arith.cmpi eq, %1727, %1727 : i64
        %1732 = arith.andi %1730, %1731 : i1
        %1733 = scf.if %1732 -> (i64) {
          scf.yield %1728 : i64
        } else {
          scf.yield %1727 : i64
        }
        %1734 = arith.cmpi ne, %1733, %1727 : i64
        scf.if %1734 {
          func.call @stack_push_pointer(%1733) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1735 = func.call @stack_pop_pointer() : () -> i64
          %1736 = func.call @cc_cons(%1726, %1735) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
          %1737 = arith.addi %1736, %__rlasp_stack_elide_zero_72 : i64
          %1738 = func.call @cc_cons(%1725, %1737) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
          %1739 = arith.addi %1738, %__rlasp_stack_elide_zero_73 : i64
          %1740 = func.call @cc_values_pack(%1739) : (i64) -> i64
          func.call @stack_push_pointer(%1740) : (i64) -> ()
        }
        %1741 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1741 : i64
      }
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %1742 = arith.addi %1717, %__rlasp_stack_elide_zero_74 : i64
      %1743 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1744 = func.call @cc_errorp(%1742) : (i64) -> i64
      %1745 = func.call @cc_nil_value() : () -> i64
      %1746 = arith.cmpi ne, %1744, %1745 : i64
      scf.if %1746 {
        %1747 = func.call @cc_condition_value(%1742) : (i64) -> i64
        %1748 = func.call @cc_values2(%1745, %1747) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1748) : (i64) -> ()
      } else {
        %1749 = func.call @cc_multiple_value_list(%1742) : (i64) -> i64
        %1750 = func.call @cc_values_pack(%1749) : (i64) -> i64
        func.call @stack_push_pointer(%1750) : (i64) -> ()
      }
      %1751 = func.call @stack_pop_pointer() : () -> i64
      %1752 = func.call @cc_multiple_value_list(%1751) : (i64) -> i64
      %1753 = arith.constant 0 : i64
      %1754 = func.call @cc_box_fixnum(%1753) : (i64) -> i64
      %1755 = func.call @cc_nth(%1754, %1752) : (i64, i64) -> i64
      %1756 = arith.constant 1 : i64
      %1757 = func.call @cc_box_fixnum(%1756) : (i64) -> i64
      %1758 = func.call @cc_nth(%1757, %1752) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
      %1759 = arith.addi %1758, %__rlasp_stack_elide_zero_75 : i64
      %1760 = func.call @cc_nil_value() : () -> i64
      %1761 = arith.cmpi ne, %1759, %1760 : i64
      scf.if %1761 {
        func.call @stack_push_pointer(%1620) : (i64) -> ()
        func.call @stack_push_pointer(%1622) : (i64) -> ()
        func.call @stack_push_pointer(%1626) : (i64) -> ()
        func.call @stack_push_pointer(%1758) : (i64) -> ()
        func.call @stack_push_pointer(%1639) : (i64) -> ()
        %1762 = llvm.mlir.addressof @str175 : !llvm.ptr
        %1763 = func.call @cc_make_function_ref_const(%1762) : (!llvm.ptr) -> i64
        %1764 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%1763, %1764) : (i64, i64) -> ()
      } else {
        %1765 = func.call @cc_nil_value() : () -> i64
        %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
        %1766 = arith.addi %1626, %__rlasp_stack_elide_zero_76 : i64
        %1767 = func.call @cc_length(%1766) : (i64) -> i64
        %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
        %1768 = arith.addi %1767, %__rlasp_stack_elide_zero_77 : i64
        %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
        %1769 = arith.addi %1755, %__rlasp_stack_elide_zero_78 : i64
        %1770 = func.call @cc_length(%1769) : (i64) -> i64
        %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
        %1771 = arith.addi %1770, %__rlasp_stack_elide_zero_79 : i64
        %1772 = arith.constant 1 : i1
        %1774 = arith.constant 3 : i64
        %1773 = arith.andi %1768, %1774 : i64
        %1775 = arith.constant 0 : i64
        %1776 = arith.cmpi eq, %1773, %1775 : i64
        %1778 = arith.constant 3 : i64
        %1777 = arith.andi %1771, %1778 : i64
        %1779 = arith.constant 0 : i64
        %1780 = arith.cmpi eq, %1777, %1779 : i64
        %1781 = arith.andi %1776, %1780 : i1
        %1782 = scf.if %1781 -> (i1) {
          %1783 = arith.constant 2 : i64
          %1784 = arith.shrsi %1768, %1783 : i64
          %1785 = arith.constant 2 : i64
          %1786 = arith.shrsi %1771, %1785 : i64
          %1787 = arith.cmpi eq, %1784, %1786 : i64
          scf.yield %1787 : i1
        } else {
          %1788 = func.call @cc_eq(%1768, %1771) : (i64, i64) -> i64
          %1789 = func.call @cc_nil_value() : () -> i64
          %1790 = arith.cmpi ne, %1788, %1789 : i64
          scf.yield %1790 : i1
        }
        %1791 = arith.andi %1772, %1782 : i1
        %1792 = func.call @cc_nil_value() : () -> i64
        %1793 = func.call @cc_t_value() : () -> i64
        %1794 = scf.if %1791 -> (i64) {
          scf.yield %1793 : i64
        } else {
          scf.yield %1792 : i64
        }
        %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
        %1795 = arith.addi %1794, %__rlasp_stack_elide_zero_80 : i64
        func.call @stack_push_pointer(%1652) : (i64) -> ()
        func.call @stack_push_pointer(%1755) : (i64) -> ()
        %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
        %1796 = arith.addi %1626, %__rlasp_stack_elide_zero_81 : i64
        %1797 = func.call @stack_pop_pointer() : () -> i64
        %1798 = func.call @stack_pop_pointer() : () -> i64
        %1799 = func.call @cc_every2(%1798, %1797, %1796) : (i64, i64, i64) -> i64
        %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
        %1800 = arith.addi %1799, %__rlasp_stack_elide_zero_82 : i64
        %1801 = func.call @cc_cons(%1800, %1765) : (i64, i64) -> i64
        %1802 = func.call @cc_cons(%1795, %1801) : (i64, i64) -> i64
        %1803 = func.call @cc_and(%1802) : (i64) -> i64
        %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
        %1804 = arith.addi %1803, %__rlasp_stack_elide_zero_83 : i64
        %1805 = func.call @cc_nil_value() : () -> i64
        %1806 = arith.cmpi ne, %1804, %1805 : i64
        scf.if %1806 {
          %1807 = func.call @cc_nil_value() : () -> i64
          %1808 = func.call @cc_errorp(%1620) : (i64) -> i64
          %1809 = arith.cmpi ne, %1808, %1807 : i64
          %1810 = arith.cmpi eq, %1807, %1807 : i64
          %1811 = arith.andi %1809, %1810 : i1
          %1812 = scf.if %1811 -> (i64) {
            scf.yield %1620 : i64
          } else {
            scf.yield %1807 : i64
          }
          %1813 = arith.cmpi ne, %1812, %1807 : i64
          scf.if %1813 {
            func.call @stack_push_pointer(%1812) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1620) : (i64) -> ()
            %1814 = llvm.mlir.addressof @str176 : !llvm.ptr
            %1815 = func.call @cc_make_function_ref_const(%1814) : (!llvm.ptr) -> i64
            %1816 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1815, %1816) : (i64, i64) -> ()
          }
        } else {
          %1817 = func.call @cc_t_value() : () -> i64
          %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
          %1818 = arith.addi %1817, %__rlasp_stack_elide_zero_84 : i64
          %1819 = func.call @cc_nil_value() : () -> i64
          %1820 = arith.cmpi ne, %1818, %1819 : i64
          scf.if %1820 {
            func.call @stack_push_pointer(%1620) : (i64) -> ()
            func.call @stack_push_pointer(%1622) : (i64) -> ()
            func.call @stack_push_pointer(%1626) : (i64) -> ()
            func.call @stack_push_pointer(%1755) : (i64) -> ()
            func.call @stack_push_pointer(%1639) : (i64) -> ()
            func.call @stack_push_pointer(%1652) : (i64) -> ()
            %1821 = llvm.mlir.addressof @str177 : !llvm.ptr
            %1822 = func.call @cc_make_function_ref_const(%1821) : (!llvm.ptr) -> i64
            %1823 = arith.constant 6 : i64
            func.call @cc_funcall_stack(%1822, %1823) : (i64, i64) -> ()
        }
      }
      }
      %1824 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1824 : i64
    }
    %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
    %1825 = arith.addi %1711, %__rlasp_stack_elide_zero_85 : i64
    %1826 = func.call @cc_multiple_value_list(%1825) : (i64) -> i64
    %1827 = llvm.mlir.addressof @str178 : !llvm.ptr
    %1828 = arith.constant 37 : i64
    %1829 = func.call @cc_make_string(%1827, %1828) : (!llvm.ptr, i64) -> i64
    %1830 = func.call @cc_nil_value() : () -> i64
    %1831 = func.call @cc_intern(%1829, %1830) : (i64, i64) -> i64
    %1832 = func.call @cc_nil_value() : () -> i64
    %1833 = func.call @cc_cons(%1831, %1832) : (i64, i64) -> i64
    %1834 = func.call @cc_values_pack(%1833) : (i64) -> i64
    %1835 = func.call @cc_symbol_value(%1831) : (i64) -> i64
    %1836 = llvm.mlir.addressof @str179 : !llvm.ptr
    %1837 = arith.constant 39 : i64
    %1838 = func.call @cc_make_string(%1836, %1837) : (!llvm.ptr, i64) -> i64
    %1839 = func.call @cc_nil_value() : () -> i64
    %1840 = func.call @cc_intern(%1838, %1839) : (i64, i64) -> i64
    %1841 = func.call @cc_nil_value() : () -> i64
    %1842 = func.call @cc_cons(%1840, %1841) : (i64, i64) -> i64
    %1843 = func.call @cc_values_pack(%1842) : (i64) -> i64
    %1844 = func.call @cc_symbol_value(%1840) : (i64) -> i64
    %1845 = func.call @cc_nil_value() : () -> i64
    %1846 = arith.cmpi ne, %1835, %1845 : i64
    %1847 = scf.if %1846 -> (i64) {
      scf.yield %1844 : i64
    } else {
      scf.yield %1826 : i64
    }
    %1848 = func.call @cc_values_pack(%1847) : (i64) -> i64
    func.call @stack_push_pointer(%1848) : (i64) -> ()
    func.return
  }
  func.func @"%FN%load-if-compiled-correctly"() {
    %1849 = llvm.mlir.addressof @str180 : !llvm.ptr
    %1850 = arith.constant 26 : i64
    %1851 = func.call @cc_make_string(%1849, %1850) : (!llvm.ptr, i64) -> i64
    %1852 = func.call @cc_nil_value() : () -> i64
    %1853 = func.call @cc_intern(%1851, %1852) : (i64, i64) -> i64
    %1854 = func.call @cc_nil_value() : () -> i64
    %1855 = func.call @cc_cons(%1853, %1854) : (i64, i64) -> i64
    %1856 = func.call @cc_values_pack(%1855) : (i64) -> i64
    %1857 = llvm.mlir.addressof @str181 : !llvm.ptr
    %1858 = arith.constant 4 : i64
    %1859 = func.call @cc_make_string(%1857, %1858) : (!llvm.ptr, i64) -> i64
    %1860 = func.call @cc_register_function_lambda_list_metadata_raw(%1853, %1859) : (i64, i64) -> i64
    %1861 = func.call @stack_pop_pointer() : () -> i64
    %1862 = func.call @cc_nil_value() : () -> i64
    %1863 = llvm.mlir.addressof @str182 : !llvm.ptr
    %1864 = arith.constant 37 : i64
    %1865 = func.call @cc_make_string(%1863, %1864) : (!llvm.ptr, i64) -> i64
    %1866 = func.call @cc_nil_value() : () -> i64
    %1867 = func.call @cc_intern(%1865, %1866) : (i64, i64) -> i64
    %1868 = func.call @cc_nil_value() : () -> i64
    %1869 = func.call @cc_cons(%1867, %1868) : (i64, i64) -> i64
    %1870 = func.call @cc_values_pack(%1869) : (i64) -> i64
    %1871 = func.call @cc_set_symbol_value(%1867, %1862) : (i64, i64) -> i64
    %1872 = llvm.mlir.addressof @str183 : !llvm.ptr
    %1873 = arith.constant 38 : i64
    %1874 = func.call @cc_make_string(%1872, %1873) : (!llvm.ptr, i64) -> i64
    %1875 = func.call @cc_nil_value() : () -> i64
    %1876 = func.call @cc_intern(%1874, %1875) : (i64, i64) -> i64
    %1877 = func.call @cc_nil_value() : () -> i64
    %1878 = func.call @cc_cons(%1876, %1877) : (i64, i64) -> i64
    %1879 = func.call @cc_values_pack(%1878) : (i64) -> i64
    %1880 = func.call @cc_set_symbol_value(%1876, %1862) : (i64, i64) -> i64
    %1881 = llvm.mlir.addressof @str184 : !llvm.ptr
    %1882 = arith.constant 39 : i64
    %1883 = func.call @cc_make_string(%1881, %1882) : (!llvm.ptr, i64) -> i64
    %1884 = func.call @cc_nil_value() : () -> i64
    %1885 = func.call @cc_intern(%1883, %1884) : (i64, i64) -> i64
    %1886 = func.call @cc_nil_value() : () -> i64
    %1887 = func.call @cc_cons(%1885, %1886) : (i64, i64) -> i64
    %1888 = func.call @cc_values_pack(%1887) : (i64) -> i64
    %1889 = func.call @cc_set_symbol_value(%1885, %1862) : (i64, i64) -> i64
    %1890 = func.call @cc_nil_value() : () -> i64
    %1891 = func.call @cc_nil_value() : () -> i64
    %1892 = func.call @cc_errorp(%1890) : (i64) -> i64
    %1893 = arith.cmpi ne, %1892, %1891 : i64
    %1894 = scf.if %1893 -> (i64) {
      scf.yield %1890 : i64
    } else {
      %1895 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1895) : (i64) -> ()
      %1896 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1897 = arith.constant 4 : i64
      %1898 = func.call @cc_make_string(%1896, %1897) : (!llvm.ptr, i64) -> i64
      %1899 = func.call @cc_nil_value() : () -> i64
      %1900 = func.call @cc_intern(%1898, %1899) : (i64, i64) -> i64
      %1901 = func.call @cc_nil_value() : () -> i64
      %1902 = func.call @cc_cons(%1900, %1901) : (i64, i64) -> i64
      %1903 = func.call @cc_values_pack(%1902) : (i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1904 = arith.addi %1900, %__rlasp_stack_elide_zero_86 : i64
      %1905 = func.call @stack_pop_pointer() : () -> i64
      %1906 = func.call @cc_cons(%1904, %1905) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1906) : (i64) -> ()
      %1907 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1908 = arith.constant 12 : i64
      %1909 = func.call @cc_make_string(%1907, %1908) : (!llvm.ptr, i64) -> i64
      %1910 = func.call @cc_nil_value() : () -> i64
      %1911 = func.call @cc_intern(%1909, %1910) : (i64, i64) -> i64
      %1912 = func.call @cc_nil_value() : () -> i64
      %1913 = func.call @cc_cons(%1911, %1912) : (i64, i64) -> i64
      %1914 = func.call @cc_values_pack(%1913) : (i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1915 = arith.addi %1911, %__rlasp_stack_elide_zero_87 : i64
      %1916 = func.call @stack_pop_pointer() : () -> i64
      %1917 = func.call @cc_cons(%1915, %1916) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1918 = arith.addi %1917, %__rlasp_stack_elide_zero_88 : i64
      %1919 = func.call @cc_nil_value() : () -> i64
      %1920 = func.call @cc_cons(%1918, %1919) : (i64, i64) -> i64
      %1921 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1922 = arith.constant 4 : i64
      %1923 = func.call @cc_make_string(%1921, %1922) : (!llvm.ptr, i64) -> i64
      %1924 = func.call @cc_nil_value() : () -> i64
      %1925 = func.call @cc_intern(%1923, %1924) : (i64, i64) -> i64
      %1926 = func.call @cc_nil_value() : () -> i64
      %1927 = func.call @cc_cons(%1925, %1926) : (i64, i64) -> i64
      %1928 = func.call @cc_values_pack(%1927) : (i64) -> i64
      %1929 = func.call @cc_symbol_value(%1925) : (i64) -> i64
      %1930 = func.call @cc_set_symbol_value(%1925, %1861) : (i64, i64) -> i64
      %1931 = func.call @cc_eval(%1920) : (i64) -> i64
      %1932 = func.call @cc_multiple_value_list(%1931) : (i64) -> i64
      %1933 = func.call @cc_symbol_value(%1925) : (i64) -> i64
      %1934 = func.call @cc_set_symbol_value(%1925, %1929) : (i64, i64) -> i64
      %1935 = func.call @cc_values_pack(%1932) : (i64) -> i64
      %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
      %1936 = arith.addi %1935, %__rlasp_stack_elide_zero_89 : i64
      scf.yield %1936 : i64
    }
    %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
    %1937 = arith.addi %1894, %__rlasp_stack_elide_zero_90 : i64
    %1938 = func.call @cc_multiple_value_list(%1937) : (i64) -> i64
    %1939 = arith.constant 0 : i64
    %1940 = func.call @cc_box_fixnum(%1939) : (i64) -> i64
    %1941 = func.call @cc_nth(%1940, %1938) : (i64, i64) -> i64
    %1942 = arith.constant 1 : i64
    %1943 = func.call @cc_box_fixnum(%1942) : (i64) -> i64
    %1944 = func.call @cc_nth(%1943, %1938) : (i64, i64) -> i64
    %1945 = arith.constant 2 : i64
    %1946 = func.call @cc_box_fixnum(%1945) : (i64) -> i64
    %1947 = func.call @cc_nth(%1946, %1938) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %1948 = func.call @stack_depth() : () -> i64
    %1949 = arith.constant 0 : i64
    %1950 = arith.cmpi sgt, %1948, %1949 : i64
    scf.if %1950 {
      %1951 = func.call @stack_pop_pointer() : () -> i64
    }
    %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
    %1952 = arith.addi %1941, %__rlasp_stack_elide_zero_91 : i64
    %1953 = func.call @cc_nil_value() : () -> i64
    %1954 = arith.cmpi ne, %1952, %1953 : i64
    scf.if %1954 {
      %1955 = func.call @cc_nil_value() : () -> i64
      %1956 = func.call @cc_nil_value() : () -> i64
      %1957 = func.call @cc_errorp(%1955) : (i64) -> i64
      %1958 = arith.cmpi ne, %1957, %1956 : i64
      %1959 = scf.if %1958 -> (i64) {
        scf.yield %1955 : i64
      } else {
        %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
        %1960 = arith.addi %1941, %__rlasp_stack_elide_zero_92 : i64
        %1961 = func.call @cc_nil_value() : () -> i64
        %1962 = func.call @cc_cons(%1960, %1961) : (i64, i64) -> i64
        %1963 = func.call @cc_load_stack(%1962) : (i64) -> i64
        %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
        %1964 = arith.addi %1963, %__rlasp_stack_elide_zero_93 : i64
        scf.yield %1964 : i64
      }
      func.call @stack_push_pointer(%1959) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %1965 = func.call @stack_pop_pointer() : () -> i64
    %1966 = func.call @cc_errorp(%1965) : (i64) -> i64
    %1967 = func.call @cc_nil_value() : () -> i64
    %1968 = arith.cmpi ne, %1966, %1967 : i64
    %1969 = scf.if %1968 -> (i64) {
      %1970 = func.call @cc_condition_value(%1965) : (i64) -> i64
      %1971 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1972 = arith.constant 5 : i64
      %1973 = func.call @cc_make_string(%1971, %1972) : (!llvm.ptr, i64) -> i64
      %1974 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1975 = arith.constant 11 : i64
      %1976 = func.call @cc_make_string(%1974, %1975) : (!llvm.ptr, i64) -> i64
      %1977 = func.call @cc_intern(%1973, %1976) : (i64, i64) -> i64
      %1978 = func.call @cc_nil_value() : () -> i64
      %1979 = func.call @cc_cons(%1977, %1978) : (i64, i64) -> i64
      %1980 = func.call @cc_values_pack(%1979) : (i64) -> i64
      %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
      %1981 = arith.addi %1977, %__rlasp_stack_elide_zero_94 : i64
      %1982 = func.call @cc_typep(%1970, %1981) : (i64, i64) -> i64
      %1983 = func.call @cc_nil_value() : () -> i64
      %1984 = arith.cmpi ne, %1982, %1983 : i64
      %1985 = scf.if %1984 -> (i64) {
        %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
        %1986 = arith.addi %1861, %__rlasp_stack_elide_zero_95 : i64
        %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
        %1987 = arith.addi %1970, %__rlasp_stack_elide_zero_96 : i64
        %1988 = func.call @cc_nil_value() : () -> i64
        %1989 = func.call @cc_errorp(%1986) : (i64) -> i64
        %1990 = arith.cmpi ne, %1989, %1988 : i64
        %1991 = arith.cmpi eq, %1988, %1988 : i64
        %1992 = arith.andi %1990, %1991 : i1
        %1993 = scf.if %1992 -> (i64) {
          scf.yield %1986 : i64
        } else {
          scf.yield %1988 : i64
        }
        %1994 = func.call @cc_errorp(%1987) : (i64) -> i64
        %1995 = arith.cmpi ne, %1994, %1988 : i64
        %1996 = arith.cmpi eq, %1993, %1988 : i64
        %1997 = arith.andi %1995, %1996 : i1
        %1998 = scf.if %1997 -> (i64) {
          scf.yield %1987 : i64
        } else {
          scf.yield %1993 : i64
        }
        %1999 = arith.cmpi ne, %1998, %1988 : i64
        scf.if %1999 {
          func.call @stack_push_pointer(%1998) : (i64) -> ()
        } else {
          %2000 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%2000) : (i64) -> ()
          %__rlasp_stack_elide_zero_97 = arith.constant 0 : i64
          %2001 = arith.addi %1987, %__rlasp_stack_elide_zero_97 : i64
          %2002 = func.call @stack_pop_pointer() : () -> i64
          %2003 = func.call @cc_cons(%2001, %2002) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2003) : (i64) -> ()
          %__rlasp_stack_elide_zero_98 = arith.constant 0 : i64
          %2004 = arith.addi %1986, %__rlasp_stack_elide_zero_98 : i64
          %2005 = func.call @stack_pop_pointer() : () -> i64
          %2006 = func.call @cc_cons(%2004, %2005) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2006) : (i64) -> ()
        }
        %2007 = func.call @stack_pop_pointer() : () -> i64
        %2008 = func.call @cc_nil_value() : () -> i64
        %2009 = func.call @cc_errorp(%2007) : (i64) -> i64
        %2010 = arith.cmpi ne, %2009, %2008 : i64
        %2011 = arith.cmpi eq, %2008, %2008 : i64
        %2012 = arith.andi %2010, %2011 : i1
        %2013 = scf.if %2012 -> (i64) {
          scf.yield %2007 : i64
        } else {
          scf.yield %2008 : i64
        }
        %2014 = arith.cmpi ne, %2013, %2008 : i64
        scf.if %2014 {
          func.call @stack_push_pointer(%2013) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2007) : (i64) -> ()
          %2015 = llvm.mlir.addressof @str190 : !llvm.ptr
          %2016 = func.call @cc_make_function_ref_const(%2015) : (!llvm.ptr) -> i64
          %2017 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2016, %2017) : (i64, i64) -> ()
        }
        %2018 = func.call @stack_depth() : () -> i64
        %2019 = arith.constant 0 : i64
        %2020 = arith.cmpi sgt, %2018, %2019 : i64
        scf.if %2020 {
          %2021 = func.call @stack_pop_pointer() : () -> i64
        }
        %2022 = llvm.mlir.addressof @str191 : !llvm.ptr
        %2023 = arith.constant 3 : i64
        %2024 = func.call @cc_make_string(%2022, %2023) : (!llvm.ptr, i64) -> i64
        %2025 = llvm.mlir.addressof @str192 : !llvm.ptr
        %2026 = arith.constant 7 : i64
        %2027 = func.call @cc_make_string(%2025, %2026) : (!llvm.ptr, i64) -> i64
        %2028 = func.call @cc_intern(%2024, %2027) : (i64, i64) -> i64
        %2029 = func.call @cc_nil_value() : () -> i64
        %2030 = func.call @cc_cons(%2028, %2029) : (i64, i64) -> i64
        %2031 = func.call @cc_values_pack(%2030) : (i64) -> i64
        %2032 = llvm.mlir.addressof @str193 : !llvm.ptr
        %2033 = arith.constant 45 : i64
        %2034 = func.call @cc_make_string(%2032, %2033) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%2028) : (i64) -> ()
        func.call @stack_push_pointer(%2034) : (i64) -> ()
        func.call @stack_push_pointer(%1861) : (i64) -> ()
        func.call @stack_push_pointer(%1970) : (i64) -> ()
        %2035 = llvm.mlir.addressof @str194 : !llvm.ptr
        %2036 = func.call @cc_make_function_ref_const(%2035) : (!llvm.ptr) -> i64
        %2037 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%2036, %2037) : (i64, i64) -> ()
        %2038 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2038 : i64
      } else {
        scf.yield %1965 : i64
      }
      scf.yield %1985 : i64
    } else {
      scf.yield %1965 : i64
    }
    %__rlasp_stack_elide_zero_99 = arith.constant 0 : i64
    %2039 = arith.addi %1969, %__rlasp_stack_elide_zero_99 : i64
    %2040 = func.call @cc_multiple_value_list(%2039) : (i64) -> i64
    %2041 = llvm.mlir.addressof @str195 : !llvm.ptr
    %2042 = arith.constant 37 : i64
    %2043 = func.call @cc_make_string(%2041, %2042) : (!llvm.ptr, i64) -> i64
    %2044 = func.call @cc_nil_value() : () -> i64
    %2045 = func.call @cc_intern(%2043, %2044) : (i64, i64) -> i64
    %2046 = func.call @cc_nil_value() : () -> i64
    %2047 = func.call @cc_cons(%2045, %2046) : (i64, i64) -> i64
    %2048 = func.call @cc_values_pack(%2047) : (i64) -> i64
    %2049 = func.call @cc_symbol_value(%2045) : (i64) -> i64
    %2050 = llvm.mlir.addressof @str196 : !llvm.ptr
    %2051 = arith.constant 39 : i64
    %2052 = func.call @cc_make_string(%2050, %2051) : (!llvm.ptr, i64) -> i64
    %2053 = func.call @cc_nil_value() : () -> i64
    %2054 = func.call @cc_intern(%2052, %2053) : (i64, i64) -> i64
    %2055 = func.call @cc_nil_value() : () -> i64
    %2056 = func.call @cc_cons(%2054, %2055) : (i64, i64) -> i64
    %2057 = func.call @cc_values_pack(%2056) : (i64) -> i64
    %2058 = func.call @cc_symbol_value(%2054) : (i64) -> i64
    %2059 = func.call @cc_nil_value() : () -> i64
    %2060 = arith.cmpi ne, %2049, %2059 : i64
    %2061 = scf.if %2060 -> (i64) {
      scf.yield %2058 : i64
    } else {
      scf.yield %2040 : i64
    }
    %2062 = func.call @cc_values_pack(%2061) : (i64) -> i64
    func.call @stack_push_pointer(%2062) : (i64) -> ()
    func.return
  }
  func.func @"%FN%no-handler-case-load-if-compiled-correctly"() {
    %2063 = llvm.mlir.addressof @str197 : !llvm.ptr
    %2064 = arith.constant 42 : i64
    %2065 = func.call @cc_make_string(%2063, %2064) : (!llvm.ptr, i64) -> i64
    %2066 = func.call @cc_nil_value() : () -> i64
    %2067 = func.call @cc_intern(%2065, %2066) : (i64, i64) -> i64
    %2068 = func.call @cc_nil_value() : () -> i64
    %2069 = func.call @cc_cons(%2067, %2068) : (i64, i64) -> i64
    %2070 = func.call @cc_values_pack(%2069) : (i64) -> i64
    %2071 = llvm.mlir.addressof @str198 : !llvm.ptr
    %2072 = arith.constant 4 : i64
    %2073 = func.call @cc_make_string(%2071, %2072) : (!llvm.ptr, i64) -> i64
    %2074 = func.call @cc_register_function_lambda_list_metadata_raw(%2067, %2073) : (i64, i64) -> i64
    %2075 = func.call @stack_pop_pointer() : () -> i64
    %2076 = func.call @cc_nil_value() : () -> i64
    %2077 = llvm.mlir.addressof @str199 : !llvm.ptr
    %2078 = arith.constant 37 : i64
    %2079 = func.call @cc_make_string(%2077, %2078) : (!llvm.ptr, i64) -> i64
    %2080 = func.call @cc_nil_value() : () -> i64
    %2081 = func.call @cc_intern(%2079, %2080) : (i64, i64) -> i64
    %2082 = func.call @cc_nil_value() : () -> i64
    %2083 = func.call @cc_cons(%2081, %2082) : (i64, i64) -> i64
    %2084 = func.call @cc_values_pack(%2083) : (i64) -> i64
    %2085 = func.call @cc_set_symbol_value(%2081, %2076) : (i64, i64) -> i64
    %2086 = llvm.mlir.addressof @str200 : !llvm.ptr
    %2087 = arith.constant 38 : i64
    %2088 = func.call @cc_make_string(%2086, %2087) : (!llvm.ptr, i64) -> i64
    %2089 = func.call @cc_nil_value() : () -> i64
    %2090 = func.call @cc_intern(%2088, %2089) : (i64, i64) -> i64
    %2091 = func.call @cc_nil_value() : () -> i64
    %2092 = func.call @cc_cons(%2090, %2091) : (i64, i64) -> i64
    %2093 = func.call @cc_values_pack(%2092) : (i64) -> i64
    %2094 = func.call @cc_set_symbol_value(%2090, %2076) : (i64, i64) -> i64
    %2095 = llvm.mlir.addressof @str201 : !llvm.ptr
    %2096 = arith.constant 39 : i64
    %2097 = func.call @cc_make_string(%2095, %2096) : (!llvm.ptr, i64) -> i64
    %2098 = func.call @cc_nil_value() : () -> i64
    %2099 = func.call @cc_intern(%2097, %2098) : (i64, i64) -> i64
    %2100 = func.call @cc_nil_value() : () -> i64
    %2101 = func.call @cc_cons(%2099, %2100) : (i64, i64) -> i64
    %2102 = func.call @cc_values_pack(%2101) : (i64) -> i64
    %2103 = func.call @cc_set_symbol_value(%2099, %2076) : (i64, i64) -> i64
    %2104 = func.call @cc_nil_value() : () -> i64
    %2105 = func.call @cc_nil_value() : () -> i64
    %2106 = func.call @cc_errorp(%2104) : (i64) -> i64
    %2107 = arith.cmpi ne, %2106, %2105 : i64
    %2108 = scf.if %2107 -> (i64) {
      scf.yield %2104 : i64
    } else {
      %2109 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2109) : (i64) -> ()
      %2110 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2111 = arith.constant 4 : i64
      %2112 = func.call @cc_make_string(%2110, %2111) : (!llvm.ptr, i64) -> i64
      %2113 = func.call @cc_nil_value() : () -> i64
      %2114 = func.call @cc_intern(%2112, %2113) : (i64, i64) -> i64
      %2115 = func.call @cc_nil_value() : () -> i64
      %2116 = func.call @cc_cons(%2114, %2115) : (i64, i64) -> i64
      %2117 = func.call @cc_values_pack(%2116) : (i64) -> i64
      %__rlasp_stack_elide_zero_100 = arith.constant 0 : i64
      %2118 = arith.addi %2114, %__rlasp_stack_elide_zero_100 : i64
      %2119 = func.call @stack_pop_pointer() : () -> i64
      %2120 = func.call @cc_cons(%2118, %2119) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2120) : (i64) -> ()
      %2121 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2122 = arith.constant 12 : i64
      %2123 = func.call @cc_make_string(%2121, %2122) : (!llvm.ptr, i64) -> i64
      %2124 = func.call @cc_nil_value() : () -> i64
      %2125 = func.call @cc_intern(%2123, %2124) : (i64, i64) -> i64
      %2126 = func.call @cc_nil_value() : () -> i64
      %2127 = func.call @cc_cons(%2125, %2126) : (i64, i64) -> i64
      %2128 = func.call @cc_values_pack(%2127) : (i64) -> i64
      %__rlasp_stack_elide_zero_101 = arith.constant 0 : i64
      %2129 = arith.addi %2125, %__rlasp_stack_elide_zero_101 : i64
      %2130 = func.call @stack_pop_pointer() : () -> i64
      %2131 = func.call @cc_cons(%2129, %2130) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_102 = arith.constant 0 : i64
      %2132 = arith.addi %2131, %__rlasp_stack_elide_zero_102 : i64
      %2133 = func.call @cc_nil_value() : () -> i64
      %2134 = func.call @cc_cons(%2132, %2133) : (i64, i64) -> i64
      %2135 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2136 = arith.constant 4 : i64
      %2137 = func.call @cc_make_string(%2135, %2136) : (!llvm.ptr, i64) -> i64
      %2138 = func.call @cc_nil_value() : () -> i64
      %2139 = func.call @cc_intern(%2137, %2138) : (i64, i64) -> i64
      %2140 = func.call @cc_nil_value() : () -> i64
      %2141 = func.call @cc_cons(%2139, %2140) : (i64, i64) -> i64
      %2142 = func.call @cc_values_pack(%2141) : (i64) -> i64
      %2143 = func.call @cc_symbol_value(%2139) : (i64) -> i64
      %2144 = func.call @cc_set_symbol_value(%2139, %2075) : (i64, i64) -> i64
      %2145 = func.call @cc_eval(%2134) : (i64) -> i64
      %2146 = func.call @cc_multiple_value_list(%2145) : (i64) -> i64
      %2147 = func.call @cc_symbol_value(%2139) : (i64) -> i64
      %2148 = func.call @cc_set_symbol_value(%2139, %2143) : (i64, i64) -> i64
      %2149 = func.call @cc_values_pack(%2146) : (i64) -> i64
      %__rlasp_stack_elide_zero_103 = arith.constant 0 : i64
      %2150 = arith.addi %2149, %__rlasp_stack_elide_zero_103 : i64
      scf.yield %2150 : i64
    }
    %__rlasp_stack_elide_zero_104 = arith.constant 0 : i64
    %2151 = arith.addi %2108, %__rlasp_stack_elide_zero_104 : i64
    %2152 = func.call @cc_multiple_value_list(%2151) : (i64) -> i64
    %2153 = arith.constant 0 : i64
    %2154 = func.call @cc_box_fixnum(%2153) : (i64) -> i64
    %2155 = func.call @cc_nth(%2154, %2152) : (i64, i64) -> i64
    %2156 = arith.constant 1 : i64
    %2157 = func.call @cc_box_fixnum(%2156) : (i64) -> i64
    %2158 = func.call @cc_nth(%2157, %2152) : (i64, i64) -> i64
    %2159 = arith.constant 2 : i64
    %2160 = func.call @cc_box_fixnum(%2159) : (i64) -> i64
    %2161 = func.call @cc_nth(%2160, %2152) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %2162 = func.call @stack_depth() : () -> i64
    %2163 = arith.constant 0 : i64
    %2164 = arith.cmpi sgt, %2162, %2163 : i64
    scf.if %2164 {
      %2165 = func.call @stack_pop_pointer() : () -> i64
    }
    %__rlasp_stack_elide_zero_105 = arith.constant 0 : i64
    %2166 = arith.addi %2155, %__rlasp_stack_elide_zero_105 : i64
    %2167 = func.call @cc_nil_value() : () -> i64
    %2168 = arith.cmpi ne, %2166, %2167 : i64
    scf.if %2168 {
      %2169 = func.call @cc_nil_value() : () -> i64
      %2170 = func.call @cc_nil_value() : () -> i64
      %2171 = func.call @cc_errorp(%2169) : (i64) -> i64
      %2172 = arith.cmpi ne, %2171, %2170 : i64
      %2173 = scf.if %2172 -> (i64) {
        scf.yield %2169 : i64
      } else {
        %__rlasp_stack_elide_zero_106 = arith.constant 0 : i64
        %2174 = arith.addi %2155, %__rlasp_stack_elide_zero_106 : i64
        %2175 = func.call @cc_nil_value() : () -> i64
        %2176 = func.call @cc_cons(%2174, %2175) : (i64, i64) -> i64
        %2177 = func.call @cc_load_stack(%2176) : (i64) -> i64
        %__rlasp_stack_elide_zero_107 = arith.constant 0 : i64
        %2178 = arith.addi %2177, %__rlasp_stack_elide_zero_107 : i64
        scf.yield %2178 : i64
      }
      func.call @stack_push_pointer(%2173) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %2179 = func.call @stack_pop_pointer() : () -> i64
    %2180 = func.call @cc_multiple_value_list(%2179) : (i64) -> i64
    %2181 = llvm.mlir.addressof @str205 : !llvm.ptr
    %2182 = arith.constant 37 : i64
    %2183 = func.call @cc_make_string(%2181, %2182) : (!llvm.ptr, i64) -> i64
    %2184 = func.call @cc_nil_value() : () -> i64
    %2185 = func.call @cc_intern(%2183, %2184) : (i64, i64) -> i64
    %2186 = func.call @cc_nil_value() : () -> i64
    %2187 = func.call @cc_cons(%2185, %2186) : (i64, i64) -> i64
    %2188 = func.call @cc_values_pack(%2187) : (i64) -> i64
    %2189 = func.call @cc_symbol_value(%2185) : (i64) -> i64
    %2190 = llvm.mlir.addressof @str206 : !llvm.ptr
    %2191 = arith.constant 39 : i64
    %2192 = func.call @cc_make_string(%2190, %2191) : (!llvm.ptr, i64) -> i64
    %2193 = func.call @cc_nil_value() : () -> i64
    %2194 = func.call @cc_intern(%2192, %2193) : (i64, i64) -> i64
    %2195 = func.call @cc_nil_value() : () -> i64
    %2196 = func.call @cc_cons(%2194, %2195) : (i64, i64) -> i64
    %2197 = func.call @cc_values_pack(%2196) : (i64) -> i64
    %2198 = func.call @cc_symbol_value(%2194) : (i64) -> i64
    %2199 = func.call @cc_nil_value() : () -> i64
    %2200 = arith.cmpi ne, %2189, %2199 : i64
    %2201 = scf.if %2200 -> (i64) {
      scf.yield %2198 : i64
    } else {
      scf.yield %2180 : i64
    }
    %2202 = func.call @cc_values_pack(%2201) : (i64) -> i64
    func.call @stack_push_pointer(%2202) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %2203 = llvm.mlir.addressof @str207 : !llvm.ptr
    %2204 = arith.constant 6 : i64
    %2205 = func.call @cc_make_string(%2203, %2204) : (!llvm.ptr, i64) -> i64
    %2206 = func.call @cc_nil_value() : () -> i64
    %2207 = func.call @cc_intern(%2205, %2206) : (i64, i64) -> i64
    %2208 = func.call @cc_nil_value() : () -> i64
    %2209 = func.call @cc_cons(%2207, %2208) : (i64, i64) -> i64
    %2210 = func.call @cc_values_pack(%2209) : (i64) -> i64
    %2211 = func.call @cc_nil_value() : () -> i64
    %2212 = llvm.mlir.addressof @str208 : !llvm.ptr
    %2213 = arith.constant 37 : i64
    %2214 = func.call @cc_make_string(%2212, %2213) : (!llvm.ptr, i64) -> i64
    %2215 = func.call @cc_nil_value() : () -> i64
    %2216 = func.call @cc_intern(%2214, %2215) : (i64, i64) -> i64
    %2217 = func.call @cc_nil_value() : () -> i64
    %2218 = func.call @cc_cons(%2216, %2217) : (i64, i64) -> i64
    %2219 = func.call @cc_values_pack(%2218) : (i64) -> i64
    %2220 = func.call @cc_set_symbol_value(%2216, %2211) : (i64, i64) -> i64
    %2221 = llvm.mlir.addressof @str209 : !llvm.ptr
    %2222 = arith.constant 38 : i64
    %2223 = func.call @cc_make_string(%2221, %2222) : (!llvm.ptr, i64) -> i64
    %2224 = func.call @cc_nil_value() : () -> i64
    %2225 = func.call @cc_intern(%2223, %2224) : (i64, i64) -> i64
    %2226 = func.call @cc_nil_value() : () -> i64
    %2227 = func.call @cc_cons(%2225, %2226) : (i64, i64) -> i64
    %2228 = func.call @cc_values_pack(%2227) : (i64) -> i64
    %2229 = func.call @cc_set_symbol_value(%2225, %2211) : (i64, i64) -> i64
    %2230 = llvm.mlir.addressof @str210 : !llvm.ptr
    %2231 = arith.constant 39 : i64
    %2232 = func.call @cc_make_string(%2230, %2231) : (!llvm.ptr, i64) -> i64
    %2233 = func.call @cc_nil_value() : () -> i64
    %2234 = func.call @cc_intern(%2232, %2233) : (i64, i64) -> i64
    %2235 = func.call @cc_nil_value() : () -> i64
    %2236 = func.call @cc_cons(%2234, %2235) : (i64, i64) -> i64
    %2237 = func.call @cc_values_pack(%2236) : (i64) -> i64
    %2238 = func.call @cc_set_symbol_value(%2234, %2211) : (i64, i64) -> i64
    %2239 = func.call @cc_nil_value() : () -> i64
    %2240 = func.call @cc_nil_value() : () -> i64
    %2241 = func.call @cc_errorp(%2239) : (i64) -> i64
    %2242 = arith.cmpi ne, %2241, %2240 : i64
    %2243 = scf.if %2242 -> (i64) {
      scf.yield %2239 : i64
    } else {
      %2244 = func.call @cc_nil_value() : () -> i64
      %2245 = func.call @cc_nil_value() : () -> i64
      %2246 = func.call @cc_errorp(%2244) : (i64) -> i64
      %2247 = arith.cmpi ne, %2246, %2245 : i64
      %2248 = scf.if %2247 -> (i64) {
        scf.yield %2244 : i64
      } else {
        %2249 = llvm.mlir.addressof @str211 : !llvm.ptr
        %2250 = arith.constant 11 : i64
        %2251 = func.call @cc_make_string(%2249, %2250) : (!llvm.ptr, i64) -> i64
        %2252 = func.call @cc_nil_value() : () -> i64
        %2253 = func.call @cc_intern(%2251, %2252) : (i64, i64) -> i64
        %2254 = func.call @cc_nil_value() : () -> i64
        %2255 = func.call @cc_cons(%2253, %2254) : (i64, i64) -> i64
        %2256 = func.call @cc_values_pack(%2255) : (i64) -> i64
        %__rlasp_stack_elide_zero_108 = arith.constant 0 : i64
        %2257 = arith.addi %2253, %__rlasp_stack_elide_zero_108 : i64
        %2258 = func.call @cc_nil_value() : () -> i64
        %2259 = func.call @cc_errorp(%2257) : (i64) -> i64
        %2260 = arith.cmpi ne, %2259, %2258 : i64
        %2261 = arith.cmpi eq, %2258, %2258 : i64
        %2262 = arith.andi %2260, %2261 : i1
        %2263 = scf.if %2262 -> (i64) {
          scf.yield %2257 : i64
        } else {
          scf.yield %2258 : i64
        }
        %2264 = arith.cmpi ne, %2263, %2258 : i64
        scf.if %2264 {
          func.call @stack_push_pointer(%2263) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2257) : (i64) -> ()
          %2265 = llvm.mlir.addressof @str212 : !llvm.ptr
          %2266 = func.call @cc_make_function_ref_const(%2265) : (!llvm.ptr) -> i64
          %2267 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2266, %2267) : (i64, i64) -> ()
        }
        %2268 = func.call @stack_pop_pointer() : () -> i64
        %2269 = func.call @cc_nil_value() : () -> i64
        %2270 = arith.cmpi ne, %2268, %2269 : i64
        scf.if %2270 {
          %2271 = llvm.mlir.addressof @str213 : !llvm.ptr
          %2272 = arith.constant 11 : i64
          %2273 = func.call @cc_make_string(%2271, %2272) : (!llvm.ptr, i64) -> i64
          %2274 = func.call @cc_nil_value() : () -> i64
          %2275 = func.call @cc_intern(%2273, %2274) : (i64, i64) -> i64
          %2276 = func.call @cc_nil_value() : () -> i64
          %2277 = func.call @cc_cons(%2275, %2276) : (i64, i64) -> i64
          %2278 = func.call @cc_values_pack(%2277) : (i64) -> i64
          %__rlasp_stack_elide_zero_109 = arith.constant 0 : i64
          %2279 = arith.addi %2275, %__rlasp_stack_elide_zero_109 : i64
          %2280 = func.call @cc_nil_value() : () -> i64
          %2281 = func.call @cc_errorp(%2279) : (i64) -> i64
          %2282 = arith.cmpi ne, %2281, %2280 : i64
          %2283 = arith.cmpi eq, %2280, %2280 : i64
          %2284 = arith.andi %2282, %2283 : i1
          %2285 = scf.if %2284 -> (i64) {
            scf.yield %2279 : i64
          } else {
            scf.yield %2280 : i64
          }
          %2286 = arith.cmpi ne, %2285, %2280 : i64
          scf.if %2286 {
            func.call @stack_push_pointer(%2285) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2279) : (i64) -> ()
            %2287 = llvm.mlir.addressof @str214 : !llvm.ptr
            %2288 = func.call @cc_make_function_ref_const(%2287) : (!llvm.ptr) -> i64
            %2289 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2288, %2289) : (i64, i64) -> ()
          }
        } else {
          %2290 = llvm.mlir.addressof @str215 : !llvm.ptr
          %2291 = arith.constant 11 : i64
          %2292 = func.call @cc_make_string(%2290, %2291) : (!llvm.ptr, i64) -> i64
          %2293 = func.call @cc_nil_value() : () -> i64
          %2294 = func.call @cc_intern(%2292, %2293) : (i64, i64) -> i64
          %2295 = func.call @cc_nil_value() : () -> i64
          %2296 = func.call @cc_cons(%2294, %2295) : (i64, i64) -> i64
          %2297 = func.call @cc_values_pack(%2296) : (i64) -> i64
          %__rlasp_stack_elide_zero_110 = arith.constant 0 : i64
          %2298 = arith.addi %2294, %__rlasp_stack_elide_zero_110 : i64
          %2299 = func.call @cc_nil_value() : () -> i64
          %2300 = func.call @cc_errorp(%2298) : (i64) -> i64
          %2301 = arith.cmpi ne, %2300, %2299 : i64
          %2302 = arith.cmpi eq, %2299, %2299 : i64
          %2303 = arith.andi %2301, %2302 : i1
          %2304 = scf.if %2303 -> (i64) {
            scf.yield %2298 : i64
          } else {
            scf.yield %2299 : i64
          }
          %2305 = arith.cmpi ne, %2304, %2299 : i64
          scf.if %2305 {
            func.call @stack_push_pointer(%2304) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2298) : (i64) -> ()
            %2306 = llvm.mlir.addressof @str216 : !llvm.ptr
            %2307 = func.call @cc_make_function_ref_const(%2306) : (!llvm.ptr) -> i64
            %2308 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2307, %2308) : (i64, i64) -> ()
          }
        }
        %2309 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2309 : i64
      }
      %2310 = func.call @cc_nil_value() : () -> i64
      %2311 = func.call @cc_errorp(%2248) : (i64) -> i64
      %2312 = arith.cmpi ne, %2311, %2310 : i64
      %2313 = scf.if %2312 -> (i64) {
        scf.yield %2248 : i64
      } else {
        %2314 = llvm.mlir.addressof @str217 : !llvm.ptr
        %2315 = arith.constant 2 : i64
        %2316 = func.call @cc_make_string(%2314, %2315) : (!llvm.ptr, i64) -> i64
        %2317 = llvm.mlir.addressof @str218 : !llvm.ptr
        %2318 = arith.constant 7 : i64
        %2319 = func.call @cc_make_string(%2317, %2318) : (!llvm.ptr, i64) -> i64
        %2320 = func.call @cc_intern(%2316, %2319) : (i64, i64) -> i64
        %2321 = func.call @cc_nil_value() : () -> i64
        %2322 = func.call @cc_cons(%2320, %2321) : (i64, i64) -> i64
        %2323 = func.call @cc_values_pack(%2322) : (i64) -> i64
        %__rlasp_stack_elide_zero_111 = arith.constant 0 : i64
        %2324 = arith.addi %2320, %__rlasp_stack_elide_zero_111 : i64
        %2325 = llvm.mlir.addressof @str219 : !llvm.ptr
        %2326 = arith.constant 11 : i64
        %2327 = func.call @cc_make_string(%2325, %2326) : (!llvm.ptr, i64) -> i64
        %2328 = func.call @cc_nil_value() : () -> i64
        %2329 = func.call @cc_intern(%2327, %2328) : (i64, i64) -> i64
        %2330 = func.call @cc_nil_value() : () -> i64
        %2331 = func.call @cc_cons(%2329, %2330) : (i64, i64) -> i64
        %2332 = func.call @cc_values_pack(%2331) : (i64) -> i64
        %__rlasp_stack_elide_zero_112 = arith.constant 0 : i64
        %2333 = arith.addi %2329, %__rlasp_stack_elide_zero_112 : i64
        %2334 = func.call @cc_nil_value() : () -> i64
        %2335 = func.call @cc_errorp(%2324) : (i64) -> i64
        %2336 = arith.cmpi ne, %2335, %2334 : i64
        %2337 = arith.cmpi eq, %2334, %2334 : i64
        %2338 = arith.andi %2336, %2337 : i1
        %2339 = scf.if %2338 -> (i64) {
          scf.yield %2324 : i64
        } else {
          scf.yield %2334 : i64
        }
        %2340 = func.call @cc_errorp(%2333) : (i64) -> i64
        %2341 = arith.cmpi ne, %2340, %2334 : i64
        %2342 = arith.cmpi eq, %2339, %2334 : i64
        %2343 = arith.andi %2341, %2342 : i1
        %2344 = scf.if %2343 -> (i64) {
          scf.yield %2333 : i64
        } else {
          scf.yield %2339 : i64
        }
        %2345 = arith.cmpi ne, %2344, %2334 : i64
        scf.if %2345 {
          func.call @stack_push_pointer(%2344) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2324) : (i64) -> ()
          func.call @stack_push_pointer(%2333) : (i64) -> ()
          %2346 = llvm.mlir.addressof @str220 : !llvm.ptr
          %2347 = func.call @cc_make_function_ref_const(%2346) : (!llvm.ptr) -> i64
          %2348 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2347, %2348) : (i64, i64) -> ()
        }
        %2349 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2349 : i64
      }
      %2350 = func.call @cc_nil_value() : () -> i64
      %2351 = func.call @cc_errorp(%2313) : (i64) -> i64
      %2352 = arith.cmpi ne, %2351, %2350 : i64
      %2353 = scf.if %2352 -> (i64) {
        scf.yield %2313 : i64
      } else {
        %2354 = llvm.mlir.addressof @str221 : !llvm.ptr
        %2355 = arith.constant 4 : i64
        %2356 = func.call @cc_make_string(%2354, %2355) : (!llvm.ptr, i64) -> i64
        %2357 = func.call @cc_nil_value() : () -> i64
        %2358 = func.call @cc_intern(%2356, %2357) : (i64, i64) -> i64
        %2359 = func.call @cc_nil_value() : () -> i64
        %2360 = func.call @cc_cons(%2358, %2359) : (i64, i64) -> i64
        %2361 = func.call @cc_values_pack(%2360) : (i64) -> i64
        %__rlasp_stack_elide_zero_113 = arith.constant 0 : i64
        %2362 = arith.addi %2358, %__rlasp_stack_elide_zero_113 : i64
        %2363 = func.call @cc_string(%2362) : (i64) -> i64
        %__rlasp_stack_elide_zero_114 = arith.constant 0 : i64
        %2364 = arith.addi %2363, %__rlasp_stack_elide_zero_114 : i64
        %2365 = llvm.mlir.addressof @str222 : !llvm.ptr
        %2366 = arith.constant 11 : i64
        %2367 = func.call @cc_make_string(%2365, %2366) : (!llvm.ptr, i64) -> i64
        %2368 = func.call @cc_nil_value() : () -> i64
        %2369 = func.call @cc_intern(%2367, %2368) : (i64, i64) -> i64
        %2370 = func.call @cc_nil_value() : () -> i64
        %2371 = func.call @cc_cons(%2369, %2370) : (i64, i64) -> i64
        %2372 = func.call @cc_values_pack(%2371) : (i64) -> i64
        %__rlasp_stack_elide_zero_115 = arith.constant 0 : i64
        %2373 = arith.addi %2369, %__rlasp_stack_elide_zero_115 : i64
        %2374 = func.call @cc_nil_value() : () -> i64
        %2375 = func.call @cc_errorp(%2364) : (i64) -> i64
        %2376 = arith.cmpi ne, %2375, %2374 : i64
        %2377 = arith.cmpi eq, %2374, %2374 : i64
        %2378 = arith.andi %2376, %2377 : i1
        %2379 = scf.if %2378 -> (i64) {
          scf.yield %2364 : i64
        } else {
          scf.yield %2374 : i64
        }
        %2380 = func.call @cc_errorp(%2373) : (i64) -> i64
        %2381 = arith.cmpi ne, %2380, %2374 : i64
        %2382 = arith.cmpi eq, %2379, %2374 : i64
        %2383 = arith.andi %2381, %2382 : i1
        %2384 = scf.if %2383 -> (i64) {
          scf.yield %2373 : i64
        } else {
          scf.yield %2379 : i64
        }
        %2385 = arith.cmpi ne, %2384, %2374 : i64
        scf.if %2385 {
          func.call @stack_push_pointer(%2384) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2364) : (i64) -> ()
          func.call @stack_push_pointer(%2373) : (i64) -> ()
          %2386 = llvm.mlir.addressof @str223 : !llvm.ptr
          %2387 = func.call @cc_make_function_ref_const(%2386) : (!llvm.ptr) -> i64
          %2388 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2387, %2388) : (i64, i64) -> ()
        }
        %2389 = func.call @stack_pop_pointer() : () -> i64
        %2390 = llvm.mlir.addressof @str224 : !llvm.ptr
        %2391 = arith.constant 11 : i64
        %2392 = func.call @cc_make_string(%2390, %2391) : (!llvm.ptr, i64) -> i64
        %2393 = func.call @cc_nil_value() : () -> i64
        %2394 = func.call @cc_intern(%2392, %2393) : (i64, i64) -> i64
        %2395 = func.call @cc_nil_value() : () -> i64
        %2396 = func.call @cc_cons(%2394, %2395) : (i64, i64) -> i64
        %2397 = func.call @cc_values_pack(%2396) : (i64) -> i64
        %__rlasp_stack_elide_zero_116 = arith.constant 0 : i64
        %2398 = arith.addi %2394, %__rlasp_stack_elide_zero_116 : i64
        %2399 = func.call @cc_nil_value() : () -> i64
        %2400 = func.call @cc_errorp(%2389) : (i64) -> i64
        %2401 = arith.cmpi ne, %2400, %2399 : i64
        %2402 = arith.cmpi eq, %2399, %2399 : i64
        %2403 = arith.andi %2401, %2402 : i1
        %2404 = scf.if %2403 -> (i64) {
          scf.yield %2389 : i64
        } else {
          scf.yield %2399 : i64
        }
        %2405 = func.call @cc_errorp(%2398) : (i64) -> i64
        %2406 = arith.cmpi ne, %2405, %2399 : i64
        %2407 = arith.cmpi eq, %2404, %2399 : i64
        %2408 = arith.andi %2406, %2407 : i1
        %2409 = scf.if %2408 -> (i64) {
          scf.yield %2398 : i64
        } else {
          scf.yield %2404 : i64
        }
        %2410 = arith.cmpi ne, %2409, %2399 : i64
        scf.if %2410 {
          func.call @stack_push_pointer(%2409) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2389) : (i64) -> ()
          func.call @stack_push_pointer(%2398) : (i64) -> ()
          %2411 = llvm.mlir.addressof @str225 : !llvm.ptr
          %2412 = func.call @cc_make_function_ref_const(%2411) : (!llvm.ptr) -> i64
          %2413 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2412, %2413) : (i64, i64) -> ()
        }
        %2414 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2414 : i64
      }
      %2415 = func.call @cc_nil_value() : () -> i64
      %2416 = func.call @cc_errorp(%2353) : (i64) -> i64
      %2417 = arith.cmpi ne, %2416, %2415 : i64
      %2418 = scf.if %2417 -> (i64) {
        scf.yield %2353 : i64
      } else {
        %2419 = llvm.mlir.addressof @str226 : !llvm.ptr
        %2420 = arith.constant 17 : i64
        %2421 = func.call @cc_make_string(%2419, %2420) : (!llvm.ptr, i64) -> i64
        %2422 = func.call @cc_nil_value() : () -> i64
        %2423 = func.call @cc_intern(%2421, %2422) : (i64, i64) -> i64
        %2424 = func.call @cc_nil_value() : () -> i64
        %2425 = func.call @cc_cons(%2423, %2424) : (i64, i64) -> i64
        %2426 = func.call @cc_values_pack(%2425) : (i64) -> i64
        %__rlasp_stack_elide_zero_117 = arith.constant 0 : i64
        %2427 = arith.addi %2423, %__rlasp_stack_elide_zero_117 : i64
        %2428 = func.call @cc_string(%2427) : (i64) -> i64
        %__rlasp_stack_elide_zero_118 = arith.constant 0 : i64
        %2429 = arith.addi %2428, %__rlasp_stack_elide_zero_118 : i64
        %2430 = llvm.mlir.addressof @str227 : !llvm.ptr
        %2431 = arith.constant 11 : i64
        %2432 = func.call @cc_make_string(%2430, %2431) : (!llvm.ptr, i64) -> i64
        %2433 = func.call @cc_nil_value() : () -> i64
        %2434 = func.call @cc_intern(%2432, %2433) : (i64, i64) -> i64
        %2435 = func.call @cc_nil_value() : () -> i64
        %2436 = func.call @cc_cons(%2434, %2435) : (i64, i64) -> i64
        %2437 = func.call @cc_values_pack(%2436) : (i64) -> i64
        %__rlasp_stack_elide_zero_119 = arith.constant 0 : i64
        %2438 = arith.addi %2434, %__rlasp_stack_elide_zero_119 : i64
        %2439 = func.call @cc_nil_value() : () -> i64
        %2440 = func.call @cc_errorp(%2429) : (i64) -> i64
        %2441 = arith.cmpi ne, %2440, %2439 : i64
        %2442 = arith.cmpi eq, %2439, %2439 : i64
        %2443 = arith.andi %2441, %2442 : i1
        %2444 = scf.if %2443 -> (i64) {
          scf.yield %2429 : i64
        } else {
          scf.yield %2439 : i64
        }
        %2445 = func.call @cc_errorp(%2438) : (i64) -> i64
        %2446 = arith.cmpi ne, %2445, %2439 : i64
        %2447 = arith.cmpi eq, %2444, %2439 : i64
        %2448 = arith.andi %2446, %2447 : i1
        %2449 = scf.if %2448 -> (i64) {
          scf.yield %2438 : i64
        } else {
          scf.yield %2444 : i64
        }
        %2450 = arith.cmpi ne, %2449, %2439 : i64
        scf.if %2450 {
          func.call @stack_push_pointer(%2449) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2429) : (i64) -> ()
          func.call @stack_push_pointer(%2438) : (i64) -> ()
          %2451 = llvm.mlir.addressof @str228 : !llvm.ptr
          %2452 = func.call @cc_make_function_ref_const(%2451) : (!llvm.ptr) -> i64
          %2453 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2452, %2453) : (i64, i64) -> ()
        }
        %2454 = func.call @stack_pop_pointer() : () -> i64
        %2455 = llvm.mlir.addressof @str229 : !llvm.ptr
        %2456 = arith.constant 11 : i64
        %2457 = func.call @cc_make_string(%2455, %2456) : (!llvm.ptr, i64) -> i64
        %2458 = func.call @cc_nil_value() : () -> i64
        %2459 = func.call @cc_intern(%2457, %2458) : (i64, i64) -> i64
        %2460 = func.call @cc_nil_value() : () -> i64
        %2461 = func.call @cc_cons(%2459, %2460) : (i64, i64) -> i64
        %2462 = func.call @cc_values_pack(%2461) : (i64) -> i64
        %__rlasp_stack_elide_zero_120 = arith.constant 0 : i64
        %2463 = arith.addi %2459, %__rlasp_stack_elide_zero_120 : i64
        %2464 = func.call @cc_nil_value() : () -> i64
        %2465 = func.call @cc_errorp(%2454) : (i64) -> i64
        %2466 = arith.cmpi ne, %2465, %2464 : i64
        %2467 = arith.cmpi eq, %2464, %2464 : i64
        %2468 = arith.andi %2466, %2467 : i1
        %2469 = scf.if %2468 -> (i64) {
          scf.yield %2454 : i64
        } else {
          scf.yield %2464 : i64
        }
        %2470 = func.call @cc_errorp(%2463) : (i64) -> i64
        %2471 = arith.cmpi ne, %2470, %2464 : i64
        %2472 = arith.cmpi eq, %2469, %2464 : i64
        %2473 = arith.andi %2471, %2472 : i1
        %2474 = scf.if %2473 -> (i64) {
          scf.yield %2463 : i64
        } else {
          scf.yield %2469 : i64
        }
        %2475 = arith.cmpi ne, %2474, %2464 : i64
        scf.if %2475 {
          func.call @stack_push_pointer(%2474) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2454) : (i64) -> ()
          func.call @stack_push_pointer(%2463) : (i64) -> ()
          %2476 = llvm.mlir.addressof @str230 : !llvm.ptr
          %2477 = func.call @cc_make_function_ref_const(%2476) : (!llvm.ptr) -> i64
          %2478 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2477, %2478) : (i64, i64) -> ()
        }
        %2479 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2479 : i64
      }
      %2480 = func.call @cc_nil_value() : () -> i64
      %2481 = func.call @cc_errorp(%2418) : (i64) -> i64
      %2482 = arith.cmpi ne, %2481, %2480 : i64
      %2483 = scf.if %2482 -> (i64) {
        scf.yield %2418 : i64
      } else {
        %2484 = llvm.mlir.addressof @str231 : !llvm.ptr
        %2485 = arith.constant 11 : i64
        %2486 = func.call @cc_make_string(%2484, %2485) : (!llvm.ptr, i64) -> i64
        %2487 = func.call @cc_nil_value() : () -> i64
        %2488 = func.call @cc_intern(%2486, %2487) : (i64, i64) -> i64
        %2489 = func.call @cc_nil_value() : () -> i64
        %2490 = func.call @cc_cons(%2488, %2489) : (i64, i64) -> i64
        %2491 = func.call @cc_values_pack(%2490) : (i64) -> i64
        %__rlasp_stack_elide_zero_121 = arith.constant 0 : i64
        %2492 = arith.addi %2488, %__rlasp_stack_elide_zero_121 : i64
        %2493 = func.call @cc_nil_value() : () -> i64
        %2494 = func.call @cc_errorp(%2492) : (i64) -> i64
        %2495 = arith.cmpi ne, %2494, %2493 : i64
        %2496 = arith.cmpi eq, %2493, %2493 : i64
        %2497 = arith.andi %2495, %2496 : i1
        %2498 = scf.if %2497 -> (i64) {
          scf.yield %2492 : i64
        } else {
          scf.yield %2493 : i64
        }
        %2499 = arith.cmpi ne, %2498, %2493 : i64
        scf.if %2499 {
          func.call @stack_push_pointer(%2498) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2492) : (i64) -> ()
          %2500 = llvm.mlir.addressof @str232 : !llvm.ptr
          %2501 = func.call @cc_make_function_ref_const(%2500) : (!llvm.ptr) -> i64
          %2502 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2501, %2502) : (i64, i64) -> ()
        }
        %2503 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2503 : i64
      }
      %__rlasp_stack_elide_zero_122 = arith.constant 0 : i64
      %2504 = arith.addi %2483, %__rlasp_stack_elide_zero_122 : i64
      scf.yield %2504 : i64
    }
    %2505 = func.call @cc_nil_value() : () -> i64
    %2506 = func.call @cc_errorp(%2243) : (i64) -> i64
    %2507 = arith.cmpi ne, %2506, %2505 : i64
    %2508 = scf.if %2507 -> (i64) {
      scf.yield %2243 : i64
    } else {
      %2509 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2510 = arith.constant 11 : i64
      %2511 = func.call @cc_make_string(%2509, %2510) : (!llvm.ptr, i64) -> i64
      %2512 = func.call @cc_nil_value() : () -> i64
      %2513 = func.call @cc_intern(%2511, %2512) : (i64, i64) -> i64
      %2514 = func.call @cc_nil_value() : () -> i64
      %2515 = func.call @cc_cons(%2513, %2514) : (i64, i64) -> i64
      %2516 = func.call @cc_values_pack(%2515) : (i64) -> i64
      %__rlasp_stack_elide_zero_123 = arith.constant 0 : i64
      %2517 = arith.addi %2513, %__rlasp_stack_elide_zero_123 : i64
      %2518 = func.call @cc_in_package(%2517) : (i64) -> i64
      %__rlasp_stack_elide_zero_124 = arith.constant 0 : i64
      %2519 = arith.addi %2518, %__rlasp_stack_elide_zero_124 : i64
      scf.yield %2519 : i64
    }
    %2520 = func.call @cc_nil_value() : () -> i64
    %2521 = func.call @cc_errorp(%2508) : (i64) -> i64
    %2522 = arith.cmpi ne, %2521, %2520 : i64
    %2523 = scf.if %2522 -> (i64) {
      scf.yield %2508 : i64
    } else {
      %2524 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2525 = arith.constant 23 : i64
      %2526 = func.call @cc_make_string(%2524, %2525) : (!llvm.ptr, i64) -> i64
      %2527 = func.call @cc_nil_value() : () -> i64
      %2528 = func.call @cc_intern(%2526, %2527) : (i64, i64) -> i64
      %2529 = func.call @cc_nil_value() : () -> i64
      %2530 = func.call @cc_cons(%2528, %2529) : (i64, i64) -> i64
      %2531 = func.call @cc_values_pack(%2530) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2532 = func.call @stack_pop_pointer() : () -> i64
      %2533 = func.call @cc_set_symbol_value(%2528, %2532) : (i64, i64) -> i64
      %2534 = func.call @cc_errorp(%2533) : (i64) -> i64
      %2535 = func.call @cc_nil_value() : () -> i64
      %2536 = arith.cmpi ne, %2534, %2535 : i64
      scf.if %2536 {
        func.call @stack_push_pointer(%2533) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2528) : (i64) -> ()
      }
      %2537 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2537 : i64
    }
    %2538 = func.call @cc_nil_value() : () -> i64
    %2539 = func.call @cc_errorp(%2523) : (i64) -> i64
    %2540 = arith.cmpi ne, %2539, %2538 : i64
    %2541 = scf.if %2540 -> (i64) {
      scf.yield %2523 : i64
    } else {
      %2542 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2543 = arith.constant 25 : i64
      %2544 = func.call @cc_make_string(%2542, %2543) : (!llvm.ptr, i64) -> i64
      %2545 = func.call @cc_nil_value() : () -> i64
      %2546 = func.call @cc_intern(%2544, %2545) : (i64, i64) -> i64
      %2547 = func.call @cc_nil_value() : () -> i64
      %2548 = func.call @cc_cons(%2546, %2547) : (i64, i64) -> i64
      %2549 = func.call @cc_values_pack(%2548) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2550 = func.call @stack_pop_pointer() : () -> i64
      %2551 = func.call @cc_set_symbol_value(%2546, %2550) : (i64, i64) -> i64
      %2552 = func.call @cc_errorp(%2551) : (i64) -> i64
      %2553 = func.call @cc_nil_value() : () -> i64
      %2554 = arith.cmpi ne, %2552, %2553 : i64
      scf.if %2554 {
        func.call @stack_push_pointer(%2551) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2546) : (i64) -> ()
      }
      %2555 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2555 : i64
    }
    %2556 = func.call @cc_nil_value() : () -> i64
    %2557 = func.call @cc_errorp(%2541) : (i64) -> i64
    %2558 = arith.cmpi ne, %2557, %2556 : i64
    %2559 = scf.if %2558 -> (i64) {
      scf.yield %2541 : i64
    } else {
      %2560 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2561 = arith.constant 23 : i64
      %2562 = func.call @cc_make_string(%2560, %2561) : (!llvm.ptr, i64) -> i64
      %2563 = func.call @cc_nil_value() : () -> i64
      %2564 = func.call @cc_intern(%2562, %2563) : (i64, i64) -> i64
      %2565 = func.call @cc_nil_value() : () -> i64
      %2566 = func.call @cc_cons(%2564, %2565) : (i64, i64) -> i64
      %2567 = func.call @cc_values_pack(%2566) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2568 = func.call @stack_pop_pointer() : () -> i64
      %2569 = func.call @cc_set_symbol_value(%2564, %2568) : (i64, i64) -> i64
      %2570 = func.call @cc_errorp(%2569) : (i64) -> i64
      %2571 = func.call @cc_nil_value() : () -> i64
      %2572 = arith.cmpi ne, %2570, %2571 : i64
      scf.if %2572 {
        func.call @stack_push_pointer(%2569) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2564) : (i64) -> ()
      }
      %2573 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2573 : i64
    }
    %2574 = func.call @cc_nil_value() : () -> i64
    %2575 = func.call @cc_errorp(%2559) : (i64) -> i64
    %2576 = arith.cmpi ne, %2575, %2574 : i64
    %2577 = scf.if %2576 -> (i64) {
      scf.yield %2559 : i64
    } else {
      %2578 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2579 = arith.constant 25 : i64
      %2580 = func.call @cc_make_string(%2578, %2579) : (!llvm.ptr, i64) -> i64
      %2581 = func.call @cc_nil_value() : () -> i64
      %2582 = func.call @cc_intern(%2580, %2581) : (i64, i64) -> i64
      %2583 = func.call @cc_nil_value() : () -> i64
      %2584 = func.call @cc_cons(%2582, %2583) : (i64, i64) -> i64
      %2585 = func.call @cc_values_pack(%2584) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2586 = func.call @stack_pop_pointer() : () -> i64
      %2587 = func.call @cc_set_symbol_value(%2582, %2586) : (i64, i64) -> i64
      %2588 = func.call @cc_errorp(%2587) : (i64) -> i64
      %2589 = func.call @cc_nil_value() : () -> i64
      %2590 = arith.cmpi ne, %2588, %2589 : i64
      scf.if %2590 {
        func.call @stack_push_pointer(%2587) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2582) : (i64) -> ()
      }
      %2591 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2591 : i64
    }
    %2592 = func.call @cc_nil_value() : () -> i64
    %2593 = func.call @cc_errorp(%2577) : (i64) -> i64
    %2594 = arith.cmpi ne, %2593, %2592 : i64
    %2595 = scf.if %2594 -> (i64) {
      scf.yield %2577 : i64
    } else {
      %2596 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2597 = arith.constant 19 : i64
      %2598 = func.call @cc_make_string(%2596, %2597) : (!llvm.ptr, i64) -> i64
      %2599 = func.call @cc_nil_value() : () -> i64
      %2600 = func.call @cc_intern(%2598, %2599) : (i64, i64) -> i64
      %2601 = func.call @cc_nil_value() : () -> i64
      %2602 = func.call @cc_cons(%2600, %2601) : (i64, i64) -> i64
      %2603 = func.call @cc_values_pack(%2602) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2604 = func.call @stack_pop_pointer() : () -> i64
      %2605 = func.call @cc_set_symbol_value(%2600, %2604) : (i64, i64) -> i64
      %2606 = func.call @cc_errorp(%2605) : (i64) -> i64
      %2607 = func.call @cc_nil_value() : () -> i64
      %2608 = arith.cmpi ne, %2606, %2607 : i64
      scf.if %2608 {
        func.call @stack_push_pointer(%2605) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2600) : (i64) -> ()
      }
      %2609 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2609 : i64
    }
    %2610 = func.call @cc_nil_value() : () -> i64
    %2611 = func.call @cc_errorp(%2595) : (i64) -> i64
    %2612 = arith.cmpi ne, %2611, %2610 : i64
    %2613 = scf.if %2612 -> (i64) {
      scf.yield %2595 : i64
    } else {
      %2614 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2615 = arith.constant 25 : i64
      %2616 = func.call @cc_make_string(%2614, %2615) : (!llvm.ptr, i64) -> i64
      %2617 = func.call @cc_nil_value() : () -> i64
      %2618 = func.call @cc_intern(%2616, %2617) : (i64, i64) -> i64
      %2619 = func.call @cc_nil_value() : () -> i64
      %2620 = func.call @cc_cons(%2618, %2619) : (i64, i64) -> i64
      %2621 = func.call @cc_values_pack(%2620) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2622 = func.call @stack_pop_pointer() : () -> i64
      %2623 = func.call @cc_set_symbol_value(%2618, %2622) : (i64, i64) -> i64
      %2624 = func.call @cc_errorp(%2623) : (i64) -> i64
      %2625 = func.call @cc_nil_value() : () -> i64
      %2626 = arith.cmpi ne, %2624, %2625 : i64
      scf.if %2626 {
        func.call @stack_push_pointer(%2623) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2618) : (i64) -> ()
      }
      %2627 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2627 : i64
    }
    %2628 = func.call @cc_nil_value() : () -> i64
    %2629 = func.call @cc_errorp(%2613) : (i64) -> i64
    %2630 = arith.cmpi ne, %2629, %2628 : i64
    %2631 = scf.if %2630 -> (i64) {
      scf.yield %2613 : i64
    } else {
      %2632 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2633 = arith.constant 19 : i64
      %2634 = func.call @cc_make_string(%2632, %2633) : (!llvm.ptr, i64) -> i64
      %2635 = func.call @cc_nil_value() : () -> i64
      %2636 = func.call @cc_intern(%2634, %2635) : (i64, i64) -> i64
      %2637 = func.call @cc_nil_value() : () -> i64
      %2638 = func.call @cc_cons(%2636, %2637) : (i64, i64) -> i64
      %2639 = func.call @cc_values_pack(%2638) : (i64) -> i64
      %2640 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2640) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %2641 = func.call @stack_pop_pointer() : () -> i64
      %__rlasp_stack_elide_zero_125 = arith.constant 0 : i64
      %2642 = arith.addi %2641, %__rlasp_stack_elide_zero_125 : i64
      %2643 = func.call @cc_set_symbol_value(%2636, %2642) : (i64, i64) -> i64
      %2644 = func.call @cc_errorp(%2643) : (i64) -> i64
      %2645 = func.call @cc_nil_value() : () -> i64
      %2646 = arith.cmpi ne, %2644, %2645 : i64
      scf.if %2646 {
        func.call @stack_push_pointer(%2643) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2636) : (i64) -> ()
      }
      %2647 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2647 : i64
    }
    %2648 = func.call @cc_nil_value() : () -> i64
    %2649 = func.call @cc_errorp(%2631) : (i64) -> i64
    %2650 = arith.cmpi ne, %2649, %2648 : i64
    %2651 = scf.if %2650 -> (i64) {
      scf.yield %2631 : i64
    } else {
      %2652 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2653 = arith.constant 17 : i64
      %2654 = func.call @cc_make_string(%2652, %2653) : (!llvm.ptr, i64) -> i64
      %2655 = func.call @cc_nil_value() : () -> i64
      %2656 = func.call @cc_intern(%2654, %2655) : (i64, i64) -> i64
      %2657 = func.call @cc_nil_value() : () -> i64
      %2658 = func.call @cc_cons(%2656, %2657) : (i64, i64) -> i64
      %2659 = func.call @cc_values_pack(%2658) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2660 = func.call @stack_pop_pointer() : () -> i64
      %2661 = func.call @cc_set_symbol_value(%2656, %2660) : (i64, i64) -> i64
      %2662 = func.call @cc_errorp(%2661) : (i64) -> i64
      %2663 = func.call @cc_nil_value() : () -> i64
      %2664 = arith.cmpi ne, %2662, %2663 : i64
      scf.if %2664 {
        func.call @stack_push_pointer(%2661) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2656) : (i64) -> ()
      }
      %2665 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2665 : i64
    }
    %2666 = func.call @cc_nil_value() : () -> i64
    %2667 = func.call @cc_errorp(%2651) : (i64) -> i64
    %2668 = arith.cmpi ne, %2667, %2666 : i64
    %2669 = scf.if %2668 -> (i64) {
      scf.yield %2651 : i64
    } else {
      %2670 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2671 = arith.constant 20 : i64
      %2672 = func.call @cc_make_string(%2670, %2671) : (!llvm.ptr, i64) -> i64
      %2673 = func.call @cc_nil_value() : () -> i64
      %2674 = func.call @cc_intern(%2672, %2673) : (i64, i64) -> i64
      %2675 = func.call @cc_nil_value() : () -> i64
      %2676 = func.call @cc_cons(%2674, %2675) : (i64, i64) -> i64
      %2677 = func.call @cc_values_pack(%2676) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %2678 = func.call @stack_pop_pointer() : () -> i64
      %2679 = func.call @cc_set_symbol_value(%2674, %2678) : (i64, i64) -> i64
      %2680 = func.call @cc_errorp(%2679) : (i64) -> i64
      %2681 = func.call @cc_nil_value() : () -> i64
      %2682 = arith.cmpi ne, %2680, %2681 : i64
      scf.if %2682 {
        func.call @stack_push_pointer(%2679) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2674) : (i64) -> ()
      }
      %2683 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2683 : i64
    }
    %__rlasp_stack_elide_zero_126 = arith.constant 0 : i64
    %2684 = arith.addi %2669, %__rlasp_stack_elide_zero_126 : i64
    %2685 = func.call @cc_multiple_value_list(%2684) : (i64) -> i64
    %2686 = llvm.mlir.addressof @str243 : !llvm.ptr
    %2687 = arith.constant 37 : i64
    %2688 = func.call @cc_make_string(%2686, %2687) : (!llvm.ptr, i64) -> i64
    %2689 = func.call @cc_nil_value() : () -> i64
    %2690 = func.call @cc_intern(%2688, %2689) : (i64, i64) -> i64
    %2691 = func.call @cc_nil_value() : () -> i64
    %2692 = func.call @cc_cons(%2690, %2691) : (i64, i64) -> i64
    %2693 = func.call @cc_values_pack(%2692) : (i64) -> i64
    %2694 = func.call @cc_symbol_value(%2690) : (i64) -> i64
    %2695 = llvm.mlir.addressof @str244 : !llvm.ptr
    %2696 = arith.constant 39 : i64
    %2697 = func.call @cc_make_string(%2695, %2696) : (!llvm.ptr, i64) -> i64
    %2698 = func.call @cc_nil_value() : () -> i64
    %2699 = func.call @cc_intern(%2697, %2698) : (i64, i64) -> i64
    %2700 = func.call @cc_nil_value() : () -> i64
    %2701 = func.call @cc_cons(%2699, %2700) : (i64, i64) -> i64
    %2702 = func.call @cc_values_pack(%2701) : (i64) -> i64
    %2703 = func.call @cc_symbol_value(%2699) : (i64) -> i64
    %2704 = func.call @cc_nil_value() : () -> i64
    %2705 = arith.cmpi ne, %2694, %2704 : i64
    %2706 = scf.if %2705 -> (i64) {
      scf.yield %2703 : i64
    } else {
      scf.yield %2685 : i64
    }
    %2707 = func.call @cc_values_pack(%2706) : (i64) -> i64
    func.call @stack_push_pointer(%2707) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1("level\0Acontrol-string\0Aargs\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_96868088414208*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("Display a message using ANSI highlighting if possible. LEVEL should be NIL, :ERR,\0A:WARN or :EMPH.\00") : !llvm.array<98 x i8>
  llvm.mlir.global private constant @str6("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("FRESH-LINE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str9("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str10("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str12("~c[~dm\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("OTHERWISE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str20("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP:FORMAT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str23("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str26("~c[0m\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str27("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str28("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str29("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("TERPRI\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str33("RESET-CLASP-TESTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str34("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str35("*__MLIR_BLOCK_RETVALUE_96868088414209*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str37("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str38("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str39("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str40("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str41("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str42("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str43("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str44("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str45("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str46("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str47("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str49("*__MLIR_BLOCK_RETVALUE_96868088414210*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str50("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str51("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str52("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str53("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str54("~%Duplicate test ~a~%\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str55("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str56("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str57("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str58("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str59("NOTE-COMPILE-ERROR\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str60("file&error\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str61("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str62("*__MLIR_BLOCK_RETVALUE_96868088414211*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str63("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str64("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str65("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str66("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str68("SHOW-TEST-SUMMARY\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str69("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETVALUE_96868088414212*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str72("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str73("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str74("~@[~%Failures:~%  ~/pprint-fill/~%~]~\0A~@[~%Unexpected Successes:~%  ~/pprint-fill/~%~]~\0A~@[~%Expected Failures:~%  ~/pprint-fill/~%~]\0ASuccesses: ~d\00") : !llvm.array<148 x i8>
  llvm.mlir.global private constant @str75("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str76("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str77("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str78("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str79("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str81("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str82("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("Compilation error for file ~a with error  ~a\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str85("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str87("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str88("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str89("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str90("Duplicate test ~a\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str91("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str93("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str94("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str95("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str96("name\0Aform\0Aexpected\0ACOMMON-LISP:ERROR\0Adescription\00") : !llvm.array<49 x i8>
  llvm.mlir.global private constant @str97("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str98("*__MLIR_BLOCK_RETVALUE_96868088414213*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str99("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str100("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str101("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str102("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str103("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str104("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str105("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str106("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str107("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str108("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str110("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str112("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str113("Unexpected error~%~t~a~%while evaluating~%~t~a\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str114("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str118("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str119("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str120("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str121("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str122("name\0Aform\0Aexpected\0Aactual\0Adescription\0Atest\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str123("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str124("*__MLIR_BLOCK_RETVALUE_96868088414214*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str125("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str126("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str127("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str128("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str129("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str130("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str131("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str132("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str133("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str134("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str136("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("Wanted values ~s to~%~{~t~a~%~}but got~%~{~t~a~%~}\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str138("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str139("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("while evaluating~%~t~a~%\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str142("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str143("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str144("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str145("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str146("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str148("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str149("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str150("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str151("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str152("*__MLIR_BLOCK_RETVALUE_96868088414215*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str153("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str154("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str155("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str156("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str157("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str158("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str159("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str160("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str161("Passed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str162("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str163("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str164("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str165("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str166("name\0Aform\0Athunk\0Aexpected\0Adescription\0Atest\00") : !llvm.array<42 x i8>
  llvm.mlir.global private constant @str167("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str168("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str169("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str170("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str172("*__MLIR_BLOCK_RETVALUE_96868088414216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str173("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str174("%FN%note-test\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str175("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str176("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str177("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str178("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str179("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str180("LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str181("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str182("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str183("*__MLIR_BLOCK_RETVALUE_96868088414217*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str184("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str185("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str186("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str187("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str188("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str189("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str190("%FN%note-compile-error\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str191("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str192("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str193("Regression: compile-file of ~a failed with ~a\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str194("%FN%message\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str195("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str196("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str197("NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str198("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str199("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str200("*__MLIR_BLOCK_RETVALUE_96868088414218*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str201("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str202("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str203("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str204("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str205("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str206("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str207("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str208("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str209("*__MLIR_BLOCK_RETVALUE_96868088414219*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str210("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str211("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str212("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str213("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str214("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str215("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str217("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str218("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str219("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str222("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str223("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str224("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str225("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str226("TEST-EXPECT-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str227("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str228("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str229("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str230("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str231("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str232("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str233("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str234("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str235("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str236("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str237("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str238("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str239("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str240("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str241("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str242("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str243("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str244("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global constant @__argslist_functions("%FN%message\00%FN%%test\00%FN%message\00%FN%%test\00\00") : !llvm.array<45 x i8>
}
