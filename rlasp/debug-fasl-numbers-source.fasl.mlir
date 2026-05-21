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
    %8 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %8) : (i64, i64) -> ()
    %9 = func.call @cc_nil_value() : () -> i64
    %10 = llvm.mlir.addressof @str1 : !llvm.ptr
    %11 = arith.constant 38 : i64
    %12 = func.call @cc_make_string(%10, %11) : (!llvm.ptr, i64) -> i64
    %13 = func.call @cc_nil_value() : () -> i64
    %14 = func.call @cc_intern(%12, %13) : (i64, i64) -> i64
    %15 = func.call @cc_nil_value() : () -> i64
    %16 = func.call @cc_cons(%14, %15) : (i64, i64) -> i64
    %17 = func.call @cc_values_pack(%16) : (i64) -> i64
    %18 = func.call @cc_set_symbol_value(%14, %9) : (i64, i64) -> i64
    %19 = llvm.mlir.addressof @str2 : !llvm.ptr
    %20 = arith.constant 39 : i64
    %21 = func.call @cc_make_string(%19, %20) : (!llvm.ptr, i64) -> i64
    %22 = func.call @cc_nil_value() : () -> i64
    %23 = func.call @cc_intern(%21, %22) : (i64, i64) -> i64
    %24 = func.call @cc_nil_value() : () -> i64
    %25 = func.call @cc_cons(%23, %24) : (i64, i64) -> i64
    %26 = func.call @cc_values_pack(%25) : (i64) -> i64
    %27 = func.call @cc_set_symbol_value(%23, %9) : (i64, i64) -> i64
    %28 = llvm.mlir.addressof @str3 : !llvm.ptr
    %29 = arith.constant 40 : i64
    %30 = func.call @cc_make_string(%28, %29) : (!llvm.ptr, i64) -> i64
    %31 = func.call @cc_nil_value() : () -> i64
    %32 = func.call @cc_intern(%30, %31) : (i64, i64) -> i64
    %33 = func.call @cc_nil_value() : () -> i64
    %34 = func.call @cc_cons(%32, %33) : (i64, i64) -> i64
    %35 = func.call @cc_values_pack(%34) : (i64) -> i64
    %36 = func.call @cc_set_symbol_value(%32, %9) : (i64, i64) -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_errorp(%37) : (i64) -> i64
    %40 = arith.cmpi ne, %39, %38 : i64
    %41 = scf.if %40 -> (i64) {
      scf.yield %37 : i64
    } else {
      %42 = llvm.mlir.addressof @str4 : !llvm.ptr
      %43 = arith.constant 11 : i64
      %44 = func.call @cc_make_string(%42, %43) : (!llvm.ptr, i64) -> i64
      %45 = func.call @cc_nil_value() : () -> i64
      %46 = func.call @cc_intern(%44, %45) : (i64, i64) -> i64
      %47 = func.call @cc_nil_value() : () -> i64
      %48 = func.call @cc_cons(%46, %47) : (i64, i64) -> i64
      %49 = func.call @cc_values_pack(%48) : (i64) -> i64
      %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
      %50 = arith.addi %46, %__rlasp_stack_elide_zero_0 : i64
      %51 = func.call @cc_in_package(%50) : (i64) -> i64
      %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
      %52 = arith.addi %51, %__rlasp_stack_elide_zero_1 : i64
      scf.yield %52 : i64
    }
    %53 = func.call @cc_nil_value() : () -> i64
    %54 = func.call @cc_errorp(%41) : (i64) -> i64
    %55 = arith.cmpi ne, %54, %53 : i64
    %56 = scf.if %55 -> (i64) {
      scf.yield %41 : i64
    } else {
      %57 = func.call @cc_t_value() : () -> i64
      %58 = llvm.mlir.addressof @str5 : !llvm.ptr
      %59 = arith.constant 52 : i64
      %60 = func.call @cc_make_string(%58, %59) : (!llvm.ptr, i64) -> i64
      %61 = llvm.mlir.addressof @str6 : !llvm.ptr
      %62 = arith.constant 20 : i64
      %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
      %64 = llvm.mlir.addressof @str7 : !llvm.ptr
      %65 = arith.constant 11 : i64
      %66 = func.call @cc_make_string(%64, %65) : (!llvm.ptr, i64) -> i64
      %67 = func.call @cc_intern(%63, %66) : (i64, i64) -> i64
      %68 = func.call @cc_nil_value() : () -> i64
      %69 = func.call @cc_cons(%67, %68) : (i64, i64) -> i64
      %70 = func.call @cc_values_pack(%69) : (i64) -> i64
      %71 = func.call @cc_symbol_value(%67) : (i64) -> i64
      %72 = arith.constant 1 : i64
      %73 = func.call @cc_box_fixnum(%72) : (i64) -> i64
      %75 = arith.constant 3 : i64
      %74 = arith.andi %71, %75 : i64
      %76 = arith.constant 0 : i64
      %77 = arith.cmpi eq, %74, %76 : i64
      %79 = arith.constant 3 : i64
      %78 = arith.andi %73, %79 : i64
      %80 = arith.constant 0 : i64
      %81 = arith.cmpi eq, %78, %80 : i64
      %82 = arith.andi %77, %81 : i1
      %83 = scf.if %82 -> (i64) {
        %84 = arith.constant 2 : i64
        %85 = arith.shrsi %71, %84 : i64
        %86 = arith.constant 2 : i64
        %87 = arith.shrsi %73, %86 : i64
        %88 = arith.addi %85, %87 : i64
        %89 = arith.constant -2305843009213693952 : i64
        %90 = arith.constant 2305843009213693951 : i64
        %91 = arith.cmpi sge, %88, %89 : i64
        %92 = arith.cmpi sle, %88, %90 : i64
        %93 = arith.andi %91, %92 : i1
        %94 = scf.if %93 -> (i64) {
          %95 = arith.constant 2 : i64
          %96 = arith.shli %88, %95 : i64
          scf.yield %96 : i64
        } else {
          %97 = func.call @cc_add(%71, %73) : (i64, i64) -> i64
          scf.yield %97 : i64
        }
        scf.yield %94 : i64
      } else {
        %98 = func.call @cc_add(%71, %73) : (i64, i64) -> i64
        scf.yield %98 : i64
      }
      %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
      %99 = arith.addi %83, %__rlasp_stack_elide_zero_2 : i64
      %100 = llvm.mlir.addressof @str8 : !llvm.ptr
      %101 = arith.constant 20 : i64
      %102 = func.call @cc_make_string(%100, %101) : (!llvm.ptr, i64) -> i64
      %103 = llvm.mlir.addressof @str9 : !llvm.ptr
      %104 = arith.constant 11 : i64
      %105 = func.call @cc_make_string(%103, %104) : (!llvm.ptr, i64) -> i64
      %106 = func.call @cc_intern(%102, %105) : (i64, i64) -> i64
      %107 = func.call @cc_nil_value() : () -> i64
      %108 = func.call @cc_cons(%106, %107) : (i64, i64) -> i64
      %109 = func.call @cc_values_pack(%108) : (i64) -> i64
      %110 = func.call @cc_symbol_value(%106) : (i64) -> i64
      %111 = arith.constant 1 : i64
      %112 = func.call @cc_box_fixnum(%111) : (i64) -> i64
      %114 = arith.constant 3 : i64
      %113 = arith.andi %110, %114 : i64
      %115 = arith.constant 0 : i64
      %116 = arith.cmpi eq, %113, %115 : i64
      %118 = arith.constant 3 : i64
      %117 = arith.andi %112, %118 : i64
      %119 = arith.constant 0 : i64
      %120 = arith.cmpi eq, %117, %119 : i64
      %121 = arith.andi %116, %120 : i1
      %122 = scf.if %121 -> (i64) {
        %123 = arith.constant 2 : i64
        %124 = arith.shrsi %110, %123 : i64
        %125 = arith.constant 2 : i64
        %126 = arith.shrsi %112, %125 : i64
        %127 = arith.addi %124, %126 : i64
        %128 = arith.constant -2305843009213693952 : i64
        %129 = arith.constant 2305843009213693951 : i64
        %130 = arith.cmpi sge, %127, %128 : i64
        %131 = arith.cmpi sle, %127, %129 : i64
        %132 = arith.andi %130, %131 : i1
        %133 = scf.if %132 -> (i64) {
          %134 = arith.constant 2 : i64
          %135 = arith.shli %127, %134 : i64
          scf.yield %135 : i64
        } else {
          %136 = func.call @cc_add(%110, %112) : (i64, i64) -> i64
          scf.yield %136 : i64
        }
        scf.yield %133 : i64
      } else {
        %137 = func.call @cc_add(%110, %112) : (i64, i64) -> i64
        scf.yield %137 : i64
      }
      %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
      %138 = arith.addi %122, %__rlasp_stack_elide_zero_3 : i64
      %139 = func.call @cc_type_of(%138) : (i64) -> i64
      %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
      %140 = arith.addi %139, %__rlasp_stack_elide_zero_4 : i64
      %141 = llvm.mlir.addressof @str10 : !llvm.ptr
      %142 = arith.constant 20 : i64
      %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
      %144 = llvm.mlir.addressof @str11 : !llvm.ptr
      %145 = arith.constant 11 : i64
      %146 = func.call @cc_make_string(%144, %145) : (!llvm.ptr, i64) -> i64
      %147 = func.call @cc_intern(%143, %146) : (i64, i64) -> i64
      %148 = func.call @cc_nil_value() : () -> i64
      %149 = func.call @cc_cons(%147, %148) : (i64, i64) -> i64
      %150 = func.call @cc_values_pack(%149) : (i64) -> i64
      %151 = func.call @cc_symbol_value(%147) : (i64) -> i64
      %152 = arith.constant 1 : i64
      %153 = func.call @cc_box_fixnum(%152) : (i64) -> i64
      %155 = arith.constant 3 : i64
      %154 = arith.andi %151, %155 : i64
      %156 = arith.constant 0 : i64
      %157 = arith.cmpi eq, %154, %156 : i64
      %159 = arith.constant 3 : i64
      %158 = arith.andi %153, %159 : i64
      %160 = arith.constant 0 : i64
      %161 = arith.cmpi eq, %158, %160 : i64
      %162 = arith.andi %157, %161 : i1
      %163 = scf.if %162 -> (i64) {
        %164 = arith.constant 2 : i64
        %165 = arith.shrsi %151, %164 : i64
        %166 = arith.constant 2 : i64
        %167 = arith.shrsi %153, %166 : i64
        %168 = arith.addi %165, %167 : i64
        %169 = arith.constant -2305843009213693952 : i64
        %170 = arith.constant 2305843009213693951 : i64
        %171 = arith.cmpi sge, %168, %169 : i64
        %172 = arith.cmpi sle, %168, %170 : i64
        %173 = arith.andi %171, %172 : i1
        %174 = scf.if %173 -> (i64) {
          %175 = arith.constant 2 : i64
          %176 = arith.shli %168, %175 : i64
          scf.yield %176 : i64
        } else {
          %177 = func.call @cc_add(%151, %153) : (i64, i64) -> i64
          scf.yield %177 : i64
        }
        scf.yield %174 : i64
      } else {
        %178 = func.call @cc_add(%151, %153) : (i64, i64) -> i64
        scf.yield %178 : i64
      }
      func.call @stack_push_pointer(%163) : (i64) -> ()
      %179 = llvm.mlir.addressof @str12 : !llvm.ptr
      %180 = arith.constant 6 : i64
      %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
      %182 = llvm.mlir.addressof @str13 : !llvm.ptr
      %183 = arith.constant 11 : i64
      %184 = func.call @cc_make_string(%182, %183) : (!llvm.ptr, i64) -> i64
      %185 = func.call @cc_intern(%181, %184) : (i64, i64) -> i64
      %186 = func.call @cc_nil_value() : () -> i64
      %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
      %188 = func.call @cc_values_pack(%187) : (i64) -> i64
      %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
      %189 = arith.addi %185, %__rlasp_stack_elide_zero_5 : i64
      %190 = func.call @stack_pop_pointer() : () -> i64
      %191 = func.call @cc_typep(%190, %189) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
      %192 = arith.addi %191, %__rlasp_stack_elide_zero_6 : i64
      %193 = llvm.mlir.addressof @str14 : !llvm.ptr
      %194 = arith.constant 20 : i64
      %195 = func.call @cc_make_string(%193, %194) : (!llvm.ptr, i64) -> i64
      %196 = llvm.mlir.addressof @str15 : !llvm.ptr
      %197 = arith.constant 11 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = func.call @cc_intern(%195, %198) : (i64, i64) -> i64
      %200 = func.call @cc_nil_value() : () -> i64
      %201 = func.call @cc_cons(%199, %200) : (i64, i64) -> i64
      %202 = func.call @cc_values_pack(%201) : (i64) -> i64
      %203 = func.call @cc_symbol_value(%199) : (i64) -> i64
      %204 = arith.constant 1 : i64
      %205 = func.call @cc_box_fixnum(%204) : (i64) -> i64
      %207 = arith.constant 3 : i64
      %206 = arith.andi %203, %207 : i64
      %208 = arith.constant 0 : i64
      %209 = arith.cmpi eq, %206, %208 : i64
      %211 = arith.constant 3 : i64
      %210 = arith.andi %205, %211 : i64
      %212 = arith.constant 0 : i64
      %213 = arith.cmpi eq, %210, %212 : i64
      %214 = arith.andi %209, %213 : i1
      %215 = scf.if %214 -> (i64) {
        %216 = arith.constant 2 : i64
        %217 = arith.shrsi %203, %216 : i64
        %218 = arith.constant 2 : i64
        %219 = arith.shrsi %205, %218 : i64
        %220 = arith.addi %217, %219 : i64
        %221 = arith.constant -2305843009213693952 : i64
        %222 = arith.constant 2305843009213693951 : i64
        %223 = arith.cmpi sge, %220, %221 : i64
        %224 = arith.cmpi sle, %220, %222 : i64
        %225 = arith.andi %223, %224 : i1
        %226 = scf.if %225 -> (i64) {
          %227 = arith.constant 2 : i64
          %228 = arith.shli %220, %227 : i64
          scf.yield %228 : i64
        } else {
          %229 = func.call @cc_add(%203, %205) : (i64, i64) -> i64
          scf.yield %229 : i64
        }
        scf.yield %226 : i64
      } else {
        %230 = func.call @cc_add(%203, %205) : (i64, i64) -> i64
        scf.yield %230 : i64
      }
      func.call @stack_push_pointer(%215) : (i64) -> ()
      %231 = llvm.mlir.addressof @str16 : !llvm.ptr
      %232 = arith.constant 6 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = llvm.mlir.addressof @str17 : !llvm.ptr
      %235 = arith.constant 11 : i64
      %236 = func.call @cc_make_string(%234, %235) : (!llvm.ptr, i64) -> i64
      %237 = func.call @cc_intern(%233, %236) : (i64, i64) -> i64
      %238 = func.call @cc_nil_value() : () -> i64
      %239 = func.call @cc_cons(%237, %238) : (i64, i64) -> i64
      %240 = func.call @cc_values_pack(%239) : (i64) -> i64
      %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
      %241 = arith.addi %237, %__rlasp_stack_elide_zero_7 : i64
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @cc_typep(%242, %241) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
      %244 = arith.addi %243, %__rlasp_stack_elide_zero_8 : i64
      func.call @stack_push_pointer(%57) : (i64) -> ()
      func.call @stack_push_pointer(%60) : (i64) -> ()
      func.call @stack_push_pointer(%99) : (i64) -> ()
      func.call @stack_push_pointer(%140) : (i64) -> ()
      func.call @stack_push_pointer(%192) : (i64) -> ()
      func.call @stack_push_pointer(%244) : (i64) -> ()
      %245 = llvm.mlir.addressof @str18 : !llvm.ptr
      %246 = func.call @cc_make_function_ref_const(%245) : (!llvm.ptr) -> i64
      %247 = arith.constant 6 : i64
      func.call @cc_funcall_stack(%246, %247) : (i64, i64) -> ()
      %248 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %248 : i64
    }
    %249 = func.call @cc_nil_value() : () -> i64
    %250 = func.call @cc_errorp(%56) : (i64) -> i64
    %251 = arith.cmpi ne, %250, %249 : i64
    %252 = scf.if %251 -> (i64) {
      scf.yield %56 : i64
    } else {
      %253 = func.call @cc_t_value() : () -> i64
      %254 = llvm.mlir.addressof @str19 : !llvm.ptr
      %255 = arith.constant 35 : i64
      %256 = func.call @cc_make_string(%254, %255) : (!llvm.ptr, i64) -> i64
      %257 = arith.constant 0 : i64
      %258 = func.call @cc_box_fixnum(%257) : (i64) -> i64
      %259 = func.call @cc_nil_value() : () -> i64
      %260 = func.call @cc_nil_value() : () -> i64
      %261 = func.call @cc_nil_value() : () -> i64
      %262 = func.call @cc_nil_value() : () -> i64
      %263 = func.call @cc_nil_value() : () -> i64
      %264 = func.call @cc_nil_value() : () -> i64
      %265 = func.call @cc_nil_value() : () -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_errorp(%265) : (i64) -> i64
      %268 = arith.cmpi ne, %267, %266 : i64
      %269 = scf.if %268 -> (i64) {
        scf.yield %265 : i64
      } else {
        %270 = func.call @cc_nil_value() : () -> i64
        %271 = llvm.mlir.addressof @str20 : !llvm.ptr
        %272 = arith.constant 38 : i64
        %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
        %274 = func.call @cc_nil_value() : () -> i64
        %275 = func.call @cc_intern(%273, %274) : (i64, i64) -> i64
        %276 = func.call @cc_nil_value() : () -> i64
        %277 = func.call @cc_cons(%275, %276) : (i64, i64) -> i64
        %278 = func.call @cc_values_pack(%277) : (i64) -> i64
        %279 = func.call @cc_set_symbol_value(%275, %270) : (i64, i64) -> i64
        %280 = llvm.mlir.addressof @str21 : !llvm.ptr
        %281 = arith.constant 39 : i64
        %282 = func.call @cc_make_string(%280, %281) : (!llvm.ptr, i64) -> i64
        %283 = func.call @cc_nil_value() : () -> i64
        %284 = func.call @cc_intern(%282, %283) : (i64, i64) -> i64
        %285 = func.call @cc_nil_value() : () -> i64
        %286 = func.call @cc_cons(%284, %285) : (i64, i64) -> i64
        %287 = func.call @cc_values_pack(%286) : (i64) -> i64
        %288 = func.call @cc_set_symbol_value(%284, %270) : (i64, i64) -> i64
        %289 = llvm.mlir.addressof @str22 : !llvm.ptr
        %290 = arith.constant 40 : i64
        %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
        %292 = func.call @cc_nil_value() : () -> i64
        %293 = func.call @cc_intern(%291, %292) : (i64, i64) -> i64
        %294 = func.call @cc_nil_value() : () -> i64
        %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
        %296 = func.call @cc_values_pack(%295) : (i64) -> i64
        %297 = func.call @cc_set_symbol_value(%293, %270) : (i64, i64) -> i64
        %298:7 = scf.while (%arg0 = %264, %arg1 = %259, %arg2 = %260, %arg3 = %261, %arg4 = %262, %arg5 = %263, %arg6 = %258) : (i64, i64, i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64, i64, i64) {
          %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
          %299 = arith.addi %arg6, %__rlasp_stack_elide_zero_9 : i64
          %300 = arith.constant 100 : i64
          func.call @stack_push_fixnum(%300) : (i64) -> ()
          %301 = func.call @stack_pop_pointer() : () -> i64
          %302 = arith.constant 1 : i1
          %304 = arith.constant 3 : i64
          %303 = arith.andi %299, %304 : i64
          %305 = arith.constant 0 : i64
          %306 = arith.cmpi eq, %303, %305 : i64
          %308 = arith.constant 3 : i64
          %307 = arith.andi %301, %308 : i64
          %309 = arith.constant 0 : i64
          %310 = arith.cmpi eq, %307, %309 : i64
          %311 = arith.andi %306, %310 : i1
          %312 = scf.if %311 -> (i1) {
            %313 = arith.constant 2 : i64
            %314 = arith.shrsi %299, %313 : i64
            %315 = arith.constant 2 : i64
            %316 = arith.shrsi %301, %315 : i64
            %317 = arith.cmpi sle, %314, %316 : i64
            scf.yield %317 : i1
          } else {
            %318 = func.call @cc_le(%299, %301) : (i64, i64) -> i64
            %319 = func.call @cc_nil_value() : () -> i64
            %320 = arith.cmpi ne, %318, %319 : i64
            scf.yield %320 : i1
          }
          %321 = arith.andi %302, %312 : i1
          %322 = func.call @cc_nil_value() : () -> i64
          %323 = func.call @cc_t_value() : () -> i64
          %324 = scf.if %321 -> (i64) {
            scf.yield %323 : i64
          } else {
            scf.yield %322 : i64
          }
          %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
          %325 = arith.addi %324, %__rlasp_stack_elide_zero_10 : i64
          %326 = func.call @cc_nil_value() : () -> i64
          %327 = arith.cmpi ne, %325, %326 : i64
          %328 = func.call @cc_nil_value() : () -> i64
          %329 = llvm.mlir.addressof @str23 : !llvm.ptr
          %330 = arith.constant 38 : i64
          %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
          %332 = func.call @cc_nil_value() : () -> i64
          %333 = func.call @cc_intern(%331, %332) : (i64, i64) -> i64
          %334 = func.call @cc_nil_value() : () -> i64
          %335 = func.call @cc_cons(%333, %334) : (i64, i64) -> i64
          %336 = func.call @cc_values_pack(%335) : (i64) -> i64
          %337 = func.call @cc_symbol_value(%333) : (i64) -> i64
          %338 = arith.cmpi ne, %337, %328 : i64
          %339 = llvm.mlir.addressof @str24 : !llvm.ptr
          %340 = arith.constant 38 : i64
          %341 = func.call @cc_make_string(%339, %340) : (!llvm.ptr, i64) -> i64
          %342 = func.call @cc_nil_value() : () -> i64
          %343 = func.call @cc_intern(%341, %342) : (i64, i64) -> i64
          %344 = func.call @cc_nil_value() : () -> i64
          %345 = func.call @cc_cons(%343, %344) : (i64, i64) -> i64
          %346 = func.call @cc_values_pack(%345) : (i64) -> i64
          %347 = func.call @cc_symbol_value(%343) : (i64) -> i64
          %348 = arith.cmpi ne, %347, %328 : i64
          %349 = arith.ori %338, %348 : i1
          %350 = arith.constant 0 : i1
          %351 = arith.cmpi eq, %349, %350 : i1
          %352 = arith.andi %327, %351 : i1
          scf.condition(%352) %arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6 : i64, i64, i64, i64, i64, i64, i64
        } do {
          ^bb0(%353: i64, %354: i64, %355: i64, %356: i64, %357: i64, %358: i64, %359: i64):
          %360 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%360) : (i64) -> ()
          %361 = func.call @stack_depth() : () -> i64
          %362 = arith.constant 0 : i64
          %363 = arith.cmpi sgt, %361, %362 : i64
          scf.if %363 {
            %364 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%359) : (i64) -> ()
          %365 = func.call @stack_depth() : () -> i64
          %366 = arith.constant 0 : i64
          %367 = arith.cmpi sgt, %365, %366 : i64
          scf.if %367 {
            %368 = func.call @stack_pop_pointer() : () -> i64
          }
          %369 = arith.constant 1 : i64
          %370 = func.call @cc_box_fixnum(%369) : (i64) -> i64
          %371 = func.call @cc_nil_value() : () -> i64
          %372 = func.call @cc_errorp(%370) : (i64) -> i64
          %373 = arith.cmpi ne, %372, %371 : i64
          %374 = arith.cmpi eq, %371, %371 : i64
          %375 = arith.andi %373, %374 : i1
          %376 = scf.if %375 -> (i64) {
            scf.yield %370 : i64
          } else {
            scf.yield %371 : i64
          }
          %377 = func.call @cc_errorp(%359) : (i64) -> i64
          %378 = arith.cmpi ne, %377, %371 : i64
          %379 = arith.cmpi eq, %376, %371 : i64
          %380 = arith.andi %378, %379 : i1
          %381 = scf.if %380 -> (i64) {
            scf.yield %359 : i64
          } else {
            scf.yield %376 : i64
          }
          %382 = arith.cmpi ne, %381, %371 : i64
          scf.if %382 {
            func.call @stack_push_pointer(%381) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%370) : (i64) -> ()
            func.call @stack_push_pointer(%359) : (i64) -> ()
            %383 = llvm.mlir.addressof @str25 : !llvm.ptr
            %384 = func.call @cc_make_function_ref_const(%383) : (!llvm.ptr) -> i64
            %385 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%384, %385) : (i64, i64) -> ()
          }
          %386 = func.call @stack_pop_pointer() : () -> i64
          %387 = arith.constant 1 : i64
          %388 = func.call @cc_box_fixnum(%387) : (i64) -> i64
          %390 = arith.constant 3 : i64
          %389 = arith.andi %386, %390 : i64
          %391 = arith.constant 0 : i64
          %392 = arith.cmpi eq, %389, %391 : i64
          %394 = arith.constant 3 : i64
          %393 = arith.andi %388, %394 : i64
          %395 = arith.constant 0 : i64
          %396 = arith.cmpi eq, %393, %395 : i64
          %397 = arith.andi %392, %396 : i1
          %398 = scf.if %397 -> (i64) {
            %399 = arith.constant 2 : i64
            %400 = arith.shrsi %386, %399 : i64
            %401 = arith.constant 2 : i64
            %402 = arith.shrsi %388, %401 : i64
            %403 = arith.subi %400, %402 : i64
            %404 = arith.constant -2305843009213693952 : i64
            %405 = arith.constant 2305843009213693951 : i64
            %406 = arith.cmpi sge, %403, %404 : i64
            %407 = arith.cmpi sle, %403, %405 : i64
            %408 = arith.andi %406, %407 : i1
            %409 = scf.if %408 -> (i64) {
              %410 = arith.constant 2 : i64
              %411 = arith.shli %403, %410 : i64
              scf.yield %411 : i64
            } else {
              %412 = func.call @cc_sub(%386, %388) : (i64, i64) -> i64
              scf.yield %412 : i64
            }
            scf.yield %409 : i64
          } else {
            %413 = func.call @cc_sub(%386, %388) : (i64, i64) -> i64
            scf.yield %413 : i64
          }
          %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
          %414 = arith.addi %398, %__rlasp_stack_elide_zero_11 : i64
          func.call @stack_push_pointer(%414) : (i64) -> ()
          %415 = func.call @stack_depth() : () -> i64
          %416 = arith.constant 0 : i64
          %417 = arith.cmpi sgt, %415, %416 : i64
          scf.if %417 {
            %418 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @cc_clear_multiple_values() : () -> ()
          %419 = func.call @cc_nil_value() : () -> i64
          %420 = func.call @cc_errorp(%414) : (i64) -> i64
          %421 = arith.cmpi ne, %420, %419 : i64
          %422 = arith.cmpi eq, %419, %419 : i64
          %423 = arith.andi %421, %422 : i1
          %424 = scf.if %423 -> (i64) {
            scf.yield %414 : i64
          } else {
            scf.yield %419 : i64
          }
          %425 = arith.cmpi ne, %424, %419 : i64
          scf.if %425 {
            func.call @stack_push_pointer(%424) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%414) : (i64) -> ()
            %426 = llvm.mlir.addressof @str26 : !llvm.ptr
            %427 = func.call @cc_make_function_ref_const(%426) : (!llvm.ptr) -> i64
            %428 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%427, %428) : (i64, i64) -> ()
          }
          %429 = func.call @stack_pop_pointer() : () -> i64
          %430 = func.call @cc_errorp(%429) : (i64) -> i64
          %431 = func.call @cc_nil_value() : () -> i64
          %432 = arith.cmpi ne, %430, %431 : i64
          scf.if %432 {
            func.call @stack_push_pointer(%429) : (i64) -> ()
          } else {
            %433 = func.call @cc_multiple_value_list(%429) : (i64) -> i64
            func.call @stack_push_pointer(%433) : (i64) -> ()
          }
          %434 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%434) : (i64) -> ()
          %435 = func.call @stack_depth() : () -> i64
          %436 = arith.constant 0 : i64
          %437 = arith.cmpi sgt, %435, %436 : i64
          scf.if %437 {
            %438 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
          %439 = arith.addi %434, %__rlasp_stack_elide_zero_12 : i64
          %440 = func.call @cc_car(%439) : (i64) -> i64
          %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
          %441 = arith.addi %440, %__rlasp_stack_elide_zero_13 : i64
          func.call @stack_push_pointer(%441) : (i64) -> ()
          %442 = func.call @stack_depth() : () -> i64
          %443 = arith.constant 0 : i64
          %444 = arith.cmpi sgt, %442, %443 : i64
          scf.if %444 {
            %445 = func.call @stack_pop_pointer() : () -> i64
          }
          %446 = func.call @cc_nil_value() : () -> i64
          %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
          %447 = arith.addi %434, %__rlasp_stack_elide_zero_14 : i64
          %448 = func.call @cc_length(%447) : (i64) -> i64
          %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
          %449 = arith.addi %448, %__rlasp_stack_elide_zero_15 : i64
          %450 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%450) : (i64) -> ()
          %451 = func.call @stack_pop_pointer() : () -> i64
          %452 = arith.constant 1 : i1
          %454 = arith.constant 3 : i64
          %453 = arith.andi %449, %454 : i64
          %455 = arith.constant 0 : i64
          %456 = arith.cmpi eq, %453, %455 : i64
          %458 = arith.constant 3 : i64
          %457 = arith.andi %451, %458 : i64
          %459 = arith.constant 0 : i64
          %460 = arith.cmpi eq, %457, %459 : i64
          %461 = arith.andi %456, %460 : i1
          %462 = scf.if %461 -> (i1) {
            %463 = arith.constant 2 : i64
            %464 = arith.shrsi %449, %463 : i64
            %465 = arith.constant 2 : i64
            %466 = arith.shrsi %451, %465 : i64
            %467 = arith.cmpi eq, %464, %466 : i64
            scf.yield %467 : i1
          } else {
            %468 = func.call @cc_eq(%449, %451) : (i64, i64) -> i64
            %469 = func.call @cc_nil_value() : () -> i64
            %470 = arith.cmpi ne, %468, %469 : i64
            scf.yield %470 : i1
          }
          %471 = arith.andi %452, %462 : i1
          %472 = func.call @cc_nil_value() : () -> i64
          %473 = func.call @cc_t_value() : () -> i64
          %474 = scf.if %471 -> (i64) {
            scf.yield %473 : i64
          } else {
            scf.yield %472 : i64
          }
          %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
          %475 = arith.addi %474, %__rlasp_stack_elide_zero_16 : i64
          func.call @stack_push_pointer(%359) : (i64) -> ()
          %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
          %476 = arith.addi %441, %__rlasp_stack_elide_zero_17 : i64
          %477 = func.call @stack_pop_pointer() : () -> i64
          %478 = func.call @cc_eq(%477, %476) : (i64, i64) -> i64
          %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
          %479 = arith.addi %478, %__rlasp_stack_elide_zero_18 : i64
          %480 = func.call @cc_cons(%479, %446) : (i64, i64) -> i64
          %481 = func.call @cc_cons(%475, %480) : (i64, i64) -> i64
          %482 = func.call @cc_and(%481) : (i64) -> i64
          %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
          %483 = arith.addi %482, %__rlasp_stack_elide_zero_19 : i64
          %484 = func.call @cc_nil_value() : () -> i64
          %485 = func.call @cc_cons(%483, %484) : (i64, i64) -> i64
          %486 = func.call @cc_not(%485) : (i64) -> i64
          %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
          %487 = arith.addi %486, %__rlasp_stack_elide_zero_20 : i64
          %488 = func.call @cc_nil_value() : () -> i64
          %489 = arith.cmpi ne, %487, %488 : i64
          %490:2 = scf.if %489 -> (i64, i64) {
            %491 = func.call @cc_nil_value() : () -> i64
            %492 = func.call @cc_nil_value() : () -> i64
            %493 = func.call @cc_errorp(%491) : (i64) -> i64
            %494 = arith.cmpi ne, %493, %492 : i64
            %495:2 = scf.if %494 -> (i64, i64) {
              scf.yield %491, %358 : i64, i64
            } else {
              func.call @stack_push_pointer(%358) : (i64) -> ()
              %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
              %496 = arith.addi %359, %__rlasp_stack_elide_zero_21 : i64
              %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
              %497 = arith.addi %414, %__rlasp_stack_elide_zero_22 : i64
              %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
              %498 = arith.addi %434, %__rlasp_stack_elide_zero_23 : i64
              %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
              %499 = arith.addi %441, %__rlasp_stack_elide_zero_24 : i64
              %500 = func.call @cc_nil_value() : () -> i64
              %501 = func.call @cc_errorp(%496) : (i64) -> i64
              %502 = arith.cmpi ne, %501, %500 : i64
              %503 = arith.cmpi eq, %500, %500 : i64
              %504 = arith.andi %502, %503 : i1
              %505 = scf.if %504 -> (i64) {
                scf.yield %496 : i64
              } else {
                scf.yield %500 : i64
              }
              %506 = func.call @cc_errorp(%497) : (i64) -> i64
              %507 = arith.cmpi ne, %506, %500 : i64
              %508 = arith.cmpi eq, %505, %500 : i64
              %509 = arith.andi %507, %508 : i1
              %510 = scf.if %509 -> (i64) {
                scf.yield %497 : i64
              } else {
                scf.yield %505 : i64
              }
              %511 = func.call @cc_errorp(%498) : (i64) -> i64
              %512 = arith.cmpi ne, %511, %500 : i64
              %513 = arith.cmpi eq, %510, %500 : i64
              %514 = arith.andi %512, %513 : i1
              %515 = scf.if %514 -> (i64) {
                scf.yield %498 : i64
              } else {
                scf.yield %510 : i64
              }
              %516 = func.call @cc_errorp(%499) : (i64) -> i64
              %517 = arith.cmpi ne, %516, %500 : i64
              %518 = arith.cmpi eq, %515, %500 : i64
              %519 = arith.andi %517, %518 : i1
              %520 = scf.if %519 -> (i64) {
                scf.yield %499 : i64
              } else {
                scf.yield %515 : i64
              }
              %521 = arith.cmpi ne, %520, %500 : i64
              scf.if %521 {
                func.call @stack_push_pointer(%520) : (i64) -> ()
              } else {
                %522 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%522) : (i64) -> ()
                %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
                %523 = arith.addi %499, %__rlasp_stack_elide_zero_25 : i64
                %524 = func.call @stack_pop_pointer() : () -> i64
                %525 = func.call @cc_cons(%523, %524) : (i64, i64) -> i64
                func.call @stack_push_pointer(%525) : (i64) -> ()
                %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
                %526 = arith.addi %498, %__rlasp_stack_elide_zero_26 : i64
                %527 = func.call @stack_pop_pointer() : () -> i64
                %528 = func.call @cc_cons(%526, %527) : (i64, i64) -> i64
                func.call @stack_push_pointer(%528) : (i64) -> ()
                %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
                %529 = arith.addi %497, %__rlasp_stack_elide_zero_27 : i64
                %530 = func.call @stack_pop_pointer() : () -> i64
                %531 = func.call @cc_cons(%529, %530) : (i64, i64) -> i64
                func.call @stack_push_pointer(%531) : (i64) -> ()
                %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
                %532 = arith.addi %496, %__rlasp_stack_elide_zero_28 : i64
                %533 = func.call @stack_pop_pointer() : () -> i64
                %534 = func.call @cc_cons(%532, %533) : (i64, i64) -> i64
                func.call @stack_push_pointer(%534) : (i64) -> ()
              }
              %535 = func.call @stack_pop_pointer() : () -> i64
              %536 = func.call @cc_nil_value() : () -> i64
              %537 = func.call @cc_errorp(%535) : (i64) -> i64
              %538 = arith.cmpi ne, %537, %536 : i64
              %539 = arith.cmpi eq, %536, %536 : i64
              %540 = arith.andi %538, %539 : i1
              %541 = scf.if %540 -> (i64) {
                scf.yield %535 : i64
              } else {
                scf.yield %536 : i64
              }
              %542 = arith.cmpi ne, %541, %536 : i64
              scf.if %542 {
                func.call @stack_push_pointer(%541) : (i64) -> ()
              } else {
                %543 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%543) : (i64) -> ()
                %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
                %544 = arith.addi %535, %__rlasp_stack_elide_zero_29 : i64
                %545 = func.call @stack_pop_pointer() : () -> i64
                %546 = func.call @cc_cons(%544, %545) : (i64, i64) -> i64
                func.call @stack_push_pointer(%546) : (i64) -> ()
              }
              %547 = func.call @stack_pop_pointer() : () -> i64
              %548 = func.call @stack_pop_pointer() : () -> i64
              %549 = func.call @cc_append(%548, %547) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
              %550 = arith.addi %549, %__rlasp_stack_elide_zero_30 : i64
              %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
              %551 = arith.addi %550, %__rlasp_stack_elide_zero_31 : i64
              scf.yield %551, %550 : i64, i64
            }
            %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
            %552 = arith.addi %495#0, %__rlasp_stack_elide_zero_32 : i64
            scf.yield %552, %495#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %553 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %553, %358 : i64, i64
          }
          func.call @stack_push_pointer(%490#0) : (i64) -> ()
          %554 = func.call @stack_depth() : () -> i64
          %555 = arith.constant 0 : i64
          %556 = arith.cmpi sgt, %554, %555 : i64
          scf.if %556 {
            %557 = func.call @stack_pop_pointer() : () -> i64
          }
          %558 = arith.constant 1 : i64
          %559 = func.call @cc_box_fixnum(%558) : (i64) -> i64
          %561 = arith.constant 3 : i64
          %560 = arith.andi %359, %561 : i64
          %562 = arith.constant 0 : i64
          %563 = arith.cmpi eq, %560, %562 : i64
          %565 = arith.constant 3 : i64
          %564 = arith.andi %559, %565 : i64
          %566 = arith.constant 0 : i64
          %567 = arith.cmpi eq, %564, %566 : i64
          %568 = arith.andi %563, %567 : i1
          %569 = scf.if %568 -> (i64) {
            %570 = arith.constant 2 : i64
            %571 = arith.shrsi %359, %570 : i64
            %572 = arith.constant 2 : i64
            %573 = arith.shrsi %559, %572 : i64
            %574 = arith.addi %571, %573 : i64
            %575 = arith.constant -2305843009213693952 : i64
            %576 = arith.constant 2305843009213693951 : i64
            %577 = arith.cmpi sge, %574, %575 : i64
            %578 = arith.cmpi sle, %574, %576 : i64
            %579 = arith.andi %577, %578 : i1
            %580 = scf.if %579 -> (i64) {
              %581 = arith.constant 2 : i64
              %582 = arith.shli %574, %581 : i64
              scf.yield %582 : i64
            } else {
              %583 = func.call @cc_add(%359, %559) : (i64, i64) -> i64
              scf.yield %583 : i64
            }
            scf.yield %580 : i64
          } else {
            %584 = func.call @cc_add(%359, %559) : (i64, i64) -> i64
            scf.yield %584 : i64
          }
          %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
          %585 = arith.addi %569, %__rlasp_stack_elide_zero_33 : i64
          func.call @stack_push_pointer(%585) : (i64) -> ()
          %586 = func.call @stack_depth() : () -> i64
          %587 = arith.constant 0 : i64
          %588 = arith.cmpi sgt, %586, %587 : i64
          scf.if %588 {
            %589 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %360, %359, %414, %434, %441, %490#1, %585 : i64, i64, i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %590 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
        %591 = arith.addi %298#0, %__rlasp_stack_elide_zero_34 : i64
        %592 = func.call @cc_nil_value() : () -> i64
        %593 = arith.cmpi ne, %591, %592 : i64
        %594:2 = scf.if %593 -> (i64, i64) {
          %595 = func.call @cc_nil_value() : () -> i64
          %596 = func.call @cc_nil_value() : () -> i64
          %597 = func.call @cc_errorp(%595) : (i64) -> i64
          %598 = arith.cmpi ne, %597, %596 : i64
          %599:2 = scf.if %598 -> (i64, i64) {
            scf.yield %595, %298#6 : i64, i64
          } else {
            %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
            %600 = arith.addi %298#1, %__rlasp_stack_elide_zero_35 : i64
            scf.yield %600, %298#1 : i64, i64
          }
          %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
          %601 = arith.addi %599#0, %__rlasp_stack_elide_zero_36 : i64
          scf.yield %601, %599#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %602 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %602, %298#6 : i64, i64
        }
        %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
        %603 = arith.addi %594#0, %__rlasp_stack_elide_zero_37 : i64
        %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
        %604 = arith.addi %298#5, %__rlasp_stack_elide_zero_38 : i64
        %605 = func.call @cc_multiple_value_list(%604) : (i64) -> i64
        %606 = llvm.mlir.addressof @str27 : !llvm.ptr
        %607 = arith.constant 38 : i64
        %608 = func.call @cc_make_string(%606, %607) : (!llvm.ptr, i64) -> i64
        %609 = func.call @cc_nil_value() : () -> i64
        %610 = func.call @cc_intern(%608, %609) : (i64, i64) -> i64
        %611 = func.call @cc_nil_value() : () -> i64
        %612 = func.call @cc_cons(%610, %611) : (i64, i64) -> i64
        %613 = func.call @cc_values_pack(%612) : (i64) -> i64
        %614 = func.call @cc_symbol_value(%610) : (i64) -> i64
        %615 = llvm.mlir.addressof @str28 : !llvm.ptr
        %616 = arith.constant 39 : i64
        %617 = func.call @cc_make_string(%615, %616) : (!llvm.ptr, i64) -> i64
        %618 = func.call @cc_nil_value() : () -> i64
        %619 = func.call @cc_intern(%617, %618) : (i64, i64) -> i64
        %620 = func.call @cc_nil_value() : () -> i64
        %621 = func.call @cc_cons(%619, %620) : (i64, i64) -> i64
        %622 = func.call @cc_values_pack(%621) : (i64) -> i64
        %623 = func.call @cc_symbol_value(%619) : (i64) -> i64
        %624 = llvm.mlir.addressof @str29 : !llvm.ptr
        %625 = arith.constant 40 : i64
        %626 = func.call @cc_make_string(%624, %625) : (!llvm.ptr, i64) -> i64
        %627 = func.call @cc_nil_value() : () -> i64
        %628 = func.call @cc_intern(%626, %627) : (i64, i64) -> i64
        %629 = func.call @cc_nil_value() : () -> i64
        %630 = func.call @cc_cons(%628, %629) : (i64, i64) -> i64
        %631 = func.call @cc_values_pack(%630) : (i64) -> i64
        %632 = func.call @cc_symbol_value(%628) : (i64) -> i64
        %633 = func.call @cc_nil_value() : () -> i64
        %634 = arith.cmpi ne, %614, %633 : i64
        %635 = scf.if %634 -> (i64) {
          scf.yield %632 : i64
        } else {
          scf.yield %605 : i64
        }
        %636 = func.call @cc_values_pack(%635) : (i64) -> i64
        %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
        %637 = arith.addi %636, %__rlasp_stack_elide_zero_39 : i64
        scf.yield %637 : i64
      }
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %638 = arith.addi %269, %__rlasp_stack_elide_zero_40 : i64
      func.call @stack_push_pointer(%253) : (i64) -> ()
      func.call @stack_push_pointer(%256) : (i64) -> ()
      func.call @stack_push_pointer(%638) : (i64) -> ()
      %639 = llvm.mlir.addressof @str30 : !llvm.ptr
      %640 = func.call @cc_make_function_ref_const(%639) : (!llvm.ptr) -> i64
      %641 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%640, %641) : (i64, i64) -> ()
      %642 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %642 : i64
    }
    %643 = func.call @cc_nil_value() : () -> i64
    %644 = func.call @cc_errorp(%252) : (i64) -> i64
    %645 = arith.cmpi ne, %644, %643 : i64
    %646 = scf.if %645 -> (i64) {
      scf.yield %252 : i64
    } else {
      %647 = func.call @cc_t_value() : () -> i64
      %648 = llvm.mlir.addressof @str31 : !llvm.ptr
      %649 = arith.constant 27 : i64
      %650 = func.call @cc_make_string(%648, %649) : (!llvm.ptr, i64) -> i64
      %651 = llvm.mlir.addressof @str32 : !llvm.ptr
      %652 = arith.constant 20 : i64
      %653 = func.call @cc_make_string(%651, %652) : (!llvm.ptr, i64) -> i64
      %654 = llvm.mlir.addressof @str33 : !llvm.ptr
      %655 = arith.constant 11 : i64
      %656 = func.call @cc_make_string(%654, %655) : (!llvm.ptr, i64) -> i64
      %657 = func.call @cc_intern(%653, %656) : (i64, i64) -> i64
      %658 = func.call @cc_nil_value() : () -> i64
      %659 = func.call @cc_cons(%657, %658) : (i64, i64) -> i64
      %660 = func.call @cc_values_pack(%659) : (i64) -> i64
      %661 = func.call @cc_symbol_value(%657) : (i64) -> i64
      %662 = arith.constant 1 : i64
      %663 = func.call @cc_box_fixnum(%662) : (i64) -> i64
      %665 = arith.constant 3 : i64
      %664 = arith.andi %661, %665 : i64
      %666 = arith.constant 0 : i64
      %667 = arith.cmpi eq, %664, %666 : i64
      %669 = arith.constant 3 : i64
      %668 = arith.andi %663, %669 : i64
      %670 = arith.constant 0 : i64
      %671 = arith.cmpi eq, %668, %670 : i64
      %672 = arith.andi %667, %671 : i1
      %673 = scf.if %672 -> (i64) {
        %674 = arith.constant 2 : i64
        %675 = arith.shrsi %661, %674 : i64
        %676 = arith.constant 2 : i64
        %677 = arith.shrsi %663, %676 : i64
        %678 = arith.addi %675, %677 : i64
        %679 = arith.constant -2305843009213693952 : i64
        %680 = arith.constant 2305843009213693951 : i64
        %681 = arith.cmpi sge, %678, %679 : i64
        %682 = arith.cmpi sle, %678, %680 : i64
        %683 = arith.andi %681, %682 : i1
        %684 = scf.if %683 -> (i64) {
          %685 = arith.constant 2 : i64
          %686 = arith.shli %678, %685 : i64
          scf.yield %686 : i64
        } else {
          %687 = func.call @cc_add(%661, %663) : (i64, i64) -> i64
          scf.yield %687 : i64
        }
        scf.yield %684 : i64
      } else {
        %688 = func.call @cc_add(%661, %663) : (i64, i64) -> i64
        scf.yield %688 : i64
      }
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %689 = arith.addi %673, %__rlasp_stack_elide_zero_41 : i64
      %690 = func.call @cc_nil_value() : () -> i64
      %691 = func.call @cc_errorp(%689) : (i64) -> i64
      %692 = arith.cmpi ne, %691, %690 : i64
      %693 = arith.cmpi eq, %690, %690 : i64
      %694 = arith.andi %692, %693 : i1
      %695 = scf.if %694 -> (i64) {
        scf.yield %689 : i64
      } else {
        scf.yield %690 : i64
      }
      %696 = arith.cmpi ne, %695, %690 : i64
      scf.if %696 {
        func.call @stack_push_pointer(%695) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%689) : (i64) -> ()
        %697 = llvm.mlir.addressof @str34 : !llvm.ptr
        %698 = func.call @cc_make_function_ref_const(%697) : (!llvm.ptr) -> i64
        %699 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%698, %699) : (i64, i64) -> ()
      }
      %700 = func.call @stack_pop_pointer() : () -> i64
      %701 = llvm.mlir.addressof @str35 : !llvm.ptr
      %702 = arith.constant 20 : i64
      %703 = func.call @cc_make_string(%701, %702) : (!llvm.ptr, i64) -> i64
      %704 = llvm.mlir.addressof @str36 : !llvm.ptr
      %705 = arith.constant 11 : i64
      %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
      %707 = func.call @cc_intern(%703, %706) : (i64, i64) -> i64
      %708 = func.call @cc_nil_value() : () -> i64
      %709 = func.call @cc_cons(%707, %708) : (i64, i64) -> i64
      %710 = func.call @cc_values_pack(%709) : (i64) -> i64
      %711 = func.call @cc_symbol_value(%707) : (i64) -> i64
      %712 = arith.constant 1 : i64
      %713 = func.call @cc_box_fixnum(%712) : (i64) -> i64
      %715 = arith.constant 3 : i64
      %714 = arith.andi %711, %715 : i64
      %716 = arith.constant 0 : i64
      %717 = arith.cmpi eq, %714, %716 : i64
      %719 = arith.constant 3 : i64
      %718 = arith.andi %713, %719 : i64
      %720 = arith.constant 0 : i64
      %721 = arith.cmpi eq, %718, %720 : i64
      %722 = arith.andi %717, %721 : i1
      %723 = scf.if %722 -> (i64) {
        %724 = arith.constant 2 : i64
        %725 = arith.shrsi %711, %724 : i64
        %726 = arith.constant 2 : i64
        %727 = arith.shrsi %713, %726 : i64
        %728 = arith.addi %725, %727 : i64
        %729 = arith.constant -2305843009213693952 : i64
        %730 = arith.constant 2305843009213693951 : i64
        %731 = arith.cmpi sge, %728, %729 : i64
        %732 = arith.cmpi sle, %728, %730 : i64
        %733 = arith.andi %731, %732 : i1
        %734 = scf.if %733 -> (i64) {
          %735 = arith.constant 2 : i64
          %736 = arith.shli %728, %735 : i64
          scf.yield %736 : i64
        } else {
          %737 = func.call @cc_add(%711, %713) : (i64, i64) -> i64
          scf.yield %737 : i64
        }
        scf.yield %734 : i64
      } else {
        %738 = func.call @cc_add(%711, %713) : (i64, i64) -> i64
        scf.yield %738 : i64
      }
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %739 = arith.addi %723, %__rlasp_stack_elide_zero_42 : i64
      %740 = arith.constant 1 : i1
      %742 = arith.constant 3 : i64
      %741 = arith.andi %700, %742 : i64
      %743 = arith.constant 0 : i64
      %744 = arith.cmpi eq, %741, %743 : i64
      %746 = arith.constant 3 : i64
      %745 = arith.andi %739, %746 : i64
      %747 = arith.constant 0 : i64
      %748 = arith.cmpi eq, %745, %747 : i64
      %749 = arith.andi %744, %748 : i1
      %750 = scf.if %749 -> (i1) {
        %751 = arith.constant 2 : i64
        %752 = arith.shrsi %700, %751 : i64
        %753 = arith.constant 2 : i64
        %754 = arith.shrsi %739, %753 : i64
        %755 = arith.cmpi eq, %752, %754 : i64
        scf.yield %755 : i1
      } else {
        %756 = func.call @cc_eq(%700, %739) : (i64, i64) -> i64
        %757 = func.call @cc_nil_value() : () -> i64
        %758 = arith.cmpi ne, %756, %757 : i64
        scf.yield %758 : i1
      }
      %759 = arith.andi %740, %750 : i1
      %760 = func.call @cc_nil_value() : () -> i64
      %761 = func.call @cc_t_value() : () -> i64
      %762 = scf.if %759 -> (i64) {
        scf.yield %761 : i64
      } else {
        scf.yield %760 : i64
      }
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %763 = arith.addi %762, %__rlasp_stack_elide_zero_43 : i64
      %764 = llvm.mlir.addressof @str37 : !llvm.ptr
      %765 = arith.constant 20 : i64
      %766 = func.call @cc_make_string(%764, %765) : (!llvm.ptr, i64) -> i64
      %767 = llvm.mlir.addressof @str38 : !llvm.ptr
      %768 = arith.constant 11 : i64
      %769 = func.call @cc_make_string(%767, %768) : (!llvm.ptr, i64) -> i64
      %770 = func.call @cc_intern(%766, %769) : (i64, i64) -> i64
      %771 = func.call @cc_nil_value() : () -> i64
      %772 = func.call @cc_cons(%770, %771) : (i64, i64) -> i64
      %773 = func.call @cc_values_pack(%772) : (i64) -> i64
      %774 = func.call @cc_symbol_value(%770) : (i64) -> i64
      %775 = arith.constant 1 : i64
      %776 = func.call @cc_box_fixnum(%775) : (i64) -> i64
      %778 = arith.constant 3 : i64
      %777 = arith.andi %774, %778 : i64
      %779 = arith.constant 0 : i64
      %780 = arith.cmpi eq, %777, %779 : i64
      %782 = arith.constant 3 : i64
      %781 = arith.andi %776, %782 : i64
      %783 = arith.constant 0 : i64
      %784 = arith.cmpi eq, %781, %783 : i64
      %785 = arith.andi %780, %784 : i1
      %786 = scf.if %785 -> (i64) {
        %787 = arith.constant 2 : i64
        %788 = arith.shrsi %774, %787 : i64
        %789 = arith.constant 2 : i64
        %790 = arith.shrsi %776, %789 : i64
        %791 = arith.addi %788, %790 : i64
        %792 = arith.constant -2305843009213693952 : i64
        %793 = arith.constant 2305843009213693951 : i64
        %794 = arith.cmpi sge, %791, %792 : i64
        %795 = arith.cmpi sle, %791, %793 : i64
        %796 = arith.andi %794, %795 : i1
        %797 = scf.if %796 -> (i64) {
          %798 = arith.constant 2 : i64
          %799 = arith.shli %791, %798 : i64
          scf.yield %799 : i64
        } else {
          %800 = func.call @cc_add(%774, %776) : (i64, i64) -> i64
          scf.yield %800 : i64
        }
        scf.yield %797 : i64
      } else {
        %801 = func.call @cc_add(%774, %776) : (i64, i64) -> i64
        scf.yield %801 : i64
      }
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %802 = arith.addi %786, %__rlasp_stack_elide_zero_44 : i64
      %803 = llvm.mlir.addressof @str39 : !llvm.ptr
      %804 = arith.constant 20 : i64
      %805 = func.call @cc_make_string(%803, %804) : (!llvm.ptr, i64) -> i64
      %806 = llvm.mlir.addressof @str40 : !llvm.ptr
      %807 = arith.constant 11 : i64
      %808 = func.call @cc_make_string(%806, %807) : (!llvm.ptr, i64) -> i64
      %809 = func.call @cc_intern(%805, %808) : (i64, i64) -> i64
      %810 = func.call @cc_nil_value() : () -> i64
      %811 = func.call @cc_cons(%809, %810) : (i64, i64) -> i64
      %812 = func.call @cc_values_pack(%811) : (i64) -> i64
      %813 = func.call @cc_symbol_value(%809) : (i64) -> i64
      %814 = arith.constant 1 : i64
      %815 = func.call @cc_box_fixnum(%814) : (i64) -> i64
      %817 = arith.constant 3 : i64
      %816 = arith.andi %813, %817 : i64
      %818 = arith.constant 0 : i64
      %819 = arith.cmpi eq, %816, %818 : i64
      %821 = arith.constant 3 : i64
      %820 = arith.andi %815, %821 : i64
      %822 = arith.constant 0 : i64
      %823 = arith.cmpi eq, %820, %822 : i64
      %824 = arith.andi %819, %823 : i1
      %825 = scf.if %824 -> (i64) {
        %826 = arith.constant 2 : i64
        %827 = arith.shrsi %813, %826 : i64
        %828 = arith.constant 2 : i64
        %829 = arith.shrsi %815, %828 : i64
        %830 = arith.addi %827, %829 : i64
        %831 = arith.constant -2305843009213693952 : i64
        %832 = arith.constant 2305843009213693951 : i64
        %833 = arith.cmpi sge, %830, %831 : i64
        %834 = arith.cmpi sle, %830, %832 : i64
        %835 = arith.andi %833, %834 : i1
        %836 = scf.if %835 -> (i64) {
          %837 = arith.constant 2 : i64
          %838 = arith.shli %830, %837 : i64
          scf.yield %838 : i64
        } else {
          %839 = func.call @cc_add(%813, %815) : (i64, i64) -> i64
          scf.yield %839 : i64
        }
        scf.yield %836 : i64
      } else {
        %840 = func.call @cc_add(%813, %815) : (i64, i64) -> i64
        scf.yield %840 : i64
      }
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %841 = arith.addi %825, %__rlasp_stack_elide_zero_45 : i64
      %842 = arith.constant 1 : i64
      %843 = func.call @cc_box_fixnum(%842) : (i64) -> i64
      %845 = arith.constant 3 : i64
      %844 = arith.andi %841, %845 : i64
      %846 = arith.constant 0 : i64
      %847 = arith.cmpi eq, %844, %846 : i64
      %849 = arith.constant 3 : i64
      %848 = arith.andi %843, %849 : i64
      %850 = arith.constant 0 : i64
      %851 = arith.cmpi eq, %848, %850 : i64
      %852 = arith.andi %847, %851 : i1
      %853 = scf.if %852 -> (i64) {
        %854 = arith.constant 2 : i64
        %855 = arith.shrsi %841, %854 : i64
        %856 = arith.constant 2 : i64
        %857 = arith.shrsi %843, %856 : i64
        %858 = arith.addi %855, %857 : i64
        %859 = arith.constant -2305843009213693952 : i64
        %860 = arith.constant 2305843009213693951 : i64
        %861 = arith.cmpi sge, %858, %859 : i64
        %862 = arith.cmpi sle, %858, %860 : i64
        %863 = arith.andi %861, %862 : i1
        %864 = scf.if %863 -> (i64) {
          %865 = arith.constant 2 : i64
          %866 = arith.shli %858, %865 : i64
          scf.yield %866 : i64
        } else {
          %867 = func.call @cc_add(%841, %843) : (i64, i64) -> i64
          scf.yield %867 : i64
        }
        scf.yield %864 : i64
      } else {
        %868 = func.call @cc_add(%841, %843) : (i64, i64) -> i64
        scf.yield %868 : i64
      }
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %869 = arith.addi %853, %__rlasp_stack_elide_zero_46 : i64
      %870 = func.call @cc_nil_value() : () -> i64
      %871 = func.call @cc_errorp(%802) : (i64) -> i64
      %872 = arith.cmpi ne, %871, %870 : i64
      %873 = arith.cmpi eq, %870, %870 : i64
      %874 = arith.andi %872, %873 : i1
      %875 = scf.if %874 -> (i64) {
        scf.yield %802 : i64
      } else {
        scf.yield %870 : i64
      }
      %876 = func.call @cc_errorp(%869) : (i64) -> i64
      %877 = arith.cmpi ne, %876, %870 : i64
      %878 = arith.cmpi eq, %875, %870 : i64
      %879 = arith.andi %877, %878 : i1
      %880 = scf.if %879 -> (i64) {
        scf.yield %869 : i64
      } else {
        scf.yield %875 : i64
      }
      %881 = arith.cmpi ne, %880, %870 : i64
      scf.if %881 {
        func.call @stack_push_pointer(%880) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%802) : (i64) -> ()
        func.call @stack_push_pointer(%869) : (i64) -> ()
        %882 = llvm.mlir.addressof @str41 : !llvm.ptr
        %883 = func.call @cc_make_function_ref_const(%882) : (!llvm.ptr) -> i64
        %884 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%883, %884) : (i64, i64) -> ()
      }
      %885 = func.call @stack_pop_pointer() : () -> i64
      %886 = llvm.mlir.addressof @str42 : !llvm.ptr
      %887 = arith.constant 20 : i64
      %888 = func.call @cc_make_string(%886, %887) : (!llvm.ptr, i64) -> i64
      %889 = llvm.mlir.addressof @str43 : !llvm.ptr
      %890 = arith.constant 11 : i64
      %891 = func.call @cc_make_string(%889, %890) : (!llvm.ptr, i64) -> i64
      %892 = func.call @cc_intern(%888, %891) : (i64, i64) -> i64
      %893 = func.call @cc_nil_value() : () -> i64
      %894 = func.call @cc_cons(%892, %893) : (i64, i64) -> i64
      %895 = func.call @cc_values_pack(%894) : (i64) -> i64
      %896 = func.call @cc_symbol_value(%892) : (i64) -> i64
      %897 = arith.constant 1 : i64
      %898 = func.call @cc_box_fixnum(%897) : (i64) -> i64
      %900 = arith.constant 3 : i64
      %899 = arith.andi %896, %900 : i64
      %901 = arith.constant 0 : i64
      %902 = arith.cmpi eq, %899, %901 : i64
      %904 = arith.constant 3 : i64
      %903 = arith.andi %898, %904 : i64
      %905 = arith.constant 0 : i64
      %906 = arith.cmpi eq, %903, %905 : i64
      %907 = arith.andi %902, %906 : i1
      %908 = scf.if %907 -> (i64) {
        %909 = arith.constant 2 : i64
        %910 = arith.shrsi %896, %909 : i64
        %911 = arith.constant 2 : i64
        %912 = arith.shrsi %898, %911 : i64
        %913 = arith.addi %910, %912 : i64
        %914 = arith.constant -2305843009213693952 : i64
        %915 = arith.constant 2305843009213693951 : i64
        %916 = arith.cmpi sge, %913, %914 : i64
        %917 = arith.cmpi sle, %913, %915 : i64
        %918 = arith.andi %916, %917 : i1
        %919 = scf.if %918 -> (i64) {
          %920 = arith.constant 2 : i64
          %921 = arith.shli %913, %920 : i64
          scf.yield %921 : i64
        } else {
          %922 = func.call @cc_add(%896, %898) : (i64, i64) -> i64
          scf.yield %922 : i64
        }
        scf.yield %919 : i64
      } else {
        %923 = func.call @cc_add(%896, %898) : (i64, i64) -> i64
        scf.yield %923 : i64
      }
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %924 = arith.addi %908, %__rlasp_stack_elide_zero_47 : i64
      %925 = arith.constant 1 : i1
      %927 = arith.constant 3 : i64
      %926 = arith.andi %885, %927 : i64
      %928 = arith.constant 0 : i64
      %929 = arith.cmpi eq, %926, %928 : i64
      %931 = arith.constant 3 : i64
      %930 = arith.andi %924, %931 : i64
      %932 = arith.constant 0 : i64
      %933 = arith.cmpi eq, %930, %932 : i64
      %934 = arith.andi %929, %933 : i1
      %935 = scf.if %934 -> (i1) {
        %936 = arith.constant 2 : i64
        %937 = arith.shrsi %885, %936 : i64
        %938 = arith.constant 2 : i64
        %939 = arith.shrsi %924, %938 : i64
        %940 = arith.cmpi eq, %937, %939 : i64
        scf.yield %940 : i1
      } else {
        %941 = func.call @cc_eq(%885, %924) : (i64, i64) -> i64
        %942 = func.call @cc_nil_value() : () -> i64
        %943 = arith.cmpi ne, %941, %942 : i64
        scf.yield %943 : i1
      }
      %944 = arith.andi %925, %935 : i1
      %945 = func.call @cc_nil_value() : () -> i64
      %946 = func.call @cc_t_value() : () -> i64
      %947 = scf.if %944 -> (i64) {
        scf.yield %946 : i64
      } else {
        scf.yield %945 : i64
      }
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %948 = arith.addi %947, %__rlasp_stack_elide_zero_48 : i64
      %949 = llvm.mlir.addressof @str44 : !llvm.ptr
      %950 = arith.constant 20 : i64
      %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
      %952 = llvm.mlir.addressof @str45 : !llvm.ptr
      %953 = arith.constant 11 : i64
      %954 = func.call @cc_make_string(%952, %953) : (!llvm.ptr, i64) -> i64
      %955 = func.call @cc_intern(%951, %954) : (i64, i64) -> i64
      %956 = func.call @cc_nil_value() : () -> i64
      %957 = func.call @cc_cons(%955, %956) : (i64, i64) -> i64
      %958 = func.call @cc_values_pack(%957) : (i64) -> i64
      %959 = func.call @cc_symbol_value(%955) : (i64) -> i64
      %960 = arith.constant 1 : i64
      %961 = func.call @cc_box_fixnum(%960) : (i64) -> i64
      %963 = arith.constant 3 : i64
      %962 = arith.andi %959, %963 : i64
      %964 = arith.constant 0 : i64
      %965 = arith.cmpi eq, %962, %964 : i64
      %967 = arith.constant 3 : i64
      %966 = arith.andi %961, %967 : i64
      %968 = arith.constant 0 : i64
      %969 = arith.cmpi eq, %966, %968 : i64
      %970 = arith.andi %965, %969 : i1
      %971 = scf.if %970 -> (i64) {
        %972 = arith.constant 2 : i64
        %973 = arith.shrsi %959, %972 : i64
        %974 = arith.constant 2 : i64
        %975 = arith.shrsi %961, %974 : i64
        %976 = arith.subi %973, %975 : i64
        %977 = arith.constant -2305843009213693952 : i64
        %978 = arith.constant 2305843009213693951 : i64
        %979 = arith.cmpi sge, %976, %977 : i64
        %980 = arith.cmpi sle, %976, %978 : i64
        %981 = arith.andi %979, %980 : i1
        %982 = scf.if %981 -> (i64) {
          %983 = arith.constant 2 : i64
          %984 = arith.shli %976, %983 : i64
          scf.yield %984 : i64
        } else {
          %985 = func.call @cc_sub(%959, %961) : (i64, i64) -> i64
          scf.yield %985 : i64
        }
        scf.yield %982 : i64
      } else {
        %986 = func.call @cc_sub(%959, %961) : (i64, i64) -> i64
        scf.yield %986 : i64
      }
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %987 = arith.addi %971, %__rlasp_stack_elide_zero_49 : i64
      %988 = llvm.mlir.addressof @str46 : !llvm.ptr
      %989 = arith.constant 20 : i64
      %990 = func.call @cc_make_string(%988, %989) : (!llvm.ptr, i64) -> i64
      %991 = llvm.mlir.addressof @str47 : !llvm.ptr
      %992 = arith.constant 11 : i64
      %993 = func.call @cc_make_string(%991, %992) : (!llvm.ptr, i64) -> i64
      %994 = func.call @cc_intern(%990, %993) : (i64, i64) -> i64
      %995 = func.call @cc_nil_value() : () -> i64
      %996 = func.call @cc_cons(%994, %995) : (i64, i64) -> i64
      %997 = func.call @cc_values_pack(%996) : (i64) -> i64
      %998 = func.call @cc_symbol_value(%994) : (i64) -> i64
      %999 = arith.constant 1 : i64
      %1000 = func.call @cc_box_fixnum(%999) : (i64) -> i64
      %1002 = arith.constant 3 : i64
      %1001 = arith.andi %998, %1002 : i64
      %1003 = arith.constant 0 : i64
      %1004 = arith.cmpi eq, %1001, %1003 : i64
      %1006 = arith.constant 3 : i64
      %1005 = arith.andi %1000, %1006 : i64
      %1007 = arith.constant 0 : i64
      %1008 = arith.cmpi eq, %1005, %1007 : i64
      %1009 = arith.andi %1004, %1008 : i1
      %1010 = scf.if %1009 -> (i64) {
        %1011 = arith.constant 2 : i64
        %1012 = arith.shrsi %998, %1011 : i64
        %1013 = arith.constant 2 : i64
        %1014 = arith.shrsi %1000, %1013 : i64
        %1015 = arith.subi %1012, %1014 : i64
        %1016 = arith.constant -2305843009213693952 : i64
        %1017 = arith.constant 2305843009213693951 : i64
        %1018 = arith.cmpi sge, %1015, %1016 : i64
        %1019 = arith.cmpi sle, %1015, %1017 : i64
        %1020 = arith.andi %1018, %1019 : i1
        %1021 = scf.if %1020 -> (i64) {
          %1022 = arith.constant 2 : i64
          %1023 = arith.shli %1015, %1022 : i64
          scf.yield %1023 : i64
        } else {
          %1024 = func.call @cc_sub(%998, %1000) : (i64, i64) -> i64
          scf.yield %1024 : i64
        }
        scf.yield %1021 : i64
      } else {
        %1025 = func.call @cc_sub(%998, %1000) : (i64, i64) -> i64
        scf.yield %1025 : i64
      }
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1026 = arith.addi %1010, %__rlasp_stack_elide_zero_50 : i64
      %1027 = arith.constant 1 : i64
      %1028 = func.call @cc_box_fixnum(%1027) : (i64) -> i64
      %1030 = arith.constant 3 : i64
      %1029 = arith.andi %1026, %1030 : i64
      %1031 = arith.constant 0 : i64
      %1032 = arith.cmpi eq, %1029, %1031 : i64
      %1034 = arith.constant 3 : i64
      %1033 = arith.andi %1028, %1034 : i64
      %1035 = arith.constant 0 : i64
      %1036 = arith.cmpi eq, %1033, %1035 : i64
      %1037 = arith.andi %1032, %1036 : i1
      %1038 = scf.if %1037 -> (i64) {
        %1039 = arith.constant 2 : i64
        %1040 = arith.shrsi %1026, %1039 : i64
        %1041 = arith.constant 2 : i64
        %1042 = arith.shrsi %1028, %1041 : i64
        %1043 = arith.subi %1040, %1042 : i64
        %1044 = arith.constant -2305843009213693952 : i64
        %1045 = arith.constant 2305843009213693951 : i64
        %1046 = arith.cmpi sge, %1043, %1044 : i64
        %1047 = arith.cmpi sle, %1043, %1045 : i64
        %1048 = arith.andi %1046, %1047 : i1
        %1049 = scf.if %1048 -> (i64) {
          %1050 = arith.constant 2 : i64
          %1051 = arith.shli %1043, %1050 : i64
          scf.yield %1051 : i64
        } else {
          %1052 = func.call @cc_sub(%1026, %1028) : (i64, i64) -> i64
          scf.yield %1052 : i64
        }
        scf.yield %1049 : i64
      } else {
        %1053 = func.call @cc_sub(%1026, %1028) : (i64, i64) -> i64
        scf.yield %1053 : i64
      }
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1054 = arith.addi %1038, %__rlasp_stack_elide_zero_51 : i64
      %1055 = func.call @cc_nil_value() : () -> i64
      %1056 = func.call @cc_errorp(%987) : (i64) -> i64
      %1057 = arith.cmpi ne, %1056, %1055 : i64
      %1058 = arith.cmpi eq, %1055, %1055 : i64
      %1059 = arith.andi %1057, %1058 : i1
      %1060 = scf.if %1059 -> (i64) {
        scf.yield %987 : i64
      } else {
        scf.yield %1055 : i64
      }
      %1061 = func.call @cc_errorp(%1054) : (i64) -> i64
      %1062 = arith.cmpi ne, %1061, %1055 : i64
      %1063 = arith.cmpi eq, %1060, %1055 : i64
      %1064 = arith.andi %1062, %1063 : i1
      %1065 = scf.if %1064 -> (i64) {
        scf.yield %1054 : i64
      } else {
        scf.yield %1060 : i64
      }
      %1066 = arith.cmpi ne, %1065, %1055 : i64
      scf.if %1066 {
        func.call @stack_push_pointer(%1065) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%987) : (i64) -> ()
        func.call @stack_push_pointer(%1054) : (i64) -> ()
        %1067 = llvm.mlir.addressof @str48 : !llvm.ptr
        %1068 = func.call @cc_make_function_ref_const(%1067) : (!llvm.ptr) -> i64
        %1069 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1068, %1069) : (i64, i64) -> ()
      }
      %1070 = func.call @stack_pop_pointer() : () -> i64
      %1071 = llvm.mlir.addressof @str49 : !llvm.ptr
      %1072 = arith.constant 20 : i64
      %1073 = func.call @cc_make_string(%1071, %1072) : (!llvm.ptr, i64) -> i64
      %1074 = llvm.mlir.addressof @str50 : !llvm.ptr
      %1075 = arith.constant 11 : i64
      %1076 = func.call @cc_make_string(%1074, %1075) : (!llvm.ptr, i64) -> i64
      %1077 = func.call @cc_intern(%1073, %1076) : (i64, i64) -> i64
      %1078 = func.call @cc_nil_value() : () -> i64
      %1079 = func.call @cc_cons(%1077, %1078) : (i64, i64) -> i64
      %1080 = func.call @cc_values_pack(%1079) : (i64) -> i64
      %1081 = func.call @cc_symbol_value(%1077) : (i64) -> i64
      %1082 = arith.constant 2 : i64
      %1083 = func.call @cc_box_fixnum(%1082) : (i64) -> i64
      %1085 = arith.constant 3 : i64
      %1084 = arith.andi %1081, %1085 : i64
      %1086 = arith.constant 0 : i64
      %1087 = arith.cmpi eq, %1084, %1086 : i64
      %1089 = arith.constant 3 : i64
      %1088 = arith.andi %1083, %1089 : i64
      %1090 = arith.constant 0 : i64
      %1091 = arith.cmpi eq, %1088, %1090 : i64
      %1092 = arith.andi %1087, %1091 : i1
      %1093 = scf.if %1092 -> (i64) {
        %1094 = arith.constant 2 : i64
        %1095 = arith.shrsi %1081, %1094 : i64
        %1096 = arith.constant 2 : i64
        %1097 = arith.shrsi %1083, %1096 : i64
        %1098 = arith.subi %1095, %1097 : i64
        %1099 = arith.constant -2305843009213693952 : i64
        %1100 = arith.constant 2305843009213693951 : i64
        %1101 = arith.cmpi sge, %1098, %1099 : i64
        %1102 = arith.cmpi sle, %1098, %1100 : i64
        %1103 = arith.andi %1101, %1102 : i1
        %1104 = scf.if %1103 -> (i64) {
          %1105 = arith.constant 2 : i64
          %1106 = arith.shli %1098, %1105 : i64
          scf.yield %1106 : i64
        } else {
          %1107 = func.call @cc_sub(%1081, %1083) : (i64, i64) -> i64
          scf.yield %1107 : i64
        }
        scf.yield %1104 : i64
      } else {
        %1108 = func.call @cc_sub(%1081, %1083) : (i64, i64) -> i64
        scf.yield %1108 : i64
      }
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1109 = arith.addi %1093, %__rlasp_stack_elide_zero_52 : i64
      %1110 = arith.constant 1 : i1
      %1112 = arith.constant 3 : i64
      %1111 = arith.andi %1070, %1112 : i64
      %1113 = arith.constant 0 : i64
      %1114 = arith.cmpi eq, %1111, %1113 : i64
      %1116 = arith.constant 3 : i64
      %1115 = arith.andi %1109, %1116 : i64
      %1117 = arith.constant 0 : i64
      %1118 = arith.cmpi eq, %1115, %1117 : i64
      %1119 = arith.andi %1114, %1118 : i1
      %1120 = scf.if %1119 -> (i1) {
        %1121 = arith.constant 2 : i64
        %1122 = arith.shrsi %1070, %1121 : i64
        %1123 = arith.constant 2 : i64
        %1124 = arith.shrsi %1109, %1123 : i64
        %1125 = arith.cmpi eq, %1122, %1124 : i64
        scf.yield %1125 : i1
      } else {
        %1126 = func.call @cc_eq(%1070, %1109) : (i64, i64) -> i64
        %1127 = func.call @cc_nil_value() : () -> i64
        %1128 = arith.cmpi ne, %1126, %1127 : i64
        scf.yield %1128 : i1
      }
      %1129 = arith.andi %1110, %1120 : i1
      %1130 = func.call @cc_nil_value() : () -> i64
      %1131 = func.call @cc_t_value() : () -> i64
      %1132 = scf.if %1129 -> (i64) {
        scf.yield %1131 : i64
      } else {
        scf.yield %1130 : i64
      }
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1133 = arith.addi %1132, %__rlasp_stack_elide_zero_53 : i64
      %1134 = llvm.mlir.addressof @str51 : !llvm.ptr
      %1135 = arith.constant 20 : i64
      %1136 = func.call @cc_make_string(%1134, %1135) : (!llvm.ptr, i64) -> i64
      %1137 = llvm.mlir.addressof @str52 : !llvm.ptr
      %1138 = arith.constant 11 : i64
      %1139 = func.call @cc_make_string(%1137, %1138) : (!llvm.ptr, i64) -> i64
      %1140 = func.call @cc_intern(%1136, %1139) : (i64, i64) -> i64
      %1141 = func.call @cc_nil_value() : () -> i64
      %1142 = func.call @cc_cons(%1140, %1141) : (i64, i64) -> i64
      %1143 = func.call @cc_values_pack(%1142) : (i64) -> i64
      %1144 = func.call @cc_symbol_value(%1140) : (i64) -> i64
      %1145 = arith.constant 1 : i64
      %1146 = func.call @cc_box_fixnum(%1145) : (i64) -> i64
      %1148 = arith.constant 3 : i64
      %1147 = arith.andi %1144, %1148 : i64
      %1149 = arith.constant 0 : i64
      %1150 = arith.cmpi eq, %1147, %1149 : i64
      %1152 = arith.constant 3 : i64
      %1151 = arith.andi %1146, %1152 : i64
      %1153 = arith.constant 0 : i64
      %1154 = arith.cmpi eq, %1151, %1153 : i64
      %1155 = arith.andi %1150, %1154 : i1
      %1156 = scf.if %1155 -> (i64) {
        %1157 = arith.constant 2 : i64
        %1158 = arith.shrsi %1144, %1157 : i64
        %1159 = arith.constant 2 : i64
        %1160 = arith.shrsi %1146, %1159 : i64
        %1161 = arith.addi %1158, %1160 : i64
        %1162 = arith.constant -2305843009213693952 : i64
        %1163 = arith.constant 2305843009213693951 : i64
        %1164 = arith.cmpi sge, %1161, %1162 : i64
        %1165 = arith.cmpi sle, %1161, %1163 : i64
        %1166 = arith.andi %1164, %1165 : i1
        %1167 = scf.if %1166 -> (i64) {
          %1168 = arith.constant 2 : i64
          %1169 = arith.shli %1161, %1168 : i64
          scf.yield %1169 : i64
        } else {
          %1170 = func.call @cc_add(%1144, %1146) : (i64, i64) -> i64
          scf.yield %1170 : i64
        }
        scf.yield %1167 : i64
      } else {
        %1171 = func.call @cc_add(%1144, %1146) : (i64, i64) -> i64
        scf.yield %1171 : i64
      }
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1172 = arith.addi %1156, %__rlasp_stack_elide_zero_54 : i64
      %1173 = llvm.mlir.addressof @str53 : !llvm.ptr
      %1174 = arith.constant 20 : i64
      %1175 = func.call @cc_make_string(%1173, %1174) : (!llvm.ptr, i64) -> i64
      %1176 = llvm.mlir.addressof @str54 : !llvm.ptr
      %1177 = arith.constant 11 : i64
      %1178 = func.call @cc_make_string(%1176, %1177) : (!llvm.ptr, i64) -> i64
      %1179 = func.call @cc_intern(%1175, %1178) : (i64, i64) -> i64
      %1180 = func.call @cc_nil_value() : () -> i64
      %1181 = func.call @cc_cons(%1179, %1180) : (i64, i64) -> i64
      %1182 = func.call @cc_values_pack(%1181) : (i64) -> i64
      %1183 = func.call @cc_symbol_value(%1179) : (i64) -> i64
      %1184 = arith.constant 1 : i64
      %1185 = func.call @cc_box_fixnum(%1184) : (i64) -> i64
      %1187 = arith.constant 3 : i64
      %1186 = arith.andi %1183, %1187 : i64
      %1188 = arith.constant 0 : i64
      %1189 = arith.cmpi eq, %1186, %1188 : i64
      %1191 = arith.constant 3 : i64
      %1190 = arith.andi %1185, %1191 : i64
      %1192 = arith.constant 0 : i64
      %1193 = arith.cmpi eq, %1190, %1192 : i64
      %1194 = arith.andi %1189, %1193 : i1
      %1195 = scf.if %1194 -> (i64) {
        %1196 = arith.constant 2 : i64
        %1197 = arith.shrsi %1183, %1196 : i64
        %1198 = arith.constant 2 : i64
        %1199 = arith.shrsi %1185, %1198 : i64
        %1200 = arith.addi %1197, %1199 : i64
        %1201 = arith.constant -2305843009213693952 : i64
        %1202 = arith.constant 2305843009213693951 : i64
        %1203 = arith.cmpi sge, %1200, %1201 : i64
        %1204 = arith.cmpi sle, %1200, %1202 : i64
        %1205 = arith.andi %1203, %1204 : i1
        %1206 = scf.if %1205 -> (i64) {
          %1207 = arith.constant 2 : i64
          %1208 = arith.shli %1200, %1207 : i64
          scf.yield %1208 : i64
        } else {
          %1209 = func.call @cc_add(%1183, %1185) : (i64, i64) -> i64
          scf.yield %1209 : i64
        }
        scf.yield %1206 : i64
      } else {
        %1210 = func.call @cc_add(%1183, %1185) : (i64, i64) -> i64
        scf.yield %1210 : i64
      }
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1211 = arith.addi %1195, %__rlasp_stack_elide_zero_55 : i64
      %1212 = arith.constant 0 : i64
      %1213 = func.call @cc_box_fixnum(%1212) : (i64) -> i64
      %1214 = func.call @cc_nil_value() : () -> i64
      %1215 = func.call @cc_errorp(%1211) : (i64) -> i64
      %1216 = arith.cmpi ne, %1215, %1214 : i64
      %1217 = arith.cmpi eq, %1214, %1214 : i64
      %1218 = arith.andi %1216, %1217 : i1
      %1219 = scf.if %1218 -> (i64) {
        scf.yield %1211 : i64
      } else {
        scf.yield %1214 : i64
      }
      %1220 = func.call @cc_errorp(%1213) : (i64) -> i64
      %1221 = arith.cmpi ne, %1220, %1214 : i64
      %1222 = arith.cmpi eq, %1219, %1214 : i64
      %1223 = arith.andi %1221, %1222 : i1
      %1224 = scf.if %1223 -> (i64) {
        scf.yield %1213 : i64
      } else {
        scf.yield %1219 : i64
      }
      %1225 = arith.cmpi ne, %1224, %1214 : i64
      scf.if %1225 {
        func.call @stack_push_pointer(%1224) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1211) : (i64) -> ()
        func.call @stack_push_pointer(%1213) : (i64) -> ()
        %1226 = llvm.mlir.addressof @str55 : !llvm.ptr
        %1227 = func.call @cc_make_function_ref_const(%1226) : (!llvm.ptr) -> i64
        %1228 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1227, %1228) : (i64, i64) -> ()
      }
      %1229 = func.call @stack_pop_pointer() : () -> i64
      %1230 = arith.constant 1 : i1
      %1232 = arith.constant 3 : i64
      %1231 = arith.andi %1172, %1232 : i64
      %1233 = arith.constant 0 : i64
      %1234 = arith.cmpi eq, %1231, %1233 : i64
      %1236 = arith.constant 3 : i64
      %1235 = arith.andi %1229, %1236 : i64
      %1237 = arith.constant 0 : i64
      %1238 = arith.cmpi eq, %1235, %1237 : i64
      %1239 = arith.andi %1234, %1238 : i1
      %1240 = scf.if %1239 -> (i1) {
        %1241 = arith.constant 2 : i64
        %1242 = arith.shrsi %1172, %1241 : i64
        %1243 = arith.constant 2 : i64
        %1244 = arith.shrsi %1229, %1243 : i64
        %1245 = arith.cmpi eq, %1242, %1244 : i64
        scf.yield %1245 : i1
      } else {
        %1246 = func.call @cc_eq(%1172, %1229) : (i64, i64) -> i64
        %1247 = func.call @cc_nil_value() : () -> i64
        %1248 = arith.cmpi ne, %1246, %1247 : i64
        scf.yield %1248 : i1
      }
      %1249 = arith.andi %1230, %1240 : i1
      %1250 = func.call @cc_nil_value() : () -> i64
      %1251 = func.call @cc_t_value() : () -> i64
      %1252 = scf.if %1249 -> (i64) {
        scf.yield %1251 : i64
      } else {
        scf.yield %1250 : i64
      }
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1253 = arith.addi %1252, %__rlasp_stack_elide_zero_56 : i64
      %1254 = func.call @cc_nil_value() : () -> i64
      %1255 = func.call @cc_errorp(%763) : (i64) -> i64
      %1256 = arith.cmpi ne, %1255, %1254 : i64
      %1257 = arith.cmpi eq, %1254, %1254 : i64
      %1258 = arith.andi %1256, %1257 : i1
      %1259 = scf.if %1258 -> (i64) {
        scf.yield %763 : i64
      } else {
        scf.yield %1254 : i64
      }
      %1260 = func.call @cc_errorp(%948) : (i64) -> i64
      %1261 = arith.cmpi ne, %1260, %1254 : i64
      %1262 = arith.cmpi eq, %1259, %1254 : i64
      %1263 = arith.andi %1261, %1262 : i1
      %1264 = scf.if %1263 -> (i64) {
        scf.yield %948 : i64
      } else {
        scf.yield %1259 : i64
      }
      %1265 = func.call @cc_errorp(%1133) : (i64) -> i64
      %1266 = arith.cmpi ne, %1265, %1254 : i64
      %1267 = arith.cmpi eq, %1264, %1254 : i64
      %1268 = arith.andi %1266, %1267 : i1
      %1269 = scf.if %1268 -> (i64) {
        scf.yield %1133 : i64
      } else {
        scf.yield %1264 : i64
      }
      %1270 = func.call @cc_errorp(%1253) : (i64) -> i64
      %1271 = arith.cmpi ne, %1270, %1254 : i64
      %1272 = arith.cmpi eq, %1269, %1254 : i64
      %1273 = arith.andi %1271, %1272 : i1
      %1274 = scf.if %1273 -> (i64) {
        scf.yield %1253 : i64
      } else {
        scf.yield %1269 : i64
      }
      %1275 = arith.cmpi ne, %1274, %1254 : i64
      scf.if %1275 {
        func.call @stack_push_pointer(%1274) : (i64) -> ()
      } else {
        %1276 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1276) : (i64) -> ()
        %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
        %1277 = arith.addi %1253, %__rlasp_stack_elide_zero_57 : i64
        %1278 = func.call @stack_pop_pointer() : () -> i64
        %1279 = func.call @cc_cons(%1277, %1278) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1279) : (i64) -> ()
        %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
        %1280 = arith.addi %1133, %__rlasp_stack_elide_zero_58 : i64
        %1281 = func.call @stack_pop_pointer() : () -> i64
        %1282 = func.call @cc_cons(%1280, %1281) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1282) : (i64) -> ()
        %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
        %1283 = arith.addi %948, %__rlasp_stack_elide_zero_59 : i64
        %1284 = func.call @stack_pop_pointer() : () -> i64
        %1285 = func.call @cc_cons(%1283, %1284) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1285) : (i64) -> ()
        %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
        %1286 = arith.addi %763, %__rlasp_stack_elide_zero_60 : i64
        %1287 = func.call @stack_pop_pointer() : () -> i64
        %1288 = func.call @cc_cons(%1286, %1287) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1288) : (i64) -> ()
      }
      %1289 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%647) : (i64) -> ()
      func.call @stack_push_pointer(%650) : (i64) -> ()
      func.call @stack_push_pointer(%1289) : (i64) -> ()
      %1290 = llvm.mlir.addressof @str56 : !llvm.ptr
      %1291 = func.call @cc_make_function_ref_const(%1290) : (!llvm.ptr) -> i64
      %1292 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1291, %1292) : (i64, i64) -> ()
      %1293 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1293 : i64
    }
    %1294 = func.call @cc_nil_value() : () -> i64
    %1295 = func.call @cc_errorp(%646) : (i64) -> i64
    %1296 = arith.cmpi ne, %1295, %1294 : i64
    %1297 = scf.if %1296 -> (i64) {
      scf.yield %646 : i64
    } else {
      %1298 = func.call @cc_t_value() : () -> i64
      %1299 = llvm.mlir.addressof @str57 : !llvm.ptr
      %1300 = arith.constant 33 : i64
      %1301 = func.call @cc_make_string(%1299, %1300) : (!llvm.ptr, i64) -> i64
      %1302 = arith.constant -500 : i64
      %1303 = func.call @cc_box_fixnum(%1302) : (i64) -> i64
      %1304 = func.call @cc_nil_value() : () -> i64
      %1305 = func.call @cc_nil_value() : () -> i64
      %1306 = func.call @cc_nil_value() : () -> i64
      %1307 = func.call @cc_nil_value() : () -> i64
      %1308 = func.call @cc_nil_value() : () -> i64
      %1309 = func.call @cc_nil_value() : () -> i64
      %1310 = func.call @cc_nil_value() : () -> i64
      %1311 = func.call @cc_errorp(%1309) : (i64) -> i64
      %1312 = arith.cmpi ne, %1311, %1310 : i64
      %1313 = scf.if %1312 -> (i64) {
        scf.yield %1309 : i64
      } else {
        %1314 = func.call @cc_nil_value() : () -> i64
        %1315 = llvm.mlir.addressof @str58 : !llvm.ptr
        %1316 = arith.constant 38 : i64
        %1317 = func.call @cc_make_string(%1315, %1316) : (!llvm.ptr, i64) -> i64
        %1318 = func.call @cc_nil_value() : () -> i64
        %1319 = func.call @cc_intern(%1317, %1318) : (i64, i64) -> i64
        %1320 = func.call @cc_nil_value() : () -> i64
        %1321 = func.call @cc_cons(%1319, %1320) : (i64, i64) -> i64
        %1322 = func.call @cc_values_pack(%1321) : (i64) -> i64
        %1323 = func.call @cc_set_symbol_value(%1319, %1314) : (i64, i64) -> i64
        %1324 = llvm.mlir.addressof @str59 : !llvm.ptr
        %1325 = arith.constant 39 : i64
        %1326 = func.call @cc_make_string(%1324, %1325) : (!llvm.ptr, i64) -> i64
        %1327 = func.call @cc_nil_value() : () -> i64
        %1328 = func.call @cc_intern(%1326, %1327) : (i64, i64) -> i64
        %1329 = func.call @cc_nil_value() : () -> i64
        %1330 = func.call @cc_cons(%1328, %1329) : (i64, i64) -> i64
        %1331 = func.call @cc_values_pack(%1330) : (i64) -> i64
        %1332 = func.call @cc_set_symbol_value(%1328, %1314) : (i64, i64) -> i64
        %1333 = llvm.mlir.addressof @str60 : !llvm.ptr
        %1334 = arith.constant 40 : i64
        %1335 = func.call @cc_make_string(%1333, %1334) : (!llvm.ptr, i64) -> i64
        %1336 = func.call @cc_nil_value() : () -> i64
        %1337 = func.call @cc_intern(%1335, %1336) : (i64, i64) -> i64
        %1338 = func.call @cc_nil_value() : () -> i64
        %1339 = func.call @cc_cons(%1337, %1338) : (i64, i64) -> i64
        %1340 = func.call @cc_values_pack(%1339) : (i64) -> i64
        %1341 = func.call @cc_set_symbol_value(%1337, %1314) : (i64, i64) -> i64
        %1342:6 = scf.while (%arg0 = %1308, %arg1 = %1304, %arg2 = %1305, %arg3 = %1306, %arg4 = %1307, %arg5 = %1303) : (i64, i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64, i64) {
          %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
          %1343 = arith.addi %arg5, %__rlasp_stack_elide_zero_61 : i64
          %1344 = arith.constant 500 : i64
          func.call @stack_push_fixnum(%1344) : (i64) -> ()
          %1345 = func.call @stack_pop_pointer() : () -> i64
          %1346 = arith.constant 1 : i1
          %1348 = arith.constant 3 : i64
          %1347 = arith.andi %1343, %1348 : i64
          %1349 = arith.constant 0 : i64
          %1350 = arith.cmpi eq, %1347, %1349 : i64
          %1352 = arith.constant 3 : i64
          %1351 = arith.andi %1345, %1352 : i64
          %1353 = arith.constant 0 : i64
          %1354 = arith.cmpi eq, %1351, %1353 : i64
          %1355 = arith.andi %1350, %1354 : i1
          %1356 = scf.if %1355 -> (i1) {
            %1357 = arith.constant 2 : i64
            %1358 = arith.shrsi %1343, %1357 : i64
            %1359 = arith.constant 2 : i64
            %1360 = arith.shrsi %1345, %1359 : i64
            %1361 = arith.cmpi sle, %1358, %1360 : i64
            scf.yield %1361 : i1
          } else {
            %1362 = func.call @cc_le(%1343, %1345) : (i64, i64) -> i64
            %1363 = func.call @cc_nil_value() : () -> i64
            %1364 = arith.cmpi ne, %1362, %1363 : i64
            scf.yield %1364 : i1
          }
          %1365 = arith.andi %1346, %1356 : i1
          %1366 = func.call @cc_nil_value() : () -> i64
          %1367 = func.call @cc_t_value() : () -> i64
          %1368 = scf.if %1365 -> (i64) {
            scf.yield %1367 : i64
          } else {
            scf.yield %1366 : i64
          }
          %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
          %1369 = arith.addi %1368, %__rlasp_stack_elide_zero_62 : i64
          %1370 = func.call @cc_nil_value() : () -> i64
          %1371 = arith.cmpi ne, %1369, %1370 : i64
          %1372 = func.call @cc_nil_value() : () -> i64
          %1373 = llvm.mlir.addressof @str61 : !llvm.ptr
          %1374 = arith.constant 38 : i64
          %1375 = func.call @cc_make_string(%1373, %1374) : (!llvm.ptr, i64) -> i64
          %1376 = func.call @cc_nil_value() : () -> i64
          %1377 = func.call @cc_intern(%1375, %1376) : (i64, i64) -> i64
          %1378 = func.call @cc_nil_value() : () -> i64
          %1379 = func.call @cc_cons(%1377, %1378) : (i64, i64) -> i64
          %1380 = func.call @cc_values_pack(%1379) : (i64) -> i64
          %1381 = func.call @cc_symbol_value(%1377) : (i64) -> i64
          %1382 = arith.cmpi ne, %1381, %1372 : i64
          %1383 = llvm.mlir.addressof @str62 : !llvm.ptr
          %1384 = arith.constant 38 : i64
          %1385 = func.call @cc_make_string(%1383, %1384) : (!llvm.ptr, i64) -> i64
          %1386 = func.call @cc_nil_value() : () -> i64
          %1387 = func.call @cc_intern(%1385, %1386) : (i64, i64) -> i64
          %1388 = func.call @cc_nil_value() : () -> i64
          %1389 = func.call @cc_cons(%1387, %1388) : (i64, i64) -> i64
          %1390 = func.call @cc_values_pack(%1389) : (i64) -> i64
          %1391 = func.call @cc_symbol_value(%1387) : (i64) -> i64
          %1392 = arith.cmpi ne, %1391, %1372 : i64
          %1393 = arith.ori %1382, %1392 : i1
          %1394 = arith.constant 0 : i1
          %1395 = arith.cmpi eq, %1393, %1394 : i1
          %1396 = arith.andi %1371, %1395 : i1
          scf.condition(%1396) %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 : i64, i64, i64, i64, i64, i64
        } do {
          ^bb0(%1397: i64, %1398: i64, %1399: i64, %1400: i64, %1401: i64, %1402: i64):
          %1403 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%1403) : (i64) -> ()
          %1404 = func.call @stack_depth() : () -> i64
          %1405 = arith.constant 0 : i64
          %1406 = arith.cmpi sgt, %1404, %1405 : i64
          scf.if %1406 {
            %1407 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%1402) : (i64) -> ()
          %1408 = func.call @stack_depth() : () -> i64
          %1409 = arith.constant 0 : i64
          %1410 = arith.cmpi sgt, %1408, %1409 : i64
          scf.if %1410 {
            %1411 = func.call @stack_pop_pointer() : () -> i64
          }
          %1412 = llvm.mlir.addressof @str63 : !llvm.ptr
          %1413 = arith.constant 20 : i64
          %1414 = func.call @cc_make_string(%1412, %1413) : (!llvm.ptr, i64) -> i64
          %1415 = llvm.mlir.addressof @str64 : !llvm.ptr
          %1416 = arith.constant 11 : i64
          %1417 = func.call @cc_make_string(%1415, %1416) : (!llvm.ptr, i64) -> i64
          %1418 = func.call @cc_intern(%1414, %1417) : (i64, i64) -> i64
          %1419 = func.call @cc_nil_value() : () -> i64
          %1420 = func.call @cc_cons(%1418, %1419) : (i64, i64) -> i64
          %1421 = func.call @cc_values_pack(%1420) : (i64) -> i64
          %1422 = func.call @cc_symbol_value(%1418) : (i64) -> i64
          %1424 = arith.constant 3 : i64
          %1423 = arith.andi %1422, %1424 : i64
          %1425 = arith.constant 0 : i64
          %1426 = arith.cmpi eq, %1423, %1425 : i64
          %1428 = arith.constant 3 : i64
          %1427 = arith.andi %1402, %1428 : i64
          %1429 = arith.constant 0 : i64
          %1430 = arith.cmpi eq, %1427, %1429 : i64
          %1431 = arith.andi %1426, %1430 : i1
          %1432 = scf.if %1431 -> (i64) {
            %1433 = arith.constant 2 : i64
            %1434 = arith.shrsi %1422, %1433 : i64
            %1435 = arith.constant 2 : i64
            %1436 = arith.shrsi %1402, %1435 : i64
            %1437 = arith.addi %1434, %1436 : i64
            %1438 = arith.constant -2305843009213693952 : i64
            %1439 = arith.constant 2305843009213693951 : i64
            %1440 = arith.cmpi sge, %1437, %1438 : i64
            %1441 = arith.cmpi sle, %1437, %1439 : i64
            %1442 = arith.andi %1440, %1441 : i1
            %1443 = scf.if %1442 -> (i64) {
              %1444 = arith.constant 2 : i64
              %1445 = arith.shli %1437, %1444 : i64
              scf.yield %1445 : i64
            } else {
              %1446 = func.call @cc_add(%1422, %1402) : (i64, i64) -> i64
              scf.yield %1446 : i64
            }
            scf.yield %1443 : i64
          } else {
            %1447 = func.call @cc_add(%1422, %1402) : (i64, i64) -> i64
            scf.yield %1447 : i64
          }
          %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
          %1448 = arith.addi %1432, %__rlasp_stack_elide_zero_63 : i64
          func.call @stack_push_pointer(%1448) : (i64) -> ()
          %1449 = func.call @stack_depth() : () -> i64
          %1450 = arith.constant 0 : i64
          %1451 = arith.cmpi sgt, %1449, %1450 : i64
          scf.if %1451 {
            %1452 = func.call @stack_pop_pointer() : () -> i64
          }
          %1453 = arith.constant 1.0 : f64
          %1454 = func.call @cc_box_single_float(%1453) : (f64) -> i64
          %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
          %1455 = arith.addi %1454, %__rlasp_stack_elide_zero_64 : i64
          %1456 = func.call @cc_nil_value() : () -> i64
          %1457 = func.call @cc_errorp(%1448) : (i64) -> i64
          %1458 = arith.cmpi ne, %1457, %1456 : i64
          %1459 = arith.cmpi eq, %1456, %1456 : i64
          %1460 = arith.andi %1458, %1459 : i1
          %1461 = scf.if %1460 -> (i64) {
            scf.yield %1448 : i64
          } else {
            scf.yield %1456 : i64
          }
          %1462 = func.call @cc_errorp(%1455) : (i64) -> i64
          %1463 = arith.cmpi ne, %1462, %1456 : i64
          %1464 = arith.cmpi eq, %1461, %1456 : i64
          %1465 = arith.andi %1463, %1464 : i1
          %1466 = scf.if %1465 -> (i64) {
            scf.yield %1455 : i64
          } else {
            scf.yield %1461 : i64
          }
          %1467 = arith.cmpi ne, %1466, %1456 : i64
          scf.if %1467 {
            func.call @stack_push_pointer(%1466) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1448) : (i64) -> ()
            func.call @stack_push_pointer(%1455) : (i64) -> ()
            %1468 = llvm.mlir.addressof @str65 : !llvm.ptr
            %1469 = func.call @cc_make_function_ref_const(%1468) : (!llvm.ptr) -> i64
            %1470 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%1469, %1470) : (i64, i64) -> ()
          }
          %1471 = func.call @stack_pop_pointer() : () -> i64
          %1472 = func.call @cc_truncate(%1471) : (i64) -> i64
          %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
          %1473 = arith.addi %1472, %__rlasp_stack_elide_zero_65 : i64
          func.call @stack_push_pointer(%1473) : (i64) -> ()
          %1474 = func.call @stack_depth() : () -> i64
          %1475 = arith.constant 0 : i64
          %1476 = arith.cmpi sgt, %1474, %1475 : i64
          scf.if %1476 {
            %1477 = func.call @stack_pop_pointer() : () -> i64
          }
          %__rlasp_stack_elide_zero_66 = arith.constant 0 : i64
          %1478 = arith.addi %1473, %__rlasp_stack_elide_zero_66 : i64
          %1479 = llvm.mlir.addressof @str66 : !llvm.ptr
          %1480 = arith.constant 20 : i64
          %1481 = func.call @cc_make_string(%1479, %1480) : (!llvm.ptr, i64) -> i64
          %1482 = llvm.mlir.addressof @str67 : !llvm.ptr
          %1483 = arith.constant 11 : i64
          %1484 = func.call @cc_make_string(%1482, %1483) : (!llvm.ptr, i64) -> i64
          %1485 = func.call @cc_intern(%1481, %1484) : (i64, i64) -> i64
          %1486 = func.call @cc_nil_value() : () -> i64
          %1487 = func.call @cc_cons(%1485, %1486) : (i64, i64) -> i64
          %1488 = func.call @cc_values_pack(%1487) : (i64) -> i64
          %1489 = func.call @cc_symbol_value(%1485) : (i64) -> i64
          %__rlasp_stack_elide_zero_67 = arith.constant 0 : i64
          %1490 = arith.addi %1489, %__rlasp_stack_elide_zero_67 : i64
          %1491 = arith.constant 1 : i1
          %1493 = arith.constant 3 : i64
          %1492 = arith.andi %1478, %1493 : i64
          %1494 = arith.constant 0 : i64
          %1495 = arith.cmpi eq, %1492, %1494 : i64
          %1497 = arith.constant 3 : i64
          %1496 = arith.andi %1490, %1497 : i64
          %1498 = arith.constant 0 : i64
          %1499 = arith.cmpi eq, %1496, %1498 : i64
          %1500 = arith.andi %1495, %1499 : i1
          %1501 = scf.if %1500 -> (i1) {
            %1502 = arith.constant 2 : i64
            %1503 = arith.shrsi %1478, %1502 : i64
            %1504 = arith.constant 2 : i64
            %1505 = arith.shrsi %1490, %1504 : i64
            %1506 = arith.cmpi sle, %1503, %1505 : i64
            scf.yield %1506 : i1
          } else {
            %1507 = func.call @cc_le(%1478, %1490) : (i64, i64) -> i64
            %1508 = func.call @cc_nil_value() : () -> i64
            %1509 = arith.cmpi ne, %1507, %1508 : i64
            scf.yield %1509 : i1
          }
          %1510 = arith.andi %1491, %1501 : i1
          %1511 = func.call @cc_nil_value() : () -> i64
          %1512 = func.call @cc_t_value() : () -> i64
          %1513 = scf.if %1510 -> (i64) {
            scf.yield %1512 : i64
          } else {
            scf.yield %1511 : i64
          }
          %__rlasp_stack_elide_zero_68 = arith.constant 0 : i64
          %1514 = arith.addi %1513, %__rlasp_stack_elide_zero_68 : i64
          %1515 = func.call @cc_nil_value() : () -> i64
          %1516 = arith.cmpi ne, %1514, %1515 : i64
          scf.if %1516 {
            func.call @stack_push_pointer(%1473) : (i64) -> ()
            %1517 = llvm.mlir.addressof @str68 : !llvm.ptr
            %1518 = arith.constant 6 : i64
            %1519 = func.call @cc_make_string(%1517, %1518) : (!llvm.ptr, i64) -> i64
            %1520 = llvm.mlir.addressof @str69 : !llvm.ptr
            %1521 = arith.constant 11 : i64
            %1522 = func.call @cc_make_string(%1520, %1521) : (!llvm.ptr, i64) -> i64
            %1523 = func.call @cc_intern(%1519, %1522) : (i64, i64) -> i64
            %1524 = func.call @cc_nil_value() : () -> i64
            %1525 = func.call @cc_cons(%1523, %1524) : (i64, i64) -> i64
            %1526 = func.call @cc_values_pack(%1525) : (i64) -> i64
            %__rlasp_stack_elide_zero_69 = arith.constant 0 : i64
            %1527 = arith.addi %1523, %__rlasp_stack_elide_zero_69 : i64
            %1528 = func.call @stack_pop_pointer() : () -> i64
            %1529 = func.call @cc_typep(%1528, %1527) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1529) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1473) : (i64) -> ()
            %1530 = llvm.mlir.addressof @str70 : !llvm.ptr
            %1531 = arith.constant 6 : i64
            %1532 = func.call @cc_make_string(%1530, %1531) : (!llvm.ptr, i64) -> i64
            %1533 = llvm.mlir.addressof @str71 : !llvm.ptr
            %1534 = arith.constant 11 : i64
            %1535 = func.call @cc_make_string(%1533, %1534) : (!llvm.ptr, i64) -> i64
            %1536 = func.call @cc_intern(%1532, %1535) : (i64, i64) -> i64
            %1537 = func.call @cc_nil_value() : () -> i64
            %1538 = func.call @cc_cons(%1536, %1537) : (i64, i64) -> i64
            %1539 = func.call @cc_values_pack(%1538) : (i64) -> i64
            %__rlasp_stack_elide_zero_70 = arith.constant 0 : i64
            %1540 = arith.addi %1536, %__rlasp_stack_elide_zero_70 : i64
            %1541 = func.call @stack_pop_pointer() : () -> i64
            %1542 = func.call @cc_typep(%1541, %1540) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1542) : (i64) -> ()
          }
          %1543 = func.call @stack_pop_pointer() : () -> i64
          %1544 = func.call @cc_nil_value() : () -> i64
          %1545 = func.call @cc_cons(%1543, %1544) : (i64, i64) -> i64
          %1546 = func.call @cc_not(%1545) : (i64) -> i64
          %__rlasp_stack_elide_zero_71 = arith.constant 0 : i64
          %1547 = arith.addi %1546, %__rlasp_stack_elide_zero_71 : i64
          %1548 = func.call @cc_nil_value() : () -> i64
          %1549 = arith.cmpi ne, %1547, %1548 : i64
          %1550:2 = scf.if %1549 -> (i64, i64) {
            %1551 = func.call @cc_nil_value() : () -> i64
            %1552 = func.call @cc_nil_value() : () -> i64
            %1553 = func.call @cc_errorp(%1551) : (i64) -> i64
            %1554 = arith.cmpi ne, %1553, %1552 : i64
            %1555:2 = scf.if %1554 -> (i64, i64) {
              scf.yield %1551, %1401 : i64, i64
            } else {
              func.call @stack_push_pointer(%1401) : (i64) -> ()
              %__rlasp_stack_elide_zero_72 = arith.constant 0 : i64
              %1556 = arith.addi %1402, %__rlasp_stack_elide_zero_72 : i64
              %__rlasp_stack_elide_zero_73 = arith.constant 0 : i64
              %1557 = arith.addi %1448, %__rlasp_stack_elide_zero_73 : i64
              %__rlasp_stack_elide_zero_74 = arith.constant 0 : i64
              %1558 = arith.addi %1473, %__rlasp_stack_elide_zero_74 : i64
              func.call @stack_push_pointer(%1473) : (i64) -> ()
              %1559 = llvm.mlir.addressof @str72 : !llvm.ptr
              %1560 = arith.constant 6 : i64
              %1561 = func.call @cc_make_string(%1559, %1560) : (!llvm.ptr, i64) -> i64
              %1562 = llvm.mlir.addressof @str73 : !llvm.ptr
              %1563 = arith.constant 11 : i64
              %1564 = func.call @cc_make_string(%1562, %1563) : (!llvm.ptr, i64) -> i64
              %1565 = func.call @cc_intern(%1561, %1564) : (i64, i64) -> i64
              %1566 = func.call @cc_nil_value() : () -> i64
              %1567 = func.call @cc_cons(%1565, %1566) : (i64, i64) -> i64
              %1568 = func.call @cc_values_pack(%1567) : (i64) -> i64
              %__rlasp_stack_elide_zero_75 = arith.constant 0 : i64
              %1569 = arith.addi %1565, %__rlasp_stack_elide_zero_75 : i64
              %1570 = func.call @stack_pop_pointer() : () -> i64
              %1571 = func.call @cc_typep(%1570, %1569) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_76 = arith.constant 0 : i64
              %1572 = arith.addi %1571, %__rlasp_stack_elide_zero_76 : i64
              func.call @stack_push_pointer(%1473) : (i64) -> ()
              %1573 = llvm.mlir.addressof @str74 : !llvm.ptr
              %1574 = arith.constant 6 : i64
              %1575 = func.call @cc_make_string(%1573, %1574) : (!llvm.ptr, i64) -> i64
              %1576 = llvm.mlir.addressof @str75 : !llvm.ptr
              %1577 = arith.constant 11 : i64
              %1578 = func.call @cc_make_string(%1576, %1577) : (!llvm.ptr, i64) -> i64
              %1579 = func.call @cc_intern(%1575, %1578) : (i64, i64) -> i64
              %1580 = func.call @cc_nil_value() : () -> i64
              %1581 = func.call @cc_cons(%1579, %1580) : (i64, i64) -> i64
              %1582 = func.call @cc_values_pack(%1581) : (i64) -> i64
              %__rlasp_stack_elide_zero_77 = arith.constant 0 : i64
              %1583 = arith.addi %1579, %__rlasp_stack_elide_zero_77 : i64
              %1584 = func.call @stack_pop_pointer() : () -> i64
              %1585 = func.call @cc_typep(%1584, %1583) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_78 = arith.constant 0 : i64
              %1586 = arith.addi %1585, %__rlasp_stack_elide_zero_78 : i64
              %1587 = func.call @cc_nil_value() : () -> i64
              %1588 = func.call @cc_errorp(%1556) : (i64) -> i64
              %1589 = arith.cmpi ne, %1588, %1587 : i64
              %1590 = arith.cmpi eq, %1587, %1587 : i64
              %1591 = arith.andi %1589, %1590 : i1
              %1592 = scf.if %1591 -> (i64) {
                scf.yield %1556 : i64
              } else {
                scf.yield %1587 : i64
              }
              %1593 = func.call @cc_errorp(%1557) : (i64) -> i64
              %1594 = arith.cmpi ne, %1593, %1587 : i64
              %1595 = arith.cmpi eq, %1592, %1587 : i64
              %1596 = arith.andi %1594, %1595 : i1
              %1597 = scf.if %1596 -> (i64) {
                scf.yield %1557 : i64
              } else {
                scf.yield %1592 : i64
              }
              %1598 = func.call @cc_errorp(%1558) : (i64) -> i64
              %1599 = arith.cmpi ne, %1598, %1587 : i64
              %1600 = arith.cmpi eq, %1597, %1587 : i64
              %1601 = arith.andi %1599, %1600 : i1
              %1602 = scf.if %1601 -> (i64) {
                scf.yield %1558 : i64
              } else {
                scf.yield %1597 : i64
              }
              %1603 = func.call @cc_errorp(%1572) : (i64) -> i64
              %1604 = arith.cmpi ne, %1603, %1587 : i64
              %1605 = arith.cmpi eq, %1602, %1587 : i64
              %1606 = arith.andi %1604, %1605 : i1
              %1607 = scf.if %1606 -> (i64) {
                scf.yield %1572 : i64
              } else {
                scf.yield %1602 : i64
              }
              %1608 = func.call @cc_errorp(%1586) : (i64) -> i64
              %1609 = arith.cmpi ne, %1608, %1587 : i64
              %1610 = arith.cmpi eq, %1607, %1587 : i64
              %1611 = arith.andi %1609, %1610 : i1
              %1612 = scf.if %1611 -> (i64) {
                scf.yield %1586 : i64
              } else {
                scf.yield %1607 : i64
              }
              %1613 = arith.cmpi ne, %1612, %1587 : i64
              scf.if %1613 {
                func.call @stack_push_pointer(%1612) : (i64) -> ()
              } else {
                %1614 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%1614) : (i64) -> ()
                %__rlasp_stack_elide_zero_79 = arith.constant 0 : i64
                %1615 = arith.addi %1586, %__rlasp_stack_elide_zero_79 : i64
                %1616 = func.call @stack_pop_pointer() : () -> i64
                %1617 = func.call @cc_cons(%1615, %1616) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1617) : (i64) -> ()
                %__rlasp_stack_elide_zero_80 = arith.constant 0 : i64
                %1618 = arith.addi %1572, %__rlasp_stack_elide_zero_80 : i64
                %1619 = func.call @stack_pop_pointer() : () -> i64
                %1620 = func.call @cc_cons(%1618, %1619) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1620) : (i64) -> ()
                %__rlasp_stack_elide_zero_81 = arith.constant 0 : i64
                %1621 = arith.addi %1558, %__rlasp_stack_elide_zero_81 : i64
                %1622 = func.call @stack_pop_pointer() : () -> i64
                %1623 = func.call @cc_cons(%1621, %1622) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1623) : (i64) -> ()
                %__rlasp_stack_elide_zero_82 = arith.constant 0 : i64
                %1624 = arith.addi %1557, %__rlasp_stack_elide_zero_82 : i64
                %1625 = func.call @stack_pop_pointer() : () -> i64
                %1626 = func.call @cc_cons(%1624, %1625) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1626) : (i64) -> ()
                %__rlasp_stack_elide_zero_83 = arith.constant 0 : i64
                %1627 = arith.addi %1556, %__rlasp_stack_elide_zero_83 : i64
                %1628 = func.call @stack_pop_pointer() : () -> i64
                %1629 = func.call @cc_cons(%1627, %1628) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1629) : (i64) -> ()
              }
              %1630 = func.call @stack_pop_pointer() : () -> i64
              %1631 = func.call @cc_nil_value() : () -> i64
              %1632 = func.call @cc_errorp(%1630) : (i64) -> i64
              %1633 = arith.cmpi ne, %1632, %1631 : i64
              %1634 = arith.cmpi eq, %1631, %1631 : i64
              %1635 = arith.andi %1633, %1634 : i1
              %1636 = scf.if %1635 -> (i64) {
                scf.yield %1630 : i64
              } else {
                scf.yield %1631 : i64
              }
              %1637 = arith.cmpi ne, %1636, %1631 : i64
              scf.if %1637 {
                func.call @stack_push_pointer(%1636) : (i64) -> ()
              } else {
                %1638 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%1638) : (i64) -> ()
                %__rlasp_stack_elide_zero_84 = arith.constant 0 : i64
                %1639 = arith.addi %1630, %__rlasp_stack_elide_zero_84 : i64
                %1640 = func.call @stack_pop_pointer() : () -> i64
                %1641 = func.call @cc_cons(%1639, %1640) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1641) : (i64) -> ()
              }
              %1642 = func.call @stack_pop_pointer() : () -> i64
              %1643 = func.call @stack_pop_pointer() : () -> i64
              %1644 = func.call @cc_append(%1643, %1642) : (i64, i64) -> i64
              %__rlasp_stack_elide_zero_85 = arith.constant 0 : i64
              %1645 = arith.addi %1644, %__rlasp_stack_elide_zero_85 : i64
              %__rlasp_stack_elide_zero_86 = arith.constant 0 : i64
              %1646 = arith.addi %1645, %__rlasp_stack_elide_zero_86 : i64
              scf.yield %1646, %1645 : i64, i64
            }
            %__rlasp_stack_elide_zero_87 = arith.constant 0 : i64
            %1647 = arith.addi %1555#0, %__rlasp_stack_elide_zero_87 : i64
            scf.yield %1647, %1555#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %1648 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1648, %1401 : i64, i64
          }
          func.call @stack_push_pointer(%1550#0) : (i64) -> ()
          %1649 = func.call @stack_depth() : () -> i64
          %1650 = arith.constant 0 : i64
          %1651 = arith.cmpi sgt, %1649, %1650 : i64
          scf.if %1651 {
            %1652 = func.call @stack_pop_pointer() : () -> i64
          }
          %1653 = arith.constant 1 : i64
          %1654 = func.call @cc_box_fixnum(%1653) : (i64) -> i64
          %1656 = arith.constant 3 : i64
          %1655 = arith.andi %1402, %1656 : i64
          %1657 = arith.constant 0 : i64
          %1658 = arith.cmpi eq, %1655, %1657 : i64
          %1660 = arith.constant 3 : i64
          %1659 = arith.andi %1654, %1660 : i64
          %1661 = arith.constant 0 : i64
          %1662 = arith.cmpi eq, %1659, %1661 : i64
          %1663 = arith.andi %1658, %1662 : i1
          %1664 = scf.if %1663 -> (i64) {
            %1665 = arith.constant 2 : i64
            %1666 = arith.shrsi %1402, %1665 : i64
            %1667 = arith.constant 2 : i64
            %1668 = arith.shrsi %1654, %1667 : i64
            %1669 = arith.addi %1666, %1668 : i64
            %1670 = arith.constant -2305843009213693952 : i64
            %1671 = arith.constant 2305843009213693951 : i64
            %1672 = arith.cmpi sge, %1669, %1670 : i64
            %1673 = arith.cmpi sle, %1669, %1671 : i64
            %1674 = arith.andi %1672, %1673 : i1
            %1675 = scf.if %1674 -> (i64) {
              %1676 = arith.constant 2 : i64
              %1677 = arith.shli %1669, %1676 : i64
              scf.yield %1677 : i64
            } else {
              %1678 = func.call @cc_add(%1402, %1654) : (i64, i64) -> i64
              scf.yield %1678 : i64
            }
            scf.yield %1675 : i64
          } else {
            %1679 = func.call @cc_add(%1402, %1654) : (i64, i64) -> i64
            scf.yield %1679 : i64
          }
          %__rlasp_stack_elide_zero_88 = arith.constant 0 : i64
          %1680 = arith.addi %1664, %__rlasp_stack_elide_zero_88 : i64
          func.call @stack_push_pointer(%1680) : (i64) -> ()
          %1681 = func.call @stack_depth() : () -> i64
          %1682 = arith.constant 0 : i64
          %1683 = arith.cmpi sgt, %1681, %1682 : i64
          scf.if %1683 {
            %1684 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %1403, %1402, %1448, %1473, %1550#1, %1680 : i64, i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %1685 = func.call @stack_pop_pointer() : () -> i64
        %__rlasp_stack_elide_zero_89 = arith.constant 0 : i64
        %1686 = arith.addi %1342#0, %__rlasp_stack_elide_zero_89 : i64
        %1687 = func.call @cc_nil_value() : () -> i64
        %1688 = arith.cmpi ne, %1686, %1687 : i64
        %1689:2 = scf.if %1688 -> (i64, i64) {
          %1690 = func.call @cc_nil_value() : () -> i64
          %1691 = func.call @cc_nil_value() : () -> i64
          %1692 = func.call @cc_errorp(%1690) : (i64) -> i64
          %1693 = arith.cmpi ne, %1692, %1691 : i64
          %1694:2 = scf.if %1693 -> (i64, i64) {
            scf.yield %1690, %1342#5 : i64, i64
          } else {
            %__rlasp_stack_elide_zero_90 = arith.constant 0 : i64
            %1695 = arith.addi %1342#1, %__rlasp_stack_elide_zero_90 : i64
            scf.yield %1695, %1342#1 : i64, i64
          }
          %__rlasp_stack_elide_zero_91 = arith.constant 0 : i64
          %1696 = arith.addi %1694#0, %__rlasp_stack_elide_zero_91 : i64
          scf.yield %1696, %1694#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %1697 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1697, %1342#5 : i64, i64
        }
        %__rlasp_stack_elide_zero_92 = arith.constant 0 : i64
        %1698 = arith.addi %1689#0, %__rlasp_stack_elide_zero_92 : i64
        %__rlasp_stack_elide_zero_93 = arith.constant 0 : i64
        %1699 = arith.addi %1342#4, %__rlasp_stack_elide_zero_93 : i64
        %1700 = func.call @cc_multiple_value_list(%1699) : (i64) -> i64
        %1701 = llvm.mlir.addressof @str76 : !llvm.ptr
        %1702 = arith.constant 38 : i64
        %1703 = func.call @cc_make_string(%1701, %1702) : (!llvm.ptr, i64) -> i64
        %1704 = func.call @cc_nil_value() : () -> i64
        %1705 = func.call @cc_intern(%1703, %1704) : (i64, i64) -> i64
        %1706 = func.call @cc_nil_value() : () -> i64
        %1707 = func.call @cc_cons(%1705, %1706) : (i64, i64) -> i64
        %1708 = func.call @cc_values_pack(%1707) : (i64) -> i64
        %1709 = func.call @cc_symbol_value(%1705) : (i64) -> i64
        %1710 = llvm.mlir.addressof @str77 : !llvm.ptr
        %1711 = arith.constant 39 : i64
        %1712 = func.call @cc_make_string(%1710, %1711) : (!llvm.ptr, i64) -> i64
        %1713 = func.call @cc_nil_value() : () -> i64
        %1714 = func.call @cc_intern(%1712, %1713) : (i64, i64) -> i64
        %1715 = func.call @cc_nil_value() : () -> i64
        %1716 = func.call @cc_cons(%1714, %1715) : (i64, i64) -> i64
        %1717 = func.call @cc_values_pack(%1716) : (i64) -> i64
        %1718 = func.call @cc_symbol_value(%1714) : (i64) -> i64
        %1719 = llvm.mlir.addressof @str78 : !llvm.ptr
        %1720 = arith.constant 40 : i64
        %1721 = func.call @cc_make_string(%1719, %1720) : (!llvm.ptr, i64) -> i64
        %1722 = func.call @cc_nil_value() : () -> i64
        %1723 = func.call @cc_intern(%1721, %1722) : (i64, i64) -> i64
        %1724 = func.call @cc_nil_value() : () -> i64
        %1725 = func.call @cc_cons(%1723, %1724) : (i64, i64) -> i64
        %1726 = func.call @cc_values_pack(%1725) : (i64) -> i64
        %1727 = func.call @cc_symbol_value(%1723) : (i64) -> i64
        %1728 = func.call @cc_nil_value() : () -> i64
        %1729 = arith.cmpi ne, %1709, %1728 : i64
        %1730 = scf.if %1729 -> (i64) {
          scf.yield %1727 : i64
        } else {
          scf.yield %1700 : i64
        }
        %1731 = func.call @cc_values_pack(%1730) : (i64) -> i64
        %__rlasp_stack_elide_zero_94 = arith.constant 0 : i64
        %1732 = arith.addi %1731, %__rlasp_stack_elide_zero_94 : i64
        scf.yield %1732 : i64
      }
      %__rlasp_stack_elide_zero_95 = arith.constant 0 : i64
      %1733 = arith.addi %1313, %__rlasp_stack_elide_zero_95 : i64
      func.call @stack_push_pointer(%1298) : (i64) -> ()
      func.call @stack_push_pointer(%1301) : (i64) -> ()
      func.call @stack_push_pointer(%1733) : (i64) -> ()
      %1734 = llvm.mlir.addressof @str79 : !llvm.ptr
      %1735 = func.call @cc_make_function_ref_const(%1734) : (!llvm.ptr) -> i64
      %1736 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1735, %1736) : (i64, i64) -> ()
      %1737 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1737 : i64
    }
    %__rlasp_stack_elide_zero_96 = arith.constant 0 : i64
    %1738 = arith.addi %1297, %__rlasp_stack_elide_zero_96 : i64
    %1739 = func.call @cc_multiple_value_list(%1738) : (i64) -> i64
    %1740 = llvm.mlir.addressof @str80 : !llvm.ptr
    %1741 = arith.constant 38 : i64
    %1742 = func.call @cc_make_string(%1740, %1741) : (!llvm.ptr, i64) -> i64
    %1743 = func.call @cc_nil_value() : () -> i64
    %1744 = func.call @cc_intern(%1742, %1743) : (i64, i64) -> i64
    %1745 = func.call @cc_nil_value() : () -> i64
    %1746 = func.call @cc_cons(%1744, %1745) : (i64, i64) -> i64
    %1747 = func.call @cc_values_pack(%1746) : (i64) -> i64
    %1748 = func.call @cc_symbol_value(%1744) : (i64) -> i64
    %1749 = llvm.mlir.addressof @str81 : !llvm.ptr
    %1750 = arith.constant 40 : i64
    %1751 = func.call @cc_make_string(%1749, %1750) : (!llvm.ptr, i64) -> i64
    %1752 = func.call @cc_nil_value() : () -> i64
    %1753 = func.call @cc_intern(%1751, %1752) : (i64, i64) -> i64
    %1754 = func.call @cc_nil_value() : () -> i64
    %1755 = func.call @cc_cons(%1753, %1754) : (i64, i64) -> i64
    %1756 = func.call @cc_values_pack(%1755) : (i64) -> i64
    %1757 = func.call @cc_symbol_value(%1753) : (i64) -> i64
    %1758 = func.call @cc_nil_value() : () -> i64
    %1759 = arith.cmpi ne, %1748, %1758 : i64
    %1760 = scf.if %1759 -> (i64) {
      scf.yield %1757 : i64
    } else {
      scf.yield %1739 : i64
    }
    %1761 = func.call @cc_values_pack(%1760) : (i64) -> i64
    func.call @stack_push_pointer(%1761) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_129460800061440*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_129460800061440*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_129460800061440*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("compiled-one-past=~s type=~s fixnum?=~s bignum?=~s~%\00") : !llvm.array<53 x i8>
  llvm.mlir.global private constant @str6("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str19("compiled-integer-length-checks=~s~%\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETFLAG_129460800061441*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETVALUE_129460800061441*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETMVLIST_129460800061441*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETFLAG_129460800061440*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETFLAG_129460800061441*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str25("ASH\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str26("INTEGER-LENGTH\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str27("*__MLIR_BLOCK_RETFLAG_129460800061441*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETVALUE_129460800061441*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETMVLIST_129460800061441*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str30("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("compiled-logand-checks=~s~%\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str32("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("LOGAND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str35("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str36("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("LOGAND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str42("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str43("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str44("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str45("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str46("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str47("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str48("LOGAND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str49("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str50("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str54("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("LOGANDC2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str56("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str57("compiled-single-low-failures=~s~%\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str58("*__MLIR_BLOCK_RETFLAG_129460800061442*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str59("*__MLIR_BLOCK_RETVALUE_129460800061442*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str60("*__MLIR_BLOCK_RETMVLIST_129460800061442*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str61("*__MLIR_BLOCK_RETFLAG_129460800061440*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str62("*__MLIR_BLOCK_RETFLAG_129460800061442*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str63("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("FLOAT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str66("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str67("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str71("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str72("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str73("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("BIGNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("*__MLIR_BLOCK_RETFLAG_129460800061442*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str77("*__MLIR_BLOCK_RETVALUE_129460800061442*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str78("*__MLIR_BLOCK_RETMVLIST_129460800061442*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str79("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETFLAG_129460800061440*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str81("*__MLIR_BLOCK_RETMVLIST_129460800061440*\00") : !llvm.array<41 x i8>
}
