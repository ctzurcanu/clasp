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
  func.func @"%FN%CLASP-TESTS::MESSAGE"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 7 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = llvm.mlir.addressof @str1 : !llvm.ptr
    %4 = arith.constant 11 : i64
    %5 = func.call @cc_make_string(%3, %4) : (!llvm.ptr, i64) -> i64
    %6 = func.call @cc_intern(%2, %5) : (i64, i64) -> i64
    %7 = func.call @cc_nil_value() : () -> i64
    %8 = func.call @cc_cons(%6, %7) : (i64, i64) -> i64
    %9 = func.call @cc_values_pack(%8) : (i64) -> i64
    %10 = llvm.mlir.addressof @str2 : !llvm.ptr
    %11 = arith.constant 25 : i64
    %12 = func.call @cc_make_string(%10, %11) : (!llvm.ptr, i64) -> i64
    %13 = func.call @cc_register_function_lambda_list_metadata_raw(%6, %12) : (i64, i64) -> i64
    %14 = arith.constant 3 : i64
    func.call @cc_runtime_debug_stack_push_call(%6, %14) : (i64, i64) -> ()
    %15 = func.call @stack_pop_pointer() : () -> i64
    %16 = arith.constant 0 : i64
    %17 = func.call @cc_arg(%15, %16) : (i64, i64) -> i64
    %18 = arith.constant 4 : i64
    %19 = func.call @cc_arg(%15, %18) : (i64, i64) -> i64
    %20 = arith.constant 2 : i64
    %21 = func.call @cc_box_fixnum(%20) : (i64) -> i64
    %22 = func.call @cc_collect_rest_args(%15, %21) : (i64, i64) -> i64
    %23 = func.call @cc_nil_value() : () -> i64
    %24 = llvm.mlir.addressof @str3 : !llvm.ptr
    %25 = arith.constant 37 : i64
    %26 = func.call @cc_make_string(%24, %25) : (!llvm.ptr, i64) -> i64
    %27 = func.call @cc_nil_value() : () -> i64
    %28 = func.call @cc_intern(%26, %27) : (i64, i64) -> i64
    %29 = func.call @cc_nil_value() : () -> i64
    %30 = func.call @cc_cons(%28, %29) : (i64, i64) -> i64
    %31 = func.call @cc_values_pack(%30) : (i64) -> i64
    %32 = func.call @cc_set_symbol_value(%28, %23) : (i64, i64) -> i64
    %33 = llvm.mlir.addressof @str4 : !llvm.ptr
    %34 = arith.constant 38 : i64
    %35 = func.call @cc_make_string(%33, %34) : (!llvm.ptr, i64) -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_intern(%35, %36) : (i64, i64) -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_cons(%37, %38) : (i64, i64) -> i64
    %40 = func.call @cc_values_pack(%39) : (i64) -> i64
    %41 = func.call @cc_set_symbol_value(%37, %23) : (i64, i64) -> i64
    %42 = llvm.mlir.addressof @str5 : !llvm.ptr
    %43 = arith.constant 39 : i64
    %44 = func.call @cc_make_string(%42, %43) : (!llvm.ptr, i64) -> i64
    %45 = func.call @cc_nil_value() : () -> i64
    %46 = func.call @cc_intern(%44, %45) : (i64, i64) -> i64
    %47 = func.call @cc_nil_value() : () -> i64
    %48 = func.call @cc_cons(%46, %47) : (i64, i64) -> i64
    %49 = func.call @cc_values_pack(%48) : (i64) -> i64
    %50 = func.call @cc_set_symbol_value(%46, %23) : (i64, i64) -> i64
    %51 = func.call @cc_nil_value() : () -> i64
    %52 = llvm.mlir.addressof @str6 : !llvm.ptr
    %53 = arith.constant 37 : i64
    %54 = func.call @cc_make_string(%52, %53) : (!llvm.ptr, i64) -> i64
    %55 = func.call @cc_nil_value() : () -> i64
    %56 = func.call @cc_intern(%54, %55) : (i64, i64) -> i64
    %57 = func.call @cc_nil_value() : () -> i64
    %58 = func.call @cc_cons(%56, %57) : (i64, i64) -> i64
    %59 = func.call @cc_values_pack(%58) : (i64) -> i64
    %60 = func.call @cc_set_symbol_value(%56, %51) : (i64, i64) -> i64
    %61 = llvm.mlir.addressof @str7 : !llvm.ptr
    %62 = arith.constant 38 : i64
    %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
    %64 = func.call @cc_nil_value() : () -> i64
    %65 = func.call @cc_intern(%63, %64) : (i64, i64) -> i64
    %66 = func.call @cc_nil_value() : () -> i64
    %67 = func.call @cc_cons(%65, %66) : (i64, i64) -> i64
    %68 = func.call @cc_values_pack(%67) : (i64) -> i64
    %69 = func.call @cc_set_symbol_value(%65, %51) : (i64, i64) -> i64
    %70 = llvm.mlir.addressof @str8 : !llvm.ptr
    %71 = arith.constant 39 : i64
    %72 = func.call @cc_make_string(%70, %71) : (!llvm.ptr, i64) -> i64
    %73 = func.call @cc_nil_value() : () -> i64
    %74 = func.call @cc_intern(%72, %73) : (i64, i64) -> i64
    %75 = func.call @cc_nil_value() : () -> i64
    %76 = func.call @cc_cons(%74, %75) : (i64, i64) -> i64
    %77 = func.call @cc_values_pack(%76) : (i64) -> i64
    %78 = func.call @cc_set_symbol_value(%74, %51) : (i64, i64) -> i64
    %79 = llvm.mlir.addressof @str9 : !llvm.ptr
    %80 = arith.constant 97 : i64
    %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%81) : (i64) -> ()
    %82 = func.call @stack_pop_pointer() : () -> i64
    %83 = llvm.mlir.addressof @str10 : !llvm.ptr
    %84 = arith.constant 17 : i64
    %85 = func.call @cc_make_string(%83, %84) : (!llvm.ptr, i64) -> i64
    %86 = llvm.mlir.addressof @str11 : !llvm.ptr
    %87 = arith.constant 11 : i64
    %88 = func.call @cc_make_string(%86, %87) : (!llvm.ptr, i64) -> i64
    %89 = func.call @cc_intern(%85, %88) : (i64, i64) -> i64
    %90 = func.call @cc_nil_value() : () -> i64
    %91 = func.call @cc_cons(%89, %90) : (i64, i64) -> i64
    %92 = func.call @cc_values_pack(%91) : (i64) -> i64
    %93 = func.call @cc_symbol_value(%89) : (i64) -> i64
    func.call @stack_push_pointer(%93) : (i64) -> ()
    %94 = func.call @stack_pop_pointer() : () -> i64
    %95 = func.call @cc_nil_value() : () -> i64
    %96 = func.call @cc_errorp(%94) : (i64) -> i64
    %97 = arith.cmpi ne, %96, %95 : i64
    %98 = arith.cmpi eq, %95, %95 : i64
    %99 = arith.andi %97, %98 : i1
    %100 = scf.if %99 -> (i64) {
      scf.yield %94 : i64
    } else {
      scf.yield %95 : i64
    }
    %101 = arith.cmpi ne, %100, %95 : i64
    scf.if %101 {
      func.call @stack_push_pointer(%100) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %102 = llvm.mlir.addressof @str12 : !llvm.ptr
      %103 = func.call @cc_make_function_ref_const(%102) : (!llvm.ptr) -> i64
      %104 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%103, %104) : (i64, i64) -> ()
    }
    %105 = func.call @stack_pop_pointer() : () -> i64
    %106 = llvm.mlir.addressof @str13 : !llvm.ptr
    %107 = arith.constant 17 : i64
    %108 = func.call @cc_make_string(%106, %107) : (!llvm.ptr, i64) -> i64
    %109 = llvm.mlir.addressof @str14 : !llvm.ptr
    %110 = arith.constant 11 : i64
    %111 = func.call @cc_make_string(%109, %110) : (!llvm.ptr, i64) -> i64
    %112 = func.call @cc_intern(%108, %111) : (i64, i64) -> i64
    %113 = func.call @cc_nil_value() : () -> i64
    %114 = func.call @cc_cons(%112, %113) : (i64, i64) -> i64
    %115 = func.call @cc_values_pack(%114) : (i64) -> i64
    %116 = func.call @cc_symbol_value(%112) : (i64) -> i64
    func.call @stack_push_pointer(%116) : (i64) -> ()
    %117 = func.call @stack_pop_pointer() : () -> i64
    %118 = func.call @cc_nil_value() : () -> i64
    %119 = func.call @cc_errorp(%117) : (i64) -> i64
    %120 = arith.cmpi ne, %119, %118 : i64
    %121 = arith.cmpi eq, %118, %118 : i64
    %122 = arith.andi %120, %121 : i1
    %123 = scf.if %122 -> (i64) {
      scf.yield %117 : i64
    } else {
      scf.yield %118 : i64
    }
    %124 = arith.cmpi ne, %123, %118 : i64
    scf.if %124 {
      func.call @stack_push_pointer(%123) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%117) : (i64) -> ()
      %125 = llvm.mlir.addressof @str15 : !llvm.ptr
      %126 = func.call @cc_make_function_ref_const(%125) : (!llvm.ptr) -> i64
      %127 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%126, %127) : (i64, i64) -> ()
    }
    %128 = func.call @stack_pop_pointer() : () -> i64
    %129 = func.call @cc_nil_value() : () -> i64
    %130 = arith.cmpi ne, %128, %129 : i64
    scf.if %130 {
      %131 = func.call @cc_nil_value() : () -> i64
      %132 = func.call @cc_nil_value() : () -> i64
      %133 = func.call @cc_errorp(%131) : (i64) -> i64
      %134 = arith.cmpi ne, %133, %132 : i64
      %135 = scf.if %134 -> (i64) {
        scf.yield %131 : i64
      } else {
        %136 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%136) : (i64) -> ()
        %137 = func.call @stack_pop_pointer() : () -> i64
        %138 = llvm.mlir.addressof @str16 : !llvm.ptr
        %139 = arith.constant 6 : i64
        %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%140) : (i64) -> ()
        %141 = func.call @stack_pop_pointer() : () -> i64
        %142 = arith.constant 27 : i64
        %143 = func.call @cc_box_character(%142) : (i64) -> i64
        func.call @stack_push_pointer(%143) : (i64) -> ()
        %144 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%17) : (i64) -> ()
        %145 = func.call @stack_pop_pointer() : () -> i64
        %146 = func.call @cc_nil_value() : () -> i64
        %147 = func.call @cc_nil_value() : () -> i64
        %148 = func.call @cc_errorp(%146) : (i64) -> i64
        %149 = arith.cmpi ne, %148, %147 : i64
        %150 = scf.if %149 -> (i64) {
          scf.yield %146 : i64
        } else {
          func.call @stack_push_pointer(%145) : (i64) -> ()
          %151 = llvm.mlir.addressof @str17 : !llvm.ptr
          %152 = arith.constant 3 : i64
          %153 = func.call @cc_make_string(%151, %152) : (!llvm.ptr, i64) -> i64
          %154 = llvm.mlir.addressof @str18 : !llvm.ptr
          %155 = arith.constant 7 : i64
          %156 = func.call @cc_make_string(%154, %155) : (!llvm.ptr, i64) -> i64
          %157 = func.call @cc_intern(%153, %156) : (i64, i64) -> i64
          %158 = func.call @cc_nil_value() : () -> i64
          %159 = func.call @cc_cons(%157, %158) : (i64, i64) -> i64
          %160 = func.call @cc_values_pack(%159) : (i64) -> i64
          func.call @stack_push_pointer(%157) : (i64) -> ()
          %161 = func.call @stack_pop_pointer() : () -> i64
          %162 = func.call @stack_pop_pointer() : () -> i64
          %163 = func.call @cc_eq(%162, %161) : (i64, i64) -> i64
          func.call @stack_push_pointer(%163) : (i64) -> ()
          %164 = func.call @stack_pop_pointer() : () -> i64
          %165 = func.call @cc_nil_value() : () -> i64
          %166 = arith.cmpi ne, %164, %165 : i64
          scf.if %166 {
            %167 = arith.constant 31 : i64
            func.call @stack_push_fixnum(%167) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%145) : (i64) -> ()
            %168 = llvm.mlir.addressof @str19 : !llvm.ptr
            %169 = arith.constant 4 : i64
            %170 = func.call @cc_make_string(%168, %169) : (!llvm.ptr, i64) -> i64
            %171 = llvm.mlir.addressof @str20 : !llvm.ptr
            %172 = arith.constant 7 : i64
            %173 = func.call @cc_make_string(%171, %172) : (!llvm.ptr, i64) -> i64
            %174 = func.call @cc_intern(%170, %173) : (i64, i64) -> i64
            %175 = func.call @cc_nil_value() : () -> i64
            %176 = func.call @cc_cons(%174, %175) : (i64, i64) -> i64
            %177 = func.call @cc_values_pack(%176) : (i64) -> i64
            func.call @stack_push_pointer(%174) : (i64) -> ()
            %178 = func.call @stack_pop_pointer() : () -> i64
            %179 = func.call @stack_pop_pointer() : () -> i64
            %180 = func.call @cc_eq(%179, %178) : (i64, i64) -> i64
            func.call @stack_push_pointer(%180) : (i64) -> ()
            %181 = func.call @stack_pop_pointer() : () -> i64
            %182 = func.call @cc_nil_value() : () -> i64
            %183 = arith.cmpi ne, %181, %182 : i64
            scf.if %183 {
              %184 = arith.constant 33 : i64
              func.call @stack_push_fixnum(%184) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%145) : (i64) -> ()
              %185 = llvm.mlir.addressof @str21 : !llvm.ptr
              %186 = arith.constant 4 : i64
              %187 = func.call @cc_make_string(%185, %186) : (!llvm.ptr, i64) -> i64
              %188 = llvm.mlir.addressof @str22 : !llvm.ptr
              %189 = arith.constant 7 : i64
              %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
              %191 = func.call @cc_intern(%187, %190) : (i64, i64) -> i64
              %192 = func.call @cc_nil_value() : () -> i64
              %193 = func.call @cc_cons(%191, %192) : (i64, i64) -> i64
              %194 = func.call @cc_values_pack(%193) : (i64) -> i64
              func.call @stack_push_pointer(%191) : (i64) -> ()
              %195 = func.call @stack_pop_pointer() : () -> i64
              %196 = func.call @stack_pop_pointer() : () -> i64
              %197 = func.call @cc_eq(%196, %195) : (i64, i64) -> i64
              func.call @stack_push_pointer(%197) : (i64) -> ()
              %198 = func.call @stack_pop_pointer() : () -> i64
              %199 = func.call @cc_nil_value() : () -> i64
              %200 = arith.cmpi ne, %198, %199 : i64
              scf.if %200 {
                %201 = arith.constant 32 : i64
                func.call @stack_push_fixnum(%201) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%145) : (i64) -> ()
                %202 = llvm.mlir.addressof @str23 : !llvm.ptr
                %203 = arith.constant 9 : i64
                %204 = func.call @cc_make_string(%202, %203) : (!llvm.ptr, i64) -> i64
                %205 = llvm.mlir.addressof @str24 : !llvm.ptr
                %206 = arith.constant 11 : i64
                %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
                %208 = func.call @cc_intern(%204, %207) : (i64, i64) -> i64
                %209 = func.call @cc_nil_value() : () -> i64
                %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
                %211 = func.call @cc_values_pack(%210) : (i64) -> i64
                func.call @stack_push_pointer(%208) : (i64) -> ()
                %212 = func.call @stack_pop_pointer() : () -> i64
                %213 = func.call @stack_pop_pointer() : () -> i64
                %214 = func.call @cc_eq(%213, %212) : (i64, i64) -> i64
                func.call @stack_push_pointer(%214) : (i64) -> ()
                %215 = func.call @stack_pop_pointer() : () -> i64
                %216 = func.call @cc_nil_value() : () -> i64
                %217 = arith.cmpi ne, %215, %216 : i64
                scf.if %217 {
                  %218 = arith.constant 0 : i64
                  func.call @stack_push_fixnum(%218) : (i64) -> ()
              }
            }
          }
          }
          %219 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %219 : i64
        }
        func.call @stack_push_pointer(%150) : (i64) -> ()
        %220 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%137) : (i64) -> ()
        func.call @stack_push_pointer(%141) : (i64) -> ()
        func.call @stack_push_pointer(%144) : (i64) -> ()
        func.call @stack_push_pointer(%220) : (i64) -> ()
        %221 = llvm.mlir.addressof @str25 : !llvm.ptr
        %222 = func.call @cc_make_function_ref_const(%221) : (!llvm.ptr) -> i64
        %223 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%222, %223) : (i64, i64) -> ()
        %224 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %224 : i64
      }
      func.call @stack_push_pointer(%135) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %225 = func.call @stack_pop_pointer() : () -> i64
    %226 = llvm.mlir.addressof @str26 : !llvm.ptr
    %227 = func.call @cc_make_function_ref_const(%226) : (!llvm.ptr) -> i64
    func.call @stack_push_pointer(%227) : (i64) -> ()
    %228 = func.call @stack_pop_pointer() : () -> i64
    %229 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%229) : (i64) -> ()
    func.call @stack_push_pointer(%19) : (i64) -> ()
    func.call @stack_push_pointer(%22) : (i64) -> ()
    %230 = func.call @stack_pop_pointer() : () -> i64
    %231 = func.call @stack_pop_pointer() : () -> i64
    %232 = func.call @cc_cons(%231, %230) : (i64, i64) -> i64
    %233 = func.call @stack_pop_pointer() : () -> i64
    %234 = func.call @cc_cons(%233, %232) : (i64, i64) -> i64
    %235 = func.call @cc_apply(%228, %234) : (i64, i64) -> i64
    func.call @stack_push_pointer(%235) : (i64) -> ()
    %236 = func.call @stack_pop_pointer() : () -> i64
    %237 = llvm.mlir.addressof @str27 : !llvm.ptr
    %238 = arith.constant 17 : i64
    %239 = func.call @cc_make_string(%237, %238) : (!llvm.ptr, i64) -> i64
    %240 = llvm.mlir.addressof @str28 : !llvm.ptr
    %241 = arith.constant 11 : i64
    %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
    %243 = func.call @cc_intern(%239, %242) : (i64, i64) -> i64
    %244 = func.call @cc_nil_value() : () -> i64
    %245 = func.call @cc_cons(%243, %244) : (i64, i64) -> i64
    %246 = func.call @cc_values_pack(%245) : (i64) -> i64
    %247 = func.call @cc_symbol_value(%243) : (i64) -> i64
    func.call @stack_push_pointer(%247) : (i64) -> ()
    %248 = func.call @stack_pop_pointer() : () -> i64
    %249 = func.call @cc_nil_value() : () -> i64
    %250 = func.call @cc_errorp(%248) : (i64) -> i64
    %251 = arith.cmpi ne, %250, %249 : i64
    %252 = arith.cmpi eq, %249, %249 : i64
    %253 = arith.andi %251, %252 : i1
    %254 = scf.if %253 -> (i64) {
      scf.yield %248 : i64
    } else {
      scf.yield %249 : i64
    }
    %255 = arith.cmpi ne, %254, %249 : i64
    scf.if %255 {
      func.call @stack_push_pointer(%254) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%248) : (i64) -> ()
      %256 = llvm.mlir.addressof @str29 : !llvm.ptr
      %257 = func.call @cc_make_function_ref_const(%256) : (!llvm.ptr) -> i64
      %258 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%257, %258) : (i64, i64) -> ()
    }
    %259 = func.call @stack_pop_pointer() : () -> i64
    %260 = func.call @cc_nil_value() : () -> i64
    %261 = arith.cmpi ne, %259, %260 : i64
    scf.if %261 {
      %262 = func.call @cc_nil_value() : () -> i64
      %263 = func.call @cc_nil_value() : () -> i64
      %264 = func.call @cc_errorp(%262) : (i64) -> i64
      %265 = arith.cmpi ne, %264, %263 : i64
      %266 = scf.if %265 -> (i64) {
        scf.yield %262 : i64
      } else {
        %267 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%267) : (i64) -> ()
        %268 = func.call @stack_pop_pointer() : () -> i64
        %269 = llvm.mlir.addressof @str30 : !llvm.ptr
        %270 = arith.constant 5 : i64
        %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%271) : (i64) -> ()
        %272 = func.call @stack_pop_pointer() : () -> i64
        %273 = arith.constant 27 : i64
        %274 = func.call @cc_box_character(%273) : (i64) -> i64
        func.call @stack_push_pointer(%274) : (i64) -> ()
        %275 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%268) : (i64) -> ()
        func.call @stack_push_pointer(%272) : (i64) -> ()
        func.call @stack_push_pointer(%275) : (i64) -> ()
        %276 = llvm.mlir.addressof @str31 : !llvm.ptr
        %277 = func.call @cc_make_function_ref_const(%276) : (!llvm.ptr) -> i64
        %278 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%277, %278) : (i64, i64) -> ()
        %279 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %279 : i64
      }
      func.call @stack_push_pointer(%266) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %280 = func.call @stack_pop_pointer() : () -> i64
    %281 = llvm.mlir.addressof @str32 : !llvm.ptr
    %282 = arith.constant 17 : i64
    %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
    %284 = llvm.mlir.addressof @str33 : !llvm.ptr
    %285 = arith.constant 11 : i64
    %286 = func.call @cc_make_string(%284, %285) : (!llvm.ptr, i64) -> i64
    %287 = func.call @cc_intern(%283, %286) : (i64, i64) -> i64
    %288 = func.call @cc_nil_value() : () -> i64
    %289 = func.call @cc_cons(%287, %288) : (i64, i64) -> i64
    %290 = func.call @cc_values_pack(%289) : (i64) -> i64
    %291 = func.call @cc_symbol_value(%287) : (i64) -> i64
    func.call @stack_push_pointer(%291) : (i64) -> ()
    %292 = func.call @stack_pop_pointer() : () -> i64
    %293 = func.call @cc_nil_value() : () -> i64
    %294 = func.call @cc_errorp(%292) : (i64) -> i64
    %295 = arith.cmpi ne, %294, %293 : i64
    %296 = arith.cmpi eq, %293, %293 : i64
    %297 = arith.andi %295, %296 : i1
    %298 = scf.if %297 -> (i64) {
      scf.yield %292 : i64
    } else {
      scf.yield %293 : i64
    }
    %299 = arith.cmpi ne, %298, %293 : i64
    scf.if %299 {
      func.call @stack_push_pointer(%298) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%292) : (i64) -> ()
      %300 = llvm.mlir.addressof @str34 : !llvm.ptr
      %301 = func.call @cc_make_function_ref_const(%300) : (!llvm.ptr) -> i64
      %302 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%301, %302) : (i64, i64) -> ()
    }
    %303 = func.call @stack_pop_pointer() : () -> i64
    %304 = func.call @cc_multiple_value_list(%303) : (i64) -> i64
    %305 = llvm.mlir.addressof @str35 : !llvm.ptr
    %306 = arith.constant 37 : i64
    %307 = func.call @cc_make_string(%305, %306) : (!llvm.ptr, i64) -> i64
    %308 = func.call @cc_nil_value() : () -> i64
    %309 = func.call @cc_intern(%307, %308) : (i64, i64) -> i64
    %310 = func.call @cc_nil_value() : () -> i64
    %311 = func.call @cc_cons(%309, %310) : (i64, i64) -> i64
    %312 = func.call @cc_values_pack(%311) : (i64) -> i64
    %313 = func.call @cc_symbol_value(%309) : (i64) -> i64
    %314 = llvm.mlir.addressof @str36 : !llvm.ptr
    %315 = arith.constant 38 : i64
    %316 = func.call @cc_make_string(%314, %315) : (!llvm.ptr, i64) -> i64
    %317 = func.call @cc_nil_value() : () -> i64
    %318 = func.call @cc_intern(%316, %317) : (i64, i64) -> i64
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = func.call @cc_cons(%318, %319) : (i64, i64) -> i64
    %321 = func.call @cc_values_pack(%320) : (i64) -> i64
    %322 = func.call @cc_symbol_value(%318) : (i64) -> i64
    %323 = llvm.mlir.addressof @str37 : !llvm.ptr
    %324 = arith.constant 39 : i64
    %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
    %326 = func.call @cc_nil_value() : () -> i64
    %327 = func.call @cc_intern(%325, %326) : (i64, i64) -> i64
    %328 = func.call @cc_nil_value() : () -> i64
    %329 = func.call @cc_cons(%327, %328) : (i64, i64) -> i64
    %330 = func.call @cc_values_pack(%329) : (i64) -> i64
    %331 = func.call @cc_symbol_value(%327) : (i64) -> i64
    %332 = func.call @cc_nil_value() : () -> i64
    %333 = arith.cmpi ne, %313, %332 : i64
    %334 = scf.if %333 -> (i64) {
      scf.yield %331 : i64
    } else {
      scf.yield %304 : i64
    }
    %335 = func.call @cc_values_pack(%334) : (i64) -> i64
    func.call @stack_push_pointer(%335) : (i64) -> ()
    %336 = func.call @stack_pop_pointer() : () -> i64
    %337 = func.call @cc_multiple_value_list(%336) : (i64) -> i64
    %338 = llvm.mlir.addressof @str38 : !llvm.ptr
    %339 = arith.constant 37 : i64
    %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
    %341 = func.call @cc_nil_value() : () -> i64
    %342 = func.call @cc_intern(%340, %341) : (i64, i64) -> i64
    %343 = func.call @cc_nil_value() : () -> i64
    %344 = func.call @cc_cons(%342, %343) : (i64, i64) -> i64
    %345 = func.call @cc_values_pack(%344) : (i64) -> i64
    %346 = func.call @cc_symbol_value(%342) : (i64) -> i64
    %347 = llvm.mlir.addressof @str39 : !llvm.ptr
    %348 = arith.constant 39 : i64
    %349 = func.call @cc_make_string(%347, %348) : (!llvm.ptr, i64) -> i64
    %350 = func.call @cc_nil_value() : () -> i64
    %351 = func.call @cc_intern(%349, %350) : (i64, i64) -> i64
    %352 = func.call @cc_nil_value() : () -> i64
    %353 = func.call @cc_cons(%351, %352) : (i64, i64) -> i64
    %354 = func.call @cc_values_pack(%353) : (i64) -> i64
    %355 = func.call @cc_symbol_value(%351) : (i64) -> i64
    %356 = func.call @cc_nil_value() : () -> i64
    %357 = arith.cmpi ne, %346, %356 : i64
    %358 = scf.if %357 -> (i64) {
      scf.yield %355 : i64
    } else {
      scf.yield %337 : i64
    }
    %359 = func.call @cc_values_pack(%358) : (i64) -> i64
    func.call @stack_push_pointer(%359) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::RESET-CLASP-TESTS"() {
    %360 = llvm.mlir.addressof @str40 : !llvm.ptr
    %361 = arith.constant 17 : i64
    %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
    %363 = llvm.mlir.addressof @str41 : !llvm.ptr
    %364 = arith.constant 11 : i64
    %365 = func.call @cc_make_string(%363, %364) : (!llvm.ptr, i64) -> i64
    %366 = func.call @cc_intern(%362, %365) : (i64, i64) -> i64
    %367 = func.call @cc_nil_value() : () -> i64
    %368 = func.call @cc_cons(%366, %367) : (i64, i64) -> i64
    %369 = func.call @cc_values_pack(%368) : (i64) -> i64
    %370 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%366, %370) : (i64, i64) -> ()
    %371 = func.call @cc_nil_value() : () -> i64
    %372 = llvm.mlir.addressof @str42 : !llvm.ptr
    %373 = arith.constant 37 : i64
    %374 = func.call @cc_make_string(%372, %373) : (!llvm.ptr, i64) -> i64
    %375 = func.call @cc_nil_value() : () -> i64
    %376 = func.call @cc_intern(%374, %375) : (i64, i64) -> i64
    %377 = func.call @cc_nil_value() : () -> i64
    %378 = func.call @cc_cons(%376, %377) : (i64, i64) -> i64
    %379 = func.call @cc_values_pack(%378) : (i64) -> i64
    %380 = func.call @cc_set_symbol_value(%376, %371) : (i64, i64) -> i64
    %381 = llvm.mlir.addressof @str43 : !llvm.ptr
    %382 = arith.constant 38 : i64
    %383 = func.call @cc_make_string(%381, %382) : (!llvm.ptr, i64) -> i64
    %384 = func.call @cc_nil_value() : () -> i64
    %385 = func.call @cc_intern(%383, %384) : (i64, i64) -> i64
    %386 = func.call @cc_nil_value() : () -> i64
    %387 = func.call @cc_cons(%385, %386) : (i64, i64) -> i64
    %388 = func.call @cc_values_pack(%387) : (i64) -> i64
    %389 = func.call @cc_set_symbol_value(%385, %371) : (i64, i64) -> i64
    %390 = llvm.mlir.addressof @str44 : !llvm.ptr
    %391 = arith.constant 39 : i64
    %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
    %393 = func.call @cc_nil_value() : () -> i64
    %394 = func.call @cc_intern(%392, %393) : (i64, i64) -> i64
    %395 = func.call @cc_nil_value() : () -> i64
    %396 = func.call @cc_cons(%394, %395) : (i64, i64) -> i64
    %397 = func.call @cc_values_pack(%396) : (i64) -> i64
    %398 = func.call @cc_set_symbol_value(%394, %371) : (i64, i64) -> i64
    %399 = func.call @cc_nil_value() : () -> i64
    %400 = llvm.mlir.addressof @str45 : !llvm.ptr
    %401 = arith.constant 37 : i64
    %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
    %403 = func.call @cc_nil_value() : () -> i64
    %404 = func.call @cc_intern(%402, %403) : (i64, i64) -> i64
    %405 = func.call @cc_nil_value() : () -> i64
    %406 = func.call @cc_cons(%404, %405) : (i64, i64) -> i64
    %407 = func.call @cc_values_pack(%406) : (i64) -> i64
    %408 = func.call @cc_set_symbol_value(%404, %399) : (i64, i64) -> i64
    %409 = llvm.mlir.addressof @str46 : !llvm.ptr
    %410 = arith.constant 38 : i64
    %411 = func.call @cc_make_string(%409, %410) : (!llvm.ptr, i64) -> i64
    %412 = func.call @cc_nil_value() : () -> i64
    %413 = func.call @cc_intern(%411, %412) : (i64, i64) -> i64
    %414 = func.call @cc_nil_value() : () -> i64
    %415 = func.call @cc_cons(%413, %414) : (i64, i64) -> i64
    %416 = func.call @cc_values_pack(%415) : (i64) -> i64
    %417 = func.call @cc_set_symbol_value(%413, %399) : (i64, i64) -> i64
    %418 = llvm.mlir.addressof @str47 : !llvm.ptr
    %419 = arith.constant 39 : i64
    %420 = func.call @cc_make_string(%418, %419) : (!llvm.ptr, i64) -> i64
    %421 = func.call @cc_nil_value() : () -> i64
    %422 = func.call @cc_intern(%420, %421) : (i64, i64) -> i64
    %423 = func.call @cc_nil_value() : () -> i64
    %424 = func.call @cc_cons(%422, %423) : (i64, i64) -> i64
    %425 = func.call @cc_values_pack(%424) : (i64) -> i64
    %426 = func.call @cc_set_symbol_value(%422, %399) : (i64, i64) -> i64
    %427 = func.call @cc_nil_value() : () -> i64
    %428 = func.call @cc_nil_value() : () -> i64
    %429 = func.call @cc_errorp(%427) : (i64) -> i64
    %430 = arith.cmpi ne, %429, %428 : i64
    %431 = scf.if %430 -> (i64) {
      scf.yield %427 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = llvm.mlir.addressof @str48 : !llvm.ptr
      %434 = arith.constant 23 : i64
      %435 = func.call @cc_make_string(%433, %434) : (!llvm.ptr, i64) -> i64
      %436 = llvm.mlir.addressof @str49 : !llvm.ptr
      %437 = arith.constant 11 : i64
      %438 = func.call @cc_make_string(%436, %437) : (!llvm.ptr, i64) -> i64
      %439 = func.call @cc_intern(%435, %438) : (i64, i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = func.call @cc_cons(%439, %440) : (i64, i64) -> i64
      %442 = func.call @cc_values_pack(%441) : (i64) -> i64
      %443 = func.call @cc_set_symbol_value(%439, %432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%432) : (i64) -> ()
      %444 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %444 : i64
    }
    %445 = func.call @cc_nil_value() : () -> i64
    %446 = func.call @cc_errorp(%431) : (i64) -> i64
    %447 = arith.cmpi ne, %446, %445 : i64
    %448 = scf.if %447 -> (i64) {
      scf.yield %431 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %449 = func.call @stack_pop_pointer() : () -> i64
      %450 = llvm.mlir.addressof @str50 : !llvm.ptr
      %451 = arith.constant 25 : i64
      %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
      %453 = llvm.mlir.addressof @str51 : !llvm.ptr
      %454 = arith.constant 11 : i64
      %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
      %456 = func.call @cc_intern(%452, %455) : (i64, i64) -> i64
      %457 = func.call @cc_nil_value() : () -> i64
      %458 = func.call @cc_cons(%456, %457) : (i64, i64) -> i64
      %459 = func.call @cc_values_pack(%458) : (i64) -> i64
      %460 = func.call @cc_set_symbol_value(%456, %449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%449) : (i64) -> ()
      %461 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %461 : i64
    }
    %462 = func.call @cc_nil_value() : () -> i64
    %463 = func.call @cc_errorp(%448) : (i64) -> i64
    %464 = arith.cmpi ne, %463, %462 : i64
    %465 = scf.if %464 -> (i64) {
      scf.yield %448 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %466 = func.call @stack_pop_pointer() : () -> i64
      %467 = llvm.mlir.addressof @str52 : !llvm.ptr
      %468 = arith.constant 23 : i64
      %469 = func.call @cc_make_string(%467, %468) : (!llvm.ptr, i64) -> i64
      %470 = llvm.mlir.addressof @str53 : !llvm.ptr
      %471 = arith.constant 11 : i64
      %472 = func.call @cc_make_string(%470, %471) : (!llvm.ptr, i64) -> i64
      %473 = func.call @cc_intern(%469, %472) : (i64, i64) -> i64
      %474 = func.call @cc_nil_value() : () -> i64
      %475 = func.call @cc_cons(%473, %474) : (i64, i64) -> i64
      %476 = func.call @cc_values_pack(%475) : (i64) -> i64
      %477 = func.call @cc_set_symbol_value(%473, %466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%466) : (i64) -> ()
      %478 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %478 : i64
    }
    %479 = func.call @cc_nil_value() : () -> i64
    %480 = func.call @cc_errorp(%465) : (i64) -> i64
    %481 = arith.cmpi ne, %480, %479 : i64
    %482 = scf.if %481 -> (i64) {
      scf.yield %465 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %483 = func.call @stack_pop_pointer() : () -> i64
      %484 = llvm.mlir.addressof @str54 : !llvm.ptr
      %485 = arith.constant 25 : i64
      %486 = func.call @cc_make_string(%484, %485) : (!llvm.ptr, i64) -> i64
      %487 = llvm.mlir.addressof @str55 : !llvm.ptr
      %488 = arith.constant 11 : i64
      %489 = func.call @cc_make_string(%487, %488) : (!llvm.ptr, i64) -> i64
      %490 = func.call @cc_intern(%486, %489) : (i64, i64) -> i64
      %491 = func.call @cc_nil_value() : () -> i64
      %492 = func.call @cc_cons(%490, %491) : (i64, i64) -> i64
      %493 = func.call @cc_values_pack(%492) : (i64) -> i64
      %494 = func.call @cc_set_symbol_value(%490, %483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%483) : (i64) -> ()
      %495 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %495 : i64
    }
    %496 = func.call @cc_nil_value() : () -> i64
    %497 = func.call @cc_errorp(%482) : (i64) -> i64
    %498 = arith.cmpi ne, %497, %496 : i64
    %499 = scf.if %498 -> (i64) {
      scf.yield %482 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %500 = func.call @stack_pop_pointer() : () -> i64
      %501 = llvm.mlir.addressof @str56 : !llvm.ptr
      %502 = arith.constant 25 : i64
      %503 = func.call @cc_make_string(%501, %502) : (!llvm.ptr, i64) -> i64
      %504 = llvm.mlir.addressof @str57 : !llvm.ptr
      %505 = arith.constant 11 : i64
      %506 = func.call @cc_make_string(%504, %505) : (!llvm.ptr, i64) -> i64
      %507 = func.call @cc_intern(%503, %506) : (i64, i64) -> i64
      %508 = func.call @cc_nil_value() : () -> i64
      %509 = func.call @cc_cons(%507, %508) : (i64, i64) -> i64
      %510 = func.call @cc_values_pack(%509) : (i64) -> i64
      %511 = func.call @cc_set_symbol_value(%507, %500) : (i64, i64) -> i64
      func.call @stack_push_pointer(%500) : (i64) -> ()
      %512 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %512 : i64
    }
    %513 = func.call @cc_nil_value() : () -> i64
    %514 = func.call @cc_errorp(%499) : (i64) -> i64
    %515 = arith.cmpi ne, %514, %513 : i64
    %516 = scf.if %515 -> (i64) {
      scf.yield %499 : i64
    } else {
      %517 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%517) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %518 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%518) : (i64) -> ()
      %519 = func.call @stack_pop_pointer() : () -> i64
      %520 = llvm.mlir.addressof @str58 : !llvm.ptr
      %521 = arith.constant 19 : i64
      %522 = func.call @cc_make_string(%520, %521) : (!llvm.ptr, i64) -> i64
      %523 = llvm.mlir.addressof @str59 : !llvm.ptr
      %524 = arith.constant 11 : i64
      %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
      %526 = func.call @cc_intern(%522, %525) : (i64, i64) -> i64
      %527 = func.call @cc_nil_value() : () -> i64
      %528 = func.call @cc_cons(%526, %527) : (i64, i64) -> i64
      %529 = func.call @cc_values_pack(%528) : (i64) -> i64
      %530 = func.call @cc_set_symbol_value(%526, %519) : (i64, i64) -> i64
      func.call @stack_push_pointer(%519) : (i64) -> ()
      %531 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %531 : i64
    }
    %532 = func.call @cc_nil_value() : () -> i64
    %533 = func.call @cc_errorp(%516) : (i64) -> i64
    %534 = arith.cmpi ne, %533, %532 : i64
    %535 = scf.if %534 -> (i64) {
      scf.yield %516 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %536 = func.call @stack_pop_pointer() : () -> i64
      %537 = llvm.mlir.addressof @str60 : !llvm.ptr
      %538 = arith.constant 17 : i64
      %539 = func.call @cc_make_string(%537, %538) : (!llvm.ptr, i64) -> i64
      %540 = llvm.mlir.addressof @str61 : !llvm.ptr
      %541 = arith.constant 11 : i64
      %542 = func.call @cc_make_string(%540, %541) : (!llvm.ptr, i64) -> i64
      %543 = func.call @cc_intern(%539, %542) : (i64, i64) -> i64
      %544 = func.call @cc_nil_value() : () -> i64
      %545 = func.call @cc_cons(%543, %544) : (i64, i64) -> i64
      %546 = func.call @cc_values_pack(%545) : (i64) -> i64
      %547 = func.call @cc_set_symbol_value(%543, %536) : (i64, i64) -> i64
      func.call @stack_push_pointer(%536) : (i64) -> ()
      %548 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %548 : i64
    }
    func.call @stack_push_pointer(%535) : (i64) -> ()
    %549 = func.call @stack_pop_pointer() : () -> i64
    %550 = func.call @cc_multiple_value_list(%549) : (i64) -> i64
    %551 = llvm.mlir.addressof @str62 : !llvm.ptr
    %552 = arith.constant 37 : i64
    %553 = func.call @cc_make_string(%551, %552) : (!llvm.ptr, i64) -> i64
    %554 = func.call @cc_nil_value() : () -> i64
    %555 = func.call @cc_intern(%553, %554) : (i64, i64) -> i64
    %556 = func.call @cc_nil_value() : () -> i64
    %557 = func.call @cc_cons(%555, %556) : (i64, i64) -> i64
    %558 = func.call @cc_values_pack(%557) : (i64) -> i64
    %559 = func.call @cc_symbol_value(%555) : (i64) -> i64
    %560 = llvm.mlir.addressof @str63 : !llvm.ptr
    %561 = arith.constant 38 : i64
    %562 = func.call @cc_make_string(%560, %561) : (!llvm.ptr, i64) -> i64
    %563 = func.call @cc_nil_value() : () -> i64
    %564 = func.call @cc_intern(%562, %563) : (i64, i64) -> i64
    %565 = func.call @cc_nil_value() : () -> i64
    %566 = func.call @cc_cons(%564, %565) : (i64, i64) -> i64
    %567 = func.call @cc_values_pack(%566) : (i64) -> i64
    %568 = func.call @cc_symbol_value(%564) : (i64) -> i64
    %569 = llvm.mlir.addressof @str64 : !llvm.ptr
    %570 = arith.constant 39 : i64
    %571 = func.call @cc_make_string(%569, %570) : (!llvm.ptr, i64) -> i64
    %572 = func.call @cc_nil_value() : () -> i64
    %573 = func.call @cc_intern(%571, %572) : (i64, i64) -> i64
    %574 = func.call @cc_nil_value() : () -> i64
    %575 = func.call @cc_cons(%573, %574) : (i64, i64) -> i64
    %576 = func.call @cc_values_pack(%575) : (i64) -> i64
    %577 = func.call @cc_symbol_value(%573) : (i64) -> i64
    %578 = func.call @cc_nil_value() : () -> i64
    %579 = arith.cmpi ne, %559, %578 : i64
    %580 = scf.if %579 -> (i64) {
      scf.yield %577 : i64
    } else {
      scf.yield %550 : i64
    }
    %581 = func.call @cc_values_pack(%580) : (i64) -> i64
    func.call @stack_push_pointer(%581) : (i64) -> ()
    %582 = func.call @stack_pop_pointer() : () -> i64
    %583 = func.call @cc_multiple_value_list(%582) : (i64) -> i64
    %584 = llvm.mlir.addressof @str65 : !llvm.ptr
    %585 = arith.constant 37 : i64
    %586 = func.call @cc_make_string(%584, %585) : (!llvm.ptr, i64) -> i64
    %587 = func.call @cc_nil_value() : () -> i64
    %588 = func.call @cc_intern(%586, %587) : (i64, i64) -> i64
    %589 = func.call @cc_nil_value() : () -> i64
    %590 = func.call @cc_cons(%588, %589) : (i64, i64) -> i64
    %591 = func.call @cc_values_pack(%590) : (i64) -> i64
    %592 = func.call @cc_symbol_value(%588) : (i64) -> i64
    %593 = llvm.mlir.addressof @str66 : !llvm.ptr
    %594 = arith.constant 39 : i64
    %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
    %596 = func.call @cc_nil_value() : () -> i64
    %597 = func.call @cc_intern(%595, %596) : (i64, i64) -> i64
    %598 = func.call @cc_nil_value() : () -> i64
    %599 = func.call @cc_cons(%597, %598) : (i64, i64) -> i64
    %600 = func.call @cc_values_pack(%599) : (i64) -> i64
    %601 = func.call @cc_symbol_value(%597) : (i64) -> i64
    %602 = func.call @cc_nil_value() : () -> i64
    %603 = arith.cmpi ne, %592, %602 : i64
    %604 = scf.if %603 -> (i64) {
      scf.yield %601 : i64
    } else {
      scf.yield %583 : i64
    }
    %605 = func.call @cc_values_pack(%604) : (i64) -> i64
    func.call @stack_push_pointer(%605) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::NOTE-COMPILE-ERROR"() {
    %606 = llvm.mlir.addressof @str67 : !llvm.ptr
    %607 = arith.constant 18 : i64
    %608 = func.call @cc_make_string(%606, %607) : (!llvm.ptr, i64) -> i64
    %609 = llvm.mlir.addressof @str68 : !llvm.ptr
    %610 = arith.constant 11 : i64
    %611 = func.call @cc_make_string(%609, %610) : (!llvm.ptr, i64) -> i64
    %612 = func.call @cc_intern(%608, %611) : (i64, i64) -> i64
    %613 = func.call @cc_nil_value() : () -> i64
    %614 = func.call @cc_cons(%612, %613) : (i64, i64) -> i64
    %615 = func.call @cc_values_pack(%614) : (i64) -> i64
    %616 = llvm.mlir.addressof @str69 : !llvm.ptr
    %617 = arith.constant 10 : i64
    %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
    %619 = func.call @cc_register_function_lambda_list_metadata_raw(%612, %618) : (i64, i64) -> i64
    %620 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%612, %620) : (i64, i64) -> ()
    %621 = func.call @stack_pop_pointer() : () -> i64
    %622 = func.call @cc_nil_value() : () -> i64
    %623 = llvm.mlir.addressof @str70 : !llvm.ptr
    %624 = arith.constant 37 : i64
    %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
    %626 = func.call @cc_nil_value() : () -> i64
    %627 = func.call @cc_intern(%625, %626) : (i64, i64) -> i64
    %628 = func.call @cc_nil_value() : () -> i64
    %629 = func.call @cc_cons(%627, %628) : (i64, i64) -> i64
    %630 = func.call @cc_values_pack(%629) : (i64) -> i64
    %631 = func.call @cc_set_symbol_value(%627, %622) : (i64, i64) -> i64
    %632 = llvm.mlir.addressof @str71 : !llvm.ptr
    %633 = arith.constant 38 : i64
    %634 = func.call @cc_make_string(%632, %633) : (!llvm.ptr, i64) -> i64
    %635 = func.call @cc_nil_value() : () -> i64
    %636 = func.call @cc_intern(%634, %635) : (i64, i64) -> i64
    %637 = func.call @cc_nil_value() : () -> i64
    %638 = func.call @cc_cons(%636, %637) : (i64, i64) -> i64
    %639 = func.call @cc_values_pack(%638) : (i64) -> i64
    %640 = func.call @cc_set_symbol_value(%636, %622) : (i64, i64) -> i64
    %641 = llvm.mlir.addressof @str72 : !llvm.ptr
    %642 = arith.constant 39 : i64
    %643 = func.call @cc_make_string(%641, %642) : (!llvm.ptr, i64) -> i64
    %644 = func.call @cc_nil_value() : () -> i64
    %645 = func.call @cc_intern(%643, %644) : (i64, i64) -> i64
    %646 = func.call @cc_nil_value() : () -> i64
    %647 = func.call @cc_cons(%645, %646) : (i64, i64) -> i64
    %648 = func.call @cc_values_pack(%647) : (i64) -> i64
    %649 = func.call @cc_set_symbol_value(%645, %622) : (i64, i64) -> i64
    %650 = func.call @cc_nil_value() : () -> i64
    %651 = llvm.mlir.addressof @str73 : !llvm.ptr
    %652 = arith.constant 37 : i64
    %653 = func.call @cc_make_string(%651, %652) : (!llvm.ptr, i64) -> i64
    %654 = func.call @cc_nil_value() : () -> i64
    %655 = func.call @cc_intern(%653, %654) : (i64, i64) -> i64
    %656 = func.call @cc_nil_value() : () -> i64
    %657 = func.call @cc_cons(%655, %656) : (i64, i64) -> i64
    %658 = func.call @cc_values_pack(%657) : (i64) -> i64
    %659 = func.call @cc_set_symbol_value(%655, %650) : (i64, i64) -> i64
    %660 = llvm.mlir.addressof @str74 : !llvm.ptr
    %661 = arith.constant 38 : i64
    %662 = func.call @cc_make_string(%660, %661) : (!llvm.ptr, i64) -> i64
    %663 = func.call @cc_nil_value() : () -> i64
    %664 = func.call @cc_intern(%662, %663) : (i64, i64) -> i64
    %665 = func.call @cc_nil_value() : () -> i64
    %666 = func.call @cc_cons(%664, %665) : (i64, i64) -> i64
    %667 = func.call @cc_values_pack(%666) : (i64) -> i64
    %668 = func.call @cc_set_symbol_value(%664, %650) : (i64, i64) -> i64
    %669 = llvm.mlir.addressof @str75 : !llvm.ptr
    %670 = arith.constant 39 : i64
    %671 = func.call @cc_make_string(%669, %670) : (!llvm.ptr, i64) -> i64
    %672 = func.call @cc_nil_value() : () -> i64
    %673 = func.call @cc_intern(%671, %672) : (i64, i64) -> i64
    %674 = func.call @cc_nil_value() : () -> i64
    %675 = func.call @cc_cons(%673, %674) : (i64, i64) -> i64
    %676 = func.call @cc_values_pack(%675) : (i64) -> i64
    %677 = func.call @cc_set_symbol_value(%673, %650) : (i64, i64) -> i64
    func.call @stack_push_pointer(%621) : (i64) -> ()
    %678 = func.call @stack_pop_pointer() : () -> i64
    %679 = llvm.mlir.addressof @str76 : !llvm.ptr
    %680 = arith.constant 25 : i64
    %681 = func.call @cc_make_string(%679, %680) : (!llvm.ptr, i64) -> i64
    %682 = llvm.mlir.addressof @str77 : !llvm.ptr
    %683 = arith.constant 11 : i64
    %684 = func.call @cc_make_string(%682, %683) : (!llvm.ptr, i64) -> i64
    %685 = func.call @cc_intern(%681, %684) : (i64, i64) -> i64
    %686 = func.call @cc_nil_value() : () -> i64
    %687 = func.call @cc_cons(%685, %686) : (i64, i64) -> i64
    %688 = func.call @cc_values_pack(%687) : (i64) -> i64
    %689 = func.call @cc_symbol_value(%685) : (i64) -> i64
    %690 = func.call @cc_cons(%678, %689) : (i64, i64) -> i64
    %691 = llvm.mlir.addressof @str78 : !llvm.ptr
    %692 = arith.constant 25 : i64
    %693 = func.call @cc_make_string(%691, %692) : (!llvm.ptr, i64) -> i64
    %694 = llvm.mlir.addressof @str79 : !llvm.ptr
    %695 = arith.constant 11 : i64
    %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
    %697 = func.call @cc_intern(%693, %696) : (i64, i64) -> i64
    %698 = func.call @cc_nil_value() : () -> i64
    %699 = func.call @cc_cons(%697, %698) : (i64, i64) -> i64
    %700 = func.call @cc_values_pack(%699) : (i64) -> i64
    %701 = func.call @cc_set_symbol_value(%697, %690) : (i64, i64) -> i64
    func.call @stack_push_pointer(%690) : (i64) -> ()
    %702 = func.call @stack_pop_pointer() : () -> i64
    %703 = func.call @cc_multiple_value_list(%702) : (i64) -> i64
    %704 = llvm.mlir.addressof @str80 : !llvm.ptr
    %705 = arith.constant 37 : i64
    %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
    %707 = func.call @cc_nil_value() : () -> i64
    %708 = func.call @cc_intern(%706, %707) : (i64, i64) -> i64
    %709 = func.call @cc_nil_value() : () -> i64
    %710 = func.call @cc_cons(%708, %709) : (i64, i64) -> i64
    %711 = func.call @cc_values_pack(%710) : (i64) -> i64
    %712 = func.call @cc_symbol_value(%708) : (i64) -> i64
    %713 = llvm.mlir.addressof @str81 : !llvm.ptr
    %714 = arith.constant 38 : i64
    %715 = func.call @cc_make_string(%713, %714) : (!llvm.ptr, i64) -> i64
    %716 = func.call @cc_nil_value() : () -> i64
    %717 = func.call @cc_intern(%715, %716) : (i64, i64) -> i64
    %718 = func.call @cc_nil_value() : () -> i64
    %719 = func.call @cc_cons(%717, %718) : (i64, i64) -> i64
    %720 = func.call @cc_values_pack(%719) : (i64) -> i64
    %721 = func.call @cc_symbol_value(%717) : (i64) -> i64
    %722 = llvm.mlir.addressof @str82 : !llvm.ptr
    %723 = arith.constant 39 : i64
    %724 = func.call @cc_make_string(%722, %723) : (!llvm.ptr, i64) -> i64
    %725 = func.call @cc_nil_value() : () -> i64
    %726 = func.call @cc_intern(%724, %725) : (i64, i64) -> i64
    %727 = func.call @cc_nil_value() : () -> i64
    %728 = func.call @cc_cons(%726, %727) : (i64, i64) -> i64
    %729 = func.call @cc_values_pack(%728) : (i64) -> i64
    %730 = func.call @cc_symbol_value(%726) : (i64) -> i64
    %731 = func.call @cc_nil_value() : () -> i64
    %732 = arith.cmpi ne, %712, %731 : i64
    %733 = scf.if %732 -> (i64) {
      scf.yield %730 : i64
    } else {
      scf.yield %703 : i64
    }
    %734 = func.call @cc_values_pack(%733) : (i64) -> i64
    func.call @stack_push_pointer(%734) : (i64) -> ()
    %735 = func.call @stack_pop_pointer() : () -> i64
    %736 = func.call @cc_multiple_value_list(%735) : (i64) -> i64
    %737 = llvm.mlir.addressof @str83 : !llvm.ptr
    %738 = arith.constant 37 : i64
    %739 = func.call @cc_make_string(%737, %738) : (!llvm.ptr, i64) -> i64
    %740 = func.call @cc_nil_value() : () -> i64
    %741 = func.call @cc_intern(%739, %740) : (i64, i64) -> i64
    %742 = func.call @cc_nil_value() : () -> i64
    %743 = func.call @cc_cons(%741, %742) : (i64, i64) -> i64
    %744 = func.call @cc_values_pack(%743) : (i64) -> i64
    %745 = func.call @cc_symbol_value(%741) : (i64) -> i64
    %746 = llvm.mlir.addressof @str84 : !llvm.ptr
    %747 = arith.constant 39 : i64
    %748 = func.call @cc_make_string(%746, %747) : (!llvm.ptr, i64) -> i64
    %749 = func.call @cc_nil_value() : () -> i64
    %750 = func.call @cc_intern(%748, %749) : (i64, i64) -> i64
    %751 = func.call @cc_nil_value() : () -> i64
    %752 = func.call @cc_cons(%750, %751) : (i64, i64) -> i64
    %753 = func.call @cc_values_pack(%752) : (i64) -> i64
    %754 = func.call @cc_symbol_value(%750) : (i64) -> i64
    %755 = func.call @cc_nil_value() : () -> i64
    %756 = arith.cmpi ne, %745, %755 : i64
    %757 = scf.if %756 -> (i64) {
      scf.yield %754 : i64
    } else {
      scf.yield %736 : i64
    }
    %758 = func.call @cc_values_pack(%757) : (i64) -> i64
    func.call @stack_push_pointer(%758) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::SHOW-TEST-SUMMARY"() {
    %759 = llvm.mlir.addressof @str85 : !llvm.ptr
    %760 = arith.constant 17 : i64
    %761 = func.call @cc_make_string(%759, %760) : (!llvm.ptr, i64) -> i64
    %762 = llvm.mlir.addressof @str86 : !llvm.ptr
    %763 = arith.constant 11 : i64
    %764 = func.call @cc_make_string(%762, %763) : (!llvm.ptr, i64) -> i64
    %765 = func.call @cc_intern(%761, %764) : (i64, i64) -> i64
    %766 = func.call @cc_nil_value() : () -> i64
    %767 = func.call @cc_cons(%765, %766) : (i64, i64) -> i64
    %768 = func.call @cc_values_pack(%767) : (i64) -> i64
    %769 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%765, %769) : (i64, i64) -> ()
    %770 = func.call @cc_nil_value() : () -> i64
    %771 = llvm.mlir.addressof @str87 : !llvm.ptr
    %772 = arith.constant 37 : i64
    %773 = func.call @cc_make_string(%771, %772) : (!llvm.ptr, i64) -> i64
    %774 = func.call @cc_nil_value() : () -> i64
    %775 = func.call @cc_intern(%773, %774) : (i64, i64) -> i64
    %776 = func.call @cc_nil_value() : () -> i64
    %777 = func.call @cc_cons(%775, %776) : (i64, i64) -> i64
    %778 = func.call @cc_values_pack(%777) : (i64) -> i64
    %779 = func.call @cc_set_symbol_value(%775, %770) : (i64, i64) -> i64
    %780 = llvm.mlir.addressof @str88 : !llvm.ptr
    %781 = arith.constant 38 : i64
    %782 = func.call @cc_make_string(%780, %781) : (!llvm.ptr, i64) -> i64
    %783 = func.call @cc_nil_value() : () -> i64
    %784 = func.call @cc_intern(%782, %783) : (i64, i64) -> i64
    %785 = func.call @cc_nil_value() : () -> i64
    %786 = func.call @cc_cons(%784, %785) : (i64, i64) -> i64
    %787 = func.call @cc_values_pack(%786) : (i64) -> i64
    %788 = func.call @cc_set_symbol_value(%784, %770) : (i64, i64) -> i64
    %789 = llvm.mlir.addressof @str89 : !llvm.ptr
    %790 = arith.constant 39 : i64
    %791 = func.call @cc_make_string(%789, %790) : (!llvm.ptr, i64) -> i64
    %792 = func.call @cc_nil_value() : () -> i64
    %793 = func.call @cc_intern(%791, %792) : (i64, i64) -> i64
    %794 = func.call @cc_nil_value() : () -> i64
    %795 = func.call @cc_cons(%793, %794) : (i64, i64) -> i64
    %796 = func.call @cc_values_pack(%795) : (i64) -> i64
    %797 = func.call @cc_set_symbol_value(%793, %770) : (i64, i64) -> i64
    %798 = func.call @cc_nil_value() : () -> i64
    %799 = llvm.mlir.addressof @str90 : !llvm.ptr
    %800 = arith.constant 37 : i64
    %801 = func.call @cc_make_string(%799, %800) : (!llvm.ptr, i64) -> i64
    %802 = func.call @cc_nil_value() : () -> i64
    %803 = func.call @cc_intern(%801, %802) : (i64, i64) -> i64
    %804 = func.call @cc_nil_value() : () -> i64
    %805 = func.call @cc_cons(%803, %804) : (i64, i64) -> i64
    %806 = func.call @cc_values_pack(%805) : (i64) -> i64
    %807 = func.call @cc_set_symbol_value(%803, %798) : (i64, i64) -> i64
    %808 = llvm.mlir.addressof @str91 : !llvm.ptr
    %809 = arith.constant 38 : i64
    %810 = func.call @cc_make_string(%808, %809) : (!llvm.ptr, i64) -> i64
    %811 = func.call @cc_nil_value() : () -> i64
    %812 = func.call @cc_intern(%810, %811) : (i64, i64) -> i64
    %813 = func.call @cc_nil_value() : () -> i64
    %814 = func.call @cc_cons(%812, %813) : (i64, i64) -> i64
    %815 = func.call @cc_values_pack(%814) : (i64) -> i64
    %816 = func.call @cc_set_symbol_value(%812, %798) : (i64, i64) -> i64
    %817 = llvm.mlir.addressof @str92 : !llvm.ptr
    %818 = arith.constant 39 : i64
    %819 = func.call @cc_make_string(%817, %818) : (!llvm.ptr, i64) -> i64
    %820 = func.call @cc_nil_value() : () -> i64
    %821 = func.call @cc_intern(%819, %820) : (i64, i64) -> i64
    %822 = func.call @cc_nil_value() : () -> i64
    %823 = func.call @cc_cons(%821, %822) : (i64, i64) -> i64
    %824 = func.call @cc_values_pack(%823) : (i64) -> i64
    %825 = func.call @cc_set_symbol_value(%821, %798) : (i64, i64) -> i64
    %826 = llvm.mlir.addressof @str93 : !llvm.ptr
    %827 = arith.constant 4 : i64
    %828 = func.call @cc_make_string(%826, %827) : (!llvm.ptr, i64) -> i64
    %829 = llvm.mlir.addressof @str94 : !llvm.ptr
    %830 = arith.constant 7 : i64
    %831 = func.call @cc_make_string(%829, %830) : (!llvm.ptr, i64) -> i64
    %832 = func.call @cc_intern(%828, %831) : (i64, i64) -> i64
    %833 = func.call @cc_nil_value() : () -> i64
    %834 = func.call @cc_cons(%832, %833) : (i64, i64) -> i64
    %835 = func.call @cc_values_pack(%834) : (i64) -> i64
    func.call @stack_push_pointer(%832) : (i64) -> ()
    %836 = func.call @stack_pop_pointer() : () -> i64
    %837 = llvm.mlir.addressof @str95 : !llvm.ptr
    %838 = arith.constant 147 : i64
    %839 = func.call @cc_make_string(%837, %838) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%839) : (i64) -> ()
    %840 = func.call @stack_pop_pointer() : () -> i64
    %841 = llvm.mlir.addressof @str96 : !llvm.ptr
    %842 = arith.constant 25 : i64
    %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
    %844 = llvm.mlir.addressof @str97 : !llvm.ptr
    %845 = arith.constant 11 : i64
    %846 = func.call @cc_make_string(%844, %845) : (!llvm.ptr, i64) -> i64
    %847 = func.call @cc_intern(%843, %846) : (i64, i64) -> i64
    %848 = func.call @cc_nil_value() : () -> i64
    %849 = func.call @cc_cons(%847, %848) : (i64, i64) -> i64
    %850 = func.call @cc_values_pack(%849) : (i64) -> i64
    %851 = func.call @cc_symbol_value(%847) : (i64) -> i64
    func.call @stack_push_pointer(%851) : (i64) -> ()
    %852 = func.call @stack_pop_pointer() : () -> i64
    %853 = func.call @cc_reverse(%852) : (i64) -> i64
    func.call @stack_push_pointer(%853) : (i64) -> ()
    %854 = func.call @stack_pop_pointer() : () -> i64
    %855 = llvm.mlir.addressof @str98 : !llvm.ptr
    %856 = arith.constant 25 : i64
    %857 = func.call @cc_make_string(%855, %856) : (!llvm.ptr, i64) -> i64
    %858 = llvm.mlir.addressof @str99 : !llvm.ptr
    %859 = arith.constant 11 : i64
    %860 = func.call @cc_make_string(%858, %859) : (!llvm.ptr, i64) -> i64
    %861 = func.call @cc_intern(%857, %860) : (i64, i64) -> i64
    %862 = func.call @cc_nil_value() : () -> i64
    %863 = func.call @cc_cons(%861, %862) : (i64, i64) -> i64
    %864 = func.call @cc_values_pack(%863) : (i64) -> i64
    %865 = func.call @cc_symbol_value(%861) : (i64) -> i64
    func.call @stack_push_pointer(%865) : (i64) -> ()
    %866 = func.call @stack_pop_pointer() : () -> i64
    %867 = func.call @cc_reverse(%866) : (i64) -> i64
    func.call @stack_push_pointer(%867) : (i64) -> ()
    %868 = func.call @stack_pop_pointer() : () -> i64
    %869 = llvm.mlir.addressof @str100 : !llvm.ptr
    %870 = arith.constant 23 : i64
    %871 = func.call @cc_make_string(%869, %870) : (!llvm.ptr, i64) -> i64
    %872 = llvm.mlir.addressof @str101 : !llvm.ptr
    %873 = arith.constant 11 : i64
    %874 = func.call @cc_make_string(%872, %873) : (!llvm.ptr, i64) -> i64
    %875 = func.call @cc_intern(%871, %874) : (i64, i64) -> i64
    %876 = func.call @cc_nil_value() : () -> i64
    %877 = func.call @cc_cons(%875, %876) : (i64, i64) -> i64
    %878 = func.call @cc_values_pack(%877) : (i64) -> i64
    %879 = func.call @cc_symbol_value(%875) : (i64) -> i64
    func.call @stack_push_pointer(%879) : (i64) -> ()
    %880 = func.call @stack_pop_pointer() : () -> i64
    %881 = func.call @cc_reverse(%880) : (i64) -> i64
    func.call @stack_push_pointer(%881) : (i64) -> ()
    %882 = func.call @stack_pop_pointer() : () -> i64
    %883 = llvm.mlir.addressof @str102 : !llvm.ptr
    %884 = arith.constant 23 : i64
    %885 = func.call @cc_make_string(%883, %884) : (!llvm.ptr, i64) -> i64
    %886 = llvm.mlir.addressof @str103 : !llvm.ptr
    %887 = arith.constant 11 : i64
    %888 = func.call @cc_make_string(%886, %887) : (!llvm.ptr, i64) -> i64
    %889 = func.call @cc_intern(%885, %888) : (i64, i64) -> i64
    %890 = func.call @cc_nil_value() : () -> i64
    %891 = func.call @cc_cons(%889, %890) : (i64, i64) -> i64
    %892 = func.call @cc_values_pack(%891) : (i64) -> i64
    %893 = func.call @cc_symbol_value(%889) : (i64) -> i64
    func.call @stack_push_pointer(%893) : (i64) -> ()
    %894 = func.call @stack_pop_pointer() : () -> i64
    %895 = func.call @cc_length(%894) : (i64) -> i64
    func.call @stack_push_pointer(%895) : (i64) -> ()
    %896 = func.call @stack_pop_pointer() : () -> i64
    %897 = func.call @cc_nil_value() : () -> i64
    %898 = func.call @cc_errorp(%836) : (i64) -> i64
    %899 = arith.cmpi ne, %898, %897 : i64
    %900 = arith.cmpi eq, %897, %897 : i64
    %901 = arith.andi %899, %900 : i1
    %902 = scf.if %901 -> (i64) {
      scf.yield %836 : i64
    } else {
      scf.yield %897 : i64
    }
    %903 = func.call @cc_errorp(%840) : (i64) -> i64
    %904 = arith.cmpi ne, %903, %897 : i64
    %905 = arith.cmpi eq, %902, %897 : i64
    %906 = arith.andi %904, %905 : i1
    %907 = scf.if %906 -> (i64) {
      scf.yield %840 : i64
    } else {
      scf.yield %902 : i64
    }
    %908 = func.call @cc_errorp(%854) : (i64) -> i64
    %909 = arith.cmpi ne, %908, %897 : i64
    %910 = arith.cmpi eq, %907, %897 : i64
    %911 = arith.andi %909, %910 : i1
    %912 = scf.if %911 -> (i64) {
      scf.yield %854 : i64
    } else {
      scf.yield %907 : i64
    }
    %913 = func.call @cc_errorp(%868) : (i64) -> i64
    %914 = arith.cmpi ne, %913, %897 : i64
    %915 = arith.cmpi eq, %912, %897 : i64
    %916 = arith.andi %914, %915 : i1
    %917 = scf.if %916 -> (i64) {
      scf.yield %868 : i64
    } else {
      scf.yield %912 : i64
    }
    %918 = func.call @cc_errorp(%882) : (i64) -> i64
    %919 = arith.cmpi ne, %918, %897 : i64
    %920 = arith.cmpi eq, %917, %897 : i64
    %921 = arith.andi %919, %920 : i1
    %922 = scf.if %921 -> (i64) {
      scf.yield %882 : i64
    } else {
      scf.yield %917 : i64
    }
    %923 = func.call @cc_errorp(%896) : (i64) -> i64
    %924 = arith.cmpi ne, %923, %897 : i64
    %925 = arith.cmpi eq, %922, %897 : i64
    %926 = arith.andi %924, %925 : i1
    %927 = scf.if %926 -> (i64) {
      scf.yield %896 : i64
    } else {
      scf.yield %922 : i64
    }
    %928 = arith.cmpi ne, %927, %897 : i64
    scf.if %928 {
      func.call @stack_push_pointer(%927) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%836) : (i64) -> ()
      func.call @stack_push_pointer(%840) : (i64) -> ()
      func.call @stack_push_pointer(%854) : (i64) -> ()
      func.call @stack_push_pointer(%868) : (i64) -> ()
      func.call @stack_push_pointer(%882) : (i64) -> ()
      func.call @stack_push_pointer(%896) : (i64) -> ()
      %929 = llvm.mlir.addressof @str104 : !llvm.ptr
      %930 = func.call @cc_make_function_ref_const(%929) : (!llvm.ptr) -> i64
      %931 = arith.constant 6 : i64
      func.call @cc_funcall_stack(%930, %931) : (i64, i64) -> ()
    }
    %932 = func.call @stack_pop_pointer() : () -> i64
    %933 = llvm.mlir.addressof @str105 : !llvm.ptr
    %934 = arith.constant 25 : i64
    %935 = func.call @cc_make_string(%933, %934) : (!llvm.ptr, i64) -> i64
    %936 = llvm.mlir.addressof @str106 : !llvm.ptr
    %937 = arith.constant 11 : i64
    %938 = func.call @cc_make_string(%936, %937) : (!llvm.ptr, i64) -> i64
    %939 = func.call @cc_intern(%935, %938) : (i64, i64) -> i64
    %940 = func.call @cc_nil_value() : () -> i64
    %941 = func.call @cc_cons(%939, %940) : (i64, i64) -> i64
    %942 = func.call @cc_values_pack(%941) : (i64) -> i64
    %943 = func.call @cc_symbol_value(%939) : (i64) -> i64
    func.call @stack_push_pointer(%943) : (i64) -> ()
    %944 = func.call @stack_pop_pointer() : () -> i64
    %945 = func.call @cc_nil_value() : () -> i64
    %946 = arith.cmpi ne, %944, %945 : i64
    scf.if %946 {
      %947 = func.call @cc_nil_value() : () -> i64
      %948 = func.call @cc_nil_value() : () -> i64
      %949 = func.call @cc_errorp(%947) : (i64) -> i64
      %950 = arith.cmpi ne, %949, %948 : i64
      %951 = scf.if %950 -> (i64) {
        scf.yield %947 : i64
      } else {
        %952 = llvm.mlir.addressof @str107 : !llvm.ptr
        %953 = arith.constant 25 : i64
        %954 = func.call @cc_make_string(%952, %953) : (!llvm.ptr, i64) -> i64
        %955 = llvm.mlir.addressof @str108 : !llvm.ptr
        %956 = arith.constant 11 : i64
        %957 = func.call @cc_make_string(%955, %956) : (!llvm.ptr, i64) -> i64
        %958 = func.call @cc_intern(%954, %957) : (i64, i64) -> i64
        %959 = func.call @cc_nil_value() : () -> i64
        %960 = func.call @cc_cons(%958, %959) : (i64, i64) -> i64
        %961 = func.call @cc_values_pack(%960) : (i64) -> i64
        %962 = func.call @cc_symbol_value(%958) : (i64) -> i64
        func.call @stack_push_pointer(%962) : (i64) -> ()
        %963 = func.call @stack_pop_pointer() : () -> i64
        %964:1 = scf.while (%arg0 = %963) : (i64) -> (i64) {
          %965 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %966 = arith.constant 0 : i32
          %967 = arith.cmpi ne, %965, %966 : i32
          scf.condition(%967) %arg0 : i64
        } do {
          ^bb0(%968: i64):
          %969 = func.call @cc_car(%968) : (i64) -> i64
          %970 = llvm.mlir.addressof @str109 : !llvm.ptr
          %971 = arith.constant 3 : i64
          %972 = func.call @cc_make_string(%970, %971) : (!llvm.ptr, i64) -> i64
          %973 = llvm.mlir.addressof @str110 : !llvm.ptr
          %974 = arith.constant 7 : i64
          %975 = func.call @cc_make_string(%973, %974) : (!llvm.ptr, i64) -> i64
          %976 = func.call @cc_intern(%972, %975) : (i64, i64) -> i64
          %977 = func.call @cc_nil_value() : () -> i64
          %978 = func.call @cc_cons(%976, %977) : (i64, i64) -> i64
          %979 = func.call @cc_values_pack(%978) : (i64) -> i64
          func.call @stack_push_pointer(%976) : (i64) -> ()
          %980 = func.call @stack_pop_pointer() : () -> i64
          %981 = llvm.mlir.addressof @str111 : !llvm.ptr
          %982 = arith.constant 44 : i64
          %983 = func.call @cc_make_string(%981, %982) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%983) : (i64) -> ()
          %984 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%969) : (i64) -> ()
          %985 = func.call @stack_pop_pointer() : () -> i64
          %986 = func.call @cc_car(%985) : (i64) -> i64
          func.call @stack_push_pointer(%986) : (i64) -> ()
          %987 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%969) : (i64) -> ()
          %988 = func.call @stack_pop_pointer() : () -> i64
          %989 = func.call @cc_cdr(%988) : (i64) -> i64
          %990 = func.call @cc_car(%989) : (i64) -> i64
          func.call @stack_push_pointer(%990) : (i64) -> ()
          %991 = func.call @stack_pop_pointer() : () -> i64
          %992 = func.call @cc_nil_value() : () -> i64
          %993 = func.call @cc_errorp(%980) : (i64) -> i64
          %994 = arith.cmpi ne, %993, %992 : i64
          %995 = arith.cmpi eq, %992, %992 : i64
          %996 = arith.andi %994, %995 : i1
          %997 = scf.if %996 -> (i64) {
            scf.yield %980 : i64
          } else {
            scf.yield %992 : i64
          }
          %998 = func.call @cc_errorp(%984) : (i64) -> i64
          %999 = arith.cmpi ne, %998, %992 : i64
          %1000 = arith.cmpi eq, %997, %992 : i64
          %1001 = arith.andi %999, %1000 : i1
          %1002 = scf.if %1001 -> (i64) {
            scf.yield %984 : i64
          } else {
            scf.yield %997 : i64
          }
          %1003 = func.call @cc_errorp(%987) : (i64) -> i64
          %1004 = arith.cmpi ne, %1003, %992 : i64
          %1005 = arith.cmpi eq, %1002, %992 : i64
          %1006 = arith.andi %1004, %1005 : i1
          %1007 = scf.if %1006 -> (i64) {
            scf.yield %987 : i64
          } else {
            scf.yield %1002 : i64
          }
          %1008 = func.call @cc_errorp(%991) : (i64) -> i64
          %1009 = arith.cmpi ne, %1008, %992 : i64
          %1010 = arith.cmpi eq, %1007, %992 : i64
          %1011 = arith.andi %1009, %1010 : i1
          %1012 = scf.if %1011 -> (i64) {
            scf.yield %991 : i64
          } else {
            scf.yield %1007 : i64
          }
          %1013 = arith.cmpi ne, %1012, %992 : i64
          scf.if %1013 {
            func.call @stack_push_pointer(%1012) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%980) : (i64) -> ()
            func.call @stack_push_pointer(%984) : (i64) -> ()
            func.call @stack_push_pointer(%987) : (i64) -> ()
            func.call @stack_push_pointer(%991) : (i64) -> ()
            %1014 = llvm.mlir.addressof @str112 : !llvm.ptr
            %1015 = func.call @cc_make_function_ref_const(%1014) : (!llvm.ptr) -> i64
            %1016 = arith.constant 4 : i64
            func.call @cc_funcall_stack(%1015, %1016) : (i64, i64) -> ()
          }
          %1017 = func.call @stack_depth() : () -> i64
          %1018 = arith.constant 0 : i64
          %1019 = arith.cmpi sgt, %1017, %1018 : i64
          scf.if %1019 {
            %1020 = func.call @stack_pop_pointer() : () -> i64
          }
          %1021 = func.call @cc_cdr(%968) : (i64) -> i64
          scf.yield %1021 : i64
        }
        func.call @stack_push_nil() : () -> ()
        %1022 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1022 : i64
      }
      func.call @stack_push_pointer(%951) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %1023 = func.call @stack_pop_pointer() : () -> i64
    %1024 = llvm.mlir.addressof @str113 : !llvm.ptr
    %1025 = arith.constant 17 : i64
    %1026 = func.call @cc_make_string(%1024, %1025) : (!llvm.ptr, i64) -> i64
    %1027 = llvm.mlir.addressof @str114 : !llvm.ptr
    %1028 = arith.constant 11 : i64
    %1029 = func.call @cc_make_string(%1027, %1028) : (!llvm.ptr, i64) -> i64
    %1030 = func.call @cc_intern(%1026, %1029) : (i64, i64) -> i64
    %1031 = func.call @cc_nil_value() : () -> i64
    %1032 = func.call @cc_cons(%1030, %1031) : (i64, i64) -> i64
    %1033 = func.call @cc_values_pack(%1032) : (i64) -> i64
    %1034 = func.call @cc_symbol_value(%1030) : (i64) -> i64
    func.call @stack_push_pointer(%1034) : (i64) -> ()
    %1035 = func.call @stack_pop_pointer() : () -> i64
    %1036 = func.call @cc_nil_value() : () -> i64
    %1037 = arith.cmpi ne, %1035, %1036 : i64
    scf.if %1037 {
      %1038 = func.call @cc_nil_value() : () -> i64
      %1039 = func.call @cc_nil_value() : () -> i64
      %1040 = func.call @cc_errorp(%1038) : (i64) -> i64
      %1041 = arith.cmpi ne, %1040, %1039 : i64
      %1042 = scf.if %1041 -> (i64) {
        scf.yield %1038 : i64
      } else {
        %1043 = llvm.mlir.addressof @str115 : !llvm.ptr
        %1044 = arith.constant 17 : i64
        %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
        %1046 = llvm.mlir.addressof @str116 : !llvm.ptr
        %1047 = arith.constant 11 : i64
        %1048 = func.call @cc_make_string(%1046, %1047) : (!llvm.ptr, i64) -> i64
        %1049 = func.call @cc_intern(%1045, %1048) : (i64, i64) -> i64
        %1050 = func.call @cc_nil_value() : () -> i64
        %1051 = func.call @cc_cons(%1049, %1050) : (i64, i64) -> i64
        %1052 = func.call @cc_values_pack(%1051) : (i64) -> i64
        %1053 = func.call @cc_symbol_value(%1049) : (i64) -> i64
        func.call @stack_push_pointer(%1053) : (i64) -> ()
        %1054 = func.call @stack_pop_pointer() : () -> i64
        %1055:1 = scf.while (%arg0 = %1054) : (i64) -> (i64) {
          %1056 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %1057 = arith.constant 0 : i32
          %1058 = arith.cmpi ne, %1056, %1057 : i32
          scf.condition(%1058) %arg0 : i64
        } do {
          ^bb0(%1059: i64):
          %1060 = func.call @cc_car(%1059) : (i64) -> i64
          %1061 = llvm.mlir.addressof @str117 : !llvm.ptr
          %1062 = arith.constant 4 : i64
          %1063 = func.call @cc_make_string(%1061, %1062) : (!llvm.ptr, i64) -> i64
          %1064 = llvm.mlir.addressof @str118 : !llvm.ptr
          %1065 = arith.constant 7 : i64
          %1066 = func.call @cc_make_string(%1064, %1065) : (!llvm.ptr, i64) -> i64
          %1067 = func.call @cc_intern(%1063, %1066) : (i64, i64) -> i64
          %1068 = func.call @cc_nil_value() : () -> i64
          %1069 = func.call @cc_cons(%1067, %1068) : (i64, i64) -> i64
          %1070 = func.call @cc_values_pack(%1069) : (i64) -> i64
          func.call @stack_push_pointer(%1067) : (i64) -> ()
          %1071 = func.call @stack_pop_pointer() : () -> i64
          %1072 = llvm.mlir.addressof @str119 : !llvm.ptr
          %1073 = arith.constant 17 : i64
          %1074 = func.call @cc_make_string(%1072, %1073) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%1074) : (i64) -> ()
          %1075 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1060) : (i64) -> ()
          %1076 = func.call @stack_pop_pointer() : () -> i64
          %1077 = func.call @cc_nil_value() : () -> i64
          %1078 = func.call @cc_errorp(%1071) : (i64) -> i64
          %1079 = arith.cmpi ne, %1078, %1077 : i64
          %1080 = arith.cmpi eq, %1077, %1077 : i64
          %1081 = arith.andi %1079, %1080 : i1
          %1082 = scf.if %1081 -> (i64) {
            scf.yield %1071 : i64
          } else {
            scf.yield %1077 : i64
          }
          %1083 = func.call @cc_errorp(%1075) : (i64) -> i64
          %1084 = arith.cmpi ne, %1083, %1077 : i64
          %1085 = arith.cmpi eq, %1082, %1077 : i64
          %1086 = arith.andi %1084, %1085 : i1
          %1087 = scf.if %1086 -> (i64) {
            scf.yield %1075 : i64
          } else {
            scf.yield %1082 : i64
          }
          %1088 = func.call @cc_errorp(%1076) : (i64) -> i64
          %1089 = arith.cmpi ne, %1088, %1077 : i64
          %1090 = arith.cmpi eq, %1087, %1077 : i64
          %1091 = arith.andi %1089, %1090 : i1
          %1092 = scf.if %1091 -> (i64) {
            scf.yield %1076 : i64
          } else {
            scf.yield %1087 : i64
          }
          %1093 = arith.cmpi ne, %1092, %1077 : i64
          scf.if %1093 {
            func.call @stack_push_pointer(%1092) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1071) : (i64) -> ()
            func.call @stack_push_pointer(%1075) : (i64) -> ()
            func.call @stack_push_pointer(%1076) : (i64) -> ()
            %1094 = llvm.mlir.addressof @str120 : !llvm.ptr
            %1095 = func.call @cc_make_function_ref_const(%1094) : (!llvm.ptr) -> i64
            %1096 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%1095, %1096) : (i64, i64) -> ()
          }
          %1097 = func.call @stack_depth() : () -> i64
          %1098 = arith.constant 0 : i64
          %1099 = arith.cmpi sgt, %1097, %1098 : i64
          scf.if %1099 {
            %1100 = func.call @stack_pop_pointer() : () -> i64
          }
          %1101 = func.call @cc_cdr(%1059) : (i64) -> i64
          scf.yield %1101 : i64
        }
        func.call @stack_push_nil() : () -> ()
        %1102 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1102 : i64
      }
      func.call @stack_push_pointer(%1042) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %1103 = func.call @stack_pop_pointer() : () -> i64
    %1104 = llvm.mlir.addressof @str121 : !llvm.ptr
    %1105 = arith.constant 25 : i64
    %1106 = func.call @cc_make_string(%1104, %1105) : (!llvm.ptr, i64) -> i64
    %1107 = llvm.mlir.addressof @str122 : !llvm.ptr
    %1108 = arith.constant 11 : i64
    %1109 = func.call @cc_make_string(%1107, %1108) : (!llvm.ptr, i64) -> i64
    %1110 = func.call @cc_intern(%1106, %1109) : (i64, i64) -> i64
    %1111 = func.call @cc_nil_value() : () -> i64
    %1112 = func.call @cc_cons(%1110, %1111) : (i64, i64) -> i64
    %1113 = func.call @cc_values_pack(%1112) : (i64) -> i64
    %1114 = func.call @cc_symbol_value(%1110) : (i64) -> i64
    func.call @stack_push_pointer(%1114) : (i64) -> ()
    %1115 = func.call @stack_pop_pointer() : () -> i64
    %1116 = func.call @cc_nil_value() : () -> i64
    %1117 = func.call @cc_cons(%1115, %1116) : (i64, i64) -> i64
    %1118 = func.call @cc_not(%1117) : (i64) -> i64
    func.call @stack_push_pointer(%1118) : (i64) -> ()
    %1119 = func.call @stack_pop_pointer() : () -> i64
    %1120 = func.call @cc_multiple_value_list(%1119) : (i64) -> i64
    %1121 = llvm.mlir.addressof @str123 : !llvm.ptr
    %1122 = arith.constant 37 : i64
    %1123 = func.call @cc_make_string(%1121, %1122) : (!llvm.ptr, i64) -> i64
    %1124 = func.call @cc_nil_value() : () -> i64
    %1125 = func.call @cc_intern(%1123, %1124) : (i64, i64) -> i64
    %1126 = func.call @cc_nil_value() : () -> i64
    %1127 = func.call @cc_cons(%1125, %1126) : (i64, i64) -> i64
    %1128 = func.call @cc_values_pack(%1127) : (i64) -> i64
    %1129 = func.call @cc_symbol_value(%1125) : (i64) -> i64
    %1130 = llvm.mlir.addressof @str124 : !llvm.ptr
    %1131 = arith.constant 38 : i64
    %1132 = func.call @cc_make_string(%1130, %1131) : (!llvm.ptr, i64) -> i64
    %1133 = func.call @cc_nil_value() : () -> i64
    %1134 = func.call @cc_intern(%1132, %1133) : (i64, i64) -> i64
    %1135 = func.call @cc_nil_value() : () -> i64
    %1136 = func.call @cc_cons(%1134, %1135) : (i64, i64) -> i64
    %1137 = func.call @cc_values_pack(%1136) : (i64) -> i64
    %1138 = func.call @cc_symbol_value(%1134) : (i64) -> i64
    %1139 = llvm.mlir.addressof @str125 : !llvm.ptr
    %1140 = arith.constant 39 : i64
    %1141 = func.call @cc_make_string(%1139, %1140) : (!llvm.ptr, i64) -> i64
    %1142 = func.call @cc_nil_value() : () -> i64
    %1143 = func.call @cc_intern(%1141, %1142) : (i64, i64) -> i64
    %1144 = func.call @cc_nil_value() : () -> i64
    %1145 = func.call @cc_cons(%1143, %1144) : (i64, i64) -> i64
    %1146 = func.call @cc_values_pack(%1145) : (i64) -> i64
    %1147 = func.call @cc_symbol_value(%1143) : (i64) -> i64
    %1148 = func.call @cc_nil_value() : () -> i64
    %1149 = arith.cmpi ne, %1129, %1148 : i64
    %1150 = scf.if %1149 -> (i64) {
      scf.yield %1147 : i64
    } else {
      scf.yield %1120 : i64
    }
    %1151 = func.call @cc_values_pack(%1150) : (i64) -> i64
    func.call @stack_push_pointer(%1151) : (i64) -> ()
    %1152 = func.call @stack_pop_pointer() : () -> i64
    %1153 = func.call @cc_multiple_value_list(%1152) : (i64) -> i64
    %1154 = llvm.mlir.addressof @str126 : !llvm.ptr
    %1155 = arith.constant 37 : i64
    %1156 = func.call @cc_make_string(%1154, %1155) : (!llvm.ptr, i64) -> i64
    %1157 = func.call @cc_nil_value() : () -> i64
    %1158 = func.call @cc_intern(%1156, %1157) : (i64, i64) -> i64
    %1159 = func.call @cc_nil_value() : () -> i64
    %1160 = func.call @cc_cons(%1158, %1159) : (i64, i64) -> i64
    %1161 = func.call @cc_values_pack(%1160) : (i64) -> i64
    %1162 = func.call @cc_symbol_value(%1158) : (i64) -> i64
    %1163 = llvm.mlir.addressof @str127 : !llvm.ptr
    %1164 = arith.constant 39 : i64
    %1165 = func.call @cc_make_string(%1163, %1164) : (!llvm.ptr, i64) -> i64
    %1166 = func.call @cc_nil_value() : () -> i64
    %1167 = func.call @cc_intern(%1165, %1166) : (i64, i64) -> i64
    %1168 = func.call @cc_nil_value() : () -> i64
    %1169 = func.call @cc_cons(%1167, %1168) : (i64, i64) -> i64
    %1170 = func.call @cc_values_pack(%1169) : (i64) -> i64
    %1171 = func.call @cc_symbol_value(%1167) : (i64) -> i64
    %1172 = func.call @cc_nil_value() : () -> i64
    %1173 = arith.cmpi ne, %1162, %1172 : i64
    %1174 = scf.if %1173 -> (i64) {
      scf.yield %1171 : i64
    } else {
      scf.yield %1153 : i64
    }
    %1175 = func.call @cc_values_pack(%1174) : (i64) -> i64
    func.call @stack_push_pointer(%1175) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%fail-test-with-error"() {
    %1176 = llvm.mlir.addressof @str128 : !llvm.ptr
    %1177 = arith.constant 21 : i64
    %1178 = func.call @cc_make_string(%1176, %1177) : (!llvm.ptr, i64) -> i64
    %1179 = func.call @cc_nil_value() : () -> i64
    %1180 = func.call @cc_intern(%1178, %1179) : (i64, i64) -> i64
    %1181 = func.call @cc_nil_value() : () -> i64
    %1182 = func.call @cc_cons(%1180, %1181) : (i64, i64) -> i64
    %1183 = func.call @cc_values_pack(%1182) : (i64) -> i64
    %1184 = llvm.mlir.addressof @str129 : !llvm.ptr
    %1185 = arith.constant 48 : i64
    %1186 = func.call @cc_make_string(%1184, %1185) : (!llvm.ptr, i64) -> i64
    %1187 = func.call @cc_register_function_lambda_list_metadata_raw(%1180, %1186) : (i64, i64) -> i64
    %1188 = arith.constant 5 : i64
    func.call @cc_runtime_debug_stack_push_call(%1180, %1188) : (i64, i64) -> ()
    %1189 = func.call @stack_pop_pointer() : () -> i64
    %1190 = func.call @stack_pop_pointer() : () -> i64
    %1191 = func.call @stack_pop_pointer() : () -> i64
    %1192 = func.call @stack_pop_pointer() : () -> i64
    %1193 = func.call @stack_pop_pointer() : () -> i64
    %1194 = func.call @cc_nil_value() : () -> i64
    %1195 = llvm.mlir.addressof @str130 : !llvm.ptr
    %1196 = arith.constant 37 : i64
    %1197 = func.call @cc_make_string(%1195, %1196) : (!llvm.ptr, i64) -> i64
    %1198 = func.call @cc_nil_value() : () -> i64
    %1199 = func.call @cc_intern(%1197, %1198) : (i64, i64) -> i64
    %1200 = func.call @cc_nil_value() : () -> i64
    %1201 = func.call @cc_cons(%1199, %1200) : (i64, i64) -> i64
    %1202 = func.call @cc_values_pack(%1201) : (i64) -> i64
    %1203 = func.call @cc_set_symbol_value(%1199, %1194) : (i64, i64) -> i64
    %1204 = llvm.mlir.addressof @str131 : !llvm.ptr
    %1205 = arith.constant 38 : i64
    %1206 = func.call @cc_make_string(%1204, %1205) : (!llvm.ptr, i64) -> i64
    %1207 = func.call @cc_nil_value() : () -> i64
    %1208 = func.call @cc_intern(%1206, %1207) : (i64, i64) -> i64
    %1209 = func.call @cc_nil_value() : () -> i64
    %1210 = func.call @cc_cons(%1208, %1209) : (i64, i64) -> i64
    %1211 = func.call @cc_values_pack(%1210) : (i64) -> i64
    %1212 = func.call @cc_set_symbol_value(%1208, %1194) : (i64, i64) -> i64
    %1213 = llvm.mlir.addressof @str132 : !llvm.ptr
    %1214 = arith.constant 39 : i64
    %1215 = func.call @cc_make_string(%1213, %1214) : (!llvm.ptr, i64) -> i64
    %1216 = func.call @cc_nil_value() : () -> i64
    %1217 = func.call @cc_intern(%1215, %1216) : (i64, i64) -> i64
    %1218 = func.call @cc_nil_value() : () -> i64
    %1219 = func.call @cc_cons(%1217, %1218) : (i64, i64) -> i64
    %1220 = func.call @cc_values_pack(%1219) : (i64) -> i64
    %1221 = func.call @cc_set_symbol_value(%1217, %1194) : (i64, i64) -> i64
    %1222 = func.call @cc_nil_value() : () -> i64
    %1223 = llvm.mlir.addressof @str133 : !llvm.ptr
    %1224 = arith.constant 37 : i64
    %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
    %1226 = func.call @cc_nil_value() : () -> i64
    %1227 = func.call @cc_intern(%1225, %1226) : (i64, i64) -> i64
    %1228 = func.call @cc_nil_value() : () -> i64
    %1229 = func.call @cc_cons(%1227, %1228) : (i64, i64) -> i64
    %1230 = func.call @cc_values_pack(%1229) : (i64) -> i64
    %1231 = func.call @cc_set_symbol_value(%1227, %1222) : (i64, i64) -> i64
    %1232 = llvm.mlir.addressof @str134 : !llvm.ptr
    %1233 = arith.constant 38 : i64
    %1234 = func.call @cc_make_string(%1232, %1233) : (!llvm.ptr, i64) -> i64
    %1235 = func.call @cc_nil_value() : () -> i64
    %1236 = func.call @cc_intern(%1234, %1235) : (i64, i64) -> i64
    %1237 = func.call @cc_nil_value() : () -> i64
    %1238 = func.call @cc_cons(%1236, %1237) : (i64, i64) -> i64
    %1239 = func.call @cc_values_pack(%1238) : (i64) -> i64
    %1240 = func.call @cc_set_symbol_value(%1236, %1222) : (i64, i64) -> i64
    %1241 = llvm.mlir.addressof @str135 : !llvm.ptr
    %1242 = arith.constant 39 : i64
    %1243 = func.call @cc_make_string(%1241, %1242) : (!llvm.ptr, i64) -> i64
    %1244 = func.call @cc_nil_value() : () -> i64
    %1245 = func.call @cc_intern(%1243, %1244) : (i64, i64) -> i64
    %1246 = func.call @cc_nil_value() : () -> i64
    %1247 = func.call @cc_cons(%1245, %1246) : (i64, i64) -> i64
    %1248 = func.call @cc_values_pack(%1247) : (i64) -> i64
    %1249 = func.call @cc_set_symbol_value(%1245, %1222) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %1250 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1193) : (i64) -> ()
    %1251 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1190) : (i64) -> ()
    %1252 = func.call @stack_pop_pointer() : () -> i64
    %1253 = func.call @cc_nil_value() : () -> i64
    %1254 = func.call @cc_errorp(%1251) : (i64) -> i64
    %1255 = arith.cmpi ne, %1254, %1253 : i64
    %1256 = arith.cmpi eq, %1253, %1253 : i64
    %1257 = arith.andi %1255, %1256 : i1
    %1258 = scf.if %1257 -> (i64) {
      scf.yield %1251 : i64
    } else {
      scf.yield %1253 : i64
    }
    %1259 = func.call @cc_errorp(%1252) : (i64) -> i64
    %1260 = arith.cmpi ne, %1259, %1253 : i64
    %1261 = arith.cmpi eq, %1258, %1253 : i64
    %1262 = arith.andi %1260, %1261 : i1
    %1263 = scf.if %1262 -> (i64) {
      scf.yield %1252 : i64
    } else {
      scf.yield %1258 : i64
    }
    %1264 = arith.cmpi ne, %1263, %1253 : i64
    scf.if %1264 {
      func.call @stack_push_pointer(%1263) : (i64) -> ()
    } else {
      %1265 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1265) : (i64) -> ()
      func.call @stack_push_pointer(%1252) : (i64) -> ()
      %1266 = func.call @stack_pop_pointer() : () -> i64
      %1267 = func.call @stack_pop_pointer() : () -> i64
      %1268 = func.call @cc_cons(%1266, %1267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1268) : (i64) -> ()
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      %1269 = func.call @stack_pop_pointer() : () -> i64
      %1270 = func.call @stack_pop_pointer() : () -> i64
      %1271 = func.call @cc_cons(%1269, %1270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1271) : (i64) -> ()
    }
    %1272 = func.call @stack_pop_pointer() : () -> i64
    %1273 = llvm.mlir.addressof @str136 : !llvm.ptr
    %1274 = arith.constant 20 : i64
    %1275 = func.call @cc_make_string(%1273, %1274) : (!llvm.ptr, i64) -> i64
    %1276 = llvm.mlir.addressof @str137 : !llvm.ptr
    %1277 = arith.constant 11 : i64
    %1278 = func.call @cc_make_string(%1276, %1277) : (!llvm.ptr, i64) -> i64
    %1279 = func.call @cc_intern(%1275, %1278) : (i64, i64) -> i64
    %1280 = func.call @cc_nil_value() : () -> i64
    %1281 = func.call @cc_cons(%1279, %1280) : (i64, i64) -> i64
    %1282 = func.call @cc_values_pack(%1281) : (i64) -> i64
    %1283 = func.call @cc_symbol_value(%1279) : (i64) -> i64
    %1284 = func.call @cc_cons(%1272, %1283) : (i64, i64) -> i64
    %1285 = llvm.mlir.addressof @str138 : !llvm.ptr
    %1286 = arith.constant 20 : i64
    %1287 = func.call @cc_make_string(%1285, %1286) : (!llvm.ptr, i64) -> i64
    %1288 = llvm.mlir.addressof @str139 : !llvm.ptr
    %1289 = arith.constant 11 : i64
    %1290 = func.call @cc_make_string(%1288, %1289) : (!llvm.ptr, i64) -> i64
    %1291 = func.call @cc_intern(%1287, %1290) : (i64, i64) -> i64
    %1292 = func.call @cc_nil_value() : () -> i64
    %1293 = func.call @cc_cons(%1291, %1292) : (i64, i64) -> i64
    %1294 = func.call @cc_values_pack(%1293) : (i64) -> i64
    %1295 = func.call @cc_set_symbol_value(%1291, %1284) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1284) : (i64) -> ()
    %1296 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1193) : (i64) -> ()
    %1297 = llvm.mlir.addressof @str140 : !llvm.ptr
    %1298 = arith.constant 19 : i64
    %1299 = func.call @cc_make_string(%1297, %1298) : (!llvm.ptr, i64) -> i64
    %1300 = llvm.mlir.addressof @str141 : !llvm.ptr
    %1301 = arith.constant 11 : i64
    %1302 = func.call @cc_make_string(%1300, %1301) : (!llvm.ptr, i64) -> i64
    %1303 = func.call @cc_intern(%1299, %1302) : (i64, i64) -> i64
    %1304 = func.call @cc_nil_value() : () -> i64
    %1305 = func.call @cc_cons(%1303, %1304) : (i64, i64) -> i64
    %1306 = func.call @cc_values_pack(%1305) : (i64) -> i64
    %1307 = func.call @cc_symbol_value(%1303) : (i64) -> i64
    func.call @stack_push_pointer(%1307) : (i64) -> ()
    %1308 = func.call @stack_pop_pointer() : () -> i64
    %1309 = func.call @stack_pop_pointer() : () -> i64
    %1310 = func.call @cc_member(%1309, %1308) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1310) : (i64) -> ()
    %1311 = func.call @stack_pop_pointer() : () -> i64
    %1312 = func.call @cc_nil_value() : () -> i64
    %1313 = arith.cmpi ne, %1311, %1312 : i64
    scf.if %1313 {
      func.call @stack_push_pointer(%1193) : (i64) -> ()
      %1314 = func.call @stack_pop_pointer() : () -> i64
      %1315 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1316 = arith.constant 23 : i64
      %1317 = func.call @cc_make_string(%1315, %1316) : (!llvm.ptr, i64) -> i64
      %1318 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1319 = arith.constant 11 : i64
      %1320 = func.call @cc_make_string(%1318, %1319) : (!llvm.ptr, i64) -> i64
      %1321 = func.call @cc_intern(%1317, %1320) : (i64, i64) -> i64
      %1322 = func.call @cc_nil_value() : () -> i64
      %1323 = func.call @cc_cons(%1321, %1322) : (i64, i64) -> i64
      %1324 = func.call @cc_values_pack(%1323) : (i64) -> i64
      %1325 = func.call @cc_symbol_value(%1321) : (i64) -> i64
      %1326 = func.call @cc_cons(%1314, %1325) : (i64, i64) -> i64
      %1327 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1328 = arith.constant 23 : i64
      %1329 = func.call @cc_make_string(%1327, %1328) : (!llvm.ptr, i64) -> i64
      %1330 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1331 = arith.constant 11 : i64
      %1332 = func.call @cc_make_string(%1330, %1331) : (!llvm.ptr, i64) -> i64
      %1333 = func.call @cc_intern(%1329, %1332) : (i64, i64) -> i64
      %1334 = func.call @cc_nil_value() : () -> i64
      %1335 = func.call @cc_cons(%1333, %1334) : (i64, i64) -> i64
      %1336 = func.call @cc_values_pack(%1335) : (i64) -> i64
      %1337 = func.call @cc_set_symbol_value(%1333, %1326) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1326) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1193) : (i64) -> ()
      %1338 = func.call @stack_pop_pointer() : () -> i64
      %1339 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1340 = arith.constant 25 : i64
      %1341 = func.call @cc_make_string(%1339, %1340) : (!llvm.ptr, i64) -> i64
      %1342 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1343 = arith.constant 11 : i64
      %1344 = func.call @cc_make_string(%1342, %1343) : (!llvm.ptr, i64) -> i64
      %1345 = func.call @cc_intern(%1341, %1344) : (i64, i64) -> i64
      %1346 = func.call @cc_nil_value() : () -> i64
      %1347 = func.call @cc_cons(%1345, %1346) : (i64, i64) -> i64
      %1348 = func.call @cc_values_pack(%1347) : (i64) -> i64
      %1349 = func.call @cc_symbol_value(%1345) : (i64) -> i64
      %1350 = func.call @cc_cons(%1338, %1349) : (i64, i64) -> i64
      %1351 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1352 = arith.constant 25 : i64
      %1353 = func.call @cc_make_string(%1351, %1352) : (!llvm.ptr, i64) -> i64
      %1354 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1355 = arith.constant 11 : i64
      %1356 = func.call @cc_make_string(%1354, %1355) : (!llvm.ptr, i64) -> i64
      %1357 = func.call @cc_intern(%1353, %1356) : (i64, i64) -> i64
      %1358 = func.call @cc_nil_value() : () -> i64
      %1359 = func.call @cc_cons(%1357, %1358) : (i64, i64) -> i64
      %1360 = func.call @cc_values_pack(%1359) : (i64) -> i64
      %1361 = func.call @cc_set_symbol_value(%1357, %1350) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1350) : (i64) -> ()
    }
    %1362 = func.call @stack_pop_pointer() : () -> i64
    %1363 = llvm.mlir.addressof @str150 : !llvm.ptr
    %1364 = arith.constant 3 : i64
    %1365 = func.call @cc_make_string(%1363, %1364) : (!llvm.ptr, i64) -> i64
    %1366 = llvm.mlir.addressof @str151 : !llvm.ptr
    %1367 = arith.constant 7 : i64
    %1368 = func.call @cc_make_string(%1366, %1367) : (!llvm.ptr, i64) -> i64
    %1369 = func.call @cc_intern(%1365, %1368) : (i64, i64) -> i64
    %1370 = func.call @cc_nil_value() : () -> i64
    %1371 = func.call @cc_cons(%1369, %1370) : (i64, i64) -> i64
    %1372 = func.call @cc_values_pack(%1371) : (i64) -> i64
    func.call @stack_push_pointer(%1369) : (i64) -> ()
    %1373 = func.call @stack_pop_pointer() : () -> i64
    %1374 = llvm.mlir.addressof @str152 : !llvm.ptr
    %1375 = arith.constant 9 : i64
    %1376 = func.call @cc_make_string(%1374, %1375) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1376) : (i64) -> ()
    %1377 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1193) : (i64) -> ()
    %1378 = func.call @stack_pop_pointer() : () -> i64
    %1379 = func.call @cc_nil_value() : () -> i64
    %1380 = func.call @cc_errorp(%1373) : (i64) -> i64
    %1381 = arith.cmpi ne, %1380, %1379 : i64
    %1382 = arith.cmpi eq, %1379, %1379 : i64
    %1383 = arith.andi %1381, %1382 : i1
    %1384 = scf.if %1383 -> (i64) {
      scf.yield %1373 : i64
    } else {
      scf.yield %1379 : i64
    }
    %1385 = func.call @cc_errorp(%1377) : (i64) -> i64
    %1386 = arith.cmpi ne, %1385, %1379 : i64
    %1387 = arith.cmpi eq, %1384, %1379 : i64
    %1388 = arith.andi %1386, %1387 : i1
    %1389 = scf.if %1388 -> (i64) {
      scf.yield %1377 : i64
    } else {
      scf.yield %1384 : i64
    }
    %1390 = func.call @cc_errorp(%1378) : (i64) -> i64
    %1391 = arith.cmpi ne, %1390, %1379 : i64
    %1392 = arith.cmpi eq, %1389, %1379 : i64
    %1393 = arith.andi %1391, %1392 : i1
    %1394 = scf.if %1393 -> (i64) {
      scf.yield %1378 : i64
    } else {
      scf.yield %1389 : i64
    }
    %1395 = arith.cmpi ne, %1394, %1379 : i64
    scf.if %1395 {
      func.call @stack_push_pointer(%1394) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1373) : (i64) -> ()
      func.call @stack_push_pointer(%1377) : (i64) -> ()
      func.call @stack_push_pointer(%1378) : (i64) -> ()
      %1396 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1397 = func.call @cc_make_function_ref_const(%1396) : (!llvm.ptr) -> i64
      %1398 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1397, %1398) : (i64, i64) -> ()
    }
    %1399 = func.call @stack_pop_pointer() : () -> i64
    %1400 = llvm.mlir.addressof @str154 : !llvm.ptr
    %1401 = arith.constant 4 : i64
    %1402 = func.call @cc_make_string(%1400, %1401) : (!llvm.ptr, i64) -> i64
    %1403 = llvm.mlir.addressof @str155 : !llvm.ptr
    %1404 = arith.constant 7 : i64
    %1405 = func.call @cc_make_string(%1403, %1404) : (!llvm.ptr, i64) -> i64
    %1406 = func.call @cc_intern(%1402, %1405) : (i64, i64) -> i64
    %1407 = func.call @cc_nil_value() : () -> i64
    %1408 = func.call @cc_cons(%1406, %1407) : (i64, i64) -> i64
    %1409 = func.call @cc_values_pack(%1408) : (i64) -> i64
    func.call @stack_push_pointer(%1406) : (i64) -> ()
    %1410 = func.call @stack_pop_pointer() : () -> i64
    %1411 = llvm.mlir.addressof @str156 : !llvm.ptr
    %1412 = arith.constant 46 : i64
    %1413 = func.call @cc_make_string(%1411, %1412) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1413) : (i64) -> ()
    %1414 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1190) : (i64) -> ()
    %1415 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1192) : (i64) -> ()
    %1416 = func.call @stack_pop_pointer() : () -> i64
    %1417 = func.call @cc_nil_value() : () -> i64
    %1418 = func.call @cc_errorp(%1410) : (i64) -> i64
    %1419 = arith.cmpi ne, %1418, %1417 : i64
    %1420 = arith.cmpi eq, %1417, %1417 : i64
    %1421 = arith.andi %1419, %1420 : i1
    %1422 = scf.if %1421 -> (i64) {
      scf.yield %1410 : i64
    } else {
      scf.yield %1417 : i64
    }
    %1423 = func.call @cc_errorp(%1414) : (i64) -> i64
    %1424 = arith.cmpi ne, %1423, %1417 : i64
    %1425 = arith.cmpi eq, %1422, %1417 : i64
    %1426 = arith.andi %1424, %1425 : i1
    %1427 = scf.if %1426 -> (i64) {
      scf.yield %1414 : i64
    } else {
      scf.yield %1422 : i64
    }
    %1428 = func.call @cc_errorp(%1415) : (i64) -> i64
    %1429 = arith.cmpi ne, %1428, %1417 : i64
    %1430 = arith.cmpi eq, %1427, %1417 : i64
    %1431 = arith.andi %1429, %1430 : i1
    %1432 = scf.if %1431 -> (i64) {
      scf.yield %1415 : i64
    } else {
      scf.yield %1427 : i64
    }
    %1433 = func.call @cc_errorp(%1416) : (i64) -> i64
    %1434 = arith.cmpi ne, %1433, %1417 : i64
    %1435 = arith.cmpi eq, %1432, %1417 : i64
    %1436 = arith.andi %1434, %1435 : i1
    %1437 = scf.if %1436 -> (i64) {
      scf.yield %1416 : i64
    } else {
      scf.yield %1432 : i64
    }
    %1438 = arith.cmpi ne, %1437, %1417 : i64
    scf.if %1438 {
      func.call @stack_push_pointer(%1437) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1410) : (i64) -> ()
      func.call @stack_push_pointer(%1414) : (i64) -> ()
      func.call @stack_push_pointer(%1415) : (i64) -> ()
      func.call @stack_push_pointer(%1416) : (i64) -> ()
      %1439 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1440 = func.call @cc_make_function_ref_const(%1439) : (!llvm.ptr) -> i64
      %1441 = arith.constant 4 : i64
      func.call @cc_funcall_stack(%1440, %1441) : (i64, i64) -> ()
    }
    %1442 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1189) : (i64) -> ()
    %1443 = func.call @stack_pop_pointer() : () -> i64
    %1444 = func.call @cc_nil_value() : () -> i64
    %1445 = arith.cmpi ne, %1443, %1444 : i64
    scf.if %1445 {
      %1446 = func.call @cc_nil_value() : () -> i64
      %1447 = func.call @cc_nil_value() : () -> i64
      %1448 = func.call @cc_errorp(%1446) : (i64) -> i64
      %1449 = arith.cmpi ne, %1448, %1447 : i64
      %1450 = scf.if %1449 -> (i64) {
        scf.yield %1446 : i64
      } else {
        %1451 = llvm.mlir.addressof @str158 : !llvm.ptr
        %1452 = arith.constant 4 : i64
        %1453 = func.call @cc_make_string(%1451, %1452) : (!llvm.ptr, i64) -> i64
        %1454 = llvm.mlir.addressof @str159 : !llvm.ptr
        %1455 = arith.constant 7 : i64
        %1456 = func.call @cc_make_string(%1454, %1455) : (!llvm.ptr, i64) -> i64
        %1457 = func.call @cc_intern(%1453, %1456) : (i64, i64) -> i64
        %1458 = func.call @cc_nil_value() : () -> i64
        %1459 = func.call @cc_cons(%1457, %1458) : (i64, i64) -> i64
        %1460 = func.call @cc_values_pack(%1459) : (i64) -> i64
        func.call @stack_push_pointer(%1457) : (i64) -> ()
        %1461 = func.call @stack_pop_pointer() : () -> i64
        %1462 = llvm.mlir.addressof @str160 : !llvm.ptr
        %1463 = arith.constant 2 : i64
        %1464 = func.call @cc_make_string(%1462, %1463) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1464) : (i64) -> ()
        %1465 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1189) : (i64) -> ()
        %1466 = func.call @stack_pop_pointer() : () -> i64
        %1467 = func.call @cc_nil_value() : () -> i64
        %1468 = func.call @cc_errorp(%1461) : (i64) -> i64
        %1469 = arith.cmpi ne, %1468, %1467 : i64
        %1470 = arith.cmpi eq, %1467, %1467 : i64
        %1471 = arith.andi %1469, %1470 : i1
        %1472 = scf.if %1471 -> (i64) {
          scf.yield %1461 : i64
        } else {
          scf.yield %1467 : i64
        }
        %1473 = func.call @cc_errorp(%1465) : (i64) -> i64
        %1474 = arith.cmpi ne, %1473, %1467 : i64
        %1475 = arith.cmpi eq, %1472, %1467 : i64
        %1476 = arith.andi %1474, %1475 : i1
        %1477 = scf.if %1476 -> (i64) {
          scf.yield %1465 : i64
        } else {
          scf.yield %1472 : i64
        }
        %1478 = func.call @cc_errorp(%1466) : (i64) -> i64
        %1479 = arith.cmpi ne, %1478, %1467 : i64
        %1480 = arith.cmpi eq, %1477, %1467 : i64
        %1481 = arith.andi %1479, %1480 : i1
        %1482 = scf.if %1481 -> (i64) {
          scf.yield %1466 : i64
        } else {
          scf.yield %1477 : i64
        }
        %1483 = arith.cmpi ne, %1482, %1467 : i64
        scf.if %1483 {
          func.call @stack_push_pointer(%1482) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1461) : (i64) -> ()
          func.call @stack_push_pointer(%1465) : (i64) -> ()
          func.call @stack_push_pointer(%1466) : (i64) -> ()
          %1484 = llvm.mlir.addressof @str161 : !llvm.ptr
          %1485 = func.call @cc_make_function_ref_const(%1484) : (!llvm.ptr) -> i64
          %1486 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1485, %1486) : (i64, i64) -> ()
        }
        %1487 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1487 : i64
      }
      func.call @stack_push_pointer(%1450) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %1488 = func.call @stack_pop_pointer() : () -> i64
    %1489 = func.call @cc_multiple_value_list(%1488) : (i64) -> i64
    %1490 = llvm.mlir.addressof @str162 : !llvm.ptr
    %1491 = arith.constant 37 : i64
    %1492 = func.call @cc_make_string(%1490, %1491) : (!llvm.ptr, i64) -> i64
    %1493 = func.call @cc_nil_value() : () -> i64
    %1494 = func.call @cc_intern(%1492, %1493) : (i64, i64) -> i64
    %1495 = func.call @cc_nil_value() : () -> i64
    %1496 = func.call @cc_cons(%1494, %1495) : (i64, i64) -> i64
    %1497 = func.call @cc_values_pack(%1496) : (i64) -> i64
    %1498 = func.call @cc_symbol_value(%1494) : (i64) -> i64
    %1499 = llvm.mlir.addressof @str163 : !llvm.ptr
    %1500 = arith.constant 38 : i64
    %1501 = func.call @cc_make_string(%1499, %1500) : (!llvm.ptr, i64) -> i64
    %1502 = func.call @cc_nil_value() : () -> i64
    %1503 = func.call @cc_intern(%1501, %1502) : (i64, i64) -> i64
    %1504 = func.call @cc_nil_value() : () -> i64
    %1505 = func.call @cc_cons(%1503, %1504) : (i64, i64) -> i64
    %1506 = func.call @cc_values_pack(%1505) : (i64) -> i64
    %1507 = func.call @cc_symbol_value(%1503) : (i64) -> i64
    %1508 = llvm.mlir.addressof @str164 : !llvm.ptr
    %1509 = arith.constant 39 : i64
    %1510 = func.call @cc_make_string(%1508, %1509) : (!llvm.ptr, i64) -> i64
    %1511 = func.call @cc_nil_value() : () -> i64
    %1512 = func.call @cc_intern(%1510, %1511) : (i64, i64) -> i64
    %1513 = func.call @cc_nil_value() : () -> i64
    %1514 = func.call @cc_cons(%1512, %1513) : (i64, i64) -> i64
    %1515 = func.call @cc_values_pack(%1514) : (i64) -> i64
    %1516 = func.call @cc_symbol_value(%1512) : (i64) -> i64
    %1517 = func.call @cc_nil_value() : () -> i64
    %1518 = arith.cmpi ne, %1498, %1517 : i64
    %1519 = scf.if %1518 -> (i64) {
      scf.yield %1516 : i64
    } else {
      scf.yield %1489 : i64
    }
    %1520 = func.call @cc_values_pack(%1519) : (i64) -> i64
    func.call @stack_push_pointer(%1520) : (i64) -> ()
    %1521 = func.call @stack_pop_pointer() : () -> i64
    %1522 = func.call @cc_multiple_value_list(%1521) : (i64) -> i64
    %1523 = llvm.mlir.addressof @str165 : !llvm.ptr
    %1524 = arith.constant 37 : i64
    %1525 = func.call @cc_make_string(%1523, %1524) : (!llvm.ptr, i64) -> i64
    %1526 = func.call @cc_nil_value() : () -> i64
    %1527 = func.call @cc_intern(%1525, %1526) : (i64, i64) -> i64
    %1528 = func.call @cc_nil_value() : () -> i64
    %1529 = func.call @cc_cons(%1527, %1528) : (i64, i64) -> i64
    %1530 = func.call @cc_values_pack(%1529) : (i64) -> i64
    %1531 = func.call @cc_symbol_value(%1527) : (i64) -> i64
    %1532 = llvm.mlir.addressof @str166 : !llvm.ptr
    %1533 = arith.constant 39 : i64
    %1534 = func.call @cc_make_string(%1532, %1533) : (!llvm.ptr, i64) -> i64
    %1535 = func.call @cc_nil_value() : () -> i64
    %1536 = func.call @cc_intern(%1534, %1535) : (i64, i64) -> i64
    %1537 = func.call @cc_nil_value() : () -> i64
    %1538 = func.call @cc_cons(%1536, %1537) : (i64, i64) -> i64
    %1539 = func.call @cc_values_pack(%1538) : (i64) -> i64
    %1540 = func.call @cc_symbol_value(%1536) : (i64) -> i64
    %1541 = func.call @cc_nil_value() : () -> i64
    %1542 = arith.cmpi ne, %1531, %1541 : i64
    %1543 = scf.if %1542 -> (i64) {
      scf.yield %1540 : i64
    } else {
      scf.yield %1522 : i64
    }
    %1544 = func.call @cc_values_pack(%1543) : (i64) -> i64
    func.call @stack_push_pointer(%1544) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%fail-test"() {
    %1545 = llvm.mlir.addressof @str167 : !llvm.ptr
    %1546 = arith.constant 10 : i64
    %1547 = func.call @cc_make_string(%1545, %1546) : (!llvm.ptr, i64) -> i64
    %1548 = func.call @cc_nil_value() : () -> i64
    %1549 = func.call @cc_intern(%1547, %1548) : (i64, i64) -> i64
    %1550 = func.call @cc_nil_value() : () -> i64
    %1551 = func.call @cc_cons(%1549, %1550) : (i64, i64) -> i64
    %1552 = func.call @cc_values_pack(%1551) : (i64) -> i64
    %1553 = llvm.mlir.addressof @str168 : !llvm.ptr
    %1554 = arith.constant 54 : i64
    %1555 = func.call @cc_make_string(%1553, %1554) : (!llvm.ptr, i64) -> i64
    %1556 = func.call @cc_register_function_lambda_list_metadata_raw(%1549, %1555) : (i64, i64) -> i64
    %1557 = arith.constant 6 : i64
    func.call @cc_runtime_debug_stack_push_call(%1549, %1557) : (i64, i64) -> ()
    %1558 = func.call @stack_pop_pointer() : () -> i64
    %1559 = func.call @stack_pop_pointer() : () -> i64
    %1560 = func.call @stack_pop_pointer() : () -> i64
    %1561 = func.call @stack_pop_pointer() : () -> i64
    %1562 = func.call @stack_pop_pointer() : () -> i64
    %1563 = func.call @stack_pop_pointer() : () -> i64
    %1564 = func.call @cc_nil_value() : () -> i64
    %1565 = llvm.mlir.addressof @str169 : !llvm.ptr
    %1566 = arith.constant 37 : i64
    %1567 = func.call @cc_make_string(%1565, %1566) : (!llvm.ptr, i64) -> i64
    %1568 = func.call @cc_nil_value() : () -> i64
    %1569 = func.call @cc_intern(%1567, %1568) : (i64, i64) -> i64
    %1570 = func.call @cc_nil_value() : () -> i64
    %1571 = func.call @cc_cons(%1569, %1570) : (i64, i64) -> i64
    %1572 = func.call @cc_values_pack(%1571) : (i64) -> i64
    %1573 = func.call @cc_set_symbol_value(%1569, %1564) : (i64, i64) -> i64
    %1574 = llvm.mlir.addressof @str170 : !llvm.ptr
    %1575 = arith.constant 38 : i64
    %1576 = func.call @cc_make_string(%1574, %1575) : (!llvm.ptr, i64) -> i64
    %1577 = func.call @cc_nil_value() : () -> i64
    %1578 = func.call @cc_intern(%1576, %1577) : (i64, i64) -> i64
    %1579 = func.call @cc_nil_value() : () -> i64
    %1580 = func.call @cc_cons(%1578, %1579) : (i64, i64) -> i64
    %1581 = func.call @cc_values_pack(%1580) : (i64) -> i64
    %1582 = func.call @cc_set_symbol_value(%1578, %1564) : (i64, i64) -> i64
    %1583 = llvm.mlir.addressof @str171 : !llvm.ptr
    %1584 = arith.constant 39 : i64
    %1585 = func.call @cc_make_string(%1583, %1584) : (!llvm.ptr, i64) -> i64
    %1586 = func.call @cc_nil_value() : () -> i64
    %1587 = func.call @cc_intern(%1585, %1586) : (i64, i64) -> i64
    %1588 = func.call @cc_nil_value() : () -> i64
    %1589 = func.call @cc_cons(%1587, %1588) : (i64, i64) -> i64
    %1590 = func.call @cc_values_pack(%1589) : (i64) -> i64
    %1591 = func.call @cc_set_symbol_value(%1587, %1564) : (i64, i64) -> i64
    %1592 = func.call @cc_nil_value() : () -> i64
    %1593 = llvm.mlir.addressof @str172 : !llvm.ptr
    %1594 = arith.constant 37 : i64
    %1595 = func.call @cc_make_string(%1593, %1594) : (!llvm.ptr, i64) -> i64
    %1596 = func.call @cc_nil_value() : () -> i64
    %1597 = func.call @cc_intern(%1595, %1596) : (i64, i64) -> i64
    %1598 = func.call @cc_nil_value() : () -> i64
    %1599 = func.call @cc_cons(%1597, %1598) : (i64, i64) -> i64
    %1600 = func.call @cc_values_pack(%1599) : (i64) -> i64
    %1601 = func.call @cc_set_symbol_value(%1597, %1592) : (i64, i64) -> i64
    %1602 = llvm.mlir.addressof @str173 : !llvm.ptr
    %1603 = arith.constant 38 : i64
    %1604 = func.call @cc_make_string(%1602, %1603) : (!llvm.ptr, i64) -> i64
    %1605 = func.call @cc_nil_value() : () -> i64
    %1606 = func.call @cc_intern(%1604, %1605) : (i64, i64) -> i64
    %1607 = func.call @cc_nil_value() : () -> i64
    %1608 = func.call @cc_cons(%1606, %1607) : (i64, i64) -> i64
    %1609 = func.call @cc_values_pack(%1608) : (i64) -> i64
    %1610 = func.call @cc_set_symbol_value(%1606, %1592) : (i64, i64) -> i64
    %1611 = llvm.mlir.addressof @str174 : !llvm.ptr
    %1612 = arith.constant 39 : i64
    %1613 = func.call @cc_make_string(%1611, %1612) : (!llvm.ptr, i64) -> i64
    %1614 = func.call @cc_nil_value() : () -> i64
    %1615 = func.call @cc_intern(%1613, %1614) : (i64, i64) -> i64
    %1616 = func.call @cc_nil_value() : () -> i64
    %1617 = func.call @cc_cons(%1615, %1616) : (i64, i64) -> i64
    %1618 = func.call @cc_values_pack(%1617) : (i64) -> i64
    %1619 = func.call @cc_set_symbol_value(%1615, %1592) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1563) : (i64) -> ()
    %1620 = llvm.mlir.addressof @str175 : !llvm.ptr
    %1621 = arith.constant 19 : i64
    %1622 = func.call @cc_make_string(%1620, %1621) : (!llvm.ptr, i64) -> i64
    %1623 = llvm.mlir.addressof @str176 : !llvm.ptr
    %1624 = arith.constant 11 : i64
    %1625 = func.call @cc_make_string(%1623, %1624) : (!llvm.ptr, i64) -> i64
    %1626 = func.call @cc_intern(%1622, %1625) : (i64, i64) -> i64
    %1627 = func.call @cc_nil_value() : () -> i64
    %1628 = func.call @cc_cons(%1626, %1627) : (i64, i64) -> i64
    %1629 = func.call @cc_values_pack(%1628) : (i64) -> i64
    %1630 = func.call @cc_symbol_value(%1626) : (i64) -> i64
    func.call @stack_push_pointer(%1630) : (i64) -> ()
    %1631 = func.call @stack_pop_pointer() : () -> i64
    %1632 = func.call @stack_pop_pointer() : () -> i64
    %1633 = func.call @cc_member(%1632, %1631) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1633) : (i64) -> ()
    %1634 = func.call @stack_pop_pointer() : () -> i64
    %1635 = func.call @cc_nil_value() : () -> i64
    %1636 = arith.cmpi ne, %1634, %1635 : i64
    scf.if %1636 {
      func.call @stack_push_pointer(%1563) : (i64) -> ()
      %1637 = func.call @stack_pop_pointer() : () -> i64
      %1638 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1639 = arith.constant 23 : i64
      %1640 = func.call @cc_make_string(%1638, %1639) : (!llvm.ptr, i64) -> i64
      %1641 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1642 = arith.constant 11 : i64
      %1643 = func.call @cc_make_string(%1641, %1642) : (!llvm.ptr, i64) -> i64
      %1644 = func.call @cc_intern(%1640, %1643) : (i64, i64) -> i64
      %1645 = func.call @cc_nil_value() : () -> i64
      %1646 = func.call @cc_cons(%1644, %1645) : (i64, i64) -> i64
      %1647 = func.call @cc_values_pack(%1646) : (i64) -> i64
      %1648 = func.call @cc_symbol_value(%1644) : (i64) -> i64
      %1649 = func.call @cc_cons(%1637, %1648) : (i64, i64) -> i64
      %1650 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1651 = arith.constant 23 : i64
      %1652 = func.call @cc_make_string(%1650, %1651) : (!llvm.ptr, i64) -> i64
      %1653 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1654 = arith.constant 11 : i64
      %1655 = func.call @cc_make_string(%1653, %1654) : (!llvm.ptr, i64) -> i64
      %1656 = func.call @cc_intern(%1652, %1655) : (i64, i64) -> i64
      %1657 = func.call @cc_nil_value() : () -> i64
      %1658 = func.call @cc_cons(%1656, %1657) : (i64, i64) -> i64
      %1659 = func.call @cc_values_pack(%1658) : (i64) -> i64
      %1660 = func.call @cc_set_symbol_value(%1656, %1649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1649) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1563) : (i64) -> ()
      %1661 = func.call @stack_pop_pointer() : () -> i64
      %1662 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1663 = arith.constant 25 : i64
      %1664 = func.call @cc_make_string(%1662, %1663) : (!llvm.ptr, i64) -> i64
      %1665 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1666 = arith.constant 11 : i64
      %1667 = func.call @cc_make_string(%1665, %1666) : (!llvm.ptr, i64) -> i64
      %1668 = func.call @cc_intern(%1664, %1667) : (i64, i64) -> i64
      %1669 = func.call @cc_nil_value() : () -> i64
      %1670 = func.call @cc_cons(%1668, %1669) : (i64, i64) -> i64
      %1671 = func.call @cc_values_pack(%1670) : (i64) -> i64
      %1672 = func.call @cc_symbol_value(%1668) : (i64) -> i64
      %1673 = func.call @cc_cons(%1661, %1672) : (i64, i64) -> i64
      %1674 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1675 = arith.constant 25 : i64
      %1676 = func.call @cc_make_string(%1674, %1675) : (!llvm.ptr, i64) -> i64
      %1677 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1678 = arith.constant 11 : i64
      %1679 = func.call @cc_make_string(%1677, %1678) : (!llvm.ptr, i64) -> i64
      %1680 = func.call @cc_intern(%1676, %1679) : (i64, i64) -> i64
      %1681 = func.call @cc_nil_value() : () -> i64
      %1682 = func.call @cc_cons(%1680, %1681) : (i64, i64) -> i64
      %1683 = func.call @cc_values_pack(%1682) : (i64) -> i64
      %1684 = func.call @cc_set_symbol_value(%1680, %1673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1673) : (i64) -> ()
    }
    %1685 = func.call @stack_pop_pointer() : () -> i64
    %1686 = llvm.mlir.addressof @str185 : !llvm.ptr
    %1687 = arith.constant 3 : i64
    %1688 = func.call @cc_make_string(%1686, %1687) : (!llvm.ptr, i64) -> i64
    %1689 = llvm.mlir.addressof @str186 : !llvm.ptr
    %1690 = arith.constant 7 : i64
    %1691 = func.call @cc_make_string(%1689, %1690) : (!llvm.ptr, i64) -> i64
    %1692 = func.call @cc_intern(%1688, %1691) : (i64, i64) -> i64
    %1693 = func.call @cc_nil_value() : () -> i64
    %1694 = func.call @cc_cons(%1692, %1693) : (i64, i64) -> i64
    %1695 = func.call @cc_values_pack(%1694) : (i64) -> i64
    func.call @stack_push_pointer(%1692) : (i64) -> ()
    %1696 = func.call @stack_pop_pointer() : () -> i64
    %1697 = llvm.mlir.addressof @str187 : !llvm.ptr
    %1698 = arith.constant 9 : i64
    %1699 = func.call @cc_make_string(%1697, %1698) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1699) : (i64) -> ()
    %1700 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1563) : (i64) -> ()
    %1701 = func.call @stack_pop_pointer() : () -> i64
    %1702 = func.call @cc_nil_value() : () -> i64
    %1703 = func.call @cc_errorp(%1696) : (i64) -> i64
    %1704 = arith.cmpi ne, %1703, %1702 : i64
    %1705 = arith.cmpi eq, %1702, %1702 : i64
    %1706 = arith.andi %1704, %1705 : i1
    %1707 = scf.if %1706 -> (i64) {
      scf.yield %1696 : i64
    } else {
      scf.yield %1702 : i64
    }
    %1708 = func.call @cc_errorp(%1700) : (i64) -> i64
    %1709 = arith.cmpi ne, %1708, %1702 : i64
    %1710 = arith.cmpi eq, %1707, %1702 : i64
    %1711 = arith.andi %1709, %1710 : i1
    %1712 = scf.if %1711 -> (i64) {
      scf.yield %1700 : i64
    } else {
      scf.yield %1707 : i64
    }
    %1713 = func.call @cc_errorp(%1701) : (i64) -> i64
    %1714 = arith.cmpi ne, %1713, %1702 : i64
    %1715 = arith.cmpi eq, %1712, %1702 : i64
    %1716 = arith.andi %1714, %1715 : i1
    %1717 = scf.if %1716 -> (i64) {
      scf.yield %1701 : i64
    } else {
      scf.yield %1712 : i64
    }
    %1718 = arith.cmpi ne, %1717, %1702 : i64
    scf.if %1718 {
      func.call @stack_push_pointer(%1717) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1696) : (i64) -> ()
      func.call @stack_push_pointer(%1700) : (i64) -> ()
      func.call @stack_push_pointer(%1701) : (i64) -> ()
      %1719 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1720 = func.call @cc_make_function_ref_const(%1719) : (!llvm.ptr) -> i64
      %1721 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1720, %1721) : (i64, i64) -> ()
    }
    %1722 = func.call @stack_pop_pointer() : () -> i64
    %1723 = llvm.mlir.addressof @str189 : !llvm.ptr
    %1724 = arith.constant 4 : i64
    %1725 = func.call @cc_make_string(%1723, %1724) : (!llvm.ptr, i64) -> i64
    %1726 = llvm.mlir.addressof @str190 : !llvm.ptr
    %1727 = arith.constant 7 : i64
    %1728 = func.call @cc_make_string(%1726, %1727) : (!llvm.ptr, i64) -> i64
    %1729 = func.call @cc_intern(%1725, %1728) : (i64, i64) -> i64
    %1730 = func.call @cc_nil_value() : () -> i64
    %1731 = func.call @cc_cons(%1729, %1730) : (i64, i64) -> i64
    %1732 = func.call @cc_values_pack(%1731) : (i64) -> i64
    func.call @stack_push_pointer(%1729) : (i64) -> ()
    %1733 = func.call @stack_pop_pointer() : () -> i64
    %1734 = llvm.mlir.addressof @str191 : !llvm.ptr
    %1735 = arith.constant 50 : i64
    %1736 = func.call @cc_make_string(%1734, %1735) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1736) : (i64) -> ()
    %1737 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1558) : (i64) -> ()
    %1738 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1561) : (i64) -> ()
    %1739 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1560) : (i64) -> ()
    %1740 = func.call @stack_pop_pointer() : () -> i64
    %1741 = func.call @cc_nil_value() : () -> i64
    %1742 = func.call @cc_errorp(%1733) : (i64) -> i64
    %1743 = arith.cmpi ne, %1742, %1741 : i64
    %1744 = arith.cmpi eq, %1741, %1741 : i64
    %1745 = arith.andi %1743, %1744 : i1
    %1746 = scf.if %1745 -> (i64) {
      scf.yield %1733 : i64
    } else {
      scf.yield %1741 : i64
    }
    %1747 = func.call @cc_errorp(%1737) : (i64) -> i64
    %1748 = arith.cmpi ne, %1747, %1741 : i64
    %1749 = arith.cmpi eq, %1746, %1741 : i64
    %1750 = arith.andi %1748, %1749 : i1
    %1751 = scf.if %1750 -> (i64) {
      scf.yield %1737 : i64
    } else {
      scf.yield %1746 : i64
    }
    %1752 = func.call @cc_errorp(%1738) : (i64) -> i64
    %1753 = arith.cmpi ne, %1752, %1741 : i64
    %1754 = arith.cmpi eq, %1751, %1741 : i64
    %1755 = arith.andi %1753, %1754 : i1
    %1756 = scf.if %1755 -> (i64) {
      scf.yield %1738 : i64
    } else {
      scf.yield %1751 : i64
    }
    %1757 = func.call @cc_errorp(%1739) : (i64) -> i64
    %1758 = arith.cmpi ne, %1757, %1741 : i64
    %1759 = arith.cmpi eq, %1756, %1741 : i64
    %1760 = arith.andi %1758, %1759 : i1
    %1761 = scf.if %1760 -> (i64) {
      scf.yield %1739 : i64
    } else {
      scf.yield %1756 : i64
    }
    %1762 = func.call @cc_errorp(%1740) : (i64) -> i64
    %1763 = arith.cmpi ne, %1762, %1741 : i64
    %1764 = arith.cmpi eq, %1761, %1741 : i64
    %1765 = arith.andi %1763, %1764 : i1
    %1766 = scf.if %1765 -> (i64) {
      scf.yield %1740 : i64
    } else {
      scf.yield %1761 : i64
    }
    %1767 = arith.cmpi ne, %1766, %1741 : i64
    scf.if %1767 {
      func.call @stack_push_pointer(%1766) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1733) : (i64) -> ()
      func.call @stack_push_pointer(%1737) : (i64) -> ()
      func.call @stack_push_pointer(%1738) : (i64) -> ()
      func.call @stack_push_pointer(%1739) : (i64) -> ()
      func.call @stack_push_pointer(%1740) : (i64) -> ()
      %1768 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1769 = func.call @cc_make_function_ref_const(%1768) : (!llvm.ptr) -> i64
      %1770 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%1769, %1770) : (i64, i64) -> ()
    }
    %1771 = func.call @stack_pop_pointer() : () -> i64
    %1772 = llvm.mlir.addressof @str193 : !llvm.ptr
    %1773 = arith.constant 4 : i64
    %1774 = func.call @cc_make_string(%1772, %1773) : (!llvm.ptr, i64) -> i64
    %1775 = llvm.mlir.addressof @str194 : !llvm.ptr
    %1776 = arith.constant 7 : i64
    %1777 = func.call @cc_make_string(%1775, %1776) : (!llvm.ptr, i64) -> i64
    %1778 = func.call @cc_intern(%1774, %1777) : (i64, i64) -> i64
    %1779 = func.call @cc_nil_value() : () -> i64
    %1780 = func.call @cc_cons(%1778, %1779) : (i64, i64) -> i64
    %1781 = func.call @cc_values_pack(%1780) : (i64) -> i64
    func.call @stack_push_pointer(%1778) : (i64) -> ()
    %1782 = func.call @stack_pop_pointer() : () -> i64
    %1783 = llvm.mlir.addressof @str195 : !llvm.ptr
    %1784 = arith.constant 24 : i64
    %1785 = func.call @cc_make_string(%1783, %1784) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%1785) : (i64) -> ()
    %1786 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1562) : (i64) -> ()
    %1787 = func.call @stack_pop_pointer() : () -> i64
    %1788 = func.call @cc_nil_value() : () -> i64
    %1789 = func.call @cc_errorp(%1782) : (i64) -> i64
    %1790 = arith.cmpi ne, %1789, %1788 : i64
    %1791 = arith.cmpi eq, %1788, %1788 : i64
    %1792 = arith.andi %1790, %1791 : i1
    %1793 = scf.if %1792 -> (i64) {
      scf.yield %1782 : i64
    } else {
      scf.yield %1788 : i64
    }
    %1794 = func.call @cc_errorp(%1786) : (i64) -> i64
    %1795 = arith.cmpi ne, %1794, %1788 : i64
    %1796 = arith.cmpi eq, %1793, %1788 : i64
    %1797 = arith.andi %1795, %1796 : i1
    %1798 = scf.if %1797 -> (i64) {
      scf.yield %1786 : i64
    } else {
      scf.yield %1793 : i64
    }
    %1799 = func.call @cc_errorp(%1787) : (i64) -> i64
    %1800 = arith.cmpi ne, %1799, %1788 : i64
    %1801 = arith.cmpi eq, %1798, %1788 : i64
    %1802 = arith.andi %1800, %1801 : i1
    %1803 = scf.if %1802 -> (i64) {
      scf.yield %1787 : i64
    } else {
      scf.yield %1798 : i64
    }
    %1804 = arith.cmpi ne, %1803, %1788 : i64
    scf.if %1804 {
      func.call @stack_push_pointer(%1803) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1782) : (i64) -> ()
      func.call @stack_push_pointer(%1786) : (i64) -> ()
      func.call @stack_push_pointer(%1787) : (i64) -> ()
      %1805 = llvm.mlir.addressof @str196 : !llvm.ptr
      %1806 = func.call @cc_make_function_ref_const(%1805) : (!llvm.ptr) -> i64
      %1807 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%1806, %1807) : (i64, i64) -> ()
    }
    %1808 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1559) : (i64) -> ()
    %1809 = func.call @stack_pop_pointer() : () -> i64
    %1810 = func.call @cc_nil_value() : () -> i64
    %1811 = arith.cmpi ne, %1809, %1810 : i64
    scf.if %1811 {
      %1812 = func.call @cc_nil_value() : () -> i64
      %1813 = func.call @cc_nil_value() : () -> i64
      %1814 = func.call @cc_errorp(%1812) : (i64) -> i64
      %1815 = arith.cmpi ne, %1814, %1813 : i64
      %1816 = scf.if %1815 -> (i64) {
        scf.yield %1812 : i64
      } else {
        %1817 = llvm.mlir.addressof @str197 : !llvm.ptr
        %1818 = arith.constant 4 : i64
        %1819 = func.call @cc_make_string(%1817, %1818) : (!llvm.ptr, i64) -> i64
        %1820 = llvm.mlir.addressof @str198 : !llvm.ptr
        %1821 = arith.constant 7 : i64
        %1822 = func.call @cc_make_string(%1820, %1821) : (!llvm.ptr, i64) -> i64
        %1823 = func.call @cc_intern(%1819, %1822) : (i64, i64) -> i64
        %1824 = func.call @cc_nil_value() : () -> i64
        %1825 = func.call @cc_cons(%1823, %1824) : (i64, i64) -> i64
        %1826 = func.call @cc_values_pack(%1825) : (i64) -> i64
        func.call @stack_push_pointer(%1823) : (i64) -> ()
        %1827 = func.call @stack_pop_pointer() : () -> i64
        %1828 = llvm.mlir.addressof @str199 : !llvm.ptr
        %1829 = arith.constant 2 : i64
        %1830 = func.call @cc_make_string(%1828, %1829) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1830) : (i64) -> ()
        %1831 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1559) : (i64) -> ()
        %1832 = func.call @stack_pop_pointer() : () -> i64
        %1833 = func.call @cc_nil_value() : () -> i64
        %1834 = func.call @cc_errorp(%1827) : (i64) -> i64
        %1835 = arith.cmpi ne, %1834, %1833 : i64
        %1836 = arith.cmpi eq, %1833, %1833 : i64
        %1837 = arith.andi %1835, %1836 : i1
        %1838 = scf.if %1837 -> (i64) {
          scf.yield %1827 : i64
        } else {
          scf.yield %1833 : i64
        }
        %1839 = func.call @cc_errorp(%1831) : (i64) -> i64
        %1840 = arith.cmpi ne, %1839, %1833 : i64
        %1841 = arith.cmpi eq, %1838, %1833 : i64
        %1842 = arith.andi %1840, %1841 : i1
        %1843 = scf.if %1842 -> (i64) {
          scf.yield %1831 : i64
        } else {
          scf.yield %1838 : i64
        }
        %1844 = func.call @cc_errorp(%1832) : (i64) -> i64
        %1845 = arith.cmpi ne, %1844, %1833 : i64
        %1846 = arith.cmpi eq, %1843, %1833 : i64
        %1847 = arith.andi %1845, %1846 : i1
        %1848 = scf.if %1847 -> (i64) {
          scf.yield %1832 : i64
        } else {
          scf.yield %1843 : i64
        }
        %1849 = arith.cmpi ne, %1848, %1833 : i64
        scf.if %1849 {
          func.call @stack_push_pointer(%1848) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1827) : (i64) -> ()
          func.call @stack_push_pointer(%1831) : (i64) -> ()
          func.call @stack_push_pointer(%1832) : (i64) -> ()
          %1850 = llvm.mlir.addressof @str200 : !llvm.ptr
          %1851 = func.call @cc_make_function_ref_const(%1850) : (!llvm.ptr) -> i64
          %1852 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1851, %1852) : (i64, i64) -> ()
        }
        %1853 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1853 : i64
      }
      func.call @stack_push_pointer(%1816) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %1854 = func.call @stack_pop_pointer() : () -> i64
    %1855 = func.call @cc_multiple_value_list(%1854) : (i64) -> i64
    %1856 = llvm.mlir.addressof @str201 : !llvm.ptr
    %1857 = arith.constant 37 : i64
    %1858 = func.call @cc_make_string(%1856, %1857) : (!llvm.ptr, i64) -> i64
    %1859 = func.call @cc_nil_value() : () -> i64
    %1860 = func.call @cc_intern(%1858, %1859) : (i64, i64) -> i64
    %1861 = func.call @cc_nil_value() : () -> i64
    %1862 = func.call @cc_cons(%1860, %1861) : (i64, i64) -> i64
    %1863 = func.call @cc_values_pack(%1862) : (i64) -> i64
    %1864 = func.call @cc_symbol_value(%1860) : (i64) -> i64
    %1865 = llvm.mlir.addressof @str202 : !llvm.ptr
    %1866 = arith.constant 38 : i64
    %1867 = func.call @cc_make_string(%1865, %1866) : (!llvm.ptr, i64) -> i64
    %1868 = func.call @cc_nil_value() : () -> i64
    %1869 = func.call @cc_intern(%1867, %1868) : (i64, i64) -> i64
    %1870 = func.call @cc_nil_value() : () -> i64
    %1871 = func.call @cc_cons(%1869, %1870) : (i64, i64) -> i64
    %1872 = func.call @cc_values_pack(%1871) : (i64) -> i64
    %1873 = func.call @cc_symbol_value(%1869) : (i64) -> i64
    %1874 = llvm.mlir.addressof @str203 : !llvm.ptr
    %1875 = arith.constant 39 : i64
    %1876 = func.call @cc_make_string(%1874, %1875) : (!llvm.ptr, i64) -> i64
    %1877 = func.call @cc_nil_value() : () -> i64
    %1878 = func.call @cc_intern(%1876, %1877) : (i64, i64) -> i64
    %1879 = func.call @cc_nil_value() : () -> i64
    %1880 = func.call @cc_cons(%1878, %1879) : (i64, i64) -> i64
    %1881 = func.call @cc_values_pack(%1880) : (i64) -> i64
    %1882 = func.call @cc_symbol_value(%1878) : (i64) -> i64
    %1883 = func.call @cc_nil_value() : () -> i64
    %1884 = arith.cmpi ne, %1864, %1883 : i64
    %1885 = scf.if %1884 -> (i64) {
      scf.yield %1882 : i64
    } else {
      scf.yield %1855 : i64
    }
    %1886 = func.call @cc_values_pack(%1885) : (i64) -> i64
    func.call @stack_push_pointer(%1886) : (i64) -> ()
    %1887 = func.call @stack_pop_pointer() : () -> i64
    %1888 = func.call @cc_multiple_value_list(%1887) : (i64) -> i64
    %1889 = llvm.mlir.addressof @str204 : !llvm.ptr
    %1890 = arith.constant 37 : i64
    %1891 = func.call @cc_make_string(%1889, %1890) : (!llvm.ptr, i64) -> i64
    %1892 = func.call @cc_nil_value() : () -> i64
    %1893 = func.call @cc_intern(%1891, %1892) : (i64, i64) -> i64
    %1894 = func.call @cc_nil_value() : () -> i64
    %1895 = func.call @cc_cons(%1893, %1894) : (i64, i64) -> i64
    %1896 = func.call @cc_values_pack(%1895) : (i64) -> i64
    %1897 = func.call @cc_symbol_value(%1893) : (i64) -> i64
    %1898 = llvm.mlir.addressof @str205 : !llvm.ptr
    %1899 = arith.constant 39 : i64
    %1900 = func.call @cc_make_string(%1898, %1899) : (!llvm.ptr, i64) -> i64
    %1901 = func.call @cc_nil_value() : () -> i64
    %1902 = func.call @cc_intern(%1900, %1901) : (i64, i64) -> i64
    %1903 = func.call @cc_nil_value() : () -> i64
    %1904 = func.call @cc_cons(%1902, %1903) : (i64, i64) -> i64
    %1905 = func.call @cc_values_pack(%1904) : (i64) -> i64
    %1906 = func.call @cc_symbol_value(%1902) : (i64) -> i64
    %1907 = func.call @cc_nil_value() : () -> i64
    %1908 = arith.cmpi ne, %1897, %1907 : i64
    %1909 = scf.if %1908 -> (i64) {
      scf.yield %1906 : i64
    } else {
      scf.yield %1888 : i64
    }
    %1910 = func.call @cc_values_pack(%1909) : (i64) -> i64
    func.call @stack_push_pointer(%1910) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%succeed-test"() {
    %1911 = llvm.mlir.addressof @str206 : !llvm.ptr
    %1912 = arith.constant 13 : i64
    %1913 = func.call @cc_make_string(%1911, %1912) : (!llvm.ptr, i64) -> i64
    %1914 = func.call @cc_nil_value() : () -> i64
    %1915 = func.call @cc_intern(%1913, %1914) : (i64, i64) -> i64
    %1916 = func.call @cc_nil_value() : () -> i64
    %1917 = func.call @cc_cons(%1915, %1916) : (i64, i64) -> i64
    %1918 = func.call @cc_values_pack(%1917) : (i64) -> i64
    %1919 = llvm.mlir.addressof @str207 : !llvm.ptr
    %1920 = arith.constant 4 : i64
    %1921 = func.call @cc_make_string(%1919, %1920) : (!llvm.ptr, i64) -> i64
    %1922 = func.call @cc_register_function_lambda_list_metadata_raw(%1915, %1921) : (i64, i64) -> i64
    %1923 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%1915, %1923) : (i64, i64) -> ()
    %1924 = func.call @stack_pop_pointer() : () -> i64
    %1925 = func.call @cc_nil_value() : () -> i64
    %1926 = llvm.mlir.addressof @str208 : !llvm.ptr
    %1927 = arith.constant 37 : i64
    %1928 = func.call @cc_make_string(%1926, %1927) : (!llvm.ptr, i64) -> i64
    %1929 = func.call @cc_nil_value() : () -> i64
    %1930 = func.call @cc_intern(%1928, %1929) : (i64, i64) -> i64
    %1931 = func.call @cc_nil_value() : () -> i64
    %1932 = func.call @cc_cons(%1930, %1931) : (i64, i64) -> i64
    %1933 = func.call @cc_values_pack(%1932) : (i64) -> i64
    %1934 = func.call @cc_set_symbol_value(%1930, %1925) : (i64, i64) -> i64
    %1935 = llvm.mlir.addressof @str209 : !llvm.ptr
    %1936 = arith.constant 38 : i64
    %1937 = func.call @cc_make_string(%1935, %1936) : (!llvm.ptr, i64) -> i64
    %1938 = func.call @cc_nil_value() : () -> i64
    %1939 = func.call @cc_intern(%1937, %1938) : (i64, i64) -> i64
    %1940 = func.call @cc_nil_value() : () -> i64
    %1941 = func.call @cc_cons(%1939, %1940) : (i64, i64) -> i64
    %1942 = func.call @cc_values_pack(%1941) : (i64) -> i64
    %1943 = func.call @cc_set_symbol_value(%1939, %1925) : (i64, i64) -> i64
    %1944 = llvm.mlir.addressof @str210 : !llvm.ptr
    %1945 = arith.constant 39 : i64
    %1946 = func.call @cc_make_string(%1944, %1945) : (!llvm.ptr, i64) -> i64
    %1947 = func.call @cc_nil_value() : () -> i64
    %1948 = func.call @cc_intern(%1946, %1947) : (i64, i64) -> i64
    %1949 = func.call @cc_nil_value() : () -> i64
    %1950 = func.call @cc_cons(%1948, %1949) : (i64, i64) -> i64
    %1951 = func.call @cc_values_pack(%1950) : (i64) -> i64
    %1952 = func.call @cc_set_symbol_value(%1948, %1925) : (i64, i64) -> i64
    %1953 = func.call @cc_nil_value() : () -> i64
    %1954 = llvm.mlir.addressof @str211 : !llvm.ptr
    %1955 = arith.constant 37 : i64
    %1956 = func.call @cc_make_string(%1954, %1955) : (!llvm.ptr, i64) -> i64
    %1957 = func.call @cc_nil_value() : () -> i64
    %1958 = func.call @cc_intern(%1956, %1957) : (i64, i64) -> i64
    %1959 = func.call @cc_nil_value() : () -> i64
    %1960 = func.call @cc_cons(%1958, %1959) : (i64, i64) -> i64
    %1961 = func.call @cc_values_pack(%1960) : (i64) -> i64
    %1962 = func.call @cc_set_symbol_value(%1958, %1953) : (i64, i64) -> i64
    %1963 = llvm.mlir.addressof @str212 : !llvm.ptr
    %1964 = arith.constant 38 : i64
    %1965 = func.call @cc_make_string(%1963, %1964) : (!llvm.ptr, i64) -> i64
    %1966 = func.call @cc_nil_value() : () -> i64
    %1967 = func.call @cc_intern(%1965, %1966) : (i64, i64) -> i64
    %1968 = func.call @cc_nil_value() : () -> i64
    %1969 = func.call @cc_cons(%1967, %1968) : (i64, i64) -> i64
    %1970 = func.call @cc_values_pack(%1969) : (i64) -> i64
    %1971 = func.call @cc_set_symbol_value(%1967, %1953) : (i64, i64) -> i64
    %1972 = llvm.mlir.addressof @str213 : !llvm.ptr
    %1973 = arith.constant 39 : i64
    %1974 = func.call @cc_make_string(%1972, %1973) : (!llvm.ptr, i64) -> i64
    %1975 = func.call @cc_nil_value() : () -> i64
    %1976 = func.call @cc_intern(%1974, %1975) : (i64, i64) -> i64
    %1977 = func.call @cc_nil_value() : () -> i64
    %1978 = func.call @cc_cons(%1976, %1977) : (i64, i64) -> i64
    %1979 = func.call @cc_values_pack(%1978) : (i64) -> i64
    %1980 = func.call @cc_set_symbol_value(%1976, %1953) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1924) : (i64) -> ()
    %1981 = llvm.mlir.addressof @str214 : !llvm.ptr
    %1982 = arith.constant 19 : i64
    %1983 = func.call @cc_make_string(%1981, %1982) : (!llvm.ptr, i64) -> i64
    %1984 = llvm.mlir.addressof @str215 : !llvm.ptr
    %1985 = arith.constant 11 : i64
    %1986 = func.call @cc_make_string(%1984, %1985) : (!llvm.ptr, i64) -> i64
    %1987 = func.call @cc_intern(%1983, %1986) : (i64, i64) -> i64
    %1988 = func.call @cc_nil_value() : () -> i64
    %1989 = func.call @cc_cons(%1987, %1988) : (i64, i64) -> i64
    %1990 = func.call @cc_values_pack(%1989) : (i64) -> i64
    %1991 = func.call @cc_symbol_value(%1987) : (i64) -> i64
    func.call @stack_push_pointer(%1991) : (i64) -> ()
    %1992 = func.call @stack_pop_pointer() : () -> i64
    %1993 = func.call @stack_pop_pointer() : () -> i64
    %1994 = func.call @cc_member(%1993, %1992) : (i64, i64) -> i64
    func.call @stack_push_pointer(%1994) : (i64) -> ()
    %1995 = func.call @stack_pop_pointer() : () -> i64
    %1996 = func.call @cc_nil_value() : () -> i64
    %1997 = arith.cmpi ne, %1995, %1996 : i64
    scf.if %1997 {
      func.call @stack_push_pointer(%1924) : (i64) -> ()
      %1998 = func.call @stack_pop_pointer() : () -> i64
      %1999 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2000 = arith.constant 25 : i64
      %2001 = func.call @cc_make_string(%1999, %2000) : (!llvm.ptr, i64) -> i64
      %2002 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2003 = arith.constant 11 : i64
      %2004 = func.call @cc_make_string(%2002, %2003) : (!llvm.ptr, i64) -> i64
      %2005 = func.call @cc_intern(%2001, %2004) : (i64, i64) -> i64
      %2006 = func.call @cc_nil_value() : () -> i64
      %2007 = func.call @cc_cons(%2005, %2006) : (i64, i64) -> i64
      %2008 = func.call @cc_values_pack(%2007) : (i64) -> i64
      %2009 = func.call @cc_symbol_value(%2005) : (i64) -> i64
      %2010 = func.call @cc_cons(%1998, %2009) : (i64, i64) -> i64
      %2011 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2012 = arith.constant 25 : i64
      %2013 = func.call @cc_make_string(%2011, %2012) : (!llvm.ptr, i64) -> i64
      %2014 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2015 = arith.constant 11 : i64
      %2016 = func.call @cc_make_string(%2014, %2015) : (!llvm.ptr, i64) -> i64
      %2017 = func.call @cc_intern(%2013, %2016) : (i64, i64) -> i64
      %2018 = func.call @cc_nil_value() : () -> i64
      %2019 = func.call @cc_cons(%2017, %2018) : (i64, i64) -> i64
      %2020 = func.call @cc_values_pack(%2019) : (i64) -> i64
      %2021 = func.call @cc_set_symbol_value(%2017, %2010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2010) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%1924) : (i64) -> ()
      %2022 = func.call @stack_pop_pointer() : () -> i64
      %2023 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2024 = arith.constant 23 : i64
      %2025 = func.call @cc_make_string(%2023, %2024) : (!llvm.ptr, i64) -> i64
      %2026 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2027 = arith.constant 11 : i64
      %2028 = func.call @cc_make_string(%2026, %2027) : (!llvm.ptr, i64) -> i64
      %2029 = func.call @cc_intern(%2025, %2028) : (i64, i64) -> i64
      %2030 = func.call @cc_nil_value() : () -> i64
      %2031 = func.call @cc_cons(%2029, %2030) : (i64, i64) -> i64
      %2032 = func.call @cc_values_pack(%2031) : (i64) -> i64
      %2033 = func.call @cc_symbol_value(%2029) : (i64) -> i64
      %2034 = func.call @cc_cons(%2022, %2033) : (i64, i64) -> i64
      %2035 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2036 = arith.constant 23 : i64
      %2037 = func.call @cc_make_string(%2035, %2036) : (!llvm.ptr, i64) -> i64
      %2038 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2039 = arith.constant 11 : i64
      %2040 = func.call @cc_make_string(%2038, %2039) : (!llvm.ptr, i64) -> i64
      %2041 = func.call @cc_intern(%2037, %2040) : (i64, i64) -> i64
      %2042 = func.call @cc_nil_value() : () -> i64
      %2043 = func.call @cc_cons(%2041, %2042) : (i64, i64) -> i64
      %2044 = func.call @cc_values_pack(%2043) : (i64) -> i64
      %2045 = func.call @cc_set_symbol_value(%2041, %2034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2034) : (i64) -> ()
    }
    %2046 = func.call @stack_pop_pointer() : () -> i64
    %2047 = llvm.mlir.addressof @str224 : !llvm.ptr
    %2048 = arith.constant 4 : i64
    %2049 = func.call @cc_make_string(%2047, %2048) : (!llvm.ptr, i64) -> i64
    %2050 = llvm.mlir.addressof @str225 : !llvm.ptr
    %2051 = arith.constant 7 : i64
    %2052 = func.call @cc_make_string(%2050, %2051) : (!llvm.ptr, i64) -> i64
    %2053 = func.call @cc_intern(%2049, %2052) : (i64, i64) -> i64
    %2054 = func.call @cc_nil_value() : () -> i64
    %2055 = func.call @cc_cons(%2053, %2054) : (i64, i64) -> i64
    %2056 = func.call @cc_values_pack(%2055) : (i64) -> i64
    func.call @stack_push_pointer(%2053) : (i64) -> ()
    %2057 = func.call @stack_pop_pointer() : () -> i64
    %2058 = llvm.mlir.addressof @str226 : !llvm.ptr
    %2059 = arith.constant 9 : i64
    %2060 = func.call @cc_make_string(%2058, %2059) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%2060) : (i64) -> ()
    %2061 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1924) : (i64) -> ()
    %2062 = func.call @stack_pop_pointer() : () -> i64
    %2063 = func.call @cc_nil_value() : () -> i64
    %2064 = func.call @cc_errorp(%2057) : (i64) -> i64
    %2065 = arith.cmpi ne, %2064, %2063 : i64
    %2066 = arith.cmpi eq, %2063, %2063 : i64
    %2067 = arith.andi %2065, %2066 : i1
    %2068 = scf.if %2067 -> (i64) {
      scf.yield %2057 : i64
    } else {
      scf.yield %2063 : i64
    }
    %2069 = func.call @cc_errorp(%2061) : (i64) -> i64
    %2070 = arith.cmpi ne, %2069, %2063 : i64
    %2071 = arith.cmpi eq, %2068, %2063 : i64
    %2072 = arith.andi %2070, %2071 : i1
    %2073 = scf.if %2072 -> (i64) {
      scf.yield %2061 : i64
    } else {
      scf.yield %2068 : i64
    }
    %2074 = func.call @cc_errorp(%2062) : (i64) -> i64
    %2075 = arith.cmpi ne, %2074, %2063 : i64
    %2076 = arith.cmpi eq, %2073, %2063 : i64
    %2077 = arith.andi %2075, %2076 : i1
    %2078 = scf.if %2077 -> (i64) {
      scf.yield %2062 : i64
    } else {
      scf.yield %2073 : i64
    }
    %2079 = arith.cmpi ne, %2078, %2063 : i64
    scf.if %2079 {
      func.call @stack_push_pointer(%2078) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%2057) : (i64) -> ()
      func.call @stack_push_pointer(%2061) : (i64) -> ()
      func.call @stack_push_pointer(%2062) : (i64) -> ()
      %2080 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2081 = func.call @cc_make_function_ref_const(%2080) : (!llvm.ptr) -> i64
      %2082 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%2081, %2082) : (i64, i64) -> ()
    }
    %2083 = func.call @stack_pop_pointer() : () -> i64
    %2084 = func.call @cc_multiple_value_list(%2083) : (i64) -> i64
    %2085 = llvm.mlir.addressof @str228 : !llvm.ptr
    %2086 = arith.constant 37 : i64
    %2087 = func.call @cc_make_string(%2085, %2086) : (!llvm.ptr, i64) -> i64
    %2088 = func.call @cc_nil_value() : () -> i64
    %2089 = func.call @cc_intern(%2087, %2088) : (i64, i64) -> i64
    %2090 = func.call @cc_nil_value() : () -> i64
    %2091 = func.call @cc_cons(%2089, %2090) : (i64, i64) -> i64
    %2092 = func.call @cc_values_pack(%2091) : (i64) -> i64
    %2093 = func.call @cc_symbol_value(%2089) : (i64) -> i64
    %2094 = llvm.mlir.addressof @str229 : !llvm.ptr
    %2095 = arith.constant 38 : i64
    %2096 = func.call @cc_make_string(%2094, %2095) : (!llvm.ptr, i64) -> i64
    %2097 = func.call @cc_nil_value() : () -> i64
    %2098 = func.call @cc_intern(%2096, %2097) : (i64, i64) -> i64
    %2099 = func.call @cc_nil_value() : () -> i64
    %2100 = func.call @cc_cons(%2098, %2099) : (i64, i64) -> i64
    %2101 = func.call @cc_values_pack(%2100) : (i64) -> i64
    %2102 = func.call @cc_symbol_value(%2098) : (i64) -> i64
    %2103 = llvm.mlir.addressof @str230 : !llvm.ptr
    %2104 = arith.constant 39 : i64
    %2105 = func.call @cc_make_string(%2103, %2104) : (!llvm.ptr, i64) -> i64
    %2106 = func.call @cc_nil_value() : () -> i64
    %2107 = func.call @cc_intern(%2105, %2106) : (i64, i64) -> i64
    %2108 = func.call @cc_nil_value() : () -> i64
    %2109 = func.call @cc_cons(%2107, %2108) : (i64, i64) -> i64
    %2110 = func.call @cc_values_pack(%2109) : (i64) -> i64
    %2111 = func.call @cc_symbol_value(%2107) : (i64) -> i64
    %2112 = func.call @cc_nil_value() : () -> i64
    %2113 = arith.cmpi ne, %2093, %2112 : i64
    %2114 = scf.if %2113 -> (i64) {
      scf.yield %2111 : i64
    } else {
      scf.yield %2084 : i64
    }
    %2115 = func.call @cc_values_pack(%2114) : (i64) -> i64
    func.call @stack_push_pointer(%2115) : (i64) -> ()
    %2116 = func.call @stack_pop_pointer() : () -> i64
    %2117 = func.call @cc_multiple_value_list(%2116) : (i64) -> i64
    %2118 = llvm.mlir.addressof @str231 : !llvm.ptr
    %2119 = arith.constant 37 : i64
    %2120 = func.call @cc_make_string(%2118, %2119) : (!llvm.ptr, i64) -> i64
    %2121 = func.call @cc_nil_value() : () -> i64
    %2122 = func.call @cc_intern(%2120, %2121) : (i64, i64) -> i64
    %2123 = func.call @cc_nil_value() : () -> i64
    %2124 = func.call @cc_cons(%2122, %2123) : (i64, i64) -> i64
    %2125 = func.call @cc_values_pack(%2124) : (i64) -> i64
    %2126 = func.call @cc_symbol_value(%2122) : (i64) -> i64
    %2127 = llvm.mlir.addressof @str232 : !llvm.ptr
    %2128 = arith.constant 39 : i64
    %2129 = func.call @cc_make_string(%2127, %2128) : (!llvm.ptr, i64) -> i64
    %2130 = func.call @cc_nil_value() : () -> i64
    %2131 = func.call @cc_intern(%2129, %2130) : (i64, i64) -> i64
    %2132 = func.call @cc_nil_value() : () -> i64
    %2133 = func.call @cc_cons(%2131, %2132) : (i64, i64) -> i64
    %2134 = func.call @cc_values_pack(%2133) : (i64) -> i64
    %2135 = func.call @cc_symbol_value(%2131) : (i64) -> i64
    %2136 = func.call @cc_nil_value() : () -> i64
    %2137 = arith.cmpi ne, %2126, %2136 : i64
    %2138 = scf.if %2137 -> (i64) {
      scf.yield %2135 : i64
    } else {
      scf.yield %2117 : i64
    }
    %2139 = func.call @cc_values_pack(%2138) : (i64) -> i64
    func.call @stack_push_pointer(%2139) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%%test"() {
    %2140 = llvm.mlir.addressof @str233 : !llvm.ptr
    %2141 = arith.constant 5 : i64
    %2142 = func.call @cc_make_string(%2140, %2141) : (!llvm.ptr, i64) -> i64
    %2143 = func.call @cc_nil_value() : () -> i64
    %2144 = func.call @cc_intern(%2142, %2143) : (i64, i64) -> i64
    %2145 = func.call @cc_nil_value() : () -> i64
    %2146 = func.call @cc_cons(%2144, %2145) : (i64, i64) -> i64
    %2147 = func.call @cc_values_pack(%2146) : (i64) -> i64
    %2148 = llvm.mlir.addressof @str234 : !llvm.ptr
    %2149 = arith.constant 41 : i64
    %2150 = func.call @cc_make_string(%2148, %2149) : (!llvm.ptr, i64) -> i64
    %2151 = func.call @cc_register_function_lambda_list_metadata_raw(%2144, %2150) : (i64, i64) -> i64
    %2152 = arith.constant 6 : i64
    func.call @cc_runtime_debug_stack_push_call(%2144, %2152) : (i64, i64) -> ()
    %2153 = func.call @stack_pop_pointer() : () -> i64
    %2154 = arith.constant 0 : i64
    %2155 = func.call @cc_arg(%2153, %2154) : (i64, i64) -> i64
    %2156 = arith.constant 4 : i64
    %2157 = func.call @cc_arg(%2153, %2156) : (i64, i64) -> i64
    %2158 = arith.constant 8 : i64
    %2159 = func.call @cc_arg(%2153, %2158) : (i64, i64) -> i64
    %2160 = arith.constant 12 : i64
    %2161 = func.call @cc_arg(%2153, %2160) : (i64, i64) -> i64
    %2162 = llvm.mlir.addressof @str235 : !llvm.ptr
    %2163 = arith.constant 11 : i64
    %2164 = func.call @cc_make_string(%2162, %2163) : (!llvm.ptr, i64) -> i64
    %2165 = func.call @cc_nil_value() : () -> i64
    %2166 = func.call @cc_intern(%2164, %2165) : (i64, i64) -> i64
    %2167 = func.call @cc_nil_value() : () -> i64
    %2168 = func.call @cc_cons(%2166, %2167) : (i64, i64) -> i64
    %2169 = func.call @cc_values_pack(%2168) : (i64) -> i64
    %2170 = func.call @cc_arg(%2153, %2166) : (i64, i64) -> i64
    %2171 = func.call @cc_arg_present(%2153, %2166) : (i64, i64) -> i64
    %2172 = func.call @cc_nil_value() : () -> i64
    %2173 = arith.cmpi ne, %2171, %2172 : i64
    %2174 = scf.if %2173 -> (i64) {
      scf.yield %2170 : i64
    } else {
      scf.yield %2172 : i64
    }
    %2175 = llvm.mlir.addressof @str236 : !llvm.ptr
    %2176 = arith.constant 4 : i64
    %2177 = func.call @cc_make_string(%2175, %2176) : (!llvm.ptr, i64) -> i64
    %2178 = func.call @cc_nil_value() : () -> i64
    %2179 = func.call @cc_intern(%2177, %2178) : (i64, i64) -> i64
    %2180 = func.call @cc_nil_value() : () -> i64
    %2181 = func.call @cc_cons(%2179, %2180) : (i64, i64) -> i64
    %2182 = func.call @cc_values_pack(%2181) : (i64) -> i64
    %2183 = func.call @cc_arg(%2153, %2179) : (i64, i64) -> i64
    %2184 = func.call @cc_arg_present(%2153, %2179) : (i64, i64) -> i64
    %2185 = func.call @cc_nil_value() : () -> i64
    %2186 = arith.cmpi ne, %2184, %2185 : i64
    %2187 = scf.if %2186 -> (i64) {
      scf.yield %2183 : i64
    } else {
      %2188 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2189 = arith.constant 6 : i64
      %2190 = func.call @cc_make_string(%2188, %2189) : (!llvm.ptr, i64) -> i64
      %2191 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2192 = arith.constant 11 : i64
      %2193 = func.call @cc_make_string(%2191, %2192) : (!llvm.ptr, i64) -> i64
      %2194 = func.call @cc_intern(%2190, %2193) : (i64, i64) -> i64
      %2195 = func.call @cc_nil_value() : () -> i64
      %2196 = func.call @cc_cons(%2194, %2195) : (i64, i64) -> i64
      %2197 = func.call @cc_values_pack(%2196) : (i64) -> i64
      func.call @stack_push_pointer(%2194) : (i64) -> ()
      %2198 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2198 : i64
    }
    %2199 = func.call @cc_nil_value() : () -> i64
    %2200 = llvm.mlir.addressof @str239 : !llvm.ptr
    %2201 = arith.constant 37 : i64
    %2202 = func.call @cc_make_string(%2200, %2201) : (!llvm.ptr, i64) -> i64
    %2203 = func.call @cc_nil_value() : () -> i64
    %2204 = func.call @cc_intern(%2202, %2203) : (i64, i64) -> i64
    %2205 = func.call @cc_nil_value() : () -> i64
    %2206 = func.call @cc_cons(%2204, %2205) : (i64, i64) -> i64
    %2207 = func.call @cc_values_pack(%2206) : (i64) -> i64
    %2208 = func.call @cc_set_symbol_value(%2204, %2199) : (i64, i64) -> i64
    %2209 = llvm.mlir.addressof @str240 : !llvm.ptr
    %2210 = arith.constant 38 : i64
    %2211 = func.call @cc_make_string(%2209, %2210) : (!llvm.ptr, i64) -> i64
    %2212 = func.call @cc_nil_value() : () -> i64
    %2213 = func.call @cc_intern(%2211, %2212) : (i64, i64) -> i64
    %2214 = func.call @cc_nil_value() : () -> i64
    %2215 = func.call @cc_cons(%2213, %2214) : (i64, i64) -> i64
    %2216 = func.call @cc_values_pack(%2215) : (i64) -> i64
    %2217 = func.call @cc_set_symbol_value(%2213, %2199) : (i64, i64) -> i64
    %2218 = llvm.mlir.addressof @str241 : !llvm.ptr
    %2219 = arith.constant 39 : i64
    %2220 = func.call @cc_make_string(%2218, %2219) : (!llvm.ptr, i64) -> i64
    %2221 = func.call @cc_nil_value() : () -> i64
    %2222 = func.call @cc_intern(%2220, %2221) : (i64, i64) -> i64
    %2223 = func.call @cc_nil_value() : () -> i64
    %2224 = func.call @cc_cons(%2222, %2223) : (i64, i64) -> i64
    %2225 = func.call @cc_values_pack(%2224) : (i64) -> i64
    %2226 = func.call @cc_set_symbol_value(%2222, %2199) : (i64, i64) -> i64
    %2227 = func.call @cc_nil_value() : () -> i64
    %2228 = llvm.mlir.addressof @str242 : !llvm.ptr
    %2229 = arith.constant 37 : i64
    %2230 = func.call @cc_make_string(%2228, %2229) : (!llvm.ptr, i64) -> i64
    %2231 = func.call @cc_nil_value() : () -> i64
    %2232 = func.call @cc_intern(%2230, %2231) : (i64, i64) -> i64
    %2233 = func.call @cc_nil_value() : () -> i64
    %2234 = func.call @cc_cons(%2232, %2233) : (i64, i64) -> i64
    %2235 = func.call @cc_values_pack(%2234) : (i64) -> i64
    %2236 = func.call @cc_set_symbol_value(%2232, %2227) : (i64, i64) -> i64
    %2237 = llvm.mlir.addressof @str243 : !llvm.ptr
    %2238 = arith.constant 38 : i64
    %2239 = func.call @cc_make_string(%2237, %2238) : (!llvm.ptr, i64) -> i64
    %2240 = func.call @cc_nil_value() : () -> i64
    %2241 = func.call @cc_intern(%2239, %2240) : (i64, i64) -> i64
    %2242 = func.call @cc_nil_value() : () -> i64
    %2243 = func.call @cc_cons(%2241, %2242) : (i64, i64) -> i64
    %2244 = func.call @cc_values_pack(%2243) : (i64) -> i64
    %2245 = func.call @cc_set_symbol_value(%2241, %2227) : (i64, i64) -> i64
    %2246 = llvm.mlir.addressof @str244 : !llvm.ptr
    %2247 = arith.constant 39 : i64
    %2248 = func.call @cc_make_string(%2246, %2247) : (!llvm.ptr, i64) -> i64
    %2249 = func.call @cc_nil_value() : () -> i64
    %2250 = func.call @cc_intern(%2248, %2249) : (i64, i64) -> i64
    %2251 = func.call @cc_nil_value() : () -> i64
    %2252 = func.call @cc_cons(%2250, %2251) : (i64, i64) -> i64
    %2253 = func.call @cc_values_pack(%2252) : (i64) -> i64
    %2254 = func.call @cc_set_symbol_value(%2250, %2227) : (i64, i64) -> i64
    %2255 = llvm.mlir.addressof @str245 : !llvm.ptr
    %2256 = arith.constant 21 : i64
    %2257 = func.call @cc_make_string(%2255, %2256) : (!llvm.ptr, i64) -> i64
    %2258 = llvm.mlir.addressof @str246 : !llvm.ptr
    %2259 = arith.constant 11 : i64
    %2260 = func.call @cc_make_string(%2258, %2259) : (!llvm.ptr, i64) -> i64
    %2261 = func.call @cc_intern(%2257, %2260) : (i64, i64) -> i64
    %2262 = func.call @cc_nil_value() : () -> i64
    %2263 = func.call @cc_cons(%2261, %2262) : (i64, i64) -> i64
    %2264 = func.call @cc_values_pack(%2263) : (i64) -> i64
    %2265 = func.call @cc_symbol_value(%2261) : (i64) -> i64
    func.call @stack_push_pointer(%2265) : (i64) -> ()
    %2266 = func.call @stack_pop_pointer() : () -> i64
    %2267 = func.call @cc_nil_value() : () -> i64
    %2268 = arith.cmpi ne, %2266, %2267 : i64
    scf.if %2268 {
      %2269 = func.call @cc_nil_value() : () -> i64
      %2270 = func.call @cc_nil_value() : () -> i64
      %2271 = func.call @cc_errorp(%2269) : (i64) -> i64
      %2272 = arith.cmpi ne, %2271, %2270 : i64
      %2273 = scf.if %2272 -> (i64) {
        scf.yield %2269 : i64
      } else {
        %2274 = llvm.mlir.addressof @str247 : !llvm.ptr
        %2275 = arith.constant 14 : i64
        %2276 = func.call @cc_make_string(%2274, %2275) : (!llvm.ptr, i64) -> i64
        %2277 = llvm.mlir.addressof @str248 : !llvm.ptr
        %2278 = arith.constant 11 : i64
        %2279 = func.call @cc_make_string(%2277, %2278) : (!llvm.ptr, i64) -> i64
        %2280 = func.call @cc_intern(%2276, %2279) : (i64, i64) -> i64
        %2281 = func.call @cc_nil_value() : () -> i64
        %2282 = func.call @cc_cons(%2280, %2281) : (i64, i64) -> i64
        %2283 = func.call @cc_values_pack(%2282) : (i64) -> i64
        %2284 = func.call @cc_symbol_value(%2280) : (i64) -> i64
        func.call @stack_push_pointer(%2284) : (i64) -> ()
        %2285 = func.call @stack_pop_pointer() : () -> i64
        %2286 = llvm.mlir.addressof @str249 : !llvm.ptr
        %2287 = arith.constant 21 : i64
        %2288 = func.call @cc_make_string(%2286, %2287) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%2288) : (i64) -> ()
        %2289 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2155) : (i64) -> ()
        %2290 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2285) : (i64) -> ()
        func.call @stack_push_pointer(%2289) : (i64) -> ()
        func.call @stack_push_pointer(%2290) : (i64) -> ()
        %2291 = llvm.mlir.addressof @str250 : !llvm.ptr
        %2292 = func.call @cc_make_function_ref_const(%2291) : (!llvm.ptr) -> i64
        %2293 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%2292, %2293) : (i64, i64) -> ()
        %2294 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2294 : i64
      }
      func.call @stack_push_pointer(%2273) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %2295 = func.call @stack_pop_pointer() : () -> i64
    %2296 = llvm.mlir.addressof @str251 : !llvm.ptr
    %2297 = arith.constant 13 : i64
    %2298 = func.call @cc_make_string(%2296, %2297) : (!llvm.ptr, i64) -> i64
    %2299 = llvm.mlir.addressof @str252 : !llvm.ptr
    %2300 = arith.constant 11 : i64
    %2301 = func.call @cc_make_string(%2299, %2300) : (!llvm.ptr, i64) -> i64
    %2302 = func.call @cc_intern(%2298, %2301) : (i64, i64) -> i64
    %2303 = func.call @cc_nil_value() : () -> i64
    %2304 = func.call @cc_cons(%2302, %2303) : (i64, i64) -> i64
    %2305 = func.call @cc_values_pack(%2304) : (i64) -> i64
    %2306 = func.call @cc_symbol_value(%2302) : (i64) -> i64
    func.call @stack_push_pointer(%2306) : (i64) -> ()
    %2307 = func.call @stack_pop_pointer() : () -> i64
    %2308 = func.call @cc_nil_value() : () -> i64
    %2309 = arith.cmpi ne, %2307, %2308 : i64
    scf.if %2309 {
      %2310 = func.call @cc_nil_value() : () -> i64
      %2311 = func.call @cc_nil_value() : () -> i64
      %2312 = func.call @cc_errorp(%2310) : (i64) -> i64
      %2313 = arith.cmpi ne, %2312, %2311 : i64
      %2314 = scf.if %2313 -> (i64) {
        scf.yield %2310 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %2315 = func.call @stack_pop_pointer() : () -> i64
        %2316 = func.call @cc_multiple_value_list(%2315) : (i64) -> i64
        %2317 = func.call @cc_t_value() : () -> i64
        %2318 = llvm.mlir.addressof @str253 : !llvm.ptr
        %2319 = arith.constant 37 : i64
        %2320 = func.call @cc_make_string(%2318, %2319) : (!llvm.ptr, i64) -> i64
        %2321 = func.call @cc_nil_value() : () -> i64
        %2322 = func.call @cc_intern(%2320, %2321) : (i64, i64) -> i64
        %2323 = func.call @cc_nil_value() : () -> i64
        %2324 = func.call @cc_cons(%2322, %2323) : (i64, i64) -> i64
        %2325 = func.call @cc_values_pack(%2324) : (i64) -> i64
        %2326 = func.call @cc_set_symbol_value(%2322, %2317) : (i64, i64) -> i64
        %2327 = llvm.mlir.addressof @str254 : !llvm.ptr
        %2328 = arith.constant 38 : i64
        %2329 = func.call @cc_make_string(%2327, %2328) : (!llvm.ptr, i64) -> i64
        %2330 = func.call @cc_nil_value() : () -> i64
        %2331 = func.call @cc_intern(%2329, %2330) : (i64, i64) -> i64
        %2332 = func.call @cc_nil_value() : () -> i64
        %2333 = func.call @cc_cons(%2331, %2332) : (i64, i64) -> i64
        %2334 = func.call @cc_values_pack(%2333) : (i64) -> i64
        %2335 = func.call @cc_set_symbol_value(%2331, %2315) : (i64, i64) -> i64
        %2336 = llvm.mlir.addressof @str255 : !llvm.ptr
        %2337 = arith.constant 39 : i64
        %2338 = func.call @cc_make_string(%2336, %2337) : (!llvm.ptr, i64) -> i64
        %2339 = func.call @cc_nil_value() : () -> i64
        %2340 = func.call @cc_intern(%2338, %2339) : (i64, i64) -> i64
        %2341 = func.call @cc_nil_value() : () -> i64
        %2342 = func.call @cc_cons(%2340, %2341) : (i64, i64) -> i64
        %2343 = func.call @cc_values_pack(%2342) : (i64) -> i64
        %2344 = func.call @cc_set_symbol_value(%2340, %2316) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2315) : (i64) -> ()
        %2345 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2345 : i64
      }
      func.call @stack_push_pointer(%2314) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %2346 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%2155) : (i64) -> ()
    %2347 = func.call @stack_pop_pointer() : () -> i64
    %2348 = func.call @cc_nil_value() : () -> i64
    %2349 = func.call @cc_errorp(%2347) : (i64) -> i64
    %2350 = arith.cmpi ne, %2349, %2348 : i64
    %2351 = arith.cmpi eq, %2348, %2348 : i64
    %2352 = arith.andi %2350, %2351 : i1
    %2353 = scf.if %2352 -> (i64) {
      scf.yield %2347 : i64
    } else {
      scf.yield %2348 : i64
    }
    %2354 = arith.cmpi ne, %2353, %2348 : i64
    scf.if %2354 {
      func.call @stack_push_pointer(%2353) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%2347) : (i64) -> ()
      %2355 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2356 = func.call @cc_make_function_ref_const(%2355) : (!llvm.ptr) -> i64
      %2357 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%2356, %2357) : (i64, i64) -> ()
    }
    %2358 = func.call @stack_pop_pointer() : () -> i64
    %2359 = func.call @cc_push_ignore_errors_trap() : () -> i64
    func.call @cc_clear_multiple_values() : () -> ()
    %2360 = func.call @cc_nil_value() : () -> i64
    %2361 = func.call @cc_nil_value() : () -> i64
    %2362 = func.call @cc_errorp(%2360) : (i64) -> i64
    %2363 = arith.cmpi ne, %2362, %2361 : i64
    %2364 = scf.if %2363 -> (i64) {
      scf.yield %2360 : i64
    } else {
      func.call @cc_clear_multiple_values() : () -> ()
      func.call @stack_push_pointer(%2159) : (i64) -> ()
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%2365, %2366) : (i64, i64) -> ()
      %2367 = func.call @stack_pop_pointer() : () -> i64
      %2368 = func.call @cc_errorp(%2367) : (i64) -> i64
      %2369 = func.call @cc_nil_value() : () -> i64
      %2370 = arith.cmpi ne, %2368, %2369 : i64
      scf.if %2370 {
        func.call @stack_push_pointer(%2367) : (i64) -> ()
      } else {
        %2371 = func.call @cc_multiple_value_list(%2367) : (i64) -> i64
        func.call @stack_push_pointer(%2371) : (i64) -> ()
      }
      %2372 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2373 = func.call @stack_pop_pointer() : () -> i64
      %2374 = func.call @cc_nil_value() : () -> i64
      %2375 = func.call @cc_maybe_error_from_multiple_value_list(%2372) : (i64) -> i64
      %2376 = func.call @cc_errorp(%2375) : (i64) -> i64
      %2377 = arith.cmpi ne, %2376, %2374 : i64
      %2378 = arith.cmpi eq, %2374, %2374 : i64
      %2379 = arith.andi %2377, %2378 : i1
      %2380 = scf.if %2379 -> (i64) {
        scf.yield %2375 : i64
      } else {
        scf.yield %2374 : i64
      }
      %2381 = arith.cmpi ne, %2380, %2374 : i64
      scf.if %2381 {
        func.call @stack_push_pointer(%2380) : (i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
        %2382 = func.call @stack_pop_pointer() : () -> i64
        %2383 = func.call @cc_cons(%2373, %2382) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2383) : (i64) -> ()
        %2384 = func.call @stack_pop_pointer() : () -> i64
        %2385 = func.call @cc_cons(%2372, %2384) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2385) : (i64) -> ()
        %2386 = func.call @stack_pop_pointer() : () -> i64
        %2387 = func.call @cc_values_pack(%2386) : (i64) -> i64
        func.call @stack_push_pointer(%2387) : (i64) -> ()
      }
      %2388 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2388 : i64
    }
    func.call @stack_push_pointer(%2364) : (i64) -> ()
    %2389 = func.call @stack_pop_pointer() : () -> i64
    %2390 = func.call @cc_pop_ignore_errors_trap() : () -> i64
    %2391 = func.call @cc_errorp(%2389) : (i64) -> i64
    %2392 = func.call @cc_nil_value() : () -> i64
    %2393 = arith.cmpi ne, %2391, %2392 : i64
    scf.if %2393 {
      %2394 = func.call @cc_condition_value(%2389) : (i64) -> i64
      %2395 = func.call @cc_values2(%2392, %2394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2395) : (i64) -> ()
    } else {
      %2396 = func.call @cc_multiple_value_list(%2389) : (i64) -> i64
      %2397 = func.call @cc_values_pack(%2396) : (i64) -> i64
      func.call @stack_push_pointer(%2397) : (i64) -> ()
    }
    %2398 = func.call @stack_pop_pointer() : () -> i64
    %2399 = func.call @cc_multiple_value_list(%2398) : (i64) -> i64
    %2400 = arith.constant 0 : i64
    %2401 = func.call @cc_box_fixnum(%2400) : (i64) -> i64
    %2402 = func.call @cc_nth(%2401, %2399) : (i64, i64) -> i64
    %2403 = arith.constant 1 : i64
    %2404 = func.call @cc_box_fixnum(%2403) : (i64) -> i64
    %2405 = func.call @cc_nth(%2404, %2399) : (i64, i64) -> i64
    func.call @stack_push_pointer(%2405) : (i64) -> ()
    %2406 = func.call @stack_pop_pointer() : () -> i64
    %2407 = func.call @cc_nil_value() : () -> i64
    %2408 = arith.cmpi ne, %2406, %2407 : i64
    scf.if %2408 {
      func.call @stack_push_pointer(%2155) : (i64) -> ()
      %2409 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2157) : (i64) -> ()
      %2410 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2161) : (i64) -> ()
      %2411 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2405) : (i64) -> ()
      %2412 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2174) : (i64) -> ()
      %2413 = func.call @stack_pop_pointer() : () -> i64
      %2414 = func.call @cc_nil_value() : () -> i64
      %2415 = func.call @cc_errorp(%2409) : (i64) -> i64
      %2416 = arith.cmpi ne, %2415, %2414 : i64
      %2417 = arith.cmpi eq, %2414, %2414 : i64
      %2418 = arith.andi %2416, %2417 : i1
      %2419 = scf.if %2418 -> (i64) {
        scf.yield %2409 : i64
      } else {
        scf.yield %2414 : i64
      }
      %2420 = func.call @cc_errorp(%2410) : (i64) -> i64
      %2421 = arith.cmpi ne, %2420, %2414 : i64
      %2422 = arith.cmpi eq, %2419, %2414 : i64
      %2423 = arith.andi %2421, %2422 : i1
      %2424 = scf.if %2423 -> (i64) {
        scf.yield %2410 : i64
      } else {
        scf.yield %2419 : i64
      }
      %2425 = func.call @cc_errorp(%2411) : (i64) -> i64
      %2426 = arith.cmpi ne, %2425, %2414 : i64
      %2427 = arith.cmpi eq, %2424, %2414 : i64
      %2428 = arith.andi %2426, %2427 : i1
      %2429 = scf.if %2428 -> (i64) {
        scf.yield %2411 : i64
      } else {
        scf.yield %2424 : i64
      }
      %2430 = func.call @cc_errorp(%2412) : (i64) -> i64
      %2431 = arith.cmpi ne, %2430, %2414 : i64
      %2432 = arith.cmpi eq, %2429, %2414 : i64
      %2433 = arith.andi %2431, %2432 : i1
      %2434 = scf.if %2433 -> (i64) {
        scf.yield %2412 : i64
      } else {
        scf.yield %2429 : i64
      }
      %2435 = func.call @cc_errorp(%2413) : (i64) -> i64
      %2436 = arith.cmpi ne, %2435, %2414 : i64
      %2437 = arith.cmpi eq, %2434, %2414 : i64
      %2438 = arith.andi %2436, %2437 : i1
      %2439 = scf.if %2438 -> (i64) {
        scf.yield %2413 : i64
      } else {
        scf.yield %2434 : i64
      }
      %2440 = arith.cmpi ne, %2439, %2414 : i64
      scf.if %2440 {
        func.call @stack_push_pointer(%2439) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2409) : (i64) -> ()
        func.call @stack_push_pointer(%2410) : (i64) -> ()
        func.call @stack_push_pointer(%2411) : (i64) -> ()
        func.call @stack_push_pointer(%2412) : (i64) -> ()
        func.call @stack_push_pointer(%2413) : (i64) -> ()
        %2441 = llvm.mlir.addressof @str257 : !llvm.ptr
        %2442 = func.call @cc_make_function_ref_const(%2441) : (!llvm.ptr) -> i64
        %2443 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%2442, %2443) : (i64, i64) -> ()
      }
    } else {
      %2444 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2161) : (i64) -> ()
      %2445 = func.call @stack_pop_pointer() : () -> i64
      %2446 = func.call @cc_length(%2445) : (i64) -> i64
      func.call @stack_push_pointer(%2446) : (i64) -> ()
      %2447 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2402) : (i64) -> ()
      %2448 = func.call @stack_pop_pointer() : () -> i64
      %2449 = func.call @cc_length(%2448) : (i64) -> i64
      func.call @stack_push_pointer(%2449) : (i64) -> ()
      %2450 = func.call @stack_pop_pointer() : () -> i64
      %2451 = arith.constant 1 : i1
      %2453 = arith.constant 3 : i64
      %2452 = arith.andi %2447, %2453 : i64
      %2454 = arith.constant 0 : i64
      %2455 = arith.cmpi eq, %2452, %2454 : i64
      %2457 = arith.constant 3 : i64
      %2456 = arith.andi %2450, %2457 : i64
      %2458 = arith.constant 0 : i64
      %2459 = arith.cmpi eq, %2456, %2458 : i64
      %2460 = arith.andi %2455, %2459 : i1
      %2461 = scf.if %2460 -> (i1) {
        %2462 = arith.constant 2 : i64
        %2463 = arith.shrsi %2447, %2462 : i64
        %2464 = arith.constant 2 : i64
        %2465 = arith.shrsi %2450, %2464 : i64
        %2466 = arith.cmpi eq, %2463, %2465 : i64
        scf.yield %2466 : i1
      } else {
        %2467 = func.call @cc_eq(%2447, %2450) : (i64, i64) -> i64
        %2468 = func.call @cc_nil_value() : () -> i64
        %2469 = arith.cmpi ne, %2467, %2468 : i64
        scf.yield %2469 : i1
      }
      %2470 = arith.andi %2451, %2461 : i1
      %2471 = func.call @cc_nil_value() : () -> i64
      %2472 = func.call @cc_t_value() : () -> i64
      %2473 = scf.if %2470 -> (i64) {
        scf.yield %2472 : i64
      } else {
        scf.yield %2471 : i64
      }
      func.call @stack_push_pointer(%2473) : (i64) -> ()
      %2474 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2187) : (i64) -> ()
      func.call @stack_push_pointer(%2402) : (i64) -> ()
      func.call @stack_push_pointer(%2161) : (i64) -> ()
      %2475 = func.call @stack_pop_pointer() : () -> i64
      %2476 = func.call @stack_pop_pointer() : () -> i64
      %2477 = func.call @stack_pop_pointer() : () -> i64
      %2478 = func.call @cc_every2(%2477, %2476, %2475) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%2478) : (i64) -> ()
      %2479 = func.call @stack_pop_pointer() : () -> i64
      %2480 = func.call @cc_cons(%2479, %2444) : (i64, i64) -> i64
      %2481 = func.call @cc_cons(%2474, %2480) : (i64, i64) -> i64
      %2482 = func.call @cc_and(%2481) : (i64) -> i64
      func.call @stack_push_pointer(%2482) : (i64) -> ()
      %2483 = func.call @stack_pop_pointer() : () -> i64
      %2484 = func.call @cc_nil_value() : () -> i64
      %2485 = arith.cmpi ne, %2483, %2484 : i64
      scf.if %2485 {
        func.call @stack_push_pointer(%2155) : (i64) -> ()
        %2486 = func.call @stack_pop_pointer() : () -> i64
        %2487 = func.call @cc_nil_value() : () -> i64
        %2488 = func.call @cc_errorp(%2486) : (i64) -> i64
        %2489 = arith.cmpi ne, %2488, %2487 : i64
        %2490 = arith.cmpi eq, %2487, %2487 : i64
        %2491 = arith.andi %2489, %2490 : i1
        %2492 = scf.if %2491 -> (i64) {
          scf.yield %2486 : i64
        } else {
          scf.yield %2487 : i64
        }
        %2493 = arith.cmpi ne, %2492, %2487 : i64
        scf.if %2493 {
          func.call @stack_push_pointer(%2492) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2486) : (i64) -> ()
          %2494 = llvm.mlir.addressof @str258 : !llvm.ptr
          %2495 = func.call @cc_make_function_ref_const(%2494) : (!llvm.ptr) -> i64
          %2496 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2495, %2496) : (i64, i64) -> ()
        }
      } else {
        %2497 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%2497) : (i64) -> ()
        %2498 = func.call @stack_pop_pointer() : () -> i64
        %2499 = func.call @cc_nil_value() : () -> i64
        %2500 = arith.cmpi ne, %2498, %2499 : i64
        scf.if %2500 {
          func.call @stack_push_pointer(%2155) : (i64) -> ()
          %2501 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2157) : (i64) -> ()
          %2502 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2161) : (i64) -> ()
          %2503 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2402) : (i64) -> ()
          %2504 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2174) : (i64) -> ()
          %2505 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2187) : (i64) -> ()
          %2506 = func.call @stack_pop_pointer() : () -> i64
          %2507 = func.call @cc_nil_value() : () -> i64
          %2508 = func.call @cc_errorp(%2501) : (i64) -> i64
          %2509 = arith.cmpi ne, %2508, %2507 : i64
          %2510 = arith.cmpi eq, %2507, %2507 : i64
          %2511 = arith.andi %2509, %2510 : i1
          %2512 = scf.if %2511 -> (i64) {
            scf.yield %2501 : i64
          } else {
            scf.yield %2507 : i64
          }
          %2513 = func.call @cc_errorp(%2502) : (i64) -> i64
          %2514 = arith.cmpi ne, %2513, %2507 : i64
          %2515 = arith.cmpi eq, %2512, %2507 : i64
          %2516 = arith.andi %2514, %2515 : i1
          %2517 = scf.if %2516 -> (i64) {
            scf.yield %2502 : i64
          } else {
            scf.yield %2512 : i64
          }
          %2518 = func.call @cc_errorp(%2503) : (i64) -> i64
          %2519 = arith.cmpi ne, %2518, %2507 : i64
          %2520 = arith.cmpi eq, %2517, %2507 : i64
          %2521 = arith.andi %2519, %2520 : i1
          %2522 = scf.if %2521 -> (i64) {
            scf.yield %2503 : i64
          } else {
            scf.yield %2517 : i64
          }
          %2523 = func.call @cc_errorp(%2504) : (i64) -> i64
          %2524 = arith.cmpi ne, %2523, %2507 : i64
          %2525 = arith.cmpi eq, %2522, %2507 : i64
          %2526 = arith.andi %2524, %2525 : i1
          %2527 = scf.if %2526 -> (i64) {
            scf.yield %2504 : i64
          } else {
            scf.yield %2522 : i64
          }
          %2528 = func.call @cc_errorp(%2505) : (i64) -> i64
          %2529 = arith.cmpi ne, %2528, %2507 : i64
          %2530 = arith.cmpi eq, %2527, %2507 : i64
          %2531 = arith.andi %2529, %2530 : i1
          %2532 = scf.if %2531 -> (i64) {
            scf.yield %2505 : i64
          } else {
            scf.yield %2527 : i64
          }
          %2533 = func.call @cc_errorp(%2506) : (i64) -> i64
          %2534 = arith.cmpi ne, %2533, %2507 : i64
          %2535 = arith.cmpi eq, %2532, %2507 : i64
          %2536 = arith.andi %2534, %2535 : i1
          %2537 = scf.if %2536 -> (i64) {
            scf.yield %2506 : i64
          } else {
            scf.yield %2532 : i64
          }
          %2538 = arith.cmpi ne, %2537, %2507 : i64
          scf.if %2538 {
            func.call @stack_push_pointer(%2537) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2501) : (i64) -> ()
            func.call @stack_push_pointer(%2502) : (i64) -> ()
            func.call @stack_push_pointer(%2503) : (i64) -> ()
            func.call @stack_push_pointer(%2504) : (i64) -> ()
            func.call @stack_push_pointer(%2505) : (i64) -> ()
            func.call @stack_push_pointer(%2506) : (i64) -> ()
            %2539 = llvm.mlir.addressof @str259 : !llvm.ptr
            %2540 = func.call @cc_make_function_ref_const(%2539) : (!llvm.ptr) -> i64
            %2541 = arith.constant 6 : i64
            func.call @cc_funcall_stack(%2540, %2541) : (i64, i64) -> ()
          }
      }
    }
    }
    %2542 = func.call @stack_pop_pointer() : () -> i64
    %2543 = func.call @cc_multiple_value_list(%2542) : (i64) -> i64
    %2544 = llvm.mlir.addressof @str260 : !llvm.ptr
    %2545 = arith.constant 37 : i64
    %2546 = func.call @cc_make_string(%2544, %2545) : (!llvm.ptr, i64) -> i64
    %2547 = func.call @cc_nil_value() : () -> i64
    %2548 = func.call @cc_intern(%2546, %2547) : (i64, i64) -> i64
    %2549 = func.call @cc_nil_value() : () -> i64
    %2550 = func.call @cc_cons(%2548, %2549) : (i64, i64) -> i64
    %2551 = func.call @cc_values_pack(%2550) : (i64) -> i64
    %2552 = func.call @cc_symbol_value(%2548) : (i64) -> i64
    %2553 = llvm.mlir.addressof @str261 : !llvm.ptr
    %2554 = arith.constant 38 : i64
    %2555 = func.call @cc_make_string(%2553, %2554) : (!llvm.ptr, i64) -> i64
    %2556 = func.call @cc_nil_value() : () -> i64
    %2557 = func.call @cc_intern(%2555, %2556) : (i64, i64) -> i64
    %2558 = func.call @cc_nil_value() : () -> i64
    %2559 = func.call @cc_cons(%2557, %2558) : (i64, i64) -> i64
    %2560 = func.call @cc_values_pack(%2559) : (i64) -> i64
    %2561 = func.call @cc_symbol_value(%2557) : (i64) -> i64
    %2562 = llvm.mlir.addressof @str262 : !llvm.ptr
    %2563 = arith.constant 39 : i64
    %2564 = func.call @cc_make_string(%2562, %2563) : (!llvm.ptr, i64) -> i64
    %2565 = func.call @cc_nil_value() : () -> i64
    %2566 = func.call @cc_intern(%2564, %2565) : (i64, i64) -> i64
    %2567 = func.call @cc_nil_value() : () -> i64
    %2568 = func.call @cc_cons(%2566, %2567) : (i64, i64) -> i64
    %2569 = func.call @cc_values_pack(%2568) : (i64) -> i64
    %2570 = func.call @cc_symbol_value(%2566) : (i64) -> i64
    %2571 = func.call @cc_nil_value() : () -> i64
    %2572 = arith.cmpi ne, %2552, %2571 : i64
    %2573 = scf.if %2572 -> (i64) {
      scf.yield %2570 : i64
    } else {
      scf.yield %2543 : i64
    }
    %2574 = func.call @cc_values_pack(%2573) : (i64) -> i64
    func.call @stack_push_pointer(%2574) : (i64) -> ()
    %2575 = func.call @stack_pop_pointer() : () -> i64
    %2576 = func.call @cc_multiple_value_list(%2575) : (i64) -> i64
    %2577 = llvm.mlir.addressof @str263 : !llvm.ptr
    %2578 = arith.constant 37 : i64
    %2579 = func.call @cc_make_string(%2577, %2578) : (!llvm.ptr, i64) -> i64
    %2580 = func.call @cc_nil_value() : () -> i64
    %2581 = func.call @cc_intern(%2579, %2580) : (i64, i64) -> i64
    %2582 = func.call @cc_nil_value() : () -> i64
    %2583 = func.call @cc_cons(%2581, %2582) : (i64, i64) -> i64
    %2584 = func.call @cc_values_pack(%2583) : (i64) -> i64
    %2585 = func.call @cc_symbol_value(%2581) : (i64) -> i64
    %2586 = llvm.mlir.addressof @str264 : !llvm.ptr
    %2587 = arith.constant 39 : i64
    %2588 = func.call @cc_make_string(%2586, %2587) : (!llvm.ptr, i64) -> i64
    %2589 = func.call @cc_nil_value() : () -> i64
    %2590 = func.call @cc_intern(%2588, %2589) : (i64, i64) -> i64
    %2591 = func.call @cc_nil_value() : () -> i64
    %2592 = func.call @cc_cons(%2590, %2591) : (i64, i64) -> i64
    %2593 = func.call @cc_values_pack(%2592) : (i64) -> i64
    %2594 = func.call @cc_symbol_value(%2590) : (i64) -> i64
    %2595 = func.call @cc_nil_value() : () -> i64
    %2596 = arith.cmpi ne, %2585, %2595 : i64
    %2597 = scf.if %2596 -> (i64) {
      scf.yield %2594 : i64
    } else {
      scf.yield %2576 : i64
    }
    %2598 = func.call @cc_values_pack(%2597) : (i64) -> i64
    func.call @stack_push_pointer(%2598) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::LOAD-IF-COMPILED-CORRECTLY"() {
    %2599 = llvm.mlir.addressof @str265 : !llvm.ptr
    %2600 = arith.constant 26 : i64
    %2601 = func.call @cc_make_string(%2599, %2600) : (!llvm.ptr, i64) -> i64
    %2602 = llvm.mlir.addressof @str266 : !llvm.ptr
    %2603 = arith.constant 11 : i64
    %2604 = func.call @cc_make_string(%2602, %2603) : (!llvm.ptr, i64) -> i64
    %2605 = func.call @cc_intern(%2601, %2604) : (i64, i64) -> i64
    %2606 = func.call @cc_nil_value() : () -> i64
    %2607 = func.call @cc_cons(%2605, %2606) : (i64, i64) -> i64
    %2608 = func.call @cc_values_pack(%2607) : (i64) -> i64
    %2609 = llvm.mlir.addressof @str267 : !llvm.ptr
    %2610 = arith.constant 4 : i64
    %2611 = func.call @cc_make_string(%2609, %2610) : (!llvm.ptr, i64) -> i64
    %2612 = func.call @cc_register_function_lambda_list_metadata_raw(%2605, %2611) : (i64, i64) -> i64
    %2613 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%2605, %2613) : (i64, i64) -> ()
    %2614 = func.call @stack_pop_pointer() : () -> i64
    %2615 = func.call @cc_nil_value() : () -> i64
    %2616 = llvm.mlir.addressof @str268 : !llvm.ptr
    %2617 = arith.constant 37 : i64
    %2618 = func.call @cc_make_string(%2616, %2617) : (!llvm.ptr, i64) -> i64
    %2619 = func.call @cc_nil_value() : () -> i64
    %2620 = func.call @cc_intern(%2618, %2619) : (i64, i64) -> i64
    %2621 = func.call @cc_nil_value() : () -> i64
    %2622 = func.call @cc_cons(%2620, %2621) : (i64, i64) -> i64
    %2623 = func.call @cc_values_pack(%2622) : (i64) -> i64
    %2624 = func.call @cc_set_symbol_value(%2620, %2615) : (i64, i64) -> i64
    %2625 = llvm.mlir.addressof @str269 : !llvm.ptr
    %2626 = arith.constant 38 : i64
    %2627 = func.call @cc_make_string(%2625, %2626) : (!llvm.ptr, i64) -> i64
    %2628 = func.call @cc_nil_value() : () -> i64
    %2629 = func.call @cc_intern(%2627, %2628) : (i64, i64) -> i64
    %2630 = func.call @cc_nil_value() : () -> i64
    %2631 = func.call @cc_cons(%2629, %2630) : (i64, i64) -> i64
    %2632 = func.call @cc_values_pack(%2631) : (i64) -> i64
    %2633 = func.call @cc_set_symbol_value(%2629, %2615) : (i64, i64) -> i64
    %2634 = llvm.mlir.addressof @str270 : !llvm.ptr
    %2635 = arith.constant 39 : i64
    %2636 = func.call @cc_make_string(%2634, %2635) : (!llvm.ptr, i64) -> i64
    %2637 = func.call @cc_nil_value() : () -> i64
    %2638 = func.call @cc_intern(%2636, %2637) : (i64, i64) -> i64
    %2639 = func.call @cc_nil_value() : () -> i64
    %2640 = func.call @cc_cons(%2638, %2639) : (i64, i64) -> i64
    %2641 = func.call @cc_values_pack(%2640) : (i64) -> i64
    %2642 = func.call @cc_set_symbol_value(%2638, %2615) : (i64, i64) -> i64
    %2643 = func.call @cc_nil_value() : () -> i64
    %2644 = llvm.mlir.addressof @str271 : !llvm.ptr
    %2645 = arith.constant 37 : i64
    %2646 = func.call @cc_make_string(%2644, %2645) : (!llvm.ptr, i64) -> i64
    %2647 = func.call @cc_nil_value() : () -> i64
    %2648 = func.call @cc_intern(%2646, %2647) : (i64, i64) -> i64
    %2649 = func.call @cc_nil_value() : () -> i64
    %2650 = func.call @cc_cons(%2648, %2649) : (i64, i64) -> i64
    %2651 = func.call @cc_values_pack(%2650) : (i64) -> i64
    %2652 = func.call @cc_set_symbol_value(%2648, %2643) : (i64, i64) -> i64
    %2653 = llvm.mlir.addressof @str272 : !llvm.ptr
    %2654 = arith.constant 38 : i64
    %2655 = func.call @cc_make_string(%2653, %2654) : (!llvm.ptr, i64) -> i64
    %2656 = func.call @cc_nil_value() : () -> i64
    %2657 = func.call @cc_intern(%2655, %2656) : (i64, i64) -> i64
    %2658 = func.call @cc_nil_value() : () -> i64
    %2659 = func.call @cc_cons(%2657, %2658) : (i64, i64) -> i64
    %2660 = func.call @cc_values_pack(%2659) : (i64) -> i64
    %2661 = func.call @cc_set_symbol_value(%2657, %2643) : (i64, i64) -> i64
    %2662 = llvm.mlir.addressof @str273 : !llvm.ptr
    %2663 = arith.constant 39 : i64
    %2664 = func.call @cc_make_string(%2662, %2663) : (!llvm.ptr, i64) -> i64
    %2665 = func.call @cc_nil_value() : () -> i64
    %2666 = func.call @cc_intern(%2664, %2665) : (i64, i64) -> i64
    %2667 = func.call @cc_nil_value() : () -> i64
    %2668 = func.call @cc_cons(%2666, %2667) : (i64, i64) -> i64
    %2669 = func.call @cc_values_pack(%2668) : (i64) -> i64
    %2670 = func.call @cc_set_symbol_value(%2666, %2643) : (i64, i64) -> i64
    %2671 = func.call @cc_nil_value() : () -> i64
    %2672 = func.call @cc_nil_value() : () -> i64
    %2673 = func.call @cc_errorp(%2671) : (i64) -> i64
    %2674 = arith.cmpi ne, %2673, %2672 : i64
    %2675 = scf.if %2674 -> (i64) {
      scf.yield %2671 : i64
    } else {
      %2676 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2676) : (i64) -> ()
      %2677 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2678 = arith.constant 4 : i64
      %2679 = func.call @cc_make_string(%2677, %2678) : (!llvm.ptr, i64) -> i64
      %2680 = func.call @cc_nil_value() : () -> i64
      %2681 = func.call @cc_intern(%2679, %2680) : (i64, i64) -> i64
      %2682 = func.call @cc_nil_value() : () -> i64
      %2683 = func.call @cc_cons(%2681, %2682) : (i64, i64) -> i64
      %2684 = func.call @cc_values_pack(%2683) : (i64) -> i64
      func.call @stack_push_pointer(%2681) : (i64) -> ()
      %2685 = func.call @stack_pop_pointer() : () -> i64
      %2686 = func.call @stack_pop_pointer() : () -> i64
      %2687 = func.call @cc_cons(%2685, %2686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2687) : (i64) -> ()
      %2688 = llvm.mlir.addressof @str275 : !llvm.ptr
      %2689 = arith.constant 12 : i64
      %2690 = func.call @cc_make_string(%2688, %2689) : (!llvm.ptr, i64) -> i64
      %2691 = func.call @cc_nil_value() : () -> i64
      %2692 = func.call @cc_intern(%2690, %2691) : (i64, i64) -> i64
      %2693 = func.call @cc_nil_value() : () -> i64
      %2694 = func.call @cc_cons(%2692, %2693) : (i64, i64) -> i64
      %2695 = func.call @cc_values_pack(%2694) : (i64) -> i64
      func.call @stack_push_pointer(%2692) : (i64) -> ()
      %2696 = func.call @stack_pop_pointer() : () -> i64
      %2697 = func.call @stack_pop_pointer() : () -> i64
      %2698 = func.call @cc_cons(%2696, %2697) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2698) : (i64) -> ()
      %2699 = func.call @stack_pop_pointer() : () -> i64
      %2700 = func.call @cc_nil_value() : () -> i64
      %2701 = func.call @cc_cons(%2699, %2700) : (i64, i64) -> i64
      %2702 = llvm.mlir.addressof @str276 : !llvm.ptr
      %2703 = arith.constant 4 : i64
      %2704 = func.call @cc_make_string(%2702, %2703) : (!llvm.ptr, i64) -> i64
      %2705 = func.call @cc_nil_value() : () -> i64
      %2706 = func.call @cc_intern(%2704, %2705) : (i64, i64) -> i64
      %2707 = func.call @cc_nil_value() : () -> i64
      %2708 = func.call @cc_cons(%2706, %2707) : (i64, i64) -> i64
      %2709 = func.call @cc_values_pack(%2708) : (i64) -> i64
      %2710 = func.call @cc_symbol_value(%2706) : (i64) -> i64
      %2711 = func.call @cc_set_symbol_value(%2706, %2614) : (i64, i64) -> i64
      %2712 = func.call @cc_eval(%2701) : (i64) -> i64
      %2713 = func.call @cc_multiple_value_list(%2712) : (i64) -> i64
      %2714 = func.call @cc_symbol_value(%2706) : (i64) -> i64
      %2715 = func.call @cc_set_symbol_value(%2706, %2710) : (i64, i64) -> i64
      %2716 = func.call @cc_values_pack(%2713) : (i64) -> i64
      func.call @stack_push_pointer(%2716) : (i64) -> ()
      %2717 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2717 : i64
    }
    func.call @stack_push_pointer(%2675) : (i64) -> ()
    %2718 = func.call @stack_pop_pointer() : () -> i64
    %2719 = func.call @cc_multiple_value_list(%2718) : (i64) -> i64
    %2720 = arith.constant 0 : i64
    %2721 = func.call @cc_box_fixnum(%2720) : (i64) -> i64
    %2722 = func.call @cc_nth(%2721, %2719) : (i64, i64) -> i64
    %2723 = arith.constant 1 : i64
    %2724 = func.call @cc_box_fixnum(%2723) : (i64) -> i64
    %2725 = func.call @cc_nth(%2724, %2719) : (i64, i64) -> i64
    %2726 = arith.constant 2 : i64
    %2727 = func.call @cc_box_fixnum(%2726) : (i64) -> i64
    %2728 = func.call @cc_nth(%2727, %2719) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %2729 = func.call @stack_depth() : () -> i64
    %2730 = arith.constant 0 : i64
    %2731 = arith.cmpi sgt, %2729, %2730 : i64
    scf.if %2731 {
      %2732 = func.call @stack_pop_pointer() : () -> i64
    }
    func.call @stack_push_pointer(%2722) : (i64) -> ()
    %2733 = func.call @stack_pop_pointer() : () -> i64
    %2734 = func.call @cc_nil_value() : () -> i64
    %2735 = arith.cmpi ne, %2733, %2734 : i64
    scf.if %2735 {
      %2736 = func.call @cc_nil_value() : () -> i64
      %2737 = func.call @cc_nil_value() : () -> i64
      %2738 = func.call @cc_errorp(%2736) : (i64) -> i64
      %2739 = arith.cmpi ne, %2738, %2737 : i64
      %2740 = scf.if %2739 -> (i64) {
        scf.yield %2736 : i64
      } else {
        func.call @stack_push_pointer(%2722) : (i64) -> ()
        %2741 = func.call @stack_pop_pointer() : () -> i64
        %2742 = func.call @cc_nil_value() : () -> i64
        %2743 = func.call @cc_cons(%2741, %2742) : (i64, i64) -> i64
        %2744 = func.call @cc_load_stack(%2743) : (i64) -> i64
        func.call @stack_push_pointer(%2744) : (i64) -> ()
        %2745 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2745 : i64
      }
      func.call @stack_push_pointer(%2740) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %2746 = func.call @stack_pop_pointer() : () -> i64
    %2747 = func.call @cc_errorp(%2746) : (i64) -> i64
    %2748 = func.call @cc_nil_value() : () -> i64
    %2749 = arith.cmpi ne, %2747, %2748 : i64
    %2750 = scf.if %2749 -> (i64) {
      %2751 = func.call @cc_condition_value(%2746) : (i64) -> i64
      %2752 = llvm.mlir.addressof @str277 : !llvm.ptr
      %2753 = arith.constant 5 : i64
      %2754 = func.call @cc_make_string(%2752, %2753) : (!llvm.ptr, i64) -> i64
      %2755 = llvm.mlir.addressof @str278 : !llvm.ptr
      %2756 = arith.constant 11 : i64
      %2757 = func.call @cc_make_string(%2755, %2756) : (!llvm.ptr, i64) -> i64
      %2758 = func.call @cc_intern(%2754, %2757) : (i64, i64) -> i64
      %2759 = func.call @cc_nil_value() : () -> i64
      %2760 = func.call @cc_cons(%2758, %2759) : (i64, i64) -> i64
      %2761 = func.call @cc_values_pack(%2760) : (i64) -> i64
      func.call @stack_push_pointer(%2758) : (i64) -> ()
      %2762 = func.call @stack_pop_pointer() : () -> i64
      %2763 = func.call @cc_typep(%2751, %2762) : (i64, i64) -> i64
      %2764 = func.call @cc_nil_value() : () -> i64
      %2765 = arith.cmpi ne, %2763, %2764 : i64
      %2766 = scf.if %2765 -> (i64) {
        func.call @stack_push_pointer(%2614) : (i64) -> ()
        %2767 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2751) : (i64) -> ()
        %2768 = func.call @stack_pop_pointer() : () -> i64
        %2769 = func.call @cc_nil_value() : () -> i64
        %2770 = func.call @cc_errorp(%2767) : (i64) -> i64
        %2771 = arith.cmpi ne, %2770, %2769 : i64
        %2772 = arith.cmpi eq, %2769, %2769 : i64
        %2773 = arith.andi %2771, %2772 : i1
        %2774 = scf.if %2773 -> (i64) {
          scf.yield %2767 : i64
        } else {
          scf.yield %2769 : i64
        }
        %2775 = func.call @cc_errorp(%2768) : (i64) -> i64
        %2776 = arith.cmpi ne, %2775, %2769 : i64
        %2777 = arith.cmpi eq, %2774, %2769 : i64
        %2778 = arith.andi %2776, %2777 : i1
        %2779 = scf.if %2778 -> (i64) {
          scf.yield %2768 : i64
        } else {
          scf.yield %2774 : i64
        }
        %2780 = arith.cmpi ne, %2779, %2769 : i64
        scf.if %2780 {
          func.call @stack_push_pointer(%2779) : (i64) -> ()
        } else {
          %2781 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%2781) : (i64) -> ()
          func.call @stack_push_pointer(%2768) : (i64) -> ()
          %2782 = func.call @stack_pop_pointer() : () -> i64
          %2783 = func.call @stack_pop_pointer() : () -> i64
          %2784 = func.call @cc_cons(%2782, %2783) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2784) : (i64) -> ()
          func.call @stack_push_pointer(%2767) : (i64) -> ()
          %2785 = func.call @stack_pop_pointer() : () -> i64
          %2786 = func.call @stack_pop_pointer() : () -> i64
          %2787 = func.call @cc_cons(%2785, %2786) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2787) : (i64) -> ()
        }
        %2788 = func.call @stack_pop_pointer() : () -> i64
        %2789 = func.call @cc_nil_value() : () -> i64
        %2790 = func.call @cc_errorp(%2788) : (i64) -> i64
        %2791 = arith.cmpi ne, %2790, %2789 : i64
        %2792 = arith.cmpi eq, %2789, %2789 : i64
        %2793 = arith.andi %2791, %2792 : i1
        %2794 = scf.if %2793 -> (i64) {
          scf.yield %2788 : i64
        } else {
          scf.yield %2789 : i64
        }
        %2795 = arith.cmpi ne, %2794, %2789 : i64
        scf.if %2795 {
          func.call @stack_push_pointer(%2794) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2788) : (i64) -> ()
          %2796 = llvm.mlir.addressof @str279 : !llvm.ptr
          %2797 = func.call @cc_make_function_ref_const(%2796) : (!llvm.ptr) -> i64
          %2798 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2797, %2798) : (i64, i64) -> ()
        }
        %2799 = func.call @stack_depth() : () -> i64
        %2800 = arith.constant 0 : i64
        %2801 = arith.cmpi sgt, %2799, %2800 : i64
        scf.if %2801 {
          %2802 = func.call @stack_pop_pointer() : () -> i64
        }
        %2803 = llvm.mlir.addressof @str280 : !llvm.ptr
        %2804 = arith.constant 3 : i64
        %2805 = func.call @cc_make_string(%2803, %2804) : (!llvm.ptr, i64) -> i64
        %2806 = llvm.mlir.addressof @str281 : !llvm.ptr
        %2807 = arith.constant 7 : i64
        %2808 = func.call @cc_make_string(%2806, %2807) : (!llvm.ptr, i64) -> i64
        %2809 = func.call @cc_intern(%2805, %2808) : (i64, i64) -> i64
        %2810 = func.call @cc_nil_value() : () -> i64
        %2811 = func.call @cc_cons(%2809, %2810) : (i64, i64) -> i64
        %2812 = func.call @cc_values_pack(%2811) : (i64) -> i64
        func.call @stack_push_pointer(%2809) : (i64) -> ()
        %2813 = func.call @stack_pop_pointer() : () -> i64
        %2814 = llvm.mlir.addressof @str282 : !llvm.ptr
        %2815 = arith.constant 45 : i64
        %2816 = func.call @cc_make_string(%2814, %2815) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%2816) : (i64) -> ()
        %2817 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2614) : (i64) -> ()
        %2818 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2751) : (i64) -> ()
        %2819 = func.call @stack_pop_pointer() : () -> i64
        %2820 = func.call @cc_nil_value() : () -> i64
        %2821 = func.call @cc_errorp(%2813) : (i64) -> i64
        %2822 = arith.cmpi ne, %2821, %2820 : i64
        %2823 = arith.cmpi eq, %2820, %2820 : i64
        %2824 = arith.andi %2822, %2823 : i1
        %2825 = scf.if %2824 -> (i64) {
          scf.yield %2813 : i64
        } else {
          scf.yield %2820 : i64
        }
        %2826 = func.call @cc_errorp(%2817) : (i64) -> i64
        %2827 = arith.cmpi ne, %2826, %2820 : i64
        %2828 = arith.cmpi eq, %2825, %2820 : i64
        %2829 = arith.andi %2827, %2828 : i1
        %2830 = scf.if %2829 -> (i64) {
          scf.yield %2817 : i64
        } else {
          scf.yield %2825 : i64
        }
        %2831 = func.call @cc_errorp(%2818) : (i64) -> i64
        %2832 = arith.cmpi ne, %2831, %2820 : i64
        %2833 = arith.cmpi eq, %2830, %2820 : i64
        %2834 = arith.andi %2832, %2833 : i1
        %2835 = scf.if %2834 -> (i64) {
          scf.yield %2818 : i64
        } else {
          scf.yield %2830 : i64
        }
        %2836 = func.call @cc_errorp(%2819) : (i64) -> i64
        %2837 = arith.cmpi ne, %2836, %2820 : i64
        %2838 = arith.cmpi eq, %2835, %2820 : i64
        %2839 = arith.andi %2837, %2838 : i1
        %2840 = scf.if %2839 -> (i64) {
          scf.yield %2819 : i64
        } else {
          scf.yield %2835 : i64
        }
        %2841 = arith.cmpi ne, %2840, %2820 : i64
        scf.if %2841 {
          func.call @stack_push_pointer(%2840) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2813) : (i64) -> ()
          func.call @stack_push_pointer(%2817) : (i64) -> ()
          func.call @stack_push_pointer(%2818) : (i64) -> ()
          func.call @stack_push_pointer(%2819) : (i64) -> ()
          %2842 = llvm.mlir.addressof @str283 : !llvm.ptr
          %2843 = func.call @cc_make_function_ref_const(%2842) : (!llvm.ptr) -> i64
          %2844 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%2843, %2844) : (i64, i64) -> ()
        }
        %2845 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2845 : i64
      } else {
        scf.yield %2746 : i64
      }
      scf.yield %2766 : i64
    } else {
      scf.yield %2746 : i64
    }
    func.call @stack_push_pointer(%2750) : (i64) -> ()
    %2846 = func.call @stack_pop_pointer() : () -> i64
    %2847 = func.call @cc_multiple_value_list(%2846) : (i64) -> i64
    %2848 = llvm.mlir.addressof @str284 : !llvm.ptr
    %2849 = arith.constant 37 : i64
    %2850 = func.call @cc_make_string(%2848, %2849) : (!llvm.ptr, i64) -> i64
    %2851 = func.call @cc_nil_value() : () -> i64
    %2852 = func.call @cc_intern(%2850, %2851) : (i64, i64) -> i64
    %2853 = func.call @cc_nil_value() : () -> i64
    %2854 = func.call @cc_cons(%2852, %2853) : (i64, i64) -> i64
    %2855 = func.call @cc_values_pack(%2854) : (i64) -> i64
    %2856 = func.call @cc_symbol_value(%2852) : (i64) -> i64
    %2857 = llvm.mlir.addressof @str285 : !llvm.ptr
    %2858 = arith.constant 38 : i64
    %2859 = func.call @cc_make_string(%2857, %2858) : (!llvm.ptr, i64) -> i64
    %2860 = func.call @cc_nil_value() : () -> i64
    %2861 = func.call @cc_intern(%2859, %2860) : (i64, i64) -> i64
    %2862 = func.call @cc_nil_value() : () -> i64
    %2863 = func.call @cc_cons(%2861, %2862) : (i64, i64) -> i64
    %2864 = func.call @cc_values_pack(%2863) : (i64) -> i64
    %2865 = func.call @cc_symbol_value(%2861) : (i64) -> i64
    %2866 = llvm.mlir.addressof @str286 : !llvm.ptr
    %2867 = arith.constant 39 : i64
    %2868 = func.call @cc_make_string(%2866, %2867) : (!llvm.ptr, i64) -> i64
    %2869 = func.call @cc_nil_value() : () -> i64
    %2870 = func.call @cc_intern(%2868, %2869) : (i64, i64) -> i64
    %2871 = func.call @cc_nil_value() : () -> i64
    %2872 = func.call @cc_cons(%2870, %2871) : (i64, i64) -> i64
    %2873 = func.call @cc_values_pack(%2872) : (i64) -> i64
    %2874 = func.call @cc_symbol_value(%2870) : (i64) -> i64
    %2875 = func.call @cc_nil_value() : () -> i64
    %2876 = arith.cmpi ne, %2856, %2875 : i64
    %2877 = scf.if %2876 -> (i64) {
      scf.yield %2874 : i64
    } else {
      scf.yield %2847 : i64
    }
    %2878 = func.call @cc_values_pack(%2877) : (i64) -> i64
    func.call @stack_push_pointer(%2878) : (i64) -> ()
    %2879 = func.call @stack_pop_pointer() : () -> i64
    %2880 = func.call @cc_multiple_value_list(%2879) : (i64) -> i64
    %2881 = llvm.mlir.addressof @str287 : !llvm.ptr
    %2882 = arith.constant 37 : i64
    %2883 = func.call @cc_make_string(%2881, %2882) : (!llvm.ptr, i64) -> i64
    %2884 = func.call @cc_nil_value() : () -> i64
    %2885 = func.call @cc_intern(%2883, %2884) : (i64, i64) -> i64
    %2886 = func.call @cc_nil_value() : () -> i64
    %2887 = func.call @cc_cons(%2885, %2886) : (i64, i64) -> i64
    %2888 = func.call @cc_values_pack(%2887) : (i64) -> i64
    %2889 = func.call @cc_symbol_value(%2885) : (i64) -> i64
    %2890 = llvm.mlir.addressof @str288 : !llvm.ptr
    %2891 = arith.constant 39 : i64
    %2892 = func.call @cc_make_string(%2890, %2891) : (!llvm.ptr, i64) -> i64
    %2893 = func.call @cc_nil_value() : () -> i64
    %2894 = func.call @cc_intern(%2892, %2893) : (i64, i64) -> i64
    %2895 = func.call @cc_nil_value() : () -> i64
    %2896 = func.call @cc_cons(%2894, %2895) : (i64, i64) -> i64
    %2897 = func.call @cc_values_pack(%2896) : (i64) -> i64
    %2898 = func.call @cc_symbol_value(%2894) : (i64) -> i64
    %2899 = func.call @cc_nil_value() : () -> i64
    %2900 = arith.cmpi ne, %2889, %2899 : i64
    %2901 = scf.if %2900 -> (i64) {
      scf.yield %2898 : i64
    } else {
      scf.yield %2880 : i64
    }
    %2902 = func.call @cc_values_pack(%2901) : (i64) -> i64
    func.call @stack_push_pointer(%2902) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY"() {
    %2903 = llvm.mlir.addressof @str289 : !llvm.ptr
    %2904 = arith.constant 42 : i64
    %2905 = func.call @cc_make_string(%2903, %2904) : (!llvm.ptr, i64) -> i64
    %2906 = llvm.mlir.addressof @str290 : !llvm.ptr
    %2907 = arith.constant 11 : i64
    %2908 = func.call @cc_make_string(%2906, %2907) : (!llvm.ptr, i64) -> i64
    %2909 = func.call @cc_intern(%2905, %2908) : (i64, i64) -> i64
    %2910 = func.call @cc_nil_value() : () -> i64
    %2911 = func.call @cc_cons(%2909, %2910) : (i64, i64) -> i64
    %2912 = func.call @cc_values_pack(%2911) : (i64) -> i64
    %2913 = llvm.mlir.addressof @str291 : !llvm.ptr
    %2914 = arith.constant 4 : i64
    %2915 = func.call @cc_make_string(%2913, %2914) : (!llvm.ptr, i64) -> i64
    %2916 = func.call @cc_register_function_lambda_list_metadata_raw(%2909, %2915) : (i64, i64) -> i64
    %2917 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%2909, %2917) : (i64, i64) -> ()
    %2918 = func.call @stack_pop_pointer() : () -> i64
    %2919 = func.call @cc_nil_value() : () -> i64
    %2920 = llvm.mlir.addressof @str292 : !llvm.ptr
    %2921 = arith.constant 37 : i64
    %2922 = func.call @cc_make_string(%2920, %2921) : (!llvm.ptr, i64) -> i64
    %2923 = func.call @cc_nil_value() : () -> i64
    %2924 = func.call @cc_intern(%2922, %2923) : (i64, i64) -> i64
    %2925 = func.call @cc_nil_value() : () -> i64
    %2926 = func.call @cc_cons(%2924, %2925) : (i64, i64) -> i64
    %2927 = func.call @cc_values_pack(%2926) : (i64) -> i64
    %2928 = func.call @cc_set_symbol_value(%2924, %2919) : (i64, i64) -> i64
    %2929 = llvm.mlir.addressof @str293 : !llvm.ptr
    %2930 = arith.constant 38 : i64
    %2931 = func.call @cc_make_string(%2929, %2930) : (!llvm.ptr, i64) -> i64
    %2932 = func.call @cc_nil_value() : () -> i64
    %2933 = func.call @cc_intern(%2931, %2932) : (i64, i64) -> i64
    %2934 = func.call @cc_nil_value() : () -> i64
    %2935 = func.call @cc_cons(%2933, %2934) : (i64, i64) -> i64
    %2936 = func.call @cc_values_pack(%2935) : (i64) -> i64
    %2937 = func.call @cc_set_symbol_value(%2933, %2919) : (i64, i64) -> i64
    %2938 = llvm.mlir.addressof @str294 : !llvm.ptr
    %2939 = arith.constant 39 : i64
    %2940 = func.call @cc_make_string(%2938, %2939) : (!llvm.ptr, i64) -> i64
    %2941 = func.call @cc_nil_value() : () -> i64
    %2942 = func.call @cc_intern(%2940, %2941) : (i64, i64) -> i64
    %2943 = func.call @cc_nil_value() : () -> i64
    %2944 = func.call @cc_cons(%2942, %2943) : (i64, i64) -> i64
    %2945 = func.call @cc_values_pack(%2944) : (i64) -> i64
    %2946 = func.call @cc_set_symbol_value(%2942, %2919) : (i64, i64) -> i64
    %2947 = func.call @cc_nil_value() : () -> i64
    %2948 = llvm.mlir.addressof @str295 : !llvm.ptr
    %2949 = arith.constant 37 : i64
    %2950 = func.call @cc_make_string(%2948, %2949) : (!llvm.ptr, i64) -> i64
    %2951 = func.call @cc_nil_value() : () -> i64
    %2952 = func.call @cc_intern(%2950, %2951) : (i64, i64) -> i64
    %2953 = func.call @cc_nil_value() : () -> i64
    %2954 = func.call @cc_cons(%2952, %2953) : (i64, i64) -> i64
    %2955 = func.call @cc_values_pack(%2954) : (i64) -> i64
    %2956 = func.call @cc_set_symbol_value(%2952, %2947) : (i64, i64) -> i64
    %2957 = llvm.mlir.addressof @str296 : !llvm.ptr
    %2958 = arith.constant 38 : i64
    %2959 = func.call @cc_make_string(%2957, %2958) : (!llvm.ptr, i64) -> i64
    %2960 = func.call @cc_nil_value() : () -> i64
    %2961 = func.call @cc_intern(%2959, %2960) : (i64, i64) -> i64
    %2962 = func.call @cc_nil_value() : () -> i64
    %2963 = func.call @cc_cons(%2961, %2962) : (i64, i64) -> i64
    %2964 = func.call @cc_values_pack(%2963) : (i64) -> i64
    %2965 = func.call @cc_set_symbol_value(%2961, %2947) : (i64, i64) -> i64
    %2966 = llvm.mlir.addressof @str297 : !llvm.ptr
    %2967 = arith.constant 39 : i64
    %2968 = func.call @cc_make_string(%2966, %2967) : (!llvm.ptr, i64) -> i64
    %2969 = func.call @cc_nil_value() : () -> i64
    %2970 = func.call @cc_intern(%2968, %2969) : (i64, i64) -> i64
    %2971 = func.call @cc_nil_value() : () -> i64
    %2972 = func.call @cc_cons(%2970, %2971) : (i64, i64) -> i64
    %2973 = func.call @cc_values_pack(%2972) : (i64) -> i64
    %2974 = func.call @cc_set_symbol_value(%2970, %2947) : (i64, i64) -> i64
    %2975 = func.call @cc_nil_value() : () -> i64
    %2976 = func.call @cc_nil_value() : () -> i64
    %2977 = func.call @cc_errorp(%2975) : (i64) -> i64
    %2978 = arith.cmpi ne, %2977, %2976 : i64
    %2979 = scf.if %2978 -> (i64) {
      scf.yield %2975 : i64
    } else {
      %2980 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2980) : (i64) -> ()
      %2981 = llvm.mlir.addressof @str298 : !llvm.ptr
      %2982 = arith.constant 4 : i64
      %2983 = func.call @cc_make_string(%2981, %2982) : (!llvm.ptr, i64) -> i64
      %2984 = func.call @cc_nil_value() : () -> i64
      %2985 = func.call @cc_intern(%2983, %2984) : (i64, i64) -> i64
      %2986 = func.call @cc_nil_value() : () -> i64
      %2987 = func.call @cc_cons(%2985, %2986) : (i64, i64) -> i64
      %2988 = func.call @cc_values_pack(%2987) : (i64) -> i64
      func.call @stack_push_pointer(%2985) : (i64) -> ()
      %2989 = func.call @stack_pop_pointer() : () -> i64
      %2990 = func.call @stack_pop_pointer() : () -> i64
      %2991 = func.call @cc_cons(%2989, %2990) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2991) : (i64) -> ()
      %2992 = llvm.mlir.addressof @str299 : !llvm.ptr
      %2993 = arith.constant 12 : i64
      %2994 = func.call @cc_make_string(%2992, %2993) : (!llvm.ptr, i64) -> i64
      %2995 = func.call @cc_nil_value() : () -> i64
      %2996 = func.call @cc_intern(%2994, %2995) : (i64, i64) -> i64
      %2997 = func.call @cc_nil_value() : () -> i64
      %2998 = func.call @cc_cons(%2996, %2997) : (i64, i64) -> i64
      %2999 = func.call @cc_values_pack(%2998) : (i64) -> i64
      func.call @stack_push_pointer(%2996) : (i64) -> ()
      %3000 = func.call @stack_pop_pointer() : () -> i64
      %3001 = func.call @stack_pop_pointer() : () -> i64
      %3002 = func.call @cc_cons(%3000, %3001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3002) : (i64) -> ()
      %3003 = func.call @stack_pop_pointer() : () -> i64
      %3004 = func.call @cc_nil_value() : () -> i64
      %3005 = func.call @cc_cons(%3003, %3004) : (i64, i64) -> i64
      %3006 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3007 = arith.constant 4 : i64
      %3008 = func.call @cc_make_string(%3006, %3007) : (!llvm.ptr, i64) -> i64
      %3009 = func.call @cc_nil_value() : () -> i64
      %3010 = func.call @cc_intern(%3008, %3009) : (i64, i64) -> i64
      %3011 = func.call @cc_nil_value() : () -> i64
      %3012 = func.call @cc_cons(%3010, %3011) : (i64, i64) -> i64
      %3013 = func.call @cc_values_pack(%3012) : (i64) -> i64
      %3014 = func.call @cc_symbol_value(%3010) : (i64) -> i64
      %3015 = func.call @cc_set_symbol_value(%3010, %2918) : (i64, i64) -> i64
      %3016 = func.call @cc_eval(%3005) : (i64) -> i64
      %3017 = func.call @cc_multiple_value_list(%3016) : (i64) -> i64
      %3018 = func.call @cc_symbol_value(%3010) : (i64) -> i64
      %3019 = func.call @cc_set_symbol_value(%3010, %3014) : (i64, i64) -> i64
      %3020 = func.call @cc_values_pack(%3017) : (i64) -> i64
      func.call @stack_push_pointer(%3020) : (i64) -> ()
      %3021 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3021 : i64
    }
    func.call @stack_push_pointer(%2979) : (i64) -> ()
    %3022 = func.call @stack_pop_pointer() : () -> i64
    %3023 = func.call @cc_multiple_value_list(%3022) : (i64) -> i64
    %3024 = arith.constant 0 : i64
    %3025 = func.call @cc_box_fixnum(%3024) : (i64) -> i64
    %3026 = func.call @cc_nth(%3025, %3023) : (i64, i64) -> i64
    %3027 = arith.constant 1 : i64
    %3028 = func.call @cc_box_fixnum(%3027) : (i64) -> i64
    %3029 = func.call @cc_nth(%3028, %3023) : (i64, i64) -> i64
    %3030 = arith.constant 2 : i64
    %3031 = func.call @cc_box_fixnum(%3030) : (i64) -> i64
    %3032 = func.call @cc_nth(%3031, %3023) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %3033 = func.call @stack_depth() : () -> i64
    %3034 = arith.constant 0 : i64
    %3035 = arith.cmpi sgt, %3033, %3034 : i64
    scf.if %3035 {
      %3036 = func.call @stack_pop_pointer() : () -> i64
    }
    func.call @stack_push_pointer(%3026) : (i64) -> ()
    %3037 = func.call @stack_pop_pointer() : () -> i64
    %3038 = func.call @cc_nil_value() : () -> i64
    %3039 = arith.cmpi ne, %3037, %3038 : i64
    scf.if %3039 {
      %3040 = func.call @cc_nil_value() : () -> i64
      %3041 = func.call @cc_nil_value() : () -> i64
      %3042 = func.call @cc_errorp(%3040) : (i64) -> i64
      %3043 = arith.cmpi ne, %3042, %3041 : i64
      %3044 = scf.if %3043 -> (i64) {
        scf.yield %3040 : i64
      } else {
        func.call @stack_push_pointer(%3026) : (i64) -> ()
        %3045 = func.call @stack_pop_pointer() : () -> i64
        %3046 = func.call @cc_nil_value() : () -> i64
        %3047 = func.call @cc_cons(%3045, %3046) : (i64, i64) -> i64
        %3048 = func.call @cc_load_stack(%3047) : (i64) -> i64
        func.call @stack_push_pointer(%3048) : (i64) -> ()
        %3049 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3049 : i64
      }
      func.call @stack_push_pointer(%3044) : (i64) -> ()
    } else {
      func.call @stack_push_nil() : () -> ()
    }
    %3050 = func.call @stack_pop_pointer() : () -> i64
    %3051 = func.call @cc_multiple_value_list(%3050) : (i64) -> i64
    %3052 = llvm.mlir.addressof @str301 : !llvm.ptr
    %3053 = arith.constant 37 : i64
    %3054 = func.call @cc_make_string(%3052, %3053) : (!llvm.ptr, i64) -> i64
    %3055 = func.call @cc_nil_value() : () -> i64
    %3056 = func.call @cc_intern(%3054, %3055) : (i64, i64) -> i64
    %3057 = func.call @cc_nil_value() : () -> i64
    %3058 = func.call @cc_cons(%3056, %3057) : (i64, i64) -> i64
    %3059 = func.call @cc_values_pack(%3058) : (i64) -> i64
    %3060 = func.call @cc_symbol_value(%3056) : (i64) -> i64
    %3061 = llvm.mlir.addressof @str302 : !llvm.ptr
    %3062 = arith.constant 38 : i64
    %3063 = func.call @cc_make_string(%3061, %3062) : (!llvm.ptr, i64) -> i64
    %3064 = func.call @cc_nil_value() : () -> i64
    %3065 = func.call @cc_intern(%3063, %3064) : (i64, i64) -> i64
    %3066 = func.call @cc_nil_value() : () -> i64
    %3067 = func.call @cc_cons(%3065, %3066) : (i64, i64) -> i64
    %3068 = func.call @cc_values_pack(%3067) : (i64) -> i64
    %3069 = func.call @cc_symbol_value(%3065) : (i64) -> i64
    %3070 = llvm.mlir.addressof @str303 : !llvm.ptr
    %3071 = arith.constant 39 : i64
    %3072 = func.call @cc_make_string(%3070, %3071) : (!llvm.ptr, i64) -> i64
    %3073 = func.call @cc_nil_value() : () -> i64
    %3074 = func.call @cc_intern(%3072, %3073) : (i64, i64) -> i64
    %3075 = func.call @cc_nil_value() : () -> i64
    %3076 = func.call @cc_cons(%3074, %3075) : (i64, i64) -> i64
    %3077 = func.call @cc_values_pack(%3076) : (i64) -> i64
    %3078 = func.call @cc_symbol_value(%3074) : (i64) -> i64
    %3079 = func.call @cc_nil_value() : () -> i64
    %3080 = arith.cmpi ne, %3060, %3079 : i64
    %3081 = scf.if %3080 -> (i64) {
      scf.yield %3078 : i64
    } else {
      scf.yield %3051 : i64
    }
    %3082 = func.call @cc_values_pack(%3081) : (i64) -> i64
    func.call @stack_push_pointer(%3082) : (i64) -> ()
    %3083 = func.call @stack_pop_pointer() : () -> i64
    %3084 = func.call @cc_multiple_value_list(%3083) : (i64) -> i64
    %3085 = llvm.mlir.addressof @str304 : !llvm.ptr
    %3086 = arith.constant 37 : i64
    %3087 = func.call @cc_make_string(%3085, %3086) : (!llvm.ptr, i64) -> i64
    %3088 = func.call @cc_nil_value() : () -> i64
    %3089 = func.call @cc_intern(%3087, %3088) : (i64, i64) -> i64
    %3090 = func.call @cc_nil_value() : () -> i64
    %3091 = func.call @cc_cons(%3089, %3090) : (i64, i64) -> i64
    %3092 = func.call @cc_values_pack(%3091) : (i64) -> i64
    %3093 = func.call @cc_symbol_value(%3089) : (i64) -> i64
    %3094 = llvm.mlir.addressof @str305 : !llvm.ptr
    %3095 = arith.constant 39 : i64
    %3096 = func.call @cc_make_string(%3094, %3095) : (!llvm.ptr, i64) -> i64
    %3097 = func.call @cc_nil_value() : () -> i64
    %3098 = func.call @cc_intern(%3096, %3097) : (i64, i64) -> i64
    %3099 = func.call @cc_nil_value() : () -> i64
    %3100 = func.call @cc_cons(%3098, %3099) : (i64, i64) -> i64
    %3101 = func.call @cc_values_pack(%3100) : (i64) -> i64
    %3102 = func.call @cc_symbol_value(%3098) : (i64) -> i64
    %3103 = func.call @cc_nil_value() : () -> i64
    %3104 = arith.cmpi ne, %3093, %3103 : i64
    %3105 = scf.if %3104 -> (i64) {
      scf.yield %3102 : i64
    } else {
      scf.yield %3084 : i64
    }
    %3106 = func.call @cc_values_pack(%3105) : (i64) -> i64
    func.call @stack_push_pointer(%3106) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %3107 = llvm.mlir.addressof @str306 : !llvm.ptr
    %3108 = arith.constant 6 : i64
    %3109 = func.call @cc_make_string(%3107, %3108) : (!llvm.ptr, i64) -> i64
    %3110 = func.call @cc_nil_value() : () -> i64
    %3111 = func.call @cc_intern(%3109, %3110) : (i64, i64) -> i64
    %3112 = func.call @cc_nil_value() : () -> i64
    %3113 = func.call @cc_cons(%3111, %3112) : (i64, i64) -> i64
    %3114 = func.call @cc_values_pack(%3113) : (i64) -> i64
    %3115 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%3111, %3115) : (i64, i64) -> ()
    %3116 = func.call @cc_nil_value() : () -> i64
    %3117 = llvm.mlir.addressof @str307 : !llvm.ptr
    %3118 = arith.constant 37 : i64
    %3119 = func.call @cc_make_string(%3117, %3118) : (!llvm.ptr, i64) -> i64
    %3120 = func.call @cc_nil_value() : () -> i64
    %3121 = func.call @cc_intern(%3119, %3120) : (i64, i64) -> i64
    %3122 = func.call @cc_nil_value() : () -> i64
    %3123 = func.call @cc_cons(%3121, %3122) : (i64, i64) -> i64
    %3124 = func.call @cc_values_pack(%3123) : (i64) -> i64
    %3125 = func.call @cc_set_symbol_value(%3121, %3116) : (i64, i64) -> i64
    %3126 = llvm.mlir.addressof @str308 : !llvm.ptr
    %3127 = arith.constant 38 : i64
    %3128 = func.call @cc_make_string(%3126, %3127) : (!llvm.ptr, i64) -> i64
    %3129 = func.call @cc_nil_value() : () -> i64
    %3130 = func.call @cc_intern(%3128, %3129) : (i64, i64) -> i64
    %3131 = func.call @cc_nil_value() : () -> i64
    %3132 = func.call @cc_cons(%3130, %3131) : (i64, i64) -> i64
    %3133 = func.call @cc_values_pack(%3132) : (i64) -> i64
    %3134 = func.call @cc_set_symbol_value(%3130, %3116) : (i64, i64) -> i64
    %3135 = llvm.mlir.addressof @str309 : !llvm.ptr
    %3136 = arith.constant 39 : i64
    %3137 = func.call @cc_make_string(%3135, %3136) : (!llvm.ptr, i64) -> i64
    %3138 = func.call @cc_nil_value() : () -> i64
    %3139 = func.call @cc_intern(%3137, %3138) : (i64, i64) -> i64
    %3140 = func.call @cc_nil_value() : () -> i64
    %3141 = func.call @cc_cons(%3139, %3140) : (i64, i64) -> i64
    %3142 = func.call @cc_values_pack(%3141) : (i64) -> i64
    %3143 = func.call @cc_set_symbol_value(%3139, %3116) : (i64, i64) -> i64
    %3144 = func.call @cc_nil_value() : () -> i64
    %3145 = func.call @cc_nil_value() : () -> i64
    %3146 = func.call @cc_errorp(%3144) : (i64) -> i64
    %3147 = arith.cmpi ne, %3146, %3145 : i64
    %3148 = scf.if %3147 -> (i64) {
      scf.yield %3144 : i64
    } else {
      %3149 = func.call @cc_nil_value() : () -> i64
      %3150 = func.call @cc_nil_value() : () -> i64
      %3151 = func.call @cc_errorp(%3149) : (i64) -> i64
      %3152 = arith.cmpi ne, %3151, %3150 : i64
      %3153 = scf.if %3152 -> (i64) {
        scf.yield %3149 : i64
      } else {
        %3154 = llvm.mlir.addressof @str310 : !llvm.ptr
        %3155 = arith.constant 11 : i64
        %3156 = func.call @cc_make_string(%3154, %3155) : (!llvm.ptr, i64) -> i64
        %3157 = func.call @cc_nil_value() : () -> i64
        %3158 = func.call @cc_intern(%3156, %3157) : (i64, i64) -> i64
        %3159 = func.call @cc_nil_value() : () -> i64
        %3160 = func.call @cc_cons(%3158, %3159) : (i64, i64) -> i64
        %3161 = func.call @cc_values_pack(%3160) : (i64) -> i64
        func.call @stack_push_pointer(%3158) : (i64) -> ()
        %3162 = func.call @stack_pop_pointer() : () -> i64
        %3163 = func.call @cc_nil_value() : () -> i64
        %3164 = func.call @cc_errorp(%3162) : (i64) -> i64
        %3165 = arith.cmpi ne, %3164, %3163 : i64
        %3166 = arith.cmpi eq, %3163, %3163 : i64
        %3167 = arith.andi %3165, %3166 : i1
        %3168 = scf.if %3167 -> (i64) {
          scf.yield %3162 : i64
        } else {
          scf.yield %3163 : i64
        }
        %3169 = arith.cmpi ne, %3168, %3163 : i64
        scf.if %3169 {
          func.call @stack_push_pointer(%3168) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3162) : (i64) -> ()
          %3170 = llvm.mlir.addressof @str311 : !llvm.ptr
          %3171 = func.call @cc_make_function_ref_const(%3170) : (!llvm.ptr) -> i64
          %3172 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3171, %3172) : (i64, i64) -> ()
        }
        %3173 = func.call @stack_pop_pointer() : () -> i64
        %3174 = func.call @cc_nil_value() : () -> i64
        %3175 = arith.cmpi ne, %3173, %3174 : i64
        scf.if %3175 {
          %3176 = llvm.mlir.addressof @str312 : !llvm.ptr
          %3177 = arith.constant 11 : i64
          %3178 = func.call @cc_make_string(%3176, %3177) : (!llvm.ptr, i64) -> i64
          %3179 = func.call @cc_nil_value() : () -> i64
          %3180 = func.call @cc_intern(%3178, %3179) : (i64, i64) -> i64
          %3181 = func.call @cc_nil_value() : () -> i64
          %3182 = func.call @cc_cons(%3180, %3181) : (i64, i64) -> i64
          %3183 = func.call @cc_values_pack(%3182) : (i64) -> i64
          func.call @stack_push_pointer(%3180) : (i64) -> ()
          %3184 = func.call @stack_pop_pointer() : () -> i64
          %3185 = func.call @cc_nil_value() : () -> i64
          %3186 = func.call @cc_errorp(%3184) : (i64) -> i64
          %3187 = arith.cmpi ne, %3186, %3185 : i64
          %3188 = arith.cmpi eq, %3185, %3185 : i64
          %3189 = arith.andi %3187, %3188 : i1
          %3190 = scf.if %3189 -> (i64) {
            scf.yield %3184 : i64
          } else {
            scf.yield %3185 : i64
          }
          %3191 = arith.cmpi ne, %3190, %3185 : i64
          scf.if %3191 {
            func.call @stack_push_pointer(%3190) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3184) : (i64) -> ()
            %3192 = llvm.mlir.addressof @str313 : !llvm.ptr
            %3193 = func.call @cc_make_function_ref_const(%3192) : (!llvm.ptr) -> i64
            %3194 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3193, %3194) : (i64, i64) -> ()
          }
        } else {
          %3195 = llvm.mlir.addressof @str314 : !llvm.ptr
          %3196 = arith.constant 11 : i64
          %3197 = func.call @cc_make_string(%3195, %3196) : (!llvm.ptr, i64) -> i64
          %3198 = func.call @cc_nil_value() : () -> i64
          %3199 = func.call @cc_intern(%3197, %3198) : (i64, i64) -> i64
          %3200 = func.call @cc_nil_value() : () -> i64
          %3201 = func.call @cc_cons(%3199, %3200) : (i64, i64) -> i64
          %3202 = func.call @cc_values_pack(%3201) : (i64) -> i64
          func.call @stack_push_pointer(%3199) : (i64) -> ()
          %3203 = func.call @stack_pop_pointer() : () -> i64
          %3204 = func.call @cc_nil_value() : () -> i64
          %3205 = func.call @cc_errorp(%3203) : (i64) -> i64
          %3206 = arith.cmpi ne, %3205, %3204 : i64
          %3207 = arith.cmpi eq, %3204, %3204 : i64
          %3208 = arith.andi %3206, %3207 : i1
          %3209 = scf.if %3208 -> (i64) {
            scf.yield %3203 : i64
          } else {
            scf.yield %3204 : i64
          }
          %3210 = arith.cmpi ne, %3209, %3204 : i64
          scf.if %3210 {
            func.call @stack_push_pointer(%3209) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3203) : (i64) -> ()
            %3211 = llvm.mlir.addressof @str315 : !llvm.ptr
            %3212 = func.call @cc_make_function_ref_const(%3211) : (!llvm.ptr) -> i64
            %3213 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3212, %3213) : (i64, i64) -> ()
          }
        }
        %3214 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3214 : i64
      }
      %3215 = func.call @cc_nil_value() : () -> i64
      %3216 = func.call @cc_errorp(%3153) : (i64) -> i64
      %3217 = arith.cmpi ne, %3216, %3215 : i64
      %3218 = scf.if %3217 -> (i64) {
        scf.yield %3153 : i64
      } else {
        %3219 = llvm.mlir.addressof @str316 : !llvm.ptr
        %3220 = arith.constant 2 : i64
        %3221 = func.call @cc_make_string(%3219, %3220) : (!llvm.ptr, i64) -> i64
        %3222 = llvm.mlir.addressof @str317 : !llvm.ptr
        %3223 = arith.constant 7 : i64
        %3224 = func.call @cc_make_string(%3222, %3223) : (!llvm.ptr, i64) -> i64
        %3225 = func.call @cc_intern(%3221, %3224) : (i64, i64) -> i64
        %3226 = func.call @cc_nil_value() : () -> i64
        %3227 = func.call @cc_cons(%3225, %3226) : (i64, i64) -> i64
        %3228 = func.call @cc_values_pack(%3227) : (i64) -> i64
        func.call @stack_push_pointer(%3225) : (i64) -> ()
        %3229 = func.call @stack_pop_pointer() : () -> i64
        %3230 = llvm.mlir.addressof @str318 : !llvm.ptr
        %3231 = arith.constant 11 : i64
        %3232 = func.call @cc_make_string(%3230, %3231) : (!llvm.ptr, i64) -> i64
        %3233 = func.call @cc_nil_value() : () -> i64
        %3234 = func.call @cc_intern(%3232, %3233) : (i64, i64) -> i64
        %3235 = func.call @cc_nil_value() : () -> i64
        %3236 = func.call @cc_cons(%3234, %3235) : (i64, i64) -> i64
        %3237 = func.call @cc_values_pack(%3236) : (i64) -> i64
        func.call @stack_push_pointer(%3234) : (i64) -> ()
        %3238 = func.call @stack_pop_pointer() : () -> i64
        %3239 = func.call @cc_nil_value() : () -> i64
        %3240 = func.call @cc_errorp(%3229) : (i64) -> i64
        %3241 = arith.cmpi ne, %3240, %3239 : i64
        %3242 = arith.cmpi eq, %3239, %3239 : i64
        %3243 = arith.andi %3241, %3242 : i1
        %3244 = scf.if %3243 -> (i64) {
          scf.yield %3229 : i64
        } else {
          scf.yield %3239 : i64
        }
        %3245 = func.call @cc_errorp(%3238) : (i64) -> i64
        %3246 = arith.cmpi ne, %3245, %3239 : i64
        %3247 = arith.cmpi eq, %3244, %3239 : i64
        %3248 = arith.andi %3246, %3247 : i1
        %3249 = scf.if %3248 -> (i64) {
          scf.yield %3238 : i64
        } else {
          scf.yield %3244 : i64
        }
        %3250 = arith.cmpi ne, %3249, %3239 : i64
        scf.if %3250 {
          func.call @stack_push_pointer(%3249) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3229) : (i64) -> ()
          func.call @stack_push_pointer(%3238) : (i64) -> ()
          %3251 = llvm.mlir.addressof @str319 : !llvm.ptr
          %3252 = func.call @cc_make_function_ref_const(%3251) : (!llvm.ptr) -> i64
          %3253 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3252, %3253) : (i64, i64) -> ()
        }
        %3254 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3254 : i64
      }
      %3255 = func.call @cc_nil_value() : () -> i64
      %3256 = func.call @cc_errorp(%3218) : (i64) -> i64
      %3257 = arith.cmpi ne, %3256, %3255 : i64
      %3258 = scf.if %3257 -> (i64) {
        scf.yield %3218 : i64
      } else {
        %3259 = llvm.mlir.addressof @str320 : !llvm.ptr
        %3260 = arith.constant 4 : i64
        %3261 = func.call @cc_make_string(%3259, %3260) : (!llvm.ptr, i64) -> i64
        %3262 = llvm.mlir.addressof @str321 : !llvm.ptr
        %3263 = arith.constant 11 : i64
        %3264 = func.call @cc_make_string(%3262, %3263) : (!llvm.ptr, i64) -> i64
        %3265 = func.call @cc_intern(%3261, %3264) : (i64, i64) -> i64
        %3266 = func.call @cc_nil_value() : () -> i64
        %3267 = func.call @cc_cons(%3265, %3266) : (i64, i64) -> i64
        %3268 = func.call @cc_values_pack(%3267) : (i64) -> i64
        func.call @stack_push_pointer(%3265) : (i64) -> ()
        %3269 = func.call @stack_pop_pointer() : () -> i64
        %3270 = func.call @cc_string(%3269) : (i64) -> i64
        func.call @stack_push_pointer(%3270) : (i64) -> ()
        %3271 = func.call @stack_pop_pointer() : () -> i64
        %3272 = llvm.mlir.addressof @str322 : !llvm.ptr
        %3273 = arith.constant 11 : i64
        %3274 = func.call @cc_make_string(%3272, %3273) : (!llvm.ptr, i64) -> i64
        %3275 = func.call @cc_nil_value() : () -> i64
        %3276 = func.call @cc_intern(%3274, %3275) : (i64, i64) -> i64
        %3277 = func.call @cc_nil_value() : () -> i64
        %3278 = func.call @cc_cons(%3276, %3277) : (i64, i64) -> i64
        %3279 = func.call @cc_values_pack(%3278) : (i64) -> i64
        func.call @stack_push_pointer(%3276) : (i64) -> ()
        %3280 = func.call @stack_pop_pointer() : () -> i64
        %3281 = func.call @cc_nil_value() : () -> i64
        %3282 = func.call @cc_errorp(%3271) : (i64) -> i64
        %3283 = arith.cmpi ne, %3282, %3281 : i64
        %3284 = arith.cmpi eq, %3281, %3281 : i64
        %3285 = arith.andi %3283, %3284 : i1
        %3286 = scf.if %3285 -> (i64) {
          scf.yield %3271 : i64
        } else {
          scf.yield %3281 : i64
        }
        %3287 = func.call @cc_errorp(%3280) : (i64) -> i64
        %3288 = arith.cmpi ne, %3287, %3281 : i64
        %3289 = arith.cmpi eq, %3286, %3281 : i64
        %3290 = arith.andi %3288, %3289 : i1
        %3291 = scf.if %3290 -> (i64) {
          scf.yield %3280 : i64
        } else {
          scf.yield %3286 : i64
        }
        %3292 = arith.cmpi ne, %3291, %3281 : i64
        scf.if %3292 {
          func.call @stack_push_pointer(%3291) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3271) : (i64) -> ()
          func.call @stack_push_pointer(%3280) : (i64) -> ()
          %3293 = llvm.mlir.addressof @str323 : !llvm.ptr
          %3294 = func.call @cc_make_function_ref_const(%3293) : (!llvm.ptr) -> i64
          %3295 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3294, %3295) : (i64, i64) -> ()
        }
        %3296 = func.call @stack_pop_pointer() : () -> i64
        %3297 = llvm.mlir.addressof @str324 : !llvm.ptr
        %3298 = arith.constant 11 : i64
        %3299 = func.call @cc_make_string(%3297, %3298) : (!llvm.ptr, i64) -> i64
        %3300 = func.call @cc_nil_value() : () -> i64
        %3301 = func.call @cc_intern(%3299, %3300) : (i64, i64) -> i64
        %3302 = func.call @cc_nil_value() : () -> i64
        %3303 = func.call @cc_cons(%3301, %3302) : (i64, i64) -> i64
        %3304 = func.call @cc_values_pack(%3303) : (i64) -> i64
        func.call @stack_push_pointer(%3301) : (i64) -> ()
        %3305 = func.call @stack_pop_pointer() : () -> i64
        %3306 = func.call @cc_nil_value() : () -> i64
        %3307 = func.call @cc_errorp(%3296) : (i64) -> i64
        %3308 = arith.cmpi ne, %3307, %3306 : i64
        %3309 = arith.cmpi eq, %3306, %3306 : i64
        %3310 = arith.andi %3308, %3309 : i1
        %3311 = scf.if %3310 -> (i64) {
          scf.yield %3296 : i64
        } else {
          scf.yield %3306 : i64
        }
        %3312 = func.call @cc_errorp(%3305) : (i64) -> i64
        %3313 = arith.cmpi ne, %3312, %3306 : i64
        %3314 = arith.cmpi eq, %3311, %3306 : i64
        %3315 = arith.andi %3313, %3314 : i1
        %3316 = scf.if %3315 -> (i64) {
          scf.yield %3305 : i64
        } else {
          scf.yield %3311 : i64
        }
        %3317 = arith.cmpi ne, %3316, %3306 : i64
        scf.if %3317 {
          func.call @stack_push_pointer(%3316) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3296) : (i64) -> ()
          func.call @stack_push_pointer(%3305) : (i64) -> ()
          %3318 = llvm.mlir.addressof @str325 : !llvm.ptr
          %3319 = func.call @cc_make_function_ref_const(%3318) : (!llvm.ptr) -> i64
          %3320 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3319, %3320) : (i64, i64) -> ()
        }
        %3321 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3321 : i64
      }
      %3322 = func.call @cc_nil_value() : () -> i64
      %3323 = func.call @cc_errorp(%3258) : (i64) -> i64
      %3324 = arith.cmpi ne, %3323, %3322 : i64
      %3325 = scf.if %3324 -> (i64) {
        scf.yield %3258 : i64
      } else {
        %3326 = llvm.mlir.addressof @str326 : !llvm.ptr
        %3327 = arith.constant 17 : i64
        %3328 = func.call @cc_make_string(%3326, %3327) : (!llvm.ptr, i64) -> i64
        %3329 = llvm.mlir.addressof @str327 : !llvm.ptr
        %3330 = arith.constant 11 : i64
        %3331 = func.call @cc_make_string(%3329, %3330) : (!llvm.ptr, i64) -> i64
        %3332 = func.call @cc_intern(%3328, %3331) : (i64, i64) -> i64
        %3333 = func.call @cc_nil_value() : () -> i64
        %3334 = func.call @cc_cons(%3332, %3333) : (i64, i64) -> i64
        %3335 = func.call @cc_values_pack(%3334) : (i64) -> i64
        func.call @stack_push_pointer(%3332) : (i64) -> ()
        %3336 = func.call @stack_pop_pointer() : () -> i64
        %3337 = func.call @cc_string(%3336) : (i64) -> i64
        func.call @stack_push_pointer(%3337) : (i64) -> ()
        %3338 = func.call @stack_pop_pointer() : () -> i64
        %3339 = llvm.mlir.addressof @str328 : !llvm.ptr
        %3340 = arith.constant 11 : i64
        %3341 = func.call @cc_make_string(%3339, %3340) : (!llvm.ptr, i64) -> i64
        %3342 = func.call @cc_nil_value() : () -> i64
        %3343 = func.call @cc_intern(%3341, %3342) : (i64, i64) -> i64
        %3344 = func.call @cc_nil_value() : () -> i64
        %3345 = func.call @cc_cons(%3343, %3344) : (i64, i64) -> i64
        %3346 = func.call @cc_values_pack(%3345) : (i64) -> i64
        func.call @stack_push_pointer(%3343) : (i64) -> ()
        %3347 = func.call @stack_pop_pointer() : () -> i64
        %3348 = func.call @cc_nil_value() : () -> i64
        %3349 = func.call @cc_errorp(%3338) : (i64) -> i64
        %3350 = arith.cmpi ne, %3349, %3348 : i64
        %3351 = arith.cmpi eq, %3348, %3348 : i64
        %3352 = arith.andi %3350, %3351 : i1
        %3353 = scf.if %3352 -> (i64) {
          scf.yield %3338 : i64
        } else {
          scf.yield %3348 : i64
        }
        %3354 = func.call @cc_errorp(%3347) : (i64) -> i64
        %3355 = arith.cmpi ne, %3354, %3348 : i64
        %3356 = arith.cmpi eq, %3353, %3348 : i64
        %3357 = arith.andi %3355, %3356 : i1
        %3358 = scf.if %3357 -> (i64) {
          scf.yield %3347 : i64
        } else {
          scf.yield %3353 : i64
        }
        %3359 = arith.cmpi ne, %3358, %3348 : i64
        scf.if %3359 {
          func.call @stack_push_pointer(%3358) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3338) : (i64) -> ()
          func.call @stack_push_pointer(%3347) : (i64) -> ()
          %3360 = llvm.mlir.addressof @str329 : !llvm.ptr
          %3361 = func.call @cc_make_function_ref_const(%3360) : (!llvm.ptr) -> i64
          %3362 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3361, %3362) : (i64, i64) -> ()
        }
        %3363 = func.call @stack_pop_pointer() : () -> i64
        %3364 = llvm.mlir.addressof @str330 : !llvm.ptr
        %3365 = arith.constant 11 : i64
        %3366 = func.call @cc_make_string(%3364, %3365) : (!llvm.ptr, i64) -> i64
        %3367 = func.call @cc_nil_value() : () -> i64
        %3368 = func.call @cc_intern(%3366, %3367) : (i64, i64) -> i64
        %3369 = func.call @cc_nil_value() : () -> i64
        %3370 = func.call @cc_cons(%3368, %3369) : (i64, i64) -> i64
        %3371 = func.call @cc_values_pack(%3370) : (i64) -> i64
        func.call @stack_push_pointer(%3368) : (i64) -> ()
        %3372 = func.call @stack_pop_pointer() : () -> i64
        %3373 = func.call @cc_nil_value() : () -> i64
        %3374 = func.call @cc_errorp(%3363) : (i64) -> i64
        %3375 = arith.cmpi ne, %3374, %3373 : i64
        %3376 = arith.cmpi eq, %3373, %3373 : i64
        %3377 = arith.andi %3375, %3376 : i1
        %3378 = scf.if %3377 -> (i64) {
          scf.yield %3363 : i64
        } else {
          scf.yield %3373 : i64
        }
        %3379 = func.call @cc_errorp(%3372) : (i64) -> i64
        %3380 = arith.cmpi ne, %3379, %3373 : i64
        %3381 = arith.cmpi eq, %3378, %3373 : i64
        %3382 = arith.andi %3380, %3381 : i1
        %3383 = scf.if %3382 -> (i64) {
          scf.yield %3372 : i64
        } else {
          scf.yield %3378 : i64
        }
        %3384 = arith.cmpi ne, %3383, %3373 : i64
        scf.if %3384 {
          func.call @stack_push_pointer(%3383) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3363) : (i64) -> ()
          func.call @stack_push_pointer(%3372) : (i64) -> ()
          %3385 = llvm.mlir.addressof @str331 : !llvm.ptr
          %3386 = func.call @cc_make_function_ref_const(%3385) : (!llvm.ptr) -> i64
          %3387 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3386, %3387) : (i64, i64) -> ()
        }
        %3388 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3388 : i64
      }
      %3389 = func.call @cc_nil_value() : () -> i64
      %3390 = func.call @cc_errorp(%3325) : (i64) -> i64
      %3391 = arith.cmpi ne, %3390, %3389 : i64
      %3392 = scf.if %3391 -> (i64) {
        scf.yield %3325 : i64
      } else {
        %3393 = llvm.mlir.addressof @str332 : !llvm.ptr
        %3394 = arith.constant 11 : i64
        %3395 = func.call @cc_make_string(%3393, %3394) : (!llvm.ptr, i64) -> i64
        %3396 = func.call @cc_nil_value() : () -> i64
        %3397 = func.call @cc_intern(%3395, %3396) : (i64, i64) -> i64
        %3398 = func.call @cc_nil_value() : () -> i64
        %3399 = func.call @cc_cons(%3397, %3398) : (i64, i64) -> i64
        %3400 = func.call @cc_values_pack(%3399) : (i64) -> i64
        func.call @stack_push_pointer(%3397) : (i64) -> ()
        %3401 = func.call @stack_pop_pointer() : () -> i64
        %3402 = func.call @cc_nil_value() : () -> i64
        %3403 = func.call @cc_errorp(%3401) : (i64) -> i64
        %3404 = arith.cmpi ne, %3403, %3402 : i64
        %3405 = arith.cmpi eq, %3402, %3402 : i64
        %3406 = arith.andi %3404, %3405 : i1
        %3407 = scf.if %3406 -> (i64) {
          scf.yield %3401 : i64
        } else {
          scf.yield %3402 : i64
        }
        %3408 = arith.cmpi ne, %3407, %3402 : i64
        scf.if %3408 {
          func.call @stack_push_pointer(%3407) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3401) : (i64) -> ()
          %3409 = llvm.mlir.addressof @str333 : !llvm.ptr
          %3410 = func.call @cc_make_function_ref_const(%3409) : (!llvm.ptr) -> i64
          %3411 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3410, %3411) : (i64, i64) -> ()
        }
        %3412 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3412 : i64
      }
      func.call @stack_push_pointer(%3392) : (i64) -> ()
      %3413 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3413 : i64
    }
    %3414 = func.call @cc_nil_value() : () -> i64
    %3415 = func.call @cc_errorp(%3148) : (i64) -> i64
    %3416 = arith.cmpi ne, %3415, %3414 : i64
    %3417 = scf.if %3416 -> (i64) {
      scf.yield %3148 : i64
    } else {
      %3418 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3419 = arith.constant 11 : i64
      %3420 = func.call @cc_make_string(%3418, %3419) : (!llvm.ptr, i64) -> i64
      %3421 = func.call @cc_nil_value() : () -> i64
      %3422 = func.call @cc_intern(%3420, %3421) : (i64, i64) -> i64
      %3423 = func.call @cc_nil_value() : () -> i64
      %3424 = func.call @cc_cons(%3422, %3423) : (i64, i64) -> i64
      %3425 = func.call @cc_values_pack(%3424) : (i64) -> i64
      func.call @stack_push_pointer(%3422) : (i64) -> ()
      %3426 = func.call @stack_pop_pointer() : () -> i64
      %3427 = func.call @cc_in_package(%3426) : (i64) -> i64
      func.call @stack_push_pointer(%3427) : (i64) -> ()
      %3428 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3428 : i64
    }
    %3429 = func.call @cc_nil_value() : () -> i64
    %3430 = func.call @cc_errorp(%3417) : (i64) -> i64
    %3431 = arith.cmpi ne, %3430, %3429 : i64
    %3432 = scf.if %3431 -> (i64) {
      scf.yield %3417 : i64
    } else {
      %3433 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3434 = arith.constant 23 : i64
      %3435 = func.call @cc_make_string(%3433, %3434) : (!llvm.ptr, i64) -> i64
      %3436 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3437 = arith.constant 11 : i64
      %3438 = func.call @cc_make_string(%3436, %3437) : (!llvm.ptr, i64) -> i64
      %3439 = func.call @cc_intern(%3435, %3438) : (i64, i64) -> i64
      %3440 = func.call @cc_nil_value() : () -> i64
      %3441 = func.call @cc_cons(%3439, %3440) : (i64, i64) -> i64
      %3442 = func.call @cc_values_pack(%3441) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3443 = func.call @stack_pop_pointer() : () -> i64
      %3444 = func.call @cc_set_symbol_value(%3439, %3443) : (i64, i64) -> i64
      %3445 = func.call @cc_errorp(%3444) : (i64) -> i64
      %3446 = func.call @cc_nil_value() : () -> i64
      %3447 = arith.cmpi ne, %3445, %3446 : i64
      scf.if %3447 {
        func.call @stack_push_pointer(%3444) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3439) : (i64) -> ()
      }
      %3448 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3448 : i64
    }
    %3449 = func.call @cc_nil_value() : () -> i64
    %3450 = func.call @cc_errorp(%3432) : (i64) -> i64
    %3451 = arith.cmpi ne, %3450, %3449 : i64
    %3452 = scf.if %3451 -> (i64) {
      scf.yield %3432 : i64
    } else {
      %3453 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3454 = arith.constant 25 : i64
      %3455 = func.call @cc_make_string(%3453, %3454) : (!llvm.ptr, i64) -> i64
      %3456 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3457 = arith.constant 11 : i64
      %3458 = func.call @cc_make_string(%3456, %3457) : (!llvm.ptr, i64) -> i64
      %3459 = func.call @cc_intern(%3455, %3458) : (i64, i64) -> i64
      %3460 = func.call @cc_nil_value() : () -> i64
      %3461 = func.call @cc_cons(%3459, %3460) : (i64, i64) -> i64
      %3462 = func.call @cc_values_pack(%3461) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3463 = func.call @stack_pop_pointer() : () -> i64
      %3464 = func.call @cc_set_symbol_value(%3459, %3463) : (i64, i64) -> i64
      %3465 = func.call @cc_errorp(%3464) : (i64) -> i64
      %3466 = func.call @cc_nil_value() : () -> i64
      %3467 = arith.cmpi ne, %3465, %3466 : i64
      scf.if %3467 {
        func.call @stack_push_pointer(%3464) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3459) : (i64) -> ()
      }
      %3468 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3468 : i64
    }
    %3469 = func.call @cc_nil_value() : () -> i64
    %3470 = func.call @cc_errorp(%3452) : (i64) -> i64
    %3471 = arith.cmpi ne, %3470, %3469 : i64
    %3472 = scf.if %3471 -> (i64) {
      scf.yield %3452 : i64
    } else {
      %3473 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3474 = arith.constant 23 : i64
      %3475 = func.call @cc_make_string(%3473, %3474) : (!llvm.ptr, i64) -> i64
      %3476 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3477 = arith.constant 11 : i64
      %3478 = func.call @cc_make_string(%3476, %3477) : (!llvm.ptr, i64) -> i64
      %3479 = func.call @cc_intern(%3475, %3478) : (i64, i64) -> i64
      %3480 = func.call @cc_nil_value() : () -> i64
      %3481 = func.call @cc_cons(%3479, %3480) : (i64, i64) -> i64
      %3482 = func.call @cc_values_pack(%3481) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3483 = func.call @stack_pop_pointer() : () -> i64
      %3484 = func.call @cc_set_symbol_value(%3479, %3483) : (i64, i64) -> i64
      %3485 = func.call @cc_errorp(%3484) : (i64) -> i64
      %3486 = func.call @cc_nil_value() : () -> i64
      %3487 = arith.cmpi ne, %3485, %3486 : i64
      scf.if %3487 {
        func.call @stack_push_pointer(%3484) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3479) : (i64) -> ()
      }
      %3488 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3488 : i64
    }
    %3489 = func.call @cc_nil_value() : () -> i64
    %3490 = func.call @cc_errorp(%3472) : (i64) -> i64
    %3491 = arith.cmpi ne, %3490, %3489 : i64
    %3492 = scf.if %3491 -> (i64) {
      scf.yield %3472 : i64
    } else {
      %3493 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3494 = arith.constant 25 : i64
      %3495 = func.call @cc_make_string(%3493, %3494) : (!llvm.ptr, i64) -> i64
      %3496 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3497 = arith.constant 11 : i64
      %3498 = func.call @cc_make_string(%3496, %3497) : (!llvm.ptr, i64) -> i64
      %3499 = func.call @cc_intern(%3495, %3498) : (i64, i64) -> i64
      %3500 = func.call @cc_nil_value() : () -> i64
      %3501 = func.call @cc_cons(%3499, %3500) : (i64, i64) -> i64
      %3502 = func.call @cc_values_pack(%3501) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3503 = func.call @stack_pop_pointer() : () -> i64
      %3504 = func.call @cc_set_symbol_value(%3499, %3503) : (i64, i64) -> i64
      %3505 = func.call @cc_errorp(%3504) : (i64) -> i64
      %3506 = func.call @cc_nil_value() : () -> i64
      %3507 = arith.cmpi ne, %3505, %3506 : i64
      scf.if %3507 {
        func.call @stack_push_pointer(%3504) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3499) : (i64) -> ()
      }
      %3508 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3508 : i64
    }
    %3509 = func.call @cc_nil_value() : () -> i64
    %3510 = func.call @cc_errorp(%3492) : (i64) -> i64
    %3511 = arith.cmpi ne, %3510, %3509 : i64
    %3512 = scf.if %3511 -> (i64) {
      scf.yield %3492 : i64
    } else {
      %3513 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3514 = arith.constant 19 : i64
      %3515 = func.call @cc_make_string(%3513, %3514) : (!llvm.ptr, i64) -> i64
      %3516 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3517 = arith.constant 11 : i64
      %3518 = func.call @cc_make_string(%3516, %3517) : (!llvm.ptr, i64) -> i64
      %3519 = func.call @cc_intern(%3515, %3518) : (i64, i64) -> i64
      %3520 = func.call @cc_nil_value() : () -> i64
      %3521 = func.call @cc_cons(%3519, %3520) : (i64, i64) -> i64
      %3522 = func.call @cc_values_pack(%3521) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3523 = func.call @stack_pop_pointer() : () -> i64
      %3524 = func.call @cc_set_symbol_value(%3519, %3523) : (i64, i64) -> i64
      %3525 = func.call @cc_errorp(%3524) : (i64) -> i64
      %3526 = func.call @cc_nil_value() : () -> i64
      %3527 = arith.cmpi ne, %3525, %3526 : i64
      scf.if %3527 {
        func.call @stack_push_pointer(%3524) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3519) : (i64) -> ()
      }
      %3528 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3528 : i64
    }
    %3529 = func.call @cc_nil_value() : () -> i64
    %3530 = func.call @cc_errorp(%3512) : (i64) -> i64
    %3531 = arith.cmpi ne, %3530, %3529 : i64
    %3532 = scf.if %3531 -> (i64) {
      scf.yield %3512 : i64
    } else {
      %3533 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3534 = arith.constant 21 : i64
      %3535 = func.call @cc_make_string(%3533, %3534) : (!llvm.ptr, i64) -> i64
      %3536 = llvm.mlir.addressof @str346 : !llvm.ptr
      %3537 = arith.constant 11 : i64
      %3538 = func.call @cc_make_string(%3536, %3537) : (!llvm.ptr, i64) -> i64
      %3539 = func.call @cc_intern(%3535, %3538) : (i64, i64) -> i64
      %3540 = func.call @cc_nil_value() : () -> i64
      %3541 = func.call @cc_cons(%3539, %3540) : (i64, i64) -> i64
      %3542 = func.call @cc_values_pack(%3541) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3543 = func.call @stack_pop_pointer() : () -> i64
      %3544 = func.call @cc_set_symbol_value(%3539, %3543) : (i64, i64) -> i64
      %3545 = func.call @cc_errorp(%3544) : (i64) -> i64
      %3546 = func.call @cc_nil_value() : () -> i64
      %3547 = arith.cmpi ne, %3545, %3546 : i64
      scf.if %3547 {
        func.call @stack_push_pointer(%3544) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3539) : (i64) -> ()
      }
      %3548 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3548 : i64
    }
    %3549 = func.call @cc_nil_value() : () -> i64
    %3550 = func.call @cc_errorp(%3532) : (i64) -> i64
    %3551 = arith.cmpi ne, %3550, %3549 : i64
    %3552 = scf.if %3551 -> (i64) {
      scf.yield %3532 : i64
    } else {
      %3553 = llvm.mlir.addressof @str347 : !llvm.ptr
      %3554 = arith.constant 25 : i64
      %3555 = func.call @cc_make_string(%3553, %3554) : (!llvm.ptr, i64) -> i64
      %3556 = llvm.mlir.addressof @str348 : !llvm.ptr
      %3557 = arith.constant 11 : i64
      %3558 = func.call @cc_make_string(%3556, %3557) : (!llvm.ptr, i64) -> i64
      %3559 = func.call @cc_intern(%3555, %3558) : (i64, i64) -> i64
      %3560 = func.call @cc_nil_value() : () -> i64
      %3561 = func.call @cc_cons(%3559, %3560) : (i64, i64) -> i64
      %3562 = func.call @cc_values_pack(%3561) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3563 = func.call @stack_pop_pointer() : () -> i64
      %3564 = func.call @cc_set_symbol_value(%3559, %3563) : (i64, i64) -> i64
      %3565 = func.call @cc_errorp(%3564) : (i64) -> i64
      %3566 = func.call @cc_nil_value() : () -> i64
      %3567 = arith.cmpi ne, %3565, %3566 : i64
      scf.if %3567 {
        func.call @stack_push_pointer(%3564) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3559) : (i64) -> ()
      }
      %3568 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3568 : i64
    }
    %3569 = func.call @cc_nil_value() : () -> i64
    %3570 = func.call @cc_errorp(%3552) : (i64) -> i64
    %3571 = arith.cmpi ne, %3570, %3569 : i64
    %3572 = scf.if %3571 -> (i64) {
      scf.yield %3552 : i64
    } else {
      %3573 = llvm.mlir.addressof @str349 : !llvm.ptr
      %3574 = arith.constant 19 : i64
      %3575 = func.call @cc_make_string(%3573, %3574) : (!llvm.ptr, i64) -> i64
      %3576 = llvm.mlir.addressof @str350 : !llvm.ptr
      %3577 = arith.constant 11 : i64
      %3578 = func.call @cc_make_string(%3576, %3577) : (!llvm.ptr, i64) -> i64
      %3579 = func.call @cc_intern(%3575, %3578) : (i64, i64) -> i64
      %3580 = func.call @cc_nil_value() : () -> i64
      %3581 = func.call @cc_cons(%3579, %3580) : (i64, i64) -> i64
      %3582 = func.call @cc_values_pack(%3581) : (i64) -> i64
      %3583 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3583) : (i64) -> ()
      func.call @cc_make_hash_table_stack() : () -> ()
      %3584 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3584) : (i64) -> ()
      %3585 = func.call @stack_pop_pointer() : () -> i64
      %3586 = func.call @cc_set_symbol_value(%3579, %3585) : (i64, i64) -> i64
      %3587 = func.call @cc_errorp(%3586) : (i64) -> i64
      %3588 = func.call @cc_nil_value() : () -> i64
      %3589 = arith.cmpi ne, %3587, %3588 : i64
      scf.if %3589 {
        func.call @stack_push_pointer(%3586) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3579) : (i64) -> ()
      }
      %3590 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3590 : i64
    }
    %3591 = func.call @cc_nil_value() : () -> i64
    %3592 = func.call @cc_errorp(%3572) : (i64) -> i64
    %3593 = arith.cmpi ne, %3592, %3591 : i64
    %3594 = scf.if %3593 -> (i64) {
      scf.yield %3572 : i64
    } else {
      %3595 = llvm.mlir.addressof @str351 : !llvm.ptr
      %3596 = arith.constant 17 : i64
      %3597 = func.call @cc_make_string(%3595, %3596) : (!llvm.ptr, i64) -> i64
      %3598 = llvm.mlir.addressof @str352 : !llvm.ptr
      %3599 = arith.constant 11 : i64
      %3600 = func.call @cc_make_string(%3598, %3599) : (!llvm.ptr, i64) -> i64
      %3601 = func.call @cc_intern(%3597, %3600) : (i64, i64) -> i64
      %3602 = func.call @cc_nil_value() : () -> i64
      %3603 = func.call @cc_cons(%3601, %3602) : (i64, i64) -> i64
      %3604 = func.call @cc_values_pack(%3603) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3605 = func.call @stack_pop_pointer() : () -> i64
      %3606 = func.call @cc_set_symbol_value(%3601, %3605) : (i64, i64) -> i64
      %3607 = func.call @cc_errorp(%3606) : (i64) -> i64
      %3608 = func.call @cc_nil_value() : () -> i64
      %3609 = arith.cmpi ne, %3607, %3608 : i64
      scf.if %3609 {
        func.call @stack_push_pointer(%3606) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3601) : (i64) -> ()
      }
      %3610 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3610 : i64
    }
    %3611 = func.call @cc_nil_value() : () -> i64
    %3612 = func.call @cc_errorp(%3594) : (i64) -> i64
    %3613 = arith.cmpi ne, %3612, %3611 : i64
    %3614 = scf.if %3613 -> (i64) {
      scf.yield %3594 : i64
    } else {
      %3615 = llvm.mlir.addressof @str353 : !llvm.ptr
      %3616 = arith.constant 13 : i64
      %3617 = func.call @cc_make_string(%3615, %3616) : (!llvm.ptr, i64) -> i64
      %3618 = llvm.mlir.addressof @str354 : !llvm.ptr
      %3619 = arith.constant 11 : i64
      %3620 = func.call @cc_make_string(%3618, %3619) : (!llvm.ptr, i64) -> i64
      %3621 = func.call @cc_intern(%3617, %3620) : (i64, i64) -> i64
      %3622 = func.call @cc_nil_value() : () -> i64
      %3623 = func.call @cc_cons(%3621, %3622) : (i64, i64) -> i64
      %3624 = func.call @cc_values_pack(%3623) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3625 = func.call @stack_pop_pointer() : () -> i64
      %3626 = func.call @cc_set_symbol_value(%3621, %3625) : (i64, i64) -> i64
      %3627 = func.call @cc_errorp(%3626) : (i64) -> i64
      %3628 = func.call @cc_nil_value() : () -> i64
      %3629 = arith.cmpi ne, %3627, %3628 : i64
      scf.if %3629 {
        func.call @stack_push_pointer(%3626) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3621) : (i64) -> ()
      }
      %3630 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3630 : i64
    }
    %3631 = func.call @cc_nil_value() : () -> i64
    %3632 = func.call @cc_errorp(%3614) : (i64) -> i64
    %3633 = arith.cmpi ne, %3632, %3631 : i64
    %3634 = scf.if %3633 -> (i64) {
      scf.yield %3614 : i64
    } else {
      %3635 = llvm.mlir.addressof @str355 : !llvm.ptr
      %3636 = func.call @cc_make_function_ref_const(%3635) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3636) : (i64) -> ()
      %3637 = func.call @stack_pop_pointer() : () -> i64
      %3638 = llvm.mlir.addressof @str356 : !llvm.ptr
      %3639 = arith.constant 11 : i64
      %3640 = func.call @cc_make_string(%3638, %3639) : (!llvm.ptr, i64) -> i64
      %3641 = func.call @cc_nil_value() : () -> i64
      %3642 = func.call @cc_intern(%3640, %3641) : (i64, i64) -> i64
      %3643 = func.call @cc_nil_value() : () -> i64
      %3644 = func.call @cc_cons(%3642, %3643) : (i64, i64) -> i64
      %3645 = func.call @cc_values_pack(%3644) : (i64) -> i64
      %3646 = func.call @cc_set_symbol_value(%3642, %3637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3637) : (i64) -> ()
      %3647 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3647 : i64
    }
    %3648 = func.call @cc_nil_value() : () -> i64
    %3649 = func.call @cc_errorp(%3634) : (i64) -> i64
    %3650 = arith.cmpi ne, %3649, %3648 : i64
    %3651 = scf.if %3650 -> (i64) {
      scf.yield %3634 : i64
    } else {
      %3652 = llvm.mlir.addressof @str357 : !llvm.ptr
      %3653 = func.call @cc_make_function_ref_const(%3652) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3653) : (i64) -> ()
      %3654 = func.call @stack_pop_pointer() : () -> i64
      %3655 = llvm.mlir.addressof @str358 : !llvm.ptr
      %3656 = arith.constant 21 : i64
      %3657 = func.call @cc_make_string(%3655, %3656) : (!llvm.ptr, i64) -> i64
      %3658 = func.call @cc_nil_value() : () -> i64
      %3659 = func.call @cc_intern(%3657, %3658) : (i64, i64) -> i64
      %3660 = func.call @cc_nil_value() : () -> i64
      %3661 = func.call @cc_cons(%3659, %3660) : (i64, i64) -> i64
      %3662 = func.call @cc_values_pack(%3661) : (i64) -> i64
      %3663 = func.call @cc_set_symbol_value(%3659, %3654) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3654) : (i64) -> ()
      %3664 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3664 : i64
    }
    %3665 = func.call @cc_nil_value() : () -> i64
    %3666 = func.call @cc_errorp(%3651) : (i64) -> i64
    %3667 = arith.cmpi ne, %3666, %3665 : i64
    %3668 = scf.if %3667 -> (i64) {
      scf.yield %3651 : i64
    } else {
      %3832 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3833 = arith.constant 4 : i64
      %3834 = func.call @cc_make_string(%3832, %3833) : (!llvm.ptr, i64) -> i64
      %3835 = llvm.mlir.addressof @str379 : !llvm.ptr
      %3836 = arith.constant 9 : i64
      %3837 = func.call @cc_make_string(%3835, %3836) : (!llvm.ptr, i64) -> i64
      %3838 = llvm.mlir.addressof @str380 : !llvm.ptr
      %3839 = arith.constant 11 : i64
      %3840 = func.call @cc_make_string(%3838, %3839) : (!llvm.ptr, i64) -> i64
      %3841 = func.call @cc_intern(%3837, %3840) : (i64, i64) -> i64
      %3842 = func.call @cc_nil_value() : () -> i64
      %3843 = func.call @cc_cons(%3841, %3842) : (i64, i64) -> i64
      %3844 = func.call @cc_values_pack(%3843) : (i64) -> i64
      %3845 = func.call @cc_register_function_lambda_list_metadata_raw(%3841, %3834) : (i64, i64) -> i64
      %3846 = llvm.mlir.addressof @str381 : !llvm.ptr
      %3847 = func.call @cc_make_function_ref_const(%3846) : (!llvm.ptr) -> i64
      %3848 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3849 = arith.constant 9 : i64
      %3850 = func.call @cc_make_string(%3848, %3849) : (!llvm.ptr, i64) -> i64
      %3851 = llvm.mlir.addressof @str383 : !llvm.ptr
      %3852 = arith.constant 11 : i64
      %3853 = func.call @cc_make_string(%3851, %3852) : (!llvm.ptr, i64) -> i64
      %3854 = func.call @cc_intern(%3850, %3853) : (i64, i64) -> i64
      %3855 = func.call @cc_nil_value() : () -> i64
      %3856 = func.call @cc_cons(%3854, %3855) : (i64, i64) -> i64
      %3857 = func.call @cc_values_pack(%3856) : (i64) -> i64
      %3858 = func.call @cc_set_symbol_value(%3854, %3847) : (i64, i64) -> i64
      %3859 = llvm.mlir.addressof @str384 : !llvm.ptr
      %3860 = arith.constant 9 : i64
      %3861 = func.call @cc_make_string(%3859, %3860) : (!llvm.ptr, i64) -> i64
      %3862 = llvm.mlir.addressof @str385 : !llvm.ptr
      %3863 = arith.constant 11 : i64
      %3864 = func.call @cc_make_string(%3862, %3863) : (!llvm.ptr, i64) -> i64
      %3865 = func.call @cc_intern(%3861, %3864) : (i64, i64) -> i64
      %3866 = func.call @cc_nil_value() : () -> i64
      %3867 = func.call @cc_cons(%3865, %3866) : (i64, i64) -> i64
      %3868 = func.call @cc_values_pack(%3867) : (i64) -> i64
      func.call @stack_push_pointer(%3865) : (i64) -> ()
      %3869 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3869 : i64
    }
    %3870 = func.call @cc_nil_value() : () -> i64
    %3871 = func.call @cc_errorp(%3668) : (i64) -> i64
    %3872 = arith.cmpi ne, %3871, %3870 : i64
    %3873 = scf.if %3872 -> (i64) {
      scf.yield %3668 : i64
    } else {
      %3874 = llvm.mlir.addressof @str386 : !llvm.ptr
      %3875 = func.call @cc_make_function_ref_const(%3874) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3875) : (i64) -> ()
      %3876 = func.call @stack_pop_pointer() : () -> i64
      %3877 = llvm.mlir.addressof @str387 : !llvm.ptr
      %3878 = arith.constant 22 : i64
      %3879 = func.call @cc_make_string(%3877, %3878) : (!llvm.ptr, i64) -> i64
      %3880 = func.call @cc_nil_value() : () -> i64
      %3881 = func.call @cc_intern(%3879, %3880) : (i64, i64) -> i64
      %3882 = func.call @cc_nil_value() : () -> i64
      %3883 = func.call @cc_cons(%3881, %3882) : (i64, i64) -> i64
      %3884 = func.call @cc_values_pack(%3883) : (i64) -> i64
      %3885 = func.call @cc_set_symbol_value(%3881, %3876) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3876) : (i64) -> ()
      %3886 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3886 : i64
    }
    %3887 = func.call @cc_nil_value() : () -> i64
    %3888 = func.call @cc_errorp(%3873) : (i64) -> i64
    %3889 = arith.cmpi ne, %3888, %3887 : i64
    %3890 = scf.if %3889 -> (i64) {
      scf.yield %3873 : i64
    } else {
      %3891 = llvm.mlir.addressof @str388 : !llvm.ptr
      %3892 = func.call @cc_make_function_ref_const(%3891) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3892) : (i64) -> ()
      %3893 = func.call @stack_pop_pointer() : () -> i64
      %3894 = llvm.mlir.addressof @str389 : !llvm.ptr
      %3895 = arith.constant 21 : i64
      %3896 = func.call @cc_make_string(%3894, %3895) : (!llvm.ptr, i64) -> i64
      %3897 = func.call @cc_nil_value() : () -> i64
      %3898 = func.call @cc_intern(%3896, %3897) : (i64, i64) -> i64
      %3899 = func.call @cc_nil_value() : () -> i64
      %3900 = func.call @cc_cons(%3898, %3899) : (i64, i64) -> i64
      %3901 = func.call @cc_values_pack(%3900) : (i64) -> i64
      %3902 = func.call @cc_set_symbol_value(%3898, %3893) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3893) : (i64) -> ()
      %3903 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3903 : i64
    }
    %3904 = func.call @cc_nil_value() : () -> i64
    %3905 = func.call @cc_errorp(%3890) : (i64) -> i64
    %3906 = arith.cmpi ne, %3905, %3904 : i64
    %3907 = scf.if %3906 -> (i64) {
      scf.yield %3890 : i64
    } else {
      %3908 = llvm.mlir.addressof @str390 : !llvm.ptr
      %3909 = arith.constant 20 : i64
      %3910 = func.call @cc_make_string(%3908, %3909) : (!llvm.ptr, i64) -> i64
      %3911 = llvm.mlir.addressof @str391 : !llvm.ptr
      %3912 = arith.constant 11 : i64
      %3913 = func.call @cc_make_string(%3911, %3912) : (!llvm.ptr, i64) -> i64
      %3914 = func.call @cc_intern(%3910, %3913) : (i64, i64) -> i64
      %3915 = func.call @cc_nil_value() : () -> i64
      %3916 = func.call @cc_cons(%3914, %3915) : (i64, i64) -> i64
      %3917 = func.call @cc_values_pack(%3916) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3918 = func.call @stack_pop_pointer() : () -> i64
      %3919 = func.call @cc_set_symbol_value(%3914, %3918) : (i64, i64) -> i64
      %3920 = func.call @cc_errorp(%3919) : (i64) -> i64
      %3921 = func.call @cc_nil_value() : () -> i64
      %3922 = arith.cmpi ne, %3920, %3921 : i64
      scf.if %3922 {
        func.call @stack_push_pointer(%3919) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3914) : (i64) -> ()
      }
      %3923 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3923 : i64
    }
    %3924 = func.call @cc_nil_value() : () -> i64
    %3925 = func.call @cc_errorp(%3907) : (i64) -> i64
    %3926 = arith.cmpi ne, %3925, %3924 : i64
    %3927 = scf.if %3926 -> (i64) {
      scf.yield %3907 : i64
    } else {
      %3928 = llvm.mlir.addressof @str392 : !llvm.ptr
      %3929 = func.call @cc_make_function_ref_const(%3928) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3929) : (i64) -> ()
      %3930 = func.call @stack_pop_pointer() : () -> i64
      %3931 = llvm.mlir.addressof @str393 : !llvm.ptr
      %3932 = arith.constant 21 : i64
      %3933 = func.call @cc_make_string(%3931, %3932) : (!llvm.ptr, i64) -> i64
      %3934 = llvm.mlir.addressof @str394 : !llvm.ptr
      %3935 = arith.constant 15 : i64
      %3936 = func.call @cc_make_string(%3934, %3935) : (!llvm.ptr, i64) -> i64
      %3937 = func.call @cc_intern(%3933, %3936) : (i64, i64) -> i64
      %3938 = func.call @cc_nil_value() : () -> i64
      %3939 = func.call @cc_cons(%3937, %3938) : (i64, i64) -> i64
      %3940 = func.call @cc_values_pack(%3939) : (i64) -> i64
      %3941 = func.call @cc_set_symbol_value(%3937, %3930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3930) : (i64) -> ()
      %3942 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3942 : i64
    }
    %3943 = func.call @cc_nil_value() : () -> i64
    %3944 = func.call @cc_errorp(%3927) : (i64) -> i64
    %3945 = arith.cmpi ne, %3944, %3943 : i64
    %3946 = scf.if %3945 -> (i64) {
      scf.yield %3927 : i64
    } else {
      %3947 = llvm.mlir.addressof @str395 : !llvm.ptr
      %3948 = func.call @cc_make_function_ref_const(%3947) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3948) : (i64) -> ()
      %3949 = func.call @stack_pop_pointer() : () -> i64
      %3950 = llvm.mlir.addressof @str396 : !llvm.ptr
      %3951 = arith.constant 21 : i64
      %3952 = func.call @cc_make_string(%3950, %3951) : (!llvm.ptr, i64) -> i64
      %3953 = llvm.mlir.addressof @str397 : !llvm.ptr
      %3954 = arith.constant 15 : i64
      %3955 = func.call @cc_make_string(%3953, %3954) : (!llvm.ptr, i64) -> i64
      %3956 = func.call @cc_intern(%3952, %3955) : (i64, i64) -> i64
      %3957 = func.call @cc_nil_value() : () -> i64
      %3958 = func.call @cc_cons(%3956, %3957) : (i64, i64) -> i64
      %3959 = func.call @cc_values_pack(%3958) : (i64) -> i64
      %3960 = func.call @cc_set_symbol_value(%3956, %3949) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3949) : (i64) -> ()
      %3961 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3961 : i64
    }
    %3962 = func.call @cc_nil_value() : () -> i64
    %3963 = func.call @cc_errorp(%3946) : (i64) -> i64
    %3964 = arith.cmpi ne, %3963, %3962 : i64
    %3965 = scf.if %3964 -> (i64) {
      scf.yield %3946 : i64
    } else {
      %3966 = llvm.mlir.addressof @str398 : !llvm.ptr
      %3967 = func.call @cc_make_function_ref_const(%3966) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3967) : (i64) -> ()
      %3968 = func.call @stack_pop_pointer() : () -> i64
      %3969 = llvm.mlir.addressof @str399 : !llvm.ptr
      %3970 = arith.constant 21 : i64
      %3971 = func.call @cc_make_string(%3969, %3970) : (!llvm.ptr, i64) -> i64
      %3972 = llvm.mlir.addressof @str400 : !llvm.ptr
      %3973 = arith.constant 15 : i64
      %3974 = func.call @cc_make_string(%3972, %3973) : (!llvm.ptr, i64) -> i64
      %3975 = func.call @cc_intern(%3971, %3974) : (i64, i64) -> i64
      %3976 = func.call @cc_nil_value() : () -> i64
      %3977 = func.call @cc_cons(%3975, %3976) : (i64, i64) -> i64
      %3978 = func.call @cc_values_pack(%3977) : (i64) -> i64
      %3979 = func.call @cc_set_symbol_value(%3975, %3968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3968) : (i64) -> ()
      %3980 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3980 : i64
    }
    %3981 = func.call @cc_nil_value() : () -> i64
    %3982 = func.call @cc_errorp(%3965) : (i64) -> i64
    %3983 = arith.cmpi ne, %3982, %3981 : i64
    %3984 = scf.if %3983 -> (i64) {
      scf.yield %3965 : i64
    } else {
      %3985 = llvm.mlir.addressof @str401 : !llvm.ptr
      %3986 = func.call @cc_make_function_ref_const(%3985) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%3986) : (i64) -> ()
      %3987 = func.call @stack_pop_pointer() : () -> i64
      %3988 = llvm.mlir.addressof @str402 : !llvm.ptr
      %3989 = arith.constant 21 : i64
      %3990 = func.call @cc_make_string(%3988, %3989) : (!llvm.ptr, i64) -> i64
      %3991 = llvm.mlir.addressof @str403 : !llvm.ptr
      %3992 = arith.constant 15 : i64
      %3993 = func.call @cc_make_string(%3991, %3992) : (!llvm.ptr, i64) -> i64
      %3994 = func.call @cc_intern(%3990, %3993) : (i64, i64) -> i64
      %3995 = func.call @cc_nil_value() : () -> i64
      %3996 = func.call @cc_cons(%3994, %3995) : (i64, i64) -> i64
      %3997 = func.call @cc_values_pack(%3996) : (i64) -> i64
      %3998 = func.call @cc_set_symbol_value(%3994, %3987) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3987) : (i64) -> ()
      %3999 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3999 : i64
    }
    %4000 = func.call @cc_nil_value() : () -> i64
    %4001 = func.call @cc_errorp(%3984) : (i64) -> i64
    %4002 = arith.cmpi ne, %4001, %4000 : i64
    %4003 = scf.if %4002 -> (i64) {
      scf.yield %3984 : i64
    } else {
      %4004 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4005 = func.call @cc_make_function_ref_const(%4004) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4005) : (i64) -> ()
      %4006 = func.call @stack_pop_pointer() : () -> i64
      %4007 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4008 = arith.constant 10 : i64
      %4009 = func.call @cc_make_string(%4007, %4008) : (!llvm.ptr, i64) -> i64
      %4010 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4011 = arith.constant 15 : i64
      %4012 = func.call @cc_make_string(%4010, %4011) : (!llvm.ptr, i64) -> i64
      %4013 = func.call @cc_intern(%4009, %4012) : (i64, i64) -> i64
      %4014 = func.call @cc_nil_value() : () -> i64
      %4015 = func.call @cc_cons(%4013, %4014) : (i64, i64) -> i64
      %4016 = func.call @cc_values_pack(%4015) : (i64) -> i64
      %4017 = func.call @cc_set_symbol_value(%4013, %4006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4006) : (i64) -> ()
      %4018 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4018 : i64
    }
    %4019 = func.call @cc_nil_value() : () -> i64
    %4020 = func.call @cc_errorp(%4003) : (i64) -> i64
    %4021 = arith.cmpi ne, %4020, %4019 : i64
    %4022 = scf.if %4021 -> (i64) {
      scf.yield %4003 : i64
    } else {
      %4023 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4024 = func.call @cc_make_function_ref_const(%4023) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4024) : (i64) -> ()
      %4025 = func.call @stack_pop_pointer() : () -> i64
      %4026 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4027 = arith.constant 10 : i64
      %4028 = func.call @cc_make_string(%4026, %4027) : (!llvm.ptr, i64) -> i64
      %4029 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4030 = arith.constant 15 : i64
      %4031 = func.call @cc_make_string(%4029, %4030) : (!llvm.ptr, i64) -> i64
      %4032 = func.call @cc_intern(%4028, %4031) : (i64, i64) -> i64
      %4033 = func.call @cc_nil_value() : () -> i64
      %4034 = func.call @cc_cons(%4032, %4033) : (i64, i64) -> i64
      %4035 = func.call @cc_values_pack(%4034) : (i64) -> i64
      %4036 = func.call @cc_set_symbol_value(%4032, %4025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4025) : (i64) -> ()
      %4037 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4037 : i64
    }
    %4038 = func.call @cc_nil_value() : () -> i64
    %4039 = func.call @cc_errorp(%4022) : (i64) -> i64
    %4040 = arith.cmpi ne, %4039, %4038 : i64
    %4041 = scf.if %4040 -> (i64) {
      scf.yield %4022 : i64
    } else {
      %4042 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4043 = func.call @cc_make_function_ref_const(%4042) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4043) : (i64) -> ()
      %4044 = func.call @stack_pop_pointer() : () -> i64
      %4045 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4046 = arith.constant 10 : i64
      %4047 = func.call @cc_make_string(%4045, %4046) : (!llvm.ptr, i64) -> i64
      %4048 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4049 = arith.constant 15 : i64
      %4050 = func.call @cc_make_string(%4048, %4049) : (!llvm.ptr, i64) -> i64
      %4051 = func.call @cc_intern(%4047, %4050) : (i64, i64) -> i64
      %4052 = func.call @cc_nil_value() : () -> i64
      %4053 = func.call @cc_cons(%4051, %4052) : (i64, i64) -> i64
      %4054 = func.call @cc_values_pack(%4053) : (i64) -> i64
      %4055 = func.call @cc_set_symbol_value(%4051, %4044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4044) : (i64) -> ()
      %4056 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4056 : i64
    }
    %4057 = func.call @cc_nil_value() : () -> i64
    %4058 = func.call @cc_errorp(%4041) : (i64) -> i64
    %4059 = arith.cmpi ne, %4058, %4057 : i64
    %4060 = scf.if %4059 -> (i64) {
      scf.yield %4041 : i64
    } else {
      %4061 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4062 = func.call @cc_make_function_ref_const(%4061) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4062) : (i64) -> ()
      %4063 = func.call @stack_pop_pointer() : () -> i64
      %4064 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4065 = arith.constant 10 : i64
      %4066 = func.call @cc_make_string(%4064, %4065) : (!llvm.ptr, i64) -> i64
      %4067 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4068 = arith.constant 15 : i64
      %4069 = func.call @cc_make_string(%4067, %4068) : (!llvm.ptr, i64) -> i64
      %4070 = func.call @cc_intern(%4066, %4069) : (i64, i64) -> i64
      %4071 = func.call @cc_nil_value() : () -> i64
      %4072 = func.call @cc_cons(%4070, %4071) : (i64, i64) -> i64
      %4073 = func.call @cc_values_pack(%4072) : (i64) -> i64
      %4074 = func.call @cc_set_symbol_value(%4070, %4063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4063) : (i64) -> ()
      %4075 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4075 : i64
    }
    %4076 = func.call @cc_nil_value() : () -> i64
    %4077 = func.call @cc_errorp(%4060) : (i64) -> i64
    %4078 = arith.cmpi ne, %4077, %4076 : i64
    %4079 = scf.if %4078 -> (i64) {
      scf.yield %4060 : i64
    } else {
      %4080 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4081 = func.call @cc_make_function_ref_const(%4080) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4081) : (i64) -> ()
      %4082 = func.call @stack_pop_pointer() : () -> i64
      %4083 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4084 = arith.constant 13 : i64
      %4085 = func.call @cc_make_string(%4083, %4084) : (!llvm.ptr, i64) -> i64
      %4086 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4087 = arith.constant 15 : i64
      %4088 = func.call @cc_make_string(%4086, %4087) : (!llvm.ptr, i64) -> i64
      %4089 = func.call @cc_intern(%4085, %4088) : (i64, i64) -> i64
      %4090 = func.call @cc_nil_value() : () -> i64
      %4091 = func.call @cc_cons(%4089, %4090) : (i64, i64) -> i64
      %4092 = func.call @cc_values_pack(%4091) : (i64) -> i64
      %4093 = func.call @cc_set_symbol_value(%4089, %4082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4082) : (i64) -> ()
      %4094 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4094 : i64
    }
    %4095 = func.call @cc_nil_value() : () -> i64
    %4096 = func.call @cc_errorp(%4079) : (i64) -> i64
    %4097 = arith.cmpi ne, %4096, %4095 : i64
    %4098 = scf.if %4097 -> (i64) {
      scf.yield %4079 : i64
    } else {
      %4099 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4100 = func.call @cc_make_function_ref_const(%4099) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4100) : (i64) -> ()
      %4101 = func.call @stack_pop_pointer() : () -> i64
      %4102 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4103 = arith.constant 13 : i64
      %4104 = func.call @cc_make_string(%4102, %4103) : (!llvm.ptr, i64) -> i64
      %4105 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4106 = arith.constant 15 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = func.call @cc_intern(%4104, %4107) : (i64, i64) -> i64
      %4109 = func.call @cc_nil_value() : () -> i64
      %4110 = func.call @cc_cons(%4108, %4109) : (i64, i64) -> i64
      %4111 = func.call @cc_values_pack(%4110) : (i64) -> i64
      %4112 = func.call @cc_set_symbol_value(%4108, %4101) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4101) : (i64) -> ()
      %4113 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4113 : i64
    }
    %4114 = func.call @cc_nil_value() : () -> i64
    %4115 = func.call @cc_errorp(%4098) : (i64) -> i64
    %4116 = arith.cmpi ne, %4115, %4114 : i64
    %4117 = scf.if %4116 -> (i64) {
      scf.yield %4098 : i64
    } else {
      %4118 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4119 = func.call @cc_make_function_ref_const(%4118) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4119) : (i64) -> ()
      %4120 = func.call @stack_pop_pointer() : () -> i64
      %4121 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4122 = arith.constant 13 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4125 = arith.constant 15 : i64
      %4126 = func.call @cc_make_string(%4124, %4125) : (!llvm.ptr, i64) -> i64
      %4127 = func.call @cc_intern(%4123, %4126) : (i64, i64) -> i64
      %4128 = func.call @cc_nil_value() : () -> i64
      %4129 = func.call @cc_cons(%4127, %4128) : (i64, i64) -> i64
      %4130 = func.call @cc_values_pack(%4129) : (i64) -> i64
      %4131 = func.call @cc_set_symbol_value(%4127, %4120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4120) : (i64) -> ()
      %4132 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4132 : i64
    }
    %4133 = func.call @cc_nil_value() : () -> i64
    %4134 = func.call @cc_errorp(%4117) : (i64) -> i64
    %4135 = arith.cmpi ne, %4134, %4133 : i64
    %4136 = scf.if %4135 -> (i64) {
      scf.yield %4117 : i64
    } else {
      %4137 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4138 = func.call @cc_make_function_ref_const(%4137) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4138) : (i64) -> ()
      %4139 = func.call @stack_pop_pointer() : () -> i64
      %4140 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4141 = arith.constant 13 : i64
      %4142 = func.call @cc_make_string(%4140, %4141) : (!llvm.ptr, i64) -> i64
      %4143 = llvm.mlir.addressof @str427 : !llvm.ptr
      %4144 = arith.constant 15 : i64
      %4145 = func.call @cc_make_string(%4143, %4144) : (!llvm.ptr, i64) -> i64
      %4146 = func.call @cc_intern(%4142, %4145) : (i64, i64) -> i64
      %4147 = func.call @cc_nil_value() : () -> i64
      %4148 = func.call @cc_cons(%4146, %4147) : (i64, i64) -> i64
      %4149 = func.call @cc_values_pack(%4148) : (i64) -> i64
      %4150 = func.call @cc_set_symbol_value(%4146, %4139) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4139) : (i64) -> ()
      %4151 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4151 : i64
    }
    %4152 = func.call @cc_nil_value() : () -> i64
    %4153 = func.call @cc_errorp(%4136) : (i64) -> i64
    %4154 = arith.cmpi ne, %4153, %4152 : i64
    %4155 = scf.if %4154 -> (i64) {
      scf.yield %4136 : i64
    } else {
      %4156 = llvm.mlir.addressof @str428 : !llvm.ptr
      %4157 = func.call @cc_make_function_ref_const(%4156) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4157) : (i64) -> ()
      %4158 = func.call @stack_pop_pointer() : () -> i64
      %4159 = llvm.mlir.addressof @str429 : !llvm.ptr
      %4160 = arith.constant 5 : i64
      %4161 = func.call @cc_make_string(%4159, %4160) : (!llvm.ptr, i64) -> i64
      %4162 = llvm.mlir.addressof @str430 : !llvm.ptr
      %4163 = arith.constant 15 : i64
      %4164 = func.call @cc_make_string(%4162, %4163) : (!llvm.ptr, i64) -> i64
      %4165 = func.call @cc_intern(%4161, %4164) : (i64, i64) -> i64
      %4166 = func.call @cc_nil_value() : () -> i64
      %4167 = func.call @cc_cons(%4165, %4166) : (i64, i64) -> i64
      %4168 = func.call @cc_values_pack(%4167) : (i64) -> i64
      %4169 = func.call @cc_set_symbol_value(%4165, %4158) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4158) : (i64) -> ()
      %4170 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4170 : i64
    }
    %4171 = func.call @cc_nil_value() : () -> i64
    %4172 = func.call @cc_errorp(%4155) : (i64) -> i64
    %4173 = arith.cmpi ne, %4172, %4171 : i64
    %4174 = scf.if %4173 -> (i64) {
      scf.yield %4155 : i64
    } else {
      %4175 = llvm.mlir.addressof @str431 : !llvm.ptr
      %4176 = func.call @cc_make_function_ref_const(%4175) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4176) : (i64) -> ()
      %4177 = func.call @stack_pop_pointer() : () -> i64
      %4178 = llvm.mlir.addressof @str432 : !llvm.ptr
      %4179 = arith.constant 5 : i64
      %4180 = func.call @cc_make_string(%4178, %4179) : (!llvm.ptr, i64) -> i64
      %4181 = llvm.mlir.addressof @str433 : !llvm.ptr
      %4182 = arith.constant 15 : i64
      %4183 = func.call @cc_make_string(%4181, %4182) : (!llvm.ptr, i64) -> i64
      %4184 = func.call @cc_intern(%4180, %4183) : (i64, i64) -> i64
      %4185 = func.call @cc_nil_value() : () -> i64
      %4186 = func.call @cc_cons(%4184, %4185) : (i64, i64) -> i64
      %4187 = func.call @cc_values_pack(%4186) : (i64) -> i64
      %4188 = func.call @cc_set_symbol_value(%4184, %4177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4177) : (i64) -> ()
      %4189 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4189 : i64
    }
    %4190 = func.call @cc_nil_value() : () -> i64
    %4191 = func.call @cc_errorp(%4174) : (i64) -> i64
    %4192 = arith.cmpi ne, %4191, %4190 : i64
    %4193 = scf.if %4192 -> (i64) {
      scf.yield %4174 : i64
    } else {
      %4194 = llvm.mlir.addressof @str434 : !llvm.ptr
      %4195 = func.call @cc_make_function_ref_const(%4194) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4195) : (i64) -> ()
      %4196 = func.call @stack_pop_pointer() : () -> i64
      %4197 = llvm.mlir.addressof @str435 : !llvm.ptr
      %4198 = arith.constant 5 : i64
      %4199 = func.call @cc_make_string(%4197, %4198) : (!llvm.ptr, i64) -> i64
      %4200 = llvm.mlir.addressof @str436 : !llvm.ptr
      %4201 = arith.constant 15 : i64
      %4202 = func.call @cc_make_string(%4200, %4201) : (!llvm.ptr, i64) -> i64
      %4203 = func.call @cc_intern(%4199, %4202) : (i64, i64) -> i64
      %4204 = func.call @cc_nil_value() : () -> i64
      %4205 = func.call @cc_cons(%4203, %4204) : (i64, i64) -> i64
      %4206 = func.call @cc_values_pack(%4205) : (i64) -> i64
      %4207 = func.call @cc_set_symbol_value(%4203, %4196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4196) : (i64) -> ()
      %4208 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4208 : i64
    }
    %4209 = func.call @cc_nil_value() : () -> i64
    %4210 = func.call @cc_errorp(%4193) : (i64) -> i64
    %4211 = arith.cmpi ne, %4210, %4209 : i64
    %4212 = scf.if %4211 -> (i64) {
      scf.yield %4193 : i64
    } else {
      %4213 = llvm.mlir.addressof @str437 : !llvm.ptr
      %4214 = func.call @cc_make_function_ref_const(%4213) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4214) : (i64) -> ()
      %4215 = func.call @stack_pop_pointer() : () -> i64
      %4216 = llvm.mlir.addressof @str438 : !llvm.ptr
      %4217 = arith.constant 5 : i64
      %4218 = func.call @cc_make_string(%4216, %4217) : (!llvm.ptr, i64) -> i64
      %4219 = llvm.mlir.addressof @str439 : !llvm.ptr
      %4220 = arith.constant 15 : i64
      %4221 = func.call @cc_make_string(%4219, %4220) : (!llvm.ptr, i64) -> i64
      %4222 = func.call @cc_intern(%4218, %4221) : (i64, i64) -> i64
      %4223 = func.call @cc_nil_value() : () -> i64
      %4224 = func.call @cc_cons(%4222, %4223) : (i64, i64) -> i64
      %4225 = func.call @cc_values_pack(%4224) : (i64) -> i64
      %4226 = func.call @cc_set_symbol_value(%4222, %4215) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4215) : (i64) -> ()
      %4227 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4227 : i64
    }
    %4228 = func.call @cc_nil_value() : () -> i64
    %4229 = func.call @cc_errorp(%4212) : (i64) -> i64
    %4230 = arith.cmpi ne, %4229, %4228 : i64
    %4231 = scf.if %4230 -> (i64) {
      scf.yield %4212 : i64
    } else {
      %4232 = llvm.mlir.addressof @str440 : !llvm.ptr
      %4233 = func.call @cc_make_function_ref_const(%4232) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4233) : (i64) -> ()
      %4234 = func.call @stack_pop_pointer() : () -> i64
      %4235 = llvm.mlir.addressof @str441 : !llvm.ptr
      %4236 = arith.constant 8 : i64
      %4237 = func.call @cc_make_string(%4235, %4236) : (!llvm.ptr, i64) -> i64
      %4238 = func.call @cc_nil_value() : () -> i64
      %4239 = func.call @cc_intern(%4237, %4238) : (i64, i64) -> i64
      %4240 = func.call @cc_nil_value() : () -> i64
      %4241 = func.call @cc_cons(%4239, %4240) : (i64, i64) -> i64
      %4242 = func.call @cc_values_pack(%4241) : (i64) -> i64
      %4243 = func.call @cc_set_symbol_value(%4239, %4234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4234) : (i64) -> ()
      %4244 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4244 : i64
    }
    %4245 = func.call @cc_nil_value() : () -> i64
    %4246 = func.call @cc_errorp(%4231) : (i64) -> i64
    %4247 = arith.cmpi ne, %4246, %4245 : i64
    %4248 = scf.if %4247 -> (i64) {
      scf.yield %4231 : i64
    } else {
      %4249 = llvm.mlir.addressof @str442 : !llvm.ptr
      %4250 = func.call @cc_make_function_ref_const(%4249) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4250) : (i64) -> ()
      %4251 = func.call @stack_pop_pointer() : () -> i64
      %4252 = llvm.mlir.addressof @str443 : !llvm.ptr
      %4253 = arith.constant 21 : i64
      %4254 = func.call @cc_make_string(%4252, %4253) : (!llvm.ptr, i64) -> i64
      %4255 = func.call @cc_nil_value() : () -> i64
      %4256 = func.call @cc_intern(%4254, %4255) : (i64, i64) -> i64
      %4257 = func.call @cc_nil_value() : () -> i64
      %4258 = func.call @cc_cons(%4256, %4257) : (i64, i64) -> i64
      %4259 = func.call @cc_values_pack(%4258) : (i64) -> i64
      %4260 = func.call @cc_set_symbol_value(%4256, %4251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4251) : (i64) -> ()
      %4261 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4261 : i64
    }
    %4262 = func.call @cc_nil_value() : () -> i64
    %4263 = func.call @cc_errorp(%4248) : (i64) -> i64
    %4264 = arith.cmpi ne, %4263, %4262 : i64
    %4265 = scf.if %4264 -> (i64) {
      scf.yield %4248 : i64
    } else {
      %4266 = llvm.mlir.addressof @str444 : !llvm.ptr
      %4267 = func.call @cc_make_function_ref_const(%4266) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4267) : (i64) -> ()
      %4268 = func.call @stack_pop_pointer() : () -> i64
      %4269 = llvm.mlir.addressof @str445 : !llvm.ptr
      %4270 = arith.constant 13 : i64
      %4271 = func.call @cc_make_string(%4269, %4270) : (!llvm.ptr, i64) -> i64
      %4272 = func.call @cc_nil_value() : () -> i64
      %4273 = func.call @cc_intern(%4271, %4272) : (i64, i64) -> i64
      %4274 = func.call @cc_nil_value() : () -> i64
      %4275 = func.call @cc_cons(%4273, %4274) : (i64, i64) -> i64
      %4276 = func.call @cc_values_pack(%4275) : (i64) -> i64
      %4277 = func.call @cc_set_symbol_value(%4273, %4268) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4268) : (i64) -> ()
      %4278 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4278 : i64
    }
    %4279 = func.call @cc_nil_value() : () -> i64
    %4280 = func.call @cc_errorp(%4265) : (i64) -> i64
    %4281 = arith.cmpi ne, %4280, %4279 : i64
    %4282 = scf.if %4281 -> (i64) {
      scf.yield %4265 : i64
    } else {
      %4283 = llvm.mlir.addressof @str446 : !llvm.ptr
      %4284 = func.call @cc_make_function_ref_const(%4283) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4284) : (i64) -> ()
      %4285 = func.call @stack_pop_pointer() : () -> i64
      %4286 = llvm.mlir.addressof @str447 : !llvm.ptr
      %4287 = arith.constant 12 : i64
      %4288 = func.call @cc_make_string(%4286, %4287) : (!llvm.ptr, i64) -> i64
      %4289 = func.call @cc_nil_value() : () -> i64
      %4290 = func.call @cc_intern(%4288, %4289) : (i64, i64) -> i64
      %4291 = func.call @cc_nil_value() : () -> i64
      %4292 = func.call @cc_cons(%4290, %4291) : (i64, i64) -> i64
      %4293 = func.call @cc_values_pack(%4292) : (i64) -> i64
      %4294 = func.call @cc_set_symbol_value(%4290, %4285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4285) : (i64) -> ()
      %4295 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4295 : i64
    }
    %4296 = func.call @cc_nil_value() : () -> i64
    %4297 = func.call @cc_errorp(%4282) : (i64) -> i64
    %4298 = arith.cmpi ne, %4297, %4296 : i64
    %4299 = scf.if %4298 -> (i64) {
      scf.yield %4282 : i64
    } else {
      %4300 = llvm.mlir.addressof @str448 : !llvm.ptr
      %4301 = func.call @cc_make_function_ref_const(%4300) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4301) : (i64) -> ()
      %4302 = func.call @stack_pop_pointer() : () -> i64
      %4303 = llvm.mlir.addressof @str449 : !llvm.ptr
      %4304 = arith.constant 13 : i64
      %4305 = func.call @cc_make_string(%4303, %4304) : (!llvm.ptr, i64) -> i64
      %4306 = func.call @cc_nil_value() : () -> i64
      %4307 = func.call @cc_intern(%4305, %4306) : (i64, i64) -> i64
      %4308 = func.call @cc_nil_value() : () -> i64
      %4309 = func.call @cc_cons(%4307, %4308) : (i64, i64) -> i64
      %4310 = func.call @cc_values_pack(%4309) : (i64) -> i64
      %4311 = func.call @cc_set_symbol_value(%4307, %4302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4302) : (i64) -> ()
      %4312 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4312 : i64
    }
    %4313 = func.call @cc_nil_value() : () -> i64
    %4314 = func.call @cc_errorp(%4299) : (i64) -> i64
    %4315 = arith.cmpi ne, %4314, %4313 : i64
    %4316 = scf.if %4315 -> (i64) {
      scf.yield %4299 : i64
    } else {
      %4317 = llvm.mlir.addressof @str450 : !llvm.ptr
      %4318 = func.call @cc_make_function_ref_const(%4317) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4318) : (i64) -> ()
      %4319 = func.call @stack_pop_pointer() : () -> i64
      %4320 = llvm.mlir.addressof @str451 : !llvm.ptr
      %4321 = arith.constant 17 : i64
      %4322 = func.call @cc_make_string(%4320, %4321) : (!llvm.ptr, i64) -> i64
      %4323 = func.call @cc_nil_value() : () -> i64
      %4324 = func.call @cc_intern(%4322, %4323) : (i64, i64) -> i64
      %4325 = func.call @cc_nil_value() : () -> i64
      %4326 = func.call @cc_cons(%4324, %4325) : (i64, i64) -> i64
      %4327 = func.call @cc_values_pack(%4326) : (i64) -> i64
      %4328 = func.call @cc_set_symbol_value(%4324, %4319) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4319) : (i64) -> ()
      %4329 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4329 : i64
    }
    %4330 = func.call @cc_nil_value() : () -> i64
    %4331 = func.call @cc_errorp(%4316) : (i64) -> i64
    %4332 = arith.cmpi ne, %4331, %4330 : i64
    %4333 = scf.if %4332 -> (i64) {
      scf.yield %4316 : i64
    } else {
      %4334 = llvm.mlir.addressof @str452 : !llvm.ptr
      %4335 = func.call @cc_make_function_ref_const(%4334) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4335) : (i64) -> ()
      %4336 = func.call @stack_pop_pointer() : () -> i64
      %4337 = llvm.mlir.addressof @str453 : !llvm.ptr
      %4338 = arith.constant 30 : i64
      %4339 = func.call @cc_make_string(%4337, %4338) : (!llvm.ptr, i64) -> i64
      %4340 = func.call @cc_nil_value() : () -> i64
      %4341 = func.call @cc_intern(%4339, %4340) : (i64, i64) -> i64
      %4342 = func.call @cc_nil_value() : () -> i64
      %4343 = func.call @cc_cons(%4341, %4342) : (i64, i64) -> i64
      %4344 = func.call @cc_values_pack(%4343) : (i64) -> i64
      %4345 = func.call @cc_set_symbol_value(%4341, %4336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4336) : (i64) -> ()
      %4346 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4346 : i64
    }
    %4347 = func.call @cc_nil_value() : () -> i64
    %4348 = func.call @cc_errorp(%4333) : (i64) -> i64
    %4349 = arith.cmpi ne, %4348, %4347 : i64
    %4350 = scf.if %4349 -> (i64) {
      scf.yield %4333 : i64
    } else {
      %4351 = llvm.mlir.addressof @str454 : !llvm.ptr
      %4352 = func.call @cc_make_function_ref_const(%4351) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%4352) : (i64) -> ()
      %4353 = func.call @stack_pop_pointer() : () -> i64
      %4354 = llvm.mlir.addressof @str455 : !llvm.ptr
      %4355 = arith.constant 46 : i64
      %4356 = func.call @cc_make_string(%4354, %4355) : (!llvm.ptr, i64) -> i64
      %4357 = func.call @cc_nil_value() : () -> i64
      %4358 = func.call @cc_intern(%4356, %4357) : (i64, i64) -> i64
      %4359 = func.call @cc_nil_value() : () -> i64
      %4360 = func.call @cc_cons(%4358, %4359) : (i64, i64) -> i64
      %4361 = func.call @cc_values_pack(%4360) : (i64) -> i64
      %4362 = func.call @cc_set_symbol_value(%4358, %4353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4353) : (i64) -> ()
      %4363 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4363 : i64
    }
    func.call @stack_push_pointer(%4350) : (i64) -> ()
    %4364 = func.call @stack_pop_pointer() : () -> i64
    %4365 = func.call @cc_multiple_value_list(%4364) : (i64) -> i64
    %4366 = llvm.mlir.addressof @str456 : !llvm.ptr
    %4367 = arith.constant 37 : i64
    %4368 = func.call @cc_make_string(%4366, %4367) : (!llvm.ptr, i64) -> i64
    %4369 = func.call @cc_nil_value() : () -> i64
    %4370 = func.call @cc_intern(%4368, %4369) : (i64, i64) -> i64
    %4371 = func.call @cc_nil_value() : () -> i64
    %4372 = func.call @cc_cons(%4370, %4371) : (i64, i64) -> i64
    %4373 = func.call @cc_values_pack(%4372) : (i64) -> i64
    %4374 = func.call @cc_symbol_value(%4370) : (i64) -> i64
    %4375 = llvm.mlir.addressof @str457 : !llvm.ptr
    %4376 = arith.constant 39 : i64
    %4377 = func.call @cc_make_string(%4375, %4376) : (!llvm.ptr, i64) -> i64
    %4378 = func.call @cc_nil_value() : () -> i64
    %4379 = func.call @cc_intern(%4377, %4378) : (i64, i64) -> i64
    %4380 = func.call @cc_nil_value() : () -> i64
    %4381 = func.call @cc_cons(%4379, %4380) : (i64, i64) -> i64
    %4382 = func.call @cc_values_pack(%4381) : (i64) -> i64
    %4383 = func.call @cc_symbol_value(%4379) : (i64) -> i64
    %4384 = func.call @cc_nil_value() : () -> i64
    %4385 = arith.cmpi ne, %4374, %4384 : i64
    %4386 = scf.if %4385 -> (i64) {
      scf.yield %4383 : i64
    } else {
      scf.yield %4365 : i64
    }
    %4387 = func.call @cc_values_pack(%4386) : (i64) -> i64
    func.call @stack_push_pointer(%4387) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%CLASP-TESTS::NOTE-TEST"() {
    %3669 = llvm.mlir.addressof @str359 : !llvm.ptr
    %3670 = arith.constant 9 : i64
    %3671 = func.call @cc_make_string(%3669, %3670) : (!llvm.ptr, i64) -> i64
    %3672 = llvm.mlir.addressof @str360 : !llvm.ptr
    %3673 = arith.constant 11 : i64
    %3674 = func.call @cc_make_string(%3672, %3673) : (!llvm.ptr, i64) -> i64
    %3675 = func.call @cc_intern(%3671, %3674) : (i64, i64) -> i64
    %3676 = func.call @cc_nil_value() : () -> i64
    %3677 = func.call @cc_cons(%3675, %3676) : (i64, i64) -> i64
    %3678 = func.call @cc_values_pack(%3677) : (i64) -> i64
    %3679 = llvm.mlir.addressof @str361 : !llvm.ptr
    %3680 = arith.constant 4 : i64
    %3681 = func.call @cc_make_string(%3679, %3680) : (!llvm.ptr, i64) -> i64
    %3682 = func.call @cc_register_function_lambda_list_metadata_raw(%3675, %3681) : (i64, i64) -> i64
    %3683 = arith.constant 1 : i64
    func.call @cc_runtime_debug_stack_push_call(%3675, %3683) : (i64, i64) -> ()
    %3684 = func.call @stack_pop_pointer() : () -> i64
    %3685 = func.call @cc_nil_value() : () -> i64
    %3686 = llvm.mlir.addressof @str362 : !llvm.ptr
    %3687 = arith.constant 37 : i64
    %3688 = func.call @cc_make_string(%3686, %3687) : (!llvm.ptr, i64) -> i64
    %3689 = func.call @cc_nil_value() : () -> i64
    %3690 = func.call @cc_intern(%3688, %3689) : (i64, i64) -> i64
    %3691 = func.call @cc_nil_value() : () -> i64
    %3692 = func.call @cc_cons(%3690, %3691) : (i64, i64) -> i64
    %3693 = func.call @cc_values_pack(%3692) : (i64) -> i64
    %3694 = func.call @cc_set_symbol_value(%3690, %3685) : (i64, i64) -> i64
    %3695 = llvm.mlir.addressof @str363 : !llvm.ptr
    %3696 = arith.constant 38 : i64
    %3697 = func.call @cc_make_string(%3695, %3696) : (!llvm.ptr, i64) -> i64
    %3698 = func.call @cc_nil_value() : () -> i64
    %3699 = func.call @cc_intern(%3697, %3698) : (i64, i64) -> i64
    %3700 = func.call @cc_nil_value() : () -> i64
    %3701 = func.call @cc_cons(%3699, %3700) : (i64, i64) -> i64
    %3702 = func.call @cc_values_pack(%3701) : (i64) -> i64
    %3703 = func.call @cc_set_symbol_value(%3699, %3685) : (i64, i64) -> i64
    %3704 = llvm.mlir.addressof @str364 : !llvm.ptr
    %3705 = arith.constant 39 : i64
    %3706 = func.call @cc_make_string(%3704, %3705) : (!llvm.ptr, i64) -> i64
    %3707 = func.call @cc_nil_value() : () -> i64
    %3708 = func.call @cc_intern(%3706, %3707) : (i64, i64) -> i64
    %3709 = func.call @cc_nil_value() : () -> i64
    %3710 = func.call @cc_cons(%3708, %3709) : (i64, i64) -> i64
    %3711 = func.call @cc_values_pack(%3710) : (i64) -> i64
    %3712 = func.call @cc_set_symbol_value(%3708, %3685) : (i64, i64) -> i64
    func.call @stack_push_pointer(%3684) : (i64) -> ()
    %3713 = llvm.mlir.addressof @str365 : !llvm.ptr
    %3714 = arith.constant 19 : i64
    %3715 = func.call @cc_make_string(%3713, %3714) : (!llvm.ptr, i64) -> i64
    %3716 = llvm.mlir.addressof @str366 : !llvm.ptr
    %3717 = arith.constant 11 : i64
    %3718 = func.call @cc_make_string(%3716, %3717) : (!llvm.ptr, i64) -> i64
    %3719 = func.call @cc_intern(%3715, %3718) : (i64, i64) -> i64
    %3720 = func.call @cc_nil_value() : () -> i64
    %3721 = func.call @cc_cons(%3719, %3720) : (i64, i64) -> i64
    %3722 = func.call @cc_values_pack(%3721) : (i64) -> i64
    %3723 = func.call @cc_symbol_value(%3719) : (i64) -> i64
    func.call @stack_push_pointer(%3723) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %3724 = func.call @stack_pop_pointer() : () -> i64
    %3725 = func.call @stack_pop_pointer() : () -> i64
    %3726 = func.call @stack_pop_pointer() : () -> i64
    %3727 = func.call @cc_gethash(%3726, %3725, %3724) : (i64, i64, i64) -> i64
    func.call @stack_push_pointer(%3727) : (i64) -> ()
    %3728 = func.call @stack_pop_pointer() : () -> i64
    %3729 = func.call @cc_nil_value() : () -> i64
    %3730 = arith.cmpi ne, %3728, %3729 : i64
    scf.if %3730 {
      %3731 = func.call @cc_nil_value() : () -> i64
      %3732 = func.call @cc_nil_value() : () -> i64
      %3733 = func.call @cc_errorp(%3731) : (i64) -> i64
      %3734 = arith.cmpi ne, %3733, %3732 : i64
      %3735 = scf.if %3734 -> (i64) {
        scf.yield %3731 : i64
      } else {
        func.call @stack_push_pointer(%3684) : (i64) -> ()
        %3736 = func.call @stack_pop_pointer() : () -> i64
        %3737 = llvm.mlir.addressof @str367 : !llvm.ptr
        %3738 = arith.constant 17 : i64
        %3739 = func.call @cc_make_string(%3737, %3738) : (!llvm.ptr, i64) -> i64
        %3740 = llvm.mlir.addressof @str368 : !llvm.ptr
        %3741 = arith.constant 11 : i64
        %3742 = func.call @cc_make_string(%3740, %3741) : (!llvm.ptr, i64) -> i64
        %3743 = func.call @cc_intern(%3739, %3742) : (i64, i64) -> i64
        %3744 = func.call @cc_nil_value() : () -> i64
        %3745 = func.call @cc_cons(%3743, %3744) : (i64, i64) -> i64
        %3746 = func.call @cc_values_pack(%3745) : (i64) -> i64
        %3747 = func.call @cc_symbol_value(%3743) : (i64) -> i64
        %3748 = func.call @cc_cons(%3736, %3747) : (i64, i64) -> i64
        %3749 = llvm.mlir.addressof @str369 : !llvm.ptr
        %3750 = arith.constant 17 : i64
        %3751 = func.call @cc_make_string(%3749, %3750) : (!llvm.ptr, i64) -> i64
        %3752 = llvm.mlir.addressof @str370 : !llvm.ptr
        %3753 = arith.constant 11 : i64
        %3754 = func.call @cc_make_string(%3752, %3753) : (!llvm.ptr, i64) -> i64
        %3755 = func.call @cc_intern(%3751, %3754) : (i64, i64) -> i64
        %3756 = func.call @cc_nil_value() : () -> i64
        %3757 = func.call @cc_cons(%3755, %3756) : (i64, i64) -> i64
        %3758 = func.call @cc_values_pack(%3757) : (i64) -> i64
        %3759 = func.call @cc_set_symbol_value(%3755, %3748) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3748) : (i64) -> ()
        %3760 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3760 : i64
      }
      %3761 = func.call @cc_nil_value() : () -> i64
      %3762 = func.call @cc_errorp(%3735) : (i64) -> i64
      %3763 = arith.cmpi ne, %3762, %3761 : i64
      %3764 = scf.if %3763 -> (i64) {
        scf.yield %3735 : i64
      } else {
        %3765 = llvm.mlir.addressof @str371 : !llvm.ptr
        %3766 = arith.constant 21 : i64
        %3767 = func.call @cc_make_string(%3765, %3766) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%3767) : (i64) -> ()
        %3768 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3684) : (i64) -> ()
        %3769 = func.call @stack_pop_pointer() : () -> i64
        %3770 = func.call @cc_nil_value() : () -> i64
        %3771 = func.call @cc_errorp(%3768) : (i64) -> i64
        %3772 = arith.cmpi ne, %3771, %3770 : i64
        %3773 = arith.cmpi eq, %3770, %3770 : i64
        %3774 = arith.andi %3772, %3773 : i1
        %3775 = scf.if %3774 -> (i64) {
          scf.yield %3768 : i64
        } else {
          scf.yield %3770 : i64
        }
        %3776 = func.call @cc_errorp(%3769) : (i64) -> i64
        %3777 = arith.cmpi ne, %3776, %3770 : i64
        %3778 = arith.cmpi eq, %3775, %3770 : i64
        %3779 = arith.andi %3777, %3778 : i1
        %3780 = scf.if %3779 -> (i64) {
          scf.yield %3769 : i64
        } else {
          scf.yield %3775 : i64
        }
        %3781 = arith.cmpi ne, %3780, %3770 : i64
        scf.if %3781 {
          func.call @stack_push_pointer(%3780) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3768) : (i64) -> ()
          func.call @stack_push_pointer(%3769) : (i64) -> ()
          %3782 = llvm.mlir.addressof @str372 : !llvm.ptr
          %3783 = func.call @cc_make_function_ref_const(%3782) : (!llvm.ptr) -> i64
          %3784 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%3783, %3784) : (i64, i64) -> ()
        }
        %3785 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3785 : i64
      }
      func.call @stack_push_pointer(%3764) : (i64) -> ()
    } else {
      %3786 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3786) : (i64) -> ()
      %3787 = func.call @stack_pop_pointer() : () -> i64
      %3788 = func.call @cc_nil_value() : () -> i64
      %3789 = arith.cmpi ne, %3787, %3788 : i64
      scf.if %3789 {
        func.call @stack_push_pointer(%3684) : (i64) -> ()
        %3790 = llvm.mlir.addressof @str373 : !llvm.ptr
        %3791 = arith.constant 19 : i64
        %3792 = func.call @cc_make_string(%3790, %3791) : (!llvm.ptr, i64) -> i64
        %3793 = llvm.mlir.addressof @str374 : !llvm.ptr
        %3794 = arith.constant 11 : i64
        %3795 = func.call @cc_make_string(%3793, %3794) : (!llvm.ptr, i64) -> i64
        %3796 = func.call @cc_intern(%3792, %3795) : (i64, i64) -> i64
        %3797 = func.call @cc_nil_value() : () -> i64
        %3798 = func.call @cc_cons(%3796, %3797) : (i64, i64) -> i64
        %3799 = func.call @cc_values_pack(%3798) : (i64) -> i64
        %3800 = func.call @cc_symbol_value(%3796) : (i64) -> i64
        func.call @stack_push_pointer(%3800) : (i64) -> ()
        %3801 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%3801) : (i64) -> ()
        %3802 = func.call @stack_pop_pointer() : () -> i64
        %3803 = func.call @stack_pop_pointer() : () -> i64
        %3804 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3802) : (i64) -> ()
        func.call @stack_push_pointer(%3804) : (i64) -> ()
        func.call @stack_push_pointer(%3803) : (i64) -> ()
        %3805 = llvm.mlir.addressof @str375 : !llvm.ptr
        %3806 = func.call @cc_make_function_ref_const(%3805) : (!llvm.ptr) -> i64
        %3807 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%3806, %3807) : (i64, i64) -> ()
      } else {
        func.call @stack_push_nil() : () -> ()
      }
    }
    %3808 = func.call @stack_pop_pointer() : () -> i64
    %3809 = func.call @cc_multiple_value_list(%3808) : (i64) -> i64
    %3810 = llvm.mlir.addressof @str376 : !llvm.ptr
    %3811 = arith.constant 37 : i64
    %3812 = func.call @cc_make_string(%3810, %3811) : (!llvm.ptr, i64) -> i64
    %3813 = func.call @cc_nil_value() : () -> i64
    %3814 = func.call @cc_intern(%3812, %3813) : (i64, i64) -> i64
    %3815 = func.call @cc_nil_value() : () -> i64
    %3816 = func.call @cc_cons(%3814, %3815) : (i64, i64) -> i64
    %3817 = func.call @cc_values_pack(%3816) : (i64) -> i64
    %3818 = func.call @cc_symbol_value(%3814) : (i64) -> i64
    %3819 = llvm.mlir.addressof @str377 : !llvm.ptr
    %3820 = arith.constant 39 : i64
    %3821 = func.call @cc_make_string(%3819, %3820) : (!llvm.ptr, i64) -> i64
    %3822 = func.call @cc_nil_value() : () -> i64
    %3823 = func.call @cc_intern(%3821, %3822) : (i64, i64) -> i64
    %3824 = func.call @cc_nil_value() : () -> i64
    %3825 = func.call @cc_cons(%3823, %3824) : (i64, i64) -> i64
    %3826 = func.call @cc_values_pack(%3825) : (i64) -> i64
    %3827 = func.call @cc_symbol_value(%3823) : (i64) -> i64
    %3828 = func.call @cc_nil_value() : () -> i64
    %3829 = arith.cmpi ne, %3818, %3828 : i64
    %3830 = scf.if %3829 -> (i64) {
      scf.yield %3827 : i64
    } else {
      scf.yield %3809 : i64
    }
    %3831 = func.call @cc_values_pack(%3830) : (i64) -> i64
    func.call @stack_push_pointer(%3831) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("MESSAGE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str1("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str2("level\0Acontrol-string\0Aargs\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETVALUE_96868088414208*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETVALUE_96868088414209*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str9("Display a message using ANSI highlighting if possible. LEVEL should be NIL, :ERR,\0A:WARN or :EMPH.\00") : !llvm.array<98 x i8>
  llvm.mlir.global private constant @str10("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("FRESH-LINE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str13("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str14("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str16("~c[~dm\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str17("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str22("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str23("OTHERWISE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP:FORMAT\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str27("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("INTERACTIVE-STREAM-P\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str30("~c[0m\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str31("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str32("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("TERPRI\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str35("*__MLIR_BLOCK_RETFLAG_96868088414209*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETVALUE_96868088414209*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETMVLIST_96868088414209*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETFLAG_96868088414208*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str39("*__MLIR_BLOCK_RETMVLIST_96868088414208*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str40("RESET-CLASP-TESTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str41("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str43("*__MLIR_BLOCK_RETVALUE_96868088414210*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str44("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str45("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str46("*__MLIR_BLOCK_RETVALUE_96868088414211*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str47("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str48("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str49("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str51("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str53("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str54("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str55("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str57("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str59("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str61("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("*__MLIR_BLOCK_RETFLAG_96868088414211*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str63("*__MLIR_BLOCK_RETVALUE_96868088414211*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str64("*__MLIR_BLOCK_RETMVLIST_96868088414211*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str65("*__MLIR_BLOCK_RETFLAG_96868088414210*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str66("*__MLIR_BLOCK_RETMVLIST_96868088414210*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str67("NOTE-COMPILE-ERROR\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str68("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("file&error\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETVALUE_96868088414212*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str72("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str73("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str74("*__MLIR_BLOCK_RETVALUE_96868088414213*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str75("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str76("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str77("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str79("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETFLAG_96868088414213*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str81("*__MLIR_BLOCK_RETVALUE_96868088414213*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str82("*__MLIR_BLOCK_RETMVLIST_96868088414213*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str83("*__MLIR_BLOCK_RETFLAG_96868088414212*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str84("*__MLIR_BLOCK_RETMVLIST_96868088414212*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str85("SHOW-TEST-SUMMARY\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str86("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str87("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str88("*__MLIR_BLOCK_RETVALUE_96868088414214*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str89("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str90("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str91("*__MLIR_BLOCK_RETVALUE_96868088414215*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str92("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str93("EMPH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str94("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("~@[~%Failures:~%  ~/pprint-fill/~%~]~\0A~@[~%Unexpected Successes:~%  ~/pprint-fill/~%~]~\0A~@[~%Expected Failures:~%  ~/pprint-fill/~%~]\0ASuccesses: ~d\00") : !llvm.array<148 x i8>
  llvm.mlir.global private constant @str96("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str97("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str99("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str101("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str103("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str105("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str106("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str108("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str110("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str111("Compilation error for file ~a with error  ~a\00") : !llvm.array<45 x i8>
  llvm.mlir.global private constant @str112("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str113("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str114("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str116("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str117("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str118("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str119("Duplicate test ~a\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str120("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str121("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str122("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("*__MLIR_BLOCK_RETFLAG_96868088414215*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str124("*__MLIR_BLOCK_RETVALUE_96868088414215*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str125("*__MLIR_BLOCK_RETMVLIST_96868088414215*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str126("*__MLIR_BLOCK_RETFLAG_96868088414214*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str127("*__MLIR_BLOCK_RETMVLIST_96868088414214*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str128("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str129("name\0Aform\0Aexpected\0ACOMMON-LISP:ERROR\0Adescription\00") : !llvm.array<49 x i8>
  llvm.mlir.global private constant @str130("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str131("*__MLIR_BLOCK_RETVALUE_96868088414216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str132("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str133("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str134("*__MLIR_BLOCK_RETVALUE_96868088414217*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str135("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str136("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str137("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str139("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str141("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str143("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str145("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str147("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str149("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str151("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str153("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str154("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str155("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str156("Unexpected error~%~t~a~%while evaluating~%~t~a\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str157("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str158("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str159("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str160("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str161("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str162("*__MLIR_BLOCK_RETFLAG_96868088414217*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str163("*__MLIR_BLOCK_RETVALUE_96868088414217*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str164("*__MLIR_BLOCK_RETMVLIST_96868088414217*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str165("*__MLIR_BLOCK_RETFLAG_96868088414216*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str166("*__MLIR_BLOCK_RETMVLIST_96868088414216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str167("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str168("name\0Aform\0Aexpected\0Aactual\0Adescription\0ACLASP-TESTS:TEST\00") : !llvm.array<55 x i8>
  llvm.mlir.global private constant @str169("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str170("*__MLIR_BLOCK_RETVALUE_96868088414218*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str171("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str172("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str173("*__MLIR_BLOCK_RETVALUE_96868088414219*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str174("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str175("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str176("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str178("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str180("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str181("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str182("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str183("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str184("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str185("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str186("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str187("Failed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str188("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str189("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str190("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("Wanted values ~s to~%~{~t~a~%~}but got~%~{~t~a~%~}\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str192("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str193("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str194("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str195("while evaluating~%~t~a~%\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str196("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str197("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str198("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str199("~s\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str200("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str201("*__MLIR_BLOCK_RETFLAG_96868088414219*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str202("*__MLIR_BLOCK_RETVALUE_96868088414219*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str203("*__MLIR_BLOCK_RETMVLIST_96868088414219*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str204("*__MLIR_BLOCK_RETFLAG_96868088414218*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str205("*__MLIR_BLOCK_RETMVLIST_96868088414218*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str206("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str207("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str208("*__MLIR_BLOCK_RETFLAG_96868088414220*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str209("*__MLIR_BLOCK_RETVALUE_96868088414220*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str210("*__MLIR_BLOCK_RETMVLIST_96868088414220*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str211("*__MLIR_BLOCK_RETFLAG_96868088414221*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str212("*__MLIR_BLOCK_RETVALUE_96868088414221*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str213("*__MLIR_BLOCK_RETMVLIST_96868088414221*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str214("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str215("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str217("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str218("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str219("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str221("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str223("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("INFO\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str225("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str226("Passed ~s\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str227("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str228("*__MLIR_BLOCK_RETFLAG_96868088414221*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str229("*__MLIR_BLOCK_RETVALUE_96868088414221*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str230("*__MLIR_BLOCK_RETMVLIST_96868088414221*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str231("*__MLIR_BLOCK_RETFLAG_96868088414220*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str232("*__MLIR_BLOCK_RETMVLIST_96868088414220*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str233("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str234("name\0Aform\0Athunk\0Aexpected\0Adescription\0ATEST\00") : !llvm.array<42 x i8>
  llvm.mlir.global private constant @str235("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str236("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str237("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str238("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str239("*__MLIR_BLOCK_RETFLAG_96868088414222*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str240("*__MLIR_BLOCK_RETVALUE_96868088414222*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str241("*__MLIR_BLOCK_RETMVLIST_96868088414222*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str242("*__MLIR_BLOCK_RETFLAG_96868088414223*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str243("*__MLIR_BLOCK_RETVALUE_96868088414223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str244("*__MLIR_BLOCK_RETMVLIST_96868088414223*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str245("*TRACE-TEST-PROGRESS*\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str246("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("*ERROR-OUTPUT*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str248("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str249("TRACE-TEST-BEGIN ~s~%\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str250("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str251("*SEED-NO-RUN*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str252("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str253("*__MLIR_BLOCK_RETFLAG_96868088414223*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str254("*__MLIR_BLOCK_RETVALUE_96868088414223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str255("*__MLIR_BLOCK_RETMVLIST_96868088414223*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str256("CLASP-TESTS::NOTE-TEST\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str257("CLASP-TESTS::%fail-test-with-error\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str258("CLASP-TESTS::%succeed-test\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str259("CLASP-TESTS::%fail-test\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str260("*__MLIR_BLOCK_RETFLAG_96868088414223*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str261("*__MLIR_BLOCK_RETVALUE_96868088414223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str262("*__MLIR_BLOCK_RETMVLIST_96868088414223*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str263("*__MLIR_BLOCK_RETFLAG_96868088414222*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str264("*__MLIR_BLOCK_RETMVLIST_96868088414222*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str265("LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str266("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str267("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str268("*__MLIR_BLOCK_RETFLAG_96868088414224*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str269("*__MLIR_BLOCK_RETVALUE_96868088414224*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str270("*__MLIR_BLOCK_RETMVLIST_96868088414224*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str271("*__MLIR_BLOCK_RETFLAG_96868088414225*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str272("*__MLIR_BLOCK_RETVALUE_96868088414225*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str273("*__MLIR_BLOCK_RETMVLIST_96868088414225*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str274("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str275("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str276("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str277("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str278("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("%FN%CLASP-TESTS::NOTE-COMPILE-ERROR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str280("ERR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str281("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str282("Regression: compile-file of ~a failed with ~a\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str283("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str284("*__MLIR_BLOCK_RETFLAG_96868088414225*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str285("*__MLIR_BLOCK_RETVALUE_96868088414225*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str286("*__MLIR_BLOCK_RETMVLIST_96868088414225*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str287("*__MLIR_BLOCK_RETFLAG_96868088414224*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str288("*__MLIR_BLOCK_RETMVLIST_96868088414224*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str289("NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str290("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("file\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str292("*__MLIR_BLOCK_RETFLAG_96868088414226*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str293("*__MLIR_BLOCK_RETVALUE_96868088414226*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str294("*__MLIR_BLOCK_RETMVLIST_96868088414226*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str295("*__MLIR_BLOCK_RETFLAG_96868088414227*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str296("*__MLIR_BLOCK_RETVALUE_96868088414227*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str297("*__MLIR_BLOCK_RETMVLIST_96868088414227*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str298("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str299("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str300("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str301("*__MLIR_BLOCK_RETFLAG_96868088414227*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str302("*__MLIR_BLOCK_RETVALUE_96868088414227*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str303("*__MLIR_BLOCK_RETMVLIST_96868088414227*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str304("*__MLIR_BLOCK_RETFLAG_96868088414226*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str305("*__MLIR_BLOCK_RETMVLIST_96868088414226*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str306("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str307("*__MLIR_BLOCK_RETFLAG_96868088414228*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str308("*__MLIR_BLOCK_RETVALUE_96868088414228*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str309("*__MLIR_BLOCK_RETMVLIST_96868088414228*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str310("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str311("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str312("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str313("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str314("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str315("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str316("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str317("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str318("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str319("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str321("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str323("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str324("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str326("TEST-EXPECT-ERROR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str327("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str329("intern\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str330("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str331("export\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str332("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str333("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str334("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str335("*EXPECTED-FAILED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str336("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("*UNEXPECTED-FAILED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str338("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str339("*EXPECTED-PASSED-TESTS*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str340("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str341("*UNEXPECTED-PASSED-TESTS*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str342("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str343("*EXPECTED-FAILURES*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str344("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str345("*TRACE-TEST-PROGRESS*\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str346("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("*FILES-FAILED-TO-COMPILE*\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str348("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str349("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str350("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str351("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str352("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str353("*SEED-NO-RUN*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str354("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str355("%FN%CLASP-TESTS::MESSAGE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str356("%FN%MESSAGE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str357("%FN%CLASP-TESTS::RESET-CLASP-TESTS\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str358("%FN%RESET-CLASP-TESTS\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str359("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str360("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str361("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str362("*__MLIR_BLOCK_RETFLAG_96868088414229*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str363("*__MLIR_BLOCK_RETVALUE_96868088414229*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str364("*__MLIR_BLOCK_RETMVLIST_96868088414229*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str365("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str366("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str367("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str368("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str369("*DUPLICATE-TESTS*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str370("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str371("~%Duplicate test ~a~%\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str372("WARN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str373("*TEST-MARKER-TABLE*\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str374("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str375("%FN%(setf COMMON-LISP:GETHASH)\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str376("*__MLIR_BLOCK_RETFLAG_96868088414229*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str377("*__MLIR_BLOCK_RETMVLIST_96868088414229*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str378("name\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str379("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str380("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str381("%FN%CLASP-TESTS::NOTE-TEST\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str382("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str383("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str384("NOTE-TEST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str385("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str386("%FN%CLASP-TESTS::NOTE-COMPILE-ERROR\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str387("%FN%NOTE-COMPILE-ERROR\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str388("%FN%CLASP-TESTS::SHOW-TEST-SUMMARY\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str389("%FN%SHOW-TEST-SUMMARY\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str390("*ALL-RUNTIME-ERRORS*\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str391("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str392("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str393("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str394("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str395("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str396("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str397("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str398("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str399("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str400("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str401("%FN%%fail-test-with-error\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str402("%FAIL-TEST-WITH-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str403("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str404("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str405("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str406("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str407("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str408("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str409("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str410("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str411("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str412("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str413("%FN%%fail-test\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str414("%FAIL-TEST\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str415("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str416("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str417("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str418("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str419("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str420("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str421("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str422("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str423("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str424("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str425("%FN%%succeed-test\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str426("%SUCCEED-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str427("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str428("%FN%%test\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str429("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str430("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str431("%FN%%test\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str432("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str433("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str434("%FN%%test\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str435("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str436("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str437("%FN%%test\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str438("%TEST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str439("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str440("%FN%CLASP-TESTS:TEST\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str441("%FN%TEST\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str442("%FN%CLASP-TESTS:TEST-EXPECT-ERROR\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str443("%FN%TEST-EXPECT-ERROR\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str444("%FN%CLASP-TESTS::TEST-TRUE\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str445("%FN%TEST-TRUE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str446("%FN%CLASP-TESTS::TEST-NIL\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str447("%FN%TEST-NIL\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str448("%FN%CLASP-TESTS::TEST-TYPE\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str449("%FN%TEST-TYPE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str450("%FN%CLASP-TESTS::TEST-FINISHES\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str451("%FN%TEST-FINISHES\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str452("%FN%CLASP-TESTS::LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<44 x i8>
  llvm.mlir.global private constant @str453("%FN%LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str454("%FN%CLASP-TESTS::NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<60 x i8>
  llvm.mlir.global private constant @str455("%FN%NO-HANDLER-CASE-LOAD-IF-COMPILED-CORRECTLY\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str456("*__MLIR_BLOCK_RETFLAG_96868088414228*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str457("*__MLIR_BLOCK_RETMVLIST_96868088414228*\00") : !llvm.array<40 x i8>
  llvm.mlir.global constant @__argslist_functions("%FN%%test\00%FN%CLASP-TESTS::MESSAGE\00%FN%CLASP-TESTS::MESSAGE\00%FN%%test\00\00") : !llvm.array<71 x i8>
}
