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
    %12 = arith.constant 2 : i64
    func.call @cc_runtime_debug_stack_push_call(%4, %12) : (i64, i64) -> ()
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
    %44 = llvm.mlir.addressof @str5 : !llvm.ptr
    %45 = arith.constant 38 : i64
    %46 = func.call @cc_make_string(%44, %45) : (!llvm.ptr, i64) -> i64
    %47 = func.call @cc_nil_value() : () -> i64
    %48 = func.call @cc_intern(%46, %47) : (i64, i64) -> i64
    %49 = func.call @cc_nil_value() : () -> i64
    %50 = func.call @cc_cons(%48, %49) : (i64, i64) -> i64
    %51 = func.call @cc_values_pack(%50) : (i64) -> i64
    %52 = func.call @cc_set_symbol_value(%48, %43) : (i64, i64) -> i64
    %53 = llvm.mlir.addressof @str6 : !llvm.ptr
    %54 = arith.constant 39 : i64
    %55 = func.call @cc_make_string(%53, %54) : (!llvm.ptr, i64) -> i64
    %56 = func.call @cc_nil_value() : () -> i64
    %57 = func.call @cc_intern(%55, %56) : (i64, i64) -> i64
    %58 = func.call @cc_nil_value() : () -> i64
    %59 = func.call @cc_cons(%57, %58) : (i64, i64) -> i64
    %60 = func.call @cc_values_pack(%59) : (i64) -> i64
    %61 = func.call @cc_set_symbol_value(%57, %43) : (i64, i64) -> i64
    %62 = llvm.mlir.addressof @str7 : !llvm.ptr
    %63 = arith.constant 40 : i64
    %64 = func.call @cc_make_string(%62, %63) : (!llvm.ptr, i64) -> i64
    %65 = func.call @cc_nil_value() : () -> i64
    %66 = func.call @cc_intern(%64, %65) : (i64, i64) -> i64
    %67 = func.call @cc_nil_value() : () -> i64
    %68 = func.call @cc_cons(%66, %67) : (i64, i64) -> i64
    %69 = func.call @cc_values_pack(%68) : (i64) -> i64
    %70 = func.call @cc_set_symbol_value(%66, %43) : (i64, i64) -> i64
    %71 = arith.constant 0 : i64
    func.call @stack_push_fixnum(%71) : (i64) -> ()
    %72 = func.call @stack_pop_pointer() : () -> i64
    %73 = func.call @cc_nil_value() : () -> i64
    %74 = func.call @cc_errorp(%72) : (i64) -> i64
    %75 = arith.cmpi ne, %74, %73 : i64
    %76 = arith.cmpi eq, %73, %73 : i64
    %77 = arith.andi %75, %76 : i1
    %78 = scf.if %77 -> (i64) {
      scf.yield %72 : i64
    } else {
      scf.yield %73 : i64
    }
    %79 = arith.cmpi ne, %78, %73 : i64
    scf.if %79 {
      func.call @stack_push_pointer(%78) : (i64) -> ()
    } else {
      %80 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      func.call @stack_push_pointer(%72) : (i64) -> ()
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = func.call @stack_pop_pointer() : () -> i64
      %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
      func.call @stack_push_pointer(%83) : (i64) -> ()
    }
    %84 = func.call @stack_pop_pointer() : () -> i64
    %85 = llvm.mlir.addressof @str8 : !llvm.ptr
    %86 = arith.constant 35 : i64
    %87 = func.call @cc_make_symbol(%85, %86) : (!llvm.ptr, i64) -> i64
    %88 = func.call @cc_persistent_root_value(%87) : (i64) -> i64
    %89 = func.call @cc_set_symbol_value(%88, %84) : (i64, i64) -> i64
    %90 = func.call @cc_nil_value() : () -> i64
    %91 = func.call @cc_nil_value() : () -> i64
    %92 = func.call @cc_errorp(%90) : (i64) -> i64
    %93 = arith.cmpi ne, %92, %91 : i64
    %94 = scf.if %93 -> (i64) {
      scf.yield %90 : i64
    } else {
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %143 = arith.constant 236837129945092 : i64
      %144 = arith.constant 1 : i64
      %145 = func.call @cc_make_closure(%143, %144) : (i64, i64) -> i64
      %146 = llvm.mlir.addressof @str9 : !llvm.ptr
      %147 = arith.constant 16 : i64
      %148 = func.call @cc_bind_function_object_const(%146, %147, %145) : (!llvm.ptr, i64, i64) -> i64
      func.call @stack_push_pointer(%13) : (i64) -> ()
      %149 = func.call @stack_pop_pointer() : () -> i64
      %150 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%150) : (i64) -> ()
      %151 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %152 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %153 = func.call @stack_pop_pointer() : () -> i64
      %154 = func.call @cc_nil_value() : () -> i64
      %155 = func.call @cc_nil_value() : () -> i64
      %156 = func.call @cc_errorp(%154) : (i64) -> i64
      %157 = arith.cmpi ne, %156, %155 : i64
      %158 = scf.if %157 -> (i64) {
        scf.yield %154 : i64
      } else {
        %159 = func.call @cc_nil_value() : () -> i64
        %160 = llvm.mlir.addressof @str10 : !llvm.ptr
        %161 = arith.constant 38 : i64
        %162 = func.call @cc_make_string(%160, %161) : (!llvm.ptr, i64) -> i64
        %163 = func.call @cc_nil_value() : () -> i64
        %164 = func.call @cc_intern(%162, %163) : (i64, i64) -> i64
        %165 = func.call @cc_nil_value() : () -> i64
        %166 = func.call @cc_cons(%164, %165) : (i64, i64) -> i64
        %167 = func.call @cc_values_pack(%166) : (i64) -> i64
        %168 = func.call @cc_set_symbol_value(%164, %159) : (i64, i64) -> i64
        %169 = llvm.mlir.addressof @str11 : !llvm.ptr
        %170 = arith.constant 39 : i64
        %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
        %172 = func.call @cc_nil_value() : () -> i64
        %173 = func.call @cc_intern(%171, %172) : (i64, i64) -> i64
        %174 = func.call @cc_nil_value() : () -> i64
        %175 = func.call @cc_cons(%173, %174) : (i64, i64) -> i64
        %176 = func.call @cc_values_pack(%175) : (i64) -> i64
        %177 = func.call @cc_set_symbol_value(%173, %159) : (i64, i64) -> i64
        %178 = llvm.mlir.addressof @str12 : !llvm.ptr
        %179 = arith.constant 40 : i64
        %180 = func.call @cc_make_string(%178, %179) : (!llvm.ptr, i64) -> i64
        %181 = func.call @cc_nil_value() : () -> i64
        %182 = func.call @cc_intern(%180, %181) : (i64, i64) -> i64
        %183 = func.call @cc_nil_value() : () -> i64
        %184 = func.call @cc_cons(%182, %183) : (i64, i64) -> i64
        %185 = func.call @cc_values_pack(%184) : (i64) -> i64
        %186 = func.call @cc_set_symbol_value(%182, %159) : (i64, i64) -> i64
        %187:3 = scf.while (%arg0 = %152, %arg1 = %153, %arg2 = %151) : (i64, i64, i64) -> (i64, i64, i64) {
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %188 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%149) : (i64) -> ()
          %189 = func.call @stack_pop_pointer() : () -> i64
          %190 = arith.constant 1 : i1
          %192 = arith.constant 3 : i64
          %191 = arith.andi %188, %192 : i64
          %193 = arith.constant 0 : i64
          %194 = arith.cmpi eq, %191, %193 : i64
          %196 = arith.constant 3 : i64
          %195 = arith.andi %189, %196 : i64
          %197 = arith.constant 0 : i64
          %198 = arith.cmpi eq, %195, %197 : i64
          %199 = arith.andi %194, %198 : i1
          %200 = scf.if %199 -> (i1) {
            %201 = arith.constant 2 : i64
            %202 = arith.shrsi %188, %201 : i64
            %203 = arith.constant 2 : i64
            %204 = arith.shrsi %189, %203 : i64
            %205 = arith.cmpi slt, %202, %204 : i64
            scf.yield %205 : i1
          } else {
            %206 = func.call @cc_lt(%188, %189) : (i64, i64) -> i64
            %207 = func.call @cc_nil_value() : () -> i64
            %208 = arith.cmpi ne, %206, %207 : i64
            scf.yield %208 : i1
          }
          %209 = arith.andi %190, %200 : i1
          %210 = func.call @cc_nil_value() : () -> i64
          %211 = func.call @cc_t_value() : () -> i64
          %212 = scf.if %209 -> (i64) {
            scf.yield %211 : i64
          } else {
            scf.yield %210 : i64
          }
          func.call @stack_push_pointer(%212) : (i64) -> ()
          %213 = func.call @stack_pop_pointer() : () -> i64
          %214 = func.call @cc_nil_value() : () -> i64
          %215 = arith.cmpi ne, %213, %214 : i64
          %216 = func.call @cc_nil_value() : () -> i64
          %217 = llvm.mlir.addressof @str13 : !llvm.ptr
          %218 = arith.constant 38 : i64
          %219 = func.call @cc_make_string(%217, %218) : (!llvm.ptr, i64) -> i64
          %220 = func.call @cc_nil_value() : () -> i64
          %221 = func.call @cc_intern(%219, %220) : (i64, i64) -> i64
          %222 = func.call @cc_nil_value() : () -> i64
          %223 = func.call @cc_cons(%221, %222) : (i64, i64) -> i64
          %224 = func.call @cc_values_pack(%223) : (i64) -> i64
          %225 = func.call @cc_symbol_value(%221) : (i64) -> i64
          %226 = arith.cmpi ne, %225, %216 : i64
          %227 = llvm.mlir.addressof @str14 : !llvm.ptr
          %228 = arith.constant 38 : i64
          %229 = func.call @cc_make_string(%227, %228) : (!llvm.ptr, i64) -> i64
          %230 = func.call @cc_nil_value() : () -> i64
          %231 = func.call @cc_intern(%229, %230) : (i64, i64) -> i64
          %232 = func.call @cc_nil_value() : () -> i64
          %233 = func.call @cc_cons(%231, %232) : (i64, i64) -> i64
          %234 = func.call @cc_values_pack(%233) : (i64) -> i64
          %235 = func.call @cc_symbol_value(%231) : (i64) -> i64
          %236 = arith.cmpi ne, %235, %216 : i64
          %237 = arith.ori %226, %236 : i1
          %238 = llvm.mlir.addressof @str15 : !llvm.ptr
          %239 = arith.constant 38 : i64
          %240 = func.call @cc_make_string(%238, %239) : (!llvm.ptr, i64) -> i64
          %241 = func.call @cc_nil_value() : () -> i64
          %242 = func.call @cc_intern(%240, %241) : (i64, i64) -> i64
          %243 = func.call @cc_nil_value() : () -> i64
          %244 = func.call @cc_cons(%242, %243) : (i64, i64) -> i64
          %245 = func.call @cc_values_pack(%244) : (i64) -> i64
          %246 = func.call @cc_symbol_value(%242) : (i64) -> i64
          %247 = arith.cmpi ne, %246, %216 : i64
          %248 = arith.ori %237, %247 : i1
          %249 = arith.constant 0 : i1
          %250 = arith.cmpi eq, %248, %249 : i1
          %251 = arith.andi %215, %250 : i1
          scf.condition(%251) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%252: i64, %253: i64, %254: i64):
          func.call @stack_push_pointer(%14) : (i64) -> ()
          %255 = func.call @stack_pop_pointer() : () -> i64
          %256 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%255, %256) : (i64, i64) -> ()
          %257 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%257) : (i64) -> ()
          %258 = func.call @stack_depth() : () -> i64
          %259 = arith.constant 0 : i64
          %260 = arith.cmpi sgt, %258, %259 : i64
          scf.if %260 {
            %261 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%257) : (i64) -> ()
          %262 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%145) : (i64) -> ()
          %263 = func.call @stack_pop_pointer() : () -> i64
          %264 = func.call @cc_nil_value() : () -> i64
          %265 = func.call @cc_errorp(%262) : (i64) -> i64
          %266 = arith.cmpi ne, %265, %264 : i64
          %267 = arith.cmpi eq, %264, %264 : i64
          %268 = arith.andi %266, %267 : i1
          %269 = scf.if %268 -> (i64) {
            scf.yield %262 : i64
          } else {
            scf.yield %264 : i64
          }
          %270 = func.call @cc_errorp(%263) : (i64) -> i64
          %271 = arith.cmpi ne, %270, %264 : i64
          %272 = arith.cmpi eq, %269, %264 : i64
          %273 = arith.andi %271, %272 : i1
          %274 = scf.if %273 -> (i64) {
            scf.yield %263 : i64
          } else {
            scf.yield %269 : i64
          }
          %275 = arith.cmpi ne, %274, %264 : i64
          scf.if %275 {
            func.call @stack_push_pointer(%274) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%262) : (i64) -> ()
            func.call @stack_push_pointer(%263) : (i64) -> ()
            %276 = llvm.mlir.addressof @str16 : !llvm.ptr
            %277 = func.call @cc_make_function_ref_const(%276) : (!llvm.ptr) -> i64
            %278 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%277, %278) : (i64, i64) -> ()
          }
          %279 = func.call @stack_depth() : () -> i64
          %280 = arith.constant 0 : i64
          %281 = arith.cmpi sgt, %279, %280 : i64
          scf.if %281 {
            %282 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%253) : (i64) -> ()
          func.call @stack_push_pointer(%257) : (i64) -> ()
          %283 = func.call @stack_pop_pointer() : () -> i64
          %284 = func.call @cc_nil_value() : () -> i64
          %285 = func.call @cc_errorp(%283) : (i64) -> i64
          %286 = arith.cmpi ne, %285, %284 : i64
          %287 = arith.cmpi eq, %284, %284 : i64
          %288 = arith.andi %286, %287 : i1
          %289 = scf.if %288 -> (i64) {
            scf.yield %283 : i64
          } else {
            scf.yield %284 : i64
          }
          %290 = arith.cmpi ne, %289, %284 : i64
          scf.if %290 {
            func.call @stack_push_pointer(%289) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%283) : (i64) -> ()
            %291 = llvm.mlir.addressof @str17 : !llvm.ptr
            %292 = func.call @cc_make_function_ref_const(%291) : (!llvm.ptr) -> i64
            %293 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%292, %293) : (i64, i64) -> ()
          }
          %294 = func.call @stack_pop_pointer() : () -> i64
          %295 = func.call @cc_nil_value() : () -> i64
          %296 = func.call @cc_errorp(%294) : (i64) -> i64
          %297 = arith.cmpi ne, %296, %295 : i64
          %298 = arith.cmpi eq, %295, %295 : i64
          %299 = arith.andi %297, %298 : i1
          %300 = scf.if %299 -> (i64) {
            scf.yield %294 : i64
          } else {
            scf.yield %295 : i64
          }
          %301 = arith.cmpi ne, %300, %295 : i64
          scf.if %301 {
            func.call @stack_push_pointer(%300) : (i64) -> ()
          } else {
            %302 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%302) : (i64) -> ()
            func.call @stack_push_pointer(%294) : (i64) -> ()
            %303 = func.call @stack_pop_pointer() : () -> i64
            %304 = func.call @stack_pop_pointer() : () -> i64
            %305 = func.call @cc_cons(%303, %304) : (i64, i64) -> i64
            func.call @stack_push_pointer(%305) : (i64) -> ()
          }
          %306 = func.call @stack_pop_pointer() : () -> i64
          %307 = func.call @stack_pop_pointer() : () -> i64
          %308 = func.call @cc_append(%307, %306) : (i64, i64) -> i64
          func.call @stack_push_pointer(%308) : (i64) -> ()
          %309 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%309) : (i64) -> ()
          %310 = func.call @stack_depth() : () -> i64
          %311 = arith.constant 0 : i64
          %312 = arith.cmpi sgt, %310, %311 : i64
          scf.if %312 {
            %313 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%254) : (i64) -> ()
          %314 = func.call @stack_pop_pointer() : () -> i64
          %315 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%315) : (i64) -> ()
          %316 = func.call @stack_pop_pointer() : () -> i64
          %318 = arith.constant 3 : i64
          %317 = arith.andi %314, %318 : i64
          %319 = arith.constant 0 : i64
          %320 = arith.cmpi eq, %317, %319 : i64
          %322 = arith.constant 3 : i64
          %321 = arith.andi %316, %322 : i64
          %323 = arith.constant 0 : i64
          %324 = arith.cmpi eq, %321, %323 : i64
          %325 = arith.andi %320, %324 : i1
          %326 = scf.if %325 -> (i64) {
            %327 = arith.constant 2 : i64
            %328 = arith.shrsi %314, %327 : i64
            %329 = arith.constant 2 : i64
            %330 = arith.shrsi %316, %329 : i64
            %331 = arith.addi %328, %330 : i64
            %332 = arith.constant -2305843009213693952 : i64
            %333 = arith.constant 2305843009213693951 : i64
            %334 = arith.cmpi sge, %331, %332 : i64
            %335 = arith.cmpi sle, %331, %333 : i64
            %336 = arith.andi %334, %335 : i1
            %337 = scf.if %336 -> (i64) {
              %338 = arith.constant 2 : i64
              %339 = arith.shli %331, %338 : i64
              scf.yield %339 : i64
            } else {
              %340 = func.call @cc_add(%314, %316) : (i64, i64) -> i64
              scf.yield %340 : i64
            }
            scf.yield %337 : i64
          } else {
            %341 = func.call @cc_add(%314, %316) : (i64, i64) -> i64
            scf.yield %341 : i64
          }
          func.call @stack_push_pointer(%326) : (i64) -> ()
          %342 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%342) : (i64) -> ()
          %343 = func.call @stack_depth() : () -> i64
          %344 = arith.constant 0 : i64
          %345 = arith.cmpi sgt, %343, %344 : i64
          scf.if %345 {
            %346 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %257, %309, %342 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %347 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%187#1) : (i64) -> ()
        %348 = func.call @stack_pop_pointer() : () -> i64
        %349 = func.call @cc_multiple_value_list(%348) : (i64) -> i64
        %350 = llvm.mlir.addressof @str18 : !llvm.ptr
        %351 = arith.constant 38 : i64
        %352 = func.call @cc_make_string(%350, %351) : (!llvm.ptr, i64) -> i64
        %353 = func.call @cc_nil_value() : () -> i64
        %354 = func.call @cc_intern(%352, %353) : (i64, i64) -> i64
        %355 = func.call @cc_nil_value() : () -> i64
        %356 = func.call @cc_cons(%354, %355) : (i64, i64) -> i64
        %357 = func.call @cc_values_pack(%356) : (i64) -> i64
        %358 = func.call @cc_symbol_value(%354) : (i64) -> i64
        %359 = llvm.mlir.addressof @str19 : !llvm.ptr
        %360 = arith.constant 39 : i64
        %361 = func.call @cc_make_string(%359, %360) : (!llvm.ptr, i64) -> i64
        %362 = func.call @cc_nil_value() : () -> i64
        %363 = func.call @cc_intern(%361, %362) : (i64, i64) -> i64
        %364 = func.call @cc_nil_value() : () -> i64
        %365 = func.call @cc_cons(%363, %364) : (i64, i64) -> i64
        %366 = func.call @cc_values_pack(%365) : (i64) -> i64
        %367 = func.call @cc_symbol_value(%363) : (i64) -> i64
        %368 = llvm.mlir.addressof @str20 : !llvm.ptr
        %369 = arith.constant 40 : i64
        %370 = func.call @cc_make_string(%368, %369) : (!llvm.ptr, i64) -> i64
        %371 = func.call @cc_nil_value() : () -> i64
        %372 = func.call @cc_intern(%370, %371) : (i64, i64) -> i64
        %373 = func.call @cc_nil_value() : () -> i64
        %374 = func.call @cc_cons(%372, %373) : (i64, i64) -> i64
        %375 = func.call @cc_values_pack(%374) : (i64) -> i64
        %376 = func.call @cc_symbol_value(%372) : (i64) -> i64
        %377 = func.call @cc_nil_value() : () -> i64
        %378 = arith.cmpi ne, %358, %377 : i64
        %379 = scf.if %378 -> (i64) {
          scf.yield %376 : i64
        } else {
          scf.yield %349 : i64
        }
        %380 = func.call @cc_values_pack(%379) : (i64) -> i64
        func.call @stack_push_pointer(%380) : (i64) -> ()
        %381 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %381 : i64
      }
      func.call @stack_push_pointer(%158) : (i64) -> ()
      %382 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %394 = arith.constant 236837129945094 : i64
      %395 = arith.constant 1 : i64
      %396 = func.call @cc_make_closure(%394, %395) : (i64, i64) -> i64
      func.call @stack_push_pointer(%396) : (i64) -> ()
      %397 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %398 = func.call @stack_pop_pointer() : () -> i64
      %399 = func.call @cc_cons(%397, %398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%399) : (i64) -> ()
      %400 = func.call @stack_pop_pointer() : () -> i64
      %401 = func.call @cc_cons(%382, %400) : (i64, i64) -> i64
      func.call @stack_push_pointer(%401) : (i64) -> ()
      %402 = func.call @stack_pop_pointer() : () -> i64
      %403 = func.call @cc_values_pack(%402) : (i64) -> i64
      func.call @stack_push_pointer(%403) : (i64) -> ()
      %404 = func.call @stack_pop_pointer() : () -> i64
      %405 = func.call @cc_multiple_value_list(%404) : (i64) -> i64
      %406 = func.call @cc_symbol_value(%88) : (i64) -> i64
      %407 = func.call @cc_values_pack(%405) : (i64) -> i64
      func.call @stack_push_pointer(%407) : (i64) -> ()
      %408 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %408 : i64
    }
    func.call @stack_push_pointer(%94) : (i64) -> ()
    %409 = func.call @stack_pop_pointer() : () -> i64
    %410 = func.call @cc_multiple_value_list(%409) : (i64) -> i64
    %411 = llvm.mlir.addressof @str21 : !llvm.ptr
    %412 = arith.constant 38 : i64
    %413 = func.call @cc_make_string(%411, %412) : (!llvm.ptr, i64) -> i64
    %414 = func.call @cc_nil_value() : () -> i64
    %415 = func.call @cc_intern(%413, %414) : (i64, i64) -> i64
    %416 = func.call @cc_nil_value() : () -> i64
    %417 = func.call @cc_cons(%415, %416) : (i64, i64) -> i64
    %418 = func.call @cc_values_pack(%417) : (i64) -> i64
    %419 = func.call @cc_symbol_value(%415) : (i64) -> i64
    %420 = llvm.mlir.addressof @str22 : !llvm.ptr
    %421 = arith.constant 39 : i64
    %422 = func.call @cc_make_string(%420, %421) : (!llvm.ptr, i64) -> i64
    %423 = func.call @cc_nil_value() : () -> i64
    %424 = func.call @cc_intern(%422, %423) : (i64, i64) -> i64
    %425 = func.call @cc_nil_value() : () -> i64
    %426 = func.call @cc_cons(%424, %425) : (i64, i64) -> i64
    %427 = func.call @cc_values_pack(%426) : (i64) -> i64
    %428 = func.call @cc_symbol_value(%424) : (i64) -> i64
    %429 = llvm.mlir.addressof @str23 : !llvm.ptr
    %430 = arith.constant 40 : i64
    %431 = func.call @cc_make_string(%429, %430) : (!llvm.ptr, i64) -> i64
    %432 = func.call @cc_nil_value() : () -> i64
    %433 = func.call @cc_intern(%431, %432) : (i64, i64) -> i64
    %434 = func.call @cc_nil_value() : () -> i64
    %435 = func.call @cc_cons(%433, %434) : (i64, i64) -> i64
    %436 = func.call @cc_values_pack(%435) : (i64) -> i64
    %437 = func.call @cc_symbol_value(%433) : (i64) -> i64
    %438 = func.call @cc_nil_value() : () -> i64
    %439 = arith.cmpi ne, %419, %438 : i64
    %440 = scf.if %439 -> (i64) {
      scf.yield %437 : i64
    } else {
      scf.yield %410 : i64
    }
    %441 = func.call @cc_values_pack(%440) : (i64) -> i64
    func.call @stack_push_pointer(%441) : (i64) -> ()
    %442 = func.call @stack_pop_pointer() : () -> i64
    %443 = func.call @cc_multiple_value_list(%442) : (i64) -> i64
    %444 = llvm.mlir.addressof @str24 : !llvm.ptr
    %445 = arith.constant 38 : i64
    %446 = func.call @cc_make_string(%444, %445) : (!llvm.ptr, i64) -> i64
    %447 = func.call @cc_nil_value() : () -> i64
    %448 = func.call @cc_intern(%446, %447) : (i64, i64) -> i64
    %449 = func.call @cc_nil_value() : () -> i64
    %450 = func.call @cc_cons(%448, %449) : (i64, i64) -> i64
    %451 = func.call @cc_values_pack(%450) : (i64) -> i64
    %452 = func.call @cc_symbol_value(%448) : (i64) -> i64
    %453 = llvm.mlir.addressof @str25 : !llvm.ptr
    %454 = arith.constant 40 : i64
    %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
    %456 = func.call @cc_nil_value() : () -> i64
    %457 = func.call @cc_intern(%455, %456) : (i64, i64) -> i64
    %458 = func.call @cc_nil_value() : () -> i64
    %459 = func.call @cc_cons(%457, %458) : (i64, i64) -> i64
    %460 = func.call @cc_values_pack(%459) : (i64) -> i64
    %461 = func.call @cc_symbol_value(%457) : (i64) -> i64
    %462 = func.call @cc_nil_value() : () -> i64
    %463 = arith.cmpi ne, %452, %462 : i64
    %464 = scf.if %463 -> (i64) {
      scf.yield %461 : i64
    } else {
      scf.yield %443 : i64
    }
    %465 = func.call @cc_values_pack(%464) : (i64) -> i64
    func.call @stack_push_pointer(%465) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%test-finalizers"() {
    %466 = llvm.mlir.addressof @str26 : !llvm.ptr
    %467 = arith.constant 15 : i64
    %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
    %469 = func.call @cc_nil_value() : () -> i64
    %470 = func.call @cc_intern(%468, %469) : (i64, i64) -> i64
    %471 = func.call @cc_nil_value() : () -> i64
    %472 = func.call @cc_cons(%470, %471) : (i64, i64) -> i64
    %473 = func.call @cc_values_pack(%472) : (i64) -> i64
    %474 = llvm.mlir.addressof @str27 : !llvm.ptr
    %475 = arith.constant 7 : i64
    %476 = func.call @cc_make_string(%474, %475) : (!llvm.ptr, i64) -> i64
    %477 = func.call @cc_register_function_lambda_list_metadata_raw(%470, %476) : (i64, i64) -> i64
    %478 = arith.constant 2 : i64
    func.call @cc_runtime_debug_stack_push_call(%470, %478) : (i64, i64) -> ()
    %479 = func.call @stack_pop_pointer() : () -> i64
    %480 = func.call @stack_pop_pointer() : () -> i64
    %481 = func.call @cc_nil_value() : () -> i64
    %482 = llvm.mlir.addressof @str28 : !llvm.ptr
    %483 = arith.constant 38 : i64
    %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
    %485 = func.call @cc_nil_value() : () -> i64
    %486 = func.call @cc_intern(%484, %485) : (i64, i64) -> i64
    %487 = func.call @cc_nil_value() : () -> i64
    %488 = func.call @cc_cons(%486, %487) : (i64, i64) -> i64
    %489 = func.call @cc_values_pack(%488) : (i64) -> i64
    %490 = func.call @cc_set_symbol_value(%486, %481) : (i64, i64) -> i64
    %491 = llvm.mlir.addressof @str29 : !llvm.ptr
    %492 = arith.constant 39 : i64
    %493 = func.call @cc_make_string(%491, %492) : (!llvm.ptr, i64) -> i64
    %494 = func.call @cc_nil_value() : () -> i64
    %495 = func.call @cc_intern(%493, %494) : (i64, i64) -> i64
    %496 = func.call @cc_nil_value() : () -> i64
    %497 = func.call @cc_cons(%495, %496) : (i64, i64) -> i64
    %498 = func.call @cc_values_pack(%497) : (i64) -> i64
    %499 = func.call @cc_set_symbol_value(%495, %481) : (i64, i64) -> i64
    %500 = llvm.mlir.addressof @str30 : !llvm.ptr
    %501 = arith.constant 40 : i64
    %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
    %503 = func.call @cc_nil_value() : () -> i64
    %504 = func.call @cc_intern(%502, %503) : (i64, i64) -> i64
    %505 = func.call @cc_nil_value() : () -> i64
    %506 = func.call @cc_cons(%504, %505) : (i64, i64) -> i64
    %507 = func.call @cc_values_pack(%506) : (i64) -> i64
    %508 = func.call @cc_set_symbol_value(%504, %481) : (i64, i64) -> i64
    %509 = func.call @cc_nil_value() : () -> i64
    %510 = llvm.mlir.addressof @str31 : !llvm.ptr
    %511 = arith.constant 38 : i64
    %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
    %513 = func.call @cc_nil_value() : () -> i64
    %514 = func.call @cc_intern(%512, %513) : (i64, i64) -> i64
    %515 = func.call @cc_nil_value() : () -> i64
    %516 = func.call @cc_cons(%514, %515) : (i64, i64) -> i64
    %517 = func.call @cc_values_pack(%516) : (i64) -> i64
    %518 = func.call @cc_set_symbol_value(%514, %509) : (i64, i64) -> i64
    %519 = llvm.mlir.addressof @str32 : !llvm.ptr
    %520 = arith.constant 39 : i64
    %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
    %522 = func.call @cc_nil_value() : () -> i64
    %523 = func.call @cc_intern(%521, %522) : (i64, i64) -> i64
    %524 = func.call @cc_nil_value() : () -> i64
    %525 = func.call @cc_cons(%523, %524) : (i64, i64) -> i64
    %526 = func.call @cc_values_pack(%525) : (i64) -> i64
    %527 = func.call @cc_set_symbol_value(%523, %509) : (i64, i64) -> i64
    %528 = llvm.mlir.addressof @str33 : !llvm.ptr
    %529 = arith.constant 40 : i64
    %530 = func.call @cc_make_string(%528, %529) : (!llvm.ptr, i64) -> i64
    %531 = func.call @cc_nil_value() : () -> i64
    %532 = func.call @cc_intern(%530, %531) : (i64, i64) -> i64
    %533 = func.call @cc_nil_value() : () -> i64
    %534 = func.call @cc_cons(%532, %533) : (i64, i64) -> i64
    %535 = func.call @cc_values_pack(%534) : (i64) -> i64
    %536 = func.call @cc_set_symbol_value(%532, %509) : (i64, i64) -> i64
    func.call @stack_push_pointer(%480) : (i64) -> ()
    %537 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%479) : (i64) -> ()
    %538 = func.call @stack_pop_pointer() : () -> i64
    %539 = func.call @cc_nil_value() : () -> i64
    %540 = func.call @cc_errorp(%537) : (i64) -> i64
    %541 = arith.cmpi ne, %540, %539 : i64
    %542 = arith.cmpi eq, %539, %539 : i64
    %543 = arith.andi %541, %542 : i1
    %544 = scf.if %543 -> (i64) {
      scf.yield %537 : i64
    } else {
      scf.yield %539 : i64
    }
    %545 = func.call @cc_errorp(%538) : (i64) -> i64
    %546 = arith.cmpi ne, %545, %539 : i64
    %547 = arith.cmpi eq, %544, %539 : i64
    %548 = arith.andi %546, %547 : i1
    %549 = scf.if %548 -> (i64) {
      scf.yield %538 : i64
    } else {
      scf.yield %544 : i64
    }
    %550 = arith.cmpi ne, %549, %539 : i64
    scf.if %550 {
      func.call @stack_push_pointer(%549) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%537) : (i64) -> ()
      func.call @stack_push_pointer(%538) : (i64) -> ()
      %551 = llvm.mlir.addressof @str34 : !llvm.ptr
      %552 = func.call @cc_make_function_ref_const(%551) : (!llvm.ptr) -> i64
      %553 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%552, %553) : (i64, i64) -> ()
    }
    %554 = func.call @stack_pop_pointer() : () -> i64
    %555 = func.call @cc_multiple_value_list(%554) : (i64) -> i64
    %556 = arith.constant 0 : i64
    %557 = func.call @cc_box_fixnum(%556) : (i64) -> i64
    %558 = func.call @cc_nth(%557, %555) : (i64, i64) -> i64
    %559 = arith.constant 1 : i64
    %560 = func.call @cc_box_fixnum(%559) : (i64) -> i64
    %561 = func.call @cc_nth(%560, %555) : (i64, i64) -> i64
    %562 = arith.constant 10 : i64
    func.call @stack_push_fixnum(%562) : (i64) -> ()
    %563 = func.call @stack_pop_pointer() : () -> i64
    %564 = arith.constant 0 : i64
    func.call @stack_push_fixnum(%564) : (i64) -> ()
    %565 = func.call @stack_pop_pointer() : () -> i64
    %566 = func.call @cc_nil_value() : () -> i64
    %567 = func.call @cc_nil_value() : () -> i64
    %568 = func.call @cc_errorp(%566) : (i64) -> i64
    %569 = arith.cmpi ne, %568, %567 : i64
    %570 = scf.if %569 -> (i64) {
      scf.yield %566 : i64
    } else {
      %571 = func.call @cc_nil_value() : () -> i64
      %572 = llvm.mlir.addressof @str35 : !llvm.ptr
      %573 = arith.constant 38 : i64
      %574 = func.call @cc_make_string(%572, %573) : (!llvm.ptr, i64) -> i64
      %575 = func.call @cc_nil_value() : () -> i64
      %576 = func.call @cc_intern(%574, %575) : (i64, i64) -> i64
      %577 = func.call @cc_nil_value() : () -> i64
      %578 = func.call @cc_cons(%576, %577) : (i64, i64) -> i64
      %579 = func.call @cc_values_pack(%578) : (i64) -> i64
      %580 = func.call @cc_set_symbol_value(%576, %571) : (i64, i64) -> i64
      %581 = llvm.mlir.addressof @str36 : !llvm.ptr
      %582 = arith.constant 39 : i64
      %583 = func.call @cc_make_string(%581, %582) : (!llvm.ptr, i64) -> i64
      %584 = func.call @cc_nil_value() : () -> i64
      %585 = func.call @cc_intern(%583, %584) : (i64, i64) -> i64
      %586 = func.call @cc_nil_value() : () -> i64
      %587 = func.call @cc_cons(%585, %586) : (i64, i64) -> i64
      %588 = func.call @cc_values_pack(%587) : (i64) -> i64
      %589 = func.call @cc_set_symbol_value(%585, %571) : (i64, i64) -> i64
      %590 = llvm.mlir.addressof @str37 : !llvm.ptr
      %591 = arith.constant 40 : i64
      %592 = func.call @cc_make_string(%590, %591) : (!llvm.ptr, i64) -> i64
      %593 = func.call @cc_nil_value() : () -> i64
      %594 = func.call @cc_intern(%592, %593) : (i64, i64) -> i64
      %595 = func.call @cc_nil_value() : () -> i64
      %596 = func.call @cc_cons(%594, %595) : (i64, i64) -> i64
      %597 = func.call @cc_values_pack(%596) : (i64) -> i64
      %598 = func.call @cc_set_symbol_value(%594, %571) : (i64, i64) -> i64
      %599:1 = scf.while (%arg0 = %565) : (i64) -> (i64) {
        func.call @stack_push_pointer(%arg0) : (i64) -> ()
        %600 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%563) : (i64) -> ()
        %601 = func.call @stack_pop_pointer() : () -> i64
        %602 = arith.constant 1 : i1
        %604 = arith.constant 3 : i64
        %603 = arith.andi %600, %604 : i64
        %605 = arith.constant 0 : i64
        %606 = arith.cmpi eq, %603, %605 : i64
        %608 = arith.constant 3 : i64
        %607 = arith.andi %601, %608 : i64
        %609 = arith.constant 0 : i64
        %610 = arith.cmpi eq, %607, %609 : i64
        %611 = arith.andi %606, %610 : i1
        %612 = scf.if %611 -> (i1) {
          %613 = arith.constant 2 : i64
          %614 = arith.shrsi %600, %613 : i64
          %615 = arith.constant 2 : i64
          %616 = arith.shrsi %601, %615 : i64
          %617 = arith.cmpi slt, %614, %616 : i64
          scf.yield %617 : i1
        } else {
          %618 = func.call @cc_lt(%600, %601) : (i64, i64) -> i64
          %619 = func.call @cc_nil_value() : () -> i64
          %620 = arith.cmpi ne, %618, %619 : i64
          scf.yield %620 : i1
        }
        %621 = arith.andi %602, %612 : i1
        %622 = func.call @cc_nil_value() : () -> i64
        %623 = func.call @cc_t_value() : () -> i64
        %624 = scf.if %621 -> (i64) {
          scf.yield %623 : i64
        } else {
          scf.yield %622 : i64
        }
        func.call @stack_push_pointer(%624) : (i64) -> ()
        %625 = func.call @stack_pop_pointer() : () -> i64
        %626 = func.call @cc_nil_value() : () -> i64
        %627 = arith.cmpi ne, %625, %626 : i64
        %628 = func.call @cc_nil_value() : () -> i64
        %629 = llvm.mlir.addressof @str38 : !llvm.ptr
        %630 = arith.constant 38 : i64
        %631 = func.call @cc_make_string(%629, %630) : (!llvm.ptr, i64) -> i64
        %632 = func.call @cc_nil_value() : () -> i64
        %633 = func.call @cc_intern(%631, %632) : (i64, i64) -> i64
        %634 = func.call @cc_nil_value() : () -> i64
        %635 = func.call @cc_cons(%633, %634) : (i64, i64) -> i64
        %636 = func.call @cc_values_pack(%635) : (i64) -> i64
        %637 = func.call @cc_symbol_value(%633) : (i64) -> i64
        %638 = arith.cmpi ne, %637, %628 : i64
        %639 = llvm.mlir.addressof @str39 : !llvm.ptr
        %640 = arith.constant 38 : i64
        %641 = func.call @cc_make_string(%639, %640) : (!llvm.ptr, i64) -> i64
        %642 = func.call @cc_nil_value() : () -> i64
        %643 = func.call @cc_intern(%641, %642) : (i64, i64) -> i64
        %644 = func.call @cc_nil_value() : () -> i64
        %645 = func.call @cc_cons(%643, %644) : (i64, i64) -> i64
        %646 = func.call @cc_values_pack(%645) : (i64) -> i64
        %647 = func.call @cc_symbol_value(%643) : (i64) -> i64
        %648 = arith.cmpi ne, %647, %628 : i64
        %649 = arith.ori %638, %648 : i1
        %650 = llvm.mlir.addressof @str40 : !llvm.ptr
        %651 = arith.constant 38 : i64
        %652 = func.call @cc_make_string(%650, %651) : (!llvm.ptr, i64) -> i64
        %653 = func.call @cc_nil_value() : () -> i64
        %654 = func.call @cc_intern(%652, %653) : (i64, i64) -> i64
        %655 = func.call @cc_nil_value() : () -> i64
        %656 = func.call @cc_cons(%654, %655) : (i64, i64) -> i64
        %657 = func.call @cc_values_pack(%656) : (i64) -> i64
        %658 = func.call @cc_symbol_value(%654) : (i64) -> i64
        %659 = arith.cmpi ne, %658, %628 : i64
        %660 = arith.ori %649, %659 : i1
        %661 = arith.constant 0 : i1
        %662 = arith.cmpi eq, %660, %661 : i1
        %663 = arith.andi %627, %662 : i1
        scf.condition(%663) %arg0 : i64
      } do {
        ^bb0(%664: i64):
        %665 = func.call @cc_nil_value() : () -> i64
        %666 = arith.cmpi ne, %665, %665 : i64
        scf.if %666 {
          func.call @stack_push_pointer(%665) : (i64) -> ()
        } else {
          %667 = llvm.mlir.addressof @str41 : !llvm.ptr
          %668 = func.call @cc_make_function_ref_const(%667) : (!llvm.ptr) -> i64
          %669 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%668, %669) : (i64, i64) -> ()
        }
        %670 = func.call @stack_depth() : () -> i64
        %671 = arith.constant 0 : i64
        %672 = arith.cmpi sgt, %670, %671 : i64
        scf.if %672 {
          %673 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%664) : (i64) -> ()
        %674 = func.call @stack_pop_pointer() : () -> i64
        %675 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%675) : (i64) -> ()
        %676 = func.call @stack_pop_pointer() : () -> i64
        %678 = arith.constant 3 : i64
        %677 = arith.andi %674, %678 : i64
        %679 = arith.constant 0 : i64
        %680 = arith.cmpi eq, %677, %679 : i64
        %682 = arith.constant 3 : i64
        %681 = arith.andi %676, %682 : i64
        %683 = arith.constant 0 : i64
        %684 = arith.cmpi eq, %681, %683 : i64
        %685 = arith.andi %680, %684 : i1
        %686 = scf.if %685 -> (i64) {
          %687 = arith.constant 2 : i64
          %688 = arith.shrsi %674, %687 : i64
          %689 = arith.constant 2 : i64
          %690 = arith.shrsi %676, %689 : i64
          %691 = arith.addi %688, %690 : i64
          %692 = arith.constant -2305843009213693952 : i64
          %693 = arith.constant 2305843009213693951 : i64
          %694 = arith.cmpi sge, %691, %692 : i64
          %695 = arith.cmpi sle, %691, %693 : i64
          %696 = arith.andi %694, %695 : i1
          %697 = scf.if %696 -> (i64) {
            %698 = arith.constant 2 : i64
            %699 = arith.shli %691, %698 : i64
            scf.yield %699 : i64
          } else {
            %700 = func.call @cc_add(%674, %676) : (i64, i64) -> i64
            scf.yield %700 : i64
          }
          scf.yield %697 : i64
        } else {
          %701 = func.call @cc_add(%674, %676) : (i64, i64) -> i64
          scf.yield %701 : i64
        }
        func.call @stack_push_pointer(%686) : (i64) -> ()
        %702 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%702) : (i64) -> ()
        %703 = func.call @stack_depth() : () -> i64
        %704 = arith.constant 0 : i64
        %705 = arith.cmpi sgt, %703, %704 : i64
        scf.if %705 {
          %706 = func.call @stack_pop_pointer() : () -> i64
        }
        scf.yield %702 : i64
      }
      func.call @stack_push_nil() : () -> ()
      %707 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @cc_multiple_value_list(%708) : (i64) -> i64
      %710 = llvm.mlir.addressof @str42 : !llvm.ptr
      %711 = arith.constant 38 : i64
      %712 = func.call @cc_make_string(%710, %711) : (!llvm.ptr, i64) -> i64
      %713 = func.call @cc_nil_value() : () -> i64
      %714 = func.call @cc_intern(%712, %713) : (i64, i64) -> i64
      %715 = func.call @cc_nil_value() : () -> i64
      %716 = func.call @cc_cons(%714, %715) : (i64, i64) -> i64
      %717 = func.call @cc_values_pack(%716) : (i64) -> i64
      %718 = func.call @cc_symbol_value(%714) : (i64) -> i64
      %719 = llvm.mlir.addressof @str43 : !llvm.ptr
      %720 = arith.constant 39 : i64
      %721 = func.call @cc_make_string(%719, %720) : (!llvm.ptr, i64) -> i64
      %722 = func.call @cc_nil_value() : () -> i64
      %723 = func.call @cc_intern(%721, %722) : (i64, i64) -> i64
      %724 = func.call @cc_nil_value() : () -> i64
      %725 = func.call @cc_cons(%723, %724) : (i64, i64) -> i64
      %726 = func.call @cc_values_pack(%725) : (i64) -> i64
      %727 = func.call @cc_symbol_value(%723) : (i64) -> i64
      %728 = llvm.mlir.addressof @str44 : !llvm.ptr
      %729 = arith.constant 40 : i64
      %730 = func.call @cc_make_string(%728, %729) : (!llvm.ptr, i64) -> i64
      %731 = func.call @cc_nil_value() : () -> i64
      %732 = func.call @cc_intern(%730, %731) : (i64, i64) -> i64
      %733 = func.call @cc_nil_value() : () -> i64
      %734 = func.call @cc_cons(%732, %733) : (i64, i64) -> i64
      %735 = func.call @cc_values_pack(%734) : (i64) -> i64
      %736 = func.call @cc_symbol_value(%732) : (i64) -> i64
      %737 = func.call @cc_nil_value() : () -> i64
      %738 = arith.cmpi ne, %718, %737 : i64
      %739 = scf.if %738 -> (i64) {
        scf.yield %736 : i64
      } else {
        scf.yield %709 : i64
      }
      %740 = func.call @cc_values_pack(%739) : (i64) -> i64
      func.call @stack_push_pointer(%740) : (i64) -> ()
      %741 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %741 : i64
    }
    func.call @stack_push_pointer(%570) : (i64) -> ()
    %742 = func.call @stack_depth() : () -> i64
    %743 = arith.constant 0 : i64
    %744 = arith.cmpi sgt, %742, %743 : i64
    scf.if %744 {
      %745 = func.call @stack_pop_pointer() : () -> i64
    }
    %746 = func.call @cc_nil_value() : () -> i64
    %747 = arith.cmpi ne, %746, %746 : i64
    scf.if %747 {
      func.call @stack_push_pointer(%746) : (i64) -> ()
    } else {
      %748 = llvm.mlir.addressof @str45 : !llvm.ptr
      %749 = func.call @cc_make_function_ref_const(%748) : (!llvm.ptr) -> i64
      %750 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%749, %750) : (i64, i64) -> ()
    }
    %751 = func.call @stack_depth() : () -> i64
    %752 = arith.constant 0 : i64
    %753 = arith.cmpi sgt, %751, %752 : i64
    scf.if %753 {
      %754 = func.call @stack_pop_pointer() : () -> i64
    }
    func.call @stack_push_pointer(%561) : (i64) -> ()
    %755 = func.call @stack_pop_pointer() : () -> i64
    %756 = arith.constant 0 : i64
    func.call @cc_funcall_stack(%755, %756) : (i64, i64) -> ()
    %757 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%757) : (i64) -> ()
    %758 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%479) : (i64) -> ()
    %759 = func.call @stack_pop_pointer() : () -> i64
    %760 = func.call @cc_div(%758, %759) : (i64, i64) -> i64
    func.call @stack_push_pointer(%760) : (i64) -> ()
    %761 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%757) : (i64) -> ()
    %762 = func.call @stack_pop_pointer() : () -> i64
    %763 = llvm.mlir.addressof @str46 : !llvm.ptr
    %764 = func.call @cc_make_function_ref_const(%763) : (!llvm.ptr) -> i64
    func.call @stack_push_pointer(%764) : (i64) -> ()
    %765 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%558) : (i64) -> ()
    %766 = func.call @stack_pop_pointer() : () -> i64
    %767 = func.call @cc_nil_value() : () -> i64
    %768 = func.call @cc_errorp(%765) : (i64) -> i64
    %769 = arith.cmpi ne, %768, %767 : i64
    %770 = arith.cmpi eq, %767, %767 : i64
    %771 = arith.andi %769, %770 : i1
    %772 = scf.if %771 -> (i64) {
      scf.yield %765 : i64
    } else {
      scf.yield %767 : i64
    }
    %773 = func.call @cc_errorp(%766) : (i64) -> i64
    %774 = arith.cmpi ne, %773, %767 : i64
    %775 = arith.cmpi eq, %772, %767 : i64
    %776 = arith.andi %774, %775 : i1
    %777 = scf.if %776 -> (i64) {
      scf.yield %766 : i64
    } else {
      scf.yield %772 : i64
    }
    %778 = arith.cmpi ne, %777, %767 : i64
    scf.if %778 {
      func.call @stack_push_pointer(%777) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%765) : (i64) -> ()
      func.call @stack_push_pointer(%766) : (i64) -> ()
      %779 = llvm.mlir.addressof @str47 : !llvm.ptr
      %780 = func.call @cc_make_function_ref_const(%779) : (!llvm.ptr) -> i64
      %781 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%780, %781) : (i64, i64) -> ()
    }
    %782 = func.call @stack_pop_pointer() : () -> i64
    %784 = arith.constant 3 : i64
    %783 = arith.andi %762, %784 : i64
    %785 = arith.constant 0 : i64
    %786 = arith.cmpi eq, %783, %785 : i64
    %788 = arith.constant 3 : i64
    %787 = arith.andi %782, %788 : i64
    %789 = arith.constant 0 : i64
    %790 = arith.cmpi eq, %787, %789 : i64
    %791 = arith.andi %786, %790 : i1
    %792 = scf.if %791 -> (i64) {
      %793 = arith.constant 2 : i64
      %794 = arith.shrsi %762, %793 : i64
      %795 = arith.constant 2 : i64
      %796 = arith.shrsi %782, %795 : i64
      %797 = arith.addi %794, %796 : i64
      %798 = arith.constant -2305843009213693952 : i64
      %799 = arith.constant 2305843009213693951 : i64
      %800 = arith.cmpi sge, %797, %798 : i64
      %801 = arith.cmpi sle, %797, %799 : i64
      %802 = arith.andi %800, %801 : i1
      %803 = scf.if %802 -> (i64) {
        %804 = arith.constant 2 : i64
        %805 = arith.shli %797, %804 : i64
        scf.yield %805 : i64
      } else {
        %806 = func.call @cc_add(%762, %782) : (i64, i64) -> i64
        scf.yield %806 : i64
      }
      scf.yield %803 : i64
    } else {
      %807 = func.call @cc_add(%762, %782) : (i64, i64) -> i64
      scf.yield %807 : i64
    }
    func.call @stack_push_pointer(%792) : (i64) -> ()
    %808 = func.call @stack_pop_pointer() : () -> i64
    %809 = func.call @cc_nil_value() : () -> i64
    %810 = func.call @cc_nil_value() : () -> i64
    %811 = func.call @cc_errorp(%809) : (i64) -> i64
    %812 = arith.cmpi ne, %811, %810 : i64
    %813 = scf.if %812 -> (i64) {
      scf.yield %809 : i64
    } else {
      %814 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%761) : (i64) -> ()
      %815 = func.call @stack_pop_pointer() : () -> i64
      %816 = arith.constant 95 : i64
      func.call @stack_push_fixnum(%816) : (i64) -> ()
      %817 = func.call @stack_pop_pointer() : () -> i64
      %818 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%818) : (i64) -> ()
      %819 = func.call @stack_pop_pointer() : () -> i64
      %820 = func.call @cc_div(%817, %819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = arith.constant 1 : i1
      %824 = arith.constant 3 : i64
      %823 = arith.andi %815, %824 : i64
      %825 = arith.constant 0 : i64
      %826 = arith.cmpi eq, %823, %825 : i64
      %828 = arith.constant 3 : i64
      %827 = arith.andi %821, %828 : i64
      %829 = arith.constant 0 : i64
      %830 = arith.cmpi eq, %827, %829 : i64
      %831 = arith.andi %826, %830 : i1
      %832 = scf.if %831 -> (i1) {
        %833 = arith.constant 2 : i64
        %834 = arith.shrsi %815, %833 : i64
        %835 = arith.constant 2 : i64
        %836 = arith.shrsi %821, %835 : i64
        %837 = arith.cmpi sgt, %834, %836 : i64
        scf.yield %837 : i1
      } else {
        %838 = func.call @cc_gt(%815, %821) : (i64, i64) -> i64
        %839 = func.call @cc_nil_value() : () -> i64
        %840 = arith.cmpi ne, %838, %839 : i64
        scf.yield %840 : i1
      }
      %841 = arith.andi %822, %832 : i1
      %842 = func.call @cc_nil_value() : () -> i64
      %843 = func.call @cc_t_value() : () -> i64
      %844 = scf.if %841 -> (i64) {
        scf.yield %843 : i64
      } else {
        scf.yield %842 : i64
      }
      func.call @stack_push_pointer(%844) : (i64) -> ()
      %845 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%761) : (i64) -> ()
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = func.call @cc_cons(%846, %814) : (i64, i64) -> i64
      %848 = func.call @cc_cons(%845, %847) : (i64, i64) -> i64
      %849 = func.call @cc_or(%848) : (i64) -> i64
      func.call @stack_push_pointer(%849) : (i64) -> ()
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%479) : (i64) -> ()
      %852 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%808) : (i64) -> ()
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = arith.constant 1 : i1
      %856 = arith.constant 3 : i64
      %855 = arith.andi %852, %856 : i64
      %857 = arith.constant 0 : i64
      %858 = arith.cmpi eq, %855, %857 : i64
      %860 = arith.constant 3 : i64
      %859 = arith.andi %853, %860 : i64
      %861 = arith.constant 0 : i64
      %862 = arith.cmpi eq, %859, %861 : i64
      %863 = arith.andi %858, %862 : i1
      %864 = scf.if %863 -> (i1) {
        %865 = arith.constant 2 : i64
        %866 = arith.shrsi %852, %865 : i64
        %867 = arith.constant 2 : i64
        %868 = arith.shrsi %853, %867 : i64
        %869 = arith.cmpi sge, %866, %868 : i64
        scf.yield %869 : i1
      } else {
        %870 = func.call @cc_ge(%852, %853) : (i64, i64) -> i64
        %871 = func.call @cc_nil_value() : () -> i64
        %872 = arith.cmpi ne, %870, %871 : i64
        scf.yield %872 : i1
      }
      %873 = arith.andi %854, %864 : i1
      %874 = func.call @cc_nil_value() : () -> i64
      %875 = func.call @cc_t_value() : () -> i64
      %876 = scf.if %873 -> (i64) {
        scf.yield %875 : i64
      } else {
        scf.yield %874 : i64
      }
      func.call @stack_push_pointer(%876) : (i64) -> ()
      %877 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%808) : (i64) -> ()
      %878 = func.call @stack_pop_pointer() : () -> i64
      %879 = func.call @cc_cons(%878, %851) : (i64, i64) -> i64
      %880 = func.call @cc_cons(%877, %879) : (i64, i64) -> i64
      %881 = func.call @cc_or(%880) : (i64) -> i64
      func.call @stack_push_pointer(%881) : (i64) -> ()
      %882 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %883 = func.call @stack_pop_pointer() : () -> i64
      %884 = func.call @cc_cons(%882, %883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%884) : (i64) -> ()
      %885 = func.call @stack_pop_pointer() : () -> i64
      %886 = func.call @cc_cons(%850, %885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%886) : (i64) -> ()
      %887 = func.call @stack_pop_pointer() : () -> i64
      %888 = func.call @cc_values_pack(%887) : (i64) -> i64
      func.call @stack_push_pointer(%888) : (i64) -> ()
      %889 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %889 : i64
    }
    func.call @stack_push_pointer(%813) : (i64) -> ()
    %890 = func.call @stack_pop_pointer() : () -> i64
    %891 = func.call @cc_multiple_value_list(%890) : (i64) -> i64
    %892 = llvm.mlir.addressof @str48 : !llvm.ptr
    %893 = arith.constant 38 : i64
    %894 = func.call @cc_make_string(%892, %893) : (!llvm.ptr, i64) -> i64
    %895 = func.call @cc_nil_value() : () -> i64
    %896 = func.call @cc_intern(%894, %895) : (i64, i64) -> i64
    %897 = func.call @cc_nil_value() : () -> i64
    %898 = func.call @cc_cons(%896, %897) : (i64, i64) -> i64
    %899 = func.call @cc_values_pack(%898) : (i64) -> i64
    %900 = func.call @cc_symbol_value(%896) : (i64) -> i64
    %901 = llvm.mlir.addressof @str49 : !llvm.ptr
    %902 = arith.constant 39 : i64
    %903 = func.call @cc_make_string(%901, %902) : (!llvm.ptr, i64) -> i64
    %904 = func.call @cc_nil_value() : () -> i64
    %905 = func.call @cc_intern(%903, %904) : (i64, i64) -> i64
    %906 = func.call @cc_nil_value() : () -> i64
    %907 = func.call @cc_cons(%905, %906) : (i64, i64) -> i64
    %908 = func.call @cc_values_pack(%907) : (i64) -> i64
    %909 = func.call @cc_symbol_value(%905) : (i64) -> i64
    %910 = llvm.mlir.addressof @str50 : !llvm.ptr
    %911 = arith.constant 40 : i64
    %912 = func.call @cc_make_string(%910, %911) : (!llvm.ptr, i64) -> i64
    %913 = func.call @cc_nil_value() : () -> i64
    %914 = func.call @cc_intern(%912, %913) : (i64, i64) -> i64
    %915 = func.call @cc_nil_value() : () -> i64
    %916 = func.call @cc_cons(%914, %915) : (i64, i64) -> i64
    %917 = func.call @cc_values_pack(%916) : (i64) -> i64
    %918 = func.call @cc_symbol_value(%914) : (i64) -> i64
    %919 = func.call @cc_nil_value() : () -> i64
    %920 = arith.cmpi ne, %900, %919 : i64
    %921 = scf.if %920 -> (i64) {
      scf.yield %918 : i64
    } else {
      scf.yield %891 : i64
    }
    %922 = func.call @cc_values_pack(%921) : (i64) -> i64
    func.call @stack_push_pointer(%922) : (i64) -> ()
    %923 = func.call @stack_pop_pointer() : () -> i64
    %924 = func.call @cc_multiple_value_list(%923) : (i64) -> i64
    %925 = llvm.mlir.addressof @str51 : !llvm.ptr
    %926 = arith.constant 38 : i64
    %927 = func.call @cc_make_string(%925, %926) : (!llvm.ptr, i64) -> i64
    %928 = func.call @cc_nil_value() : () -> i64
    %929 = func.call @cc_intern(%927, %928) : (i64, i64) -> i64
    %930 = func.call @cc_nil_value() : () -> i64
    %931 = func.call @cc_cons(%929, %930) : (i64, i64) -> i64
    %932 = func.call @cc_values_pack(%931) : (i64) -> i64
    %933 = func.call @cc_symbol_value(%929) : (i64) -> i64
    %934 = llvm.mlir.addressof @str52 : !llvm.ptr
    %935 = arith.constant 40 : i64
    %936 = func.call @cc_make_string(%934, %935) : (!llvm.ptr, i64) -> i64
    %937 = func.call @cc_nil_value() : () -> i64
    %938 = func.call @cc_intern(%936, %937) : (i64, i64) -> i64
    %939 = func.call @cc_nil_value() : () -> i64
    %940 = func.call @cc_cons(%938, %939) : (i64, i64) -> i64
    %941 = func.call @cc_values_pack(%940) : (i64) -> i64
    %942 = func.call @cc_symbol_value(%938) : (i64) -> i64
    %943 = func.call @cc_nil_value() : () -> i64
    %944 = arith.cmpi ne, %933, %943 : i64
    %945 = scf.if %944 -> (i64) {
      scf.yield %942 : i64
    } else {
      scf.yield %924 : i64
    }
    %946 = func.call @cc_values_pack(%945) : (i64) -> i64
    func.call @stack_push_pointer(%946) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %947 = llvm.mlir.addressof @str53 : !llvm.ptr
    %948 = arith.constant 6 : i64
    %949 = func.call @cc_make_string(%947, %948) : (!llvm.ptr, i64) -> i64
    %950 = func.call @cc_nil_value() : () -> i64
    %951 = func.call @cc_intern(%949, %950) : (i64, i64) -> i64
    %952 = func.call @cc_nil_value() : () -> i64
    %953 = func.call @cc_cons(%951, %952) : (i64, i64) -> i64
    %954 = func.call @cc_values_pack(%953) : (i64) -> i64
    %955 = arith.constant 0 : i64
    func.call @cc_runtime_debug_stack_push_call(%951, %955) : (i64, i64) -> ()
    %956 = func.call @cc_nil_value() : () -> i64
    %957 = llvm.mlir.addressof @str54 : !llvm.ptr
    %958 = arith.constant 38 : i64
    %959 = func.call @cc_make_string(%957, %958) : (!llvm.ptr, i64) -> i64
    %960 = func.call @cc_nil_value() : () -> i64
    %961 = func.call @cc_intern(%959, %960) : (i64, i64) -> i64
    %962 = func.call @cc_nil_value() : () -> i64
    %963 = func.call @cc_cons(%961, %962) : (i64, i64) -> i64
    %964 = func.call @cc_values_pack(%963) : (i64) -> i64
    %965 = func.call @cc_set_symbol_value(%961, %956) : (i64, i64) -> i64
    %966 = llvm.mlir.addressof @str55 : !llvm.ptr
    %967 = arith.constant 39 : i64
    %968 = func.call @cc_make_string(%966, %967) : (!llvm.ptr, i64) -> i64
    %969 = func.call @cc_nil_value() : () -> i64
    %970 = func.call @cc_intern(%968, %969) : (i64, i64) -> i64
    %971 = func.call @cc_nil_value() : () -> i64
    %972 = func.call @cc_cons(%970, %971) : (i64, i64) -> i64
    %973 = func.call @cc_values_pack(%972) : (i64) -> i64
    %974 = func.call @cc_set_symbol_value(%970, %956) : (i64, i64) -> i64
    %975 = llvm.mlir.addressof @str56 : !llvm.ptr
    %976 = arith.constant 40 : i64
    %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
    %978 = func.call @cc_nil_value() : () -> i64
    %979 = func.call @cc_intern(%977, %978) : (i64, i64) -> i64
    %980 = func.call @cc_nil_value() : () -> i64
    %981 = func.call @cc_cons(%979, %980) : (i64, i64) -> i64
    %982 = func.call @cc_values_pack(%981) : (i64) -> i64
    %983 = func.call @cc_set_symbol_value(%979, %956) : (i64, i64) -> i64
    %984 = func.call @cc_nil_value() : () -> i64
    %985 = func.call @cc_nil_value() : () -> i64
    %986 = func.call @cc_errorp(%984) : (i64) -> i64
    %987 = arith.cmpi ne, %986, %985 : i64
    %988 = scf.if %987 -> (i64) {
      scf.yield %984 : i64
    } else {
      %989 = func.call @cc_nil_value() : () -> i64
      %990 = func.call @cc_nil_value() : () -> i64
      %991 = func.call @cc_errorp(%989) : (i64) -> i64
      %992 = arith.cmpi ne, %991, %990 : i64
      %993 = scf.if %992 -> (i64) {
        scf.yield %989 : i64
      } else {
        %994 = llvm.mlir.addressof @str57 : !llvm.ptr
        %995 = arith.constant 13 : i64
        %996 = func.call @cc_make_string(%994, %995) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%996) : (i64) -> ()
        %997 = func.call @stack_pop_pointer() : () -> i64
        %998 = func.call @cc_nil_value() : () -> i64
        %999 = func.call @cc_errorp(%997) : (i64) -> i64
        %1000 = arith.cmpi ne, %999, %998 : i64
        %1001 = arith.cmpi eq, %998, %998 : i64
        %1002 = arith.andi %1000, %1001 : i1
        %1003 = scf.if %1002 -> (i64) {
          scf.yield %997 : i64
        } else {
          scf.yield %998 : i64
        }
        %1004 = arith.cmpi ne, %1003, %998 : i64
        scf.if %1004 {
          func.call @stack_push_pointer(%1003) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%997) : (i64) -> ()
          %1005 = llvm.mlir.addressof @str58 : !llvm.ptr
          %1006 = func.call @cc_make_function_ref_const(%1005) : (!llvm.ptr) -> i64
          %1007 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1006, %1007) : (i64, i64) -> ()
        }
        %1008 = func.call @stack_pop_pointer() : () -> i64
        %1009 = func.call @cc_nil_value() : () -> i64
        %1010 = arith.cmpi ne, %1008, %1009 : i64
        scf.if %1010 {
          %1011 = llvm.mlir.addressof @str59 : !llvm.ptr
          %1012 = arith.constant 13 : i64
          %1013 = func.call @cc_make_string(%1011, %1012) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%1013) : (i64) -> ()
          %1014 = func.call @stack_pop_pointer() : () -> i64
          %1015 = func.call @cc_nil_value() : () -> i64
          %1016 = func.call @cc_errorp(%1014) : (i64) -> i64
          %1017 = arith.cmpi ne, %1016, %1015 : i64
          %1018 = arith.cmpi eq, %1015, %1015 : i64
          %1019 = arith.andi %1017, %1018 : i1
          %1020 = scf.if %1019 -> (i64) {
            scf.yield %1014 : i64
          } else {
            scf.yield %1015 : i64
          }
          %1021 = arith.cmpi ne, %1020, %1015 : i64
          scf.if %1021 {
            func.call @stack_push_pointer(%1020) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1014) : (i64) -> ()
            %1022 = llvm.mlir.addressof @str60 : !llvm.ptr
            %1023 = func.call @cc_make_function_ref_const(%1022) : (!llvm.ptr) -> i64
            %1024 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1023, %1024) : (i64, i64) -> ()
          }
        } else {
          %1025 = llvm.mlir.addressof @str61 : !llvm.ptr
          %1026 = arith.constant 13 : i64
          %1027 = func.call @cc_make_string(%1025, %1026) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%1027) : (i64) -> ()
          %1028 = func.call @stack_pop_pointer() : () -> i64
          %1029 = func.call @cc_nil_value() : () -> i64
          %1030 = func.call @cc_errorp(%1028) : (i64) -> i64
          %1031 = arith.cmpi ne, %1030, %1029 : i64
          %1032 = arith.cmpi eq, %1029, %1029 : i64
          %1033 = arith.andi %1031, %1032 : i1
          %1034 = scf.if %1033 -> (i64) {
            scf.yield %1028 : i64
          } else {
            scf.yield %1029 : i64
          }
          %1035 = arith.cmpi ne, %1034, %1029 : i64
          scf.if %1035 {
            func.call @stack_push_pointer(%1034) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1028) : (i64) -> ()
            %1036 = llvm.mlir.addressof @str62 : !llvm.ptr
            %1037 = func.call @cc_make_function_ref_const(%1036) : (!llvm.ptr) -> i64
            %1038 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1037, %1038) : (i64, i64) -> ()
          }
        }
        %1039 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1039 : i64
      }
      %1040 = func.call @cc_nil_value() : () -> i64
      %1041 = func.call @cc_errorp(%993) : (i64) -> i64
      %1042 = arith.cmpi ne, %1041, %1040 : i64
      %1043 = scf.if %1042 -> (i64) {
        scf.yield %993 : i64
      } else {
        %1044 = llvm.mlir.addressof @str63 : !llvm.ptr
        %1045 = arith.constant 2 : i64
        %1046 = func.call @cc_make_string(%1044, %1045) : (!llvm.ptr, i64) -> i64
        %1047 = llvm.mlir.addressof @str64 : !llvm.ptr
        %1048 = arith.constant 7 : i64
        %1049 = func.call @cc_make_string(%1047, %1048) : (!llvm.ptr, i64) -> i64
        %1050 = func.call @cc_intern(%1046, %1049) : (i64, i64) -> i64
        %1051 = func.call @cc_nil_value() : () -> i64
        %1052 = func.call @cc_cons(%1050, %1051) : (i64, i64) -> i64
        %1053 = func.call @cc_values_pack(%1052) : (i64) -> i64
        func.call @stack_push_pointer(%1050) : (i64) -> ()
        %1054 = func.call @stack_pop_pointer() : () -> i64
        %1055 = llvm.mlir.addressof @str65 : !llvm.ptr
        %1056 = arith.constant 13 : i64
        %1057 = func.call @cc_make_string(%1055, %1056) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1057) : (i64) -> ()
        %1058 = func.call @stack_pop_pointer() : () -> i64
        %1059 = func.call @cc_nil_value() : () -> i64
        %1060 = func.call @cc_errorp(%1054) : (i64) -> i64
        %1061 = arith.cmpi ne, %1060, %1059 : i64
        %1062 = arith.cmpi eq, %1059, %1059 : i64
        %1063 = arith.andi %1061, %1062 : i1
        %1064 = scf.if %1063 -> (i64) {
          scf.yield %1054 : i64
        } else {
          scf.yield %1059 : i64
        }
        %1065 = func.call @cc_errorp(%1058) : (i64) -> i64
        %1066 = arith.cmpi ne, %1065, %1059 : i64
        %1067 = arith.cmpi eq, %1064, %1059 : i64
        %1068 = arith.andi %1066, %1067 : i1
        %1069 = scf.if %1068 -> (i64) {
          scf.yield %1058 : i64
        } else {
          scf.yield %1064 : i64
        }
        %1070 = arith.cmpi ne, %1069, %1059 : i64
        scf.if %1070 {
          func.call @stack_push_pointer(%1069) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1054) : (i64) -> ()
          func.call @stack_push_pointer(%1058) : (i64) -> ()
          %1071 = llvm.mlir.addressof @str66 : !llvm.ptr
          %1072 = func.call @cc_make_function_ref_const(%1071) : (!llvm.ptr) -> i64
          %1073 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1072, %1073) : (i64, i64) -> ()
        }
        %1074 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1074 : i64
      }
      %1075 = func.call @cc_nil_value() : () -> i64
      %1076 = func.call @cc_errorp(%1043) : (i64) -> i64
      %1077 = arith.cmpi ne, %1076, %1075 : i64
      %1078 = scf.if %1077 -> (i64) {
        scf.yield %1043 : i64
      } else {
        %1079 = llvm.mlir.addressof @str67 : !llvm.ptr
        %1080 = arith.constant 11 : i64
        %1081 = func.call @cc_make_string(%1079, %1080) : (!llvm.ptr, i64) -> i64
        %1082 = llvm.mlir.addressof @str68 : !llvm.ptr
        %1083 = arith.constant 7 : i64
        %1084 = func.call @cc_make_string(%1082, %1083) : (!llvm.ptr, i64) -> i64
        %1085 = func.call @cc_intern(%1081, %1084) : (i64, i64) -> i64
        %1086 = func.call @cc_nil_value() : () -> i64
        %1087 = func.call @cc_cons(%1085, %1086) : (i64, i64) -> i64
        %1088 = func.call @cc_values_pack(%1087) : (i64) -> i64
        func.call @stack_push_pointer(%1085) : (i64) -> ()
        %1089 = func.call @stack_pop_pointer() : () -> i64
        %1090 = llvm.mlir.addressof @str69 : !llvm.ptr
        %1091 = arith.constant 13 : i64
        %1092 = func.call @cc_make_string(%1090, %1091) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1092) : (i64) -> ()
        %1093 = func.call @stack_pop_pointer() : () -> i64
        %1094 = func.call @cc_nil_value() : () -> i64
        %1095 = func.call @cc_errorp(%1089) : (i64) -> i64
        %1096 = arith.cmpi ne, %1095, %1094 : i64
        %1097 = arith.cmpi eq, %1094, %1094 : i64
        %1098 = arith.andi %1096, %1097 : i1
        %1099 = scf.if %1098 -> (i64) {
          scf.yield %1089 : i64
        } else {
          scf.yield %1094 : i64
        }
        %1100 = func.call @cc_errorp(%1093) : (i64) -> i64
        %1101 = arith.cmpi ne, %1100, %1094 : i64
        %1102 = arith.cmpi eq, %1099, %1094 : i64
        %1103 = arith.andi %1101, %1102 : i1
        %1104 = scf.if %1103 -> (i64) {
          scf.yield %1093 : i64
        } else {
          scf.yield %1099 : i64
        }
        %1105 = arith.cmpi ne, %1104, %1094 : i64
        scf.if %1105 {
          func.call @stack_push_pointer(%1104) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1089) : (i64) -> ()
          func.call @stack_push_pointer(%1093) : (i64) -> ()
          %1106 = llvm.mlir.addressof @str70 : !llvm.ptr
          %1107 = func.call @cc_make_function_ref_const(%1106) : (!llvm.ptr) -> i64
          %1108 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1107, %1108) : (i64, i64) -> ()
        }
        %1109 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1109 : i64
      }
      %1110 = func.call @cc_nil_value() : () -> i64
      %1111 = func.call @cc_errorp(%1078) : (i64) -> i64
      %1112 = arith.cmpi ne, %1111, %1110 : i64
      %1113 = scf.if %1112 -> (i64) {
        scf.yield %1078 : i64
      } else {
        %1114 = llvm.mlir.addressof @str71 : !llvm.ptr
        %1115 = arith.constant 13 : i64
        %1116 = func.call @cc_make_string(%1114, %1115) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1116) : (i64) -> ()
        %1117 = func.call @stack_pop_pointer() : () -> i64
        %1118 = func.call @cc_nil_value() : () -> i64
        %1119 = func.call @cc_errorp(%1117) : (i64) -> i64
        %1120 = arith.cmpi ne, %1119, %1118 : i64
        %1121 = arith.cmpi eq, %1118, %1118 : i64
        %1122 = arith.andi %1120, %1121 : i1
        %1123 = scf.if %1122 -> (i64) {
          scf.yield %1117 : i64
        } else {
          scf.yield %1118 : i64
        }
        %1124 = arith.cmpi ne, %1123, %1118 : i64
        scf.if %1124 {
          func.call @stack_push_pointer(%1123) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1117) : (i64) -> ()
          %1125 = llvm.mlir.addressof @str72 : !llvm.ptr
          %1126 = func.call @cc_make_function_ref_const(%1125) : (!llvm.ptr) -> i64
          %1127 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1126, %1127) : (i64, i64) -> ()
        }
        %1128 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1128 : i64
      }
      func.call @stack_push_pointer(%1113) : (i64) -> ()
      %1129 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1129 : i64
    }
    %1130 = func.call @cc_nil_value() : () -> i64
    %1131 = func.call @cc_errorp(%988) : (i64) -> i64
    %1132 = arith.cmpi ne, %1131, %1130 : i64
    %1133 = scf.if %1132 -> (i64) {
      scf.yield %988 : i64
    } else {
      %1134 = llvm.mlir.addressof @str73 : !llvm.ptr
      %1135 = arith.constant 3 : i64
      %1136 = func.call @cc_make_string(%1134, %1135) : (!llvm.ptr, i64) -> i64
      %1137 = func.call @cc_nil_value() : () -> i64
      %1138 = func.call @cc_intern(%1136, %1137) : (i64, i64) -> i64
      %1139 = func.call @cc_nil_value() : () -> i64
      %1140 = func.call @cc_cons(%1138, %1139) : (i64, i64) -> i64
      %1141 = func.call @cc_values_pack(%1140) : (i64) -> i64
      func.call @stack_push_pointer(%1138) : (i64) -> ()
      %1142 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1142 : i64
    }
    %1143 = func.call @cc_nil_value() : () -> i64
    %1144 = func.call @cc_errorp(%1133) : (i64) -> i64
    %1145 = arith.cmpi ne, %1144, %1143 : i64
    %1146 = scf.if %1145 -> (i64) {
      scf.yield %1133 : i64
    } else {
      %1147 = llvm.mlir.addressof @str74 : !llvm.ptr
      %1148 = arith.constant 7 : i64
      %1149 = func.call @cc_make_string(%1147, %1148) : (!llvm.ptr, i64) -> i64
      %1150 = func.call @cc_nil_value() : () -> i64
      %1151 = func.call @cc_intern(%1149, %1150) : (i64, i64) -> i64
      %1152 = func.call @cc_nil_value() : () -> i64
      %1153 = func.call @cc_cons(%1151, %1152) : (i64, i64) -> i64
      %1154 = func.call @cc_values_pack(%1153) : (i64) -> i64
      %1155 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1155) : (i64) -> ()
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = func.call @cc_set_symbol_value(%1151, %1156) : (i64, i64) -> i64
      %1158 = func.call @cc_errorp(%1157) : (i64) -> i64
      %1159 = func.call @cc_nil_value() : () -> i64
      %1160 = arith.cmpi ne, %1158, %1159 : i64
      scf.if %1160 {
        func.call @stack_push_pointer(%1157) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1151) : (i64) -> ()
      }
      %1161 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1161 : i64
    }
    %1162 = func.call @cc_nil_value() : () -> i64
    %1163 = func.call @cc_errorp(%1146) : (i64) -> i64
    %1164 = arith.cmpi ne, %1163, %1162 : i64
    %1165 = scf.if %1164 -> (i64) {
      scf.yield %1146 : i64
    } else {
      %1166 = llvm.mlir.addressof @str75 : !llvm.ptr
      %1167 = func.call @cc_make_function_ref_const(%1166) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1167) : (i64) -> ()
      %1168 = func.call @stack_pop_pointer() : () -> i64
      %1169 = llvm.mlir.addressof @str76 : !llvm.ptr
      %1170 = arith.constant 17 : i64
      %1171 = func.call @cc_make_string(%1169, %1170) : (!llvm.ptr, i64) -> i64
      %1172 = llvm.mlir.addressof @str77 : !llvm.ptr
      %1173 = arith.constant 15 : i64
      %1174 = func.call @cc_make_string(%1172, %1173) : (!llvm.ptr, i64) -> i64
      %1175 = func.call @cc_intern(%1171, %1174) : (i64, i64) -> i64
      %1176 = func.call @cc_nil_value() : () -> i64
      %1177 = func.call @cc_cons(%1175, %1176) : (i64, i64) -> i64
      %1178 = func.call @cc_values_pack(%1177) : (i64) -> i64
      %1179 = func.call @cc_set_symbol_value(%1175, %1168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1168) : (i64) -> ()
      %1180 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1180 : i64
    }
    %1181 = func.call @cc_nil_value() : () -> i64
    %1182 = func.call @cc_errorp(%1165) : (i64) -> i64
    %1183 = arith.cmpi ne, %1182, %1181 : i64
    %1184 = scf.if %1183 -> (i64) {
      scf.yield %1165 : i64
    } else {
      %1185 = llvm.mlir.addressof @str78 : !llvm.ptr
      %1186 = func.call @cc_make_function_ref_const(%1185) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1186) : (i64) -> ()
      %1187 = func.call @stack_pop_pointer() : () -> i64
      %1188 = llvm.mlir.addressof @str79 : !llvm.ptr
      %1189 = arith.constant 17 : i64
      %1190 = func.call @cc_make_string(%1188, %1189) : (!llvm.ptr, i64) -> i64
      %1191 = llvm.mlir.addressof @str80 : !llvm.ptr
      %1192 = arith.constant 15 : i64
      %1193 = func.call @cc_make_string(%1191, %1192) : (!llvm.ptr, i64) -> i64
      %1194 = func.call @cc_intern(%1190, %1193) : (i64, i64) -> i64
      %1195 = func.call @cc_nil_value() : () -> i64
      %1196 = func.call @cc_cons(%1194, %1195) : (i64, i64) -> i64
      %1197 = func.call @cc_values_pack(%1196) : (i64) -> i64
      %1198 = func.call @cc_set_symbol_value(%1194, %1187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1187) : (i64) -> ()
      %1199 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1199 : i64
    }
    %1200 = func.call @cc_nil_value() : () -> i64
    %1201 = func.call @cc_errorp(%1184) : (i64) -> i64
    %1202 = arith.cmpi ne, %1201, %1200 : i64
    %1203 = scf.if %1202 -> (i64) {
      scf.yield %1184 : i64
    } else {
      %1204 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1205 = func.call @cc_make_function_ref_const(%1204) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1205) : (i64) -> ()
      %1206 = func.call @stack_pop_pointer() : () -> i64
      %1207 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1208 = arith.constant 17 : i64
      %1209 = func.call @cc_make_string(%1207, %1208) : (!llvm.ptr, i64) -> i64
      %1210 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1211 = arith.constant 15 : i64
      %1212 = func.call @cc_make_string(%1210, %1211) : (!llvm.ptr, i64) -> i64
      %1213 = func.call @cc_intern(%1209, %1212) : (i64, i64) -> i64
      %1214 = func.call @cc_nil_value() : () -> i64
      %1215 = func.call @cc_cons(%1213, %1214) : (i64, i64) -> i64
      %1216 = func.call @cc_values_pack(%1215) : (i64) -> i64
      %1217 = func.call @cc_set_symbol_value(%1213, %1206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1206) : (i64) -> ()
      %1218 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1218 : i64
    }
    %1219 = func.call @cc_nil_value() : () -> i64
    %1220 = func.call @cc_errorp(%1203) : (i64) -> i64
    %1221 = arith.cmpi ne, %1220, %1219 : i64
    %1222 = scf.if %1221 -> (i64) {
      scf.yield %1203 : i64
    } else {
      %1223 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1224 = func.call @cc_make_function_ref_const(%1223) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1224) : (i64) -> ()
      %1225 = func.call @stack_pop_pointer() : () -> i64
      %1226 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1227 = arith.constant 17 : i64
      %1228 = func.call @cc_make_string(%1226, %1227) : (!llvm.ptr, i64) -> i64
      %1229 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1230 = arith.constant 15 : i64
      %1231 = func.call @cc_make_string(%1229, %1230) : (!llvm.ptr, i64) -> i64
      %1232 = func.call @cc_intern(%1228, %1231) : (i64, i64) -> i64
      %1233 = func.call @cc_nil_value() : () -> i64
      %1234 = func.call @cc_cons(%1232, %1233) : (i64, i64) -> i64
      %1235 = func.call @cc_values_pack(%1234) : (i64) -> i64
      %1236 = func.call @cc_set_symbol_value(%1232, %1225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1225) : (i64) -> ()
      %1237 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1237 : i64
    }
    %1238 = func.call @cc_nil_value() : () -> i64
    %1239 = func.call @cc_errorp(%1222) : (i64) -> i64
    %1240 = arith.cmpi ne, %1239, %1238 : i64
    %1241 = scf.if %1240 -> (i64) {
      scf.yield %1222 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1242 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1242 : i64
    }
    %1243 = func.call @cc_nil_value() : () -> i64
    %1244 = func.call @cc_errorp(%1241) : (i64) -> i64
    %1245 = arith.cmpi ne, %1244, %1243 : i64
    %1246 = scf.if %1245 -> (i64) {
      scf.yield %1241 : i64
    } else {
      %1247 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1248 = func.call @cc_make_function_ref_const(%1247) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1248) : (i64) -> ()
      %1249 = func.call @stack_pop_pointer() : () -> i64
      %1250 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1251 = arith.constant 15 : i64
      %1252 = func.call @cc_make_string(%1250, %1251) : (!llvm.ptr, i64) -> i64
      %1253 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1254 = arith.constant 15 : i64
      %1255 = func.call @cc_make_string(%1253, %1254) : (!llvm.ptr, i64) -> i64
      %1256 = func.call @cc_intern(%1252, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_nil_value() : () -> i64
      %1258 = func.call @cc_cons(%1256, %1257) : (i64, i64) -> i64
      %1259 = func.call @cc_values_pack(%1258) : (i64) -> i64
      %1260 = func.call @cc_set_symbol_value(%1256, %1249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1249) : (i64) -> ()
      %1261 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1261 : i64
    }
    %1262 = func.call @cc_nil_value() : () -> i64
    %1263 = func.call @cc_errorp(%1246) : (i64) -> i64
    %1264 = arith.cmpi ne, %1263, %1262 : i64
    %1265 = scf.if %1264 -> (i64) {
      scf.yield %1246 : i64
    } else {
      %1266 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1267 = func.call @cc_make_function_ref_const(%1266) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1267) : (i64) -> ()
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1270 = arith.constant 15 : i64
      %1271 = func.call @cc_make_string(%1269, %1270) : (!llvm.ptr, i64) -> i64
      %1272 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1273 = arith.constant 15 : i64
      %1274 = func.call @cc_make_string(%1272, %1273) : (!llvm.ptr, i64) -> i64
      %1275 = func.call @cc_intern(%1271, %1274) : (i64, i64) -> i64
      %1276 = func.call @cc_nil_value() : () -> i64
      %1277 = func.call @cc_cons(%1275, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_values_pack(%1277) : (i64) -> i64
      %1279 = func.call @cc_set_symbol_value(%1275, %1268) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1268) : (i64) -> ()
      %1280 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1280 : i64
    }
    %1281 = func.call @cc_nil_value() : () -> i64
    %1282 = func.call @cc_errorp(%1265) : (i64) -> i64
    %1283 = arith.cmpi ne, %1282, %1281 : i64
    %1284 = scf.if %1283 -> (i64) {
      scf.yield %1265 : i64
    } else {
      %1285 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1286 = func.call @cc_make_function_ref_const(%1285) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1286) : (i64) -> ()
      %1287 = func.call @stack_pop_pointer() : () -> i64
      %1288 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1289 = arith.constant 15 : i64
      %1290 = func.call @cc_make_string(%1288, %1289) : (!llvm.ptr, i64) -> i64
      %1291 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1292 = arith.constant 15 : i64
      %1293 = func.call @cc_make_string(%1291, %1292) : (!llvm.ptr, i64) -> i64
      %1294 = func.call @cc_intern(%1290, %1293) : (i64, i64) -> i64
      %1295 = func.call @cc_nil_value() : () -> i64
      %1296 = func.call @cc_cons(%1294, %1295) : (i64, i64) -> i64
      %1297 = func.call @cc_values_pack(%1296) : (i64) -> i64
      %1298 = func.call @cc_set_symbol_value(%1294, %1287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1287) : (i64) -> ()
      %1299 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1299 : i64
    }
    %1300 = func.call @cc_nil_value() : () -> i64
    %1301 = func.call @cc_errorp(%1284) : (i64) -> i64
    %1302 = arith.cmpi ne, %1301, %1300 : i64
    %1303 = scf.if %1302 -> (i64) {
      scf.yield %1284 : i64
    } else {
      %1304 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1305 = func.call @cc_make_function_ref_const(%1304) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1305) : (i64) -> ()
      %1306 = func.call @stack_pop_pointer() : () -> i64
      %1307 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1308 = arith.constant 15 : i64
      %1309 = func.call @cc_make_string(%1307, %1308) : (!llvm.ptr, i64) -> i64
      %1310 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1311 = arith.constant 15 : i64
      %1312 = func.call @cc_make_string(%1310, %1311) : (!llvm.ptr, i64) -> i64
      %1313 = func.call @cc_intern(%1309, %1312) : (i64, i64) -> i64
      %1314 = func.call @cc_nil_value() : () -> i64
      %1315 = func.call @cc_cons(%1313, %1314) : (i64, i64) -> i64
      %1316 = func.call @cc_values_pack(%1315) : (i64) -> i64
      %1317 = func.call @cc_set_symbol_value(%1313, %1306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1306) : (i64) -> ()
      %1318 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1318 : i64
    }
    %1319 = func.call @cc_nil_value() : () -> i64
    %1320 = func.call @cc_errorp(%1303) : (i64) -> i64
    %1321 = arith.cmpi ne, %1320, %1319 : i64
    %1322 = scf.if %1321 -> (i64) {
      scf.yield %1303 : i64
    } else {
      %1323 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1324 = arith.constant 15 : i64
      %1325 = func.call @cc_make_string(%1323, %1324) : (!llvm.ptr, i64) -> i64
      %1326 = func.call @cc_nil_value() : () -> i64
      %1327 = func.call @cc_intern(%1325, %1326) : (i64, i64) -> i64
      %1328 = func.call @cc_nil_value() : () -> i64
      %1329 = func.call @cc_cons(%1327, %1328) : (i64, i64) -> i64
      %1330 = func.call @cc_values_pack(%1329) : (i64) -> i64
      func.call @stack_push_pointer(%1327) : (i64) -> ()
      %1331 = func.call @stack_pop_pointer() : () -> i64
      %1332 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1333 = arith.constant 15 : i64
      %1334 = func.call @cc_make_string(%1332, %1333) : (!llvm.ptr, i64) -> i64
      %1335 = func.call @cc_nil_value() : () -> i64
      %1336 = func.call @cc_intern(%1334, %1335) : (i64, i64) -> i64
      %1337 = func.call @cc_nil_value() : () -> i64
      %1338 = func.call @cc_cons(%1336, %1337) : (i64, i64) -> i64
      %1339 = func.call @cc_values_pack(%1338) : (i64) -> i64
      func.call @stack_push_pointer(%1336) : (i64) -> ()
      %1340 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1341 = arith.constant 6 : i64
      %1342 = func.call @cc_make_string(%1340, %1341) : (!llvm.ptr, i64) -> i64
      %1343 = func.call @cc_nil_value() : () -> i64
      %1344 = func.call @cc_intern(%1342, %1343) : (i64, i64) -> i64
      %1345 = func.call @cc_nil_value() : () -> i64
      %1346 = func.call @cc_cons(%1344, %1345) : (i64, i64) -> i64
      %1347 = func.call @cc_values_pack(%1346) : (i64) -> i64
      func.call @stack_push_pointer(%1344) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1348 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1349 = arith.constant 9 : i64
      %1350 = func.call @cc_make_string(%1348, %1349) : (!llvm.ptr, i64) -> i64
      %1351 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1352 = arith.constant 11 : i64
      %1353 = func.call @cc_make_string(%1351, %1352) : (!llvm.ptr, i64) -> i64
      %1354 = func.call @cc_intern(%1350, %1353) : (i64, i64) -> i64
      %1355 = func.call @cc_nil_value() : () -> i64
      %1356 = func.call @cc_cons(%1354, %1355) : (i64, i64) -> i64
      %1357 = func.call @cc_values_pack(%1356) : (i64) -> i64
      func.call @stack_push_pointer(%1354) : (i64) -> ()
      %1358 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1358) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1359 = func.call @stack_pop_pointer() : () -> i64
      %1360 = func.call @stack_pop_pointer() : () -> i64
      %1361 = func.call @cc_cons(%1360, %1359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1361) : (i64) -> ()
      %1362 = func.call @stack_pop_pointer() : () -> i64
      %1363 = func.call @stack_pop_pointer() : () -> i64
      %1364 = func.call @cc_cons(%1363, %1362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1364) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1365 = func.call @stack_pop_pointer() : () -> i64
      %1366 = func.call @stack_pop_pointer() : () -> i64
      %1367 = func.call @cc_cons(%1366, %1365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1367) : (i64) -> ()
      %1368 = func.call @stack_pop_pointer() : () -> i64
      %1369 = func.call @stack_pop_pointer() : () -> i64
      %1370 = func.call @cc_cons(%1369, %1368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1370) : (i64) -> ()
      %1371 = func.call @stack_pop_pointer() : () -> i64
      %1372 = func.call @stack_pop_pointer() : () -> i64
      %1373 = func.call @cc_cons(%1372, %1371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1373) : (i64) -> ()
      %1374 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%1374) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1375 = func.call @stack_pop_pointer() : () -> i64
      %1376 = func.call @stack_pop_pointer() : () -> i64
      %1377 = func.call @cc_cons(%1376, %1375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1377) : (i64) -> ()
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = func.call @stack_pop_pointer() : () -> i64
      %1380 = func.call @cc_cons(%1379, %1378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1380) : (i64) -> ()
      %1381 = func.call @stack_pop_pointer() : () -> i64
      %1382 = func.call @stack_pop_pointer() : () -> i64
      %1383 = func.call @cc_cons(%1382, %1381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1383) : (i64) -> ()
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1423 = arith.constant 236837129945099 : i64
      %1424 = arith.constant 0 : i64
      %1425 = func.call @cc_make_closure(%1423, %1424) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1425) : (i64) -> ()
      %1426 = func.call @stack_pop_pointer() : () -> i64
      %1427 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1427) : (i64) -> ()
      %1428 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1428) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1429 = func.call @stack_pop_pointer() : () -> i64
      %1430 = func.call @stack_pop_pointer() : () -> i64
      %1431 = func.call @cc_cons(%1430, %1429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1431) : (i64) -> ()
      %1432 = func.call @stack_pop_pointer() : () -> i64
      %1433 = func.call @stack_pop_pointer() : () -> i64
      %1434 = func.call @cc_cons(%1433, %1432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1434) : (i64) -> ()
      %1435 = func.call @stack_pop_pointer() : () -> i64
      %1436 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1437 = arith.constant 11 : i64
      %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
      %1439 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1440 = arith.constant 7 : i64
      %1441 = func.call @cc_make_string(%1439, %1440) : (!llvm.ptr, i64) -> i64
      %1442 = func.call @cc_intern(%1438, %1441) : (i64, i64) -> i64
      %1443 = func.call @cc_nil_value() : () -> i64
      %1444 = func.call @cc_cons(%1442, %1443) : (i64, i64) -> i64
      %1445 = func.call @cc_values_pack(%1444) : (i64) -> i64
      func.call @stack_push_pointer(%1442) : (i64) -> ()
      %1446 = func.call @stack_pop_pointer() : () -> i64
      %1447 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1448 = arith.constant 46 : i64
      %1449 = func.call @cc_make_string(%1447, %1448) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1449) : (i64) -> ()
      %1450 = func.call @stack_pop_pointer() : () -> i64
      %1451 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1452 = arith.constant 4 : i64
      %1453 = func.call @cc_make_string(%1451, %1452) : (!llvm.ptr, i64) -> i64
      %1454 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1455 = arith.constant 7 : i64
      %1456 = func.call @cc_make_string(%1454, %1455) : (!llvm.ptr, i64) -> i64
      %1457 = func.call @cc_intern(%1453, %1456) : (i64, i64) -> i64
      %1458 = func.call @cc_nil_value() : () -> i64
      %1459 = func.call @cc_cons(%1457, %1458) : (i64, i64) -> i64
      %1460 = func.call @cc_values_pack(%1459) : (i64) -> i64
      func.call @stack_push_pointer(%1457) : (i64) -> ()
      %1461 = func.call @stack_pop_pointer() : () -> i64
      %1462 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1463 = arith.constant 6 : i64
      %1464 = func.call @cc_make_string(%1462, %1463) : (!llvm.ptr, i64) -> i64
      %1465 = func.call @cc_nil_value() : () -> i64
      %1466 = func.call @cc_intern(%1464, %1465) : (i64, i64) -> i64
      %1467 = func.call @cc_nil_value() : () -> i64
      %1468 = func.call @cc_cons(%1466, %1467) : (i64, i64) -> i64
      %1469 = func.call @cc_values_pack(%1468) : (i64) -> i64
      func.call @stack_push_pointer(%1466) : (i64) -> ()
      %1470 = func.call @stack_pop_pointer() : () -> i64
      %1471 = func.call @cc_nil_value() : () -> i64
      %1472 = func.call @cc_errorp(%1331) : (i64) -> i64
      %1473 = arith.cmpi ne, %1472, %1471 : i64
      %1474 = arith.cmpi eq, %1471, %1471 : i64
      %1475 = arith.andi %1473, %1474 : i1
      %1476 = scf.if %1475 -> (i64) {
        scf.yield %1331 : i64
      } else {
        scf.yield %1471 : i64
      }
      %1477 = func.call @cc_errorp(%1384) : (i64) -> i64
      %1478 = arith.cmpi ne, %1477, %1471 : i64
      %1479 = arith.cmpi eq, %1476, %1471 : i64
      %1480 = arith.andi %1478, %1479 : i1
      %1481 = scf.if %1480 -> (i64) {
        scf.yield %1384 : i64
      } else {
        scf.yield %1476 : i64
      }
      %1482 = func.call @cc_errorp(%1426) : (i64) -> i64
      %1483 = arith.cmpi ne, %1482, %1471 : i64
      %1484 = arith.cmpi eq, %1481, %1471 : i64
      %1485 = arith.andi %1483, %1484 : i1
      %1486 = scf.if %1485 -> (i64) {
        scf.yield %1426 : i64
      } else {
        scf.yield %1481 : i64
      }
      %1487 = func.call @cc_errorp(%1435) : (i64) -> i64
      %1488 = arith.cmpi ne, %1487, %1471 : i64
      %1489 = arith.cmpi eq, %1486, %1471 : i64
      %1490 = arith.andi %1488, %1489 : i1
      %1491 = scf.if %1490 -> (i64) {
        scf.yield %1435 : i64
      } else {
        scf.yield %1486 : i64
      }
      %1492 = func.call @cc_errorp(%1446) : (i64) -> i64
      %1493 = arith.cmpi ne, %1492, %1471 : i64
      %1494 = arith.cmpi eq, %1491, %1471 : i64
      %1495 = arith.andi %1493, %1494 : i1
      %1496 = scf.if %1495 -> (i64) {
        scf.yield %1446 : i64
      } else {
        scf.yield %1491 : i64
      }
      %1497 = func.call @cc_errorp(%1450) : (i64) -> i64
      %1498 = arith.cmpi ne, %1497, %1471 : i64
      %1499 = arith.cmpi eq, %1496, %1471 : i64
      %1500 = arith.andi %1498, %1499 : i1
      %1501 = scf.if %1500 -> (i64) {
        scf.yield %1450 : i64
      } else {
        scf.yield %1496 : i64
      }
      %1502 = func.call @cc_errorp(%1461) : (i64) -> i64
      %1503 = arith.cmpi ne, %1502, %1471 : i64
      %1504 = arith.cmpi eq, %1501, %1471 : i64
      %1505 = arith.andi %1503, %1504 : i1
      %1506 = scf.if %1505 -> (i64) {
        scf.yield %1461 : i64
      } else {
        scf.yield %1501 : i64
      }
      %1507 = func.call @cc_errorp(%1470) : (i64) -> i64
      %1508 = arith.cmpi ne, %1507, %1471 : i64
      %1509 = arith.cmpi eq, %1506, %1471 : i64
      %1510 = arith.andi %1508, %1509 : i1
      %1511 = scf.if %1510 -> (i64) {
        scf.yield %1470 : i64
      } else {
        scf.yield %1506 : i64
      }
      %1512 = arith.cmpi ne, %1511, %1471 : i64
      scf.if %1512 {
        func.call @stack_push_pointer(%1511) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1331) : (i64) -> ()
        func.call @stack_push_pointer(%1384) : (i64) -> ()
        func.call @stack_push_pointer(%1426) : (i64) -> ()
        func.call @stack_push_pointer(%1435) : (i64) -> ()
        func.call @stack_push_pointer(%1446) : (i64) -> ()
        func.call @stack_push_pointer(%1450) : (i64) -> ()
        func.call @stack_push_pointer(%1461) : (i64) -> ()
        func.call @stack_push_pointer(%1470) : (i64) -> ()
        %1513 = llvm.mlir.addressof @str111 : !llvm.ptr
        %1514 = func.call @cc_make_function_ref_const(%1513) : (!llvm.ptr) -> i64
        %1515 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1514, %1515) : (i64, i64) -> ()
      }
      %1516 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1516 : i64
    }
    %1517 = func.call @cc_nil_value() : () -> i64
    %1518 = func.call @cc_errorp(%1322) : (i64) -> i64
    %1519 = arith.cmpi ne, %1518, %1517 : i64
    %1520 = scf.if %1519 -> (i64) {
      scf.yield %1322 : i64
    } else {
      %1521 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1522 = arith.constant 22 : i64
      %1523 = func.call @cc_make_string(%1521, %1522) : (!llvm.ptr, i64) -> i64
      %1524 = func.call @cc_nil_value() : () -> i64
      %1525 = func.call @cc_intern(%1523, %1524) : (i64, i64) -> i64
      %1526 = func.call @cc_nil_value() : () -> i64
      %1527 = func.call @cc_cons(%1525, %1526) : (i64, i64) -> i64
      %1528 = func.call @cc_values_pack(%1527) : (i64) -> i64
      func.call @stack_push_pointer(%1525) : (i64) -> ()
      %1529 = func.call @stack_pop_pointer() : () -> i64
      %1530 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1531 = arith.constant 3 : i64
      %1532 = func.call @cc_make_string(%1530, %1531) : (!llvm.ptr, i64) -> i64
      %1533 = func.call @cc_nil_value() : () -> i64
      %1534 = func.call @cc_intern(%1532, %1533) : (i64, i64) -> i64
      %1535 = func.call @cc_nil_value() : () -> i64
      %1536 = func.call @cc_cons(%1534, %1535) : (i64, i64) -> i64
      %1537 = func.call @cc_values_pack(%1536) : (i64) -> i64
      func.call @stack_push_pointer(%1534) : (i64) -> ()
      %1538 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1539 = arith.constant 5 : i64
      %1540 = func.call @cc_make_string(%1538, %1539) : (!llvm.ptr, i64) -> i64
      %1541 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1542 = arith.constant 11 : i64
      %1543 = func.call @cc_make_string(%1541, %1542) : (!llvm.ptr, i64) -> i64
      %1544 = func.call @cc_intern(%1540, %1543) : (i64, i64) -> i64
      %1545 = func.call @cc_nil_value() : () -> i64
      %1546 = func.call @cc_cons(%1544, %1545) : (i64, i64) -> i64
      %1547 = func.call @cc_values_pack(%1546) : (i64) -> i64
      func.call @stack_push_pointer(%1544) : (i64) -> ()
      %1548 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1548) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1549 = func.call @stack_pop_pointer() : () -> i64
      %1550 = func.call @stack_pop_pointer() : () -> i64
      %1551 = func.call @cc_cons(%1550, %1549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1551) : (i64) -> ()
      %1552 = func.call @stack_pop_pointer() : () -> i64
      %1553 = func.call @stack_pop_pointer() : () -> i64
      %1554 = func.call @cc_cons(%1553, %1552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1554) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1555 = func.call @stack_pop_pointer() : () -> i64
      %1556 = func.call @stack_pop_pointer() : () -> i64
      %1557 = func.call @cc_cons(%1556, %1555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1557) : (i64) -> ()
      %1558 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1559 = arith.constant 3 : i64
      %1560 = func.call @cc_make_string(%1558, %1559) : (!llvm.ptr, i64) -> i64
      %1561 = func.call @cc_nil_value() : () -> i64
      %1562 = func.call @cc_intern(%1560, %1561) : (i64, i64) -> i64
      %1563 = func.call @cc_nil_value() : () -> i64
      %1564 = func.call @cc_cons(%1562, %1563) : (i64, i64) -> i64
      %1565 = func.call @cc_values_pack(%1564) : (i64) -> i64
      func.call @stack_push_pointer(%1562) : (i64) -> ()
      %1566 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1567 = arith.constant 1 : i64
      %1568 = func.call @cc_make_string(%1566, %1567) : (!llvm.ptr, i64) -> i64
      %1569 = func.call @cc_nil_value() : () -> i64
      %1570 = func.call @cc_intern(%1568, %1569) : (i64, i64) -> i64
      %1571 = func.call @cc_nil_value() : () -> i64
      %1572 = func.call @cc_cons(%1570, %1571) : (i64, i64) -> i64
      %1573 = func.call @cc_values_pack(%1572) : (i64) -> i64
      func.call @stack_push_pointer(%1570) : (i64) -> ()
      %1574 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1575 = arith.constant 9 : i64
      %1576 = func.call @cc_make_string(%1574, %1575) : (!llvm.ptr, i64) -> i64
      %1577 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1578 = arith.constant 11 : i64
      %1579 = func.call @cc_make_string(%1577, %1578) : (!llvm.ptr, i64) -> i64
      %1580 = func.call @cc_intern(%1576, %1579) : (i64, i64) -> i64
      %1581 = func.call @cc_nil_value() : () -> i64
      %1582 = func.call @cc_cons(%1580, %1581) : (i64, i64) -> i64
      %1583 = func.call @cc_values_pack(%1582) : (i64) -> i64
      func.call @stack_push_pointer(%1580) : (i64) -> ()
      %1584 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1584) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1585 = func.call @stack_pop_pointer() : () -> i64
      %1586 = func.call @stack_pop_pointer() : () -> i64
      %1587 = func.call @cc_cons(%1586, %1585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1587) : (i64) -> ()
      %1588 = func.call @stack_pop_pointer() : () -> i64
      %1589 = func.call @stack_pop_pointer() : () -> i64
      %1590 = func.call @cc_cons(%1589, %1588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1590) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1591 = func.call @stack_pop_pointer() : () -> i64
      %1592 = func.call @stack_pop_pointer() : () -> i64
      %1593 = func.call @cc_cons(%1592, %1591) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1593) : (i64) -> ()
      %1594 = func.call @stack_pop_pointer() : () -> i64
      %1595 = func.call @stack_pop_pointer() : () -> i64
      %1596 = func.call @cc_cons(%1595, %1594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1596) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1597 = func.call @stack_pop_pointer() : () -> i64
      %1598 = func.call @stack_pop_pointer() : () -> i64
      %1599 = func.call @cc_cons(%1598, %1597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1599) : (i64) -> ()
      %1600 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1601 = arith.constant 4 : i64
      %1602 = func.call @cc_make_string(%1600, %1601) : (!llvm.ptr, i64) -> i64
      %1603 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1604 = arith.constant 11 : i64
      %1605 = func.call @cc_make_string(%1603, %1604) : (!llvm.ptr, i64) -> i64
      %1606 = func.call @cc_intern(%1602, %1605) : (i64, i64) -> i64
      %1607 = func.call @cc_nil_value() : () -> i64
      %1608 = func.call @cc_cons(%1606, %1607) : (i64, i64) -> i64
      %1609 = func.call @cc_values_pack(%1608) : (i64) -> i64
      func.call @stack_push_pointer(%1606) : (i64) -> ()
      %1610 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1611 = arith.constant 3 : i64
      %1612 = func.call @cc_make_string(%1610, %1611) : (!llvm.ptr, i64) -> i64
      %1613 = func.call @cc_nil_value() : () -> i64
      %1614 = func.call @cc_intern(%1612, %1613) : (i64, i64) -> i64
      %1615 = func.call @cc_nil_value() : () -> i64
      %1616 = func.call @cc_cons(%1614, %1615) : (i64, i64) -> i64
      %1617 = func.call @cc_values_pack(%1616) : (i64) -> i64
      func.call @stack_push_pointer(%1614) : (i64) -> ()
      %1618 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1619 = arith.constant 1 : i64
      %1620 = func.call @cc_make_string(%1618, %1619) : (!llvm.ptr, i64) -> i64
      %1621 = func.call @cc_nil_value() : () -> i64
      %1622 = func.call @cc_intern(%1620, %1621) : (i64, i64) -> i64
      %1623 = func.call @cc_nil_value() : () -> i64
      %1624 = func.call @cc_cons(%1622, %1623) : (i64, i64) -> i64
      %1625 = func.call @cc_values_pack(%1624) : (i64) -> i64
      func.call @stack_push_pointer(%1622) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1626 = func.call @stack_pop_pointer() : () -> i64
      %1627 = func.call @stack_pop_pointer() : () -> i64
      %1628 = func.call @cc_cons(%1627, %1626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1628) : (i64) -> ()
      %1629 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1630 = arith.constant 7 : i64
      %1631 = func.call @cc_make_string(%1629, %1630) : (!llvm.ptr, i64) -> i64
      %1632 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1633 = arith.constant 11 : i64
      %1634 = func.call @cc_make_string(%1632, %1633) : (!llvm.ptr, i64) -> i64
      %1635 = func.call @cc_intern(%1631, %1634) : (i64, i64) -> i64
      %1636 = func.call @cc_nil_value() : () -> i64
      %1637 = func.call @cc_cons(%1635, %1636) : (i64, i64) -> i64
      %1638 = func.call @cc_values_pack(%1637) : (i64) -> i64
      func.call @stack_push_pointer(%1635) : (i64) -> ()
      %1639 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1640 = arith.constant 6 : i64
      %1641 = func.call @cc_make_string(%1639, %1640) : (!llvm.ptr, i64) -> i64
      %1642 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1643 = arith.constant 11 : i64
      %1644 = func.call @cc_make_string(%1642, %1643) : (!llvm.ptr, i64) -> i64
      %1645 = func.call @cc_intern(%1641, %1644) : (i64, i64) -> i64
      %1646 = func.call @cc_nil_value() : () -> i64
      %1647 = func.call @cc_cons(%1645, %1646) : (i64, i64) -> i64
      %1648 = func.call @cc_values_pack(%1647) : (i64) -> i64
      func.call @stack_push_pointer(%1645) : (i64) -> ()
      %1649 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1650 = arith.constant 1 : i64
      %1651 = func.call @cc_make_string(%1649, %1650) : (!llvm.ptr, i64) -> i64
      %1652 = func.call @cc_nil_value() : () -> i64
      %1653 = func.call @cc_intern(%1651, %1652) : (i64, i64) -> i64
      %1654 = func.call @cc_nil_value() : () -> i64
      %1655 = func.call @cc_cons(%1653, %1654) : (i64, i64) -> i64
      %1656 = func.call @cc_values_pack(%1655) : (i64) -> i64
      func.call @stack_push_pointer(%1653) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @stack_pop_pointer() : () -> i64
      %1659 = func.call @cc_cons(%1658, %1657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1659) : (i64) -> ()
      %1660 = func.call @stack_pop_pointer() : () -> i64
      %1661 = func.call @stack_pop_pointer() : () -> i64
      %1662 = func.call @cc_cons(%1661, %1660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1662) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1663 = func.call @stack_pop_pointer() : () -> i64
      %1664 = func.call @stack_pop_pointer() : () -> i64
      %1665 = func.call @cc_cons(%1664, %1663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1665) : (i64) -> ()
      %1666 = func.call @stack_pop_pointer() : () -> i64
      %1667 = func.call @stack_pop_pointer() : () -> i64
      %1668 = func.call @cc_cons(%1667, %1666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1668) : (i64) -> ()
      %1669 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1670 = arith.constant 4 : i64
      %1671 = func.call @cc_make_string(%1669, %1670) : (!llvm.ptr, i64) -> i64
      %1672 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1673 = arith.constant 11 : i64
      %1674 = func.call @cc_make_string(%1672, %1673) : (!llvm.ptr, i64) -> i64
      %1675 = func.call @cc_intern(%1671, %1674) : (i64, i64) -> i64
      %1676 = func.call @cc_nil_value() : () -> i64
      %1677 = func.call @cc_cons(%1675, %1676) : (i64, i64) -> i64
      %1678 = func.call @cc_values_pack(%1677) : (i64) -> i64
      func.call @stack_push_pointer(%1675) : (i64) -> ()
      %1679 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1680 = arith.constant 5 : i64
      %1681 = func.call @cc_make_string(%1679, %1680) : (!llvm.ptr, i64) -> i64
      %1682 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1683 = arith.constant 11 : i64
      %1684 = func.call @cc_make_string(%1682, %1683) : (!llvm.ptr, i64) -> i64
      %1685 = func.call @cc_intern(%1681, %1684) : (i64, i64) -> i64
      %1686 = func.call @cc_nil_value() : () -> i64
      %1687 = func.call @cc_cons(%1685, %1686) : (i64, i64) -> i64
      %1688 = func.call @cc_values_pack(%1687) : (i64) -> i64
      func.call @stack_push_pointer(%1685) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1689 = func.call @stack_pop_pointer() : () -> i64
      %1690 = func.call @stack_pop_pointer() : () -> i64
      %1691 = func.call @cc_cons(%1690, %1689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1691) : (i64) -> ()
      %1692 = func.call @stack_pop_pointer() : () -> i64
      %1693 = func.call @stack_pop_pointer() : () -> i64
      %1694 = func.call @cc_cons(%1693, %1692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = func.call @stack_pop_pointer() : () -> i64
      %1697 = func.call @cc_cons(%1696, %1695) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1697) : (i64) -> ()
      %1698 = func.call @stack_pop_pointer() : () -> i64
      %1699 = func.call @stack_pop_pointer() : () -> i64
      %1700 = func.call @cc_cons(%1699, %1698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1700) : (i64) -> ()
      %1701 = func.call @stack_pop_pointer() : () -> i64
      %1702 = func.call @stack_pop_pointer() : () -> i64
      %1703 = func.call @cc_cons(%1702, %1701) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1703) : (i64) -> ()
      %1704 = func.call @stack_pop_pointer() : () -> i64
      %1705 = func.call @stack_pop_pointer() : () -> i64
      %1706 = func.call @cc_cons(%1705, %1704) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1707 = func.call @stack_pop_pointer() : () -> i64
      %1708 = func.call @stack_pop_pointer() : () -> i64
      %1709 = func.call @cc_cons(%1708, %1707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1709) : (i64) -> ()
      %1710 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1711 = arith.constant 4 : i64
      %1712 = func.call @cc_make_string(%1710, %1711) : (!llvm.ptr, i64) -> i64
      %1713 = func.call @cc_nil_value() : () -> i64
      %1714 = func.call @cc_intern(%1712, %1713) : (i64, i64) -> i64
      %1715 = func.call @cc_nil_value() : () -> i64
      %1716 = func.call @cc_cons(%1714, %1715) : (i64, i64) -> i64
      %1717 = func.call @cc_values_pack(%1716) : (i64) -> i64
      func.call @stack_push_pointer(%1714) : (i64) -> ()
      %1718 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1719 = arith.constant 6 : i64
      %1720 = func.call @cc_make_string(%1718, %1719) : (!llvm.ptr, i64) -> i64
      %1721 = func.call @cc_nil_value() : () -> i64
      %1722 = func.call @cc_intern(%1720, %1721) : (i64, i64) -> i64
      %1723 = func.call @cc_nil_value() : () -> i64
      %1724 = func.call @cc_cons(%1722, %1723) : (i64, i64) -> i64
      %1725 = func.call @cc_values_pack(%1724) : (i64) -> i64
      func.call @stack_push_pointer(%1722) : (i64) -> ()
      %1726 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1726) : (i64) -> ()
      %1727 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1728 = arith.constant 2 : i64
      %1729 = func.call @cc_make_string(%1727, %1728) : (!llvm.ptr, i64) -> i64
      %1730 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1731 = arith.constant 11 : i64
      %1732 = func.call @cc_make_string(%1730, %1731) : (!llvm.ptr, i64) -> i64
      %1733 = func.call @cc_intern(%1729, %1732) : (i64, i64) -> i64
      %1734 = func.call @cc_nil_value() : () -> i64
      %1735 = func.call @cc_cons(%1733, %1734) : (i64, i64) -> i64
      %1736 = func.call @cc_values_pack(%1735) : (i64) -> i64
      func.call @stack_push_pointer(%1733) : (i64) -> ()
      %1737 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1738 = arith.constant 8 : i64
      %1739 = func.call @cc_make_string(%1737, %1738) : (!llvm.ptr, i64) -> i64
      %1740 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1741 = arith.constant 7 : i64
      %1742 = func.call @cc_make_string(%1740, %1741) : (!llvm.ptr, i64) -> i64
      %1743 = func.call @cc_intern(%1739, %1742) : (i64, i64) -> i64
      %1744 = func.call @cc_nil_value() : () -> i64
      %1745 = func.call @cc_cons(%1743, %1744) : (i64, i64) -> i64
      %1746 = func.call @cc_values_pack(%1745) : (i64) -> i64
      func.call @stack_push_pointer(%1743) : (i64) -> ()
      %1747 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1748 = arith.constant 1 : i64
      %1749 = func.call @cc_make_string(%1747, %1748) : (!llvm.ptr, i64) -> i64
      %1750 = func.call @cc_nil_value() : () -> i64
      %1751 = func.call @cc_intern(%1749, %1750) : (i64, i64) -> i64
      %1752 = func.call @cc_nil_value() : () -> i64
      %1753 = func.call @cc_cons(%1751, %1752) : (i64, i64) -> i64
      %1754 = func.call @cc_values_pack(%1753) : (i64) -> i64
      func.call @stack_push_pointer(%1751) : (i64) -> ()
      %1755 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1756 = arith.constant 8 : i64
      %1757 = func.call @cc_make_string(%1755, %1756) : (!llvm.ptr, i64) -> i64
      %1758 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1759 = arith.constant 11 : i64
      %1760 = func.call @cc_make_string(%1758, %1759) : (!llvm.ptr, i64) -> i64
      %1761 = func.call @cc_intern(%1757, %1760) : (i64, i64) -> i64
      %1762 = func.call @cc_nil_value() : () -> i64
      %1763 = func.call @cc_cons(%1761, %1762) : (i64, i64) -> i64
      %1764 = func.call @cc_values_pack(%1763) : (i64) -> i64
      func.call @stack_push_pointer(%1761) : (i64) -> ()
      %1765 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1766 = arith.constant 3 : i64
      %1767 = func.call @cc_make_string(%1765, %1766) : (!llvm.ptr, i64) -> i64
      %1768 = func.call @cc_nil_value() : () -> i64
      %1769 = func.call @cc_intern(%1767, %1768) : (i64, i64) -> i64
      %1770 = func.call @cc_nil_value() : () -> i64
      %1771 = func.call @cc_cons(%1769, %1770) : (i64, i64) -> i64
      %1772 = func.call @cc_values_pack(%1771) : (i64) -> i64
      func.call @stack_push_pointer(%1769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1773 = func.call @stack_pop_pointer() : () -> i64
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = func.call @cc_cons(%1774, %1773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1775) : (i64) -> ()
      %1776 = func.call @stack_pop_pointer() : () -> i64
      %1777 = func.call @stack_pop_pointer() : () -> i64
      %1778 = func.call @cc_cons(%1777, %1776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1778) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1779 = func.call @stack_pop_pointer() : () -> i64
      %1780 = func.call @stack_pop_pointer() : () -> i64
      %1781 = func.call @cc_cons(%1780, %1779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1781) : (i64) -> ()
      %1782 = func.call @stack_pop_pointer() : () -> i64
      %1783 = func.call @stack_pop_pointer() : () -> i64
      %1784 = func.call @cc_cons(%1783, %1782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1784) : (i64) -> ()
      %1785 = func.call @stack_pop_pointer() : () -> i64
      %1786 = func.call @stack_pop_pointer() : () -> i64
      %1787 = func.call @cc_cons(%1786, %1785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1788 = func.call @stack_pop_pointer() : () -> i64
      %1789 = func.call @stack_pop_pointer() : () -> i64
      %1790 = func.call @cc_cons(%1789, %1788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1790) : (i64) -> ()
      %1791 = func.call @stack_pop_pointer() : () -> i64
      %1792 = func.call @stack_pop_pointer() : () -> i64
      %1793 = func.call @cc_cons(%1792, %1791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1793) : (i64) -> ()
      %1794 = func.call @stack_pop_pointer() : () -> i64
      %1795 = func.call @stack_pop_pointer() : () -> i64
      %1796 = func.call @cc_cons(%1795, %1794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1796) : (i64) -> ()
      %1797 = func.call @stack_pop_pointer() : () -> i64
      %1798 = func.call @stack_pop_pointer() : () -> i64
      %1799 = func.call @cc_cons(%1798, %1797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1799) : (i64) -> ()
      %1800 = func.call @stack_pop_pointer() : () -> i64
      %1801 = func.call @stack_pop_pointer() : () -> i64
      %1802 = func.call @cc_cons(%1801, %1800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1802) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1803 = func.call @stack_pop_pointer() : () -> i64
      %1804 = func.call @stack_pop_pointer() : () -> i64
      %1805 = func.call @cc_cons(%1804, %1803) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1805) : (i64) -> ()
      %1806 = func.call @stack_pop_pointer() : () -> i64
      %1807 = func.call @stack_pop_pointer() : () -> i64
      %1808 = func.call @cc_cons(%1807, %1806) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1808) : (i64) -> ()
      %1809 = func.call @stack_pop_pointer() : () -> i64
      %1810 = func.call @stack_pop_pointer() : () -> i64
      %1811 = func.call @cc_cons(%1810, %1809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1811) : (i64) -> ()
      %1812 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1813 = arith.constant 10 : i64
      %1814 = func.call @cc_make_string(%1812, %1813) : (!llvm.ptr, i64) -> i64
      %1815 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1816 = arith.constant 7 : i64
      %1817 = func.call @cc_make_string(%1815, %1816) : (!llvm.ptr, i64) -> i64
      %1818 = func.call @cc_intern(%1814, %1817) : (i64, i64) -> i64
      %1819 = func.call @cc_nil_value() : () -> i64
      %1820 = func.call @cc_cons(%1818, %1819) : (i64, i64) -> i64
      %1821 = func.call @cc_values_pack(%1820) : (i64) -> i64
      func.call @stack_push_pointer(%1818) : (i64) -> ()
      %1822 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1823 = arith.constant 1 : i64
      %1824 = func.call @cc_make_string(%1822, %1823) : (!llvm.ptr, i64) -> i64
      %1825 = func.call @cc_nil_value() : () -> i64
      %1826 = func.call @cc_intern(%1824, %1825) : (i64, i64) -> i64
      %1827 = func.call @cc_nil_value() : () -> i64
      %1828 = func.call @cc_cons(%1826, %1827) : (i64, i64) -> i64
      %1829 = func.call @cc_values_pack(%1828) : (i64) -> i64
      func.call @stack_push_pointer(%1826) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1830 = func.call @stack_pop_pointer() : () -> i64
      %1831 = func.call @stack_pop_pointer() : () -> i64
      %1832 = func.call @cc_cons(%1831, %1830) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1832) : (i64) -> ()
      %1833 = func.call @stack_pop_pointer() : () -> i64
      %1834 = func.call @stack_pop_pointer() : () -> i64
      %1835 = func.call @cc_cons(%1834, %1833) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1835) : (i64) -> ()
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
      %1848 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1849 = arith.constant 4 : i64
      %1850 = func.call @cc_make_string(%1848, %1849) : (!llvm.ptr, i64) -> i64
      %1851 = func.call @cc_nil_value() : () -> i64
      %1852 = func.call @cc_intern(%1850, %1851) : (i64, i64) -> i64
      %1853 = func.call @cc_nil_value() : () -> i64
      %1854 = func.call @cc_cons(%1852, %1853) : (i64, i64) -> i64
      %1855 = func.call @cc_values_pack(%1854) : (i64) -> i64
      func.call @stack_push_pointer(%1852) : (i64) -> ()
      %1856 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1857 = arith.constant 6 : i64
      %1858 = func.call @cc_make_string(%1856, %1857) : (!llvm.ptr, i64) -> i64
      %1859 = func.call @cc_nil_value() : () -> i64
      %1860 = func.call @cc_intern(%1858, %1859) : (i64, i64) -> i64
      %1861 = func.call @cc_nil_value() : () -> i64
      %1862 = func.call @cc_cons(%1860, %1861) : (i64, i64) -> i64
      %1863 = func.call @cc_values_pack(%1862) : (i64) -> i64
      func.call @stack_push_pointer(%1860) : (i64) -> ()
      %1864 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1864) : (i64) -> ()
      %1865 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1866 = arith.constant 2 : i64
      %1867 = func.call @cc_make_string(%1865, %1866) : (!llvm.ptr, i64) -> i64
      %1868 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1869 = arith.constant 11 : i64
      %1870 = func.call @cc_make_string(%1868, %1869) : (!llvm.ptr, i64) -> i64
      %1871 = func.call @cc_intern(%1867, %1870) : (i64, i64) -> i64
      %1872 = func.call @cc_nil_value() : () -> i64
      %1873 = func.call @cc_cons(%1871, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_values_pack(%1873) : (i64) -> i64
      func.call @stack_push_pointer(%1871) : (i64) -> ()
      %1875 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1876 = arith.constant 15 : i64
      %1877 = func.call @cc_make_string(%1875, %1876) : (!llvm.ptr, i64) -> i64
      %1878 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1879 = arith.constant 7 : i64
      %1880 = func.call @cc_make_string(%1878, %1879) : (!llvm.ptr, i64) -> i64
      %1881 = func.call @cc_intern(%1877, %1880) : (i64, i64) -> i64
      %1882 = func.call @cc_nil_value() : () -> i64
      %1883 = func.call @cc_cons(%1881, %1882) : (i64, i64) -> i64
      %1884 = func.call @cc_values_pack(%1883) : (i64) -> i64
      func.call @stack_push_pointer(%1881) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1885 = func.call @stack_pop_pointer() : () -> i64
      %1886 = func.call @stack_pop_pointer() : () -> i64
      %1887 = func.call @cc_cons(%1886, %1885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1887) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1888 = func.call @stack_pop_pointer() : () -> i64
      %1889 = func.call @stack_pop_pointer() : () -> i64
      %1890 = func.call @cc_cons(%1889, %1888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1890) : (i64) -> ()
      %1891 = func.call @stack_pop_pointer() : () -> i64
      %1892 = func.call @stack_pop_pointer() : () -> i64
      %1893 = func.call @cc_cons(%1892, %1891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1893) : (i64) -> ()
      %1894 = func.call @stack_pop_pointer() : () -> i64
      %1895 = func.call @stack_pop_pointer() : () -> i64
      %1896 = func.call @cc_cons(%1895, %1894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1896) : (i64) -> ()
      %1897 = func.call @stack_pop_pointer() : () -> i64
      %1898 = func.call @stack_pop_pointer() : () -> i64
      %1899 = func.call @cc_cons(%1898, %1897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1899) : (i64) -> ()
      %1900 = func.call @stack_pop_pointer() : () -> i64
      %1901 = func.call @stack_pop_pointer() : () -> i64
      %1902 = func.call @cc_cons(%1901, %1900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1902) : (i64) -> ()
      %1903 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1904 = arith.constant 5 : i64
      %1905 = func.call @cc_make_string(%1903, %1904) : (!llvm.ptr, i64) -> i64
      %1906 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1907 = arith.constant 11 : i64
      %1908 = func.call @cc_make_string(%1906, %1907) : (!llvm.ptr, i64) -> i64
      %1909 = func.call @cc_intern(%1905, %1908) : (i64, i64) -> i64
      %1910 = func.call @cc_nil_value() : () -> i64
      %1911 = func.call @cc_cons(%1909, %1910) : (i64, i64) -> i64
      %1912 = func.call @cc_values_pack(%1911) : (i64) -> i64
      func.call @stack_push_pointer(%1909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1913 = func.call @stack_pop_pointer() : () -> i64
      %1914 = func.call @stack_pop_pointer() : () -> i64
      %1915 = func.call @cc_cons(%1914, %1913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1915) : (i64) -> ()
      %1916 = func.call @stack_pop_pointer() : () -> i64
      %1917 = func.call @stack_pop_pointer() : () -> i64
      %1918 = func.call @cc_cons(%1917, %1916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1918) : (i64) -> ()
      %1919 = func.call @stack_pop_pointer() : () -> i64
      %1920 = func.call @stack_pop_pointer() : () -> i64
      %1921 = func.call @cc_cons(%1920, %1919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1921) : (i64) -> ()
      %1922 = func.call @stack_pop_pointer() : () -> i64
      %1923 = func.call @stack_pop_pointer() : () -> i64
      %1924 = func.call @cc_cons(%1923, %1922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1924) : (i64) -> ()
      %1925 = func.call @stack_pop_pointer() : () -> i64
      %1926 = func.call @stack_pop_pointer() : () -> i64
      %1927 = func.call @cc_cons(%1926, %1925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1927) : (i64) -> ()
      %1928 = func.call @stack_pop_pointer() : () -> i64
      %2392 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2393 = arith.constant 30 : i64
      %2394 = func.call @cc_make_symbol(%2392, %2393) : (!llvm.ptr, i64) -> i64
      %2395 = func.call @cc_persistent_root_value(%2394) : (i64) -> i64
      func.call @stack_push_pointer(%2395) : (i64) -> ()
      %2396 = arith.constant 236837129945101 : i64
      %2397 = arith.constant 1 : i64
      %2398 = func.call @cc_make_closure(%2396, %2397) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2398) : (i64) -> ()
      %2399 = func.call @stack_pop_pointer() : () -> i64
      %2400 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2400) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2401 = func.call @stack_pop_pointer() : () -> i64
      %2402 = func.call @stack_pop_pointer() : () -> i64
      %2403 = func.call @cc_cons(%2402, %2401) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2403) : (i64) -> ()
      %2404 = func.call @stack_pop_pointer() : () -> i64
      %2405 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2406 = arith.constant 11 : i64
      %2407 = func.call @cc_make_string(%2405, %2406) : (!llvm.ptr, i64) -> i64
      %2408 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2409 = arith.constant 7 : i64
      %2410 = func.call @cc_make_string(%2408, %2409) : (!llvm.ptr, i64) -> i64
      %2411 = func.call @cc_intern(%2407, %2410) : (i64, i64) -> i64
      %2412 = func.call @cc_nil_value() : () -> i64
      %2413 = func.call @cc_cons(%2411, %2412) : (i64, i64) -> i64
      %2414 = func.call @cc_values_pack(%2413) : (i64) -> i64
      func.call @stack_push_pointer(%2411) : (i64) -> ()
      %2415 = func.call @stack_pop_pointer() : () -> i64
      %2416 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2417 = arith.constant 47 : i64
      %2418 = func.call @cc_make_string(%2416, %2417) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2418) : (i64) -> ()
      %2419 = func.call @stack_pop_pointer() : () -> i64
      %2420 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2421 = arith.constant 4 : i64
      %2422 = func.call @cc_make_string(%2420, %2421) : (!llvm.ptr, i64) -> i64
      %2423 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2424 = arith.constant 7 : i64
      %2425 = func.call @cc_make_string(%2423, %2424) : (!llvm.ptr, i64) -> i64
      %2426 = func.call @cc_intern(%2422, %2425) : (i64, i64) -> i64
      %2427 = func.call @cc_nil_value() : () -> i64
      %2428 = func.call @cc_cons(%2426, %2427) : (i64, i64) -> i64
      %2429 = func.call @cc_values_pack(%2428) : (i64) -> i64
      func.call @stack_push_pointer(%2426) : (i64) -> ()
      %2430 = func.call @stack_pop_pointer() : () -> i64
      %2431 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2432 = arith.constant 6 : i64
      %2433 = func.call @cc_make_string(%2431, %2432) : (!llvm.ptr, i64) -> i64
      %2434 = func.call @cc_nil_value() : () -> i64
      %2435 = func.call @cc_intern(%2433, %2434) : (i64, i64) -> i64
      %2436 = func.call @cc_nil_value() : () -> i64
      %2437 = func.call @cc_cons(%2435, %2436) : (i64, i64) -> i64
      %2438 = func.call @cc_values_pack(%2437) : (i64) -> i64
      func.call @stack_push_pointer(%2435) : (i64) -> ()
      %2439 = func.call @stack_pop_pointer() : () -> i64
      %2440 = func.call @cc_nil_value() : () -> i64
      %2441 = func.call @cc_errorp(%1529) : (i64) -> i64
      %2442 = arith.cmpi ne, %2441, %2440 : i64
      %2443 = arith.cmpi eq, %2440, %2440 : i64
      %2444 = arith.andi %2442, %2443 : i1
      %2445 = scf.if %2444 -> (i64) {
        scf.yield %1529 : i64
      } else {
        scf.yield %2440 : i64
      }
      %2446 = func.call @cc_errorp(%1928) : (i64) -> i64
      %2447 = arith.cmpi ne, %2446, %2440 : i64
      %2448 = arith.cmpi eq, %2445, %2440 : i64
      %2449 = arith.andi %2447, %2448 : i1
      %2450 = scf.if %2449 -> (i64) {
        scf.yield %1928 : i64
      } else {
        scf.yield %2445 : i64
      }
      %2451 = func.call @cc_errorp(%2399) : (i64) -> i64
      %2452 = arith.cmpi ne, %2451, %2440 : i64
      %2453 = arith.cmpi eq, %2450, %2440 : i64
      %2454 = arith.andi %2452, %2453 : i1
      %2455 = scf.if %2454 -> (i64) {
        scf.yield %2399 : i64
      } else {
        scf.yield %2450 : i64
      }
      %2456 = func.call @cc_errorp(%2404) : (i64) -> i64
      %2457 = arith.cmpi ne, %2456, %2440 : i64
      %2458 = arith.cmpi eq, %2455, %2440 : i64
      %2459 = arith.andi %2457, %2458 : i1
      %2460 = scf.if %2459 -> (i64) {
        scf.yield %2404 : i64
      } else {
        scf.yield %2455 : i64
      }
      %2461 = func.call @cc_errorp(%2415) : (i64) -> i64
      %2462 = arith.cmpi ne, %2461, %2440 : i64
      %2463 = arith.cmpi eq, %2460, %2440 : i64
      %2464 = arith.andi %2462, %2463 : i1
      %2465 = scf.if %2464 -> (i64) {
        scf.yield %2415 : i64
      } else {
        scf.yield %2460 : i64
      }
      %2466 = func.call @cc_errorp(%2419) : (i64) -> i64
      %2467 = arith.cmpi ne, %2466, %2440 : i64
      %2468 = arith.cmpi eq, %2465, %2440 : i64
      %2469 = arith.andi %2467, %2468 : i1
      %2470 = scf.if %2469 -> (i64) {
        scf.yield %2419 : i64
      } else {
        scf.yield %2465 : i64
      }
      %2471 = func.call @cc_errorp(%2430) : (i64) -> i64
      %2472 = arith.cmpi ne, %2471, %2440 : i64
      %2473 = arith.cmpi eq, %2470, %2440 : i64
      %2474 = arith.andi %2472, %2473 : i1
      %2475 = scf.if %2474 -> (i64) {
        scf.yield %2430 : i64
      } else {
        scf.yield %2470 : i64
      }
      %2476 = func.call @cc_errorp(%2439) : (i64) -> i64
      %2477 = arith.cmpi ne, %2476, %2440 : i64
      %2478 = arith.cmpi eq, %2475, %2440 : i64
      %2479 = arith.andi %2477, %2478 : i1
      %2480 = scf.if %2479 -> (i64) {
        scf.yield %2439 : i64
      } else {
        scf.yield %2475 : i64
      }
      %2481 = arith.cmpi ne, %2480, %2440 : i64
      scf.if %2481 {
        func.call @stack_push_pointer(%2480) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1529) : (i64) -> ()
        func.call @stack_push_pointer(%1928) : (i64) -> ()
        func.call @stack_push_pointer(%2399) : (i64) -> ()
        func.call @stack_push_pointer(%2404) : (i64) -> ()
        func.call @stack_push_pointer(%2415) : (i64) -> ()
        func.call @stack_push_pointer(%2419) : (i64) -> ()
        func.call @stack_push_pointer(%2430) : (i64) -> ()
        func.call @stack_push_pointer(%2439) : (i64) -> ()
        %2482 = llvm.mlir.addressof @str182 : !llvm.ptr
        %2483 = func.call @cc_make_function_ref_const(%2482) : (!llvm.ptr) -> i64
        %2484 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2483, %2484) : (i64, i64) -> ()
      }
      %2485 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2485 : i64
    }
    %2486 = func.call @cc_nil_value() : () -> i64
    %2487 = func.call @cc_errorp(%1520) : (i64) -> i64
    %2488 = arith.cmpi ne, %2487, %2486 : i64
    %2489 = scf.if %2488 -> (i64) {
      scf.yield %1520 : i64
    } else {
      %2490 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2491 = arith.constant 18 : i64
      %2492 = func.call @cc_make_string(%2490, %2491) : (!llvm.ptr, i64) -> i64
      %2493 = func.call @cc_nil_value() : () -> i64
      %2494 = func.call @cc_intern(%2492, %2493) : (i64, i64) -> i64
      %2495 = func.call @cc_nil_value() : () -> i64
      %2496 = func.call @cc_cons(%2494, %2495) : (i64, i64) -> i64
      %2497 = func.call @cc_values_pack(%2496) : (i64) -> i64
      func.call @stack_push_pointer(%2494) : (i64) -> ()
      %2498 = func.call @stack_pop_pointer() : () -> i64
      %2499 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2500 = arith.constant 15 : i64
      %2501 = func.call @cc_make_string(%2499, %2500) : (!llvm.ptr, i64) -> i64
      %2502 = func.call @cc_nil_value() : () -> i64
      %2503 = func.call @cc_intern(%2501, %2502) : (i64, i64) -> i64
      %2504 = func.call @cc_nil_value() : () -> i64
      %2505 = func.call @cc_cons(%2503, %2504) : (i64, i64) -> i64
      %2506 = func.call @cc_values_pack(%2505) : (i64) -> i64
      func.call @stack_push_pointer(%2503) : (i64) -> ()
      %2507 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2508 = arith.constant 6 : i64
      %2509 = func.call @cc_make_string(%2507, %2508) : (!llvm.ptr, i64) -> i64
      %2510 = func.call @cc_nil_value() : () -> i64
      %2511 = func.call @cc_intern(%2509, %2510) : (i64, i64) -> i64
      %2512 = func.call @cc_nil_value() : () -> i64
      %2513 = func.call @cc_cons(%2511, %2512) : (i64, i64) -> i64
      %2514 = func.call @cc_values_pack(%2513) : (i64) -> i64
      func.call @stack_push_pointer(%2511) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2515 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2516 = arith.constant 10 : i64
      %2517 = func.call @cc_make_string(%2515, %2516) : (!llvm.ptr, i64) -> i64
      %2518 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2519 = arith.constant 11 : i64
      %2520 = func.call @cc_make_string(%2518, %2519) : (!llvm.ptr, i64) -> i64
      %2521 = func.call @cc_intern(%2517, %2520) : (i64, i64) -> i64
      %2522 = func.call @cc_nil_value() : () -> i64
      %2523 = func.call @cc_cons(%2521, %2522) : (i64, i64) -> i64
      %2524 = func.call @cc_values_pack(%2523) : (i64) -> i64
      func.call @stack_push_pointer(%2521) : (i64) -> ()
      %2525 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2525) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2526 = func.call @stack_pop_pointer() : () -> i64
      %2527 = func.call @stack_pop_pointer() : () -> i64
      %2528 = func.call @cc_cons(%2527, %2526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2528) : (i64) -> ()
      %2529 = func.call @stack_pop_pointer() : () -> i64
      %2530 = func.call @stack_pop_pointer() : () -> i64
      %2531 = func.call @cc_cons(%2530, %2529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2531) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2532 = func.call @stack_pop_pointer() : () -> i64
      %2533 = func.call @stack_pop_pointer() : () -> i64
      %2534 = func.call @cc_cons(%2533, %2532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2534) : (i64) -> ()
      %2535 = func.call @stack_pop_pointer() : () -> i64
      %2536 = func.call @stack_pop_pointer() : () -> i64
      %2537 = func.call @cc_cons(%2536, %2535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2537) : (i64) -> ()
      %2538 = func.call @stack_pop_pointer() : () -> i64
      %2539 = func.call @stack_pop_pointer() : () -> i64
      %2540 = func.call @cc_cons(%2539, %2538) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2540) : (i64) -> ()
      %2541 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%2541) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2542 = func.call @stack_pop_pointer() : () -> i64
      %2543 = func.call @stack_pop_pointer() : () -> i64
      %2544 = func.call @cc_cons(%2543, %2542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2544) : (i64) -> ()
      %2545 = func.call @stack_pop_pointer() : () -> i64
      %2546 = func.call @stack_pop_pointer() : () -> i64
      %2547 = func.call @cc_cons(%2546, %2545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2547) : (i64) -> ()
      %2548 = func.call @stack_pop_pointer() : () -> i64
      %2549 = func.call @stack_pop_pointer() : () -> i64
      %2550 = func.call @cc_cons(%2549, %2548) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2550) : (i64) -> ()
      %2551 = func.call @stack_pop_pointer() : () -> i64
      %2597 = arith.constant 236837129945108 : i64
      %2598 = arith.constant 0 : i64
      %2599 = func.call @cc_make_closure(%2597, %2598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2599) : (i64) -> ()
      %2600 = func.call @stack_pop_pointer() : () -> i64
      %2601 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2601) : (i64) -> ()
      %2602 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2602) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @stack_pop_pointer() : () -> i64
      %2605 = func.call @cc_cons(%2604, %2603) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2605) : (i64) -> ()
      %2606 = func.call @stack_pop_pointer() : () -> i64
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = func.call @cc_cons(%2607, %2606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2608) : (i64) -> ()
      %2609 = func.call @stack_pop_pointer() : () -> i64
      %2610 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2611 = arith.constant 11 : i64
      %2612 = func.call @cc_make_string(%2610, %2611) : (!llvm.ptr, i64) -> i64
      %2613 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2614 = arith.constant 7 : i64
      %2615 = func.call @cc_make_string(%2613, %2614) : (!llvm.ptr, i64) -> i64
      %2616 = func.call @cc_intern(%2612, %2615) : (i64, i64) -> i64
      %2617 = func.call @cc_nil_value() : () -> i64
      %2618 = func.call @cc_cons(%2616, %2617) : (i64, i64) -> i64
      %2619 = func.call @cc_values_pack(%2618) : (i64) -> i64
      func.call @stack_push_pointer(%2616) : (i64) -> ()
      %2620 = func.call @stack_pop_pointer() : () -> i64
      %2621 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2622 = arith.constant 49 : i64
      %2623 = func.call @cc_make_string(%2621, %2622) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2623) : (i64) -> ()
      %2624 = func.call @stack_pop_pointer() : () -> i64
      %2625 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2626 = arith.constant 4 : i64
      %2627 = func.call @cc_make_string(%2625, %2626) : (!llvm.ptr, i64) -> i64
      %2628 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2629 = arith.constant 7 : i64
      %2630 = func.call @cc_make_string(%2628, %2629) : (!llvm.ptr, i64) -> i64
      %2631 = func.call @cc_intern(%2627, %2630) : (i64, i64) -> i64
      %2632 = func.call @cc_nil_value() : () -> i64
      %2633 = func.call @cc_cons(%2631, %2632) : (i64, i64) -> i64
      %2634 = func.call @cc_values_pack(%2633) : (i64) -> i64
      func.call @stack_push_pointer(%2631) : (i64) -> ()
      %2635 = func.call @stack_pop_pointer() : () -> i64
      %2636 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2637 = arith.constant 6 : i64
      %2638 = func.call @cc_make_string(%2636, %2637) : (!llvm.ptr, i64) -> i64
      %2639 = func.call @cc_nil_value() : () -> i64
      %2640 = func.call @cc_intern(%2638, %2639) : (i64, i64) -> i64
      %2641 = func.call @cc_nil_value() : () -> i64
      %2642 = func.call @cc_cons(%2640, %2641) : (i64, i64) -> i64
      %2643 = func.call @cc_values_pack(%2642) : (i64) -> i64
      func.call @stack_push_pointer(%2640) : (i64) -> ()
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @cc_nil_value() : () -> i64
      %2646 = func.call @cc_errorp(%2498) : (i64) -> i64
      %2647 = arith.cmpi ne, %2646, %2645 : i64
      %2648 = arith.cmpi eq, %2645, %2645 : i64
      %2649 = arith.andi %2647, %2648 : i1
      %2650 = scf.if %2649 -> (i64) {
        scf.yield %2498 : i64
      } else {
        scf.yield %2645 : i64
      }
      %2651 = func.call @cc_errorp(%2551) : (i64) -> i64
      %2652 = arith.cmpi ne, %2651, %2645 : i64
      %2653 = arith.cmpi eq, %2650, %2645 : i64
      %2654 = arith.andi %2652, %2653 : i1
      %2655 = scf.if %2654 -> (i64) {
        scf.yield %2551 : i64
      } else {
        scf.yield %2650 : i64
      }
      %2656 = func.call @cc_errorp(%2600) : (i64) -> i64
      %2657 = arith.cmpi ne, %2656, %2645 : i64
      %2658 = arith.cmpi eq, %2655, %2645 : i64
      %2659 = arith.andi %2657, %2658 : i1
      %2660 = scf.if %2659 -> (i64) {
        scf.yield %2600 : i64
      } else {
        scf.yield %2655 : i64
      }
      %2661 = func.call @cc_errorp(%2609) : (i64) -> i64
      %2662 = arith.cmpi ne, %2661, %2645 : i64
      %2663 = arith.cmpi eq, %2660, %2645 : i64
      %2664 = arith.andi %2662, %2663 : i1
      %2665 = scf.if %2664 -> (i64) {
        scf.yield %2609 : i64
      } else {
        scf.yield %2660 : i64
      }
      %2666 = func.call @cc_errorp(%2620) : (i64) -> i64
      %2667 = arith.cmpi ne, %2666, %2645 : i64
      %2668 = arith.cmpi eq, %2665, %2645 : i64
      %2669 = arith.andi %2667, %2668 : i1
      %2670 = scf.if %2669 -> (i64) {
        scf.yield %2620 : i64
      } else {
        scf.yield %2665 : i64
      }
      %2671 = func.call @cc_errorp(%2624) : (i64) -> i64
      %2672 = arith.cmpi ne, %2671, %2645 : i64
      %2673 = arith.cmpi eq, %2670, %2645 : i64
      %2674 = arith.andi %2672, %2673 : i1
      %2675 = scf.if %2674 -> (i64) {
        scf.yield %2624 : i64
      } else {
        scf.yield %2670 : i64
      }
      %2676 = func.call @cc_errorp(%2635) : (i64) -> i64
      %2677 = arith.cmpi ne, %2676, %2645 : i64
      %2678 = arith.cmpi eq, %2675, %2645 : i64
      %2679 = arith.andi %2677, %2678 : i1
      %2680 = scf.if %2679 -> (i64) {
        scf.yield %2635 : i64
      } else {
        scf.yield %2675 : i64
      }
      %2681 = func.call @cc_errorp(%2644) : (i64) -> i64
      %2682 = arith.cmpi ne, %2681, %2645 : i64
      %2683 = arith.cmpi eq, %2680, %2645 : i64
      %2684 = arith.andi %2682, %2683 : i1
      %2685 = scf.if %2684 -> (i64) {
        scf.yield %2644 : i64
      } else {
        scf.yield %2680 : i64
      }
      %2686 = arith.cmpi ne, %2685, %2645 : i64
      scf.if %2686 {
        func.call @stack_push_pointer(%2685) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2498) : (i64) -> ()
        func.call @stack_push_pointer(%2551) : (i64) -> ()
        func.call @stack_push_pointer(%2600) : (i64) -> ()
        func.call @stack_push_pointer(%2609) : (i64) -> ()
        func.call @stack_push_pointer(%2620) : (i64) -> ()
        func.call @stack_push_pointer(%2624) : (i64) -> ()
        func.call @stack_push_pointer(%2635) : (i64) -> ()
        func.call @stack_push_pointer(%2644) : (i64) -> ()
        %2687 = llvm.mlir.addressof @str196 : !llvm.ptr
        %2688 = func.call @cc_make_function_ref_const(%2687) : (!llvm.ptr) -> i64
        %2689 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2688, %2689) : (i64, i64) -> ()
      }
      %2690 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2690 : i64
    }
    %2691 = func.call @cc_nil_value() : () -> i64
    %2692 = func.call @cc_errorp(%2489) : (i64) -> i64
    %2693 = arith.cmpi ne, %2692, %2691 : i64
    %2694 = scf.if %2693 -> (i64) {
      scf.yield %2489 : i64
    } else {
      %2695 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2696 = arith.constant 25 : i64
      %2697 = func.call @cc_make_string(%2695, %2696) : (!llvm.ptr, i64) -> i64
      %2698 = func.call @cc_nil_value() : () -> i64
      %2699 = func.call @cc_intern(%2697, %2698) : (i64, i64) -> i64
      %2700 = func.call @cc_nil_value() : () -> i64
      %2701 = func.call @cc_cons(%2699, %2700) : (i64, i64) -> i64
      %2702 = func.call @cc_values_pack(%2701) : (i64) -> i64
      func.call @stack_push_pointer(%2699) : (i64) -> ()
      %2703 = func.call @stack_pop_pointer() : () -> i64
      %2704 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2705 = arith.constant 3 : i64
      %2706 = func.call @cc_make_string(%2704, %2705) : (!llvm.ptr, i64) -> i64
      %2707 = func.call @cc_nil_value() : () -> i64
      %2708 = func.call @cc_intern(%2706, %2707) : (i64, i64) -> i64
      %2709 = func.call @cc_nil_value() : () -> i64
      %2710 = func.call @cc_cons(%2708, %2709) : (i64, i64) -> i64
      %2711 = func.call @cc_values_pack(%2710) : (i64) -> i64
      func.call @stack_push_pointer(%2708) : (i64) -> ()
      %2712 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2713 = arith.constant 5 : i64
      %2714 = func.call @cc_make_string(%2712, %2713) : (!llvm.ptr, i64) -> i64
      %2715 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2716 = arith.constant 11 : i64
      %2717 = func.call @cc_make_string(%2715, %2716) : (!llvm.ptr, i64) -> i64
      %2718 = func.call @cc_intern(%2714, %2717) : (i64, i64) -> i64
      %2719 = func.call @cc_nil_value() : () -> i64
      %2720 = func.call @cc_cons(%2718, %2719) : (i64, i64) -> i64
      %2721 = func.call @cc_values_pack(%2720) : (i64) -> i64
      func.call @stack_push_pointer(%2718) : (i64) -> ()
      %2722 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2722) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2723 = func.call @stack_pop_pointer() : () -> i64
      %2724 = func.call @stack_pop_pointer() : () -> i64
      %2725 = func.call @cc_cons(%2724, %2723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2725) : (i64) -> ()
      %2726 = func.call @stack_pop_pointer() : () -> i64
      %2727 = func.call @stack_pop_pointer() : () -> i64
      %2728 = func.call @cc_cons(%2727, %2726) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2728) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2729 = func.call @stack_pop_pointer() : () -> i64
      %2730 = func.call @stack_pop_pointer() : () -> i64
      %2731 = func.call @cc_cons(%2730, %2729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2731) : (i64) -> ()
      %2732 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2733 = arith.constant 3 : i64
      %2734 = func.call @cc_make_string(%2732, %2733) : (!llvm.ptr, i64) -> i64
      %2735 = func.call @cc_nil_value() : () -> i64
      %2736 = func.call @cc_intern(%2734, %2735) : (i64, i64) -> i64
      %2737 = func.call @cc_nil_value() : () -> i64
      %2738 = func.call @cc_cons(%2736, %2737) : (i64, i64) -> i64
      %2739 = func.call @cc_values_pack(%2738) : (i64) -> i64
      func.call @stack_push_pointer(%2736) : (i64) -> ()
      %2740 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2741 = arith.constant 1 : i64
      %2742 = func.call @cc_make_string(%2740, %2741) : (!llvm.ptr, i64) -> i64
      %2743 = func.call @cc_nil_value() : () -> i64
      %2744 = func.call @cc_intern(%2742, %2743) : (i64, i64) -> i64
      %2745 = func.call @cc_nil_value() : () -> i64
      %2746 = func.call @cc_cons(%2744, %2745) : (i64, i64) -> i64
      %2747 = func.call @cc_values_pack(%2746) : (i64) -> i64
      func.call @stack_push_pointer(%2744) : (i64) -> ()
      %2748 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2749 = arith.constant 10 : i64
      %2750 = func.call @cc_make_string(%2748, %2749) : (!llvm.ptr, i64) -> i64
      %2751 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2752 = arith.constant 11 : i64
      %2753 = func.call @cc_make_string(%2751, %2752) : (!llvm.ptr, i64) -> i64
      %2754 = func.call @cc_intern(%2750, %2753) : (i64, i64) -> i64
      %2755 = func.call @cc_nil_value() : () -> i64
      %2756 = func.call @cc_cons(%2754, %2755) : (i64, i64) -> i64
      %2757 = func.call @cc_values_pack(%2756) : (i64) -> i64
      func.call @stack_push_pointer(%2754) : (i64) -> ()
      %2758 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2758) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2759 = func.call @stack_pop_pointer() : () -> i64
      %2760 = func.call @stack_pop_pointer() : () -> i64
      %2761 = func.call @cc_cons(%2760, %2759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2761) : (i64) -> ()
      %2762 = func.call @stack_pop_pointer() : () -> i64
      %2763 = func.call @stack_pop_pointer() : () -> i64
      %2764 = func.call @cc_cons(%2763, %2762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2764) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2765 = func.call @stack_pop_pointer() : () -> i64
      %2766 = func.call @stack_pop_pointer() : () -> i64
      %2767 = func.call @cc_cons(%2766, %2765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2767) : (i64) -> ()
      %2768 = func.call @stack_pop_pointer() : () -> i64
      %2769 = func.call @stack_pop_pointer() : () -> i64
      %2770 = func.call @cc_cons(%2769, %2768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2770) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2771 = func.call @stack_pop_pointer() : () -> i64
      %2772 = func.call @stack_pop_pointer() : () -> i64
      %2773 = func.call @cc_cons(%2772, %2771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2773) : (i64) -> ()
      %2774 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2775 = arith.constant 4 : i64
      %2776 = func.call @cc_make_string(%2774, %2775) : (!llvm.ptr, i64) -> i64
      %2777 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2778 = arith.constant 11 : i64
      %2779 = func.call @cc_make_string(%2777, %2778) : (!llvm.ptr, i64) -> i64
      %2780 = func.call @cc_intern(%2776, %2779) : (i64, i64) -> i64
      %2781 = func.call @cc_nil_value() : () -> i64
      %2782 = func.call @cc_cons(%2780, %2781) : (i64, i64) -> i64
      %2783 = func.call @cc_values_pack(%2782) : (i64) -> i64
      func.call @stack_push_pointer(%2780) : (i64) -> ()
      %2784 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2785 = arith.constant 3 : i64
      %2786 = func.call @cc_make_string(%2784, %2785) : (!llvm.ptr, i64) -> i64
      %2787 = func.call @cc_nil_value() : () -> i64
      %2788 = func.call @cc_intern(%2786, %2787) : (i64, i64) -> i64
      %2789 = func.call @cc_nil_value() : () -> i64
      %2790 = func.call @cc_cons(%2788, %2789) : (i64, i64) -> i64
      %2791 = func.call @cc_values_pack(%2790) : (i64) -> i64
      func.call @stack_push_pointer(%2788) : (i64) -> ()
      %2792 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2793 = arith.constant 1 : i64
      %2794 = func.call @cc_make_string(%2792, %2793) : (!llvm.ptr, i64) -> i64
      %2795 = func.call @cc_nil_value() : () -> i64
      %2796 = func.call @cc_intern(%2794, %2795) : (i64, i64) -> i64
      %2797 = func.call @cc_nil_value() : () -> i64
      %2798 = func.call @cc_cons(%2796, %2797) : (i64, i64) -> i64
      %2799 = func.call @cc_values_pack(%2798) : (i64) -> i64
      func.call @stack_push_pointer(%2796) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2800 = func.call @stack_pop_pointer() : () -> i64
      %2801 = func.call @stack_pop_pointer() : () -> i64
      %2802 = func.call @cc_cons(%2801, %2800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2802) : (i64) -> ()
      %2803 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2804 = arith.constant 7 : i64
      %2805 = func.call @cc_make_string(%2803, %2804) : (!llvm.ptr, i64) -> i64
      %2806 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2807 = arith.constant 11 : i64
      %2808 = func.call @cc_make_string(%2806, %2807) : (!llvm.ptr, i64) -> i64
      %2809 = func.call @cc_intern(%2805, %2808) : (i64, i64) -> i64
      %2810 = func.call @cc_nil_value() : () -> i64
      %2811 = func.call @cc_cons(%2809, %2810) : (i64, i64) -> i64
      %2812 = func.call @cc_values_pack(%2811) : (i64) -> i64
      func.call @stack_push_pointer(%2809) : (i64) -> ()
      %2813 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2814 = arith.constant 6 : i64
      %2815 = func.call @cc_make_string(%2813, %2814) : (!llvm.ptr, i64) -> i64
      %2816 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2817 = arith.constant 11 : i64
      %2818 = func.call @cc_make_string(%2816, %2817) : (!llvm.ptr, i64) -> i64
      %2819 = func.call @cc_intern(%2815, %2818) : (i64, i64) -> i64
      %2820 = func.call @cc_nil_value() : () -> i64
      %2821 = func.call @cc_cons(%2819, %2820) : (i64, i64) -> i64
      %2822 = func.call @cc_values_pack(%2821) : (i64) -> i64
      func.call @stack_push_pointer(%2819) : (i64) -> ()
      %2823 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2824 = arith.constant 1 : i64
      %2825 = func.call @cc_make_string(%2823, %2824) : (!llvm.ptr, i64) -> i64
      %2826 = func.call @cc_nil_value() : () -> i64
      %2827 = func.call @cc_intern(%2825, %2826) : (i64, i64) -> i64
      %2828 = func.call @cc_nil_value() : () -> i64
      %2829 = func.call @cc_cons(%2827, %2828) : (i64, i64) -> i64
      %2830 = func.call @cc_values_pack(%2829) : (i64) -> i64
      func.call @stack_push_pointer(%2827) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2831 = func.call @stack_pop_pointer() : () -> i64
      %2832 = func.call @stack_pop_pointer() : () -> i64
      %2833 = func.call @cc_cons(%2832, %2831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2833) : (i64) -> ()
      %2834 = func.call @stack_pop_pointer() : () -> i64
      %2835 = func.call @stack_pop_pointer() : () -> i64
      %2836 = func.call @cc_cons(%2835, %2834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2836) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2837 = func.call @stack_pop_pointer() : () -> i64
      %2838 = func.call @stack_pop_pointer() : () -> i64
      %2839 = func.call @cc_cons(%2838, %2837) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2839) : (i64) -> ()
      %2840 = func.call @stack_pop_pointer() : () -> i64
      %2841 = func.call @stack_pop_pointer() : () -> i64
      %2842 = func.call @cc_cons(%2841, %2840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2842) : (i64) -> ()
      %2843 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2844 = arith.constant 4 : i64
      %2845 = func.call @cc_make_string(%2843, %2844) : (!llvm.ptr, i64) -> i64
      %2846 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2847 = arith.constant 11 : i64
      %2848 = func.call @cc_make_string(%2846, %2847) : (!llvm.ptr, i64) -> i64
      %2849 = func.call @cc_intern(%2845, %2848) : (i64, i64) -> i64
      %2850 = func.call @cc_nil_value() : () -> i64
      %2851 = func.call @cc_cons(%2849, %2850) : (i64, i64) -> i64
      %2852 = func.call @cc_values_pack(%2851) : (i64) -> i64
      func.call @stack_push_pointer(%2849) : (i64) -> ()
      %2853 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2854 = arith.constant 5 : i64
      %2855 = func.call @cc_make_string(%2853, %2854) : (!llvm.ptr, i64) -> i64
      %2856 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2857 = arith.constant 11 : i64
      %2858 = func.call @cc_make_string(%2856, %2857) : (!llvm.ptr, i64) -> i64
      %2859 = func.call @cc_intern(%2855, %2858) : (i64, i64) -> i64
      %2860 = func.call @cc_nil_value() : () -> i64
      %2861 = func.call @cc_cons(%2859, %2860) : (i64, i64) -> i64
      %2862 = func.call @cc_values_pack(%2861) : (i64) -> i64
      func.call @stack_push_pointer(%2859) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2863 = func.call @stack_pop_pointer() : () -> i64
      %2864 = func.call @stack_pop_pointer() : () -> i64
      %2865 = func.call @cc_cons(%2864, %2863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2865) : (i64) -> ()
      %2866 = func.call @stack_pop_pointer() : () -> i64
      %2867 = func.call @stack_pop_pointer() : () -> i64
      %2868 = func.call @cc_cons(%2867, %2866) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2868) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2869 = func.call @stack_pop_pointer() : () -> i64
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @cc_cons(%2870, %2869) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2871) : (i64) -> ()
      %2872 = func.call @stack_pop_pointer() : () -> i64
      %2873 = func.call @stack_pop_pointer() : () -> i64
      %2874 = func.call @cc_cons(%2873, %2872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2874) : (i64) -> ()
      %2875 = func.call @stack_pop_pointer() : () -> i64
      %2876 = func.call @stack_pop_pointer() : () -> i64
      %2877 = func.call @cc_cons(%2876, %2875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2877) : (i64) -> ()
      %2878 = func.call @stack_pop_pointer() : () -> i64
      %2879 = func.call @stack_pop_pointer() : () -> i64
      %2880 = func.call @cc_cons(%2879, %2878) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2880) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2881 = func.call @stack_pop_pointer() : () -> i64
      %2882 = func.call @stack_pop_pointer() : () -> i64
      %2883 = func.call @cc_cons(%2882, %2881) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2883) : (i64) -> ()
      %2884 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2885 = arith.constant 4 : i64
      %2886 = func.call @cc_make_string(%2884, %2885) : (!llvm.ptr, i64) -> i64
      %2887 = func.call @cc_nil_value() : () -> i64
      %2888 = func.call @cc_intern(%2886, %2887) : (i64, i64) -> i64
      %2889 = func.call @cc_nil_value() : () -> i64
      %2890 = func.call @cc_cons(%2888, %2889) : (i64, i64) -> i64
      %2891 = func.call @cc_values_pack(%2890) : (i64) -> i64
      func.call @stack_push_pointer(%2888) : (i64) -> ()
      %2892 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2893 = arith.constant 6 : i64
      %2894 = func.call @cc_make_string(%2892, %2893) : (!llvm.ptr, i64) -> i64
      %2895 = func.call @cc_nil_value() : () -> i64
      %2896 = func.call @cc_intern(%2894, %2895) : (i64, i64) -> i64
      %2897 = func.call @cc_nil_value() : () -> i64
      %2898 = func.call @cc_cons(%2896, %2897) : (i64, i64) -> i64
      %2899 = func.call @cc_values_pack(%2898) : (i64) -> i64
      func.call @stack_push_pointer(%2896) : (i64) -> ()
      %2900 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2900) : (i64) -> ()
      %2901 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2902 = arith.constant 2 : i64
      %2903 = func.call @cc_make_string(%2901, %2902) : (!llvm.ptr, i64) -> i64
      %2904 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2905 = arith.constant 11 : i64
      %2906 = func.call @cc_make_string(%2904, %2905) : (!llvm.ptr, i64) -> i64
      %2907 = func.call @cc_intern(%2903, %2906) : (i64, i64) -> i64
      %2908 = func.call @cc_nil_value() : () -> i64
      %2909 = func.call @cc_cons(%2907, %2908) : (i64, i64) -> i64
      %2910 = func.call @cc_values_pack(%2909) : (i64) -> i64
      func.call @stack_push_pointer(%2907) : (i64) -> ()
      %2911 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2912 = arith.constant 8 : i64
      %2913 = func.call @cc_make_string(%2911, %2912) : (!llvm.ptr, i64) -> i64
      %2914 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2915 = arith.constant 7 : i64
      %2916 = func.call @cc_make_string(%2914, %2915) : (!llvm.ptr, i64) -> i64
      %2917 = func.call @cc_intern(%2913, %2916) : (i64, i64) -> i64
      %2918 = func.call @cc_nil_value() : () -> i64
      %2919 = func.call @cc_cons(%2917, %2918) : (i64, i64) -> i64
      %2920 = func.call @cc_values_pack(%2919) : (i64) -> i64
      func.call @stack_push_pointer(%2917) : (i64) -> ()
      %2921 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2922 = arith.constant 1 : i64
      %2923 = func.call @cc_make_string(%2921, %2922) : (!llvm.ptr, i64) -> i64
      %2924 = func.call @cc_nil_value() : () -> i64
      %2925 = func.call @cc_intern(%2923, %2924) : (i64, i64) -> i64
      %2926 = func.call @cc_nil_value() : () -> i64
      %2927 = func.call @cc_cons(%2925, %2926) : (i64, i64) -> i64
      %2928 = func.call @cc_values_pack(%2927) : (i64) -> i64
      func.call @stack_push_pointer(%2925) : (i64) -> ()
      %2929 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2930 = arith.constant 8 : i64
      %2931 = func.call @cc_make_string(%2929, %2930) : (!llvm.ptr, i64) -> i64
      %2932 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2933 = arith.constant 11 : i64
      %2934 = func.call @cc_make_string(%2932, %2933) : (!llvm.ptr, i64) -> i64
      %2935 = func.call @cc_intern(%2931, %2934) : (i64, i64) -> i64
      %2936 = func.call @cc_nil_value() : () -> i64
      %2937 = func.call @cc_cons(%2935, %2936) : (i64, i64) -> i64
      %2938 = func.call @cc_values_pack(%2937) : (i64) -> i64
      func.call @stack_push_pointer(%2935) : (i64) -> ()
      %2939 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2940 = arith.constant 3 : i64
      %2941 = func.call @cc_make_string(%2939, %2940) : (!llvm.ptr, i64) -> i64
      %2942 = func.call @cc_nil_value() : () -> i64
      %2943 = func.call @cc_intern(%2941, %2942) : (i64, i64) -> i64
      %2944 = func.call @cc_nil_value() : () -> i64
      %2945 = func.call @cc_cons(%2943, %2944) : (i64, i64) -> i64
      %2946 = func.call @cc_values_pack(%2945) : (i64) -> i64
      func.call @stack_push_pointer(%2943) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2947 = func.call @stack_pop_pointer() : () -> i64
      %2948 = func.call @stack_pop_pointer() : () -> i64
      %2949 = func.call @cc_cons(%2948, %2947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2949) : (i64) -> ()
      %2950 = func.call @stack_pop_pointer() : () -> i64
      %2951 = func.call @stack_pop_pointer() : () -> i64
      %2952 = func.call @cc_cons(%2951, %2950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2952) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2953 = func.call @stack_pop_pointer() : () -> i64
      %2954 = func.call @stack_pop_pointer() : () -> i64
      %2955 = func.call @cc_cons(%2954, %2953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2955) : (i64) -> ()
      %2956 = func.call @stack_pop_pointer() : () -> i64
      %2957 = func.call @stack_pop_pointer() : () -> i64
      %2958 = func.call @cc_cons(%2957, %2956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2958) : (i64) -> ()
      %2959 = func.call @stack_pop_pointer() : () -> i64
      %2960 = func.call @stack_pop_pointer() : () -> i64
      %2961 = func.call @cc_cons(%2960, %2959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2962 = func.call @stack_pop_pointer() : () -> i64
      %2963 = func.call @stack_pop_pointer() : () -> i64
      %2964 = func.call @cc_cons(%2963, %2962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2964) : (i64) -> ()
      %2965 = func.call @stack_pop_pointer() : () -> i64
      %2966 = func.call @stack_pop_pointer() : () -> i64
      %2967 = func.call @cc_cons(%2966, %2965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2967) : (i64) -> ()
      %2968 = func.call @stack_pop_pointer() : () -> i64
      %2969 = func.call @stack_pop_pointer() : () -> i64
      %2970 = func.call @cc_cons(%2969, %2968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2970) : (i64) -> ()
      %2971 = func.call @stack_pop_pointer() : () -> i64
      %2972 = func.call @stack_pop_pointer() : () -> i64
      %2973 = func.call @cc_cons(%2972, %2971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2973) : (i64) -> ()
      %2974 = func.call @stack_pop_pointer() : () -> i64
      %2975 = func.call @stack_pop_pointer() : () -> i64
      %2976 = func.call @cc_cons(%2975, %2974) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2976) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2977 = func.call @stack_pop_pointer() : () -> i64
      %2978 = func.call @stack_pop_pointer() : () -> i64
      %2979 = func.call @cc_cons(%2978, %2977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2979) : (i64) -> ()
      %2980 = func.call @stack_pop_pointer() : () -> i64
      %2981 = func.call @stack_pop_pointer() : () -> i64
      %2982 = func.call @cc_cons(%2981, %2980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2982) : (i64) -> ()
      %2983 = func.call @stack_pop_pointer() : () -> i64
      %2984 = func.call @stack_pop_pointer() : () -> i64
      %2985 = func.call @cc_cons(%2984, %2983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2985) : (i64) -> ()
      %2986 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2987 = arith.constant 10 : i64
      %2988 = func.call @cc_make_string(%2986, %2987) : (!llvm.ptr, i64) -> i64
      %2989 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2990 = arith.constant 7 : i64
      %2991 = func.call @cc_make_string(%2989, %2990) : (!llvm.ptr, i64) -> i64
      %2992 = func.call @cc_intern(%2988, %2991) : (i64, i64) -> i64
      %2993 = func.call @cc_nil_value() : () -> i64
      %2994 = func.call @cc_cons(%2992, %2993) : (i64, i64) -> i64
      %2995 = func.call @cc_values_pack(%2994) : (i64) -> i64
      func.call @stack_push_pointer(%2992) : (i64) -> ()
      %2996 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2997 = arith.constant 1 : i64
      %2998 = func.call @cc_make_string(%2996, %2997) : (!llvm.ptr, i64) -> i64
      %2999 = func.call @cc_nil_value() : () -> i64
      %3000 = func.call @cc_intern(%2998, %2999) : (i64, i64) -> i64
      %3001 = func.call @cc_nil_value() : () -> i64
      %3002 = func.call @cc_cons(%3000, %3001) : (i64, i64) -> i64
      %3003 = func.call @cc_values_pack(%3002) : (i64) -> i64
      func.call @stack_push_pointer(%3000) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3004 = func.call @stack_pop_pointer() : () -> i64
      %3005 = func.call @stack_pop_pointer() : () -> i64
      %3006 = func.call @cc_cons(%3005, %3004) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3006) : (i64) -> ()
      %3007 = func.call @stack_pop_pointer() : () -> i64
      %3008 = func.call @stack_pop_pointer() : () -> i64
      %3009 = func.call @cc_cons(%3008, %3007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3009) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3010 = func.call @stack_pop_pointer() : () -> i64
      %3011 = func.call @stack_pop_pointer() : () -> i64
      %3012 = func.call @cc_cons(%3011, %3010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3012) : (i64) -> ()
      %3013 = func.call @stack_pop_pointer() : () -> i64
      %3014 = func.call @stack_pop_pointer() : () -> i64
      %3015 = func.call @cc_cons(%3014, %3013) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3015) : (i64) -> ()
      %3016 = func.call @stack_pop_pointer() : () -> i64
      %3017 = func.call @stack_pop_pointer() : () -> i64
      %3018 = func.call @cc_cons(%3017, %3016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3018) : (i64) -> ()
      %3019 = func.call @stack_pop_pointer() : () -> i64
      %3020 = func.call @stack_pop_pointer() : () -> i64
      %3021 = func.call @cc_cons(%3020, %3019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3021) : (i64) -> ()
      %3022 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3023 = arith.constant 4 : i64
      %3024 = func.call @cc_make_string(%3022, %3023) : (!llvm.ptr, i64) -> i64
      %3025 = func.call @cc_nil_value() : () -> i64
      %3026 = func.call @cc_intern(%3024, %3025) : (i64, i64) -> i64
      %3027 = func.call @cc_nil_value() : () -> i64
      %3028 = func.call @cc_cons(%3026, %3027) : (i64, i64) -> i64
      %3029 = func.call @cc_values_pack(%3028) : (i64) -> i64
      func.call @stack_push_pointer(%3026) : (i64) -> ()
      %3030 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3031 = arith.constant 6 : i64
      %3032 = func.call @cc_make_string(%3030, %3031) : (!llvm.ptr, i64) -> i64
      %3033 = func.call @cc_nil_value() : () -> i64
      %3034 = func.call @cc_intern(%3032, %3033) : (i64, i64) -> i64
      %3035 = func.call @cc_nil_value() : () -> i64
      %3036 = func.call @cc_cons(%3034, %3035) : (i64, i64) -> i64
      %3037 = func.call @cc_values_pack(%3036) : (i64) -> i64
      func.call @stack_push_pointer(%3034) : (i64) -> ()
      %3038 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%3038) : (i64) -> ()
      %3039 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3040 = arith.constant 2 : i64
      %3041 = func.call @cc_make_string(%3039, %3040) : (!llvm.ptr, i64) -> i64
      %3042 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3043 = arith.constant 11 : i64
      %3044 = func.call @cc_make_string(%3042, %3043) : (!llvm.ptr, i64) -> i64
      %3045 = func.call @cc_intern(%3041, %3044) : (i64, i64) -> i64
      %3046 = func.call @cc_nil_value() : () -> i64
      %3047 = func.call @cc_cons(%3045, %3046) : (i64, i64) -> i64
      %3048 = func.call @cc_values_pack(%3047) : (i64) -> i64
      func.call @stack_push_pointer(%3045) : (i64) -> ()
      %3049 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3050 = arith.constant 15 : i64
      %3051 = func.call @cc_make_string(%3049, %3050) : (!llvm.ptr, i64) -> i64
      %3052 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3053 = arith.constant 7 : i64
      %3054 = func.call @cc_make_string(%3052, %3053) : (!llvm.ptr, i64) -> i64
      %3055 = func.call @cc_intern(%3051, %3054) : (i64, i64) -> i64
      %3056 = func.call @cc_nil_value() : () -> i64
      %3057 = func.call @cc_cons(%3055, %3056) : (i64, i64) -> i64
      %3058 = func.call @cc_values_pack(%3057) : (i64) -> i64
      func.call @stack_push_pointer(%3055) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3059 = func.call @stack_pop_pointer() : () -> i64
      %3060 = func.call @stack_pop_pointer() : () -> i64
      %3061 = func.call @cc_cons(%3060, %3059) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3061) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3062 = func.call @stack_pop_pointer() : () -> i64
      %3063 = func.call @stack_pop_pointer() : () -> i64
      %3064 = func.call @cc_cons(%3063, %3062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3064) : (i64) -> ()
      %3065 = func.call @stack_pop_pointer() : () -> i64
      %3066 = func.call @stack_pop_pointer() : () -> i64
      %3067 = func.call @cc_cons(%3066, %3065) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3067) : (i64) -> ()
      %3068 = func.call @stack_pop_pointer() : () -> i64
      %3069 = func.call @stack_pop_pointer() : () -> i64
      %3070 = func.call @cc_cons(%3069, %3068) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3070) : (i64) -> ()
      %3071 = func.call @stack_pop_pointer() : () -> i64
      %3072 = func.call @stack_pop_pointer() : () -> i64
      %3073 = func.call @cc_cons(%3072, %3071) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3073) : (i64) -> ()
      %3074 = func.call @stack_pop_pointer() : () -> i64
      %3075 = func.call @stack_pop_pointer() : () -> i64
      %3076 = func.call @cc_cons(%3075, %3074) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3076) : (i64) -> ()
      %3077 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3078 = arith.constant 5 : i64
      %3079 = func.call @cc_make_string(%3077, %3078) : (!llvm.ptr, i64) -> i64
      %3080 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3081 = arith.constant 11 : i64
      %3082 = func.call @cc_make_string(%3080, %3081) : (!llvm.ptr, i64) -> i64
      %3083 = func.call @cc_intern(%3079, %3082) : (i64, i64) -> i64
      %3084 = func.call @cc_nil_value() : () -> i64
      %3085 = func.call @cc_cons(%3083, %3084) : (i64, i64) -> i64
      %3086 = func.call @cc_values_pack(%3085) : (i64) -> i64
      func.call @stack_push_pointer(%3083) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3087 = func.call @stack_pop_pointer() : () -> i64
      %3088 = func.call @stack_pop_pointer() : () -> i64
      %3089 = func.call @cc_cons(%3088, %3087) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3089) : (i64) -> ()
      %3090 = func.call @stack_pop_pointer() : () -> i64
      %3091 = func.call @stack_pop_pointer() : () -> i64
      %3092 = func.call @cc_cons(%3091, %3090) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3092) : (i64) -> ()
      %3093 = func.call @stack_pop_pointer() : () -> i64
      %3094 = func.call @stack_pop_pointer() : () -> i64
      %3095 = func.call @cc_cons(%3094, %3093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3095) : (i64) -> ()
      %3096 = func.call @stack_pop_pointer() : () -> i64
      %3097 = func.call @stack_pop_pointer() : () -> i64
      %3098 = func.call @cc_cons(%3097, %3096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3098) : (i64) -> ()
      %3099 = func.call @stack_pop_pointer() : () -> i64
      %3100 = func.call @stack_pop_pointer() : () -> i64
      %3101 = func.call @cc_cons(%3100, %3099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3101) : (i64) -> ()
      %3102 = func.call @stack_pop_pointer() : () -> i64
      %3573 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3574 = arith.constant 30 : i64
      %3575 = func.call @cc_make_symbol(%3573, %3574) : (!llvm.ptr, i64) -> i64
      %3576 = func.call @cc_persistent_root_value(%3575) : (i64) -> i64
      func.call @stack_push_pointer(%3576) : (i64) -> ()
      %3577 = arith.constant 236837129945110 : i64
      %3578 = arith.constant 1 : i64
      %3579 = func.call @cc_make_closure(%3577, %3578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3579) : (i64) -> ()
      %3580 = func.call @stack_pop_pointer() : () -> i64
      %3581 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3581) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = func.call @stack_pop_pointer() : () -> i64
      %3584 = func.call @cc_cons(%3583, %3582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3584) : (i64) -> ()
      %3585 = func.call @stack_pop_pointer() : () -> i64
      %3586 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3587 = arith.constant 11 : i64
      %3588 = func.call @cc_make_string(%3586, %3587) : (!llvm.ptr, i64) -> i64
      %3589 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3590 = arith.constant 7 : i64
      %3591 = func.call @cc_make_string(%3589, %3590) : (!llvm.ptr, i64) -> i64
      %3592 = func.call @cc_intern(%3588, %3591) : (i64, i64) -> i64
      %3593 = func.call @cc_nil_value() : () -> i64
      %3594 = func.call @cc_cons(%3592, %3593) : (i64, i64) -> i64
      %3595 = func.call @cc_values_pack(%3594) : (i64) -> i64
      func.call @stack_push_pointer(%3592) : (i64) -> ()
      %3596 = func.call @stack_pop_pointer() : () -> i64
      %3597 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3598 = arith.constant 50 : i64
      %3599 = func.call @cc_make_string(%3597, %3598) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3599) : (i64) -> ()
      %3600 = func.call @stack_pop_pointer() : () -> i64
      %3601 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3602 = arith.constant 4 : i64
      %3603 = func.call @cc_make_string(%3601, %3602) : (!llvm.ptr, i64) -> i64
      %3604 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3605 = arith.constant 7 : i64
      %3606 = func.call @cc_make_string(%3604, %3605) : (!llvm.ptr, i64) -> i64
      %3607 = func.call @cc_intern(%3603, %3606) : (i64, i64) -> i64
      %3608 = func.call @cc_nil_value() : () -> i64
      %3609 = func.call @cc_cons(%3607, %3608) : (i64, i64) -> i64
      %3610 = func.call @cc_values_pack(%3609) : (i64) -> i64
      func.call @stack_push_pointer(%3607) : (i64) -> ()
      %3611 = func.call @stack_pop_pointer() : () -> i64
      %3612 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3613 = arith.constant 6 : i64
      %3614 = func.call @cc_make_string(%3612, %3613) : (!llvm.ptr, i64) -> i64
      %3615 = func.call @cc_nil_value() : () -> i64
      %3616 = func.call @cc_intern(%3614, %3615) : (i64, i64) -> i64
      %3617 = func.call @cc_nil_value() : () -> i64
      %3618 = func.call @cc_cons(%3616, %3617) : (i64, i64) -> i64
      %3619 = func.call @cc_values_pack(%3618) : (i64) -> i64
      func.call @stack_push_pointer(%3616) : (i64) -> ()
      %3620 = func.call @stack_pop_pointer() : () -> i64
      %3621 = func.call @cc_nil_value() : () -> i64
      %3622 = func.call @cc_errorp(%2703) : (i64) -> i64
      %3623 = arith.cmpi ne, %3622, %3621 : i64
      %3624 = arith.cmpi eq, %3621, %3621 : i64
      %3625 = arith.andi %3623, %3624 : i1
      %3626 = scf.if %3625 -> (i64) {
        scf.yield %2703 : i64
      } else {
        scf.yield %3621 : i64
      }
      %3627 = func.call @cc_errorp(%3102) : (i64) -> i64
      %3628 = arith.cmpi ne, %3627, %3621 : i64
      %3629 = arith.cmpi eq, %3626, %3621 : i64
      %3630 = arith.andi %3628, %3629 : i1
      %3631 = scf.if %3630 -> (i64) {
        scf.yield %3102 : i64
      } else {
        scf.yield %3626 : i64
      }
      %3632 = func.call @cc_errorp(%3580) : (i64) -> i64
      %3633 = arith.cmpi ne, %3632, %3621 : i64
      %3634 = arith.cmpi eq, %3631, %3621 : i64
      %3635 = arith.andi %3633, %3634 : i1
      %3636 = scf.if %3635 -> (i64) {
        scf.yield %3580 : i64
      } else {
        scf.yield %3631 : i64
      }
      %3637 = func.call @cc_errorp(%3585) : (i64) -> i64
      %3638 = arith.cmpi ne, %3637, %3621 : i64
      %3639 = arith.cmpi eq, %3636, %3621 : i64
      %3640 = arith.andi %3638, %3639 : i1
      %3641 = scf.if %3640 -> (i64) {
        scf.yield %3585 : i64
      } else {
        scf.yield %3636 : i64
      }
      %3642 = func.call @cc_errorp(%3596) : (i64) -> i64
      %3643 = arith.cmpi ne, %3642, %3621 : i64
      %3644 = arith.cmpi eq, %3641, %3621 : i64
      %3645 = arith.andi %3643, %3644 : i1
      %3646 = scf.if %3645 -> (i64) {
        scf.yield %3596 : i64
      } else {
        scf.yield %3641 : i64
      }
      %3647 = func.call @cc_errorp(%3600) : (i64) -> i64
      %3648 = arith.cmpi ne, %3647, %3621 : i64
      %3649 = arith.cmpi eq, %3646, %3621 : i64
      %3650 = arith.andi %3648, %3649 : i1
      %3651 = scf.if %3650 -> (i64) {
        scf.yield %3600 : i64
      } else {
        scf.yield %3646 : i64
      }
      %3652 = func.call @cc_errorp(%3611) : (i64) -> i64
      %3653 = arith.cmpi ne, %3652, %3621 : i64
      %3654 = arith.cmpi eq, %3651, %3621 : i64
      %3655 = arith.andi %3653, %3654 : i1
      %3656 = scf.if %3655 -> (i64) {
        scf.yield %3611 : i64
      } else {
        scf.yield %3651 : i64
      }
      %3657 = func.call @cc_errorp(%3620) : (i64) -> i64
      %3658 = arith.cmpi ne, %3657, %3621 : i64
      %3659 = arith.cmpi eq, %3656, %3621 : i64
      %3660 = arith.andi %3658, %3659 : i1
      %3661 = scf.if %3660 -> (i64) {
        scf.yield %3620 : i64
      } else {
        scf.yield %3656 : i64
      }
      %3662 = arith.cmpi ne, %3661, %3621 : i64
      scf.if %3662 {
        func.call @stack_push_pointer(%3661) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2703) : (i64) -> ()
        func.call @stack_push_pointer(%3102) : (i64) -> ()
        func.call @stack_push_pointer(%3580) : (i64) -> ()
        func.call @stack_push_pointer(%3585) : (i64) -> ()
        func.call @stack_push_pointer(%3596) : (i64) -> ()
        func.call @stack_push_pointer(%3600) : (i64) -> ()
        func.call @stack_push_pointer(%3611) : (i64) -> ()
        func.call @stack_push_pointer(%3620) : (i64) -> ()
        %3663 = llvm.mlir.addressof @str268 : !llvm.ptr
        %3664 = func.call @cc_make_function_ref_const(%3663) : (!llvm.ptr) -> i64
        %3665 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3664, %3665) : (i64, i64) -> ()
      }
      %3666 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3666 : i64
    }
    func.call @stack_push_pointer(%2694) : (i64) -> ()
    %3667 = func.call @stack_pop_pointer() : () -> i64
    %3668 = func.call @cc_multiple_value_list(%3667) : (i64) -> i64
    %3669 = llvm.mlir.addressof @str269 : !llvm.ptr
    %3670 = arith.constant 38 : i64
    %3671 = func.call @cc_make_string(%3669, %3670) : (!llvm.ptr, i64) -> i64
    %3672 = func.call @cc_nil_value() : () -> i64
    %3673 = func.call @cc_intern(%3671, %3672) : (i64, i64) -> i64
    %3674 = func.call @cc_nil_value() : () -> i64
    %3675 = func.call @cc_cons(%3673, %3674) : (i64, i64) -> i64
    %3676 = func.call @cc_values_pack(%3675) : (i64) -> i64
    %3677 = func.call @cc_symbol_value(%3673) : (i64) -> i64
    %3678 = llvm.mlir.addressof @str270 : !llvm.ptr
    %3679 = arith.constant 40 : i64
    %3680 = func.call @cc_make_string(%3678, %3679) : (!llvm.ptr, i64) -> i64
    %3681 = func.call @cc_nil_value() : () -> i64
    %3682 = func.call @cc_intern(%3680, %3681) : (i64, i64) -> i64
    %3683 = func.call @cc_nil_value() : () -> i64
    %3684 = func.call @cc_cons(%3682, %3683) : (i64, i64) -> i64
    %3685 = func.call @cc_values_pack(%3684) : (i64) -> i64
    %3686 = func.call @cc_symbol_value(%3682) : (i64) -> i64
    %3687 = func.call @cc_nil_value() : () -> i64
    %3688 = arith.cmpi ne, %3677, %3687 : i64
    %3689 = scf.if %3688 -> (i64) {
      scf.yield %3686 : i64
    } else {
      scf.yield %3668 : i64
    }
    %3690 = func.call @cc_values_pack(%3689) : (i64) -> i64
    func.call @stack_push_pointer(%3690) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_236837129945092"() {
    %95 = func.call @stack_pop_pointer() : () -> i64
    %96 = func.call @stack_pop_pointer() : () -> i64
    %97 = func.call @cc_nil_value() : () -> i64
    %98 = func.call @cc_nil_value() : () -> i64
    %99 = func.call @cc_errorp(%97) : (i64) -> i64
    %100 = arith.cmpi ne, %99, %98 : i64
    %101 = scf.if %100 -> (i64) {
      scf.yield %97 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %102 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %102 : i64
    }
    %103 = func.call @cc_nil_value() : () -> i64
    %104 = func.call @cc_errorp(%101) : (i64) -> i64
    %105 = arith.cmpi ne, %104, %103 : i64
    %106 = scf.if %105 -> (i64) {
      scf.yield %101 : i64
    } else {
      %107 = func.call @cc_symbol_value(%96) : (i64) -> i64
      func.call @stack_push_pointer(%107) : (i64) -> ()
      %108 = func.call @stack_pop_pointer() : () -> i64
      %109 = func.call @cc_car(%108) : (i64) -> i64
      func.call @stack_push_pointer(%109) : (i64) -> ()
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = arith.constant 1 : i64
      %112 = func.call @cc_box_fixnum(%111) : (i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %113 = func.call @stack_pop_pointer() : () -> i64
      %115 = arith.constant 3 : i64
      %114 = arith.andi %110, %115 : i64
      %116 = arith.constant 0 : i64
      %117 = arith.cmpi eq, %114, %116 : i64
      %119 = arith.constant 3 : i64
      %118 = arith.andi %113, %119 : i64
      %120 = arith.constant 0 : i64
      %121 = arith.cmpi eq, %118, %120 : i64
      %122 = arith.andi %117, %121 : i1
      %123 = scf.if %122 -> (i64) {
        %124 = arith.constant 2 : i64
        %125 = arith.shrsi %110, %124 : i64
        %126 = arith.constant 2 : i64
        %127 = arith.shrsi %113, %126 : i64
        %128 = arith.addi %125, %127 : i64
        %129 = arith.constant -2305843009213693952 : i64
        %130 = arith.constant 2305843009213693951 : i64
        %131 = arith.cmpi sge, %128, %129 : i64
        %132 = arith.cmpi sle, %128, %130 : i64
        %133 = arith.andi %131, %132 : i1
        %134 = scf.if %133 -> (i64) {
          %135 = arith.constant 2 : i64
          %136 = arith.shli %128, %135 : i64
          scf.yield %136 : i64
        } else {
          %137 = func.call @cc_add(%110, %113) : (i64, i64) -> i64
          scf.yield %137 : i64
        }
        scf.yield %134 : i64
      } else {
        %138 = func.call @cc_add(%110, %113) : (i64, i64) -> i64
        scf.yield %138 : i64
      }
      %139 = func.call @cc_symbol_value(%96) : (i64) -> i64
      func.call @stack_push_pointer(%139) : (i64) -> ()
      %140 = func.call @stack_pop_pointer() : () -> i64
      %141 = func.call @cc_set_car(%140, %123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%141) : (i64) -> ()
      %142 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %142 : i64
    }
    func.call @stack_push_pointer(%106) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945094"() {
    %383 = func.call @stack_pop_pointer() : () -> i64
    %384 = func.call @cc_nil_value() : () -> i64
    %385 = func.call @cc_nil_value() : () -> i64
    %386 = func.call @cc_errorp(%384) : (i64) -> i64
    %387 = arith.cmpi ne, %386, %385 : i64
    %388 = scf.if %387 -> (i64) {
      scf.yield %384 : i64
    } else {
      %389 = func.call @cc_symbol_value(%383) : (i64) -> i64
      func.call @stack_push_pointer(%389) : (i64) -> ()
      %390 = func.call @stack_pop_pointer() : () -> i64
      %391 = func.call @cc_car(%390) : (i64) -> i64
      func.call @stack_push_pointer(%391) : (i64) -> ()
      %392 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%392) : (i64) -> ()
      %393 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %393 : i64
    }
    func.call @stack_push_pointer(%388) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945100"() {
    %1390 = func.call @cc_nil_value() : () -> i64
    %1391 = func.call @cc_nil_value() : () -> i64
    %1392 = func.call @cc_errorp(%1390) : (i64) -> i64
    %1393 = arith.cmpi ne, %1392, %1391 : i64
    %1394 = scf.if %1393 -> (i64) {
      scf.yield %1390 : i64
    } else {
      %1395 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%1395) : (i64) -> ()
      %1396 = func.call @stack_pop_pointer() : () -> i64
      %1397 = func.call @cc_unbox_fixnum(%1396) : (i64) -> i64
      %1398 = func.call @cc_nil_value() : () -> i64
      %1399 = func.call @cc_make_list(%1396) : (i64) -> i64
      func.call @stack_push_pointer(%1399) : (i64) -> ()
      %1400 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1400 : i64
    }
    func.call @stack_push_pointer(%1394) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945099"() {
    %1385 = func.call @cc_nil_value() : () -> i64
    %1386 = func.call @cc_nil_value() : () -> i64
    %1387 = func.call @cc_errorp(%1385) : (i64) -> i64
    %1388 = arith.cmpi ne, %1387, %1386 : i64
    %1389 = scf.if %1388 -> (i64) {
      scf.yield %1385 : i64
    } else {
      %1401 = arith.constant 236837129945100 : i64
      %1402 = arith.constant 0 : i64
      %1403 = func.call @cc_make_closure(%1401, %1402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1403) : (i64) -> ()
      %1404 = func.call @stack_pop_pointer() : () -> i64
      %1405 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%1405) : (i64) -> ()
      %1406 = func.call @stack_pop_pointer() : () -> i64
      %1407 = func.call @cc_nil_value() : () -> i64
      %1408 = func.call @cc_errorp(%1404) : (i64) -> i64
      %1409 = arith.cmpi ne, %1408, %1407 : i64
      %1410 = arith.cmpi eq, %1407, %1407 : i64
      %1411 = arith.andi %1409, %1410 : i1
      %1412 = scf.if %1411 -> (i64) {
        scf.yield %1404 : i64
      } else {
        scf.yield %1407 : i64
      }
      %1413 = func.call @cc_errorp(%1406) : (i64) -> i64
      %1414 = arith.cmpi ne, %1413, %1407 : i64
      %1415 = arith.cmpi eq, %1412, %1407 : i64
      %1416 = arith.andi %1414, %1415 : i1
      %1417 = scf.if %1416 -> (i64) {
        scf.yield %1406 : i64
      } else {
        scf.yield %1412 : i64
      }
      %1418 = arith.cmpi ne, %1417, %1407 : i64
      scf.if %1418 {
        func.call @stack_push_pointer(%1417) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1404) : (i64) -> ()
        func.call @stack_push_pointer(%1406) : (i64) -> ()
        %1419 = llvm.mlir.addressof @str104 : !llvm.ptr
        %1420 = func.call @cc_make_function_ref_const(%1419) : (!llvm.ptr) -> i64
        %1421 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1420, %1421) : (i64, i64) -> ()
      }
      %1422 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1422 : i64
    }
    func.call @stack_push_pointer(%1389) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945104"() {
    %1958 = func.call @stack_pop_pointer() : () -> i64
    %1959 = func.call @stack_pop_pointer() : () -> i64
    %1960 = func.call @cc_nil_value() : () -> i64
    %1961 = func.call @cc_nil_value() : () -> i64
    %1962 = func.call @cc_errorp(%1960) : (i64) -> i64
    %1963 = arith.cmpi ne, %1962, %1961 : i64
    %1964 = scf.if %1963 -> (i64) {
      scf.yield %1960 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1965 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1965 : i64
    }
    %1966 = func.call @cc_nil_value() : () -> i64
    %1967 = func.call @cc_errorp(%1964) : (i64) -> i64
    %1968 = arith.cmpi ne, %1967, %1966 : i64
    %1969 = scf.if %1968 -> (i64) {
      scf.yield %1964 : i64
    } else {
      %1970 = func.call @cc_symbol_value(%1959) : (i64) -> i64
      func.call @stack_push_pointer(%1970) : (i64) -> ()
      %1971 = func.call @stack_pop_pointer() : () -> i64
      %1972 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1972) : (i64) -> ()
      %1973 = func.call @stack_pop_pointer() : () -> i64
      %1975 = arith.constant 3 : i64
      %1974 = arith.andi %1971, %1975 : i64
      %1976 = arith.constant 0 : i64
      %1977 = arith.cmpi eq, %1974, %1976 : i64
      %1979 = arith.constant 3 : i64
      %1978 = arith.andi %1973, %1979 : i64
      %1980 = arith.constant 0 : i64
      %1981 = arith.cmpi eq, %1978, %1980 : i64
      %1982 = arith.andi %1977, %1981 : i1
      %1983 = scf.if %1982 -> (i64) {
        %1984 = arith.constant 2 : i64
        %1985 = arith.shrsi %1971, %1984 : i64
        %1986 = arith.constant 2 : i64
        %1987 = arith.shrsi %1973, %1986 : i64
        %1988 = arith.addi %1985, %1987 : i64
        %1989 = arith.constant -2305843009213693952 : i64
        %1990 = arith.constant 2305843009213693951 : i64
        %1991 = arith.cmpi sge, %1988, %1989 : i64
        %1992 = arith.cmpi sle, %1988, %1990 : i64
        %1993 = arith.andi %1991, %1992 : i1
        %1994 = scf.if %1993 -> (i64) {
          %1995 = arith.constant 2 : i64
          %1996 = arith.shli %1988, %1995 : i64
          scf.yield %1996 : i64
        } else {
          %1997 = func.call @cc_add(%1971, %1973) : (i64, i64) -> i64
          scf.yield %1997 : i64
        }
        scf.yield %1994 : i64
      } else {
        %1998 = func.call @cc_add(%1971, %1973) : (i64, i64) -> i64
        scf.yield %1998 : i64
      }
      func.call @stack_push_pointer(%1983) : (i64) -> ()
      %1999 = func.call @stack_pop_pointer() : () -> i64
      %2000 = func.call @cc_set_symbol_value(%1959, %1999) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1999) : (i64) -> ()
      %2001 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2001 : i64
    }
    func.call @stack_push_pointer(%1969) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945101"() {
    %1929 = func.call @stack_pop_pointer() : () -> i64
    %1930 = func.call @cc_nil_value() : () -> i64
    %1931 = func.call @cc_nil_value() : () -> i64
    %1932 = func.call @cc_errorp(%1930) : (i64) -> i64
    %1933 = arith.cmpi ne, %1932, %1931 : i64
    %1934 = scf.if %1933 -> (i64) {
      scf.yield %1930 : i64
    } else {
      %1935 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1935) : (i64) -> ()
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1938 = arith.constant 34 : i64
      %1939 = func.call @cc_make_symbol(%1937, %1938) : (!llvm.ptr, i64) -> i64
      %1940 = func.call @cc_persistent_root_value(%1939) : (i64) -> i64
      %1941 = func.call @cc_set_symbol_value(%1940, %1936) : (i64, i64) -> i64
      %1942 = func.call @cc_nil_value() : () -> i64
      %1943 = func.call @cc_nil_value() : () -> i64
      %1944 = func.call @cc_errorp(%1942) : (i64) -> i64
      %1945 = arith.cmpi ne, %1944, %1943 : i64
      %1946 = scf.if %1945 -> (i64) {
        scf.yield %1942 : i64
      } else {
        %1947 = arith.constant 5 : i64
        func.call @stack_push_fixnum(%1947) : (i64) -> ()
        %1948 = func.call @stack_pop_pointer() : () -> i64
        %1949 = func.call @cc_unbox_fixnum(%1948) : (i64) -> i64
        %1950 = func.call @cc_nil_value() : () -> i64
        %1951 = func.call @cc_make_list(%1948) : (i64) -> i64
        func.call @stack_push_pointer(%1951) : (i64) -> ()
        %1952 = func.call @stack_pop_pointer() : () -> i64
        %1953 = func.call @cc_nil_value() : () -> i64
        %1954 = func.call @cc_nil_value() : () -> i64
        %1955 = func.call @cc_errorp(%1953) : (i64) -> i64
        %1956 = arith.cmpi ne, %1955, %1954 : i64
        %1957 = scf.if %1956 -> (i64) {
          scf.yield %1953 : i64
        } else {
          func.call @stack_push_pointer(%1940) : (i64) -> ()
          %2002 = arith.constant 236837129945104 : i64
          %2003 = arith.constant 1 : i64
          %2004 = func.call @cc_make_closure(%2002, %2003) : (i64, i64) -> i64
          %2005 = llvm.mlir.addressof @str155 : !llvm.ptr
          %2006 = arith.constant 3 : i64
          %2007 = func.call @cc_bind_function_object_const(%2005, %2006, %2004) : (!llvm.ptr, i64, i64) -> i64
          %2008 = arith.constant 5 : i64
          func.call @stack_push_fixnum(%2008) : (i64) -> ()
          %2009 = func.call @stack_pop_pointer() : () -> i64
          %2010 = arith.constant 0 : i64
          func.call @stack_push_fixnum(%2010) : (i64) -> ()
          %2011 = func.call @stack_pop_pointer() : () -> i64
          %2012 = func.call @cc_nil_value() : () -> i64
          %2013 = func.call @cc_nil_value() : () -> i64
          %2014 = func.call @cc_errorp(%2012) : (i64) -> i64
          %2015 = arith.cmpi ne, %2014, %2013 : i64
          %2016 = scf.if %2015 -> (i64) {
            scf.yield %2012 : i64
          } else {
            %2017 = func.call @cc_nil_value() : () -> i64
            %2018 = llvm.mlir.addressof @str156 : !llvm.ptr
            %2019 = arith.constant 38 : i64
            %2020 = func.call @cc_make_string(%2018, %2019) : (!llvm.ptr, i64) -> i64
            %2021 = func.call @cc_nil_value() : () -> i64
            %2022 = func.call @cc_intern(%2020, %2021) : (i64, i64) -> i64
            %2023 = func.call @cc_nil_value() : () -> i64
            %2024 = func.call @cc_cons(%2022, %2023) : (i64, i64) -> i64
            %2025 = func.call @cc_values_pack(%2024) : (i64) -> i64
            %2026 = func.call @cc_set_symbol_value(%2022, %2017) : (i64, i64) -> i64
            %2027 = llvm.mlir.addressof @str157 : !llvm.ptr
            %2028 = arith.constant 39 : i64
            %2029 = func.call @cc_make_string(%2027, %2028) : (!llvm.ptr, i64) -> i64
            %2030 = func.call @cc_nil_value() : () -> i64
            %2031 = func.call @cc_intern(%2029, %2030) : (i64, i64) -> i64
            %2032 = func.call @cc_nil_value() : () -> i64
            %2033 = func.call @cc_cons(%2031, %2032) : (i64, i64) -> i64
            %2034 = func.call @cc_values_pack(%2033) : (i64) -> i64
            %2035 = func.call @cc_set_symbol_value(%2031, %2017) : (i64, i64) -> i64
            %2036 = llvm.mlir.addressof @str158 : !llvm.ptr
            %2037 = arith.constant 40 : i64
            %2038 = func.call @cc_make_string(%2036, %2037) : (!llvm.ptr, i64) -> i64
            %2039 = func.call @cc_nil_value() : () -> i64
            %2040 = func.call @cc_intern(%2038, %2039) : (i64, i64) -> i64
            %2041 = func.call @cc_nil_value() : () -> i64
            %2042 = func.call @cc_cons(%2040, %2041) : (i64, i64) -> i64
            %2043 = func.call @cc_values_pack(%2042) : (i64) -> i64
            %2044 = func.call @cc_set_symbol_value(%2040, %2017) : (i64, i64) -> i64
            %2045:1 = scf.while (%arg0 = %2011) : (i64) -> (i64) {
              func.call @stack_push_pointer(%arg0) : (i64) -> ()
              %2046 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2009) : (i64) -> ()
              %2047 = func.call @stack_pop_pointer() : () -> i64
              %2048 = arith.constant 1 : i1
              %2050 = arith.constant 3 : i64
              %2049 = arith.andi %2046, %2050 : i64
              %2051 = arith.constant 0 : i64
              %2052 = arith.cmpi eq, %2049, %2051 : i64
              %2054 = arith.constant 3 : i64
              %2053 = arith.andi %2047, %2054 : i64
              %2055 = arith.constant 0 : i64
              %2056 = arith.cmpi eq, %2053, %2055 : i64
              %2057 = arith.andi %2052, %2056 : i1
              %2058 = scf.if %2057 -> (i1) {
                %2059 = arith.constant 2 : i64
                %2060 = arith.shrsi %2046, %2059 : i64
                %2061 = arith.constant 2 : i64
                %2062 = arith.shrsi %2047, %2061 : i64
                %2063 = arith.cmpi slt, %2060, %2062 : i64
                scf.yield %2063 : i1
              } else {
                %2064 = func.call @cc_lt(%2046, %2047) : (i64, i64) -> i64
                %2065 = func.call @cc_nil_value() : () -> i64
                %2066 = arith.cmpi ne, %2064, %2065 : i64
                scf.yield %2066 : i1
              }
              %2067 = arith.andi %2048, %2058 : i1
              %2068 = func.call @cc_nil_value() : () -> i64
              %2069 = func.call @cc_t_value() : () -> i64
              %2070 = scf.if %2067 -> (i64) {
                scf.yield %2069 : i64
              } else {
                scf.yield %2068 : i64
              }
              func.call @stack_push_pointer(%2070) : (i64) -> ()
              %2071 = func.call @stack_pop_pointer() : () -> i64
              %2072 = func.call @cc_nil_value() : () -> i64
              %2073 = arith.cmpi ne, %2071, %2072 : i64
              %2074 = func.call @cc_nil_value() : () -> i64
              %2075 = llvm.mlir.addressof @str159 : !llvm.ptr
              %2076 = arith.constant 38 : i64
              %2077 = func.call @cc_make_string(%2075, %2076) : (!llvm.ptr, i64) -> i64
              %2078 = func.call @cc_nil_value() : () -> i64
              %2079 = func.call @cc_intern(%2077, %2078) : (i64, i64) -> i64
              %2080 = func.call @cc_nil_value() : () -> i64
              %2081 = func.call @cc_cons(%2079, %2080) : (i64, i64) -> i64
              %2082 = func.call @cc_values_pack(%2081) : (i64) -> i64
              %2083 = func.call @cc_symbol_value(%2079) : (i64) -> i64
              %2084 = arith.cmpi ne, %2083, %2074 : i64
              %2085 = llvm.mlir.addressof @str160 : !llvm.ptr
              %2086 = arith.constant 38 : i64
              %2087 = func.call @cc_make_string(%2085, %2086) : (!llvm.ptr, i64) -> i64
              %2088 = func.call @cc_nil_value() : () -> i64
              %2089 = func.call @cc_intern(%2087, %2088) : (i64, i64) -> i64
              %2090 = func.call @cc_nil_value() : () -> i64
              %2091 = func.call @cc_cons(%2089, %2090) : (i64, i64) -> i64
              %2092 = func.call @cc_values_pack(%2091) : (i64) -> i64
              %2093 = func.call @cc_symbol_value(%2089) : (i64) -> i64
              %2094 = arith.cmpi ne, %2093, %2074 : i64
              %2095 = arith.ori %2084, %2094 : i1
              %2096 = arith.constant 0 : i1
              %2097 = arith.cmpi eq, %2095, %2096 : i1
              %2098 = arith.andi %2073, %2097 : i1
              scf.condition(%2098) %arg0 : i64
            } do {
              ^bb0(%2099: i64):
              func.call @stack_push_pointer(%1952) : (i64) -> ()
              %2100 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2004) : (i64) -> ()
              %2101 = func.call @stack_pop_pointer() : () -> i64
              %2102 = func.call @cc_nil_value() : () -> i64
              %2103 = func.call @cc_errorp(%2100) : (i64) -> i64
              %2104 = arith.cmpi ne, %2103, %2102 : i64
              %2105 = arith.cmpi eq, %2102, %2102 : i64
              %2106 = arith.andi %2104, %2105 : i1
              %2107 = scf.if %2106 -> (i64) {
                scf.yield %2100 : i64
              } else {
                scf.yield %2102 : i64
              }
              %2108 = func.call @cc_errorp(%2101) : (i64) -> i64
              %2109 = arith.cmpi ne, %2108, %2102 : i64
              %2110 = arith.cmpi eq, %2107, %2102 : i64
              %2111 = arith.andi %2109, %2110 : i1
              %2112 = scf.if %2111 -> (i64) {
                scf.yield %2101 : i64
              } else {
                scf.yield %2107 : i64
              }
              %2113 = arith.cmpi ne, %2112, %2102 : i64
              scf.if %2113 {
                func.call @stack_push_pointer(%2112) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%2100) : (i64) -> ()
                func.call @stack_push_pointer(%2101) : (i64) -> ()
                %2114 = llvm.mlir.addressof @str161 : !llvm.ptr
                %2115 = func.call @cc_make_function_ref_const(%2114) : (!llvm.ptr) -> i64
                %2116 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%2115, %2116) : (i64, i64) -> ()
              }
              %2117 = func.call @stack_depth() : () -> i64
              %2118 = arith.constant 0 : i64
              %2119 = arith.cmpi sgt, %2117, %2118 : i64
              scf.if %2119 {
                %2120 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%2099) : (i64) -> ()
              %2121 = func.call @stack_pop_pointer() : () -> i64
              %2122 = arith.constant 1 : i64
              func.call @stack_push_fixnum(%2122) : (i64) -> ()
              %2123 = func.call @stack_pop_pointer() : () -> i64
              %2125 = arith.constant 3 : i64
              %2124 = arith.andi %2121, %2125 : i64
              %2126 = arith.constant 0 : i64
              %2127 = arith.cmpi eq, %2124, %2126 : i64
              %2129 = arith.constant 3 : i64
              %2128 = arith.andi %2123, %2129 : i64
              %2130 = arith.constant 0 : i64
              %2131 = arith.cmpi eq, %2128, %2130 : i64
              %2132 = arith.andi %2127, %2131 : i1
              %2133 = scf.if %2132 -> (i64) {
                %2134 = arith.constant 2 : i64
                %2135 = arith.shrsi %2121, %2134 : i64
                %2136 = arith.constant 2 : i64
                %2137 = arith.shrsi %2123, %2136 : i64
                %2138 = arith.addi %2135, %2137 : i64
                %2139 = arith.constant -2305843009213693952 : i64
                %2140 = arith.constant 2305843009213693951 : i64
                %2141 = arith.cmpi sge, %2138, %2139 : i64
                %2142 = arith.cmpi sle, %2138, %2140 : i64
                %2143 = arith.andi %2141, %2142 : i1
                %2144 = scf.if %2143 -> (i64) {
                  %2145 = arith.constant 2 : i64
                  %2146 = arith.shli %2138, %2145 : i64
                  scf.yield %2146 : i64
                } else {
                  %2147 = func.call @cc_add(%2121, %2123) : (i64, i64) -> i64
                  scf.yield %2147 : i64
                }
                scf.yield %2144 : i64
              } else {
                %2148 = func.call @cc_add(%2121, %2123) : (i64, i64) -> i64
                scf.yield %2148 : i64
              }
              func.call @stack_push_pointer(%2133) : (i64) -> ()
              %2149 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2149) : (i64) -> ()
              %2150 = func.call @stack_depth() : () -> i64
              %2151 = arith.constant 0 : i64
              %2152 = arith.cmpi sgt, %2150, %2151 : i64
              scf.if %2152 {
                %2153 = func.call @stack_pop_pointer() : () -> i64
              }
              scf.yield %2149 : i64
            }
            func.call @stack_push_nil() : () -> ()
            %2154 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %2155 = func.call @stack_pop_pointer() : () -> i64
            %2156 = func.call @cc_multiple_value_list(%2155) : (i64) -> i64
            %2157 = llvm.mlir.addressof @str162 : !llvm.ptr
            %2158 = arith.constant 38 : i64
            %2159 = func.call @cc_make_string(%2157, %2158) : (!llvm.ptr, i64) -> i64
            %2160 = func.call @cc_nil_value() : () -> i64
            %2161 = func.call @cc_intern(%2159, %2160) : (i64, i64) -> i64
            %2162 = func.call @cc_nil_value() : () -> i64
            %2163 = func.call @cc_cons(%2161, %2162) : (i64, i64) -> i64
            %2164 = func.call @cc_values_pack(%2163) : (i64) -> i64
            %2165 = func.call @cc_symbol_value(%2161) : (i64) -> i64
            %2166 = llvm.mlir.addressof @str163 : !llvm.ptr
            %2167 = arith.constant 39 : i64
            %2168 = func.call @cc_make_string(%2166, %2167) : (!llvm.ptr, i64) -> i64
            %2169 = func.call @cc_nil_value() : () -> i64
            %2170 = func.call @cc_intern(%2168, %2169) : (i64, i64) -> i64
            %2171 = func.call @cc_nil_value() : () -> i64
            %2172 = func.call @cc_cons(%2170, %2171) : (i64, i64) -> i64
            %2173 = func.call @cc_values_pack(%2172) : (i64) -> i64
            %2174 = func.call @cc_symbol_value(%2170) : (i64) -> i64
            %2175 = llvm.mlir.addressof @str164 : !llvm.ptr
            %2176 = arith.constant 40 : i64
            %2177 = func.call @cc_make_string(%2175, %2176) : (!llvm.ptr, i64) -> i64
            %2178 = func.call @cc_nil_value() : () -> i64
            %2179 = func.call @cc_intern(%2177, %2178) : (i64, i64) -> i64
            %2180 = func.call @cc_nil_value() : () -> i64
            %2181 = func.call @cc_cons(%2179, %2180) : (i64, i64) -> i64
            %2182 = func.call @cc_values_pack(%2181) : (i64) -> i64
            %2183 = func.call @cc_symbol_value(%2179) : (i64) -> i64
            %2184 = func.call @cc_nil_value() : () -> i64
            %2185 = arith.cmpi ne, %2165, %2184 : i64
            %2186 = scf.if %2185 -> (i64) {
              scf.yield %2183 : i64
            } else {
              scf.yield %2156 : i64
            }
            %2187 = func.call @cc_values_pack(%2186) : (i64) -> i64
            func.call @stack_push_pointer(%2187) : (i64) -> ()
            %2188 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2188 : i64
          }
          func.call @stack_push_pointer(%2016) : (i64) -> ()
          %2189 = func.call @stack_pop_pointer() : () -> i64
          %2190 = func.call @cc_multiple_value_list(%2189) : (i64) -> i64
          %2191 = func.call @cc_symbol_value(%1940) : (i64) -> i64
          %2192 = func.call @cc_values_pack(%2190) : (i64) -> i64
          func.call @stack_push_pointer(%2192) : (i64) -> ()
          %2193 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2193 : i64
        }
        %2194 = func.call @cc_nil_value() : () -> i64
        %2195 = func.call @cc_errorp(%1957) : (i64) -> i64
        %2196 = arith.cmpi ne, %2195, %2194 : i64
        %2197 = scf.if %2196 -> (i64) {
          scf.yield %1957 : i64
        } else {
          func.call @stack_push_pointer(%1952) : (i64) -> ()
          %2198 = func.call @stack_pop_pointer() : () -> i64
          %2199 = func.call @cc_nil_value() : () -> i64
          %2200 = func.call @cc_errorp(%2198) : (i64) -> i64
          %2201 = arith.cmpi ne, %2200, %2199 : i64
          %2202 = arith.cmpi eq, %2199, %2199 : i64
          %2203 = arith.andi %2201, %2202 : i1
          %2204 = scf.if %2203 -> (i64) {
            scf.yield %2198 : i64
          } else {
            scf.yield %2199 : i64
          }
          %2205 = arith.cmpi ne, %2204, %2199 : i64
          scf.if %2205 {
            func.call @stack_push_pointer(%2204) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2198) : (i64) -> ()
            %2206 = llvm.mlir.addressof @str165 : !llvm.ptr
            %2207 = func.call @cc_make_function_ref_const(%2206) : (!llvm.ptr) -> i64
            %2208 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2207, %2208) : (i64, i64) -> ()
          }
          %2209 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2209 : i64
        }
        func.call @stack_push_pointer(%2197) : (i64) -> ()
        %2210 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2210 : i64
      }
      %2211 = func.call @cc_nil_value() : () -> i64
      %2212 = func.call @cc_errorp(%1946) : (i64) -> i64
      %2213 = arith.cmpi ne, %2212, %2211 : i64
      %2214 = scf.if %2213 -> (i64) {
        scf.yield %1946 : i64
      } else {
        %2215 = arith.constant 10 : i64
        func.call @stack_push_fixnum(%2215) : (i64) -> ()
        %2216 = func.call @stack_pop_pointer() : () -> i64
        %2217 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%2217) : (i64) -> ()
        %2218 = func.call @stack_pop_pointer() : () -> i64
        %2219 = func.call @cc_nil_value() : () -> i64
        %2220 = func.call @cc_nil_value() : () -> i64
        %2221 = func.call @cc_errorp(%2219) : (i64) -> i64
        %2222 = arith.cmpi ne, %2221, %2220 : i64
        %2223 = scf.if %2222 -> (i64) {
          scf.yield %2219 : i64
        } else {
          %2224 = func.call @cc_nil_value() : () -> i64
          %2225 = llvm.mlir.addressof @str166 : !llvm.ptr
          %2226 = arith.constant 38 : i64
          %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
          %2228 = func.call @cc_nil_value() : () -> i64
          %2229 = func.call @cc_intern(%2227, %2228) : (i64, i64) -> i64
          %2230 = func.call @cc_nil_value() : () -> i64
          %2231 = func.call @cc_cons(%2229, %2230) : (i64, i64) -> i64
          %2232 = func.call @cc_values_pack(%2231) : (i64) -> i64
          %2233 = func.call @cc_set_symbol_value(%2229, %2224) : (i64, i64) -> i64
          %2234 = llvm.mlir.addressof @str167 : !llvm.ptr
          %2235 = arith.constant 39 : i64
          %2236 = func.call @cc_make_string(%2234, %2235) : (!llvm.ptr, i64) -> i64
          %2237 = func.call @cc_nil_value() : () -> i64
          %2238 = func.call @cc_intern(%2236, %2237) : (i64, i64) -> i64
          %2239 = func.call @cc_nil_value() : () -> i64
          %2240 = func.call @cc_cons(%2238, %2239) : (i64, i64) -> i64
          %2241 = func.call @cc_values_pack(%2240) : (i64) -> i64
          %2242 = func.call @cc_set_symbol_value(%2238, %2224) : (i64, i64) -> i64
          %2243 = llvm.mlir.addressof @str168 : !llvm.ptr
          %2244 = arith.constant 40 : i64
          %2245 = func.call @cc_make_string(%2243, %2244) : (!llvm.ptr, i64) -> i64
          %2246 = func.call @cc_nil_value() : () -> i64
          %2247 = func.call @cc_intern(%2245, %2246) : (i64, i64) -> i64
          %2248 = func.call @cc_nil_value() : () -> i64
          %2249 = func.call @cc_cons(%2247, %2248) : (i64, i64) -> i64
          %2250 = func.call @cc_values_pack(%2249) : (i64) -> i64
          %2251 = func.call @cc_set_symbol_value(%2247, %2224) : (i64, i64) -> i64
          %2252:1 = scf.while (%arg0 = %2218) : (i64) -> (i64) {
            func.call @stack_push_pointer(%arg0) : (i64) -> ()
            %2253 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2216) : (i64) -> ()
            %2254 = func.call @stack_pop_pointer() : () -> i64
            %2255 = arith.constant 1 : i1
            %2257 = arith.constant 3 : i64
            %2256 = arith.andi %2253, %2257 : i64
            %2258 = arith.constant 0 : i64
            %2259 = arith.cmpi eq, %2256, %2258 : i64
            %2261 = arith.constant 3 : i64
            %2260 = arith.andi %2254, %2261 : i64
            %2262 = arith.constant 0 : i64
            %2263 = arith.cmpi eq, %2260, %2262 : i64
            %2264 = arith.andi %2259, %2263 : i1
            %2265 = scf.if %2264 -> (i1) {
              %2266 = arith.constant 2 : i64
              %2267 = arith.shrsi %2253, %2266 : i64
              %2268 = arith.constant 2 : i64
              %2269 = arith.shrsi %2254, %2268 : i64
              %2270 = arith.cmpi slt, %2267, %2269 : i64
              scf.yield %2270 : i1
            } else {
              %2271 = func.call @cc_lt(%2253, %2254) : (i64, i64) -> i64
              %2272 = func.call @cc_nil_value() : () -> i64
              %2273 = arith.cmpi ne, %2271, %2272 : i64
              scf.yield %2273 : i1
            }
            %2274 = arith.andi %2255, %2265 : i1
            %2275 = func.call @cc_nil_value() : () -> i64
            %2276 = func.call @cc_t_value() : () -> i64
            %2277 = scf.if %2274 -> (i64) {
              scf.yield %2276 : i64
            } else {
              scf.yield %2275 : i64
            }
            func.call @stack_push_pointer(%2277) : (i64) -> ()
            %2278 = func.call @stack_pop_pointer() : () -> i64
            %2279 = func.call @cc_nil_value() : () -> i64
            %2280 = arith.cmpi ne, %2278, %2279 : i64
            %2281 = func.call @cc_nil_value() : () -> i64
            %2282 = llvm.mlir.addressof @str169 : !llvm.ptr
            %2283 = arith.constant 38 : i64
            %2284 = func.call @cc_make_string(%2282, %2283) : (!llvm.ptr, i64) -> i64
            %2285 = func.call @cc_nil_value() : () -> i64
            %2286 = func.call @cc_intern(%2284, %2285) : (i64, i64) -> i64
            %2287 = func.call @cc_nil_value() : () -> i64
            %2288 = func.call @cc_cons(%2286, %2287) : (i64, i64) -> i64
            %2289 = func.call @cc_values_pack(%2288) : (i64) -> i64
            %2290 = func.call @cc_symbol_value(%2286) : (i64) -> i64
            %2291 = arith.cmpi ne, %2290, %2281 : i64
            %2292 = llvm.mlir.addressof @str170 : !llvm.ptr
            %2293 = arith.constant 38 : i64
            %2294 = func.call @cc_make_string(%2292, %2293) : (!llvm.ptr, i64) -> i64
            %2295 = func.call @cc_nil_value() : () -> i64
            %2296 = func.call @cc_intern(%2294, %2295) : (i64, i64) -> i64
            %2297 = func.call @cc_nil_value() : () -> i64
            %2298 = func.call @cc_cons(%2296, %2297) : (i64, i64) -> i64
            %2299 = func.call @cc_values_pack(%2298) : (i64) -> i64
            %2300 = func.call @cc_symbol_value(%2296) : (i64) -> i64
            %2301 = arith.cmpi ne, %2300, %2281 : i64
            %2302 = arith.ori %2291, %2301 : i1
            %2303 = arith.constant 0 : i1
            %2304 = arith.cmpi eq, %2302, %2303 : i1
            %2305 = arith.andi %2280, %2304 : i1
            scf.condition(%2305) %arg0 : i64
          } do {
            ^bb0(%2306: i64):
            %2307 = func.call @cc_nil_value() : () -> i64
            %2308 = arith.cmpi ne, %2307, %2307 : i64
            scf.if %2308 {
              func.call @stack_push_pointer(%2307) : (i64) -> ()
            } else {
              %2309 = llvm.mlir.addressof @str171 : !llvm.ptr
              %2310 = func.call @cc_make_function_ref_const(%2309) : (!llvm.ptr) -> i64
              %2311 = arith.constant 0 : i64
              func.call @cc_funcall_stack(%2310, %2311) : (i64, i64) -> ()
            }
            %2312 = func.call @stack_depth() : () -> i64
            %2313 = arith.constant 0 : i64
            %2314 = arith.cmpi sgt, %2312, %2313 : i64
            scf.if %2314 {
              %2315 = func.call @stack_pop_pointer() : () -> i64
            }
            func.call @stack_push_pointer(%2306) : (i64) -> ()
            %2316 = func.call @stack_pop_pointer() : () -> i64
            %2317 = arith.constant 1 : i64
            func.call @stack_push_fixnum(%2317) : (i64) -> ()
            %2318 = func.call @stack_pop_pointer() : () -> i64
            %2320 = arith.constant 3 : i64
            %2319 = arith.andi %2316, %2320 : i64
            %2321 = arith.constant 0 : i64
            %2322 = arith.cmpi eq, %2319, %2321 : i64
            %2324 = arith.constant 3 : i64
            %2323 = arith.andi %2318, %2324 : i64
            %2325 = arith.constant 0 : i64
            %2326 = arith.cmpi eq, %2323, %2325 : i64
            %2327 = arith.andi %2322, %2326 : i1
            %2328 = scf.if %2327 -> (i64) {
              %2329 = arith.constant 2 : i64
              %2330 = arith.shrsi %2316, %2329 : i64
              %2331 = arith.constant 2 : i64
              %2332 = arith.shrsi %2318, %2331 : i64
              %2333 = arith.addi %2330, %2332 : i64
              %2334 = arith.constant -2305843009213693952 : i64
              %2335 = arith.constant 2305843009213693951 : i64
              %2336 = arith.cmpi sge, %2333, %2334 : i64
              %2337 = arith.cmpi sle, %2333, %2335 : i64
              %2338 = arith.andi %2336, %2337 : i1
              %2339 = scf.if %2338 -> (i64) {
                %2340 = arith.constant 2 : i64
                %2341 = arith.shli %2333, %2340 : i64
                scf.yield %2341 : i64
              } else {
                %2342 = func.call @cc_add(%2316, %2318) : (i64, i64) -> i64
                scf.yield %2342 : i64
              }
              scf.yield %2339 : i64
            } else {
              %2343 = func.call @cc_add(%2316, %2318) : (i64, i64) -> i64
              scf.yield %2343 : i64
            }
            func.call @stack_push_pointer(%2328) : (i64) -> ()
            %2344 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2344) : (i64) -> ()
            %2345 = func.call @stack_depth() : () -> i64
            %2346 = arith.constant 0 : i64
            %2347 = arith.cmpi sgt, %2345, %2346 : i64
            scf.if %2347 {
              %2348 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %2344 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %2349 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %2350 = func.call @stack_pop_pointer() : () -> i64
          %2351 = func.call @cc_multiple_value_list(%2350) : (i64) -> i64
          %2352 = llvm.mlir.addressof @str172 : !llvm.ptr
          %2353 = arith.constant 38 : i64
          %2354 = func.call @cc_make_string(%2352, %2353) : (!llvm.ptr, i64) -> i64
          %2355 = func.call @cc_nil_value() : () -> i64
          %2356 = func.call @cc_intern(%2354, %2355) : (i64, i64) -> i64
          %2357 = func.call @cc_nil_value() : () -> i64
          %2358 = func.call @cc_cons(%2356, %2357) : (i64, i64) -> i64
          %2359 = func.call @cc_values_pack(%2358) : (i64) -> i64
          %2360 = func.call @cc_symbol_value(%2356) : (i64) -> i64
          %2361 = llvm.mlir.addressof @str173 : !llvm.ptr
          %2362 = arith.constant 39 : i64
          %2363 = func.call @cc_make_string(%2361, %2362) : (!llvm.ptr, i64) -> i64
          %2364 = func.call @cc_nil_value() : () -> i64
          %2365 = func.call @cc_intern(%2363, %2364) : (i64, i64) -> i64
          %2366 = func.call @cc_nil_value() : () -> i64
          %2367 = func.call @cc_cons(%2365, %2366) : (i64, i64) -> i64
          %2368 = func.call @cc_values_pack(%2367) : (i64) -> i64
          %2369 = func.call @cc_symbol_value(%2365) : (i64) -> i64
          %2370 = llvm.mlir.addressof @str174 : !llvm.ptr
          %2371 = arith.constant 40 : i64
          %2372 = func.call @cc_make_string(%2370, %2371) : (!llvm.ptr, i64) -> i64
          %2373 = func.call @cc_nil_value() : () -> i64
          %2374 = func.call @cc_intern(%2372, %2373) : (i64, i64) -> i64
          %2375 = func.call @cc_nil_value() : () -> i64
          %2376 = func.call @cc_cons(%2374, %2375) : (i64, i64) -> i64
          %2377 = func.call @cc_values_pack(%2376) : (i64) -> i64
          %2378 = func.call @cc_symbol_value(%2374) : (i64) -> i64
          %2379 = func.call @cc_nil_value() : () -> i64
          %2380 = arith.cmpi ne, %2360, %2379 : i64
          %2381 = scf.if %2380 -> (i64) {
            scf.yield %2378 : i64
          } else {
            scf.yield %2351 : i64
          }
          %2382 = func.call @cc_values_pack(%2381) : (i64) -> i64
          func.call @stack_push_pointer(%2382) : (i64) -> ()
          %2383 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2383 : i64
        }
        func.call @stack_push_pointer(%2223) : (i64) -> ()
        %2384 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2384 : i64
      }
      %2385 = func.call @cc_nil_value() : () -> i64
      %2386 = func.call @cc_errorp(%2214) : (i64) -> i64
      %2387 = arith.cmpi ne, %2386, %2385 : i64
      %2388 = scf.if %2387 -> (i64) {
        scf.yield %2214 : i64
      } else {
        %2389 = func.call @cc_symbol_value(%1940) : (i64) -> i64
        func.call @stack_push_pointer(%2389) : (i64) -> ()
        %2390 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2390 : i64
      }
      func.call @stack_push_pointer(%2388) : (i64) -> ()
      %2391 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2391 : i64
    }
    func.call @stack_push_pointer(%1934) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945109"() {
    %2557 = func.call @cc_nil_value() : () -> i64
    %2558 = func.call @cc_nil_value() : () -> i64
    %2559 = func.call @cc_errorp(%2557) : (i64) -> i64
    %2560 = arith.cmpi ne, %2559, %2558 : i64
    %2561 = scf.if %2560 -> (i64) {
      scf.yield %2557 : i64
    } else {
      %2562 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2562) : (i64) -> ()
      %2563 = func.call @stack_pop_pointer() : () -> i64
      %2564 = func.call @cc_nil_value() : () -> i64
      %2565 = func.call @cc_errorp(%2563) : (i64) -> i64
      %2566 = arith.cmpi ne, %2565, %2564 : i64
      %2567 = arith.cmpi eq, %2564, %2564 : i64
      %2568 = arith.andi %2566, %2567 : i1
      %2569 = scf.if %2568 -> (i64) {
        scf.yield %2563 : i64
      } else {
        scf.yield %2564 : i64
      }
      %2570 = arith.cmpi ne, %2569, %2564 : i64
      scf.if %2570 {
        func.call @stack_push_pointer(%2569) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2563) : (i64) -> ()
        %2571 = llvm.mlir.addressof @str188 : !llvm.ptr
        %2572 = func.call @cc_make_function_ref_const(%2571) : (!llvm.ptr) -> i64
        %2573 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2572, %2573) : (i64, i64) -> ()
      }
      %2574 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2574 : i64
    }
    func.call @stack_push_pointer(%2561) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945108"() {
    %2552 = func.call @cc_nil_value() : () -> i64
    %2553 = func.call @cc_nil_value() : () -> i64
    %2554 = func.call @cc_errorp(%2552) : (i64) -> i64
    %2555 = arith.cmpi ne, %2554, %2553 : i64
    %2556 = scf.if %2555 -> (i64) {
      scf.yield %2552 : i64
    } else {
      %2575 = arith.constant 236837129945109 : i64
      %2576 = arith.constant 0 : i64
      %2577 = func.call @cc_make_closure(%2575, %2576) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2577) : (i64) -> ()
      %2578 = func.call @stack_pop_pointer() : () -> i64
      %2579 = arith.constant 100 : i64
      func.call @stack_push_fixnum(%2579) : (i64) -> ()
      %2580 = func.call @stack_pop_pointer() : () -> i64
      %2581 = func.call @cc_nil_value() : () -> i64
      %2582 = func.call @cc_errorp(%2578) : (i64) -> i64
      %2583 = arith.cmpi ne, %2582, %2581 : i64
      %2584 = arith.cmpi eq, %2581, %2581 : i64
      %2585 = arith.andi %2583, %2584 : i1
      %2586 = scf.if %2585 -> (i64) {
        scf.yield %2578 : i64
      } else {
        scf.yield %2581 : i64
      }
      %2587 = func.call @cc_errorp(%2580) : (i64) -> i64
      %2588 = arith.cmpi ne, %2587, %2581 : i64
      %2589 = arith.cmpi eq, %2586, %2581 : i64
      %2590 = arith.andi %2588, %2589 : i1
      %2591 = scf.if %2590 -> (i64) {
        scf.yield %2580 : i64
      } else {
        scf.yield %2586 : i64
      }
      %2592 = arith.cmpi ne, %2591, %2581 : i64
      scf.if %2592 {
        func.call @stack_push_pointer(%2591) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2578) : (i64) -> ()
        func.call @stack_push_pointer(%2580) : (i64) -> ()
        %2593 = llvm.mlir.addressof @str189 : !llvm.ptr
        %2594 = func.call @cc_make_function_ref_const(%2593) : (!llvm.ptr) -> i64
        %2595 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2594, %2595) : (i64, i64) -> ()
      }
      %2596 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2596 : i64
    }
    func.call @stack_push_pointer(%2556) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945113"() {
    %3139 = func.call @stack_pop_pointer() : () -> i64
    %3140 = func.call @stack_pop_pointer() : () -> i64
    %3141 = func.call @cc_nil_value() : () -> i64
    %3142 = func.call @cc_nil_value() : () -> i64
    %3143 = func.call @cc_errorp(%3141) : (i64) -> i64
    %3144 = arith.cmpi ne, %3143, %3142 : i64
    %3145 = scf.if %3144 -> (i64) {
      scf.yield %3141 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %3146 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3146 : i64
    }
    %3147 = func.call @cc_nil_value() : () -> i64
    %3148 = func.call @cc_errorp(%3145) : (i64) -> i64
    %3149 = arith.cmpi ne, %3148, %3147 : i64
    %3150 = scf.if %3149 -> (i64) {
      scf.yield %3145 : i64
    } else {
      %3151 = func.call @cc_symbol_value(%3140) : (i64) -> i64
      func.call @stack_push_pointer(%3151) : (i64) -> ()
      %3152 = func.call @stack_pop_pointer() : () -> i64
      %3153 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%3153) : (i64) -> ()
      %3154 = func.call @stack_pop_pointer() : () -> i64
      %3156 = arith.constant 3 : i64
      %3155 = arith.andi %3152, %3156 : i64
      %3157 = arith.constant 0 : i64
      %3158 = arith.cmpi eq, %3155, %3157 : i64
      %3160 = arith.constant 3 : i64
      %3159 = arith.andi %3154, %3160 : i64
      %3161 = arith.constant 0 : i64
      %3162 = arith.cmpi eq, %3159, %3161 : i64
      %3163 = arith.andi %3158, %3162 : i1
      %3164 = scf.if %3163 -> (i64) {
        %3165 = arith.constant 2 : i64
        %3166 = arith.shrsi %3152, %3165 : i64
        %3167 = arith.constant 2 : i64
        %3168 = arith.shrsi %3154, %3167 : i64
        %3169 = arith.addi %3166, %3168 : i64
        %3170 = arith.constant -2305843009213693952 : i64
        %3171 = arith.constant 2305843009213693951 : i64
        %3172 = arith.cmpi sge, %3169, %3170 : i64
        %3173 = arith.cmpi sle, %3169, %3171 : i64
        %3174 = arith.andi %3172, %3173 : i1
        %3175 = scf.if %3174 -> (i64) {
          %3176 = arith.constant 2 : i64
          %3177 = arith.shli %3169, %3176 : i64
          scf.yield %3177 : i64
        } else {
          %3178 = func.call @cc_add(%3152, %3154) : (i64, i64) -> i64
          scf.yield %3178 : i64
        }
        scf.yield %3175 : i64
      } else {
        %3179 = func.call @cc_add(%3152, %3154) : (i64, i64) -> i64
        scf.yield %3179 : i64
      }
      func.call @stack_push_pointer(%3164) : (i64) -> ()
      %3180 = func.call @stack_pop_pointer() : () -> i64
      %3181 = func.call @cc_set_symbol_value(%3140, %3180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3180) : (i64) -> ()
      %3182 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3182 : i64
    }
    func.call @stack_push_pointer(%3150) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_236837129945110"() {
    %3103 = func.call @stack_pop_pointer() : () -> i64
    %3104 = func.call @cc_nil_value() : () -> i64
    %3105 = func.call @cc_nil_value() : () -> i64
    %3106 = func.call @cc_errorp(%3104) : (i64) -> i64
    %3107 = arith.cmpi ne, %3106, %3105 : i64
    %3108 = scf.if %3107 -> (i64) {
      scf.yield %3104 : i64
    } else {
      %3109 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3109) : (i64) -> ()
      %3110 = func.call @stack_pop_pointer() : () -> i64
      %3111 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3112 = arith.constant 34 : i64
      %3113 = func.call @cc_make_symbol(%3111, %3112) : (!llvm.ptr, i64) -> i64
      %3114 = func.call @cc_persistent_root_value(%3113) : (i64) -> i64
      %3115 = func.call @cc_set_symbol_value(%3114, %3110) : (i64, i64) -> i64
      %3116 = func.call @cc_nil_value() : () -> i64
      %3117 = func.call @cc_nil_value() : () -> i64
      %3118 = func.call @cc_errorp(%3116) : (i64) -> i64
      %3119 = arith.cmpi ne, %3118, %3117 : i64
      %3120 = scf.if %3119 -> (i64) {
        scf.yield %3116 : i64
      } else {
        %3121 = arith.constant 5 : i64
        func.call @stack_push_fixnum(%3121) : (i64) -> ()
        %3122 = func.call @stack_pop_pointer() : () -> i64
        %3123 = func.call @cc_nil_value() : () -> i64
        %3124 = func.call @cc_errorp(%3122) : (i64) -> i64
        %3125 = arith.cmpi ne, %3124, %3123 : i64
        %3126 = arith.cmpi eq, %3123, %3123 : i64
        %3127 = arith.andi %3125, %3126 : i1
        %3128 = scf.if %3127 -> (i64) {
          scf.yield %3122 : i64
        } else {
          scf.yield %3123 : i64
        }
        %3129 = arith.cmpi ne, %3128, %3123 : i64
        scf.if %3129 {
          func.call @stack_push_pointer(%3128) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3122) : (i64) -> ()
          %3130 = llvm.mlir.addressof @str240 : !llvm.ptr
          %3131 = func.call @cc_make_function_ref_const(%3130) : (!llvm.ptr) -> i64
          %3132 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3131, %3132) : (i64, i64) -> ()
        }
        %3133 = func.call @stack_pop_pointer() : () -> i64
        %3134 = func.call @cc_nil_value() : () -> i64
        %3135 = func.call @cc_nil_value() : () -> i64
        %3136 = func.call @cc_errorp(%3134) : (i64) -> i64
        %3137 = arith.cmpi ne, %3136, %3135 : i64
        %3138 = scf.if %3137 -> (i64) {
          scf.yield %3134 : i64
        } else {
          func.call @stack_push_pointer(%3114) : (i64) -> ()
          %3183 = arith.constant 236837129945113 : i64
          %3184 = arith.constant 1 : i64
          %3185 = func.call @cc_make_closure(%3183, %3184) : (i64, i64) -> i64
          %3186 = llvm.mlir.addressof @str241 : !llvm.ptr
          %3187 = arith.constant 3 : i64
          %3188 = func.call @cc_bind_function_object_const(%3186, %3187, %3185) : (!llvm.ptr, i64, i64) -> i64
          %3189 = arith.constant 5 : i64
          func.call @stack_push_fixnum(%3189) : (i64) -> ()
          %3190 = func.call @stack_pop_pointer() : () -> i64
          %3191 = arith.constant 0 : i64
          func.call @stack_push_fixnum(%3191) : (i64) -> ()
          %3192 = func.call @stack_pop_pointer() : () -> i64
          %3193 = func.call @cc_nil_value() : () -> i64
          %3194 = func.call @cc_nil_value() : () -> i64
          %3195 = func.call @cc_errorp(%3193) : (i64) -> i64
          %3196 = arith.cmpi ne, %3195, %3194 : i64
          %3197 = scf.if %3196 -> (i64) {
            scf.yield %3193 : i64
          } else {
            %3198 = func.call @cc_nil_value() : () -> i64
            %3199 = llvm.mlir.addressof @str242 : !llvm.ptr
            %3200 = arith.constant 38 : i64
            %3201 = func.call @cc_make_string(%3199, %3200) : (!llvm.ptr, i64) -> i64
            %3202 = func.call @cc_nil_value() : () -> i64
            %3203 = func.call @cc_intern(%3201, %3202) : (i64, i64) -> i64
            %3204 = func.call @cc_nil_value() : () -> i64
            %3205 = func.call @cc_cons(%3203, %3204) : (i64, i64) -> i64
            %3206 = func.call @cc_values_pack(%3205) : (i64) -> i64
            %3207 = func.call @cc_set_symbol_value(%3203, %3198) : (i64, i64) -> i64
            %3208 = llvm.mlir.addressof @str243 : !llvm.ptr
            %3209 = arith.constant 39 : i64
            %3210 = func.call @cc_make_string(%3208, %3209) : (!llvm.ptr, i64) -> i64
            %3211 = func.call @cc_nil_value() : () -> i64
            %3212 = func.call @cc_intern(%3210, %3211) : (i64, i64) -> i64
            %3213 = func.call @cc_nil_value() : () -> i64
            %3214 = func.call @cc_cons(%3212, %3213) : (i64, i64) -> i64
            %3215 = func.call @cc_values_pack(%3214) : (i64) -> i64
            %3216 = func.call @cc_set_symbol_value(%3212, %3198) : (i64, i64) -> i64
            %3217 = llvm.mlir.addressof @str244 : !llvm.ptr
            %3218 = arith.constant 40 : i64
            %3219 = func.call @cc_make_string(%3217, %3218) : (!llvm.ptr, i64) -> i64
            %3220 = func.call @cc_nil_value() : () -> i64
            %3221 = func.call @cc_intern(%3219, %3220) : (i64, i64) -> i64
            %3222 = func.call @cc_nil_value() : () -> i64
            %3223 = func.call @cc_cons(%3221, %3222) : (i64, i64) -> i64
            %3224 = func.call @cc_values_pack(%3223) : (i64) -> i64
            %3225 = func.call @cc_set_symbol_value(%3221, %3198) : (i64, i64) -> i64
            %3226:1 = scf.while (%arg0 = %3192) : (i64) -> (i64) {
              func.call @stack_push_pointer(%arg0) : (i64) -> ()
              %3227 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%3190) : (i64) -> ()
              %3228 = func.call @stack_pop_pointer() : () -> i64
              %3229 = arith.constant 1 : i1
              %3231 = arith.constant 3 : i64
              %3230 = arith.andi %3227, %3231 : i64
              %3232 = arith.constant 0 : i64
              %3233 = arith.cmpi eq, %3230, %3232 : i64
              %3235 = arith.constant 3 : i64
              %3234 = arith.andi %3228, %3235 : i64
              %3236 = arith.constant 0 : i64
              %3237 = arith.cmpi eq, %3234, %3236 : i64
              %3238 = arith.andi %3233, %3237 : i1
              %3239 = scf.if %3238 -> (i1) {
                %3240 = arith.constant 2 : i64
                %3241 = arith.shrsi %3227, %3240 : i64
                %3242 = arith.constant 2 : i64
                %3243 = arith.shrsi %3228, %3242 : i64
                %3244 = arith.cmpi slt, %3241, %3243 : i64
                scf.yield %3244 : i1
              } else {
                %3245 = func.call @cc_lt(%3227, %3228) : (i64, i64) -> i64
                %3246 = func.call @cc_nil_value() : () -> i64
                %3247 = arith.cmpi ne, %3245, %3246 : i64
                scf.yield %3247 : i1
              }
              %3248 = arith.andi %3229, %3239 : i1
              %3249 = func.call @cc_nil_value() : () -> i64
              %3250 = func.call @cc_t_value() : () -> i64
              %3251 = scf.if %3248 -> (i64) {
                scf.yield %3250 : i64
              } else {
                scf.yield %3249 : i64
              }
              func.call @stack_push_pointer(%3251) : (i64) -> ()
              %3252 = func.call @stack_pop_pointer() : () -> i64
              %3253 = func.call @cc_nil_value() : () -> i64
              %3254 = arith.cmpi ne, %3252, %3253 : i64
              %3255 = func.call @cc_nil_value() : () -> i64
              %3256 = llvm.mlir.addressof @str245 : !llvm.ptr
              %3257 = arith.constant 38 : i64
              %3258 = func.call @cc_make_string(%3256, %3257) : (!llvm.ptr, i64) -> i64
              %3259 = func.call @cc_nil_value() : () -> i64
              %3260 = func.call @cc_intern(%3258, %3259) : (i64, i64) -> i64
              %3261 = func.call @cc_nil_value() : () -> i64
              %3262 = func.call @cc_cons(%3260, %3261) : (i64, i64) -> i64
              %3263 = func.call @cc_values_pack(%3262) : (i64) -> i64
              %3264 = func.call @cc_symbol_value(%3260) : (i64) -> i64
              %3265 = arith.cmpi ne, %3264, %3255 : i64
              %3266 = llvm.mlir.addressof @str246 : !llvm.ptr
              %3267 = arith.constant 38 : i64
              %3268 = func.call @cc_make_string(%3266, %3267) : (!llvm.ptr, i64) -> i64
              %3269 = func.call @cc_nil_value() : () -> i64
              %3270 = func.call @cc_intern(%3268, %3269) : (i64, i64) -> i64
              %3271 = func.call @cc_nil_value() : () -> i64
              %3272 = func.call @cc_cons(%3270, %3271) : (i64, i64) -> i64
              %3273 = func.call @cc_values_pack(%3272) : (i64) -> i64
              %3274 = func.call @cc_symbol_value(%3270) : (i64) -> i64
              %3275 = arith.cmpi ne, %3274, %3255 : i64
              %3276 = arith.ori %3265, %3275 : i1
              %3277 = arith.constant 0 : i1
              %3278 = arith.cmpi eq, %3276, %3277 : i1
              %3279 = arith.andi %3254, %3278 : i1
              scf.condition(%3279) %arg0 : i64
            } do {
              ^bb0(%3280: i64):
              func.call @stack_push_pointer(%3133) : (i64) -> ()
              %3281 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%3185) : (i64) -> ()
              %3282 = func.call @stack_pop_pointer() : () -> i64
              %3283 = func.call @cc_nil_value() : () -> i64
              %3284 = func.call @cc_errorp(%3281) : (i64) -> i64
              %3285 = arith.cmpi ne, %3284, %3283 : i64
              %3286 = arith.cmpi eq, %3283, %3283 : i64
              %3287 = arith.andi %3285, %3286 : i1
              %3288 = scf.if %3287 -> (i64) {
                scf.yield %3281 : i64
              } else {
                scf.yield %3283 : i64
              }
              %3289 = func.call @cc_errorp(%3282) : (i64) -> i64
              %3290 = arith.cmpi ne, %3289, %3283 : i64
              %3291 = arith.cmpi eq, %3288, %3283 : i64
              %3292 = arith.andi %3290, %3291 : i1
              %3293 = scf.if %3292 -> (i64) {
                scf.yield %3282 : i64
              } else {
                scf.yield %3288 : i64
              }
              %3294 = arith.cmpi ne, %3293, %3283 : i64
              scf.if %3294 {
                func.call @stack_push_pointer(%3293) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%3281) : (i64) -> ()
                func.call @stack_push_pointer(%3282) : (i64) -> ()
                %3295 = llvm.mlir.addressof @str247 : !llvm.ptr
                %3296 = func.call @cc_make_function_ref_const(%3295) : (!llvm.ptr) -> i64
                %3297 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%3296, %3297) : (i64, i64) -> ()
              }
              %3298 = func.call @stack_depth() : () -> i64
              %3299 = arith.constant 0 : i64
              %3300 = arith.cmpi sgt, %3298, %3299 : i64
              scf.if %3300 {
                %3301 = func.call @stack_pop_pointer() : () -> i64
              }
              func.call @stack_push_pointer(%3280) : (i64) -> ()
              %3302 = func.call @stack_pop_pointer() : () -> i64
              %3303 = arith.constant 1 : i64
              func.call @stack_push_fixnum(%3303) : (i64) -> ()
              %3304 = func.call @stack_pop_pointer() : () -> i64
              %3306 = arith.constant 3 : i64
              %3305 = arith.andi %3302, %3306 : i64
              %3307 = arith.constant 0 : i64
              %3308 = arith.cmpi eq, %3305, %3307 : i64
              %3310 = arith.constant 3 : i64
              %3309 = arith.andi %3304, %3310 : i64
              %3311 = arith.constant 0 : i64
              %3312 = arith.cmpi eq, %3309, %3311 : i64
              %3313 = arith.andi %3308, %3312 : i1
              %3314 = scf.if %3313 -> (i64) {
                %3315 = arith.constant 2 : i64
                %3316 = arith.shrsi %3302, %3315 : i64
                %3317 = arith.constant 2 : i64
                %3318 = arith.shrsi %3304, %3317 : i64
                %3319 = arith.addi %3316, %3318 : i64
                %3320 = arith.constant -2305843009213693952 : i64
                %3321 = arith.constant 2305843009213693951 : i64
                %3322 = arith.cmpi sge, %3319, %3320 : i64
                %3323 = arith.cmpi sle, %3319, %3321 : i64
                %3324 = arith.andi %3322, %3323 : i1
                %3325 = scf.if %3324 -> (i64) {
                  %3326 = arith.constant 2 : i64
                  %3327 = arith.shli %3319, %3326 : i64
                  scf.yield %3327 : i64
                } else {
                  %3328 = func.call @cc_add(%3302, %3304) : (i64, i64) -> i64
                  scf.yield %3328 : i64
                }
                scf.yield %3325 : i64
              } else {
                %3329 = func.call @cc_add(%3302, %3304) : (i64, i64) -> i64
                scf.yield %3329 : i64
              }
              func.call @stack_push_pointer(%3314) : (i64) -> ()
              %3330 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%3330) : (i64) -> ()
              %3331 = func.call @stack_depth() : () -> i64
              %3332 = arith.constant 0 : i64
              %3333 = arith.cmpi sgt, %3331, %3332 : i64
              scf.if %3333 {
                %3334 = func.call @stack_pop_pointer() : () -> i64
              }
              scf.yield %3330 : i64
            }
            func.call @stack_push_nil() : () -> ()
            %3335 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %3336 = func.call @stack_pop_pointer() : () -> i64
            %3337 = func.call @cc_multiple_value_list(%3336) : (i64) -> i64
            %3338 = llvm.mlir.addressof @str248 : !llvm.ptr
            %3339 = arith.constant 38 : i64
            %3340 = func.call @cc_make_string(%3338, %3339) : (!llvm.ptr, i64) -> i64
            %3341 = func.call @cc_nil_value() : () -> i64
            %3342 = func.call @cc_intern(%3340, %3341) : (i64, i64) -> i64
            %3343 = func.call @cc_nil_value() : () -> i64
            %3344 = func.call @cc_cons(%3342, %3343) : (i64, i64) -> i64
            %3345 = func.call @cc_values_pack(%3344) : (i64) -> i64
            %3346 = func.call @cc_symbol_value(%3342) : (i64) -> i64
            %3347 = llvm.mlir.addressof @str249 : !llvm.ptr
            %3348 = arith.constant 39 : i64
            %3349 = func.call @cc_make_string(%3347, %3348) : (!llvm.ptr, i64) -> i64
            %3350 = func.call @cc_nil_value() : () -> i64
            %3351 = func.call @cc_intern(%3349, %3350) : (i64, i64) -> i64
            %3352 = func.call @cc_nil_value() : () -> i64
            %3353 = func.call @cc_cons(%3351, %3352) : (i64, i64) -> i64
            %3354 = func.call @cc_values_pack(%3353) : (i64) -> i64
            %3355 = func.call @cc_symbol_value(%3351) : (i64) -> i64
            %3356 = llvm.mlir.addressof @str250 : !llvm.ptr
            %3357 = arith.constant 40 : i64
            %3358 = func.call @cc_make_string(%3356, %3357) : (!llvm.ptr, i64) -> i64
            %3359 = func.call @cc_nil_value() : () -> i64
            %3360 = func.call @cc_intern(%3358, %3359) : (i64, i64) -> i64
            %3361 = func.call @cc_nil_value() : () -> i64
            %3362 = func.call @cc_cons(%3360, %3361) : (i64, i64) -> i64
            %3363 = func.call @cc_values_pack(%3362) : (i64) -> i64
            %3364 = func.call @cc_symbol_value(%3360) : (i64) -> i64
            %3365 = func.call @cc_nil_value() : () -> i64
            %3366 = arith.cmpi ne, %3346, %3365 : i64
            %3367 = scf.if %3366 -> (i64) {
              scf.yield %3364 : i64
            } else {
              scf.yield %3337 : i64
            }
            %3368 = func.call @cc_values_pack(%3367) : (i64) -> i64
            func.call @stack_push_pointer(%3368) : (i64) -> ()
            %3369 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3369 : i64
          }
          func.call @stack_push_pointer(%3197) : (i64) -> ()
          %3370 = func.call @stack_pop_pointer() : () -> i64
          %3371 = func.call @cc_multiple_value_list(%3370) : (i64) -> i64
          %3372 = func.call @cc_symbol_value(%3114) : (i64) -> i64
          %3373 = func.call @cc_values_pack(%3371) : (i64) -> i64
          func.call @stack_push_pointer(%3373) : (i64) -> ()
          %3374 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3374 : i64
        }
        %3375 = func.call @cc_nil_value() : () -> i64
        %3376 = func.call @cc_errorp(%3138) : (i64) -> i64
        %3377 = arith.cmpi ne, %3376, %3375 : i64
        %3378 = scf.if %3377 -> (i64) {
          scf.yield %3138 : i64
        } else {
          func.call @stack_push_pointer(%3133) : (i64) -> ()
          %3379 = func.call @stack_pop_pointer() : () -> i64
          %3380 = func.call @cc_nil_value() : () -> i64
          %3381 = func.call @cc_errorp(%3379) : (i64) -> i64
          %3382 = arith.cmpi ne, %3381, %3380 : i64
          %3383 = arith.cmpi eq, %3380, %3380 : i64
          %3384 = arith.andi %3382, %3383 : i1
          %3385 = scf.if %3384 -> (i64) {
            scf.yield %3379 : i64
          } else {
            scf.yield %3380 : i64
          }
          %3386 = arith.cmpi ne, %3385, %3380 : i64
          scf.if %3386 {
            func.call @stack_push_pointer(%3385) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3379) : (i64) -> ()
            %3387 = llvm.mlir.addressof @str251 : !llvm.ptr
            %3388 = func.call @cc_make_function_ref_const(%3387) : (!llvm.ptr) -> i64
            %3389 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3388, %3389) : (i64, i64) -> ()
          }
          %3390 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3390 : i64
        }
        func.call @stack_push_pointer(%3378) : (i64) -> ()
        %3391 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3391 : i64
      }
      %3392 = func.call @cc_nil_value() : () -> i64
      %3393 = func.call @cc_errorp(%3120) : (i64) -> i64
      %3394 = arith.cmpi ne, %3393, %3392 : i64
      %3395 = scf.if %3394 -> (i64) {
        scf.yield %3120 : i64
      } else {
        %3396 = arith.constant 10 : i64
        func.call @stack_push_fixnum(%3396) : (i64) -> ()
        %3397 = func.call @stack_pop_pointer() : () -> i64
        %3398 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%3398) : (i64) -> ()
        %3399 = func.call @stack_pop_pointer() : () -> i64
        %3400 = func.call @cc_nil_value() : () -> i64
        %3401 = func.call @cc_nil_value() : () -> i64
        %3402 = func.call @cc_errorp(%3400) : (i64) -> i64
        %3403 = arith.cmpi ne, %3402, %3401 : i64
        %3404 = scf.if %3403 -> (i64) {
          scf.yield %3400 : i64
        } else {
          %3405 = func.call @cc_nil_value() : () -> i64
          %3406 = llvm.mlir.addressof @str252 : !llvm.ptr
          %3407 = arith.constant 38 : i64
          %3408 = func.call @cc_make_string(%3406, %3407) : (!llvm.ptr, i64) -> i64
          %3409 = func.call @cc_nil_value() : () -> i64
          %3410 = func.call @cc_intern(%3408, %3409) : (i64, i64) -> i64
          %3411 = func.call @cc_nil_value() : () -> i64
          %3412 = func.call @cc_cons(%3410, %3411) : (i64, i64) -> i64
          %3413 = func.call @cc_values_pack(%3412) : (i64) -> i64
          %3414 = func.call @cc_set_symbol_value(%3410, %3405) : (i64, i64) -> i64
          %3415 = llvm.mlir.addressof @str253 : !llvm.ptr
          %3416 = arith.constant 39 : i64
          %3417 = func.call @cc_make_string(%3415, %3416) : (!llvm.ptr, i64) -> i64
          %3418 = func.call @cc_nil_value() : () -> i64
          %3419 = func.call @cc_intern(%3417, %3418) : (i64, i64) -> i64
          %3420 = func.call @cc_nil_value() : () -> i64
          %3421 = func.call @cc_cons(%3419, %3420) : (i64, i64) -> i64
          %3422 = func.call @cc_values_pack(%3421) : (i64) -> i64
          %3423 = func.call @cc_set_symbol_value(%3419, %3405) : (i64, i64) -> i64
          %3424 = llvm.mlir.addressof @str254 : !llvm.ptr
          %3425 = arith.constant 40 : i64
          %3426 = func.call @cc_make_string(%3424, %3425) : (!llvm.ptr, i64) -> i64
          %3427 = func.call @cc_nil_value() : () -> i64
          %3428 = func.call @cc_intern(%3426, %3427) : (i64, i64) -> i64
          %3429 = func.call @cc_nil_value() : () -> i64
          %3430 = func.call @cc_cons(%3428, %3429) : (i64, i64) -> i64
          %3431 = func.call @cc_values_pack(%3430) : (i64) -> i64
          %3432 = func.call @cc_set_symbol_value(%3428, %3405) : (i64, i64) -> i64
          %3433:1 = scf.while (%arg0 = %3399) : (i64) -> (i64) {
            func.call @stack_push_pointer(%arg0) : (i64) -> ()
            %3434 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3397) : (i64) -> ()
            %3435 = func.call @stack_pop_pointer() : () -> i64
            %3436 = arith.constant 1 : i1
            %3438 = arith.constant 3 : i64
            %3437 = arith.andi %3434, %3438 : i64
            %3439 = arith.constant 0 : i64
            %3440 = arith.cmpi eq, %3437, %3439 : i64
            %3442 = arith.constant 3 : i64
            %3441 = arith.andi %3435, %3442 : i64
            %3443 = arith.constant 0 : i64
            %3444 = arith.cmpi eq, %3441, %3443 : i64
            %3445 = arith.andi %3440, %3444 : i1
            %3446 = scf.if %3445 -> (i1) {
              %3447 = arith.constant 2 : i64
              %3448 = arith.shrsi %3434, %3447 : i64
              %3449 = arith.constant 2 : i64
              %3450 = arith.shrsi %3435, %3449 : i64
              %3451 = arith.cmpi slt, %3448, %3450 : i64
              scf.yield %3451 : i1
            } else {
              %3452 = func.call @cc_lt(%3434, %3435) : (i64, i64) -> i64
              %3453 = func.call @cc_nil_value() : () -> i64
              %3454 = arith.cmpi ne, %3452, %3453 : i64
              scf.yield %3454 : i1
            }
            %3455 = arith.andi %3436, %3446 : i1
            %3456 = func.call @cc_nil_value() : () -> i64
            %3457 = func.call @cc_t_value() : () -> i64
            %3458 = scf.if %3455 -> (i64) {
              scf.yield %3457 : i64
            } else {
              scf.yield %3456 : i64
            }
            func.call @stack_push_pointer(%3458) : (i64) -> ()
            %3459 = func.call @stack_pop_pointer() : () -> i64
            %3460 = func.call @cc_nil_value() : () -> i64
            %3461 = arith.cmpi ne, %3459, %3460 : i64
            %3462 = func.call @cc_nil_value() : () -> i64
            %3463 = llvm.mlir.addressof @str255 : !llvm.ptr
            %3464 = arith.constant 38 : i64
            %3465 = func.call @cc_make_string(%3463, %3464) : (!llvm.ptr, i64) -> i64
            %3466 = func.call @cc_nil_value() : () -> i64
            %3467 = func.call @cc_intern(%3465, %3466) : (i64, i64) -> i64
            %3468 = func.call @cc_nil_value() : () -> i64
            %3469 = func.call @cc_cons(%3467, %3468) : (i64, i64) -> i64
            %3470 = func.call @cc_values_pack(%3469) : (i64) -> i64
            %3471 = func.call @cc_symbol_value(%3467) : (i64) -> i64
            %3472 = arith.cmpi ne, %3471, %3462 : i64
            %3473 = llvm.mlir.addressof @str256 : !llvm.ptr
            %3474 = arith.constant 38 : i64
            %3475 = func.call @cc_make_string(%3473, %3474) : (!llvm.ptr, i64) -> i64
            %3476 = func.call @cc_nil_value() : () -> i64
            %3477 = func.call @cc_intern(%3475, %3476) : (i64, i64) -> i64
            %3478 = func.call @cc_nil_value() : () -> i64
            %3479 = func.call @cc_cons(%3477, %3478) : (i64, i64) -> i64
            %3480 = func.call @cc_values_pack(%3479) : (i64) -> i64
            %3481 = func.call @cc_symbol_value(%3477) : (i64) -> i64
            %3482 = arith.cmpi ne, %3481, %3462 : i64
            %3483 = arith.ori %3472, %3482 : i1
            %3484 = arith.constant 0 : i1
            %3485 = arith.cmpi eq, %3483, %3484 : i1
            %3486 = arith.andi %3461, %3485 : i1
            scf.condition(%3486) %arg0 : i64
          } do {
            ^bb0(%3487: i64):
            %3488 = func.call @cc_nil_value() : () -> i64
            %3489 = arith.cmpi ne, %3488, %3488 : i64
            scf.if %3489 {
              func.call @stack_push_pointer(%3488) : (i64) -> ()
            } else {
              %3490 = llvm.mlir.addressof @str257 : !llvm.ptr
              %3491 = func.call @cc_make_function_ref_const(%3490) : (!llvm.ptr) -> i64
              %3492 = arith.constant 0 : i64
              func.call @cc_funcall_stack(%3491, %3492) : (i64, i64) -> ()
            }
            %3493 = func.call @stack_depth() : () -> i64
            %3494 = arith.constant 0 : i64
            %3495 = arith.cmpi sgt, %3493, %3494 : i64
            scf.if %3495 {
              %3496 = func.call @stack_pop_pointer() : () -> i64
            }
            func.call @stack_push_pointer(%3487) : (i64) -> ()
            %3497 = func.call @stack_pop_pointer() : () -> i64
            %3498 = arith.constant 1 : i64
            func.call @stack_push_fixnum(%3498) : (i64) -> ()
            %3499 = func.call @stack_pop_pointer() : () -> i64
            %3501 = arith.constant 3 : i64
            %3500 = arith.andi %3497, %3501 : i64
            %3502 = arith.constant 0 : i64
            %3503 = arith.cmpi eq, %3500, %3502 : i64
            %3505 = arith.constant 3 : i64
            %3504 = arith.andi %3499, %3505 : i64
            %3506 = arith.constant 0 : i64
            %3507 = arith.cmpi eq, %3504, %3506 : i64
            %3508 = arith.andi %3503, %3507 : i1
            %3509 = scf.if %3508 -> (i64) {
              %3510 = arith.constant 2 : i64
              %3511 = arith.shrsi %3497, %3510 : i64
              %3512 = arith.constant 2 : i64
              %3513 = arith.shrsi %3499, %3512 : i64
              %3514 = arith.addi %3511, %3513 : i64
              %3515 = arith.constant -2305843009213693952 : i64
              %3516 = arith.constant 2305843009213693951 : i64
              %3517 = arith.cmpi sge, %3514, %3515 : i64
              %3518 = arith.cmpi sle, %3514, %3516 : i64
              %3519 = arith.andi %3517, %3518 : i1
              %3520 = scf.if %3519 -> (i64) {
                %3521 = arith.constant 2 : i64
                %3522 = arith.shli %3514, %3521 : i64
                scf.yield %3522 : i64
              } else {
                %3523 = func.call @cc_add(%3497, %3499) : (i64, i64) -> i64
                scf.yield %3523 : i64
              }
              scf.yield %3520 : i64
            } else {
              %3524 = func.call @cc_add(%3497, %3499) : (i64, i64) -> i64
              scf.yield %3524 : i64
            }
            func.call @stack_push_pointer(%3509) : (i64) -> ()
            %3525 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3525) : (i64) -> ()
            %3526 = func.call @stack_depth() : () -> i64
            %3527 = arith.constant 0 : i64
            %3528 = arith.cmpi sgt, %3526, %3527 : i64
            scf.if %3528 {
              %3529 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %3525 : i64
          }
          func.call @stack_push_nil() : () -> ()
          %3530 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %3531 = func.call @stack_pop_pointer() : () -> i64
          %3532 = func.call @cc_multiple_value_list(%3531) : (i64) -> i64
          %3533 = llvm.mlir.addressof @str258 : !llvm.ptr
          %3534 = arith.constant 38 : i64
          %3535 = func.call @cc_make_string(%3533, %3534) : (!llvm.ptr, i64) -> i64
          %3536 = func.call @cc_nil_value() : () -> i64
          %3537 = func.call @cc_intern(%3535, %3536) : (i64, i64) -> i64
          %3538 = func.call @cc_nil_value() : () -> i64
          %3539 = func.call @cc_cons(%3537, %3538) : (i64, i64) -> i64
          %3540 = func.call @cc_values_pack(%3539) : (i64) -> i64
          %3541 = func.call @cc_symbol_value(%3537) : (i64) -> i64
          %3542 = llvm.mlir.addressof @str259 : !llvm.ptr
          %3543 = arith.constant 39 : i64
          %3544 = func.call @cc_make_string(%3542, %3543) : (!llvm.ptr, i64) -> i64
          %3545 = func.call @cc_nil_value() : () -> i64
          %3546 = func.call @cc_intern(%3544, %3545) : (i64, i64) -> i64
          %3547 = func.call @cc_nil_value() : () -> i64
          %3548 = func.call @cc_cons(%3546, %3547) : (i64, i64) -> i64
          %3549 = func.call @cc_values_pack(%3548) : (i64) -> i64
          %3550 = func.call @cc_symbol_value(%3546) : (i64) -> i64
          %3551 = llvm.mlir.addressof @str260 : !llvm.ptr
          %3552 = arith.constant 40 : i64
          %3553 = func.call @cc_make_string(%3551, %3552) : (!llvm.ptr, i64) -> i64
          %3554 = func.call @cc_nil_value() : () -> i64
          %3555 = func.call @cc_intern(%3553, %3554) : (i64, i64) -> i64
          %3556 = func.call @cc_nil_value() : () -> i64
          %3557 = func.call @cc_cons(%3555, %3556) : (i64, i64) -> i64
          %3558 = func.call @cc_values_pack(%3557) : (i64) -> i64
          %3559 = func.call @cc_symbol_value(%3555) : (i64) -> i64
          %3560 = func.call @cc_nil_value() : () -> i64
          %3561 = arith.cmpi ne, %3541, %3560 : i64
          %3562 = scf.if %3561 -> (i64) {
            scf.yield %3559 : i64
          } else {
            scf.yield %3532 : i64
          }
          %3563 = func.call @cc_values_pack(%3562) : (i64) -> i64
          func.call @stack_push_pointer(%3563) : (i64) -> ()
          %3564 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3564 : i64
        }
        func.call @stack_push_pointer(%3404) : (i64) -> ()
        %3565 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3565 : i64
      }
      %3566 = func.call @cc_nil_value() : () -> i64
      %3567 = func.call @cc_errorp(%3395) : (i64) -> i64
      %3568 = arith.cmpi ne, %3567, %3566 : i64
      %3569 = scf.if %3568 -> (i64) {
        scf.yield %3395 : i64
      } else {
        %3570 = func.call @cc_symbol_value(%3114) : (i64) -> i64
        func.call @stack_push_pointer(%3570) : (i64) -> ()
        %3571 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3571 : i64
      }
      func.call @stack_push_pointer(%3569) : (i64) -> ()
      %3572 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3572 : i64
    }
    func.call @stack_push_pointer(%3108) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("FINALIZED-OBJECTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1("maker\0An\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_236837129945088*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_236837129945088*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_236837129945088*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETFLAG_236837129945089*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str6("*__MLIR_BLOCK_RETVALUE_236837129945089*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETMVLIST_236837129945089*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str8("#:%%DYN-CELL-236837129945090-COUNTC\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str9("CLASP-TESTS::inc\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETFLAG_236837129945093*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str11("*__MLIR_BLOCK_RETVALUE_236837129945093*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str12("*__MLIR_BLOCK_RETMVLIST_236837129945093*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str13("*__MLIR_BLOCK_RETFLAG_236837129945088*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str14("*__MLIR_BLOCK_RETFLAG_236837129945089*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETFLAG_236837129945093*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str16("gctools:finalize\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str17("ext:make-weak-pointer\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETFLAG_236837129945093*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETVALUE_236837129945093*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETMVLIST_236837129945093*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETFLAG_236837129945089*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETVALUE_236837129945089*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETMVLIST_236837129945089*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETFLAG_236837129945088*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETMVLIST_236837129945088*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str26("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str27("maker\0An\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETFLAG_236837129945095*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str29("*__MLIR_BLOCK_RETVALUE_236837129945095*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str30("*__MLIR_BLOCK_RETMVLIST_236837129945095*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_236837129945096*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETVALUE_236837129945096*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str33("*__MLIR_BLOCK_RETMVLIST_236837129945096*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str34("CLASP-TESTS::finalized-objects\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str35("*__MLIR_BLOCK_RETFLAG_236837129945097*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str36("*__MLIR_BLOCK_RETVALUE_236837129945097*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str37("*__MLIR_BLOCK_RETMVLIST_236837129945097*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str38("*__MLIR_BLOCK_RETFLAG_236837129945095*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str39("*__MLIR_BLOCK_RETFLAG_236837129945096*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str40("*__MLIR_BLOCK_RETFLAG_236837129945097*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str41("gctools:garbage-collect\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str42("*__MLIR_BLOCK_RETFLAG_236837129945097*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str43("*__MLIR_BLOCK_RETVALUE_236837129945097*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str44("*__MLIR_BLOCK_RETMVLIST_236837129945097*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str45("gctools:invoke-finalizers\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str46("ext:weak-pointer-valid\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str47("COUNT-IF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str48("*__MLIR_BLOCK_RETFLAG_236837129945096*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str49("*__MLIR_BLOCK_RETVALUE_236837129945096*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str50("*__MLIR_BLOCK_RETMVLIST_236837129945096*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str51("*__MLIR_BLOCK_RETFLAG_236837129945095*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str52("*__MLIR_BLOCK_RETMVLIST_236837129945095*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str53("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str54("*__MLIR_BLOCK_RETFLAG_236837129945098*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str55("*__MLIR_BLOCK_RETVALUE_236837129945098*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str56("*__MLIR_BLOCK_RETMVLIST_236837129945098*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str57("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str58("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str59("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str60("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str61("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str62("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str63("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str64("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str65("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str66("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str69("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str70("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("FINALIZE-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str72("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str73("*A*\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str74("*COUNT*\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str75("%FN%finalized-objects\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str76("FINALIZED-OBJECTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str77("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str78("%FN%finalized-objects\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str79("FINALIZED-OBJECTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str80("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str81("%FN%finalized-objects\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str82("FINALIZED-OBJECTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str83("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str84("%FN%finalized-objects\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str85("FINALIZED-OBJECTS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str86("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str87("%FN%test-finalizers\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str88("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str89("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str90("%FN%test-finalizers\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str91("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str92("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str93("%FN%test-finalizers\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str94("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str95("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str96("%FN%test-finalizers\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str97("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str98("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str99("FINALIZERS-CONS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str100("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str101("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str102("MAKE-LIST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("%FN%test-finalizers\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str105("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("Check if list of cons finalizers were executed\00") : !llvm.array<47 x i8>
  llvm.mlir.global private constant @str108("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str109("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str110("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str111("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str112("FINALIZERS-CONS-REMOVE\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str113("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str114("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str115("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str116("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str117("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str118("MAKE-LIST\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str119("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str121("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str122("INC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str123("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str124("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str125("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str126("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str129("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str130("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str132("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str133("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str134("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str135("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str136("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str137("FINALIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str138("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str140("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("INC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str143("DEFINALIZE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str144("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str145("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str146("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str147("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str148("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("GARBAGE-COLLECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str151("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str152("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("#:%%DYN-CELL-236837129945102-COUNT\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str155("inc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str156("*__MLIR_BLOCK_RETFLAG_236837129945105*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str157("*__MLIR_BLOCK_RETVALUE_236837129945105*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str158("*__MLIR_BLOCK_RETMVLIST_236837129945105*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str159("*__MLIR_BLOCK_RETFLAG_236837129945098*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str160("*__MLIR_BLOCK_RETFLAG_236837129945105*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str161("gctools:finalize\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str162("*__MLIR_BLOCK_RETFLAG_236837129945105*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str163("*__MLIR_BLOCK_RETVALUE_236837129945105*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str164("*__MLIR_BLOCK_RETMVLIST_236837129945105*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str165("gctools:definalize\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str166("*__MLIR_BLOCK_RETFLAG_236837129945106*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str167("*__MLIR_BLOCK_RETVALUE_236837129945106*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str168("*__MLIR_BLOCK_RETMVLIST_236837129945106*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str169("*__MLIR_BLOCK_RETFLAG_236837129945098*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str170("*__MLIR_BLOCK_RETFLAG_236837129945106*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str171("gctools:garbage-collect\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str172("*__MLIR_BLOCK_RETFLAG_236837129945106*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str173("*__MLIR_BLOCK_RETVALUE_236837129945106*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str174("*__MLIR_BLOCK_RETMVLIST_236837129945106*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str175("#:%%DYN-CELL-236837129945107-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str176("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str178("Check if list of cons finalizers were discarded\00") : !llvm.array<48 x i8>
  llvm.mlir.global private constant @str179("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str180("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str181("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str182("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str183("FINALIZERS-GENERAL\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str184("TEST-FINALIZERS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str185("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str186("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str187("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str188("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str189("%FN%test-finalizers\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str190("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str191("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str192("Check if list of general finalizers were executed\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str193("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str194("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str195("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str196("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str197("FINALIZERS-GENERAL-REMOVE\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str198("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str199("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str200("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str201("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str202("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str203("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str204("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str206("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str207("INC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str208("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str209("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str210("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str211("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str212("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str213("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str214("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str217("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str218("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str219("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str220("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("FINALIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str223("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str224("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str225("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str226("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str227("INC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str228("DEFINALIZE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str229("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str230("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str231("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str232("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str233("DO\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str234("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str235("GARBAGE-COLLECT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str236("GCTOOLS\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str237("COUNT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str238("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str239("#:%%DYN-CELL-236837129945111-COUNT\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str240("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str241("inc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str242("*__MLIR_BLOCK_RETFLAG_236837129945114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str243("*__MLIR_BLOCK_RETVALUE_236837129945114*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str244("*__MLIR_BLOCK_RETMVLIST_236837129945114*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str245("*__MLIR_BLOCK_RETFLAG_236837129945098*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str246("*__MLIR_BLOCK_RETFLAG_236837129945114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str247("gctools:finalize\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str248("*__MLIR_BLOCK_RETFLAG_236837129945114*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str249("*__MLIR_BLOCK_RETVALUE_236837129945114*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str250("*__MLIR_BLOCK_RETMVLIST_236837129945114*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str251("gctools:definalize\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str252("*__MLIR_BLOCK_RETFLAG_236837129945115*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str253("*__MLIR_BLOCK_RETVALUE_236837129945115*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str254("*__MLIR_BLOCK_RETMVLIST_236837129945115*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str255("*__MLIR_BLOCK_RETFLAG_236837129945098*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str256("*__MLIR_BLOCK_RETFLAG_236837129945115*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str257("gctools:garbage-collect\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str258("*__MLIR_BLOCK_RETFLAG_236837129945115*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str259("*__MLIR_BLOCK_RETVALUE_236837129945115*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str260("*__MLIR_BLOCK_RETMVLIST_236837129945115*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str261("#:%%DYN-CELL-236837129945116-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str262("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str263("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str264("Check if list of general finalizers were discarded\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str265("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str266("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str267("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str268("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str269("*__MLIR_BLOCK_RETFLAG_236837129945098*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str270("*__MLIR_BLOCK_RETMVLIST_236837129945098*\00") : !llvm.array<41 x i8>
}
