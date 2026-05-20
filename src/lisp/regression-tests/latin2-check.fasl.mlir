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
    func.call @stack_push_nil() : () -> ()
    %72 = func.call @stack_pop_pointer() : () -> i64
    %73 = llvm.mlir.addressof @str8 : !llvm.ptr
    %74 = arith.constant 13 : i64
    %75 = func.call @cc_make_string(%73, %74) : (!llvm.ptr, i64) -> i64
    %76 = llvm.mlir.addressof @str9 : !llvm.ptr
    %77 = arith.constant 13 : i64
    %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
    %79 = func.call @cc_intern(%75, %78) : (i64, i64) -> i64
    %80 = func.call @cc_nil_value() : () -> i64
    %81 = func.call @cc_cons(%79, %80) : (i64, i64) -> i64
    %82 = func.call @cc_values_pack(%81) : (i64) -> i64
    %83 = func.call @cc_symbol_value(%79) : (i64) -> i64
    func.call @stack_push_pointer(%83) : (i64) -> ()
    func.call @stack_push_pointer(%15) : (i64) -> ()
    %84 = func.call @stack_pop_pointer() : () -> i64
    %85 = func.call @stack_pop_pointer() : () -> i64
    %86 = func.call @cc_aref(%85, %84) : (i64, i64) -> i64
    func.call @stack_push_pointer(%86) : (i64) -> ()
    %87 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%14) : (i64) -> ()
    %88 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%13) : (i64) -> ()
    %89 = func.call @stack_pop_pointer() : () -> i64
    %90 = func.call @cc_nil_value() : () -> i64
    %91 = func.call @cc_errorp(%87) : (i64) -> i64
    %92 = arith.cmpi ne, %91, %90 : i64
    %93 = arith.cmpi eq, %90, %90 : i64
    %94 = arith.andi %92, %93 : i1
    %95 = scf.if %94 -> (i64) {
      scf.yield %87 : i64
    } else {
      scf.yield %90 : i64
    }
    %96 = func.call @cc_errorp(%88) : (i64) -> i64
    %97 = arith.cmpi ne, %96, %90 : i64
    %98 = arith.cmpi eq, %95, %90 : i64
    %99 = arith.andi %97, %98 : i1
    %100 = scf.if %99 -> (i64) {
      scf.yield %88 : i64
    } else {
      scf.yield %95 : i64
    }
    %101 = func.call @cc_errorp(%89) : (i64) -> i64
    %102 = arith.cmpi ne, %101, %90 : i64
    %103 = arith.cmpi eq, %100, %90 : i64
    %104 = arith.andi %102, %103 : i1
    %105 = scf.if %104 -> (i64) {
      scf.yield %89 : i64
    } else {
      scf.yield %100 : i64
    }
    %106 = arith.cmpi ne, %105, %90 : i64
    scf.if %106 {
      func.call @stack_push_pointer(%105) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%87) : (i64) -> ()
      func.call @stack_push_pointer(%88) : (i64) -> ()
      func.call @stack_push_pointer(%89) : (i64) -> ()
      %107 = llvm.mlir.addressof @str10 : !llvm.ptr
      %108 = func.call @cc_make_function_ref_const(%107) : (!llvm.ptr) -> i64
      %109 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%108, %109) : (i64, i64) -> ()
    }
    %110 = func.call @stack_pop_pointer() : () -> i64
    %111 = func.call @cc_multiple_value_list(%110) : (i64) -> i64
    %112 = llvm.mlir.addressof @str11 : !llvm.ptr
    %113 = arith.constant 38 : i64
    %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
    %115 = func.call @cc_nil_value() : () -> i64
    %116 = func.call @cc_intern(%114, %115) : (i64, i64) -> i64
    %117 = func.call @cc_nil_value() : () -> i64
    %118 = func.call @cc_cons(%116, %117) : (i64, i64) -> i64
    %119 = func.call @cc_values_pack(%118) : (i64) -> i64
    %120 = func.call @cc_symbol_value(%116) : (i64) -> i64
    %121 = llvm.mlir.addressof @str12 : !llvm.ptr
    %122 = arith.constant 39 : i64
    %123 = func.call @cc_make_string(%121, %122) : (!llvm.ptr, i64) -> i64
    %124 = func.call @cc_nil_value() : () -> i64
    %125 = func.call @cc_intern(%123, %124) : (i64, i64) -> i64
    %126 = func.call @cc_nil_value() : () -> i64
    %127 = func.call @cc_cons(%125, %126) : (i64, i64) -> i64
    %128 = func.call @cc_values_pack(%127) : (i64) -> i64
    %129 = func.call @cc_symbol_value(%125) : (i64) -> i64
    %130 = llvm.mlir.addressof @str13 : !llvm.ptr
    %131 = arith.constant 40 : i64
    %132 = func.call @cc_make_string(%130, %131) : (!llvm.ptr, i64) -> i64
    %133 = func.call @cc_nil_value() : () -> i64
    %134 = func.call @cc_intern(%132, %133) : (i64, i64) -> i64
    %135 = func.call @cc_nil_value() : () -> i64
    %136 = func.call @cc_cons(%134, %135) : (i64, i64) -> i64
    %137 = func.call @cc_values_pack(%136) : (i64) -> i64
    %138 = func.call @cc_symbol_value(%134) : (i64) -> i64
    %139 = func.call @cc_nil_value() : () -> i64
    %140 = arith.cmpi ne, %120, %139 : i64
    %141 = scf.if %140 -> (i64) {
      scf.yield %138 : i64
    } else {
      scf.yield %111 : i64
    }
    %142 = func.call @cc_values_pack(%141) : (i64) -> i64
    func.call @stack_push_pointer(%142) : (i64) -> ()
    %143 = func.call @stack_pop_pointer() : () -> i64
    %144 = func.call @cc_multiple_value_list(%143) : (i64) -> i64
    %145 = llvm.mlir.addressof @str14 : !llvm.ptr
    %146 = arith.constant 38 : i64
    %147 = func.call @cc_make_string(%145, %146) : (!llvm.ptr, i64) -> i64
    %148 = func.call @cc_nil_value() : () -> i64
    %149 = func.call @cc_intern(%147, %148) : (i64, i64) -> i64
    %150 = func.call @cc_nil_value() : () -> i64
    %151 = func.call @cc_cons(%149, %150) : (i64, i64) -> i64
    %152 = func.call @cc_values_pack(%151) : (i64) -> i64
    %153 = func.call @cc_symbol_value(%149) : (i64) -> i64
    %154 = llvm.mlir.addressof @str15 : !llvm.ptr
    %155 = arith.constant 40 : i64
    %156 = func.call @cc_make_string(%154, %155) : (!llvm.ptr, i64) -> i64
    %157 = func.call @cc_nil_value() : () -> i64
    %158 = func.call @cc_intern(%156, %157) : (i64, i64) -> i64
    %159 = func.call @cc_nil_value() : () -> i64
    %160 = func.call @cc_cons(%158, %159) : (i64, i64) -> i64
    %161 = func.call @cc_values_pack(%160) : (i64) -> i64
    %162 = func.call @cc_symbol_value(%158) : (i64) -> i64
    %163 = func.call @cc_nil_value() : () -> i64
    %164 = arith.cmpi ne, %153, %163 : i64
    %165 = scf.if %164 -> (i64) {
      scf.yield %162 : i64
    } else {
      scf.yield %144 : i64
    }
    %166 = func.call @cc_values_pack(%165) : (i64) -> i64
    func.call @stack_push_pointer(%166) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %167 = llvm.mlir.addressof @str16 : !llvm.ptr
    %168 = arith.constant 6 : i64
    %169 = func.call @cc_make_string(%167, %168) : (!llvm.ptr, i64) -> i64
    %170 = func.call @cc_nil_value() : () -> i64
    %171 = func.call @cc_intern(%169, %170) : (i64, i64) -> i64
    %172 = func.call @cc_nil_value() : () -> i64
    %173 = func.call @cc_cons(%171, %172) : (i64, i64) -> i64
    %174 = func.call @cc_values_pack(%173) : (i64) -> i64
    %175 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%171, %175) : (i64, i64) -> ()
    %176 = func.call @cc_nil_value() : () -> i64
    %177 = llvm.mlir.addressof @str17 : !llvm.ptr
    %178 = arith.constant 38 : i64
    %179 = func.call @cc_make_string(%177, %178) : (!llvm.ptr, i64) -> i64
    %180 = func.call @cc_nil_value() : () -> i64
    %181 = func.call @cc_intern(%179, %180) : (i64, i64) -> i64
    %182 = func.call @cc_nil_value() : () -> i64
    %183 = func.call @cc_cons(%181, %182) : (i64, i64) -> i64
    %184 = func.call @cc_values_pack(%183) : (i64) -> i64
    %185 = func.call @cc_set_symbol_value(%181, %176) : (i64, i64) -> i64
    %186 = llvm.mlir.addressof @str18 : !llvm.ptr
    %187 = arith.constant 39 : i64
    %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
    %189 = func.call @cc_nil_value() : () -> i64
    %190 = func.call @cc_intern(%188, %189) : (i64, i64) -> i64
    %191 = func.call @cc_nil_value() : () -> i64
    %192 = func.call @cc_cons(%190, %191) : (i64, i64) -> i64
    %193 = func.call @cc_values_pack(%192) : (i64) -> i64
    %194 = func.call @cc_set_symbol_value(%190, %176) : (i64, i64) -> i64
    %195 = llvm.mlir.addressof @str19 : !llvm.ptr
    %196 = arith.constant 40 : i64
    %197 = func.call @cc_make_string(%195, %196) : (!llvm.ptr, i64) -> i64
    %198 = func.call @cc_nil_value() : () -> i64
    %199 = func.call @cc_intern(%197, %198) : (i64, i64) -> i64
    %200 = func.call @cc_nil_value() : () -> i64
    %201 = func.call @cc_cons(%199, %200) : (i64, i64) -> i64
    %202 = func.call @cc_values_pack(%201) : (i64) -> i64
    %203 = func.call @cc_set_symbol_value(%199, %176) : (i64, i64) -> i64
    %204 = func.call @cc_nil_value() : () -> i64
    %205 = func.call @cc_nil_value() : () -> i64
    %206 = func.call @cc_errorp(%204) : (i64) -> i64
    %207 = arith.cmpi ne, %206, %205 : i64
    %208 = scf.if %207 -> (i64) {
      scf.yield %204 : i64
    } else {
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_nil_value() : () -> i64
      %211 = func.call @cc_errorp(%209) : (i64) -> i64
      %212 = arith.cmpi ne, %211, %210 : i64
      %213 = scf.if %212 -> (i64) {
        scf.yield %209 : i64
      } else {
        %214 = llvm.mlir.addressof @str20 : !llvm.ptr
        %215 = arith.constant 13 : i64
        %216 = func.call @cc_make_string(%214, %215) : (!llvm.ptr, i64) -> i64
        %217 = func.call @cc_nil_value() : () -> i64
        %218 = func.call @cc_intern(%216, %217) : (i64, i64) -> i64
        %219 = func.call @cc_nil_value() : () -> i64
        %220 = func.call @cc_cons(%218, %219) : (i64, i64) -> i64
        %221 = func.call @cc_values_pack(%220) : (i64) -> i64
        func.call @stack_push_pointer(%218) : (i64) -> ()
        %222 = func.call @stack_pop_pointer() : () -> i64
        %223 = func.call @cc_nil_value() : () -> i64
        %224 = func.call @cc_errorp(%222) : (i64) -> i64
        %225 = arith.cmpi ne, %224, %223 : i64
        %226 = arith.cmpi eq, %223, %223 : i64
        %227 = arith.andi %225, %226 : i1
        %228 = scf.if %227 -> (i64) {
          scf.yield %222 : i64
        } else {
          scf.yield %223 : i64
        }
        %229 = arith.cmpi ne, %228, %223 : i64
        scf.if %229 {
          func.call @stack_push_pointer(%228) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%222) : (i64) -> ()
          %230 = llvm.mlir.addressof @str21 : !llvm.ptr
          %231 = func.call @cc_make_function_ref_const(%230) : (!llvm.ptr) -> i64
          %232 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%231, %232) : (i64, i64) -> ()
        }
        %233 = func.call @stack_pop_pointer() : () -> i64
        %234 = func.call @cc_nil_value() : () -> i64
        %235 = arith.cmpi ne, %233, %234 : i64
        scf.if %235 {
          %236 = llvm.mlir.addressof @str22 : !llvm.ptr
          %237 = arith.constant 13 : i64
          %238 = func.call @cc_make_string(%236, %237) : (!llvm.ptr, i64) -> i64
          %239 = func.call @cc_nil_value() : () -> i64
          %240 = func.call @cc_intern(%238, %239) : (i64, i64) -> i64
          %241 = func.call @cc_nil_value() : () -> i64
          %242 = func.call @cc_cons(%240, %241) : (i64, i64) -> i64
          %243 = func.call @cc_values_pack(%242) : (i64) -> i64
          func.call @stack_push_pointer(%240) : (i64) -> ()
          %244 = func.call @stack_pop_pointer() : () -> i64
          %245 = func.call @cc_nil_value() : () -> i64
          %246 = func.call @cc_errorp(%244) : (i64) -> i64
          %247 = arith.cmpi ne, %246, %245 : i64
          %248 = arith.cmpi eq, %245, %245 : i64
          %249 = arith.andi %247, %248 : i1
          %250 = scf.if %249 -> (i64) {
            scf.yield %244 : i64
          } else {
            scf.yield %245 : i64
          }
          %251 = arith.cmpi ne, %250, %245 : i64
          scf.if %251 {
            func.call @stack_push_pointer(%250) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%244) : (i64) -> ()
            %252 = llvm.mlir.addressof @str23 : !llvm.ptr
            %253 = func.call @cc_make_function_ref_const(%252) : (!llvm.ptr) -> i64
            %254 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%253, %254) : (i64, i64) -> ()
          }
        } else {
          %255 = llvm.mlir.addressof @str24 : !llvm.ptr
          %256 = arith.constant 13 : i64
          %257 = func.call @cc_make_string(%255, %256) : (!llvm.ptr, i64) -> i64
          %258 = func.call @cc_nil_value() : () -> i64
          %259 = func.call @cc_intern(%257, %258) : (i64, i64) -> i64
          %260 = func.call @cc_nil_value() : () -> i64
          %261 = func.call @cc_cons(%259, %260) : (i64, i64) -> i64
          %262 = func.call @cc_values_pack(%261) : (i64) -> i64
          func.call @stack_push_pointer(%259) : (i64) -> ()
          %263 = func.call @stack_pop_pointer() : () -> i64
          %264 = func.call @cc_nil_value() : () -> i64
          %265 = func.call @cc_errorp(%263) : (i64) -> i64
          %266 = arith.cmpi ne, %265, %264 : i64
          %267 = arith.cmpi eq, %264, %264 : i64
          %268 = arith.andi %266, %267 : i1
          %269 = scf.if %268 -> (i64) {
            scf.yield %263 : i64
          } else {
            scf.yield %264 : i64
          }
          %270 = arith.cmpi ne, %269, %264 : i64
          scf.if %270 {
            func.call @stack_push_pointer(%269) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%263) : (i64) -> ()
            %271 = llvm.mlir.addressof @str25 : !llvm.ptr
            %272 = func.call @cc_make_function_ref_const(%271) : (!llvm.ptr) -> i64
            %273 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%272, %273) : (i64, i64) -> ()
          }
        }
        %274 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %274 : i64
      }
      %275 = func.call @cc_nil_value() : () -> i64
      %276 = func.call @cc_errorp(%213) : (i64) -> i64
      %277 = arith.cmpi ne, %276, %275 : i64
      %278 = scf.if %277 -> (i64) {
        scf.yield %213 : i64
      } else {
        %279 = llvm.mlir.addressof @str26 : !llvm.ptr
        %280 = arith.constant 2 : i64
        %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
        %282 = llvm.mlir.addressof @str27 : !llvm.ptr
        %283 = arith.constant 7 : i64
        %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
        %285 = func.call @cc_intern(%281, %284) : (i64, i64) -> i64
        %286 = func.call @cc_nil_value() : () -> i64
        %287 = func.call @cc_cons(%285, %286) : (i64, i64) -> i64
        %288 = func.call @cc_values_pack(%287) : (i64) -> i64
        func.call @stack_push_pointer(%285) : (i64) -> ()
        %289 = func.call @stack_pop_pointer() : () -> i64
        %290 = llvm.mlir.addressof @str28 : !llvm.ptr
        %291 = arith.constant 13 : i64
        %292 = func.call @cc_make_string(%290, %291) : (!llvm.ptr, i64) -> i64
        %293 = func.call @cc_nil_value() : () -> i64
        %294 = func.call @cc_intern(%292, %293) : (i64, i64) -> i64
        %295 = func.call @cc_nil_value() : () -> i64
        %296 = func.call @cc_cons(%294, %295) : (i64, i64) -> i64
        %297 = func.call @cc_values_pack(%296) : (i64) -> i64
        func.call @stack_push_pointer(%294) : (i64) -> ()
        %298 = func.call @stack_pop_pointer() : () -> i64
        %299 = func.call @cc_nil_value() : () -> i64
        %300 = func.call @cc_errorp(%289) : (i64) -> i64
        %301 = arith.cmpi ne, %300, %299 : i64
        %302 = arith.cmpi eq, %299, %299 : i64
        %303 = arith.andi %301, %302 : i1
        %304 = scf.if %303 -> (i64) {
          scf.yield %289 : i64
        } else {
          scf.yield %299 : i64
        }
        %305 = func.call @cc_errorp(%298) : (i64) -> i64
        %306 = arith.cmpi ne, %305, %299 : i64
        %307 = arith.cmpi eq, %304, %299 : i64
        %308 = arith.andi %306, %307 : i1
        %309 = scf.if %308 -> (i64) {
          scf.yield %298 : i64
        } else {
          scf.yield %304 : i64
        }
        %310 = arith.cmpi ne, %309, %299 : i64
        scf.if %310 {
          func.call @stack_push_pointer(%309) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%289) : (i64) -> ()
          func.call @stack_push_pointer(%298) : (i64) -> ()
          %311 = llvm.mlir.addressof @str29 : !llvm.ptr
          %312 = func.call @cc_make_function_ref_const(%311) : (!llvm.ptr) -> i64
          %313 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%312, %313) : (i64, i64) -> ()
        }
        %314 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %314 : i64
      }
      %315 = func.call @cc_nil_value() : () -> i64
      %316 = func.call @cc_errorp(%278) : (i64) -> i64
      %317 = arith.cmpi ne, %316, %315 : i64
      %318 = scf.if %317 -> (i64) {
        scf.yield %278 : i64
      } else {
        %319 = llvm.mlir.addressof @str30 : !llvm.ptr
        %320 = arith.constant 13 : i64
        %321 = func.call @cc_make_string(%319, %320) : (!llvm.ptr, i64) -> i64
        %322 = func.call @cc_nil_value() : () -> i64
        %323 = func.call @cc_intern(%321, %322) : (i64, i64) -> i64
        %324 = func.call @cc_nil_value() : () -> i64
        %325 = func.call @cc_cons(%323, %324) : (i64, i64) -> i64
        %326 = func.call @cc_values_pack(%325) : (i64) -> i64
        func.call @stack_push_pointer(%323) : (i64) -> ()
        %327 = func.call @stack_pop_pointer() : () -> i64
        %328 = func.call @cc_nil_value() : () -> i64
        %329 = func.call @cc_errorp(%327) : (i64) -> i64
        %330 = arith.cmpi ne, %329, %328 : i64
        %331 = arith.cmpi eq, %328, %328 : i64
        %332 = arith.andi %330, %331 : i1
        %333 = scf.if %332 -> (i64) {
          scf.yield %327 : i64
        } else {
          scf.yield %328 : i64
        }
        %334 = arith.cmpi ne, %333, %328 : i64
        scf.if %334 {
          func.call @stack_push_pointer(%333) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%327) : (i64) -> ()
          %335 = llvm.mlir.addressof @str31 : !llvm.ptr
          %336 = func.call @cc_make_function_ref_const(%335) : (!llvm.ptr) -> i64
          %337 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%336, %337) : (i64, i64) -> ()
        }
        %338 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %338 : i64
      }
      func.call @stack_push_pointer(%318) : (i64) -> ()
      %339 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %339 : i64
    }
    %340 = func.call @cc_nil_value() : () -> i64
    %341 = func.call @cc_errorp(%208) : (i64) -> i64
    %342 = arith.cmpi ne, %341, %340 : i64
    %343 = scf.if %342 -> (i64) {
      scf.yield %208 : i64
    } else {
      %344 = llvm.mlir.addressof @str32 : !llvm.ptr
      %345 = arith.constant 13 : i64
      %346 = func.call @cc_make_string(%344, %345) : (!llvm.ptr, i64) -> i64
      %347 = llvm.mlir.addressof @str33 : !llvm.ptr
      %348 = arith.constant 7 : i64
      %349 = func.call @cc_make_string(%347, %348) : (!llvm.ptr, i64) -> i64
      %350 = func.call @cc_intern(%346, %349) : (i64, i64) -> i64
      %351 = func.call @cc_nil_value() : () -> i64
      %352 = func.call @cc_cons(%350, %351) : (i64, i64) -> i64
      %353 = func.call @cc_values_pack(%352) : (i64) -> i64
      func.call @stack_push_pointer(%350) : (i64) -> ()
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @cc_in_package(%354) : (i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      %356 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %356 : i64
    }
    %357 = func.call @cc_nil_value() : () -> i64
    %358 = func.call @cc_errorp(%343) : (i64) -> i64
    %359 = arith.cmpi ne, %358, %357 : i64
    %360 = scf.if %359 -> (i64) {
      scf.yield %343 : i64
    } else {
      %361 = llvm.mlir.addressof @str34 : !llvm.ptr
      %362 = arith.constant 13 : i64
      %363 = func.call @cc_make_string(%361, %362) : (!llvm.ptr, i64) -> i64
      %364 = func.call @cc_nil_value() : () -> i64
      %365 = func.call @cc_intern(%363, %364) : (i64, i64) -> i64
      %366 = func.call @cc_nil_value() : () -> i64
      %367 = func.call @cc_cons(%365, %366) : (i64, i64) -> i64
      %368 = func.call @cc_values_pack(%367) : (i64) -> i64
      func.call @stack_push_pointer(%365) : (i64) -> ()
      %369 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %369 : i64
    }
    %370 = func.call @cc_nil_value() : () -> i64
    %371 = func.call @cc_errorp(%360) : (i64) -> i64
    %372 = arith.cmpi ne, %371, %370 : i64
    %373 = scf.if %372 -> (i64) {
      scf.yield %360 : i64
    } else {
      %374 = llvm.mlir.addressof @str35 : !llvm.ptr
      %375 = func.call @cc_make_function_ref_const(%374) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%375) : (i64) -> ()
      %376 = func.call @stack_pop_pointer() : () -> i64
      %377 = llvm.mlir.addressof @str36 : !llvm.ptr
      %378 = arith.constant 6 : i64
      %379 = func.call @cc_make_string(%377, %378) : (!llvm.ptr, i64) -> i64
      %380 = llvm.mlir.addressof @str37 : !llvm.ptr
      %381 = arith.constant 17 : i64
      %382 = func.call @cc_make_string(%380, %381) : (!llvm.ptr, i64) -> i64
      %383 = func.call @cc_intern(%379, %382) : (i64, i64) -> i64
      %384 = func.call @cc_nil_value() : () -> i64
      %385 = func.call @cc_cons(%383, %384) : (i64, i64) -> i64
      %386 = func.call @cc_values_pack(%385) : (i64) -> i64
      %387 = func.call @cc_set_symbol_value(%383, %376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%376) : (i64) -> ()
      %388 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %388 : i64
    }
    %389 = func.call @cc_nil_value() : () -> i64
    %390 = func.call @cc_errorp(%373) : (i64) -> i64
    %391 = arith.cmpi ne, %390, %389 : i64
    %392 = scf.if %391 -> (i64) {
      scf.yield %373 : i64
    } else {
      %393 = llvm.mlir.addressof @str38 : !llvm.ptr
      %394 = func.call @cc_make_function_ref_const(%393) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%394) : (i64) -> ()
      %395 = func.call @stack_pop_pointer() : () -> i64
      %396 = llvm.mlir.addressof @str39 : !llvm.ptr
      %397 = arith.constant 6 : i64
      %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
      %399 = llvm.mlir.addressof @str40 : !llvm.ptr
      %400 = arith.constant 17 : i64
      %401 = func.call @cc_make_string(%399, %400) : (!llvm.ptr, i64) -> i64
      %402 = func.call @cc_intern(%398, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      %406 = func.call @cc_set_symbol_value(%402, %395) : (i64, i64) -> i64
      func.call @stack_push_pointer(%395) : (i64) -> ()
      %407 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %407 : i64
    }
    %408 = func.call @cc_nil_value() : () -> i64
    %409 = func.call @cc_errorp(%392) : (i64) -> i64
    %410 = arith.cmpi ne, %409, %408 : i64
    %411 = scf.if %410 -> (i64) {
      scf.yield %392 : i64
    } else {
      %412 = llvm.mlir.addressof @str41 : !llvm.ptr
      %413 = func.call @cc_make_function_ref_const(%412) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%413) : (i64) -> ()
      %414 = func.call @stack_pop_pointer() : () -> i64
      %415 = llvm.mlir.addressof @str42 : !llvm.ptr
      %416 = arith.constant 6 : i64
      %417 = func.call @cc_make_string(%415, %416) : (!llvm.ptr, i64) -> i64
      %418 = llvm.mlir.addressof @str43 : !llvm.ptr
      %419 = arith.constant 17 : i64
      %420 = func.call @cc_make_string(%418, %419) : (!llvm.ptr, i64) -> i64
      %421 = func.call @cc_intern(%417, %420) : (i64, i64) -> i64
      %422 = func.call @cc_nil_value() : () -> i64
      %423 = func.call @cc_cons(%421, %422) : (i64, i64) -> i64
      %424 = func.call @cc_values_pack(%423) : (i64) -> i64
      %425 = func.call @cc_set_symbol_value(%421, %414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%414) : (i64) -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %426 : i64
    }
    %427 = func.call @cc_nil_value() : () -> i64
    %428 = func.call @cc_errorp(%411) : (i64) -> i64
    %429 = arith.cmpi ne, %428, %427 : i64
    %430 = scf.if %429 -> (i64) {
      scf.yield %411 : i64
    } else {
      %431 = llvm.mlir.addressof @str44 : !llvm.ptr
      %432 = func.call @cc_make_function_ref_const(%431) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%432) : (i64) -> ()
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = llvm.mlir.addressof @str45 : !llvm.ptr
      %435 = arith.constant 6 : i64
      %436 = func.call @cc_make_string(%434, %435) : (!llvm.ptr, i64) -> i64
      %437 = llvm.mlir.addressof @str46 : !llvm.ptr
      %438 = arith.constant 17 : i64
      %439 = func.call @cc_make_string(%437, %438) : (!llvm.ptr, i64) -> i64
      %440 = func.call @cc_intern(%436, %439) : (i64, i64) -> i64
      %441 = func.call @cc_nil_value() : () -> i64
      %442 = func.call @cc_cons(%440, %441) : (i64, i64) -> i64
      %443 = func.call @cc_values_pack(%442) : (i64) -> i64
      %444 = func.call @cc_set_symbol_value(%440, %433) : (i64, i64) -> i64
      func.call @stack_push_pointer(%433) : (i64) -> ()
      %445 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %445 : i64
    }
    func.call @stack_push_pointer(%430) : (i64) -> ()
    %446 = func.call @stack_pop_pointer() : () -> i64
    %447 = func.call @cc_multiple_value_list(%446) : (i64) -> i64
    %448 = llvm.mlir.addressof @str47 : !llvm.ptr
    %449 = arith.constant 38 : i64
    %450 = func.call @cc_make_string(%448, %449) : (!llvm.ptr, i64) -> i64
    %451 = func.call @cc_nil_value() : () -> i64
    %452 = func.call @cc_intern(%450, %451) : (i64, i64) -> i64
    %453 = func.call @cc_nil_value() : () -> i64
    %454 = func.call @cc_cons(%452, %453) : (i64, i64) -> i64
    %455 = func.call @cc_values_pack(%454) : (i64) -> i64
    %456 = func.call @cc_symbol_value(%452) : (i64) -> i64
    %457 = llvm.mlir.addressof @str48 : !llvm.ptr
    %458 = arith.constant 40 : i64
    %459 = func.call @cc_make_string(%457, %458) : (!llvm.ptr, i64) -> i64
    %460 = func.call @cc_nil_value() : () -> i64
    %461 = func.call @cc_intern(%459, %460) : (i64, i64) -> i64
    %462 = func.call @cc_nil_value() : () -> i64
    %463 = func.call @cc_cons(%461, %462) : (i64, i64) -> i64
    %464 = func.call @cc_values_pack(%463) : (i64) -> i64
    %465 = func.call @cc_symbol_value(%461) : (i64) -> i64
    %466 = func.call @cc_nil_value() : () -> i64
    %467 = arith.cmpi ne, %456, %466 : i64
    %468 = scf.if %467 -> (i64) {
      scf.yield %465 : i64
    } else {
      scf.yield %447 : i64
    }
    %469 = func.call @cc_values_pack(%468) : (i64) -> i64
    func.call @stack_push_pointer(%469) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("op\0Ai1\0Ai2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_239118244118528*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_239118244118529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_239118244118529*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_239118244118529*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str8("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str9("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str10("BOOLE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETFLAG_239118244118529*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETVALUE_239118244118529*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETMVLIST_239118244118529*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str16("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETFLAG_239118244118530*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETVALUE_239118244118530*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETMVLIST_239118244118530*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str20("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str21("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str22("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str23("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str24("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str25("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str26("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str29("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str31("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str32("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str35("%FN%boole$\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str36("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str37("%FN%ENCODING-TEST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str38("%FN%boole$\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str39("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("%FN%ENCODING-TEST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str41("%FN%boole$\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str42("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str43("%FN%ENCODING-TEST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str44("%FN%boole$\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str45("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("%FN%ENCODING-TEST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str47("*__MLIR_BLOCK_RETFLAG_239118244118530*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str48("*__MLIR_BLOCK_RETMVLIST_239118244118530*\00") : !llvm.array<41 x i8>
}
