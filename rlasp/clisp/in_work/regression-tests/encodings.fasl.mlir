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
  func.func @"%FN%%string-char-codes"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 18 : i64
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
    %12 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %12) : (i64, i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @cc_nil_value() : () -> i64
    %15 = llvm.mlir.addressof @str2 : !llvm.ptr
    %16 = arith.constant 37 : i64
    %17 = func.call @cc_make_string(%15, %16) : (!llvm.ptr, i64) -> i64
    %18 = func.call @cc_nil_value() : () -> i64
    %19 = func.call @cc_intern(%17, %18) : (i64, i64) -> i64
    %20 = func.call @cc_nil_value() : () -> i64
    %21 = func.call @cc_cons(%19, %20) : (i64, i64) -> i64
    %22 = func.call @cc_values_pack(%21) : (i64) -> i64
    %23 = func.call @cc_set_symbol_value(%19, %14) : (i64, i64) -> i64
    %24 = llvm.mlir.addressof @str3 : !llvm.ptr
    %25 = arith.constant 38 : i64
    %26 = func.call @cc_make_string(%24, %25) : (!llvm.ptr, i64) -> i64
    %27 = func.call @cc_nil_value() : () -> i64
    %28 = func.call @cc_intern(%26, %27) : (i64, i64) -> i64
    %29 = func.call @cc_nil_value() : () -> i64
    %30 = func.call @cc_cons(%28, %29) : (i64, i64) -> i64
    %31 = func.call @cc_values_pack(%30) : (i64) -> i64
    %32 = func.call @cc_set_symbol_value(%28, %14) : (i64, i64) -> i64
    %33 = llvm.mlir.addressof @str4 : !llvm.ptr
    %34 = arith.constant 39 : i64
    %35 = func.call @cc_make_string(%33, %34) : (!llvm.ptr, i64) -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_intern(%35, %36) : (i64, i64) -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_cons(%37, %38) : (i64, i64) -> i64
    %40 = func.call @cc_values_pack(%39) : (i64) -> i64
    %41 = func.call @cc_set_symbol_value(%37, %14) : (i64, i64) -> i64
    %42 = func.call @cc_nil_value() : () -> i64
    %43 = llvm.mlir.addressof @str5 : !llvm.ptr
    %44 = arith.constant 37 : i64
    %45 = func.call @cc_make_string(%43, %44) : (!llvm.ptr, i64) -> i64
    %46 = func.call @cc_nil_value() : () -> i64
    %47 = func.call @cc_intern(%45, %46) : (i64, i64) -> i64
    %48 = func.call @cc_nil_value() : () -> i64
    %49 = func.call @cc_cons(%47, %48) : (i64, i64) -> i64
    %50 = func.call @cc_values_pack(%49) : (i64) -> i64
    %51 = func.call @cc_set_symbol_value(%47, %42) : (i64, i64) -> i64
    %52 = llvm.mlir.addressof @str6 : !llvm.ptr
    %53 = arith.constant 38 : i64
    %54 = func.call @cc_make_string(%52, %53) : (!llvm.ptr, i64) -> i64
    %55 = func.call @cc_nil_value() : () -> i64
    %56 = func.call @cc_intern(%54, %55) : (i64, i64) -> i64
    %57 = func.call @cc_nil_value() : () -> i64
    %58 = func.call @cc_cons(%56, %57) : (i64, i64) -> i64
    %59 = func.call @cc_values_pack(%58) : (i64) -> i64
    %60 = func.call @cc_set_symbol_value(%56, %42) : (i64, i64) -> i64
    %61 = llvm.mlir.addressof @str7 : !llvm.ptr
    %62 = arith.constant 39 : i64
    %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
    %64 = func.call @cc_nil_value() : () -> i64
    %65 = func.call @cc_intern(%63, %64) : (i64, i64) -> i64
    %66 = func.call @cc_nil_value() : () -> i64
    %67 = func.call @cc_cons(%65, %66) : (i64, i64) -> i64
    %68 = func.call @cc_values_pack(%67) : (i64) -> i64
    %69 = func.call @cc_set_symbol_value(%65, %42) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %70 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%13) : (i64) -> ()
    %71 = func.call @stack_pop_pointer() : () -> i64
    %72 = arith.constant 0 : i64
    func.call @stack_push_fixnum(%72) : (i64) -> ()
    %73 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %74 = func.call @stack_pop_pointer() : () -> i64
    %75 = func.call @cc_nil_value() : () -> i64
    %76 = func.call @cc_nil_value() : () -> i64
    %77 = func.call @cc_errorp(%75) : (i64) -> i64
    %78 = arith.cmpi ne, %77, %76 : i64
    %79 = scf.if %78 -> (i64) {
      scf.yield %75 : i64
    } else {
      %80 = func.call @cc_nil_value() : () -> i64
      %81 = llvm.mlir.addressof @str8 : !llvm.ptr
      %82 = arith.constant 37 : i64
      %83 = func.call @cc_make_string(%81, %82) : (!llvm.ptr, i64) -> i64
      %84 = func.call @cc_nil_value() : () -> i64
      %85 = func.call @cc_intern(%83, %84) : (i64, i64) -> i64
      %86 = func.call @cc_nil_value() : () -> i64
      %87 = func.call @cc_cons(%85, %86) : (i64, i64) -> i64
      %88 = func.call @cc_values_pack(%87) : (i64) -> i64
      %89 = func.call @cc_set_symbol_value(%85, %80) : (i64, i64) -> i64
      %90 = llvm.mlir.addressof @str9 : !llvm.ptr
      %91 = arith.constant 38 : i64
      %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
      %93 = func.call @cc_nil_value() : () -> i64
      %94 = func.call @cc_intern(%92, %93) : (i64, i64) -> i64
      %95 = func.call @cc_nil_value() : () -> i64
      %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
      %97 = func.call @cc_values_pack(%96) : (i64) -> i64
      %98 = func.call @cc_set_symbol_value(%94, %80) : (i64, i64) -> i64
      %99 = llvm.mlir.addressof @str10 : !llvm.ptr
      %100 = arith.constant 39 : i64
      %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
      %102 = func.call @cc_nil_value() : () -> i64
      %103 = func.call @cc_intern(%101, %102) : (i64, i64) -> i64
      %104 = func.call @cc_nil_value() : () -> i64
      %105 = func.call @cc_cons(%103, %104) : (i64, i64) -> i64
      %106 = func.call @cc_values_pack(%105) : (i64) -> i64
      %107 = func.call @cc_set_symbol_value(%103, %80) : (i64, i64) -> i64
      %108:3 = scf.while (%arg0 = %70, %arg1 = %74, %arg2 = %73) : (i64, i64, i64) -> (i64, i64, i64) {
        func.call @stack_push_pointer(%arg2) : (i64) -> ()
        %109 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%71) : (i64) -> ()
        %110 = func.call @stack_pop_pointer() : () -> i64
        %111 = func.call @cc_length(%110) : (i64) -> i64
        func.call @stack_push_pointer(%111) : (i64) -> ()
        %112 = func.call @stack_pop_pointer() : () -> i64
        %113 = arith.constant 1 : i1
        %115 = arith.constant 3 : i64
        %114 = arith.andi %109, %115 : i64
        %116 = arith.constant 0 : i64
        %117 = arith.cmpi eq, %114, %116 : i64
        %119 = arith.constant 3 : i64
        %118 = arith.andi %112, %119 : i64
        %120 = arith.constant 0 : i64
        %121 = arith.cmpi eq, %118, %120 : i64
        %122 = arith.andi %117, %121 : i1
        %123 = scf.if %122 -> (i1) {
          %124 = arith.constant 2 : i64
          %125 = arith.shrsi %109, %124 : i64
          %126 = arith.constant 2 : i64
          %127 = arith.shrsi %112, %126 : i64
          %128 = arith.cmpi slt, %125, %127 : i64
          scf.yield %128 : i1
        } else {
          %129 = func.call @cc_lt(%109, %112) : (i64, i64) -> i64
          %130 = func.call @cc_nil_value() : () -> i64
          %131 = arith.cmpi ne, %129, %130 : i64
          scf.yield %131 : i1
        }
        %132 = arith.andi %113, %123 : i1
        %133 = func.call @cc_nil_value() : () -> i64
        %134 = func.call @cc_t_value() : () -> i64
        %135 = scf.if %132 -> (i64) {
          scf.yield %134 : i64
        } else {
          scf.yield %133 : i64
        }
        func.call @stack_push_pointer(%135) : (i64) -> ()
        %136 = func.call @stack_pop_pointer() : () -> i64
        %137 = func.call @cc_nil_value() : () -> i64
        %138 = arith.cmpi ne, %136, %137 : i64
        %139 = func.call @cc_nil_value() : () -> i64
        %140 = llvm.mlir.addressof @str11 : !llvm.ptr
        %141 = arith.constant 37 : i64
        %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
        %143 = func.call @cc_nil_value() : () -> i64
        %144 = func.call @cc_intern(%142, %143) : (i64, i64) -> i64
        %145 = func.call @cc_nil_value() : () -> i64
        %146 = func.call @cc_cons(%144, %145) : (i64, i64) -> i64
        %147 = func.call @cc_values_pack(%146) : (i64) -> i64
        %148 = func.call @cc_symbol_value(%144) : (i64) -> i64
        %149 = arith.cmpi ne, %148, %139 : i64
        %150 = llvm.mlir.addressof @str12 : !llvm.ptr
        %151 = arith.constant 37 : i64
        %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
        %153 = func.call @cc_nil_value() : () -> i64
        %154 = func.call @cc_intern(%152, %153) : (i64, i64) -> i64
        %155 = func.call @cc_nil_value() : () -> i64
        %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
        %157 = func.call @cc_values_pack(%156) : (i64) -> i64
        %158 = func.call @cc_symbol_value(%154) : (i64) -> i64
        %159 = arith.cmpi ne, %158, %139 : i64
        %160 = arith.ori %149, %159 : i1
        %161 = llvm.mlir.addressof @str13 : !llvm.ptr
        %162 = arith.constant 37 : i64
        %163 = func.call @cc_make_string(%161, %162) : (!llvm.ptr, i64) -> i64
        %164 = func.call @cc_nil_value() : () -> i64
        %165 = func.call @cc_intern(%163, %164) : (i64, i64) -> i64
        %166 = func.call @cc_nil_value() : () -> i64
        %167 = func.call @cc_cons(%165, %166) : (i64, i64) -> i64
        %168 = func.call @cc_values_pack(%167) : (i64) -> i64
        %169 = func.call @cc_symbol_value(%165) : (i64) -> i64
        %170 = arith.cmpi ne, %169, %139 : i64
        %171 = arith.ori %160, %170 : i1
        %172 = arith.constant 0 : i1
        %173 = arith.cmpi eq, %171, %172 : i1
        %174 = arith.andi %138, %173 : i1
        scf.condition(%174) %arg0, %arg1, %arg2 : i64, i64, i64
      } do {
        ^bb0(%175: i64, %176: i64, %177: i64):
        %178 = func.call @cc_nil_value() : () -> i64
        %179 = func.call @cc_nil_value() : () -> i64
        %180 = func.call @cc_errorp(%178) : (i64) -> i64
        %181 = arith.cmpi ne, %180, %179 : i64
        %182:3 = scf.if %181 -> (i64, i64, i64) {
          scf.yield %178, %176, %175 : i64, i64, i64
        } else {
          func.call @stack_push_pointer(%71) : (i64) -> ()
          func.call @stack_push_pointer(%177) : (i64) -> ()
          %183 = func.call @stack_pop_pointer() : () -> i64
          %184 = func.call @stack_pop_pointer() : () -> i64
          %185 = func.call @cc_elt(%184, %183) : (i64, i64) -> i64
          func.call @stack_push_pointer(%185) : (i64) -> ()
          %186 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%186) : (i64) -> ()
          %187 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %187, %176, %186 : i64, i64, i64
        }
        %188 = func.call @cc_nil_value() : () -> i64
        %189 = func.call @cc_errorp(%182#0) : (i64) -> i64
        %190 = arith.cmpi ne, %189, %188 : i64
        %191:3 = scf.if %190 -> (i64, i64, i64) {
          scf.yield %182#0, %182#1, %182#2 : i64, i64, i64
        } else {
          func.call @stack_push_pointer(%182#1) : (i64) -> ()
          func.call @stack_push_pointer(%182#2) : (i64) -> ()
          %192 = func.call @stack_pop_pointer() : () -> i64
          %193 = func.call @cc_unbox_character(%192) : (i64) -> i64
          %194 = func.call @cc_box_fixnum(%193) : (i64) -> i64
          func.call @stack_push_pointer(%194) : (i64) -> ()
          %195 = func.call @stack_pop_pointer() : () -> i64
          %196 = func.call @cc_nil_value() : () -> i64
          %197 = func.call @cc_errorp(%195) : (i64) -> i64
          %198 = arith.cmpi ne, %197, %196 : i64
          %199 = arith.cmpi eq, %196, %196 : i64
          %200 = arith.andi %198, %199 : i1
          %201 = scf.if %200 -> (i64) {
            scf.yield %195 : i64
          } else {
            scf.yield %196 : i64
          }
          %202 = arith.cmpi ne, %201, %196 : i64
          scf.if %202 {
            func.call @stack_push_pointer(%201) : (i64) -> ()
          } else {
            %203 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%203) : (i64) -> ()
            func.call @stack_push_pointer(%195) : (i64) -> ()
            %204 = func.call @stack_pop_pointer() : () -> i64
            %205 = func.call @stack_pop_pointer() : () -> i64
            %206 = func.call @cc_cons(%204, %205) : (i64, i64) -> i64
            func.call @stack_push_pointer(%206) : (i64) -> ()
          }
          %207 = func.call @stack_pop_pointer() : () -> i64
          %208 = func.call @stack_pop_pointer() : () -> i64
          %209 = func.call @cc_append(%208, %207) : (i64, i64) -> i64
          func.call @stack_push_pointer(%209) : (i64) -> ()
          %210 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%210) : (i64) -> ()
          %211 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %211, %210, %182#2 : i64, i64, i64
        }
        func.call @stack_push_pointer(%191#0) : (i64) -> ()
        %212 = func.call @stack_depth() : () -> i64
        %213 = arith.constant 0 : i64
        %214 = arith.cmpi sgt, %212, %213 : i64
        scf.if %214 {
          %215 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%177) : (i64) -> ()
        %216 = func.call @stack_pop_pointer() : () -> i64
        %217 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%217) : (i64) -> ()
        %218 = func.call @stack_pop_pointer() : () -> i64
        %220 = arith.constant 3 : i64
        %219 = arith.andi %216, %220 : i64
        %221 = arith.constant 0 : i64
        %222 = arith.cmpi eq, %219, %221 : i64
        %224 = arith.constant 3 : i64
        %223 = arith.andi %218, %224 : i64
        %225 = arith.constant 0 : i64
        %226 = arith.cmpi eq, %223, %225 : i64
        %227 = arith.andi %222, %226 : i1
        %228 = scf.if %227 -> (i64) {
          %229 = arith.constant 2 : i64
          %230 = arith.shrsi %216, %229 : i64
          %231 = arith.constant 2 : i64
          %232 = arith.shrsi %218, %231 : i64
          %233 = arith.addi %230, %232 : i64
          %234 = arith.constant -2305843009213693952 : i64
          %235 = arith.constant 2305843009213693951 : i64
          %236 = arith.cmpi sge, %233, %234 : i64
          %237 = arith.cmpi sle, %233, %235 : i64
          %238 = arith.andi %236, %237 : i1
          %239 = scf.if %238 -> (i64) {
            %240 = arith.constant 2 : i64
            %241 = arith.shli %233, %240 : i64
            scf.yield %241 : i64
          } else {
            %242 = func.call @cc_add(%216, %218) : (i64, i64) -> i64
            scf.yield %242 : i64
          }
          scf.yield %239 : i64
        } else {
          %243 = func.call @cc_add(%216, %218) : (i64, i64) -> i64
          scf.yield %243 : i64
        }
        func.call @stack_push_pointer(%228) : (i64) -> ()
        %244 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%244) : (i64) -> ()
        %245 = func.call @stack_depth() : () -> i64
        %246 = arith.constant 0 : i64
        %247 = arith.cmpi sgt, %245, %246 : i64
        scf.if %247 {
          %248 = func.call @stack_pop_pointer() : () -> i64
        }
        scf.yield %191#2, %191#1, %244 : i64, i64, i64
      }
      func.call @stack_push_nil() : () -> ()
      %249 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%108#1) : (i64) -> ()
      %250 = func.call @stack_pop_pointer() : () -> i64
      %251 = func.call @cc_multiple_value_list(%250) : (i64) -> i64
      %252 = llvm.mlir.addressof @str14 : !llvm.ptr
      %253 = arith.constant 37 : i64
      %254 = func.call @cc_make_string(%252, %253) : (!llvm.ptr, i64) -> i64
      %255 = func.call @cc_nil_value() : () -> i64
      %256 = func.call @cc_intern(%254, %255) : (i64, i64) -> i64
      %257 = func.call @cc_nil_value() : () -> i64
      %258 = func.call @cc_cons(%256, %257) : (i64, i64) -> i64
      %259 = func.call @cc_values_pack(%258) : (i64) -> i64
      %260 = func.call @cc_symbol_value(%256) : (i64) -> i64
      %261 = llvm.mlir.addressof @str15 : !llvm.ptr
      %262 = arith.constant 38 : i64
      %263 = func.call @cc_make_string(%261, %262) : (!llvm.ptr, i64) -> i64
      %264 = func.call @cc_nil_value() : () -> i64
      %265 = func.call @cc_intern(%263, %264) : (i64, i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_cons(%265, %266) : (i64, i64) -> i64
      %268 = func.call @cc_values_pack(%267) : (i64) -> i64
      %269 = func.call @cc_symbol_value(%265) : (i64) -> i64
      %270 = llvm.mlir.addressof @str16 : !llvm.ptr
      %271 = arith.constant 39 : i64
      %272 = func.call @cc_make_string(%270, %271) : (!llvm.ptr, i64) -> i64
      %273 = func.call @cc_nil_value() : () -> i64
      %274 = func.call @cc_intern(%272, %273) : (i64, i64) -> i64
      %275 = func.call @cc_nil_value() : () -> i64
      %276 = func.call @cc_cons(%274, %275) : (i64, i64) -> i64
      %277 = func.call @cc_values_pack(%276) : (i64) -> i64
      %278 = func.call @cc_symbol_value(%274) : (i64) -> i64
      %279 = func.call @cc_nil_value() : () -> i64
      %280 = arith.cmpi ne, %260, %279 : i64
      %281 = scf.if %280 -> (i64) {
        scf.yield %278 : i64
      } else {
        scf.yield %251 : i64
      }
      %282 = func.call @cc_values_pack(%281) : (i64) -> i64
      func.call @stack_push_pointer(%282) : (i64) -> ()
      %283 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %283 : i64
    }
    func.call @stack_push_pointer(%79) : (i64) -> ()
    %284 = func.call @stack_pop_pointer() : () -> i64
    %285 = func.call @cc_multiple_value_list(%284) : (i64) -> i64
    %286 = llvm.mlir.addressof @str17 : !llvm.ptr
    %287 = arith.constant 37 : i64
    %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
    %289 = func.call @cc_nil_value() : () -> i64
    %290 = func.call @cc_intern(%288, %289) : (i64, i64) -> i64
    %291 = func.call @cc_nil_value() : () -> i64
    %292 = func.call @cc_cons(%290, %291) : (i64, i64) -> i64
    %293 = func.call @cc_values_pack(%292) : (i64) -> i64
    %294 = func.call @cc_symbol_value(%290) : (i64) -> i64
    %295 = llvm.mlir.addressof @str18 : !llvm.ptr
    %296 = arith.constant 38 : i64
    %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
    %298 = func.call @cc_nil_value() : () -> i64
    %299 = func.call @cc_intern(%297, %298) : (i64, i64) -> i64
    %300 = func.call @cc_nil_value() : () -> i64
    %301 = func.call @cc_cons(%299, %300) : (i64, i64) -> i64
    %302 = func.call @cc_values_pack(%301) : (i64) -> i64
    %303 = func.call @cc_symbol_value(%299) : (i64) -> i64
    %304 = llvm.mlir.addressof @str19 : !llvm.ptr
    %305 = arith.constant 39 : i64
    %306 = func.call @cc_make_string(%304, %305) : (!llvm.ptr, i64) -> i64
    %307 = func.call @cc_nil_value() : () -> i64
    %308 = func.call @cc_intern(%306, %307) : (i64, i64) -> i64
    %309 = func.call @cc_nil_value() : () -> i64
    %310 = func.call @cc_cons(%308, %309) : (i64, i64) -> i64
    %311 = func.call @cc_values_pack(%310) : (i64) -> i64
    %312 = func.call @cc_symbol_value(%308) : (i64) -> i64
    %313 = func.call @cc_nil_value() : () -> i64
    %314 = arith.cmpi ne, %294, %313 : i64
    %315 = scf.if %314 -> (i64) {
      scf.yield %312 : i64
    } else {
      scf.yield %285 : i64
    }
    %316 = func.call @cc_values_pack(%315) : (i64) -> i64
    func.call @stack_push_pointer(%316) : (i64) -> ()
    %317 = func.call @stack_pop_pointer() : () -> i64
    %318 = func.call @cc_multiple_value_list(%317) : (i64) -> i64
    %319 = llvm.mlir.addressof @str20 : !llvm.ptr
    %320 = arith.constant 37 : i64
    %321 = func.call @cc_make_string(%319, %320) : (!llvm.ptr, i64) -> i64
    %322 = func.call @cc_nil_value() : () -> i64
    %323 = func.call @cc_intern(%321, %322) : (i64, i64) -> i64
    %324 = func.call @cc_nil_value() : () -> i64
    %325 = func.call @cc_cons(%323, %324) : (i64, i64) -> i64
    %326 = func.call @cc_values_pack(%325) : (i64) -> i64
    %327 = func.call @cc_symbol_value(%323) : (i64) -> i64
    %328 = llvm.mlir.addressof @str21 : !llvm.ptr
    %329 = arith.constant 39 : i64
    %330 = func.call @cc_make_string(%328, %329) : (!llvm.ptr, i64) -> i64
    %331 = func.call @cc_nil_value() : () -> i64
    %332 = func.call @cc_intern(%330, %331) : (i64, i64) -> i64
    %333 = func.call @cc_nil_value() : () -> i64
    %334 = func.call @cc_cons(%332, %333) : (i64, i64) -> i64
    %335 = func.call @cc_values_pack(%334) : (i64) -> i64
    %336 = func.call @cc_symbol_value(%332) : (i64) -> i64
    %337 = func.call @cc_nil_value() : () -> i64
    %338 = arith.cmpi ne, %327, %337 : i64
    %339 = scf.if %338 -> (i64) {
      scf.yield %336 : i64
    } else {
      scf.yield %318 : i64
    }
    %340 = func.call @cc_values_pack(%339) : (i64) -> i64
    func.call @stack_push_pointer(%340) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %341 = llvm.mlir.addressof @str22 : !llvm.ptr
    %342 = arith.constant 6 : i64
    %343 = func.call @cc_make_string(%341, %342) : (!llvm.ptr, i64) -> i64
    %344 = func.call @cc_nil_value() : () -> i64
    %345 = func.call @cc_intern(%343, %344) : (i64, i64) -> i64
    %346 = func.call @cc_nil_value() : () -> i64
    %347 = func.call @cc_cons(%345, %346) : (i64, i64) -> i64
    %348 = func.call @cc_values_pack(%347) : (i64) -> i64
    %349 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%345, %349) : (i64, i64) -> ()
    %350 = func.call @cc_nil_value() : () -> i64
    %351 = llvm.mlir.addressof @str23 : !llvm.ptr
    %352 = arith.constant 37 : i64
    %353 = func.call @cc_make_string(%351, %352) : (!llvm.ptr, i64) -> i64
    %354 = func.call @cc_nil_value() : () -> i64
    %355 = func.call @cc_intern(%353, %354) : (i64, i64) -> i64
    %356 = func.call @cc_nil_value() : () -> i64
    %357 = func.call @cc_cons(%355, %356) : (i64, i64) -> i64
    %358 = func.call @cc_values_pack(%357) : (i64) -> i64
    %359 = func.call @cc_set_symbol_value(%355, %350) : (i64, i64) -> i64
    %360 = llvm.mlir.addressof @str24 : !llvm.ptr
    %361 = arith.constant 38 : i64
    %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
    %363 = func.call @cc_nil_value() : () -> i64
    %364 = func.call @cc_intern(%362, %363) : (i64, i64) -> i64
    %365 = func.call @cc_nil_value() : () -> i64
    %366 = func.call @cc_cons(%364, %365) : (i64, i64) -> i64
    %367 = func.call @cc_values_pack(%366) : (i64) -> i64
    %368 = func.call @cc_set_symbol_value(%364, %350) : (i64, i64) -> i64
    %369 = llvm.mlir.addressof @str25 : !llvm.ptr
    %370 = arith.constant 39 : i64
    %371 = func.call @cc_make_string(%369, %370) : (!llvm.ptr, i64) -> i64
    %372 = func.call @cc_nil_value() : () -> i64
    %373 = func.call @cc_intern(%371, %372) : (i64, i64) -> i64
    %374 = func.call @cc_nil_value() : () -> i64
    %375 = func.call @cc_cons(%373, %374) : (i64, i64) -> i64
    %376 = func.call @cc_values_pack(%375) : (i64) -> i64
    %377 = func.call @cc_set_symbol_value(%373, %350) : (i64, i64) -> i64
    %378 = func.call @cc_nil_value() : () -> i64
    %379 = func.call @cc_nil_value() : () -> i64
    %380 = func.call @cc_errorp(%378) : (i64) -> i64
    %381 = arith.cmpi ne, %380, %379 : i64
    %382 = scf.if %381 -> (i64) {
      scf.yield %378 : i64
    } else {
      %383 = llvm.mlir.addressof @str26 : !llvm.ptr
      %384 = arith.constant 11 : i64
      %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
      %386 = func.call @cc_nil_value() : () -> i64
      %387 = func.call @cc_intern(%385, %386) : (i64, i64) -> i64
      %388 = func.call @cc_nil_value() : () -> i64
      %389 = func.call @cc_cons(%387, %388) : (i64, i64) -> i64
      %390 = func.call @cc_values_pack(%389) : (i64) -> i64
      func.call @stack_push_pointer(%387) : (i64) -> ()
      %391 = func.call @stack_pop_pointer() : () -> i64
      %392 = func.call @cc_in_package(%391) : (i64) -> i64
      func.call @stack_push_pointer(%392) : (i64) -> ()
      %393 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %393 : i64
    }
    %394 = func.call @cc_nil_value() : () -> i64
    %395 = func.call @cc_errorp(%382) : (i64) -> i64
    %396 = arith.cmpi ne, %395, %394 : i64
    %397 = scf.if %396 -> (i64) {
      scf.yield %382 : i64
    } else {
      %398 = func.call @cc_nil_value() : () -> i64
      %399 = func.call @cc_nil_value() : () -> i64
      %400 = func.call @cc_errorp(%398) : (i64) -> i64
      %401 = arith.cmpi ne, %400, %399 : i64
      %402 = scf.if %401 -> (i64) {
        scf.yield %398 : i64
      } else {
        %403 = llvm.mlir.addressof @str27 : !llvm.ptr
        %404 = arith.constant 9 : i64
        %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
        %406 = llvm.mlir.addressof @str28 : !llvm.ptr
        %407 = arith.constant 7 : i64
        %408 = func.call @cc_make_string(%406, %407) : (!llvm.ptr, i64) -> i64
        %409 = func.call @cc_intern(%405, %408) : (i64, i64) -> i64
        %410 = func.call @cc_nil_value() : () -> i64
        %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
        %412 = func.call @cc_values_pack(%411) : (i64) -> i64
        func.call @stack_push_pointer(%409) : (i64) -> ()
        %413 = func.call @stack_pop_pointer() : () -> i64
        %414 = func.call @cc_nil_value() : () -> i64
        %415 = func.call @cc_errorp(%413) : (i64) -> i64
        %416 = arith.cmpi ne, %415, %414 : i64
        %417 = arith.cmpi eq, %414, %414 : i64
        %418 = arith.andi %416, %417 : i1
        %419 = scf.if %418 -> (i64) {
          scf.yield %413 : i64
        } else {
          scf.yield %414 : i64
        }
        %420 = arith.cmpi ne, %419, %414 : i64
        scf.if %420 {
          func.call @stack_push_pointer(%419) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%413) : (i64) -> ()
          %421 = llvm.mlir.addressof @str29 : !llvm.ptr
          %422 = func.call @cc_make_function_ref_const(%421) : (!llvm.ptr) -> i64
          %423 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%422, %423) : (i64, i64) -> ()
        }
        %424 = func.call @stack_pop_pointer() : () -> i64
        %425 = func.call @cc_nil_value() : () -> i64
        %426 = arith.cmpi ne, %424, %425 : i64
        scf.if %426 {
          %427 = llvm.mlir.addressof @str30 : !llvm.ptr
          %428 = arith.constant 9 : i64
          %429 = func.call @cc_make_string(%427, %428) : (!llvm.ptr, i64) -> i64
          %430 = llvm.mlir.addressof @str31 : !llvm.ptr
          %431 = arith.constant 7 : i64
          %432 = func.call @cc_make_string(%430, %431) : (!llvm.ptr, i64) -> i64
          %433 = func.call @cc_intern(%429, %432) : (i64, i64) -> i64
          %434 = func.call @cc_nil_value() : () -> i64
          %435 = func.call @cc_cons(%433, %434) : (i64, i64) -> i64
          %436 = func.call @cc_values_pack(%435) : (i64) -> i64
          func.call @stack_push_pointer(%433) : (i64) -> ()
          %437 = func.call @stack_pop_pointer() : () -> i64
          %438 = func.call @cc_nil_value() : () -> i64
          %439 = func.call @cc_errorp(%437) : (i64) -> i64
          %440 = arith.cmpi ne, %439, %438 : i64
          %441 = arith.cmpi eq, %438, %438 : i64
          %442 = arith.andi %440, %441 : i1
          %443 = scf.if %442 -> (i64) {
            scf.yield %437 : i64
          } else {
            scf.yield %438 : i64
          }
          %444 = arith.cmpi ne, %443, %438 : i64
          scf.if %444 {
            func.call @stack_push_pointer(%443) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%437) : (i64) -> ()
            %445 = llvm.mlir.addressof @str32 : !llvm.ptr
            %446 = func.call @cc_make_function_ref_const(%445) : (!llvm.ptr) -> i64
            %447 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%446, %447) : (i64, i64) -> ()
          }
        } else {
          %448 = llvm.mlir.addressof @str33 : !llvm.ptr
          %449 = arith.constant 9 : i64
          %450 = func.call @cc_make_string(%448, %449) : (!llvm.ptr, i64) -> i64
          %451 = llvm.mlir.addressof @str34 : !llvm.ptr
          %452 = arith.constant 7 : i64
          %453 = func.call @cc_make_string(%451, %452) : (!llvm.ptr, i64) -> i64
          %454 = func.call @cc_intern(%450, %453) : (i64, i64) -> i64
          %455 = func.call @cc_nil_value() : () -> i64
          %456 = func.call @cc_cons(%454, %455) : (i64, i64) -> i64
          %457 = func.call @cc_values_pack(%456) : (i64) -> i64
          func.call @stack_push_pointer(%454) : (i64) -> ()
          %458 = func.call @stack_pop_pointer() : () -> i64
          %459 = func.call @cc_nil_value() : () -> i64
          %460 = func.call @cc_errorp(%458) : (i64) -> i64
          %461 = arith.cmpi ne, %460, %459 : i64
          %462 = arith.cmpi eq, %459, %459 : i64
          %463 = arith.andi %461, %462 : i1
          %464 = scf.if %463 -> (i64) {
            scf.yield %458 : i64
          } else {
            scf.yield %459 : i64
          }
          %465 = arith.cmpi ne, %464, %459 : i64
          scf.if %465 {
            func.call @stack_push_pointer(%464) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%458) : (i64) -> ()
            %466 = llvm.mlir.addressof @str35 : !llvm.ptr
            %467 = func.call @cc_make_function_ref_const(%466) : (!llvm.ptr) -> i64
            %468 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%467, %468) : (i64, i64) -> ()
          }
        }
        %469 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %469 : i64
      }
      %470 = func.call @cc_nil_value() : () -> i64
      %471 = func.call @cc_errorp(%402) : (i64) -> i64
      %472 = arith.cmpi ne, %471, %470 : i64
      %473 = scf.if %472 -> (i64) {
        scf.yield %402 : i64
      } else {
        %474 = llvm.mlir.addressof @str36 : !llvm.ptr
        %475 = arith.constant 2 : i64
        %476 = func.call @cc_make_string(%474, %475) : (!llvm.ptr, i64) -> i64
        %477 = llvm.mlir.addressof @str37 : !llvm.ptr
        %478 = arith.constant 7 : i64
        %479 = func.call @cc_make_string(%477, %478) : (!llvm.ptr, i64) -> i64
        %480 = func.call @cc_intern(%476, %479) : (i64, i64) -> i64
        %481 = func.call @cc_nil_value() : () -> i64
        %482 = func.call @cc_cons(%480, %481) : (i64, i64) -> i64
        %483 = func.call @cc_values_pack(%482) : (i64) -> i64
        func.call @stack_push_pointer(%480) : (i64) -> ()
        %484 = func.call @stack_pop_pointer() : () -> i64
        %485 = llvm.mlir.addressof @str38 : !llvm.ptr
        %486 = arith.constant 9 : i64
        %487 = func.call @cc_make_string(%485, %486) : (!llvm.ptr, i64) -> i64
        %488 = llvm.mlir.addressof @str39 : !llvm.ptr
        %489 = arith.constant 7 : i64
        %490 = func.call @cc_make_string(%488, %489) : (!llvm.ptr, i64) -> i64
        %491 = func.call @cc_intern(%487, %490) : (i64, i64) -> i64
        %492 = func.call @cc_nil_value() : () -> i64
        %493 = func.call @cc_cons(%491, %492) : (i64, i64) -> i64
        %494 = func.call @cc_values_pack(%493) : (i64) -> i64
        func.call @stack_push_pointer(%491) : (i64) -> ()
        %495 = func.call @stack_pop_pointer() : () -> i64
        %496 = func.call @cc_nil_value() : () -> i64
        %497 = func.call @cc_errorp(%484) : (i64) -> i64
        %498 = arith.cmpi ne, %497, %496 : i64
        %499 = arith.cmpi eq, %496, %496 : i64
        %500 = arith.andi %498, %499 : i1
        %501 = scf.if %500 -> (i64) {
          scf.yield %484 : i64
        } else {
          scf.yield %496 : i64
        }
        %502 = func.call @cc_errorp(%495) : (i64) -> i64
        %503 = arith.cmpi ne, %502, %496 : i64
        %504 = arith.cmpi eq, %501, %496 : i64
        %505 = arith.andi %503, %504 : i1
        %506 = scf.if %505 -> (i64) {
          scf.yield %495 : i64
        } else {
          scf.yield %501 : i64
        }
        %507 = arith.cmpi ne, %506, %496 : i64
        scf.if %507 {
          func.call @stack_push_pointer(%506) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%484) : (i64) -> ()
          func.call @stack_push_pointer(%495) : (i64) -> ()
          %508 = llvm.mlir.addressof @str40 : !llvm.ptr
          %509 = func.call @cc_make_function_ref_const(%508) : (!llvm.ptr) -> i64
          %510 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%509, %510) : (i64, i64) -> ()
        }
        %511 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %511 : i64
      }
      %512 = func.call @cc_nil_value() : () -> i64
      %513 = func.call @cc_errorp(%473) : (i64) -> i64
      %514 = arith.cmpi ne, %513, %512 : i64
      %515 = scf.if %514 -> (i64) {
        scf.yield %473 : i64
      } else {
        %516 = llvm.mlir.addressof @str41 : !llvm.ptr
        %517 = arith.constant 9 : i64
        %518 = func.call @cc_make_string(%516, %517) : (!llvm.ptr, i64) -> i64
        %519 = llvm.mlir.addressof @str42 : !llvm.ptr
        %520 = arith.constant 7 : i64
        %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
        %522 = func.call @cc_intern(%518, %521) : (i64, i64) -> i64
        %523 = func.call @cc_nil_value() : () -> i64
        %524 = func.call @cc_cons(%522, %523) : (i64, i64) -> i64
        %525 = func.call @cc_values_pack(%524) : (i64) -> i64
        func.call @stack_push_pointer(%522) : (i64) -> ()
        %526 = func.call @stack_pop_pointer() : () -> i64
        %527 = func.call @cc_nil_value() : () -> i64
        %528 = func.call @cc_errorp(%526) : (i64) -> i64
        %529 = arith.cmpi ne, %528, %527 : i64
        %530 = arith.cmpi eq, %527, %527 : i64
        %531 = arith.andi %529, %530 : i1
        %532 = scf.if %531 -> (i64) {
          scf.yield %526 : i64
        } else {
          scf.yield %527 : i64
        }
        %533 = arith.cmpi ne, %532, %527 : i64
        scf.if %533 {
          func.call @stack_push_pointer(%532) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%526) : (i64) -> ()
          %534 = llvm.mlir.addressof @str43 : !llvm.ptr
          %535 = func.call @cc_make_function_ref_const(%534) : (!llvm.ptr) -> i64
          %536 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%535, %536) : (i64, i64) -> ()
        }
        %537 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %537 : i64
      }
      func.call @stack_push_pointer(%515) : (i64) -> ()
      %538 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %538 : i64
    }
    %539 = func.call @cc_nil_value() : () -> i64
    %540 = func.call @cc_errorp(%397) : (i64) -> i64
    %541 = arith.cmpi ne, %540, %539 : i64
    %542 = scf.if %541 -> (i64) {
      scf.yield %397 : i64
    } else {
      %543 = llvm.mlir.addressof @str44 : !llvm.ptr
      %544 = arith.constant 15 : i64
      %545 = func.call @cc_make_string(%543, %544) : (!llvm.ptr, i64) -> i64
      %546 = llvm.mlir.addressof @str45 : !llvm.ptr
      %547 = arith.constant 9 : i64
      %548 = func.call @cc_make_string(%546, %547) : (!llvm.ptr, i64) -> i64
      %549 = func.call @cc_intern(%545, %548) : (i64, i64) -> i64
      %550 = func.call @cc_nil_value() : () -> i64
      %551 = func.call @cc_cons(%549, %550) : (i64, i64) -> i64
      %552 = func.call @cc_values_pack(%551) : (i64) -> i64
      func.call @stack_push_pointer(%549) : (i64) -> ()
      %553 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %553 : i64
    }
    %554 = func.call @cc_nil_value() : () -> i64
    %555 = func.call @cc_errorp(%542) : (i64) -> i64
    %556 = arith.cmpi ne, %555, %554 : i64
    %557 = scf.if %556 -> (i64) {
      scf.yield %542 : i64
    } else {
      %558 = llvm.mlir.addressof @str46 : !llvm.ptr
      %559 = func.call @cc_make_function_ref_const(%558) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%559) : (i64) -> ()
      %560 = func.call @stack_pop_pointer() : () -> i64
      %561 = llvm.mlir.addressof @str47 : !llvm.ptr
      %562 = arith.constant 18 : i64
      %563 = func.call @cc_make_string(%561, %562) : (!llvm.ptr, i64) -> i64
      %564 = llvm.mlir.addressof @str48 : !llvm.ptr
      %565 = arith.constant 15 : i64
      %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
      %567 = func.call @cc_intern(%563, %566) : (i64, i64) -> i64
      %568 = func.call @cc_nil_value() : () -> i64
      %569 = func.call @cc_cons(%567, %568) : (i64, i64) -> i64
      %570 = func.call @cc_values_pack(%569) : (i64) -> i64
      %571 = func.call @cc_set_symbol_value(%567, %560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%560) : (i64) -> ()
      %572 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %572 : i64
    }
    %573 = func.call @cc_nil_value() : () -> i64
    %574 = func.call @cc_errorp(%557) : (i64) -> i64
    %575 = arith.cmpi ne, %574, %573 : i64
    %576 = scf.if %575 -> (i64) {
      scf.yield %557 : i64
    } else {
      %577 = llvm.mlir.addressof @str49 : !llvm.ptr
      %578 = func.call @cc_make_function_ref_const(%577) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%578) : (i64) -> ()
      %579 = func.call @stack_pop_pointer() : () -> i64
      %580 = llvm.mlir.addressof @str50 : !llvm.ptr
      %581 = arith.constant 18 : i64
      %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
      %583 = llvm.mlir.addressof @str51 : !llvm.ptr
      %584 = arith.constant 15 : i64
      %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
      %586 = func.call @cc_intern(%582, %585) : (i64, i64) -> i64
      %587 = func.call @cc_nil_value() : () -> i64
      %588 = func.call @cc_cons(%586, %587) : (i64, i64) -> i64
      %589 = func.call @cc_values_pack(%588) : (i64) -> i64
      %590 = func.call @cc_set_symbol_value(%586, %579) : (i64, i64) -> i64
      func.call @stack_push_pointer(%579) : (i64) -> ()
      %591 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %591 : i64
    }
    %592 = func.call @cc_nil_value() : () -> i64
    %593 = func.call @cc_errorp(%576) : (i64) -> i64
    %594 = arith.cmpi ne, %593, %592 : i64
    %595 = scf.if %594 -> (i64) {
      scf.yield %576 : i64
    } else {
      %596 = llvm.mlir.addressof @str52 : !llvm.ptr
      %597 = func.call @cc_make_function_ref_const(%596) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%597) : (i64) -> ()
      %598 = func.call @stack_pop_pointer() : () -> i64
      %599 = llvm.mlir.addressof @str53 : !llvm.ptr
      %600 = arith.constant 18 : i64
      %601 = func.call @cc_make_string(%599, %600) : (!llvm.ptr, i64) -> i64
      %602 = llvm.mlir.addressof @str54 : !llvm.ptr
      %603 = arith.constant 15 : i64
      %604 = func.call @cc_make_string(%602, %603) : (!llvm.ptr, i64) -> i64
      %605 = func.call @cc_intern(%601, %604) : (i64, i64) -> i64
      %606 = func.call @cc_nil_value() : () -> i64
      %607 = func.call @cc_cons(%605, %606) : (i64, i64) -> i64
      %608 = func.call @cc_values_pack(%607) : (i64) -> i64
      %609 = func.call @cc_set_symbol_value(%605, %598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%598) : (i64) -> ()
      %610 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %610 : i64
    }
    %611 = func.call @cc_nil_value() : () -> i64
    %612 = func.call @cc_errorp(%595) : (i64) -> i64
    %613 = arith.cmpi ne, %612, %611 : i64
    %614 = scf.if %613 -> (i64) {
      scf.yield %595 : i64
    } else {
      %615 = llvm.mlir.addressof @str55 : !llvm.ptr
      %616 = func.call @cc_make_function_ref_const(%615) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%616) : (i64) -> ()
      %617 = func.call @stack_pop_pointer() : () -> i64
      %618 = llvm.mlir.addressof @str56 : !llvm.ptr
      %619 = arith.constant 18 : i64
      %620 = func.call @cc_make_string(%618, %619) : (!llvm.ptr, i64) -> i64
      %621 = llvm.mlir.addressof @str57 : !llvm.ptr
      %622 = arith.constant 15 : i64
      %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
      %624 = func.call @cc_intern(%620, %623) : (i64, i64) -> i64
      %625 = func.call @cc_nil_value() : () -> i64
      %626 = func.call @cc_cons(%624, %625) : (i64, i64) -> i64
      %627 = func.call @cc_values_pack(%626) : (i64) -> i64
      %628 = func.call @cc_set_symbol_value(%624, %617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%617) : (i64) -> ()
      %629 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %629 : i64
    }
    %630 = func.call @cc_nil_value() : () -> i64
    %631 = func.call @cc_errorp(%614) : (i64) -> i64
    %632 = arith.cmpi ne, %631, %630 : i64
    %633 = scf.if %632 -> (i64) {
      scf.yield %614 : i64
    } else {
      %634 = llvm.mlir.addressof @str58 : !llvm.ptr
      %635 = arith.constant 16 : i64
      %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
      %637 = func.call @cc_nil_value() : () -> i64
      %638 = func.call @cc_intern(%636, %637) : (i64, i64) -> i64
      %639 = func.call @cc_nil_value() : () -> i64
      %640 = func.call @cc_cons(%638, %639) : (i64, i64) -> i64
      %641 = func.call @cc_values_pack(%640) : (i64) -> i64
      func.call @stack_push_pointer(%638) : (i64) -> ()
      %642 = func.call @stack_pop_pointer() : () -> i64
      %643 = llvm.mlir.addressof @str59 : !llvm.ptr
      %644 = arith.constant 3 : i64
      %645 = func.call @cc_make_string(%643, %644) : (!llvm.ptr, i64) -> i64
      %646 = func.call @cc_nil_value() : () -> i64
      %647 = func.call @cc_intern(%645, %646) : (i64, i64) -> i64
      %648 = func.call @cc_nil_value() : () -> i64
      %649 = func.call @cc_cons(%647, %648) : (i64, i64) -> i64
      %650 = func.call @cc_values_pack(%649) : (i64) -> i64
      func.call @stack_push_pointer(%647) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %651 = llvm.mlir.addressof @str60 : !llvm.ptr
      %652 = arith.constant 4 : i64
      %653 = func.call @cc_make_string(%651, %652) : (!llvm.ptr, i64) -> i64
      %654 = llvm.mlir.addressof @str61 : !llvm.ptr
      %655 = arith.constant 11 : i64
      %656 = func.call @cc_make_string(%654, %655) : (!llvm.ptr, i64) -> i64
      %657 = func.call @cc_intern(%653, %656) : (i64, i64) -> i64
      %658 = func.call @cc_nil_value() : () -> i64
      %659 = func.call @cc_cons(%657, %658) : (i64, i64) -> i64
      %660 = func.call @cc_values_pack(%659) : (i64) -> i64
      func.call @stack_push_pointer(%657) : (i64) -> ()
      %661 = llvm.mlir.addressof @str62 : !llvm.ptr
      %662 = arith.constant 8 : i64
      %663 = func.call @cc_make_string(%661, %662) : (!llvm.ptr, i64) -> i64
      %664 = llvm.mlir.addressof @str63 : !llvm.ptr
      %665 = arith.constant 11 : i64
      %666 = func.call @cc_make_string(%664, %665) : (!llvm.ptr, i64) -> i64
      %667 = func.call @cc_intern(%663, %666) : (i64, i64) -> i64
      %668 = func.call @cc_nil_value() : () -> i64
      %669 = func.call @cc_cons(%667, %668) : (i64, i64) -> i64
      %670 = func.call @cc_values_pack(%669) : (i64) -> i64
      func.call @stack_push_pointer(%667) : (i64) -> ()
      %671 = llvm.mlir.addressof @str64 : !llvm.ptr
      %672 = arith.constant 42 : i64
      %673 = func.call @cc_make_string(%671, %672) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%673) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %674 = func.call @stack_pop_pointer() : () -> i64
      %675 = func.call @stack_pop_pointer() : () -> i64
      %676 = func.call @cc_cons(%675, %674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%676) : (i64) -> ()
      %677 = func.call @stack_pop_pointer() : () -> i64
      %678 = func.call @stack_pop_pointer() : () -> i64
      %679 = func.call @cc_cons(%678, %677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %680 = func.call @stack_pop_pointer() : () -> i64
      %681 = func.call @stack_pop_pointer() : () -> i64
      %682 = func.call @cc_cons(%681, %680) : (i64, i64) -> i64
      func.call @stack_push_pointer(%682) : (i64) -> ()
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @stack_pop_pointer() : () -> i64
      %685 = func.call @cc_cons(%684, %683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%685) : (i64) -> ()
      %686 = llvm.mlir.addressof @str65 : !llvm.ptr
      %687 = arith.constant 18 : i64
      %688 = func.call @cc_make_string(%686, %687) : (!llvm.ptr, i64) -> i64
      %689 = func.call @cc_nil_value() : () -> i64
      %690 = func.call @cc_intern(%688, %689) : (i64, i64) -> i64
      %691 = func.call @cc_nil_value() : () -> i64
      %692 = func.call @cc_cons(%690, %691) : (i64, i64) -> i64
      %693 = func.call @cc_values_pack(%692) : (i64) -> i64
      func.call @stack_push_pointer(%690) : (i64) -> ()
      %694 = llvm.mlir.addressof @str66 : !llvm.ptr
      %695 = arith.constant 15 : i64
      %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
      %697 = llvm.mlir.addressof @str67 : !llvm.ptr
      %698 = arith.constant 9 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      %700 = func.call @cc_intern(%696, %699) : (i64, i64) -> i64
      %701 = func.call @cc_nil_value() : () -> i64
      %702 = func.call @cc_cons(%700, %701) : (i64, i64) -> i64
      %703 = func.call @cc_values_pack(%702) : (i64) -> i64
      func.call @stack_push_pointer(%700) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %704 = func.call @stack_pop_pointer() : () -> i64
      %705 = func.call @stack_pop_pointer() : () -> i64
      %706 = func.call @cc_cons(%705, %704) : (i64, i64) -> i64
      func.call @stack_push_pointer(%706) : (i64) -> ()
      %707 = func.call @stack_pop_pointer() : () -> i64
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @cc_cons(%708, %707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%709) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @cc_cons(%711, %710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %713 = func.call @stack_pop_pointer() : () -> i64
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = func.call @cc_cons(%714, %713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%715) : (i64) -> ()
      %716 = func.call @stack_pop_pointer() : () -> i64
      %717 = func.call @stack_pop_pointer() : () -> i64
      %718 = func.call @cc_cons(%717, %716) : (i64, i64) -> i64
      func.call @stack_push_pointer(%718) : (i64) -> ()
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = func.call @stack_pop_pointer() : () -> i64
      %721 = func.call @cc_cons(%720, %719) : (i64, i64) -> i64
      func.call @stack_push_pointer(%721) : (i64) -> ()
      %722 = func.call @stack_pop_pointer() : () -> i64
      %780 = arith.constant 57937766645764 : i64
      %781 = arith.constant 0 : i64
      %782 = func.call @cc_make_closure(%780, %781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%782) : (i64) -> ()
      %783 = func.call @stack_pop_pointer() : () -> i64
      %784 = arith.constant 955 : i64
      func.call @stack_push_fixnum(%784) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %785 = func.call @stack_pop_pointer() : () -> i64
      %786 = func.call @stack_pop_pointer() : () -> i64
      %787 = func.call @cc_cons(%786, %785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = func.call @stack_pop_pointer() : () -> i64
      %790 = func.call @cc_cons(%789, %788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%790) : (i64) -> ()
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = llvm.mlir.addressof @str73 : !llvm.ptr
      %793 = arith.constant 11 : i64
      %794 = func.call @cc_make_string(%792, %793) : (!llvm.ptr, i64) -> i64
      %795 = llvm.mlir.addressof @str74 : !llvm.ptr
      %796 = arith.constant 7 : i64
      %797 = func.call @cc_make_string(%795, %796) : (!llvm.ptr, i64) -> i64
      %798 = func.call @cc_intern(%794, %797) : (i64, i64) -> i64
      %799 = func.call @cc_nil_value() : () -> i64
      %800 = func.call @cc_cons(%798, %799) : (i64, i64) -> i64
      %801 = func.call @cc_values_pack(%800) : (i64) -> i64
      func.call @stack_push_pointer(%798) : (i64) -> ()
      %802 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %803 = func.call @stack_pop_pointer() : () -> i64
      %804 = llvm.mlir.addressof @str75 : !llvm.ptr
      %805 = arith.constant 4 : i64
      %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
      %807 = llvm.mlir.addressof @str76 : !llvm.ptr
      %808 = arith.constant 7 : i64
      %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
      %810 = func.call @cc_intern(%806, %809) : (i64, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_cons(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_values_pack(%812) : (i64) -> i64
      func.call @stack_push_pointer(%810) : (i64) -> ()
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = llvm.mlir.addressof @str77 : !llvm.ptr
      %816 = arith.constant 6 : i64
      %817 = func.call @cc_make_string(%815, %816) : (!llvm.ptr, i64) -> i64
      %818 = func.call @cc_nil_value() : () -> i64
      %819 = func.call @cc_intern(%817, %818) : (i64, i64) -> i64
      %820 = func.call @cc_nil_value() : () -> i64
      %821 = func.call @cc_cons(%819, %820) : (i64, i64) -> i64
      %822 = func.call @cc_values_pack(%821) : (i64) -> i64
      func.call @stack_push_pointer(%819) : (i64) -> ()
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @cc_nil_value() : () -> i64
      %825 = func.call @cc_errorp(%642) : (i64) -> i64
      %826 = arith.cmpi ne, %825, %824 : i64
      %827 = arith.cmpi eq, %824, %824 : i64
      %828 = arith.andi %826, %827 : i1
      %829 = scf.if %828 -> (i64) {
        scf.yield %642 : i64
      } else {
        scf.yield %824 : i64
      }
      %830 = func.call @cc_errorp(%722) : (i64) -> i64
      %831 = arith.cmpi ne, %830, %824 : i64
      %832 = arith.cmpi eq, %829, %824 : i64
      %833 = arith.andi %831, %832 : i1
      %834 = scf.if %833 -> (i64) {
        scf.yield %722 : i64
      } else {
        scf.yield %829 : i64
      }
      %835 = func.call @cc_errorp(%783) : (i64) -> i64
      %836 = arith.cmpi ne, %835, %824 : i64
      %837 = arith.cmpi eq, %834, %824 : i64
      %838 = arith.andi %836, %837 : i1
      %839 = scf.if %838 -> (i64) {
        scf.yield %783 : i64
      } else {
        scf.yield %834 : i64
      }
      %840 = func.call @cc_errorp(%791) : (i64) -> i64
      %841 = arith.cmpi ne, %840, %824 : i64
      %842 = arith.cmpi eq, %839, %824 : i64
      %843 = arith.andi %841, %842 : i1
      %844 = scf.if %843 -> (i64) {
        scf.yield %791 : i64
      } else {
        scf.yield %839 : i64
      }
      %845 = func.call @cc_errorp(%802) : (i64) -> i64
      %846 = arith.cmpi ne, %845, %824 : i64
      %847 = arith.cmpi eq, %844, %824 : i64
      %848 = arith.andi %846, %847 : i1
      %849 = scf.if %848 -> (i64) {
        scf.yield %802 : i64
      } else {
        scf.yield %844 : i64
      }
      %850 = func.call @cc_errorp(%803) : (i64) -> i64
      %851 = arith.cmpi ne, %850, %824 : i64
      %852 = arith.cmpi eq, %849, %824 : i64
      %853 = arith.andi %851, %852 : i1
      %854 = scf.if %853 -> (i64) {
        scf.yield %803 : i64
      } else {
        scf.yield %849 : i64
      }
      %855 = func.call @cc_errorp(%814) : (i64) -> i64
      %856 = arith.cmpi ne, %855, %824 : i64
      %857 = arith.cmpi eq, %854, %824 : i64
      %858 = arith.andi %856, %857 : i1
      %859 = scf.if %858 -> (i64) {
        scf.yield %814 : i64
      } else {
        scf.yield %854 : i64
      }
      %860 = func.call @cc_errorp(%823) : (i64) -> i64
      %861 = arith.cmpi ne, %860, %824 : i64
      %862 = arith.cmpi eq, %859, %824 : i64
      %863 = arith.andi %861, %862 : i1
      %864 = scf.if %863 -> (i64) {
        scf.yield %823 : i64
      } else {
        scf.yield %859 : i64
      }
      %865 = arith.cmpi ne, %864, %824 : i64
      scf.if %865 {
        func.call @stack_push_pointer(%864) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%642) : (i64) -> ()
        func.call @stack_push_pointer(%722) : (i64) -> ()
        func.call @stack_push_pointer(%783) : (i64) -> ()
        func.call @stack_push_pointer(%791) : (i64) -> ()
        func.call @stack_push_pointer(%802) : (i64) -> ()
        func.call @stack_push_pointer(%803) : (i64) -> ()
        func.call @stack_push_pointer(%814) : (i64) -> ()
        func.call @stack_push_pointer(%823) : (i64) -> ()
        %866 = llvm.mlir.addressof @str78 : !llvm.ptr
        %867 = func.call @cc_make_function_ref_const(%866) : (!llvm.ptr) -> i64
        %868 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%867, %868) : (i64, i64) -> ()
      }
      %869 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %869 : i64
    }
    %870 = func.call @cc_nil_value() : () -> i64
    %871 = func.call @cc_errorp(%633) : (i64) -> i64
    %872 = arith.cmpi ne, %871, %870 : i64
    %873 = scf.if %872 -> (i64) {
      scf.yield %633 : i64
    } else {
      %874 = llvm.mlir.addressof @str79 : !llvm.ptr
      %875 = arith.constant 14 : i64
      %876 = func.call @cc_make_string(%874, %875) : (!llvm.ptr, i64) -> i64
      %877 = func.call @cc_nil_value() : () -> i64
      %878 = func.call @cc_intern(%876, %877) : (i64, i64) -> i64
      %879 = func.call @cc_nil_value() : () -> i64
      %880 = func.call @cc_cons(%878, %879) : (i64, i64) -> i64
      %881 = func.call @cc_values_pack(%880) : (i64) -> i64
      func.call @stack_push_pointer(%878) : (i64) -> ()
      %882 = func.call @stack_pop_pointer() : () -> i64
      %883 = llvm.mlir.addressof @str80 : !llvm.ptr
      %884 = arith.constant 3 : i64
      %885 = func.call @cc_make_string(%883, %884) : (!llvm.ptr, i64) -> i64
      %886 = func.call @cc_nil_value() : () -> i64
      %887 = func.call @cc_intern(%885, %886) : (i64, i64) -> i64
      %888 = func.call @cc_nil_value() : () -> i64
      %889 = func.call @cc_cons(%887, %888) : (i64, i64) -> i64
      %890 = func.call @cc_values_pack(%889) : (i64) -> i64
      func.call @stack_push_pointer(%887) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %891 = llvm.mlir.addressof @str81 : !llvm.ptr
      %892 = arith.constant 4 : i64
      %893 = func.call @cc_make_string(%891, %892) : (!llvm.ptr, i64) -> i64
      %894 = llvm.mlir.addressof @str82 : !llvm.ptr
      %895 = arith.constant 11 : i64
      %896 = func.call @cc_make_string(%894, %895) : (!llvm.ptr, i64) -> i64
      %897 = func.call @cc_intern(%893, %896) : (i64, i64) -> i64
      %898 = func.call @cc_nil_value() : () -> i64
      %899 = func.call @cc_cons(%897, %898) : (i64, i64) -> i64
      %900 = func.call @cc_values_pack(%899) : (i64) -> i64
      func.call @stack_push_pointer(%897) : (i64) -> ()
      %901 = llvm.mlir.addressof @str83 : !llvm.ptr
      %902 = arith.constant 8 : i64
      %903 = func.call @cc_make_string(%901, %902) : (!llvm.ptr, i64) -> i64
      %904 = llvm.mlir.addressof @str84 : !llvm.ptr
      %905 = arith.constant 11 : i64
      %906 = func.call @cc_make_string(%904, %905) : (!llvm.ptr, i64) -> i64
      %907 = func.call @cc_intern(%903, %906) : (i64, i64) -> i64
      %908 = func.call @cc_nil_value() : () -> i64
      %909 = func.call @cc_cons(%907, %908) : (i64, i64) -> i64
      %910 = func.call @cc_values_pack(%909) : (i64) -> i64
      func.call @stack_push_pointer(%907) : (i64) -> ()
      %911 = llvm.mlir.addressof @str85 : !llvm.ptr
      %912 = arith.constant 42 : i64
      %913 = func.call @cc_make_string(%911, %912) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%913) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %914 = func.call @stack_pop_pointer() : () -> i64
      %915 = func.call @stack_pop_pointer() : () -> i64
      %916 = func.call @cc_cons(%915, %914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%916) : (i64) -> ()
      %917 = func.call @stack_pop_pointer() : () -> i64
      %918 = func.call @stack_pop_pointer() : () -> i64
      %919 = func.call @cc_cons(%918, %917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%919) : (i64) -> ()
      %920 = llvm.mlir.addressof @str86 : !llvm.ptr
      %921 = arith.constant 15 : i64
      %922 = func.call @cc_make_string(%920, %921) : (!llvm.ptr, i64) -> i64
      %923 = llvm.mlir.addressof @str87 : !llvm.ptr
      %924 = arith.constant 7 : i64
      %925 = func.call @cc_make_string(%923, %924) : (!llvm.ptr, i64) -> i64
      %926 = func.call @cc_intern(%922, %925) : (i64, i64) -> i64
      %927 = func.call @cc_nil_value() : () -> i64
      %928 = func.call @cc_cons(%926, %927) : (i64, i64) -> i64
      %929 = func.call @cc_values_pack(%928) : (i64) -> i64
      func.call @stack_push_pointer(%926) : (i64) -> ()
      %930 = llvm.mlir.addressof @str88 : !llvm.ptr
      %931 = arith.constant 5 : i64
      %932 = func.call @cc_make_string(%930, %931) : (!llvm.ptr, i64) -> i64
      %933 = llvm.mlir.addressof @str89 : !llvm.ptr
      %934 = arith.constant 7 : i64
      %935 = func.call @cc_make_string(%933, %934) : (!llvm.ptr, i64) -> i64
      %936 = func.call @cc_intern(%932, %935) : (i64, i64) -> i64
      %937 = func.call @cc_nil_value() : () -> i64
      %938 = func.call @cc_cons(%936, %937) : (i64, i64) -> i64
      %939 = func.call @cc_values_pack(%938) : (i64) -> i64
      func.call @stack_push_pointer(%936) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %940 = func.call @stack_pop_pointer() : () -> i64
      %941 = func.call @stack_pop_pointer() : () -> i64
      %942 = func.call @cc_cons(%941, %940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%942) : (i64) -> ()
      %943 = func.call @stack_pop_pointer() : () -> i64
      %944 = func.call @stack_pop_pointer() : () -> i64
      %945 = func.call @cc_cons(%944, %943) : (i64, i64) -> i64
      func.call @stack_push_pointer(%945) : (i64) -> ()
      %946 = func.call @stack_pop_pointer() : () -> i64
      %947 = func.call @stack_pop_pointer() : () -> i64
      %948 = func.call @cc_cons(%947, %946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%948) : (i64) -> ()
      %949 = func.call @stack_pop_pointer() : () -> i64
      %950 = func.call @stack_pop_pointer() : () -> i64
      %951 = func.call @cc_cons(%950, %949) : (i64, i64) -> i64
      func.call @stack_push_pointer(%951) : (i64) -> ()
      %952 = llvm.mlir.addressof @str90 : !llvm.ptr
      %953 = arith.constant 18 : i64
      %954 = func.call @cc_make_string(%952, %953) : (!llvm.ptr, i64) -> i64
      %955 = func.call @cc_nil_value() : () -> i64
      %956 = func.call @cc_intern(%954, %955) : (i64, i64) -> i64
      %957 = func.call @cc_nil_value() : () -> i64
      %958 = func.call @cc_cons(%956, %957) : (i64, i64) -> i64
      %959 = func.call @cc_values_pack(%958) : (i64) -> i64
      func.call @stack_push_pointer(%956) : (i64) -> ()
      %960 = llvm.mlir.addressof @str91 : !llvm.ptr
      %961 = arith.constant 15 : i64
      %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
      %963 = llvm.mlir.addressof @str92 : !llvm.ptr
      %964 = arith.constant 9 : i64
      %965 = func.call @cc_make_string(%963, %964) : (!llvm.ptr, i64) -> i64
      %966 = func.call @cc_intern(%962, %965) : (i64, i64) -> i64
      %967 = func.call @cc_nil_value() : () -> i64
      %968 = func.call @cc_cons(%966, %967) : (i64, i64) -> i64
      %969 = func.call @cc_values_pack(%968) : (i64) -> i64
      func.call @stack_push_pointer(%966) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %970 = func.call @stack_pop_pointer() : () -> i64
      %971 = func.call @stack_pop_pointer() : () -> i64
      %972 = func.call @cc_cons(%971, %970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%972) : (i64) -> ()
      %973 = func.call @stack_pop_pointer() : () -> i64
      %974 = func.call @stack_pop_pointer() : () -> i64
      %975 = func.call @cc_cons(%974, %973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%975) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %976 = func.call @stack_pop_pointer() : () -> i64
      %977 = func.call @stack_pop_pointer() : () -> i64
      %978 = func.call @cc_cons(%977, %976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%978) : (i64) -> ()
      %979 = func.call @stack_pop_pointer() : () -> i64
      %980 = func.call @stack_pop_pointer() : () -> i64
      %981 = func.call @cc_cons(%980, %979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%981) : (i64) -> ()
      %982 = func.call @stack_pop_pointer() : () -> i64
      %983 = func.call @stack_pop_pointer() : () -> i64
      %984 = func.call @cc_cons(%983, %982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%984) : (i64) -> ()
      %985 = func.call @stack_pop_pointer() : () -> i64
      %986 = func.call @stack_pop_pointer() : () -> i64
      %987 = func.call @cc_cons(%986, %985) : (i64, i64) -> i64
      func.call @stack_push_pointer(%987) : (i64) -> ()
      %988 = func.call @stack_pop_pointer() : () -> i64
      %1070 = arith.constant 57937766645765 : i64
      %1071 = arith.constant 0 : i64
      %1072 = func.call @cc_make_closure(%1070, %1071) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1072) : (i64) -> ()
      %1073 = func.call @stack_pop_pointer() : () -> i64
      %1074 = arith.constant 955 : i64
      func.call @stack_push_fixnum(%1074) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1075 = func.call @stack_pop_pointer() : () -> i64
      %1076 = func.call @stack_pop_pointer() : () -> i64
      %1077 = func.call @cc_cons(%1076, %1075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1077) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1078 = func.call @stack_pop_pointer() : () -> i64
      %1079 = func.call @stack_pop_pointer() : () -> i64
      %1080 = func.call @cc_cons(%1079, %1078) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1080) : (i64) -> ()
      %1081 = func.call @stack_pop_pointer() : () -> i64
      %1082 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1083 = arith.constant 11 : i64
      %1084 = func.call @cc_make_string(%1082, %1083) : (!llvm.ptr, i64) -> i64
      %1085 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1086 = arith.constant 7 : i64
      %1087 = func.call @cc_make_string(%1085, %1086) : (!llvm.ptr, i64) -> i64
      %1088 = func.call @cc_intern(%1084, %1087) : (i64, i64) -> i64
      %1089 = func.call @cc_nil_value() : () -> i64
      %1090 = func.call @cc_cons(%1088, %1089) : (i64, i64) -> i64
      %1091 = func.call @cc_values_pack(%1090) : (i64) -> i64
      func.call @stack_push_pointer(%1088) : (i64) -> ()
      %1092 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1093 = func.call @stack_pop_pointer() : () -> i64
      %1094 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1095 = arith.constant 4 : i64
      %1096 = func.call @cc_make_string(%1094, %1095) : (!llvm.ptr, i64) -> i64
      %1097 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1098 = arith.constant 7 : i64
      %1099 = func.call @cc_make_string(%1097, %1098) : (!llvm.ptr, i64) -> i64
      %1100 = func.call @cc_intern(%1096, %1099) : (i64, i64) -> i64
      %1101 = func.call @cc_nil_value() : () -> i64
      %1102 = func.call @cc_cons(%1100, %1101) : (i64, i64) -> i64
      %1103 = func.call @cc_values_pack(%1102) : (i64) -> i64
      func.call @stack_push_pointer(%1100) : (i64) -> ()
      %1104 = func.call @stack_pop_pointer() : () -> i64
      %1105 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1106 = arith.constant 6 : i64
      %1107 = func.call @cc_make_string(%1105, %1106) : (!llvm.ptr, i64) -> i64
      %1108 = func.call @cc_nil_value() : () -> i64
      %1109 = func.call @cc_intern(%1107, %1108) : (i64, i64) -> i64
      %1110 = func.call @cc_nil_value() : () -> i64
      %1111 = func.call @cc_cons(%1109, %1110) : (i64, i64) -> i64
      %1112 = func.call @cc_values_pack(%1111) : (i64) -> i64
      func.call @stack_push_pointer(%1109) : (i64) -> ()
      %1113 = func.call @stack_pop_pointer() : () -> i64
      %1114 = func.call @cc_nil_value() : () -> i64
      %1115 = func.call @cc_errorp(%882) : (i64) -> i64
      %1116 = arith.cmpi ne, %1115, %1114 : i64
      %1117 = arith.cmpi eq, %1114, %1114 : i64
      %1118 = arith.andi %1116, %1117 : i1
      %1119 = scf.if %1118 -> (i64) {
        scf.yield %882 : i64
      } else {
        scf.yield %1114 : i64
      }
      %1120 = func.call @cc_errorp(%988) : (i64) -> i64
      %1121 = arith.cmpi ne, %1120, %1114 : i64
      %1122 = arith.cmpi eq, %1119, %1114 : i64
      %1123 = arith.andi %1121, %1122 : i1
      %1124 = scf.if %1123 -> (i64) {
        scf.yield %988 : i64
      } else {
        scf.yield %1119 : i64
      }
      %1125 = func.call @cc_errorp(%1073) : (i64) -> i64
      %1126 = arith.cmpi ne, %1125, %1114 : i64
      %1127 = arith.cmpi eq, %1124, %1114 : i64
      %1128 = arith.andi %1126, %1127 : i1
      %1129 = scf.if %1128 -> (i64) {
        scf.yield %1073 : i64
      } else {
        scf.yield %1124 : i64
      }
      %1130 = func.call @cc_errorp(%1081) : (i64) -> i64
      %1131 = arith.cmpi ne, %1130, %1114 : i64
      %1132 = arith.cmpi eq, %1129, %1114 : i64
      %1133 = arith.andi %1131, %1132 : i1
      %1134 = scf.if %1133 -> (i64) {
        scf.yield %1081 : i64
      } else {
        scf.yield %1129 : i64
      }
      %1135 = func.call @cc_errorp(%1092) : (i64) -> i64
      %1136 = arith.cmpi ne, %1135, %1114 : i64
      %1137 = arith.cmpi eq, %1134, %1114 : i64
      %1138 = arith.andi %1136, %1137 : i1
      %1139 = scf.if %1138 -> (i64) {
        scf.yield %1092 : i64
      } else {
        scf.yield %1134 : i64
      }
      %1140 = func.call @cc_errorp(%1093) : (i64) -> i64
      %1141 = arith.cmpi ne, %1140, %1114 : i64
      %1142 = arith.cmpi eq, %1139, %1114 : i64
      %1143 = arith.andi %1141, %1142 : i1
      %1144 = scf.if %1143 -> (i64) {
        scf.yield %1093 : i64
      } else {
        scf.yield %1139 : i64
      }
      %1145 = func.call @cc_errorp(%1104) : (i64) -> i64
      %1146 = arith.cmpi ne, %1145, %1114 : i64
      %1147 = arith.cmpi eq, %1144, %1114 : i64
      %1148 = arith.andi %1146, %1147 : i1
      %1149 = scf.if %1148 -> (i64) {
        scf.yield %1104 : i64
      } else {
        scf.yield %1144 : i64
      }
      %1150 = func.call @cc_errorp(%1113) : (i64) -> i64
      %1151 = arith.cmpi ne, %1150, %1114 : i64
      %1152 = arith.cmpi eq, %1149, %1114 : i64
      %1153 = arith.andi %1151, %1152 : i1
      %1154 = scf.if %1153 -> (i64) {
        scf.yield %1113 : i64
      } else {
        scf.yield %1149 : i64
      }
      %1155 = arith.cmpi ne, %1154, %1114 : i64
      scf.if %1155 {
        func.call @stack_push_pointer(%1154) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%882) : (i64) -> ()
        func.call @stack_push_pointer(%988) : (i64) -> ()
        func.call @stack_push_pointer(%1073) : (i64) -> ()
        func.call @stack_push_pointer(%1081) : (i64) -> ()
        func.call @stack_push_pointer(%1092) : (i64) -> ()
        func.call @stack_push_pointer(%1093) : (i64) -> ()
        func.call @stack_push_pointer(%1104) : (i64) -> ()
        func.call @stack_push_pointer(%1113) : (i64) -> ()
        %1156 = llvm.mlir.addressof @str107 : !llvm.ptr
        %1157 = func.call @cc_make_function_ref_const(%1156) : (!llvm.ptr) -> i64
        %1158 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1157, %1158) : (i64, i64) -> ()
      }
      %1159 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1159 : i64
    }
    %1160 = func.call @cc_nil_value() : () -> i64
    %1161 = func.call @cc_errorp(%873) : (i64) -> i64
    %1162 = arith.cmpi ne, %1161, %1160 : i64
    %1163 = scf.if %1162 -> (i64) {
      scf.yield %873 : i64
    } else {
      %1164 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1165 = arith.constant 16 : i64
      %1166 = func.call @cc_make_string(%1164, %1165) : (!llvm.ptr, i64) -> i64
      %1167 = func.call @cc_nil_value() : () -> i64
      %1168 = func.call @cc_intern(%1166, %1167) : (i64, i64) -> i64
      %1169 = func.call @cc_nil_value() : () -> i64
      %1170 = func.call @cc_cons(%1168, %1169) : (i64, i64) -> i64
      %1171 = func.call @cc_values_pack(%1170) : (i64) -> i64
      func.call @stack_push_pointer(%1168) : (i64) -> ()
      %1172 = func.call @stack_pop_pointer() : () -> i64
      %1173 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1174 = arith.constant 3 : i64
      %1175 = func.call @cc_make_string(%1173, %1174) : (!llvm.ptr, i64) -> i64
      %1176 = func.call @cc_nil_value() : () -> i64
      %1177 = func.call @cc_intern(%1175, %1176) : (i64, i64) -> i64
      %1178 = func.call @cc_nil_value() : () -> i64
      %1179 = func.call @cc_cons(%1177, %1178) : (i64, i64) -> i64
      %1180 = func.call @cc_values_pack(%1179) : (i64) -> i64
      func.call @stack_push_pointer(%1177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1181 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1182 = arith.constant 4 : i64
      %1183 = func.call @cc_make_string(%1181, %1182) : (!llvm.ptr, i64) -> i64
      %1184 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1185 = arith.constant 11 : i64
      %1186 = func.call @cc_make_string(%1184, %1185) : (!llvm.ptr, i64) -> i64
      %1187 = func.call @cc_intern(%1183, %1186) : (i64, i64) -> i64
      %1188 = func.call @cc_nil_value() : () -> i64
      %1189 = func.call @cc_cons(%1187, %1188) : (i64, i64) -> i64
      %1190 = func.call @cc_values_pack(%1189) : (i64) -> i64
      func.call @stack_push_pointer(%1187) : (i64) -> ()
      %1191 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1192 = arith.constant 8 : i64
      %1193 = func.call @cc_make_string(%1191, %1192) : (!llvm.ptr, i64) -> i64
      %1194 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1195 = arith.constant 11 : i64
      %1196 = func.call @cc_make_string(%1194, %1195) : (!llvm.ptr, i64) -> i64
      %1197 = func.call @cc_intern(%1193, %1196) : (i64, i64) -> i64
      %1198 = func.call @cc_nil_value() : () -> i64
      %1199 = func.call @cc_cons(%1197, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_values_pack(%1199) : (i64) -> i64
      func.call @stack_push_pointer(%1197) : (i64) -> ()
      %1201 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1202 = arith.constant 42 : i64
      %1203 = func.call @cc_make_string(%1201, %1202) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1203) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1204 = func.call @stack_pop_pointer() : () -> i64
      %1205 = func.call @stack_pop_pointer() : () -> i64
      %1206 = func.call @cc_cons(%1205, %1204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1206) : (i64) -> ()
      %1207 = func.call @stack_pop_pointer() : () -> i64
      %1208 = func.call @stack_pop_pointer() : () -> i64
      %1209 = func.call @cc_cons(%1208, %1207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1209) : (i64) -> ()
      %1210 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1211 = arith.constant 15 : i64
      %1212 = func.call @cc_make_string(%1210, %1211) : (!llvm.ptr, i64) -> i64
      %1213 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1214 = arith.constant 7 : i64
      %1215 = func.call @cc_make_string(%1213, %1214) : (!llvm.ptr, i64) -> i64
      %1216 = func.call @cc_intern(%1212, %1215) : (i64, i64) -> i64
      %1217 = func.call @cc_nil_value() : () -> i64
      %1218 = func.call @cc_cons(%1216, %1217) : (i64, i64) -> i64
      %1219 = func.call @cc_values_pack(%1218) : (i64) -> i64
      func.call @stack_push_pointer(%1216) : (i64) -> ()
      %1220 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1221 = arith.constant 7 : i64
      %1222 = func.call @cc_make_string(%1220, %1221) : (!llvm.ptr, i64) -> i64
      %1223 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1224 = arith.constant 7 : i64
      %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
      %1226 = func.call @cc_intern(%1222, %1225) : (i64, i64) -> i64
      %1227 = func.call @cc_nil_value() : () -> i64
      %1228 = func.call @cc_cons(%1226, %1227) : (i64, i64) -> i64
      %1229 = func.call @cc_values_pack(%1228) : (i64) -> i64
      func.call @stack_push_pointer(%1226) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1230 = func.call @stack_pop_pointer() : () -> i64
      %1231 = func.call @stack_pop_pointer() : () -> i64
      %1232 = func.call @cc_cons(%1231, %1230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1232) : (i64) -> ()
      %1233 = func.call @stack_pop_pointer() : () -> i64
      %1234 = func.call @stack_pop_pointer() : () -> i64
      %1235 = func.call @cc_cons(%1234, %1233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1235) : (i64) -> ()
      %1236 = func.call @stack_pop_pointer() : () -> i64
      %1237 = func.call @stack_pop_pointer() : () -> i64
      %1238 = func.call @cc_cons(%1237, %1236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1238) : (i64) -> ()
      %1239 = func.call @stack_pop_pointer() : () -> i64
      %1240 = func.call @stack_pop_pointer() : () -> i64
      %1241 = func.call @cc_cons(%1240, %1239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1241) : (i64) -> ()
      %1242 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1243 = arith.constant 18 : i64
      %1244 = func.call @cc_make_string(%1242, %1243) : (!llvm.ptr, i64) -> i64
      %1245 = func.call @cc_nil_value() : () -> i64
      %1246 = func.call @cc_intern(%1244, %1245) : (i64, i64) -> i64
      %1247 = func.call @cc_nil_value() : () -> i64
      %1248 = func.call @cc_cons(%1246, %1247) : (i64, i64) -> i64
      %1249 = func.call @cc_values_pack(%1248) : (i64) -> i64
      func.call @stack_push_pointer(%1246) : (i64) -> ()
      %1250 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1251 = arith.constant 15 : i64
      %1252 = func.call @cc_make_string(%1250, %1251) : (!llvm.ptr, i64) -> i64
      %1253 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1254 = arith.constant 9 : i64
      %1255 = func.call @cc_make_string(%1253, %1254) : (!llvm.ptr, i64) -> i64
      %1256 = func.call @cc_intern(%1252, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_nil_value() : () -> i64
      %1258 = func.call @cc_cons(%1256, %1257) : (i64, i64) -> i64
      %1259 = func.call @cc_values_pack(%1258) : (i64) -> i64
      func.call @stack_push_pointer(%1256) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1260 = func.call @stack_pop_pointer() : () -> i64
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = func.call @cc_cons(%1261, %1260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1262) : (i64) -> ()
      %1263 = func.call @stack_pop_pointer() : () -> i64
      %1264 = func.call @stack_pop_pointer() : () -> i64
      %1265 = func.call @cc_cons(%1264, %1263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1265) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1266 = func.call @stack_pop_pointer() : () -> i64
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @cc_cons(%1267, %1266) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1268) : (i64) -> ()
      %1269 = func.call @stack_pop_pointer() : () -> i64
      %1270 = func.call @stack_pop_pointer() : () -> i64
      %1271 = func.call @cc_cons(%1270, %1269) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1271) : (i64) -> ()
      %1272 = func.call @stack_pop_pointer() : () -> i64
      %1273 = func.call @stack_pop_pointer() : () -> i64
      %1274 = func.call @cc_cons(%1273, %1272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1274) : (i64) -> ()
      %1275 = func.call @stack_pop_pointer() : () -> i64
      %1276 = func.call @stack_pop_pointer() : () -> i64
      %1277 = func.call @cc_cons(%1276, %1275) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1277) : (i64) -> ()
      %1278 = func.call @stack_pop_pointer() : () -> i64
      %1360 = arith.constant 57937766645766 : i64
      %1361 = arith.constant 0 : i64
      %1362 = func.call @cc_make_closure(%1360, %1361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1362) : (i64) -> ()
      %1363 = func.call @stack_pop_pointer() : () -> i64
      %1364 = arith.constant 206 : i64
      func.call @stack_push_fixnum(%1364) : (i64) -> ()
      %1365 = arith.constant 187 : i64
      func.call @stack_push_fixnum(%1365) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1366 = func.call @stack_pop_pointer() : () -> i64
      %1367 = func.call @stack_pop_pointer() : () -> i64
      %1368 = func.call @cc_cons(%1367, %1366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1368) : (i64) -> ()
      %1369 = func.call @stack_pop_pointer() : () -> i64
      %1370 = func.call @stack_pop_pointer() : () -> i64
      %1371 = func.call @cc_cons(%1370, %1369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1371) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1372 = func.call @stack_pop_pointer() : () -> i64
      %1373 = func.call @stack_pop_pointer() : () -> i64
      %1374 = func.call @cc_cons(%1373, %1372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1374) : (i64) -> ()
      %1375 = func.call @stack_pop_pointer() : () -> i64
      %1376 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1377 = arith.constant 11 : i64
      %1378 = func.call @cc_make_string(%1376, %1377) : (!llvm.ptr, i64) -> i64
      %1379 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1380 = arith.constant 7 : i64
      %1381 = func.call @cc_make_string(%1379, %1380) : (!llvm.ptr, i64) -> i64
      %1382 = func.call @cc_intern(%1378, %1381) : (i64, i64) -> i64
      %1383 = func.call @cc_nil_value() : () -> i64
      %1384 = func.call @cc_cons(%1382, %1383) : (i64, i64) -> i64
      %1385 = func.call @cc_values_pack(%1384) : (i64) -> i64
      func.call @stack_push_pointer(%1382) : (i64) -> ()
      %1386 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1389 = arith.constant 4 : i64
      %1390 = func.call @cc_make_string(%1388, %1389) : (!llvm.ptr, i64) -> i64
      %1391 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1392 = arith.constant 7 : i64
      %1393 = func.call @cc_make_string(%1391, %1392) : (!llvm.ptr, i64) -> i64
      %1394 = func.call @cc_intern(%1390, %1393) : (i64, i64) -> i64
      %1395 = func.call @cc_nil_value() : () -> i64
      %1396 = func.call @cc_cons(%1394, %1395) : (i64, i64) -> i64
      %1397 = func.call @cc_values_pack(%1396) : (i64) -> i64
      func.call @stack_push_pointer(%1394) : (i64) -> ()
      %1398 = func.call @stack_pop_pointer() : () -> i64
      %1399 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1400 = arith.constant 6 : i64
      %1401 = func.call @cc_make_string(%1399, %1400) : (!llvm.ptr, i64) -> i64
      %1402 = func.call @cc_nil_value() : () -> i64
      %1403 = func.call @cc_intern(%1401, %1402) : (i64, i64) -> i64
      %1404 = func.call @cc_nil_value() : () -> i64
      %1405 = func.call @cc_cons(%1403, %1404) : (i64, i64) -> i64
      %1406 = func.call @cc_values_pack(%1405) : (i64) -> i64
      func.call @stack_push_pointer(%1403) : (i64) -> ()
      %1407 = func.call @stack_pop_pointer() : () -> i64
      %1408 = func.call @cc_nil_value() : () -> i64
      %1409 = func.call @cc_errorp(%1172) : (i64) -> i64
      %1410 = arith.cmpi ne, %1409, %1408 : i64
      %1411 = arith.cmpi eq, %1408, %1408 : i64
      %1412 = arith.andi %1410, %1411 : i1
      %1413 = scf.if %1412 -> (i64) {
        scf.yield %1172 : i64
      } else {
        scf.yield %1408 : i64
      }
      %1414 = func.call @cc_errorp(%1278) : (i64) -> i64
      %1415 = arith.cmpi ne, %1414, %1408 : i64
      %1416 = arith.cmpi eq, %1413, %1408 : i64
      %1417 = arith.andi %1415, %1416 : i1
      %1418 = scf.if %1417 -> (i64) {
        scf.yield %1278 : i64
      } else {
        scf.yield %1413 : i64
      }
      %1419 = func.call @cc_errorp(%1363) : (i64) -> i64
      %1420 = arith.cmpi ne, %1419, %1408 : i64
      %1421 = arith.cmpi eq, %1418, %1408 : i64
      %1422 = arith.andi %1420, %1421 : i1
      %1423 = scf.if %1422 -> (i64) {
        scf.yield %1363 : i64
      } else {
        scf.yield %1418 : i64
      }
      %1424 = func.call @cc_errorp(%1375) : (i64) -> i64
      %1425 = arith.cmpi ne, %1424, %1408 : i64
      %1426 = arith.cmpi eq, %1423, %1408 : i64
      %1427 = arith.andi %1425, %1426 : i1
      %1428 = scf.if %1427 -> (i64) {
        scf.yield %1375 : i64
      } else {
        scf.yield %1423 : i64
      }
      %1429 = func.call @cc_errorp(%1386) : (i64) -> i64
      %1430 = arith.cmpi ne, %1429, %1408 : i64
      %1431 = arith.cmpi eq, %1428, %1408 : i64
      %1432 = arith.andi %1430, %1431 : i1
      %1433 = scf.if %1432 -> (i64) {
        scf.yield %1386 : i64
      } else {
        scf.yield %1428 : i64
      }
      %1434 = func.call @cc_errorp(%1387) : (i64) -> i64
      %1435 = arith.cmpi ne, %1434, %1408 : i64
      %1436 = arith.cmpi eq, %1433, %1408 : i64
      %1437 = arith.andi %1435, %1436 : i1
      %1438 = scf.if %1437 -> (i64) {
        scf.yield %1387 : i64
      } else {
        scf.yield %1433 : i64
      }
      %1439 = func.call @cc_errorp(%1398) : (i64) -> i64
      %1440 = arith.cmpi ne, %1439, %1408 : i64
      %1441 = arith.cmpi eq, %1438, %1408 : i64
      %1442 = arith.andi %1440, %1441 : i1
      %1443 = scf.if %1442 -> (i64) {
        scf.yield %1398 : i64
      } else {
        scf.yield %1438 : i64
      }
      %1444 = func.call @cc_errorp(%1407) : (i64) -> i64
      %1445 = arith.cmpi ne, %1444, %1408 : i64
      %1446 = arith.cmpi eq, %1443, %1408 : i64
      %1447 = arith.andi %1445, %1446 : i1
      %1448 = scf.if %1447 -> (i64) {
        scf.yield %1407 : i64
      } else {
        scf.yield %1443 : i64
      }
      %1449 = arith.cmpi ne, %1448, %1408 : i64
      scf.if %1449 {
        func.call @stack_push_pointer(%1448) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1172) : (i64) -> ()
        func.call @stack_push_pointer(%1278) : (i64) -> ()
        func.call @stack_push_pointer(%1363) : (i64) -> ()
        func.call @stack_push_pointer(%1375) : (i64) -> ()
        func.call @stack_push_pointer(%1386) : (i64) -> ()
        func.call @stack_push_pointer(%1387) : (i64) -> ()
        func.call @stack_push_pointer(%1398) : (i64) -> ()
        func.call @stack_push_pointer(%1407) : (i64) -> ()
        %1450 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1451 = func.call @cc_make_function_ref_const(%1450) : (!llvm.ptr) -> i64
        %1452 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1451, %1452) : (i64, i64) -> ()
      }
      %1453 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1453 : i64
    }
    %1454 = func.call @cc_nil_value() : () -> i64
    %1455 = func.call @cc_errorp(%1163) : (i64) -> i64
    %1456 = arith.cmpi ne, %1455, %1454 : i64
    %1457 = scf.if %1456 -> (i64) {
      scf.yield %1163 : i64
    } else {
      %1458 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1459 = arith.constant 19 : i64
      %1460 = func.call @cc_make_string(%1458, %1459) : (!llvm.ptr, i64) -> i64
      %1461 = func.call @cc_nil_value() : () -> i64
      %1462 = func.call @cc_intern(%1460, %1461) : (i64, i64) -> i64
      %1463 = func.call @cc_nil_value() : () -> i64
      %1464 = func.call @cc_cons(%1462, %1463) : (i64, i64) -> i64
      %1465 = func.call @cc_values_pack(%1464) : (i64) -> i64
      func.call @stack_push_pointer(%1462) : (i64) -> ()
      %1466 = func.call @stack_pop_pointer() : () -> i64
      %1467 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1468 = arith.constant 3 : i64
      %1469 = func.call @cc_make_string(%1467, %1468) : (!llvm.ptr, i64) -> i64
      %1470 = func.call @cc_nil_value() : () -> i64
      %1471 = func.call @cc_intern(%1469, %1470) : (i64, i64) -> i64
      %1472 = func.call @cc_nil_value() : () -> i64
      %1473 = func.call @cc_cons(%1471, %1472) : (i64, i64) -> i64
      %1474 = func.call @cc_values_pack(%1473) : (i64) -> i64
      func.call @stack_push_pointer(%1471) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1475 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1476 = arith.constant 4 : i64
      %1477 = func.call @cc_make_string(%1475, %1476) : (!llvm.ptr, i64) -> i64
      %1478 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1479 = arith.constant 11 : i64
      %1480 = func.call @cc_make_string(%1478, %1479) : (!llvm.ptr, i64) -> i64
      %1481 = func.call @cc_intern(%1477, %1480) : (i64, i64) -> i64
      %1482 = func.call @cc_nil_value() : () -> i64
      %1483 = func.call @cc_cons(%1481, %1482) : (i64, i64) -> i64
      %1484 = func.call @cc_values_pack(%1483) : (i64) -> i64
      func.call @stack_push_pointer(%1481) : (i64) -> ()
      %1485 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1486 = arith.constant 8 : i64
      %1487 = func.call @cc_make_string(%1485, %1486) : (!llvm.ptr, i64) -> i64
      %1488 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1489 = arith.constant 11 : i64
      %1490 = func.call @cc_make_string(%1488, %1489) : (!llvm.ptr, i64) -> i64
      %1491 = func.call @cc_intern(%1487, %1490) : (i64, i64) -> i64
      %1492 = func.call @cc_nil_value() : () -> i64
      %1493 = func.call @cc_cons(%1491, %1492) : (i64, i64) -> i64
      %1494 = func.call @cc_values_pack(%1493) : (i64) -> i64
      func.call @stack_push_pointer(%1491) : (i64) -> ()
      %1495 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1496 = arith.constant 42 : i64
      %1497 = func.call @cc_make_string(%1495, %1496) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1497) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1498 = func.call @stack_pop_pointer() : () -> i64
      %1499 = func.call @stack_pop_pointer() : () -> i64
      %1500 = func.call @cc_cons(%1499, %1498) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1500) : (i64) -> ()
      %1501 = func.call @stack_pop_pointer() : () -> i64
      %1502 = func.call @stack_pop_pointer() : () -> i64
      %1503 = func.call @cc_cons(%1502, %1501) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1503) : (i64) -> ()
      %1504 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1505 = arith.constant 15 : i64
      %1506 = func.call @cc_make_string(%1504, %1505) : (!llvm.ptr, i64) -> i64
      %1507 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1508 = arith.constant 7 : i64
      %1509 = func.call @cc_make_string(%1507, %1508) : (!llvm.ptr, i64) -> i64
      %1510 = func.call @cc_intern(%1506, %1509) : (i64, i64) -> i64
      %1511 = func.call @cc_nil_value() : () -> i64
      %1512 = func.call @cc_cons(%1510, %1511) : (i64, i64) -> i64
      %1513 = func.call @cc_values_pack(%1512) : (i64) -> i64
      func.call @stack_push_pointer(%1510) : (i64) -> ()
      %1514 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1515 = arith.constant 10 : i64
      %1516 = func.call @cc_make_string(%1514, %1515) : (!llvm.ptr, i64) -> i64
      %1517 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1518 = arith.constant 7 : i64
      %1519 = func.call @cc_make_string(%1517, %1518) : (!llvm.ptr, i64) -> i64
      %1520 = func.call @cc_intern(%1516, %1519) : (i64, i64) -> i64
      %1521 = func.call @cc_nil_value() : () -> i64
      %1522 = func.call @cc_cons(%1520, %1521) : (i64, i64) -> i64
      %1523 = func.call @cc_values_pack(%1522) : (i64) -> i64
      func.call @stack_push_pointer(%1520) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1524 = func.call @stack_pop_pointer() : () -> i64
      %1525 = func.call @stack_pop_pointer() : () -> i64
      %1526 = func.call @cc_cons(%1525, %1524) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1526) : (i64) -> ()
      %1527 = func.call @stack_pop_pointer() : () -> i64
      %1528 = func.call @stack_pop_pointer() : () -> i64
      %1529 = func.call @cc_cons(%1528, %1527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1529) : (i64) -> ()
      %1530 = func.call @stack_pop_pointer() : () -> i64
      %1531 = func.call @stack_pop_pointer() : () -> i64
      %1532 = func.call @cc_cons(%1531, %1530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1532) : (i64) -> ()
      %1533 = func.call @stack_pop_pointer() : () -> i64
      %1534 = func.call @stack_pop_pointer() : () -> i64
      %1535 = func.call @cc_cons(%1534, %1533) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1535) : (i64) -> ()
      %1536 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1537 = arith.constant 18 : i64
      %1538 = func.call @cc_make_string(%1536, %1537) : (!llvm.ptr, i64) -> i64
      %1539 = func.call @cc_nil_value() : () -> i64
      %1540 = func.call @cc_intern(%1538, %1539) : (i64, i64) -> i64
      %1541 = func.call @cc_nil_value() : () -> i64
      %1542 = func.call @cc_cons(%1540, %1541) : (i64, i64) -> i64
      %1543 = func.call @cc_values_pack(%1542) : (i64) -> i64
      func.call @stack_push_pointer(%1540) : (i64) -> ()
      %1544 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1545 = arith.constant 15 : i64
      %1546 = func.call @cc_make_string(%1544, %1545) : (!llvm.ptr, i64) -> i64
      %1547 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1548 = arith.constant 9 : i64
      %1549 = func.call @cc_make_string(%1547, %1548) : (!llvm.ptr, i64) -> i64
      %1550 = func.call @cc_intern(%1546, %1549) : (i64, i64) -> i64
      %1551 = func.call @cc_nil_value() : () -> i64
      %1552 = func.call @cc_cons(%1550, %1551) : (i64, i64) -> i64
      %1553 = func.call @cc_values_pack(%1552) : (i64) -> i64
      func.call @stack_push_pointer(%1550) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1554 = func.call @stack_pop_pointer() : () -> i64
      %1555 = func.call @stack_pop_pointer() : () -> i64
      %1556 = func.call @cc_cons(%1555, %1554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1556) : (i64) -> ()
      %1557 = func.call @stack_pop_pointer() : () -> i64
      %1558 = func.call @stack_pop_pointer() : () -> i64
      %1559 = func.call @cc_cons(%1558, %1557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1559) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1560 = func.call @stack_pop_pointer() : () -> i64
      %1561 = func.call @stack_pop_pointer() : () -> i64
      %1562 = func.call @cc_cons(%1561, %1560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1562) : (i64) -> ()
      %1563 = func.call @stack_pop_pointer() : () -> i64
      %1564 = func.call @stack_pop_pointer() : () -> i64
      %1565 = func.call @cc_cons(%1564, %1563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1565) : (i64) -> ()
      %1566 = func.call @stack_pop_pointer() : () -> i64
      %1567 = func.call @stack_pop_pointer() : () -> i64
      %1568 = func.call @cc_cons(%1567, %1566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1568) : (i64) -> ()
      %1569 = func.call @stack_pop_pointer() : () -> i64
      %1570 = func.call @stack_pop_pointer() : () -> i64
      %1571 = func.call @cc_cons(%1570, %1569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1571) : (i64) -> ()
      %1572 = func.call @stack_pop_pointer() : () -> i64
      %1654 = arith.constant 57937766645767 : i64
      %1655 = arith.constant 0 : i64
      %1656 = func.call @cc_make_closure(%1654, %1655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1656) : (i64) -> ()
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = arith.constant 206 : i64
      func.call @stack_push_fixnum(%1658) : (i64) -> ()
      %1659 = arith.constant 187 : i64
      func.call @stack_push_fixnum(%1659) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1660 = func.call @stack_pop_pointer() : () -> i64
      %1661 = func.call @stack_pop_pointer() : () -> i64
      %1662 = func.call @cc_cons(%1661, %1660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1662) : (i64) -> ()
      %1663 = func.call @stack_pop_pointer() : () -> i64
      %1664 = func.call @stack_pop_pointer() : () -> i64
      %1665 = func.call @cc_cons(%1664, %1663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1665) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1666 = func.call @stack_pop_pointer() : () -> i64
      %1667 = func.call @stack_pop_pointer() : () -> i64
      %1668 = func.call @cc_cons(%1667, %1666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1668) : (i64) -> ()
      %1669 = func.call @stack_pop_pointer() : () -> i64
      %1670 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1671 = arith.constant 11 : i64
      %1672 = func.call @cc_make_string(%1670, %1671) : (!llvm.ptr, i64) -> i64
      %1673 = llvm.mlir.addressof @str161 : !llvm.ptr
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
      %1682 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1683 = arith.constant 4 : i64
      %1684 = func.call @cc_make_string(%1682, %1683) : (!llvm.ptr, i64) -> i64
      %1685 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1686 = arith.constant 7 : i64
      %1687 = func.call @cc_make_string(%1685, %1686) : (!llvm.ptr, i64) -> i64
      %1688 = func.call @cc_intern(%1684, %1687) : (i64, i64) -> i64
      %1689 = func.call @cc_nil_value() : () -> i64
      %1690 = func.call @cc_cons(%1688, %1689) : (i64, i64) -> i64
      %1691 = func.call @cc_values_pack(%1690) : (i64) -> i64
      func.call @stack_push_pointer(%1688) : (i64) -> ()
      %1692 = func.call @stack_pop_pointer() : () -> i64
      %1693 = llvm.mlir.addressof @str164 : !llvm.ptr
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
      %1703 = func.call @cc_errorp(%1466) : (i64) -> i64
      %1704 = arith.cmpi ne, %1703, %1702 : i64
      %1705 = arith.cmpi eq, %1702, %1702 : i64
      %1706 = arith.andi %1704, %1705 : i1
      %1707 = scf.if %1706 -> (i64) {
        scf.yield %1466 : i64
      } else {
        scf.yield %1702 : i64
      }
      %1708 = func.call @cc_errorp(%1572) : (i64) -> i64
      %1709 = arith.cmpi ne, %1708, %1702 : i64
      %1710 = arith.cmpi eq, %1707, %1702 : i64
      %1711 = arith.andi %1709, %1710 : i1
      %1712 = scf.if %1711 -> (i64) {
        scf.yield %1572 : i64
      } else {
        scf.yield %1707 : i64
      }
      %1713 = func.call @cc_errorp(%1657) : (i64) -> i64
      %1714 = arith.cmpi ne, %1713, %1702 : i64
      %1715 = arith.cmpi eq, %1712, %1702 : i64
      %1716 = arith.andi %1714, %1715 : i1
      %1717 = scf.if %1716 -> (i64) {
        scf.yield %1657 : i64
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
        func.call @stack_push_pointer(%1466) : (i64) -> ()
        func.call @stack_push_pointer(%1572) : (i64) -> ()
        func.call @stack_push_pointer(%1657) : (i64) -> ()
        func.call @stack_push_pointer(%1669) : (i64) -> ()
        func.call @stack_push_pointer(%1680) : (i64) -> ()
        func.call @stack_push_pointer(%1681) : (i64) -> ()
        func.call @stack_push_pointer(%1692) : (i64) -> ()
        func.call @stack_push_pointer(%1701) : (i64) -> ()
        %1744 = llvm.mlir.addressof @str165 : !llvm.ptr
        %1745 = func.call @cc_make_function_ref_const(%1744) : (!llvm.ptr) -> i64
        %1746 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1745, %1746) : (i64, i64) -> ()
      }
      %1747 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1747 : i64
    }
    %1748 = func.call @cc_nil_value() : () -> i64
    %1749 = func.call @cc_errorp(%1457) : (i64) -> i64
    %1750 = arith.cmpi ne, %1749, %1748 : i64
    %1751 = scf.if %1750 -> (i64) {
      scf.yield %1457 : i64
    } else {
      %1752 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1753 = arith.constant 20 : i64
      %1754 = func.call @cc_make_string(%1752, %1753) : (!llvm.ptr, i64) -> i64
      %1755 = func.call @cc_nil_value() : () -> i64
      %1756 = func.call @cc_intern(%1754, %1755) : (i64, i64) -> i64
      %1757 = func.call @cc_nil_value() : () -> i64
      %1758 = func.call @cc_cons(%1756, %1757) : (i64, i64) -> i64
      %1759 = func.call @cc_values_pack(%1758) : (i64) -> i64
      func.call @stack_push_pointer(%1756) : (i64) -> ()
      %1760 = func.call @stack_pop_pointer() : () -> i64
      %1761 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1762 = arith.constant 13 : i64
      %1763 = func.call @cc_make_string(%1761, %1762) : (!llvm.ptr, i64) -> i64
      %1764 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1765 = arith.constant 11 : i64
      %1766 = func.call @cc_make_string(%1764, %1765) : (!llvm.ptr, i64) -> i64
      %1767 = func.call @cc_intern(%1763, %1766) : (i64, i64) -> i64
      %1768 = func.call @cc_nil_value() : () -> i64
      %1769 = func.call @cc_cons(%1767, %1768) : (i64, i64) -> i64
      %1770 = func.call @cc_values_pack(%1769) : (i64) -> i64
      func.call @stack_push_pointer(%1767) : (i64) -> ()
      %1771 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1772 = arith.constant 6 : i64
      %1773 = func.call @cc_make_string(%1771, %1772) : (!llvm.ptr, i64) -> i64
      %1774 = func.call @cc_nil_value() : () -> i64
      %1775 = func.call @cc_intern(%1773, %1774) : (i64, i64) -> i64
      %1776 = func.call @cc_nil_value() : () -> i64
      %1777 = func.call @cc_cons(%1775, %1776) : (i64, i64) -> i64
      %1778 = func.call @cc_values_pack(%1777) : (i64) -> i64
      func.call @stack_push_pointer(%1775) : (i64) -> ()
      %1779 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1780 = arith.constant 19 : i64
      %1781 = func.call @cc_make_string(%1779, %1780) : (!llvm.ptr, i64) -> i64
      %1782 = func.call @cc_nil_value() : () -> i64
      %1783 = func.call @cc_intern(%1781, %1782) : (i64, i64) -> i64
      %1784 = func.call @cc_nil_value() : () -> i64
      %1785 = func.call @cc_cons(%1783, %1784) : (i64, i64) -> i64
      %1786 = func.call @cc_values_pack(%1785) : (i64) -> i64
      func.call @stack_push_pointer(%1783) : (i64) -> ()
      %1787 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1788 = arith.constant 4 : i64
      %1789 = func.call @cc_make_string(%1787, %1788) : (!llvm.ptr, i64) -> i64
      %1790 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1791 = arith.constant 11 : i64
      %1792 = func.call @cc_make_string(%1790, %1791) : (!llvm.ptr, i64) -> i64
      %1793 = func.call @cc_intern(%1789, %1792) : (i64, i64) -> i64
      %1794 = func.call @cc_nil_value() : () -> i64
      %1795 = func.call @cc_cons(%1793, %1794) : (i64, i64) -> i64
      %1796 = func.call @cc_values_pack(%1795) : (i64) -> i64
      func.call @stack_push_pointer(%1793) : (i64) -> ()
      %1797 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1798 = arith.constant 8 : i64
      %1799 = func.call @cc_make_string(%1797, %1798) : (!llvm.ptr, i64) -> i64
      %1800 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1801 = arith.constant 11 : i64
      %1802 = func.call @cc_make_string(%1800, %1801) : (!llvm.ptr, i64) -> i64
      %1803 = func.call @cc_intern(%1799, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_nil_value() : () -> i64
      %1805 = func.call @cc_cons(%1803, %1804) : (i64, i64) -> i64
      %1806 = func.call @cc_values_pack(%1805) : (i64) -> i64
      func.call @stack_push_pointer(%1803) : (i64) -> ()
      %1807 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1808 = arith.constant 42 : i64
      %1809 = func.call @cc_make_string(%1807, %1808) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1809) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1810 = func.call @stack_pop_pointer() : () -> i64
      %1811 = func.call @stack_pop_pointer() : () -> i64
      %1812 = func.call @cc_cons(%1811, %1810) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1812) : (i64) -> ()
      %1813 = func.call @stack_pop_pointer() : () -> i64
      %1814 = func.call @stack_pop_pointer() : () -> i64
      %1815 = func.call @cc_cons(%1814, %1813) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1815) : (i64) -> ()
      %1816 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1817 = arith.constant 15 : i64
      %1818 = func.call @cc_make_string(%1816, %1817) : (!llvm.ptr, i64) -> i64
      %1819 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1820 = arith.constant 7 : i64
      %1821 = func.call @cc_make_string(%1819, %1820) : (!llvm.ptr, i64) -> i64
      %1822 = func.call @cc_intern(%1818, %1821) : (i64, i64) -> i64
      %1823 = func.call @cc_nil_value() : () -> i64
      %1824 = func.call @cc_cons(%1822, %1823) : (i64, i64) -> i64
      %1825 = func.call @cc_values_pack(%1824) : (i64) -> i64
      func.call @stack_push_pointer(%1822) : (i64) -> ()
      %1826 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1827 = arith.constant 8 : i64
      %1828 = func.call @cc_make_string(%1826, %1827) : (!llvm.ptr, i64) -> i64
      %1829 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1830 = arith.constant 7 : i64
      %1831 = func.call @cc_make_string(%1829, %1830) : (!llvm.ptr, i64) -> i64
      %1832 = func.call @cc_intern(%1828, %1831) : (i64, i64) -> i64
      %1833 = func.call @cc_nil_value() : () -> i64
      %1834 = func.call @cc_cons(%1832, %1833) : (i64, i64) -> i64
      %1835 = func.call @cc_values_pack(%1834) : (i64) -> i64
      func.call @stack_push_pointer(%1832) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1836 = func.call @stack_pop_pointer() : () -> i64
      %1837 = func.call @stack_pop_pointer() : () -> i64
      %1838 = func.call @cc_cons(%1837, %1836) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1838) : (i64) -> ()
      %1839 = func.call @stack_pop_pointer() : () -> i64
      %1840 = func.call @stack_pop_pointer() : () -> i64
      %1841 = func.call @cc_cons(%1840, %1839) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1841) : (i64) -> ()
      %1842 = func.call @stack_pop_pointer() : () -> i64
      %1843 = func.call @stack_pop_pointer() : () -> i64
      %1844 = func.call @cc_cons(%1843, %1842) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1844) : (i64) -> ()
      %1845 = func.call @stack_pop_pointer() : () -> i64
      %1846 = func.call @stack_pop_pointer() : () -> i64
      %1847 = func.call @cc_cons(%1846, %1845) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1847) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1848 = func.call @stack_pop_pointer() : () -> i64
      %1849 = func.call @stack_pop_pointer() : () -> i64
      %1850 = func.call @cc_cons(%1849, %1848) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1850) : (i64) -> ()
      %1851 = func.call @stack_pop_pointer() : () -> i64
      %1852 = func.call @stack_pop_pointer() : () -> i64
      %1853 = func.call @cc_cons(%1852, %1851) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1853) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1854 = func.call @stack_pop_pointer() : () -> i64
      %1855 = func.call @stack_pop_pointer() : () -> i64
      %1856 = func.call @cc_cons(%1855, %1854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1856) : (i64) -> ()
      %1857 = func.call @stack_pop_pointer() : () -> i64
      %1858 = func.call @stack_pop_pointer() : () -> i64
      %1859 = func.call @cc_cons(%1858, %1857) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1859) : (i64) -> ()
      %1860 = func.call @stack_pop_pointer() : () -> i64
      %1861 = func.call @stack_pop_pointer() : () -> i64
      %1862 = func.call @cc_cons(%1861, %1860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1862) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1863 = func.call @stack_pop_pointer() : () -> i64
      %1864 = func.call @stack_pop_pointer() : () -> i64
      %1865 = func.call @cc_cons(%1864, %1863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1865) : (i64) -> ()
      %1866 = func.call @stack_pop_pointer() : () -> i64
      %1867 = func.call @stack_pop_pointer() : () -> i64
      %1868 = func.call @cc_cons(%1867, %1866) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1868) : (i64) -> ()
      %1869 = func.call @stack_pop_pointer() : () -> i64
      %1955 = arith.constant 57937766645768 : i64
      %1956 = arith.constant 0 : i64
      %1957 = func.call @cc_make_closure(%1955, %1956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1957) : (i64) -> ()
      %1958 = func.call @stack_pop_pointer() : () -> i64
      %1959 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1960 = arith.constant 4 : i64
      %1961 = func.call @cc_make_string(%1959, %1960) : (!llvm.ptr, i64) -> i64
      %1962 = func.call @cc_nil_value() : () -> i64
      %1963 = func.call @cc_intern(%1961, %1962) : (i64, i64) -> i64
      %1964 = func.call @cc_nil_value() : () -> i64
      %1965 = func.call @cc_cons(%1963, %1964) : (i64, i64) -> i64
      %1966 = func.call @cc_values_pack(%1965) : (i64) -> i64
      func.call @stack_push_pointer(%1963) : (i64) -> ()
      %1967 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1968 = arith.constant 21 : i64
      %1969 = func.call @cc_make_string(%1967, %1968) : (!llvm.ptr, i64) -> i64
      %1970 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1971 = arith.constant 3 : i64
      %1972 = func.call @cc_make_string(%1970, %1971) : (!llvm.ptr, i64) -> i64
      %1973 = func.call @cc_intern(%1969, %1972) : (i64, i64) -> i64
      %1974 = func.call @cc_nil_value() : () -> i64
      %1975 = func.call @cc_cons(%1973, %1974) : (i64, i64) -> i64
      %1976 = func.call @cc_values_pack(%1975) : (i64) -> i64
      func.call @stack_push_pointer(%1973) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1977 = func.call @stack_pop_pointer() : () -> i64
      %1978 = func.call @stack_pop_pointer() : () -> i64
      %1979 = func.call @cc_cons(%1978, %1977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1979) : (i64) -> ()
      %1980 = func.call @stack_pop_pointer() : () -> i64
      %1981 = func.call @stack_pop_pointer() : () -> i64
      %1982 = func.call @cc_cons(%1981, %1980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1982) : (i64) -> ()
      %1983 = func.call @stack_pop_pointer() : () -> i64
      %1984 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1985 = arith.constant 11 : i64
      %1986 = func.call @cc_make_string(%1984, %1985) : (!llvm.ptr, i64) -> i64
      %1987 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1988 = arith.constant 7 : i64
      %1989 = func.call @cc_make_string(%1987, %1988) : (!llvm.ptr, i64) -> i64
      %1990 = func.call @cc_intern(%1986, %1989) : (i64, i64) -> i64
      %1991 = func.call @cc_nil_value() : () -> i64
      %1992 = func.call @cc_cons(%1990, %1991) : (i64, i64) -> i64
      %1993 = func.call @cc_values_pack(%1992) : (i64) -> i64
      func.call @stack_push_pointer(%1990) : (i64) -> ()
      %1994 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1995 = func.call @stack_pop_pointer() : () -> i64
      %1996 = llvm.mlir.addressof @str191 : !llvm.ptr
      %1997 = arith.constant 4 : i64
      %1998 = func.call @cc_make_string(%1996, %1997) : (!llvm.ptr, i64) -> i64
      %1999 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2000 = arith.constant 7 : i64
      %2001 = func.call @cc_make_string(%1999, %2000) : (!llvm.ptr, i64) -> i64
      %2002 = func.call @cc_intern(%1998, %2001) : (i64, i64) -> i64
      %2003 = func.call @cc_nil_value() : () -> i64
      %2004 = func.call @cc_cons(%2002, %2003) : (i64, i64) -> i64
      %2005 = func.call @cc_values_pack(%2004) : (i64) -> i64
      func.call @stack_push_pointer(%2002) : (i64) -> ()
      %2006 = func.call @stack_pop_pointer() : () -> i64
      %2007 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2008 = arith.constant 5 : i64
      %2009 = func.call @cc_make_string(%2007, %2008) : (!llvm.ptr, i64) -> i64
      %2010 = func.call @cc_nil_value() : () -> i64
      %2011 = func.call @cc_intern(%2009, %2010) : (i64, i64) -> i64
      %2012 = func.call @cc_nil_value() : () -> i64
      %2013 = func.call @cc_cons(%2011, %2012) : (i64, i64) -> i64
      %2014 = func.call @cc_values_pack(%2013) : (i64) -> i64
      func.call @stack_push_pointer(%2011) : (i64) -> ()
      %2015 = func.call @stack_pop_pointer() : () -> i64
      %2016 = func.call @cc_nil_value() : () -> i64
      %2017 = func.call @cc_errorp(%1760) : (i64) -> i64
      %2018 = arith.cmpi ne, %2017, %2016 : i64
      %2019 = arith.cmpi eq, %2016, %2016 : i64
      %2020 = arith.andi %2018, %2019 : i1
      %2021 = scf.if %2020 -> (i64) {
        scf.yield %1760 : i64
      } else {
        scf.yield %2016 : i64
      }
      %2022 = func.call @cc_errorp(%1869) : (i64) -> i64
      %2023 = arith.cmpi ne, %2022, %2016 : i64
      %2024 = arith.cmpi eq, %2021, %2016 : i64
      %2025 = arith.andi %2023, %2024 : i1
      %2026 = scf.if %2025 -> (i64) {
        scf.yield %1869 : i64
      } else {
        scf.yield %2021 : i64
      }
      %2027 = func.call @cc_errorp(%1958) : (i64) -> i64
      %2028 = arith.cmpi ne, %2027, %2016 : i64
      %2029 = arith.cmpi eq, %2026, %2016 : i64
      %2030 = arith.andi %2028, %2029 : i1
      %2031 = scf.if %2030 -> (i64) {
        scf.yield %1958 : i64
      } else {
        scf.yield %2026 : i64
      }
      %2032 = func.call @cc_errorp(%1983) : (i64) -> i64
      %2033 = arith.cmpi ne, %2032, %2016 : i64
      %2034 = arith.cmpi eq, %2031, %2016 : i64
      %2035 = arith.andi %2033, %2034 : i1
      %2036 = scf.if %2035 -> (i64) {
        scf.yield %1983 : i64
      } else {
        scf.yield %2031 : i64
      }
      %2037 = func.call @cc_errorp(%1994) : (i64) -> i64
      %2038 = arith.cmpi ne, %2037, %2016 : i64
      %2039 = arith.cmpi eq, %2036, %2016 : i64
      %2040 = arith.andi %2038, %2039 : i1
      %2041 = scf.if %2040 -> (i64) {
        scf.yield %1994 : i64
      } else {
        scf.yield %2036 : i64
      }
      %2042 = func.call @cc_errorp(%1995) : (i64) -> i64
      %2043 = arith.cmpi ne, %2042, %2016 : i64
      %2044 = arith.cmpi eq, %2041, %2016 : i64
      %2045 = arith.andi %2043, %2044 : i1
      %2046 = scf.if %2045 -> (i64) {
        scf.yield %1995 : i64
      } else {
        scf.yield %2041 : i64
      }
      %2047 = func.call @cc_errorp(%2006) : (i64) -> i64
      %2048 = arith.cmpi ne, %2047, %2016 : i64
      %2049 = arith.cmpi eq, %2046, %2016 : i64
      %2050 = arith.andi %2048, %2049 : i1
      %2051 = scf.if %2050 -> (i64) {
        scf.yield %2006 : i64
      } else {
        scf.yield %2046 : i64
      }
      %2052 = func.call @cc_errorp(%2015) : (i64) -> i64
      %2053 = arith.cmpi ne, %2052, %2016 : i64
      %2054 = arith.cmpi eq, %2051, %2016 : i64
      %2055 = arith.andi %2053, %2054 : i1
      %2056 = scf.if %2055 -> (i64) {
        scf.yield %2015 : i64
      } else {
        scf.yield %2051 : i64
      }
      %2057 = arith.cmpi ne, %2056, %2016 : i64
      scf.if %2057 {
        func.call @stack_push_pointer(%2056) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1760) : (i64) -> ()
        func.call @stack_push_pointer(%1869) : (i64) -> ()
        func.call @stack_push_pointer(%1958) : (i64) -> ()
        func.call @stack_push_pointer(%1983) : (i64) -> ()
        func.call @stack_push_pointer(%1994) : (i64) -> ()
        func.call @stack_push_pointer(%1995) : (i64) -> ()
        func.call @stack_push_pointer(%2006) : (i64) -> ()
        func.call @stack_push_pointer(%2015) : (i64) -> ()
        %2058 = llvm.mlir.addressof @str194 : !llvm.ptr
        %2059 = func.call @cc_make_function_ref_const(%2058) : (!llvm.ptr) -> i64
        %2060 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2059, %2060) : (i64, i64) -> ()
      }
      %2061 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2061 : i64
    }
    %2062 = func.call @cc_nil_value() : () -> i64
    %2063 = func.call @cc_errorp(%1751) : (i64) -> i64
    %2064 = arith.cmpi ne, %2063, %2062 : i64
    %2065 = scf.if %2064 -> (i64) {
      scf.yield %1751 : i64
    } else {
      %2066 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2067 = arith.constant 28 : i64
      %2068 = func.call @cc_make_string(%2066, %2067) : (!llvm.ptr, i64) -> i64
      %2069 = func.call @cc_nil_value() : () -> i64
      %2070 = func.call @cc_intern(%2068, %2069) : (i64, i64) -> i64
      %2071 = func.call @cc_nil_value() : () -> i64
      %2072 = func.call @cc_cons(%2070, %2071) : (i64, i64) -> i64
      %2073 = func.call @cc_values_pack(%2072) : (i64) -> i64
      func.call @stack_push_pointer(%2070) : (i64) -> ()
      %2074 = func.call @stack_pop_pointer() : () -> i64
      %2075 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2076 = arith.constant 3 : i64
      %2077 = func.call @cc_make_string(%2075, %2076) : (!llvm.ptr, i64) -> i64
      %2078 = func.call @cc_nil_value() : () -> i64
      %2079 = func.call @cc_intern(%2077, %2078) : (i64, i64) -> i64
      %2080 = func.call @cc_nil_value() : () -> i64
      %2081 = func.call @cc_cons(%2079, %2080) : (i64, i64) -> i64
      %2082 = func.call @cc_values_pack(%2081) : (i64) -> i64
      func.call @stack_push_pointer(%2079) : (i64) -> ()
      %2083 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2084 = arith.constant 4 : i64
      %2085 = func.call @cc_make_string(%2083, %2084) : (!llvm.ptr, i64) -> i64
      %2086 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2087 = arith.constant 11 : i64
      %2088 = func.call @cc_make_string(%2086, %2087) : (!llvm.ptr, i64) -> i64
      %2089 = func.call @cc_intern(%2085, %2088) : (i64, i64) -> i64
      %2090 = func.call @cc_nil_value() : () -> i64
      %2091 = func.call @cc_cons(%2089, %2090) : (i64, i64) -> i64
      %2092 = func.call @cc_values_pack(%2091) : (i64) -> i64
      func.call @stack_push_pointer(%2089) : (i64) -> ()
      %2093 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2094 = arith.constant 9 : i64
      %2095 = func.call @cc_make_string(%2093, %2094) : (!llvm.ptr, i64) -> i64
      %2096 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2097 = arith.constant 11 : i64
      %2098 = func.call @cc_make_string(%2096, %2097) : (!llvm.ptr, i64) -> i64
      %2099 = func.call @cc_intern(%2095, %2098) : (i64, i64) -> i64
      %2100 = func.call @cc_nil_value() : () -> i64
      %2101 = func.call @cc_cons(%2099, %2100) : (i64, i64) -> i64
      %2102 = func.call @cc_values_pack(%2101) : (i64) -> i64
      func.call @stack_push_pointer(%2099) : (i64) -> ()
      %2103 = arith.constant 65 : i64
      func.call @stack_push_fixnum(%2103) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2104 = func.call @stack_pop_pointer() : () -> i64
      %2105 = func.call @stack_pop_pointer() : () -> i64
      %2106 = func.call @cc_cons(%2105, %2104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2106) : (i64) -> ()
      %2107 = func.call @stack_pop_pointer() : () -> i64
      %2108 = func.call @stack_pop_pointer() : () -> i64
      %2109 = func.call @cc_cons(%2108, %2107) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2109) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2110 = func.call @stack_pop_pointer() : () -> i64
      %2111 = func.call @stack_pop_pointer() : () -> i64
      %2112 = func.call @cc_cons(%2111, %2110) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2112) : (i64) -> ()
      %2113 = func.call @stack_pop_pointer() : () -> i64
      %2114 = func.call @stack_pop_pointer() : () -> i64
      %2115 = func.call @cc_cons(%2114, %2113) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2115) : (i64) -> ()
      %2116 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2117 = arith.constant 8 : i64
      %2118 = func.call @cc_make_string(%2116, %2117) : (!llvm.ptr, i64) -> i64
      %2119 = func.call @cc_nil_value() : () -> i64
      %2120 = func.call @cc_intern(%2118, %2119) : (i64, i64) -> i64
      %2121 = func.call @cc_nil_value() : () -> i64
      %2122 = func.call @cc_cons(%2120, %2121) : (i64, i64) -> i64
      %2123 = func.call @cc_values_pack(%2122) : (i64) -> i64
      func.call @stack_push_pointer(%2120) : (i64) -> ()
      %2124 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2125 = arith.constant 47 : i64
      %2126 = func.call @cc_make_string(%2124, %2125) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2126) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2127 = func.call @stack_pop_pointer() : () -> i64
      %2128 = func.call @stack_pop_pointer() : () -> i64
      %2129 = func.call @cc_cons(%2128, %2127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2129) : (i64) -> ()
      %2130 = func.call @stack_pop_pointer() : () -> i64
      %2131 = func.call @stack_pop_pointer() : () -> i64
      %2132 = func.call @cc_cons(%2131, %2130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2132) : (i64) -> ()
      %2133 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2134 = arith.constant 3 : i64
      %2135 = func.call @cc_make_string(%2133, %2134) : (!llvm.ptr, i64) -> i64
      %2136 = func.call @cc_nil_value() : () -> i64
      %2137 = func.call @cc_intern(%2135, %2136) : (i64, i64) -> i64
      %2138 = func.call @cc_nil_value() : () -> i64
      %2139 = func.call @cc_cons(%2137, %2138) : (i64, i64) -> i64
      %2140 = func.call @cc_values_pack(%2139) : (i64) -> i64
      func.call @stack_push_pointer(%2137) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2141 = func.call @stack_pop_pointer() : () -> i64
      %2142 = func.call @stack_pop_pointer() : () -> i64
      %2143 = func.call @cc_cons(%2142, %2141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2143) : (i64) -> ()
      %2144 = func.call @stack_pop_pointer() : () -> i64
      %2145 = func.call @stack_pop_pointer() : () -> i64
      %2146 = func.call @cc_cons(%2145, %2144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2146) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2147 = func.call @stack_pop_pointer() : () -> i64
      %2148 = func.call @stack_pop_pointer() : () -> i64
      %2149 = func.call @cc_cons(%2148, %2147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2149) : (i64) -> ()
      %2150 = func.call @stack_pop_pointer() : () -> i64
      %2151 = func.call @stack_pop_pointer() : () -> i64
      %2152 = func.call @cc_cons(%2151, %2150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2152) : (i64) -> ()
      %2153 = func.call @stack_pop_pointer() : () -> i64
      %2154 = func.call @stack_pop_pointer() : () -> i64
      %2155 = func.call @cc_cons(%2154, %2153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2155) : (i64) -> ()
      %2156 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2157 = arith.constant 14 : i64
      %2158 = func.call @cc_make_string(%2156, %2157) : (!llvm.ptr, i64) -> i64
      %2159 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2160 = arith.constant 11 : i64
      %2161 = func.call @cc_make_string(%2159, %2160) : (!llvm.ptr, i64) -> i64
      %2162 = func.call @cc_intern(%2158, %2161) : (i64, i64) -> i64
      %2163 = func.call @cc_nil_value() : () -> i64
      %2164 = func.call @cc_cons(%2162, %2163) : (i64, i64) -> i64
      %2165 = func.call @cc_values_pack(%2164) : (i64) -> i64
      func.call @stack_push_pointer(%2162) : (i64) -> ()
      %2166 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2167 = arith.constant 6 : i64
      %2168 = func.call @cc_make_string(%2166, %2167) : (!llvm.ptr, i64) -> i64
      %2169 = func.call @cc_nil_value() : () -> i64
      %2170 = func.call @cc_intern(%2168, %2169) : (i64, i64) -> i64
      %2171 = func.call @cc_nil_value() : () -> i64
      %2172 = func.call @cc_cons(%2170, %2171) : (i64, i64) -> i64
      %2173 = func.call @cc_values_pack(%2172) : (i64) -> i64
      func.call @stack_push_pointer(%2170) : (i64) -> ()
      %2174 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2175 = arith.constant 8 : i64
      %2176 = func.call @cc_make_string(%2174, %2175) : (!llvm.ptr, i64) -> i64
      %2177 = func.call @cc_nil_value() : () -> i64
      %2178 = func.call @cc_intern(%2176, %2177) : (i64, i64) -> i64
      %2179 = func.call @cc_nil_value() : () -> i64
      %2180 = func.call @cc_cons(%2178, %2179) : (i64, i64) -> i64
      %2181 = func.call @cc_values_pack(%2180) : (i64) -> i64
      func.call @stack_push_pointer(%2178) : (i64) -> ()
      %2182 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2183 = arith.constant 13 : i64
      %2184 = func.call @cc_make_string(%2182, %2183) : (!llvm.ptr, i64) -> i64
      %2185 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2186 = arith.constant 3 : i64
      %2187 = func.call @cc_make_string(%2185, %2186) : (!llvm.ptr, i64) -> i64
      %2188 = func.call @cc_intern(%2184, %2187) : (i64, i64) -> i64
      %2189 = func.call @cc_nil_value() : () -> i64
      %2190 = func.call @cc_cons(%2188, %2189) : (i64, i64) -> i64
      %2191 = func.call @cc_values_pack(%2190) : (i64) -> i64
      func.call @stack_push_pointer(%2188) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2192 = func.call @stack_pop_pointer() : () -> i64
      %2193 = func.call @stack_pop_pointer() : () -> i64
      %2194 = func.call @cc_cons(%2193, %2192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2194) : (i64) -> ()
      %2195 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2196 = arith.constant 3 : i64
      %2197 = func.call @cc_make_string(%2195, %2196) : (!llvm.ptr, i64) -> i64
      %2198 = func.call @cc_nil_value() : () -> i64
      %2199 = func.call @cc_intern(%2197, %2198) : (i64, i64) -> i64
      %2200 = func.call @cc_nil_value() : () -> i64
      %2201 = func.call @cc_cons(%2199, %2200) : (i64, i64) -> i64
      %2202 = func.call @cc_values_pack(%2201) : (i64) -> i64
      func.call @stack_push_pointer(%2199) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2203 = func.call @stack_pop_pointer() : () -> i64
      %2204 = func.call @stack_pop_pointer() : () -> i64
      %2205 = func.call @cc_cons(%2204, %2203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2205) : (i64) -> ()
      %2206 = func.call @stack_pop_pointer() : () -> i64
      %2207 = func.call @stack_pop_pointer() : () -> i64
      %2208 = func.call @cc_cons(%2207, %2206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2208) : (i64) -> ()
      %2209 = func.call @stack_pop_pointer() : () -> i64
      %2210 = func.call @stack_pop_pointer() : () -> i64
      %2211 = func.call @cc_cons(%2210, %2209) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2211) : (i64) -> ()
      %2212 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2213 = arith.constant 14 : i64
      %2214 = func.call @cc_make_string(%2212, %2213) : (!llvm.ptr, i64) -> i64
      %2215 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2216 = arith.constant 11 : i64
      %2217 = func.call @cc_make_string(%2215, %2216) : (!llvm.ptr, i64) -> i64
      %2218 = func.call @cc_intern(%2214, %2217) : (i64, i64) -> i64
      %2219 = func.call @cc_nil_value() : () -> i64
      %2220 = func.call @cc_cons(%2218, %2219) : (i64, i64) -> i64
      %2221 = func.call @cc_values_pack(%2220) : (i64) -> i64
      func.call @stack_push_pointer(%2218) : (i64) -> ()
      %2222 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2223 = arith.constant 6 : i64
      %2224 = func.call @cc_make_string(%2222, %2223) : (!llvm.ptr, i64) -> i64
      %2225 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2226 = arith.constant 11 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = func.call @cc_intern(%2224, %2227) : (i64, i64) -> i64
      %2229 = func.call @cc_nil_value() : () -> i64
      %2230 = func.call @cc_cons(%2228, %2229) : (i64, i64) -> i64
      %2231 = func.call @cc_values_pack(%2230) : (i64) -> i64
      func.call @stack_push_pointer(%2228) : (i64) -> ()
      %2232 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2233 = arith.constant 8 : i64
      %2234 = func.call @cc_make_string(%2232, %2233) : (!llvm.ptr, i64) -> i64
      %2235 = func.call @cc_nil_value() : () -> i64
      %2236 = func.call @cc_intern(%2234, %2235) : (i64, i64) -> i64
      %2237 = func.call @cc_nil_value() : () -> i64
      %2238 = func.call @cc_cons(%2236, %2237) : (i64, i64) -> i64
      %2239 = func.call @cc_values_pack(%2238) : (i64) -> i64
      func.call @stack_push_pointer(%2236) : (i64) -> ()
      %2240 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2241 = arith.constant 9 : i64
      %2242 = func.call @cc_make_string(%2240, %2241) : (!llvm.ptr, i64) -> i64
      %2243 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2244 = arith.constant 7 : i64
      %2245 = func.call @cc_make_string(%2243, %2244) : (!llvm.ptr, i64) -> i64
      %2246 = func.call @cc_intern(%2242, %2245) : (i64, i64) -> i64
      %2247 = func.call @cc_nil_value() : () -> i64
      %2248 = func.call @cc_cons(%2246, %2247) : (i64, i64) -> i64
      %2249 = func.call @cc_values_pack(%2248) : (i64) -> i64
      func.call @stack_push_pointer(%2246) : (i64) -> ()
      %2250 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2251 = arith.constant 6 : i64
      %2252 = func.call @cc_make_string(%2250, %2251) : (!llvm.ptr, i64) -> i64
      %2253 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2254 = arith.constant 7 : i64
      %2255 = func.call @cc_make_string(%2253, %2254) : (!llvm.ptr, i64) -> i64
      %2256 = func.call @cc_intern(%2252, %2255) : (i64, i64) -> i64
      %2257 = func.call @cc_nil_value() : () -> i64
      %2258 = func.call @cc_cons(%2256, %2257) : (i64, i64) -> i64
      %2259 = func.call @cc_values_pack(%2258) : (i64) -> i64
      func.call @stack_push_pointer(%2256) : (i64) -> ()
      %2260 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2261 = arith.constant 9 : i64
      %2262 = func.call @cc_make_string(%2260, %2261) : (!llvm.ptr, i64) -> i64
      %2263 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2264 = arith.constant 7 : i64
      %2265 = func.call @cc_make_string(%2263, %2264) : (!llvm.ptr, i64) -> i64
      %2266 = func.call @cc_intern(%2262, %2265) : (i64, i64) -> i64
      %2267 = func.call @cc_nil_value() : () -> i64
      %2268 = func.call @cc_cons(%2266, %2267) : (i64, i64) -> i64
      %2269 = func.call @cc_values_pack(%2268) : (i64) -> i64
      func.call @stack_push_pointer(%2266) : (i64) -> ()
      %2270 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2271 = arith.constant 9 : i64
      %2272 = func.call @cc_make_string(%2270, %2271) : (!llvm.ptr, i64) -> i64
      %2273 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2274 = arith.constant 7 : i64
      %2275 = func.call @cc_make_string(%2273, %2274) : (!llvm.ptr, i64) -> i64
      %2276 = func.call @cc_intern(%2272, %2275) : (i64, i64) -> i64
      %2277 = func.call @cc_nil_value() : () -> i64
      %2278 = func.call @cc_cons(%2276, %2277) : (i64, i64) -> i64
      %2279 = func.call @cc_values_pack(%2278) : (i64) -> i64
      func.call @stack_push_pointer(%2276) : (i64) -> ()
      %2280 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2281 = arith.constant 17 : i64
      %2282 = func.call @cc_make_string(%2280, %2281) : (!llvm.ptr, i64) -> i64
      %2283 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2284 = arith.constant 7 : i64
      %2285 = func.call @cc_make_string(%2283, %2284) : (!llvm.ptr, i64) -> i64
      %2286 = func.call @cc_intern(%2282, %2285) : (i64, i64) -> i64
      %2287 = func.call @cc_nil_value() : () -> i64
      %2288 = func.call @cc_cons(%2286, %2287) : (i64, i64) -> i64
      %2289 = func.call @cc_values_pack(%2288) : (i64) -> i64
      func.call @stack_push_pointer(%2286) : (i64) -> ()
      %2290 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2291 = arith.constant 6 : i64
      %2292 = func.call @cc_make_string(%2290, %2291) : (!llvm.ptr, i64) -> i64
      %2293 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2294 = arith.constant 7 : i64
      %2295 = func.call @cc_make_string(%2293, %2294) : (!llvm.ptr, i64) -> i64
      %2296 = func.call @cc_intern(%2292, %2295) : (i64, i64) -> i64
      %2297 = func.call @cc_nil_value() : () -> i64
      %2298 = func.call @cc_cons(%2296, %2297) : (i64, i64) -> i64
      %2299 = func.call @cc_values_pack(%2298) : (i64) -> i64
      func.call @stack_push_pointer(%2296) : (i64) -> ()
      %2300 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2301 = arith.constant 15 : i64
      %2302 = func.call @cc_make_string(%2300, %2301) : (!llvm.ptr, i64) -> i64
      %2303 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2304 = arith.constant 7 : i64
      %2305 = func.call @cc_make_string(%2303, %2304) : (!llvm.ptr, i64) -> i64
      %2306 = func.call @cc_intern(%2302, %2305) : (i64, i64) -> i64
      %2307 = func.call @cc_nil_value() : () -> i64
      %2308 = func.call @cc_cons(%2306, %2307) : (i64, i64) -> i64
      %2309 = func.call @cc_values_pack(%2308) : (i64) -> i64
      func.call @stack_push_pointer(%2306) : (i64) -> ()
      %2310 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2311 = arith.constant 8 : i64
      %2312 = func.call @cc_make_string(%2310, %2311) : (!llvm.ptr, i64) -> i64
      %2313 = func.call @cc_nil_value() : () -> i64
      %2314 = func.call @cc_intern(%2312, %2313) : (i64, i64) -> i64
      %2315 = func.call @cc_nil_value() : () -> i64
      %2316 = func.call @cc_cons(%2314, %2315) : (i64, i64) -> i64
      %2317 = func.call @cc_values_pack(%2316) : (i64) -> i64
      func.call @stack_push_pointer(%2314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2318 = func.call @stack_pop_pointer() : () -> i64
      %2319 = func.call @stack_pop_pointer() : () -> i64
      %2320 = func.call @cc_cons(%2319, %2318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2320) : (i64) -> ()
      %2321 = func.call @stack_pop_pointer() : () -> i64
      %2322 = func.call @stack_pop_pointer() : () -> i64
      %2323 = func.call @cc_cons(%2322, %2321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2323) : (i64) -> ()
      %2324 = func.call @stack_pop_pointer() : () -> i64
      %2325 = func.call @stack_pop_pointer() : () -> i64
      %2326 = func.call @cc_cons(%2325, %2324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2326) : (i64) -> ()
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
      %2340 = func.call @stack_pop_pointer() : () -> i64
      %2341 = func.call @cc_cons(%2340, %2339) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2341) : (i64) -> ()
      %2342 = func.call @stack_pop_pointer() : () -> i64
      %2343 = func.call @stack_pop_pointer() : () -> i64
      %2344 = func.call @cc_cons(%2343, %2342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2344) : (i64) -> ()
      %2345 = func.call @stack_pop_pointer() : () -> i64
      %2346 = func.call @stack_pop_pointer() : () -> i64
      %2347 = func.call @cc_cons(%2346, %2345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2347) : (i64) -> ()
      %2348 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2349 = arith.constant 10 : i64
      %2350 = func.call @cc_make_string(%2348, %2349) : (!llvm.ptr, i64) -> i64
      %2351 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2352 = arith.constant 11 : i64
      %2353 = func.call @cc_make_string(%2351, %2352) : (!llvm.ptr, i64) -> i64
      %2354 = func.call @cc_intern(%2350, %2353) : (i64, i64) -> i64
      %2355 = func.call @cc_nil_value() : () -> i64
      %2356 = func.call @cc_cons(%2354, %2355) : (i64, i64) -> i64
      %2357 = func.call @cc_values_pack(%2356) : (i64) -> i64
      func.call @stack_push_pointer(%2354) : (i64) -> ()
      %2358 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2359 = arith.constant 4 : i64
      %2360 = func.call @cc_make_string(%2358, %2359) : (!llvm.ptr, i64) -> i64
      %2361 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2362 = arith.constant 11 : i64
      %2363 = func.call @cc_make_string(%2361, %2362) : (!llvm.ptr, i64) -> i64
      %2364 = func.call @cc_intern(%2360, %2363) : (i64, i64) -> i64
      %2365 = func.call @cc_nil_value() : () -> i64
      %2366 = func.call @cc_cons(%2364, %2365) : (i64, i64) -> i64
      %2367 = func.call @cc_values_pack(%2366) : (i64) -> i64
      func.call @stack_push_pointer(%2364) : (i64) -> ()
      %2368 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2369 = arith.constant 6 : i64
      %2370 = func.call @cc_make_string(%2368, %2369) : (!llvm.ptr, i64) -> i64
      %2371 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2372 = arith.constant 11 : i64
      %2373 = func.call @cc_make_string(%2371, %2372) : (!llvm.ptr, i64) -> i64
      %2374 = func.call @cc_intern(%2370, %2373) : (i64, i64) -> i64
      %2375 = func.call @cc_nil_value() : () -> i64
      %2376 = func.call @cc_cons(%2374, %2375) : (i64, i64) -> i64
      %2377 = func.call @cc_values_pack(%2376) : (i64) -> i64
      func.call @stack_push_pointer(%2374) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2378 = func.call @stack_pop_pointer() : () -> i64
      %2379 = func.call @stack_pop_pointer() : () -> i64
      %2380 = func.call @cc_cons(%2379, %2378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2380) : (i64) -> ()
      %2381 = func.call @stack_pop_pointer() : () -> i64
      %2382 = func.call @stack_pop_pointer() : () -> i64
      %2383 = func.call @cc_cons(%2382, %2381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2383) : (i64) -> ()
      %2384 = func.call @stack_pop_pointer() : () -> i64
      %2385 = func.call @stack_pop_pointer() : () -> i64
      %2386 = func.call @cc_cons(%2385, %2384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2387 = func.call @stack_pop_pointer() : () -> i64
      %2388 = func.call @stack_pop_pointer() : () -> i64
      %2389 = func.call @cc_cons(%2388, %2387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2389) : (i64) -> ()
      %2390 = func.call @stack_pop_pointer() : () -> i64
      %2391 = func.call @stack_pop_pointer() : () -> i64
      %2392 = func.call @cc_cons(%2391, %2390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2392) : (i64) -> ()
      %2393 = func.call @stack_pop_pointer() : () -> i64
      %2394 = func.call @stack_pop_pointer() : () -> i64
      %2395 = func.call @cc_cons(%2394, %2393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2395) : (i64) -> ()
      %2396 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2397 = arith.constant 14 : i64
      %2398 = func.call @cc_make_string(%2396, %2397) : (!llvm.ptr, i64) -> i64
      %2399 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2400 = arith.constant 11 : i64
      %2401 = func.call @cc_make_string(%2399, %2400) : (!llvm.ptr, i64) -> i64
      %2402 = func.call @cc_intern(%2398, %2401) : (i64, i64) -> i64
      %2403 = func.call @cc_nil_value() : () -> i64
      %2404 = func.call @cc_cons(%2402, %2403) : (i64, i64) -> i64
      %2405 = func.call @cc_values_pack(%2404) : (i64) -> i64
      func.call @stack_push_pointer(%2402) : (i64) -> ()
      %2406 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2407 = arith.constant 6 : i64
      %2408 = func.call @cc_make_string(%2406, %2407) : (!llvm.ptr, i64) -> i64
      %2409 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2410 = arith.constant 11 : i64
      %2411 = func.call @cc_make_string(%2409, %2410) : (!llvm.ptr, i64) -> i64
      %2412 = func.call @cc_intern(%2408, %2411) : (i64, i64) -> i64
      %2413 = func.call @cc_nil_value() : () -> i64
      %2414 = func.call @cc_cons(%2412, %2413) : (i64, i64) -> i64
      %2415 = func.call @cc_values_pack(%2414) : (i64) -> i64
      func.call @stack_push_pointer(%2412) : (i64) -> ()
      %2416 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2417 = arith.constant 8 : i64
      %2418 = func.call @cc_make_string(%2416, %2417) : (!llvm.ptr, i64) -> i64
      %2419 = func.call @cc_nil_value() : () -> i64
      %2420 = func.call @cc_intern(%2418, %2419) : (i64, i64) -> i64
      %2421 = func.call @cc_nil_value() : () -> i64
      %2422 = func.call @cc_cons(%2420, %2421) : (i64, i64) -> i64
      %2423 = func.call @cc_values_pack(%2422) : (i64) -> i64
      func.call @stack_push_pointer(%2420) : (i64) -> ()
      %2424 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2425 = arith.constant 9 : i64
      %2426 = func.call @cc_make_string(%2424, %2425) : (!llvm.ptr, i64) -> i64
      %2427 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2428 = arith.constant 7 : i64
      %2429 = func.call @cc_make_string(%2427, %2428) : (!llvm.ptr, i64) -> i64
      %2430 = func.call @cc_intern(%2426, %2429) : (i64, i64) -> i64
      %2431 = func.call @cc_nil_value() : () -> i64
      %2432 = func.call @cc_cons(%2430, %2431) : (i64, i64) -> i64
      %2433 = func.call @cc_values_pack(%2432) : (i64) -> i64
      func.call @stack_push_pointer(%2430) : (i64) -> ()
      %2434 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2435 = arith.constant 5 : i64
      %2436 = func.call @cc_make_string(%2434, %2435) : (!llvm.ptr, i64) -> i64
      %2437 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2438 = arith.constant 7 : i64
      %2439 = func.call @cc_make_string(%2437, %2438) : (!llvm.ptr, i64) -> i64
      %2440 = func.call @cc_intern(%2436, %2439) : (i64, i64) -> i64
      %2441 = func.call @cc_nil_value() : () -> i64
      %2442 = func.call @cc_cons(%2440, %2441) : (i64, i64) -> i64
      %2443 = func.call @cc_values_pack(%2442) : (i64) -> i64
      func.call @stack_push_pointer(%2440) : (i64) -> ()
      %2444 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2445 = arith.constant 15 : i64
      %2446 = func.call @cc_make_string(%2444, %2445) : (!llvm.ptr, i64) -> i64
      %2447 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2448 = arith.constant 7 : i64
      %2449 = func.call @cc_make_string(%2447, %2448) : (!llvm.ptr, i64) -> i64
      %2450 = func.call @cc_intern(%2446, %2449) : (i64, i64) -> i64
      %2451 = func.call @cc_nil_value() : () -> i64
      %2452 = func.call @cc_cons(%2450, %2451) : (i64, i64) -> i64
      %2453 = func.call @cc_values_pack(%2452) : (i64) -> i64
      func.call @stack_push_pointer(%2450) : (i64) -> ()
      %2454 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2455 = arith.constant 8 : i64
      %2456 = func.call @cc_make_string(%2454, %2455) : (!llvm.ptr, i64) -> i64
      %2457 = func.call @cc_nil_value() : () -> i64
      %2458 = func.call @cc_intern(%2456, %2457) : (i64, i64) -> i64
      %2459 = func.call @cc_nil_value() : () -> i64
      %2460 = func.call @cc_cons(%2458, %2459) : (i64, i64) -> i64
      %2461 = func.call @cc_values_pack(%2460) : (i64) -> i64
      func.call @stack_push_pointer(%2458) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2462 = func.call @stack_pop_pointer() : () -> i64
      %2463 = func.call @stack_pop_pointer() : () -> i64
      %2464 = func.call @cc_cons(%2463, %2462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2464) : (i64) -> ()
      %2465 = func.call @stack_pop_pointer() : () -> i64
      %2466 = func.call @stack_pop_pointer() : () -> i64
      %2467 = func.call @cc_cons(%2466, %2465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2467) : (i64) -> ()
      %2468 = func.call @stack_pop_pointer() : () -> i64
      %2469 = func.call @stack_pop_pointer() : () -> i64
      %2470 = func.call @cc_cons(%2469, %2468) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2470) : (i64) -> ()
      %2471 = func.call @stack_pop_pointer() : () -> i64
      %2472 = func.call @stack_pop_pointer() : () -> i64
      %2473 = func.call @cc_cons(%2472, %2471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2473) : (i64) -> ()
      %2474 = func.call @stack_pop_pointer() : () -> i64
      %2475 = func.call @stack_pop_pointer() : () -> i64
      %2476 = func.call @cc_cons(%2475, %2474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2476) : (i64) -> ()
      %2477 = func.call @stack_pop_pointer() : () -> i64
      %2478 = func.call @stack_pop_pointer() : () -> i64
      %2479 = func.call @cc_cons(%2478, %2477) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2479) : (i64) -> ()
      %2480 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2481 = arith.constant 3 : i64
      %2482 = func.call @cc_make_string(%2480, %2481) : (!llvm.ptr, i64) -> i64
      %2483 = func.call @cc_nil_value() : () -> i64
      %2484 = func.call @cc_intern(%2482, %2483) : (i64, i64) -> i64
      %2485 = func.call @cc_nil_value() : () -> i64
      %2486 = func.call @cc_cons(%2484, %2485) : (i64, i64) -> i64
      %2487 = func.call @cc_values_pack(%2486) : (i64) -> i64
      func.call @stack_push_pointer(%2484) : (i64) -> ()
      %2488 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2489 = arith.constant 9 : i64
      %2490 = func.call @cc_make_string(%2488, %2489) : (!llvm.ptr, i64) -> i64
      %2491 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2492 = arith.constant 11 : i64
      %2493 = func.call @cc_make_string(%2491, %2492) : (!llvm.ptr, i64) -> i64
      %2494 = func.call @cc_intern(%2490, %2493) : (i64, i64) -> i64
      %2495 = func.call @cc_nil_value() : () -> i64
      %2496 = func.call @cc_cons(%2494, %2495) : (i64, i64) -> i64
      %2497 = func.call @cc_values_pack(%2496) : (i64) -> i64
      func.call @stack_push_pointer(%2494) : (i64) -> ()
      %2498 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2499 = arith.constant 9 : i64
      %2500 = func.call @cc_make_string(%2498, %2499) : (!llvm.ptr, i64) -> i64
      %2501 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2502 = arith.constant 11 : i64
      %2503 = func.call @cc_make_string(%2501, %2502) : (!llvm.ptr, i64) -> i64
      %2504 = func.call @cc_intern(%2500, %2503) : (i64, i64) -> i64
      %2505 = func.call @cc_nil_value() : () -> i64
      %2506 = func.call @cc_cons(%2504, %2505) : (i64, i64) -> i64
      %2507 = func.call @cc_values_pack(%2506) : (i64) -> i64
      func.call @stack_push_pointer(%2504) : (i64) -> ()
      %2508 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2509 = arith.constant 6 : i64
      %2510 = func.call @cc_make_string(%2508, %2509) : (!llvm.ptr, i64) -> i64
      %2511 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2512 = arith.constant 11 : i64
      %2513 = func.call @cc_make_string(%2511, %2512) : (!llvm.ptr, i64) -> i64
      %2514 = func.call @cc_intern(%2510, %2513) : (i64, i64) -> i64
      %2515 = func.call @cc_nil_value() : () -> i64
      %2516 = func.call @cc_cons(%2514, %2515) : (i64, i64) -> i64
      %2517 = func.call @cc_values_pack(%2516) : (i64) -> i64
      func.call @stack_push_pointer(%2514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2518 = func.call @stack_pop_pointer() : () -> i64
      %2519 = func.call @stack_pop_pointer() : () -> i64
      %2520 = func.call @cc_cons(%2519, %2518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2520) : (i64) -> ()
      %2521 = func.call @stack_pop_pointer() : () -> i64
      %2522 = func.call @stack_pop_pointer() : () -> i64
      %2523 = func.call @cc_cons(%2522, %2521) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2523) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2524 = func.call @stack_pop_pointer() : () -> i64
      %2525 = func.call @stack_pop_pointer() : () -> i64
      %2526 = func.call @cc_cons(%2525, %2524) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2526) : (i64) -> ()
      %2527 = func.call @stack_pop_pointer() : () -> i64
      %2528 = func.call @stack_pop_pointer() : () -> i64
      %2529 = func.call @cc_cons(%2528, %2527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2529) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2530 = func.call @stack_pop_pointer() : () -> i64
      %2531 = func.call @stack_pop_pointer() : () -> i64
      %2532 = func.call @cc_cons(%2531, %2530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2532) : (i64) -> ()
      %2533 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2534 = arith.constant 2 : i64
      %2535 = func.call @cc_make_string(%2533, %2534) : (!llvm.ptr, i64) -> i64
      %2536 = func.call @cc_nil_value() : () -> i64
      %2537 = func.call @cc_intern(%2535, %2536) : (i64, i64) -> i64
      %2538 = func.call @cc_nil_value() : () -> i64
      %2539 = func.call @cc_cons(%2537, %2538) : (i64, i64) -> i64
      %2540 = func.call @cc_values_pack(%2539) : (i64) -> i64
      func.call @stack_push_pointer(%2537) : (i64) -> ()
      %2541 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2542 = arith.constant 3 : i64
      %2543 = func.call @cc_make_string(%2541, %2542) : (!llvm.ptr, i64) -> i64
      %2544 = func.call @cc_nil_value() : () -> i64
      %2545 = func.call @cc_intern(%2543, %2544) : (i64, i64) -> i64
      %2546 = func.call @cc_nil_value() : () -> i64
      %2547 = func.call @cc_cons(%2545, %2546) : (i64, i64) -> i64
      %2548 = func.call @cc_values_pack(%2547) : (i64) -> i64
      func.call @stack_push_pointer(%2545) : (i64) -> ()
      %2549 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2550 = arith.constant 6 : i64
      %2551 = func.call @cc_make_string(%2549, %2550) : (!llvm.ptr, i64) -> i64
      %2552 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2553 = arith.constant 11 : i64
      %2554 = func.call @cc_make_string(%2552, %2553) : (!llvm.ptr, i64) -> i64
      %2555 = func.call @cc_intern(%2551, %2554) : (i64, i64) -> i64
      %2556 = func.call @cc_nil_value() : () -> i64
      %2557 = func.call @cc_cons(%2555, %2556) : (i64, i64) -> i64
      %2558 = func.call @cc_values_pack(%2557) : (i64) -> i64
      func.call @stack_push_pointer(%2555) : (i64) -> ()
      %2559 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2560 = arith.constant 8 : i64
      %2561 = func.call @cc_make_string(%2559, %2560) : (!llvm.ptr, i64) -> i64
      %2562 = func.call @cc_nil_value() : () -> i64
      %2563 = func.call @cc_intern(%2561, %2562) : (i64, i64) -> i64
      %2564 = func.call @cc_nil_value() : () -> i64
      %2565 = func.call @cc_cons(%2563, %2564) : (i64, i64) -> i64
      %2566 = func.call @cc_values_pack(%2565) : (i64) -> i64
      func.call @stack_push_pointer(%2563) : (i64) -> ()
      %2567 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2567) : (i64) -> ()
      %2568 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2569 = arith.constant 5 : i64
      %2570 = func.call @cc_make_string(%2568, %2569) : (!llvm.ptr, i64) -> i64
      %2571 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2572 = arith.constant 7 : i64
      %2573 = func.call @cc_make_string(%2571, %2572) : (!llvm.ptr, i64) -> i64
      %2574 = func.call @cc_intern(%2570, %2573) : (i64, i64) -> i64
      %2575 = func.call @cc_nil_value() : () -> i64
      %2576 = func.call @cc_cons(%2574, %2575) : (i64, i64) -> i64
      %2577 = func.call @cc_values_pack(%2576) : (i64) -> i64
      func.call @stack_push_pointer(%2574) : (i64) -> ()
      %2578 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2579 = arith.constant 5 : i64
      %2580 = func.call @cc_make_string(%2578, %2579) : (!llvm.ptr, i64) -> i64
      %2581 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2582 = arith.constant 7 : i64
      %2583 = func.call @cc_make_string(%2581, %2582) : (!llvm.ptr, i64) -> i64
      %2584 = func.call @cc_intern(%2580, %2583) : (i64, i64) -> i64
      %2585 = func.call @cc_nil_value() : () -> i64
      %2586 = func.call @cc_cons(%2584, %2585) : (i64, i64) -> i64
      %2587 = func.call @cc_values_pack(%2586) : (i64) -> i64
      func.call @stack_push_pointer(%2584) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2588 = func.call @stack_pop_pointer() : () -> i64
      %2589 = func.call @stack_pop_pointer() : () -> i64
      %2590 = func.call @cc_cons(%2589, %2588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2590) : (i64) -> ()
      %2591 = func.call @stack_pop_pointer() : () -> i64
      %2592 = func.call @stack_pop_pointer() : () -> i64
      %2593 = func.call @cc_cons(%2592, %2591) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2593) : (i64) -> ()
      %2594 = func.call @stack_pop_pointer() : () -> i64
      %2595 = func.call @stack_pop_pointer() : () -> i64
      %2596 = func.call @cc_cons(%2594, %2595) : (i64, i64) -> i64
      %2597 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2598 = arith.constant 5 : i64
      %2599 = func.call @cc_make_string(%2597, %2598) : (!llvm.ptr, i64) -> i64
      %2600 = func.call @cc_nil_value() : () -> i64
      %2601 = func.call @cc_intern(%2599, %2600) : (i64, i64) -> i64
      %2602 = func.call @cc_nil_value() : () -> i64
      %2603 = func.call @cc_cons(%2601, %2602) : (i64, i64) -> i64
      %2604 = func.call @cc_values_pack(%2603) : (i64) -> i64
      %2605 = func.call @cc_cons(%2601, %2596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2605) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2606 = func.call @stack_pop_pointer() : () -> i64
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = func.call @cc_cons(%2607, %2606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2608) : (i64) -> ()
      %2609 = func.call @stack_pop_pointer() : () -> i64
      %2610 = func.call @stack_pop_pointer() : () -> i64
      %2611 = func.call @cc_cons(%2610, %2609) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2611) : (i64) -> ()
      %2612 = func.call @stack_pop_pointer() : () -> i64
      %2613 = func.call @stack_pop_pointer() : () -> i64
      %2614 = func.call @cc_cons(%2613, %2612) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2614) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2615 = func.call @stack_pop_pointer() : () -> i64
      %2616 = func.call @stack_pop_pointer() : () -> i64
      %2617 = func.call @cc_cons(%2616, %2615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2617) : (i64) -> ()
      %2618 = func.call @stack_pop_pointer() : () -> i64
      %2619 = func.call @stack_pop_pointer() : () -> i64
      %2620 = func.call @cc_cons(%2619, %2618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2620) : (i64) -> ()
      %2621 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2622 = arith.constant 5 : i64
      %2623 = func.call @cc_make_string(%2621, %2622) : (!llvm.ptr, i64) -> i64
      %2624 = func.call @cc_nil_value() : () -> i64
      %2625 = func.call @cc_intern(%2623, %2624) : (i64, i64) -> i64
      %2626 = func.call @cc_nil_value() : () -> i64
      %2627 = func.call @cc_cons(%2625, %2626) : (i64, i64) -> i64
      %2628 = func.call @cc_values_pack(%2627) : (i64) -> i64
      func.call @stack_push_pointer(%2625) : (i64) -> ()
      %2629 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2630 = arith.constant 2 : i64
      %2631 = func.call @cc_make_string(%2629, %2630) : (!llvm.ptr, i64) -> i64
      %2632 = func.call @cc_nil_value() : () -> i64
      %2633 = func.call @cc_intern(%2631, %2632) : (i64, i64) -> i64
      %2634 = func.call @cc_nil_value() : () -> i64
      %2635 = func.call @cc_cons(%2633, %2634) : (i64, i64) -> i64
      %2636 = func.call @cc_values_pack(%2635) : (i64) -> i64
      func.call @stack_push_pointer(%2633) : (i64) -> ()
      %2637 = llvm.mlir.addressof @str268 : !llvm.ptr
      %2638 = arith.constant 3 : i64
      %2639 = func.call @cc_make_string(%2637, %2638) : (!llvm.ptr, i64) -> i64
      %2640 = func.call @cc_nil_value() : () -> i64
      %2641 = func.call @cc_intern(%2639, %2640) : (i64, i64) -> i64
      %2642 = func.call @cc_nil_value() : () -> i64
      %2643 = func.call @cc_cons(%2641, %2642) : (i64, i64) -> i64
      %2644 = func.call @cc_values_pack(%2643) : (i64) -> i64
      func.call @stack_push_pointer(%2641) : (i64) -> ()
      %2645 = llvm.mlir.addressof @str269 : !llvm.ptr
      %2646 = arith.constant 5 : i64
      %2647 = func.call @cc_make_string(%2645, %2646) : (!llvm.ptr, i64) -> i64
      %2648 = llvm.mlir.addressof @str270 : !llvm.ptr
      %2649 = arith.constant 11 : i64
      %2650 = func.call @cc_make_string(%2648, %2649) : (!llvm.ptr, i64) -> i64
      %2651 = func.call @cc_intern(%2647, %2650) : (i64, i64) -> i64
      %2652 = func.call @cc_nil_value() : () -> i64
      %2653 = func.call @cc_cons(%2651, %2652) : (i64, i64) -> i64
      %2654 = func.call @cc_values_pack(%2653) : (i64) -> i64
      func.call @stack_push_pointer(%2651) : (i64) -> ()
      %2655 = llvm.mlir.addressof @str271 : !llvm.ptr
      %2656 = arith.constant 4 : i64
      %2657 = func.call @cc_make_string(%2655, %2656) : (!llvm.ptr, i64) -> i64
      %2658 = llvm.mlir.addressof @str272 : !llvm.ptr
      %2659 = arith.constant 11 : i64
      %2660 = func.call @cc_make_string(%2658, %2659) : (!llvm.ptr, i64) -> i64
      %2661 = func.call @cc_intern(%2657, %2660) : (i64, i64) -> i64
      %2662 = func.call @cc_nil_value() : () -> i64
      %2663 = func.call @cc_cons(%2661, %2662) : (i64, i64) -> i64
      %2664 = func.call @cc_values_pack(%2663) : (i64) -> i64
      func.call @stack_push_pointer(%2661) : (i64) -> ()
      %2665 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2666 = arith.constant 9 : i64
      %2667 = func.call @cc_make_string(%2665, %2666) : (!llvm.ptr, i64) -> i64
      %2668 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2669 = arith.constant 11 : i64
      %2670 = func.call @cc_make_string(%2668, %2669) : (!llvm.ptr, i64) -> i64
      %2671 = func.call @cc_intern(%2667, %2670) : (i64, i64) -> i64
      %2672 = func.call @cc_nil_value() : () -> i64
      %2673 = func.call @cc_cons(%2671, %2672) : (i64, i64) -> i64
      %2674 = func.call @cc_values_pack(%2673) : (i64) -> i64
      func.call @stack_push_pointer(%2671) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2675 = func.call @stack_pop_pointer() : () -> i64
      %2676 = func.call @stack_pop_pointer() : () -> i64
      %2677 = func.call @cc_cons(%2676, %2675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2677) : (i64) -> ()
      %2678 = func.call @stack_pop_pointer() : () -> i64
      %2679 = func.call @stack_pop_pointer() : () -> i64
      %2680 = func.call @cc_cons(%2679, %2678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2680) : (i64) -> ()
      %2681 = func.call @stack_pop_pointer() : () -> i64
      %2682 = func.call @stack_pop_pointer() : () -> i64
      %2683 = func.call @cc_cons(%2682, %2681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2683) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2684 = func.call @stack_pop_pointer() : () -> i64
      %2685 = func.call @stack_pop_pointer() : () -> i64
      %2686 = func.call @cc_cons(%2685, %2684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2686) : (i64) -> ()
      %2687 = func.call @stack_pop_pointer() : () -> i64
      %2688 = func.call @stack_pop_pointer() : () -> i64
      %2689 = func.call @cc_cons(%2688, %2687) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2689) : (i64) -> ()
      %2690 = llvm.mlir.addressof @str275 : !llvm.ptr
      %2691 = arith.constant 5 : i64
      %2692 = func.call @cc_make_string(%2690, %2691) : (!llvm.ptr, i64) -> i64
      %2693 = func.call @cc_nil_value() : () -> i64
      %2694 = func.call @cc_intern(%2692, %2693) : (i64, i64) -> i64
      %2695 = func.call @cc_nil_value() : () -> i64
      %2696 = func.call @cc_cons(%2694, %2695) : (i64, i64) -> i64
      %2697 = func.call @cc_values_pack(%2696) : (i64) -> i64
      func.call @stack_push_pointer(%2694) : (i64) -> ()
      %2698 = llvm.mlir.addressof @str276 : !llvm.ptr
      %2699 = arith.constant 4 : i64
      %2700 = func.call @cc_make_string(%2698, %2699) : (!llvm.ptr, i64) -> i64
      %2701 = llvm.mlir.addressof @str277 : !llvm.ptr
      %2702 = arith.constant 11 : i64
      %2703 = func.call @cc_make_string(%2701, %2702) : (!llvm.ptr, i64) -> i64
      %2704 = func.call @cc_intern(%2700, %2703) : (i64, i64) -> i64
      %2705 = func.call @cc_nil_value() : () -> i64
      %2706 = func.call @cc_cons(%2704, %2705) : (i64, i64) -> i64
      %2707 = func.call @cc_values_pack(%2706) : (i64) -> i64
      func.call @stack_push_pointer(%2704) : (i64) -> ()
      %2708 = llvm.mlir.addressof @str278 : !llvm.ptr
      %2709 = arith.constant 4 : i64
      %2710 = func.call @cc_make_string(%2708, %2709) : (!llvm.ptr, i64) -> i64
      %2711 = llvm.mlir.addressof @str279 : !llvm.ptr
      %2712 = arith.constant 11 : i64
      %2713 = func.call @cc_make_string(%2711, %2712) : (!llvm.ptr, i64) -> i64
      %2714 = func.call @cc_intern(%2710, %2713) : (i64, i64) -> i64
      %2715 = func.call @cc_nil_value() : () -> i64
      %2716 = func.call @cc_cons(%2714, %2715) : (i64, i64) -> i64
      %2717 = func.call @cc_values_pack(%2716) : (i64) -> i64
      func.call @stack_push_pointer(%2714) : (i64) -> ()
      %2718 = llvm.mlir.addressof @str280 : !llvm.ptr
      %2719 = arith.constant 4 : i64
      %2720 = func.call @cc_make_string(%2718, %2719) : (!llvm.ptr, i64) -> i64
      %2721 = llvm.mlir.addressof @str281 : !llvm.ptr
      %2722 = arith.constant 11 : i64
      %2723 = func.call @cc_make_string(%2721, %2722) : (!llvm.ptr, i64) -> i64
      %2724 = func.call @cc_intern(%2720, %2723) : (i64, i64) -> i64
      %2725 = func.call @cc_nil_value() : () -> i64
      %2726 = func.call @cc_cons(%2724, %2725) : (i64, i64) -> i64
      %2727 = func.call @cc_values_pack(%2726) : (i64) -> i64
      func.call @stack_push_pointer(%2724) : (i64) -> ()
      %2728 = llvm.mlir.addressof @str282 : !llvm.ptr
      %2729 = arith.constant 9 : i64
      %2730 = func.call @cc_make_string(%2728, %2729) : (!llvm.ptr, i64) -> i64
      %2731 = llvm.mlir.addressof @str283 : !llvm.ptr
      %2732 = arith.constant 11 : i64
      %2733 = func.call @cc_make_string(%2731, %2732) : (!llvm.ptr, i64) -> i64
      %2734 = func.call @cc_intern(%2730, %2733) : (i64, i64) -> i64
      %2735 = func.call @cc_nil_value() : () -> i64
      %2736 = func.call @cc_cons(%2734, %2735) : (i64, i64) -> i64
      %2737 = func.call @cc_values_pack(%2736) : (i64) -> i64
      func.call @stack_push_pointer(%2734) : (i64) -> ()
      %2738 = llvm.mlir.addressof @str284 : !llvm.ptr
      %2739 = arith.constant 8 : i64
      %2740 = func.call @cc_make_string(%2738, %2739) : (!llvm.ptr, i64) -> i64
      %2741 = func.call @cc_nil_value() : () -> i64
      %2742 = func.call @cc_intern(%2740, %2741) : (i64, i64) -> i64
      %2743 = func.call @cc_nil_value() : () -> i64
      %2744 = func.call @cc_cons(%2742, %2743) : (i64, i64) -> i64
      %2745 = func.call @cc_values_pack(%2744) : (i64) -> i64
      func.call @stack_push_pointer(%2742) : (i64) -> ()
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
      %2753 = func.call @stack_pop_pointer() : () -> i64
      %2754 = func.call @cc_cons(%2753, %2752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2754) : (i64) -> ()
      %2755 = func.call @stack_pop_pointer() : () -> i64
      %2756 = func.call @stack_pop_pointer() : () -> i64
      %2757 = func.call @cc_cons(%2756, %2755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2757) : (i64) -> ()
      %2758 = llvm.mlir.addressof @str285 : !llvm.ptr
      %2759 = arith.constant 3 : i64
      %2760 = func.call @cc_make_string(%2758, %2759) : (!llvm.ptr, i64) -> i64
      %2761 = func.call @cc_nil_value() : () -> i64
      %2762 = func.call @cc_intern(%2760, %2761) : (i64, i64) -> i64
      %2763 = func.call @cc_nil_value() : () -> i64
      %2764 = func.call @cc_cons(%2762, %2763) : (i64, i64) -> i64
      %2765 = func.call @cc_values_pack(%2764) : (i64) -> i64
      func.call @stack_push_pointer(%2762) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2766 = func.call @stack_pop_pointer() : () -> i64
      %2767 = func.call @stack_pop_pointer() : () -> i64
      %2768 = func.call @cc_cons(%2767, %2766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2768) : (i64) -> ()
      %2769 = func.call @stack_pop_pointer() : () -> i64
      %2770 = func.call @stack_pop_pointer() : () -> i64
      %2771 = func.call @cc_cons(%2770, %2769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2771) : (i64) -> ()
      %2772 = func.call @stack_pop_pointer() : () -> i64
      %2773 = func.call @stack_pop_pointer() : () -> i64
      %2774 = func.call @cc_cons(%2773, %2772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2774) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2775 = func.call @stack_pop_pointer() : () -> i64
      %2776 = func.call @stack_pop_pointer() : () -> i64
      %2777 = func.call @cc_cons(%2776, %2775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2777) : (i64) -> ()
      %2778 = func.call @stack_pop_pointer() : () -> i64
      %2779 = func.call @stack_pop_pointer() : () -> i64
      %2780 = func.call @cc_cons(%2779, %2778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2780) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2781 = func.call @stack_pop_pointer() : () -> i64
      %2782 = func.call @stack_pop_pointer() : () -> i64
      %2783 = func.call @cc_cons(%2782, %2781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2783) : (i64) -> ()
      %2784 = func.call @stack_pop_pointer() : () -> i64
      %2785 = func.call @stack_pop_pointer() : () -> i64
      %2786 = func.call @cc_cons(%2785, %2784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2786) : (i64) -> ()
      %2787 = func.call @stack_pop_pointer() : () -> i64
      %2788 = func.call @stack_pop_pointer() : () -> i64
      %2789 = func.call @cc_cons(%2788, %2787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2789) : (i64) -> ()
      %2790 = func.call @stack_pop_pointer() : () -> i64
      %2791 = func.call @stack_pop_pointer() : () -> i64
      %2792 = func.call @cc_cons(%2791, %2790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2792) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2793 = func.call @stack_pop_pointer() : () -> i64
      %2794 = func.call @stack_pop_pointer() : () -> i64
      %2795 = func.call @cc_cons(%2794, %2793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2795) : (i64) -> ()
      %2796 = func.call @stack_pop_pointer() : () -> i64
      %2797 = func.call @stack_pop_pointer() : () -> i64
      %2798 = func.call @cc_cons(%2797, %2796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2798) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2799 = func.call @stack_pop_pointer() : () -> i64
      %2800 = func.call @stack_pop_pointer() : () -> i64
      %2801 = func.call @cc_cons(%2800, %2799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2801) : (i64) -> ()
      %2802 = func.call @stack_pop_pointer() : () -> i64
      %2803 = func.call @stack_pop_pointer() : () -> i64
      %2804 = func.call @cc_cons(%2803, %2802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2804) : (i64) -> ()
      %2805 = func.call @stack_pop_pointer() : () -> i64
      %2806 = func.call @stack_pop_pointer() : () -> i64
      %2807 = func.call @cc_cons(%2806, %2805) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2807) : (i64) -> ()
      %2808 = func.call @stack_pop_pointer() : () -> i64
      %2809 = func.call @stack_pop_pointer() : () -> i64
      %2810 = func.call @cc_cons(%2809, %2808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2810) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2811 = func.call @stack_pop_pointer() : () -> i64
      %2812 = func.call @stack_pop_pointer() : () -> i64
      %2813 = func.call @cc_cons(%2812, %2811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2813) : (i64) -> ()
      %2814 = func.call @stack_pop_pointer() : () -> i64
      %2815 = func.call @stack_pop_pointer() : () -> i64
      %2816 = func.call @cc_cons(%2815, %2814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2816) : (i64) -> ()
      %2817 = func.call @stack_pop_pointer() : () -> i64
      %2818 = func.call @stack_pop_pointer() : () -> i64
      %2819 = func.call @cc_cons(%2818, %2817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2819) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2820 = func.call @stack_pop_pointer() : () -> i64
      %2821 = func.call @stack_pop_pointer() : () -> i64
      %2822 = func.call @cc_cons(%2821, %2820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2822) : (i64) -> ()
      %2823 = func.call @stack_pop_pointer() : () -> i64
      %2824 = func.call @stack_pop_pointer() : () -> i64
      %2825 = func.call @cc_cons(%2824, %2823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2825) : (i64) -> ()
      %2826 = func.call @stack_pop_pointer() : () -> i64
      %2827 = func.call @stack_pop_pointer() : () -> i64
      %2828 = func.call @cc_cons(%2827, %2826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2828) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2829 = func.call @stack_pop_pointer() : () -> i64
      %2830 = func.call @stack_pop_pointer() : () -> i64
      %2831 = func.call @cc_cons(%2830, %2829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2831) : (i64) -> ()
      %2832 = func.call @stack_pop_pointer() : () -> i64
      %2833 = func.call @stack_pop_pointer() : () -> i64
      %2834 = func.call @cc_cons(%2833, %2832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2834) : (i64) -> ()
      %2835 = func.call @stack_pop_pointer() : () -> i64
      %2836 = func.call @stack_pop_pointer() : () -> i64
      %2837 = func.call @cc_cons(%2836, %2835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2837) : (i64) -> ()
      %2838 = func.call @stack_pop_pointer() : () -> i64
      %2839 = func.call @stack_pop_pointer() : () -> i64
      %2840 = func.call @cc_cons(%2839, %2838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2840) : (i64) -> ()
      %2841 = llvm.mlir.addressof @str286 : !llvm.ptr
      %2842 = arith.constant 2 : i64
      %2843 = func.call @cc_make_string(%2841, %2842) : (!llvm.ptr, i64) -> i64
      %2844 = func.call @cc_nil_value() : () -> i64
      %2845 = func.call @cc_intern(%2843, %2844) : (i64, i64) -> i64
      %2846 = func.call @cc_nil_value() : () -> i64
      %2847 = func.call @cc_cons(%2845, %2846) : (i64, i64) -> i64
      %2848 = func.call @cc_values_pack(%2847) : (i64) -> i64
      func.call @stack_push_pointer(%2845) : (i64) -> ()
      %2849 = llvm.mlir.addressof @str287 : !llvm.ptr
      %2850 = arith.constant 10 : i64
      %2851 = func.call @cc_make_string(%2849, %2850) : (!llvm.ptr, i64) -> i64
      %2852 = llvm.mlir.addressof @str288 : !llvm.ptr
      %2853 = arith.constant 11 : i64
      %2854 = func.call @cc_make_string(%2852, %2853) : (!llvm.ptr, i64) -> i64
      %2855 = func.call @cc_intern(%2851, %2854) : (i64, i64) -> i64
      %2856 = func.call @cc_nil_value() : () -> i64
      %2857 = func.call @cc_cons(%2855, %2856) : (i64, i64) -> i64
      %2858 = func.call @cc_values_pack(%2857) : (i64) -> i64
      func.call @stack_push_pointer(%2855) : (i64) -> ()
      %2859 = llvm.mlir.addressof @str289 : !llvm.ptr
      %2860 = arith.constant 8 : i64
      %2861 = func.call @cc_make_string(%2859, %2860) : (!llvm.ptr, i64) -> i64
      %2862 = func.call @cc_nil_value() : () -> i64
      %2863 = func.call @cc_intern(%2861, %2862) : (i64, i64) -> i64
      %2864 = func.call @cc_nil_value() : () -> i64
      %2865 = func.call @cc_cons(%2863, %2864) : (i64, i64) -> i64
      %2866 = func.call @cc_values_pack(%2865) : (i64) -> i64
      func.call @stack_push_pointer(%2863) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2867 = func.call @stack_pop_pointer() : () -> i64
      %2868 = func.call @stack_pop_pointer() : () -> i64
      %2869 = func.call @cc_cons(%2868, %2867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2869) : (i64) -> ()
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @stack_pop_pointer() : () -> i64
      %2872 = func.call @cc_cons(%2871, %2870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2872) : (i64) -> ()
      %2873 = llvm.mlir.addressof @str290 : !llvm.ptr
      %2874 = arith.constant 5 : i64
      %2875 = func.call @cc_make_string(%2873, %2874) : (!llvm.ptr, i64) -> i64
      %2876 = func.call @cc_nil_value() : () -> i64
      %2877 = func.call @cc_intern(%2875, %2876) : (i64, i64) -> i64
      %2878 = func.call @cc_nil_value() : () -> i64
      %2879 = func.call @cc_cons(%2877, %2878) : (i64, i64) -> i64
      %2880 = func.call @cc_values_pack(%2879) : (i64) -> i64
      func.call @stack_push_pointer(%2877) : (i64) -> ()
      %2881 = llvm.mlir.addressof @str291 : !llvm.ptr
      %2882 = arith.constant 11 : i64
      %2883 = func.call @cc_make_string(%2881, %2882) : (!llvm.ptr, i64) -> i64
      %2884 = llvm.mlir.addressof @str292 : !llvm.ptr
      %2885 = arith.constant 11 : i64
      %2886 = func.call @cc_make_string(%2884, %2885) : (!llvm.ptr, i64) -> i64
      %2887 = func.call @cc_intern(%2883, %2886) : (i64, i64) -> i64
      %2888 = func.call @cc_nil_value() : () -> i64
      %2889 = func.call @cc_cons(%2887, %2888) : (i64, i64) -> i64
      %2890 = func.call @cc_values_pack(%2889) : (i64) -> i64
      func.call @stack_push_pointer(%2887) : (i64) -> ()
      %2891 = llvm.mlir.addressof @str293 : !llvm.ptr
      %2892 = arith.constant 8 : i64
      %2893 = func.call @cc_make_string(%2891, %2892) : (!llvm.ptr, i64) -> i64
      %2894 = func.call @cc_nil_value() : () -> i64
      %2895 = func.call @cc_intern(%2893, %2894) : (i64, i64) -> i64
      %2896 = func.call @cc_nil_value() : () -> i64
      %2897 = func.call @cc_cons(%2895, %2896) : (i64, i64) -> i64
      %2898 = func.call @cc_values_pack(%2897) : (i64) -> i64
      func.call @stack_push_pointer(%2895) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2899 = func.call @stack_pop_pointer() : () -> i64
      %2900 = func.call @stack_pop_pointer() : () -> i64
      %2901 = func.call @cc_cons(%2900, %2899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2901) : (i64) -> ()
      %2902 = func.call @stack_pop_pointer() : () -> i64
      %2903 = func.call @stack_pop_pointer() : () -> i64
      %2904 = func.call @cc_cons(%2903, %2902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2904) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2905 = func.call @stack_pop_pointer() : () -> i64
      %2906 = func.call @stack_pop_pointer() : () -> i64
      %2907 = func.call @cc_cons(%2906, %2905) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2907) : (i64) -> ()
      %2908 = func.call @stack_pop_pointer() : () -> i64
      %2909 = func.call @stack_pop_pointer() : () -> i64
      %2910 = func.call @cc_cons(%2909, %2908) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2910) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2911 = func.call @stack_pop_pointer() : () -> i64
      %2912 = func.call @stack_pop_pointer() : () -> i64
      %2913 = func.call @cc_cons(%2912, %2911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2913) : (i64) -> ()
      %2914 = func.call @stack_pop_pointer() : () -> i64
      %2915 = func.call @stack_pop_pointer() : () -> i64
      %2916 = func.call @cc_cons(%2915, %2914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2916) : (i64) -> ()
      %2917 = func.call @stack_pop_pointer() : () -> i64
      %2918 = func.call @stack_pop_pointer() : () -> i64
      %2919 = func.call @cc_cons(%2918, %2917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2919) : (i64) -> ()
      %2920 = func.call @stack_pop_pointer() : () -> i64
      %2921 = func.call @stack_pop_pointer() : () -> i64
      %2922 = func.call @cc_cons(%2921, %2920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2922) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2923 = func.call @stack_pop_pointer() : () -> i64
      %2924 = func.call @stack_pop_pointer() : () -> i64
      %2925 = func.call @cc_cons(%2924, %2923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2925) : (i64) -> ()
      %2926 = func.call @stack_pop_pointer() : () -> i64
      %2927 = func.call @stack_pop_pointer() : () -> i64
      %2928 = func.call @cc_cons(%2927, %2926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2928) : (i64) -> ()
      %2929 = func.call @stack_pop_pointer() : () -> i64
      %2930 = func.call @stack_pop_pointer() : () -> i64
      %2931 = func.call @cc_cons(%2930, %2929) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2931) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2932 = func.call @stack_pop_pointer() : () -> i64
      %2933 = func.call @stack_pop_pointer() : () -> i64
      %2934 = func.call @cc_cons(%2933, %2932) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2934) : (i64) -> ()
      %2935 = func.call @stack_pop_pointer() : () -> i64
      %2936 = func.call @stack_pop_pointer() : () -> i64
      %2937 = func.call @cc_cons(%2936, %2935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2937) : (i64) -> ()
      %2938 = func.call @stack_pop_pointer() : () -> i64
      %2939 = func.call @stack_pop_pointer() : () -> i64
      %2940 = func.call @cc_cons(%2939, %2938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2940) : (i64) -> ()
      %2941 = func.call @stack_pop_pointer() : () -> i64
      %3400 = arith.constant 57937766645769 : i64
      %3401 = arith.constant 0 : i64
      %3402 = func.call @cc_make_closure(%3400, %3401) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3402) : (i64) -> ()
      %3403 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3404 = func.call @stack_pop_pointer() : () -> i64
      %3405 = func.call @stack_pop_pointer() : () -> i64
      %3406 = func.call @cc_cons(%3405, %3404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3406) : (i64) -> ()
      %3407 = func.call @stack_pop_pointer() : () -> i64
      %3408 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3409 = arith.constant 11 : i64
      %3410 = func.call @cc_make_string(%3408, %3409) : (!llvm.ptr, i64) -> i64
      %3411 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3412 = arith.constant 7 : i64
      %3413 = func.call @cc_make_string(%3411, %3412) : (!llvm.ptr, i64) -> i64
      %3414 = func.call @cc_intern(%3410, %3413) : (i64, i64) -> i64
      %3415 = func.call @cc_nil_value() : () -> i64
      %3416 = func.call @cc_cons(%3414, %3415) : (i64, i64) -> i64
      %3417 = func.call @cc_values_pack(%3416) : (i64) -> i64
      func.call @stack_push_pointer(%3414) : (i64) -> ()
      %3418 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3419 = func.call @stack_pop_pointer() : () -> i64
      %3420 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3421 = arith.constant 4 : i64
      %3422 = func.call @cc_make_string(%3420, %3421) : (!llvm.ptr, i64) -> i64
      %3423 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3424 = arith.constant 7 : i64
      %3425 = func.call @cc_make_string(%3423, %3424) : (!llvm.ptr, i64) -> i64
      %3426 = func.call @cc_intern(%3422, %3425) : (i64, i64) -> i64
      %3427 = func.call @cc_nil_value() : () -> i64
      %3428 = func.call @cc_cons(%3426, %3427) : (i64, i64) -> i64
      %3429 = func.call @cc_values_pack(%3428) : (i64) -> i64
      func.call @stack_push_pointer(%3426) : (i64) -> ()
      %3430 = func.call @stack_pop_pointer() : () -> i64
      %3431 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3432 = arith.constant 6 : i64
      %3433 = func.call @cc_make_string(%3431, %3432) : (!llvm.ptr, i64) -> i64
      %3434 = func.call @cc_nil_value() : () -> i64
      %3435 = func.call @cc_intern(%3433, %3434) : (i64, i64) -> i64
      %3436 = func.call @cc_nil_value() : () -> i64
      %3437 = func.call @cc_cons(%3435, %3436) : (i64, i64) -> i64
      %3438 = func.call @cc_values_pack(%3437) : (i64) -> i64
      func.call @stack_push_pointer(%3435) : (i64) -> ()
      %3439 = func.call @stack_pop_pointer() : () -> i64
      %3440 = func.call @cc_nil_value() : () -> i64
      %3441 = func.call @cc_errorp(%2074) : (i64) -> i64
      %3442 = arith.cmpi ne, %3441, %3440 : i64
      %3443 = arith.cmpi eq, %3440, %3440 : i64
      %3444 = arith.andi %3442, %3443 : i1
      %3445 = scf.if %3444 -> (i64) {
        scf.yield %2074 : i64
      } else {
        scf.yield %3440 : i64
      }
      %3446 = func.call @cc_errorp(%2941) : (i64) -> i64
      %3447 = arith.cmpi ne, %3446, %3440 : i64
      %3448 = arith.cmpi eq, %3445, %3440 : i64
      %3449 = arith.andi %3447, %3448 : i1
      %3450 = scf.if %3449 -> (i64) {
        scf.yield %2941 : i64
      } else {
        scf.yield %3445 : i64
      }
      %3451 = func.call @cc_errorp(%3403) : (i64) -> i64
      %3452 = arith.cmpi ne, %3451, %3440 : i64
      %3453 = arith.cmpi eq, %3450, %3440 : i64
      %3454 = arith.andi %3452, %3453 : i1
      %3455 = scf.if %3454 -> (i64) {
        scf.yield %3403 : i64
      } else {
        scf.yield %3450 : i64
      }
      %3456 = func.call @cc_errorp(%3407) : (i64) -> i64
      %3457 = arith.cmpi ne, %3456, %3440 : i64
      %3458 = arith.cmpi eq, %3455, %3440 : i64
      %3459 = arith.andi %3457, %3458 : i1
      %3460 = scf.if %3459 -> (i64) {
        scf.yield %3407 : i64
      } else {
        scf.yield %3455 : i64
      }
      %3461 = func.call @cc_errorp(%3418) : (i64) -> i64
      %3462 = arith.cmpi ne, %3461, %3440 : i64
      %3463 = arith.cmpi eq, %3460, %3440 : i64
      %3464 = arith.andi %3462, %3463 : i1
      %3465 = scf.if %3464 -> (i64) {
        scf.yield %3418 : i64
      } else {
        scf.yield %3460 : i64
      }
      %3466 = func.call @cc_errorp(%3419) : (i64) -> i64
      %3467 = arith.cmpi ne, %3466, %3440 : i64
      %3468 = arith.cmpi eq, %3465, %3440 : i64
      %3469 = arith.andi %3467, %3468 : i1
      %3470 = scf.if %3469 -> (i64) {
        scf.yield %3419 : i64
      } else {
        scf.yield %3465 : i64
      }
      %3471 = func.call @cc_errorp(%3430) : (i64) -> i64
      %3472 = arith.cmpi ne, %3471, %3440 : i64
      %3473 = arith.cmpi eq, %3470, %3440 : i64
      %3474 = arith.andi %3472, %3473 : i1
      %3475 = scf.if %3474 -> (i64) {
        scf.yield %3430 : i64
      } else {
        scf.yield %3470 : i64
      }
      %3476 = func.call @cc_errorp(%3439) : (i64) -> i64
      %3477 = arith.cmpi ne, %3476, %3440 : i64
      %3478 = arith.cmpi eq, %3475, %3440 : i64
      %3479 = arith.andi %3477, %3478 : i1
      %3480 = scf.if %3479 -> (i64) {
        scf.yield %3439 : i64
      } else {
        scf.yield %3475 : i64
      }
      %3481 = arith.cmpi ne, %3480, %3440 : i64
      scf.if %3481 {
        func.call @stack_push_pointer(%3480) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2074) : (i64) -> ()
        func.call @stack_push_pointer(%2941) : (i64) -> ()
        func.call @stack_push_pointer(%3403) : (i64) -> ()
        func.call @stack_push_pointer(%3407) : (i64) -> ()
        func.call @stack_push_pointer(%3418) : (i64) -> ()
        func.call @stack_push_pointer(%3419) : (i64) -> ()
        func.call @stack_push_pointer(%3430) : (i64) -> ()
        func.call @stack_push_pointer(%3439) : (i64) -> ()
        %3482 = llvm.mlir.addressof @str333 : !llvm.ptr
        %3483 = func.call @cc_make_function_ref_const(%3482) : (!llvm.ptr) -> i64
        %3484 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3483, %3484) : (i64, i64) -> ()
      }
      %3485 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3485 : i64
    }
    %3486 = func.call @cc_nil_value() : () -> i64
    %3487 = func.call @cc_errorp(%2065) : (i64) -> i64
    %3488 = arith.cmpi ne, %3487, %3486 : i64
    %3489 = scf.if %3488 -> (i64) {
      scf.yield %2065 : i64
    } else {
      %3490 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3491 = arith.constant 22 : i64
      %3492 = func.call @cc_make_string(%3490, %3491) : (!llvm.ptr, i64) -> i64
      %3493 = func.call @cc_nil_value() : () -> i64
      %3494 = func.call @cc_intern(%3492, %3493) : (i64, i64) -> i64
      %3495 = func.call @cc_nil_value() : () -> i64
      %3496 = func.call @cc_cons(%3494, %3495) : (i64, i64) -> i64
      %3497 = func.call @cc_values_pack(%3496) : (i64) -> i64
      func.call @stack_push_pointer(%3494) : (i64) -> ()
      %3498 = func.call @stack_pop_pointer() : () -> i64
      %3499 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3500 = arith.constant 14 : i64
      %3501 = func.call @cc_make_string(%3499, %3500) : (!llvm.ptr, i64) -> i64
      %3502 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3503 = arith.constant 11 : i64
      %3504 = func.call @cc_make_string(%3502, %3503) : (!llvm.ptr, i64) -> i64
      %3505 = func.call @cc_intern(%3501, %3504) : (i64, i64) -> i64
      %3506 = func.call @cc_nil_value() : () -> i64
      %3507 = func.call @cc_cons(%3505, %3506) : (i64, i64) -> i64
      %3508 = func.call @cc_values_pack(%3507) : (i64) -> i64
      func.call @stack_push_pointer(%3505) : (i64) -> ()
      %3509 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3510 = arith.constant 6 : i64
      %3511 = func.call @cc_make_string(%3509, %3510) : (!llvm.ptr, i64) -> i64
      %3512 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3513 = arith.constant 11 : i64
      %3514 = func.call @cc_make_string(%3512, %3513) : (!llvm.ptr, i64) -> i64
      %3515 = func.call @cc_intern(%3511, %3514) : (i64, i64) -> i64
      %3516 = func.call @cc_nil_value() : () -> i64
      %3517 = func.call @cc_cons(%3515, %3516) : (i64, i64) -> i64
      %3518 = func.call @cc_values_pack(%3517) : (i64) -> i64
      func.call @stack_push_pointer(%3515) : (i64) -> ()
      %3519 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3520 = arith.constant 46 : i64
      %3521 = func.call @cc_make_string(%3519, %3520) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3521) : (i64) -> ()
      %3522 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3523 = arith.constant 9 : i64
      %3524 = func.call @cc_make_string(%3522, %3523) : (!llvm.ptr, i64) -> i64
      %3525 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3526 = arith.constant 7 : i64
      %3527 = func.call @cc_make_string(%3525, %3526) : (!llvm.ptr, i64) -> i64
      %3528 = func.call @cc_intern(%3524, %3527) : (i64, i64) -> i64
      %3529 = func.call @cc_nil_value() : () -> i64
      %3530 = func.call @cc_cons(%3528, %3529) : (i64, i64) -> i64
      %3531 = func.call @cc_values_pack(%3530) : (i64) -> i64
      func.call @stack_push_pointer(%3528) : (i64) -> ()
      %3532 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3533 = arith.constant 6 : i64
      %3534 = func.call @cc_make_string(%3532, %3533) : (!llvm.ptr, i64) -> i64
      %3535 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3536 = arith.constant 7 : i64
      %3537 = func.call @cc_make_string(%3535, %3536) : (!llvm.ptr, i64) -> i64
      %3538 = func.call @cc_intern(%3534, %3537) : (i64, i64) -> i64
      %3539 = func.call @cc_nil_value() : () -> i64
      %3540 = func.call @cc_cons(%3538, %3539) : (i64, i64) -> i64
      %3541 = func.call @cc_values_pack(%3540) : (i64) -> i64
      func.call @stack_push_pointer(%3538) : (i64) -> ()
      %3542 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3543 = arith.constant 9 : i64
      %3544 = func.call @cc_make_string(%3542, %3543) : (!llvm.ptr, i64) -> i64
      %3545 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3546 = arith.constant 7 : i64
      %3547 = func.call @cc_make_string(%3545, %3546) : (!llvm.ptr, i64) -> i64
      %3548 = func.call @cc_intern(%3544, %3547) : (i64, i64) -> i64
      %3549 = func.call @cc_nil_value() : () -> i64
      %3550 = func.call @cc_cons(%3548, %3549) : (i64, i64) -> i64
      %3551 = func.call @cc_values_pack(%3550) : (i64) -> i64
      func.call @stack_push_pointer(%3548) : (i64) -> ()
      %3552 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3553 = arith.constant 9 : i64
      %3554 = func.call @cc_make_string(%3552, %3553) : (!llvm.ptr, i64) -> i64
      %3555 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3556 = arith.constant 7 : i64
      %3557 = func.call @cc_make_string(%3555, %3556) : (!llvm.ptr, i64) -> i64
      %3558 = func.call @cc_intern(%3554, %3557) : (i64, i64) -> i64
      %3559 = func.call @cc_nil_value() : () -> i64
      %3560 = func.call @cc_cons(%3558, %3559) : (i64, i64) -> i64
      %3561 = func.call @cc_values_pack(%3560) : (i64) -> i64
      func.call @stack_push_pointer(%3558) : (i64) -> ()
      %3562 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3563 = arith.constant 17 : i64
      %3564 = func.call @cc_make_string(%3562, %3563) : (!llvm.ptr, i64) -> i64
      %3565 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3566 = arith.constant 7 : i64
      %3567 = func.call @cc_make_string(%3565, %3566) : (!llvm.ptr, i64) -> i64
      %3568 = func.call @cc_intern(%3564, %3567) : (i64, i64) -> i64
      %3569 = func.call @cc_nil_value() : () -> i64
      %3570 = func.call @cc_cons(%3568, %3569) : (i64, i64) -> i64
      %3571 = func.call @cc_values_pack(%3570) : (i64) -> i64
      func.call @stack_push_pointer(%3568) : (i64) -> ()
      %3572 = llvm.mlir.addressof @str350 : !llvm.ptr
      %3573 = arith.constant 6 : i64
      %3574 = func.call @cc_make_string(%3572, %3573) : (!llvm.ptr, i64) -> i64
      %3575 = llvm.mlir.addressof @str351 : !llvm.ptr
      %3576 = arith.constant 7 : i64
      %3577 = func.call @cc_make_string(%3575, %3576) : (!llvm.ptr, i64) -> i64
      %3578 = func.call @cc_intern(%3574, %3577) : (i64, i64) -> i64
      %3579 = func.call @cc_nil_value() : () -> i64
      %3580 = func.call @cc_cons(%3578, %3579) : (i64, i64) -> i64
      %3581 = func.call @cc_values_pack(%3580) : (i64) -> i64
      func.call @stack_push_pointer(%3578) : (i64) -> ()
      %3582 = llvm.mlir.addressof @str352 : !llvm.ptr
      %3583 = arith.constant 15 : i64
      %3584 = func.call @cc_make_string(%3582, %3583) : (!llvm.ptr, i64) -> i64
      %3585 = llvm.mlir.addressof @str353 : !llvm.ptr
      %3586 = arith.constant 7 : i64
      %3587 = func.call @cc_make_string(%3585, %3586) : (!llvm.ptr, i64) -> i64
      %3588 = func.call @cc_intern(%3584, %3587) : (i64, i64) -> i64
      %3589 = func.call @cc_nil_value() : () -> i64
      %3590 = func.call @cc_cons(%3588, %3589) : (i64, i64) -> i64
      %3591 = func.call @cc_values_pack(%3590) : (i64) -> i64
      func.call @stack_push_pointer(%3588) : (i64) -> ()
      %3592 = llvm.mlir.addressof @str354 : !llvm.ptr
      %3593 = arith.constant 7 : i64
      %3594 = func.call @cc_make_string(%3592, %3593) : (!llvm.ptr, i64) -> i64
      %3595 = llvm.mlir.addressof @str355 : !llvm.ptr
      %3596 = arith.constant 7 : i64
      %3597 = func.call @cc_make_string(%3595, %3596) : (!llvm.ptr, i64) -> i64
      %3598 = func.call @cc_intern(%3594, %3597) : (i64, i64) -> i64
      %3599 = func.call @cc_nil_value() : () -> i64
      %3600 = func.call @cc_cons(%3598, %3599) : (i64, i64) -> i64
      %3601 = func.call @cc_values_pack(%3600) : (i64) -> i64
      func.call @stack_push_pointer(%3598) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3602 = func.call @stack_pop_pointer() : () -> i64
      %3603 = func.call @stack_pop_pointer() : () -> i64
      %3604 = func.call @cc_cons(%3603, %3602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3604) : (i64) -> ()
      %3605 = func.call @stack_pop_pointer() : () -> i64
      %3606 = func.call @stack_pop_pointer() : () -> i64
      %3607 = func.call @cc_cons(%3606, %3605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3607) : (i64) -> ()
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
      %3618 = func.call @stack_pop_pointer() : () -> i64
      %3619 = func.call @cc_cons(%3618, %3617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3619) : (i64) -> ()
      %3620 = func.call @stack_pop_pointer() : () -> i64
      %3621 = func.call @stack_pop_pointer() : () -> i64
      %3622 = func.call @cc_cons(%3621, %3620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3622) : (i64) -> ()
      %3623 = func.call @stack_pop_pointer() : () -> i64
      %3624 = func.call @stack_pop_pointer() : () -> i64
      %3625 = func.call @cc_cons(%3624, %3623) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3625) : (i64) -> ()
      %3626 = func.call @stack_pop_pointer() : () -> i64
      %3627 = func.call @stack_pop_pointer() : () -> i64
      %3628 = func.call @cc_cons(%3627, %3626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3628) : (i64) -> ()
      %3629 = func.call @stack_pop_pointer() : () -> i64
      %3630 = func.call @stack_pop_pointer() : () -> i64
      %3631 = func.call @cc_cons(%3630, %3629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3631) : (i64) -> ()
      %3632 = llvm.mlir.addressof @str356 : !llvm.ptr
      %3633 = arith.constant 10 : i64
      %3634 = func.call @cc_make_string(%3632, %3633) : (!llvm.ptr, i64) -> i64
      %3635 = llvm.mlir.addressof @str357 : !llvm.ptr
      %3636 = arith.constant 11 : i64
      %3637 = func.call @cc_make_string(%3635, %3636) : (!llvm.ptr, i64) -> i64
      %3638 = func.call @cc_intern(%3634, %3637) : (i64, i64) -> i64
      %3639 = func.call @cc_nil_value() : () -> i64
      %3640 = func.call @cc_cons(%3638, %3639) : (i64, i64) -> i64
      %3641 = func.call @cc_values_pack(%3640) : (i64) -> i64
      func.call @stack_push_pointer(%3638) : (i64) -> ()
      %3642 = llvm.mlir.addressof @str358 : !llvm.ptr
      %3643 = arith.constant 9 : i64
      %3644 = func.call @cc_make_string(%3642, %3643) : (!llvm.ptr, i64) -> i64
      %3645 = llvm.mlir.addressof @str359 : !llvm.ptr
      %3646 = arith.constant 11 : i64
      %3647 = func.call @cc_make_string(%3645, %3646) : (!llvm.ptr, i64) -> i64
      %3648 = func.call @cc_intern(%3644, %3647) : (i64, i64) -> i64
      %3649 = func.call @cc_nil_value() : () -> i64
      %3650 = func.call @cc_cons(%3648, %3649) : (i64, i64) -> i64
      %3651 = func.call @cc_values_pack(%3650) : (i64) -> i64
      func.call @stack_push_pointer(%3648) : (i64) -> ()
      %3652 = arith.constant 65 : i64
      func.call @stack_push_fixnum(%3652) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3653 = func.call @stack_pop_pointer() : () -> i64
      %3654 = func.call @stack_pop_pointer() : () -> i64
      %3655 = func.call @cc_cons(%3654, %3653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3655) : (i64) -> ()
      %3656 = func.call @stack_pop_pointer() : () -> i64
      %3657 = func.call @stack_pop_pointer() : () -> i64
      %3658 = func.call @cc_cons(%3657, %3656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3658) : (i64) -> ()
      %3659 = llvm.mlir.addressof @str360 : !llvm.ptr
      %3660 = arith.constant 6 : i64
      %3661 = func.call @cc_make_string(%3659, %3660) : (!llvm.ptr, i64) -> i64
      %3662 = llvm.mlir.addressof @str361 : !llvm.ptr
      %3663 = arith.constant 11 : i64
      %3664 = func.call @cc_make_string(%3662, %3663) : (!llvm.ptr, i64) -> i64
      %3665 = func.call @cc_intern(%3661, %3664) : (i64, i64) -> i64
      %3666 = func.call @cc_nil_value() : () -> i64
      %3667 = func.call @cc_cons(%3665, %3666) : (i64, i64) -> i64
      %3668 = func.call @cc_values_pack(%3667) : (i64) -> i64
      func.call @stack_push_pointer(%3665) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3669 = func.call @stack_pop_pointer() : () -> i64
      %3670 = func.call @stack_pop_pointer() : () -> i64
      %3671 = func.call @cc_cons(%3670, %3669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3671) : (i64) -> ()
      %3672 = func.call @stack_pop_pointer() : () -> i64
      %3673 = func.call @stack_pop_pointer() : () -> i64
      %3674 = func.call @cc_cons(%3673, %3672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3674) : (i64) -> ()
      %3675 = func.call @stack_pop_pointer() : () -> i64
      %3676 = func.call @stack_pop_pointer() : () -> i64
      %3677 = func.call @cc_cons(%3676, %3675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3677) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3678 = func.call @stack_pop_pointer() : () -> i64
      %3679 = func.call @stack_pop_pointer() : () -> i64
      %3680 = func.call @cc_cons(%3679, %3678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3680) : (i64) -> ()
      %3681 = func.call @stack_pop_pointer() : () -> i64
      %3682 = func.call @stack_pop_pointer() : () -> i64
      %3683 = func.call @cc_cons(%3682, %3681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3683) : (i64) -> ()
      %3684 = func.call @stack_pop_pointer() : () -> i64
      %3685 = func.call @stack_pop_pointer() : () -> i64
      %3686 = func.call @cc_cons(%3685, %3684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3686) : (i64) -> ()
      %3687 = func.call @stack_pop_pointer() : () -> i64
      %3882 = arith.constant 57937766645770 : i64
      %3883 = arith.constant 0 : i64
      %3884 = func.call @cc_make_closure(%3882, %3883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3884) : (i64) -> ()
      %3885 = func.call @stack_pop_pointer() : () -> i64
      %3886 = arith.constant 65 : i64
      %3887 = func.call @cc_box_character(%3886) : (i64) -> i64
      func.call @stack_push_pointer(%3887) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3888 = func.call @stack_pop_pointer() : () -> i64
      %3889 = func.call @stack_pop_pointer() : () -> i64
      %3890 = func.call @cc_cons(%3889, %3888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3890) : (i64) -> ()
      %3891 = func.call @stack_pop_pointer() : () -> i64
      %3892 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3893 = arith.constant 11 : i64
      %3894 = func.call @cc_make_string(%3892, %3893) : (!llvm.ptr, i64) -> i64
      %3895 = llvm.mlir.addressof @str383 : !llvm.ptr
      %3896 = arith.constant 7 : i64
      %3897 = func.call @cc_make_string(%3895, %3896) : (!llvm.ptr, i64) -> i64
      %3898 = func.call @cc_intern(%3894, %3897) : (i64, i64) -> i64
      %3899 = func.call @cc_nil_value() : () -> i64
      %3900 = func.call @cc_cons(%3898, %3899) : (i64, i64) -> i64
      %3901 = func.call @cc_values_pack(%3900) : (i64) -> i64
      func.call @stack_push_pointer(%3898) : (i64) -> ()
      %3902 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3903 = func.call @stack_pop_pointer() : () -> i64
      %3904 = llvm.mlir.addressof @str384 : !llvm.ptr
      %3905 = arith.constant 4 : i64
      %3906 = func.call @cc_make_string(%3904, %3905) : (!llvm.ptr, i64) -> i64
      %3907 = llvm.mlir.addressof @str385 : !llvm.ptr
      %3908 = arith.constant 7 : i64
      %3909 = func.call @cc_make_string(%3907, %3908) : (!llvm.ptr, i64) -> i64
      %3910 = func.call @cc_intern(%3906, %3909) : (i64, i64) -> i64
      %3911 = func.call @cc_nil_value() : () -> i64
      %3912 = func.call @cc_cons(%3910, %3911) : (i64, i64) -> i64
      %3913 = func.call @cc_values_pack(%3912) : (i64) -> i64
      func.call @stack_push_pointer(%3910) : (i64) -> ()
      %3914 = func.call @stack_pop_pointer() : () -> i64
      %3915 = llvm.mlir.addressof @str386 : !llvm.ptr
      %3916 = arith.constant 6 : i64
      %3917 = func.call @cc_make_string(%3915, %3916) : (!llvm.ptr, i64) -> i64
      %3918 = func.call @cc_nil_value() : () -> i64
      %3919 = func.call @cc_intern(%3917, %3918) : (i64, i64) -> i64
      %3920 = func.call @cc_nil_value() : () -> i64
      %3921 = func.call @cc_cons(%3919, %3920) : (i64, i64) -> i64
      %3922 = func.call @cc_values_pack(%3921) : (i64) -> i64
      func.call @stack_push_pointer(%3919) : (i64) -> ()
      %3923 = func.call @stack_pop_pointer() : () -> i64
      %3924 = func.call @cc_nil_value() : () -> i64
      %3925 = func.call @cc_errorp(%3498) : (i64) -> i64
      %3926 = arith.cmpi ne, %3925, %3924 : i64
      %3927 = arith.cmpi eq, %3924, %3924 : i64
      %3928 = arith.andi %3926, %3927 : i1
      %3929 = scf.if %3928 -> (i64) {
        scf.yield %3498 : i64
      } else {
        scf.yield %3924 : i64
      }
      %3930 = func.call @cc_errorp(%3687) : (i64) -> i64
      %3931 = arith.cmpi ne, %3930, %3924 : i64
      %3932 = arith.cmpi eq, %3929, %3924 : i64
      %3933 = arith.andi %3931, %3932 : i1
      %3934 = scf.if %3933 -> (i64) {
        scf.yield %3687 : i64
      } else {
        scf.yield %3929 : i64
      }
      %3935 = func.call @cc_errorp(%3885) : (i64) -> i64
      %3936 = arith.cmpi ne, %3935, %3924 : i64
      %3937 = arith.cmpi eq, %3934, %3924 : i64
      %3938 = arith.andi %3936, %3937 : i1
      %3939 = scf.if %3938 -> (i64) {
        scf.yield %3885 : i64
      } else {
        scf.yield %3934 : i64
      }
      %3940 = func.call @cc_errorp(%3891) : (i64) -> i64
      %3941 = arith.cmpi ne, %3940, %3924 : i64
      %3942 = arith.cmpi eq, %3939, %3924 : i64
      %3943 = arith.andi %3941, %3942 : i1
      %3944 = scf.if %3943 -> (i64) {
        scf.yield %3891 : i64
      } else {
        scf.yield %3939 : i64
      }
      %3945 = func.call @cc_errorp(%3902) : (i64) -> i64
      %3946 = arith.cmpi ne, %3945, %3924 : i64
      %3947 = arith.cmpi eq, %3944, %3924 : i64
      %3948 = arith.andi %3946, %3947 : i1
      %3949 = scf.if %3948 -> (i64) {
        scf.yield %3902 : i64
      } else {
        scf.yield %3944 : i64
      }
      %3950 = func.call @cc_errorp(%3903) : (i64) -> i64
      %3951 = arith.cmpi ne, %3950, %3924 : i64
      %3952 = arith.cmpi eq, %3949, %3924 : i64
      %3953 = arith.andi %3951, %3952 : i1
      %3954 = scf.if %3953 -> (i64) {
        scf.yield %3903 : i64
      } else {
        scf.yield %3949 : i64
      }
      %3955 = func.call @cc_errorp(%3914) : (i64) -> i64
      %3956 = arith.cmpi ne, %3955, %3924 : i64
      %3957 = arith.cmpi eq, %3954, %3924 : i64
      %3958 = arith.andi %3956, %3957 : i1
      %3959 = scf.if %3958 -> (i64) {
        scf.yield %3914 : i64
      } else {
        scf.yield %3954 : i64
      }
      %3960 = func.call @cc_errorp(%3923) : (i64) -> i64
      %3961 = arith.cmpi ne, %3960, %3924 : i64
      %3962 = arith.cmpi eq, %3959, %3924 : i64
      %3963 = arith.andi %3961, %3962 : i1
      %3964 = scf.if %3963 -> (i64) {
        scf.yield %3923 : i64
      } else {
        scf.yield %3959 : i64
      }
      %3965 = arith.cmpi ne, %3964, %3924 : i64
      scf.if %3965 {
        func.call @stack_push_pointer(%3964) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3498) : (i64) -> ()
        func.call @stack_push_pointer(%3687) : (i64) -> ()
        func.call @stack_push_pointer(%3885) : (i64) -> ()
        func.call @stack_push_pointer(%3891) : (i64) -> ()
        func.call @stack_push_pointer(%3902) : (i64) -> ()
        func.call @stack_push_pointer(%3903) : (i64) -> ()
        func.call @stack_push_pointer(%3914) : (i64) -> ()
        func.call @stack_push_pointer(%3923) : (i64) -> ()
        %3966 = llvm.mlir.addressof @str387 : !llvm.ptr
        %3967 = func.call @cc_make_function_ref_const(%3966) : (!llvm.ptr) -> i64
        %3968 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3967, %3968) : (i64, i64) -> ()
      }
      %3969 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3969 : i64
    }
    %3970 = func.call @cc_nil_value() : () -> i64
    %3971 = func.call @cc_errorp(%3489) : (i64) -> i64
    %3972 = arith.cmpi ne, %3971, %3970 : i64
    %3973 = scf.if %3972 -> (i64) {
      scf.yield %3489 : i64
    } else {
      %3974 = llvm.mlir.addressof @str388 : !llvm.ptr
      %3975 = arith.constant 23 : i64
      %3976 = func.call @cc_make_string(%3974, %3975) : (!llvm.ptr, i64) -> i64
      %3977 = func.call @cc_nil_value() : () -> i64
      %3978 = func.call @cc_intern(%3976, %3977) : (i64, i64) -> i64
      %3979 = func.call @cc_nil_value() : () -> i64
      %3980 = func.call @cc_cons(%3978, %3979) : (i64, i64) -> i64
      %3981 = func.call @cc_values_pack(%3980) : (i64) -> i64
      func.call @stack_push_pointer(%3978) : (i64) -> ()
      %3982 = func.call @stack_pop_pointer() : () -> i64
      %3983 = llvm.mlir.addressof @str389 : !llvm.ptr
      %3984 = arith.constant 3 : i64
      %3985 = func.call @cc_make_string(%3983, %3984) : (!llvm.ptr, i64) -> i64
      %3986 = func.call @cc_nil_value() : () -> i64
      %3987 = func.call @cc_intern(%3985, %3986) : (i64, i64) -> i64
      %3988 = func.call @cc_nil_value() : () -> i64
      %3989 = func.call @cc_cons(%3987, %3988) : (i64, i64) -> i64
      %3990 = func.call @cc_values_pack(%3989) : (i64) -> i64
      func.call @stack_push_pointer(%3987) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3991 = llvm.mlir.addressof @str390 : !llvm.ptr
      %3992 = arith.constant 4 : i64
      %3993 = func.call @cc_make_string(%3991, %3992) : (!llvm.ptr, i64) -> i64
      %3994 = llvm.mlir.addressof @str391 : !llvm.ptr
      %3995 = arith.constant 11 : i64
      %3996 = func.call @cc_make_string(%3994, %3995) : (!llvm.ptr, i64) -> i64
      %3997 = func.call @cc_intern(%3993, %3996) : (i64, i64) -> i64
      %3998 = func.call @cc_nil_value() : () -> i64
      %3999 = func.call @cc_cons(%3997, %3998) : (i64, i64) -> i64
      %4000 = func.call @cc_values_pack(%3999) : (i64) -> i64
      func.call @stack_push_pointer(%3997) : (i64) -> ()
      %4001 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4002 = arith.constant 8 : i64
      %4003 = func.call @cc_make_string(%4001, %4002) : (!llvm.ptr, i64) -> i64
      %4004 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4005 = arith.constant 11 : i64
      %4006 = func.call @cc_make_string(%4004, %4005) : (!llvm.ptr, i64) -> i64
      %4007 = func.call @cc_intern(%4003, %4006) : (i64, i64) -> i64
      %4008 = func.call @cc_nil_value() : () -> i64
      %4009 = func.call @cc_cons(%4007, %4008) : (i64, i64) -> i64
      %4010 = func.call @cc_values_pack(%4009) : (i64) -> i64
      func.call @stack_push_pointer(%4007) : (i64) -> ()
      %4011 = llvm.mlir.addressof @str394 : !llvm.ptr
      %4012 = arith.constant 42 : i64
      %4013 = func.call @cc_make_string(%4011, %4012) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4013) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4014 = func.call @stack_pop_pointer() : () -> i64
      %4015 = func.call @stack_pop_pointer() : () -> i64
      %4016 = func.call @cc_cons(%4015, %4014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4016) : (i64) -> ()
      %4017 = func.call @stack_pop_pointer() : () -> i64
      %4018 = func.call @stack_pop_pointer() : () -> i64
      %4019 = func.call @cc_cons(%4018, %4017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4019) : (i64) -> ()
      %4020 = llvm.mlir.addressof @str395 : !llvm.ptr
      %4021 = arith.constant 15 : i64
      %4022 = func.call @cc_make_string(%4020, %4021) : (!llvm.ptr, i64) -> i64
      %4023 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4024 = arith.constant 7 : i64
      %4025 = func.call @cc_make_string(%4023, %4024) : (!llvm.ptr, i64) -> i64
      %4026 = func.call @cc_intern(%4022, %4025) : (i64, i64) -> i64
      %4027 = func.call @cc_nil_value() : () -> i64
      %4028 = func.call @cc_cons(%4026, %4027) : (i64, i64) -> i64
      %4029 = func.call @cc_values_pack(%4028) : (i64) -> i64
      func.call @stack_push_pointer(%4026) : (i64) -> ()
      %4030 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4031 = arith.constant 7 : i64
      %4032 = func.call @cc_make_string(%4030, %4031) : (!llvm.ptr, i64) -> i64
      %4033 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4034 = arith.constant 7 : i64
      %4035 = func.call @cc_make_string(%4033, %4034) : (!llvm.ptr, i64) -> i64
      %4036 = func.call @cc_intern(%4032, %4035) : (i64, i64) -> i64
      %4037 = func.call @cc_nil_value() : () -> i64
      %4038 = func.call @cc_cons(%4036, %4037) : (i64, i64) -> i64
      %4039 = func.call @cc_values_pack(%4038) : (i64) -> i64
      func.call @stack_push_pointer(%4036) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4040 = func.call @stack_pop_pointer() : () -> i64
      %4041 = func.call @stack_pop_pointer() : () -> i64
      %4042 = func.call @cc_cons(%4041, %4040) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4042) : (i64) -> ()
      %4043 = func.call @stack_pop_pointer() : () -> i64
      %4044 = func.call @stack_pop_pointer() : () -> i64
      %4045 = func.call @cc_cons(%4044, %4043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4045) : (i64) -> ()
      %4046 = func.call @stack_pop_pointer() : () -> i64
      %4047 = func.call @stack_pop_pointer() : () -> i64
      %4048 = func.call @cc_cons(%4047, %4046) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4048) : (i64) -> ()
      %4049 = func.call @stack_pop_pointer() : () -> i64
      %4050 = func.call @stack_pop_pointer() : () -> i64
      %4051 = func.call @cc_cons(%4050, %4049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4051) : (i64) -> ()
      %4052 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4053 = arith.constant 18 : i64
      %4054 = func.call @cc_make_string(%4052, %4053) : (!llvm.ptr, i64) -> i64
      %4055 = func.call @cc_nil_value() : () -> i64
      %4056 = func.call @cc_intern(%4054, %4055) : (i64, i64) -> i64
      %4057 = func.call @cc_nil_value() : () -> i64
      %4058 = func.call @cc_cons(%4056, %4057) : (i64, i64) -> i64
      %4059 = func.call @cc_values_pack(%4058) : (i64) -> i64
      func.call @stack_push_pointer(%4056) : (i64) -> ()
      %4060 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4061 = arith.constant 15 : i64
      %4062 = func.call @cc_make_string(%4060, %4061) : (!llvm.ptr, i64) -> i64
      %4063 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4064 = arith.constant 9 : i64
      %4065 = func.call @cc_make_string(%4063, %4064) : (!llvm.ptr, i64) -> i64
      %4066 = func.call @cc_intern(%4062, %4065) : (i64, i64) -> i64
      %4067 = func.call @cc_nil_value() : () -> i64
      %4068 = func.call @cc_cons(%4066, %4067) : (i64, i64) -> i64
      %4069 = func.call @cc_values_pack(%4068) : (i64) -> i64
      func.call @stack_push_pointer(%4066) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4070 = func.call @stack_pop_pointer() : () -> i64
      %4071 = func.call @stack_pop_pointer() : () -> i64
      %4072 = func.call @cc_cons(%4071, %4070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4072) : (i64) -> ()
      %4073 = func.call @stack_pop_pointer() : () -> i64
      %4074 = func.call @stack_pop_pointer() : () -> i64
      %4075 = func.call @cc_cons(%4074, %4073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4075) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4076 = func.call @stack_pop_pointer() : () -> i64
      %4077 = func.call @stack_pop_pointer() : () -> i64
      %4078 = func.call @cc_cons(%4077, %4076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4078) : (i64) -> ()
      %4079 = func.call @stack_pop_pointer() : () -> i64
      %4080 = func.call @stack_pop_pointer() : () -> i64
      %4081 = func.call @cc_cons(%4080, %4079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4081) : (i64) -> ()
      %4082 = func.call @stack_pop_pointer() : () -> i64
      %4083 = func.call @stack_pop_pointer() : () -> i64
      %4084 = func.call @cc_cons(%4083, %4082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4084) : (i64) -> ()
      %4085 = func.call @stack_pop_pointer() : () -> i64
      %4086 = func.call @stack_pop_pointer() : () -> i64
      %4087 = func.call @cc_cons(%4086, %4085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4087) : (i64) -> ()
      %4088 = func.call @stack_pop_pointer() : () -> i64
      %4170 = arith.constant 57937766645771 : i64
      %4171 = arith.constant 0 : i64
      %4172 = func.call @cc_make_closure(%4170, %4171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4172) : (i64) -> ()
      %4173 = func.call @stack_pop_pointer() : () -> i64
      %4174 = arith.constant 206 : i64
      func.call @stack_push_fixnum(%4174) : (i64) -> ()
      %4175 = arith.constant 357 : i64
      func.call @stack_push_fixnum(%4175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4176 = func.call @stack_pop_pointer() : () -> i64
      %4177 = func.call @stack_pop_pointer() : () -> i64
      %4178 = func.call @cc_cons(%4177, %4176) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4178) : (i64) -> ()
      %4179 = func.call @stack_pop_pointer() : () -> i64
      %4180 = func.call @stack_pop_pointer() : () -> i64
      %4181 = func.call @cc_cons(%4180, %4179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4181) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4182 = func.call @stack_pop_pointer() : () -> i64
      %4183 = func.call @stack_pop_pointer() : () -> i64
      %4184 = func.call @cc_cons(%4183, %4182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4184) : (i64) -> ()
      %4185 = func.call @stack_pop_pointer() : () -> i64
      %4186 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4187 = arith.constant 11 : i64
      %4188 = func.call @cc_make_string(%4186, %4187) : (!llvm.ptr, i64) -> i64
      %4189 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4190 = arith.constant 7 : i64
      %4191 = func.call @cc_make_string(%4189, %4190) : (!llvm.ptr, i64) -> i64
      %4192 = func.call @cc_intern(%4188, %4191) : (i64, i64) -> i64
      %4193 = func.call @cc_nil_value() : () -> i64
      %4194 = func.call @cc_cons(%4192, %4193) : (i64, i64) -> i64
      %4195 = func.call @cc_values_pack(%4194) : (i64) -> i64
      func.call @stack_push_pointer(%4192) : (i64) -> ()
      %4196 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4197 = func.call @stack_pop_pointer() : () -> i64
      %4198 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4199 = arith.constant 4 : i64
      %4200 = func.call @cc_make_string(%4198, %4199) : (!llvm.ptr, i64) -> i64
      %4201 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4202 = arith.constant 7 : i64
      %4203 = func.call @cc_make_string(%4201, %4202) : (!llvm.ptr, i64) -> i64
      %4204 = func.call @cc_intern(%4200, %4203) : (i64, i64) -> i64
      %4205 = func.call @cc_nil_value() : () -> i64
      %4206 = func.call @cc_cons(%4204, %4205) : (i64, i64) -> i64
      %4207 = func.call @cc_values_pack(%4206) : (i64) -> i64
      func.call @stack_push_pointer(%4204) : (i64) -> ()
      %4208 = func.call @stack_pop_pointer() : () -> i64
      %4209 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4210 = arith.constant 6 : i64
      %4211 = func.call @cc_make_string(%4209, %4210) : (!llvm.ptr, i64) -> i64
      %4212 = func.call @cc_nil_value() : () -> i64
      %4213 = func.call @cc_intern(%4211, %4212) : (i64, i64) -> i64
      %4214 = func.call @cc_nil_value() : () -> i64
      %4215 = func.call @cc_cons(%4213, %4214) : (i64, i64) -> i64
      %4216 = func.call @cc_values_pack(%4215) : (i64) -> i64
      func.call @stack_push_pointer(%4213) : (i64) -> ()
      %4217 = func.call @stack_pop_pointer() : () -> i64
      %4218 = func.call @cc_nil_value() : () -> i64
      %4219 = func.call @cc_errorp(%3982) : (i64) -> i64
      %4220 = arith.cmpi ne, %4219, %4218 : i64
      %4221 = arith.cmpi eq, %4218, %4218 : i64
      %4222 = arith.andi %4220, %4221 : i1
      %4223 = scf.if %4222 -> (i64) {
        scf.yield %3982 : i64
      } else {
        scf.yield %4218 : i64
      }
      %4224 = func.call @cc_errorp(%4088) : (i64) -> i64
      %4225 = arith.cmpi ne, %4224, %4218 : i64
      %4226 = arith.cmpi eq, %4223, %4218 : i64
      %4227 = arith.andi %4225, %4226 : i1
      %4228 = scf.if %4227 -> (i64) {
        scf.yield %4088 : i64
      } else {
        scf.yield %4223 : i64
      }
      %4229 = func.call @cc_errorp(%4173) : (i64) -> i64
      %4230 = arith.cmpi ne, %4229, %4218 : i64
      %4231 = arith.cmpi eq, %4228, %4218 : i64
      %4232 = arith.andi %4230, %4231 : i1
      %4233 = scf.if %4232 -> (i64) {
        scf.yield %4173 : i64
      } else {
        scf.yield %4228 : i64
      }
      %4234 = func.call @cc_errorp(%4185) : (i64) -> i64
      %4235 = arith.cmpi ne, %4234, %4218 : i64
      %4236 = arith.cmpi eq, %4233, %4218 : i64
      %4237 = arith.andi %4235, %4236 : i1
      %4238 = scf.if %4237 -> (i64) {
        scf.yield %4185 : i64
      } else {
        scf.yield %4233 : i64
      }
      %4239 = func.call @cc_errorp(%4196) : (i64) -> i64
      %4240 = arith.cmpi ne, %4239, %4218 : i64
      %4241 = arith.cmpi eq, %4238, %4218 : i64
      %4242 = arith.andi %4240, %4241 : i1
      %4243 = scf.if %4242 -> (i64) {
        scf.yield %4196 : i64
      } else {
        scf.yield %4238 : i64
      }
      %4244 = func.call @cc_errorp(%4197) : (i64) -> i64
      %4245 = arith.cmpi ne, %4244, %4218 : i64
      %4246 = arith.cmpi eq, %4243, %4218 : i64
      %4247 = arith.andi %4245, %4246 : i1
      %4248 = scf.if %4247 -> (i64) {
        scf.yield %4197 : i64
      } else {
        scf.yield %4243 : i64
      }
      %4249 = func.call @cc_errorp(%4208) : (i64) -> i64
      %4250 = arith.cmpi ne, %4249, %4218 : i64
      %4251 = arith.cmpi eq, %4248, %4218 : i64
      %4252 = arith.andi %4250, %4251 : i1
      %4253 = scf.if %4252 -> (i64) {
        scf.yield %4208 : i64
      } else {
        scf.yield %4248 : i64
      }
      %4254 = func.call @cc_errorp(%4217) : (i64) -> i64
      %4255 = arith.cmpi ne, %4254, %4218 : i64
      %4256 = arith.cmpi eq, %4253, %4218 : i64
      %4257 = arith.andi %4255, %4256 : i1
      %4258 = scf.if %4257 -> (i64) {
        scf.yield %4217 : i64
      } else {
        scf.yield %4253 : i64
      }
      %4259 = arith.cmpi ne, %4258, %4218 : i64
      scf.if %4259 {
        func.call @stack_push_pointer(%4258) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3982) : (i64) -> ()
        func.call @stack_push_pointer(%4088) : (i64) -> ()
        func.call @stack_push_pointer(%4173) : (i64) -> ()
        func.call @stack_push_pointer(%4185) : (i64) -> ()
        func.call @stack_push_pointer(%4196) : (i64) -> ()
        func.call @stack_push_pointer(%4197) : (i64) -> ()
        func.call @stack_push_pointer(%4208) : (i64) -> ()
        func.call @stack_push_pointer(%4217) : (i64) -> ()
        %4260 = llvm.mlir.addressof @str416 : !llvm.ptr
        %4261 = func.call @cc_make_function_ref_const(%4260) : (!llvm.ptr) -> i64
        %4262 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4261, %4262) : (i64, i64) -> ()
      }
      %4263 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4263 : i64
    }
    %4264 = func.call @cc_nil_value() : () -> i64
    %4265 = func.call @cc_errorp(%3973) : (i64) -> i64
    %4266 = arith.cmpi ne, %4265, %4264 : i64
    %4267 = scf.if %4266 -> (i64) {
      scf.yield %3973 : i64
    } else {
      %4268 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4269 = arith.constant 26 : i64
      %4270 = func.call @cc_make_string(%4268, %4269) : (!llvm.ptr, i64) -> i64
      %4271 = func.call @cc_nil_value() : () -> i64
      %4272 = func.call @cc_intern(%4270, %4271) : (i64, i64) -> i64
      %4273 = func.call @cc_nil_value() : () -> i64
      %4274 = func.call @cc_cons(%4272, %4273) : (i64, i64) -> i64
      %4275 = func.call @cc_values_pack(%4274) : (i64) -> i64
      func.call @stack_push_pointer(%4272) : (i64) -> ()
      %4276 = func.call @stack_pop_pointer() : () -> i64
      %4277 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4278 = arith.constant 3 : i64
      %4279 = func.call @cc_make_string(%4277, %4278) : (!llvm.ptr, i64) -> i64
      %4280 = func.call @cc_nil_value() : () -> i64
      %4281 = func.call @cc_intern(%4279, %4280) : (i64, i64) -> i64
      %4282 = func.call @cc_nil_value() : () -> i64
      %4283 = func.call @cc_cons(%4281, %4282) : (i64, i64) -> i64
      %4284 = func.call @cc_values_pack(%4283) : (i64) -> i64
      func.call @stack_push_pointer(%4281) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4285 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4286 = arith.constant 4 : i64
      %4287 = func.call @cc_make_string(%4285, %4286) : (!llvm.ptr, i64) -> i64
      %4288 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4289 = arith.constant 11 : i64
      %4290 = func.call @cc_make_string(%4288, %4289) : (!llvm.ptr, i64) -> i64
      %4291 = func.call @cc_intern(%4287, %4290) : (i64, i64) -> i64
      %4292 = func.call @cc_nil_value() : () -> i64
      %4293 = func.call @cc_cons(%4291, %4292) : (i64, i64) -> i64
      %4294 = func.call @cc_values_pack(%4293) : (i64) -> i64
      func.call @stack_push_pointer(%4291) : (i64) -> ()
      %4295 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4296 = arith.constant 8 : i64
      %4297 = func.call @cc_make_string(%4295, %4296) : (!llvm.ptr, i64) -> i64
      %4298 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4299 = arith.constant 11 : i64
      %4300 = func.call @cc_make_string(%4298, %4299) : (!llvm.ptr, i64) -> i64
      %4301 = func.call @cc_intern(%4297, %4300) : (i64, i64) -> i64
      %4302 = func.call @cc_nil_value() : () -> i64
      %4303 = func.call @cc_cons(%4301, %4302) : (i64, i64) -> i64
      %4304 = func.call @cc_values_pack(%4303) : (i64) -> i64
      func.call @stack_push_pointer(%4301) : (i64) -> ()
      %4305 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4306 = arith.constant 42 : i64
      %4307 = func.call @cc_make_string(%4305, %4306) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4307) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4308 = func.call @stack_pop_pointer() : () -> i64
      %4309 = func.call @stack_pop_pointer() : () -> i64
      %4310 = func.call @cc_cons(%4309, %4308) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4310) : (i64) -> ()
      %4311 = func.call @stack_pop_pointer() : () -> i64
      %4312 = func.call @stack_pop_pointer() : () -> i64
      %4313 = func.call @cc_cons(%4312, %4311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4313) : (i64) -> ()
      %4314 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4315 = arith.constant 15 : i64
      %4316 = func.call @cc_make_string(%4314, %4315) : (!llvm.ptr, i64) -> i64
      %4317 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4318 = arith.constant 7 : i64
      %4319 = func.call @cc_make_string(%4317, %4318) : (!llvm.ptr, i64) -> i64
      %4320 = func.call @cc_intern(%4316, %4319) : (i64, i64) -> i64
      %4321 = func.call @cc_nil_value() : () -> i64
      %4322 = func.call @cc_cons(%4320, %4321) : (i64, i64) -> i64
      %4323 = func.call @cc_values_pack(%4322) : (i64) -> i64
      func.call @stack_push_pointer(%4320) : (i64) -> ()
      %4324 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4325 = arith.constant 10 : i64
      %4326 = func.call @cc_make_string(%4324, %4325) : (!llvm.ptr, i64) -> i64
      %4327 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4328 = arith.constant 7 : i64
      %4329 = func.call @cc_make_string(%4327, %4328) : (!llvm.ptr, i64) -> i64
      %4330 = func.call @cc_intern(%4326, %4329) : (i64, i64) -> i64
      %4331 = func.call @cc_nil_value() : () -> i64
      %4332 = func.call @cc_cons(%4330, %4331) : (i64, i64) -> i64
      %4333 = func.call @cc_values_pack(%4332) : (i64) -> i64
      func.call @stack_push_pointer(%4330) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4334 = func.call @stack_pop_pointer() : () -> i64
      %4335 = func.call @stack_pop_pointer() : () -> i64
      %4336 = func.call @cc_cons(%4335, %4334) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4336) : (i64) -> ()
      %4337 = func.call @stack_pop_pointer() : () -> i64
      %4338 = func.call @stack_pop_pointer() : () -> i64
      %4339 = func.call @cc_cons(%4338, %4337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4339) : (i64) -> ()
      %4340 = func.call @stack_pop_pointer() : () -> i64
      %4341 = func.call @stack_pop_pointer() : () -> i64
      %4342 = func.call @cc_cons(%4341, %4340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4342) : (i64) -> ()
      %4343 = func.call @stack_pop_pointer() : () -> i64
      %4344 = func.call @stack_pop_pointer() : () -> i64
      %4345 = func.call @cc_cons(%4344, %4343) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4345) : (i64) -> ()
      %4346 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4347 = arith.constant 18 : i64
      %4348 = func.call @cc_make_string(%4346, %4347) : (!llvm.ptr, i64) -> i64
      %4349 = func.call @cc_nil_value() : () -> i64
      %4350 = func.call @cc_intern(%4348, %4349) : (i64, i64) -> i64
      %4351 = func.call @cc_nil_value() : () -> i64
      %4352 = func.call @cc_cons(%4350, %4351) : (i64, i64) -> i64
      %4353 = func.call @cc_values_pack(%4352) : (i64) -> i64
      func.call @stack_push_pointer(%4350) : (i64) -> ()
      %4354 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4355 = arith.constant 15 : i64
      %4356 = func.call @cc_make_string(%4354, %4355) : (!llvm.ptr, i64) -> i64
      %4357 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4358 = arith.constant 9 : i64
      %4359 = func.call @cc_make_string(%4357, %4358) : (!llvm.ptr, i64) -> i64
      %4360 = func.call @cc_intern(%4356, %4359) : (i64, i64) -> i64
      %4361 = func.call @cc_nil_value() : () -> i64
      %4362 = func.call @cc_cons(%4360, %4361) : (i64, i64) -> i64
      %4363 = func.call @cc_values_pack(%4362) : (i64) -> i64
      func.call @stack_push_pointer(%4360) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4364 = func.call @stack_pop_pointer() : () -> i64
      %4365 = func.call @stack_pop_pointer() : () -> i64
      %4366 = func.call @cc_cons(%4365, %4364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4366) : (i64) -> ()
      %4367 = func.call @stack_pop_pointer() : () -> i64
      %4368 = func.call @stack_pop_pointer() : () -> i64
      %4369 = func.call @cc_cons(%4368, %4367) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4369) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4370 = func.call @stack_pop_pointer() : () -> i64
      %4371 = func.call @stack_pop_pointer() : () -> i64
      %4372 = func.call @cc_cons(%4371, %4370) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4372) : (i64) -> ()
      %4373 = func.call @stack_pop_pointer() : () -> i64
      %4374 = func.call @stack_pop_pointer() : () -> i64
      %4375 = func.call @cc_cons(%4374, %4373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4375) : (i64) -> ()
      %4376 = func.call @stack_pop_pointer() : () -> i64
      %4377 = func.call @stack_pop_pointer() : () -> i64
      %4378 = func.call @cc_cons(%4377, %4376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4378) : (i64) -> ()
      %4379 = func.call @stack_pop_pointer() : () -> i64
      %4380 = func.call @stack_pop_pointer() : () -> i64
      %4381 = func.call @cc_cons(%4380, %4379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4381) : (i64) -> ()
      %4382 = func.call @stack_pop_pointer() : () -> i64
      %4464 = arith.constant 57937766645772 : i64
      %4465 = arith.constant 0 : i64
      %4466 = func.call @cc_make_closure(%4464, %4465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4466) : (i64) -> ()
      %4467 = func.call @stack_pop_pointer() : () -> i64
      %4468 = arith.constant 206 : i64
      func.call @stack_push_fixnum(%4468) : (i64) -> ()
      %4469 = arith.constant 357 : i64
      func.call @stack_push_fixnum(%4469) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4470 = func.call @stack_pop_pointer() : () -> i64
      %4471 = func.call @stack_pop_pointer() : () -> i64
      %4472 = func.call @cc_cons(%4471, %4470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4472) : (i64) -> ()
      %4473 = func.call @stack_pop_pointer() : () -> i64
      %4474 = func.call @stack_pop_pointer() : () -> i64
      %4475 = func.call @cc_cons(%4474, %4473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4475) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4476 = func.call @stack_pop_pointer() : () -> i64
      %4477 = func.call @stack_pop_pointer() : () -> i64
      %4478 = func.call @cc_cons(%4477, %4476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4478) : (i64) -> ()
      %4479 = func.call @stack_pop_pointer() : () -> i64
      %4480 = llvm.mlir.addressof @str440 : !llvm.ptr
      %4481 = arith.constant 11 : i64
      %4482 = func.call @cc_make_string(%4480, %4481) : (!llvm.ptr, i64) -> i64
      %4483 = llvm.mlir.addressof @str441 : !llvm.ptr
      %4484 = arith.constant 7 : i64
      %4485 = func.call @cc_make_string(%4483, %4484) : (!llvm.ptr, i64) -> i64
      %4486 = func.call @cc_intern(%4482, %4485) : (i64, i64) -> i64
      %4487 = func.call @cc_nil_value() : () -> i64
      %4488 = func.call @cc_cons(%4486, %4487) : (i64, i64) -> i64
      %4489 = func.call @cc_values_pack(%4488) : (i64) -> i64
      func.call @stack_push_pointer(%4486) : (i64) -> ()
      %4490 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4491 = func.call @stack_pop_pointer() : () -> i64
      %4492 = llvm.mlir.addressof @str442 : !llvm.ptr
      %4493 = arith.constant 4 : i64
      %4494 = func.call @cc_make_string(%4492, %4493) : (!llvm.ptr, i64) -> i64
      %4495 = llvm.mlir.addressof @str443 : !llvm.ptr
      %4496 = arith.constant 7 : i64
      %4497 = func.call @cc_make_string(%4495, %4496) : (!llvm.ptr, i64) -> i64
      %4498 = func.call @cc_intern(%4494, %4497) : (i64, i64) -> i64
      %4499 = func.call @cc_nil_value() : () -> i64
      %4500 = func.call @cc_cons(%4498, %4499) : (i64, i64) -> i64
      %4501 = func.call @cc_values_pack(%4500) : (i64) -> i64
      func.call @stack_push_pointer(%4498) : (i64) -> ()
      %4502 = func.call @stack_pop_pointer() : () -> i64
      %4503 = llvm.mlir.addressof @str444 : !llvm.ptr
      %4504 = arith.constant 6 : i64
      %4505 = func.call @cc_make_string(%4503, %4504) : (!llvm.ptr, i64) -> i64
      %4506 = func.call @cc_nil_value() : () -> i64
      %4507 = func.call @cc_intern(%4505, %4506) : (i64, i64) -> i64
      %4508 = func.call @cc_nil_value() : () -> i64
      %4509 = func.call @cc_cons(%4507, %4508) : (i64, i64) -> i64
      %4510 = func.call @cc_values_pack(%4509) : (i64) -> i64
      func.call @stack_push_pointer(%4507) : (i64) -> ()
      %4511 = func.call @stack_pop_pointer() : () -> i64
      %4512 = func.call @cc_nil_value() : () -> i64
      %4513 = func.call @cc_errorp(%4276) : (i64) -> i64
      %4514 = arith.cmpi ne, %4513, %4512 : i64
      %4515 = arith.cmpi eq, %4512, %4512 : i64
      %4516 = arith.andi %4514, %4515 : i1
      %4517 = scf.if %4516 -> (i64) {
        scf.yield %4276 : i64
      } else {
        scf.yield %4512 : i64
      }
      %4518 = func.call @cc_errorp(%4382) : (i64) -> i64
      %4519 = arith.cmpi ne, %4518, %4512 : i64
      %4520 = arith.cmpi eq, %4517, %4512 : i64
      %4521 = arith.andi %4519, %4520 : i1
      %4522 = scf.if %4521 -> (i64) {
        scf.yield %4382 : i64
      } else {
        scf.yield %4517 : i64
      }
      %4523 = func.call @cc_errorp(%4467) : (i64) -> i64
      %4524 = arith.cmpi ne, %4523, %4512 : i64
      %4525 = arith.cmpi eq, %4522, %4512 : i64
      %4526 = arith.andi %4524, %4525 : i1
      %4527 = scf.if %4526 -> (i64) {
        scf.yield %4467 : i64
      } else {
        scf.yield %4522 : i64
      }
      %4528 = func.call @cc_errorp(%4479) : (i64) -> i64
      %4529 = arith.cmpi ne, %4528, %4512 : i64
      %4530 = arith.cmpi eq, %4527, %4512 : i64
      %4531 = arith.andi %4529, %4530 : i1
      %4532 = scf.if %4531 -> (i64) {
        scf.yield %4479 : i64
      } else {
        scf.yield %4527 : i64
      }
      %4533 = func.call @cc_errorp(%4490) : (i64) -> i64
      %4534 = arith.cmpi ne, %4533, %4512 : i64
      %4535 = arith.cmpi eq, %4532, %4512 : i64
      %4536 = arith.andi %4534, %4535 : i1
      %4537 = scf.if %4536 -> (i64) {
        scf.yield %4490 : i64
      } else {
        scf.yield %4532 : i64
      }
      %4538 = func.call @cc_errorp(%4491) : (i64) -> i64
      %4539 = arith.cmpi ne, %4538, %4512 : i64
      %4540 = arith.cmpi eq, %4537, %4512 : i64
      %4541 = arith.andi %4539, %4540 : i1
      %4542 = scf.if %4541 -> (i64) {
        scf.yield %4491 : i64
      } else {
        scf.yield %4537 : i64
      }
      %4543 = func.call @cc_errorp(%4502) : (i64) -> i64
      %4544 = arith.cmpi ne, %4543, %4512 : i64
      %4545 = arith.cmpi eq, %4542, %4512 : i64
      %4546 = arith.andi %4544, %4545 : i1
      %4547 = scf.if %4546 -> (i64) {
        scf.yield %4502 : i64
      } else {
        scf.yield %4542 : i64
      }
      %4548 = func.call @cc_errorp(%4511) : (i64) -> i64
      %4549 = arith.cmpi ne, %4548, %4512 : i64
      %4550 = arith.cmpi eq, %4547, %4512 : i64
      %4551 = arith.andi %4549, %4550 : i1
      %4552 = scf.if %4551 -> (i64) {
        scf.yield %4511 : i64
      } else {
        scf.yield %4547 : i64
      }
      %4553 = arith.cmpi ne, %4552, %4512 : i64
      scf.if %4553 {
        func.call @stack_push_pointer(%4552) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4276) : (i64) -> ()
        func.call @stack_push_pointer(%4382) : (i64) -> ()
        func.call @stack_push_pointer(%4467) : (i64) -> ()
        func.call @stack_push_pointer(%4479) : (i64) -> ()
        func.call @stack_push_pointer(%4490) : (i64) -> ()
        func.call @stack_push_pointer(%4491) : (i64) -> ()
        func.call @stack_push_pointer(%4502) : (i64) -> ()
        func.call @stack_push_pointer(%4511) : (i64) -> ()
        %4554 = llvm.mlir.addressof @str445 : !llvm.ptr
        %4555 = func.call @cc_make_function_ref_const(%4554) : (!llvm.ptr) -> i64
        %4556 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4555, %4556) : (i64, i64) -> ()
      }
      %4557 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4557 : i64
    }
    %4558 = func.call @cc_nil_value() : () -> i64
    %4559 = func.call @cc_errorp(%4267) : (i64) -> i64
    %4560 = arith.cmpi ne, %4559, %4558 : i64
    %4561 = scf.if %4560 -> (i64) {
      scf.yield %4267 : i64
    } else {
      %4562 = llvm.mlir.addressof @str446 : !llvm.ptr
      %4563 = arith.constant 24 : i64
      %4564 = func.call @cc_make_string(%4562, %4563) : (!llvm.ptr, i64) -> i64
      %4565 = func.call @cc_nil_value() : () -> i64
      %4566 = func.call @cc_intern(%4564, %4565) : (i64, i64) -> i64
      %4567 = func.call @cc_nil_value() : () -> i64
      %4568 = func.call @cc_cons(%4566, %4567) : (i64, i64) -> i64
      %4569 = func.call @cc_values_pack(%4568) : (i64) -> i64
      func.call @stack_push_pointer(%4566) : (i64) -> ()
      %4570 = func.call @stack_pop_pointer() : () -> i64
      %4571 = llvm.mlir.addressof @str447 : !llvm.ptr
      %4572 = arith.constant 3 : i64
      %4573 = func.call @cc_make_string(%4571, %4572) : (!llvm.ptr, i64) -> i64
      %4574 = func.call @cc_nil_value() : () -> i64
      %4575 = func.call @cc_intern(%4573, %4574) : (i64, i64) -> i64
      %4576 = func.call @cc_nil_value() : () -> i64
      %4577 = func.call @cc_cons(%4575, %4576) : (i64, i64) -> i64
      %4578 = func.call @cc_values_pack(%4577) : (i64) -> i64
      func.call @stack_push_pointer(%4575) : (i64) -> ()
      %4579 = llvm.mlir.addressof @str448 : !llvm.ptr
      %4580 = arith.constant 3 : i64
      %4581 = func.call @cc_make_string(%4579, %4580) : (!llvm.ptr, i64) -> i64
      %4582 = func.call @cc_nil_value() : () -> i64
      %4583 = func.call @cc_intern(%4581, %4582) : (i64, i64) -> i64
      %4584 = func.call @cc_nil_value() : () -> i64
      %4585 = func.call @cc_cons(%4583, %4584) : (i64, i64) -> i64
      %4586 = func.call @cc_values_pack(%4585) : (i64) -> i64
      func.call @stack_push_pointer(%4583) : (i64) -> ()
      %4587 = llvm.mlir.addressof @str449 : !llvm.ptr
      %4588 = arith.constant 3 : i64
      %4589 = func.call @cc_make_string(%4587, %4588) : (!llvm.ptr, i64) -> i64
      %4590 = func.call @cc_nil_value() : () -> i64
      %4591 = func.call @cc_intern(%4589, %4590) : (i64, i64) -> i64
      %4592 = func.call @cc_nil_value() : () -> i64
      %4593 = func.call @cc_cons(%4591, %4592) : (i64, i64) -> i64
      %4594 = func.call @cc_values_pack(%4593) : (i64) -> i64
      func.call @stack_push_pointer(%4591) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4595 = llvm.mlir.addressof @str450 : !llvm.ptr
      %4596 = arith.constant 12 : i64
      %4597 = func.call @cc_make_string(%4595, %4596) : (!llvm.ptr, i64) -> i64
      %4598 = llvm.mlir.addressof @str451 : !llvm.ptr
      %4599 = arith.constant 11 : i64
      %4600 = func.call @cc_make_string(%4598, %4599) : (!llvm.ptr, i64) -> i64
      %4601 = func.call @cc_intern(%4597, %4600) : (i64, i64) -> i64
      %4602 = func.call @cc_nil_value() : () -> i64
      %4603 = func.call @cc_cons(%4601, %4602) : (i64, i64) -> i64
      %4604 = func.call @cc_values_pack(%4603) : (i64) -> i64
      func.call @stack_push_pointer(%4601) : (i64) -> ()
      %4605 = llvm.mlir.addressof @str452 : !llvm.ptr
      %4606 = arith.constant 8 : i64
      %4607 = func.call @cc_make_string(%4605, %4606) : (!llvm.ptr, i64) -> i64
      %4608 = llvm.mlir.addressof @str453 : !llvm.ptr
      %4609 = arith.constant 11 : i64
      %4610 = func.call @cc_make_string(%4608, %4609) : (!llvm.ptr, i64) -> i64
      %4611 = func.call @cc_intern(%4607, %4610) : (i64, i64) -> i64
      %4612 = func.call @cc_nil_value() : () -> i64
      %4613 = func.call @cc_cons(%4611, %4612) : (i64, i64) -> i64
      %4614 = func.call @cc_values_pack(%4613) : (i64) -> i64
      func.call @stack_push_pointer(%4611) : (i64) -> ()
      %4615 = llvm.mlir.addressof @str454 : !llvm.ptr
      %4616 = arith.constant 47 : i64
      %4617 = func.call @cc_make_string(%4615, %4616) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4618 = func.call @stack_pop_pointer() : () -> i64
      %4619 = func.call @stack_pop_pointer() : () -> i64
      %4620 = func.call @cc_cons(%4619, %4618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4620) : (i64) -> ()
      %4621 = func.call @stack_pop_pointer() : () -> i64
      %4622 = func.call @stack_pop_pointer() : () -> i64
      %4623 = func.call @cc_cons(%4622, %4621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4623) : (i64) -> ()
      %4624 = llvm.mlir.addressof @str455 : !llvm.ptr
      %4625 = arith.constant 15 : i64
      %4626 = func.call @cc_make_string(%4624, %4625) : (!llvm.ptr, i64) -> i64
      %4627 = llvm.mlir.addressof @str456 : !llvm.ptr
      %4628 = arith.constant 7 : i64
      %4629 = func.call @cc_make_string(%4627, %4628) : (!llvm.ptr, i64) -> i64
      %4630 = func.call @cc_intern(%4626, %4629) : (i64, i64) -> i64
      %4631 = func.call @cc_nil_value() : () -> i64
      %4632 = func.call @cc_cons(%4630, %4631) : (i64, i64) -> i64
      %4633 = func.call @cc_values_pack(%4632) : (i64) -> i64
      func.call @stack_push_pointer(%4630) : (i64) -> ()
      %4634 = llvm.mlir.addressof @str457 : !llvm.ptr
      %4635 = arith.constant 10 : i64
      %4636 = func.call @cc_make_string(%4634, %4635) : (!llvm.ptr, i64) -> i64
      %4637 = llvm.mlir.addressof @str458 : !llvm.ptr
      %4638 = arith.constant 7 : i64
      %4639 = func.call @cc_make_string(%4637, %4638) : (!llvm.ptr, i64) -> i64
      %4640 = func.call @cc_intern(%4636, %4639) : (i64, i64) -> i64
      %4641 = func.call @cc_nil_value() : () -> i64
      %4642 = func.call @cc_cons(%4640, %4641) : (i64, i64) -> i64
      %4643 = func.call @cc_values_pack(%4642) : (i64) -> i64
      func.call @stack_push_pointer(%4640) : (i64) -> ()
      %4644 = llvm.mlir.addressof @str459 : !llvm.ptr
      %4645 = arith.constant 9 : i64
      %4646 = func.call @cc_make_string(%4644, %4645) : (!llvm.ptr, i64) -> i64
      %4647 = llvm.mlir.addressof @str460 : !llvm.ptr
      %4648 = arith.constant 7 : i64
      %4649 = func.call @cc_make_string(%4647, %4648) : (!llvm.ptr, i64) -> i64
      %4650 = func.call @cc_intern(%4646, %4649) : (i64, i64) -> i64
      %4651 = func.call @cc_nil_value() : () -> i64
      %4652 = func.call @cc_cons(%4650, %4651) : (i64, i64) -> i64
      %4653 = func.call @cc_values_pack(%4652) : (i64) -> i64
      func.call @stack_push_pointer(%4650) : (i64) -> ()
      %4654 = llvm.mlir.addressof @str461 : !llvm.ptr
      %4655 = arith.constant 6 : i64
      %4656 = func.call @cc_make_string(%4654, %4655) : (!llvm.ptr, i64) -> i64
      %4657 = llvm.mlir.addressof @str462 : !llvm.ptr
      %4658 = arith.constant 7 : i64
      %4659 = func.call @cc_make_string(%4657, %4658) : (!llvm.ptr, i64) -> i64
      %4660 = func.call @cc_intern(%4656, %4659) : (i64, i64) -> i64
      %4661 = func.call @cc_nil_value() : () -> i64
      %4662 = func.call @cc_cons(%4660, %4661) : (i64, i64) -> i64
      %4663 = func.call @cc_values_pack(%4662) : (i64) -> i64
      func.call @stack_push_pointer(%4660) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %4682 = llvm.mlir.addressof @str463 : !llvm.ptr
      %4683 = arith.constant 12 : i64
      %4684 = func.call @cc_make_string(%4682, %4683) : (!llvm.ptr, i64) -> i64
      %4685 = llvm.mlir.addressof @str464 : !llvm.ptr
      %4686 = arith.constant 11 : i64
      %4687 = func.call @cc_make_string(%4685, %4686) : (!llvm.ptr, i64) -> i64
      %4688 = func.call @cc_intern(%4684, %4687) : (i64, i64) -> i64
      %4689 = func.call @cc_nil_value() : () -> i64
      %4690 = func.call @cc_cons(%4688, %4689) : (i64, i64) -> i64
      %4691 = func.call @cc_values_pack(%4690) : (i64) -> i64
      func.call @stack_push_pointer(%4688) : (i64) -> ()
      %4692 = llvm.mlir.addressof @str465 : !llvm.ptr
      %4693 = arith.constant 8 : i64
      %4694 = func.call @cc_make_string(%4692, %4693) : (!llvm.ptr, i64) -> i64
      %4695 = llvm.mlir.addressof @str466 : !llvm.ptr
      %4696 = arith.constant 11 : i64
      %4697 = func.call @cc_make_string(%4695, %4696) : (!llvm.ptr, i64) -> i64
      %4698 = func.call @cc_intern(%4694, %4697) : (i64, i64) -> i64
      %4699 = func.call @cc_nil_value() : () -> i64
      %4700 = func.call @cc_cons(%4698, %4699) : (i64, i64) -> i64
      %4701 = func.call @cc_values_pack(%4700) : (i64) -> i64
      func.call @stack_push_pointer(%4698) : (i64) -> ()
      %4702 = llvm.mlir.addressof @str467 : !llvm.ptr
      %4703 = arith.constant 47 : i64
      %4704 = func.call @cc_make_string(%4702, %4703) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4704) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4705 = func.call @stack_pop_pointer() : () -> i64
      %4706 = func.call @stack_pop_pointer() : () -> i64
      %4707 = func.call @cc_cons(%4706, %4705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4707) : (i64) -> ()
      %4708 = func.call @stack_pop_pointer() : () -> i64
      %4709 = func.call @stack_pop_pointer() : () -> i64
      %4710 = func.call @cc_cons(%4709, %4708) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4710) : (i64) -> ()
      %4711 = llvm.mlir.addressof @str468 : !llvm.ptr
      %4712 = arith.constant 15 : i64
      %4713 = func.call @cc_make_string(%4711, %4712) : (!llvm.ptr, i64) -> i64
      %4714 = llvm.mlir.addressof @str469 : !llvm.ptr
      %4715 = arith.constant 7 : i64
      %4716 = func.call @cc_make_string(%4714, %4715) : (!llvm.ptr, i64) -> i64
      %4717 = func.call @cc_intern(%4713, %4716) : (i64, i64) -> i64
      %4718 = func.call @cc_nil_value() : () -> i64
      %4719 = func.call @cc_cons(%4717, %4718) : (i64, i64) -> i64
      %4720 = func.call @cc_values_pack(%4719) : (i64) -> i64
      func.call @stack_push_pointer(%4717) : (i64) -> ()
      %4721 = llvm.mlir.addressof @str470 : !llvm.ptr
      %4722 = arith.constant 10 : i64
      %4723 = func.call @cc_make_string(%4721, %4722) : (!llvm.ptr, i64) -> i64
      %4724 = llvm.mlir.addressof @str471 : !llvm.ptr
      %4725 = arith.constant 7 : i64
      %4726 = func.call @cc_make_string(%4724, %4725) : (!llvm.ptr, i64) -> i64
      %4727 = func.call @cc_intern(%4723, %4726) : (i64, i64) -> i64
      %4728 = func.call @cc_nil_value() : () -> i64
      %4729 = func.call @cc_cons(%4727, %4728) : (i64, i64) -> i64
      %4730 = func.call @cc_values_pack(%4729) : (i64) -> i64
      func.call @stack_push_pointer(%4727) : (i64) -> ()
      %4731 = llvm.mlir.addressof @str472 : !llvm.ptr
      %4732 = arith.constant 9 : i64
      %4733 = func.call @cc_make_string(%4731, %4732) : (!llvm.ptr, i64) -> i64
      %4734 = llvm.mlir.addressof @str473 : !llvm.ptr
      %4735 = arith.constant 7 : i64
      %4736 = func.call @cc_make_string(%4734, %4735) : (!llvm.ptr, i64) -> i64
      %4737 = func.call @cc_intern(%4733, %4736) : (i64, i64) -> i64
      %4738 = func.call @cc_nil_value() : () -> i64
      %4739 = func.call @cc_cons(%4737, %4738) : (i64, i64) -> i64
      %4740 = func.call @cc_values_pack(%4739) : (i64) -> i64
      func.call @stack_push_pointer(%4737) : (i64) -> ()
      %4741 = llvm.mlir.addressof @str474 : !llvm.ptr
      %4742 = arith.constant 8 : i64
      %4743 = func.call @cc_make_string(%4741, %4742) : (!llvm.ptr, i64) -> i64
      %4744 = llvm.mlir.addressof @str475 : !llvm.ptr
      %4745 = arith.constant 7 : i64
      %4746 = func.call @cc_make_string(%4744, %4745) : (!llvm.ptr, i64) -> i64
      %4747 = func.call @cc_intern(%4743, %4746) : (i64, i64) -> i64
      %4748 = func.call @cc_nil_value() : () -> i64
      %4749 = func.call @cc_cons(%4747, %4748) : (i64, i64) -> i64
      %4750 = func.call @cc_values_pack(%4749) : (i64) -> i64
      func.call @stack_push_pointer(%4747) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4751 = func.call @stack_pop_pointer() : () -> i64
      %4752 = func.call @stack_pop_pointer() : () -> i64
      %4753 = func.call @cc_cons(%4752, %4751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4753) : (i64) -> ()
      %4754 = func.call @stack_pop_pointer() : () -> i64
      %4755 = func.call @stack_pop_pointer() : () -> i64
      %4756 = func.call @cc_cons(%4755, %4754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4756) : (i64) -> ()
      %4757 = func.call @stack_pop_pointer() : () -> i64
      %4758 = func.call @stack_pop_pointer() : () -> i64
      %4759 = func.call @cc_cons(%4758, %4757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4759) : (i64) -> ()
      %4760 = func.call @stack_pop_pointer() : () -> i64
      %4761 = func.call @stack_pop_pointer() : () -> i64
      %4762 = func.call @cc_cons(%4761, %4760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4762) : (i64) -> ()
      %4763 = func.call @stack_pop_pointer() : () -> i64
      %4764 = func.call @stack_pop_pointer() : () -> i64
      %4765 = func.call @cc_cons(%4764, %4763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4765) : (i64) -> ()
      %4766 = func.call @stack_pop_pointer() : () -> i64
      %4767 = func.call @stack_pop_pointer() : () -> i64
      %4768 = func.call @cc_cons(%4767, %4766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4768) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4769 = func.call @stack_pop_pointer() : () -> i64
      %4770 = func.call @stack_pop_pointer() : () -> i64
      %4771 = func.call @cc_cons(%4770, %4769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4771) : (i64) -> ()
      %4772 = func.call @stack_pop_pointer() : () -> i64
      %4773 = func.call @stack_pop_pointer() : () -> i64
      %4774 = func.call @cc_cons(%4773, %4772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4774) : (i64) -> ()
      %4775 = func.call @stack_pop_pointer() : () -> i64
      %4776 = func.call @stack_pop_pointer() : () -> i64
      %4777 = func.call @cc_cons(%4776, %4775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4777) : (i64) -> ()
      %4778 = func.call @stack_pop_pointer() : () -> i64
      %4779 = func.call @stack_pop_pointer() : () -> i64
      %4780 = func.call @cc_cons(%4779, %4778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4780) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4781 = func.call @stack_pop_pointer() : () -> i64
      %4782 = func.call @stack_pop_pointer() : () -> i64
      %4783 = func.call @cc_cons(%4782, %4781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4783) : (i64) -> ()
      %4784 = func.call @stack_pop_pointer() : () -> i64
      %4785 = func.call @stack_pop_pointer() : () -> i64
      %4786 = func.call @cc_cons(%4785, %4784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4786) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4787 = func.call @stack_pop_pointer() : () -> i64
      %4788 = func.call @stack_pop_pointer() : () -> i64
      %4789 = func.call @cc_cons(%4788, %4787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4789) : (i64) -> ()
      %4790 = func.call @stack_pop_pointer() : () -> i64
      %4791 = func.call @stack_pop_pointer() : () -> i64
      %4792 = func.call @cc_cons(%4791, %4790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4792) : (i64) -> ()
      %4793 = func.call @stack_pop_pointer() : () -> i64
      %5005 = arith.constant 57937766645773 : i64
      %5006 = arith.constant 0 : i64
      %5007 = func.call @cc_make_closure(%5005, %5006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5007) : (i64) -> ()
      %5008 = func.call @stack_pop_pointer() : () -> i64
      %5009 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5010 = arith.constant 1 : i64
      %5011 = func.call @cc_make_string(%5009, %5010) : (!llvm.ptr, i64) -> i64
      %5012 = func.call @cc_nil_value() : () -> i64
      %5013 = func.call @cc_intern(%5011, %5012) : (i64, i64) -> i64
      %5014 = func.call @cc_nil_value() : () -> i64
      %5015 = func.call @cc_cons(%5013, %5014) : (i64, i64) -> i64
      %5016 = func.call @cc_values_pack(%5015) : (i64) -> i64
      func.call @stack_push_pointer(%5013) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5017 = func.call @stack_pop_pointer() : () -> i64
      %5018 = func.call @stack_pop_pointer() : () -> i64
      %5019 = func.call @cc_cons(%5018, %5017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5019) : (i64) -> ()
      %5020 = func.call @stack_pop_pointer() : () -> i64
      %5021 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5022 = arith.constant 11 : i64
      %5023 = func.call @cc_make_string(%5021, %5022) : (!llvm.ptr, i64) -> i64
      %5024 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5025 = arith.constant 7 : i64
      %5026 = func.call @cc_make_string(%5024, %5025) : (!llvm.ptr, i64) -> i64
      %5027 = func.call @cc_intern(%5023, %5026) : (i64, i64) -> i64
      %5028 = func.call @cc_nil_value() : () -> i64
      %5029 = func.call @cc_cons(%5027, %5028) : (i64, i64) -> i64
      %5030 = func.call @cc_values_pack(%5029) : (i64) -> i64
      func.call @stack_push_pointer(%5027) : (i64) -> ()
      %5031 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5032 = func.call @stack_pop_pointer() : () -> i64
      %5033 = llvm.mlir.addressof @str503 : !llvm.ptr
      %5034 = arith.constant 4 : i64
      %5035 = func.call @cc_make_string(%5033, %5034) : (!llvm.ptr, i64) -> i64
      %5036 = llvm.mlir.addressof @str504 : !llvm.ptr
      %5037 = arith.constant 7 : i64
      %5038 = func.call @cc_make_string(%5036, %5037) : (!llvm.ptr, i64) -> i64
      %5039 = func.call @cc_intern(%5035, %5038) : (i64, i64) -> i64
      %5040 = func.call @cc_nil_value() : () -> i64
      %5041 = func.call @cc_cons(%5039, %5040) : (i64, i64) -> i64
      %5042 = func.call @cc_values_pack(%5041) : (i64) -> i64
      func.call @stack_push_pointer(%5039) : (i64) -> ()
      %5043 = func.call @stack_pop_pointer() : () -> i64
      %5044 = llvm.mlir.addressof @str505 : !llvm.ptr
      %5045 = arith.constant 6 : i64
      %5046 = func.call @cc_make_string(%5044, %5045) : (!llvm.ptr, i64) -> i64
      %5047 = func.call @cc_nil_value() : () -> i64
      %5048 = func.call @cc_intern(%5046, %5047) : (i64, i64) -> i64
      %5049 = func.call @cc_nil_value() : () -> i64
      %5050 = func.call @cc_cons(%5048, %5049) : (i64, i64) -> i64
      %5051 = func.call @cc_values_pack(%5050) : (i64) -> i64
      func.call @stack_push_pointer(%5048) : (i64) -> ()
      %5052 = func.call @stack_pop_pointer() : () -> i64
      %5053 = func.call @cc_nil_value() : () -> i64
      %5054 = func.call @cc_errorp(%4570) : (i64) -> i64
      %5055 = arith.cmpi ne, %5054, %5053 : i64
      %5056 = arith.cmpi eq, %5053, %5053 : i64
      %5057 = arith.andi %5055, %5056 : i1
      %5058 = scf.if %5057 -> (i64) {
        scf.yield %4570 : i64
      } else {
        scf.yield %5053 : i64
      }
      %5059 = func.call @cc_errorp(%4793) : (i64) -> i64
      %5060 = arith.cmpi ne, %5059, %5053 : i64
      %5061 = arith.cmpi eq, %5058, %5053 : i64
      %5062 = arith.andi %5060, %5061 : i1
      %5063 = scf.if %5062 -> (i64) {
        scf.yield %4793 : i64
      } else {
        scf.yield %5058 : i64
      }
      %5064 = func.call @cc_errorp(%5008) : (i64) -> i64
      %5065 = arith.cmpi ne, %5064, %5053 : i64
      %5066 = arith.cmpi eq, %5063, %5053 : i64
      %5067 = arith.andi %5065, %5066 : i1
      %5068 = scf.if %5067 -> (i64) {
        scf.yield %5008 : i64
      } else {
        scf.yield %5063 : i64
      }
      %5069 = func.call @cc_errorp(%5020) : (i64) -> i64
      %5070 = arith.cmpi ne, %5069, %5053 : i64
      %5071 = arith.cmpi eq, %5068, %5053 : i64
      %5072 = arith.andi %5070, %5071 : i1
      %5073 = scf.if %5072 -> (i64) {
        scf.yield %5020 : i64
      } else {
        scf.yield %5068 : i64
      }
      %5074 = func.call @cc_errorp(%5031) : (i64) -> i64
      %5075 = arith.cmpi ne, %5074, %5053 : i64
      %5076 = arith.cmpi eq, %5073, %5053 : i64
      %5077 = arith.andi %5075, %5076 : i1
      %5078 = scf.if %5077 -> (i64) {
        scf.yield %5031 : i64
      } else {
        scf.yield %5073 : i64
      }
      %5079 = func.call @cc_errorp(%5032) : (i64) -> i64
      %5080 = arith.cmpi ne, %5079, %5053 : i64
      %5081 = arith.cmpi eq, %5078, %5053 : i64
      %5082 = arith.andi %5080, %5081 : i1
      %5083 = scf.if %5082 -> (i64) {
        scf.yield %5032 : i64
      } else {
        scf.yield %5078 : i64
      }
      %5084 = func.call @cc_errorp(%5043) : (i64) -> i64
      %5085 = arith.cmpi ne, %5084, %5053 : i64
      %5086 = arith.cmpi eq, %5083, %5053 : i64
      %5087 = arith.andi %5085, %5086 : i1
      %5088 = scf.if %5087 -> (i64) {
        scf.yield %5043 : i64
      } else {
        scf.yield %5083 : i64
      }
      %5089 = func.call @cc_errorp(%5052) : (i64) -> i64
      %5090 = arith.cmpi ne, %5089, %5053 : i64
      %5091 = arith.cmpi eq, %5088, %5053 : i64
      %5092 = arith.andi %5090, %5091 : i1
      %5093 = scf.if %5092 -> (i64) {
        scf.yield %5052 : i64
      } else {
        scf.yield %5088 : i64
      }
      %5094 = arith.cmpi ne, %5093, %5053 : i64
      scf.if %5094 {
        func.call @stack_push_pointer(%5093) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4570) : (i64) -> ()
        func.call @stack_push_pointer(%4793) : (i64) -> ()
        func.call @stack_push_pointer(%5008) : (i64) -> ()
        func.call @stack_push_pointer(%5020) : (i64) -> ()
        func.call @stack_push_pointer(%5031) : (i64) -> ()
        func.call @stack_push_pointer(%5032) : (i64) -> ()
        func.call @stack_push_pointer(%5043) : (i64) -> ()
        func.call @stack_push_pointer(%5052) : (i64) -> ()
        %5095 = llvm.mlir.addressof @str506 : !llvm.ptr
        %5096 = func.call @cc_make_function_ref_const(%5095) : (!llvm.ptr) -> i64
        %5097 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5096, %5097) : (i64, i64) -> ()
      }
      %5098 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5098 : i64
    }
    %5099 = func.call @cc_nil_value() : () -> i64
    %5100 = func.call @cc_errorp(%4561) : (i64) -> i64
    %5101 = arith.cmpi ne, %5100, %5099 : i64
    %5102 = scf.if %5101 -> (i64) {
      scf.yield %4561 : i64
    } else {
      %5103 = llvm.mlir.addressof @str507 : !llvm.ptr
      %5104 = arith.constant 41 : i64
      %5105 = func.call @cc_make_string(%5103, %5104) : (!llvm.ptr, i64) -> i64
      %5106 = func.call @cc_nil_value() : () -> i64
      %5107 = func.call @cc_intern(%5105, %5106) : (i64, i64) -> i64
      %5108 = func.call @cc_nil_value() : () -> i64
      %5109 = func.call @cc_cons(%5107, %5108) : (i64, i64) -> i64
      %5110 = func.call @cc_values_pack(%5109) : (i64) -> i64
      func.call @stack_push_pointer(%5107) : (i64) -> ()
      %5111 = func.call @stack_pop_pointer() : () -> i64
      %5112 = llvm.mlir.addressof @str508 : !llvm.ptr
      %5113 = arith.constant 13 : i64
      %5114 = func.call @cc_make_string(%5112, %5113) : (!llvm.ptr, i64) -> i64
      %5115 = llvm.mlir.addressof @str509 : !llvm.ptr
      %5116 = arith.constant 11 : i64
      %5117 = func.call @cc_make_string(%5115, %5116) : (!llvm.ptr, i64) -> i64
      %5118 = func.call @cc_intern(%5114, %5117) : (i64, i64) -> i64
      %5119 = func.call @cc_nil_value() : () -> i64
      %5120 = func.call @cc_cons(%5118, %5119) : (i64, i64) -> i64
      %5121 = func.call @cc_values_pack(%5120) : (i64) -> i64
      func.call @stack_push_pointer(%5118) : (i64) -> ()
      %5122 = llvm.mlir.addressof @str510 : !llvm.ptr
      %5123 = arith.constant 6 : i64
      %5124 = func.call @cc_make_string(%5122, %5123) : (!llvm.ptr, i64) -> i64
      %5125 = func.call @cc_nil_value() : () -> i64
      %5126 = func.call @cc_intern(%5124, %5125) : (i64, i64) -> i64
      %5127 = func.call @cc_nil_value() : () -> i64
      %5128 = func.call @cc_cons(%5126, %5127) : (i64, i64) -> i64
      %5129 = func.call @cc_values_pack(%5128) : (i64) -> i64
      func.call @stack_push_pointer(%5126) : (i64) -> ()
      %5130 = llvm.mlir.addressof @str511 : !llvm.ptr
      %5131 = arith.constant 19 : i64
      %5132 = func.call @cc_make_string(%5130, %5131) : (!llvm.ptr, i64) -> i64
      %5133 = func.call @cc_nil_value() : () -> i64
      %5134 = func.call @cc_intern(%5132, %5133) : (i64, i64) -> i64
      %5135 = func.call @cc_nil_value() : () -> i64
      %5136 = func.call @cc_cons(%5134, %5135) : (i64, i64) -> i64
      %5137 = func.call @cc_values_pack(%5136) : (i64) -> i64
      func.call @stack_push_pointer(%5134) : (i64) -> ()
      %5138 = llvm.mlir.addressof @str512 : !llvm.ptr
      %5139 = arith.constant 12 : i64
      %5140 = func.call @cc_make_string(%5138, %5139) : (!llvm.ptr, i64) -> i64
      %5141 = llvm.mlir.addressof @str513 : !llvm.ptr
      %5142 = arith.constant 11 : i64
      %5143 = func.call @cc_make_string(%5141, %5142) : (!llvm.ptr, i64) -> i64
      %5144 = func.call @cc_intern(%5140, %5143) : (i64, i64) -> i64
      %5145 = func.call @cc_nil_value() : () -> i64
      %5146 = func.call @cc_cons(%5144, %5145) : (i64, i64) -> i64
      %5147 = func.call @cc_values_pack(%5146) : (i64) -> i64
      func.call @stack_push_pointer(%5144) : (i64) -> ()
      %5148 = llvm.mlir.addressof @str514 : !llvm.ptr
      %5149 = arith.constant 8 : i64
      %5150 = func.call @cc_make_string(%5148, %5149) : (!llvm.ptr, i64) -> i64
      %5151 = llvm.mlir.addressof @str515 : !llvm.ptr
      %5152 = arith.constant 11 : i64
      %5153 = func.call @cc_make_string(%5151, %5152) : (!llvm.ptr, i64) -> i64
      %5154 = func.call @cc_intern(%5150, %5153) : (i64, i64) -> i64
      %5155 = func.call @cc_nil_value() : () -> i64
      %5156 = func.call @cc_cons(%5154, %5155) : (i64, i64) -> i64
      %5157 = func.call @cc_values_pack(%5156) : (i64) -> i64
      func.call @stack_push_pointer(%5154) : (i64) -> ()
      %5158 = llvm.mlir.addressof @str516 : !llvm.ptr
      %5159 = arith.constant 47 : i64
      %5160 = func.call @cc_make_string(%5158, %5159) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5160) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5161 = func.call @stack_pop_pointer() : () -> i64
      %5162 = func.call @stack_pop_pointer() : () -> i64
      %5163 = func.call @cc_cons(%5162, %5161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5163) : (i64) -> ()
      %5164 = func.call @stack_pop_pointer() : () -> i64
      %5165 = func.call @stack_pop_pointer() : () -> i64
      %5166 = func.call @cc_cons(%5165, %5164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5166) : (i64) -> ()
      %5167 = llvm.mlir.addressof @str517 : !llvm.ptr
      %5168 = arith.constant 15 : i64
      %5169 = func.call @cc_make_string(%5167, %5168) : (!llvm.ptr, i64) -> i64
      %5170 = llvm.mlir.addressof @str518 : !llvm.ptr
      %5171 = arith.constant 7 : i64
      %5172 = func.call @cc_make_string(%5170, %5171) : (!llvm.ptr, i64) -> i64
      %5173 = func.call @cc_intern(%5169, %5172) : (i64, i64) -> i64
      %5174 = func.call @cc_nil_value() : () -> i64
      %5175 = func.call @cc_cons(%5173, %5174) : (i64, i64) -> i64
      %5176 = func.call @cc_values_pack(%5175) : (i64) -> i64
      func.call @stack_push_pointer(%5173) : (i64) -> ()
      %5177 = llvm.mlir.addressof @str519 : !llvm.ptr
      %5178 = arith.constant 8 : i64
      %5179 = func.call @cc_make_string(%5177, %5178) : (!llvm.ptr, i64) -> i64
      %5180 = llvm.mlir.addressof @str520 : !llvm.ptr
      %5181 = arith.constant 7 : i64
      %5182 = func.call @cc_make_string(%5180, %5181) : (!llvm.ptr, i64) -> i64
      %5183 = func.call @cc_intern(%5179, %5182) : (i64, i64) -> i64
      %5184 = func.call @cc_nil_value() : () -> i64
      %5185 = func.call @cc_cons(%5183, %5184) : (i64, i64) -> i64
      %5186 = func.call @cc_values_pack(%5185) : (i64) -> i64
      func.call @stack_push_pointer(%5183) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5187 = func.call @stack_pop_pointer() : () -> i64
      %5188 = func.call @stack_pop_pointer() : () -> i64
      %5189 = func.call @cc_cons(%5188, %5187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5189) : (i64) -> ()
      %5190 = func.call @stack_pop_pointer() : () -> i64
      %5191 = func.call @stack_pop_pointer() : () -> i64
      %5192 = func.call @cc_cons(%5191, %5190) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5192) : (i64) -> ()
      %5193 = func.call @stack_pop_pointer() : () -> i64
      %5194 = func.call @stack_pop_pointer() : () -> i64
      %5195 = func.call @cc_cons(%5194, %5193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5195) : (i64) -> ()
      %5196 = func.call @stack_pop_pointer() : () -> i64
      %5197 = func.call @stack_pop_pointer() : () -> i64
      %5198 = func.call @cc_cons(%5197, %5196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5198) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5199 = func.call @stack_pop_pointer() : () -> i64
      %5200 = func.call @stack_pop_pointer() : () -> i64
      %5201 = func.call @cc_cons(%5200, %5199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5201) : (i64) -> ()
      %5202 = func.call @stack_pop_pointer() : () -> i64
      %5203 = func.call @stack_pop_pointer() : () -> i64
      %5204 = func.call @cc_cons(%5203, %5202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5204) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5205 = func.call @stack_pop_pointer() : () -> i64
      %5206 = func.call @stack_pop_pointer() : () -> i64
      %5207 = func.call @cc_cons(%5206, %5205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5207) : (i64) -> ()
      %5208 = func.call @stack_pop_pointer() : () -> i64
      %5209 = func.call @stack_pop_pointer() : () -> i64
      %5210 = func.call @cc_cons(%5209, %5208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5210) : (i64) -> ()
      %5211 = func.call @stack_pop_pointer() : () -> i64
      %5212 = func.call @stack_pop_pointer() : () -> i64
      %5213 = func.call @cc_cons(%5212, %5211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5213) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5214 = func.call @stack_pop_pointer() : () -> i64
      %5215 = func.call @stack_pop_pointer() : () -> i64
      %5216 = func.call @cc_cons(%5215, %5214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5216) : (i64) -> ()
      %5217 = func.call @stack_pop_pointer() : () -> i64
      %5218 = func.call @stack_pop_pointer() : () -> i64
      %5219 = func.call @cc_cons(%5218, %5217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5219) : (i64) -> ()
      %5220 = func.call @stack_pop_pointer() : () -> i64
      %5331 = arith.constant 57937766645774 : i64
      %5332 = arith.constant 0 : i64
      %5333 = func.call @cc_make_closure(%5331, %5332) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5333) : (i64) -> ()
      %5334 = func.call @stack_pop_pointer() : () -> i64
      %5335 = llvm.mlir.addressof @str529 : !llvm.ptr
      %5336 = arith.constant 4 : i64
      %5337 = func.call @cc_make_string(%5335, %5336) : (!llvm.ptr, i64) -> i64
      %5338 = func.call @cc_nil_value() : () -> i64
      %5339 = func.call @cc_intern(%5337, %5338) : (i64, i64) -> i64
      %5340 = func.call @cc_nil_value() : () -> i64
      %5341 = func.call @cc_cons(%5339, %5340) : (i64, i64) -> i64
      %5342 = func.call @cc_values_pack(%5341) : (i64) -> i64
      func.call @stack_push_pointer(%5339) : (i64) -> ()
      %5343 = llvm.mlir.addressof @str530 : !llvm.ptr
      %5344 = arith.constant 21 : i64
      %5345 = func.call @cc_make_string(%5343, %5344) : (!llvm.ptr, i64) -> i64
      %5346 = llvm.mlir.addressof @str531 : !llvm.ptr
      %5347 = arith.constant 3 : i64
      %5348 = func.call @cc_make_string(%5346, %5347) : (!llvm.ptr, i64) -> i64
      %5349 = func.call @cc_intern(%5345, %5348) : (i64, i64) -> i64
      %5350 = func.call @cc_nil_value() : () -> i64
      %5351 = func.call @cc_cons(%5349, %5350) : (i64, i64) -> i64
      %5352 = func.call @cc_values_pack(%5351) : (i64) -> i64
      func.call @stack_push_pointer(%5349) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5353 = func.call @stack_pop_pointer() : () -> i64
      %5354 = func.call @stack_pop_pointer() : () -> i64
      %5355 = func.call @cc_cons(%5354, %5353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5355) : (i64) -> ()
      %5356 = func.call @stack_pop_pointer() : () -> i64
      %5357 = func.call @stack_pop_pointer() : () -> i64
      %5358 = func.call @cc_cons(%5357, %5356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5358) : (i64) -> ()
      %5359 = func.call @stack_pop_pointer() : () -> i64
      %5360 = llvm.mlir.addressof @str532 : !llvm.ptr
      %5361 = arith.constant 11 : i64
      %5362 = func.call @cc_make_string(%5360, %5361) : (!llvm.ptr, i64) -> i64
      %5363 = llvm.mlir.addressof @str533 : !llvm.ptr
      %5364 = arith.constant 7 : i64
      %5365 = func.call @cc_make_string(%5363, %5364) : (!llvm.ptr, i64) -> i64
      %5366 = func.call @cc_intern(%5362, %5365) : (i64, i64) -> i64
      %5367 = func.call @cc_nil_value() : () -> i64
      %5368 = func.call @cc_cons(%5366, %5367) : (i64, i64) -> i64
      %5369 = func.call @cc_values_pack(%5368) : (i64) -> i64
      func.call @stack_push_pointer(%5366) : (i64) -> ()
      %5370 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5371 = func.call @stack_pop_pointer() : () -> i64
      %5372 = llvm.mlir.addressof @str534 : !llvm.ptr
      %5373 = arith.constant 4 : i64
      %5374 = func.call @cc_make_string(%5372, %5373) : (!llvm.ptr, i64) -> i64
      %5375 = llvm.mlir.addressof @str535 : !llvm.ptr
      %5376 = arith.constant 7 : i64
      %5377 = func.call @cc_make_string(%5375, %5376) : (!llvm.ptr, i64) -> i64
      %5378 = func.call @cc_intern(%5374, %5377) : (i64, i64) -> i64
      %5379 = func.call @cc_nil_value() : () -> i64
      %5380 = func.call @cc_cons(%5378, %5379) : (i64, i64) -> i64
      %5381 = func.call @cc_values_pack(%5380) : (i64) -> i64
      func.call @stack_push_pointer(%5378) : (i64) -> ()
      %5382 = func.call @stack_pop_pointer() : () -> i64
      %5383 = llvm.mlir.addressof @str536 : !llvm.ptr
      %5384 = arith.constant 5 : i64
      %5385 = func.call @cc_make_string(%5383, %5384) : (!llvm.ptr, i64) -> i64
      %5386 = func.call @cc_nil_value() : () -> i64
      %5387 = func.call @cc_intern(%5385, %5386) : (i64, i64) -> i64
      %5388 = func.call @cc_nil_value() : () -> i64
      %5389 = func.call @cc_cons(%5387, %5388) : (i64, i64) -> i64
      %5390 = func.call @cc_values_pack(%5389) : (i64) -> i64
      func.call @stack_push_pointer(%5387) : (i64) -> ()
      %5391 = func.call @stack_pop_pointer() : () -> i64
      %5392 = func.call @cc_nil_value() : () -> i64
      %5393 = func.call @cc_errorp(%5111) : (i64) -> i64
      %5394 = arith.cmpi ne, %5393, %5392 : i64
      %5395 = arith.cmpi eq, %5392, %5392 : i64
      %5396 = arith.andi %5394, %5395 : i1
      %5397 = scf.if %5396 -> (i64) {
        scf.yield %5111 : i64
      } else {
        scf.yield %5392 : i64
      }
      %5398 = func.call @cc_errorp(%5220) : (i64) -> i64
      %5399 = arith.cmpi ne, %5398, %5392 : i64
      %5400 = arith.cmpi eq, %5397, %5392 : i64
      %5401 = arith.andi %5399, %5400 : i1
      %5402 = scf.if %5401 -> (i64) {
        scf.yield %5220 : i64
      } else {
        scf.yield %5397 : i64
      }
      %5403 = func.call @cc_errorp(%5334) : (i64) -> i64
      %5404 = arith.cmpi ne, %5403, %5392 : i64
      %5405 = arith.cmpi eq, %5402, %5392 : i64
      %5406 = arith.andi %5404, %5405 : i1
      %5407 = scf.if %5406 -> (i64) {
        scf.yield %5334 : i64
      } else {
        scf.yield %5402 : i64
      }
      %5408 = func.call @cc_errorp(%5359) : (i64) -> i64
      %5409 = arith.cmpi ne, %5408, %5392 : i64
      %5410 = arith.cmpi eq, %5407, %5392 : i64
      %5411 = arith.andi %5409, %5410 : i1
      %5412 = scf.if %5411 -> (i64) {
        scf.yield %5359 : i64
      } else {
        scf.yield %5407 : i64
      }
      %5413 = func.call @cc_errorp(%5370) : (i64) -> i64
      %5414 = arith.cmpi ne, %5413, %5392 : i64
      %5415 = arith.cmpi eq, %5412, %5392 : i64
      %5416 = arith.andi %5414, %5415 : i1
      %5417 = scf.if %5416 -> (i64) {
        scf.yield %5370 : i64
      } else {
        scf.yield %5412 : i64
      }
      %5418 = func.call @cc_errorp(%5371) : (i64) -> i64
      %5419 = arith.cmpi ne, %5418, %5392 : i64
      %5420 = arith.cmpi eq, %5417, %5392 : i64
      %5421 = arith.andi %5419, %5420 : i1
      %5422 = scf.if %5421 -> (i64) {
        scf.yield %5371 : i64
      } else {
        scf.yield %5417 : i64
      }
      %5423 = func.call @cc_errorp(%5382) : (i64) -> i64
      %5424 = arith.cmpi ne, %5423, %5392 : i64
      %5425 = arith.cmpi eq, %5422, %5392 : i64
      %5426 = arith.andi %5424, %5425 : i1
      %5427 = scf.if %5426 -> (i64) {
        scf.yield %5382 : i64
      } else {
        scf.yield %5422 : i64
      }
      %5428 = func.call @cc_errorp(%5391) : (i64) -> i64
      %5429 = arith.cmpi ne, %5428, %5392 : i64
      %5430 = arith.cmpi eq, %5427, %5392 : i64
      %5431 = arith.andi %5429, %5430 : i1
      %5432 = scf.if %5431 -> (i64) {
        scf.yield %5391 : i64
      } else {
        scf.yield %5427 : i64
      }
      %5433 = arith.cmpi ne, %5432, %5392 : i64
      scf.if %5433 {
        func.call @stack_push_pointer(%5432) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5111) : (i64) -> ()
        func.call @stack_push_pointer(%5220) : (i64) -> ()
        func.call @stack_push_pointer(%5334) : (i64) -> ()
        func.call @stack_push_pointer(%5359) : (i64) -> ()
        func.call @stack_push_pointer(%5370) : (i64) -> ()
        func.call @stack_push_pointer(%5371) : (i64) -> ()
        func.call @stack_push_pointer(%5382) : (i64) -> ()
        func.call @stack_push_pointer(%5391) : (i64) -> ()
        %5434 = llvm.mlir.addressof @str537 : !llvm.ptr
        %5435 = func.call @cc_make_function_ref_const(%5434) : (!llvm.ptr) -> i64
        %5436 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5435, %5436) : (i64, i64) -> ()
      }
      %5437 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5437 : i64
    }
    %5438 = func.call @cc_nil_value() : () -> i64
    %5439 = func.call @cc_errorp(%5102) : (i64) -> i64
    %5440 = arith.cmpi ne, %5439, %5438 : i64
    %5441 = scf.if %5440 -> (i64) {
      scf.yield %5102 : i64
    } else {
      %5442 = llvm.mlir.addressof @str538 : !llvm.ptr
      %5443 = arith.constant 9 : i64
      %5444 = func.call @cc_make_string(%5442, %5443) : (!llvm.ptr, i64) -> i64
      %5445 = llvm.mlir.addressof @str539 : !llvm.ptr
      %5446 = arith.constant 7 : i64
      %5447 = func.call @cc_make_string(%5445, %5446) : (!llvm.ptr, i64) -> i64
      %5448 = func.call @cc_intern(%5444, %5447) : (i64, i64) -> i64
      %5449 = func.call @cc_nil_value() : () -> i64
      %5450 = func.call @cc_cons(%5448, %5449) : (i64, i64) -> i64
      %5451 = func.call @cc_values_pack(%5450) : (i64) -> i64
      func.call @stack_push_pointer(%5448) : (i64) -> ()
      %5452 = func.call @stack_pop_pointer() : () -> i64
      %5453 = func.call @cc_nil_value() : () -> i64
      %5454 = func.call @cc_errorp(%5452) : (i64) -> i64
      %5455 = arith.cmpi ne, %5454, %5453 : i64
      %5456 = arith.cmpi eq, %5453, %5453 : i64
      %5457 = arith.andi %5455, %5456 : i1
      %5458 = scf.if %5457 -> (i64) {
        scf.yield %5452 : i64
      } else {
        scf.yield %5453 : i64
      }
      %5459 = arith.cmpi ne, %5458, %5453 : i64
      scf.if %5459 {
        func.call @stack_push_pointer(%5458) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5452) : (i64) -> ()
        %5460 = llvm.mlir.addressof @str540 : !llvm.ptr
        %5461 = func.call @cc_make_function_ref_const(%5460) : (!llvm.ptr) -> i64
        %5462 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5461, %5462) : (i64, i64) -> ()
      }
      %5463 = func.call @stack_pop_pointer() : () -> i64
      %5464 = func.call @cc_nil_value() : () -> i64
      %5465 = func.call @cc_errorp(%5463) : (i64) -> i64
      %5466 = arith.cmpi ne, %5465, %5464 : i64
      %5467 = arith.cmpi eq, %5464, %5464 : i64
      %5468 = arith.andi %5466, %5467 : i1
      %5469 = scf.if %5468 -> (i64) {
        scf.yield %5463 : i64
      } else {
        scf.yield %5464 : i64
      }
      %5470 = arith.cmpi ne, %5469, %5464 : i64
      scf.if %5470 {
        func.call @stack_push_pointer(%5469) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5463) : (i64) -> ()
        %5471 = llvm.mlir.addressof @str541 : !llvm.ptr
        %5472 = func.call @cc_make_function_ref_const(%5471) : (!llvm.ptr) -> i64
        %5473 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5472, %5473) : (i64, i64) -> ()
      }
      %5474 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5474 : i64
    }
    %5475 = func.call @cc_nil_value() : () -> i64
    %5476 = func.call @cc_errorp(%5441) : (i64) -> i64
    %5477 = arith.cmpi ne, %5476, %5475 : i64
    %5478 = scf.if %5477 -> (i64) {
      scf.yield %5441 : i64
    } else {
      %5479 = llvm.mlir.addressof @str542 : !llvm.ptr
      %5480 = arith.constant 13 : i64
      %5481 = func.call @cc_make_string(%5479, %5480) : (!llvm.ptr, i64) -> i64
      %5482 = llvm.mlir.addressof @str543 : !llvm.ptr
      %5483 = arith.constant 7 : i64
      %5484 = func.call @cc_make_string(%5482, %5483) : (!llvm.ptr, i64) -> i64
      %5485 = func.call @cc_intern(%5481, %5484) : (i64, i64) -> i64
      %5486 = func.call @cc_nil_value() : () -> i64
      %5487 = func.call @cc_cons(%5485, %5486) : (i64, i64) -> i64
      %5488 = func.call @cc_values_pack(%5487) : (i64) -> i64
      func.call @stack_push_pointer(%5485) : (i64) -> ()
      %5489 = func.call @stack_pop_pointer() : () -> i64
      %5490 = func.call @cc_nil_value() : () -> i64
      %5491 = func.call @cc_errorp(%5489) : (i64) -> i64
      %5492 = arith.cmpi ne, %5491, %5490 : i64
      %5493 = arith.cmpi eq, %5490, %5490 : i64
      %5494 = arith.andi %5492, %5493 : i1
      %5495 = scf.if %5494 -> (i64) {
        scf.yield %5489 : i64
      } else {
        scf.yield %5490 : i64
      }
      %5496 = arith.cmpi ne, %5495, %5490 : i64
      scf.if %5496 {
        func.call @stack_push_pointer(%5495) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5489) : (i64) -> ()
        %5497 = llvm.mlir.addressof @str544 : !llvm.ptr
        %5498 = func.call @cc_make_function_ref_const(%5497) : (!llvm.ptr) -> i64
        %5499 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5498, %5499) : (i64, i64) -> ()
      }
      %5500 = func.call @stack_pop_pointer() : () -> i64
      %5501 = func.call @cc_nil_value() : () -> i64
      %5502 = func.call @cc_errorp(%5500) : (i64) -> i64
      %5503 = arith.cmpi ne, %5502, %5501 : i64
      %5504 = arith.cmpi eq, %5501, %5501 : i64
      %5505 = arith.andi %5503, %5504 : i1
      %5506 = scf.if %5505 -> (i64) {
        scf.yield %5500 : i64
      } else {
        scf.yield %5501 : i64
      }
      %5507 = arith.cmpi ne, %5506, %5501 : i64
      scf.if %5507 {
        func.call @stack_push_pointer(%5506) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5500) : (i64) -> ()
        %5508 = llvm.mlir.addressof @str545 : !llvm.ptr
        %5509 = func.call @cc_make_function_ref_const(%5508) : (!llvm.ptr) -> i64
        %5510 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5509, %5510) : (i64, i64) -> ()
      }
      %5511 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5511 : i64
    }
    func.call @stack_push_pointer(%5478) : (i64) -> ()
    %5512 = func.call @stack_pop_pointer() : () -> i64
    %5513 = func.call @cc_multiple_value_list(%5512) : (i64) -> i64
    %5514 = llvm.mlir.addressof @str546 : !llvm.ptr
    %5515 = arith.constant 37 : i64
    %5516 = func.call @cc_make_string(%5514, %5515) : (!llvm.ptr, i64) -> i64
    %5517 = func.call @cc_nil_value() : () -> i64
    %5518 = func.call @cc_intern(%5516, %5517) : (i64, i64) -> i64
    %5519 = func.call @cc_nil_value() : () -> i64
    %5520 = func.call @cc_cons(%5518, %5519) : (i64, i64) -> i64
    %5521 = func.call @cc_values_pack(%5520) : (i64) -> i64
    %5522 = func.call @cc_symbol_value(%5518) : (i64) -> i64
    %5523 = llvm.mlir.addressof @str547 : !llvm.ptr
    %5524 = arith.constant 39 : i64
    %5525 = func.call @cc_make_string(%5523, %5524) : (!llvm.ptr, i64) -> i64
    %5526 = func.call @cc_nil_value() : () -> i64
    %5527 = func.call @cc_intern(%5525, %5526) : (i64, i64) -> i64
    %5528 = func.call @cc_nil_value() : () -> i64
    %5529 = func.call @cc_cons(%5527, %5528) : (i64, i64) -> i64
    %5530 = func.call @cc_values_pack(%5529) : (i64) -> i64
    %5531 = func.call @cc_symbol_value(%5527) : (i64) -> i64
    %5532 = func.call @cc_nil_value() : () -> i64
    %5533 = arith.cmpi ne, %5522, %5532 : i64
    %5534 = scf.if %5533 -> (i64) {
      scf.yield %5531 : i64
    } else {
      scf.yield %5513 : i64
    }
    %5535 = func.call @cc_values_pack(%5534) : (i64) -> i64
    func.call @stack_push_pointer(%5535) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_57937766645764"() {
    %723 = func.call @cc_nil_value() : () -> i64
    %724 = func.call @cc_nil_value() : () -> i64
    %725 = func.call @cc_errorp(%723) : (i64) -> i64
    %726 = arith.cmpi ne, %725, %724 : i64
    %727 = scf.if %726 -> (i64) {
      scf.yield %723 : i64
    } else {
      %728 = func.call @cc_nil_value() : () -> i64
      %729 = func.call @cc_nil_value() : () -> i64
      %730 = func.call @cc_errorp(%728) : (i64) -> i64
      %731 = arith.cmpi ne, %730, %729 : i64
      %732 = scf.if %731 -> (i64) {
        scf.yield %728 : i64
      } else {
        %733 = llvm.mlir.addressof @str68 : !llvm.ptr
        %734 = arith.constant 42 : i64
        %735 = func.call @cc_make_string(%733, %734) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%735) : (i64) -> ()
        %736 = func.call @stack_pop_pointer() : () -> i64
        %737 = func.call @cc_nil_value() : () -> i64
        %738 = func.call @cc_errorp(%736) : (i64) -> i64
        %739 = arith.cmpi ne, %738, %737 : i64
        %740 = arith.cmpi eq, %737, %737 : i64
        %741 = arith.andi %739, %740 : i1
        %742 = scf.if %741 -> (i64) {
          scf.yield %736 : i64
        } else {
          scf.yield %737 : i64
        }
        %743 = arith.cmpi ne, %742, %737 : i64
        scf.if %743 {
          func.call @stack_push_pointer(%742) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%736) : (i64) -> ()
          %744 = llvm.mlir.addressof @str69 : !llvm.ptr
          %745 = func.call @cc_make_function_ref_const(%744) : (!llvm.ptr) -> i64
          %746 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%745, %746) : (i64, i64) -> ()
        }
        %747 = func.call @stack_pop_pointer() : () -> i64
        %748 = func.call @cc_nil_value() : () -> i64
        %749 = func.call @cc_cons(%747, %748) : (i64, i64) -> i64
        %750 = func.call @cc_load_stack(%749) : (i64) -> i64
        func.call @stack_push_pointer(%750) : (i64) -> ()
        %751 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %751 : i64
      }
      %752 = func.call @cc_nil_value() : () -> i64
      %753 = func.call @cc_errorp(%732) : (i64) -> i64
      %754 = arith.cmpi ne, %753, %752 : i64
      %755 = scf.if %754 -> (i64) {
        scf.yield %732 : i64
      } else {
        %756 = llvm.mlir.addressof @str70 : !llvm.ptr
        %757 = arith.constant 15 : i64
        %758 = func.call @cc_make_string(%756, %757) : (!llvm.ptr, i64) -> i64
        %759 = llvm.mlir.addressof @str71 : !llvm.ptr
        %760 = arith.constant 9 : i64
        %761 = func.call @cc_make_string(%759, %760) : (!llvm.ptr, i64) -> i64
        %762 = func.call @cc_intern(%758, %761) : (i64, i64) -> i64
        %763 = func.call @cc_nil_value() : () -> i64
        %764 = func.call @cc_cons(%762, %763) : (i64, i64) -> i64
        %765 = func.call @cc_values_pack(%764) : (i64) -> i64
        %766 = func.call @cc_symbol_value(%762) : (i64) -> i64
        func.call @stack_push_pointer(%766) : (i64) -> ()
        %767 = func.call @stack_pop_pointer() : () -> i64
        %768 = func.call @cc_nil_value() : () -> i64
        %769 = func.call @cc_errorp(%767) : (i64) -> i64
        %770 = arith.cmpi ne, %769, %768 : i64
        %771 = arith.cmpi eq, %768, %768 : i64
        %772 = arith.andi %770, %771 : i1
        %773 = scf.if %772 -> (i64) {
          scf.yield %767 : i64
        } else {
          scf.yield %768 : i64
        }
        %774 = arith.cmpi ne, %773, %768 : i64
        scf.if %774 {
          func.call @stack_push_pointer(%773) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%767) : (i64) -> ()
          %775 = llvm.mlir.addressof @str72 : !llvm.ptr
          %776 = func.call @cc_make_function_ref_const(%775) : (!llvm.ptr) -> i64
          %777 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%776, %777) : (i64, i64) -> ()
        }
        %778 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %778 : i64
      }
      func.call @stack_push_pointer(%755) : (i64) -> ()
      %779 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %779 : i64
    }
    func.call @stack_push_pointer(%727) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645765"() {
    %989 = func.call @cc_nil_value() : () -> i64
    %990 = func.call @cc_nil_value() : () -> i64
    %991 = func.call @cc_errorp(%989) : (i64) -> i64
    %992 = arith.cmpi ne, %991, %990 : i64
    %993 = scf.if %992 -> (i64) {
      scf.yield %989 : i64
    } else {
      %994 = func.call @cc_nil_value() : () -> i64
      %995 = func.call @cc_nil_value() : () -> i64
      %996 = func.call @cc_errorp(%994) : (i64) -> i64
      %997 = arith.cmpi ne, %996, %995 : i64
      %998 = scf.if %997 -> (i64) {
        scf.yield %994 : i64
      } else {
        %999 = llvm.mlir.addressof @str93 : !llvm.ptr
        %1000 = arith.constant 42 : i64
        %1001 = func.call @cc_make_string(%999, %1000) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1001) : (i64) -> ()
        %1002 = func.call @stack_pop_pointer() : () -> i64
        %1003 = func.call @cc_nil_value() : () -> i64
        %1004 = func.call @cc_errorp(%1002) : (i64) -> i64
        %1005 = arith.cmpi ne, %1004, %1003 : i64
        %1006 = arith.cmpi eq, %1003, %1003 : i64
        %1007 = arith.andi %1005, %1006 : i1
        %1008 = scf.if %1007 -> (i64) {
          scf.yield %1002 : i64
        } else {
          scf.yield %1003 : i64
        }
        %1009 = arith.cmpi ne, %1008, %1003 : i64
        scf.if %1009 {
          func.call @stack_push_pointer(%1008) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1002) : (i64) -> ()
          %1010 = llvm.mlir.addressof @str94 : !llvm.ptr
          %1011 = func.call @cc_make_function_ref_const(%1010) : (!llvm.ptr) -> i64
          %1012 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1011, %1012) : (i64, i64) -> ()
        }
        %1013 = func.call @stack_pop_pointer() : () -> i64
        %1014 = llvm.mlir.addressof @str95 : !llvm.ptr
        %1015 = arith.constant 15 : i64
        %1016 = func.call @cc_make_string(%1014, %1015) : (!llvm.ptr, i64) -> i64
        %1017 = llvm.mlir.addressof @str96 : !llvm.ptr
        %1018 = arith.constant 7 : i64
        %1019 = func.call @cc_make_string(%1017, %1018) : (!llvm.ptr, i64) -> i64
        %1020 = func.call @cc_intern(%1016, %1019) : (i64, i64) -> i64
        %1021 = func.call @cc_nil_value() : () -> i64
        %1022 = func.call @cc_cons(%1020, %1021) : (i64, i64) -> i64
        %1023 = func.call @cc_values_pack(%1022) : (i64) -> i64
        func.call @stack_push_pointer(%1020) : (i64) -> ()
        %1024 = func.call @stack_pop_pointer() : () -> i64
        %1025 = llvm.mlir.addressof @str97 : !llvm.ptr
        %1026 = arith.constant 5 : i64
        %1027 = func.call @cc_make_string(%1025, %1026) : (!llvm.ptr, i64) -> i64
        %1028 = llvm.mlir.addressof @str98 : !llvm.ptr
        %1029 = arith.constant 7 : i64
        %1030 = func.call @cc_make_string(%1028, %1029) : (!llvm.ptr, i64) -> i64
        %1031 = func.call @cc_intern(%1027, %1030) : (i64, i64) -> i64
        %1032 = func.call @cc_nil_value() : () -> i64
        %1033 = func.call @cc_cons(%1031, %1032) : (i64, i64) -> i64
        %1034 = func.call @cc_values_pack(%1033) : (i64) -> i64
        func.call @stack_push_pointer(%1031) : (i64) -> ()
        %1035 = func.call @stack_pop_pointer() : () -> i64
        %1036 = func.call @cc_nil_value() : () -> i64
        %1037 = func.call @cc_cons(%1035, %1036) : (i64, i64) -> i64
        %1038 = func.call @cc_cons(%1024, %1037) : (i64, i64) -> i64
        %1039 = func.call @cc_cons(%1013, %1038) : (i64, i64) -> i64
        %1040 = func.call @cc_load_stack(%1039) : (i64) -> i64
        func.call @stack_push_pointer(%1040) : (i64) -> ()
        %1041 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1041 : i64
      }
      %1042 = func.call @cc_nil_value() : () -> i64
      %1043 = func.call @cc_errorp(%998) : (i64) -> i64
      %1044 = arith.cmpi ne, %1043, %1042 : i64
      %1045 = scf.if %1044 -> (i64) {
        scf.yield %998 : i64
      } else {
        %1046 = llvm.mlir.addressof @str99 : !llvm.ptr
        %1047 = arith.constant 15 : i64
        %1048 = func.call @cc_make_string(%1046, %1047) : (!llvm.ptr, i64) -> i64
        %1049 = llvm.mlir.addressof @str100 : !llvm.ptr
        %1050 = arith.constant 9 : i64
        %1051 = func.call @cc_make_string(%1049, %1050) : (!llvm.ptr, i64) -> i64
        %1052 = func.call @cc_intern(%1048, %1051) : (i64, i64) -> i64
        %1053 = func.call @cc_nil_value() : () -> i64
        %1054 = func.call @cc_cons(%1052, %1053) : (i64, i64) -> i64
        %1055 = func.call @cc_values_pack(%1054) : (i64) -> i64
        %1056 = func.call @cc_symbol_value(%1052) : (i64) -> i64
        func.call @stack_push_pointer(%1056) : (i64) -> ()
        %1057 = func.call @stack_pop_pointer() : () -> i64
        %1058 = func.call @cc_nil_value() : () -> i64
        %1059 = func.call @cc_errorp(%1057) : (i64) -> i64
        %1060 = arith.cmpi ne, %1059, %1058 : i64
        %1061 = arith.cmpi eq, %1058, %1058 : i64
        %1062 = arith.andi %1060, %1061 : i1
        %1063 = scf.if %1062 -> (i64) {
          scf.yield %1057 : i64
        } else {
          scf.yield %1058 : i64
        }
        %1064 = arith.cmpi ne, %1063, %1058 : i64
        scf.if %1064 {
          func.call @stack_push_pointer(%1063) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1057) : (i64) -> ()
          %1065 = llvm.mlir.addressof @str101 : !llvm.ptr
          %1066 = func.call @cc_make_function_ref_const(%1065) : (!llvm.ptr) -> i64
          %1067 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1066, %1067) : (i64, i64) -> ()
        }
        %1068 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1068 : i64
      }
      func.call @stack_push_pointer(%1045) : (i64) -> ()
      %1069 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1069 : i64
    }
    func.call @stack_push_pointer(%993) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645766"() {
    %1279 = func.call @cc_nil_value() : () -> i64
    %1280 = func.call @cc_nil_value() : () -> i64
    %1281 = func.call @cc_errorp(%1279) : (i64) -> i64
    %1282 = arith.cmpi ne, %1281, %1280 : i64
    %1283 = scf.if %1282 -> (i64) {
      scf.yield %1279 : i64
    } else {
      %1284 = func.call @cc_nil_value() : () -> i64
      %1285 = func.call @cc_nil_value() : () -> i64
      %1286 = func.call @cc_errorp(%1284) : (i64) -> i64
      %1287 = arith.cmpi ne, %1286, %1285 : i64
      %1288 = scf.if %1287 -> (i64) {
        scf.yield %1284 : i64
      } else {
        %1289 = llvm.mlir.addressof @str122 : !llvm.ptr
        %1290 = arith.constant 42 : i64
        %1291 = func.call @cc_make_string(%1289, %1290) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1291) : (i64) -> ()
        %1292 = func.call @stack_pop_pointer() : () -> i64
        %1293 = func.call @cc_nil_value() : () -> i64
        %1294 = func.call @cc_errorp(%1292) : (i64) -> i64
        %1295 = arith.cmpi ne, %1294, %1293 : i64
        %1296 = arith.cmpi eq, %1293, %1293 : i64
        %1297 = arith.andi %1295, %1296 : i1
        %1298 = scf.if %1297 -> (i64) {
          scf.yield %1292 : i64
        } else {
          scf.yield %1293 : i64
        }
        %1299 = arith.cmpi ne, %1298, %1293 : i64
        scf.if %1299 {
          func.call @stack_push_pointer(%1298) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1292) : (i64) -> ()
          %1300 = llvm.mlir.addressof @str123 : !llvm.ptr
          %1301 = func.call @cc_make_function_ref_const(%1300) : (!llvm.ptr) -> i64
          %1302 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1301, %1302) : (i64, i64) -> ()
        }
        %1303 = func.call @stack_pop_pointer() : () -> i64
        %1304 = llvm.mlir.addressof @str124 : !llvm.ptr
        %1305 = arith.constant 15 : i64
        %1306 = func.call @cc_make_string(%1304, %1305) : (!llvm.ptr, i64) -> i64
        %1307 = llvm.mlir.addressof @str125 : !llvm.ptr
        %1308 = arith.constant 7 : i64
        %1309 = func.call @cc_make_string(%1307, %1308) : (!llvm.ptr, i64) -> i64
        %1310 = func.call @cc_intern(%1306, %1309) : (i64, i64) -> i64
        %1311 = func.call @cc_nil_value() : () -> i64
        %1312 = func.call @cc_cons(%1310, %1311) : (i64, i64) -> i64
        %1313 = func.call @cc_values_pack(%1312) : (i64) -> i64
        func.call @stack_push_pointer(%1310) : (i64) -> ()
        %1314 = func.call @stack_pop_pointer() : () -> i64
        %1315 = llvm.mlir.addressof @str126 : !llvm.ptr
        %1316 = arith.constant 7 : i64
        %1317 = func.call @cc_make_string(%1315, %1316) : (!llvm.ptr, i64) -> i64
        %1318 = llvm.mlir.addressof @str127 : !llvm.ptr
        %1319 = arith.constant 7 : i64
        %1320 = func.call @cc_make_string(%1318, %1319) : (!llvm.ptr, i64) -> i64
        %1321 = func.call @cc_intern(%1317, %1320) : (i64, i64) -> i64
        %1322 = func.call @cc_nil_value() : () -> i64
        %1323 = func.call @cc_cons(%1321, %1322) : (i64, i64) -> i64
        %1324 = func.call @cc_values_pack(%1323) : (i64) -> i64
        func.call @stack_push_pointer(%1321) : (i64) -> ()
        %1325 = func.call @stack_pop_pointer() : () -> i64
        %1326 = func.call @cc_nil_value() : () -> i64
        %1327 = func.call @cc_cons(%1325, %1326) : (i64, i64) -> i64
        %1328 = func.call @cc_cons(%1314, %1327) : (i64, i64) -> i64
        %1329 = func.call @cc_cons(%1303, %1328) : (i64, i64) -> i64
        %1330 = func.call @cc_load_stack(%1329) : (i64) -> i64
        func.call @stack_push_pointer(%1330) : (i64) -> ()
        %1331 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1331 : i64
      }
      %1332 = func.call @cc_nil_value() : () -> i64
      %1333 = func.call @cc_errorp(%1288) : (i64) -> i64
      %1334 = arith.cmpi ne, %1333, %1332 : i64
      %1335 = scf.if %1334 -> (i64) {
        scf.yield %1288 : i64
      } else {
        %1336 = llvm.mlir.addressof @str128 : !llvm.ptr
        %1337 = arith.constant 15 : i64
        %1338 = func.call @cc_make_string(%1336, %1337) : (!llvm.ptr, i64) -> i64
        %1339 = llvm.mlir.addressof @str129 : !llvm.ptr
        %1340 = arith.constant 9 : i64
        %1341 = func.call @cc_make_string(%1339, %1340) : (!llvm.ptr, i64) -> i64
        %1342 = func.call @cc_intern(%1338, %1341) : (i64, i64) -> i64
        %1343 = func.call @cc_nil_value() : () -> i64
        %1344 = func.call @cc_cons(%1342, %1343) : (i64, i64) -> i64
        %1345 = func.call @cc_values_pack(%1344) : (i64) -> i64
        %1346 = func.call @cc_symbol_value(%1342) : (i64) -> i64
        func.call @stack_push_pointer(%1346) : (i64) -> ()
        %1347 = func.call @stack_pop_pointer() : () -> i64
        %1348 = func.call @cc_nil_value() : () -> i64
        %1349 = func.call @cc_errorp(%1347) : (i64) -> i64
        %1350 = arith.cmpi ne, %1349, %1348 : i64
        %1351 = arith.cmpi eq, %1348, %1348 : i64
        %1352 = arith.andi %1350, %1351 : i1
        %1353 = scf.if %1352 -> (i64) {
          scf.yield %1347 : i64
        } else {
          scf.yield %1348 : i64
        }
        %1354 = arith.cmpi ne, %1353, %1348 : i64
        scf.if %1354 {
          func.call @stack_push_pointer(%1353) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1347) : (i64) -> ()
          %1355 = llvm.mlir.addressof @str130 : !llvm.ptr
          %1356 = func.call @cc_make_function_ref_const(%1355) : (!llvm.ptr) -> i64
          %1357 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1356, %1357) : (i64, i64) -> ()
        }
        %1358 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1358 : i64
      }
      func.call @stack_push_pointer(%1335) : (i64) -> ()
      %1359 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1359 : i64
    }
    func.call @stack_push_pointer(%1283) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645767"() {
    %1573 = func.call @cc_nil_value() : () -> i64
    %1574 = func.call @cc_nil_value() : () -> i64
    %1575 = func.call @cc_errorp(%1573) : (i64) -> i64
    %1576 = arith.cmpi ne, %1575, %1574 : i64
    %1577 = scf.if %1576 -> (i64) {
      scf.yield %1573 : i64
    } else {
      %1578 = func.call @cc_nil_value() : () -> i64
      %1579 = func.call @cc_nil_value() : () -> i64
      %1580 = func.call @cc_errorp(%1578) : (i64) -> i64
      %1581 = arith.cmpi ne, %1580, %1579 : i64
      %1582 = scf.if %1581 -> (i64) {
        scf.yield %1578 : i64
      } else {
        %1583 = llvm.mlir.addressof @str151 : !llvm.ptr
        %1584 = arith.constant 42 : i64
        %1585 = func.call @cc_make_string(%1583, %1584) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1585) : (i64) -> ()
        %1586 = func.call @stack_pop_pointer() : () -> i64
        %1587 = func.call @cc_nil_value() : () -> i64
        %1588 = func.call @cc_errorp(%1586) : (i64) -> i64
        %1589 = arith.cmpi ne, %1588, %1587 : i64
        %1590 = arith.cmpi eq, %1587, %1587 : i64
        %1591 = arith.andi %1589, %1590 : i1
        %1592 = scf.if %1591 -> (i64) {
          scf.yield %1586 : i64
        } else {
          scf.yield %1587 : i64
        }
        %1593 = arith.cmpi ne, %1592, %1587 : i64
        scf.if %1593 {
          func.call @stack_push_pointer(%1592) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1586) : (i64) -> ()
          %1594 = llvm.mlir.addressof @str152 : !llvm.ptr
          %1595 = func.call @cc_make_function_ref_const(%1594) : (!llvm.ptr) -> i64
          %1596 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1595, %1596) : (i64, i64) -> ()
        }
        %1597 = func.call @stack_pop_pointer() : () -> i64
        %1598 = llvm.mlir.addressof @str153 : !llvm.ptr
        %1599 = arith.constant 15 : i64
        %1600 = func.call @cc_make_string(%1598, %1599) : (!llvm.ptr, i64) -> i64
        %1601 = llvm.mlir.addressof @str154 : !llvm.ptr
        %1602 = arith.constant 7 : i64
        %1603 = func.call @cc_make_string(%1601, %1602) : (!llvm.ptr, i64) -> i64
        %1604 = func.call @cc_intern(%1600, %1603) : (i64, i64) -> i64
        %1605 = func.call @cc_nil_value() : () -> i64
        %1606 = func.call @cc_cons(%1604, %1605) : (i64, i64) -> i64
        %1607 = func.call @cc_values_pack(%1606) : (i64) -> i64
        func.call @stack_push_pointer(%1604) : (i64) -> ()
        %1608 = func.call @stack_pop_pointer() : () -> i64
        %1609 = llvm.mlir.addressof @str155 : !llvm.ptr
        %1610 = arith.constant 10 : i64
        %1611 = func.call @cc_make_string(%1609, %1610) : (!llvm.ptr, i64) -> i64
        %1612 = llvm.mlir.addressof @str156 : !llvm.ptr
        %1613 = arith.constant 7 : i64
        %1614 = func.call @cc_make_string(%1612, %1613) : (!llvm.ptr, i64) -> i64
        %1615 = func.call @cc_intern(%1611, %1614) : (i64, i64) -> i64
        %1616 = func.call @cc_nil_value() : () -> i64
        %1617 = func.call @cc_cons(%1615, %1616) : (i64, i64) -> i64
        %1618 = func.call @cc_values_pack(%1617) : (i64) -> i64
        func.call @stack_push_pointer(%1615) : (i64) -> ()
        %1619 = func.call @stack_pop_pointer() : () -> i64
        %1620 = func.call @cc_nil_value() : () -> i64
        %1621 = func.call @cc_cons(%1619, %1620) : (i64, i64) -> i64
        %1622 = func.call @cc_cons(%1608, %1621) : (i64, i64) -> i64
        %1623 = func.call @cc_cons(%1597, %1622) : (i64, i64) -> i64
        %1624 = func.call @cc_load_stack(%1623) : (i64) -> i64
        func.call @stack_push_pointer(%1624) : (i64) -> ()
        %1625 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1625 : i64
      }
      %1626 = func.call @cc_nil_value() : () -> i64
      %1627 = func.call @cc_errorp(%1582) : (i64) -> i64
      %1628 = arith.cmpi ne, %1627, %1626 : i64
      %1629 = scf.if %1628 -> (i64) {
        scf.yield %1582 : i64
      } else {
        %1630 = llvm.mlir.addressof @str157 : !llvm.ptr
        %1631 = arith.constant 15 : i64
        %1632 = func.call @cc_make_string(%1630, %1631) : (!llvm.ptr, i64) -> i64
        %1633 = llvm.mlir.addressof @str158 : !llvm.ptr
        %1634 = arith.constant 9 : i64
        %1635 = func.call @cc_make_string(%1633, %1634) : (!llvm.ptr, i64) -> i64
        %1636 = func.call @cc_intern(%1632, %1635) : (i64, i64) -> i64
        %1637 = func.call @cc_nil_value() : () -> i64
        %1638 = func.call @cc_cons(%1636, %1637) : (i64, i64) -> i64
        %1639 = func.call @cc_values_pack(%1638) : (i64) -> i64
        %1640 = func.call @cc_symbol_value(%1636) : (i64) -> i64
        func.call @stack_push_pointer(%1640) : (i64) -> ()
        %1641 = func.call @stack_pop_pointer() : () -> i64
        %1642 = func.call @cc_nil_value() : () -> i64
        %1643 = func.call @cc_errorp(%1641) : (i64) -> i64
        %1644 = arith.cmpi ne, %1643, %1642 : i64
        %1645 = arith.cmpi eq, %1642, %1642 : i64
        %1646 = arith.andi %1644, %1645 : i1
        %1647 = scf.if %1646 -> (i64) {
          scf.yield %1641 : i64
        } else {
          scf.yield %1642 : i64
        }
        %1648 = arith.cmpi ne, %1647, %1642 : i64
        scf.if %1648 {
          func.call @stack_push_pointer(%1647) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1641) : (i64) -> ()
          %1649 = llvm.mlir.addressof @str159 : !llvm.ptr
          %1650 = func.call @cc_make_function_ref_const(%1649) : (!llvm.ptr) -> i64
          %1651 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1650, %1651) : (i64, i64) -> ()
        }
        %1652 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1652 : i64
      }
      func.call @stack_push_pointer(%1629) : (i64) -> ()
      %1653 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1653 : i64
    }
    func.call @stack_push_pointer(%1577) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645768"() {
    %1870 = func.call @cc_nil_value() : () -> i64
    %1871 = func.call @cc_nil_value() : () -> i64
    %1872 = func.call @cc_errorp(%1870) : (i64) -> i64
    %1873 = arith.cmpi ne, %1872, %1871 : i64
    %1874 = scf.if %1873 -> (i64) {
      scf.yield %1870 : i64
    } else {
      %1875 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1876 = func.call @cc_nil_value() : () -> i64
      %1877 = func.call @cc_nil_value() : () -> i64
      %1878 = func.call @cc_errorp(%1876) : (i64) -> i64
      %1879 = arith.cmpi ne, %1878, %1877 : i64
      %1880 = scf.if %1879 -> (i64) {
        scf.yield %1876 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1881 = llvm.mlir.addressof @str180 : !llvm.ptr
        %1882 = arith.constant 42 : i64
        %1883 = func.call @cc_make_string(%1881, %1882) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1883) : (i64) -> ()
        %1884 = func.call @stack_pop_pointer() : () -> i64
        %1885 = func.call @cc_nil_value() : () -> i64
        %1886 = func.call @cc_errorp(%1884) : (i64) -> i64
        %1887 = arith.cmpi ne, %1886, %1885 : i64
        %1888 = arith.cmpi eq, %1885, %1885 : i64
        %1889 = arith.andi %1887, %1888 : i1
        %1890 = scf.if %1889 -> (i64) {
          scf.yield %1884 : i64
        } else {
          scf.yield %1885 : i64
        }
        %1891 = arith.cmpi ne, %1890, %1885 : i64
        scf.if %1891 {
          func.call @stack_push_pointer(%1890) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1884) : (i64) -> ()
          %1892 = llvm.mlir.addressof @str181 : !llvm.ptr
          %1893 = func.call @cc_make_function_ref_const(%1892) : (!llvm.ptr) -> i64
          %1894 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1893, %1894) : (i64, i64) -> ()
        }
        %1895 = func.call @stack_pop_pointer() : () -> i64
        %1896 = llvm.mlir.addressof @str182 : !llvm.ptr
        %1897 = arith.constant 15 : i64
        %1898 = func.call @cc_make_string(%1896, %1897) : (!llvm.ptr, i64) -> i64
        %1899 = llvm.mlir.addressof @str183 : !llvm.ptr
        %1900 = arith.constant 7 : i64
        %1901 = func.call @cc_make_string(%1899, %1900) : (!llvm.ptr, i64) -> i64
        %1902 = func.call @cc_intern(%1898, %1901) : (i64, i64) -> i64
        %1903 = func.call @cc_nil_value() : () -> i64
        %1904 = func.call @cc_cons(%1902, %1903) : (i64, i64) -> i64
        %1905 = func.call @cc_values_pack(%1904) : (i64) -> i64
        func.call @stack_push_pointer(%1902) : (i64) -> ()
        %1906 = func.call @stack_pop_pointer() : () -> i64
        %1907 = llvm.mlir.addressof @str184 : !llvm.ptr
        %1908 = arith.constant 8 : i64
        %1909 = func.call @cc_make_string(%1907, %1908) : (!llvm.ptr, i64) -> i64
        %1910 = llvm.mlir.addressof @str185 : !llvm.ptr
        %1911 = arith.constant 7 : i64
        %1912 = func.call @cc_make_string(%1910, %1911) : (!llvm.ptr, i64) -> i64
        %1913 = func.call @cc_intern(%1909, %1912) : (i64, i64) -> i64
        %1914 = func.call @cc_nil_value() : () -> i64
        %1915 = func.call @cc_cons(%1913, %1914) : (i64, i64) -> i64
        %1916 = func.call @cc_values_pack(%1915) : (i64) -> i64
        func.call @stack_push_pointer(%1913) : (i64) -> ()
        %1917 = func.call @stack_pop_pointer() : () -> i64
        %1918 = func.call @cc_nil_value() : () -> i64
        %1919 = func.call @cc_cons(%1917, %1918) : (i64, i64) -> i64
        %1920 = func.call @cc_cons(%1906, %1919) : (i64, i64) -> i64
        %1921 = func.call @cc_cons(%1895, %1920) : (i64, i64) -> i64
        %1922 = func.call @cc_load_stack(%1921) : (i64) -> i64
        func.call @stack_push_pointer(%1922) : (i64) -> ()
        %1923 = func.call @stack_pop_pointer() : () -> i64
        %1924 = func.call @cc_errorp(%1923) : (i64) -> i64
        %1925 = func.call @cc_nil_value() : () -> i64
        %1926 = arith.cmpi ne, %1924, %1925 : i64
        scf.if %1926 {
          func.call @stack_push_pointer(%1923) : (i64) -> ()
        } else {
          %1927 = func.call @cc_multiple_value_list(%1923) : (i64) -> i64
          func.call @stack_push_pointer(%1927) : (i64) -> ()
        }
        %1928 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1929 = func.call @stack_pop_pointer() : () -> i64
        %1930 = func.call @cc_nil_value() : () -> i64
        %1931 = func.call @cc_maybe_error_from_multiple_value_list(%1928) : (i64) -> i64
        %1932 = func.call @cc_errorp(%1931) : (i64) -> i64
        %1933 = arith.cmpi ne, %1932, %1930 : i64
        %1934 = arith.cmpi eq, %1930, %1930 : i64
        %1935 = arith.andi %1933, %1934 : i1
        %1936 = scf.if %1935 -> (i64) {
          scf.yield %1931 : i64
        } else {
          scf.yield %1930 : i64
        }
        %1937 = arith.cmpi ne, %1936, %1930 : i64
        scf.if %1937 {
          func.call @stack_push_pointer(%1936) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1938 = func.call @stack_pop_pointer() : () -> i64
          %1939 = func.call @cc_cons(%1929, %1938) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1939) : (i64) -> ()
          %1940 = func.call @stack_pop_pointer() : () -> i64
          %1941 = func.call @cc_cons(%1928, %1940) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1941) : (i64) -> ()
          %1942 = func.call @stack_pop_pointer() : () -> i64
          %1943 = func.call @cc_values_pack(%1942) : (i64) -> i64
          func.call @stack_push_pointer(%1943) : (i64) -> ()
        }
        %1944 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1944 : i64
      }
      func.call @stack_push_pointer(%1880) : (i64) -> ()
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1947 = func.call @cc_errorp(%1945) : (i64) -> i64
      %1948 = func.call @cc_nil_value() : () -> i64
      %1949 = arith.cmpi ne, %1947, %1948 : i64
      scf.if %1949 {
        %1950 = func.call @cc_condition_value(%1945) : (i64) -> i64
        %1951 = func.call @cc_values2(%1948, %1950) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1951) : (i64) -> ()
      } else {
        %1952 = func.call @cc_multiple_value_list(%1945) : (i64) -> i64
        %1953 = func.call @cc_values_pack(%1952) : (i64) -> i64
        func.call @stack_push_pointer(%1953) : (i64) -> ()
      }
      %1954 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1954 : i64
    }
    func.call @stack_push_pointer(%1874) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645769"() {
    %2942 = func.call @cc_nil_value() : () -> i64
    %2943 = func.call @cc_nil_value() : () -> i64
    %2944 = func.call @cc_errorp(%2942) : (i64) -> i64
    %2945 = arith.cmpi ne, %2944, %2943 : i64
    %2946 = scf.if %2945 -> (i64) {
      scf.yield %2942 : i64
    } else {
      %2947 = arith.constant 65 : i64
      func.call @stack_push_fixnum(%2947) : (i64) -> ()
      %2948 = func.call @stack_pop_pointer() : () -> i64
      %2949 = func.call @cc_unbox_fixnum(%2948) : (i64) -> i64
      %2950 = func.call @cc_box_character(%2949) : (i64) -> i64
      func.call @stack_push_pointer(%2950) : (i64) -> ()
      %2951 = func.call @stack_pop_pointer() : () -> i64
      %2952 = llvm.mlir.addressof @str294 : !llvm.ptr
      %2953 = arith.constant 47 : i64
      %2954 = func.call @cc_make_string(%2952, %2953) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2954) : (i64) -> ()
      %2955 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2956 = func.call @stack_pop_pointer() : () -> i64
      %2957 = func.call @cc_nil_value() : () -> i64
      %2958 = func.call @cc_nil_value() : () -> i64
      %2959 = func.call @cc_errorp(%2957) : (i64) -> i64
      %2960 = arith.cmpi ne, %2959, %2958 : i64
      %2961:2 = scf.if %2960 -> (i64, i64) {
        scf.yield %2957, %2956 : i64, i64
      } else {
        %2962 = func.call @cc_nil_value() : () -> i64
        %2963 = arith.cmpi ne, %2962, %2962 : i64
        scf.if %2963 {
          func.call @stack_push_pointer(%2962) : (i64) -> ()
        } else {
          %2964 = llvm.mlir.addressof @str295 : !llvm.ptr
          %2965 = func.call @cc_make_function_ref_const(%2964) : (!llvm.ptr) -> i64
          %2966 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2965, %2966) : (i64, i64) -> ()
        }
        %2967 = func.call @stack_pop_pointer() : () -> i64
        %2968:2 = scf.while (%arg0 = %2967, %arg1 = %2956) : (i64, i64) -> (i64, i64) {
          %2969 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %2970 = arith.constant 0 : i32
          %2971 = arith.cmpi ne, %2969, %2970 : i32
          scf.condition(%2971) %arg0, %arg1 : i64, i64
        } do {
          ^bb0(%2972: i64, %2973: i64):
          %2974 = func.call @cc_car(%2972) : (i64) -> i64
          func.call @stack_push_pointer(%2955) : (i64) -> ()
          %2975 = func.call @stack_pop_pointer() : () -> i64
          %2976 = llvm.mlir.addressof @str296 : !llvm.ptr
          %2977 = arith.constant 9 : i64
          %2978 = func.call @cc_make_string(%2976, %2977) : (!llvm.ptr, i64) -> i64
          %2979 = llvm.mlir.addressof @str297 : !llvm.ptr
          %2980 = arith.constant 7 : i64
          %2981 = func.call @cc_make_string(%2979, %2980) : (!llvm.ptr, i64) -> i64
          %2982 = func.call @cc_intern(%2978, %2981) : (i64, i64) -> i64
          %2983 = func.call @cc_nil_value() : () -> i64
          %2984 = func.call @cc_cons(%2982, %2983) : (i64, i64) -> i64
          %2985 = func.call @cc_values_pack(%2984) : (i64) -> i64
          func.call @stack_push_pointer(%2982) : (i64) -> ()
          %2986 = func.call @stack_pop_pointer() : () -> i64
          %2987 = llvm.mlir.addressof @str298 : !llvm.ptr
          %2988 = arith.constant 6 : i64
          %2989 = func.call @cc_make_string(%2987, %2988) : (!llvm.ptr, i64) -> i64
          %2990 = llvm.mlir.addressof @str299 : !llvm.ptr
          %2991 = arith.constant 7 : i64
          %2992 = func.call @cc_make_string(%2990, %2991) : (!llvm.ptr, i64) -> i64
          %2993 = func.call @cc_intern(%2989, %2992) : (i64, i64) -> i64
          %2994 = func.call @cc_nil_value() : () -> i64
          %2995 = func.call @cc_cons(%2993, %2994) : (i64, i64) -> i64
          %2996 = func.call @cc_values_pack(%2995) : (i64) -> i64
          func.call @stack_push_pointer(%2993) : (i64) -> ()
          %2997 = func.call @stack_pop_pointer() : () -> i64
          %2998 = llvm.mlir.addressof @str300 : !llvm.ptr
          %2999 = arith.constant 9 : i64
          %3000 = func.call @cc_make_string(%2998, %2999) : (!llvm.ptr, i64) -> i64
          %3001 = llvm.mlir.addressof @str301 : !llvm.ptr
          %3002 = arith.constant 7 : i64
          %3003 = func.call @cc_make_string(%3001, %3002) : (!llvm.ptr, i64) -> i64
          %3004 = func.call @cc_intern(%3000, %3003) : (i64, i64) -> i64
          %3005 = func.call @cc_nil_value() : () -> i64
          %3006 = func.call @cc_cons(%3004, %3005) : (i64, i64) -> i64
          %3007 = func.call @cc_values_pack(%3006) : (i64) -> i64
          func.call @stack_push_pointer(%3004) : (i64) -> ()
          %3008 = func.call @stack_pop_pointer() : () -> i64
          %3009 = llvm.mlir.addressof @str302 : !llvm.ptr
          %3010 = arith.constant 9 : i64
          %3011 = func.call @cc_make_string(%3009, %3010) : (!llvm.ptr, i64) -> i64
          %3012 = llvm.mlir.addressof @str303 : !llvm.ptr
          %3013 = arith.constant 7 : i64
          %3014 = func.call @cc_make_string(%3012, %3013) : (!llvm.ptr, i64) -> i64
          %3015 = func.call @cc_intern(%3011, %3014) : (i64, i64) -> i64
          %3016 = func.call @cc_nil_value() : () -> i64
          %3017 = func.call @cc_cons(%3015, %3016) : (i64, i64) -> i64
          %3018 = func.call @cc_values_pack(%3017) : (i64) -> i64
          func.call @stack_push_pointer(%3015) : (i64) -> ()
          %3019 = func.call @stack_pop_pointer() : () -> i64
          %3020 = llvm.mlir.addressof @str304 : !llvm.ptr
          %3021 = arith.constant 17 : i64
          %3022 = func.call @cc_make_string(%3020, %3021) : (!llvm.ptr, i64) -> i64
          %3023 = llvm.mlir.addressof @str305 : !llvm.ptr
          %3024 = arith.constant 7 : i64
          %3025 = func.call @cc_make_string(%3023, %3024) : (!llvm.ptr, i64) -> i64
          %3026 = func.call @cc_intern(%3022, %3025) : (i64, i64) -> i64
          %3027 = func.call @cc_nil_value() : () -> i64
          %3028 = func.call @cc_cons(%3026, %3027) : (i64, i64) -> i64
          %3029 = func.call @cc_values_pack(%3028) : (i64) -> i64
          func.call @stack_push_pointer(%3026) : (i64) -> ()
          %3030 = func.call @stack_pop_pointer() : () -> i64
          %3031 = llvm.mlir.addressof @str306 : !llvm.ptr
          %3032 = arith.constant 6 : i64
          %3033 = func.call @cc_make_string(%3031, %3032) : (!llvm.ptr, i64) -> i64
          %3034 = llvm.mlir.addressof @str307 : !llvm.ptr
          %3035 = arith.constant 7 : i64
          %3036 = func.call @cc_make_string(%3034, %3035) : (!llvm.ptr, i64) -> i64
          %3037 = func.call @cc_intern(%3033, %3036) : (i64, i64) -> i64
          %3038 = func.call @cc_nil_value() : () -> i64
          %3039 = func.call @cc_cons(%3037, %3038) : (i64, i64) -> i64
          %3040 = func.call @cc_values_pack(%3039) : (i64) -> i64
          func.call @stack_push_pointer(%3037) : (i64) -> ()
          %3041 = func.call @stack_pop_pointer() : () -> i64
          %3042 = llvm.mlir.addressof @str308 : !llvm.ptr
          %3043 = arith.constant 15 : i64
          %3044 = func.call @cc_make_string(%3042, %3043) : (!llvm.ptr, i64) -> i64
          %3045 = llvm.mlir.addressof @str309 : !llvm.ptr
          %3046 = arith.constant 7 : i64
          %3047 = func.call @cc_make_string(%3045, %3046) : (!llvm.ptr, i64) -> i64
          %3048 = func.call @cc_intern(%3044, %3047) : (i64, i64) -> i64
          %3049 = func.call @cc_nil_value() : () -> i64
          %3050 = func.call @cc_cons(%3048, %3049) : (i64, i64) -> i64
          %3051 = func.call @cc_values_pack(%3050) : (i64) -> i64
          func.call @stack_push_pointer(%3048) : (i64) -> ()
          %3052 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2974) : (i64) -> ()
          %3053 = func.call @stack_pop_pointer() : () -> i64
          %3054 = func.call @cc_nil_value() : () -> i64
          %3055 = func.call @cc_errorp(%2975) : (i64) -> i64
          %3056 = arith.cmpi ne, %3055, %3054 : i64
          %3057 = arith.cmpi eq, %3054, %3054 : i64
          %3058 = arith.andi %3056, %3057 : i1
          %3059 = scf.if %3058 -> (i64) {
            scf.yield %2975 : i64
          } else {
            scf.yield %3054 : i64
          }
          %3060 = func.call @cc_errorp(%2986) : (i64) -> i64
          %3061 = arith.cmpi ne, %3060, %3054 : i64
          %3062 = arith.cmpi eq, %3059, %3054 : i64
          %3063 = arith.andi %3061, %3062 : i1
          %3064 = scf.if %3063 -> (i64) {
            scf.yield %2986 : i64
          } else {
            scf.yield %3059 : i64
          }
          %3065 = func.call @cc_errorp(%2997) : (i64) -> i64
          %3066 = arith.cmpi ne, %3065, %3054 : i64
          %3067 = arith.cmpi eq, %3064, %3054 : i64
          %3068 = arith.andi %3066, %3067 : i1
          %3069 = scf.if %3068 -> (i64) {
            scf.yield %2997 : i64
          } else {
            scf.yield %3064 : i64
          }
          %3070 = func.call @cc_errorp(%3008) : (i64) -> i64
          %3071 = arith.cmpi ne, %3070, %3054 : i64
          %3072 = arith.cmpi eq, %3069, %3054 : i64
          %3073 = arith.andi %3071, %3072 : i1
          %3074 = scf.if %3073 -> (i64) {
            scf.yield %3008 : i64
          } else {
            scf.yield %3069 : i64
          }
          %3075 = func.call @cc_errorp(%3019) : (i64) -> i64
          %3076 = arith.cmpi ne, %3075, %3054 : i64
          %3077 = arith.cmpi eq, %3074, %3054 : i64
          %3078 = arith.andi %3076, %3077 : i1
          %3079 = scf.if %3078 -> (i64) {
            scf.yield %3019 : i64
          } else {
            scf.yield %3074 : i64
          }
          %3080 = func.call @cc_errorp(%3030) : (i64) -> i64
          %3081 = arith.cmpi ne, %3080, %3054 : i64
          %3082 = arith.cmpi eq, %3079, %3054 : i64
          %3083 = arith.andi %3081, %3082 : i1
          %3084 = scf.if %3083 -> (i64) {
            scf.yield %3030 : i64
          } else {
            scf.yield %3079 : i64
          }
          %3085 = func.call @cc_errorp(%3041) : (i64) -> i64
          %3086 = arith.cmpi ne, %3085, %3054 : i64
          %3087 = arith.cmpi eq, %3084, %3054 : i64
          %3088 = arith.andi %3086, %3087 : i1
          %3089 = scf.if %3088 -> (i64) {
            scf.yield %3041 : i64
          } else {
            scf.yield %3084 : i64
          }
          %3090 = func.call @cc_errorp(%3052) : (i64) -> i64
          %3091 = arith.cmpi ne, %3090, %3054 : i64
          %3092 = arith.cmpi eq, %3089, %3054 : i64
          %3093 = arith.andi %3091, %3092 : i1
          %3094 = scf.if %3093 -> (i64) {
            scf.yield %3052 : i64
          } else {
            scf.yield %3089 : i64
          }
          %3095 = func.call @cc_errorp(%3053) : (i64) -> i64
          %3096 = arith.cmpi ne, %3095, %3054 : i64
          %3097 = arith.cmpi eq, %3094, %3054 : i64
          %3098 = arith.andi %3096, %3097 : i1
          %3099 = scf.if %3098 -> (i64) {
            scf.yield %3053 : i64
          } else {
            scf.yield %3094 : i64
          }
          %3100 = arith.cmpi ne, %3099, %3054 : i64
          scf.if %3100 {
            func.call @stack_push_pointer(%3099) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2975) : (i64) -> ()
            func.call @stack_push_pointer(%2986) : (i64) -> ()
            func.call @stack_push_pointer(%2997) : (i64) -> ()
            func.call @stack_push_pointer(%3008) : (i64) -> ()
            func.call @stack_push_pointer(%3019) : (i64) -> ()
            func.call @stack_push_pointer(%3030) : (i64) -> ()
            func.call @stack_push_pointer(%3041) : (i64) -> ()
            func.call @stack_push_pointer(%3052) : (i64) -> ()
            func.call @stack_push_pointer(%3053) : (i64) -> ()
            %3101 = llvm.mlir.addressof @str310 : !llvm.ptr
            %3102 = func.call @cc_make_function_ref_const(%3101) : (!llvm.ptr) -> i64
            %3103 = arith.constant 9 : i64
            func.call @cc_funcall_stack(%3102, %3103) : (i64, i64) -> ()
          }
          %3104 = func.call @stack_pop_pointer() : () -> i64
          %3105 = func.call @cc_nil_value() : () -> i64
          %3106 = func.call @cc_nil_value() : () -> i64
          %3107 = func.call @cc_errorp(%3105) : (i64) -> i64
          %3108 = arith.cmpi ne, %3107, %3106 : i64
          %3109 = scf.if %3108 -> (i64) {
            scf.yield %3105 : i64
          } else {
            func.call @stack_push_pointer(%2951) : (i64) -> ()
            %3110 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3104) : (i64) -> ()
            %3111 = func.call @stack_pop_pointer() : () -> i64
            %3112 = func.call @cc_nil_value() : () -> i64
            %3113 = func.call @cc_errorp(%3110) : (i64) -> i64
            %3114 = arith.cmpi ne, %3113, %3112 : i64
            %3115 = arith.cmpi eq, %3112, %3112 : i64
            %3116 = arith.andi %3114, %3115 : i1
            %3117 = scf.if %3116 -> (i64) {
              scf.yield %3110 : i64
            } else {
              scf.yield %3112 : i64
            }
            %3118 = func.call @cc_errorp(%3111) : (i64) -> i64
            %3119 = arith.cmpi ne, %3118, %3112 : i64
            %3120 = arith.cmpi eq, %3117, %3112 : i64
            %3121 = arith.andi %3119, %3120 : i1
            %3122 = scf.if %3121 -> (i64) {
              scf.yield %3111 : i64
            } else {
              scf.yield %3117 : i64
            }
            %3123 = arith.cmpi ne, %3122, %3112 : i64
            scf.if %3123 {
              func.call @stack_push_pointer(%3122) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3110) : (i64) -> ()
              func.call @stack_push_pointer(%3111) : (i64) -> ()
              %3124 = llvm.mlir.addressof @str311 : !llvm.ptr
              %3125 = func.call @cc_make_function_ref_const(%3124) : (!llvm.ptr) -> i64
              %3126 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%3125, %3126) : (i64, i64) -> ()
            }
            %3127 = func.call @stack_pop_pointer() : () -> i64
            %3128 = func.call @cc_multiple_value_list(%3127) : (i64) -> i64
            func.call @stack_push_pointer(%3104) : (i64) -> ()
            %3129 = func.call @stack_pop_pointer() : () -> i64
            %3130 = func.call @cc_nil_value() : () -> i64
            %3131 = func.call @cc_errorp(%3129) : (i64) -> i64
            %3132 = arith.cmpi ne, %3131, %3130 : i64
            %3133 = arith.cmpi eq, %3130, %3130 : i64
            %3134 = arith.andi %3132, %3133 : i1
            %3135 = scf.if %3134 -> (i64) {
              scf.yield %3129 : i64
            } else {
              scf.yield %3130 : i64
            }
            %3136 = arith.cmpi ne, %3135, %3130 : i64
            scf.if %3136 {
              func.call @stack_push_pointer(%3135) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3129) : (i64) -> ()
              %3137 = llvm.mlir.addressof @str312 : !llvm.ptr
              %3138 = func.call @cc_make_function_ref_const(%3137) : (!llvm.ptr) -> i64
              %3139 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3138, %3139) : (i64, i64) -> ()
            }
            %3140 = func.call @stack_depth() : () -> i64
            %3141 = arith.constant 0 : i64
            %3142 = arith.cmpi sgt, %3140, %3141 : i64
            scf.if %3142 {
              %3143 = func.call @stack_pop_pointer() : () -> i64
            }
            %3144 = func.call @cc_values_pack(%3128) : (i64) -> i64
            func.call @stack_push_pointer(%3144) : (i64) -> ()
            %3145 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3145 : i64
          }
          func.call @stack_push_pointer(%3109) : (i64) -> ()
          %3146 = func.call @stack_depth() : () -> i64
          %3147 = arith.constant 0 : i64
          %3148 = arith.cmpi sgt, %3146, %3147 : i64
          scf.if %3148 {
            %3149 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%2955) : (i64) -> ()
          %3150 = func.call @stack_pop_pointer() : () -> i64
          %3151 = llvm.mlir.addressof @str313 : !llvm.ptr
          %3152 = arith.constant 9 : i64
          %3153 = func.call @cc_make_string(%3151, %3152) : (!llvm.ptr, i64) -> i64
          %3154 = llvm.mlir.addressof @str314 : !llvm.ptr
          %3155 = arith.constant 7 : i64
          %3156 = func.call @cc_make_string(%3154, %3155) : (!llvm.ptr, i64) -> i64
          %3157 = func.call @cc_intern(%3153, %3156) : (i64, i64) -> i64
          %3158 = func.call @cc_nil_value() : () -> i64
          %3159 = func.call @cc_cons(%3157, %3158) : (i64, i64) -> i64
          %3160 = func.call @cc_values_pack(%3159) : (i64) -> i64
          func.call @stack_push_pointer(%3157) : (i64) -> ()
          %3161 = func.call @stack_pop_pointer() : () -> i64
          %3162 = llvm.mlir.addressof @str315 : !llvm.ptr
          %3163 = arith.constant 5 : i64
          %3164 = func.call @cc_make_string(%3162, %3163) : (!llvm.ptr, i64) -> i64
          %3165 = llvm.mlir.addressof @str316 : !llvm.ptr
          %3166 = arith.constant 7 : i64
          %3167 = func.call @cc_make_string(%3165, %3166) : (!llvm.ptr, i64) -> i64
          %3168 = func.call @cc_intern(%3164, %3167) : (i64, i64) -> i64
          %3169 = func.call @cc_nil_value() : () -> i64
          %3170 = func.call @cc_cons(%3168, %3169) : (i64, i64) -> i64
          %3171 = func.call @cc_values_pack(%3170) : (i64) -> i64
          func.call @stack_push_pointer(%3168) : (i64) -> ()
          %3172 = func.call @stack_pop_pointer() : () -> i64
          %3173 = llvm.mlir.addressof @str317 : !llvm.ptr
          %3174 = arith.constant 15 : i64
          %3175 = func.call @cc_make_string(%3173, %3174) : (!llvm.ptr, i64) -> i64
          %3176 = llvm.mlir.addressof @str318 : !llvm.ptr
          %3177 = arith.constant 7 : i64
          %3178 = func.call @cc_make_string(%3176, %3177) : (!llvm.ptr, i64) -> i64
          %3179 = func.call @cc_intern(%3175, %3178) : (i64, i64) -> i64
          %3180 = func.call @cc_nil_value() : () -> i64
          %3181 = func.call @cc_cons(%3179, %3180) : (i64, i64) -> i64
          %3182 = func.call @cc_values_pack(%3181) : (i64) -> i64
          func.call @stack_push_pointer(%3179) : (i64) -> ()
          %3183 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2974) : (i64) -> ()
          %3184 = func.call @stack_pop_pointer() : () -> i64
          %3185 = func.call @cc_nil_value() : () -> i64
          %3186 = func.call @cc_errorp(%3150) : (i64) -> i64
          %3187 = arith.cmpi ne, %3186, %3185 : i64
          %3188 = arith.cmpi eq, %3185, %3185 : i64
          %3189 = arith.andi %3187, %3188 : i1
          %3190 = scf.if %3189 -> (i64) {
            scf.yield %3150 : i64
          } else {
            scf.yield %3185 : i64
          }
          %3191 = func.call @cc_errorp(%3161) : (i64) -> i64
          %3192 = arith.cmpi ne, %3191, %3185 : i64
          %3193 = arith.cmpi eq, %3190, %3185 : i64
          %3194 = arith.andi %3192, %3193 : i1
          %3195 = scf.if %3194 -> (i64) {
            scf.yield %3161 : i64
          } else {
            scf.yield %3190 : i64
          }
          %3196 = func.call @cc_errorp(%3172) : (i64) -> i64
          %3197 = arith.cmpi ne, %3196, %3185 : i64
          %3198 = arith.cmpi eq, %3195, %3185 : i64
          %3199 = arith.andi %3197, %3198 : i1
          %3200 = scf.if %3199 -> (i64) {
            scf.yield %3172 : i64
          } else {
            scf.yield %3195 : i64
          }
          %3201 = func.call @cc_errorp(%3183) : (i64) -> i64
          %3202 = arith.cmpi ne, %3201, %3185 : i64
          %3203 = arith.cmpi eq, %3200, %3185 : i64
          %3204 = arith.andi %3202, %3203 : i1
          %3205 = scf.if %3204 -> (i64) {
            scf.yield %3183 : i64
          } else {
            scf.yield %3200 : i64
          }
          %3206 = func.call @cc_errorp(%3184) : (i64) -> i64
          %3207 = arith.cmpi ne, %3206, %3185 : i64
          %3208 = arith.cmpi eq, %3205, %3185 : i64
          %3209 = arith.andi %3207, %3208 : i1
          %3210 = scf.if %3209 -> (i64) {
            scf.yield %3184 : i64
          } else {
            scf.yield %3205 : i64
          }
          %3211 = arith.cmpi ne, %3210, %3185 : i64
          scf.if %3211 {
            func.call @stack_push_pointer(%3210) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3150) : (i64) -> ()
            func.call @stack_push_pointer(%3161) : (i64) -> ()
            func.call @stack_push_pointer(%3172) : (i64) -> ()
            func.call @stack_push_pointer(%3183) : (i64) -> ()
            func.call @stack_push_pointer(%3184) : (i64) -> ()
            %3212 = llvm.mlir.addressof @str319 : !llvm.ptr
            %3213 = func.call @cc_make_function_ref_const(%3212) : (!llvm.ptr) -> i64
            %3214 = arith.constant 5 : i64
            func.call @cc_funcall_stack(%3213, %3214) : (i64, i64) -> ()
          }
          %3215 = func.call @stack_pop_pointer() : () -> i64
          %3216 = func.call @cc_nil_value() : () -> i64
          %3217 = func.call @cc_nil_value() : () -> i64
          %3218 = func.call @cc_errorp(%3216) : (i64) -> i64
          %3219 = arith.cmpi ne, %3218, %3217 : i64
          %3220:2 = scf.if %3219 -> (i64, i64) {
            scf.yield %3216, %2973 : i64, i64
          } else {
            func.call @stack_push_pointer(%3215) : (i64) -> ()
            %3221 = func.call @stack_pop_pointer() : () -> i64
            %3222 = func.call @cc_nil_value() : () -> i64
            %3223 = func.call @cc_errorp(%3221) : (i64) -> i64
            %3224 = arith.cmpi ne, %3223, %3222 : i64
            %3225 = arith.cmpi eq, %3222, %3222 : i64
            %3226 = arith.andi %3224, %3225 : i1
            %3227 = scf.if %3226 -> (i64) {
              scf.yield %3221 : i64
            } else {
              scf.yield %3222 : i64
            }
            %3228 = arith.cmpi ne, %3227, %3222 : i64
            scf.if %3228 {
              func.call @stack_push_pointer(%3227) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3221) : (i64) -> ()
              %3229 = llvm.mlir.addressof @str320 : !llvm.ptr
              %3230 = func.call @cc_make_function_ref_const(%3229) : (!llvm.ptr) -> i64
              %3231 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3230, %3231) : (i64, i64) -> ()
            }
            %3232 = func.call @stack_pop_pointer() : () -> i64
            %3233 = func.call @cc_nil_value() : () -> i64
            %3234 = func.call @cc_nil_value() : () -> i64
            %3235 = func.call @cc_errorp(%3233) : (i64) -> i64
            %3236 = arith.cmpi ne, %3235, %3234 : i64
            %3237:2 = scf.if %3236 -> (i64, i64) {
              scf.yield %3233, %2973 : i64, i64
            } else {
              func.call @stack_push_pointer(%2974) : (i64) -> ()
              %3238 = llvm.mlir.addressof @str321 : !llvm.ptr
              %3239 = arith.constant 5 : i64
              %3240 = func.call @cc_make_string(%3238, %3239) : (!llvm.ptr, i64) -> i64
              %3241 = llvm.mlir.addressof @str322 : !llvm.ptr
              %3242 = arith.constant 7 : i64
              %3243 = func.call @cc_make_string(%3241, %3242) : (!llvm.ptr, i64) -> i64
              %3244 = func.call @cc_intern(%3240, %3243) : (i64, i64) -> i64
              %3245 = func.call @cc_nil_value() : () -> i64
              %3246 = func.call @cc_cons(%3244, %3245) : (i64, i64) -> i64
              %3247 = func.call @cc_values_pack(%3246) : (i64) -> i64
              func.call @stack_push_pointer(%3244) : (i64) -> ()
              %3248 = llvm.mlir.addressof @str323 : !llvm.ptr
              %3249 = arith.constant 5 : i64
              %3250 = func.call @cc_make_string(%3248, %3249) : (!llvm.ptr, i64) -> i64
              %3251 = llvm.mlir.addressof @str324 : !llvm.ptr
              %3252 = arith.constant 7 : i64
              %3253 = func.call @cc_make_string(%3251, %3252) : (!llvm.ptr, i64) -> i64
              %3254 = func.call @cc_intern(%3250, %3253) : (i64, i64) -> i64
              %3255 = func.call @cc_nil_value() : () -> i64
              %3256 = func.call @cc_cons(%3254, %3255) : (i64, i64) -> i64
              %3257 = func.call @cc_values_pack(%3256) : (i64) -> i64
              func.call @stack_push_pointer(%3254) : (i64) -> ()
              func.call @stack_push_nil() : () -> ()
              %3258 = func.call @stack_pop_pointer() : () -> i64
              %3259 = func.call @stack_pop_pointer() : () -> i64
              %3260 = func.call @cc_cons(%3259, %3258) : (i64, i64) -> i64
              func.call @stack_push_pointer(%3260) : (i64) -> ()
              %3261 = func.call @stack_pop_pointer() : () -> i64
              %3262 = func.call @stack_pop_pointer() : () -> i64
              %3263 = func.call @cc_cons(%3262, %3261) : (i64, i64) -> i64
              func.call @stack_push_pointer(%3263) : (i64) -> ()
              %3264 = func.call @stack_pop_pointer() : () -> i64
              %3265 = func.call @stack_pop_pointer() : () -> i64
              %3266 = func.call @cc_member(%3265, %3264) : (i64, i64) -> i64
              func.call @stack_push_pointer(%3266) : (i64) -> ()
              %3267 = func.call @stack_pop_pointer() : () -> i64
              %3268 = func.call @cc_nil_value() : () -> i64
              %3269 = func.call @cc_cons(%3267, %3268) : (i64, i64) -> i64
              %3270 = func.call @cc_not(%3269) : (i64) -> i64
              func.call @stack_push_pointer(%3270) : (i64) -> ()
              %3271 = func.call @stack_pop_pointer() : () -> i64
              %3272 = func.call @cc_nil_value() : () -> i64
              %3273 = arith.cmpi ne, %3271, %3272 : i64
              %3274:2 = scf.if %3273 -> (i64, i64) {
                %3275 = func.call @cc_nil_value() : () -> i64
                %3276 = func.call @cc_nil_value() : () -> i64
                %3277 = func.call @cc_errorp(%3275) : (i64) -> i64
                %3278 = arith.cmpi ne, %3277, %3276 : i64
                %3279:2 = scf.if %3278 -> (i64, i64) {
                  scf.yield %3275, %2973 : i64, i64
                } else {
                  func.call @stack_push_pointer(%2951) : (i64) -> ()
                  func.call @stack_push_pointer(%3232) : (i64) -> ()
                  %3280 = func.call @stack_pop_pointer() : () -> i64
                  %3281 = func.call @stack_pop_pointer() : () -> i64
                  %3282 = func.call @cc_char_eq(%3281, %3280) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%3282) : (i64) -> ()
                  %3283 = func.call @stack_pop_pointer() : () -> i64
                  %3284 = func.call @cc_nil_value() : () -> i64
                  %3285 = func.call @cc_cons(%3283, %3284) : (i64, i64) -> i64
                  %3286 = func.call @cc_not(%3285) : (i64) -> i64
                  func.call @stack_push_pointer(%3286) : (i64) -> ()
                  %3287 = func.call @stack_pop_pointer() : () -> i64
                  %3288 = func.call @cc_nil_value() : () -> i64
                  %3289 = arith.cmpi ne, %3287, %3288 : i64
                  %3290:2 = scf.if %3289 -> (i64, i64) {
                    %3291 = func.call @cc_nil_value() : () -> i64
                    %3292 = func.call @cc_nil_value() : () -> i64
                    %3293 = func.call @cc_errorp(%3291) : (i64) -> i64
                    %3294 = arith.cmpi ne, %3293, %3292 : i64
                    %3295:2 = scf.if %3294 -> (i64, i64) {
                      scf.yield %3291, %2973 : i64, i64
                    } else {
                      func.call @stack_push_pointer(%2951) : (i64) -> ()
                      %3296 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%3232) : (i64) -> ()
                      %3297 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%2974) : (i64) -> ()
                      %3298 = func.call @stack_pop_pointer() : () -> i64
                      %3299 = func.call @cc_nil_value() : () -> i64
                      %3300 = func.call @cc_errorp(%3296) : (i64) -> i64
                      %3301 = arith.cmpi ne, %3300, %3299 : i64
                      %3302 = arith.cmpi eq, %3299, %3299 : i64
                      %3303 = arith.andi %3301, %3302 : i1
                      %3304 = scf.if %3303 -> (i64) {
                        scf.yield %3296 : i64
                      } else {
                        scf.yield %3299 : i64
                      }
                      %3305 = func.call @cc_errorp(%3297) : (i64) -> i64
                      %3306 = arith.cmpi ne, %3305, %3299 : i64
                      %3307 = arith.cmpi eq, %3304, %3299 : i64
                      %3308 = arith.andi %3306, %3307 : i1
                      %3309 = scf.if %3308 -> (i64) {
                        scf.yield %3297 : i64
                      } else {
                        scf.yield %3304 : i64
                      }
                      %3310 = func.call @cc_errorp(%3298) : (i64) -> i64
                      %3311 = arith.cmpi ne, %3310, %3299 : i64
                      %3312 = arith.cmpi eq, %3309, %3299 : i64
                      %3313 = arith.andi %3311, %3312 : i1
                      %3314 = scf.if %3313 -> (i64) {
                        scf.yield %3298 : i64
                      } else {
                        scf.yield %3309 : i64
                      }
                      %3315 = arith.cmpi ne, %3314, %3299 : i64
                      scf.if %3315 {
                        func.call @stack_push_pointer(%3314) : (i64) -> ()
                      } else {
                        %3316 = func.call @cc_nil_value() : () -> i64
                        func.call @stack_push_pointer(%3316) : (i64) -> ()
                        func.call @stack_push_pointer(%3298) : (i64) -> ()
                        %3317 = func.call @stack_pop_pointer() : () -> i64
                        %3318 = func.call @stack_pop_pointer() : () -> i64
                        %3319 = func.call @cc_cons(%3317, %3318) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%3319) : (i64) -> ()
                        func.call @stack_push_pointer(%3297) : (i64) -> ()
                        %3320 = func.call @stack_pop_pointer() : () -> i64
                        %3321 = func.call @stack_pop_pointer() : () -> i64
                        %3322 = func.call @cc_cons(%3320, %3321) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%3322) : (i64) -> ()
                        func.call @stack_push_pointer(%3296) : (i64) -> ()
                        %3323 = func.call @stack_pop_pointer() : () -> i64
                        %3324 = func.call @stack_pop_pointer() : () -> i64
                        %3325 = func.call @cc_cons(%3323, %3324) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%3325) : (i64) -> ()
                      }
                      %3326 = func.call @stack_pop_pointer() : () -> i64
                      %3327 = func.call @cc_cons(%3326, %2973) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%3327) : (i64) -> ()
                      %3328 = func.call @stack_pop_pointer() : () -> i64
                      scf.yield %3328, %3327 : i64, i64
                    }
                    func.call @stack_push_pointer(%3295#0) : (i64) -> ()
                    %3329 = func.call @stack_pop_pointer() : () -> i64
                    scf.yield %3329, %3295#1 : i64, i64
                  } else {
                    func.call @stack_push_nil() : () -> ()
                    %3330 = func.call @stack_pop_pointer() : () -> i64
                    scf.yield %3330, %2973 : i64, i64
                  }
                  func.call @stack_push_pointer(%3290#0) : (i64) -> ()
                  %3331 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %3331, %3290#1 : i64, i64
                }
                func.call @stack_push_pointer(%3279#0) : (i64) -> ()
                %3332 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %3332, %3279#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %3333 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %3333, %2973 : i64, i64
              }
              func.call @stack_push_pointer(%3274#0) : (i64) -> ()
              %3334 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %3334, %3274#1 : i64, i64
            }
            func.call @stack_push_pointer(%3237#0) : (i64) -> ()
            %3335 = func.call @stack_pop_pointer() : () -> i64
            %3336 = func.call @cc_multiple_value_list(%3335) : (i64) -> i64
            func.call @stack_push_pointer(%3215) : (i64) -> ()
            %3337 = func.call @stack_pop_pointer() : () -> i64
            %3338 = func.call @cc_nil_value() : () -> i64
            %3339 = func.call @cc_errorp(%3337) : (i64) -> i64
            %3340 = arith.cmpi ne, %3339, %3338 : i64
            %3341 = arith.cmpi eq, %3338, %3338 : i64
            %3342 = arith.andi %3340, %3341 : i1
            %3343 = scf.if %3342 -> (i64) {
              scf.yield %3337 : i64
            } else {
              scf.yield %3338 : i64
            }
            %3344 = arith.cmpi ne, %3343, %3338 : i64
            scf.if %3344 {
              func.call @stack_push_pointer(%3343) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3337) : (i64) -> ()
              %3345 = llvm.mlir.addressof @str325 : !llvm.ptr
              %3346 = func.call @cc_make_function_ref_const(%3345) : (!llvm.ptr) -> i64
              %3347 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3346, %3347) : (i64, i64) -> ()
            }
            %3348 = func.call @stack_depth() : () -> i64
            %3349 = arith.constant 0 : i64
            %3350 = arith.cmpi sgt, %3348, %3349 : i64
            scf.if %3350 {
              %3351 = func.call @stack_pop_pointer() : () -> i64
            }
            %3352 = func.call @cc_values_pack(%3336) : (i64) -> i64
            func.call @stack_push_pointer(%3352) : (i64) -> ()
            %3353 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3353, %3237#1 : i64, i64
          }
          func.call @stack_push_pointer(%3220#0) : (i64) -> ()
          %3354 = func.call @stack_depth() : () -> i64
          %3355 = arith.constant 0 : i64
          %3356 = arith.cmpi sgt, %3354, %3355 : i64
          scf.if %3356 {
            %3357 = func.call @stack_pop_pointer() : () -> i64
          }
          %3358 = func.call @cc_cdr(%2972) : (i64) -> i64
          scf.yield %3358, %3220#1 : i64, i64
        }
        %3359 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2968#1) : (i64) -> ()
        %3360 = func.call @stack_pop_pointer() : () -> i64
        %3361 = func.call @cc_multiple_value_list(%3360) : (i64) -> i64
        func.call @stack_push_pointer(%2955) : (i64) -> ()
        %3362 = func.call @stack_pop_pointer() : () -> i64
        %3363 = func.call @cc_nil_value() : () -> i64
        %3364 = func.call @cc_errorp(%3362) : (i64) -> i64
        %3365 = arith.cmpi ne, %3364, %3363 : i64
        %3366 = arith.cmpi eq, %3363, %3363 : i64
        %3367 = arith.andi %3365, %3366 : i1
        %3368 = scf.if %3367 -> (i64) {
          scf.yield %3362 : i64
        } else {
          scf.yield %3363 : i64
        }
        %3369 = arith.cmpi ne, %3368, %3363 : i64
        scf.if %3369 {
          func.call @stack_push_pointer(%3368) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3362) : (i64) -> ()
          %3370 = llvm.mlir.addressof @str326 : !llvm.ptr
          %3371 = func.call @cc_make_function_ref_const(%3370) : (!llvm.ptr) -> i64
          %3372 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3371, %3372) : (i64, i64) -> ()
        }
        %3373 = func.call @stack_pop_pointer() : () -> i64
        %3374 = func.call @cc_nil_value() : () -> i64
        %3375 = arith.cmpi ne, %3373, %3374 : i64
        scf.if %3375 {
          %3376 = func.call @cc_nil_value() : () -> i64
          %3377 = func.call @cc_nil_value() : () -> i64
          %3378 = func.call @cc_errorp(%3376) : (i64) -> i64
          %3379 = arith.cmpi ne, %3378, %3377 : i64
          %3380 = scf.if %3379 -> (i64) {
            scf.yield %3376 : i64
          } else {
            func.call @stack_push_pointer(%2955) : (i64) -> ()
            %3381 = func.call @stack_pop_pointer() : () -> i64
            %3382 = func.call @cc_nil_value() : () -> i64
            %3383 = func.call @cc_errorp(%3381) : (i64) -> i64
            %3384 = arith.cmpi ne, %3383, %3382 : i64
            %3385 = arith.cmpi eq, %3382, %3382 : i64
            %3386 = arith.andi %3384, %3385 : i1
            %3387 = scf.if %3386 -> (i64) {
              scf.yield %3381 : i64
            } else {
              scf.yield %3382 : i64
            }
            %3388 = arith.cmpi ne, %3387, %3382 : i64
            scf.if %3388 {
              func.call @stack_push_pointer(%3387) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3381) : (i64) -> ()
              %3389 = llvm.mlir.addressof @str327 : !llvm.ptr
              %3390 = func.call @cc_make_function_ref_const(%3389) : (!llvm.ptr) -> i64
              %3391 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3390, %3391) : (i64, i64) -> ()
            }
            %3392 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3392 : i64
          }
          func.call @stack_push_pointer(%3380) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
        }
        %3393 = func.call @stack_depth() : () -> i64
        %3394 = arith.constant 0 : i64
        %3395 = arith.cmpi sgt, %3393, %3394 : i64
        scf.if %3395 {
          %3396 = func.call @stack_pop_pointer() : () -> i64
        }
        %3397 = func.call @cc_values_pack(%3361) : (i64) -> i64
        func.call @stack_push_pointer(%3397) : (i64) -> ()
        %3398 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3398, %2968#1 : i64, i64
      }
      func.call @stack_push_pointer(%2961#0) : (i64) -> ()
      %3399 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3399 : i64
    }
    func.call @stack_push_pointer(%2946) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645770"() {
    %3688 = func.call @cc_nil_value() : () -> i64
    %3689 = func.call @cc_nil_value() : () -> i64
    %3690 = func.call @cc_errorp(%3688) : (i64) -> i64
    %3691 = arith.cmpi ne, %3690, %3689 : i64
    %3692 = scf.if %3691 -> (i64) {
      scf.yield %3688 : i64
    } else {
      %3693 = llvm.mlir.addressof @str362 : !llvm.ptr
      %3694 = arith.constant 46 : i64
      %3695 = func.call @cc_make_string(%3693, %3694) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3695) : (i64) -> ()
      %3696 = func.call @stack_pop_pointer() : () -> i64
      %3697 = llvm.mlir.addressof @str363 : !llvm.ptr
      %3698 = arith.constant 9 : i64
      %3699 = func.call @cc_make_string(%3697, %3698) : (!llvm.ptr, i64) -> i64
      %3700 = llvm.mlir.addressof @str364 : !llvm.ptr
      %3701 = arith.constant 7 : i64
      %3702 = func.call @cc_make_string(%3700, %3701) : (!llvm.ptr, i64) -> i64
      %3703 = func.call @cc_intern(%3699, %3702) : (i64, i64) -> i64
      %3704 = func.call @cc_nil_value() : () -> i64
      %3705 = func.call @cc_cons(%3703, %3704) : (i64, i64) -> i64
      %3706 = func.call @cc_values_pack(%3705) : (i64) -> i64
      func.call @stack_push_pointer(%3703) : (i64) -> ()
      %3707 = func.call @stack_pop_pointer() : () -> i64
      %3708 = llvm.mlir.addressof @str365 : !llvm.ptr
      %3709 = arith.constant 6 : i64
      %3710 = func.call @cc_make_string(%3708, %3709) : (!llvm.ptr, i64) -> i64
      %3711 = llvm.mlir.addressof @str366 : !llvm.ptr
      %3712 = arith.constant 7 : i64
      %3713 = func.call @cc_make_string(%3711, %3712) : (!llvm.ptr, i64) -> i64
      %3714 = func.call @cc_intern(%3710, %3713) : (i64, i64) -> i64
      %3715 = func.call @cc_nil_value() : () -> i64
      %3716 = func.call @cc_cons(%3714, %3715) : (i64, i64) -> i64
      %3717 = func.call @cc_values_pack(%3716) : (i64) -> i64
      func.call @stack_push_pointer(%3714) : (i64) -> ()
      %3718 = func.call @stack_pop_pointer() : () -> i64
      %3719 = llvm.mlir.addressof @str367 : !llvm.ptr
      %3720 = arith.constant 9 : i64
      %3721 = func.call @cc_make_string(%3719, %3720) : (!llvm.ptr, i64) -> i64
      %3722 = llvm.mlir.addressof @str368 : !llvm.ptr
      %3723 = arith.constant 7 : i64
      %3724 = func.call @cc_make_string(%3722, %3723) : (!llvm.ptr, i64) -> i64
      %3725 = func.call @cc_intern(%3721, %3724) : (i64, i64) -> i64
      %3726 = func.call @cc_nil_value() : () -> i64
      %3727 = func.call @cc_cons(%3725, %3726) : (i64, i64) -> i64
      %3728 = func.call @cc_values_pack(%3727) : (i64) -> i64
      func.call @stack_push_pointer(%3725) : (i64) -> ()
      %3729 = func.call @stack_pop_pointer() : () -> i64
      %3730 = llvm.mlir.addressof @str369 : !llvm.ptr
      %3731 = arith.constant 9 : i64
      %3732 = func.call @cc_make_string(%3730, %3731) : (!llvm.ptr, i64) -> i64
      %3733 = llvm.mlir.addressof @str370 : !llvm.ptr
      %3734 = arith.constant 7 : i64
      %3735 = func.call @cc_make_string(%3733, %3734) : (!llvm.ptr, i64) -> i64
      %3736 = func.call @cc_intern(%3732, %3735) : (i64, i64) -> i64
      %3737 = func.call @cc_nil_value() : () -> i64
      %3738 = func.call @cc_cons(%3736, %3737) : (i64, i64) -> i64
      %3739 = func.call @cc_values_pack(%3738) : (i64) -> i64
      func.call @stack_push_pointer(%3736) : (i64) -> ()
      %3740 = func.call @stack_pop_pointer() : () -> i64
      %3741 = llvm.mlir.addressof @str371 : !llvm.ptr
      %3742 = arith.constant 17 : i64
      %3743 = func.call @cc_make_string(%3741, %3742) : (!llvm.ptr, i64) -> i64
      %3744 = llvm.mlir.addressof @str372 : !llvm.ptr
      %3745 = arith.constant 7 : i64
      %3746 = func.call @cc_make_string(%3744, %3745) : (!llvm.ptr, i64) -> i64
      %3747 = func.call @cc_intern(%3743, %3746) : (i64, i64) -> i64
      %3748 = func.call @cc_nil_value() : () -> i64
      %3749 = func.call @cc_cons(%3747, %3748) : (i64, i64) -> i64
      %3750 = func.call @cc_values_pack(%3749) : (i64) -> i64
      func.call @stack_push_pointer(%3747) : (i64) -> ()
      %3751 = func.call @stack_pop_pointer() : () -> i64
      %3752 = llvm.mlir.addressof @str373 : !llvm.ptr
      %3753 = arith.constant 6 : i64
      %3754 = func.call @cc_make_string(%3752, %3753) : (!llvm.ptr, i64) -> i64
      %3755 = llvm.mlir.addressof @str374 : !llvm.ptr
      %3756 = arith.constant 7 : i64
      %3757 = func.call @cc_make_string(%3755, %3756) : (!llvm.ptr, i64) -> i64
      %3758 = func.call @cc_intern(%3754, %3757) : (i64, i64) -> i64
      %3759 = func.call @cc_nil_value() : () -> i64
      %3760 = func.call @cc_cons(%3758, %3759) : (i64, i64) -> i64
      %3761 = func.call @cc_values_pack(%3760) : (i64) -> i64
      func.call @stack_push_pointer(%3758) : (i64) -> ()
      %3762 = func.call @stack_pop_pointer() : () -> i64
      %3763 = llvm.mlir.addressof @str375 : !llvm.ptr
      %3764 = arith.constant 15 : i64
      %3765 = func.call @cc_make_string(%3763, %3764) : (!llvm.ptr, i64) -> i64
      %3766 = llvm.mlir.addressof @str376 : !llvm.ptr
      %3767 = arith.constant 7 : i64
      %3768 = func.call @cc_make_string(%3766, %3767) : (!llvm.ptr, i64) -> i64
      %3769 = func.call @cc_intern(%3765, %3768) : (i64, i64) -> i64
      %3770 = func.call @cc_nil_value() : () -> i64
      %3771 = func.call @cc_cons(%3769, %3770) : (i64, i64) -> i64
      %3772 = func.call @cc_values_pack(%3771) : (i64) -> i64
      func.call @stack_push_pointer(%3769) : (i64) -> ()
      %3773 = func.call @stack_pop_pointer() : () -> i64
      %3774 = llvm.mlir.addressof @str377 : !llvm.ptr
      %3775 = arith.constant 7 : i64
      %3776 = func.call @cc_make_string(%3774, %3775) : (!llvm.ptr, i64) -> i64
      %3777 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3778 = arith.constant 7 : i64
      %3779 = func.call @cc_make_string(%3777, %3778) : (!llvm.ptr, i64) -> i64
      %3780 = func.call @cc_intern(%3776, %3779) : (i64, i64) -> i64
      %3781 = func.call @cc_nil_value() : () -> i64
      %3782 = func.call @cc_cons(%3780, %3781) : (i64, i64) -> i64
      %3783 = func.call @cc_values_pack(%3782) : (i64) -> i64
      func.call @stack_push_pointer(%3780) : (i64) -> ()
      %3784 = func.call @stack_pop_pointer() : () -> i64
      %3785 = func.call @cc_nil_value() : () -> i64
      %3786 = func.call @cc_errorp(%3696) : (i64) -> i64
      %3787 = arith.cmpi ne, %3786, %3785 : i64
      %3788 = arith.cmpi eq, %3785, %3785 : i64
      %3789 = arith.andi %3787, %3788 : i1
      %3790 = scf.if %3789 -> (i64) {
        scf.yield %3696 : i64
      } else {
        scf.yield %3785 : i64
      }
      %3791 = func.call @cc_errorp(%3707) : (i64) -> i64
      %3792 = arith.cmpi ne, %3791, %3785 : i64
      %3793 = arith.cmpi eq, %3790, %3785 : i64
      %3794 = arith.andi %3792, %3793 : i1
      %3795 = scf.if %3794 -> (i64) {
        scf.yield %3707 : i64
      } else {
        scf.yield %3790 : i64
      }
      %3796 = func.call @cc_errorp(%3718) : (i64) -> i64
      %3797 = arith.cmpi ne, %3796, %3785 : i64
      %3798 = arith.cmpi eq, %3795, %3785 : i64
      %3799 = arith.andi %3797, %3798 : i1
      %3800 = scf.if %3799 -> (i64) {
        scf.yield %3718 : i64
      } else {
        scf.yield %3795 : i64
      }
      %3801 = func.call @cc_errorp(%3729) : (i64) -> i64
      %3802 = arith.cmpi ne, %3801, %3785 : i64
      %3803 = arith.cmpi eq, %3800, %3785 : i64
      %3804 = arith.andi %3802, %3803 : i1
      %3805 = scf.if %3804 -> (i64) {
        scf.yield %3729 : i64
      } else {
        scf.yield %3800 : i64
      }
      %3806 = func.call @cc_errorp(%3740) : (i64) -> i64
      %3807 = arith.cmpi ne, %3806, %3785 : i64
      %3808 = arith.cmpi eq, %3805, %3785 : i64
      %3809 = arith.andi %3807, %3808 : i1
      %3810 = scf.if %3809 -> (i64) {
        scf.yield %3740 : i64
      } else {
        scf.yield %3805 : i64
      }
      %3811 = func.call @cc_errorp(%3751) : (i64) -> i64
      %3812 = arith.cmpi ne, %3811, %3785 : i64
      %3813 = arith.cmpi eq, %3810, %3785 : i64
      %3814 = arith.andi %3812, %3813 : i1
      %3815 = scf.if %3814 -> (i64) {
        scf.yield %3751 : i64
      } else {
        scf.yield %3810 : i64
      }
      %3816 = func.call @cc_errorp(%3762) : (i64) -> i64
      %3817 = arith.cmpi ne, %3816, %3785 : i64
      %3818 = arith.cmpi eq, %3815, %3785 : i64
      %3819 = arith.andi %3817, %3818 : i1
      %3820 = scf.if %3819 -> (i64) {
        scf.yield %3762 : i64
      } else {
        scf.yield %3815 : i64
      }
      %3821 = func.call @cc_errorp(%3773) : (i64) -> i64
      %3822 = arith.cmpi ne, %3821, %3785 : i64
      %3823 = arith.cmpi eq, %3820, %3785 : i64
      %3824 = arith.andi %3822, %3823 : i1
      %3825 = scf.if %3824 -> (i64) {
        scf.yield %3773 : i64
      } else {
        scf.yield %3820 : i64
      }
      %3826 = func.call @cc_errorp(%3784) : (i64) -> i64
      %3827 = arith.cmpi ne, %3826, %3785 : i64
      %3828 = arith.cmpi eq, %3825, %3785 : i64
      %3829 = arith.andi %3827, %3828 : i1
      %3830 = scf.if %3829 -> (i64) {
        scf.yield %3784 : i64
      } else {
        scf.yield %3825 : i64
      }
      %3831 = arith.cmpi ne, %3830, %3785 : i64
      scf.if %3831 {
        func.call @stack_push_pointer(%3830) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3696) : (i64) -> ()
        func.call @stack_push_pointer(%3707) : (i64) -> ()
        func.call @stack_push_pointer(%3718) : (i64) -> ()
        func.call @stack_push_pointer(%3729) : (i64) -> ()
        func.call @stack_push_pointer(%3740) : (i64) -> ()
        func.call @stack_push_pointer(%3751) : (i64) -> ()
        func.call @stack_push_pointer(%3762) : (i64) -> ()
        func.call @stack_push_pointer(%3773) : (i64) -> ()
        func.call @stack_push_pointer(%3784) : (i64) -> ()
        %3832 = llvm.mlir.addressof @str379 : !llvm.ptr
        %3833 = func.call @cc_make_function_ref_const(%3832) : (!llvm.ptr) -> i64
        %3834 = arith.constant 9 : i64
        func.call @cc_funcall_stack(%3833, %3834) : (i64, i64) -> ()
      }
      %3835 = func.call @stack_pop_pointer() : () -> i64
      %3836 = func.call @cc_nil_value() : () -> i64
      %3837 = func.call @cc_nil_value() : () -> i64
      %3838 = func.call @cc_errorp(%3836) : (i64) -> i64
      %3839 = arith.cmpi ne, %3838, %3837 : i64
      %3840 = scf.if %3839 -> (i64) {
        scf.yield %3836 : i64
      } else {
        %3841 = arith.constant 65 : i64
        func.call @stack_push_fixnum(%3841) : (i64) -> ()
        %3842 = func.call @stack_pop_pointer() : () -> i64
        %3843 = func.call @cc_unbox_fixnum(%3842) : (i64) -> i64
        %3844 = func.call @cc_box_character(%3843) : (i64) -> i64
        func.call @stack_push_pointer(%3844) : (i64) -> ()
        %3845 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3835) : (i64) -> ()
        %3846 = func.call @stack_pop_pointer() : () -> i64
        %3847 = func.call @cc_nil_value() : () -> i64
        %3848 = func.call @cc_errorp(%3845) : (i64) -> i64
        %3849 = arith.cmpi ne, %3848, %3847 : i64
        %3850 = arith.cmpi eq, %3847, %3847 : i64
        %3851 = arith.andi %3849, %3850 : i1
        %3852 = scf.if %3851 -> (i64) {
          scf.yield %3845 : i64
        } else {
          scf.yield %3847 : i64
        }
        %3853 = func.call @cc_errorp(%3846) : (i64) -> i64
        %3854 = arith.cmpi ne, %3853, %3847 : i64
        %3855 = arith.cmpi eq, %3852, %3847 : i64
        %3856 = arith.andi %3854, %3855 : i1
        %3857 = scf.if %3856 -> (i64) {
          scf.yield %3846 : i64
        } else {
          scf.yield %3852 : i64
        }
        %3858 = arith.cmpi ne, %3857, %3847 : i64
        scf.if %3858 {
          func.call @stack_push_pointer(%3857) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3845) : (i64) -> ()
          func.call @stack_push_pointer(%3846) : (i64) -> ()
          %3859 = llvm.mlir.addressof @str380 : !llvm.ptr
          %3860 = func.call @cc_make_function_ref_const(%3859) : (!llvm.ptr) -> i64
          %3861 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3860, %3861) : (i64, i64) -> ()
        }
        %3862 = func.call @stack_pop_pointer() : () -> i64
        %3863 = func.call @cc_multiple_value_list(%3862) : (i64) -> i64
        func.call @stack_push_pointer(%3835) : (i64) -> ()
        %3864 = func.call @stack_pop_pointer() : () -> i64
        %3865 = func.call @cc_nil_value() : () -> i64
        %3866 = func.call @cc_errorp(%3864) : (i64) -> i64
        %3867 = arith.cmpi ne, %3866, %3865 : i64
        %3868 = arith.cmpi eq, %3865, %3865 : i64
        %3869 = arith.andi %3867, %3868 : i1
        %3870 = scf.if %3869 -> (i64) {
          scf.yield %3864 : i64
        } else {
          scf.yield %3865 : i64
        }
        %3871 = arith.cmpi ne, %3870, %3865 : i64
        scf.if %3871 {
          func.call @stack_push_pointer(%3870) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3864) : (i64) -> ()
          %3872 = llvm.mlir.addressof @str381 : !llvm.ptr
          %3873 = func.call @cc_make_function_ref_const(%3872) : (!llvm.ptr) -> i64
          %3874 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3873, %3874) : (i64, i64) -> ()
        }
        %3875 = func.call @stack_depth() : () -> i64
        %3876 = arith.constant 0 : i64
        %3877 = arith.cmpi sgt, %3875, %3876 : i64
        scf.if %3877 {
          %3878 = func.call @stack_pop_pointer() : () -> i64
        }
        %3879 = func.call @cc_values_pack(%3863) : (i64) -> i64
        func.call @stack_push_pointer(%3879) : (i64) -> ()
        %3880 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3880 : i64
      }
      func.call @stack_push_pointer(%3840) : (i64) -> ()
      %3881 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3881 : i64
    }
    func.call @stack_push_pointer(%3692) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645771"() {
    %4089 = func.call @cc_nil_value() : () -> i64
    %4090 = func.call @cc_nil_value() : () -> i64
    %4091 = func.call @cc_errorp(%4089) : (i64) -> i64
    %4092 = arith.cmpi ne, %4091, %4090 : i64
    %4093 = scf.if %4092 -> (i64) {
      scf.yield %4089 : i64
    } else {
      %4094 = func.call @cc_nil_value() : () -> i64
      %4095 = func.call @cc_nil_value() : () -> i64
      %4096 = func.call @cc_errorp(%4094) : (i64) -> i64
      %4097 = arith.cmpi ne, %4096, %4095 : i64
      %4098 = scf.if %4097 -> (i64) {
        scf.yield %4094 : i64
      } else {
        %4099 = llvm.mlir.addressof @str402 : !llvm.ptr
        %4100 = arith.constant 42 : i64
        %4101 = func.call @cc_make_string(%4099, %4100) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%4101) : (i64) -> ()
        %4102 = func.call @stack_pop_pointer() : () -> i64
        %4103 = func.call @cc_nil_value() : () -> i64
        %4104 = func.call @cc_errorp(%4102) : (i64) -> i64
        %4105 = arith.cmpi ne, %4104, %4103 : i64
        %4106 = arith.cmpi eq, %4103, %4103 : i64
        %4107 = arith.andi %4105, %4106 : i1
        %4108 = scf.if %4107 -> (i64) {
          scf.yield %4102 : i64
        } else {
          scf.yield %4103 : i64
        }
        %4109 = arith.cmpi ne, %4108, %4103 : i64
        scf.if %4109 {
          func.call @stack_push_pointer(%4108) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4102) : (i64) -> ()
          %4110 = llvm.mlir.addressof @str403 : !llvm.ptr
          %4111 = func.call @cc_make_function_ref_const(%4110) : (!llvm.ptr) -> i64
          %4112 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4111, %4112) : (i64, i64) -> ()
        }
        %4113 = func.call @stack_pop_pointer() : () -> i64
        %4114 = llvm.mlir.addressof @str404 : !llvm.ptr
        %4115 = arith.constant 15 : i64
        %4116 = func.call @cc_make_string(%4114, %4115) : (!llvm.ptr, i64) -> i64
        %4117 = llvm.mlir.addressof @str405 : !llvm.ptr
        %4118 = arith.constant 7 : i64
        %4119 = func.call @cc_make_string(%4117, %4118) : (!llvm.ptr, i64) -> i64
        %4120 = func.call @cc_intern(%4116, %4119) : (i64, i64) -> i64
        %4121 = func.call @cc_nil_value() : () -> i64
        %4122 = func.call @cc_cons(%4120, %4121) : (i64, i64) -> i64
        %4123 = func.call @cc_values_pack(%4122) : (i64) -> i64
        func.call @stack_push_pointer(%4120) : (i64) -> ()
        %4124 = func.call @stack_pop_pointer() : () -> i64
        %4125 = llvm.mlir.addressof @str406 : !llvm.ptr
        %4126 = arith.constant 7 : i64
        %4127 = func.call @cc_make_string(%4125, %4126) : (!llvm.ptr, i64) -> i64
        %4128 = llvm.mlir.addressof @str407 : !llvm.ptr
        %4129 = arith.constant 7 : i64
        %4130 = func.call @cc_make_string(%4128, %4129) : (!llvm.ptr, i64) -> i64
        %4131 = func.call @cc_intern(%4127, %4130) : (i64, i64) -> i64
        %4132 = func.call @cc_nil_value() : () -> i64
        %4133 = func.call @cc_cons(%4131, %4132) : (i64, i64) -> i64
        %4134 = func.call @cc_values_pack(%4133) : (i64) -> i64
        func.call @stack_push_pointer(%4131) : (i64) -> ()
        %4135 = func.call @stack_pop_pointer() : () -> i64
        %4136 = func.call @cc_nil_value() : () -> i64
        %4137 = func.call @cc_cons(%4135, %4136) : (i64, i64) -> i64
        %4138 = func.call @cc_cons(%4124, %4137) : (i64, i64) -> i64
        %4139 = func.call @cc_cons(%4113, %4138) : (i64, i64) -> i64
        %4140 = func.call @cc_load_stack(%4139) : (i64) -> i64
        func.call @stack_push_pointer(%4140) : (i64) -> ()
        %4141 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4141 : i64
      }
      %4142 = func.call @cc_nil_value() : () -> i64
      %4143 = func.call @cc_errorp(%4098) : (i64) -> i64
      %4144 = arith.cmpi ne, %4143, %4142 : i64
      %4145 = scf.if %4144 -> (i64) {
        scf.yield %4098 : i64
      } else {
        %4146 = llvm.mlir.addressof @str408 : !llvm.ptr
        %4147 = arith.constant 15 : i64
        %4148 = func.call @cc_make_string(%4146, %4147) : (!llvm.ptr, i64) -> i64
        %4149 = llvm.mlir.addressof @str409 : !llvm.ptr
        %4150 = arith.constant 9 : i64
        %4151 = func.call @cc_make_string(%4149, %4150) : (!llvm.ptr, i64) -> i64
        %4152 = func.call @cc_intern(%4148, %4151) : (i64, i64) -> i64
        %4153 = func.call @cc_nil_value() : () -> i64
        %4154 = func.call @cc_cons(%4152, %4153) : (i64, i64) -> i64
        %4155 = func.call @cc_values_pack(%4154) : (i64) -> i64
        %4156 = func.call @cc_symbol_value(%4152) : (i64) -> i64
        func.call @stack_push_pointer(%4156) : (i64) -> ()
        %4157 = func.call @stack_pop_pointer() : () -> i64
        %4158 = func.call @cc_nil_value() : () -> i64
        %4159 = func.call @cc_errorp(%4157) : (i64) -> i64
        %4160 = arith.cmpi ne, %4159, %4158 : i64
        %4161 = arith.cmpi eq, %4158, %4158 : i64
        %4162 = arith.andi %4160, %4161 : i1
        %4163 = scf.if %4162 -> (i64) {
          scf.yield %4157 : i64
        } else {
          scf.yield %4158 : i64
        }
        %4164 = arith.cmpi ne, %4163, %4158 : i64
        scf.if %4164 {
          func.call @stack_push_pointer(%4163) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4157) : (i64) -> ()
          %4165 = llvm.mlir.addressof @str410 : !llvm.ptr
          %4166 = func.call @cc_make_function_ref_const(%4165) : (!llvm.ptr) -> i64
          %4167 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4166, %4167) : (i64, i64) -> ()
        }
        %4168 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4168 : i64
      }
      func.call @stack_push_pointer(%4145) : (i64) -> ()
      %4169 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4169 : i64
    }
    func.call @stack_push_pointer(%4093) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645772"() {
    %4383 = func.call @cc_nil_value() : () -> i64
    %4384 = func.call @cc_nil_value() : () -> i64
    %4385 = func.call @cc_errorp(%4383) : (i64) -> i64
    %4386 = arith.cmpi ne, %4385, %4384 : i64
    %4387 = scf.if %4386 -> (i64) {
      scf.yield %4383 : i64
    } else {
      %4388 = func.call @cc_nil_value() : () -> i64
      %4389 = func.call @cc_nil_value() : () -> i64
      %4390 = func.call @cc_errorp(%4388) : (i64) -> i64
      %4391 = arith.cmpi ne, %4390, %4389 : i64
      %4392 = scf.if %4391 -> (i64) {
        scf.yield %4388 : i64
      } else {
        %4393 = llvm.mlir.addressof @str431 : !llvm.ptr
        %4394 = arith.constant 42 : i64
        %4395 = func.call @cc_make_string(%4393, %4394) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%4395) : (i64) -> ()
        %4396 = func.call @stack_pop_pointer() : () -> i64
        %4397 = func.call @cc_nil_value() : () -> i64
        %4398 = func.call @cc_errorp(%4396) : (i64) -> i64
        %4399 = arith.cmpi ne, %4398, %4397 : i64
        %4400 = arith.cmpi eq, %4397, %4397 : i64
        %4401 = arith.andi %4399, %4400 : i1
        %4402 = scf.if %4401 -> (i64) {
          scf.yield %4396 : i64
        } else {
          scf.yield %4397 : i64
        }
        %4403 = arith.cmpi ne, %4402, %4397 : i64
        scf.if %4403 {
          func.call @stack_push_pointer(%4402) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4396) : (i64) -> ()
          %4404 = llvm.mlir.addressof @str432 : !llvm.ptr
          %4405 = func.call @cc_make_function_ref_const(%4404) : (!llvm.ptr) -> i64
          %4406 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4405, %4406) : (i64, i64) -> ()
        }
        %4407 = func.call @stack_pop_pointer() : () -> i64
        %4408 = llvm.mlir.addressof @str433 : !llvm.ptr
        %4409 = arith.constant 15 : i64
        %4410 = func.call @cc_make_string(%4408, %4409) : (!llvm.ptr, i64) -> i64
        %4411 = llvm.mlir.addressof @str434 : !llvm.ptr
        %4412 = arith.constant 7 : i64
        %4413 = func.call @cc_make_string(%4411, %4412) : (!llvm.ptr, i64) -> i64
        %4414 = func.call @cc_intern(%4410, %4413) : (i64, i64) -> i64
        %4415 = func.call @cc_nil_value() : () -> i64
        %4416 = func.call @cc_cons(%4414, %4415) : (i64, i64) -> i64
        %4417 = func.call @cc_values_pack(%4416) : (i64) -> i64
        func.call @stack_push_pointer(%4414) : (i64) -> ()
        %4418 = func.call @stack_pop_pointer() : () -> i64
        %4419 = llvm.mlir.addressof @str435 : !llvm.ptr
        %4420 = arith.constant 10 : i64
        %4421 = func.call @cc_make_string(%4419, %4420) : (!llvm.ptr, i64) -> i64
        %4422 = llvm.mlir.addressof @str436 : !llvm.ptr
        %4423 = arith.constant 7 : i64
        %4424 = func.call @cc_make_string(%4422, %4423) : (!llvm.ptr, i64) -> i64
        %4425 = func.call @cc_intern(%4421, %4424) : (i64, i64) -> i64
        %4426 = func.call @cc_nil_value() : () -> i64
        %4427 = func.call @cc_cons(%4425, %4426) : (i64, i64) -> i64
        %4428 = func.call @cc_values_pack(%4427) : (i64) -> i64
        func.call @stack_push_pointer(%4425) : (i64) -> ()
        %4429 = func.call @stack_pop_pointer() : () -> i64
        %4430 = func.call @cc_nil_value() : () -> i64
        %4431 = func.call @cc_cons(%4429, %4430) : (i64, i64) -> i64
        %4432 = func.call @cc_cons(%4418, %4431) : (i64, i64) -> i64
        %4433 = func.call @cc_cons(%4407, %4432) : (i64, i64) -> i64
        %4434 = func.call @cc_load_stack(%4433) : (i64) -> i64
        func.call @stack_push_pointer(%4434) : (i64) -> ()
        %4435 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4435 : i64
      }
      %4436 = func.call @cc_nil_value() : () -> i64
      %4437 = func.call @cc_errorp(%4392) : (i64) -> i64
      %4438 = arith.cmpi ne, %4437, %4436 : i64
      %4439 = scf.if %4438 -> (i64) {
        scf.yield %4392 : i64
      } else {
        %4440 = llvm.mlir.addressof @str437 : !llvm.ptr
        %4441 = arith.constant 15 : i64
        %4442 = func.call @cc_make_string(%4440, %4441) : (!llvm.ptr, i64) -> i64
        %4443 = llvm.mlir.addressof @str438 : !llvm.ptr
        %4444 = arith.constant 9 : i64
        %4445 = func.call @cc_make_string(%4443, %4444) : (!llvm.ptr, i64) -> i64
        %4446 = func.call @cc_intern(%4442, %4445) : (i64, i64) -> i64
        %4447 = func.call @cc_nil_value() : () -> i64
        %4448 = func.call @cc_cons(%4446, %4447) : (i64, i64) -> i64
        %4449 = func.call @cc_values_pack(%4448) : (i64) -> i64
        %4450 = func.call @cc_symbol_value(%4446) : (i64) -> i64
        func.call @stack_push_pointer(%4450) : (i64) -> ()
        %4451 = func.call @stack_pop_pointer() : () -> i64
        %4452 = func.call @cc_nil_value() : () -> i64
        %4453 = func.call @cc_errorp(%4451) : (i64) -> i64
        %4454 = arith.cmpi ne, %4453, %4452 : i64
        %4455 = arith.cmpi eq, %4452, %4452 : i64
        %4456 = arith.andi %4454, %4455 : i1
        %4457 = scf.if %4456 -> (i64) {
          scf.yield %4451 : i64
        } else {
          scf.yield %4452 : i64
        }
        %4458 = arith.cmpi ne, %4457, %4452 : i64
        scf.if %4458 {
          func.call @stack_push_pointer(%4457) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4451) : (i64) -> ()
          %4459 = llvm.mlir.addressof @str439 : !llvm.ptr
          %4460 = func.call @cc_make_function_ref_const(%4459) : (!llvm.ptr) -> i64
          %4461 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4460, %4461) : (i64, i64) -> ()
        }
        %4462 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4462 : i64
      }
      func.call @stack_push_pointer(%4439) : (i64) -> ()
      %4463 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4463 : i64
    }
    func.call @stack_push_pointer(%4387) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645773"() {
    %4794 = func.call @cc_nil_value() : () -> i64
    %4795 = func.call @cc_nil_value() : () -> i64
    %4796 = func.call @cc_errorp(%4794) : (i64) -> i64
    %4797 = arith.cmpi ne, %4796, %4795 : i64
    %4798 = scf.if %4797 -> (i64) {
      scf.yield %4794 : i64
    } else {
      %4799 = func.call @cc_nil_value() : () -> i64
      %4800 = func.call @cc_nil_value() : () -> i64
      %4801 = func.call @cc_errorp(%4799) : (i64) -> i64
      %4802 = arith.cmpi ne, %4801, %4800 : i64
      %4803 = scf.if %4802 -> (i64) {
        scf.yield %4799 : i64
      } else {
        %4804 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4804) : (i64) -> ()
        %4805 = llvm.mlir.addressof @str476 : !llvm.ptr
        %4806 = arith.constant 6 : i64
        %4807 = func.call @cc_make_string(%4805, %4806) : (!llvm.ptr, i64) -> i64
        %4808 = llvm.mlir.addressof @str477 : !llvm.ptr
        %4809 = arith.constant 7 : i64
        %4810 = func.call @cc_make_string(%4808, %4809) : (!llvm.ptr, i64) -> i64
        %4811 = func.call @cc_intern(%4807, %4810) : (i64, i64) -> i64
        %4812 = func.call @cc_nil_value() : () -> i64
        %4813 = func.call @cc_cons(%4811, %4812) : (i64, i64) -> i64
        %4814 = func.call @cc_values_pack(%4813) : (i64) -> i64
        func.call @stack_push_pointer(%4811) : (i64) -> ()
        %4815 = func.call @stack_pop_pointer() : () -> i64
        %4816 = func.call @stack_pop_pointer() : () -> i64
        %4817 = func.call @cc_cons(%4815, %4816) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4817) : (i64) -> ()
        %4818 = llvm.mlir.addressof @str478 : !llvm.ptr
        %4819 = arith.constant 9 : i64
        %4820 = func.call @cc_make_string(%4818, %4819) : (!llvm.ptr, i64) -> i64
        %4821 = llvm.mlir.addressof @str479 : !llvm.ptr
        %4822 = arith.constant 7 : i64
        %4823 = func.call @cc_make_string(%4821, %4822) : (!llvm.ptr, i64) -> i64
        %4824 = func.call @cc_intern(%4820, %4823) : (i64, i64) -> i64
        %4825 = func.call @cc_nil_value() : () -> i64
        %4826 = func.call @cc_cons(%4824, %4825) : (i64, i64) -> i64
        %4827 = func.call @cc_values_pack(%4826) : (i64) -> i64
        func.call @stack_push_pointer(%4824) : (i64) -> ()
        %4828 = func.call @stack_pop_pointer() : () -> i64
        %4829 = func.call @stack_pop_pointer() : () -> i64
        %4830 = func.call @cc_cons(%4828, %4829) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4830) : (i64) -> ()
        %4831 = llvm.mlir.addressof @str480 : !llvm.ptr
        %4832 = arith.constant 10 : i64
        %4833 = func.call @cc_make_string(%4831, %4832) : (!llvm.ptr, i64) -> i64
        %4834 = llvm.mlir.addressof @str481 : !llvm.ptr
        %4835 = arith.constant 7 : i64
        %4836 = func.call @cc_make_string(%4834, %4835) : (!llvm.ptr, i64) -> i64
        %4837 = func.call @cc_intern(%4833, %4836) : (i64, i64) -> i64
        %4838 = func.call @cc_nil_value() : () -> i64
        %4839 = func.call @cc_cons(%4837, %4838) : (i64, i64) -> i64
        %4840 = func.call @cc_values_pack(%4839) : (i64) -> i64
        func.call @stack_push_pointer(%4837) : (i64) -> ()
        %4841 = func.call @stack_pop_pointer() : () -> i64
        %4842 = func.call @stack_pop_pointer() : () -> i64
        %4843 = func.call @cc_cons(%4841, %4842) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4843) : (i64) -> ()
        %4844 = llvm.mlir.addressof @str482 : !llvm.ptr
        %4845 = arith.constant 15 : i64
        %4846 = func.call @cc_make_string(%4844, %4845) : (!llvm.ptr, i64) -> i64
        %4847 = llvm.mlir.addressof @str483 : !llvm.ptr
        %4848 = arith.constant 7 : i64
        %4849 = func.call @cc_make_string(%4847, %4848) : (!llvm.ptr, i64) -> i64
        %4850 = func.call @cc_intern(%4846, %4849) : (i64, i64) -> i64
        %4851 = func.call @cc_nil_value() : () -> i64
        %4852 = func.call @cc_cons(%4850, %4851) : (i64, i64) -> i64
        %4853 = func.call @cc_values_pack(%4852) : (i64) -> i64
        func.call @stack_push_pointer(%4850) : (i64) -> ()
        %4854 = func.call @stack_pop_pointer() : () -> i64
        %4855 = func.call @stack_pop_pointer() : () -> i64
        %4856 = func.call @cc_cons(%4854, %4855) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4856) : (i64) -> ()
        %4857 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4857) : (i64) -> ()
        %4858 = llvm.mlir.addressof @str484 : !llvm.ptr
        %4859 = arith.constant 47 : i64
        %4860 = func.call @cc_make_string(%4858, %4859) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%4860) : (i64) -> ()
        %4861 = func.call @stack_pop_pointer() : () -> i64
        %4862 = func.call @stack_pop_pointer() : () -> i64
        %4863 = func.call @cc_cons(%4861, %4862) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4863) : (i64) -> ()
        %4864 = llvm.mlir.addressof @str485 : !llvm.ptr
        %4865 = arith.constant 8 : i64
        %4866 = func.call @cc_make_string(%4864, %4865) : (!llvm.ptr, i64) -> i64
        %4867 = llvm.mlir.addressof @str486 : !llvm.ptr
        %4868 = arith.constant 11 : i64
        %4869 = func.call @cc_make_string(%4867, %4868) : (!llvm.ptr, i64) -> i64
        %4870 = func.call @cc_intern(%4866, %4869) : (i64, i64) -> i64
        %4871 = func.call @cc_nil_value() : () -> i64
        %4872 = func.call @cc_cons(%4870, %4871) : (i64, i64) -> i64
        %4873 = func.call @cc_values_pack(%4872) : (i64) -> i64
        func.call @stack_push_pointer(%4870) : (i64) -> ()
        %4874 = func.call @stack_pop_pointer() : () -> i64
        %4875 = func.call @stack_pop_pointer() : () -> i64
        %4876 = func.call @cc_cons(%4874, %4875) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4876) : (i64) -> ()
        %4877 = func.call @stack_pop_pointer() : () -> i64
        %4878 = func.call @stack_pop_pointer() : () -> i64
        %4879 = func.call @cc_cons(%4877, %4878) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4879) : (i64) -> ()
        %4880 = llvm.mlir.addressof @str487 : !llvm.ptr
        %4881 = arith.constant 12 : i64
        %4882 = func.call @cc_make_string(%4880, %4881) : (!llvm.ptr, i64) -> i64
        %4883 = func.call @cc_nil_value() : () -> i64
        %4884 = func.call @cc_intern(%4882, %4883) : (i64, i64) -> i64
        %4885 = func.call @cc_nil_value() : () -> i64
        %4886 = func.call @cc_cons(%4884, %4885) : (i64, i64) -> i64
        %4887 = func.call @cc_values_pack(%4886) : (i64) -> i64
        func.call @stack_push_pointer(%4884) : (i64) -> ()
        %4888 = func.call @stack_pop_pointer() : () -> i64
        %4889 = func.call @stack_pop_pointer() : () -> i64
        %4890 = func.call @cc_cons(%4888, %4889) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4890) : (i64) -> ()
        %4891 = func.call @stack_pop_pointer() : () -> i64
        %4892 = func.call @cc_nil_value() : () -> i64
        %4893 = func.call @cc_cons(%4891, %4892) : (i64, i64) -> i64
        %4894 = func.call @cc_eval(%4893) : (i64) -> i64
        %4895 = func.call @cc_multiple_value_list(%4894) : (i64) -> i64
        %4896 = func.call @cc_values_pack(%4895) : (i64) -> i64
        func.call @stack_push_pointer(%4896) : (i64) -> ()
        %4897 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4897 : i64
      }
      %4898 = func.call @cc_nil_value() : () -> i64
      %4899 = func.call @cc_errorp(%4803) : (i64) -> i64
      %4900 = arith.cmpi ne, %4899, %4898 : i64
      %4901 = scf.if %4900 -> (i64) {
        scf.yield %4803 : i64
      } else {
        %4902 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4902) : (i64) -> ()
        %4903 = llvm.mlir.addressof @str488 : !llvm.ptr
        %4904 = arith.constant 8 : i64
        %4905 = func.call @cc_make_string(%4903, %4904) : (!llvm.ptr, i64) -> i64
        %4906 = llvm.mlir.addressof @str489 : !llvm.ptr
        %4907 = arith.constant 7 : i64
        %4908 = func.call @cc_make_string(%4906, %4907) : (!llvm.ptr, i64) -> i64
        %4909 = func.call @cc_intern(%4905, %4908) : (i64, i64) -> i64
        %4910 = func.call @cc_nil_value() : () -> i64
        %4911 = func.call @cc_cons(%4909, %4910) : (i64, i64) -> i64
        %4912 = func.call @cc_values_pack(%4911) : (i64) -> i64
        func.call @stack_push_pointer(%4909) : (i64) -> ()
        %4913 = func.call @stack_pop_pointer() : () -> i64
        %4914 = func.call @stack_pop_pointer() : () -> i64
        %4915 = func.call @cc_cons(%4913, %4914) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4915) : (i64) -> ()
        %4916 = llvm.mlir.addressof @str490 : !llvm.ptr
        %4917 = arith.constant 9 : i64
        %4918 = func.call @cc_make_string(%4916, %4917) : (!llvm.ptr, i64) -> i64
        %4919 = llvm.mlir.addressof @str491 : !llvm.ptr
        %4920 = arith.constant 7 : i64
        %4921 = func.call @cc_make_string(%4919, %4920) : (!llvm.ptr, i64) -> i64
        %4922 = func.call @cc_intern(%4918, %4921) : (i64, i64) -> i64
        %4923 = func.call @cc_nil_value() : () -> i64
        %4924 = func.call @cc_cons(%4922, %4923) : (i64, i64) -> i64
        %4925 = func.call @cc_values_pack(%4924) : (i64) -> i64
        func.call @stack_push_pointer(%4922) : (i64) -> ()
        %4926 = func.call @stack_pop_pointer() : () -> i64
        %4927 = func.call @stack_pop_pointer() : () -> i64
        %4928 = func.call @cc_cons(%4926, %4927) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4928) : (i64) -> ()
        %4929 = llvm.mlir.addressof @str492 : !llvm.ptr
        %4930 = arith.constant 10 : i64
        %4931 = func.call @cc_make_string(%4929, %4930) : (!llvm.ptr, i64) -> i64
        %4932 = llvm.mlir.addressof @str493 : !llvm.ptr
        %4933 = arith.constant 7 : i64
        %4934 = func.call @cc_make_string(%4932, %4933) : (!llvm.ptr, i64) -> i64
        %4935 = func.call @cc_intern(%4931, %4934) : (i64, i64) -> i64
        %4936 = func.call @cc_nil_value() : () -> i64
        %4937 = func.call @cc_cons(%4935, %4936) : (i64, i64) -> i64
        %4938 = func.call @cc_values_pack(%4937) : (i64) -> i64
        func.call @stack_push_pointer(%4935) : (i64) -> ()
        %4939 = func.call @stack_pop_pointer() : () -> i64
        %4940 = func.call @stack_pop_pointer() : () -> i64
        %4941 = func.call @cc_cons(%4939, %4940) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4941) : (i64) -> ()
        %4942 = llvm.mlir.addressof @str494 : !llvm.ptr
        %4943 = arith.constant 15 : i64
        %4944 = func.call @cc_make_string(%4942, %4943) : (!llvm.ptr, i64) -> i64
        %4945 = llvm.mlir.addressof @str495 : !llvm.ptr
        %4946 = arith.constant 7 : i64
        %4947 = func.call @cc_make_string(%4945, %4946) : (!llvm.ptr, i64) -> i64
        %4948 = func.call @cc_intern(%4944, %4947) : (i64, i64) -> i64
        %4949 = func.call @cc_nil_value() : () -> i64
        %4950 = func.call @cc_cons(%4948, %4949) : (i64, i64) -> i64
        %4951 = func.call @cc_values_pack(%4950) : (i64) -> i64
        func.call @stack_push_pointer(%4948) : (i64) -> ()
        %4952 = func.call @stack_pop_pointer() : () -> i64
        %4953 = func.call @stack_pop_pointer() : () -> i64
        %4954 = func.call @cc_cons(%4952, %4953) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4954) : (i64) -> ()
        %4955 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4955) : (i64) -> ()
        %4956 = llvm.mlir.addressof @str496 : !llvm.ptr
        %4957 = arith.constant 47 : i64
        %4958 = func.call @cc_make_string(%4956, %4957) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%4958) : (i64) -> ()
        %4959 = func.call @stack_pop_pointer() : () -> i64
        %4960 = func.call @stack_pop_pointer() : () -> i64
        %4961 = func.call @cc_cons(%4959, %4960) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4961) : (i64) -> ()
        %4962 = llvm.mlir.addressof @str497 : !llvm.ptr
        %4963 = arith.constant 8 : i64
        %4964 = func.call @cc_make_string(%4962, %4963) : (!llvm.ptr, i64) -> i64
        %4965 = llvm.mlir.addressof @str498 : !llvm.ptr
        %4966 = arith.constant 11 : i64
        %4967 = func.call @cc_make_string(%4965, %4966) : (!llvm.ptr, i64) -> i64
        %4968 = func.call @cc_intern(%4964, %4967) : (i64, i64) -> i64
        %4969 = func.call @cc_nil_value() : () -> i64
        %4970 = func.call @cc_cons(%4968, %4969) : (i64, i64) -> i64
        %4971 = func.call @cc_values_pack(%4970) : (i64) -> i64
        func.call @stack_push_pointer(%4968) : (i64) -> ()
        %4972 = func.call @stack_pop_pointer() : () -> i64
        %4973 = func.call @stack_pop_pointer() : () -> i64
        %4974 = func.call @cc_cons(%4972, %4973) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4974) : (i64) -> ()
        %4975 = func.call @stack_pop_pointer() : () -> i64
        %4976 = func.call @stack_pop_pointer() : () -> i64
        %4977 = func.call @cc_cons(%4975, %4976) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4977) : (i64) -> ()
        %4978 = llvm.mlir.addressof @str499 : !llvm.ptr
        %4979 = arith.constant 12 : i64
        %4980 = func.call @cc_make_string(%4978, %4979) : (!llvm.ptr, i64) -> i64
        %4981 = func.call @cc_nil_value() : () -> i64
        %4982 = func.call @cc_intern(%4980, %4981) : (i64, i64) -> i64
        %4983 = func.call @cc_nil_value() : () -> i64
        %4984 = func.call @cc_cons(%4982, %4983) : (i64, i64) -> i64
        %4985 = func.call @cc_values_pack(%4984) : (i64) -> i64
        func.call @stack_push_pointer(%4982) : (i64) -> ()
        %4986 = func.call @stack_pop_pointer() : () -> i64
        %4987 = func.call @stack_pop_pointer() : () -> i64
        %4988 = func.call @cc_cons(%4986, %4987) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4988) : (i64) -> ()
        %4989 = func.call @stack_pop_pointer() : () -> i64
        %4990 = func.call @cc_nil_value() : () -> i64
        %4991 = func.call @cc_cons(%4989, %4990) : (i64, i64) -> i64
        %4992 = func.call @cc_eval(%4991) : (i64) -> i64
        %4993 = func.call @cc_multiple_value_list(%4992) : (i64) -> i64
        %4994 = func.call @cc_values_pack(%4993) : (i64) -> i64
        func.call @stack_push_pointer(%4994) : (i64) -> ()
        %4995 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4995 : i64
      }
      func.call @stack_push_pointer(%4901) : (i64) -> ()
      %4996 = func.call @stack_pop_pointer() : () -> i64
      %4997 = func.call @cc_nil_value() : () -> i64
      %4998 = func.call @cc_cons(%4996, %4997) : (i64, i64) -> i64
      %4999 = func.call @cc_not(%4998) : (i64) -> i64
      func.call @stack_push_pointer(%4999) : (i64) -> ()
      %5000 = func.call @stack_pop_pointer() : () -> i64
      %5001 = func.call @cc_nil_value() : () -> i64
      %5002 = func.call @cc_cons(%5000, %5001) : (i64, i64) -> i64
      %5003 = func.call @cc_not(%5002) : (i64) -> i64
      func.call @stack_push_pointer(%5003) : (i64) -> ()
      %5004 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5004 : i64
    }
    func.call @stack_push_pointer(%4798) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_57937766645774"() {
    %5221 = func.call @cc_nil_value() : () -> i64
    %5222 = func.call @cc_nil_value() : () -> i64
    %5223 = func.call @cc_errorp(%5221) : (i64) -> i64
    %5224 = arith.cmpi ne, %5223, %5222 : i64
    %5225 = scf.if %5224 -> (i64) {
      scf.yield %5221 : i64
    } else {
      %5226 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5227 = func.call @cc_nil_value() : () -> i64
      %5228 = func.call @cc_nil_value() : () -> i64
      %5229 = func.call @cc_errorp(%5227) : (i64) -> i64
      %5230 = arith.cmpi ne, %5229, %5228 : i64
      %5231 = scf.if %5230 -> (i64) {
        scf.yield %5227 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5232 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5232) : (i64) -> ()
        %5233 = llvm.mlir.addressof @str521 : !llvm.ptr
        %5234 = arith.constant 8 : i64
        %5235 = func.call @cc_make_string(%5233, %5234) : (!llvm.ptr, i64) -> i64
        %5236 = llvm.mlir.addressof @str522 : !llvm.ptr
        %5237 = arith.constant 7 : i64
        %5238 = func.call @cc_make_string(%5236, %5237) : (!llvm.ptr, i64) -> i64
        %5239 = func.call @cc_intern(%5235, %5238) : (i64, i64) -> i64
        %5240 = func.call @cc_nil_value() : () -> i64
        %5241 = func.call @cc_cons(%5239, %5240) : (i64, i64) -> i64
        %5242 = func.call @cc_values_pack(%5241) : (i64) -> i64
        func.call @stack_push_pointer(%5239) : (i64) -> ()
        %5243 = func.call @stack_pop_pointer() : () -> i64
        %5244 = func.call @stack_pop_pointer() : () -> i64
        %5245 = func.call @cc_cons(%5243, %5244) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5245) : (i64) -> ()
        %5246 = llvm.mlir.addressof @str523 : !llvm.ptr
        %5247 = arith.constant 15 : i64
        %5248 = func.call @cc_make_string(%5246, %5247) : (!llvm.ptr, i64) -> i64
        %5249 = llvm.mlir.addressof @str524 : !llvm.ptr
        %5250 = arith.constant 7 : i64
        %5251 = func.call @cc_make_string(%5249, %5250) : (!llvm.ptr, i64) -> i64
        %5252 = func.call @cc_intern(%5248, %5251) : (i64, i64) -> i64
        %5253 = func.call @cc_nil_value() : () -> i64
        %5254 = func.call @cc_cons(%5252, %5253) : (i64, i64) -> i64
        %5255 = func.call @cc_values_pack(%5254) : (i64) -> i64
        func.call @stack_push_pointer(%5252) : (i64) -> ()
        %5256 = func.call @stack_pop_pointer() : () -> i64
        %5257 = func.call @stack_pop_pointer() : () -> i64
        %5258 = func.call @cc_cons(%5256, %5257) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5258) : (i64) -> ()
        %5259 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5259) : (i64) -> ()
        %5260 = llvm.mlir.addressof @str525 : !llvm.ptr
        %5261 = arith.constant 47 : i64
        %5262 = func.call @cc_make_string(%5260, %5261) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%5262) : (i64) -> ()
        %5263 = func.call @stack_pop_pointer() : () -> i64
        %5264 = func.call @stack_pop_pointer() : () -> i64
        %5265 = func.call @cc_cons(%5263, %5264) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5265) : (i64) -> ()
        %5266 = llvm.mlir.addressof @str526 : !llvm.ptr
        %5267 = arith.constant 8 : i64
        %5268 = func.call @cc_make_string(%5266, %5267) : (!llvm.ptr, i64) -> i64
        %5269 = llvm.mlir.addressof @str527 : !llvm.ptr
        %5270 = arith.constant 11 : i64
        %5271 = func.call @cc_make_string(%5269, %5270) : (!llvm.ptr, i64) -> i64
        %5272 = func.call @cc_intern(%5268, %5271) : (i64, i64) -> i64
        %5273 = func.call @cc_nil_value() : () -> i64
        %5274 = func.call @cc_cons(%5272, %5273) : (i64, i64) -> i64
        %5275 = func.call @cc_values_pack(%5274) : (i64) -> i64
        func.call @stack_push_pointer(%5272) : (i64) -> ()
        %5276 = func.call @stack_pop_pointer() : () -> i64
        %5277 = func.call @stack_pop_pointer() : () -> i64
        %5278 = func.call @cc_cons(%5276, %5277) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5278) : (i64) -> ()
        %5279 = func.call @stack_pop_pointer() : () -> i64
        %5280 = func.call @stack_pop_pointer() : () -> i64
        %5281 = func.call @cc_cons(%5279, %5280) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5281) : (i64) -> ()
        %5282 = llvm.mlir.addressof @str528 : !llvm.ptr
        %5283 = arith.constant 12 : i64
        %5284 = func.call @cc_make_string(%5282, %5283) : (!llvm.ptr, i64) -> i64
        %5285 = func.call @cc_nil_value() : () -> i64
        %5286 = func.call @cc_intern(%5284, %5285) : (i64, i64) -> i64
        %5287 = func.call @cc_nil_value() : () -> i64
        %5288 = func.call @cc_cons(%5286, %5287) : (i64, i64) -> i64
        %5289 = func.call @cc_values_pack(%5288) : (i64) -> i64
        func.call @stack_push_pointer(%5286) : (i64) -> ()
        %5290 = func.call @stack_pop_pointer() : () -> i64
        %5291 = func.call @stack_pop_pointer() : () -> i64
        %5292 = func.call @cc_cons(%5290, %5291) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5292) : (i64) -> ()
        %5293 = func.call @stack_pop_pointer() : () -> i64
        %5294 = func.call @cc_nil_value() : () -> i64
        %5295 = func.call @cc_cons(%5293, %5294) : (i64, i64) -> i64
        %5296 = func.call @cc_eval(%5295) : (i64) -> i64
        %5297 = func.call @cc_multiple_value_list(%5296) : (i64) -> i64
        %5298 = func.call @cc_values_pack(%5297) : (i64) -> i64
        func.call @stack_push_pointer(%5298) : (i64) -> ()
        %5299 = func.call @stack_pop_pointer() : () -> i64
        %5300 = func.call @cc_errorp(%5299) : (i64) -> i64
        %5301 = func.call @cc_nil_value() : () -> i64
        %5302 = arith.cmpi ne, %5300, %5301 : i64
        scf.if %5302 {
          func.call @stack_push_pointer(%5299) : (i64) -> ()
        } else {
          %5303 = func.call @cc_multiple_value_list(%5299) : (i64) -> i64
          func.call @stack_push_pointer(%5303) : (i64) -> ()
        }
        %5304 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5305 = func.call @stack_pop_pointer() : () -> i64
        %5306 = func.call @cc_nil_value() : () -> i64
        %5307 = func.call @cc_maybe_error_from_multiple_value_list(%5304) : (i64) -> i64
        %5308 = func.call @cc_errorp(%5307) : (i64) -> i64
        %5309 = arith.cmpi ne, %5308, %5306 : i64
        %5310 = arith.cmpi eq, %5306, %5306 : i64
        %5311 = arith.andi %5309, %5310 : i1
        %5312 = scf.if %5311 -> (i64) {
          scf.yield %5307 : i64
        } else {
          scf.yield %5306 : i64
        }
        %5313 = arith.cmpi ne, %5312, %5306 : i64
        scf.if %5313 {
          func.call @stack_push_pointer(%5312) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5314 = func.call @stack_pop_pointer() : () -> i64
          %5315 = func.call @cc_cons(%5305, %5314) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5315) : (i64) -> ()
          %5316 = func.call @stack_pop_pointer() : () -> i64
          %5317 = func.call @cc_cons(%5304, %5316) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5317) : (i64) -> ()
          %5318 = func.call @stack_pop_pointer() : () -> i64
          %5319 = func.call @cc_values_pack(%5318) : (i64) -> i64
          func.call @stack_push_pointer(%5319) : (i64) -> ()
        }
        %5320 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5320 : i64
      }
      func.call @stack_push_pointer(%5231) : (i64) -> ()
      %5321 = func.call @stack_pop_pointer() : () -> i64
      %5322 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5323 = func.call @cc_errorp(%5321) : (i64) -> i64
      %5324 = func.call @cc_nil_value() : () -> i64
      %5325 = arith.cmpi ne, %5323, %5324 : i64
      scf.if %5325 {
        %5326 = func.call @cc_condition_value(%5321) : (i64) -> i64
        %5327 = func.call @cc_values2(%5324, %5326) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5327) : (i64) -> ()
      } else {
        %5328 = func.call @cc_multiple_value_list(%5321) : (i64) -> i64
        %5329 = func.call @cc_values_pack(%5328) : (i64) -> i64
        func.call @stack_push_pointer(%5329) : (i64) -> ()
      }
      %5330 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5330 : i64
    }
    func.call @stack_push_pointer(%5225) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str1("s\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_57937766645760*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_57937766645760*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_57937766645760*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_57937766645761*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_57937766645761*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_57937766645761*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETFLAG_57937766645762*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETVALUE_57937766645762*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETMVLIST_57937766645762*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETFLAG_57937766645760*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETFLAG_57937766645761*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_57937766645762*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETFLAG_57937766645762*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETVALUE_57937766645762*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETMVLIST_57937766645762*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETFLAG_57937766645761*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETVALUE_57937766645761*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETMVLIST_57937766645761*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETFLAG_57937766645760*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_57937766645760*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str22("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETFLAG_57937766645763*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETVALUE_57937766645763*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETMVLIST_57937766645763*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str26("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str28("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str29("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str30("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str33("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str34("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str35("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str36("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str37("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str44("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str45("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str46("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str47("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str48("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str49("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str50("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str51("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str52("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str53("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str54("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str55("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str56("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str57("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str58("ENCODING-DEFAULT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str59("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str60("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str61("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str63("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str64("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str65("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str66("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str67("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str68("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str69("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str70("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str71("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str72("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str73("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str75("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str78("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str79("ENCODING-UTF-8\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str80("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str81("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str83("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str86("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str87("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str88("UTF-8\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str89("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str90("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str91("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str92("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str93("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str94("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str95("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str96("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str97("UTF-8\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str98("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str100("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str101("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str102("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str104("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str105("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str106("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str107("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str108("ENCODING-LATIN-1\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str109("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str110("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str113("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str115("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("LATIN-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str118("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str119("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str120("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str121("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str122("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str123("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str124("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str125("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str126("LATIN-1\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str127("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str128("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str129("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str130("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str131("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str133("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str134("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str135("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str136("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str137("ENCODING-ISO-8859-1\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str138("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str139("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str140("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str142("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str143("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str144("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str145("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str146("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str147("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str148("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str149("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str150("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str151("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str152("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str153("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str154("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str155("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str156("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str157("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str158("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str159("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str160("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str162("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str163("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str164("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str165("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str166("ENCODING-ASCII-ERROR\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str167("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str168("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str170("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str171("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str172("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str173("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str174("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str176("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str177("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str178("US-ASCII\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str179("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str180("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str181("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str182("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str183("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str184("US-ASCII\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str185("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str186("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("STREAM-DECODING-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str188("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str189("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str190("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str192("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str193("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str194("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str195("ENCODING-ALL-ENCODINGS-PLAIN\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str196("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str197("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str200("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str201("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str202("sys:src;lisp;regression-tests;encoding-test.txt\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str203("BAD\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str204("UNWIND-PROTECT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str205("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str206("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str207("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str208("ALL-ENCODINGS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str209("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str210("BAD\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str211("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str212("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str213("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str214("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str216("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str217("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str218("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str219("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str220("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str221("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str222("OVERWRITE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str223("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str224("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str225("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str226("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str227("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str228("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str229("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str230("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str231("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str232("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str234("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str235("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str237("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str238("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str239("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str240("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str241("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str242("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str243("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str244("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str245("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str246("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str247("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str248("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str249("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str250("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str251("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str252("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str255("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str257("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str258("MEMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str259("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str260("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str261("UCS-2\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str262("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str263("UCS-4\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str264("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str265("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str266("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str267("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str268("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str269("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str270("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str271("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str272("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str273("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str274("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str275("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str276("PUSH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str277("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str278("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str279("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str280("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str281("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str282("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str283("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str284("ENCODING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str285("BAD\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str286("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str287("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str288("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str290("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str291("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str292("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str293("FILENAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str294("sys:src;lisp;regression-tests;encoding-test.txt\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str295("ext:all-encodings\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str296("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str297("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str298("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str299("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str300("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str301("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str302("OVERWRITE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str303("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str304("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str305("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str306("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str307("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str308("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str309("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str310("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str311("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str312("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str313("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str314("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str315("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str316("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str317("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str318("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str319("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str320("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str321("UCS-2\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str322("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str323("UCS-4\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str324("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str325("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str326("PROBE-FILE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str327("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str329("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str330("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str331("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str332("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str333("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str334("ENCODING-LATIN-2-PLAIN\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str335("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str336("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str338("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str339("sys:src;lisp;regression-tests;latin-2-file.txt\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str340("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str341("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str342("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str343("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str344("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str345("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str346("OVERWRITE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str347("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str348("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str349("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str350("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str351("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str352("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str353("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str354("LATIN-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str355("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str356("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str357("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str358("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str359("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str360("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str361("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str362("sys:src;lisp;regression-tests;latin-2-file.txt\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str363("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str364("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str365("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str366("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str367("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str368("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str369("OVERWRITE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str370("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str371("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str372("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str373("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str374("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str375("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str376("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str377("LATIN-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str378("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str379("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str380("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str381("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str382("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str383("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str384("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str385("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str386("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str387("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str388("ENCODING-LATIN-2-LAMBDA\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str389("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str390("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str391("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str392("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str393("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str394("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str395("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str396("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str397("LATIN-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str398("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str399("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str400("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str401("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str402("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str403("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str404("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str405("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str406("LATIN-2\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str407("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str408("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str409("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str410("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str411("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str412("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str413("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str414("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str415("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str416("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str417("ENCODING-ISO-8859-2-LAMBDA\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str418("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str419("LOAD\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str420("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str421("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str422("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str423("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str424("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str425("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str426("ISO-8859-2\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str427("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str428("%STRING-CHAR-CODES\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str429("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str430("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str431("sys:src;lisp;modules;asdf;test;lambda.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str432("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str433("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str434("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str435("ISO-8859-2\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str436("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str437("*LAMBDA-STRING*\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str438("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str439("%FN%%string-char-codes\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str440("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str441("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str442("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str443("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str444("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str445("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str446("COMPILE-FILE-WITH-LAMBDA\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str447("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str448("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str449("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str450("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str451("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str452("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str453("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str454("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str455("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str456("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str457("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str458("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str459("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str460("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str461("SERIAL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str462("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str463("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str464("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str465("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str466("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str467("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str468("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str469("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str470("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str471("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str472("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str473("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str474("PARALLEL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str475("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str476("SERIAL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str477("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str478("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str479("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str480("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str481("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str482("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str483("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str484("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str485("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str486("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str487("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str488("PARALLEL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str489("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str490("EXECUTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str491("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str492("ISO-8859-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str493("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str494("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str495("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str496("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str497("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str498("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str499("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str500("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str501("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str502("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str503("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str504("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str505("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str506("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str507("COMPILE-FILE-WITH-LAMBDA-DEFAULT-ENCODING\00") : !llvm.array<42 x i8>
  llvm.mlir.global private constant @str508("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str509("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str510("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str511("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str512("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str513("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str514("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str515("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str516("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str517("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str518("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str519("US-ASCII\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str520("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str521("US-ASCII\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str522("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str523("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str524("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str525("sys:src;lisp;regression-tests;latin2-check.lisp\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str526("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str527("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str528("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str529("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str530("STREAM-DECODING-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str531("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str532("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str533("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str534("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str535("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str536("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str537("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str538("ASDF-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str539("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str540("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str541("delete-package\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str542("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str543("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str544("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str545("delete-package\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str546("*__MLIR_BLOCK_RETFLAG_57937766645763*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str547("*__MLIR_BLOCK_RETMVLIST_57937766645763*\00") : !llvm.array<40 x i8>
}
