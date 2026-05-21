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
    %12 = func.call @stack_pop_pointer() : () -> i64
    %13 = func.call @cc_nil_value() : () -> i64
    %14 = llvm.mlir.addressof @str2 : !llvm.ptr
    %15 = arith.constant 37 : i64
    %16 = func.call @cc_make_string(%14, %15) : (!llvm.ptr, i64) -> i64
    %17 = func.call @cc_nil_value() : () -> i64
    %18 = func.call @cc_intern(%16, %17) : (i64, i64) -> i64
    %19 = func.call @cc_nil_value() : () -> i64
    %20 = func.call @cc_cons(%18, %19) : (i64, i64) -> i64
    %21 = func.call @cc_values_pack(%20) : (i64) -> i64
    %22 = func.call @cc_set_symbol_value(%18, %13) : (i64, i64) -> i64
    %23 = llvm.mlir.addressof @str3 : !llvm.ptr
    %24 = arith.constant 38 : i64
    %25 = func.call @cc_make_string(%23, %24) : (!llvm.ptr, i64) -> i64
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_intern(%25, %26) : (i64, i64) -> i64
    %28 = func.call @cc_nil_value() : () -> i64
    %29 = func.call @cc_cons(%27, %28) : (i64, i64) -> i64
    %30 = func.call @cc_values_pack(%29) : (i64) -> i64
    %31 = func.call @cc_set_symbol_value(%27, %13) : (i64, i64) -> i64
    %32 = llvm.mlir.addressof @str4 : !llvm.ptr
    %33 = arith.constant 39 : i64
    %34 = func.call @cc_make_string(%32, %33) : (!llvm.ptr, i64) -> i64
    %35 = func.call @cc_nil_value() : () -> i64
    %36 = func.call @cc_intern(%34, %35) : (i64, i64) -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_cons(%36, %37) : (i64, i64) -> i64
    %39 = func.call @cc_values_pack(%38) : (i64) -> i64
    %40 = func.call @cc_set_symbol_value(%36, %13) : (i64, i64) -> i64
    %41 = arith.constant 2 : i64
    %42 = func.call @cc_box_fixnum(%41) : (i64) -> i64
    %44 = arith.constant 3 : i64
    %43 = arith.andi %12, %44 : i64
    %45 = arith.constant 0 : i64
    %46 = arith.cmpi eq, %43, %45 : i64
    %48 = arith.constant 3 : i64
    %47 = arith.andi %42, %48 : i64
    %49 = arith.constant 0 : i64
    %50 = arith.cmpi eq, %47, %49 : i64
    %51 = arith.andi %46, %50 : i1
    %52 = scf.if %51 -> (i64) {
      %53 = arith.constant 2 : i64
      %54 = arith.shrsi %12, %53 : i64
      %55 = arith.constant 2 : i64
      %56 = arith.shrsi %42, %55 : i64
      %57 = arith.constant 0 : i64
      %58 = arith.cmpi slt, %54, %57 : i64
      %59 = scf.if %58 -> (i64) {
        %60 = arith.subi %57, %54 : i64
        scf.yield %60 : i64
      } else {
        scf.yield %54 : i64
      }
      %61 = arith.constant 0 : i64
      %62 = arith.cmpi slt, %56, %61 : i64
      %63 = scf.if %62 -> (i64) {
        %64 = arith.subi %61, %56 : i64
        scf.yield %64 : i64
      } else {
        scf.yield %56 : i64
      }
      %65 = arith.constant 1518500249 : i64
      %66 = arith.cmpi sle, %59, %65 : i64
      %67 = arith.cmpi sle, %63, %65 : i64
      %68 = arith.andi %66, %67 : i1
      %69 = scf.if %68 -> (i64) {
        %70 = arith.muli %54, %56 : i64
        %71 = arith.constant 2 : i64
        %72 = arith.shli %70, %71 : i64
        scf.yield %72 : i64
      } else {
        %73 = func.call @cc_mul(%12, %42) : (i64, i64) -> i64
        scf.yield %73 : i64
      }
      scf.yield %69 : i64
    } else {
      %74 = func.call @cc_mul(%12, %42) : (i64, i64) -> i64
      scf.yield %74 : i64
    }
    %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
    %75 = arith.addi %52, %__rlasp_stack_elide_zero_0 : i64
    %76 = func.call @cc_multiple_value_list(%75) : (i64) -> i64
    %77 = llvm.mlir.addressof @str5 : !llvm.ptr
    %78 = arith.constant 37 : i64
    %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
    %80 = func.call @cc_nil_value() : () -> i64
    %81 = func.call @cc_intern(%79, %80) : (i64, i64) -> i64
    %82 = func.call @cc_nil_value() : () -> i64
    %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
    %84 = func.call @cc_values_pack(%83) : (i64) -> i64
    %85 = func.call @cc_symbol_value(%81) : (i64) -> i64
    %86 = llvm.mlir.addressof @str6 : !llvm.ptr
    %87 = arith.constant 39 : i64
    %88 = func.call @cc_make_string(%86, %87) : (!llvm.ptr, i64) -> i64
    %89 = func.call @cc_nil_value() : () -> i64
    %90 = func.call @cc_intern(%88, %89) : (i64, i64) -> i64
    %91 = func.call @cc_nil_value() : () -> i64
    %92 = func.call @cc_cons(%90, %91) : (i64, i64) -> i64
    %93 = func.call @cc_values_pack(%92) : (i64) -> i64
    %94 = func.call @cc_symbol_value(%90) : (i64) -> i64
    %95 = func.call @cc_nil_value() : () -> i64
    %96 = arith.cmpi ne, %85, %95 : i64
    %97 = scf.if %96 -> (i64) {
      scf.yield %94 : i64
    } else {
      scf.yield %76 : i64
    }
    %98 = func.call @cc_values_pack(%97) : (i64) -> i64
    func.call @stack_push_pointer(%98) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %99 = llvm.mlir.addressof @str7 : !llvm.ptr
    %100 = arith.constant 6 : i64
    %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
    %102 = func.call @cc_nil_value() : () -> i64
    %103 = func.call @cc_intern(%101, %102) : (i64, i64) -> i64
    %104 = func.call @cc_nil_value() : () -> i64
    %105 = func.call @cc_cons(%103, %104) : (i64, i64) -> i64
    %106 = func.call @cc_values_pack(%105) : (i64) -> i64
    %107 = func.call @cc_nil_value() : () -> i64
    %108 = llvm.mlir.addressof @str8 : !llvm.ptr
    %109 = arith.constant 37 : i64
    %110 = func.call @cc_make_string(%108, %109) : (!llvm.ptr, i64) -> i64
    %111 = func.call @cc_nil_value() : () -> i64
    %112 = func.call @cc_intern(%110, %111) : (i64, i64) -> i64
    %113 = func.call @cc_nil_value() : () -> i64
    %114 = func.call @cc_cons(%112, %113) : (i64, i64) -> i64
    %115 = func.call @cc_values_pack(%114) : (i64) -> i64
    %116 = func.call @cc_set_symbol_value(%112, %107) : (i64, i64) -> i64
    %117 = llvm.mlir.addressof @str9 : !llvm.ptr
    %118 = arith.constant 38 : i64
    %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
    %120 = func.call @cc_nil_value() : () -> i64
    %121 = func.call @cc_intern(%119, %120) : (i64, i64) -> i64
    %122 = func.call @cc_nil_value() : () -> i64
    %123 = func.call @cc_cons(%121, %122) : (i64, i64) -> i64
    %124 = func.call @cc_values_pack(%123) : (i64) -> i64
    %125 = func.call @cc_set_symbol_value(%121, %107) : (i64, i64) -> i64
    %126 = llvm.mlir.addressof @str10 : !llvm.ptr
    %127 = arith.constant 39 : i64
    %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
    %129 = func.call @cc_nil_value() : () -> i64
    %130 = func.call @cc_intern(%128, %129) : (i64, i64) -> i64
    %131 = func.call @cc_nil_value() : () -> i64
    %132 = func.call @cc_cons(%130, %131) : (i64, i64) -> i64
    %133 = func.call @cc_values_pack(%132) : (i64) -> i64
    %134 = func.call @cc_set_symbol_value(%130, %107) : (i64, i64) -> i64
    %135 = func.call @cc_nil_value() : () -> i64
    %136 = func.call @cc_nil_value() : () -> i64
    %137 = func.call @cc_errorp(%135) : (i64) -> i64
    %138 = arith.cmpi ne, %137, %136 : i64
    %139 = scf.if %138 -> (i64) {
      scf.yield %135 : i64
    } else {
      %140 = llvm.mlir.addressof @str11 : !llvm.ptr
      %141 = arith.constant 11 : i64
      %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
      %143 = func.call @cc_nil_value() : () -> i64
      %144 = func.call @cc_intern(%142, %143) : (i64, i64) -> i64
      %145 = func.call @cc_nil_value() : () -> i64
      %146 = func.call @cc_cons(%144, %145) : (i64, i64) -> i64
      %147 = func.call @cc_values_pack(%146) : (i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %148 = arith.addi %144, %__rlasp_stack_elide_zero_1 : i64
      %149 = func.call @cc_in_package(%148) : (i64) -> i64
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %150 = arith.addi %149, %__rlasp_stack_elide_zero_2 : i64
      scf.yield %150 : i64
    }
    %151 = func.call @cc_nil_value() : () -> i64
    %152 = func.call @cc_errorp(%139) : (i64) -> i64
    %153 = arith.cmpi ne, %152, %151 : i64
    %154 = scf.if %153 -> (i64) {
      scf.yield %139 : i64
    } else {
      %155 = llvm.mlir.addressof @str12 : !llvm.ptr
      %156 = arith.constant 7 : i64
      %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
      %158 = func.call @cc_nil_value() : () -> i64
      %159 = func.call @cc_intern(%157, %158) : (i64, i64) -> i64
      %160 = func.call @cc_nil_value() : () -> i64
      %161 = func.call @cc_cons(%159, %160) : (i64, i64) -> i64
      %162 = func.call @cc_values_pack(%161) : (i64) -> i64
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %163 = arith.addi %159, %__rlasp_stack_elide_zero_3 : i64
      %164 = llvm.mlir.addressof @str13 : !llvm.ptr
      %165 = arith.constant 13 : i64
      %166 = func.call @cc_make_string(%164, %165) : (!llvm.ptr, i64) -> i64
      %167 = llvm.mlir.addressof @str14 : !llvm.ptr
      %168 = arith.constant 11 : i64
      %169 = func.call @cc_make_string(%167, %168) : (!llvm.ptr, i64) -> i64
      %170 = func.call @cc_intern(%166, %169) : (i64, i64) -> i64
      %171 = func.call @cc_nil_value() : () -> i64
      %172 = func.call @cc_cons(%170, %171) : (i64, i64) -> i64
      %173 = func.call @cc_values_pack(%172) : (i64) -> i64
      func.call @stack_push_pointer(%170) : (i64) -> ()
      %174 = llvm.mlir.addressof @str15 : !llvm.ptr
      %175 = arith.constant 6 : i64
      %176 = func.call @cc_make_string(%174, %175) : (!llvm.ptr, i64) -> i64
      %177 = func.call @cc_nil_value() : () -> i64
      %178 = func.call @cc_intern(%176, %177) : (i64, i64) -> i64
      %179 = func.call @cc_nil_value() : () -> i64
      %180 = func.call @cc_cons(%178, %179) : (i64, i64) -> i64
      %181 = func.call @cc_values_pack(%180) : (i64) -> i64
      func.call @stack_push_pointer(%178) : (i64) -> ()
      %182 = llvm.mlir.addressof @str16 : !llvm.ptr
      %183 = arith.constant 19 : i64
      %184 = func.call @cc_make_string(%182, %183) : (!llvm.ptr, i64) -> i64
      %185 = func.call @cc_nil_value() : () -> i64
      %186 = func.call @cc_intern(%184, %185) : (i64, i64) -> i64
      %187 = func.call @cc_nil_value() : () -> i64
      %188 = func.call @cc_cons(%186, %187) : (i64, i64) -> i64
      %189 = func.call @cc_values_pack(%188) : (i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      %190 = llvm.mlir.addressof @str17 : !llvm.ptr
      %191 = arith.constant 5 : i64
      %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
      %193 = llvm.mlir.addressof @str18 : !llvm.ptr
      %194 = arith.constant 11 : i64
      %195 = func.call @cc_make_string(%193, %194) : (!llvm.ptr, i64) -> i64
      %196 = func.call @cc_intern(%192, %195) : (i64, i64) -> i64
      %197 = func.call @cc_nil_value() : () -> i64
      %198 = func.call @cc_cons(%196, %197) : (i64, i64) -> i64
      %199 = func.call @cc_values_pack(%198) : (i64) -> i64
      func.call @stack_push_pointer(%196) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %200 = func.call @stack_pop_pointer() : () -> i64
      %201 = func.call @stack_pop_pointer() : () -> i64
      %202 = func.call @cc_cons(%201, %200) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %203 = arith.addi %202, %__rlasp_stack_elide_zero_4 : i64
      %204 = func.call @stack_pop_pointer() : () -> i64
      %205 = func.call @cc_cons(%204, %203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%205) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %206 = func.call @stack_pop_pointer() : () -> i64
      %207 = func.call @stack_pop_pointer() : () -> i64
      %208 = func.call @cc_cons(%207, %206) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %209 = arith.addi %208, %__rlasp_stack_elide_zero_5 : i64
      %210 = func.call @stack_pop_pointer() : () -> i64
      %211 = func.call @cc_cons(%210, %209) : (i64, i64) -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%213, %212) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %215 = arith.addi %214, %__rlasp_stack_elide_zero_6 : i64
      %216 = func.call @stack_pop_pointer() : () -> i64
      %217 = func.call @cc_cons(%216, %215) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %218 = arith.addi %217, %__rlasp_stack_elide_zero_7 : i64
      %219 = func.call @stack_pop_pointer() : () -> i64
      %220 = func.call @cc_cons(%219, %218) : (i64, i64) -> i64
      func.call @stack_push_pointer(%220) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %221 = func.call @stack_pop_pointer() : () -> i64
      %222 = func.call @stack_pop_pointer() : () -> i64
      %223 = func.call @cc_cons(%222, %221) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %224 = arith.addi %223, %__rlasp_stack_elide_zero_8 : i64
      %225 = func.call @stack_pop_pointer() : () -> i64
      %226 = func.call @cc_cons(%225, %224) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
      %227 = arith.addi %226, %__rlasp_stack_elide_zero_9 : i64
      %282 = arith.constant 51151114338306 : i64
      %283 = arith.constant 0 : i64
      %284 = func.call @cc_make_closure(%282, %283) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
      %285 = arith.addi %284, %__rlasp_stack_elide_zero_10 : i64
      %286 = llvm.mlir.addressof @str20 : !llvm.ptr
      %287 = arith.constant 4 : i64
      %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
      %289 = func.call @cc_nil_value() : () -> i64
      %290 = func.call @cc_intern(%288, %289) : (i64, i64) -> i64
      %291 = func.call @cc_nil_value() : () -> i64
      %292 = func.call @cc_cons(%290, %291) : (i64, i64) -> i64
      %293 = func.call @cc_values_pack(%292) : (i64) -> i64
      func.call @stack_push_pointer(%290) : (i64) -> ()
      %294 = llvm.mlir.addressof @str21 : !llvm.ptr
      %295 = arith.constant 10 : i64
      %296 = func.call @cc_make_string(%294, %295) : (!llvm.ptr, i64) -> i64
      %297 = llvm.mlir.addressof @str22 : !llvm.ptr
      %298 = arith.constant 11 : i64
      %299 = func.call @cc_make_string(%297, %298) : (!llvm.ptr, i64) -> i64
      %300 = func.call @cc_intern(%296, %299) : (i64, i64) -> i64
      %301 = func.call @cc_nil_value() : () -> i64
      %302 = func.call @cc_cons(%300, %301) : (i64, i64) -> i64
      %303 = func.call @cc_values_pack(%302) : (i64) -> i64
      func.call @stack_push_pointer(%300) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %304 = func.call @stack_pop_pointer() : () -> i64
      %305 = func.call @stack_pop_pointer() : () -> i64
      %306 = func.call @cc_cons(%305, %304) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
      %307 = arith.addi %306, %__rlasp_stack_elide_zero_11 : i64
      %308 = func.call @stack_pop_pointer() : () -> i64
      %309 = func.call @cc_cons(%308, %307) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %310 = arith.addi %309, %__rlasp_stack_elide_zero_12 : i64
      %311 = llvm.mlir.addressof @str23 : !llvm.ptr
      %312 = arith.constant 11 : i64
      %313 = func.call @cc_make_string(%311, %312) : (!llvm.ptr, i64) -> i64
      %314 = llvm.mlir.addressof @str24 : !llvm.ptr
      %315 = arith.constant 7 : i64
      %316 = func.call @cc_make_string(%314, %315) : (!llvm.ptr, i64) -> i64
      %317 = func.call @cc_intern(%313, %316) : (i64, i64) -> i64
      %318 = func.call @cc_nil_value() : () -> i64
      %319 = func.call @cc_cons(%317, %318) : (i64, i64) -> i64
      %320 = func.call @cc_values_pack(%319) : (i64) -> i64
      %321 = func.call @cc_nil_value() : () -> i64
      %322 = llvm.mlir.addressof @str25 : !llvm.ptr
      %323 = arith.constant 4 : i64
      %324 = func.call @cc_make_string(%322, %323) : (!llvm.ptr, i64) -> i64
      %325 = llvm.mlir.addressof @str26 : !llvm.ptr
      %326 = arith.constant 7 : i64
      %327 = func.call @cc_make_string(%325, %326) : (!llvm.ptr, i64) -> i64
      %328 = func.call @cc_intern(%324, %327) : (i64, i64) -> i64
      %329 = func.call @cc_nil_value() : () -> i64
      %330 = func.call @cc_cons(%328, %329) : (i64, i64) -> i64
      %331 = func.call @cc_values_pack(%330) : (i64) -> i64
      %332 = llvm.mlir.addressof @str27 : !llvm.ptr
      %333 = arith.constant 5 : i64
      %334 = func.call @cc_make_string(%332, %333) : (!llvm.ptr, i64) -> i64
      %335 = func.call @cc_nil_value() : () -> i64
      %336 = func.call @cc_intern(%334, %335) : (i64, i64) -> i64
      %337 = func.call @cc_nil_value() : () -> i64
      %338 = func.call @cc_cons(%336, %337) : (i64, i64) -> i64
      %339 = func.call @cc_values_pack(%338) : (i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %340 = arith.addi %336, %__rlasp_stack_elide_zero_13 : i64
      %341 = func.call @cc_nil_value() : () -> i64
      %342 = func.call @cc_errorp(%163) : (i64) -> i64
      %343 = arith.cmpi ne, %342, %341 : i64
      %344 = arith.cmpi eq, %341, %341 : i64
      %345 = arith.andi %343, %344 : i1
      %346 = scf.if %345 -> (i64) {
        scf.yield %163 : i64
      } else {
        scf.yield %341 : i64
      }
      %347 = func.call @cc_errorp(%227) : (i64) -> i64
      %348 = arith.cmpi ne, %347, %341 : i64
      %349 = arith.cmpi eq, %346, %341 : i64
      %350 = arith.andi %348, %349 : i1
      %351 = scf.if %350 -> (i64) {
        scf.yield %227 : i64
      } else {
        scf.yield %346 : i64
      }
      %352 = func.call @cc_errorp(%285) : (i64) -> i64
      %353 = arith.cmpi ne, %352, %341 : i64
      %354 = arith.cmpi eq, %351, %341 : i64
      %355 = arith.andi %353, %354 : i1
      %356 = scf.if %355 -> (i64) {
        scf.yield %285 : i64
      } else {
        scf.yield %351 : i64
      }
      %357 = func.call @cc_errorp(%310) : (i64) -> i64
      %358 = arith.cmpi ne, %357, %341 : i64
      %359 = arith.cmpi eq, %356, %341 : i64
      %360 = arith.andi %358, %359 : i1
      %361 = scf.if %360 -> (i64) {
        scf.yield %310 : i64
      } else {
        scf.yield %356 : i64
      }
      %362 = func.call @cc_errorp(%317) : (i64) -> i64
      %363 = arith.cmpi ne, %362, %341 : i64
      %364 = arith.cmpi eq, %361, %341 : i64
      %365 = arith.andi %363, %364 : i1
      %366 = scf.if %365 -> (i64) {
        scf.yield %317 : i64
      } else {
        scf.yield %361 : i64
      }
      %367 = func.call @cc_errorp(%321) : (i64) -> i64
      %368 = arith.cmpi ne, %367, %341 : i64
      %369 = arith.cmpi eq, %366, %341 : i64
      %370 = arith.andi %368, %369 : i1
      %371 = scf.if %370 -> (i64) {
        scf.yield %321 : i64
      } else {
        scf.yield %366 : i64
      }
      %372 = func.call @cc_errorp(%328) : (i64) -> i64
      %373 = arith.cmpi ne, %372, %341 : i64
      %374 = arith.cmpi eq, %371, %341 : i64
      %375 = arith.andi %373, %374 : i1
      %376 = scf.if %375 -> (i64) {
        scf.yield %328 : i64
      } else {
        scf.yield %371 : i64
      }
      %377 = func.call @cc_errorp(%340) : (i64) -> i64
      %378 = arith.cmpi ne, %377, %341 : i64
      %379 = arith.cmpi eq, %376, %341 : i64
      %380 = arith.andi %378, %379 : i1
      %381 = scf.if %380 -> (i64) {
        scf.yield %340 : i64
      } else {
        scf.yield %376 : i64
      }
      %382 = arith.cmpi ne, %381, %341 : i64
      scf.if %382 {
        func.call @stack_push_pointer(%381) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%163) : (i64) -> ()
        func.call @stack_push_pointer(%227) : (i64) -> ()
        func.call @stack_push_pointer(%285) : (i64) -> ()
        func.call @stack_push_pointer(%310) : (i64) -> ()
        func.call @stack_push_pointer(%317) : (i64) -> ()
        func.call @stack_push_pointer(%321) : (i64) -> ()
        func.call @stack_push_pointer(%328) : (i64) -> ()
        func.call @stack_push_pointer(%340) : (i64) -> ()
        %383 = llvm.mlir.addressof @str28 : !llvm.ptr
        %384 = func.call @cc_make_function_ref_const(%383) : (!llvm.ptr) -> i64
        %385 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%384, %385) : (i64, i64) -> ()
      }
      %386 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %386 : i64
    }
    %387 = func.call @cc_nil_value() : () -> i64
    %388 = func.call @cc_errorp(%154) : (i64) -> i64
    %389 = arith.cmpi ne, %388, %387 : i64
    %390 = scf.if %389 -> (i64) {
      scf.yield %154 : i64
    } else {
      %391 = llvm.mlir.addressof @str29 : !llvm.ptr
      %392 = arith.constant 7 : i64
      %393 = func.call @cc_make_string(%391, %392) : (!llvm.ptr, i64) -> i64
      %394 = func.call @cc_nil_value() : () -> i64
      %395 = func.call @cc_intern(%393, %394) : (i64, i64) -> i64
      %396 = func.call @cc_nil_value() : () -> i64
      %397 = func.call @cc_cons(%395, %396) : (i64, i64) -> i64
      %398 = func.call @cc_values_pack(%397) : (i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %399 = arith.addi %395, %__rlasp_stack_elide_zero_14 : i64
      %400 = llvm.mlir.addressof @str30 : !llvm.ptr
      %401 = arith.constant 13 : i64
      %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
      %403 = llvm.mlir.addressof @str31 : !llvm.ptr
      %404 = arith.constant 11 : i64
      %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
      %406 = func.call @cc_intern(%402, %405) : (i64, i64) -> i64
      %407 = func.call @cc_nil_value() : () -> i64
      %408 = func.call @cc_cons(%406, %407) : (i64, i64) -> i64
      %409 = func.call @cc_values_pack(%408) : (i64) -> i64
      func.call @stack_push_pointer(%406) : (i64) -> ()
      %410 = llvm.mlir.addressof @str32 : !llvm.ptr
      %411 = arith.constant 6 : i64
      %412 = func.call @cc_make_string(%410, %411) : (!llvm.ptr, i64) -> i64
      %413 = func.call @cc_nil_value() : () -> i64
      %414 = func.call @cc_intern(%412, %413) : (i64, i64) -> i64
      %415 = func.call @cc_nil_value() : () -> i64
      %416 = func.call @cc_cons(%414, %415) : (i64, i64) -> i64
      %417 = func.call @cc_values_pack(%416) : (i64) -> i64
      func.call @stack_push_pointer(%414) : (i64) -> ()
      %418 = llvm.mlir.addressof @str33 : !llvm.ptr
      %419 = arith.constant 19 : i64
      %420 = func.call @cc_make_string(%418, %419) : (!llvm.ptr, i64) -> i64
      %421 = func.call @cc_nil_value() : () -> i64
      %422 = func.call @cc_intern(%420, %421) : (i64, i64) -> i64
      %423 = func.call @cc_nil_value() : () -> i64
      %424 = func.call @cc_cons(%422, %423) : (i64, i64) -> i64
      %425 = func.call @cc_values_pack(%424) : (i64) -> i64
      func.call @stack_push_pointer(%422) : (i64) -> ()
      %426 = llvm.mlir.addressof @str34 : !llvm.ptr
      %427 = arith.constant 5 : i64
      %428 = func.call @cc_make_string(%426, %427) : (!llvm.ptr, i64) -> i64
      %429 = llvm.mlir.addressof @str35 : !llvm.ptr
      %430 = arith.constant 11 : i64
      %431 = func.call @cc_make_string(%429, %430) : (!llvm.ptr, i64) -> i64
      %432 = func.call @cc_intern(%428, %431) : (i64, i64) -> i64
      %433 = func.call @cc_nil_value() : () -> i64
      %434 = func.call @cc_cons(%432, %433) : (i64, i64) -> i64
      %435 = func.call @cc_values_pack(%434) : (i64) -> i64
      func.call @stack_push_pointer(%432) : (i64) -> ()
      %436 = arith.constant 32 : i64
      %437 = func.call @cc_box_character(%436) : (i64) -> i64
      func.call @stack_push_pointer(%437) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @stack_pop_pointer() : () -> i64
      %440 = func.call @cc_cons(%439, %438) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %441 = arith.addi %440, %__rlasp_stack_elide_zero_15 : i64
      %442 = func.call @stack_pop_pointer() : () -> i64
      %443 = func.call @cc_cons(%442, %441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%443) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %444 = func.call @stack_pop_pointer() : () -> i64
      %445 = func.call @stack_pop_pointer() : () -> i64
      %446 = func.call @cc_cons(%445, %444) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %447 = arith.addi %446, %__rlasp_stack_elide_zero_16 : i64
      %448 = func.call @stack_pop_pointer() : () -> i64
      %449 = func.call @cc_cons(%448, %447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%449) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %450 = func.call @stack_pop_pointer() : () -> i64
      %451 = func.call @stack_pop_pointer() : () -> i64
      %452 = func.call @cc_cons(%451, %450) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %453 = arith.addi %452, %__rlasp_stack_elide_zero_17 : i64
      %454 = func.call @stack_pop_pointer() : () -> i64
      %455 = func.call @cc_cons(%454, %453) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %456 = arith.addi %455, %__rlasp_stack_elide_zero_18 : i64
      %457 = func.call @stack_pop_pointer() : () -> i64
      %458 = func.call @cc_cons(%457, %456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%458) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %459 = func.call @stack_pop_pointer() : () -> i64
      %460 = func.call @stack_pop_pointer() : () -> i64
      %461 = func.call @cc_cons(%460, %459) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %462 = arith.addi %461, %__rlasp_stack_elide_zero_19 : i64
      %463 = func.call @stack_pop_pointer() : () -> i64
      %464 = func.call @cc_cons(%463, %462) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %465 = arith.addi %464, %__rlasp_stack_elide_zero_20 : i64
      %521 = arith.constant 51151114338307 : i64
      %522 = arith.constant 0 : i64
      %523 = func.call @cc_make_closure(%521, %522) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %524 = arith.addi %523, %__rlasp_stack_elide_zero_21 : i64
      %525 = llvm.mlir.addressof @str37 : !llvm.ptr
      %526 = arith.constant 4 : i64
      %527 = func.call @cc_make_string(%525, %526) : (!llvm.ptr, i64) -> i64
      %528 = func.call @cc_nil_value() : () -> i64
      %529 = func.call @cc_intern(%527, %528) : (i64, i64) -> i64
      %530 = func.call @cc_nil_value() : () -> i64
      %531 = func.call @cc_cons(%529, %530) : (i64, i64) -> i64
      %532 = func.call @cc_values_pack(%531) : (i64) -> i64
      func.call @stack_push_pointer(%529) : (i64) -> ()
      %533 = llvm.mlir.addressof @str38 : !llvm.ptr
      %534 = arith.constant 10 : i64
      %535 = func.call @cc_make_string(%533, %534) : (!llvm.ptr, i64) -> i64
      %536 = llvm.mlir.addressof @str39 : !llvm.ptr
      %537 = arith.constant 11 : i64
      %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
      %539 = func.call @cc_intern(%535, %538) : (i64, i64) -> i64
      %540 = func.call @cc_nil_value() : () -> i64
      %541 = func.call @cc_cons(%539, %540) : (i64, i64) -> i64
      %542 = func.call @cc_values_pack(%541) : (i64) -> i64
      func.call @stack_push_pointer(%539) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %543 = func.call @stack_pop_pointer() : () -> i64
      %544 = func.call @stack_pop_pointer() : () -> i64
      %545 = func.call @cc_cons(%544, %543) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %546 = arith.addi %545, %__rlasp_stack_elide_zero_22 : i64
      %547 = func.call @stack_pop_pointer() : () -> i64
      %548 = func.call @cc_cons(%547, %546) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %549 = arith.addi %548, %__rlasp_stack_elide_zero_23 : i64
      %550 = llvm.mlir.addressof @str40 : !llvm.ptr
      %551 = arith.constant 11 : i64
      %552 = func.call @cc_make_string(%550, %551) : (!llvm.ptr, i64) -> i64
      %553 = llvm.mlir.addressof @str41 : !llvm.ptr
      %554 = arith.constant 7 : i64
      %555 = func.call @cc_make_string(%553, %554) : (!llvm.ptr, i64) -> i64
      %556 = func.call @cc_intern(%552, %555) : (i64, i64) -> i64
      %557 = func.call @cc_nil_value() : () -> i64
      %558 = func.call @cc_cons(%556, %557) : (i64, i64) -> i64
      %559 = func.call @cc_values_pack(%558) : (i64) -> i64
      %560 = func.call @cc_nil_value() : () -> i64
      %561 = llvm.mlir.addressof @str42 : !llvm.ptr
      %562 = arith.constant 4 : i64
      %563 = func.call @cc_make_string(%561, %562) : (!llvm.ptr, i64) -> i64
      %564 = llvm.mlir.addressof @str43 : !llvm.ptr
      %565 = arith.constant 7 : i64
      %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
      %567 = func.call @cc_intern(%563, %566) : (i64, i64) -> i64
      %568 = func.call @cc_nil_value() : () -> i64
      %569 = func.call @cc_cons(%567, %568) : (i64, i64) -> i64
      %570 = func.call @cc_values_pack(%569) : (i64) -> i64
      %571 = llvm.mlir.addressof @str44 : !llvm.ptr
      %572 = arith.constant 5 : i64
      %573 = func.call @cc_make_string(%571, %572) : (!llvm.ptr, i64) -> i64
      %574 = func.call @cc_nil_value() : () -> i64
      %575 = func.call @cc_intern(%573, %574) : (i64, i64) -> i64
      %576 = func.call @cc_nil_value() : () -> i64
      %577 = func.call @cc_cons(%575, %576) : (i64, i64) -> i64
      %578 = func.call @cc_values_pack(%577) : (i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %579 = arith.addi %575, %__rlasp_stack_elide_zero_24 : i64
      %580 = func.call @cc_nil_value() : () -> i64
      %581 = func.call @cc_errorp(%399) : (i64) -> i64
      %582 = arith.cmpi ne, %581, %580 : i64
      %583 = arith.cmpi eq, %580, %580 : i64
      %584 = arith.andi %582, %583 : i1
      %585 = scf.if %584 -> (i64) {
        scf.yield %399 : i64
      } else {
        scf.yield %580 : i64
      }
      %586 = func.call @cc_errorp(%465) : (i64) -> i64
      %587 = arith.cmpi ne, %586, %580 : i64
      %588 = arith.cmpi eq, %585, %580 : i64
      %589 = arith.andi %587, %588 : i1
      %590 = scf.if %589 -> (i64) {
        scf.yield %465 : i64
      } else {
        scf.yield %585 : i64
      }
      %591 = func.call @cc_errorp(%524) : (i64) -> i64
      %592 = arith.cmpi ne, %591, %580 : i64
      %593 = arith.cmpi eq, %590, %580 : i64
      %594 = arith.andi %592, %593 : i1
      %595 = scf.if %594 -> (i64) {
        scf.yield %524 : i64
      } else {
        scf.yield %590 : i64
      }
      %596 = func.call @cc_errorp(%549) : (i64) -> i64
      %597 = arith.cmpi ne, %596, %580 : i64
      %598 = arith.cmpi eq, %595, %580 : i64
      %599 = arith.andi %597, %598 : i1
      %600 = scf.if %599 -> (i64) {
        scf.yield %549 : i64
      } else {
        scf.yield %595 : i64
      }
      %601 = func.call @cc_errorp(%556) : (i64) -> i64
      %602 = arith.cmpi ne, %601, %580 : i64
      %603 = arith.cmpi eq, %600, %580 : i64
      %604 = arith.andi %602, %603 : i1
      %605 = scf.if %604 -> (i64) {
        scf.yield %556 : i64
      } else {
        scf.yield %600 : i64
      }
      %606 = func.call @cc_errorp(%560) : (i64) -> i64
      %607 = arith.cmpi ne, %606, %580 : i64
      %608 = arith.cmpi eq, %605, %580 : i64
      %609 = arith.andi %607, %608 : i1
      %610 = scf.if %609 -> (i64) {
        scf.yield %560 : i64
      } else {
        scf.yield %605 : i64
      }
      %611 = func.call @cc_errorp(%567) : (i64) -> i64
      %612 = arith.cmpi ne, %611, %580 : i64
      %613 = arith.cmpi eq, %610, %580 : i64
      %614 = arith.andi %612, %613 : i1
      %615 = scf.if %614 -> (i64) {
        scf.yield %567 : i64
      } else {
        scf.yield %610 : i64
      }
      %616 = func.call @cc_errorp(%579) : (i64) -> i64
      %617 = arith.cmpi ne, %616, %580 : i64
      %618 = arith.cmpi eq, %615, %580 : i64
      %619 = arith.andi %617, %618 : i1
      %620 = scf.if %619 -> (i64) {
        scf.yield %579 : i64
      } else {
        scf.yield %615 : i64
      }
      %621 = arith.cmpi ne, %620, %580 : i64
      scf.if %621 {
        func.call @stack_push_pointer(%620) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%399) : (i64) -> ()
        func.call @stack_push_pointer(%465) : (i64) -> ()
        func.call @stack_push_pointer(%524) : (i64) -> ()
        func.call @stack_push_pointer(%549) : (i64) -> ()
        func.call @stack_push_pointer(%556) : (i64) -> ()
        func.call @stack_push_pointer(%560) : (i64) -> ()
        func.call @stack_push_pointer(%567) : (i64) -> ()
        func.call @stack_push_pointer(%579) : (i64) -> ()
        %622 = llvm.mlir.addressof @str45 : !llvm.ptr
        %623 = func.call @cc_make_function_ref_const(%622) : (!llvm.ptr) -> i64
        %624 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%623, %624) : (i64, i64) -> ()
      }
      %625 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %625 : i64
    }
    %626 = func.call @cc_nil_value() : () -> i64
    %627 = func.call @cc_errorp(%390) : (i64) -> i64
    %628 = arith.cmpi ne, %627, %626 : i64
    %629 = scf.if %628 -> (i64) {
      scf.yield %390 : i64
    } else {
      %630 = llvm.mlir.addressof @str46 : !llvm.ptr
      %631 = arith.constant 7 : i64
      %632 = func.call @cc_make_string(%630, %631) : (!llvm.ptr, i64) -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_intern(%632, %633) : (i64, i64) -> i64
      %635 = func.call @cc_nil_value() : () -> i64
      %636 = func.call @cc_cons(%634, %635) : (i64, i64) -> i64
      %637 = func.call @cc_values_pack(%636) : (i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %638 = arith.addi %634, %__rlasp_stack_elide_zero_25 : i64
      %639 = llvm.mlir.addressof @str47 : !llvm.ptr
      %640 = arith.constant 13 : i64
      %641 = func.call @cc_make_string(%639, %640) : (!llvm.ptr, i64) -> i64
      %642 = llvm.mlir.addressof @str48 : !llvm.ptr
      %643 = arith.constant 11 : i64
      %644 = func.call @cc_make_string(%642, %643) : (!llvm.ptr, i64) -> i64
      %645 = func.call @cc_intern(%641, %644) : (i64, i64) -> i64
      %646 = func.call @cc_nil_value() : () -> i64
      %647 = func.call @cc_cons(%645, %646) : (i64, i64) -> i64
      %648 = func.call @cc_values_pack(%647) : (i64) -> i64
      func.call @stack_push_pointer(%645) : (i64) -> ()
      %649 = llvm.mlir.addressof @str49 : !llvm.ptr
      %650 = arith.constant 6 : i64
      %651 = func.call @cc_make_string(%649, %650) : (!llvm.ptr, i64) -> i64
      %652 = func.call @cc_nil_value() : () -> i64
      %653 = func.call @cc_intern(%651, %652) : (i64, i64) -> i64
      %654 = func.call @cc_nil_value() : () -> i64
      %655 = func.call @cc_cons(%653, %654) : (i64, i64) -> i64
      %656 = func.call @cc_values_pack(%655) : (i64) -> i64
      func.call @stack_push_pointer(%653) : (i64) -> ()
      %657 = llvm.mlir.addressof @str50 : !llvm.ptr
      %658 = arith.constant 19 : i64
      %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
      %660 = func.call @cc_nil_value() : () -> i64
      %661 = func.call @cc_intern(%659, %660) : (i64, i64) -> i64
      %662 = func.call @cc_nil_value() : () -> i64
      %663 = func.call @cc_cons(%661, %662) : (i64, i64) -> i64
      %664 = func.call @cc_values_pack(%663) : (i64) -> i64
      func.call @stack_push_pointer(%661) : (i64) -> ()
      %665 = llvm.mlir.addressof @str51 : !llvm.ptr
      %666 = arith.constant 5 : i64
      %667 = func.call @cc_make_string(%665, %666) : (!llvm.ptr, i64) -> i64
      %668 = llvm.mlir.addressof @str52 : !llvm.ptr
      %669 = arith.constant 11 : i64
      %670 = func.call @cc_make_string(%668, %669) : (!llvm.ptr, i64) -> i64
      %671 = func.call @cc_intern(%667, %670) : (i64, i64) -> i64
      %672 = func.call @cc_nil_value() : () -> i64
      %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
      %674 = func.call @cc_values_pack(%673) : (i64) -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      %675 = arith.constant -1 : i64
      func.call @stack_push_fixnum(%675) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %676 = func.call @stack_pop_pointer() : () -> i64
      %677 = func.call @stack_pop_pointer() : () -> i64
      %678 = func.call @cc_cons(%677, %676) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %679 = arith.addi %678, %__rlasp_stack_elide_zero_26 : i64
      %680 = func.call @stack_pop_pointer() : () -> i64
      %681 = func.call @cc_cons(%680, %679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%681) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @cc_cons(%683, %682) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %685 = arith.addi %684, %__rlasp_stack_elide_zero_27 : i64
      %686 = func.call @stack_pop_pointer() : () -> i64
      %687 = func.call @cc_cons(%686, %685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%687) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %688 = func.call @stack_pop_pointer() : () -> i64
      %689 = func.call @stack_pop_pointer() : () -> i64
      %690 = func.call @cc_cons(%689, %688) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %691 = arith.addi %690, %__rlasp_stack_elide_zero_28 : i64
      %692 = func.call @stack_pop_pointer() : () -> i64
      %693 = func.call @cc_cons(%692, %691) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %694 = arith.addi %693, %__rlasp_stack_elide_zero_29 : i64
      %695 = func.call @stack_pop_pointer() : () -> i64
      %696 = func.call @cc_cons(%695, %694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%696) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %697 = func.call @stack_pop_pointer() : () -> i64
      %698 = func.call @stack_pop_pointer() : () -> i64
      %699 = func.call @cc_cons(%698, %697) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %700 = arith.addi %699, %__rlasp_stack_elide_zero_30 : i64
      %701 = func.call @stack_pop_pointer() : () -> i64
      %702 = func.call @cc_cons(%701, %700) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %703 = arith.addi %702, %__rlasp_stack_elide_zero_31 : i64
      %759 = arith.constant 51151114338308 : i64
      %760 = arith.constant 0 : i64
      %761 = func.call @cc_make_closure(%759, %760) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %762 = arith.addi %761, %__rlasp_stack_elide_zero_32 : i64
      %763 = llvm.mlir.addressof @str54 : !llvm.ptr
      %764 = arith.constant 4 : i64
      %765 = func.call @cc_make_string(%763, %764) : (!llvm.ptr, i64) -> i64
      %766 = func.call @cc_nil_value() : () -> i64
      %767 = func.call @cc_intern(%765, %766) : (i64, i64) -> i64
      %768 = func.call @cc_nil_value() : () -> i64
      %769 = func.call @cc_cons(%767, %768) : (i64, i64) -> i64
      %770 = func.call @cc_values_pack(%769) : (i64) -> i64
      func.call @stack_push_pointer(%767) : (i64) -> ()
      %771 = llvm.mlir.addressof @str55 : !llvm.ptr
      %772 = arith.constant 10 : i64
      %773 = func.call @cc_make_string(%771, %772) : (!llvm.ptr, i64) -> i64
      %774 = llvm.mlir.addressof @str56 : !llvm.ptr
      %775 = arith.constant 11 : i64
      %776 = func.call @cc_make_string(%774, %775) : (!llvm.ptr, i64) -> i64
      %777 = func.call @cc_intern(%773, %776) : (i64, i64) -> i64
      %778 = func.call @cc_nil_value() : () -> i64
      %779 = func.call @cc_cons(%777, %778) : (i64, i64) -> i64
      %780 = func.call @cc_values_pack(%779) : (i64) -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %781 = func.call @stack_pop_pointer() : () -> i64
      %782 = func.call @stack_pop_pointer() : () -> i64
      %783 = func.call @cc_cons(%782, %781) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %784 = arith.addi %783, %__rlasp_stack_elide_zero_33 : i64
      %785 = func.call @stack_pop_pointer() : () -> i64
      %786 = func.call @cc_cons(%785, %784) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %787 = arith.addi %786, %__rlasp_stack_elide_zero_34 : i64
      %788 = llvm.mlir.addressof @str57 : !llvm.ptr
      %789 = arith.constant 11 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      %791 = llvm.mlir.addressof @str58 : !llvm.ptr
      %792 = arith.constant 7 : i64
      %793 = func.call @cc_make_string(%791, %792) : (!llvm.ptr, i64) -> i64
      %794 = func.call @cc_intern(%790, %793) : (i64, i64) -> i64
      %795 = func.call @cc_nil_value() : () -> i64
      %796 = func.call @cc_cons(%794, %795) : (i64, i64) -> i64
      %797 = func.call @cc_values_pack(%796) : (i64) -> i64
      %798 = func.call @cc_nil_value() : () -> i64
      %799 = llvm.mlir.addressof @str59 : !llvm.ptr
      %800 = arith.constant 4 : i64
      %801 = func.call @cc_make_string(%799, %800) : (!llvm.ptr, i64) -> i64
      %802 = llvm.mlir.addressof @str60 : !llvm.ptr
      %803 = arith.constant 7 : i64
      %804 = func.call @cc_make_string(%802, %803) : (!llvm.ptr, i64) -> i64
      %805 = func.call @cc_intern(%801, %804) : (i64, i64) -> i64
      %806 = func.call @cc_nil_value() : () -> i64
      %807 = func.call @cc_cons(%805, %806) : (i64, i64) -> i64
      %808 = func.call @cc_values_pack(%807) : (i64) -> i64
      %809 = llvm.mlir.addressof @str61 : !llvm.ptr
      %810 = arith.constant 5 : i64
      %811 = func.call @cc_make_string(%809, %810) : (!llvm.ptr, i64) -> i64
      %812 = func.call @cc_nil_value() : () -> i64
      %813 = func.call @cc_intern(%811, %812) : (i64, i64) -> i64
      %814 = func.call @cc_nil_value() : () -> i64
      %815 = func.call @cc_cons(%813, %814) : (i64, i64) -> i64
      %816 = func.call @cc_values_pack(%815) : (i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %817 = arith.addi %813, %__rlasp_stack_elide_zero_35 : i64
      %818 = func.call @cc_nil_value() : () -> i64
      %819 = func.call @cc_errorp(%638) : (i64) -> i64
      %820 = arith.cmpi ne, %819, %818 : i64
      %821 = arith.cmpi eq, %818, %818 : i64
      %822 = arith.andi %820, %821 : i1
      %823 = scf.if %822 -> (i64) {
        scf.yield %638 : i64
      } else {
        scf.yield %818 : i64
      }
      %824 = func.call @cc_errorp(%703) : (i64) -> i64
      %825 = arith.cmpi ne, %824, %818 : i64
      %826 = arith.cmpi eq, %823, %818 : i64
      %827 = arith.andi %825, %826 : i1
      %828 = scf.if %827 -> (i64) {
        scf.yield %703 : i64
      } else {
        scf.yield %823 : i64
      }
      %829 = func.call @cc_errorp(%762) : (i64) -> i64
      %830 = arith.cmpi ne, %829, %818 : i64
      %831 = arith.cmpi eq, %828, %818 : i64
      %832 = arith.andi %830, %831 : i1
      %833 = scf.if %832 -> (i64) {
        scf.yield %762 : i64
      } else {
        scf.yield %828 : i64
      }
      %834 = func.call @cc_errorp(%787) : (i64) -> i64
      %835 = arith.cmpi ne, %834, %818 : i64
      %836 = arith.cmpi eq, %833, %818 : i64
      %837 = arith.andi %835, %836 : i1
      %838 = scf.if %837 -> (i64) {
        scf.yield %787 : i64
      } else {
        scf.yield %833 : i64
      }
      %839 = func.call @cc_errorp(%794) : (i64) -> i64
      %840 = arith.cmpi ne, %839, %818 : i64
      %841 = arith.cmpi eq, %838, %818 : i64
      %842 = arith.andi %840, %841 : i1
      %843 = scf.if %842 -> (i64) {
        scf.yield %794 : i64
      } else {
        scf.yield %838 : i64
      }
      %844 = func.call @cc_errorp(%798) : (i64) -> i64
      %845 = arith.cmpi ne, %844, %818 : i64
      %846 = arith.cmpi eq, %843, %818 : i64
      %847 = arith.andi %845, %846 : i1
      %848 = scf.if %847 -> (i64) {
        scf.yield %798 : i64
      } else {
        scf.yield %843 : i64
      }
      %849 = func.call @cc_errorp(%805) : (i64) -> i64
      %850 = arith.cmpi ne, %849, %818 : i64
      %851 = arith.cmpi eq, %848, %818 : i64
      %852 = arith.andi %850, %851 : i1
      %853 = scf.if %852 -> (i64) {
        scf.yield %805 : i64
      } else {
        scf.yield %848 : i64
      }
      %854 = func.call @cc_errorp(%817) : (i64) -> i64
      %855 = arith.cmpi ne, %854, %818 : i64
      %856 = arith.cmpi eq, %853, %818 : i64
      %857 = arith.andi %855, %856 : i1
      %858 = scf.if %857 -> (i64) {
        scf.yield %817 : i64
      } else {
        scf.yield %853 : i64
      }
      %859 = arith.cmpi ne, %858, %818 : i64
      scf.if %859 {
        func.call @stack_push_pointer(%858) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%638) : (i64) -> ()
        func.call @stack_push_pointer(%703) : (i64) -> ()
        func.call @stack_push_pointer(%762) : (i64) -> ()
        func.call @stack_push_pointer(%787) : (i64) -> ()
        func.call @stack_push_pointer(%794) : (i64) -> ()
        func.call @stack_push_pointer(%798) : (i64) -> ()
        func.call @stack_push_pointer(%805) : (i64) -> ()
        func.call @stack_push_pointer(%817) : (i64) -> ()
        %860 = llvm.mlir.addressof @str62 : !llvm.ptr
        %861 = func.call @cc_make_function_ref_const(%860) : (!llvm.ptr) -> i64
        %862 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%861, %862) : (i64, i64) -> ()
      }
      %863 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %863 : i64
    }
    %864 = func.call @cc_nil_value() : () -> i64
    %865 = func.call @cc_errorp(%629) : (i64) -> i64
    %866 = arith.cmpi ne, %865, %864 : i64
    %867 = scf.if %866 -> (i64) {
      scf.yield %629 : i64
    } else {
      %868 = llvm.mlir.addressof @str63 : !llvm.ptr
      %869 = arith.constant 8 : i64
      %870 = func.call @cc_make_string(%868, %869) : (!llvm.ptr, i64) -> i64
      %871 = func.call @cc_nil_value() : () -> i64
      %872 = func.call @cc_intern(%870, %871) : (i64, i64) -> i64
      %873 = func.call @cc_nil_value() : () -> i64
      %874 = func.call @cc_cons(%872, %873) : (i64, i64) -> i64
      %875 = func.call @cc_values_pack(%874) : (i64) -> i64
      func.call @stack_push_pointer(%872) : (i64) -> ()
      %942 = arith.constant 51151114338309 : i64
      %943 = arith.constant 0 : i64
      %944 = func.call @cc_make_closure(%942, %943) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %945 = arith.addi %944, %__rlasp_stack_elide_zero_36 : i64
      %946 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%945) : (i64) -> ()
      func.call @stack_push_pointer(%946) : (i64) -> ()
      %947 = llvm.mlir.addressof @str65 : !llvm.ptr
      %948 = func.call @cc_make_function_ref_const(%947) : (!llvm.ptr) -> i64
      %949 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%948, %949) : (i64, i64) -> ()
      %950 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %950 : i64
    }
    %951 = func.call @cc_nil_value() : () -> i64
    %952 = func.call @cc_errorp(%867) : (i64) -> i64
    %953 = arith.cmpi ne, %952, %951 : i64
    %954 = scf.if %953 -> (i64) {
      scf.yield %867 : i64
    } else {
      %955 = llvm.mlir.addressof @str66 : !llvm.ptr
      %956 = arith.constant 35 : i64
      %957 = func.call @cc_make_string(%955, %956) : (!llvm.ptr, i64) -> i64
      %958 = func.call @cc_nil_value() : () -> i64
      %959 = func.call @cc_intern(%957, %958) : (i64, i64) -> i64
      %960 = func.call @cc_nil_value() : () -> i64
      %961 = func.call @cc_cons(%959, %960) : (i64, i64) -> i64
      %962 = func.call @cc_values_pack(%961) : (i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %963 = arith.addi %959, %__rlasp_stack_elide_zero_37 : i64
      %964 = llvm.mlir.addressof @str67 : !llvm.ptr
      %965 = arith.constant 5 : i64
      %966 = func.call @cc_make_string(%964, %965) : (!llvm.ptr, i64) -> i64
      %967 = func.call @cc_nil_value() : () -> i64
      %968 = func.call @cc_intern(%966, %967) : (i64, i64) -> i64
      %969 = func.call @cc_nil_value() : () -> i64
      %970 = func.call @cc_cons(%968, %969) : (i64, i64) -> i64
      %971 = func.call @cc_values_pack(%970) : (i64) -> i64
      func.call @stack_push_pointer(%968) : (i64) -> ()
      %972 = llvm.mlir.addressof @str68 : !llvm.ptr
      %973 = arith.constant 4 : i64
      %974 = func.call @cc_make_string(%972, %973) : (!llvm.ptr, i64) -> i64
      %975 = llvm.mlir.addressof @str69 : !llvm.ptr
      %976 = arith.constant 11 : i64
      %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
      %978 = func.call @cc_intern(%974, %977) : (i64, i64) -> i64
      %979 = func.call @cc_nil_value() : () -> i64
      %980 = func.call @cc_cons(%978, %979) : (i64, i64) -> i64
      %981 = func.call @cc_values_pack(%980) : (i64) -> i64
      func.call @stack_push_pointer(%978) : (i64) -> ()
      %982 = llvm.mlir.addressof @str70 : !llvm.ptr
      %983 = arith.constant 13 : i64
      %984 = func.call @cc_make_string(%982, %983) : (!llvm.ptr, i64) -> i64
      %985 = llvm.mlir.addressof @str71 : !llvm.ptr
      %986 = arith.constant 11 : i64
      %987 = func.call @cc_make_string(%985, %986) : (!llvm.ptr, i64) -> i64
      %988 = func.call @cc_intern(%984, %987) : (i64, i64) -> i64
      %989 = func.call @cc_nil_value() : () -> i64
      %990 = func.call @cc_cons(%988, %989) : (i64, i64) -> i64
      %991 = func.call @cc_values_pack(%990) : (i64) -> i64
      func.call @stack_push_pointer(%988) : (i64) -> ()
      %992 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%992) : (i64) -> ()
      %993 = llvm.mlir.addressof @str72 : !llvm.ptr
      %994 = arith.constant 8 : i64
      %995 = func.call @cc_make_string(%993, %994) : (!llvm.ptr, i64) -> i64
      %996 = func.call @cc_nil_value() : () -> i64
      %997 = func.call @cc_intern(%995, %996) : (i64, i64) -> i64
      %998 = func.call @cc_nil_value() : () -> i64
      %999 = func.call @cc_cons(%997, %998) : (i64, i64) -> i64
      %1000 = func.call @cc_values_pack(%999) : (i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %1001 = arith.addi %997, %__rlasp_stack_elide_zero_38 : i64
      %1002 = func.call @stack_pop_pointer() : () -> i64
      %1003 = func.call @cc_cons(%1001, %1002) : (i64, i64) -> i64
      %1004 = llvm.mlir.addressof @str73 : !llvm.ptr
      %1005 = arith.constant 5 : i64
      %1006 = func.call @cc_make_string(%1004, %1005) : (!llvm.ptr, i64) -> i64
      %1007 = func.call @cc_nil_value() : () -> i64
      %1008 = func.call @cc_intern(%1006, %1007) : (i64, i64) -> i64
      %1009 = func.call @cc_nil_value() : () -> i64
      %1010 = func.call @cc_cons(%1008, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_values_pack(%1010) : (i64) -> i64
      %1012 = func.call @cc_cons(%1008, %1003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1012) : (i64) -> ()
      %1013 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1013) : (i64) -> ()
      %1014 = llvm.mlir.addressof @str74 : !llvm.ptr
      %1015 = arith.constant 14 : i64
      %1016 = func.call @cc_make_string(%1014, %1015) : (!llvm.ptr, i64) -> i64
      %1017 = llvm.mlir.addressof @str75 : !llvm.ptr
      %1018 = arith.constant 11 : i64
      %1019 = func.call @cc_make_string(%1017, %1018) : (!llvm.ptr, i64) -> i64
      %1020 = func.call @cc_intern(%1016, %1019) : (i64, i64) -> i64
      %1021 = func.call @cc_nil_value() : () -> i64
      %1022 = func.call @cc_cons(%1020, %1021) : (i64, i64) -> i64
      %1023 = func.call @cc_values_pack(%1022) : (i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %1024 = arith.addi %1020, %__rlasp_stack_elide_zero_39 : i64
      %1025 = func.call @stack_pop_pointer() : () -> i64
      %1026 = func.call @cc_cons(%1024, %1025) : (i64, i64) -> i64
      %1027 = llvm.mlir.addressof @str76 : !llvm.ptr
      %1028 = arith.constant 5 : i64
      %1029 = func.call @cc_make_string(%1027, %1028) : (!llvm.ptr, i64) -> i64
      %1030 = func.call @cc_nil_value() : () -> i64
      %1031 = func.call @cc_intern(%1029, %1030) : (i64, i64) -> i64
      %1032 = func.call @cc_nil_value() : () -> i64
      %1033 = func.call @cc_cons(%1031, %1032) : (i64, i64) -> i64
      %1034 = func.call @cc_values_pack(%1033) : (i64) -> i64
      %1035 = func.call @cc_cons(%1031, %1026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1035) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1036 = func.call @stack_pop_pointer() : () -> i64
      %1037 = func.call @stack_pop_pointer() : () -> i64
      %1038 = func.call @cc_cons(%1037, %1036) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %1039 = arith.addi %1038, %__rlasp_stack_elide_zero_40 : i64
      %1040 = func.call @stack_pop_pointer() : () -> i64
      %1041 = func.call @cc_cons(%1040, %1039) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %1042 = arith.addi %1041, %__rlasp_stack_elide_zero_41 : i64
      %1043 = func.call @stack_pop_pointer() : () -> i64
      %1044 = func.call @cc_cons(%1043, %1042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1044) : (i64) -> ()
      %1045 = llvm.mlir.addressof @str77 : !llvm.ptr
      %1046 = arith.constant 3 : i64
      %1047 = func.call @cc_make_string(%1045, %1046) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1047) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1048 = func.call @stack_pop_pointer() : () -> i64
      %1049 = func.call @stack_pop_pointer() : () -> i64
      %1050 = func.call @cc_cons(%1049, %1048) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %1051 = arith.addi %1050, %__rlasp_stack_elide_zero_42 : i64
      %1052 = func.call @stack_pop_pointer() : () -> i64
      %1053 = func.call @cc_cons(%1052, %1051) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %1054 = arith.addi %1053, %__rlasp_stack_elide_zero_43 : i64
      %1055 = func.call @stack_pop_pointer() : () -> i64
      %1056 = func.call @cc_cons(%1055, %1054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1056) : (i64) -> ()
      %1057 = llvm.mlir.addressof @str78 : !llvm.ptr
      %1058 = arith.constant 13 : i64
      %1059 = func.call @cc_make_string(%1057, %1058) : (!llvm.ptr, i64) -> i64
      %1060 = llvm.mlir.addressof @str79 : !llvm.ptr
      %1061 = arith.constant 11 : i64
      %1062 = func.call @cc_make_string(%1060, %1061) : (!llvm.ptr, i64) -> i64
      %1063 = func.call @cc_intern(%1059, %1062) : (i64, i64) -> i64
      %1064 = func.call @cc_nil_value() : () -> i64
      %1065 = func.call @cc_cons(%1063, %1064) : (i64, i64) -> i64
      %1066 = func.call @cc_values_pack(%1065) : (i64) -> i64
      func.call @stack_push_pointer(%1063) : (i64) -> ()
      %1067 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1067) : (i64) -> ()
      %1068 = llvm.mlir.addressof @str80 : !llvm.ptr
      %1069 = arith.constant 8 : i64
      %1070 = func.call @cc_make_string(%1068, %1069) : (!llvm.ptr, i64) -> i64
      %1071 = func.call @cc_nil_value() : () -> i64
      %1072 = func.call @cc_intern(%1070, %1071) : (i64, i64) -> i64
      %1073 = func.call @cc_nil_value() : () -> i64
      %1074 = func.call @cc_cons(%1072, %1073) : (i64, i64) -> i64
      %1075 = func.call @cc_values_pack(%1074) : (i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %1076 = arith.addi %1072, %__rlasp_stack_elide_zero_44 : i64
      %1077 = func.call @stack_pop_pointer() : () -> i64
      %1078 = func.call @cc_cons(%1076, %1077) : (i64, i64) -> i64
      %1079 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1080 = arith.constant 5 : i64
      %1081 = func.call @cc_make_string(%1079, %1080) : (!llvm.ptr, i64) -> i64
      %1082 = func.call @cc_nil_value() : () -> i64
      %1083 = func.call @cc_intern(%1081, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_nil_value() : () -> i64
      %1085 = func.call @cc_cons(%1083, %1084) : (i64, i64) -> i64
      %1086 = func.call @cc_values_pack(%1085) : (i64) -> i64
      %1087 = func.call @cc_cons(%1083, %1078) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1087) : (i64) -> ()
      %1088 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1088) : (i64) -> ()
      %1089 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1090 = arith.constant 14 : i64
      %1091 = func.call @cc_make_string(%1089, %1090) : (!llvm.ptr, i64) -> i64
      %1092 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1093 = arith.constant 11 : i64
      %1094 = func.call @cc_make_string(%1092, %1093) : (!llvm.ptr, i64) -> i64
      %1095 = func.call @cc_intern(%1091, %1094) : (i64, i64) -> i64
      %1096 = func.call @cc_nil_value() : () -> i64
      %1097 = func.call @cc_cons(%1095, %1096) : (i64, i64) -> i64
      %1098 = func.call @cc_values_pack(%1097) : (i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %1099 = arith.addi %1095, %__rlasp_stack_elide_zero_45 : i64
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @cc_cons(%1099, %1100) : (i64, i64) -> i64
      %1102 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1103 = arith.constant 5 : i64
      %1104 = func.call @cc_make_string(%1102, %1103) : (!llvm.ptr, i64) -> i64
      %1105 = func.call @cc_nil_value() : () -> i64
      %1106 = func.call @cc_intern(%1104, %1105) : (i64, i64) -> i64
      %1107 = func.call @cc_nil_value() : () -> i64
      %1108 = func.call @cc_cons(%1106, %1107) : (i64, i64) -> i64
      %1109 = func.call @cc_values_pack(%1108) : (i64) -> i64
      %1110 = func.call @cc_cons(%1106, %1101) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1110) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1111 = func.call @stack_pop_pointer() : () -> i64
      %1112 = func.call @stack_pop_pointer() : () -> i64
      %1113 = func.call @cc_cons(%1112, %1111) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1114 = arith.addi %1113, %__rlasp_stack_elide_zero_46 : i64
      %1115 = func.call @stack_pop_pointer() : () -> i64
      %1116 = func.call @cc_cons(%1115, %1114) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1117 = arith.addi %1116, %__rlasp_stack_elide_zero_47 : i64
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @cc_cons(%1118, %1117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1119) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1120 = func.call @stack_pop_pointer() : () -> i64
      %1121 = func.call @stack_pop_pointer() : () -> i64
      %1122 = func.call @cc_cons(%1121, %1120) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1123 = arith.addi %1122, %__rlasp_stack_elide_zero_48 : i64
      %1124 = func.call @stack_pop_pointer() : () -> i64
      %1125 = func.call @cc_cons(%1124, %1123) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1126 = arith.addi %1125, %__rlasp_stack_elide_zero_49 : i64
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %1128 = func.call @cc_cons(%1127, %1126) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1129 = arith.addi %1128, %__rlasp_stack_elide_zero_50 : i64
      %1209 = arith.constant 51151114338310 : i64
      %1210 = arith.constant 0 : i64
      %1211 = func.call @cc_make_closure(%1209, %1210) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1212 = arith.addi %1211, %__rlasp_stack_elide_zero_51 : i64
      %1213 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1214 = arith.constant 3 : i64
      %1215 = func.call @cc_make_string(%1213, %1214) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1216 = func.call @stack_pop_pointer() : () -> i64
      %1217 = func.call @stack_pop_pointer() : () -> i64
      %1218 = func.call @cc_cons(%1217, %1216) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1219 = arith.addi %1218, %__rlasp_stack_elide_zero_52 : i64
      %1220 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1221 = arith.constant 11 : i64
      %1222 = func.call @cc_make_string(%1220, %1221) : (!llvm.ptr, i64) -> i64
      %1223 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1224 = arith.constant 7 : i64
      %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
      %1226 = func.call @cc_intern(%1222, %1225) : (i64, i64) -> i64
      %1227 = func.call @cc_nil_value() : () -> i64
      %1228 = func.call @cc_cons(%1226, %1227) : (i64, i64) -> i64
      %1229 = func.call @cc_values_pack(%1228) : (i64) -> i64
      %1230 = func.call @cc_nil_value() : () -> i64
      %1231 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1232 = arith.constant 4 : i64
      %1233 = func.call @cc_make_string(%1231, %1232) : (!llvm.ptr, i64) -> i64
      %1234 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1235 = arith.constant 7 : i64
      %1236 = func.call @cc_make_string(%1234, %1235) : (!llvm.ptr, i64) -> i64
      %1237 = func.call @cc_intern(%1233, %1236) : (i64, i64) -> i64
      %1238 = func.call @cc_nil_value() : () -> i64
      %1239 = func.call @cc_cons(%1237, %1238) : (i64, i64) -> i64
      %1240 = func.call @cc_values_pack(%1239) : (i64) -> i64
      %1241 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1242 = arith.constant 6 : i64
      %1243 = func.call @cc_make_string(%1241, %1242) : (!llvm.ptr, i64) -> i64
      %1244 = func.call @cc_nil_value() : () -> i64
      %1245 = func.call @cc_intern(%1243, %1244) : (i64, i64) -> i64
      %1246 = func.call @cc_nil_value() : () -> i64
      %1247 = func.call @cc_cons(%1245, %1246) : (i64, i64) -> i64
      %1248 = func.call @cc_values_pack(%1247) : (i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1249 = arith.addi %1245, %__rlasp_stack_elide_zero_53 : i64
      %1250 = func.call @cc_nil_value() : () -> i64
      %1251 = func.call @cc_errorp(%963) : (i64) -> i64
      %1252 = arith.cmpi ne, %1251, %1250 : i64
      %1253 = arith.cmpi eq, %1250, %1250 : i64
      %1254 = arith.andi %1252, %1253 : i1
      %1255 = scf.if %1254 -> (i64) {
        scf.yield %963 : i64
      } else {
        scf.yield %1250 : i64
      }
      %1256 = func.call @cc_errorp(%1129) : (i64) -> i64
      %1257 = arith.cmpi ne, %1256, %1250 : i64
      %1258 = arith.cmpi eq, %1255, %1250 : i64
      %1259 = arith.andi %1257, %1258 : i1
      %1260 = scf.if %1259 -> (i64) {
        scf.yield %1129 : i64
      } else {
        scf.yield %1255 : i64
      }
      %1261 = func.call @cc_errorp(%1212) : (i64) -> i64
      %1262 = arith.cmpi ne, %1261, %1250 : i64
      %1263 = arith.cmpi eq, %1260, %1250 : i64
      %1264 = arith.andi %1262, %1263 : i1
      %1265 = scf.if %1264 -> (i64) {
        scf.yield %1212 : i64
      } else {
        scf.yield %1260 : i64
      }
      %1266 = func.call @cc_errorp(%1219) : (i64) -> i64
      %1267 = arith.cmpi ne, %1266, %1250 : i64
      %1268 = arith.cmpi eq, %1265, %1250 : i64
      %1269 = arith.andi %1267, %1268 : i1
      %1270 = scf.if %1269 -> (i64) {
        scf.yield %1219 : i64
      } else {
        scf.yield %1265 : i64
      }
      %1271 = func.call @cc_errorp(%1226) : (i64) -> i64
      %1272 = arith.cmpi ne, %1271, %1250 : i64
      %1273 = arith.cmpi eq, %1270, %1250 : i64
      %1274 = arith.andi %1272, %1273 : i1
      %1275 = scf.if %1274 -> (i64) {
        scf.yield %1226 : i64
      } else {
        scf.yield %1270 : i64
      }
      %1276 = func.call @cc_errorp(%1230) : (i64) -> i64
      %1277 = arith.cmpi ne, %1276, %1250 : i64
      %1278 = arith.cmpi eq, %1275, %1250 : i64
      %1279 = arith.andi %1277, %1278 : i1
      %1280 = scf.if %1279 -> (i64) {
        scf.yield %1230 : i64
      } else {
        scf.yield %1275 : i64
      }
      %1281 = func.call @cc_errorp(%1237) : (i64) -> i64
      %1282 = arith.cmpi ne, %1281, %1250 : i64
      %1283 = arith.cmpi eq, %1280, %1250 : i64
      %1284 = arith.andi %1282, %1283 : i1
      %1285 = scf.if %1284 -> (i64) {
        scf.yield %1237 : i64
      } else {
        scf.yield %1280 : i64
      }
      %1286 = func.call @cc_errorp(%1249) : (i64) -> i64
      %1287 = arith.cmpi ne, %1286, %1250 : i64
      %1288 = arith.cmpi eq, %1285, %1250 : i64
      %1289 = arith.andi %1287, %1288 : i1
      %1290 = scf.if %1289 -> (i64) {
        scf.yield %1249 : i64
      } else {
        scf.yield %1285 : i64
      }
      %1291 = arith.cmpi ne, %1290, %1250 : i64
      scf.if %1291 {
        func.call @stack_push_pointer(%1290) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%963) : (i64) -> ()
        func.call @stack_push_pointer(%1129) : (i64) -> ()
        func.call @stack_push_pointer(%1212) : (i64) -> ()
        func.call @stack_push_pointer(%1219) : (i64) -> ()
        func.call @stack_push_pointer(%1226) : (i64) -> ()
        func.call @stack_push_pointer(%1230) : (i64) -> ()
        func.call @stack_push_pointer(%1237) : (i64) -> ()
        func.call @stack_push_pointer(%1249) : (i64) -> ()
        %1292 = llvm.mlir.addressof @str100 : !llvm.ptr
        %1293 = func.call @cc_make_function_ref_const(%1292) : (!llvm.ptr) -> i64
        %1294 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1293, %1294) : (i64, i64) -> ()
      }
      %1295 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1295 : i64
    }
    %1296 = func.call @cc_nil_value() : () -> i64
    %1297 = func.call @cc_errorp(%954) : (i64) -> i64
    %1298 = arith.cmpi ne, %1297, %1296 : i64
    %1299 = scf.if %1298 -> (i64) {
      scf.yield %954 : i64
    } else {
      %1300 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1301 = arith.constant 22 : i64
      %1302 = func.call @cc_make_string(%1300, %1301) : (!llvm.ptr, i64) -> i64
      %1303 = func.call @cc_nil_value() : () -> i64
      %1304 = func.call @cc_intern(%1302, %1303) : (i64, i64) -> i64
      %1305 = func.call @cc_nil_value() : () -> i64
      %1306 = func.call @cc_cons(%1304, %1305) : (i64, i64) -> i64
      %1307 = func.call @cc_values_pack(%1306) : (i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1308 = arith.addi %1304, %__rlasp_stack_elide_zero_54 : i64
      %1309 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1310 = arith.constant 7 : i64
      %1311 = func.call @cc_make_string(%1309, %1310) : (!llvm.ptr, i64) -> i64
      %1312 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1313 = arith.constant 11 : i64
      %1314 = func.call @cc_make_string(%1312, %1313) : (!llvm.ptr, i64) -> i64
      %1315 = func.call @cc_intern(%1311, %1314) : (i64, i64) -> i64
      %1316 = func.call @cc_nil_value() : () -> i64
      %1317 = func.call @cc_cons(%1315, %1316) : (i64, i64) -> i64
      %1318 = func.call @cc_values_pack(%1317) : (i64) -> i64
      func.call @stack_push_pointer(%1315) : (i64) -> ()
      %1319 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1320 = arith.constant 23 : i64
      %1321 = func.call @cc_make_string(%1319, %1320) : (!llvm.ptr, i64) -> i64
      %1322 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1323 = arith.constant 11 : i64
      %1324 = func.call @cc_make_string(%1322, %1323) : (!llvm.ptr, i64) -> i64
      %1325 = func.call @cc_intern(%1321, %1324) : (i64, i64) -> i64
      %1326 = func.call @cc_nil_value() : () -> i64
      %1327 = func.call @cc_cons(%1325, %1326) : (i64, i64) -> i64
      %1328 = func.call @cc_values_pack(%1327) : (i64) -> i64
      func.call @stack_push_pointer(%1325) : (i64) -> ()
      %1329 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1329) : (i64) -> ()
      %1330 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1331 = arith.constant 8 : i64
      %1332 = func.call @cc_make_string(%1330, %1331) : (!llvm.ptr, i64) -> i64
      %1333 = func.call @cc_nil_value() : () -> i64
      %1334 = func.call @cc_intern(%1332, %1333) : (i64, i64) -> i64
      %1335 = func.call @cc_nil_value() : () -> i64
      %1336 = func.call @cc_cons(%1334, %1335) : (i64, i64) -> i64
      %1337 = func.call @cc_values_pack(%1336) : (i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1338 = arith.addi %1334, %__rlasp_stack_elide_zero_55 : i64
      %1339 = func.call @stack_pop_pointer() : () -> i64
      %1340 = func.call @cc_cons(%1338, %1339) : (i64, i64) -> i64
      %1341 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1342 = arith.constant 5 : i64
      %1343 = func.call @cc_make_string(%1341, %1342) : (!llvm.ptr, i64) -> i64
      %1344 = func.call @cc_nil_value() : () -> i64
      %1345 = func.call @cc_intern(%1343, %1344) : (i64, i64) -> i64
      %1346 = func.call @cc_nil_value() : () -> i64
      %1347 = func.call @cc_cons(%1345, %1346) : (i64, i64) -> i64
      %1348 = func.call @cc_values_pack(%1347) : (i64) -> i64
      %1349 = func.call @cc_cons(%1345, %1340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1349) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1350 = func.call @stack_pop_pointer() : () -> i64
      %1351 = func.call @stack_pop_pointer() : () -> i64
      %1352 = func.call @cc_cons(%1351, %1350) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1353 = arith.addi %1352, %__rlasp_stack_elide_zero_56 : i64
      %1354 = func.call @stack_pop_pointer() : () -> i64
      %1355 = func.call @cc_cons(%1354, %1353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1355) : (i64) -> ()
      %1356 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1356) : (i64) -> ()
      %1357 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1358 = arith.constant 7 : i64
      %1359 = func.call @cc_make_string(%1357, %1358) : (!llvm.ptr, i64) -> i64
      %1360 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1361 = arith.constant 11 : i64
      %1362 = func.call @cc_make_string(%1360, %1361) : (!llvm.ptr, i64) -> i64
      %1363 = func.call @cc_intern(%1359, %1362) : (i64, i64) -> i64
      %1364 = func.call @cc_nil_value() : () -> i64
      %1365 = func.call @cc_cons(%1363, %1364) : (i64, i64) -> i64
      %1366 = func.call @cc_values_pack(%1365) : (i64) -> i64
      func.call @stack_push_pointer(%1363) : (i64) -> ()
      %1367 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1368 = arith.constant 8 : i64
      %1369 = func.call @cc_make_string(%1367, %1368) : (!llvm.ptr, i64) -> i64
      %1370 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1371 = arith.constant 11 : i64
      %1372 = func.call @cc_make_string(%1370, %1371) : (!llvm.ptr, i64) -> i64
      %1373 = func.call @cc_intern(%1369, %1372) : (i64, i64) -> i64
      %1374 = func.call @cc_nil_value() : () -> i64
      %1375 = func.call @cc_cons(%1373, %1374) : (i64, i64) -> i64
      %1376 = func.call @cc_values_pack(%1375) : (i64) -> i64
      func.call @stack_push_pointer(%1373) : (i64) -> ()
      %1377 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1378 = arith.constant 8 : i64
      %1379 = func.call @cc_make_string(%1377, %1378) : (!llvm.ptr, i64) -> i64
      %1380 = func.call @cc_nil_value() : () -> i64
      %1381 = func.call @cc_intern(%1379, %1380) : (i64, i64) -> i64
      %1382 = func.call @cc_nil_value() : () -> i64
      %1383 = func.call @cc_cons(%1381, %1382) : (i64, i64) -> i64
      %1384 = func.call @cc_values_pack(%1383) : (i64) -> i64
      func.call @stack_push_pointer(%1381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1385 = func.call @stack_pop_pointer() : () -> i64
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @cc_cons(%1386, %1385) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1388 = arith.addi %1387, %__rlasp_stack_elide_zero_57 : i64
      %1389 = func.call @stack_pop_pointer() : () -> i64
      %1390 = func.call @cc_cons(%1389, %1388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1390) : (i64) -> ()
      %1391 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1391) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1392 = func.call @stack_pop_pointer() : () -> i64
      %1393 = func.call @stack_pop_pointer() : () -> i64
      %1394 = func.call @cc_cons(%1393, %1392) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1395 = arith.addi %1394, %__rlasp_stack_elide_zero_58 : i64
      %1396 = func.call @stack_pop_pointer() : () -> i64
      %1397 = func.call @cc_cons(%1396, %1395) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1398 = arith.addi %1397, %__rlasp_stack_elide_zero_59 : i64
      %1399 = func.call @stack_pop_pointer() : () -> i64
      %1400 = func.call @cc_cons(%1399, %1398) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1401 = arith.addi %1400, %__rlasp_stack_elide_zero_60 : i64
      %1402 = func.call @stack_pop_pointer() : () -> i64
      %1403 = func.call @cc_cons(%1401, %1402) : (i64, i64) -> i64
      %1404 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1405 = arith.constant 5 : i64
      %1406 = func.call @cc_make_string(%1404, %1405) : (!llvm.ptr, i64) -> i64
      %1407 = func.call @cc_nil_value() : () -> i64
      %1408 = func.call @cc_intern(%1406, %1407) : (i64, i64) -> i64
      %1409 = func.call @cc_nil_value() : () -> i64
      %1410 = func.call @cc_cons(%1408, %1409) : (i64, i64) -> i64
      %1411 = func.call @cc_values_pack(%1410) : (i64) -> i64
      %1412 = func.call @cc_cons(%1408, %1403) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1412) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1413 = func.call @stack_pop_pointer() : () -> i64
      %1414 = func.call @stack_pop_pointer() : () -> i64
      %1415 = func.call @cc_cons(%1414, %1413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1416 = arith.addi %1415, %__rlasp_stack_elide_zero_61 : i64
      %1417 = func.call @stack_pop_pointer() : () -> i64
      %1418 = func.call @cc_cons(%1417, %1416) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
      %1419 = arith.addi %1418, %__rlasp_stack_elide_zero_62 : i64
      %1420 = func.call @stack_pop_pointer() : () -> i64
      %1421 = func.call @cc_cons(%1420, %1419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %1422 = arith.addi %1421, %__rlasp_stack_elide_zero_63 : i64
      %1423 = func.call @stack_pop_pointer() : () -> i64
      %1424 = func.call @cc_cons(%1423, %1422) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %1425 = arith.addi %1424, %__rlasp_stack_elide_zero_64 : i64
      %1497 = arith.constant 51151114338311 : i64
      %1498 = arith.constant 0 : i64
      %1499 = func.call @cc_make_closure(%1497, %1498) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %1500 = arith.addi %1499, %__rlasp_stack_elide_zero_65 : i64
      %1501 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%1501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1502 = func.call @stack_pop_pointer() : () -> i64
      %1503 = func.call @stack_pop_pointer() : () -> i64
      %1504 = func.call @cc_cons(%1503, %1502) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
      %1505 = arith.addi %1504, %__rlasp_stack_elide_zero_66 : i64
      %1506 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1507 = arith.constant 11 : i64
      %1508 = func.call @cc_make_string(%1506, %1507) : (!llvm.ptr, i64) -> i64
      %1509 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1510 = arith.constant 7 : i64
      %1511 = func.call @cc_make_string(%1509, %1510) : (!llvm.ptr, i64) -> i64
      %1512 = func.call @cc_intern(%1508, %1511) : (i64, i64) -> i64
      %1513 = func.call @cc_nil_value() : () -> i64
      %1514 = func.call @cc_cons(%1512, %1513) : (i64, i64) -> i64
      %1515 = func.call @cc_values_pack(%1514) : (i64) -> i64
      %1516 = func.call @cc_nil_value() : () -> i64
      %1517 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1518 = arith.constant 4 : i64
      %1519 = func.call @cc_make_string(%1517, %1518) : (!llvm.ptr, i64) -> i64
      %1520 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1521 = arith.constant 7 : i64
      %1522 = func.call @cc_make_string(%1520, %1521) : (!llvm.ptr, i64) -> i64
      %1523 = func.call @cc_intern(%1519, %1522) : (i64, i64) -> i64
      %1524 = func.call @cc_nil_value() : () -> i64
      %1525 = func.call @cc_cons(%1523, %1524) : (i64, i64) -> i64
      %1526 = func.call @cc_values_pack(%1525) : (i64) -> i64
      %1527 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1528 = arith.constant 6 : i64
      %1529 = func.call @cc_make_string(%1527, %1528) : (!llvm.ptr, i64) -> i64
      %1530 = func.call @cc_nil_value() : () -> i64
      %1531 = func.call @cc_intern(%1529, %1530) : (i64, i64) -> i64
      %1532 = func.call @cc_nil_value() : () -> i64
      %1533 = func.call @cc_cons(%1531, %1532) : (i64, i64) -> i64
      %1534 = func.call @cc_values_pack(%1533) : (i64) -> i64
      %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
      %1535 = arith.addi %1531, %__rlasp_stack_elide_zero_67 : i64
      %1536 = func.call @cc_nil_value() : () -> i64
      %1537 = func.call @cc_errorp(%1308) : (i64) -> i64
      %1538 = arith.cmpi ne, %1537, %1536 : i64
      %1539 = arith.cmpi eq, %1536, %1536 : i64
      %1540 = arith.andi %1538, %1539 : i1
      %1541 = scf.if %1540 -> (i64) {
        scf.yield %1308 : i64
      } else {
        scf.yield %1536 : i64
      }
      %1542 = func.call @cc_errorp(%1425) : (i64) -> i64
      %1543 = arith.cmpi ne, %1542, %1536 : i64
      %1544 = arith.cmpi eq, %1541, %1536 : i64
      %1545 = arith.andi %1543, %1544 : i1
      %1546 = scf.if %1545 -> (i64) {
        scf.yield %1425 : i64
      } else {
        scf.yield %1541 : i64
      }
      %1547 = func.call @cc_errorp(%1500) : (i64) -> i64
      %1548 = arith.cmpi ne, %1547, %1536 : i64
      %1549 = arith.cmpi eq, %1546, %1536 : i64
      %1550 = arith.andi %1548, %1549 : i1
      %1551 = scf.if %1550 -> (i64) {
        scf.yield %1500 : i64
      } else {
        scf.yield %1546 : i64
      }
      %1552 = func.call @cc_errorp(%1505) : (i64) -> i64
      %1553 = arith.cmpi ne, %1552, %1536 : i64
      %1554 = arith.cmpi eq, %1551, %1536 : i64
      %1555 = arith.andi %1553, %1554 : i1
      %1556 = scf.if %1555 -> (i64) {
        scf.yield %1505 : i64
      } else {
        scf.yield %1551 : i64
      }
      %1557 = func.call @cc_errorp(%1512) : (i64) -> i64
      %1558 = arith.cmpi ne, %1557, %1536 : i64
      %1559 = arith.cmpi eq, %1556, %1536 : i64
      %1560 = arith.andi %1558, %1559 : i1
      %1561 = scf.if %1560 -> (i64) {
        scf.yield %1512 : i64
      } else {
        scf.yield %1556 : i64
      }
      %1562 = func.call @cc_errorp(%1516) : (i64) -> i64
      %1563 = arith.cmpi ne, %1562, %1536 : i64
      %1564 = arith.cmpi eq, %1561, %1536 : i64
      %1565 = arith.andi %1563, %1564 : i1
      %1566 = scf.if %1565 -> (i64) {
        scf.yield %1516 : i64
      } else {
        scf.yield %1561 : i64
      }
      %1567 = func.call @cc_errorp(%1523) : (i64) -> i64
      %1568 = arith.cmpi ne, %1567, %1536 : i64
      %1569 = arith.cmpi eq, %1566, %1536 : i64
      %1570 = arith.andi %1568, %1569 : i1
      %1571 = scf.if %1570 -> (i64) {
        scf.yield %1523 : i64
      } else {
        scf.yield %1566 : i64
      }
      %1572 = func.call @cc_errorp(%1535) : (i64) -> i64
      %1573 = arith.cmpi ne, %1572, %1536 : i64
      %1574 = arith.cmpi eq, %1571, %1536 : i64
      %1575 = arith.andi %1573, %1574 : i1
      %1576 = scf.if %1575 -> (i64) {
        scf.yield %1535 : i64
      } else {
        scf.yield %1571 : i64
      }
      %1577 = arith.cmpi ne, %1576, %1536 : i64
      scf.if %1577 {
        func.call @stack_push_pointer(%1576) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1308) : (i64) -> ()
        func.call @stack_push_pointer(%1425) : (i64) -> ()
        func.call @stack_push_pointer(%1500) : (i64) -> ()
        func.call @stack_push_pointer(%1505) : (i64) -> ()
        func.call @stack_push_pointer(%1512) : (i64) -> ()
        func.call @stack_push_pointer(%1516) : (i64) -> ()
        func.call @stack_push_pointer(%1523) : (i64) -> ()
        func.call @stack_push_pointer(%1535) : (i64) -> ()
        %1578 = llvm.mlir.addressof @str126 : !llvm.ptr
        %1579 = func.call @cc_make_function_ref_const(%1578) : (!llvm.ptr) -> i64
        %1580 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1579, %1580) : (i64, i64) -> ()
      }
      %1581 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1581 : i64
    }
    %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
    %1582 = arith.addi %1299, %__rlasp_stack_elide_zero_68 : i64
    %1583 = func.call @cc_multiple_value_list(%1582) : (i64) -> i64
    %1584 = llvm.mlir.addressof @str127 : !llvm.ptr
    %1585 = arith.constant 37 : i64
    %1586 = func.call @cc_make_string(%1584, %1585) : (!llvm.ptr, i64) -> i64
    %1587 = func.call @cc_nil_value() : () -> i64
    %1588 = func.call @cc_intern(%1586, %1587) : (i64, i64) -> i64
    %1589 = func.call @cc_nil_value() : () -> i64
    %1590 = func.call @cc_cons(%1588, %1589) : (i64, i64) -> i64
    %1591 = func.call @cc_values_pack(%1590) : (i64) -> i64
    %1592 = func.call @cc_symbol_value(%1588) : (i64) -> i64
    %1593 = llvm.mlir.addressof @str128 : !llvm.ptr
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
  func.func @"__lambda_51151114338306"() {
    %228 = func.call @cc_nil_value() : () -> i64
    %229 = func.call @cc_nil_value() : () -> i64
    %230 = func.call @cc_errorp(%228) : (i64) -> i64
    %231 = arith.cmpi ne, %230, %229 : i64
    %232 = scf.if %231 -> (i64) {
      scf.yield %228 : i64
    } else {
      %233 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_nil_value() : () -> i64
      %236 = func.call @cc_errorp(%234) : (i64) -> i64
      %237 = arith.cmpi ne, %236, %235 : i64
      %238 = scf.if %237 -> (i64) {
        scf.yield %234 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %239 = func.call @cc_nil_value() : () -> i64
        %240 = func.call @cc_nil_value() : () -> i64
        %241 = func.call @cc_errorp(%239) : (i64) -> i64
        %242 = arith.cmpi ne, %241, %240 : i64
        %243 = arith.cmpi eq, %240, %240 : i64
        %244 = arith.andi %242, %243 : i1
        %245 = scf.if %244 -> (i64) {
          scf.yield %239 : i64
        } else {
          scf.yield %240 : i64
        }
        %246 = arith.cmpi ne, %245, %240 : i64
        scf.if %246 {
          func.call @stack_push_pointer(%245) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%239) : (i64) -> ()
          %247 = llvm.mlir.addressof @str19 : !llvm.ptr
          %248 = func.call @cc_make_function_ref_const(%247) : (!llvm.ptr) -> i64
          %249 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%248, %249) : (i64, i64) -> ()
        }
        %250 = func.call @stack_pop_pointer() : () -> i64
        %251 = func.call @cc_errorp(%250) : (i64) -> i64
        %252 = func.call @cc_nil_value() : () -> i64
        %253 = arith.cmpi ne, %251, %252 : i64
        scf.if %253 {
          func.call @stack_push_pointer(%250) : (i64) -> ()
        } else {
          %254 = func.call @cc_multiple_value_list(%250) : (i64) -> i64
          func.call @stack_push_pointer(%254) : (i64) -> ()
        }
        %255 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %256 = func.call @stack_pop_pointer() : () -> i64
        %257 = func.call @cc_nil_value() : () -> i64
        %258 = func.call @cc_maybe_error_from_multiple_value_list(%255) : (i64) -> i64
        %259 = func.call @cc_errorp(%258) : (i64) -> i64
        %260 = arith.cmpi ne, %259, %257 : i64
        %261 = arith.cmpi eq, %257, %257 : i64
        %262 = arith.andi %260, %261 : i1
        %263 = scf.if %262 -> (i64) {
          scf.yield %258 : i64
        } else {
          scf.yield %257 : i64
        }
        %264 = arith.cmpi ne, %263, %257 : i64
        scf.if %264 {
          func.call @stack_push_pointer(%263) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %265 = func.call @stack_pop_pointer() : () -> i64
          %266 = func.call @cc_cons(%256, %265) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
          %267 = arith.addi %266, %__rlasp_stack_elide_zero_69 : i64
          %268 = func.call @cc_cons(%255, %267) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
          %269 = arith.addi %268, %__rlasp_stack_elide_zero_70 : i64
          %270 = func.call @cc_values_pack(%269) : (i64) -> i64
          func.call @stack_push_pointer(%270) : (i64) -> ()
        }
        %271 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %271 : i64
      }
      %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
      %272 = arith.addi %238, %__rlasp_stack_elide_zero_71 : i64
      %273 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %274 = func.call @cc_errorp(%272) : (i64) -> i64
      %275 = func.call @cc_nil_value() : () -> i64
      %276 = arith.cmpi ne, %274, %275 : i64
      scf.if %276 {
        %277 = func.call @cc_condition_value(%272) : (i64) -> i64
        %278 = func.call @cc_values2(%275, %277) : (i64, i64) -> i64
        func.call @stack_push_pointer(%278) : (i64) -> ()
      } else {
        %279 = func.call @cc_multiple_value_list(%272) : (i64) -> i64
        %280 = func.call @cc_values_pack(%279) : (i64) -> i64
        func.call @stack_push_pointer(%280) : (i64) -> ()
      }
      %281 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %281 : i64
    }
    func.call @stack_push_pointer(%232) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338307"() {
    %466 = func.call @cc_nil_value() : () -> i64
    %467 = func.call @cc_nil_value() : () -> i64
    %468 = func.call @cc_errorp(%466) : (i64) -> i64
    %469 = arith.cmpi ne, %468, %467 : i64
    %470 = scf.if %469 -> (i64) {
      scf.yield %466 : i64
    } else {
      %471 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %472 = func.call @cc_nil_value() : () -> i64
      %473 = func.call @cc_nil_value() : () -> i64
      %474 = func.call @cc_errorp(%472) : (i64) -> i64
      %475 = arith.cmpi ne, %474, %473 : i64
      %476 = scf.if %475 -> (i64) {
        scf.yield %472 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %477 = arith.constant 32 : i64
        %478 = func.call @cc_box_character(%477) : (i64) -> i64
        %479 = func.call @cc_nil_value() : () -> i64
        %480 = func.call @cc_errorp(%478) : (i64) -> i64
        %481 = arith.cmpi ne, %480, %479 : i64
        %482 = arith.cmpi eq, %479, %479 : i64
        %483 = arith.andi %481, %482 : i1
        %484 = scf.if %483 -> (i64) {
          scf.yield %478 : i64
        } else {
          scf.yield %479 : i64
        }
        %485 = arith.cmpi ne, %484, %479 : i64
        scf.if %485 {
          func.call @stack_push_pointer(%484) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%478) : (i64) -> ()
          %486 = llvm.mlir.addressof @str36 : !llvm.ptr
          %487 = func.call @cc_make_function_ref_const(%486) : (!llvm.ptr) -> i64
          %488 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%487, %488) : (i64, i64) -> ()
        }
        %489 = func.call @stack_pop_pointer() : () -> i64
        %490 = func.call @cc_errorp(%489) : (i64) -> i64
        %491 = func.call @cc_nil_value() : () -> i64
        %492 = arith.cmpi ne, %490, %491 : i64
        scf.if %492 {
          func.call @stack_push_pointer(%489) : (i64) -> ()
        } else {
          %493 = func.call @cc_multiple_value_list(%489) : (i64) -> i64
          func.call @stack_push_pointer(%493) : (i64) -> ()
        }
        %494 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %495 = func.call @stack_pop_pointer() : () -> i64
        %496 = func.call @cc_nil_value() : () -> i64
        %497 = func.call @cc_maybe_error_from_multiple_value_list(%494) : (i64) -> i64
        %498 = func.call @cc_errorp(%497) : (i64) -> i64
        %499 = arith.cmpi ne, %498, %496 : i64
        %500 = arith.cmpi eq, %496, %496 : i64
        %501 = arith.andi %499, %500 : i1
        %502 = scf.if %501 -> (i64) {
          scf.yield %497 : i64
        } else {
          scf.yield %496 : i64
        }
        %503 = arith.cmpi ne, %502, %496 : i64
        scf.if %503 {
          func.call @stack_push_pointer(%502) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %504 = func.call @stack_pop_pointer() : () -> i64
          %505 = func.call @cc_cons(%495, %504) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
          %506 = arith.addi %505, %__rlasp_stack_elide_zero_72 : i64
          %507 = func.call @cc_cons(%494, %506) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
          %508 = arith.addi %507, %__rlasp_stack_elide_zero_73 : i64
          %509 = func.call @cc_values_pack(%508) : (i64) -> i64
          func.call @stack_push_pointer(%509) : (i64) -> ()
        }
        %510 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %510 : i64
      }
      %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
      %511 = arith.addi %476, %__rlasp_stack_elide_zero_74 : i64
      %512 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %513 = func.call @cc_errorp(%511) : (i64) -> i64
      %514 = func.call @cc_nil_value() : () -> i64
      %515 = arith.cmpi ne, %513, %514 : i64
      scf.if %515 {
        %516 = func.call @cc_condition_value(%511) : (i64) -> i64
        %517 = func.call @cc_values2(%514, %516) : (i64, i64) -> i64
        func.call @stack_push_pointer(%517) : (i64) -> ()
      } else {
        %518 = func.call @cc_multiple_value_list(%511) : (i64) -> i64
        %519 = func.call @cc_values_pack(%518) : (i64) -> i64
        func.call @stack_push_pointer(%519) : (i64) -> ()
      }
      %520 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %520 : i64
    }
    func.call @stack_push_pointer(%470) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338308"() {
    %704 = func.call @cc_nil_value() : () -> i64
    %705 = func.call @cc_nil_value() : () -> i64
    %706 = func.call @cc_errorp(%704) : (i64) -> i64
    %707 = arith.cmpi ne, %706, %705 : i64
    %708 = scf.if %707 -> (i64) {
      scf.yield %704 : i64
    } else {
      %709 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %710 = func.call @cc_nil_value() : () -> i64
      %711 = func.call @cc_nil_value() : () -> i64
      %712 = func.call @cc_errorp(%710) : (i64) -> i64
      %713 = arith.cmpi ne, %712, %711 : i64
      %714 = scf.if %713 -> (i64) {
        scf.yield %710 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %715 = arith.constant -1 : i64
        %716 = func.call @cc_box_fixnum(%715) : (i64) -> i64
        %717 = func.call @cc_nil_value() : () -> i64
        %718 = func.call @cc_errorp(%716) : (i64) -> i64
        %719 = arith.cmpi ne, %718, %717 : i64
        %720 = arith.cmpi eq, %717, %717 : i64
        %721 = arith.andi %719, %720 : i1
        %722 = scf.if %721 -> (i64) {
          scf.yield %716 : i64
        } else {
          scf.yield %717 : i64
        }
        %723 = arith.cmpi ne, %722, %717 : i64
        scf.if %723 {
          func.call @stack_push_pointer(%722) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%716) : (i64) -> ()
          %724 = llvm.mlir.addressof @str53 : !llvm.ptr
          %725 = func.call @cc_make_function_ref_const(%724) : (!llvm.ptr) -> i64
          %726 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%725, %726) : (i64, i64) -> ()
        }
        %727 = func.call @stack_pop_pointer() : () -> i64
        %728 = func.call @cc_errorp(%727) : (i64) -> i64
        %729 = func.call @cc_nil_value() : () -> i64
        %730 = arith.cmpi ne, %728, %729 : i64
        scf.if %730 {
          func.call @stack_push_pointer(%727) : (i64) -> ()
        } else {
          %731 = func.call @cc_multiple_value_list(%727) : (i64) -> i64
          func.call @stack_push_pointer(%731) : (i64) -> ()
        }
        %732 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %733 = func.call @stack_pop_pointer() : () -> i64
        %734 = func.call @cc_nil_value() : () -> i64
        %735 = func.call @cc_maybe_error_from_multiple_value_list(%732) : (i64) -> i64
        %736 = func.call @cc_errorp(%735) : (i64) -> i64
        %737 = arith.cmpi ne, %736, %734 : i64
        %738 = arith.cmpi eq, %734, %734 : i64
        %739 = arith.andi %737, %738 : i1
        %740 = scf.if %739 -> (i64) {
          scf.yield %735 : i64
        } else {
          scf.yield %734 : i64
        }
        %741 = arith.cmpi ne, %740, %734 : i64
        scf.if %741 {
          func.call @stack_push_pointer(%740) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %742 = func.call @stack_pop_pointer() : () -> i64
          %743 = func.call @cc_cons(%733, %742) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
          %744 = arith.addi %743, %__rlasp_stack_elide_zero_75 : i64
          %745 = func.call @cc_cons(%732, %744) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
          %746 = arith.addi %745, %__rlasp_stack_elide_zero_76 : i64
          %747 = func.call @cc_values_pack(%746) : (i64) -> i64
          func.call @stack_push_pointer(%747) : (i64) -> ()
        }
        %748 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %748 : i64
      }
      %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
      %749 = arith.addi %714, %__rlasp_stack_elide_zero_77 : i64
      %750 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %751 = func.call @cc_errorp(%749) : (i64) -> i64
      %752 = func.call @cc_nil_value() : () -> i64
      %753 = arith.cmpi ne, %751, %752 : i64
      scf.if %753 {
        %754 = func.call @cc_condition_value(%749) : (i64) -> i64
        %755 = func.call @cc_values2(%752, %754) : (i64, i64) -> i64
        func.call @stack_push_pointer(%755) : (i64) -> ()
      } else {
        %756 = func.call @cc_multiple_value_list(%749) : (i64) -> i64
        %757 = func.call @cc_values_pack(%756) : (i64) -> i64
        func.call @stack_push_pointer(%757) : (i64) -> ()
      }
      %758 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %758 : i64
    }
    func.call @stack_push_pointer(%708) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338309"() {
    %876 = func.call @stack_pop_pointer() : () -> i64
    %877 = func.call @stack_pop_pointer() : () -> i64
    %878 = func.call @cc_nil_value() : () -> i64
    %879 = func.call @cc_nil_value() : () -> i64
    %880 = func.call @cc_errorp(%878) : (i64) -> i64
    %881 = arith.cmpi ne, %880, %879 : i64
    %882 = scf.if %881 -> (i64) {
      scf.yield %878 : i64
    } else {
      %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
      %883 = arith.addi %877, %__rlasp_stack_elide_zero_78 : i64
      %884 = func.call @cc_cdr(%883) : (i64) -> i64
      %885 = func.call @cc_cdr(%884) : (i64) -> i64
      %886 = func.call @cc_car(%885) : (i64) -> i64
      %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
      %887 = arith.addi %886, %__rlasp_stack_elide_zero_79 : i64
      %888 = func.call @cc_nil_value() : () -> i64
      %889 = func.call @cc_nil_value() : () -> i64
      %890 = func.call @cc_errorp(%888) : (i64) -> i64
      %891 = arith.cmpi ne, %890, %889 : i64
      %892 = scf.if %891 -> (i64) {
        scf.yield %888 : i64
      } else {
        %893 = func.call @cc_nil_value() : () -> i64
        %894 = func.call @cc_errorp(%887) : (i64) -> i64
        %895 = arith.cmpi ne, %894, %893 : i64
        %896 = arith.cmpi eq, %893, %893 : i64
        %897 = arith.andi %895, %896 : i1
        %898 = scf.if %897 -> (i64) {
          scf.yield %887 : i64
        } else {
          scf.yield %893 : i64
        }
        %899 = arith.cmpi ne, %898, %893 : i64
        scf.if %899 {
          func.call @stack_push_pointer(%898) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%887) : (i64) -> ()
          %900 = llvm.mlir.addressof @str64 : !llvm.ptr
          %901 = func.call @cc_make_function_ref_const(%900) : (!llvm.ptr) -> i64
          %902 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%901, %902) : (i64, i64) -> ()
        }
        %903 = func.call @stack_pop_pointer() : () -> i64
        %904 = func.call @cc_nil_value() : () -> i64
        %905 = arith.cmpi ne, %903, %904 : i64
        scf.if %905 {
          %906 = arith.constant 2 : i64
          %907 = func.call @cc_box_fixnum(%906) : (i64) -> i64
          %909 = arith.constant 3 : i64
          %908 = arith.andi %887, %909 : i64
          %910 = arith.constant 0 : i64
          %911 = arith.cmpi eq, %908, %910 : i64
          %913 = arith.constant 3 : i64
          %912 = arith.andi %907, %913 : i64
          %914 = arith.constant 0 : i64
          %915 = arith.cmpi eq, %912, %914 : i64
          %916 = arith.andi %911, %915 : i1
          %917 = scf.if %916 -> (i64) {
            %918 = arith.constant 2 : i64
            %919 = arith.shrsi %887, %918 : i64
            %920 = arith.constant 2 : i64
            %921 = arith.shrsi %907, %920 : i64
            %922 = arith.constant 0 : i64
            %923 = arith.cmpi slt, %919, %922 : i64
            %924 = scf.if %923 -> (i64) {
              %925 = arith.subi %922, %919 : i64
              scf.yield %925 : i64
            } else {
              scf.yield %919 : i64
            }
            %926 = arith.constant 0 : i64
            %927 = arith.cmpi slt, %921, %926 : i64
            %928 = scf.if %927 -> (i64) {
              %929 = arith.subi %926, %921 : i64
              scf.yield %929 : i64
            } else {
              scf.yield %921 : i64
            }
            %930 = arith.constant 1518500249 : i64
            %931 = arith.cmpi sle, %924, %930 : i64
            %932 = arith.cmpi sle, %928, %930 : i64
            %933 = arith.andi %931, %932 : i1
            %934 = scf.if %933 -> (i64) {
              %935 = arith.muli %919, %921 : i64
              %936 = arith.constant 2 : i64
              %937 = arith.shli %935, %936 : i64
              scf.yield %937 : i64
            } else {
              %938 = func.call @cc_mul(%887, %907) : (i64, i64) -> i64
              scf.yield %938 : i64
            }
            scf.yield %934 : i64
          } else {
            %939 = func.call @cc_mul(%887, %907) : (i64, i64) -> i64
            scf.yield %939 : i64
          }
          func.call @stack_push_pointer(%917) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%877) : (i64) -> ()
        }
        %940 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %940 : i64
      }
      %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
      %941 = arith.addi %892, %__rlasp_stack_elide_zero_80 : i64
      scf.yield %941 : i64
    }
    func.call @stack_push_pointer(%882) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338310"() {
    %1130 = func.call @cc_nil_value() : () -> i64
    %1131 = func.call @cc_nil_value() : () -> i64
    %1132 = func.call @cc_errorp(%1130) : (i64) -> i64
    %1133 = arith.cmpi ne, %1132, %1131 : i64
    %1134 = scf.if %1133 -> (i64) {
      scf.yield %1130 : i64
    } else {
      %1135 = func.call @cc_nil_value() : () -> i64
      %1136 = func.call @cc_nil_value() : () -> i64
      %1137 = func.call @cc_errorp(%1135) : (i64) -> i64
      %1138 = arith.cmpi ne, %1137, %1136 : i64
      %1139 = scf.if %1138 -> (i64) {
        scf.yield %1135 : i64
      } else {
        %1140 = llvm.mlir.addressof @str85 : !llvm.ptr
        %1141 = arith.constant 8 : i64
        %1142 = func.call @cc_make_string(%1140, %1141) : (!llvm.ptr, i64) -> i64
        %1143 = func.call @cc_nil_value() : () -> i64
        %1144 = func.call @cc_intern(%1142, %1143) : (i64, i64) -> i64
        %1145 = func.call @cc_nil_value() : () -> i64
        %1146 = func.call @cc_cons(%1144, %1145) : (i64, i64) -> i64
        %1147 = func.call @cc_values_pack(%1146) : (i64) -> i64
        func.call @stack_push_pointer(%1144) : (i64) -> ()
        %1148 = llvm.mlir.addressof @str86 : !llvm.ptr
        %1149 = arith.constant 14 : i64
        %1150 = func.call @cc_make_string(%1148, %1149) : (!llvm.ptr, i64) -> i64
        %1151 = llvm.mlir.addressof @str87 : !llvm.ptr
        %1152 = arith.constant 11 : i64
        %1153 = func.call @cc_make_string(%1151, %1152) : (!llvm.ptr, i64) -> i64
        %1154 = func.call @cc_intern(%1150, %1153) : (i64, i64) -> i64
        %1155 = func.call @cc_nil_value() : () -> i64
        %1156 = func.call @cc_cons(%1154, %1155) : (i64, i64) -> i64
        %1157 = func.call @cc_values_pack(%1156) : (i64) -> i64
        func.call @stack_push_pointer(%1154) : (i64) -> ()
        %1158 = llvm.mlir.addressof @str88 : !llvm.ptr
        %1159 = arith.constant 3 : i64
        %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
        %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
        %1161 = arith.addi %1160, %__rlasp_stack_elide_zero_81 : i64
        %1162 = func.call @stack_pop_pointer() : () -> i64
        %1163 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1161) : (i64) -> ()
        func.call @stack_push_pointer(%1163) : (i64) -> ()
        func.call @stack_push_pointer(%1162) : (i64) -> ()
        %1164 = llvm.mlir.addressof @str89 : !llvm.ptr
        %1165 = func.call @cc_make_function_ref_const(%1164) : (!llvm.ptr) -> i64
        %1166 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1165, %1166) : (i64, i64) -> ()
        %1167 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1167 : i64
      }
      %1168 = func.call @cc_nil_value() : () -> i64
      %1169 = func.call @cc_errorp(%1139) : (i64) -> i64
      %1170 = arith.cmpi ne, %1169, %1168 : i64
      %1171 = scf.if %1170 -> (i64) {
        scf.yield %1139 : i64
      } else {
        %1172 = llvm.mlir.addressof @str90 : !llvm.ptr
        %1173 = arith.constant 8 : i64
        %1174 = func.call @cc_make_string(%1172, %1173) : (!llvm.ptr, i64) -> i64
        %1175 = func.call @cc_nil_value() : () -> i64
        %1176 = func.call @cc_intern(%1174, %1175) : (i64, i64) -> i64
        %1177 = func.call @cc_nil_value() : () -> i64
        %1178 = func.call @cc_cons(%1176, %1177) : (i64, i64) -> i64
        %1179 = func.call @cc_values_pack(%1178) : (i64) -> i64
        %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
        %1180 = arith.addi %1176, %__rlasp_stack_elide_zero_82 : i64
        %1181 = llvm.mlir.addressof @str91 : !llvm.ptr
        %1182 = arith.constant 14 : i64
        %1183 = func.call @cc_make_string(%1181, %1182) : (!llvm.ptr, i64) -> i64
        %1184 = llvm.mlir.addressof @str92 : !llvm.ptr
        %1185 = arith.constant 11 : i64
        %1186 = func.call @cc_make_string(%1184, %1185) : (!llvm.ptr, i64) -> i64
        %1187 = func.call @cc_intern(%1183, %1186) : (i64, i64) -> i64
        %1188 = func.call @cc_nil_value() : () -> i64
        %1189 = func.call @cc_cons(%1187, %1188) : (i64, i64) -> i64
        %1190 = func.call @cc_values_pack(%1189) : (i64) -> i64
        %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
        %1191 = arith.addi %1187, %__rlasp_stack_elide_zero_83 : i64
        %1192 = func.call @cc_nil_value() : () -> i64
        %1193 = func.call @cc_errorp(%1180) : (i64) -> i64
        %1194 = arith.cmpi ne, %1193, %1192 : i64
        %1195 = arith.cmpi eq, %1192, %1192 : i64
        %1196 = arith.andi %1194, %1195 : i1
        %1197 = scf.if %1196 -> (i64) {
          scf.yield %1180 : i64
        } else {
          scf.yield %1192 : i64
        }
        %1198 = func.call @cc_errorp(%1191) : (i64) -> i64
        %1199 = arith.cmpi ne, %1198, %1192 : i64
        %1200 = arith.cmpi eq, %1197, %1192 : i64
        %1201 = arith.andi %1199, %1200 : i1
        %1202 = scf.if %1201 -> (i64) {
          scf.yield %1191 : i64
        } else {
          scf.yield %1197 : i64
        }
        %1203 = arith.cmpi ne, %1202, %1192 : i64
        scf.if %1203 {
          func.call @stack_push_pointer(%1202) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1180) : (i64) -> ()
          func.call @stack_push_pointer(%1191) : (i64) -> ()
          %1204 = llvm.mlir.addressof @str93 : !llvm.ptr
          %1205 = func.call @cc_make_function_ref_const(%1204) : (!llvm.ptr) -> i64
          %1206 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1205, %1206) : (i64, i64) -> ()
        }
        %1207 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1207 : i64
      }
      %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
      %1208 = arith.addi %1171, %__rlasp_stack_elide_zero_84 : i64
      scf.yield %1208 : i64
    }
    func.call @stack_push_pointer(%1134) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_51151114338311"() {
    %1426 = func.call @cc_nil_value() : () -> i64
    %1427 = func.call @cc_nil_value() : () -> i64
    %1428 = func.call @cc_errorp(%1426) : (i64) -> i64
    %1429 = arith.cmpi ne, %1428, %1427 : i64
    %1430 = scf.if %1429 -> (i64) {
      scf.yield %1426 : i64
    } else {
      %1431 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1432 = arith.constant 7 : i64
      %1433 = func.call @cc_make_string(%1431, %1432) : (!llvm.ptr, i64) -> i64
      %1434 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1435 = arith.constant 11 : i64
      %1436 = func.call @cc_make_string(%1434, %1435) : (!llvm.ptr, i64) -> i64
      %1437 = func.call @cc_intern(%1433, %1436) : (i64, i64) -> i64
      %1438 = func.call @cc_nil_value() : () -> i64
      %1439 = func.call @cc_cons(%1437, %1438) : (i64, i64) -> i64
      %1440 = func.call @cc_values_pack(%1439) : (i64) -> i64
      func.call @stack_push_pointer(%1437) : (i64) -> ()
      %1441 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1442 = arith.constant 8 : i64
      %1443 = func.call @cc_make_string(%1441, %1442) : (!llvm.ptr, i64) -> i64
      %1444 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1445 = arith.constant 11 : i64
      %1446 = func.call @cc_make_string(%1444, %1445) : (!llvm.ptr, i64) -> i64
      %1447 = func.call @cc_intern(%1443, %1446) : (i64, i64) -> i64
      %1448 = func.call @cc_nil_value() : () -> i64
      %1449 = func.call @cc_cons(%1447, %1448) : (i64, i64) -> i64
      %1450 = func.call @cc_values_pack(%1449) : (i64) -> i64
      func.call @stack_push_pointer(%1447) : (i64) -> ()
      %1451 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1452 = arith.constant 8 : i64
      %1453 = func.call @cc_make_string(%1451, %1452) : (!llvm.ptr, i64) -> i64
      %1454 = func.call @cc_nil_value() : () -> i64
      %1455 = func.call @cc_intern(%1453, %1454) : (i64, i64) -> i64
      %1456 = func.call @cc_nil_value() : () -> i64
      %1457 = func.call @cc_cons(%1455, %1456) : (i64, i64) -> i64
      %1458 = func.call @cc_values_pack(%1457) : (i64) -> i64
      func.call @stack_push_pointer(%1455) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1459 = func.call @stack_pop_pointer() : () -> i64
      %1460 = func.call @stack_pop_pointer() : () -> i64
      %1461 = func.call @cc_cons(%1460, %1459) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
      %1462 = arith.addi %1461, %__rlasp_stack_elide_zero_85 : i64
      %1463 = func.call @stack_pop_pointer() : () -> i64
      %1464 = func.call @cc_cons(%1463, %1462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1464) : (i64) -> ()
      %1465 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1465) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1466 = func.call @stack_pop_pointer() : () -> i64
      %1467 = func.call @stack_pop_pointer() : () -> i64
      %1468 = func.call @cc_cons(%1467, %1466) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
      %1469 = arith.addi %1468, %__rlasp_stack_elide_zero_86 : i64
      %1470 = func.call @stack_pop_pointer() : () -> i64
      %1471 = func.call @cc_cons(%1470, %1469) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
      %1472 = arith.addi %1471, %__rlasp_stack_elide_zero_87 : i64
      %1473 = func.call @stack_pop_pointer() : () -> i64
      %1474 = func.call @cc_cons(%1473, %1472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1475 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1476 = arith.constant 8 : i64
      %1477 = func.call @cc_make_string(%1475, %1476) : (!llvm.ptr, i64) -> i64
      %1478 = func.call @cc_nil_value() : () -> i64
      %1479 = func.call @cc_intern(%1477, %1478) : (i64, i64) -> i64
      %1480 = func.call @cc_nil_value() : () -> i64
      %1481 = func.call @cc_cons(%1479, %1480) : (i64, i64) -> i64
      %1482 = func.call @cc_values_pack(%1481) : (i64) -> i64
      %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
      %1483 = arith.addi %1479, %__rlasp_stack_elide_zero_88 : i64
      %1484 = func.call @cc_nil_value() : () -> i64
      %1485 = func.call @cc_errorp(%1483) : (i64) -> i64
      %1486 = arith.cmpi ne, %1485, %1484 : i64
      %1487 = arith.cmpi eq, %1484, %1484 : i64
      %1488 = arith.andi %1486, %1487 : i1
      %1489 = scf.if %1488 -> (i64) {
        scf.yield %1483 : i64
      } else {
        scf.yield %1484 : i64
      }
      %1490 = arith.cmpi ne, %1489, %1484 : i64
      scf.if %1490 {
        func.call @stack_push_pointer(%1489) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1483) : (i64) -> ()
        %1491 = llvm.mlir.addressof @str120 : !llvm.ptr
        %1492 = func.call @cc_make_function_ref_const(%1491) : (!llvm.ptr) -> i64
        %1493 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1492, %1493) : (i64, i64) -> ()
      }
      %1494 = func.call @stack_pop_pointer() : () -> i64
      %1495 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%1494, %1495) : (i64, i64) -> ()
      %1496 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1496 : i64
    }
    func.call @stack_push_pointer(%1430) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str1("n\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_51151114338304*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_51151114338304*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_51151114338304*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_51151114338304*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETMVLIST_51151114338304*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETFLAG_51151114338305*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETVALUE_51151114338305*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETMVLIST_51151114338305*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str11("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("SLEEP-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str14("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str16("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str17("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str18("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str19("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str20("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str21("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str28("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str29("SLEEP-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str31("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str33("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str34("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str35("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str36("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str37("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str38("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str39("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str40("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str42("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str43("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str44("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str45("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str46("SLEEP-3\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str48("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str51("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str54("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str55("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str56("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str59("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str62("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str63("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str64("CONSTANTP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str65("%FN%(setf compiler-macro-function)\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str66("DOCUMENTATION.LIST.COMPILER-MACRO.2\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str67("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str68("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("DOCUMENTATION\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str71("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str72("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str73("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str74("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str77("Buh\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str78("DOCUMENTATION\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str79("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str81("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str82("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str83("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str85("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str86("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("Buh\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str89("%FN%(setf COMMON-LISP::DOCUMENTATION)\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str90("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str91("COMPILER-MACRO\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("DOCUMENTATION\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str94("Buh\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str95("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str97("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str98("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str100("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str101("FUNCALL-COMPILER-MACRO\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str102("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("COMPILER-MACRO-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str107("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str108("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str113("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str114("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str117("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str118("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str119("%%TEST%%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str120("COMPILER-MACRO-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str121("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str122("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str123("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str124("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str125("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str126("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str127("*__MLIR_BLOCK_RETFLAG_51151114338305*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str128("*__MLIR_BLOCK_RETMVLIST_51151114338305*\00") : !llvm.array<40 x i8>
}
