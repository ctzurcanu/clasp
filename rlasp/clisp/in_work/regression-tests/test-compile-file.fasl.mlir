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
  func.func @"%FN%CLASP-TESTS::FOO"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 3 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = llvm.mlir.addressof @str1 : !llvm.ptr
    %4 = arith.constant 11 : i64
    %5 = func.call @cc_make_string(%3, %4) : (!llvm.ptr, i64) -> i64
    %6 = func.call @cc_intern(%2, %5) : (i64, i64) -> i64
    %7 = func.call @cc_nil_value() : () -> i64
    %8 = func.call @cc_cons(%6, %7) : (i64, i64) -> i64
    %9 = func.call @cc_values_pack(%8) : (i64) -> i64
    %10 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%6, %10) : (i64, i64) -> ()
    %11 = func.call @cc_nil_value() : () -> i64
    %12 = llvm.mlir.addressof @str2 : !llvm.ptr
    %13 = arith.constant 37 : i64
    %14 = func.call @cc_make_string(%12, %13) : (!llvm.ptr, i64) -> i64
    %15 = func.call @cc_nil_value() : () -> i64
    %16 = func.call @cc_intern(%14, %15) : (i64, i64) -> i64
    %17 = func.call @cc_nil_value() : () -> i64
    %18 = func.call @cc_cons(%16, %17) : (i64, i64) -> i64
    %19 = func.call @cc_values_pack(%18) : (i64) -> i64
    %20 = func.call @cc_set_symbol_value(%16, %11) : (i64, i64) -> i64
    %21 = llvm.mlir.addressof @str3 : !llvm.ptr
    %22 = arith.constant 38 : i64
    %23 = func.call @cc_make_string(%21, %22) : (!llvm.ptr, i64) -> i64
    %24 = func.call @cc_nil_value() : () -> i64
    %25 = func.call @cc_intern(%23, %24) : (i64, i64) -> i64
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_cons(%25, %26) : (i64, i64) -> i64
    %28 = func.call @cc_values_pack(%27) : (i64) -> i64
    %29 = func.call @cc_set_symbol_value(%25, %11) : (i64, i64) -> i64
    %30 = llvm.mlir.addressof @str4 : !llvm.ptr
    %31 = arith.constant 39 : i64
    %32 = func.call @cc_make_string(%30, %31) : (!llvm.ptr, i64) -> i64
    %33 = func.call @cc_nil_value() : () -> i64
    %34 = func.call @cc_intern(%32, %33) : (i64, i64) -> i64
    %35 = func.call @cc_nil_value() : () -> i64
    %36 = func.call @cc_cons(%34, %35) : (i64, i64) -> i64
    %37 = func.call @cc_values_pack(%36) : (i64) -> i64
    %38 = func.call @cc_set_symbol_value(%34, %11) : (i64, i64) -> i64
    %39 = func.call @cc_nil_value() : () -> i64
    %40 = llvm.mlir.addressof @str5 : !llvm.ptr
    %41 = arith.constant 37 : i64
    %42 = func.call @cc_make_string(%40, %41) : (!llvm.ptr, i64) -> i64
    %43 = func.call @cc_nil_value() : () -> i64
    %44 = func.call @cc_intern(%42, %43) : (i64, i64) -> i64
    %45 = func.call @cc_nil_value() : () -> i64
    %46 = func.call @cc_cons(%44, %45) : (i64, i64) -> i64
    %47 = func.call @cc_values_pack(%46) : (i64) -> i64
    %48 = func.call @cc_set_symbol_value(%44, %39) : (i64, i64) -> i64
    %49 = llvm.mlir.addressof @str6 : !llvm.ptr
    %50 = arith.constant 38 : i64
    %51 = func.call @cc_make_string(%49, %50) : (!llvm.ptr, i64) -> i64
    %52 = func.call @cc_nil_value() : () -> i64
    %53 = func.call @cc_intern(%51, %52) : (i64, i64) -> i64
    %54 = func.call @cc_nil_value() : () -> i64
    %55 = func.call @cc_cons(%53, %54) : (i64, i64) -> i64
    %56 = func.call @cc_values_pack(%55) : (i64) -> i64
    %57 = func.call @cc_set_symbol_value(%53, %39) : (i64, i64) -> i64
    %58 = llvm.mlir.addressof @str7 : !llvm.ptr
    %59 = arith.constant 39 : i64
    %60 = func.call @cc_make_string(%58, %59) : (!llvm.ptr, i64) -> i64
    %61 = func.call @cc_nil_value() : () -> i64
    %62 = func.call @cc_intern(%60, %61) : (i64, i64) -> i64
    %63 = func.call @cc_nil_value() : () -> i64
    %64 = func.call @cc_cons(%62, %63) : (i64, i64) -> i64
    %65 = func.call @cc_values_pack(%64) : (i64) -> i64
    %66 = func.call @cc_set_symbol_value(%62, %39) : (i64, i64) -> i64
    %67 = arith.constant 42 : i64
    func.call @stack_push_fixnum(%67) : (i64) -> ()
    %68 = func.call @stack_pop_pointer() : () -> i64
    %69 = func.call @cc_multiple_value_list(%68) : (i64) -> i64
    %70 = llvm.mlir.addressof @str8 : !llvm.ptr
    %71 = arith.constant 37 : i64
    %72 = func.call @cc_make_string(%70, %71) : (!llvm.ptr, i64) -> i64
    %73 = func.call @cc_nil_value() : () -> i64
    %74 = func.call @cc_intern(%72, %73) : (i64, i64) -> i64
    %75 = func.call @cc_nil_value() : () -> i64
    %76 = func.call @cc_cons(%74, %75) : (i64, i64) -> i64
    %77 = func.call @cc_values_pack(%76) : (i64) -> i64
    %78 = func.call @cc_symbol_value(%74) : (i64) -> i64
    %79 = llvm.mlir.addressof @str9 : !llvm.ptr
    %80 = arith.constant 38 : i64
    %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
    %82 = func.call @cc_nil_value() : () -> i64
    %83 = func.call @cc_intern(%81, %82) : (i64, i64) -> i64
    %84 = func.call @cc_nil_value() : () -> i64
    %85 = func.call @cc_cons(%83, %84) : (i64, i64) -> i64
    %86 = func.call @cc_values_pack(%85) : (i64) -> i64
    %87 = func.call @cc_symbol_value(%83) : (i64) -> i64
    %88 = llvm.mlir.addressof @str10 : !llvm.ptr
    %89 = arith.constant 39 : i64
    %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
    %91 = func.call @cc_nil_value() : () -> i64
    %92 = func.call @cc_intern(%90, %91) : (i64, i64) -> i64
    %93 = func.call @cc_nil_value() : () -> i64
    %94 = func.call @cc_cons(%92, %93) : (i64, i64) -> i64
    %95 = func.call @cc_values_pack(%94) : (i64) -> i64
    %96 = func.call @cc_symbol_value(%92) : (i64) -> i64
    %97 = func.call @cc_nil_value() : () -> i64
    %98 = arith.cmpi ne, %78, %97 : i64
    %99 = scf.if %98 -> (i64) {
      scf.yield %96 : i64
    } else {
      scf.yield %69 : i64
    }
    %100 = func.call @cc_values_pack(%99) : (i64) -> i64
    func.call @stack_push_pointer(%100) : (i64) -> ()
    %101 = func.call @stack_pop_pointer() : () -> i64
    %102 = func.call @cc_multiple_value_list(%101) : (i64) -> i64
    %103 = llvm.mlir.addressof @str11 : !llvm.ptr
    %104 = arith.constant 37 : i64
    %105 = func.call @cc_make_string(%103, %104) : (!llvm.ptr, i64) -> i64
    %106 = func.call @cc_nil_value() : () -> i64
    %107 = func.call @cc_intern(%105, %106) : (i64, i64) -> i64
    %108 = func.call @cc_nil_value() : () -> i64
    %109 = func.call @cc_cons(%107, %108) : (i64, i64) -> i64
    %110 = func.call @cc_values_pack(%109) : (i64) -> i64
    %111 = func.call @cc_symbol_value(%107) : (i64) -> i64
    %112 = llvm.mlir.addressof @str12 : !llvm.ptr
    %113 = arith.constant 39 : i64
    %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
    %115 = func.call @cc_nil_value() : () -> i64
    %116 = func.call @cc_intern(%114, %115) : (i64, i64) -> i64
    %117 = func.call @cc_nil_value() : () -> i64
    %118 = func.call @cc_cons(%116, %117) : (i64, i64) -> i64
    %119 = func.call @cc_values_pack(%118) : (i64) -> i64
    %120 = func.call @cc_symbol_value(%116) : (i64) -> i64
    %121 = func.call @cc_nil_value() : () -> i64
    %122 = arith.cmpi ne, %111, %121 : i64
    %123 = scf.if %122 -> (i64) {
      scf.yield %120 : i64
    } else {
      scf.yield %102 : i64
    }
    %124 = func.call @cc_values_pack(%123) : (i64) -> i64
    func.call @stack_push_pointer(%124) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %125 = llvm.mlir.addressof @str13 : !llvm.ptr
    %126 = arith.constant 6 : i64
    %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
    %128 = func.call @cc_nil_value() : () -> i64
    %129 = func.call @cc_intern(%127, %128) : (i64, i64) -> i64
    %130 = func.call @cc_nil_value() : () -> i64
    %131 = func.call @cc_cons(%129, %130) : (i64, i64) -> i64
    %132 = func.call @cc_values_pack(%131) : (i64) -> i64
    %133 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%129, %133) : (i64, i64) -> ()
    %134 = func.call @cc_nil_value() : () -> i64
    %135 = llvm.mlir.addressof @str14 : !llvm.ptr
    %136 = arith.constant 37 : i64
    %137 = func.call @cc_make_string(%135, %136) : (!llvm.ptr, i64) -> i64
    %138 = func.call @cc_nil_value() : () -> i64
    %139 = func.call @cc_intern(%137, %138) : (i64, i64) -> i64
    %140 = func.call @cc_nil_value() : () -> i64
    %141 = func.call @cc_cons(%139, %140) : (i64, i64) -> i64
    %142 = func.call @cc_values_pack(%141) : (i64) -> i64
    %143 = func.call @cc_set_symbol_value(%139, %134) : (i64, i64) -> i64
    %144 = llvm.mlir.addressof @str15 : !llvm.ptr
    %145 = arith.constant 38 : i64
    %146 = func.call @cc_make_string(%144, %145) : (!llvm.ptr, i64) -> i64
    %147 = func.call @cc_nil_value() : () -> i64
    %148 = func.call @cc_intern(%146, %147) : (i64, i64) -> i64
    %149 = func.call @cc_nil_value() : () -> i64
    %150 = func.call @cc_cons(%148, %149) : (i64, i64) -> i64
    %151 = func.call @cc_values_pack(%150) : (i64) -> i64
    %152 = func.call @cc_set_symbol_value(%148, %134) : (i64, i64) -> i64
    %153 = llvm.mlir.addressof @str16 : !llvm.ptr
    %154 = arith.constant 39 : i64
    %155 = func.call @cc_make_string(%153, %154) : (!llvm.ptr, i64) -> i64
    %156 = func.call @cc_nil_value() : () -> i64
    %157 = func.call @cc_intern(%155, %156) : (i64, i64) -> i64
    %158 = func.call @cc_nil_value() : () -> i64
    %159 = func.call @cc_cons(%157, %158) : (i64, i64) -> i64
    %160 = func.call @cc_values_pack(%159) : (i64) -> i64
    %161 = func.call @cc_set_symbol_value(%157, %134) : (i64, i64) -> i64
    %162 = func.call @cc_nil_value() : () -> i64
    %163 = func.call @cc_nil_value() : () -> i64
    %164 = func.call @cc_errorp(%162) : (i64) -> i64
    %165 = arith.cmpi ne, %164, %163 : i64
    %166 = scf.if %165 -> (i64) {
      scf.yield %162 : i64
    } else {
      %167 = llvm.mlir.addressof @str17 : !llvm.ptr
      %168 = arith.constant 7 : i64
      %169 = func.call @cc_make_string(%167, %168) : (!llvm.ptr, i64) -> i64
      %170 = llvm.mlir.addressof @str18 : !llvm.ptr
      %171 = arith.constant 7 : i64
      %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
      %173 = func.call @cc_intern(%169, %172) : (i64, i64) -> i64
      %174 = func.call @cc_nil_value() : () -> i64
      %175 = func.call @cc_cons(%173, %174) : (i64, i64) -> i64
      %176 = func.call @cc_values_pack(%175) : (i64) -> i64
      func.call @stack_push_pointer(%173) : (i64) -> ()
      %177 = func.call @stack_pop_pointer() : () -> i64
      %178 = func.call @cc_in_package(%177) : (i64) -> i64
      func.call @stack_push_pointer(%178) : (i64) -> ()
      %179 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %179 : i64
    }
    %180 = func.call @cc_nil_value() : () -> i64
    %181 = func.call @cc_errorp(%166) : (i64) -> i64
    %182 = arith.cmpi ne, %181, %180 : i64
    %183 = scf.if %182 -> (i64) {
      scf.yield %166 : i64
    } else {
      %184 = llvm.mlir.addressof @str19 : !llvm.ptr
      %185 = func.call @cc_make_function_ref_const(%184) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%185) : (i64) -> ()
      %186 = func.call @stack_pop_pointer() : () -> i64
      %187 = llvm.mlir.addressof @str20 : !llvm.ptr
      %188 = arith.constant 7 : i64
      %189 = func.call @cc_make_string(%187, %188) : (!llvm.ptr, i64) -> i64
      %190 = func.call @cc_nil_value() : () -> i64
      %191 = func.call @cc_intern(%189, %190) : (i64, i64) -> i64
      %192 = func.call @cc_nil_value() : () -> i64
      %193 = func.call @cc_cons(%191, %192) : (i64, i64) -> i64
      %194 = func.call @cc_values_pack(%193) : (i64) -> i64
      %195 = func.call @cc_set_symbol_value(%191, %186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      %196 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %196 : i64
    }
    func.call @stack_push_pointer(%183) : (i64) -> ()
    %197 = func.call @stack_pop_pointer() : () -> i64
    %198 = func.call @cc_multiple_value_list(%197) : (i64) -> i64
    %199 = llvm.mlir.addressof @str21 : !llvm.ptr
    %200 = arith.constant 37 : i64
    %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
    %202 = func.call @cc_nil_value() : () -> i64
    %203 = func.call @cc_intern(%201, %202) : (i64, i64) -> i64
    %204 = func.call @cc_nil_value() : () -> i64
    %205 = func.call @cc_cons(%203, %204) : (i64, i64) -> i64
    %206 = func.call @cc_values_pack(%205) : (i64) -> i64
    %207 = func.call @cc_symbol_value(%203) : (i64) -> i64
    %208 = llvm.mlir.addressof @str22 : !llvm.ptr
    %209 = arith.constant 39 : i64
    %210 = func.call @cc_make_string(%208, %209) : (!llvm.ptr, i64) -> i64
    %211 = func.call @cc_nil_value() : () -> i64
    %212 = func.call @cc_intern(%210, %211) : (i64, i64) -> i64
    %213 = func.call @cc_nil_value() : () -> i64
    %214 = func.call @cc_cons(%212, %213) : (i64, i64) -> i64
    %215 = func.call @cc_values_pack(%214) : (i64) -> i64
    %216 = func.call @cc_symbol_value(%212) : (i64) -> i64
    %217 = func.call @cc_nil_value() : () -> i64
    %218 = arith.cmpi ne, %207, %217 : i64
    %219 = scf.if %218 -> (i64) {
      scf.yield %216 : i64
    } else {
      scf.yield %198 : i64
    }
    %220 = func.call @cc_values_pack(%219) : (i64) -> i64
    func.call @stack_push_pointer(%220) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FOO\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str1("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_98668451463168*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_98668451463168*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_98668451463168*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_98668451463169*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_98668451463169*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_98668451463169*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETFLAG_98668451463169*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETVALUE_98668451463169*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETMVLIST_98668451463169*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETFLAG_98668451463168*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_98668451463168*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str13("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETFLAG_98668451463170*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETVALUE_98668451463170*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETMVLIST_98668451463170*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str17("CL-USER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("%FN%CLASP-TESTS::FOO\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str20("%FN%FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETFLAG_98668451463170*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETMVLIST_98668451463170*\00") : !llvm.array<40 x i8>
}
