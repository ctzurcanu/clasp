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
  func.func @"%FN%boole$"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 6 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 8 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    %11 = func.call @cc_register_function_lambda_list_metadata_raw(%4, %10) : (i64, i64) -> i64
    %12 = func.call @stack_pop_pointer() : () -> i64
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @stack_pop_pointer() : () -> i64
    %15 = func.call @cc_nil_value() : () -> i64
    %16 = llvm.mlir.addressof @str2 : !llvm.ptr
    %17 = arith.constant 38 : i64
    %18 = func.call @cc_make_string(%16, %17) : (!llvm.ptr, i64) -> i64
    %19 = func.call @cc_nil_value() : () -> i64
    %20 = func.call @cc_intern(%18, %19) : (i64, i64) -> i64
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = func.call @cc_cons(%20, %21) : (i64, i64) -> i64
    %23 = func.call @cc_values_pack(%22) : (i64) -> i64
    %24 = func.call @cc_set_symbol_value(%20, %15) : (i64, i64) -> i64
    %25 = llvm.mlir.addressof @str3 : !llvm.ptr
    %26 = arith.constant 39 : i64
    %27 = func.call @cc_make_string(%25, %26) : (!llvm.ptr, i64) -> i64
    %28 = func.call @cc_nil_value() : () -> i64
    %29 = func.call @cc_intern(%27, %28) : (i64, i64) -> i64
    %30 = func.call @cc_nil_value() : () -> i64
    %31 = func.call @cc_cons(%29, %30) : (i64, i64) -> i64
    %32 = func.call @cc_values_pack(%31) : (i64) -> i64
    %33 = func.call @cc_set_symbol_value(%29, %15) : (i64, i64) -> i64
    %34 = llvm.mlir.addressof @str4 : !llvm.ptr
    %35 = arith.constant 40 : i64
    %36 = func.call @cc_make_string(%34, %35) : (!llvm.ptr, i64) -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_intern(%36, %37) : (i64, i64) -> i64
    %39 = func.call @cc_nil_value() : () -> i64
    %40 = func.call @cc_cons(%38, %39) : (i64, i64) -> i64
    %41 = func.call @cc_values_pack(%40) : (i64) -> i64
    %42 = func.call @cc_set_symbol_value(%38, %15) : (i64, i64) -> i64
    %43 = func.call @cc_nil_value() : () -> i64
    %44 = func.call @cc_nil_value() : () -> i64
    %45 = func.call @cc_errorp(%43) : (i64) -> i64
    %46 = arith.cmpi ne, %45, %44 : i64
    %47 = scf.if %46 -> (i64) {
      scf.yield %43 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %48 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %48 : i64
    }
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_errorp(%47) : (i64) -> i64
    %51 = arith.cmpi ne, %50, %49 : i64
    %52 = scf.if %51 -> (i64) {
      scf.yield %47 : i64
    } else {
      %53 = llvm.mlir.addressof @str5 : !llvm.ptr
      %54 = arith.constant 13 : i64
      %55 = func.call @cc_make_string(%53, %54) : (!llvm.ptr, i64) -> i64
      %56 = func.call @cc_nil_value() : () -> i64
      %57 = func.call @cc_intern(%55, %56) : (i64, i64) -> i64
      %58 = func.call @cc_nil_value() : () -> i64
      %59 = func.call @cc_cons(%57, %58) : (i64, i64) -> i64
      %60 = func.call @cc_values_pack(%59) : (i64) -> i64
      %61 = func.call @cc_symbol_value(%57) : (i64) -> i64
      %62 = func.call @cc_aref(%61, %14) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %63 = arith.addi %62, %__rlasp_stack_elide_zero_0 : i64
      %64 = func.call @cc_nil_value() : () -> i64
      %65 = func.call @cc_errorp(%63) : (i64) -> i64
      %66 = arith.cmpi ne, %65, %64 : i64
      %67 = arith.cmpi eq, %64, %64 : i64
      %68 = arith.andi %66, %67 : i1
      %69 = scf.if %68 -> (i64) {
        scf.yield %63 : i64
      } else {
        scf.yield %64 : i64
      }
      %70 = func.call @cc_errorp(%13) : (i64) -> i64
      %71 = arith.cmpi ne, %70, %64 : i64
      %72 = arith.cmpi eq, %69, %64 : i64
      %73 = arith.andi %71, %72 : i1
      %74 = scf.if %73 -> (i64) {
        scf.yield %13 : i64
      } else {
        scf.yield %69 : i64
      }
      %75 = func.call @cc_errorp(%12) : (i64) -> i64
      %76 = arith.cmpi ne, %75, %64 : i64
      %77 = arith.cmpi eq, %74, %64 : i64
      %78 = arith.andi %76, %77 : i1
      %79 = scf.if %78 -> (i64) {
        scf.yield %12 : i64
      } else {
        scf.yield %74 : i64
      }
      %80 = arith.cmpi ne, %79, %64 : i64
      scf.if %80 {
        func.call @stack_push_pointer(%79) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%63) : (i64) -> ()
        func.call @stack_push_pointer(%13) : (i64) -> ()
        func.call @stack_push_pointer(%12) : (i64) -> ()
        %81 = llvm.mlir.addressof @str6 : !llvm.ptr
        %82 = func.call @cc_make_function_ref_const(%81) : (!llvm.ptr) -> i64
        %83 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%82, %83) : (i64, i64) -> ()
      }
      %84 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %84 : i64
    }
    %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
    %85 = arith.addi %52, %__rlasp_stack_elide_zero_1 : i64
    %86 = func.call @cc_multiple_value_list(%85) : (i64) -> i64
    %87 = llvm.mlir.addressof @str7 : !llvm.ptr
    %88 = arith.constant 38 : i64
    %89 = func.call @cc_make_string(%87, %88) : (!llvm.ptr, i64) -> i64
    %90 = func.call @cc_nil_value() : () -> i64
    %91 = func.call @cc_intern(%89, %90) : (i64, i64) -> i64
    %92 = func.call @cc_nil_value() : () -> i64
    %93 = func.call @cc_cons(%91, %92) : (i64, i64) -> i64
    %94 = func.call @cc_values_pack(%93) : (i64) -> i64
    %95 = func.call @cc_symbol_value(%91) : (i64) -> i64
    %96 = llvm.mlir.addressof @str8 : !llvm.ptr
    %97 = arith.constant 40 : i64
    %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
    %99 = func.call @cc_nil_value() : () -> i64
    %100 = func.call @cc_intern(%98, %99) : (i64, i64) -> i64
    %101 = func.call @cc_nil_value() : () -> i64
    %102 = func.call @cc_cons(%100, %101) : (i64, i64) -> i64
    %103 = func.call @cc_values_pack(%102) : (i64) -> i64
    %104 = func.call @cc_symbol_value(%100) : (i64) -> i64
    %105 = func.call @cc_nil_value() : () -> i64
    %106 = arith.cmpi ne, %95, %105 : i64
    %107 = scf.if %106 -> (i64) {
      scf.yield %104 : i64
    } else {
      scf.yield %86 : i64
    }
    %108 = func.call @cc_values_pack(%107) : (i64) -> i64
    func.call @stack_push_pointer(%108) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %109 = llvm.mlir.addressof @str9 : !llvm.ptr
    %110 = arith.constant 6 : i64
    %111 = func.call @cc_make_string(%109, %110) : (!llvm.ptr, i64) -> i64
    %112 = func.call @cc_nil_value() : () -> i64
    %113 = func.call @cc_intern(%111, %112) : (i64, i64) -> i64
    %114 = func.call @cc_nil_value() : () -> i64
    %115 = func.call @cc_cons(%113, %114) : (i64, i64) -> i64
    %116 = func.call @cc_values_pack(%115) : (i64) -> i64
    %117 = func.call @cc_nil_value() : () -> i64
    %118 = llvm.mlir.addressof @str10 : !llvm.ptr
    %119 = arith.constant 38 : i64
    %120 = func.call @cc_make_string(%118, %119) : (!llvm.ptr, i64) -> i64
    %121 = func.call @cc_nil_value() : () -> i64
    %122 = func.call @cc_intern(%120, %121) : (i64, i64) -> i64
    %123 = func.call @cc_nil_value() : () -> i64
    %124 = func.call @cc_cons(%122, %123) : (i64, i64) -> i64
    %125 = func.call @cc_values_pack(%124) : (i64) -> i64
    %126 = func.call @cc_set_symbol_value(%122, %117) : (i64, i64) -> i64
    %127 = llvm.mlir.addressof @str11 : !llvm.ptr
    %128 = arith.constant 39 : i64
    %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
    %130 = func.call @cc_nil_value() : () -> i64
    %131 = func.call @cc_intern(%129, %130) : (i64, i64) -> i64
    %132 = func.call @cc_nil_value() : () -> i64
    %133 = func.call @cc_cons(%131, %132) : (i64, i64) -> i64
    %134 = func.call @cc_values_pack(%133) : (i64) -> i64
    %135 = func.call @cc_set_symbol_value(%131, %117) : (i64, i64) -> i64
    %136 = llvm.mlir.addressof @str12 : !llvm.ptr
    %137 = arith.constant 40 : i64
    %138 = func.call @cc_make_string(%136, %137) : (!llvm.ptr, i64) -> i64
    %139 = func.call @cc_nil_value() : () -> i64
    %140 = func.call @cc_intern(%138, %139) : (i64, i64) -> i64
    %141 = func.call @cc_nil_value() : () -> i64
    %142 = func.call @cc_cons(%140, %141) : (i64, i64) -> i64
    %143 = func.call @cc_values_pack(%142) : (i64) -> i64
    %144 = func.call @cc_set_symbol_value(%140, %117) : (i64, i64) -> i64
    %145 = func.call @cc_nil_value() : () -> i64
    %146 = func.call @cc_nil_value() : () -> i64
    %147 = func.call @cc_errorp(%145) : (i64) -> i64
    %148 = arith.cmpi ne, %147, %146 : i64
    %149 = scf.if %148 -> (i64) {
      scf.yield %145 : i64
    } else {
      %150 = func.call @cc_nil_value() : () -> i64
      %151 = func.call @cc_nil_value() : () -> i64
      %152 = func.call @cc_errorp(%150) : (i64) -> i64
      %153 = arith.cmpi ne, %152, %151 : i64
      %154 = scf.if %153 -> (i64) {
        scf.yield %150 : i64
      } else {
        %155 = llvm.mlir.addressof @str13 : !llvm.ptr
        %156 = arith.constant 13 : i64
        %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
        %158 = func.call @cc_nil_value() : () -> i64
        %159 = func.call @cc_intern(%157, %158) : (i64, i64) -> i64
        %160 = func.call @cc_nil_value() : () -> i64
        %161 = func.call @cc_cons(%159, %160) : (i64, i64) -> i64
        %162 = func.call @cc_values_pack(%161) : (i64) -> i64
        %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
        %163 = arith.addi %159, %__rlasp_stack_elide_zero_2 : i64
        %164 = func.call @cc_nil_value() : () -> i64
        %165 = func.call @cc_errorp(%163) : (i64) -> i64
        %166 = arith.cmpi ne, %165, %164 : i64
        %167 = arith.cmpi eq, %164, %164 : i64
        %168 = arith.andi %166, %167 : i1
        %169 = scf.if %168 -> (i64) {
          scf.yield %163 : i64
        } else {
          scf.yield %164 : i64
        }
        %170 = arith.cmpi ne, %169, %164 : i64
        scf.if %170 {
          func.call @stack_push_pointer(%169) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%163) : (i64) -> ()
          %171 = llvm.mlir.addressof @str14 : !llvm.ptr
          %172 = func.call @cc_make_function_ref_const(%171) : (!llvm.ptr) -> i64
          %173 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%172, %173) : (i64, i64) -> ()
        }
        %174 = func.call @stack_pop_pointer() : () -> i64
        %175 = func.call @cc_nil_value() : () -> i64
        %176 = arith.cmpi ne, %174, %175 : i64
        scf.if %176 {
          %177 = llvm.mlir.addressof @str15 : !llvm.ptr
          %178 = arith.constant 13 : i64
          %179 = func.call @cc_make_string(%177, %178) : (!llvm.ptr, i64) -> i64
          %180 = func.call @cc_nil_value() : () -> i64
          %181 = func.call @cc_intern(%179, %180) : (i64, i64) -> i64
          %182 = func.call @cc_nil_value() : () -> i64
          %183 = func.call @cc_cons(%181, %182) : (i64, i64) -> i64
          %184 = func.call @cc_values_pack(%183) : (i64) -> i64
          %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
          %185 = arith.addi %181, %__rlasp_stack_elide_zero_3 : i64
          %186 = func.call @cc_nil_value() : () -> i64
          %187 = func.call @cc_errorp(%185) : (i64) -> i64
          %188 = arith.cmpi ne, %187, %186 : i64
          %189 = arith.cmpi eq, %186, %186 : i64
          %190 = arith.andi %188, %189 : i1
          %191 = scf.if %190 -> (i64) {
            scf.yield %185 : i64
          } else {
            scf.yield %186 : i64
          }
          %192 = arith.cmpi ne, %191, %186 : i64
          scf.if %192 {
            func.call @stack_push_pointer(%191) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%185) : (i64) -> ()
            %193 = llvm.mlir.addressof @str16 : !llvm.ptr
            %194 = func.call @cc_make_function_ref_const(%193) : (!llvm.ptr) -> i64
            %195 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%194, %195) : (i64, i64) -> ()
          }
        } else {
          %196 = llvm.mlir.addressof @str17 : !llvm.ptr
          %197 = arith.constant 13 : i64
          %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
          %199 = func.call @cc_nil_value() : () -> i64
          %200 = func.call @cc_intern(%198, %199) : (i64, i64) -> i64
          %201 = func.call @cc_nil_value() : () -> i64
          %202 = func.call @cc_cons(%200, %201) : (i64, i64) -> i64
          %203 = func.call @cc_values_pack(%202) : (i64) -> i64
          %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
          %204 = arith.addi %200, %__rlasp_stack_elide_zero_4 : i64
          %205 = func.call @cc_nil_value() : () -> i64
          %206 = func.call @cc_errorp(%204) : (i64) -> i64
          %207 = arith.cmpi ne, %206, %205 : i64
          %208 = arith.cmpi eq, %205, %205 : i64
          %209 = arith.andi %207, %208 : i1
          %210 = scf.if %209 -> (i64) {
            scf.yield %204 : i64
          } else {
            scf.yield %205 : i64
          }
          %211 = arith.cmpi ne, %210, %205 : i64
          scf.if %211 {
            func.call @stack_push_pointer(%210) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%204) : (i64) -> ()
            %212 = llvm.mlir.addressof @str18 : !llvm.ptr
            %213 = func.call @cc_make_function_ref_const(%212) : (!llvm.ptr) -> i64
            %214 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%213, %214) : (i64, i64) -> ()
          }
        }
        %215 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %215 : i64
      }
      %216 = func.call @cc_nil_value() : () -> i64
      %217 = func.call @cc_errorp(%154) : (i64) -> i64
      %218 = arith.cmpi ne, %217, %216 : i64
      %219 = scf.if %218 -> (i64) {
        scf.yield %154 : i64
      } else {
        %220 = llvm.mlir.addressof @str19 : !llvm.ptr
        %221 = arith.constant 2 : i64
        %222 = func.call @cc_make_string(%220, %221) : (!llvm.ptr, i64) -> i64
        %223 = llvm.mlir.addressof @str20 : !llvm.ptr
        %224 = arith.constant 7 : i64
        %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
        %226 = func.call @cc_intern(%222, %225) : (i64, i64) -> i64
        %227 = func.call @cc_nil_value() : () -> i64
        %228 = func.call @cc_cons(%226, %227) : (i64, i64) -> i64
        %229 = func.call @cc_values_pack(%228) : (i64) -> i64
        %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
        %230 = arith.addi %226, %__rlasp_stack_elide_zero_5 : i64
        %231 = llvm.mlir.addressof @str21 : !llvm.ptr
        %232 = arith.constant 13 : i64
        %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
        %234 = func.call @cc_nil_value() : () -> i64
        %235 = func.call @cc_intern(%233, %234) : (i64, i64) -> i64
        %236 = func.call @cc_nil_value() : () -> i64
        %237 = func.call @cc_cons(%235, %236) : (i64, i64) -> i64
        %238 = func.call @cc_values_pack(%237) : (i64) -> i64
        %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
        %239 = arith.addi %235, %__rlasp_stack_elide_zero_6 : i64
        %240 = func.call @cc_nil_value() : () -> i64
        %241 = func.call @cc_errorp(%230) : (i64) -> i64
        %242 = arith.cmpi ne, %241, %240 : i64
        %243 = arith.cmpi eq, %240, %240 : i64
        %244 = arith.andi %242, %243 : i1
        %245 = scf.if %244 -> (i64) {
          scf.yield %230 : i64
        } else {
          scf.yield %240 : i64
        }
        %246 = func.call @cc_errorp(%239) : (i64) -> i64
        %247 = arith.cmpi ne, %246, %240 : i64
        %248 = arith.cmpi eq, %245, %240 : i64
        %249 = arith.andi %247, %248 : i1
        %250 = scf.if %249 -> (i64) {
          scf.yield %239 : i64
        } else {
          scf.yield %245 : i64
        }
        %251 = arith.cmpi ne, %250, %240 : i64
        scf.if %251 {
          func.call @stack_push_pointer(%250) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%230) : (i64) -> ()
          func.call @stack_push_pointer(%239) : (i64) -> ()
          %252 = llvm.mlir.addressof @str22 : !llvm.ptr
          %253 = func.call @cc_make_function_ref_const(%252) : (!llvm.ptr) -> i64
          %254 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%253, %254) : (i64, i64) -> ()
        }
        %255 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %255 : i64
      }
      %256 = func.call @cc_nil_value() : () -> i64
      %257 = func.call @cc_errorp(%219) : (i64) -> i64
      %258 = arith.cmpi ne, %257, %256 : i64
      %259 = scf.if %258 -> (i64) {
        scf.yield %219 : i64
      } else {
        %260 = llvm.mlir.addressof @str23 : !llvm.ptr
        %261 = arith.constant 13 : i64
        %262 = func.call @cc_make_string(%260, %261) : (!llvm.ptr, i64) -> i64
        %263 = func.call @cc_nil_value() : () -> i64
        %264 = func.call @cc_intern(%262, %263) : (i64, i64) -> i64
        %265 = func.call @cc_nil_value() : () -> i64
        %266 = func.call @cc_cons(%264, %265) : (i64, i64) -> i64
        %267 = func.call @cc_values_pack(%266) : (i64) -> i64
        %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
        %268 = arith.addi %264, %__rlasp_stack_elide_zero_7 : i64
        %269 = func.call @cc_nil_value() : () -> i64
        %270 = func.call @cc_errorp(%268) : (i64) -> i64
        %271 = arith.cmpi ne, %270, %269 : i64
        %272 = arith.cmpi eq, %269, %269 : i64
        %273 = arith.andi %271, %272 : i1
        %274 = scf.if %273 -> (i64) {
          scf.yield %268 : i64
        } else {
          scf.yield %269 : i64
        }
        %275 = arith.cmpi ne, %274, %269 : i64
        scf.if %275 {
          func.call @stack_push_pointer(%274) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%268) : (i64) -> ()
          %276 = llvm.mlir.addressof @str24 : !llvm.ptr
          %277 = func.call @cc_make_function_ref_const(%276) : (!llvm.ptr) -> i64
          %278 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%277, %278) : (i64, i64) -> ()
        }
        %279 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %279 : i64
      }
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %280 = arith.addi %259, %__rlasp_stack_elide_zero_8 : i64
      scf.yield %280 : i64
    }
    %281 = func.call @cc_nil_value() : () -> i64
    %282 = func.call @cc_errorp(%149) : (i64) -> i64
    %283 = arith.cmpi ne, %282, %281 : i64
    %284 = scf.if %283 -> (i64) {
      scf.yield %149 : i64
    } else {
      %285 = llvm.mlir.addressof @str25 : !llvm.ptr
      %286 = arith.constant 13 : i64
      %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
      %288 = llvm.mlir.addressof @str26 : !llvm.ptr
      %289 = arith.constant 7 : i64
      %290 = func.call @cc_make_string(%288, %289) : (!llvm.ptr, i64) -> i64
      %291 = func.call @cc_intern(%287, %290) : (i64, i64) -> i64
      %292 = func.call @cc_nil_value() : () -> i64
      %293 = func.call @cc_cons(%291, %292) : (i64, i64) -> i64
      %294 = func.call @cc_values_pack(%293) : (i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %295 = arith.addi %291, %__rlasp_stack_elide_zero_9 : i64
      %296 = func.call @cc_in_package(%295) : (i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %297 = arith.addi %296, %__rlasp_stack_elide_zero_10 : i64
      scf.yield %297 : i64
    }
    %298 = func.call @cc_nil_value() : () -> i64
    %299 = func.call @cc_errorp(%284) : (i64) -> i64
    %300 = arith.cmpi ne, %299, %298 : i64
    %301 = scf.if %300 -> (i64) {
      scf.yield %284 : i64
    } else {
      %302 = llvm.mlir.addressof @str27 : !llvm.ptr
      %303 = arith.constant 13 : i64
      %304 = func.call @cc_make_string(%302, %303) : (!llvm.ptr, i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_intern(%304, %305) : (i64, i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_cons(%306, %307) : (i64, i64) -> i64
      %309 = func.call @cc_values_pack(%308) : (i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %310 = arith.addi %306, %__rlasp_stack_elide_zero_11 : i64
      scf.yield %310 : i64
    }
    %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
    %311 = arith.addi %301, %__rlasp_stack_elide_zero_12 : i64
    %312 = func.call @cc_multiple_value_list(%311) : (i64) -> i64
    %313 = llvm.mlir.addressof @str28 : !llvm.ptr
    %314 = arith.constant 38 : i64
    %315 = func.call @cc_make_string(%313, %314) : (!llvm.ptr, i64) -> i64
    %316 = func.call @cc_nil_value() : () -> i64
    %317 = func.call @cc_intern(%315, %316) : (i64, i64) -> i64
    %318 = func.call @cc_nil_value() : () -> i64
    %319 = func.call @cc_cons(%317, %318) : (i64, i64) -> i64
    %320 = func.call @cc_values_pack(%319) : (i64) -> i64
    %321 = func.call @cc_symbol_value(%317) : (i64) -> i64
    %322 = llvm.mlir.addressof @str29 : !llvm.ptr
    %323 = arith.constant 40 : i64
    %324 = func.call @cc_make_string(%322, %323) : (!llvm.ptr, i64) -> i64
    %325 = func.call @cc_nil_value() : () -> i64
    %326 = func.call @cc_intern(%324, %325) : (i64, i64) -> i64
    %327 = func.call @cc_nil_value() : () -> i64
    %328 = func.call @cc_cons(%326, %327) : (i64, i64) -> i64
    %329 = func.call @cc_values_pack(%328) : (i64) -> i64
    %330 = func.call @cc_symbol_value(%326) : (i64) -> i64
    %331 = func.call @cc_nil_value() : () -> i64
    %332 = arith.cmpi ne, %321, %331 : i64
    %333 = scf.if %332 -> (i64) {
      scf.yield %330 : i64
    } else {
      scf.yield %312 : i64
    }
    %334 = func.call @cc_values_pack(%333) : (i64) -> i64
    func.call @stack_push_pointer(%334) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("op\0Ai1\0Ai2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_239118244118528*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str6("BOOLE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str9("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_239118244118529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETVALUE_239118244118529*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_239118244118529*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str13("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str14("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str16("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str17("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str18("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str19("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str22("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str24("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str25("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETFLAG_239118244118529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETMVLIST_239118244118529*\00") : !llvm.array<41 x i8>
}
