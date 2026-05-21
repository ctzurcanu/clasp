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
  func.func @"%FN%eh-foo"() {
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
    %10 = arith.constant 38 : i64
    %11 = func.call @cc_make_string(%9, %10) : (!llvm.ptr, i64) -> i64
    %12 = func.call @cc_nil_value() : () -> i64
    %13 = func.call @cc_intern(%11, %12) : (i64, i64) -> i64
    %14 = func.call @cc_nil_value() : () -> i64
    %15 = func.call @cc_cons(%13, %14) : (i64, i64) -> i64
    %16 = func.call @cc_values_pack(%15) : (i64) -> i64
    %17 = func.call @cc_set_symbol_value(%13, %8) : (i64, i64) -> i64
    %18 = llvm.mlir.addressof @str2 : !llvm.ptr
    %19 = arith.constant 39 : i64
    %20 = func.call @cc_make_string(%18, %19) : (!llvm.ptr, i64) -> i64
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = func.call @cc_intern(%20, %21) : (i64, i64) -> i64
    %23 = func.call @cc_nil_value() : () -> i64
    %24 = func.call @cc_cons(%22, %23) : (i64, i64) -> i64
    %25 = func.call @cc_values_pack(%24) : (i64) -> i64
    %26 = func.call @cc_set_symbol_value(%22, %8) : (i64, i64) -> i64
    %27 = llvm.mlir.addressof @str3 : !llvm.ptr
    %28 = arith.constant 40 : i64
    %29 = func.call @cc_make_string(%27, %28) : (!llvm.ptr, i64) -> i64
    %30 = func.call @cc_nil_value() : () -> i64
    %31 = func.call @cc_intern(%29, %30) : (i64, i64) -> i64
    %32 = func.call @cc_nil_value() : () -> i64
    %33 = func.call @cc_cons(%31, %32) : (i64, i64) -> i64
    %34 = func.call @cc_values_pack(%33) : (i64) -> i64
    %35 = func.call @cc_set_symbol_value(%31, %8) : (i64, i64) -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = llvm.mlir.addressof @str4 : !llvm.ptr
    %38 = arith.constant 38 : i64
    %39 = func.call @cc_make_string(%37, %38) : (!llvm.ptr, i64) -> i64
    %40 = func.call @cc_nil_value() : () -> i64
    %41 = func.call @cc_intern(%39, %40) : (i64, i64) -> i64
    %42 = func.call @cc_nil_value() : () -> i64
    %43 = func.call @cc_cons(%41, %42) : (i64, i64) -> i64
    %44 = func.call @cc_values_pack(%43) : (i64) -> i64
    %45 = func.call @cc_set_symbol_value(%41, %36) : (i64, i64) -> i64
    %46 = llvm.mlir.addressof @str5 : !llvm.ptr
    %47 = arith.constant 39 : i64
    %48 = func.call @cc_make_string(%46, %47) : (!llvm.ptr, i64) -> i64
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_intern(%48, %49) : (i64, i64) -> i64
    %51 = func.call @cc_nil_value() : () -> i64
    %52 = func.call @cc_cons(%50, %51) : (i64, i64) -> i64
    %53 = func.call @cc_values_pack(%52) : (i64) -> i64
    %54 = func.call @cc_set_symbol_value(%50, %36) : (i64, i64) -> i64
    %55 = llvm.mlir.addressof @str6 : !llvm.ptr
    %56 = arith.constant 40 : i64
    %57 = func.call @cc_make_string(%55, %56) : (!llvm.ptr, i64) -> i64
    %58 = func.call @cc_nil_value() : () -> i64
    %59 = func.call @cc_intern(%57, %58) : (i64, i64) -> i64
    %60 = func.call @cc_nil_value() : () -> i64
    %61 = func.call @cc_cons(%59, %60) : (i64, i64) -> i64
    %62 = func.call @cc_values_pack(%61) : (i64) -> i64
    %63 = func.call @cc_set_symbol_value(%59, %36) : (i64, i64) -> i64
    %64 = func.call @cc_nil_value() : () -> i64
    %65 = llvm.mlir.addressof @str7 : !llvm.ptr
    %66 = arith.constant 38 : i64
    %67 = func.call @cc_make_string(%65, %66) : (!llvm.ptr, i64) -> i64
    %68 = func.call @cc_nil_value() : () -> i64
    %69 = func.call @cc_intern(%67, %68) : (i64, i64) -> i64
    %70 = func.call @cc_nil_value() : () -> i64
    %71 = func.call @cc_cons(%69, %70) : (i64, i64) -> i64
    %72 = func.call @cc_values_pack(%71) : (i64) -> i64
    %73 = func.call @cc_set_symbol_value(%69, %64) : (i64, i64) -> i64
    %74 = llvm.mlir.addressof @str8 : !llvm.ptr
    %75 = arith.constant 39 : i64
    %76 = func.call @cc_make_string(%74, %75) : (!llvm.ptr, i64) -> i64
    %77 = func.call @cc_nil_value() : () -> i64
    %78 = func.call @cc_intern(%76, %77) : (i64, i64) -> i64
    %79 = func.call @cc_nil_value() : () -> i64
    %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
    %81 = func.call @cc_values_pack(%80) : (i64) -> i64
    %82 = func.call @cc_set_symbol_value(%78, %64) : (i64, i64) -> i64
    %83 = llvm.mlir.addressof @str9 : !llvm.ptr
    %84 = arith.constant 40 : i64
    %85 = func.call @cc_make_string(%83, %84) : (!llvm.ptr, i64) -> i64
    %86 = func.call @cc_nil_value() : () -> i64
    %87 = func.call @cc_intern(%85, %86) : (i64, i64) -> i64
    %88 = func.call @cc_nil_value() : () -> i64
    %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
    %90 = func.call @cc_values_pack(%89) : (i64) -> i64
    %91 = func.call @cc_set_symbol_value(%87, %64) : (i64, i64) -> i64
    %92 = arith.constant 1 : i64
    func.call @stack_push_fixnum(%92) : (i64) -> ()
    %93 = func.call @stack_pop_pointer() : () -> i64
    %94 = func.call @cc_multiple_value_list(%93) : (i64) -> i64
    %95 = func.call @cc_t_value() : () -> i64
    %96 = llvm.mlir.addressof @str10 : !llvm.ptr
    %97 = arith.constant 38 : i64
    %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
    %99 = func.call @cc_nil_value() : () -> i64
    %100 = func.call @cc_intern(%98, %99) : (i64, i64) -> i64
    %101 = func.call @cc_nil_value() : () -> i64
    %102 = func.call @cc_cons(%100, %101) : (i64, i64) -> i64
    %103 = func.call @cc_values_pack(%102) : (i64) -> i64
    %104 = func.call @cc_set_symbol_value(%100, %95) : (i64, i64) -> i64
    %105 = llvm.mlir.addressof @str11 : !llvm.ptr
    %106 = arith.constant 39 : i64
    %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
    %108 = func.call @cc_nil_value() : () -> i64
    %109 = func.call @cc_intern(%107, %108) : (i64, i64) -> i64
    %110 = func.call @cc_nil_value() : () -> i64
    %111 = func.call @cc_cons(%109, %110) : (i64, i64) -> i64
    %112 = func.call @cc_values_pack(%111) : (i64) -> i64
    %113 = func.call @cc_set_symbol_value(%109, %93) : (i64, i64) -> i64
    %114 = llvm.mlir.addressof @str12 : !llvm.ptr
    %115 = arith.constant 40 : i64
    %116 = func.call @cc_make_string(%114, %115) : (!llvm.ptr, i64) -> i64
    %117 = func.call @cc_nil_value() : () -> i64
    %118 = func.call @cc_intern(%116, %117) : (i64, i64) -> i64
    %119 = func.call @cc_nil_value() : () -> i64
    %120 = func.call @cc_cons(%118, %119) : (i64, i64) -> i64
    %121 = func.call @cc_values_pack(%120) : (i64) -> i64
    %122 = func.call @cc_set_symbol_value(%118, %94) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_0 = arith.constant 0 : i64
    %123 = arith.addi %93, %__rlasp_stack_elide_zero_0 : i64
    %124 = func.call @cc_multiple_value_list(%123) : (i64) -> i64
    %189 = arith.constant 175130764378115 : i64
    %190 = arith.constant 0 : i64
    %191 = func.call @cc_make_closure(%189, %190) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_1 = arith.constant 0 : i64
    %192 = arith.addi %191, %__rlasp_stack_elide_zero_1 : i64
    %193 = arith.constant 0 : i64
    func.call @cc_funcall_stack(%192, %193) : (i64, i64) -> ()
    %194 = func.call @stack_depth() : () -> i64
    %195 = arith.constant 0 : i64
    %196 = arith.cmpi sgt, %194, %195 : i64
    scf.if %196 {
      %197 = func.call @stack_pop_pointer() : () -> i64
    }
    %198 = func.call @cc_values_pack(%124) : (i64) -> i64
    %__rlasp_stack_elide_zero_2 = arith.constant 0 : i64
    %199 = arith.addi %198, %__rlasp_stack_elide_zero_2 : i64
    %200 = func.call @cc_multiple_value_list(%199) : (i64) -> i64
    %201 = llvm.mlir.addressof @str19 : !llvm.ptr
    %202 = arith.constant 38 : i64
    %203 = func.call @cc_make_string(%201, %202) : (!llvm.ptr, i64) -> i64
    %204 = func.call @cc_nil_value() : () -> i64
    %205 = func.call @cc_intern(%203, %204) : (i64, i64) -> i64
    %206 = func.call @cc_nil_value() : () -> i64
    %207 = func.call @cc_cons(%205, %206) : (i64, i64) -> i64
    %208 = func.call @cc_values_pack(%207) : (i64) -> i64
    %209 = func.call @cc_symbol_value(%205) : (i64) -> i64
    %210 = llvm.mlir.addressof @str20 : !llvm.ptr
    %211 = arith.constant 39 : i64
    %212 = func.call @cc_make_string(%210, %211) : (!llvm.ptr, i64) -> i64
    %213 = func.call @cc_nil_value() : () -> i64
    %214 = func.call @cc_intern(%212, %213) : (i64, i64) -> i64
    %215 = func.call @cc_nil_value() : () -> i64
    %216 = func.call @cc_cons(%214, %215) : (i64, i64) -> i64
    %217 = func.call @cc_values_pack(%216) : (i64) -> i64
    %218 = func.call @cc_symbol_value(%214) : (i64) -> i64
    %219 = llvm.mlir.addressof @str21 : !llvm.ptr
    %220 = arith.constant 40 : i64
    %221 = func.call @cc_make_string(%219, %220) : (!llvm.ptr, i64) -> i64
    %222 = func.call @cc_nil_value() : () -> i64
    %223 = func.call @cc_intern(%221, %222) : (i64, i64) -> i64
    %224 = func.call @cc_nil_value() : () -> i64
    %225 = func.call @cc_cons(%223, %224) : (i64, i64) -> i64
    %226 = func.call @cc_values_pack(%225) : (i64) -> i64
    %227 = func.call @cc_symbol_value(%223) : (i64) -> i64
    %228 = func.call @cc_nil_value() : () -> i64
    %229 = arith.cmpi ne, %209, %228 : i64
    %230 = scf.if %229 -> (i64) {
      scf.yield %227 : i64
    } else {
      scf.yield %200 : i64
    }
    %231 = func.call @cc_values_pack(%230) : (i64) -> i64
    %__rlasp_stack_elide_zero_3 = arith.constant 0 : i64
    %232 = arith.addi %231, %__rlasp_stack_elide_zero_3 : i64
    %233 = func.call @cc_multiple_value_list(%232) : (i64) -> i64
    %234 = llvm.mlir.addressof @str22 : !llvm.ptr
    %235 = arith.constant 38 : i64
    %236 = func.call @cc_make_string(%234, %235) : (!llvm.ptr, i64) -> i64
    %237 = func.call @cc_nil_value() : () -> i64
    %238 = func.call @cc_intern(%236, %237) : (i64, i64) -> i64
    %239 = func.call @cc_nil_value() : () -> i64
    %240 = func.call @cc_cons(%238, %239) : (i64, i64) -> i64
    %241 = func.call @cc_values_pack(%240) : (i64) -> i64
    %242 = func.call @cc_symbol_value(%238) : (i64) -> i64
    %243 = llvm.mlir.addressof @str23 : !llvm.ptr
    %244 = arith.constant 39 : i64
    %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
    %246 = func.call @cc_nil_value() : () -> i64
    %247 = func.call @cc_intern(%245, %246) : (i64, i64) -> i64
    %248 = func.call @cc_nil_value() : () -> i64
    %249 = func.call @cc_cons(%247, %248) : (i64, i64) -> i64
    %250 = func.call @cc_values_pack(%249) : (i64) -> i64
    %251 = func.call @cc_symbol_value(%247) : (i64) -> i64
    %252 = llvm.mlir.addressof @str24 : !llvm.ptr
    %253 = arith.constant 40 : i64
    %254 = func.call @cc_make_string(%252, %253) : (!llvm.ptr, i64) -> i64
    %255 = func.call @cc_nil_value() : () -> i64
    %256 = func.call @cc_intern(%254, %255) : (i64, i64) -> i64
    %257 = func.call @cc_nil_value() : () -> i64
    %258 = func.call @cc_cons(%256, %257) : (i64, i64) -> i64
    %259 = func.call @cc_values_pack(%258) : (i64) -> i64
    %260 = func.call @cc_symbol_value(%256) : (i64) -> i64
    %261 = func.call @cc_nil_value() : () -> i64
    %262 = arith.cmpi ne, %242, %261 : i64
    %263 = scf.if %262 -> (i64) {
      scf.yield %260 : i64
    } else {
      scf.yield %233 : i64
    }
    %264 = func.call @cc_values_pack(%263) : (i64) -> i64
    %__rlasp_stack_elide_zero_4 = arith.constant 0 : i64
    %265 = arith.addi %264, %__rlasp_stack_elide_zero_4 : i64
    %266 = func.call @cc_multiple_value_list(%265) : (i64) -> i64
    %267 = llvm.mlir.addressof @str25 : !llvm.ptr
    %268 = arith.constant 38 : i64
    %269 = func.call @cc_make_string(%267, %268) : (!llvm.ptr, i64) -> i64
    %270 = func.call @cc_nil_value() : () -> i64
    %271 = func.call @cc_intern(%269, %270) : (i64, i64) -> i64
    %272 = func.call @cc_nil_value() : () -> i64
    %273 = func.call @cc_cons(%271, %272) : (i64, i64) -> i64
    %274 = func.call @cc_values_pack(%273) : (i64) -> i64
    %275 = func.call @cc_symbol_value(%271) : (i64) -> i64
    %276 = llvm.mlir.addressof @str26 : !llvm.ptr
    %277 = arith.constant 40 : i64
    %278 = func.call @cc_make_string(%276, %277) : (!llvm.ptr, i64) -> i64
    %279 = func.call @cc_nil_value() : () -> i64
    %280 = func.call @cc_intern(%278, %279) : (i64, i64) -> i64
    %281 = func.call @cc_nil_value() : () -> i64
    %282 = func.call @cc_cons(%280, %281) : (i64, i64) -> i64
    %283 = func.call @cc_values_pack(%282) : (i64) -> i64
    %284 = func.call @cc_symbol_value(%280) : (i64) -> i64
    %285 = func.call @cc_nil_value() : () -> i64
    %286 = arith.cmpi ne, %275, %285 : i64
    %287 = scf.if %286 -> (i64) {
      scf.yield %284 : i64
    } else {
      scf.yield %266 : i64
    }
    %288 = func.call @cc_values_pack(%287) : (i64) -> i64
    func.call @stack_push_pointer(%288) : (i64) -> ()
    func.return
  }
  func.func @"%FN%eh-bar"() {
    %289 = llvm.mlir.addressof @str27 : !llvm.ptr
    %290 = arith.constant 6 : i64
    %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
    %292 = func.call @cc_nil_value() : () -> i64
    %293 = func.call @cc_intern(%291, %292) : (i64, i64) -> i64
    %294 = func.call @cc_nil_value() : () -> i64
    %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
    %296 = func.call @cc_values_pack(%295) : (i64) -> i64
    %297 = func.call @cc_nil_value() : () -> i64
    %298 = llvm.mlir.addressof @str28 : !llvm.ptr
    %299 = arith.constant 38 : i64
    %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
    %301 = func.call @cc_nil_value() : () -> i64
    %302 = func.call @cc_intern(%300, %301) : (i64, i64) -> i64
    %303 = func.call @cc_nil_value() : () -> i64
    %304 = func.call @cc_cons(%302, %303) : (i64, i64) -> i64
    %305 = func.call @cc_values_pack(%304) : (i64) -> i64
    %306 = func.call @cc_set_symbol_value(%302, %297) : (i64, i64) -> i64
    %307 = llvm.mlir.addressof @str29 : !llvm.ptr
    %308 = arith.constant 39 : i64
    %309 = func.call @cc_make_string(%307, %308) : (!llvm.ptr, i64) -> i64
    %310 = func.call @cc_nil_value() : () -> i64
    %311 = func.call @cc_intern(%309, %310) : (i64, i64) -> i64
    %312 = func.call @cc_nil_value() : () -> i64
    %313 = func.call @cc_cons(%311, %312) : (i64, i64) -> i64
    %314 = func.call @cc_values_pack(%313) : (i64) -> i64
    %315 = func.call @cc_set_symbol_value(%311, %297) : (i64, i64) -> i64
    %316 = llvm.mlir.addressof @str30 : !llvm.ptr
    %317 = arith.constant 40 : i64
    %318 = func.call @cc_make_string(%316, %317) : (!llvm.ptr, i64) -> i64
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = func.call @cc_intern(%318, %319) : (i64, i64) -> i64
    %321 = func.call @cc_nil_value() : () -> i64
    %322 = func.call @cc_cons(%320, %321) : (i64, i64) -> i64
    %323 = func.call @cc_values_pack(%322) : (i64) -> i64
    %324 = func.call @cc_set_symbol_value(%320, %297) : (i64, i64) -> i64
    %325 = func.call @cc_nil_value() : () -> i64
    %326 = llvm.mlir.addressof @str31 : !llvm.ptr
    %327 = arith.constant 38 : i64
    %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
    %329 = func.call @cc_nil_value() : () -> i64
    %330 = func.call @cc_intern(%328, %329) : (i64, i64) -> i64
    %331 = func.call @cc_nil_value() : () -> i64
    %332 = func.call @cc_cons(%330, %331) : (i64, i64) -> i64
    %333 = func.call @cc_values_pack(%332) : (i64) -> i64
    %334 = func.call @cc_set_symbol_value(%330, %325) : (i64, i64) -> i64
    %335 = llvm.mlir.addressof @str32 : !llvm.ptr
    %336 = arith.constant 39 : i64
    %337 = func.call @cc_make_string(%335, %336) : (!llvm.ptr, i64) -> i64
    %338 = func.call @cc_nil_value() : () -> i64
    %339 = func.call @cc_intern(%337, %338) : (i64, i64) -> i64
    %340 = func.call @cc_nil_value() : () -> i64
    %341 = func.call @cc_cons(%339, %340) : (i64, i64) -> i64
    %342 = func.call @cc_values_pack(%341) : (i64) -> i64
    %343 = func.call @cc_set_symbol_value(%339, %325) : (i64, i64) -> i64
    %344 = llvm.mlir.addressof @str33 : !llvm.ptr
    %345 = arith.constant 40 : i64
    %346 = func.call @cc_make_string(%344, %345) : (!llvm.ptr, i64) -> i64
    %347 = func.call @cc_nil_value() : () -> i64
    %348 = func.call @cc_intern(%346, %347) : (i64, i64) -> i64
    %349 = func.call @cc_nil_value() : () -> i64
    %350 = func.call @cc_cons(%348, %349) : (i64, i64) -> i64
    %351 = func.call @cc_values_pack(%350) : (i64) -> i64
    %352 = func.call @cc_set_symbol_value(%348, %325) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %353 = func.call @stack_pop_pointer() : () -> i64
    %354 = func.call @cc_multiple_value_list(%353) : (i64) -> i64
    %392 = arith.constant 175130764378118 : i64
    %393 = arith.constant 0 : i64
    %394 = func.call @cc_make_closure(%392, %393) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_5 = arith.constant 0 : i64
    %395 = arith.addi %394, %__rlasp_stack_elide_zero_5 : i64
    %396 = arith.constant 0 : i64
    func.call @cc_funcall_stack(%395, %396) : (i64, i64) -> ()
    %397 = func.call @stack_depth() : () -> i64
    %398 = arith.constant 0 : i64
    %399 = arith.cmpi sgt, %397, %398 : i64
    scf.if %399 {
      %400 = func.call @stack_pop_pointer() : () -> i64
    }
    %401 = func.call @cc_values_pack(%354) : (i64) -> i64
    %__rlasp_stack_elide_zero_6 = arith.constant 0 : i64
    %402 = arith.addi %401, %__rlasp_stack_elide_zero_6 : i64
    %403 = func.call @cc_multiple_value_list(%402) : (i64) -> i64
    %404 = llvm.mlir.addressof @str37 : !llvm.ptr
    %405 = arith.constant 38 : i64
    %406 = func.call @cc_make_string(%404, %405) : (!llvm.ptr, i64) -> i64
    %407 = func.call @cc_nil_value() : () -> i64
    %408 = func.call @cc_intern(%406, %407) : (i64, i64) -> i64
    %409 = func.call @cc_nil_value() : () -> i64
    %410 = func.call @cc_cons(%408, %409) : (i64, i64) -> i64
    %411 = func.call @cc_values_pack(%410) : (i64) -> i64
    %412 = func.call @cc_symbol_value(%408) : (i64) -> i64
    %413 = llvm.mlir.addressof @str38 : !llvm.ptr
    %414 = arith.constant 39 : i64
    %415 = func.call @cc_make_string(%413, %414) : (!llvm.ptr, i64) -> i64
    %416 = func.call @cc_nil_value() : () -> i64
    %417 = func.call @cc_intern(%415, %416) : (i64, i64) -> i64
    %418 = func.call @cc_nil_value() : () -> i64
    %419 = func.call @cc_cons(%417, %418) : (i64, i64) -> i64
    %420 = func.call @cc_values_pack(%419) : (i64) -> i64
    %421 = func.call @cc_symbol_value(%417) : (i64) -> i64
    %422 = llvm.mlir.addressof @str39 : !llvm.ptr
    %423 = arith.constant 40 : i64
    %424 = func.call @cc_make_string(%422, %423) : (!llvm.ptr, i64) -> i64
    %425 = func.call @cc_nil_value() : () -> i64
    %426 = func.call @cc_intern(%424, %425) : (i64, i64) -> i64
    %427 = func.call @cc_nil_value() : () -> i64
    %428 = func.call @cc_cons(%426, %427) : (i64, i64) -> i64
    %429 = func.call @cc_values_pack(%428) : (i64) -> i64
    %430 = func.call @cc_symbol_value(%426) : (i64) -> i64
    %431 = func.call @cc_nil_value() : () -> i64
    %432 = arith.cmpi ne, %412, %431 : i64
    %433 = scf.if %432 -> (i64) {
      scf.yield %430 : i64
    } else {
      scf.yield %403 : i64
    }
    %434 = func.call @cc_values_pack(%433) : (i64) -> i64
    %__rlasp_stack_elide_zero_7 = arith.constant 0 : i64
    %435 = arith.addi %434, %__rlasp_stack_elide_zero_7 : i64
    %436 = func.call @cc_multiple_value_list(%435) : (i64) -> i64
    %437 = llvm.mlir.addressof @str40 : !llvm.ptr
    %438 = arith.constant 38 : i64
    %439 = func.call @cc_make_string(%437, %438) : (!llvm.ptr, i64) -> i64
    %440 = func.call @cc_nil_value() : () -> i64
    %441 = func.call @cc_intern(%439, %440) : (i64, i64) -> i64
    %442 = func.call @cc_nil_value() : () -> i64
    %443 = func.call @cc_cons(%441, %442) : (i64, i64) -> i64
    %444 = func.call @cc_values_pack(%443) : (i64) -> i64
    %445 = func.call @cc_symbol_value(%441) : (i64) -> i64
    %446 = llvm.mlir.addressof @str41 : !llvm.ptr
    %447 = arith.constant 40 : i64
    %448 = func.call @cc_make_string(%446, %447) : (!llvm.ptr, i64) -> i64
    %449 = func.call @cc_nil_value() : () -> i64
    %450 = func.call @cc_intern(%448, %449) : (i64, i64) -> i64
    %451 = func.call @cc_nil_value() : () -> i64
    %452 = func.call @cc_cons(%450, %451) : (i64, i64) -> i64
    %453 = func.call @cc_values_pack(%452) : (i64) -> i64
    %454 = func.call @cc_symbol_value(%450) : (i64) -> i64
    %455 = func.call @cc_nil_value() : () -> i64
    %456 = arith.cmpi ne, %445, %455 : i64
    %457 = scf.if %456 -> (i64) {
      scf.yield %454 : i64
    } else {
      scf.yield %436 : i64
    }
    %458 = func.call @cc_values_pack(%457) : (i64) -> i64
    func.call @stack_push_pointer(%458) : (i64) -> ()
    func.return
  }
  func.func @"%FN%eh-baz"() {
    %459 = llvm.mlir.addressof @str42 : !llvm.ptr
    %460 = arith.constant 6 : i64
    %461 = func.call @cc_make_string(%459, %460) : (!llvm.ptr, i64) -> i64
    %462 = func.call @cc_nil_value() : () -> i64
    %463 = func.call @cc_intern(%461, %462) : (i64, i64) -> i64
    %464 = func.call @cc_nil_value() : () -> i64
    %465 = func.call @cc_cons(%463, %464) : (i64, i64) -> i64
    %466 = func.call @cc_values_pack(%465) : (i64) -> i64
    %467 = func.call @cc_nil_value() : () -> i64
    %468 = llvm.mlir.addressof @str43 : !llvm.ptr
    %469 = arith.constant 38 : i64
    %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
    %471 = func.call @cc_nil_value() : () -> i64
    %472 = func.call @cc_intern(%470, %471) : (i64, i64) -> i64
    %473 = func.call @cc_nil_value() : () -> i64
    %474 = func.call @cc_cons(%472, %473) : (i64, i64) -> i64
    %475 = func.call @cc_values_pack(%474) : (i64) -> i64
    %476 = func.call @cc_set_symbol_value(%472, %467) : (i64, i64) -> i64
    %477 = llvm.mlir.addressof @str44 : !llvm.ptr
    %478 = arith.constant 39 : i64
    %479 = func.call @cc_make_string(%477, %478) : (!llvm.ptr, i64) -> i64
    %480 = func.call @cc_nil_value() : () -> i64
    %481 = func.call @cc_intern(%479, %480) : (i64, i64) -> i64
    %482 = func.call @cc_nil_value() : () -> i64
    %483 = func.call @cc_cons(%481, %482) : (i64, i64) -> i64
    %484 = func.call @cc_values_pack(%483) : (i64) -> i64
    %485 = func.call @cc_set_symbol_value(%481, %467) : (i64, i64) -> i64
    %486 = llvm.mlir.addressof @str45 : !llvm.ptr
    %487 = arith.constant 40 : i64
    %488 = func.call @cc_make_string(%486, %487) : (!llvm.ptr, i64) -> i64
    %489 = func.call @cc_nil_value() : () -> i64
    %490 = func.call @cc_intern(%488, %489) : (i64, i64) -> i64
    %491 = func.call @cc_nil_value() : () -> i64
    %492 = func.call @cc_cons(%490, %491) : (i64, i64) -> i64
    %493 = func.call @cc_values_pack(%492) : (i64) -> i64
    %494 = func.call @cc_set_symbol_value(%490, %467) : (i64, i64) -> i64
    %495 = func.call @cc_nil_value() : () -> i64
    %496 = llvm.mlir.addressof @str46 : !llvm.ptr
    %497 = arith.constant 38 : i64
    %498 = func.call @cc_make_string(%496, %497) : (!llvm.ptr, i64) -> i64
    %499 = func.call @cc_nil_value() : () -> i64
    %500 = func.call @cc_intern(%498, %499) : (i64, i64) -> i64
    %501 = func.call @cc_nil_value() : () -> i64
    %502 = func.call @cc_cons(%500, %501) : (i64, i64) -> i64
    %503 = func.call @cc_values_pack(%502) : (i64) -> i64
    %504 = func.call @cc_set_symbol_value(%500, %495) : (i64, i64) -> i64
    %505 = llvm.mlir.addressof @str47 : !llvm.ptr
    %506 = arith.constant 39 : i64
    %507 = func.call @cc_make_string(%505, %506) : (!llvm.ptr, i64) -> i64
    %508 = func.call @cc_nil_value() : () -> i64
    %509 = func.call @cc_intern(%507, %508) : (i64, i64) -> i64
    %510 = func.call @cc_nil_value() : () -> i64
    %511 = func.call @cc_cons(%509, %510) : (i64, i64) -> i64
    %512 = func.call @cc_values_pack(%511) : (i64) -> i64
    %513 = func.call @cc_set_symbol_value(%509, %495) : (i64, i64) -> i64
    %514 = llvm.mlir.addressof @str48 : !llvm.ptr
    %515 = arith.constant 40 : i64
    %516 = func.call @cc_make_string(%514, %515) : (!llvm.ptr, i64) -> i64
    %517 = func.call @cc_nil_value() : () -> i64
    %518 = func.call @cc_intern(%516, %517) : (i64, i64) -> i64
    %519 = func.call @cc_nil_value() : () -> i64
    %520 = func.call @cc_cons(%518, %519) : (i64, i64) -> i64
    %521 = func.call @cc_values_pack(%520) : (i64) -> i64
    %522 = func.call @cc_set_symbol_value(%518, %495) : (i64, i64) -> i64
    %523 = arith.constant 1 : i64
    func.call @stack_push_fixnum(%523) : (i64) -> ()
    %524 = func.call @stack_pop_pointer() : () -> i64
    %525 = func.call @cc_multiple_value_list(%524) : (i64) -> i64
    %526 = func.call @cc_t_value() : () -> i64
    %527 = llvm.mlir.addressof @str49 : !llvm.ptr
    %528 = arith.constant 38 : i64
    %529 = func.call @cc_make_string(%527, %528) : (!llvm.ptr, i64) -> i64
    %530 = func.call @cc_nil_value() : () -> i64
    %531 = func.call @cc_intern(%529, %530) : (i64, i64) -> i64
    %532 = func.call @cc_nil_value() : () -> i64
    %533 = func.call @cc_cons(%531, %532) : (i64, i64) -> i64
    %534 = func.call @cc_values_pack(%533) : (i64) -> i64
    %535 = func.call @cc_set_symbol_value(%531, %526) : (i64, i64) -> i64
    %536 = llvm.mlir.addressof @str50 : !llvm.ptr
    %537 = arith.constant 39 : i64
    %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
    %539 = func.call @cc_nil_value() : () -> i64
    %540 = func.call @cc_intern(%538, %539) : (i64, i64) -> i64
    %541 = func.call @cc_nil_value() : () -> i64
    %542 = func.call @cc_cons(%540, %541) : (i64, i64) -> i64
    %543 = func.call @cc_values_pack(%542) : (i64) -> i64
    %544 = func.call @cc_set_symbol_value(%540, %524) : (i64, i64) -> i64
    %545 = llvm.mlir.addressof @str51 : !llvm.ptr
    %546 = arith.constant 40 : i64
    %547 = func.call @cc_make_string(%545, %546) : (!llvm.ptr, i64) -> i64
    %548 = func.call @cc_nil_value() : () -> i64
    %549 = func.call @cc_intern(%547, %548) : (i64, i64) -> i64
    %550 = func.call @cc_nil_value() : () -> i64
    %551 = func.call @cc_cons(%549, %550) : (i64, i64) -> i64
    %552 = func.call @cc_values_pack(%551) : (i64) -> i64
    %553 = func.call @cc_set_symbol_value(%549, %525) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_8 = arith.constant 0 : i64
    %554 = arith.addi %524, %__rlasp_stack_elide_zero_8 : i64
    %555 = func.call @cc_multiple_value_list(%554) : (i64) -> i64
    %556 = func.call @cc_nil_value() : () -> i64
    %557 = llvm.mlir.addressof @str52 : !llvm.ptr
    %558 = arith.constant 38 : i64
    %559 = func.call @cc_make_string(%557, %558) : (!llvm.ptr, i64) -> i64
    %560 = func.call @cc_nil_value() : () -> i64
    %561 = func.call @cc_intern(%559, %560) : (i64, i64) -> i64
    %562 = func.call @cc_nil_value() : () -> i64
    %563 = func.call @cc_cons(%561, %562) : (i64, i64) -> i64
    %564 = func.call @cc_values_pack(%563) : (i64) -> i64
    %565 = func.call @cc_set_symbol_value(%561, %556) : (i64, i64) -> i64
    %566 = llvm.mlir.addressof @str53 : !llvm.ptr
    %567 = arith.constant 39 : i64
    %568 = func.call @cc_make_string(%566, %567) : (!llvm.ptr, i64) -> i64
    %569 = func.call @cc_nil_value() : () -> i64
    %570 = func.call @cc_intern(%568, %569) : (i64, i64) -> i64
    %571 = func.call @cc_nil_value() : () -> i64
    %572 = func.call @cc_cons(%570, %571) : (i64, i64) -> i64
    %573 = func.call @cc_values_pack(%572) : (i64) -> i64
    %574 = func.call @cc_set_symbol_value(%570, %556) : (i64, i64) -> i64
    %575 = llvm.mlir.addressof @str54 : !llvm.ptr
    %576 = arith.constant 40 : i64
    %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
    %578 = func.call @cc_nil_value() : () -> i64
    %579 = func.call @cc_intern(%577, %578) : (i64, i64) -> i64
    %580 = func.call @cc_nil_value() : () -> i64
    %581 = func.call @cc_cons(%579, %580) : (i64, i64) -> i64
    %582 = func.call @cc_values_pack(%581) : (i64) -> i64
    %583 = func.call @cc_set_symbol_value(%579, %556) : (i64, i64) -> i64
    %621 = arith.constant 175130764378122 : i64
    %622 = arith.constant 0 : i64
    %623 = func.call @cc_make_closure(%621, %622) : (i64, i64) -> i64
    %__rlasp_stack_elide_zero_9 = arith.constant 0 : i64
    %624 = arith.addi %623, %__rlasp_stack_elide_zero_9 : i64
    %625 = arith.constant 0 : i64
    func.call @cc_funcall_stack(%624, %625) : (i64, i64) -> ()
    %626 = func.call @stack_pop_pointer() : () -> i64
    %627 = func.call @cc_multiple_value_list(%626) : (i64) -> i64
    %628 = llvm.mlir.addressof @str58 : !llvm.ptr
    %629 = arith.constant 38 : i64
    %630 = func.call @cc_make_string(%628, %629) : (!llvm.ptr, i64) -> i64
    %631 = func.call @cc_nil_value() : () -> i64
    %632 = func.call @cc_intern(%630, %631) : (i64, i64) -> i64
    %633 = func.call @cc_nil_value() : () -> i64
    %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
    %635 = func.call @cc_values_pack(%634) : (i64) -> i64
    %636 = func.call @cc_symbol_value(%632) : (i64) -> i64
    %637 = llvm.mlir.addressof @str59 : !llvm.ptr
    %638 = arith.constant 39 : i64
    %639 = func.call @cc_make_string(%637, %638) : (!llvm.ptr, i64) -> i64
    %640 = func.call @cc_nil_value() : () -> i64
    %641 = func.call @cc_intern(%639, %640) : (i64, i64) -> i64
    %642 = func.call @cc_nil_value() : () -> i64
    %643 = func.call @cc_cons(%641, %642) : (i64, i64) -> i64
    %644 = func.call @cc_values_pack(%643) : (i64) -> i64
    %645 = func.call @cc_symbol_value(%641) : (i64) -> i64
    %646 = llvm.mlir.addressof @str60 : !llvm.ptr
    %647 = arith.constant 40 : i64
    %648 = func.call @cc_make_string(%646, %647) : (!llvm.ptr, i64) -> i64
    %649 = func.call @cc_nil_value() : () -> i64
    %650 = func.call @cc_intern(%648, %649) : (i64, i64) -> i64
    %651 = func.call @cc_nil_value() : () -> i64
    %652 = func.call @cc_cons(%650, %651) : (i64, i64) -> i64
    %653 = func.call @cc_values_pack(%652) : (i64) -> i64
    %654 = func.call @cc_symbol_value(%650) : (i64) -> i64
    %655 = func.call @cc_nil_value() : () -> i64
    %656 = arith.cmpi ne, %636, %655 : i64
    %657 = scf.if %656 -> (i64) {
      scf.yield %654 : i64
    } else {
      scf.yield %627 : i64
    }
    %658 = func.call @cc_values_pack(%657) : (i64) -> i64
    func.call @stack_push_pointer(%658) : (i64) -> ()
    %659 = func.call @stack_depth() : () -> i64
    %660 = arith.constant 0 : i64
    %661 = arith.cmpi sgt, %659, %660 : i64
    scf.if %661 {
      %662 = func.call @stack_pop_pointer() : () -> i64
    }
    %663 = func.call @cc_values_pack(%555) : (i64) -> i64
    %__rlasp_stack_elide_zero_10 = arith.constant 0 : i64
    %664 = arith.addi %663, %__rlasp_stack_elide_zero_10 : i64
    %665 = func.call @cc_multiple_value_list(%664) : (i64) -> i64
    %666 = llvm.mlir.addressof @str61 : !llvm.ptr
    %667 = arith.constant 38 : i64
    %668 = func.call @cc_make_string(%666, %667) : (!llvm.ptr, i64) -> i64
    %669 = func.call @cc_nil_value() : () -> i64
    %670 = func.call @cc_intern(%668, %669) : (i64, i64) -> i64
    %671 = func.call @cc_nil_value() : () -> i64
    %672 = func.call @cc_cons(%670, %671) : (i64, i64) -> i64
    %673 = func.call @cc_values_pack(%672) : (i64) -> i64
    %674 = func.call @cc_symbol_value(%670) : (i64) -> i64
    %675 = llvm.mlir.addressof @str62 : !llvm.ptr
    %676 = arith.constant 39 : i64
    %677 = func.call @cc_make_string(%675, %676) : (!llvm.ptr, i64) -> i64
    %678 = func.call @cc_nil_value() : () -> i64
    %679 = func.call @cc_intern(%677, %678) : (i64, i64) -> i64
    %680 = func.call @cc_nil_value() : () -> i64
    %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
    %682 = func.call @cc_values_pack(%681) : (i64) -> i64
    %683 = func.call @cc_symbol_value(%679) : (i64) -> i64
    %684 = llvm.mlir.addressof @str63 : !llvm.ptr
    %685 = arith.constant 40 : i64
    %686 = func.call @cc_make_string(%684, %685) : (!llvm.ptr, i64) -> i64
    %687 = func.call @cc_nil_value() : () -> i64
    %688 = func.call @cc_intern(%686, %687) : (i64, i64) -> i64
    %689 = func.call @cc_nil_value() : () -> i64
    %690 = func.call @cc_cons(%688, %689) : (i64, i64) -> i64
    %691 = func.call @cc_values_pack(%690) : (i64) -> i64
    %692 = func.call @cc_symbol_value(%688) : (i64) -> i64
    %693 = func.call @cc_nil_value() : () -> i64
    %694 = arith.cmpi ne, %674, %693 : i64
    %695 = scf.if %694 -> (i64) {
      scf.yield %692 : i64
    } else {
      scf.yield %665 : i64
    }
    %696 = func.call @cc_values_pack(%695) : (i64) -> i64
    %__rlasp_stack_elide_zero_11 = arith.constant 0 : i64
    %697 = arith.addi %696, %__rlasp_stack_elide_zero_11 : i64
    %698 = func.call @cc_multiple_value_list(%697) : (i64) -> i64
    %699 = llvm.mlir.addressof @str64 : !llvm.ptr
    %700 = arith.constant 38 : i64
    %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
    %702 = func.call @cc_nil_value() : () -> i64
    %703 = func.call @cc_intern(%701, %702) : (i64, i64) -> i64
    %704 = func.call @cc_nil_value() : () -> i64
    %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
    %706 = func.call @cc_values_pack(%705) : (i64) -> i64
    %707 = func.call @cc_symbol_value(%703) : (i64) -> i64
    %708 = llvm.mlir.addressof @str65 : !llvm.ptr
    %709 = arith.constant 40 : i64
    %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
    %711 = func.call @cc_nil_value() : () -> i64
    %712 = func.call @cc_intern(%710, %711) : (i64, i64) -> i64
    %713 = func.call @cc_nil_value() : () -> i64
    %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
    %715 = func.call @cc_values_pack(%714) : (i64) -> i64
    %716 = func.call @cc_symbol_value(%712) : (i64) -> i64
    %717 = func.call @cc_nil_value() : () -> i64
    %718 = arith.cmpi ne, %707, %717 : i64
    %719 = scf.if %718 -> (i64) {
      scf.yield %716 : i64
    } else {
      scf.yield %698 : i64
    }
    %720 = func.call @cc_values_pack(%719) : (i64) -> i64
    func.call @stack_push_pointer(%720) : (i64) -> ()
    func.return
  }
  func.func @"__main"() {
    %721 = llvm.mlir.addressof @str66 : !llvm.ptr
    %722 = arith.constant 6 : i64
    %723 = func.call @cc_make_string(%721, %722) : (!llvm.ptr, i64) -> i64
    %724 = func.call @cc_nil_value() : () -> i64
    %725 = func.call @cc_intern(%723, %724) : (i64, i64) -> i64
    %726 = func.call @cc_nil_value() : () -> i64
    %727 = func.call @cc_cons(%725, %726) : (i64, i64) -> i64
    %728 = func.call @cc_values_pack(%727) : (i64) -> i64
    %729 = func.call @cc_nil_value() : () -> i64
    %730 = llvm.mlir.addressof @str67 : !llvm.ptr
    %731 = arith.constant 38 : i64
    %732 = func.call @cc_make_string(%730, %731) : (!llvm.ptr, i64) -> i64
    %733 = func.call @cc_nil_value() : () -> i64
    %734 = func.call @cc_intern(%732, %733) : (i64, i64) -> i64
    %735 = func.call @cc_nil_value() : () -> i64
    %736 = func.call @cc_cons(%734, %735) : (i64, i64) -> i64
    %737 = func.call @cc_values_pack(%736) : (i64) -> i64
    %738 = func.call @cc_set_symbol_value(%734, %729) : (i64, i64) -> i64
    %739 = llvm.mlir.addressof @str68 : !llvm.ptr
    %740 = arith.constant 39 : i64
    %741 = func.call @cc_make_string(%739, %740) : (!llvm.ptr, i64) -> i64
    %742 = func.call @cc_nil_value() : () -> i64
    %743 = func.call @cc_intern(%741, %742) : (i64, i64) -> i64
    %744 = func.call @cc_nil_value() : () -> i64
    %745 = func.call @cc_cons(%743, %744) : (i64, i64) -> i64
    %746 = func.call @cc_values_pack(%745) : (i64) -> i64
    %747 = func.call @cc_set_symbol_value(%743, %729) : (i64, i64) -> i64
    %748 = llvm.mlir.addressof @str69 : !llvm.ptr
    %749 = arith.constant 40 : i64
    %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
    %751 = func.call @cc_nil_value() : () -> i64
    %752 = func.call @cc_intern(%750, %751) : (i64, i64) -> i64
    %753 = func.call @cc_nil_value() : () -> i64
    %754 = func.call @cc_cons(%752, %753) : (i64, i64) -> i64
    %755 = func.call @cc_values_pack(%754) : (i64) -> i64
    %756 = func.call @cc_set_symbol_value(%752, %729) : (i64, i64) -> i64
    %757 = func.call @cc_nil_value() : () -> i64
    %758 = func.call @cc_nil_value() : () -> i64
    %759 = func.call @cc_errorp(%757) : (i64) -> i64
    %760 = arith.cmpi ne, %759, %758 : i64
    %761 = scf.if %760 -> (i64) {
      scf.yield %757 : i64
    } else {
      %762 = llvm.mlir.addressof @str70 : !llvm.ptr
      %763 = arith.constant 6 : i64
      %764 = func.call @cc_make_string(%762, %763) : (!llvm.ptr, i64) -> i64
      %765 = func.call @cc_nil_value() : () -> i64
      %766 = func.call @cc_intern(%764, %765) : (i64, i64) -> i64
      %767 = func.call @cc_nil_value() : () -> i64
      %768 = func.call @cc_cons(%766, %767) : (i64, i64) -> i64
      %769 = func.call @cc_values_pack(%768) : (i64) -> i64
      %__rlasp_stack_elide_zero_12 = arith.constant 0 : i64
      %770 = arith.addi %766, %__rlasp_stack_elide_zero_12 : i64
      %771 = llvm.mlir.addressof @str71 : !llvm.ptr
      %772 = arith.constant 6 : i64
      %773 = func.call @cc_make_string(%771, %772) : (!llvm.ptr, i64) -> i64
      %774 = func.call @cc_nil_value() : () -> i64
      %775 = func.call @cc_intern(%773, %774) : (i64, i64) -> i64
      %776 = func.call @cc_nil_value() : () -> i64
      %777 = func.call @cc_cons(%775, %776) : (i64, i64) -> i64
      %778 = func.call @cc_values_pack(%777) : (i64) -> i64
      func.call @stack_push_pointer(%775) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %779 = func.call @stack_pop_pointer() : () -> i64
      %780 = func.call @stack_pop_pointer() : () -> i64
      %781 = func.call @cc_cons(%780, %779) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_13 = arith.constant 0 : i64
      %782 = arith.addi %781, %__rlasp_stack_elide_zero_13 : i64
      %794 = arith.constant 175130764378124 : i64
      %795 = arith.constant 0 : i64
      %796 = func.call @cc_make_closure(%794, %795) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_14 = arith.constant 0 : i64
      %797 = arith.addi %796, %__rlasp_stack_elide_zero_14 : i64
      %798 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%798) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %799 = func.call @stack_pop_pointer() : () -> i64
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = func.call @cc_cons(%800, %799) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_15 = arith.constant 0 : i64
      %802 = arith.addi %801, %__rlasp_stack_elide_zero_15 : i64
      %803 = llvm.mlir.addressof @str73 : !llvm.ptr
      %804 = arith.constant 11 : i64
      %805 = func.call @cc_make_string(%803, %804) : (!llvm.ptr, i64) -> i64
      %806 = llvm.mlir.addressof @str74 : !llvm.ptr
      %807 = arith.constant 7 : i64
      %808 = func.call @cc_make_string(%806, %807) : (!llvm.ptr, i64) -> i64
      %809 = func.call @cc_intern(%805, %808) : (i64, i64) -> i64
      %810 = func.call @cc_nil_value() : () -> i64
      %811 = func.call @cc_cons(%809, %810) : (i64, i64) -> i64
      %812 = func.call @cc_values_pack(%811) : (i64) -> i64
      %813 = func.call @cc_nil_value() : () -> i64
      %814 = llvm.mlir.addressof @str75 : !llvm.ptr
      %815 = arith.constant 4 : i64
      %816 = func.call @cc_make_string(%814, %815) : (!llvm.ptr, i64) -> i64
      %817 = llvm.mlir.addressof @str76 : !llvm.ptr
      %818 = arith.constant 7 : i64
      %819 = func.call @cc_make_string(%817, %818) : (!llvm.ptr, i64) -> i64
      %820 = func.call @cc_intern(%816, %819) : (i64, i64) -> i64
      %821 = func.call @cc_nil_value() : () -> i64
      %822 = func.call @cc_cons(%820, %821) : (i64, i64) -> i64
      %823 = func.call @cc_values_pack(%822) : (i64) -> i64
      %824 = llvm.mlir.addressof @str77 : !llvm.ptr
      %825 = arith.constant 6 : i64
      %826 = func.call @cc_make_string(%824, %825) : (!llvm.ptr, i64) -> i64
      %827 = func.call @cc_nil_value() : () -> i64
      %828 = func.call @cc_intern(%826, %827) : (i64, i64) -> i64
      %829 = func.call @cc_nil_value() : () -> i64
      %830 = func.call @cc_cons(%828, %829) : (i64, i64) -> i64
      %831 = func.call @cc_values_pack(%830) : (i64) -> i64
      %__rlasp_stack_elide_zero_16 = arith.constant 0 : i64
      %832 = arith.addi %828, %__rlasp_stack_elide_zero_16 : i64
      %833 = func.call @cc_nil_value() : () -> i64
      %834 = func.call @cc_errorp(%770) : (i64) -> i64
      %835 = arith.cmpi ne, %834, %833 : i64
      %836 = arith.cmpi eq, %833, %833 : i64
      %837 = arith.andi %835, %836 : i1
      %838 = scf.if %837 -> (i64) {
        scf.yield %770 : i64
      } else {
        scf.yield %833 : i64
      }
      %839 = func.call @cc_errorp(%782) : (i64) -> i64
      %840 = arith.cmpi ne, %839, %833 : i64
      %841 = arith.cmpi eq, %838, %833 : i64
      %842 = arith.andi %840, %841 : i1
      %843 = scf.if %842 -> (i64) {
        scf.yield %782 : i64
      } else {
        scf.yield %838 : i64
      }
      %844 = func.call @cc_errorp(%797) : (i64) -> i64
      %845 = arith.cmpi ne, %844, %833 : i64
      %846 = arith.cmpi eq, %843, %833 : i64
      %847 = arith.andi %845, %846 : i1
      %848 = scf.if %847 -> (i64) {
        scf.yield %797 : i64
      } else {
        scf.yield %843 : i64
      }
      %849 = func.call @cc_errorp(%802) : (i64) -> i64
      %850 = arith.cmpi ne, %849, %833 : i64
      %851 = arith.cmpi eq, %848, %833 : i64
      %852 = arith.andi %850, %851 : i1
      %853 = scf.if %852 -> (i64) {
        scf.yield %802 : i64
      } else {
        scf.yield %848 : i64
      }
      %854 = func.call @cc_errorp(%809) : (i64) -> i64
      %855 = arith.cmpi ne, %854, %833 : i64
      %856 = arith.cmpi eq, %853, %833 : i64
      %857 = arith.andi %855, %856 : i1
      %858 = scf.if %857 -> (i64) {
        scf.yield %809 : i64
      } else {
        scf.yield %853 : i64
      }
      %859 = func.call @cc_errorp(%813) : (i64) -> i64
      %860 = arith.cmpi ne, %859, %833 : i64
      %861 = arith.cmpi eq, %858, %833 : i64
      %862 = arith.andi %860, %861 : i1
      %863 = scf.if %862 -> (i64) {
        scf.yield %813 : i64
      } else {
        scf.yield %858 : i64
      }
      %864 = func.call @cc_errorp(%820) : (i64) -> i64
      %865 = arith.cmpi ne, %864, %833 : i64
      %866 = arith.cmpi eq, %863, %833 : i64
      %867 = arith.andi %865, %866 : i1
      %868 = scf.if %867 -> (i64) {
        scf.yield %820 : i64
      } else {
        scf.yield %863 : i64
      }
      %869 = func.call @cc_errorp(%832) : (i64) -> i64
      %870 = arith.cmpi ne, %869, %833 : i64
      %871 = arith.cmpi eq, %868, %833 : i64
      %872 = arith.andi %870, %871 : i1
      %873 = scf.if %872 -> (i64) {
        scf.yield %832 : i64
      } else {
        scf.yield %868 : i64
      }
      %874 = arith.cmpi ne, %873, %833 : i64
      scf.if %874 {
        func.call @stack_push_pointer(%873) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%770) : (i64) -> ()
        func.call @stack_push_pointer(%782) : (i64) -> ()
        func.call @stack_push_pointer(%797) : (i64) -> ()
        func.call @stack_push_pointer(%802) : (i64) -> ()
        func.call @stack_push_pointer(%809) : (i64) -> ()
        func.call @stack_push_pointer(%813) : (i64) -> ()
        func.call @stack_push_pointer(%820) : (i64) -> ()
        func.call @stack_push_pointer(%832) : (i64) -> ()
        %875 = llvm.mlir.addressof @str78 : !llvm.ptr
        %876 = func.call @cc_make_function_ref_const(%875) : (!llvm.ptr) -> i64
        %877 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%876, %877) : (i64, i64) -> ()
      }
      %878 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %878 : i64
    }
    %879 = func.call @cc_nil_value() : () -> i64
    %880 = func.call @cc_errorp(%761) : (i64) -> i64
    %881 = arith.cmpi ne, %880, %879 : i64
    %882 = scf.if %881 -> (i64) {
      scf.yield %761 : i64
    } else {
      %883 = llvm.mlir.addressof @str79 : !llvm.ptr
      %884 = arith.constant 6 : i64
      %885 = func.call @cc_make_string(%883, %884) : (!llvm.ptr, i64) -> i64
      %886 = func.call @cc_nil_value() : () -> i64
      %887 = func.call @cc_intern(%885, %886) : (i64, i64) -> i64
      %888 = func.call @cc_nil_value() : () -> i64
      %889 = func.call @cc_cons(%887, %888) : (i64, i64) -> i64
      %890 = func.call @cc_values_pack(%889) : (i64) -> i64
      %__rlasp_stack_elide_zero_17 = arith.constant 0 : i64
      %891 = arith.addi %887, %__rlasp_stack_elide_zero_17 : i64
      %892 = llvm.mlir.addressof @str80 : !llvm.ptr
      %893 = arith.constant 6 : i64
      %894 = func.call @cc_make_string(%892, %893) : (!llvm.ptr, i64) -> i64
      %895 = func.call @cc_nil_value() : () -> i64
      %896 = func.call @cc_intern(%894, %895) : (i64, i64) -> i64
      %897 = func.call @cc_nil_value() : () -> i64
      %898 = func.call @cc_cons(%896, %897) : (i64, i64) -> i64
      %899 = func.call @cc_values_pack(%898) : (i64) -> i64
      func.call @stack_push_pointer(%896) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %900 = func.call @stack_pop_pointer() : () -> i64
      %901 = func.call @stack_pop_pointer() : () -> i64
      %902 = func.call @cc_cons(%901, %900) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_18 = arith.constant 0 : i64
      %903 = arith.addi %902, %__rlasp_stack_elide_zero_18 : i64
      %915 = arith.constant 175130764378125 : i64
      %916 = arith.constant 0 : i64
      %917 = func.call @cc_make_closure(%915, %916) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_19 = arith.constant 0 : i64
      %918 = arith.addi %917, %__rlasp_stack_elide_zero_19 : i64
      %919 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%919) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %920 = func.call @stack_pop_pointer() : () -> i64
      %921 = func.call @stack_pop_pointer() : () -> i64
      %922 = func.call @cc_cons(%921, %920) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_20 = arith.constant 0 : i64
      %923 = arith.addi %922, %__rlasp_stack_elide_zero_20 : i64
      %924 = llvm.mlir.addressof @str82 : !llvm.ptr
      %925 = arith.constant 11 : i64
      %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
      %927 = llvm.mlir.addressof @str83 : !llvm.ptr
      %928 = arith.constant 7 : i64
      %929 = func.call @cc_make_string(%927, %928) : (!llvm.ptr, i64) -> i64
      %930 = func.call @cc_intern(%926, %929) : (i64, i64) -> i64
      %931 = func.call @cc_nil_value() : () -> i64
      %932 = func.call @cc_cons(%930, %931) : (i64, i64) -> i64
      %933 = func.call @cc_values_pack(%932) : (i64) -> i64
      %934 = func.call @cc_nil_value() : () -> i64
      %935 = llvm.mlir.addressof @str84 : !llvm.ptr
      %936 = arith.constant 4 : i64
      %937 = func.call @cc_make_string(%935, %936) : (!llvm.ptr, i64) -> i64
      %938 = llvm.mlir.addressof @str85 : !llvm.ptr
      %939 = arith.constant 7 : i64
      %940 = func.call @cc_make_string(%938, %939) : (!llvm.ptr, i64) -> i64
      %941 = func.call @cc_intern(%937, %940) : (i64, i64) -> i64
      %942 = func.call @cc_nil_value() : () -> i64
      %943 = func.call @cc_cons(%941, %942) : (i64, i64) -> i64
      %944 = func.call @cc_values_pack(%943) : (i64) -> i64
      %945 = llvm.mlir.addressof @str86 : !llvm.ptr
      %946 = arith.constant 6 : i64
      %947 = func.call @cc_make_string(%945, %946) : (!llvm.ptr, i64) -> i64
      %948 = func.call @cc_nil_value() : () -> i64
      %949 = func.call @cc_intern(%947, %948) : (i64, i64) -> i64
      %950 = func.call @cc_nil_value() : () -> i64
      %951 = func.call @cc_cons(%949, %950) : (i64, i64) -> i64
      %952 = func.call @cc_values_pack(%951) : (i64) -> i64
      %__rlasp_stack_elide_zero_21 = arith.constant 0 : i64
      %953 = arith.addi %949, %__rlasp_stack_elide_zero_21 : i64
      %954 = func.call @cc_nil_value() : () -> i64
      %955 = func.call @cc_errorp(%891) : (i64) -> i64
      %956 = arith.cmpi ne, %955, %954 : i64
      %957 = arith.cmpi eq, %954, %954 : i64
      %958 = arith.andi %956, %957 : i1
      %959 = scf.if %958 -> (i64) {
        scf.yield %891 : i64
      } else {
        scf.yield %954 : i64
      }
      %960 = func.call @cc_errorp(%903) : (i64) -> i64
      %961 = arith.cmpi ne, %960, %954 : i64
      %962 = arith.cmpi eq, %959, %954 : i64
      %963 = arith.andi %961, %962 : i1
      %964 = scf.if %963 -> (i64) {
        scf.yield %903 : i64
      } else {
        scf.yield %959 : i64
      }
      %965 = func.call @cc_errorp(%918) : (i64) -> i64
      %966 = arith.cmpi ne, %965, %954 : i64
      %967 = arith.cmpi eq, %964, %954 : i64
      %968 = arith.andi %966, %967 : i1
      %969 = scf.if %968 -> (i64) {
        scf.yield %918 : i64
      } else {
        scf.yield %964 : i64
      }
      %970 = func.call @cc_errorp(%923) : (i64) -> i64
      %971 = arith.cmpi ne, %970, %954 : i64
      %972 = arith.cmpi eq, %969, %954 : i64
      %973 = arith.andi %971, %972 : i1
      %974 = scf.if %973 -> (i64) {
        scf.yield %923 : i64
      } else {
        scf.yield %969 : i64
      }
      %975 = func.call @cc_errorp(%930) : (i64) -> i64
      %976 = arith.cmpi ne, %975, %954 : i64
      %977 = arith.cmpi eq, %974, %954 : i64
      %978 = arith.andi %976, %977 : i1
      %979 = scf.if %978 -> (i64) {
        scf.yield %930 : i64
      } else {
        scf.yield %974 : i64
      }
      %980 = func.call @cc_errorp(%934) : (i64) -> i64
      %981 = arith.cmpi ne, %980, %954 : i64
      %982 = arith.cmpi eq, %979, %954 : i64
      %983 = arith.andi %981, %982 : i1
      %984 = scf.if %983 -> (i64) {
        scf.yield %934 : i64
      } else {
        scf.yield %979 : i64
      }
      %985 = func.call @cc_errorp(%941) : (i64) -> i64
      %986 = arith.cmpi ne, %985, %954 : i64
      %987 = arith.cmpi eq, %984, %954 : i64
      %988 = arith.andi %986, %987 : i1
      %989 = scf.if %988 -> (i64) {
        scf.yield %941 : i64
      } else {
        scf.yield %984 : i64
      }
      %990 = func.call @cc_errorp(%953) : (i64) -> i64
      %991 = arith.cmpi ne, %990, %954 : i64
      %992 = arith.cmpi eq, %989, %954 : i64
      %993 = arith.andi %991, %992 : i1
      %994 = scf.if %993 -> (i64) {
        scf.yield %953 : i64
      } else {
        scf.yield %989 : i64
      }
      %995 = arith.cmpi ne, %994, %954 : i64
      scf.if %995 {
        func.call @stack_push_pointer(%994) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%891) : (i64) -> ()
        func.call @stack_push_pointer(%903) : (i64) -> ()
        func.call @stack_push_pointer(%918) : (i64) -> ()
        func.call @stack_push_pointer(%923) : (i64) -> ()
        func.call @stack_push_pointer(%930) : (i64) -> ()
        func.call @stack_push_pointer(%934) : (i64) -> ()
        func.call @stack_push_pointer(%941) : (i64) -> ()
        func.call @stack_push_pointer(%953) : (i64) -> ()
        %996 = llvm.mlir.addressof @str87 : !llvm.ptr
        %997 = func.call @cc_make_function_ref_const(%996) : (!llvm.ptr) -> i64
        %998 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%997, %998) : (i64, i64) -> ()
      }
      %999 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %999 : i64
    }
    %1000 = func.call @cc_nil_value() : () -> i64
    %1001 = func.call @cc_errorp(%882) : (i64) -> i64
    %1002 = arith.cmpi ne, %1001, %1000 : i64
    %1003 = scf.if %1002 -> (i64) {
      scf.yield %882 : i64
    } else {
      %1004 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1005 = arith.constant 5 : i64
      %1006 = func.call @cc_make_string(%1004, %1005) : (!llvm.ptr, i64) -> i64
      %1007 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1008 = arith.constant 11 : i64
      %1009 = func.call @cc_make_string(%1007, %1008) : (!llvm.ptr, i64) -> i64
      %1010 = func.call @cc_intern(%1006, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_nil_value() : () -> i64
      %1012 = func.call @cc_cons(%1010, %1011) : (i64, i64) -> i64
      %1013 = func.call @cc_values_pack(%1012) : (i64) -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      %1014 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1015 = arith.constant 6 : i64
      %1016 = func.call @cc_make_string(%1014, %1015) : (!llvm.ptr, i64) -> i64
      %1017 = func.call @cc_nil_value() : () -> i64
      %1018 = func.call @cc_intern(%1016, %1017) : (i64, i64) -> i64
      %1019 = func.call @cc_nil_value() : () -> i64
      %1020 = func.call @cc_cons(%1018, %1019) : (i64, i64) -> i64
      %1021 = func.call @cc_values_pack(%1020) : (i64) -> i64
      func.call @stack_push_pointer(%1018) : (i64) -> ()
      %1022 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1023 = arith.constant 1 : i64
      %1024 = func.call @cc_make_string(%1022, %1023) : (!llvm.ptr, i64) -> i64
      %1025 = func.call @cc_nil_value() : () -> i64
      %1026 = func.call @cc_intern(%1024, %1025) : (i64, i64) -> i64
      %1027 = func.call @cc_nil_value() : () -> i64
      %1028 = func.call @cc_cons(%1026, %1027) : (i64, i64) -> i64
      %1029 = func.call @cc_values_pack(%1028) : (i64) -> i64
      func.call @stack_push_pointer(%1026) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1030 = func.call @stack_pop_pointer() : () -> i64
      %1031 = func.call @stack_pop_pointer() : () -> i64
      %1032 = func.call @cc_cons(%1031, %1030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1032) : (i64) -> ()
      %1033 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1034 = arith.constant 5 : i64
      %1035 = func.call @cc_make_string(%1033, %1034) : (!llvm.ptr, i64) -> i64
      %1036 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1037 = arith.constant 11 : i64
      %1038 = func.call @cc_make_string(%1036, %1037) : (!llvm.ptr, i64) -> i64
      %1039 = func.call @cc_intern(%1035, %1038) : (i64, i64) -> i64
      %1040 = func.call @cc_nil_value() : () -> i64
      %1041 = func.call @cc_cons(%1039, %1040) : (i64, i64) -> i64
      %1042 = func.call @cc_values_pack(%1041) : (i64) -> i64
      func.call @stack_push_pointer(%1039) : (i64) -> ()
      %1043 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1044 = arith.constant 1 : i64
      %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
      %1046 = func.call @cc_nil_value() : () -> i64
      %1047 = func.call @cc_intern(%1045, %1046) : (i64, i64) -> i64
      %1048 = func.call @cc_nil_value() : () -> i64
      %1049 = func.call @cc_cons(%1047, %1048) : (i64, i64) -> i64
      %1050 = func.call @cc_values_pack(%1049) : (i64) -> i64
      func.call @stack_push_pointer(%1047) : (i64) -> ()
      %1051 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1052 = arith.constant 7 : i64
      %1053 = func.call @cc_make_string(%1051, %1052) : (!llvm.ptr, i64) -> i64
      %1054 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1055 = arith.constant 11 : i64
      %1056 = func.call @cc_make_string(%1054, %1055) : (!llvm.ptr, i64) -> i64
      %1057 = func.call @cc_intern(%1053, %1056) : (i64, i64) -> i64
      %1058 = func.call @cc_nil_value() : () -> i64
      %1059 = func.call @cc_cons(%1057, %1058) : (i64, i64) -> i64
      %1060 = func.call @cc_values_pack(%1059) : (i64) -> i64
      func.call @stack_push_pointer(%1057) : (i64) -> ()
      %1061 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1062 = arith.constant 6 : i64
      %1063 = func.call @cc_make_string(%1061, %1062) : (!llvm.ptr, i64) -> i64
      %1064 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1065 = arith.constant 11 : i64
      %1066 = func.call @cc_make_string(%1064, %1065) : (!llvm.ptr, i64) -> i64
      %1067 = func.call @cc_intern(%1063, %1066) : (i64, i64) -> i64
      %1068 = func.call @cc_nil_value() : () -> i64
      %1069 = func.call @cc_cons(%1067, %1068) : (i64, i64) -> i64
      %1070 = func.call @cc_values_pack(%1069) : (i64) -> i64
      func.call @stack_push_pointer(%1067) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1071 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1072 = arith.constant 5 : i64
      %1073 = func.call @cc_make_string(%1071, %1072) : (!llvm.ptr, i64) -> i64
      %1074 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1075 = arith.constant 11 : i64
      %1076 = func.call @cc_make_string(%1074, %1075) : (!llvm.ptr, i64) -> i64
      %1077 = func.call @cc_intern(%1073, %1076) : (i64, i64) -> i64
      %1078 = func.call @cc_nil_value() : () -> i64
      %1079 = func.call @cc_cons(%1077, %1078) : (i64, i64) -> i64
      %1080 = func.call @cc_values_pack(%1079) : (i64) -> i64
      func.call @stack_push_pointer(%1077) : (i64) -> ()
      %1081 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1082 = arith.constant 1 : i64
      %1083 = func.call @cc_make_string(%1081, %1082) : (!llvm.ptr, i64) -> i64
      %1084 = func.call @cc_nil_value() : () -> i64
      %1085 = func.call @cc_intern(%1083, %1084) : (i64, i64) -> i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = func.call @cc_cons(%1085, %1086) : (i64, i64) -> i64
      %1088 = func.call @cc_values_pack(%1087) : (i64) -> i64
      func.call @stack_push_pointer(%1085) : (i64) -> ()
      %1089 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1090 = arith.constant 4 : i64
      %1091 = func.call @cc_make_string(%1089, %1090) : (!llvm.ptr, i64) -> i64
      %1092 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1093 = arith.constant 11 : i64
      %1094 = func.call @cc_make_string(%1092, %1093) : (!llvm.ptr, i64) -> i64
      %1095 = func.call @cc_intern(%1091, %1094) : (i64, i64) -> i64
      %1096 = func.call @cc_nil_value() : () -> i64
      %1097 = func.call @cc_cons(%1095, %1096) : (i64, i64) -> i64
      %1098 = func.call @cc_values_pack(%1097) : (i64) -> i64
      func.call @stack_push_pointer(%1095) : (i64) -> ()
      %1099 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1100 = arith.constant 2 : i64
      %1101 = func.call @cc_make_string(%1099, %1100) : (!llvm.ptr, i64) -> i64
      %1102 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1103 = arith.constant 11 : i64
      %1104 = func.call @cc_make_string(%1102, %1103) : (!llvm.ptr, i64) -> i64
      %1105 = func.call @cc_intern(%1101, %1104) : (i64, i64) -> i64
      %1106 = func.call @cc_nil_value() : () -> i64
      %1107 = func.call @cc_cons(%1105, %1106) : (i64, i64) -> i64
      %1108 = func.call @cc_values_pack(%1107) : (i64) -> i64
      func.call @stack_push_pointer(%1105) : (i64) -> ()
      %1109 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1110 = arith.constant 1 : i64
      %1111 = func.call @cc_make_string(%1109, %1110) : (!llvm.ptr, i64) -> i64
      %1112 = func.call @cc_nil_value() : () -> i64
      %1113 = func.call @cc_intern(%1111, %1112) : (i64, i64) -> i64
      %1114 = func.call @cc_nil_value() : () -> i64
      %1115 = func.call @cc_cons(%1113, %1114) : (i64, i64) -> i64
      %1116 = func.call @cc_values_pack(%1115) : (i64) -> i64
      func.call @stack_push_pointer(%1113) : (i64) -> ()
      %1117 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1118 = arith.constant 5 : i64
      %1119 = func.call @cc_make_string(%1117, %1118) : (!llvm.ptr, i64) -> i64
      %1120 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1121 = arith.constant 11 : i64
      %1122 = func.call @cc_make_string(%1120, %1121) : (!llvm.ptr, i64) -> i64
      %1123 = func.call @cc_intern(%1119, %1122) : (i64, i64) -> i64
      %1124 = func.call @cc_nil_value() : () -> i64
      %1125 = func.call @cc_cons(%1123, %1124) : (i64, i64) -> i64
      %1126 = func.call @cc_values_pack(%1125) : (i64) -> i64
      func.call @stack_push_pointer(%1123) : (i64) -> ()
      %1127 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1128 = arith.constant 1 : i64
      %1129 = func.call @cc_make_string(%1127, %1128) : (!llvm.ptr, i64) -> i64
      %1130 = func.call @cc_nil_value() : () -> i64
      %1131 = func.call @cc_intern(%1129, %1130) : (i64, i64) -> i64
      %1132 = func.call @cc_nil_value() : () -> i64
      %1133 = func.call @cc_cons(%1131, %1132) : (i64, i64) -> i64
      %1134 = func.call @cc_values_pack(%1133) : (i64) -> i64
      func.call @stack_push_pointer(%1131) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1135 = func.call @stack_pop_pointer() : () -> i64
      %1136 = func.call @stack_pop_pointer() : () -> i64
      %1137 = func.call @cc_cons(%1136, %1135) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_22 = arith.constant 0 : i64
      %1138 = arith.addi %1137, %__rlasp_stack_elide_zero_22 : i64
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @cc_cons(%1139, %1138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1140) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1141 = func.call @stack_pop_pointer() : () -> i64
      %1142 = func.call @stack_pop_pointer() : () -> i64
      %1143 = func.call @cc_cons(%1142, %1141) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_23 = arith.constant 0 : i64
      %1144 = arith.addi %1143, %__rlasp_stack_elide_zero_23 : i64
      %1145 = func.call @stack_pop_pointer() : () -> i64
      %1146 = func.call @cc_cons(%1145, %1144) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_24 = arith.constant 0 : i64
      %1147 = arith.addi %1146, %__rlasp_stack_elide_zero_24 : i64
      %1148 = func.call @stack_pop_pointer() : () -> i64
      %1149 = func.call @cc_cons(%1148, %1147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1149) : (i64) -> ()
      %1150 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1151 = arith.constant 11 : i64
      %1152 = func.call @cc_make_string(%1150, %1151) : (!llvm.ptr, i64) -> i64
      %1153 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1154 = arith.constant 11 : i64
      %1155 = func.call @cc_make_string(%1153, %1154) : (!llvm.ptr, i64) -> i64
      %1156 = func.call @cc_intern(%1152, %1155) : (i64, i64) -> i64
      %1157 = func.call @cc_nil_value() : () -> i64
      %1158 = func.call @cc_cons(%1156, %1157) : (i64, i64) -> i64
      %1159 = func.call @cc_values_pack(%1158) : (i64) -> i64
      func.call @stack_push_pointer(%1156) : (i64) -> ()
      %1160 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1161 = arith.constant 1 : i64
      %1162 = func.call @cc_make_string(%1160, %1161) : (!llvm.ptr, i64) -> i64
      %1163 = func.call @cc_nil_value() : () -> i64
      %1164 = func.call @cc_intern(%1162, %1163) : (i64, i64) -> i64
      %1165 = func.call @cc_nil_value() : () -> i64
      %1166 = func.call @cc_cons(%1164, %1165) : (i64, i64) -> i64
      %1167 = func.call @cc_values_pack(%1166) : (i64) -> i64
      func.call @stack_push_pointer(%1164) : (i64) -> ()
      %1168 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1169 = arith.constant 1 : i64
      %1170 = func.call @cc_make_string(%1168, %1169) : (!llvm.ptr, i64) -> i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_intern(%1170, %1171) : (i64, i64) -> i64
      %1173 = func.call @cc_nil_value() : () -> i64
      %1174 = func.call @cc_cons(%1172, %1173) : (i64, i64) -> i64
      %1175 = func.call @cc_values_pack(%1174) : (i64) -> i64
      func.call @stack_push_pointer(%1172) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1176 = func.call @stack_pop_pointer() : () -> i64
      %1177 = func.call @stack_pop_pointer() : () -> i64
      %1178 = func.call @cc_cons(%1177, %1176) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_25 = arith.constant 0 : i64
      %1179 = arith.addi %1178, %__rlasp_stack_elide_zero_25 : i64
      %1180 = func.call @stack_pop_pointer() : () -> i64
      %1181 = func.call @cc_cons(%1180, %1179) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_26 = arith.constant 0 : i64
      %1182 = arith.addi %1181, %__rlasp_stack_elide_zero_26 : i64
      %1183 = func.call @stack_pop_pointer() : () -> i64
      %1184 = func.call @cc_cons(%1183, %1182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1184) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1185 = func.call @stack_pop_pointer() : () -> i64
      %1186 = func.call @stack_pop_pointer() : () -> i64
      %1187 = func.call @cc_cons(%1186, %1185) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_27 = arith.constant 0 : i64
      %1188 = arith.addi %1187, %__rlasp_stack_elide_zero_27 : i64
      %1189 = func.call @stack_pop_pointer() : () -> i64
      %1190 = func.call @cc_cons(%1189, %1188) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_28 = arith.constant 0 : i64
      %1191 = arith.addi %1190, %__rlasp_stack_elide_zero_28 : i64
      %1192 = func.call @stack_pop_pointer() : () -> i64
      %1193 = func.call @cc_cons(%1192, %1191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1193) : (i64) -> ()
      %1194 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1195 = arith.constant 7 : i64
      %1196 = func.call @cc_make_string(%1194, %1195) : (!llvm.ptr, i64) -> i64
      %1197 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1198 = arith.constant 11 : i64
      %1199 = func.call @cc_make_string(%1197, %1198) : (!llvm.ptr, i64) -> i64
      %1200 = func.call @cc_intern(%1196, %1199) : (i64, i64) -> i64
      %1201 = func.call @cc_nil_value() : () -> i64
      %1202 = func.call @cc_cons(%1200, %1201) : (i64, i64) -> i64
      %1203 = func.call @cc_values_pack(%1202) : (i64) -> i64
      func.call @stack_push_pointer(%1200) : (i64) -> ()
      %1204 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1205 = arith.constant 6 : i64
      %1206 = func.call @cc_make_string(%1204, %1205) : (!llvm.ptr, i64) -> i64
      %1207 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1208 = arith.constant 11 : i64
      %1209 = func.call @cc_make_string(%1207, %1208) : (!llvm.ptr, i64) -> i64
      %1210 = func.call @cc_intern(%1206, %1209) : (i64, i64) -> i64
      %1211 = func.call @cc_nil_value() : () -> i64
      %1212 = func.call @cc_cons(%1210, %1211) : (i64, i64) -> i64
      %1213 = func.call @cc_values_pack(%1212) : (i64) -> i64
      func.call @stack_push_pointer(%1210) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1214 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1215 = arith.constant 4 : i64
      %1216 = func.call @cc_make_string(%1214, %1215) : (!llvm.ptr, i64) -> i64
      %1217 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1218 = arith.constant 11 : i64
      %1219 = func.call @cc_make_string(%1217, %1218) : (!llvm.ptr, i64) -> i64
      %1220 = func.call @cc_intern(%1216, %1219) : (i64, i64) -> i64
      %1221 = func.call @cc_nil_value() : () -> i64
      %1222 = func.call @cc_cons(%1220, %1221) : (i64, i64) -> i64
      %1223 = func.call @cc_values_pack(%1222) : (i64) -> i64
      func.call @stack_push_pointer(%1220) : (i64) -> ()
      %1224 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1225 = arith.constant 2 : i64
      %1226 = func.call @cc_make_string(%1224, %1225) : (!llvm.ptr, i64) -> i64
      %1227 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1228 = arith.constant 11 : i64
      %1229 = func.call @cc_make_string(%1227, %1228) : (!llvm.ptr, i64) -> i64
      %1230 = func.call @cc_intern(%1226, %1229) : (i64, i64) -> i64
      %1231 = func.call @cc_nil_value() : () -> i64
      %1232 = func.call @cc_cons(%1230, %1231) : (i64, i64) -> i64
      %1233 = func.call @cc_values_pack(%1232) : (i64) -> i64
      func.call @stack_push_pointer(%1230) : (i64) -> ()
      %1234 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1235 = arith.constant 1 : i64
      %1236 = func.call @cc_make_string(%1234, %1235) : (!llvm.ptr, i64) -> i64
      %1237 = func.call @cc_nil_value() : () -> i64
      %1238 = func.call @cc_intern(%1236, %1237) : (i64, i64) -> i64
      %1239 = func.call @cc_nil_value() : () -> i64
      %1240 = func.call @cc_cons(%1238, %1239) : (i64, i64) -> i64
      %1241 = func.call @cc_values_pack(%1240) : (i64) -> i64
      func.call @stack_push_pointer(%1238) : (i64) -> ()
      %1242 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1243 = arith.constant 5 : i64
      %1244 = func.call @cc_make_string(%1242, %1243) : (!llvm.ptr, i64) -> i64
      %1245 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1246 = arith.constant 11 : i64
      %1247 = func.call @cc_make_string(%1245, %1246) : (!llvm.ptr, i64) -> i64
      %1248 = func.call @cc_intern(%1244, %1247) : (i64, i64) -> i64
      %1249 = func.call @cc_nil_value() : () -> i64
      %1250 = func.call @cc_cons(%1248, %1249) : (i64, i64) -> i64
      %1251 = func.call @cc_values_pack(%1250) : (i64) -> i64
      func.call @stack_push_pointer(%1248) : (i64) -> ()
      %1252 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1253 = arith.constant 1 : i64
      %1254 = func.call @cc_make_string(%1252, %1253) : (!llvm.ptr, i64) -> i64
      %1255 = func.call @cc_nil_value() : () -> i64
      %1256 = func.call @cc_intern(%1254, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_nil_value() : () -> i64
      %1258 = func.call @cc_cons(%1256, %1257) : (i64, i64) -> i64
      %1259 = func.call @cc_values_pack(%1258) : (i64) -> i64
      func.call @stack_push_pointer(%1256) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1260 = func.call @stack_pop_pointer() : () -> i64
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = func.call @cc_cons(%1261, %1260) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_29 = arith.constant 0 : i64
      %1263 = arith.addi %1262, %__rlasp_stack_elide_zero_29 : i64
      %1264 = func.call @stack_pop_pointer() : () -> i64
      %1265 = func.call @cc_cons(%1264, %1263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1265) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1266 = func.call @stack_pop_pointer() : () -> i64
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @cc_cons(%1267, %1266) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_30 = arith.constant 0 : i64
      %1269 = arith.addi %1268, %__rlasp_stack_elide_zero_30 : i64
      %1270 = func.call @stack_pop_pointer() : () -> i64
      %1271 = func.call @cc_cons(%1270, %1269) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_31 = arith.constant 0 : i64
      %1272 = arith.addi %1271, %__rlasp_stack_elide_zero_31 : i64
      %1273 = func.call @stack_pop_pointer() : () -> i64
      %1274 = func.call @cc_cons(%1273, %1272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1274) : (i64) -> ()
      %1275 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1276 = arith.constant 11 : i64
      %1277 = func.call @cc_make_string(%1275, %1276) : (!llvm.ptr, i64) -> i64
      %1278 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1279 = arith.constant 11 : i64
      %1280 = func.call @cc_make_string(%1278, %1279) : (!llvm.ptr, i64) -> i64
      %1281 = func.call @cc_intern(%1277, %1280) : (i64, i64) -> i64
      %1282 = func.call @cc_nil_value() : () -> i64
      %1283 = func.call @cc_cons(%1281, %1282) : (i64, i64) -> i64
      %1284 = func.call @cc_values_pack(%1283) : (i64) -> i64
      func.call @stack_push_pointer(%1281) : (i64) -> ()
      %1285 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1286 = arith.constant 1 : i64
      %1287 = func.call @cc_make_string(%1285, %1286) : (!llvm.ptr, i64) -> i64
      %1288 = func.call @cc_nil_value() : () -> i64
      %1289 = func.call @cc_intern(%1287, %1288) : (i64, i64) -> i64
      %1290 = func.call @cc_nil_value() : () -> i64
      %1291 = func.call @cc_cons(%1289, %1290) : (i64, i64) -> i64
      %1292 = func.call @cc_values_pack(%1291) : (i64) -> i64
      func.call @stack_push_pointer(%1289) : (i64) -> ()
      %1293 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1294 = arith.constant 1 : i64
      %1295 = func.call @cc_make_string(%1293, %1294) : (!llvm.ptr, i64) -> i64
      %1296 = func.call @cc_nil_value() : () -> i64
      %1297 = func.call @cc_intern(%1295, %1296) : (i64, i64) -> i64
      %1298 = func.call @cc_nil_value() : () -> i64
      %1299 = func.call @cc_cons(%1297, %1298) : (i64, i64) -> i64
      %1300 = func.call @cc_values_pack(%1299) : (i64) -> i64
      func.call @stack_push_pointer(%1297) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1301 = func.call @stack_pop_pointer() : () -> i64
      %1302 = func.call @stack_pop_pointer() : () -> i64
      %1303 = func.call @cc_cons(%1302, %1301) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_32 = arith.constant 0 : i64
      %1304 = arith.addi %1303, %__rlasp_stack_elide_zero_32 : i64
      %1305 = func.call @stack_pop_pointer() : () -> i64
      %1306 = func.call @cc_cons(%1305, %1304) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_33 = arith.constant 0 : i64
      %1307 = arith.addi %1306, %__rlasp_stack_elide_zero_33 : i64
      %1308 = func.call @stack_pop_pointer() : () -> i64
      %1309 = func.call @cc_cons(%1308, %1307) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1309) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1310 = func.call @stack_pop_pointer() : () -> i64
      %1311 = func.call @stack_pop_pointer() : () -> i64
      %1312 = func.call @cc_cons(%1311, %1310) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_34 = arith.constant 0 : i64
      %1313 = arith.addi %1312, %__rlasp_stack_elide_zero_34 : i64
      %1314 = func.call @stack_pop_pointer() : () -> i64
      %1315 = func.call @cc_cons(%1314, %1313) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_35 = arith.constant 0 : i64
      %1316 = arith.addi %1315, %__rlasp_stack_elide_zero_35 : i64
      %1317 = func.call @stack_pop_pointer() : () -> i64
      %1318 = func.call @cc_cons(%1317, %1316) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1318) : (i64) -> ()
      %1319 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1320 = arith.constant 7 : i64
      %1321 = func.call @cc_make_string(%1319, %1320) : (!llvm.ptr, i64) -> i64
      %1322 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1323 = arith.constant 11 : i64
      %1324 = func.call @cc_make_string(%1322, %1323) : (!llvm.ptr, i64) -> i64
      %1325 = func.call @cc_intern(%1321, %1324) : (i64, i64) -> i64
      %1326 = func.call @cc_nil_value() : () -> i64
      %1327 = func.call @cc_cons(%1325, %1326) : (i64, i64) -> i64
      %1328 = func.call @cc_values_pack(%1327) : (i64) -> i64
      func.call @stack_push_pointer(%1325) : (i64) -> ()
      %1329 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1330 = arith.constant 6 : i64
      %1331 = func.call @cc_make_string(%1329, %1330) : (!llvm.ptr, i64) -> i64
      %1332 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1333 = arith.constant 11 : i64
      %1334 = func.call @cc_make_string(%1332, %1333) : (!llvm.ptr, i64) -> i64
      %1335 = func.call @cc_intern(%1331, %1334) : (i64, i64) -> i64
      %1336 = func.call @cc_nil_value() : () -> i64
      %1337 = func.call @cc_cons(%1335, %1336) : (i64, i64) -> i64
      %1338 = func.call @cc_values_pack(%1337) : (i64) -> i64
      func.call @stack_push_pointer(%1335) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1339 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1340 = arith.constant 11 : i64
      %1341 = func.call @cc_make_string(%1339, %1340) : (!llvm.ptr, i64) -> i64
      %1342 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1343 = arith.constant 11 : i64
      %1344 = func.call @cc_make_string(%1342, %1343) : (!llvm.ptr, i64) -> i64
      %1345 = func.call @cc_intern(%1341, %1344) : (i64, i64) -> i64
      %1346 = func.call @cc_nil_value() : () -> i64
      %1347 = func.call @cc_cons(%1345, %1346) : (i64, i64) -> i64
      %1348 = func.call @cc_values_pack(%1347) : (i64) -> i64
      func.call @stack_push_pointer(%1345) : (i64) -> ()
      %1349 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1350 = arith.constant 1 : i64
      %1351 = func.call @cc_make_string(%1349, %1350) : (!llvm.ptr, i64) -> i64
      %1352 = func.call @cc_nil_value() : () -> i64
      %1353 = func.call @cc_intern(%1351, %1352) : (i64, i64) -> i64
      %1354 = func.call @cc_nil_value() : () -> i64
      %1355 = func.call @cc_cons(%1353, %1354) : (i64, i64) -> i64
      %1356 = func.call @cc_values_pack(%1355) : (i64) -> i64
      func.call @stack_push_pointer(%1353) : (i64) -> ()
      %1357 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1358 = arith.constant 1 : i64
      %1359 = func.call @cc_make_string(%1357, %1358) : (!llvm.ptr, i64) -> i64
      %1360 = func.call @cc_nil_value() : () -> i64
      %1361 = func.call @cc_intern(%1359, %1360) : (i64, i64) -> i64
      %1362 = func.call @cc_nil_value() : () -> i64
      %1363 = func.call @cc_cons(%1361, %1362) : (i64, i64) -> i64
      %1364 = func.call @cc_values_pack(%1363) : (i64) -> i64
      func.call @stack_push_pointer(%1361) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1365 = func.call @stack_pop_pointer() : () -> i64
      %1366 = func.call @stack_pop_pointer() : () -> i64
      %1367 = func.call @cc_cons(%1366, %1365) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_36 = arith.constant 0 : i64
      %1368 = arith.addi %1367, %__rlasp_stack_elide_zero_36 : i64
      %1369 = func.call @stack_pop_pointer() : () -> i64
      %1370 = func.call @cc_cons(%1369, %1368) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_37 = arith.constant 0 : i64
      %1371 = arith.addi %1370, %__rlasp_stack_elide_zero_37 : i64
      %1372 = func.call @stack_pop_pointer() : () -> i64
      %1373 = func.call @cc_cons(%1372, %1371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1373) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1374 = func.call @stack_pop_pointer() : () -> i64
      %1375 = func.call @stack_pop_pointer() : () -> i64
      %1376 = func.call @cc_cons(%1375, %1374) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_38 = arith.constant 0 : i64
      %1377 = arith.addi %1376, %__rlasp_stack_elide_zero_38 : i64
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = func.call @cc_cons(%1378, %1377) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_39 = arith.constant 0 : i64
      %1380 = arith.addi %1379, %__rlasp_stack_elide_zero_39 : i64
      %1381 = func.call @stack_pop_pointer() : () -> i64
      %1382 = func.call @cc_cons(%1381, %1380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1382) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1383 = func.call @stack_pop_pointer() : () -> i64
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @cc_cons(%1384, %1383) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_40 = arith.constant 0 : i64
      %1386 = arith.addi %1385, %__rlasp_stack_elide_zero_40 : i64
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = func.call @cc_cons(%1387, %1386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1389 = func.call @stack_pop_pointer() : () -> i64
      %1390 = func.call @stack_pop_pointer() : () -> i64
      %1391 = func.call @cc_cons(%1390, %1389) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_41 = arith.constant 0 : i64
      %1392 = arith.addi %1391, %__rlasp_stack_elide_zero_41 : i64
      %1393 = func.call @stack_pop_pointer() : () -> i64
      %1394 = func.call @cc_cons(%1393, %1392) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_42 = arith.constant 0 : i64
      %1395 = arith.addi %1394, %__rlasp_stack_elide_zero_42 : i64
      %1396 = func.call @stack_pop_pointer() : () -> i64
      %1397 = func.call @cc_cons(%1396, %1395) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_43 = arith.constant 0 : i64
      %1398 = arith.addi %1397, %__rlasp_stack_elide_zero_43 : i64
      %1399 = func.call @stack_pop_pointer() : () -> i64
      %1400 = func.call @cc_cons(%1399, %1398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1400) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1401 = func.call @stack_pop_pointer() : () -> i64
      %1402 = func.call @stack_pop_pointer() : () -> i64
      %1403 = func.call @cc_cons(%1402, %1401) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_44 = arith.constant 0 : i64
      %1404 = arith.addi %1403, %__rlasp_stack_elide_zero_44 : i64
      %1405 = func.call @stack_pop_pointer() : () -> i64
      %1406 = func.call @cc_cons(%1405, %1404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1406) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1407 = func.call @stack_pop_pointer() : () -> i64
      %1408 = func.call @stack_pop_pointer() : () -> i64
      %1409 = func.call @cc_cons(%1408, %1407) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_45 = arith.constant 0 : i64
      %1410 = arith.addi %1409, %__rlasp_stack_elide_zero_45 : i64
      %1411 = func.call @stack_pop_pointer() : () -> i64
      %1412 = func.call @cc_cons(%1411, %1410) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_46 = arith.constant 0 : i64
      %1413 = arith.addi %1412, %__rlasp_stack_elide_zero_46 : i64
      %1414 = func.call @stack_pop_pointer() : () -> i64
      %1415 = func.call @cc_cons(%1414, %1413) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_47 = arith.constant 0 : i64
      %1416 = arith.addi %1415, %__rlasp_stack_elide_zero_47 : i64
      %1417 = func.call @stack_pop_pointer() : () -> i64
      %1418 = func.call @cc_cons(%1417, %1416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1418) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1419 = func.call @stack_pop_pointer() : () -> i64
      %1420 = func.call @stack_pop_pointer() : () -> i64
      %1421 = func.call @cc_cons(%1420, %1419) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_48 = arith.constant 0 : i64
      %1422 = arith.addi %1421, %__rlasp_stack_elide_zero_48 : i64
      %1423 = func.call @stack_pop_pointer() : () -> i64
      %1424 = func.call @cc_cons(%1423, %1422) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_49 = arith.constant 0 : i64
      %1425 = arith.addi %1424, %__rlasp_stack_elide_zero_49 : i64
      %1426 = func.call @stack_pop_pointer() : () -> i64
      %1427 = func.call @cc_cons(%1426, %1425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1427) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1428 = func.call @stack_pop_pointer() : () -> i64
      %1429 = func.call @stack_pop_pointer() : () -> i64
      %1430 = func.call @cc_cons(%1429, %1428) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_50 = arith.constant 0 : i64
      %1431 = arith.addi %1430, %__rlasp_stack_elide_zero_50 : i64
      %1432 = func.call @stack_pop_pointer() : () -> i64
      %1433 = func.call @cc_cons(%1432, %1431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1433) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1434 = func.call @stack_pop_pointer() : () -> i64
      %1435 = func.call @stack_pop_pointer() : () -> i64
      %1436 = func.call @cc_cons(%1435, %1434) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_51 = arith.constant 0 : i64
      %1437 = arith.addi %1436, %__rlasp_stack_elide_zero_51 : i64
      %1438 = func.call @stack_pop_pointer() : () -> i64
      %1439 = func.call @cc_cons(%1438, %1437) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_52 = arith.constant 0 : i64
      %1440 = arith.addi %1439, %__rlasp_stack_elide_zero_52 : i64
      %1441 = func.call @stack_pop_pointer() : () -> i64
      %1442 = func.call @cc_cons(%1441, %1440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1443 = func.call @stack_pop_pointer() : () -> i64
      %1444 = func.call @stack_pop_pointer() : () -> i64
      %1445 = func.call @cc_cons(%1444, %1443) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_53 = arith.constant 0 : i64
      %1446 = arith.addi %1445, %__rlasp_stack_elide_zero_53 : i64
      %1447 = func.call @stack_pop_pointer() : () -> i64
      %1448 = func.call @cc_cons(%1447, %1446) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_54 = arith.constant 0 : i64
      %1449 = arith.addi %1448, %__rlasp_stack_elide_zero_54 : i64
      %1450 = func.call @stack_pop_pointer() : () -> i64
      %1451 = func.call @cc_cons(%1450, %1449) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_55 = arith.constant 0 : i64
      %1452 = arith.addi %1451, %__rlasp_stack_elide_zero_55 : i64
      %1453 = func.call @stack_pop_pointer() : () -> i64
      %1454 = func.call @cc_cons(%1453, %1452) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_56 = arith.constant 0 : i64
      %1455 = arith.addi %1454, %__rlasp_stack_elide_zero_56 : i64
      scf.yield %1455 : i64
    }
    %1456 = func.call @cc_nil_value() : () -> i64
    %1457 = func.call @cc_errorp(%1003) : (i64) -> i64
    %1458 = arith.cmpi ne, %1457, %1456 : i64
    %1459 = scf.if %1458 -> (i64) {
      scf.yield %1003 : i64
    } else {
      %1460 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1461 = arith.constant 6 : i64
      %1462 = func.call @cc_make_string(%1460, %1461) : (!llvm.ptr, i64) -> i64
      %1463 = func.call @cc_nil_value() : () -> i64
      %1464 = func.call @cc_intern(%1462, %1463) : (i64, i64) -> i64
      %1465 = func.call @cc_nil_value() : () -> i64
      %1466 = func.call @cc_cons(%1464, %1465) : (i64, i64) -> i64
      %1467 = func.call @cc_values_pack(%1466) : (i64) -> i64
      %__rlasp_stack_elide_zero_57 = arith.constant 0 : i64
      %1468 = arith.addi %1464, %__rlasp_stack_elide_zero_57 : i64
      %1469 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1470 = arith.constant 6 : i64
      %1471 = func.call @cc_make_string(%1469, %1470) : (!llvm.ptr, i64) -> i64
      %1472 = func.call @cc_nil_value() : () -> i64
      %1473 = func.call @cc_intern(%1471, %1472) : (i64, i64) -> i64
      %1474 = func.call @cc_nil_value() : () -> i64
      %1475 = func.call @cc_cons(%1473, %1474) : (i64, i64) -> i64
      %1476 = func.call @cc_values_pack(%1475) : (i64) -> i64
      func.call @stack_push_pointer(%1473) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1477 = func.call @stack_pop_pointer() : () -> i64
      %1478 = func.call @stack_pop_pointer() : () -> i64
      %1479 = func.call @cc_cons(%1478, %1477) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_58 = arith.constant 0 : i64
      %1480 = arith.addi %1479, %__rlasp_stack_elide_zero_58 : i64
      %1492 = arith.constant 175130764378126 : i64
      %1493 = arith.constant 0 : i64
      %1494 = func.call @cc_make_closure(%1492, %1493) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_59 = arith.constant 0 : i64
      %1495 = arith.addi %1494, %__rlasp_stack_elide_zero_59 : i64
      %1496 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1496) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1497 = func.call @stack_pop_pointer() : () -> i64
      %1498 = func.call @stack_pop_pointer() : () -> i64
      %1499 = func.call @cc_cons(%1498, %1497) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_60 = arith.constant 0 : i64
      %1500 = arith.addi %1499, %__rlasp_stack_elide_zero_60 : i64
      %1501 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1502 = arith.constant 11 : i64
      %1503 = func.call @cc_make_string(%1501, %1502) : (!llvm.ptr, i64) -> i64
      %1504 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1505 = arith.constant 7 : i64
      %1506 = func.call @cc_make_string(%1504, %1505) : (!llvm.ptr, i64) -> i64
      %1507 = func.call @cc_intern(%1503, %1506) : (i64, i64) -> i64
      %1508 = func.call @cc_nil_value() : () -> i64
      %1509 = func.call @cc_cons(%1507, %1508) : (i64, i64) -> i64
      %1510 = func.call @cc_values_pack(%1509) : (i64) -> i64
      %1511 = func.call @cc_nil_value() : () -> i64
      %1512 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1513 = arith.constant 4 : i64
      %1514 = func.call @cc_make_string(%1512, %1513) : (!llvm.ptr, i64) -> i64
      %1515 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1516 = arith.constant 7 : i64
      %1517 = func.call @cc_make_string(%1515, %1516) : (!llvm.ptr, i64) -> i64
      %1518 = func.call @cc_intern(%1514, %1517) : (i64, i64) -> i64
      %1519 = func.call @cc_nil_value() : () -> i64
      %1520 = func.call @cc_cons(%1518, %1519) : (i64, i64) -> i64
      %1521 = func.call @cc_values_pack(%1520) : (i64) -> i64
      %1522 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1523 = arith.constant 6 : i64
      %1524 = func.call @cc_make_string(%1522, %1523) : (!llvm.ptr, i64) -> i64
      %1525 = func.call @cc_nil_value() : () -> i64
      %1526 = func.call @cc_intern(%1524, %1525) : (i64, i64) -> i64
      %1527 = func.call @cc_nil_value() : () -> i64
      %1528 = func.call @cc_cons(%1526, %1527) : (i64, i64) -> i64
      %1529 = func.call @cc_values_pack(%1528) : (i64) -> i64
      %__rlasp_stack_elide_zero_61 = arith.constant 0 : i64
      %1530 = arith.addi %1526, %__rlasp_stack_elide_zero_61 : i64
      %1531 = func.call @cc_nil_value() : () -> i64
      %1532 = func.call @cc_errorp(%1468) : (i64) -> i64
      %1533 = arith.cmpi ne, %1532, %1531 : i64
      %1534 = arith.cmpi eq, %1531, %1531 : i64
      %1535 = arith.andi %1533, %1534 : i1
      %1536 = scf.if %1535 -> (i64) {
        scf.yield %1468 : i64
      } else {
        scf.yield %1531 : i64
      }
      %1537 = func.call @cc_errorp(%1480) : (i64) -> i64
      %1538 = arith.cmpi ne, %1537, %1531 : i64
      %1539 = arith.cmpi eq, %1536, %1531 : i64
      %1540 = arith.andi %1538, %1539 : i1
      %1541 = scf.if %1540 -> (i64) {
        scf.yield %1480 : i64
      } else {
        scf.yield %1536 : i64
      }
      %1542 = func.call @cc_errorp(%1495) : (i64) -> i64
      %1543 = arith.cmpi ne, %1542, %1531 : i64
      %1544 = arith.cmpi eq, %1541, %1531 : i64
      %1545 = arith.andi %1543, %1544 : i1
      %1546 = scf.if %1545 -> (i64) {
        scf.yield %1495 : i64
      } else {
        scf.yield %1541 : i64
      }
      %1547 = func.call @cc_errorp(%1500) : (i64) -> i64
      %1548 = arith.cmpi ne, %1547, %1531 : i64
      %1549 = arith.cmpi eq, %1546, %1531 : i64
      %1550 = arith.andi %1548, %1549 : i1
      %1551 = scf.if %1550 -> (i64) {
        scf.yield %1500 : i64
      } else {
        scf.yield %1546 : i64
      }
      %1552 = func.call @cc_errorp(%1507) : (i64) -> i64
      %1553 = arith.cmpi ne, %1552, %1531 : i64
      %1554 = arith.cmpi eq, %1551, %1531 : i64
      %1555 = arith.andi %1553, %1554 : i1
      %1556 = scf.if %1555 -> (i64) {
        scf.yield %1507 : i64
      } else {
        scf.yield %1551 : i64
      }
      %1557 = func.call @cc_errorp(%1511) : (i64) -> i64
      %1558 = arith.cmpi ne, %1557, %1531 : i64
      %1559 = arith.cmpi eq, %1556, %1531 : i64
      %1560 = arith.andi %1558, %1559 : i1
      %1561 = scf.if %1560 -> (i64) {
        scf.yield %1511 : i64
      } else {
        scf.yield %1556 : i64
      }
      %1562 = func.call @cc_errorp(%1518) : (i64) -> i64
      %1563 = arith.cmpi ne, %1562, %1531 : i64
      %1564 = arith.cmpi eq, %1561, %1531 : i64
      %1565 = arith.andi %1563, %1564 : i1
      %1566 = scf.if %1565 -> (i64) {
        scf.yield %1518 : i64
      } else {
        scf.yield %1561 : i64
      }
      %1567 = func.call @cc_errorp(%1530) : (i64) -> i64
      %1568 = arith.cmpi ne, %1567, %1531 : i64
      %1569 = arith.cmpi eq, %1566, %1531 : i64
      %1570 = arith.andi %1568, %1569 : i1
      %1571 = scf.if %1570 -> (i64) {
        scf.yield %1530 : i64
      } else {
        scf.yield %1566 : i64
      }
      %1572 = arith.cmpi ne, %1571, %1531 : i64
      scf.if %1572 {
        func.call @stack_push_pointer(%1571) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1468) : (i64) -> ()
        func.call @stack_push_pointer(%1480) : (i64) -> ()
        func.call @stack_push_pointer(%1495) : (i64) -> ()
        func.call @stack_push_pointer(%1500) : (i64) -> ()
        func.call @stack_push_pointer(%1507) : (i64) -> ()
        func.call @stack_push_pointer(%1511) : (i64) -> ()
        func.call @stack_push_pointer(%1518) : (i64) -> ()
        func.call @stack_push_pointer(%1530) : (i64) -> ()
        %1573 = llvm.mlir.addressof @str146 : !llvm.ptr
        %1574 = func.call @cc_make_function_ref_const(%1573) : (!llvm.ptr) -> i64
        %1575 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1574, %1575) : (i64, i64) -> ()
      }
      %1576 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1576 : i64
    }
    %__rlasp_stack_elide_zero_62 = arith.constant 0 : i64
    %1577 = arith.addi %1459, %__rlasp_stack_elide_zero_62 : i64
    %1578 = func.call @cc_multiple_value_list(%1577) : (i64) -> i64
    %1579 = llvm.mlir.addressof @str147 : !llvm.ptr
    %1580 = arith.constant 38 : i64
    %1581 = func.call @cc_make_string(%1579, %1580) : (!llvm.ptr, i64) -> i64
    %1582 = func.call @cc_nil_value() : () -> i64
    %1583 = func.call @cc_intern(%1581, %1582) : (i64, i64) -> i64
    %1584 = func.call @cc_nil_value() : () -> i64
    %1585 = func.call @cc_cons(%1583, %1584) : (i64, i64) -> i64
    %1586 = func.call @cc_values_pack(%1585) : (i64) -> i64
    %1587 = func.call @cc_symbol_value(%1583) : (i64) -> i64
    %1588 = llvm.mlir.addressof @str148 : !llvm.ptr
    %1589 = arith.constant 40 : i64
    %1590 = func.call @cc_make_string(%1588, %1589) : (!llvm.ptr, i64) -> i64
    %1591 = func.call @cc_nil_value() : () -> i64
    %1592 = func.call @cc_intern(%1590, %1591) : (i64, i64) -> i64
    %1593 = func.call @cc_nil_value() : () -> i64
    %1594 = func.call @cc_cons(%1592, %1593) : (i64, i64) -> i64
    %1595 = func.call @cc_values_pack(%1594) : (i64) -> i64
    %1596 = func.call @cc_symbol_value(%1592) : (i64) -> i64
    %1597 = func.call @cc_nil_value() : () -> i64
    %1598 = arith.cmpi ne, %1587, %1597 : i64
    %1599 = scf.if %1598 -> (i64) {
      scf.yield %1596 : i64
    } else {
      scf.yield %1578 : i64
    }
    %1600 = func.call @cc_values_pack(%1599) : (i64) -> i64
    func.call @stack_push_pointer(%1600) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378115"() {
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_nil_value() : () -> i64
    %127 = func.call @cc_errorp(%125) : (i64) -> i64
    %128 = arith.cmpi ne, %127, %126 : i64
    %129 = scf.if %128 -> (i64) {
      scf.yield %125 : i64
    } else {
      %130 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%130) : (i64) -> ()
      %131 = func.call @stack_pop_pointer() : () -> i64
      %132 = func.call @cc_multiple_value_list(%131) : (i64) -> i64
      %133 = func.call @cc_t_value() : () -> i64
      %134 = llvm.mlir.addressof @str13 : !llvm.ptr
      %135 = arith.constant 38 : i64
      %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
      %137 = func.call @cc_nil_value() : () -> i64
      %138 = func.call @cc_intern(%136, %137) : (i64, i64) -> i64
      %139 = func.call @cc_nil_value() : () -> i64
      %140 = func.call @cc_cons(%138, %139) : (i64, i64) -> i64
      %141 = func.call @cc_values_pack(%140) : (i64) -> i64
      %142 = func.call @cc_set_symbol_value(%138, %133) : (i64, i64) -> i64
      %143 = llvm.mlir.addressof @str14 : !llvm.ptr
      %144 = arith.constant 39 : i64
      %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
      %146 = func.call @cc_nil_value() : () -> i64
      %147 = func.call @cc_intern(%145, %146) : (i64, i64) -> i64
      %148 = func.call @cc_nil_value() : () -> i64
      %149 = func.call @cc_cons(%147, %148) : (i64, i64) -> i64
      %150 = func.call @cc_values_pack(%149) : (i64) -> i64
      %151 = func.call @cc_set_symbol_value(%147, %131) : (i64, i64) -> i64
      %152 = llvm.mlir.addressof @str15 : !llvm.ptr
      %153 = arith.constant 40 : i64
      %154 = func.call @cc_make_string(%152, %153) : (!llvm.ptr, i64) -> i64
      %155 = func.call @cc_nil_value() : () -> i64
      %156 = func.call @cc_intern(%154, %155) : (i64, i64) -> i64
      %157 = func.call @cc_nil_value() : () -> i64
      %158 = func.call @cc_cons(%156, %157) : (i64, i64) -> i64
      %159 = func.call @cc_values_pack(%158) : (i64) -> i64
      %160 = func.call @cc_set_symbol_value(%156, %132) : (i64, i64) -> i64
      %161 = llvm.mlir.addressof @str16 : !llvm.ptr
      %162 = arith.constant 38 : i64
      %163 = func.call @cc_make_string(%161, %162) : (!llvm.ptr, i64) -> i64
      %164 = func.call @cc_nil_value() : () -> i64
      %165 = func.call @cc_intern(%163, %164) : (i64, i64) -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      %167 = func.call @cc_cons(%165, %166) : (i64, i64) -> i64
      %168 = func.call @cc_values_pack(%167) : (i64) -> i64
      %169 = func.call @cc_set_symbol_value(%165, %133) : (i64, i64) -> i64
      %170 = llvm.mlir.addressof @str17 : !llvm.ptr
      %171 = arith.constant 39 : i64
      %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
      %173 = func.call @cc_nil_value() : () -> i64
      %174 = func.call @cc_intern(%172, %173) : (i64, i64) -> i64
      %175 = func.call @cc_nil_value() : () -> i64
      %176 = func.call @cc_cons(%174, %175) : (i64, i64) -> i64
      %177 = func.call @cc_values_pack(%176) : (i64) -> i64
      %178 = func.call @cc_set_symbol_value(%174, %131) : (i64, i64) -> i64
      %179 = llvm.mlir.addressof @str18 : !llvm.ptr
      %180 = arith.constant 40 : i64
      %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
      %182 = func.call @cc_nil_value() : () -> i64
      %183 = func.call @cc_intern(%181, %182) : (i64, i64) -> i64
      %184 = func.call @cc_nil_value() : () -> i64
      %185 = func.call @cc_cons(%183, %184) : (i64, i64) -> i64
      %186 = func.call @cc_values_pack(%185) : (i64) -> i64
      %187 = func.call @cc_set_symbol_value(%183, %132) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_63 = arith.constant 0 : i64
      %188 = arith.addi %131, %__rlasp_stack_elide_zero_63 : i64
      scf.yield %188 : i64
    }
    func.call @stack_push_pointer(%129) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378118"() {
    %355 = func.call @cc_nil_value() : () -> i64
    %356 = func.call @cc_nil_value() : () -> i64
    %357 = func.call @cc_errorp(%355) : (i64) -> i64
    %358 = arith.cmpi ne, %357, %356 : i64
    %359 = scf.if %358 -> (i64) {
      scf.yield %355 : i64
    } else {
      %360 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%360) : (i64) -> ()
      %361 = func.call @stack_pop_pointer() : () -> i64
      %362 = func.call @cc_multiple_value_list(%361) : (i64) -> i64
      %363 = func.call @cc_t_value() : () -> i64
      %364 = llvm.mlir.addressof @str34 : !llvm.ptr
      %365 = arith.constant 38 : i64
      %366 = func.call @cc_make_string(%364, %365) : (!llvm.ptr, i64) -> i64
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = func.call @cc_intern(%366, %367) : (i64, i64) -> i64
      %369 = func.call @cc_nil_value() : () -> i64
      %370 = func.call @cc_cons(%368, %369) : (i64, i64) -> i64
      %371 = func.call @cc_values_pack(%370) : (i64) -> i64
      %372 = func.call @cc_set_symbol_value(%368, %363) : (i64, i64) -> i64
      %373 = llvm.mlir.addressof @str35 : !llvm.ptr
      %374 = arith.constant 39 : i64
      %375 = func.call @cc_make_string(%373, %374) : (!llvm.ptr, i64) -> i64
      %376 = func.call @cc_nil_value() : () -> i64
      %377 = func.call @cc_intern(%375, %376) : (i64, i64) -> i64
      %378 = func.call @cc_nil_value() : () -> i64
      %379 = func.call @cc_cons(%377, %378) : (i64, i64) -> i64
      %380 = func.call @cc_values_pack(%379) : (i64) -> i64
      %381 = func.call @cc_set_symbol_value(%377, %361) : (i64, i64) -> i64
      %382 = llvm.mlir.addressof @str36 : !llvm.ptr
      %383 = arith.constant 40 : i64
      %384 = func.call @cc_make_string(%382, %383) : (!llvm.ptr, i64) -> i64
      %385 = func.call @cc_nil_value() : () -> i64
      %386 = func.call @cc_intern(%384, %385) : (i64, i64) -> i64
      %387 = func.call @cc_nil_value() : () -> i64
      %388 = func.call @cc_cons(%386, %387) : (i64, i64) -> i64
      %389 = func.call @cc_values_pack(%388) : (i64) -> i64
      %390 = func.call @cc_set_symbol_value(%386, %362) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_64 = arith.constant 0 : i64
      %391 = arith.addi %361, %__rlasp_stack_elide_zero_64 : i64
      scf.yield %391 : i64
    }
    func.call @stack_push_pointer(%359) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378122"() {
    %584 = func.call @cc_nil_value() : () -> i64
    %585 = func.call @cc_nil_value() : () -> i64
    %586 = func.call @cc_errorp(%584) : (i64) -> i64
    %587 = arith.cmpi ne, %586, %585 : i64
    %588 = scf.if %587 -> (i64) {
      scf.yield %584 : i64
    } else {
      %589 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%589) : (i64) -> ()
      %590 = func.call @stack_pop_pointer() : () -> i64
      %591 = func.call @cc_multiple_value_list(%590) : (i64) -> i64
      %592 = func.call @cc_t_value() : () -> i64
      %593 = llvm.mlir.addressof @str55 : !llvm.ptr
      %594 = arith.constant 38 : i64
      %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
      %596 = func.call @cc_nil_value() : () -> i64
      %597 = func.call @cc_intern(%595, %596) : (i64, i64) -> i64
      %598 = func.call @cc_nil_value() : () -> i64
      %599 = func.call @cc_cons(%597, %598) : (i64, i64) -> i64
      %600 = func.call @cc_values_pack(%599) : (i64) -> i64
      %601 = func.call @cc_set_symbol_value(%597, %592) : (i64, i64) -> i64
      %602 = llvm.mlir.addressof @str56 : !llvm.ptr
      %603 = arith.constant 39 : i64
      %604 = func.call @cc_make_string(%602, %603) : (!llvm.ptr, i64) -> i64
      %605 = func.call @cc_nil_value() : () -> i64
      %606 = func.call @cc_intern(%604, %605) : (i64, i64) -> i64
      %607 = func.call @cc_nil_value() : () -> i64
      %608 = func.call @cc_cons(%606, %607) : (i64, i64) -> i64
      %609 = func.call @cc_values_pack(%608) : (i64) -> i64
      %610 = func.call @cc_set_symbol_value(%606, %590) : (i64, i64) -> i64
      %611 = llvm.mlir.addressof @str57 : !llvm.ptr
      %612 = arith.constant 40 : i64
      %613 = func.call @cc_make_string(%611, %612) : (!llvm.ptr, i64) -> i64
      %614 = func.call @cc_nil_value() : () -> i64
      %615 = func.call @cc_intern(%613, %614) : (i64, i64) -> i64
      %616 = func.call @cc_nil_value() : () -> i64
      %617 = func.call @cc_cons(%615, %616) : (i64, i64) -> i64
      %618 = func.call @cc_values_pack(%617) : (i64) -> i64
      %619 = func.call @cc_set_symbol_value(%615, %591) : (i64, i64) -> i64
      %__rlasp_stack_elide_zero_65 = arith.constant 0 : i64
      %620 = arith.addi %590, %__rlasp_stack_elide_zero_65 : i64
      scf.yield %620 : i64
    }
    func.call @stack_push_pointer(%588) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378124"() {
    %783 = func.call @cc_nil_value() : () -> i64
    %784 = func.call @cc_nil_value() : () -> i64
    %785 = func.call @cc_errorp(%783) : (i64) -> i64
    %786 = arith.cmpi ne, %785, %784 : i64
    %787 = scf.if %786 -> (i64) {
      scf.yield %783 : i64
    } else {
      %788 = func.call @cc_nil_value() : () -> i64
      %789 = arith.cmpi ne, %788, %788 : i64
      scf.if %789 {
        func.call @stack_push_pointer(%788) : (i64) -> ()
      } else {
        %790 = llvm.mlir.addressof @str72 : !llvm.ptr
        %791 = func.call @cc_make_function_ref_const(%790) : (!llvm.ptr) -> i64
        %792 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%791, %792) : (i64, i64) -> ()
      }
      %793 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %793 : i64
    }
    func.call @stack_push_pointer(%787) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378125"() {
    %904 = func.call @cc_nil_value() : () -> i64
    %905 = func.call @cc_nil_value() : () -> i64
    %906 = func.call @cc_errorp(%904) : (i64) -> i64
    %907 = arith.cmpi ne, %906, %905 : i64
    %908 = scf.if %907 -> (i64) {
      scf.yield %904 : i64
    } else {
      %909 = func.call @cc_nil_value() : () -> i64
      %910 = arith.cmpi ne, %909, %909 : i64
      scf.if %910 {
        func.call @stack_push_pointer(%909) : (i64) -> ()
      } else {
        %911 = llvm.mlir.addressof @str81 : !llvm.ptr
        %912 = func.call @cc_make_function_ref_const(%911) : (!llvm.ptr) -> i64
        %913 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%912, %913) : (i64, i64) -> ()
      }
      %914 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %914 : i64
    }
    func.call @stack_push_pointer(%908) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_175130764378126"() {
    %1481 = func.call @cc_nil_value() : () -> i64
    %1482 = func.call @cc_nil_value() : () -> i64
    %1483 = func.call @cc_errorp(%1481) : (i64) -> i64
    %1484 = arith.cmpi ne, %1483, %1482 : i64
    %1485 = scf.if %1484 -> (i64) {
      scf.yield %1481 : i64
    } else {
      %1486 = func.call @cc_nil_value() : () -> i64
      %1487 = arith.cmpi ne, %1486, %1486 : i64
      scf.if %1487 {
        func.call @stack_push_pointer(%1486) : (i64) -> ()
      } else {
        %1488 = llvm.mlir.addressof @str140 : !llvm.ptr
        %1489 = func.call @cc_make_function_ref_const(%1488) : (!llvm.ptr) -> i64
        %1490 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1489, %1490) : (i64, i64) -> ()
      }
      %1491 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1491 : i64
    }
    func.call @stack_push_pointer(%1485) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_175130764378112*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_175130764378112*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_175130764378112*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETFLAG_175130764378113*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETVALUE_175130764378113*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETMVLIST_175130764378113*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_175130764378114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETVALUE_175130764378114*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETMVLIST_175130764378114*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_175130764378114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETVALUE_175130764378114*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_175130764378114*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_175130764378114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETVALUE_175130764378114*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETMVLIST_175130764378114*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETFLAG_175130764378113*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETVALUE_175130764378113*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETMVLIST_175130764378113*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETFLAG_175130764378114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETVALUE_175130764378114*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_175130764378114*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETFLAG_175130764378113*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETVALUE_175130764378113*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETMVLIST_175130764378113*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETFLAG_175130764378112*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETMVLIST_175130764378112*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str27("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETFLAG_175130764378116*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETVALUE_175130764378116*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str30("*__MLIR_BLOCK_RETMVLIST_175130764378116*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_175130764378117*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETVALUE_175130764378117*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str33("*__MLIR_BLOCK_RETMVLIST_175130764378117*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str34("*__MLIR_BLOCK_RETFLAG_175130764378117*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str35("*__MLIR_BLOCK_RETVALUE_175130764378117*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETMVLIST_175130764378117*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETFLAG_175130764378117*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETVALUE_175130764378117*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str39("*__MLIR_BLOCK_RETMVLIST_175130764378117*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str40("*__MLIR_BLOCK_RETFLAG_175130764378116*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str41("*__MLIR_BLOCK_RETMVLIST_175130764378116*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str42("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str43("*__MLIR_BLOCK_RETFLAG_175130764378119*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str44("*__MLIR_BLOCK_RETVALUE_175130764378119*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str45("*__MLIR_BLOCK_RETMVLIST_175130764378119*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str46("*__MLIR_BLOCK_RETFLAG_175130764378120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str47("*__MLIR_BLOCK_RETVALUE_175130764378120*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str48("*__MLIR_BLOCK_RETMVLIST_175130764378120*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str49("*__MLIR_BLOCK_RETFLAG_175130764378120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str50("*__MLIR_BLOCK_RETVALUE_175130764378120*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str51("*__MLIR_BLOCK_RETMVLIST_175130764378120*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str52("*__MLIR_BLOCK_RETFLAG_175130764378121*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str53("*__MLIR_BLOCK_RETVALUE_175130764378121*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str54("*__MLIR_BLOCK_RETMVLIST_175130764378121*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str55("*__MLIR_BLOCK_RETFLAG_175130764378121*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str56("*__MLIR_BLOCK_RETVALUE_175130764378121*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str57("*__MLIR_BLOCK_RETMVLIST_175130764378121*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str58("*__MLIR_BLOCK_RETFLAG_175130764378121*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str59("*__MLIR_BLOCK_RETVALUE_175130764378121*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str60("*__MLIR_BLOCK_RETMVLIST_175130764378121*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str61("*__MLIR_BLOCK_RETFLAG_175130764378120*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str62("*__MLIR_BLOCK_RETVALUE_175130764378120*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str63("*__MLIR_BLOCK_RETMVLIST_175130764378120*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str64("*__MLIR_BLOCK_RETFLAG_175130764378119*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str65("*__MLIR_BLOCK_RETMVLIST_175130764378119*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str66("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETFLAG_175130764378123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str68("*__MLIR_BLOCK_RETVALUE_175130764378123*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str69("*__MLIR_BLOCK_RETMVLIST_175130764378123*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str70("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str71("EH-FOO\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str72("%FN%eh-foo\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str73("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str75("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str78("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str79("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str80("EH-BAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str81("%FN%eh-bar\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str82("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str85("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str87("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str88("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("EH-BAB\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str91("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str92("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str93("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str95("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str96("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str97("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str100("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str102("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str107("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str108("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str110("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str113("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str114("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str117("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str118("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str119("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("EQ\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str122("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str123("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str124("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str126("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str129("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str130("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str133("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str136("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str137("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str138("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str139("EH-BAZ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str140("%FN%eh-baz\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str141("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str143("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str144("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str145("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str146("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str147("*__MLIR_BLOCK_RETFLAG_175130764378123*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str148("*__MLIR_BLOCK_RETMVLIST_175130764378123*\00") : !llvm.array<41 x i8>
}
