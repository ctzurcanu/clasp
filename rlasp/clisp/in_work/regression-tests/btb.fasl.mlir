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
      func.call @stack_push_pointer(%46) : (i64) -> ()
      %50 = func.call @stack_pop_pointer() : () -> i64
      %51 = func.call @cc_in_package(%50) : (i64) -> i64
      func.call @stack_push_pointer(%51) : (i64) -> ()
      %52 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %52 : i64
    }
    %53 = func.call @cc_nil_value() : () -> i64
    %54 = func.call @cc_errorp(%41) : (i64) -> i64
    %55 = arith.cmpi ne, %54, %53 : i64
    %56 = scf.if %55 -> (i64) {
      scf.yield %41 : i64
    } else {
      %57 = llvm.mlir.addressof @str5 : !llvm.ptr
      %58 = arith.constant 13 : i64
      %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_intern(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = llvm.mlir.addressof @str6 : !llvm.ptr
      %67 = arith.constant 3 : i64
      %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
      %69 = func.call @cc_nil_value() : () -> i64
      %70 = func.call @cc_intern(%68, %69) : (i64, i64) -> i64
      %71 = func.call @cc_nil_value() : () -> i64
      %72 = func.call @cc_cons(%70, %71) : (i64, i64) -> i64
      %73 = func.call @cc_values_pack(%72) : (i64) -> i64
      func.call @stack_push_pointer(%70) : (i64) -> ()
      %74 = llvm.mlir.addressof @str7 : !llvm.ptr
      %75 = arith.constant 1 : i64
      %76 = func.call @cc_make_string(%74, %75) : (!llvm.ptr, i64) -> i64
      %77 = func.call @cc_nil_value() : () -> i64
      %78 = func.call @cc_intern(%76, %77) : (i64, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
      %81 = func.call @cc_values_pack(%80) : (i64) -> i64
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %82 = llvm.mlir.addressof @str8 : !llvm.ptr
      %83 = arith.constant 7 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = llvm.mlir.addressof @str9 : !llvm.ptr
      %86 = arith.constant 11 : i64
      %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
      %88 = func.call @cc_intern(%84, %87) : (i64, i64) -> i64
      %89 = func.call @cc_nil_value() : () -> i64
      %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
      %91 = func.call @cc_values_pack(%90) : (i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %92 = llvm.mlir.addressof @str10 : !llvm.ptr
      %93 = arith.constant 11 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = llvm.mlir.addressof @str11 : !llvm.ptr
      %96 = arith.constant 3 : i64
      %97 = func.call @cc_make_string(%95, %96) : (!llvm.ptr, i64) -> i64
      %98 = func.call @cc_intern(%94, %97) : (i64, i64) -> i64
      %99 = func.call @cc_nil_value() : () -> i64
      %100 = func.call @cc_cons(%98, %99) : (i64, i64) -> i64
      %101 = func.call @cc_values_pack(%100) : (i64) -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
      %102 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%102) : (i64) -> ()
      %103 = llvm.mlir.addressof @str12 : !llvm.ptr
      %104 = arith.constant 6 : i64
      %105 = func.call @cc_make_string(%103, %104) : (!llvm.ptr, i64) -> i64
      %106 = llvm.mlir.addressof @str13 : !llvm.ptr
      %107 = arith.constant 11 : i64
      %108 = func.call @cc_make_string(%106, %107) : (!llvm.ptr, i64) -> i64
      %109 = func.call @cc_intern(%105, %108) : (i64, i64) -> i64
      %110 = func.call @cc_nil_value() : () -> i64
      %111 = func.call @cc_cons(%109, %110) : (i64, i64) -> i64
      %112 = func.call @cc_values_pack(%111) : (i64) -> i64
      func.call @stack_push_pointer(%109) : (i64) -> ()
      %113 = llvm.mlir.addressof @str14 : !llvm.ptr
      %114 = arith.constant 1 : i64
      %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
      %116 = func.call @cc_nil_value() : () -> i64
      %117 = func.call @cc_intern(%115, %116) : (i64, i64) -> i64
      %118 = func.call @cc_nil_value() : () -> i64
      %119 = func.call @cc_cons(%117, %118) : (i64, i64) -> i64
      %120 = func.call @cc_values_pack(%119) : (i64) -> i64
      func.call @stack_push_pointer(%117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @cc_cons(%122, %121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%123) : (i64) -> ()
      %124 = llvm.mlir.addressof @str15 : !llvm.ptr
      %125 = arith.constant 6 : i64
      %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
      %127 = llvm.mlir.addressof @str16 : !llvm.ptr
      %128 = arith.constant 11 : i64
      %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
      %130 = func.call @cc_intern(%126, %129) : (i64, i64) -> i64
      %131 = func.call @cc_nil_value() : () -> i64
      %132 = func.call @cc_cons(%130, %131) : (i64, i64) -> i64
      %133 = func.call @cc_values_pack(%132) : (i64) -> i64
      func.call @stack_push_pointer(%130) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %134 = llvm.mlir.addressof @str17 : !llvm.ptr
      %135 = arith.constant 1 : i64
      %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
      %137 = func.call @cc_nil_value() : () -> i64
      %138 = func.call @cc_intern(%136, %137) : (i64, i64) -> i64
      %139 = func.call @cc_nil_value() : () -> i64
      %140 = func.call @cc_cons(%138, %139) : (i64, i64) -> i64
      %141 = func.call @cc_values_pack(%140) : (i64) -> i64
      func.call @stack_push_pointer(%138) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %142 = func.call @stack_pop_pointer() : () -> i64
      %143 = func.call @stack_pop_pointer() : () -> i64
      %144 = func.call @cc_cons(%143, %142) : (i64, i64) -> i64
      func.call @stack_push_pointer(%144) : (i64) -> ()
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = func.call @stack_pop_pointer() : () -> i64
      %147 = func.call @cc_cons(%146, %145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%147) : (i64) -> ()
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = func.call @stack_pop_pointer() : () -> i64
      %150 = func.call @cc_cons(%149, %148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %151 = func.call @stack_pop_pointer() : () -> i64
      %152 = func.call @stack_pop_pointer() : () -> i64
      %153 = func.call @cc_cons(%152, %151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%153) : (i64) -> ()
      %154 = func.call @stack_pop_pointer() : () -> i64
      %155 = func.call @stack_pop_pointer() : () -> i64
      %156 = func.call @cc_cons(%155, %154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%156) : (i64) -> ()
      %157 = func.call @stack_pop_pointer() : () -> i64
      %158 = func.call @stack_pop_pointer() : () -> i64
      %159 = func.call @cc_cons(%158, %157) : (i64, i64) -> i64
      func.call @stack_push_pointer(%159) : (i64) -> ()
      %160 = func.call @stack_pop_pointer() : () -> i64
      %161 = func.call @stack_pop_pointer() : () -> i64
      %162 = func.call @cc_cons(%160, %161) : (i64, i64) -> i64
      %163 = llvm.mlir.addressof @str18 : !llvm.ptr
      %164 = arith.constant 5 : i64
      %165 = func.call @cc_make_string(%163, %164) : (!llvm.ptr, i64) -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      %167 = func.call @cc_intern(%165, %166) : (i64, i64) -> i64
      %168 = func.call @cc_nil_value() : () -> i64
      %169 = func.call @cc_cons(%167, %168) : (i64, i64) -> i64
      %170 = func.call @cc_values_pack(%169) : (i64) -> i64
      %171 = func.call @cc_cons(%167, %162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%171) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %172 = func.call @stack_pop_pointer() : () -> i64
      %173 = func.call @stack_pop_pointer() : () -> i64
      %174 = func.call @cc_cons(%173, %172) : (i64, i64) -> i64
      func.call @stack_push_pointer(%174) : (i64) -> ()
      %175 = func.call @stack_pop_pointer() : () -> i64
      %176 = func.call @stack_pop_pointer() : () -> i64
      %177 = func.call @cc_cons(%176, %175) : (i64, i64) -> i64
      func.call @stack_push_pointer(%177) : (i64) -> ()
      %178 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%178) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %179 = func.call @stack_pop_pointer() : () -> i64
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @cc_cons(%180, %179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%181) : (i64) -> ()
      %182 = func.call @stack_pop_pointer() : () -> i64
      %183 = func.call @stack_pop_pointer() : () -> i64
      %184 = func.call @cc_cons(%183, %182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%184) : (i64) -> ()
      %185 = func.call @stack_pop_pointer() : () -> i64
      %186 = func.call @stack_pop_pointer() : () -> i64
      %187 = func.call @cc_cons(%186, %185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%187) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %188 = func.call @stack_pop_pointer() : () -> i64
      %189 = func.call @stack_pop_pointer() : () -> i64
      %190 = func.call @cc_cons(%189, %188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%190) : (i64) -> ()
      %191 = func.call @stack_pop_pointer() : () -> i64
      %192 = func.call @stack_pop_pointer() : () -> i64
      %193 = func.call @cc_cons(%192, %191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%193) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %194 = func.call @stack_pop_pointer() : () -> i64
      %195 = func.call @stack_pop_pointer() : () -> i64
      %196 = func.call @cc_cons(%195, %194) : (i64, i64) -> i64
      func.call @stack_push_pointer(%196) : (i64) -> ()
      %197 = llvm.mlir.addressof @str19 : !llvm.ptr
      %198 = arith.constant 19 : i64
      %199 = func.call @cc_make_string(%197, %198) : (!llvm.ptr, i64) -> i64
      %200 = llvm.mlir.addressof @str20 : !llvm.ptr
      %201 = arith.constant 11 : i64
      %202 = func.call @cc_make_string(%200, %201) : (!llvm.ptr, i64) -> i64
      %203 = func.call @cc_intern(%199, %202) : (i64, i64) -> i64
      %204 = func.call @cc_nil_value() : () -> i64
      %205 = func.call @cc_cons(%203, %204) : (i64, i64) -> i64
      %206 = func.call @cc_values_pack(%205) : (i64) -> i64
      func.call @stack_push_pointer(%203) : (i64) -> ()
      %207 = llvm.mlir.addressof @str21 : !llvm.ptr
      %208 = arith.constant 2 : i64
      %209 = func.call @cc_make_string(%207, %208) : (!llvm.ptr, i64) -> i64
      %210 = func.call @cc_nil_value() : () -> i64
      %211 = func.call @cc_intern(%209, %210) : (i64, i64) -> i64
      %212 = func.call @cc_nil_value() : () -> i64
      %213 = func.call @cc_cons(%211, %212) : (i64, i64) -> i64
      %214 = func.call @cc_values_pack(%213) : (i64) -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
      %215 = llvm.mlir.addressof @str22 : !llvm.ptr
      %216 = arith.constant 9 : i64
      %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_intern(%217, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      func.call @stack_push_pointer(%219) : (i64) -> ()
      %223 = llvm.mlir.addressof @str23 : !llvm.ptr
      %224 = arith.constant 8 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = func.call @cc_nil_value() : () -> i64
      %227 = func.call @cc_intern(%225, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      func.call @stack_push_pointer(%227) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %231 = func.call @stack_pop_pointer() : () -> i64
      %232 = func.call @stack_pop_pointer() : () -> i64
      %233 = func.call @cc_cons(%232, %231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%233) : (i64) -> ()
      %234 = func.call @stack_pop_pointer() : () -> i64
      %235 = func.call @stack_pop_pointer() : () -> i64
      %236 = func.call @cc_cons(%235, %234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%236) : (i64) -> ()
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @stack_pop_pointer() : () -> i64
      %239 = func.call @cc_cons(%238, %237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %240 = llvm.mlir.addressof @str24 : !llvm.ptr
      %241 = arith.constant 7 : i64
      %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
      %243 = llvm.mlir.addressof @str25 : !llvm.ptr
      %244 = arith.constant 11 : i64
      %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
      %246 = func.call @cc_intern(%242, %245) : (i64, i64) -> i64
      %247 = func.call @cc_nil_value() : () -> i64
      %248 = func.call @cc_cons(%246, %247) : (i64, i64) -> i64
      %249 = func.call @cc_values_pack(%248) : (i64) -> i64
      func.call @stack_push_pointer(%246) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %250 = llvm.mlir.addressof @str26 : !llvm.ptr
      %251 = arith.constant 1 : i64
      %252 = func.call @cc_make_string(%250, %251) : (!llvm.ptr, i64) -> i64
      %253 = func.call @cc_nil_value() : () -> i64
      %254 = func.call @cc_intern(%252, %253) : (i64, i64) -> i64
      %255 = func.call @cc_nil_value() : () -> i64
      %256 = func.call @cc_cons(%254, %255) : (i64, i64) -> i64
      %257 = func.call @cc_values_pack(%256) : (i64) -> i64
      func.call @stack_push_pointer(%254) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %258 = func.call @stack_pop_pointer() : () -> i64
      %259 = func.call @stack_pop_pointer() : () -> i64
      %260 = func.call @cc_cons(%259, %258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%260) : (i64) -> ()
      %261 = func.call @stack_pop_pointer() : () -> i64
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @cc_cons(%262, %261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%263) : (i64) -> ()
      %264 = func.call @stack_pop_pointer() : () -> i64
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @cc_cons(%265, %264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%266) : (i64) -> ()
      %267 = llvm.mlir.addressof @str27 : !llvm.ptr
      %268 = arith.constant 6 : i64
      %269 = func.call @cc_make_string(%267, %268) : (!llvm.ptr, i64) -> i64
      %270 = llvm.mlir.addressof @str28 : !llvm.ptr
      %271 = arith.constant 11 : i64
      %272 = func.call @cc_make_string(%270, %271) : (!llvm.ptr, i64) -> i64
      %273 = func.call @cc_intern(%269, %272) : (i64, i64) -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = func.call @cc_cons(%273, %274) : (i64, i64) -> i64
      %276 = func.call @cc_values_pack(%275) : (i64) -> i64
      func.call @stack_push_pointer(%273) : (i64) -> ()
      %277 = llvm.mlir.addressof @str29 : !llvm.ptr
      %278 = arith.constant 7 : i64
      %279 = func.call @cc_make_string(%277, %278) : (!llvm.ptr, i64) -> i64
      %280 = llvm.mlir.addressof @str30 : !llvm.ptr
      %281 = arith.constant 11 : i64
      %282 = func.call @cc_make_string(%280, %281) : (!llvm.ptr, i64) -> i64
      %283 = func.call @cc_intern(%279, %282) : (i64, i64) -> i64
      %284 = func.call @cc_nil_value() : () -> i64
      %285 = func.call @cc_cons(%283, %284) : (i64, i64) -> i64
      %286 = func.call @cc_values_pack(%285) : (i64) -> i64
      func.call @stack_push_pointer(%283) : (i64) -> ()
      %287 = llvm.mlir.addressof @str31 : !llvm.ptr
      %288 = arith.constant 1 : i64
      %289 = func.call @cc_make_string(%287, %288) : (!llvm.ptr, i64) -> i64
      %290 = func.call @cc_nil_value() : () -> i64
      %291 = func.call @cc_intern(%289, %290) : (i64, i64) -> i64
      %292 = func.call @cc_nil_value() : () -> i64
      %293 = func.call @cc_cons(%291, %292) : (i64, i64) -> i64
      %294 = func.call @cc_values_pack(%293) : (i64) -> i64
      func.call @stack_push_pointer(%291) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @stack_pop_pointer() : () -> i64
      %297 = func.call @cc_cons(%296, %295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      %298 = func.call @stack_pop_pointer() : () -> i64
      %299 = func.call @stack_pop_pointer() : () -> i64
      %300 = func.call @cc_cons(%299, %298) : (i64, i64) -> i64
      func.call @stack_push_pointer(%300) : (i64) -> ()
      %301 = llvm.mlir.addressof @str32 : !llvm.ptr
      %302 = arith.constant 7 : i64
      %303 = func.call @cc_make_string(%301, %302) : (!llvm.ptr, i64) -> i64
      %304 = llvm.mlir.addressof @str33 : !llvm.ptr
      %305 = arith.constant 11 : i64
      %306 = func.call @cc_make_string(%304, %305) : (!llvm.ptr, i64) -> i64
      %307 = func.call @cc_intern(%303, %306) : (i64, i64) -> i64
      %308 = func.call @cc_nil_value() : () -> i64
      %309 = func.call @cc_cons(%307, %308) : (i64, i64) -> i64
      %310 = func.call @cc_values_pack(%309) : (i64) -> i64
      func.call @stack_push_pointer(%307) : (i64) -> ()
      %311 = llvm.mlir.addressof @str34 : !llvm.ptr
      %312 = arith.constant 2 : i64
      %313 = func.call @cc_make_string(%311, %312) : (!llvm.ptr, i64) -> i64
      %314 = func.call @cc_nil_value() : () -> i64
      %315 = func.call @cc_intern(%313, %314) : (i64, i64) -> i64
      %316 = func.call @cc_nil_value() : () -> i64
      %317 = func.call @cc_cons(%315, %316) : (i64, i64) -> i64
      %318 = func.call @cc_values_pack(%317) : (i64) -> i64
      func.call @stack_push_pointer(%315) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %319 = func.call @stack_pop_pointer() : () -> i64
      %320 = func.call @stack_pop_pointer() : () -> i64
      %321 = func.call @cc_cons(%320, %319) : (i64, i64) -> i64
      func.call @stack_push_pointer(%321) : (i64) -> ()
      %322 = func.call @stack_pop_pointer() : () -> i64
      %323 = func.call @stack_pop_pointer() : () -> i64
      %324 = func.call @cc_cons(%323, %322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%324) : (i64) -> ()
      %325 = llvm.mlir.addressof @str35 : !llvm.ptr
      %326 = arith.constant 9 : i64
      %327 = func.call @cc_make_string(%325, %326) : (!llvm.ptr, i64) -> i64
      %328 = func.call @cc_nil_value() : () -> i64
      %329 = func.call @cc_intern(%327, %328) : (i64, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_cons(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_values_pack(%331) : (i64) -> i64
      func.call @stack_push_pointer(%329) : (i64) -> ()
      %333 = llvm.mlir.addressof @str36 : !llvm.ptr
      %334 = arith.constant 8 : i64
      %335 = func.call @cc_make_string(%333, %334) : (!llvm.ptr, i64) -> i64
      %336 = func.call @cc_nil_value() : () -> i64
      %337 = func.call @cc_intern(%335, %336) : (i64, i64) -> i64
      %338 = func.call @cc_nil_value() : () -> i64
      %339 = func.call @cc_cons(%337, %338) : (i64, i64) -> i64
      %340 = func.call @cc_values_pack(%339) : (i64) -> i64
      func.call @stack_push_pointer(%337) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %341 = func.call @stack_pop_pointer() : () -> i64
      %342 = func.call @stack_pop_pointer() : () -> i64
      %343 = func.call @cc_cons(%342, %341) : (i64, i64) -> i64
      func.call @stack_push_pointer(%343) : (i64) -> ()
      %344 = func.call @stack_pop_pointer() : () -> i64
      %345 = func.call @stack_pop_pointer() : () -> i64
      %346 = func.call @cc_cons(%345, %344) : (i64, i64) -> i64
      func.call @stack_push_pointer(%346) : (i64) -> ()
      %347 = func.call @stack_pop_pointer() : () -> i64
      %348 = func.call @stack_pop_pointer() : () -> i64
      %349 = func.call @cc_cons(%348, %347) : (i64, i64) -> i64
      func.call @stack_push_pointer(%349) : (i64) -> ()
      %350 = func.call @stack_pop_pointer() : () -> i64
      %351 = func.call @stack_pop_pointer() : () -> i64
      %352 = func.call @cc_cons(%351, %350) : (i64, i64) -> i64
      func.call @stack_push_pointer(%352) : (i64) -> ()
      %353 = func.call @stack_pop_pointer() : () -> i64
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @cc_cons(%354, %353) : (i64, i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %356 = func.call @stack_pop_pointer() : () -> i64
      %357 = func.call @stack_pop_pointer() : () -> i64
      %358 = func.call @cc_cons(%357, %356) : (i64, i64) -> i64
      func.call @stack_push_pointer(%358) : (i64) -> ()
      %359 = func.call @stack_pop_pointer() : () -> i64
      %360 = func.call @stack_pop_pointer() : () -> i64
      %361 = func.call @cc_cons(%360, %359) : (i64, i64) -> i64
      func.call @stack_push_pointer(%361) : (i64) -> ()
      %362 = func.call @stack_pop_pointer() : () -> i64
      %363 = func.call @stack_pop_pointer() : () -> i64
      %364 = func.call @cc_cons(%363, %362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%364) : (i64) -> ()
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = func.call @cc_cons(%366, %365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%367) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %368 = func.call @stack_pop_pointer() : () -> i64
      %369 = func.call @stack_pop_pointer() : () -> i64
      %370 = func.call @cc_cons(%369, %368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%370) : (i64) -> ()
      %371 = func.call @stack_pop_pointer() : () -> i64
      %372 = func.call @stack_pop_pointer() : () -> i64
      %373 = func.call @cc_cons(%372, %371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = func.call @stack_pop_pointer() : () -> i64
      %376 = func.call @cc_cons(%375, %374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%376) : (i64) -> ()
      %377 = func.call @stack_pop_pointer() : () -> i64
      %458 = llvm.mlir.addressof @str38 : !llvm.ptr
      %459 = arith.constant 31 : i64
      %460 = func.call @cc_make_symbol(%458, %459) : (!llvm.ptr, i64) -> i64
      %461 = func.call @cc_persistent_root_value(%460) : (i64) -> i64
      func.call @stack_push_pointer(%461) : (i64) -> ()
      %462 = llvm.mlir.addressof @str39 : !llvm.ptr
      %463 = arith.constant 37 : i64
      %464 = func.call @cc_make_symbol(%462, %463) : (!llvm.ptr, i64) -> i64
      %465 = func.call @cc_persistent_root_value(%464) : (i64) -> i64
      func.call @stack_push_pointer(%465) : (i64) -> ()
      %466 = llvm.mlir.addressof @str40 : !llvm.ptr
      %467 = arith.constant 38 : i64
      %468 = func.call @cc_make_symbol(%466, %467) : (!llvm.ptr, i64) -> i64
      %469 = func.call @cc_persistent_root_value(%468) : (i64) -> i64
      func.call @stack_push_pointer(%469) : (i64) -> ()
      %470 = arith.constant 275462358040577 : i64
      %471 = arith.constant 3 : i64
      %472 = func.call @cc_make_closure(%470, %471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%472) : (i64) -> ()
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%474) : (i64) -> ()
      %475 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%475) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @cc_cons(%477, %476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @stack_pop_pointer() : () -> i64
      %481 = func.call @cc_cons(%480, %479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%481) : (i64) -> ()
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @stack_pop_pointer() : () -> i64
      %484 = func.call @cc_cons(%483, %482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%484) : (i64) -> ()
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @stack_pop_pointer() : () -> i64
      %487 = func.call @cc_cons(%486, %485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%487) : (i64) -> ()
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = llvm.mlir.addressof @str41 : !llvm.ptr
      %490 = arith.constant 11 : i64
      %491 = func.call @cc_make_string(%489, %490) : (!llvm.ptr, i64) -> i64
      %492 = llvm.mlir.addressof @str42 : !llvm.ptr
      %493 = arith.constant 7 : i64
      %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
      %495 = func.call @cc_intern(%491, %494) : (i64, i64) -> i64
      %496 = func.call @cc_nil_value() : () -> i64
      %497 = func.call @cc_cons(%495, %496) : (i64, i64) -> i64
      %498 = func.call @cc_values_pack(%497) : (i64) -> i64
      func.call @stack_push_pointer(%495) : (i64) -> ()
      %499 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %500 = func.call @stack_pop_pointer() : () -> i64
      %501 = llvm.mlir.addressof @str43 : !llvm.ptr
      %502 = arith.constant 4 : i64
      %503 = func.call @cc_make_string(%501, %502) : (!llvm.ptr, i64) -> i64
      %504 = llvm.mlir.addressof @str44 : !llvm.ptr
      %505 = arith.constant 7 : i64
      %506 = func.call @cc_make_string(%504, %505) : (!llvm.ptr, i64) -> i64
      %507 = func.call @cc_intern(%503, %506) : (i64, i64) -> i64
      %508 = func.call @cc_nil_value() : () -> i64
      %509 = func.call @cc_cons(%507, %508) : (i64, i64) -> i64
      %510 = func.call @cc_values_pack(%509) : (i64) -> i64
      func.call @stack_push_pointer(%507) : (i64) -> ()
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = llvm.mlir.addressof @str45 : !llvm.ptr
      %513 = arith.constant 6 : i64
      %514 = func.call @cc_make_string(%512, %513) : (!llvm.ptr, i64) -> i64
      %515 = func.call @cc_nil_value() : () -> i64
      %516 = func.call @cc_intern(%514, %515) : (i64, i64) -> i64
      %517 = func.call @cc_nil_value() : () -> i64
      %518 = func.call @cc_cons(%516, %517) : (i64, i64) -> i64
      %519 = func.call @cc_values_pack(%518) : (i64) -> i64
      func.call @stack_push_pointer(%516) : (i64) -> ()
      %520 = func.call @stack_pop_pointer() : () -> i64
      %521 = func.call @cc_nil_value() : () -> i64
      %522 = func.call @cc_errorp(%65) : (i64) -> i64
      %523 = arith.cmpi ne, %522, %521 : i64
      %524 = arith.cmpi eq, %521, %521 : i64
      %525 = arith.andi %523, %524 : i1
      %526 = scf.if %525 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %521 : i64
      }
      %527 = func.call @cc_errorp(%377) : (i64) -> i64
      %528 = arith.cmpi ne, %527, %521 : i64
      %529 = arith.cmpi eq, %526, %521 : i64
      %530 = arith.andi %528, %529 : i1
      %531 = scf.if %530 -> (i64) {
        scf.yield %377 : i64
      } else {
        scf.yield %526 : i64
      }
      %532 = func.call @cc_errorp(%473) : (i64) -> i64
      %533 = arith.cmpi ne, %532, %521 : i64
      %534 = arith.cmpi eq, %531, %521 : i64
      %535 = arith.andi %533, %534 : i1
      %536 = scf.if %535 -> (i64) {
        scf.yield %473 : i64
      } else {
        scf.yield %531 : i64
      }
      %537 = func.call @cc_errorp(%488) : (i64) -> i64
      %538 = arith.cmpi ne, %537, %521 : i64
      %539 = arith.cmpi eq, %536, %521 : i64
      %540 = arith.andi %538, %539 : i1
      %541 = scf.if %540 -> (i64) {
        scf.yield %488 : i64
      } else {
        scf.yield %536 : i64
      }
      %542 = func.call @cc_errorp(%499) : (i64) -> i64
      %543 = arith.cmpi ne, %542, %521 : i64
      %544 = arith.cmpi eq, %541, %521 : i64
      %545 = arith.andi %543, %544 : i1
      %546 = scf.if %545 -> (i64) {
        scf.yield %499 : i64
      } else {
        scf.yield %541 : i64
      }
      %547 = func.call @cc_errorp(%500) : (i64) -> i64
      %548 = arith.cmpi ne, %547, %521 : i64
      %549 = arith.cmpi eq, %546, %521 : i64
      %550 = arith.andi %548, %549 : i1
      %551 = scf.if %550 -> (i64) {
        scf.yield %500 : i64
      } else {
        scf.yield %546 : i64
      }
      %552 = func.call @cc_errorp(%511) : (i64) -> i64
      %553 = arith.cmpi ne, %552, %521 : i64
      %554 = arith.cmpi eq, %551, %521 : i64
      %555 = arith.andi %553, %554 : i1
      %556 = scf.if %555 -> (i64) {
        scf.yield %511 : i64
      } else {
        scf.yield %551 : i64
      }
      %557 = func.call @cc_errorp(%520) : (i64) -> i64
      %558 = arith.cmpi ne, %557, %521 : i64
      %559 = arith.cmpi eq, %556, %521 : i64
      %560 = arith.andi %558, %559 : i1
      %561 = scf.if %560 -> (i64) {
        scf.yield %520 : i64
      } else {
        scf.yield %556 : i64
      }
      %562 = arith.cmpi ne, %561, %521 : i64
      scf.if %562 {
        func.call @stack_push_pointer(%561) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%377) : (i64) -> ()
        func.call @stack_push_pointer(%473) : (i64) -> ()
        func.call @stack_push_pointer(%488) : (i64) -> ()
        func.call @stack_push_pointer(%499) : (i64) -> ()
        func.call @stack_push_pointer(%500) : (i64) -> ()
        func.call @stack_push_pointer(%511) : (i64) -> ()
        func.call @stack_push_pointer(%520) : (i64) -> ()
        %563 = llvm.mlir.addressof @str46 : !llvm.ptr
        %564 = func.call @cc_make_function_ref_const(%563) : (!llvm.ptr) -> i64
        %565 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%564, %565) : (i64, i64) -> ()
      }
      %566 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %566 : i64
    }
    %567 = func.call @cc_nil_value() : () -> i64
    %568 = func.call @cc_errorp(%56) : (i64) -> i64
    %569 = arith.cmpi ne, %568, %567 : i64
    %570 = scf.if %569 -> (i64) {
      scf.yield %56 : i64
    } else {
      %571 = llvm.mlir.addressof @str47 : !llvm.ptr
      %572 = arith.constant 13 : i64
      %573 = func.call @cc_make_string(%571, %572) : (!llvm.ptr, i64) -> i64
      %574 = func.call @cc_nil_value() : () -> i64
      %575 = func.call @cc_intern(%573, %574) : (i64, i64) -> i64
      %576 = func.call @cc_nil_value() : () -> i64
      %577 = func.call @cc_cons(%575, %576) : (i64, i64) -> i64
      %578 = func.call @cc_values_pack(%577) : (i64) -> i64
      func.call @stack_push_pointer(%575) : (i64) -> ()
      %579 = func.call @stack_pop_pointer() : () -> i64
      %580 = llvm.mlir.addressof @str48 : !llvm.ptr
      %581 = arith.constant 19 : i64
      %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
      %583 = llvm.mlir.addressof @str49 : !llvm.ptr
      %584 = arith.constant 11 : i64
      %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
      %586 = func.call @cc_intern(%582, %585) : (i64, i64) -> i64
      %587 = func.call @cc_nil_value() : () -> i64
      %588 = func.call @cc_cons(%586, %587) : (i64, i64) -> i64
      %589 = func.call @cc_values_pack(%588) : (i64) -> i64
      func.call @stack_push_pointer(%586) : (i64) -> ()
      %590 = llvm.mlir.addressof @str50 : !llvm.ptr
      %591 = arith.constant 4 : i64
      %592 = func.call @cc_make_string(%590, %591) : (!llvm.ptr, i64) -> i64
      %593 = llvm.mlir.addressof @str51 : !llvm.ptr
      %594 = arith.constant 11 : i64
      %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
      %596 = func.call @cc_intern(%592, %595) : (i64, i64) -> i64
      %597 = func.call @cc_nil_value() : () -> i64
      %598 = func.call @cc_cons(%596, %597) : (i64, i64) -> i64
      %599 = func.call @cc_values_pack(%598) : (i64) -> i64
      func.call @stack_push_pointer(%596) : (i64) -> ()
      %600 = llvm.mlir.addressof @str52 : !llvm.ptr
      %601 = arith.constant 5 : i64
      %602 = func.call @cc_make_string(%600, %601) : (!llvm.ptr, i64) -> i64
      %603 = llvm.mlir.addressof @str53 : !llvm.ptr
      %604 = arith.constant 11 : i64
      %605 = func.call @cc_make_string(%603, %604) : (!llvm.ptr, i64) -> i64
      %606 = func.call @cc_intern(%602, %605) : (i64, i64) -> i64
      %607 = func.call @cc_nil_value() : () -> i64
      %608 = func.call @cc_cons(%606, %607) : (i64, i64) -> i64
      %609 = func.call @cc_values_pack(%608) : (i64) -> i64
      func.call @stack_push_pointer(%606) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = func.call @cc_cons(%611, %610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @stack_pop_pointer() : () -> i64
      %615 = func.call @cc_cons(%614, %613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %616 = llvm.mlir.addressof @str54 : !llvm.ptr
      %617 = arith.constant 7 : i64
      %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
      %619 = llvm.mlir.addressof @str55 : !llvm.ptr
      %620 = arith.constant 11 : i64
      %621 = func.call @cc_make_string(%619, %620) : (!llvm.ptr, i64) -> i64
      %622 = func.call @cc_intern(%618, %621) : (i64, i64) -> i64
      %623 = func.call @cc_nil_value() : () -> i64
      %624 = func.call @cc_cons(%622, %623) : (i64, i64) -> i64
      %625 = func.call @cc_values_pack(%624) : (i64) -> i64
      func.call @stack_push_pointer(%622) : (i64) -> ()
      %626 = llvm.mlir.addressof @str56 : !llvm.ptr
      %627 = arith.constant 11 : i64
      %628 = func.call @cc_make_string(%626, %627) : (!llvm.ptr, i64) -> i64
      %629 = llvm.mlir.addressof @str57 : !llvm.ptr
      %630 = arith.constant 3 : i64
      %631 = func.call @cc_make_string(%629, %630) : (!llvm.ptr, i64) -> i64
      %632 = func.call @cc_intern(%628, %631) : (i64, i64) -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
      %635 = func.call @cc_values_pack(%634) : (i64) -> i64
      func.call @stack_push_pointer(%632) : (i64) -> ()
      %636 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%636) : (i64) -> ()
      %637 = llvm.mlir.addressof @str58 : !llvm.ptr
      %638 = arith.constant 6 : i64
      %639 = func.call @cc_make_string(%637, %638) : (!llvm.ptr, i64) -> i64
      %640 = llvm.mlir.addressof @str59 : !llvm.ptr
      %641 = arith.constant 11 : i64
      %642 = func.call @cc_make_string(%640, %641) : (!llvm.ptr, i64) -> i64
      %643 = func.call @cc_intern(%639, %642) : (i64, i64) -> i64
      %644 = func.call @cc_nil_value() : () -> i64
      %645 = func.call @cc_cons(%643, %644) : (i64, i64) -> i64
      %646 = func.call @cc_values_pack(%645) : (i64) -> i64
      func.call @stack_push_pointer(%643) : (i64) -> ()
      %647 = llvm.mlir.addressof @str60 : !llvm.ptr
      %648 = arith.constant 1 : i64
      %649 = func.call @cc_make_string(%647, %648) : (!llvm.ptr, i64) -> i64
      %650 = func.call @cc_nil_value() : () -> i64
      %651 = func.call @cc_intern(%649, %650) : (i64, i64) -> i64
      %652 = func.call @cc_nil_value() : () -> i64
      %653 = func.call @cc_cons(%651, %652) : (i64, i64) -> i64
      %654 = func.call @cc_values_pack(%653) : (i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %655 = func.call @stack_pop_pointer() : () -> i64
      %656 = func.call @stack_pop_pointer() : () -> i64
      %657 = func.call @cc_cons(%656, %655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%657) : (i64) -> ()
      %658 = llvm.mlir.addressof @str61 : !llvm.ptr
      %659 = arith.constant 6 : i64
      %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
      %661 = llvm.mlir.addressof @str62 : !llvm.ptr
      %662 = arith.constant 11 : i64
      %663 = func.call @cc_make_string(%661, %662) : (!llvm.ptr, i64) -> i64
      %664 = func.call @cc_intern(%660, %663) : (i64, i64) -> i64
      %665 = func.call @cc_nil_value() : () -> i64
      %666 = func.call @cc_cons(%664, %665) : (i64, i64) -> i64
      %667 = func.call @cc_values_pack(%666) : (i64) -> i64
      func.call @stack_push_pointer(%664) : (i64) -> ()
      %668 = llvm.mlir.addressof @str63 : !llvm.ptr
      %669 = arith.constant 6 : i64
      %670 = func.call @cc_make_string(%668, %669) : (!llvm.ptr, i64) -> i64
      %671 = llvm.mlir.addressof @str64 : !llvm.ptr
      %672 = arith.constant 11 : i64
      %673 = func.call @cc_make_string(%671, %672) : (!llvm.ptr, i64) -> i64
      %674 = func.call @cc_intern(%670, %673) : (i64, i64) -> i64
      %675 = func.call @cc_nil_value() : () -> i64
      %676 = func.call @cc_cons(%674, %675) : (i64, i64) -> i64
      %677 = func.call @cc_values_pack(%676) : (i64) -> i64
      func.call @stack_push_pointer(%674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %678 = llvm.mlir.addressof @str65 : !llvm.ptr
      %679 = arith.constant 1 : i64
      %680 = func.call @cc_make_string(%678, %679) : (!llvm.ptr, i64) -> i64
      %681 = func.call @cc_nil_value() : () -> i64
      %682 = func.call @cc_intern(%680, %681) : (i64, i64) -> i64
      %683 = func.call @cc_nil_value() : () -> i64
      %684 = func.call @cc_cons(%682, %683) : (i64, i64) -> i64
      %685 = func.call @cc_values_pack(%684) : (i64) -> i64
      func.call @stack_push_pointer(%682) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %686 = func.call @stack_pop_pointer() : () -> i64
      %687 = func.call @stack_pop_pointer() : () -> i64
      %688 = func.call @cc_cons(%687, %686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%688) : (i64) -> ()
      %689 = func.call @stack_pop_pointer() : () -> i64
      %690 = func.call @stack_pop_pointer() : () -> i64
      %691 = func.call @cc_cons(%690, %689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%691) : (i64) -> ()
      %692 = func.call @stack_pop_pointer() : () -> i64
      %693 = func.call @stack_pop_pointer() : () -> i64
      %694 = func.call @cc_cons(%693, %692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%694) : (i64) -> ()
      %695 = llvm.mlir.addressof @str66 : !llvm.ptr
      %696 = arith.constant 6 : i64
      %697 = func.call @cc_make_string(%695, %696) : (!llvm.ptr, i64) -> i64
      %698 = llvm.mlir.addressof @str67 : !llvm.ptr
      %699 = arith.constant 11 : i64
      %700 = func.call @cc_make_string(%698, %699) : (!llvm.ptr, i64) -> i64
      %701 = func.call @cc_intern(%697, %700) : (i64, i64) -> i64
      %702 = func.call @cc_nil_value() : () -> i64
      %703 = func.call @cc_cons(%701, %702) : (i64, i64) -> i64
      %704 = func.call @cc_values_pack(%703) : (i64) -> i64
      func.call @stack_push_pointer(%701) : (i64) -> ()
      %705 = llvm.mlir.addressof @str68 : !llvm.ptr
      %706 = arith.constant 1 : i64
      %707 = func.call @cc_make_string(%705, %706) : (!llvm.ptr, i64) -> i64
      %708 = func.call @cc_nil_value() : () -> i64
      %709 = func.call @cc_intern(%707, %708) : (i64, i64) -> i64
      %710 = func.call @cc_nil_value() : () -> i64
      %711 = func.call @cc_cons(%709, %710) : (i64, i64) -> i64
      %712 = func.call @cc_values_pack(%711) : (i64) -> i64
      func.call @stack_push_pointer(%709) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %713 = func.call @stack_pop_pointer() : () -> i64
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = func.call @cc_cons(%714, %713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%715) : (i64) -> ()
      %716 = llvm.mlir.addressof @str69 : !llvm.ptr
      %717 = arith.constant 4 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = llvm.mlir.addressof @str70 : !llvm.ptr
      %720 = arith.constant 11 : i64
      %721 = func.call @cc_make_string(%719, %720) : (!llvm.ptr, i64) -> i64
      %722 = func.call @cc_intern(%718, %721) : (i64, i64) -> i64
      %723 = func.call @cc_nil_value() : () -> i64
      %724 = func.call @cc_cons(%722, %723) : (i64, i64) -> i64
      %725 = func.call @cc_values_pack(%724) : (i64) -> i64
      func.call @stack_push_pointer(%722) : (i64) -> ()
      %726 = llvm.mlir.addressof @str71 : !llvm.ptr
      %727 = arith.constant 1 : i64
      %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
      %729 = func.call @cc_nil_value() : () -> i64
      %730 = func.call @cc_intern(%728, %729) : (i64, i64) -> i64
      %731 = func.call @cc_nil_value() : () -> i64
      %732 = func.call @cc_cons(%730, %731) : (i64, i64) -> i64
      %733 = func.call @cc_values_pack(%732) : (i64) -> i64
      func.call @stack_push_pointer(%730) : (i64) -> ()
      %734 = llvm.mlir.addressof @str72 : !llvm.ptr
      %735 = arith.constant 1 : i64
      %736 = func.call @cc_make_string(%734, %735) : (!llvm.ptr, i64) -> i64
      %737 = func.call @cc_nil_value() : () -> i64
      %738 = func.call @cc_intern(%736, %737) : (i64, i64) -> i64
      %739 = func.call @cc_nil_value() : () -> i64
      %740 = func.call @cc_cons(%738, %739) : (i64, i64) -> i64
      %741 = func.call @cc_values_pack(%740) : (i64) -> i64
      func.call @stack_push_pointer(%738) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %742 = func.call @stack_pop_pointer() : () -> i64
      %743 = func.call @stack_pop_pointer() : () -> i64
      %744 = func.call @cc_cons(%743, %742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%744) : (i64) -> ()
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = func.call @stack_pop_pointer() : () -> i64
      %747 = func.call @cc_cons(%746, %745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%747) : (i64) -> ()
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @cc_cons(%749, %748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%750) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @cc_cons(%752, %751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%753) : (i64) -> ()
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @cc_cons(%755, %754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%756) : (i64) -> ()
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @stack_pop_pointer() : () -> i64
      %759 = func.call @cc_cons(%758, %757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%759) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %760 = func.call @stack_pop_pointer() : () -> i64
      %761 = func.call @stack_pop_pointer() : () -> i64
      %762 = func.call @cc_cons(%761, %760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%762) : (i64) -> ()
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = func.call @stack_pop_pointer() : () -> i64
      %765 = func.call @cc_cons(%764, %763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%765) : (i64) -> ()
      %766 = func.call @stack_pop_pointer() : () -> i64
      %767 = func.call @stack_pop_pointer() : () -> i64
      %768 = func.call @cc_cons(%767, %766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%768) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @cc_cons(%770, %769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%771) : (i64) -> ()
      %772 = func.call @stack_pop_pointer() : () -> i64
      %773 = func.call @stack_pop_pointer() : () -> i64
      %774 = func.call @cc_cons(%773, %772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%774) : (i64) -> ()
      %775 = func.call @stack_pop_pointer() : () -> i64
      %776 = func.call @stack_pop_pointer() : () -> i64
      %777 = func.call @cc_cons(%776, %775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      %778 = func.call @stack_pop_pointer() : () -> i64
      %779 = func.call @stack_pop_pointer() : () -> i64
      %780 = func.call @cc_cons(%778, %779) : (i64, i64) -> i64
      %781 = llvm.mlir.addressof @str73 : !llvm.ptr
      %782 = arith.constant 5 : i64
      %783 = func.call @cc_make_string(%781, %782) : (!llvm.ptr, i64) -> i64
      %784 = func.call @cc_nil_value() : () -> i64
      %785 = func.call @cc_intern(%783, %784) : (i64, i64) -> i64
      %786 = func.call @cc_nil_value() : () -> i64
      %787 = func.call @cc_cons(%785, %786) : (i64, i64) -> i64
      %788 = func.call @cc_values_pack(%787) : (i64) -> i64
      %789 = func.call @cc_cons(%785, %780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%789) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %790 = func.call @stack_pop_pointer() : () -> i64
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_cons(%791, %790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%792) : (i64) -> ()
      %793 = func.call @stack_pop_pointer() : () -> i64
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @cc_cons(%794, %793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%795) : (i64) -> ()
      %796 = arith.constant 237 : i64
      func.call @stack_push_fixnum(%796) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %797 = func.call @stack_pop_pointer() : () -> i64
      %798 = func.call @stack_pop_pointer() : () -> i64
      %799 = func.call @cc_cons(%798, %797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%799) : (i64) -> ()
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = func.call @stack_pop_pointer() : () -> i64
      %802 = func.call @cc_cons(%801, %800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%802) : (i64) -> ()
      %803 = func.call @stack_pop_pointer() : () -> i64
      %804 = func.call @stack_pop_pointer() : () -> i64
      %805 = func.call @cc_cons(%804, %803) : (i64, i64) -> i64
      func.call @stack_push_pointer(%805) : (i64) -> ()
      %806 = llvm.mlir.addressof @str74 : !llvm.ptr
      %807 = arith.constant 19 : i64
      %808 = func.call @cc_make_string(%806, %807) : (!llvm.ptr, i64) -> i64
      %809 = llvm.mlir.addressof @str75 : !llvm.ptr
      %810 = arith.constant 11 : i64
      %811 = func.call @cc_make_string(%809, %810) : (!llvm.ptr, i64) -> i64
      %812 = func.call @cc_intern(%808, %811) : (i64, i64) -> i64
      %813 = func.call @cc_nil_value() : () -> i64
      %814 = func.call @cc_cons(%812, %813) : (i64, i64) -> i64
      %815 = func.call @cc_values_pack(%814) : (i64) -> i64
      func.call @stack_push_pointer(%812) : (i64) -> ()
      %816 = llvm.mlir.addressof @str76 : !llvm.ptr
      %817 = arith.constant 5 : i64
      %818 = func.call @cc_make_string(%816, %817) : (!llvm.ptr, i64) -> i64
      %819 = func.call @cc_nil_value() : () -> i64
      %820 = func.call @cc_intern(%818, %819) : (i64, i64) -> i64
      %821 = func.call @cc_nil_value() : () -> i64
      %822 = func.call @cc_cons(%820, %821) : (i64, i64) -> i64
      %823 = func.call @cc_values_pack(%822) : (i64) -> i64
      func.call @stack_push_pointer(%820) : (i64) -> ()
      %824 = llvm.mlir.addressof @str77 : !llvm.ptr
      %825 = arith.constant 9 : i64
      %826 = func.call @cc_make_string(%824, %825) : (!llvm.ptr, i64) -> i64
      %827 = func.call @cc_nil_value() : () -> i64
      %828 = func.call @cc_intern(%826, %827) : (i64, i64) -> i64
      %829 = func.call @cc_nil_value() : () -> i64
      %830 = func.call @cc_cons(%828, %829) : (i64, i64) -> i64
      %831 = func.call @cc_values_pack(%830) : (i64) -> i64
      func.call @stack_push_pointer(%828) : (i64) -> ()
      %832 = llvm.mlir.addressof @str78 : !llvm.ptr
      %833 = arith.constant 8 : i64
      %834 = func.call @cc_make_string(%832, %833) : (!llvm.ptr, i64) -> i64
      %835 = func.call @cc_nil_value() : () -> i64
      %836 = func.call @cc_intern(%834, %835) : (i64, i64) -> i64
      %837 = func.call @cc_nil_value() : () -> i64
      %838 = func.call @cc_cons(%836, %837) : (i64, i64) -> i64
      %839 = func.call @cc_values_pack(%838) : (i64) -> i64
      func.call @stack_push_pointer(%836) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %840 = func.call @stack_pop_pointer() : () -> i64
      %841 = func.call @stack_pop_pointer() : () -> i64
      %842 = func.call @cc_cons(%841, %840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%842) : (i64) -> ()
      %843 = func.call @stack_pop_pointer() : () -> i64
      %844 = func.call @stack_pop_pointer() : () -> i64
      %845 = func.call @cc_cons(%844, %843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%845) : (i64) -> ()
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = func.call @stack_pop_pointer() : () -> i64
      %848 = func.call @cc_cons(%847, %846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%848) : (i64) -> ()
      %849 = llvm.mlir.addressof @str79 : !llvm.ptr
      %850 = arith.constant 7 : i64
      %851 = func.call @cc_make_string(%849, %850) : (!llvm.ptr, i64) -> i64
      %852 = llvm.mlir.addressof @str80 : !llvm.ptr
      %853 = arith.constant 11 : i64
      %854 = func.call @cc_make_string(%852, %853) : (!llvm.ptr, i64) -> i64
      %855 = func.call @cc_intern(%851, %854) : (i64, i64) -> i64
      %856 = func.call @cc_nil_value() : () -> i64
      %857 = func.call @cc_cons(%855, %856) : (i64, i64) -> i64
      %858 = func.call @cc_values_pack(%857) : (i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %859 = llvm.mlir.addressof @str81 : !llvm.ptr
      %860 = arith.constant 4 : i64
      %861 = func.call @cc_make_string(%859, %860) : (!llvm.ptr, i64) -> i64
      %862 = llvm.mlir.addressof @str82 : !llvm.ptr
      %863 = arith.constant 11 : i64
      %864 = func.call @cc_make_string(%862, %863) : (!llvm.ptr, i64) -> i64
      %865 = func.call @cc_intern(%861, %864) : (i64, i64) -> i64
      %866 = func.call @cc_nil_value() : () -> i64
      %867 = func.call @cc_cons(%865, %866) : (i64, i64) -> i64
      %868 = func.call @cc_values_pack(%867) : (i64) -> i64
      func.call @stack_push_pointer(%865) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %869 = func.call @stack_pop_pointer() : () -> i64
      %870 = func.call @stack_pop_pointer() : () -> i64
      %871 = func.call @cc_cons(%870, %869) : (i64, i64) -> i64
      func.call @stack_push_pointer(%871) : (i64) -> ()
      %872 = func.call @stack_pop_pointer() : () -> i64
      %873 = func.call @stack_pop_pointer() : () -> i64
      %874 = func.call @cc_cons(%873, %872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%874) : (i64) -> ()
      %875 = func.call @stack_pop_pointer() : () -> i64
      %876 = func.call @stack_pop_pointer() : () -> i64
      %877 = func.call @cc_cons(%876, %875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%877) : (i64) -> ()
      %878 = llvm.mlir.addressof @str83 : !llvm.ptr
      %879 = arith.constant 19 : i64
      %880 = func.call @cc_make_string(%878, %879) : (!llvm.ptr, i64) -> i64
      %881 = llvm.mlir.addressof @str84 : !llvm.ptr
      %882 = arith.constant 11 : i64
      %883 = func.call @cc_make_string(%881, %882) : (!llvm.ptr, i64) -> i64
      %884 = func.call @cc_intern(%880, %883) : (i64, i64) -> i64
      %885 = func.call @cc_nil_value() : () -> i64
      %886 = func.call @cc_cons(%884, %885) : (i64, i64) -> i64
      %887 = func.call @cc_values_pack(%886) : (i64) -> i64
      func.call @stack_push_pointer(%884) : (i64) -> ()
      %888 = llvm.mlir.addressof @str85 : !llvm.ptr
      %889 = arith.constant 6 : i64
      %890 = func.call @cc_make_string(%888, %889) : (!llvm.ptr, i64) -> i64
      %891 = func.call @cc_nil_value() : () -> i64
      %892 = func.call @cc_intern(%890, %891) : (i64, i64) -> i64
      %893 = func.call @cc_nil_value() : () -> i64
      %894 = func.call @cc_cons(%892, %893) : (i64, i64) -> i64
      %895 = func.call @cc_values_pack(%894) : (i64) -> i64
      func.call @stack_push_pointer(%892) : (i64) -> ()
      %896 = llvm.mlir.addressof @str86 : !llvm.ptr
      %897 = arith.constant 9 : i64
      %898 = func.call @cc_make_string(%896, %897) : (!llvm.ptr, i64) -> i64
      %899 = func.call @cc_nil_value() : () -> i64
      %900 = func.call @cc_intern(%898, %899) : (i64, i64) -> i64
      %901 = func.call @cc_nil_value() : () -> i64
      %902 = func.call @cc_cons(%900, %901) : (i64, i64) -> i64
      %903 = func.call @cc_values_pack(%902) : (i64) -> i64
      func.call @stack_push_pointer(%900) : (i64) -> ()
      %904 = llvm.mlir.addressof @str87 : !llvm.ptr
      %905 = arith.constant 8 : i64
      %906 = func.call @cc_make_string(%904, %905) : (!llvm.ptr, i64) -> i64
      %907 = func.call @cc_nil_value() : () -> i64
      %908 = func.call @cc_intern(%906, %907) : (i64, i64) -> i64
      %909 = func.call @cc_nil_value() : () -> i64
      %910 = func.call @cc_cons(%908, %909) : (i64, i64) -> i64
      %911 = func.call @cc_values_pack(%910) : (i64) -> i64
      func.call @stack_push_pointer(%908) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %912 = func.call @stack_pop_pointer() : () -> i64
      %913 = func.call @stack_pop_pointer() : () -> i64
      %914 = func.call @cc_cons(%913, %912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
      %915 = func.call @stack_pop_pointer() : () -> i64
      %916 = func.call @stack_pop_pointer() : () -> i64
      %917 = func.call @cc_cons(%916, %915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%917) : (i64) -> ()
      %918 = func.call @stack_pop_pointer() : () -> i64
      %919 = func.call @stack_pop_pointer() : () -> i64
      %920 = func.call @cc_cons(%919, %918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%920) : (i64) -> ()
      %921 = llvm.mlir.addressof @str88 : !llvm.ptr
      %922 = arith.constant 7 : i64
      %923 = func.call @cc_make_string(%921, %922) : (!llvm.ptr, i64) -> i64
      %924 = llvm.mlir.addressof @str89 : !llvm.ptr
      %925 = arith.constant 11 : i64
      %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
      %927 = func.call @cc_intern(%923, %926) : (i64, i64) -> i64
      %928 = func.call @cc_nil_value() : () -> i64
      %929 = func.call @cc_cons(%927, %928) : (i64, i64) -> i64
      %930 = func.call @cc_values_pack(%929) : (i64) -> i64
      func.call @stack_push_pointer(%927) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %931 = llvm.mlir.addressof @str90 : !llvm.ptr
      %932 = arith.constant 5 : i64
      %933 = func.call @cc_make_string(%931, %932) : (!llvm.ptr, i64) -> i64
      %934 = llvm.mlir.addressof @str91 : !llvm.ptr
      %935 = arith.constant 11 : i64
      %936 = func.call @cc_make_string(%934, %935) : (!llvm.ptr, i64) -> i64
      %937 = func.call @cc_intern(%933, %936) : (i64, i64) -> i64
      %938 = func.call @cc_nil_value() : () -> i64
      %939 = func.call @cc_cons(%937, %938) : (i64, i64) -> i64
      %940 = func.call @cc_values_pack(%939) : (i64) -> i64
      func.call @stack_push_pointer(%937) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %941 = func.call @stack_pop_pointer() : () -> i64
      %942 = func.call @stack_pop_pointer() : () -> i64
      %943 = func.call @cc_cons(%942, %941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%943) : (i64) -> ()
      %944 = func.call @stack_pop_pointer() : () -> i64
      %945 = func.call @stack_pop_pointer() : () -> i64
      %946 = func.call @cc_cons(%945, %944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%946) : (i64) -> ()
      %947 = func.call @stack_pop_pointer() : () -> i64
      %948 = func.call @stack_pop_pointer() : () -> i64
      %949 = func.call @cc_cons(%948, %947) : (i64, i64) -> i64
      func.call @stack_push_pointer(%949) : (i64) -> ()
      %950 = llvm.mlir.addressof @str92 : !llvm.ptr
      %951 = arith.constant 6 : i64
      %952 = func.call @cc_make_string(%950, %951) : (!llvm.ptr, i64) -> i64
      %953 = llvm.mlir.addressof @str93 : !llvm.ptr
      %954 = arith.constant 11 : i64
      %955 = func.call @cc_make_string(%953, %954) : (!llvm.ptr, i64) -> i64
      %956 = func.call @cc_intern(%952, %955) : (i64, i64) -> i64
      %957 = func.call @cc_nil_value() : () -> i64
      %958 = func.call @cc_cons(%956, %957) : (i64, i64) -> i64
      %959 = func.call @cc_values_pack(%958) : (i64) -> i64
      func.call @stack_push_pointer(%956) : (i64) -> ()
      %960 = llvm.mlir.addressof @str94 : !llvm.ptr
      %961 = arith.constant 7 : i64
      %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
      %963 = llvm.mlir.addressof @str95 : !llvm.ptr
      %964 = arith.constant 11 : i64
      %965 = func.call @cc_make_string(%963, %964) : (!llvm.ptr, i64) -> i64
      %966 = func.call @cc_intern(%962, %965) : (i64, i64) -> i64
      %967 = func.call @cc_nil_value() : () -> i64
      %968 = func.call @cc_cons(%966, %967) : (i64, i64) -> i64
      %969 = func.call @cc_values_pack(%968) : (i64) -> i64
      func.call @stack_push_pointer(%966) : (i64) -> ()
      %970 = llvm.mlir.addressof @str96 : !llvm.ptr
      %971 = arith.constant 4 : i64
      %972 = func.call @cc_make_string(%970, %971) : (!llvm.ptr, i64) -> i64
      %973 = llvm.mlir.addressof @str97 : !llvm.ptr
      %974 = arith.constant 11 : i64
      %975 = func.call @cc_make_string(%973, %974) : (!llvm.ptr, i64) -> i64
      %976 = func.call @cc_intern(%972, %975) : (i64, i64) -> i64
      %977 = func.call @cc_nil_value() : () -> i64
      %978 = func.call @cc_cons(%976, %977) : (i64, i64) -> i64
      %979 = func.call @cc_values_pack(%978) : (i64) -> i64
      func.call @stack_push_pointer(%976) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %980 = func.call @stack_pop_pointer() : () -> i64
      %981 = func.call @stack_pop_pointer() : () -> i64
      %982 = func.call @cc_cons(%981, %980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%982) : (i64) -> ()
      %983 = func.call @stack_pop_pointer() : () -> i64
      %984 = func.call @stack_pop_pointer() : () -> i64
      %985 = func.call @cc_cons(%984, %983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%985) : (i64) -> ()
      %986 = llvm.mlir.addressof @str98 : !llvm.ptr
      %987 = arith.constant 7 : i64
      %988 = func.call @cc_make_string(%986, %987) : (!llvm.ptr, i64) -> i64
      %989 = llvm.mlir.addressof @str99 : !llvm.ptr
      %990 = arith.constant 11 : i64
      %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
      %992 = func.call @cc_intern(%988, %991) : (i64, i64) -> i64
      %993 = func.call @cc_nil_value() : () -> i64
      %994 = func.call @cc_cons(%992, %993) : (i64, i64) -> i64
      %995 = func.call @cc_values_pack(%994) : (i64) -> i64
      func.call @stack_push_pointer(%992) : (i64) -> ()
      %996 = llvm.mlir.addressof @str100 : !llvm.ptr
      %997 = arith.constant 5 : i64
      %998 = func.call @cc_make_string(%996, %997) : (!llvm.ptr, i64) -> i64
      %999 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1000 = arith.constant 11 : i64
      %1001 = func.call @cc_make_string(%999, %1000) : (!llvm.ptr, i64) -> i64
      %1002 = func.call @cc_intern(%998, %1001) : (i64, i64) -> i64
      %1003 = func.call @cc_nil_value() : () -> i64
      %1004 = func.call @cc_cons(%1002, %1003) : (i64, i64) -> i64
      %1005 = func.call @cc_values_pack(%1004) : (i64) -> i64
      func.call @stack_push_pointer(%1002) : (i64) -> ()
      %1006 = arith.constant 18 : i64
      func.call @stack_push_fixnum(%1006) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1007 = func.call @stack_pop_pointer() : () -> i64
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @cc_cons(%1008, %1007) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1009) : (i64) -> ()
      %1010 = func.call @stack_pop_pointer() : () -> i64
      %1011 = func.call @stack_pop_pointer() : () -> i64
      %1012 = func.call @cc_cons(%1011, %1010) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1012) : (i64) -> ()
      %1013 = func.call @stack_pop_pointer() : () -> i64
      %1014 = func.call @stack_pop_pointer() : () -> i64
      %1015 = func.call @cc_cons(%1014, %1013) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1016 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1017 = arith.constant 7 : i64
      %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
      %1019 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1020 = arith.constant 11 : i64
      %1021 = func.call @cc_make_string(%1019, %1020) : (!llvm.ptr, i64) -> i64
      %1022 = func.call @cc_intern(%1018, %1021) : (i64, i64) -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = func.call @cc_cons(%1022, %1023) : (i64, i64) -> i64
      %1025 = func.call @cc_values_pack(%1024) : (i64) -> i64
      func.call @stack_push_pointer(%1022) : (i64) -> ()
      %1026 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1027 = arith.constant 5 : i64
      %1028 = func.call @cc_make_string(%1026, %1027) : (!llvm.ptr, i64) -> i64
      %1029 = func.call @cc_nil_value() : () -> i64
      %1030 = func.call @cc_intern(%1028, %1029) : (i64, i64) -> i64
      %1031 = func.call @cc_nil_value() : () -> i64
      %1032 = func.call @cc_cons(%1030, %1031) : (i64, i64) -> i64
      %1033 = func.call @cc_values_pack(%1032) : (i64) -> i64
      func.call @stack_push_pointer(%1030) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1034 = func.call @stack_pop_pointer() : () -> i64
      %1035 = func.call @stack_pop_pointer() : () -> i64
      %1036 = func.call @cc_cons(%1035, %1034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1036) : (i64) -> ()
      %1037 = func.call @stack_pop_pointer() : () -> i64
      %1038 = func.call @stack_pop_pointer() : () -> i64
      %1039 = func.call @cc_cons(%1038, %1037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1039) : (i64) -> ()
      %1040 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1041 = arith.constant 7 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1044 = arith.constant 11 : i64
      %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
      %1046 = func.call @cc_intern(%1042, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_nil_value() : () -> i64
      %1048 = func.call @cc_cons(%1046, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_values_pack(%1048) : (i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      %1050 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1051 = arith.constant 6 : i64
      %1052 = func.call @cc_make_string(%1050, %1051) : (!llvm.ptr, i64) -> i64
      %1053 = func.call @cc_nil_value() : () -> i64
      %1054 = func.call @cc_intern(%1052, %1053) : (i64, i64) -> i64
      %1055 = func.call @cc_nil_value() : () -> i64
      %1056 = func.call @cc_cons(%1054, %1055) : (i64, i64) -> i64
      %1057 = func.call @cc_values_pack(%1056) : (i64) -> i64
      func.call @stack_push_pointer(%1054) : (i64) -> ()
      %1058 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1058) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1059 = func.call @stack_pop_pointer() : () -> i64
      %1060 = func.call @stack_pop_pointer() : () -> i64
      %1061 = func.call @cc_cons(%1060, %1059) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1061) : (i64) -> ()
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = func.call @cc_cons(%1063, %1062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1064) : (i64) -> ()
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = func.call @stack_pop_pointer() : () -> i64
      %1067 = func.call @cc_cons(%1066, %1065) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1067) : (i64) -> ()
      %1068 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1069 = arith.constant 7 : i64
      %1070 = func.call @cc_make_string(%1068, %1069) : (!llvm.ptr, i64) -> i64
      %1071 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1072 = arith.constant 11 : i64
      %1073 = func.call @cc_make_string(%1071, %1072) : (!llvm.ptr, i64) -> i64
      %1074 = func.call @cc_intern(%1070, %1073) : (i64, i64) -> i64
      %1075 = func.call @cc_nil_value() : () -> i64
      %1076 = func.call @cc_cons(%1074, %1075) : (i64, i64) -> i64
      %1077 = func.call @cc_values_pack(%1076) : (i64) -> i64
      func.call @stack_push_pointer(%1074) : (i64) -> ()
      %1078 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1079 = arith.constant 4 : i64
      %1080 = func.call @cc_make_string(%1078, %1079) : (!llvm.ptr, i64) -> i64
      %1081 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1082 = arith.constant 11 : i64
      %1083 = func.call @cc_make_string(%1081, %1082) : (!llvm.ptr, i64) -> i64
      %1084 = func.call @cc_intern(%1080, %1083) : (i64, i64) -> i64
      %1085 = func.call @cc_nil_value() : () -> i64
      %1086 = func.call @cc_cons(%1084, %1085) : (i64, i64) -> i64
      %1087 = func.call @cc_values_pack(%1086) : (i64) -> i64
      func.call @stack_push_pointer(%1084) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1088 = func.call @stack_pop_pointer() : () -> i64
      %1089 = func.call @stack_pop_pointer() : () -> i64
      %1090 = func.call @cc_cons(%1089, %1088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1090) : (i64) -> ()
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @stack_pop_pointer() : () -> i64
      %1093 = func.call @cc_cons(%1092, %1091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1093) : (i64) -> ()
      %1094 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1095 = arith.constant 9 : i64
      %1096 = func.call @cc_make_string(%1094, %1095) : (!llvm.ptr, i64) -> i64
      %1097 = func.call @cc_nil_value() : () -> i64
      %1098 = func.call @cc_intern(%1096, %1097) : (i64, i64) -> i64
      %1099 = func.call @cc_nil_value() : () -> i64
      %1100 = func.call @cc_cons(%1098, %1099) : (i64, i64) -> i64
      %1101 = func.call @cc_values_pack(%1100) : (i64) -> i64
      func.call @stack_push_pointer(%1098) : (i64) -> ()
      %1102 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1103 = arith.constant 8 : i64
      %1104 = func.call @cc_make_string(%1102, %1103) : (!llvm.ptr, i64) -> i64
      %1105 = func.call @cc_nil_value() : () -> i64
      %1106 = func.call @cc_intern(%1104, %1105) : (i64, i64) -> i64
      %1107 = func.call @cc_nil_value() : () -> i64
      %1108 = func.call @cc_cons(%1106, %1107) : (i64, i64) -> i64
      %1109 = func.call @cc_values_pack(%1108) : (i64) -> i64
      func.call @stack_push_pointer(%1106) : (i64) -> ()
      %1110 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1111 = arith.constant 9 : i64
      %1112 = func.call @cc_make_string(%1110, %1111) : (!llvm.ptr, i64) -> i64
      %1113 = func.call @cc_nil_value() : () -> i64
      %1114 = func.call @cc_intern(%1112, %1113) : (i64, i64) -> i64
      %1115 = func.call @cc_nil_value() : () -> i64
      %1116 = func.call @cc_cons(%1114, %1115) : (i64, i64) -> i64
      %1117 = func.call @cc_values_pack(%1116) : (i64) -> i64
      func.call @stack_push_pointer(%1114) : (i64) -> ()
      %1118 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1119 = arith.constant 8 : i64
      %1120 = func.call @cc_make_string(%1118, %1119) : (!llvm.ptr, i64) -> i64
      %1121 = func.call @cc_nil_value() : () -> i64
      %1122 = func.call @cc_intern(%1120, %1121) : (i64, i64) -> i64
      %1123 = func.call @cc_nil_value() : () -> i64
      %1124 = func.call @cc_cons(%1122, %1123) : (i64, i64) -> i64
      %1125 = func.call @cc_values_pack(%1124) : (i64) -> i64
      func.call @stack_push_pointer(%1122) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1126 = func.call @stack_pop_pointer() : () -> i64
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %1128 = func.call @cc_cons(%1127, %1126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1128) : (i64) -> ()
      %1129 = func.call @stack_pop_pointer() : () -> i64
      %1130 = func.call @stack_pop_pointer() : () -> i64
      %1131 = func.call @cc_cons(%1130, %1129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1131) : (i64) -> ()
      %1132 = func.call @stack_pop_pointer() : () -> i64
      %1133 = func.call @stack_pop_pointer() : () -> i64
      %1134 = func.call @cc_cons(%1133, %1132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1134) : (i64) -> ()
      %1135 = func.call @stack_pop_pointer() : () -> i64
      %1136 = func.call @stack_pop_pointer() : () -> i64
      %1137 = func.call @cc_cons(%1136, %1135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1137) : (i64) -> ()
      %1138 = func.call @stack_pop_pointer() : () -> i64
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @cc_cons(%1139, %1138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1140) : (i64) -> ()
      %1141 = func.call @stack_pop_pointer() : () -> i64
      %1142 = func.call @stack_pop_pointer() : () -> i64
      %1143 = func.call @cc_cons(%1142, %1141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1143) : (i64) -> ()
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = func.call @stack_pop_pointer() : () -> i64
      %1146 = func.call @cc_cons(%1145, %1144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1146) : (i64) -> ()
      %1147 = func.call @stack_pop_pointer() : () -> i64
      %1148 = func.call @stack_pop_pointer() : () -> i64
      %1149 = func.call @cc_cons(%1148, %1147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1149) : (i64) -> ()
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = func.call @stack_pop_pointer() : () -> i64
      %1152 = func.call @cc_cons(%1151, %1150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1152) : (i64) -> ()
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @cc_cons(%1154, %1153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = func.call @stack_pop_pointer() : () -> i64
      %1158 = func.call @cc_cons(%1157, %1156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1158) : (i64) -> ()
      %1159 = func.call @stack_pop_pointer() : () -> i64
      %1160 = func.call @stack_pop_pointer() : () -> i64
      %1161 = func.call @cc_cons(%1160, %1159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1161) : (i64) -> ()
      %1162 = func.call @stack_pop_pointer() : () -> i64
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = func.call @cc_cons(%1163, %1162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1164) : (i64) -> ()
      %1165 = func.call @stack_pop_pointer() : () -> i64
      %1166 = func.call @stack_pop_pointer() : () -> i64
      %1167 = func.call @cc_cons(%1166, %1165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1167) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1168 = func.call @stack_pop_pointer() : () -> i64
      %1169 = func.call @stack_pop_pointer() : () -> i64
      %1170 = func.call @cc_cons(%1169, %1168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1170) : (i64) -> ()
      %1171 = func.call @stack_pop_pointer() : () -> i64
      %1172 = func.call @stack_pop_pointer() : () -> i64
      %1173 = func.call @cc_cons(%1172, %1171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1173) : (i64) -> ()
      %1174 = func.call @stack_pop_pointer() : () -> i64
      %1175 = func.call @stack_pop_pointer() : () -> i64
      %1176 = func.call @cc_cons(%1175, %1174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1176) : (i64) -> ()
      %1177 = func.call @stack_pop_pointer() : () -> i64
      %1178 = func.call @stack_pop_pointer() : () -> i64
      %1179 = func.call @cc_cons(%1178, %1177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1179) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1180 = func.call @stack_pop_pointer() : () -> i64
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = func.call @cc_cons(%1181, %1180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1182) : (i64) -> ()
      %1183 = func.call @stack_pop_pointer() : () -> i64
      %1184 = func.call @stack_pop_pointer() : () -> i64
      %1185 = func.call @cc_cons(%1184, %1183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1185) : (i64) -> ()
      %1186 = func.call @stack_pop_pointer() : () -> i64
      %1187 = func.call @stack_pop_pointer() : () -> i64
      %1188 = func.call @cc_cons(%1187, %1186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1188) : (i64) -> ()
      %1189 = func.call @stack_pop_pointer() : () -> i64
      %1190 = func.call @stack_pop_pointer() : () -> i64
      %1191 = func.call @cc_cons(%1190, %1189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1191) : (i64) -> ()
      %1192 = func.call @stack_pop_pointer() : () -> i64
      %1338 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1339 = arith.constant 34 : i64
      %1340 = func.call @cc_make_symbol(%1338, %1339) : (!llvm.ptr, i64) -> i64
      %1341 = func.call @cc_persistent_root_value(%1340) : (i64) -> i64
      func.call @stack_push_pointer(%1341) : (i64) -> ()
      %1342 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1343 = arith.constant 35 : i64
      %1344 = func.call @cc_make_symbol(%1342, %1343) : (!llvm.ptr, i64) -> i64
      %1345 = func.call @cc_persistent_root_value(%1344) : (i64) -> i64
      func.call @stack_push_pointer(%1345) : (i64) -> ()
      %1346 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1347 = arith.constant 37 : i64
      %1348 = func.call @cc_make_symbol(%1346, %1347) : (!llvm.ptr, i64) -> i64
      %1349 = func.call @cc_persistent_root_value(%1348) : (i64) -> i64
      func.call @stack_push_pointer(%1349) : (i64) -> ()
      %1350 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1351 = arith.constant 38 : i64
      %1352 = func.call @cc_make_symbol(%1350, %1351) : (!llvm.ptr, i64) -> i64
      %1353 = func.call @cc_persistent_root_value(%1352) : (i64) -> i64
      func.call @stack_push_pointer(%1353) : (i64) -> ()
      %1354 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1355 = arith.constant 37 : i64
      %1356 = func.call @cc_make_symbol(%1354, %1355) : (!llvm.ptr, i64) -> i64
      %1357 = func.call @cc_persistent_root_value(%1356) : (i64) -> i64
      func.call @stack_push_pointer(%1357) : (i64) -> ()
      %1358 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1359 = arith.constant 38 : i64
      %1360 = func.call @cc_make_symbol(%1358, %1359) : (!llvm.ptr, i64) -> i64
      %1361 = func.call @cc_persistent_root_value(%1360) : (i64) -> i64
      func.call @stack_push_pointer(%1361) : (i64) -> ()
      %1362 = arith.constant 275462358040584 : i64
      %1363 = arith.constant 6 : i64
      %1364 = func.call @cc_make_closure(%1362, %1363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1364) : (i64) -> ()
      %1365 = func.call @stack_pop_pointer() : () -> i64
      %1366 = arith.constant 237 : i64
      func.call @stack_push_fixnum(%1366) : (i64) -> ()
      %1367 = arith.constant 18 : i64
      func.call @stack_push_fixnum(%1367) : (i64) -> ()
      %1368 = arith.constant 18 : i64
      func.call @stack_push_fixnum(%1368) : (i64) -> ()
      %1369 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1369) : (i64) -> ()
      %1370 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1370) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1371 = func.call @stack_pop_pointer() : () -> i64
      %1372 = func.call @stack_pop_pointer() : () -> i64
      %1373 = func.call @cc_cons(%1372, %1371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1373) : (i64) -> ()
      %1374 = func.call @stack_pop_pointer() : () -> i64
      %1375 = func.call @stack_pop_pointer() : () -> i64
      %1376 = func.call @cc_cons(%1375, %1374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1376) : (i64) -> ()
      %1377 = func.call @stack_pop_pointer() : () -> i64
      %1378 = func.call @stack_pop_pointer() : () -> i64
      %1379 = func.call @cc_cons(%1378, %1377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1379) : (i64) -> ()
      %1380 = func.call @stack_pop_pointer() : () -> i64
      %1381 = func.call @stack_pop_pointer() : () -> i64
      %1382 = func.call @cc_cons(%1381, %1380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1382) : (i64) -> ()
      %1383 = func.call @stack_pop_pointer() : () -> i64
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @cc_cons(%1384, %1383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1385) : (i64) -> ()
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = func.call @cc_cons(%1387, %1386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      %1389 = func.call @stack_pop_pointer() : () -> i64
      %1390 = func.call @stack_pop_pointer() : () -> i64
      %1391 = func.call @cc_cons(%1390, %1389) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1391) : (i64) -> ()
      %1392 = func.call @stack_pop_pointer() : () -> i64
      %1393 = func.call @stack_pop_pointer() : () -> i64
      %1394 = func.call @cc_cons(%1393, %1392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1394) : (i64) -> ()
      %1395 = func.call @stack_pop_pointer() : () -> i64
      %1396 = func.call @stack_pop_pointer() : () -> i64
      %1397 = func.call @cc_cons(%1396, %1395) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1397) : (i64) -> ()
      %1398 = func.call @stack_pop_pointer() : () -> i64
      %1399 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1400 = arith.constant 11 : i64
      %1401 = func.call @cc_make_string(%1399, %1400) : (!llvm.ptr, i64) -> i64
      %1402 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1403 = arith.constant 7 : i64
      %1404 = func.call @cc_make_string(%1402, %1403) : (!llvm.ptr, i64) -> i64
      %1405 = func.call @cc_intern(%1401, %1404) : (i64, i64) -> i64
      %1406 = func.call @cc_nil_value() : () -> i64
      %1407 = func.call @cc_cons(%1405, %1406) : (i64, i64) -> i64
      %1408 = func.call @cc_values_pack(%1407) : (i64) -> i64
      func.call @stack_push_pointer(%1405) : (i64) -> ()
      %1409 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1410 = func.call @stack_pop_pointer() : () -> i64
      %1411 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1412 = arith.constant 4 : i64
      %1413 = func.call @cc_make_string(%1411, %1412) : (!llvm.ptr, i64) -> i64
      %1414 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1415 = arith.constant 7 : i64
      %1416 = func.call @cc_make_string(%1414, %1415) : (!llvm.ptr, i64) -> i64
      %1417 = func.call @cc_intern(%1413, %1416) : (i64, i64) -> i64
      %1418 = func.call @cc_nil_value() : () -> i64
      %1419 = func.call @cc_cons(%1417, %1418) : (i64, i64) -> i64
      %1420 = func.call @cc_values_pack(%1419) : (i64) -> i64
      func.call @stack_push_pointer(%1417) : (i64) -> ()
      %1421 = func.call @stack_pop_pointer() : () -> i64
      %1422 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1423 = arith.constant 6 : i64
      %1424 = func.call @cc_make_string(%1422, %1423) : (!llvm.ptr, i64) -> i64
      %1425 = func.call @cc_nil_value() : () -> i64
      %1426 = func.call @cc_intern(%1424, %1425) : (i64, i64) -> i64
      %1427 = func.call @cc_nil_value() : () -> i64
      %1428 = func.call @cc_cons(%1426, %1427) : (i64, i64) -> i64
      %1429 = func.call @cc_values_pack(%1428) : (i64) -> i64
      func.call @stack_push_pointer(%1426) : (i64) -> ()
      %1430 = func.call @stack_pop_pointer() : () -> i64
      %1431 = func.call @cc_nil_value() : () -> i64
      %1432 = func.call @cc_errorp(%579) : (i64) -> i64
      %1433 = arith.cmpi ne, %1432, %1431 : i64
      %1434 = arith.cmpi eq, %1431, %1431 : i64
      %1435 = arith.andi %1433, %1434 : i1
      %1436 = scf.if %1435 -> (i64) {
        scf.yield %579 : i64
      } else {
        scf.yield %1431 : i64
      }
      %1437 = func.call @cc_errorp(%1192) : (i64) -> i64
      %1438 = arith.cmpi ne, %1437, %1431 : i64
      %1439 = arith.cmpi eq, %1436, %1431 : i64
      %1440 = arith.andi %1438, %1439 : i1
      %1441 = scf.if %1440 -> (i64) {
        scf.yield %1192 : i64
      } else {
        scf.yield %1436 : i64
      }
      %1442 = func.call @cc_errorp(%1365) : (i64) -> i64
      %1443 = arith.cmpi ne, %1442, %1431 : i64
      %1444 = arith.cmpi eq, %1441, %1431 : i64
      %1445 = arith.andi %1443, %1444 : i1
      %1446 = scf.if %1445 -> (i64) {
        scf.yield %1365 : i64
      } else {
        scf.yield %1441 : i64
      }
      %1447 = func.call @cc_errorp(%1398) : (i64) -> i64
      %1448 = arith.cmpi ne, %1447, %1431 : i64
      %1449 = arith.cmpi eq, %1446, %1431 : i64
      %1450 = arith.andi %1448, %1449 : i1
      %1451 = scf.if %1450 -> (i64) {
        scf.yield %1398 : i64
      } else {
        scf.yield %1446 : i64
      }
      %1452 = func.call @cc_errorp(%1409) : (i64) -> i64
      %1453 = arith.cmpi ne, %1452, %1431 : i64
      %1454 = arith.cmpi eq, %1451, %1431 : i64
      %1455 = arith.andi %1453, %1454 : i1
      %1456 = scf.if %1455 -> (i64) {
        scf.yield %1409 : i64
      } else {
        scf.yield %1451 : i64
      }
      %1457 = func.call @cc_errorp(%1410) : (i64) -> i64
      %1458 = arith.cmpi ne, %1457, %1431 : i64
      %1459 = arith.cmpi eq, %1456, %1431 : i64
      %1460 = arith.andi %1458, %1459 : i1
      %1461 = scf.if %1460 -> (i64) {
        scf.yield %1410 : i64
      } else {
        scf.yield %1456 : i64
      }
      %1462 = func.call @cc_errorp(%1421) : (i64) -> i64
      %1463 = arith.cmpi ne, %1462, %1431 : i64
      %1464 = arith.cmpi eq, %1461, %1431 : i64
      %1465 = arith.andi %1463, %1464 : i1
      %1466 = scf.if %1465 -> (i64) {
        scf.yield %1421 : i64
      } else {
        scf.yield %1461 : i64
      }
      %1467 = func.call @cc_errorp(%1430) : (i64) -> i64
      %1468 = arith.cmpi ne, %1467, %1431 : i64
      %1469 = arith.cmpi eq, %1466, %1431 : i64
      %1470 = arith.andi %1468, %1469 : i1
      %1471 = scf.if %1470 -> (i64) {
        scf.yield %1430 : i64
      } else {
        scf.yield %1466 : i64
      }
      %1472 = arith.cmpi ne, %1471, %1431 : i64
      scf.if %1472 {
        func.call @stack_push_pointer(%1471) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%579) : (i64) -> ()
        func.call @stack_push_pointer(%1192) : (i64) -> ()
        func.call @stack_push_pointer(%1365) : (i64) -> ()
        func.call @stack_push_pointer(%1398) : (i64) -> ()
        func.call @stack_push_pointer(%1409) : (i64) -> ()
        func.call @stack_push_pointer(%1410) : (i64) -> ()
        func.call @stack_push_pointer(%1421) : (i64) -> ()
        func.call @stack_push_pointer(%1430) : (i64) -> ()
        %1473 = llvm.mlir.addressof @str128 : !llvm.ptr
        %1474 = func.call @cc_make_function_ref_const(%1473) : (!llvm.ptr) -> i64
        %1475 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1474, %1475) : (i64, i64) -> ()
      }
      %1476 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1476 : i64
    }
    %1477 = func.call @cc_nil_value() : () -> i64
    %1478 = func.call @cc_errorp(%570) : (i64) -> i64
    %1479 = arith.cmpi ne, %1478, %1477 : i64
    %1480 = scf.if %1479 -> (i64) {
      scf.yield %570 : i64
    } else {
      %1481 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1482 = arith.constant 13 : i64
      %1483 = func.call @cc_make_string(%1481, %1482) : (!llvm.ptr, i64) -> i64
      %1484 = func.call @cc_nil_value() : () -> i64
      %1485 = func.call @cc_intern(%1483, %1484) : (i64, i64) -> i64
      %1486 = func.call @cc_nil_value() : () -> i64
      %1487 = func.call @cc_cons(%1485, %1486) : (i64, i64) -> i64
      %1488 = func.call @cc_values_pack(%1487) : (i64) -> i64
      func.call @stack_push_pointer(%1485) : (i64) -> ()
      %1489 = func.call @stack_pop_pointer() : () -> i64
      %1490 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1491 = arith.constant 3 : i64
      %1492 = func.call @cc_make_string(%1490, %1491) : (!llvm.ptr, i64) -> i64
      %1493 = func.call @cc_nil_value() : () -> i64
      %1494 = func.call @cc_intern(%1492, %1493) : (i64, i64) -> i64
      %1495 = func.call @cc_nil_value() : () -> i64
      %1496 = func.call @cc_cons(%1494, %1495) : (i64, i64) -> i64
      %1497 = func.call @cc_values_pack(%1496) : (i64) -> i64
      func.call @stack_push_pointer(%1494) : (i64) -> ()
      %1498 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1499 = arith.constant 1 : i64
      %1500 = func.call @cc_make_string(%1498, %1499) : (!llvm.ptr, i64) -> i64
      %1501 = func.call @cc_nil_value() : () -> i64
      %1502 = func.call @cc_intern(%1500, %1501) : (i64, i64) -> i64
      %1503 = func.call @cc_nil_value() : () -> i64
      %1504 = func.call @cc_cons(%1502, %1503) : (i64, i64) -> i64
      %1505 = func.call @cc_values_pack(%1504) : (i64) -> i64
      func.call @stack_push_pointer(%1502) : (i64) -> ()
      %1506 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1507 = arith.constant 7 : i64
      %1508 = func.call @cc_make_string(%1506, %1507) : (!llvm.ptr, i64) -> i64
      %1509 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1510 = arith.constant 11 : i64
      %1511 = func.call @cc_make_string(%1509, %1510) : (!llvm.ptr, i64) -> i64
      %1512 = func.call @cc_intern(%1508, %1511) : (i64, i64) -> i64
      %1513 = func.call @cc_nil_value() : () -> i64
      %1514 = func.call @cc_cons(%1512, %1513) : (i64, i64) -> i64
      %1515 = func.call @cc_values_pack(%1514) : (i64) -> i64
      func.call @stack_push_pointer(%1512) : (i64) -> ()
      %1516 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1517 = arith.constant 11 : i64
      %1518 = func.call @cc_make_string(%1516, %1517) : (!llvm.ptr, i64) -> i64
      %1519 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1520 = arith.constant 3 : i64
      %1521 = func.call @cc_make_string(%1519, %1520) : (!llvm.ptr, i64) -> i64
      %1522 = func.call @cc_intern(%1518, %1521) : (i64, i64) -> i64
      %1523 = func.call @cc_nil_value() : () -> i64
      %1524 = func.call @cc_cons(%1522, %1523) : (i64, i64) -> i64
      %1525 = func.call @cc_values_pack(%1524) : (i64) -> i64
      func.call @stack_push_pointer(%1522) : (i64) -> ()
      %1526 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1526) : (i64) -> ()
      %1527 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1528 = arith.constant 6 : i64
      %1529 = func.call @cc_make_string(%1527, %1528) : (!llvm.ptr, i64) -> i64
      %1530 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1531 = arith.constant 11 : i64
      %1532 = func.call @cc_make_string(%1530, %1531) : (!llvm.ptr, i64) -> i64
      %1533 = func.call @cc_intern(%1529, %1532) : (i64, i64) -> i64
      %1534 = func.call @cc_nil_value() : () -> i64
      %1535 = func.call @cc_cons(%1533, %1534) : (i64, i64) -> i64
      %1536 = func.call @cc_values_pack(%1535) : (i64) -> i64
      func.call @stack_push_pointer(%1533) : (i64) -> ()
      %1537 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1538 = arith.constant 1 : i64
      %1539 = func.call @cc_make_string(%1537, %1538) : (!llvm.ptr, i64) -> i64
      %1540 = func.call @cc_nil_value() : () -> i64
      %1541 = func.call @cc_intern(%1539, %1540) : (i64, i64) -> i64
      %1542 = func.call @cc_nil_value() : () -> i64
      %1543 = func.call @cc_cons(%1541, %1542) : (i64, i64) -> i64
      %1544 = func.call @cc_values_pack(%1543) : (i64) -> i64
      func.call @stack_push_pointer(%1541) : (i64) -> ()
      %1545 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1546 = arith.constant 1 : i64
      %1547 = func.call @cc_make_string(%1545, %1546) : (!llvm.ptr, i64) -> i64
      %1548 = func.call @cc_nil_value() : () -> i64
      %1549 = func.call @cc_intern(%1547, %1548) : (i64, i64) -> i64
      %1550 = func.call @cc_nil_value() : () -> i64
      %1551 = func.call @cc_cons(%1549, %1550) : (i64, i64) -> i64
      %1552 = func.call @cc_values_pack(%1551) : (i64) -> i64
      func.call @stack_push_pointer(%1549) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1553 = func.call @stack_pop_pointer() : () -> i64
      %1554 = func.call @stack_pop_pointer() : () -> i64
      %1555 = func.call @cc_cons(%1554, %1553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1555) : (i64) -> ()
      %1556 = func.call @stack_pop_pointer() : () -> i64
      %1557 = func.call @stack_pop_pointer() : () -> i64
      %1558 = func.call @cc_cons(%1557, %1556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1558) : (i64) -> ()
      %1559 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1560 = arith.constant 6 : i64
      %1561 = func.call @cc_make_string(%1559, %1560) : (!llvm.ptr, i64) -> i64
      %1562 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1563 = arith.constant 11 : i64
      %1564 = func.call @cc_make_string(%1562, %1563) : (!llvm.ptr, i64) -> i64
      %1565 = func.call @cc_intern(%1561, %1564) : (i64, i64) -> i64
      %1566 = func.call @cc_nil_value() : () -> i64
      %1567 = func.call @cc_cons(%1565, %1566) : (i64, i64) -> i64
      %1568 = func.call @cc_values_pack(%1567) : (i64) -> i64
      func.call @stack_push_pointer(%1565) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1569 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1570 = arith.constant 4 : i64
      %1571 = func.call @cc_make_string(%1569, %1570) : (!llvm.ptr, i64) -> i64
      %1572 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1573 = arith.constant 11 : i64
      %1574 = func.call @cc_make_string(%1572, %1573) : (!llvm.ptr, i64) -> i64
      %1575 = func.call @cc_intern(%1571, %1574) : (i64, i64) -> i64
      %1576 = func.call @cc_nil_value() : () -> i64
      %1577 = func.call @cc_cons(%1575, %1576) : (i64, i64) -> i64
      %1578 = func.call @cc_values_pack(%1577) : (i64) -> i64
      func.call @stack_push_pointer(%1575) : (i64) -> ()
      %1579 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1580 = arith.constant 1 : i64
      %1581 = func.call @cc_make_string(%1579, %1580) : (!llvm.ptr, i64) -> i64
      %1582 = func.call @cc_nil_value() : () -> i64
      %1583 = func.call @cc_intern(%1581, %1582) : (i64, i64) -> i64
      %1584 = func.call @cc_nil_value() : () -> i64
      %1585 = func.call @cc_cons(%1583, %1584) : (i64, i64) -> i64
      %1586 = func.call @cc_values_pack(%1585) : (i64) -> i64
      func.call @stack_push_pointer(%1583) : (i64) -> ()
      %1587 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1588 = arith.constant 1 : i64
      %1589 = func.call @cc_make_string(%1587, %1588) : (!llvm.ptr, i64) -> i64
      %1590 = func.call @cc_nil_value() : () -> i64
      %1591 = func.call @cc_intern(%1589, %1590) : (i64, i64) -> i64
      %1592 = func.call @cc_nil_value() : () -> i64
      %1593 = func.call @cc_cons(%1591, %1592) : (i64, i64) -> i64
      %1594 = func.call @cc_values_pack(%1593) : (i64) -> i64
      func.call @stack_push_pointer(%1591) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1595 = func.call @stack_pop_pointer() : () -> i64
      %1596 = func.call @stack_pop_pointer() : () -> i64
      %1597 = func.call @cc_cons(%1596, %1595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1597) : (i64) -> ()
      %1598 = func.call @stack_pop_pointer() : () -> i64
      %1599 = func.call @stack_pop_pointer() : () -> i64
      %1600 = func.call @cc_cons(%1599, %1598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1600) : (i64) -> ()
      %1601 = func.call @stack_pop_pointer() : () -> i64
      %1602 = func.call @stack_pop_pointer() : () -> i64
      %1603 = func.call @cc_cons(%1602, %1601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1603) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1604 = func.call @stack_pop_pointer() : () -> i64
      %1605 = func.call @stack_pop_pointer() : () -> i64
      %1606 = func.call @cc_cons(%1605, %1604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1606) : (i64) -> ()
      %1607 = func.call @stack_pop_pointer() : () -> i64
      %1608 = func.call @stack_pop_pointer() : () -> i64
      %1609 = func.call @cc_cons(%1608, %1607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1609) : (i64) -> ()
      %1610 = func.call @stack_pop_pointer() : () -> i64
      %1611 = func.call @stack_pop_pointer() : () -> i64
      %1612 = func.call @cc_cons(%1611, %1610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1612) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1613 = func.call @stack_pop_pointer() : () -> i64
      %1614 = func.call @stack_pop_pointer() : () -> i64
      %1615 = func.call @cc_cons(%1614, %1613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1615) : (i64) -> ()
      %1616 = func.call @stack_pop_pointer() : () -> i64
      %1617 = func.call @stack_pop_pointer() : () -> i64
      %1618 = func.call @cc_cons(%1617, %1616) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1618) : (i64) -> ()
      %1619 = func.call @stack_pop_pointer() : () -> i64
      %1620 = func.call @stack_pop_pointer() : () -> i64
      %1621 = func.call @cc_cons(%1620, %1619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1621) : (i64) -> ()
      %1622 = func.call @stack_pop_pointer() : () -> i64
      %1623 = func.call @stack_pop_pointer() : () -> i64
      %1624 = func.call @cc_cons(%1622, %1623) : (i64, i64) -> i64
      %1625 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1626 = arith.constant 5 : i64
      %1627 = func.call @cc_make_string(%1625, %1626) : (!llvm.ptr, i64) -> i64
      %1628 = func.call @cc_nil_value() : () -> i64
      %1629 = func.call @cc_intern(%1627, %1628) : (i64, i64) -> i64
      %1630 = func.call @cc_nil_value() : () -> i64
      %1631 = func.call @cc_cons(%1629, %1630) : (i64, i64) -> i64
      %1632 = func.call @cc_values_pack(%1631) : (i64) -> i64
      %1633 = func.call @cc_cons(%1629, %1624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1633) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1634 = func.call @stack_pop_pointer() : () -> i64
      %1635 = func.call @stack_pop_pointer() : () -> i64
      %1636 = func.call @cc_cons(%1635, %1634) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1636) : (i64) -> ()
      %1637 = func.call @stack_pop_pointer() : () -> i64
      %1638 = func.call @stack_pop_pointer() : () -> i64
      %1639 = func.call @cc_cons(%1638, %1637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1639) : (i64) -> ()
      %1640 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1640) : (i64) -> ()
      %1641 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%1641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1642 = func.call @stack_pop_pointer() : () -> i64
      %1643 = func.call @stack_pop_pointer() : () -> i64
      %1644 = func.call @cc_cons(%1643, %1642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1644) : (i64) -> ()
      %1645 = func.call @stack_pop_pointer() : () -> i64
      %1646 = func.call @stack_pop_pointer() : () -> i64
      %1647 = func.call @cc_cons(%1646, %1645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1647) : (i64) -> ()
      %1648 = func.call @stack_pop_pointer() : () -> i64
      %1649 = func.call @stack_pop_pointer() : () -> i64
      %1650 = func.call @cc_cons(%1649, %1648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1650) : (i64) -> ()
      %1651 = func.call @stack_pop_pointer() : () -> i64
      %1652 = func.call @stack_pop_pointer() : () -> i64
      %1653 = func.call @cc_cons(%1652, %1651) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1653) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1654 = func.call @stack_pop_pointer() : () -> i64
      %1655 = func.call @stack_pop_pointer() : () -> i64
      %1656 = func.call @cc_cons(%1655, %1654) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1656) : (i64) -> ()
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @stack_pop_pointer() : () -> i64
      %1659 = func.call @cc_cons(%1658, %1657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1659) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1660 = func.call @stack_pop_pointer() : () -> i64
      %1661 = func.call @stack_pop_pointer() : () -> i64
      %1662 = func.call @cc_cons(%1661, %1660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1662) : (i64) -> ()
      %1663 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1664 = arith.constant 4 : i64
      %1665 = func.call @cc_make_string(%1663, %1664) : (!llvm.ptr, i64) -> i64
      %1666 = func.call @cc_nil_value() : () -> i64
      %1667 = func.call @cc_intern(%1665, %1666) : (i64, i64) -> i64
      %1668 = func.call @cc_nil_value() : () -> i64
      %1669 = func.call @cc_cons(%1667, %1668) : (i64, i64) -> i64
      %1670 = func.call @cc_values_pack(%1669) : (i64) -> i64
      func.call @stack_push_pointer(%1667) : (i64) -> ()
      %1671 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1672 = arith.constant 6 : i64
      %1673 = func.call @cc_make_string(%1671, %1672) : (!llvm.ptr, i64) -> i64
      %1674 = func.call @cc_nil_value() : () -> i64
      %1675 = func.call @cc_intern(%1673, %1674) : (i64, i64) -> i64
      %1676 = func.call @cc_nil_value() : () -> i64
      %1677 = func.call @cc_cons(%1675, %1676) : (i64, i64) -> i64
      %1678 = func.call @cc_values_pack(%1677) : (i64) -> i64
      func.call @stack_push_pointer(%1675) : (i64) -> ()
      %1679 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%1679) : (i64) -> ()
      %1680 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1681 = arith.constant 7 : i64
      %1682 = func.call @cc_make_string(%1680, %1681) : (!llvm.ptr, i64) -> i64
      %1683 = func.call @cc_nil_value() : () -> i64
      %1684 = func.call @cc_intern(%1682, %1683) : (i64, i64) -> i64
      %1685 = func.call @cc_nil_value() : () -> i64
      %1686 = func.call @cc_cons(%1684, %1685) : (i64, i64) -> i64
      %1687 = func.call @cc_values_pack(%1686) : (i64) -> i64
      func.call @stack_push_pointer(%1684) : (i64) -> ()
      %1688 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1689 = arith.constant 19 : i64
      %1690 = func.call @cc_make_string(%1688, %1689) : (!llvm.ptr, i64) -> i64
      %1691 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1692 = arith.constant 11 : i64
      %1693 = func.call @cc_make_string(%1691, %1692) : (!llvm.ptr, i64) -> i64
      %1694 = func.call @cc_intern(%1690, %1693) : (i64, i64) -> i64
      %1695 = func.call @cc_nil_value() : () -> i64
      %1696 = func.call @cc_cons(%1694, %1695) : (i64, i64) -> i64
      %1697 = func.call @cc_values_pack(%1696) : (i64) -> i64
      func.call @stack_push_pointer(%1694) : (i64) -> ()
      %1698 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1699 = arith.constant 1 : i64
      %1700 = func.call @cc_make_string(%1698, %1699) : (!llvm.ptr, i64) -> i64
      %1701 = func.call @cc_nil_value() : () -> i64
      %1702 = func.call @cc_intern(%1700, %1701) : (i64, i64) -> i64
      %1703 = func.call @cc_nil_value() : () -> i64
      %1704 = func.call @cc_cons(%1702, %1703) : (i64, i64) -> i64
      %1705 = func.call @cc_values_pack(%1704) : (i64) -> i64
      func.call @stack_push_pointer(%1702) : (i64) -> ()
      %1706 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1707 = arith.constant 9 : i64
      %1708 = func.call @cc_make_string(%1706, %1707) : (!llvm.ptr, i64) -> i64
      %1709 = func.call @cc_nil_value() : () -> i64
      %1710 = func.call @cc_intern(%1708, %1709) : (i64, i64) -> i64
      %1711 = func.call @cc_nil_value() : () -> i64
      %1712 = func.call @cc_cons(%1710, %1711) : (i64, i64) -> i64
      %1713 = func.call @cc_values_pack(%1712) : (i64) -> i64
      func.call @stack_push_pointer(%1710) : (i64) -> ()
      %1714 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1715 = arith.constant 8 : i64
      %1716 = func.call @cc_make_string(%1714, %1715) : (!llvm.ptr, i64) -> i64
      %1717 = func.call @cc_nil_value() : () -> i64
      %1718 = func.call @cc_intern(%1716, %1717) : (i64, i64) -> i64
      %1719 = func.call @cc_nil_value() : () -> i64
      %1720 = func.call @cc_cons(%1718, %1719) : (i64, i64) -> i64
      %1721 = func.call @cc_values_pack(%1720) : (i64) -> i64
      func.call @stack_push_pointer(%1718) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1722 = func.call @stack_pop_pointer() : () -> i64
      %1723 = func.call @stack_pop_pointer() : () -> i64
      %1724 = func.call @cc_cons(%1723, %1722) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1724) : (i64) -> ()
      %1725 = func.call @stack_pop_pointer() : () -> i64
      %1726 = func.call @stack_pop_pointer() : () -> i64
      %1727 = func.call @cc_cons(%1726, %1725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1727) : (i64) -> ()
      %1728 = func.call @stack_pop_pointer() : () -> i64
      %1729 = func.call @stack_pop_pointer() : () -> i64
      %1730 = func.call @cc_cons(%1729, %1728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1730) : (i64) -> ()
      %1731 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1732 = arith.constant 7 : i64
      %1733 = func.call @cc_make_string(%1731, %1732) : (!llvm.ptr, i64) -> i64
      %1734 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1735 = arith.constant 11 : i64
      %1736 = func.call @cc_make_string(%1734, %1735) : (!llvm.ptr, i64) -> i64
      %1737 = func.call @cc_intern(%1733, %1736) : (i64, i64) -> i64
      %1738 = func.call @cc_nil_value() : () -> i64
      %1739 = func.call @cc_cons(%1737, %1738) : (i64, i64) -> i64
      %1740 = func.call @cc_values_pack(%1739) : (i64) -> i64
      func.call @stack_push_pointer(%1737) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1741 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1742 = arith.constant 1 : i64
      %1743 = func.call @cc_make_string(%1741, %1742) : (!llvm.ptr, i64) -> i64
      %1744 = func.call @cc_nil_value() : () -> i64
      %1745 = func.call @cc_intern(%1743, %1744) : (i64, i64) -> i64
      %1746 = func.call @cc_nil_value() : () -> i64
      %1747 = func.call @cc_cons(%1745, %1746) : (i64, i64) -> i64
      %1748 = func.call @cc_values_pack(%1747) : (i64) -> i64
      func.call @stack_push_pointer(%1745) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1749 = func.call @stack_pop_pointer() : () -> i64
      %1750 = func.call @stack_pop_pointer() : () -> i64
      %1751 = func.call @cc_cons(%1750, %1749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1751) : (i64) -> ()
      %1752 = func.call @stack_pop_pointer() : () -> i64
      %1753 = func.call @stack_pop_pointer() : () -> i64
      %1754 = func.call @cc_cons(%1753, %1752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1754) : (i64) -> ()
      %1755 = func.call @stack_pop_pointer() : () -> i64
      %1756 = func.call @stack_pop_pointer() : () -> i64
      %1757 = func.call @cc_cons(%1756, %1755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1757) : (i64) -> ()
      %1758 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1759 = arith.constant 2 : i64
      %1760 = func.call @cc_make_string(%1758, %1759) : (!llvm.ptr, i64) -> i64
      %1761 = func.call @cc_nil_value() : () -> i64
      %1762 = func.call @cc_intern(%1760, %1761) : (i64, i64) -> i64
      %1763 = func.call @cc_nil_value() : () -> i64
      %1764 = func.call @cc_cons(%1762, %1763) : (i64, i64) -> i64
      %1765 = func.call @cc_values_pack(%1764) : (i64) -> i64
      func.call @stack_push_pointer(%1762) : (i64) -> ()
      %1766 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1767 = arith.constant 2 : i64
      %1768 = func.call @cc_make_string(%1766, %1767) : (!llvm.ptr, i64) -> i64
      %1769 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1770 = arith.constant 11 : i64
      %1771 = func.call @cc_make_string(%1769, %1770) : (!llvm.ptr, i64) -> i64
      %1772 = func.call @cc_intern(%1768, %1771) : (i64, i64) -> i64
      %1773 = func.call @cc_nil_value() : () -> i64
      %1774 = func.call @cc_cons(%1772, %1773) : (i64, i64) -> i64
      %1775 = func.call @cc_values_pack(%1774) : (i64) -> i64
      func.call @stack_push_pointer(%1772) : (i64) -> ()
      %1776 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1777 = arith.constant 9 : i64
      %1778 = func.call @cc_make_string(%1776, %1777) : (!llvm.ptr, i64) -> i64
      %1779 = func.call @cc_nil_value() : () -> i64
      %1780 = func.call @cc_intern(%1778, %1779) : (i64, i64) -> i64
      %1781 = func.call @cc_nil_value() : () -> i64
      %1782 = func.call @cc_cons(%1780, %1781) : (i64, i64) -> i64
      %1783 = func.call @cc_values_pack(%1782) : (i64) -> i64
      func.call @stack_push_pointer(%1780) : (i64) -> ()
      %1784 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1785 = arith.constant 8 : i64
      %1786 = func.call @cc_make_string(%1784, %1785) : (!llvm.ptr, i64) -> i64
      %1787 = func.call @cc_nil_value() : () -> i64
      %1788 = func.call @cc_intern(%1786, %1787) : (i64, i64) -> i64
      %1789 = func.call @cc_nil_value() : () -> i64
      %1790 = func.call @cc_cons(%1788, %1789) : (i64, i64) -> i64
      %1791 = func.call @cc_values_pack(%1790) : (i64) -> i64
      func.call @stack_push_pointer(%1788) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1792 = func.call @stack_pop_pointer() : () -> i64
      %1793 = func.call @stack_pop_pointer() : () -> i64
      %1794 = func.call @cc_cons(%1793, %1792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1794) : (i64) -> ()
      %1795 = func.call @stack_pop_pointer() : () -> i64
      %1796 = func.call @stack_pop_pointer() : () -> i64
      %1797 = func.call @cc_cons(%1796, %1795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1797) : (i64) -> ()
      %1798 = func.call @stack_pop_pointer() : () -> i64
      %1799 = func.call @stack_pop_pointer() : () -> i64
      %1800 = func.call @cc_cons(%1799, %1798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1800) : (i64) -> ()
      %1801 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1802 = arith.constant 11 : i64
      %1803 = func.call @cc_make_string(%1801, %1802) : (!llvm.ptr, i64) -> i64
      %1804 = func.call @cc_nil_value() : () -> i64
      %1805 = func.call @cc_intern(%1803, %1804) : (i64, i64) -> i64
      %1806 = func.call @cc_nil_value() : () -> i64
      %1807 = func.call @cc_cons(%1805, %1806) : (i64, i64) -> i64
      %1808 = func.call @cc_values_pack(%1807) : (i64) -> i64
      func.call @stack_push_pointer(%1805) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1809 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1810 = arith.constant 6 : i64
      %1811 = func.call @cc_make_string(%1809, %1810) : (!llvm.ptr, i64) -> i64
      %1812 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1813 = arith.constant 11 : i64
      %1814 = func.call @cc_make_string(%1812, %1813) : (!llvm.ptr, i64) -> i64
      %1815 = func.call @cc_intern(%1811, %1814) : (i64, i64) -> i64
      %1816 = func.call @cc_nil_value() : () -> i64
      %1817 = func.call @cc_cons(%1815, %1816) : (i64, i64) -> i64
      %1818 = func.call @cc_values_pack(%1817) : (i64) -> i64
      func.call @stack_push_pointer(%1815) : (i64) -> ()
      %1819 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1820 = arith.constant 9 : i64
      %1821 = func.call @cc_make_string(%1819, %1820) : (!llvm.ptr, i64) -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = func.call @cc_intern(%1821, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_nil_value() : () -> i64
      %1825 = func.call @cc_cons(%1823, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_values_pack(%1825) : (i64) -> i64
      func.call @stack_push_pointer(%1823) : (i64) -> ()
      %1827 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1828 = arith.constant 8 : i64
      %1829 = func.call @cc_make_string(%1827, %1828) : (!llvm.ptr, i64) -> i64
      %1830 = func.call @cc_nil_value() : () -> i64
      %1831 = func.call @cc_intern(%1829, %1830) : (i64, i64) -> i64
      %1832 = func.call @cc_nil_value() : () -> i64
      %1833 = func.call @cc_cons(%1831, %1832) : (i64, i64) -> i64
      %1834 = func.call @cc_values_pack(%1833) : (i64) -> i64
      func.call @stack_push_pointer(%1831) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1835 = func.call @stack_pop_pointer() : () -> i64
      %1836 = func.call @stack_pop_pointer() : () -> i64
      %1837 = func.call @cc_cons(%1836, %1835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1837) : (i64) -> ()
      %1838 = func.call @stack_pop_pointer() : () -> i64
      %1839 = func.call @stack_pop_pointer() : () -> i64
      %1840 = func.call @cc_cons(%1839, %1838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1840) : (i64) -> ()
      %1841 = func.call @stack_pop_pointer() : () -> i64
      %1842 = func.call @stack_pop_pointer() : () -> i64
      %1843 = func.call @cc_cons(%1842, %1841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1843) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1844 = func.call @stack_pop_pointer() : () -> i64
      %1845 = func.call @stack_pop_pointer() : () -> i64
      %1846 = func.call @cc_cons(%1845, %1844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1846) : (i64) -> ()
      %1847 = func.call @stack_pop_pointer() : () -> i64
      %1848 = func.call @stack_pop_pointer() : () -> i64
      %1849 = func.call @cc_cons(%1848, %1847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1849) : (i64) -> ()
      %1850 = func.call @stack_pop_pointer() : () -> i64
      %1851 = func.call @stack_pop_pointer() : () -> i64
      %1852 = func.call @cc_cons(%1851, %1850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1852) : (i64) -> ()
      %1853 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1854 = arith.constant 7 : i64
      %1855 = func.call @cc_make_string(%1853, %1854) : (!llvm.ptr, i64) -> i64
      %1856 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1857 = arith.constant 11 : i64
      %1858 = func.call @cc_make_string(%1856, %1857) : (!llvm.ptr, i64) -> i64
      %1859 = func.call @cc_intern(%1855, %1858) : (i64, i64) -> i64
      %1860 = func.call @cc_nil_value() : () -> i64
      %1861 = func.call @cc_cons(%1859, %1860) : (i64, i64) -> i64
      %1862 = func.call @cc_values_pack(%1861) : (i64) -> i64
      func.call @stack_push_pointer(%1859) : (i64) -> ()
      %1863 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1864 = arith.constant 1 : i64
      %1865 = func.call @cc_make_string(%1863, %1864) : (!llvm.ptr, i64) -> i64
      %1866 = func.call @cc_nil_value() : () -> i64
      %1867 = func.call @cc_intern(%1865, %1866) : (i64, i64) -> i64
      %1868 = func.call @cc_nil_value() : () -> i64
      %1869 = func.call @cc_cons(%1867, %1868) : (i64, i64) -> i64
      %1870 = func.call @cc_values_pack(%1869) : (i64) -> i64
      func.call @stack_push_pointer(%1867) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1871 = func.call @stack_pop_pointer() : () -> i64
      %1872 = func.call @stack_pop_pointer() : () -> i64
      %1873 = func.call @cc_cons(%1872, %1871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1873) : (i64) -> ()
      %1874 = func.call @stack_pop_pointer() : () -> i64
      %1875 = func.call @stack_pop_pointer() : () -> i64
      %1876 = func.call @cc_cons(%1875, %1874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1876) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1877 = func.call @stack_pop_pointer() : () -> i64
      %1878 = func.call @stack_pop_pointer() : () -> i64
      %1879 = func.call @cc_cons(%1878, %1877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1879) : (i64) -> ()
      %1880 = func.call @stack_pop_pointer() : () -> i64
      %1881 = func.call @stack_pop_pointer() : () -> i64
      %1882 = func.call @cc_cons(%1881, %1880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1882) : (i64) -> ()
      %1883 = func.call @stack_pop_pointer() : () -> i64
      %1884 = func.call @stack_pop_pointer() : () -> i64
      %1885 = func.call @cc_cons(%1884, %1883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1885) : (i64) -> ()
      %1886 = func.call @stack_pop_pointer() : () -> i64
      %1887 = func.call @stack_pop_pointer() : () -> i64
      %1888 = func.call @cc_cons(%1887, %1886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1888) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1889 = func.call @stack_pop_pointer() : () -> i64
      %1890 = func.call @stack_pop_pointer() : () -> i64
      %1891 = func.call @cc_cons(%1890, %1889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1891) : (i64) -> ()
      %1892 = func.call @stack_pop_pointer() : () -> i64
      %1893 = func.call @stack_pop_pointer() : () -> i64
      %1894 = func.call @cc_cons(%1893, %1892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1894) : (i64) -> ()
      %1895 = func.call @stack_pop_pointer() : () -> i64
      %1896 = func.call @stack_pop_pointer() : () -> i64
      %1897 = func.call @cc_cons(%1896, %1895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1897) : (i64) -> ()
      %1898 = func.call @stack_pop_pointer() : () -> i64
      %1899 = func.call @stack_pop_pointer() : () -> i64
      %1900 = func.call @cc_cons(%1899, %1898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1900) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1901 = func.call @stack_pop_pointer() : () -> i64
      %1902 = func.call @stack_pop_pointer() : () -> i64
      %1903 = func.call @cc_cons(%1902, %1901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1903) : (i64) -> ()
      %1904 = func.call @stack_pop_pointer() : () -> i64
      %1905 = func.call @stack_pop_pointer() : () -> i64
      %1906 = func.call @cc_cons(%1905, %1904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1906) : (i64) -> ()
      %1907 = func.call @stack_pop_pointer() : () -> i64
      %1908 = func.call @stack_pop_pointer() : () -> i64
      %1909 = func.call @cc_cons(%1908, %1907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1909) : (i64) -> ()
      %1910 = func.call @stack_pop_pointer() : () -> i64
      %1911 = func.call @stack_pop_pointer() : () -> i64
      %1912 = func.call @cc_cons(%1911, %1910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1912) : (i64) -> ()
      %1913 = func.call @stack_pop_pointer() : () -> i64
      %1914 = func.call @stack_pop_pointer() : () -> i64
      %1915 = func.call @cc_cons(%1914, %1913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1915) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %2286 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2287 = arith.constant 30 : i64
      %2288 = func.call @cc_make_symbol(%2286, %2287) : (!llvm.ptr, i64) -> i64
      %2289 = func.call @cc_persistent_root_value(%2288) : (i64) -> i64
      func.call @stack_push_pointer(%2289) : (i64) -> ()
      %2290 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2291 = arith.constant 37 : i64
      %2292 = func.call @cc_make_symbol(%2290, %2291) : (!llvm.ptr, i64) -> i64
      %2293 = func.call @cc_persistent_root_value(%2292) : (i64) -> i64
      func.call @stack_push_pointer(%2293) : (i64) -> ()
      %2294 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2295 = arith.constant 38 : i64
      %2296 = func.call @cc_make_symbol(%2294, %2295) : (!llvm.ptr, i64) -> i64
      %2297 = func.call @cc_persistent_root_value(%2296) : (i64) -> i64
      func.call @stack_push_pointer(%2297) : (i64) -> ()
      %2298 = arith.constant 275462358040595 : i64
      %2299 = arith.constant 3 : i64
      %2300 = func.call @cc_make_closure(%2298, %2299) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2300) : (i64) -> ()
      %2301 = func.call @stack_pop_pointer() : () -> i64
      %2302 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2302) : (i64) -> ()
      %2303 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2303) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2304 = func.call @stack_pop_pointer() : () -> i64
      %2305 = func.call @stack_pop_pointer() : () -> i64
      %2306 = func.call @cc_cons(%2305, %2304) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2306) : (i64) -> ()
      %2307 = func.call @stack_pop_pointer() : () -> i64
      %2308 = func.call @stack_pop_pointer() : () -> i64
      %2309 = func.call @cc_cons(%2308, %2307) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2309) : (i64) -> ()
      %2310 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2310) : (i64) -> ()
      %2311 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2312 = func.call @stack_pop_pointer() : () -> i64
      %2313 = func.call @stack_pop_pointer() : () -> i64
      %2314 = func.call @cc_cons(%2313, %2312) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2314) : (i64) -> ()
      %2315 = func.call @stack_pop_pointer() : () -> i64
      %2316 = func.call @stack_pop_pointer() : () -> i64
      %2317 = func.call @cc_cons(%2316, %2315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2317) : (i64) -> ()
      %2318 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2318) : (i64) -> ()
      %2319 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2319) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2320 = func.call @stack_pop_pointer() : () -> i64
      %2321 = func.call @stack_pop_pointer() : () -> i64
      %2322 = func.call @cc_cons(%2321, %2320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2322) : (i64) -> ()
      %2323 = func.call @stack_pop_pointer() : () -> i64
      %2324 = func.call @stack_pop_pointer() : () -> i64
      %2325 = func.call @cc_cons(%2324, %2323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2325) : (i64) -> ()
      %2326 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2326) : (i64) -> ()
      %2327 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2327) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2328 = func.call @stack_pop_pointer() : () -> i64
      %2329 = func.call @stack_pop_pointer() : () -> i64
      %2330 = func.call @cc_cons(%2329, %2328) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2330) : (i64) -> ()
      %2331 = func.call @stack_pop_pointer() : () -> i64
      %2332 = func.call @stack_pop_pointer() : () -> i64
      %2333 = func.call @cc_cons(%2332, %2331) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2333) : (i64) -> ()
      %2334 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2334) : (i64) -> ()
      %2335 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2335) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2336 = func.call @stack_pop_pointer() : () -> i64
      %2337 = func.call @stack_pop_pointer() : () -> i64
      %2338 = func.call @cc_cons(%2337, %2336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2338) : (i64) -> ()
      %2339 = func.call @stack_pop_pointer() : () -> i64
      %2340 = func.call @stack_pop_pointer() : () -> i64
      %2341 = func.call @cc_cons(%2340, %2339) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2341) : (i64) -> ()
      %2342 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2342) : (i64) -> ()
      %2343 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2343) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2344 = func.call @stack_pop_pointer() : () -> i64
      %2345 = func.call @stack_pop_pointer() : () -> i64
      %2346 = func.call @cc_cons(%2345, %2344) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2346) : (i64) -> ()
      %2347 = func.call @stack_pop_pointer() : () -> i64
      %2348 = func.call @stack_pop_pointer() : () -> i64
      %2349 = func.call @cc_cons(%2348, %2347) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2349) : (i64) -> ()
      %2350 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%2350) : (i64) -> ()
      %2351 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%2351) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2352 = func.call @stack_pop_pointer() : () -> i64
      %2353 = func.call @stack_pop_pointer() : () -> i64
      %2354 = func.call @cc_cons(%2353, %2352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2354) : (i64) -> ()
      %2355 = func.call @stack_pop_pointer() : () -> i64
      %2356 = func.call @stack_pop_pointer() : () -> i64
      %2357 = func.call @cc_cons(%2356, %2355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2357) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2358 = func.call @stack_pop_pointer() : () -> i64
      %2359 = func.call @stack_pop_pointer() : () -> i64
      %2360 = func.call @cc_cons(%2359, %2358) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2360) : (i64) -> ()
      %2361 = func.call @stack_pop_pointer() : () -> i64
      %2362 = func.call @stack_pop_pointer() : () -> i64
      %2363 = func.call @cc_cons(%2362, %2361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2363) : (i64) -> ()
      %2364 = func.call @stack_pop_pointer() : () -> i64
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = func.call @cc_cons(%2365, %2364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2366) : (i64) -> ()
      %2367 = func.call @stack_pop_pointer() : () -> i64
      %2368 = func.call @stack_pop_pointer() : () -> i64
      %2369 = func.call @cc_cons(%2368, %2367) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2369) : (i64) -> ()
      %2370 = func.call @stack_pop_pointer() : () -> i64
      %2371 = func.call @stack_pop_pointer() : () -> i64
      %2372 = func.call @cc_cons(%2371, %2370) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2372) : (i64) -> ()
      %2373 = func.call @stack_pop_pointer() : () -> i64
      %2374 = func.call @stack_pop_pointer() : () -> i64
      %2375 = func.call @cc_cons(%2374, %2373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2375) : (i64) -> ()
      %2376 = func.call @stack_pop_pointer() : () -> i64
      %2377 = func.call @stack_pop_pointer() : () -> i64
      %2378 = func.call @cc_cons(%2377, %2376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2378) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2379 = func.call @stack_pop_pointer() : () -> i64
      %2380 = func.call @stack_pop_pointer() : () -> i64
      %2381 = func.call @cc_cons(%2380, %2379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2381) : (i64) -> ()
      %2382 = func.call @stack_pop_pointer() : () -> i64
      %2383 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2384 = arith.constant 11 : i64
      %2385 = func.call @cc_make_string(%2383, %2384) : (!llvm.ptr, i64) -> i64
      %2386 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2387 = arith.constant 7 : i64
      %2388 = func.call @cc_make_string(%2386, %2387) : (!llvm.ptr, i64) -> i64
      %2389 = func.call @cc_intern(%2385, %2388) : (i64, i64) -> i64
      %2390 = func.call @cc_nil_value() : () -> i64
      %2391 = func.call @cc_cons(%2389, %2390) : (i64, i64) -> i64
      %2392 = func.call @cc_values_pack(%2391) : (i64) -> i64
      func.call @stack_push_pointer(%2389) : (i64) -> ()
      %2393 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2394 = func.call @stack_pop_pointer() : () -> i64
      %2395 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2396 = arith.constant 4 : i64
      %2397 = func.call @cc_make_string(%2395, %2396) : (!llvm.ptr, i64) -> i64
      %2398 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2399 = arith.constant 7 : i64
      %2400 = func.call @cc_make_string(%2398, %2399) : (!llvm.ptr, i64) -> i64
      %2401 = func.call @cc_intern(%2397, %2400) : (i64, i64) -> i64
      %2402 = func.call @cc_nil_value() : () -> i64
      %2403 = func.call @cc_cons(%2401, %2402) : (i64, i64) -> i64
      %2404 = func.call @cc_values_pack(%2403) : (i64) -> i64
      func.call @stack_push_pointer(%2401) : (i64) -> ()
      %2405 = func.call @stack_pop_pointer() : () -> i64
      %2406 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2407 = arith.constant 6 : i64
      %2408 = func.call @cc_make_string(%2406, %2407) : (!llvm.ptr, i64) -> i64
      %2409 = func.call @cc_nil_value() : () -> i64
      %2410 = func.call @cc_intern(%2408, %2409) : (i64, i64) -> i64
      %2411 = func.call @cc_nil_value() : () -> i64
      %2412 = func.call @cc_cons(%2410, %2411) : (i64, i64) -> i64
      %2413 = func.call @cc_values_pack(%2412) : (i64) -> i64
      func.call @stack_push_pointer(%2410) : (i64) -> ()
      %2414 = func.call @stack_pop_pointer() : () -> i64
      %2415 = func.call @cc_nil_value() : () -> i64
      %2416 = func.call @cc_errorp(%1489) : (i64) -> i64
      %2417 = arith.cmpi ne, %2416, %2415 : i64
      %2418 = arith.cmpi eq, %2415, %2415 : i64
      %2419 = arith.andi %2417, %2418 : i1
      %2420 = scf.if %2419 -> (i64) {
        scf.yield %1489 : i64
      } else {
        scf.yield %2415 : i64
      }
      %2421 = func.call @cc_errorp(%1925) : (i64) -> i64
      %2422 = arith.cmpi ne, %2421, %2415 : i64
      %2423 = arith.cmpi eq, %2420, %2415 : i64
      %2424 = arith.andi %2422, %2423 : i1
      %2425 = scf.if %2424 -> (i64) {
        scf.yield %1925 : i64
      } else {
        scf.yield %2420 : i64
      }
      %2426 = func.call @cc_errorp(%2301) : (i64) -> i64
      %2427 = arith.cmpi ne, %2426, %2415 : i64
      %2428 = arith.cmpi eq, %2425, %2415 : i64
      %2429 = arith.andi %2427, %2428 : i1
      %2430 = scf.if %2429 -> (i64) {
        scf.yield %2301 : i64
      } else {
        scf.yield %2425 : i64
      }
      %2431 = func.call @cc_errorp(%2382) : (i64) -> i64
      %2432 = arith.cmpi ne, %2431, %2415 : i64
      %2433 = arith.cmpi eq, %2430, %2415 : i64
      %2434 = arith.andi %2432, %2433 : i1
      %2435 = scf.if %2434 -> (i64) {
        scf.yield %2382 : i64
      } else {
        scf.yield %2430 : i64
      }
      %2436 = func.call @cc_errorp(%2393) : (i64) -> i64
      %2437 = arith.cmpi ne, %2436, %2415 : i64
      %2438 = arith.cmpi eq, %2435, %2415 : i64
      %2439 = arith.andi %2437, %2438 : i1
      %2440 = scf.if %2439 -> (i64) {
        scf.yield %2393 : i64
      } else {
        scf.yield %2435 : i64
      }
      %2441 = func.call @cc_errorp(%2394) : (i64) -> i64
      %2442 = arith.cmpi ne, %2441, %2415 : i64
      %2443 = arith.cmpi eq, %2440, %2415 : i64
      %2444 = arith.andi %2442, %2443 : i1
      %2445 = scf.if %2444 -> (i64) {
        scf.yield %2394 : i64
      } else {
        scf.yield %2440 : i64
      }
      %2446 = func.call @cc_errorp(%2405) : (i64) -> i64
      %2447 = arith.cmpi ne, %2446, %2415 : i64
      %2448 = arith.cmpi eq, %2445, %2415 : i64
      %2449 = arith.andi %2447, %2448 : i1
      %2450 = scf.if %2449 -> (i64) {
        scf.yield %2405 : i64
      } else {
        scf.yield %2445 : i64
      }
      %2451 = func.call @cc_errorp(%2414) : (i64) -> i64
      %2452 = arith.cmpi ne, %2451, %2415 : i64
      %2453 = arith.cmpi eq, %2450, %2415 : i64
      %2454 = arith.andi %2452, %2453 : i1
      %2455 = scf.if %2454 -> (i64) {
        scf.yield %2414 : i64
      } else {
        scf.yield %2450 : i64
      }
      %2456 = arith.cmpi ne, %2455, %2415 : i64
      scf.if %2456 {
        func.call @stack_push_pointer(%2455) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1489) : (i64) -> ()
        func.call @stack_push_pointer(%1925) : (i64) -> ()
        func.call @stack_push_pointer(%2301) : (i64) -> ()
        func.call @stack_push_pointer(%2382) : (i64) -> ()
        func.call @stack_push_pointer(%2393) : (i64) -> ()
        func.call @stack_push_pointer(%2394) : (i64) -> ()
        func.call @stack_push_pointer(%2405) : (i64) -> ()
        func.call @stack_push_pointer(%2414) : (i64) -> ()
        %2457 = llvm.mlir.addressof @str189 : !llvm.ptr
        %2458 = func.call @cc_make_function_ref_const(%2457) : (!llvm.ptr) -> i64
        %2459 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2458, %2459) : (i64, i64) -> ()
      }
      %2460 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2460 : i64
    }
    %2461 = func.call @cc_nil_value() : () -> i64
    %2462 = func.call @cc_errorp(%1480) : (i64) -> i64
    %2463 = arith.cmpi ne, %2462, %2461 : i64
    %2464 = scf.if %2463 -> (i64) {
      scf.yield %1480 : i64
    } else {
      %2465 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2466 = arith.constant 13 : i64
      %2467 = func.call @cc_make_string(%2465, %2466) : (!llvm.ptr, i64) -> i64
      %2468 = func.call @cc_nil_value() : () -> i64
      %2469 = func.call @cc_intern(%2467, %2468) : (i64, i64) -> i64
      %2470 = func.call @cc_nil_value() : () -> i64
      %2471 = func.call @cc_cons(%2469, %2470) : (i64, i64) -> i64
      %2472 = func.call @cc_values_pack(%2471) : (i64) -> i64
      func.call @stack_push_pointer(%2469) : (i64) -> ()
      %2473 = func.call @stack_pop_pointer() : () -> i64
      %2474 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2475 = arith.constant 3 : i64
      %2476 = func.call @cc_make_string(%2474, %2475) : (!llvm.ptr, i64) -> i64
      %2477 = func.call @cc_nil_value() : () -> i64
      %2478 = func.call @cc_intern(%2476, %2477) : (i64, i64) -> i64
      %2479 = func.call @cc_nil_value() : () -> i64
      %2480 = func.call @cc_cons(%2478, %2479) : (i64, i64) -> i64
      %2481 = func.call @cc_values_pack(%2480) : (i64) -> i64
      func.call @stack_push_pointer(%2478) : (i64) -> ()
      %2482 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2483 = arith.constant 1 : i64
      %2484 = func.call @cc_make_string(%2482, %2483) : (!llvm.ptr, i64) -> i64
      %2485 = func.call @cc_nil_value() : () -> i64
      %2486 = func.call @cc_intern(%2484, %2485) : (i64, i64) -> i64
      %2487 = func.call @cc_nil_value() : () -> i64
      %2488 = func.call @cc_cons(%2486, %2487) : (i64, i64) -> i64
      %2489 = func.call @cc_values_pack(%2488) : (i64) -> i64
      func.call @stack_push_pointer(%2486) : (i64) -> ()
      %2490 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2491 = arith.constant 7 : i64
      %2492 = func.call @cc_make_string(%2490, %2491) : (!llvm.ptr, i64) -> i64
      %2493 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2494 = arith.constant 11 : i64
      %2495 = func.call @cc_make_string(%2493, %2494) : (!llvm.ptr, i64) -> i64
      %2496 = func.call @cc_intern(%2492, %2495) : (i64, i64) -> i64
      %2497 = func.call @cc_nil_value() : () -> i64
      %2498 = func.call @cc_cons(%2496, %2497) : (i64, i64) -> i64
      %2499 = func.call @cc_values_pack(%2498) : (i64) -> i64
      func.call @stack_push_pointer(%2496) : (i64) -> ()
      %2500 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2501 = arith.constant 11 : i64
      %2502 = func.call @cc_make_string(%2500, %2501) : (!llvm.ptr, i64) -> i64
      %2503 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2504 = arith.constant 3 : i64
      %2505 = func.call @cc_make_string(%2503, %2504) : (!llvm.ptr, i64) -> i64
      %2506 = func.call @cc_intern(%2502, %2505) : (i64, i64) -> i64
      %2507 = func.call @cc_nil_value() : () -> i64
      %2508 = func.call @cc_cons(%2506, %2507) : (i64, i64) -> i64
      %2509 = func.call @cc_values_pack(%2508) : (i64) -> i64
      func.call @stack_push_pointer(%2506) : (i64) -> ()
      %2510 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2510) : (i64) -> ()
      %2511 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2512 = arith.constant 6 : i64
      %2513 = func.call @cc_make_string(%2511, %2512) : (!llvm.ptr, i64) -> i64
      %2514 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2515 = arith.constant 11 : i64
      %2516 = func.call @cc_make_string(%2514, %2515) : (!llvm.ptr, i64) -> i64
      %2517 = func.call @cc_intern(%2513, %2516) : (i64, i64) -> i64
      %2518 = func.call @cc_nil_value() : () -> i64
      %2519 = func.call @cc_cons(%2517, %2518) : (i64, i64) -> i64
      %2520 = func.call @cc_values_pack(%2519) : (i64) -> i64
      func.call @stack_push_pointer(%2517) : (i64) -> ()
      %2521 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2522 = arith.constant 1 : i64
      %2523 = func.call @cc_make_string(%2521, %2522) : (!llvm.ptr, i64) -> i64
      %2524 = func.call @cc_nil_value() : () -> i64
      %2525 = func.call @cc_intern(%2523, %2524) : (i64, i64) -> i64
      %2526 = func.call @cc_nil_value() : () -> i64
      %2527 = func.call @cc_cons(%2525, %2526) : (i64, i64) -> i64
      %2528 = func.call @cc_values_pack(%2527) : (i64) -> i64
      func.call @stack_push_pointer(%2525) : (i64) -> ()
      %2529 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2530 = arith.constant 1 : i64
      %2531 = func.call @cc_make_string(%2529, %2530) : (!llvm.ptr, i64) -> i64
      %2532 = func.call @cc_nil_value() : () -> i64
      %2533 = func.call @cc_intern(%2531, %2532) : (i64, i64) -> i64
      %2534 = func.call @cc_nil_value() : () -> i64
      %2535 = func.call @cc_cons(%2533, %2534) : (i64, i64) -> i64
      %2536 = func.call @cc_values_pack(%2535) : (i64) -> i64
      func.call @stack_push_pointer(%2533) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2537 = func.call @stack_pop_pointer() : () -> i64
      %2538 = func.call @stack_pop_pointer() : () -> i64
      %2539 = func.call @cc_cons(%2538, %2537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2539) : (i64) -> ()
      %2540 = func.call @stack_pop_pointer() : () -> i64
      %2541 = func.call @stack_pop_pointer() : () -> i64
      %2542 = func.call @cc_cons(%2541, %2540) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2542) : (i64) -> ()
      %2543 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2544 = arith.constant 6 : i64
      %2545 = func.call @cc_make_string(%2543, %2544) : (!llvm.ptr, i64) -> i64
      %2546 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2547 = arith.constant 11 : i64
      %2548 = func.call @cc_make_string(%2546, %2547) : (!llvm.ptr, i64) -> i64
      %2549 = func.call @cc_intern(%2545, %2548) : (i64, i64) -> i64
      %2550 = func.call @cc_nil_value() : () -> i64
      %2551 = func.call @cc_cons(%2549, %2550) : (i64, i64) -> i64
      %2552 = func.call @cc_values_pack(%2551) : (i64) -> i64
      func.call @stack_push_pointer(%2549) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2553 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2554 = arith.constant 2 : i64
      %2555 = func.call @cc_make_string(%2553, %2554) : (!llvm.ptr, i64) -> i64
      %2556 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2557 = arith.constant 11 : i64
      %2558 = func.call @cc_make_string(%2556, %2557) : (!llvm.ptr, i64) -> i64
      %2559 = func.call @cc_intern(%2555, %2558) : (i64, i64) -> i64
      %2560 = func.call @cc_nil_value() : () -> i64
      %2561 = func.call @cc_cons(%2559, %2560) : (i64, i64) -> i64
      %2562 = func.call @cc_values_pack(%2561) : (i64) -> i64
      func.call @stack_push_pointer(%2559) : (i64) -> ()
      %2563 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2564 = arith.constant 1 : i64
      %2565 = func.call @cc_make_string(%2563, %2564) : (!llvm.ptr, i64) -> i64
      %2566 = func.call @cc_nil_value() : () -> i64
      %2567 = func.call @cc_intern(%2565, %2566) : (i64, i64) -> i64
      %2568 = func.call @cc_nil_value() : () -> i64
      %2569 = func.call @cc_cons(%2567, %2568) : (i64, i64) -> i64
      %2570 = func.call @cc_values_pack(%2569) : (i64) -> i64
      func.call @stack_push_pointer(%2567) : (i64) -> ()
      %2571 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2572 = arith.constant 1 : i64
      %2573 = func.call @cc_make_string(%2571, %2572) : (!llvm.ptr, i64) -> i64
      %2574 = func.call @cc_nil_value() : () -> i64
      %2575 = func.call @cc_intern(%2573, %2574) : (i64, i64) -> i64
      %2576 = func.call @cc_nil_value() : () -> i64
      %2577 = func.call @cc_cons(%2575, %2576) : (i64, i64) -> i64
      %2578 = func.call @cc_values_pack(%2577) : (i64) -> i64
      func.call @stack_push_pointer(%2575) : (i64) -> ()
      %2579 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2580 = arith.constant 1 : i64
      %2581 = func.call @cc_make_string(%2579, %2580) : (!llvm.ptr, i64) -> i64
      %2582 = func.call @cc_nil_value() : () -> i64
      %2583 = func.call @cc_intern(%2581, %2582) : (i64, i64) -> i64
      %2584 = func.call @cc_nil_value() : () -> i64
      %2585 = func.call @cc_cons(%2583, %2584) : (i64, i64) -> i64
      %2586 = func.call @cc_values_pack(%2585) : (i64) -> i64
      func.call @stack_push_pointer(%2583) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2587 = func.call @stack_pop_pointer() : () -> i64
      %2588 = func.call @stack_pop_pointer() : () -> i64
      %2589 = func.call @cc_cons(%2588, %2587) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2589) : (i64) -> ()
      %2590 = func.call @stack_pop_pointer() : () -> i64
      %2591 = func.call @stack_pop_pointer() : () -> i64
      %2592 = func.call @cc_cons(%2591, %2590) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2592) : (i64) -> ()
      %2593 = func.call @stack_pop_pointer() : () -> i64
      %2594 = func.call @stack_pop_pointer() : () -> i64
      %2595 = func.call @cc_cons(%2594, %2593) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2595) : (i64) -> ()
      %2596 = func.call @stack_pop_pointer() : () -> i64
      %2597 = func.call @stack_pop_pointer() : () -> i64
      %2598 = func.call @cc_cons(%2597, %2596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2598) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2599 = func.call @stack_pop_pointer() : () -> i64
      %2600 = func.call @stack_pop_pointer() : () -> i64
      %2601 = func.call @cc_cons(%2600, %2599) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2601) : (i64) -> ()
      %2602 = func.call @stack_pop_pointer() : () -> i64
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @cc_cons(%2603, %2602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2604) : (i64) -> ()
      %2605 = func.call @stack_pop_pointer() : () -> i64
      %2606 = func.call @stack_pop_pointer() : () -> i64
      %2607 = func.call @cc_cons(%2606, %2605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2607) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2608 = func.call @stack_pop_pointer() : () -> i64
      %2609 = func.call @stack_pop_pointer() : () -> i64
      %2610 = func.call @cc_cons(%2609, %2608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2610) : (i64) -> ()
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = func.call @stack_pop_pointer() : () -> i64
      %2613 = func.call @cc_cons(%2612, %2611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2613) : (i64) -> ()
      %2614 = func.call @stack_pop_pointer() : () -> i64
      %2615 = func.call @stack_pop_pointer() : () -> i64
      %2616 = func.call @cc_cons(%2615, %2614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2616) : (i64) -> ()
      %2617 = func.call @stack_pop_pointer() : () -> i64
      %2618 = func.call @stack_pop_pointer() : () -> i64
      %2619 = func.call @cc_cons(%2617, %2618) : (i64, i64) -> i64
      %2620 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2621 = arith.constant 5 : i64
      %2622 = func.call @cc_make_string(%2620, %2621) : (!llvm.ptr, i64) -> i64
      %2623 = func.call @cc_nil_value() : () -> i64
      %2624 = func.call @cc_intern(%2622, %2623) : (i64, i64) -> i64
      %2625 = func.call @cc_nil_value() : () -> i64
      %2626 = func.call @cc_cons(%2624, %2625) : (i64, i64) -> i64
      %2627 = func.call @cc_values_pack(%2626) : (i64) -> i64
      %2628 = func.call @cc_cons(%2624, %2619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2628) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @stack_pop_pointer() : () -> i64
      %2631 = func.call @cc_cons(%2630, %2629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2631) : (i64) -> ()
      %2632 = func.call @stack_pop_pointer() : () -> i64
      %2633 = func.call @stack_pop_pointer() : () -> i64
      %2634 = func.call @cc_cons(%2633, %2632) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2634) : (i64) -> ()
      %2635 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2635) : (i64) -> ()
      %2636 = arith.constant 19 : i64
      func.call @stack_push_fixnum(%2636) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2637 = func.call @stack_pop_pointer() : () -> i64
      %2638 = func.call @stack_pop_pointer() : () -> i64
      %2639 = func.call @cc_cons(%2638, %2637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2639) : (i64) -> ()
      %2640 = func.call @stack_pop_pointer() : () -> i64
      %2641 = func.call @stack_pop_pointer() : () -> i64
      %2642 = func.call @cc_cons(%2641, %2640) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2642) : (i64) -> ()
      %2643 = func.call @stack_pop_pointer() : () -> i64
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @cc_cons(%2644, %2643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2645) : (i64) -> ()
      %2646 = func.call @stack_pop_pointer() : () -> i64
      %2647 = func.call @stack_pop_pointer() : () -> i64
      %2648 = func.call @cc_cons(%2647, %2646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2648) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2649 = func.call @stack_pop_pointer() : () -> i64
      %2650 = func.call @stack_pop_pointer() : () -> i64
      %2651 = func.call @cc_cons(%2650, %2649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2651) : (i64) -> ()
      %2652 = func.call @stack_pop_pointer() : () -> i64
      %2653 = func.call @stack_pop_pointer() : () -> i64
      %2654 = func.call @cc_cons(%2653, %2652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2654) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2655 = func.call @stack_pop_pointer() : () -> i64
      %2656 = func.call @stack_pop_pointer() : () -> i64
      %2657 = func.call @cc_cons(%2656, %2655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2657) : (i64) -> ()
      %2658 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2659 = arith.constant 19 : i64
      %2660 = func.call @cc_make_string(%2658, %2659) : (!llvm.ptr, i64) -> i64
      %2661 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2662 = arith.constant 11 : i64
      %2663 = func.call @cc_make_string(%2661, %2662) : (!llvm.ptr, i64) -> i64
      %2664 = func.call @cc_intern(%2660, %2663) : (i64, i64) -> i64
      %2665 = func.call @cc_nil_value() : () -> i64
      %2666 = func.call @cc_cons(%2664, %2665) : (i64, i64) -> i64
      %2667 = func.call @cc_values_pack(%2666) : (i64) -> i64
      func.call @stack_push_pointer(%2664) : (i64) -> ()
      %2668 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2669 = arith.constant 1 : i64
      %2670 = func.call @cc_make_string(%2668, %2669) : (!llvm.ptr, i64) -> i64
      %2671 = func.call @cc_nil_value() : () -> i64
      %2672 = func.call @cc_intern(%2670, %2671) : (i64, i64) -> i64
      %2673 = func.call @cc_nil_value() : () -> i64
      %2674 = func.call @cc_cons(%2672, %2673) : (i64, i64) -> i64
      %2675 = func.call @cc_values_pack(%2674) : (i64) -> i64
      func.call @stack_push_pointer(%2672) : (i64) -> ()
      %2676 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2677 = arith.constant 8 : i64
      %2678 = func.call @cc_make_string(%2676, %2677) : (!llvm.ptr, i64) -> i64
      %2679 = func.call @cc_nil_value() : () -> i64
      %2680 = func.call @cc_intern(%2678, %2679) : (i64, i64) -> i64
      %2681 = func.call @cc_nil_value() : () -> i64
      %2682 = func.call @cc_cons(%2680, %2681) : (i64, i64) -> i64
      %2683 = func.call @cc_values_pack(%2682) : (i64) -> i64
      func.call @stack_push_pointer(%2680) : (i64) -> ()
      %2684 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2685 = arith.constant 8 : i64
      %2686 = func.call @cc_make_string(%2684, %2685) : (!llvm.ptr, i64) -> i64
      %2687 = func.call @cc_nil_value() : () -> i64
      %2688 = func.call @cc_intern(%2686, %2687) : (i64, i64) -> i64
      %2689 = func.call @cc_nil_value() : () -> i64
      %2690 = func.call @cc_cons(%2688, %2689) : (i64, i64) -> i64
      %2691 = func.call @cc_values_pack(%2690) : (i64) -> i64
      func.call @stack_push_pointer(%2688) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2692 = func.call @stack_pop_pointer() : () -> i64
      %2693 = func.call @stack_pop_pointer() : () -> i64
      %2694 = func.call @cc_cons(%2693, %2692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2694) : (i64) -> ()
      %2695 = func.call @stack_pop_pointer() : () -> i64
      %2696 = func.call @stack_pop_pointer() : () -> i64
      %2697 = func.call @cc_cons(%2696, %2695) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2697) : (i64) -> ()
      %2698 = func.call @stack_pop_pointer() : () -> i64
      %2699 = func.call @stack_pop_pointer() : () -> i64
      %2700 = func.call @cc_cons(%2699, %2698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2700) : (i64) -> ()
      %2701 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2702 = arith.constant 7 : i64
      %2703 = func.call @cc_make_string(%2701, %2702) : (!llvm.ptr, i64) -> i64
      %2704 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2705 = arith.constant 11 : i64
      %2706 = func.call @cc_make_string(%2704, %2705) : (!llvm.ptr, i64) -> i64
      %2707 = func.call @cc_intern(%2703, %2706) : (i64, i64) -> i64
      %2708 = func.call @cc_nil_value() : () -> i64
      %2709 = func.call @cc_cons(%2707, %2708) : (i64, i64) -> i64
      %2710 = func.call @cc_values_pack(%2709) : (i64) -> i64
      func.call @stack_push_pointer(%2707) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2711 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2712 = arith.constant 1 : i64
      %2713 = func.call @cc_make_string(%2711, %2712) : (!llvm.ptr, i64) -> i64
      %2714 = func.call @cc_nil_value() : () -> i64
      %2715 = func.call @cc_intern(%2713, %2714) : (i64, i64) -> i64
      %2716 = func.call @cc_nil_value() : () -> i64
      %2717 = func.call @cc_cons(%2715, %2716) : (i64, i64) -> i64
      %2718 = func.call @cc_values_pack(%2717) : (i64) -> i64
      func.call @stack_push_pointer(%2715) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2719 = func.call @stack_pop_pointer() : () -> i64
      %2720 = func.call @stack_pop_pointer() : () -> i64
      %2721 = func.call @cc_cons(%2720, %2719) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2721) : (i64) -> ()
      %2722 = func.call @stack_pop_pointer() : () -> i64
      %2723 = func.call @stack_pop_pointer() : () -> i64
      %2724 = func.call @cc_cons(%2723, %2722) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2724) : (i64) -> ()
      %2725 = func.call @stack_pop_pointer() : () -> i64
      %2726 = func.call @stack_pop_pointer() : () -> i64
      %2727 = func.call @cc_cons(%2726, %2725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2727) : (i64) -> ()
      %2728 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2729 = arith.constant 6 : i64
      %2730 = func.call @cc_make_string(%2728, %2729) : (!llvm.ptr, i64) -> i64
      %2731 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2732 = arith.constant 11 : i64
      %2733 = func.call @cc_make_string(%2731, %2732) : (!llvm.ptr, i64) -> i64
      %2734 = func.call @cc_intern(%2730, %2733) : (i64, i64) -> i64
      %2735 = func.call @cc_nil_value() : () -> i64
      %2736 = func.call @cc_cons(%2734, %2735) : (i64, i64) -> i64
      %2737 = func.call @cc_values_pack(%2736) : (i64) -> i64
      func.call @stack_push_pointer(%2734) : (i64) -> ()
      %2738 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2739 = arith.constant 7 : i64
      %2740 = func.call @cc_make_string(%2738, %2739) : (!llvm.ptr, i64) -> i64
      %2741 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2742 = arith.constant 11 : i64
      %2743 = func.call @cc_make_string(%2741, %2742) : (!llvm.ptr, i64) -> i64
      %2744 = func.call @cc_intern(%2740, %2743) : (i64, i64) -> i64
      %2745 = func.call @cc_nil_value() : () -> i64
      %2746 = func.call @cc_cons(%2744, %2745) : (i64, i64) -> i64
      %2747 = func.call @cc_values_pack(%2746) : (i64) -> i64
      func.call @stack_push_pointer(%2744) : (i64) -> ()
      %2748 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2749 = arith.constant 1 : i64
      %2750 = func.call @cc_make_string(%2748, %2749) : (!llvm.ptr, i64) -> i64
      %2751 = func.call @cc_nil_value() : () -> i64
      %2752 = func.call @cc_intern(%2750, %2751) : (i64, i64) -> i64
      %2753 = func.call @cc_nil_value() : () -> i64
      %2754 = func.call @cc_cons(%2752, %2753) : (i64, i64) -> i64
      %2755 = func.call @cc_values_pack(%2754) : (i64) -> i64
      func.call @stack_push_pointer(%2752) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2756 = func.call @stack_pop_pointer() : () -> i64
      %2757 = func.call @stack_pop_pointer() : () -> i64
      %2758 = func.call @cc_cons(%2757, %2756) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2758) : (i64) -> ()
      %2759 = func.call @stack_pop_pointer() : () -> i64
      %2760 = func.call @stack_pop_pointer() : () -> i64
      %2761 = func.call @cc_cons(%2760, %2759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2761) : (i64) -> ()
      %2762 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2763 = arith.constant 8 : i64
      %2764 = func.call @cc_make_string(%2762, %2763) : (!llvm.ptr, i64) -> i64
      %2765 = func.call @cc_nil_value() : () -> i64
      %2766 = func.call @cc_intern(%2764, %2765) : (i64, i64) -> i64
      %2767 = func.call @cc_nil_value() : () -> i64
      %2768 = func.call @cc_cons(%2766, %2767) : (i64, i64) -> i64
      %2769 = func.call @cc_values_pack(%2768) : (i64) -> i64
      func.call @stack_push_pointer(%2766) : (i64) -> ()
      %2770 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2771 = arith.constant 8 : i64
      %2772 = func.call @cc_make_string(%2770, %2771) : (!llvm.ptr, i64) -> i64
      %2773 = func.call @cc_nil_value() : () -> i64
      %2774 = func.call @cc_intern(%2772, %2773) : (i64, i64) -> i64
      %2775 = func.call @cc_nil_value() : () -> i64
      %2776 = func.call @cc_cons(%2774, %2775) : (i64, i64) -> i64
      %2777 = func.call @cc_values_pack(%2776) : (i64) -> i64
      func.call @stack_push_pointer(%2774) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2778 = func.call @stack_pop_pointer() : () -> i64
      %2779 = func.call @stack_pop_pointer() : () -> i64
      %2780 = func.call @cc_cons(%2779, %2778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2780) : (i64) -> ()
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
      func.call @stack_push_nil() : () -> ()
      %2790 = func.call @stack_pop_pointer() : () -> i64
      %2791 = func.call @stack_pop_pointer() : () -> i64
      %2792 = func.call @cc_cons(%2791, %2790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2792) : (i64) -> ()
      %2793 = func.call @stack_pop_pointer() : () -> i64
      %2794 = func.call @stack_pop_pointer() : () -> i64
      %2795 = func.call @cc_cons(%2794, %2793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2795) : (i64) -> ()
      %2796 = func.call @stack_pop_pointer() : () -> i64
      %2797 = func.call @stack_pop_pointer() : () -> i64
      %2798 = func.call @cc_cons(%2797, %2796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2798) : (i64) -> ()
      %2799 = func.call @stack_pop_pointer() : () -> i64
      %2800 = func.call @stack_pop_pointer() : () -> i64
      %2801 = func.call @cc_cons(%2800, %2799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2801) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %2811 = func.call @stack_pop_pointer() : () -> i64
      %2900 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2901 = arith.constant 30 : i64
      %2902 = func.call @cc_make_symbol(%2900, %2901) : (!llvm.ptr, i64) -> i64
      %2903 = func.call @cc_persistent_root_value(%2902) : (i64) -> i64
      func.call @stack_push_pointer(%2903) : (i64) -> ()
      %2904 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2905 = arith.constant 37 : i64
      %2906 = func.call @cc_make_symbol(%2904, %2905) : (!llvm.ptr, i64) -> i64
      %2907 = func.call @cc_persistent_root_value(%2906) : (i64) -> i64
      func.call @stack_push_pointer(%2907) : (i64) -> ()
      %2908 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2909 = arith.constant 37 : i64
      %2910 = func.call @cc_make_symbol(%2908, %2909) : (!llvm.ptr, i64) -> i64
      %2911 = func.call @cc_persistent_root_value(%2910) : (i64) -> i64
      func.call @stack_push_pointer(%2911) : (i64) -> ()
      %2912 = arith.constant 275462358040604 : i64
      %2913 = arith.constant 3 : i64
      %2914 = func.call @cc_make_closure(%2912, %2913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2914) : (i64) -> ()
      %2915 = func.call @stack_pop_pointer() : () -> i64
      %2916 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2916) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2917 = func.call @stack_pop_pointer() : () -> i64
      %2918 = func.call @stack_pop_pointer() : () -> i64
      %2919 = func.call @cc_cons(%2918, %2917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2919) : (i64) -> ()
      %2920 = func.call @stack_pop_pointer() : () -> i64
      %2921 = func.call @stack_pop_pointer() : () -> i64
      %2922 = func.call @cc_cons(%2921, %2920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2922) : (i64) -> ()
      %2923 = func.call @stack_pop_pointer() : () -> i64
      %2924 = func.call @stack_pop_pointer() : () -> i64
      %2925 = func.call @cc_cons(%2924, %2923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2925) : (i64) -> ()
      %2926 = func.call @stack_pop_pointer() : () -> i64
      %2927 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2928 = arith.constant 11 : i64
      %2929 = func.call @cc_make_string(%2927, %2928) : (!llvm.ptr, i64) -> i64
      %2930 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2931 = arith.constant 7 : i64
      %2932 = func.call @cc_make_string(%2930, %2931) : (!llvm.ptr, i64) -> i64
      %2933 = func.call @cc_intern(%2929, %2932) : (i64, i64) -> i64
      %2934 = func.call @cc_nil_value() : () -> i64
      %2935 = func.call @cc_cons(%2933, %2934) : (i64, i64) -> i64
      %2936 = func.call @cc_values_pack(%2935) : (i64) -> i64
      func.call @stack_push_pointer(%2933) : (i64) -> ()
      %2937 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2938 = func.call @stack_pop_pointer() : () -> i64
      %2939 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2940 = arith.constant 4 : i64
      %2941 = func.call @cc_make_string(%2939, %2940) : (!llvm.ptr, i64) -> i64
      %2942 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2943 = arith.constant 7 : i64
      %2944 = func.call @cc_make_string(%2942, %2943) : (!llvm.ptr, i64) -> i64
      %2945 = func.call @cc_intern(%2941, %2944) : (i64, i64) -> i64
      %2946 = func.call @cc_nil_value() : () -> i64
      %2947 = func.call @cc_cons(%2945, %2946) : (i64, i64) -> i64
      %2948 = func.call @cc_values_pack(%2947) : (i64) -> i64
      func.call @stack_push_pointer(%2945) : (i64) -> ()
      %2949 = func.call @stack_pop_pointer() : () -> i64
      %2950 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2951 = arith.constant 6 : i64
      %2952 = func.call @cc_make_string(%2950, %2951) : (!llvm.ptr, i64) -> i64
      %2953 = func.call @cc_nil_value() : () -> i64
      %2954 = func.call @cc_intern(%2952, %2953) : (i64, i64) -> i64
      %2955 = func.call @cc_nil_value() : () -> i64
      %2956 = func.call @cc_cons(%2954, %2955) : (i64, i64) -> i64
      %2957 = func.call @cc_values_pack(%2956) : (i64) -> i64
      func.call @stack_push_pointer(%2954) : (i64) -> ()
      %2958 = func.call @stack_pop_pointer() : () -> i64
      %2959 = func.call @cc_nil_value() : () -> i64
      %2960 = func.call @cc_errorp(%2473) : (i64) -> i64
      %2961 = arith.cmpi ne, %2960, %2959 : i64
      %2962 = arith.cmpi eq, %2959, %2959 : i64
      %2963 = arith.andi %2961, %2962 : i1
      %2964 = scf.if %2963 -> (i64) {
        scf.yield %2473 : i64
      } else {
        scf.yield %2959 : i64
      }
      %2965 = func.call @cc_errorp(%2811) : (i64) -> i64
      %2966 = arith.cmpi ne, %2965, %2959 : i64
      %2967 = arith.cmpi eq, %2964, %2959 : i64
      %2968 = arith.andi %2966, %2967 : i1
      %2969 = scf.if %2968 -> (i64) {
        scf.yield %2811 : i64
      } else {
        scf.yield %2964 : i64
      }
      %2970 = func.call @cc_errorp(%2915) : (i64) -> i64
      %2971 = arith.cmpi ne, %2970, %2959 : i64
      %2972 = arith.cmpi eq, %2969, %2959 : i64
      %2973 = arith.andi %2971, %2972 : i1
      %2974 = scf.if %2973 -> (i64) {
        scf.yield %2915 : i64
      } else {
        scf.yield %2969 : i64
      }
      %2975 = func.call @cc_errorp(%2926) : (i64) -> i64
      %2976 = arith.cmpi ne, %2975, %2959 : i64
      %2977 = arith.cmpi eq, %2974, %2959 : i64
      %2978 = arith.andi %2976, %2977 : i1
      %2979 = scf.if %2978 -> (i64) {
        scf.yield %2926 : i64
      } else {
        scf.yield %2974 : i64
      }
      %2980 = func.call @cc_errorp(%2937) : (i64) -> i64
      %2981 = arith.cmpi ne, %2980, %2959 : i64
      %2982 = arith.cmpi eq, %2979, %2959 : i64
      %2983 = arith.andi %2981, %2982 : i1
      %2984 = scf.if %2983 -> (i64) {
        scf.yield %2937 : i64
      } else {
        scf.yield %2979 : i64
      }
      %2985 = func.call @cc_errorp(%2938) : (i64) -> i64
      %2986 = arith.cmpi ne, %2985, %2959 : i64
      %2987 = arith.cmpi eq, %2984, %2959 : i64
      %2988 = arith.andi %2986, %2987 : i1
      %2989 = scf.if %2988 -> (i64) {
        scf.yield %2938 : i64
      } else {
        scf.yield %2984 : i64
      }
      %2990 = func.call @cc_errorp(%2949) : (i64) -> i64
      %2991 = arith.cmpi ne, %2990, %2959 : i64
      %2992 = arith.cmpi eq, %2989, %2959 : i64
      %2993 = arith.andi %2991, %2992 : i1
      %2994 = scf.if %2993 -> (i64) {
        scf.yield %2949 : i64
      } else {
        scf.yield %2989 : i64
      }
      %2995 = func.call @cc_errorp(%2958) : (i64) -> i64
      %2996 = arith.cmpi ne, %2995, %2959 : i64
      %2997 = arith.cmpi eq, %2994, %2959 : i64
      %2998 = arith.andi %2996, %2997 : i1
      %2999 = scf.if %2998 -> (i64) {
        scf.yield %2958 : i64
      } else {
        scf.yield %2994 : i64
      }
      %3000 = arith.cmpi ne, %2999, %2959 : i64
      scf.if %3000 {
        func.call @stack_push_pointer(%2999) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2473) : (i64) -> ()
        func.call @stack_push_pointer(%2811) : (i64) -> ()
        func.call @stack_push_pointer(%2915) : (i64) -> ()
        func.call @stack_push_pointer(%2926) : (i64) -> ()
        func.call @stack_push_pointer(%2937) : (i64) -> ()
        func.call @stack_push_pointer(%2938) : (i64) -> ()
        func.call @stack_push_pointer(%2949) : (i64) -> ()
        func.call @stack_push_pointer(%2958) : (i64) -> ()
        %3001 = llvm.mlir.addressof @str234 : !llvm.ptr
        %3002 = func.call @cc_make_function_ref_const(%3001) : (!llvm.ptr) -> i64
        %3003 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3002, %3003) : (i64, i64) -> ()
      }
      %3004 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3004 : i64
    }
    %3005 = func.call @cc_nil_value() : () -> i64
    %3006 = func.call @cc_errorp(%2464) : (i64) -> i64
    %3007 = arith.cmpi ne, %3006, %3005 : i64
    %3008 = scf.if %3007 -> (i64) {
      scf.yield %2464 : i64
    } else {
      %3009 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3010 = arith.constant 9 : i64
      %3011 = func.call @cc_make_string(%3009, %3010) : (!llvm.ptr, i64) -> i64
      %3012 = func.call @cc_nil_value() : () -> i64
      %3013 = func.call @cc_intern(%3011, %3012) : (i64, i64) -> i64
      %3014 = func.call @cc_nil_value() : () -> i64
      %3015 = func.call @cc_cons(%3013, %3014) : (i64, i64) -> i64
      %3016 = func.call @cc_values_pack(%3015) : (i64) -> i64
      func.call @stack_push_pointer(%3013) : (i64) -> ()
      %3017 = func.call @stack_pop_pointer() : () -> i64
      %3018 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3019 = arith.constant 19 : i64
      %3020 = func.call @cc_make_string(%3018, %3019) : (!llvm.ptr, i64) -> i64
      %3021 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3022 = arith.constant 11 : i64
      %3023 = func.call @cc_make_string(%3021, %3022) : (!llvm.ptr, i64) -> i64
      %3024 = func.call @cc_intern(%3020, %3023) : (i64, i64) -> i64
      %3025 = func.call @cc_nil_value() : () -> i64
      %3026 = func.call @cc_cons(%3024, %3025) : (i64, i64) -> i64
      %3027 = func.call @cc_values_pack(%3026) : (i64) -> i64
      func.call @stack_push_pointer(%3024) : (i64) -> ()
      %3028 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3029 = arith.constant 1 : i64
      %3030 = func.call @cc_make_string(%3028, %3029) : (!llvm.ptr, i64) -> i64
      %3031 = func.call @cc_nil_value() : () -> i64
      %3032 = func.call @cc_intern(%3030, %3031) : (i64, i64) -> i64
      %3033 = func.call @cc_nil_value() : () -> i64
      %3034 = func.call @cc_cons(%3032, %3033) : (i64, i64) -> i64
      %3035 = func.call @cc_values_pack(%3034) : (i64) -> i64
      func.call @stack_push_pointer(%3032) : (i64) -> ()
      %3036 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3037 = arith.constant 9 : i64
      %3038 = func.call @cc_make_string(%3036, %3037) : (!llvm.ptr, i64) -> i64
      %3039 = func.call @cc_nil_value() : () -> i64
      %3040 = func.call @cc_intern(%3038, %3039) : (i64, i64) -> i64
      %3041 = func.call @cc_nil_value() : () -> i64
      %3042 = func.call @cc_cons(%3040, %3041) : (i64, i64) -> i64
      %3043 = func.call @cc_values_pack(%3042) : (i64) -> i64
      func.call @stack_push_pointer(%3040) : (i64) -> ()
      %3044 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3045 = arith.constant 8 : i64
      %3046 = func.call @cc_make_string(%3044, %3045) : (!llvm.ptr, i64) -> i64
      %3047 = func.call @cc_nil_value() : () -> i64
      %3048 = func.call @cc_intern(%3046, %3047) : (i64, i64) -> i64
      %3049 = func.call @cc_nil_value() : () -> i64
      %3050 = func.call @cc_cons(%3048, %3049) : (i64, i64) -> i64
      %3051 = func.call @cc_values_pack(%3050) : (i64) -> i64
      func.call @stack_push_pointer(%3048) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3052 = func.call @stack_pop_pointer() : () -> i64
      %3053 = func.call @stack_pop_pointer() : () -> i64
      %3054 = func.call @cc_cons(%3053, %3052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3054) : (i64) -> ()
      %3055 = func.call @stack_pop_pointer() : () -> i64
      %3056 = func.call @stack_pop_pointer() : () -> i64
      %3057 = func.call @cc_cons(%3056, %3055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3057) : (i64) -> ()
      %3058 = func.call @stack_pop_pointer() : () -> i64
      %3059 = func.call @stack_pop_pointer() : () -> i64
      %3060 = func.call @cc_cons(%3059, %3058) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3060) : (i64) -> ()
      %3061 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3062 = arith.constant 7 : i64
      %3063 = func.call @cc_make_string(%3061, %3062) : (!llvm.ptr, i64) -> i64
      %3064 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3065 = arith.constant 11 : i64
      %3066 = func.call @cc_make_string(%3064, %3065) : (!llvm.ptr, i64) -> i64
      %3067 = func.call @cc_intern(%3063, %3066) : (i64, i64) -> i64
      %3068 = func.call @cc_nil_value() : () -> i64
      %3069 = func.call @cc_cons(%3067, %3068) : (i64, i64) -> i64
      %3070 = func.call @cc_values_pack(%3069) : (i64) -> i64
      func.call @stack_push_pointer(%3067) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3071 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3072 = arith.constant 11 : i64
      %3073 = func.call @cc_make_string(%3071, %3072) : (!llvm.ptr, i64) -> i64
      %3074 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3075 = arith.constant 3 : i64
      %3076 = func.call @cc_make_string(%3074, %3075) : (!llvm.ptr, i64) -> i64
      %3077 = func.call @cc_intern(%3073, %3076) : (i64, i64) -> i64
      %3078 = func.call @cc_nil_value() : () -> i64
      %3079 = func.call @cc_cons(%3077, %3078) : (i64, i64) -> i64
      %3080 = func.call @cc_values_pack(%3079) : (i64) -> i64
      func.call @stack_push_pointer(%3077) : (i64) -> ()
      %3081 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3081) : (i64) -> ()
      %3082 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3083 = arith.constant 6 : i64
      %3084 = func.call @cc_make_string(%3082, %3083) : (!llvm.ptr, i64) -> i64
      %3085 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3086 = arith.constant 11 : i64
      %3087 = func.call @cc_make_string(%3085, %3086) : (!llvm.ptr, i64) -> i64
      %3088 = func.call @cc_intern(%3084, %3087) : (i64, i64) -> i64
      %3089 = func.call @cc_nil_value() : () -> i64
      %3090 = func.call @cc_cons(%3088, %3089) : (i64, i64) -> i64
      %3091 = func.call @cc_values_pack(%3090) : (i64) -> i64
      func.call @stack_push_pointer(%3088) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3092 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3093 = arith.constant 15 : i64
      %3094 = func.call @cc_make_string(%3092, %3093) : (!llvm.ptr, i64) -> i64
      %3095 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3096 = arith.constant 11 : i64
      %3097 = func.call @cc_make_string(%3095, %3096) : (!llvm.ptr, i64) -> i64
      %3098 = func.call @cc_intern(%3094, %3097) : (i64, i64) -> i64
      %3099 = func.call @cc_nil_value() : () -> i64
      %3100 = func.call @cc_cons(%3098, %3099) : (i64, i64) -> i64
      %3101 = func.call @cc_values_pack(%3100) : (i64) -> i64
      func.call @stack_push_pointer(%3098) : (i64) -> ()
      %3102 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3103 = arith.constant 1 : i64
      %3104 = func.call @cc_make_string(%3102, %3103) : (!llvm.ptr, i64) -> i64
      %3105 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3106 = arith.constant 11 : i64
      %3107 = func.call @cc_make_string(%3105, %3106) : (!llvm.ptr, i64) -> i64
      %3108 = func.call @cc_intern(%3104, %3107) : (i64, i64) -> i64
      %3109 = func.call @cc_nil_value() : () -> i64
      %3110 = func.call @cc_cons(%3108, %3109) : (i64, i64) -> i64
      %3111 = func.call @cc_values_pack(%3110) : (i64) -> i64
      func.call @stack_push_pointer(%3108) : (i64) -> ()
      %3112 = arith.constant 189 : i64
      func.call @stack_push_fixnum(%3112) : (i64) -> ()
      %3113 = arith.constant 911 : i64
      func.call @stack_push_fixnum(%3113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3114 = func.call @stack_pop_pointer() : () -> i64
      %3115 = func.call @stack_pop_pointer() : () -> i64
      %3116 = func.call @cc_cons(%3115, %3114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3116) : (i64) -> ()
      %3117 = func.call @stack_pop_pointer() : () -> i64
      %3118 = func.call @stack_pop_pointer() : () -> i64
      %3119 = func.call @cc_cons(%3118, %3117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3119) : (i64) -> ()
      %3120 = func.call @stack_pop_pointer() : () -> i64
      %3121 = func.call @stack_pop_pointer() : () -> i64
      %3122 = func.call @cc_cons(%3121, %3120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3122) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3123 = func.call @stack_pop_pointer() : () -> i64
      %3124 = func.call @stack_pop_pointer() : () -> i64
      %3125 = func.call @cc_cons(%3124, %3123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3125) : (i64) -> ()
      %3126 = func.call @stack_pop_pointer() : () -> i64
      %3127 = func.call @stack_pop_pointer() : () -> i64
      %3128 = func.call @cc_cons(%3127, %3126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3129 = func.call @stack_pop_pointer() : () -> i64
      %3130 = func.call @stack_pop_pointer() : () -> i64
      %3131 = func.call @cc_cons(%3130, %3129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3131) : (i64) -> ()
      %3132 = func.call @stack_pop_pointer() : () -> i64
      %3133 = func.call @stack_pop_pointer() : () -> i64
      %3134 = func.call @cc_cons(%3133, %3132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3134) : (i64) -> ()
      %3135 = func.call @stack_pop_pointer() : () -> i64
      %3136 = func.call @stack_pop_pointer() : () -> i64
      %3137 = func.call @cc_cons(%3136, %3135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3137) : (i64) -> ()
      %3138 = func.call @stack_pop_pointer() : () -> i64
      %3139 = func.call @stack_pop_pointer() : () -> i64
      %3140 = func.call @cc_cons(%3138, %3139) : (i64, i64) -> i64
      %3141 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3142 = arith.constant 5 : i64
      %3143 = func.call @cc_make_string(%3141, %3142) : (!llvm.ptr, i64) -> i64
      %3144 = func.call @cc_nil_value() : () -> i64
      %3145 = func.call @cc_intern(%3143, %3144) : (i64, i64) -> i64
      %3146 = func.call @cc_nil_value() : () -> i64
      %3147 = func.call @cc_cons(%3145, %3146) : (i64, i64) -> i64
      %3148 = func.call @cc_values_pack(%3147) : (i64) -> i64
      %3149 = func.call @cc_cons(%3145, %3140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3150 = func.call @stack_pop_pointer() : () -> i64
      %3151 = func.call @stack_pop_pointer() : () -> i64
      %3152 = func.call @cc_cons(%3151, %3150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3152) : (i64) -> ()
      %3153 = func.call @stack_pop_pointer() : () -> i64
      %3154 = func.call @stack_pop_pointer() : () -> i64
      %3155 = func.call @cc_cons(%3154, %3153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3156 = func.call @stack_pop_pointer() : () -> i64
      %3157 = func.call @stack_pop_pointer() : () -> i64
      %3158 = func.call @cc_cons(%3157, %3156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3158) : (i64) -> ()
      %3159 = func.call @stack_pop_pointer() : () -> i64
      %3160 = func.call @stack_pop_pointer() : () -> i64
      %3161 = func.call @cc_cons(%3160, %3159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3161) : (i64) -> ()
      %3162 = func.call @stack_pop_pointer() : () -> i64
      %3163 = func.call @stack_pop_pointer() : () -> i64
      %3164 = func.call @cc_cons(%3163, %3162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3164) : (i64) -> ()
      %3165 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3166 = arith.constant 6 : i64
      %3167 = func.call @cc_make_string(%3165, %3166) : (!llvm.ptr, i64) -> i64
      %3168 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3169 = arith.constant 11 : i64
      %3170 = func.call @cc_make_string(%3168, %3169) : (!llvm.ptr, i64) -> i64
      %3171 = func.call @cc_intern(%3167, %3170) : (i64, i64) -> i64
      %3172 = func.call @cc_nil_value() : () -> i64
      %3173 = func.call @cc_cons(%3171, %3172) : (i64, i64) -> i64
      %3174 = func.call @cc_values_pack(%3173) : (i64) -> i64
      func.call @stack_push_pointer(%3171) : (i64) -> ()
      %3175 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3176 = arith.constant 7 : i64
      %3177 = func.call @cc_make_string(%3175, %3176) : (!llvm.ptr, i64) -> i64
      %3178 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3179 = arith.constant 11 : i64
      %3180 = func.call @cc_make_string(%3178, %3179) : (!llvm.ptr, i64) -> i64
      %3181 = func.call @cc_intern(%3177, %3180) : (i64, i64) -> i64
      %3182 = func.call @cc_nil_value() : () -> i64
      %3183 = func.call @cc_cons(%3181, %3182) : (i64, i64) -> i64
      %3184 = func.call @cc_values_pack(%3183) : (i64) -> i64
      func.call @stack_push_pointer(%3181) : (i64) -> ()
      %3185 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3186 = arith.constant 1 : i64
      %3187 = func.call @cc_make_string(%3185, %3186) : (!llvm.ptr, i64) -> i64
      %3188 = func.call @cc_nil_value() : () -> i64
      %3189 = func.call @cc_intern(%3187, %3188) : (i64, i64) -> i64
      %3190 = func.call @cc_nil_value() : () -> i64
      %3191 = func.call @cc_cons(%3189, %3190) : (i64, i64) -> i64
      %3192 = func.call @cc_values_pack(%3191) : (i64) -> i64
      func.call @stack_push_pointer(%3189) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3193 = func.call @stack_pop_pointer() : () -> i64
      %3194 = func.call @stack_pop_pointer() : () -> i64
      %3195 = func.call @cc_cons(%3194, %3193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3195) : (i64) -> ()
      %3196 = func.call @stack_pop_pointer() : () -> i64
      %3197 = func.call @stack_pop_pointer() : () -> i64
      %3198 = func.call @cc_cons(%3197, %3196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3198) : (i64) -> ()
      %3199 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3200 = arith.constant 9 : i64
      %3201 = func.call @cc_make_string(%3199, %3200) : (!llvm.ptr, i64) -> i64
      %3202 = func.call @cc_nil_value() : () -> i64
      %3203 = func.call @cc_intern(%3201, %3202) : (i64, i64) -> i64
      %3204 = func.call @cc_nil_value() : () -> i64
      %3205 = func.call @cc_cons(%3203, %3204) : (i64, i64) -> i64
      %3206 = func.call @cc_values_pack(%3205) : (i64) -> i64
      func.call @stack_push_pointer(%3203) : (i64) -> ()
      %3207 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3208 = arith.constant 8 : i64
      %3209 = func.call @cc_make_string(%3207, %3208) : (!llvm.ptr, i64) -> i64
      %3210 = func.call @cc_nil_value() : () -> i64
      %3211 = func.call @cc_intern(%3209, %3210) : (i64, i64) -> i64
      %3212 = func.call @cc_nil_value() : () -> i64
      %3213 = func.call @cc_cons(%3211, %3212) : (i64, i64) -> i64
      %3214 = func.call @cc_values_pack(%3213) : (i64) -> i64
      func.call @stack_push_pointer(%3211) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3215 = func.call @stack_pop_pointer() : () -> i64
      %3216 = func.call @stack_pop_pointer() : () -> i64
      %3217 = func.call @cc_cons(%3216, %3215) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3217) : (i64) -> ()
      %3218 = func.call @stack_pop_pointer() : () -> i64
      %3219 = func.call @stack_pop_pointer() : () -> i64
      %3220 = func.call @cc_cons(%3219, %3218) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3220) : (i64) -> ()
      %3221 = func.call @stack_pop_pointer() : () -> i64
      %3222 = func.call @stack_pop_pointer() : () -> i64
      %3223 = func.call @cc_cons(%3222, %3221) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3223) : (i64) -> ()
      %3224 = func.call @stack_pop_pointer() : () -> i64
      %3225 = func.call @stack_pop_pointer() : () -> i64
      %3226 = func.call @cc_cons(%3225, %3224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3226) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3227 = func.call @stack_pop_pointer() : () -> i64
      %3228 = func.call @stack_pop_pointer() : () -> i64
      %3229 = func.call @cc_cons(%3228, %3227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3229) : (i64) -> ()
      %3230 = func.call @stack_pop_pointer() : () -> i64
      %3231 = func.call @stack_pop_pointer() : () -> i64
      %3232 = func.call @cc_cons(%3231, %3230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3232) : (i64) -> ()
      %3233 = func.call @stack_pop_pointer() : () -> i64
      %3234 = func.call @stack_pop_pointer() : () -> i64
      %3235 = func.call @cc_cons(%3234, %3233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3235) : (i64) -> ()
      %3236 = func.call @stack_pop_pointer() : () -> i64
      %3237 = func.call @stack_pop_pointer() : () -> i64
      %3238 = func.call @cc_cons(%3237, %3236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3238) : (i64) -> ()
      %3239 = func.call @stack_pop_pointer() : () -> i64
      %3329 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3330 = arith.constant 30 : i64
      %3331 = func.call @cc_make_symbol(%3329, %3330) : (!llvm.ptr, i64) -> i64
      %3332 = func.call @cc_persistent_root_value(%3331) : (i64) -> i64
      func.call @stack_push_pointer(%3332) : (i64) -> ()
      %3333 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3334 = arith.constant 37 : i64
      %3335 = func.call @cc_make_symbol(%3333, %3334) : (!llvm.ptr, i64) -> i64
      %3336 = func.call @cc_persistent_root_value(%3335) : (i64) -> i64
      func.call @stack_push_pointer(%3336) : (i64) -> ()
      %3337 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3338 = arith.constant 38 : i64
      %3339 = func.call @cc_make_symbol(%3337, %3338) : (!llvm.ptr, i64) -> i64
      %3340 = func.call @cc_persistent_root_value(%3339) : (i64) -> i64
      func.call @stack_push_pointer(%3340) : (i64) -> ()
      %3341 = arith.constant 275462358040612 : i64
      %3342 = arith.constant 3 : i64
      %3343 = func.call @cc_make_closure(%3341, %3342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3343) : (i64) -> ()
      %3344 = func.call @stack_pop_pointer() : () -> i64
      %3345 = arith.constant 1100 : i64
      func.call @stack_push_fixnum(%3345) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3346 = func.call @stack_pop_pointer() : () -> i64
      %3347 = func.call @stack_pop_pointer() : () -> i64
      %3348 = func.call @cc_cons(%3347, %3346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3348) : (i64) -> ()
      %3349 = func.call @stack_pop_pointer() : () -> i64
      %3350 = func.call @stack_pop_pointer() : () -> i64
      %3351 = func.call @cc_cons(%3350, %3349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3351) : (i64) -> ()
      %3352 = func.call @stack_pop_pointer() : () -> i64
      %3353 = func.call @stack_pop_pointer() : () -> i64
      %3354 = func.call @cc_cons(%3353, %3352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3354) : (i64) -> ()
      %3355 = func.call @stack_pop_pointer() : () -> i64
      %3356 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3357 = arith.constant 11 : i64
      %3358 = func.call @cc_make_string(%3356, %3357) : (!llvm.ptr, i64) -> i64
      %3359 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3360 = arith.constant 7 : i64
      %3361 = func.call @cc_make_string(%3359, %3360) : (!llvm.ptr, i64) -> i64
      %3362 = func.call @cc_intern(%3358, %3361) : (i64, i64) -> i64
      %3363 = func.call @cc_nil_value() : () -> i64
      %3364 = func.call @cc_cons(%3362, %3363) : (i64, i64) -> i64
      %3365 = func.call @cc_values_pack(%3364) : (i64) -> i64
      func.call @stack_push_pointer(%3362) : (i64) -> ()
      %3366 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3367 = func.call @stack_pop_pointer() : () -> i64
      %3368 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3369 = arith.constant 4 : i64
      %3370 = func.call @cc_make_string(%3368, %3369) : (!llvm.ptr, i64) -> i64
      %3371 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3372 = arith.constant 7 : i64
      %3373 = func.call @cc_make_string(%3371, %3372) : (!llvm.ptr, i64) -> i64
      %3374 = func.call @cc_intern(%3370, %3373) : (i64, i64) -> i64
      %3375 = func.call @cc_nil_value() : () -> i64
      %3376 = func.call @cc_cons(%3374, %3375) : (i64, i64) -> i64
      %3377 = func.call @cc_values_pack(%3376) : (i64) -> i64
      func.call @stack_push_pointer(%3374) : (i64) -> ()
      %3378 = func.call @stack_pop_pointer() : () -> i64
      %3379 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3380 = arith.constant 6 : i64
      %3381 = func.call @cc_make_string(%3379, %3380) : (!llvm.ptr, i64) -> i64
      %3382 = func.call @cc_nil_value() : () -> i64
      %3383 = func.call @cc_intern(%3381, %3382) : (i64, i64) -> i64
      %3384 = func.call @cc_nil_value() : () -> i64
      %3385 = func.call @cc_cons(%3383, %3384) : (i64, i64) -> i64
      %3386 = func.call @cc_values_pack(%3385) : (i64) -> i64
      func.call @stack_push_pointer(%3383) : (i64) -> ()
      %3387 = func.call @stack_pop_pointer() : () -> i64
      %3388 = func.call @cc_nil_value() : () -> i64
      %3389 = func.call @cc_errorp(%3017) : (i64) -> i64
      %3390 = arith.cmpi ne, %3389, %3388 : i64
      %3391 = arith.cmpi eq, %3388, %3388 : i64
      %3392 = arith.andi %3390, %3391 : i1
      %3393 = scf.if %3392 -> (i64) {
        scf.yield %3017 : i64
      } else {
        scf.yield %3388 : i64
      }
      %3394 = func.call @cc_errorp(%3239) : (i64) -> i64
      %3395 = arith.cmpi ne, %3394, %3388 : i64
      %3396 = arith.cmpi eq, %3393, %3388 : i64
      %3397 = arith.andi %3395, %3396 : i1
      %3398 = scf.if %3397 -> (i64) {
        scf.yield %3239 : i64
      } else {
        scf.yield %3393 : i64
      }
      %3399 = func.call @cc_errorp(%3344) : (i64) -> i64
      %3400 = arith.cmpi ne, %3399, %3388 : i64
      %3401 = arith.cmpi eq, %3398, %3388 : i64
      %3402 = arith.andi %3400, %3401 : i1
      %3403 = scf.if %3402 -> (i64) {
        scf.yield %3344 : i64
      } else {
        scf.yield %3398 : i64
      }
      %3404 = func.call @cc_errorp(%3355) : (i64) -> i64
      %3405 = arith.cmpi ne, %3404, %3388 : i64
      %3406 = arith.cmpi eq, %3403, %3388 : i64
      %3407 = arith.andi %3405, %3406 : i1
      %3408 = scf.if %3407 -> (i64) {
        scf.yield %3355 : i64
      } else {
        scf.yield %3403 : i64
      }
      %3409 = func.call @cc_errorp(%3366) : (i64) -> i64
      %3410 = arith.cmpi ne, %3409, %3388 : i64
      %3411 = arith.cmpi eq, %3408, %3388 : i64
      %3412 = arith.andi %3410, %3411 : i1
      %3413 = scf.if %3412 -> (i64) {
        scf.yield %3366 : i64
      } else {
        scf.yield %3408 : i64
      }
      %3414 = func.call @cc_errorp(%3367) : (i64) -> i64
      %3415 = arith.cmpi ne, %3414, %3388 : i64
      %3416 = arith.cmpi eq, %3413, %3388 : i64
      %3417 = arith.andi %3415, %3416 : i1
      %3418 = scf.if %3417 -> (i64) {
        scf.yield %3367 : i64
      } else {
        scf.yield %3413 : i64
      }
      %3419 = func.call @cc_errorp(%3378) : (i64) -> i64
      %3420 = arith.cmpi ne, %3419, %3388 : i64
      %3421 = arith.cmpi eq, %3418, %3388 : i64
      %3422 = arith.andi %3420, %3421 : i1
      %3423 = scf.if %3422 -> (i64) {
        scf.yield %3378 : i64
      } else {
        scf.yield %3418 : i64
      }
      %3424 = func.call @cc_errorp(%3387) : (i64) -> i64
      %3425 = arith.cmpi ne, %3424, %3388 : i64
      %3426 = arith.cmpi eq, %3423, %3388 : i64
      %3427 = arith.andi %3425, %3426 : i1
      %3428 = scf.if %3427 -> (i64) {
        scf.yield %3387 : i64
      } else {
        scf.yield %3423 : i64
      }
      %3429 = arith.cmpi ne, %3428, %3388 : i64
      scf.if %3429 {
        func.call @stack_push_pointer(%3428) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3017) : (i64) -> ()
        func.call @stack_push_pointer(%3239) : (i64) -> ()
        func.call @stack_push_pointer(%3344) : (i64) -> ()
        func.call @stack_push_pointer(%3355) : (i64) -> ()
        func.call @stack_push_pointer(%3366) : (i64) -> ()
        func.call @stack_push_pointer(%3367) : (i64) -> ()
        func.call @stack_push_pointer(%3378) : (i64) -> ()
        func.call @stack_push_pointer(%3387) : (i64) -> ()
        %3430 = llvm.mlir.addressof @str268 : !llvm.ptr
        %3431 = func.call @cc_make_function_ref_const(%3430) : (!llvm.ptr) -> i64
        %3432 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3431, %3432) : (i64, i64) -> ()
      }
      %3433 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3433 : i64
    }
    %3434 = func.call @cc_nil_value() : () -> i64
    %3435 = func.call @cc_errorp(%3008) : (i64) -> i64
    %3436 = arith.cmpi ne, %3435, %3434 : i64
    %3437 = scf.if %3436 -> (i64) {
      scf.yield %3008 : i64
    } else {
      %3438 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3439 = arith.constant 18 : i64
      %3440 = func.call @cc_make_string(%3438, %3439) : (!llvm.ptr, i64) -> i64
      %3441 = func.call @cc_nil_value() : () -> i64
      %3442 = func.call @cc_intern(%3440, %3441) : (i64, i64) -> i64
      %3443 = func.call @cc_nil_value() : () -> i64
      %3444 = func.call @cc_cons(%3442, %3443) : (i64, i64) -> i64
      %3445 = func.call @cc_values_pack(%3444) : (i64) -> i64
      func.call @stack_push_pointer(%3442) : (i64) -> ()
      %3446 = func.call @stack_pop_pointer() : () -> i64
      %3447 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3448 = arith.constant 19 : i64
      %3449 = func.call @cc_make_string(%3447, %3448) : (!llvm.ptr, i64) -> i64
      %3450 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3451 = arith.constant 11 : i64
      %3452 = func.call @cc_make_string(%3450, %3451) : (!llvm.ptr, i64) -> i64
      %3453 = func.call @cc_intern(%3449, %3452) : (i64, i64) -> i64
      %3454 = func.call @cc_nil_value() : () -> i64
      %3455 = func.call @cc_cons(%3453, %3454) : (i64, i64) -> i64
      %3456 = func.call @cc_values_pack(%3455) : (i64) -> i64
      func.call @stack_push_pointer(%3453) : (i64) -> ()
      %3457 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3458 = arith.constant 1 : i64
      %3459 = func.call @cc_make_string(%3457, %3458) : (!llvm.ptr, i64) -> i64
      %3460 = func.call @cc_nil_value() : () -> i64
      %3461 = func.call @cc_intern(%3459, %3460) : (i64, i64) -> i64
      %3462 = func.call @cc_nil_value() : () -> i64
      %3463 = func.call @cc_cons(%3461, %3462) : (i64, i64) -> i64
      %3464 = func.call @cc_values_pack(%3463) : (i64) -> i64
      func.call @stack_push_pointer(%3461) : (i64) -> ()
      %3465 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3466 = arith.constant 9 : i64
      %3467 = func.call @cc_make_string(%3465, %3466) : (!llvm.ptr, i64) -> i64
      %3468 = func.call @cc_nil_value() : () -> i64
      %3469 = func.call @cc_intern(%3467, %3468) : (i64, i64) -> i64
      %3470 = func.call @cc_nil_value() : () -> i64
      %3471 = func.call @cc_cons(%3469, %3470) : (i64, i64) -> i64
      %3472 = func.call @cc_values_pack(%3471) : (i64) -> i64
      func.call @stack_push_pointer(%3469) : (i64) -> ()
      %3473 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3474 = arith.constant 8 : i64
      %3475 = func.call @cc_make_string(%3473, %3474) : (!llvm.ptr, i64) -> i64
      %3476 = func.call @cc_nil_value() : () -> i64
      %3477 = func.call @cc_intern(%3475, %3476) : (i64, i64) -> i64
      %3478 = func.call @cc_nil_value() : () -> i64
      %3479 = func.call @cc_cons(%3477, %3478) : (i64, i64) -> i64
      %3480 = func.call @cc_values_pack(%3479) : (i64) -> i64
      func.call @stack_push_pointer(%3477) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3481 = func.call @stack_pop_pointer() : () -> i64
      %3482 = func.call @stack_pop_pointer() : () -> i64
      %3483 = func.call @cc_cons(%3482, %3481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3483) : (i64) -> ()
      %3484 = func.call @stack_pop_pointer() : () -> i64
      %3485 = func.call @stack_pop_pointer() : () -> i64
      %3486 = func.call @cc_cons(%3485, %3484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3486) : (i64) -> ()
      %3487 = func.call @stack_pop_pointer() : () -> i64
      %3488 = func.call @stack_pop_pointer() : () -> i64
      %3489 = func.call @cc_cons(%3488, %3487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3489) : (i64) -> ()
      %3490 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3491 = arith.constant 7 : i64
      %3492 = func.call @cc_make_string(%3490, %3491) : (!llvm.ptr, i64) -> i64
      %3493 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3494 = arith.constant 11 : i64
      %3495 = func.call @cc_make_string(%3493, %3494) : (!llvm.ptr, i64) -> i64
      %3496 = func.call @cc_intern(%3492, %3495) : (i64, i64) -> i64
      %3497 = func.call @cc_nil_value() : () -> i64
      %3498 = func.call @cc_cons(%3496, %3497) : (i64, i64) -> i64
      %3499 = func.call @cc_values_pack(%3498) : (i64) -> i64
      func.call @stack_push_pointer(%3496) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3500 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3501 = arith.constant 11 : i64
      %3502 = func.call @cc_make_string(%3500, %3501) : (!llvm.ptr, i64) -> i64
      %3503 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3504 = arith.constant 3 : i64
      %3505 = func.call @cc_make_string(%3503, %3504) : (!llvm.ptr, i64) -> i64
      %3506 = func.call @cc_intern(%3502, %3505) : (i64, i64) -> i64
      %3507 = func.call @cc_nil_value() : () -> i64
      %3508 = func.call @cc_cons(%3506, %3507) : (i64, i64) -> i64
      %3509 = func.call @cc_values_pack(%3508) : (i64) -> i64
      func.call @stack_push_pointer(%3506) : (i64) -> ()
      %3510 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3510) : (i64) -> ()
      %3511 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3512 = arith.constant 6 : i64
      %3513 = func.call @cc_make_string(%3511, %3512) : (!llvm.ptr, i64) -> i64
      %3514 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3515 = arith.constant 11 : i64
      %3516 = func.call @cc_make_string(%3514, %3515) : (!llvm.ptr, i64) -> i64
      %3517 = func.call @cc_intern(%3513, %3516) : (i64, i64) -> i64
      %3518 = func.call @cc_nil_value() : () -> i64
      %3519 = func.call @cc_cons(%3517, %3518) : (i64, i64) -> i64
      %3520 = func.call @cc_values_pack(%3519) : (i64) -> i64
      func.call @stack_push_pointer(%3517) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3521 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3522 = arith.constant 15 : i64
      %3523 = func.call @cc_make_string(%3521, %3522) : (!llvm.ptr, i64) -> i64
      %3524 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3525 = arith.constant 11 : i64
      %3526 = func.call @cc_make_string(%3524, %3525) : (!llvm.ptr, i64) -> i64
      %3527 = func.call @cc_intern(%3523, %3526) : (i64, i64) -> i64
      %3528 = func.call @cc_nil_value() : () -> i64
      %3529 = func.call @cc_cons(%3527, %3528) : (i64, i64) -> i64
      %3530 = func.call @cc_values_pack(%3529) : (i64) -> i64
      func.call @stack_push_pointer(%3527) : (i64) -> ()
      %3531 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3532 = arith.constant 1 : i64
      %3533 = func.call @cc_make_string(%3531, %3532) : (!llvm.ptr, i64) -> i64
      %3534 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3535 = arith.constant 11 : i64
      %3536 = func.call @cc_make_string(%3534, %3535) : (!llvm.ptr, i64) -> i64
      %3537 = func.call @cc_intern(%3533, %3536) : (i64, i64) -> i64
      %3538 = func.call @cc_nil_value() : () -> i64
      %3539 = func.call @cc_cons(%3537, %3538) : (i64, i64) -> i64
      %3540 = func.call @cc_values_pack(%3539) : (i64) -> i64
      func.call @stack_push_pointer(%3537) : (i64) -> ()
      %3541 = arith.constant 189 : i64
      func.call @stack_push_fixnum(%3541) : (i64) -> ()
      %3542 = arith.constant 911 : i64
      func.call @stack_push_fixnum(%3542) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3543 = func.call @stack_pop_pointer() : () -> i64
      %3544 = func.call @stack_pop_pointer() : () -> i64
      %3545 = func.call @cc_cons(%3544, %3543) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3545) : (i64) -> ()
      %3546 = func.call @stack_pop_pointer() : () -> i64
      %3547 = func.call @stack_pop_pointer() : () -> i64
      %3548 = func.call @cc_cons(%3547, %3546) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3548) : (i64) -> ()
      %3549 = func.call @stack_pop_pointer() : () -> i64
      %3550 = func.call @stack_pop_pointer() : () -> i64
      %3551 = func.call @cc_cons(%3550, %3549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3551) : (i64) -> ()
      %3552 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3553 = arith.constant 1 : i64
      %3554 = func.call @cc_make_string(%3552, %3553) : (!llvm.ptr, i64) -> i64
      %3555 = func.call @cc_nil_value() : () -> i64
      %3556 = func.call @cc_intern(%3554, %3555) : (i64, i64) -> i64
      %3557 = func.call @cc_nil_value() : () -> i64
      %3558 = func.call @cc_cons(%3556, %3557) : (i64, i64) -> i64
      %3559 = func.call @cc_values_pack(%3558) : (i64) -> i64
      func.call @stack_push_pointer(%3556) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3560 = func.call @stack_pop_pointer() : () -> i64
      %3561 = func.call @stack_pop_pointer() : () -> i64
      %3562 = func.call @cc_cons(%3561, %3560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3562) : (i64) -> ()
      %3563 = func.call @stack_pop_pointer() : () -> i64
      %3564 = func.call @stack_pop_pointer() : () -> i64
      %3565 = func.call @cc_cons(%3564, %3563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3565) : (i64) -> ()
      %3566 = func.call @stack_pop_pointer() : () -> i64
      %3567 = func.call @stack_pop_pointer() : () -> i64
      %3568 = func.call @cc_cons(%3567, %3566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3568) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3569 = func.call @stack_pop_pointer() : () -> i64
      %3570 = func.call @stack_pop_pointer() : () -> i64
      %3571 = func.call @cc_cons(%3570, %3569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3571) : (i64) -> ()
      %3572 = func.call @stack_pop_pointer() : () -> i64
      %3573 = func.call @stack_pop_pointer() : () -> i64
      %3574 = func.call @cc_cons(%3573, %3572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3574) : (i64) -> ()
      %3575 = func.call @stack_pop_pointer() : () -> i64
      %3576 = func.call @stack_pop_pointer() : () -> i64
      %3577 = func.call @cc_cons(%3576, %3575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3577) : (i64) -> ()
      %3578 = func.call @stack_pop_pointer() : () -> i64
      %3579 = func.call @stack_pop_pointer() : () -> i64
      %3580 = func.call @cc_cons(%3578, %3579) : (i64, i64) -> i64
      %3581 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3582 = arith.constant 5 : i64
      %3583 = func.call @cc_make_string(%3581, %3582) : (!llvm.ptr, i64) -> i64
      %3584 = func.call @cc_nil_value() : () -> i64
      %3585 = func.call @cc_intern(%3583, %3584) : (i64, i64) -> i64
      %3586 = func.call @cc_nil_value() : () -> i64
      %3587 = func.call @cc_cons(%3585, %3586) : (i64, i64) -> i64
      %3588 = func.call @cc_values_pack(%3587) : (i64) -> i64
      %3589 = func.call @cc_cons(%3585, %3580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3589) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3590 = func.call @stack_pop_pointer() : () -> i64
      %3591 = func.call @stack_pop_pointer() : () -> i64
      %3592 = func.call @cc_cons(%3591, %3590) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3592) : (i64) -> ()
      %3593 = func.call @stack_pop_pointer() : () -> i64
      %3594 = func.call @stack_pop_pointer() : () -> i64
      %3595 = func.call @cc_cons(%3594, %3593) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3595) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3596 = func.call @stack_pop_pointer() : () -> i64
      %3597 = func.call @stack_pop_pointer() : () -> i64
      %3598 = func.call @cc_cons(%3597, %3596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3598) : (i64) -> ()
      %3599 = func.call @stack_pop_pointer() : () -> i64
      %3600 = func.call @stack_pop_pointer() : () -> i64
      %3601 = func.call @cc_cons(%3600, %3599) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3601) : (i64) -> ()
      %3602 = func.call @stack_pop_pointer() : () -> i64
      %3603 = func.call @stack_pop_pointer() : () -> i64
      %3604 = func.call @cc_cons(%3603, %3602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3604) : (i64) -> ()
      %3605 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3606 = arith.constant 6 : i64
      %3607 = func.call @cc_make_string(%3605, %3606) : (!llvm.ptr, i64) -> i64
      %3608 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3609 = arith.constant 11 : i64
      %3610 = func.call @cc_make_string(%3608, %3609) : (!llvm.ptr, i64) -> i64
      %3611 = func.call @cc_intern(%3607, %3610) : (i64, i64) -> i64
      %3612 = func.call @cc_nil_value() : () -> i64
      %3613 = func.call @cc_cons(%3611, %3612) : (i64, i64) -> i64
      %3614 = func.call @cc_values_pack(%3613) : (i64) -> i64
      func.call @stack_push_pointer(%3611) : (i64) -> ()
      %3615 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3616 = arith.constant 7 : i64
      %3617 = func.call @cc_make_string(%3615, %3616) : (!llvm.ptr, i64) -> i64
      %3618 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3619 = arith.constant 11 : i64
      %3620 = func.call @cc_make_string(%3618, %3619) : (!llvm.ptr, i64) -> i64
      %3621 = func.call @cc_intern(%3617, %3620) : (i64, i64) -> i64
      %3622 = func.call @cc_nil_value() : () -> i64
      %3623 = func.call @cc_cons(%3621, %3622) : (i64, i64) -> i64
      %3624 = func.call @cc_values_pack(%3623) : (i64) -> i64
      func.call @stack_push_pointer(%3621) : (i64) -> ()
      %3625 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3626 = arith.constant 1 : i64
      %3627 = func.call @cc_make_string(%3625, %3626) : (!llvm.ptr, i64) -> i64
      %3628 = func.call @cc_nil_value() : () -> i64
      %3629 = func.call @cc_intern(%3627, %3628) : (i64, i64) -> i64
      %3630 = func.call @cc_nil_value() : () -> i64
      %3631 = func.call @cc_cons(%3629, %3630) : (i64, i64) -> i64
      %3632 = func.call @cc_values_pack(%3631) : (i64) -> i64
      func.call @stack_push_pointer(%3629) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3633 = func.call @stack_pop_pointer() : () -> i64
      %3634 = func.call @stack_pop_pointer() : () -> i64
      %3635 = func.call @cc_cons(%3634, %3633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3635) : (i64) -> ()
      %3636 = func.call @stack_pop_pointer() : () -> i64
      %3637 = func.call @stack_pop_pointer() : () -> i64
      %3638 = func.call @cc_cons(%3637, %3636) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3638) : (i64) -> ()
      %3639 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3640 = arith.constant 9 : i64
      %3641 = func.call @cc_make_string(%3639, %3640) : (!llvm.ptr, i64) -> i64
      %3642 = func.call @cc_nil_value() : () -> i64
      %3643 = func.call @cc_intern(%3641, %3642) : (i64, i64) -> i64
      %3644 = func.call @cc_nil_value() : () -> i64
      %3645 = func.call @cc_cons(%3643, %3644) : (i64, i64) -> i64
      %3646 = func.call @cc_values_pack(%3645) : (i64) -> i64
      func.call @stack_push_pointer(%3643) : (i64) -> ()
      %3647 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3648 = arith.constant 8 : i64
      %3649 = func.call @cc_make_string(%3647, %3648) : (!llvm.ptr, i64) -> i64
      %3650 = func.call @cc_nil_value() : () -> i64
      %3651 = func.call @cc_intern(%3649, %3650) : (i64, i64) -> i64
      %3652 = func.call @cc_nil_value() : () -> i64
      %3653 = func.call @cc_cons(%3651, %3652) : (i64, i64) -> i64
      %3654 = func.call @cc_values_pack(%3653) : (i64) -> i64
      func.call @stack_push_pointer(%3651) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3655 = func.call @stack_pop_pointer() : () -> i64
      %3656 = func.call @stack_pop_pointer() : () -> i64
      %3657 = func.call @cc_cons(%3656, %3655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3657) : (i64) -> ()
      %3658 = func.call @stack_pop_pointer() : () -> i64
      %3659 = func.call @stack_pop_pointer() : () -> i64
      %3660 = func.call @cc_cons(%3659, %3658) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3660) : (i64) -> ()
      %3661 = func.call @stack_pop_pointer() : () -> i64
      %3662 = func.call @stack_pop_pointer() : () -> i64
      %3663 = func.call @cc_cons(%3662, %3661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3663) : (i64) -> ()
      %3664 = func.call @stack_pop_pointer() : () -> i64
      %3665 = func.call @stack_pop_pointer() : () -> i64
      %3666 = func.call @cc_cons(%3665, %3664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3666) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3667 = func.call @stack_pop_pointer() : () -> i64
      %3668 = func.call @stack_pop_pointer() : () -> i64
      %3669 = func.call @cc_cons(%3668, %3667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3669) : (i64) -> ()
      %3670 = func.call @stack_pop_pointer() : () -> i64
      %3671 = func.call @stack_pop_pointer() : () -> i64
      %3672 = func.call @cc_cons(%3671, %3670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3672) : (i64) -> ()
      %3673 = func.call @stack_pop_pointer() : () -> i64
      %3674 = func.call @stack_pop_pointer() : () -> i64
      %3675 = func.call @cc_cons(%3674, %3673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3675) : (i64) -> ()
      %3676 = func.call @stack_pop_pointer() : () -> i64
      %3677 = func.call @stack_pop_pointer() : () -> i64
      %3678 = func.call @cc_cons(%3677, %3676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3678) : (i64) -> ()
      %3679 = func.call @stack_pop_pointer() : () -> i64
      %3769 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3770 = arith.constant 30 : i64
      %3771 = func.call @cc_make_symbol(%3769, %3770) : (!llvm.ptr, i64) -> i64
      %3772 = func.call @cc_persistent_root_value(%3771) : (i64) -> i64
      func.call @stack_push_pointer(%3772) : (i64) -> ()
      %3773 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3774 = arith.constant 37 : i64
      %3775 = func.call @cc_make_symbol(%3773, %3774) : (!llvm.ptr, i64) -> i64
      %3776 = func.call @cc_persistent_root_value(%3775) : (i64) -> i64
      func.call @stack_push_pointer(%3776) : (i64) -> ()
      %3777 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3778 = arith.constant 38 : i64
      %3779 = func.call @cc_make_symbol(%3777, %3778) : (!llvm.ptr, i64) -> i64
      %3780 = func.call @cc_persistent_root_value(%3779) : (i64) -> i64
      func.call @stack_push_pointer(%3780) : (i64) -> ()
      %3781 = arith.constant 275462358040617 : i64
      %3782 = arith.constant 3 : i64
      %3783 = func.call @cc_make_closure(%3781, %3782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3783) : (i64) -> ()
      %3784 = func.call @stack_pop_pointer() : () -> i64
      %3785 = arith.constant 1100 : i64
      func.call @stack_push_fixnum(%3785) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3786 = func.call @stack_pop_pointer() : () -> i64
      %3787 = func.call @stack_pop_pointer() : () -> i64
      %3788 = func.call @cc_cons(%3787, %3786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3788) : (i64) -> ()
      %3789 = func.call @stack_pop_pointer() : () -> i64
      %3790 = func.call @stack_pop_pointer() : () -> i64
      %3791 = func.call @cc_cons(%3790, %3789) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3791) : (i64) -> ()
      %3792 = func.call @stack_pop_pointer() : () -> i64
      %3793 = func.call @stack_pop_pointer() : () -> i64
      %3794 = func.call @cc_cons(%3793, %3792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3794) : (i64) -> ()
      %3795 = func.call @stack_pop_pointer() : () -> i64
      %3796 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3797 = arith.constant 11 : i64
      %3798 = func.call @cc_make_string(%3796, %3797) : (!llvm.ptr, i64) -> i64
      %3799 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3800 = arith.constant 7 : i64
      %3801 = func.call @cc_make_string(%3799, %3800) : (!llvm.ptr, i64) -> i64
      %3802 = func.call @cc_intern(%3798, %3801) : (i64, i64) -> i64
      %3803 = func.call @cc_nil_value() : () -> i64
      %3804 = func.call @cc_cons(%3802, %3803) : (i64, i64) -> i64
      %3805 = func.call @cc_values_pack(%3804) : (i64) -> i64
      func.call @stack_push_pointer(%3802) : (i64) -> ()
      %3806 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3807 = func.call @stack_pop_pointer() : () -> i64
      %3808 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3809 = arith.constant 4 : i64
      %3810 = func.call @cc_make_string(%3808, %3809) : (!llvm.ptr, i64) -> i64
      %3811 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3812 = arith.constant 7 : i64
      %3813 = func.call @cc_make_string(%3811, %3812) : (!llvm.ptr, i64) -> i64
      %3814 = func.call @cc_intern(%3810, %3813) : (i64, i64) -> i64
      %3815 = func.call @cc_nil_value() : () -> i64
      %3816 = func.call @cc_cons(%3814, %3815) : (i64, i64) -> i64
      %3817 = func.call @cc_values_pack(%3816) : (i64) -> i64
      func.call @stack_push_pointer(%3814) : (i64) -> ()
      %3818 = func.call @stack_pop_pointer() : () -> i64
      %3819 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3820 = arith.constant 6 : i64
      %3821 = func.call @cc_make_string(%3819, %3820) : (!llvm.ptr, i64) -> i64
      %3822 = func.call @cc_nil_value() : () -> i64
      %3823 = func.call @cc_intern(%3821, %3822) : (i64, i64) -> i64
      %3824 = func.call @cc_nil_value() : () -> i64
      %3825 = func.call @cc_cons(%3823, %3824) : (i64, i64) -> i64
      %3826 = func.call @cc_values_pack(%3825) : (i64) -> i64
      func.call @stack_push_pointer(%3823) : (i64) -> ()
      %3827 = func.call @stack_pop_pointer() : () -> i64
      %3828 = func.call @cc_nil_value() : () -> i64
      %3829 = func.call @cc_errorp(%3446) : (i64) -> i64
      %3830 = arith.cmpi ne, %3829, %3828 : i64
      %3831 = arith.cmpi eq, %3828, %3828 : i64
      %3832 = arith.andi %3830, %3831 : i1
      %3833 = scf.if %3832 -> (i64) {
        scf.yield %3446 : i64
      } else {
        scf.yield %3828 : i64
      }
      %3834 = func.call @cc_errorp(%3679) : (i64) -> i64
      %3835 = arith.cmpi ne, %3834, %3828 : i64
      %3836 = arith.cmpi eq, %3833, %3828 : i64
      %3837 = arith.andi %3835, %3836 : i1
      %3838 = scf.if %3837 -> (i64) {
        scf.yield %3679 : i64
      } else {
        scf.yield %3833 : i64
      }
      %3839 = func.call @cc_errorp(%3784) : (i64) -> i64
      %3840 = arith.cmpi ne, %3839, %3828 : i64
      %3841 = arith.cmpi eq, %3838, %3828 : i64
      %3842 = arith.andi %3840, %3841 : i1
      %3843 = scf.if %3842 -> (i64) {
        scf.yield %3784 : i64
      } else {
        scf.yield %3838 : i64
      }
      %3844 = func.call @cc_errorp(%3795) : (i64) -> i64
      %3845 = arith.cmpi ne, %3844, %3828 : i64
      %3846 = arith.cmpi eq, %3843, %3828 : i64
      %3847 = arith.andi %3845, %3846 : i1
      %3848 = scf.if %3847 -> (i64) {
        scf.yield %3795 : i64
      } else {
        scf.yield %3843 : i64
      }
      %3849 = func.call @cc_errorp(%3806) : (i64) -> i64
      %3850 = arith.cmpi ne, %3849, %3828 : i64
      %3851 = arith.cmpi eq, %3848, %3828 : i64
      %3852 = arith.andi %3850, %3851 : i1
      %3853 = scf.if %3852 -> (i64) {
        scf.yield %3806 : i64
      } else {
        scf.yield %3848 : i64
      }
      %3854 = func.call @cc_errorp(%3807) : (i64) -> i64
      %3855 = arith.cmpi ne, %3854, %3828 : i64
      %3856 = arith.cmpi eq, %3853, %3828 : i64
      %3857 = arith.andi %3855, %3856 : i1
      %3858 = scf.if %3857 -> (i64) {
        scf.yield %3807 : i64
      } else {
        scf.yield %3853 : i64
      }
      %3859 = func.call @cc_errorp(%3818) : (i64) -> i64
      %3860 = arith.cmpi ne, %3859, %3828 : i64
      %3861 = arith.cmpi eq, %3858, %3828 : i64
      %3862 = arith.andi %3860, %3861 : i1
      %3863 = scf.if %3862 -> (i64) {
        scf.yield %3818 : i64
      } else {
        scf.yield %3858 : i64
      }
      %3864 = func.call @cc_errorp(%3827) : (i64) -> i64
      %3865 = arith.cmpi ne, %3864, %3828 : i64
      %3866 = arith.cmpi eq, %3863, %3828 : i64
      %3867 = arith.andi %3865, %3866 : i1
      %3868 = scf.if %3867 -> (i64) {
        scf.yield %3827 : i64
      } else {
        scf.yield %3863 : i64
      }
      %3869 = arith.cmpi ne, %3868, %3828 : i64
      scf.if %3869 {
        func.call @stack_push_pointer(%3868) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3446) : (i64) -> ()
        func.call @stack_push_pointer(%3679) : (i64) -> ()
        func.call @stack_push_pointer(%3784) : (i64) -> ()
        func.call @stack_push_pointer(%3795) : (i64) -> ()
        func.call @stack_push_pointer(%3806) : (i64) -> ()
        func.call @stack_push_pointer(%3807) : (i64) -> ()
        func.call @stack_push_pointer(%3818) : (i64) -> ()
        func.call @stack_push_pointer(%3827) : (i64) -> ()
        %3870 = llvm.mlir.addressof @str303 : !llvm.ptr
        %3871 = func.call @cc_make_function_ref_const(%3870) : (!llvm.ptr) -> i64
        %3872 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3871, %3872) : (i64, i64) -> ()
      }
      %3873 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3873 : i64
    }
    %3874 = func.call @cc_nil_value() : () -> i64
    %3875 = func.call @cc_errorp(%3437) : (i64) -> i64
    %3876 = arith.cmpi ne, %3875, %3874 : i64
    %3877 = scf.if %3876 -> (i64) {
      scf.yield %3437 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %3878 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3879 = func.call @stack_pop_pointer() : () -> i64
      %3880 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3881 = arith.constant 10 : i64
      %3882 = func.call @cc_make_string(%3880, %3881) : (!llvm.ptr, i64) -> i64
      %3883 = func.call @cc_nil_value() : () -> i64
      %3884 = func.call @cc_intern(%3882, %3883) : (i64, i64) -> i64
      %3885 = func.call @cc_nil_value() : () -> i64
      %3886 = func.call @cc_cons(%3884, %3885) : (i64, i64) -> i64
      %3887 = func.call @cc_values_pack(%3886) : (i64) -> i64
      %3888 = func.call @cc_defclass(%3884, %3878, %3879) : (i64, i64, i64) -> i64
      %3889 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3889) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3890 = func.call @stack_pop_pointer() : () -> i64
      %3891 = func.call @stack_pop_pointer() : () -> i64
      %3892 = func.call @cc_cons(%3890, %3891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3892) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3893 = func.call @stack_pop_pointer() : () -> i64
      %3894 = func.call @stack_pop_pointer() : () -> i64
      %3895 = func.call @cc_cons(%3893, %3894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3895) : (i64) -> ()
      %3896 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3897 = arith.constant 10 : i64
      %3898 = func.call @cc_make_string(%3896, %3897) : (!llvm.ptr, i64) -> i64
      %3899 = func.call @cc_nil_value() : () -> i64
      %3900 = func.call @cc_intern(%3898, %3899) : (i64, i64) -> i64
      %3901 = func.call @cc_nil_value() : () -> i64
      %3902 = func.call @cc_cons(%3900, %3901) : (i64, i64) -> i64
      %3903 = func.call @cc_values_pack(%3902) : (i64) -> i64
      func.call @stack_push_pointer(%3900) : (i64) -> ()
      %3904 = func.call @stack_pop_pointer() : () -> i64
      %3905 = func.call @stack_pop_pointer() : () -> i64
      %3906 = func.call @cc_cons(%3904, %3905) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3906) : (i64) -> ()
      %3907 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3908 = arith.constant 8 : i64
      %3909 = func.call @cc_make_string(%3907, %3908) : (!llvm.ptr, i64) -> i64
      %3910 = func.call @cc_nil_value() : () -> i64
      %3911 = func.call @cc_intern(%3909, %3910) : (i64, i64) -> i64
      %3912 = func.call @cc_nil_value() : () -> i64
      %3913 = func.call @cc_cons(%3911, %3912) : (i64, i64) -> i64
      %3914 = func.call @cc_values_pack(%3913) : (i64) -> i64
      func.call @stack_push_pointer(%3911) : (i64) -> ()
      %3915 = func.call @stack_pop_pointer() : () -> i64
      %3916 = func.call @stack_pop_pointer() : () -> i64
      %3917 = func.call @cc_cons(%3915, %3916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3917) : (i64) -> ()
      %3918 = func.call @stack_pop_pointer() : () -> i64
      %3919 = func.call @cc_nil_value() : () -> i64
      %3920 = func.call @cc_cons(%3918, %3919) : (i64, i64) -> i64
      %3921 = func.call @cc_eval(%3920) : (i64) -> i64
      %3922 = func.call @cc_multiple_value_list(%3921) : (i64) -> i64
      %3923 = func.call @cc_values_pack(%3922) : (i64) -> i64
      func.call @stack_push_pointer(%3923) : (i64) -> ()
      %3924 = func.call @stack_depth() : () -> i64
      %3925 = arith.constant 0 : i64
      %3926 = arith.cmpi sgt, %3924, %3925 : i64
      scf.if %3926 {
        %3927 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%3884) : (i64) -> ()
      %3928 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3928 : i64
    }
    %3929 = func.call @cc_nil_value() : () -> i64
    %3930 = func.call @cc_errorp(%3877) : (i64) -> i64
    %3931 = arith.cmpi ne, %3930, %3929 : i64
    %3932 = scf.if %3931 -> (i64) {
      scf.yield %3877 : i64
    } else {
      %3933 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3934 = arith.constant 9 : i64
      %3935 = func.call @cc_make_string(%3933, %3934) : (!llvm.ptr, i64) -> i64
      %3936 = func.call @cc_nil_value() : () -> i64
      %3937 = func.call @cc_intern(%3935, %3936) : (i64, i64) -> i64
      %3938 = func.call @cc_nil_value() : () -> i64
      %3939 = func.call @cc_cons(%3937, %3938) : (i64, i64) -> i64
      %3940 = func.call @cc_values_pack(%3939) : (i64) -> i64
      func.call @stack_push_pointer(%3937) : (i64) -> ()
      %3941 = func.call @stack_pop_pointer() : () -> i64
      %3942 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3943 = arith.constant 19 : i64
      %3944 = func.call @cc_make_string(%3942, %3943) : (!llvm.ptr, i64) -> i64
      %3945 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3946 = arith.constant 11 : i64
      %3947 = func.call @cc_make_string(%3945, %3946) : (!llvm.ptr, i64) -> i64
      %3948 = func.call @cc_intern(%3944, %3947) : (i64, i64) -> i64
      %3949 = func.call @cc_nil_value() : () -> i64
      %3950 = func.call @cc_cons(%3948, %3949) : (i64, i64) -> i64
      %3951 = func.call @cc_values_pack(%3950) : (i64) -> i64
      func.call @stack_push_pointer(%3948) : (i64) -> ()
      %3952 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3953 = arith.constant 1 : i64
      %3954 = func.call @cc_make_string(%3952, %3953) : (!llvm.ptr, i64) -> i64
      %3955 = func.call @cc_nil_value() : () -> i64
      %3956 = func.call @cc_intern(%3954, %3955) : (i64, i64) -> i64
      %3957 = func.call @cc_nil_value() : () -> i64
      %3958 = func.call @cc_cons(%3956, %3957) : (i64, i64) -> i64
      %3959 = func.call @cc_values_pack(%3958) : (i64) -> i64
      func.call @stack_push_pointer(%3956) : (i64) -> ()
      %3960 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3961 = arith.constant 9 : i64
      %3962 = func.call @cc_make_string(%3960, %3961) : (!llvm.ptr, i64) -> i64
      %3963 = func.call @cc_nil_value() : () -> i64
      %3964 = func.call @cc_intern(%3962, %3963) : (i64, i64) -> i64
      %3965 = func.call @cc_nil_value() : () -> i64
      %3966 = func.call @cc_cons(%3964, %3965) : (i64, i64) -> i64
      %3967 = func.call @cc_values_pack(%3966) : (i64) -> i64
      func.call @stack_push_pointer(%3964) : (i64) -> ()
      %3968 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3969 = arith.constant 8 : i64
      %3970 = func.call @cc_make_string(%3968, %3969) : (!llvm.ptr, i64) -> i64
      %3971 = func.call @cc_nil_value() : () -> i64
      %3972 = func.call @cc_intern(%3970, %3971) : (i64, i64) -> i64
      %3973 = func.call @cc_nil_value() : () -> i64
      %3974 = func.call @cc_cons(%3972, %3973) : (i64, i64) -> i64
      %3975 = func.call @cc_values_pack(%3974) : (i64) -> i64
      func.call @stack_push_pointer(%3972) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3976 = func.call @stack_pop_pointer() : () -> i64
      %3977 = func.call @stack_pop_pointer() : () -> i64
      %3978 = func.call @cc_cons(%3977, %3976) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3978) : (i64) -> ()
      %3979 = func.call @stack_pop_pointer() : () -> i64
      %3980 = func.call @stack_pop_pointer() : () -> i64
      %3981 = func.call @cc_cons(%3980, %3979) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3981) : (i64) -> ()
      %3982 = func.call @stack_pop_pointer() : () -> i64
      %3983 = func.call @stack_pop_pointer() : () -> i64
      %3984 = func.call @cc_cons(%3983, %3982) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3984) : (i64) -> ()
      %3985 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3986 = arith.constant 7 : i64
      %3987 = func.call @cc_make_string(%3985, %3986) : (!llvm.ptr, i64) -> i64
      %3988 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3989 = arith.constant 11 : i64
      %3990 = func.call @cc_make_string(%3988, %3989) : (!llvm.ptr, i64) -> i64
      %3991 = func.call @cc_intern(%3987, %3990) : (i64, i64) -> i64
      %3992 = func.call @cc_nil_value() : () -> i64
      %3993 = func.call @cc_cons(%3991, %3992) : (i64, i64) -> i64
      %3994 = func.call @cc_values_pack(%3993) : (i64) -> i64
      func.call @stack_push_pointer(%3991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3995 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3996 = arith.constant 11 : i64
      %3997 = func.call @cc_make_string(%3995, %3996) : (!llvm.ptr, i64) -> i64
      %3998 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3999 = arith.constant 3 : i64
      %4000 = func.call @cc_make_string(%3998, %3999) : (!llvm.ptr, i64) -> i64
      %4001 = func.call @cc_intern(%3997, %4000) : (i64, i64) -> i64
      %4002 = func.call @cc_nil_value() : () -> i64
      %4003 = func.call @cc_cons(%4001, %4002) : (i64, i64) -> i64
      %4004 = func.call @cc_values_pack(%4003) : (i64) -> i64
      func.call @stack_push_pointer(%4001) : (i64) -> ()
      %4005 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4005) : (i64) -> ()
      %4006 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4007 = arith.constant 6 : i64
      %4008 = func.call @cc_make_string(%4006, %4007) : (!llvm.ptr, i64) -> i64
      %4009 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4010 = arith.constant 11 : i64
      %4011 = func.call @cc_make_string(%4009, %4010) : (!llvm.ptr, i64) -> i64
      %4012 = func.call @cc_intern(%4008, %4011) : (i64, i64) -> i64
      %4013 = func.call @cc_nil_value() : () -> i64
      %4014 = func.call @cc_cons(%4012, %4013) : (i64, i64) -> i64
      %4015 = func.call @cc_values_pack(%4014) : (i64) -> i64
      func.call @stack_push_pointer(%4012) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4016 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4017 = arith.constant 15 : i64
      %4018 = func.call @cc_make_string(%4016, %4017) : (!llvm.ptr, i64) -> i64
      %4019 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4020 = arith.constant 11 : i64
      %4021 = func.call @cc_make_string(%4019, %4020) : (!llvm.ptr, i64) -> i64
      %4022 = func.call @cc_intern(%4018, %4021) : (i64, i64) -> i64
      %4023 = func.call @cc_nil_value() : () -> i64
      %4024 = func.call @cc_cons(%4022, %4023) : (i64, i64) -> i64
      %4025 = func.call @cc_values_pack(%4024) : (i64) -> i64
      func.call @stack_push_pointer(%4022) : (i64) -> ()
      %4026 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4027 = arith.constant 13 : i64
      %4028 = func.call @cc_make_string(%4026, %4027) : (!llvm.ptr, i64) -> i64
      %4029 = llvm.mlir.addressof @str322 : !llvm.ptr
      %4030 = arith.constant 11 : i64
      %4031 = func.call @cc_make_string(%4029, %4030) : (!llvm.ptr, i64) -> i64
      %4032 = func.call @cc_intern(%4028, %4031) : (i64, i64) -> i64
      %4033 = func.call @cc_nil_value() : () -> i64
      %4034 = func.call @cc_cons(%4032, %4033) : (i64, i64) -> i64
      %4035 = func.call @cc_values_pack(%4034) : (i64) -> i64
      func.call @stack_push_pointer(%4032) : (i64) -> ()
      %4036 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4036) : (i64) -> ()
      %4037 = llvm.mlir.addressof @str323 : !llvm.ptr
      %4038 = arith.constant 10 : i64
      %4039 = func.call @cc_make_string(%4037, %4038) : (!llvm.ptr, i64) -> i64
      %4040 = func.call @cc_nil_value() : () -> i64
      %4041 = func.call @cc_intern(%4039, %4040) : (i64, i64) -> i64
      %4042 = func.call @cc_nil_value() : () -> i64
      %4043 = func.call @cc_cons(%4041, %4042) : (i64, i64) -> i64
      %4044 = func.call @cc_values_pack(%4043) : (i64) -> i64
      func.call @stack_push_pointer(%4041) : (i64) -> ()
      %4045 = func.call @stack_pop_pointer() : () -> i64
      %4046 = func.call @stack_pop_pointer() : () -> i64
      %4047 = func.call @cc_cons(%4045, %4046) : (i64, i64) -> i64
      %4048 = llvm.mlir.addressof @str324 : !llvm.ptr
      %4049 = arith.constant 5 : i64
      %4050 = func.call @cc_make_string(%4048, %4049) : (!llvm.ptr, i64) -> i64
      %4051 = func.call @cc_nil_value() : () -> i64
      %4052 = func.call @cc_intern(%4050, %4051) : (i64, i64) -> i64
      %4053 = func.call @cc_nil_value() : () -> i64
      %4054 = func.call @cc_cons(%4052, %4053) : (i64, i64) -> i64
      %4055 = func.call @cc_values_pack(%4054) : (i64) -> i64
      %4056 = func.call @cc_cons(%4052, %4047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4056) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4057 = func.call @stack_pop_pointer() : () -> i64
      %4058 = func.call @stack_pop_pointer() : () -> i64
      %4059 = func.call @cc_cons(%4058, %4057) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4059) : (i64) -> ()
      %4060 = func.call @stack_pop_pointer() : () -> i64
      %4061 = func.call @stack_pop_pointer() : () -> i64
      %4062 = func.call @cc_cons(%4061, %4060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4062) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4063 = func.call @stack_pop_pointer() : () -> i64
      %4064 = func.call @stack_pop_pointer() : () -> i64
      %4065 = func.call @cc_cons(%4064, %4063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4065) : (i64) -> ()
      %4066 = func.call @stack_pop_pointer() : () -> i64
      %4067 = func.call @stack_pop_pointer() : () -> i64
      %4068 = func.call @cc_cons(%4067, %4066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4068) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4069 = func.call @stack_pop_pointer() : () -> i64
      %4070 = func.call @stack_pop_pointer() : () -> i64
      %4071 = func.call @cc_cons(%4070, %4069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4071) : (i64) -> ()
      %4072 = func.call @stack_pop_pointer() : () -> i64
      %4073 = func.call @stack_pop_pointer() : () -> i64
      %4074 = func.call @cc_cons(%4073, %4072) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4074) : (i64) -> ()
      %4075 = func.call @stack_pop_pointer() : () -> i64
      %4076 = func.call @stack_pop_pointer() : () -> i64
      %4077 = func.call @cc_cons(%4076, %4075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4077) : (i64) -> ()
      %4078 = func.call @stack_pop_pointer() : () -> i64
      %4079 = func.call @stack_pop_pointer() : () -> i64
      %4080 = func.call @cc_cons(%4078, %4079) : (i64, i64) -> i64
      %4081 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4082 = arith.constant 5 : i64
      %4083 = func.call @cc_make_string(%4081, %4082) : (!llvm.ptr, i64) -> i64
      %4084 = func.call @cc_nil_value() : () -> i64
      %4085 = func.call @cc_intern(%4083, %4084) : (i64, i64) -> i64
      %4086 = func.call @cc_nil_value() : () -> i64
      %4087 = func.call @cc_cons(%4085, %4086) : (i64, i64) -> i64
      %4088 = func.call @cc_values_pack(%4087) : (i64) -> i64
      %4089 = func.call @cc_cons(%4085, %4080) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4089) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4090 = func.call @stack_pop_pointer() : () -> i64
      %4091 = func.call @stack_pop_pointer() : () -> i64
      %4092 = func.call @cc_cons(%4091, %4090) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4092) : (i64) -> ()
      %4093 = func.call @stack_pop_pointer() : () -> i64
      %4094 = func.call @stack_pop_pointer() : () -> i64
      %4095 = func.call @cc_cons(%4094, %4093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4095) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4096 = func.call @stack_pop_pointer() : () -> i64
      %4097 = func.call @stack_pop_pointer() : () -> i64
      %4098 = func.call @cc_cons(%4097, %4096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4098) : (i64) -> ()
      %4099 = func.call @stack_pop_pointer() : () -> i64
      %4100 = func.call @stack_pop_pointer() : () -> i64
      %4101 = func.call @cc_cons(%4100, %4099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4101) : (i64) -> ()
      %4102 = func.call @stack_pop_pointer() : () -> i64
      %4103 = func.call @stack_pop_pointer() : () -> i64
      %4104 = func.call @cc_cons(%4103, %4102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4104) : (i64) -> ()
      %4105 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4106 = arith.constant 6 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4109 = arith.constant 11 : i64
      %4110 = func.call @cc_make_string(%4108, %4109) : (!llvm.ptr, i64) -> i64
      %4111 = func.call @cc_intern(%4107, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_nil_value() : () -> i64
      %4113 = func.call @cc_cons(%4111, %4112) : (i64, i64) -> i64
      %4114 = func.call @cc_values_pack(%4113) : (i64) -> i64
      func.call @stack_push_pointer(%4111) : (i64) -> ()
      %4115 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4116 = arith.constant 10 : i64
      %4117 = func.call @cc_make_string(%4115, %4116) : (!llvm.ptr, i64) -> i64
      %4118 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4119 = arith.constant 11 : i64
      %4120 = func.call @cc_make_string(%4118, %4119) : (!llvm.ptr, i64) -> i64
      %4121 = func.call @cc_intern(%4117, %4120) : (i64, i64) -> i64
      %4122 = func.call @cc_nil_value() : () -> i64
      %4123 = func.call @cc_cons(%4121, %4122) : (i64, i64) -> i64
      %4124 = func.call @cc_values_pack(%4123) : (i64) -> i64
      func.call @stack_push_pointer(%4121) : (i64) -> ()
      %4125 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4126 = arith.constant 8 : i64
      %4127 = func.call @cc_make_string(%4125, %4126) : (!llvm.ptr, i64) -> i64
      %4128 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4129 = arith.constant 11 : i64
      %4130 = func.call @cc_make_string(%4128, %4129) : (!llvm.ptr, i64) -> i64
      %4131 = func.call @cc_intern(%4127, %4130) : (i64, i64) -> i64
      %4132 = func.call @cc_nil_value() : () -> i64
      %4133 = func.call @cc_cons(%4131, %4132) : (i64, i64) -> i64
      %4134 = func.call @cc_values_pack(%4133) : (i64) -> i64
      func.call @stack_push_pointer(%4131) : (i64) -> ()
      %4135 = llvm.mlir.addressof @str332 : !llvm.ptr
      %4136 = arith.constant 7 : i64
      %4137 = func.call @cc_make_string(%4135, %4136) : (!llvm.ptr, i64) -> i64
      %4138 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4139 = arith.constant 11 : i64
      %4140 = func.call @cc_make_string(%4138, %4139) : (!llvm.ptr, i64) -> i64
      %4141 = func.call @cc_intern(%4137, %4140) : (i64, i64) -> i64
      %4142 = func.call @cc_nil_value() : () -> i64
      %4143 = func.call @cc_cons(%4141, %4142) : (i64, i64) -> i64
      %4144 = func.call @cc_values_pack(%4143) : (i64) -> i64
      func.call @stack_push_pointer(%4141) : (i64) -> ()
      %4145 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4146 = arith.constant 1 : i64
      %4147 = func.call @cc_make_string(%4145, %4146) : (!llvm.ptr, i64) -> i64
      %4148 = func.call @cc_nil_value() : () -> i64
      %4149 = func.call @cc_intern(%4147, %4148) : (i64, i64) -> i64
      %4150 = func.call @cc_nil_value() : () -> i64
      %4151 = func.call @cc_cons(%4149, %4150) : (i64, i64) -> i64
      %4152 = func.call @cc_values_pack(%4151) : (i64) -> i64
      func.call @stack_push_pointer(%4149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4153 = func.call @stack_pop_pointer() : () -> i64
      %4154 = func.call @stack_pop_pointer() : () -> i64
      %4155 = func.call @cc_cons(%4154, %4153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4155) : (i64) -> ()
      %4156 = func.call @stack_pop_pointer() : () -> i64
      %4157 = func.call @stack_pop_pointer() : () -> i64
      %4158 = func.call @cc_cons(%4157, %4156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4158) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4159 = func.call @stack_pop_pointer() : () -> i64
      %4160 = func.call @stack_pop_pointer() : () -> i64
      %4161 = func.call @cc_cons(%4160, %4159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4161) : (i64) -> ()
      %4162 = func.call @stack_pop_pointer() : () -> i64
      %4163 = func.call @stack_pop_pointer() : () -> i64
      %4164 = func.call @cc_cons(%4163, %4162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4164) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4165 = func.call @stack_pop_pointer() : () -> i64
      %4166 = func.call @stack_pop_pointer() : () -> i64
      %4167 = func.call @cc_cons(%4166, %4165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4167) : (i64) -> ()
      %4168 = func.call @stack_pop_pointer() : () -> i64
      %4169 = func.call @stack_pop_pointer() : () -> i64
      %4170 = func.call @cc_cons(%4169, %4168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4170) : (i64) -> ()
      %4171 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4172 = arith.constant 9 : i64
      %4173 = func.call @cc_make_string(%4171, %4172) : (!llvm.ptr, i64) -> i64
      %4174 = func.call @cc_nil_value() : () -> i64
      %4175 = func.call @cc_intern(%4173, %4174) : (i64, i64) -> i64
      %4176 = func.call @cc_nil_value() : () -> i64
      %4177 = func.call @cc_cons(%4175, %4176) : (i64, i64) -> i64
      %4178 = func.call @cc_values_pack(%4177) : (i64) -> i64
      func.call @stack_push_pointer(%4175) : (i64) -> ()
      %4179 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4180 = arith.constant 8 : i64
      %4181 = func.call @cc_make_string(%4179, %4180) : (!llvm.ptr, i64) -> i64
      %4182 = func.call @cc_nil_value() : () -> i64
      %4183 = func.call @cc_intern(%4181, %4182) : (i64, i64) -> i64
      %4184 = func.call @cc_nil_value() : () -> i64
      %4185 = func.call @cc_cons(%4183, %4184) : (i64, i64) -> i64
      %4186 = func.call @cc_values_pack(%4185) : (i64) -> i64
      func.call @stack_push_pointer(%4183) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4187 = func.call @stack_pop_pointer() : () -> i64
      %4188 = func.call @stack_pop_pointer() : () -> i64
      %4189 = func.call @cc_cons(%4188, %4187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4189) : (i64) -> ()
      %4190 = func.call @stack_pop_pointer() : () -> i64
      %4191 = func.call @stack_pop_pointer() : () -> i64
      %4192 = func.call @cc_cons(%4191, %4190) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4192) : (i64) -> ()
      %4193 = func.call @stack_pop_pointer() : () -> i64
      %4194 = func.call @stack_pop_pointer() : () -> i64
      %4195 = func.call @cc_cons(%4194, %4193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4195) : (i64) -> ()
      %4196 = func.call @stack_pop_pointer() : () -> i64
      %4197 = func.call @stack_pop_pointer() : () -> i64
      %4198 = func.call @cc_cons(%4197, %4196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4198) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4199 = func.call @stack_pop_pointer() : () -> i64
      %4200 = func.call @stack_pop_pointer() : () -> i64
      %4201 = func.call @cc_cons(%4200, %4199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4201) : (i64) -> ()
      %4202 = func.call @stack_pop_pointer() : () -> i64
      %4203 = func.call @stack_pop_pointer() : () -> i64
      %4204 = func.call @cc_cons(%4203, %4202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4204) : (i64) -> ()
      %4205 = func.call @stack_pop_pointer() : () -> i64
      %4206 = func.call @stack_pop_pointer() : () -> i64
      %4207 = func.call @cc_cons(%4206, %4205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4207) : (i64) -> ()
      %4208 = func.call @stack_pop_pointer() : () -> i64
      %4209 = func.call @stack_pop_pointer() : () -> i64
      %4210 = func.call @cc_cons(%4209, %4208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4210) : (i64) -> ()
      %4211 = func.call @stack_pop_pointer() : () -> i64
      %4287 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4288 = arith.constant 30 : i64
      %4289 = func.call @cc_make_symbol(%4287, %4288) : (!llvm.ptr, i64) -> i64
      %4290 = func.call @cc_persistent_root_value(%4289) : (i64) -> i64
      func.call @stack_push_pointer(%4290) : (i64) -> ()
      %4291 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4292 = arith.constant 37 : i64
      %4293 = func.call @cc_make_symbol(%4291, %4292) : (!llvm.ptr, i64) -> i64
      %4294 = func.call @cc_persistent_root_value(%4293) : (i64) -> i64
      func.call @stack_push_pointer(%4294) : (i64) -> ()
      %4295 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4296 = arith.constant 38 : i64
      %4297 = func.call @cc_make_symbol(%4295, %4296) : (!llvm.ptr, i64) -> i64
      %4298 = func.call @cc_persistent_root_value(%4297) : (i64) -> i64
      func.call @stack_push_pointer(%4298) : (i64) -> ()
      %4299 = arith.constant 275462358040622 : i64
      %4300 = arith.constant 3 : i64
      %4301 = func.call @cc_make_closure(%4299, %4300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4301) : (i64) -> ()
      %4302 = func.call @stack_pop_pointer() : () -> i64
      %4303 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4304 = arith.constant 10 : i64
      %4305 = func.call @cc_make_string(%4303, %4304) : (!llvm.ptr, i64) -> i64
      %4306 = func.call @cc_nil_value() : () -> i64
      %4307 = func.call @cc_intern(%4305, %4306) : (i64, i64) -> i64
      %4308 = func.call @cc_nil_value() : () -> i64
      %4309 = func.call @cc_cons(%4307, %4308) : (i64, i64) -> i64
      %4310 = func.call @cc_values_pack(%4309) : (i64) -> i64
      func.call @stack_push_pointer(%4307) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4311 = func.call @stack_pop_pointer() : () -> i64
      %4312 = func.call @stack_pop_pointer() : () -> i64
      %4313 = func.call @cc_cons(%4312, %4311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4313) : (i64) -> ()
      %4314 = func.call @stack_pop_pointer() : () -> i64
      %4315 = func.call @stack_pop_pointer() : () -> i64
      %4316 = func.call @cc_cons(%4315, %4314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4316) : (i64) -> ()
      %4317 = func.call @stack_pop_pointer() : () -> i64
      %4318 = func.call @stack_pop_pointer() : () -> i64
      %4319 = func.call @cc_cons(%4318, %4317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4319) : (i64) -> ()
      %4320 = func.call @stack_pop_pointer() : () -> i64
      %4321 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4322 = arith.constant 11 : i64
      %4323 = func.call @cc_make_string(%4321, %4322) : (!llvm.ptr, i64) -> i64
      %4324 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4325 = arith.constant 7 : i64
      %4326 = func.call @cc_make_string(%4324, %4325) : (!llvm.ptr, i64) -> i64
      %4327 = func.call @cc_intern(%4323, %4326) : (i64, i64) -> i64
      %4328 = func.call @cc_nil_value() : () -> i64
      %4329 = func.call @cc_cons(%4327, %4328) : (i64, i64) -> i64
      %4330 = func.call @cc_values_pack(%4329) : (i64) -> i64
      func.call @stack_push_pointer(%4327) : (i64) -> ()
      %4331 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4332 = func.call @stack_pop_pointer() : () -> i64
      %4333 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4334 = arith.constant 4 : i64
      %4335 = func.call @cc_make_string(%4333, %4334) : (!llvm.ptr, i64) -> i64
      %4336 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4337 = arith.constant 7 : i64
      %4338 = func.call @cc_make_string(%4336, %4337) : (!llvm.ptr, i64) -> i64
      %4339 = func.call @cc_intern(%4335, %4338) : (i64, i64) -> i64
      %4340 = func.call @cc_nil_value() : () -> i64
      %4341 = func.call @cc_cons(%4339, %4340) : (i64, i64) -> i64
      %4342 = func.call @cc_values_pack(%4341) : (i64) -> i64
      func.call @stack_push_pointer(%4339) : (i64) -> ()
      %4343 = func.call @stack_pop_pointer() : () -> i64
      %4344 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4345 = arith.constant 6 : i64
      %4346 = func.call @cc_make_string(%4344, %4345) : (!llvm.ptr, i64) -> i64
      %4347 = func.call @cc_nil_value() : () -> i64
      %4348 = func.call @cc_intern(%4346, %4347) : (i64, i64) -> i64
      %4349 = func.call @cc_nil_value() : () -> i64
      %4350 = func.call @cc_cons(%4348, %4349) : (i64, i64) -> i64
      %4351 = func.call @cc_values_pack(%4350) : (i64) -> i64
      func.call @stack_push_pointer(%4348) : (i64) -> ()
      %4352 = func.call @stack_pop_pointer() : () -> i64
      %4353 = func.call @cc_nil_value() : () -> i64
      %4354 = func.call @cc_errorp(%3941) : (i64) -> i64
      %4355 = arith.cmpi ne, %4354, %4353 : i64
      %4356 = arith.cmpi eq, %4353, %4353 : i64
      %4357 = arith.andi %4355, %4356 : i1
      %4358 = scf.if %4357 -> (i64) {
        scf.yield %3941 : i64
      } else {
        scf.yield %4353 : i64
      }
      %4359 = func.call @cc_errorp(%4211) : (i64) -> i64
      %4360 = arith.cmpi ne, %4359, %4353 : i64
      %4361 = arith.cmpi eq, %4358, %4353 : i64
      %4362 = arith.andi %4360, %4361 : i1
      %4363 = scf.if %4362 -> (i64) {
        scf.yield %4211 : i64
      } else {
        scf.yield %4358 : i64
      }
      %4364 = func.call @cc_errorp(%4302) : (i64) -> i64
      %4365 = arith.cmpi ne, %4364, %4353 : i64
      %4366 = arith.cmpi eq, %4363, %4353 : i64
      %4367 = arith.andi %4365, %4366 : i1
      %4368 = scf.if %4367 -> (i64) {
        scf.yield %4302 : i64
      } else {
        scf.yield %4363 : i64
      }
      %4369 = func.call @cc_errorp(%4320) : (i64) -> i64
      %4370 = arith.cmpi ne, %4369, %4353 : i64
      %4371 = arith.cmpi eq, %4368, %4353 : i64
      %4372 = arith.andi %4370, %4371 : i1
      %4373 = scf.if %4372 -> (i64) {
        scf.yield %4320 : i64
      } else {
        scf.yield %4368 : i64
      }
      %4374 = func.call @cc_errorp(%4331) : (i64) -> i64
      %4375 = arith.cmpi ne, %4374, %4353 : i64
      %4376 = arith.cmpi eq, %4373, %4353 : i64
      %4377 = arith.andi %4375, %4376 : i1
      %4378 = scf.if %4377 -> (i64) {
        scf.yield %4331 : i64
      } else {
        scf.yield %4373 : i64
      }
      %4379 = func.call @cc_errorp(%4332) : (i64) -> i64
      %4380 = arith.cmpi ne, %4379, %4353 : i64
      %4381 = arith.cmpi eq, %4378, %4353 : i64
      %4382 = arith.andi %4380, %4381 : i1
      %4383 = scf.if %4382 -> (i64) {
        scf.yield %4332 : i64
      } else {
        scf.yield %4378 : i64
      }
      %4384 = func.call @cc_errorp(%4343) : (i64) -> i64
      %4385 = arith.cmpi ne, %4384, %4353 : i64
      %4386 = arith.cmpi eq, %4383, %4353 : i64
      %4387 = arith.andi %4385, %4386 : i1
      %4388 = scf.if %4387 -> (i64) {
        scf.yield %4343 : i64
      } else {
        scf.yield %4383 : i64
      }
      %4389 = func.call @cc_errorp(%4352) : (i64) -> i64
      %4390 = arith.cmpi ne, %4389, %4353 : i64
      %4391 = arith.cmpi eq, %4388, %4353 : i64
      %4392 = arith.andi %4390, %4391 : i1
      %4393 = scf.if %4392 -> (i64) {
        scf.yield %4352 : i64
      } else {
        scf.yield %4388 : i64
      }
      %4394 = arith.cmpi ne, %4393, %4353 : i64
      scf.if %4394 {
        func.call @stack_push_pointer(%4393) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3941) : (i64) -> ()
        func.call @stack_push_pointer(%4211) : (i64) -> ()
        func.call @stack_push_pointer(%4302) : (i64) -> ()
        func.call @stack_push_pointer(%4320) : (i64) -> ()
        func.call @stack_push_pointer(%4331) : (i64) -> ()
        func.call @stack_push_pointer(%4332) : (i64) -> ()
        func.call @stack_push_pointer(%4343) : (i64) -> ()
        func.call @stack_push_pointer(%4352) : (i64) -> ()
        %4395 = llvm.mlir.addressof @str348 : !llvm.ptr
        %4396 = func.call @cc_make_function_ref_const(%4395) : (!llvm.ptr) -> i64
        %4397 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4396, %4397) : (i64, i64) -> ()
      }
      %4398 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4398 : i64
    }
    %4399 = func.call @cc_nil_value() : () -> i64
    %4400 = func.call @cc_errorp(%3932) : (i64) -> i64
    %4401 = arith.cmpi ne, %4400, %4399 : i64
    %4402 = scf.if %4401 -> (i64) {
      scf.yield %3932 : i64
    } else {
      %4403 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4404 = arith.constant 18 : i64
      %4405 = func.call @cc_make_string(%4403, %4404) : (!llvm.ptr, i64) -> i64
      %4406 = func.call @cc_nil_value() : () -> i64
      %4407 = func.call @cc_intern(%4405, %4406) : (i64, i64) -> i64
      %4408 = func.call @cc_nil_value() : () -> i64
      %4409 = func.call @cc_cons(%4407, %4408) : (i64, i64) -> i64
      %4410 = func.call @cc_values_pack(%4409) : (i64) -> i64
      func.call @stack_push_pointer(%4407) : (i64) -> ()
      %4411 = func.call @stack_pop_pointer() : () -> i64
      %4412 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4413 = arith.constant 19 : i64
      %4414 = func.call @cc_make_string(%4412, %4413) : (!llvm.ptr, i64) -> i64
      %4415 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4416 = arith.constant 11 : i64
      %4417 = func.call @cc_make_string(%4415, %4416) : (!llvm.ptr, i64) -> i64
      %4418 = func.call @cc_intern(%4414, %4417) : (i64, i64) -> i64
      %4419 = func.call @cc_nil_value() : () -> i64
      %4420 = func.call @cc_cons(%4418, %4419) : (i64, i64) -> i64
      %4421 = func.call @cc_values_pack(%4420) : (i64) -> i64
      func.call @stack_push_pointer(%4418) : (i64) -> ()
      %4422 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4423 = arith.constant 1 : i64
      %4424 = func.call @cc_make_string(%4422, %4423) : (!llvm.ptr, i64) -> i64
      %4425 = func.call @cc_nil_value() : () -> i64
      %4426 = func.call @cc_intern(%4424, %4425) : (i64, i64) -> i64
      %4427 = func.call @cc_nil_value() : () -> i64
      %4428 = func.call @cc_cons(%4426, %4427) : (i64, i64) -> i64
      %4429 = func.call @cc_values_pack(%4428) : (i64) -> i64
      func.call @stack_push_pointer(%4426) : (i64) -> ()
      %4430 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4431 = arith.constant 9 : i64
      %4432 = func.call @cc_make_string(%4430, %4431) : (!llvm.ptr, i64) -> i64
      %4433 = func.call @cc_nil_value() : () -> i64
      %4434 = func.call @cc_intern(%4432, %4433) : (i64, i64) -> i64
      %4435 = func.call @cc_nil_value() : () -> i64
      %4436 = func.call @cc_cons(%4434, %4435) : (i64, i64) -> i64
      %4437 = func.call @cc_values_pack(%4436) : (i64) -> i64
      func.call @stack_push_pointer(%4434) : (i64) -> ()
      %4438 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4439 = arith.constant 8 : i64
      %4440 = func.call @cc_make_string(%4438, %4439) : (!llvm.ptr, i64) -> i64
      %4441 = func.call @cc_nil_value() : () -> i64
      %4442 = func.call @cc_intern(%4440, %4441) : (i64, i64) -> i64
      %4443 = func.call @cc_nil_value() : () -> i64
      %4444 = func.call @cc_cons(%4442, %4443) : (i64, i64) -> i64
      %4445 = func.call @cc_values_pack(%4444) : (i64) -> i64
      func.call @stack_push_pointer(%4442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4446 = func.call @stack_pop_pointer() : () -> i64
      %4447 = func.call @stack_pop_pointer() : () -> i64
      %4448 = func.call @cc_cons(%4447, %4446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4448) : (i64) -> ()
      %4449 = func.call @stack_pop_pointer() : () -> i64
      %4450 = func.call @stack_pop_pointer() : () -> i64
      %4451 = func.call @cc_cons(%4450, %4449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4451) : (i64) -> ()
      %4452 = func.call @stack_pop_pointer() : () -> i64
      %4453 = func.call @stack_pop_pointer() : () -> i64
      %4454 = func.call @cc_cons(%4453, %4452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4454) : (i64) -> ()
      %4455 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4456 = arith.constant 7 : i64
      %4457 = func.call @cc_make_string(%4455, %4456) : (!llvm.ptr, i64) -> i64
      %4458 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4459 = arith.constant 11 : i64
      %4460 = func.call @cc_make_string(%4458, %4459) : (!llvm.ptr, i64) -> i64
      %4461 = func.call @cc_intern(%4457, %4460) : (i64, i64) -> i64
      %4462 = func.call @cc_nil_value() : () -> i64
      %4463 = func.call @cc_cons(%4461, %4462) : (i64, i64) -> i64
      %4464 = func.call @cc_values_pack(%4463) : (i64) -> i64
      func.call @stack_push_pointer(%4461) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4465 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4466 = arith.constant 11 : i64
      %4467 = func.call @cc_make_string(%4465, %4466) : (!llvm.ptr, i64) -> i64
      %4468 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4469 = arith.constant 3 : i64
      %4470 = func.call @cc_make_string(%4468, %4469) : (!llvm.ptr, i64) -> i64
      %4471 = func.call @cc_intern(%4467, %4470) : (i64, i64) -> i64
      %4472 = func.call @cc_nil_value() : () -> i64
      %4473 = func.call @cc_cons(%4471, %4472) : (i64, i64) -> i64
      %4474 = func.call @cc_values_pack(%4473) : (i64) -> i64
      func.call @stack_push_pointer(%4471) : (i64) -> ()
      %4475 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4475) : (i64) -> ()
      %4476 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4477 = arith.constant 6 : i64
      %4478 = func.call @cc_make_string(%4476, %4477) : (!llvm.ptr, i64) -> i64
      %4479 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4480 = arith.constant 11 : i64
      %4481 = func.call @cc_make_string(%4479, %4480) : (!llvm.ptr, i64) -> i64
      %4482 = func.call @cc_intern(%4478, %4481) : (i64, i64) -> i64
      %4483 = func.call @cc_nil_value() : () -> i64
      %4484 = func.call @cc_cons(%4482, %4483) : (i64, i64) -> i64
      %4485 = func.call @cc_values_pack(%4484) : (i64) -> i64
      func.call @stack_push_pointer(%4482) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4486 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4487 = arith.constant 15 : i64
      %4488 = func.call @cc_make_string(%4486, %4487) : (!llvm.ptr, i64) -> i64
      %4489 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4490 = arith.constant 11 : i64
      %4491 = func.call @cc_make_string(%4489, %4490) : (!llvm.ptr, i64) -> i64
      %4492 = func.call @cc_intern(%4488, %4491) : (i64, i64) -> i64
      %4493 = func.call @cc_nil_value() : () -> i64
      %4494 = func.call @cc_cons(%4492, %4493) : (i64, i64) -> i64
      %4495 = func.call @cc_values_pack(%4494) : (i64) -> i64
      func.call @stack_push_pointer(%4492) : (i64) -> ()
      %4496 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4497 = arith.constant 13 : i64
      %4498 = func.call @cc_make_string(%4496, %4497) : (!llvm.ptr, i64) -> i64
      %4499 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4500 = arith.constant 11 : i64
      %4501 = func.call @cc_make_string(%4499, %4500) : (!llvm.ptr, i64) -> i64
      %4502 = func.call @cc_intern(%4498, %4501) : (i64, i64) -> i64
      %4503 = func.call @cc_nil_value() : () -> i64
      %4504 = func.call @cc_cons(%4502, %4503) : (i64, i64) -> i64
      %4505 = func.call @cc_values_pack(%4504) : (i64) -> i64
      func.call @stack_push_pointer(%4502) : (i64) -> ()
      %4506 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4506) : (i64) -> ()
      %4507 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4508 = arith.constant 10 : i64
      %4509 = func.call @cc_make_string(%4507, %4508) : (!llvm.ptr, i64) -> i64
      %4510 = func.call @cc_nil_value() : () -> i64
      %4511 = func.call @cc_intern(%4509, %4510) : (i64, i64) -> i64
      %4512 = func.call @cc_nil_value() : () -> i64
      %4513 = func.call @cc_cons(%4511, %4512) : (i64, i64) -> i64
      %4514 = func.call @cc_values_pack(%4513) : (i64) -> i64
      func.call @stack_push_pointer(%4511) : (i64) -> ()
      %4515 = func.call @stack_pop_pointer() : () -> i64
      %4516 = func.call @stack_pop_pointer() : () -> i64
      %4517 = func.call @cc_cons(%4515, %4516) : (i64, i64) -> i64
      %4518 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4519 = arith.constant 5 : i64
      %4520 = func.call @cc_make_string(%4518, %4519) : (!llvm.ptr, i64) -> i64
      %4521 = func.call @cc_nil_value() : () -> i64
      %4522 = func.call @cc_intern(%4520, %4521) : (i64, i64) -> i64
      %4523 = func.call @cc_nil_value() : () -> i64
      %4524 = func.call @cc_cons(%4522, %4523) : (i64, i64) -> i64
      %4525 = func.call @cc_values_pack(%4524) : (i64) -> i64
      %4526 = func.call @cc_cons(%4522, %4517) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4526) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4527 = func.call @stack_pop_pointer() : () -> i64
      %4528 = func.call @stack_pop_pointer() : () -> i64
      %4529 = func.call @cc_cons(%4528, %4527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4529) : (i64) -> ()
      %4530 = func.call @stack_pop_pointer() : () -> i64
      %4531 = func.call @stack_pop_pointer() : () -> i64
      %4532 = func.call @cc_cons(%4531, %4530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4532) : (i64) -> ()
      %4533 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4534 = arith.constant 1 : i64
      %4535 = func.call @cc_make_string(%4533, %4534) : (!llvm.ptr, i64) -> i64
      %4536 = func.call @cc_nil_value() : () -> i64
      %4537 = func.call @cc_intern(%4535, %4536) : (i64, i64) -> i64
      %4538 = func.call @cc_nil_value() : () -> i64
      %4539 = func.call @cc_cons(%4537, %4538) : (i64, i64) -> i64
      %4540 = func.call @cc_values_pack(%4539) : (i64) -> i64
      func.call @stack_push_pointer(%4537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4541 = func.call @stack_pop_pointer() : () -> i64
      %4542 = func.call @stack_pop_pointer() : () -> i64
      %4543 = func.call @cc_cons(%4542, %4541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4543) : (i64) -> ()
      %4544 = func.call @stack_pop_pointer() : () -> i64
      %4545 = func.call @stack_pop_pointer() : () -> i64
      %4546 = func.call @cc_cons(%4545, %4544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4546) : (i64) -> ()
      %4547 = func.call @stack_pop_pointer() : () -> i64
      %4548 = func.call @stack_pop_pointer() : () -> i64
      %4549 = func.call @cc_cons(%4548, %4547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4549) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4550 = func.call @stack_pop_pointer() : () -> i64
      %4551 = func.call @stack_pop_pointer() : () -> i64
      %4552 = func.call @cc_cons(%4551, %4550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4552) : (i64) -> ()
      %4553 = func.call @stack_pop_pointer() : () -> i64
      %4554 = func.call @stack_pop_pointer() : () -> i64
      %4555 = func.call @cc_cons(%4554, %4553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4555) : (i64) -> ()
      %4556 = func.call @stack_pop_pointer() : () -> i64
      %4557 = func.call @stack_pop_pointer() : () -> i64
      %4558 = func.call @cc_cons(%4557, %4556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4558) : (i64) -> ()
      %4559 = func.call @stack_pop_pointer() : () -> i64
      %4560 = func.call @stack_pop_pointer() : () -> i64
      %4561 = func.call @cc_cons(%4559, %4560) : (i64, i64) -> i64
      %4562 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4563 = arith.constant 5 : i64
      %4564 = func.call @cc_make_string(%4562, %4563) : (!llvm.ptr, i64) -> i64
      %4565 = func.call @cc_nil_value() : () -> i64
      %4566 = func.call @cc_intern(%4564, %4565) : (i64, i64) -> i64
      %4567 = func.call @cc_nil_value() : () -> i64
      %4568 = func.call @cc_cons(%4566, %4567) : (i64, i64) -> i64
      %4569 = func.call @cc_values_pack(%4568) : (i64) -> i64
      %4570 = func.call @cc_cons(%4566, %4561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4570) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4571 = func.call @stack_pop_pointer() : () -> i64
      %4572 = func.call @stack_pop_pointer() : () -> i64
      %4573 = func.call @cc_cons(%4572, %4571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4573) : (i64) -> ()
      %4574 = func.call @stack_pop_pointer() : () -> i64
      %4575 = func.call @stack_pop_pointer() : () -> i64
      %4576 = func.call @cc_cons(%4575, %4574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4576) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4577 = func.call @stack_pop_pointer() : () -> i64
      %4578 = func.call @stack_pop_pointer() : () -> i64
      %4579 = func.call @cc_cons(%4578, %4577) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4579) : (i64) -> ()
      %4580 = func.call @stack_pop_pointer() : () -> i64
      %4581 = func.call @stack_pop_pointer() : () -> i64
      %4582 = func.call @cc_cons(%4581, %4580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4582) : (i64) -> ()
      %4583 = func.call @stack_pop_pointer() : () -> i64
      %4584 = func.call @stack_pop_pointer() : () -> i64
      %4585 = func.call @cc_cons(%4584, %4583) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4585) : (i64) -> ()
      %4586 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4587 = arith.constant 6 : i64
      %4588 = func.call @cc_make_string(%4586, %4587) : (!llvm.ptr, i64) -> i64
      %4589 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4590 = arith.constant 11 : i64
      %4591 = func.call @cc_make_string(%4589, %4590) : (!llvm.ptr, i64) -> i64
      %4592 = func.call @cc_intern(%4588, %4591) : (i64, i64) -> i64
      %4593 = func.call @cc_nil_value() : () -> i64
      %4594 = func.call @cc_cons(%4592, %4593) : (i64, i64) -> i64
      %4595 = func.call @cc_values_pack(%4594) : (i64) -> i64
      func.call @stack_push_pointer(%4592) : (i64) -> ()
      %4596 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4597 = arith.constant 10 : i64
      %4598 = func.call @cc_make_string(%4596, %4597) : (!llvm.ptr, i64) -> i64
      %4599 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4600 = arith.constant 11 : i64
      %4601 = func.call @cc_make_string(%4599, %4600) : (!llvm.ptr, i64) -> i64
      %4602 = func.call @cc_intern(%4598, %4601) : (i64, i64) -> i64
      %4603 = func.call @cc_nil_value() : () -> i64
      %4604 = func.call @cc_cons(%4602, %4603) : (i64, i64) -> i64
      %4605 = func.call @cc_values_pack(%4604) : (i64) -> i64
      func.call @stack_push_pointer(%4602) : (i64) -> ()
      %4606 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4607 = arith.constant 8 : i64
      %4608 = func.call @cc_make_string(%4606, %4607) : (!llvm.ptr, i64) -> i64
      %4609 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4610 = arith.constant 11 : i64
      %4611 = func.call @cc_make_string(%4609, %4610) : (!llvm.ptr, i64) -> i64
      %4612 = func.call @cc_intern(%4608, %4611) : (i64, i64) -> i64
      %4613 = func.call @cc_nil_value() : () -> i64
      %4614 = func.call @cc_cons(%4612, %4613) : (i64, i64) -> i64
      %4615 = func.call @cc_values_pack(%4614) : (i64) -> i64
      func.call @stack_push_pointer(%4612) : (i64) -> ()
      %4616 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4617 = arith.constant 7 : i64
      %4618 = func.call @cc_make_string(%4616, %4617) : (!llvm.ptr, i64) -> i64
      %4619 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4620 = arith.constant 11 : i64
      %4621 = func.call @cc_make_string(%4619, %4620) : (!llvm.ptr, i64) -> i64
      %4622 = func.call @cc_intern(%4618, %4621) : (i64, i64) -> i64
      %4623 = func.call @cc_nil_value() : () -> i64
      %4624 = func.call @cc_cons(%4622, %4623) : (i64, i64) -> i64
      %4625 = func.call @cc_values_pack(%4624) : (i64) -> i64
      func.call @stack_push_pointer(%4622) : (i64) -> ()
      %4626 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4627 = arith.constant 1 : i64
      %4628 = func.call @cc_make_string(%4626, %4627) : (!llvm.ptr, i64) -> i64
      %4629 = func.call @cc_nil_value() : () -> i64
      %4630 = func.call @cc_intern(%4628, %4629) : (i64, i64) -> i64
      %4631 = func.call @cc_nil_value() : () -> i64
      %4632 = func.call @cc_cons(%4630, %4631) : (i64, i64) -> i64
      %4633 = func.call @cc_values_pack(%4632) : (i64) -> i64
      func.call @stack_push_pointer(%4630) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4634 = func.call @stack_pop_pointer() : () -> i64
      %4635 = func.call @stack_pop_pointer() : () -> i64
      %4636 = func.call @cc_cons(%4635, %4634) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4636) : (i64) -> ()
      %4637 = func.call @stack_pop_pointer() : () -> i64
      %4638 = func.call @stack_pop_pointer() : () -> i64
      %4639 = func.call @cc_cons(%4638, %4637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4639) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4640 = func.call @stack_pop_pointer() : () -> i64
      %4641 = func.call @stack_pop_pointer() : () -> i64
      %4642 = func.call @cc_cons(%4641, %4640) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4642) : (i64) -> ()
      %4643 = func.call @stack_pop_pointer() : () -> i64
      %4644 = func.call @stack_pop_pointer() : () -> i64
      %4645 = func.call @cc_cons(%4644, %4643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4645) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4646 = func.call @stack_pop_pointer() : () -> i64
      %4647 = func.call @stack_pop_pointer() : () -> i64
      %4648 = func.call @cc_cons(%4647, %4646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4648) : (i64) -> ()
      %4649 = func.call @stack_pop_pointer() : () -> i64
      %4650 = func.call @stack_pop_pointer() : () -> i64
      %4651 = func.call @cc_cons(%4650, %4649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4651) : (i64) -> ()
      %4652 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4653 = arith.constant 9 : i64
      %4654 = func.call @cc_make_string(%4652, %4653) : (!llvm.ptr, i64) -> i64
      %4655 = func.call @cc_nil_value() : () -> i64
      %4656 = func.call @cc_intern(%4654, %4655) : (i64, i64) -> i64
      %4657 = func.call @cc_nil_value() : () -> i64
      %4658 = func.call @cc_cons(%4656, %4657) : (i64, i64) -> i64
      %4659 = func.call @cc_values_pack(%4658) : (i64) -> i64
      func.call @stack_push_pointer(%4656) : (i64) -> ()
      %4660 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4661 = arith.constant 8 : i64
      %4662 = func.call @cc_make_string(%4660, %4661) : (!llvm.ptr, i64) -> i64
      %4663 = func.call @cc_nil_value() : () -> i64
      %4664 = func.call @cc_intern(%4662, %4663) : (i64, i64) -> i64
      %4665 = func.call @cc_nil_value() : () -> i64
      %4666 = func.call @cc_cons(%4664, %4665) : (i64, i64) -> i64
      %4667 = func.call @cc_values_pack(%4666) : (i64) -> i64
      func.call @stack_push_pointer(%4664) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4668 = func.call @stack_pop_pointer() : () -> i64
      %4669 = func.call @stack_pop_pointer() : () -> i64
      %4670 = func.call @cc_cons(%4669, %4668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4670) : (i64) -> ()
      %4671 = func.call @stack_pop_pointer() : () -> i64
      %4672 = func.call @stack_pop_pointer() : () -> i64
      %4673 = func.call @cc_cons(%4672, %4671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4673) : (i64) -> ()
      %4674 = func.call @stack_pop_pointer() : () -> i64
      %4675 = func.call @stack_pop_pointer() : () -> i64
      %4676 = func.call @cc_cons(%4675, %4674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4676) : (i64) -> ()
      %4677 = func.call @stack_pop_pointer() : () -> i64
      %4678 = func.call @stack_pop_pointer() : () -> i64
      %4679 = func.call @cc_cons(%4678, %4677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4680 = func.call @stack_pop_pointer() : () -> i64
      %4681 = func.call @stack_pop_pointer() : () -> i64
      %4682 = func.call @cc_cons(%4681, %4680) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4682) : (i64) -> ()
      %4683 = func.call @stack_pop_pointer() : () -> i64
      %4684 = func.call @stack_pop_pointer() : () -> i64
      %4685 = func.call @cc_cons(%4684, %4683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4685) : (i64) -> ()
      %4686 = func.call @stack_pop_pointer() : () -> i64
      %4687 = func.call @stack_pop_pointer() : () -> i64
      %4688 = func.call @cc_cons(%4687, %4686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4688) : (i64) -> ()
      %4689 = func.call @stack_pop_pointer() : () -> i64
      %4690 = func.call @stack_pop_pointer() : () -> i64
      %4691 = func.call @cc_cons(%4690, %4689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4691) : (i64) -> ()
      %4692 = func.call @stack_pop_pointer() : () -> i64
      %4768 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4769 = arith.constant 30 : i64
      %4770 = func.call @cc_make_symbol(%4768, %4769) : (!llvm.ptr, i64) -> i64
      %4771 = func.call @cc_persistent_root_value(%4770) : (i64) -> i64
      func.call @stack_push_pointer(%4771) : (i64) -> ()
      %4772 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4773 = arith.constant 37 : i64
      %4774 = func.call @cc_make_symbol(%4772, %4773) : (!llvm.ptr, i64) -> i64
      %4775 = func.call @cc_persistent_root_value(%4774) : (i64) -> i64
      func.call @stack_push_pointer(%4775) : (i64) -> ()
      %4776 = llvm.mlir.addressof @str384 : !llvm.ptr
      %4777 = arith.constant 38 : i64
      %4778 = func.call @cc_make_symbol(%4776, %4777) : (!llvm.ptr, i64) -> i64
      %4779 = func.call @cc_persistent_root_value(%4778) : (i64) -> i64
      func.call @stack_push_pointer(%4779) : (i64) -> ()
      %4780 = arith.constant 275462358040627 : i64
      %4781 = arith.constant 3 : i64
      %4782 = func.call @cc_make_closure(%4780, %4781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4782) : (i64) -> ()
      %4783 = func.call @stack_pop_pointer() : () -> i64
      %4784 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4785 = arith.constant 10 : i64
      %4786 = func.call @cc_make_string(%4784, %4785) : (!llvm.ptr, i64) -> i64
      %4787 = func.call @cc_nil_value() : () -> i64
      %4788 = func.call @cc_intern(%4786, %4787) : (i64, i64) -> i64
      %4789 = func.call @cc_nil_value() : () -> i64
      %4790 = func.call @cc_cons(%4788, %4789) : (i64, i64) -> i64
      %4791 = func.call @cc_values_pack(%4790) : (i64) -> i64
      func.call @stack_push_pointer(%4788) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4792 = func.call @stack_pop_pointer() : () -> i64
      %4793 = func.call @stack_pop_pointer() : () -> i64
      %4794 = func.call @cc_cons(%4793, %4792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4794) : (i64) -> ()
      %4795 = func.call @stack_pop_pointer() : () -> i64
      %4796 = func.call @stack_pop_pointer() : () -> i64
      %4797 = func.call @cc_cons(%4796, %4795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4797) : (i64) -> ()
      %4798 = func.call @stack_pop_pointer() : () -> i64
      %4799 = func.call @stack_pop_pointer() : () -> i64
      %4800 = func.call @cc_cons(%4799, %4798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4800) : (i64) -> ()
      %4801 = func.call @stack_pop_pointer() : () -> i64
      %4802 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4803 = arith.constant 11 : i64
      %4804 = func.call @cc_make_string(%4802, %4803) : (!llvm.ptr, i64) -> i64
      %4805 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4806 = arith.constant 7 : i64
      %4807 = func.call @cc_make_string(%4805, %4806) : (!llvm.ptr, i64) -> i64
      %4808 = func.call @cc_intern(%4804, %4807) : (i64, i64) -> i64
      %4809 = func.call @cc_nil_value() : () -> i64
      %4810 = func.call @cc_cons(%4808, %4809) : (i64, i64) -> i64
      %4811 = func.call @cc_values_pack(%4810) : (i64) -> i64
      func.call @stack_push_pointer(%4808) : (i64) -> ()
      %4812 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4813 = func.call @stack_pop_pointer() : () -> i64
      %4814 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4815 = arith.constant 4 : i64
      %4816 = func.call @cc_make_string(%4814, %4815) : (!llvm.ptr, i64) -> i64
      %4817 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4818 = arith.constant 7 : i64
      %4819 = func.call @cc_make_string(%4817, %4818) : (!llvm.ptr, i64) -> i64
      %4820 = func.call @cc_intern(%4816, %4819) : (i64, i64) -> i64
      %4821 = func.call @cc_nil_value() : () -> i64
      %4822 = func.call @cc_cons(%4820, %4821) : (i64, i64) -> i64
      %4823 = func.call @cc_values_pack(%4822) : (i64) -> i64
      func.call @stack_push_pointer(%4820) : (i64) -> ()
      %4824 = func.call @stack_pop_pointer() : () -> i64
      %4825 = llvm.mlir.addressof @str390 : !llvm.ptr
      %4826 = arith.constant 6 : i64
      %4827 = func.call @cc_make_string(%4825, %4826) : (!llvm.ptr, i64) -> i64
      %4828 = func.call @cc_nil_value() : () -> i64
      %4829 = func.call @cc_intern(%4827, %4828) : (i64, i64) -> i64
      %4830 = func.call @cc_nil_value() : () -> i64
      %4831 = func.call @cc_cons(%4829, %4830) : (i64, i64) -> i64
      %4832 = func.call @cc_values_pack(%4831) : (i64) -> i64
      func.call @stack_push_pointer(%4829) : (i64) -> ()
      %4833 = func.call @stack_pop_pointer() : () -> i64
      %4834 = func.call @cc_nil_value() : () -> i64
      %4835 = func.call @cc_errorp(%4411) : (i64) -> i64
      %4836 = arith.cmpi ne, %4835, %4834 : i64
      %4837 = arith.cmpi eq, %4834, %4834 : i64
      %4838 = arith.andi %4836, %4837 : i1
      %4839 = scf.if %4838 -> (i64) {
        scf.yield %4411 : i64
      } else {
        scf.yield %4834 : i64
      }
      %4840 = func.call @cc_errorp(%4692) : (i64) -> i64
      %4841 = arith.cmpi ne, %4840, %4834 : i64
      %4842 = arith.cmpi eq, %4839, %4834 : i64
      %4843 = arith.andi %4841, %4842 : i1
      %4844 = scf.if %4843 -> (i64) {
        scf.yield %4692 : i64
      } else {
        scf.yield %4839 : i64
      }
      %4845 = func.call @cc_errorp(%4783) : (i64) -> i64
      %4846 = arith.cmpi ne, %4845, %4834 : i64
      %4847 = arith.cmpi eq, %4844, %4834 : i64
      %4848 = arith.andi %4846, %4847 : i1
      %4849 = scf.if %4848 -> (i64) {
        scf.yield %4783 : i64
      } else {
        scf.yield %4844 : i64
      }
      %4850 = func.call @cc_errorp(%4801) : (i64) -> i64
      %4851 = arith.cmpi ne, %4850, %4834 : i64
      %4852 = arith.cmpi eq, %4849, %4834 : i64
      %4853 = arith.andi %4851, %4852 : i1
      %4854 = scf.if %4853 -> (i64) {
        scf.yield %4801 : i64
      } else {
        scf.yield %4849 : i64
      }
      %4855 = func.call @cc_errorp(%4812) : (i64) -> i64
      %4856 = arith.cmpi ne, %4855, %4834 : i64
      %4857 = arith.cmpi eq, %4854, %4834 : i64
      %4858 = arith.andi %4856, %4857 : i1
      %4859 = scf.if %4858 -> (i64) {
        scf.yield %4812 : i64
      } else {
        scf.yield %4854 : i64
      }
      %4860 = func.call @cc_errorp(%4813) : (i64) -> i64
      %4861 = arith.cmpi ne, %4860, %4834 : i64
      %4862 = arith.cmpi eq, %4859, %4834 : i64
      %4863 = arith.andi %4861, %4862 : i1
      %4864 = scf.if %4863 -> (i64) {
        scf.yield %4813 : i64
      } else {
        scf.yield %4859 : i64
      }
      %4865 = func.call @cc_errorp(%4824) : (i64) -> i64
      %4866 = arith.cmpi ne, %4865, %4834 : i64
      %4867 = arith.cmpi eq, %4864, %4834 : i64
      %4868 = arith.andi %4866, %4867 : i1
      %4869 = scf.if %4868 -> (i64) {
        scf.yield %4824 : i64
      } else {
        scf.yield %4864 : i64
      }
      %4870 = func.call @cc_errorp(%4833) : (i64) -> i64
      %4871 = arith.cmpi ne, %4870, %4834 : i64
      %4872 = arith.cmpi eq, %4869, %4834 : i64
      %4873 = arith.andi %4871, %4872 : i1
      %4874 = scf.if %4873 -> (i64) {
        scf.yield %4833 : i64
      } else {
        scf.yield %4869 : i64
      }
      %4875 = arith.cmpi ne, %4874, %4834 : i64
      scf.if %4875 {
        func.call @stack_push_pointer(%4874) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4411) : (i64) -> ()
        func.call @stack_push_pointer(%4692) : (i64) -> ()
        func.call @stack_push_pointer(%4783) : (i64) -> ()
        func.call @stack_push_pointer(%4801) : (i64) -> ()
        func.call @stack_push_pointer(%4812) : (i64) -> ()
        func.call @stack_push_pointer(%4813) : (i64) -> ()
        func.call @stack_push_pointer(%4824) : (i64) -> ()
        func.call @stack_push_pointer(%4833) : (i64) -> ()
        %4876 = llvm.mlir.addressof @str391 : !llvm.ptr
        %4877 = func.call @cc_make_function_ref_const(%4876) : (!llvm.ptr) -> i64
        %4878 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4877, %4878) : (i64, i64) -> ()
      }
      %4879 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4879 : i64
    }
    %4880 = func.call @cc_nil_value() : () -> i64
    %4881 = func.call @cc_errorp(%4402) : (i64) -> i64
    %4882 = arith.cmpi ne, %4881, %4880 : i64
    %4883 = scf.if %4882 -> (i64) {
      scf.yield %4402 : i64
    } else {
      %4884 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4885 = arith.constant 9 : i64
      %4886 = func.call @cc_make_string(%4884, %4885) : (!llvm.ptr, i64) -> i64
      %4887 = func.call @cc_nil_value() : () -> i64
      %4888 = func.call @cc_intern(%4886, %4887) : (i64, i64) -> i64
      %4889 = func.call @cc_nil_value() : () -> i64
      %4890 = func.call @cc_cons(%4888, %4889) : (i64, i64) -> i64
      %4891 = func.call @cc_values_pack(%4890) : (i64) -> i64
      func.call @stack_push_pointer(%4888) : (i64) -> ()
      %4892 = func.call @stack_pop_pointer() : () -> i64
      %4893 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4894 = arith.constant 3 : i64
      %4895 = func.call @cc_make_string(%4893, %4894) : (!llvm.ptr, i64) -> i64
      %4896 = func.call @cc_nil_value() : () -> i64
      %4897 = func.call @cc_intern(%4895, %4896) : (i64, i64) -> i64
      %4898 = func.call @cc_nil_value() : () -> i64
      %4899 = func.call @cc_cons(%4897, %4898) : (i64, i64) -> i64
      %4900 = func.call @cc_values_pack(%4899) : (i64) -> i64
      func.call @stack_push_pointer(%4897) : (i64) -> ()
      %4901 = llvm.mlir.addressof @str394 : !llvm.ptr
      %4902 = arith.constant 1 : i64
      %4903 = func.call @cc_make_string(%4901, %4902) : (!llvm.ptr, i64) -> i64
      %4904 = func.call @cc_nil_value() : () -> i64
      %4905 = func.call @cc_intern(%4903, %4904) : (i64, i64) -> i64
      %4906 = func.call @cc_nil_value() : () -> i64
      %4907 = func.call @cc_cons(%4905, %4906) : (i64, i64) -> i64
      %4908 = func.call @cc_values_pack(%4907) : (i64) -> i64
      func.call @stack_push_pointer(%4905) : (i64) -> ()
      %4909 = llvm.mlir.addressof @str395 : !llvm.ptr
      %4910 = arith.constant 11 : i64
      %4911 = func.call @cc_make_string(%4909, %4910) : (!llvm.ptr, i64) -> i64
      %4912 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4913 = arith.constant 3 : i64
      %4914 = func.call @cc_make_string(%4912, %4913) : (!llvm.ptr, i64) -> i64
      %4915 = func.call @cc_intern(%4911, %4914) : (i64, i64) -> i64
      %4916 = func.call @cc_nil_value() : () -> i64
      %4917 = func.call @cc_cons(%4915, %4916) : (i64, i64) -> i64
      %4918 = func.call @cc_values_pack(%4917) : (i64) -> i64
      func.call @stack_push_pointer(%4915) : (i64) -> ()
      %4919 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4919) : (i64) -> ()
      %4920 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4921 = arith.constant 6 : i64
      %4922 = func.call @cc_make_string(%4920, %4921) : (!llvm.ptr, i64) -> i64
      %4923 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4924 = arith.constant 11 : i64
      %4925 = func.call @cc_make_string(%4923, %4924) : (!llvm.ptr, i64) -> i64
      %4926 = func.call @cc_intern(%4922, %4925) : (i64, i64) -> i64
      %4927 = func.call @cc_nil_value() : () -> i64
      %4928 = func.call @cc_cons(%4926, %4927) : (i64, i64) -> i64
      %4929 = func.call @cc_values_pack(%4928) : (i64) -> i64
      func.call @stack_push_pointer(%4926) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4930 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4931 = arith.constant 4 : i64
      %4932 = func.call @cc_make_string(%4930, %4931) : (!llvm.ptr, i64) -> i64
      %4933 = llvm.mlir.addressof @str400 : !llvm.ptr
      %4934 = arith.constant 11 : i64
      %4935 = func.call @cc_make_string(%4933, %4934) : (!llvm.ptr, i64) -> i64
      %4936 = func.call @cc_intern(%4932, %4935) : (i64, i64) -> i64
      %4937 = func.call @cc_nil_value() : () -> i64
      %4938 = func.call @cc_cons(%4936, %4937) : (i64, i64) -> i64
      %4939 = func.call @cc_values_pack(%4938) : (i64) -> i64
      func.call @stack_push_pointer(%4936) : (i64) -> ()
      %4940 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4941 = arith.constant 3 : i64
      %4942 = func.call @cc_make_string(%4940, %4941) : (!llvm.ptr, i64) -> i64
      %4943 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4944 = arith.constant 11 : i64
      %4945 = func.call @cc_make_string(%4943, %4944) : (!llvm.ptr, i64) -> i64
      %4946 = func.call @cc_intern(%4942, %4945) : (i64, i64) -> i64
      %4947 = func.call @cc_nil_value() : () -> i64
      %4948 = func.call @cc_cons(%4946, %4947) : (i64, i64) -> i64
      %4949 = func.call @cc_values_pack(%4948) : (i64) -> i64
      func.call @stack_push_pointer(%4946) : (i64) -> ()
      %4950 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4951 = arith.constant 15 : i64
      %4952 = func.call @cc_make_string(%4950, %4951) : (!llvm.ptr, i64) -> i64
      %4953 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4954 = arith.constant 11 : i64
      %4955 = func.call @cc_make_string(%4953, %4954) : (!llvm.ptr, i64) -> i64
      %4956 = func.call @cc_intern(%4952, %4955) : (i64, i64) -> i64
      %4957 = func.call @cc_nil_value() : () -> i64
      %4958 = func.call @cc_cons(%4956, %4957) : (i64, i64) -> i64
      %4959 = func.call @cc_values_pack(%4958) : (i64) -> i64
      func.call @stack_push_pointer(%4956) : (i64) -> ()
      %4960 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4961 = arith.constant 4 : i64
      %4962 = func.call @cc_make_string(%4960, %4961) : (!llvm.ptr, i64) -> i64
      %4963 = llvm.mlir.addressof @str406 : !llvm.ptr
      %4964 = arith.constant 11 : i64
      %4965 = func.call @cc_make_string(%4963, %4964) : (!llvm.ptr, i64) -> i64
      %4966 = func.call @cc_intern(%4962, %4965) : (i64, i64) -> i64
      %4967 = func.call @cc_nil_value() : () -> i64
      %4968 = func.call @cc_cons(%4966, %4967) : (i64, i64) -> i64
      %4969 = func.call @cc_values_pack(%4968) : (i64) -> i64
      func.call @stack_push_pointer(%4966) : (i64) -> ()
      %4970 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4970) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4971 = func.call @stack_pop_pointer() : () -> i64
      %4972 = func.call @stack_pop_pointer() : () -> i64
      %4973 = func.call @cc_cons(%4972, %4971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4973) : (i64) -> ()
      %4974 = func.call @stack_pop_pointer() : () -> i64
      %4975 = func.call @stack_pop_pointer() : () -> i64
      %4976 = func.call @cc_cons(%4975, %4974) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4976) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4977 = func.call @stack_pop_pointer() : () -> i64
      %4978 = func.call @stack_pop_pointer() : () -> i64
      %4979 = func.call @cc_cons(%4978, %4977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4979) : (i64) -> ()
      %4980 = func.call @stack_pop_pointer() : () -> i64
      %4981 = func.call @stack_pop_pointer() : () -> i64
      %4982 = func.call @cc_cons(%4981, %4980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4982) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4983 = func.call @stack_pop_pointer() : () -> i64
      %4984 = func.call @stack_pop_pointer() : () -> i64
      %4985 = func.call @cc_cons(%4984, %4983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4985) : (i64) -> ()
      %4986 = func.call @stack_pop_pointer() : () -> i64
      %4987 = func.call @stack_pop_pointer() : () -> i64
      %4988 = func.call @cc_cons(%4987, %4986) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4988) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4989 = func.call @stack_pop_pointer() : () -> i64
      %4990 = func.call @stack_pop_pointer() : () -> i64
      %4991 = func.call @cc_cons(%4990, %4989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4991) : (i64) -> ()
      %4992 = func.call @stack_pop_pointer() : () -> i64
      %4993 = func.call @stack_pop_pointer() : () -> i64
      %4994 = func.call @cc_cons(%4993, %4992) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4994) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4995 = func.call @stack_pop_pointer() : () -> i64
      %4996 = func.call @stack_pop_pointer() : () -> i64
      %4997 = func.call @cc_cons(%4996, %4995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4997) : (i64) -> ()
      %4998 = func.call @stack_pop_pointer() : () -> i64
      %4999 = func.call @stack_pop_pointer() : () -> i64
      %5000 = func.call @cc_cons(%4999, %4998) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5000) : (i64) -> ()
      %5001 = func.call @stack_pop_pointer() : () -> i64
      %5002 = func.call @stack_pop_pointer() : () -> i64
      %5003 = func.call @cc_cons(%5002, %5001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5003) : (i64) -> ()
      %5004 = func.call @stack_pop_pointer() : () -> i64
      %5005 = func.call @stack_pop_pointer() : () -> i64
      %5006 = func.call @cc_cons(%5004, %5005) : (i64, i64) -> i64
      %5007 = llvm.mlir.addressof @str407 : !llvm.ptr
      %5008 = arith.constant 5 : i64
      %5009 = func.call @cc_make_string(%5007, %5008) : (!llvm.ptr, i64) -> i64
      %5010 = func.call @cc_nil_value() : () -> i64
      %5011 = func.call @cc_intern(%5009, %5010) : (i64, i64) -> i64
      %5012 = func.call @cc_nil_value() : () -> i64
      %5013 = func.call @cc_cons(%5011, %5012) : (i64, i64) -> i64
      %5014 = func.call @cc_values_pack(%5013) : (i64) -> i64
      %5015 = func.call @cc_cons(%5011, %5006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5015) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5016 = func.call @stack_pop_pointer() : () -> i64
      %5017 = func.call @stack_pop_pointer() : () -> i64
      %5018 = func.call @cc_cons(%5017, %5016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5018) : (i64) -> ()
      %5019 = func.call @stack_pop_pointer() : () -> i64
      %5020 = func.call @stack_pop_pointer() : () -> i64
      %5021 = func.call @cc_cons(%5020, %5019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5021) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5022 = func.call @stack_pop_pointer() : () -> i64
      %5023 = func.call @stack_pop_pointer() : () -> i64
      %5024 = func.call @cc_cons(%5023, %5022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5024) : (i64) -> ()
      %5025 = func.call @stack_pop_pointer() : () -> i64
      %5026 = func.call @stack_pop_pointer() : () -> i64
      %5027 = func.call @cc_cons(%5026, %5025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5027) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5028 = func.call @stack_pop_pointer() : () -> i64
      %5029 = func.call @stack_pop_pointer() : () -> i64
      %5030 = func.call @cc_cons(%5029, %5028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5030) : (i64) -> ()
      %5031 = llvm.mlir.addressof @str408 : !llvm.ptr
      %5032 = arith.constant 7 : i64
      %5033 = func.call @cc_make_string(%5031, %5032) : (!llvm.ptr, i64) -> i64
      %5034 = llvm.mlir.addressof @str409 : !llvm.ptr
      %5035 = arith.constant 11 : i64
      %5036 = func.call @cc_make_string(%5034, %5035) : (!llvm.ptr, i64) -> i64
      %5037 = func.call @cc_intern(%5033, %5036) : (i64, i64) -> i64
      %5038 = func.call @cc_nil_value() : () -> i64
      %5039 = func.call @cc_cons(%5037, %5038) : (i64, i64) -> i64
      %5040 = func.call @cc_values_pack(%5039) : (i64) -> i64
      func.call @stack_push_pointer(%5037) : (i64) -> ()
      %5041 = llvm.mlir.addressof @str410 : !llvm.ptr
      %5042 = arith.constant 1 : i64
      %5043 = func.call @cc_make_string(%5041, %5042) : (!llvm.ptr, i64) -> i64
      %5044 = func.call @cc_nil_value() : () -> i64
      %5045 = func.call @cc_intern(%5043, %5044) : (i64, i64) -> i64
      %5046 = func.call @cc_nil_value() : () -> i64
      %5047 = func.call @cc_cons(%5045, %5046) : (i64, i64) -> i64
      %5048 = func.call @cc_values_pack(%5047) : (i64) -> i64
      func.call @stack_push_pointer(%5045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5049 = func.call @stack_pop_pointer() : () -> i64
      %5050 = func.call @stack_pop_pointer() : () -> i64
      %5051 = func.call @cc_cons(%5050, %5049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5051) : (i64) -> ()
      %5052 = func.call @stack_pop_pointer() : () -> i64
      %5053 = func.call @stack_pop_pointer() : () -> i64
      %5054 = func.call @cc_cons(%5053, %5052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5054) : (i64) -> ()
      %5055 = llvm.mlir.addressof @str411 : !llvm.ptr
      %5056 = arith.constant 7 : i64
      %5057 = func.call @cc_make_string(%5055, %5056) : (!llvm.ptr, i64) -> i64
      %5058 = llvm.mlir.addressof @str412 : !llvm.ptr
      %5059 = arith.constant 11 : i64
      %5060 = func.call @cc_make_string(%5058, %5059) : (!llvm.ptr, i64) -> i64
      %5061 = func.call @cc_intern(%5057, %5060) : (i64, i64) -> i64
      %5062 = func.call @cc_nil_value() : () -> i64
      %5063 = func.call @cc_cons(%5061, %5062) : (i64, i64) -> i64
      %5064 = func.call @cc_values_pack(%5063) : (i64) -> i64
      func.call @stack_push_pointer(%5061) : (i64) -> ()
      %5065 = llvm.mlir.addressof @str413 : !llvm.ptr
      %5066 = arith.constant 1 : i64
      %5067 = func.call @cc_make_string(%5065, %5066) : (!llvm.ptr, i64) -> i64
      %5068 = func.call @cc_nil_value() : () -> i64
      %5069 = func.call @cc_intern(%5067, %5068) : (i64, i64) -> i64
      %5070 = func.call @cc_nil_value() : () -> i64
      %5071 = func.call @cc_cons(%5069, %5070) : (i64, i64) -> i64
      %5072 = func.call @cc_values_pack(%5071) : (i64) -> i64
      func.call @stack_push_pointer(%5069) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5073 = func.call @stack_pop_pointer() : () -> i64
      %5074 = func.call @stack_pop_pointer() : () -> i64
      %5075 = func.call @cc_cons(%5074, %5073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5075) : (i64) -> ()
      %5076 = func.call @stack_pop_pointer() : () -> i64
      %5077 = func.call @stack_pop_pointer() : () -> i64
      %5078 = func.call @cc_cons(%5077, %5076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5078) : (i64) -> ()
      %5079 = llvm.mlir.addressof @str414 : !llvm.ptr
      %5080 = arith.constant 19 : i64
      %5081 = func.call @cc_make_string(%5079, %5080) : (!llvm.ptr, i64) -> i64
      %5082 = llvm.mlir.addressof @str415 : !llvm.ptr
      %5083 = arith.constant 11 : i64
      %5084 = func.call @cc_make_string(%5082, %5083) : (!llvm.ptr, i64) -> i64
      %5085 = func.call @cc_intern(%5081, %5084) : (i64, i64) -> i64
      %5086 = func.call @cc_nil_value() : () -> i64
      %5087 = func.call @cc_cons(%5085, %5086) : (i64, i64) -> i64
      %5088 = func.call @cc_values_pack(%5087) : (i64) -> i64
      func.call @stack_push_pointer(%5085) : (i64) -> ()
      %5089 = llvm.mlir.addressof @str416 : !llvm.ptr
      %5090 = arith.constant 1 : i64
      %5091 = func.call @cc_make_string(%5089, %5090) : (!llvm.ptr, i64) -> i64
      %5092 = func.call @cc_nil_value() : () -> i64
      %5093 = func.call @cc_intern(%5091, %5092) : (i64, i64) -> i64
      %5094 = func.call @cc_nil_value() : () -> i64
      %5095 = func.call @cc_cons(%5093, %5094) : (i64, i64) -> i64
      %5096 = func.call @cc_values_pack(%5095) : (i64) -> i64
      func.call @stack_push_pointer(%5093) : (i64) -> ()
      %5097 = llvm.mlir.addressof @str417 : !llvm.ptr
      %5098 = arith.constant 9 : i64
      %5099 = func.call @cc_make_string(%5097, %5098) : (!llvm.ptr, i64) -> i64
      %5100 = func.call @cc_nil_value() : () -> i64
      %5101 = func.call @cc_intern(%5099, %5100) : (i64, i64) -> i64
      %5102 = func.call @cc_nil_value() : () -> i64
      %5103 = func.call @cc_cons(%5101, %5102) : (i64, i64) -> i64
      %5104 = func.call @cc_values_pack(%5103) : (i64) -> i64
      func.call @stack_push_pointer(%5101) : (i64) -> ()
      %5105 = llvm.mlir.addressof @str418 : !llvm.ptr
      %5106 = arith.constant 8 : i64
      %5107 = func.call @cc_make_string(%5105, %5106) : (!llvm.ptr, i64) -> i64
      %5108 = func.call @cc_nil_value() : () -> i64
      %5109 = func.call @cc_intern(%5107, %5108) : (i64, i64) -> i64
      %5110 = func.call @cc_nil_value() : () -> i64
      %5111 = func.call @cc_cons(%5109, %5110) : (i64, i64) -> i64
      %5112 = func.call @cc_values_pack(%5111) : (i64) -> i64
      func.call @stack_push_pointer(%5109) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5113 = func.call @stack_pop_pointer() : () -> i64
      %5114 = func.call @stack_pop_pointer() : () -> i64
      %5115 = func.call @cc_cons(%5114, %5113) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5115) : (i64) -> ()
      %5116 = func.call @stack_pop_pointer() : () -> i64
      %5117 = func.call @stack_pop_pointer() : () -> i64
      %5118 = func.call @cc_cons(%5117, %5116) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5118) : (i64) -> ()
      %5119 = func.call @stack_pop_pointer() : () -> i64
      %5120 = func.call @stack_pop_pointer() : () -> i64
      %5121 = func.call @cc_cons(%5120, %5119) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5121) : (i64) -> ()
      %5122 = llvm.mlir.addressof @str419 : !llvm.ptr
      %5123 = arith.constant 7 : i64
      %5124 = func.call @cc_make_string(%5122, %5123) : (!llvm.ptr, i64) -> i64
      %5125 = llvm.mlir.addressof @str420 : !llvm.ptr
      %5126 = arith.constant 11 : i64
      %5127 = func.call @cc_make_string(%5125, %5126) : (!llvm.ptr, i64) -> i64
      %5128 = func.call @cc_intern(%5124, %5127) : (i64, i64) -> i64
      %5129 = func.call @cc_nil_value() : () -> i64
      %5130 = func.call @cc_cons(%5128, %5129) : (i64, i64) -> i64
      %5131 = func.call @cc_values_pack(%5130) : (i64) -> i64
      func.call @stack_push_pointer(%5128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5132 = llvm.mlir.addressof @str421 : !llvm.ptr
      %5133 = arith.constant 1 : i64
      %5134 = func.call @cc_make_string(%5132, %5133) : (!llvm.ptr, i64) -> i64
      %5135 = func.call @cc_nil_value() : () -> i64
      %5136 = func.call @cc_intern(%5134, %5135) : (i64, i64) -> i64
      %5137 = func.call @cc_nil_value() : () -> i64
      %5138 = func.call @cc_cons(%5136, %5137) : (i64, i64) -> i64
      %5139 = func.call @cc_values_pack(%5138) : (i64) -> i64
      func.call @stack_push_pointer(%5136) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5140 = func.call @stack_pop_pointer() : () -> i64
      %5141 = func.call @stack_pop_pointer() : () -> i64
      %5142 = func.call @cc_cons(%5141, %5140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5142) : (i64) -> ()
      %5143 = func.call @stack_pop_pointer() : () -> i64
      %5144 = func.call @stack_pop_pointer() : () -> i64
      %5145 = func.call @cc_cons(%5144, %5143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5145) : (i64) -> ()
      %5146 = func.call @stack_pop_pointer() : () -> i64
      %5147 = func.call @stack_pop_pointer() : () -> i64
      %5148 = func.call @cc_cons(%5147, %5146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5148) : (i64) -> ()
      %5149 = llvm.mlir.addressof @str422 : !llvm.ptr
      %5150 = arith.constant 6 : i64
      %5151 = func.call @cc_make_string(%5149, %5150) : (!llvm.ptr, i64) -> i64
      %5152 = llvm.mlir.addressof @str423 : !llvm.ptr
      %5153 = arith.constant 11 : i64
      %5154 = func.call @cc_make_string(%5152, %5153) : (!llvm.ptr, i64) -> i64
      %5155 = func.call @cc_intern(%5151, %5154) : (i64, i64) -> i64
      %5156 = func.call @cc_nil_value() : () -> i64
      %5157 = func.call @cc_cons(%5155, %5156) : (i64, i64) -> i64
      %5158 = func.call @cc_values_pack(%5157) : (i64) -> i64
      func.call @stack_push_pointer(%5155) : (i64) -> ()
      %5159 = llvm.mlir.addressof @str424 : !llvm.ptr
      %5160 = arith.constant 7 : i64
      %5161 = func.call @cc_make_string(%5159, %5160) : (!llvm.ptr, i64) -> i64
      %5162 = llvm.mlir.addressof @str425 : !llvm.ptr
      %5163 = arith.constant 11 : i64
      %5164 = func.call @cc_make_string(%5162, %5163) : (!llvm.ptr, i64) -> i64
      %5165 = func.call @cc_intern(%5161, %5164) : (i64, i64) -> i64
      %5166 = func.call @cc_nil_value() : () -> i64
      %5167 = func.call @cc_cons(%5165, %5166) : (i64, i64) -> i64
      %5168 = func.call @cc_values_pack(%5167) : (i64) -> i64
      func.call @stack_push_pointer(%5165) : (i64) -> ()
      %5169 = llvm.mlir.addressof @str426 : !llvm.ptr
      %5170 = arith.constant 1 : i64
      %5171 = func.call @cc_make_string(%5169, %5170) : (!llvm.ptr, i64) -> i64
      %5172 = func.call @cc_nil_value() : () -> i64
      %5173 = func.call @cc_intern(%5171, %5172) : (i64, i64) -> i64
      %5174 = func.call @cc_nil_value() : () -> i64
      %5175 = func.call @cc_cons(%5173, %5174) : (i64, i64) -> i64
      %5176 = func.call @cc_values_pack(%5175) : (i64) -> i64
      func.call @stack_push_pointer(%5173) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5177 = func.call @stack_pop_pointer() : () -> i64
      %5178 = func.call @stack_pop_pointer() : () -> i64
      %5179 = func.call @cc_cons(%5178, %5177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5179) : (i64) -> ()
      %5180 = func.call @stack_pop_pointer() : () -> i64
      %5181 = func.call @stack_pop_pointer() : () -> i64
      %5182 = func.call @cc_cons(%5181, %5180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5182) : (i64) -> ()
      %5183 = llvm.mlir.addressof @str427 : !llvm.ptr
      %5184 = arith.constant 9 : i64
      %5185 = func.call @cc_make_string(%5183, %5184) : (!llvm.ptr, i64) -> i64
      %5186 = func.call @cc_nil_value() : () -> i64
      %5187 = func.call @cc_intern(%5185, %5186) : (i64, i64) -> i64
      %5188 = func.call @cc_nil_value() : () -> i64
      %5189 = func.call @cc_cons(%5187, %5188) : (i64, i64) -> i64
      %5190 = func.call @cc_values_pack(%5189) : (i64) -> i64
      func.call @stack_push_pointer(%5187) : (i64) -> ()
      %5191 = llvm.mlir.addressof @str428 : !llvm.ptr
      %5192 = arith.constant 8 : i64
      %5193 = func.call @cc_make_string(%5191, %5192) : (!llvm.ptr, i64) -> i64
      %5194 = func.call @cc_nil_value() : () -> i64
      %5195 = func.call @cc_intern(%5193, %5194) : (i64, i64) -> i64
      %5196 = func.call @cc_nil_value() : () -> i64
      %5197 = func.call @cc_cons(%5195, %5196) : (i64, i64) -> i64
      %5198 = func.call @cc_values_pack(%5197) : (i64) -> i64
      func.call @stack_push_pointer(%5195) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5199 = func.call @stack_pop_pointer() : () -> i64
      %5200 = func.call @stack_pop_pointer() : () -> i64
      %5201 = func.call @cc_cons(%5200, %5199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5201) : (i64) -> ()
      %5202 = func.call @stack_pop_pointer() : () -> i64
      %5203 = func.call @stack_pop_pointer() : () -> i64
      %5204 = func.call @cc_cons(%5203, %5202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5204) : (i64) -> ()
      %5205 = func.call @stack_pop_pointer() : () -> i64
      %5206 = func.call @stack_pop_pointer() : () -> i64
      %5207 = func.call @cc_cons(%5206, %5205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5207) : (i64) -> ()
      %5208 = func.call @stack_pop_pointer() : () -> i64
      %5209 = func.call @stack_pop_pointer() : () -> i64
      %5210 = func.call @cc_cons(%5209, %5208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5210) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5211 = func.call @stack_pop_pointer() : () -> i64
      %5212 = func.call @stack_pop_pointer() : () -> i64
      %5213 = func.call @cc_cons(%5212, %5211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5213) : (i64) -> ()
      %5214 = func.call @stack_pop_pointer() : () -> i64
      %5215 = func.call @stack_pop_pointer() : () -> i64
      %5216 = func.call @cc_cons(%5215, %5214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5216) : (i64) -> ()
      %5217 = func.call @stack_pop_pointer() : () -> i64
      %5218 = func.call @stack_pop_pointer() : () -> i64
      %5219 = func.call @cc_cons(%5218, %5217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5219) : (i64) -> ()
      %5220 = func.call @stack_pop_pointer() : () -> i64
      %5221 = func.call @stack_pop_pointer() : () -> i64
      %5222 = func.call @cc_cons(%5221, %5220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5222) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5223 = func.call @stack_pop_pointer() : () -> i64
      %5224 = func.call @stack_pop_pointer() : () -> i64
      %5225 = func.call @cc_cons(%5224, %5223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5225) : (i64) -> ()
      %5226 = func.call @stack_pop_pointer() : () -> i64
      %5227 = func.call @stack_pop_pointer() : () -> i64
      %5228 = func.call @cc_cons(%5227, %5226) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5228) : (i64) -> ()
      %5229 = func.call @stack_pop_pointer() : () -> i64
      %5230 = func.call @stack_pop_pointer() : () -> i64
      %5231 = func.call @cc_cons(%5230, %5229) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5231) : (i64) -> ()
      %5232 = func.call @stack_pop_pointer() : () -> i64
      %5233 = func.call @stack_pop_pointer() : () -> i64
      %5234 = func.call @cc_cons(%5233, %5232) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5234) : (i64) -> ()
      %5235 = func.call @stack_pop_pointer() : () -> i64
      %5236 = func.call @stack_pop_pointer() : () -> i64
      %5237 = func.call @cc_cons(%5236, %5235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5237) : (i64) -> ()
      %5238 = func.call @stack_pop_pointer() : () -> i64
      %5391 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5392 = arith.constant 30 : i64
      %5393 = func.call @cc_make_symbol(%5391, %5392) : (!llvm.ptr, i64) -> i64
      %5394 = func.call @cc_persistent_root_value(%5393) : (i64) -> i64
      func.call @stack_push_pointer(%5394) : (i64) -> ()
      %5395 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5396 = arith.constant 37 : i64
      %5397 = func.call @cc_make_symbol(%5395, %5396) : (!llvm.ptr, i64) -> i64
      %5398 = func.call @cc_persistent_root_value(%5397) : (i64) -> i64
      func.call @stack_push_pointer(%5398) : (i64) -> ()
      %5399 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5400 = arith.constant 38 : i64
      %5401 = func.call @cc_make_symbol(%5399, %5400) : (!llvm.ptr, i64) -> i64
      %5402 = func.call @cc_persistent_root_value(%5401) : (i64) -> i64
      func.call @stack_push_pointer(%5402) : (i64) -> ()
      %5403 = arith.constant 275462358040632 : i64
      %5404 = arith.constant 3 : i64
      %5405 = func.call @cc_make_closure(%5403, %5404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5405) : (i64) -> ()
      %5406 = func.call @stack_pop_pointer() : () -> i64
      %5407 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5407) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5408 = func.call @stack_pop_pointer() : () -> i64
      %5409 = func.call @stack_pop_pointer() : () -> i64
      %5410 = func.call @cc_cons(%5409, %5408) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5410) : (i64) -> ()
      %5411 = func.call @stack_pop_pointer() : () -> i64
      %5412 = func.call @stack_pop_pointer() : () -> i64
      %5413 = func.call @cc_cons(%5412, %5411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5413) : (i64) -> ()
      %5414 = func.call @stack_pop_pointer() : () -> i64
      %5415 = func.call @stack_pop_pointer() : () -> i64
      %5416 = func.call @cc_cons(%5415, %5414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5416) : (i64) -> ()
      %5417 = func.call @stack_pop_pointer() : () -> i64
      %5418 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5419 = arith.constant 11 : i64
      %5420 = func.call @cc_make_string(%5418, %5419) : (!llvm.ptr, i64) -> i64
      %5421 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5422 = arith.constant 7 : i64
      %5423 = func.call @cc_make_string(%5421, %5422) : (!llvm.ptr, i64) -> i64
      %5424 = func.call @cc_intern(%5420, %5423) : (i64, i64) -> i64
      %5425 = func.call @cc_nil_value() : () -> i64
      %5426 = func.call @cc_cons(%5424, %5425) : (i64, i64) -> i64
      %5427 = func.call @cc_values_pack(%5426) : (i64) -> i64
      func.call @stack_push_pointer(%5424) : (i64) -> ()
      %5428 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5429 = func.call @stack_pop_pointer() : () -> i64
      %5430 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5431 = arith.constant 4 : i64
      %5432 = func.call @cc_make_string(%5430, %5431) : (!llvm.ptr, i64) -> i64
      %5433 = llvm.mlir.addressof @str437 : !llvm.ptr
      %5434 = arith.constant 7 : i64
      %5435 = func.call @cc_make_string(%5433, %5434) : (!llvm.ptr, i64) -> i64
      %5436 = func.call @cc_intern(%5432, %5435) : (i64, i64) -> i64
      %5437 = func.call @cc_nil_value() : () -> i64
      %5438 = func.call @cc_cons(%5436, %5437) : (i64, i64) -> i64
      %5439 = func.call @cc_values_pack(%5438) : (i64) -> i64
      func.call @stack_push_pointer(%5436) : (i64) -> ()
      %5440 = func.call @stack_pop_pointer() : () -> i64
      %5441 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5442 = arith.constant 6 : i64
      %5443 = func.call @cc_make_string(%5441, %5442) : (!llvm.ptr, i64) -> i64
      %5444 = func.call @cc_nil_value() : () -> i64
      %5445 = func.call @cc_intern(%5443, %5444) : (i64, i64) -> i64
      %5446 = func.call @cc_nil_value() : () -> i64
      %5447 = func.call @cc_cons(%5445, %5446) : (i64, i64) -> i64
      %5448 = func.call @cc_values_pack(%5447) : (i64) -> i64
      func.call @stack_push_pointer(%5445) : (i64) -> ()
      %5449 = func.call @stack_pop_pointer() : () -> i64
      %5450 = func.call @cc_nil_value() : () -> i64
      %5451 = func.call @cc_errorp(%4892) : (i64) -> i64
      %5452 = arith.cmpi ne, %5451, %5450 : i64
      %5453 = arith.cmpi eq, %5450, %5450 : i64
      %5454 = arith.andi %5452, %5453 : i1
      %5455 = scf.if %5454 -> (i64) {
        scf.yield %4892 : i64
      } else {
        scf.yield %5450 : i64
      }
      %5456 = func.call @cc_errorp(%5238) : (i64) -> i64
      %5457 = arith.cmpi ne, %5456, %5450 : i64
      %5458 = arith.cmpi eq, %5455, %5450 : i64
      %5459 = arith.andi %5457, %5458 : i1
      %5460 = scf.if %5459 -> (i64) {
        scf.yield %5238 : i64
      } else {
        scf.yield %5455 : i64
      }
      %5461 = func.call @cc_errorp(%5406) : (i64) -> i64
      %5462 = arith.cmpi ne, %5461, %5450 : i64
      %5463 = arith.cmpi eq, %5460, %5450 : i64
      %5464 = arith.andi %5462, %5463 : i1
      %5465 = scf.if %5464 -> (i64) {
        scf.yield %5406 : i64
      } else {
        scf.yield %5460 : i64
      }
      %5466 = func.call @cc_errorp(%5417) : (i64) -> i64
      %5467 = arith.cmpi ne, %5466, %5450 : i64
      %5468 = arith.cmpi eq, %5465, %5450 : i64
      %5469 = arith.andi %5467, %5468 : i1
      %5470 = scf.if %5469 -> (i64) {
        scf.yield %5417 : i64
      } else {
        scf.yield %5465 : i64
      }
      %5471 = func.call @cc_errorp(%5428) : (i64) -> i64
      %5472 = arith.cmpi ne, %5471, %5450 : i64
      %5473 = arith.cmpi eq, %5470, %5450 : i64
      %5474 = arith.andi %5472, %5473 : i1
      %5475 = scf.if %5474 -> (i64) {
        scf.yield %5428 : i64
      } else {
        scf.yield %5470 : i64
      }
      %5476 = func.call @cc_errorp(%5429) : (i64) -> i64
      %5477 = arith.cmpi ne, %5476, %5450 : i64
      %5478 = arith.cmpi eq, %5475, %5450 : i64
      %5479 = arith.andi %5477, %5478 : i1
      %5480 = scf.if %5479 -> (i64) {
        scf.yield %5429 : i64
      } else {
        scf.yield %5475 : i64
      }
      %5481 = func.call @cc_errorp(%5440) : (i64) -> i64
      %5482 = arith.cmpi ne, %5481, %5450 : i64
      %5483 = arith.cmpi eq, %5480, %5450 : i64
      %5484 = arith.andi %5482, %5483 : i1
      %5485 = scf.if %5484 -> (i64) {
        scf.yield %5440 : i64
      } else {
        scf.yield %5480 : i64
      }
      %5486 = func.call @cc_errorp(%5449) : (i64) -> i64
      %5487 = arith.cmpi ne, %5486, %5450 : i64
      %5488 = arith.cmpi eq, %5485, %5450 : i64
      %5489 = arith.andi %5487, %5488 : i1
      %5490 = scf.if %5489 -> (i64) {
        scf.yield %5449 : i64
      } else {
        scf.yield %5485 : i64
      }
      %5491 = arith.cmpi ne, %5490, %5450 : i64
      scf.if %5491 {
        func.call @stack_push_pointer(%5490) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4892) : (i64) -> ()
        func.call @stack_push_pointer(%5238) : (i64) -> ()
        func.call @stack_push_pointer(%5406) : (i64) -> ()
        func.call @stack_push_pointer(%5417) : (i64) -> ()
        func.call @stack_push_pointer(%5428) : (i64) -> ()
        func.call @stack_push_pointer(%5429) : (i64) -> ()
        func.call @stack_push_pointer(%5440) : (i64) -> ()
        func.call @stack_push_pointer(%5449) : (i64) -> ()
        %5492 = llvm.mlir.addressof @str439 : !llvm.ptr
        %5493 = func.call @cc_make_function_ref_const(%5492) : (!llvm.ptr) -> i64
        %5494 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5493, %5494) : (i64, i64) -> ()
      }
      %5495 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5495 : i64
    }
    %5496 = func.call @cc_nil_value() : () -> i64
    %5497 = func.call @cc_errorp(%4883) : (i64) -> i64
    %5498 = arith.cmpi ne, %5497, %5496 : i64
    %5499 = scf.if %5498 -> (i64) {
      scf.yield %4883 : i64
    } else {
      %5500 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5501 = arith.constant 9 : i64
      %5502 = func.call @cc_make_string(%5500, %5501) : (!llvm.ptr, i64) -> i64
      %5503 = func.call @cc_nil_value() : () -> i64
      %5504 = func.call @cc_intern(%5502, %5503) : (i64, i64) -> i64
      %5505 = func.call @cc_nil_value() : () -> i64
      %5506 = func.call @cc_cons(%5504, %5505) : (i64, i64) -> i64
      %5507 = func.call @cc_values_pack(%5506) : (i64) -> i64
      func.call @stack_push_pointer(%5504) : (i64) -> ()
      %5508 = func.call @stack_pop_pointer() : () -> i64
      %5509 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5510 = arith.constant 4 : i64
      %5511 = func.call @cc_make_string(%5509, %5510) : (!llvm.ptr, i64) -> i64
      %5512 = func.call @cc_nil_value() : () -> i64
      %5513 = func.call @cc_intern(%5511, %5512) : (i64, i64) -> i64
      %5514 = func.call @cc_nil_value() : () -> i64
      %5515 = func.call @cc_cons(%5513, %5514) : (i64, i64) -> i64
      %5516 = func.call @cc_values_pack(%5515) : (i64) -> i64
      func.call @stack_push_pointer(%5513) : (i64) -> ()
      %5517 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5518 = arith.constant 1 : i64
      %5519 = func.call @cc_make_string(%5517, %5518) : (!llvm.ptr, i64) -> i64
      %5520 = func.call @cc_nil_value() : () -> i64
      %5521 = func.call @cc_intern(%5519, %5520) : (i64, i64) -> i64
      %5522 = func.call @cc_nil_value() : () -> i64
      %5523 = func.call @cc_cons(%5521, %5522) : (i64, i64) -> i64
      %5524 = func.call @cc_values_pack(%5523) : (i64) -> i64
      func.call @stack_push_pointer(%5521) : (i64) -> ()
      %5525 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5526 = arith.constant 11 : i64
      %5527 = func.call @cc_make_string(%5525, %5526) : (!llvm.ptr, i64) -> i64
      %5528 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5529 = arith.constant 3 : i64
      %5530 = func.call @cc_make_string(%5528, %5529) : (!llvm.ptr, i64) -> i64
      %5531 = func.call @cc_intern(%5527, %5530) : (i64, i64) -> i64
      %5532 = func.call @cc_nil_value() : () -> i64
      %5533 = func.call @cc_cons(%5531, %5532) : (i64, i64) -> i64
      %5534 = func.call @cc_values_pack(%5533) : (i64) -> i64
      func.call @stack_push_pointer(%5531) : (i64) -> ()
      %5535 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5535) : (i64) -> ()
      %5536 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5537 = arith.constant 6 : i64
      %5538 = func.call @cc_make_string(%5536, %5537) : (!llvm.ptr, i64) -> i64
      %5539 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5540 = arith.constant 11 : i64
      %5541 = func.call @cc_make_string(%5539, %5540) : (!llvm.ptr, i64) -> i64
      %5542 = func.call @cc_intern(%5538, %5541) : (i64, i64) -> i64
      %5543 = func.call @cc_nil_value() : () -> i64
      %5544 = func.call @cc_cons(%5542, %5543) : (i64, i64) -> i64
      %5545 = func.call @cc_values_pack(%5544) : (i64) -> i64
      func.call @stack_push_pointer(%5542) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5546 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5547 = arith.constant 4 : i64
      %5548 = func.call @cc_make_string(%5546, %5547) : (!llvm.ptr, i64) -> i64
      %5549 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5550 = arith.constant 11 : i64
      %5551 = func.call @cc_make_string(%5549, %5550) : (!llvm.ptr, i64) -> i64
      %5552 = func.call @cc_intern(%5548, %5551) : (i64, i64) -> i64
      %5553 = func.call @cc_nil_value() : () -> i64
      %5554 = func.call @cc_cons(%5552, %5553) : (i64, i64) -> i64
      %5555 = func.call @cc_values_pack(%5554) : (i64) -> i64
      func.call @stack_push_pointer(%5552) : (i64) -> ()
      %5556 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5557 = arith.constant 3 : i64
      %5558 = func.call @cc_make_string(%5556, %5557) : (!llvm.ptr, i64) -> i64
      %5559 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5560 = arith.constant 11 : i64
      %5561 = func.call @cc_make_string(%5559, %5560) : (!llvm.ptr, i64) -> i64
      %5562 = func.call @cc_intern(%5558, %5561) : (i64, i64) -> i64
      %5563 = func.call @cc_nil_value() : () -> i64
      %5564 = func.call @cc_cons(%5562, %5563) : (i64, i64) -> i64
      %5565 = func.call @cc_values_pack(%5564) : (i64) -> i64
      func.call @stack_push_pointer(%5562) : (i64) -> ()
      %5566 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5567 = arith.constant 15 : i64
      %5568 = func.call @cc_make_string(%5566, %5567) : (!llvm.ptr, i64) -> i64
      %5569 = llvm.mlir.addressof @str452 : !llvm.ptr
      %5570 = arith.constant 11 : i64
      %5571 = func.call @cc_make_string(%5569, %5570) : (!llvm.ptr, i64) -> i64
      %5572 = func.call @cc_intern(%5568, %5571) : (i64, i64) -> i64
      %5573 = func.call @cc_nil_value() : () -> i64
      %5574 = func.call @cc_cons(%5572, %5573) : (i64, i64) -> i64
      %5575 = func.call @cc_values_pack(%5574) : (i64) -> i64
      func.call @stack_push_pointer(%5572) : (i64) -> ()
      %5576 = llvm.mlir.addressof @str453 : !llvm.ptr
      %5577 = arith.constant 4 : i64
      %5578 = func.call @cc_make_string(%5576, %5577) : (!llvm.ptr, i64) -> i64
      %5579 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5580 = arith.constant 11 : i64
      %5581 = func.call @cc_make_string(%5579, %5580) : (!llvm.ptr, i64) -> i64
      %5582 = func.call @cc_intern(%5578, %5581) : (i64, i64) -> i64
      %5583 = func.call @cc_nil_value() : () -> i64
      %5584 = func.call @cc_cons(%5582, %5583) : (i64, i64) -> i64
      %5585 = func.call @cc_values_pack(%5584) : (i64) -> i64
      func.call @stack_push_pointer(%5582) : (i64) -> ()
      %5586 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%5586) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5587 = func.call @stack_pop_pointer() : () -> i64
      %5588 = func.call @stack_pop_pointer() : () -> i64
      %5589 = func.call @cc_cons(%5588, %5587) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5589) : (i64) -> ()
      %5590 = func.call @stack_pop_pointer() : () -> i64
      %5591 = func.call @stack_pop_pointer() : () -> i64
      %5592 = func.call @cc_cons(%5591, %5590) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5592) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5593 = func.call @stack_pop_pointer() : () -> i64
      %5594 = func.call @stack_pop_pointer() : () -> i64
      %5595 = func.call @cc_cons(%5594, %5593) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5595) : (i64) -> ()
      %5596 = func.call @stack_pop_pointer() : () -> i64
      %5597 = func.call @stack_pop_pointer() : () -> i64
      %5598 = func.call @cc_cons(%5597, %5596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5598) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5599 = func.call @stack_pop_pointer() : () -> i64
      %5600 = func.call @stack_pop_pointer() : () -> i64
      %5601 = func.call @cc_cons(%5600, %5599) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5601) : (i64) -> ()
      %5602 = func.call @stack_pop_pointer() : () -> i64
      %5603 = func.call @stack_pop_pointer() : () -> i64
      %5604 = func.call @cc_cons(%5603, %5602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5604) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5605 = func.call @stack_pop_pointer() : () -> i64
      %5606 = func.call @stack_pop_pointer() : () -> i64
      %5607 = func.call @cc_cons(%5606, %5605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5607) : (i64) -> ()
      %5608 = func.call @stack_pop_pointer() : () -> i64
      %5609 = func.call @stack_pop_pointer() : () -> i64
      %5610 = func.call @cc_cons(%5609, %5608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5610) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5611 = func.call @stack_pop_pointer() : () -> i64
      %5612 = func.call @stack_pop_pointer() : () -> i64
      %5613 = func.call @cc_cons(%5612, %5611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5613) : (i64) -> ()
      %5614 = func.call @stack_pop_pointer() : () -> i64
      %5615 = func.call @stack_pop_pointer() : () -> i64
      %5616 = func.call @cc_cons(%5615, %5614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5616) : (i64) -> ()
      %5617 = func.call @stack_pop_pointer() : () -> i64
      %5618 = func.call @stack_pop_pointer() : () -> i64
      %5619 = func.call @cc_cons(%5618, %5617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5619) : (i64) -> ()
      %5620 = func.call @stack_pop_pointer() : () -> i64
      %5621 = func.call @stack_pop_pointer() : () -> i64
      %5622 = func.call @cc_cons(%5620, %5621) : (i64, i64) -> i64
      %5623 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5624 = arith.constant 5 : i64
      %5625 = func.call @cc_make_string(%5623, %5624) : (!llvm.ptr, i64) -> i64
      %5626 = func.call @cc_nil_value() : () -> i64
      %5627 = func.call @cc_intern(%5625, %5626) : (i64, i64) -> i64
      %5628 = func.call @cc_nil_value() : () -> i64
      %5629 = func.call @cc_cons(%5627, %5628) : (i64, i64) -> i64
      %5630 = func.call @cc_values_pack(%5629) : (i64) -> i64
      %5631 = func.call @cc_cons(%5627, %5622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5631) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5632 = func.call @stack_pop_pointer() : () -> i64
      %5633 = func.call @stack_pop_pointer() : () -> i64
      %5634 = func.call @cc_cons(%5633, %5632) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5634) : (i64) -> ()
      %5635 = func.call @stack_pop_pointer() : () -> i64
      %5636 = func.call @stack_pop_pointer() : () -> i64
      %5637 = func.call @cc_cons(%5636, %5635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5637) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5638 = func.call @stack_pop_pointer() : () -> i64
      %5639 = func.call @stack_pop_pointer() : () -> i64
      %5640 = func.call @cc_cons(%5639, %5638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5640) : (i64) -> ()
      %5641 = func.call @stack_pop_pointer() : () -> i64
      %5642 = func.call @stack_pop_pointer() : () -> i64
      %5643 = func.call @cc_cons(%5642, %5641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5643) : (i64) -> ()
      %5644 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5645 = arith.constant 2 : i64
      %5646 = func.call @cc_make_string(%5644, %5645) : (!llvm.ptr, i64) -> i64
      %5647 = func.call @cc_nil_value() : () -> i64
      %5648 = func.call @cc_intern(%5646, %5647) : (i64, i64) -> i64
      %5649 = func.call @cc_nil_value() : () -> i64
      %5650 = func.call @cc_cons(%5648, %5649) : (i64, i64) -> i64
      %5651 = func.call @cc_values_pack(%5650) : (i64) -> i64
      func.call @stack_push_pointer(%5648) : (i64) -> ()
      %5652 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5653 = arith.constant 7 : i64
      %5654 = func.call @cc_make_string(%5652, %5653) : (!llvm.ptr, i64) -> i64
      %5655 = llvm.mlir.addressof @str458 : !llvm.ptr
      %5656 = arith.constant 11 : i64
      %5657 = func.call @cc_make_string(%5655, %5656) : (!llvm.ptr, i64) -> i64
      %5658 = func.call @cc_intern(%5654, %5657) : (i64, i64) -> i64
      %5659 = func.call @cc_nil_value() : () -> i64
      %5660 = func.call @cc_cons(%5658, %5659) : (i64, i64) -> i64
      %5661 = func.call @cc_values_pack(%5660) : (i64) -> i64
      func.call @stack_push_pointer(%5658) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5662 = llvm.mlir.addressof @str459 : !llvm.ptr
      %5663 = arith.constant 1 : i64
      %5664 = func.call @cc_make_string(%5662, %5663) : (!llvm.ptr, i64) -> i64
      %5665 = func.call @cc_nil_value() : () -> i64
      %5666 = func.call @cc_intern(%5664, %5665) : (i64, i64) -> i64
      %5667 = func.call @cc_nil_value() : () -> i64
      %5668 = func.call @cc_cons(%5666, %5667) : (i64, i64) -> i64
      %5669 = func.call @cc_values_pack(%5668) : (i64) -> i64
      func.call @stack_push_pointer(%5666) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5670 = func.call @stack_pop_pointer() : () -> i64
      %5671 = func.call @stack_pop_pointer() : () -> i64
      %5672 = func.call @cc_cons(%5671, %5670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5672) : (i64) -> ()
      %5673 = func.call @stack_pop_pointer() : () -> i64
      %5674 = func.call @stack_pop_pointer() : () -> i64
      %5675 = func.call @cc_cons(%5674, %5673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5675) : (i64) -> ()
      %5676 = func.call @stack_pop_pointer() : () -> i64
      %5677 = func.call @stack_pop_pointer() : () -> i64
      %5678 = func.call @cc_cons(%5677, %5676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5678) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5679 = func.call @stack_pop_pointer() : () -> i64
      %5680 = func.call @stack_pop_pointer() : () -> i64
      %5681 = func.call @cc_cons(%5680, %5679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5681) : (i64) -> ()
      %5682 = func.call @stack_pop_pointer() : () -> i64
      %5683 = func.call @stack_pop_pointer() : () -> i64
      %5684 = func.call @cc_cons(%5683, %5682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5684) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5685 = func.call @stack_pop_pointer() : () -> i64
      %5686 = func.call @stack_pop_pointer() : () -> i64
      %5687 = func.call @cc_cons(%5686, %5685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5687) : (i64) -> ()
      %5688 = func.call @stack_pop_pointer() : () -> i64
      %5689 = func.call @stack_pop_pointer() : () -> i64
      %5690 = func.call @cc_cons(%5689, %5688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5690) : (i64) -> ()
      %5691 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5692 = arith.constant 7 : i64
      %5693 = func.call @cc_make_string(%5691, %5692) : (!llvm.ptr, i64) -> i64
      %5694 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5695 = arith.constant 11 : i64
      %5696 = func.call @cc_make_string(%5694, %5695) : (!llvm.ptr, i64) -> i64
      %5697 = func.call @cc_intern(%5693, %5696) : (i64, i64) -> i64
      %5698 = func.call @cc_nil_value() : () -> i64
      %5699 = func.call @cc_cons(%5697, %5698) : (i64, i64) -> i64
      %5700 = func.call @cc_values_pack(%5699) : (i64) -> i64
      func.call @stack_push_pointer(%5697) : (i64) -> ()
      %5701 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5702 = arith.constant 2 : i64
      %5703 = func.call @cc_make_string(%5701, %5702) : (!llvm.ptr, i64) -> i64
      %5704 = func.call @cc_nil_value() : () -> i64
      %5705 = func.call @cc_intern(%5703, %5704) : (i64, i64) -> i64
      %5706 = func.call @cc_nil_value() : () -> i64
      %5707 = func.call @cc_cons(%5705, %5706) : (i64, i64) -> i64
      %5708 = func.call @cc_values_pack(%5707) : (i64) -> i64
      func.call @stack_push_pointer(%5705) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5709 = func.call @stack_pop_pointer() : () -> i64
      %5710 = func.call @stack_pop_pointer() : () -> i64
      %5711 = func.call @cc_cons(%5710, %5709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5711) : (i64) -> ()
      %5712 = func.call @stack_pop_pointer() : () -> i64
      %5713 = func.call @stack_pop_pointer() : () -> i64
      %5714 = func.call @cc_cons(%5713, %5712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5714) : (i64) -> ()
      %5715 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5716 = arith.constant 7 : i64
      %5717 = func.call @cc_make_string(%5715, %5716) : (!llvm.ptr, i64) -> i64
      %5718 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5719 = arith.constant 11 : i64
      %5720 = func.call @cc_make_string(%5718, %5719) : (!llvm.ptr, i64) -> i64
      %5721 = func.call @cc_intern(%5717, %5720) : (i64, i64) -> i64
      %5722 = func.call @cc_nil_value() : () -> i64
      %5723 = func.call @cc_cons(%5721, %5722) : (i64, i64) -> i64
      %5724 = func.call @cc_values_pack(%5723) : (i64) -> i64
      func.call @stack_push_pointer(%5721) : (i64) -> ()
      %5725 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5726 = arith.constant 2 : i64
      %5727 = func.call @cc_make_string(%5725, %5726) : (!llvm.ptr, i64) -> i64
      %5728 = func.call @cc_nil_value() : () -> i64
      %5729 = func.call @cc_intern(%5727, %5728) : (i64, i64) -> i64
      %5730 = func.call @cc_nil_value() : () -> i64
      %5731 = func.call @cc_cons(%5729, %5730) : (i64, i64) -> i64
      %5732 = func.call @cc_values_pack(%5731) : (i64) -> i64
      func.call @stack_push_pointer(%5729) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5733 = func.call @stack_pop_pointer() : () -> i64
      %5734 = func.call @stack_pop_pointer() : () -> i64
      %5735 = func.call @cc_cons(%5734, %5733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5735) : (i64) -> ()
      %5736 = func.call @stack_pop_pointer() : () -> i64
      %5737 = func.call @stack_pop_pointer() : () -> i64
      %5738 = func.call @cc_cons(%5737, %5736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5738) : (i64) -> ()
      %5739 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5740 = arith.constant 7 : i64
      %5741 = func.call @cc_make_string(%5739, %5740) : (!llvm.ptr, i64) -> i64
      %5742 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5743 = arith.constant 11 : i64
      %5744 = func.call @cc_make_string(%5742, %5743) : (!llvm.ptr, i64) -> i64
      %5745 = func.call @cc_intern(%5741, %5744) : (i64, i64) -> i64
      %5746 = func.call @cc_nil_value() : () -> i64
      %5747 = func.call @cc_cons(%5745, %5746) : (i64, i64) -> i64
      %5748 = func.call @cc_values_pack(%5747) : (i64) -> i64
      func.call @stack_push_pointer(%5745) : (i64) -> ()
      %5749 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5750 = arith.constant 2 : i64
      %5751 = func.call @cc_make_string(%5749, %5750) : (!llvm.ptr, i64) -> i64
      %5752 = func.call @cc_nil_value() : () -> i64
      %5753 = func.call @cc_intern(%5751, %5752) : (i64, i64) -> i64
      %5754 = func.call @cc_nil_value() : () -> i64
      %5755 = func.call @cc_cons(%5753, %5754) : (i64, i64) -> i64
      %5756 = func.call @cc_values_pack(%5755) : (i64) -> i64
      func.call @stack_push_pointer(%5753) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5757 = func.call @stack_pop_pointer() : () -> i64
      %5758 = func.call @stack_pop_pointer() : () -> i64
      %5759 = func.call @cc_cons(%5758, %5757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5759) : (i64) -> ()
      %5760 = func.call @stack_pop_pointer() : () -> i64
      %5761 = func.call @stack_pop_pointer() : () -> i64
      %5762 = func.call @cc_cons(%5761, %5760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5762) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5763 = func.call @stack_pop_pointer() : () -> i64
      %5764 = func.call @stack_pop_pointer() : () -> i64
      %5765 = func.call @cc_cons(%5764, %5763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5765) : (i64) -> ()
      %5766 = func.call @stack_pop_pointer() : () -> i64
      %5767 = func.call @stack_pop_pointer() : () -> i64
      %5768 = func.call @cc_cons(%5767, %5766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5768) : (i64) -> ()
      %5769 = func.call @stack_pop_pointer() : () -> i64
      %5770 = func.call @stack_pop_pointer() : () -> i64
      %5771 = func.call @cc_cons(%5770, %5769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5771) : (i64) -> ()
      %5772 = func.call @stack_pop_pointer() : () -> i64
      %5773 = func.call @stack_pop_pointer() : () -> i64
      %5774 = func.call @cc_cons(%5773, %5772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5774) : (i64) -> ()
      %5775 = func.call @stack_pop_pointer() : () -> i64
      %5776 = func.call @stack_pop_pointer() : () -> i64
      %5777 = func.call @cc_cons(%5776, %5775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5777) : (i64) -> ()
      %5778 = func.call @stack_pop_pointer() : () -> i64
      %5907 = arith.constant 275462358040637 : i64
      %5908 = arith.constant 0 : i64
      %5909 = func.call @cc_make_closure(%5907, %5908) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5909) : (i64) -> ()
      %5910 = func.call @stack_pop_pointer() : () -> i64
      %5911 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5911) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5912 = func.call @stack_pop_pointer() : () -> i64
      %5913 = func.call @stack_pop_pointer() : () -> i64
      %5914 = func.call @cc_cons(%5913, %5912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5914) : (i64) -> ()
      %5915 = func.call @stack_pop_pointer() : () -> i64
      %5916 = llvm.mlir.addressof @str471 : !llvm.ptr
      %5917 = arith.constant 11 : i64
      %5918 = func.call @cc_make_string(%5916, %5917) : (!llvm.ptr, i64) -> i64
      %5919 = llvm.mlir.addressof @str472 : !llvm.ptr
      %5920 = arith.constant 7 : i64
      %5921 = func.call @cc_make_string(%5919, %5920) : (!llvm.ptr, i64) -> i64
      %5922 = func.call @cc_intern(%5918, %5921) : (i64, i64) -> i64
      %5923 = func.call @cc_nil_value() : () -> i64
      %5924 = func.call @cc_cons(%5922, %5923) : (i64, i64) -> i64
      %5925 = func.call @cc_values_pack(%5924) : (i64) -> i64
      func.call @stack_push_pointer(%5922) : (i64) -> ()
      %5926 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5927 = func.call @stack_pop_pointer() : () -> i64
      %5928 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5929 = arith.constant 4 : i64
      %5930 = func.call @cc_make_string(%5928, %5929) : (!llvm.ptr, i64) -> i64
      %5931 = llvm.mlir.addressof @str474 : !llvm.ptr
      %5932 = arith.constant 7 : i64
      %5933 = func.call @cc_make_string(%5931, %5932) : (!llvm.ptr, i64) -> i64
      %5934 = func.call @cc_intern(%5930, %5933) : (i64, i64) -> i64
      %5935 = func.call @cc_nil_value() : () -> i64
      %5936 = func.call @cc_cons(%5934, %5935) : (i64, i64) -> i64
      %5937 = func.call @cc_values_pack(%5936) : (i64) -> i64
      func.call @stack_push_pointer(%5934) : (i64) -> ()
      %5938 = func.call @stack_pop_pointer() : () -> i64
      %5939 = llvm.mlir.addressof @str475 : !llvm.ptr
      %5940 = arith.constant 6 : i64
      %5941 = func.call @cc_make_string(%5939, %5940) : (!llvm.ptr, i64) -> i64
      %5942 = func.call @cc_nil_value() : () -> i64
      %5943 = func.call @cc_intern(%5941, %5942) : (i64, i64) -> i64
      %5944 = func.call @cc_nil_value() : () -> i64
      %5945 = func.call @cc_cons(%5943, %5944) : (i64, i64) -> i64
      %5946 = func.call @cc_values_pack(%5945) : (i64) -> i64
      func.call @stack_push_pointer(%5943) : (i64) -> ()
      %5947 = func.call @stack_pop_pointer() : () -> i64
      %5948 = func.call @cc_nil_value() : () -> i64
      %5949 = func.call @cc_errorp(%5508) : (i64) -> i64
      %5950 = arith.cmpi ne, %5949, %5948 : i64
      %5951 = arith.cmpi eq, %5948, %5948 : i64
      %5952 = arith.andi %5950, %5951 : i1
      %5953 = scf.if %5952 -> (i64) {
        scf.yield %5508 : i64
      } else {
        scf.yield %5948 : i64
      }
      %5954 = func.call @cc_errorp(%5778) : (i64) -> i64
      %5955 = arith.cmpi ne, %5954, %5948 : i64
      %5956 = arith.cmpi eq, %5953, %5948 : i64
      %5957 = arith.andi %5955, %5956 : i1
      %5958 = scf.if %5957 -> (i64) {
        scf.yield %5778 : i64
      } else {
        scf.yield %5953 : i64
      }
      %5959 = func.call @cc_errorp(%5910) : (i64) -> i64
      %5960 = arith.cmpi ne, %5959, %5948 : i64
      %5961 = arith.cmpi eq, %5958, %5948 : i64
      %5962 = arith.andi %5960, %5961 : i1
      %5963 = scf.if %5962 -> (i64) {
        scf.yield %5910 : i64
      } else {
        scf.yield %5958 : i64
      }
      %5964 = func.call @cc_errorp(%5915) : (i64) -> i64
      %5965 = arith.cmpi ne, %5964, %5948 : i64
      %5966 = arith.cmpi eq, %5963, %5948 : i64
      %5967 = arith.andi %5965, %5966 : i1
      %5968 = scf.if %5967 -> (i64) {
        scf.yield %5915 : i64
      } else {
        scf.yield %5963 : i64
      }
      %5969 = func.call @cc_errorp(%5926) : (i64) -> i64
      %5970 = arith.cmpi ne, %5969, %5948 : i64
      %5971 = arith.cmpi eq, %5968, %5948 : i64
      %5972 = arith.andi %5970, %5971 : i1
      %5973 = scf.if %5972 -> (i64) {
        scf.yield %5926 : i64
      } else {
        scf.yield %5968 : i64
      }
      %5974 = func.call @cc_errorp(%5927) : (i64) -> i64
      %5975 = arith.cmpi ne, %5974, %5948 : i64
      %5976 = arith.cmpi eq, %5973, %5948 : i64
      %5977 = arith.andi %5975, %5976 : i1
      %5978 = scf.if %5977 -> (i64) {
        scf.yield %5927 : i64
      } else {
        scf.yield %5973 : i64
      }
      %5979 = func.call @cc_errorp(%5938) : (i64) -> i64
      %5980 = arith.cmpi ne, %5979, %5948 : i64
      %5981 = arith.cmpi eq, %5978, %5948 : i64
      %5982 = arith.andi %5980, %5981 : i1
      %5983 = scf.if %5982 -> (i64) {
        scf.yield %5938 : i64
      } else {
        scf.yield %5978 : i64
      }
      %5984 = func.call @cc_errorp(%5947) : (i64) -> i64
      %5985 = arith.cmpi ne, %5984, %5948 : i64
      %5986 = arith.cmpi eq, %5983, %5948 : i64
      %5987 = arith.andi %5985, %5986 : i1
      %5988 = scf.if %5987 -> (i64) {
        scf.yield %5947 : i64
      } else {
        scf.yield %5983 : i64
      }
      %5989 = arith.cmpi ne, %5988, %5948 : i64
      scf.if %5989 {
        func.call @stack_push_pointer(%5988) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5508) : (i64) -> ()
        func.call @stack_push_pointer(%5778) : (i64) -> ()
        func.call @stack_push_pointer(%5910) : (i64) -> ()
        func.call @stack_push_pointer(%5915) : (i64) -> ()
        func.call @stack_push_pointer(%5926) : (i64) -> ()
        func.call @stack_push_pointer(%5927) : (i64) -> ()
        func.call @stack_push_pointer(%5938) : (i64) -> ()
        func.call @stack_push_pointer(%5947) : (i64) -> ()
        %5990 = llvm.mlir.addressof @str476 : !llvm.ptr
        %5991 = func.call @cc_make_function_ref_const(%5990) : (!llvm.ptr) -> i64
        %5992 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5991, %5992) : (i64, i64) -> ()
      }
      %5993 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5993 : i64
    }
    %5994 = func.call @cc_nil_value() : () -> i64
    %5995 = func.call @cc_errorp(%5499) : (i64) -> i64
    %5996 = arith.cmpi ne, %5995, %5994 : i64
    %5997 = scf.if %5996 -> (i64) {
      scf.yield %5499 : i64
    } else {
      %5998 = llvm.mlir.addressof @str477 : !llvm.ptr
      %5999 = arith.constant 9 : i64
      %6000 = func.call @cc_make_string(%5998, %5999) : (!llvm.ptr, i64) -> i64
      %6001 = func.call @cc_nil_value() : () -> i64
      %6002 = func.call @cc_intern(%6000, %6001) : (i64, i64) -> i64
      %6003 = func.call @cc_nil_value() : () -> i64
      %6004 = func.call @cc_cons(%6002, %6003) : (i64, i64) -> i64
      %6005 = func.call @cc_values_pack(%6004) : (i64) -> i64
      func.call @stack_push_pointer(%6002) : (i64) -> ()
      %6006 = func.call @stack_pop_pointer() : () -> i64
      %6007 = llvm.mlir.addressof @str478 : !llvm.ptr
      %6008 = arith.constant 3 : i64
      %6009 = func.call @cc_make_string(%6007, %6008) : (!llvm.ptr, i64) -> i64
      %6010 = func.call @cc_nil_value() : () -> i64
      %6011 = func.call @cc_intern(%6009, %6010) : (i64, i64) -> i64
      %6012 = func.call @cc_nil_value() : () -> i64
      %6013 = func.call @cc_cons(%6011, %6012) : (i64, i64) -> i64
      %6014 = func.call @cc_values_pack(%6013) : (i64) -> i64
      func.call @stack_push_pointer(%6011) : (i64) -> ()
      %6015 = llvm.mlir.addressof @str479 : !llvm.ptr
      %6016 = arith.constant 1 : i64
      %6017 = func.call @cc_make_string(%6015, %6016) : (!llvm.ptr, i64) -> i64
      %6018 = func.call @cc_nil_value() : () -> i64
      %6019 = func.call @cc_intern(%6017, %6018) : (i64, i64) -> i64
      %6020 = func.call @cc_nil_value() : () -> i64
      %6021 = func.call @cc_cons(%6019, %6020) : (i64, i64) -> i64
      %6022 = func.call @cc_values_pack(%6021) : (i64) -> i64
      func.call @stack_push_pointer(%6019) : (i64) -> ()
      %6023 = llvm.mlir.addressof @str480 : !llvm.ptr
      %6024 = arith.constant 11 : i64
      %6025 = func.call @cc_make_string(%6023, %6024) : (!llvm.ptr, i64) -> i64
      %6026 = llvm.mlir.addressof @str481 : !llvm.ptr
      %6027 = arith.constant 3 : i64
      %6028 = func.call @cc_make_string(%6026, %6027) : (!llvm.ptr, i64) -> i64
      %6029 = func.call @cc_intern(%6025, %6028) : (i64, i64) -> i64
      %6030 = func.call @cc_nil_value() : () -> i64
      %6031 = func.call @cc_cons(%6029, %6030) : (i64, i64) -> i64
      %6032 = func.call @cc_values_pack(%6031) : (i64) -> i64
      func.call @stack_push_pointer(%6029) : (i64) -> ()
      %6033 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6033) : (i64) -> ()
      %6034 = llvm.mlir.addressof @str482 : !llvm.ptr
      %6035 = arith.constant 6 : i64
      %6036 = func.call @cc_make_string(%6034, %6035) : (!llvm.ptr, i64) -> i64
      %6037 = llvm.mlir.addressof @str483 : !llvm.ptr
      %6038 = arith.constant 11 : i64
      %6039 = func.call @cc_make_string(%6037, %6038) : (!llvm.ptr, i64) -> i64
      %6040 = func.call @cc_intern(%6036, %6039) : (i64, i64) -> i64
      %6041 = func.call @cc_nil_value() : () -> i64
      %6042 = func.call @cc_cons(%6040, %6041) : (i64, i64) -> i64
      %6043 = func.call @cc_values_pack(%6042) : (i64) -> i64
      func.call @stack_push_pointer(%6040) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6044 = llvm.mlir.addressof @str484 : !llvm.ptr
      %6045 = arith.constant 4 : i64
      %6046 = func.call @cc_make_string(%6044, %6045) : (!llvm.ptr, i64) -> i64
      %6047 = llvm.mlir.addressof @str485 : !llvm.ptr
      %6048 = arith.constant 11 : i64
      %6049 = func.call @cc_make_string(%6047, %6048) : (!llvm.ptr, i64) -> i64
      %6050 = func.call @cc_intern(%6046, %6049) : (i64, i64) -> i64
      %6051 = func.call @cc_nil_value() : () -> i64
      %6052 = func.call @cc_cons(%6050, %6051) : (i64, i64) -> i64
      %6053 = func.call @cc_values_pack(%6052) : (i64) -> i64
      func.call @stack_push_pointer(%6050) : (i64) -> ()
      %6054 = llvm.mlir.addressof @str486 : !llvm.ptr
      %6055 = arith.constant 3 : i64
      %6056 = func.call @cc_make_string(%6054, %6055) : (!llvm.ptr, i64) -> i64
      %6057 = llvm.mlir.addressof @str487 : !llvm.ptr
      %6058 = arith.constant 11 : i64
      %6059 = func.call @cc_make_string(%6057, %6058) : (!llvm.ptr, i64) -> i64
      %6060 = func.call @cc_intern(%6056, %6059) : (i64, i64) -> i64
      %6061 = func.call @cc_nil_value() : () -> i64
      %6062 = func.call @cc_cons(%6060, %6061) : (i64, i64) -> i64
      %6063 = func.call @cc_values_pack(%6062) : (i64) -> i64
      func.call @stack_push_pointer(%6060) : (i64) -> ()
      %6064 = llvm.mlir.addressof @str488 : !llvm.ptr
      %6065 = arith.constant 15 : i64
      %6066 = func.call @cc_make_string(%6064, %6065) : (!llvm.ptr, i64) -> i64
      %6067 = llvm.mlir.addressof @str489 : !llvm.ptr
      %6068 = arith.constant 11 : i64
      %6069 = func.call @cc_make_string(%6067, %6068) : (!llvm.ptr, i64) -> i64
      %6070 = func.call @cc_intern(%6066, %6069) : (i64, i64) -> i64
      %6071 = func.call @cc_nil_value() : () -> i64
      %6072 = func.call @cc_cons(%6070, %6071) : (i64, i64) -> i64
      %6073 = func.call @cc_values_pack(%6072) : (i64) -> i64
      func.call @stack_push_pointer(%6070) : (i64) -> ()
      %6074 = llvm.mlir.addressof @str490 : !llvm.ptr
      %6075 = arith.constant 4 : i64
      %6076 = func.call @cc_make_string(%6074, %6075) : (!llvm.ptr, i64) -> i64
      %6077 = llvm.mlir.addressof @str491 : !llvm.ptr
      %6078 = arith.constant 11 : i64
      %6079 = func.call @cc_make_string(%6077, %6078) : (!llvm.ptr, i64) -> i64
      %6080 = func.call @cc_intern(%6076, %6079) : (i64, i64) -> i64
      %6081 = func.call @cc_nil_value() : () -> i64
      %6082 = func.call @cc_cons(%6080, %6081) : (i64, i64) -> i64
      %6083 = func.call @cc_values_pack(%6082) : (i64) -> i64
      func.call @stack_push_pointer(%6080) : (i64) -> ()
      %6084 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%6084) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6085 = func.call @stack_pop_pointer() : () -> i64
      %6086 = func.call @stack_pop_pointer() : () -> i64
      %6087 = func.call @cc_cons(%6086, %6085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6087) : (i64) -> ()
      %6088 = func.call @stack_pop_pointer() : () -> i64
      %6089 = func.call @stack_pop_pointer() : () -> i64
      %6090 = func.call @cc_cons(%6089, %6088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6090) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6091 = func.call @stack_pop_pointer() : () -> i64
      %6092 = func.call @stack_pop_pointer() : () -> i64
      %6093 = func.call @cc_cons(%6092, %6091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6093) : (i64) -> ()
      %6094 = func.call @stack_pop_pointer() : () -> i64
      %6095 = func.call @stack_pop_pointer() : () -> i64
      %6096 = func.call @cc_cons(%6095, %6094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6096) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6097 = func.call @stack_pop_pointer() : () -> i64
      %6098 = func.call @stack_pop_pointer() : () -> i64
      %6099 = func.call @cc_cons(%6098, %6097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6099) : (i64) -> ()
      %6100 = func.call @stack_pop_pointer() : () -> i64
      %6101 = func.call @stack_pop_pointer() : () -> i64
      %6102 = func.call @cc_cons(%6101, %6100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6102) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6103 = func.call @stack_pop_pointer() : () -> i64
      %6104 = func.call @stack_pop_pointer() : () -> i64
      %6105 = func.call @cc_cons(%6104, %6103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6105) : (i64) -> ()
      %6106 = func.call @stack_pop_pointer() : () -> i64
      %6107 = func.call @stack_pop_pointer() : () -> i64
      %6108 = func.call @cc_cons(%6107, %6106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6109 = func.call @stack_pop_pointer() : () -> i64
      %6110 = func.call @stack_pop_pointer() : () -> i64
      %6111 = func.call @cc_cons(%6110, %6109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6111) : (i64) -> ()
      %6112 = func.call @stack_pop_pointer() : () -> i64
      %6113 = func.call @stack_pop_pointer() : () -> i64
      %6114 = func.call @cc_cons(%6113, %6112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6114) : (i64) -> ()
      %6115 = func.call @stack_pop_pointer() : () -> i64
      %6116 = func.call @stack_pop_pointer() : () -> i64
      %6117 = func.call @cc_cons(%6116, %6115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6117) : (i64) -> ()
      %6118 = func.call @stack_pop_pointer() : () -> i64
      %6119 = func.call @stack_pop_pointer() : () -> i64
      %6120 = func.call @cc_cons(%6118, %6119) : (i64, i64) -> i64
      %6121 = llvm.mlir.addressof @str492 : !llvm.ptr
      %6122 = arith.constant 5 : i64
      %6123 = func.call @cc_make_string(%6121, %6122) : (!llvm.ptr, i64) -> i64
      %6124 = func.call @cc_nil_value() : () -> i64
      %6125 = func.call @cc_intern(%6123, %6124) : (i64, i64) -> i64
      %6126 = func.call @cc_nil_value() : () -> i64
      %6127 = func.call @cc_cons(%6125, %6126) : (i64, i64) -> i64
      %6128 = func.call @cc_values_pack(%6127) : (i64) -> i64
      %6129 = func.call @cc_cons(%6125, %6120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6129) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6130 = func.call @stack_pop_pointer() : () -> i64
      %6131 = func.call @stack_pop_pointer() : () -> i64
      %6132 = func.call @cc_cons(%6131, %6130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6132) : (i64) -> ()
      %6133 = func.call @stack_pop_pointer() : () -> i64
      %6134 = func.call @stack_pop_pointer() : () -> i64
      %6135 = func.call @cc_cons(%6134, %6133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6135) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6136 = func.call @stack_pop_pointer() : () -> i64
      %6137 = func.call @stack_pop_pointer() : () -> i64
      %6138 = func.call @cc_cons(%6137, %6136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6138) : (i64) -> ()
      %6139 = func.call @stack_pop_pointer() : () -> i64
      %6140 = func.call @stack_pop_pointer() : () -> i64
      %6141 = func.call @cc_cons(%6140, %6139) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6141) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6142 = func.call @stack_pop_pointer() : () -> i64
      %6143 = func.call @stack_pop_pointer() : () -> i64
      %6144 = func.call @cc_cons(%6143, %6142) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6144) : (i64) -> ()
      %6145 = llvm.mlir.addressof @str493 : !llvm.ptr
      %6146 = arith.constant 19 : i64
      %6147 = func.call @cc_make_string(%6145, %6146) : (!llvm.ptr, i64) -> i64
      %6148 = llvm.mlir.addressof @str494 : !llvm.ptr
      %6149 = arith.constant 11 : i64
      %6150 = func.call @cc_make_string(%6148, %6149) : (!llvm.ptr, i64) -> i64
      %6151 = func.call @cc_intern(%6147, %6150) : (i64, i64) -> i64
      %6152 = func.call @cc_nil_value() : () -> i64
      %6153 = func.call @cc_cons(%6151, %6152) : (i64, i64) -> i64
      %6154 = func.call @cc_values_pack(%6153) : (i64) -> i64
      func.call @stack_push_pointer(%6151) : (i64) -> ()
      %6155 = llvm.mlir.addressof @str495 : !llvm.ptr
      %6156 = arith.constant 2 : i64
      %6157 = func.call @cc_make_string(%6155, %6156) : (!llvm.ptr, i64) -> i64
      %6158 = func.call @cc_nil_value() : () -> i64
      %6159 = func.call @cc_intern(%6157, %6158) : (i64, i64) -> i64
      %6160 = func.call @cc_nil_value() : () -> i64
      %6161 = func.call @cc_cons(%6159, %6160) : (i64, i64) -> i64
      %6162 = func.call @cc_values_pack(%6161) : (i64) -> i64
      func.call @stack_push_pointer(%6159) : (i64) -> ()
      %6163 = llvm.mlir.addressof @str496 : !llvm.ptr
      %6164 = arith.constant 9 : i64
      %6165 = func.call @cc_make_string(%6163, %6164) : (!llvm.ptr, i64) -> i64
      %6166 = func.call @cc_nil_value() : () -> i64
      %6167 = func.call @cc_intern(%6165, %6166) : (i64, i64) -> i64
      %6168 = func.call @cc_nil_value() : () -> i64
      %6169 = func.call @cc_cons(%6167, %6168) : (i64, i64) -> i64
      %6170 = func.call @cc_values_pack(%6169) : (i64) -> i64
      func.call @stack_push_pointer(%6167) : (i64) -> ()
      %6171 = llvm.mlir.addressof @str497 : !llvm.ptr
      %6172 = arith.constant 8 : i64
      %6173 = func.call @cc_make_string(%6171, %6172) : (!llvm.ptr, i64) -> i64
      %6174 = func.call @cc_nil_value() : () -> i64
      %6175 = func.call @cc_intern(%6173, %6174) : (i64, i64) -> i64
      %6176 = func.call @cc_nil_value() : () -> i64
      %6177 = func.call @cc_cons(%6175, %6176) : (i64, i64) -> i64
      %6178 = func.call @cc_values_pack(%6177) : (i64) -> i64
      func.call @stack_push_pointer(%6175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6179 = func.call @stack_pop_pointer() : () -> i64
      %6180 = func.call @stack_pop_pointer() : () -> i64
      %6181 = func.call @cc_cons(%6180, %6179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6181) : (i64) -> ()
      %6182 = func.call @stack_pop_pointer() : () -> i64
      %6183 = func.call @stack_pop_pointer() : () -> i64
      %6184 = func.call @cc_cons(%6183, %6182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6184) : (i64) -> ()
      %6185 = func.call @stack_pop_pointer() : () -> i64
      %6186 = func.call @stack_pop_pointer() : () -> i64
      %6187 = func.call @cc_cons(%6186, %6185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6187) : (i64) -> ()
      %6188 = llvm.mlir.addressof @str498 : !llvm.ptr
      %6189 = arith.constant 7 : i64
      %6190 = func.call @cc_make_string(%6188, %6189) : (!llvm.ptr, i64) -> i64
      %6191 = llvm.mlir.addressof @str499 : !llvm.ptr
      %6192 = arith.constant 11 : i64
      %6193 = func.call @cc_make_string(%6191, %6192) : (!llvm.ptr, i64) -> i64
      %6194 = func.call @cc_intern(%6190, %6193) : (i64, i64) -> i64
      %6195 = func.call @cc_nil_value() : () -> i64
      %6196 = func.call @cc_cons(%6194, %6195) : (i64, i64) -> i64
      %6197 = func.call @cc_values_pack(%6196) : (i64) -> i64
      func.call @stack_push_pointer(%6194) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6198 = llvm.mlir.addressof @str500 : !llvm.ptr
      %6199 = arith.constant 1 : i64
      %6200 = func.call @cc_make_string(%6198, %6199) : (!llvm.ptr, i64) -> i64
      %6201 = func.call @cc_nil_value() : () -> i64
      %6202 = func.call @cc_intern(%6200, %6201) : (i64, i64) -> i64
      %6203 = func.call @cc_nil_value() : () -> i64
      %6204 = func.call @cc_cons(%6202, %6203) : (i64, i64) -> i64
      %6205 = func.call @cc_values_pack(%6204) : (i64) -> i64
      func.call @stack_push_pointer(%6202) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6206 = func.call @stack_pop_pointer() : () -> i64
      %6207 = func.call @stack_pop_pointer() : () -> i64
      %6208 = func.call @cc_cons(%6207, %6206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6208) : (i64) -> ()
      %6209 = func.call @stack_pop_pointer() : () -> i64
      %6210 = func.call @stack_pop_pointer() : () -> i64
      %6211 = func.call @cc_cons(%6210, %6209) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6211) : (i64) -> ()
      %6212 = func.call @stack_pop_pointer() : () -> i64
      %6213 = func.call @stack_pop_pointer() : () -> i64
      %6214 = func.call @cc_cons(%6213, %6212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6214) : (i64) -> ()
      %6215 = llvm.mlir.addressof @str501 : !llvm.ptr
      %6216 = arith.constant 7 : i64
      %6217 = func.call @cc_make_string(%6215, %6216) : (!llvm.ptr, i64) -> i64
      %6218 = llvm.mlir.addressof @str502 : !llvm.ptr
      %6219 = arith.constant 11 : i64
      %6220 = func.call @cc_make_string(%6218, %6219) : (!llvm.ptr, i64) -> i64
      %6221 = func.call @cc_intern(%6217, %6220) : (i64, i64) -> i64
      %6222 = func.call @cc_nil_value() : () -> i64
      %6223 = func.call @cc_cons(%6221, %6222) : (i64, i64) -> i64
      %6224 = func.call @cc_values_pack(%6223) : (i64) -> i64
      func.call @stack_push_pointer(%6221) : (i64) -> ()
      %6225 = llvm.mlir.addressof @str503 : !llvm.ptr
      %6226 = arith.constant 2 : i64
      %6227 = func.call @cc_make_string(%6225, %6226) : (!llvm.ptr, i64) -> i64
      %6228 = func.call @cc_nil_value() : () -> i64
      %6229 = func.call @cc_intern(%6227, %6228) : (i64, i64) -> i64
      %6230 = func.call @cc_nil_value() : () -> i64
      %6231 = func.call @cc_cons(%6229, %6230) : (i64, i64) -> i64
      %6232 = func.call @cc_values_pack(%6231) : (i64) -> i64
      func.call @stack_push_pointer(%6229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6233 = func.call @stack_pop_pointer() : () -> i64
      %6234 = func.call @stack_pop_pointer() : () -> i64
      %6235 = func.call @cc_cons(%6234, %6233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6235) : (i64) -> ()
      %6236 = func.call @stack_pop_pointer() : () -> i64
      %6237 = func.call @stack_pop_pointer() : () -> i64
      %6238 = func.call @cc_cons(%6237, %6236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6238) : (i64) -> ()
      %6239 = llvm.mlir.addressof @str504 : !llvm.ptr
      %6240 = arith.constant 7 : i64
      %6241 = func.call @cc_make_string(%6239, %6240) : (!llvm.ptr, i64) -> i64
      %6242 = llvm.mlir.addressof @str505 : !llvm.ptr
      %6243 = arith.constant 11 : i64
      %6244 = func.call @cc_make_string(%6242, %6243) : (!llvm.ptr, i64) -> i64
      %6245 = func.call @cc_intern(%6241, %6244) : (i64, i64) -> i64
      %6246 = func.call @cc_nil_value() : () -> i64
      %6247 = func.call @cc_cons(%6245, %6246) : (i64, i64) -> i64
      %6248 = func.call @cc_values_pack(%6247) : (i64) -> i64
      func.call @stack_push_pointer(%6245) : (i64) -> ()
      %6249 = llvm.mlir.addressof @str506 : !llvm.ptr
      %6250 = arith.constant 2 : i64
      %6251 = func.call @cc_make_string(%6249, %6250) : (!llvm.ptr, i64) -> i64
      %6252 = func.call @cc_nil_value() : () -> i64
      %6253 = func.call @cc_intern(%6251, %6252) : (i64, i64) -> i64
      %6254 = func.call @cc_nil_value() : () -> i64
      %6255 = func.call @cc_cons(%6253, %6254) : (i64, i64) -> i64
      %6256 = func.call @cc_values_pack(%6255) : (i64) -> i64
      func.call @stack_push_pointer(%6253) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6257 = func.call @stack_pop_pointer() : () -> i64
      %6258 = func.call @stack_pop_pointer() : () -> i64
      %6259 = func.call @cc_cons(%6258, %6257) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6259) : (i64) -> ()
      %6260 = func.call @stack_pop_pointer() : () -> i64
      %6261 = func.call @stack_pop_pointer() : () -> i64
      %6262 = func.call @cc_cons(%6261, %6260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6262) : (i64) -> ()
      %6263 = llvm.mlir.addressof @str507 : !llvm.ptr
      %6264 = arith.constant 6 : i64
      %6265 = func.call @cc_make_string(%6263, %6264) : (!llvm.ptr, i64) -> i64
      %6266 = llvm.mlir.addressof @str508 : !llvm.ptr
      %6267 = arith.constant 11 : i64
      %6268 = func.call @cc_make_string(%6266, %6267) : (!llvm.ptr, i64) -> i64
      %6269 = func.call @cc_intern(%6265, %6268) : (i64, i64) -> i64
      %6270 = func.call @cc_nil_value() : () -> i64
      %6271 = func.call @cc_cons(%6269, %6270) : (i64, i64) -> i64
      %6272 = func.call @cc_values_pack(%6271) : (i64) -> i64
      func.call @stack_push_pointer(%6269) : (i64) -> ()
      %6273 = llvm.mlir.addressof @str509 : !llvm.ptr
      %6274 = arith.constant 7 : i64
      %6275 = func.call @cc_make_string(%6273, %6274) : (!llvm.ptr, i64) -> i64
      %6276 = llvm.mlir.addressof @str510 : !llvm.ptr
      %6277 = arith.constant 11 : i64
      %6278 = func.call @cc_make_string(%6276, %6277) : (!llvm.ptr, i64) -> i64
      %6279 = func.call @cc_intern(%6275, %6278) : (i64, i64) -> i64
      %6280 = func.call @cc_nil_value() : () -> i64
      %6281 = func.call @cc_cons(%6279, %6280) : (i64, i64) -> i64
      %6282 = func.call @cc_values_pack(%6281) : (i64) -> i64
      func.call @stack_push_pointer(%6279) : (i64) -> ()
      %6283 = llvm.mlir.addressof @str511 : !llvm.ptr
      %6284 = arith.constant 1 : i64
      %6285 = func.call @cc_make_string(%6283, %6284) : (!llvm.ptr, i64) -> i64
      %6286 = func.call @cc_nil_value() : () -> i64
      %6287 = func.call @cc_intern(%6285, %6286) : (i64, i64) -> i64
      %6288 = func.call @cc_nil_value() : () -> i64
      %6289 = func.call @cc_cons(%6287, %6288) : (i64, i64) -> i64
      %6290 = func.call @cc_values_pack(%6289) : (i64) -> i64
      func.call @stack_push_pointer(%6287) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6291 = func.call @stack_pop_pointer() : () -> i64
      %6292 = func.call @stack_pop_pointer() : () -> i64
      %6293 = func.call @cc_cons(%6292, %6291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6293) : (i64) -> ()
      %6294 = func.call @stack_pop_pointer() : () -> i64
      %6295 = func.call @stack_pop_pointer() : () -> i64
      %6296 = func.call @cc_cons(%6295, %6294) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6296) : (i64) -> ()
      %6297 = llvm.mlir.addressof @str512 : !llvm.ptr
      %6298 = arith.constant 9 : i64
      %6299 = func.call @cc_make_string(%6297, %6298) : (!llvm.ptr, i64) -> i64
      %6300 = func.call @cc_nil_value() : () -> i64
      %6301 = func.call @cc_intern(%6299, %6300) : (i64, i64) -> i64
      %6302 = func.call @cc_nil_value() : () -> i64
      %6303 = func.call @cc_cons(%6301, %6302) : (i64, i64) -> i64
      %6304 = func.call @cc_values_pack(%6303) : (i64) -> i64
      func.call @stack_push_pointer(%6301) : (i64) -> ()
      %6305 = llvm.mlir.addressof @str513 : !llvm.ptr
      %6306 = arith.constant 8 : i64
      %6307 = func.call @cc_make_string(%6305, %6306) : (!llvm.ptr, i64) -> i64
      %6308 = func.call @cc_nil_value() : () -> i64
      %6309 = func.call @cc_intern(%6307, %6308) : (i64, i64) -> i64
      %6310 = func.call @cc_nil_value() : () -> i64
      %6311 = func.call @cc_cons(%6309, %6310) : (i64, i64) -> i64
      %6312 = func.call @cc_values_pack(%6311) : (i64) -> i64
      func.call @stack_push_pointer(%6309) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6313 = func.call @stack_pop_pointer() : () -> i64
      %6314 = func.call @stack_pop_pointer() : () -> i64
      %6315 = func.call @cc_cons(%6314, %6313) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6315) : (i64) -> ()
      %6316 = func.call @stack_pop_pointer() : () -> i64
      %6317 = func.call @stack_pop_pointer() : () -> i64
      %6318 = func.call @cc_cons(%6317, %6316) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6318) : (i64) -> ()
      %6319 = func.call @stack_pop_pointer() : () -> i64
      %6320 = func.call @stack_pop_pointer() : () -> i64
      %6321 = func.call @cc_cons(%6320, %6319) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6321) : (i64) -> ()
      %6322 = func.call @stack_pop_pointer() : () -> i64
      %6323 = func.call @stack_pop_pointer() : () -> i64
      %6324 = func.call @cc_cons(%6323, %6322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6324) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6325 = func.call @stack_pop_pointer() : () -> i64
      %6326 = func.call @stack_pop_pointer() : () -> i64
      %6327 = func.call @cc_cons(%6326, %6325) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6327) : (i64) -> ()
      %6328 = func.call @stack_pop_pointer() : () -> i64
      %6329 = func.call @stack_pop_pointer() : () -> i64
      %6330 = func.call @cc_cons(%6329, %6328) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6330) : (i64) -> ()
      %6331 = func.call @stack_pop_pointer() : () -> i64
      %6332 = func.call @stack_pop_pointer() : () -> i64
      %6333 = func.call @cc_cons(%6332, %6331) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6333) : (i64) -> ()
      %6334 = func.call @stack_pop_pointer() : () -> i64
      %6335 = func.call @stack_pop_pointer() : () -> i64
      %6336 = func.call @cc_cons(%6335, %6334) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6336) : (i64) -> ()
      %6337 = func.call @stack_pop_pointer() : () -> i64
      %6338 = func.call @stack_pop_pointer() : () -> i64
      %6339 = func.call @cc_cons(%6338, %6337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6339) : (i64) -> ()
      %6340 = func.call @stack_pop_pointer() : () -> i64
      %6341 = func.call @stack_pop_pointer() : () -> i64
      %6342 = func.call @cc_cons(%6341, %6340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6342) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6343 = func.call @stack_pop_pointer() : () -> i64
      %6344 = func.call @stack_pop_pointer() : () -> i64
      %6345 = func.call @cc_cons(%6344, %6343) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6345) : (i64) -> ()
      %6346 = func.call @stack_pop_pointer() : () -> i64
      %6347 = func.call @stack_pop_pointer() : () -> i64
      %6348 = func.call @cc_cons(%6347, %6346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6348) : (i64) -> ()
      %6349 = func.call @stack_pop_pointer() : () -> i64
      %6350 = func.call @stack_pop_pointer() : () -> i64
      %6351 = func.call @cc_cons(%6350, %6349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6351) : (i64) -> ()
      %6352 = func.call @stack_pop_pointer() : () -> i64
      %6503 = llvm.mlir.addressof @str516 : !llvm.ptr
      %6504 = arith.constant 31 : i64
      %6505 = func.call @cc_make_symbol(%6503, %6504) : (!llvm.ptr, i64) -> i64
      %6506 = func.call @cc_persistent_root_value(%6505) : (i64) -> i64
      func.call @stack_push_pointer(%6506) : (i64) -> ()
      %6507 = llvm.mlir.addressof @str517 : !llvm.ptr
      %6508 = arith.constant 37 : i64
      %6509 = func.call @cc_make_symbol(%6507, %6508) : (!llvm.ptr, i64) -> i64
      %6510 = func.call @cc_persistent_root_value(%6509) : (i64) -> i64
      func.call @stack_push_pointer(%6510) : (i64) -> ()
      %6511 = llvm.mlir.addressof @str518 : !llvm.ptr
      %6512 = arith.constant 38 : i64
      %6513 = func.call @cc_make_symbol(%6511, %6512) : (!llvm.ptr, i64) -> i64
      %6514 = func.call @cc_persistent_root_value(%6513) : (i64) -> i64
      func.call @stack_push_pointer(%6514) : (i64) -> ()
      %6515 = arith.constant 275462358040639 : i64
      %6516 = arith.constant 3 : i64
      %6517 = func.call @cc_make_closure(%6515, %6516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6517) : (i64) -> ()
      %6518 = func.call @stack_pop_pointer() : () -> i64
      %6519 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6519) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6520 = func.call @stack_pop_pointer() : () -> i64
      %6521 = func.call @stack_pop_pointer() : () -> i64
      %6522 = func.call @cc_cons(%6521, %6520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6522) : (i64) -> ()
      %6523 = func.call @stack_pop_pointer() : () -> i64
      %6524 = func.call @stack_pop_pointer() : () -> i64
      %6525 = func.call @cc_cons(%6524, %6523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6525) : (i64) -> ()
      %6526 = func.call @stack_pop_pointer() : () -> i64
      %6527 = func.call @stack_pop_pointer() : () -> i64
      %6528 = func.call @cc_cons(%6527, %6526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6528) : (i64) -> ()
      %6529 = func.call @stack_pop_pointer() : () -> i64
      %6530 = llvm.mlir.addressof @str519 : !llvm.ptr
      %6531 = arith.constant 11 : i64
      %6532 = func.call @cc_make_string(%6530, %6531) : (!llvm.ptr, i64) -> i64
      %6533 = llvm.mlir.addressof @str520 : !llvm.ptr
      %6534 = arith.constant 7 : i64
      %6535 = func.call @cc_make_string(%6533, %6534) : (!llvm.ptr, i64) -> i64
      %6536 = func.call @cc_intern(%6532, %6535) : (i64, i64) -> i64
      %6537 = func.call @cc_nil_value() : () -> i64
      %6538 = func.call @cc_cons(%6536, %6537) : (i64, i64) -> i64
      %6539 = func.call @cc_values_pack(%6538) : (i64) -> i64
      func.call @stack_push_pointer(%6536) : (i64) -> ()
      %6540 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6541 = func.call @stack_pop_pointer() : () -> i64
      %6542 = llvm.mlir.addressof @str521 : !llvm.ptr
      %6543 = arith.constant 4 : i64
      %6544 = func.call @cc_make_string(%6542, %6543) : (!llvm.ptr, i64) -> i64
      %6545 = llvm.mlir.addressof @str522 : !llvm.ptr
      %6546 = arith.constant 7 : i64
      %6547 = func.call @cc_make_string(%6545, %6546) : (!llvm.ptr, i64) -> i64
      %6548 = func.call @cc_intern(%6544, %6547) : (i64, i64) -> i64
      %6549 = func.call @cc_nil_value() : () -> i64
      %6550 = func.call @cc_cons(%6548, %6549) : (i64, i64) -> i64
      %6551 = func.call @cc_values_pack(%6550) : (i64) -> i64
      func.call @stack_push_pointer(%6548) : (i64) -> ()
      %6552 = func.call @stack_pop_pointer() : () -> i64
      %6553 = llvm.mlir.addressof @str523 : !llvm.ptr
      %6554 = arith.constant 6 : i64
      %6555 = func.call @cc_make_string(%6553, %6554) : (!llvm.ptr, i64) -> i64
      %6556 = func.call @cc_nil_value() : () -> i64
      %6557 = func.call @cc_intern(%6555, %6556) : (i64, i64) -> i64
      %6558 = func.call @cc_nil_value() : () -> i64
      %6559 = func.call @cc_cons(%6557, %6558) : (i64, i64) -> i64
      %6560 = func.call @cc_values_pack(%6559) : (i64) -> i64
      func.call @stack_push_pointer(%6557) : (i64) -> ()
      %6561 = func.call @stack_pop_pointer() : () -> i64
      %6562 = func.call @cc_nil_value() : () -> i64
      %6563 = func.call @cc_errorp(%6006) : (i64) -> i64
      %6564 = arith.cmpi ne, %6563, %6562 : i64
      %6565 = arith.cmpi eq, %6562, %6562 : i64
      %6566 = arith.andi %6564, %6565 : i1
      %6567 = scf.if %6566 -> (i64) {
        scf.yield %6006 : i64
      } else {
        scf.yield %6562 : i64
      }
      %6568 = func.call @cc_errorp(%6352) : (i64) -> i64
      %6569 = arith.cmpi ne, %6568, %6562 : i64
      %6570 = arith.cmpi eq, %6567, %6562 : i64
      %6571 = arith.andi %6569, %6570 : i1
      %6572 = scf.if %6571 -> (i64) {
        scf.yield %6352 : i64
      } else {
        scf.yield %6567 : i64
      }
      %6573 = func.call @cc_errorp(%6518) : (i64) -> i64
      %6574 = arith.cmpi ne, %6573, %6562 : i64
      %6575 = arith.cmpi eq, %6572, %6562 : i64
      %6576 = arith.andi %6574, %6575 : i1
      %6577 = scf.if %6576 -> (i64) {
        scf.yield %6518 : i64
      } else {
        scf.yield %6572 : i64
      }
      %6578 = func.call @cc_errorp(%6529) : (i64) -> i64
      %6579 = arith.cmpi ne, %6578, %6562 : i64
      %6580 = arith.cmpi eq, %6577, %6562 : i64
      %6581 = arith.andi %6579, %6580 : i1
      %6582 = scf.if %6581 -> (i64) {
        scf.yield %6529 : i64
      } else {
        scf.yield %6577 : i64
      }
      %6583 = func.call @cc_errorp(%6540) : (i64) -> i64
      %6584 = arith.cmpi ne, %6583, %6562 : i64
      %6585 = arith.cmpi eq, %6582, %6562 : i64
      %6586 = arith.andi %6584, %6585 : i1
      %6587 = scf.if %6586 -> (i64) {
        scf.yield %6540 : i64
      } else {
        scf.yield %6582 : i64
      }
      %6588 = func.call @cc_errorp(%6541) : (i64) -> i64
      %6589 = arith.cmpi ne, %6588, %6562 : i64
      %6590 = arith.cmpi eq, %6587, %6562 : i64
      %6591 = arith.andi %6589, %6590 : i1
      %6592 = scf.if %6591 -> (i64) {
        scf.yield %6541 : i64
      } else {
        scf.yield %6587 : i64
      }
      %6593 = func.call @cc_errorp(%6552) : (i64) -> i64
      %6594 = arith.cmpi ne, %6593, %6562 : i64
      %6595 = arith.cmpi eq, %6592, %6562 : i64
      %6596 = arith.andi %6594, %6595 : i1
      %6597 = scf.if %6596 -> (i64) {
        scf.yield %6552 : i64
      } else {
        scf.yield %6592 : i64
      }
      %6598 = func.call @cc_errorp(%6561) : (i64) -> i64
      %6599 = arith.cmpi ne, %6598, %6562 : i64
      %6600 = arith.cmpi eq, %6597, %6562 : i64
      %6601 = arith.andi %6599, %6600 : i1
      %6602 = scf.if %6601 -> (i64) {
        scf.yield %6561 : i64
      } else {
        scf.yield %6597 : i64
      }
      %6603 = arith.cmpi ne, %6602, %6562 : i64
      scf.if %6603 {
        func.call @stack_push_pointer(%6602) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6006) : (i64) -> ()
        func.call @stack_push_pointer(%6352) : (i64) -> ()
        func.call @stack_push_pointer(%6518) : (i64) -> ()
        func.call @stack_push_pointer(%6529) : (i64) -> ()
        func.call @stack_push_pointer(%6540) : (i64) -> ()
        func.call @stack_push_pointer(%6541) : (i64) -> ()
        func.call @stack_push_pointer(%6552) : (i64) -> ()
        func.call @stack_push_pointer(%6561) : (i64) -> ()
        %6604 = llvm.mlir.addressof @str524 : !llvm.ptr
        %6605 = func.call @cc_make_function_ref_const(%6604) : (!llvm.ptr) -> i64
        %6606 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6605, %6606) : (i64, i64) -> ()
      }
      %6607 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6607 : i64
    }
    %6608 = func.call @cc_nil_value() : () -> i64
    %6609 = func.call @cc_errorp(%5997) : (i64) -> i64
    %6610 = arith.cmpi ne, %6609, %6608 : i64
    %6611 = scf.if %6610 -> (i64) {
      scf.yield %5997 : i64
    } else {
      %6612 = llvm.mlir.addressof @str525 : !llvm.ptr
      %6613 = arith.constant 10 : i64
      %6614 = func.call @cc_make_string(%6612, %6613) : (!llvm.ptr, i64) -> i64
      %6615 = func.call @cc_nil_value() : () -> i64
      %6616 = func.call @cc_intern(%6614, %6615) : (i64, i64) -> i64
      %6617 = func.call @cc_nil_value() : () -> i64
      %6618 = func.call @cc_cons(%6616, %6617) : (i64, i64) -> i64
      %6619 = func.call @cc_values_pack(%6618) : (i64) -> i64
      func.call @stack_push_pointer(%6616) : (i64) -> ()
      %6620 = func.call @stack_pop_pointer() : () -> i64
      %6621 = llvm.mlir.addressof @str526 : !llvm.ptr
      %6622 = arith.constant 3 : i64
      %6623 = func.call @cc_make_string(%6621, %6622) : (!llvm.ptr, i64) -> i64
      %6624 = func.call @cc_nil_value() : () -> i64
      %6625 = func.call @cc_intern(%6623, %6624) : (i64, i64) -> i64
      %6626 = func.call @cc_nil_value() : () -> i64
      %6627 = func.call @cc_cons(%6625, %6626) : (i64, i64) -> i64
      %6628 = func.call @cc_values_pack(%6627) : (i64) -> i64
      func.call @stack_push_pointer(%6625) : (i64) -> ()
      %6629 = llvm.mlir.addressof @str527 : !llvm.ptr
      %6630 = arith.constant 1 : i64
      %6631 = func.call @cc_make_string(%6629, %6630) : (!llvm.ptr, i64) -> i64
      %6632 = func.call @cc_nil_value() : () -> i64
      %6633 = func.call @cc_intern(%6631, %6632) : (i64, i64) -> i64
      %6634 = func.call @cc_nil_value() : () -> i64
      %6635 = func.call @cc_cons(%6633, %6634) : (i64, i64) -> i64
      %6636 = func.call @cc_values_pack(%6635) : (i64) -> i64
      func.call @stack_push_pointer(%6633) : (i64) -> ()
      %6637 = llvm.mlir.addressof @str528 : !llvm.ptr
      %6638 = arith.constant 11 : i64
      %6639 = func.call @cc_make_string(%6637, %6638) : (!llvm.ptr, i64) -> i64
      %6640 = llvm.mlir.addressof @str529 : !llvm.ptr
      %6641 = arith.constant 3 : i64
      %6642 = func.call @cc_make_string(%6640, %6641) : (!llvm.ptr, i64) -> i64
      %6643 = func.call @cc_intern(%6639, %6642) : (i64, i64) -> i64
      %6644 = func.call @cc_nil_value() : () -> i64
      %6645 = func.call @cc_cons(%6643, %6644) : (i64, i64) -> i64
      %6646 = func.call @cc_values_pack(%6645) : (i64) -> i64
      func.call @stack_push_pointer(%6643) : (i64) -> ()
      %6647 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6647) : (i64) -> ()
      %6648 = llvm.mlir.addressof @str530 : !llvm.ptr
      %6649 = arith.constant 6 : i64
      %6650 = func.call @cc_make_string(%6648, %6649) : (!llvm.ptr, i64) -> i64
      %6651 = llvm.mlir.addressof @str531 : !llvm.ptr
      %6652 = arith.constant 11 : i64
      %6653 = func.call @cc_make_string(%6651, %6652) : (!llvm.ptr, i64) -> i64
      %6654 = func.call @cc_intern(%6650, %6653) : (i64, i64) -> i64
      %6655 = func.call @cc_nil_value() : () -> i64
      %6656 = func.call @cc_cons(%6654, %6655) : (i64, i64) -> i64
      %6657 = func.call @cc_values_pack(%6656) : (i64) -> i64
      func.call @stack_push_pointer(%6654) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6658 = llvm.mlir.addressof @str532 : !llvm.ptr
      %6659 = arith.constant 3 : i64
      %6660 = func.call @cc_make_string(%6658, %6659) : (!llvm.ptr, i64) -> i64
      %6661 = llvm.mlir.addressof @str533 : !llvm.ptr
      %6662 = arith.constant 11 : i64
      %6663 = func.call @cc_make_string(%6661, %6662) : (!llvm.ptr, i64) -> i64
      %6664 = func.call @cc_intern(%6660, %6663) : (i64, i64) -> i64
      %6665 = func.call @cc_nil_value() : () -> i64
      %6666 = func.call @cc_cons(%6664, %6665) : (i64, i64) -> i64
      %6667 = func.call @cc_values_pack(%6666) : (i64) -> i64
      func.call @stack_push_pointer(%6664) : (i64) -> ()
      %6668 = llvm.mlir.addressof @str534 : !llvm.ptr
      %6669 = arith.constant 2 : i64
      %6670 = func.call @cc_make_string(%6668, %6669) : (!llvm.ptr, i64) -> i64
      %6671 = func.call @cc_nil_value() : () -> i64
      %6672 = func.call @cc_intern(%6670, %6671) : (i64, i64) -> i64
      %6673 = func.call @cc_nil_value() : () -> i64
      %6674 = func.call @cc_cons(%6672, %6673) : (i64, i64) -> i64
      %6675 = func.call @cc_values_pack(%6674) : (i64) -> i64
      func.call @stack_push_pointer(%6672) : (i64) -> ()
      %6676 = llvm.mlir.addressof @str535 : !llvm.ptr
      %6677 = arith.constant 3 : i64
      %6678 = func.call @cc_make_string(%6676, %6677) : (!llvm.ptr, i64) -> i64
      %6679 = llvm.mlir.addressof @str536 : !llvm.ptr
      %6680 = arith.constant 11 : i64
      %6681 = func.call @cc_make_string(%6679, %6680) : (!llvm.ptr, i64) -> i64
      %6682 = func.call @cc_intern(%6678, %6681) : (i64, i64) -> i64
      %6683 = func.call @cc_nil_value() : () -> i64
      %6684 = func.call @cc_cons(%6682, %6683) : (i64, i64) -> i64
      %6685 = func.call @cc_values_pack(%6684) : (i64) -> i64
      func.call @stack_push_pointer(%6682) : (i64) -> ()
      %6686 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6687 = arith.constant 1 : i64
      %6688 = func.call @cc_make_string(%6686, %6687) : (!llvm.ptr, i64) -> i64
      %6689 = func.call @cc_nil_value() : () -> i64
      %6690 = func.call @cc_intern(%6688, %6689) : (i64, i64) -> i64
      %6691 = func.call @cc_nil_value() : () -> i64
      %6692 = func.call @cc_cons(%6690, %6691) : (i64, i64) -> i64
      %6693 = func.call @cc_values_pack(%6692) : (i64) -> i64
      func.call @stack_push_pointer(%6690) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6694 = func.call @stack_pop_pointer() : () -> i64
      %6695 = func.call @stack_pop_pointer() : () -> i64
      %6696 = func.call @cc_cons(%6695, %6694) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6696) : (i64) -> ()
      %6697 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6698 = arith.constant 4 : i64
      %6699 = func.call @cc_make_string(%6697, %6698) : (!llvm.ptr, i64) -> i64
      %6700 = llvm.mlir.addressof @str539 : !llvm.ptr
      %6701 = arith.constant 11 : i64
      %6702 = func.call @cc_make_string(%6700, %6701) : (!llvm.ptr, i64) -> i64
      %6703 = func.call @cc_intern(%6699, %6702) : (i64, i64) -> i64
      %6704 = func.call @cc_nil_value() : () -> i64
      %6705 = func.call @cc_cons(%6703, %6704) : (i64, i64) -> i64
      %6706 = func.call @cc_values_pack(%6705) : (i64) -> i64
      func.call @stack_push_pointer(%6703) : (i64) -> ()
      %6707 = llvm.mlir.addressof @str540 : !llvm.ptr
      %6708 = arith.constant 1 : i64
      %6709 = func.call @cc_make_string(%6707, %6708) : (!llvm.ptr, i64) -> i64
      %6710 = func.call @cc_nil_value() : () -> i64
      %6711 = func.call @cc_intern(%6709, %6710) : (i64, i64) -> i64
      %6712 = func.call @cc_nil_value() : () -> i64
      %6713 = func.call @cc_cons(%6711, %6712) : (i64, i64) -> i64
      %6714 = func.call @cc_values_pack(%6713) : (i64) -> i64
      func.call @stack_push_pointer(%6711) : (i64) -> ()
      %6715 = llvm.mlir.addressof @str541 : !llvm.ptr
      %6716 = arith.constant 1 : i64
      %6717 = func.call @cc_make_string(%6715, %6716) : (!llvm.ptr, i64) -> i64
      %6718 = func.call @cc_nil_value() : () -> i64
      %6719 = func.call @cc_intern(%6717, %6718) : (i64, i64) -> i64
      %6720 = func.call @cc_nil_value() : () -> i64
      %6721 = func.call @cc_cons(%6719, %6720) : (i64, i64) -> i64
      %6722 = func.call @cc_values_pack(%6721) : (i64) -> i64
      func.call @stack_push_pointer(%6719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6723 = func.call @stack_pop_pointer() : () -> i64
      %6724 = func.call @stack_pop_pointer() : () -> i64
      %6725 = func.call @cc_cons(%6724, %6723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6725) : (i64) -> ()
      %6726 = llvm.mlir.addressof @str542 : !llvm.ptr
      %6727 = arith.constant 3 : i64
      %6728 = func.call @cc_make_string(%6726, %6727) : (!llvm.ptr, i64) -> i64
      %6729 = llvm.mlir.addressof @str543 : !llvm.ptr
      %6730 = arith.constant 11 : i64
      %6731 = func.call @cc_make_string(%6729, %6730) : (!llvm.ptr, i64) -> i64
      %6732 = func.call @cc_intern(%6728, %6731) : (i64, i64) -> i64
      %6733 = func.call @cc_nil_value() : () -> i64
      %6734 = func.call @cc_cons(%6732, %6733) : (i64, i64) -> i64
      %6735 = func.call @cc_values_pack(%6734) : (i64) -> i64
      func.call @stack_push_pointer(%6732) : (i64) -> ()
      %6736 = llvm.mlir.addressof @str544 : !llvm.ptr
      %6737 = arith.constant 1 : i64
      %6738 = func.call @cc_make_string(%6736, %6737) : (!llvm.ptr, i64) -> i64
      %6739 = func.call @cc_nil_value() : () -> i64
      %6740 = func.call @cc_intern(%6738, %6739) : (i64, i64) -> i64
      %6741 = func.call @cc_nil_value() : () -> i64
      %6742 = func.call @cc_cons(%6740, %6741) : (i64, i64) -> i64
      %6743 = func.call @cc_values_pack(%6742) : (i64) -> i64
      func.call @stack_push_pointer(%6740) : (i64) -> ()
      %6744 = llvm.mlir.addressof @str545 : !llvm.ptr
      %6745 = arith.constant 1 : i64
      %6746 = func.call @cc_make_string(%6744, %6745) : (!llvm.ptr, i64) -> i64
      %6747 = func.call @cc_nil_value() : () -> i64
      %6748 = func.call @cc_intern(%6746, %6747) : (i64, i64) -> i64
      %6749 = func.call @cc_nil_value() : () -> i64
      %6750 = func.call @cc_cons(%6748, %6749) : (i64, i64) -> i64
      %6751 = func.call @cc_values_pack(%6750) : (i64) -> i64
      func.call @stack_push_pointer(%6748) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6752 = func.call @stack_pop_pointer() : () -> i64
      %6753 = func.call @stack_pop_pointer() : () -> i64
      %6754 = func.call @cc_cons(%6753, %6752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6754) : (i64) -> ()
      %6755 = func.call @stack_pop_pointer() : () -> i64
      %6756 = func.call @stack_pop_pointer() : () -> i64
      %6757 = func.call @cc_cons(%6756, %6755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6757) : (i64) -> ()
      %6758 = func.call @stack_pop_pointer() : () -> i64
      %6759 = func.call @stack_pop_pointer() : () -> i64
      %6760 = func.call @cc_cons(%6759, %6758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6760) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6761 = func.call @stack_pop_pointer() : () -> i64
      %6762 = func.call @stack_pop_pointer() : () -> i64
      %6763 = func.call @cc_cons(%6762, %6761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6763) : (i64) -> ()
      %6764 = func.call @stack_pop_pointer() : () -> i64
      %6765 = func.call @stack_pop_pointer() : () -> i64
      %6766 = func.call @cc_cons(%6765, %6764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6766) : (i64) -> ()
      %6767 = func.call @stack_pop_pointer() : () -> i64
      %6768 = func.call @stack_pop_pointer() : () -> i64
      %6769 = func.call @cc_cons(%6768, %6767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6770 = func.call @stack_pop_pointer() : () -> i64
      %6771 = func.call @stack_pop_pointer() : () -> i64
      %6772 = func.call @cc_cons(%6771, %6770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6772) : (i64) -> ()
      %6773 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6774 = arith.constant 8 : i64
      %6775 = func.call @cc_make_string(%6773, %6774) : (!llvm.ptr, i64) -> i64
      %6776 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6777 = arith.constant 11 : i64
      %6778 = func.call @cc_make_string(%6776, %6777) : (!llvm.ptr, i64) -> i64
      %6779 = func.call @cc_intern(%6775, %6778) : (i64, i64) -> i64
      %6780 = func.call @cc_nil_value() : () -> i64
      %6781 = func.call @cc_cons(%6779, %6780) : (i64, i64) -> i64
      %6782 = func.call @cc_values_pack(%6781) : (i64) -> i64
      func.call @stack_push_pointer(%6779) : (i64) -> ()
      %6783 = llvm.mlir.addressof @str548 : !llvm.ptr
      %6784 = arith.constant 1 : i64
      %6785 = func.call @cc_make_string(%6783, %6784) : (!llvm.ptr, i64) -> i64
      %6786 = func.call @cc_nil_value() : () -> i64
      %6787 = func.call @cc_intern(%6785, %6786) : (i64, i64) -> i64
      %6788 = func.call @cc_nil_value() : () -> i64
      %6789 = func.call @cc_cons(%6787, %6788) : (i64, i64) -> i64
      %6790 = func.call @cc_values_pack(%6789) : (i64) -> i64
      func.call @stack_push_pointer(%6787) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6791 = func.call @stack_pop_pointer() : () -> i64
      %6792 = func.call @stack_pop_pointer() : () -> i64
      %6793 = func.call @cc_cons(%6792, %6791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6793) : (i64) -> ()
      %6794 = func.call @stack_pop_pointer() : () -> i64
      %6795 = func.call @stack_pop_pointer() : () -> i64
      %6796 = func.call @cc_cons(%6795, %6794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6796) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6797 = func.call @stack_pop_pointer() : () -> i64
      %6798 = func.call @stack_pop_pointer() : () -> i64
      %6799 = func.call @cc_cons(%6798, %6797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6799) : (i64) -> ()
      %6800 = func.call @stack_pop_pointer() : () -> i64
      %6801 = func.call @stack_pop_pointer() : () -> i64
      %6802 = func.call @cc_cons(%6801, %6800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6802) : (i64) -> ()
      %6803 = func.call @stack_pop_pointer() : () -> i64
      %6804 = func.call @stack_pop_pointer() : () -> i64
      %6805 = func.call @cc_cons(%6804, %6803) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6805) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6806 = func.call @stack_pop_pointer() : () -> i64
      %6807 = func.call @stack_pop_pointer() : () -> i64
      %6808 = func.call @cc_cons(%6807, %6806) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6808) : (i64) -> ()
      %6809 = func.call @stack_pop_pointer() : () -> i64
      %6810 = func.call @stack_pop_pointer() : () -> i64
      %6811 = func.call @cc_cons(%6810, %6809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6811) : (i64) -> ()
      %6812 = func.call @stack_pop_pointer() : () -> i64
      %6813 = func.call @stack_pop_pointer() : () -> i64
      %6814 = func.call @cc_cons(%6813, %6812) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6814) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6815 = func.call @stack_pop_pointer() : () -> i64
      %6816 = func.call @stack_pop_pointer() : () -> i64
      %6817 = func.call @cc_cons(%6816, %6815) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6817) : (i64) -> ()
      %6818 = func.call @stack_pop_pointer() : () -> i64
      %6819 = func.call @stack_pop_pointer() : () -> i64
      %6820 = func.call @cc_cons(%6819, %6818) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6820) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6821 = func.call @stack_pop_pointer() : () -> i64
      %6822 = func.call @stack_pop_pointer() : () -> i64
      %6823 = func.call @cc_cons(%6822, %6821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6823) : (i64) -> ()
      %6824 = llvm.mlir.addressof @str549 : !llvm.ptr
      %6825 = arith.constant 2 : i64
      %6826 = func.call @cc_make_string(%6824, %6825) : (!llvm.ptr, i64) -> i64
      %6827 = func.call @cc_nil_value() : () -> i64
      %6828 = func.call @cc_intern(%6826, %6827) : (i64, i64) -> i64
      %6829 = func.call @cc_nil_value() : () -> i64
      %6830 = func.call @cc_cons(%6828, %6829) : (i64, i64) -> i64
      %6831 = func.call @cc_values_pack(%6830) : (i64) -> i64
      func.call @stack_push_pointer(%6828) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6832 = func.call @stack_pop_pointer() : () -> i64
      %6833 = func.call @stack_pop_pointer() : () -> i64
      %6834 = func.call @cc_cons(%6833, %6832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6834) : (i64) -> ()
      %6835 = func.call @stack_pop_pointer() : () -> i64
      %6836 = func.call @stack_pop_pointer() : () -> i64
      %6837 = func.call @cc_cons(%6836, %6835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6837) : (i64) -> ()
      %6838 = func.call @stack_pop_pointer() : () -> i64
      %6839 = func.call @stack_pop_pointer() : () -> i64
      %6840 = func.call @cc_cons(%6839, %6838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6840) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6841 = func.call @stack_pop_pointer() : () -> i64
      %6842 = func.call @stack_pop_pointer() : () -> i64
      %6843 = func.call @cc_cons(%6842, %6841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6843) : (i64) -> ()
      %6844 = func.call @stack_pop_pointer() : () -> i64
      %6845 = func.call @stack_pop_pointer() : () -> i64
      %6846 = func.call @cc_cons(%6845, %6844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6846) : (i64) -> ()
      %6847 = func.call @stack_pop_pointer() : () -> i64
      %6848 = func.call @stack_pop_pointer() : () -> i64
      %6849 = func.call @cc_cons(%6848, %6847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6849) : (i64) -> ()
      %6850 = func.call @stack_pop_pointer() : () -> i64
      %6851 = func.call @stack_pop_pointer() : () -> i64
      %6852 = func.call @cc_cons(%6850, %6851) : (i64, i64) -> i64
      %6853 = llvm.mlir.addressof @str550 : !llvm.ptr
      %6854 = arith.constant 5 : i64
      %6855 = func.call @cc_make_string(%6853, %6854) : (!llvm.ptr, i64) -> i64
      %6856 = func.call @cc_nil_value() : () -> i64
      %6857 = func.call @cc_intern(%6855, %6856) : (i64, i64) -> i64
      %6858 = func.call @cc_nil_value() : () -> i64
      %6859 = func.call @cc_cons(%6857, %6858) : (i64, i64) -> i64
      %6860 = func.call @cc_values_pack(%6859) : (i64) -> i64
      %6861 = func.call @cc_cons(%6857, %6852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6861) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6862 = func.call @stack_pop_pointer() : () -> i64
      %6863 = func.call @stack_pop_pointer() : () -> i64
      %6864 = func.call @cc_cons(%6863, %6862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6864) : (i64) -> ()
      %6865 = func.call @stack_pop_pointer() : () -> i64
      %6866 = func.call @stack_pop_pointer() : () -> i64
      %6867 = func.call @cc_cons(%6866, %6865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6867) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6868 = func.call @stack_pop_pointer() : () -> i64
      %6869 = func.call @stack_pop_pointer() : () -> i64
      %6870 = func.call @cc_cons(%6869, %6868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6870) : (i64) -> ()
      %6871 = func.call @stack_pop_pointer() : () -> i64
      %6872 = func.call @stack_pop_pointer() : () -> i64
      %6873 = func.call @cc_cons(%6872, %6871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6873) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6874 = func.call @stack_pop_pointer() : () -> i64
      %6875 = func.call @stack_pop_pointer() : () -> i64
      %6876 = func.call @cc_cons(%6875, %6874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6876) : (i64) -> ()
      %6877 = llvm.mlir.addressof @str551 : !llvm.ptr
      %6878 = arith.constant 19 : i64
      %6879 = func.call @cc_make_string(%6877, %6878) : (!llvm.ptr, i64) -> i64
      %6880 = llvm.mlir.addressof @str552 : !llvm.ptr
      %6881 = arith.constant 11 : i64
      %6882 = func.call @cc_make_string(%6880, %6881) : (!llvm.ptr, i64) -> i64
      %6883 = func.call @cc_intern(%6879, %6882) : (i64, i64) -> i64
      %6884 = func.call @cc_nil_value() : () -> i64
      %6885 = func.call @cc_cons(%6883, %6884) : (i64, i64) -> i64
      %6886 = func.call @cc_values_pack(%6885) : (i64) -> i64
      func.call @stack_push_pointer(%6883) : (i64) -> ()
      %6887 = llvm.mlir.addressof @str553 : !llvm.ptr
      %6888 = arith.constant 2 : i64
      %6889 = func.call @cc_make_string(%6887, %6888) : (!llvm.ptr, i64) -> i64
      %6890 = func.call @cc_nil_value() : () -> i64
      %6891 = func.call @cc_intern(%6889, %6890) : (i64, i64) -> i64
      %6892 = func.call @cc_nil_value() : () -> i64
      %6893 = func.call @cc_cons(%6891, %6892) : (i64, i64) -> i64
      %6894 = func.call @cc_values_pack(%6893) : (i64) -> i64
      func.call @stack_push_pointer(%6891) : (i64) -> ()
      %6895 = llvm.mlir.addressof @str554 : !llvm.ptr
      %6896 = arith.constant 9 : i64
      %6897 = func.call @cc_make_string(%6895, %6896) : (!llvm.ptr, i64) -> i64
      %6898 = func.call @cc_nil_value() : () -> i64
      %6899 = func.call @cc_intern(%6897, %6898) : (i64, i64) -> i64
      %6900 = func.call @cc_nil_value() : () -> i64
      %6901 = func.call @cc_cons(%6899, %6900) : (i64, i64) -> i64
      %6902 = func.call @cc_values_pack(%6901) : (i64) -> i64
      func.call @stack_push_pointer(%6899) : (i64) -> ()
      %6903 = llvm.mlir.addressof @str555 : !llvm.ptr
      %6904 = arith.constant 8 : i64
      %6905 = func.call @cc_make_string(%6903, %6904) : (!llvm.ptr, i64) -> i64
      %6906 = func.call @cc_nil_value() : () -> i64
      %6907 = func.call @cc_intern(%6905, %6906) : (i64, i64) -> i64
      %6908 = func.call @cc_nil_value() : () -> i64
      %6909 = func.call @cc_cons(%6907, %6908) : (i64, i64) -> i64
      %6910 = func.call @cc_values_pack(%6909) : (i64) -> i64
      func.call @stack_push_pointer(%6907) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6911 = func.call @stack_pop_pointer() : () -> i64
      %6912 = func.call @stack_pop_pointer() : () -> i64
      %6913 = func.call @cc_cons(%6912, %6911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6913) : (i64) -> ()
      %6914 = func.call @stack_pop_pointer() : () -> i64
      %6915 = func.call @stack_pop_pointer() : () -> i64
      %6916 = func.call @cc_cons(%6915, %6914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6916) : (i64) -> ()
      %6917 = func.call @stack_pop_pointer() : () -> i64
      %6918 = func.call @stack_pop_pointer() : () -> i64
      %6919 = func.call @cc_cons(%6918, %6917) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6919) : (i64) -> ()
      %6920 = llvm.mlir.addressof @str556 : !llvm.ptr
      %6921 = arith.constant 7 : i64
      %6922 = func.call @cc_make_string(%6920, %6921) : (!llvm.ptr, i64) -> i64
      %6923 = llvm.mlir.addressof @str557 : !llvm.ptr
      %6924 = arith.constant 11 : i64
      %6925 = func.call @cc_make_string(%6923, %6924) : (!llvm.ptr, i64) -> i64
      %6926 = func.call @cc_intern(%6922, %6925) : (i64, i64) -> i64
      %6927 = func.call @cc_nil_value() : () -> i64
      %6928 = func.call @cc_cons(%6926, %6927) : (i64, i64) -> i64
      %6929 = func.call @cc_values_pack(%6928) : (i64) -> i64
      func.call @stack_push_pointer(%6926) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6930 = llvm.mlir.addressof @str558 : !llvm.ptr
      %6931 = arith.constant 1 : i64
      %6932 = func.call @cc_make_string(%6930, %6931) : (!llvm.ptr, i64) -> i64
      %6933 = func.call @cc_nil_value() : () -> i64
      %6934 = func.call @cc_intern(%6932, %6933) : (i64, i64) -> i64
      %6935 = func.call @cc_nil_value() : () -> i64
      %6936 = func.call @cc_cons(%6934, %6935) : (i64, i64) -> i64
      %6937 = func.call @cc_values_pack(%6936) : (i64) -> i64
      func.call @stack_push_pointer(%6934) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6938 = func.call @stack_pop_pointer() : () -> i64
      %6939 = func.call @stack_pop_pointer() : () -> i64
      %6940 = func.call @cc_cons(%6939, %6938) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6940) : (i64) -> ()
      %6941 = func.call @stack_pop_pointer() : () -> i64
      %6942 = func.call @stack_pop_pointer() : () -> i64
      %6943 = func.call @cc_cons(%6942, %6941) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6943) : (i64) -> ()
      %6944 = func.call @stack_pop_pointer() : () -> i64
      %6945 = func.call @stack_pop_pointer() : () -> i64
      %6946 = func.call @cc_cons(%6945, %6944) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6946) : (i64) -> ()
      %6947 = llvm.mlir.addressof @str559 : !llvm.ptr
      %6948 = arith.constant 7 : i64
      %6949 = func.call @cc_make_string(%6947, %6948) : (!llvm.ptr, i64) -> i64
      %6950 = llvm.mlir.addressof @str560 : !llvm.ptr
      %6951 = arith.constant 11 : i64
      %6952 = func.call @cc_make_string(%6950, %6951) : (!llvm.ptr, i64) -> i64
      %6953 = func.call @cc_intern(%6949, %6952) : (i64, i64) -> i64
      %6954 = func.call @cc_nil_value() : () -> i64
      %6955 = func.call @cc_cons(%6953, %6954) : (i64, i64) -> i64
      %6956 = func.call @cc_values_pack(%6955) : (i64) -> i64
      func.call @stack_push_pointer(%6953) : (i64) -> ()
      %6957 = llvm.mlir.addressof @str561 : !llvm.ptr
      %6958 = arith.constant 6 : i64
      %6959 = func.call @cc_make_string(%6957, %6958) : (!llvm.ptr, i64) -> i64
      %6960 = llvm.mlir.addressof @str562 : !llvm.ptr
      %6961 = arith.constant 11 : i64
      %6962 = func.call @cc_make_string(%6960, %6961) : (!llvm.ptr, i64) -> i64
      %6963 = func.call @cc_intern(%6959, %6962) : (i64, i64) -> i64
      %6964 = func.call @cc_nil_value() : () -> i64
      %6965 = func.call @cc_cons(%6963, %6964) : (i64, i64) -> i64
      %6966 = func.call @cc_values_pack(%6965) : (i64) -> i64
      func.call @stack_push_pointer(%6963) : (i64) -> ()
      %6967 = llvm.mlir.addressof @str563 : !llvm.ptr
      %6968 = arith.constant 2 : i64
      %6969 = func.call @cc_make_string(%6967, %6968) : (!llvm.ptr, i64) -> i64
      %6970 = func.call @cc_nil_value() : () -> i64
      %6971 = func.call @cc_intern(%6969, %6970) : (i64, i64) -> i64
      %6972 = func.call @cc_nil_value() : () -> i64
      %6973 = func.call @cc_cons(%6971, %6972) : (i64, i64) -> i64
      %6974 = func.call @cc_values_pack(%6973) : (i64) -> i64
      func.call @stack_push_pointer(%6971) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6975 = func.call @stack_pop_pointer() : () -> i64
      %6976 = func.call @stack_pop_pointer() : () -> i64
      %6977 = func.call @cc_cons(%6976, %6975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6977) : (i64) -> ()
      %6978 = func.call @stack_pop_pointer() : () -> i64
      %6979 = func.call @stack_pop_pointer() : () -> i64
      %6980 = func.call @cc_cons(%6979, %6978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6980) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6981 = func.call @stack_pop_pointer() : () -> i64
      %6982 = func.call @stack_pop_pointer() : () -> i64
      %6983 = func.call @cc_cons(%6982, %6981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6983) : (i64) -> ()
      %6984 = func.call @stack_pop_pointer() : () -> i64
      %6985 = func.call @stack_pop_pointer() : () -> i64
      %6986 = func.call @cc_cons(%6985, %6984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6986) : (i64) -> ()
      %6987 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6988 = arith.constant 6 : i64
      %6989 = func.call @cc_make_string(%6987, %6988) : (!llvm.ptr, i64) -> i64
      %6990 = llvm.mlir.addressof @str565 : !llvm.ptr
      %6991 = arith.constant 11 : i64
      %6992 = func.call @cc_make_string(%6990, %6991) : (!llvm.ptr, i64) -> i64
      %6993 = func.call @cc_intern(%6989, %6992) : (i64, i64) -> i64
      %6994 = func.call @cc_nil_value() : () -> i64
      %6995 = func.call @cc_cons(%6993, %6994) : (i64, i64) -> i64
      %6996 = func.call @cc_values_pack(%6995) : (i64) -> i64
      func.call @stack_push_pointer(%6993) : (i64) -> ()
      %6997 = llvm.mlir.addressof @str566 : !llvm.ptr
      %6998 = arith.constant 9 : i64
      %6999 = func.call @cc_make_string(%6997, %6998) : (!llvm.ptr, i64) -> i64
      %7000 = func.call @cc_nil_value() : () -> i64
      %7001 = func.call @cc_intern(%6999, %7000) : (i64, i64) -> i64
      %7002 = func.call @cc_nil_value() : () -> i64
      %7003 = func.call @cc_cons(%7001, %7002) : (i64, i64) -> i64
      %7004 = func.call @cc_values_pack(%7003) : (i64) -> i64
      func.call @stack_push_pointer(%7001) : (i64) -> ()
      %7005 = llvm.mlir.addressof @str567 : !llvm.ptr
      %7006 = arith.constant 8 : i64
      %7007 = func.call @cc_make_string(%7005, %7006) : (!llvm.ptr, i64) -> i64
      %7008 = func.call @cc_nil_value() : () -> i64
      %7009 = func.call @cc_intern(%7007, %7008) : (i64, i64) -> i64
      %7010 = func.call @cc_nil_value() : () -> i64
      %7011 = func.call @cc_cons(%7009, %7010) : (i64, i64) -> i64
      %7012 = func.call @cc_values_pack(%7011) : (i64) -> i64
      func.call @stack_push_pointer(%7009) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7013 = func.call @stack_pop_pointer() : () -> i64
      %7014 = func.call @stack_pop_pointer() : () -> i64
      %7015 = func.call @cc_cons(%7014, %7013) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7015) : (i64) -> ()
      %7016 = func.call @stack_pop_pointer() : () -> i64
      %7017 = func.call @stack_pop_pointer() : () -> i64
      %7018 = func.call @cc_cons(%7017, %7016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7018) : (i64) -> ()
      %7019 = func.call @stack_pop_pointer() : () -> i64
      %7020 = func.call @stack_pop_pointer() : () -> i64
      %7021 = func.call @cc_cons(%7020, %7019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7021) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7022 = func.call @stack_pop_pointer() : () -> i64
      %7023 = func.call @stack_pop_pointer() : () -> i64
      %7024 = func.call @cc_cons(%7023, %7022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7024) : (i64) -> ()
      %7025 = func.call @stack_pop_pointer() : () -> i64
      %7026 = func.call @stack_pop_pointer() : () -> i64
      %7027 = func.call @cc_cons(%7026, %7025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7027) : (i64) -> ()
      %7028 = func.call @stack_pop_pointer() : () -> i64
      %7029 = func.call @stack_pop_pointer() : () -> i64
      %7030 = func.call @cc_cons(%7029, %7028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7030) : (i64) -> ()
      %7031 = func.call @stack_pop_pointer() : () -> i64
      %7032 = func.call @stack_pop_pointer() : () -> i64
      %7033 = func.call @cc_cons(%7032, %7031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7033) : (i64) -> ()
      %7034 = func.call @stack_pop_pointer() : () -> i64
      %7035 = func.call @stack_pop_pointer() : () -> i64
      %7036 = func.call @cc_cons(%7035, %7034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7036) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7037 = func.call @stack_pop_pointer() : () -> i64
      %7038 = func.call @stack_pop_pointer() : () -> i64
      %7039 = func.call @cc_cons(%7038, %7037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7039) : (i64) -> ()
      %7040 = func.call @stack_pop_pointer() : () -> i64
      %7041 = func.call @stack_pop_pointer() : () -> i64
      %7042 = func.call @cc_cons(%7041, %7040) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7042) : (i64) -> ()
      %7043 = func.call @stack_pop_pointer() : () -> i64
      %7044 = func.call @stack_pop_pointer() : () -> i64
      %7045 = func.call @cc_cons(%7044, %7043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7045) : (i64) -> ()
      %7046 = func.call @stack_pop_pointer() : () -> i64
      %7146 = llvm.mlir.addressof @str572 : !llvm.ptr
      %7147 = arith.constant 31 : i64
      %7148 = func.call @cc_make_symbol(%7146, %7147) : (!llvm.ptr, i64) -> i64
      %7149 = func.call @cc_persistent_root_value(%7148) : (i64) -> i64
      func.call @stack_push_pointer(%7149) : (i64) -> ()
      %7150 = llvm.mlir.addressof @str573 : !llvm.ptr
      %7151 = arith.constant 37 : i64
      %7152 = func.call @cc_make_symbol(%7150, %7151) : (!llvm.ptr, i64) -> i64
      %7153 = func.call @cc_persistent_root_value(%7152) : (i64) -> i64
      func.call @stack_push_pointer(%7153) : (i64) -> ()
      %7154 = llvm.mlir.addressof @str574 : !llvm.ptr
      %7155 = arith.constant 38 : i64
      %7156 = func.call @cc_make_symbol(%7154, %7155) : (!llvm.ptr, i64) -> i64
      %7157 = func.call @cc_persistent_root_value(%7156) : (i64) -> i64
      func.call @stack_push_pointer(%7157) : (i64) -> ()
      %7158 = arith.constant 275462358040644 : i64
      %7159 = arith.constant 3 : i64
      %7160 = func.call @cc_make_closure(%7158, %7159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7160) : (i64) -> ()
      %7161 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7162 = func.call @stack_pop_pointer() : () -> i64
      %7163 = func.call @stack_pop_pointer() : () -> i64
      %7164 = func.call @cc_cons(%7163, %7162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7164) : (i64) -> ()
      %7165 = func.call @stack_pop_pointer() : () -> i64
      %7166 = func.call @stack_pop_pointer() : () -> i64
      %7167 = func.call @cc_cons(%7166, %7165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7167) : (i64) -> ()
      %7168 = func.call @stack_pop_pointer() : () -> i64
      %7169 = llvm.mlir.addressof @str575 : !llvm.ptr
      %7170 = arith.constant 11 : i64
      %7171 = func.call @cc_make_string(%7169, %7170) : (!llvm.ptr, i64) -> i64
      %7172 = llvm.mlir.addressof @str576 : !llvm.ptr
      %7173 = arith.constant 7 : i64
      %7174 = func.call @cc_make_string(%7172, %7173) : (!llvm.ptr, i64) -> i64
      %7175 = func.call @cc_intern(%7171, %7174) : (i64, i64) -> i64
      %7176 = func.call @cc_nil_value() : () -> i64
      %7177 = func.call @cc_cons(%7175, %7176) : (i64, i64) -> i64
      %7178 = func.call @cc_values_pack(%7177) : (i64) -> i64
      func.call @stack_push_pointer(%7175) : (i64) -> ()
      %7179 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7180 = func.call @stack_pop_pointer() : () -> i64
      %7181 = llvm.mlir.addressof @str577 : !llvm.ptr
      %7182 = arith.constant 4 : i64
      %7183 = func.call @cc_make_string(%7181, %7182) : (!llvm.ptr, i64) -> i64
      %7184 = llvm.mlir.addressof @str578 : !llvm.ptr
      %7185 = arith.constant 7 : i64
      %7186 = func.call @cc_make_string(%7184, %7185) : (!llvm.ptr, i64) -> i64
      %7187 = func.call @cc_intern(%7183, %7186) : (i64, i64) -> i64
      %7188 = func.call @cc_nil_value() : () -> i64
      %7189 = func.call @cc_cons(%7187, %7188) : (i64, i64) -> i64
      %7190 = func.call @cc_values_pack(%7189) : (i64) -> i64
      func.call @stack_push_pointer(%7187) : (i64) -> ()
      %7191 = func.call @stack_pop_pointer() : () -> i64
      %7192 = llvm.mlir.addressof @str579 : !llvm.ptr
      %7193 = arith.constant 6 : i64
      %7194 = func.call @cc_make_string(%7192, %7193) : (!llvm.ptr, i64) -> i64
      %7195 = func.call @cc_nil_value() : () -> i64
      %7196 = func.call @cc_intern(%7194, %7195) : (i64, i64) -> i64
      %7197 = func.call @cc_nil_value() : () -> i64
      %7198 = func.call @cc_cons(%7196, %7197) : (i64, i64) -> i64
      %7199 = func.call @cc_values_pack(%7198) : (i64) -> i64
      func.call @stack_push_pointer(%7196) : (i64) -> ()
      %7200 = func.call @stack_pop_pointer() : () -> i64
      %7201 = func.call @cc_nil_value() : () -> i64
      %7202 = func.call @cc_errorp(%6620) : (i64) -> i64
      %7203 = arith.cmpi ne, %7202, %7201 : i64
      %7204 = arith.cmpi eq, %7201, %7201 : i64
      %7205 = arith.andi %7203, %7204 : i1
      %7206 = scf.if %7205 -> (i64) {
        scf.yield %6620 : i64
      } else {
        scf.yield %7201 : i64
      }
      %7207 = func.call @cc_errorp(%7046) : (i64) -> i64
      %7208 = arith.cmpi ne, %7207, %7201 : i64
      %7209 = arith.cmpi eq, %7206, %7201 : i64
      %7210 = arith.andi %7208, %7209 : i1
      %7211 = scf.if %7210 -> (i64) {
        scf.yield %7046 : i64
      } else {
        scf.yield %7206 : i64
      }
      %7212 = func.call @cc_errorp(%7161) : (i64) -> i64
      %7213 = arith.cmpi ne, %7212, %7201 : i64
      %7214 = arith.cmpi eq, %7211, %7201 : i64
      %7215 = arith.andi %7213, %7214 : i1
      %7216 = scf.if %7215 -> (i64) {
        scf.yield %7161 : i64
      } else {
        scf.yield %7211 : i64
      }
      %7217 = func.call @cc_errorp(%7168) : (i64) -> i64
      %7218 = arith.cmpi ne, %7217, %7201 : i64
      %7219 = arith.cmpi eq, %7216, %7201 : i64
      %7220 = arith.andi %7218, %7219 : i1
      %7221 = scf.if %7220 -> (i64) {
        scf.yield %7168 : i64
      } else {
        scf.yield %7216 : i64
      }
      %7222 = func.call @cc_errorp(%7179) : (i64) -> i64
      %7223 = arith.cmpi ne, %7222, %7201 : i64
      %7224 = arith.cmpi eq, %7221, %7201 : i64
      %7225 = arith.andi %7223, %7224 : i1
      %7226 = scf.if %7225 -> (i64) {
        scf.yield %7179 : i64
      } else {
        scf.yield %7221 : i64
      }
      %7227 = func.call @cc_errorp(%7180) : (i64) -> i64
      %7228 = arith.cmpi ne, %7227, %7201 : i64
      %7229 = arith.cmpi eq, %7226, %7201 : i64
      %7230 = arith.andi %7228, %7229 : i1
      %7231 = scf.if %7230 -> (i64) {
        scf.yield %7180 : i64
      } else {
        scf.yield %7226 : i64
      }
      %7232 = func.call @cc_errorp(%7191) : (i64) -> i64
      %7233 = arith.cmpi ne, %7232, %7201 : i64
      %7234 = arith.cmpi eq, %7231, %7201 : i64
      %7235 = arith.andi %7233, %7234 : i1
      %7236 = scf.if %7235 -> (i64) {
        scf.yield %7191 : i64
      } else {
        scf.yield %7231 : i64
      }
      %7237 = func.call @cc_errorp(%7200) : (i64) -> i64
      %7238 = arith.cmpi ne, %7237, %7201 : i64
      %7239 = arith.cmpi eq, %7236, %7201 : i64
      %7240 = arith.andi %7238, %7239 : i1
      %7241 = scf.if %7240 -> (i64) {
        scf.yield %7200 : i64
      } else {
        scf.yield %7236 : i64
      }
      %7242 = arith.cmpi ne, %7241, %7201 : i64
      scf.if %7242 {
        func.call @stack_push_pointer(%7241) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6620) : (i64) -> ()
        func.call @stack_push_pointer(%7046) : (i64) -> ()
        func.call @stack_push_pointer(%7161) : (i64) -> ()
        func.call @stack_push_pointer(%7168) : (i64) -> ()
        func.call @stack_push_pointer(%7179) : (i64) -> ()
        func.call @stack_push_pointer(%7180) : (i64) -> ()
        func.call @stack_push_pointer(%7191) : (i64) -> ()
        func.call @stack_push_pointer(%7200) : (i64) -> ()
        %7243 = llvm.mlir.addressof @str580 : !llvm.ptr
        %7244 = func.call @cc_make_function_ref_const(%7243) : (!llvm.ptr) -> i64
        %7245 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7244, %7245) : (i64, i64) -> ()
      }
      %7246 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7246 : i64
    }
    func.call @stack_push_pointer(%6611) : (i64) -> ()
    %7247 = func.call @stack_pop_pointer() : () -> i64
    %7248 = func.call @cc_multiple_value_list(%7247) : (i64) -> i64
    %7249 = llvm.mlir.addressof @str581 : !llvm.ptr
    %7250 = arith.constant 38 : i64
    %7251 = func.call @cc_make_string(%7249, %7250) : (!llvm.ptr, i64) -> i64
    %7252 = func.call @cc_nil_value() : () -> i64
    %7253 = func.call @cc_intern(%7251, %7252) : (i64, i64) -> i64
    %7254 = func.call @cc_nil_value() : () -> i64
    %7255 = func.call @cc_cons(%7253, %7254) : (i64, i64) -> i64
    %7256 = func.call @cc_values_pack(%7255) : (i64) -> i64
    %7257 = func.call @cc_symbol_value(%7253) : (i64) -> i64
    %7258 = llvm.mlir.addressof @str582 : !llvm.ptr
    %7259 = arith.constant 40 : i64
    %7260 = func.call @cc_make_string(%7258, %7259) : (!llvm.ptr, i64) -> i64
    %7261 = func.call @cc_nil_value() : () -> i64
    %7262 = func.call @cc_intern(%7260, %7261) : (i64, i64) -> i64
    %7263 = func.call @cc_nil_value() : () -> i64
    %7264 = func.call @cc_cons(%7262, %7263) : (i64, i64) -> i64
    %7265 = func.call @cc_values_pack(%7264) : (i64) -> i64
    %7266 = func.call @cc_symbol_value(%7262) : (i64) -> i64
    %7267 = func.call @cc_nil_value() : () -> i64
    %7268 = arith.cmpi ne, %7257, %7267 : i64
    %7269 = scf.if %7268 -> (i64) {
      scf.yield %7266 : i64
    } else {
      scf.yield %7248 : i64
    }
    %7270 = func.call @cc_values_pack(%7269) : (i64) -> i64
    func.call @stack_push_pointer(%7270) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_275462358040579"() {
    %393 = func.call @stack_pop_pointer() : () -> i64
    %394 = func.call @cc_nil_value() : () -> i64
    %395 = func.call @cc_nil_value() : () -> i64
    %396 = func.call @cc_errorp(%394) : (i64) -> i64
    %397 = arith.cmpi ne, %396, %395 : i64
    %398 = scf.if %397 -> (i64) {
      scf.yield %394 : i64
    } else {
      %399 = func.call @cc_symbol_value(%393) : (i64) -> i64
      func.call @stack_push_pointer(%399) : (i64) -> ()
      %400 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %400 : i64
    }
    func.call @stack_push_pointer(%398) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040578"() {
    %387 = func.call @stack_pop_pointer() : () -> i64
    %388 = func.call @cc_nil_value() : () -> i64
    %389 = func.call @cc_nil_value() : () -> i64
    %390 = func.call @cc_errorp(%388) : (i64) -> i64
    %391 = arith.cmpi ne, %390, %389 : i64
    %392 = scf.if %391 -> (i64) {
      scf.yield %388 : i64
    } else {
      %401 = llvm.mlir.addressof @str37 : !llvm.ptr
      %402 = arith.constant 30 : i64
      %403 = func.call @cc_make_symbol(%401, %402) : (!llvm.ptr, i64) -> i64
      %404 = func.call @cc_persistent_root_value(%403) : (i64) -> i64
      %405 = func.call @cc_set_symbol_value(%404, %387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%404) : (i64) -> ()
      %406 = arith.constant 275462358040579 : i64
      %407 = arith.constant 1 : i64
      %408 = func.call @cc_make_closure(%406, %407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%408) : (i64) -> ()
      %409 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %409 : i64
    }
    func.call @stack_push_pointer(%392) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040577"() {
    %378 = func.call @stack_pop_pointer() : () -> i64
    %379 = func.call @stack_pop_pointer() : () -> i64
    %380 = func.call @stack_pop_pointer() : () -> i64
    %381 = func.call @cc_nil_value() : () -> i64
    %382 = func.call @cc_nil_value() : () -> i64
    %383 = func.call @cc_errorp(%381) : (i64) -> i64
    %384 = arith.cmpi ne, %383, %382 : i64
    %385 = scf.if %384 -> (i64) {
      scf.yield %381 : i64
    } else {
      %386 = arith.constant 119 : i64
      func.call @stack_push_fixnum(%386) : (i64) -> ()
      %410 = arith.constant 275462358040578 : i64
      %411 = arith.constant 0 : i64
      %412 = func.call @cc_make_closure(%410, %411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%412) : (i64) -> ()
      %413 = func.call @stack_pop_pointer() : () -> i64
      %414 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%413, %414) : (i64, i64) -> ()
      %415 = func.call @stack_pop_pointer() : () -> i64
      %416 = func.call @cc_nil_value() : () -> i64
      %417 = func.call @cc_nil_value() : () -> i64
      %418 = func.call @cc_errorp(%416) : (i64) -> i64
      %419 = arith.cmpi ne, %418, %417 : i64
      %420 = scf.if %419 -> (i64) {
        scf.yield %416 : i64
      } else {
        func.call @stack_push_pointer(%415) : (i64) -> ()
        %421 = func.call @stack_pop_pointer() : () -> i64
        %422 = func.call @cc_nil_value() : () -> i64
        %423 = func.call @cc_cons(%422, %422) : (i64, i64) -> i64
        %424 = func.call @cc_cons(%422, %423) : (i64, i64) -> i64
        %425 = func.call @cc_cons(%421, %424) : (i64, i64) -> i64
        %426 = func.call @cc_values_pack(%425) : (i64) -> i64
        func.call @stack_push_pointer(%426) : (i64) -> ()
        %427 = func.call @stack_pop_pointer() : () -> i64
        %428 = func.call @cc_multiple_value_list(%427) : (i64) -> i64
        %429 = arith.constant 0 : i64
        %430 = func.call @cc_box_fixnum(%429) : (i64) -> i64
        %431 = func.call @cc_nth(%430, %428) : (i64, i64) -> i64
        %432 = arith.constant 1 : i64
        %433 = func.call @cc_box_fixnum(%432) : (i64) -> i64
        %434 = func.call @cc_nth(%433, %428) : (i64, i64) -> i64
        %435 = arith.constant 2 : i64
        %436 = func.call @cc_box_fixnum(%435) : (i64) -> i64
        %437 = func.call @cc_nth(%436, %428) : (i64, i64) -> i64
        func.call @stack_push_pointer(%415) : (i64) -> ()
        %438 = func.call @stack_pop_pointer() : () -> i64
        %439 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%438, %439) : (i64, i64) -> ()
        %440 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%431) : (i64) -> ()
        %441 = func.call @stack_pop_pointer() : () -> i64
        %442 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%441, %442) : (i64, i64) -> ()
        %443 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%434) : (i64) -> ()
        %444 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%437) : (i64) -> ()
        %445 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %446 = func.call @stack_pop_pointer() : () -> i64
        %447 = func.call @cc_cons(%445, %446) : (i64, i64) -> i64
        func.call @stack_push_pointer(%447) : (i64) -> ()
        %448 = func.call @stack_pop_pointer() : () -> i64
        %449 = func.call @cc_cons(%444, %448) : (i64, i64) -> i64
        func.call @stack_push_pointer(%449) : (i64) -> ()
        %450 = func.call @stack_pop_pointer() : () -> i64
        %451 = func.call @cc_cons(%443, %450) : (i64, i64) -> i64
        func.call @stack_push_pointer(%451) : (i64) -> ()
        %452 = func.call @stack_pop_pointer() : () -> i64
        %453 = func.call @cc_cons(%440, %452) : (i64, i64) -> i64
        func.call @stack_push_pointer(%453) : (i64) -> ()
        %454 = func.call @stack_pop_pointer() : () -> i64
        %455 = func.call @cc_values_pack(%454) : (i64) -> i64
        func.call @stack_push_pointer(%455) : (i64) -> ()
        %456 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %456 : i64
      }
      func.call @stack_push_pointer(%420) : (i64) -> ()
      %457 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %457 : i64
    }
    func.call @stack_push_pointer(%385) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040586"() {
    %1211 = func.call @stack_pop_pointer() : () -> i64
    %1212 = func.call @cc_nil_value() : () -> i64
    %1213 = func.call @cc_nil_value() : () -> i64
    %1214 = func.call @cc_errorp(%1212) : (i64) -> i64
    %1215 = arith.cmpi ne, %1214, %1213 : i64
    %1216 = scf.if %1215 -> (i64) {
      scf.yield %1212 : i64
    } else {
      %1217 = func.call @cc_symbol_value(%1211) : (i64) -> i64
      func.call @stack_push_pointer(%1217) : (i64) -> ()
      %1218 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1218 : i64
    }
    func.call @stack_push_pointer(%1216) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040588"() {
    %1228 = func.call @stack_pop_pointer() : () -> i64
    %1229 = func.call @stack_pop_pointer() : () -> i64
    %1230 = func.call @cc_nil_value() : () -> i64
    %1231 = func.call @cc_nil_value() : () -> i64
    %1232 = func.call @cc_errorp(%1230) : (i64) -> i64
    %1233 = arith.cmpi ne, %1232, %1231 : i64
    %1234 = scf.if %1233 -> (i64) {
      scf.yield %1230 : i64
    } else {
      func.call @stack_push_pointer(%1228) : (i64) -> ()
      %1235 = func.call @stack_pop_pointer() : () -> i64
      %1236 = func.call @cc_set_symbol_value(%1229, %1235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1235) : (i64) -> ()
      %1237 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1237 : i64
    }
    func.call @stack_push_pointer(%1234) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040585"() {
    %1205 = func.call @stack_pop_pointer() : () -> i64
    %1206 = func.call @cc_nil_value() : () -> i64
    %1207 = func.call @cc_nil_value() : () -> i64
    %1208 = func.call @cc_errorp(%1206) : (i64) -> i64
    %1209 = arith.cmpi ne, %1208, %1207 : i64
    %1210:2 = scf.if %1209 -> (i64, i64) {
      scf.yield %1206, %1205 : i64, i64
    } else {
      %1219 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1220 = arith.constant 30 : i64
      %1221 = func.call @cc_make_symbol(%1219, %1220) : (!llvm.ptr, i64) -> i64
      %1222 = func.call @cc_persistent_root_value(%1221) : (i64) -> i64
      %1223 = func.call @cc_set_symbol_value(%1222, %1205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1222) : (i64) -> ()
      %1224 = arith.constant 275462358040586 : i64
      %1225 = arith.constant 1 : i64
      %1226 = func.call @cc_make_closure(%1224, %1225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1226) : (i64) -> ()
      %1227 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1222) : (i64) -> ()
      %1238 = arith.constant 275462358040588 : i64
      %1239 = arith.constant 1 : i64
      %1240 = func.call @cc_make_closure(%1238, %1239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1240) : (i64) -> ()
      %1241 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1242 = func.call @stack_pop_pointer() : () -> i64
      %1243 = func.call @cc_cons(%1241, %1242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1243) : (i64) -> ()
      %1244 = func.call @stack_pop_pointer() : () -> i64
      %1245 = func.call @cc_cons(%1227, %1244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1245) : (i64) -> ()
      %1246 = func.call @stack_pop_pointer() : () -> i64
      %1247 = func.call @cc_values_pack(%1246) : (i64) -> i64
      func.call @stack_push_pointer(%1247) : (i64) -> ()
      %1248 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1248, %1205 : i64, i64
    }
    func.call @stack_push_pointer(%1210#0) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040584"() {
    %1193 = func.call @stack_pop_pointer() : () -> i64
    %1194 = func.call @stack_pop_pointer() : () -> i64
    %1195 = func.call @stack_pop_pointer() : () -> i64
    %1196 = func.call @stack_pop_pointer() : () -> i64
    %1197 = func.call @stack_pop_pointer() : () -> i64
    %1198 = func.call @stack_pop_pointer() : () -> i64
    %1199 = func.call @cc_nil_value() : () -> i64
    %1200 = func.call @cc_nil_value() : () -> i64
    %1201 = func.call @cc_errorp(%1199) : (i64) -> i64
    %1202 = arith.cmpi ne, %1201, %1200 : i64
    %1203 = scf.if %1202 -> (i64) {
      scf.yield %1199 : i64
    } else {
      %1204 = arith.constant 237 : i64
      func.call @stack_push_fixnum(%1204) : (i64) -> ()
      %1249 = arith.constant 275462358040585 : i64
      %1250 = arith.constant 0 : i64
      %1251 = func.call @cc_make_closure(%1249, %1250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      %1252 = func.call @stack_pop_pointer() : () -> i64
      %1253 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%1252, %1253) : (i64, i64) -> ()
      %1254 = func.call @stack_pop_pointer() : () -> i64
      %1255 = func.call @cc_multiple_value_list(%1254) : (i64) -> i64
      %1256 = arith.constant 0 : i64
      %1257 = func.call @cc_box_fixnum(%1256) : (i64) -> i64
      %1258 = func.call @cc_nth(%1257, %1255) : (i64, i64) -> i64
      %1259 = arith.constant 1 : i64
      %1260 = func.call @cc_box_fixnum(%1259) : (i64) -> i64
      %1261 = func.call @cc_nth(%1260, %1255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1262 = func.call @stack_pop_pointer() : () -> i64
      %1263 = func.call @cc_nil_value() : () -> i64
      %1264 = func.call @cc_cons(%1263, %1263) : (i64, i64) -> i64
      %1265 = func.call @cc_cons(%1263, %1264) : (i64, i64) -> i64
      %1266 = func.call @cc_cons(%1262, %1265) : (i64, i64) -> i64
      %1267 = func.call @cc_values_pack(%1266) : (i64) -> i64
      func.call @stack_push_pointer(%1267) : (i64) -> ()
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_multiple_value_list(%1268) : (i64) -> i64
      %1270 = arith.constant 0 : i64
      %1271 = func.call @cc_box_fixnum(%1270) : (i64) -> i64
      %1272 = func.call @cc_nth(%1271, %1269) : (i64, i64) -> i64
      %1273 = arith.constant 1 : i64
      %1274 = func.call @cc_box_fixnum(%1273) : (i64) -> i64
      %1275 = func.call @cc_nth(%1274, %1269) : (i64, i64) -> i64
      %1276 = arith.constant 2 : i64
      %1277 = func.call @cc_box_fixnum(%1276) : (i64) -> i64
      %1278 = func.call @cc_nth(%1277, %1269) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1261) : (i64) -> ()
      %1279 = func.call @stack_pop_pointer() : () -> i64
      %1280 = func.call @cc_nil_value() : () -> i64
      %1281 = func.call @cc_cons(%1280, %1280) : (i64, i64) -> i64
      %1282 = func.call @cc_cons(%1280, %1281) : (i64, i64) -> i64
      %1283 = func.call @cc_cons(%1279, %1282) : (i64, i64) -> i64
      %1284 = func.call @cc_values_pack(%1283) : (i64) -> i64
      func.call @stack_push_pointer(%1284) : (i64) -> ()
      %1285 = func.call @stack_pop_pointer() : () -> i64
      %1286 = func.call @cc_multiple_value_list(%1285) : (i64) -> i64
      %1287 = arith.constant 0 : i64
      %1288 = func.call @cc_box_fixnum(%1287) : (i64) -> i64
      %1289 = func.call @cc_nth(%1288, %1286) : (i64, i64) -> i64
      %1290 = arith.constant 1 : i64
      %1291 = func.call @cc_box_fixnum(%1290) : (i64) -> i64
      %1292 = func.call @cc_nth(%1291, %1286) : (i64, i64) -> i64
      %1293 = arith.constant 2 : i64
      %1294 = func.call @cc_box_fixnum(%1293) : (i64) -> i64
      %1295 = func.call @cc_nth(%1294, %1286) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1296 = func.call @stack_pop_pointer() : () -> i64
      %1297 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%1296, %1297) : (i64, i64) -> ()
      %1298 = func.call @stack_pop_pointer() : () -> i64
      %1299 = arith.constant 18 : i64
      func.call @stack_push_fixnum(%1299) : (i64) -> ()
      func.call @stack_push_pointer(%1261) : (i64) -> ()
      %1300 = func.call @stack_pop_pointer() : () -> i64
      %1301 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%1300, %1301) : (i64, i64) -> ()
      %1302 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1272) : (i64) -> ()
      %1303 = func.call @stack_pop_pointer() : () -> i64
      %1304 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%1303, %1304) : (i64, i64) -> ()
      %1305 = func.call @stack_pop_pointer() : () -> i64
      %1306 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1306) : (i64) -> ()
      func.call @stack_push_pointer(%1289) : (i64) -> ()
      %1307 = func.call @stack_pop_pointer() : () -> i64
      %1308 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%1307, %1308) : (i64, i64) -> ()
      %1309 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1310 = func.call @stack_pop_pointer() : () -> i64
      %1311 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%1310, %1311) : (i64, i64) -> ()
      %1312 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1275) : (i64) -> ()
      %1313 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1278) : (i64) -> ()
      %1314 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1292) : (i64) -> ()
      %1315 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1295) : (i64) -> ()
      %1316 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1317 = func.call @stack_pop_pointer() : () -> i64
      %1318 = func.call @cc_cons(%1316, %1317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1318) : (i64) -> ()
      %1319 = func.call @stack_pop_pointer() : () -> i64
      %1320 = func.call @cc_cons(%1315, %1319) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1320) : (i64) -> ()
      %1321 = func.call @stack_pop_pointer() : () -> i64
      %1322 = func.call @cc_cons(%1314, %1321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1322) : (i64) -> ()
      %1323 = func.call @stack_pop_pointer() : () -> i64
      %1324 = func.call @cc_cons(%1313, %1323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1324) : (i64) -> ()
      %1325 = func.call @stack_pop_pointer() : () -> i64
      %1326 = func.call @cc_cons(%1312, %1325) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1326) : (i64) -> ()
      %1327 = func.call @stack_pop_pointer() : () -> i64
      %1328 = func.call @cc_cons(%1309, %1327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1328) : (i64) -> ()
      %1329 = func.call @stack_pop_pointer() : () -> i64
      %1330 = func.call @cc_cons(%1305, %1329) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1330) : (i64) -> ()
      %1331 = func.call @stack_pop_pointer() : () -> i64
      %1332 = func.call @cc_cons(%1302, %1331) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1332) : (i64) -> ()
      %1333 = func.call @stack_pop_pointer() : () -> i64
      %1334 = func.call @cc_cons(%1298, %1333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1334) : (i64) -> ()
      %1335 = func.call @stack_pop_pointer() : () -> i64
      %1336 = func.call @cc_values_pack(%1335) : (i64) -> i64
      func.call @stack_push_pointer(%1336) : (i64) -> ()
      %1337 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1337 : i64
    }
    func.call @stack_push_pointer(%1203) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040597"() {
    %1943 = func.call @stack_pop_pointer() : () -> i64
    %1944 = func.call @stack_pop_pointer() : () -> i64
    %1945 = func.call @cc_nil_value() : () -> i64
    %1946 = func.call @cc_nil_value() : () -> i64
    %1947 = func.call @cc_errorp(%1945) : (i64) -> i64
    %1948 = arith.cmpi ne, %1947, %1946 : i64
    %1949 = scf.if %1948 -> (i64) {
      scf.yield %1945 : i64
    } else {
      %1950 = func.call @cc_symbol_value(%1944) : (i64) -> i64
      func.call @stack_push_pointer(%1950) : (i64) -> ()
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @cc_symbol_value(%1943) : (i64) -> i64
      func.call @stack_push_pointer(%1952) : (i64) -> ()
      %1953 = func.call @stack_pop_pointer() : () -> i64
      %1954 = func.call @cc_nil_value() : () -> i64
      %1955 = func.call @cc_errorp(%1951) : (i64) -> i64
      %1956 = arith.cmpi ne, %1955, %1954 : i64
      %1957 = arith.cmpi eq, %1954, %1954 : i64
      %1958 = arith.andi %1956, %1957 : i1
      %1959 = scf.if %1958 -> (i64) {
        scf.yield %1951 : i64
      } else {
        scf.yield %1954 : i64
      }
      %1960 = func.call @cc_errorp(%1953) : (i64) -> i64
      %1961 = arith.cmpi ne, %1960, %1954 : i64
      %1962 = arith.cmpi eq, %1959, %1954 : i64
      %1963 = arith.andi %1961, %1962 : i1
      %1964 = scf.if %1963 -> (i64) {
        scf.yield %1953 : i64
      } else {
        scf.yield %1959 : i64
      }
      %1965 = arith.cmpi ne, %1964, %1954 : i64
      scf.if %1965 {
        func.call @stack_push_pointer(%1964) : (i64) -> ()
      } else {
        %1966 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1966) : (i64) -> ()
        func.call @stack_push_pointer(%1953) : (i64) -> ()
        %1967 = func.call @stack_pop_pointer() : () -> i64
        %1968 = func.call @stack_pop_pointer() : () -> i64
        %1969 = func.call @cc_cons(%1967, %1968) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1969) : (i64) -> ()
        func.call @stack_push_pointer(%1951) : (i64) -> ()
        %1970 = func.call @stack_pop_pointer() : () -> i64
        %1971 = func.call @stack_pop_pointer() : () -> i64
        %1972 = func.call @cc_cons(%1970, %1971) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1972) : (i64) -> ()
      }
      %1973 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1973 : i64
    }
    func.call @stack_push_pointer(%1949) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040596"() {
    %1936 = func.call @stack_pop_pointer() : () -> i64
    %1937 = func.call @stack_pop_pointer() : () -> i64
    %1938 = func.call @cc_nil_value() : () -> i64
    %1939 = func.call @cc_nil_value() : () -> i64
    %1940 = func.call @cc_errorp(%1938) : (i64) -> i64
    %1941 = arith.cmpi ne, %1940, %1939 : i64
    %1942 = scf.if %1941 -> (i64) {
      scf.yield %1938 : i64
    } else {
      %1974 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1975 = arith.constant 30 : i64
      %1976 = func.call @cc_make_symbol(%1974, %1975) : (!llvm.ptr, i64) -> i64
      %1977 = func.call @cc_persistent_root_value(%1976) : (i64) -> i64
      %1978 = func.call @cc_set_symbol_value(%1977, %1937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1977) : (i64) -> ()
      %1979 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1980 = arith.constant 30 : i64
      %1981 = func.call @cc_make_symbol(%1979, %1980) : (!llvm.ptr, i64) -> i64
      %1982 = func.call @cc_persistent_root_value(%1981) : (i64) -> i64
      %1983 = func.call @cc_set_symbol_value(%1982, %1936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1982) : (i64) -> ()
      %1984 = arith.constant 275462358040597 : i64
      %1985 = arith.constant 2 : i64
      %1986 = func.call @cc_make_closure(%1984, %1985) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1986) : (i64) -> ()
      %1987 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1987 : i64
    }
    func.call @stack_push_pointer(%1942) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040595"() {
    %1926 = func.call @stack_pop_pointer() : () -> i64
    %1927 = func.call @stack_pop_pointer() : () -> i64
    %1928 = func.call @stack_pop_pointer() : () -> i64
    %1929 = func.call @cc_nil_value() : () -> i64
    %1930 = func.call @cc_nil_value() : () -> i64
    %1931 = func.call @cc_errorp(%1929) : (i64) -> i64
    %1932 = arith.cmpi ne, %1931, %1930 : i64
    %1933 = scf.if %1932 -> (i64) {
      scf.yield %1929 : i64
    } else {
      %1934 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%1934) : (i64) -> ()
      %1935 = arith.constant 382 : i64
      func.call @stack_push_fixnum(%1935) : (i64) -> ()
      %1988 = arith.constant 275462358040596 : i64
      %1989 = arith.constant 0 : i64
      %1990 = func.call @cc_make_closure(%1988, %1989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1990) : (i64) -> ()
      %1991 = func.call @stack_pop_pointer() : () -> i64
      %1992 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%1991, %1992) : (i64, i64) -> ()
      %1993 = func.call @stack_pop_pointer() : () -> i64
      %1994 = func.call @cc_nil_value() : () -> i64
      %1995 = func.call @cc_nil_value() : () -> i64
      %1996 = func.call @cc_errorp(%1994) : (i64) -> i64
      %1997 = arith.cmpi ne, %1996, %1995 : i64
      %1998 = scf.if %1997 -> (i64) {
        scf.yield %1994 : i64
      } else {
        %1999 = arith.constant 7 : i64
        func.call @stack_push_fixnum(%1999) : (i64) -> ()
        %2000 = func.call @stack_pop_pointer() : () -> i64
        %2001 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%2001) : (i64) -> ()
        %2002 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2003 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2004 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2005 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2006 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2007 = func.call @stack_pop_pointer() : () -> i64
        %2008 = func.call @cc_nil_value() : () -> i64
        %2009 = func.call @cc_nil_value() : () -> i64
        %2010 = func.call @cc_errorp(%2008) : (i64) -> i64
        %2011 = arith.cmpi ne, %2010, %2009 : i64
        %2012 = scf.if %2011 -> (i64) {
          scf.yield %2008 : i64
        } else {
          %2013 = func.call @cc_nil_value() : () -> i64
          %2014 = llvm.mlir.addressof @str173 : !llvm.ptr
          %2015 = arith.constant 38 : i64
          %2016 = func.call @cc_make_string(%2014, %2015) : (!llvm.ptr, i64) -> i64
          %2017 = func.call @cc_nil_value() : () -> i64
          %2018 = func.call @cc_intern(%2016, %2017) : (i64, i64) -> i64
          %2019 = func.call @cc_nil_value() : () -> i64
          %2020 = func.call @cc_cons(%2018, %2019) : (i64, i64) -> i64
          %2021 = func.call @cc_values_pack(%2020) : (i64) -> i64
          %2022 = func.call @cc_set_symbol_value(%2018, %2013) : (i64, i64) -> i64
          %2023 = llvm.mlir.addressof @str174 : !llvm.ptr
          %2024 = arith.constant 39 : i64
          %2025 = func.call @cc_make_string(%2023, %2024) : (!llvm.ptr, i64) -> i64
          %2026 = func.call @cc_nil_value() : () -> i64
          %2027 = func.call @cc_intern(%2025, %2026) : (i64, i64) -> i64
          %2028 = func.call @cc_nil_value() : () -> i64
          %2029 = func.call @cc_cons(%2027, %2028) : (i64, i64) -> i64
          %2030 = func.call @cc_values_pack(%2029) : (i64) -> i64
          %2031 = func.call @cc_set_symbol_value(%2027, %2013) : (i64, i64) -> i64
          %2032 = llvm.mlir.addressof @str175 : !llvm.ptr
          %2033 = arith.constant 40 : i64
          %2034 = func.call @cc_make_string(%2032, %2033) : (!llvm.ptr, i64) -> i64
          %2035 = func.call @cc_nil_value() : () -> i64
          %2036 = func.call @cc_intern(%2034, %2035) : (i64, i64) -> i64
          %2037 = func.call @cc_nil_value() : () -> i64
          %2038 = func.call @cc_cons(%2036, %2037) : (i64, i64) -> i64
          %2039 = func.call @cc_values_pack(%2038) : (i64) -> i64
          %2040 = func.call @cc_set_symbol_value(%2036, %2013) : (i64, i64) -> i64
          %2041:6 = scf.while (%arg0 = %2003, %arg1 = %2007, %arg2 = %2006, %arg3 = %2005, %arg4 = %2004, %arg5 = %2002) : (i64, i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64, i64) {
            %2042 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%arg4) : (i64) -> ()
            %2043 = func.call @stack_pop_pointer() : () -> i64
            %2044 = func.call @cc_nil_value() : () -> i64
            %2045 = func.call @cc_cons(%2043, %2044) : (i64, i64) -> i64
            %2046 = func.call @cc_not(%2045) : (i64) -> i64
            func.call @stack_push_pointer(%2046) : (i64) -> ()
            %2047 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%arg5) : (i64) -> ()
            %2048 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2000) : (i64) -> ()
            %2049 = func.call @stack_pop_pointer() : () -> i64
            %2050 = arith.constant 1 : i1
            %2052 = arith.constant 3 : i64
            %2051 = arith.andi %2048, %2052 : i64
            %2053 = arith.constant 0 : i64
            %2054 = arith.cmpi eq, %2051, %2053 : i64
            %2056 = arith.constant 3 : i64
            %2055 = arith.andi %2049, %2056 : i64
            %2057 = arith.constant 0 : i64
            %2058 = arith.cmpi eq, %2055, %2057 : i64
            %2059 = arith.andi %2054, %2058 : i1
            %2060 = scf.if %2059 -> (i1) {
              %2061 = arith.constant 2 : i64
              %2062 = arith.shrsi %2048, %2061 : i64
              %2063 = arith.constant 2 : i64
              %2064 = arith.shrsi %2049, %2063 : i64
              %2065 = arith.cmpi slt, %2062, %2064 : i64
              scf.yield %2065 : i1
            } else {
              %2066 = func.call @cc_lt(%2048, %2049) : (i64, i64) -> i64
              %2067 = func.call @cc_nil_value() : () -> i64
              %2068 = arith.cmpi ne, %2066, %2067 : i64
              scf.yield %2068 : i1
            }
            %2069 = arith.andi %2050, %2060 : i1
            %2070 = func.call @cc_nil_value() : () -> i64
            %2071 = func.call @cc_t_value() : () -> i64
            %2072 = scf.if %2069 -> (i64) {
              scf.yield %2071 : i64
            } else {
              scf.yield %2070 : i64
            }
            func.call @stack_push_pointer(%2072) : (i64) -> ()
            %2073 = func.call @stack_pop_pointer() : () -> i64
            %2074 = func.call @cc_cons(%2073, %2042) : (i64, i64) -> i64
            %2075 = func.call @cc_cons(%2047, %2074) : (i64, i64) -> i64
            %2076 = func.call @cc_and(%2075) : (i64) -> i64
            func.call @stack_push_pointer(%2076) : (i64) -> ()
            %2077 = func.call @stack_pop_pointer() : () -> i64
            %2078 = func.call @cc_nil_value() : () -> i64
            %2079 = arith.cmpi ne, %2077, %2078 : i64
            %2080 = func.call @cc_nil_value() : () -> i64
            %2081 = llvm.mlir.addressof @str176 : !llvm.ptr
            %2082 = arith.constant 38 : i64
            %2083 = func.call @cc_make_string(%2081, %2082) : (!llvm.ptr, i64) -> i64
            %2084 = func.call @cc_nil_value() : () -> i64
            %2085 = func.call @cc_intern(%2083, %2084) : (i64, i64) -> i64
            %2086 = func.call @cc_nil_value() : () -> i64
            %2087 = func.call @cc_cons(%2085, %2086) : (i64, i64) -> i64
            %2088 = func.call @cc_values_pack(%2087) : (i64) -> i64
            %2089 = func.call @cc_symbol_value(%2085) : (i64) -> i64
            %2090 = arith.cmpi ne, %2089, %2080 : i64
            %2091 = llvm.mlir.addressof @str177 : !llvm.ptr
            %2092 = arith.constant 38 : i64
            %2093 = func.call @cc_make_string(%2091, %2092) : (!llvm.ptr, i64) -> i64
            %2094 = func.call @cc_nil_value() : () -> i64
            %2095 = func.call @cc_intern(%2093, %2094) : (i64, i64) -> i64
            %2096 = func.call @cc_nil_value() : () -> i64
            %2097 = func.call @cc_cons(%2095, %2096) : (i64, i64) -> i64
            %2098 = func.call @cc_values_pack(%2097) : (i64) -> i64
            %2099 = func.call @cc_symbol_value(%2095) : (i64) -> i64
            %2100 = arith.cmpi ne, %2099, %2080 : i64
            %2101 = arith.ori %2090, %2100 : i1
            %2102 = arith.constant 0 : i1
            %2103 = arith.cmpi eq, %2101, %2102 : i1
            %2104 = arith.andi %2079, %2103 : i1
            scf.condition(%2104) %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 : i64, i64, i64, i64, i64, i64
          } do {
            ^bb0(%2105: i64, %2106: i64, %2107: i64, %2108: i64, %2109: i64, %2110: i64):
            func.call @stack_push_pointer(%2105) : (i64) -> ()
            func.call @stack_push_pointer(%1993) : (i64) -> ()
            %2111 = func.call @stack_pop_pointer() : () -> i64
            %2112 = func.call @cc_nil_value() : () -> i64
            %2113 = func.call @cc_cons(%2112, %2112) : (i64, i64) -> i64
            %2114 = func.call @cc_cons(%2112, %2113) : (i64, i64) -> i64
            %2115 = func.call @cc_cons(%2111, %2114) : (i64, i64) -> i64
            %2116 = func.call @cc_values_pack(%2115) : (i64) -> i64
            func.call @stack_push_pointer(%2116) : (i64) -> ()
            %2117 = func.call @stack_pop_pointer() : () -> i64
            %2118 = func.call @cc_multiple_value_list(%2117) : (i64) -> i64
            %2119 = arith.constant 0 : i64
            %2120 = func.call @cc_box_fixnum(%2119) : (i64) -> i64
            %2121 = func.call @cc_nth(%2120, %2118) : (i64, i64) -> i64
            %2122 = arith.constant 1 : i64
            %2123 = func.call @cc_box_fixnum(%2122) : (i64) -> i64
            %2124 = func.call @cc_nth(%2123, %2118) : (i64, i64) -> i64
            %2125 = arith.constant 2 : i64
            %2126 = func.call @cc_box_fixnum(%2125) : (i64) -> i64
            %2127 = func.call @cc_nth(%2126, %2118) : (i64, i64) -> i64
            %2128 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%2124) : (i64) -> ()
            %2129 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2127) : (i64) -> ()
            %2130 = func.call @stack_pop_pointer() : () -> i64
            %2131 = func.call @cc_cons(%2130, %2128) : (i64, i64) -> i64
            %2132 = func.call @cc_cons(%2129, %2131) : (i64, i64) -> i64
            %2133 = func.call @cc_or(%2132) : (i64) -> i64
            func.call @stack_push_pointer(%2133) : (i64) -> ()
            %2134 = func.call @stack_pop_pointer() : () -> i64
            %2135 = func.call @cc_nil_value() : () -> i64
            %2136 = arith.cmpi ne, %2134, %2135 : i64
            %2137:5 = scf.if %2136 -> (i64, i64, i64, i64, i64) {
              %2138 = func.call @cc_nil_value() : () -> i64
              %2139 = func.call @cc_nil_value() : () -> i64
              %2140 = func.call @cc_errorp(%2138) : (i64) -> i64
              %2141 = arith.cmpi ne, %2140, %2139 : i64
              %2142:5 = scf.if %2141 -> (i64, i64, i64, i64, i64) {
                scf.yield %2138, %2109, %2107, %2106, %2108 : i64, i64, i64, i64, i64
              } else {
                func.call @cc_clear_multiple_values() : () -> ()
                func.call @stack_push_pointer(%2124) : (i64) -> ()
                %2143 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%2127) : (i64) -> ()
                %2144 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_nil() : () -> ()
                %2145 = func.call @stack_pop_pointer() : () -> i64
                %2146 = func.call @cc_cons(%2144, %2145) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2146) : (i64) -> ()
                %2147 = func.call @stack_pop_pointer() : () -> i64
                %2148 = func.call @cc_cons(%2143, %2147) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2148) : (i64) -> ()
                %2149 = func.call @stack_pop_pointer() : () -> i64
                %2150 = func.call @cc_values_pack(%2149) : (i64) -> i64
                func.call @stack_push_pointer(%2150) : (i64) -> ()
                %2151 = func.call @stack_pop_pointer() : () -> i64
                %2152 = func.call @cc_errorp(%2151) : (i64) -> i64
                %2153 = func.call @cc_nil_value() : () -> i64
                %2154 = arith.cmpi ne, %2152, %2153 : i64
                scf.if %2154 {
                  func.call @stack_push_pointer(%2151) : (i64) -> ()
                } else {
                  %2155 = func.call @cc_multiple_value_list(%2151) : (i64) -> i64
                  func.call @stack_push_pointer(%2155) : (i64) -> ()
                }
                %2156 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%2156) : (i64) -> ()
                %2157 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2157, %2109, %2107, %2156, %2108 : i64, i64, i64, i64, i64
              }
              %2158 = func.call @cc_nil_value() : () -> i64
              %2159 = func.call @cc_errorp(%2142#0) : (i64) -> i64
              %2160 = arith.cmpi ne, %2159, %2158 : i64
              %2161:5 = scf.if %2160 -> (i64, i64, i64, i64, i64) {
                scf.yield %2142#0, %2142#1, %2142#2, %2142#3, %2142#4 : i64, i64, i64, i64, i64
              } else {
                func.call @stack_push_pointer(%2142#3) : (i64) -> ()
                %2162 = func.call @stack_pop_pointer() : () -> i64
                %2163 = func.call @cc_car(%2162) : (i64) -> i64
                func.call @stack_push_pointer(%2163) : (i64) -> ()
                %2164 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%2164) : (i64) -> ()
                %2165 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2165, %2142#1, %2164, %2142#3, %2142#4 : i64, i64, i64, i64, i64
              }
              %2166 = func.call @cc_nil_value() : () -> i64
              %2167 = func.call @cc_errorp(%2161#0) : (i64) -> i64
              %2168 = arith.cmpi ne, %2167, %2166 : i64
              %2169:5 = scf.if %2168 -> (i64, i64, i64, i64, i64) {
                scf.yield %2161#0, %2161#1, %2161#2, %2161#3, %2161#4 : i64, i64, i64, i64, i64
              } else {
                %2170 = func.call @cc_t_value() : () -> i64
                func.call @stack_push_pointer(%2170) : (i64) -> ()
                %2171 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%2171) : (i64) -> ()
                %2172 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2172, %2161#1, %2161#2, %2161#3, %2171 : i64, i64, i64, i64, i64
              }
              %2173 = func.call @cc_nil_value() : () -> i64
              %2174 = func.call @cc_errorp(%2169#0) : (i64) -> i64
              %2175 = arith.cmpi ne, %2174, %2173 : i64
              %2176:5 = scf.if %2175 -> (i64, i64, i64, i64, i64) {
                scf.yield %2169#0, %2169#1, %2169#2, %2169#3, %2169#4 : i64, i64, i64, i64, i64
              } else {
                %2177 = func.call @cc_t_value() : () -> i64
                func.call @stack_push_pointer(%2177) : (i64) -> ()
                %2178 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%2178) : (i64) -> ()
                %2179 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2179, %2178, %2169#2, %2169#3, %2169#4 : i64, i64, i64, i64, i64
              }
              %2180 = func.call @cc_nil_value() : () -> i64
              %2181 = func.call @cc_errorp(%2176#0) : (i64) -> i64
              %2182 = arith.cmpi ne, %2181, %2180 : i64
              %2183:5 = scf.if %2182 -> (i64, i64, i64, i64, i64) {
                scf.yield %2176#0, %2176#1, %2176#2, %2176#3, %2176#4 : i64, i64, i64, i64, i64
              } else {
                func.call @stack_push_pointer(%2176#3) : (i64) -> ()
                %2184 = func.call @stack_pop_pointer() : () -> i64
                %2185 = func.call @cc_values_pack(%2184) : (i64) -> i64
                func.call @stack_push_pointer(%2185) : (i64) -> ()
                %2186 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2186, %2176#1, %2176#2, %2176#3, %2176#4 : i64, i64, i64, i64, i64
              }
              func.call @stack_push_pointer(%2183#0) : (i64) -> ()
              %2187 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2187, %2183#4, %2183#2, %2183#1, %2183#3 : i64, i64, i64, i64, i64
            } else {
              func.call @stack_push_pointer(%2121) : (i64) -> ()
              %2188 = func.call @stack_pop_pointer() : () -> i64
              %2189 = arith.constant 0 : i64
              func.call @cc_funcall_stack(%2188, %2189) : (i64, i64) -> ()
              %2190 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2190, %2108, %2107, %2109, %2106 : i64, i64, i64, i64, i64
            }
            func.call @stack_push_pointer(%2137#0) : (i64) -> ()
            %2191 = func.call @stack_pop_pointer() : () -> i64
            %2192 = func.call @cc_nil_value() : () -> i64
            %2193 = func.call @cc_errorp(%2191) : (i64) -> i64
            %2194 = arith.cmpi ne, %2193, %2192 : i64
            %2195 = arith.cmpi eq, %2192, %2192 : i64
            %2196 = arith.andi %2194, %2195 : i1
            %2197 = scf.if %2196 -> (i64) {
              scf.yield %2191 : i64
            } else {
              scf.yield %2192 : i64
            }
            %2198 = arith.cmpi ne, %2197, %2192 : i64
            scf.if %2198 {
              func.call @stack_push_pointer(%2197) : (i64) -> ()
            } else {
              %2199 = func.call @cc_nil_value() : () -> i64
              func.call @stack_push_pointer(%2199) : (i64) -> ()
              func.call @stack_push_pointer(%2191) : (i64) -> ()
              %2200 = func.call @stack_pop_pointer() : () -> i64
              %2201 = func.call @stack_pop_pointer() : () -> i64
              %2202 = func.call @cc_cons(%2200, %2201) : (i64, i64) -> i64
              func.call @stack_push_pointer(%2202) : (i64) -> ()
            }
            %2203 = func.call @stack_pop_pointer() : () -> i64
            %2204 = func.call @stack_pop_pointer() : () -> i64
            %2205 = func.call @cc_append(%2204, %2203) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2205) : (i64) -> ()
            %2206 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2206) : (i64) -> ()
            %2207 = func.call @stack_depth() : () -> i64
            %2208 = arith.constant 0 : i64
            %2209 = arith.cmpi sgt, %2207, %2208 : i64
            scf.if %2209 {
              %2210 = func.call @stack_pop_pointer() : () -> i64
            }
            func.call @stack_push_pointer(%2110) : (i64) -> ()
            %2211 = func.call @stack_pop_pointer() : () -> i64
            %2212 = arith.constant 1 : i64
            func.call @stack_push_fixnum(%2212) : (i64) -> ()
            %2213 = func.call @stack_pop_pointer() : () -> i64
            %2215 = arith.constant 3 : i64
            %2214 = arith.andi %2211, %2215 : i64
            %2216 = arith.constant 0 : i64
            %2217 = arith.cmpi eq, %2214, %2216 : i64
            %2219 = arith.constant 3 : i64
            %2218 = arith.andi %2213, %2219 : i64
            %2220 = arith.constant 0 : i64
            %2221 = arith.cmpi eq, %2218, %2220 : i64
            %2222 = arith.andi %2217, %2221 : i1
            %2223 = scf.if %2222 -> (i64) {
              %2224 = arith.constant 2 : i64
              %2225 = arith.shrsi %2211, %2224 : i64
              %2226 = arith.constant 2 : i64
              %2227 = arith.shrsi %2213, %2226 : i64
              %2228 = arith.addi %2225, %2227 : i64
              %2229 = arith.constant -2305843009213693952 : i64
              %2230 = arith.constant 2305843009213693951 : i64
              %2231 = arith.cmpi sge, %2228, %2229 : i64
              %2232 = arith.cmpi sle, %2228, %2230 : i64
              %2233 = arith.andi %2231, %2232 : i1
              %2234 = scf.if %2233 -> (i64) {
                %2235 = arith.constant 2 : i64
                %2236 = arith.shli %2228, %2235 : i64
                scf.yield %2236 : i64
              } else {
                %2237 = func.call @cc_add(%2211, %2213) : (i64, i64) -> i64
                scf.yield %2237 : i64
              }
              scf.yield %2234 : i64
            } else {
              %2238 = func.call @cc_add(%2211, %2213) : (i64, i64) -> i64
              scf.yield %2238 : i64
            }
            func.call @stack_push_pointer(%2223) : (i64) -> ()
            %2239 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2239) : (i64) -> ()
            %2240 = func.call @stack_depth() : () -> i64
            %2241 = arith.constant 0 : i64
            %2242 = arith.cmpi sgt, %2240, %2241 : i64
            scf.if %2242 {
              %2243 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %2206, %2106, %2107, %2108, %2109, %2239 : i64, i64, i64, i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %2244 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2041#3) : (i64) -> ()
          %2245 = func.call @stack_pop_pointer() : () -> i64
          %2246 = func.call @cc_nil_value() : () -> i64
          %2247 = arith.cmpi ne, %2245, %2246 : i64
          scf.if %2247 {
            func.call @stack_push_pointer(%2041#1) : (i64) -> ()
            %2248 = func.call @stack_pop_pointer() : () -> i64
            %2249 = func.call @cc_values_pack(%2248) : (i64) -> i64
            func.call @stack_push_pointer(%2249) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2041#0) : (i64) -> ()
          }
          %2250 = func.call @stack_pop_pointer() : () -> i64
          %2251 = func.call @cc_multiple_value_list(%2250) : (i64) -> i64
          %2252 = llvm.mlir.addressof @str178 : !llvm.ptr
          %2253 = arith.constant 38 : i64
          %2254 = func.call @cc_make_string(%2252, %2253) : (!llvm.ptr, i64) -> i64
          %2255 = func.call @cc_nil_value() : () -> i64
          %2256 = func.call @cc_intern(%2254, %2255) : (i64, i64) -> i64
          %2257 = func.call @cc_nil_value() : () -> i64
          %2258 = func.call @cc_cons(%2256, %2257) : (i64, i64) -> i64
          %2259 = func.call @cc_values_pack(%2258) : (i64) -> i64
          %2260 = func.call @cc_symbol_value(%2256) : (i64) -> i64
          %2261 = llvm.mlir.addressof @str179 : !llvm.ptr
          %2262 = arith.constant 39 : i64
          %2263 = func.call @cc_make_string(%2261, %2262) : (!llvm.ptr, i64) -> i64
          %2264 = func.call @cc_nil_value() : () -> i64
          %2265 = func.call @cc_intern(%2263, %2264) : (i64, i64) -> i64
          %2266 = func.call @cc_nil_value() : () -> i64
          %2267 = func.call @cc_cons(%2265, %2266) : (i64, i64) -> i64
          %2268 = func.call @cc_values_pack(%2267) : (i64) -> i64
          %2269 = func.call @cc_symbol_value(%2265) : (i64) -> i64
          %2270 = llvm.mlir.addressof @str180 : !llvm.ptr
          %2271 = arith.constant 40 : i64
          %2272 = func.call @cc_make_string(%2270, %2271) : (!llvm.ptr, i64) -> i64
          %2273 = func.call @cc_nil_value() : () -> i64
          %2274 = func.call @cc_intern(%2272, %2273) : (i64, i64) -> i64
          %2275 = func.call @cc_nil_value() : () -> i64
          %2276 = func.call @cc_cons(%2274, %2275) : (i64, i64) -> i64
          %2277 = func.call @cc_values_pack(%2276) : (i64) -> i64
          %2278 = func.call @cc_symbol_value(%2274) : (i64) -> i64
          %2279 = func.call @cc_nil_value() : () -> i64
          %2280 = arith.cmpi ne, %2260, %2279 : i64
          %2281 = scf.if %2280 -> (i64) {
            scf.yield %2278 : i64
          } else {
            scf.yield %2251 : i64
          }
          %2282 = func.call @cc_values_pack(%2281) : (i64) -> i64
          func.call @stack_push_pointer(%2282) : (i64) -> ()
          %2283 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2283 : i64
        }
        func.call @stack_push_pointer(%2012) : (i64) -> ()
        %2284 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2284 : i64
      }
      func.call @stack_push_pointer(%1998) : (i64) -> ()
      %2285 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2285 : i64
    }
    func.call @stack_push_pointer(%1933) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040606"() {
    %2829 = func.call @stack_pop_pointer() : () -> i64
    %2830 = func.call @stack_pop_pointer() : () -> i64
    %2831 = func.call @cc_nil_value() : () -> i64
    %2832 = func.call @cc_nil_value() : () -> i64
    %2833 = func.call @cc_errorp(%2831) : (i64) -> i64
    %2834 = arith.cmpi ne, %2833, %2832 : i64
    %2835 = scf.if %2834 -> (i64) {
      scf.yield %2831 : i64
    } else {
      %2836 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2836) : (i64) -> ()
      %2837 = func.call @stack_pop_pointer() : () -> i64
      %2838 = func.call @cc_nil_value() : () -> i64
      %2839 = arith.cmpi ne, %2837, %2838 : i64
      scf.if %2839 {
        %2840 = func.call @cc_symbol_value(%2830) : (i64) -> i64
        func.call @stack_push_pointer(%2840) : (i64) -> ()
      } else {
        %2841 = func.call @cc_symbol_value(%2829) : (i64) -> i64
        func.call @stack_push_pointer(%2841) : (i64) -> ()
      }
      %2842 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2842 : i64
    }
    func.call @stack_push_pointer(%2835) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040605"() {
    %2822 = func.call @stack_pop_pointer() : () -> i64
    %2823 = func.call @stack_pop_pointer() : () -> i64
    %2824 = func.call @cc_nil_value() : () -> i64
    %2825 = func.call @cc_nil_value() : () -> i64
    %2826 = func.call @cc_errorp(%2824) : (i64) -> i64
    %2827 = arith.cmpi ne, %2826, %2825 : i64
    %2828 = scf.if %2827 -> (i64) {
      scf.yield %2824 : i64
    } else {
      %2843 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2844 = arith.constant 30 : i64
      %2845 = func.call @cc_make_symbol(%2843, %2844) : (!llvm.ptr, i64) -> i64
      %2846 = func.call @cc_persistent_root_value(%2845) : (i64) -> i64
      %2847 = func.call @cc_set_symbol_value(%2846, %2823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2846) : (i64) -> ()
      %2848 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2849 = arith.constant 30 : i64
      %2850 = func.call @cc_make_symbol(%2848, %2849) : (!llvm.ptr, i64) -> i64
      %2851 = func.call @cc_persistent_root_value(%2850) : (i64) -> i64
      %2852 = func.call @cc_set_symbol_value(%2851, %2822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2851) : (i64) -> ()
      %2853 = arith.constant 275462358040606 : i64
      %2854 = arith.constant 2 : i64
      %2855 = func.call @cc_make_closure(%2853, %2854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2855) : (i64) -> ()
      %2856 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2856 : i64
    }
    func.call @stack_push_pointer(%2828) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040604"() {
    %2812 = func.call @stack_pop_pointer() : () -> i64
    %2813 = func.call @stack_pop_pointer() : () -> i64
    %2814 = func.call @stack_pop_pointer() : () -> i64
    %2815 = func.call @cc_nil_value() : () -> i64
    %2816 = func.call @cc_nil_value() : () -> i64
    %2817 = func.call @cc_errorp(%2815) : (i64) -> i64
    %2818 = arith.cmpi ne, %2817, %2816 : i64
    %2819 = scf.if %2818 -> (i64) {
      scf.yield %2815 : i64
    } else {
      %2820 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%2820) : (i64) -> ()
      %2821 = arith.constant 19 : i64
      func.call @stack_push_fixnum(%2821) : (i64) -> ()
      %2857 = arith.constant 275462358040605 : i64
      %2858 = arith.constant 0 : i64
      %2859 = func.call @cc_make_closure(%2857, %2858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2859) : (i64) -> ()
      %2860 = func.call @stack_pop_pointer() : () -> i64
      %2861 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%2860, %2861) : (i64, i64) -> ()
      %2862 = func.call @stack_pop_pointer() : () -> i64
      %2863 = func.call @cc_nil_value() : () -> i64
      %2864 = func.call @cc_nil_value() : () -> i64
      %2865 = func.call @cc_errorp(%2863) : (i64) -> i64
      %2866 = arith.cmpi ne, %2865, %2864 : i64
      %2867 = scf.if %2866 -> (i64) {
        scf.yield %2863 : i64
      } else {
        func.call @stack_push_pointer(%2862) : (i64) -> ()
        %2868 = func.call @stack_pop_pointer() : () -> i64
        %2869 = func.call @cc_nil_value() : () -> i64
        %2870 = func.call @cc_cons(%2869, %2869) : (i64, i64) -> i64
        %2871 = func.call @cc_cons(%2869, %2870) : (i64, i64) -> i64
        %2872 = func.call @cc_cons(%2868, %2871) : (i64, i64) -> i64
        %2873 = func.call @cc_values_pack(%2872) : (i64) -> i64
        func.call @stack_push_pointer(%2873) : (i64) -> ()
        %2874 = func.call @stack_pop_pointer() : () -> i64
        %2875 = func.call @cc_multiple_value_list(%2874) : (i64) -> i64
        %2876 = arith.constant 0 : i64
        %2877 = func.call @cc_box_fixnum(%2876) : (i64) -> i64
        %2878 = func.call @cc_nth(%2877, %2875) : (i64, i64) -> i64
        %2879 = arith.constant 1 : i64
        %2880 = func.call @cc_box_fixnum(%2879) : (i64) -> i64
        %2881 = func.call @cc_nth(%2880, %2875) : (i64, i64) -> i64
        %2882 = arith.constant 2 : i64
        %2883 = func.call @cc_box_fixnum(%2882) : (i64) -> i64
        %2884 = func.call @cc_nth(%2883, %2875) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2878) : (i64) -> ()
        %2885 = func.call @stack_pop_pointer() : () -> i64
        %2886 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%2885, %2886) : (i64, i64) -> ()
        %2887 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2881) : (i64) -> ()
        %2888 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2884) : (i64) -> ()
        %2889 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2890 = func.call @stack_pop_pointer() : () -> i64
        %2891 = func.call @cc_cons(%2889, %2890) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2891) : (i64) -> ()
        %2892 = func.call @stack_pop_pointer() : () -> i64
        %2893 = func.call @cc_cons(%2888, %2892) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2893) : (i64) -> ()
        %2894 = func.call @stack_pop_pointer() : () -> i64
        %2895 = func.call @cc_cons(%2887, %2894) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2895) : (i64) -> ()
        %2896 = func.call @stack_pop_pointer() : () -> i64
        %2897 = func.call @cc_values_pack(%2896) : (i64) -> i64
        func.call @stack_push_pointer(%2897) : (i64) -> ()
        %2898 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2898 : i64
      }
      func.call @stack_push_pointer(%2867) : (i64) -> ()
      %2899 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2899 : i64
    }
    func.call @stack_push_pointer(%2819) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040613"() {
    %3248 = func.call @cc_nil_value() : () -> i64
    %3249 = func.call @cc_nil_value() : () -> i64
    %3250 = func.call @cc_errorp(%3248) : (i64) -> i64
    %3251 = arith.cmpi ne, %3250, %3249 : i64
    %3252 = scf.if %3251 -> (i64) {
      scf.yield %3248 : i64
    } else {
      %3253 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3254 = arith.constant 45 : i64
      %3255 = func.call @cc_make_symbol(%3253, %3254) : (!llvm.ptr, i64) -> i64
      %3256 = func.call @cc_persistent_root_value(%3255) : (i64) -> i64
      %3257 = func.call @cc_symbol_value(%3256) : (i64) -> i64
      %3258 = func.call @cc_errorp(%3257) : (i64) -> i64
      %3259 = func.call @cc_nil_value() : () -> i64
      %3260 = arith.cmpi ne, %3258, %3259 : i64
      %3261 = scf.if %3260 -> (i64) {
        %3262 = arith.constant 189 : i64
        func.call @stack_push_fixnum(%3262) : (i64) -> ()
        %3263 = func.call @stack_pop_pointer() : () -> i64
        %3264 = arith.constant 911 : i64
        func.call @stack_push_fixnum(%3264) : (i64) -> ()
        %3265 = func.call @stack_pop_pointer() : () -> i64
        %3267 = arith.constant 3 : i64
        %3266 = arith.andi %3263, %3267 : i64
        %3268 = arith.constant 0 : i64
        %3269 = arith.cmpi eq, %3266, %3268 : i64
        %3271 = arith.constant 3 : i64
        %3270 = arith.andi %3265, %3271 : i64
        %3272 = arith.constant 0 : i64
        %3273 = arith.cmpi eq, %3270, %3272 : i64
        %3274 = arith.andi %3269, %3273 : i1
        %3275 = scf.if %3274 -> (i64) {
          %3276 = arith.constant 2 : i64
          %3277 = arith.shrsi %3263, %3276 : i64
          %3278 = arith.constant 2 : i64
          %3279 = arith.shrsi %3265, %3278 : i64
          %3280 = arith.addi %3277, %3279 : i64
          %3281 = arith.constant -2305843009213693952 : i64
          %3282 = arith.constant 2305843009213693951 : i64
          %3283 = arith.cmpi sge, %3280, %3281 : i64
          %3284 = arith.cmpi sle, %3280, %3282 : i64
          %3285 = arith.andi %3283, %3284 : i1
          %3286 = scf.if %3285 -> (i64) {
            %3287 = arith.constant 2 : i64
            %3288 = arith.shli %3280, %3287 : i64
            scf.yield %3288 : i64
          } else {
            %3289 = func.call @cc_add(%3263, %3265) : (i64, i64) -> i64
            scf.yield %3289 : i64
          }
          scf.yield %3286 : i64
        } else {
          %3290 = func.call @cc_add(%3263, %3265) : (i64, i64) -> i64
          scf.yield %3290 : i64
        }
        func.call @stack_push_pointer(%3275) : (i64) -> ()
        %3291 = func.call @stack_pop_pointer() : () -> i64
        %3292 = func.call @cc_persistent_root_value(%3291) : (i64) -> i64
        %3293 = func.call @cc_set_symbol_value(%3256, %3292) : (i64, i64) -> i64
        scf.yield %3292 : i64
      } else {
        scf.yield %3257 : i64
      }
      func.call @stack_push_pointer(%3261) : (i64) -> ()
      %3294 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3294 : i64
    }
    func.call @stack_push_pointer(%3252) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040612"() {
    %3240 = func.call @stack_pop_pointer() : () -> i64
    %3241 = func.call @stack_pop_pointer() : () -> i64
    %3242 = func.call @stack_pop_pointer() : () -> i64
    %3243 = func.call @cc_nil_value() : () -> i64
    %3244 = func.call @cc_nil_value() : () -> i64
    %3245 = func.call @cc_errorp(%3243) : (i64) -> i64
    %3246 = arith.cmpi ne, %3245, %3244 : i64
    %3247 = scf.if %3246 -> (i64) {
      scf.yield %3243 : i64
    } else {
      %3295 = arith.constant 275462358040613 : i64
      %3296 = arith.constant 0 : i64
      %3297 = func.call @cc_make_closure(%3295, %3296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3297) : (i64) -> ()
      %3298 = func.call @stack_pop_pointer() : () -> i64
      %3299 = func.call @cc_nil_value() : () -> i64
      %3300 = func.call @cc_cons(%3299, %3299) : (i64, i64) -> i64
      %3301 = func.call @cc_cons(%3299, %3300) : (i64, i64) -> i64
      %3302 = func.call @cc_cons(%3298, %3301) : (i64, i64) -> i64
      %3303 = func.call @cc_values_pack(%3302) : (i64) -> i64
      func.call @stack_push_pointer(%3303) : (i64) -> ()
      %3304 = func.call @stack_pop_pointer() : () -> i64
      %3305 = func.call @cc_multiple_value_list(%3304) : (i64) -> i64
      %3306 = arith.constant 0 : i64
      %3307 = func.call @cc_box_fixnum(%3306) : (i64) -> i64
      %3308 = func.call @cc_nth(%3307, %3305) : (i64, i64) -> i64
      %3309 = arith.constant 1 : i64
      %3310 = func.call @cc_box_fixnum(%3309) : (i64) -> i64
      %3311 = func.call @cc_nth(%3310, %3305) : (i64, i64) -> i64
      %3312 = arith.constant 2 : i64
      %3313 = func.call @cc_box_fixnum(%3312) : (i64) -> i64
      %3314 = func.call @cc_nth(%3313, %3305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3308) : (i64) -> ()
      %3315 = func.call @stack_pop_pointer() : () -> i64
      %3316 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%3315, %3316) : (i64, i64) -> ()
      %3317 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3311) : (i64) -> ()
      %3318 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3314) : (i64) -> ()
      %3319 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3320 = func.call @stack_pop_pointer() : () -> i64
      %3321 = func.call @cc_cons(%3319, %3320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3321) : (i64) -> ()
      %3322 = func.call @stack_pop_pointer() : () -> i64
      %3323 = func.call @cc_cons(%3318, %3322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3323) : (i64) -> ()
      %3324 = func.call @stack_pop_pointer() : () -> i64
      %3325 = func.call @cc_cons(%3317, %3324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3325) : (i64) -> ()
      %3326 = func.call @stack_pop_pointer() : () -> i64
      %3327 = func.call @cc_values_pack(%3326) : (i64) -> i64
      func.call @stack_push_pointer(%3327) : (i64) -> ()
      %3328 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3328 : i64
    }
    func.call @stack_push_pointer(%3247) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040618"() {
    %3688 = func.call @cc_nil_value() : () -> i64
    %3689 = func.call @cc_nil_value() : () -> i64
    %3690 = func.call @cc_errorp(%3688) : (i64) -> i64
    %3691 = arith.cmpi ne, %3690, %3689 : i64
    %3692 = scf.if %3691 -> (i64) {
      scf.yield %3688 : i64
    } else {
      %3693 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3694 = arith.constant 45 : i64
      %3695 = func.call @cc_make_symbol(%3693, %3694) : (!llvm.ptr, i64) -> i64
      %3696 = func.call @cc_persistent_root_value(%3695) : (i64) -> i64
      %3697 = func.call @cc_symbol_value(%3696) : (i64) -> i64
      %3698 = func.call @cc_errorp(%3697) : (i64) -> i64
      %3699 = func.call @cc_nil_value() : () -> i64
      %3700 = arith.cmpi ne, %3698, %3699 : i64
      %3701 = scf.if %3700 -> (i64) {
        %3702 = arith.constant 189 : i64
        func.call @stack_push_fixnum(%3702) : (i64) -> ()
        %3703 = func.call @stack_pop_pointer() : () -> i64
        %3704 = arith.constant 911 : i64
        func.call @stack_push_fixnum(%3704) : (i64) -> ()
        %3705 = func.call @stack_pop_pointer() : () -> i64
        %3707 = arith.constant 3 : i64
        %3706 = arith.andi %3703, %3707 : i64
        %3708 = arith.constant 0 : i64
        %3709 = arith.cmpi eq, %3706, %3708 : i64
        %3711 = arith.constant 3 : i64
        %3710 = arith.andi %3705, %3711 : i64
        %3712 = arith.constant 0 : i64
        %3713 = arith.cmpi eq, %3710, %3712 : i64
        %3714 = arith.andi %3709, %3713 : i1
        %3715 = scf.if %3714 -> (i64) {
          %3716 = arith.constant 2 : i64
          %3717 = arith.shrsi %3703, %3716 : i64
          %3718 = arith.constant 2 : i64
          %3719 = arith.shrsi %3705, %3718 : i64
          %3720 = arith.addi %3717, %3719 : i64
          %3721 = arith.constant -2305843009213693952 : i64
          %3722 = arith.constant 2305843009213693951 : i64
          %3723 = arith.cmpi sge, %3720, %3721 : i64
          %3724 = arith.cmpi sle, %3720, %3722 : i64
          %3725 = arith.andi %3723, %3724 : i1
          %3726 = scf.if %3725 -> (i64) {
            %3727 = arith.constant 2 : i64
            %3728 = arith.shli %3720, %3727 : i64
            scf.yield %3728 : i64
          } else {
            %3729 = func.call @cc_add(%3703, %3705) : (i64, i64) -> i64
            scf.yield %3729 : i64
          }
          scf.yield %3726 : i64
        } else {
          %3730 = func.call @cc_add(%3703, %3705) : (i64, i64) -> i64
          scf.yield %3730 : i64
        }
        func.call @stack_push_pointer(%3715) : (i64) -> ()
        %3731 = func.call @stack_pop_pointer() : () -> i64
        %3732 = func.call @cc_persistent_root_value(%3731) : (i64) -> i64
        %3733 = func.call @cc_set_symbol_value(%3696, %3732) : (i64, i64) -> i64
        scf.yield %3732 : i64
      } else {
        scf.yield %3697 : i64
      }
      func.call @stack_push_pointer(%3701) : (i64) -> ()
      %3734 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3734 : i64
    }
    func.call @stack_push_pointer(%3692) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040617"() {
    %3680 = func.call @stack_pop_pointer() : () -> i64
    %3681 = func.call @stack_pop_pointer() : () -> i64
    %3682 = func.call @stack_pop_pointer() : () -> i64
    %3683 = func.call @cc_nil_value() : () -> i64
    %3684 = func.call @cc_nil_value() : () -> i64
    %3685 = func.call @cc_errorp(%3683) : (i64) -> i64
    %3686 = arith.cmpi ne, %3685, %3684 : i64
    %3687 = scf.if %3686 -> (i64) {
      scf.yield %3683 : i64
    } else {
      %3735 = arith.constant 275462358040618 : i64
      %3736 = arith.constant 0 : i64
      %3737 = func.call @cc_make_closure(%3735, %3736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3737) : (i64) -> ()
      %3738 = func.call @stack_pop_pointer() : () -> i64
      %3739 = func.call @cc_nil_value() : () -> i64
      %3740 = func.call @cc_cons(%3739, %3739) : (i64, i64) -> i64
      %3741 = func.call @cc_cons(%3739, %3740) : (i64, i64) -> i64
      %3742 = func.call @cc_cons(%3738, %3741) : (i64, i64) -> i64
      %3743 = func.call @cc_values_pack(%3742) : (i64) -> i64
      func.call @stack_push_pointer(%3743) : (i64) -> ()
      %3744 = func.call @stack_pop_pointer() : () -> i64
      %3745 = func.call @cc_multiple_value_list(%3744) : (i64) -> i64
      %3746 = arith.constant 0 : i64
      %3747 = func.call @cc_box_fixnum(%3746) : (i64) -> i64
      %3748 = func.call @cc_nth(%3747, %3745) : (i64, i64) -> i64
      %3749 = arith.constant 1 : i64
      %3750 = func.call @cc_box_fixnum(%3749) : (i64) -> i64
      %3751 = func.call @cc_nth(%3750, %3745) : (i64, i64) -> i64
      %3752 = arith.constant 2 : i64
      %3753 = func.call @cc_box_fixnum(%3752) : (i64) -> i64
      %3754 = func.call @cc_nth(%3753, %3745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3748) : (i64) -> ()
      %3755 = func.call @stack_pop_pointer() : () -> i64
      %3756 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%3755, %3756) : (i64, i64) -> ()
      %3757 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3751) : (i64) -> ()
      %3758 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%3754) : (i64) -> ()
      %3759 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3760 = func.call @stack_pop_pointer() : () -> i64
      %3761 = func.call @cc_cons(%3759, %3760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3761) : (i64) -> ()
      %3762 = func.call @stack_pop_pointer() : () -> i64
      %3763 = func.call @cc_cons(%3758, %3762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3763) : (i64) -> ()
      %3764 = func.call @stack_pop_pointer() : () -> i64
      %3765 = func.call @cc_cons(%3757, %3764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3765) : (i64) -> ()
      %3766 = func.call @stack_pop_pointer() : () -> i64
      %3767 = func.call @cc_values_pack(%3766) : (i64) -> i64
      func.call @stack_push_pointer(%3767) : (i64) -> ()
      %3768 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3768 : i64
    }
    func.call @stack_push_pointer(%3687) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040623"() {
    %4220 = func.call @cc_nil_value() : () -> i64
    %4221 = func.call @cc_nil_value() : () -> i64
    %4222 = func.call @cc_errorp(%4220) : (i64) -> i64
    %4223 = arith.cmpi ne, %4222, %4221 : i64
    %4224 = scf.if %4223 -> (i64) {
      scf.yield %4220 : i64
    } else {
      %4225 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4226 = arith.constant 45 : i64
      %4227 = func.call @cc_make_symbol(%4225, %4226) : (!llvm.ptr, i64) -> i64
      %4228 = func.call @cc_persistent_root_value(%4227) : (i64) -> i64
      %4229 = func.call @cc_symbol_value(%4228) : (i64) -> i64
      %4230 = func.call @cc_errorp(%4229) : (i64) -> i64
      %4231 = func.call @cc_nil_value() : () -> i64
      %4232 = arith.cmpi ne, %4230, %4231 : i64
      %4233 = scf.if %4232 -> (i64) {
        %4234 = func.call @cc_nil_value() : () -> i64
        %4235 = llvm.mlir.addressof @str338 : !llvm.ptr
        %4236 = arith.constant 10 : i64
        %4237 = func.call @cc_make_string(%4235, %4236) : (!llvm.ptr, i64) -> i64
        %4238 = func.call @cc_nil_value() : () -> i64
        %4239 = func.call @cc_intern(%4237, %4238) : (i64, i64) -> i64
        %4240 = func.call @cc_nil_value() : () -> i64
        %4241 = func.call @cc_cons(%4239, %4240) : (i64, i64) -> i64
        %4242 = func.call @cc_values_pack(%4241) : (i64) -> i64
        func.call @stack_push_pointer(%4239) : (i64) -> ()
        %4243 = func.call @stack_pop_pointer() : () -> i64
        %4244 = func.call @cc_make_instance(%4243, %4234) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4244) : (i64) -> ()
        %4245 = func.call @stack_pop_pointer() : () -> i64
        %4246 = func.call @cc_persistent_root_value(%4245) : (i64) -> i64
        %4247 = func.call @cc_set_symbol_value(%4228, %4246) : (i64, i64) -> i64
        scf.yield %4246 : i64
      } else {
        scf.yield %4229 : i64
      }
      func.call @stack_push_pointer(%4233) : (i64) -> ()
      %4248 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4248 : i64
    }
    func.call @stack_push_pointer(%4224) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040622"() {
    %4212 = func.call @stack_pop_pointer() : () -> i64
    %4213 = func.call @stack_pop_pointer() : () -> i64
    %4214 = func.call @stack_pop_pointer() : () -> i64
    %4215 = func.call @cc_nil_value() : () -> i64
    %4216 = func.call @cc_nil_value() : () -> i64
    %4217 = func.call @cc_errorp(%4215) : (i64) -> i64
    %4218 = arith.cmpi ne, %4217, %4216 : i64
    %4219 = scf.if %4218 -> (i64) {
      scf.yield %4215 : i64
    } else {
      %4249 = arith.constant 275462358040623 : i64
      %4250 = arith.constant 0 : i64
      %4251 = func.call @cc_make_closure(%4249, %4250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4251) : (i64) -> ()
      %4252 = func.call @stack_pop_pointer() : () -> i64
      %4253 = func.call @cc_nil_value() : () -> i64
      %4254 = func.call @cc_cons(%4253, %4253) : (i64, i64) -> i64
      %4255 = func.call @cc_cons(%4253, %4254) : (i64, i64) -> i64
      %4256 = func.call @cc_cons(%4252, %4255) : (i64, i64) -> i64
      %4257 = func.call @cc_values_pack(%4256) : (i64) -> i64
      func.call @stack_push_pointer(%4257) : (i64) -> ()
      %4258 = func.call @stack_pop_pointer() : () -> i64
      %4259 = func.call @cc_multiple_value_list(%4258) : (i64) -> i64
      %4260 = arith.constant 0 : i64
      %4261 = func.call @cc_box_fixnum(%4260) : (i64) -> i64
      %4262 = func.call @cc_nth(%4261, %4259) : (i64, i64) -> i64
      %4263 = arith.constant 1 : i64
      %4264 = func.call @cc_box_fixnum(%4263) : (i64) -> i64
      %4265 = func.call @cc_nth(%4264, %4259) : (i64, i64) -> i64
      %4266 = arith.constant 2 : i64
      %4267 = func.call @cc_box_fixnum(%4266) : (i64) -> i64
      %4268 = func.call @cc_nth(%4267, %4259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4262) : (i64) -> ()
      %4269 = func.call @stack_pop_pointer() : () -> i64
      %4270 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%4269, %4270) : (i64, i64) -> ()
      %4271 = func.call @stack_pop_pointer() : () -> i64
      %4272 = func.call @cc_class_of(%4271) : (i64) -> i64
      func.call @stack_push_pointer(%4272) : (i64) -> ()
      %4273 = func.call @stack_pop_pointer() : () -> i64
      %4274 = func.call @cc_class_name(%4273) : (i64) -> i64
      func.call @stack_push_pointer(%4274) : (i64) -> ()
      %4275 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4265) : (i64) -> ()
      %4276 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4268) : (i64) -> ()
      %4277 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4278 = func.call @stack_pop_pointer() : () -> i64
      %4279 = func.call @cc_cons(%4277, %4278) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4279) : (i64) -> ()
      %4280 = func.call @stack_pop_pointer() : () -> i64
      %4281 = func.call @cc_cons(%4276, %4280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4281) : (i64) -> ()
      %4282 = func.call @stack_pop_pointer() : () -> i64
      %4283 = func.call @cc_cons(%4275, %4282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4283) : (i64) -> ()
      %4284 = func.call @stack_pop_pointer() : () -> i64
      %4285 = func.call @cc_values_pack(%4284) : (i64) -> i64
      func.call @stack_push_pointer(%4285) : (i64) -> ()
      %4286 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4286 : i64
    }
    func.call @stack_push_pointer(%4219) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040628"() {
    %4701 = func.call @cc_nil_value() : () -> i64
    %4702 = func.call @cc_nil_value() : () -> i64
    %4703 = func.call @cc_errorp(%4701) : (i64) -> i64
    %4704 = arith.cmpi ne, %4703, %4702 : i64
    %4705 = scf.if %4704 -> (i64) {
      scf.yield %4701 : i64
    } else {
      %4706 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4707 = arith.constant 45 : i64
      %4708 = func.call @cc_make_symbol(%4706, %4707) : (!llvm.ptr, i64) -> i64
      %4709 = func.call @cc_persistent_root_value(%4708) : (i64) -> i64
      %4710 = func.call @cc_symbol_value(%4709) : (i64) -> i64
      %4711 = func.call @cc_errorp(%4710) : (i64) -> i64
      %4712 = func.call @cc_nil_value() : () -> i64
      %4713 = arith.cmpi ne, %4711, %4712 : i64
      %4714 = scf.if %4713 -> (i64) {
        %4715 = func.call @cc_nil_value() : () -> i64
        %4716 = llvm.mlir.addressof @str381 : !llvm.ptr
        %4717 = arith.constant 10 : i64
        %4718 = func.call @cc_make_string(%4716, %4717) : (!llvm.ptr, i64) -> i64
        %4719 = func.call @cc_nil_value() : () -> i64
        %4720 = func.call @cc_intern(%4718, %4719) : (i64, i64) -> i64
        %4721 = func.call @cc_nil_value() : () -> i64
        %4722 = func.call @cc_cons(%4720, %4721) : (i64, i64) -> i64
        %4723 = func.call @cc_values_pack(%4722) : (i64) -> i64
        func.call @stack_push_pointer(%4720) : (i64) -> ()
        %4724 = func.call @stack_pop_pointer() : () -> i64
        %4725 = func.call @cc_make_instance(%4724, %4715) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4725) : (i64) -> ()
        %4726 = func.call @stack_pop_pointer() : () -> i64
        %4727 = func.call @cc_persistent_root_value(%4726) : (i64) -> i64
        %4728 = func.call @cc_set_symbol_value(%4709, %4727) : (i64, i64) -> i64
        scf.yield %4727 : i64
      } else {
        scf.yield %4710 : i64
      }
      func.call @stack_push_pointer(%4714) : (i64) -> ()
      %4729 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4729 : i64
    }
    func.call @stack_push_pointer(%4705) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040627"() {
    %4693 = func.call @stack_pop_pointer() : () -> i64
    %4694 = func.call @stack_pop_pointer() : () -> i64
    %4695 = func.call @stack_pop_pointer() : () -> i64
    %4696 = func.call @cc_nil_value() : () -> i64
    %4697 = func.call @cc_nil_value() : () -> i64
    %4698 = func.call @cc_errorp(%4696) : (i64) -> i64
    %4699 = arith.cmpi ne, %4698, %4697 : i64
    %4700 = scf.if %4699 -> (i64) {
      scf.yield %4696 : i64
    } else {
      %4730 = arith.constant 275462358040628 : i64
      %4731 = arith.constant 0 : i64
      %4732 = func.call @cc_make_closure(%4730, %4731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4732) : (i64) -> ()
      %4733 = func.call @stack_pop_pointer() : () -> i64
      %4734 = func.call @cc_nil_value() : () -> i64
      %4735 = func.call @cc_cons(%4734, %4734) : (i64, i64) -> i64
      %4736 = func.call @cc_cons(%4734, %4735) : (i64, i64) -> i64
      %4737 = func.call @cc_cons(%4733, %4736) : (i64, i64) -> i64
      %4738 = func.call @cc_values_pack(%4737) : (i64) -> i64
      func.call @stack_push_pointer(%4738) : (i64) -> ()
      %4739 = func.call @stack_pop_pointer() : () -> i64
      %4740 = func.call @cc_multiple_value_list(%4739) : (i64) -> i64
      %4741 = arith.constant 0 : i64
      %4742 = func.call @cc_box_fixnum(%4741) : (i64) -> i64
      %4743 = func.call @cc_nth(%4742, %4740) : (i64, i64) -> i64
      %4744 = arith.constant 1 : i64
      %4745 = func.call @cc_box_fixnum(%4744) : (i64) -> i64
      %4746 = func.call @cc_nth(%4745, %4740) : (i64, i64) -> i64
      %4747 = arith.constant 2 : i64
      %4748 = func.call @cc_box_fixnum(%4747) : (i64) -> i64
      %4749 = func.call @cc_nth(%4748, %4740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4743) : (i64) -> ()
      %4750 = func.call @stack_pop_pointer() : () -> i64
      %4751 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%4750, %4751) : (i64, i64) -> ()
      %4752 = func.call @stack_pop_pointer() : () -> i64
      %4753 = func.call @cc_class_of(%4752) : (i64) -> i64
      func.call @stack_push_pointer(%4753) : (i64) -> ()
      %4754 = func.call @stack_pop_pointer() : () -> i64
      %4755 = func.call @cc_class_name(%4754) : (i64) -> i64
      func.call @stack_push_pointer(%4755) : (i64) -> ()
      %4756 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4746) : (i64) -> ()
      %4757 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%4749) : (i64) -> ()
      %4758 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4759 = func.call @stack_pop_pointer() : () -> i64
      %4760 = func.call @cc_cons(%4758, %4759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4760) : (i64) -> ()
      %4761 = func.call @stack_pop_pointer() : () -> i64
      %4762 = func.call @cc_cons(%4757, %4761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4762) : (i64) -> ()
      %4763 = func.call @stack_pop_pointer() : () -> i64
      %4764 = func.call @cc_cons(%4756, %4763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4764) : (i64) -> ()
      %4765 = func.call @stack_pop_pointer() : () -> i64
      %4766 = func.call @cc_values_pack(%4765) : (i64) -> i64
      func.call @stack_push_pointer(%4766) : (i64) -> ()
      %4767 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4767 : i64
    }
    func.call @stack_push_pointer(%4700) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040633"() {
    %5247 = func.call @cc_nil_value() : () -> i64
    %5248 = func.call @cc_nil_value() : () -> i64
    %5249 = func.call @cc_errorp(%5247) : (i64) -> i64
    %5250 = arith.cmpi ne, %5249, %5248 : i64
    %5251 = scf.if %5250 -> (i64) {
      scf.yield %5247 : i64
    } else {
      %5252 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5253 = arith.constant 45 : i64
      %5254 = func.call @cc_make_symbol(%5252, %5253) : (!llvm.ptr, i64) -> i64
      %5255 = func.call @cc_persistent_root_value(%5254) : (i64) -> i64
      %5256 = func.call @cc_symbol_value(%5255) : (i64) -> i64
      %5257 = func.call @cc_errorp(%5256) : (i64) -> i64
      %5258 = func.call @cc_nil_value() : () -> i64
      %5259 = arith.cmpi ne, %5257, %5258 : i64
      %5260 = scf.if %5259 -> (i64) {
        %5261 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%5261) : (i64) -> ()
        %5262 = func.call @stack_pop_pointer() : () -> i64
        %5263 = func.call @cc_nil_value() : () -> i64
        %5264 = func.call @cc_errorp(%5262) : (i64) -> i64
        %5265 = arith.cmpi ne, %5264, %5263 : i64
        %5266 = arith.cmpi eq, %5263, %5263 : i64
        %5267 = arith.andi %5265, %5266 : i1
        %5268 = scf.if %5267 -> (i64) {
          scf.yield %5262 : i64
        } else {
          scf.yield %5263 : i64
        }
        %5269 = arith.cmpi ne, %5268, %5263 : i64
        scf.if %5269 {
          func.call @stack_push_pointer(%5268) : (i64) -> ()
        } else {
          %5270 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%5270) : (i64) -> ()
          func.call @stack_push_pointer(%5262) : (i64) -> ()
          %5271 = func.call @stack_pop_pointer() : () -> i64
          %5272 = func.call @stack_pop_pointer() : () -> i64
          %5273 = func.call @cc_cons(%5271, %5272) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5273) : (i64) -> ()
        }
        %5274 = func.call @stack_pop_pointer() : () -> i64
        %5275 = func.call @cc_persistent_root_value(%5274) : (i64) -> i64
        %5276 = func.call @cc_set_symbol_value(%5255, %5275) : (i64, i64) -> i64
        scf.yield %5275 : i64
      } else {
        scf.yield %5256 : i64
      }
      func.call @stack_push_pointer(%5260) : (i64) -> ()
      %5277 = func.call @stack_pop_pointer() : () -> i64
      %5278 = func.call @cc_car(%5277) : (i64) -> i64
      func.call @stack_push_pointer(%5278) : (i64) -> ()
      %5279 = func.call @stack_pop_pointer() : () -> i64
      %5280 = arith.constant 1 : i64
      %5281 = func.call @cc_box_fixnum(%5280) : (i64) -> i64
      func.call @stack_push_pointer(%5281) : (i64) -> ()
      %5282 = func.call @stack_pop_pointer() : () -> i64
      %5284 = arith.constant 3 : i64
      %5283 = arith.andi %5279, %5284 : i64
      %5285 = arith.constant 0 : i64
      %5286 = arith.cmpi eq, %5283, %5285 : i64
      %5288 = arith.constant 3 : i64
      %5287 = arith.andi %5282, %5288 : i64
      %5289 = arith.constant 0 : i64
      %5290 = arith.cmpi eq, %5287, %5289 : i64
      %5291 = arith.andi %5286, %5290 : i1
      %5292 = scf.if %5291 -> (i64) {
        %5293 = arith.constant 2 : i64
        %5294 = arith.shrsi %5279, %5293 : i64
        %5295 = arith.constant 2 : i64
        %5296 = arith.shrsi %5282, %5295 : i64
        %5297 = arith.addi %5294, %5296 : i64
        %5298 = arith.constant -2305843009213693952 : i64
        %5299 = arith.constant 2305843009213693951 : i64
        %5300 = arith.cmpi sge, %5297, %5298 : i64
        %5301 = arith.cmpi sle, %5297, %5299 : i64
        %5302 = arith.andi %5300, %5301 : i1
        %5303 = scf.if %5302 -> (i64) {
          %5304 = arith.constant 2 : i64
          %5305 = arith.shli %5297, %5304 : i64
          scf.yield %5305 : i64
        } else {
          %5306 = func.call @cc_add(%5279, %5282) : (i64, i64) -> i64
          scf.yield %5306 : i64
        }
        scf.yield %5303 : i64
      } else {
        %5307 = func.call @cc_add(%5279, %5282) : (i64, i64) -> i64
        scf.yield %5307 : i64
      }
      %5308 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5309 = arith.constant 45 : i64
      %5310 = func.call @cc_make_symbol(%5308, %5309) : (!llvm.ptr, i64) -> i64
      %5311 = func.call @cc_persistent_root_value(%5310) : (i64) -> i64
      %5312 = func.call @cc_symbol_value(%5311) : (i64) -> i64
      %5313 = func.call @cc_errorp(%5312) : (i64) -> i64
      %5314 = func.call @cc_nil_value() : () -> i64
      %5315 = arith.cmpi ne, %5313, %5314 : i64
      %5316 = scf.if %5315 -> (i64) {
        %5317 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%5317) : (i64) -> ()
        %5318 = func.call @stack_pop_pointer() : () -> i64
        %5319 = func.call @cc_nil_value() : () -> i64
        %5320 = func.call @cc_errorp(%5318) : (i64) -> i64
        %5321 = arith.cmpi ne, %5320, %5319 : i64
        %5322 = arith.cmpi eq, %5319, %5319 : i64
        %5323 = arith.andi %5321, %5322 : i1
        %5324 = scf.if %5323 -> (i64) {
          scf.yield %5318 : i64
        } else {
          scf.yield %5319 : i64
        }
        %5325 = arith.cmpi ne, %5324, %5319 : i64
        scf.if %5325 {
          func.call @stack_push_pointer(%5324) : (i64) -> ()
        } else {
          %5326 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%5326) : (i64) -> ()
          func.call @stack_push_pointer(%5318) : (i64) -> ()
          %5327 = func.call @stack_pop_pointer() : () -> i64
          %5328 = func.call @stack_pop_pointer() : () -> i64
          %5329 = func.call @cc_cons(%5327, %5328) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5329) : (i64) -> ()
        }
        %5330 = func.call @stack_pop_pointer() : () -> i64
        %5331 = func.call @cc_persistent_root_value(%5330) : (i64) -> i64
        %5332 = func.call @cc_set_symbol_value(%5311, %5331) : (i64, i64) -> i64
        scf.yield %5331 : i64
      } else {
        scf.yield %5312 : i64
      }
      func.call @stack_push_pointer(%5316) : (i64) -> ()
      %5333 = func.call @stack_pop_pointer() : () -> i64
      %5334 = func.call @cc_set_car(%5333, %5292) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5334) : (i64) -> ()
      %5335 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5335 : i64
    }
    func.call @stack_push_pointer(%5251) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040632"() {
    %5239 = func.call @stack_pop_pointer() : () -> i64
    %5240 = func.call @stack_pop_pointer() : () -> i64
    %5241 = func.call @stack_pop_pointer() : () -> i64
    %5242 = func.call @cc_nil_value() : () -> i64
    %5243 = func.call @cc_nil_value() : () -> i64
    %5244 = func.call @cc_errorp(%5242) : (i64) -> i64
    %5245 = arith.cmpi ne, %5244, %5243 : i64
    %5246 = scf.if %5245 -> (i64) {
      scf.yield %5242 : i64
    } else {
      %5336 = arith.constant 275462358040633 : i64
      %5337 = arith.constant 0 : i64
      %5338 = func.call @cc_make_closure(%5336, %5337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5338) : (i64) -> ()
      %5339 = func.call @stack_pop_pointer() : () -> i64
      %5340 = func.call @cc_nil_value() : () -> i64
      %5341 = func.call @cc_nil_value() : () -> i64
      %5342 = func.call @cc_errorp(%5340) : (i64) -> i64
      %5343 = arith.cmpi ne, %5342, %5341 : i64
      %5344 = scf.if %5343 -> (i64) {
        scf.yield %5340 : i64
      } else {
        func.call @stack_push_pointer(%5339) : (i64) -> ()
        %5345 = func.call @stack_pop_pointer() : () -> i64
        %5346 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5345, %5346) : (i64, i64) -> ()
        %5347 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5347 : i64
      }
      %5348 = func.call @cc_nil_value() : () -> i64
      %5349 = func.call @cc_errorp(%5344) : (i64) -> i64
      %5350 = arith.cmpi ne, %5349, %5348 : i64
      %5351 = scf.if %5350 -> (i64) {
        scf.yield %5344 : i64
      } else {
        func.call @stack_push_pointer(%5339) : (i64) -> ()
        %5352 = func.call @stack_pop_pointer() : () -> i64
        %5353 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5352, %5353) : (i64, i64) -> ()
        %5354 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5354 : i64
      }
      %5355 = func.call @cc_nil_value() : () -> i64
      %5356 = func.call @cc_errorp(%5351) : (i64) -> i64
      %5357 = arith.cmpi ne, %5356, %5355 : i64
      %5358 = scf.if %5357 -> (i64) {
        scf.yield %5351 : i64
      } else {
        func.call @stack_push_pointer(%5339) : (i64) -> ()
        %5359 = func.call @stack_pop_pointer() : () -> i64
        %5360 = func.call @cc_nil_value() : () -> i64
        %5361 = func.call @cc_cons(%5360, %5360) : (i64, i64) -> i64
        %5362 = func.call @cc_cons(%5360, %5361) : (i64, i64) -> i64
        %5363 = func.call @cc_cons(%5359, %5362) : (i64, i64) -> i64
        %5364 = func.call @cc_values_pack(%5363) : (i64) -> i64
        func.call @stack_push_pointer(%5364) : (i64) -> ()
        %5365 = func.call @stack_pop_pointer() : () -> i64
        %5366 = func.call @cc_multiple_value_list(%5365) : (i64) -> i64
        %5367 = arith.constant 0 : i64
        %5368 = func.call @cc_box_fixnum(%5367) : (i64) -> i64
        %5369 = func.call @cc_nth(%5368, %5366) : (i64, i64) -> i64
        %5370 = arith.constant 1 : i64
        %5371 = func.call @cc_box_fixnum(%5370) : (i64) -> i64
        %5372 = func.call @cc_nth(%5371, %5366) : (i64, i64) -> i64
        %5373 = arith.constant 2 : i64
        %5374 = func.call @cc_box_fixnum(%5373) : (i64) -> i64
        %5375 = func.call @cc_nth(%5374, %5366) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5369) : (i64) -> ()
        %5376 = func.call @stack_pop_pointer() : () -> i64
        %5377 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5376, %5377) : (i64, i64) -> ()
        %5378 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%5372) : (i64) -> ()
        %5379 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%5375) : (i64) -> ()
        %5380 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5381 = func.call @stack_pop_pointer() : () -> i64
        %5382 = func.call @cc_cons(%5380, %5381) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5382) : (i64) -> ()
        %5383 = func.call @stack_pop_pointer() : () -> i64
        %5384 = func.call @cc_cons(%5379, %5383) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5384) : (i64) -> ()
        %5385 = func.call @stack_pop_pointer() : () -> i64
        %5386 = func.call @cc_cons(%5378, %5385) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5386) : (i64) -> ()
        %5387 = func.call @stack_pop_pointer() : () -> i64
        %5388 = func.call @cc_values_pack(%5387) : (i64) -> i64
        func.call @stack_push_pointer(%5388) : (i64) -> ()
        %5389 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5389 : i64
      }
      func.call @stack_push_pointer(%5358) : (i64) -> ()
      %5390 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5390 : i64
    }
    func.call @stack_push_pointer(%5246) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040638"() {
    %5784 = func.call @cc_nil_value() : () -> i64
    %5785 = func.call @cc_nil_value() : () -> i64
    %5786 = func.call @cc_errorp(%5784) : (i64) -> i64
    %5787 = arith.cmpi ne, %5786, %5785 : i64
    %5788 = scf.if %5787 -> (i64) {
      scf.yield %5784 : i64
    } else {
      %5789 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5790 = arith.constant 45 : i64
      %5791 = func.call @cc_make_symbol(%5789, %5790) : (!llvm.ptr, i64) -> i64
      %5792 = func.call @cc_persistent_root_value(%5791) : (i64) -> i64
      %5793 = func.call @cc_symbol_value(%5792) : (i64) -> i64
      %5794 = func.call @cc_errorp(%5793) : (i64) -> i64
      %5795 = func.call @cc_nil_value() : () -> i64
      %5796 = arith.cmpi ne, %5794, %5795 : i64
      %5797 = scf.if %5796 -> (i64) {
        %5798 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%5798) : (i64) -> ()
        %5799 = func.call @stack_pop_pointer() : () -> i64
        %5800 = func.call @cc_nil_value() : () -> i64
        %5801 = func.call @cc_errorp(%5799) : (i64) -> i64
        %5802 = arith.cmpi ne, %5801, %5800 : i64
        %5803 = arith.cmpi eq, %5800, %5800 : i64
        %5804 = arith.andi %5802, %5803 : i1
        %5805 = scf.if %5804 -> (i64) {
          scf.yield %5799 : i64
        } else {
          scf.yield %5800 : i64
        }
        %5806 = arith.cmpi ne, %5805, %5800 : i64
        scf.if %5806 {
          func.call @stack_push_pointer(%5805) : (i64) -> ()
        } else {
          %5807 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%5807) : (i64) -> ()
          func.call @stack_push_pointer(%5799) : (i64) -> ()
          %5808 = func.call @stack_pop_pointer() : () -> i64
          %5809 = func.call @stack_pop_pointer() : () -> i64
          %5810 = func.call @cc_cons(%5808, %5809) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5810) : (i64) -> ()
        }
        %5811 = func.call @stack_pop_pointer() : () -> i64
        %5812 = func.call @cc_persistent_root_value(%5811) : (i64) -> i64
        %5813 = func.call @cc_set_symbol_value(%5792, %5812) : (i64, i64) -> i64
        scf.yield %5812 : i64
      } else {
        scf.yield %5793 : i64
      }
      func.call @stack_push_pointer(%5797) : (i64) -> ()
      %5814 = func.call @stack_pop_pointer() : () -> i64
      %5815 = func.call @cc_car(%5814) : (i64) -> i64
      func.call @stack_push_pointer(%5815) : (i64) -> ()
      %5816 = func.call @stack_pop_pointer() : () -> i64
      %5817 = arith.constant 1 : i64
      %5818 = func.call @cc_box_fixnum(%5817) : (i64) -> i64
      func.call @stack_push_pointer(%5818) : (i64) -> ()
      %5819 = func.call @stack_pop_pointer() : () -> i64
      %5821 = arith.constant 3 : i64
      %5820 = arith.andi %5816, %5821 : i64
      %5822 = arith.constant 0 : i64
      %5823 = arith.cmpi eq, %5820, %5822 : i64
      %5825 = arith.constant 3 : i64
      %5824 = arith.andi %5819, %5825 : i64
      %5826 = arith.constant 0 : i64
      %5827 = arith.cmpi eq, %5824, %5826 : i64
      %5828 = arith.andi %5823, %5827 : i1
      %5829 = scf.if %5828 -> (i64) {
        %5830 = arith.constant 2 : i64
        %5831 = arith.shrsi %5816, %5830 : i64
        %5832 = arith.constant 2 : i64
        %5833 = arith.shrsi %5819, %5832 : i64
        %5834 = arith.addi %5831, %5833 : i64
        %5835 = arith.constant -2305843009213693952 : i64
        %5836 = arith.constant 2305843009213693951 : i64
        %5837 = arith.cmpi sge, %5834, %5835 : i64
        %5838 = arith.cmpi sle, %5834, %5836 : i64
        %5839 = arith.andi %5837, %5838 : i1
        %5840 = scf.if %5839 -> (i64) {
          %5841 = arith.constant 2 : i64
          %5842 = arith.shli %5834, %5841 : i64
          scf.yield %5842 : i64
        } else {
          %5843 = func.call @cc_add(%5816, %5819) : (i64, i64) -> i64
          scf.yield %5843 : i64
        }
        scf.yield %5840 : i64
      } else {
        %5844 = func.call @cc_add(%5816, %5819) : (i64, i64) -> i64
        scf.yield %5844 : i64
      }
      %5845 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5846 = arith.constant 45 : i64
      %5847 = func.call @cc_make_symbol(%5845, %5846) : (!llvm.ptr, i64) -> i64
      %5848 = func.call @cc_persistent_root_value(%5847) : (i64) -> i64
      %5849 = func.call @cc_symbol_value(%5848) : (i64) -> i64
      %5850 = func.call @cc_errorp(%5849) : (i64) -> i64
      %5851 = func.call @cc_nil_value() : () -> i64
      %5852 = arith.cmpi ne, %5850, %5851 : i64
      %5853 = scf.if %5852 -> (i64) {
        %5854 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%5854) : (i64) -> ()
        %5855 = func.call @stack_pop_pointer() : () -> i64
        %5856 = func.call @cc_nil_value() : () -> i64
        %5857 = func.call @cc_errorp(%5855) : (i64) -> i64
        %5858 = arith.cmpi ne, %5857, %5856 : i64
        %5859 = arith.cmpi eq, %5856, %5856 : i64
        %5860 = arith.andi %5858, %5859 : i1
        %5861 = scf.if %5860 -> (i64) {
          scf.yield %5855 : i64
        } else {
          scf.yield %5856 : i64
        }
        %5862 = arith.cmpi ne, %5861, %5856 : i64
        scf.if %5862 {
          func.call @stack_push_pointer(%5861) : (i64) -> ()
        } else {
          %5863 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%5863) : (i64) -> ()
          func.call @stack_push_pointer(%5855) : (i64) -> ()
          %5864 = func.call @stack_pop_pointer() : () -> i64
          %5865 = func.call @stack_pop_pointer() : () -> i64
          %5866 = func.call @cc_cons(%5864, %5865) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5866) : (i64) -> ()
        }
        %5867 = func.call @stack_pop_pointer() : () -> i64
        %5868 = func.call @cc_persistent_root_value(%5867) : (i64) -> i64
        %5869 = func.call @cc_set_symbol_value(%5848, %5868) : (i64, i64) -> i64
        scf.yield %5868 : i64
      } else {
        scf.yield %5849 : i64
      }
      func.call @stack_push_pointer(%5853) : (i64) -> ()
      %5870 = func.call @stack_pop_pointer() : () -> i64
      %5871 = func.call @cc_set_car(%5870, %5829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5871) : (i64) -> ()
      %5872 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5872 : i64
    }
    func.call @stack_push_pointer(%5788) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040637"() {
    %5779 = func.call @cc_nil_value() : () -> i64
    %5780 = func.call @cc_nil_value() : () -> i64
    %5781 = func.call @cc_errorp(%5779) : (i64) -> i64
    %5782 = arith.cmpi ne, %5781, %5780 : i64
    %5783 = scf.if %5782 -> (i64) {
      scf.yield %5779 : i64
    } else {
      %5873 = arith.constant 275462358040638 : i64
      %5874 = arith.constant 0 : i64
      %5875 = func.call @cc_make_closure(%5873, %5874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5875) : (i64) -> ()
      %5876 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%5876) : (i64) -> ()
      %5877 = func.call @stack_pop_pointer() : () -> i64
      %5878 = func.call @cc_nil_value() : () -> i64
      %5879 = func.call @cc_cons(%5878, %5878) : (i64, i64) -> i64
      %5880 = func.call @cc_cons(%5878, %5879) : (i64, i64) -> i64
      %5881 = func.call @cc_cons(%5877, %5880) : (i64, i64) -> i64
      %5882 = func.call @cc_values_pack(%5881) : (i64) -> i64
      func.call @stack_push_pointer(%5882) : (i64) -> ()
      %5883 = func.call @stack_pop_pointer() : () -> i64
      %5884 = func.call @cc_nil_value() : () -> i64
      %5885 = func.call @cc_nil_value() : () -> i64
      %5886 = func.call @cc_errorp(%5884) : (i64) -> i64
      %5887 = arith.cmpi ne, %5886, %5885 : i64
      %5888 = scf.if %5887 -> (i64) {
        scf.yield %5884 : i64
      } else {
        func.call @stack_push_pointer(%5883) : (i64) -> ()
        %5889 = func.call @stack_pop_pointer() : () -> i64
        %5890 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5889, %5890) : (i64, i64) -> ()
        %5891 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5891 : i64
      }
      %5892 = func.call @cc_nil_value() : () -> i64
      %5893 = func.call @cc_errorp(%5888) : (i64) -> i64
      %5894 = arith.cmpi ne, %5893, %5892 : i64
      %5895 = scf.if %5894 -> (i64) {
        scf.yield %5888 : i64
      } else {
        func.call @stack_push_pointer(%5883) : (i64) -> ()
        %5896 = func.call @stack_pop_pointer() : () -> i64
        %5897 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5896, %5897) : (i64, i64) -> ()
        %5898 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5898 : i64
      }
      %5899 = func.call @cc_nil_value() : () -> i64
      %5900 = func.call @cc_errorp(%5895) : (i64) -> i64
      %5901 = arith.cmpi ne, %5900, %5899 : i64
      %5902 = scf.if %5901 -> (i64) {
        scf.yield %5895 : i64
      } else {
        func.call @stack_push_pointer(%5883) : (i64) -> ()
        %5903 = func.call @stack_pop_pointer() : () -> i64
        %5904 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%5903, %5904) : (i64, i64) -> ()
        %5905 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5905 : i64
      }
      func.call @stack_push_pointer(%5902) : (i64) -> ()
      %5906 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5906 : i64
    }
    func.call @stack_push_pointer(%5783) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040640"() {
    %6361 = func.call @cc_nil_value() : () -> i64
    %6362 = func.call @cc_nil_value() : () -> i64
    %6363 = func.call @cc_errorp(%6361) : (i64) -> i64
    %6364 = arith.cmpi ne, %6363, %6362 : i64
    %6365 = scf.if %6364 -> (i64) {
      scf.yield %6361 : i64
    } else {
      %6366 = llvm.mlir.addressof @str514 : !llvm.ptr
      %6367 = arith.constant 45 : i64
      %6368 = func.call @cc_make_symbol(%6366, %6367) : (!llvm.ptr, i64) -> i64
      %6369 = func.call @cc_persistent_root_value(%6368) : (i64) -> i64
      %6370 = func.call @cc_symbol_value(%6369) : (i64) -> i64
      %6371 = func.call @cc_errorp(%6370) : (i64) -> i64
      %6372 = func.call @cc_nil_value() : () -> i64
      %6373 = arith.cmpi ne, %6371, %6372 : i64
      %6374 = scf.if %6373 -> (i64) {
        %6375 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%6375) : (i64) -> ()
        %6376 = func.call @stack_pop_pointer() : () -> i64
        %6377 = func.call @cc_nil_value() : () -> i64
        %6378 = func.call @cc_errorp(%6376) : (i64) -> i64
        %6379 = arith.cmpi ne, %6378, %6377 : i64
        %6380 = arith.cmpi eq, %6377, %6377 : i64
        %6381 = arith.andi %6379, %6380 : i1
        %6382 = scf.if %6381 -> (i64) {
          scf.yield %6376 : i64
        } else {
          scf.yield %6377 : i64
        }
        %6383 = arith.cmpi ne, %6382, %6377 : i64
        scf.if %6383 {
          func.call @stack_push_pointer(%6382) : (i64) -> ()
        } else {
          %6384 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%6384) : (i64) -> ()
          func.call @stack_push_pointer(%6376) : (i64) -> ()
          %6385 = func.call @stack_pop_pointer() : () -> i64
          %6386 = func.call @stack_pop_pointer() : () -> i64
          %6387 = func.call @cc_cons(%6385, %6386) : (i64, i64) -> i64
          func.call @stack_push_pointer(%6387) : (i64) -> ()
        }
        %6388 = func.call @stack_pop_pointer() : () -> i64
        %6389 = func.call @cc_persistent_root_value(%6388) : (i64) -> i64
        %6390 = func.call @cc_set_symbol_value(%6369, %6389) : (i64, i64) -> i64
        scf.yield %6389 : i64
      } else {
        scf.yield %6370 : i64
      }
      func.call @stack_push_pointer(%6374) : (i64) -> ()
      %6391 = func.call @stack_pop_pointer() : () -> i64
      %6392 = func.call @cc_car(%6391) : (i64) -> i64
      func.call @stack_push_pointer(%6392) : (i64) -> ()
      %6393 = func.call @stack_pop_pointer() : () -> i64
      %6394 = arith.constant 1 : i64
      %6395 = func.call @cc_box_fixnum(%6394) : (i64) -> i64
      func.call @stack_push_pointer(%6395) : (i64) -> ()
      %6396 = func.call @stack_pop_pointer() : () -> i64
      %6398 = arith.constant 3 : i64
      %6397 = arith.andi %6393, %6398 : i64
      %6399 = arith.constant 0 : i64
      %6400 = arith.cmpi eq, %6397, %6399 : i64
      %6402 = arith.constant 3 : i64
      %6401 = arith.andi %6396, %6402 : i64
      %6403 = arith.constant 0 : i64
      %6404 = arith.cmpi eq, %6401, %6403 : i64
      %6405 = arith.andi %6400, %6404 : i1
      %6406 = scf.if %6405 -> (i64) {
        %6407 = arith.constant 2 : i64
        %6408 = arith.shrsi %6393, %6407 : i64
        %6409 = arith.constant 2 : i64
        %6410 = arith.shrsi %6396, %6409 : i64
        %6411 = arith.addi %6408, %6410 : i64
        %6412 = arith.constant -2305843009213693952 : i64
        %6413 = arith.constant 2305843009213693951 : i64
        %6414 = arith.cmpi sge, %6411, %6412 : i64
        %6415 = arith.cmpi sle, %6411, %6413 : i64
        %6416 = arith.andi %6414, %6415 : i1
        %6417 = scf.if %6416 -> (i64) {
          %6418 = arith.constant 2 : i64
          %6419 = arith.shli %6411, %6418 : i64
          scf.yield %6419 : i64
        } else {
          %6420 = func.call @cc_add(%6393, %6396) : (i64, i64) -> i64
          scf.yield %6420 : i64
        }
        scf.yield %6417 : i64
      } else {
        %6421 = func.call @cc_add(%6393, %6396) : (i64, i64) -> i64
        scf.yield %6421 : i64
      }
      %6422 = llvm.mlir.addressof @str515 : !llvm.ptr
      %6423 = arith.constant 45 : i64
      %6424 = func.call @cc_make_symbol(%6422, %6423) : (!llvm.ptr, i64) -> i64
      %6425 = func.call @cc_persistent_root_value(%6424) : (i64) -> i64
      %6426 = func.call @cc_symbol_value(%6425) : (i64) -> i64
      %6427 = func.call @cc_errorp(%6426) : (i64) -> i64
      %6428 = func.call @cc_nil_value() : () -> i64
      %6429 = arith.cmpi ne, %6427, %6428 : i64
      %6430 = scf.if %6429 -> (i64) {
        %6431 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%6431) : (i64) -> ()
        %6432 = func.call @stack_pop_pointer() : () -> i64
        %6433 = func.call @cc_nil_value() : () -> i64
        %6434 = func.call @cc_errorp(%6432) : (i64) -> i64
        %6435 = arith.cmpi ne, %6434, %6433 : i64
        %6436 = arith.cmpi eq, %6433, %6433 : i64
        %6437 = arith.andi %6435, %6436 : i1
        %6438 = scf.if %6437 -> (i64) {
          scf.yield %6432 : i64
        } else {
          scf.yield %6433 : i64
        }
        %6439 = arith.cmpi ne, %6438, %6433 : i64
        scf.if %6439 {
          func.call @stack_push_pointer(%6438) : (i64) -> ()
        } else {
          %6440 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%6440) : (i64) -> ()
          func.call @stack_push_pointer(%6432) : (i64) -> ()
          %6441 = func.call @stack_pop_pointer() : () -> i64
          %6442 = func.call @stack_pop_pointer() : () -> i64
          %6443 = func.call @cc_cons(%6441, %6442) : (i64, i64) -> i64
          func.call @stack_push_pointer(%6443) : (i64) -> ()
        }
        %6444 = func.call @stack_pop_pointer() : () -> i64
        %6445 = func.call @cc_persistent_root_value(%6444) : (i64) -> i64
        %6446 = func.call @cc_set_symbol_value(%6425, %6445) : (i64, i64) -> i64
        scf.yield %6445 : i64
      } else {
        scf.yield %6426 : i64
      }
      func.call @stack_push_pointer(%6430) : (i64) -> ()
      %6447 = func.call @stack_pop_pointer() : () -> i64
      %6448 = func.call @cc_set_car(%6447, %6406) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6448) : (i64) -> ()
      %6449 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6449 : i64
    }
    func.call @stack_push_pointer(%6365) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040639"() {
    %6353 = func.call @stack_pop_pointer() : () -> i64
    %6354 = func.call @stack_pop_pointer() : () -> i64
    %6355 = func.call @stack_pop_pointer() : () -> i64
    %6356 = func.call @cc_nil_value() : () -> i64
    %6357 = func.call @cc_nil_value() : () -> i64
    %6358 = func.call @cc_errorp(%6356) : (i64) -> i64
    %6359 = arith.cmpi ne, %6358, %6357 : i64
    %6360 = scf.if %6359 -> (i64) {
      scf.yield %6356 : i64
    } else {
      %6450 = arith.constant 275462358040640 : i64
      %6451 = arith.constant 0 : i64
      %6452 = func.call @cc_make_closure(%6450, %6451) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6452) : (i64) -> ()
      %6453 = func.call @stack_pop_pointer() : () -> i64
      %6454 = func.call @cc_nil_value() : () -> i64
      %6455 = func.call @cc_nil_value() : () -> i64
      %6456 = func.call @cc_errorp(%6454) : (i64) -> i64
      %6457 = arith.cmpi ne, %6456, %6455 : i64
      %6458 = scf.if %6457 -> (i64) {
        scf.yield %6454 : i64
      } else {
        func.call @stack_push_pointer(%6453) : (i64) -> ()
        %6459 = func.call @stack_pop_pointer() : () -> i64
        %6460 = func.call @cc_nil_value() : () -> i64
        %6461 = func.call @cc_cons(%6460, %6460) : (i64, i64) -> i64
        %6462 = func.call @cc_cons(%6460, %6461) : (i64, i64) -> i64
        %6463 = func.call @cc_cons(%6459, %6462) : (i64, i64) -> i64
        %6464 = func.call @cc_values_pack(%6463) : (i64) -> i64
        func.call @stack_push_pointer(%6464) : (i64) -> ()
        %6465 = func.call @stack_pop_pointer() : () -> i64
        %6466 = func.call @cc_multiple_value_list(%6465) : (i64) -> i64
        %6467 = arith.constant 0 : i64
        %6468 = func.call @cc_box_fixnum(%6467) : (i64) -> i64
        %6469 = func.call @cc_nth(%6468, %6466) : (i64, i64) -> i64
        %6470 = arith.constant 1 : i64
        %6471 = func.call @cc_box_fixnum(%6470) : (i64) -> i64
        %6472 = func.call @cc_nth(%6471, %6466) : (i64, i64) -> i64
        %6473 = arith.constant 2 : i64
        %6474 = func.call @cc_box_fixnum(%6473) : (i64) -> i64
        %6475 = func.call @cc_nth(%6474, %6466) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6469) : (i64) -> ()
        %6476 = func.call @stack_pop_pointer() : () -> i64
        %6477 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6476, %6477) : (i64, i64) -> ()
        %6478 = func.call @stack_depth() : () -> i64
        %6479 = arith.constant 0 : i64
        %6480 = arith.cmpi sgt, %6478, %6479 : i64
        scf.if %6480 {
          %6481 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%6469) : (i64) -> ()
        %6482 = func.call @stack_pop_pointer() : () -> i64
        %6483 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6482, %6483) : (i64, i64) -> ()
        %6484 = func.call @stack_depth() : () -> i64
        %6485 = arith.constant 0 : i64
        %6486 = arith.cmpi sgt, %6484, %6485 : i64
        scf.if %6486 {
          %6487 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%6453) : (i64) -> ()
        %6488 = func.call @stack_pop_pointer() : () -> i64
        %6489 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%6488, %6489) : (i64, i64) -> ()
        %6490 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%6472) : (i64) -> ()
        %6491 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%6475) : (i64) -> ()
        %6492 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %6493 = func.call @stack_pop_pointer() : () -> i64
        %6494 = func.call @cc_cons(%6492, %6493) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6494) : (i64) -> ()
        %6495 = func.call @stack_pop_pointer() : () -> i64
        %6496 = func.call @cc_cons(%6491, %6495) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6496) : (i64) -> ()
        %6497 = func.call @stack_pop_pointer() : () -> i64
        %6498 = func.call @cc_cons(%6490, %6497) : (i64, i64) -> i64
        func.call @stack_push_pointer(%6498) : (i64) -> ()
        %6499 = func.call @stack_pop_pointer() : () -> i64
        %6500 = func.call @cc_values_pack(%6499) : (i64) -> i64
        func.call @stack_push_pointer(%6500) : (i64) -> ()
        %6501 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %6501 : i64
      }
      func.call @stack_push_pointer(%6458) : (i64) -> ()
      %6502 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6502 : i64
    }
    func.call @stack_push_pointer(%6360) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040647"() {
    %7069 = func.call @stack_pop_pointer() : () -> i64
    %7070 = func.call @stack_pop_pointer() : () -> i64
    %7071 = func.call @cc_symbol_value(%7070) : (i64) -> i64
    func.call @stack_push_pointer(%7071) : (i64) -> ()
    func.call @stack_push_pointer(%7069) : (i64) -> ()
    %7072 = func.call @stack_pop_pointer() : () -> i64
    %7073 = func.call @stack_pop_pointer() : () -> i64
    %7074 = func.call @cc_eq(%7073, %7072) : (i64, i64) -> i64
    func.call @stack_push_pointer(%7074) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040645"() {
    %7055 = func.call @stack_pop_pointer() : () -> i64
    %7056 = func.call @stack_pop_pointer() : () -> i64
    %7057 = func.call @stack_pop_pointer() : () -> i64
    %7058 = func.call @cc_nil_value() : () -> i64
    %7059 = func.call @cc_nil_value() : () -> i64
    %7060 = func.call @cc_errorp(%7058) : (i64) -> i64
    %7061 = arith.cmpi ne, %7060, %7059 : i64
    %7062 = scf.if %7061 -> (i64) {
      scf.yield %7058 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %7063 = func.call @stack_pop_pointer() : () -> i64
      %7064 = func.call @cc_nil_value() : () -> i64
      %7065 = func.call @cc_nil_value() : () -> i64
      %7066 = func.call @cc_errorp(%7064) : (i64) -> i64
      %7067 = arith.cmpi ne, %7066, %7065 : i64
      %7068 = scf.if %7067 -> (i64) {
        scf.yield %7064 : i64
      } else {
        func.call @stack_push_pointer(%7055) : (i64) -> ()
        %7075 = arith.constant 275462358040647 : i64
        %7076 = arith.constant 1 : i64
        %7077 = func.call @cc_make_closure(%7075, %7076) : (i64, i64) -> i64
        %7078 = llvm.mlir.addressof @str568 : !llvm.ptr
        %7079 = arith.constant 1 : i64
        %7080 = func.call @cc_bind_function_object_const(%7078, %7079, %7077) : (!llvm.ptr, i64, i64) -> i64
        func.call @stack_push_pointer(%7077) : (i64) -> ()
        %7081 = func.call @stack_pop_pointer() : () -> i64
        %7082 = func.call @cc_multiple_value_list(%7081) : (i64) -> i64
        %7083 = func.call @cc_symbol_value(%7055) : (i64) -> i64
        %7084 = func.call @cc_values_pack(%7082) : (i64) -> i64
        func.call @stack_push_pointer(%7084) : (i64) -> ()
        %7085 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7085 : i64
      }
      func.call @stack_push_pointer(%7068) : (i64) -> ()
      %7086 = func.call @stack_pop_pointer() : () -> i64
      %7087 = func.call @cc_nil_value() : () -> i64
      %7088 = func.call @cc_nil_value() : () -> i64
      %7089 = func.call @cc_errorp(%7087) : (i64) -> i64
      %7090 = arith.cmpi ne, %7089, %7088 : i64
      %7091 = scf.if %7090 -> (i64) {
        scf.yield %7087 : i64
      } else {
        func.call @stack_push_pointer(%7086) : (i64) -> ()
        %7092 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7092 : i64
      }
      func.call @stack_push_pointer(%7091) : (i64) -> ()
      %7093 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7093 : i64
    }
    func.call @stack_push_pointer(%7062) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_275462358040644"() {
    %7047 = func.call @stack_pop_pointer() : () -> i64
    %7048 = func.call @stack_pop_pointer() : () -> i64
    %7049 = func.call @stack_pop_pointer() : () -> i64
    %7050 = func.call @cc_nil_value() : () -> i64
    %7051 = func.call @cc_nil_value() : () -> i64
    %7052 = func.call @cc_errorp(%7050) : (i64) -> i64
    %7053 = arith.cmpi ne, %7052, %7051 : i64
    %7054 = scf.if %7053 -> (i64) {
      scf.yield %7050 : i64
    } else {
      %7094 = llvm.mlir.addressof @str569 : !llvm.ptr
      %7095 = arith.constant 30 : i64
      %7096 = func.call @cc_make_symbol(%7094, %7095) : (!llvm.ptr, i64) -> i64
      %7097 = func.call @cc_persistent_root_value(%7096) : (i64) -> i64
      func.call @stack_push_pointer(%7097) : (i64) -> ()
      %7098 = llvm.mlir.addressof @str570 : !llvm.ptr
      %7099 = arith.constant 31 : i64
      %7100 = func.call @cc_make_symbol(%7098, %7099) : (!llvm.ptr, i64) -> i64
      %7101 = func.call @cc_persistent_root_value(%7100) : (i64) -> i64
      func.call @stack_push_pointer(%7101) : (i64) -> ()
      %7102 = llvm.mlir.addressof @str571 : !llvm.ptr
      %7103 = arith.constant 30 : i64
      %7104 = func.call @cc_make_symbol(%7102, %7103) : (!llvm.ptr, i64) -> i64
      %7105 = func.call @cc_persistent_root_value(%7104) : (i64) -> i64
      func.call @stack_push_pointer(%7105) : (i64) -> ()
      %7106 = arith.constant 275462358040645 : i64
      %7107 = arith.constant 3 : i64
      %7108 = func.call @cc_make_closure(%7106, %7107) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7108) : (i64) -> ()
      %7109 = func.call @stack_pop_pointer() : () -> i64
      %7110 = func.call @cc_nil_value() : () -> i64
      %7111 = func.call @cc_nil_value() : () -> i64
      %7112 = func.call @cc_errorp(%7110) : (i64) -> i64
      %7113 = arith.cmpi ne, %7112, %7111 : i64
      %7114 = scf.if %7113 -> (i64) {
        scf.yield %7110 : i64
      } else {
        func.call @stack_push_pointer(%7109) : (i64) -> ()
        %7115 = func.call @stack_pop_pointer() : () -> i64
        %7116 = func.call @cc_nil_value() : () -> i64
        %7117 = func.call @cc_cons(%7116, %7116) : (i64, i64) -> i64
        %7118 = func.call @cc_cons(%7116, %7117) : (i64, i64) -> i64
        %7119 = func.call @cc_cons(%7115, %7118) : (i64, i64) -> i64
        %7120 = func.call @cc_values_pack(%7119) : (i64) -> i64
        func.call @stack_push_pointer(%7120) : (i64) -> ()
        %7121 = func.call @stack_pop_pointer() : () -> i64
        %7122 = func.call @cc_multiple_value_list(%7121) : (i64) -> i64
        %7123 = arith.constant 0 : i64
        %7124 = func.call @cc_box_fixnum(%7123) : (i64) -> i64
        %7125 = func.call @cc_nth(%7124, %7122) : (i64, i64) -> i64
        %7126 = arith.constant 1 : i64
        %7127 = func.call @cc_box_fixnum(%7126) : (i64) -> i64
        %7128 = func.call @cc_nth(%7127, %7122) : (i64, i64) -> i64
        %7129 = arith.constant 2 : i64
        %7130 = func.call @cc_box_fixnum(%7129) : (i64) -> i64
        %7131 = func.call @cc_nth(%7130, %7122) : (i64, i64) -> i64
        func.call @stack_push_nil() : () -> ()
        %7132 = func.call @stack_depth() : () -> i64
        %7133 = arith.constant 0 : i64
        %7134 = arith.cmpi sgt, %7132, %7133 : i64
        scf.if %7134 {
          %7135 = func.call @stack_pop_pointer() : () -> i64
        }
        func.call @stack_push_pointer(%7128) : (i64) -> ()
        %7136 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%7131) : (i64) -> ()
        %7137 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %7138 = func.call @stack_pop_pointer() : () -> i64
        %7139 = func.call @cc_cons(%7137, %7138) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7139) : (i64) -> ()
        %7140 = func.call @stack_pop_pointer() : () -> i64
        %7141 = func.call @cc_cons(%7136, %7140) : (i64, i64) -> i64
        func.call @stack_push_pointer(%7141) : (i64) -> ()
        %7142 = func.call @stack_pop_pointer() : () -> i64
        %7143 = func.call @cc_values_pack(%7142) : (i64) -> i64
        func.call @stack_push_pointer(%7143) : (i64) -> ()
        %7144 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7144 : i64
      }
      func.call @stack_push_pointer(%7114) : (i64) -> ()
      %7145 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7145 : i64
    }
    func.call @stack_push_pointer(%7054) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_275462358040576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_275462358040576*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_275462358040576*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("BTB.CLOSURE-1\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str6("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str8("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str12("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str15("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str16("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str18("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str19("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str20("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str22("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str23("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str24("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str26("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str27("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str32("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str35("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str36("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str37("#:%%DYN-CELL-275462358040580-X\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str38("#:%%DYN-CELL-275462358040581-CC\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str39("#:%%DYN-CELL-275462358040582-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str40("#:%%DYN-CELL-275462358040583-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str41("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str44("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str47("BTB.CLOSURE-2\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str48("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str49("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("WRITE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str53("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str54("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str58("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str61("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str66("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str67("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str69("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str72("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str73("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str74("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str75("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("CREAD\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str77("RWARNINGS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str78("RFAILURE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str79("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str81("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str83("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("CWRITE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str86("WWARNINGS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str87("WFAILURE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str88("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("WRITE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str91("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str93("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str97("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str100("WRITE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str103("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("CREAD\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str105("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str106("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("CWRITE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("RWARNINGS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str113("RFAILURE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str114("WWARNINGS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str115("WFAILURE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str116("#:%%DYN-CELL-275462358040587-X\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str117("#:%%DYN-CELL-275462358040589-CREAD\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str118("#:%%DYN-CELL-275462358040590-CWRITE\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str119("#:%%DYN-CELL-275462358040591-RFAILURE\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str120("#:%%DYN-CELL-275462358040592-RWARNINGS\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str121("#:%%DYN-CELL-275462358040593-WFAILURE\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str122("#:%%DYN-CELL-275462358040594-WWARNINGS\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str123("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str125("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str126("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str127("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str128("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str129("BTB.CLOSURE-3\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str130("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str131("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str132("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str133("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str134("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str136("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str137("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str139("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str140("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str143("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str145("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str146("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str147("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str148("REPEAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str149("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str150("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str153("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str154("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str155("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str158("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str159("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str160("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str162("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str163("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str164("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str165("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str166("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str167("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str168("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str171("#:%%DYN-CELL-275462358040598-X\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str172("#:%%DYN-CELL-275462358040599-Y\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str173("*__MLIR_BLOCK_RETFLAG_275462358040600*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str174("*__MLIR_BLOCK_RETVALUE_275462358040600*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str175("*__MLIR_BLOCK_RETMVLIST_275462358040600*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str176("*__MLIR_BLOCK_RETFLAG_275462358040576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str177("*__MLIR_BLOCK_RETFLAG_275462358040600*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str178("*__MLIR_BLOCK_RETFLAG_275462358040600*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str179("*__MLIR_BLOCK_RETVALUE_275462358040600*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str180("*__MLIR_BLOCK_RETMVLIST_275462358040600*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str181("#:%%DYN-CELL-275462358040601-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str182("#:%%DYN-CELL-275462358040602-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str183("#:%%DYN-CELL-275462358040603-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str184("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str185("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str186("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str188("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str189("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str190("BTB.CLOSURE-4\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str191("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str192("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str193("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str194("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str195("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str197("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str200("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str201("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str202("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str203("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str204("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str206("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str207("Y\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str208("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str209("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str210("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str211("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str212("WARNINGP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str213("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str214("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str215("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str216("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str217("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str218("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str220("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str222("WARNINGP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str223("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str224("#:%%DYN-CELL-275462358040607-X\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str225("#:%%DYN-CELL-275462358040608-Y\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str226("#:%%DYN-CELL-275462358040609-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str227("#:%%DYN-CELL-275462358040610-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str228("#:%%DYN-CELL-275462358040611-WARNINGP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str229("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str230("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str231("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str232("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str233("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str234("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str235("BTB.LTV-1\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str236("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str237("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str238("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str239("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str240("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str241("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str242("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str243("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str245("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str246("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str248("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str249("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str250("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str251("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str252("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str253("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str255("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str256("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str257("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str258("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str259("COMMON-LISP-USER::%RLASP-LTV-B594FC1B77DCDBCF\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str260("#:%%DYN-CELL-275462358040614-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str261("#:%%DYN-CELL-275462358040615-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str262("#:%%DYN-CELL-275462358040616-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str263("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str264("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str265("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str266("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str267("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str268("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str269("BTB.LTV-1-READONLY\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str270("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str271("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str272("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str273("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str274("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str275("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str276("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str277("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str278("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str279("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str280("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str281("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str282("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str283("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str284("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str285("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str286("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str287("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str288("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str290("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str292("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str293("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str294("COMMON-LISP-USER::%RLASP-LTV-8824618E96D583A8\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str295("#:%%DYN-CELL-275462358040619-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str296("#:%%DYN-CELL-275462358040620-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str297("#:%%DYN-CELL-275462358040621-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str298("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str299("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str300("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str301("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str302("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str303("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str304("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str305("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str306("DEFCLASS\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str307("BTB.LTV-2\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str308("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str309("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str310("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str311("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str312("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str313("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str314("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str315("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str317("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str318("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str319("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str320("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str321("MAKE-INSTANCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str322("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str323("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str324("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str325("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str326("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str327("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("CLASS-NAME\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str329("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("CLASS-OF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str331("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str332("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str333("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str334("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str335("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str336("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str337("COMMON-LISP-USER::%RLASP-LTV-E088A40DDF617401\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str338("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str339("#:%%DYN-CELL-275462358040624-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str340("#:%%DYN-CELL-275462358040625-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str341("#:%%DYN-CELL-275462358040626-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str342("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str343("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str344("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str345("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str346("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str347("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str348("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str349("BTB.LTV-2-READONLY\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str350("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str351("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str352("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str353("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str354("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str355("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str356("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str357("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str358("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str359("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str360("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str361("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str362("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str363("MAKE-INSTANCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str364("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str365("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str366("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str367("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str368("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str369("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str370("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str371("CLASS-NAME\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str372("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str373("CLASS-OF\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str374("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str375("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str376("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str377("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str378("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str379("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str380("COMMON-LISP-USER::%RLASP-LTV-CCDA58184C259777\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str381("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str382("#:%%DYN-CELL-275462358040629-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str383("#:%%DYN-CELL-275462358040630-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str384("#:%%DYN-CELL-275462358040631-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str385("UNDUMPABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str386("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str387("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str388("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str389("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str390("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str391("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str392("BTB.LTV-3\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str393("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str394("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str395("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str396("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str397("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str398("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str399("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str400("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str401("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str402("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str403("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str404("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str405("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str406("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str407("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str408("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str409("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str410("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str411("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str412("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str413("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str414("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str415("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str416("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str417("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str418("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str419("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str420("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str421("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str422("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str423("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str424("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str425("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str426("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str427("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str428("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str429("COMMON-LISP-USER::%RLASP-LTV-1AE5A0B414B278B1\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str430("COMMON-LISP-USER::%RLASP-LTV-1AE5A0B414B278B1\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str431("#:%%DYN-CELL-275462358040634-F\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str432("#:%%DYN-CELL-275462358040635-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str433("#:%%DYN-CELL-275462358040636-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str434("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str436("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str437("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str438("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str439("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str440("BTB.LTV-4\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str441("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str442("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str443("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str445("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str446("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str447("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str448("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str449("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str450("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str451("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str452("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str453("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str454("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str455("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str456("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str457("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str458("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str459("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str460("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str461("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str462("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str463("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str464("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str465("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str466("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str467("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str469("COMMON-LISP-USER::%RLASP-LTV-B82DDC19DAE96225\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str470("COMMON-LISP-USER::%RLASP-LTV-B82DDC19DAE96225\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str471("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str472("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str473("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str474("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str475("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str476("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str477("BTB.LTV-5\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str478("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str479("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str480("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str481("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str482("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str483("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str484("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str485("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str486("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str487("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str488("LOAD-TIME-VALUE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str489("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str490("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str491("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str492("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str493("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str494("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str495("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str496("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str497("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str498("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str499("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str500("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str501("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str502("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str503("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str504("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str505("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str506("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str507("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str508("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str509("FUNCALL\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str510("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str511("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str512("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str513("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str514("COMMON-LISP-USER::%RLASP-LTV-2DA3CD2D6B312812\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str515("COMMON-LISP-USER::%RLASP-LTV-2DA3CD2D6B312812\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str516("#:%%DYN-CELL-275462358040641-CC\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str517("#:%%DYN-CELL-275462358040642-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str518("#:%%DYN-CELL-275462358040643-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str519("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str520("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str521("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str522("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str523("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str524("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str525("BTB.MISC-1\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str526("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str527("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str528("BYTECOMPILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str529("CMP\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str530("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str531("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str532("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str533("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str534("EF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str535("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str536("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str537("R\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str538("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str539("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str540("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str541("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str542("EQL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str543("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str544("R\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str545("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str546("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str547("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str549("EF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str550("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str551("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str552("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str553("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str554("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str555("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str556("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str557("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str558("F\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str559("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str560("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str561("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str562("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str563("CC\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str564("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str565("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str566("WARNINGSP\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str567("FAILUREP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str568("f\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str569("#:%%DYN-CELL-275462358040648-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str570("#:%%DYN-CELL-275462358040649-EF\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str571("#:%%DYN-CELL-275462358040650-R\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str572("#:%%DYN-CELL-275462358040651-CC\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str573("#:%%DYN-CELL-275462358040652-FAILUREP\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str574("#:%%DYN-CELL-275462358040653-WARNINGSP\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str575("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str577("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str578("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str579("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str580("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str581("*__MLIR_BLOCK_RETFLAG_275462358040576*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str582("*__MLIR_BLOCK_RETMVLIST_275462358040576*\00") : !llvm.array<41 x i8>
}
