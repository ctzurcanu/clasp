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
      %58 = arith.constant 22 : i64
      %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_intern(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = llvm.mlir.addressof @str6 : !llvm.ptr
      %67 = arith.constant 6 : i64
      %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
      %69 = func.call @cc_nil_value() : () -> i64
      %70 = func.call @cc_intern(%68, %69) : (i64, i64) -> i64
      %71 = func.call @cc_nil_value() : () -> i64
      %72 = func.call @cc_cons(%70, %71) : (i64, i64) -> i64
      %73 = func.call @cc_values_pack(%72) : (i64) -> i64
      func.call @stack_push_pointer(%70) : (i64) -> ()
      %74 = arith.constant 36 : i64
      %75 = func.call @cc_box_character(%74) : (i64) -> i64
      func.call @stack_push_pointer(%75) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %76 = func.call @stack_pop_pointer() : () -> i64
      %77 = func.call @stack_pop_pointer() : () -> i64
      %78 = func.call @cc_cons(%77, %76) : (i64, i64) -> i64
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %79 = func.call @stack_pop_pointer() : () -> i64
      %80 = func.call @stack_pop_pointer() : () -> i64
      %81 = func.call @cc_cons(%80, %79) : (i64, i64) -> i64
      func.call @stack_push_pointer(%81) : (i64) -> ()
      %82 = func.call @stack_pop_pointer() : () -> i64
      %96 = arith.constant 209815645192193 : i64
      %97 = arith.constant 0 : i64
      %98 = func.call @cc_make_closure(%96, %97) : (i64, i64) -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
      %99 = func.call @stack_pop_pointer() : () -> i64
      %100 = llvm.mlir.addressof @str7 : !llvm.ptr
      %101 = arith.constant 13 : i64
      %102 = func.call @cc_make_string(%100, %101) : (!llvm.ptr, i64) -> i64
      %103 = llvm.mlir.addressof @str8 : !llvm.ptr
      %104 = arith.constant 11 : i64
      %105 = func.call @cc_make_string(%103, %104) : (!llvm.ptr, i64) -> i64
      %106 = func.call @cc_intern(%102, %105) : (i64, i64) -> i64
      %107 = func.call @cc_nil_value() : () -> i64
      %108 = func.call @cc_cons(%106, %107) : (i64, i64) -> i64
      %109 = func.call @cc_values_pack(%108) : (i64) -> i64
      func.call @stack_push_pointer(%106) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @stack_pop_pointer() : () -> i64
      %112 = func.call @cc_cons(%111, %110) : (i64, i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %113 = func.call @stack_pop_pointer() : () -> i64
      %114 = llvm.mlir.addressof @str9 : !llvm.ptr
      %115 = arith.constant 11 : i64
      %116 = func.call @cc_make_string(%114, %115) : (!llvm.ptr, i64) -> i64
      %117 = llvm.mlir.addressof @str10 : !llvm.ptr
      %118 = arith.constant 7 : i64
      %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
      %120 = func.call @cc_intern(%116, %119) : (i64, i64) -> i64
      %121 = func.call @cc_nil_value() : () -> i64
      %122 = func.call @cc_cons(%120, %121) : (i64, i64) -> i64
      %123 = func.call @cc_values_pack(%122) : (i64) -> i64
      func.call @stack_push_pointer(%120) : (i64) -> ()
      %124 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = llvm.mlir.addressof @str11 : !llvm.ptr
      %127 = arith.constant 4 : i64
      %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
      %129 = llvm.mlir.addressof @str12 : !llvm.ptr
      %130 = arith.constant 7 : i64
      %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
      %132 = func.call @cc_intern(%128, %131) : (i64, i64) -> i64
      %133 = func.call @cc_nil_value() : () -> i64
      %134 = func.call @cc_cons(%132, %133) : (i64, i64) -> i64
      %135 = func.call @cc_values_pack(%134) : (i64) -> i64
      func.call @stack_push_pointer(%132) : (i64) -> ()
      %136 = func.call @stack_pop_pointer() : () -> i64
      %137 = llvm.mlir.addressof @str13 : !llvm.ptr
      %138 = arith.constant 5 : i64
      %139 = func.call @cc_make_string(%137, %138) : (!llvm.ptr, i64) -> i64
      %140 = func.call @cc_nil_value() : () -> i64
      %141 = func.call @cc_intern(%139, %140) : (i64, i64) -> i64
      %142 = func.call @cc_nil_value() : () -> i64
      %143 = func.call @cc_cons(%141, %142) : (i64, i64) -> i64
      %144 = func.call @cc_values_pack(%143) : (i64) -> i64
      func.call @stack_push_pointer(%141) : (i64) -> ()
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = func.call @cc_nil_value() : () -> i64
      %147 = func.call @cc_errorp(%65) : (i64) -> i64
      %148 = arith.cmpi ne, %147, %146 : i64
      %149 = arith.cmpi eq, %146, %146 : i64
      %150 = arith.andi %148, %149 : i1
      %151 = scf.if %150 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %146 : i64
      }
      %152 = func.call @cc_errorp(%82) : (i64) -> i64
      %153 = arith.cmpi ne, %152, %146 : i64
      %154 = arith.cmpi eq, %151, %146 : i64
      %155 = arith.andi %153, %154 : i1
      %156 = scf.if %155 -> (i64) {
        scf.yield %82 : i64
      } else {
        scf.yield %151 : i64
      }
      %157 = func.call @cc_errorp(%99) : (i64) -> i64
      %158 = arith.cmpi ne, %157, %146 : i64
      %159 = arith.cmpi eq, %156, %146 : i64
      %160 = arith.andi %158, %159 : i1
      %161 = scf.if %160 -> (i64) {
        scf.yield %99 : i64
      } else {
        scf.yield %156 : i64
      }
      %162 = func.call @cc_errorp(%113) : (i64) -> i64
      %163 = arith.cmpi ne, %162, %146 : i64
      %164 = arith.cmpi eq, %161, %146 : i64
      %165 = arith.andi %163, %164 : i1
      %166 = scf.if %165 -> (i64) {
        scf.yield %113 : i64
      } else {
        scf.yield %161 : i64
      }
      %167 = func.call @cc_errorp(%124) : (i64) -> i64
      %168 = arith.cmpi ne, %167, %146 : i64
      %169 = arith.cmpi eq, %166, %146 : i64
      %170 = arith.andi %168, %169 : i1
      %171 = scf.if %170 -> (i64) {
        scf.yield %124 : i64
      } else {
        scf.yield %166 : i64
      }
      %172 = func.call @cc_errorp(%125) : (i64) -> i64
      %173 = arith.cmpi ne, %172, %146 : i64
      %174 = arith.cmpi eq, %171, %146 : i64
      %175 = arith.andi %173, %174 : i1
      %176 = scf.if %175 -> (i64) {
        scf.yield %125 : i64
      } else {
        scf.yield %171 : i64
      }
      %177 = func.call @cc_errorp(%136) : (i64) -> i64
      %178 = arith.cmpi ne, %177, %146 : i64
      %179 = arith.cmpi eq, %176, %146 : i64
      %180 = arith.andi %178, %179 : i1
      %181 = scf.if %180 -> (i64) {
        scf.yield %136 : i64
      } else {
        scf.yield %176 : i64
      }
      %182 = func.call @cc_errorp(%145) : (i64) -> i64
      %183 = arith.cmpi ne, %182, %146 : i64
      %184 = arith.cmpi eq, %181, %146 : i64
      %185 = arith.andi %183, %184 : i1
      %186 = scf.if %185 -> (i64) {
        scf.yield %145 : i64
      } else {
        scf.yield %181 : i64
      }
      %187 = arith.cmpi ne, %186, %146 : i64
      scf.if %187 {
        func.call @stack_push_pointer(%186) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%82) : (i64) -> ()
        func.call @stack_push_pointer(%99) : (i64) -> ()
        func.call @stack_push_pointer(%113) : (i64) -> ()
        func.call @stack_push_pointer(%124) : (i64) -> ()
        func.call @stack_push_pointer(%125) : (i64) -> ()
        func.call @stack_push_pointer(%136) : (i64) -> ()
        func.call @stack_push_pointer(%145) : (i64) -> ()
        %188 = llvm.mlir.addressof @str14 : !llvm.ptr
        %189 = func.call @cc_make_function_ref_const(%188) : (!llvm.ptr) -> i64
        %190 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%189, %190) : (i64, i64) -> ()
      }
      %191 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %191 : i64
    }
    %192 = func.call @cc_nil_value() : () -> i64
    %193 = func.call @cc_errorp(%56) : (i64) -> i64
    %194 = arith.cmpi ne, %193, %192 : i64
    %195 = scf.if %194 -> (i64) {
      scf.yield %56 : i64
    } else {
      %196 = llvm.mlir.addressof @str15 : !llvm.ptr
      %197 = arith.constant 11 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = func.call @cc_nil_value() : () -> i64
      %200 = func.call @cc_intern(%198, %199) : (i64, i64) -> i64
      %201 = func.call @cc_nil_value() : () -> i64
      %202 = func.call @cc_cons(%200, %201) : (i64, i64) -> i64
      %203 = func.call @cc_values_pack(%202) : (i64) -> i64
      func.call @stack_push_pointer(%200) : (i64) -> ()
      %204 = func.call @stack_pop_pointer() : () -> i64
      %205 = llvm.mlir.addressof @str16 : !llvm.ptr
      %206 = arith.constant 13 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = llvm.mlir.addressof @str17 : !llvm.ptr
      %209 = arith.constant 11 : i64
      %210 = func.call @cc_make_string(%208, %209) : (!llvm.ptr, i64) -> i64
      %211 = func.call @cc_intern(%207, %210) : (i64, i64) -> i64
      %212 = func.call @cc_nil_value() : () -> i64
      %213 = func.call @cc_cons(%211, %212) : (i64, i64) -> i64
      %214 = func.call @cc_values_pack(%213) : (i64) -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
      %215 = llvm.mlir.addressof @str18 : !llvm.ptr
      %216 = arith.constant 6 : i64
      %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_intern(%217, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      func.call @stack_push_pointer(%219) : (i64) -> ()
      %223 = llvm.mlir.addressof @str19 : !llvm.ptr
      %224 = arith.constant 19 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = func.call @cc_nil_value() : () -> i64
      %227 = func.call @cc_intern(%225, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      func.call @stack_push_pointer(%227) : (i64) -> ()
      %231 = llvm.mlir.addressof @str20 : !llvm.ptr
      %232 = arith.constant 5 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = llvm.mlir.addressof @str21 : !llvm.ptr
      %235 = arith.constant 11 : i64
      %236 = func.call @cc_make_string(%234, %235) : (!llvm.ptr, i64) -> i64
      %237 = func.call @cc_intern(%233, %236) : (i64, i64) -> i64
      %238 = func.call @cc_nil_value() : () -> i64
      %239 = func.call @cc_cons(%237, %238) : (i64, i64) -> i64
      %240 = func.call @cc_values_pack(%239) : (i64) -> i64
      func.call @stack_push_pointer(%237) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %241 = func.call @stack_pop_pointer() : () -> i64
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @cc_cons(%242, %241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%243) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %244 = func.call @stack_pop_pointer() : () -> i64
      %245 = func.call @stack_pop_pointer() : () -> i64
      %246 = func.call @cc_cons(%245, %244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%246) : (i64) -> ()
      %247 = func.call @stack_pop_pointer() : () -> i64
      %248 = func.call @stack_pop_pointer() : () -> i64
      %249 = func.call @cc_cons(%248, %247) : (i64, i64) -> i64
      func.call @stack_push_pointer(%249) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %250 = func.call @stack_pop_pointer() : () -> i64
      %251 = func.call @stack_pop_pointer() : () -> i64
      %252 = func.call @cc_cons(%251, %250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%252) : (i64) -> ()
      %253 = func.call @stack_pop_pointer() : () -> i64
      %254 = func.call @stack_pop_pointer() : () -> i64
      %255 = func.call @cc_cons(%254, %253) : (i64, i64) -> i64
      func.call @stack_push_pointer(%255) : (i64) -> ()
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @stack_pop_pointer() : () -> i64
      %258 = func.call @cc_cons(%257, %256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%258) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %259 = func.call @stack_pop_pointer() : () -> i64
      %260 = func.call @stack_pop_pointer() : () -> i64
      %261 = func.call @cc_cons(%260, %259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%261) : (i64) -> ()
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @stack_pop_pointer() : () -> i64
      %264 = func.call @cc_cons(%263, %262) : (i64, i64) -> i64
      func.call @stack_push_pointer(%264) : (i64) -> ()
      %265 = func.call @stack_pop_pointer() : () -> i64
      %314 = arith.constant 209815645192194 : i64
      %315 = arith.constant 0 : i64
      %316 = func.call @cc_make_closure(%314, %315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%316) : (i64) -> ()
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = llvm.mlir.addressof @str23 : !llvm.ptr
      %319 = arith.constant 4 : i64
      %320 = func.call @cc_make_string(%318, %319) : (!llvm.ptr, i64) -> i64
      %321 = func.call @cc_nil_value() : () -> i64
      %322 = func.call @cc_intern(%320, %321) : (i64, i64) -> i64
      %323 = func.call @cc_nil_value() : () -> i64
      %324 = func.call @cc_cons(%322, %323) : (i64, i64) -> i64
      %325 = func.call @cc_values_pack(%324) : (i64) -> i64
      func.call @stack_push_pointer(%322) : (i64) -> ()
      %326 = llvm.mlir.addressof @str24 : !llvm.ptr
      %327 = arith.constant 13 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = llvm.mlir.addressof @str25 : !llvm.ptr
      %330 = arith.constant 11 : i64
      %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
      %332 = func.call @cc_intern(%328, %331) : (i64, i64) -> i64
      %333 = func.call @cc_nil_value() : () -> i64
      %334 = func.call @cc_cons(%332, %333) : (i64, i64) -> i64
      %335 = func.call @cc_values_pack(%334) : (i64) -> i64
      func.call @stack_push_pointer(%332) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = func.call @stack_pop_pointer() : () -> i64
      %338 = func.call @cc_cons(%337, %336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%338) : (i64) -> ()
      %339 = func.call @stack_pop_pointer() : () -> i64
      %340 = func.call @stack_pop_pointer() : () -> i64
      %341 = func.call @cc_cons(%340, %339) : (i64, i64) -> i64
      func.call @stack_push_pointer(%341) : (i64) -> ()
      %342 = func.call @stack_pop_pointer() : () -> i64
      %343 = llvm.mlir.addressof @str26 : !llvm.ptr
      %344 = arith.constant 11 : i64
      %345 = func.call @cc_make_string(%343, %344) : (!llvm.ptr, i64) -> i64
      %346 = llvm.mlir.addressof @str27 : !llvm.ptr
      %347 = arith.constant 7 : i64
      %348 = func.call @cc_make_string(%346, %347) : (!llvm.ptr, i64) -> i64
      %349 = func.call @cc_intern(%345, %348) : (i64, i64) -> i64
      %350 = func.call @cc_nil_value() : () -> i64
      %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
      %352 = func.call @cc_values_pack(%351) : (i64) -> i64
      func.call @stack_push_pointer(%349) : (i64) -> ()
      %353 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = llvm.mlir.addressof @str28 : !llvm.ptr
      %356 = arith.constant 4 : i64
      %357 = func.call @cc_make_string(%355, %356) : (!llvm.ptr, i64) -> i64
      %358 = llvm.mlir.addressof @str29 : !llvm.ptr
      %359 = arith.constant 7 : i64
      %360 = func.call @cc_make_string(%358, %359) : (!llvm.ptr, i64) -> i64
      %361 = func.call @cc_intern(%357, %360) : (i64, i64) -> i64
      %362 = func.call @cc_nil_value() : () -> i64
      %363 = func.call @cc_cons(%361, %362) : (i64, i64) -> i64
      %364 = func.call @cc_values_pack(%363) : (i64) -> i64
      func.call @stack_push_pointer(%361) : (i64) -> ()
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = llvm.mlir.addressof @str30 : !llvm.ptr
      %367 = arith.constant 5 : i64
      %368 = func.call @cc_make_string(%366, %367) : (!llvm.ptr, i64) -> i64
      %369 = func.call @cc_nil_value() : () -> i64
      %370 = func.call @cc_intern(%368, %369) : (i64, i64) -> i64
      %371 = func.call @cc_nil_value() : () -> i64
      %372 = func.call @cc_cons(%370, %371) : (i64, i64) -> i64
      %373 = func.call @cc_values_pack(%372) : (i64) -> i64
      func.call @stack_push_pointer(%370) : (i64) -> ()
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = func.call @cc_nil_value() : () -> i64
      %376 = func.call @cc_errorp(%204) : (i64) -> i64
      %377 = arith.cmpi ne, %376, %375 : i64
      %378 = arith.cmpi eq, %375, %375 : i64
      %379 = arith.andi %377, %378 : i1
      %380 = scf.if %379 -> (i64) {
        scf.yield %204 : i64
      } else {
        scf.yield %375 : i64
      }
      %381 = func.call @cc_errorp(%265) : (i64) -> i64
      %382 = arith.cmpi ne, %381, %375 : i64
      %383 = arith.cmpi eq, %380, %375 : i64
      %384 = arith.andi %382, %383 : i1
      %385 = scf.if %384 -> (i64) {
        scf.yield %265 : i64
      } else {
        scf.yield %380 : i64
      }
      %386 = func.call @cc_errorp(%317) : (i64) -> i64
      %387 = arith.cmpi ne, %386, %375 : i64
      %388 = arith.cmpi eq, %385, %375 : i64
      %389 = arith.andi %387, %388 : i1
      %390 = scf.if %389 -> (i64) {
        scf.yield %317 : i64
      } else {
        scf.yield %385 : i64
      }
      %391 = func.call @cc_errorp(%342) : (i64) -> i64
      %392 = arith.cmpi ne, %391, %375 : i64
      %393 = arith.cmpi eq, %390, %375 : i64
      %394 = arith.andi %392, %393 : i1
      %395 = scf.if %394 -> (i64) {
        scf.yield %342 : i64
      } else {
        scf.yield %390 : i64
      }
      %396 = func.call @cc_errorp(%353) : (i64) -> i64
      %397 = arith.cmpi ne, %396, %375 : i64
      %398 = arith.cmpi eq, %395, %375 : i64
      %399 = arith.andi %397, %398 : i1
      %400 = scf.if %399 -> (i64) {
        scf.yield %353 : i64
      } else {
        scf.yield %395 : i64
      }
      %401 = func.call @cc_errorp(%354) : (i64) -> i64
      %402 = arith.cmpi ne, %401, %375 : i64
      %403 = arith.cmpi eq, %400, %375 : i64
      %404 = arith.andi %402, %403 : i1
      %405 = scf.if %404 -> (i64) {
        scf.yield %354 : i64
      } else {
        scf.yield %400 : i64
      }
      %406 = func.call @cc_errorp(%365) : (i64) -> i64
      %407 = arith.cmpi ne, %406, %375 : i64
      %408 = arith.cmpi eq, %405, %375 : i64
      %409 = arith.andi %407, %408 : i1
      %410 = scf.if %409 -> (i64) {
        scf.yield %365 : i64
      } else {
        scf.yield %405 : i64
      }
      %411 = func.call @cc_errorp(%374) : (i64) -> i64
      %412 = arith.cmpi ne, %411, %375 : i64
      %413 = arith.cmpi eq, %410, %375 : i64
      %414 = arith.andi %412, %413 : i1
      %415 = scf.if %414 -> (i64) {
        scf.yield %374 : i64
      } else {
        scf.yield %410 : i64
      }
      %416 = arith.cmpi ne, %415, %375 : i64
      scf.if %416 {
        func.call @stack_push_pointer(%415) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%204) : (i64) -> ()
        func.call @stack_push_pointer(%265) : (i64) -> ()
        func.call @stack_push_pointer(%317) : (i64) -> ()
        func.call @stack_push_pointer(%342) : (i64) -> ()
        func.call @stack_push_pointer(%353) : (i64) -> ()
        func.call @stack_push_pointer(%354) : (i64) -> ()
        func.call @stack_push_pointer(%365) : (i64) -> ()
        func.call @stack_push_pointer(%374) : (i64) -> ()
        %417 = llvm.mlir.addressof @str31 : !llvm.ptr
        %418 = func.call @cc_make_function_ref_const(%417) : (!llvm.ptr) -> i64
        %419 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%418, %419) : (i64, i64) -> ()
      }
      %420 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %420 : i64
    }
    %421 = func.call @cc_nil_value() : () -> i64
    %422 = func.call @cc_errorp(%195) : (i64) -> i64
    %423 = arith.cmpi ne, %422, %421 : i64
    %424 = scf.if %423 -> (i64) {
      scf.yield %195 : i64
    } else {
      %425 = llvm.mlir.addressof @str32 : !llvm.ptr
      %426 = arith.constant 11 : i64
      %427 = func.call @cc_make_string(%425, %426) : (!llvm.ptr, i64) -> i64
      %428 = func.call @cc_nil_value() : () -> i64
      %429 = func.call @cc_intern(%427, %428) : (i64, i64) -> i64
      %430 = func.call @cc_nil_value() : () -> i64
      %431 = func.call @cc_cons(%429, %430) : (i64, i64) -> i64
      %432 = func.call @cc_values_pack(%431) : (i64) -> i64
      func.call @stack_push_pointer(%429) : (i64) -> ()
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = llvm.mlir.addressof @str33 : !llvm.ptr
      %435 = arith.constant 13 : i64
      %436 = func.call @cc_make_string(%434, %435) : (!llvm.ptr, i64) -> i64
      %437 = llvm.mlir.addressof @str34 : !llvm.ptr
      %438 = arith.constant 11 : i64
      %439 = func.call @cc_make_string(%437, %438) : (!llvm.ptr, i64) -> i64
      %440 = func.call @cc_intern(%436, %439) : (i64, i64) -> i64
      %441 = func.call @cc_nil_value() : () -> i64
      %442 = func.call @cc_cons(%440, %441) : (i64, i64) -> i64
      %443 = func.call @cc_values_pack(%442) : (i64) -> i64
      func.call @stack_push_pointer(%440) : (i64) -> ()
      %444 = llvm.mlir.addressof @str35 : !llvm.ptr
      %445 = arith.constant 6 : i64
      %446 = func.call @cc_make_string(%444, %445) : (!llvm.ptr, i64) -> i64
      %447 = func.call @cc_nil_value() : () -> i64
      %448 = func.call @cc_intern(%446, %447) : (i64, i64) -> i64
      %449 = func.call @cc_nil_value() : () -> i64
      %450 = func.call @cc_cons(%448, %449) : (i64, i64) -> i64
      %451 = func.call @cc_values_pack(%450) : (i64) -> i64
      func.call @stack_push_pointer(%448) : (i64) -> ()
      %452 = llvm.mlir.addressof @str36 : !llvm.ptr
      %453 = arith.constant 19 : i64
      %454 = func.call @cc_make_string(%452, %453) : (!llvm.ptr, i64) -> i64
      %455 = func.call @cc_nil_value() : () -> i64
      %456 = func.call @cc_intern(%454, %455) : (i64, i64) -> i64
      %457 = func.call @cc_nil_value() : () -> i64
      %458 = func.call @cc_cons(%456, %457) : (i64, i64) -> i64
      %459 = func.call @cc_values_pack(%458) : (i64) -> i64
      func.call @stack_push_pointer(%456) : (i64) -> ()
      %460 = llvm.mlir.addressof @str37 : !llvm.ptr
      %461 = arith.constant 6 : i64
      %462 = func.call @cc_make_string(%460, %461) : (!llvm.ptr, i64) -> i64
      %463 = llvm.mlir.addressof @str38 : !llvm.ptr
      %464 = arith.constant 11 : i64
      %465 = func.call @cc_make_string(%463, %464) : (!llvm.ptr, i64) -> i64
      %466 = func.call @cc_intern(%462, %465) : (i64, i64) -> i64
      %467 = func.call @cc_nil_value() : () -> i64
      %468 = func.call @cc_cons(%466, %467) : (i64, i64) -> i64
      %469 = func.call @cc_values_pack(%468) : (i64) -> i64
      func.call @stack_push_pointer(%466) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %470 = func.call @stack_pop_pointer() : () -> i64
      %471 = func.call @stack_pop_pointer() : () -> i64
      %472 = func.call @cc_cons(%471, %470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%472) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @stack_pop_pointer() : () -> i64
      %475 = func.call @cc_cons(%474, %473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%475) : (i64) -> ()
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @cc_cons(%477, %476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %488 = func.call @stack_pop_pointer() : () -> i64
      %489 = func.call @stack_pop_pointer() : () -> i64
      %490 = func.call @cc_cons(%489, %488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%490) : (i64) -> ()
      %491 = func.call @stack_pop_pointer() : () -> i64
      %492 = func.call @stack_pop_pointer() : () -> i64
      %493 = func.call @cc_cons(%492, %491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%493) : (i64) -> ()
      %494 = func.call @stack_pop_pointer() : () -> i64
      %543 = arith.constant 209815645192195 : i64
      %544 = arith.constant 0 : i64
      %545 = func.call @cc_make_closure(%543, %544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%545) : (i64) -> ()
      %546 = func.call @stack_pop_pointer() : () -> i64
      %547 = llvm.mlir.addressof @str40 : !llvm.ptr
      %548 = arith.constant 4 : i64
      %549 = func.call @cc_make_string(%547, %548) : (!llvm.ptr, i64) -> i64
      %550 = func.call @cc_nil_value() : () -> i64
      %551 = func.call @cc_intern(%549, %550) : (i64, i64) -> i64
      %552 = func.call @cc_nil_value() : () -> i64
      %553 = func.call @cc_cons(%551, %552) : (i64, i64) -> i64
      %554 = func.call @cc_values_pack(%553) : (i64) -> i64
      func.call @stack_push_pointer(%551) : (i64) -> ()
      %555 = llvm.mlir.addressof @str41 : !llvm.ptr
      %556 = arith.constant 13 : i64
      %557 = func.call @cc_make_string(%555, %556) : (!llvm.ptr, i64) -> i64
      %558 = llvm.mlir.addressof @str42 : !llvm.ptr
      %559 = arith.constant 11 : i64
      %560 = func.call @cc_make_string(%558, %559) : (!llvm.ptr, i64) -> i64
      %561 = func.call @cc_intern(%557, %560) : (i64, i64) -> i64
      %562 = func.call @cc_nil_value() : () -> i64
      %563 = func.call @cc_cons(%561, %562) : (i64, i64) -> i64
      %564 = func.call @cc_values_pack(%563) : (i64) -> i64
      func.call @stack_push_pointer(%561) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %565 = func.call @stack_pop_pointer() : () -> i64
      %566 = func.call @stack_pop_pointer() : () -> i64
      %567 = func.call @cc_cons(%566, %565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%567) : (i64) -> ()
      %568 = func.call @stack_pop_pointer() : () -> i64
      %569 = func.call @stack_pop_pointer() : () -> i64
      %570 = func.call @cc_cons(%569, %568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%570) : (i64) -> ()
      %571 = func.call @stack_pop_pointer() : () -> i64
      %572 = llvm.mlir.addressof @str43 : !llvm.ptr
      %573 = arith.constant 11 : i64
      %574 = func.call @cc_make_string(%572, %573) : (!llvm.ptr, i64) -> i64
      %575 = llvm.mlir.addressof @str44 : !llvm.ptr
      %576 = arith.constant 7 : i64
      %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
      %578 = func.call @cc_intern(%574, %577) : (i64, i64) -> i64
      %579 = func.call @cc_nil_value() : () -> i64
      %580 = func.call @cc_cons(%578, %579) : (i64, i64) -> i64
      %581 = func.call @cc_values_pack(%580) : (i64) -> i64
      func.call @stack_push_pointer(%578) : (i64) -> ()
      %582 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %583 = func.call @stack_pop_pointer() : () -> i64
      %584 = llvm.mlir.addressof @str45 : !llvm.ptr
      %585 = arith.constant 4 : i64
      %586 = func.call @cc_make_string(%584, %585) : (!llvm.ptr, i64) -> i64
      %587 = llvm.mlir.addressof @str46 : !llvm.ptr
      %588 = arith.constant 7 : i64
      %589 = func.call @cc_make_string(%587, %588) : (!llvm.ptr, i64) -> i64
      %590 = func.call @cc_intern(%586, %589) : (i64, i64) -> i64
      %591 = func.call @cc_nil_value() : () -> i64
      %592 = func.call @cc_cons(%590, %591) : (i64, i64) -> i64
      %593 = func.call @cc_values_pack(%592) : (i64) -> i64
      func.call @stack_push_pointer(%590) : (i64) -> ()
      %594 = func.call @stack_pop_pointer() : () -> i64
      %595 = llvm.mlir.addressof @str47 : !llvm.ptr
      %596 = arith.constant 5 : i64
      %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
      %598 = func.call @cc_nil_value() : () -> i64
      %599 = func.call @cc_intern(%597, %598) : (i64, i64) -> i64
      %600 = func.call @cc_nil_value() : () -> i64
      %601 = func.call @cc_cons(%599, %600) : (i64, i64) -> i64
      %602 = func.call @cc_values_pack(%601) : (i64) -> i64
      func.call @stack_push_pointer(%599) : (i64) -> ()
      %603 = func.call @stack_pop_pointer() : () -> i64
      %604 = func.call @cc_nil_value() : () -> i64
      %605 = func.call @cc_errorp(%433) : (i64) -> i64
      %606 = arith.cmpi ne, %605, %604 : i64
      %607 = arith.cmpi eq, %604, %604 : i64
      %608 = arith.andi %606, %607 : i1
      %609 = scf.if %608 -> (i64) {
        scf.yield %433 : i64
      } else {
        scf.yield %604 : i64
      }
      %610 = func.call @cc_errorp(%494) : (i64) -> i64
      %611 = arith.cmpi ne, %610, %604 : i64
      %612 = arith.cmpi eq, %609, %604 : i64
      %613 = arith.andi %611, %612 : i1
      %614 = scf.if %613 -> (i64) {
        scf.yield %494 : i64
      } else {
        scf.yield %609 : i64
      }
      %615 = func.call @cc_errorp(%546) : (i64) -> i64
      %616 = arith.cmpi ne, %615, %604 : i64
      %617 = arith.cmpi eq, %614, %604 : i64
      %618 = arith.andi %616, %617 : i1
      %619 = scf.if %618 -> (i64) {
        scf.yield %546 : i64
      } else {
        scf.yield %614 : i64
      }
      %620 = func.call @cc_errorp(%571) : (i64) -> i64
      %621 = arith.cmpi ne, %620, %604 : i64
      %622 = arith.cmpi eq, %619, %604 : i64
      %623 = arith.andi %621, %622 : i1
      %624 = scf.if %623 -> (i64) {
        scf.yield %571 : i64
      } else {
        scf.yield %619 : i64
      }
      %625 = func.call @cc_errorp(%582) : (i64) -> i64
      %626 = arith.cmpi ne, %625, %604 : i64
      %627 = arith.cmpi eq, %624, %604 : i64
      %628 = arith.andi %626, %627 : i1
      %629 = scf.if %628 -> (i64) {
        scf.yield %582 : i64
      } else {
        scf.yield %624 : i64
      }
      %630 = func.call @cc_errorp(%583) : (i64) -> i64
      %631 = arith.cmpi ne, %630, %604 : i64
      %632 = arith.cmpi eq, %629, %604 : i64
      %633 = arith.andi %631, %632 : i1
      %634 = scf.if %633 -> (i64) {
        scf.yield %583 : i64
      } else {
        scf.yield %629 : i64
      }
      %635 = func.call @cc_errorp(%594) : (i64) -> i64
      %636 = arith.cmpi ne, %635, %604 : i64
      %637 = arith.cmpi eq, %634, %604 : i64
      %638 = arith.andi %636, %637 : i1
      %639 = scf.if %638 -> (i64) {
        scf.yield %594 : i64
      } else {
        scf.yield %634 : i64
      }
      %640 = func.call @cc_errorp(%603) : (i64) -> i64
      %641 = arith.cmpi ne, %640, %604 : i64
      %642 = arith.cmpi eq, %639, %604 : i64
      %643 = arith.andi %641, %642 : i1
      %644 = scf.if %643 -> (i64) {
        scf.yield %603 : i64
      } else {
        scf.yield %639 : i64
      }
      %645 = arith.cmpi ne, %644, %604 : i64
      scf.if %645 {
        func.call @stack_push_pointer(%644) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%433) : (i64) -> ()
        func.call @stack_push_pointer(%494) : (i64) -> ()
        func.call @stack_push_pointer(%546) : (i64) -> ()
        func.call @stack_push_pointer(%571) : (i64) -> ()
        func.call @stack_push_pointer(%582) : (i64) -> ()
        func.call @stack_push_pointer(%583) : (i64) -> ()
        func.call @stack_push_pointer(%594) : (i64) -> ()
        func.call @stack_push_pointer(%603) : (i64) -> ()
        %646 = llvm.mlir.addressof @str48 : !llvm.ptr
        %647 = func.call @cc_make_function_ref_const(%646) : (!llvm.ptr) -> i64
        %648 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%647, %648) : (i64, i64) -> ()
      }
      %649 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %649 : i64
    }
    %650 = func.call @cc_nil_value() : () -> i64
    %651 = func.call @cc_errorp(%424) : (i64) -> i64
    %652 = arith.cmpi ne, %651, %650 : i64
    %653 = scf.if %652 -> (i64) {
      scf.yield %424 : i64
    } else {
      %654 = llvm.mlir.addressof @str49 : !llvm.ptr
      %655 = arith.constant 11 : i64
      %656 = func.call @cc_make_string(%654, %655) : (!llvm.ptr, i64) -> i64
      %657 = func.call @cc_nil_value() : () -> i64
      %658 = func.call @cc_intern(%656, %657) : (i64, i64) -> i64
      %659 = func.call @cc_nil_value() : () -> i64
      %660 = func.call @cc_cons(%658, %659) : (i64, i64) -> i64
      %661 = func.call @cc_values_pack(%660) : (i64) -> i64
      func.call @stack_push_pointer(%658) : (i64) -> ()
      %662 = func.call @stack_pop_pointer() : () -> i64
      %663 = llvm.mlir.addressof @str50 : !llvm.ptr
      %664 = arith.constant 13 : i64
      %665 = func.call @cc_make_string(%663, %664) : (!llvm.ptr, i64) -> i64
      %666 = llvm.mlir.addressof @str51 : !llvm.ptr
      %667 = arith.constant 11 : i64
      %668 = func.call @cc_make_string(%666, %667) : (!llvm.ptr, i64) -> i64
      %669 = func.call @cc_intern(%665, %668) : (i64, i64) -> i64
      %670 = func.call @cc_nil_value() : () -> i64
      %671 = func.call @cc_cons(%669, %670) : (i64, i64) -> i64
      %672 = func.call @cc_values_pack(%671) : (i64) -> i64
      func.call @stack_push_pointer(%669) : (i64) -> ()
      %673 = llvm.mlir.addressof @str52 : !llvm.ptr
      %674 = arith.constant 6 : i64
      %675 = func.call @cc_make_string(%673, %674) : (!llvm.ptr, i64) -> i64
      %676 = func.call @cc_nil_value() : () -> i64
      %677 = func.call @cc_intern(%675, %676) : (i64, i64) -> i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = func.call @cc_cons(%677, %678) : (i64, i64) -> i64
      %680 = func.call @cc_values_pack(%679) : (i64) -> i64
      func.call @stack_push_pointer(%677) : (i64) -> ()
      %681 = llvm.mlir.addressof @str53 : !llvm.ptr
      %682 = arith.constant 19 : i64
      %683 = func.call @cc_make_string(%681, %682) : (!llvm.ptr, i64) -> i64
      %684 = func.call @cc_nil_value() : () -> i64
      %685 = func.call @cc_intern(%683, %684) : (i64, i64) -> i64
      %686 = func.call @cc_nil_value() : () -> i64
      %687 = func.call @cc_cons(%685, %686) : (i64, i64) -> i64
      %688 = func.call @cc_values_pack(%687) : (i64) -> i64
      func.call @stack_push_pointer(%685) : (i64) -> ()
      %689 = llvm.mlir.addressof @str54 : !llvm.ptr
      %690 = arith.constant 5 : i64
      %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
      %692 = llvm.mlir.addressof @str55 : !llvm.ptr
      %693 = arith.constant 11 : i64
      %694 = func.call @cc_make_string(%692, %693) : (!llvm.ptr, i64) -> i64
      %695 = func.call @cc_intern(%691, %694) : (i64, i64) -> i64
      %696 = func.call @cc_nil_value() : () -> i64
      %697 = func.call @cc_cons(%695, %696) : (i64, i64) -> i64
      %698 = func.call @cc_values_pack(%697) : (i64) -> i64
      func.call @stack_push_pointer(%695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %699 = func.call @stack_pop_pointer() : () -> i64
      %700 = func.call @stack_pop_pointer() : () -> i64
      %701 = func.call @cc_cons(%700, %699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%701) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %702 = func.call @stack_pop_pointer() : () -> i64
      %703 = func.call @stack_pop_pointer() : () -> i64
      %704 = func.call @cc_cons(%703, %702) : (i64, i64) -> i64
      func.call @stack_push_pointer(%704) : (i64) -> ()
      %705 = func.call @stack_pop_pointer() : () -> i64
      %706 = func.call @stack_pop_pointer() : () -> i64
      %707 = func.call @cc_cons(%706, %705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @stack_pop_pointer() : () -> i64
      %710 = func.call @cc_cons(%709, %708) : (i64, i64) -> i64
      func.call @stack_push_pointer(%710) : (i64) -> ()
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @stack_pop_pointer() : () -> i64
      %713 = func.call @cc_cons(%712, %711) : (i64, i64) -> i64
      func.call @stack_push_pointer(%713) : (i64) -> ()
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = func.call @stack_pop_pointer() : () -> i64
      %716 = func.call @cc_cons(%715, %714) : (i64, i64) -> i64
      func.call @stack_push_pointer(%716) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %717 = func.call @stack_pop_pointer() : () -> i64
      %718 = func.call @stack_pop_pointer() : () -> i64
      %719 = func.call @cc_cons(%718, %717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%719) : (i64) -> ()
      %720 = func.call @stack_pop_pointer() : () -> i64
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @cc_cons(%721, %720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%722) : (i64) -> ()
      %723 = func.call @stack_pop_pointer() : () -> i64
      %772 = arith.constant 209815645192196 : i64
      %773 = arith.constant 0 : i64
      %774 = func.call @cc_make_closure(%772, %773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%774) : (i64) -> ()
      %775 = func.call @stack_pop_pointer() : () -> i64
      %776 = llvm.mlir.addressof @str57 : !llvm.ptr
      %777 = arith.constant 4 : i64
      %778 = func.call @cc_make_string(%776, %777) : (!llvm.ptr, i64) -> i64
      %779 = func.call @cc_nil_value() : () -> i64
      %780 = func.call @cc_intern(%778, %779) : (i64, i64) -> i64
      %781 = func.call @cc_nil_value() : () -> i64
      %782 = func.call @cc_cons(%780, %781) : (i64, i64) -> i64
      %783 = func.call @cc_values_pack(%782) : (i64) -> i64
      func.call @stack_push_pointer(%780) : (i64) -> ()
      %784 = llvm.mlir.addressof @str58 : !llvm.ptr
      %785 = arith.constant 13 : i64
      %786 = func.call @cc_make_string(%784, %785) : (!llvm.ptr, i64) -> i64
      %787 = llvm.mlir.addressof @str59 : !llvm.ptr
      %788 = arith.constant 11 : i64
      %789 = func.call @cc_make_string(%787, %788) : (!llvm.ptr, i64) -> i64
      %790 = func.call @cc_intern(%786, %789) : (i64, i64) -> i64
      %791 = func.call @cc_nil_value() : () -> i64
      %792 = func.call @cc_cons(%790, %791) : (i64, i64) -> i64
      %793 = func.call @cc_values_pack(%792) : (i64) -> i64
      func.call @stack_push_pointer(%790) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @stack_pop_pointer() : () -> i64
      %796 = func.call @cc_cons(%795, %794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%796) : (i64) -> ()
      %797 = func.call @stack_pop_pointer() : () -> i64
      %798 = func.call @stack_pop_pointer() : () -> i64
      %799 = func.call @cc_cons(%798, %797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%799) : (i64) -> ()
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = llvm.mlir.addressof @str60 : !llvm.ptr
      %802 = arith.constant 11 : i64
      %803 = func.call @cc_make_string(%801, %802) : (!llvm.ptr, i64) -> i64
      %804 = llvm.mlir.addressof @str61 : !llvm.ptr
      %805 = arith.constant 7 : i64
      %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
      %807 = func.call @cc_intern(%803, %806) : (i64, i64) -> i64
      %808 = func.call @cc_nil_value() : () -> i64
      %809 = func.call @cc_cons(%807, %808) : (i64, i64) -> i64
      %810 = func.call @cc_values_pack(%809) : (i64) -> i64
      func.call @stack_push_pointer(%807) : (i64) -> ()
      %811 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %812 = func.call @stack_pop_pointer() : () -> i64
      %813 = llvm.mlir.addressof @str62 : !llvm.ptr
      %814 = arith.constant 4 : i64
      %815 = func.call @cc_make_string(%813, %814) : (!llvm.ptr, i64) -> i64
      %816 = llvm.mlir.addressof @str63 : !llvm.ptr
      %817 = arith.constant 7 : i64
      %818 = func.call @cc_make_string(%816, %817) : (!llvm.ptr, i64) -> i64
      %819 = func.call @cc_intern(%815, %818) : (i64, i64) -> i64
      %820 = func.call @cc_nil_value() : () -> i64
      %821 = func.call @cc_cons(%819, %820) : (i64, i64) -> i64
      %822 = func.call @cc_values_pack(%821) : (i64) -> i64
      func.call @stack_push_pointer(%819) : (i64) -> ()
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = llvm.mlir.addressof @str64 : !llvm.ptr
      %825 = arith.constant 5 : i64
      %826 = func.call @cc_make_string(%824, %825) : (!llvm.ptr, i64) -> i64
      %827 = func.call @cc_nil_value() : () -> i64
      %828 = func.call @cc_intern(%826, %827) : (i64, i64) -> i64
      %829 = func.call @cc_nil_value() : () -> i64
      %830 = func.call @cc_cons(%828, %829) : (i64, i64) -> i64
      %831 = func.call @cc_values_pack(%830) : (i64) -> i64
      func.call @stack_push_pointer(%828) : (i64) -> ()
      %832 = func.call @stack_pop_pointer() : () -> i64
      %833 = func.call @cc_nil_value() : () -> i64
      %834 = func.call @cc_errorp(%662) : (i64) -> i64
      %835 = arith.cmpi ne, %834, %833 : i64
      %836 = arith.cmpi eq, %833, %833 : i64
      %837 = arith.andi %835, %836 : i1
      %838 = scf.if %837 -> (i64) {
        scf.yield %662 : i64
      } else {
        scf.yield %833 : i64
      }
      %839 = func.call @cc_errorp(%723) : (i64) -> i64
      %840 = arith.cmpi ne, %839, %833 : i64
      %841 = arith.cmpi eq, %838, %833 : i64
      %842 = arith.andi %840, %841 : i1
      %843 = scf.if %842 -> (i64) {
        scf.yield %723 : i64
      } else {
        scf.yield %838 : i64
      }
      %844 = func.call @cc_errorp(%775) : (i64) -> i64
      %845 = arith.cmpi ne, %844, %833 : i64
      %846 = arith.cmpi eq, %843, %833 : i64
      %847 = arith.andi %845, %846 : i1
      %848 = scf.if %847 -> (i64) {
        scf.yield %775 : i64
      } else {
        scf.yield %843 : i64
      }
      %849 = func.call @cc_errorp(%800) : (i64) -> i64
      %850 = arith.cmpi ne, %849, %833 : i64
      %851 = arith.cmpi eq, %848, %833 : i64
      %852 = arith.andi %850, %851 : i1
      %853 = scf.if %852 -> (i64) {
        scf.yield %800 : i64
      } else {
        scf.yield %848 : i64
      }
      %854 = func.call @cc_errorp(%811) : (i64) -> i64
      %855 = arith.cmpi ne, %854, %833 : i64
      %856 = arith.cmpi eq, %853, %833 : i64
      %857 = arith.andi %855, %856 : i1
      %858 = scf.if %857 -> (i64) {
        scf.yield %811 : i64
      } else {
        scf.yield %853 : i64
      }
      %859 = func.call @cc_errorp(%812) : (i64) -> i64
      %860 = arith.cmpi ne, %859, %833 : i64
      %861 = arith.cmpi eq, %858, %833 : i64
      %862 = arith.andi %860, %861 : i1
      %863 = scf.if %862 -> (i64) {
        scf.yield %812 : i64
      } else {
        scf.yield %858 : i64
      }
      %864 = func.call @cc_errorp(%823) : (i64) -> i64
      %865 = arith.cmpi ne, %864, %833 : i64
      %866 = arith.cmpi eq, %863, %833 : i64
      %867 = arith.andi %865, %866 : i1
      %868 = scf.if %867 -> (i64) {
        scf.yield %823 : i64
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
        func.call @stack_push_pointer(%662) : (i64) -> ()
        func.call @stack_push_pointer(%723) : (i64) -> ()
        func.call @stack_push_pointer(%775) : (i64) -> ()
        func.call @stack_push_pointer(%800) : (i64) -> ()
        func.call @stack_push_pointer(%811) : (i64) -> ()
        func.call @stack_push_pointer(%812) : (i64) -> ()
        func.call @stack_push_pointer(%823) : (i64) -> ()
        func.call @stack_push_pointer(%832) : (i64) -> ()
        %875 = llvm.mlir.addressof @str65 : !llvm.ptr
        %876 = func.call @cc_make_function_ref_const(%875) : (!llvm.ptr) -> i64
        %877 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%876, %877) : (i64, i64) -> ()
      }
      %878 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %878 : i64
    }
    %879 = func.call @cc_nil_value() : () -> i64
    %880 = func.call @cc_errorp(%653) : (i64) -> i64
    %881 = arith.cmpi ne, %880, %879 : i64
    %882 = scf.if %881 -> (i64) {
      scf.yield %653 : i64
    } else {
      %883 = llvm.mlir.addressof @str66 : !llvm.ptr
      %884 = arith.constant 11 : i64
      %885 = func.call @cc_make_string(%883, %884) : (!llvm.ptr, i64) -> i64
      %886 = func.call @cc_nil_value() : () -> i64
      %887 = func.call @cc_intern(%885, %886) : (i64, i64) -> i64
      %888 = func.call @cc_nil_value() : () -> i64
      %889 = func.call @cc_cons(%887, %888) : (i64, i64) -> i64
      %890 = func.call @cc_values_pack(%889) : (i64) -> i64
      func.call @stack_push_pointer(%887) : (i64) -> ()
      %891 = func.call @stack_pop_pointer() : () -> i64
      %892 = llvm.mlir.addressof @str67 : !llvm.ptr
      %893 = arith.constant 13 : i64
      %894 = func.call @cc_make_string(%892, %893) : (!llvm.ptr, i64) -> i64
      %895 = llvm.mlir.addressof @str68 : !llvm.ptr
      %896 = arith.constant 11 : i64
      %897 = func.call @cc_make_string(%895, %896) : (!llvm.ptr, i64) -> i64
      %898 = func.call @cc_intern(%894, %897) : (i64, i64) -> i64
      %899 = func.call @cc_nil_value() : () -> i64
      %900 = func.call @cc_cons(%898, %899) : (i64, i64) -> i64
      %901 = func.call @cc_values_pack(%900) : (i64) -> i64
      func.call @stack_push_pointer(%898) : (i64) -> ()
      %902 = llvm.mlir.addressof @str69 : !llvm.ptr
      %903 = arith.constant 6 : i64
      %904 = func.call @cc_make_string(%902, %903) : (!llvm.ptr, i64) -> i64
      %905 = func.call @cc_nil_value() : () -> i64
      %906 = func.call @cc_intern(%904, %905) : (i64, i64) -> i64
      %907 = func.call @cc_nil_value() : () -> i64
      %908 = func.call @cc_cons(%906, %907) : (i64, i64) -> i64
      %909 = func.call @cc_values_pack(%908) : (i64) -> i64
      func.call @stack_push_pointer(%906) : (i64) -> ()
      %910 = llvm.mlir.addressof @str70 : !llvm.ptr
      %911 = arith.constant 19 : i64
      %912 = func.call @cc_make_string(%910, %911) : (!llvm.ptr, i64) -> i64
      %913 = func.call @cc_nil_value() : () -> i64
      %914 = func.call @cc_intern(%912, %913) : (i64, i64) -> i64
      %915 = func.call @cc_nil_value() : () -> i64
      %916 = func.call @cc_cons(%914, %915) : (i64, i64) -> i64
      %917 = func.call @cc_values_pack(%916) : (i64) -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
      %918 = llvm.mlir.addressof @str71 : !llvm.ptr
      %919 = arith.constant 5 : i64
      %920 = func.call @cc_make_string(%918, %919) : (!llvm.ptr, i64) -> i64
      %921 = llvm.mlir.addressof @str72 : !llvm.ptr
      %922 = arith.constant 11 : i64
      %923 = func.call @cc_make_string(%921, %922) : (!llvm.ptr, i64) -> i64
      %924 = func.call @cc_intern(%920, %923) : (i64, i64) -> i64
      %925 = func.call @cc_nil_value() : () -> i64
      %926 = func.call @cc_cons(%924, %925) : (i64, i64) -> i64
      %927 = func.call @cc_values_pack(%926) : (i64) -> i64
      func.call @stack_push_pointer(%924) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %928 = func.call @stack_pop_pointer() : () -> i64
      %929 = func.call @stack_pop_pointer() : () -> i64
      %930 = func.call @cc_cons(%929, %928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%930) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %931 = func.call @stack_pop_pointer() : () -> i64
      %932 = func.call @stack_pop_pointer() : () -> i64
      %933 = func.call @cc_cons(%932, %931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%933) : (i64) -> ()
      %934 = func.call @stack_pop_pointer() : () -> i64
      %935 = func.call @stack_pop_pointer() : () -> i64
      %936 = func.call @cc_cons(%935, %934) : (i64, i64) -> i64
      func.call @stack_push_pointer(%936) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %937 = func.call @stack_pop_pointer() : () -> i64
      %938 = func.call @stack_pop_pointer() : () -> i64
      %939 = func.call @cc_cons(%938, %937) : (i64, i64) -> i64
      func.call @stack_push_pointer(%939) : (i64) -> ()
      %940 = func.call @stack_pop_pointer() : () -> i64
      %941 = func.call @stack_pop_pointer() : () -> i64
      %942 = func.call @cc_cons(%941, %940) : (i64, i64) -> i64
      func.call @stack_push_pointer(%942) : (i64) -> ()
      %943 = func.call @stack_pop_pointer() : () -> i64
      %944 = func.call @stack_pop_pointer() : () -> i64
      %945 = func.call @cc_cons(%944, %943) : (i64, i64) -> i64
      func.call @stack_push_pointer(%945) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %946 = func.call @stack_pop_pointer() : () -> i64
      %947 = func.call @stack_pop_pointer() : () -> i64
      %948 = func.call @cc_cons(%947, %946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%948) : (i64) -> ()
      %949 = func.call @stack_pop_pointer() : () -> i64
      %950 = func.call @stack_pop_pointer() : () -> i64
      %951 = func.call @cc_cons(%950, %949) : (i64, i64) -> i64
      func.call @stack_push_pointer(%951) : (i64) -> ()
      %952 = func.call @stack_pop_pointer() : () -> i64
      %1001 = arith.constant 209815645192197 : i64
      %1002 = arith.constant 0 : i64
      %1003 = func.call @cc_make_closure(%1001, %1002) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
      %1004 = func.call @stack_pop_pointer() : () -> i64
      %1005 = llvm.mlir.addressof @str74 : !llvm.ptr
      %1006 = arith.constant 4 : i64
      %1007 = func.call @cc_make_string(%1005, %1006) : (!llvm.ptr, i64) -> i64
      %1008 = func.call @cc_nil_value() : () -> i64
      %1009 = func.call @cc_intern(%1007, %1008) : (i64, i64) -> i64
      %1010 = func.call @cc_nil_value() : () -> i64
      %1011 = func.call @cc_cons(%1009, %1010) : (i64, i64) -> i64
      %1012 = func.call @cc_values_pack(%1011) : (i64) -> i64
      func.call @stack_push_pointer(%1009) : (i64) -> ()
      %1013 = llvm.mlir.addressof @str75 : !llvm.ptr
      %1014 = arith.constant 13 : i64
      %1015 = func.call @cc_make_string(%1013, %1014) : (!llvm.ptr, i64) -> i64
      %1016 = llvm.mlir.addressof @str76 : !llvm.ptr
      %1017 = arith.constant 11 : i64
      %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
      %1019 = func.call @cc_intern(%1015, %1018) : (i64, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_cons(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_values_pack(%1021) : (i64) -> i64
      func.call @stack_push_pointer(%1019) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1023 = func.call @stack_pop_pointer() : () -> i64
      %1024 = func.call @stack_pop_pointer() : () -> i64
      %1025 = func.call @cc_cons(%1024, %1023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1025) : (i64) -> ()
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @stack_pop_pointer() : () -> i64
      %1028 = func.call @cc_cons(%1027, %1026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1028) : (i64) -> ()
      %1029 = func.call @stack_pop_pointer() : () -> i64
      %1030 = llvm.mlir.addressof @str77 : !llvm.ptr
      %1031 = arith.constant 11 : i64
      %1032 = func.call @cc_make_string(%1030, %1031) : (!llvm.ptr, i64) -> i64
      %1033 = llvm.mlir.addressof @str78 : !llvm.ptr
      %1034 = arith.constant 7 : i64
      %1035 = func.call @cc_make_string(%1033, %1034) : (!llvm.ptr, i64) -> i64
      %1036 = func.call @cc_intern(%1032, %1035) : (i64, i64) -> i64
      %1037 = func.call @cc_nil_value() : () -> i64
      %1038 = func.call @cc_cons(%1036, %1037) : (i64, i64) -> i64
      %1039 = func.call @cc_values_pack(%1038) : (i64) -> i64
      func.call @stack_push_pointer(%1036) : (i64) -> ()
      %1040 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1041 = func.call @stack_pop_pointer() : () -> i64
      %1042 = llvm.mlir.addressof @str79 : !llvm.ptr
      %1043 = arith.constant 4 : i64
      %1044 = func.call @cc_make_string(%1042, %1043) : (!llvm.ptr, i64) -> i64
      %1045 = llvm.mlir.addressof @str80 : !llvm.ptr
      %1046 = arith.constant 7 : i64
      %1047 = func.call @cc_make_string(%1045, %1046) : (!llvm.ptr, i64) -> i64
      %1048 = func.call @cc_intern(%1044, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_nil_value() : () -> i64
      %1050 = func.call @cc_cons(%1048, %1049) : (i64, i64) -> i64
      %1051 = func.call @cc_values_pack(%1050) : (i64) -> i64
      func.call @stack_push_pointer(%1048) : (i64) -> ()
      %1052 = func.call @stack_pop_pointer() : () -> i64
      %1053 = llvm.mlir.addressof @str81 : !llvm.ptr
      %1054 = arith.constant 5 : i64
      %1055 = func.call @cc_make_string(%1053, %1054) : (!llvm.ptr, i64) -> i64
      %1056 = func.call @cc_nil_value() : () -> i64
      %1057 = func.call @cc_intern(%1055, %1056) : (i64, i64) -> i64
      %1058 = func.call @cc_nil_value() : () -> i64
      %1059 = func.call @cc_cons(%1057, %1058) : (i64, i64) -> i64
      %1060 = func.call @cc_values_pack(%1059) : (i64) -> i64
      func.call @stack_push_pointer(%1057) : (i64) -> ()
      %1061 = func.call @stack_pop_pointer() : () -> i64
      %1062 = func.call @cc_nil_value() : () -> i64
      %1063 = func.call @cc_errorp(%891) : (i64) -> i64
      %1064 = arith.cmpi ne, %1063, %1062 : i64
      %1065 = arith.cmpi eq, %1062, %1062 : i64
      %1066 = arith.andi %1064, %1065 : i1
      %1067 = scf.if %1066 -> (i64) {
        scf.yield %891 : i64
      } else {
        scf.yield %1062 : i64
      }
      %1068 = func.call @cc_errorp(%952) : (i64) -> i64
      %1069 = arith.cmpi ne, %1068, %1062 : i64
      %1070 = arith.cmpi eq, %1067, %1062 : i64
      %1071 = arith.andi %1069, %1070 : i1
      %1072 = scf.if %1071 -> (i64) {
        scf.yield %952 : i64
      } else {
        scf.yield %1067 : i64
      }
      %1073 = func.call @cc_errorp(%1004) : (i64) -> i64
      %1074 = arith.cmpi ne, %1073, %1062 : i64
      %1075 = arith.cmpi eq, %1072, %1062 : i64
      %1076 = arith.andi %1074, %1075 : i1
      %1077 = scf.if %1076 -> (i64) {
        scf.yield %1004 : i64
      } else {
        scf.yield %1072 : i64
      }
      %1078 = func.call @cc_errorp(%1029) : (i64) -> i64
      %1079 = arith.cmpi ne, %1078, %1062 : i64
      %1080 = arith.cmpi eq, %1077, %1062 : i64
      %1081 = arith.andi %1079, %1080 : i1
      %1082 = scf.if %1081 -> (i64) {
        scf.yield %1029 : i64
      } else {
        scf.yield %1077 : i64
      }
      %1083 = func.call @cc_errorp(%1040) : (i64) -> i64
      %1084 = arith.cmpi ne, %1083, %1062 : i64
      %1085 = arith.cmpi eq, %1082, %1062 : i64
      %1086 = arith.andi %1084, %1085 : i1
      %1087 = scf.if %1086 -> (i64) {
        scf.yield %1040 : i64
      } else {
        scf.yield %1082 : i64
      }
      %1088 = func.call @cc_errorp(%1041) : (i64) -> i64
      %1089 = arith.cmpi ne, %1088, %1062 : i64
      %1090 = arith.cmpi eq, %1087, %1062 : i64
      %1091 = arith.andi %1089, %1090 : i1
      %1092 = scf.if %1091 -> (i64) {
        scf.yield %1041 : i64
      } else {
        scf.yield %1087 : i64
      }
      %1093 = func.call @cc_errorp(%1052) : (i64) -> i64
      %1094 = arith.cmpi ne, %1093, %1062 : i64
      %1095 = arith.cmpi eq, %1092, %1062 : i64
      %1096 = arith.andi %1094, %1095 : i1
      %1097 = scf.if %1096 -> (i64) {
        scf.yield %1052 : i64
      } else {
        scf.yield %1092 : i64
      }
      %1098 = func.call @cc_errorp(%1061) : (i64) -> i64
      %1099 = arith.cmpi ne, %1098, %1062 : i64
      %1100 = arith.cmpi eq, %1097, %1062 : i64
      %1101 = arith.andi %1099, %1100 : i1
      %1102 = scf.if %1101 -> (i64) {
        scf.yield %1061 : i64
      } else {
        scf.yield %1097 : i64
      }
      %1103 = arith.cmpi ne, %1102, %1062 : i64
      scf.if %1103 {
        func.call @stack_push_pointer(%1102) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%891) : (i64) -> ()
        func.call @stack_push_pointer(%952) : (i64) -> ()
        func.call @stack_push_pointer(%1004) : (i64) -> ()
        func.call @stack_push_pointer(%1029) : (i64) -> ()
        func.call @stack_push_pointer(%1040) : (i64) -> ()
        func.call @stack_push_pointer(%1041) : (i64) -> ()
        func.call @stack_push_pointer(%1052) : (i64) -> ()
        func.call @stack_push_pointer(%1061) : (i64) -> ()
        %1104 = llvm.mlir.addressof @str82 : !llvm.ptr
        %1105 = func.call @cc_make_function_ref_const(%1104) : (!llvm.ptr) -> i64
        %1106 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1105, %1106) : (i64, i64) -> ()
      }
      %1107 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1107 : i64
    }
    %1108 = func.call @cc_nil_value() : () -> i64
    %1109 = func.call @cc_errorp(%882) : (i64) -> i64
    %1110 = arith.cmpi ne, %1109, %1108 : i64
    %1111 = scf.if %1110 -> (i64) {
      scf.yield %882 : i64
    } else {
      %1112 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1113 = arith.constant 11 : i64
      %1114 = func.call @cc_make_string(%1112, %1113) : (!llvm.ptr, i64) -> i64
      %1115 = func.call @cc_nil_value() : () -> i64
      %1116 = func.call @cc_intern(%1114, %1115) : (i64, i64) -> i64
      %1117 = func.call @cc_nil_value() : () -> i64
      %1118 = func.call @cc_cons(%1116, %1117) : (i64, i64) -> i64
      %1119 = func.call @cc_values_pack(%1118) : (i64) -> i64
      func.call @stack_push_pointer(%1116) : (i64) -> ()
      %1120 = func.call @stack_pop_pointer() : () -> i64
      %1121 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1122 = arith.constant 13 : i64
      %1123 = func.call @cc_make_string(%1121, %1122) : (!llvm.ptr, i64) -> i64
      %1124 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1125 = arith.constant 11 : i64
      %1126 = func.call @cc_make_string(%1124, %1125) : (!llvm.ptr, i64) -> i64
      %1127 = func.call @cc_intern(%1123, %1126) : (i64, i64) -> i64
      %1128 = func.call @cc_nil_value() : () -> i64
      %1129 = func.call @cc_cons(%1127, %1128) : (i64, i64) -> i64
      %1130 = func.call @cc_values_pack(%1129) : (i64) -> i64
      func.call @stack_push_pointer(%1127) : (i64) -> ()
      %1131 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1132 = arith.constant 6 : i64
      %1133 = func.call @cc_make_string(%1131, %1132) : (!llvm.ptr, i64) -> i64
      %1134 = func.call @cc_nil_value() : () -> i64
      %1135 = func.call @cc_intern(%1133, %1134) : (i64, i64) -> i64
      %1136 = func.call @cc_nil_value() : () -> i64
      %1137 = func.call @cc_cons(%1135, %1136) : (i64, i64) -> i64
      %1138 = func.call @cc_values_pack(%1137) : (i64) -> i64
      func.call @stack_push_pointer(%1135) : (i64) -> ()
      %1139 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1140 = arith.constant 19 : i64
      %1141 = func.call @cc_make_string(%1139, %1140) : (!llvm.ptr, i64) -> i64
      %1142 = func.call @cc_nil_value() : () -> i64
      %1143 = func.call @cc_intern(%1141, %1142) : (i64, i64) -> i64
      %1144 = func.call @cc_nil_value() : () -> i64
      %1145 = func.call @cc_cons(%1143, %1144) : (i64, i64) -> i64
      %1146 = func.call @cc_values_pack(%1145) : (i64) -> i64
      func.call @stack_push_pointer(%1143) : (i64) -> ()
      %1147 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1148 = arith.constant 6 : i64
      %1149 = func.call @cc_make_string(%1147, %1148) : (!llvm.ptr, i64) -> i64
      %1150 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1151 = arith.constant 11 : i64
      %1152 = func.call @cc_make_string(%1150, %1151) : (!llvm.ptr, i64) -> i64
      %1153 = func.call @cc_intern(%1149, %1152) : (i64, i64) -> i64
      %1154 = func.call @cc_nil_value() : () -> i64
      %1155 = func.call @cc_cons(%1153, %1154) : (i64, i64) -> i64
      %1156 = func.call @cc_values_pack(%1155) : (i64) -> i64
      func.call @stack_push_pointer(%1153) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1157 = func.call @stack_pop_pointer() : () -> i64
      %1158 = func.call @stack_pop_pointer() : () -> i64
      %1159 = func.call @cc_cons(%1158, %1157) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1159) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1160 = func.call @stack_pop_pointer() : () -> i64
      %1161 = func.call @stack_pop_pointer() : () -> i64
      %1162 = func.call @cc_cons(%1161, %1160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1162) : (i64) -> ()
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = func.call @stack_pop_pointer() : () -> i64
      %1165 = func.call @cc_cons(%1164, %1163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1165) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1166 = func.call @stack_pop_pointer() : () -> i64
      %1167 = func.call @stack_pop_pointer() : () -> i64
      %1168 = func.call @cc_cons(%1167, %1166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1168) : (i64) -> ()
      %1169 = func.call @stack_pop_pointer() : () -> i64
      %1170 = func.call @stack_pop_pointer() : () -> i64
      %1171 = func.call @cc_cons(%1170, %1169) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1171) : (i64) -> ()
      %1172 = func.call @stack_pop_pointer() : () -> i64
      %1173 = func.call @stack_pop_pointer() : () -> i64
      %1174 = func.call @cc_cons(%1173, %1172) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1174) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1175 = func.call @stack_pop_pointer() : () -> i64
      %1176 = func.call @stack_pop_pointer() : () -> i64
      %1177 = func.call @cc_cons(%1176, %1175) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1177) : (i64) -> ()
      %1178 = func.call @stack_pop_pointer() : () -> i64
      %1179 = func.call @stack_pop_pointer() : () -> i64
      %1180 = func.call @cc_cons(%1179, %1178) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1180) : (i64) -> ()
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1230 = arith.constant 209815645192198 : i64
      %1231 = arith.constant 0 : i64
      %1232 = func.call @cc_make_closure(%1230, %1231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1232) : (i64) -> ()
      %1233 = func.call @stack_pop_pointer() : () -> i64
      %1234 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1235 = arith.constant 4 : i64
      %1236 = func.call @cc_make_string(%1234, %1235) : (!llvm.ptr, i64) -> i64
      %1237 = func.call @cc_nil_value() : () -> i64
      %1238 = func.call @cc_intern(%1236, %1237) : (i64, i64) -> i64
      %1239 = func.call @cc_nil_value() : () -> i64
      %1240 = func.call @cc_cons(%1238, %1239) : (i64, i64) -> i64
      %1241 = func.call @cc_values_pack(%1240) : (i64) -> i64
      func.call @stack_push_pointer(%1238) : (i64) -> ()
      %1242 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1243 = arith.constant 13 : i64
      %1244 = func.call @cc_make_string(%1242, %1243) : (!llvm.ptr, i64) -> i64
      %1245 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1246 = arith.constant 11 : i64
      %1247 = func.call @cc_make_string(%1245, %1246) : (!llvm.ptr, i64) -> i64
      %1248 = func.call @cc_intern(%1244, %1247) : (i64, i64) -> i64
      %1249 = func.call @cc_nil_value() : () -> i64
      %1250 = func.call @cc_cons(%1248, %1249) : (i64, i64) -> i64
      %1251 = func.call @cc_values_pack(%1250) : (i64) -> i64
      func.call @stack_push_pointer(%1248) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1252 = func.call @stack_pop_pointer() : () -> i64
      %1253 = func.call @stack_pop_pointer() : () -> i64
      %1254 = func.call @cc_cons(%1253, %1252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1254) : (i64) -> ()
      %1255 = func.call @stack_pop_pointer() : () -> i64
      %1256 = func.call @stack_pop_pointer() : () -> i64
      %1257 = func.call @cc_cons(%1256, %1255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1257) : (i64) -> ()
      %1258 = func.call @stack_pop_pointer() : () -> i64
      %1259 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1260 = arith.constant 11 : i64
      %1261 = func.call @cc_make_string(%1259, %1260) : (!llvm.ptr, i64) -> i64
      %1262 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1263 = arith.constant 7 : i64
      %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
      %1265 = func.call @cc_intern(%1261, %1264) : (i64, i64) -> i64
      %1266 = func.call @cc_nil_value() : () -> i64
      %1267 = func.call @cc_cons(%1265, %1266) : (i64, i64) -> i64
      %1268 = func.call @cc_values_pack(%1267) : (i64) -> i64
      func.call @stack_push_pointer(%1265) : (i64) -> ()
      %1269 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1270 = func.call @stack_pop_pointer() : () -> i64
      %1271 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1272 = arith.constant 4 : i64
      %1273 = func.call @cc_make_string(%1271, %1272) : (!llvm.ptr, i64) -> i64
      %1274 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1275 = arith.constant 7 : i64
      %1276 = func.call @cc_make_string(%1274, %1275) : (!llvm.ptr, i64) -> i64
      %1277 = func.call @cc_intern(%1273, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_nil_value() : () -> i64
      %1279 = func.call @cc_cons(%1277, %1278) : (i64, i64) -> i64
      %1280 = func.call @cc_values_pack(%1279) : (i64) -> i64
      func.call @stack_push_pointer(%1277) : (i64) -> ()
      %1281 = func.call @stack_pop_pointer() : () -> i64
      %1282 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1283 = arith.constant 5 : i64
      %1284 = func.call @cc_make_string(%1282, %1283) : (!llvm.ptr, i64) -> i64
      %1285 = func.call @cc_nil_value() : () -> i64
      %1286 = func.call @cc_intern(%1284, %1285) : (i64, i64) -> i64
      %1287 = func.call @cc_nil_value() : () -> i64
      %1288 = func.call @cc_cons(%1286, %1287) : (i64, i64) -> i64
      %1289 = func.call @cc_values_pack(%1288) : (i64) -> i64
      func.call @stack_push_pointer(%1286) : (i64) -> ()
      %1290 = func.call @stack_pop_pointer() : () -> i64
      %1291 = func.call @cc_nil_value() : () -> i64
      %1292 = func.call @cc_errorp(%1120) : (i64) -> i64
      %1293 = arith.cmpi ne, %1292, %1291 : i64
      %1294 = arith.cmpi eq, %1291, %1291 : i64
      %1295 = arith.andi %1293, %1294 : i1
      %1296 = scf.if %1295 -> (i64) {
        scf.yield %1120 : i64
      } else {
        scf.yield %1291 : i64
      }
      %1297 = func.call @cc_errorp(%1181) : (i64) -> i64
      %1298 = arith.cmpi ne, %1297, %1291 : i64
      %1299 = arith.cmpi eq, %1296, %1291 : i64
      %1300 = arith.andi %1298, %1299 : i1
      %1301 = scf.if %1300 -> (i64) {
        scf.yield %1181 : i64
      } else {
        scf.yield %1296 : i64
      }
      %1302 = func.call @cc_errorp(%1233) : (i64) -> i64
      %1303 = arith.cmpi ne, %1302, %1291 : i64
      %1304 = arith.cmpi eq, %1301, %1291 : i64
      %1305 = arith.andi %1303, %1304 : i1
      %1306 = scf.if %1305 -> (i64) {
        scf.yield %1233 : i64
      } else {
        scf.yield %1301 : i64
      }
      %1307 = func.call @cc_errorp(%1258) : (i64) -> i64
      %1308 = arith.cmpi ne, %1307, %1291 : i64
      %1309 = arith.cmpi eq, %1306, %1291 : i64
      %1310 = arith.andi %1308, %1309 : i1
      %1311 = scf.if %1310 -> (i64) {
        scf.yield %1258 : i64
      } else {
        scf.yield %1306 : i64
      }
      %1312 = func.call @cc_errorp(%1269) : (i64) -> i64
      %1313 = arith.cmpi ne, %1312, %1291 : i64
      %1314 = arith.cmpi eq, %1311, %1291 : i64
      %1315 = arith.andi %1313, %1314 : i1
      %1316 = scf.if %1315 -> (i64) {
        scf.yield %1269 : i64
      } else {
        scf.yield %1311 : i64
      }
      %1317 = func.call @cc_errorp(%1270) : (i64) -> i64
      %1318 = arith.cmpi ne, %1317, %1291 : i64
      %1319 = arith.cmpi eq, %1316, %1291 : i64
      %1320 = arith.andi %1318, %1319 : i1
      %1321 = scf.if %1320 -> (i64) {
        scf.yield %1270 : i64
      } else {
        scf.yield %1316 : i64
      }
      %1322 = func.call @cc_errorp(%1281) : (i64) -> i64
      %1323 = arith.cmpi ne, %1322, %1291 : i64
      %1324 = arith.cmpi eq, %1321, %1291 : i64
      %1325 = arith.andi %1323, %1324 : i1
      %1326 = scf.if %1325 -> (i64) {
        scf.yield %1281 : i64
      } else {
        scf.yield %1321 : i64
      }
      %1327 = func.call @cc_errorp(%1290) : (i64) -> i64
      %1328 = arith.cmpi ne, %1327, %1291 : i64
      %1329 = arith.cmpi eq, %1326, %1291 : i64
      %1330 = arith.andi %1328, %1329 : i1
      %1331 = scf.if %1330 -> (i64) {
        scf.yield %1290 : i64
      } else {
        scf.yield %1326 : i64
      }
      %1332 = arith.cmpi ne, %1331, %1291 : i64
      scf.if %1332 {
        func.call @stack_push_pointer(%1331) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1120) : (i64) -> ()
        func.call @stack_push_pointer(%1181) : (i64) -> ()
        func.call @stack_push_pointer(%1233) : (i64) -> ()
        func.call @stack_push_pointer(%1258) : (i64) -> ()
        func.call @stack_push_pointer(%1269) : (i64) -> ()
        func.call @stack_push_pointer(%1270) : (i64) -> ()
        func.call @stack_push_pointer(%1281) : (i64) -> ()
        func.call @stack_push_pointer(%1290) : (i64) -> ()
        %1333 = llvm.mlir.addressof @str99 : !llvm.ptr
        %1334 = func.call @cc_make_function_ref_const(%1333) : (!llvm.ptr) -> i64
        %1335 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1334, %1335) : (i64, i64) -> ()
      }
      %1336 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1336 : i64
    }
    %1337 = func.call @cc_nil_value() : () -> i64
    %1338 = func.call @cc_errorp(%1111) : (i64) -> i64
    %1339 = arith.cmpi ne, %1338, %1337 : i64
    %1340 = scf.if %1339 -> (i64) {
      scf.yield %1111 : i64
    } else {
      %1341 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1342 = arith.constant 11 : i64
      %1343 = func.call @cc_make_string(%1341, %1342) : (!llvm.ptr, i64) -> i64
      %1344 = func.call @cc_nil_value() : () -> i64
      %1345 = func.call @cc_intern(%1343, %1344) : (i64, i64) -> i64
      %1346 = func.call @cc_nil_value() : () -> i64
      %1347 = func.call @cc_cons(%1345, %1346) : (i64, i64) -> i64
      %1348 = func.call @cc_values_pack(%1347) : (i64) -> i64
      func.call @stack_push_pointer(%1345) : (i64) -> ()
      %1349 = func.call @stack_pop_pointer() : () -> i64
      %1350 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1351 = arith.constant 13 : i64
      %1352 = func.call @cc_make_string(%1350, %1351) : (!llvm.ptr, i64) -> i64
      %1353 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1354 = arith.constant 11 : i64
      %1355 = func.call @cc_make_string(%1353, %1354) : (!llvm.ptr, i64) -> i64
      %1356 = func.call @cc_intern(%1352, %1355) : (i64, i64) -> i64
      %1357 = func.call @cc_nil_value() : () -> i64
      %1358 = func.call @cc_cons(%1356, %1357) : (i64, i64) -> i64
      %1359 = func.call @cc_values_pack(%1358) : (i64) -> i64
      func.call @stack_push_pointer(%1356) : (i64) -> ()
      %1360 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1361 = arith.constant 6 : i64
      %1362 = func.call @cc_make_string(%1360, %1361) : (!llvm.ptr, i64) -> i64
      %1363 = func.call @cc_nil_value() : () -> i64
      %1364 = func.call @cc_intern(%1362, %1363) : (i64, i64) -> i64
      %1365 = func.call @cc_nil_value() : () -> i64
      %1366 = func.call @cc_cons(%1364, %1365) : (i64, i64) -> i64
      %1367 = func.call @cc_values_pack(%1366) : (i64) -> i64
      func.call @stack_push_pointer(%1364) : (i64) -> ()
      %1368 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1369 = arith.constant 19 : i64
      %1370 = func.call @cc_make_string(%1368, %1369) : (!llvm.ptr, i64) -> i64
      %1371 = func.call @cc_nil_value() : () -> i64
      %1372 = func.call @cc_intern(%1370, %1371) : (i64, i64) -> i64
      %1373 = func.call @cc_nil_value() : () -> i64
      %1374 = func.call @cc_cons(%1372, %1373) : (i64, i64) -> i64
      %1375 = func.call @cc_values_pack(%1374) : (i64) -> i64
      func.call @stack_push_pointer(%1372) : (i64) -> ()
      %1376 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1377 = arith.constant 6 : i64
      %1378 = func.call @cc_make_string(%1376, %1377) : (!llvm.ptr, i64) -> i64
      %1379 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1380 = arith.constant 11 : i64
      %1381 = func.call @cc_make_string(%1379, %1380) : (!llvm.ptr, i64) -> i64
      %1382 = func.call @cc_intern(%1378, %1381) : (i64, i64) -> i64
      %1383 = func.call @cc_nil_value() : () -> i64
      %1384 = func.call @cc_cons(%1382, %1383) : (i64, i64) -> i64
      %1385 = func.call @cc_values_pack(%1384) : (i64) -> i64
      func.call @stack_push_pointer(%1382) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = func.call @cc_cons(%1387, %1386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1389 = func.call @stack_pop_pointer() : () -> i64
      %1390 = func.call @stack_pop_pointer() : () -> i64
      %1391 = func.call @cc_cons(%1390, %1389) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1391) : (i64) -> ()
      %1392 = func.call @stack_pop_pointer() : () -> i64
      %1393 = func.call @stack_pop_pointer() : () -> i64
      %1394 = func.call @cc_cons(%1393, %1392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1394) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1395 = func.call @stack_pop_pointer() : () -> i64
      %1396 = func.call @stack_pop_pointer() : () -> i64
      %1397 = func.call @cc_cons(%1396, %1395) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1397) : (i64) -> ()
      %1398 = func.call @stack_pop_pointer() : () -> i64
      %1399 = func.call @stack_pop_pointer() : () -> i64
      %1400 = func.call @cc_cons(%1399, %1398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1400) : (i64) -> ()
      %1401 = func.call @stack_pop_pointer() : () -> i64
      %1402 = func.call @stack_pop_pointer() : () -> i64
      %1403 = func.call @cc_cons(%1402, %1401) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1403) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1404 = func.call @stack_pop_pointer() : () -> i64
      %1405 = func.call @stack_pop_pointer() : () -> i64
      %1406 = func.call @cc_cons(%1405, %1404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1406) : (i64) -> ()
      %1407 = func.call @stack_pop_pointer() : () -> i64
      %1408 = func.call @stack_pop_pointer() : () -> i64
      %1409 = func.call @cc_cons(%1408, %1407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1409) : (i64) -> ()
      %1410 = func.call @stack_pop_pointer() : () -> i64
      %1459 = arith.constant 209815645192199 : i64
      %1460 = arith.constant 0 : i64
      %1461 = func.call @cc_make_closure(%1459, %1460) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1461) : (i64) -> ()
      %1462 = func.call @stack_pop_pointer() : () -> i64
      %1463 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1464 = arith.constant 4 : i64
      %1465 = func.call @cc_make_string(%1463, %1464) : (!llvm.ptr, i64) -> i64
      %1466 = func.call @cc_nil_value() : () -> i64
      %1467 = func.call @cc_intern(%1465, %1466) : (i64, i64) -> i64
      %1468 = func.call @cc_nil_value() : () -> i64
      %1469 = func.call @cc_cons(%1467, %1468) : (i64, i64) -> i64
      %1470 = func.call @cc_values_pack(%1469) : (i64) -> i64
      func.call @stack_push_pointer(%1467) : (i64) -> ()
      %1471 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1472 = arith.constant 13 : i64
      %1473 = func.call @cc_make_string(%1471, %1472) : (!llvm.ptr, i64) -> i64
      %1474 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1475 = arith.constant 11 : i64
      %1476 = func.call @cc_make_string(%1474, %1475) : (!llvm.ptr, i64) -> i64
      %1477 = func.call @cc_intern(%1473, %1476) : (i64, i64) -> i64
      %1478 = func.call @cc_nil_value() : () -> i64
      %1479 = func.call @cc_cons(%1477, %1478) : (i64, i64) -> i64
      %1480 = func.call @cc_values_pack(%1479) : (i64) -> i64
      func.call @stack_push_pointer(%1477) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1481 = func.call @stack_pop_pointer() : () -> i64
      %1482 = func.call @stack_pop_pointer() : () -> i64
      %1483 = func.call @cc_cons(%1482, %1481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1483) : (i64) -> ()
      %1484 = func.call @stack_pop_pointer() : () -> i64
      %1485 = func.call @stack_pop_pointer() : () -> i64
      %1486 = func.call @cc_cons(%1485, %1484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1486) : (i64) -> ()
      %1487 = func.call @stack_pop_pointer() : () -> i64
      %1488 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1489 = arith.constant 11 : i64
      %1490 = func.call @cc_make_string(%1488, %1489) : (!llvm.ptr, i64) -> i64
      %1491 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1492 = arith.constant 7 : i64
      %1493 = func.call @cc_make_string(%1491, %1492) : (!llvm.ptr, i64) -> i64
      %1494 = func.call @cc_intern(%1490, %1493) : (i64, i64) -> i64
      %1495 = func.call @cc_nil_value() : () -> i64
      %1496 = func.call @cc_cons(%1494, %1495) : (i64, i64) -> i64
      %1497 = func.call @cc_values_pack(%1496) : (i64) -> i64
      func.call @stack_push_pointer(%1494) : (i64) -> ()
      %1498 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1499 = func.call @stack_pop_pointer() : () -> i64
      %1500 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1501 = arith.constant 4 : i64
      %1502 = func.call @cc_make_string(%1500, %1501) : (!llvm.ptr, i64) -> i64
      %1503 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1504 = arith.constant 7 : i64
      %1505 = func.call @cc_make_string(%1503, %1504) : (!llvm.ptr, i64) -> i64
      %1506 = func.call @cc_intern(%1502, %1505) : (i64, i64) -> i64
      %1507 = func.call @cc_nil_value() : () -> i64
      %1508 = func.call @cc_cons(%1506, %1507) : (i64, i64) -> i64
      %1509 = func.call @cc_values_pack(%1508) : (i64) -> i64
      func.call @stack_push_pointer(%1506) : (i64) -> ()
      %1510 = func.call @stack_pop_pointer() : () -> i64
      %1511 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1512 = arith.constant 5 : i64
      %1513 = func.call @cc_make_string(%1511, %1512) : (!llvm.ptr, i64) -> i64
      %1514 = func.call @cc_nil_value() : () -> i64
      %1515 = func.call @cc_intern(%1513, %1514) : (i64, i64) -> i64
      %1516 = func.call @cc_nil_value() : () -> i64
      %1517 = func.call @cc_cons(%1515, %1516) : (i64, i64) -> i64
      %1518 = func.call @cc_values_pack(%1517) : (i64) -> i64
      func.call @stack_push_pointer(%1515) : (i64) -> ()
      %1519 = func.call @stack_pop_pointer() : () -> i64
      %1520 = func.call @cc_nil_value() : () -> i64
      %1521 = func.call @cc_errorp(%1349) : (i64) -> i64
      %1522 = arith.cmpi ne, %1521, %1520 : i64
      %1523 = arith.cmpi eq, %1520, %1520 : i64
      %1524 = arith.andi %1522, %1523 : i1
      %1525 = scf.if %1524 -> (i64) {
        scf.yield %1349 : i64
      } else {
        scf.yield %1520 : i64
      }
      %1526 = func.call @cc_errorp(%1410) : (i64) -> i64
      %1527 = arith.cmpi ne, %1526, %1520 : i64
      %1528 = arith.cmpi eq, %1525, %1520 : i64
      %1529 = arith.andi %1527, %1528 : i1
      %1530 = scf.if %1529 -> (i64) {
        scf.yield %1410 : i64
      } else {
        scf.yield %1525 : i64
      }
      %1531 = func.call @cc_errorp(%1462) : (i64) -> i64
      %1532 = arith.cmpi ne, %1531, %1520 : i64
      %1533 = arith.cmpi eq, %1530, %1520 : i64
      %1534 = arith.andi %1532, %1533 : i1
      %1535 = scf.if %1534 -> (i64) {
        scf.yield %1462 : i64
      } else {
        scf.yield %1530 : i64
      }
      %1536 = func.call @cc_errorp(%1487) : (i64) -> i64
      %1537 = arith.cmpi ne, %1536, %1520 : i64
      %1538 = arith.cmpi eq, %1535, %1520 : i64
      %1539 = arith.andi %1537, %1538 : i1
      %1540 = scf.if %1539 -> (i64) {
        scf.yield %1487 : i64
      } else {
        scf.yield %1535 : i64
      }
      %1541 = func.call @cc_errorp(%1498) : (i64) -> i64
      %1542 = arith.cmpi ne, %1541, %1520 : i64
      %1543 = arith.cmpi eq, %1540, %1520 : i64
      %1544 = arith.andi %1542, %1543 : i1
      %1545 = scf.if %1544 -> (i64) {
        scf.yield %1498 : i64
      } else {
        scf.yield %1540 : i64
      }
      %1546 = func.call @cc_errorp(%1499) : (i64) -> i64
      %1547 = arith.cmpi ne, %1546, %1520 : i64
      %1548 = arith.cmpi eq, %1545, %1520 : i64
      %1549 = arith.andi %1547, %1548 : i1
      %1550 = scf.if %1549 -> (i64) {
        scf.yield %1499 : i64
      } else {
        scf.yield %1545 : i64
      }
      %1551 = func.call @cc_errorp(%1510) : (i64) -> i64
      %1552 = arith.cmpi ne, %1551, %1520 : i64
      %1553 = arith.cmpi eq, %1550, %1520 : i64
      %1554 = arith.andi %1552, %1553 : i1
      %1555 = scf.if %1554 -> (i64) {
        scf.yield %1510 : i64
      } else {
        scf.yield %1550 : i64
      }
      %1556 = func.call @cc_errorp(%1519) : (i64) -> i64
      %1557 = arith.cmpi ne, %1556, %1520 : i64
      %1558 = arith.cmpi eq, %1555, %1520 : i64
      %1559 = arith.andi %1557, %1558 : i1
      %1560 = scf.if %1559 -> (i64) {
        scf.yield %1519 : i64
      } else {
        scf.yield %1555 : i64
      }
      %1561 = arith.cmpi ne, %1560, %1520 : i64
      scf.if %1561 {
        func.call @stack_push_pointer(%1560) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1349) : (i64) -> ()
        func.call @stack_push_pointer(%1410) : (i64) -> ()
        func.call @stack_push_pointer(%1462) : (i64) -> ()
        func.call @stack_push_pointer(%1487) : (i64) -> ()
        func.call @stack_push_pointer(%1498) : (i64) -> ()
        func.call @stack_push_pointer(%1499) : (i64) -> ()
        func.call @stack_push_pointer(%1510) : (i64) -> ()
        func.call @stack_push_pointer(%1519) : (i64) -> ()
        %1562 = llvm.mlir.addressof @str116 : !llvm.ptr
        %1563 = func.call @cc_make_function_ref_const(%1562) : (!llvm.ptr) -> i64
        %1564 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1563, %1564) : (i64, i64) -> ()
      }
      %1565 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1565 : i64
    }
    %1566 = func.call @cc_nil_value() : () -> i64
    %1567 = func.call @cc_errorp(%1340) : (i64) -> i64
    %1568 = arith.cmpi ne, %1567, %1566 : i64
    %1569 = scf.if %1568 -> (i64) {
      scf.yield %1340 : i64
    } else {
      %1570 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1571 = arith.constant 11 : i64
      %1572 = func.call @cc_make_string(%1570, %1571) : (!llvm.ptr, i64) -> i64
      %1573 = func.call @cc_nil_value() : () -> i64
      %1574 = func.call @cc_intern(%1572, %1573) : (i64, i64) -> i64
      %1575 = func.call @cc_nil_value() : () -> i64
      %1576 = func.call @cc_cons(%1574, %1575) : (i64, i64) -> i64
      %1577 = func.call @cc_values_pack(%1576) : (i64) -> i64
      func.call @stack_push_pointer(%1574) : (i64) -> ()
      %1578 = func.call @stack_pop_pointer() : () -> i64
      %1579 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1580 = arith.constant 13 : i64
      %1581 = func.call @cc_make_string(%1579, %1580) : (!llvm.ptr, i64) -> i64
      %1582 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1583 = arith.constant 11 : i64
      %1584 = func.call @cc_make_string(%1582, %1583) : (!llvm.ptr, i64) -> i64
      %1585 = func.call @cc_intern(%1581, %1584) : (i64, i64) -> i64
      %1586 = func.call @cc_nil_value() : () -> i64
      %1587 = func.call @cc_cons(%1585, %1586) : (i64, i64) -> i64
      %1588 = func.call @cc_values_pack(%1587) : (i64) -> i64
      func.call @stack_push_pointer(%1585) : (i64) -> ()
      %1589 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1590 = arith.constant 6 : i64
      %1591 = func.call @cc_make_string(%1589, %1590) : (!llvm.ptr, i64) -> i64
      %1592 = func.call @cc_nil_value() : () -> i64
      %1593 = func.call @cc_intern(%1591, %1592) : (i64, i64) -> i64
      %1594 = func.call @cc_nil_value() : () -> i64
      %1595 = func.call @cc_cons(%1593, %1594) : (i64, i64) -> i64
      %1596 = func.call @cc_values_pack(%1595) : (i64) -> i64
      func.call @stack_push_pointer(%1593) : (i64) -> ()
      %1597 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1598 = arith.constant 19 : i64
      %1599 = func.call @cc_make_string(%1597, %1598) : (!llvm.ptr, i64) -> i64
      %1600 = func.call @cc_nil_value() : () -> i64
      %1601 = func.call @cc_intern(%1599, %1600) : (i64, i64) -> i64
      %1602 = func.call @cc_nil_value() : () -> i64
      %1603 = func.call @cc_cons(%1601, %1602) : (i64, i64) -> i64
      %1604 = func.call @cc_values_pack(%1603) : (i64) -> i64
      func.call @stack_push_pointer(%1601) : (i64) -> ()
      %1605 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1606 = arith.constant 10 : i64
      %1607 = func.call @cc_make_string(%1605, %1606) : (!llvm.ptr, i64) -> i64
      %1608 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1609 = arith.constant 11 : i64
      %1610 = func.call @cc_make_string(%1608, %1609) : (!llvm.ptr, i64) -> i64
      %1611 = func.call @cc_intern(%1607, %1610) : (i64, i64) -> i64
      %1612 = func.call @cc_nil_value() : () -> i64
      %1613 = func.call @cc_cons(%1611, %1612) : (i64, i64) -> i64
      %1614 = func.call @cc_values_pack(%1613) : (i64) -> i64
      func.call @stack_push_pointer(%1611) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1615 = func.call @stack_pop_pointer() : () -> i64
      %1616 = func.call @stack_pop_pointer() : () -> i64
      %1617 = func.call @cc_cons(%1616, %1615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1617) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1618 = func.call @stack_pop_pointer() : () -> i64
      %1619 = func.call @stack_pop_pointer() : () -> i64
      %1620 = func.call @cc_cons(%1619, %1618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1620) : (i64) -> ()
      %1621 = func.call @stack_pop_pointer() : () -> i64
      %1622 = func.call @stack_pop_pointer() : () -> i64
      %1623 = func.call @cc_cons(%1622, %1621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1623) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1624 = func.call @stack_pop_pointer() : () -> i64
      %1625 = func.call @stack_pop_pointer() : () -> i64
      %1626 = func.call @cc_cons(%1625, %1624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1626) : (i64) -> ()
      %1627 = func.call @stack_pop_pointer() : () -> i64
      %1628 = func.call @stack_pop_pointer() : () -> i64
      %1629 = func.call @cc_cons(%1628, %1627) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1629) : (i64) -> ()
      %1630 = func.call @stack_pop_pointer() : () -> i64
      %1631 = func.call @stack_pop_pointer() : () -> i64
      %1632 = func.call @cc_cons(%1631, %1630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1632) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1633 = func.call @stack_pop_pointer() : () -> i64
      %1634 = func.call @stack_pop_pointer() : () -> i64
      %1635 = func.call @cc_cons(%1634, %1633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1635) : (i64) -> ()
      %1636 = func.call @stack_pop_pointer() : () -> i64
      %1637 = func.call @stack_pop_pointer() : () -> i64
      %1638 = func.call @cc_cons(%1637, %1636) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1638) : (i64) -> ()
      %1639 = func.call @stack_pop_pointer() : () -> i64
      %1688 = arith.constant 209815645192200 : i64
      %1689 = arith.constant 0 : i64
      %1690 = func.call @cc_make_closure(%1688, %1689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1690) : (i64) -> ()
      %1691 = func.call @stack_pop_pointer() : () -> i64
      %1692 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1693 = arith.constant 4 : i64
      %1694 = func.call @cc_make_string(%1692, %1693) : (!llvm.ptr, i64) -> i64
      %1695 = func.call @cc_nil_value() : () -> i64
      %1696 = func.call @cc_intern(%1694, %1695) : (i64, i64) -> i64
      %1697 = func.call @cc_nil_value() : () -> i64
      %1698 = func.call @cc_cons(%1696, %1697) : (i64, i64) -> i64
      %1699 = func.call @cc_values_pack(%1698) : (i64) -> i64
      func.call @stack_push_pointer(%1696) : (i64) -> ()
      %1700 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1701 = arith.constant 13 : i64
      %1702 = func.call @cc_make_string(%1700, %1701) : (!llvm.ptr, i64) -> i64
      %1703 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1704 = arith.constant 11 : i64
      %1705 = func.call @cc_make_string(%1703, %1704) : (!llvm.ptr, i64) -> i64
      %1706 = func.call @cc_intern(%1702, %1705) : (i64, i64) -> i64
      %1707 = func.call @cc_nil_value() : () -> i64
      %1708 = func.call @cc_cons(%1706, %1707) : (i64, i64) -> i64
      %1709 = func.call @cc_values_pack(%1708) : (i64) -> i64
      func.call @stack_push_pointer(%1706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1710 = func.call @stack_pop_pointer() : () -> i64
      %1711 = func.call @stack_pop_pointer() : () -> i64
      %1712 = func.call @cc_cons(%1711, %1710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1712) : (i64) -> ()
      %1713 = func.call @stack_pop_pointer() : () -> i64
      %1714 = func.call @stack_pop_pointer() : () -> i64
      %1715 = func.call @cc_cons(%1714, %1713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1715) : (i64) -> ()
      %1716 = func.call @stack_pop_pointer() : () -> i64
      %1717 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1718 = arith.constant 11 : i64
      %1719 = func.call @cc_make_string(%1717, %1718) : (!llvm.ptr, i64) -> i64
      %1720 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1721 = arith.constant 7 : i64
      %1722 = func.call @cc_make_string(%1720, %1721) : (!llvm.ptr, i64) -> i64
      %1723 = func.call @cc_intern(%1719, %1722) : (i64, i64) -> i64
      %1724 = func.call @cc_nil_value() : () -> i64
      %1725 = func.call @cc_cons(%1723, %1724) : (i64, i64) -> i64
      %1726 = func.call @cc_values_pack(%1725) : (i64) -> i64
      func.call @stack_push_pointer(%1723) : (i64) -> ()
      %1727 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1728 = func.call @stack_pop_pointer() : () -> i64
      %1729 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1730 = arith.constant 4 : i64
      %1731 = func.call @cc_make_string(%1729, %1730) : (!llvm.ptr, i64) -> i64
      %1732 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1733 = arith.constant 7 : i64
      %1734 = func.call @cc_make_string(%1732, %1733) : (!llvm.ptr, i64) -> i64
      %1735 = func.call @cc_intern(%1731, %1734) : (i64, i64) -> i64
      %1736 = func.call @cc_nil_value() : () -> i64
      %1737 = func.call @cc_cons(%1735, %1736) : (i64, i64) -> i64
      %1738 = func.call @cc_values_pack(%1737) : (i64) -> i64
      func.call @stack_push_pointer(%1735) : (i64) -> ()
      %1739 = func.call @stack_pop_pointer() : () -> i64
      %1740 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1741 = arith.constant 5 : i64
      %1742 = func.call @cc_make_string(%1740, %1741) : (!llvm.ptr, i64) -> i64
      %1743 = func.call @cc_nil_value() : () -> i64
      %1744 = func.call @cc_intern(%1742, %1743) : (i64, i64) -> i64
      %1745 = func.call @cc_nil_value() : () -> i64
      %1746 = func.call @cc_cons(%1744, %1745) : (i64, i64) -> i64
      %1747 = func.call @cc_values_pack(%1746) : (i64) -> i64
      func.call @stack_push_pointer(%1744) : (i64) -> ()
      %1748 = func.call @stack_pop_pointer() : () -> i64
      %1749 = func.call @cc_nil_value() : () -> i64
      %1750 = func.call @cc_errorp(%1578) : (i64) -> i64
      %1751 = arith.cmpi ne, %1750, %1749 : i64
      %1752 = arith.cmpi eq, %1749, %1749 : i64
      %1753 = arith.andi %1751, %1752 : i1
      %1754 = scf.if %1753 -> (i64) {
        scf.yield %1578 : i64
      } else {
        scf.yield %1749 : i64
      }
      %1755 = func.call @cc_errorp(%1639) : (i64) -> i64
      %1756 = arith.cmpi ne, %1755, %1749 : i64
      %1757 = arith.cmpi eq, %1754, %1749 : i64
      %1758 = arith.andi %1756, %1757 : i1
      %1759 = scf.if %1758 -> (i64) {
        scf.yield %1639 : i64
      } else {
        scf.yield %1754 : i64
      }
      %1760 = func.call @cc_errorp(%1691) : (i64) -> i64
      %1761 = arith.cmpi ne, %1760, %1749 : i64
      %1762 = arith.cmpi eq, %1759, %1749 : i64
      %1763 = arith.andi %1761, %1762 : i1
      %1764 = scf.if %1763 -> (i64) {
        scf.yield %1691 : i64
      } else {
        scf.yield %1759 : i64
      }
      %1765 = func.call @cc_errorp(%1716) : (i64) -> i64
      %1766 = arith.cmpi ne, %1765, %1749 : i64
      %1767 = arith.cmpi eq, %1764, %1749 : i64
      %1768 = arith.andi %1766, %1767 : i1
      %1769 = scf.if %1768 -> (i64) {
        scf.yield %1716 : i64
      } else {
        scf.yield %1764 : i64
      }
      %1770 = func.call @cc_errorp(%1727) : (i64) -> i64
      %1771 = arith.cmpi ne, %1770, %1749 : i64
      %1772 = arith.cmpi eq, %1769, %1749 : i64
      %1773 = arith.andi %1771, %1772 : i1
      %1774 = scf.if %1773 -> (i64) {
        scf.yield %1727 : i64
      } else {
        scf.yield %1769 : i64
      }
      %1775 = func.call @cc_errorp(%1728) : (i64) -> i64
      %1776 = arith.cmpi ne, %1775, %1749 : i64
      %1777 = arith.cmpi eq, %1774, %1749 : i64
      %1778 = arith.andi %1776, %1777 : i1
      %1779 = scf.if %1778 -> (i64) {
        scf.yield %1728 : i64
      } else {
        scf.yield %1774 : i64
      }
      %1780 = func.call @cc_errorp(%1739) : (i64) -> i64
      %1781 = arith.cmpi ne, %1780, %1749 : i64
      %1782 = arith.cmpi eq, %1779, %1749 : i64
      %1783 = arith.andi %1781, %1782 : i1
      %1784 = scf.if %1783 -> (i64) {
        scf.yield %1739 : i64
      } else {
        scf.yield %1779 : i64
      }
      %1785 = func.call @cc_errorp(%1748) : (i64) -> i64
      %1786 = arith.cmpi ne, %1785, %1749 : i64
      %1787 = arith.cmpi eq, %1784, %1749 : i64
      %1788 = arith.andi %1786, %1787 : i1
      %1789 = scf.if %1788 -> (i64) {
        scf.yield %1748 : i64
      } else {
        scf.yield %1784 : i64
      }
      %1790 = arith.cmpi ne, %1789, %1749 : i64
      scf.if %1790 {
        func.call @stack_push_pointer(%1789) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1578) : (i64) -> ()
        func.call @stack_push_pointer(%1639) : (i64) -> ()
        func.call @stack_push_pointer(%1691) : (i64) -> ()
        func.call @stack_push_pointer(%1716) : (i64) -> ()
        func.call @stack_push_pointer(%1727) : (i64) -> ()
        func.call @stack_push_pointer(%1728) : (i64) -> ()
        func.call @stack_push_pointer(%1739) : (i64) -> ()
        func.call @stack_push_pointer(%1748) : (i64) -> ()
        %1791 = llvm.mlir.addressof @str133 : !llvm.ptr
        %1792 = func.call @cc_make_function_ref_const(%1791) : (!llvm.ptr) -> i64
        %1793 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1792, %1793) : (i64, i64) -> ()
      }
      %1794 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1794 : i64
    }
    %1795 = func.call @cc_nil_value() : () -> i64
    %1796 = func.call @cc_errorp(%1569) : (i64) -> i64
    %1797 = arith.cmpi ne, %1796, %1795 : i64
    %1798 = scf.if %1797 -> (i64) {
      scf.yield %1569 : i64
    } else {
      %1799 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1800 = arith.constant 11 : i64
      %1801 = func.call @cc_make_string(%1799, %1800) : (!llvm.ptr, i64) -> i64
      %1802 = func.call @cc_nil_value() : () -> i64
      %1803 = func.call @cc_intern(%1801, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_nil_value() : () -> i64
      %1805 = func.call @cc_cons(%1803, %1804) : (i64, i64) -> i64
      %1806 = func.call @cc_values_pack(%1805) : (i64) -> i64
      func.call @stack_push_pointer(%1803) : (i64) -> ()
      %1807 = func.call @stack_pop_pointer() : () -> i64
      %1808 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1809 = arith.constant 13 : i64
      %1810 = func.call @cc_make_string(%1808, %1809) : (!llvm.ptr, i64) -> i64
      %1811 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1812 = arith.constant 11 : i64
      %1813 = func.call @cc_make_string(%1811, %1812) : (!llvm.ptr, i64) -> i64
      %1814 = func.call @cc_intern(%1810, %1813) : (i64, i64) -> i64
      %1815 = func.call @cc_nil_value() : () -> i64
      %1816 = func.call @cc_cons(%1814, %1815) : (i64, i64) -> i64
      %1817 = func.call @cc_values_pack(%1816) : (i64) -> i64
      func.call @stack_push_pointer(%1814) : (i64) -> ()
      %1818 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1819 = arith.constant 6 : i64
      %1820 = func.call @cc_make_string(%1818, %1819) : (!llvm.ptr, i64) -> i64
      %1821 = func.call @cc_nil_value() : () -> i64
      %1822 = func.call @cc_intern(%1820, %1821) : (i64, i64) -> i64
      %1823 = func.call @cc_nil_value() : () -> i64
      %1824 = func.call @cc_cons(%1822, %1823) : (i64, i64) -> i64
      %1825 = func.call @cc_values_pack(%1824) : (i64) -> i64
      func.call @stack_push_pointer(%1822) : (i64) -> ()
      %1826 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1827 = arith.constant 19 : i64
      %1828 = func.call @cc_make_string(%1826, %1827) : (!llvm.ptr, i64) -> i64
      %1829 = func.call @cc_nil_value() : () -> i64
      %1830 = func.call @cc_intern(%1828, %1829) : (i64, i64) -> i64
      %1831 = func.call @cc_nil_value() : () -> i64
      %1832 = func.call @cc_cons(%1830, %1831) : (i64, i64) -> i64
      %1833 = func.call @cc_values_pack(%1832) : (i64) -> i64
      func.call @stack_push_pointer(%1830) : (i64) -> ()
      %1834 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1835 = arith.constant 13 : i64
      %1836 = func.call @cc_make_string(%1834, %1835) : (!llvm.ptr, i64) -> i64
      %1837 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1838 = arith.constant 11 : i64
      %1839 = func.call @cc_make_string(%1837, %1838) : (!llvm.ptr, i64) -> i64
      %1840 = func.call @cc_intern(%1836, %1839) : (i64, i64) -> i64
      %1841 = func.call @cc_nil_value() : () -> i64
      %1842 = func.call @cc_cons(%1840, %1841) : (i64, i64) -> i64
      %1843 = func.call @cc_values_pack(%1842) : (i64) -> i64
      func.call @stack_push_pointer(%1840) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1844 = func.call @stack_pop_pointer() : () -> i64
      %1845 = func.call @stack_pop_pointer() : () -> i64
      %1846 = func.call @cc_cons(%1845, %1844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1846) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1847 = func.call @stack_pop_pointer() : () -> i64
      %1848 = func.call @stack_pop_pointer() : () -> i64
      %1849 = func.call @cc_cons(%1848, %1847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1849) : (i64) -> ()
      %1850 = func.call @stack_pop_pointer() : () -> i64
      %1851 = func.call @stack_pop_pointer() : () -> i64
      %1852 = func.call @cc_cons(%1851, %1850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1852) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1853 = func.call @stack_pop_pointer() : () -> i64
      %1854 = func.call @stack_pop_pointer() : () -> i64
      %1855 = func.call @cc_cons(%1854, %1853) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1855) : (i64) -> ()
      %1856 = func.call @stack_pop_pointer() : () -> i64
      %1857 = func.call @stack_pop_pointer() : () -> i64
      %1858 = func.call @cc_cons(%1857, %1856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1858) : (i64) -> ()
      %1859 = func.call @stack_pop_pointer() : () -> i64
      %1860 = func.call @stack_pop_pointer() : () -> i64
      %1861 = func.call @cc_cons(%1860, %1859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1861) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1862 = func.call @stack_pop_pointer() : () -> i64
      %1863 = func.call @stack_pop_pointer() : () -> i64
      %1864 = func.call @cc_cons(%1863, %1862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1864) : (i64) -> ()
      %1865 = func.call @stack_pop_pointer() : () -> i64
      %1866 = func.call @stack_pop_pointer() : () -> i64
      %1867 = func.call @cc_cons(%1866, %1865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1867) : (i64) -> ()
      %1868 = func.call @stack_pop_pointer() : () -> i64
      %1917 = arith.constant 209815645192201 : i64
      %1918 = arith.constant 0 : i64
      %1919 = func.call @cc_make_closure(%1917, %1918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1919) : (i64) -> ()
      %1920 = func.call @stack_pop_pointer() : () -> i64
      %1921 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1922 = arith.constant 4 : i64
      %1923 = func.call @cc_make_string(%1921, %1922) : (!llvm.ptr, i64) -> i64
      %1924 = func.call @cc_nil_value() : () -> i64
      %1925 = func.call @cc_intern(%1923, %1924) : (i64, i64) -> i64
      %1926 = func.call @cc_nil_value() : () -> i64
      %1927 = func.call @cc_cons(%1925, %1926) : (i64, i64) -> i64
      %1928 = func.call @cc_values_pack(%1927) : (i64) -> i64
      func.call @stack_push_pointer(%1925) : (i64) -> ()
      %1929 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1930 = arith.constant 13 : i64
      %1931 = func.call @cc_make_string(%1929, %1930) : (!llvm.ptr, i64) -> i64
      %1932 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1933 = arith.constant 11 : i64
      %1934 = func.call @cc_make_string(%1932, %1933) : (!llvm.ptr, i64) -> i64
      %1935 = func.call @cc_intern(%1931, %1934) : (i64, i64) -> i64
      %1936 = func.call @cc_nil_value() : () -> i64
      %1937 = func.call @cc_cons(%1935, %1936) : (i64, i64) -> i64
      %1938 = func.call @cc_values_pack(%1937) : (i64) -> i64
      func.call @stack_push_pointer(%1935) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @stack_pop_pointer() : () -> i64
      %1941 = func.call @cc_cons(%1940, %1939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1941) : (i64) -> ()
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1943, %1942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1944) : (i64) -> ()
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1947 = arith.constant 11 : i64
      %1948 = func.call @cc_make_string(%1946, %1947) : (!llvm.ptr, i64) -> i64
      %1949 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1950 = arith.constant 7 : i64
      %1951 = func.call @cc_make_string(%1949, %1950) : (!llvm.ptr, i64) -> i64
      %1952 = func.call @cc_intern(%1948, %1951) : (i64, i64) -> i64
      %1953 = func.call @cc_nil_value() : () -> i64
      %1954 = func.call @cc_cons(%1952, %1953) : (i64, i64) -> i64
      %1955 = func.call @cc_values_pack(%1954) : (i64) -> i64
      func.call @stack_push_pointer(%1952) : (i64) -> ()
      %1956 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1959 = arith.constant 4 : i64
      %1960 = func.call @cc_make_string(%1958, %1959) : (!llvm.ptr, i64) -> i64
      %1961 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1962 = arith.constant 7 : i64
      %1963 = func.call @cc_make_string(%1961, %1962) : (!llvm.ptr, i64) -> i64
      %1964 = func.call @cc_intern(%1960, %1963) : (i64, i64) -> i64
      %1965 = func.call @cc_nil_value() : () -> i64
      %1966 = func.call @cc_cons(%1964, %1965) : (i64, i64) -> i64
      %1967 = func.call @cc_values_pack(%1966) : (i64) -> i64
      func.call @stack_push_pointer(%1964) : (i64) -> ()
      %1968 = func.call @stack_pop_pointer() : () -> i64
      %1969 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1970 = arith.constant 5 : i64
      %1971 = func.call @cc_make_string(%1969, %1970) : (!llvm.ptr, i64) -> i64
      %1972 = func.call @cc_nil_value() : () -> i64
      %1973 = func.call @cc_intern(%1971, %1972) : (i64, i64) -> i64
      %1974 = func.call @cc_nil_value() : () -> i64
      %1975 = func.call @cc_cons(%1973, %1974) : (i64, i64) -> i64
      %1976 = func.call @cc_values_pack(%1975) : (i64) -> i64
      func.call @stack_push_pointer(%1973) : (i64) -> ()
      %1977 = func.call @stack_pop_pointer() : () -> i64
      %1978 = func.call @cc_nil_value() : () -> i64
      %1979 = func.call @cc_errorp(%1807) : (i64) -> i64
      %1980 = arith.cmpi ne, %1979, %1978 : i64
      %1981 = arith.cmpi eq, %1978, %1978 : i64
      %1982 = arith.andi %1980, %1981 : i1
      %1983 = scf.if %1982 -> (i64) {
        scf.yield %1807 : i64
      } else {
        scf.yield %1978 : i64
      }
      %1984 = func.call @cc_errorp(%1868) : (i64) -> i64
      %1985 = arith.cmpi ne, %1984, %1978 : i64
      %1986 = arith.cmpi eq, %1983, %1978 : i64
      %1987 = arith.andi %1985, %1986 : i1
      %1988 = scf.if %1987 -> (i64) {
        scf.yield %1868 : i64
      } else {
        scf.yield %1983 : i64
      }
      %1989 = func.call @cc_errorp(%1920) : (i64) -> i64
      %1990 = arith.cmpi ne, %1989, %1978 : i64
      %1991 = arith.cmpi eq, %1988, %1978 : i64
      %1992 = arith.andi %1990, %1991 : i1
      %1993 = scf.if %1992 -> (i64) {
        scf.yield %1920 : i64
      } else {
        scf.yield %1988 : i64
      }
      %1994 = func.call @cc_errorp(%1945) : (i64) -> i64
      %1995 = arith.cmpi ne, %1994, %1978 : i64
      %1996 = arith.cmpi eq, %1993, %1978 : i64
      %1997 = arith.andi %1995, %1996 : i1
      %1998 = scf.if %1997 -> (i64) {
        scf.yield %1945 : i64
      } else {
        scf.yield %1993 : i64
      }
      %1999 = func.call @cc_errorp(%1956) : (i64) -> i64
      %2000 = arith.cmpi ne, %1999, %1978 : i64
      %2001 = arith.cmpi eq, %1998, %1978 : i64
      %2002 = arith.andi %2000, %2001 : i1
      %2003 = scf.if %2002 -> (i64) {
        scf.yield %1956 : i64
      } else {
        scf.yield %1998 : i64
      }
      %2004 = func.call @cc_errorp(%1957) : (i64) -> i64
      %2005 = arith.cmpi ne, %2004, %1978 : i64
      %2006 = arith.cmpi eq, %2003, %1978 : i64
      %2007 = arith.andi %2005, %2006 : i1
      %2008 = scf.if %2007 -> (i64) {
        scf.yield %1957 : i64
      } else {
        scf.yield %2003 : i64
      }
      %2009 = func.call @cc_errorp(%1968) : (i64) -> i64
      %2010 = arith.cmpi ne, %2009, %1978 : i64
      %2011 = arith.cmpi eq, %2008, %1978 : i64
      %2012 = arith.andi %2010, %2011 : i1
      %2013 = scf.if %2012 -> (i64) {
        scf.yield %1968 : i64
      } else {
        scf.yield %2008 : i64
      }
      %2014 = func.call @cc_errorp(%1977) : (i64) -> i64
      %2015 = arith.cmpi ne, %2014, %1978 : i64
      %2016 = arith.cmpi eq, %2013, %1978 : i64
      %2017 = arith.andi %2015, %2016 : i1
      %2018 = scf.if %2017 -> (i64) {
        scf.yield %1977 : i64
      } else {
        scf.yield %2013 : i64
      }
      %2019 = arith.cmpi ne, %2018, %1978 : i64
      scf.if %2019 {
        func.call @stack_push_pointer(%2018) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1807) : (i64) -> ()
        func.call @stack_push_pointer(%1868) : (i64) -> ()
        func.call @stack_push_pointer(%1920) : (i64) -> ()
        func.call @stack_push_pointer(%1945) : (i64) -> ()
        func.call @stack_push_pointer(%1956) : (i64) -> ()
        func.call @stack_push_pointer(%1957) : (i64) -> ()
        func.call @stack_push_pointer(%1968) : (i64) -> ()
        func.call @stack_push_pointer(%1977) : (i64) -> ()
        %2020 = llvm.mlir.addressof @str150 : !llvm.ptr
        %2021 = func.call @cc_make_function_ref_const(%2020) : (!llvm.ptr) -> i64
        %2022 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2021, %2022) : (i64, i64) -> ()
      }
      %2023 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2023 : i64
    }
    %2024 = func.call @cc_nil_value() : () -> i64
    %2025 = func.call @cc_errorp(%1798) : (i64) -> i64
    %2026 = arith.cmpi ne, %2025, %2024 : i64
    %2027 = scf.if %2026 -> (i64) {
      scf.yield %1798 : i64
    } else {
      %2028 = llvm.mlir.addressof @str151 : !llvm.ptr
      %2029 = arith.constant 11 : i64
      %2030 = func.call @cc_make_string(%2028, %2029) : (!llvm.ptr, i64) -> i64
      %2031 = func.call @cc_nil_value() : () -> i64
      %2032 = func.call @cc_intern(%2030, %2031) : (i64, i64) -> i64
      %2033 = func.call @cc_nil_value() : () -> i64
      %2034 = func.call @cc_cons(%2032, %2033) : (i64, i64) -> i64
      %2035 = func.call @cc_values_pack(%2034) : (i64) -> i64
      func.call @stack_push_pointer(%2032) : (i64) -> ()
      %2036 = func.call @stack_pop_pointer() : () -> i64
      %2037 = llvm.mlir.addressof @str152 : !llvm.ptr
      %2038 = arith.constant 13 : i64
      %2039 = func.call @cc_make_string(%2037, %2038) : (!llvm.ptr, i64) -> i64
      %2040 = llvm.mlir.addressof @str153 : !llvm.ptr
      %2041 = arith.constant 11 : i64
      %2042 = func.call @cc_make_string(%2040, %2041) : (!llvm.ptr, i64) -> i64
      %2043 = func.call @cc_intern(%2039, %2042) : (i64, i64) -> i64
      %2044 = func.call @cc_nil_value() : () -> i64
      %2045 = func.call @cc_cons(%2043, %2044) : (i64, i64) -> i64
      %2046 = func.call @cc_values_pack(%2045) : (i64) -> i64
      func.call @stack_push_pointer(%2043) : (i64) -> ()
      %2047 = llvm.mlir.addressof @str154 : !llvm.ptr
      %2048 = arith.constant 6 : i64
      %2049 = func.call @cc_make_string(%2047, %2048) : (!llvm.ptr, i64) -> i64
      %2050 = func.call @cc_nil_value() : () -> i64
      %2051 = func.call @cc_intern(%2049, %2050) : (i64, i64) -> i64
      %2052 = func.call @cc_nil_value() : () -> i64
      %2053 = func.call @cc_cons(%2051, %2052) : (i64, i64) -> i64
      %2054 = func.call @cc_values_pack(%2053) : (i64) -> i64
      func.call @stack_push_pointer(%2051) : (i64) -> ()
      %2055 = llvm.mlir.addressof @str155 : !llvm.ptr
      %2056 = arith.constant 19 : i64
      %2057 = func.call @cc_make_string(%2055, %2056) : (!llvm.ptr, i64) -> i64
      %2058 = func.call @cc_nil_value() : () -> i64
      %2059 = func.call @cc_intern(%2057, %2058) : (i64, i64) -> i64
      %2060 = func.call @cc_nil_value() : () -> i64
      %2061 = func.call @cc_cons(%2059, %2060) : (i64, i64) -> i64
      %2062 = func.call @cc_values_pack(%2061) : (i64) -> i64
      func.call @stack_push_pointer(%2059) : (i64) -> ()
      %2063 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2064 = arith.constant 10 : i64
      %2065 = func.call @cc_make_string(%2063, %2064) : (!llvm.ptr, i64) -> i64
      %2066 = llvm.mlir.addressof @str157 : !llvm.ptr
      %2067 = arith.constant 11 : i64
      %2068 = func.call @cc_make_string(%2066, %2067) : (!llvm.ptr, i64) -> i64
      %2069 = func.call @cc_intern(%2065, %2068) : (i64, i64) -> i64
      %2070 = func.call @cc_nil_value() : () -> i64
      %2071 = func.call @cc_cons(%2069, %2070) : (i64, i64) -> i64
      %2072 = func.call @cc_values_pack(%2071) : (i64) -> i64
      func.call @stack_push_pointer(%2069) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2073 = func.call @stack_pop_pointer() : () -> i64
      %2074 = func.call @stack_pop_pointer() : () -> i64
      %2075 = func.call @cc_cons(%2074, %2073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2076 = func.call @stack_pop_pointer() : () -> i64
      %2077 = func.call @stack_pop_pointer() : () -> i64
      %2078 = func.call @cc_cons(%2077, %2076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2078) : (i64) -> ()
      %2079 = func.call @stack_pop_pointer() : () -> i64
      %2080 = func.call @stack_pop_pointer() : () -> i64
      %2081 = func.call @cc_cons(%2080, %2079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2081) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2082 = func.call @stack_pop_pointer() : () -> i64
      %2083 = func.call @stack_pop_pointer() : () -> i64
      %2084 = func.call @cc_cons(%2083, %2082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2084) : (i64) -> ()
      %2085 = func.call @stack_pop_pointer() : () -> i64
      %2086 = func.call @stack_pop_pointer() : () -> i64
      %2087 = func.call @cc_cons(%2086, %2085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2087) : (i64) -> ()
      %2088 = func.call @stack_pop_pointer() : () -> i64
      %2089 = func.call @stack_pop_pointer() : () -> i64
      %2090 = func.call @cc_cons(%2089, %2088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2090) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2091 = func.call @stack_pop_pointer() : () -> i64
      %2092 = func.call @stack_pop_pointer() : () -> i64
      %2093 = func.call @cc_cons(%2092, %2091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2093) : (i64) -> ()
      %2094 = func.call @stack_pop_pointer() : () -> i64
      %2095 = func.call @stack_pop_pointer() : () -> i64
      %2096 = func.call @cc_cons(%2095, %2094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2096) : (i64) -> ()
      %2097 = func.call @stack_pop_pointer() : () -> i64
      %2146 = arith.constant 209815645192202 : i64
      %2147 = arith.constant 0 : i64
      %2148 = func.call @cc_make_closure(%2146, %2147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2148) : (i64) -> ()
      %2149 = func.call @stack_pop_pointer() : () -> i64
      %2150 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2151 = arith.constant 4 : i64
      %2152 = func.call @cc_make_string(%2150, %2151) : (!llvm.ptr, i64) -> i64
      %2153 = func.call @cc_nil_value() : () -> i64
      %2154 = func.call @cc_intern(%2152, %2153) : (i64, i64) -> i64
      %2155 = func.call @cc_nil_value() : () -> i64
      %2156 = func.call @cc_cons(%2154, %2155) : (i64, i64) -> i64
      %2157 = func.call @cc_values_pack(%2156) : (i64) -> i64
      func.call @stack_push_pointer(%2154) : (i64) -> ()
      %2158 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2159 = arith.constant 13 : i64
      %2160 = func.call @cc_make_string(%2158, %2159) : (!llvm.ptr, i64) -> i64
      %2161 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2162 = arith.constant 11 : i64
      %2163 = func.call @cc_make_string(%2161, %2162) : (!llvm.ptr, i64) -> i64
      %2164 = func.call @cc_intern(%2160, %2163) : (i64, i64) -> i64
      %2165 = func.call @cc_nil_value() : () -> i64
      %2166 = func.call @cc_cons(%2164, %2165) : (i64, i64) -> i64
      %2167 = func.call @cc_values_pack(%2166) : (i64) -> i64
      func.call @stack_push_pointer(%2164) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2168 = func.call @stack_pop_pointer() : () -> i64
      %2169 = func.call @stack_pop_pointer() : () -> i64
      %2170 = func.call @cc_cons(%2169, %2168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2170) : (i64) -> ()
      %2171 = func.call @stack_pop_pointer() : () -> i64
      %2172 = func.call @stack_pop_pointer() : () -> i64
      %2173 = func.call @cc_cons(%2172, %2171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2173) : (i64) -> ()
      %2174 = func.call @stack_pop_pointer() : () -> i64
      %2175 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2176 = arith.constant 11 : i64
      %2177 = func.call @cc_make_string(%2175, %2176) : (!llvm.ptr, i64) -> i64
      %2178 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2179 = arith.constant 7 : i64
      %2180 = func.call @cc_make_string(%2178, %2179) : (!llvm.ptr, i64) -> i64
      %2181 = func.call @cc_intern(%2177, %2180) : (i64, i64) -> i64
      %2182 = func.call @cc_nil_value() : () -> i64
      %2183 = func.call @cc_cons(%2181, %2182) : (i64, i64) -> i64
      %2184 = func.call @cc_values_pack(%2183) : (i64) -> i64
      func.call @stack_push_pointer(%2181) : (i64) -> ()
      %2185 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2186 = func.call @stack_pop_pointer() : () -> i64
      %2187 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2188 = arith.constant 4 : i64
      %2189 = func.call @cc_make_string(%2187, %2188) : (!llvm.ptr, i64) -> i64
      %2190 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2191 = arith.constant 7 : i64
      %2192 = func.call @cc_make_string(%2190, %2191) : (!llvm.ptr, i64) -> i64
      %2193 = func.call @cc_intern(%2189, %2192) : (i64, i64) -> i64
      %2194 = func.call @cc_nil_value() : () -> i64
      %2195 = func.call @cc_cons(%2193, %2194) : (i64, i64) -> i64
      %2196 = func.call @cc_values_pack(%2195) : (i64) -> i64
      func.call @stack_push_pointer(%2193) : (i64) -> ()
      %2197 = func.call @stack_pop_pointer() : () -> i64
      %2198 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2199 = arith.constant 5 : i64
      %2200 = func.call @cc_make_string(%2198, %2199) : (!llvm.ptr, i64) -> i64
      %2201 = func.call @cc_nil_value() : () -> i64
      %2202 = func.call @cc_intern(%2200, %2201) : (i64, i64) -> i64
      %2203 = func.call @cc_nil_value() : () -> i64
      %2204 = func.call @cc_cons(%2202, %2203) : (i64, i64) -> i64
      %2205 = func.call @cc_values_pack(%2204) : (i64) -> i64
      func.call @stack_push_pointer(%2202) : (i64) -> ()
      %2206 = func.call @stack_pop_pointer() : () -> i64
      %2207 = func.call @cc_nil_value() : () -> i64
      %2208 = func.call @cc_errorp(%2036) : (i64) -> i64
      %2209 = arith.cmpi ne, %2208, %2207 : i64
      %2210 = arith.cmpi eq, %2207, %2207 : i64
      %2211 = arith.andi %2209, %2210 : i1
      %2212 = scf.if %2211 -> (i64) {
        scf.yield %2036 : i64
      } else {
        scf.yield %2207 : i64
      }
      %2213 = func.call @cc_errorp(%2097) : (i64) -> i64
      %2214 = arith.cmpi ne, %2213, %2207 : i64
      %2215 = arith.cmpi eq, %2212, %2207 : i64
      %2216 = arith.andi %2214, %2215 : i1
      %2217 = scf.if %2216 -> (i64) {
        scf.yield %2097 : i64
      } else {
        scf.yield %2212 : i64
      }
      %2218 = func.call @cc_errorp(%2149) : (i64) -> i64
      %2219 = arith.cmpi ne, %2218, %2207 : i64
      %2220 = arith.cmpi eq, %2217, %2207 : i64
      %2221 = arith.andi %2219, %2220 : i1
      %2222 = scf.if %2221 -> (i64) {
        scf.yield %2149 : i64
      } else {
        scf.yield %2217 : i64
      }
      %2223 = func.call @cc_errorp(%2174) : (i64) -> i64
      %2224 = arith.cmpi ne, %2223, %2207 : i64
      %2225 = arith.cmpi eq, %2222, %2207 : i64
      %2226 = arith.andi %2224, %2225 : i1
      %2227 = scf.if %2226 -> (i64) {
        scf.yield %2174 : i64
      } else {
        scf.yield %2222 : i64
      }
      %2228 = func.call @cc_errorp(%2185) : (i64) -> i64
      %2229 = arith.cmpi ne, %2228, %2207 : i64
      %2230 = arith.cmpi eq, %2227, %2207 : i64
      %2231 = arith.andi %2229, %2230 : i1
      %2232 = scf.if %2231 -> (i64) {
        scf.yield %2185 : i64
      } else {
        scf.yield %2227 : i64
      }
      %2233 = func.call @cc_errorp(%2186) : (i64) -> i64
      %2234 = arith.cmpi ne, %2233, %2207 : i64
      %2235 = arith.cmpi eq, %2232, %2207 : i64
      %2236 = arith.andi %2234, %2235 : i1
      %2237 = scf.if %2236 -> (i64) {
        scf.yield %2186 : i64
      } else {
        scf.yield %2232 : i64
      }
      %2238 = func.call @cc_errorp(%2197) : (i64) -> i64
      %2239 = arith.cmpi ne, %2238, %2207 : i64
      %2240 = arith.cmpi eq, %2237, %2207 : i64
      %2241 = arith.andi %2239, %2240 : i1
      %2242 = scf.if %2241 -> (i64) {
        scf.yield %2197 : i64
      } else {
        scf.yield %2237 : i64
      }
      %2243 = func.call @cc_errorp(%2206) : (i64) -> i64
      %2244 = arith.cmpi ne, %2243, %2207 : i64
      %2245 = arith.cmpi eq, %2242, %2207 : i64
      %2246 = arith.andi %2244, %2245 : i1
      %2247 = scf.if %2246 -> (i64) {
        scf.yield %2206 : i64
      } else {
        scf.yield %2242 : i64
      }
      %2248 = arith.cmpi ne, %2247, %2207 : i64
      scf.if %2248 {
        func.call @stack_push_pointer(%2247) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2036) : (i64) -> ()
        func.call @stack_push_pointer(%2097) : (i64) -> ()
        func.call @stack_push_pointer(%2149) : (i64) -> ()
        func.call @stack_push_pointer(%2174) : (i64) -> ()
        func.call @stack_push_pointer(%2185) : (i64) -> ()
        func.call @stack_push_pointer(%2186) : (i64) -> ()
        func.call @stack_push_pointer(%2197) : (i64) -> ()
        func.call @stack_push_pointer(%2206) : (i64) -> ()
        %2249 = llvm.mlir.addressof @str167 : !llvm.ptr
        %2250 = func.call @cc_make_function_ref_const(%2249) : (!llvm.ptr) -> i64
        %2251 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2250, %2251) : (i64, i64) -> ()
      }
      %2252 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2252 : i64
    }
    %2253 = func.call @cc_nil_value() : () -> i64
    %2254 = func.call @cc_errorp(%2027) : (i64) -> i64
    %2255 = arith.cmpi ne, %2254, %2253 : i64
    %2256 = scf.if %2255 -> (i64) {
      scf.yield %2027 : i64
    } else {
      %2257 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2258 = arith.constant 11 : i64
      %2259 = func.call @cc_make_string(%2257, %2258) : (!llvm.ptr, i64) -> i64
      %2260 = func.call @cc_nil_value() : () -> i64
      %2261 = func.call @cc_intern(%2259, %2260) : (i64, i64) -> i64
      %2262 = func.call @cc_nil_value() : () -> i64
      %2263 = func.call @cc_cons(%2261, %2262) : (i64, i64) -> i64
      %2264 = func.call @cc_values_pack(%2263) : (i64) -> i64
      func.call @stack_push_pointer(%2261) : (i64) -> ()
      %2265 = func.call @stack_pop_pointer() : () -> i64
      %2266 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2267 = arith.constant 13 : i64
      %2268 = func.call @cc_make_string(%2266, %2267) : (!llvm.ptr, i64) -> i64
      %2269 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2270 = arith.constant 11 : i64
      %2271 = func.call @cc_make_string(%2269, %2270) : (!llvm.ptr, i64) -> i64
      %2272 = func.call @cc_intern(%2268, %2271) : (i64, i64) -> i64
      %2273 = func.call @cc_nil_value() : () -> i64
      %2274 = func.call @cc_cons(%2272, %2273) : (i64, i64) -> i64
      %2275 = func.call @cc_values_pack(%2274) : (i64) -> i64
      func.call @stack_push_pointer(%2272) : (i64) -> ()
      %2276 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2277 = arith.constant 6 : i64
      %2278 = func.call @cc_make_string(%2276, %2277) : (!llvm.ptr, i64) -> i64
      %2279 = func.call @cc_nil_value() : () -> i64
      %2280 = func.call @cc_intern(%2278, %2279) : (i64, i64) -> i64
      %2281 = func.call @cc_nil_value() : () -> i64
      %2282 = func.call @cc_cons(%2280, %2281) : (i64, i64) -> i64
      %2283 = func.call @cc_values_pack(%2282) : (i64) -> i64
      func.call @stack_push_pointer(%2280) : (i64) -> ()
      %2284 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2285 = arith.constant 19 : i64
      %2286 = func.call @cc_make_string(%2284, %2285) : (!llvm.ptr, i64) -> i64
      %2287 = func.call @cc_nil_value() : () -> i64
      %2288 = func.call @cc_intern(%2286, %2287) : (i64, i64) -> i64
      %2289 = func.call @cc_nil_value() : () -> i64
      %2290 = func.call @cc_cons(%2288, %2289) : (i64, i64) -> i64
      %2291 = func.call @cc_values_pack(%2290) : (i64) -> i64
      func.call @stack_push_pointer(%2288) : (i64) -> ()
      %2292 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2293 = arith.constant 14 : i64
      %2294 = func.call @cc_make_string(%2292, %2293) : (!llvm.ptr, i64) -> i64
      %2295 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2296 = arith.constant 11 : i64
      %2297 = func.call @cc_make_string(%2295, %2296) : (!llvm.ptr, i64) -> i64
      %2298 = func.call @cc_intern(%2294, %2297) : (i64, i64) -> i64
      %2299 = func.call @cc_nil_value() : () -> i64
      %2300 = func.call @cc_cons(%2298, %2299) : (i64, i64) -> i64
      %2301 = func.call @cc_values_pack(%2300) : (i64) -> i64
      func.call @stack_push_pointer(%2298) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2302 = func.call @stack_pop_pointer() : () -> i64
      %2303 = func.call @stack_pop_pointer() : () -> i64
      %2304 = func.call @cc_cons(%2303, %2302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2304) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2305 = func.call @stack_pop_pointer() : () -> i64
      %2306 = func.call @stack_pop_pointer() : () -> i64
      %2307 = func.call @cc_cons(%2306, %2305) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2307) : (i64) -> ()
      %2308 = func.call @stack_pop_pointer() : () -> i64
      %2309 = func.call @stack_pop_pointer() : () -> i64
      %2310 = func.call @cc_cons(%2309, %2308) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2310) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2311 = func.call @stack_pop_pointer() : () -> i64
      %2312 = func.call @stack_pop_pointer() : () -> i64
      %2313 = func.call @cc_cons(%2312, %2311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2313) : (i64) -> ()
      %2314 = func.call @stack_pop_pointer() : () -> i64
      %2315 = func.call @stack_pop_pointer() : () -> i64
      %2316 = func.call @cc_cons(%2315, %2314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2316) : (i64) -> ()
      %2317 = func.call @stack_pop_pointer() : () -> i64
      %2318 = func.call @stack_pop_pointer() : () -> i64
      %2319 = func.call @cc_cons(%2318, %2317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2319) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2320 = func.call @stack_pop_pointer() : () -> i64
      %2321 = func.call @stack_pop_pointer() : () -> i64
      %2322 = func.call @cc_cons(%2321, %2320) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2322) : (i64) -> ()
      %2323 = func.call @stack_pop_pointer() : () -> i64
      %2324 = func.call @stack_pop_pointer() : () -> i64
      %2325 = func.call @cc_cons(%2324, %2323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2325) : (i64) -> ()
      %2326 = func.call @stack_pop_pointer() : () -> i64
      %2375 = arith.constant 209815645192203 : i64
      %2376 = arith.constant 0 : i64
      %2377 = func.call @cc_make_closure(%2375, %2376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2377) : (i64) -> ()
      %2378 = func.call @stack_pop_pointer() : () -> i64
      %2379 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2380 = arith.constant 4 : i64
      %2381 = func.call @cc_make_string(%2379, %2380) : (!llvm.ptr, i64) -> i64
      %2382 = func.call @cc_nil_value() : () -> i64
      %2383 = func.call @cc_intern(%2381, %2382) : (i64, i64) -> i64
      %2384 = func.call @cc_nil_value() : () -> i64
      %2385 = func.call @cc_cons(%2383, %2384) : (i64, i64) -> i64
      %2386 = func.call @cc_values_pack(%2385) : (i64) -> i64
      func.call @stack_push_pointer(%2383) : (i64) -> ()
      %2387 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2388 = arith.constant 13 : i64
      %2389 = func.call @cc_make_string(%2387, %2388) : (!llvm.ptr, i64) -> i64
      %2390 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2391 = arith.constant 11 : i64
      %2392 = func.call @cc_make_string(%2390, %2391) : (!llvm.ptr, i64) -> i64
      %2393 = func.call @cc_intern(%2389, %2392) : (i64, i64) -> i64
      %2394 = func.call @cc_nil_value() : () -> i64
      %2395 = func.call @cc_cons(%2393, %2394) : (i64, i64) -> i64
      %2396 = func.call @cc_values_pack(%2395) : (i64) -> i64
      func.call @stack_push_pointer(%2393) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2397 = func.call @stack_pop_pointer() : () -> i64
      %2398 = func.call @stack_pop_pointer() : () -> i64
      %2399 = func.call @cc_cons(%2398, %2397) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2399) : (i64) -> ()
      %2400 = func.call @stack_pop_pointer() : () -> i64
      %2401 = func.call @stack_pop_pointer() : () -> i64
      %2402 = func.call @cc_cons(%2401, %2400) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2402) : (i64) -> ()
      %2403 = func.call @stack_pop_pointer() : () -> i64
      %2404 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2405 = arith.constant 11 : i64
      %2406 = func.call @cc_make_string(%2404, %2405) : (!llvm.ptr, i64) -> i64
      %2407 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2408 = arith.constant 7 : i64
      %2409 = func.call @cc_make_string(%2407, %2408) : (!llvm.ptr, i64) -> i64
      %2410 = func.call @cc_intern(%2406, %2409) : (i64, i64) -> i64
      %2411 = func.call @cc_nil_value() : () -> i64
      %2412 = func.call @cc_cons(%2410, %2411) : (i64, i64) -> i64
      %2413 = func.call @cc_values_pack(%2412) : (i64) -> i64
      func.call @stack_push_pointer(%2410) : (i64) -> ()
      %2414 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2415 = func.call @stack_pop_pointer() : () -> i64
      %2416 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2417 = arith.constant 4 : i64
      %2418 = func.call @cc_make_string(%2416, %2417) : (!llvm.ptr, i64) -> i64
      %2419 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2420 = arith.constant 7 : i64
      %2421 = func.call @cc_make_string(%2419, %2420) : (!llvm.ptr, i64) -> i64
      %2422 = func.call @cc_intern(%2418, %2421) : (i64, i64) -> i64
      %2423 = func.call @cc_nil_value() : () -> i64
      %2424 = func.call @cc_cons(%2422, %2423) : (i64, i64) -> i64
      %2425 = func.call @cc_values_pack(%2424) : (i64) -> i64
      func.call @stack_push_pointer(%2422) : (i64) -> ()
      %2426 = func.call @stack_pop_pointer() : () -> i64
      %2427 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2428 = arith.constant 5 : i64
      %2429 = func.call @cc_make_string(%2427, %2428) : (!llvm.ptr, i64) -> i64
      %2430 = func.call @cc_nil_value() : () -> i64
      %2431 = func.call @cc_intern(%2429, %2430) : (i64, i64) -> i64
      %2432 = func.call @cc_nil_value() : () -> i64
      %2433 = func.call @cc_cons(%2431, %2432) : (i64, i64) -> i64
      %2434 = func.call @cc_values_pack(%2433) : (i64) -> i64
      func.call @stack_push_pointer(%2431) : (i64) -> ()
      %2435 = func.call @stack_pop_pointer() : () -> i64
      %2436 = func.call @cc_nil_value() : () -> i64
      %2437 = func.call @cc_errorp(%2265) : (i64) -> i64
      %2438 = arith.cmpi ne, %2437, %2436 : i64
      %2439 = arith.cmpi eq, %2436, %2436 : i64
      %2440 = arith.andi %2438, %2439 : i1
      %2441 = scf.if %2440 -> (i64) {
        scf.yield %2265 : i64
      } else {
        scf.yield %2436 : i64
      }
      %2442 = func.call @cc_errorp(%2326) : (i64) -> i64
      %2443 = arith.cmpi ne, %2442, %2436 : i64
      %2444 = arith.cmpi eq, %2441, %2436 : i64
      %2445 = arith.andi %2443, %2444 : i1
      %2446 = scf.if %2445 -> (i64) {
        scf.yield %2326 : i64
      } else {
        scf.yield %2441 : i64
      }
      %2447 = func.call @cc_errorp(%2378) : (i64) -> i64
      %2448 = arith.cmpi ne, %2447, %2436 : i64
      %2449 = arith.cmpi eq, %2446, %2436 : i64
      %2450 = arith.andi %2448, %2449 : i1
      %2451 = scf.if %2450 -> (i64) {
        scf.yield %2378 : i64
      } else {
        scf.yield %2446 : i64
      }
      %2452 = func.call @cc_errorp(%2403) : (i64) -> i64
      %2453 = arith.cmpi ne, %2452, %2436 : i64
      %2454 = arith.cmpi eq, %2451, %2436 : i64
      %2455 = arith.andi %2453, %2454 : i1
      %2456 = scf.if %2455 -> (i64) {
        scf.yield %2403 : i64
      } else {
        scf.yield %2451 : i64
      }
      %2457 = func.call @cc_errorp(%2414) : (i64) -> i64
      %2458 = arith.cmpi ne, %2457, %2436 : i64
      %2459 = arith.cmpi eq, %2456, %2436 : i64
      %2460 = arith.andi %2458, %2459 : i1
      %2461 = scf.if %2460 -> (i64) {
        scf.yield %2414 : i64
      } else {
        scf.yield %2456 : i64
      }
      %2462 = func.call @cc_errorp(%2415) : (i64) -> i64
      %2463 = arith.cmpi ne, %2462, %2436 : i64
      %2464 = arith.cmpi eq, %2461, %2436 : i64
      %2465 = arith.andi %2463, %2464 : i1
      %2466 = scf.if %2465 -> (i64) {
        scf.yield %2415 : i64
      } else {
        scf.yield %2461 : i64
      }
      %2467 = func.call @cc_errorp(%2426) : (i64) -> i64
      %2468 = arith.cmpi ne, %2467, %2436 : i64
      %2469 = arith.cmpi eq, %2466, %2436 : i64
      %2470 = arith.andi %2468, %2469 : i1
      %2471 = scf.if %2470 -> (i64) {
        scf.yield %2426 : i64
      } else {
        scf.yield %2466 : i64
      }
      %2472 = func.call @cc_errorp(%2435) : (i64) -> i64
      %2473 = arith.cmpi ne, %2472, %2436 : i64
      %2474 = arith.cmpi eq, %2471, %2436 : i64
      %2475 = arith.andi %2473, %2474 : i1
      %2476 = scf.if %2475 -> (i64) {
        scf.yield %2435 : i64
      } else {
        scf.yield %2471 : i64
      }
      %2477 = arith.cmpi ne, %2476, %2436 : i64
      scf.if %2477 {
        func.call @stack_push_pointer(%2476) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2265) : (i64) -> ()
        func.call @stack_push_pointer(%2326) : (i64) -> ()
        func.call @stack_push_pointer(%2378) : (i64) -> ()
        func.call @stack_push_pointer(%2403) : (i64) -> ()
        func.call @stack_push_pointer(%2414) : (i64) -> ()
        func.call @stack_push_pointer(%2415) : (i64) -> ()
        func.call @stack_push_pointer(%2426) : (i64) -> ()
        func.call @stack_push_pointer(%2435) : (i64) -> ()
        %2478 = llvm.mlir.addressof @str184 : !llvm.ptr
        %2479 = func.call @cc_make_function_ref_const(%2478) : (!llvm.ptr) -> i64
        %2480 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2479, %2480) : (i64, i64) -> ()
      }
      %2481 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2481 : i64
    }
    %2482 = func.call @cc_nil_value() : () -> i64
    %2483 = func.call @cc_errorp(%2256) : (i64) -> i64
    %2484 = arith.cmpi ne, %2483, %2482 : i64
    %2485 = scf.if %2484 -> (i64) {
      scf.yield %2256 : i64
    } else {
      %2486 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2487 = arith.constant 12 : i64
      %2488 = func.call @cc_make_string(%2486, %2487) : (!llvm.ptr, i64) -> i64
      %2489 = func.call @cc_nil_value() : () -> i64
      %2490 = func.call @cc_intern(%2488, %2489) : (i64, i64) -> i64
      %2491 = func.call @cc_nil_value() : () -> i64
      %2492 = func.call @cc_cons(%2490, %2491) : (i64, i64) -> i64
      %2493 = func.call @cc_values_pack(%2492) : (i64) -> i64
      func.call @stack_push_pointer(%2490) : (i64) -> ()
      %2494 = func.call @stack_pop_pointer() : () -> i64
      %2495 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2496 = arith.constant 13 : i64
      %2497 = func.call @cc_make_string(%2495, %2496) : (!llvm.ptr, i64) -> i64
      %2498 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2499 = arith.constant 11 : i64
      %2500 = func.call @cc_make_string(%2498, %2499) : (!llvm.ptr, i64) -> i64
      %2501 = func.call @cc_intern(%2497, %2500) : (i64, i64) -> i64
      %2502 = func.call @cc_nil_value() : () -> i64
      %2503 = func.call @cc_cons(%2501, %2502) : (i64, i64) -> i64
      %2504 = func.call @cc_values_pack(%2503) : (i64) -> i64
      func.call @stack_push_pointer(%2501) : (i64) -> ()
      %2505 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2506 = arith.constant 6 : i64
      %2507 = func.call @cc_make_string(%2505, %2506) : (!llvm.ptr, i64) -> i64
      %2508 = func.call @cc_nil_value() : () -> i64
      %2509 = func.call @cc_intern(%2507, %2508) : (i64, i64) -> i64
      %2510 = func.call @cc_nil_value() : () -> i64
      %2511 = func.call @cc_cons(%2509, %2510) : (i64, i64) -> i64
      %2512 = func.call @cc_values_pack(%2511) : (i64) -> i64
      func.call @stack_push_pointer(%2509) : (i64) -> ()
      %2513 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2514 = arith.constant 19 : i64
      %2515 = func.call @cc_make_string(%2513, %2514) : (!llvm.ptr, i64) -> i64
      %2516 = func.call @cc_nil_value() : () -> i64
      %2517 = func.call @cc_intern(%2515, %2516) : (i64, i64) -> i64
      %2518 = func.call @cc_nil_value() : () -> i64
      %2519 = func.call @cc_cons(%2517, %2518) : (i64, i64) -> i64
      %2520 = func.call @cc_values_pack(%2519) : (i64) -> i64
      func.call @stack_push_pointer(%2517) : (i64) -> ()
      %2521 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2522 = arith.constant 17 : i64
      %2523 = func.call @cc_make_string(%2521, %2522) : (!llvm.ptr, i64) -> i64
      %2524 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2525 = arith.constant 11 : i64
      %2526 = func.call @cc_make_string(%2524, %2525) : (!llvm.ptr, i64) -> i64
      %2527 = func.call @cc_intern(%2523, %2526) : (i64, i64) -> i64
      %2528 = func.call @cc_nil_value() : () -> i64
      %2529 = func.call @cc_cons(%2527, %2528) : (i64, i64) -> i64
      %2530 = func.call @cc_values_pack(%2529) : (i64) -> i64
      func.call @stack_push_pointer(%2527) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2531 = func.call @stack_pop_pointer() : () -> i64
      %2532 = func.call @stack_pop_pointer() : () -> i64
      %2533 = func.call @cc_cons(%2532, %2531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2533) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2534 = func.call @stack_pop_pointer() : () -> i64
      %2535 = func.call @stack_pop_pointer() : () -> i64
      %2536 = func.call @cc_cons(%2535, %2534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2536) : (i64) -> ()
      %2537 = func.call @stack_pop_pointer() : () -> i64
      %2538 = func.call @stack_pop_pointer() : () -> i64
      %2539 = func.call @cc_cons(%2538, %2537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2539) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2540 = func.call @stack_pop_pointer() : () -> i64
      %2541 = func.call @stack_pop_pointer() : () -> i64
      %2542 = func.call @cc_cons(%2541, %2540) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2542) : (i64) -> ()
      %2543 = func.call @stack_pop_pointer() : () -> i64
      %2544 = func.call @stack_pop_pointer() : () -> i64
      %2545 = func.call @cc_cons(%2544, %2543) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2545) : (i64) -> ()
      %2546 = func.call @stack_pop_pointer() : () -> i64
      %2547 = func.call @stack_pop_pointer() : () -> i64
      %2548 = func.call @cc_cons(%2547, %2546) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2548) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2549 = func.call @stack_pop_pointer() : () -> i64
      %2550 = func.call @stack_pop_pointer() : () -> i64
      %2551 = func.call @cc_cons(%2550, %2549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2551) : (i64) -> ()
      %2552 = func.call @stack_pop_pointer() : () -> i64
      %2553 = func.call @stack_pop_pointer() : () -> i64
      %2554 = func.call @cc_cons(%2553, %2552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2554) : (i64) -> ()
      %2555 = func.call @stack_pop_pointer() : () -> i64
      %2604 = arith.constant 209815645192204 : i64
      %2605 = arith.constant 0 : i64
      %2606 = func.call @cc_make_closure(%2604, %2605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2606) : (i64) -> ()
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2609 = arith.constant 4 : i64
      %2610 = func.call @cc_make_string(%2608, %2609) : (!llvm.ptr, i64) -> i64
      %2611 = func.call @cc_nil_value() : () -> i64
      %2612 = func.call @cc_intern(%2610, %2611) : (i64, i64) -> i64
      %2613 = func.call @cc_nil_value() : () -> i64
      %2614 = func.call @cc_cons(%2612, %2613) : (i64, i64) -> i64
      %2615 = func.call @cc_values_pack(%2614) : (i64) -> i64
      func.call @stack_push_pointer(%2612) : (i64) -> ()
      %2616 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2617 = arith.constant 13 : i64
      %2618 = func.call @cc_make_string(%2616, %2617) : (!llvm.ptr, i64) -> i64
      %2619 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2620 = arith.constant 11 : i64
      %2621 = func.call @cc_make_string(%2619, %2620) : (!llvm.ptr, i64) -> i64
      %2622 = func.call @cc_intern(%2618, %2621) : (i64, i64) -> i64
      %2623 = func.call @cc_nil_value() : () -> i64
      %2624 = func.call @cc_cons(%2622, %2623) : (i64, i64) -> i64
      %2625 = func.call @cc_values_pack(%2624) : (i64) -> i64
      func.call @stack_push_pointer(%2622) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2626 = func.call @stack_pop_pointer() : () -> i64
      %2627 = func.call @stack_pop_pointer() : () -> i64
      %2628 = func.call @cc_cons(%2627, %2626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2628) : (i64) -> ()
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @stack_pop_pointer() : () -> i64
      %2631 = func.call @cc_cons(%2630, %2629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2631) : (i64) -> ()
      %2632 = func.call @stack_pop_pointer() : () -> i64
      %2633 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2634 = arith.constant 11 : i64
      %2635 = func.call @cc_make_string(%2633, %2634) : (!llvm.ptr, i64) -> i64
      %2636 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2637 = arith.constant 7 : i64
      %2638 = func.call @cc_make_string(%2636, %2637) : (!llvm.ptr, i64) -> i64
      %2639 = func.call @cc_intern(%2635, %2638) : (i64, i64) -> i64
      %2640 = func.call @cc_nil_value() : () -> i64
      %2641 = func.call @cc_cons(%2639, %2640) : (i64, i64) -> i64
      %2642 = func.call @cc_values_pack(%2641) : (i64) -> i64
      func.call @stack_push_pointer(%2639) : (i64) -> ()
      %2643 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2646 = arith.constant 4 : i64
      %2647 = func.call @cc_make_string(%2645, %2646) : (!llvm.ptr, i64) -> i64
      %2648 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2649 = arith.constant 7 : i64
      %2650 = func.call @cc_make_string(%2648, %2649) : (!llvm.ptr, i64) -> i64
      %2651 = func.call @cc_intern(%2647, %2650) : (i64, i64) -> i64
      %2652 = func.call @cc_nil_value() : () -> i64
      %2653 = func.call @cc_cons(%2651, %2652) : (i64, i64) -> i64
      %2654 = func.call @cc_values_pack(%2653) : (i64) -> i64
      func.call @stack_push_pointer(%2651) : (i64) -> ()
      %2655 = func.call @stack_pop_pointer() : () -> i64
      %2656 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2657 = arith.constant 5 : i64
      %2658 = func.call @cc_make_string(%2656, %2657) : (!llvm.ptr, i64) -> i64
      %2659 = func.call @cc_nil_value() : () -> i64
      %2660 = func.call @cc_intern(%2658, %2659) : (i64, i64) -> i64
      %2661 = func.call @cc_nil_value() : () -> i64
      %2662 = func.call @cc_cons(%2660, %2661) : (i64, i64) -> i64
      %2663 = func.call @cc_values_pack(%2662) : (i64) -> i64
      func.call @stack_push_pointer(%2660) : (i64) -> ()
      %2664 = func.call @stack_pop_pointer() : () -> i64
      %2665 = func.call @cc_nil_value() : () -> i64
      %2666 = func.call @cc_errorp(%2494) : (i64) -> i64
      %2667 = arith.cmpi ne, %2666, %2665 : i64
      %2668 = arith.cmpi eq, %2665, %2665 : i64
      %2669 = arith.andi %2667, %2668 : i1
      %2670 = scf.if %2669 -> (i64) {
        scf.yield %2494 : i64
      } else {
        scf.yield %2665 : i64
      }
      %2671 = func.call @cc_errorp(%2555) : (i64) -> i64
      %2672 = arith.cmpi ne, %2671, %2665 : i64
      %2673 = arith.cmpi eq, %2670, %2665 : i64
      %2674 = arith.andi %2672, %2673 : i1
      %2675 = scf.if %2674 -> (i64) {
        scf.yield %2555 : i64
      } else {
        scf.yield %2670 : i64
      }
      %2676 = func.call @cc_errorp(%2607) : (i64) -> i64
      %2677 = arith.cmpi ne, %2676, %2665 : i64
      %2678 = arith.cmpi eq, %2675, %2665 : i64
      %2679 = arith.andi %2677, %2678 : i1
      %2680 = scf.if %2679 -> (i64) {
        scf.yield %2607 : i64
      } else {
        scf.yield %2675 : i64
      }
      %2681 = func.call @cc_errorp(%2632) : (i64) -> i64
      %2682 = arith.cmpi ne, %2681, %2665 : i64
      %2683 = arith.cmpi eq, %2680, %2665 : i64
      %2684 = arith.andi %2682, %2683 : i1
      %2685 = scf.if %2684 -> (i64) {
        scf.yield %2632 : i64
      } else {
        scf.yield %2680 : i64
      }
      %2686 = func.call @cc_errorp(%2643) : (i64) -> i64
      %2687 = arith.cmpi ne, %2686, %2665 : i64
      %2688 = arith.cmpi eq, %2685, %2665 : i64
      %2689 = arith.andi %2687, %2688 : i1
      %2690 = scf.if %2689 -> (i64) {
        scf.yield %2643 : i64
      } else {
        scf.yield %2685 : i64
      }
      %2691 = func.call @cc_errorp(%2644) : (i64) -> i64
      %2692 = arith.cmpi ne, %2691, %2665 : i64
      %2693 = arith.cmpi eq, %2690, %2665 : i64
      %2694 = arith.andi %2692, %2693 : i1
      %2695 = scf.if %2694 -> (i64) {
        scf.yield %2644 : i64
      } else {
        scf.yield %2690 : i64
      }
      %2696 = func.call @cc_errorp(%2655) : (i64) -> i64
      %2697 = arith.cmpi ne, %2696, %2665 : i64
      %2698 = arith.cmpi eq, %2695, %2665 : i64
      %2699 = arith.andi %2697, %2698 : i1
      %2700 = scf.if %2699 -> (i64) {
        scf.yield %2655 : i64
      } else {
        scf.yield %2695 : i64
      }
      %2701 = func.call @cc_errorp(%2664) : (i64) -> i64
      %2702 = arith.cmpi ne, %2701, %2665 : i64
      %2703 = arith.cmpi eq, %2700, %2665 : i64
      %2704 = arith.andi %2702, %2703 : i1
      %2705 = scf.if %2704 -> (i64) {
        scf.yield %2664 : i64
      } else {
        scf.yield %2700 : i64
      }
      %2706 = arith.cmpi ne, %2705, %2665 : i64
      scf.if %2706 {
        func.call @stack_push_pointer(%2705) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2494) : (i64) -> ()
        func.call @stack_push_pointer(%2555) : (i64) -> ()
        func.call @stack_push_pointer(%2607) : (i64) -> ()
        func.call @stack_push_pointer(%2632) : (i64) -> ()
        func.call @stack_push_pointer(%2643) : (i64) -> ()
        func.call @stack_push_pointer(%2644) : (i64) -> ()
        func.call @stack_push_pointer(%2655) : (i64) -> ()
        func.call @stack_push_pointer(%2664) : (i64) -> ()
        %2707 = llvm.mlir.addressof @str201 : !llvm.ptr
        %2708 = func.call @cc_make_function_ref_const(%2707) : (!llvm.ptr) -> i64
        %2709 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2708, %2709) : (i64, i64) -> ()
      }
      %2710 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2710 : i64
    }
    %2711 = func.call @cc_nil_value() : () -> i64
    %2712 = func.call @cc_errorp(%2485) : (i64) -> i64
    %2713 = arith.cmpi ne, %2712, %2711 : i64
    %2714 = scf.if %2713 -> (i64) {
      scf.yield %2485 : i64
    } else {
      %2715 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2716 = arith.constant 12 : i64
      %2717 = func.call @cc_make_string(%2715, %2716) : (!llvm.ptr, i64) -> i64
      %2718 = func.call @cc_nil_value() : () -> i64
      %2719 = func.call @cc_intern(%2717, %2718) : (i64, i64) -> i64
      %2720 = func.call @cc_nil_value() : () -> i64
      %2721 = func.call @cc_cons(%2719, %2720) : (i64, i64) -> i64
      %2722 = func.call @cc_values_pack(%2721) : (i64) -> i64
      func.call @stack_push_pointer(%2719) : (i64) -> ()
      %2723 = func.call @stack_pop_pointer() : () -> i64
      %2724 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2725 = arith.constant 13 : i64
      %2726 = func.call @cc_make_string(%2724, %2725) : (!llvm.ptr, i64) -> i64
      %2727 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2728 = arith.constant 11 : i64
      %2729 = func.call @cc_make_string(%2727, %2728) : (!llvm.ptr, i64) -> i64
      %2730 = func.call @cc_intern(%2726, %2729) : (i64, i64) -> i64
      %2731 = func.call @cc_nil_value() : () -> i64
      %2732 = func.call @cc_cons(%2730, %2731) : (i64, i64) -> i64
      %2733 = func.call @cc_values_pack(%2732) : (i64) -> i64
      func.call @stack_push_pointer(%2730) : (i64) -> ()
      %2734 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2735 = arith.constant 6 : i64
      %2736 = func.call @cc_make_string(%2734, %2735) : (!llvm.ptr, i64) -> i64
      %2737 = func.call @cc_nil_value() : () -> i64
      %2738 = func.call @cc_intern(%2736, %2737) : (i64, i64) -> i64
      %2739 = func.call @cc_nil_value() : () -> i64
      %2740 = func.call @cc_cons(%2738, %2739) : (i64, i64) -> i64
      %2741 = func.call @cc_values_pack(%2740) : (i64) -> i64
      func.call @stack_push_pointer(%2738) : (i64) -> ()
      %2742 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2743 = arith.constant 19 : i64
      %2744 = func.call @cc_make_string(%2742, %2743) : (!llvm.ptr, i64) -> i64
      %2745 = func.call @cc_nil_value() : () -> i64
      %2746 = func.call @cc_intern(%2744, %2745) : (i64, i64) -> i64
      %2747 = func.call @cc_nil_value() : () -> i64
      %2748 = func.call @cc_cons(%2746, %2747) : (i64, i64) -> i64
      %2749 = func.call @cc_values_pack(%2748) : (i64) -> i64
      func.call @stack_push_pointer(%2746) : (i64) -> ()
      %2750 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2751 = arith.constant 14 : i64
      %2752 = func.call @cc_make_string(%2750, %2751) : (!llvm.ptr, i64) -> i64
      %2753 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2754 = arith.constant 11 : i64
      %2755 = func.call @cc_make_string(%2753, %2754) : (!llvm.ptr, i64) -> i64
      %2756 = func.call @cc_intern(%2752, %2755) : (i64, i64) -> i64
      %2757 = func.call @cc_nil_value() : () -> i64
      %2758 = func.call @cc_cons(%2756, %2757) : (i64, i64) -> i64
      %2759 = func.call @cc_values_pack(%2758) : (i64) -> i64
      func.call @stack_push_pointer(%2756) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2760 = func.call @stack_pop_pointer() : () -> i64
      %2761 = func.call @stack_pop_pointer() : () -> i64
      %2762 = func.call @cc_cons(%2761, %2760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2762) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2763 = func.call @stack_pop_pointer() : () -> i64
      %2764 = func.call @stack_pop_pointer() : () -> i64
      %2765 = func.call @cc_cons(%2764, %2763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2765) : (i64) -> ()
      %2766 = func.call @stack_pop_pointer() : () -> i64
      %2767 = func.call @stack_pop_pointer() : () -> i64
      %2768 = func.call @cc_cons(%2767, %2766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2768) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2769 = func.call @stack_pop_pointer() : () -> i64
      %2770 = func.call @stack_pop_pointer() : () -> i64
      %2771 = func.call @cc_cons(%2770, %2769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2771) : (i64) -> ()
      %2772 = func.call @stack_pop_pointer() : () -> i64
      %2773 = func.call @stack_pop_pointer() : () -> i64
      %2774 = func.call @cc_cons(%2773, %2772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2774) : (i64) -> ()
      %2775 = func.call @stack_pop_pointer() : () -> i64
      %2776 = func.call @stack_pop_pointer() : () -> i64
      %2777 = func.call @cc_cons(%2776, %2775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2777) : (i64) -> ()
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
      %2833 = arith.constant 209815645192205 : i64
      %2834 = arith.constant 0 : i64
      %2835 = func.call @cc_make_closure(%2833, %2834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2835) : (i64) -> ()
      %2836 = func.call @stack_pop_pointer() : () -> i64
      %2837 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2838 = arith.constant 4 : i64
      %2839 = func.call @cc_make_string(%2837, %2838) : (!llvm.ptr, i64) -> i64
      %2840 = func.call @cc_nil_value() : () -> i64
      %2841 = func.call @cc_intern(%2839, %2840) : (i64, i64) -> i64
      %2842 = func.call @cc_nil_value() : () -> i64
      %2843 = func.call @cc_cons(%2841, %2842) : (i64, i64) -> i64
      %2844 = func.call @cc_values_pack(%2843) : (i64) -> i64
      func.call @stack_push_pointer(%2841) : (i64) -> ()
      %2845 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2846 = arith.constant 13 : i64
      %2847 = func.call @cc_make_string(%2845, %2846) : (!llvm.ptr, i64) -> i64
      %2848 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2849 = arith.constant 11 : i64
      %2850 = func.call @cc_make_string(%2848, %2849) : (!llvm.ptr, i64) -> i64
      %2851 = func.call @cc_intern(%2847, %2850) : (i64, i64) -> i64
      %2852 = func.call @cc_nil_value() : () -> i64
      %2853 = func.call @cc_cons(%2851, %2852) : (i64, i64) -> i64
      %2854 = func.call @cc_values_pack(%2853) : (i64) -> i64
      func.call @stack_push_pointer(%2851) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2855 = func.call @stack_pop_pointer() : () -> i64
      %2856 = func.call @stack_pop_pointer() : () -> i64
      %2857 = func.call @cc_cons(%2856, %2855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2857) : (i64) -> ()
      %2858 = func.call @stack_pop_pointer() : () -> i64
      %2859 = func.call @stack_pop_pointer() : () -> i64
      %2860 = func.call @cc_cons(%2859, %2858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2860) : (i64) -> ()
      %2861 = func.call @stack_pop_pointer() : () -> i64
      %2862 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2863 = arith.constant 11 : i64
      %2864 = func.call @cc_make_string(%2862, %2863) : (!llvm.ptr, i64) -> i64
      %2865 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2866 = arith.constant 7 : i64
      %2867 = func.call @cc_make_string(%2865, %2866) : (!llvm.ptr, i64) -> i64
      %2868 = func.call @cc_intern(%2864, %2867) : (i64, i64) -> i64
      %2869 = func.call @cc_nil_value() : () -> i64
      %2870 = func.call @cc_cons(%2868, %2869) : (i64, i64) -> i64
      %2871 = func.call @cc_values_pack(%2870) : (i64) -> i64
      func.call @stack_push_pointer(%2868) : (i64) -> ()
      %2872 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2873 = func.call @stack_pop_pointer() : () -> i64
      %2874 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2875 = arith.constant 4 : i64
      %2876 = func.call @cc_make_string(%2874, %2875) : (!llvm.ptr, i64) -> i64
      %2877 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2878 = arith.constant 7 : i64
      %2879 = func.call @cc_make_string(%2877, %2878) : (!llvm.ptr, i64) -> i64
      %2880 = func.call @cc_intern(%2876, %2879) : (i64, i64) -> i64
      %2881 = func.call @cc_nil_value() : () -> i64
      %2882 = func.call @cc_cons(%2880, %2881) : (i64, i64) -> i64
      %2883 = func.call @cc_values_pack(%2882) : (i64) -> i64
      func.call @stack_push_pointer(%2880) : (i64) -> ()
      %2884 = func.call @stack_pop_pointer() : () -> i64
      %2885 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2886 = arith.constant 5 : i64
      %2887 = func.call @cc_make_string(%2885, %2886) : (!llvm.ptr, i64) -> i64
      %2888 = func.call @cc_nil_value() : () -> i64
      %2889 = func.call @cc_intern(%2887, %2888) : (i64, i64) -> i64
      %2890 = func.call @cc_nil_value() : () -> i64
      %2891 = func.call @cc_cons(%2889, %2890) : (i64, i64) -> i64
      %2892 = func.call @cc_values_pack(%2891) : (i64) -> i64
      func.call @stack_push_pointer(%2889) : (i64) -> ()
      %2893 = func.call @stack_pop_pointer() : () -> i64
      %2894 = func.call @cc_nil_value() : () -> i64
      %2895 = func.call @cc_errorp(%2723) : (i64) -> i64
      %2896 = arith.cmpi ne, %2895, %2894 : i64
      %2897 = arith.cmpi eq, %2894, %2894 : i64
      %2898 = arith.andi %2896, %2897 : i1
      %2899 = scf.if %2898 -> (i64) {
        scf.yield %2723 : i64
      } else {
        scf.yield %2894 : i64
      }
      %2900 = func.call @cc_errorp(%2784) : (i64) -> i64
      %2901 = arith.cmpi ne, %2900, %2894 : i64
      %2902 = arith.cmpi eq, %2899, %2894 : i64
      %2903 = arith.andi %2901, %2902 : i1
      %2904 = scf.if %2903 -> (i64) {
        scf.yield %2784 : i64
      } else {
        scf.yield %2899 : i64
      }
      %2905 = func.call @cc_errorp(%2836) : (i64) -> i64
      %2906 = arith.cmpi ne, %2905, %2894 : i64
      %2907 = arith.cmpi eq, %2904, %2894 : i64
      %2908 = arith.andi %2906, %2907 : i1
      %2909 = scf.if %2908 -> (i64) {
        scf.yield %2836 : i64
      } else {
        scf.yield %2904 : i64
      }
      %2910 = func.call @cc_errorp(%2861) : (i64) -> i64
      %2911 = arith.cmpi ne, %2910, %2894 : i64
      %2912 = arith.cmpi eq, %2909, %2894 : i64
      %2913 = arith.andi %2911, %2912 : i1
      %2914 = scf.if %2913 -> (i64) {
        scf.yield %2861 : i64
      } else {
        scf.yield %2909 : i64
      }
      %2915 = func.call @cc_errorp(%2872) : (i64) -> i64
      %2916 = arith.cmpi ne, %2915, %2894 : i64
      %2917 = arith.cmpi eq, %2914, %2894 : i64
      %2918 = arith.andi %2916, %2917 : i1
      %2919 = scf.if %2918 -> (i64) {
        scf.yield %2872 : i64
      } else {
        scf.yield %2914 : i64
      }
      %2920 = func.call @cc_errorp(%2873) : (i64) -> i64
      %2921 = arith.cmpi ne, %2920, %2894 : i64
      %2922 = arith.cmpi eq, %2919, %2894 : i64
      %2923 = arith.andi %2921, %2922 : i1
      %2924 = scf.if %2923 -> (i64) {
        scf.yield %2873 : i64
      } else {
        scf.yield %2919 : i64
      }
      %2925 = func.call @cc_errorp(%2884) : (i64) -> i64
      %2926 = arith.cmpi ne, %2925, %2894 : i64
      %2927 = arith.cmpi eq, %2924, %2894 : i64
      %2928 = arith.andi %2926, %2927 : i1
      %2929 = scf.if %2928 -> (i64) {
        scf.yield %2884 : i64
      } else {
        scf.yield %2924 : i64
      }
      %2930 = func.call @cc_errorp(%2893) : (i64) -> i64
      %2931 = arith.cmpi ne, %2930, %2894 : i64
      %2932 = arith.cmpi eq, %2929, %2894 : i64
      %2933 = arith.andi %2931, %2932 : i1
      %2934 = scf.if %2933 -> (i64) {
        scf.yield %2893 : i64
      } else {
        scf.yield %2929 : i64
      }
      %2935 = arith.cmpi ne, %2934, %2894 : i64
      scf.if %2935 {
        func.call @stack_push_pointer(%2934) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2723) : (i64) -> ()
        func.call @stack_push_pointer(%2784) : (i64) -> ()
        func.call @stack_push_pointer(%2836) : (i64) -> ()
        func.call @stack_push_pointer(%2861) : (i64) -> ()
        func.call @stack_push_pointer(%2872) : (i64) -> ()
        func.call @stack_push_pointer(%2873) : (i64) -> ()
        func.call @stack_push_pointer(%2884) : (i64) -> ()
        func.call @stack_push_pointer(%2893) : (i64) -> ()
        %2936 = llvm.mlir.addressof @str218 : !llvm.ptr
        %2937 = func.call @cc_make_function_ref_const(%2936) : (!llvm.ptr) -> i64
        %2938 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2937, %2938) : (i64, i64) -> ()
      }
      %2939 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2939 : i64
    }
    %2940 = func.call @cc_nil_value() : () -> i64
    %2941 = func.call @cc_errorp(%2714) : (i64) -> i64
    %2942 = arith.cmpi ne, %2941, %2940 : i64
    %2943 = scf.if %2942 -> (i64) {
      scf.yield %2714 : i64
    } else {
      %2944 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2945 = arith.constant 12 : i64
      %2946 = func.call @cc_make_string(%2944, %2945) : (!llvm.ptr, i64) -> i64
      %2947 = func.call @cc_nil_value() : () -> i64
      %2948 = func.call @cc_intern(%2946, %2947) : (i64, i64) -> i64
      %2949 = func.call @cc_nil_value() : () -> i64
      %2950 = func.call @cc_cons(%2948, %2949) : (i64, i64) -> i64
      %2951 = func.call @cc_values_pack(%2950) : (i64) -> i64
      func.call @stack_push_pointer(%2948) : (i64) -> ()
      %2952 = func.call @stack_pop_pointer() : () -> i64
      %2953 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2954 = arith.constant 13 : i64
      %2955 = func.call @cc_make_string(%2953, %2954) : (!llvm.ptr, i64) -> i64
      %2956 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2957 = arith.constant 11 : i64
      %2958 = func.call @cc_make_string(%2956, %2957) : (!llvm.ptr, i64) -> i64
      %2959 = func.call @cc_intern(%2955, %2958) : (i64, i64) -> i64
      %2960 = func.call @cc_nil_value() : () -> i64
      %2961 = func.call @cc_cons(%2959, %2960) : (i64, i64) -> i64
      %2962 = func.call @cc_values_pack(%2961) : (i64) -> i64
      func.call @stack_push_pointer(%2959) : (i64) -> ()
      %2963 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2964 = arith.constant 6 : i64
      %2965 = func.call @cc_make_string(%2963, %2964) : (!llvm.ptr, i64) -> i64
      %2966 = func.call @cc_nil_value() : () -> i64
      %2967 = func.call @cc_intern(%2965, %2966) : (i64, i64) -> i64
      %2968 = func.call @cc_nil_value() : () -> i64
      %2969 = func.call @cc_cons(%2967, %2968) : (i64, i64) -> i64
      %2970 = func.call @cc_values_pack(%2969) : (i64) -> i64
      func.call @stack_push_pointer(%2967) : (i64) -> ()
      %2971 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2972 = arith.constant 19 : i64
      %2973 = func.call @cc_make_string(%2971, %2972) : (!llvm.ptr, i64) -> i64
      %2974 = func.call @cc_nil_value() : () -> i64
      %2975 = func.call @cc_intern(%2973, %2974) : (i64, i64) -> i64
      %2976 = func.call @cc_nil_value() : () -> i64
      %2977 = func.call @cc_cons(%2975, %2976) : (i64, i64) -> i64
      %2978 = func.call @cc_values_pack(%2977) : (i64) -> i64
      func.call @stack_push_pointer(%2975) : (i64) -> ()
      %2979 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2980 = arith.constant 5 : i64
      %2981 = func.call @cc_make_string(%2979, %2980) : (!llvm.ptr, i64) -> i64
      %2982 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2983 = arith.constant 11 : i64
      %2984 = func.call @cc_make_string(%2982, %2983) : (!llvm.ptr, i64) -> i64
      %2985 = func.call @cc_intern(%2981, %2984) : (i64, i64) -> i64
      %2986 = func.call @cc_nil_value() : () -> i64
      %2987 = func.call @cc_cons(%2985, %2986) : (i64, i64) -> i64
      %2988 = func.call @cc_values_pack(%2987) : (i64) -> i64
      func.call @stack_push_pointer(%2985) : (i64) -> ()
      %2989 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2990 = arith.constant 15 : i64
      %2991 = func.call @cc_make_string(%2989, %2990) : (!llvm.ptr, i64) -> i64
      %2992 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2993 = arith.constant 11 : i64
      %2994 = func.call @cc_make_string(%2992, %2993) : (!llvm.ptr, i64) -> i64
      %2995 = func.call @cc_intern(%2991, %2994) : (i64, i64) -> i64
      %2996 = func.call @cc_nil_value() : () -> i64
      %2997 = func.call @cc_cons(%2995, %2996) : (i64, i64) -> i64
      %2998 = func.call @cc_values_pack(%2997) : (i64) -> i64
      func.call @stack_push_pointer(%2995) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2999 = func.call @stack_pop_pointer() : () -> i64
      %3000 = func.call @stack_pop_pointer() : () -> i64
      %3001 = func.call @cc_cons(%3000, %2999) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3001) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3002 = func.call @stack_pop_pointer() : () -> i64
      %3003 = func.call @stack_pop_pointer() : () -> i64
      %3004 = func.call @cc_cons(%3003, %3002) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3004) : (i64) -> ()
      %3005 = func.call @stack_pop_pointer() : () -> i64
      %3006 = func.call @stack_pop_pointer() : () -> i64
      %3007 = func.call @cc_cons(%3006, %3005) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3007) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3008 = func.call @stack_pop_pointer() : () -> i64
      %3009 = func.call @stack_pop_pointer() : () -> i64
      %3010 = func.call @cc_cons(%3009, %3008) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3010) : (i64) -> ()
      %3011 = func.call @stack_pop_pointer() : () -> i64
      %3012 = func.call @stack_pop_pointer() : () -> i64
      %3013 = func.call @cc_cons(%3012, %3011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3013) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3014 = func.call @stack_pop_pointer() : () -> i64
      %3015 = func.call @stack_pop_pointer() : () -> i64
      %3016 = func.call @cc_cons(%3015, %3014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3016) : (i64) -> ()
      %3017 = func.call @stack_pop_pointer() : () -> i64
      %3018 = func.call @stack_pop_pointer() : () -> i64
      %3019 = func.call @cc_cons(%3018, %3017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3019) : (i64) -> ()
      %3020 = func.call @stack_pop_pointer() : () -> i64
      %3021 = func.call @stack_pop_pointer() : () -> i64
      %3022 = func.call @cc_cons(%3021, %3020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3022) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3023 = func.call @stack_pop_pointer() : () -> i64
      %3024 = func.call @stack_pop_pointer() : () -> i64
      %3025 = func.call @cc_cons(%3024, %3023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3025) : (i64) -> ()
      %3026 = func.call @stack_pop_pointer() : () -> i64
      %3027 = func.call @stack_pop_pointer() : () -> i64
      %3028 = func.call @cc_cons(%3027, %3026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3028) : (i64) -> ()
      %3029 = func.call @stack_pop_pointer() : () -> i64
      %3086 = arith.constant 209815645192206 : i64
      %3087 = arith.constant 0 : i64
      %3088 = func.call @cc_make_closure(%3086, %3087) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3088) : (i64) -> ()
      %3089 = func.call @stack_pop_pointer() : () -> i64
      %3090 = llvm.mlir.addressof @str229 : !llvm.ptr
      %3091 = arith.constant 4 : i64
      %3092 = func.call @cc_make_string(%3090, %3091) : (!llvm.ptr, i64) -> i64
      %3093 = func.call @cc_nil_value() : () -> i64
      %3094 = func.call @cc_intern(%3092, %3093) : (i64, i64) -> i64
      %3095 = func.call @cc_nil_value() : () -> i64
      %3096 = func.call @cc_cons(%3094, %3095) : (i64, i64) -> i64
      %3097 = func.call @cc_values_pack(%3096) : (i64) -> i64
      func.call @stack_push_pointer(%3094) : (i64) -> ()
      %3098 = llvm.mlir.addressof @str230 : !llvm.ptr
      %3099 = arith.constant 10 : i64
      %3100 = func.call @cc_make_string(%3098, %3099) : (!llvm.ptr, i64) -> i64
      %3101 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3102 = arith.constant 11 : i64
      %3103 = func.call @cc_make_string(%3101, %3102) : (!llvm.ptr, i64) -> i64
      %3104 = func.call @cc_intern(%3100, %3103) : (i64, i64) -> i64
      %3105 = func.call @cc_nil_value() : () -> i64
      %3106 = func.call @cc_cons(%3104, %3105) : (i64, i64) -> i64
      %3107 = func.call @cc_values_pack(%3106) : (i64) -> i64
      func.call @stack_push_pointer(%3104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3108 = func.call @stack_pop_pointer() : () -> i64
      %3109 = func.call @stack_pop_pointer() : () -> i64
      %3110 = func.call @cc_cons(%3109, %3108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3110) : (i64) -> ()
      %3111 = func.call @stack_pop_pointer() : () -> i64
      %3112 = func.call @stack_pop_pointer() : () -> i64
      %3113 = func.call @cc_cons(%3112, %3111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3113) : (i64) -> ()
      %3114 = func.call @stack_pop_pointer() : () -> i64
      %3115 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3116 = arith.constant 11 : i64
      %3117 = func.call @cc_make_string(%3115, %3116) : (!llvm.ptr, i64) -> i64
      %3118 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3119 = arith.constant 7 : i64
      %3120 = func.call @cc_make_string(%3118, %3119) : (!llvm.ptr, i64) -> i64
      %3121 = func.call @cc_intern(%3117, %3120) : (i64, i64) -> i64
      %3122 = func.call @cc_nil_value() : () -> i64
      %3123 = func.call @cc_cons(%3121, %3122) : (i64, i64) -> i64
      %3124 = func.call @cc_values_pack(%3123) : (i64) -> i64
      func.call @stack_push_pointer(%3121) : (i64) -> ()
      %3125 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3126 = func.call @stack_pop_pointer() : () -> i64
      %3127 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3128 = arith.constant 4 : i64
      %3129 = func.call @cc_make_string(%3127, %3128) : (!llvm.ptr, i64) -> i64
      %3130 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3131 = arith.constant 7 : i64
      %3132 = func.call @cc_make_string(%3130, %3131) : (!llvm.ptr, i64) -> i64
      %3133 = func.call @cc_intern(%3129, %3132) : (i64, i64) -> i64
      %3134 = func.call @cc_nil_value() : () -> i64
      %3135 = func.call @cc_cons(%3133, %3134) : (i64, i64) -> i64
      %3136 = func.call @cc_values_pack(%3135) : (i64) -> i64
      func.call @stack_push_pointer(%3133) : (i64) -> ()
      %3137 = func.call @stack_pop_pointer() : () -> i64
      %3138 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3139 = arith.constant 5 : i64
      %3140 = func.call @cc_make_string(%3138, %3139) : (!llvm.ptr, i64) -> i64
      %3141 = func.call @cc_nil_value() : () -> i64
      %3142 = func.call @cc_intern(%3140, %3141) : (i64, i64) -> i64
      %3143 = func.call @cc_nil_value() : () -> i64
      %3144 = func.call @cc_cons(%3142, %3143) : (i64, i64) -> i64
      %3145 = func.call @cc_values_pack(%3144) : (i64) -> i64
      func.call @stack_push_pointer(%3142) : (i64) -> ()
      %3146 = func.call @stack_pop_pointer() : () -> i64
      %3147 = func.call @cc_nil_value() : () -> i64
      %3148 = func.call @cc_errorp(%2952) : (i64) -> i64
      %3149 = arith.cmpi ne, %3148, %3147 : i64
      %3150 = arith.cmpi eq, %3147, %3147 : i64
      %3151 = arith.andi %3149, %3150 : i1
      %3152 = scf.if %3151 -> (i64) {
        scf.yield %2952 : i64
      } else {
        scf.yield %3147 : i64
      }
      %3153 = func.call @cc_errorp(%3029) : (i64) -> i64
      %3154 = arith.cmpi ne, %3153, %3147 : i64
      %3155 = arith.cmpi eq, %3152, %3147 : i64
      %3156 = arith.andi %3154, %3155 : i1
      %3157 = scf.if %3156 -> (i64) {
        scf.yield %3029 : i64
      } else {
        scf.yield %3152 : i64
      }
      %3158 = func.call @cc_errorp(%3089) : (i64) -> i64
      %3159 = arith.cmpi ne, %3158, %3147 : i64
      %3160 = arith.cmpi eq, %3157, %3147 : i64
      %3161 = arith.andi %3159, %3160 : i1
      %3162 = scf.if %3161 -> (i64) {
        scf.yield %3089 : i64
      } else {
        scf.yield %3157 : i64
      }
      %3163 = func.call @cc_errorp(%3114) : (i64) -> i64
      %3164 = arith.cmpi ne, %3163, %3147 : i64
      %3165 = arith.cmpi eq, %3162, %3147 : i64
      %3166 = arith.andi %3164, %3165 : i1
      %3167 = scf.if %3166 -> (i64) {
        scf.yield %3114 : i64
      } else {
        scf.yield %3162 : i64
      }
      %3168 = func.call @cc_errorp(%3125) : (i64) -> i64
      %3169 = arith.cmpi ne, %3168, %3147 : i64
      %3170 = arith.cmpi eq, %3167, %3147 : i64
      %3171 = arith.andi %3169, %3170 : i1
      %3172 = scf.if %3171 -> (i64) {
        scf.yield %3125 : i64
      } else {
        scf.yield %3167 : i64
      }
      %3173 = func.call @cc_errorp(%3126) : (i64) -> i64
      %3174 = arith.cmpi ne, %3173, %3147 : i64
      %3175 = arith.cmpi eq, %3172, %3147 : i64
      %3176 = arith.andi %3174, %3175 : i1
      %3177 = scf.if %3176 -> (i64) {
        scf.yield %3126 : i64
      } else {
        scf.yield %3172 : i64
      }
      %3178 = func.call @cc_errorp(%3137) : (i64) -> i64
      %3179 = arith.cmpi ne, %3178, %3147 : i64
      %3180 = arith.cmpi eq, %3177, %3147 : i64
      %3181 = arith.andi %3179, %3180 : i1
      %3182 = scf.if %3181 -> (i64) {
        scf.yield %3137 : i64
      } else {
        scf.yield %3177 : i64
      }
      %3183 = func.call @cc_errorp(%3146) : (i64) -> i64
      %3184 = arith.cmpi ne, %3183, %3147 : i64
      %3185 = arith.cmpi eq, %3182, %3147 : i64
      %3186 = arith.andi %3184, %3185 : i1
      %3187 = scf.if %3186 -> (i64) {
        scf.yield %3146 : i64
      } else {
        scf.yield %3182 : i64
      }
      %3188 = arith.cmpi ne, %3187, %3147 : i64
      scf.if %3188 {
        func.call @stack_push_pointer(%3187) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2952) : (i64) -> ()
        func.call @stack_push_pointer(%3029) : (i64) -> ()
        func.call @stack_push_pointer(%3089) : (i64) -> ()
        func.call @stack_push_pointer(%3114) : (i64) -> ()
        func.call @stack_push_pointer(%3125) : (i64) -> ()
        func.call @stack_push_pointer(%3126) : (i64) -> ()
        func.call @stack_push_pointer(%3137) : (i64) -> ()
        func.call @stack_push_pointer(%3146) : (i64) -> ()
        %3189 = llvm.mlir.addressof @str237 : !llvm.ptr
        %3190 = func.call @cc_make_function_ref_const(%3189) : (!llvm.ptr) -> i64
        %3191 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3190, %3191) : (i64, i64) -> ()
      }
      %3192 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3192 : i64
    }
    %3193 = func.call @cc_nil_value() : () -> i64
    %3194 = func.call @cc_errorp(%2943) : (i64) -> i64
    %3195 = arith.cmpi ne, %3194, %3193 : i64
    %3196 = scf.if %3195 -> (i64) {
      scf.yield %2943 : i64
    } else {
      %3197 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3198 = arith.constant 12 : i64
      %3199 = func.call @cc_make_string(%3197, %3198) : (!llvm.ptr, i64) -> i64
      %3200 = func.call @cc_nil_value() : () -> i64
      %3201 = func.call @cc_intern(%3199, %3200) : (i64, i64) -> i64
      %3202 = func.call @cc_nil_value() : () -> i64
      %3203 = func.call @cc_cons(%3201, %3202) : (i64, i64) -> i64
      %3204 = func.call @cc_values_pack(%3203) : (i64) -> i64
      func.call @stack_push_pointer(%3201) : (i64) -> ()
      %3205 = func.call @stack_pop_pointer() : () -> i64
      %3206 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3207 = arith.constant 13 : i64
      %3208 = func.call @cc_make_string(%3206, %3207) : (!llvm.ptr, i64) -> i64
      %3209 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3210 = arith.constant 11 : i64
      %3211 = func.call @cc_make_string(%3209, %3210) : (!llvm.ptr, i64) -> i64
      %3212 = func.call @cc_intern(%3208, %3211) : (i64, i64) -> i64
      %3213 = func.call @cc_nil_value() : () -> i64
      %3214 = func.call @cc_cons(%3212, %3213) : (i64, i64) -> i64
      %3215 = func.call @cc_values_pack(%3214) : (i64) -> i64
      func.call @stack_push_pointer(%3212) : (i64) -> ()
      %3216 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3217 = arith.constant 6 : i64
      %3218 = func.call @cc_make_string(%3216, %3217) : (!llvm.ptr, i64) -> i64
      %3219 = func.call @cc_nil_value() : () -> i64
      %3220 = func.call @cc_intern(%3218, %3219) : (i64, i64) -> i64
      %3221 = func.call @cc_nil_value() : () -> i64
      %3222 = func.call @cc_cons(%3220, %3221) : (i64, i64) -> i64
      %3223 = func.call @cc_values_pack(%3222) : (i64) -> i64
      func.call @stack_push_pointer(%3220) : (i64) -> ()
      %3224 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3225 = arith.constant 19 : i64
      %3226 = func.call @cc_make_string(%3224, %3225) : (!llvm.ptr, i64) -> i64
      %3227 = func.call @cc_nil_value() : () -> i64
      %3228 = func.call @cc_intern(%3226, %3227) : (i64, i64) -> i64
      %3229 = func.call @cc_nil_value() : () -> i64
      %3230 = func.call @cc_cons(%3228, %3229) : (i64, i64) -> i64
      %3231 = func.call @cc_values_pack(%3230) : (i64) -> i64
      func.call @stack_push_pointer(%3228) : (i64) -> ()
      %3232 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3233 = arith.constant 6 : i64
      %3234 = func.call @cc_make_string(%3232, %3233) : (!llvm.ptr, i64) -> i64
      %3235 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3236 = arith.constant 11 : i64
      %3237 = func.call @cc_make_string(%3235, %3236) : (!llvm.ptr, i64) -> i64
      %3238 = func.call @cc_intern(%3234, %3237) : (i64, i64) -> i64
      %3239 = func.call @cc_nil_value() : () -> i64
      %3240 = func.call @cc_cons(%3238, %3239) : (i64, i64) -> i64
      %3241 = func.call @cc_values_pack(%3240) : (i64) -> i64
      func.call @stack_push_pointer(%3238) : (i64) -> ()
      %3242 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3243 = arith.constant 15 : i64
      %3244 = func.call @cc_make_string(%3242, %3243) : (!llvm.ptr, i64) -> i64
      %3245 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3246 = arith.constant 11 : i64
      %3247 = func.call @cc_make_string(%3245, %3246) : (!llvm.ptr, i64) -> i64
      %3248 = func.call @cc_intern(%3244, %3247) : (i64, i64) -> i64
      %3249 = func.call @cc_nil_value() : () -> i64
      %3250 = func.call @cc_cons(%3248, %3249) : (i64, i64) -> i64
      %3251 = func.call @cc_values_pack(%3250) : (i64) -> i64
      func.call @stack_push_pointer(%3248) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3252 = func.call @stack_pop_pointer() : () -> i64
      %3253 = func.call @stack_pop_pointer() : () -> i64
      %3254 = func.call @cc_cons(%3253, %3252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3254) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3255 = func.call @stack_pop_pointer() : () -> i64
      %3256 = func.call @stack_pop_pointer() : () -> i64
      %3257 = func.call @cc_cons(%3256, %3255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3257) : (i64) -> ()
      %3258 = func.call @stack_pop_pointer() : () -> i64
      %3259 = func.call @stack_pop_pointer() : () -> i64
      %3260 = func.call @cc_cons(%3259, %3258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3261 = func.call @stack_pop_pointer() : () -> i64
      %3262 = func.call @stack_pop_pointer() : () -> i64
      %3263 = func.call @cc_cons(%3262, %3261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3263) : (i64) -> ()
      %3264 = func.call @stack_pop_pointer() : () -> i64
      %3265 = func.call @stack_pop_pointer() : () -> i64
      %3266 = func.call @cc_cons(%3265, %3264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3266) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3267 = func.call @stack_pop_pointer() : () -> i64
      %3268 = func.call @stack_pop_pointer() : () -> i64
      %3269 = func.call @cc_cons(%3268, %3267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3269) : (i64) -> ()
      %3270 = func.call @stack_pop_pointer() : () -> i64
      %3271 = func.call @stack_pop_pointer() : () -> i64
      %3272 = func.call @cc_cons(%3271, %3270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3272) : (i64) -> ()
      %3273 = func.call @stack_pop_pointer() : () -> i64
      %3274 = func.call @stack_pop_pointer() : () -> i64
      %3275 = func.call @cc_cons(%3274, %3273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3275) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3276 = func.call @stack_pop_pointer() : () -> i64
      %3277 = func.call @stack_pop_pointer() : () -> i64
      %3278 = func.call @cc_cons(%3277, %3276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3278) : (i64) -> ()
      %3279 = func.call @stack_pop_pointer() : () -> i64
      %3280 = func.call @stack_pop_pointer() : () -> i64
      %3281 = func.call @cc_cons(%3280, %3279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3281) : (i64) -> ()
      %3282 = func.call @stack_pop_pointer() : () -> i64
      %3339 = arith.constant 209815645192207 : i64
      %3340 = arith.constant 0 : i64
      %3341 = func.call @cc_make_closure(%3339, %3340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3341) : (i64) -> ()
      %3342 = func.call @stack_pop_pointer() : () -> i64
      %3343 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3344 = arith.constant 4 : i64
      %3345 = func.call @cc_make_string(%3343, %3344) : (!llvm.ptr, i64) -> i64
      %3346 = func.call @cc_nil_value() : () -> i64
      %3347 = func.call @cc_intern(%3345, %3346) : (i64, i64) -> i64
      %3348 = func.call @cc_nil_value() : () -> i64
      %3349 = func.call @cc_cons(%3347, %3348) : (i64, i64) -> i64
      %3350 = func.call @cc_values_pack(%3349) : (i64) -> i64
      func.call @stack_push_pointer(%3347) : (i64) -> ()
      %3351 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3352 = arith.constant 10 : i64
      %3353 = func.call @cc_make_string(%3351, %3352) : (!llvm.ptr, i64) -> i64
      %3354 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3355 = arith.constant 11 : i64
      %3356 = func.call @cc_make_string(%3354, %3355) : (!llvm.ptr, i64) -> i64
      %3357 = func.call @cc_intern(%3353, %3356) : (i64, i64) -> i64
      %3358 = func.call @cc_nil_value() : () -> i64
      %3359 = func.call @cc_cons(%3357, %3358) : (i64, i64) -> i64
      %3360 = func.call @cc_values_pack(%3359) : (i64) -> i64
      func.call @stack_push_pointer(%3357) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3361 = func.call @stack_pop_pointer() : () -> i64
      %3362 = func.call @stack_pop_pointer() : () -> i64
      %3363 = func.call @cc_cons(%3362, %3361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3363) : (i64) -> ()
      %3364 = func.call @stack_pop_pointer() : () -> i64
      %3365 = func.call @stack_pop_pointer() : () -> i64
      %3366 = func.call @cc_cons(%3365, %3364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3366) : (i64) -> ()
      %3367 = func.call @stack_pop_pointer() : () -> i64
      %3368 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3369 = arith.constant 11 : i64
      %3370 = func.call @cc_make_string(%3368, %3369) : (!llvm.ptr, i64) -> i64
      %3371 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3372 = arith.constant 7 : i64
      %3373 = func.call @cc_make_string(%3371, %3372) : (!llvm.ptr, i64) -> i64
      %3374 = func.call @cc_intern(%3370, %3373) : (i64, i64) -> i64
      %3375 = func.call @cc_nil_value() : () -> i64
      %3376 = func.call @cc_cons(%3374, %3375) : (i64, i64) -> i64
      %3377 = func.call @cc_values_pack(%3376) : (i64) -> i64
      func.call @stack_push_pointer(%3374) : (i64) -> ()
      %3378 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3379 = func.call @stack_pop_pointer() : () -> i64
      %3380 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3381 = arith.constant 4 : i64
      %3382 = func.call @cc_make_string(%3380, %3381) : (!llvm.ptr, i64) -> i64
      %3383 = llvm.mlir.addressof @str254 : !llvm.ptr
      %3384 = arith.constant 7 : i64
      %3385 = func.call @cc_make_string(%3383, %3384) : (!llvm.ptr, i64) -> i64
      %3386 = func.call @cc_intern(%3382, %3385) : (i64, i64) -> i64
      %3387 = func.call @cc_nil_value() : () -> i64
      %3388 = func.call @cc_cons(%3386, %3387) : (i64, i64) -> i64
      %3389 = func.call @cc_values_pack(%3388) : (i64) -> i64
      func.call @stack_push_pointer(%3386) : (i64) -> ()
      %3390 = func.call @stack_pop_pointer() : () -> i64
      %3391 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3392 = arith.constant 5 : i64
      %3393 = func.call @cc_make_string(%3391, %3392) : (!llvm.ptr, i64) -> i64
      %3394 = func.call @cc_nil_value() : () -> i64
      %3395 = func.call @cc_intern(%3393, %3394) : (i64, i64) -> i64
      %3396 = func.call @cc_nil_value() : () -> i64
      %3397 = func.call @cc_cons(%3395, %3396) : (i64, i64) -> i64
      %3398 = func.call @cc_values_pack(%3397) : (i64) -> i64
      func.call @stack_push_pointer(%3395) : (i64) -> ()
      %3399 = func.call @stack_pop_pointer() : () -> i64
      %3400 = func.call @cc_nil_value() : () -> i64
      %3401 = func.call @cc_errorp(%3205) : (i64) -> i64
      %3402 = arith.cmpi ne, %3401, %3400 : i64
      %3403 = arith.cmpi eq, %3400, %3400 : i64
      %3404 = arith.andi %3402, %3403 : i1
      %3405 = scf.if %3404 -> (i64) {
        scf.yield %3205 : i64
      } else {
        scf.yield %3400 : i64
      }
      %3406 = func.call @cc_errorp(%3282) : (i64) -> i64
      %3407 = arith.cmpi ne, %3406, %3400 : i64
      %3408 = arith.cmpi eq, %3405, %3400 : i64
      %3409 = arith.andi %3407, %3408 : i1
      %3410 = scf.if %3409 -> (i64) {
        scf.yield %3282 : i64
      } else {
        scf.yield %3405 : i64
      }
      %3411 = func.call @cc_errorp(%3342) : (i64) -> i64
      %3412 = arith.cmpi ne, %3411, %3400 : i64
      %3413 = arith.cmpi eq, %3410, %3400 : i64
      %3414 = arith.andi %3412, %3413 : i1
      %3415 = scf.if %3414 -> (i64) {
        scf.yield %3342 : i64
      } else {
        scf.yield %3410 : i64
      }
      %3416 = func.call @cc_errorp(%3367) : (i64) -> i64
      %3417 = arith.cmpi ne, %3416, %3400 : i64
      %3418 = arith.cmpi eq, %3415, %3400 : i64
      %3419 = arith.andi %3417, %3418 : i1
      %3420 = scf.if %3419 -> (i64) {
        scf.yield %3367 : i64
      } else {
        scf.yield %3415 : i64
      }
      %3421 = func.call @cc_errorp(%3378) : (i64) -> i64
      %3422 = arith.cmpi ne, %3421, %3400 : i64
      %3423 = arith.cmpi eq, %3420, %3400 : i64
      %3424 = arith.andi %3422, %3423 : i1
      %3425 = scf.if %3424 -> (i64) {
        scf.yield %3378 : i64
      } else {
        scf.yield %3420 : i64
      }
      %3426 = func.call @cc_errorp(%3379) : (i64) -> i64
      %3427 = arith.cmpi ne, %3426, %3400 : i64
      %3428 = arith.cmpi eq, %3425, %3400 : i64
      %3429 = arith.andi %3427, %3428 : i1
      %3430 = scf.if %3429 -> (i64) {
        scf.yield %3379 : i64
      } else {
        scf.yield %3425 : i64
      }
      %3431 = func.call @cc_errorp(%3390) : (i64) -> i64
      %3432 = arith.cmpi ne, %3431, %3400 : i64
      %3433 = arith.cmpi eq, %3430, %3400 : i64
      %3434 = arith.andi %3432, %3433 : i1
      %3435 = scf.if %3434 -> (i64) {
        scf.yield %3390 : i64
      } else {
        scf.yield %3430 : i64
      }
      %3436 = func.call @cc_errorp(%3399) : (i64) -> i64
      %3437 = arith.cmpi ne, %3436, %3400 : i64
      %3438 = arith.cmpi eq, %3435, %3400 : i64
      %3439 = arith.andi %3437, %3438 : i1
      %3440 = scf.if %3439 -> (i64) {
        scf.yield %3399 : i64
      } else {
        scf.yield %3435 : i64
      }
      %3441 = arith.cmpi ne, %3440, %3400 : i64
      scf.if %3441 {
        func.call @stack_push_pointer(%3440) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3205) : (i64) -> ()
        func.call @stack_push_pointer(%3282) : (i64) -> ()
        func.call @stack_push_pointer(%3342) : (i64) -> ()
        func.call @stack_push_pointer(%3367) : (i64) -> ()
        func.call @stack_push_pointer(%3378) : (i64) -> ()
        func.call @stack_push_pointer(%3379) : (i64) -> ()
        func.call @stack_push_pointer(%3390) : (i64) -> ()
        func.call @stack_push_pointer(%3399) : (i64) -> ()
        %3442 = llvm.mlir.addressof @str256 : !llvm.ptr
        %3443 = func.call @cc_make_function_ref_const(%3442) : (!llvm.ptr) -> i64
        %3444 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3443, %3444) : (i64, i64) -> ()
      }
      %3445 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3445 : i64
    }
    %3446 = func.call @cc_nil_value() : () -> i64
    %3447 = func.call @cc_errorp(%3196) : (i64) -> i64
    %3448 = arith.cmpi ne, %3447, %3446 : i64
    %3449 = scf.if %3448 -> (i64) {
      scf.yield %3196 : i64
    } else {
      %3450 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3451 = arith.constant 12 : i64
      %3452 = func.call @cc_make_string(%3450, %3451) : (!llvm.ptr, i64) -> i64
      %3453 = func.call @cc_nil_value() : () -> i64
      %3454 = func.call @cc_intern(%3452, %3453) : (i64, i64) -> i64
      %3455 = func.call @cc_nil_value() : () -> i64
      %3456 = func.call @cc_cons(%3454, %3455) : (i64, i64) -> i64
      %3457 = func.call @cc_values_pack(%3456) : (i64) -> i64
      func.call @stack_push_pointer(%3454) : (i64) -> ()
      %3458 = func.call @stack_pop_pointer() : () -> i64
      %3459 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3460 = arith.constant 13 : i64
      %3461 = func.call @cc_make_string(%3459, %3460) : (!llvm.ptr, i64) -> i64
      %3462 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3463 = arith.constant 11 : i64
      %3464 = func.call @cc_make_string(%3462, %3463) : (!llvm.ptr, i64) -> i64
      %3465 = func.call @cc_intern(%3461, %3464) : (i64, i64) -> i64
      %3466 = func.call @cc_nil_value() : () -> i64
      %3467 = func.call @cc_cons(%3465, %3466) : (i64, i64) -> i64
      %3468 = func.call @cc_values_pack(%3467) : (i64) -> i64
      func.call @stack_push_pointer(%3465) : (i64) -> ()
      %3469 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3470 = arith.constant 6 : i64
      %3471 = func.call @cc_make_string(%3469, %3470) : (!llvm.ptr, i64) -> i64
      %3472 = func.call @cc_nil_value() : () -> i64
      %3473 = func.call @cc_intern(%3471, %3472) : (i64, i64) -> i64
      %3474 = func.call @cc_nil_value() : () -> i64
      %3475 = func.call @cc_cons(%3473, %3474) : (i64, i64) -> i64
      %3476 = func.call @cc_values_pack(%3475) : (i64) -> i64
      func.call @stack_push_pointer(%3473) : (i64) -> ()
      %3477 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3478 = arith.constant 19 : i64
      %3479 = func.call @cc_make_string(%3477, %3478) : (!llvm.ptr, i64) -> i64
      %3480 = func.call @cc_nil_value() : () -> i64
      %3481 = func.call @cc_intern(%3479, %3480) : (i64, i64) -> i64
      %3482 = func.call @cc_nil_value() : () -> i64
      %3483 = func.call @cc_cons(%3481, %3482) : (i64, i64) -> i64
      %3484 = func.call @cc_values_pack(%3483) : (i64) -> i64
      func.call @stack_push_pointer(%3481) : (i64) -> ()
      %3485 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3486 = arith.constant 5 : i64
      %3487 = func.call @cc_make_string(%3485, %3486) : (!llvm.ptr, i64) -> i64
      %3488 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3489 = arith.constant 11 : i64
      %3490 = func.call @cc_make_string(%3488, %3489) : (!llvm.ptr, i64) -> i64
      %3491 = func.call @cc_intern(%3487, %3490) : (i64, i64) -> i64
      %3492 = func.call @cc_nil_value() : () -> i64
      %3493 = func.call @cc_cons(%3491, %3492) : (i64, i64) -> i64
      %3494 = func.call @cc_values_pack(%3493) : (i64) -> i64
      func.call @stack_push_pointer(%3491) : (i64) -> ()
      %3495 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3496 = arith.constant 15 : i64
      %3497 = func.call @cc_make_string(%3495, %3496) : (!llvm.ptr, i64) -> i64
      %3498 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3499 = arith.constant 11 : i64
      %3500 = func.call @cc_make_string(%3498, %3499) : (!llvm.ptr, i64) -> i64
      %3501 = func.call @cc_intern(%3497, %3500) : (i64, i64) -> i64
      %3502 = func.call @cc_nil_value() : () -> i64
      %3503 = func.call @cc_cons(%3501, %3502) : (i64, i64) -> i64
      %3504 = func.call @cc_values_pack(%3503) : (i64) -> i64
      func.call @stack_push_pointer(%3501) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3505 = func.call @stack_pop_pointer() : () -> i64
      %3506 = func.call @stack_pop_pointer() : () -> i64
      %3507 = func.call @cc_cons(%3506, %3505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3507) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3508 = func.call @stack_pop_pointer() : () -> i64
      %3509 = func.call @stack_pop_pointer() : () -> i64
      %3510 = func.call @cc_cons(%3509, %3508) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3510) : (i64) -> ()
      %3511 = func.call @stack_pop_pointer() : () -> i64
      %3512 = func.call @stack_pop_pointer() : () -> i64
      %3513 = func.call @cc_cons(%3512, %3511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3513) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3514 = func.call @stack_pop_pointer() : () -> i64
      %3515 = func.call @stack_pop_pointer() : () -> i64
      %3516 = func.call @cc_cons(%3515, %3514) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3516) : (i64) -> ()
      %3517 = func.call @stack_pop_pointer() : () -> i64
      %3518 = func.call @stack_pop_pointer() : () -> i64
      %3519 = func.call @cc_cons(%3518, %3517) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3519) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3520 = func.call @stack_pop_pointer() : () -> i64
      %3521 = func.call @stack_pop_pointer() : () -> i64
      %3522 = func.call @cc_cons(%3521, %3520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3522) : (i64) -> ()
      %3523 = func.call @stack_pop_pointer() : () -> i64
      %3524 = func.call @stack_pop_pointer() : () -> i64
      %3525 = func.call @cc_cons(%3524, %3523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3525) : (i64) -> ()
      %3526 = func.call @stack_pop_pointer() : () -> i64
      %3527 = func.call @stack_pop_pointer() : () -> i64
      %3528 = func.call @cc_cons(%3527, %3526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3528) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3529 = func.call @stack_pop_pointer() : () -> i64
      %3530 = func.call @stack_pop_pointer() : () -> i64
      %3531 = func.call @cc_cons(%3530, %3529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3531) : (i64) -> ()
      %3532 = func.call @stack_pop_pointer() : () -> i64
      %3533 = func.call @stack_pop_pointer() : () -> i64
      %3534 = func.call @cc_cons(%3533, %3532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3534) : (i64) -> ()
      %3535 = func.call @stack_pop_pointer() : () -> i64
      %3592 = arith.constant 209815645192208 : i64
      %3593 = arith.constant 0 : i64
      %3594 = func.call @cc_make_closure(%3592, %3593) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3594) : (i64) -> ()
      %3595 = func.call @stack_pop_pointer() : () -> i64
      %3596 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3597 = arith.constant 4 : i64
      %3598 = func.call @cc_make_string(%3596, %3597) : (!llvm.ptr, i64) -> i64
      %3599 = func.call @cc_nil_value() : () -> i64
      %3600 = func.call @cc_intern(%3598, %3599) : (i64, i64) -> i64
      %3601 = func.call @cc_nil_value() : () -> i64
      %3602 = func.call @cc_cons(%3600, %3601) : (i64, i64) -> i64
      %3603 = func.call @cc_values_pack(%3602) : (i64) -> i64
      func.call @stack_push_pointer(%3600) : (i64) -> ()
      %3604 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3605 = arith.constant 10 : i64
      %3606 = func.call @cc_make_string(%3604, %3605) : (!llvm.ptr, i64) -> i64
      %3607 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3608 = arith.constant 11 : i64
      %3609 = func.call @cc_make_string(%3607, %3608) : (!llvm.ptr, i64) -> i64
      %3610 = func.call @cc_intern(%3606, %3609) : (i64, i64) -> i64
      %3611 = func.call @cc_nil_value() : () -> i64
      %3612 = func.call @cc_cons(%3610, %3611) : (i64, i64) -> i64
      %3613 = func.call @cc_values_pack(%3612) : (i64) -> i64
      func.call @stack_push_pointer(%3610) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3614 = func.call @stack_pop_pointer() : () -> i64
      %3615 = func.call @stack_pop_pointer() : () -> i64
      %3616 = func.call @cc_cons(%3615, %3614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3616) : (i64) -> ()
      %3617 = func.call @stack_pop_pointer() : () -> i64
      %3618 = func.call @stack_pop_pointer() : () -> i64
      %3619 = func.call @cc_cons(%3618, %3617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3619) : (i64) -> ()
      %3620 = func.call @stack_pop_pointer() : () -> i64
      %3621 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3622 = arith.constant 11 : i64
      %3623 = func.call @cc_make_string(%3621, %3622) : (!llvm.ptr, i64) -> i64
      %3624 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3625 = arith.constant 7 : i64
      %3626 = func.call @cc_make_string(%3624, %3625) : (!llvm.ptr, i64) -> i64
      %3627 = func.call @cc_intern(%3623, %3626) : (i64, i64) -> i64
      %3628 = func.call @cc_nil_value() : () -> i64
      %3629 = func.call @cc_cons(%3627, %3628) : (i64, i64) -> i64
      %3630 = func.call @cc_values_pack(%3629) : (i64) -> i64
      func.call @stack_push_pointer(%3627) : (i64) -> ()
      %3631 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3632 = func.call @stack_pop_pointer() : () -> i64
      %3633 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3634 = arith.constant 4 : i64
      %3635 = func.call @cc_make_string(%3633, %3634) : (!llvm.ptr, i64) -> i64
      %3636 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3637 = arith.constant 7 : i64
      %3638 = func.call @cc_make_string(%3636, %3637) : (!llvm.ptr, i64) -> i64
      %3639 = func.call @cc_intern(%3635, %3638) : (i64, i64) -> i64
      %3640 = func.call @cc_nil_value() : () -> i64
      %3641 = func.call @cc_cons(%3639, %3640) : (i64, i64) -> i64
      %3642 = func.call @cc_values_pack(%3641) : (i64) -> i64
      func.call @stack_push_pointer(%3639) : (i64) -> ()
      %3643 = func.call @stack_pop_pointer() : () -> i64
      %3644 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3645 = arith.constant 5 : i64
      %3646 = func.call @cc_make_string(%3644, %3645) : (!llvm.ptr, i64) -> i64
      %3647 = func.call @cc_nil_value() : () -> i64
      %3648 = func.call @cc_intern(%3646, %3647) : (i64, i64) -> i64
      %3649 = func.call @cc_nil_value() : () -> i64
      %3650 = func.call @cc_cons(%3648, %3649) : (i64, i64) -> i64
      %3651 = func.call @cc_values_pack(%3650) : (i64) -> i64
      func.call @stack_push_pointer(%3648) : (i64) -> ()
      %3652 = func.call @stack_pop_pointer() : () -> i64
      %3653 = func.call @cc_nil_value() : () -> i64
      %3654 = func.call @cc_errorp(%3458) : (i64) -> i64
      %3655 = arith.cmpi ne, %3654, %3653 : i64
      %3656 = arith.cmpi eq, %3653, %3653 : i64
      %3657 = arith.andi %3655, %3656 : i1
      %3658 = scf.if %3657 -> (i64) {
        scf.yield %3458 : i64
      } else {
        scf.yield %3653 : i64
      }
      %3659 = func.call @cc_errorp(%3535) : (i64) -> i64
      %3660 = arith.cmpi ne, %3659, %3653 : i64
      %3661 = arith.cmpi eq, %3658, %3653 : i64
      %3662 = arith.andi %3660, %3661 : i1
      %3663 = scf.if %3662 -> (i64) {
        scf.yield %3535 : i64
      } else {
        scf.yield %3658 : i64
      }
      %3664 = func.call @cc_errorp(%3595) : (i64) -> i64
      %3665 = arith.cmpi ne, %3664, %3653 : i64
      %3666 = arith.cmpi eq, %3663, %3653 : i64
      %3667 = arith.andi %3665, %3666 : i1
      %3668 = scf.if %3667 -> (i64) {
        scf.yield %3595 : i64
      } else {
        scf.yield %3663 : i64
      }
      %3669 = func.call @cc_errorp(%3620) : (i64) -> i64
      %3670 = arith.cmpi ne, %3669, %3653 : i64
      %3671 = arith.cmpi eq, %3668, %3653 : i64
      %3672 = arith.andi %3670, %3671 : i1
      %3673 = scf.if %3672 -> (i64) {
        scf.yield %3620 : i64
      } else {
        scf.yield %3668 : i64
      }
      %3674 = func.call @cc_errorp(%3631) : (i64) -> i64
      %3675 = arith.cmpi ne, %3674, %3653 : i64
      %3676 = arith.cmpi eq, %3673, %3653 : i64
      %3677 = arith.andi %3675, %3676 : i1
      %3678 = scf.if %3677 -> (i64) {
        scf.yield %3631 : i64
      } else {
        scf.yield %3673 : i64
      }
      %3679 = func.call @cc_errorp(%3632) : (i64) -> i64
      %3680 = arith.cmpi ne, %3679, %3653 : i64
      %3681 = arith.cmpi eq, %3678, %3653 : i64
      %3682 = arith.andi %3680, %3681 : i1
      %3683 = scf.if %3682 -> (i64) {
        scf.yield %3632 : i64
      } else {
        scf.yield %3678 : i64
      }
      %3684 = func.call @cc_errorp(%3643) : (i64) -> i64
      %3685 = arith.cmpi ne, %3684, %3653 : i64
      %3686 = arith.cmpi eq, %3683, %3653 : i64
      %3687 = arith.andi %3685, %3686 : i1
      %3688 = scf.if %3687 -> (i64) {
        scf.yield %3643 : i64
      } else {
        scf.yield %3683 : i64
      }
      %3689 = func.call @cc_errorp(%3652) : (i64) -> i64
      %3690 = arith.cmpi ne, %3689, %3653 : i64
      %3691 = arith.cmpi eq, %3688, %3653 : i64
      %3692 = arith.andi %3690, %3691 : i1
      %3693 = scf.if %3692 -> (i64) {
        scf.yield %3652 : i64
      } else {
        scf.yield %3688 : i64
      }
      %3694 = arith.cmpi ne, %3693, %3653 : i64
      scf.if %3694 {
        func.call @stack_push_pointer(%3693) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3458) : (i64) -> ()
        func.call @stack_push_pointer(%3535) : (i64) -> ()
        func.call @stack_push_pointer(%3595) : (i64) -> ()
        func.call @stack_push_pointer(%3620) : (i64) -> ()
        func.call @stack_push_pointer(%3631) : (i64) -> ()
        func.call @stack_push_pointer(%3632) : (i64) -> ()
        func.call @stack_push_pointer(%3643) : (i64) -> ()
        func.call @stack_push_pointer(%3652) : (i64) -> ()
        %3695 = llvm.mlir.addressof @str275 : !llvm.ptr
        %3696 = func.call @cc_make_function_ref_const(%3695) : (!llvm.ptr) -> i64
        %3697 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3696, %3697) : (i64, i64) -> ()
      }
      %3698 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3698 : i64
    }
    %3699 = func.call @cc_nil_value() : () -> i64
    %3700 = func.call @cc_errorp(%3449) : (i64) -> i64
    %3701 = arith.cmpi ne, %3700, %3699 : i64
    %3702 = scf.if %3701 -> (i64) {
      scf.yield %3449 : i64
    } else {
      %3703 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3704 = arith.constant 12 : i64
      %3705 = func.call @cc_make_string(%3703, %3704) : (!llvm.ptr, i64) -> i64
      %3706 = func.call @cc_nil_value() : () -> i64
      %3707 = func.call @cc_intern(%3705, %3706) : (i64, i64) -> i64
      %3708 = func.call @cc_nil_value() : () -> i64
      %3709 = func.call @cc_cons(%3707, %3708) : (i64, i64) -> i64
      %3710 = func.call @cc_values_pack(%3709) : (i64) -> i64
      func.call @stack_push_pointer(%3707) : (i64) -> ()
      %3711 = func.call @stack_pop_pointer() : () -> i64
      %3712 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3713 = arith.constant 13 : i64
      %3714 = func.call @cc_make_string(%3712, %3713) : (!llvm.ptr, i64) -> i64
      %3715 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3716 = arith.constant 11 : i64
      %3717 = func.call @cc_make_string(%3715, %3716) : (!llvm.ptr, i64) -> i64
      %3718 = func.call @cc_intern(%3714, %3717) : (i64, i64) -> i64
      %3719 = func.call @cc_nil_value() : () -> i64
      %3720 = func.call @cc_cons(%3718, %3719) : (i64, i64) -> i64
      %3721 = func.call @cc_values_pack(%3720) : (i64) -> i64
      func.call @stack_push_pointer(%3718) : (i64) -> ()
      %3722 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3723 = arith.constant 6 : i64
      %3724 = func.call @cc_make_string(%3722, %3723) : (!llvm.ptr, i64) -> i64
      %3725 = func.call @cc_nil_value() : () -> i64
      %3726 = func.call @cc_intern(%3724, %3725) : (i64, i64) -> i64
      %3727 = func.call @cc_nil_value() : () -> i64
      %3728 = func.call @cc_cons(%3726, %3727) : (i64, i64) -> i64
      %3729 = func.call @cc_values_pack(%3728) : (i64) -> i64
      func.call @stack_push_pointer(%3726) : (i64) -> ()
      %3730 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3731 = arith.constant 19 : i64
      %3732 = func.call @cc_make_string(%3730, %3731) : (!llvm.ptr, i64) -> i64
      %3733 = func.call @cc_nil_value() : () -> i64
      %3734 = func.call @cc_intern(%3732, %3733) : (i64, i64) -> i64
      %3735 = func.call @cc_nil_value() : () -> i64
      %3736 = func.call @cc_cons(%3734, %3735) : (i64, i64) -> i64
      %3737 = func.call @cc_values_pack(%3736) : (i64) -> i64
      func.call @stack_push_pointer(%3734) : (i64) -> ()
      %3738 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3739 = arith.constant 5 : i64
      %3740 = func.call @cc_make_string(%3738, %3739) : (!llvm.ptr, i64) -> i64
      %3741 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3742 = arith.constant 11 : i64
      %3743 = func.call @cc_make_string(%3741, %3742) : (!llvm.ptr, i64) -> i64
      %3744 = func.call @cc_intern(%3740, %3743) : (i64, i64) -> i64
      %3745 = func.call @cc_nil_value() : () -> i64
      %3746 = func.call @cc_cons(%3744, %3745) : (i64, i64) -> i64
      %3747 = func.call @cc_values_pack(%3746) : (i64) -> i64
      func.call @stack_push_pointer(%3744) : (i64) -> ()
      %3748 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3749 = arith.constant 15 : i64
      %3750 = func.call @cc_make_string(%3748, %3749) : (!llvm.ptr, i64) -> i64
      %3751 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3752 = arith.constant 11 : i64
      %3753 = func.call @cc_make_string(%3751, %3752) : (!llvm.ptr, i64) -> i64
      %3754 = func.call @cc_intern(%3750, %3753) : (i64, i64) -> i64
      %3755 = func.call @cc_nil_value() : () -> i64
      %3756 = func.call @cc_cons(%3754, %3755) : (i64, i64) -> i64
      %3757 = func.call @cc_values_pack(%3756) : (i64) -> i64
      func.call @stack_push_pointer(%3754) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3758 = func.call @stack_pop_pointer() : () -> i64
      %3759 = func.call @stack_pop_pointer() : () -> i64
      %3760 = func.call @cc_cons(%3759, %3758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3760) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3761 = func.call @stack_pop_pointer() : () -> i64
      %3762 = func.call @stack_pop_pointer() : () -> i64
      %3763 = func.call @cc_cons(%3762, %3761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3763) : (i64) -> ()
      %3764 = func.call @stack_pop_pointer() : () -> i64
      %3765 = func.call @stack_pop_pointer() : () -> i64
      %3766 = func.call @cc_cons(%3765, %3764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3767 = func.call @stack_pop_pointer() : () -> i64
      %3768 = func.call @stack_pop_pointer() : () -> i64
      %3769 = func.call @cc_cons(%3768, %3767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3769) : (i64) -> ()
      %3770 = func.call @stack_pop_pointer() : () -> i64
      %3771 = func.call @stack_pop_pointer() : () -> i64
      %3772 = func.call @cc_cons(%3771, %3770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3773 = func.call @stack_pop_pointer() : () -> i64
      %3774 = func.call @stack_pop_pointer() : () -> i64
      %3775 = func.call @cc_cons(%3774, %3773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3775) : (i64) -> ()
      %3776 = func.call @stack_pop_pointer() : () -> i64
      %3777 = func.call @stack_pop_pointer() : () -> i64
      %3778 = func.call @cc_cons(%3777, %3776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3778) : (i64) -> ()
      %3779 = func.call @stack_pop_pointer() : () -> i64
      %3780 = func.call @stack_pop_pointer() : () -> i64
      %3781 = func.call @cc_cons(%3780, %3779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3781) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3782 = func.call @stack_pop_pointer() : () -> i64
      %3783 = func.call @stack_pop_pointer() : () -> i64
      %3784 = func.call @cc_cons(%3783, %3782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3784) : (i64) -> ()
      %3785 = func.call @stack_pop_pointer() : () -> i64
      %3786 = func.call @stack_pop_pointer() : () -> i64
      %3787 = func.call @cc_cons(%3786, %3785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3787) : (i64) -> ()
      %3788 = func.call @stack_pop_pointer() : () -> i64
      %3845 = arith.constant 209815645192209 : i64
      %3846 = arith.constant 0 : i64
      %3847 = func.call @cc_make_closure(%3845, %3846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3847) : (i64) -> ()
      %3848 = func.call @stack_pop_pointer() : () -> i64
      %3849 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3850 = arith.constant 4 : i64
      %3851 = func.call @cc_make_string(%3849, %3850) : (!llvm.ptr, i64) -> i64
      %3852 = func.call @cc_nil_value() : () -> i64
      %3853 = func.call @cc_intern(%3851, %3852) : (i64, i64) -> i64
      %3854 = func.call @cc_nil_value() : () -> i64
      %3855 = func.call @cc_cons(%3853, %3854) : (i64, i64) -> i64
      %3856 = func.call @cc_values_pack(%3855) : (i64) -> i64
      func.call @stack_push_pointer(%3853) : (i64) -> ()
      %3857 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3858 = arith.constant 10 : i64
      %3859 = func.call @cc_make_string(%3857, %3858) : (!llvm.ptr, i64) -> i64
      %3860 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3861 = arith.constant 11 : i64
      %3862 = func.call @cc_make_string(%3860, %3861) : (!llvm.ptr, i64) -> i64
      %3863 = func.call @cc_intern(%3859, %3862) : (i64, i64) -> i64
      %3864 = func.call @cc_nil_value() : () -> i64
      %3865 = func.call @cc_cons(%3863, %3864) : (i64, i64) -> i64
      %3866 = func.call @cc_values_pack(%3865) : (i64) -> i64
      func.call @stack_push_pointer(%3863) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3867 = func.call @stack_pop_pointer() : () -> i64
      %3868 = func.call @stack_pop_pointer() : () -> i64
      %3869 = func.call @cc_cons(%3868, %3867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3869) : (i64) -> ()
      %3870 = func.call @stack_pop_pointer() : () -> i64
      %3871 = func.call @stack_pop_pointer() : () -> i64
      %3872 = func.call @cc_cons(%3871, %3870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3872) : (i64) -> ()
      %3873 = func.call @stack_pop_pointer() : () -> i64
      %3874 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3875 = arith.constant 11 : i64
      %3876 = func.call @cc_make_string(%3874, %3875) : (!llvm.ptr, i64) -> i64
      %3877 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3878 = arith.constant 7 : i64
      %3879 = func.call @cc_make_string(%3877, %3878) : (!llvm.ptr, i64) -> i64
      %3880 = func.call @cc_intern(%3876, %3879) : (i64, i64) -> i64
      %3881 = func.call @cc_nil_value() : () -> i64
      %3882 = func.call @cc_cons(%3880, %3881) : (i64, i64) -> i64
      %3883 = func.call @cc_values_pack(%3882) : (i64) -> i64
      func.call @stack_push_pointer(%3880) : (i64) -> ()
      %3884 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3885 = func.call @stack_pop_pointer() : () -> i64
      %3886 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3887 = arith.constant 4 : i64
      %3888 = func.call @cc_make_string(%3886, %3887) : (!llvm.ptr, i64) -> i64
      %3889 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3890 = arith.constant 7 : i64
      %3891 = func.call @cc_make_string(%3889, %3890) : (!llvm.ptr, i64) -> i64
      %3892 = func.call @cc_intern(%3888, %3891) : (i64, i64) -> i64
      %3893 = func.call @cc_nil_value() : () -> i64
      %3894 = func.call @cc_cons(%3892, %3893) : (i64, i64) -> i64
      %3895 = func.call @cc_values_pack(%3894) : (i64) -> i64
      func.call @stack_push_pointer(%3892) : (i64) -> ()
      %3896 = func.call @stack_pop_pointer() : () -> i64
      %3897 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3898 = arith.constant 5 : i64
      %3899 = func.call @cc_make_string(%3897, %3898) : (!llvm.ptr, i64) -> i64
      %3900 = func.call @cc_nil_value() : () -> i64
      %3901 = func.call @cc_intern(%3899, %3900) : (i64, i64) -> i64
      %3902 = func.call @cc_nil_value() : () -> i64
      %3903 = func.call @cc_cons(%3901, %3902) : (i64, i64) -> i64
      %3904 = func.call @cc_values_pack(%3903) : (i64) -> i64
      func.call @stack_push_pointer(%3901) : (i64) -> ()
      %3905 = func.call @stack_pop_pointer() : () -> i64
      %3906 = func.call @cc_nil_value() : () -> i64
      %3907 = func.call @cc_errorp(%3711) : (i64) -> i64
      %3908 = arith.cmpi ne, %3907, %3906 : i64
      %3909 = arith.cmpi eq, %3906, %3906 : i64
      %3910 = arith.andi %3908, %3909 : i1
      %3911 = scf.if %3910 -> (i64) {
        scf.yield %3711 : i64
      } else {
        scf.yield %3906 : i64
      }
      %3912 = func.call @cc_errorp(%3788) : (i64) -> i64
      %3913 = arith.cmpi ne, %3912, %3906 : i64
      %3914 = arith.cmpi eq, %3911, %3906 : i64
      %3915 = arith.andi %3913, %3914 : i1
      %3916 = scf.if %3915 -> (i64) {
        scf.yield %3788 : i64
      } else {
        scf.yield %3911 : i64
      }
      %3917 = func.call @cc_errorp(%3848) : (i64) -> i64
      %3918 = arith.cmpi ne, %3917, %3906 : i64
      %3919 = arith.cmpi eq, %3916, %3906 : i64
      %3920 = arith.andi %3918, %3919 : i1
      %3921 = scf.if %3920 -> (i64) {
        scf.yield %3848 : i64
      } else {
        scf.yield %3916 : i64
      }
      %3922 = func.call @cc_errorp(%3873) : (i64) -> i64
      %3923 = arith.cmpi ne, %3922, %3906 : i64
      %3924 = arith.cmpi eq, %3921, %3906 : i64
      %3925 = arith.andi %3923, %3924 : i1
      %3926 = scf.if %3925 -> (i64) {
        scf.yield %3873 : i64
      } else {
        scf.yield %3921 : i64
      }
      %3927 = func.call @cc_errorp(%3884) : (i64) -> i64
      %3928 = arith.cmpi ne, %3927, %3906 : i64
      %3929 = arith.cmpi eq, %3926, %3906 : i64
      %3930 = arith.andi %3928, %3929 : i1
      %3931 = scf.if %3930 -> (i64) {
        scf.yield %3884 : i64
      } else {
        scf.yield %3926 : i64
      }
      %3932 = func.call @cc_errorp(%3885) : (i64) -> i64
      %3933 = arith.cmpi ne, %3932, %3906 : i64
      %3934 = arith.cmpi eq, %3931, %3906 : i64
      %3935 = arith.andi %3933, %3934 : i1
      %3936 = scf.if %3935 -> (i64) {
        scf.yield %3885 : i64
      } else {
        scf.yield %3931 : i64
      }
      %3937 = func.call @cc_errorp(%3896) : (i64) -> i64
      %3938 = arith.cmpi ne, %3937, %3906 : i64
      %3939 = arith.cmpi eq, %3936, %3906 : i64
      %3940 = arith.andi %3938, %3939 : i1
      %3941 = scf.if %3940 -> (i64) {
        scf.yield %3896 : i64
      } else {
        scf.yield %3936 : i64
      }
      %3942 = func.call @cc_errorp(%3905) : (i64) -> i64
      %3943 = arith.cmpi ne, %3942, %3906 : i64
      %3944 = arith.cmpi eq, %3941, %3906 : i64
      %3945 = arith.andi %3943, %3944 : i1
      %3946 = scf.if %3945 -> (i64) {
        scf.yield %3905 : i64
      } else {
        scf.yield %3941 : i64
      }
      %3947 = arith.cmpi ne, %3946, %3906 : i64
      scf.if %3947 {
        func.call @stack_push_pointer(%3946) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3711) : (i64) -> ()
        func.call @stack_push_pointer(%3788) : (i64) -> ()
        func.call @stack_push_pointer(%3848) : (i64) -> ()
        func.call @stack_push_pointer(%3873) : (i64) -> ()
        func.call @stack_push_pointer(%3884) : (i64) -> ()
        func.call @stack_push_pointer(%3885) : (i64) -> ()
        func.call @stack_push_pointer(%3896) : (i64) -> ()
        func.call @stack_push_pointer(%3905) : (i64) -> ()
        %3948 = llvm.mlir.addressof @str294 : !llvm.ptr
        %3949 = func.call @cc_make_function_ref_const(%3948) : (!llvm.ptr) -> i64
        %3950 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3949, %3950) : (i64, i64) -> ()
      }
      %3951 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3951 : i64
    }
    %3952 = func.call @cc_nil_value() : () -> i64
    %3953 = func.call @cc_errorp(%3702) : (i64) -> i64
    %3954 = arith.cmpi ne, %3953, %3952 : i64
    %3955 = scf.if %3954 -> (i64) {
      scf.yield %3702 : i64
    } else {
      %3956 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3957 = arith.constant 12 : i64
      %3958 = func.call @cc_make_string(%3956, %3957) : (!llvm.ptr, i64) -> i64
      %3959 = func.call @cc_nil_value() : () -> i64
      %3960 = func.call @cc_intern(%3958, %3959) : (i64, i64) -> i64
      %3961 = func.call @cc_nil_value() : () -> i64
      %3962 = func.call @cc_cons(%3960, %3961) : (i64, i64) -> i64
      %3963 = func.call @cc_values_pack(%3962) : (i64) -> i64
      func.call @stack_push_pointer(%3960) : (i64) -> ()
      %3964 = func.call @stack_pop_pointer() : () -> i64
      %3965 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3966 = arith.constant 13 : i64
      %3967 = func.call @cc_make_string(%3965, %3966) : (!llvm.ptr, i64) -> i64
      %3968 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3969 = arith.constant 11 : i64
      %3970 = func.call @cc_make_string(%3968, %3969) : (!llvm.ptr, i64) -> i64
      %3971 = func.call @cc_intern(%3967, %3970) : (i64, i64) -> i64
      %3972 = func.call @cc_nil_value() : () -> i64
      %3973 = func.call @cc_cons(%3971, %3972) : (i64, i64) -> i64
      %3974 = func.call @cc_values_pack(%3973) : (i64) -> i64
      func.call @stack_push_pointer(%3971) : (i64) -> ()
      %3975 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3976 = arith.constant 6 : i64
      %3977 = func.call @cc_make_string(%3975, %3976) : (!llvm.ptr, i64) -> i64
      %3978 = func.call @cc_nil_value() : () -> i64
      %3979 = func.call @cc_intern(%3977, %3978) : (i64, i64) -> i64
      %3980 = func.call @cc_nil_value() : () -> i64
      %3981 = func.call @cc_cons(%3979, %3980) : (i64, i64) -> i64
      %3982 = func.call @cc_values_pack(%3981) : (i64) -> i64
      func.call @stack_push_pointer(%3979) : (i64) -> ()
      %3983 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3984 = arith.constant 19 : i64
      %3985 = func.call @cc_make_string(%3983, %3984) : (!llvm.ptr, i64) -> i64
      %3986 = func.call @cc_nil_value() : () -> i64
      %3987 = func.call @cc_intern(%3985, %3986) : (i64, i64) -> i64
      %3988 = func.call @cc_nil_value() : () -> i64
      %3989 = func.call @cc_cons(%3987, %3988) : (i64, i64) -> i64
      %3990 = func.call @cc_values_pack(%3989) : (i64) -> i64
      func.call @stack_push_pointer(%3987) : (i64) -> ()
      %3991 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3992 = arith.constant 6 : i64
      %3993 = func.call @cc_make_string(%3991, %3992) : (!llvm.ptr, i64) -> i64
      %3994 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3995 = arith.constant 11 : i64
      %3996 = func.call @cc_make_string(%3994, %3995) : (!llvm.ptr, i64) -> i64
      %3997 = func.call @cc_intern(%3993, %3996) : (i64, i64) -> i64
      %3998 = func.call @cc_nil_value() : () -> i64
      %3999 = func.call @cc_cons(%3997, %3998) : (i64, i64) -> i64
      %4000 = func.call @cc_values_pack(%3999) : (i64) -> i64
      func.call @stack_push_pointer(%3997) : (i64) -> ()
      %4001 = llvm.mlir.addressof @str302 : !llvm.ptr
      %4002 = arith.constant 15 : i64
      %4003 = func.call @cc_make_string(%4001, %4002) : (!llvm.ptr, i64) -> i64
      %4004 = llvm.mlir.addressof @str303 : !llvm.ptr
      %4005 = arith.constant 11 : i64
      %4006 = func.call @cc_make_string(%4004, %4005) : (!llvm.ptr, i64) -> i64
      %4007 = func.call @cc_intern(%4003, %4006) : (i64, i64) -> i64
      %4008 = func.call @cc_nil_value() : () -> i64
      %4009 = func.call @cc_cons(%4007, %4008) : (i64, i64) -> i64
      %4010 = func.call @cc_values_pack(%4009) : (i64) -> i64
      func.call @stack_push_pointer(%4007) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4011 = func.call @stack_pop_pointer() : () -> i64
      %4012 = func.call @stack_pop_pointer() : () -> i64
      %4013 = func.call @cc_cons(%4012, %4011) : (i64, i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %4020 = func.call @stack_pop_pointer() : () -> i64
      %4021 = func.call @stack_pop_pointer() : () -> i64
      %4022 = func.call @cc_cons(%4021, %4020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4022) : (i64) -> ()
      %4023 = func.call @stack_pop_pointer() : () -> i64
      %4024 = func.call @stack_pop_pointer() : () -> i64
      %4025 = func.call @cc_cons(%4024, %4023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4026 = func.call @stack_pop_pointer() : () -> i64
      %4027 = func.call @stack_pop_pointer() : () -> i64
      %4028 = func.call @cc_cons(%4027, %4026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4028) : (i64) -> ()
      %4029 = func.call @stack_pop_pointer() : () -> i64
      %4030 = func.call @stack_pop_pointer() : () -> i64
      %4031 = func.call @cc_cons(%4030, %4029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4031) : (i64) -> ()
      %4032 = func.call @stack_pop_pointer() : () -> i64
      %4033 = func.call @stack_pop_pointer() : () -> i64
      %4034 = func.call @cc_cons(%4033, %4032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4034) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4035 = func.call @stack_pop_pointer() : () -> i64
      %4036 = func.call @stack_pop_pointer() : () -> i64
      %4037 = func.call @cc_cons(%4036, %4035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4037) : (i64) -> ()
      %4038 = func.call @stack_pop_pointer() : () -> i64
      %4039 = func.call @stack_pop_pointer() : () -> i64
      %4040 = func.call @cc_cons(%4039, %4038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4040) : (i64) -> ()
      %4041 = func.call @stack_pop_pointer() : () -> i64
      %4098 = arith.constant 209815645192210 : i64
      %4099 = arith.constant 0 : i64
      %4100 = func.call @cc_make_closure(%4098, %4099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4100) : (i64) -> ()
      %4101 = func.call @stack_pop_pointer() : () -> i64
      %4102 = llvm.mlir.addressof @str305 : !llvm.ptr
      %4103 = arith.constant 4 : i64
      %4104 = func.call @cc_make_string(%4102, %4103) : (!llvm.ptr, i64) -> i64
      %4105 = func.call @cc_nil_value() : () -> i64
      %4106 = func.call @cc_intern(%4104, %4105) : (i64, i64) -> i64
      %4107 = func.call @cc_nil_value() : () -> i64
      %4108 = func.call @cc_cons(%4106, %4107) : (i64, i64) -> i64
      %4109 = func.call @cc_values_pack(%4108) : (i64) -> i64
      func.call @stack_push_pointer(%4106) : (i64) -> ()
      %4110 = llvm.mlir.addressof @str306 : !llvm.ptr
      %4111 = arith.constant 10 : i64
      %4112 = func.call @cc_make_string(%4110, %4111) : (!llvm.ptr, i64) -> i64
      %4113 = llvm.mlir.addressof @str307 : !llvm.ptr
      %4114 = arith.constant 11 : i64
      %4115 = func.call @cc_make_string(%4113, %4114) : (!llvm.ptr, i64) -> i64
      %4116 = func.call @cc_intern(%4112, %4115) : (i64, i64) -> i64
      %4117 = func.call @cc_nil_value() : () -> i64
      %4118 = func.call @cc_cons(%4116, %4117) : (i64, i64) -> i64
      %4119 = func.call @cc_values_pack(%4118) : (i64) -> i64
      func.call @stack_push_pointer(%4116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4120 = func.call @stack_pop_pointer() : () -> i64
      %4121 = func.call @stack_pop_pointer() : () -> i64
      %4122 = func.call @cc_cons(%4121, %4120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4122) : (i64) -> ()
      %4123 = func.call @stack_pop_pointer() : () -> i64
      %4124 = func.call @stack_pop_pointer() : () -> i64
      %4125 = func.call @cc_cons(%4124, %4123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4125) : (i64) -> ()
      %4126 = func.call @stack_pop_pointer() : () -> i64
      %4127 = llvm.mlir.addressof @str308 : !llvm.ptr
      %4128 = arith.constant 11 : i64
      %4129 = func.call @cc_make_string(%4127, %4128) : (!llvm.ptr, i64) -> i64
      %4130 = llvm.mlir.addressof @str309 : !llvm.ptr
      %4131 = arith.constant 7 : i64
      %4132 = func.call @cc_make_string(%4130, %4131) : (!llvm.ptr, i64) -> i64
      %4133 = func.call @cc_intern(%4129, %4132) : (i64, i64) -> i64
      %4134 = func.call @cc_nil_value() : () -> i64
      %4135 = func.call @cc_cons(%4133, %4134) : (i64, i64) -> i64
      %4136 = func.call @cc_values_pack(%4135) : (i64) -> i64
      func.call @stack_push_pointer(%4133) : (i64) -> ()
      %4137 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4138 = func.call @stack_pop_pointer() : () -> i64
      %4139 = llvm.mlir.addressof @str310 : !llvm.ptr
      %4140 = arith.constant 4 : i64
      %4141 = func.call @cc_make_string(%4139, %4140) : (!llvm.ptr, i64) -> i64
      %4142 = llvm.mlir.addressof @str311 : !llvm.ptr
      %4143 = arith.constant 7 : i64
      %4144 = func.call @cc_make_string(%4142, %4143) : (!llvm.ptr, i64) -> i64
      %4145 = func.call @cc_intern(%4141, %4144) : (i64, i64) -> i64
      %4146 = func.call @cc_nil_value() : () -> i64
      %4147 = func.call @cc_cons(%4145, %4146) : (i64, i64) -> i64
      %4148 = func.call @cc_values_pack(%4147) : (i64) -> i64
      func.call @stack_push_pointer(%4145) : (i64) -> ()
      %4149 = func.call @stack_pop_pointer() : () -> i64
      %4150 = llvm.mlir.addressof @str312 : !llvm.ptr
      %4151 = arith.constant 5 : i64
      %4152 = func.call @cc_make_string(%4150, %4151) : (!llvm.ptr, i64) -> i64
      %4153 = func.call @cc_nil_value() : () -> i64
      %4154 = func.call @cc_intern(%4152, %4153) : (i64, i64) -> i64
      %4155 = func.call @cc_nil_value() : () -> i64
      %4156 = func.call @cc_cons(%4154, %4155) : (i64, i64) -> i64
      %4157 = func.call @cc_values_pack(%4156) : (i64) -> i64
      func.call @stack_push_pointer(%4154) : (i64) -> ()
      %4158 = func.call @stack_pop_pointer() : () -> i64
      %4159 = func.call @cc_nil_value() : () -> i64
      %4160 = func.call @cc_errorp(%3964) : (i64) -> i64
      %4161 = arith.cmpi ne, %4160, %4159 : i64
      %4162 = arith.cmpi eq, %4159, %4159 : i64
      %4163 = arith.andi %4161, %4162 : i1
      %4164 = scf.if %4163 -> (i64) {
        scf.yield %3964 : i64
      } else {
        scf.yield %4159 : i64
      }
      %4165 = func.call @cc_errorp(%4041) : (i64) -> i64
      %4166 = arith.cmpi ne, %4165, %4159 : i64
      %4167 = arith.cmpi eq, %4164, %4159 : i64
      %4168 = arith.andi %4166, %4167 : i1
      %4169 = scf.if %4168 -> (i64) {
        scf.yield %4041 : i64
      } else {
        scf.yield %4164 : i64
      }
      %4170 = func.call @cc_errorp(%4101) : (i64) -> i64
      %4171 = arith.cmpi ne, %4170, %4159 : i64
      %4172 = arith.cmpi eq, %4169, %4159 : i64
      %4173 = arith.andi %4171, %4172 : i1
      %4174 = scf.if %4173 -> (i64) {
        scf.yield %4101 : i64
      } else {
        scf.yield %4169 : i64
      }
      %4175 = func.call @cc_errorp(%4126) : (i64) -> i64
      %4176 = arith.cmpi ne, %4175, %4159 : i64
      %4177 = arith.cmpi eq, %4174, %4159 : i64
      %4178 = arith.andi %4176, %4177 : i1
      %4179 = scf.if %4178 -> (i64) {
        scf.yield %4126 : i64
      } else {
        scf.yield %4174 : i64
      }
      %4180 = func.call @cc_errorp(%4137) : (i64) -> i64
      %4181 = arith.cmpi ne, %4180, %4159 : i64
      %4182 = arith.cmpi eq, %4179, %4159 : i64
      %4183 = arith.andi %4181, %4182 : i1
      %4184 = scf.if %4183 -> (i64) {
        scf.yield %4137 : i64
      } else {
        scf.yield %4179 : i64
      }
      %4185 = func.call @cc_errorp(%4138) : (i64) -> i64
      %4186 = arith.cmpi ne, %4185, %4159 : i64
      %4187 = arith.cmpi eq, %4184, %4159 : i64
      %4188 = arith.andi %4186, %4187 : i1
      %4189 = scf.if %4188 -> (i64) {
        scf.yield %4138 : i64
      } else {
        scf.yield %4184 : i64
      }
      %4190 = func.call @cc_errorp(%4149) : (i64) -> i64
      %4191 = arith.cmpi ne, %4190, %4159 : i64
      %4192 = arith.cmpi eq, %4189, %4159 : i64
      %4193 = arith.andi %4191, %4192 : i1
      %4194 = scf.if %4193 -> (i64) {
        scf.yield %4149 : i64
      } else {
        scf.yield %4189 : i64
      }
      %4195 = func.call @cc_errorp(%4158) : (i64) -> i64
      %4196 = arith.cmpi ne, %4195, %4159 : i64
      %4197 = arith.cmpi eq, %4194, %4159 : i64
      %4198 = arith.andi %4196, %4197 : i1
      %4199 = scf.if %4198 -> (i64) {
        scf.yield %4158 : i64
      } else {
        scf.yield %4194 : i64
      }
      %4200 = arith.cmpi ne, %4199, %4159 : i64
      scf.if %4200 {
        func.call @stack_push_pointer(%4199) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3964) : (i64) -> ()
        func.call @stack_push_pointer(%4041) : (i64) -> ()
        func.call @stack_push_pointer(%4101) : (i64) -> ()
        func.call @stack_push_pointer(%4126) : (i64) -> ()
        func.call @stack_push_pointer(%4137) : (i64) -> ()
        func.call @stack_push_pointer(%4138) : (i64) -> ()
        func.call @stack_push_pointer(%4149) : (i64) -> ()
        func.call @stack_push_pointer(%4158) : (i64) -> ()
        %4201 = llvm.mlir.addressof @str313 : !llvm.ptr
        %4202 = func.call @cc_make_function_ref_const(%4201) : (!llvm.ptr) -> i64
        %4203 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4202, %4203) : (i64, i64) -> ()
      }
      %4204 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4204 : i64
    }
    %4205 = func.call @cc_nil_value() : () -> i64
    %4206 = func.call @cc_errorp(%3955) : (i64) -> i64
    %4207 = arith.cmpi ne, %4206, %4205 : i64
    %4208 = scf.if %4207 -> (i64) {
      scf.yield %3955 : i64
    } else {
      %4209 = llvm.mlir.addressof @str314 : !llvm.ptr
      %4210 = arith.constant 12 : i64
      %4211 = func.call @cc_make_string(%4209, %4210) : (!llvm.ptr, i64) -> i64
      %4212 = func.call @cc_nil_value() : () -> i64
      %4213 = func.call @cc_intern(%4211, %4212) : (i64, i64) -> i64
      %4214 = func.call @cc_nil_value() : () -> i64
      %4215 = func.call @cc_cons(%4213, %4214) : (i64, i64) -> i64
      %4216 = func.call @cc_values_pack(%4215) : (i64) -> i64
      func.call @stack_push_pointer(%4213) : (i64) -> ()
      %4217 = func.call @stack_pop_pointer() : () -> i64
      %4218 = llvm.mlir.addressof @str315 : !llvm.ptr
      %4219 = arith.constant 13 : i64
      %4220 = func.call @cc_make_string(%4218, %4219) : (!llvm.ptr, i64) -> i64
      %4221 = llvm.mlir.addressof @str316 : !llvm.ptr
      %4222 = arith.constant 11 : i64
      %4223 = func.call @cc_make_string(%4221, %4222) : (!llvm.ptr, i64) -> i64
      %4224 = func.call @cc_intern(%4220, %4223) : (i64, i64) -> i64
      %4225 = func.call @cc_nil_value() : () -> i64
      %4226 = func.call @cc_cons(%4224, %4225) : (i64, i64) -> i64
      %4227 = func.call @cc_values_pack(%4226) : (i64) -> i64
      func.call @stack_push_pointer(%4224) : (i64) -> ()
      %4228 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4229 = arith.constant 6 : i64
      %4230 = func.call @cc_make_string(%4228, %4229) : (!llvm.ptr, i64) -> i64
      %4231 = func.call @cc_nil_value() : () -> i64
      %4232 = func.call @cc_intern(%4230, %4231) : (i64, i64) -> i64
      %4233 = func.call @cc_nil_value() : () -> i64
      %4234 = func.call @cc_cons(%4232, %4233) : (i64, i64) -> i64
      %4235 = func.call @cc_values_pack(%4234) : (i64) -> i64
      func.call @stack_push_pointer(%4232) : (i64) -> ()
      %4236 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4237 = arith.constant 19 : i64
      %4238 = func.call @cc_make_string(%4236, %4237) : (!llvm.ptr, i64) -> i64
      %4239 = func.call @cc_nil_value() : () -> i64
      %4240 = func.call @cc_intern(%4238, %4239) : (i64, i64) -> i64
      %4241 = func.call @cc_nil_value() : () -> i64
      %4242 = func.call @cc_cons(%4240, %4241) : (i64, i64) -> i64
      %4243 = func.call @cc_values_pack(%4242) : (i64) -> i64
      func.call @stack_push_pointer(%4240) : (i64) -> ()
      %4244 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4245 = arith.constant 6 : i64
      %4246 = func.call @cc_make_string(%4244, %4245) : (!llvm.ptr, i64) -> i64
      %4247 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4248 = arith.constant 11 : i64
      %4249 = func.call @cc_make_string(%4247, %4248) : (!llvm.ptr, i64) -> i64
      %4250 = func.call @cc_intern(%4246, %4249) : (i64, i64) -> i64
      %4251 = func.call @cc_nil_value() : () -> i64
      %4252 = func.call @cc_cons(%4250, %4251) : (i64, i64) -> i64
      %4253 = func.call @cc_values_pack(%4252) : (i64) -> i64
      func.call @stack_push_pointer(%4250) : (i64) -> ()
      %4254 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4255 = arith.constant 15 : i64
      %4256 = func.call @cc_make_string(%4254, %4255) : (!llvm.ptr, i64) -> i64
      %4257 = llvm.mlir.addressof @str322 : !llvm.ptr
      %4258 = arith.constant 11 : i64
      %4259 = func.call @cc_make_string(%4257, %4258) : (!llvm.ptr, i64) -> i64
      %4260 = func.call @cc_intern(%4256, %4259) : (i64, i64) -> i64
      %4261 = func.call @cc_nil_value() : () -> i64
      %4262 = func.call @cc_cons(%4260, %4261) : (i64, i64) -> i64
      %4263 = func.call @cc_values_pack(%4262) : (i64) -> i64
      func.call @stack_push_pointer(%4260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4264 = func.call @stack_pop_pointer() : () -> i64
      %4265 = func.call @stack_pop_pointer() : () -> i64
      %4266 = func.call @cc_cons(%4265, %4264) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4266) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4267 = func.call @stack_pop_pointer() : () -> i64
      %4268 = func.call @stack_pop_pointer() : () -> i64
      %4269 = func.call @cc_cons(%4268, %4267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4269) : (i64) -> ()
      %4270 = func.call @stack_pop_pointer() : () -> i64
      %4271 = func.call @stack_pop_pointer() : () -> i64
      %4272 = func.call @cc_cons(%4271, %4270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4272) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4273 = func.call @stack_pop_pointer() : () -> i64
      %4274 = func.call @stack_pop_pointer() : () -> i64
      %4275 = func.call @cc_cons(%4274, %4273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4275) : (i64) -> ()
      %4276 = func.call @stack_pop_pointer() : () -> i64
      %4277 = func.call @stack_pop_pointer() : () -> i64
      %4278 = func.call @cc_cons(%4277, %4276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4278) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4279 = func.call @stack_pop_pointer() : () -> i64
      %4280 = func.call @stack_pop_pointer() : () -> i64
      %4281 = func.call @cc_cons(%4280, %4279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4281) : (i64) -> ()
      %4282 = func.call @stack_pop_pointer() : () -> i64
      %4283 = func.call @stack_pop_pointer() : () -> i64
      %4284 = func.call @cc_cons(%4283, %4282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4284) : (i64) -> ()
      %4285 = func.call @stack_pop_pointer() : () -> i64
      %4286 = func.call @stack_pop_pointer() : () -> i64
      %4287 = func.call @cc_cons(%4286, %4285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4287) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4288 = func.call @stack_pop_pointer() : () -> i64
      %4289 = func.call @stack_pop_pointer() : () -> i64
      %4290 = func.call @cc_cons(%4289, %4288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4290) : (i64) -> ()
      %4291 = func.call @stack_pop_pointer() : () -> i64
      %4292 = func.call @stack_pop_pointer() : () -> i64
      %4293 = func.call @cc_cons(%4292, %4291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4293) : (i64) -> ()
      %4294 = func.call @stack_pop_pointer() : () -> i64
      %4351 = arith.constant 209815645192211 : i64
      %4352 = arith.constant 0 : i64
      %4353 = func.call @cc_make_closure(%4351, %4352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4353) : (i64) -> ()
      %4354 = func.call @stack_pop_pointer() : () -> i64
      %4355 = llvm.mlir.addressof @str324 : !llvm.ptr
      %4356 = arith.constant 4 : i64
      %4357 = func.call @cc_make_string(%4355, %4356) : (!llvm.ptr, i64) -> i64
      %4358 = func.call @cc_nil_value() : () -> i64
      %4359 = func.call @cc_intern(%4357, %4358) : (i64, i64) -> i64
      %4360 = func.call @cc_nil_value() : () -> i64
      %4361 = func.call @cc_cons(%4359, %4360) : (i64, i64) -> i64
      %4362 = func.call @cc_values_pack(%4361) : (i64) -> i64
      func.call @stack_push_pointer(%4359) : (i64) -> ()
      %4363 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4364 = arith.constant 10 : i64
      %4365 = func.call @cc_make_string(%4363, %4364) : (!llvm.ptr, i64) -> i64
      %4366 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4367 = arith.constant 11 : i64
      %4368 = func.call @cc_make_string(%4366, %4367) : (!llvm.ptr, i64) -> i64
      %4369 = func.call @cc_intern(%4365, %4368) : (i64, i64) -> i64
      %4370 = func.call @cc_nil_value() : () -> i64
      %4371 = func.call @cc_cons(%4369, %4370) : (i64, i64) -> i64
      %4372 = func.call @cc_values_pack(%4371) : (i64) -> i64
      func.call @stack_push_pointer(%4369) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4373 = func.call @stack_pop_pointer() : () -> i64
      %4374 = func.call @stack_pop_pointer() : () -> i64
      %4375 = func.call @cc_cons(%4374, %4373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4375) : (i64) -> ()
      %4376 = func.call @stack_pop_pointer() : () -> i64
      %4377 = func.call @stack_pop_pointer() : () -> i64
      %4378 = func.call @cc_cons(%4377, %4376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4378) : (i64) -> ()
      %4379 = func.call @stack_pop_pointer() : () -> i64
      %4380 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4381 = arith.constant 11 : i64
      %4382 = func.call @cc_make_string(%4380, %4381) : (!llvm.ptr, i64) -> i64
      %4383 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4384 = arith.constant 7 : i64
      %4385 = func.call @cc_make_string(%4383, %4384) : (!llvm.ptr, i64) -> i64
      %4386 = func.call @cc_intern(%4382, %4385) : (i64, i64) -> i64
      %4387 = func.call @cc_nil_value() : () -> i64
      %4388 = func.call @cc_cons(%4386, %4387) : (i64, i64) -> i64
      %4389 = func.call @cc_values_pack(%4388) : (i64) -> i64
      func.call @stack_push_pointer(%4386) : (i64) -> ()
      %4390 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4391 = func.call @stack_pop_pointer() : () -> i64
      %4392 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4393 = arith.constant 4 : i64
      %4394 = func.call @cc_make_string(%4392, %4393) : (!llvm.ptr, i64) -> i64
      %4395 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4396 = arith.constant 7 : i64
      %4397 = func.call @cc_make_string(%4395, %4396) : (!llvm.ptr, i64) -> i64
      %4398 = func.call @cc_intern(%4394, %4397) : (i64, i64) -> i64
      %4399 = func.call @cc_nil_value() : () -> i64
      %4400 = func.call @cc_cons(%4398, %4399) : (i64, i64) -> i64
      %4401 = func.call @cc_values_pack(%4400) : (i64) -> i64
      func.call @stack_push_pointer(%4398) : (i64) -> ()
      %4402 = func.call @stack_pop_pointer() : () -> i64
      %4403 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4404 = arith.constant 5 : i64
      %4405 = func.call @cc_make_string(%4403, %4404) : (!llvm.ptr, i64) -> i64
      %4406 = func.call @cc_nil_value() : () -> i64
      %4407 = func.call @cc_intern(%4405, %4406) : (i64, i64) -> i64
      %4408 = func.call @cc_nil_value() : () -> i64
      %4409 = func.call @cc_cons(%4407, %4408) : (i64, i64) -> i64
      %4410 = func.call @cc_values_pack(%4409) : (i64) -> i64
      func.call @stack_push_pointer(%4407) : (i64) -> ()
      %4411 = func.call @stack_pop_pointer() : () -> i64
      %4412 = func.call @cc_nil_value() : () -> i64
      %4413 = func.call @cc_errorp(%4217) : (i64) -> i64
      %4414 = arith.cmpi ne, %4413, %4412 : i64
      %4415 = arith.cmpi eq, %4412, %4412 : i64
      %4416 = arith.andi %4414, %4415 : i1
      %4417 = scf.if %4416 -> (i64) {
        scf.yield %4217 : i64
      } else {
        scf.yield %4412 : i64
      }
      %4418 = func.call @cc_errorp(%4294) : (i64) -> i64
      %4419 = arith.cmpi ne, %4418, %4412 : i64
      %4420 = arith.cmpi eq, %4417, %4412 : i64
      %4421 = arith.andi %4419, %4420 : i1
      %4422 = scf.if %4421 -> (i64) {
        scf.yield %4294 : i64
      } else {
        scf.yield %4417 : i64
      }
      %4423 = func.call @cc_errorp(%4354) : (i64) -> i64
      %4424 = arith.cmpi ne, %4423, %4412 : i64
      %4425 = arith.cmpi eq, %4422, %4412 : i64
      %4426 = arith.andi %4424, %4425 : i1
      %4427 = scf.if %4426 -> (i64) {
        scf.yield %4354 : i64
      } else {
        scf.yield %4422 : i64
      }
      %4428 = func.call @cc_errorp(%4379) : (i64) -> i64
      %4429 = arith.cmpi ne, %4428, %4412 : i64
      %4430 = arith.cmpi eq, %4427, %4412 : i64
      %4431 = arith.andi %4429, %4430 : i1
      %4432 = scf.if %4431 -> (i64) {
        scf.yield %4379 : i64
      } else {
        scf.yield %4427 : i64
      }
      %4433 = func.call @cc_errorp(%4390) : (i64) -> i64
      %4434 = arith.cmpi ne, %4433, %4412 : i64
      %4435 = arith.cmpi eq, %4432, %4412 : i64
      %4436 = arith.andi %4434, %4435 : i1
      %4437 = scf.if %4436 -> (i64) {
        scf.yield %4390 : i64
      } else {
        scf.yield %4432 : i64
      }
      %4438 = func.call @cc_errorp(%4391) : (i64) -> i64
      %4439 = arith.cmpi ne, %4438, %4412 : i64
      %4440 = arith.cmpi eq, %4437, %4412 : i64
      %4441 = arith.andi %4439, %4440 : i1
      %4442 = scf.if %4441 -> (i64) {
        scf.yield %4391 : i64
      } else {
        scf.yield %4437 : i64
      }
      %4443 = func.call @cc_errorp(%4402) : (i64) -> i64
      %4444 = arith.cmpi ne, %4443, %4412 : i64
      %4445 = arith.cmpi eq, %4442, %4412 : i64
      %4446 = arith.andi %4444, %4445 : i1
      %4447 = scf.if %4446 -> (i64) {
        scf.yield %4402 : i64
      } else {
        scf.yield %4442 : i64
      }
      %4448 = func.call @cc_errorp(%4411) : (i64) -> i64
      %4449 = arith.cmpi ne, %4448, %4412 : i64
      %4450 = arith.cmpi eq, %4447, %4412 : i64
      %4451 = arith.andi %4449, %4450 : i1
      %4452 = scf.if %4451 -> (i64) {
        scf.yield %4411 : i64
      } else {
        scf.yield %4447 : i64
      }
      %4453 = arith.cmpi ne, %4452, %4412 : i64
      scf.if %4453 {
        func.call @stack_push_pointer(%4452) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4217) : (i64) -> ()
        func.call @stack_push_pointer(%4294) : (i64) -> ()
        func.call @stack_push_pointer(%4354) : (i64) -> ()
        func.call @stack_push_pointer(%4379) : (i64) -> ()
        func.call @stack_push_pointer(%4390) : (i64) -> ()
        func.call @stack_push_pointer(%4391) : (i64) -> ()
        func.call @stack_push_pointer(%4402) : (i64) -> ()
        func.call @stack_push_pointer(%4411) : (i64) -> ()
        %4454 = llvm.mlir.addressof @str332 : !llvm.ptr
        %4455 = func.call @cc_make_function_ref_const(%4454) : (!llvm.ptr) -> i64
        %4456 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4455, %4456) : (i64, i64) -> ()
      }
      %4457 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4457 : i64
    }
    %4458 = func.call @cc_nil_value() : () -> i64
    %4459 = func.call @cc_errorp(%4208) : (i64) -> i64
    %4460 = arith.cmpi ne, %4459, %4458 : i64
    %4461 = scf.if %4460 -> (i64) {
      scf.yield %4208 : i64
    } else {
      %4462 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4463 = arith.constant 12 : i64
      %4464 = func.call @cc_make_string(%4462, %4463) : (!llvm.ptr, i64) -> i64
      %4465 = func.call @cc_nil_value() : () -> i64
      %4466 = func.call @cc_intern(%4464, %4465) : (i64, i64) -> i64
      %4467 = func.call @cc_nil_value() : () -> i64
      %4468 = func.call @cc_cons(%4466, %4467) : (i64, i64) -> i64
      %4469 = func.call @cc_values_pack(%4468) : (i64) -> i64
      func.call @stack_push_pointer(%4466) : (i64) -> ()
      %4470 = func.call @stack_pop_pointer() : () -> i64
      %4471 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4472 = arith.constant 13 : i64
      %4473 = func.call @cc_make_string(%4471, %4472) : (!llvm.ptr, i64) -> i64
      %4474 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4475 = arith.constant 11 : i64
      %4476 = func.call @cc_make_string(%4474, %4475) : (!llvm.ptr, i64) -> i64
      %4477 = func.call @cc_intern(%4473, %4476) : (i64, i64) -> i64
      %4478 = func.call @cc_nil_value() : () -> i64
      %4479 = func.call @cc_cons(%4477, %4478) : (i64, i64) -> i64
      %4480 = func.call @cc_values_pack(%4479) : (i64) -> i64
      func.call @stack_push_pointer(%4477) : (i64) -> ()
      %4481 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4482 = arith.constant 6 : i64
      %4483 = func.call @cc_make_string(%4481, %4482) : (!llvm.ptr, i64) -> i64
      %4484 = func.call @cc_nil_value() : () -> i64
      %4485 = func.call @cc_intern(%4483, %4484) : (i64, i64) -> i64
      %4486 = func.call @cc_nil_value() : () -> i64
      %4487 = func.call @cc_cons(%4485, %4486) : (i64, i64) -> i64
      %4488 = func.call @cc_values_pack(%4487) : (i64) -> i64
      func.call @stack_push_pointer(%4485) : (i64) -> ()
      %4489 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4490 = arith.constant 19 : i64
      %4491 = func.call @cc_make_string(%4489, %4490) : (!llvm.ptr, i64) -> i64
      %4492 = func.call @cc_nil_value() : () -> i64
      %4493 = func.call @cc_intern(%4491, %4492) : (i64, i64) -> i64
      %4494 = func.call @cc_nil_value() : () -> i64
      %4495 = func.call @cc_cons(%4493, %4494) : (i64, i64) -> i64
      %4496 = func.call @cc_values_pack(%4495) : (i64) -> i64
      func.call @stack_push_pointer(%4493) : (i64) -> ()
      %4497 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4498 = arith.constant 10 : i64
      %4499 = func.call @cc_make_string(%4497, %4498) : (!llvm.ptr, i64) -> i64
      %4500 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4501 = arith.constant 11 : i64
      %4502 = func.call @cc_make_string(%4500, %4501) : (!llvm.ptr, i64) -> i64
      %4503 = func.call @cc_intern(%4499, %4502) : (i64, i64) -> i64
      %4504 = func.call @cc_nil_value() : () -> i64
      %4505 = func.call @cc_cons(%4503, %4504) : (i64, i64) -> i64
      %4506 = func.call @cc_values_pack(%4505) : (i64) -> i64
      func.call @stack_push_pointer(%4503) : (i64) -> ()
      %4507 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4508 = arith.constant 15 : i64
      %4509 = func.call @cc_make_string(%4507, %4508) : (!llvm.ptr, i64) -> i64
      %4510 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4511 = arith.constant 11 : i64
      %4512 = func.call @cc_make_string(%4510, %4511) : (!llvm.ptr, i64) -> i64
      %4513 = func.call @cc_intern(%4509, %4512) : (i64, i64) -> i64
      %4514 = func.call @cc_nil_value() : () -> i64
      %4515 = func.call @cc_cons(%4513, %4514) : (i64, i64) -> i64
      %4516 = func.call @cc_values_pack(%4515) : (i64) -> i64
      func.call @stack_push_pointer(%4513) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4517 = func.call @stack_pop_pointer() : () -> i64
      %4518 = func.call @stack_pop_pointer() : () -> i64
      %4519 = func.call @cc_cons(%4518, %4517) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4519) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4520 = func.call @stack_pop_pointer() : () -> i64
      %4521 = func.call @stack_pop_pointer() : () -> i64
      %4522 = func.call @cc_cons(%4521, %4520) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4522) : (i64) -> ()
      %4523 = func.call @stack_pop_pointer() : () -> i64
      %4524 = func.call @stack_pop_pointer() : () -> i64
      %4525 = func.call @cc_cons(%4524, %4523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4525) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4526 = func.call @stack_pop_pointer() : () -> i64
      %4527 = func.call @stack_pop_pointer() : () -> i64
      %4528 = func.call @cc_cons(%4527, %4526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4528) : (i64) -> ()
      %4529 = func.call @stack_pop_pointer() : () -> i64
      %4530 = func.call @stack_pop_pointer() : () -> i64
      %4531 = func.call @cc_cons(%4530, %4529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4531) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4532 = func.call @stack_pop_pointer() : () -> i64
      %4533 = func.call @stack_pop_pointer() : () -> i64
      %4534 = func.call @cc_cons(%4533, %4532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4534) : (i64) -> ()
      %4535 = func.call @stack_pop_pointer() : () -> i64
      %4536 = func.call @stack_pop_pointer() : () -> i64
      %4537 = func.call @cc_cons(%4536, %4535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4537) : (i64) -> ()
      %4538 = func.call @stack_pop_pointer() : () -> i64
      %4539 = func.call @stack_pop_pointer() : () -> i64
      %4540 = func.call @cc_cons(%4539, %4538) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4540) : (i64) -> ()
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
      %4604 = arith.constant 209815645192212 : i64
      %4605 = arith.constant 0 : i64
      %4606 = func.call @cc_make_closure(%4604, %4605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4606) : (i64) -> ()
      %4607 = func.call @stack_pop_pointer() : () -> i64
      %4608 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4609 = arith.constant 4 : i64
      %4610 = func.call @cc_make_string(%4608, %4609) : (!llvm.ptr, i64) -> i64
      %4611 = func.call @cc_nil_value() : () -> i64
      %4612 = func.call @cc_intern(%4610, %4611) : (i64, i64) -> i64
      %4613 = func.call @cc_nil_value() : () -> i64
      %4614 = func.call @cc_cons(%4612, %4613) : (i64, i64) -> i64
      %4615 = func.call @cc_values_pack(%4614) : (i64) -> i64
      func.call @stack_push_pointer(%4612) : (i64) -> ()
      %4616 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4617 = arith.constant 10 : i64
      %4618 = func.call @cc_make_string(%4616, %4617) : (!llvm.ptr, i64) -> i64
      %4619 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4620 = arith.constant 11 : i64
      %4621 = func.call @cc_make_string(%4619, %4620) : (!llvm.ptr, i64) -> i64
      %4622 = func.call @cc_intern(%4618, %4621) : (i64, i64) -> i64
      %4623 = func.call @cc_nil_value() : () -> i64
      %4624 = func.call @cc_cons(%4622, %4623) : (i64, i64) -> i64
      %4625 = func.call @cc_values_pack(%4624) : (i64) -> i64
      func.call @stack_push_pointer(%4622) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4626 = func.call @stack_pop_pointer() : () -> i64
      %4627 = func.call @stack_pop_pointer() : () -> i64
      %4628 = func.call @cc_cons(%4627, %4626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4628) : (i64) -> ()
      %4629 = func.call @stack_pop_pointer() : () -> i64
      %4630 = func.call @stack_pop_pointer() : () -> i64
      %4631 = func.call @cc_cons(%4630, %4629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4631) : (i64) -> ()
      %4632 = func.call @stack_pop_pointer() : () -> i64
      %4633 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4634 = arith.constant 11 : i64
      %4635 = func.call @cc_make_string(%4633, %4634) : (!llvm.ptr, i64) -> i64
      %4636 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4637 = arith.constant 7 : i64
      %4638 = func.call @cc_make_string(%4636, %4637) : (!llvm.ptr, i64) -> i64
      %4639 = func.call @cc_intern(%4635, %4638) : (i64, i64) -> i64
      %4640 = func.call @cc_nil_value() : () -> i64
      %4641 = func.call @cc_cons(%4639, %4640) : (i64, i64) -> i64
      %4642 = func.call @cc_values_pack(%4641) : (i64) -> i64
      func.call @stack_push_pointer(%4639) : (i64) -> ()
      %4643 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4644 = func.call @stack_pop_pointer() : () -> i64
      %4645 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4646 = arith.constant 4 : i64
      %4647 = func.call @cc_make_string(%4645, %4646) : (!llvm.ptr, i64) -> i64
      %4648 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4649 = arith.constant 7 : i64
      %4650 = func.call @cc_make_string(%4648, %4649) : (!llvm.ptr, i64) -> i64
      %4651 = func.call @cc_intern(%4647, %4650) : (i64, i64) -> i64
      %4652 = func.call @cc_nil_value() : () -> i64
      %4653 = func.call @cc_cons(%4651, %4652) : (i64, i64) -> i64
      %4654 = func.call @cc_values_pack(%4653) : (i64) -> i64
      func.call @stack_push_pointer(%4651) : (i64) -> ()
      %4655 = func.call @stack_pop_pointer() : () -> i64
      %4656 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4657 = arith.constant 5 : i64
      %4658 = func.call @cc_make_string(%4656, %4657) : (!llvm.ptr, i64) -> i64
      %4659 = func.call @cc_nil_value() : () -> i64
      %4660 = func.call @cc_intern(%4658, %4659) : (i64, i64) -> i64
      %4661 = func.call @cc_nil_value() : () -> i64
      %4662 = func.call @cc_cons(%4660, %4661) : (i64, i64) -> i64
      %4663 = func.call @cc_values_pack(%4662) : (i64) -> i64
      func.call @stack_push_pointer(%4660) : (i64) -> ()
      %4664 = func.call @stack_pop_pointer() : () -> i64
      %4665 = func.call @cc_nil_value() : () -> i64
      %4666 = func.call @cc_errorp(%4470) : (i64) -> i64
      %4667 = arith.cmpi ne, %4666, %4665 : i64
      %4668 = arith.cmpi eq, %4665, %4665 : i64
      %4669 = arith.andi %4667, %4668 : i1
      %4670 = scf.if %4669 -> (i64) {
        scf.yield %4470 : i64
      } else {
        scf.yield %4665 : i64
      }
      %4671 = func.call @cc_errorp(%4547) : (i64) -> i64
      %4672 = arith.cmpi ne, %4671, %4665 : i64
      %4673 = arith.cmpi eq, %4670, %4665 : i64
      %4674 = arith.andi %4672, %4673 : i1
      %4675 = scf.if %4674 -> (i64) {
        scf.yield %4547 : i64
      } else {
        scf.yield %4670 : i64
      }
      %4676 = func.call @cc_errorp(%4607) : (i64) -> i64
      %4677 = arith.cmpi ne, %4676, %4665 : i64
      %4678 = arith.cmpi eq, %4675, %4665 : i64
      %4679 = arith.andi %4677, %4678 : i1
      %4680 = scf.if %4679 -> (i64) {
        scf.yield %4607 : i64
      } else {
        scf.yield %4675 : i64
      }
      %4681 = func.call @cc_errorp(%4632) : (i64) -> i64
      %4682 = arith.cmpi ne, %4681, %4665 : i64
      %4683 = arith.cmpi eq, %4680, %4665 : i64
      %4684 = arith.andi %4682, %4683 : i1
      %4685 = scf.if %4684 -> (i64) {
        scf.yield %4632 : i64
      } else {
        scf.yield %4680 : i64
      }
      %4686 = func.call @cc_errorp(%4643) : (i64) -> i64
      %4687 = arith.cmpi ne, %4686, %4665 : i64
      %4688 = arith.cmpi eq, %4685, %4665 : i64
      %4689 = arith.andi %4687, %4688 : i1
      %4690 = scf.if %4689 -> (i64) {
        scf.yield %4643 : i64
      } else {
        scf.yield %4685 : i64
      }
      %4691 = func.call @cc_errorp(%4644) : (i64) -> i64
      %4692 = arith.cmpi ne, %4691, %4665 : i64
      %4693 = arith.cmpi eq, %4690, %4665 : i64
      %4694 = arith.andi %4692, %4693 : i1
      %4695 = scf.if %4694 -> (i64) {
        scf.yield %4644 : i64
      } else {
        scf.yield %4690 : i64
      }
      %4696 = func.call @cc_errorp(%4655) : (i64) -> i64
      %4697 = arith.cmpi ne, %4696, %4665 : i64
      %4698 = arith.cmpi eq, %4695, %4665 : i64
      %4699 = arith.andi %4697, %4698 : i1
      %4700 = scf.if %4699 -> (i64) {
        scf.yield %4655 : i64
      } else {
        scf.yield %4695 : i64
      }
      %4701 = func.call @cc_errorp(%4664) : (i64) -> i64
      %4702 = arith.cmpi ne, %4701, %4665 : i64
      %4703 = arith.cmpi eq, %4700, %4665 : i64
      %4704 = arith.andi %4702, %4703 : i1
      %4705 = scf.if %4704 -> (i64) {
        scf.yield %4664 : i64
      } else {
        scf.yield %4700 : i64
      }
      %4706 = arith.cmpi ne, %4705, %4665 : i64
      scf.if %4706 {
        func.call @stack_push_pointer(%4705) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4470) : (i64) -> ()
        func.call @stack_push_pointer(%4547) : (i64) -> ()
        func.call @stack_push_pointer(%4607) : (i64) -> ()
        func.call @stack_push_pointer(%4632) : (i64) -> ()
        func.call @stack_push_pointer(%4643) : (i64) -> ()
        func.call @stack_push_pointer(%4644) : (i64) -> ()
        func.call @stack_push_pointer(%4655) : (i64) -> ()
        func.call @stack_push_pointer(%4664) : (i64) -> ()
        %4707 = llvm.mlir.addressof @str351 : !llvm.ptr
        %4708 = func.call @cc_make_function_ref_const(%4707) : (!llvm.ptr) -> i64
        %4709 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4708, %4709) : (i64, i64) -> ()
      }
      %4710 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4710 : i64
    }
    %4711 = func.call @cc_nil_value() : () -> i64
    %4712 = func.call @cc_errorp(%4461) : (i64) -> i64
    %4713 = arith.cmpi ne, %4712, %4711 : i64
    %4714 = scf.if %4713 -> (i64) {
      scf.yield %4461 : i64
    } else {
      %4715 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4716 = arith.constant 12 : i64
      %4717 = func.call @cc_make_string(%4715, %4716) : (!llvm.ptr, i64) -> i64
      %4718 = func.call @cc_nil_value() : () -> i64
      %4719 = func.call @cc_intern(%4717, %4718) : (i64, i64) -> i64
      %4720 = func.call @cc_nil_value() : () -> i64
      %4721 = func.call @cc_cons(%4719, %4720) : (i64, i64) -> i64
      %4722 = func.call @cc_values_pack(%4721) : (i64) -> i64
      func.call @stack_push_pointer(%4719) : (i64) -> ()
      %4723 = func.call @stack_pop_pointer() : () -> i64
      %4724 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4725 = arith.constant 13 : i64
      %4726 = func.call @cc_make_string(%4724, %4725) : (!llvm.ptr, i64) -> i64
      %4727 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4728 = arith.constant 11 : i64
      %4729 = func.call @cc_make_string(%4727, %4728) : (!llvm.ptr, i64) -> i64
      %4730 = func.call @cc_intern(%4726, %4729) : (i64, i64) -> i64
      %4731 = func.call @cc_nil_value() : () -> i64
      %4732 = func.call @cc_cons(%4730, %4731) : (i64, i64) -> i64
      %4733 = func.call @cc_values_pack(%4732) : (i64) -> i64
      func.call @stack_push_pointer(%4730) : (i64) -> ()
      %4734 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4735 = arith.constant 6 : i64
      %4736 = func.call @cc_make_string(%4734, %4735) : (!llvm.ptr, i64) -> i64
      %4737 = func.call @cc_nil_value() : () -> i64
      %4738 = func.call @cc_intern(%4736, %4737) : (i64, i64) -> i64
      %4739 = func.call @cc_nil_value() : () -> i64
      %4740 = func.call @cc_cons(%4738, %4739) : (i64, i64) -> i64
      %4741 = func.call @cc_values_pack(%4740) : (i64) -> i64
      func.call @stack_push_pointer(%4738) : (i64) -> ()
      %4742 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4743 = arith.constant 19 : i64
      %4744 = func.call @cc_make_string(%4742, %4743) : (!llvm.ptr, i64) -> i64
      %4745 = func.call @cc_nil_value() : () -> i64
      %4746 = func.call @cc_intern(%4744, %4745) : (i64, i64) -> i64
      %4747 = func.call @cc_nil_value() : () -> i64
      %4748 = func.call @cc_cons(%4746, %4747) : (i64, i64) -> i64
      %4749 = func.call @cc_values_pack(%4748) : (i64) -> i64
      func.call @stack_push_pointer(%4746) : (i64) -> ()
      %4750 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4751 = arith.constant 13 : i64
      %4752 = func.call @cc_make_string(%4750, %4751) : (!llvm.ptr, i64) -> i64
      %4753 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4754 = arith.constant 11 : i64
      %4755 = func.call @cc_make_string(%4753, %4754) : (!llvm.ptr, i64) -> i64
      %4756 = func.call @cc_intern(%4752, %4755) : (i64, i64) -> i64
      %4757 = func.call @cc_nil_value() : () -> i64
      %4758 = func.call @cc_cons(%4756, %4757) : (i64, i64) -> i64
      %4759 = func.call @cc_values_pack(%4758) : (i64) -> i64
      func.call @stack_push_pointer(%4756) : (i64) -> ()
      %4760 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4761 = arith.constant 15 : i64
      %4762 = func.call @cc_make_string(%4760, %4761) : (!llvm.ptr, i64) -> i64
      %4763 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4764 = arith.constant 11 : i64
      %4765 = func.call @cc_make_string(%4763, %4764) : (!llvm.ptr, i64) -> i64
      %4766 = func.call @cc_intern(%4762, %4765) : (i64, i64) -> i64
      %4767 = func.call @cc_nil_value() : () -> i64
      %4768 = func.call @cc_cons(%4766, %4767) : (i64, i64) -> i64
      %4769 = func.call @cc_values_pack(%4768) : (i64) -> i64
      func.call @stack_push_pointer(%4766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4770 = func.call @stack_pop_pointer() : () -> i64
      %4771 = func.call @stack_pop_pointer() : () -> i64
      %4772 = func.call @cc_cons(%4771, %4770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4773 = func.call @stack_pop_pointer() : () -> i64
      %4774 = func.call @stack_pop_pointer() : () -> i64
      %4775 = func.call @cc_cons(%4774, %4773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4775) : (i64) -> ()
      %4776 = func.call @stack_pop_pointer() : () -> i64
      %4777 = func.call @stack_pop_pointer() : () -> i64
      %4778 = func.call @cc_cons(%4777, %4776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4778) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4779 = func.call @stack_pop_pointer() : () -> i64
      %4780 = func.call @stack_pop_pointer() : () -> i64
      %4781 = func.call @cc_cons(%4780, %4779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4781) : (i64) -> ()
      %4782 = func.call @stack_pop_pointer() : () -> i64
      %4783 = func.call @stack_pop_pointer() : () -> i64
      %4784 = func.call @cc_cons(%4783, %4782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4784) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4785 = func.call @stack_pop_pointer() : () -> i64
      %4786 = func.call @stack_pop_pointer() : () -> i64
      %4787 = func.call @cc_cons(%4786, %4785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4787) : (i64) -> ()
      %4788 = func.call @stack_pop_pointer() : () -> i64
      %4789 = func.call @stack_pop_pointer() : () -> i64
      %4790 = func.call @cc_cons(%4789, %4788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4790) : (i64) -> ()
      %4791 = func.call @stack_pop_pointer() : () -> i64
      %4792 = func.call @stack_pop_pointer() : () -> i64
      %4793 = func.call @cc_cons(%4792, %4791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4793) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4794 = func.call @stack_pop_pointer() : () -> i64
      %4795 = func.call @stack_pop_pointer() : () -> i64
      %4796 = func.call @cc_cons(%4795, %4794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4796) : (i64) -> ()
      %4797 = func.call @stack_pop_pointer() : () -> i64
      %4798 = func.call @stack_pop_pointer() : () -> i64
      %4799 = func.call @cc_cons(%4798, %4797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4799) : (i64) -> ()
      %4800 = func.call @stack_pop_pointer() : () -> i64
      %4857 = arith.constant 209815645192213 : i64
      %4858 = arith.constant 0 : i64
      %4859 = func.call @cc_make_closure(%4857, %4858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4859) : (i64) -> ()
      %4860 = func.call @stack_pop_pointer() : () -> i64
      %4861 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4862 = arith.constant 4 : i64
      %4863 = func.call @cc_make_string(%4861, %4862) : (!llvm.ptr, i64) -> i64
      %4864 = func.call @cc_nil_value() : () -> i64
      %4865 = func.call @cc_intern(%4863, %4864) : (i64, i64) -> i64
      %4866 = func.call @cc_nil_value() : () -> i64
      %4867 = func.call @cc_cons(%4865, %4866) : (i64, i64) -> i64
      %4868 = func.call @cc_values_pack(%4867) : (i64) -> i64
      func.call @stack_push_pointer(%4865) : (i64) -> ()
      %4869 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4870 = arith.constant 10 : i64
      %4871 = func.call @cc_make_string(%4869, %4870) : (!llvm.ptr, i64) -> i64
      %4872 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4873 = arith.constant 11 : i64
      %4874 = func.call @cc_make_string(%4872, %4873) : (!llvm.ptr, i64) -> i64
      %4875 = func.call @cc_intern(%4871, %4874) : (i64, i64) -> i64
      %4876 = func.call @cc_nil_value() : () -> i64
      %4877 = func.call @cc_cons(%4875, %4876) : (i64, i64) -> i64
      %4878 = func.call @cc_values_pack(%4877) : (i64) -> i64
      func.call @stack_push_pointer(%4875) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4879 = func.call @stack_pop_pointer() : () -> i64
      %4880 = func.call @stack_pop_pointer() : () -> i64
      %4881 = func.call @cc_cons(%4880, %4879) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4881) : (i64) -> ()
      %4882 = func.call @stack_pop_pointer() : () -> i64
      %4883 = func.call @stack_pop_pointer() : () -> i64
      %4884 = func.call @cc_cons(%4883, %4882) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4884) : (i64) -> ()
      %4885 = func.call @stack_pop_pointer() : () -> i64
      %4886 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4887 = arith.constant 11 : i64
      %4888 = func.call @cc_make_string(%4886, %4887) : (!llvm.ptr, i64) -> i64
      %4889 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4890 = arith.constant 7 : i64
      %4891 = func.call @cc_make_string(%4889, %4890) : (!llvm.ptr, i64) -> i64
      %4892 = func.call @cc_intern(%4888, %4891) : (i64, i64) -> i64
      %4893 = func.call @cc_nil_value() : () -> i64
      %4894 = func.call @cc_cons(%4892, %4893) : (i64, i64) -> i64
      %4895 = func.call @cc_values_pack(%4894) : (i64) -> i64
      func.call @stack_push_pointer(%4892) : (i64) -> ()
      %4896 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4897 = func.call @stack_pop_pointer() : () -> i64
      %4898 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4899 = arith.constant 4 : i64
      %4900 = func.call @cc_make_string(%4898, %4899) : (!llvm.ptr, i64) -> i64
      %4901 = llvm.mlir.addressof @str368 : !llvm.ptr
      %4902 = arith.constant 7 : i64
      %4903 = func.call @cc_make_string(%4901, %4902) : (!llvm.ptr, i64) -> i64
      %4904 = func.call @cc_intern(%4900, %4903) : (i64, i64) -> i64
      %4905 = func.call @cc_nil_value() : () -> i64
      %4906 = func.call @cc_cons(%4904, %4905) : (i64, i64) -> i64
      %4907 = func.call @cc_values_pack(%4906) : (i64) -> i64
      func.call @stack_push_pointer(%4904) : (i64) -> ()
      %4908 = func.call @stack_pop_pointer() : () -> i64
      %4909 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4910 = arith.constant 5 : i64
      %4911 = func.call @cc_make_string(%4909, %4910) : (!llvm.ptr, i64) -> i64
      %4912 = func.call @cc_nil_value() : () -> i64
      %4913 = func.call @cc_intern(%4911, %4912) : (i64, i64) -> i64
      %4914 = func.call @cc_nil_value() : () -> i64
      %4915 = func.call @cc_cons(%4913, %4914) : (i64, i64) -> i64
      %4916 = func.call @cc_values_pack(%4915) : (i64) -> i64
      func.call @stack_push_pointer(%4913) : (i64) -> ()
      %4917 = func.call @stack_pop_pointer() : () -> i64
      %4918 = func.call @cc_nil_value() : () -> i64
      %4919 = func.call @cc_errorp(%4723) : (i64) -> i64
      %4920 = arith.cmpi ne, %4919, %4918 : i64
      %4921 = arith.cmpi eq, %4918, %4918 : i64
      %4922 = arith.andi %4920, %4921 : i1
      %4923 = scf.if %4922 -> (i64) {
        scf.yield %4723 : i64
      } else {
        scf.yield %4918 : i64
      }
      %4924 = func.call @cc_errorp(%4800) : (i64) -> i64
      %4925 = arith.cmpi ne, %4924, %4918 : i64
      %4926 = arith.cmpi eq, %4923, %4918 : i64
      %4927 = arith.andi %4925, %4926 : i1
      %4928 = scf.if %4927 -> (i64) {
        scf.yield %4800 : i64
      } else {
        scf.yield %4923 : i64
      }
      %4929 = func.call @cc_errorp(%4860) : (i64) -> i64
      %4930 = arith.cmpi ne, %4929, %4918 : i64
      %4931 = arith.cmpi eq, %4928, %4918 : i64
      %4932 = arith.andi %4930, %4931 : i1
      %4933 = scf.if %4932 -> (i64) {
        scf.yield %4860 : i64
      } else {
        scf.yield %4928 : i64
      }
      %4934 = func.call @cc_errorp(%4885) : (i64) -> i64
      %4935 = arith.cmpi ne, %4934, %4918 : i64
      %4936 = arith.cmpi eq, %4933, %4918 : i64
      %4937 = arith.andi %4935, %4936 : i1
      %4938 = scf.if %4937 -> (i64) {
        scf.yield %4885 : i64
      } else {
        scf.yield %4933 : i64
      }
      %4939 = func.call @cc_errorp(%4896) : (i64) -> i64
      %4940 = arith.cmpi ne, %4939, %4918 : i64
      %4941 = arith.cmpi eq, %4938, %4918 : i64
      %4942 = arith.andi %4940, %4941 : i1
      %4943 = scf.if %4942 -> (i64) {
        scf.yield %4896 : i64
      } else {
        scf.yield %4938 : i64
      }
      %4944 = func.call @cc_errorp(%4897) : (i64) -> i64
      %4945 = arith.cmpi ne, %4944, %4918 : i64
      %4946 = arith.cmpi eq, %4943, %4918 : i64
      %4947 = arith.andi %4945, %4946 : i1
      %4948 = scf.if %4947 -> (i64) {
        scf.yield %4897 : i64
      } else {
        scf.yield %4943 : i64
      }
      %4949 = func.call @cc_errorp(%4908) : (i64) -> i64
      %4950 = arith.cmpi ne, %4949, %4918 : i64
      %4951 = arith.cmpi eq, %4948, %4918 : i64
      %4952 = arith.andi %4950, %4951 : i1
      %4953 = scf.if %4952 -> (i64) {
        scf.yield %4908 : i64
      } else {
        scf.yield %4948 : i64
      }
      %4954 = func.call @cc_errorp(%4917) : (i64) -> i64
      %4955 = arith.cmpi ne, %4954, %4918 : i64
      %4956 = arith.cmpi eq, %4953, %4918 : i64
      %4957 = arith.andi %4955, %4956 : i1
      %4958 = scf.if %4957 -> (i64) {
        scf.yield %4917 : i64
      } else {
        scf.yield %4953 : i64
      }
      %4959 = arith.cmpi ne, %4958, %4918 : i64
      scf.if %4959 {
        func.call @stack_push_pointer(%4958) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4723) : (i64) -> ()
        func.call @stack_push_pointer(%4800) : (i64) -> ()
        func.call @stack_push_pointer(%4860) : (i64) -> ()
        func.call @stack_push_pointer(%4885) : (i64) -> ()
        func.call @stack_push_pointer(%4896) : (i64) -> ()
        func.call @stack_push_pointer(%4897) : (i64) -> ()
        func.call @stack_push_pointer(%4908) : (i64) -> ()
        func.call @stack_push_pointer(%4917) : (i64) -> ()
        %4960 = llvm.mlir.addressof @str370 : !llvm.ptr
        %4961 = func.call @cc_make_function_ref_const(%4960) : (!llvm.ptr) -> i64
        %4962 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4961, %4962) : (i64, i64) -> ()
      }
      %4963 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4963 : i64
    }
    %4964 = func.call @cc_nil_value() : () -> i64
    %4965 = func.call @cc_errorp(%4714) : (i64) -> i64
    %4966 = arith.cmpi ne, %4965, %4964 : i64
    %4967 = scf.if %4966 -> (i64) {
      scf.yield %4714 : i64
    } else {
      %4968 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4969 = arith.constant 12 : i64
      %4970 = func.call @cc_make_string(%4968, %4969) : (!llvm.ptr, i64) -> i64
      %4971 = func.call @cc_nil_value() : () -> i64
      %4972 = func.call @cc_intern(%4970, %4971) : (i64, i64) -> i64
      %4973 = func.call @cc_nil_value() : () -> i64
      %4974 = func.call @cc_cons(%4972, %4973) : (i64, i64) -> i64
      %4975 = func.call @cc_values_pack(%4974) : (i64) -> i64
      func.call @stack_push_pointer(%4972) : (i64) -> ()
      %4976 = func.call @stack_pop_pointer() : () -> i64
      %4977 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4978 = arith.constant 13 : i64
      %4979 = func.call @cc_make_string(%4977, %4978) : (!llvm.ptr, i64) -> i64
      %4980 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4981 = arith.constant 11 : i64
      %4982 = func.call @cc_make_string(%4980, %4981) : (!llvm.ptr, i64) -> i64
      %4983 = func.call @cc_intern(%4979, %4982) : (i64, i64) -> i64
      %4984 = func.call @cc_nil_value() : () -> i64
      %4985 = func.call @cc_cons(%4983, %4984) : (i64, i64) -> i64
      %4986 = func.call @cc_values_pack(%4985) : (i64) -> i64
      func.call @stack_push_pointer(%4983) : (i64) -> ()
      %4987 = llvm.mlir.addressof @str374 : !llvm.ptr
      %4988 = arith.constant 6 : i64
      %4989 = func.call @cc_make_string(%4987, %4988) : (!llvm.ptr, i64) -> i64
      %4990 = func.call @cc_nil_value() : () -> i64
      %4991 = func.call @cc_intern(%4989, %4990) : (i64, i64) -> i64
      %4992 = func.call @cc_nil_value() : () -> i64
      %4993 = func.call @cc_cons(%4991, %4992) : (i64, i64) -> i64
      %4994 = func.call @cc_values_pack(%4993) : (i64) -> i64
      func.call @stack_push_pointer(%4991) : (i64) -> ()
      %4995 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4996 = arith.constant 19 : i64
      %4997 = func.call @cc_make_string(%4995, %4996) : (!llvm.ptr, i64) -> i64
      %4998 = func.call @cc_nil_value() : () -> i64
      %4999 = func.call @cc_intern(%4997, %4998) : (i64, i64) -> i64
      %5000 = func.call @cc_nil_value() : () -> i64
      %5001 = func.call @cc_cons(%4999, %5000) : (i64, i64) -> i64
      %5002 = func.call @cc_values_pack(%5001) : (i64) -> i64
      func.call @stack_push_pointer(%4999) : (i64) -> ()
      %5003 = llvm.mlir.addressof @str376 : !llvm.ptr
      %5004 = arith.constant 10 : i64
      %5005 = func.call @cc_make_string(%5003, %5004) : (!llvm.ptr, i64) -> i64
      %5006 = llvm.mlir.addressof @str377 : !llvm.ptr
      %5007 = arith.constant 11 : i64
      %5008 = func.call @cc_make_string(%5006, %5007) : (!llvm.ptr, i64) -> i64
      %5009 = func.call @cc_intern(%5005, %5008) : (i64, i64) -> i64
      %5010 = func.call @cc_nil_value() : () -> i64
      %5011 = func.call @cc_cons(%5009, %5010) : (i64, i64) -> i64
      %5012 = func.call @cc_values_pack(%5011) : (i64) -> i64
      func.call @stack_push_pointer(%5009) : (i64) -> ()
      %5013 = llvm.mlir.addressof @str378 : !llvm.ptr
      %5014 = arith.constant 15 : i64
      %5015 = func.call @cc_make_string(%5013, %5014) : (!llvm.ptr, i64) -> i64
      %5016 = llvm.mlir.addressof @str379 : !llvm.ptr
      %5017 = arith.constant 11 : i64
      %5018 = func.call @cc_make_string(%5016, %5017) : (!llvm.ptr, i64) -> i64
      %5019 = func.call @cc_intern(%5015, %5018) : (i64, i64) -> i64
      %5020 = func.call @cc_nil_value() : () -> i64
      %5021 = func.call @cc_cons(%5019, %5020) : (i64, i64) -> i64
      %5022 = func.call @cc_values_pack(%5021) : (i64) -> i64
      func.call @stack_push_pointer(%5019) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5023 = func.call @stack_pop_pointer() : () -> i64
      %5024 = func.call @stack_pop_pointer() : () -> i64
      %5025 = func.call @cc_cons(%5024, %5023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5026 = func.call @stack_pop_pointer() : () -> i64
      %5027 = func.call @stack_pop_pointer() : () -> i64
      %5028 = func.call @cc_cons(%5027, %5026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5028) : (i64) -> ()
      %5029 = func.call @stack_pop_pointer() : () -> i64
      %5030 = func.call @stack_pop_pointer() : () -> i64
      %5031 = func.call @cc_cons(%5030, %5029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5031) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5032 = func.call @stack_pop_pointer() : () -> i64
      %5033 = func.call @stack_pop_pointer() : () -> i64
      %5034 = func.call @cc_cons(%5033, %5032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5034) : (i64) -> ()
      %5035 = func.call @stack_pop_pointer() : () -> i64
      %5036 = func.call @stack_pop_pointer() : () -> i64
      %5037 = func.call @cc_cons(%5036, %5035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5037) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5038 = func.call @stack_pop_pointer() : () -> i64
      %5039 = func.call @stack_pop_pointer() : () -> i64
      %5040 = func.call @cc_cons(%5039, %5038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5040) : (i64) -> ()
      %5041 = func.call @stack_pop_pointer() : () -> i64
      %5042 = func.call @stack_pop_pointer() : () -> i64
      %5043 = func.call @cc_cons(%5042, %5041) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5043) : (i64) -> ()
      %5044 = func.call @stack_pop_pointer() : () -> i64
      %5045 = func.call @stack_pop_pointer() : () -> i64
      %5046 = func.call @cc_cons(%5045, %5044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5046) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5047 = func.call @stack_pop_pointer() : () -> i64
      %5048 = func.call @stack_pop_pointer() : () -> i64
      %5049 = func.call @cc_cons(%5048, %5047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5049) : (i64) -> ()
      %5050 = func.call @stack_pop_pointer() : () -> i64
      %5051 = func.call @stack_pop_pointer() : () -> i64
      %5052 = func.call @cc_cons(%5051, %5050) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5052) : (i64) -> ()
      %5053 = func.call @stack_pop_pointer() : () -> i64
      %5110 = arith.constant 209815645192214 : i64
      %5111 = arith.constant 0 : i64
      %5112 = func.call @cc_make_closure(%5110, %5111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5112) : (i64) -> ()
      %5113 = func.call @stack_pop_pointer() : () -> i64
      %5114 = llvm.mlir.addressof @str381 : !llvm.ptr
      %5115 = arith.constant 4 : i64
      %5116 = func.call @cc_make_string(%5114, %5115) : (!llvm.ptr, i64) -> i64
      %5117 = func.call @cc_nil_value() : () -> i64
      %5118 = func.call @cc_intern(%5116, %5117) : (i64, i64) -> i64
      %5119 = func.call @cc_nil_value() : () -> i64
      %5120 = func.call @cc_cons(%5118, %5119) : (i64, i64) -> i64
      %5121 = func.call @cc_values_pack(%5120) : (i64) -> i64
      func.call @stack_push_pointer(%5118) : (i64) -> ()
      %5122 = llvm.mlir.addressof @str382 : !llvm.ptr
      %5123 = arith.constant 10 : i64
      %5124 = func.call @cc_make_string(%5122, %5123) : (!llvm.ptr, i64) -> i64
      %5125 = llvm.mlir.addressof @str383 : !llvm.ptr
      %5126 = arith.constant 11 : i64
      %5127 = func.call @cc_make_string(%5125, %5126) : (!llvm.ptr, i64) -> i64
      %5128 = func.call @cc_intern(%5124, %5127) : (i64, i64) -> i64
      %5129 = func.call @cc_nil_value() : () -> i64
      %5130 = func.call @cc_cons(%5128, %5129) : (i64, i64) -> i64
      %5131 = func.call @cc_values_pack(%5130) : (i64) -> i64
      func.call @stack_push_pointer(%5128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5132 = func.call @stack_pop_pointer() : () -> i64
      %5133 = func.call @stack_pop_pointer() : () -> i64
      %5134 = func.call @cc_cons(%5133, %5132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5134) : (i64) -> ()
      %5135 = func.call @stack_pop_pointer() : () -> i64
      %5136 = func.call @stack_pop_pointer() : () -> i64
      %5137 = func.call @cc_cons(%5136, %5135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5137) : (i64) -> ()
      %5138 = func.call @stack_pop_pointer() : () -> i64
      %5139 = llvm.mlir.addressof @str384 : !llvm.ptr
      %5140 = arith.constant 11 : i64
      %5141 = func.call @cc_make_string(%5139, %5140) : (!llvm.ptr, i64) -> i64
      %5142 = llvm.mlir.addressof @str385 : !llvm.ptr
      %5143 = arith.constant 7 : i64
      %5144 = func.call @cc_make_string(%5142, %5143) : (!llvm.ptr, i64) -> i64
      %5145 = func.call @cc_intern(%5141, %5144) : (i64, i64) -> i64
      %5146 = func.call @cc_nil_value() : () -> i64
      %5147 = func.call @cc_cons(%5145, %5146) : (i64, i64) -> i64
      %5148 = func.call @cc_values_pack(%5147) : (i64) -> i64
      func.call @stack_push_pointer(%5145) : (i64) -> ()
      %5149 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5150 = func.call @stack_pop_pointer() : () -> i64
      %5151 = llvm.mlir.addressof @str386 : !llvm.ptr
      %5152 = arith.constant 4 : i64
      %5153 = func.call @cc_make_string(%5151, %5152) : (!llvm.ptr, i64) -> i64
      %5154 = llvm.mlir.addressof @str387 : !llvm.ptr
      %5155 = arith.constant 7 : i64
      %5156 = func.call @cc_make_string(%5154, %5155) : (!llvm.ptr, i64) -> i64
      %5157 = func.call @cc_intern(%5153, %5156) : (i64, i64) -> i64
      %5158 = func.call @cc_nil_value() : () -> i64
      %5159 = func.call @cc_cons(%5157, %5158) : (i64, i64) -> i64
      %5160 = func.call @cc_values_pack(%5159) : (i64) -> i64
      func.call @stack_push_pointer(%5157) : (i64) -> ()
      %5161 = func.call @stack_pop_pointer() : () -> i64
      %5162 = llvm.mlir.addressof @str388 : !llvm.ptr
      %5163 = arith.constant 5 : i64
      %5164 = func.call @cc_make_string(%5162, %5163) : (!llvm.ptr, i64) -> i64
      %5165 = func.call @cc_nil_value() : () -> i64
      %5166 = func.call @cc_intern(%5164, %5165) : (i64, i64) -> i64
      %5167 = func.call @cc_nil_value() : () -> i64
      %5168 = func.call @cc_cons(%5166, %5167) : (i64, i64) -> i64
      %5169 = func.call @cc_values_pack(%5168) : (i64) -> i64
      func.call @stack_push_pointer(%5166) : (i64) -> ()
      %5170 = func.call @stack_pop_pointer() : () -> i64
      %5171 = func.call @cc_nil_value() : () -> i64
      %5172 = func.call @cc_errorp(%4976) : (i64) -> i64
      %5173 = arith.cmpi ne, %5172, %5171 : i64
      %5174 = arith.cmpi eq, %5171, %5171 : i64
      %5175 = arith.andi %5173, %5174 : i1
      %5176 = scf.if %5175 -> (i64) {
        scf.yield %4976 : i64
      } else {
        scf.yield %5171 : i64
      }
      %5177 = func.call @cc_errorp(%5053) : (i64) -> i64
      %5178 = arith.cmpi ne, %5177, %5171 : i64
      %5179 = arith.cmpi eq, %5176, %5171 : i64
      %5180 = arith.andi %5178, %5179 : i1
      %5181 = scf.if %5180 -> (i64) {
        scf.yield %5053 : i64
      } else {
        scf.yield %5176 : i64
      }
      %5182 = func.call @cc_errorp(%5113) : (i64) -> i64
      %5183 = arith.cmpi ne, %5182, %5171 : i64
      %5184 = arith.cmpi eq, %5181, %5171 : i64
      %5185 = arith.andi %5183, %5184 : i1
      %5186 = scf.if %5185 -> (i64) {
        scf.yield %5113 : i64
      } else {
        scf.yield %5181 : i64
      }
      %5187 = func.call @cc_errorp(%5138) : (i64) -> i64
      %5188 = arith.cmpi ne, %5187, %5171 : i64
      %5189 = arith.cmpi eq, %5186, %5171 : i64
      %5190 = arith.andi %5188, %5189 : i1
      %5191 = scf.if %5190 -> (i64) {
        scf.yield %5138 : i64
      } else {
        scf.yield %5186 : i64
      }
      %5192 = func.call @cc_errorp(%5149) : (i64) -> i64
      %5193 = arith.cmpi ne, %5192, %5171 : i64
      %5194 = arith.cmpi eq, %5191, %5171 : i64
      %5195 = arith.andi %5193, %5194 : i1
      %5196 = scf.if %5195 -> (i64) {
        scf.yield %5149 : i64
      } else {
        scf.yield %5191 : i64
      }
      %5197 = func.call @cc_errorp(%5150) : (i64) -> i64
      %5198 = arith.cmpi ne, %5197, %5171 : i64
      %5199 = arith.cmpi eq, %5196, %5171 : i64
      %5200 = arith.andi %5198, %5199 : i1
      %5201 = scf.if %5200 -> (i64) {
        scf.yield %5150 : i64
      } else {
        scf.yield %5196 : i64
      }
      %5202 = func.call @cc_errorp(%5161) : (i64) -> i64
      %5203 = arith.cmpi ne, %5202, %5171 : i64
      %5204 = arith.cmpi eq, %5201, %5171 : i64
      %5205 = arith.andi %5203, %5204 : i1
      %5206 = scf.if %5205 -> (i64) {
        scf.yield %5161 : i64
      } else {
        scf.yield %5201 : i64
      }
      %5207 = func.call @cc_errorp(%5170) : (i64) -> i64
      %5208 = arith.cmpi ne, %5207, %5171 : i64
      %5209 = arith.cmpi eq, %5206, %5171 : i64
      %5210 = arith.andi %5208, %5209 : i1
      %5211 = scf.if %5210 -> (i64) {
        scf.yield %5170 : i64
      } else {
        scf.yield %5206 : i64
      }
      %5212 = arith.cmpi ne, %5211, %5171 : i64
      scf.if %5212 {
        func.call @stack_push_pointer(%5211) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4976) : (i64) -> ()
        func.call @stack_push_pointer(%5053) : (i64) -> ()
        func.call @stack_push_pointer(%5113) : (i64) -> ()
        func.call @stack_push_pointer(%5138) : (i64) -> ()
        func.call @stack_push_pointer(%5149) : (i64) -> ()
        func.call @stack_push_pointer(%5150) : (i64) -> ()
        func.call @stack_push_pointer(%5161) : (i64) -> ()
        func.call @stack_push_pointer(%5170) : (i64) -> ()
        %5213 = llvm.mlir.addressof @str389 : !llvm.ptr
        %5214 = func.call @cc_make_function_ref_const(%5213) : (!llvm.ptr) -> i64
        %5215 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5214, %5215) : (i64, i64) -> ()
      }
      %5216 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5216 : i64
    }
    %5217 = func.call @cc_nil_value() : () -> i64
    %5218 = func.call @cc_errorp(%4967) : (i64) -> i64
    %5219 = arith.cmpi ne, %5218, %5217 : i64
    %5220 = scf.if %5219 -> (i64) {
      scf.yield %4967 : i64
    } else {
      %5221 = llvm.mlir.addressof @str390 : !llvm.ptr
      %5222 = arith.constant 12 : i64
      %5223 = func.call @cc_make_string(%5221, %5222) : (!llvm.ptr, i64) -> i64
      %5224 = func.call @cc_nil_value() : () -> i64
      %5225 = func.call @cc_intern(%5223, %5224) : (i64, i64) -> i64
      %5226 = func.call @cc_nil_value() : () -> i64
      %5227 = func.call @cc_cons(%5225, %5226) : (i64, i64) -> i64
      %5228 = func.call @cc_values_pack(%5227) : (i64) -> i64
      func.call @stack_push_pointer(%5225) : (i64) -> ()
      %5229 = func.call @stack_pop_pointer() : () -> i64
      %5230 = llvm.mlir.addressof @str391 : !llvm.ptr
      %5231 = arith.constant 13 : i64
      %5232 = func.call @cc_make_string(%5230, %5231) : (!llvm.ptr, i64) -> i64
      %5233 = llvm.mlir.addressof @str392 : !llvm.ptr
      %5234 = arith.constant 11 : i64
      %5235 = func.call @cc_make_string(%5233, %5234) : (!llvm.ptr, i64) -> i64
      %5236 = func.call @cc_intern(%5232, %5235) : (i64, i64) -> i64
      %5237 = func.call @cc_nil_value() : () -> i64
      %5238 = func.call @cc_cons(%5236, %5237) : (i64, i64) -> i64
      %5239 = func.call @cc_values_pack(%5238) : (i64) -> i64
      func.call @stack_push_pointer(%5236) : (i64) -> ()
      %5240 = llvm.mlir.addressof @str393 : !llvm.ptr
      %5241 = arith.constant 6 : i64
      %5242 = func.call @cc_make_string(%5240, %5241) : (!llvm.ptr, i64) -> i64
      %5243 = func.call @cc_nil_value() : () -> i64
      %5244 = func.call @cc_intern(%5242, %5243) : (i64, i64) -> i64
      %5245 = func.call @cc_nil_value() : () -> i64
      %5246 = func.call @cc_cons(%5244, %5245) : (i64, i64) -> i64
      %5247 = func.call @cc_values_pack(%5246) : (i64) -> i64
      func.call @stack_push_pointer(%5244) : (i64) -> ()
      %5248 = llvm.mlir.addressof @str394 : !llvm.ptr
      %5249 = arith.constant 19 : i64
      %5250 = func.call @cc_make_string(%5248, %5249) : (!llvm.ptr, i64) -> i64
      %5251 = func.call @cc_nil_value() : () -> i64
      %5252 = func.call @cc_intern(%5250, %5251) : (i64, i64) -> i64
      %5253 = func.call @cc_nil_value() : () -> i64
      %5254 = func.call @cc_cons(%5252, %5253) : (i64, i64) -> i64
      %5255 = func.call @cc_values_pack(%5254) : (i64) -> i64
      func.call @stack_push_pointer(%5252) : (i64) -> ()
      %5256 = llvm.mlir.addressof @str395 : !llvm.ptr
      %5257 = arith.constant 14 : i64
      %5258 = func.call @cc_make_string(%5256, %5257) : (!llvm.ptr, i64) -> i64
      %5259 = llvm.mlir.addressof @str396 : !llvm.ptr
      %5260 = arith.constant 11 : i64
      %5261 = func.call @cc_make_string(%5259, %5260) : (!llvm.ptr, i64) -> i64
      %5262 = func.call @cc_intern(%5258, %5261) : (i64, i64) -> i64
      %5263 = func.call @cc_nil_value() : () -> i64
      %5264 = func.call @cc_cons(%5262, %5263) : (i64, i64) -> i64
      %5265 = func.call @cc_values_pack(%5264) : (i64) -> i64
      func.call @stack_push_pointer(%5262) : (i64) -> ()
      %5266 = llvm.mlir.addressof @str397 : !llvm.ptr
      %5267 = arith.constant 15 : i64
      %5268 = func.call @cc_make_string(%5266, %5267) : (!llvm.ptr, i64) -> i64
      %5269 = llvm.mlir.addressof @str398 : !llvm.ptr
      %5270 = arith.constant 11 : i64
      %5271 = func.call @cc_make_string(%5269, %5270) : (!llvm.ptr, i64) -> i64
      %5272 = func.call @cc_intern(%5268, %5271) : (i64, i64) -> i64
      %5273 = func.call @cc_nil_value() : () -> i64
      %5274 = func.call @cc_cons(%5272, %5273) : (i64, i64) -> i64
      %5275 = func.call @cc_values_pack(%5274) : (i64) -> i64
      func.call @stack_push_pointer(%5272) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5276 = func.call @stack_pop_pointer() : () -> i64
      %5277 = func.call @stack_pop_pointer() : () -> i64
      %5278 = func.call @cc_cons(%5277, %5276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5278) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5279 = func.call @stack_pop_pointer() : () -> i64
      %5280 = func.call @stack_pop_pointer() : () -> i64
      %5281 = func.call @cc_cons(%5280, %5279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5281) : (i64) -> ()
      %5282 = func.call @stack_pop_pointer() : () -> i64
      %5283 = func.call @stack_pop_pointer() : () -> i64
      %5284 = func.call @cc_cons(%5283, %5282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5284) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5285 = func.call @stack_pop_pointer() : () -> i64
      %5286 = func.call @stack_pop_pointer() : () -> i64
      %5287 = func.call @cc_cons(%5286, %5285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5287) : (i64) -> ()
      %5288 = func.call @stack_pop_pointer() : () -> i64
      %5289 = func.call @stack_pop_pointer() : () -> i64
      %5290 = func.call @cc_cons(%5289, %5288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5290) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5291 = func.call @stack_pop_pointer() : () -> i64
      %5292 = func.call @stack_pop_pointer() : () -> i64
      %5293 = func.call @cc_cons(%5292, %5291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5293) : (i64) -> ()
      %5294 = func.call @stack_pop_pointer() : () -> i64
      %5295 = func.call @stack_pop_pointer() : () -> i64
      %5296 = func.call @cc_cons(%5295, %5294) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5296) : (i64) -> ()
      %5297 = func.call @stack_pop_pointer() : () -> i64
      %5298 = func.call @stack_pop_pointer() : () -> i64
      %5299 = func.call @cc_cons(%5298, %5297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5299) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5300 = func.call @stack_pop_pointer() : () -> i64
      %5301 = func.call @stack_pop_pointer() : () -> i64
      %5302 = func.call @cc_cons(%5301, %5300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5302) : (i64) -> ()
      %5303 = func.call @stack_pop_pointer() : () -> i64
      %5304 = func.call @stack_pop_pointer() : () -> i64
      %5305 = func.call @cc_cons(%5304, %5303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5305) : (i64) -> ()
      %5306 = func.call @stack_pop_pointer() : () -> i64
      %5363 = arith.constant 209815645192215 : i64
      %5364 = arith.constant 0 : i64
      %5365 = func.call @cc_make_closure(%5363, %5364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5365) : (i64) -> ()
      %5366 = func.call @stack_pop_pointer() : () -> i64
      %5367 = llvm.mlir.addressof @str400 : !llvm.ptr
      %5368 = arith.constant 4 : i64
      %5369 = func.call @cc_make_string(%5367, %5368) : (!llvm.ptr, i64) -> i64
      %5370 = func.call @cc_nil_value() : () -> i64
      %5371 = func.call @cc_intern(%5369, %5370) : (i64, i64) -> i64
      %5372 = func.call @cc_nil_value() : () -> i64
      %5373 = func.call @cc_cons(%5371, %5372) : (i64, i64) -> i64
      %5374 = func.call @cc_values_pack(%5373) : (i64) -> i64
      func.call @stack_push_pointer(%5371) : (i64) -> ()
      %5375 = llvm.mlir.addressof @str401 : !llvm.ptr
      %5376 = arith.constant 10 : i64
      %5377 = func.call @cc_make_string(%5375, %5376) : (!llvm.ptr, i64) -> i64
      %5378 = llvm.mlir.addressof @str402 : !llvm.ptr
      %5379 = arith.constant 11 : i64
      %5380 = func.call @cc_make_string(%5378, %5379) : (!llvm.ptr, i64) -> i64
      %5381 = func.call @cc_intern(%5377, %5380) : (i64, i64) -> i64
      %5382 = func.call @cc_nil_value() : () -> i64
      %5383 = func.call @cc_cons(%5381, %5382) : (i64, i64) -> i64
      %5384 = func.call @cc_values_pack(%5383) : (i64) -> i64
      func.call @stack_push_pointer(%5381) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5385 = func.call @stack_pop_pointer() : () -> i64
      %5386 = func.call @stack_pop_pointer() : () -> i64
      %5387 = func.call @cc_cons(%5386, %5385) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5387) : (i64) -> ()
      %5388 = func.call @stack_pop_pointer() : () -> i64
      %5389 = func.call @stack_pop_pointer() : () -> i64
      %5390 = func.call @cc_cons(%5389, %5388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5390) : (i64) -> ()
      %5391 = func.call @stack_pop_pointer() : () -> i64
      %5392 = llvm.mlir.addressof @str403 : !llvm.ptr
      %5393 = arith.constant 11 : i64
      %5394 = func.call @cc_make_string(%5392, %5393) : (!llvm.ptr, i64) -> i64
      %5395 = llvm.mlir.addressof @str404 : !llvm.ptr
      %5396 = arith.constant 7 : i64
      %5397 = func.call @cc_make_string(%5395, %5396) : (!llvm.ptr, i64) -> i64
      %5398 = func.call @cc_intern(%5394, %5397) : (i64, i64) -> i64
      %5399 = func.call @cc_nil_value() : () -> i64
      %5400 = func.call @cc_cons(%5398, %5399) : (i64, i64) -> i64
      %5401 = func.call @cc_values_pack(%5400) : (i64) -> i64
      func.call @stack_push_pointer(%5398) : (i64) -> ()
      %5402 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5403 = func.call @stack_pop_pointer() : () -> i64
      %5404 = llvm.mlir.addressof @str405 : !llvm.ptr
      %5405 = arith.constant 4 : i64
      %5406 = func.call @cc_make_string(%5404, %5405) : (!llvm.ptr, i64) -> i64
      %5407 = llvm.mlir.addressof @str406 : !llvm.ptr
      %5408 = arith.constant 7 : i64
      %5409 = func.call @cc_make_string(%5407, %5408) : (!llvm.ptr, i64) -> i64
      %5410 = func.call @cc_intern(%5406, %5409) : (i64, i64) -> i64
      %5411 = func.call @cc_nil_value() : () -> i64
      %5412 = func.call @cc_cons(%5410, %5411) : (i64, i64) -> i64
      %5413 = func.call @cc_values_pack(%5412) : (i64) -> i64
      func.call @stack_push_pointer(%5410) : (i64) -> ()
      %5414 = func.call @stack_pop_pointer() : () -> i64
      %5415 = llvm.mlir.addressof @str407 : !llvm.ptr
      %5416 = arith.constant 5 : i64
      %5417 = func.call @cc_make_string(%5415, %5416) : (!llvm.ptr, i64) -> i64
      %5418 = func.call @cc_nil_value() : () -> i64
      %5419 = func.call @cc_intern(%5417, %5418) : (i64, i64) -> i64
      %5420 = func.call @cc_nil_value() : () -> i64
      %5421 = func.call @cc_cons(%5419, %5420) : (i64, i64) -> i64
      %5422 = func.call @cc_values_pack(%5421) : (i64) -> i64
      func.call @stack_push_pointer(%5419) : (i64) -> ()
      %5423 = func.call @stack_pop_pointer() : () -> i64
      %5424 = func.call @cc_nil_value() : () -> i64
      %5425 = func.call @cc_errorp(%5229) : (i64) -> i64
      %5426 = arith.cmpi ne, %5425, %5424 : i64
      %5427 = arith.cmpi eq, %5424, %5424 : i64
      %5428 = arith.andi %5426, %5427 : i1
      %5429 = scf.if %5428 -> (i64) {
        scf.yield %5229 : i64
      } else {
        scf.yield %5424 : i64
      }
      %5430 = func.call @cc_errorp(%5306) : (i64) -> i64
      %5431 = arith.cmpi ne, %5430, %5424 : i64
      %5432 = arith.cmpi eq, %5429, %5424 : i64
      %5433 = arith.andi %5431, %5432 : i1
      %5434 = scf.if %5433 -> (i64) {
        scf.yield %5306 : i64
      } else {
        scf.yield %5429 : i64
      }
      %5435 = func.call @cc_errorp(%5366) : (i64) -> i64
      %5436 = arith.cmpi ne, %5435, %5424 : i64
      %5437 = arith.cmpi eq, %5434, %5424 : i64
      %5438 = arith.andi %5436, %5437 : i1
      %5439 = scf.if %5438 -> (i64) {
        scf.yield %5366 : i64
      } else {
        scf.yield %5434 : i64
      }
      %5440 = func.call @cc_errorp(%5391) : (i64) -> i64
      %5441 = arith.cmpi ne, %5440, %5424 : i64
      %5442 = arith.cmpi eq, %5439, %5424 : i64
      %5443 = arith.andi %5441, %5442 : i1
      %5444 = scf.if %5443 -> (i64) {
        scf.yield %5391 : i64
      } else {
        scf.yield %5439 : i64
      }
      %5445 = func.call @cc_errorp(%5402) : (i64) -> i64
      %5446 = arith.cmpi ne, %5445, %5424 : i64
      %5447 = arith.cmpi eq, %5444, %5424 : i64
      %5448 = arith.andi %5446, %5447 : i1
      %5449 = scf.if %5448 -> (i64) {
        scf.yield %5402 : i64
      } else {
        scf.yield %5444 : i64
      }
      %5450 = func.call @cc_errorp(%5403) : (i64) -> i64
      %5451 = arith.cmpi ne, %5450, %5424 : i64
      %5452 = arith.cmpi eq, %5449, %5424 : i64
      %5453 = arith.andi %5451, %5452 : i1
      %5454 = scf.if %5453 -> (i64) {
        scf.yield %5403 : i64
      } else {
        scf.yield %5449 : i64
      }
      %5455 = func.call @cc_errorp(%5414) : (i64) -> i64
      %5456 = arith.cmpi ne, %5455, %5424 : i64
      %5457 = arith.cmpi eq, %5454, %5424 : i64
      %5458 = arith.andi %5456, %5457 : i1
      %5459 = scf.if %5458 -> (i64) {
        scf.yield %5414 : i64
      } else {
        scf.yield %5454 : i64
      }
      %5460 = func.call @cc_errorp(%5423) : (i64) -> i64
      %5461 = arith.cmpi ne, %5460, %5424 : i64
      %5462 = arith.cmpi eq, %5459, %5424 : i64
      %5463 = arith.andi %5461, %5462 : i1
      %5464 = scf.if %5463 -> (i64) {
        scf.yield %5423 : i64
      } else {
        scf.yield %5459 : i64
      }
      %5465 = arith.cmpi ne, %5464, %5424 : i64
      scf.if %5465 {
        func.call @stack_push_pointer(%5464) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5229) : (i64) -> ()
        func.call @stack_push_pointer(%5306) : (i64) -> ()
        func.call @stack_push_pointer(%5366) : (i64) -> ()
        func.call @stack_push_pointer(%5391) : (i64) -> ()
        func.call @stack_push_pointer(%5402) : (i64) -> ()
        func.call @stack_push_pointer(%5403) : (i64) -> ()
        func.call @stack_push_pointer(%5414) : (i64) -> ()
        func.call @stack_push_pointer(%5423) : (i64) -> ()
        %5466 = llvm.mlir.addressof @str408 : !llvm.ptr
        %5467 = func.call @cc_make_function_ref_const(%5466) : (!llvm.ptr) -> i64
        %5468 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5467, %5468) : (i64, i64) -> ()
      }
      %5469 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5469 : i64
    }
    %5470 = func.call @cc_nil_value() : () -> i64
    %5471 = func.call @cc_errorp(%5220) : (i64) -> i64
    %5472 = arith.cmpi ne, %5471, %5470 : i64
    %5473 = scf.if %5472 -> (i64) {
      scf.yield %5220 : i64
    } else {
      %5474 = llvm.mlir.addressof @str409 : !llvm.ptr
      %5475 = arith.constant 13 : i64
      %5476 = func.call @cc_make_string(%5474, %5475) : (!llvm.ptr, i64) -> i64
      %5477 = func.call @cc_nil_value() : () -> i64
      %5478 = func.call @cc_intern(%5476, %5477) : (i64, i64) -> i64
      %5479 = func.call @cc_nil_value() : () -> i64
      %5480 = func.call @cc_cons(%5478, %5479) : (i64, i64) -> i64
      %5481 = func.call @cc_values_pack(%5480) : (i64) -> i64
      func.call @stack_push_pointer(%5478) : (i64) -> ()
      %5482 = func.call @stack_pop_pointer() : () -> i64
      %5483 = llvm.mlir.addressof @str410 : !llvm.ptr
      %5484 = arith.constant 13 : i64
      %5485 = func.call @cc_make_string(%5483, %5484) : (!llvm.ptr, i64) -> i64
      %5486 = llvm.mlir.addressof @str411 : !llvm.ptr
      %5487 = arith.constant 11 : i64
      %5488 = func.call @cc_make_string(%5486, %5487) : (!llvm.ptr, i64) -> i64
      %5489 = func.call @cc_intern(%5485, %5488) : (i64, i64) -> i64
      %5490 = func.call @cc_nil_value() : () -> i64
      %5491 = func.call @cc_cons(%5489, %5490) : (i64, i64) -> i64
      %5492 = func.call @cc_values_pack(%5491) : (i64) -> i64
      func.call @stack_push_pointer(%5489) : (i64) -> ()
      %5493 = llvm.mlir.addressof @str412 : !llvm.ptr
      %5494 = arith.constant 6 : i64
      %5495 = func.call @cc_make_string(%5493, %5494) : (!llvm.ptr, i64) -> i64
      %5496 = func.call @cc_nil_value() : () -> i64
      %5497 = func.call @cc_intern(%5495, %5496) : (i64, i64) -> i64
      %5498 = func.call @cc_nil_value() : () -> i64
      %5499 = func.call @cc_cons(%5497, %5498) : (i64, i64) -> i64
      %5500 = func.call @cc_values_pack(%5499) : (i64) -> i64
      func.call @stack_push_pointer(%5497) : (i64) -> ()
      %5501 = llvm.mlir.addressof @str413 : !llvm.ptr
      %5502 = arith.constant 19 : i64
      %5503 = func.call @cc_make_string(%5501, %5502) : (!llvm.ptr, i64) -> i64
      %5504 = func.call @cc_nil_value() : () -> i64
      %5505 = func.call @cc_intern(%5503, %5504) : (i64, i64) -> i64
      %5506 = func.call @cc_nil_value() : () -> i64
      %5507 = func.call @cc_cons(%5505, %5506) : (i64, i64) -> i64
      %5508 = func.call @cc_values_pack(%5507) : (i64) -> i64
      func.call @stack_push_pointer(%5505) : (i64) -> ()
      %5509 = llvm.mlir.addressof @str414 : !llvm.ptr
      %5510 = arith.constant 17 : i64
      %5511 = func.call @cc_make_string(%5509, %5510) : (!llvm.ptr, i64) -> i64
      %5512 = llvm.mlir.addressof @str415 : !llvm.ptr
      %5513 = arith.constant 11 : i64
      %5514 = func.call @cc_make_string(%5512, %5513) : (!llvm.ptr, i64) -> i64
      %5515 = func.call @cc_intern(%5511, %5514) : (i64, i64) -> i64
      %5516 = func.call @cc_nil_value() : () -> i64
      %5517 = func.call @cc_cons(%5515, %5516) : (i64, i64) -> i64
      %5518 = func.call @cc_values_pack(%5517) : (i64) -> i64
      func.call @stack_push_pointer(%5515) : (i64) -> ()
      %5519 = llvm.mlir.addressof @str416 : !llvm.ptr
      %5520 = arith.constant 15 : i64
      %5521 = func.call @cc_make_string(%5519, %5520) : (!llvm.ptr, i64) -> i64
      %5522 = llvm.mlir.addressof @str417 : !llvm.ptr
      %5523 = arith.constant 11 : i64
      %5524 = func.call @cc_make_string(%5522, %5523) : (!llvm.ptr, i64) -> i64
      %5525 = func.call @cc_intern(%5521, %5524) : (i64, i64) -> i64
      %5526 = func.call @cc_nil_value() : () -> i64
      %5527 = func.call @cc_cons(%5525, %5526) : (i64, i64) -> i64
      %5528 = func.call @cc_values_pack(%5527) : (i64) -> i64
      func.call @stack_push_pointer(%5525) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5529 = func.call @stack_pop_pointer() : () -> i64
      %5530 = func.call @stack_pop_pointer() : () -> i64
      %5531 = func.call @cc_cons(%5530, %5529) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5531) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5532 = func.call @stack_pop_pointer() : () -> i64
      %5533 = func.call @stack_pop_pointer() : () -> i64
      %5534 = func.call @cc_cons(%5533, %5532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5534) : (i64) -> ()
      %5535 = func.call @stack_pop_pointer() : () -> i64
      %5536 = func.call @stack_pop_pointer() : () -> i64
      %5537 = func.call @cc_cons(%5536, %5535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5537) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5538 = func.call @stack_pop_pointer() : () -> i64
      %5539 = func.call @stack_pop_pointer() : () -> i64
      %5540 = func.call @cc_cons(%5539, %5538) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5540) : (i64) -> ()
      %5541 = func.call @stack_pop_pointer() : () -> i64
      %5542 = func.call @stack_pop_pointer() : () -> i64
      %5543 = func.call @cc_cons(%5542, %5541) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5543) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5544 = func.call @stack_pop_pointer() : () -> i64
      %5545 = func.call @stack_pop_pointer() : () -> i64
      %5546 = func.call @cc_cons(%5545, %5544) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5546) : (i64) -> ()
      %5547 = func.call @stack_pop_pointer() : () -> i64
      %5548 = func.call @stack_pop_pointer() : () -> i64
      %5549 = func.call @cc_cons(%5548, %5547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5549) : (i64) -> ()
      %5550 = func.call @stack_pop_pointer() : () -> i64
      %5551 = func.call @stack_pop_pointer() : () -> i64
      %5552 = func.call @cc_cons(%5551, %5550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5553 = func.call @stack_pop_pointer() : () -> i64
      %5554 = func.call @stack_pop_pointer() : () -> i64
      %5555 = func.call @cc_cons(%5554, %5553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5555) : (i64) -> ()
      %5556 = func.call @stack_pop_pointer() : () -> i64
      %5557 = func.call @stack_pop_pointer() : () -> i64
      %5558 = func.call @cc_cons(%5557, %5556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5558) : (i64) -> ()
      %5559 = func.call @stack_pop_pointer() : () -> i64
      %5616 = arith.constant 209815645192216 : i64
      %5617 = arith.constant 0 : i64
      %5618 = func.call @cc_make_closure(%5616, %5617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5618) : (i64) -> ()
      %5619 = func.call @stack_pop_pointer() : () -> i64
      %5620 = llvm.mlir.addressof @str419 : !llvm.ptr
      %5621 = arith.constant 4 : i64
      %5622 = func.call @cc_make_string(%5620, %5621) : (!llvm.ptr, i64) -> i64
      %5623 = func.call @cc_nil_value() : () -> i64
      %5624 = func.call @cc_intern(%5622, %5623) : (i64, i64) -> i64
      %5625 = func.call @cc_nil_value() : () -> i64
      %5626 = func.call @cc_cons(%5624, %5625) : (i64, i64) -> i64
      %5627 = func.call @cc_values_pack(%5626) : (i64) -> i64
      func.call @stack_push_pointer(%5624) : (i64) -> ()
      %5628 = llvm.mlir.addressof @str420 : !llvm.ptr
      %5629 = arith.constant 10 : i64
      %5630 = func.call @cc_make_string(%5628, %5629) : (!llvm.ptr, i64) -> i64
      %5631 = llvm.mlir.addressof @str421 : !llvm.ptr
      %5632 = arith.constant 11 : i64
      %5633 = func.call @cc_make_string(%5631, %5632) : (!llvm.ptr, i64) -> i64
      %5634 = func.call @cc_intern(%5630, %5633) : (i64, i64) -> i64
      %5635 = func.call @cc_nil_value() : () -> i64
      %5636 = func.call @cc_cons(%5634, %5635) : (i64, i64) -> i64
      %5637 = func.call @cc_values_pack(%5636) : (i64) -> i64
      func.call @stack_push_pointer(%5634) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5638 = func.call @stack_pop_pointer() : () -> i64
      %5639 = func.call @stack_pop_pointer() : () -> i64
      %5640 = func.call @cc_cons(%5639, %5638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5640) : (i64) -> ()
      %5641 = func.call @stack_pop_pointer() : () -> i64
      %5642 = func.call @stack_pop_pointer() : () -> i64
      %5643 = func.call @cc_cons(%5642, %5641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5643) : (i64) -> ()
      %5644 = func.call @stack_pop_pointer() : () -> i64
      %5645 = llvm.mlir.addressof @str422 : !llvm.ptr
      %5646 = arith.constant 11 : i64
      %5647 = func.call @cc_make_string(%5645, %5646) : (!llvm.ptr, i64) -> i64
      %5648 = llvm.mlir.addressof @str423 : !llvm.ptr
      %5649 = arith.constant 7 : i64
      %5650 = func.call @cc_make_string(%5648, %5649) : (!llvm.ptr, i64) -> i64
      %5651 = func.call @cc_intern(%5647, %5650) : (i64, i64) -> i64
      %5652 = func.call @cc_nil_value() : () -> i64
      %5653 = func.call @cc_cons(%5651, %5652) : (i64, i64) -> i64
      %5654 = func.call @cc_values_pack(%5653) : (i64) -> i64
      func.call @stack_push_pointer(%5651) : (i64) -> ()
      %5655 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5656 = func.call @stack_pop_pointer() : () -> i64
      %5657 = llvm.mlir.addressof @str424 : !llvm.ptr
      %5658 = arith.constant 4 : i64
      %5659 = func.call @cc_make_string(%5657, %5658) : (!llvm.ptr, i64) -> i64
      %5660 = llvm.mlir.addressof @str425 : !llvm.ptr
      %5661 = arith.constant 7 : i64
      %5662 = func.call @cc_make_string(%5660, %5661) : (!llvm.ptr, i64) -> i64
      %5663 = func.call @cc_intern(%5659, %5662) : (i64, i64) -> i64
      %5664 = func.call @cc_nil_value() : () -> i64
      %5665 = func.call @cc_cons(%5663, %5664) : (i64, i64) -> i64
      %5666 = func.call @cc_values_pack(%5665) : (i64) -> i64
      func.call @stack_push_pointer(%5663) : (i64) -> ()
      %5667 = func.call @stack_pop_pointer() : () -> i64
      %5668 = llvm.mlir.addressof @str426 : !llvm.ptr
      %5669 = arith.constant 5 : i64
      %5670 = func.call @cc_make_string(%5668, %5669) : (!llvm.ptr, i64) -> i64
      %5671 = func.call @cc_nil_value() : () -> i64
      %5672 = func.call @cc_intern(%5670, %5671) : (i64, i64) -> i64
      %5673 = func.call @cc_nil_value() : () -> i64
      %5674 = func.call @cc_cons(%5672, %5673) : (i64, i64) -> i64
      %5675 = func.call @cc_values_pack(%5674) : (i64) -> i64
      func.call @stack_push_pointer(%5672) : (i64) -> ()
      %5676 = func.call @stack_pop_pointer() : () -> i64
      %5677 = func.call @cc_nil_value() : () -> i64
      %5678 = func.call @cc_errorp(%5482) : (i64) -> i64
      %5679 = arith.cmpi ne, %5678, %5677 : i64
      %5680 = arith.cmpi eq, %5677, %5677 : i64
      %5681 = arith.andi %5679, %5680 : i1
      %5682 = scf.if %5681 -> (i64) {
        scf.yield %5482 : i64
      } else {
        scf.yield %5677 : i64
      }
      %5683 = func.call @cc_errorp(%5559) : (i64) -> i64
      %5684 = arith.cmpi ne, %5683, %5677 : i64
      %5685 = arith.cmpi eq, %5682, %5677 : i64
      %5686 = arith.andi %5684, %5685 : i1
      %5687 = scf.if %5686 -> (i64) {
        scf.yield %5559 : i64
      } else {
        scf.yield %5682 : i64
      }
      %5688 = func.call @cc_errorp(%5619) : (i64) -> i64
      %5689 = arith.cmpi ne, %5688, %5677 : i64
      %5690 = arith.cmpi eq, %5687, %5677 : i64
      %5691 = arith.andi %5689, %5690 : i1
      %5692 = scf.if %5691 -> (i64) {
        scf.yield %5619 : i64
      } else {
        scf.yield %5687 : i64
      }
      %5693 = func.call @cc_errorp(%5644) : (i64) -> i64
      %5694 = arith.cmpi ne, %5693, %5677 : i64
      %5695 = arith.cmpi eq, %5692, %5677 : i64
      %5696 = arith.andi %5694, %5695 : i1
      %5697 = scf.if %5696 -> (i64) {
        scf.yield %5644 : i64
      } else {
        scf.yield %5692 : i64
      }
      %5698 = func.call @cc_errorp(%5655) : (i64) -> i64
      %5699 = arith.cmpi ne, %5698, %5677 : i64
      %5700 = arith.cmpi eq, %5697, %5677 : i64
      %5701 = arith.andi %5699, %5700 : i1
      %5702 = scf.if %5701 -> (i64) {
        scf.yield %5655 : i64
      } else {
        scf.yield %5697 : i64
      }
      %5703 = func.call @cc_errorp(%5656) : (i64) -> i64
      %5704 = arith.cmpi ne, %5703, %5677 : i64
      %5705 = arith.cmpi eq, %5702, %5677 : i64
      %5706 = arith.andi %5704, %5705 : i1
      %5707 = scf.if %5706 -> (i64) {
        scf.yield %5656 : i64
      } else {
        scf.yield %5702 : i64
      }
      %5708 = func.call @cc_errorp(%5667) : (i64) -> i64
      %5709 = arith.cmpi ne, %5708, %5677 : i64
      %5710 = arith.cmpi eq, %5707, %5677 : i64
      %5711 = arith.andi %5709, %5710 : i1
      %5712 = scf.if %5711 -> (i64) {
        scf.yield %5667 : i64
      } else {
        scf.yield %5707 : i64
      }
      %5713 = func.call @cc_errorp(%5676) : (i64) -> i64
      %5714 = arith.cmpi ne, %5713, %5677 : i64
      %5715 = arith.cmpi eq, %5712, %5677 : i64
      %5716 = arith.andi %5714, %5715 : i1
      %5717 = scf.if %5716 -> (i64) {
        scf.yield %5676 : i64
      } else {
        scf.yield %5712 : i64
      }
      %5718 = arith.cmpi ne, %5717, %5677 : i64
      scf.if %5718 {
        func.call @stack_push_pointer(%5717) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5482) : (i64) -> ()
        func.call @stack_push_pointer(%5559) : (i64) -> ()
        func.call @stack_push_pointer(%5619) : (i64) -> ()
        func.call @stack_push_pointer(%5644) : (i64) -> ()
        func.call @stack_push_pointer(%5655) : (i64) -> ()
        func.call @stack_push_pointer(%5656) : (i64) -> ()
        func.call @stack_push_pointer(%5667) : (i64) -> ()
        func.call @stack_push_pointer(%5676) : (i64) -> ()
        %5719 = llvm.mlir.addressof @str427 : !llvm.ptr
        %5720 = func.call @cc_make_function_ref_const(%5719) : (!llvm.ptr) -> i64
        %5721 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5720, %5721) : (i64, i64) -> ()
      }
      %5722 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5722 : i64
    }
    %5723 = func.call @cc_nil_value() : () -> i64
    %5724 = func.call @cc_errorp(%5473) : (i64) -> i64
    %5725 = arith.cmpi ne, %5724, %5723 : i64
    %5726 = scf.if %5725 -> (i64) {
      scf.yield %5473 : i64
    } else {
      %5727 = llvm.mlir.addressof @str428 : !llvm.ptr
      %5728 = arith.constant 13 : i64
      %5729 = func.call @cc_make_string(%5727, %5728) : (!llvm.ptr, i64) -> i64
      %5730 = func.call @cc_nil_value() : () -> i64
      %5731 = func.call @cc_intern(%5729, %5730) : (i64, i64) -> i64
      %5732 = func.call @cc_nil_value() : () -> i64
      %5733 = func.call @cc_cons(%5731, %5732) : (i64, i64) -> i64
      %5734 = func.call @cc_values_pack(%5733) : (i64) -> i64
      func.call @stack_push_pointer(%5731) : (i64) -> ()
      %5735 = func.call @stack_pop_pointer() : () -> i64
      %5736 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5737 = arith.constant 13 : i64
      %5738 = func.call @cc_make_string(%5736, %5737) : (!llvm.ptr, i64) -> i64
      %5739 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5740 = arith.constant 11 : i64
      %5741 = func.call @cc_make_string(%5739, %5740) : (!llvm.ptr, i64) -> i64
      %5742 = func.call @cc_intern(%5738, %5741) : (i64, i64) -> i64
      %5743 = func.call @cc_nil_value() : () -> i64
      %5744 = func.call @cc_cons(%5742, %5743) : (i64, i64) -> i64
      %5745 = func.call @cc_values_pack(%5744) : (i64) -> i64
      func.call @stack_push_pointer(%5742) : (i64) -> ()
      %5746 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5747 = arith.constant 6 : i64
      %5748 = func.call @cc_make_string(%5746, %5747) : (!llvm.ptr, i64) -> i64
      %5749 = func.call @cc_nil_value() : () -> i64
      %5750 = func.call @cc_intern(%5748, %5749) : (i64, i64) -> i64
      %5751 = func.call @cc_nil_value() : () -> i64
      %5752 = func.call @cc_cons(%5750, %5751) : (i64, i64) -> i64
      %5753 = func.call @cc_values_pack(%5752) : (i64) -> i64
      func.call @stack_push_pointer(%5750) : (i64) -> ()
      %5754 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5755 = arith.constant 19 : i64
      %5756 = func.call @cc_make_string(%5754, %5755) : (!llvm.ptr, i64) -> i64
      %5757 = func.call @cc_nil_value() : () -> i64
      %5758 = func.call @cc_intern(%5756, %5757) : (i64, i64) -> i64
      %5759 = func.call @cc_nil_value() : () -> i64
      %5760 = func.call @cc_cons(%5758, %5759) : (i64, i64) -> i64
      %5761 = func.call @cc_values_pack(%5760) : (i64) -> i64
      func.call @stack_push_pointer(%5758) : (i64) -> ()
      %5762 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5763 = arith.constant 14 : i64
      %5764 = func.call @cc_make_string(%5762, %5763) : (!llvm.ptr, i64) -> i64
      %5765 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5766 = arith.constant 11 : i64
      %5767 = func.call @cc_make_string(%5765, %5766) : (!llvm.ptr, i64) -> i64
      %5768 = func.call @cc_intern(%5764, %5767) : (i64, i64) -> i64
      %5769 = func.call @cc_nil_value() : () -> i64
      %5770 = func.call @cc_cons(%5768, %5769) : (i64, i64) -> i64
      %5771 = func.call @cc_values_pack(%5770) : (i64) -> i64
      func.call @stack_push_pointer(%5768) : (i64) -> ()
      %5772 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5773 = arith.constant 15 : i64
      %5774 = func.call @cc_make_string(%5772, %5773) : (!llvm.ptr, i64) -> i64
      %5775 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5776 = arith.constant 11 : i64
      %5777 = func.call @cc_make_string(%5775, %5776) : (!llvm.ptr, i64) -> i64
      %5778 = func.call @cc_intern(%5774, %5777) : (i64, i64) -> i64
      %5779 = func.call @cc_nil_value() : () -> i64
      %5780 = func.call @cc_cons(%5778, %5779) : (i64, i64) -> i64
      %5781 = func.call @cc_values_pack(%5780) : (i64) -> i64
      func.call @stack_push_pointer(%5778) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5782 = func.call @stack_pop_pointer() : () -> i64
      %5783 = func.call @stack_pop_pointer() : () -> i64
      %5784 = func.call @cc_cons(%5783, %5782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5784) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5785 = func.call @stack_pop_pointer() : () -> i64
      %5786 = func.call @stack_pop_pointer() : () -> i64
      %5787 = func.call @cc_cons(%5786, %5785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5787) : (i64) -> ()
      %5788 = func.call @stack_pop_pointer() : () -> i64
      %5789 = func.call @stack_pop_pointer() : () -> i64
      %5790 = func.call @cc_cons(%5789, %5788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5790) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5791 = func.call @stack_pop_pointer() : () -> i64
      %5792 = func.call @stack_pop_pointer() : () -> i64
      %5793 = func.call @cc_cons(%5792, %5791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5793) : (i64) -> ()
      %5794 = func.call @stack_pop_pointer() : () -> i64
      %5795 = func.call @stack_pop_pointer() : () -> i64
      %5796 = func.call @cc_cons(%5795, %5794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5796) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %5797 = func.call @stack_pop_pointer() : () -> i64
      %5798 = func.call @stack_pop_pointer() : () -> i64
      %5799 = func.call @cc_cons(%5798, %5797) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5799) : (i64) -> ()
      %5800 = func.call @stack_pop_pointer() : () -> i64
      %5801 = func.call @stack_pop_pointer() : () -> i64
      %5802 = func.call @cc_cons(%5801, %5800) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5802) : (i64) -> ()
      %5803 = func.call @stack_pop_pointer() : () -> i64
      %5804 = func.call @stack_pop_pointer() : () -> i64
      %5805 = func.call @cc_cons(%5804, %5803) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5805) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5806 = func.call @stack_pop_pointer() : () -> i64
      %5807 = func.call @stack_pop_pointer() : () -> i64
      %5808 = func.call @cc_cons(%5807, %5806) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5808) : (i64) -> ()
      %5809 = func.call @stack_pop_pointer() : () -> i64
      %5810 = func.call @stack_pop_pointer() : () -> i64
      %5811 = func.call @cc_cons(%5810, %5809) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5811) : (i64) -> ()
      %5812 = func.call @stack_pop_pointer() : () -> i64
      %5869 = arith.constant 209815645192217 : i64
      %5870 = arith.constant 0 : i64
      %5871 = func.call @cc_make_closure(%5869, %5870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5871) : (i64) -> ()
      %5872 = func.call @stack_pop_pointer() : () -> i64
      %5873 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5874 = arith.constant 4 : i64
      %5875 = func.call @cc_make_string(%5873, %5874) : (!llvm.ptr, i64) -> i64
      %5876 = func.call @cc_nil_value() : () -> i64
      %5877 = func.call @cc_intern(%5875, %5876) : (i64, i64) -> i64
      %5878 = func.call @cc_nil_value() : () -> i64
      %5879 = func.call @cc_cons(%5877, %5878) : (i64, i64) -> i64
      %5880 = func.call @cc_values_pack(%5879) : (i64) -> i64
      func.call @stack_push_pointer(%5877) : (i64) -> ()
      %5881 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5882 = arith.constant 10 : i64
      %5883 = func.call @cc_make_string(%5881, %5882) : (!llvm.ptr, i64) -> i64
      %5884 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5885 = arith.constant 11 : i64
      %5886 = func.call @cc_make_string(%5884, %5885) : (!llvm.ptr, i64) -> i64
      %5887 = func.call @cc_intern(%5883, %5886) : (i64, i64) -> i64
      %5888 = func.call @cc_nil_value() : () -> i64
      %5889 = func.call @cc_cons(%5887, %5888) : (i64, i64) -> i64
      %5890 = func.call @cc_values_pack(%5889) : (i64) -> i64
      func.call @stack_push_pointer(%5887) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5891 = func.call @stack_pop_pointer() : () -> i64
      %5892 = func.call @stack_pop_pointer() : () -> i64
      %5893 = func.call @cc_cons(%5892, %5891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5893) : (i64) -> ()
      %5894 = func.call @stack_pop_pointer() : () -> i64
      %5895 = func.call @stack_pop_pointer() : () -> i64
      %5896 = func.call @cc_cons(%5895, %5894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5896) : (i64) -> ()
      %5897 = func.call @stack_pop_pointer() : () -> i64
      %5898 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5899 = arith.constant 11 : i64
      %5900 = func.call @cc_make_string(%5898, %5899) : (!llvm.ptr, i64) -> i64
      %5901 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5902 = arith.constant 7 : i64
      %5903 = func.call @cc_make_string(%5901, %5902) : (!llvm.ptr, i64) -> i64
      %5904 = func.call @cc_intern(%5900, %5903) : (i64, i64) -> i64
      %5905 = func.call @cc_nil_value() : () -> i64
      %5906 = func.call @cc_cons(%5904, %5905) : (i64, i64) -> i64
      %5907 = func.call @cc_values_pack(%5906) : (i64) -> i64
      func.call @stack_push_pointer(%5904) : (i64) -> ()
      %5908 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5909 = func.call @stack_pop_pointer() : () -> i64
      %5910 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5911 = arith.constant 4 : i64
      %5912 = func.call @cc_make_string(%5910, %5911) : (!llvm.ptr, i64) -> i64
      %5913 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5914 = arith.constant 7 : i64
      %5915 = func.call @cc_make_string(%5913, %5914) : (!llvm.ptr, i64) -> i64
      %5916 = func.call @cc_intern(%5912, %5915) : (i64, i64) -> i64
      %5917 = func.call @cc_nil_value() : () -> i64
      %5918 = func.call @cc_cons(%5916, %5917) : (i64, i64) -> i64
      %5919 = func.call @cc_values_pack(%5918) : (i64) -> i64
      func.call @stack_push_pointer(%5916) : (i64) -> ()
      %5920 = func.call @stack_pop_pointer() : () -> i64
      %5921 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5922 = arith.constant 5 : i64
      %5923 = func.call @cc_make_string(%5921, %5922) : (!llvm.ptr, i64) -> i64
      %5924 = func.call @cc_nil_value() : () -> i64
      %5925 = func.call @cc_intern(%5923, %5924) : (i64, i64) -> i64
      %5926 = func.call @cc_nil_value() : () -> i64
      %5927 = func.call @cc_cons(%5925, %5926) : (i64, i64) -> i64
      %5928 = func.call @cc_values_pack(%5927) : (i64) -> i64
      func.call @stack_push_pointer(%5925) : (i64) -> ()
      %5929 = func.call @stack_pop_pointer() : () -> i64
      %5930 = func.call @cc_nil_value() : () -> i64
      %5931 = func.call @cc_errorp(%5735) : (i64) -> i64
      %5932 = arith.cmpi ne, %5931, %5930 : i64
      %5933 = arith.cmpi eq, %5930, %5930 : i64
      %5934 = arith.andi %5932, %5933 : i1
      %5935 = scf.if %5934 -> (i64) {
        scf.yield %5735 : i64
      } else {
        scf.yield %5930 : i64
      }
      %5936 = func.call @cc_errorp(%5812) : (i64) -> i64
      %5937 = arith.cmpi ne, %5936, %5930 : i64
      %5938 = arith.cmpi eq, %5935, %5930 : i64
      %5939 = arith.andi %5937, %5938 : i1
      %5940 = scf.if %5939 -> (i64) {
        scf.yield %5812 : i64
      } else {
        scf.yield %5935 : i64
      }
      %5941 = func.call @cc_errorp(%5872) : (i64) -> i64
      %5942 = arith.cmpi ne, %5941, %5930 : i64
      %5943 = arith.cmpi eq, %5940, %5930 : i64
      %5944 = arith.andi %5942, %5943 : i1
      %5945 = scf.if %5944 -> (i64) {
        scf.yield %5872 : i64
      } else {
        scf.yield %5940 : i64
      }
      %5946 = func.call @cc_errorp(%5897) : (i64) -> i64
      %5947 = arith.cmpi ne, %5946, %5930 : i64
      %5948 = arith.cmpi eq, %5945, %5930 : i64
      %5949 = arith.andi %5947, %5948 : i1
      %5950 = scf.if %5949 -> (i64) {
        scf.yield %5897 : i64
      } else {
        scf.yield %5945 : i64
      }
      %5951 = func.call @cc_errorp(%5908) : (i64) -> i64
      %5952 = arith.cmpi ne, %5951, %5930 : i64
      %5953 = arith.cmpi eq, %5950, %5930 : i64
      %5954 = arith.andi %5952, %5953 : i1
      %5955 = scf.if %5954 -> (i64) {
        scf.yield %5908 : i64
      } else {
        scf.yield %5950 : i64
      }
      %5956 = func.call @cc_errorp(%5909) : (i64) -> i64
      %5957 = arith.cmpi ne, %5956, %5930 : i64
      %5958 = arith.cmpi eq, %5955, %5930 : i64
      %5959 = arith.andi %5957, %5958 : i1
      %5960 = scf.if %5959 -> (i64) {
        scf.yield %5909 : i64
      } else {
        scf.yield %5955 : i64
      }
      %5961 = func.call @cc_errorp(%5920) : (i64) -> i64
      %5962 = arith.cmpi ne, %5961, %5930 : i64
      %5963 = arith.cmpi eq, %5960, %5930 : i64
      %5964 = arith.andi %5962, %5963 : i1
      %5965 = scf.if %5964 -> (i64) {
        scf.yield %5920 : i64
      } else {
        scf.yield %5960 : i64
      }
      %5966 = func.call @cc_errorp(%5929) : (i64) -> i64
      %5967 = arith.cmpi ne, %5966, %5930 : i64
      %5968 = arith.cmpi eq, %5965, %5930 : i64
      %5969 = arith.andi %5967, %5968 : i1
      %5970 = scf.if %5969 -> (i64) {
        scf.yield %5929 : i64
      } else {
        scf.yield %5965 : i64
      }
      %5971 = arith.cmpi ne, %5970, %5930 : i64
      scf.if %5971 {
        func.call @stack_push_pointer(%5970) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5735) : (i64) -> ()
        func.call @stack_push_pointer(%5812) : (i64) -> ()
        func.call @stack_push_pointer(%5872) : (i64) -> ()
        func.call @stack_push_pointer(%5897) : (i64) -> ()
        func.call @stack_push_pointer(%5908) : (i64) -> ()
        func.call @stack_push_pointer(%5909) : (i64) -> ()
        func.call @stack_push_pointer(%5920) : (i64) -> ()
        func.call @stack_push_pointer(%5929) : (i64) -> ()
        %5972 = llvm.mlir.addressof @str446 : !llvm.ptr
        %5973 = func.call @cc_make_function_ref_const(%5972) : (!llvm.ptr) -> i64
        %5974 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5973, %5974) : (i64, i64) -> ()
      }
      %5975 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5975 : i64
    }
    %5976 = func.call @cc_nil_value() : () -> i64
    %5977 = func.call @cc_errorp(%5726) : (i64) -> i64
    %5978 = arith.cmpi ne, %5977, %5976 : i64
    %5979 = scf.if %5978 -> (i64) {
      scf.yield %5726 : i64
    } else {
      %5980 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5981 = arith.constant 12 : i64
      %5982 = func.call @cc_make_string(%5980, %5981) : (!llvm.ptr, i64) -> i64
      %5983 = func.call @cc_nil_value() : () -> i64
      %5984 = func.call @cc_intern(%5982, %5983) : (i64, i64) -> i64
      %5985 = func.call @cc_nil_value() : () -> i64
      %5986 = func.call @cc_cons(%5984, %5985) : (i64, i64) -> i64
      %5987 = func.call @cc_values_pack(%5986) : (i64) -> i64
      func.call @stack_push_pointer(%5984) : (i64) -> ()
      %5988 = func.call @stack_pop_pointer() : () -> i64
      %5989 = llvm.mlir.addressof @str448 : !llvm.ptr
      %5990 = arith.constant 9 : i64
      %5991 = func.call @cc_make_string(%5989, %5990) : (!llvm.ptr, i64) -> i64
      %5992 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5993 = arith.constant 11 : i64
      %5994 = func.call @cc_make_string(%5992, %5993) : (!llvm.ptr, i64) -> i64
      %5995 = func.call @cc_intern(%5991, %5994) : (i64, i64) -> i64
      %5996 = func.call @cc_nil_value() : () -> i64
      %5997 = func.call @cc_cons(%5995, %5996) : (i64, i64) -> i64
      %5998 = func.call @cc_values_pack(%5997) : (i64) -> i64
      func.call @stack_push_pointer(%5995) : (i64) -> ()
      %5999 = llvm.mlir.addressof @str450 : !llvm.ptr
      %6000 = arith.constant 9 : i64
      %6001 = func.call @cc_make_string(%5999, %6000) : (!llvm.ptr, i64) -> i64
      %6002 = llvm.mlir.addressof @str451 : !llvm.ptr
      %6003 = arith.constant 11 : i64
      %6004 = func.call @cc_make_string(%6002, %6003) : (!llvm.ptr, i64) -> i64
      %6005 = func.call @cc_intern(%6001, %6004) : (i64, i64) -> i64
      %6006 = func.call @cc_nil_value() : () -> i64
      %6007 = func.call @cc_cons(%6005, %6006) : (i64, i64) -> i64
      %6008 = func.call @cc_values_pack(%6007) : (i64) -> i64
      func.call @stack_push_pointer(%6005) : (i64) -> ()
      %6009 = llvm.mlir.addressof @str452 : !llvm.ptr
      %6010 = arith.constant 9 : i64
      %6011 = func.call @cc_make_string(%6009, %6010) : (!llvm.ptr, i64) -> i64
      %6012 = llvm.mlir.addressof @str453 : !llvm.ptr
      %6013 = arith.constant 11 : i64
      %6014 = func.call @cc_make_string(%6012, %6013) : (!llvm.ptr, i64) -> i64
      %6015 = func.call @cc_intern(%6011, %6014) : (i64, i64) -> i64
      %6016 = func.call @cc_nil_value() : () -> i64
      %6017 = func.call @cc_cons(%6015, %6016) : (i64, i64) -> i64
      %6018 = func.call @cc_values_pack(%6017) : (i64) -> i64
      func.call @stack_push_pointer(%6015) : (i64) -> ()
      %6019 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%6019) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6020 = func.call @stack_pop_pointer() : () -> i64
      %6021 = func.call @stack_pop_pointer() : () -> i64
      %6022 = func.call @cc_cons(%6021, %6020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6022) : (i64) -> ()
      %6023 = func.call @stack_pop_pointer() : () -> i64
      %6024 = func.call @stack_pop_pointer() : () -> i64
      %6025 = func.call @cc_cons(%6024, %6023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6026 = func.call @stack_pop_pointer() : () -> i64
      %6027 = func.call @stack_pop_pointer() : () -> i64
      %6028 = func.call @cc_cons(%6027, %6026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6028) : (i64) -> ()
      %6029 = func.call @stack_pop_pointer() : () -> i64
      %6030 = func.call @stack_pop_pointer() : () -> i64
      %6031 = func.call @cc_cons(%6030, %6029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6031) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6032 = func.call @stack_pop_pointer() : () -> i64
      %6033 = func.call @stack_pop_pointer() : () -> i64
      %6034 = func.call @cc_cons(%6033, %6032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6034) : (i64) -> ()
      %6035 = func.call @stack_pop_pointer() : () -> i64
      %6036 = func.call @stack_pop_pointer() : () -> i64
      %6037 = func.call @cc_cons(%6036, %6035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6037) : (i64) -> ()
      %6038 = func.call @stack_pop_pointer() : () -> i64
      %6053 = arith.constant 209815645192218 : i64
      %6054 = arith.constant 0 : i64
      %6055 = func.call @cc_make_closure(%6053, %6054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6055) : (i64) -> ()
      %6056 = func.call @stack_pop_pointer() : () -> i64
      %6057 = arith.constant 13 : i64
      %6058 = func.call @cc_box_character(%6057) : (i64) -> i64
      func.call @stack_push_pointer(%6058) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6059 = func.call @stack_pop_pointer() : () -> i64
      %6060 = func.call @stack_pop_pointer() : () -> i64
      %6061 = func.call @cc_cons(%6060, %6059) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6061) : (i64) -> ()
      %6062 = func.call @stack_pop_pointer() : () -> i64
      %6063 = llvm.mlir.addressof @str454 : !llvm.ptr
      %6064 = arith.constant 11 : i64
      %6065 = func.call @cc_make_string(%6063, %6064) : (!llvm.ptr, i64) -> i64
      %6066 = llvm.mlir.addressof @str455 : !llvm.ptr
      %6067 = arith.constant 7 : i64
      %6068 = func.call @cc_make_string(%6066, %6067) : (!llvm.ptr, i64) -> i64
      %6069 = func.call @cc_intern(%6065, %6068) : (i64, i64) -> i64
      %6070 = func.call @cc_nil_value() : () -> i64
      %6071 = func.call @cc_cons(%6069, %6070) : (i64, i64) -> i64
      %6072 = func.call @cc_values_pack(%6071) : (i64) -> i64
      func.call @stack_push_pointer(%6069) : (i64) -> ()
      %6073 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6074 = func.call @stack_pop_pointer() : () -> i64
      %6075 = llvm.mlir.addressof @str456 : !llvm.ptr
      %6076 = arith.constant 4 : i64
      %6077 = func.call @cc_make_string(%6075, %6076) : (!llvm.ptr, i64) -> i64
      %6078 = llvm.mlir.addressof @str457 : !llvm.ptr
      %6079 = arith.constant 7 : i64
      %6080 = func.call @cc_make_string(%6078, %6079) : (!llvm.ptr, i64) -> i64
      %6081 = func.call @cc_intern(%6077, %6080) : (i64, i64) -> i64
      %6082 = func.call @cc_nil_value() : () -> i64
      %6083 = func.call @cc_cons(%6081, %6082) : (i64, i64) -> i64
      %6084 = func.call @cc_values_pack(%6083) : (i64) -> i64
      func.call @stack_push_pointer(%6081) : (i64) -> ()
      %6085 = func.call @stack_pop_pointer() : () -> i64
      %6086 = llvm.mlir.addressof @str458 : !llvm.ptr
      %6087 = arith.constant 6 : i64
      %6088 = func.call @cc_make_string(%6086, %6087) : (!llvm.ptr, i64) -> i64
      %6089 = func.call @cc_nil_value() : () -> i64
      %6090 = func.call @cc_intern(%6088, %6089) : (i64, i64) -> i64
      %6091 = func.call @cc_nil_value() : () -> i64
      %6092 = func.call @cc_cons(%6090, %6091) : (i64, i64) -> i64
      %6093 = func.call @cc_values_pack(%6092) : (i64) -> i64
      func.call @stack_push_pointer(%6090) : (i64) -> ()
      %6094 = func.call @stack_pop_pointer() : () -> i64
      %6095 = func.call @cc_nil_value() : () -> i64
      %6096 = func.call @cc_errorp(%5988) : (i64) -> i64
      %6097 = arith.cmpi ne, %6096, %6095 : i64
      %6098 = arith.cmpi eq, %6095, %6095 : i64
      %6099 = arith.andi %6097, %6098 : i1
      %6100 = scf.if %6099 -> (i64) {
        scf.yield %5988 : i64
      } else {
        scf.yield %6095 : i64
      }
      %6101 = func.call @cc_errorp(%6038) : (i64) -> i64
      %6102 = arith.cmpi ne, %6101, %6095 : i64
      %6103 = arith.cmpi eq, %6100, %6095 : i64
      %6104 = arith.andi %6102, %6103 : i1
      %6105 = scf.if %6104 -> (i64) {
        scf.yield %6038 : i64
      } else {
        scf.yield %6100 : i64
      }
      %6106 = func.call @cc_errorp(%6056) : (i64) -> i64
      %6107 = arith.cmpi ne, %6106, %6095 : i64
      %6108 = arith.cmpi eq, %6105, %6095 : i64
      %6109 = arith.andi %6107, %6108 : i1
      %6110 = scf.if %6109 -> (i64) {
        scf.yield %6056 : i64
      } else {
        scf.yield %6105 : i64
      }
      %6111 = func.call @cc_errorp(%6062) : (i64) -> i64
      %6112 = arith.cmpi ne, %6111, %6095 : i64
      %6113 = arith.cmpi eq, %6110, %6095 : i64
      %6114 = arith.andi %6112, %6113 : i1
      %6115 = scf.if %6114 -> (i64) {
        scf.yield %6062 : i64
      } else {
        scf.yield %6110 : i64
      }
      %6116 = func.call @cc_errorp(%6073) : (i64) -> i64
      %6117 = arith.cmpi ne, %6116, %6095 : i64
      %6118 = arith.cmpi eq, %6115, %6095 : i64
      %6119 = arith.andi %6117, %6118 : i1
      %6120 = scf.if %6119 -> (i64) {
        scf.yield %6073 : i64
      } else {
        scf.yield %6115 : i64
      }
      %6121 = func.call @cc_errorp(%6074) : (i64) -> i64
      %6122 = arith.cmpi ne, %6121, %6095 : i64
      %6123 = arith.cmpi eq, %6120, %6095 : i64
      %6124 = arith.andi %6122, %6123 : i1
      %6125 = scf.if %6124 -> (i64) {
        scf.yield %6074 : i64
      } else {
        scf.yield %6120 : i64
      }
      %6126 = func.call @cc_errorp(%6085) : (i64) -> i64
      %6127 = arith.cmpi ne, %6126, %6095 : i64
      %6128 = arith.cmpi eq, %6125, %6095 : i64
      %6129 = arith.andi %6127, %6128 : i1
      %6130 = scf.if %6129 -> (i64) {
        scf.yield %6085 : i64
      } else {
        scf.yield %6125 : i64
      }
      %6131 = func.call @cc_errorp(%6094) : (i64) -> i64
      %6132 = arith.cmpi ne, %6131, %6095 : i64
      %6133 = arith.cmpi eq, %6130, %6095 : i64
      %6134 = arith.andi %6132, %6133 : i1
      %6135 = scf.if %6134 -> (i64) {
        scf.yield %6094 : i64
      } else {
        scf.yield %6130 : i64
      }
      %6136 = arith.cmpi ne, %6135, %6095 : i64
      scf.if %6136 {
        func.call @stack_push_pointer(%6135) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5988) : (i64) -> ()
        func.call @stack_push_pointer(%6038) : (i64) -> ()
        func.call @stack_push_pointer(%6056) : (i64) -> ()
        func.call @stack_push_pointer(%6062) : (i64) -> ()
        func.call @stack_push_pointer(%6073) : (i64) -> ()
        func.call @stack_push_pointer(%6074) : (i64) -> ()
        func.call @stack_push_pointer(%6085) : (i64) -> ()
        func.call @stack_push_pointer(%6094) : (i64) -> ()
        %6137 = llvm.mlir.addressof @str459 : !llvm.ptr
        %6138 = func.call @cc_make_function_ref_const(%6137) : (!llvm.ptr) -> i64
        %6139 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6138, %6139) : (i64, i64) -> ()
      }
      %6140 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6140 : i64
    }
    %6141 = func.call @cc_nil_value() : () -> i64
    %6142 = func.call @cc_errorp(%5979) : (i64) -> i64
    %6143 = arith.cmpi ne, %6142, %6141 : i64
    %6144 = scf.if %6143 -> (i64) {
      scf.yield %5979 : i64
    } else {
      %6145 = llvm.mlir.addressof @str460 : !llvm.ptr
      %6146 = arith.constant 13 : i64
      %6147 = func.call @cc_make_string(%6145, %6146) : (!llvm.ptr, i64) -> i64
      %6148 = func.call @cc_nil_value() : () -> i64
      %6149 = func.call @cc_intern(%6147, %6148) : (i64, i64) -> i64
      %6150 = func.call @cc_nil_value() : () -> i64
      %6151 = func.call @cc_cons(%6149, %6150) : (i64, i64) -> i64
      %6152 = func.call @cc_values_pack(%6151) : (i64) -> i64
      func.call @stack_push_pointer(%6149) : (i64) -> ()
      %6153 = func.call @stack_pop_pointer() : () -> i64
      %6154 = llvm.mlir.addressof @str461 : !llvm.ptr
      %6155 = arith.constant 9 : i64
      %6156 = func.call @cc_make_string(%6154, %6155) : (!llvm.ptr, i64) -> i64
      %6157 = llvm.mlir.addressof @str462 : !llvm.ptr
      %6158 = arith.constant 11 : i64
      %6159 = func.call @cc_make_string(%6157, %6158) : (!llvm.ptr, i64) -> i64
      %6160 = func.call @cc_intern(%6156, %6159) : (i64, i64) -> i64
      %6161 = func.call @cc_nil_value() : () -> i64
      %6162 = func.call @cc_cons(%6160, %6161) : (i64, i64) -> i64
      %6163 = func.call @cc_values_pack(%6162) : (i64) -> i64
      func.call @stack_push_pointer(%6160) : (i64) -> ()
      %6164 = llvm.mlir.addressof @str463 : !llvm.ptr
      %6165 = arith.constant 9 : i64
      %6166 = func.call @cc_make_string(%6164, %6165) : (!llvm.ptr, i64) -> i64
      %6167 = llvm.mlir.addressof @str464 : !llvm.ptr
      %6168 = arith.constant 11 : i64
      %6169 = func.call @cc_make_string(%6167, %6168) : (!llvm.ptr, i64) -> i64
      %6170 = func.call @cc_intern(%6166, %6169) : (i64, i64) -> i64
      %6171 = func.call @cc_nil_value() : () -> i64
      %6172 = func.call @cc_cons(%6170, %6171) : (i64, i64) -> i64
      %6173 = func.call @cc_values_pack(%6172) : (i64) -> i64
      func.call @stack_push_pointer(%6170) : (i64) -> ()
      %6174 = llvm.mlir.addressof @str465 : !llvm.ptr
      %6175 = arith.constant 9 : i64
      %6176 = func.call @cc_make_string(%6174, %6175) : (!llvm.ptr, i64) -> i64
      %6177 = llvm.mlir.addressof @str466 : !llvm.ptr
      %6178 = arith.constant 11 : i64
      %6179 = func.call @cc_make_string(%6177, %6178) : (!llvm.ptr, i64) -> i64
      %6180 = func.call @cc_intern(%6176, %6179) : (i64, i64) -> i64
      %6181 = func.call @cc_nil_value() : () -> i64
      %6182 = func.call @cc_cons(%6180, %6181) : (i64, i64) -> i64
      %6183 = func.call @cc_values_pack(%6182) : (i64) -> i64
      func.call @stack_push_pointer(%6180) : (i64) -> ()
      %6184 = arith.constant 128 : i64
      func.call @stack_push_fixnum(%6184) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6185 = func.call @stack_pop_pointer() : () -> i64
      %6186 = func.call @stack_pop_pointer() : () -> i64
      %6187 = func.call @cc_cons(%6186, %6185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6187) : (i64) -> ()
      %6188 = func.call @stack_pop_pointer() : () -> i64
      %6189 = func.call @stack_pop_pointer() : () -> i64
      %6190 = func.call @cc_cons(%6189, %6188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6190) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6191 = func.call @stack_pop_pointer() : () -> i64
      %6192 = func.call @stack_pop_pointer() : () -> i64
      %6193 = func.call @cc_cons(%6192, %6191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6193) : (i64) -> ()
      %6194 = func.call @stack_pop_pointer() : () -> i64
      %6195 = func.call @stack_pop_pointer() : () -> i64
      %6196 = func.call @cc_cons(%6195, %6194) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6196) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6197 = func.call @stack_pop_pointer() : () -> i64
      %6198 = func.call @stack_pop_pointer() : () -> i64
      %6199 = func.call @cc_cons(%6198, %6197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6199) : (i64) -> ()
      %6200 = func.call @stack_pop_pointer() : () -> i64
      %6201 = func.call @stack_pop_pointer() : () -> i64
      %6202 = func.call @cc_cons(%6201, %6200) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6202) : (i64) -> ()
      %6203 = func.call @stack_pop_pointer() : () -> i64
      %6218 = arith.constant 209815645192219 : i64
      %6219 = arith.constant 0 : i64
      %6220 = func.call @cc_make_closure(%6218, %6219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6220) : (i64) -> ()
      %6221 = func.call @stack_pop_pointer() : () -> i64
      %6222 = arith.constant 128 : i64
      %6223 = func.call @cc_box_character(%6222) : (i64) -> i64
      func.call @stack_push_pointer(%6223) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6224 = func.call @stack_pop_pointer() : () -> i64
      %6225 = func.call @stack_pop_pointer() : () -> i64
      %6226 = func.call @cc_cons(%6225, %6224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6226) : (i64) -> ()
      %6227 = func.call @stack_pop_pointer() : () -> i64
      %6228 = llvm.mlir.addressof @str467 : !llvm.ptr
      %6229 = arith.constant 11 : i64
      %6230 = func.call @cc_make_string(%6228, %6229) : (!llvm.ptr, i64) -> i64
      %6231 = llvm.mlir.addressof @str468 : !llvm.ptr
      %6232 = arith.constant 7 : i64
      %6233 = func.call @cc_make_string(%6231, %6232) : (!llvm.ptr, i64) -> i64
      %6234 = func.call @cc_intern(%6230, %6233) : (i64, i64) -> i64
      %6235 = func.call @cc_nil_value() : () -> i64
      %6236 = func.call @cc_cons(%6234, %6235) : (i64, i64) -> i64
      %6237 = func.call @cc_values_pack(%6236) : (i64) -> i64
      func.call @stack_push_pointer(%6234) : (i64) -> ()
      %6238 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6239 = func.call @stack_pop_pointer() : () -> i64
      %6240 = llvm.mlir.addressof @str469 : !llvm.ptr
      %6241 = arith.constant 4 : i64
      %6242 = func.call @cc_make_string(%6240, %6241) : (!llvm.ptr, i64) -> i64
      %6243 = llvm.mlir.addressof @str470 : !llvm.ptr
      %6244 = arith.constant 7 : i64
      %6245 = func.call @cc_make_string(%6243, %6244) : (!llvm.ptr, i64) -> i64
      %6246 = func.call @cc_intern(%6242, %6245) : (i64, i64) -> i64
      %6247 = func.call @cc_nil_value() : () -> i64
      %6248 = func.call @cc_cons(%6246, %6247) : (i64, i64) -> i64
      %6249 = func.call @cc_values_pack(%6248) : (i64) -> i64
      func.call @stack_push_pointer(%6246) : (i64) -> ()
      %6250 = func.call @stack_pop_pointer() : () -> i64
      %6251 = llvm.mlir.addressof @str471 : !llvm.ptr
      %6252 = arith.constant 6 : i64
      %6253 = func.call @cc_make_string(%6251, %6252) : (!llvm.ptr, i64) -> i64
      %6254 = func.call @cc_nil_value() : () -> i64
      %6255 = func.call @cc_intern(%6253, %6254) : (i64, i64) -> i64
      %6256 = func.call @cc_nil_value() : () -> i64
      %6257 = func.call @cc_cons(%6255, %6256) : (i64, i64) -> i64
      %6258 = func.call @cc_values_pack(%6257) : (i64) -> i64
      func.call @stack_push_pointer(%6255) : (i64) -> ()
      %6259 = func.call @stack_pop_pointer() : () -> i64
      %6260 = func.call @cc_nil_value() : () -> i64
      %6261 = func.call @cc_errorp(%6153) : (i64) -> i64
      %6262 = arith.cmpi ne, %6261, %6260 : i64
      %6263 = arith.cmpi eq, %6260, %6260 : i64
      %6264 = arith.andi %6262, %6263 : i1
      %6265 = scf.if %6264 -> (i64) {
        scf.yield %6153 : i64
      } else {
        scf.yield %6260 : i64
      }
      %6266 = func.call @cc_errorp(%6203) : (i64) -> i64
      %6267 = arith.cmpi ne, %6266, %6260 : i64
      %6268 = arith.cmpi eq, %6265, %6260 : i64
      %6269 = arith.andi %6267, %6268 : i1
      %6270 = scf.if %6269 -> (i64) {
        scf.yield %6203 : i64
      } else {
        scf.yield %6265 : i64
      }
      %6271 = func.call @cc_errorp(%6221) : (i64) -> i64
      %6272 = arith.cmpi ne, %6271, %6260 : i64
      %6273 = arith.cmpi eq, %6270, %6260 : i64
      %6274 = arith.andi %6272, %6273 : i1
      %6275 = scf.if %6274 -> (i64) {
        scf.yield %6221 : i64
      } else {
        scf.yield %6270 : i64
      }
      %6276 = func.call @cc_errorp(%6227) : (i64) -> i64
      %6277 = arith.cmpi ne, %6276, %6260 : i64
      %6278 = arith.cmpi eq, %6275, %6260 : i64
      %6279 = arith.andi %6277, %6278 : i1
      %6280 = scf.if %6279 -> (i64) {
        scf.yield %6227 : i64
      } else {
        scf.yield %6275 : i64
      }
      %6281 = func.call @cc_errorp(%6238) : (i64) -> i64
      %6282 = arith.cmpi ne, %6281, %6260 : i64
      %6283 = arith.cmpi eq, %6280, %6260 : i64
      %6284 = arith.andi %6282, %6283 : i1
      %6285 = scf.if %6284 -> (i64) {
        scf.yield %6238 : i64
      } else {
        scf.yield %6280 : i64
      }
      %6286 = func.call @cc_errorp(%6239) : (i64) -> i64
      %6287 = arith.cmpi ne, %6286, %6260 : i64
      %6288 = arith.cmpi eq, %6285, %6260 : i64
      %6289 = arith.andi %6287, %6288 : i1
      %6290 = scf.if %6289 -> (i64) {
        scf.yield %6239 : i64
      } else {
        scf.yield %6285 : i64
      }
      %6291 = func.call @cc_errorp(%6250) : (i64) -> i64
      %6292 = arith.cmpi ne, %6291, %6260 : i64
      %6293 = arith.cmpi eq, %6290, %6260 : i64
      %6294 = arith.andi %6292, %6293 : i1
      %6295 = scf.if %6294 -> (i64) {
        scf.yield %6250 : i64
      } else {
        scf.yield %6290 : i64
      }
      %6296 = func.call @cc_errorp(%6259) : (i64) -> i64
      %6297 = arith.cmpi ne, %6296, %6260 : i64
      %6298 = arith.cmpi eq, %6295, %6260 : i64
      %6299 = arith.andi %6297, %6298 : i1
      %6300 = scf.if %6299 -> (i64) {
        scf.yield %6259 : i64
      } else {
        scf.yield %6295 : i64
      }
      %6301 = arith.cmpi ne, %6300, %6260 : i64
      scf.if %6301 {
        func.call @stack_push_pointer(%6300) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6153) : (i64) -> ()
        func.call @stack_push_pointer(%6203) : (i64) -> ()
        func.call @stack_push_pointer(%6221) : (i64) -> ()
        func.call @stack_push_pointer(%6227) : (i64) -> ()
        func.call @stack_push_pointer(%6238) : (i64) -> ()
        func.call @stack_push_pointer(%6239) : (i64) -> ()
        func.call @stack_push_pointer(%6250) : (i64) -> ()
        func.call @stack_push_pointer(%6259) : (i64) -> ()
        %6302 = llvm.mlir.addressof @str472 : !llvm.ptr
        %6303 = func.call @cc_make_function_ref_const(%6302) : (!llvm.ptr) -> i64
        %6304 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6303, %6304) : (i64, i64) -> ()
      }
      %6305 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6305 : i64
    }
    %6306 = func.call @cc_nil_value() : () -> i64
    %6307 = func.call @cc_errorp(%6144) : (i64) -> i64
    %6308 = arith.cmpi ne, %6307, %6306 : i64
    %6309 = scf.if %6308 -> (i64) {
      scf.yield %6144 : i64
    } else {
      %6310 = llvm.mlir.addressof @str473 : !llvm.ptr
      %6311 = arith.constant 12 : i64
      %6312 = func.call @cc_make_string(%6310, %6311) : (!llvm.ptr, i64) -> i64
      %6313 = func.call @cc_nil_value() : () -> i64
      %6314 = func.call @cc_intern(%6312, %6313) : (i64, i64) -> i64
      %6315 = func.call @cc_nil_value() : () -> i64
      %6316 = func.call @cc_cons(%6314, %6315) : (i64, i64) -> i64
      %6317 = func.call @cc_values_pack(%6316) : (i64) -> i64
      func.call @stack_push_pointer(%6314) : (i64) -> ()
      %6318 = func.call @stack_pop_pointer() : () -> i64
      %6319 = llvm.mlir.addressof @str474 : !llvm.ptr
      %6320 = arith.constant 6 : i64
      %6321 = func.call @cc_make_string(%6319, %6320) : (!llvm.ptr, i64) -> i64
      %6322 = func.call @cc_nil_value() : () -> i64
      %6323 = func.call @cc_intern(%6321, %6322) : (i64, i64) -> i64
      %6324 = func.call @cc_nil_value() : () -> i64
      %6325 = func.call @cc_cons(%6323, %6324) : (i64, i64) -> i64
      %6326 = func.call @cc_values_pack(%6325) : (i64) -> i64
      func.call @stack_push_pointer(%6323) : (i64) -> ()
      %6327 = llvm.mlir.addressof @str475 : !llvm.ptr
      %6328 = arith.constant 9 : i64
      %6329 = func.call @cc_make_string(%6327, %6328) : (!llvm.ptr, i64) -> i64
      %6330 = llvm.mlir.addressof @str476 : !llvm.ptr
      %6331 = arith.constant 11 : i64
      %6332 = func.call @cc_make_string(%6330, %6331) : (!llvm.ptr, i64) -> i64
      %6333 = func.call @cc_intern(%6329, %6332) : (i64, i64) -> i64
      %6334 = func.call @cc_nil_value() : () -> i64
      %6335 = func.call @cc_cons(%6333, %6334) : (i64, i64) -> i64
      %6336 = func.call @cc_values_pack(%6335) : (i64) -> i64
      func.call @stack_push_pointer(%6333) : (i64) -> ()
      %6337 = llvm.mlir.addressof @str477 : !llvm.ptr
      %6338 = arith.constant 9 : i64
      %6339 = func.call @cc_make_string(%6337, %6338) : (!llvm.ptr, i64) -> i64
      %6340 = llvm.mlir.addressof @str478 : !llvm.ptr
      %6341 = arith.constant 11 : i64
      %6342 = func.call @cc_make_string(%6340, %6341) : (!llvm.ptr, i64) -> i64
      %6343 = func.call @cc_intern(%6339, %6342) : (i64, i64) -> i64
      %6344 = func.call @cc_nil_value() : () -> i64
      %6345 = func.call @cc_cons(%6343, %6344) : (i64, i64) -> i64
      %6346 = func.call @cc_values_pack(%6345) : (i64) -> i64
      func.call @stack_push_pointer(%6343) : (i64) -> ()
      %6347 = llvm.mlir.addressof @str479 : !llvm.ptr
      %6348 = arith.constant 9 : i64
      %6349 = func.call @cc_make_string(%6347, %6348) : (!llvm.ptr, i64) -> i64
      %6350 = llvm.mlir.addressof @str480 : !llvm.ptr
      %6351 = arith.constant 11 : i64
      %6352 = func.call @cc_make_string(%6350, %6351) : (!llvm.ptr, i64) -> i64
      %6353 = func.call @cc_intern(%6349, %6352) : (i64, i64) -> i64
      %6354 = func.call @cc_nil_value() : () -> i64
      %6355 = func.call @cc_cons(%6353, %6354) : (i64, i64) -> i64
      %6356 = func.call @cc_values_pack(%6355) : (i64) -> i64
      func.call @stack_push_pointer(%6353) : (i64) -> ()
      %6357 = arith.constant 255 : i64
      func.call @stack_push_fixnum(%6357) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6358 = func.call @stack_pop_pointer() : () -> i64
      %6359 = func.call @stack_pop_pointer() : () -> i64
      %6360 = func.call @cc_cons(%6359, %6358) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6360) : (i64) -> ()
      %6361 = func.call @stack_pop_pointer() : () -> i64
      %6362 = func.call @stack_pop_pointer() : () -> i64
      %6363 = func.call @cc_cons(%6362, %6361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6363) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6364 = func.call @stack_pop_pointer() : () -> i64
      %6365 = func.call @stack_pop_pointer() : () -> i64
      %6366 = func.call @cc_cons(%6365, %6364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6366) : (i64) -> ()
      %6367 = func.call @stack_pop_pointer() : () -> i64
      %6368 = func.call @stack_pop_pointer() : () -> i64
      %6369 = func.call @cc_cons(%6368, %6367) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6369) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6370 = func.call @stack_pop_pointer() : () -> i64
      %6371 = func.call @stack_pop_pointer() : () -> i64
      %6372 = func.call @cc_cons(%6371, %6370) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6372) : (i64) -> ()
      %6373 = func.call @stack_pop_pointer() : () -> i64
      %6374 = func.call @stack_pop_pointer() : () -> i64
      %6375 = func.call @cc_cons(%6374, %6373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6375) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6376 = func.call @stack_pop_pointer() : () -> i64
      %6377 = func.call @stack_pop_pointer() : () -> i64
      %6378 = func.call @cc_cons(%6377, %6376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6378) : (i64) -> ()
      %6379 = func.call @stack_pop_pointer() : () -> i64
      %6380 = func.call @stack_pop_pointer() : () -> i64
      %6381 = func.call @cc_cons(%6380, %6379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6381) : (i64) -> ()
      %6382 = func.call @stack_pop_pointer() : () -> i64
      %6402 = arith.constant 209815645192220 : i64
      %6403 = arith.constant 0 : i64
      %6404 = func.call @cc_make_closure(%6402, %6403) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6404) : (i64) -> ()
      %6405 = func.call @stack_pop_pointer() : () -> i64
      %6406 = llvm.mlir.addressof @str481 : !llvm.ptr
      %6407 = arith.constant 9 : i64
      %6408 = func.call @cc_make_string(%6406, %6407) : (!llvm.ptr, i64) -> i64
      %6409 = llvm.mlir.addressof @str482 : !llvm.ptr
      %6410 = arith.constant 11 : i64
      %6411 = func.call @cc_make_string(%6409, %6410) : (!llvm.ptr, i64) -> i64
      %6412 = func.call @cc_intern(%6408, %6411) : (i64, i64) -> i64
      %6413 = func.call @cc_nil_value() : () -> i64
      %6414 = func.call @cc_cons(%6412, %6413) : (i64, i64) -> i64
      %6415 = func.call @cc_values_pack(%6414) : (i64) -> i64
      func.call @stack_push_pointer(%6412) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6416 = func.call @stack_pop_pointer() : () -> i64
      %6417 = func.call @stack_pop_pointer() : () -> i64
      %6418 = func.call @cc_cons(%6417, %6416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6418) : (i64) -> ()
      %6419 = func.call @stack_pop_pointer() : () -> i64
      %6420 = llvm.mlir.addressof @str483 : !llvm.ptr
      %6421 = arith.constant 11 : i64
      %6422 = func.call @cc_make_string(%6420, %6421) : (!llvm.ptr, i64) -> i64
      %6423 = llvm.mlir.addressof @str484 : !llvm.ptr
      %6424 = arith.constant 7 : i64
      %6425 = func.call @cc_make_string(%6423, %6424) : (!llvm.ptr, i64) -> i64
      %6426 = func.call @cc_intern(%6422, %6425) : (i64, i64) -> i64
      %6427 = func.call @cc_nil_value() : () -> i64
      %6428 = func.call @cc_cons(%6426, %6427) : (i64, i64) -> i64
      %6429 = func.call @cc_values_pack(%6428) : (i64) -> i64
      func.call @stack_push_pointer(%6426) : (i64) -> ()
      %6430 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6431 = func.call @stack_pop_pointer() : () -> i64
      %6432 = llvm.mlir.addressof @str485 : !llvm.ptr
      %6433 = arith.constant 4 : i64
      %6434 = func.call @cc_make_string(%6432, %6433) : (!llvm.ptr, i64) -> i64
      %6435 = llvm.mlir.addressof @str486 : !llvm.ptr
      %6436 = arith.constant 7 : i64
      %6437 = func.call @cc_make_string(%6435, %6436) : (!llvm.ptr, i64) -> i64
      %6438 = func.call @cc_intern(%6434, %6437) : (i64, i64) -> i64
      %6439 = func.call @cc_nil_value() : () -> i64
      %6440 = func.call @cc_cons(%6438, %6439) : (i64, i64) -> i64
      %6441 = func.call @cc_values_pack(%6440) : (i64) -> i64
      func.call @stack_push_pointer(%6438) : (i64) -> ()
      %6442 = func.call @stack_pop_pointer() : () -> i64
      %6443 = llvm.mlir.addressof @str487 : !llvm.ptr
      %6444 = arith.constant 5 : i64
      %6445 = func.call @cc_make_string(%6443, %6444) : (!llvm.ptr, i64) -> i64
      %6446 = func.call @cc_nil_value() : () -> i64
      %6447 = func.call @cc_intern(%6445, %6446) : (i64, i64) -> i64
      %6448 = func.call @cc_nil_value() : () -> i64
      %6449 = func.call @cc_cons(%6447, %6448) : (i64, i64) -> i64
      %6450 = func.call @cc_values_pack(%6449) : (i64) -> i64
      func.call @stack_push_pointer(%6447) : (i64) -> ()
      %6451 = func.call @stack_pop_pointer() : () -> i64
      %6452 = func.call @cc_nil_value() : () -> i64
      %6453 = func.call @cc_errorp(%6318) : (i64) -> i64
      %6454 = arith.cmpi ne, %6453, %6452 : i64
      %6455 = arith.cmpi eq, %6452, %6452 : i64
      %6456 = arith.andi %6454, %6455 : i1
      %6457 = scf.if %6456 -> (i64) {
        scf.yield %6318 : i64
      } else {
        scf.yield %6452 : i64
      }
      %6458 = func.call @cc_errorp(%6382) : (i64) -> i64
      %6459 = arith.cmpi ne, %6458, %6452 : i64
      %6460 = arith.cmpi eq, %6457, %6452 : i64
      %6461 = arith.andi %6459, %6460 : i1
      %6462 = scf.if %6461 -> (i64) {
        scf.yield %6382 : i64
      } else {
        scf.yield %6457 : i64
      }
      %6463 = func.call @cc_errorp(%6405) : (i64) -> i64
      %6464 = arith.cmpi ne, %6463, %6452 : i64
      %6465 = arith.cmpi eq, %6462, %6452 : i64
      %6466 = arith.andi %6464, %6465 : i1
      %6467 = scf.if %6466 -> (i64) {
        scf.yield %6405 : i64
      } else {
        scf.yield %6462 : i64
      }
      %6468 = func.call @cc_errorp(%6419) : (i64) -> i64
      %6469 = arith.cmpi ne, %6468, %6452 : i64
      %6470 = arith.cmpi eq, %6467, %6452 : i64
      %6471 = arith.andi %6469, %6470 : i1
      %6472 = scf.if %6471 -> (i64) {
        scf.yield %6419 : i64
      } else {
        scf.yield %6467 : i64
      }
      %6473 = func.call @cc_errorp(%6430) : (i64) -> i64
      %6474 = arith.cmpi ne, %6473, %6452 : i64
      %6475 = arith.cmpi eq, %6472, %6452 : i64
      %6476 = arith.andi %6474, %6475 : i1
      %6477 = scf.if %6476 -> (i64) {
        scf.yield %6430 : i64
      } else {
        scf.yield %6472 : i64
      }
      %6478 = func.call @cc_errorp(%6431) : (i64) -> i64
      %6479 = arith.cmpi ne, %6478, %6452 : i64
      %6480 = arith.cmpi eq, %6477, %6452 : i64
      %6481 = arith.andi %6479, %6480 : i1
      %6482 = scf.if %6481 -> (i64) {
        scf.yield %6431 : i64
      } else {
        scf.yield %6477 : i64
      }
      %6483 = func.call @cc_errorp(%6442) : (i64) -> i64
      %6484 = arith.cmpi ne, %6483, %6452 : i64
      %6485 = arith.cmpi eq, %6482, %6452 : i64
      %6486 = arith.andi %6484, %6485 : i1
      %6487 = scf.if %6486 -> (i64) {
        scf.yield %6442 : i64
      } else {
        scf.yield %6482 : i64
      }
      %6488 = func.call @cc_errorp(%6451) : (i64) -> i64
      %6489 = arith.cmpi ne, %6488, %6452 : i64
      %6490 = arith.cmpi eq, %6487, %6452 : i64
      %6491 = arith.andi %6489, %6490 : i1
      %6492 = scf.if %6491 -> (i64) {
        scf.yield %6451 : i64
      } else {
        scf.yield %6487 : i64
      }
      %6493 = arith.cmpi ne, %6492, %6452 : i64
      scf.if %6493 {
        func.call @stack_push_pointer(%6492) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6318) : (i64) -> ()
        func.call @stack_push_pointer(%6382) : (i64) -> ()
        func.call @stack_push_pointer(%6405) : (i64) -> ()
        func.call @stack_push_pointer(%6419) : (i64) -> ()
        func.call @stack_push_pointer(%6430) : (i64) -> ()
        func.call @stack_push_pointer(%6431) : (i64) -> ()
        func.call @stack_push_pointer(%6442) : (i64) -> ()
        func.call @stack_push_pointer(%6451) : (i64) -> ()
        %6494 = llvm.mlir.addressof @str488 : !llvm.ptr
        %6495 = func.call @cc_make_function_ref_const(%6494) : (!llvm.ptr) -> i64
        %6496 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6495, %6496) : (i64, i64) -> ()
      }
      %6497 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6497 : i64
    }
    %6498 = func.call @cc_nil_value() : () -> i64
    %6499 = func.call @cc_errorp(%6309) : (i64) -> i64
    %6500 = arith.cmpi ne, %6499, %6498 : i64
    %6501 = scf.if %6500 -> (i64) {
      scf.yield %6309 : i64
    } else {
      %6502 = llvm.mlir.addressof @str489 : !llvm.ptr
      %6503 = arith.constant 12 : i64
      %6504 = func.call @cc_make_string(%6502, %6503) : (!llvm.ptr, i64) -> i64
      %6505 = func.call @cc_nil_value() : () -> i64
      %6506 = func.call @cc_intern(%6504, %6505) : (i64, i64) -> i64
      %6507 = func.call @cc_nil_value() : () -> i64
      %6508 = func.call @cc_cons(%6506, %6507) : (i64, i64) -> i64
      %6509 = func.call @cc_values_pack(%6508) : (i64) -> i64
      func.call @stack_push_pointer(%6506) : (i64) -> ()
      %6510 = func.call @stack_pop_pointer() : () -> i64
      %6511 = llvm.mlir.addressof @str490 : !llvm.ptr
      %6512 = arith.constant 6 : i64
      %6513 = func.call @cc_make_string(%6511, %6512) : (!llvm.ptr, i64) -> i64
      %6514 = func.call @cc_nil_value() : () -> i64
      %6515 = func.call @cc_intern(%6513, %6514) : (i64, i64) -> i64
      %6516 = func.call @cc_nil_value() : () -> i64
      %6517 = func.call @cc_cons(%6515, %6516) : (i64, i64) -> i64
      %6518 = func.call @cc_values_pack(%6517) : (i64) -> i64
      func.call @stack_push_pointer(%6515) : (i64) -> ()
      %6519 = llvm.mlir.addressof @str491 : !llvm.ptr
      %6520 = arith.constant 9 : i64
      %6521 = func.call @cc_make_string(%6519, %6520) : (!llvm.ptr, i64) -> i64
      %6522 = llvm.mlir.addressof @str492 : !llvm.ptr
      %6523 = arith.constant 11 : i64
      %6524 = func.call @cc_make_string(%6522, %6523) : (!llvm.ptr, i64) -> i64
      %6525 = func.call @cc_intern(%6521, %6524) : (i64, i64) -> i64
      %6526 = func.call @cc_nil_value() : () -> i64
      %6527 = func.call @cc_cons(%6525, %6526) : (i64, i64) -> i64
      %6528 = func.call @cc_values_pack(%6527) : (i64) -> i64
      func.call @stack_push_pointer(%6525) : (i64) -> ()
      %6529 = llvm.mlir.addressof @str493 : !llvm.ptr
      %6530 = arith.constant 9 : i64
      %6531 = func.call @cc_make_string(%6529, %6530) : (!llvm.ptr, i64) -> i64
      %6532 = llvm.mlir.addressof @str494 : !llvm.ptr
      %6533 = arith.constant 11 : i64
      %6534 = func.call @cc_make_string(%6532, %6533) : (!llvm.ptr, i64) -> i64
      %6535 = func.call @cc_intern(%6531, %6534) : (i64, i64) -> i64
      %6536 = func.call @cc_nil_value() : () -> i64
      %6537 = func.call @cc_cons(%6535, %6536) : (i64, i64) -> i64
      %6538 = func.call @cc_values_pack(%6537) : (i64) -> i64
      func.call @stack_push_pointer(%6535) : (i64) -> ()
      %6539 = llvm.mlir.addressof @str495 : !llvm.ptr
      %6540 = arith.constant 9 : i64
      %6541 = func.call @cc_make_string(%6539, %6540) : (!llvm.ptr, i64) -> i64
      %6542 = llvm.mlir.addressof @str496 : !llvm.ptr
      %6543 = arith.constant 11 : i64
      %6544 = func.call @cc_make_string(%6542, %6543) : (!llvm.ptr, i64) -> i64
      %6545 = func.call @cc_intern(%6541, %6544) : (i64, i64) -> i64
      %6546 = func.call @cc_nil_value() : () -> i64
      %6547 = func.call @cc_cons(%6545, %6546) : (i64, i64) -> i64
      %6548 = func.call @cc_values_pack(%6547) : (i64) -> i64
      func.call @stack_push_pointer(%6545) : (i64) -> ()
      %6549 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%6549) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6550 = func.call @stack_pop_pointer() : () -> i64
      %6551 = func.call @stack_pop_pointer() : () -> i64
      %6552 = func.call @cc_cons(%6551, %6550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6552) : (i64) -> ()
      %6553 = func.call @stack_pop_pointer() : () -> i64
      %6554 = func.call @stack_pop_pointer() : () -> i64
      %6555 = func.call @cc_cons(%6554, %6553) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6555) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6556 = func.call @stack_pop_pointer() : () -> i64
      %6557 = func.call @stack_pop_pointer() : () -> i64
      %6558 = func.call @cc_cons(%6557, %6556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6558) : (i64) -> ()
      %6559 = func.call @stack_pop_pointer() : () -> i64
      %6560 = func.call @stack_pop_pointer() : () -> i64
      %6561 = func.call @cc_cons(%6560, %6559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6561) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6562 = func.call @stack_pop_pointer() : () -> i64
      %6563 = func.call @stack_pop_pointer() : () -> i64
      %6564 = func.call @cc_cons(%6563, %6562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6564) : (i64) -> ()
      %6565 = func.call @stack_pop_pointer() : () -> i64
      %6566 = func.call @stack_pop_pointer() : () -> i64
      %6567 = func.call @cc_cons(%6566, %6565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6567) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6568 = func.call @stack_pop_pointer() : () -> i64
      %6569 = func.call @stack_pop_pointer() : () -> i64
      %6570 = func.call @cc_cons(%6569, %6568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6570) : (i64) -> ()
      %6571 = func.call @stack_pop_pointer() : () -> i64
      %6572 = func.call @stack_pop_pointer() : () -> i64
      %6573 = func.call @cc_cons(%6572, %6571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6573) : (i64) -> ()
      %6574 = func.call @stack_pop_pointer() : () -> i64
      %6594 = arith.constant 209815645192221 : i64
      %6595 = arith.constant 0 : i64
      %6596 = func.call @cc_make_closure(%6594, %6595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6596) : (i64) -> ()
      %6597 = func.call @stack_pop_pointer() : () -> i64
      %6598 = llvm.mlir.addressof @str497 : !llvm.ptr
      %6599 = arith.constant 9 : i64
      %6600 = func.call @cc_make_string(%6598, %6599) : (!llvm.ptr, i64) -> i64
      %6601 = llvm.mlir.addressof @str498 : !llvm.ptr
      %6602 = arith.constant 11 : i64
      %6603 = func.call @cc_make_string(%6601, %6602) : (!llvm.ptr, i64) -> i64
      %6604 = func.call @cc_intern(%6600, %6603) : (i64, i64) -> i64
      %6605 = func.call @cc_nil_value() : () -> i64
      %6606 = func.call @cc_cons(%6604, %6605) : (i64, i64) -> i64
      %6607 = func.call @cc_values_pack(%6606) : (i64) -> i64
      func.call @stack_push_pointer(%6604) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6608 = func.call @stack_pop_pointer() : () -> i64
      %6609 = func.call @stack_pop_pointer() : () -> i64
      %6610 = func.call @cc_cons(%6609, %6608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6610) : (i64) -> ()
      %6611 = func.call @stack_pop_pointer() : () -> i64
      %6612 = llvm.mlir.addressof @str499 : !llvm.ptr
      %6613 = arith.constant 11 : i64
      %6614 = func.call @cc_make_string(%6612, %6613) : (!llvm.ptr, i64) -> i64
      %6615 = llvm.mlir.addressof @str500 : !llvm.ptr
      %6616 = arith.constant 7 : i64
      %6617 = func.call @cc_make_string(%6615, %6616) : (!llvm.ptr, i64) -> i64
      %6618 = func.call @cc_intern(%6614, %6617) : (i64, i64) -> i64
      %6619 = func.call @cc_nil_value() : () -> i64
      %6620 = func.call @cc_cons(%6618, %6619) : (i64, i64) -> i64
      %6621 = func.call @cc_values_pack(%6620) : (i64) -> i64
      func.call @stack_push_pointer(%6618) : (i64) -> ()
      %6622 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6623 = func.call @stack_pop_pointer() : () -> i64
      %6624 = llvm.mlir.addressof @str501 : !llvm.ptr
      %6625 = arith.constant 4 : i64
      %6626 = func.call @cc_make_string(%6624, %6625) : (!llvm.ptr, i64) -> i64
      %6627 = llvm.mlir.addressof @str502 : !llvm.ptr
      %6628 = arith.constant 7 : i64
      %6629 = func.call @cc_make_string(%6627, %6628) : (!llvm.ptr, i64) -> i64
      %6630 = func.call @cc_intern(%6626, %6629) : (i64, i64) -> i64
      %6631 = func.call @cc_nil_value() : () -> i64
      %6632 = func.call @cc_cons(%6630, %6631) : (i64, i64) -> i64
      %6633 = func.call @cc_values_pack(%6632) : (i64) -> i64
      func.call @stack_push_pointer(%6630) : (i64) -> ()
      %6634 = func.call @stack_pop_pointer() : () -> i64
      %6635 = llvm.mlir.addressof @str503 : !llvm.ptr
      %6636 = arith.constant 5 : i64
      %6637 = func.call @cc_make_string(%6635, %6636) : (!llvm.ptr, i64) -> i64
      %6638 = func.call @cc_nil_value() : () -> i64
      %6639 = func.call @cc_intern(%6637, %6638) : (i64, i64) -> i64
      %6640 = func.call @cc_nil_value() : () -> i64
      %6641 = func.call @cc_cons(%6639, %6640) : (i64, i64) -> i64
      %6642 = func.call @cc_values_pack(%6641) : (i64) -> i64
      func.call @stack_push_pointer(%6639) : (i64) -> ()
      %6643 = func.call @stack_pop_pointer() : () -> i64
      %6644 = func.call @cc_nil_value() : () -> i64
      %6645 = func.call @cc_errorp(%6510) : (i64) -> i64
      %6646 = arith.cmpi ne, %6645, %6644 : i64
      %6647 = arith.cmpi eq, %6644, %6644 : i64
      %6648 = arith.andi %6646, %6647 : i1
      %6649 = scf.if %6648 -> (i64) {
        scf.yield %6510 : i64
      } else {
        scf.yield %6644 : i64
      }
      %6650 = func.call @cc_errorp(%6574) : (i64) -> i64
      %6651 = arith.cmpi ne, %6650, %6644 : i64
      %6652 = arith.cmpi eq, %6649, %6644 : i64
      %6653 = arith.andi %6651, %6652 : i1
      %6654 = scf.if %6653 -> (i64) {
        scf.yield %6574 : i64
      } else {
        scf.yield %6649 : i64
      }
      %6655 = func.call @cc_errorp(%6597) : (i64) -> i64
      %6656 = arith.cmpi ne, %6655, %6644 : i64
      %6657 = arith.cmpi eq, %6654, %6644 : i64
      %6658 = arith.andi %6656, %6657 : i1
      %6659 = scf.if %6658 -> (i64) {
        scf.yield %6597 : i64
      } else {
        scf.yield %6654 : i64
      }
      %6660 = func.call @cc_errorp(%6611) : (i64) -> i64
      %6661 = arith.cmpi ne, %6660, %6644 : i64
      %6662 = arith.cmpi eq, %6659, %6644 : i64
      %6663 = arith.andi %6661, %6662 : i1
      %6664 = scf.if %6663 -> (i64) {
        scf.yield %6611 : i64
      } else {
        scf.yield %6659 : i64
      }
      %6665 = func.call @cc_errorp(%6622) : (i64) -> i64
      %6666 = arith.cmpi ne, %6665, %6644 : i64
      %6667 = arith.cmpi eq, %6664, %6644 : i64
      %6668 = arith.andi %6666, %6667 : i1
      %6669 = scf.if %6668 -> (i64) {
        scf.yield %6622 : i64
      } else {
        scf.yield %6664 : i64
      }
      %6670 = func.call @cc_errorp(%6623) : (i64) -> i64
      %6671 = arith.cmpi ne, %6670, %6644 : i64
      %6672 = arith.cmpi eq, %6669, %6644 : i64
      %6673 = arith.andi %6671, %6672 : i1
      %6674 = scf.if %6673 -> (i64) {
        scf.yield %6623 : i64
      } else {
        scf.yield %6669 : i64
      }
      %6675 = func.call @cc_errorp(%6634) : (i64) -> i64
      %6676 = arith.cmpi ne, %6675, %6644 : i64
      %6677 = arith.cmpi eq, %6674, %6644 : i64
      %6678 = arith.andi %6676, %6677 : i1
      %6679 = scf.if %6678 -> (i64) {
        scf.yield %6634 : i64
      } else {
        scf.yield %6674 : i64
      }
      %6680 = func.call @cc_errorp(%6643) : (i64) -> i64
      %6681 = arith.cmpi ne, %6680, %6644 : i64
      %6682 = arith.cmpi eq, %6679, %6644 : i64
      %6683 = arith.andi %6681, %6682 : i1
      %6684 = scf.if %6683 -> (i64) {
        scf.yield %6643 : i64
      } else {
        scf.yield %6679 : i64
      }
      %6685 = arith.cmpi ne, %6684, %6644 : i64
      scf.if %6685 {
        func.call @stack_push_pointer(%6684) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6510) : (i64) -> ()
        func.call @stack_push_pointer(%6574) : (i64) -> ()
        func.call @stack_push_pointer(%6597) : (i64) -> ()
        func.call @stack_push_pointer(%6611) : (i64) -> ()
        func.call @stack_push_pointer(%6622) : (i64) -> ()
        func.call @stack_push_pointer(%6623) : (i64) -> ()
        func.call @stack_push_pointer(%6634) : (i64) -> ()
        func.call @stack_push_pointer(%6643) : (i64) -> ()
        %6686 = llvm.mlir.addressof @str504 : !llvm.ptr
        %6687 = func.call @cc_make_function_ref_const(%6686) : (!llvm.ptr) -> i64
        %6688 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6687, %6688) : (i64, i64) -> ()
      }
      %6689 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6689 : i64
    }
    %6690 = func.call @cc_nil_value() : () -> i64
    %6691 = func.call @cc_errorp(%6501) : (i64) -> i64
    %6692 = arith.cmpi ne, %6691, %6690 : i64
    %6693 = scf.if %6692 -> (i64) {
      scf.yield %6501 : i64
    } else {
      %6694 = llvm.mlir.addressof @str505 : !llvm.ptr
      %6695 = arith.constant 12 : i64
      %6696 = func.call @cc_make_string(%6694, %6695) : (!llvm.ptr, i64) -> i64
      %6697 = func.call @cc_nil_value() : () -> i64
      %6698 = func.call @cc_intern(%6696, %6697) : (i64, i64) -> i64
      %6699 = func.call @cc_nil_value() : () -> i64
      %6700 = func.call @cc_cons(%6698, %6699) : (i64, i64) -> i64
      %6701 = func.call @cc_values_pack(%6700) : (i64) -> i64
      func.call @stack_push_pointer(%6698) : (i64) -> ()
      %6702 = func.call @stack_pop_pointer() : () -> i64
      %6703 = llvm.mlir.addressof @str506 : !llvm.ptr
      %6704 = arith.constant 4 : i64
      %6705 = func.call @cc_make_string(%6703, %6704) : (!llvm.ptr, i64) -> i64
      %6706 = func.call @cc_nil_value() : () -> i64
      %6707 = func.call @cc_intern(%6705, %6706) : (i64, i64) -> i64
      %6708 = func.call @cc_nil_value() : () -> i64
      %6709 = func.call @cc_cons(%6707, %6708) : (i64, i64) -> i64
      %6710 = func.call @cc_values_pack(%6709) : (i64) -> i64
      func.call @stack_push_pointer(%6707) : (i64) -> ()
      %6711 = llvm.mlir.addressof @str507 : !llvm.ptr
      %6712 = arith.constant 1 : i64
      %6713 = func.call @cc_make_string(%6711, %6712) : (!llvm.ptr, i64) -> i64
      %6714 = func.call @cc_nil_value() : () -> i64
      %6715 = func.call @cc_intern(%6713, %6714) : (i64, i64) -> i64
      %6716 = func.call @cc_nil_value() : () -> i64
      %6717 = func.call @cc_cons(%6715, %6716) : (i64, i64) -> i64
      %6718 = func.call @cc_values_pack(%6717) : (i64) -> i64
      func.call @stack_push_pointer(%6715) : (i64) -> ()
      %6719 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%6719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6720 = func.call @stack_pop_pointer() : () -> i64
      %6721 = func.call @stack_pop_pointer() : () -> i64
      %6722 = func.call @cc_cons(%6721, %6720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6722) : (i64) -> ()
      %6723 = func.call @stack_pop_pointer() : () -> i64
      %6724 = func.call @stack_pop_pointer() : () -> i64
      %6725 = func.call @cc_cons(%6724, %6723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6725) : (i64) -> ()
      %6726 = llvm.mlir.addressof @str508 : !llvm.ptr
      %6727 = arith.constant 19 : i64
      %6728 = func.call @cc_make_string(%6726, %6727) : (!llvm.ptr, i64) -> i64
      %6729 = func.call @cc_nil_value() : () -> i64
      %6730 = func.call @cc_intern(%6728, %6729) : (i64, i64) -> i64
      %6731 = func.call @cc_nil_value() : () -> i64
      %6732 = func.call @cc_cons(%6730, %6731) : (i64, i64) -> i64
      %6733 = func.call @cc_values_pack(%6732) : (i64) -> i64
      func.call @stack_push_pointer(%6730) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6734 = func.call @stack_pop_pointer() : () -> i64
      %6735 = func.call @stack_pop_pointer() : () -> i64
      %6736 = func.call @cc_cons(%6735, %6734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6736) : (i64) -> ()
      %6737 = func.call @stack_pop_pointer() : () -> i64
      %6738 = func.call @stack_pop_pointer() : () -> i64
      %6739 = func.call @cc_cons(%6738, %6737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6739) : (i64) -> ()
      %6740 = llvm.mlir.addressof @str509 : !llvm.ptr
      %6741 = arith.constant 1 : i64
      %6742 = func.call @cc_make_string(%6740, %6741) : (!llvm.ptr, i64) -> i64
      %6743 = func.call @cc_nil_value() : () -> i64
      %6744 = func.call @cc_intern(%6742, %6743) : (i64, i64) -> i64
      %6745 = func.call @cc_nil_value() : () -> i64
      %6746 = func.call @cc_cons(%6744, %6745) : (i64, i64) -> i64
      %6747 = func.call @cc_values_pack(%6746) : (i64) -> i64
      func.call @stack_push_pointer(%6744) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6748 = func.call @stack_pop_pointer() : () -> i64
      %6749 = func.call @stack_pop_pointer() : () -> i64
      %6750 = func.call @cc_cons(%6749, %6748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6750) : (i64) -> ()
      %6751 = func.call @stack_pop_pointer() : () -> i64
      %6752 = func.call @stack_pop_pointer() : () -> i64
      %6753 = func.call @cc_cons(%6752, %6751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6753) : (i64) -> ()
      %6754 = llvm.mlir.addressof @str510 : !llvm.ptr
      %6755 = arith.constant 15 : i64
      %6756 = func.call @cc_make_string(%6754, %6755) : (!llvm.ptr, i64) -> i64
      %6757 = func.call @cc_nil_value() : () -> i64
      %6758 = func.call @cc_intern(%6756, %6757) : (i64, i64) -> i64
      %6759 = func.call @cc_nil_value() : () -> i64
      %6760 = func.call @cc_cons(%6758, %6759) : (i64, i64) -> i64
      %6761 = func.call @cc_values_pack(%6760) : (i64) -> i64
      func.call @stack_push_pointer(%6758) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6762 = func.call @stack_pop_pointer() : () -> i64
      %6763 = func.call @stack_pop_pointer() : () -> i64
      %6764 = func.call @cc_cons(%6763, %6762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6764) : (i64) -> ()
      %6765 = func.call @stack_pop_pointer() : () -> i64
      %6766 = func.call @stack_pop_pointer() : () -> i64
      %6767 = func.call @cc_cons(%6766, %6765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6767) : (i64) -> ()
      %6768 = llvm.mlir.addressof @str511 : !llvm.ptr
      %6769 = arith.constant 17 : i64
      %6770 = func.call @cc_make_string(%6768, %6769) : (!llvm.ptr, i64) -> i64
      %6771 = func.call @cc_nil_value() : () -> i64
      %6772 = func.call @cc_intern(%6770, %6771) : (i64, i64) -> i64
      %6773 = func.call @cc_nil_value() : () -> i64
      %6774 = func.call @cc_cons(%6772, %6773) : (i64, i64) -> i64
      %6775 = func.call @cc_values_pack(%6774) : (i64) -> i64
      func.call @stack_push_pointer(%6772) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %6776 = func.call @stack_pop_pointer() : () -> i64
      %6777 = func.call @stack_pop_pointer() : () -> i64
      %6778 = func.call @cc_cons(%6777, %6776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6778) : (i64) -> ()
      %6779 = func.call @stack_pop_pointer() : () -> i64
      %6780 = func.call @stack_pop_pointer() : () -> i64
      %6781 = func.call @cc_cons(%6780, %6779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6781) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6782 = func.call @stack_pop_pointer() : () -> i64
      %6783 = func.call @stack_pop_pointer() : () -> i64
      %6784 = func.call @cc_cons(%6783, %6782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6784) : (i64) -> ()
      %6785 = func.call @stack_pop_pointer() : () -> i64
      %6786 = func.call @stack_pop_pointer() : () -> i64
      %6787 = func.call @cc_cons(%6786, %6785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6787) : (i64) -> ()
      %6788 = func.call @stack_pop_pointer() : () -> i64
      %6789 = func.call @stack_pop_pointer() : () -> i64
      %6790 = func.call @cc_cons(%6789, %6788) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6790) : (i64) -> ()
      %6791 = func.call @stack_pop_pointer() : () -> i64
      %6792 = func.call @stack_pop_pointer() : () -> i64
      %6793 = func.call @cc_cons(%6792, %6791) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6793) : (i64) -> ()
      %6794 = func.call @stack_pop_pointer() : () -> i64
      %6795 = func.call @stack_pop_pointer() : () -> i64
      %6796 = func.call @cc_cons(%6795, %6794) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6796) : (i64) -> ()
      %6797 = llvm.mlir.addressof @str512 : !llvm.ptr
      %6798 = arith.constant 5 : i64
      %6799 = func.call @cc_make_string(%6797, %6798) : (!llvm.ptr, i64) -> i64
      %6800 = func.call @cc_nil_value() : () -> i64
      %6801 = func.call @cc_intern(%6799, %6800) : (i64, i64) -> i64
      %6802 = func.call @cc_nil_value() : () -> i64
      %6803 = func.call @cc_cons(%6801, %6802) : (i64, i64) -> i64
      %6804 = func.call @cc_values_pack(%6803) : (i64) -> i64
      func.call @stack_push_pointer(%6801) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6805 = llvm.mlir.addressof @str513 : !llvm.ptr
      %6806 = arith.constant 5 : i64
      %6807 = func.call @cc_make_string(%6805, %6806) : (!llvm.ptr, i64) -> i64
      %6808 = llvm.mlir.addressof @str514 : !llvm.ptr
      %6809 = arith.constant 3 : i64
      %6810 = func.call @cc_make_string(%6808, %6809) : (!llvm.ptr, i64) -> i64
      %6811 = func.call @cc_intern(%6807, %6810) : (i64, i64) -> i64
      %6812 = func.call @cc_nil_value() : () -> i64
      %6813 = func.call @cc_cons(%6811, %6812) : (i64, i64) -> i64
      %6814 = func.call @cc_values_pack(%6813) : (i64) -> i64
      func.call @stack_push_pointer(%6811) : (i64) -> ()
      %6815 = llvm.mlir.addressof @str515 : !llvm.ptr
      %6816 = arith.constant 1 : i64
      %6817 = func.call @cc_make_string(%6815, %6816) : (!llvm.ptr, i64) -> i64
      %6818 = func.call @cc_nil_value() : () -> i64
      %6819 = func.call @cc_intern(%6817, %6818) : (i64, i64) -> i64
      %6820 = func.call @cc_nil_value() : () -> i64
      %6821 = func.call @cc_cons(%6819, %6820) : (i64, i64) -> i64
      %6822 = func.call @cc_values_pack(%6821) : (i64) -> i64
      func.call @stack_push_pointer(%6819) : (i64) -> ()
      %6823 = llvm.mlir.addressof @str516 : !llvm.ptr
      %6824 = arith.constant 1 : i64
      %6825 = func.call @cc_make_string(%6823, %6824) : (!llvm.ptr, i64) -> i64
      %6826 = func.call @cc_nil_value() : () -> i64
      %6827 = func.call @cc_intern(%6825, %6826) : (i64, i64) -> i64
      %6828 = func.call @cc_nil_value() : () -> i64
      %6829 = func.call @cc_cons(%6827, %6828) : (i64, i64) -> i64
      %6830 = func.call @cc_values_pack(%6829) : (i64) -> i64
      func.call @stack_push_pointer(%6827) : (i64) -> ()
      %6831 = llvm.mlir.addressof @str517 : !llvm.ptr
      %6832 = arith.constant 3 : i64
      %6833 = func.call @cc_make_string(%6831, %6832) : (!llvm.ptr, i64) -> i64
      %6834 = llvm.mlir.addressof @str518 : !llvm.ptr
      %6835 = arith.constant 11 : i64
      %6836 = func.call @cc_make_string(%6834, %6835) : (!llvm.ptr, i64) -> i64
      %6837 = func.call @cc_intern(%6833, %6836) : (i64, i64) -> i64
      %6838 = func.call @cc_nil_value() : () -> i64
      %6839 = func.call @cc_cons(%6837, %6838) : (i64, i64) -> i64
      %6840 = func.call @cc_values_pack(%6839) : (i64) -> i64
      func.call @stack_push_pointer(%6837) : (i64) -> ()
      %6841 = arith.constant 65536 : i64
      func.call @stack_push_fixnum(%6841) : (i64) -> ()
      %6842 = llvm.mlir.addressof @str519 : !llvm.ptr
      %6843 = arith.constant 15 : i64
      %6844 = func.call @cc_make_string(%6842, %6843) : (!llvm.ptr, i64) -> i64
      %6845 = llvm.mlir.addressof @str520 : !llvm.ptr
      %6846 = arith.constant 11 : i64
      %6847 = func.call @cc_make_string(%6845, %6846) : (!llvm.ptr, i64) -> i64
      %6848 = func.call @cc_intern(%6844, %6847) : (i64, i64) -> i64
      %6849 = func.call @cc_nil_value() : () -> i64
      %6850 = func.call @cc_cons(%6848, %6849) : (i64, i64) -> i64
      %6851 = func.call @cc_values_pack(%6850) : (i64) -> i64
      func.call @stack_push_pointer(%6848) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6852 = func.call @stack_pop_pointer() : () -> i64
      %6853 = func.call @stack_pop_pointer() : () -> i64
      %6854 = func.call @cc_cons(%6853, %6852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6854) : (i64) -> ()
      %6855 = func.call @stack_pop_pointer() : () -> i64
      %6856 = func.call @stack_pop_pointer() : () -> i64
      %6857 = func.call @cc_cons(%6856, %6855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6857) : (i64) -> ()
      %6858 = func.call @stack_pop_pointer() : () -> i64
      %6859 = func.call @stack_pop_pointer() : () -> i64
      %6860 = func.call @cc_cons(%6859, %6858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6860) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6861 = func.call @stack_pop_pointer() : () -> i64
      %6862 = func.call @stack_pop_pointer() : () -> i64
      %6863 = func.call @cc_cons(%6862, %6861) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6863) : (i64) -> ()
      %6864 = func.call @stack_pop_pointer() : () -> i64
      %6865 = func.call @stack_pop_pointer() : () -> i64
      %6866 = func.call @cc_cons(%6865, %6864) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6866) : (i64) -> ()
      %6867 = func.call @stack_pop_pointer() : () -> i64
      %6868 = func.call @stack_pop_pointer() : () -> i64
      %6869 = func.call @cc_cons(%6868, %6867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6869) : (i64) -> ()
      %6870 = llvm.mlir.addressof @str521 : !llvm.ptr
      %6871 = arith.constant 4 : i64
      %6872 = func.call @cc_make_string(%6870, %6871) : (!llvm.ptr, i64) -> i64
      %6873 = func.call @cc_nil_value() : () -> i64
      %6874 = func.call @cc_intern(%6872, %6873) : (i64, i64) -> i64
      %6875 = func.call @cc_nil_value() : () -> i64
      %6876 = func.call @cc_cons(%6874, %6875) : (i64, i64) -> i64
      %6877 = func.call @cc_values_pack(%6876) : (i64) -> i64
      func.call @stack_push_pointer(%6874) : (i64) -> ()
      %6878 = llvm.mlir.addressof @str522 : !llvm.ptr
      %6879 = arith.constant 17 : i64
      %6880 = func.call @cc_make_string(%6878, %6879) : (!llvm.ptr, i64) -> i64
      %6881 = func.call @cc_nil_value() : () -> i64
      %6882 = func.call @cc_intern(%6880, %6881) : (i64, i64) -> i64
      %6883 = func.call @cc_nil_value() : () -> i64
      %6884 = func.call @cc_cons(%6882, %6883) : (i64, i64) -> i64
      %6885 = func.call @cc_values_pack(%6884) : (i64) -> i64
      func.call @stack_push_pointer(%6882) : (i64) -> ()
      %6886 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%6886) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6887 = func.call @stack_pop_pointer() : () -> i64
      %6888 = func.call @stack_pop_pointer() : () -> i64
      %6889 = func.call @cc_cons(%6888, %6887) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6889) : (i64) -> ()
      %6890 = func.call @stack_pop_pointer() : () -> i64
      %6891 = func.call @stack_pop_pointer() : () -> i64
      %6892 = func.call @cc_cons(%6891, %6890) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6892) : (i64) -> ()
      %6893 = func.call @stack_pop_pointer() : () -> i64
      %6894 = func.call @stack_pop_pointer() : () -> i64
      %6895 = func.call @cc_cons(%6894, %6893) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6895) : (i64) -> ()
      %6896 = llvm.mlir.addressof @str523 : !llvm.ptr
      %6897 = arith.constant 4 : i64
      %6898 = func.call @cc_make_string(%6896, %6897) : (!llvm.ptr, i64) -> i64
      %6899 = func.call @cc_nil_value() : () -> i64
      %6900 = func.call @cc_intern(%6898, %6899) : (i64, i64) -> i64
      %6901 = func.call @cc_nil_value() : () -> i64
      %6902 = func.call @cc_cons(%6900, %6901) : (i64, i64) -> i64
      %6903 = func.call @cc_values_pack(%6902) : (i64) -> i64
      func.call @stack_push_pointer(%6900) : (i64) -> ()
      %6904 = llvm.mlir.addressof @str524 : !llvm.ptr
      %6905 = arith.constant 19 : i64
      %6906 = func.call @cc_make_string(%6904, %6905) : (!llvm.ptr, i64) -> i64
      %6907 = func.call @cc_nil_value() : () -> i64
      %6908 = func.call @cc_intern(%6906, %6907) : (i64, i64) -> i64
      %6909 = func.call @cc_nil_value() : () -> i64
      %6910 = func.call @cc_cons(%6908, %6909) : (i64, i64) -> i64
      %6911 = func.call @cc_values_pack(%6910) : (i64) -> i64
      func.call @stack_push_pointer(%6908) : (i64) -> ()
      %6912 = llvm.mlir.addressof @str525 : !llvm.ptr
      %6913 = arith.constant 1 : i64
      %6914 = func.call @cc_make_string(%6912, %6913) : (!llvm.ptr, i64) -> i64
      %6915 = func.call @cc_nil_value() : () -> i64
      %6916 = func.call @cc_intern(%6914, %6915) : (i64, i64) -> i64
      %6917 = func.call @cc_nil_value() : () -> i64
      %6918 = func.call @cc_cons(%6916, %6917) : (i64, i64) -> i64
      %6919 = func.call @cc_values_pack(%6918) : (i64) -> i64
      func.call @stack_push_pointer(%6916) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6920 = func.call @stack_pop_pointer() : () -> i64
      %6921 = func.call @stack_pop_pointer() : () -> i64
      %6922 = func.call @cc_cons(%6921, %6920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6922) : (i64) -> ()
      %6923 = func.call @stack_pop_pointer() : () -> i64
      %6924 = func.call @stack_pop_pointer() : () -> i64
      %6925 = func.call @cc_cons(%6924, %6923) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6925) : (i64) -> ()
      %6926 = func.call @stack_pop_pointer() : () -> i64
      %6927 = func.call @stack_pop_pointer() : () -> i64
      %6928 = func.call @cc_cons(%6927, %6926) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6928) : (i64) -> ()
      %6929 = llvm.mlir.addressof @str526 : !llvm.ptr
      %6930 = arith.constant 4 : i64
      %6931 = func.call @cc_make_string(%6929, %6930) : (!llvm.ptr, i64) -> i64
      %6932 = func.call @cc_nil_value() : () -> i64
      %6933 = func.call @cc_intern(%6931, %6932) : (i64, i64) -> i64
      %6934 = func.call @cc_nil_value() : () -> i64
      %6935 = func.call @cc_cons(%6933, %6934) : (i64, i64) -> i64
      %6936 = func.call @cc_values_pack(%6935) : (i64) -> i64
      func.call @stack_push_pointer(%6933) : (i64) -> ()
      %6937 = llvm.mlir.addressof @str527 : !llvm.ptr
      %6938 = arith.constant 1 : i64
      %6939 = func.call @cc_make_string(%6937, %6938) : (!llvm.ptr, i64) -> i64
      %6940 = func.call @cc_nil_value() : () -> i64
      %6941 = func.call @cc_intern(%6939, %6940) : (i64, i64) -> i64
      %6942 = func.call @cc_nil_value() : () -> i64
      %6943 = func.call @cc_cons(%6941, %6942) : (i64, i64) -> i64
      %6944 = func.call @cc_values_pack(%6943) : (i64) -> i64
      func.call @stack_push_pointer(%6941) : (i64) -> ()
      %6945 = llvm.mlir.addressof @str528 : !llvm.ptr
      %6946 = arith.constant 9 : i64
      %6947 = func.call @cc_make_string(%6945, %6946) : (!llvm.ptr, i64) -> i64
      %6948 = llvm.mlir.addressof @str529 : !llvm.ptr
      %6949 = arith.constant 11 : i64
      %6950 = func.call @cc_make_string(%6948, %6949) : (!llvm.ptr, i64) -> i64
      %6951 = func.call @cc_intern(%6947, %6950) : (i64, i64) -> i64
      %6952 = func.call @cc_nil_value() : () -> i64
      %6953 = func.call @cc_cons(%6951, %6952) : (i64, i64) -> i64
      %6954 = func.call @cc_values_pack(%6953) : (i64) -> i64
      func.call @stack_push_pointer(%6951) : (i64) -> ()
      %6955 = llvm.mlir.addressof @str530 : !llvm.ptr
      %6956 = arith.constant 1 : i64
      %6957 = func.call @cc_make_string(%6955, %6956) : (!llvm.ptr, i64) -> i64
      %6958 = func.call @cc_nil_value() : () -> i64
      %6959 = func.call @cc_intern(%6957, %6958) : (i64, i64) -> i64
      %6960 = func.call @cc_nil_value() : () -> i64
      %6961 = func.call @cc_cons(%6959, %6960) : (i64, i64) -> i64
      %6962 = func.call @cc_values_pack(%6961) : (i64) -> i64
      func.call @stack_push_pointer(%6959) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6963 = func.call @stack_pop_pointer() : () -> i64
      %6964 = func.call @stack_pop_pointer() : () -> i64
      %6965 = func.call @cc_cons(%6964, %6963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6965) : (i64) -> ()
      %6966 = func.call @stack_pop_pointer() : () -> i64
      %6967 = func.call @stack_pop_pointer() : () -> i64
      %6968 = func.call @cc_cons(%6967, %6966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6968) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6969 = func.call @stack_pop_pointer() : () -> i64
      %6970 = func.call @stack_pop_pointer() : () -> i64
      %6971 = func.call @cc_cons(%6970, %6969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6971) : (i64) -> ()
      %6972 = func.call @stack_pop_pointer() : () -> i64
      %6973 = func.call @stack_pop_pointer() : () -> i64
      %6974 = func.call @cc_cons(%6973, %6972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6974) : (i64) -> ()
      %6975 = func.call @stack_pop_pointer() : () -> i64
      %6976 = func.call @stack_pop_pointer() : () -> i64
      %6977 = func.call @cc_cons(%6976, %6975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6977) : (i64) -> ()
      %6978 = llvm.mlir.addressof @str531 : !llvm.ptr
      %6979 = arith.constant 2 : i64
      %6980 = func.call @cc_make_string(%6978, %6979) : (!llvm.ptr, i64) -> i64
      %6981 = func.call @cc_nil_value() : () -> i64
      %6982 = func.call @cc_intern(%6980, %6981) : (i64, i64) -> i64
      %6983 = func.call @cc_nil_value() : () -> i64
      %6984 = func.call @cc_cons(%6982, %6983) : (i64, i64) -> i64
      %6985 = func.call @cc_values_pack(%6984) : (i64) -> i64
      func.call @stack_push_pointer(%6982) : (i64) -> ()
      %6986 = llvm.mlir.addressof @str532 : !llvm.ptr
      %6987 = arith.constant 3 : i64
      %6988 = func.call @cc_make_string(%6986, %6987) : (!llvm.ptr, i64) -> i64
      %6989 = func.call @cc_nil_value() : () -> i64
      %6990 = func.call @cc_intern(%6988, %6989) : (i64, i64) -> i64
      %6991 = func.call @cc_nil_value() : () -> i64
      %6992 = func.call @cc_cons(%6990, %6991) : (i64, i64) -> i64
      %6993 = func.call @cc_values_pack(%6992) : (i64) -> i64
      func.call @stack_push_pointer(%6990) : (i64) -> ()
      %6994 = llvm.mlir.addressof @str533 : !llvm.ptr
      %6995 = arith.constant 2 : i64
      %6996 = func.call @cc_make_string(%6994, %6995) : (!llvm.ptr, i64) -> i64
      %6997 = llvm.mlir.addressof @str534 : !llvm.ptr
      %6998 = arith.constant 11 : i64
      %6999 = func.call @cc_make_string(%6997, %6998) : (!llvm.ptr, i64) -> i64
      %7000 = func.call @cc_intern(%6996, %6999) : (i64, i64) -> i64
      %7001 = func.call @cc_nil_value() : () -> i64
      %7002 = func.call @cc_cons(%7000, %7001) : (i64, i64) -> i64
      %7003 = func.call @cc_values_pack(%7002) : (i64) -> i64
      func.call @stack_push_pointer(%7000) : (i64) -> ()
      %7004 = llvm.mlir.addressof @str535 : !llvm.ptr
      %7005 = arith.constant 3 : i64
      %7006 = func.call @cc_make_string(%7004, %7005) : (!llvm.ptr, i64) -> i64
      %7007 = llvm.mlir.addressof @str536 : !llvm.ptr
      %7008 = arith.constant 11 : i64
      %7009 = func.call @cc_make_string(%7007, %7008) : (!llvm.ptr, i64) -> i64
      %7010 = func.call @cc_intern(%7006, %7009) : (i64, i64) -> i64
      %7011 = func.call @cc_nil_value() : () -> i64
      %7012 = func.call @cc_cons(%7010, %7011) : (i64, i64) -> i64
      %7013 = func.call @cc_values_pack(%7012) : (i64) -> i64
      func.call @stack_push_pointer(%7010) : (i64) -> ()
      %7014 = llvm.mlir.addressof @str537 : !llvm.ptr
      %7015 = arith.constant 10 : i64
      %7016 = func.call @cc_make_string(%7014, %7015) : (!llvm.ptr, i64) -> i64
      %7017 = llvm.mlir.addressof @str538 : !llvm.ptr
      %7018 = arith.constant 11 : i64
      %7019 = func.call @cc_make_string(%7017, %7018) : (!llvm.ptr, i64) -> i64
      %7020 = func.call @cc_intern(%7016, %7019) : (i64, i64) -> i64
      %7021 = func.call @cc_nil_value() : () -> i64
      %7022 = func.call @cc_cons(%7020, %7021) : (i64, i64) -> i64
      %7023 = func.call @cc_values_pack(%7022) : (i64) -> i64
      func.call @stack_push_pointer(%7020) : (i64) -> ()
      %7024 = llvm.mlir.addressof @str539 : !llvm.ptr
      %7025 = arith.constant 1 : i64
      %7026 = func.call @cc_make_string(%7024, %7025) : (!llvm.ptr, i64) -> i64
      %7027 = func.call @cc_nil_value() : () -> i64
      %7028 = func.call @cc_intern(%7026, %7027) : (i64, i64) -> i64
      %7029 = func.call @cc_nil_value() : () -> i64
      %7030 = func.call @cc_cons(%7028, %7029) : (i64, i64) -> i64
      %7031 = func.call @cc_values_pack(%7030) : (i64) -> i64
      func.call @stack_push_pointer(%7028) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7032 = func.call @stack_pop_pointer() : () -> i64
      %7033 = func.call @stack_pop_pointer() : () -> i64
      %7034 = func.call @cc_cons(%7033, %7032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7034) : (i64) -> ()
      %7035 = func.call @stack_pop_pointer() : () -> i64
      %7036 = func.call @stack_pop_pointer() : () -> i64
      %7037 = func.call @cc_cons(%7036, %7035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7037) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7038 = func.call @stack_pop_pointer() : () -> i64
      %7039 = func.call @stack_pop_pointer() : () -> i64
      %7040 = func.call @cc_cons(%7039, %7038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7040) : (i64) -> ()
      %7041 = func.call @stack_pop_pointer() : () -> i64
      %7042 = func.call @stack_pop_pointer() : () -> i64
      %7043 = func.call @cc_cons(%7042, %7041) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7043) : (i64) -> ()
      %7044 = llvm.mlir.addressof @str540 : !llvm.ptr
      %7045 = arith.constant 2 : i64
      %7046 = func.call @cc_make_string(%7044, %7045) : (!llvm.ptr, i64) -> i64
      %7047 = func.call @cc_nil_value() : () -> i64
      %7048 = func.call @cc_intern(%7046, %7047) : (i64, i64) -> i64
      %7049 = func.call @cc_nil_value() : () -> i64
      %7050 = func.call @cc_cons(%7048, %7049) : (i64, i64) -> i64
      %7051 = func.call @cc_values_pack(%7050) : (i64) -> i64
      func.call @stack_push_pointer(%7048) : (i64) -> ()
      %7052 = llvm.mlir.addressof @str541 : !llvm.ptr
      %7053 = arith.constant 11 : i64
      %7054 = func.call @cc_make_string(%7052, %7053) : (!llvm.ptr, i64) -> i64
      %7055 = llvm.mlir.addressof @str542 : !llvm.ptr
      %7056 = arith.constant 11 : i64
      %7057 = func.call @cc_make_string(%7055, %7056) : (!llvm.ptr, i64) -> i64
      %7058 = func.call @cc_intern(%7054, %7057) : (i64, i64) -> i64
      %7059 = func.call @cc_nil_value() : () -> i64
      %7060 = func.call @cc_cons(%7058, %7059) : (i64, i64) -> i64
      %7061 = func.call @cc_values_pack(%7060) : (i64) -> i64
      func.call @stack_push_pointer(%7058) : (i64) -> ()
      %7062 = llvm.mlir.addressof @str543 : !llvm.ptr
      %7063 = arith.constant 1 : i64
      %7064 = func.call @cc_make_string(%7062, %7063) : (!llvm.ptr, i64) -> i64
      %7065 = func.call @cc_nil_value() : () -> i64
      %7066 = func.call @cc_intern(%7064, %7065) : (i64, i64) -> i64
      %7067 = func.call @cc_nil_value() : () -> i64
      %7068 = func.call @cc_cons(%7066, %7067) : (i64, i64) -> i64
      %7069 = func.call @cc_values_pack(%7068) : (i64) -> i64
      func.call @stack_push_pointer(%7066) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7070 = func.call @stack_pop_pointer() : () -> i64
      %7071 = func.call @stack_pop_pointer() : () -> i64
      %7072 = func.call @cc_cons(%7071, %7070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7072) : (i64) -> ()
      %7073 = func.call @stack_pop_pointer() : () -> i64
      %7074 = func.call @stack_pop_pointer() : () -> i64
      %7075 = func.call @cc_cons(%7074, %7073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7075) : (i64) -> ()
      %7076 = llvm.mlir.addressof @str544 : !llvm.ptr
      %7077 = arith.constant 3 : i64
      %7078 = func.call @cc_make_string(%7076, %7077) : (!llvm.ptr, i64) -> i64
      %7079 = llvm.mlir.addressof @str545 : !llvm.ptr
      %7080 = arith.constant 11 : i64
      %7081 = func.call @cc_make_string(%7079, %7080) : (!llvm.ptr, i64) -> i64
      %7082 = func.call @cc_intern(%7078, %7081) : (i64, i64) -> i64
      %7083 = func.call @cc_nil_value() : () -> i64
      %7084 = func.call @cc_cons(%7082, %7083) : (i64, i64) -> i64
      %7085 = func.call @cc_values_pack(%7084) : (i64) -> i64
      func.call @stack_push_pointer(%7082) : (i64) -> ()
      %7086 = llvm.mlir.addressof @str546 : !llvm.ptr
      %7087 = arith.constant 14 : i64
      %7088 = func.call @cc_make_string(%7086, %7087) : (!llvm.ptr, i64) -> i64
      %7089 = llvm.mlir.addressof @str547 : !llvm.ptr
      %7090 = arith.constant 11 : i64
      %7091 = func.call @cc_make_string(%7089, %7090) : (!llvm.ptr, i64) -> i64
      %7092 = func.call @cc_intern(%7088, %7091) : (i64, i64) -> i64
      %7093 = func.call @cc_nil_value() : () -> i64
      %7094 = func.call @cc_cons(%7092, %7093) : (i64, i64) -> i64
      %7095 = func.call @cc_values_pack(%7094) : (i64) -> i64
      func.call @stack_push_pointer(%7092) : (i64) -> ()
      %7096 = llvm.mlir.addressof @str548 : !llvm.ptr
      %7097 = arith.constant 1 : i64
      %7098 = func.call @cc_make_string(%7096, %7097) : (!llvm.ptr, i64) -> i64
      %7099 = func.call @cc_nil_value() : () -> i64
      %7100 = func.call @cc_intern(%7098, %7099) : (i64, i64) -> i64
      %7101 = func.call @cc_nil_value() : () -> i64
      %7102 = func.call @cc_cons(%7100, %7101) : (i64, i64) -> i64
      %7103 = func.call @cc_values_pack(%7102) : (i64) -> i64
      func.call @stack_push_pointer(%7100) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7104 = func.call @stack_pop_pointer() : () -> i64
      %7105 = func.call @stack_pop_pointer() : () -> i64
      %7106 = func.call @cc_cons(%7105, %7104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7106) : (i64) -> ()
      %7107 = func.call @stack_pop_pointer() : () -> i64
      %7108 = func.call @stack_pop_pointer() : () -> i64
      %7109 = func.call @cc_cons(%7108, %7107) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7109) : (i64) -> ()
      %7110 = llvm.mlir.addressof @str549 : !llvm.ptr
      %7111 = arith.constant 2 : i64
      %7112 = func.call @cc_make_string(%7110, %7111) : (!llvm.ptr, i64) -> i64
      %7113 = llvm.mlir.addressof @str550 : !llvm.ptr
      %7114 = arith.constant 11 : i64
      %7115 = func.call @cc_make_string(%7113, %7114) : (!llvm.ptr, i64) -> i64
      %7116 = func.call @cc_intern(%7112, %7115) : (i64, i64) -> i64
      %7117 = func.call @cc_nil_value() : () -> i64
      %7118 = func.call @cc_cons(%7116, %7117) : (i64, i64) -> i64
      %7119 = func.call @cc_values_pack(%7118) : (i64) -> i64
      func.call @stack_push_pointer(%7116) : (i64) -> ()
      %7120 = llvm.mlir.addressof @str551 : !llvm.ptr
      %7121 = arith.constant 12 : i64
      %7122 = func.call @cc_make_string(%7120, %7121) : (!llvm.ptr, i64) -> i64
      %7123 = llvm.mlir.addressof @str552 : !llvm.ptr
      %7124 = arith.constant 11 : i64
      %7125 = func.call @cc_make_string(%7123, %7124) : (!llvm.ptr, i64) -> i64
      %7126 = func.call @cc_intern(%7122, %7125) : (i64, i64) -> i64
      %7127 = func.call @cc_nil_value() : () -> i64
      %7128 = func.call @cc_cons(%7126, %7127) : (i64, i64) -> i64
      %7129 = func.call @cc_values_pack(%7128) : (i64) -> i64
      func.call @stack_push_pointer(%7126) : (i64) -> ()
      %7130 = llvm.mlir.addressof @str553 : !llvm.ptr
      %7131 = arith.constant 1 : i64
      %7132 = func.call @cc_make_string(%7130, %7131) : (!llvm.ptr, i64) -> i64
      %7133 = func.call @cc_nil_value() : () -> i64
      %7134 = func.call @cc_intern(%7132, %7133) : (i64, i64) -> i64
      %7135 = func.call @cc_nil_value() : () -> i64
      %7136 = func.call @cc_cons(%7134, %7135) : (i64, i64) -> i64
      %7137 = func.call @cc_values_pack(%7136) : (i64) -> i64
      func.call @stack_push_pointer(%7134) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7138 = func.call @stack_pop_pointer() : () -> i64
      %7139 = func.call @stack_pop_pointer() : () -> i64
      %7140 = func.call @cc_cons(%7139, %7138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7140) : (i64) -> ()
      %7141 = func.call @stack_pop_pointer() : () -> i64
      %7142 = func.call @stack_pop_pointer() : () -> i64
      %7143 = func.call @cc_cons(%7142, %7141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7143) : (i64) -> ()
      %7144 = llvm.mlir.addressof @str554 : !llvm.ptr
      %7145 = arith.constant 12 : i64
      %7146 = func.call @cc_make_string(%7144, %7145) : (!llvm.ptr, i64) -> i64
      %7147 = llvm.mlir.addressof @str555 : !llvm.ptr
      %7148 = arith.constant 11 : i64
      %7149 = func.call @cc_make_string(%7147, %7148) : (!llvm.ptr, i64) -> i64
      %7150 = func.call @cc_intern(%7146, %7149) : (i64, i64) -> i64
      %7151 = func.call @cc_nil_value() : () -> i64
      %7152 = func.call @cc_cons(%7150, %7151) : (i64, i64) -> i64
      %7153 = func.call @cc_values_pack(%7152) : (i64) -> i64
      func.call @stack_push_pointer(%7150) : (i64) -> ()
      %7154 = llvm.mlir.addressof @str556 : !llvm.ptr
      %7155 = arith.constant 1 : i64
      %7156 = func.call @cc_make_string(%7154, %7155) : (!llvm.ptr, i64) -> i64
      %7157 = func.call @cc_nil_value() : () -> i64
      %7158 = func.call @cc_intern(%7156, %7157) : (i64, i64) -> i64
      %7159 = func.call @cc_nil_value() : () -> i64
      %7160 = func.call @cc_cons(%7158, %7159) : (i64, i64) -> i64
      %7161 = func.call @cc_values_pack(%7160) : (i64) -> i64
      func.call @stack_push_pointer(%7158) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7162 = func.call @stack_pop_pointer() : () -> i64
      %7163 = func.call @stack_pop_pointer() : () -> i64
      %7164 = func.call @cc_cons(%7163, %7162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7164) : (i64) -> ()
      %7165 = func.call @stack_pop_pointer() : () -> i64
      %7166 = func.call @stack_pop_pointer() : () -> i64
      %7167 = func.call @cc_cons(%7166, %7165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7167) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7168 = func.call @stack_pop_pointer() : () -> i64
      %7169 = func.call @stack_pop_pointer() : () -> i64
      %7170 = func.call @cc_cons(%7169, %7168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7170) : (i64) -> ()
      %7171 = func.call @stack_pop_pointer() : () -> i64
      %7172 = func.call @stack_pop_pointer() : () -> i64
      %7173 = func.call @cc_cons(%7172, %7171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7173) : (i64) -> ()
      %7174 = func.call @stack_pop_pointer() : () -> i64
      %7175 = func.call @stack_pop_pointer() : () -> i64
      %7176 = func.call @cc_cons(%7175, %7174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7176) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7177 = func.call @stack_pop_pointer() : () -> i64
      %7178 = func.call @stack_pop_pointer() : () -> i64
      %7179 = func.call @cc_cons(%7178, %7177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7179) : (i64) -> ()
      %7180 = func.call @stack_pop_pointer() : () -> i64
      %7181 = func.call @stack_pop_pointer() : () -> i64
      %7182 = func.call @cc_cons(%7181, %7180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7182) : (i64) -> ()
      %7183 = func.call @stack_pop_pointer() : () -> i64
      %7184 = func.call @stack_pop_pointer() : () -> i64
      %7185 = func.call @cc_cons(%7184, %7183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7185) : (i64) -> ()
      %7186 = llvm.mlir.addressof @str557 : !llvm.ptr
      %7187 = arith.constant 3 : i64
      %7188 = func.call @cc_make_string(%7186, %7187) : (!llvm.ptr, i64) -> i64
      %7189 = llvm.mlir.addressof @str558 : !llvm.ptr
      %7190 = arith.constant 11 : i64
      %7191 = func.call @cc_make_string(%7189, %7190) : (!llvm.ptr, i64) -> i64
      %7192 = func.call @cc_intern(%7188, %7191) : (i64, i64) -> i64
      %7193 = func.call @cc_nil_value() : () -> i64
      %7194 = func.call @cc_cons(%7192, %7193) : (i64, i64) -> i64
      %7195 = func.call @cc_values_pack(%7194) : (i64) -> i64
      func.call @stack_push_pointer(%7192) : (i64) -> ()
      %7196 = llvm.mlir.addressof @str559 : !llvm.ptr
      %7197 = arith.constant 2 : i64
      %7198 = func.call @cc_make_string(%7196, %7197) : (!llvm.ptr, i64) -> i64
      %7199 = llvm.mlir.addressof @str560 : !llvm.ptr
      %7200 = arith.constant 11 : i64
      %7201 = func.call @cc_make_string(%7199, %7200) : (!llvm.ptr, i64) -> i64
      %7202 = func.call @cc_intern(%7198, %7201) : (i64, i64) -> i64
      %7203 = func.call @cc_nil_value() : () -> i64
      %7204 = func.call @cc_cons(%7202, %7203) : (i64, i64) -> i64
      %7205 = func.call @cc_values_pack(%7204) : (i64) -> i64
      func.call @stack_push_pointer(%7202) : (i64) -> ()
      %7206 = llvm.mlir.addressof @str561 : !llvm.ptr
      %7207 = arith.constant 12 : i64
      %7208 = func.call @cc_make_string(%7206, %7207) : (!llvm.ptr, i64) -> i64
      %7209 = llvm.mlir.addressof @str562 : !llvm.ptr
      %7210 = arith.constant 11 : i64
      %7211 = func.call @cc_make_string(%7209, %7210) : (!llvm.ptr, i64) -> i64
      %7212 = func.call @cc_intern(%7208, %7211) : (i64, i64) -> i64
      %7213 = func.call @cc_nil_value() : () -> i64
      %7214 = func.call @cc_cons(%7212, %7213) : (i64, i64) -> i64
      %7215 = func.call @cc_values_pack(%7214) : (i64) -> i64
      func.call @stack_push_pointer(%7212) : (i64) -> ()
      %7216 = llvm.mlir.addressof @str563 : !llvm.ptr
      %7217 = arith.constant 1 : i64
      %7218 = func.call @cc_make_string(%7216, %7217) : (!llvm.ptr, i64) -> i64
      %7219 = func.call @cc_nil_value() : () -> i64
      %7220 = func.call @cc_intern(%7218, %7219) : (i64, i64) -> i64
      %7221 = func.call @cc_nil_value() : () -> i64
      %7222 = func.call @cc_cons(%7220, %7221) : (i64, i64) -> i64
      %7223 = func.call @cc_values_pack(%7222) : (i64) -> i64
      func.call @stack_push_pointer(%7220) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7224 = func.call @stack_pop_pointer() : () -> i64
      %7225 = func.call @stack_pop_pointer() : () -> i64
      %7226 = func.call @cc_cons(%7225, %7224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7226) : (i64) -> ()
      %7227 = func.call @stack_pop_pointer() : () -> i64
      %7228 = func.call @stack_pop_pointer() : () -> i64
      %7229 = func.call @cc_cons(%7228, %7227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7229) : (i64) -> ()
      %7230 = llvm.mlir.addressof @str564 : !llvm.ptr
      %7231 = arith.constant 12 : i64
      %7232 = func.call @cc_make_string(%7230, %7231) : (!llvm.ptr, i64) -> i64
      %7233 = llvm.mlir.addressof @str565 : !llvm.ptr
      %7234 = arith.constant 11 : i64
      %7235 = func.call @cc_make_string(%7233, %7234) : (!llvm.ptr, i64) -> i64
      %7236 = func.call @cc_intern(%7232, %7235) : (i64, i64) -> i64
      %7237 = func.call @cc_nil_value() : () -> i64
      %7238 = func.call @cc_cons(%7236, %7237) : (i64, i64) -> i64
      %7239 = func.call @cc_values_pack(%7238) : (i64) -> i64
      func.call @stack_push_pointer(%7236) : (i64) -> ()
      %7240 = llvm.mlir.addressof @str566 : !llvm.ptr
      %7241 = arith.constant 1 : i64
      %7242 = func.call @cc_make_string(%7240, %7241) : (!llvm.ptr, i64) -> i64
      %7243 = func.call @cc_nil_value() : () -> i64
      %7244 = func.call @cc_intern(%7242, %7243) : (i64, i64) -> i64
      %7245 = func.call @cc_nil_value() : () -> i64
      %7246 = func.call @cc_cons(%7244, %7245) : (i64, i64) -> i64
      %7247 = func.call @cc_values_pack(%7246) : (i64) -> i64
      func.call @stack_push_pointer(%7244) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7248 = func.call @stack_pop_pointer() : () -> i64
      %7249 = func.call @stack_pop_pointer() : () -> i64
      %7250 = func.call @cc_cons(%7249, %7248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7250) : (i64) -> ()
      %7251 = func.call @stack_pop_pointer() : () -> i64
      %7252 = func.call @stack_pop_pointer() : () -> i64
      %7253 = func.call @cc_cons(%7252, %7251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7253) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7254 = func.call @stack_pop_pointer() : () -> i64
      %7255 = func.call @stack_pop_pointer() : () -> i64
      %7256 = func.call @cc_cons(%7255, %7254) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7256) : (i64) -> ()
      %7257 = func.call @stack_pop_pointer() : () -> i64
      %7258 = func.call @stack_pop_pointer() : () -> i64
      %7259 = func.call @cc_cons(%7258, %7257) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7259) : (i64) -> ()
      %7260 = func.call @stack_pop_pointer() : () -> i64
      %7261 = func.call @stack_pop_pointer() : () -> i64
      %7262 = func.call @cc_cons(%7261, %7260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7262) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7263 = func.call @stack_pop_pointer() : () -> i64
      %7264 = func.call @stack_pop_pointer() : () -> i64
      %7265 = func.call @cc_cons(%7264, %7263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7265) : (i64) -> ()
      %7266 = func.call @stack_pop_pointer() : () -> i64
      %7267 = func.call @stack_pop_pointer() : () -> i64
      %7268 = func.call @cc_cons(%7267, %7266) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7268) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7269 = func.call @stack_pop_pointer() : () -> i64
      %7270 = func.call @stack_pop_pointer() : () -> i64
      %7271 = func.call @cc_cons(%7270, %7269) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7271) : (i64) -> ()
      %7272 = func.call @stack_pop_pointer() : () -> i64
      %7273 = func.call @stack_pop_pointer() : () -> i64
      %7274 = func.call @cc_cons(%7273, %7272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7274) : (i64) -> ()
      %7275 = func.call @stack_pop_pointer() : () -> i64
      %7276 = func.call @stack_pop_pointer() : () -> i64
      %7277 = func.call @cc_cons(%7276, %7275) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7277) : (i64) -> ()
      %7278 = func.call @stack_pop_pointer() : () -> i64
      %7279 = func.call @stack_pop_pointer() : () -> i64
      %7280 = func.call @cc_cons(%7279, %7278) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7280) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7281 = func.call @stack_pop_pointer() : () -> i64
      %7282 = func.call @stack_pop_pointer() : () -> i64
      %7283 = func.call @cc_cons(%7282, %7281) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7283) : (i64) -> ()
      %7284 = func.call @stack_pop_pointer() : () -> i64
      %7285 = func.call @stack_pop_pointer() : () -> i64
      %7286 = func.call @cc_cons(%7285, %7284) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7286) : (i64) -> ()
      %7287 = func.call @stack_pop_pointer() : () -> i64
      %7288 = func.call @stack_pop_pointer() : () -> i64
      %7289 = func.call @cc_cons(%7288, %7287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7289) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7290 = func.call @stack_pop_pointer() : () -> i64
      %7291 = func.call @stack_pop_pointer() : () -> i64
      %7292 = func.call @cc_cons(%7291, %7290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7292) : (i64) -> ()
      %7293 = func.call @stack_pop_pointer() : () -> i64
      %7294 = func.call @stack_pop_pointer() : () -> i64
      %7295 = func.call @cc_cons(%7294, %7293) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7295) : (i64) -> ()
      %7296 = llvm.mlir.addressof @str567 : !llvm.ptr
      %7297 = arith.constant 5 : i64
      %7298 = func.call @cc_make_string(%7296, %7297) : (!llvm.ptr, i64) -> i64
      %7299 = func.call @cc_nil_value() : () -> i64
      %7300 = func.call @cc_intern(%7298, %7299) : (i64, i64) -> i64
      %7301 = func.call @cc_nil_value() : () -> i64
      %7302 = func.call @cc_cons(%7300, %7301) : (i64, i64) -> i64
      %7303 = func.call @cc_values_pack(%7302) : (i64) -> i64
      func.call @stack_push_pointer(%7300) : (i64) -> ()
      %7304 = llvm.mlir.addressof @str568 : !llvm.ptr
      %7305 = arith.constant 4 : i64
      %7306 = func.call @cc_make_string(%7304, %7305) : (!llvm.ptr, i64) -> i64
      %7307 = func.call @cc_nil_value() : () -> i64
      %7308 = func.call @cc_intern(%7306, %7307) : (i64, i64) -> i64
      %7309 = func.call @cc_nil_value() : () -> i64
      %7310 = func.call @cc_cons(%7308, %7309) : (i64, i64) -> i64
      %7311 = func.call @cc_values_pack(%7310) : (i64) -> i64
      func.call @stack_push_pointer(%7308) : (i64) -> ()
      %7312 = llvm.mlir.addressof @str569 : !llvm.ptr
      %7313 = arith.constant 15 : i64
      %7314 = func.call @cc_make_string(%7312, %7313) : (!llvm.ptr, i64) -> i64
      %7315 = func.call @cc_nil_value() : () -> i64
      %7316 = func.call @cc_intern(%7314, %7315) : (i64, i64) -> i64
      %7317 = func.call @cc_nil_value() : () -> i64
      %7318 = func.call @cc_cons(%7316, %7317) : (i64, i64) -> i64
      %7319 = func.call @cc_values_pack(%7318) : (i64) -> i64
      func.call @stack_push_pointer(%7316) : (i64) -> ()
      %7320 = llvm.mlir.addressof @str570 : !llvm.ptr
      %7321 = arith.constant 6 : i64
      %7322 = func.call @cc_make_string(%7320, %7321) : (!llvm.ptr, i64) -> i64
      %7323 = func.call @cc_nil_value() : () -> i64
      %7324 = func.call @cc_intern(%7322, %7323) : (i64, i64) -> i64
      %7325 = func.call @cc_nil_value() : () -> i64
      %7326 = func.call @cc_cons(%7324, %7325) : (i64, i64) -> i64
      %7327 = func.call @cc_values_pack(%7326) : (i64) -> i64
      func.call @stack_push_pointer(%7324) : (i64) -> ()
      %7328 = llvm.mlir.addressof @str571 : !llvm.ptr
      %7329 = arith.constant 15 : i64
      %7330 = func.call @cc_make_string(%7328, %7329) : (!llvm.ptr, i64) -> i64
      %7331 = func.call @cc_nil_value() : () -> i64
      %7332 = func.call @cc_intern(%7330, %7331) : (i64, i64) -> i64
      %7333 = func.call @cc_nil_value() : () -> i64
      %7334 = func.call @cc_cons(%7332, %7333) : (i64, i64) -> i64
      %7335 = func.call @cc_values_pack(%7334) : (i64) -> i64
      func.call @stack_push_pointer(%7332) : (i64) -> ()
      %7336 = llvm.mlir.addressof @str572 : !llvm.ptr
      %7337 = arith.constant 4 : i64
      %7338 = func.call @cc_make_string(%7336, %7337) : (!llvm.ptr, i64) -> i64
      %7339 = func.call @cc_nil_value() : () -> i64
      %7340 = func.call @cc_intern(%7338, %7339) : (i64, i64) -> i64
      %7341 = func.call @cc_nil_value() : () -> i64
      %7342 = func.call @cc_cons(%7340, %7341) : (i64, i64) -> i64
      %7343 = func.call @cc_values_pack(%7342) : (i64) -> i64
      func.call @stack_push_pointer(%7340) : (i64) -> ()
      %7344 = llvm.mlir.addressof @str573 : !llvm.ptr
      %7345 = arith.constant 9 : i64
      %7346 = func.call @cc_make_string(%7344, %7345) : (!llvm.ptr, i64) -> i64
      %7347 = llvm.mlir.addressof @str574 : !llvm.ptr
      %7348 = arith.constant 11 : i64
      %7349 = func.call @cc_make_string(%7347, %7348) : (!llvm.ptr, i64) -> i64
      %7350 = func.call @cc_intern(%7346, %7349) : (i64, i64) -> i64
      %7351 = func.call @cc_nil_value() : () -> i64
      %7352 = func.call @cc_cons(%7350, %7351) : (i64, i64) -> i64
      %7353 = func.call @cc_values_pack(%7352) : (i64) -> i64
      func.call @stack_push_pointer(%7350) : (i64) -> ()
      %7354 = llvm.mlir.addressof @str575 : !llvm.ptr
      %7355 = arith.constant 1 : i64
      %7356 = func.call @cc_make_string(%7354, %7355) : (!llvm.ptr, i64) -> i64
      %7357 = func.call @cc_nil_value() : () -> i64
      %7358 = func.call @cc_intern(%7356, %7357) : (i64, i64) -> i64
      %7359 = func.call @cc_nil_value() : () -> i64
      %7360 = func.call @cc_cons(%7358, %7359) : (i64, i64) -> i64
      %7361 = func.call @cc_values_pack(%7360) : (i64) -> i64
      func.call @stack_push_pointer(%7358) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7362 = func.call @stack_pop_pointer() : () -> i64
      %7363 = func.call @stack_pop_pointer() : () -> i64
      %7364 = func.call @cc_cons(%7363, %7362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7364) : (i64) -> ()
      %7365 = func.call @stack_pop_pointer() : () -> i64
      %7366 = func.call @stack_pop_pointer() : () -> i64
      %7367 = func.call @cc_cons(%7366, %7365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7367) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7368 = func.call @stack_pop_pointer() : () -> i64
      %7369 = func.call @stack_pop_pointer() : () -> i64
      %7370 = func.call @cc_cons(%7369, %7368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7370) : (i64) -> ()
      %7371 = func.call @stack_pop_pointer() : () -> i64
      %7372 = func.call @stack_pop_pointer() : () -> i64
      %7373 = func.call @cc_cons(%7372, %7371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7373) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7374 = func.call @stack_pop_pointer() : () -> i64
      %7375 = func.call @stack_pop_pointer() : () -> i64
      %7376 = func.call @cc_cons(%7375, %7374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7376) : (i64) -> ()
      %7377 = func.call @stack_pop_pointer() : () -> i64
      %7378 = func.call @stack_pop_pointer() : () -> i64
      %7379 = func.call @cc_cons(%7378, %7377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7379) : (i64) -> ()
      %7380 = func.call @stack_pop_pointer() : () -> i64
      %7381 = func.call @stack_pop_pointer() : () -> i64
      %7382 = func.call @cc_cons(%7381, %7380) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7382) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7383 = func.call @stack_pop_pointer() : () -> i64
      %7384 = func.call @stack_pop_pointer() : () -> i64
      %7385 = func.call @cc_cons(%7384, %7383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7385) : (i64) -> ()
      %7386 = func.call @stack_pop_pointer() : () -> i64
      %7387 = func.call @stack_pop_pointer() : () -> i64
      %7388 = func.call @cc_cons(%7387, %7386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7388) : (i64) -> ()
      %7389 = func.call @stack_pop_pointer() : () -> i64
      %7390 = func.call @stack_pop_pointer() : () -> i64
      %7391 = func.call @cc_cons(%7390, %7389) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7391) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7392 = func.call @stack_pop_pointer() : () -> i64
      %7393 = func.call @stack_pop_pointer() : () -> i64
      %7394 = func.call @cc_cons(%7393, %7392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7394) : (i64) -> ()
      %7395 = func.call @stack_pop_pointer() : () -> i64
      %7396 = func.call @stack_pop_pointer() : () -> i64
      %7397 = func.call @cc_cons(%7396, %7395) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7397) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7398 = func.call @stack_pop_pointer() : () -> i64
      %7399 = func.call @stack_pop_pointer() : () -> i64
      %7400 = func.call @cc_cons(%7399, %7398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7400) : (i64) -> ()
      %7401 = func.call @stack_pop_pointer() : () -> i64
      %7402 = func.call @stack_pop_pointer() : () -> i64
      %7403 = func.call @cc_cons(%7402, %7401) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7403) : (i64) -> ()
      %7404 = func.call @stack_pop_pointer() : () -> i64
      %7405 = func.call @stack_pop_pointer() : () -> i64
      %7406 = func.call @cc_cons(%7405, %7404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7406) : (i64) -> ()
      %7407 = func.call @stack_pop_pointer() : () -> i64
      %7408 = func.call @stack_pop_pointer() : () -> i64
      %7409 = func.call @cc_cons(%7408, %7407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7409) : (i64) -> ()
      %7410 = llvm.mlir.addressof @str576 : !llvm.ptr
      %7411 = arith.constant 4 : i64
      %7412 = func.call @cc_make_string(%7410, %7411) : (!llvm.ptr, i64) -> i64
      %7413 = func.call @cc_nil_value() : () -> i64
      %7414 = func.call @cc_intern(%7412, %7413) : (i64, i64) -> i64
      %7415 = func.call @cc_nil_value() : () -> i64
      %7416 = func.call @cc_cons(%7414, %7415) : (i64, i64) -> i64
      %7417 = func.call @cc_values_pack(%7416) : (i64) -> i64
      func.call @stack_push_pointer(%7414) : (i64) -> ()
      %7418 = llvm.mlir.addressof @str577 : !llvm.ptr
      %7419 = arith.constant 1 : i64
      %7420 = func.call @cc_make_string(%7418, %7419) : (!llvm.ptr, i64) -> i64
      %7421 = func.call @cc_nil_value() : () -> i64
      %7422 = func.call @cc_intern(%7420, %7421) : (i64, i64) -> i64
      %7423 = func.call @cc_nil_value() : () -> i64
      %7424 = func.call @cc_cons(%7422, %7423) : (i64, i64) -> i64
      %7425 = func.call @cc_values_pack(%7424) : (i64) -> i64
      func.call @stack_push_pointer(%7422) : (i64) -> ()
      %7426 = llvm.mlir.addressof @str578 : !llvm.ptr
      %7427 = arith.constant 1 : i64
      %7428 = func.call @cc_make_string(%7426, %7427) : (!llvm.ptr, i64) -> i64
      %7429 = func.call @cc_nil_value() : () -> i64
      %7430 = func.call @cc_intern(%7428, %7429) : (i64, i64) -> i64
      %7431 = func.call @cc_nil_value() : () -> i64
      %7432 = func.call @cc_cons(%7430, %7431) : (i64, i64) -> i64
      %7433 = func.call @cc_values_pack(%7432) : (i64) -> i64
      func.call @stack_push_pointer(%7430) : (i64) -> ()
      %7434 = llvm.mlir.addressof @str579 : !llvm.ptr
      %7435 = arith.constant 1 : i64
      %7436 = func.call @cc_make_string(%7434, %7435) : (!llvm.ptr, i64) -> i64
      %7437 = func.call @cc_nil_value() : () -> i64
      %7438 = func.call @cc_intern(%7436, %7437) : (i64, i64) -> i64
      %7439 = func.call @cc_nil_value() : () -> i64
      %7440 = func.call @cc_cons(%7438, %7439) : (i64, i64) -> i64
      %7441 = func.call @cc_values_pack(%7440) : (i64) -> i64
      func.call @stack_push_pointer(%7438) : (i64) -> ()
      %7442 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%7442) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7443 = func.call @stack_pop_pointer() : () -> i64
      %7444 = func.call @stack_pop_pointer() : () -> i64
      %7445 = func.call @cc_cons(%7444, %7443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7445) : (i64) -> ()
      %7446 = func.call @stack_pop_pointer() : () -> i64
      %7447 = func.call @stack_pop_pointer() : () -> i64
      %7448 = func.call @cc_cons(%7447, %7446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7448) : (i64) -> ()
      %7449 = func.call @stack_pop_pointer() : () -> i64
      %7450 = func.call @stack_pop_pointer() : () -> i64
      %7451 = func.call @cc_cons(%7450, %7449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7451) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7452 = func.call @stack_pop_pointer() : () -> i64
      %7453 = func.call @stack_pop_pointer() : () -> i64
      %7454 = func.call @cc_cons(%7453, %7452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7454) : (i64) -> ()
      %7455 = func.call @stack_pop_pointer() : () -> i64
      %7456 = func.call @stack_pop_pointer() : () -> i64
      %7457 = func.call @cc_cons(%7456, %7455) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7457) : (i64) -> ()
      %7458 = func.call @stack_pop_pointer() : () -> i64
      %7459 = func.call @stack_pop_pointer() : () -> i64
      %7460 = func.call @cc_cons(%7459, %7458) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7460) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7461 = func.call @stack_pop_pointer() : () -> i64
      %7462 = func.call @stack_pop_pointer() : () -> i64
      %7463 = func.call @cc_cons(%7462, %7461) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7463) : (i64) -> ()
      %7464 = func.call @stack_pop_pointer() : () -> i64
      %7465 = func.call @stack_pop_pointer() : () -> i64
      %7466 = func.call @cc_cons(%7465, %7464) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7466) : (i64) -> ()
      %7467 = func.call @stack_pop_pointer() : () -> i64
      %7468 = func.call @stack_pop_pointer() : () -> i64
      %7469 = func.call @cc_cons(%7468, %7467) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7469) : (i64) -> ()
      %7470 = func.call @stack_pop_pointer() : () -> i64
      %7471 = func.call @stack_pop_pointer() : () -> i64
      %7472 = func.call @cc_cons(%7471, %7470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7472) : (i64) -> ()
      %7473 = func.call @stack_pop_pointer() : () -> i64
      %7474 = func.call @stack_pop_pointer() : () -> i64
      %7475 = func.call @cc_cons(%7474, %7473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7475) : (i64) -> ()
      %7476 = func.call @stack_pop_pointer() : () -> i64
      %7477 = func.call @stack_pop_pointer() : () -> i64
      %7478 = func.call @cc_cons(%7477, %7476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7478) : (i64) -> ()
      %7479 = func.call @stack_pop_pointer() : () -> i64
      %7480 = func.call @stack_pop_pointer() : () -> i64
      %7481 = func.call @cc_cons(%7480, %7479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7481) : (i64) -> ()
      %7482 = llvm.mlir.addressof @str580 : !llvm.ptr
      %7483 = arith.constant 2 : i64
      %7484 = func.call @cc_make_string(%7482, %7483) : (!llvm.ptr, i64) -> i64
      %7485 = func.call @cc_nil_value() : () -> i64
      %7486 = func.call @cc_intern(%7484, %7485) : (i64, i64) -> i64
      %7487 = func.call @cc_nil_value() : () -> i64
      %7488 = func.call @cc_cons(%7486, %7487) : (i64, i64) -> i64
      %7489 = func.call @cc_values_pack(%7488) : (i64) -> i64
      func.call @stack_push_pointer(%7486) : (i64) -> ()
      %7490 = llvm.mlir.addressof @str581 : !llvm.ptr
      %7491 = arith.constant 17 : i64
      %7492 = func.call @cc_make_string(%7490, %7491) : (!llvm.ptr, i64) -> i64
      %7493 = func.call @cc_nil_value() : () -> i64
      %7494 = func.call @cc_intern(%7492, %7493) : (i64, i64) -> i64
      %7495 = func.call @cc_nil_value() : () -> i64
      %7496 = func.call @cc_cons(%7494, %7495) : (i64, i64) -> i64
      %7497 = func.call @cc_values_pack(%7496) : (i64) -> i64
      func.call @stack_push_pointer(%7494) : (i64) -> ()
      %7498 = llvm.mlir.addressof @str582 : !llvm.ptr
      %7499 = arith.constant 5 : i64
      %7500 = func.call @cc_make_string(%7498, %7499) : (!llvm.ptr, i64) -> i64
      %7501 = func.call @cc_nil_value() : () -> i64
      %7502 = func.call @cc_intern(%7500, %7501) : (i64, i64) -> i64
      %7503 = func.call @cc_nil_value() : () -> i64
      %7504 = func.call @cc_cons(%7502, %7503) : (i64, i64) -> i64
      %7505 = func.call @cc_values_pack(%7504) : (i64) -> i64
      func.call @stack_push_pointer(%7502) : (i64) -> ()
      %7506 = llvm.mlir.addressof @str583 : !llvm.ptr
      %7507 = arith.constant 4 : i64
      %7508 = func.call @cc_make_string(%7506, %7507) : (!llvm.ptr, i64) -> i64
      %7509 = func.call @cc_nil_value() : () -> i64
      %7510 = func.call @cc_intern(%7508, %7509) : (i64, i64) -> i64
      %7511 = func.call @cc_nil_value() : () -> i64
      %7512 = func.call @cc_cons(%7510, %7511) : (i64, i64) -> i64
      %7513 = func.call @cc_values_pack(%7512) : (i64) -> i64
      func.call @stack_push_pointer(%7510) : (i64) -> ()
      %7514 = llvm.mlir.addressof @str584 : !llvm.ptr
      %7515 = arith.constant 1 : i64
      %7516 = func.call @cc_make_string(%7514, %7515) : (!llvm.ptr, i64) -> i64
      %7517 = func.call @cc_nil_value() : () -> i64
      %7518 = func.call @cc_intern(%7516, %7517) : (i64, i64) -> i64
      %7519 = func.call @cc_nil_value() : () -> i64
      %7520 = func.call @cc_cons(%7518, %7519) : (i64, i64) -> i64
      %7521 = func.call @cc_values_pack(%7520) : (i64) -> i64
      func.call @stack_push_pointer(%7518) : (i64) -> ()
      %7522 = llvm.mlir.addressof @str585 : !llvm.ptr
      %7523 = arith.constant 19 : i64
      %7524 = func.call @cc_make_string(%7522, %7523) : (!llvm.ptr, i64) -> i64
      %7525 = func.call @cc_nil_value() : () -> i64
      %7526 = func.call @cc_intern(%7524, %7525) : (i64, i64) -> i64
      %7527 = func.call @cc_nil_value() : () -> i64
      %7528 = func.call @cc_cons(%7526, %7527) : (i64, i64) -> i64
      %7529 = func.call @cc_values_pack(%7528) : (i64) -> i64
      func.call @stack_push_pointer(%7526) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7530 = func.call @stack_pop_pointer() : () -> i64
      %7531 = func.call @stack_pop_pointer() : () -> i64
      %7532 = func.call @cc_cons(%7531, %7530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7532) : (i64) -> ()
      %7533 = func.call @stack_pop_pointer() : () -> i64
      %7534 = func.call @stack_pop_pointer() : () -> i64
      %7535 = func.call @cc_cons(%7534, %7533) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7535) : (i64) -> ()
      %7536 = func.call @stack_pop_pointer() : () -> i64
      %7537 = func.call @stack_pop_pointer() : () -> i64
      %7538 = func.call @cc_cons(%7537, %7536) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7538) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7539 = func.call @stack_pop_pointer() : () -> i64
      %7540 = func.call @stack_pop_pointer() : () -> i64
      %7541 = func.call @cc_cons(%7540, %7539) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7541) : (i64) -> ()
      %7542 = func.call @stack_pop_pointer() : () -> i64
      %7543 = func.call @stack_pop_pointer() : () -> i64
      %7544 = func.call @cc_cons(%7543, %7542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7544) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7545 = func.call @stack_pop_pointer() : () -> i64
      %7546 = func.call @stack_pop_pointer() : () -> i64
      %7547 = func.call @cc_cons(%7546, %7545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7547) : (i64) -> ()
      %7548 = func.call @stack_pop_pointer() : () -> i64
      %7549 = func.call @stack_pop_pointer() : () -> i64
      %7550 = func.call @cc_cons(%7549, %7548) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7550) : (i64) -> ()
      %7551 = func.call @stack_pop_pointer() : () -> i64
      %7552 = func.call @stack_pop_pointer() : () -> i64
      %7553 = func.call @cc_cons(%7552, %7551) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7553) : (i64) -> ()
      %7554 = func.call @stack_pop_pointer() : () -> i64
      %7555 = func.call @stack_pop_pointer() : () -> i64
      %7556 = func.call @cc_cons(%7555, %7554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7556) : (i64) -> ()
      %7557 = llvm.mlir.addressof @str586 : !llvm.ptr
      %7558 = arith.constant 15 : i64
      %7559 = func.call @cc_make_string(%7557, %7558) : (!llvm.ptr, i64) -> i64
      %7560 = func.call @cc_nil_value() : () -> i64
      %7561 = func.call @cc_intern(%7559, %7560) : (i64, i64) -> i64
      %7562 = func.call @cc_nil_value() : () -> i64
      %7563 = func.call @cc_cons(%7561, %7562) : (i64, i64) -> i64
      %7564 = func.call @cc_values_pack(%7563) : (i64) -> i64
      func.call @stack_push_pointer(%7561) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7565 = func.call @stack_pop_pointer() : () -> i64
      %7566 = func.call @stack_pop_pointer() : () -> i64
      %7567 = func.call @cc_cons(%7566, %7565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7567) : (i64) -> ()
      %7568 = func.call @stack_pop_pointer() : () -> i64
      %7569 = func.call @stack_pop_pointer() : () -> i64
      %7570 = func.call @cc_cons(%7569, %7568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7570) : (i64) -> ()
      %7571 = func.call @stack_pop_pointer() : () -> i64
      %7572 = func.call @stack_pop_pointer() : () -> i64
      %7573 = func.call @cc_cons(%7572, %7571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7573) : (i64) -> ()
      %7574 = func.call @stack_pop_pointer() : () -> i64
      %7575 = func.call @stack_pop_pointer() : () -> i64
      %7576 = func.call @cc_cons(%7575, %7574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7576) : (i64) -> ()
      %7577 = func.call @stack_pop_pointer() : () -> i64
      %7578 = func.call @stack_pop_pointer() : () -> i64
      %7579 = func.call @cc_cons(%7578, %7577) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7579) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7580 = func.call @stack_pop_pointer() : () -> i64
      %7581 = func.call @stack_pop_pointer() : () -> i64
      %7582 = func.call @cc_cons(%7581, %7580) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7582) : (i64) -> ()
      %7583 = func.call @stack_pop_pointer() : () -> i64
      %7584 = func.call @stack_pop_pointer() : () -> i64
      %7585 = func.call @cc_cons(%7584, %7583) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7585) : (i64) -> ()
      %7586 = func.call @stack_pop_pointer() : () -> i64
      %7587 = func.call @stack_pop_pointer() : () -> i64
      %7588 = func.call @cc_cons(%7587, %7586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7588) : (i64) -> ()
      %7589 = func.call @stack_pop_pointer() : () -> i64
      %7956 = arith.constant 209815645192222 : i64
      %7957 = arith.constant 0 : i64
      %7958 = func.call @cc_make_closure(%7956, %7957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7958) : (i64) -> ()
      %7959 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %7960 = func.call @stack_pop_pointer() : () -> i64
      %7961 = func.call @stack_pop_pointer() : () -> i64
      %7962 = func.call @cc_cons(%7961, %7960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7962) : (i64) -> ()
      %7963 = func.call @stack_pop_pointer() : () -> i64
      %7964 = llvm.mlir.addressof @str602 : !llvm.ptr
      %7965 = arith.constant 11 : i64
      %7966 = func.call @cc_make_string(%7964, %7965) : (!llvm.ptr, i64) -> i64
      %7967 = llvm.mlir.addressof @str603 : !llvm.ptr
      %7968 = arith.constant 7 : i64
      %7969 = func.call @cc_make_string(%7967, %7968) : (!llvm.ptr, i64) -> i64
      %7970 = func.call @cc_intern(%7966, %7969) : (i64, i64) -> i64
      %7971 = func.call @cc_nil_value() : () -> i64
      %7972 = func.call @cc_cons(%7970, %7971) : (i64, i64) -> i64
      %7973 = func.call @cc_values_pack(%7972) : (i64) -> i64
      func.call @stack_push_pointer(%7970) : (i64) -> ()
      %7974 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7975 = func.call @stack_pop_pointer() : () -> i64
      %7976 = llvm.mlir.addressof @str604 : !llvm.ptr
      %7977 = arith.constant 4 : i64
      %7978 = func.call @cc_make_string(%7976, %7977) : (!llvm.ptr, i64) -> i64
      %7979 = llvm.mlir.addressof @str605 : !llvm.ptr
      %7980 = arith.constant 7 : i64
      %7981 = func.call @cc_make_string(%7979, %7980) : (!llvm.ptr, i64) -> i64
      %7982 = func.call @cc_intern(%7978, %7981) : (i64, i64) -> i64
      %7983 = func.call @cc_nil_value() : () -> i64
      %7984 = func.call @cc_cons(%7982, %7983) : (i64, i64) -> i64
      %7985 = func.call @cc_values_pack(%7984) : (i64) -> i64
      func.call @stack_push_pointer(%7982) : (i64) -> ()
      %7986 = func.call @stack_pop_pointer() : () -> i64
      %7987 = llvm.mlir.addressof @str606 : !llvm.ptr
      %7988 = arith.constant 6 : i64
      %7989 = func.call @cc_make_string(%7987, %7988) : (!llvm.ptr, i64) -> i64
      %7990 = func.call @cc_nil_value() : () -> i64
      %7991 = func.call @cc_intern(%7989, %7990) : (i64, i64) -> i64
      %7992 = func.call @cc_nil_value() : () -> i64
      %7993 = func.call @cc_cons(%7991, %7992) : (i64, i64) -> i64
      %7994 = func.call @cc_values_pack(%7993) : (i64) -> i64
      func.call @stack_push_pointer(%7991) : (i64) -> ()
      %7995 = func.call @stack_pop_pointer() : () -> i64
      %7996 = func.call @cc_nil_value() : () -> i64
      %7997 = func.call @cc_errorp(%6702) : (i64) -> i64
      %7998 = arith.cmpi ne, %7997, %7996 : i64
      %7999 = arith.cmpi eq, %7996, %7996 : i64
      %8000 = arith.andi %7998, %7999 : i1
      %8001 = scf.if %8000 -> (i64) {
        scf.yield %6702 : i64
      } else {
        scf.yield %7996 : i64
      }
      %8002 = func.call @cc_errorp(%7589) : (i64) -> i64
      %8003 = arith.cmpi ne, %8002, %7996 : i64
      %8004 = arith.cmpi eq, %8001, %7996 : i64
      %8005 = arith.andi %8003, %8004 : i1
      %8006 = scf.if %8005 -> (i64) {
        scf.yield %7589 : i64
      } else {
        scf.yield %8001 : i64
      }
      %8007 = func.call @cc_errorp(%7959) : (i64) -> i64
      %8008 = arith.cmpi ne, %8007, %7996 : i64
      %8009 = arith.cmpi eq, %8006, %7996 : i64
      %8010 = arith.andi %8008, %8009 : i1
      %8011 = scf.if %8010 -> (i64) {
        scf.yield %7959 : i64
      } else {
        scf.yield %8006 : i64
      }
      %8012 = func.call @cc_errorp(%7963) : (i64) -> i64
      %8013 = arith.cmpi ne, %8012, %7996 : i64
      %8014 = arith.cmpi eq, %8011, %7996 : i64
      %8015 = arith.andi %8013, %8014 : i1
      %8016 = scf.if %8015 -> (i64) {
        scf.yield %7963 : i64
      } else {
        scf.yield %8011 : i64
      }
      %8017 = func.call @cc_errorp(%7974) : (i64) -> i64
      %8018 = arith.cmpi ne, %8017, %7996 : i64
      %8019 = arith.cmpi eq, %8016, %7996 : i64
      %8020 = arith.andi %8018, %8019 : i1
      %8021 = scf.if %8020 -> (i64) {
        scf.yield %7974 : i64
      } else {
        scf.yield %8016 : i64
      }
      %8022 = func.call @cc_errorp(%7975) : (i64) -> i64
      %8023 = arith.cmpi ne, %8022, %7996 : i64
      %8024 = arith.cmpi eq, %8021, %7996 : i64
      %8025 = arith.andi %8023, %8024 : i1
      %8026 = scf.if %8025 -> (i64) {
        scf.yield %7975 : i64
      } else {
        scf.yield %8021 : i64
      }
      %8027 = func.call @cc_errorp(%7986) : (i64) -> i64
      %8028 = arith.cmpi ne, %8027, %7996 : i64
      %8029 = arith.cmpi eq, %8026, %7996 : i64
      %8030 = arith.andi %8028, %8029 : i1
      %8031 = scf.if %8030 -> (i64) {
        scf.yield %7986 : i64
      } else {
        scf.yield %8026 : i64
      }
      %8032 = func.call @cc_errorp(%7995) : (i64) -> i64
      %8033 = arith.cmpi ne, %8032, %7996 : i64
      %8034 = arith.cmpi eq, %8031, %7996 : i64
      %8035 = arith.andi %8033, %8034 : i1
      %8036 = scf.if %8035 -> (i64) {
        scf.yield %7995 : i64
      } else {
        scf.yield %8031 : i64
      }
      %8037 = arith.cmpi ne, %8036, %7996 : i64
      scf.if %8037 {
        func.call @stack_push_pointer(%8036) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6702) : (i64) -> ()
        func.call @stack_push_pointer(%7589) : (i64) -> ()
        func.call @stack_push_pointer(%7959) : (i64) -> ()
        func.call @stack_push_pointer(%7963) : (i64) -> ()
        func.call @stack_push_pointer(%7974) : (i64) -> ()
        func.call @stack_push_pointer(%7975) : (i64) -> ()
        func.call @stack_push_pointer(%7986) : (i64) -> ()
        func.call @stack_push_pointer(%7995) : (i64) -> ()
        %8038 = llvm.mlir.addressof @str607 : !llvm.ptr
        %8039 = func.call @cc_make_function_ref_const(%8038) : (!llvm.ptr) -> i64
        %8040 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8039, %8040) : (i64, i64) -> ()
      }
      %8041 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8041 : i64
    }
    %8042 = func.call @cc_nil_value() : () -> i64
    %8043 = func.call @cc_errorp(%6693) : (i64) -> i64
    %8044 = arith.cmpi ne, %8043, %8042 : i64
    %8045 = scf.if %8044 -> (i64) {
      scf.yield %6693 : i64
    } else {
      %8046 = llvm.mlir.addressof @str608 : !llvm.ptr
      %8047 = arith.constant 12 : i64
      %8048 = func.call @cc_make_string(%8046, %8047) : (!llvm.ptr, i64) -> i64
      %8049 = func.call @cc_nil_value() : () -> i64
      %8050 = func.call @cc_intern(%8048, %8049) : (i64, i64) -> i64
      %8051 = func.call @cc_nil_value() : () -> i64
      %8052 = func.call @cc_cons(%8050, %8051) : (i64, i64) -> i64
      %8053 = func.call @cc_values_pack(%8052) : (i64) -> i64
      func.call @stack_push_pointer(%8050) : (i64) -> ()
      %8054 = func.call @stack_pop_pointer() : () -> i64
      %8055 = llvm.mlir.addressof @str609 : !llvm.ptr
      %8056 = arith.constant 3 : i64
      %8057 = func.call @cc_make_string(%8055, %8056) : (!llvm.ptr, i64) -> i64
      %8058 = func.call @cc_nil_value() : () -> i64
      %8059 = func.call @cc_intern(%8057, %8058) : (i64, i64) -> i64
      %8060 = func.call @cc_nil_value() : () -> i64
      %8061 = func.call @cc_cons(%8059, %8060) : (i64, i64) -> i64
      %8062 = func.call @cc_values_pack(%8061) : (i64) -> i64
      func.call @stack_push_pointer(%8059) : (i64) -> ()
      %8063 = llvm.mlir.addressof @str610 : !llvm.ptr
      %8064 = arith.constant 5 : i64
      %8065 = func.call @cc_make_string(%8063, %8064) : (!llvm.ptr, i64) -> i64
      %8066 = func.call @cc_nil_value() : () -> i64
      %8067 = func.call @cc_intern(%8065, %8066) : (i64, i64) -> i64
      %8068 = func.call @cc_nil_value() : () -> i64
      %8069 = func.call @cc_cons(%8067, %8068) : (i64, i64) -> i64
      %8070 = func.call @cc_values_pack(%8069) : (i64) -> i64
      func.call @stack_push_pointer(%8067) : (i64) -> ()
      %8071 = llvm.mlir.addressof @str611 : !llvm.ptr
      %8072 = arith.constant 6 : i64
      %8073 = func.call @cc_make_string(%8071, %8072) : (!llvm.ptr, i64) -> i64
      %8074 = llvm.mlir.addressof @str612 : !llvm.ptr
      %8075 = arith.constant 11 : i64
      %8076 = func.call @cc_make_string(%8074, %8075) : (!llvm.ptr, i64) -> i64
      %8077 = func.call @cc_intern(%8073, %8076) : (i64, i64) -> i64
      %8078 = func.call @cc_nil_value() : () -> i64
      %8079 = func.call @cc_cons(%8077, %8078) : (i64, i64) -> i64
      %8080 = func.call @cc_values_pack(%8079) : (i64) -> i64
      func.call @stack_push_pointer(%8077) : (i64) -> ()
      %8081 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8081) : (i64) -> ()
      %8082 = llvm.mlir.addressof @str613 : !llvm.ptr
      %8083 = arith.constant 7 : i64
      %8084 = func.call @cc_make_string(%8082, %8083) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8084) : (i64) -> ()
      %8085 = llvm.mlir.addressof @str614 : !llvm.ptr
      %8086 = arith.constant 5 : i64
      %8087 = func.call @cc_make_string(%8085, %8086) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8087) : (i64) -> ()
      %8088 = llvm.mlir.addressof @str615 : !llvm.ptr
      %8089 = arith.constant 6 : i64
      %8090 = func.call @cc_make_string(%8088, %8089) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8090) : (i64) -> ()
      %8091 = llvm.mlir.addressof @str616 : !llvm.ptr
      %8092 = arith.constant 4 : i64
      %8093 = func.call @cc_make_string(%8091, %8092) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8093) : (i64) -> ()
      %8094 = llvm.mlir.addressof @str617 : !llvm.ptr
      %8095 = arith.constant 3 : i64
      %8096 = func.call @cc_make_string(%8094, %8095) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8096) : (i64) -> ()
      %8097 = llvm.mlir.addressof @str618 : !llvm.ptr
      %8098 = arith.constant 9 : i64
      %8099 = func.call @cc_make_string(%8097, %8098) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8099) : (i64) -> ()
      %8100 = llvm.mlir.addressof @str619 : !llvm.ptr
      %8101 = arith.constant 6 : i64
      %8102 = func.call @cc_make_string(%8100, %8101) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8102) : (i64) -> ()
      %8103 = llvm.mlir.addressof @str620 : !llvm.ptr
      %8104 = arith.constant 8 : i64
      %8105 = func.call @cc_make_string(%8103, %8104) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8105) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8106 = func.call @stack_pop_pointer() : () -> i64
      %8107 = func.call @stack_pop_pointer() : () -> i64
      %8108 = func.call @cc_cons(%8107, %8106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8108) : (i64) -> ()
      %8109 = func.call @stack_pop_pointer() : () -> i64
      %8110 = func.call @stack_pop_pointer() : () -> i64
      %8111 = func.call @cc_cons(%8110, %8109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8111) : (i64) -> ()
      %8112 = func.call @stack_pop_pointer() : () -> i64
      %8113 = func.call @stack_pop_pointer() : () -> i64
      %8114 = func.call @cc_cons(%8113, %8112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8114) : (i64) -> ()
      %8115 = func.call @stack_pop_pointer() : () -> i64
      %8116 = func.call @stack_pop_pointer() : () -> i64
      %8117 = func.call @cc_cons(%8116, %8115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8117) : (i64) -> ()
      %8118 = func.call @stack_pop_pointer() : () -> i64
      %8119 = func.call @stack_pop_pointer() : () -> i64
      %8120 = func.call @cc_cons(%8119, %8118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8120) : (i64) -> ()
      %8121 = func.call @stack_pop_pointer() : () -> i64
      %8122 = func.call @stack_pop_pointer() : () -> i64
      %8123 = func.call @cc_cons(%8122, %8121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8123) : (i64) -> ()
      %8124 = func.call @stack_pop_pointer() : () -> i64
      %8125 = func.call @stack_pop_pointer() : () -> i64
      %8126 = func.call @cc_cons(%8125, %8124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8126) : (i64) -> ()
      %8127 = func.call @stack_pop_pointer() : () -> i64
      %8128 = func.call @stack_pop_pointer() : () -> i64
      %8129 = func.call @cc_cons(%8128, %8127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8129) : (i64) -> ()
      %8130 = func.call @stack_pop_pointer() : () -> i64
      %8131 = func.call @stack_pop_pointer() : () -> i64
      %8132 = func.call @cc_cons(%8130, %8131) : (i64, i64) -> i64
      %8133 = llvm.mlir.addressof @str621 : !llvm.ptr
      %8134 = arith.constant 5 : i64
      %8135 = func.call @cc_make_string(%8133, %8134) : (!llvm.ptr, i64) -> i64
      %8136 = func.call @cc_nil_value() : () -> i64
      %8137 = func.call @cc_intern(%8135, %8136) : (i64, i64) -> i64
      %8138 = func.call @cc_nil_value() : () -> i64
      %8139 = func.call @cc_cons(%8137, %8138) : (i64, i64) -> i64
      %8140 = func.call @cc_values_pack(%8139) : (i64) -> i64
      %8141 = func.call @cc_cons(%8137, %8132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8141) : (i64) -> ()
      %8142 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8142) : (i64) -> ()
      %8143 = llvm.mlir.addressof @str622 : !llvm.ptr
      %8144 = arith.constant 4 : i64
      %8145 = func.call @cc_make_string(%8143, %8144) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8145) : (i64) -> ()
      %8146 = llvm.mlir.addressof @str623 : !llvm.ptr
      %8147 = arith.constant 3 : i64
      %8148 = func.call @cc_make_string(%8146, %8147) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8148) : (i64) -> ()
      %8149 = llvm.mlir.addressof @str624 : !llvm.ptr
      %8150 = arith.constant 4 : i64
      %8151 = func.call @cc_make_string(%8149, %8150) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8151) : (i64) -> ()
      %8152 = llvm.mlir.addressof @str625 : !llvm.ptr
      %8153 = arith.constant 16 : i64
      %8154 = func.call @cc_make_string(%8152, %8153) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8154) : (i64) -> ()
      %8155 = llvm.mlir.addressof @str626 : !llvm.ptr
      %8156 = arith.constant 14 : i64
      %8157 = func.call @cc_make_string(%8155, %8156) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8157) : (i64) -> ()
      %8158 = llvm.mlir.addressof @str627 : !llvm.ptr
      %8159 = arith.constant 9 : i64
      %8160 = func.call @cc_make_string(%8158, %8159) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8160) : (i64) -> ()
      %8161 = llvm.mlir.addressof @str628 : !llvm.ptr
      %8162 = arith.constant 5 : i64
      %8163 = func.call @cc_make_string(%8161, %8162) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8163) : (i64) -> ()
      %8164 = llvm.mlir.addressof @str629 : !llvm.ptr
      %8165 = arith.constant 10 : i64
      %8166 = func.call @cc_make_string(%8164, %8165) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8166) : (i64) -> ()
      %8167 = llvm.mlir.addressof @str630 : !llvm.ptr
      %8168 = arith.constant 5 : i64
      %8169 = func.call @cc_make_string(%8167, %8168) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8169) : (i64) -> ()
      %8170 = llvm.mlir.addressof @str631 : !llvm.ptr
      %8171 = arith.constant 13 : i64
      %8172 = func.call @cc_make_string(%8170, %8171) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8172) : (i64) -> ()
      %8173 = llvm.mlir.addressof @str632 : !llvm.ptr
      %8174 = arith.constant 22 : i64
      %8175 = func.call @cc_make_string(%8173, %8174) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8175) : (i64) -> ()
      %8176 = llvm.mlir.addressof @str633 : !llvm.ptr
      %8177 = arith.constant 20 : i64
      %8178 = func.call @cc_make_string(%8176, %8177) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8178) : (i64) -> ()
      %8179 = llvm.mlir.addressof @str634 : !llvm.ptr
      %8180 = arith.constant 18 : i64
      %8181 = func.call @cc_make_string(%8179, %8180) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8181) : (i64) -> ()
      %8182 = llvm.mlir.addressof @str635 : !llvm.ptr
      %8183 = arith.constant 5 : i64
      %8184 = func.call @cc_make_string(%8182, %8183) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8184) : (i64) -> ()
      %8185 = llvm.mlir.addressof @str636 : !llvm.ptr
      %8186 = arith.constant 3 : i64
      %8187 = func.call @cc_make_string(%8185, %8186) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8187) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8188 = func.call @stack_pop_pointer() : () -> i64
      %8189 = func.call @stack_pop_pointer() : () -> i64
      %8190 = func.call @cc_cons(%8189, %8188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8190) : (i64) -> ()
      %8191 = func.call @stack_pop_pointer() : () -> i64
      %8192 = func.call @stack_pop_pointer() : () -> i64
      %8193 = func.call @cc_cons(%8192, %8191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8193) : (i64) -> ()
      %8194 = func.call @stack_pop_pointer() : () -> i64
      %8195 = func.call @stack_pop_pointer() : () -> i64
      %8196 = func.call @cc_cons(%8195, %8194) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8196) : (i64) -> ()
      %8197 = func.call @stack_pop_pointer() : () -> i64
      %8198 = func.call @stack_pop_pointer() : () -> i64
      %8199 = func.call @cc_cons(%8198, %8197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8199) : (i64) -> ()
      %8200 = func.call @stack_pop_pointer() : () -> i64
      %8201 = func.call @stack_pop_pointer() : () -> i64
      %8202 = func.call @cc_cons(%8201, %8200) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8202) : (i64) -> ()
      %8203 = func.call @stack_pop_pointer() : () -> i64
      %8204 = func.call @stack_pop_pointer() : () -> i64
      %8205 = func.call @cc_cons(%8204, %8203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8205) : (i64) -> ()
      %8206 = func.call @stack_pop_pointer() : () -> i64
      %8207 = func.call @stack_pop_pointer() : () -> i64
      %8208 = func.call @cc_cons(%8207, %8206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8208) : (i64) -> ()
      %8209 = func.call @stack_pop_pointer() : () -> i64
      %8210 = func.call @stack_pop_pointer() : () -> i64
      %8211 = func.call @cc_cons(%8210, %8209) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8211) : (i64) -> ()
      %8212 = func.call @stack_pop_pointer() : () -> i64
      %8213 = func.call @stack_pop_pointer() : () -> i64
      %8214 = func.call @cc_cons(%8213, %8212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8214) : (i64) -> ()
      %8215 = func.call @stack_pop_pointer() : () -> i64
      %8216 = func.call @stack_pop_pointer() : () -> i64
      %8217 = func.call @cc_cons(%8216, %8215) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8217) : (i64) -> ()
      %8218 = func.call @stack_pop_pointer() : () -> i64
      %8219 = func.call @stack_pop_pointer() : () -> i64
      %8220 = func.call @cc_cons(%8219, %8218) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8220) : (i64) -> ()
      %8221 = func.call @stack_pop_pointer() : () -> i64
      %8222 = func.call @stack_pop_pointer() : () -> i64
      %8223 = func.call @cc_cons(%8222, %8221) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8223) : (i64) -> ()
      %8224 = func.call @stack_pop_pointer() : () -> i64
      %8225 = func.call @stack_pop_pointer() : () -> i64
      %8226 = func.call @cc_cons(%8225, %8224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8226) : (i64) -> ()
      %8227 = func.call @stack_pop_pointer() : () -> i64
      %8228 = func.call @stack_pop_pointer() : () -> i64
      %8229 = func.call @cc_cons(%8228, %8227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8229) : (i64) -> ()
      %8230 = func.call @stack_pop_pointer() : () -> i64
      %8231 = func.call @stack_pop_pointer() : () -> i64
      %8232 = func.call @cc_cons(%8231, %8230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8232) : (i64) -> ()
      %8233 = func.call @stack_pop_pointer() : () -> i64
      %8234 = func.call @stack_pop_pointer() : () -> i64
      %8235 = func.call @cc_cons(%8233, %8234) : (i64, i64) -> i64
      %8236 = llvm.mlir.addressof @str637 : !llvm.ptr
      %8237 = arith.constant 5 : i64
      %8238 = func.call @cc_make_string(%8236, %8237) : (!llvm.ptr, i64) -> i64
      %8239 = func.call @cc_nil_value() : () -> i64
      %8240 = func.call @cc_intern(%8238, %8239) : (i64, i64) -> i64
      %8241 = func.call @cc_nil_value() : () -> i64
      %8242 = func.call @cc_cons(%8240, %8241) : (i64, i64) -> i64
      %8243 = func.call @cc_values_pack(%8242) : (i64) -> i64
      %8244 = func.call @cc_cons(%8240, %8235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8244) : (i64) -> ()
      %8245 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8245) : (i64) -> ()
      %8246 = llvm.mlir.addressof @str638 : !llvm.ptr
      %8247 = arith.constant 3 : i64
      %8248 = func.call @cc_make_string(%8246, %8247) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8248) : (i64) -> ()
      %8249 = llvm.mlir.addressof @str639 : !llvm.ptr
      %8250 = arith.constant 3 : i64
      %8251 = func.call @cc_make_string(%8249, %8250) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8251) : (i64) -> ()
      %8252 = llvm.mlir.addressof @str640 : !llvm.ptr
      %8253 = arith.constant 3 : i64
      %8254 = func.call @cc_make_string(%8252, %8253) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8254) : (i64) -> ()
      %8255 = llvm.mlir.addressof @str641 : !llvm.ptr
      %8256 = arith.constant 3 : i64
      %8257 = func.call @cc_make_string(%8255, %8256) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8257) : (i64) -> ()
      %8258 = llvm.mlir.addressof @str642 : !llvm.ptr
      %8259 = arith.constant 3 : i64
      %8260 = func.call @cc_make_string(%8258, %8259) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8260) : (i64) -> ()
      %8261 = llvm.mlir.addressof @str643 : !llvm.ptr
      %8262 = arith.constant 3 : i64
      %8263 = func.call @cc_make_string(%8261, %8262) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8263) : (i64) -> ()
      %8264 = llvm.mlir.addressof @str644 : !llvm.ptr
      %8265 = arith.constant 3 : i64
      %8266 = func.call @cc_make_string(%8264, %8265) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8266) : (i64) -> ()
      %8267 = llvm.mlir.addressof @str645 : !llvm.ptr
      %8268 = arith.constant 3 : i64
      %8269 = func.call @cc_make_string(%8267, %8268) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8269) : (i64) -> ()
      %8270 = llvm.mlir.addressof @str646 : !llvm.ptr
      %8271 = arith.constant 3 : i64
      %8272 = func.call @cc_make_string(%8270, %8271) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8272) : (i64) -> ()
      %8273 = llvm.mlir.addressof @str647 : !llvm.ptr
      %8274 = arith.constant 3 : i64
      %8275 = func.call @cc_make_string(%8273, %8274) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8275) : (i64) -> ()
      %8276 = llvm.mlir.addressof @str648 : !llvm.ptr
      %8277 = arith.constant 3 : i64
      %8278 = func.call @cc_make_string(%8276, %8277) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8278) : (i64) -> ()
      %8279 = llvm.mlir.addressof @str649 : !llvm.ptr
      %8280 = arith.constant 3 : i64
      %8281 = func.call @cc_make_string(%8279, %8280) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8281) : (i64) -> ()
      %8282 = llvm.mlir.addressof @str650 : !llvm.ptr
      %8283 = arith.constant 3 : i64
      %8284 = func.call @cc_make_string(%8282, %8283) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8284) : (i64) -> ()
      %8285 = llvm.mlir.addressof @str651 : !llvm.ptr
      %8286 = arith.constant 3 : i64
      %8287 = func.call @cc_make_string(%8285, %8286) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8287) : (i64) -> ()
      %8288 = llvm.mlir.addressof @str652 : !llvm.ptr
      %8289 = arith.constant 3 : i64
      %8290 = func.call @cc_make_string(%8288, %8289) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8290) : (i64) -> ()
      %8291 = llvm.mlir.addressof @str653 : !llvm.ptr
      %8292 = arith.constant 3 : i64
      %8293 = func.call @cc_make_string(%8291, %8292) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8293) : (i64) -> ()
      %8294 = llvm.mlir.addressof @str654 : !llvm.ptr
      %8295 = arith.constant 3 : i64
      %8296 = func.call @cc_make_string(%8294, %8295) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8296) : (i64) -> ()
      %8297 = llvm.mlir.addressof @str655 : !llvm.ptr
      %8298 = arith.constant 3 : i64
      %8299 = func.call @cc_make_string(%8297, %8298) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8299) : (i64) -> ()
      %8300 = llvm.mlir.addressof @str656 : !llvm.ptr
      %8301 = arith.constant 3 : i64
      %8302 = func.call @cc_make_string(%8300, %8301) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8302) : (i64) -> ()
      %8303 = llvm.mlir.addressof @str657 : !llvm.ptr
      %8304 = arith.constant 3 : i64
      %8305 = func.call @cc_make_string(%8303, %8304) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8305) : (i64) -> ()
      %8306 = llvm.mlir.addressof @str658 : !llvm.ptr
      %8307 = arith.constant 3 : i64
      %8308 = func.call @cc_make_string(%8306, %8307) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8308) : (i64) -> ()
      %8309 = llvm.mlir.addressof @str659 : !llvm.ptr
      %8310 = arith.constant 3 : i64
      %8311 = func.call @cc_make_string(%8309, %8310) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8311) : (i64) -> ()
      %8312 = llvm.mlir.addressof @str660 : !llvm.ptr
      %8313 = arith.constant 3 : i64
      %8314 = func.call @cc_make_string(%8312, %8313) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8314) : (i64) -> ()
      %8315 = llvm.mlir.addressof @str661 : !llvm.ptr
      %8316 = arith.constant 3 : i64
      %8317 = func.call @cc_make_string(%8315, %8316) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8317) : (i64) -> ()
      %8318 = llvm.mlir.addressof @str662 : !llvm.ptr
      %8319 = arith.constant 3 : i64
      %8320 = func.call @cc_make_string(%8318, %8319) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8320) : (i64) -> ()
      %8321 = llvm.mlir.addressof @str663 : !llvm.ptr
      %8322 = arith.constant 3 : i64
      %8323 = func.call @cc_make_string(%8321, %8322) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8323) : (i64) -> ()
      %8324 = llvm.mlir.addressof @str664 : !llvm.ptr
      %8325 = arith.constant 3 : i64
      %8326 = func.call @cc_make_string(%8324, %8325) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8326) : (i64) -> ()
      %8327 = llvm.mlir.addressof @str665 : !llvm.ptr
      %8328 = arith.constant 3 : i64
      %8329 = func.call @cc_make_string(%8327, %8328) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8329) : (i64) -> ()
      %8330 = llvm.mlir.addressof @str666 : !llvm.ptr
      %8331 = arith.constant 3 : i64
      %8332 = func.call @cc_make_string(%8330, %8331) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8332) : (i64) -> ()
      %8333 = llvm.mlir.addressof @str667 : !llvm.ptr
      %8334 = arith.constant 3 : i64
      %8335 = func.call @cc_make_string(%8333, %8334) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8335) : (i64) -> ()
      %8336 = llvm.mlir.addressof @str668 : !llvm.ptr
      %8337 = arith.constant 3 : i64
      %8338 = func.call @cc_make_string(%8336, %8337) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8338) : (i64) -> ()
      %8339 = llvm.mlir.addressof @str669 : !llvm.ptr
      %8340 = arith.constant 3 : i64
      %8341 = func.call @cc_make_string(%8339, %8340) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8341) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8342 = func.call @stack_pop_pointer() : () -> i64
      %8343 = func.call @stack_pop_pointer() : () -> i64
      %8344 = func.call @cc_cons(%8343, %8342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8344) : (i64) -> ()
      %8345 = func.call @stack_pop_pointer() : () -> i64
      %8346 = func.call @stack_pop_pointer() : () -> i64
      %8347 = func.call @cc_cons(%8346, %8345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8347) : (i64) -> ()
      %8348 = func.call @stack_pop_pointer() : () -> i64
      %8349 = func.call @stack_pop_pointer() : () -> i64
      %8350 = func.call @cc_cons(%8349, %8348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8350) : (i64) -> ()
      %8351 = func.call @stack_pop_pointer() : () -> i64
      %8352 = func.call @stack_pop_pointer() : () -> i64
      %8353 = func.call @cc_cons(%8352, %8351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8353) : (i64) -> ()
      %8354 = func.call @stack_pop_pointer() : () -> i64
      %8355 = func.call @stack_pop_pointer() : () -> i64
      %8356 = func.call @cc_cons(%8355, %8354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8356) : (i64) -> ()
      %8357 = func.call @stack_pop_pointer() : () -> i64
      %8358 = func.call @stack_pop_pointer() : () -> i64
      %8359 = func.call @cc_cons(%8358, %8357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8359) : (i64) -> ()
      %8360 = func.call @stack_pop_pointer() : () -> i64
      %8361 = func.call @stack_pop_pointer() : () -> i64
      %8362 = func.call @cc_cons(%8361, %8360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8362) : (i64) -> ()
      %8363 = func.call @stack_pop_pointer() : () -> i64
      %8364 = func.call @stack_pop_pointer() : () -> i64
      %8365 = func.call @cc_cons(%8364, %8363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8365) : (i64) -> ()
      %8366 = func.call @stack_pop_pointer() : () -> i64
      %8367 = func.call @stack_pop_pointer() : () -> i64
      %8368 = func.call @cc_cons(%8367, %8366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8368) : (i64) -> ()
      %8369 = func.call @stack_pop_pointer() : () -> i64
      %8370 = func.call @stack_pop_pointer() : () -> i64
      %8371 = func.call @cc_cons(%8370, %8369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8371) : (i64) -> ()
      %8372 = func.call @stack_pop_pointer() : () -> i64
      %8373 = func.call @stack_pop_pointer() : () -> i64
      %8374 = func.call @cc_cons(%8373, %8372) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8374) : (i64) -> ()
      %8375 = func.call @stack_pop_pointer() : () -> i64
      %8376 = func.call @stack_pop_pointer() : () -> i64
      %8377 = func.call @cc_cons(%8376, %8375) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8377) : (i64) -> ()
      %8378 = func.call @stack_pop_pointer() : () -> i64
      %8379 = func.call @stack_pop_pointer() : () -> i64
      %8380 = func.call @cc_cons(%8379, %8378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8380) : (i64) -> ()
      %8381 = func.call @stack_pop_pointer() : () -> i64
      %8382 = func.call @stack_pop_pointer() : () -> i64
      %8383 = func.call @cc_cons(%8382, %8381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8383) : (i64) -> ()
      %8384 = func.call @stack_pop_pointer() : () -> i64
      %8385 = func.call @stack_pop_pointer() : () -> i64
      %8386 = func.call @cc_cons(%8385, %8384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8386) : (i64) -> ()
      %8387 = func.call @stack_pop_pointer() : () -> i64
      %8388 = func.call @stack_pop_pointer() : () -> i64
      %8389 = func.call @cc_cons(%8388, %8387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8389) : (i64) -> ()
      %8390 = func.call @stack_pop_pointer() : () -> i64
      %8391 = func.call @stack_pop_pointer() : () -> i64
      %8392 = func.call @cc_cons(%8391, %8390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8392) : (i64) -> ()
      %8393 = func.call @stack_pop_pointer() : () -> i64
      %8394 = func.call @stack_pop_pointer() : () -> i64
      %8395 = func.call @cc_cons(%8394, %8393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8395) : (i64) -> ()
      %8396 = func.call @stack_pop_pointer() : () -> i64
      %8397 = func.call @stack_pop_pointer() : () -> i64
      %8398 = func.call @cc_cons(%8397, %8396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8398) : (i64) -> ()
      %8399 = func.call @stack_pop_pointer() : () -> i64
      %8400 = func.call @stack_pop_pointer() : () -> i64
      %8401 = func.call @cc_cons(%8400, %8399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8401) : (i64) -> ()
      %8402 = func.call @stack_pop_pointer() : () -> i64
      %8403 = func.call @stack_pop_pointer() : () -> i64
      %8404 = func.call @cc_cons(%8403, %8402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8404) : (i64) -> ()
      %8405 = func.call @stack_pop_pointer() : () -> i64
      %8406 = func.call @stack_pop_pointer() : () -> i64
      %8407 = func.call @cc_cons(%8406, %8405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8407) : (i64) -> ()
      %8408 = func.call @stack_pop_pointer() : () -> i64
      %8409 = func.call @stack_pop_pointer() : () -> i64
      %8410 = func.call @cc_cons(%8409, %8408) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8410) : (i64) -> ()
      %8411 = func.call @stack_pop_pointer() : () -> i64
      %8412 = func.call @stack_pop_pointer() : () -> i64
      %8413 = func.call @cc_cons(%8412, %8411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8413) : (i64) -> ()
      %8414 = func.call @stack_pop_pointer() : () -> i64
      %8415 = func.call @stack_pop_pointer() : () -> i64
      %8416 = func.call @cc_cons(%8415, %8414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8416) : (i64) -> ()
      %8417 = func.call @stack_pop_pointer() : () -> i64
      %8418 = func.call @stack_pop_pointer() : () -> i64
      %8419 = func.call @cc_cons(%8418, %8417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8419) : (i64) -> ()
      %8420 = func.call @stack_pop_pointer() : () -> i64
      %8421 = func.call @stack_pop_pointer() : () -> i64
      %8422 = func.call @cc_cons(%8421, %8420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8422) : (i64) -> ()
      %8423 = func.call @stack_pop_pointer() : () -> i64
      %8424 = func.call @stack_pop_pointer() : () -> i64
      %8425 = func.call @cc_cons(%8424, %8423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8425) : (i64) -> ()
      %8426 = func.call @stack_pop_pointer() : () -> i64
      %8427 = func.call @stack_pop_pointer() : () -> i64
      %8428 = func.call @cc_cons(%8427, %8426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8428) : (i64) -> ()
      %8429 = func.call @stack_pop_pointer() : () -> i64
      %8430 = func.call @stack_pop_pointer() : () -> i64
      %8431 = func.call @cc_cons(%8430, %8429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8431) : (i64) -> ()
      %8432 = func.call @stack_pop_pointer() : () -> i64
      %8433 = func.call @stack_pop_pointer() : () -> i64
      %8434 = func.call @cc_cons(%8433, %8432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8434) : (i64) -> ()
      %8435 = func.call @stack_pop_pointer() : () -> i64
      %8436 = func.call @stack_pop_pointer() : () -> i64
      %8437 = func.call @cc_cons(%8436, %8435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8437) : (i64) -> ()
      %8438 = func.call @stack_pop_pointer() : () -> i64
      %8439 = func.call @stack_pop_pointer() : () -> i64
      %8440 = func.call @cc_cons(%8438, %8439) : (i64, i64) -> i64
      %8441 = llvm.mlir.addressof @str670 : !llvm.ptr
      %8442 = arith.constant 5 : i64
      %8443 = func.call @cc_make_string(%8441, %8442) : (!llvm.ptr, i64) -> i64
      %8444 = func.call @cc_nil_value() : () -> i64
      %8445 = func.call @cc_intern(%8443, %8444) : (i64, i64) -> i64
      %8446 = func.call @cc_nil_value() : () -> i64
      %8447 = func.call @cc_cons(%8445, %8446) : (i64, i64) -> i64
      %8448 = func.call @cc_values_pack(%8447) : (i64) -> i64
      %8449 = func.call @cc_cons(%8445, %8440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8449) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8450 = func.call @stack_pop_pointer() : () -> i64
      %8451 = func.call @stack_pop_pointer() : () -> i64
      %8452 = func.call @cc_cons(%8451, %8450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8452) : (i64) -> ()
      %8453 = func.call @stack_pop_pointer() : () -> i64
      %8454 = func.call @stack_pop_pointer() : () -> i64
      %8455 = func.call @cc_cons(%8454, %8453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8455) : (i64) -> ()
      %8456 = func.call @stack_pop_pointer() : () -> i64
      %8457 = func.call @stack_pop_pointer() : () -> i64
      %8458 = func.call @cc_cons(%8457, %8456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8458) : (i64) -> ()
      %8459 = func.call @stack_pop_pointer() : () -> i64
      %8460 = func.call @stack_pop_pointer() : () -> i64
      %8461 = func.call @cc_cons(%8460, %8459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8461) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8462 = func.call @stack_pop_pointer() : () -> i64
      %8463 = func.call @stack_pop_pointer() : () -> i64
      %8464 = func.call @cc_cons(%8463, %8462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8464) : (i64) -> ()
      %8465 = func.call @stack_pop_pointer() : () -> i64
      %8466 = func.call @stack_pop_pointer() : () -> i64
      %8467 = func.call @cc_cons(%8466, %8465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8467) : (i64) -> ()
      %8468 = llvm.mlir.addressof @str671 : !llvm.ptr
      %8469 = arith.constant 6 : i64
      %8470 = func.call @cc_make_string(%8468, %8469) : (!llvm.ptr, i64) -> i64
      %8471 = func.call @cc_nil_value() : () -> i64
      %8472 = func.call @cc_intern(%8470, %8471) : (i64, i64) -> i64
      %8473 = func.call @cc_nil_value() : () -> i64
      %8474 = func.call @cc_cons(%8472, %8473) : (i64, i64) -> i64
      %8475 = func.call @cc_values_pack(%8474) : (i64) -> i64
      func.call @stack_push_pointer(%8472) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8476 = func.call @stack_pop_pointer() : () -> i64
      %8477 = func.call @stack_pop_pointer() : () -> i64
      %8478 = func.call @cc_cons(%8477, %8476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8478) : (i64) -> ()
      %8479 = func.call @stack_pop_pointer() : () -> i64
      %8480 = func.call @stack_pop_pointer() : () -> i64
      %8481 = func.call @cc_cons(%8480, %8479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8482 = func.call @stack_pop_pointer() : () -> i64
      %8483 = func.call @stack_pop_pointer() : () -> i64
      %8484 = func.call @cc_cons(%8483, %8482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8484) : (i64) -> ()
      %8485 = func.call @stack_pop_pointer() : () -> i64
      %8486 = func.call @stack_pop_pointer() : () -> i64
      %8487 = func.call @cc_cons(%8486, %8485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8487) : (i64) -> ()
      %8488 = llvm.mlir.addressof @str672 : !llvm.ptr
      %8489 = arith.constant 6 : i64
      %8490 = func.call @cc_make_string(%8488, %8489) : (!llvm.ptr, i64) -> i64
      %8491 = func.call @cc_nil_value() : () -> i64
      %8492 = func.call @cc_intern(%8490, %8491) : (i64, i64) -> i64
      %8493 = func.call @cc_nil_value() : () -> i64
      %8494 = func.call @cc_cons(%8492, %8493) : (i64, i64) -> i64
      %8495 = func.call @cc_values_pack(%8494) : (i64) -> i64
      func.call @stack_push_pointer(%8492) : (i64) -> ()
      %8496 = llvm.mlir.addressof @str673 : !llvm.ptr
      %8497 = arith.constant 4 : i64
      %8498 = func.call @cc_make_string(%8496, %8497) : (!llvm.ptr, i64) -> i64
      %8499 = func.call @cc_nil_value() : () -> i64
      %8500 = func.call @cc_intern(%8498, %8499) : (i64, i64) -> i64
      %8501 = func.call @cc_nil_value() : () -> i64
      %8502 = func.call @cc_cons(%8500, %8501) : (i64, i64) -> i64
      %8503 = func.call @cc_values_pack(%8502) : (i64) -> i64
      func.call @stack_push_pointer(%8500) : (i64) -> ()
      %8504 = llvm.mlir.addressof @str674 : !llvm.ptr
      %8505 = arith.constant 5 : i64
      %8506 = func.call @cc_make_string(%8504, %8505) : (!llvm.ptr, i64) -> i64
      %8507 = func.call @cc_nil_value() : () -> i64
      %8508 = func.call @cc_intern(%8506, %8507) : (i64, i64) -> i64
      %8509 = func.call @cc_nil_value() : () -> i64
      %8510 = func.call @cc_cons(%8508, %8509) : (i64, i64) -> i64
      %8511 = func.call @cc_values_pack(%8510) : (i64) -> i64
      func.call @stack_push_pointer(%8508) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8512 = func.call @stack_pop_pointer() : () -> i64
      %8513 = func.call @stack_pop_pointer() : () -> i64
      %8514 = func.call @cc_cons(%8513, %8512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8514) : (i64) -> ()
      %8515 = func.call @stack_pop_pointer() : () -> i64
      %8516 = func.call @stack_pop_pointer() : () -> i64
      %8517 = func.call @cc_cons(%8516, %8515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8517) : (i64) -> ()
      %8518 = llvm.mlir.addressof @str675 : !llvm.ptr
      %8519 = arith.constant 2 : i64
      %8520 = func.call @cc_make_string(%8518, %8519) : (!llvm.ptr, i64) -> i64
      %8521 = func.call @cc_nil_value() : () -> i64
      %8522 = func.call @cc_intern(%8520, %8521) : (i64, i64) -> i64
      %8523 = func.call @cc_nil_value() : () -> i64
      %8524 = func.call @cc_cons(%8522, %8523) : (i64, i64) -> i64
      %8525 = func.call @cc_values_pack(%8524) : (i64) -> i64
      func.call @stack_push_pointer(%8522) : (i64) -> ()
      %8526 = llvm.mlir.addressof @str676 : !llvm.ptr
      %8527 = arith.constant 3 : i64
      %8528 = func.call @cc_make_string(%8526, %8527) : (!llvm.ptr, i64) -> i64
      %8529 = func.call @cc_nil_value() : () -> i64
      %8530 = func.call @cc_intern(%8528, %8529) : (i64, i64) -> i64
      %8531 = func.call @cc_nil_value() : () -> i64
      %8532 = func.call @cc_cons(%8530, %8531) : (i64, i64) -> i64
      %8533 = func.call @cc_values_pack(%8532) : (i64) -> i64
      func.call @stack_push_pointer(%8530) : (i64) -> ()
      %8534 = llvm.mlir.addressof @str677 : !llvm.ptr
      %8535 = arith.constant 9 : i64
      %8536 = func.call @cc_make_string(%8534, %8535) : (!llvm.ptr, i64) -> i64
      %8537 = llvm.mlir.addressof @str678 : !llvm.ptr
      %8538 = arith.constant 11 : i64
      %8539 = func.call @cc_make_string(%8537, %8538) : (!llvm.ptr, i64) -> i64
      %8540 = func.call @cc_intern(%8536, %8539) : (i64, i64) -> i64
      %8541 = func.call @cc_nil_value() : () -> i64
      %8542 = func.call @cc_cons(%8540, %8541) : (i64, i64) -> i64
      %8543 = func.call @cc_values_pack(%8542) : (i64) -> i64
      func.call @stack_push_pointer(%8540) : (i64) -> ()
      %8544 = llvm.mlir.addressof @str679 : !llvm.ptr
      %8545 = arith.constant 4 : i64
      %8546 = func.call @cc_make_string(%8544, %8545) : (!llvm.ptr, i64) -> i64
      %8547 = func.call @cc_nil_value() : () -> i64
      %8548 = func.call @cc_intern(%8546, %8547) : (i64, i64) -> i64
      %8549 = func.call @cc_nil_value() : () -> i64
      %8550 = func.call @cc_cons(%8548, %8549) : (i64, i64) -> i64
      %8551 = func.call @cc_values_pack(%8550) : (i64) -> i64
      func.call @stack_push_pointer(%8548) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8552 = func.call @stack_pop_pointer() : () -> i64
      %8553 = func.call @stack_pop_pointer() : () -> i64
      %8554 = func.call @cc_cons(%8553, %8552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8554) : (i64) -> ()
      %8555 = func.call @stack_pop_pointer() : () -> i64
      %8556 = func.call @stack_pop_pointer() : () -> i64
      %8557 = func.call @cc_cons(%8556, %8555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8557) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8558 = func.call @stack_pop_pointer() : () -> i64
      %8559 = func.call @stack_pop_pointer() : () -> i64
      %8560 = func.call @cc_cons(%8559, %8558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8560) : (i64) -> ()
      %8561 = func.call @stack_pop_pointer() : () -> i64
      %8562 = func.call @stack_pop_pointer() : () -> i64
      %8563 = func.call @cc_cons(%8562, %8561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8563) : (i64) -> ()
      %8564 = llvm.mlir.addressof @str680 : !llvm.ptr
      %8565 = arith.constant 5 : i64
      %8566 = func.call @cc_make_string(%8564, %8565) : (!llvm.ptr, i64) -> i64
      %8567 = func.call @cc_nil_value() : () -> i64
      %8568 = func.call @cc_intern(%8566, %8567) : (i64, i64) -> i64
      %8569 = func.call @cc_nil_value() : () -> i64
      %8570 = func.call @cc_cons(%8568, %8569) : (i64, i64) -> i64
      %8571 = func.call @cc_values_pack(%8570) : (i64) -> i64
      func.call @stack_push_pointer(%8568) : (i64) -> ()
      %8572 = llvm.mlir.addressof @str681 : !llvm.ptr
      %8573 = arith.constant 4 : i64
      %8574 = func.call @cc_make_string(%8572, %8573) : (!llvm.ptr, i64) -> i64
      %8575 = llvm.mlir.addressof @str682 : !llvm.ptr
      %8576 = arith.constant 11 : i64
      %8577 = func.call @cc_make_string(%8575, %8576) : (!llvm.ptr, i64) -> i64
      %8578 = func.call @cc_intern(%8574, %8577) : (i64, i64) -> i64
      %8579 = func.call @cc_nil_value() : () -> i64
      %8580 = func.call @cc_cons(%8578, %8579) : (i64, i64) -> i64
      %8581 = func.call @cc_values_pack(%8580) : (i64) -> i64
      func.call @stack_push_pointer(%8578) : (i64) -> ()
      %8582 = llvm.mlir.addressof @str683 : !llvm.ptr
      %8583 = arith.constant 4 : i64
      %8584 = func.call @cc_make_string(%8582, %8583) : (!llvm.ptr, i64) -> i64
      %8585 = func.call @cc_nil_value() : () -> i64
      %8586 = func.call @cc_intern(%8584, %8585) : (i64, i64) -> i64
      %8587 = func.call @cc_nil_value() : () -> i64
      %8588 = func.call @cc_cons(%8586, %8587) : (i64, i64) -> i64
      %8589 = func.call @cc_values_pack(%8588) : (i64) -> i64
      func.call @stack_push_pointer(%8586) : (i64) -> ()
      %8590 = llvm.mlir.addressof @str684 : !llvm.ptr
      %8591 = arith.constant 6 : i64
      %8592 = func.call @cc_make_string(%8590, %8591) : (!llvm.ptr, i64) -> i64
      %8593 = func.call @cc_nil_value() : () -> i64
      %8594 = func.call @cc_intern(%8592, %8593) : (i64, i64) -> i64
      %8595 = func.call @cc_nil_value() : () -> i64
      %8596 = func.call @cc_cons(%8594, %8595) : (i64, i64) -> i64
      %8597 = func.call @cc_values_pack(%8596) : (i64) -> i64
      func.call @stack_push_pointer(%8594) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8598 = func.call @stack_pop_pointer() : () -> i64
      %8599 = func.call @stack_pop_pointer() : () -> i64
      %8600 = func.call @cc_cons(%8599, %8598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8600) : (i64) -> ()
      %8601 = func.call @stack_pop_pointer() : () -> i64
      %8602 = func.call @stack_pop_pointer() : () -> i64
      %8603 = func.call @cc_cons(%8602, %8601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8603) : (i64) -> ()
      %8604 = func.call @stack_pop_pointer() : () -> i64
      %8605 = func.call @stack_pop_pointer() : () -> i64
      %8606 = func.call @cc_cons(%8605, %8604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8606) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8607 = func.call @stack_pop_pointer() : () -> i64
      %8608 = func.call @stack_pop_pointer() : () -> i64
      %8609 = func.call @cc_cons(%8608, %8607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8609) : (i64) -> ()
      %8610 = func.call @stack_pop_pointer() : () -> i64
      %8611 = func.call @stack_pop_pointer() : () -> i64
      %8612 = func.call @cc_cons(%8611, %8610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8612) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %8613 = func.call @stack_pop_pointer() : () -> i64
      %8614 = func.call @stack_pop_pointer() : () -> i64
      %8615 = func.call @cc_cons(%8614, %8613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8615) : (i64) -> ()
      %8616 = func.call @stack_pop_pointer() : () -> i64
      %8617 = func.call @stack_pop_pointer() : () -> i64
      %8618 = func.call @cc_cons(%8617, %8616) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8618) : (i64) -> ()
      %8619 = func.call @stack_pop_pointer() : () -> i64
      %8620 = func.call @stack_pop_pointer() : () -> i64
      %8621 = func.call @cc_cons(%8620, %8619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8621) : (i64) -> ()
      %8622 = func.call @stack_pop_pointer() : () -> i64
      %8623 = func.call @stack_pop_pointer() : () -> i64
      %8624 = func.call @cc_cons(%8623, %8622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8624) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8625 = func.call @stack_pop_pointer() : () -> i64
      %8626 = func.call @stack_pop_pointer() : () -> i64
      %8627 = func.call @cc_cons(%8626, %8625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8627) : (i64) -> ()
      %8628 = func.call @stack_pop_pointer() : () -> i64
      %8629 = func.call @stack_pop_pointer() : () -> i64
      %8630 = func.call @cc_cons(%8629, %8628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8630) : (i64) -> ()
      %8631 = func.call @stack_pop_pointer() : () -> i64
      %8632 = func.call @stack_pop_pointer() : () -> i64
      %8633 = func.call @cc_cons(%8632, %8631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8633) : (i64) -> ()
      %8634 = llvm.mlir.addressof @str685 : !llvm.ptr
      %8635 = arith.constant 6 : i64
      %8636 = func.call @cc_make_string(%8634, %8635) : (!llvm.ptr, i64) -> i64
      %8637 = func.call @cc_nil_value() : () -> i64
      %8638 = func.call @cc_intern(%8636, %8637) : (i64, i64) -> i64
      %8639 = func.call @cc_nil_value() : () -> i64
      %8640 = func.call @cc_cons(%8638, %8639) : (i64, i64) -> i64
      %8641 = func.call @cc_values_pack(%8640) : (i64) -> i64
      func.call @stack_push_pointer(%8638) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8642 = func.call @stack_pop_pointer() : () -> i64
      %8643 = func.call @stack_pop_pointer() : () -> i64
      %8644 = func.call @cc_cons(%8643, %8642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8644) : (i64) -> ()
      %8645 = func.call @stack_pop_pointer() : () -> i64
      %8646 = func.call @stack_pop_pointer() : () -> i64
      %8647 = func.call @cc_cons(%8646, %8645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8647) : (i64) -> ()
      %8648 = func.call @stack_pop_pointer() : () -> i64
      %8649 = func.call @stack_pop_pointer() : () -> i64
      %8650 = func.call @cc_cons(%8649, %8648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8650) : (i64) -> ()
      %8651 = func.call @stack_pop_pointer() : () -> i64
      %8652 = func.call @stack_pop_pointer() : () -> i64
      %8653 = func.call @cc_cons(%8652, %8651) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8653) : (i64) -> ()
      %8654 = func.call @stack_pop_pointer() : () -> i64
      %9043 = arith.constant 209815645192224 : i64
      %9044 = arith.constant 0 : i64
      %9045 = func.call @cc_make_closure(%9043, %9044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9045) : (i64) -> ()
      %9046 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %9047 = func.call @stack_pop_pointer() : () -> i64
      %9048 = func.call @stack_pop_pointer() : () -> i64
      %9049 = func.call @cc_cons(%9048, %9047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9049) : (i64) -> ()
      %9050 = func.call @stack_pop_pointer() : () -> i64
      %9051 = llvm.mlir.addressof @str741 : !llvm.ptr
      %9052 = arith.constant 11 : i64
      %9053 = func.call @cc_make_string(%9051, %9052) : (!llvm.ptr, i64) -> i64
      %9054 = llvm.mlir.addressof @str742 : !llvm.ptr
      %9055 = arith.constant 7 : i64
      %9056 = func.call @cc_make_string(%9054, %9055) : (!llvm.ptr, i64) -> i64
      %9057 = func.call @cc_intern(%9053, %9056) : (i64, i64) -> i64
      %9058 = func.call @cc_nil_value() : () -> i64
      %9059 = func.call @cc_cons(%9057, %9058) : (i64, i64) -> i64
      %9060 = func.call @cc_values_pack(%9059) : (i64) -> i64
      func.call @stack_push_pointer(%9057) : (i64) -> ()
      %9061 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %9062 = func.call @stack_pop_pointer() : () -> i64
      %9063 = llvm.mlir.addressof @str743 : !llvm.ptr
      %9064 = arith.constant 4 : i64
      %9065 = func.call @cc_make_string(%9063, %9064) : (!llvm.ptr, i64) -> i64
      %9066 = llvm.mlir.addressof @str744 : !llvm.ptr
      %9067 = arith.constant 7 : i64
      %9068 = func.call @cc_make_string(%9066, %9067) : (!llvm.ptr, i64) -> i64
      %9069 = func.call @cc_intern(%9065, %9068) : (i64, i64) -> i64
      %9070 = func.call @cc_nil_value() : () -> i64
      %9071 = func.call @cc_cons(%9069, %9070) : (i64, i64) -> i64
      %9072 = func.call @cc_values_pack(%9071) : (i64) -> i64
      func.call @stack_push_pointer(%9069) : (i64) -> ()
      %9073 = func.call @stack_pop_pointer() : () -> i64
      %9074 = llvm.mlir.addressof @str745 : !llvm.ptr
      %9075 = arith.constant 6 : i64
      %9076 = func.call @cc_make_string(%9074, %9075) : (!llvm.ptr, i64) -> i64
      %9077 = func.call @cc_nil_value() : () -> i64
      %9078 = func.call @cc_intern(%9076, %9077) : (i64, i64) -> i64
      %9079 = func.call @cc_nil_value() : () -> i64
      %9080 = func.call @cc_cons(%9078, %9079) : (i64, i64) -> i64
      %9081 = func.call @cc_values_pack(%9080) : (i64) -> i64
      func.call @stack_push_pointer(%9078) : (i64) -> ()
      %9082 = func.call @stack_pop_pointer() : () -> i64
      %9083 = func.call @cc_nil_value() : () -> i64
      %9084 = func.call @cc_errorp(%8054) : (i64) -> i64
      %9085 = arith.cmpi ne, %9084, %9083 : i64
      %9086 = arith.cmpi eq, %9083, %9083 : i64
      %9087 = arith.andi %9085, %9086 : i1
      %9088 = scf.if %9087 -> (i64) {
        scf.yield %8054 : i64
      } else {
        scf.yield %9083 : i64
      }
      %9089 = func.call @cc_errorp(%8654) : (i64) -> i64
      %9090 = arith.cmpi ne, %9089, %9083 : i64
      %9091 = arith.cmpi eq, %9088, %9083 : i64
      %9092 = arith.andi %9090, %9091 : i1
      %9093 = scf.if %9092 -> (i64) {
        scf.yield %8654 : i64
      } else {
        scf.yield %9088 : i64
      }
      %9094 = func.call @cc_errorp(%9046) : (i64) -> i64
      %9095 = arith.cmpi ne, %9094, %9083 : i64
      %9096 = arith.cmpi eq, %9093, %9083 : i64
      %9097 = arith.andi %9095, %9096 : i1
      %9098 = scf.if %9097 -> (i64) {
        scf.yield %9046 : i64
      } else {
        scf.yield %9093 : i64
      }
      %9099 = func.call @cc_errorp(%9050) : (i64) -> i64
      %9100 = arith.cmpi ne, %9099, %9083 : i64
      %9101 = arith.cmpi eq, %9098, %9083 : i64
      %9102 = arith.andi %9100, %9101 : i1
      %9103 = scf.if %9102 -> (i64) {
        scf.yield %9050 : i64
      } else {
        scf.yield %9098 : i64
      }
      %9104 = func.call @cc_errorp(%9061) : (i64) -> i64
      %9105 = arith.cmpi ne, %9104, %9083 : i64
      %9106 = arith.cmpi eq, %9103, %9083 : i64
      %9107 = arith.andi %9105, %9106 : i1
      %9108 = scf.if %9107 -> (i64) {
        scf.yield %9061 : i64
      } else {
        scf.yield %9103 : i64
      }
      %9109 = func.call @cc_errorp(%9062) : (i64) -> i64
      %9110 = arith.cmpi ne, %9109, %9083 : i64
      %9111 = arith.cmpi eq, %9108, %9083 : i64
      %9112 = arith.andi %9110, %9111 : i1
      %9113 = scf.if %9112 -> (i64) {
        scf.yield %9062 : i64
      } else {
        scf.yield %9108 : i64
      }
      %9114 = func.call @cc_errorp(%9073) : (i64) -> i64
      %9115 = arith.cmpi ne, %9114, %9083 : i64
      %9116 = arith.cmpi eq, %9113, %9083 : i64
      %9117 = arith.andi %9115, %9116 : i1
      %9118 = scf.if %9117 -> (i64) {
        scf.yield %9073 : i64
      } else {
        scf.yield %9113 : i64
      }
      %9119 = func.call @cc_errorp(%9082) : (i64) -> i64
      %9120 = arith.cmpi ne, %9119, %9083 : i64
      %9121 = arith.cmpi eq, %9118, %9083 : i64
      %9122 = arith.andi %9120, %9121 : i1
      %9123 = scf.if %9122 -> (i64) {
        scf.yield %9082 : i64
      } else {
        scf.yield %9118 : i64
      }
      %9124 = arith.cmpi ne, %9123, %9083 : i64
      scf.if %9124 {
        func.call @stack_push_pointer(%9123) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8054) : (i64) -> ()
        func.call @stack_push_pointer(%8654) : (i64) -> ()
        func.call @stack_push_pointer(%9046) : (i64) -> ()
        func.call @stack_push_pointer(%9050) : (i64) -> ()
        func.call @stack_push_pointer(%9061) : (i64) -> ()
        func.call @stack_push_pointer(%9062) : (i64) -> ()
        func.call @stack_push_pointer(%9073) : (i64) -> ()
        func.call @stack_push_pointer(%9082) : (i64) -> ()
        %9125 = llvm.mlir.addressof @str746 : !llvm.ptr
        %9126 = func.call @cc_make_function_ref_const(%9125) : (!llvm.ptr) -> i64
        %9127 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9126, %9127) : (i64, i64) -> ()
      }
      %9128 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9128 : i64
    }
    %9129 = func.call @cc_nil_value() : () -> i64
    %9130 = func.call @cc_errorp(%8045) : (i64) -> i64
    %9131 = arith.cmpi ne, %9130, %9129 : i64
    %9132 = scf.if %9131 -> (i64) {
      scf.yield %8045 : i64
    } else {
      %9133 = llvm.mlir.addressof @str747 : !llvm.ptr
      %9134 = arith.constant 12 : i64
      %9135 = func.call @cc_make_string(%9133, %9134) : (!llvm.ptr, i64) -> i64
      %9136 = func.call @cc_nil_value() : () -> i64
      %9137 = func.call @cc_intern(%9135, %9136) : (i64, i64) -> i64
      %9138 = func.call @cc_nil_value() : () -> i64
      %9139 = func.call @cc_cons(%9137, %9138) : (i64, i64) -> i64
      %9140 = func.call @cc_values_pack(%9139) : (i64) -> i64
      func.call @stack_push_pointer(%9137) : (i64) -> ()
      %9141 = func.call @stack_pop_pointer() : () -> i64
      %9142 = llvm.mlir.addressof @str748 : !llvm.ptr
      %9143 = arith.constant 3 : i64
      %9144 = func.call @cc_make_string(%9142, %9143) : (!llvm.ptr, i64) -> i64
      %9145 = func.call @cc_nil_value() : () -> i64
      %9146 = func.call @cc_intern(%9144, %9145) : (i64, i64) -> i64
      %9147 = func.call @cc_nil_value() : () -> i64
      %9148 = func.call @cc_cons(%9146, %9147) : (i64, i64) -> i64
      %9149 = func.call @cc_values_pack(%9148) : (i64) -> i64
      func.call @stack_push_pointer(%9146) : (i64) -> ()
      %9150 = llvm.mlir.addressof @str749 : !llvm.ptr
      %9151 = arith.constant 3 : i64
      %9152 = func.call @cc_make_string(%9150, %9151) : (!llvm.ptr, i64) -> i64
      %9153 = func.call @cc_nil_value() : () -> i64
      %9154 = func.call @cc_intern(%9152, %9153) : (i64, i64) -> i64
      %9155 = func.call @cc_nil_value() : () -> i64
      %9156 = func.call @cc_cons(%9154, %9155) : (i64, i64) -> i64
      %9157 = func.call @cc_values_pack(%9156) : (i64) -> i64
      func.call @stack_push_pointer(%9154) : (i64) -> ()
      %9158 = llvm.mlir.addressof @str750 : !llvm.ptr
      %9159 = arith.constant 6 : i64
      %9160 = func.call @cc_make_string(%9158, %9159) : (!llvm.ptr, i64) -> i64
      %9161 = llvm.mlir.addressof @str751 : !llvm.ptr
      %9162 = arith.constant 11 : i64
      %9163 = func.call @cc_make_string(%9161, %9162) : (!llvm.ptr, i64) -> i64
      %9164 = func.call @cc_intern(%9160, %9163) : (i64, i64) -> i64
      %9165 = func.call @cc_nil_value() : () -> i64
      %9166 = func.call @cc_cons(%9164, %9165) : (i64, i64) -> i64
      %9167 = func.call @cc_values_pack(%9166) : (i64) -> i64
      func.call @stack_push_pointer(%9164) : (i64) -> ()
      %9168 = arith.constant 97 : i64
      %9169 = func.call @cc_box_character(%9168) : (i64) -> i64
      func.call @stack_push_pointer(%9169) : (i64) -> ()
      %9170 = arith.constant 98 : i64
      %9171 = func.call @cc_box_character(%9170) : (i64) -> i64
      func.call @stack_push_pointer(%9171) : (i64) -> ()
      %9172 = arith.constant 99 : i64
      %9173 = func.call @cc_box_character(%9172) : (i64) -> i64
      func.call @stack_push_pointer(%9173) : (i64) -> ()
      %9174 = arith.constant 100 : i64
      %9175 = func.call @cc_box_character(%9174) : (i64) -> i64
      func.call @stack_push_pointer(%9175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9176 = func.call @stack_pop_pointer() : () -> i64
      %9177 = func.call @stack_pop_pointer() : () -> i64
      %9178 = func.call @cc_cons(%9177, %9176) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9178) : (i64) -> ()
      %9179 = func.call @stack_pop_pointer() : () -> i64
      %9180 = func.call @stack_pop_pointer() : () -> i64
      %9181 = func.call @cc_cons(%9180, %9179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9181) : (i64) -> ()
      %9182 = func.call @stack_pop_pointer() : () -> i64
      %9183 = func.call @stack_pop_pointer() : () -> i64
      %9184 = func.call @cc_cons(%9183, %9182) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9184) : (i64) -> ()
      %9185 = func.call @stack_pop_pointer() : () -> i64
      %9186 = func.call @stack_pop_pointer() : () -> i64
      %9187 = func.call @cc_cons(%9186, %9185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9187) : (i64) -> ()
      %9188 = func.call @stack_pop_pointer() : () -> i64
      %9189 = func.call @stack_pop_pointer() : () -> i64
      %9190 = func.call @cc_cons(%9189, %9188) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9190) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9191 = func.call @stack_pop_pointer() : () -> i64
      %9192 = func.call @stack_pop_pointer() : () -> i64
      %9193 = func.call @cc_cons(%9192, %9191) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9193) : (i64) -> ()
      %9194 = func.call @stack_pop_pointer() : () -> i64
      %9195 = func.call @stack_pop_pointer() : () -> i64
      %9196 = func.call @cc_cons(%9195, %9194) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9196) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9197 = func.call @stack_pop_pointer() : () -> i64
      %9198 = func.call @stack_pop_pointer() : () -> i64
      %9199 = func.call @cc_cons(%9198, %9197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9199) : (i64) -> ()
      %9200 = func.call @stack_pop_pointer() : () -> i64
      %9201 = func.call @stack_pop_pointer() : () -> i64
      %9202 = func.call @cc_cons(%9201, %9200) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9202) : (i64) -> ()
      %9203 = func.call @stack_pop_pointer() : () -> i64
      %9255 = arith.constant 209815645192225 : i64
      %9256 = arith.constant 0 : i64
      %9257 = func.call @cc_make_closure(%9255, %9256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9257) : (i64) -> ()
      %9258 = func.call @stack_pop_pointer() : () -> i64
      %9259 = llvm.mlir.addressof @str753 : !llvm.ptr
      %9260 = arith.constant 1 : i64
      %9261 = func.call @cc_make_string(%9259, %9260) : (!llvm.ptr, i64) -> i64
      %9262 = func.call @cc_nil_value() : () -> i64
      %9263 = func.call @cc_intern(%9261, %9262) : (i64, i64) -> i64
      %9264 = func.call @cc_nil_value() : () -> i64
      %9265 = func.call @cc_cons(%9263, %9264) : (i64, i64) -> i64
      %9266 = func.call @cc_values_pack(%9265) : (i64) -> i64
      func.call @stack_push_pointer(%9263) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9267 = func.call @stack_pop_pointer() : () -> i64
      %9268 = func.call @stack_pop_pointer() : () -> i64
      %9269 = func.call @cc_cons(%9268, %9267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9269) : (i64) -> ()
      %9270 = func.call @stack_pop_pointer() : () -> i64
      %9271 = llvm.mlir.addressof @str754 : !llvm.ptr
      %9272 = arith.constant 11 : i64
      %9273 = func.call @cc_make_string(%9271, %9272) : (!llvm.ptr, i64) -> i64
      %9274 = llvm.mlir.addressof @str755 : !llvm.ptr
      %9275 = arith.constant 7 : i64
      %9276 = func.call @cc_make_string(%9274, %9275) : (!llvm.ptr, i64) -> i64
      %9277 = func.call @cc_intern(%9273, %9276) : (i64, i64) -> i64
      %9278 = func.call @cc_nil_value() : () -> i64
      %9279 = func.call @cc_cons(%9277, %9278) : (i64, i64) -> i64
      %9280 = func.call @cc_values_pack(%9279) : (i64) -> i64
      func.call @stack_push_pointer(%9277) : (i64) -> ()
      %9281 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %9282 = func.call @stack_pop_pointer() : () -> i64
      %9283 = llvm.mlir.addressof @str756 : !llvm.ptr
      %9284 = arith.constant 4 : i64
      %9285 = func.call @cc_make_string(%9283, %9284) : (!llvm.ptr, i64) -> i64
      %9286 = llvm.mlir.addressof @str757 : !llvm.ptr
      %9287 = arith.constant 7 : i64
      %9288 = func.call @cc_make_string(%9286, %9287) : (!llvm.ptr, i64) -> i64
      %9289 = func.call @cc_intern(%9285, %9288) : (i64, i64) -> i64
      %9290 = func.call @cc_nil_value() : () -> i64
      %9291 = func.call @cc_cons(%9289, %9290) : (i64, i64) -> i64
      %9292 = func.call @cc_values_pack(%9291) : (i64) -> i64
      func.call @stack_push_pointer(%9289) : (i64) -> ()
      %9293 = func.call @stack_pop_pointer() : () -> i64
      %9294 = llvm.mlir.addressof @str758 : !llvm.ptr
      %9295 = arith.constant 6 : i64
      %9296 = func.call @cc_make_string(%9294, %9295) : (!llvm.ptr, i64) -> i64
      %9297 = func.call @cc_nil_value() : () -> i64
      %9298 = func.call @cc_intern(%9296, %9297) : (i64, i64) -> i64
      %9299 = func.call @cc_nil_value() : () -> i64
      %9300 = func.call @cc_cons(%9298, %9299) : (i64, i64) -> i64
      %9301 = func.call @cc_values_pack(%9300) : (i64) -> i64
      func.call @stack_push_pointer(%9298) : (i64) -> ()
      %9302 = func.call @stack_pop_pointer() : () -> i64
      %9303 = func.call @cc_nil_value() : () -> i64
      %9304 = func.call @cc_errorp(%9141) : (i64) -> i64
      %9305 = arith.cmpi ne, %9304, %9303 : i64
      %9306 = arith.cmpi eq, %9303, %9303 : i64
      %9307 = arith.andi %9305, %9306 : i1
      %9308 = scf.if %9307 -> (i64) {
        scf.yield %9141 : i64
      } else {
        scf.yield %9303 : i64
      }
      %9309 = func.call @cc_errorp(%9203) : (i64) -> i64
      %9310 = arith.cmpi ne, %9309, %9303 : i64
      %9311 = arith.cmpi eq, %9308, %9303 : i64
      %9312 = arith.andi %9310, %9311 : i1
      %9313 = scf.if %9312 -> (i64) {
        scf.yield %9203 : i64
      } else {
        scf.yield %9308 : i64
      }
      %9314 = func.call @cc_errorp(%9258) : (i64) -> i64
      %9315 = arith.cmpi ne, %9314, %9303 : i64
      %9316 = arith.cmpi eq, %9313, %9303 : i64
      %9317 = arith.andi %9315, %9316 : i1
      %9318 = scf.if %9317 -> (i64) {
        scf.yield %9258 : i64
      } else {
        scf.yield %9313 : i64
      }
      %9319 = func.call @cc_errorp(%9270) : (i64) -> i64
      %9320 = arith.cmpi ne, %9319, %9303 : i64
      %9321 = arith.cmpi eq, %9318, %9303 : i64
      %9322 = arith.andi %9320, %9321 : i1
      %9323 = scf.if %9322 -> (i64) {
        scf.yield %9270 : i64
      } else {
        scf.yield %9318 : i64
      }
      %9324 = func.call @cc_errorp(%9281) : (i64) -> i64
      %9325 = arith.cmpi ne, %9324, %9303 : i64
      %9326 = arith.cmpi eq, %9323, %9303 : i64
      %9327 = arith.andi %9325, %9326 : i1
      %9328 = scf.if %9327 -> (i64) {
        scf.yield %9281 : i64
      } else {
        scf.yield %9323 : i64
      }
      %9329 = func.call @cc_errorp(%9282) : (i64) -> i64
      %9330 = arith.cmpi ne, %9329, %9303 : i64
      %9331 = arith.cmpi eq, %9328, %9303 : i64
      %9332 = arith.andi %9330, %9331 : i1
      %9333 = scf.if %9332 -> (i64) {
        scf.yield %9282 : i64
      } else {
        scf.yield %9328 : i64
      }
      %9334 = func.call @cc_errorp(%9293) : (i64) -> i64
      %9335 = arith.cmpi ne, %9334, %9303 : i64
      %9336 = arith.cmpi eq, %9333, %9303 : i64
      %9337 = arith.andi %9335, %9336 : i1
      %9338 = scf.if %9337 -> (i64) {
        scf.yield %9293 : i64
      } else {
        scf.yield %9333 : i64
      }
      %9339 = func.call @cc_errorp(%9302) : (i64) -> i64
      %9340 = arith.cmpi ne, %9339, %9303 : i64
      %9341 = arith.cmpi eq, %9338, %9303 : i64
      %9342 = arith.andi %9340, %9341 : i1
      %9343 = scf.if %9342 -> (i64) {
        scf.yield %9302 : i64
      } else {
        scf.yield %9338 : i64
      }
      %9344 = arith.cmpi ne, %9343, %9303 : i64
      scf.if %9344 {
        func.call @stack_push_pointer(%9343) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9141) : (i64) -> ()
        func.call @stack_push_pointer(%9203) : (i64) -> ()
        func.call @stack_push_pointer(%9258) : (i64) -> ()
        func.call @stack_push_pointer(%9270) : (i64) -> ()
        func.call @stack_push_pointer(%9281) : (i64) -> ()
        func.call @stack_push_pointer(%9282) : (i64) -> ()
        func.call @stack_push_pointer(%9293) : (i64) -> ()
        func.call @stack_push_pointer(%9302) : (i64) -> ()
        %9345 = llvm.mlir.addressof @str759 : !llvm.ptr
        %9346 = func.call @cc_make_function_ref_const(%9345) : (!llvm.ptr) -> i64
        %9347 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9346, %9347) : (i64, i64) -> ()
      }
      %9348 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9348 : i64
    }
    %9349 = func.call @cc_nil_value() : () -> i64
    %9350 = func.call @cc_errorp(%9132) : (i64) -> i64
    %9351 = arith.cmpi ne, %9350, %9349 : i64
    %9352 = scf.if %9351 -> (i64) {
      scf.yield %9132 : i64
    } else {
      %9353 = llvm.mlir.addressof @str760 : !llvm.ptr
      %9354 = arith.constant 12 : i64
      %9355 = func.call @cc_make_string(%9353, %9354) : (!llvm.ptr, i64) -> i64
      %9356 = func.call @cc_nil_value() : () -> i64
      %9357 = func.call @cc_intern(%9355, %9356) : (i64, i64) -> i64
      %9358 = func.call @cc_nil_value() : () -> i64
      %9359 = func.call @cc_cons(%9357, %9358) : (i64, i64) -> i64
      %9360 = func.call @cc_values_pack(%9359) : (i64) -> i64
      func.call @stack_push_pointer(%9357) : (i64) -> ()
      %9361 = func.call @stack_pop_pointer() : () -> i64
      %9362 = llvm.mlir.addressof @str761 : !llvm.ptr
      %9363 = arith.constant 3 : i64
      %9364 = func.call @cc_make_string(%9362, %9363) : (!llvm.ptr, i64) -> i64
      %9365 = func.call @cc_nil_value() : () -> i64
      %9366 = func.call @cc_intern(%9364, %9365) : (i64, i64) -> i64
      %9367 = func.call @cc_nil_value() : () -> i64
      %9368 = func.call @cc_cons(%9366, %9367) : (i64, i64) -> i64
      %9369 = func.call @cc_values_pack(%9368) : (i64) -> i64
      func.call @stack_push_pointer(%9366) : (i64) -> ()
      %9370 = llvm.mlir.addressof @str762 : !llvm.ptr
      %9371 = arith.constant 3 : i64
      %9372 = func.call @cc_make_string(%9370, %9371) : (!llvm.ptr, i64) -> i64
      %9373 = func.call @cc_nil_value() : () -> i64
      %9374 = func.call @cc_intern(%9372, %9373) : (i64, i64) -> i64
      %9375 = func.call @cc_nil_value() : () -> i64
      %9376 = func.call @cc_cons(%9374, %9375) : (i64, i64) -> i64
      %9377 = func.call @cc_values_pack(%9376) : (i64) -> i64
      func.call @stack_push_pointer(%9374) : (i64) -> ()
      %9378 = llvm.mlir.addressof @str763 : !llvm.ptr
      %9379 = arith.constant 3 : i64
      %9380 = func.call @cc_make_string(%9378, %9379) : (!llvm.ptr, i64) -> i64
      %9381 = func.call @cc_nil_value() : () -> i64
      %9382 = func.call @cc_intern(%9380, %9381) : (i64, i64) -> i64
      %9383 = func.call @cc_nil_value() : () -> i64
      %9384 = func.call @cc_cons(%9382, %9383) : (i64, i64) -> i64
      %9385 = func.call @cc_values_pack(%9384) : (i64) -> i64
      func.call @stack_push_pointer(%9382) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9386 = llvm.mlir.addressof @str764 : !llvm.ptr
      %9387 = arith.constant 6 : i64
      %9388 = func.call @cc_make_string(%9386, %9387) : (!llvm.ptr, i64) -> i64
      %9389 = llvm.mlir.addressof @str765 : !llvm.ptr
      %9390 = arith.constant 11 : i64
      %9391 = func.call @cc_make_string(%9389, %9390) : (!llvm.ptr, i64) -> i64
      %9392 = func.call @cc_intern(%9388, %9391) : (i64, i64) -> i64
      %9393 = func.call @cc_nil_value() : () -> i64
      %9394 = func.call @cc_cons(%9392, %9393) : (i64, i64) -> i64
      %9395 = func.call @cc_values_pack(%9394) : (i64) -> i64
      func.call @stack_push_pointer(%9392) : (i64) -> ()
      %9396 = arith.constant 97 : i64
      %9397 = func.call @cc_box_character(%9396) : (i64) -> i64
      func.call @stack_push_pointer(%9397) : (i64) -> ()
      %9398 = arith.constant 98 : i64
      %9399 = func.call @cc_box_character(%9398) : (i64) -> i64
      func.call @stack_push_pointer(%9399) : (i64) -> ()
      %9400 = arith.constant 99 : i64
      %9401 = func.call @cc_box_character(%9400) : (i64) -> i64
      func.call @stack_push_pointer(%9401) : (i64) -> ()
      %9402 = arith.constant 100 : i64
      %9403 = func.call @cc_box_character(%9402) : (i64) -> i64
      func.call @stack_push_pointer(%9403) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9404 = func.call @stack_pop_pointer() : () -> i64
      %9405 = func.call @stack_pop_pointer() : () -> i64
      %9406 = func.call @cc_cons(%9405, %9404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9406) : (i64) -> ()
      %9407 = func.call @stack_pop_pointer() : () -> i64
      %9408 = func.call @stack_pop_pointer() : () -> i64
      %9409 = func.call @cc_cons(%9408, %9407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9409) : (i64) -> ()
      %9410 = func.call @stack_pop_pointer() : () -> i64
      %9411 = func.call @stack_pop_pointer() : () -> i64
      %9412 = func.call @cc_cons(%9411, %9410) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9412) : (i64) -> ()
      %9413 = func.call @stack_pop_pointer() : () -> i64
      %9414 = func.call @stack_pop_pointer() : () -> i64
      %9415 = func.call @cc_cons(%9414, %9413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9415) : (i64) -> ()
      %9416 = func.call @stack_pop_pointer() : () -> i64
      %9417 = func.call @stack_pop_pointer() : () -> i64
      %9418 = func.call @cc_cons(%9417, %9416) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9418) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9419 = func.call @stack_pop_pointer() : () -> i64
      %9420 = func.call @stack_pop_pointer() : () -> i64
      %9421 = func.call @cc_cons(%9420, %9419) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9421) : (i64) -> ()
      %9422 = func.call @stack_pop_pointer() : () -> i64
      %9423 = func.call @stack_pop_pointer() : () -> i64
      %9424 = func.call @cc_cons(%9423, %9422) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9424) : (i64) -> ()
      %9425 = func.call @stack_pop_pointer() : () -> i64
      %9426 = func.call @stack_pop_pointer() : () -> i64
      %9427 = func.call @cc_cons(%9426, %9425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9427) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9428 = func.call @stack_pop_pointer() : () -> i64
      %9429 = func.call @stack_pop_pointer() : () -> i64
      %9430 = func.call @cc_cons(%9429, %9428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9430) : (i64) -> ()
      %9431 = func.call @stack_pop_pointer() : () -> i64
      %9432 = func.call @stack_pop_pointer() : () -> i64
      %9433 = func.call @cc_cons(%9432, %9431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9433) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9434 = func.call @stack_pop_pointer() : () -> i64
      %9435 = func.call @stack_pop_pointer() : () -> i64
      %9436 = func.call @cc_cons(%9435, %9434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9436) : (i64) -> ()
      %9437 = func.call @stack_pop_pointer() : () -> i64
      %9438 = func.call @stack_pop_pointer() : () -> i64
      %9439 = func.call @cc_cons(%9438, %9437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9439) : (i64) -> ()
      %9440 = func.call @stack_pop_pointer() : () -> i64
      %9498 = arith.constant 209815645192226 : i64
      %9499 = arith.constant 0 : i64
      %9500 = func.call @cc_make_closure(%9498, %9499) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9500) : (i64) -> ()
      %9501 = func.call @stack_pop_pointer() : () -> i64
      %9502 = llvm.mlir.addressof @str767 : !llvm.ptr
      %9503 = arith.constant 1 : i64
      %9504 = func.call @cc_make_string(%9502, %9503) : (!llvm.ptr, i64) -> i64
      %9505 = func.call @cc_nil_value() : () -> i64
      %9506 = func.call @cc_intern(%9504, %9505) : (i64, i64) -> i64
      %9507 = func.call @cc_nil_value() : () -> i64
      %9508 = func.call @cc_cons(%9506, %9507) : (i64, i64) -> i64
      %9509 = func.call @cc_values_pack(%9508) : (i64) -> i64
      func.call @stack_push_pointer(%9506) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9510 = func.call @stack_pop_pointer() : () -> i64
      %9511 = func.call @stack_pop_pointer() : () -> i64
      %9512 = func.call @cc_cons(%9511, %9510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9512) : (i64) -> ()
      %9513 = func.call @stack_pop_pointer() : () -> i64
      %9514 = llvm.mlir.addressof @str768 : !llvm.ptr
      %9515 = arith.constant 11 : i64
      %9516 = func.call @cc_make_string(%9514, %9515) : (!llvm.ptr, i64) -> i64
      %9517 = llvm.mlir.addressof @str769 : !llvm.ptr
      %9518 = arith.constant 7 : i64
      %9519 = func.call @cc_make_string(%9517, %9518) : (!llvm.ptr, i64) -> i64
      %9520 = func.call @cc_intern(%9516, %9519) : (i64, i64) -> i64
      %9521 = func.call @cc_nil_value() : () -> i64
      %9522 = func.call @cc_cons(%9520, %9521) : (i64, i64) -> i64
      %9523 = func.call @cc_values_pack(%9522) : (i64) -> i64
      func.call @stack_push_pointer(%9520) : (i64) -> ()
      %9524 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %9525 = func.call @stack_pop_pointer() : () -> i64
      %9526 = llvm.mlir.addressof @str770 : !llvm.ptr
      %9527 = arith.constant 4 : i64
      %9528 = func.call @cc_make_string(%9526, %9527) : (!llvm.ptr, i64) -> i64
      %9529 = llvm.mlir.addressof @str771 : !llvm.ptr
      %9530 = arith.constant 7 : i64
      %9531 = func.call @cc_make_string(%9529, %9530) : (!llvm.ptr, i64) -> i64
      %9532 = func.call @cc_intern(%9528, %9531) : (i64, i64) -> i64
      %9533 = func.call @cc_nil_value() : () -> i64
      %9534 = func.call @cc_cons(%9532, %9533) : (i64, i64) -> i64
      %9535 = func.call @cc_values_pack(%9534) : (i64) -> i64
      func.call @stack_push_pointer(%9532) : (i64) -> ()
      %9536 = func.call @stack_pop_pointer() : () -> i64
      %9537 = llvm.mlir.addressof @str772 : !llvm.ptr
      %9538 = arith.constant 6 : i64
      %9539 = func.call @cc_make_string(%9537, %9538) : (!llvm.ptr, i64) -> i64
      %9540 = func.call @cc_nil_value() : () -> i64
      %9541 = func.call @cc_intern(%9539, %9540) : (i64, i64) -> i64
      %9542 = func.call @cc_nil_value() : () -> i64
      %9543 = func.call @cc_cons(%9541, %9542) : (i64, i64) -> i64
      %9544 = func.call @cc_values_pack(%9543) : (i64) -> i64
      func.call @stack_push_pointer(%9541) : (i64) -> ()
      %9545 = func.call @stack_pop_pointer() : () -> i64
      %9546 = func.call @cc_nil_value() : () -> i64
      %9547 = func.call @cc_errorp(%9361) : (i64) -> i64
      %9548 = arith.cmpi ne, %9547, %9546 : i64
      %9549 = arith.cmpi eq, %9546, %9546 : i64
      %9550 = arith.andi %9548, %9549 : i1
      %9551 = scf.if %9550 -> (i64) {
        scf.yield %9361 : i64
      } else {
        scf.yield %9546 : i64
      }
      %9552 = func.call @cc_errorp(%9440) : (i64) -> i64
      %9553 = arith.cmpi ne, %9552, %9546 : i64
      %9554 = arith.cmpi eq, %9551, %9546 : i64
      %9555 = arith.andi %9553, %9554 : i1
      %9556 = scf.if %9555 -> (i64) {
        scf.yield %9440 : i64
      } else {
        scf.yield %9551 : i64
      }
      %9557 = func.call @cc_errorp(%9501) : (i64) -> i64
      %9558 = arith.cmpi ne, %9557, %9546 : i64
      %9559 = arith.cmpi eq, %9556, %9546 : i64
      %9560 = arith.andi %9558, %9559 : i1
      %9561 = scf.if %9560 -> (i64) {
        scf.yield %9501 : i64
      } else {
        scf.yield %9556 : i64
      }
      %9562 = func.call @cc_errorp(%9513) : (i64) -> i64
      %9563 = arith.cmpi ne, %9562, %9546 : i64
      %9564 = arith.cmpi eq, %9561, %9546 : i64
      %9565 = arith.andi %9563, %9564 : i1
      %9566 = scf.if %9565 -> (i64) {
        scf.yield %9513 : i64
      } else {
        scf.yield %9561 : i64
      }
      %9567 = func.call @cc_errorp(%9524) : (i64) -> i64
      %9568 = arith.cmpi ne, %9567, %9546 : i64
      %9569 = arith.cmpi eq, %9566, %9546 : i64
      %9570 = arith.andi %9568, %9569 : i1
      %9571 = scf.if %9570 -> (i64) {
        scf.yield %9524 : i64
      } else {
        scf.yield %9566 : i64
      }
      %9572 = func.call @cc_errorp(%9525) : (i64) -> i64
      %9573 = arith.cmpi ne, %9572, %9546 : i64
      %9574 = arith.cmpi eq, %9571, %9546 : i64
      %9575 = arith.andi %9573, %9574 : i1
      %9576 = scf.if %9575 -> (i64) {
        scf.yield %9525 : i64
      } else {
        scf.yield %9571 : i64
      }
      %9577 = func.call @cc_errorp(%9536) : (i64) -> i64
      %9578 = arith.cmpi ne, %9577, %9546 : i64
      %9579 = arith.cmpi eq, %9576, %9546 : i64
      %9580 = arith.andi %9578, %9579 : i1
      %9581 = scf.if %9580 -> (i64) {
        scf.yield %9536 : i64
      } else {
        scf.yield %9576 : i64
      }
      %9582 = func.call @cc_errorp(%9545) : (i64) -> i64
      %9583 = arith.cmpi ne, %9582, %9546 : i64
      %9584 = arith.cmpi eq, %9581, %9546 : i64
      %9585 = arith.andi %9583, %9584 : i1
      %9586 = scf.if %9585 -> (i64) {
        scf.yield %9545 : i64
      } else {
        scf.yield %9581 : i64
      }
      %9587 = arith.cmpi ne, %9586, %9546 : i64
      scf.if %9587 {
        func.call @stack_push_pointer(%9586) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9361) : (i64) -> ()
        func.call @stack_push_pointer(%9440) : (i64) -> ()
        func.call @stack_push_pointer(%9501) : (i64) -> ()
        func.call @stack_push_pointer(%9513) : (i64) -> ()
        func.call @stack_push_pointer(%9524) : (i64) -> ()
        func.call @stack_push_pointer(%9525) : (i64) -> ()
        func.call @stack_push_pointer(%9536) : (i64) -> ()
        func.call @stack_push_pointer(%9545) : (i64) -> ()
        %9588 = llvm.mlir.addressof @str773 : !llvm.ptr
        %9589 = func.call @cc_make_function_ref_const(%9588) : (!llvm.ptr) -> i64
        %9590 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9589, %9590) : (i64, i64) -> ()
      }
      %9591 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9591 : i64
    }
    %9592 = func.call @cc_nil_value() : () -> i64
    %9593 = func.call @cc_errorp(%9352) : (i64) -> i64
    %9594 = arith.cmpi ne, %9593, %9592 : i64
    %9595 = scf.if %9594 -> (i64) {
      scf.yield %9352 : i64
    } else {
      %9596 = llvm.mlir.addressof @str774 : !llvm.ptr
      %9597 = arith.constant 12 : i64
      %9598 = func.call @cc_make_string(%9596, %9597) : (!llvm.ptr, i64) -> i64
      %9599 = func.call @cc_nil_value() : () -> i64
      %9600 = func.call @cc_intern(%9598, %9599) : (i64, i64) -> i64
      %9601 = func.call @cc_nil_value() : () -> i64
      %9602 = func.call @cc_cons(%9600, %9601) : (i64, i64) -> i64
      %9603 = func.call @cc_values_pack(%9602) : (i64) -> i64
      func.call @stack_push_pointer(%9600) : (i64) -> ()
      %9604 = func.call @stack_pop_pointer() : () -> i64
      %9605 = llvm.mlir.addressof @str775 : !llvm.ptr
      %9606 = arith.constant 3 : i64
      %9607 = func.call @cc_make_string(%9605, %9606) : (!llvm.ptr, i64) -> i64
      %9608 = func.call @cc_nil_value() : () -> i64
      %9609 = func.call @cc_intern(%9607, %9608) : (i64, i64) -> i64
      %9610 = func.call @cc_nil_value() : () -> i64
      %9611 = func.call @cc_cons(%9609, %9610) : (i64, i64) -> i64
      %9612 = func.call @cc_values_pack(%9611) : (i64) -> i64
      func.call @stack_push_pointer(%9609) : (i64) -> ()
      %9613 = llvm.mlir.addressof @str776 : !llvm.ptr
      %9614 = arith.constant 3 : i64
      %9615 = func.call @cc_make_string(%9613, %9614) : (!llvm.ptr, i64) -> i64
      %9616 = func.call @cc_nil_value() : () -> i64
      %9617 = func.call @cc_intern(%9615, %9616) : (i64, i64) -> i64
      %9618 = func.call @cc_nil_value() : () -> i64
      %9619 = func.call @cc_cons(%9617, %9618) : (i64, i64) -> i64
      %9620 = func.call @cc_values_pack(%9619) : (i64) -> i64
      func.call @stack_push_pointer(%9617) : (i64) -> ()
      %9621 = llvm.mlir.addressof @str777 : !llvm.ptr
      %9622 = arith.constant 3 : i64
      %9623 = func.call @cc_make_string(%9621, %9622) : (!llvm.ptr, i64) -> i64
      %9624 = llvm.mlir.addressof @str778 : !llvm.ptr
      %9625 = arith.constant 11 : i64
      %9626 = func.call @cc_make_string(%9624, %9625) : (!llvm.ptr, i64) -> i64
      %9627 = func.call @cc_intern(%9623, %9626) : (i64, i64) -> i64
      %9628 = func.call @cc_nil_value() : () -> i64
      %9629 = func.call @cc_cons(%9627, %9628) : (i64, i64) -> i64
      %9630 = func.call @cc_values_pack(%9629) : (i64) -> i64
      func.call @stack_push_pointer(%9627) : (i64) -> ()
      %9631 = arith.constant 127 : i64
      %9632 = func.call @cc_box_character(%9631) : (i64) -> i64
      func.call @stack_push_pointer(%9632) : (i64) -> ()
      %9633 = arith.constant 127 : i64
      %9634 = func.call @cc_box_character(%9633) : (i64) -> i64
      func.call @stack_push_pointer(%9634) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9635 = func.call @stack_pop_pointer() : () -> i64
      %9636 = func.call @stack_pop_pointer() : () -> i64
      %9637 = func.call @cc_cons(%9636, %9635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9637) : (i64) -> ()
      %9638 = func.call @stack_pop_pointer() : () -> i64
      %9639 = func.call @stack_pop_pointer() : () -> i64
      %9640 = func.call @cc_cons(%9639, %9638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9640) : (i64) -> ()
      %9641 = func.call @stack_pop_pointer() : () -> i64
      %9642 = func.call @stack_pop_pointer() : () -> i64
      %9643 = func.call @cc_cons(%9642, %9641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9643) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9644 = func.call @stack_pop_pointer() : () -> i64
      %9645 = func.call @stack_pop_pointer() : () -> i64
      %9646 = func.call @cc_cons(%9645, %9644) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9646) : (i64) -> ()
      %9647 = func.call @stack_pop_pointer() : () -> i64
      %9648 = func.call @stack_pop_pointer() : () -> i64
      %9649 = func.call @cc_cons(%9648, %9647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9649) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9650 = func.call @stack_pop_pointer() : () -> i64
      %9651 = func.call @stack_pop_pointer() : () -> i64
      %9652 = func.call @cc_cons(%9651, %9650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9652) : (i64) -> ()
      %9653 = func.call @stack_pop_pointer() : () -> i64
      %9654 = func.call @stack_pop_pointer() : () -> i64
      %9655 = func.call @cc_cons(%9654, %9653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9655) : (i64) -> ()
      %9656 = func.call @stack_pop_pointer() : () -> i64
      %9678 = arith.constant 209815645192227 : i64
      %9679 = arith.constant 0 : i64
      %9680 = func.call @cc_make_closure(%9678, %9679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9680) : (i64) -> ()
      %9681 = func.call @stack_pop_pointer() : () -> i64
      %9682 = llvm.mlir.addressof @str779 : !llvm.ptr
      %9683 = arith.constant 1 : i64
      %9684 = func.call @cc_make_string(%9682, %9683) : (!llvm.ptr, i64) -> i64
      %9685 = func.call @cc_nil_value() : () -> i64
      %9686 = func.call @cc_intern(%9684, %9685) : (i64, i64) -> i64
      %9687 = func.call @cc_nil_value() : () -> i64
      %9688 = func.call @cc_cons(%9686, %9687) : (i64, i64) -> i64
      %9689 = func.call @cc_values_pack(%9688) : (i64) -> i64
      func.call @stack_push_pointer(%9686) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9690 = func.call @stack_pop_pointer() : () -> i64
      %9691 = func.call @stack_pop_pointer() : () -> i64
      %9692 = func.call @cc_cons(%9691, %9690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9692) : (i64) -> ()
      %9693 = func.call @stack_pop_pointer() : () -> i64
      %9694 = llvm.mlir.addressof @str780 : !llvm.ptr
      %9695 = arith.constant 11 : i64
      %9696 = func.call @cc_make_string(%9694, %9695) : (!llvm.ptr, i64) -> i64
      %9697 = llvm.mlir.addressof @str781 : !llvm.ptr
      %9698 = arith.constant 7 : i64
      %9699 = func.call @cc_make_string(%9697, %9698) : (!llvm.ptr, i64) -> i64
      %9700 = func.call @cc_intern(%9696, %9699) : (i64, i64) -> i64
      %9701 = func.call @cc_nil_value() : () -> i64
      %9702 = func.call @cc_cons(%9700, %9701) : (i64, i64) -> i64
      %9703 = func.call @cc_values_pack(%9702) : (i64) -> i64
      func.call @stack_push_pointer(%9700) : (i64) -> ()
      %9704 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %9705 = func.call @stack_pop_pointer() : () -> i64
      %9706 = llvm.mlir.addressof @str782 : !llvm.ptr
      %9707 = arith.constant 4 : i64
      %9708 = func.call @cc_make_string(%9706, %9707) : (!llvm.ptr, i64) -> i64
      %9709 = llvm.mlir.addressof @str783 : !llvm.ptr
      %9710 = arith.constant 7 : i64
      %9711 = func.call @cc_make_string(%9709, %9710) : (!llvm.ptr, i64) -> i64
      %9712 = func.call @cc_intern(%9708, %9711) : (i64, i64) -> i64
      %9713 = func.call @cc_nil_value() : () -> i64
      %9714 = func.call @cc_cons(%9712, %9713) : (i64, i64) -> i64
      %9715 = func.call @cc_values_pack(%9714) : (i64) -> i64
      func.call @stack_push_pointer(%9712) : (i64) -> ()
      %9716 = func.call @stack_pop_pointer() : () -> i64
      %9717 = llvm.mlir.addressof @str784 : !llvm.ptr
      %9718 = arith.constant 6 : i64
      %9719 = func.call @cc_make_string(%9717, %9718) : (!llvm.ptr, i64) -> i64
      %9720 = func.call @cc_nil_value() : () -> i64
      %9721 = func.call @cc_intern(%9719, %9720) : (i64, i64) -> i64
      %9722 = func.call @cc_nil_value() : () -> i64
      %9723 = func.call @cc_cons(%9721, %9722) : (i64, i64) -> i64
      %9724 = func.call @cc_values_pack(%9723) : (i64) -> i64
      func.call @stack_push_pointer(%9721) : (i64) -> ()
      %9725 = func.call @stack_pop_pointer() : () -> i64
      %9726 = func.call @cc_nil_value() : () -> i64
      %9727 = func.call @cc_errorp(%9604) : (i64) -> i64
      %9728 = arith.cmpi ne, %9727, %9726 : i64
      %9729 = arith.cmpi eq, %9726, %9726 : i64
      %9730 = arith.andi %9728, %9729 : i1
      %9731 = scf.if %9730 -> (i64) {
        scf.yield %9604 : i64
      } else {
        scf.yield %9726 : i64
      }
      %9732 = func.call @cc_errorp(%9656) : (i64) -> i64
      %9733 = arith.cmpi ne, %9732, %9726 : i64
      %9734 = arith.cmpi eq, %9731, %9726 : i64
      %9735 = arith.andi %9733, %9734 : i1
      %9736 = scf.if %9735 -> (i64) {
        scf.yield %9656 : i64
      } else {
        scf.yield %9731 : i64
      }
      %9737 = func.call @cc_errorp(%9681) : (i64) -> i64
      %9738 = arith.cmpi ne, %9737, %9726 : i64
      %9739 = arith.cmpi eq, %9736, %9726 : i64
      %9740 = arith.andi %9738, %9739 : i1
      %9741 = scf.if %9740 -> (i64) {
        scf.yield %9681 : i64
      } else {
        scf.yield %9736 : i64
      }
      %9742 = func.call @cc_errorp(%9693) : (i64) -> i64
      %9743 = arith.cmpi ne, %9742, %9726 : i64
      %9744 = arith.cmpi eq, %9741, %9726 : i64
      %9745 = arith.andi %9743, %9744 : i1
      %9746 = scf.if %9745 -> (i64) {
        scf.yield %9693 : i64
      } else {
        scf.yield %9741 : i64
      }
      %9747 = func.call @cc_errorp(%9704) : (i64) -> i64
      %9748 = arith.cmpi ne, %9747, %9726 : i64
      %9749 = arith.cmpi eq, %9746, %9726 : i64
      %9750 = arith.andi %9748, %9749 : i1
      %9751 = scf.if %9750 -> (i64) {
        scf.yield %9704 : i64
      } else {
        scf.yield %9746 : i64
      }
      %9752 = func.call @cc_errorp(%9705) : (i64) -> i64
      %9753 = arith.cmpi ne, %9752, %9726 : i64
      %9754 = arith.cmpi eq, %9751, %9726 : i64
      %9755 = arith.andi %9753, %9754 : i1
      %9756 = scf.if %9755 -> (i64) {
        scf.yield %9705 : i64
      } else {
        scf.yield %9751 : i64
      }
      %9757 = func.call @cc_errorp(%9716) : (i64) -> i64
      %9758 = arith.cmpi ne, %9757, %9726 : i64
      %9759 = arith.cmpi eq, %9756, %9726 : i64
      %9760 = arith.andi %9758, %9759 : i1
      %9761 = scf.if %9760 -> (i64) {
        scf.yield %9716 : i64
      } else {
        scf.yield %9756 : i64
      }
      %9762 = func.call @cc_errorp(%9725) : (i64) -> i64
      %9763 = arith.cmpi ne, %9762, %9726 : i64
      %9764 = arith.cmpi eq, %9761, %9726 : i64
      %9765 = arith.andi %9763, %9764 : i1
      %9766 = scf.if %9765 -> (i64) {
        scf.yield %9725 : i64
      } else {
        scf.yield %9761 : i64
      }
      %9767 = arith.cmpi ne, %9766, %9726 : i64
      scf.if %9767 {
        func.call @stack_push_pointer(%9766) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9604) : (i64) -> ()
        func.call @stack_push_pointer(%9656) : (i64) -> ()
        func.call @stack_push_pointer(%9681) : (i64) -> ()
        func.call @stack_push_pointer(%9693) : (i64) -> ()
        func.call @stack_push_pointer(%9704) : (i64) -> ()
        func.call @stack_push_pointer(%9705) : (i64) -> ()
        func.call @stack_push_pointer(%9716) : (i64) -> ()
        func.call @stack_push_pointer(%9725) : (i64) -> ()
        %9768 = llvm.mlir.addressof @str785 : !llvm.ptr
        %9769 = func.call @cc_make_function_ref_const(%9768) : (!llvm.ptr) -> i64
        %9770 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%9769, %9770) : (i64, i64) -> ()
      }
      %9771 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9771 : i64
    }
    %9772 = func.call @cc_nil_value() : () -> i64
    %9773 = func.call @cc_errorp(%9595) : (i64) -> i64
    %9774 = arith.cmpi ne, %9773, %9772 : i64
    %9775 = scf.if %9774 -> (i64) {
      scf.yield %9595 : i64
    } else {
      %9776 = llvm.mlir.addressof @str786 : !llvm.ptr
      %9777 = arith.constant 12 : i64
      %9778 = func.call @cc_make_string(%9776, %9777) : (!llvm.ptr, i64) -> i64
      %9779 = func.call @cc_nil_value() : () -> i64
      %9780 = func.call @cc_intern(%9778, %9779) : (i64, i64) -> i64
      %9781 = func.call @cc_nil_value() : () -> i64
      %9782 = func.call @cc_cons(%9780, %9781) : (i64, i64) -> i64
      %9783 = func.call @cc_values_pack(%9782) : (i64) -> i64
      func.call @stack_push_pointer(%9780) : (i64) -> ()
      %9784 = func.call @stack_pop_pointer() : () -> i64
      %9785 = llvm.mlir.addressof @str787 : !llvm.ptr
      %9786 = arith.constant 3 : i64
      %9787 = func.call @cc_make_string(%9785, %9786) : (!llvm.ptr, i64) -> i64
      %9788 = func.call @cc_nil_value() : () -> i64
      %9789 = func.call @cc_intern(%9787, %9788) : (i64, i64) -> i64
      %9790 = func.call @cc_nil_value() : () -> i64
      %9791 = func.call @cc_cons(%9789, %9790) : (i64, i64) -> i64
      %9792 = func.call @cc_values_pack(%9791) : (i64) -> i64
      func.call @stack_push_pointer(%9789) : (i64) -> ()
      %9793 = llvm.mlir.addressof @str788 : !llvm.ptr
      %9794 = arith.constant 3 : i64
      %9795 = func.call @cc_make_string(%9793, %9794) : (!llvm.ptr, i64) -> i64
      %9796 = func.call @cc_nil_value() : () -> i64
      %9797 = func.call @cc_intern(%9795, %9796) : (i64, i64) -> i64
      %9798 = func.call @cc_nil_value() : () -> i64
      %9799 = func.call @cc_cons(%9797, %9798) : (i64, i64) -> i64
      %9800 = func.call @cc_values_pack(%9799) : (i64) -> i64
      func.call @stack_push_pointer(%9797) : (i64) -> ()
      %9801 = llvm.mlir.addressof @str789 : !llvm.ptr
      %9802 = arith.constant 4 : i64
      %9803 = func.call @cc_make_string(%9801, %9802) : (!llvm.ptr, i64) -> i64
      %9804 = llvm.mlir.addressof @str790 : !llvm.ptr
      %9805 = arith.constant 11 : i64
      %9806 = func.call @cc_make_string(%9804, %9805) : (!llvm.ptr, i64) -> i64
      %9807 = func.call @cc_intern(%9803, %9806) : (i64, i64) -> i64
      %9808 = func.call @cc_nil_value() : () -> i64
      %9809 = func.call @cc_cons(%9807, %9808) : (i64, i64) -> i64
      %9810 = func.call @cc_values_pack(%9809) : (i64) -> i64
      func.call @stack_push_pointer(%9807) : (i64) -> ()
      %9811 = arith.constant 0 : i64
      %9812 = func.call @cc_box_character(%9811) : (i64) -> i64
      func.call @stack_push_pointer(%9812) : (i64) -> ()
      %9813 = arith.constant 1 : i64
      %9814 = func.call @cc_box_character(%9813) : (i64) -> i64
      func.call @stack_push_pointer(%9814) : (i64) -> ()
      %9815 = arith.constant 2 : i64
      %9816 = func.call @cc_box_character(%9815) : (i64) -> i64
      func.call @stack_push_pointer(%9816) : (i64) -> ()
      %9817 = arith.constant 3 : i64
      %9818 = func.call @cc_box_character(%9817) : (i64) -> i64
      func.call @stack_push_pointer(%9818) : (i64) -> ()
      %9819 = arith.constant 4 : i64
      %9820 = func.call @cc_box_character(%9819) : (i64) -> i64
      func.call @stack_push_pointer(%9820) : (i64) -> ()
      %9821 = arith.constant 5 : i64
      %9822 = func.call @cc_box_character(%9821) : (i64) -> i64
      func.call @stack_push_pointer(%9822) : (i64) -> ()
      %9823 = arith.constant 6 : i64
      %9824 = func.call @cc_box_character(%9823) : (i64) -> i64
      func.call @stack_push_pointer(%9824) : (i64) -> ()
      %9825 = arith.constant 7 : i64
      %9826 = func.call @cc_box_character(%9825) : (i64) -> i64
      func.call @stack_push_pointer(%9826) : (i64) -> ()
      %9827 = arith.constant 8 : i64
      %9828 = func.call @cc_box_character(%9827) : (i64) -> i64
      func.call @stack_push_pointer(%9828) : (i64) -> ()
      %9829 = arith.constant 9 : i64
      %9830 = func.call @cc_box_character(%9829) : (i64) -> i64
      func.call @stack_push_pointer(%9830) : (i64) -> ()
      %9831 = arith.constant 10 : i64
      %9832 = func.call @cc_box_character(%9831) : (i64) -> i64
      func.call @stack_push_pointer(%9832) : (i64) -> ()
      %9833 = arith.constant 11 : i64
      %9834 = func.call @cc_box_character(%9833) : (i64) -> i64
      func.call @stack_push_pointer(%9834) : (i64) -> ()
      %9835 = arith.constant 12 : i64
      %9836 = func.call @cc_box_character(%9835) : (i64) -> i64
      func.call @stack_push_pointer(%9836) : (i64) -> ()
      %9837 = arith.constant 13 : i64
      %9838 = func.call @cc_box_character(%9837) : (i64) -> i64
      func.call @stack_push_pointer(%9838) : (i64) -> ()
      %9839 = arith.constant 14 : i64
      %9840 = func.call @cc_box_character(%9839) : (i64) -> i64
      func.call @stack_push_pointer(%9840) : (i64) -> ()
      %9841 = arith.constant 15 : i64
      %9842 = func.call @cc_box_character(%9841) : (i64) -> i64
      func.call @stack_push_pointer(%9842) : (i64) -> ()
      %9843 = arith.constant 16 : i64
      %9844 = func.call @cc_box_character(%9843) : (i64) -> i64
      func.call @stack_push_pointer(%9844) : (i64) -> ()
      %9845 = arith.constant 17 : i64
      %9846 = func.call @cc_box_character(%9845) : (i64) -> i64
      func.call @stack_push_pointer(%9846) : (i64) -> ()
      %9847 = arith.constant 18 : i64
      %9848 = func.call @cc_box_character(%9847) : (i64) -> i64
      func.call @stack_push_pointer(%9848) : (i64) -> ()
      %9849 = arith.constant 19 : i64
      %9850 = func.call @cc_box_character(%9849) : (i64) -> i64
      func.call @stack_push_pointer(%9850) : (i64) -> ()
      %9851 = arith.constant 20 : i64
      %9852 = func.call @cc_box_character(%9851) : (i64) -> i64
      func.call @stack_push_pointer(%9852) : (i64) -> ()
      %9853 = arith.constant 21 : i64
      %9854 = func.call @cc_box_character(%9853) : (i64) -> i64
      func.call @stack_push_pointer(%9854) : (i64) -> ()
      %9855 = arith.constant 22 : i64
      %9856 = func.call @cc_box_character(%9855) : (i64) -> i64
      func.call @stack_push_pointer(%9856) : (i64) -> ()
      %9857 = arith.constant 23 : i64
      %9858 = func.call @cc_box_character(%9857) : (i64) -> i64
      func.call @stack_push_pointer(%9858) : (i64) -> ()
      %9859 = arith.constant 24 : i64
      %9860 = func.call @cc_box_character(%9859) : (i64) -> i64
      func.call @stack_push_pointer(%9860) : (i64) -> ()
      %9861 = arith.constant 25 : i64
      %9862 = func.call @cc_box_character(%9861) : (i64) -> i64
      func.call @stack_push_pointer(%9862) : (i64) -> ()
      %9863 = arith.constant 26 : i64
      %9864 = func.call @cc_box_character(%9863) : (i64) -> i64
      func.call @stack_push_pointer(%9864) : (i64) -> ()
      %9865 = arith.constant 27 : i64
      %9866 = func.call @cc_box_character(%9865) : (i64) -> i64
      func.call @stack_push_pointer(%9866) : (i64) -> ()
      %9867 = arith.constant 28 : i64
      %9868 = func.call @cc_box_character(%9867) : (i64) -> i64
      func.call @stack_push_pointer(%9868) : (i64) -> ()
      %9869 = arith.constant 29 : i64
      %9870 = func.call @cc_box_character(%9869) : (i64) -> i64
      func.call @stack_push_pointer(%9870) : (i64) -> ()
      %9871 = arith.constant 30 : i64
      %9872 = func.call @cc_box_character(%9871) : (i64) -> i64
      func.call @stack_push_pointer(%9872) : (i64) -> ()
      %9873 = arith.constant 31 : i64
      %9874 = func.call @cc_box_character(%9873) : (i64) -> i64
      func.call @stack_push_pointer(%9874) : (i64) -> ()
      %9875 = arith.constant 32 : i64
      %9876 = func.call @cc_box_character(%9875) : (i64) -> i64
      func.call @stack_push_pointer(%9876) : (i64) -> ()
      %9877 = arith.constant 127 : i64
      %9878 = func.call @cc_box_character(%9877) : (i64) -> i64
      func.call @stack_push_pointer(%9878) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9879 = func.call @stack_pop_pointer() : () -> i64
      %9880 = func.call @stack_pop_pointer() : () -> i64
      %9881 = func.call @cc_cons(%9880, %9879) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9881) : (i64) -> ()
      %9882 = func.call @stack_pop_pointer() : () -> i64
      %9883 = func.call @stack_pop_pointer() : () -> i64
      %9884 = func.call @cc_cons(%9883, %9882) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9884) : (i64) -> ()
      %9885 = func.call @stack_pop_pointer() : () -> i64
      %9886 = func.call @stack_pop_pointer() : () -> i64
      %9887 = func.call @cc_cons(%9886, %9885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9887) : (i64) -> ()
      %9888 = func.call @stack_pop_pointer() : () -> i64
      %9889 = func.call @stack_pop_pointer() : () -> i64
      %9890 = func.call @cc_cons(%9889, %9888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9890) : (i64) -> ()
      %9891 = func.call @stack_pop_pointer() : () -> i64
      %9892 = func.call @stack_pop_pointer() : () -> i64
      %9893 = func.call @cc_cons(%9892, %9891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9893) : (i64) -> ()
      %9894 = func.call @stack_pop_pointer() : () -> i64
      %9895 = func.call @stack_pop_pointer() : () -> i64
      %9896 = func.call @cc_cons(%9895, %9894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9896) : (i64) -> ()
      %9897 = func.call @stack_pop_pointer() : () -> i64
      %9898 = func.call @stack_pop_pointer() : () -> i64
      %9899 = func.call @cc_cons(%9898, %9897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9899) : (i64) -> ()
      %9900 = func.call @stack_pop_pointer() : () -> i64
      %9901 = func.call @stack_pop_pointer() : () -> i64
      %9902 = func.call @cc_cons(%9901, %9900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9902) : (i64) -> ()
      %9903 = func.call @stack_pop_pointer() : () -> i64
      %9904 = func.call @stack_pop_pointer() : () -> i64
      %9905 = func.call @cc_cons(%9904, %9903) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9905) : (i64) -> ()
      %9906 = func.call @stack_pop_pointer() : () -> i64
      %9907 = func.call @stack_pop_pointer() : () -> i64
      %9908 = func.call @cc_cons(%9907, %9906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9908) : (i64) -> ()
      %9909 = func.call @stack_pop_pointer() : () -> i64
      %9910 = func.call @stack_pop_pointer() : () -> i64
      %9911 = func.call @cc_cons(%9910, %9909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9911) : (i64) -> ()
      %9912 = func.call @stack_pop_pointer() : () -> i64
      %9913 = func.call @stack_pop_pointer() : () -> i64
      %9914 = func.call @cc_cons(%9913, %9912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9914) : (i64) -> ()
      %9915 = func.call @stack_pop_pointer() : () -> i64
      %9916 = func.call @stack_pop_pointer() : () -> i64
      %9917 = func.call @cc_cons(%9916, %9915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9917) : (i64) -> ()
      %9918 = func.call @stack_pop_pointer() : () -> i64
      %9919 = func.call @stack_pop_pointer() : () -> i64
      %9920 = func.call @cc_cons(%9919, %9918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9920) : (i64) -> ()
      %9921 = func.call @stack_pop_pointer() : () -> i64
      %9922 = func.call @stack_pop_pointer() : () -> i64
      %9923 = func.call @cc_cons(%9922, %9921) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9923) : (i64) -> ()
      %9924 = func.call @stack_pop_pointer() : () -> i64
      %9925 = func.call @stack_pop_pointer() : () -> i64
      %9926 = func.call @cc_cons(%9925, %9924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9926) : (i64) -> ()
      %9927 = func.call @stack_pop_pointer() : () -> i64
      %9928 = func.call @stack_pop_pointer() : () -> i64
      %9929 = func.call @cc_cons(%9928, %9927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9929) : (i64) -> ()
      %9930 = func.call @stack_pop_pointer() : () -> i64
      %9931 = func.call @stack_pop_pointer() : () -> i64
      %9932 = func.call @cc_cons(%9931, %9930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9932) : (i64) -> ()
      %9933 = func.call @stack_pop_pointer() : () -> i64
      %9934 = func.call @stack_pop_pointer() : () -> i64
      %9935 = func.call @cc_cons(%9934, %9933) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9935) : (i64) -> ()
      %9936 = func.call @stack_pop_pointer() : () -> i64
      %9937 = func.call @stack_pop_pointer() : () -> i64
      %9938 = func.call @cc_cons(%9937, %9936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9938) : (i64) -> ()
      %9939 = func.call @stack_pop_pointer() : () -> i64
      %9940 = func.call @stack_pop_pointer() : () -> i64
      %9941 = func.call @cc_cons(%9940, %9939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9941) : (i64) -> ()
      %9942 = func.call @stack_pop_pointer() : () -> i64
      %9943 = func.call @stack_pop_pointer() : () -> i64
      %9944 = func.call @cc_cons(%9943, %9942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9944) : (i64) -> ()
      %9945 = func.call @stack_pop_pointer() : () -> i64
      %9946 = func.call @stack_pop_pointer() : () -> i64
      %9947 = func.call @cc_cons(%9946, %9945) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9947) : (i64) -> ()
      %9948 = func.call @stack_pop_pointer() : () -> i64
      %9949 = func.call @stack_pop_pointer() : () -> i64
      %9950 = func.call @cc_cons(%9949, %9948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9950) : (i64) -> ()
      %9951 = func.call @stack_pop_pointer() : () -> i64
      %9952 = func.call @stack_pop_pointer() : () -> i64
      %9953 = func.call @cc_cons(%9952, %9951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9953) : (i64) -> ()
      %9954 = func.call @stack_pop_pointer() : () -> i64
      %9955 = func.call @stack_pop_pointer() : () -> i64
      %9956 = func.call @cc_cons(%9955, %9954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9956) : (i64) -> ()
      %9957 = func.call @stack_pop_pointer() : () -> i64
      %9958 = func.call @stack_pop_pointer() : () -> i64
      %9959 = func.call @cc_cons(%9958, %9957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9959) : (i64) -> ()
      %9960 = func.call @stack_pop_pointer() : () -> i64
      %9961 = func.call @stack_pop_pointer() : () -> i64
      %9962 = func.call @cc_cons(%9961, %9960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9962) : (i64) -> ()
      %9963 = func.call @stack_pop_pointer() : () -> i64
      %9964 = func.call @stack_pop_pointer() : () -> i64
      %9965 = func.call @cc_cons(%9964, %9963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9965) : (i64) -> ()
      %9966 = func.call @stack_pop_pointer() : () -> i64
      %9967 = func.call @stack_pop_pointer() : () -> i64
      %9968 = func.call @cc_cons(%9967, %9966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9968) : (i64) -> ()
      %9969 = func.call @stack_pop_pointer() : () -> i64
      %9970 = func.call @stack_pop_pointer() : () -> i64
      %9971 = func.call @cc_cons(%9970, %9969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9971) : (i64) -> ()
      %9972 = func.call @stack_pop_pointer() : () -> i64
      %9973 = func.call @stack_pop_pointer() : () -> i64
      %9974 = func.call @cc_cons(%9973, %9972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9974) : (i64) -> ()
      %9975 = func.call @stack_pop_pointer() : () -> i64
      %9976 = func.call @stack_pop_pointer() : () -> i64
      %9977 = func.call @cc_cons(%9976, %9975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9977) : (i64) -> ()
      %9978 = func.call @stack_pop_pointer() : () -> i64
      %9979 = func.call @stack_pop_pointer() : () -> i64
      %9980 = func.call @cc_cons(%9979, %9978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9980) : (i64) -> ()
      %9981 = func.call @stack_pop_pointer() : () -> i64
      %9982 = func.call @stack_pop_pointer() : () -> i64
      %9983 = func.call @cc_cons(%9982, %9981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9983) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9984 = func.call @stack_pop_pointer() : () -> i64
      %9985 = func.call @stack_pop_pointer() : () -> i64
      %9986 = func.call @cc_cons(%9985, %9984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9986) : (i64) -> ()
      %9987 = func.call @stack_pop_pointer() : () -> i64
      %9988 = func.call @stack_pop_pointer() : () -> i64
      %9989 = func.call @cc_cons(%9988, %9987) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9989) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %9990 = func.call @stack_pop_pointer() : () -> i64
      %9991 = func.call @stack_pop_pointer() : () -> i64
      %9992 = func.call @cc_cons(%9991, %9990) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9992) : (i64) -> ()
      %9993 = func.call @stack_pop_pointer() : () -> i64
      %9994 = func.call @stack_pop_pointer() : () -> i64
      %9995 = func.call @cc_cons(%9994, %9993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9995) : (i64) -> ()
      %9996 = func.call @stack_pop_pointer() : () -> i64
      %10388 = arith.constant 209815645192228 : i64
      %10389 = arith.constant 0 : i64
      %10390 = func.call @cc_make_closure(%10388, %10389) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10390) : (i64) -> ()
      %10391 = func.call @stack_pop_pointer() : () -> i64
      %10392 = llvm.mlir.addressof @str791 : !llvm.ptr
      %10393 = arith.constant 1 : i64
      %10394 = func.call @cc_make_string(%10392, %10393) : (!llvm.ptr, i64) -> i64
      %10395 = func.call @cc_nil_value() : () -> i64
      %10396 = func.call @cc_intern(%10394, %10395) : (i64, i64) -> i64
      %10397 = func.call @cc_nil_value() : () -> i64
      %10398 = func.call @cc_cons(%10396, %10397) : (i64, i64) -> i64
      %10399 = func.call @cc_values_pack(%10398) : (i64) -> i64
      func.call @stack_push_pointer(%10396) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10400 = func.call @stack_pop_pointer() : () -> i64
      %10401 = func.call @stack_pop_pointer() : () -> i64
      %10402 = func.call @cc_cons(%10401, %10400) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10402) : (i64) -> ()
      %10403 = func.call @stack_pop_pointer() : () -> i64
      %10404 = llvm.mlir.addressof @str792 : !llvm.ptr
      %10405 = arith.constant 11 : i64
      %10406 = func.call @cc_make_string(%10404, %10405) : (!llvm.ptr, i64) -> i64
      %10407 = llvm.mlir.addressof @str793 : !llvm.ptr
      %10408 = arith.constant 7 : i64
      %10409 = func.call @cc_make_string(%10407, %10408) : (!llvm.ptr, i64) -> i64
      %10410 = func.call @cc_intern(%10406, %10409) : (i64, i64) -> i64
      %10411 = func.call @cc_nil_value() : () -> i64
      %10412 = func.call @cc_cons(%10410, %10411) : (i64, i64) -> i64
      %10413 = func.call @cc_values_pack(%10412) : (i64) -> i64
      func.call @stack_push_pointer(%10410) : (i64) -> ()
      %10414 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10415 = func.call @stack_pop_pointer() : () -> i64
      %10416 = llvm.mlir.addressof @str794 : !llvm.ptr
      %10417 = arith.constant 4 : i64
      %10418 = func.call @cc_make_string(%10416, %10417) : (!llvm.ptr, i64) -> i64
      %10419 = llvm.mlir.addressof @str795 : !llvm.ptr
      %10420 = arith.constant 7 : i64
      %10421 = func.call @cc_make_string(%10419, %10420) : (!llvm.ptr, i64) -> i64
      %10422 = func.call @cc_intern(%10418, %10421) : (i64, i64) -> i64
      %10423 = func.call @cc_nil_value() : () -> i64
      %10424 = func.call @cc_cons(%10422, %10423) : (i64, i64) -> i64
      %10425 = func.call @cc_values_pack(%10424) : (i64) -> i64
      func.call @stack_push_pointer(%10422) : (i64) -> ()
      %10426 = func.call @stack_pop_pointer() : () -> i64
      %10427 = llvm.mlir.addressof @str796 : !llvm.ptr
      %10428 = arith.constant 6 : i64
      %10429 = func.call @cc_make_string(%10427, %10428) : (!llvm.ptr, i64) -> i64
      %10430 = func.call @cc_nil_value() : () -> i64
      %10431 = func.call @cc_intern(%10429, %10430) : (i64, i64) -> i64
      %10432 = func.call @cc_nil_value() : () -> i64
      %10433 = func.call @cc_cons(%10431, %10432) : (i64, i64) -> i64
      %10434 = func.call @cc_values_pack(%10433) : (i64) -> i64
      func.call @stack_push_pointer(%10431) : (i64) -> ()
      %10435 = func.call @stack_pop_pointer() : () -> i64
      %10436 = func.call @cc_nil_value() : () -> i64
      %10437 = func.call @cc_errorp(%9784) : (i64) -> i64
      %10438 = arith.cmpi ne, %10437, %10436 : i64
      %10439 = arith.cmpi eq, %10436, %10436 : i64
      %10440 = arith.andi %10438, %10439 : i1
      %10441 = scf.if %10440 -> (i64) {
        scf.yield %9784 : i64
      } else {
        scf.yield %10436 : i64
      }
      %10442 = func.call @cc_errorp(%9996) : (i64) -> i64
      %10443 = arith.cmpi ne, %10442, %10436 : i64
      %10444 = arith.cmpi eq, %10441, %10436 : i64
      %10445 = arith.andi %10443, %10444 : i1
      %10446 = scf.if %10445 -> (i64) {
        scf.yield %9996 : i64
      } else {
        scf.yield %10441 : i64
      }
      %10447 = func.call @cc_errorp(%10391) : (i64) -> i64
      %10448 = arith.cmpi ne, %10447, %10436 : i64
      %10449 = arith.cmpi eq, %10446, %10436 : i64
      %10450 = arith.andi %10448, %10449 : i1
      %10451 = scf.if %10450 -> (i64) {
        scf.yield %10391 : i64
      } else {
        scf.yield %10446 : i64
      }
      %10452 = func.call @cc_errorp(%10403) : (i64) -> i64
      %10453 = arith.cmpi ne, %10452, %10436 : i64
      %10454 = arith.cmpi eq, %10451, %10436 : i64
      %10455 = arith.andi %10453, %10454 : i1
      %10456 = scf.if %10455 -> (i64) {
        scf.yield %10403 : i64
      } else {
        scf.yield %10451 : i64
      }
      %10457 = func.call @cc_errorp(%10414) : (i64) -> i64
      %10458 = arith.cmpi ne, %10457, %10436 : i64
      %10459 = arith.cmpi eq, %10456, %10436 : i64
      %10460 = arith.andi %10458, %10459 : i1
      %10461 = scf.if %10460 -> (i64) {
        scf.yield %10414 : i64
      } else {
        scf.yield %10456 : i64
      }
      %10462 = func.call @cc_errorp(%10415) : (i64) -> i64
      %10463 = arith.cmpi ne, %10462, %10436 : i64
      %10464 = arith.cmpi eq, %10461, %10436 : i64
      %10465 = arith.andi %10463, %10464 : i1
      %10466 = scf.if %10465 -> (i64) {
        scf.yield %10415 : i64
      } else {
        scf.yield %10461 : i64
      }
      %10467 = func.call @cc_errorp(%10426) : (i64) -> i64
      %10468 = arith.cmpi ne, %10467, %10436 : i64
      %10469 = arith.cmpi eq, %10466, %10436 : i64
      %10470 = arith.andi %10468, %10469 : i1
      %10471 = scf.if %10470 -> (i64) {
        scf.yield %10426 : i64
      } else {
        scf.yield %10466 : i64
      }
      %10472 = func.call @cc_errorp(%10435) : (i64) -> i64
      %10473 = arith.cmpi ne, %10472, %10436 : i64
      %10474 = arith.cmpi eq, %10471, %10436 : i64
      %10475 = arith.andi %10473, %10474 : i1
      %10476 = scf.if %10475 -> (i64) {
        scf.yield %10435 : i64
      } else {
        scf.yield %10471 : i64
      }
      %10477 = arith.cmpi ne, %10476, %10436 : i64
      scf.if %10477 {
        func.call @stack_push_pointer(%10476) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9784) : (i64) -> ()
        func.call @stack_push_pointer(%9996) : (i64) -> ()
        func.call @stack_push_pointer(%10391) : (i64) -> ()
        func.call @stack_push_pointer(%10403) : (i64) -> ()
        func.call @stack_push_pointer(%10414) : (i64) -> ()
        func.call @stack_push_pointer(%10415) : (i64) -> ()
        func.call @stack_push_pointer(%10426) : (i64) -> ()
        func.call @stack_push_pointer(%10435) : (i64) -> ()
        %10478 = llvm.mlir.addressof @str797 : !llvm.ptr
        %10479 = func.call @cc_make_function_ref_const(%10478) : (!llvm.ptr) -> i64
        %10480 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10479, %10480) : (i64, i64) -> ()
      }
      %10481 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10481 : i64
    }
    %10482 = func.call @cc_nil_value() : () -> i64
    %10483 = func.call @cc_errorp(%9775) : (i64) -> i64
    %10484 = arith.cmpi ne, %10483, %10482 : i64
    %10485 = scf.if %10484 -> (i64) {
      scf.yield %9775 : i64
    } else {
      %10486 = llvm.mlir.addressof @str798 : !llvm.ptr
      %10487 = arith.constant 24 : i64
      %10488 = func.call @cc_make_string(%10486, %10487) : (!llvm.ptr, i64) -> i64
      %10489 = func.call @cc_nil_value() : () -> i64
      %10490 = func.call @cc_intern(%10488, %10489) : (i64, i64) -> i64
      %10491 = func.call @cc_nil_value() : () -> i64
      %10492 = func.call @cc_cons(%10490, %10491) : (i64, i64) -> i64
      %10493 = func.call @cc_values_pack(%10492) : (i64) -> i64
      func.call @stack_push_pointer(%10490) : (i64) -> ()
      %10494 = func.call @stack_pop_pointer() : () -> i64
      %10495 = llvm.mlir.addressof @str799 : !llvm.ptr
      %10496 = arith.constant 3 : i64
      %10497 = func.call @cc_make_string(%10495, %10496) : (!llvm.ptr, i64) -> i64
      %10498 = func.call @cc_nil_value() : () -> i64
      %10499 = func.call @cc_intern(%10497, %10498) : (i64, i64) -> i64
      %10500 = func.call @cc_nil_value() : () -> i64
      %10501 = func.call @cc_cons(%10499, %10500) : (i64, i64) -> i64
      %10502 = func.call @cc_values_pack(%10501) : (i64) -> i64
      func.call @stack_push_pointer(%10499) : (i64) -> ()
      %10503 = llvm.mlir.addressof @str800 : !llvm.ptr
      %10504 = arith.constant 3 : i64
      %10505 = func.call @cc_make_string(%10503, %10504) : (!llvm.ptr, i64) -> i64
      %10506 = func.call @cc_nil_value() : () -> i64
      %10507 = func.call @cc_intern(%10505, %10506) : (i64, i64) -> i64
      %10508 = func.call @cc_nil_value() : () -> i64
      %10509 = func.call @cc_cons(%10507, %10508) : (i64, i64) -> i64
      %10510 = func.call @cc_values_pack(%10509) : (i64) -> i64
      func.call @stack_push_pointer(%10507) : (i64) -> ()
      %10511 = llvm.mlir.addressof @str801 : !llvm.ptr
      %10512 = arith.constant 4 : i64
      %10513 = func.call @cc_make_string(%10511, %10512) : (!llvm.ptr, i64) -> i64
      %10514 = llvm.mlir.addressof @str802 : !llvm.ptr
      %10515 = arith.constant 11 : i64
      %10516 = func.call @cc_make_string(%10514, %10515) : (!llvm.ptr, i64) -> i64
      %10517 = func.call @cc_intern(%10513, %10516) : (i64, i64) -> i64
      %10518 = func.call @cc_nil_value() : () -> i64
      %10519 = func.call @cc_cons(%10517, %10518) : (i64, i64) -> i64
      %10520 = func.call @cc_values_pack(%10519) : (i64) -> i64
      func.call @stack_push_pointer(%10517) : (i64) -> ()
      %10521 = arith.constant 8 : i64
      %10522 = func.call @cc_box_character(%10521) : (i64) -> i64
      func.call @stack_push_pointer(%10522) : (i64) -> ()
      %10523 = arith.constant 9 : i64
      %10524 = func.call @cc_box_character(%10523) : (i64) -> i64
      func.call @stack_push_pointer(%10524) : (i64) -> ()
      %10525 = arith.constant 10 : i64
      %10526 = func.call @cc_box_character(%10525) : (i64) -> i64
      func.call @stack_push_pointer(%10526) : (i64) -> ()
      %10527 = arith.constant 10 : i64
      %10528 = func.call @cc_box_character(%10527) : (i64) -> i64
      func.call @stack_push_pointer(%10528) : (i64) -> ()
      %10529 = arith.constant 12 : i64
      %10530 = func.call @cc_box_character(%10529) : (i64) -> i64
      func.call @stack_push_pointer(%10530) : (i64) -> ()
      %10531 = arith.constant 13 : i64
      %10532 = func.call @cc_box_character(%10531) : (i64) -> i64
      func.call @stack_push_pointer(%10532) : (i64) -> ()
      %10533 = arith.constant 32 : i64
      %10534 = func.call @cc_box_character(%10533) : (i64) -> i64
      func.call @stack_push_pointer(%10534) : (i64) -> ()
      %10535 = arith.constant 8 : i64
      %10536 = func.call @cc_box_character(%10535) : (i64) -> i64
      func.call @stack_push_pointer(%10536) : (i64) -> ()
      %10537 = arith.constant 9 : i64
      %10538 = func.call @cc_box_character(%10537) : (i64) -> i64
      func.call @stack_push_pointer(%10538) : (i64) -> ()
      %10539 = arith.constant 10 : i64
      %10540 = func.call @cc_box_character(%10539) : (i64) -> i64
      func.call @stack_push_pointer(%10540) : (i64) -> ()
      %10541 = arith.constant 10 : i64
      %10542 = func.call @cc_box_character(%10541) : (i64) -> i64
      func.call @stack_push_pointer(%10542) : (i64) -> ()
      %10543 = arith.constant 12 : i64
      %10544 = func.call @cc_box_character(%10543) : (i64) -> i64
      func.call @stack_push_pointer(%10544) : (i64) -> ()
      %10545 = arith.constant 13 : i64
      %10546 = func.call @cc_box_character(%10545) : (i64) -> i64
      func.call @stack_push_pointer(%10546) : (i64) -> ()
      %10547 = arith.constant 32 : i64
      %10548 = func.call @cc_box_character(%10547) : (i64) -> i64
      func.call @stack_push_pointer(%10548) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10549 = func.call @stack_pop_pointer() : () -> i64
      %10550 = func.call @stack_pop_pointer() : () -> i64
      %10551 = func.call @cc_cons(%10550, %10549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10551) : (i64) -> ()
      %10552 = func.call @stack_pop_pointer() : () -> i64
      %10553 = func.call @stack_pop_pointer() : () -> i64
      %10554 = func.call @cc_cons(%10553, %10552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10554) : (i64) -> ()
      %10555 = func.call @stack_pop_pointer() : () -> i64
      %10556 = func.call @stack_pop_pointer() : () -> i64
      %10557 = func.call @cc_cons(%10556, %10555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10557) : (i64) -> ()
      %10558 = func.call @stack_pop_pointer() : () -> i64
      %10559 = func.call @stack_pop_pointer() : () -> i64
      %10560 = func.call @cc_cons(%10559, %10558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10560) : (i64) -> ()
      %10561 = func.call @stack_pop_pointer() : () -> i64
      %10562 = func.call @stack_pop_pointer() : () -> i64
      %10563 = func.call @cc_cons(%10562, %10561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10563) : (i64) -> ()
      %10564 = func.call @stack_pop_pointer() : () -> i64
      %10565 = func.call @stack_pop_pointer() : () -> i64
      %10566 = func.call @cc_cons(%10565, %10564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10566) : (i64) -> ()
      %10567 = func.call @stack_pop_pointer() : () -> i64
      %10568 = func.call @stack_pop_pointer() : () -> i64
      %10569 = func.call @cc_cons(%10568, %10567) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10569) : (i64) -> ()
      %10570 = func.call @stack_pop_pointer() : () -> i64
      %10571 = func.call @stack_pop_pointer() : () -> i64
      %10572 = func.call @cc_cons(%10571, %10570) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10572) : (i64) -> ()
      %10573 = func.call @stack_pop_pointer() : () -> i64
      %10574 = func.call @stack_pop_pointer() : () -> i64
      %10575 = func.call @cc_cons(%10574, %10573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10575) : (i64) -> ()
      %10576 = func.call @stack_pop_pointer() : () -> i64
      %10577 = func.call @stack_pop_pointer() : () -> i64
      %10578 = func.call @cc_cons(%10577, %10576) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10578) : (i64) -> ()
      %10579 = func.call @stack_pop_pointer() : () -> i64
      %10580 = func.call @stack_pop_pointer() : () -> i64
      %10581 = func.call @cc_cons(%10580, %10579) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10581) : (i64) -> ()
      %10582 = func.call @stack_pop_pointer() : () -> i64
      %10583 = func.call @stack_pop_pointer() : () -> i64
      %10584 = func.call @cc_cons(%10583, %10582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10584) : (i64) -> ()
      %10585 = func.call @stack_pop_pointer() : () -> i64
      %10586 = func.call @stack_pop_pointer() : () -> i64
      %10587 = func.call @cc_cons(%10586, %10585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10587) : (i64) -> ()
      %10588 = func.call @stack_pop_pointer() : () -> i64
      %10589 = func.call @stack_pop_pointer() : () -> i64
      %10590 = func.call @cc_cons(%10589, %10588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10590) : (i64) -> ()
      %10591 = func.call @stack_pop_pointer() : () -> i64
      %10592 = func.call @stack_pop_pointer() : () -> i64
      %10593 = func.call @cc_cons(%10592, %10591) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10593) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10594 = func.call @stack_pop_pointer() : () -> i64
      %10595 = func.call @stack_pop_pointer() : () -> i64
      %10596 = func.call @cc_cons(%10595, %10594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10596) : (i64) -> ()
      %10597 = func.call @stack_pop_pointer() : () -> i64
      %10598 = func.call @stack_pop_pointer() : () -> i64
      %10599 = func.call @cc_cons(%10598, %10597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10599) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10600 = func.call @stack_pop_pointer() : () -> i64
      %10601 = func.call @stack_pop_pointer() : () -> i64
      %10602 = func.call @cc_cons(%10601, %10600) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10602) : (i64) -> ()
      %10603 = func.call @stack_pop_pointer() : () -> i64
      %10604 = func.call @stack_pop_pointer() : () -> i64
      %10605 = func.call @cc_cons(%10604, %10603) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10605) : (i64) -> ()
      %10606 = func.call @stack_pop_pointer() : () -> i64
      %10778 = arith.constant 209815645192229 : i64
      %10779 = arith.constant 0 : i64
      %10780 = func.call @cc_make_closure(%10778, %10779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10780) : (i64) -> ()
      %10781 = func.call @stack_pop_pointer() : () -> i64
      %10782 = llvm.mlir.addressof @str803 : !llvm.ptr
      %10783 = arith.constant 1 : i64
      %10784 = func.call @cc_make_string(%10782, %10783) : (!llvm.ptr, i64) -> i64
      %10785 = func.call @cc_nil_value() : () -> i64
      %10786 = func.call @cc_intern(%10784, %10785) : (i64, i64) -> i64
      %10787 = func.call @cc_nil_value() : () -> i64
      %10788 = func.call @cc_cons(%10786, %10787) : (i64, i64) -> i64
      %10789 = func.call @cc_values_pack(%10788) : (i64) -> i64
      func.call @stack_push_pointer(%10786) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10790 = func.call @stack_pop_pointer() : () -> i64
      %10791 = func.call @stack_pop_pointer() : () -> i64
      %10792 = func.call @cc_cons(%10791, %10790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10792) : (i64) -> ()
      %10793 = func.call @stack_pop_pointer() : () -> i64
      %10794 = llvm.mlir.addressof @str804 : !llvm.ptr
      %10795 = arith.constant 11 : i64
      %10796 = func.call @cc_make_string(%10794, %10795) : (!llvm.ptr, i64) -> i64
      %10797 = llvm.mlir.addressof @str805 : !llvm.ptr
      %10798 = arith.constant 7 : i64
      %10799 = func.call @cc_make_string(%10797, %10798) : (!llvm.ptr, i64) -> i64
      %10800 = func.call @cc_intern(%10796, %10799) : (i64, i64) -> i64
      %10801 = func.call @cc_nil_value() : () -> i64
      %10802 = func.call @cc_cons(%10800, %10801) : (i64, i64) -> i64
      %10803 = func.call @cc_values_pack(%10802) : (i64) -> i64
      func.call @stack_push_pointer(%10800) : (i64) -> ()
      %10804 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %10805 = func.call @stack_pop_pointer() : () -> i64
      %10806 = llvm.mlir.addressof @str806 : !llvm.ptr
      %10807 = arith.constant 4 : i64
      %10808 = func.call @cc_make_string(%10806, %10807) : (!llvm.ptr, i64) -> i64
      %10809 = llvm.mlir.addressof @str807 : !llvm.ptr
      %10810 = arith.constant 7 : i64
      %10811 = func.call @cc_make_string(%10809, %10810) : (!llvm.ptr, i64) -> i64
      %10812 = func.call @cc_intern(%10808, %10811) : (i64, i64) -> i64
      %10813 = func.call @cc_nil_value() : () -> i64
      %10814 = func.call @cc_cons(%10812, %10813) : (i64, i64) -> i64
      %10815 = func.call @cc_values_pack(%10814) : (i64) -> i64
      func.call @stack_push_pointer(%10812) : (i64) -> ()
      %10816 = func.call @stack_pop_pointer() : () -> i64
      %10817 = llvm.mlir.addressof @str808 : !llvm.ptr
      %10818 = arith.constant 6 : i64
      %10819 = func.call @cc_make_string(%10817, %10818) : (!llvm.ptr, i64) -> i64
      %10820 = func.call @cc_nil_value() : () -> i64
      %10821 = func.call @cc_intern(%10819, %10820) : (i64, i64) -> i64
      %10822 = func.call @cc_nil_value() : () -> i64
      %10823 = func.call @cc_cons(%10821, %10822) : (i64, i64) -> i64
      %10824 = func.call @cc_values_pack(%10823) : (i64) -> i64
      func.call @stack_push_pointer(%10821) : (i64) -> ()
      %10825 = func.call @stack_pop_pointer() : () -> i64
      %10826 = func.call @cc_nil_value() : () -> i64
      %10827 = func.call @cc_errorp(%10494) : (i64) -> i64
      %10828 = arith.cmpi ne, %10827, %10826 : i64
      %10829 = arith.cmpi eq, %10826, %10826 : i64
      %10830 = arith.andi %10828, %10829 : i1
      %10831 = scf.if %10830 -> (i64) {
        scf.yield %10494 : i64
      } else {
        scf.yield %10826 : i64
      }
      %10832 = func.call @cc_errorp(%10606) : (i64) -> i64
      %10833 = arith.cmpi ne, %10832, %10826 : i64
      %10834 = arith.cmpi eq, %10831, %10826 : i64
      %10835 = arith.andi %10833, %10834 : i1
      %10836 = scf.if %10835 -> (i64) {
        scf.yield %10606 : i64
      } else {
        scf.yield %10831 : i64
      }
      %10837 = func.call @cc_errorp(%10781) : (i64) -> i64
      %10838 = arith.cmpi ne, %10837, %10826 : i64
      %10839 = arith.cmpi eq, %10836, %10826 : i64
      %10840 = arith.andi %10838, %10839 : i1
      %10841 = scf.if %10840 -> (i64) {
        scf.yield %10781 : i64
      } else {
        scf.yield %10836 : i64
      }
      %10842 = func.call @cc_errorp(%10793) : (i64) -> i64
      %10843 = arith.cmpi ne, %10842, %10826 : i64
      %10844 = arith.cmpi eq, %10841, %10826 : i64
      %10845 = arith.andi %10843, %10844 : i1
      %10846 = scf.if %10845 -> (i64) {
        scf.yield %10793 : i64
      } else {
        scf.yield %10841 : i64
      }
      %10847 = func.call @cc_errorp(%10804) : (i64) -> i64
      %10848 = arith.cmpi ne, %10847, %10826 : i64
      %10849 = arith.cmpi eq, %10846, %10826 : i64
      %10850 = arith.andi %10848, %10849 : i1
      %10851 = scf.if %10850 -> (i64) {
        scf.yield %10804 : i64
      } else {
        scf.yield %10846 : i64
      }
      %10852 = func.call @cc_errorp(%10805) : (i64) -> i64
      %10853 = arith.cmpi ne, %10852, %10826 : i64
      %10854 = arith.cmpi eq, %10851, %10826 : i64
      %10855 = arith.andi %10853, %10854 : i1
      %10856 = scf.if %10855 -> (i64) {
        scf.yield %10805 : i64
      } else {
        scf.yield %10851 : i64
      }
      %10857 = func.call @cc_errorp(%10816) : (i64) -> i64
      %10858 = arith.cmpi ne, %10857, %10826 : i64
      %10859 = arith.cmpi eq, %10856, %10826 : i64
      %10860 = arith.andi %10858, %10859 : i1
      %10861 = scf.if %10860 -> (i64) {
        scf.yield %10816 : i64
      } else {
        scf.yield %10856 : i64
      }
      %10862 = func.call @cc_errorp(%10825) : (i64) -> i64
      %10863 = arith.cmpi ne, %10862, %10826 : i64
      %10864 = arith.cmpi eq, %10861, %10826 : i64
      %10865 = arith.andi %10863, %10864 : i1
      %10866 = scf.if %10865 -> (i64) {
        scf.yield %10825 : i64
      } else {
        scf.yield %10861 : i64
      }
      %10867 = arith.cmpi ne, %10866, %10826 : i64
      scf.if %10867 {
        func.call @stack_push_pointer(%10866) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10494) : (i64) -> ()
        func.call @stack_push_pointer(%10606) : (i64) -> ()
        func.call @stack_push_pointer(%10781) : (i64) -> ()
        func.call @stack_push_pointer(%10793) : (i64) -> ()
        func.call @stack_push_pointer(%10804) : (i64) -> ()
        func.call @stack_push_pointer(%10805) : (i64) -> ()
        func.call @stack_push_pointer(%10816) : (i64) -> ()
        func.call @stack_push_pointer(%10825) : (i64) -> ()
        %10868 = llvm.mlir.addressof @str809 : !llvm.ptr
        %10869 = func.call @cc_make_function_ref_const(%10868) : (!llvm.ptr) -> i64
        %10870 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%10869, %10870) : (i64, i64) -> ()
      }
      %10871 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10871 : i64
    }
    %10872 = func.call @cc_nil_value() : () -> i64
    %10873 = func.call @cc_errorp(%10485) : (i64) -> i64
    %10874 = arith.cmpi ne, %10873, %10872 : i64
    %10875 = scf.if %10874 -> (i64) {
      scf.yield %10485 : i64
    } else {
      %10876 = llvm.mlir.addressof @str810 : !llvm.ptr
      %10877 = arith.constant 28 : i64
      %10878 = func.call @cc_make_string(%10876, %10877) : (!llvm.ptr, i64) -> i64
      %10879 = func.call @cc_nil_value() : () -> i64
      %10880 = func.call @cc_intern(%10878, %10879) : (i64, i64) -> i64
      %10881 = func.call @cc_nil_value() : () -> i64
      %10882 = func.call @cc_cons(%10880, %10881) : (i64, i64) -> i64
      %10883 = func.call @cc_values_pack(%10882) : (i64) -> i64
      func.call @stack_push_pointer(%10880) : (i64) -> ()
      %10884 = func.call @stack_pop_pointer() : () -> i64
      %10885 = llvm.mlir.addressof @str811 : !llvm.ptr
      %10886 = arith.constant 3 : i64
      %10887 = func.call @cc_make_string(%10885, %10886) : (!llvm.ptr, i64) -> i64
      %10888 = func.call @cc_nil_value() : () -> i64
      %10889 = func.call @cc_intern(%10887, %10888) : (i64, i64) -> i64
      %10890 = func.call @cc_nil_value() : () -> i64
      %10891 = func.call @cc_cons(%10889, %10890) : (i64, i64) -> i64
      %10892 = func.call @cc_values_pack(%10891) : (i64) -> i64
      func.call @stack_push_pointer(%10889) : (i64) -> ()
      %10893 = llvm.mlir.addressof @str812 : !llvm.ptr
      %10894 = arith.constant 3 : i64
      %10895 = func.call @cc_make_string(%10893, %10894) : (!llvm.ptr, i64) -> i64
      %10896 = func.call @cc_nil_value() : () -> i64
      %10897 = func.call @cc_intern(%10895, %10896) : (i64, i64) -> i64
      %10898 = func.call @cc_nil_value() : () -> i64
      %10899 = func.call @cc_cons(%10897, %10898) : (i64, i64) -> i64
      %10900 = func.call @cc_values_pack(%10899) : (i64) -> i64
      func.call @stack_push_pointer(%10897) : (i64) -> ()
      %10901 = llvm.mlir.addressof @str813 : !llvm.ptr
      %10902 = arith.constant 4 : i64
      %10903 = func.call @cc_make_string(%10901, %10902) : (!llvm.ptr, i64) -> i64
      %10904 = llvm.mlir.addressof @str814 : !llvm.ptr
      %10905 = arith.constant 11 : i64
      %10906 = func.call @cc_make_string(%10904, %10905) : (!llvm.ptr, i64) -> i64
      %10907 = func.call @cc_intern(%10903, %10906) : (i64, i64) -> i64
      %10908 = func.call @cc_nil_value() : () -> i64
      %10909 = func.call @cc_cons(%10907, %10908) : (i64, i64) -> i64
      %10910 = func.call @cc_values_pack(%10909) : (i64) -> i64
      func.call @stack_push_pointer(%10907) : (i64) -> ()
      %10911 = arith.constant 0 : i64
      %10912 = func.call @cc_box_character(%10911) : (i64) -> i64
      func.call @stack_push_pointer(%10912) : (i64) -> ()
      %10913 = arith.constant 7 : i64
      %10914 = func.call @cc_box_character(%10913) : (i64) -> i64
      func.call @stack_push_pointer(%10914) : (i64) -> ()
      %10915 = arith.constant 27 : i64
      %10916 = func.call @cc_box_character(%10915) : (i64) -> i64
      func.call @stack_push_pointer(%10916) : (i64) -> ()
      %10917 = arith.constant 127 : i64
      %10918 = func.call @cc_box_character(%10917) : (i64) -> i64
      func.call @stack_push_pointer(%10918) : (i64) -> ()
      %10919 = arith.constant 0 : i64
      %10920 = func.call @cc_box_character(%10919) : (i64) -> i64
      func.call @stack_push_pointer(%10920) : (i64) -> ()
      %10921 = arith.constant 7 : i64
      %10922 = func.call @cc_box_character(%10921) : (i64) -> i64
      func.call @stack_push_pointer(%10922) : (i64) -> ()
      %10923 = arith.constant 27 : i64
      %10924 = func.call @cc_box_character(%10923) : (i64) -> i64
      func.call @stack_push_pointer(%10924) : (i64) -> ()
      %10925 = arith.constant 127 : i64
      %10926 = func.call @cc_box_character(%10925) : (i64) -> i64
      func.call @stack_push_pointer(%10926) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10927 = func.call @stack_pop_pointer() : () -> i64
      %10928 = func.call @stack_pop_pointer() : () -> i64
      %10929 = func.call @cc_cons(%10928, %10927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10929) : (i64) -> ()
      %10930 = func.call @stack_pop_pointer() : () -> i64
      %10931 = func.call @stack_pop_pointer() : () -> i64
      %10932 = func.call @cc_cons(%10931, %10930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10932) : (i64) -> ()
      %10933 = func.call @stack_pop_pointer() : () -> i64
      %10934 = func.call @stack_pop_pointer() : () -> i64
      %10935 = func.call @cc_cons(%10934, %10933) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10935) : (i64) -> ()
      %10936 = func.call @stack_pop_pointer() : () -> i64
      %10937 = func.call @stack_pop_pointer() : () -> i64
      %10938 = func.call @cc_cons(%10937, %10936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10938) : (i64) -> ()
      %10939 = func.call @stack_pop_pointer() : () -> i64
      %10940 = func.call @stack_pop_pointer() : () -> i64
      %10941 = func.call @cc_cons(%10940, %10939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10941) : (i64) -> ()
      %10942 = func.call @stack_pop_pointer() : () -> i64
      %10943 = func.call @stack_pop_pointer() : () -> i64
      %10944 = func.call @cc_cons(%10943, %10942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10944) : (i64) -> ()
      %10945 = func.call @stack_pop_pointer() : () -> i64
      %10946 = func.call @stack_pop_pointer() : () -> i64
      %10947 = func.call @cc_cons(%10946, %10945) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10947) : (i64) -> ()
      %10948 = func.call @stack_pop_pointer() : () -> i64
      %10949 = func.call @stack_pop_pointer() : () -> i64
      %10950 = func.call @cc_cons(%10949, %10948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10950) : (i64) -> ()
      %10951 = func.call @stack_pop_pointer() : () -> i64
      %10952 = func.call @stack_pop_pointer() : () -> i64
      %10953 = func.call @cc_cons(%10952, %10951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10953) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10954 = func.call @stack_pop_pointer() : () -> i64
      %10955 = func.call @stack_pop_pointer() : () -> i64
      %10956 = func.call @cc_cons(%10955, %10954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10956) : (i64) -> ()
      %10957 = func.call @stack_pop_pointer() : () -> i64
      %10958 = func.call @stack_pop_pointer() : () -> i64
      %10959 = func.call @cc_cons(%10958, %10957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10959) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %10960 = func.call @stack_pop_pointer() : () -> i64
      %10961 = func.call @stack_pop_pointer() : () -> i64
      %10962 = func.call @cc_cons(%10961, %10960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10962) : (i64) -> ()
      %10963 = func.call @stack_pop_pointer() : () -> i64
      %10964 = func.call @stack_pop_pointer() : () -> i64
      %10965 = func.call @cc_cons(%10964, %10963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%10965) : (i64) -> ()
      %10966 = func.call @stack_pop_pointer() : () -> i64
      %11072 = arith.constant 209815645192230 : i64
      %11073 = arith.constant 0 : i64
      %11074 = func.call @cc_make_closure(%11072, %11073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11074) : (i64) -> ()
      %11075 = func.call @stack_pop_pointer() : () -> i64
      %11076 = llvm.mlir.addressof @str815 : !llvm.ptr
      %11077 = arith.constant 1 : i64
      %11078 = func.call @cc_make_string(%11076, %11077) : (!llvm.ptr, i64) -> i64
      %11079 = func.call @cc_nil_value() : () -> i64
      %11080 = func.call @cc_intern(%11078, %11079) : (i64, i64) -> i64
      %11081 = func.call @cc_nil_value() : () -> i64
      %11082 = func.call @cc_cons(%11080, %11081) : (i64, i64) -> i64
      %11083 = func.call @cc_values_pack(%11082) : (i64) -> i64
      func.call @stack_push_pointer(%11080) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %11084 = func.call @stack_pop_pointer() : () -> i64
      %11085 = func.call @stack_pop_pointer() : () -> i64
      %11086 = func.call @cc_cons(%11085, %11084) : (i64, i64) -> i64
      func.call @stack_push_pointer(%11086) : (i64) -> ()
      %11087 = func.call @stack_pop_pointer() : () -> i64
      %11088 = llvm.mlir.addressof @str816 : !llvm.ptr
      %11089 = arith.constant 11 : i64
      %11090 = func.call @cc_make_string(%11088, %11089) : (!llvm.ptr, i64) -> i64
      %11091 = llvm.mlir.addressof @str817 : !llvm.ptr
      %11092 = arith.constant 7 : i64
      %11093 = func.call @cc_make_string(%11091, %11092) : (!llvm.ptr, i64) -> i64
      %11094 = func.call @cc_intern(%11090, %11093) : (i64, i64) -> i64
      %11095 = func.call @cc_nil_value() : () -> i64
      %11096 = func.call @cc_cons(%11094, %11095) : (i64, i64) -> i64
      %11097 = func.call @cc_values_pack(%11096) : (i64) -> i64
      func.call @stack_push_pointer(%11094) : (i64) -> ()
      %11098 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %11099 = func.call @stack_pop_pointer() : () -> i64
      %11100 = llvm.mlir.addressof @str818 : !llvm.ptr
      %11101 = arith.constant 4 : i64
      %11102 = func.call @cc_make_string(%11100, %11101) : (!llvm.ptr, i64) -> i64
      %11103 = llvm.mlir.addressof @str819 : !llvm.ptr
      %11104 = arith.constant 7 : i64
      %11105 = func.call @cc_make_string(%11103, %11104) : (!llvm.ptr, i64) -> i64
      %11106 = func.call @cc_intern(%11102, %11105) : (i64, i64) -> i64
      %11107 = func.call @cc_nil_value() : () -> i64
      %11108 = func.call @cc_cons(%11106, %11107) : (i64, i64) -> i64
      %11109 = func.call @cc_values_pack(%11108) : (i64) -> i64
      func.call @stack_push_pointer(%11106) : (i64) -> ()
      %11110 = func.call @stack_pop_pointer() : () -> i64
      %11111 = llvm.mlir.addressof @str820 : !llvm.ptr
      %11112 = arith.constant 6 : i64
      %11113 = func.call @cc_make_string(%11111, %11112) : (!llvm.ptr, i64) -> i64
      %11114 = func.call @cc_nil_value() : () -> i64
      %11115 = func.call @cc_intern(%11113, %11114) : (i64, i64) -> i64
      %11116 = func.call @cc_nil_value() : () -> i64
      %11117 = func.call @cc_cons(%11115, %11116) : (i64, i64) -> i64
      %11118 = func.call @cc_values_pack(%11117) : (i64) -> i64
      func.call @stack_push_pointer(%11115) : (i64) -> ()
      %11119 = func.call @stack_pop_pointer() : () -> i64
      %11120 = func.call @cc_nil_value() : () -> i64
      %11121 = func.call @cc_errorp(%10884) : (i64) -> i64
      %11122 = arith.cmpi ne, %11121, %11120 : i64
      %11123 = arith.cmpi eq, %11120, %11120 : i64
      %11124 = arith.andi %11122, %11123 : i1
      %11125 = scf.if %11124 -> (i64) {
        scf.yield %10884 : i64
      } else {
        scf.yield %11120 : i64
      }
      %11126 = func.call @cc_errorp(%10966) : (i64) -> i64
      %11127 = arith.cmpi ne, %11126, %11120 : i64
      %11128 = arith.cmpi eq, %11125, %11120 : i64
      %11129 = arith.andi %11127, %11128 : i1
      %11130 = scf.if %11129 -> (i64) {
        scf.yield %10966 : i64
      } else {
        scf.yield %11125 : i64
      }
      %11131 = func.call @cc_errorp(%11075) : (i64) -> i64
      %11132 = arith.cmpi ne, %11131, %11120 : i64
      %11133 = arith.cmpi eq, %11130, %11120 : i64
      %11134 = arith.andi %11132, %11133 : i1
      %11135 = scf.if %11134 -> (i64) {
        scf.yield %11075 : i64
      } else {
        scf.yield %11130 : i64
      }
      %11136 = func.call @cc_errorp(%11087) : (i64) -> i64
      %11137 = arith.cmpi ne, %11136, %11120 : i64
      %11138 = arith.cmpi eq, %11135, %11120 : i64
      %11139 = arith.andi %11137, %11138 : i1
      %11140 = scf.if %11139 -> (i64) {
        scf.yield %11087 : i64
      } else {
        scf.yield %11135 : i64
      }
      %11141 = func.call @cc_errorp(%11098) : (i64) -> i64
      %11142 = arith.cmpi ne, %11141, %11120 : i64
      %11143 = arith.cmpi eq, %11140, %11120 : i64
      %11144 = arith.andi %11142, %11143 : i1
      %11145 = scf.if %11144 -> (i64) {
        scf.yield %11098 : i64
      } else {
        scf.yield %11140 : i64
      }
      %11146 = func.call @cc_errorp(%11099) : (i64) -> i64
      %11147 = arith.cmpi ne, %11146, %11120 : i64
      %11148 = arith.cmpi eq, %11145, %11120 : i64
      %11149 = arith.andi %11147, %11148 : i1
      %11150 = scf.if %11149 -> (i64) {
        scf.yield %11099 : i64
      } else {
        scf.yield %11145 : i64
      }
      %11151 = func.call @cc_errorp(%11110) : (i64) -> i64
      %11152 = arith.cmpi ne, %11151, %11120 : i64
      %11153 = arith.cmpi eq, %11150, %11120 : i64
      %11154 = arith.andi %11152, %11153 : i1
      %11155 = scf.if %11154 -> (i64) {
        scf.yield %11110 : i64
      } else {
        scf.yield %11150 : i64
      }
      %11156 = func.call @cc_errorp(%11119) : (i64) -> i64
      %11157 = arith.cmpi ne, %11156, %11120 : i64
      %11158 = arith.cmpi eq, %11155, %11120 : i64
      %11159 = arith.andi %11157, %11158 : i1
      %11160 = scf.if %11159 -> (i64) {
        scf.yield %11119 : i64
      } else {
        scf.yield %11155 : i64
      }
      %11161 = arith.cmpi ne, %11160, %11120 : i64
      scf.if %11161 {
        func.call @stack_push_pointer(%11160) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%10884) : (i64) -> ()
        func.call @stack_push_pointer(%10966) : (i64) -> ()
        func.call @stack_push_pointer(%11075) : (i64) -> ()
        func.call @stack_push_pointer(%11087) : (i64) -> ()
        func.call @stack_push_pointer(%11098) : (i64) -> ()
        func.call @stack_push_pointer(%11099) : (i64) -> ()
        func.call @stack_push_pointer(%11110) : (i64) -> ()
        func.call @stack_push_pointer(%11119) : (i64) -> ()
        %11162 = llvm.mlir.addressof @str821 : !llvm.ptr
        %11163 = func.call @cc_make_function_ref_const(%11162) : (!llvm.ptr) -> i64
        %11164 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%11163, %11164) : (i64, i64) -> ()
      }
      %11165 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11165 : i64
    }
    func.call @stack_push_pointer(%10875) : (i64) -> ()
    %11166 = func.call @stack_pop_pointer() : () -> i64
    %11167 = func.call @cc_multiple_value_list(%11166) : (i64) -> i64
    %11168 = llvm.mlir.addressof @str822 : !llvm.ptr
    %11169 = arith.constant 38 : i64
    %11170 = func.call @cc_make_string(%11168, %11169) : (!llvm.ptr, i64) -> i64
    %11171 = func.call @cc_nil_value() : () -> i64
    %11172 = func.call @cc_intern(%11170, %11171) : (i64, i64) -> i64
    %11173 = func.call @cc_nil_value() : () -> i64
    %11174 = func.call @cc_cons(%11172, %11173) : (i64, i64) -> i64
    %11175 = func.call @cc_values_pack(%11174) : (i64) -> i64
    %11176 = func.call @cc_symbol_value(%11172) : (i64) -> i64
    %11177 = llvm.mlir.addressof @str823 : !llvm.ptr
    %11178 = arith.constant 40 : i64
    %11179 = func.call @cc_make_string(%11177, %11178) : (!llvm.ptr, i64) -> i64
    %11180 = func.call @cc_nil_value() : () -> i64
    %11181 = func.call @cc_intern(%11179, %11180) : (i64, i64) -> i64
    %11182 = func.call @cc_nil_value() : () -> i64
    %11183 = func.call @cc_cons(%11181, %11182) : (i64, i64) -> i64
    %11184 = func.call @cc_values_pack(%11183) : (i64) -> i64
    %11185 = func.call @cc_symbol_value(%11181) : (i64) -> i64
    %11186 = func.call @cc_nil_value() : () -> i64
    %11187 = arith.cmpi ne, %11176, %11186 : i64
    %11188 = scf.if %11187 -> (i64) {
      scf.yield %11185 : i64
    } else {
      scf.yield %11167 : i64
    }
    %11189 = func.call @cc_values_pack(%11188) : (i64) -> i64
    func.call @stack_push_pointer(%11189) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_209815645192193"() {
    %83 = func.call @cc_nil_value() : () -> i64
    %84 = func.call @cc_nil_value() : () -> i64
    %85 = func.call @cc_errorp(%83) : (i64) -> i64
    %86 = arith.cmpi ne, %85, %84 : i64
    %87 = scf.if %86 -> (i64) {
      scf.yield %83 : i64
    } else {
      %88 = arith.constant 36 : i64
      %89 = func.call @cc_box_character(%88) : (i64) -> i64
      func.call @stack_push_pointer(%89) : (i64) -> ()
      %90 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %91 = func.call @stack_pop_pointer() : () -> i64
      %92 = func.call @cc_cons(%90, %91) : (i64, i64) -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      %93 = func.call @stack_pop_pointer() : () -> i64
      %94 = func.call @cc_values_pack(%93) : (i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %95 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %95 : i64
    }
    func.call @stack_push_pointer(%87) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192194"() {
    %266 = func.call @cc_nil_value() : () -> i64
    %267 = func.call @cc_nil_value() : () -> i64
    %268 = func.call @cc_errorp(%266) : (i64) -> i64
    %269 = arith.cmpi ne, %268, %267 : i64
    %270 = scf.if %269 -> (i64) {
      scf.yield %266 : i64
    } else {
      %271 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %272 = func.call @cc_nil_value() : () -> i64
      %273 = func.call @cc_nil_value() : () -> i64
      %274 = func.call @cc_errorp(%272) : (i64) -> i64
      %275 = arith.cmpi ne, %274, %273 : i64
      %276 = scf.if %275 -> (i64) {
        scf.yield %272 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %277 = func.call @cc_nil_value() : () -> i64
        %278 = arith.cmpi ne, %277, %277 : i64
        scf.if %278 {
          func.call @stack_push_pointer(%277) : (i64) -> ()
        } else {
          %279 = llvm.mlir.addressof @str22 : !llvm.ptr
          %280 = func.call @cc_make_function_ref_const(%279) : (!llvm.ptr) -> i64
          %281 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%280, %281) : (i64, i64) -> ()
        }
        %282 = func.call @stack_pop_pointer() : () -> i64
        %283 = func.call @cc_errorp(%282) : (i64) -> i64
        %284 = func.call @cc_nil_value() : () -> i64
        %285 = arith.cmpi ne, %283, %284 : i64
        scf.if %285 {
          func.call @stack_push_pointer(%282) : (i64) -> ()
        } else {
          %286 = func.call @cc_multiple_value_list(%282) : (i64) -> i64
          func.call @stack_push_pointer(%286) : (i64) -> ()
        }
        %287 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %288 = func.call @stack_pop_pointer() : () -> i64
        %289 = func.call @cc_nil_value() : () -> i64
        %290 = func.call @cc_maybe_error_from_multiple_value_list(%287) : (i64) -> i64
        %291 = func.call @cc_errorp(%290) : (i64) -> i64
        %292 = arith.cmpi ne, %291, %289 : i64
        %293 = arith.cmpi eq, %289, %289 : i64
        %294 = arith.andi %292, %293 : i1
        %295 = scf.if %294 -> (i64) {
          scf.yield %290 : i64
        } else {
          scf.yield %289 : i64
        }
        %296 = arith.cmpi ne, %295, %289 : i64
        scf.if %296 {
          func.call @stack_push_pointer(%295) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %297 = func.call @stack_pop_pointer() : () -> i64
          %298 = func.call @cc_cons(%288, %297) : (i64, i64) -> i64
          func.call @stack_push_pointer(%298) : (i64) -> ()
          %299 = func.call @stack_pop_pointer() : () -> i64
          %300 = func.call @cc_cons(%287, %299) : (i64, i64) -> i64
          func.call @stack_push_pointer(%300) : (i64) -> ()
          %301 = func.call @stack_pop_pointer() : () -> i64
          %302 = func.call @cc_values_pack(%301) : (i64) -> i64
          func.call @stack_push_pointer(%302) : (i64) -> ()
        }
        %303 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %303 : i64
      }
      func.call @stack_push_pointer(%276) : (i64) -> ()
      %304 = func.call @stack_pop_pointer() : () -> i64
      %305 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %306 = func.call @cc_errorp(%304) : (i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = arith.cmpi ne, %306, %307 : i64
      scf.if %308 {
        %309 = func.call @cc_condition_value(%304) : (i64) -> i64
        %310 = func.call @cc_values2(%307, %309) : (i64, i64) -> i64
        func.call @stack_push_pointer(%310) : (i64) -> ()
      } else {
        %311 = func.call @cc_multiple_value_list(%304) : (i64) -> i64
        %312 = func.call @cc_values_pack(%311) : (i64) -> i64
        func.call @stack_push_pointer(%312) : (i64) -> ()
      }
      %313 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %313 : i64
    }
    func.call @stack_push_pointer(%270) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192195"() {
    %495 = func.call @cc_nil_value() : () -> i64
    %496 = func.call @cc_nil_value() : () -> i64
    %497 = func.call @cc_errorp(%495) : (i64) -> i64
    %498 = arith.cmpi ne, %497, %496 : i64
    %499 = scf.if %498 -> (i64) {
      scf.yield %495 : i64
    } else {
      %500 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %501 = func.call @cc_nil_value() : () -> i64
      %502 = func.call @cc_nil_value() : () -> i64
      %503 = func.call @cc_errorp(%501) : (i64) -> i64
      %504 = arith.cmpi ne, %503, %502 : i64
      %505 = scf.if %504 -> (i64) {
        scf.yield %501 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %506 = func.call @cc_nil_value() : () -> i64
        %507 = arith.cmpi ne, %506, %506 : i64
        scf.if %507 {
          func.call @stack_push_pointer(%506) : (i64) -> ()
        } else {
          %508 = llvm.mlir.addressof @str39 : !llvm.ptr
          %509 = func.call @cc_make_function_ref_const(%508) : (!llvm.ptr) -> i64
          %510 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%509, %510) : (i64, i64) -> ()
        }
        %511 = func.call @stack_pop_pointer() : () -> i64
        %512 = func.call @cc_errorp(%511) : (i64) -> i64
        %513 = func.call @cc_nil_value() : () -> i64
        %514 = arith.cmpi ne, %512, %513 : i64
        scf.if %514 {
          func.call @stack_push_pointer(%511) : (i64) -> ()
        } else {
          %515 = func.call @cc_multiple_value_list(%511) : (i64) -> i64
          func.call @stack_push_pointer(%515) : (i64) -> ()
        }
        %516 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %517 = func.call @stack_pop_pointer() : () -> i64
        %518 = func.call @cc_nil_value() : () -> i64
        %519 = func.call @cc_maybe_error_from_multiple_value_list(%516) : (i64) -> i64
        %520 = func.call @cc_errorp(%519) : (i64) -> i64
        %521 = arith.cmpi ne, %520, %518 : i64
        %522 = arith.cmpi eq, %518, %518 : i64
        %523 = arith.andi %521, %522 : i1
        %524 = scf.if %523 -> (i64) {
          scf.yield %519 : i64
        } else {
          scf.yield %518 : i64
        }
        %525 = arith.cmpi ne, %524, %518 : i64
        scf.if %525 {
          func.call @stack_push_pointer(%524) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %526 = func.call @stack_pop_pointer() : () -> i64
          %527 = func.call @cc_cons(%517, %526) : (i64, i64) -> i64
          func.call @stack_push_pointer(%527) : (i64) -> ()
          %528 = func.call @stack_pop_pointer() : () -> i64
          %529 = func.call @cc_cons(%516, %528) : (i64, i64) -> i64
          func.call @stack_push_pointer(%529) : (i64) -> ()
          %530 = func.call @stack_pop_pointer() : () -> i64
          %531 = func.call @cc_values_pack(%530) : (i64) -> i64
          func.call @stack_push_pointer(%531) : (i64) -> ()
        }
        %532 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %532 : i64
      }
      func.call @stack_push_pointer(%505) : (i64) -> ()
      %533 = func.call @stack_pop_pointer() : () -> i64
      %534 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %535 = func.call @cc_errorp(%533) : (i64) -> i64
      %536 = func.call @cc_nil_value() : () -> i64
      %537 = arith.cmpi ne, %535, %536 : i64
      scf.if %537 {
        %538 = func.call @cc_condition_value(%533) : (i64) -> i64
        %539 = func.call @cc_values2(%536, %538) : (i64, i64) -> i64
        func.call @stack_push_pointer(%539) : (i64) -> ()
      } else {
        %540 = func.call @cc_multiple_value_list(%533) : (i64) -> i64
        %541 = func.call @cc_values_pack(%540) : (i64) -> i64
        func.call @stack_push_pointer(%541) : (i64) -> ()
      }
      %542 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %542 : i64
    }
    func.call @stack_push_pointer(%499) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192196"() {
    %724 = func.call @cc_nil_value() : () -> i64
    %725 = func.call @cc_nil_value() : () -> i64
    %726 = func.call @cc_errorp(%724) : (i64) -> i64
    %727 = arith.cmpi ne, %726, %725 : i64
    %728 = scf.if %727 -> (i64) {
      scf.yield %724 : i64
    } else {
      %729 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %730 = func.call @cc_nil_value() : () -> i64
      %731 = func.call @cc_nil_value() : () -> i64
      %732 = func.call @cc_errorp(%730) : (i64) -> i64
      %733 = arith.cmpi ne, %732, %731 : i64
      %734 = scf.if %733 -> (i64) {
        scf.yield %730 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %735 = func.call @cc_nil_value() : () -> i64
        %736 = arith.cmpi ne, %735, %735 : i64
        scf.if %736 {
          func.call @stack_push_pointer(%735) : (i64) -> ()
        } else {
          %737 = llvm.mlir.addressof @str56 : !llvm.ptr
          %738 = func.call @cc_make_function_ref_const(%737) : (!llvm.ptr) -> i64
          %739 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%738, %739) : (i64, i64) -> ()
        }
        %740 = func.call @stack_pop_pointer() : () -> i64
        %741 = func.call @cc_errorp(%740) : (i64) -> i64
        %742 = func.call @cc_nil_value() : () -> i64
        %743 = arith.cmpi ne, %741, %742 : i64
        scf.if %743 {
          func.call @stack_push_pointer(%740) : (i64) -> ()
        } else {
          %744 = func.call @cc_multiple_value_list(%740) : (i64) -> i64
          func.call @stack_push_pointer(%744) : (i64) -> ()
        }
        %745 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %746 = func.call @stack_pop_pointer() : () -> i64
        %747 = func.call @cc_nil_value() : () -> i64
        %748 = func.call @cc_maybe_error_from_multiple_value_list(%745) : (i64) -> i64
        %749 = func.call @cc_errorp(%748) : (i64) -> i64
        %750 = arith.cmpi ne, %749, %747 : i64
        %751 = arith.cmpi eq, %747, %747 : i64
        %752 = arith.andi %750, %751 : i1
        %753 = scf.if %752 -> (i64) {
          scf.yield %748 : i64
        } else {
          scf.yield %747 : i64
        }
        %754 = arith.cmpi ne, %753, %747 : i64
        scf.if %754 {
          func.call @stack_push_pointer(%753) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %755 = func.call @stack_pop_pointer() : () -> i64
          %756 = func.call @cc_cons(%746, %755) : (i64, i64) -> i64
          func.call @stack_push_pointer(%756) : (i64) -> ()
          %757 = func.call @stack_pop_pointer() : () -> i64
          %758 = func.call @cc_cons(%745, %757) : (i64, i64) -> i64
          func.call @stack_push_pointer(%758) : (i64) -> ()
          %759 = func.call @stack_pop_pointer() : () -> i64
          %760 = func.call @cc_values_pack(%759) : (i64) -> i64
          func.call @stack_push_pointer(%760) : (i64) -> ()
        }
        %761 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %761 : i64
      }
      func.call @stack_push_pointer(%734) : (i64) -> ()
      %762 = func.call @stack_pop_pointer() : () -> i64
      %763 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %764 = func.call @cc_errorp(%762) : (i64) -> i64
      %765 = func.call @cc_nil_value() : () -> i64
      %766 = arith.cmpi ne, %764, %765 : i64
      scf.if %766 {
        %767 = func.call @cc_condition_value(%762) : (i64) -> i64
        %768 = func.call @cc_values2(%765, %767) : (i64, i64) -> i64
        func.call @stack_push_pointer(%768) : (i64) -> ()
      } else {
        %769 = func.call @cc_multiple_value_list(%762) : (i64) -> i64
        %770 = func.call @cc_values_pack(%769) : (i64) -> i64
        func.call @stack_push_pointer(%770) : (i64) -> ()
      }
      %771 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %771 : i64
    }
    func.call @stack_push_pointer(%728) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192197"() {
    %953 = func.call @cc_nil_value() : () -> i64
    %954 = func.call @cc_nil_value() : () -> i64
    %955 = func.call @cc_errorp(%953) : (i64) -> i64
    %956 = arith.cmpi ne, %955, %954 : i64
    %957 = scf.if %956 -> (i64) {
      scf.yield %953 : i64
    } else {
      %958 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %959 = func.call @cc_nil_value() : () -> i64
      %960 = func.call @cc_nil_value() : () -> i64
      %961 = func.call @cc_errorp(%959) : (i64) -> i64
      %962 = arith.cmpi ne, %961, %960 : i64
      %963 = scf.if %962 -> (i64) {
        scf.yield %959 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %964 = func.call @cc_nil_value() : () -> i64
        %965 = arith.cmpi ne, %964, %964 : i64
        scf.if %965 {
          func.call @stack_push_pointer(%964) : (i64) -> ()
        } else {
          %966 = llvm.mlir.addressof @str73 : !llvm.ptr
          %967 = func.call @cc_make_function_ref_const(%966) : (!llvm.ptr) -> i64
          %968 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%967, %968) : (i64, i64) -> ()
        }
        %969 = func.call @stack_pop_pointer() : () -> i64
        %970 = func.call @cc_errorp(%969) : (i64) -> i64
        %971 = func.call @cc_nil_value() : () -> i64
        %972 = arith.cmpi ne, %970, %971 : i64
        scf.if %972 {
          func.call @stack_push_pointer(%969) : (i64) -> ()
        } else {
          %973 = func.call @cc_multiple_value_list(%969) : (i64) -> i64
          func.call @stack_push_pointer(%973) : (i64) -> ()
        }
        %974 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %975 = func.call @stack_pop_pointer() : () -> i64
        %976 = func.call @cc_nil_value() : () -> i64
        %977 = func.call @cc_maybe_error_from_multiple_value_list(%974) : (i64) -> i64
        %978 = func.call @cc_errorp(%977) : (i64) -> i64
        %979 = arith.cmpi ne, %978, %976 : i64
        %980 = arith.cmpi eq, %976, %976 : i64
        %981 = arith.andi %979, %980 : i1
        %982 = scf.if %981 -> (i64) {
          scf.yield %977 : i64
        } else {
          scf.yield %976 : i64
        }
        %983 = arith.cmpi ne, %982, %976 : i64
        scf.if %983 {
          func.call @stack_push_pointer(%982) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %984 = func.call @stack_pop_pointer() : () -> i64
          %985 = func.call @cc_cons(%975, %984) : (i64, i64) -> i64
          func.call @stack_push_pointer(%985) : (i64) -> ()
          %986 = func.call @stack_pop_pointer() : () -> i64
          %987 = func.call @cc_cons(%974, %986) : (i64, i64) -> i64
          func.call @stack_push_pointer(%987) : (i64) -> ()
          %988 = func.call @stack_pop_pointer() : () -> i64
          %989 = func.call @cc_values_pack(%988) : (i64) -> i64
          func.call @stack_push_pointer(%989) : (i64) -> ()
        }
        %990 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %990 : i64
      }
      func.call @stack_push_pointer(%963) : (i64) -> ()
      %991 = func.call @stack_pop_pointer() : () -> i64
      %992 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %993 = func.call @cc_errorp(%991) : (i64) -> i64
      %994 = func.call @cc_nil_value() : () -> i64
      %995 = arith.cmpi ne, %993, %994 : i64
      scf.if %995 {
        %996 = func.call @cc_condition_value(%991) : (i64) -> i64
        %997 = func.call @cc_values2(%994, %996) : (i64, i64) -> i64
        func.call @stack_push_pointer(%997) : (i64) -> ()
      } else {
        %998 = func.call @cc_multiple_value_list(%991) : (i64) -> i64
        %999 = func.call @cc_values_pack(%998) : (i64) -> i64
        func.call @stack_push_pointer(%999) : (i64) -> ()
      }
      %1000 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1000 : i64
    }
    func.call @stack_push_pointer(%957) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192198"() {
    %1182 = func.call @cc_nil_value() : () -> i64
    %1183 = func.call @cc_nil_value() : () -> i64
    %1184 = func.call @cc_errorp(%1182) : (i64) -> i64
    %1185 = arith.cmpi ne, %1184, %1183 : i64
    %1186 = scf.if %1185 -> (i64) {
      scf.yield %1182 : i64
    } else {
      %1187 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1188 = func.call @cc_nil_value() : () -> i64
      %1189 = func.call @cc_nil_value() : () -> i64
      %1190 = func.call @cc_errorp(%1188) : (i64) -> i64
      %1191 = arith.cmpi ne, %1190, %1189 : i64
      %1192 = scf.if %1191 -> (i64) {
        scf.yield %1188 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1193 = func.call @cc_nil_value() : () -> i64
        %1194 = arith.cmpi ne, %1193, %1193 : i64
        scf.if %1194 {
          func.call @stack_push_pointer(%1193) : (i64) -> ()
        } else {
          %1195 = llvm.mlir.addressof @str90 : !llvm.ptr
          %1196 = func.call @cc_make_function_ref_const(%1195) : (!llvm.ptr) -> i64
          %1197 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1196, %1197) : (i64, i64) -> ()
        }
        %1198 = func.call @stack_pop_pointer() : () -> i64
        %1199 = func.call @cc_errorp(%1198) : (i64) -> i64
        %1200 = func.call @cc_nil_value() : () -> i64
        %1201 = arith.cmpi ne, %1199, %1200 : i64
        scf.if %1201 {
          func.call @stack_push_pointer(%1198) : (i64) -> ()
        } else {
          %1202 = func.call @cc_multiple_value_list(%1198) : (i64) -> i64
          func.call @stack_push_pointer(%1202) : (i64) -> ()
        }
        %1203 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1204 = func.call @stack_pop_pointer() : () -> i64
        %1205 = func.call @cc_nil_value() : () -> i64
        %1206 = func.call @cc_maybe_error_from_multiple_value_list(%1203) : (i64) -> i64
        %1207 = func.call @cc_errorp(%1206) : (i64) -> i64
        %1208 = arith.cmpi ne, %1207, %1205 : i64
        %1209 = arith.cmpi eq, %1205, %1205 : i64
        %1210 = arith.andi %1208, %1209 : i1
        %1211 = scf.if %1210 -> (i64) {
          scf.yield %1206 : i64
        } else {
          scf.yield %1205 : i64
        }
        %1212 = arith.cmpi ne, %1211, %1205 : i64
        scf.if %1212 {
          func.call @stack_push_pointer(%1211) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1213 = func.call @stack_pop_pointer() : () -> i64
          %1214 = func.call @cc_cons(%1204, %1213) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1214) : (i64) -> ()
          %1215 = func.call @stack_pop_pointer() : () -> i64
          %1216 = func.call @cc_cons(%1203, %1215) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1216) : (i64) -> ()
          %1217 = func.call @stack_pop_pointer() : () -> i64
          %1218 = func.call @cc_values_pack(%1217) : (i64) -> i64
          func.call @stack_push_pointer(%1218) : (i64) -> ()
        }
        %1219 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1219 : i64
      }
      func.call @stack_push_pointer(%1192) : (i64) -> ()
      %1220 = func.call @stack_pop_pointer() : () -> i64
      %1221 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1222 = func.call @cc_errorp(%1220) : (i64) -> i64
      %1223 = func.call @cc_nil_value() : () -> i64
      %1224 = arith.cmpi ne, %1222, %1223 : i64
      scf.if %1224 {
        %1225 = func.call @cc_condition_value(%1220) : (i64) -> i64
        %1226 = func.call @cc_values2(%1223, %1225) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1226) : (i64) -> ()
      } else {
        %1227 = func.call @cc_multiple_value_list(%1220) : (i64) -> i64
        %1228 = func.call @cc_values_pack(%1227) : (i64) -> i64
        func.call @stack_push_pointer(%1228) : (i64) -> ()
      }
      %1229 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1229 : i64
    }
    func.call @stack_push_pointer(%1186) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192199"() {
    %1411 = func.call @cc_nil_value() : () -> i64
    %1412 = func.call @cc_nil_value() : () -> i64
    %1413 = func.call @cc_errorp(%1411) : (i64) -> i64
    %1414 = arith.cmpi ne, %1413, %1412 : i64
    %1415 = scf.if %1414 -> (i64) {
      scf.yield %1411 : i64
    } else {
      %1416 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1417 = func.call @cc_nil_value() : () -> i64
      %1418 = func.call @cc_nil_value() : () -> i64
      %1419 = func.call @cc_errorp(%1417) : (i64) -> i64
      %1420 = arith.cmpi ne, %1419, %1418 : i64
      %1421 = scf.if %1420 -> (i64) {
        scf.yield %1417 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1422 = func.call @cc_nil_value() : () -> i64
        %1423 = arith.cmpi ne, %1422, %1422 : i64
        scf.if %1423 {
          func.call @stack_push_pointer(%1422) : (i64) -> ()
        } else {
          %1424 = llvm.mlir.addressof @str107 : !llvm.ptr
          %1425 = func.call @cc_make_function_ref_const(%1424) : (!llvm.ptr) -> i64
          %1426 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1425, %1426) : (i64, i64) -> ()
        }
        %1427 = func.call @stack_pop_pointer() : () -> i64
        %1428 = func.call @cc_errorp(%1427) : (i64) -> i64
        %1429 = func.call @cc_nil_value() : () -> i64
        %1430 = arith.cmpi ne, %1428, %1429 : i64
        scf.if %1430 {
          func.call @stack_push_pointer(%1427) : (i64) -> ()
        } else {
          %1431 = func.call @cc_multiple_value_list(%1427) : (i64) -> i64
          func.call @stack_push_pointer(%1431) : (i64) -> ()
        }
        %1432 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1433 = func.call @stack_pop_pointer() : () -> i64
        %1434 = func.call @cc_nil_value() : () -> i64
        %1435 = func.call @cc_maybe_error_from_multiple_value_list(%1432) : (i64) -> i64
        %1436 = func.call @cc_errorp(%1435) : (i64) -> i64
        %1437 = arith.cmpi ne, %1436, %1434 : i64
        %1438 = arith.cmpi eq, %1434, %1434 : i64
        %1439 = arith.andi %1437, %1438 : i1
        %1440 = scf.if %1439 -> (i64) {
          scf.yield %1435 : i64
        } else {
          scf.yield %1434 : i64
        }
        %1441 = arith.cmpi ne, %1440, %1434 : i64
        scf.if %1441 {
          func.call @stack_push_pointer(%1440) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1442 = func.call @stack_pop_pointer() : () -> i64
          %1443 = func.call @cc_cons(%1433, %1442) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1443) : (i64) -> ()
          %1444 = func.call @stack_pop_pointer() : () -> i64
          %1445 = func.call @cc_cons(%1432, %1444) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1445) : (i64) -> ()
          %1446 = func.call @stack_pop_pointer() : () -> i64
          %1447 = func.call @cc_values_pack(%1446) : (i64) -> i64
          func.call @stack_push_pointer(%1447) : (i64) -> ()
        }
        %1448 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1448 : i64
      }
      func.call @stack_push_pointer(%1421) : (i64) -> ()
      %1449 = func.call @stack_pop_pointer() : () -> i64
      %1450 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1451 = func.call @cc_errorp(%1449) : (i64) -> i64
      %1452 = func.call @cc_nil_value() : () -> i64
      %1453 = arith.cmpi ne, %1451, %1452 : i64
      scf.if %1453 {
        %1454 = func.call @cc_condition_value(%1449) : (i64) -> i64
        %1455 = func.call @cc_values2(%1452, %1454) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1455) : (i64) -> ()
      } else {
        %1456 = func.call @cc_multiple_value_list(%1449) : (i64) -> i64
        %1457 = func.call @cc_values_pack(%1456) : (i64) -> i64
        func.call @stack_push_pointer(%1457) : (i64) -> ()
      }
      %1458 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1458 : i64
    }
    func.call @stack_push_pointer(%1415) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192200"() {
    %1640 = func.call @cc_nil_value() : () -> i64
    %1641 = func.call @cc_nil_value() : () -> i64
    %1642 = func.call @cc_errorp(%1640) : (i64) -> i64
    %1643 = arith.cmpi ne, %1642, %1641 : i64
    %1644 = scf.if %1643 -> (i64) {
      scf.yield %1640 : i64
    } else {
      %1645 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1646 = func.call @cc_nil_value() : () -> i64
      %1647 = func.call @cc_nil_value() : () -> i64
      %1648 = func.call @cc_errorp(%1646) : (i64) -> i64
      %1649 = arith.cmpi ne, %1648, %1647 : i64
      %1650 = scf.if %1649 -> (i64) {
        scf.yield %1646 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1651 = func.call @cc_nil_value() : () -> i64
        %1652 = arith.cmpi ne, %1651, %1651 : i64
        scf.if %1652 {
          func.call @stack_push_pointer(%1651) : (i64) -> ()
        } else {
          %1653 = llvm.mlir.addressof @str124 : !llvm.ptr
          %1654 = func.call @cc_make_function_ref_const(%1653) : (!llvm.ptr) -> i64
          %1655 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1654, %1655) : (i64, i64) -> ()
        }
        %1656 = func.call @stack_pop_pointer() : () -> i64
        %1657 = func.call @cc_errorp(%1656) : (i64) -> i64
        %1658 = func.call @cc_nil_value() : () -> i64
        %1659 = arith.cmpi ne, %1657, %1658 : i64
        scf.if %1659 {
          func.call @stack_push_pointer(%1656) : (i64) -> ()
        } else {
          %1660 = func.call @cc_multiple_value_list(%1656) : (i64) -> i64
          func.call @stack_push_pointer(%1660) : (i64) -> ()
        }
        %1661 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1662 = func.call @stack_pop_pointer() : () -> i64
        %1663 = func.call @cc_nil_value() : () -> i64
        %1664 = func.call @cc_maybe_error_from_multiple_value_list(%1661) : (i64) -> i64
        %1665 = func.call @cc_errorp(%1664) : (i64) -> i64
        %1666 = arith.cmpi ne, %1665, %1663 : i64
        %1667 = arith.cmpi eq, %1663, %1663 : i64
        %1668 = arith.andi %1666, %1667 : i1
        %1669 = scf.if %1668 -> (i64) {
          scf.yield %1664 : i64
        } else {
          scf.yield %1663 : i64
        }
        %1670 = arith.cmpi ne, %1669, %1663 : i64
        scf.if %1670 {
          func.call @stack_push_pointer(%1669) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1671 = func.call @stack_pop_pointer() : () -> i64
          %1672 = func.call @cc_cons(%1662, %1671) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1672) : (i64) -> ()
          %1673 = func.call @stack_pop_pointer() : () -> i64
          %1674 = func.call @cc_cons(%1661, %1673) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1674) : (i64) -> ()
          %1675 = func.call @stack_pop_pointer() : () -> i64
          %1676 = func.call @cc_values_pack(%1675) : (i64) -> i64
          func.call @stack_push_pointer(%1676) : (i64) -> ()
        }
        %1677 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1677 : i64
      }
      func.call @stack_push_pointer(%1650) : (i64) -> ()
      %1678 = func.call @stack_pop_pointer() : () -> i64
      %1679 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1680 = func.call @cc_errorp(%1678) : (i64) -> i64
      %1681 = func.call @cc_nil_value() : () -> i64
      %1682 = arith.cmpi ne, %1680, %1681 : i64
      scf.if %1682 {
        %1683 = func.call @cc_condition_value(%1678) : (i64) -> i64
        %1684 = func.call @cc_values2(%1681, %1683) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1684) : (i64) -> ()
      } else {
        %1685 = func.call @cc_multiple_value_list(%1678) : (i64) -> i64
        %1686 = func.call @cc_values_pack(%1685) : (i64) -> i64
        func.call @stack_push_pointer(%1686) : (i64) -> ()
      }
      %1687 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1687 : i64
    }
    func.call @stack_push_pointer(%1644) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192201"() {
    %1869 = func.call @cc_nil_value() : () -> i64
    %1870 = func.call @cc_nil_value() : () -> i64
    %1871 = func.call @cc_errorp(%1869) : (i64) -> i64
    %1872 = arith.cmpi ne, %1871, %1870 : i64
    %1873 = scf.if %1872 -> (i64) {
      scf.yield %1869 : i64
    } else {
      %1874 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1875 = func.call @cc_nil_value() : () -> i64
      %1876 = func.call @cc_nil_value() : () -> i64
      %1877 = func.call @cc_errorp(%1875) : (i64) -> i64
      %1878 = arith.cmpi ne, %1877, %1876 : i64
      %1879 = scf.if %1878 -> (i64) {
        scf.yield %1875 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1880 = func.call @cc_nil_value() : () -> i64
        %1881 = arith.cmpi ne, %1880, %1880 : i64
        scf.if %1881 {
          func.call @stack_push_pointer(%1880) : (i64) -> ()
        } else {
          %1882 = llvm.mlir.addressof @str141 : !llvm.ptr
          %1883 = func.call @cc_make_function_ref_const(%1882) : (!llvm.ptr) -> i64
          %1884 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1883, %1884) : (i64, i64) -> ()
        }
        %1885 = func.call @stack_pop_pointer() : () -> i64
        %1886 = func.call @cc_errorp(%1885) : (i64) -> i64
        %1887 = func.call @cc_nil_value() : () -> i64
        %1888 = arith.cmpi ne, %1886, %1887 : i64
        scf.if %1888 {
          func.call @stack_push_pointer(%1885) : (i64) -> ()
        } else {
          %1889 = func.call @cc_multiple_value_list(%1885) : (i64) -> i64
          func.call @stack_push_pointer(%1889) : (i64) -> ()
        }
        %1890 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1891 = func.call @stack_pop_pointer() : () -> i64
        %1892 = func.call @cc_nil_value() : () -> i64
        %1893 = func.call @cc_maybe_error_from_multiple_value_list(%1890) : (i64) -> i64
        %1894 = func.call @cc_errorp(%1893) : (i64) -> i64
        %1895 = arith.cmpi ne, %1894, %1892 : i64
        %1896 = arith.cmpi eq, %1892, %1892 : i64
        %1897 = arith.andi %1895, %1896 : i1
        %1898 = scf.if %1897 -> (i64) {
          scf.yield %1893 : i64
        } else {
          scf.yield %1892 : i64
        }
        %1899 = arith.cmpi ne, %1898, %1892 : i64
        scf.if %1899 {
          func.call @stack_push_pointer(%1898) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1900 = func.call @stack_pop_pointer() : () -> i64
          %1901 = func.call @cc_cons(%1891, %1900) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1901) : (i64) -> ()
          %1902 = func.call @stack_pop_pointer() : () -> i64
          %1903 = func.call @cc_cons(%1890, %1902) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1903) : (i64) -> ()
          %1904 = func.call @stack_pop_pointer() : () -> i64
          %1905 = func.call @cc_values_pack(%1904) : (i64) -> i64
          func.call @stack_push_pointer(%1905) : (i64) -> ()
        }
        %1906 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1906 : i64
      }
      func.call @stack_push_pointer(%1879) : (i64) -> ()
      %1907 = func.call @stack_pop_pointer() : () -> i64
      %1908 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1909 = func.call @cc_errorp(%1907) : (i64) -> i64
      %1910 = func.call @cc_nil_value() : () -> i64
      %1911 = arith.cmpi ne, %1909, %1910 : i64
      scf.if %1911 {
        %1912 = func.call @cc_condition_value(%1907) : (i64) -> i64
        %1913 = func.call @cc_values2(%1910, %1912) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1913) : (i64) -> ()
      } else {
        %1914 = func.call @cc_multiple_value_list(%1907) : (i64) -> i64
        %1915 = func.call @cc_values_pack(%1914) : (i64) -> i64
        func.call @stack_push_pointer(%1915) : (i64) -> ()
      }
      %1916 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1916 : i64
    }
    func.call @stack_push_pointer(%1873) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192202"() {
    %2098 = func.call @cc_nil_value() : () -> i64
    %2099 = func.call @cc_nil_value() : () -> i64
    %2100 = func.call @cc_errorp(%2098) : (i64) -> i64
    %2101 = arith.cmpi ne, %2100, %2099 : i64
    %2102 = scf.if %2101 -> (i64) {
      scf.yield %2098 : i64
    } else {
      %2103 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2104 = func.call @cc_nil_value() : () -> i64
      %2105 = func.call @cc_nil_value() : () -> i64
      %2106 = func.call @cc_errorp(%2104) : (i64) -> i64
      %2107 = arith.cmpi ne, %2106, %2105 : i64
      %2108 = scf.if %2107 -> (i64) {
        scf.yield %2104 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2109 = func.call @cc_nil_value() : () -> i64
        %2110 = arith.cmpi ne, %2109, %2109 : i64
        scf.if %2110 {
          func.call @stack_push_pointer(%2109) : (i64) -> ()
        } else {
          %2111 = llvm.mlir.addressof @str158 : !llvm.ptr
          %2112 = func.call @cc_make_function_ref_const(%2111) : (!llvm.ptr) -> i64
          %2113 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2112, %2113) : (i64, i64) -> ()
        }
        %2114 = func.call @stack_pop_pointer() : () -> i64
        %2115 = func.call @cc_errorp(%2114) : (i64) -> i64
        %2116 = func.call @cc_nil_value() : () -> i64
        %2117 = arith.cmpi ne, %2115, %2116 : i64
        scf.if %2117 {
          func.call @stack_push_pointer(%2114) : (i64) -> ()
        } else {
          %2118 = func.call @cc_multiple_value_list(%2114) : (i64) -> i64
          func.call @stack_push_pointer(%2118) : (i64) -> ()
        }
        %2119 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2120 = func.call @stack_pop_pointer() : () -> i64
        %2121 = func.call @cc_nil_value() : () -> i64
        %2122 = func.call @cc_maybe_error_from_multiple_value_list(%2119) : (i64) -> i64
        %2123 = func.call @cc_errorp(%2122) : (i64) -> i64
        %2124 = arith.cmpi ne, %2123, %2121 : i64
        %2125 = arith.cmpi eq, %2121, %2121 : i64
        %2126 = arith.andi %2124, %2125 : i1
        %2127 = scf.if %2126 -> (i64) {
          scf.yield %2122 : i64
        } else {
          scf.yield %2121 : i64
        }
        %2128 = arith.cmpi ne, %2127, %2121 : i64
        scf.if %2128 {
          func.call @stack_push_pointer(%2127) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2129 = func.call @stack_pop_pointer() : () -> i64
          %2130 = func.call @cc_cons(%2120, %2129) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2130) : (i64) -> ()
          %2131 = func.call @stack_pop_pointer() : () -> i64
          %2132 = func.call @cc_cons(%2119, %2131) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2132) : (i64) -> ()
          %2133 = func.call @stack_pop_pointer() : () -> i64
          %2134 = func.call @cc_values_pack(%2133) : (i64) -> i64
          func.call @stack_push_pointer(%2134) : (i64) -> ()
        }
        %2135 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2135 : i64
      }
      func.call @stack_push_pointer(%2108) : (i64) -> ()
      %2136 = func.call @stack_pop_pointer() : () -> i64
      %2137 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2138 = func.call @cc_errorp(%2136) : (i64) -> i64
      %2139 = func.call @cc_nil_value() : () -> i64
      %2140 = arith.cmpi ne, %2138, %2139 : i64
      scf.if %2140 {
        %2141 = func.call @cc_condition_value(%2136) : (i64) -> i64
        %2142 = func.call @cc_values2(%2139, %2141) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2142) : (i64) -> ()
      } else {
        %2143 = func.call @cc_multiple_value_list(%2136) : (i64) -> i64
        %2144 = func.call @cc_values_pack(%2143) : (i64) -> i64
        func.call @stack_push_pointer(%2144) : (i64) -> ()
      }
      %2145 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2145 : i64
    }
    func.call @stack_push_pointer(%2102) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192203"() {
    %2327 = func.call @cc_nil_value() : () -> i64
    %2328 = func.call @cc_nil_value() : () -> i64
    %2329 = func.call @cc_errorp(%2327) : (i64) -> i64
    %2330 = arith.cmpi ne, %2329, %2328 : i64
    %2331 = scf.if %2330 -> (i64) {
      scf.yield %2327 : i64
    } else {
      %2332 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2333 = func.call @cc_nil_value() : () -> i64
      %2334 = func.call @cc_nil_value() : () -> i64
      %2335 = func.call @cc_errorp(%2333) : (i64) -> i64
      %2336 = arith.cmpi ne, %2335, %2334 : i64
      %2337 = scf.if %2336 -> (i64) {
        scf.yield %2333 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2338 = func.call @cc_nil_value() : () -> i64
        %2339 = arith.cmpi ne, %2338, %2338 : i64
        scf.if %2339 {
          func.call @stack_push_pointer(%2338) : (i64) -> ()
        } else {
          %2340 = llvm.mlir.addressof @str175 : !llvm.ptr
          %2341 = func.call @cc_make_function_ref_const(%2340) : (!llvm.ptr) -> i64
          %2342 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2341, %2342) : (i64, i64) -> ()
        }
        %2343 = func.call @stack_pop_pointer() : () -> i64
        %2344 = func.call @cc_errorp(%2343) : (i64) -> i64
        %2345 = func.call @cc_nil_value() : () -> i64
        %2346 = arith.cmpi ne, %2344, %2345 : i64
        scf.if %2346 {
          func.call @stack_push_pointer(%2343) : (i64) -> ()
        } else {
          %2347 = func.call @cc_multiple_value_list(%2343) : (i64) -> i64
          func.call @stack_push_pointer(%2347) : (i64) -> ()
        }
        %2348 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2349 = func.call @stack_pop_pointer() : () -> i64
        %2350 = func.call @cc_nil_value() : () -> i64
        %2351 = func.call @cc_maybe_error_from_multiple_value_list(%2348) : (i64) -> i64
        %2352 = func.call @cc_errorp(%2351) : (i64) -> i64
        %2353 = arith.cmpi ne, %2352, %2350 : i64
        %2354 = arith.cmpi eq, %2350, %2350 : i64
        %2355 = arith.andi %2353, %2354 : i1
        %2356 = scf.if %2355 -> (i64) {
          scf.yield %2351 : i64
        } else {
          scf.yield %2350 : i64
        }
        %2357 = arith.cmpi ne, %2356, %2350 : i64
        scf.if %2357 {
          func.call @stack_push_pointer(%2356) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2358 = func.call @stack_pop_pointer() : () -> i64
          %2359 = func.call @cc_cons(%2349, %2358) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2359) : (i64) -> ()
          %2360 = func.call @stack_pop_pointer() : () -> i64
          %2361 = func.call @cc_cons(%2348, %2360) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2361) : (i64) -> ()
          %2362 = func.call @stack_pop_pointer() : () -> i64
          %2363 = func.call @cc_values_pack(%2362) : (i64) -> i64
          func.call @stack_push_pointer(%2363) : (i64) -> ()
        }
        %2364 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2364 : i64
      }
      func.call @stack_push_pointer(%2337) : (i64) -> ()
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2367 = func.call @cc_errorp(%2365) : (i64) -> i64
      %2368 = func.call @cc_nil_value() : () -> i64
      %2369 = arith.cmpi ne, %2367, %2368 : i64
      scf.if %2369 {
        %2370 = func.call @cc_condition_value(%2365) : (i64) -> i64
        %2371 = func.call @cc_values2(%2368, %2370) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2371) : (i64) -> ()
      } else {
        %2372 = func.call @cc_multiple_value_list(%2365) : (i64) -> i64
        %2373 = func.call @cc_values_pack(%2372) : (i64) -> i64
        func.call @stack_push_pointer(%2373) : (i64) -> ()
      }
      %2374 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2374 : i64
    }
    func.call @stack_push_pointer(%2331) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192204"() {
    %2556 = func.call @cc_nil_value() : () -> i64
    %2557 = func.call @cc_nil_value() : () -> i64
    %2558 = func.call @cc_errorp(%2556) : (i64) -> i64
    %2559 = arith.cmpi ne, %2558, %2557 : i64
    %2560 = scf.if %2559 -> (i64) {
      scf.yield %2556 : i64
    } else {
      %2561 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2562 = func.call @cc_nil_value() : () -> i64
      %2563 = func.call @cc_nil_value() : () -> i64
      %2564 = func.call @cc_errorp(%2562) : (i64) -> i64
      %2565 = arith.cmpi ne, %2564, %2563 : i64
      %2566 = scf.if %2565 -> (i64) {
        scf.yield %2562 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2567 = func.call @cc_nil_value() : () -> i64
        %2568 = arith.cmpi ne, %2567, %2567 : i64
        scf.if %2568 {
          func.call @stack_push_pointer(%2567) : (i64) -> ()
        } else {
          %2569 = llvm.mlir.addressof @str192 : !llvm.ptr
          %2570 = func.call @cc_make_function_ref_const(%2569) : (!llvm.ptr) -> i64
          %2571 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2570, %2571) : (i64, i64) -> ()
        }
        %2572 = func.call @stack_pop_pointer() : () -> i64
        %2573 = func.call @cc_errorp(%2572) : (i64) -> i64
        %2574 = func.call @cc_nil_value() : () -> i64
        %2575 = arith.cmpi ne, %2573, %2574 : i64
        scf.if %2575 {
          func.call @stack_push_pointer(%2572) : (i64) -> ()
        } else {
          %2576 = func.call @cc_multiple_value_list(%2572) : (i64) -> i64
          func.call @stack_push_pointer(%2576) : (i64) -> ()
        }
        %2577 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2578 = func.call @stack_pop_pointer() : () -> i64
        %2579 = func.call @cc_nil_value() : () -> i64
        %2580 = func.call @cc_maybe_error_from_multiple_value_list(%2577) : (i64) -> i64
        %2581 = func.call @cc_errorp(%2580) : (i64) -> i64
        %2582 = arith.cmpi ne, %2581, %2579 : i64
        %2583 = arith.cmpi eq, %2579, %2579 : i64
        %2584 = arith.andi %2582, %2583 : i1
        %2585 = scf.if %2584 -> (i64) {
          scf.yield %2580 : i64
        } else {
          scf.yield %2579 : i64
        }
        %2586 = arith.cmpi ne, %2585, %2579 : i64
        scf.if %2586 {
          func.call @stack_push_pointer(%2585) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2587 = func.call @stack_pop_pointer() : () -> i64
          %2588 = func.call @cc_cons(%2578, %2587) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2588) : (i64) -> ()
          %2589 = func.call @stack_pop_pointer() : () -> i64
          %2590 = func.call @cc_cons(%2577, %2589) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2590) : (i64) -> ()
          %2591 = func.call @stack_pop_pointer() : () -> i64
          %2592 = func.call @cc_values_pack(%2591) : (i64) -> i64
          func.call @stack_push_pointer(%2592) : (i64) -> ()
        }
        %2593 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2593 : i64
      }
      func.call @stack_push_pointer(%2566) : (i64) -> ()
      %2594 = func.call @stack_pop_pointer() : () -> i64
      %2595 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2596 = func.call @cc_errorp(%2594) : (i64) -> i64
      %2597 = func.call @cc_nil_value() : () -> i64
      %2598 = arith.cmpi ne, %2596, %2597 : i64
      scf.if %2598 {
        %2599 = func.call @cc_condition_value(%2594) : (i64) -> i64
        %2600 = func.call @cc_values2(%2597, %2599) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2600) : (i64) -> ()
      } else {
        %2601 = func.call @cc_multiple_value_list(%2594) : (i64) -> i64
        %2602 = func.call @cc_values_pack(%2601) : (i64) -> i64
        func.call @stack_push_pointer(%2602) : (i64) -> ()
      }
      %2603 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2603 : i64
    }
    func.call @stack_push_pointer(%2560) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192205"() {
    %2785 = func.call @cc_nil_value() : () -> i64
    %2786 = func.call @cc_nil_value() : () -> i64
    %2787 = func.call @cc_errorp(%2785) : (i64) -> i64
    %2788 = arith.cmpi ne, %2787, %2786 : i64
    %2789 = scf.if %2788 -> (i64) {
      scf.yield %2785 : i64
    } else {
      %2790 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2791 = func.call @cc_nil_value() : () -> i64
      %2792 = func.call @cc_nil_value() : () -> i64
      %2793 = func.call @cc_errorp(%2791) : (i64) -> i64
      %2794 = arith.cmpi ne, %2793, %2792 : i64
      %2795 = scf.if %2794 -> (i64) {
        scf.yield %2791 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2796 = func.call @cc_nil_value() : () -> i64
        %2797 = arith.cmpi ne, %2796, %2796 : i64
        scf.if %2797 {
          func.call @stack_push_pointer(%2796) : (i64) -> ()
        } else {
          %2798 = llvm.mlir.addressof @str209 : !llvm.ptr
          %2799 = func.call @cc_make_function_ref_const(%2798) : (!llvm.ptr) -> i64
          %2800 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%2799, %2800) : (i64, i64) -> ()
        }
        %2801 = func.call @stack_pop_pointer() : () -> i64
        %2802 = func.call @cc_errorp(%2801) : (i64) -> i64
        %2803 = func.call @cc_nil_value() : () -> i64
        %2804 = arith.cmpi ne, %2802, %2803 : i64
        scf.if %2804 {
          func.call @stack_push_pointer(%2801) : (i64) -> ()
        } else {
          %2805 = func.call @cc_multiple_value_list(%2801) : (i64) -> i64
          func.call @stack_push_pointer(%2805) : (i64) -> ()
        }
        %2806 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2807 = func.call @stack_pop_pointer() : () -> i64
        %2808 = func.call @cc_nil_value() : () -> i64
        %2809 = func.call @cc_maybe_error_from_multiple_value_list(%2806) : (i64) -> i64
        %2810 = func.call @cc_errorp(%2809) : (i64) -> i64
        %2811 = arith.cmpi ne, %2810, %2808 : i64
        %2812 = arith.cmpi eq, %2808, %2808 : i64
        %2813 = arith.andi %2811, %2812 : i1
        %2814 = scf.if %2813 -> (i64) {
          scf.yield %2809 : i64
        } else {
          scf.yield %2808 : i64
        }
        %2815 = arith.cmpi ne, %2814, %2808 : i64
        scf.if %2815 {
          func.call @stack_push_pointer(%2814) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2816 = func.call @stack_pop_pointer() : () -> i64
          %2817 = func.call @cc_cons(%2807, %2816) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2817) : (i64) -> ()
          %2818 = func.call @stack_pop_pointer() : () -> i64
          %2819 = func.call @cc_cons(%2806, %2818) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2819) : (i64) -> ()
          %2820 = func.call @stack_pop_pointer() : () -> i64
          %2821 = func.call @cc_values_pack(%2820) : (i64) -> i64
          func.call @stack_push_pointer(%2821) : (i64) -> ()
        }
        %2822 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2822 : i64
      }
      func.call @stack_push_pointer(%2795) : (i64) -> ()
      %2823 = func.call @stack_pop_pointer() : () -> i64
      %2824 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2825 = func.call @cc_errorp(%2823) : (i64) -> i64
      %2826 = func.call @cc_nil_value() : () -> i64
      %2827 = arith.cmpi ne, %2825, %2826 : i64
      scf.if %2827 {
        %2828 = func.call @cc_condition_value(%2823) : (i64) -> i64
        %2829 = func.call @cc_values2(%2826, %2828) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2829) : (i64) -> ()
      } else {
        %2830 = func.call @cc_multiple_value_list(%2823) : (i64) -> i64
        %2831 = func.call @cc_values_pack(%2830) : (i64) -> i64
        func.call @stack_push_pointer(%2831) : (i64) -> ()
      }
      %2832 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2832 : i64
    }
    func.call @stack_push_pointer(%2789) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192206"() {
    %3030 = func.call @cc_nil_value() : () -> i64
    %3031 = func.call @cc_nil_value() : () -> i64
    %3032 = func.call @cc_errorp(%3030) : (i64) -> i64
    %3033 = arith.cmpi ne, %3032, %3031 : i64
    %3034 = scf.if %3033 -> (i64) {
      scf.yield %3030 : i64
    } else {
      %3035 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3036 = func.call @cc_nil_value() : () -> i64
      %3037 = func.call @cc_nil_value() : () -> i64
      %3038 = func.call @cc_errorp(%3036) : (i64) -> i64
      %3039 = arith.cmpi ne, %3038, %3037 : i64
      %3040 = scf.if %3039 -> (i64) {
        scf.yield %3036 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3041 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3041) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %3042 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3042) : (i64) -> ()
        %3043 = func.call @stack_pop_pointer() : () -> i64
        %3044 = func.call @cc_nil_value() : () -> i64
        %3045 = func.call @cc_errorp(%3043) : (i64) -> i64
        %3046 = arith.cmpi ne, %3045, %3044 : i64
        %3047 = arith.cmpi eq, %3044, %3044 : i64
        %3048 = arith.andi %3046, %3047 : i1
        %3049 = scf.if %3048 -> (i64) {
          scf.yield %3043 : i64
        } else {
          scf.yield %3044 : i64
        }
        %3050 = arith.cmpi ne, %3049, %3044 : i64
        scf.if %3050 {
          func.call @stack_push_pointer(%3049) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3043) : (i64) -> ()
          %3051 = llvm.mlir.addressof @str228 : !llvm.ptr
          %3052 = func.call @cc_make_function_ref_const(%3051) : (!llvm.ptr) -> i64
          %3053 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3052, %3053) : (i64, i64) -> ()
        }
        %3054 = func.call @stack_pop_pointer() : () -> i64
        %3055 = func.call @cc_errorp(%3054) : (i64) -> i64
        %3056 = func.call @cc_nil_value() : () -> i64
        %3057 = arith.cmpi ne, %3055, %3056 : i64
        scf.if %3057 {
          func.call @stack_push_pointer(%3054) : (i64) -> ()
        } else {
          %3058 = func.call @cc_multiple_value_list(%3054) : (i64) -> i64
          func.call @stack_push_pointer(%3058) : (i64) -> ()
        }
        %3059 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3060 = func.call @stack_pop_pointer() : () -> i64
        %3061 = func.call @cc_nil_value() : () -> i64
        %3062 = func.call @cc_maybe_error_from_multiple_value_list(%3059) : (i64) -> i64
        %3063 = func.call @cc_errorp(%3062) : (i64) -> i64
        %3064 = arith.cmpi ne, %3063, %3061 : i64
        %3065 = arith.cmpi eq, %3061, %3061 : i64
        %3066 = arith.andi %3064, %3065 : i1
        %3067 = scf.if %3066 -> (i64) {
          scf.yield %3062 : i64
        } else {
          scf.yield %3061 : i64
        }
        %3068 = arith.cmpi ne, %3067, %3061 : i64
        scf.if %3068 {
          func.call @stack_push_pointer(%3067) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3069 = func.call @stack_pop_pointer() : () -> i64
          %3070 = func.call @cc_cons(%3060, %3069) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3070) : (i64) -> ()
          %3071 = func.call @stack_pop_pointer() : () -> i64
          %3072 = func.call @cc_cons(%3059, %3071) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3072) : (i64) -> ()
          %3073 = func.call @stack_pop_pointer() : () -> i64
          %3074 = func.call @cc_values_pack(%3073) : (i64) -> i64
          func.call @stack_push_pointer(%3074) : (i64) -> ()
        }
        %3075 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3075 : i64
      }
      func.call @stack_push_pointer(%3040) : (i64) -> ()
      %3076 = func.call @stack_pop_pointer() : () -> i64
      %3077 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3078 = func.call @cc_errorp(%3076) : (i64) -> i64
      %3079 = func.call @cc_nil_value() : () -> i64
      %3080 = arith.cmpi ne, %3078, %3079 : i64
      scf.if %3080 {
        %3081 = func.call @cc_condition_value(%3076) : (i64) -> i64
        %3082 = func.call @cc_values2(%3079, %3081) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3082) : (i64) -> ()
      } else {
        %3083 = func.call @cc_multiple_value_list(%3076) : (i64) -> i64
        %3084 = func.call @cc_values_pack(%3083) : (i64) -> i64
        func.call @stack_push_pointer(%3084) : (i64) -> ()
      }
      %3085 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3085 : i64
    }
    func.call @stack_push_pointer(%3034) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192207"() {
    %3283 = func.call @cc_nil_value() : () -> i64
    %3284 = func.call @cc_nil_value() : () -> i64
    %3285 = func.call @cc_errorp(%3283) : (i64) -> i64
    %3286 = arith.cmpi ne, %3285, %3284 : i64
    %3287 = scf.if %3286 -> (i64) {
      scf.yield %3283 : i64
    } else {
      %3288 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3289 = func.call @cc_nil_value() : () -> i64
      %3290 = func.call @cc_nil_value() : () -> i64
      %3291 = func.call @cc_errorp(%3289) : (i64) -> i64
      %3292 = arith.cmpi ne, %3291, %3290 : i64
      %3293 = scf.if %3292 -> (i64) {
        scf.yield %3289 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3294 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3294) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %3295 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3295) : (i64) -> ()
        %3296 = func.call @stack_pop_pointer() : () -> i64
        %3297 = func.call @cc_nil_value() : () -> i64
        %3298 = func.call @cc_errorp(%3296) : (i64) -> i64
        %3299 = arith.cmpi ne, %3298, %3297 : i64
        %3300 = arith.cmpi eq, %3297, %3297 : i64
        %3301 = arith.andi %3299, %3300 : i1
        %3302 = scf.if %3301 -> (i64) {
          scf.yield %3296 : i64
        } else {
          scf.yield %3297 : i64
        }
        %3303 = arith.cmpi ne, %3302, %3297 : i64
        scf.if %3303 {
          func.call @stack_push_pointer(%3302) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3296) : (i64) -> ()
          %3304 = llvm.mlir.addressof @str247 : !llvm.ptr
          %3305 = func.call @cc_make_function_ref_const(%3304) : (!llvm.ptr) -> i64
          %3306 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3305, %3306) : (i64, i64) -> ()
        }
        %3307 = func.call @stack_pop_pointer() : () -> i64
        %3308 = func.call @cc_errorp(%3307) : (i64) -> i64
        %3309 = func.call @cc_nil_value() : () -> i64
        %3310 = arith.cmpi ne, %3308, %3309 : i64
        scf.if %3310 {
          func.call @stack_push_pointer(%3307) : (i64) -> ()
        } else {
          %3311 = func.call @cc_multiple_value_list(%3307) : (i64) -> i64
          func.call @stack_push_pointer(%3311) : (i64) -> ()
        }
        %3312 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3313 = func.call @stack_pop_pointer() : () -> i64
        %3314 = func.call @cc_nil_value() : () -> i64
        %3315 = func.call @cc_maybe_error_from_multiple_value_list(%3312) : (i64) -> i64
        %3316 = func.call @cc_errorp(%3315) : (i64) -> i64
        %3317 = arith.cmpi ne, %3316, %3314 : i64
        %3318 = arith.cmpi eq, %3314, %3314 : i64
        %3319 = arith.andi %3317, %3318 : i1
        %3320 = scf.if %3319 -> (i64) {
          scf.yield %3315 : i64
        } else {
          scf.yield %3314 : i64
        }
        %3321 = arith.cmpi ne, %3320, %3314 : i64
        scf.if %3321 {
          func.call @stack_push_pointer(%3320) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3322 = func.call @stack_pop_pointer() : () -> i64
          %3323 = func.call @cc_cons(%3313, %3322) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3323) : (i64) -> ()
          %3324 = func.call @stack_pop_pointer() : () -> i64
          %3325 = func.call @cc_cons(%3312, %3324) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3325) : (i64) -> ()
          %3326 = func.call @stack_pop_pointer() : () -> i64
          %3327 = func.call @cc_values_pack(%3326) : (i64) -> i64
          func.call @stack_push_pointer(%3327) : (i64) -> ()
        }
        %3328 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3328 : i64
      }
      func.call @stack_push_pointer(%3293) : (i64) -> ()
      %3329 = func.call @stack_pop_pointer() : () -> i64
      %3330 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3331 = func.call @cc_errorp(%3329) : (i64) -> i64
      %3332 = func.call @cc_nil_value() : () -> i64
      %3333 = arith.cmpi ne, %3331, %3332 : i64
      scf.if %3333 {
        %3334 = func.call @cc_condition_value(%3329) : (i64) -> i64
        %3335 = func.call @cc_values2(%3332, %3334) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3335) : (i64) -> ()
      } else {
        %3336 = func.call @cc_multiple_value_list(%3329) : (i64) -> i64
        %3337 = func.call @cc_values_pack(%3336) : (i64) -> i64
        func.call @stack_push_pointer(%3337) : (i64) -> ()
      }
      %3338 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3338 : i64
    }
    func.call @stack_push_pointer(%3287) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192208"() {
    %3536 = func.call @cc_nil_value() : () -> i64
    %3537 = func.call @cc_nil_value() : () -> i64
    %3538 = func.call @cc_errorp(%3536) : (i64) -> i64
    %3539 = arith.cmpi ne, %3538, %3537 : i64
    %3540 = scf.if %3539 -> (i64) {
      scf.yield %3536 : i64
    } else {
      %3541 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3542 = func.call @cc_nil_value() : () -> i64
      %3543 = func.call @cc_nil_value() : () -> i64
      %3544 = func.call @cc_errorp(%3542) : (i64) -> i64
      %3545 = arith.cmpi ne, %3544, %3543 : i64
      %3546 = scf.if %3545 -> (i64) {
        scf.yield %3542 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3547 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3547) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %3548 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3548) : (i64) -> ()
        %3549 = func.call @stack_pop_pointer() : () -> i64
        %3550 = func.call @cc_nil_value() : () -> i64
        %3551 = func.call @cc_errorp(%3549) : (i64) -> i64
        %3552 = arith.cmpi ne, %3551, %3550 : i64
        %3553 = arith.cmpi eq, %3550, %3550 : i64
        %3554 = arith.andi %3552, %3553 : i1
        %3555 = scf.if %3554 -> (i64) {
          scf.yield %3549 : i64
        } else {
          scf.yield %3550 : i64
        }
        %3556 = arith.cmpi ne, %3555, %3550 : i64
        scf.if %3556 {
          func.call @stack_push_pointer(%3555) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3549) : (i64) -> ()
          %3557 = llvm.mlir.addressof @str266 : !llvm.ptr
          %3558 = func.call @cc_make_function_ref_const(%3557) : (!llvm.ptr) -> i64
          %3559 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3558, %3559) : (i64, i64) -> ()
        }
        %3560 = func.call @stack_pop_pointer() : () -> i64
        %3561 = func.call @cc_errorp(%3560) : (i64) -> i64
        %3562 = func.call @cc_nil_value() : () -> i64
        %3563 = arith.cmpi ne, %3561, %3562 : i64
        scf.if %3563 {
          func.call @stack_push_pointer(%3560) : (i64) -> ()
        } else {
          %3564 = func.call @cc_multiple_value_list(%3560) : (i64) -> i64
          func.call @stack_push_pointer(%3564) : (i64) -> ()
        }
        %3565 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3566 = func.call @stack_pop_pointer() : () -> i64
        %3567 = func.call @cc_nil_value() : () -> i64
        %3568 = func.call @cc_maybe_error_from_multiple_value_list(%3565) : (i64) -> i64
        %3569 = func.call @cc_errorp(%3568) : (i64) -> i64
        %3570 = arith.cmpi ne, %3569, %3567 : i64
        %3571 = arith.cmpi eq, %3567, %3567 : i64
        %3572 = arith.andi %3570, %3571 : i1
        %3573 = scf.if %3572 -> (i64) {
          scf.yield %3568 : i64
        } else {
          scf.yield %3567 : i64
        }
        %3574 = arith.cmpi ne, %3573, %3567 : i64
        scf.if %3574 {
          func.call @stack_push_pointer(%3573) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3575 = func.call @stack_pop_pointer() : () -> i64
          %3576 = func.call @cc_cons(%3566, %3575) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3576) : (i64) -> ()
          %3577 = func.call @stack_pop_pointer() : () -> i64
          %3578 = func.call @cc_cons(%3565, %3577) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3578) : (i64) -> ()
          %3579 = func.call @stack_pop_pointer() : () -> i64
          %3580 = func.call @cc_values_pack(%3579) : (i64) -> i64
          func.call @stack_push_pointer(%3580) : (i64) -> ()
        }
        %3581 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3581 : i64
      }
      func.call @stack_push_pointer(%3546) : (i64) -> ()
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3584 = func.call @cc_errorp(%3582) : (i64) -> i64
      %3585 = func.call @cc_nil_value() : () -> i64
      %3586 = arith.cmpi ne, %3584, %3585 : i64
      scf.if %3586 {
        %3587 = func.call @cc_condition_value(%3582) : (i64) -> i64
        %3588 = func.call @cc_values2(%3585, %3587) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3588) : (i64) -> ()
      } else {
        %3589 = func.call @cc_multiple_value_list(%3582) : (i64) -> i64
        %3590 = func.call @cc_values_pack(%3589) : (i64) -> i64
        func.call @stack_push_pointer(%3590) : (i64) -> ()
      }
      %3591 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3591 : i64
    }
    func.call @stack_push_pointer(%3540) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192209"() {
    %3789 = func.call @cc_nil_value() : () -> i64
    %3790 = func.call @cc_nil_value() : () -> i64
    %3791 = func.call @cc_errorp(%3789) : (i64) -> i64
    %3792 = arith.cmpi ne, %3791, %3790 : i64
    %3793 = scf.if %3792 -> (i64) {
      scf.yield %3789 : i64
    } else {
      %3794 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3795 = func.call @cc_nil_value() : () -> i64
      %3796 = func.call @cc_nil_value() : () -> i64
      %3797 = func.call @cc_errorp(%3795) : (i64) -> i64
      %3798 = arith.cmpi ne, %3797, %3796 : i64
      %3799 = scf.if %3798 -> (i64) {
        scf.yield %3795 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3800 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3800) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %3801 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3801) : (i64) -> ()
        %3802 = func.call @stack_pop_pointer() : () -> i64
        %3803 = func.call @cc_nil_value() : () -> i64
        %3804 = func.call @cc_errorp(%3802) : (i64) -> i64
        %3805 = arith.cmpi ne, %3804, %3803 : i64
        %3806 = arith.cmpi eq, %3803, %3803 : i64
        %3807 = arith.andi %3805, %3806 : i1
        %3808 = scf.if %3807 -> (i64) {
          scf.yield %3802 : i64
        } else {
          scf.yield %3803 : i64
        }
        %3809 = arith.cmpi ne, %3808, %3803 : i64
        scf.if %3809 {
          func.call @stack_push_pointer(%3808) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3802) : (i64) -> ()
          %3810 = llvm.mlir.addressof @str285 : !llvm.ptr
          %3811 = func.call @cc_make_function_ref_const(%3810) : (!llvm.ptr) -> i64
          %3812 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3811, %3812) : (i64, i64) -> ()
        }
        %3813 = func.call @stack_pop_pointer() : () -> i64
        %3814 = func.call @cc_errorp(%3813) : (i64) -> i64
        %3815 = func.call @cc_nil_value() : () -> i64
        %3816 = arith.cmpi ne, %3814, %3815 : i64
        scf.if %3816 {
          func.call @stack_push_pointer(%3813) : (i64) -> ()
        } else {
          %3817 = func.call @cc_multiple_value_list(%3813) : (i64) -> i64
          func.call @stack_push_pointer(%3817) : (i64) -> ()
        }
        %3818 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3819 = func.call @stack_pop_pointer() : () -> i64
        %3820 = func.call @cc_nil_value() : () -> i64
        %3821 = func.call @cc_maybe_error_from_multiple_value_list(%3818) : (i64) -> i64
        %3822 = func.call @cc_errorp(%3821) : (i64) -> i64
        %3823 = arith.cmpi ne, %3822, %3820 : i64
        %3824 = arith.cmpi eq, %3820, %3820 : i64
        %3825 = arith.andi %3823, %3824 : i1
        %3826 = scf.if %3825 -> (i64) {
          scf.yield %3821 : i64
        } else {
          scf.yield %3820 : i64
        }
        %3827 = arith.cmpi ne, %3826, %3820 : i64
        scf.if %3827 {
          func.call @stack_push_pointer(%3826) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3828 = func.call @stack_pop_pointer() : () -> i64
          %3829 = func.call @cc_cons(%3819, %3828) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3829) : (i64) -> ()
          %3830 = func.call @stack_pop_pointer() : () -> i64
          %3831 = func.call @cc_cons(%3818, %3830) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3831) : (i64) -> ()
          %3832 = func.call @stack_pop_pointer() : () -> i64
          %3833 = func.call @cc_values_pack(%3832) : (i64) -> i64
          func.call @stack_push_pointer(%3833) : (i64) -> ()
        }
        %3834 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3834 : i64
      }
      func.call @stack_push_pointer(%3799) : (i64) -> ()
      %3835 = func.call @stack_pop_pointer() : () -> i64
      %3836 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3837 = func.call @cc_errorp(%3835) : (i64) -> i64
      %3838 = func.call @cc_nil_value() : () -> i64
      %3839 = arith.cmpi ne, %3837, %3838 : i64
      scf.if %3839 {
        %3840 = func.call @cc_condition_value(%3835) : (i64) -> i64
        %3841 = func.call @cc_values2(%3838, %3840) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3841) : (i64) -> ()
      } else {
        %3842 = func.call @cc_multiple_value_list(%3835) : (i64) -> i64
        %3843 = func.call @cc_values_pack(%3842) : (i64) -> i64
        func.call @stack_push_pointer(%3843) : (i64) -> ()
      }
      %3844 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3844 : i64
    }
    func.call @stack_push_pointer(%3793) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192210"() {
    %4042 = func.call @cc_nil_value() : () -> i64
    %4043 = func.call @cc_nil_value() : () -> i64
    %4044 = func.call @cc_errorp(%4042) : (i64) -> i64
    %4045 = arith.cmpi ne, %4044, %4043 : i64
    %4046 = scf.if %4045 -> (i64) {
      scf.yield %4042 : i64
    } else {
      %4047 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4048 = func.call @cc_nil_value() : () -> i64
      %4049 = func.call @cc_nil_value() : () -> i64
      %4050 = func.call @cc_errorp(%4048) : (i64) -> i64
      %4051 = arith.cmpi ne, %4050, %4049 : i64
      %4052 = scf.if %4051 -> (i64) {
        scf.yield %4048 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4053 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4053) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %4054 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4054) : (i64) -> ()
        %4055 = func.call @stack_pop_pointer() : () -> i64
        %4056 = func.call @cc_nil_value() : () -> i64
        %4057 = func.call @cc_errorp(%4055) : (i64) -> i64
        %4058 = arith.cmpi ne, %4057, %4056 : i64
        %4059 = arith.cmpi eq, %4056, %4056 : i64
        %4060 = arith.andi %4058, %4059 : i1
        %4061 = scf.if %4060 -> (i64) {
          scf.yield %4055 : i64
        } else {
          scf.yield %4056 : i64
        }
        %4062 = arith.cmpi ne, %4061, %4056 : i64
        scf.if %4062 {
          func.call @stack_push_pointer(%4061) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4055) : (i64) -> ()
          %4063 = llvm.mlir.addressof @str304 : !llvm.ptr
          %4064 = func.call @cc_make_function_ref_const(%4063) : (!llvm.ptr) -> i64
          %4065 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4064, %4065) : (i64, i64) -> ()
        }
        %4066 = func.call @stack_pop_pointer() : () -> i64
        %4067 = func.call @cc_errorp(%4066) : (i64) -> i64
        %4068 = func.call @cc_nil_value() : () -> i64
        %4069 = arith.cmpi ne, %4067, %4068 : i64
        scf.if %4069 {
          func.call @stack_push_pointer(%4066) : (i64) -> ()
        } else {
          %4070 = func.call @cc_multiple_value_list(%4066) : (i64) -> i64
          func.call @stack_push_pointer(%4070) : (i64) -> ()
        }
        %4071 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4072 = func.call @stack_pop_pointer() : () -> i64
        %4073 = func.call @cc_nil_value() : () -> i64
        %4074 = func.call @cc_maybe_error_from_multiple_value_list(%4071) : (i64) -> i64
        %4075 = func.call @cc_errorp(%4074) : (i64) -> i64
        %4076 = arith.cmpi ne, %4075, %4073 : i64
        %4077 = arith.cmpi eq, %4073, %4073 : i64
        %4078 = arith.andi %4076, %4077 : i1
        %4079 = scf.if %4078 -> (i64) {
          scf.yield %4074 : i64
        } else {
          scf.yield %4073 : i64
        }
        %4080 = arith.cmpi ne, %4079, %4073 : i64
        scf.if %4080 {
          func.call @stack_push_pointer(%4079) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4081 = func.call @stack_pop_pointer() : () -> i64
          %4082 = func.call @cc_cons(%4072, %4081) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4082) : (i64) -> ()
          %4083 = func.call @stack_pop_pointer() : () -> i64
          %4084 = func.call @cc_cons(%4071, %4083) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4084) : (i64) -> ()
          %4085 = func.call @stack_pop_pointer() : () -> i64
          %4086 = func.call @cc_values_pack(%4085) : (i64) -> i64
          func.call @stack_push_pointer(%4086) : (i64) -> ()
        }
        %4087 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4087 : i64
      }
      func.call @stack_push_pointer(%4052) : (i64) -> ()
      %4088 = func.call @stack_pop_pointer() : () -> i64
      %4089 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4090 = func.call @cc_errorp(%4088) : (i64) -> i64
      %4091 = func.call @cc_nil_value() : () -> i64
      %4092 = arith.cmpi ne, %4090, %4091 : i64
      scf.if %4092 {
        %4093 = func.call @cc_condition_value(%4088) : (i64) -> i64
        %4094 = func.call @cc_values2(%4091, %4093) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4094) : (i64) -> ()
      } else {
        %4095 = func.call @cc_multiple_value_list(%4088) : (i64) -> i64
        %4096 = func.call @cc_values_pack(%4095) : (i64) -> i64
        func.call @stack_push_pointer(%4096) : (i64) -> ()
      }
      %4097 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4097 : i64
    }
    func.call @stack_push_pointer(%4046) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192211"() {
    %4295 = func.call @cc_nil_value() : () -> i64
    %4296 = func.call @cc_nil_value() : () -> i64
    %4297 = func.call @cc_errorp(%4295) : (i64) -> i64
    %4298 = arith.cmpi ne, %4297, %4296 : i64
    %4299 = scf.if %4298 -> (i64) {
      scf.yield %4295 : i64
    } else {
      %4300 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4301 = func.call @cc_nil_value() : () -> i64
      %4302 = func.call @cc_nil_value() : () -> i64
      %4303 = func.call @cc_errorp(%4301) : (i64) -> i64
      %4304 = arith.cmpi ne, %4303, %4302 : i64
      %4305 = scf.if %4304 -> (i64) {
        scf.yield %4301 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4306 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4306) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %4307 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4307) : (i64) -> ()
        %4308 = func.call @stack_pop_pointer() : () -> i64
        %4309 = func.call @cc_nil_value() : () -> i64
        %4310 = func.call @cc_errorp(%4308) : (i64) -> i64
        %4311 = arith.cmpi ne, %4310, %4309 : i64
        %4312 = arith.cmpi eq, %4309, %4309 : i64
        %4313 = arith.andi %4311, %4312 : i1
        %4314 = scf.if %4313 -> (i64) {
          scf.yield %4308 : i64
        } else {
          scf.yield %4309 : i64
        }
        %4315 = arith.cmpi ne, %4314, %4309 : i64
        scf.if %4315 {
          func.call @stack_push_pointer(%4314) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4308) : (i64) -> ()
          %4316 = llvm.mlir.addressof @str323 : !llvm.ptr
          %4317 = func.call @cc_make_function_ref_const(%4316) : (!llvm.ptr) -> i64
          %4318 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4317, %4318) : (i64, i64) -> ()
        }
        %4319 = func.call @stack_pop_pointer() : () -> i64
        %4320 = func.call @cc_errorp(%4319) : (i64) -> i64
        %4321 = func.call @cc_nil_value() : () -> i64
        %4322 = arith.cmpi ne, %4320, %4321 : i64
        scf.if %4322 {
          func.call @stack_push_pointer(%4319) : (i64) -> ()
        } else {
          %4323 = func.call @cc_multiple_value_list(%4319) : (i64) -> i64
          func.call @stack_push_pointer(%4323) : (i64) -> ()
        }
        %4324 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4325 = func.call @stack_pop_pointer() : () -> i64
        %4326 = func.call @cc_nil_value() : () -> i64
        %4327 = func.call @cc_maybe_error_from_multiple_value_list(%4324) : (i64) -> i64
        %4328 = func.call @cc_errorp(%4327) : (i64) -> i64
        %4329 = arith.cmpi ne, %4328, %4326 : i64
        %4330 = arith.cmpi eq, %4326, %4326 : i64
        %4331 = arith.andi %4329, %4330 : i1
        %4332 = scf.if %4331 -> (i64) {
          scf.yield %4327 : i64
        } else {
          scf.yield %4326 : i64
        }
        %4333 = arith.cmpi ne, %4332, %4326 : i64
        scf.if %4333 {
          func.call @stack_push_pointer(%4332) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4334 = func.call @stack_pop_pointer() : () -> i64
          %4335 = func.call @cc_cons(%4325, %4334) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4335) : (i64) -> ()
          %4336 = func.call @stack_pop_pointer() : () -> i64
          %4337 = func.call @cc_cons(%4324, %4336) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4337) : (i64) -> ()
          %4338 = func.call @stack_pop_pointer() : () -> i64
          %4339 = func.call @cc_values_pack(%4338) : (i64) -> i64
          func.call @stack_push_pointer(%4339) : (i64) -> ()
        }
        %4340 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4340 : i64
      }
      func.call @stack_push_pointer(%4305) : (i64) -> ()
      %4341 = func.call @stack_pop_pointer() : () -> i64
      %4342 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4343 = func.call @cc_errorp(%4341) : (i64) -> i64
      %4344 = func.call @cc_nil_value() : () -> i64
      %4345 = arith.cmpi ne, %4343, %4344 : i64
      scf.if %4345 {
        %4346 = func.call @cc_condition_value(%4341) : (i64) -> i64
        %4347 = func.call @cc_values2(%4344, %4346) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4347) : (i64) -> ()
      } else {
        %4348 = func.call @cc_multiple_value_list(%4341) : (i64) -> i64
        %4349 = func.call @cc_values_pack(%4348) : (i64) -> i64
        func.call @stack_push_pointer(%4349) : (i64) -> ()
      }
      %4350 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4350 : i64
    }
    func.call @stack_push_pointer(%4299) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192212"() {
    %4548 = func.call @cc_nil_value() : () -> i64
    %4549 = func.call @cc_nil_value() : () -> i64
    %4550 = func.call @cc_errorp(%4548) : (i64) -> i64
    %4551 = arith.cmpi ne, %4550, %4549 : i64
    %4552 = scf.if %4551 -> (i64) {
      scf.yield %4548 : i64
    } else {
      %4553 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4554 = func.call @cc_nil_value() : () -> i64
      %4555 = func.call @cc_nil_value() : () -> i64
      %4556 = func.call @cc_errorp(%4554) : (i64) -> i64
      %4557 = arith.cmpi ne, %4556, %4555 : i64
      %4558 = scf.if %4557 -> (i64) {
        scf.yield %4554 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4559 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4559) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %4560 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4560) : (i64) -> ()
        %4561 = func.call @stack_pop_pointer() : () -> i64
        %4562 = func.call @cc_nil_value() : () -> i64
        %4563 = func.call @cc_errorp(%4561) : (i64) -> i64
        %4564 = arith.cmpi ne, %4563, %4562 : i64
        %4565 = arith.cmpi eq, %4562, %4562 : i64
        %4566 = arith.andi %4564, %4565 : i1
        %4567 = scf.if %4566 -> (i64) {
          scf.yield %4561 : i64
        } else {
          scf.yield %4562 : i64
        }
        %4568 = arith.cmpi ne, %4567, %4562 : i64
        scf.if %4568 {
          func.call @stack_push_pointer(%4567) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4561) : (i64) -> ()
          %4569 = llvm.mlir.addressof @str342 : !llvm.ptr
          %4570 = func.call @cc_make_function_ref_const(%4569) : (!llvm.ptr) -> i64
          %4571 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4570, %4571) : (i64, i64) -> ()
        }
        %4572 = func.call @stack_pop_pointer() : () -> i64
        %4573 = func.call @cc_errorp(%4572) : (i64) -> i64
        %4574 = func.call @cc_nil_value() : () -> i64
        %4575 = arith.cmpi ne, %4573, %4574 : i64
        scf.if %4575 {
          func.call @stack_push_pointer(%4572) : (i64) -> ()
        } else {
          %4576 = func.call @cc_multiple_value_list(%4572) : (i64) -> i64
          func.call @stack_push_pointer(%4576) : (i64) -> ()
        }
        %4577 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4578 = func.call @stack_pop_pointer() : () -> i64
        %4579 = func.call @cc_nil_value() : () -> i64
        %4580 = func.call @cc_maybe_error_from_multiple_value_list(%4577) : (i64) -> i64
        %4581 = func.call @cc_errorp(%4580) : (i64) -> i64
        %4582 = arith.cmpi ne, %4581, %4579 : i64
        %4583 = arith.cmpi eq, %4579, %4579 : i64
        %4584 = arith.andi %4582, %4583 : i1
        %4585 = scf.if %4584 -> (i64) {
          scf.yield %4580 : i64
        } else {
          scf.yield %4579 : i64
        }
        %4586 = arith.cmpi ne, %4585, %4579 : i64
        scf.if %4586 {
          func.call @stack_push_pointer(%4585) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4587 = func.call @stack_pop_pointer() : () -> i64
          %4588 = func.call @cc_cons(%4578, %4587) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4588) : (i64) -> ()
          %4589 = func.call @stack_pop_pointer() : () -> i64
          %4590 = func.call @cc_cons(%4577, %4589) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4590) : (i64) -> ()
          %4591 = func.call @stack_pop_pointer() : () -> i64
          %4592 = func.call @cc_values_pack(%4591) : (i64) -> i64
          func.call @stack_push_pointer(%4592) : (i64) -> ()
        }
        %4593 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4593 : i64
      }
      func.call @stack_push_pointer(%4558) : (i64) -> ()
      %4594 = func.call @stack_pop_pointer() : () -> i64
      %4595 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4596 = func.call @cc_errorp(%4594) : (i64) -> i64
      %4597 = func.call @cc_nil_value() : () -> i64
      %4598 = arith.cmpi ne, %4596, %4597 : i64
      scf.if %4598 {
        %4599 = func.call @cc_condition_value(%4594) : (i64) -> i64
        %4600 = func.call @cc_values2(%4597, %4599) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4600) : (i64) -> ()
      } else {
        %4601 = func.call @cc_multiple_value_list(%4594) : (i64) -> i64
        %4602 = func.call @cc_values_pack(%4601) : (i64) -> i64
        func.call @stack_push_pointer(%4602) : (i64) -> ()
      }
      %4603 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4603 : i64
    }
    func.call @stack_push_pointer(%4552) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192213"() {
    %4801 = func.call @cc_nil_value() : () -> i64
    %4802 = func.call @cc_nil_value() : () -> i64
    %4803 = func.call @cc_errorp(%4801) : (i64) -> i64
    %4804 = arith.cmpi ne, %4803, %4802 : i64
    %4805 = scf.if %4804 -> (i64) {
      scf.yield %4801 : i64
    } else {
      %4806 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4807 = func.call @cc_nil_value() : () -> i64
      %4808 = func.call @cc_nil_value() : () -> i64
      %4809 = func.call @cc_errorp(%4807) : (i64) -> i64
      %4810 = arith.cmpi ne, %4809, %4808 : i64
      %4811 = scf.if %4810 -> (i64) {
        scf.yield %4807 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4812 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4812) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %4813 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4813) : (i64) -> ()
        %4814 = func.call @stack_pop_pointer() : () -> i64
        %4815 = func.call @cc_nil_value() : () -> i64
        %4816 = func.call @cc_errorp(%4814) : (i64) -> i64
        %4817 = arith.cmpi ne, %4816, %4815 : i64
        %4818 = arith.cmpi eq, %4815, %4815 : i64
        %4819 = arith.andi %4817, %4818 : i1
        %4820 = scf.if %4819 -> (i64) {
          scf.yield %4814 : i64
        } else {
          scf.yield %4815 : i64
        }
        %4821 = arith.cmpi ne, %4820, %4815 : i64
        scf.if %4821 {
          func.call @stack_push_pointer(%4820) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4814) : (i64) -> ()
          %4822 = llvm.mlir.addressof @str361 : !llvm.ptr
          %4823 = func.call @cc_make_function_ref_const(%4822) : (!llvm.ptr) -> i64
          %4824 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4823, %4824) : (i64, i64) -> ()
        }
        %4825 = func.call @stack_pop_pointer() : () -> i64
        %4826 = func.call @cc_errorp(%4825) : (i64) -> i64
        %4827 = func.call @cc_nil_value() : () -> i64
        %4828 = arith.cmpi ne, %4826, %4827 : i64
        scf.if %4828 {
          func.call @stack_push_pointer(%4825) : (i64) -> ()
        } else {
          %4829 = func.call @cc_multiple_value_list(%4825) : (i64) -> i64
          func.call @stack_push_pointer(%4829) : (i64) -> ()
        }
        %4830 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4831 = func.call @stack_pop_pointer() : () -> i64
        %4832 = func.call @cc_nil_value() : () -> i64
        %4833 = func.call @cc_maybe_error_from_multiple_value_list(%4830) : (i64) -> i64
        %4834 = func.call @cc_errorp(%4833) : (i64) -> i64
        %4835 = arith.cmpi ne, %4834, %4832 : i64
        %4836 = arith.cmpi eq, %4832, %4832 : i64
        %4837 = arith.andi %4835, %4836 : i1
        %4838 = scf.if %4837 -> (i64) {
          scf.yield %4833 : i64
        } else {
          scf.yield %4832 : i64
        }
        %4839 = arith.cmpi ne, %4838, %4832 : i64
        scf.if %4839 {
          func.call @stack_push_pointer(%4838) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4840 = func.call @stack_pop_pointer() : () -> i64
          %4841 = func.call @cc_cons(%4831, %4840) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4841) : (i64) -> ()
          %4842 = func.call @stack_pop_pointer() : () -> i64
          %4843 = func.call @cc_cons(%4830, %4842) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4843) : (i64) -> ()
          %4844 = func.call @stack_pop_pointer() : () -> i64
          %4845 = func.call @cc_values_pack(%4844) : (i64) -> i64
          func.call @stack_push_pointer(%4845) : (i64) -> ()
        }
        %4846 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4846 : i64
      }
      func.call @stack_push_pointer(%4811) : (i64) -> ()
      %4847 = func.call @stack_pop_pointer() : () -> i64
      %4848 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4849 = func.call @cc_errorp(%4847) : (i64) -> i64
      %4850 = func.call @cc_nil_value() : () -> i64
      %4851 = arith.cmpi ne, %4849, %4850 : i64
      scf.if %4851 {
        %4852 = func.call @cc_condition_value(%4847) : (i64) -> i64
        %4853 = func.call @cc_values2(%4850, %4852) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4853) : (i64) -> ()
      } else {
        %4854 = func.call @cc_multiple_value_list(%4847) : (i64) -> i64
        %4855 = func.call @cc_values_pack(%4854) : (i64) -> i64
        func.call @stack_push_pointer(%4855) : (i64) -> ()
      }
      %4856 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4856 : i64
    }
    func.call @stack_push_pointer(%4805) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192214"() {
    %5054 = func.call @cc_nil_value() : () -> i64
    %5055 = func.call @cc_nil_value() : () -> i64
    %5056 = func.call @cc_errorp(%5054) : (i64) -> i64
    %5057 = arith.cmpi ne, %5056, %5055 : i64
    %5058 = scf.if %5057 -> (i64) {
      scf.yield %5054 : i64
    } else {
      %5059 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5060 = func.call @cc_nil_value() : () -> i64
      %5061 = func.call @cc_nil_value() : () -> i64
      %5062 = func.call @cc_errorp(%5060) : (i64) -> i64
      %5063 = arith.cmpi ne, %5062, %5061 : i64
      %5064 = scf.if %5063 -> (i64) {
        scf.yield %5060 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5065 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5065) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %5066 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%5066) : (i64) -> ()
        %5067 = func.call @stack_pop_pointer() : () -> i64
        %5068 = func.call @cc_nil_value() : () -> i64
        %5069 = func.call @cc_errorp(%5067) : (i64) -> i64
        %5070 = arith.cmpi ne, %5069, %5068 : i64
        %5071 = arith.cmpi eq, %5068, %5068 : i64
        %5072 = arith.andi %5070, %5071 : i1
        %5073 = scf.if %5072 -> (i64) {
          scf.yield %5067 : i64
        } else {
          scf.yield %5068 : i64
        }
        %5074 = arith.cmpi ne, %5073, %5068 : i64
        scf.if %5074 {
          func.call @stack_push_pointer(%5073) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5067) : (i64) -> ()
          %5075 = llvm.mlir.addressof @str380 : !llvm.ptr
          %5076 = func.call @cc_make_function_ref_const(%5075) : (!llvm.ptr) -> i64
          %5077 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5076, %5077) : (i64, i64) -> ()
        }
        %5078 = func.call @stack_pop_pointer() : () -> i64
        %5079 = func.call @cc_errorp(%5078) : (i64) -> i64
        %5080 = func.call @cc_nil_value() : () -> i64
        %5081 = arith.cmpi ne, %5079, %5080 : i64
        scf.if %5081 {
          func.call @stack_push_pointer(%5078) : (i64) -> ()
        } else {
          %5082 = func.call @cc_multiple_value_list(%5078) : (i64) -> i64
          func.call @stack_push_pointer(%5082) : (i64) -> ()
        }
        %5083 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5084 = func.call @stack_pop_pointer() : () -> i64
        %5085 = func.call @cc_nil_value() : () -> i64
        %5086 = func.call @cc_maybe_error_from_multiple_value_list(%5083) : (i64) -> i64
        %5087 = func.call @cc_errorp(%5086) : (i64) -> i64
        %5088 = arith.cmpi ne, %5087, %5085 : i64
        %5089 = arith.cmpi eq, %5085, %5085 : i64
        %5090 = arith.andi %5088, %5089 : i1
        %5091 = scf.if %5090 -> (i64) {
          scf.yield %5086 : i64
        } else {
          scf.yield %5085 : i64
        }
        %5092 = arith.cmpi ne, %5091, %5085 : i64
        scf.if %5092 {
          func.call @stack_push_pointer(%5091) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5093 = func.call @stack_pop_pointer() : () -> i64
          %5094 = func.call @cc_cons(%5084, %5093) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5094) : (i64) -> ()
          %5095 = func.call @stack_pop_pointer() : () -> i64
          %5096 = func.call @cc_cons(%5083, %5095) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5096) : (i64) -> ()
          %5097 = func.call @stack_pop_pointer() : () -> i64
          %5098 = func.call @cc_values_pack(%5097) : (i64) -> i64
          func.call @stack_push_pointer(%5098) : (i64) -> ()
        }
        %5099 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5099 : i64
      }
      func.call @stack_push_pointer(%5064) : (i64) -> ()
      %5100 = func.call @stack_pop_pointer() : () -> i64
      %5101 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5102 = func.call @cc_errorp(%5100) : (i64) -> i64
      %5103 = func.call @cc_nil_value() : () -> i64
      %5104 = arith.cmpi ne, %5102, %5103 : i64
      scf.if %5104 {
        %5105 = func.call @cc_condition_value(%5100) : (i64) -> i64
        %5106 = func.call @cc_values2(%5103, %5105) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5106) : (i64) -> ()
      } else {
        %5107 = func.call @cc_multiple_value_list(%5100) : (i64) -> i64
        %5108 = func.call @cc_values_pack(%5107) : (i64) -> i64
        func.call @stack_push_pointer(%5108) : (i64) -> ()
      }
      %5109 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5109 : i64
    }
    func.call @stack_push_pointer(%5058) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192215"() {
    %5307 = func.call @cc_nil_value() : () -> i64
    %5308 = func.call @cc_nil_value() : () -> i64
    %5309 = func.call @cc_errorp(%5307) : (i64) -> i64
    %5310 = arith.cmpi ne, %5309, %5308 : i64
    %5311 = scf.if %5310 -> (i64) {
      scf.yield %5307 : i64
    } else {
      %5312 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5313 = func.call @cc_nil_value() : () -> i64
      %5314 = func.call @cc_nil_value() : () -> i64
      %5315 = func.call @cc_errorp(%5313) : (i64) -> i64
      %5316 = arith.cmpi ne, %5315, %5314 : i64
      %5317 = scf.if %5316 -> (i64) {
        scf.yield %5313 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5318 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5318) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %5319 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%5319) : (i64) -> ()
        %5320 = func.call @stack_pop_pointer() : () -> i64
        %5321 = func.call @cc_nil_value() : () -> i64
        %5322 = func.call @cc_errorp(%5320) : (i64) -> i64
        %5323 = arith.cmpi ne, %5322, %5321 : i64
        %5324 = arith.cmpi eq, %5321, %5321 : i64
        %5325 = arith.andi %5323, %5324 : i1
        %5326 = scf.if %5325 -> (i64) {
          scf.yield %5320 : i64
        } else {
          scf.yield %5321 : i64
        }
        %5327 = arith.cmpi ne, %5326, %5321 : i64
        scf.if %5327 {
          func.call @stack_push_pointer(%5326) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5320) : (i64) -> ()
          %5328 = llvm.mlir.addressof @str399 : !llvm.ptr
          %5329 = func.call @cc_make_function_ref_const(%5328) : (!llvm.ptr) -> i64
          %5330 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5329, %5330) : (i64, i64) -> ()
        }
        %5331 = func.call @stack_pop_pointer() : () -> i64
        %5332 = func.call @cc_errorp(%5331) : (i64) -> i64
        %5333 = func.call @cc_nil_value() : () -> i64
        %5334 = arith.cmpi ne, %5332, %5333 : i64
        scf.if %5334 {
          func.call @stack_push_pointer(%5331) : (i64) -> ()
        } else {
          %5335 = func.call @cc_multiple_value_list(%5331) : (i64) -> i64
          func.call @stack_push_pointer(%5335) : (i64) -> ()
        }
        %5336 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5337 = func.call @stack_pop_pointer() : () -> i64
        %5338 = func.call @cc_nil_value() : () -> i64
        %5339 = func.call @cc_maybe_error_from_multiple_value_list(%5336) : (i64) -> i64
        %5340 = func.call @cc_errorp(%5339) : (i64) -> i64
        %5341 = arith.cmpi ne, %5340, %5338 : i64
        %5342 = arith.cmpi eq, %5338, %5338 : i64
        %5343 = arith.andi %5341, %5342 : i1
        %5344 = scf.if %5343 -> (i64) {
          scf.yield %5339 : i64
        } else {
          scf.yield %5338 : i64
        }
        %5345 = arith.cmpi ne, %5344, %5338 : i64
        scf.if %5345 {
          func.call @stack_push_pointer(%5344) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5346 = func.call @stack_pop_pointer() : () -> i64
          %5347 = func.call @cc_cons(%5337, %5346) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5347) : (i64) -> ()
          %5348 = func.call @stack_pop_pointer() : () -> i64
          %5349 = func.call @cc_cons(%5336, %5348) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5349) : (i64) -> ()
          %5350 = func.call @stack_pop_pointer() : () -> i64
          %5351 = func.call @cc_values_pack(%5350) : (i64) -> i64
          func.call @stack_push_pointer(%5351) : (i64) -> ()
        }
        %5352 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5352 : i64
      }
      func.call @stack_push_pointer(%5317) : (i64) -> ()
      %5353 = func.call @stack_pop_pointer() : () -> i64
      %5354 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5355 = func.call @cc_errorp(%5353) : (i64) -> i64
      %5356 = func.call @cc_nil_value() : () -> i64
      %5357 = arith.cmpi ne, %5355, %5356 : i64
      scf.if %5357 {
        %5358 = func.call @cc_condition_value(%5353) : (i64) -> i64
        %5359 = func.call @cc_values2(%5356, %5358) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5359) : (i64) -> ()
      } else {
        %5360 = func.call @cc_multiple_value_list(%5353) : (i64) -> i64
        %5361 = func.call @cc_values_pack(%5360) : (i64) -> i64
        func.call @stack_push_pointer(%5361) : (i64) -> ()
      }
      %5362 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5362 : i64
    }
    func.call @stack_push_pointer(%5311) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192216"() {
    %5560 = func.call @cc_nil_value() : () -> i64
    %5561 = func.call @cc_nil_value() : () -> i64
    %5562 = func.call @cc_errorp(%5560) : (i64) -> i64
    %5563 = arith.cmpi ne, %5562, %5561 : i64
    %5564 = scf.if %5563 -> (i64) {
      scf.yield %5560 : i64
    } else {
      %5565 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5566 = func.call @cc_nil_value() : () -> i64
      %5567 = func.call @cc_nil_value() : () -> i64
      %5568 = func.call @cc_errorp(%5566) : (i64) -> i64
      %5569 = arith.cmpi ne, %5568, %5567 : i64
      %5570 = scf.if %5569 -> (i64) {
        scf.yield %5566 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5571 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5571) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %5572 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%5572) : (i64) -> ()
        %5573 = func.call @stack_pop_pointer() : () -> i64
        %5574 = func.call @cc_nil_value() : () -> i64
        %5575 = func.call @cc_errorp(%5573) : (i64) -> i64
        %5576 = arith.cmpi ne, %5575, %5574 : i64
        %5577 = arith.cmpi eq, %5574, %5574 : i64
        %5578 = arith.andi %5576, %5577 : i1
        %5579 = scf.if %5578 -> (i64) {
          scf.yield %5573 : i64
        } else {
          scf.yield %5574 : i64
        }
        %5580 = arith.cmpi ne, %5579, %5574 : i64
        scf.if %5580 {
          func.call @stack_push_pointer(%5579) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5573) : (i64) -> ()
          %5581 = llvm.mlir.addressof @str418 : !llvm.ptr
          %5582 = func.call @cc_make_function_ref_const(%5581) : (!llvm.ptr) -> i64
          %5583 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5582, %5583) : (i64, i64) -> ()
        }
        %5584 = func.call @stack_pop_pointer() : () -> i64
        %5585 = func.call @cc_errorp(%5584) : (i64) -> i64
        %5586 = func.call @cc_nil_value() : () -> i64
        %5587 = arith.cmpi ne, %5585, %5586 : i64
        scf.if %5587 {
          func.call @stack_push_pointer(%5584) : (i64) -> ()
        } else {
          %5588 = func.call @cc_multiple_value_list(%5584) : (i64) -> i64
          func.call @stack_push_pointer(%5588) : (i64) -> ()
        }
        %5589 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5590 = func.call @stack_pop_pointer() : () -> i64
        %5591 = func.call @cc_nil_value() : () -> i64
        %5592 = func.call @cc_maybe_error_from_multiple_value_list(%5589) : (i64) -> i64
        %5593 = func.call @cc_errorp(%5592) : (i64) -> i64
        %5594 = arith.cmpi ne, %5593, %5591 : i64
        %5595 = arith.cmpi eq, %5591, %5591 : i64
        %5596 = arith.andi %5594, %5595 : i1
        %5597 = scf.if %5596 -> (i64) {
          scf.yield %5592 : i64
        } else {
          scf.yield %5591 : i64
        }
        %5598 = arith.cmpi ne, %5597, %5591 : i64
        scf.if %5598 {
          func.call @stack_push_pointer(%5597) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5599 = func.call @stack_pop_pointer() : () -> i64
          %5600 = func.call @cc_cons(%5590, %5599) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5600) : (i64) -> ()
          %5601 = func.call @stack_pop_pointer() : () -> i64
          %5602 = func.call @cc_cons(%5589, %5601) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5602) : (i64) -> ()
          %5603 = func.call @stack_pop_pointer() : () -> i64
          %5604 = func.call @cc_values_pack(%5603) : (i64) -> i64
          func.call @stack_push_pointer(%5604) : (i64) -> ()
        }
        %5605 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5605 : i64
      }
      func.call @stack_push_pointer(%5570) : (i64) -> ()
      %5606 = func.call @stack_pop_pointer() : () -> i64
      %5607 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5608 = func.call @cc_errorp(%5606) : (i64) -> i64
      %5609 = func.call @cc_nil_value() : () -> i64
      %5610 = arith.cmpi ne, %5608, %5609 : i64
      scf.if %5610 {
        %5611 = func.call @cc_condition_value(%5606) : (i64) -> i64
        %5612 = func.call @cc_values2(%5609, %5611) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5612) : (i64) -> ()
      } else {
        %5613 = func.call @cc_multiple_value_list(%5606) : (i64) -> i64
        %5614 = func.call @cc_values_pack(%5613) : (i64) -> i64
        func.call @stack_push_pointer(%5614) : (i64) -> ()
      }
      %5615 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5615 : i64
    }
    func.call @stack_push_pointer(%5564) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192217"() {
    %5813 = func.call @cc_nil_value() : () -> i64
    %5814 = func.call @cc_nil_value() : () -> i64
    %5815 = func.call @cc_errorp(%5813) : (i64) -> i64
    %5816 = arith.cmpi ne, %5815, %5814 : i64
    %5817 = scf.if %5816 -> (i64) {
      scf.yield %5813 : i64
    } else {
      %5818 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %5819 = func.call @cc_nil_value() : () -> i64
      %5820 = func.call @cc_nil_value() : () -> i64
      %5821 = func.call @cc_errorp(%5819) : (i64) -> i64
      %5822 = arith.cmpi ne, %5821, %5820 : i64
      %5823 = scf.if %5822 -> (i64) {
        scf.yield %5819 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %5824 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%5824) : (i64) -> ()
        func.call @cc_make_hash_table_stack() : () -> ()
        %5825 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%5825) : (i64) -> ()
        %5826 = func.call @stack_pop_pointer() : () -> i64
        %5827 = func.call @cc_nil_value() : () -> i64
        %5828 = func.call @cc_errorp(%5826) : (i64) -> i64
        %5829 = arith.cmpi ne, %5828, %5827 : i64
        %5830 = arith.cmpi eq, %5827, %5827 : i64
        %5831 = arith.andi %5829, %5830 : i1
        %5832 = scf.if %5831 -> (i64) {
          scf.yield %5826 : i64
        } else {
          scf.yield %5827 : i64
        }
        %5833 = arith.cmpi ne, %5832, %5827 : i64
        scf.if %5833 {
          func.call @stack_push_pointer(%5832) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%5826) : (i64) -> ()
          %5834 = llvm.mlir.addressof @str437 : !llvm.ptr
          %5835 = func.call @cc_make_function_ref_const(%5834) : (!llvm.ptr) -> i64
          %5836 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%5835, %5836) : (i64, i64) -> ()
        }
        %5837 = func.call @stack_pop_pointer() : () -> i64
        %5838 = func.call @cc_errorp(%5837) : (i64) -> i64
        %5839 = func.call @cc_nil_value() : () -> i64
        %5840 = arith.cmpi ne, %5838, %5839 : i64
        scf.if %5840 {
          func.call @stack_push_pointer(%5837) : (i64) -> ()
        } else {
          %5841 = func.call @cc_multiple_value_list(%5837) : (i64) -> i64
          func.call @stack_push_pointer(%5841) : (i64) -> ()
        }
        %5842 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %5843 = func.call @stack_pop_pointer() : () -> i64
        %5844 = func.call @cc_nil_value() : () -> i64
        %5845 = func.call @cc_maybe_error_from_multiple_value_list(%5842) : (i64) -> i64
        %5846 = func.call @cc_errorp(%5845) : (i64) -> i64
        %5847 = arith.cmpi ne, %5846, %5844 : i64
        %5848 = arith.cmpi eq, %5844, %5844 : i64
        %5849 = arith.andi %5847, %5848 : i1
        %5850 = scf.if %5849 -> (i64) {
          scf.yield %5845 : i64
        } else {
          scf.yield %5844 : i64
        }
        %5851 = arith.cmpi ne, %5850, %5844 : i64
        scf.if %5851 {
          func.call @stack_push_pointer(%5850) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %5852 = func.call @stack_pop_pointer() : () -> i64
          %5853 = func.call @cc_cons(%5843, %5852) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5853) : (i64) -> ()
          %5854 = func.call @stack_pop_pointer() : () -> i64
          %5855 = func.call @cc_cons(%5842, %5854) : (i64, i64) -> i64
          func.call @stack_push_pointer(%5855) : (i64) -> ()
          %5856 = func.call @stack_pop_pointer() : () -> i64
          %5857 = func.call @cc_values_pack(%5856) : (i64) -> i64
          func.call @stack_push_pointer(%5857) : (i64) -> ()
        }
        %5858 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %5858 : i64
      }
      func.call @stack_push_pointer(%5823) : (i64) -> ()
      %5859 = func.call @stack_pop_pointer() : () -> i64
      %5860 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %5861 = func.call @cc_errorp(%5859) : (i64) -> i64
      %5862 = func.call @cc_nil_value() : () -> i64
      %5863 = arith.cmpi ne, %5861, %5862 : i64
      scf.if %5863 {
        %5864 = func.call @cc_condition_value(%5859) : (i64) -> i64
        %5865 = func.call @cc_values2(%5862, %5864) : (i64, i64) -> i64
        func.call @stack_push_pointer(%5865) : (i64) -> ()
      } else {
        %5866 = func.call @cc_multiple_value_list(%5859) : (i64) -> i64
        %5867 = func.call @cc_values_pack(%5866) : (i64) -> i64
        func.call @stack_push_pointer(%5867) : (i64) -> ()
      }
      %5868 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5868 : i64
    }
    func.call @stack_push_pointer(%5817) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192218"() {
    %6039 = func.call @cc_nil_value() : () -> i64
    %6040 = func.call @cc_nil_value() : () -> i64
    %6041 = func.call @cc_errorp(%6039) : (i64) -> i64
    %6042 = arith.cmpi ne, %6041, %6040 : i64
    %6043 = scf.if %6042 -> (i64) {
      scf.yield %6039 : i64
    } else {
      %6044 = arith.constant 13 : i64
      func.call @stack_push_fixnum(%6044) : (i64) -> ()
      %6045 = func.call @stack_pop_pointer() : () -> i64
      %6046 = func.call @cc_unbox_fixnum(%6045) : (i64) -> i64
      %6047 = func.call @cc_box_character(%6046) : (i64) -> i64
      func.call @stack_push_pointer(%6047) : (i64) -> ()
      %6048 = func.call @stack_pop_pointer() : () -> i64
      %6049 = func.call @cc_char_name(%6048) : (i64) -> i64
      func.call @stack_push_pointer(%6049) : (i64) -> ()
      %6050 = func.call @stack_pop_pointer() : () -> i64
      %6051 = func.call @cc_name_char(%6050) : (i64) -> i64
      func.call @stack_push_pointer(%6051) : (i64) -> ()
      %6052 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6052 : i64
    }
    func.call @stack_push_pointer(%6043) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192219"() {
    %6204 = func.call @cc_nil_value() : () -> i64
    %6205 = func.call @cc_nil_value() : () -> i64
    %6206 = func.call @cc_errorp(%6204) : (i64) -> i64
    %6207 = arith.cmpi ne, %6206, %6205 : i64
    %6208 = scf.if %6207 -> (i64) {
      scf.yield %6204 : i64
    } else {
      %6209 = arith.constant 128 : i64
      func.call @stack_push_fixnum(%6209) : (i64) -> ()
      %6210 = func.call @stack_pop_pointer() : () -> i64
      %6211 = func.call @cc_unbox_fixnum(%6210) : (i64) -> i64
      %6212 = func.call @cc_box_character(%6211) : (i64) -> i64
      func.call @stack_push_pointer(%6212) : (i64) -> ()
      %6213 = func.call @stack_pop_pointer() : () -> i64
      %6214 = func.call @cc_char_name(%6213) : (i64) -> i64
      func.call @stack_push_pointer(%6214) : (i64) -> ()
      %6215 = func.call @stack_pop_pointer() : () -> i64
      %6216 = func.call @cc_name_char(%6215) : (i64) -> i64
      func.call @stack_push_pointer(%6216) : (i64) -> ()
      %6217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6217 : i64
    }
    func.call @stack_push_pointer(%6208) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192220"() {
    %6383 = func.call @cc_nil_value() : () -> i64
    %6384 = func.call @cc_nil_value() : () -> i64
    %6385 = func.call @cc_errorp(%6383) : (i64) -> i64
    %6386 = arith.cmpi ne, %6385, %6384 : i64
    %6387 = scf.if %6386 -> (i64) {
      scf.yield %6383 : i64
    } else {
      %6388 = arith.constant 255 : i64
      func.call @stack_push_fixnum(%6388) : (i64) -> ()
      %6389 = func.call @stack_pop_pointer() : () -> i64
      %6390 = func.call @cc_unbox_fixnum(%6389) : (i64) -> i64
      %6391 = func.call @cc_box_character(%6390) : (i64) -> i64
      func.call @stack_push_pointer(%6391) : (i64) -> ()
      %6392 = func.call @stack_pop_pointer() : () -> i64
      %6393 = func.call @cc_char_name(%6392) : (i64) -> i64
      func.call @stack_push_pointer(%6393) : (i64) -> ()
      %6394 = func.call @stack_pop_pointer() : () -> i64
      %6395 = func.call @cc_name_char(%6394) : (i64) -> i64
      func.call @stack_push_pointer(%6395) : (i64) -> ()
      %6396 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6397 = func.call @stack_pop_pointer() : () -> i64
      %6398 = func.call @cc_cons(%6396, %6397) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6398) : (i64) -> ()
      %6399 = func.call @stack_pop_pointer() : () -> i64
      %6400 = func.call @cc_values_pack(%6399) : (i64) -> i64
      func.call @stack_push_pointer(%6400) : (i64) -> ()
      %6401 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6401 : i64
    }
    func.call @stack_push_pointer(%6387) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192221"() {
    %6575 = func.call @cc_nil_value() : () -> i64
    %6576 = func.call @cc_nil_value() : () -> i64
    %6577 = func.call @cc_errorp(%6575) : (i64) -> i64
    %6578 = arith.cmpi ne, %6577, %6576 : i64
    %6579 = scf.if %6578 -> (i64) {
      scf.yield %6575 : i64
    } else {
      %6580 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%6580) : (i64) -> ()
      %6581 = func.call @stack_pop_pointer() : () -> i64
      %6582 = func.call @cc_unbox_fixnum(%6581) : (i64) -> i64
      %6583 = func.call @cc_box_character(%6582) : (i64) -> i64
      func.call @stack_push_pointer(%6583) : (i64) -> ()
      %6584 = func.call @stack_pop_pointer() : () -> i64
      %6585 = func.call @cc_char_name(%6584) : (i64) -> i64
      func.call @stack_push_pointer(%6585) : (i64) -> ()
      %6586 = func.call @stack_pop_pointer() : () -> i64
      %6587 = func.call @cc_name_char(%6586) : (i64) -> i64
      func.call @stack_push_pointer(%6587) : (i64) -> ()
      %6588 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6589 = func.call @stack_pop_pointer() : () -> i64
      %6590 = func.call @cc_cons(%6588, %6589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6590) : (i64) -> ()
      %6591 = func.call @stack_pop_pointer() : () -> i64
      %6592 = func.call @cc_values_pack(%6591) : (i64) -> i64
      func.call @stack_push_pointer(%6592) : (i64) -> ()
      %6593 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6593 : i64
    }
    func.call @stack_push_pointer(%6579) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192222"() {
    %7590 = func.call @cc_nil_value() : () -> i64
    %7591 = func.call @cc_nil_value() : () -> i64
    %7592 = func.call @cc_errorp(%7590) : (i64) -> i64
    %7593 = arith.cmpi ne, %7592, %7591 : i64
    %7594 = scf.if %7593 -> (i64) {
      scf.yield %7590 : i64
    } else {
      %7595 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%7595) : (i64) -> ()
      %7596 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7597 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7598 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7599 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7600 = func.call @stack_pop_pointer() : () -> i64
      %7601 = func.call @cc_nil_value() : () -> i64
      %7602 = func.call @cc_nil_value() : () -> i64
      %7603 = func.call @cc_errorp(%7601) : (i64) -> i64
      %7604 = arith.cmpi ne, %7603, %7602 : i64
      %7605:6 = scf.if %7604 -> (i64, i64, i64, i64, i64, i64) {
        scf.yield %7601, %7600, %7597, %7599, %7596, %7598 : i64, i64, i64, i64, i64, i64
      } else {
        %7606 = func.call @cc_nil_value() : () -> i64
        %7607 = llvm.mlir.addressof @str587 : !llvm.ptr
        %7608 = arith.constant 38 : i64
        %7609 = func.call @cc_make_string(%7607, %7608) : (!llvm.ptr, i64) -> i64
        %7610 = func.call @cc_nil_value() : () -> i64
        %7611 = func.call @cc_intern(%7609, %7610) : (i64, i64) -> i64
        %7612 = func.call @cc_nil_value() : () -> i64
        %7613 = func.call @cc_cons(%7611, %7612) : (i64, i64) -> i64
        %7614 = func.call @cc_values_pack(%7613) : (i64) -> i64
        %7615 = func.call @cc_set_symbol_value(%7611, %7606) : (i64, i64) -> i64
        %7616 = llvm.mlir.addressof @str588 : !llvm.ptr
        %7617 = arith.constant 39 : i64
        %7618 = func.call @cc_make_string(%7616, %7617) : (!llvm.ptr, i64) -> i64
        %7619 = func.call @cc_nil_value() : () -> i64
        %7620 = func.call @cc_intern(%7618, %7619) : (i64, i64) -> i64
        %7621 = func.call @cc_nil_value() : () -> i64
        %7622 = func.call @cc_cons(%7620, %7621) : (i64, i64) -> i64
        %7623 = func.call @cc_values_pack(%7622) : (i64) -> i64
        %7624 = func.call @cc_set_symbol_value(%7620, %7606) : (i64, i64) -> i64
        %7625 = llvm.mlir.addressof @str589 : !llvm.ptr
        %7626 = arith.constant 40 : i64
        %7627 = func.call @cc_make_string(%7625, %7626) : (!llvm.ptr, i64) -> i64
        %7628 = func.call @cc_nil_value() : () -> i64
        %7629 = func.call @cc_intern(%7627, %7628) : (i64, i64) -> i64
        %7630 = func.call @cc_nil_value() : () -> i64
        %7631 = func.call @cc_cons(%7629, %7630) : (i64, i64) -> i64
        %7632 = func.call @cc_values_pack(%7631) : (i64) -> i64
        %7633 = func.call @cc_set_symbol_value(%7629, %7606) : (i64, i64) -> i64
        %7634:5 = scf.while (%arg0 = %7600, %arg1 = %7597, %arg2 = %7598, %arg3 = %7599, %arg4 = %7596) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
          func.call @stack_push_pointer(%arg4) : (i64) -> ()
          %7635 = func.call @stack_pop_pointer() : () -> i64
          %7636 = arith.constant 65536 : i64
          func.call @stack_push_fixnum(%7636) : (i64) -> ()
          %7637 = func.call @stack_pop_pointer() : () -> i64
          %7638 = arith.constant 55296 : i64
          %7639 = func.call @cc_box_fixnum(%7638) : (i64) -> i64
          func.call @stack_push_pointer(%7639) : (i64) -> ()
          %7640 = func.call @stack_pop_pointer() : () -> i64
          %7641 = func.call @cc_nil_value() : () -> i64
          %7642 = func.call @cc_errorp(%7637) : (i64) -> i64
          %7643 = arith.cmpi ne, %7642, %7641 : i64
          %7644 = arith.cmpi eq, %7641, %7641 : i64
          %7645 = arith.andi %7643, %7644 : i1
          %7646 = scf.if %7645 -> (i64) {
            scf.yield %7637 : i64
          } else {
            scf.yield %7641 : i64
          }
          %7647 = func.call @cc_errorp(%7640) : (i64) -> i64
          %7648 = arith.cmpi ne, %7647, %7641 : i64
          %7649 = arith.cmpi eq, %7646, %7641 : i64
          %7650 = arith.andi %7648, %7649 : i1
          %7651 = scf.if %7650 -> (i64) {
            scf.yield %7640 : i64
          } else {
            scf.yield %7646 : i64
          }
          %7652 = arith.cmpi ne, %7651, %7641 : i64
          scf.if %7652 {
            func.call @stack_push_pointer(%7651) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%7637) : (i64) -> ()
            func.call @stack_push_pointer(%7640) : (i64) -> ()
            %7653 = llvm.mlir.addressof @str590 : !llvm.ptr
            %7654 = func.call @cc_make_function_ref_const(%7653) : (!llvm.ptr) -> i64
            %7655 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%7654, %7655) : (i64, i64) -> ()
          }
          %7656 = func.call @stack_pop_pointer() : () -> i64
          %7657 = arith.constant 1 : i1
          %7659 = arith.constant 3 : i64
          %7658 = arith.andi %7635, %7659 : i64
          %7660 = arith.constant 0 : i64
          %7661 = arith.cmpi eq, %7658, %7660 : i64
          %7663 = arith.constant 3 : i64
          %7662 = arith.andi %7656, %7663 : i64
          %7664 = arith.constant 0 : i64
          %7665 = arith.cmpi eq, %7662, %7664 : i64
          %7666 = arith.andi %7661, %7665 : i1
          %7667 = scf.if %7666 -> (i1) {
            %7668 = arith.constant 2 : i64
            %7669 = arith.shrsi %7635, %7668 : i64
            %7670 = arith.constant 2 : i64
            %7671 = arith.shrsi %7656, %7670 : i64
            %7672 = arith.cmpi slt, %7669, %7671 : i64
            scf.yield %7672 : i1
          } else {
            %7673 = func.call @cc_lt(%7635, %7656) : (i64, i64) -> i64
            %7674 = func.call @cc_nil_value() : () -> i64
            %7675 = arith.cmpi ne, %7673, %7674 : i64
            scf.yield %7675 : i1
          }
          %7676 = arith.andi %7657, %7667 : i1
          %7677 = func.call @cc_nil_value() : () -> i64
          %7678 = func.call @cc_t_value() : () -> i64
          %7679 = scf.if %7676 -> (i64) {
            scf.yield %7678 : i64
          } else {
            scf.yield %7677 : i64
          }
          func.call @stack_push_pointer(%7679) : (i64) -> ()
          %7680 = func.call @stack_pop_pointer() : () -> i64
          %7681 = func.call @cc_nil_value() : () -> i64
          %7682 = arith.cmpi ne, %7680, %7681 : i64
          %7683 = func.call @cc_nil_value() : () -> i64
          %7684 = llvm.mlir.addressof @str591 : !llvm.ptr
          %7685 = arith.constant 38 : i64
          %7686 = func.call @cc_make_string(%7684, %7685) : (!llvm.ptr, i64) -> i64
          %7687 = func.call @cc_nil_value() : () -> i64
          %7688 = func.call @cc_intern(%7686, %7687) : (i64, i64) -> i64
          %7689 = func.call @cc_nil_value() : () -> i64
          %7690 = func.call @cc_cons(%7688, %7689) : (i64, i64) -> i64
          %7691 = func.call @cc_values_pack(%7690) : (i64) -> i64
          %7692 = func.call @cc_symbol_value(%7688) : (i64) -> i64
          %7693 = arith.cmpi ne, %7692, %7683 : i64
          %7694 = llvm.mlir.addressof @str592 : !llvm.ptr
          %7695 = arith.constant 38 : i64
          %7696 = func.call @cc_make_string(%7694, %7695) : (!llvm.ptr, i64) -> i64
          %7697 = func.call @cc_nil_value() : () -> i64
          %7698 = func.call @cc_intern(%7696, %7697) : (i64, i64) -> i64
          %7699 = func.call @cc_nil_value() : () -> i64
          %7700 = func.call @cc_cons(%7698, %7699) : (i64, i64) -> i64
          %7701 = func.call @cc_values_pack(%7700) : (i64) -> i64
          %7702 = func.call @cc_symbol_value(%7698) : (i64) -> i64
          %7703 = arith.cmpi ne, %7702, %7683 : i64
          %7704 = arith.ori %7693, %7703 : i1
          %7705 = arith.constant 0 : i1
          %7706 = arith.cmpi eq, %7704, %7705 : i1
          %7707 = arith.andi %7682, %7706 : i1
          scf.condition(%7707) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
        } do {
          ^bb0(%7708: i64, %7709: i64, %7710: i64, %7711: i64, %7712: i64):
          %7713 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%7713) : (i64) -> ()
          %7714 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%7714) : (i64) -> ()
          %7715 = func.call @stack_depth() : () -> i64
          %7716 = arith.constant 0 : i64
          %7717 = arith.cmpi sgt, %7715, %7716 : i64
          scf.if %7717 {
            %7718 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%7712) : (i64) -> ()
          %7719 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%7719) : (i64) -> ()
          %7720 = func.call @stack_depth() : () -> i64
          %7721 = arith.constant 0 : i64
          %7722 = arith.cmpi sgt, %7720, %7721 : i64
          scf.if %7722 {
            %7723 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%7712) : (i64) -> ()
          %7724 = func.call @stack_pop_pointer() : () -> i64
          %7725 = func.call @cc_unbox_fixnum(%7724) : (i64) -> i64
          %7726 = func.call @cc_box_character(%7725) : (i64) -> i64
          func.call @stack_push_pointer(%7726) : (i64) -> ()
          %7727 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%7727) : (i64) -> ()
          %7728 = func.call @stack_depth() : () -> i64
          %7729 = arith.constant 0 : i64
          %7730 = arith.cmpi sgt, %7728, %7729 : i64
          scf.if %7730 {
            %7731 = func.call @stack_pop_pointer() : () -> i64
          }
          %7732 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%7727) : (i64) -> ()
          %7733 = func.call @stack_pop_pointer() : () -> i64
          %7734 = func.call @cc_characterp(%7733) : (i64) -> i64
          func.call @stack_push_pointer(%7734) : (i64) -> ()
          %7735 = func.call @stack_pop_pointer() : () -> i64
          %7736 = func.call @cc_nil_value() : () -> i64
          %7737 = func.call @cc_cons(%7735, %7736) : (i64, i64) -> i64
          %7738 = func.call @cc_not(%7737) : (i64) -> i64
          func.call @stack_push_pointer(%7738) : (i64) -> ()
          %7739 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%7727) : (i64) -> ()
          %7740 = func.call @stack_pop_pointer() : () -> i64
          %7741 = func.call @cc_nil_value() : () -> i64
          %7742 = func.call @cc_errorp(%7740) : (i64) -> i64
          %7743 = arith.cmpi ne, %7742, %7741 : i64
          %7744 = arith.cmpi eq, %7741, %7741 : i64
          %7745 = arith.andi %7743, %7744 : i1
          %7746 = scf.if %7745 -> (i64) {
            scf.yield %7740 : i64
          } else {
            scf.yield %7741 : i64
          }
          %7747 = arith.cmpi ne, %7746, %7741 : i64
          scf.if %7747 {
            func.call @stack_push_pointer(%7746) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%7740) : (i64) -> ()
            %7748 = llvm.mlir.addressof @str593 : !llvm.ptr
            %7749 = func.call @cc_make_function_ref_const(%7748) : (!llvm.ptr) -> i64
            %7750 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%7749, %7750) : (i64, i64) -> ()
          }
          %7751 = func.call @stack_pop_pointer() : () -> i64
          %7752 = func.call @cc_nil_value() : () -> i64
          %7753 = arith.cmpi ne, %7751, %7752 : i64
          scf.if %7753 {
            %7754 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%7727) : (i64) -> ()
            %7755 = func.call @stack_pop_pointer() : () -> i64
            %7756 = func.call @cc_nil_value() : () -> i64
            %7757 = func.call @cc_errorp(%7755) : (i64) -> i64
            %7758 = arith.cmpi ne, %7757, %7756 : i64
            %7759 = arith.cmpi eq, %7756, %7756 : i64
            %7760 = arith.andi %7758, %7759 : i1
            %7761 = scf.if %7760 -> (i64) {
              scf.yield %7755 : i64
            } else {
              scf.yield %7756 : i64
            }
            %7762 = arith.cmpi ne, %7761, %7756 : i64
            scf.if %7762 {
              func.call @stack_push_pointer(%7761) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7755) : (i64) -> ()
              %7763 = llvm.mlir.addressof @str594 : !llvm.ptr
              %7764 = func.call @cc_make_function_ref_const(%7763) : (!llvm.ptr) -> i64
              %7765 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7764, %7765) : (i64, i64) -> ()
            }
            %7766 = func.call @stack_pop_pointer() : () -> i64
            %7767 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%7727) : (i64) -> ()
            %7768 = func.call @stack_pop_pointer() : () -> i64
            %7769 = func.call @cc_nil_value() : () -> i64
            %7770 = func.call @cc_errorp(%7768) : (i64) -> i64
            %7771 = arith.cmpi ne, %7770, %7769 : i64
            %7772 = arith.cmpi eq, %7769, %7769 : i64
            %7773 = arith.andi %7771, %7772 : i1
            %7774 = scf.if %7773 -> (i64) {
              scf.yield %7768 : i64
            } else {
              scf.yield %7769 : i64
            }
            %7775 = arith.cmpi ne, %7774, %7769 : i64
            scf.if %7775 {
              func.call @stack_push_pointer(%7774) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7768) : (i64) -> ()
              %7776 = llvm.mlir.addressof @str595 : !llvm.ptr
              %7777 = func.call @cc_make_function_ref_const(%7776) : (!llvm.ptr) -> i64
              %7778 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7777, %7778) : (i64, i64) -> ()
            }
            %7779 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%7727) : (i64) -> ()
            %7780 = func.call @stack_pop_pointer() : () -> i64
            %7781 = func.call @cc_nil_value() : () -> i64
            %7782 = func.call @cc_errorp(%7780) : (i64) -> i64
            %7783 = arith.cmpi ne, %7782, %7781 : i64
            %7784 = arith.cmpi eq, %7781, %7781 : i64
            %7785 = arith.andi %7783, %7784 : i1
            %7786 = scf.if %7785 -> (i64) {
              scf.yield %7780 : i64
            } else {
              scf.yield %7781 : i64
            }
            %7787 = arith.cmpi ne, %7786, %7781 : i64
            scf.if %7787 {
              func.call @stack_push_pointer(%7786) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7780) : (i64) -> ()
              %7788 = llvm.mlir.addressof @str596 : !llvm.ptr
              %7789 = func.call @cc_make_function_ref_const(%7788) : (!llvm.ptr) -> i64
              %7790 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7789, %7790) : (i64, i64) -> ()
            }
            %7791 = func.call @stack_pop_pointer() : () -> i64
            %7792 = func.call @cc_cons(%7791, %7767) : (i64, i64) -> i64
            %7793 = func.call @cc_cons(%7779, %7792) : (i64, i64) -> i64
            %7794 = func.call @cc_or(%7793) : (i64) -> i64
            func.call @stack_push_pointer(%7794) : (i64) -> ()
            %7795 = func.call @stack_pop_pointer() : () -> i64
            %7796 = func.call @cc_cons(%7795, %7754) : (i64, i64) -> i64
            %7797 = func.call @cc_cons(%7766, %7796) : (i64, i64) -> i64
            %7798 = func.call @cc_and(%7797) : (i64) -> i64
            func.call @stack_push_pointer(%7798) : (i64) -> ()
          } else {
            %7799 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%7727) : (i64) -> ()
            %7800 = func.call @stack_pop_pointer() : () -> i64
            %7801 = func.call @cc_nil_value() : () -> i64
            %7802 = func.call @cc_errorp(%7800) : (i64) -> i64
            %7803 = arith.cmpi ne, %7802, %7801 : i64
            %7804 = arith.cmpi eq, %7801, %7801 : i64
            %7805 = arith.andi %7803, %7804 : i1
            %7806 = scf.if %7805 -> (i64) {
              scf.yield %7800 : i64
            } else {
              scf.yield %7801 : i64
            }
            %7807 = arith.cmpi ne, %7806, %7801 : i64
            scf.if %7807 {
              func.call @stack_push_pointer(%7806) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7800) : (i64) -> ()
              %7808 = llvm.mlir.addressof @str597 : !llvm.ptr
              %7809 = func.call @cc_make_function_ref_const(%7808) : (!llvm.ptr) -> i64
              %7810 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7809, %7810) : (i64, i64) -> ()
            }
            %7811 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%7727) : (i64) -> ()
            %7812 = func.call @stack_pop_pointer() : () -> i64
            %7813 = func.call @cc_nil_value() : () -> i64
            %7814 = func.call @cc_errorp(%7812) : (i64) -> i64
            %7815 = arith.cmpi ne, %7814, %7813 : i64
            %7816 = arith.cmpi eq, %7813, %7813 : i64
            %7817 = arith.andi %7815, %7816 : i1
            %7818 = scf.if %7817 -> (i64) {
              scf.yield %7812 : i64
            } else {
              scf.yield %7813 : i64
            }
            %7819 = arith.cmpi ne, %7818, %7813 : i64
            scf.if %7819 {
              func.call @stack_push_pointer(%7818) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%7812) : (i64) -> ()
              %7820 = llvm.mlir.addressof @str598 : !llvm.ptr
              %7821 = func.call @cc_make_function_ref_const(%7820) : (!llvm.ptr) -> i64
              %7822 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%7821, %7822) : (i64, i64) -> ()
            }
            %7823 = func.call @stack_pop_pointer() : () -> i64
            %7824 = func.call @cc_cons(%7823, %7799) : (i64, i64) -> i64
            %7825 = func.call @cc_cons(%7811, %7824) : (i64, i64) -> i64
            %7826 = func.call @cc_or(%7825) : (i64) -> i64
            func.call @stack_push_pointer(%7826) : (i64) -> ()
            %7827 = func.call @stack_pop_pointer() : () -> i64
            %7828 = func.call @cc_nil_value() : () -> i64
            %7829 = func.call @cc_cons(%7827, %7828) : (i64, i64) -> i64
            %7830 = func.call @cc_not(%7829) : (i64) -> i64
            func.call @stack_push_pointer(%7830) : (i64) -> ()
          }
          %7831 = func.call @stack_pop_pointer() : () -> i64
          %7832 = func.call @cc_cons(%7831, %7732) : (i64, i64) -> i64
          %7833 = func.call @cc_cons(%7739, %7832) : (i64, i64) -> i64
          %7834 = func.call @cc_or(%7833) : (i64) -> i64
          func.call @stack_push_pointer(%7834) : (i64) -> ()
          %7835 = func.call @stack_pop_pointer() : () -> i64
          %7836 = func.call @cc_nil_value() : () -> i64
          %7837 = func.call @cc_cons(%7835, %7836) : (i64, i64) -> i64
          %7838 = func.call @cc_not(%7837) : (i64) -> i64
          func.call @stack_push_pointer(%7838) : (i64) -> ()
          %7839 = func.call @stack_pop_pointer() : () -> i64
          %7840 = func.call @cc_nil_value() : () -> i64
          %7841 = arith.cmpi ne, %7839, %7840 : i64
          %7842:2 = scf.if %7841 -> (i64, i64) {
            %7843 = func.call @cc_nil_value() : () -> i64
            %7844 = func.call @cc_nil_value() : () -> i64
            %7845 = func.call @cc_errorp(%7843) : (i64) -> i64
            %7846 = arith.cmpi ne, %7845, %7844 : i64
            %7847:2 = scf.if %7846 -> (i64, i64) {
              scf.yield %7843, %7711 : i64, i64
            } else {
              func.call @stack_push_pointer(%7711) : (i64) -> ()
              func.call @stack_push_pointer(%7727) : (i64) -> ()
              %7848 = func.call @stack_pop_pointer() : () -> i64
              %7849 = func.call @cc_char_name(%7848) : (i64) -> i64
              func.call @stack_push_pointer(%7849) : (i64) -> ()
              %7850 = func.call @stack_pop_pointer() : () -> i64
              %7851 = func.call @cc_nil_value() : () -> i64
              %7852 = func.call @cc_errorp(%7850) : (i64) -> i64
              %7853 = arith.cmpi ne, %7852, %7851 : i64
              %7854 = arith.cmpi eq, %7851, %7851 : i64
              %7855 = arith.andi %7853, %7854 : i1
              %7856 = scf.if %7855 -> (i64) {
                scf.yield %7850 : i64
              } else {
                scf.yield %7851 : i64
              }
              %7857 = arith.cmpi ne, %7856, %7851 : i64
              scf.if %7857 {
                func.call @stack_push_pointer(%7856) : (i64) -> ()
              } else {
                %7858 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%7858) : (i64) -> ()
                func.call @stack_push_pointer(%7850) : (i64) -> ()
                %7859 = func.call @stack_pop_pointer() : () -> i64
                %7860 = func.call @stack_pop_pointer() : () -> i64
                %7861 = func.call @cc_cons(%7859, %7860) : (i64, i64) -> i64
                func.call @stack_push_pointer(%7861) : (i64) -> ()
              }
              %7862 = func.call @stack_pop_pointer() : () -> i64
              %7863 = func.call @stack_pop_pointer() : () -> i64
              %7864 = func.call @cc_append(%7863, %7862) : (i64, i64) -> i64
              func.call @stack_push_pointer(%7864) : (i64) -> ()
              %7865 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%7865) : (i64) -> ()
              %7866 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %7866, %7865 : i64, i64
            }
            func.call @stack_push_pointer(%7847#0) : (i64) -> ()
            %7867 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %7867, %7847#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %7868 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %7868, %7711 : i64, i64
          }
          func.call @stack_push_pointer(%7842#0) : (i64) -> ()
          %7869 = func.call @stack_depth() : () -> i64
          %7870 = arith.constant 0 : i64
          %7871 = arith.cmpi sgt, %7869, %7870 : i64
          scf.if %7871 {
            %7872 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%7712) : (i64) -> ()
          %7873 = func.call @stack_pop_pointer() : () -> i64
          %7874 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%7874) : (i64) -> ()
          %7875 = func.call @stack_pop_pointer() : () -> i64
          %7877 = arith.constant 3 : i64
          %7876 = arith.andi %7873, %7877 : i64
          %7878 = arith.constant 0 : i64
          %7879 = arith.cmpi eq, %7876, %7878 : i64
          %7881 = arith.constant 3 : i64
          %7880 = arith.andi %7875, %7881 : i64
          %7882 = arith.constant 0 : i64
          %7883 = arith.cmpi eq, %7880, %7882 : i64
          %7884 = arith.andi %7879, %7883 : i1
          %7885 = scf.if %7884 -> (i64) {
            %7886 = arith.constant 2 : i64
            %7887 = arith.shrsi %7873, %7886 : i64
            %7888 = arith.constant 2 : i64
            %7889 = arith.shrsi %7875, %7888 : i64
            %7890 = arith.addi %7887, %7889 : i64
            %7891 = arith.constant -2305843009213693952 : i64
            %7892 = arith.constant 2305843009213693951 : i64
            %7893 = arith.cmpi sge, %7890, %7891 : i64
            %7894 = arith.cmpi sle, %7890, %7892 : i64
            %7895 = arith.andi %7893, %7894 : i1
            %7896 = scf.if %7895 -> (i64) {
              %7897 = arith.constant 2 : i64
              %7898 = arith.shli %7890, %7897 : i64
              scf.yield %7898 : i64
            } else {
              %7899 = func.call @cc_add(%7873, %7875) : (i64, i64) -> i64
              scf.yield %7899 : i64
            }
            scf.yield %7896 : i64
          } else {
            %7900 = func.call @cc_add(%7873, %7875) : (i64, i64) -> i64
            scf.yield %7900 : i64
          }
          func.call @stack_push_pointer(%7885) : (i64) -> ()
          %7901 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%7901) : (i64) -> ()
          %7902 = func.call @stack_depth() : () -> i64
          %7903 = arith.constant 0 : i64
          %7904 = arith.cmpi sgt, %7902, %7903 : i64
          scf.if %7904 {
            %7905 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %7714, %7719, %7727, %7842#1, %7901 : i64, i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %7906 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%7634#0) : (i64) -> ()
        %7907 = func.call @stack_pop_pointer() : () -> i64
        %7908 = func.call @cc_nil_value() : () -> i64
        %7909 = arith.cmpi ne, %7907, %7908 : i64
        %7910:2 = scf.if %7909 -> (i64, i64) {
          %7911 = func.call @cc_nil_value() : () -> i64
          %7912 = func.call @cc_nil_value() : () -> i64
          %7913 = func.call @cc_errorp(%7911) : (i64) -> i64
          %7914 = arith.cmpi ne, %7913, %7912 : i64
          %7915:2 = scf.if %7914 -> (i64, i64) {
            scf.yield %7911, %7634#4 : i64, i64
          } else {
            func.call @stack_push_pointer(%7634#1) : (i64) -> ()
            %7916 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%7916) : (i64) -> ()
            %7917 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %7917, %7916 : i64, i64
          }
          func.call @stack_push_pointer(%7915#0) : (i64) -> ()
          %7918 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %7918, %7915#1 : i64, i64
        } else {
          func.call @stack_push_nil() : () -> ()
          %7919 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %7919, %7634#4 : i64, i64
        }
        func.call @stack_push_pointer(%7910#0) : (i64) -> ()
        %7920 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%7634#3) : (i64) -> ()
        %7921 = func.call @stack_pop_pointer() : () -> i64
        %7922 = func.call @cc_multiple_value_list(%7921) : (i64) -> i64
        %7923 = llvm.mlir.addressof @str599 : !llvm.ptr
        %7924 = arith.constant 38 : i64
        %7925 = func.call @cc_make_string(%7923, %7924) : (!llvm.ptr, i64) -> i64
        %7926 = func.call @cc_nil_value() : () -> i64
        %7927 = func.call @cc_intern(%7925, %7926) : (i64, i64) -> i64
        %7928 = func.call @cc_nil_value() : () -> i64
        %7929 = func.call @cc_cons(%7927, %7928) : (i64, i64) -> i64
        %7930 = func.call @cc_values_pack(%7929) : (i64) -> i64
        %7931 = func.call @cc_symbol_value(%7927) : (i64) -> i64
        %7932 = llvm.mlir.addressof @str600 : !llvm.ptr
        %7933 = arith.constant 39 : i64
        %7934 = func.call @cc_make_string(%7932, %7933) : (!llvm.ptr, i64) -> i64
        %7935 = func.call @cc_nil_value() : () -> i64
        %7936 = func.call @cc_intern(%7934, %7935) : (i64, i64) -> i64
        %7937 = func.call @cc_nil_value() : () -> i64
        %7938 = func.call @cc_cons(%7936, %7937) : (i64, i64) -> i64
        %7939 = func.call @cc_values_pack(%7938) : (i64) -> i64
        %7940 = func.call @cc_symbol_value(%7936) : (i64) -> i64
        %7941 = llvm.mlir.addressof @str601 : !llvm.ptr
        %7942 = arith.constant 40 : i64
        %7943 = func.call @cc_make_string(%7941, %7942) : (!llvm.ptr, i64) -> i64
        %7944 = func.call @cc_nil_value() : () -> i64
        %7945 = func.call @cc_intern(%7943, %7944) : (i64, i64) -> i64
        %7946 = func.call @cc_nil_value() : () -> i64
        %7947 = func.call @cc_cons(%7945, %7946) : (i64, i64) -> i64
        %7948 = func.call @cc_values_pack(%7947) : (i64) -> i64
        %7949 = func.call @cc_symbol_value(%7945) : (i64) -> i64
        %7950 = func.call @cc_nil_value() : () -> i64
        %7951 = arith.cmpi ne, %7931, %7950 : i64
        %7952 = scf.if %7951 -> (i64) {
          scf.yield %7949 : i64
        } else {
          scf.yield %7922 : i64
        }
        %7953 = func.call @cc_values_pack(%7952) : (i64) -> i64
        func.call @stack_push_pointer(%7953) : (i64) -> ()
        %7954 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7954, %7634#0, %7634#1, %7634#3, %7910#1, %7634#2 : i64, i64, i64, i64, i64, i64
      }
      func.call @stack_push_pointer(%7605#0) : (i64) -> ()
      %7955 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7955 : i64
    }
    func.call @stack_push_pointer(%7594) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192224"() {
    %8655 = func.call @cc_nil_value() : () -> i64
    %8656 = func.call @cc_nil_value() : () -> i64
    %8657 = func.call @cc_errorp(%8655) : (i64) -> i64
    %8658 = arith.cmpi ne, %8657, %8656 : i64
    %8659 = scf.if %8658 -> (i64) {
      scf.yield %8655 : i64
    } else {
      %8660 = llvm.mlir.addressof @str686 : !llvm.ptr
      %8661 = arith.constant 7 : i64
      %8662 = func.call @cc_make_string(%8660, %8661) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8662) : (i64) -> ()
      %8663 = llvm.mlir.addressof @str687 : !llvm.ptr
      %8664 = arith.constant 5 : i64
      %8665 = func.call @cc_make_string(%8663, %8664) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8665) : (i64) -> ()
      %8666 = llvm.mlir.addressof @str688 : !llvm.ptr
      %8667 = arith.constant 6 : i64
      %8668 = func.call @cc_make_string(%8666, %8667) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8668) : (i64) -> ()
      %8669 = llvm.mlir.addressof @str689 : !llvm.ptr
      %8670 = arith.constant 4 : i64
      %8671 = func.call @cc_make_string(%8669, %8670) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8671) : (i64) -> ()
      %8672 = llvm.mlir.addressof @str690 : !llvm.ptr
      %8673 = arith.constant 3 : i64
      %8674 = func.call @cc_make_string(%8672, %8673) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8674) : (i64) -> ()
      %8675 = llvm.mlir.addressof @str691 : !llvm.ptr
      %8676 = arith.constant 9 : i64
      %8677 = func.call @cc_make_string(%8675, %8676) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8677) : (i64) -> ()
      %8678 = llvm.mlir.addressof @str692 : !llvm.ptr
      %8679 = arith.constant 6 : i64
      %8680 = func.call @cc_make_string(%8678, %8679) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8680) : (i64) -> ()
      %8681 = llvm.mlir.addressof @str693 : !llvm.ptr
      %8682 = arith.constant 8 : i64
      %8683 = func.call @cc_make_string(%8681, %8682) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8683) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8684 = func.call @stack_pop_pointer() : () -> i64
      %8685 = func.call @stack_pop_pointer() : () -> i64
      %8686 = func.call @cc_cons(%8685, %8684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8686) : (i64) -> ()
      %8687 = func.call @stack_pop_pointer() : () -> i64
      %8688 = func.call @stack_pop_pointer() : () -> i64
      %8689 = func.call @cc_cons(%8688, %8687) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8689) : (i64) -> ()
      %8690 = func.call @stack_pop_pointer() : () -> i64
      %8691 = func.call @stack_pop_pointer() : () -> i64
      %8692 = func.call @cc_cons(%8691, %8690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8692) : (i64) -> ()
      %8693 = func.call @stack_pop_pointer() : () -> i64
      %8694 = func.call @stack_pop_pointer() : () -> i64
      %8695 = func.call @cc_cons(%8694, %8693) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8695) : (i64) -> ()
      %8696 = func.call @stack_pop_pointer() : () -> i64
      %8697 = func.call @stack_pop_pointer() : () -> i64
      %8698 = func.call @cc_cons(%8697, %8696) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8698) : (i64) -> ()
      %8699 = func.call @stack_pop_pointer() : () -> i64
      %8700 = func.call @stack_pop_pointer() : () -> i64
      %8701 = func.call @cc_cons(%8700, %8699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8701) : (i64) -> ()
      %8702 = func.call @stack_pop_pointer() : () -> i64
      %8703 = func.call @stack_pop_pointer() : () -> i64
      %8704 = func.call @cc_cons(%8703, %8702) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8704) : (i64) -> ()
      %8705 = func.call @stack_pop_pointer() : () -> i64
      %8706 = func.call @stack_pop_pointer() : () -> i64
      %8707 = func.call @cc_cons(%8706, %8705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8707) : (i64) -> ()
      %8708 = llvm.mlir.addressof @str694 : !llvm.ptr
      %8709 = arith.constant 4 : i64
      %8710 = func.call @cc_make_string(%8708, %8709) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8710) : (i64) -> ()
      %8711 = llvm.mlir.addressof @str695 : !llvm.ptr
      %8712 = arith.constant 3 : i64
      %8713 = func.call @cc_make_string(%8711, %8712) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8713) : (i64) -> ()
      %8714 = llvm.mlir.addressof @str696 : !llvm.ptr
      %8715 = arith.constant 4 : i64
      %8716 = func.call @cc_make_string(%8714, %8715) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8716) : (i64) -> ()
      %8717 = llvm.mlir.addressof @str697 : !llvm.ptr
      %8718 = arith.constant 16 : i64
      %8719 = func.call @cc_make_string(%8717, %8718) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8719) : (i64) -> ()
      %8720 = llvm.mlir.addressof @str698 : !llvm.ptr
      %8721 = arith.constant 14 : i64
      %8722 = func.call @cc_make_string(%8720, %8721) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8722) : (i64) -> ()
      %8723 = llvm.mlir.addressof @str699 : !llvm.ptr
      %8724 = arith.constant 9 : i64
      %8725 = func.call @cc_make_string(%8723, %8724) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8725) : (i64) -> ()
      %8726 = llvm.mlir.addressof @str700 : !llvm.ptr
      %8727 = arith.constant 5 : i64
      %8728 = func.call @cc_make_string(%8726, %8727) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8728) : (i64) -> ()
      %8729 = llvm.mlir.addressof @str701 : !llvm.ptr
      %8730 = arith.constant 10 : i64
      %8731 = func.call @cc_make_string(%8729, %8730) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8731) : (i64) -> ()
      %8732 = llvm.mlir.addressof @str702 : !llvm.ptr
      %8733 = arith.constant 5 : i64
      %8734 = func.call @cc_make_string(%8732, %8733) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8734) : (i64) -> ()
      %8735 = llvm.mlir.addressof @str703 : !llvm.ptr
      %8736 = arith.constant 13 : i64
      %8737 = func.call @cc_make_string(%8735, %8736) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8737) : (i64) -> ()
      %8738 = llvm.mlir.addressof @str704 : !llvm.ptr
      %8739 = arith.constant 22 : i64
      %8740 = func.call @cc_make_string(%8738, %8739) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8740) : (i64) -> ()
      %8741 = llvm.mlir.addressof @str705 : !llvm.ptr
      %8742 = arith.constant 20 : i64
      %8743 = func.call @cc_make_string(%8741, %8742) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8743) : (i64) -> ()
      %8744 = llvm.mlir.addressof @str706 : !llvm.ptr
      %8745 = arith.constant 18 : i64
      %8746 = func.call @cc_make_string(%8744, %8745) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8746) : (i64) -> ()
      %8747 = llvm.mlir.addressof @str707 : !llvm.ptr
      %8748 = arith.constant 5 : i64
      %8749 = func.call @cc_make_string(%8747, %8748) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8749) : (i64) -> ()
      %8750 = llvm.mlir.addressof @str708 : !llvm.ptr
      %8751 = arith.constant 3 : i64
      %8752 = func.call @cc_make_string(%8750, %8751) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8752) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8753 = func.call @stack_pop_pointer() : () -> i64
      %8754 = func.call @stack_pop_pointer() : () -> i64
      %8755 = func.call @cc_cons(%8754, %8753) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8755) : (i64) -> ()
      %8756 = func.call @stack_pop_pointer() : () -> i64
      %8757 = func.call @stack_pop_pointer() : () -> i64
      %8758 = func.call @cc_cons(%8757, %8756) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8758) : (i64) -> ()
      %8759 = func.call @stack_pop_pointer() : () -> i64
      %8760 = func.call @stack_pop_pointer() : () -> i64
      %8761 = func.call @cc_cons(%8760, %8759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8761) : (i64) -> ()
      %8762 = func.call @stack_pop_pointer() : () -> i64
      %8763 = func.call @stack_pop_pointer() : () -> i64
      %8764 = func.call @cc_cons(%8763, %8762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8764) : (i64) -> ()
      %8765 = func.call @stack_pop_pointer() : () -> i64
      %8766 = func.call @stack_pop_pointer() : () -> i64
      %8767 = func.call @cc_cons(%8766, %8765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8767) : (i64) -> ()
      %8768 = func.call @stack_pop_pointer() : () -> i64
      %8769 = func.call @stack_pop_pointer() : () -> i64
      %8770 = func.call @cc_cons(%8769, %8768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8770) : (i64) -> ()
      %8771 = func.call @stack_pop_pointer() : () -> i64
      %8772 = func.call @stack_pop_pointer() : () -> i64
      %8773 = func.call @cc_cons(%8772, %8771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8773) : (i64) -> ()
      %8774 = func.call @stack_pop_pointer() : () -> i64
      %8775 = func.call @stack_pop_pointer() : () -> i64
      %8776 = func.call @cc_cons(%8775, %8774) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8776) : (i64) -> ()
      %8777 = func.call @stack_pop_pointer() : () -> i64
      %8778 = func.call @stack_pop_pointer() : () -> i64
      %8779 = func.call @cc_cons(%8778, %8777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8779) : (i64) -> ()
      %8780 = func.call @stack_pop_pointer() : () -> i64
      %8781 = func.call @stack_pop_pointer() : () -> i64
      %8782 = func.call @cc_cons(%8781, %8780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8782) : (i64) -> ()
      %8783 = func.call @stack_pop_pointer() : () -> i64
      %8784 = func.call @stack_pop_pointer() : () -> i64
      %8785 = func.call @cc_cons(%8784, %8783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8785) : (i64) -> ()
      %8786 = func.call @stack_pop_pointer() : () -> i64
      %8787 = func.call @stack_pop_pointer() : () -> i64
      %8788 = func.call @cc_cons(%8787, %8786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8788) : (i64) -> ()
      %8789 = func.call @stack_pop_pointer() : () -> i64
      %8790 = func.call @stack_pop_pointer() : () -> i64
      %8791 = func.call @cc_cons(%8790, %8789) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8791) : (i64) -> ()
      %8792 = func.call @stack_pop_pointer() : () -> i64
      %8793 = func.call @stack_pop_pointer() : () -> i64
      %8794 = func.call @cc_cons(%8793, %8792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8794) : (i64) -> ()
      %8795 = func.call @stack_pop_pointer() : () -> i64
      %8796 = func.call @stack_pop_pointer() : () -> i64
      %8797 = func.call @cc_cons(%8796, %8795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8797) : (i64) -> ()
      %8798 = func.call @stack_pop_pointer() : () -> i64
      %8799 = func.call @stack_pop_pointer() : () -> i64
      %8800 = func.call @cc_append(%8799, %8798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8800) : (i64) -> ()
      %8801 = llvm.mlir.addressof @str709 : !llvm.ptr
      %8802 = arith.constant 3 : i64
      %8803 = func.call @cc_make_string(%8801, %8802) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8803) : (i64) -> ()
      %8804 = llvm.mlir.addressof @str710 : !llvm.ptr
      %8805 = arith.constant 3 : i64
      %8806 = func.call @cc_make_string(%8804, %8805) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8806) : (i64) -> ()
      %8807 = llvm.mlir.addressof @str711 : !llvm.ptr
      %8808 = arith.constant 3 : i64
      %8809 = func.call @cc_make_string(%8807, %8808) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8809) : (i64) -> ()
      %8810 = llvm.mlir.addressof @str712 : !llvm.ptr
      %8811 = arith.constant 3 : i64
      %8812 = func.call @cc_make_string(%8810, %8811) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8812) : (i64) -> ()
      %8813 = llvm.mlir.addressof @str713 : !llvm.ptr
      %8814 = arith.constant 3 : i64
      %8815 = func.call @cc_make_string(%8813, %8814) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8815) : (i64) -> ()
      %8816 = llvm.mlir.addressof @str714 : !llvm.ptr
      %8817 = arith.constant 3 : i64
      %8818 = func.call @cc_make_string(%8816, %8817) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8818) : (i64) -> ()
      %8819 = llvm.mlir.addressof @str715 : !llvm.ptr
      %8820 = arith.constant 3 : i64
      %8821 = func.call @cc_make_string(%8819, %8820) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8821) : (i64) -> ()
      %8822 = llvm.mlir.addressof @str716 : !llvm.ptr
      %8823 = arith.constant 3 : i64
      %8824 = func.call @cc_make_string(%8822, %8823) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8824) : (i64) -> ()
      %8825 = llvm.mlir.addressof @str717 : !llvm.ptr
      %8826 = arith.constant 3 : i64
      %8827 = func.call @cc_make_string(%8825, %8826) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8827) : (i64) -> ()
      %8828 = llvm.mlir.addressof @str718 : !llvm.ptr
      %8829 = arith.constant 3 : i64
      %8830 = func.call @cc_make_string(%8828, %8829) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8830) : (i64) -> ()
      %8831 = llvm.mlir.addressof @str719 : !llvm.ptr
      %8832 = arith.constant 3 : i64
      %8833 = func.call @cc_make_string(%8831, %8832) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8833) : (i64) -> ()
      %8834 = llvm.mlir.addressof @str720 : !llvm.ptr
      %8835 = arith.constant 3 : i64
      %8836 = func.call @cc_make_string(%8834, %8835) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8836) : (i64) -> ()
      %8837 = llvm.mlir.addressof @str721 : !llvm.ptr
      %8838 = arith.constant 3 : i64
      %8839 = func.call @cc_make_string(%8837, %8838) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8839) : (i64) -> ()
      %8840 = llvm.mlir.addressof @str722 : !llvm.ptr
      %8841 = arith.constant 3 : i64
      %8842 = func.call @cc_make_string(%8840, %8841) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8842) : (i64) -> ()
      %8843 = llvm.mlir.addressof @str723 : !llvm.ptr
      %8844 = arith.constant 3 : i64
      %8845 = func.call @cc_make_string(%8843, %8844) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8845) : (i64) -> ()
      %8846 = llvm.mlir.addressof @str724 : !llvm.ptr
      %8847 = arith.constant 3 : i64
      %8848 = func.call @cc_make_string(%8846, %8847) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8848) : (i64) -> ()
      %8849 = llvm.mlir.addressof @str725 : !llvm.ptr
      %8850 = arith.constant 3 : i64
      %8851 = func.call @cc_make_string(%8849, %8850) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8851) : (i64) -> ()
      %8852 = llvm.mlir.addressof @str726 : !llvm.ptr
      %8853 = arith.constant 3 : i64
      %8854 = func.call @cc_make_string(%8852, %8853) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8854) : (i64) -> ()
      %8855 = llvm.mlir.addressof @str727 : !llvm.ptr
      %8856 = arith.constant 3 : i64
      %8857 = func.call @cc_make_string(%8855, %8856) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8857) : (i64) -> ()
      %8858 = llvm.mlir.addressof @str728 : !llvm.ptr
      %8859 = arith.constant 3 : i64
      %8860 = func.call @cc_make_string(%8858, %8859) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8860) : (i64) -> ()
      %8861 = llvm.mlir.addressof @str729 : !llvm.ptr
      %8862 = arith.constant 3 : i64
      %8863 = func.call @cc_make_string(%8861, %8862) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8863) : (i64) -> ()
      %8864 = llvm.mlir.addressof @str730 : !llvm.ptr
      %8865 = arith.constant 3 : i64
      %8866 = func.call @cc_make_string(%8864, %8865) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8866) : (i64) -> ()
      %8867 = llvm.mlir.addressof @str731 : !llvm.ptr
      %8868 = arith.constant 3 : i64
      %8869 = func.call @cc_make_string(%8867, %8868) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8869) : (i64) -> ()
      %8870 = llvm.mlir.addressof @str732 : !llvm.ptr
      %8871 = arith.constant 3 : i64
      %8872 = func.call @cc_make_string(%8870, %8871) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8872) : (i64) -> ()
      %8873 = llvm.mlir.addressof @str733 : !llvm.ptr
      %8874 = arith.constant 3 : i64
      %8875 = func.call @cc_make_string(%8873, %8874) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8875) : (i64) -> ()
      %8876 = llvm.mlir.addressof @str734 : !llvm.ptr
      %8877 = arith.constant 3 : i64
      %8878 = func.call @cc_make_string(%8876, %8877) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8878) : (i64) -> ()
      %8879 = llvm.mlir.addressof @str735 : !llvm.ptr
      %8880 = arith.constant 3 : i64
      %8881 = func.call @cc_make_string(%8879, %8880) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8881) : (i64) -> ()
      %8882 = llvm.mlir.addressof @str736 : !llvm.ptr
      %8883 = arith.constant 3 : i64
      %8884 = func.call @cc_make_string(%8882, %8883) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8884) : (i64) -> ()
      %8885 = llvm.mlir.addressof @str737 : !llvm.ptr
      %8886 = arith.constant 3 : i64
      %8887 = func.call @cc_make_string(%8885, %8886) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8887) : (i64) -> ()
      %8888 = llvm.mlir.addressof @str738 : !llvm.ptr
      %8889 = arith.constant 3 : i64
      %8890 = func.call @cc_make_string(%8888, %8889) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8890) : (i64) -> ()
      %8891 = llvm.mlir.addressof @str739 : !llvm.ptr
      %8892 = arith.constant 3 : i64
      %8893 = func.call @cc_make_string(%8891, %8892) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8893) : (i64) -> ()
      %8894 = llvm.mlir.addressof @str740 : !llvm.ptr
      %8895 = arith.constant 3 : i64
      %8896 = func.call @cc_make_string(%8894, %8895) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8896) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8897 = func.call @stack_pop_pointer() : () -> i64
      %8898 = func.call @stack_pop_pointer() : () -> i64
      %8899 = func.call @cc_cons(%8898, %8897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8899) : (i64) -> ()
      %8900 = func.call @stack_pop_pointer() : () -> i64
      %8901 = func.call @stack_pop_pointer() : () -> i64
      %8902 = func.call @cc_cons(%8901, %8900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8902) : (i64) -> ()
      %8903 = func.call @stack_pop_pointer() : () -> i64
      %8904 = func.call @stack_pop_pointer() : () -> i64
      %8905 = func.call @cc_cons(%8904, %8903) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8905) : (i64) -> ()
      %8906 = func.call @stack_pop_pointer() : () -> i64
      %8907 = func.call @stack_pop_pointer() : () -> i64
      %8908 = func.call @cc_cons(%8907, %8906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8908) : (i64) -> ()
      %8909 = func.call @stack_pop_pointer() : () -> i64
      %8910 = func.call @stack_pop_pointer() : () -> i64
      %8911 = func.call @cc_cons(%8910, %8909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8911) : (i64) -> ()
      %8912 = func.call @stack_pop_pointer() : () -> i64
      %8913 = func.call @stack_pop_pointer() : () -> i64
      %8914 = func.call @cc_cons(%8913, %8912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8914) : (i64) -> ()
      %8915 = func.call @stack_pop_pointer() : () -> i64
      %8916 = func.call @stack_pop_pointer() : () -> i64
      %8917 = func.call @cc_cons(%8916, %8915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8917) : (i64) -> ()
      %8918 = func.call @stack_pop_pointer() : () -> i64
      %8919 = func.call @stack_pop_pointer() : () -> i64
      %8920 = func.call @cc_cons(%8919, %8918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8920) : (i64) -> ()
      %8921 = func.call @stack_pop_pointer() : () -> i64
      %8922 = func.call @stack_pop_pointer() : () -> i64
      %8923 = func.call @cc_cons(%8922, %8921) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8923) : (i64) -> ()
      %8924 = func.call @stack_pop_pointer() : () -> i64
      %8925 = func.call @stack_pop_pointer() : () -> i64
      %8926 = func.call @cc_cons(%8925, %8924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8926) : (i64) -> ()
      %8927 = func.call @stack_pop_pointer() : () -> i64
      %8928 = func.call @stack_pop_pointer() : () -> i64
      %8929 = func.call @cc_cons(%8928, %8927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8929) : (i64) -> ()
      %8930 = func.call @stack_pop_pointer() : () -> i64
      %8931 = func.call @stack_pop_pointer() : () -> i64
      %8932 = func.call @cc_cons(%8931, %8930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8932) : (i64) -> ()
      %8933 = func.call @stack_pop_pointer() : () -> i64
      %8934 = func.call @stack_pop_pointer() : () -> i64
      %8935 = func.call @cc_cons(%8934, %8933) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8935) : (i64) -> ()
      %8936 = func.call @stack_pop_pointer() : () -> i64
      %8937 = func.call @stack_pop_pointer() : () -> i64
      %8938 = func.call @cc_cons(%8937, %8936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8938) : (i64) -> ()
      %8939 = func.call @stack_pop_pointer() : () -> i64
      %8940 = func.call @stack_pop_pointer() : () -> i64
      %8941 = func.call @cc_cons(%8940, %8939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8941) : (i64) -> ()
      %8942 = func.call @stack_pop_pointer() : () -> i64
      %8943 = func.call @stack_pop_pointer() : () -> i64
      %8944 = func.call @cc_cons(%8943, %8942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8944) : (i64) -> ()
      %8945 = func.call @stack_pop_pointer() : () -> i64
      %8946 = func.call @stack_pop_pointer() : () -> i64
      %8947 = func.call @cc_cons(%8946, %8945) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8947) : (i64) -> ()
      %8948 = func.call @stack_pop_pointer() : () -> i64
      %8949 = func.call @stack_pop_pointer() : () -> i64
      %8950 = func.call @cc_cons(%8949, %8948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8950) : (i64) -> ()
      %8951 = func.call @stack_pop_pointer() : () -> i64
      %8952 = func.call @stack_pop_pointer() : () -> i64
      %8953 = func.call @cc_cons(%8952, %8951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8953) : (i64) -> ()
      %8954 = func.call @stack_pop_pointer() : () -> i64
      %8955 = func.call @stack_pop_pointer() : () -> i64
      %8956 = func.call @cc_cons(%8955, %8954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8956) : (i64) -> ()
      %8957 = func.call @stack_pop_pointer() : () -> i64
      %8958 = func.call @stack_pop_pointer() : () -> i64
      %8959 = func.call @cc_cons(%8958, %8957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8959) : (i64) -> ()
      %8960 = func.call @stack_pop_pointer() : () -> i64
      %8961 = func.call @stack_pop_pointer() : () -> i64
      %8962 = func.call @cc_cons(%8961, %8960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8962) : (i64) -> ()
      %8963 = func.call @stack_pop_pointer() : () -> i64
      %8964 = func.call @stack_pop_pointer() : () -> i64
      %8965 = func.call @cc_cons(%8964, %8963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8965) : (i64) -> ()
      %8966 = func.call @stack_pop_pointer() : () -> i64
      %8967 = func.call @stack_pop_pointer() : () -> i64
      %8968 = func.call @cc_cons(%8967, %8966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8968) : (i64) -> ()
      %8969 = func.call @stack_pop_pointer() : () -> i64
      %8970 = func.call @stack_pop_pointer() : () -> i64
      %8971 = func.call @cc_cons(%8970, %8969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8971) : (i64) -> ()
      %8972 = func.call @stack_pop_pointer() : () -> i64
      %8973 = func.call @stack_pop_pointer() : () -> i64
      %8974 = func.call @cc_cons(%8973, %8972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8974) : (i64) -> ()
      %8975 = func.call @stack_pop_pointer() : () -> i64
      %8976 = func.call @stack_pop_pointer() : () -> i64
      %8977 = func.call @cc_cons(%8976, %8975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8977) : (i64) -> ()
      %8978 = func.call @stack_pop_pointer() : () -> i64
      %8979 = func.call @stack_pop_pointer() : () -> i64
      %8980 = func.call @cc_cons(%8979, %8978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8980) : (i64) -> ()
      %8981 = func.call @stack_pop_pointer() : () -> i64
      %8982 = func.call @stack_pop_pointer() : () -> i64
      %8983 = func.call @cc_cons(%8982, %8981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8983) : (i64) -> ()
      %8984 = func.call @stack_pop_pointer() : () -> i64
      %8985 = func.call @stack_pop_pointer() : () -> i64
      %8986 = func.call @cc_cons(%8985, %8984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8986) : (i64) -> ()
      %8987 = func.call @stack_pop_pointer() : () -> i64
      %8988 = func.call @stack_pop_pointer() : () -> i64
      %8989 = func.call @cc_cons(%8988, %8987) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8989) : (i64) -> ()
      %8990 = func.call @stack_pop_pointer() : () -> i64
      %8991 = func.call @stack_pop_pointer() : () -> i64
      %8992 = func.call @cc_cons(%8991, %8990) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8992) : (i64) -> ()
      %8993 = func.call @stack_pop_pointer() : () -> i64
      %8994 = func.call @stack_pop_pointer() : () -> i64
      %8995 = func.call @cc_append(%8994, %8993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8995) : (i64) -> ()
      %8996 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %8997 = func.call @stack_pop_pointer() : () -> i64
      %8998 = func.call @cc_nil_value() : () -> i64
      %8999 = func.call @cc_nil_value() : () -> i64
      %9000 = func.call @cc_errorp(%8998) : (i64) -> i64
      %9001 = arith.cmpi ne, %9000, %8999 : i64
      %9002:2 = scf.if %9001 -> (i64, i64) {
        scf.yield %8998, %8997 : i64, i64
      } else {
        func.call @stack_push_pointer(%8996) : (i64) -> ()
        %9003 = func.call @stack_pop_pointer() : () -> i64
        %9004:2 = scf.while (%arg0 = %9003, %arg1 = %8997) : (i64, i64) -> (i64, i64) {
          %9005 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %9006 = arith.constant 0 : i32
          %9007 = arith.cmpi ne, %9005, %9006 : i32
          scf.condition(%9007) %arg0, %arg1 : i64, i64
        } do {
          ^bb0(%9008: i64, %9009: i64):
          %9010 = func.call @cc_car(%9008) : (i64) -> i64
          func.call @stack_push_pointer(%9010) : (i64) -> ()
          %9011 = func.call @stack_pop_pointer() : () -> i64
          %9012 = func.call @cc_name_char(%9011) : (i64) -> i64
          func.call @stack_push_pointer(%9012) : (i64) -> ()
          %9013 = func.call @stack_pop_pointer() : () -> i64
          %9014 = func.call @cc_nil_value() : () -> i64
          %9015 = func.call @cc_cons(%9013, %9014) : (i64, i64) -> i64
          %9016 = func.call @cc_not(%9015) : (i64) -> i64
          func.call @stack_push_pointer(%9016) : (i64) -> ()
          %9017 = func.call @stack_pop_pointer() : () -> i64
          %9018 = func.call @cc_nil_value() : () -> i64
          %9019 = arith.cmpi ne, %9017, %9018 : i64
          %9020:2 = scf.if %9019 -> (i64, i64) {
            %9021 = func.call @cc_nil_value() : () -> i64
            %9022 = func.call @cc_nil_value() : () -> i64
            %9023 = func.call @cc_errorp(%9021) : (i64) -> i64
            %9024 = arith.cmpi ne, %9023, %9022 : i64
            %9025:2 = scf.if %9024 -> (i64, i64) {
              scf.yield %9021, %9009 : i64, i64
            } else {
              func.call @stack_push_pointer(%9010) : (i64) -> ()
              %9026 = func.call @stack_pop_pointer() : () -> i64
              %9027 = func.call @cc_cons(%9026, %9009) : (i64, i64) -> i64
              func.call @stack_push_pointer(%9027) : (i64) -> ()
              %9028 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %9028, %9027 : i64, i64
            }
            func.call @stack_push_pointer(%9025#0) : (i64) -> ()
            %9029 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %9029, %9025#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %9030 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %9030, %9009 : i64, i64
          }
          func.call @stack_push_pointer(%9020#0) : (i64) -> ()
          %9031 = func.call @stack_depth() : () -> i64
          %9032 = arith.constant 0 : i64
          %9033 = arith.cmpi sgt, %9031, %9032 : i64
          scf.if %9033 {
            %9034 = func.call @stack_pop_pointer() : () -> i64
          }
          %9035 = func.call @cc_cdr(%9008) : (i64) -> i64
          scf.yield %9035, %9020#1 : i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %9036 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9036, %9004#1 : i64, i64
      }
      %9037 = func.call @cc_nil_value() : () -> i64
      %9038 = func.call @cc_errorp(%9002#0) : (i64) -> i64
      %9039 = arith.cmpi ne, %9038, %9037 : i64
      %9040:2 = scf.if %9039 -> (i64, i64) {
        scf.yield %9002#0, %9002#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%9002#1) : (i64) -> ()
        %9041 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9041, %9002#1 : i64, i64
      }
      func.call @stack_push_pointer(%9040#0) : (i64) -> ()
      %9042 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9042 : i64
    }
    func.call @stack_push_pointer(%8659) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192225"() {
    %9204 = func.call @cc_nil_value() : () -> i64
    %9205 = func.call @cc_nil_value() : () -> i64
    %9206 = func.call @cc_errorp(%9204) : (i64) -> i64
    %9207 = arith.cmpi ne, %9206, %9205 : i64
    %9208 = scf.if %9207 -> (i64) {
      scf.yield %9204 : i64
    } else {
      %9209 = arith.constant 97 : i64
      %9210 = func.call @cc_box_character(%9209) : (i64) -> i64
      func.call @stack_push_pointer(%9210) : (i64) -> ()
      %9211 = func.call @stack_pop_pointer() : () -> i64
      %9212 = arith.constant 98 : i64
      %9213 = func.call @cc_box_character(%9212) : (i64) -> i64
      func.call @stack_push_pointer(%9213) : (i64) -> ()
      %9214 = func.call @stack_pop_pointer() : () -> i64
      %9215 = arith.constant 99 : i64
      %9216 = func.call @cc_box_character(%9215) : (i64) -> i64
      func.call @stack_push_pointer(%9216) : (i64) -> ()
      %9217 = func.call @stack_pop_pointer() : () -> i64
      %9218 = arith.constant 100 : i64
      %9219 = func.call @cc_box_character(%9218) : (i64) -> i64
      func.call @stack_push_pointer(%9219) : (i64) -> ()
      %9220 = func.call @stack_pop_pointer() : () -> i64
      %9221 = func.call @cc_nil_value() : () -> i64
      %9222 = func.call @cc_errorp(%9211) : (i64) -> i64
      %9223 = arith.cmpi ne, %9222, %9221 : i64
      %9224 = arith.cmpi eq, %9221, %9221 : i64
      %9225 = arith.andi %9223, %9224 : i1
      %9226 = scf.if %9225 -> (i64) {
        scf.yield %9211 : i64
      } else {
        scf.yield %9221 : i64
      }
      %9227 = func.call @cc_errorp(%9214) : (i64) -> i64
      %9228 = arith.cmpi ne, %9227, %9221 : i64
      %9229 = arith.cmpi eq, %9226, %9221 : i64
      %9230 = arith.andi %9228, %9229 : i1
      %9231 = scf.if %9230 -> (i64) {
        scf.yield %9214 : i64
      } else {
        scf.yield %9226 : i64
      }
      %9232 = func.call @cc_errorp(%9217) : (i64) -> i64
      %9233 = arith.cmpi ne, %9232, %9221 : i64
      %9234 = arith.cmpi eq, %9231, %9221 : i64
      %9235 = arith.andi %9233, %9234 : i1
      %9236 = scf.if %9235 -> (i64) {
        scf.yield %9217 : i64
      } else {
        scf.yield %9231 : i64
      }
      %9237 = func.call @cc_errorp(%9220) : (i64) -> i64
      %9238 = arith.cmpi ne, %9237, %9221 : i64
      %9239 = arith.cmpi eq, %9236, %9221 : i64
      %9240 = arith.andi %9238, %9239 : i1
      %9241 = scf.if %9240 -> (i64) {
        scf.yield %9220 : i64
      } else {
        scf.yield %9236 : i64
      }
      %9242 = arith.cmpi ne, %9241, %9221 : i64
      scf.if %9242 {
        func.call @stack_push_pointer(%9241) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%9211) : (i64) -> ()
        func.call @stack_push_pointer(%9214) : (i64) -> ()
        func.call @stack_push_pointer(%9217) : (i64) -> ()
        func.call @stack_push_pointer(%9220) : (i64) -> ()
        %9243 = llvm.mlir.addressof @str752 : !llvm.ptr
        %9244 = func.call @cc_make_function_ref_const(%9243) : (!llvm.ptr) -> i64
        %9245 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%9244, %9245) : (i64, i64) -> ()
      }
      %9246 = func.call @stack_pop_pointer() : () -> i64
      %9247 = func.call @cc_nil_value() : () -> i64
      %9248 = func.call @cc_cons(%9246, %9247) : (i64, i64) -> i64
      %9249 = func.call @cc_not(%9248) : (i64) -> i64
      func.call @stack_push_pointer(%9249) : (i64) -> ()
      %9250 = func.call @stack_pop_pointer() : () -> i64
      %9251 = func.call @cc_nil_value() : () -> i64
      %9252 = func.call @cc_cons(%9250, %9251) : (i64, i64) -> i64
      %9253 = func.call @cc_not(%9252) : (i64) -> i64
      func.call @stack_push_pointer(%9253) : (i64) -> ()
      %9254 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9254 : i64
    }
    func.call @stack_push_pointer(%9208) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192226"() {
    %9441 = func.call @cc_nil_value() : () -> i64
    %9442 = func.call @cc_nil_value() : () -> i64
    %9443 = func.call @cc_errorp(%9441) : (i64) -> i64
    %9444 = arith.cmpi ne, %9443, %9442 : i64
    %9445 = scf.if %9444 -> (i64) {
      scf.yield %9441 : i64
    } else {
      %9446 = func.call @cc_nil_value() : () -> i64
      %9447 = func.call @cc_nil_value() : () -> i64
      %9448 = func.call @cc_errorp(%9446) : (i64) -> i64
      %9449 = arith.cmpi ne, %9448, %9447 : i64
      %9450 = scf.if %9449 -> (i64) {
        scf.yield %9446 : i64
      } else {
        %9451 = arith.constant 97 : i64
        %9452 = func.call @cc_box_character(%9451) : (i64) -> i64
        func.call @stack_push_pointer(%9452) : (i64) -> ()
        %9453 = func.call @stack_pop_pointer() : () -> i64
        %9454 = arith.constant 98 : i64
        %9455 = func.call @cc_box_character(%9454) : (i64) -> i64
        func.call @stack_push_pointer(%9455) : (i64) -> ()
        %9456 = func.call @stack_pop_pointer() : () -> i64
        %9457 = arith.constant 99 : i64
        %9458 = func.call @cc_box_character(%9457) : (i64) -> i64
        func.call @stack_push_pointer(%9458) : (i64) -> ()
        %9459 = func.call @stack_pop_pointer() : () -> i64
        %9460 = arith.constant 100 : i64
        %9461 = func.call @cc_box_character(%9460) : (i64) -> i64
        func.call @stack_push_pointer(%9461) : (i64) -> ()
        %9462 = func.call @stack_pop_pointer() : () -> i64
        %9463 = func.call @cc_nil_value() : () -> i64
        %9464 = func.call @cc_errorp(%9453) : (i64) -> i64
        %9465 = arith.cmpi ne, %9464, %9463 : i64
        %9466 = arith.cmpi eq, %9463, %9463 : i64
        %9467 = arith.andi %9465, %9466 : i1
        %9468 = scf.if %9467 -> (i64) {
          scf.yield %9453 : i64
        } else {
          scf.yield %9463 : i64
        }
        %9469 = func.call @cc_errorp(%9456) : (i64) -> i64
        %9470 = arith.cmpi ne, %9469, %9463 : i64
        %9471 = arith.cmpi eq, %9468, %9463 : i64
        %9472 = arith.andi %9470, %9471 : i1
        %9473 = scf.if %9472 -> (i64) {
          scf.yield %9456 : i64
        } else {
          scf.yield %9468 : i64
        }
        %9474 = func.call @cc_errorp(%9459) : (i64) -> i64
        %9475 = arith.cmpi ne, %9474, %9463 : i64
        %9476 = arith.cmpi eq, %9473, %9463 : i64
        %9477 = arith.andi %9475, %9476 : i1
        %9478 = scf.if %9477 -> (i64) {
          scf.yield %9459 : i64
        } else {
          scf.yield %9473 : i64
        }
        %9479 = func.call @cc_errorp(%9462) : (i64) -> i64
        %9480 = arith.cmpi ne, %9479, %9463 : i64
        %9481 = arith.cmpi eq, %9478, %9463 : i64
        %9482 = arith.andi %9480, %9481 : i1
        %9483 = scf.if %9482 -> (i64) {
          scf.yield %9462 : i64
        } else {
          scf.yield %9478 : i64
        }
        %9484 = arith.cmpi ne, %9483, %9463 : i64
        scf.if %9484 {
          func.call @stack_push_pointer(%9483) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%9453) : (i64) -> ()
          func.call @stack_push_pointer(%9456) : (i64) -> ()
          func.call @stack_push_pointer(%9459) : (i64) -> ()
          func.call @stack_push_pointer(%9462) : (i64) -> ()
          %9485 = llvm.mlir.addressof @str766 : !llvm.ptr
          %9486 = func.call @cc_make_function_ref_const(%9485) : (!llvm.ptr) -> i64
          %9487 = arith.constant 4 : i64
          func.call @cc_funcall_stack(%9486, %9487) : (i64, i64) -> ()
        }
        %9488 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %9488 : i64
      }
      func.call @stack_push_pointer(%9450) : (i64) -> ()
      %9489 = func.call @stack_pop_pointer() : () -> i64
      %9490 = func.call @cc_nil_value() : () -> i64
      %9491 = func.call @cc_cons(%9489, %9490) : (i64, i64) -> i64
      %9492 = func.call @cc_not(%9491) : (i64) -> i64
      func.call @stack_push_pointer(%9492) : (i64) -> ()
      %9493 = func.call @stack_pop_pointer() : () -> i64
      %9494 = func.call @cc_nil_value() : () -> i64
      %9495 = func.call @cc_cons(%9493, %9494) : (i64, i64) -> i64
      %9496 = func.call @cc_not(%9495) : (i64) -> i64
      func.call @stack_push_pointer(%9496) : (i64) -> ()
      %9497 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9497 : i64
    }
    func.call @stack_push_pointer(%9445) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192227"() {
    %9657 = func.call @cc_nil_value() : () -> i64
    %9658 = func.call @cc_nil_value() : () -> i64
    %9659 = func.call @cc_errorp(%9657) : (i64) -> i64
    %9660 = arith.cmpi ne, %9659, %9658 : i64
    %9661 = scf.if %9660 -> (i64) {
      scf.yield %9657 : i64
    } else {
      %9662 = arith.constant 127 : i64
      %9663 = func.call @cc_box_character(%9662) : (i64) -> i64
      func.call @stack_push_pointer(%9663) : (i64) -> ()
      %9664 = arith.constant 127 : i64
      %9665 = func.call @cc_box_character(%9664) : (i64) -> i64
      func.call @stack_push_pointer(%9665) : (i64) -> ()
      %9666 = func.call @stack_pop_pointer() : () -> i64
      %9667 = func.call @stack_pop_pointer() : () -> i64
      %9668 = func.call @cc_eq(%9667, %9666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%9668) : (i64) -> ()
      %9669 = func.call @stack_pop_pointer() : () -> i64
      %9670 = func.call @cc_nil_value() : () -> i64
      %9671 = func.call @cc_cons(%9669, %9670) : (i64, i64) -> i64
      %9672 = func.call @cc_not(%9671) : (i64) -> i64
      func.call @stack_push_pointer(%9672) : (i64) -> ()
      %9673 = func.call @stack_pop_pointer() : () -> i64
      %9674 = func.call @cc_nil_value() : () -> i64
      %9675 = func.call @cc_cons(%9673, %9674) : (i64, i64) -> i64
      %9676 = func.call @cc_not(%9675) : (i64) -> i64
      func.call @stack_push_pointer(%9676) : (i64) -> ()
      %9677 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %9677 : i64
    }
    func.call @stack_push_pointer(%9661) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192228"() {
    %9997 = func.call @cc_nil_value() : () -> i64
    %9998 = func.call @cc_nil_value() : () -> i64
    %9999 = func.call @cc_errorp(%9997) : (i64) -> i64
    %10000 = arith.cmpi ne, %9999, %9998 : i64
    %10001 = scf.if %10000 -> (i64) {
      scf.yield %9997 : i64
    } else {
      %10002 = arith.constant 0 : i64
      %10003 = func.call @cc_box_character(%10002) : (i64) -> i64
      func.call @stack_push_pointer(%10003) : (i64) -> ()
      %10004 = func.call @stack_pop_pointer() : () -> i64
      %10005 = arith.constant 1 : i64
      %10006 = func.call @cc_box_character(%10005) : (i64) -> i64
      func.call @stack_push_pointer(%10006) : (i64) -> ()
      %10007 = func.call @stack_pop_pointer() : () -> i64
      %10008 = arith.constant 2 : i64
      %10009 = func.call @cc_box_character(%10008) : (i64) -> i64
      func.call @stack_push_pointer(%10009) : (i64) -> ()
      %10010 = func.call @stack_pop_pointer() : () -> i64
      %10011 = arith.constant 3 : i64
      %10012 = func.call @cc_box_character(%10011) : (i64) -> i64
      func.call @stack_push_pointer(%10012) : (i64) -> ()
      %10013 = func.call @stack_pop_pointer() : () -> i64
      %10014 = arith.constant 4 : i64
      %10015 = func.call @cc_box_character(%10014) : (i64) -> i64
      func.call @stack_push_pointer(%10015) : (i64) -> ()
      %10016 = func.call @stack_pop_pointer() : () -> i64
      %10017 = arith.constant 5 : i64
      %10018 = func.call @cc_box_character(%10017) : (i64) -> i64
      func.call @stack_push_pointer(%10018) : (i64) -> ()
      %10019 = func.call @stack_pop_pointer() : () -> i64
      %10020 = arith.constant 6 : i64
      %10021 = func.call @cc_box_character(%10020) : (i64) -> i64
      func.call @stack_push_pointer(%10021) : (i64) -> ()
      %10022 = func.call @stack_pop_pointer() : () -> i64
      %10023 = arith.constant 7 : i64
      %10024 = func.call @cc_box_character(%10023) : (i64) -> i64
      func.call @stack_push_pointer(%10024) : (i64) -> ()
      %10025 = func.call @stack_pop_pointer() : () -> i64
      %10026 = arith.constant 8 : i64
      %10027 = func.call @cc_box_character(%10026) : (i64) -> i64
      func.call @stack_push_pointer(%10027) : (i64) -> ()
      %10028 = func.call @stack_pop_pointer() : () -> i64
      %10029 = arith.constant 9 : i64
      %10030 = func.call @cc_box_character(%10029) : (i64) -> i64
      func.call @stack_push_pointer(%10030) : (i64) -> ()
      %10031 = func.call @stack_pop_pointer() : () -> i64
      %10032 = arith.constant 10 : i64
      %10033 = func.call @cc_box_character(%10032) : (i64) -> i64
      func.call @stack_push_pointer(%10033) : (i64) -> ()
      %10034 = func.call @stack_pop_pointer() : () -> i64
      %10035 = arith.constant 11 : i64
      %10036 = func.call @cc_box_character(%10035) : (i64) -> i64
      func.call @stack_push_pointer(%10036) : (i64) -> ()
      %10037 = func.call @stack_pop_pointer() : () -> i64
      %10038 = arith.constant 12 : i64
      %10039 = func.call @cc_box_character(%10038) : (i64) -> i64
      func.call @stack_push_pointer(%10039) : (i64) -> ()
      %10040 = func.call @stack_pop_pointer() : () -> i64
      %10041 = arith.constant 13 : i64
      %10042 = func.call @cc_box_character(%10041) : (i64) -> i64
      func.call @stack_push_pointer(%10042) : (i64) -> ()
      %10043 = func.call @stack_pop_pointer() : () -> i64
      %10044 = arith.constant 14 : i64
      %10045 = func.call @cc_box_character(%10044) : (i64) -> i64
      func.call @stack_push_pointer(%10045) : (i64) -> ()
      %10046 = func.call @stack_pop_pointer() : () -> i64
      %10047 = arith.constant 15 : i64
      %10048 = func.call @cc_box_character(%10047) : (i64) -> i64
      func.call @stack_push_pointer(%10048) : (i64) -> ()
      %10049 = func.call @stack_pop_pointer() : () -> i64
      %10050 = arith.constant 16 : i64
      %10051 = func.call @cc_box_character(%10050) : (i64) -> i64
      func.call @stack_push_pointer(%10051) : (i64) -> ()
      %10052 = func.call @stack_pop_pointer() : () -> i64
      %10053 = arith.constant 17 : i64
      %10054 = func.call @cc_box_character(%10053) : (i64) -> i64
      func.call @stack_push_pointer(%10054) : (i64) -> ()
      %10055 = func.call @stack_pop_pointer() : () -> i64
      %10056 = arith.constant 18 : i64
      %10057 = func.call @cc_box_character(%10056) : (i64) -> i64
      func.call @stack_push_pointer(%10057) : (i64) -> ()
      %10058 = func.call @stack_pop_pointer() : () -> i64
      %10059 = arith.constant 19 : i64
      %10060 = func.call @cc_box_character(%10059) : (i64) -> i64
      func.call @stack_push_pointer(%10060) : (i64) -> ()
      %10061 = func.call @stack_pop_pointer() : () -> i64
      %10062 = arith.constant 20 : i64
      %10063 = func.call @cc_box_character(%10062) : (i64) -> i64
      func.call @stack_push_pointer(%10063) : (i64) -> ()
      %10064 = func.call @stack_pop_pointer() : () -> i64
      %10065 = arith.constant 21 : i64
      %10066 = func.call @cc_box_character(%10065) : (i64) -> i64
      func.call @stack_push_pointer(%10066) : (i64) -> ()
      %10067 = func.call @stack_pop_pointer() : () -> i64
      %10068 = arith.constant 22 : i64
      %10069 = func.call @cc_box_character(%10068) : (i64) -> i64
      func.call @stack_push_pointer(%10069) : (i64) -> ()
      %10070 = func.call @stack_pop_pointer() : () -> i64
      %10071 = arith.constant 23 : i64
      %10072 = func.call @cc_box_character(%10071) : (i64) -> i64
      func.call @stack_push_pointer(%10072) : (i64) -> ()
      %10073 = func.call @stack_pop_pointer() : () -> i64
      %10074 = arith.constant 24 : i64
      %10075 = func.call @cc_box_character(%10074) : (i64) -> i64
      func.call @stack_push_pointer(%10075) : (i64) -> ()
      %10076 = func.call @stack_pop_pointer() : () -> i64
      %10077 = arith.constant 25 : i64
      %10078 = func.call @cc_box_character(%10077) : (i64) -> i64
      func.call @stack_push_pointer(%10078) : (i64) -> ()
      %10079 = func.call @stack_pop_pointer() : () -> i64
      %10080 = arith.constant 26 : i64
      %10081 = func.call @cc_box_character(%10080) : (i64) -> i64
      func.call @stack_push_pointer(%10081) : (i64) -> ()
      %10082 = func.call @stack_pop_pointer() : () -> i64
      %10083 = arith.constant 27 : i64
      %10084 = func.call @cc_box_character(%10083) : (i64) -> i64
      func.call @stack_push_pointer(%10084) : (i64) -> ()
      %10085 = func.call @stack_pop_pointer() : () -> i64
      %10086 = arith.constant 28 : i64
      %10087 = func.call @cc_box_character(%10086) : (i64) -> i64
      func.call @stack_push_pointer(%10087) : (i64) -> ()
      %10088 = func.call @stack_pop_pointer() : () -> i64
      %10089 = arith.constant 29 : i64
      %10090 = func.call @cc_box_character(%10089) : (i64) -> i64
      func.call @stack_push_pointer(%10090) : (i64) -> ()
      %10091 = func.call @stack_pop_pointer() : () -> i64
      %10092 = arith.constant 30 : i64
      %10093 = func.call @cc_box_character(%10092) : (i64) -> i64
      func.call @stack_push_pointer(%10093) : (i64) -> ()
      %10094 = func.call @stack_pop_pointer() : () -> i64
      %10095 = arith.constant 31 : i64
      %10096 = func.call @cc_box_character(%10095) : (i64) -> i64
      func.call @stack_push_pointer(%10096) : (i64) -> ()
      %10097 = func.call @stack_pop_pointer() : () -> i64
      %10098 = arith.constant 32 : i64
      %10099 = func.call @cc_box_character(%10098) : (i64) -> i64
      func.call @stack_push_pointer(%10099) : (i64) -> ()
      %10100 = func.call @stack_pop_pointer() : () -> i64
      %10101 = arith.constant 127 : i64
      %10102 = func.call @cc_box_character(%10101) : (i64) -> i64
      func.call @stack_push_pointer(%10102) : (i64) -> ()
      %10103 = func.call @stack_pop_pointer() : () -> i64
      %10104 = func.call @cc_nil_value() : () -> i64
      %10105 = func.call @cc_errorp(%10004) : (i64) -> i64
      %10106 = arith.cmpi ne, %10105, %10104 : i64
      %10107 = arith.cmpi eq, %10104, %10104 : i64
      %10108 = arith.andi %10106, %10107 : i1
      %10109 = scf.if %10108 -> (i64) {
        scf.yield %10004 : i64
      } else {
        scf.yield %10104 : i64
      }
      %10110 = func.call @cc_errorp(%10007) : (i64) -> i64
      %10111 = arith.cmpi ne, %10110, %10104 : i64
      %10112 = arith.cmpi eq, %10109, %10104 : i64
      %10113 = arith.andi %10111, %10112 : i1
      %10114 = scf.if %10113 -> (i64) {
        scf.yield %10007 : i64
      } else {
        scf.yield %10109 : i64
      }
      %10115 = func.call @cc_errorp(%10010) : (i64) -> i64
      %10116 = arith.cmpi ne, %10115, %10104 : i64
      %10117 = arith.cmpi eq, %10114, %10104 : i64
      %10118 = arith.andi %10116, %10117 : i1
      %10119 = scf.if %10118 -> (i64) {
        scf.yield %10010 : i64
      } else {
        scf.yield %10114 : i64
      }
      %10120 = func.call @cc_errorp(%10013) : (i64) -> i64
      %10121 = arith.cmpi ne, %10120, %10104 : i64
      %10122 = arith.cmpi eq, %10119, %10104 : i64
      %10123 = arith.andi %10121, %10122 : i1
      %10124 = scf.if %10123 -> (i64) {
        scf.yield %10013 : i64
      } else {
        scf.yield %10119 : i64
      }
      %10125 = func.call @cc_errorp(%10016) : (i64) -> i64
      %10126 = arith.cmpi ne, %10125, %10104 : i64
      %10127 = arith.cmpi eq, %10124, %10104 : i64
      %10128 = arith.andi %10126, %10127 : i1
      %10129 = scf.if %10128 -> (i64) {
        scf.yield %10016 : i64
      } else {
        scf.yield %10124 : i64
      }
      %10130 = func.call @cc_errorp(%10019) : (i64) -> i64
      %10131 = arith.cmpi ne, %10130, %10104 : i64
      %10132 = arith.cmpi eq, %10129, %10104 : i64
      %10133 = arith.andi %10131, %10132 : i1
      %10134 = scf.if %10133 -> (i64) {
        scf.yield %10019 : i64
      } else {
        scf.yield %10129 : i64
      }
      %10135 = func.call @cc_errorp(%10022) : (i64) -> i64
      %10136 = arith.cmpi ne, %10135, %10104 : i64
      %10137 = arith.cmpi eq, %10134, %10104 : i64
      %10138 = arith.andi %10136, %10137 : i1
      %10139 = scf.if %10138 -> (i64) {
        scf.yield %10022 : i64
      } else {
        scf.yield %10134 : i64
      }
      %10140 = func.call @cc_errorp(%10025) : (i64) -> i64
      %10141 = arith.cmpi ne, %10140, %10104 : i64
      %10142 = arith.cmpi eq, %10139, %10104 : i64
      %10143 = arith.andi %10141, %10142 : i1
      %10144 = scf.if %10143 -> (i64) {
        scf.yield %10025 : i64
      } else {
        scf.yield %10139 : i64
      }
      %10145 = func.call @cc_errorp(%10028) : (i64) -> i64
      %10146 = arith.cmpi ne, %10145, %10104 : i64
      %10147 = arith.cmpi eq, %10144, %10104 : i64
      %10148 = arith.andi %10146, %10147 : i1
      %10149 = scf.if %10148 -> (i64) {
        scf.yield %10028 : i64
      } else {
        scf.yield %10144 : i64
      }
      %10150 = func.call @cc_errorp(%10031) : (i64) -> i64
      %10151 = arith.cmpi ne, %10150, %10104 : i64
      %10152 = arith.cmpi eq, %10149, %10104 : i64
      %10153 = arith.andi %10151, %10152 : i1
      %10154 = scf.if %10153 -> (i64) {
        scf.yield %10031 : i64
      } else {
        scf.yield %10149 : i64
      }
      %10155 = func.call @cc_errorp(%10034) : (i64) -> i64
      %10156 = arith.cmpi ne, %10155, %10104 : i64
      %10157 = arith.cmpi eq, %10154, %10104 : i64
      %10158 = arith.andi %10156, %10157 : i1
      %10159 = scf.if %10158 -> (i64) {
        scf.yield %10034 : i64
      } else {
        scf.yield %10154 : i64
      }
      %10160 = func.call @cc_errorp(%10037) : (i64) -> i64
      %10161 = arith.cmpi ne, %10160, %10104 : i64
      %10162 = arith.cmpi eq, %10159, %10104 : i64
      %10163 = arith.andi %10161, %10162 : i1
      %10164 = scf.if %10163 -> (i64) {
        scf.yield %10037 : i64
      } else {
        scf.yield %10159 : i64
      }
      %10165 = func.call @cc_errorp(%10040) : (i64) -> i64
      %10166 = arith.cmpi ne, %10165, %10104 : i64
      %10167 = arith.cmpi eq, %10164, %10104 : i64
      %10168 = arith.andi %10166, %10167 : i1
      %10169 = scf.if %10168 -> (i64) {
        scf.yield %10040 : i64
      } else {
        scf.yield %10164 : i64
      }
      %10170 = func.call @cc_errorp(%10043) : (i64) -> i64
      %10171 = arith.cmpi ne, %10170, %10104 : i64
      %10172 = arith.cmpi eq, %10169, %10104 : i64
      %10173 = arith.andi %10171, %10172 : i1
      %10174 = scf.if %10173 -> (i64) {
        scf.yield %10043 : i64
      } else {
        scf.yield %10169 : i64
      }
      %10175 = func.call @cc_errorp(%10046) : (i64) -> i64
      %10176 = arith.cmpi ne, %10175, %10104 : i64
      %10177 = arith.cmpi eq, %10174, %10104 : i64
      %10178 = arith.andi %10176, %10177 : i1
      %10179 = scf.if %10178 -> (i64) {
        scf.yield %10046 : i64
      } else {
        scf.yield %10174 : i64
      }
      %10180 = func.call @cc_errorp(%10049) : (i64) -> i64
      %10181 = arith.cmpi ne, %10180, %10104 : i64
      %10182 = arith.cmpi eq, %10179, %10104 : i64
      %10183 = arith.andi %10181, %10182 : i1
      %10184 = scf.if %10183 -> (i64) {
        scf.yield %10049 : i64
      } else {
        scf.yield %10179 : i64
      }
      %10185 = func.call @cc_errorp(%10052) : (i64) -> i64
      %10186 = arith.cmpi ne, %10185, %10104 : i64
      %10187 = arith.cmpi eq, %10184, %10104 : i64
      %10188 = arith.andi %10186, %10187 : i1
      %10189 = scf.if %10188 -> (i64) {
        scf.yield %10052 : i64
      } else {
        scf.yield %10184 : i64
      }
      %10190 = func.call @cc_errorp(%10055) : (i64) -> i64
      %10191 = arith.cmpi ne, %10190, %10104 : i64
      %10192 = arith.cmpi eq, %10189, %10104 : i64
      %10193 = arith.andi %10191, %10192 : i1
      %10194 = scf.if %10193 -> (i64) {
        scf.yield %10055 : i64
      } else {
        scf.yield %10189 : i64
      }
      %10195 = func.call @cc_errorp(%10058) : (i64) -> i64
      %10196 = arith.cmpi ne, %10195, %10104 : i64
      %10197 = arith.cmpi eq, %10194, %10104 : i64
      %10198 = arith.andi %10196, %10197 : i1
      %10199 = scf.if %10198 -> (i64) {
        scf.yield %10058 : i64
      } else {
        scf.yield %10194 : i64
      }
      %10200 = func.call @cc_errorp(%10061) : (i64) -> i64
      %10201 = arith.cmpi ne, %10200, %10104 : i64
      %10202 = arith.cmpi eq, %10199, %10104 : i64
      %10203 = arith.andi %10201, %10202 : i1
      %10204 = scf.if %10203 -> (i64) {
        scf.yield %10061 : i64
      } else {
        scf.yield %10199 : i64
      }
      %10205 = func.call @cc_errorp(%10064) : (i64) -> i64
      %10206 = arith.cmpi ne, %10205, %10104 : i64
      %10207 = arith.cmpi eq, %10204, %10104 : i64
      %10208 = arith.andi %10206, %10207 : i1
      %10209 = scf.if %10208 -> (i64) {
        scf.yield %10064 : i64
      } else {
        scf.yield %10204 : i64
      }
      %10210 = func.call @cc_errorp(%10067) : (i64) -> i64
      %10211 = arith.cmpi ne, %10210, %10104 : i64
      %10212 = arith.cmpi eq, %10209, %10104 : i64
      %10213 = arith.andi %10211, %10212 : i1
      %10214 = scf.if %10213 -> (i64) {
        scf.yield %10067 : i64
      } else {
        scf.yield %10209 : i64
      }
      %10215 = func.call @cc_errorp(%10070) : (i64) -> i64
      %10216 = arith.cmpi ne, %10215, %10104 : i64
      %10217 = arith.cmpi eq, %10214, %10104 : i64
      %10218 = arith.andi %10216, %10217 : i1
      %10219 = scf.if %10218 -> (i64) {
        scf.yield %10070 : i64
      } else {
        scf.yield %10214 : i64
      }
      %10220 = func.call @cc_errorp(%10073) : (i64) -> i64
      %10221 = arith.cmpi ne, %10220, %10104 : i64
      %10222 = arith.cmpi eq, %10219, %10104 : i64
      %10223 = arith.andi %10221, %10222 : i1
      %10224 = scf.if %10223 -> (i64) {
        scf.yield %10073 : i64
      } else {
        scf.yield %10219 : i64
      }
      %10225 = func.call @cc_errorp(%10076) : (i64) -> i64
      %10226 = arith.cmpi ne, %10225, %10104 : i64
      %10227 = arith.cmpi eq, %10224, %10104 : i64
      %10228 = arith.andi %10226, %10227 : i1
      %10229 = scf.if %10228 -> (i64) {
        scf.yield %10076 : i64
      } else {
        scf.yield %10224 : i64
      }
      %10230 = func.call @cc_errorp(%10079) : (i64) -> i64
      %10231 = arith.cmpi ne, %10230, %10104 : i64
      %10232 = arith.cmpi eq, %10229, %10104 : i64
      %10233 = arith.andi %10231, %10232 : i1
      %10234 = scf.if %10233 -> (i64) {
        scf.yield %10079 : i64
      } else {
        scf.yield %10229 : i64
      }
      %10235 = func.call @cc_errorp(%10082) : (i64) -> i64
      %10236 = arith.cmpi ne, %10235, %10104 : i64
      %10237 = arith.cmpi eq, %10234, %10104 : i64
      %10238 = arith.andi %10236, %10237 : i1
      %10239 = scf.if %10238 -> (i64) {
        scf.yield %10082 : i64
      } else {
        scf.yield %10234 : i64
      }
      %10240 = func.call @cc_errorp(%10085) : (i64) -> i64
      %10241 = arith.cmpi ne, %10240, %10104 : i64
      %10242 = arith.cmpi eq, %10239, %10104 : i64
      %10243 = arith.andi %10241, %10242 : i1
      %10244 = scf.if %10243 -> (i64) {
        scf.yield %10085 : i64
      } else {
        scf.yield %10239 : i64
      }
      %10245 = func.call @cc_errorp(%10088) : (i64) -> i64
      %10246 = arith.cmpi ne, %10245, %10104 : i64
      %10247 = arith.cmpi eq, %10244, %10104 : i64
      %10248 = arith.andi %10246, %10247 : i1
      %10249 = scf.if %10248 -> (i64) {
        scf.yield %10088 : i64
      } else {
        scf.yield %10244 : i64
      }
      %10250 = func.call @cc_errorp(%10091) : (i64) -> i64
      %10251 = arith.cmpi ne, %10250, %10104 : i64
      %10252 = arith.cmpi eq, %10249, %10104 : i64
      %10253 = arith.andi %10251, %10252 : i1
      %10254 = scf.if %10253 -> (i64) {
        scf.yield %10091 : i64
      } else {
        scf.yield %10249 : i64
      }
      %10255 = func.call @cc_errorp(%10094) : (i64) -> i64
      %10256 = arith.cmpi ne, %10255, %10104 : i64
      %10257 = arith.cmpi eq, %10254, %10104 : i64
      %10258 = arith.andi %10256, %10257 : i1
      %10259 = scf.if %10258 -> (i64) {
        scf.yield %10094 : i64
      } else {
        scf.yield %10254 : i64
      }
      %10260 = func.call @cc_errorp(%10097) : (i64) -> i64
      %10261 = arith.cmpi ne, %10260, %10104 : i64
      %10262 = arith.cmpi eq, %10259, %10104 : i64
      %10263 = arith.andi %10261, %10262 : i1
      %10264 = scf.if %10263 -> (i64) {
        scf.yield %10097 : i64
      } else {
        scf.yield %10259 : i64
      }
      %10265 = func.call @cc_errorp(%10100) : (i64) -> i64
      %10266 = arith.cmpi ne, %10265, %10104 : i64
      %10267 = arith.cmpi eq, %10264, %10104 : i64
      %10268 = arith.andi %10266, %10267 : i1
      %10269 = scf.if %10268 -> (i64) {
        scf.yield %10100 : i64
      } else {
        scf.yield %10264 : i64
      }
      %10270 = func.call @cc_errorp(%10103) : (i64) -> i64
      %10271 = arith.cmpi ne, %10270, %10104 : i64
      %10272 = arith.cmpi eq, %10269, %10104 : i64
      %10273 = arith.andi %10271, %10272 : i1
      %10274 = scf.if %10273 -> (i64) {
        scf.yield %10103 : i64
      } else {
        scf.yield %10269 : i64
      }
      %10275 = arith.cmpi ne, %10274, %10104 : i64
      scf.if %10275 {
        func.call @stack_push_pointer(%10274) : (i64) -> ()
      } else {
        %10276 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%10276) : (i64) -> ()
        func.call @stack_push_pointer(%10103) : (i64) -> ()
        %10277 = func.call @stack_pop_pointer() : () -> i64
        %10278 = func.call @stack_pop_pointer() : () -> i64
        %10279 = func.call @cc_cons(%10277, %10278) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10279) : (i64) -> ()
        func.call @stack_push_pointer(%10100) : (i64) -> ()
        %10280 = func.call @stack_pop_pointer() : () -> i64
        %10281 = func.call @stack_pop_pointer() : () -> i64
        %10282 = func.call @cc_cons(%10280, %10281) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10282) : (i64) -> ()
        func.call @stack_push_pointer(%10097) : (i64) -> ()
        %10283 = func.call @stack_pop_pointer() : () -> i64
        %10284 = func.call @stack_pop_pointer() : () -> i64
        %10285 = func.call @cc_cons(%10283, %10284) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10285) : (i64) -> ()
        func.call @stack_push_pointer(%10094) : (i64) -> ()
        %10286 = func.call @stack_pop_pointer() : () -> i64
        %10287 = func.call @stack_pop_pointer() : () -> i64
        %10288 = func.call @cc_cons(%10286, %10287) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10288) : (i64) -> ()
        func.call @stack_push_pointer(%10091) : (i64) -> ()
        %10289 = func.call @stack_pop_pointer() : () -> i64
        %10290 = func.call @stack_pop_pointer() : () -> i64
        %10291 = func.call @cc_cons(%10289, %10290) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10291) : (i64) -> ()
        func.call @stack_push_pointer(%10088) : (i64) -> ()
        %10292 = func.call @stack_pop_pointer() : () -> i64
        %10293 = func.call @stack_pop_pointer() : () -> i64
        %10294 = func.call @cc_cons(%10292, %10293) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10294) : (i64) -> ()
        func.call @stack_push_pointer(%10085) : (i64) -> ()
        %10295 = func.call @stack_pop_pointer() : () -> i64
        %10296 = func.call @stack_pop_pointer() : () -> i64
        %10297 = func.call @cc_cons(%10295, %10296) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10297) : (i64) -> ()
        func.call @stack_push_pointer(%10082) : (i64) -> ()
        %10298 = func.call @stack_pop_pointer() : () -> i64
        %10299 = func.call @stack_pop_pointer() : () -> i64
        %10300 = func.call @cc_cons(%10298, %10299) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10300) : (i64) -> ()
        func.call @stack_push_pointer(%10079) : (i64) -> ()
        %10301 = func.call @stack_pop_pointer() : () -> i64
        %10302 = func.call @stack_pop_pointer() : () -> i64
        %10303 = func.call @cc_cons(%10301, %10302) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10303) : (i64) -> ()
        func.call @stack_push_pointer(%10076) : (i64) -> ()
        %10304 = func.call @stack_pop_pointer() : () -> i64
        %10305 = func.call @stack_pop_pointer() : () -> i64
        %10306 = func.call @cc_cons(%10304, %10305) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10306) : (i64) -> ()
        func.call @stack_push_pointer(%10073) : (i64) -> ()
        %10307 = func.call @stack_pop_pointer() : () -> i64
        %10308 = func.call @stack_pop_pointer() : () -> i64
        %10309 = func.call @cc_cons(%10307, %10308) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10309) : (i64) -> ()
        func.call @stack_push_pointer(%10070) : (i64) -> ()
        %10310 = func.call @stack_pop_pointer() : () -> i64
        %10311 = func.call @stack_pop_pointer() : () -> i64
        %10312 = func.call @cc_cons(%10310, %10311) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10312) : (i64) -> ()
        func.call @stack_push_pointer(%10067) : (i64) -> ()
        %10313 = func.call @stack_pop_pointer() : () -> i64
        %10314 = func.call @stack_pop_pointer() : () -> i64
        %10315 = func.call @cc_cons(%10313, %10314) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10315) : (i64) -> ()
        func.call @stack_push_pointer(%10064) : (i64) -> ()
        %10316 = func.call @stack_pop_pointer() : () -> i64
        %10317 = func.call @stack_pop_pointer() : () -> i64
        %10318 = func.call @cc_cons(%10316, %10317) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10318) : (i64) -> ()
        func.call @stack_push_pointer(%10061) : (i64) -> ()
        %10319 = func.call @stack_pop_pointer() : () -> i64
        %10320 = func.call @stack_pop_pointer() : () -> i64
        %10321 = func.call @cc_cons(%10319, %10320) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10321) : (i64) -> ()
        func.call @stack_push_pointer(%10058) : (i64) -> ()
        %10322 = func.call @stack_pop_pointer() : () -> i64
        %10323 = func.call @stack_pop_pointer() : () -> i64
        %10324 = func.call @cc_cons(%10322, %10323) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10324) : (i64) -> ()
        func.call @stack_push_pointer(%10055) : (i64) -> ()
        %10325 = func.call @stack_pop_pointer() : () -> i64
        %10326 = func.call @stack_pop_pointer() : () -> i64
        %10327 = func.call @cc_cons(%10325, %10326) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10327) : (i64) -> ()
        func.call @stack_push_pointer(%10052) : (i64) -> ()
        %10328 = func.call @stack_pop_pointer() : () -> i64
        %10329 = func.call @stack_pop_pointer() : () -> i64
        %10330 = func.call @cc_cons(%10328, %10329) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10330) : (i64) -> ()
        func.call @stack_push_pointer(%10049) : (i64) -> ()
        %10331 = func.call @stack_pop_pointer() : () -> i64
        %10332 = func.call @stack_pop_pointer() : () -> i64
        %10333 = func.call @cc_cons(%10331, %10332) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10333) : (i64) -> ()
        func.call @stack_push_pointer(%10046) : (i64) -> ()
        %10334 = func.call @stack_pop_pointer() : () -> i64
        %10335 = func.call @stack_pop_pointer() : () -> i64
        %10336 = func.call @cc_cons(%10334, %10335) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10336) : (i64) -> ()
        func.call @stack_push_pointer(%10043) : (i64) -> ()
        %10337 = func.call @stack_pop_pointer() : () -> i64
        %10338 = func.call @stack_pop_pointer() : () -> i64
        %10339 = func.call @cc_cons(%10337, %10338) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10339) : (i64) -> ()
        func.call @stack_push_pointer(%10040) : (i64) -> ()
        %10340 = func.call @stack_pop_pointer() : () -> i64
        %10341 = func.call @stack_pop_pointer() : () -> i64
        %10342 = func.call @cc_cons(%10340, %10341) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10342) : (i64) -> ()
        func.call @stack_push_pointer(%10037) : (i64) -> ()
        %10343 = func.call @stack_pop_pointer() : () -> i64
        %10344 = func.call @stack_pop_pointer() : () -> i64
        %10345 = func.call @cc_cons(%10343, %10344) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10345) : (i64) -> ()
        func.call @stack_push_pointer(%10034) : (i64) -> ()
        %10346 = func.call @stack_pop_pointer() : () -> i64
        %10347 = func.call @stack_pop_pointer() : () -> i64
        %10348 = func.call @cc_cons(%10346, %10347) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10348) : (i64) -> ()
        func.call @stack_push_pointer(%10031) : (i64) -> ()
        %10349 = func.call @stack_pop_pointer() : () -> i64
        %10350 = func.call @stack_pop_pointer() : () -> i64
        %10351 = func.call @cc_cons(%10349, %10350) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10351) : (i64) -> ()
        func.call @stack_push_pointer(%10028) : (i64) -> ()
        %10352 = func.call @stack_pop_pointer() : () -> i64
        %10353 = func.call @stack_pop_pointer() : () -> i64
        %10354 = func.call @cc_cons(%10352, %10353) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10354) : (i64) -> ()
        func.call @stack_push_pointer(%10025) : (i64) -> ()
        %10355 = func.call @stack_pop_pointer() : () -> i64
        %10356 = func.call @stack_pop_pointer() : () -> i64
        %10357 = func.call @cc_cons(%10355, %10356) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10357) : (i64) -> ()
        func.call @stack_push_pointer(%10022) : (i64) -> ()
        %10358 = func.call @stack_pop_pointer() : () -> i64
        %10359 = func.call @stack_pop_pointer() : () -> i64
        %10360 = func.call @cc_cons(%10358, %10359) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10360) : (i64) -> ()
        func.call @stack_push_pointer(%10019) : (i64) -> ()
        %10361 = func.call @stack_pop_pointer() : () -> i64
        %10362 = func.call @stack_pop_pointer() : () -> i64
        %10363 = func.call @cc_cons(%10361, %10362) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10363) : (i64) -> ()
        func.call @stack_push_pointer(%10016) : (i64) -> ()
        %10364 = func.call @stack_pop_pointer() : () -> i64
        %10365 = func.call @stack_pop_pointer() : () -> i64
        %10366 = func.call @cc_cons(%10364, %10365) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10366) : (i64) -> ()
        func.call @stack_push_pointer(%10013) : (i64) -> ()
        %10367 = func.call @stack_pop_pointer() : () -> i64
        %10368 = func.call @stack_pop_pointer() : () -> i64
        %10369 = func.call @cc_cons(%10367, %10368) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10369) : (i64) -> ()
        func.call @stack_push_pointer(%10010) : (i64) -> ()
        %10370 = func.call @stack_pop_pointer() : () -> i64
        %10371 = func.call @stack_pop_pointer() : () -> i64
        %10372 = func.call @cc_cons(%10370, %10371) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10372) : (i64) -> ()
        func.call @stack_push_pointer(%10007) : (i64) -> ()
        %10373 = func.call @stack_pop_pointer() : () -> i64
        %10374 = func.call @stack_pop_pointer() : () -> i64
        %10375 = func.call @cc_cons(%10373, %10374) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10375) : (i64) -> ()
        func.call @stack_push_pointer(%10004) : (i64) -> ()
        %10376 = func.call @stack_pop_pointer() : () -> i64
        %10377 = func.call @stack_pop_pointer() : () -> i64
        %10378 = func.call @cc_cons(%10376, %10377) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10378) : (i64) -> ()
      }
      %10379 = func.call @stack_pop_pointer() : () -> i64
      %10380 = func.call @cc_nil_value() : () -> i64
      %10381 = func.call @cc_cons(%10379, %10380) : (i64, i64) -> i64
      %10382 = func.call @cc_not(%10381) : (i64) -> i64
      func.call @stack_push_pointer(%10382) : (i64) -> ()
      %10383 = func.call @stack_pop_pointer() : () -> i64
      %10384 = func.call @cc_nil_value() : () -> i64
      %10385 = func.call @cc_cons(%10383, %10384) : (i64, i64) -> i64
      %10386 = func.call @cc_not(%10385) : (i64) -> i64
      func.call @stack_push_pointer(%10386) : (i64) -> ()
      %10387 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10387 : i64
    }
    func.call @stack_push_pointer(%10001) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192229"() {
    %10607 = func.call @cc_nil_value() : () -> i64
    %10608 = func.call @cc_nil_value() : () -> i64
    %10609 = func.call @cc_errorp(%10607) : (i64) -> i64
    %10610 = arith.cmpi ne, %10609, %10608 : i64
    %10611 = scf.if %10610 -> (i64) {
      scf.yield %10607 : i64
    } else {
      %10612 = arith.constant 8 : i64
      %10613 = func.call @cc_box_character(%10612) : (i64) -> i64
      func.call @stack_push_pointer(%10613) : (i64) -> ()
      %10614 = func.call @stack_pop_pointer() : () -> i64
      %10615 = arith.constant 9 : i64
      %10616 = func.call @cc_box_character(%10615) : (i64) -> i64
      func.call @stack_push_pointer(%10616) : (i64) -> ()
      %10617 = func.call @stack_pop_pointer() : () -> i64
      %10618 = arith.constant 10 : i64
      %10619 = func.call @cc_box_character(%10618) : (i64) -> i64
      func.call @stack_push_pointer(%10619) : (i64) -> ()
      %10620 = func.call @stack_pop_pointer() : () -> i64
      %10621 = arith.constant 10 : i64
      %10622 = func.call @cc_box_character(%10621) : (i64) -> i64
      func.call @stack_push_pointer(%10622) : (i64) -> ()
      %10623 = func.call @stack_pop_pointer() : () -> i64
      %10624 = arith.constant 12 : i64
      %10625 = func.call @cc_box_character(%10624) : (i64) -> i64
      func.call @stack_push_pointer(%10625) : (i64) -> ()
      %10626 = func.call @stack_pop_pointer() : () -> i64
      %10627 = arith.constant 13 : i64
      %10628 = func.call @cc_box_character(%10627) : (i64) -> i64
      func.call @stack_push_pointer(%10628) : (i64) -> ()
      %10629 = func.call @stack_pop_pointer() : () -> i64
      %10630 = arith.constant 32 : i64
      %10631 = func.call @cc_box_character(%10630) : (i64) -> i64
      func.call @stack_push_pointer(%10631) : (i64) -> ()
      %10632 = func.call @stack_pop_pointer() : () -> i64
      %10633 = arith.constant 8 : i64
      %10634 = func.call @cc_box_character(%10633) : (i64) -> i64
      func.call @stack_push_pointer(%10634) : (i64) -> ()
      %10635 = func.call @stack_pop_pointer() : () -> i64
      %10636 = arith.constant 9 : i64
      %10637 = func.call @cc_box_character(%10636) : (i64) -> i64
      func.call @stack_push_pointer(%10637) : (i64) -> ()
      %10638 = func.call @stack_pop_pointer() : () -> i64
      %10639 = arith.constant 10 : i64
      %10640 = func.call @cc_box_character(%10639) : (i64) -> i64
      func.call @stack_push_pointer(%10640) : (i64) -> ()
      %10641 = func.call @stack_pop_pointer() : () -> i64
      %10642 = arith.constant 10 : i64
      %10643 = func.call @cc_box_character(%10642) : (i64) -> i64
      func.call @stack_push_pointer(%10643) : (i64) -> ()
      %10644 = func.call @stack_pop_pointer() : () -> i64
      %10645 = arith.constant 12 : i64
      %10646 = func.call @cc_box_character(%10645) : (i64) -> i64
      func.call @stack_push_pointer(%10646) : (i64) -> ()
      %10647 = func.call @stack_pop_pointer() : () -> i64
      %10648 = arith.constant 13 : i64
      %10649 = func.call @cc_box_character(%10648) : (i64) -> i64
      func.call @stack_push_pointer(%10649) : (i64) -> ()
      %10650 = func.call @stack_pop_pointer() : () -> i64
      %10651 = arith.constant 32 : i64
      %10652 = func.call @cc_box_character(%10651) : (i64) -> i64
      func.call @stack_push_pointer(%10652) : (i64) -> ()
      %10653 = func.call @stack_pop_pointer() : () -> i64
      %10654 = func.call @cc_nil_value() : () -> i64
      %10655 = func.call @cc_errorp(%10614) : (i64) -> i64
      %10656 = arith.cmpi ne, %10655, %10654 : i64
      %10657 = arith.cmpi eq, %10654, %10654 : i64
      %10658 = arith.andi %10656, %10657 : i1
      %10659 = scf.if %10658 -> (i64) {
        scf.yield %10614 : i64
      } else {
        scf.yield %10654 : i64
      }
      %10660 = func.call @cc_errorp(%10617) : (i64) -> i64
      %10661 = arith.cmpi ne, %10660, %10654 : i64
      %10662 = arith.cmpi eq, %10659, %10654 : i64
      %10663 = arith.andi %10661, %10662 : i1
      %10664 = scf.if %10663 -> (i64) {
        scf.yield %10617 : i64
      } else {
        scf.yield %10659 : i64
      }
      %10665 = func.call @cc_errorp(%10620) : (i64) -> i64
      %10666 = arith.cmpi ne, %10665, %10654 : i64
      %10667 = arith.cmpi eq, %10664, %10654 : i64
      %10668 = arith.andi %10666, %10667 : i1
      %10669 = scf.if %10668 -> (i64) {
        scf.yield %10620 : i64
      } else {
        scf.yield %10664 : i64
      }
      %10670 = func.call @cc_errorp(%10623) : (i64) -> i64
      %10671 = arith.cmpi ne, %10670, %10654 : i64
      %10672 = arith.cmpi eq, %10669, %10654 : i64
      %10673 = arith.andi %10671, %10672 : i1
      %10674 = scf.if %10673 -> (i64) {
        scf.yield %10623 : i64
      } else {
        scf.yield %10669 : i64
      }
      %10675 = func.call @cc_errorp(%10626) : (i64) -> i64
      %10676 = arith.cmpi ne, %10675, %10654 : i64
      %10677 = arith.cmpi eq, %10674, %10654 : i64
      %10678 = arith.andi %10676, %10677 : i1
      %10679 = scf.if %10678 -> (i64) {
        scf.yield %10626 : i64
      } else {
        scf.yield %10674 : i64
      }
      %10680 = func.call @cc_errorp(%10629) : (i64) -> i64
      %10681 = arith.cmpi ne, %10680, %10654 : i64
      %10682 = arith.cmpi eq, %10679, %10654 : i64
      %10683 = arith.andi %10681, %10682 : i1
      %10684 = scf.if %10683 -> (i64) {
        scf.yield %10629 : i64
      } else {
        scf.yield %10679 : i64
      }
      %10685 = func.call @cc_errorp(%10632) : (i64) -> i64
      %10686 = arith.cmpi ne, %10685, %10654 : i64
      %10687 = arith.cmpi eq, %10684, %10654 : i64
      %10688 = arith.andi %10686, %10687 : i1
      %10689 = scf.if %10688 -> (i64) {
        scf.yield %10632 : i64
      } else {
        scf.yield %10684 : i64
      }
      %10690 = func.call @cc_errorp(%10635) : (i64) -> i64
      %10691 = arith.cmpi ne, %10690, %10654 : i64
      %10692 = arith.cmpi eq, %10689, %10654 : i64
      %10693 = arith.andi %10691, %10692 : i1
      %10694 = scf.if %10693 -> (i64) {
        scf.yield %10635 : i64
      } else {
        scf.yield %10689 : i64
      }
      %10695 = func.call @cc_errorp(%10638) : (i64) -> i64
      %10696 = arith.cmpi ne, %10695, %10654 : i64
      %10697 = arith.cmpi eq, %10694, %10654 : i64
      %10698 = arith.andi %10696, %10697 : i1
      %10699 = scf.if %10698 -> (i64) {
        scf.yield %10638 : i64
      } else {
        scf.yield %10694 : i64
      }
      %10700 = func.call @cc_errorp(%10641) : (i64) -> i64
      %10701 = arith.cmpi ne, %10700, %10654 : i64
      %10702 = arith.cmpi eq, %10699, %10654 : i64
      %10703 = arith.andi %10701, %10702 : i1
      %10704 = scf.if %10703 -> (i64) {
        scf.yield %10641 : i64
      } else {
        scf.yield %10699 : i64
      }
      %10705 = func.call @cc_errorp(%10644) : (i64) -> i64
      %10706 = arith.cmpi ne, %10705, %10654 : i64
      %10707 = arith.cmpi eq, %10704, %10654 : i64
      %10708 = arith.andi %10706, %10707 : i1
      %10709 = scf.if %10708 -> (i64) {
        scf.yield %10644 : i64
      } else {
        scf.yield %10704 : i64
      }
      %10710 = func.call @cc_errorp(%10647) : (i64) -> i64
      %10711 = arith.cmpi ne, %10710, %10654 : i64
      %10712 = arith.cmpi eq, %10709, %10654 : i64
      %10713 = arith.andi %10711, %10712 : i1
      %10714 = scf.if %10713 -> (i64) {
        scf.yield %10647 : i64
      } else {
        scf.yield %10709 : i64
      }
      %10715 = func.call @cc_errorp(%10650) : (i64) -> i64
      %10716 = arith.cmpi ne, %10715, %10654 : i64
      %10717 = arith.cmpi eq, %10714, %10654 : i64
      %10718 = arith.andi %10716, %10717 : i1
      %10719 = scf.if %10718 -> (i64) {
        scf.yield %10650 : i64
      } else {
        scf.yield %10714 : i64
      }
      %10720 = func.call @cc_errorp(%10653) : (i64) -> i64
      %10721 = arith.cmpi ne, %10720, %10654 : i64
      %10722 = arith.cmpi eq, %10719, %10654 : i64
      %10723 = arith.andi %10721, %10722 : i1
      %10724 = scf.if %10723 -> (i64) {
        scf.yield %10653 : i64
      } else {
        scf.yield %10719 : i64
      }
      %10725 = arith.cmpi ne, %10724, %10654 : i64
      scf.if %10725 {
        func.call @stack_push_pointer(%10724) : (i64) -> ()
      } else {
        %10726 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%10726) : (i64) -> ()
        func.call @stack_push_pointer(%10653) : (i64) -> ()
        %10727 = func.call @stack_pop_pointer() : () -> i64
        %10728 = func.call @stack_pop_pointer() : () -> i64
        %10729 = func.call @cc_cons(%10727, %10728) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10729) : (i64) -> ()
        func.call @stack_push_pointer(%10650) : (i64) -> ()
        %10730 = func.call @stack_pop_pointer() : () -> i64
        %10731 = func.call @stack_pop_pointer() : () -> i64
        %10732 = func.call @cc_cons(%10730, %10731) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10732) : (i64) -> ()
        func.call @stack_push_pointer(%10647) : (i64) -> ()
        %10733 = func.call @stack_pop_pointer() : () -> i64
        %10734 = func.call @stack_pop_pointer() : () -> i64
        %10735 = func.call @cc_cons(%10733, %10734) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10735) : (i64) -> ()
        func.call @stack_push_pointer(%10644) : (i64) -> ()
        %10736 = func.call @stack_pop_pointer() : () -> i64
        %10737 = func.call @stack_pop_pointer() : () -> i64
        %10738 = func.call @cc_cons(%10736, %10737) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10738) : (i64) -> ()
        func.call @stack_push_pointer(%10641) : (i64) -> ()
        %10739 = func.call @stack_pop_pointer() : () -> i64
        %10740 = func.call @stack_pop_pointer() : () -> i64
        %10741 = func.call @cc_cons(%10739, %10740) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10741) : (i64) -> ()
        func.call @stack_push_pointer(%10638) : (i64) -> ()
        %10742 = func.call @stack_pop_pointer() : () -> i64
        %10743 = func.call @stack_pop_pointer() : () -> i64
        %10744 = func.call @cc_cons(%10742, %10743) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10744) : (i64) -> ()
        func.call @stack_push_pointer(%10635) : (i64) -> ()
        %10745 = func.call @stack_pop_pointer() : () -> i64
        %10746 = func.call @stack_pop_pointer() : () -> i64
        %10747 = func.call @cc_cons(%10745, %10746) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10747) : (i64) -> ()
        func.call @stack_push_pointer(%10632) : (i64) -> ()
        %10748 = func.call @stack_pop_pointer() : () -> i64
        %10749 = func.call @stack_pop_pointer() : () -> i64
        %10750 = func.call @cc_cons(%10748, %10749) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10750) : (i64) -> ()
        func.call @stack_push_pointer(%10629) : (i64) -> ()
        %10751 = func.call @stack_pop_pointer() : () -> i64
        %10752 = func.call @stack_pop_pointer() : () -> i64
        %10753 = func.call @cc_cons(%10751, %10752) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10753) : (i64) -> ()
        func.call @stack_push_pointer(%10626) : (i64) -> ()
        %10754 = func.call @stack_pop_pointer() : () -> i64
        %10755 = func.call @stack_pop_pointer() : () -> i64
        %10756 = func.call @cc_cons(%10754, %10755) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10756) : (i64) -> ()
        func.call @stack_push_pointer(%10623) : (i64) -> ()
        %10757 = func.call @stack_pop_pointer() : () -> i64
        %10758 = func.call @stack_pop_pointer() : () -> i64
        %10759 = func.call @cc_cons(%10757, %10758) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10759) : (i64) -> ()
        func.call @stack_push_pointer(%10620) : (i64) -> ()
        %10760 = func.call @stack_pop_pointer() : () -> i64
        %10761 = func.call @stack_pop_pointer() : () -> i64
        %10762 = func.call @cc_cons(%10760, %10761) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10762) : (i64) -> ()
        func.call @stack_push_pointer(%10617) : (i64) -> ()
        %10763 = func.call @stack_pop_pointer() : () -> i64
        %10764 = func.call @stack_pop_pointer() : () -> i64
        %10765 = func.call @cc_cons(%10763, %10764) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10765) : (i64) -> ()
        func.call @stack_push_pointer(%10614) : (i64) -> ()
        %10766 = func.call @stack_pop_pointer() : () -> i64
        %10767 = func.call @stack_pop_pointer() : () -> i64
        %10768 = func.call @cc_cons(%10766, %10767) : (i64, i64) -> i64
        func.call @stack_push_pointer(%10768) : (i64) -> ()
      }
      %10769 = func.call @stack_pop_pointer() : () -> i64
      %10770 = func.call @cc_nil_value() : () -> i64
      %10771 = func.call @cc_cons(%10769, %10770) : (i64, i64) -> i64
      %10772 = func.call @cc_not(%10771) : (i64) -> i64
      func.call @stack_push_pointer(%10772) : (i64) -> ()
      %10773 = func.call @stack_pop_pointer() : () -> i64
      %10774 = func.call @cc_nil_value() : () -> i64
      %10775 = func.call @cc_cons(%10773, %10774) : (i64, i64) -> i64
      %10776 = func.call @cc_not(%10775) : (i64) -> i64
      func.call @stack_push_pointer(%10776) : (i64) -> ()
      %10777 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %10777 : i64
    }
    func.call @stack_push_pointer(%10611) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_209815645192230"() {
    %10967 = func.call @cc_nil_value() : () -> i64
    %10968 = func.call @cc_nil_value() : () -> i64
    %10969 = func.call @cc_errorp(%10967) : (i64) -> i64
    %10970 = arith.cmpi ne, %10969, %10968 : i64
    %10971 = scf.if %10970 -> (i64) {
      scf.yield %10967 : i64
    } else {
      %10972 = arith.constant 0 : i64
      %10973 = func.call @cc_box_character(%10972) : (i64) -> i64
      func.call @stack_push_pointer(%10973) : (i64) -> ()
      %10974 = func.call @stack_pop_pointer() : () -> i64
      %10975 = arith.constant 7 : i64
      %10976 = func.call @cc_box_character(%10975) : (i64) -> i64
      func.call @stack_push_pointer(%10976) : (i64) -> ()
      %10977 = func.call @stack_pop_pointer() : () -> i64
      %10978 = arith.constant 27 : i64
      %10979 = func.call @cc_box_character(%10978) : (i64) -> i64
      func.call @stack_push_pointer(%10979) : (i64) -> ()
      %10980 = func.call @stack_pop_pointer() : () -> i64
      %10981 = arith.constant 127 : i64
      %10982 = func.call @cc_box_character(%10981) : (i64) -> i64
      func.call @stack_push_pointer(%10982) : (i64) -> ()
      %10983 = func.call @stack_pop_pointer() : () -> i64
      %10984 = arith.constant 0 : i64
      %10985 = func.call @cc_box_character(%10984) : (i64) -> i64
      func.call @stack_push_pointer(%10985) : (i64) -> ()
      %10986 = func.call @stack_pop_pointer() : () -> i64
      %10987 = arith.constant 7 : i64
      %10988 = func.call @cc_box_character(%10987) : (i64) -> i64
      func.call @stack_push_pointer(%10988) : (i64) -> ()
      %10989 = func.call @stack_pop_pointer() : () -> i64
      %10990 = arith.constant 27 : i64
      %10991 = func.call @cc_box_character(%10990) : (i64) -> i64
      func.call @stack_push_pointer(%10991) : (i64) -> ()
      %10992 = func.call @stack_pop_pointer() : () -> i64
      %10993 = arith.constant 127 : i64
      %10994 = func.call @cc_box_character(%10993) : (i64) -> i64
      func.call @stack_push_pointer(%10994) : (i64) -> ()
      %10995 = func.call @stack_pop_pointer() : () -> i64
      %10996 = func.call @cc_nil_value() : () -> i64
      %10997 = func.call @cc_errorp(%10974) : (i64) -> i64
      %10998 = arith.cmpi ne, %10997, %10996 : i64
      %10999 = arith.cmpi eq, %10996, %10996 : i64
      %11000 = arith.andi %10998, %10999 : i1
      %11001 = scf.if %11000 -> (i64) {
        scf.yield %10974 : i64
      } else {
        scf.yield %10996 : i64
      }
      %11002 = func.call @cc_errorp(%10977) : (i64) -> i64
      %11003 = arith.cmpi ne, %11002, %10996 : i64
      %11004 = arith.cmpi eq, %11001, %10996 : i64
      %11005 = arith.andi %11003, %11004 : i1
      %11006 = scf.if %11005 -> (i64) {
        scf.yield %10977 : i64
      } else {
        scf.yield %11001 : i64
      }
      %11007 = func.call @cc_errorp(%10980) : (i64) -> i64
      %11008 = arith.cmpi ne, %11007, %10996 : i64
      %11009 = arith.cmpi eq, %11006, %10996 : i64
      %11010 = arith.andi %11008, %11009 : i1
      %11011 = scf.if %11010 -> (i64) {
        scf.yield %10980 : i64
      } else {
        scf.yield %11006 : i64
      }
      %11012 = func.call @cc_errorp(%10983) : (i64) -> i64
      %11013 = arith.cmpi ne, %11012, %10996 : i64
      %11014 = arith.cmpi eq, %11011, %10996 : i64
      %11015 = arith.andi %11013, %11014 : i1
      %11016 = scf.if %11015 -> (i64) {
        scf.yield %10983 : i64
      } else {
        scf.yield %11011 : i64
      }
      %11017 = func.call @cc_errorp(%10986) : (i64) -> i64
      %11018 = arith.cmpi ne, %11017, %10996 : i64
      %11019 = arith.cmpi eq, %11016, %10996 : i64
      %11020 = arith.andi %11018, %11019 : i1
      %11021 = scf.if %11020 -> (i64) {
        scf.yield %10986 : i64
      } else {
        scf.yield %11016 : i64
      }
      %11022 = func.call @cc_errorp(%10989) : (i64) -> i64
      %11023 = arith.cmpi ne, %11022, %10996 : i64
      %11024 = arith.cmpi eq, %11021, %10996 : i64
      %11025 = arith.andi %11023, %11024 : i1
      %11026 = scf.if %11025 -> (i64) {
        scf.yield %10989 : i64
      } else {
        scf.yield %11021 : i64
      }
      %11027 = func.call @cc_errorp(%10992) : (i64) -> i64
      %11028 = arith.cmpi ne, %11027, %10996 : i64
      %11029 = arith.cmpi eq, %11026, %10996 : i64
      %11030 = arith.andi %11028, %11029 : i1
      %11031 = scf.if %11030 -> (i64) {
        scf.yield %10992 : i64
      } else {
        scf.yield %11026 : i64
      }
      %11032 = func.call @cc_errorp(%10995) : (i64) -> i64
      %11033 = arith.cmpi ne, %11032, %10996 : i64
      %11034 = arith.cmpi eq, %11031, %10996 : i64
      %11035 = arith.andi %11033, %11034 : i1
      %11036 = scf.if %11035 -> (i64) {
        scf.yield %10995 : i64
      } else {
        scf.yield %11031 : i64
      }
      %11037 = arith.cmpi ne, %11036, %10996 : i64
      scf.if %11037 {
        func.call @stack_push_pointer(%11036) : (i64) -> ()
      } else {
        %11038 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%11038) : (i64) -> ()
        func.call @stack_push_pointer(%10995) : (i64) -> ()
        %11039 = func.call @stack_pop_pointer() : () -> i64
        %11040 = func.call @stack_pop_pointer() : () -> i64
        %11041 = func.call @cc_cons(%11039, %11040) : (i64, i64) -> i64
        func.call @stack_push_pointer(%11041) : (i64) -> ()
        func.call @stack_push_pointer(%10992) : (i64) -> ()
        %11042 = func.call @stack_pop_pointer() : () -> i64
        %11043 = func.call @stack_pop_pointer() : () -> i64
        %11044 = func.call @cc_cons(%11042, %11043) : (i64, i64) -> i64
        func.call @stack_push_pointer(%11044) : (i64) -> ()
        func.call @stack_push_pointer(%10989) : (i64) -> ()
        %11045 = func.call @stack_pop_pointer() : () -> i64
        %11046 = func.call @stack_pop_pointer() : () -> i64
        %11047 = func.call @cc_cons(%11045, %11046) : (i64, i64) -> i64
        func.call @stack_push_pointer(%11047) : (i64) -> ()
        func.call @stack_push_pointer(%10986) : (i64) -> ()
        %11048 = func.call @stack_pop_pointer() : () -> i64
        %11049 = func.call @stack_pop_pointer() : () -> i64
        %11050 = func.call @cc_cons(%11048, %11049) : (i64, i64) -> i64
        func.call @stack_push_pointer(%11050) : (i64) -> ()
        func.call @stack_push_pointer(%10983) : (i64) -> ()
        %11051 = func.call @stack_pop_pointer() : () -> i64
        %11052 = func.call @stack_pop_pointer() : () -> i64
        %11053 = func.call @cc_cons(%11051, %11052) : (i64, i64) -> i64
        func.call @stack_push_pointer(%11053) : (i64) -> ()
        func.call @stack_push_pointer(%10980) : (i64) -> ()
        %11054 = func.call @stack_pop_pointer() : () -> i64
        %11055 = func.call @stack_pop_pointer() : () -> i64
        %11056 = func.call @cc_cons(%11054, %11055) : (i64, i64) -> i64
        func.call @stack_push_pointer(%11056) : (i64) -> ()
        func.call @stack_push_pointer(%10977) : (i64) -> ()
        %11057 = func.call @stack_pop_pointer() : () -> i64
        %11058 = func.call @stack_pop_pointer() : () -> i64
        %11059 = func.call @cc_cons(%11057, %11058) : (i64, i64) -> i64
        func.call @stack_push_pointer(%11059) : (i64) -> ()
        func.call @stack_push_pointer(%10974) : (i64) -> ()
        %11060 = func.call @stack_pop_pointer() : () -> i64
        %11061 = func.call @stack_pop_pointer() : () -> i64
        %11062 = func.call @cc_cons(%11060, %11061) : (i64, i64) -> i64
        func.call @stack_push_pointer(%11062) : (i64) -> ()
      }
      %11063 = func.call @stack_pop_pointer() : () -> i64
      %11064 = func.call @cc_nil_value() : () -> i64
      %11065 = func.call @cc_cons(%11063, %11064) : (i64, i64) -> i64
      %11066 = func.call @cc_not(%11065) : (i64) -> i64
      func.call @stack_push_pointer(%11066) : (i64) -> ()
      %11067 = func.call @stack_pop_pointer() : () -> i64
      %11068 = func.call @cc_nil_value() : () -> i64
      %11069 = func.call @cc_cons(%11067, %11068) : (i64, i64) -> i64
      %11070 = func.call @cc_not(%11069) : (i64) -> i64
      func.call @stack_push_pointer(%11070) : (i64) -> ()
      %11071 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %11071 : i64
    }
    func.call @stack_push_pointer(%10971) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_209815645192192*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_209815645192192*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_209815645192192*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("TEST-STANDARD-CHAR-P-$\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str6("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str7("STANDARD-CHAR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str8("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str14("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str15("TEST-CHAR-0\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str17("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str19("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str20("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str23("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str24("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str25("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str26("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str29("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str31("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str32("TEST-CHAR-1\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str34("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str36("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str37("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str41("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str44("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str49("TEST-CHAR-2\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str51("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str53("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str54("CHAR<\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("CHAR<\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str57("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str58("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str62("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str63("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str64("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str65("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str66("TEST-CHAR-3\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str68("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str70("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str71("CHAR>\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("CHAR>\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str74("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str75("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str76("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str77("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str79("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str82("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str83("TEST-CHAR-4\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str85("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str87("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str88("CHAR<=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("CHAR<=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str91("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str92("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str93("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str96("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str97("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str98("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str99("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str100("TEST-CHAR-5\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str102("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str104("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str105("CHAR>=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str106("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("CHAR>=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str109("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str110("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str113("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str114("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str115("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str116("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str117("TEST-CHAR-6\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str118("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str119("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str121("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str122("CHAR-LESSP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str123("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str124("CHAR-LESSP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str125("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str126("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str127("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str130("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str131("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str132("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str133("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str134("TEST-CHAR-7\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str136("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str137("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str138("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str139("CHAR-GREATERP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str140("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("CHAR-GREATERP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str142("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str143("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str144("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str147("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str148("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str149("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str150("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str151("TEST-CHAR-8\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str153("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str155("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str156("CHAR-EQUAL\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str157("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str158("CHAR-EQUAL\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str159("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str160("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str161("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str162("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str163("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str164("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str165("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str166("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str167("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str168("TEST-CHAR-9\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str170("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str172("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str173("CHAR-NOT-LESSP\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str174("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("CHAR-NOT-LESSP\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str176("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str178("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str180("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str181("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str182("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str183("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str184("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str185("TEST-CHAR-10\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str186("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str187("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str188("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str189("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str190("CHAR-NOT-GREATERP\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str191("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str192("CHAR-NOT-GREATERP\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str193("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str194("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str195("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str197("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str198("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str199("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str200("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str201("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str202("TEST-CHAR-11\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str203("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str204("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str206("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str207("CHAR-NOT-EQUAL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("CHAR-NOT-EQUAL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str210("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str211("PROGRAM-ERROR\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str212("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str213("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str214("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str215("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str216("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str217("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str218("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str219("TEST-CHAR-0A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str220("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str221("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str223("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str224("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str225("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str226("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str227("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str228("CHAR=\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str229("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str230("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str231("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str232("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str234("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str235("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str236("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str237("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str238("TEST-CHAR-1A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str239("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str240("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str241("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str242("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str243("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str244("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str245("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str246("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str247("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str248("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str249("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str250("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str251("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str252("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str253("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str254("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str255("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str256("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str257("TEST-CHAR-2A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str258("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str259("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str260("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str261("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str262("CHAR<\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str263("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str264("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str265("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str266("CHAR<\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str267("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str268("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str269("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str271("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str272("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str273("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str274("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str275("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str276("TEST-CHAR-3A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str277("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str278("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str280("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str281("CHAR>\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str282("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str283("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str284("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str285("CHAR>\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str286("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str287("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str288("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str290("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str291("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str292("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str293("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str294("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str295("TEST-CHAR-4A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str296("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str297("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str299("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str300("CHAR<=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str301("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str302("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str303("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str304("CHAR<=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str305("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str306("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str307("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str308("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str309("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str310("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str311("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str312("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str313("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str314("TEST-CHAR-5A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str315("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str316("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str317("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str318("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str319("CHAR>=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str320("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str321("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str322("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str323("CHAR>=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str324("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str325("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str326("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str327("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str329("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str330("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str331("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str332("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str333("TEST-CHAR-6A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str334("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str335("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str336("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str337("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str338("CHAR-LESSP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str339("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str340("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str341("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str342("CHAR-LESSP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str343("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str344("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str345("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str346("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str348("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str349("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str350("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str351("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str352("TEST-CHAR-7A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str353("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str354("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str355("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str356("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str357("CHAR-GREATERP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str358("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str359("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str360("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str361("CHAR-GREATERP\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str362("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str363("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str364("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str365("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str366("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str367("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str368("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str369("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str370("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str371("TEST-CHAR-8A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str372("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str373("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str374("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str375("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str376("CHAR-EQUAL\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str377("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str378("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str379("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str380("CHAR-EQUAL\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str381("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str382("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str383("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str384("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str385("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str386("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str387("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str388("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str389("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str390("TEST-CHAR-9A\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str391("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str392("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str393("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str394("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str395("CHAR-NOT-LESSP\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str396("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str397("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str398("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str399("CHAR-NOT-LESSP\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str400("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str401("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str402("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str403("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str404("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str405("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str406("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str407("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str408("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str409("TEST-CHAR-10A\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str410("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str411("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str412("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str413("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str414("CHAR-NOT-GREATERP\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str415("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str416("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str417("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str418("CHAR-NOT-GREATERP\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str419("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str420("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str421("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str422("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str423("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str424("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str425("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str426("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str427("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str428("TEST-CHAR-11A\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str429("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str430("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str431("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str432("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str433("CHAR-NOT-EQUAL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str434("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("MAKE-HASH-TABLE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str436("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str437("CHAR-NOT-EQUAL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str438("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str439("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str440("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str441("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str442("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str443("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str444("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str445("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str446("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str447("TEST-CHAR-12\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str448("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str449("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str450("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str451("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str452("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str453("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str454("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str455("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str456("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str457("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str458("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str459("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str460("TEST-CHAR-12A\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str461("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str462("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str463("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str464("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str465("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str466("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str467("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str468("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str469("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str470("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str471("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str472("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str473("TEST-CHAR-13\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str474("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str475("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str476("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str477("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str478("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str479("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str480("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str481("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str482("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str483("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str484("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str485("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str486("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str487("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str488("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str489("TEST-CHAR-14\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str490("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str491("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str492("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str493("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str494("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str495("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str496("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str497("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str498("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str499("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str500("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str501("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str502("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str503("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str504("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str505("TEST-CHAR-15\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str506("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str507("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str508("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str509("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str510("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str511("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str512("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str513("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str514("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str515("<\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str516("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str517("MIN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str518("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str519("CHAR-CODE-LIMIT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str520("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str521("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str522("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str523("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str524("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str525("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str526("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str527("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str528("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str529("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str530("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str531("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str532("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str533("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str534("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str535("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str536("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str537("CHARACTERP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str538("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str539("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str540("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str541("BOTH-CASE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str542("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str543("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str544("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str545("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str546("GRAPHIC-CHAR-P\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str547("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str548("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str549("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str550("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str551("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str552("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str553("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str554("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str555("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str556("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str557("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str558("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str559("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str560("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str561("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str562("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str563("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str564("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str565("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str566("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str567("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str568("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str569("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str570("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str571("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str572("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str573("CHAR-NAME\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str574("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str575("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str576("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str577("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str578("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str579("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str580("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str581("__LOOP_ANY_ITER__\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str582("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str583("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str584("I\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str585("__LOOP_LAST_NUM_0__\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str586("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str587("*__MLIR_BLOCK_RETFLAG_209815645192223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str588("*__MLIR_BLOCK_RETVALUE_209815645192223*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str589("*__MLIR_BLOCK_RETMVLIST_209815645192223*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str590("MIN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str591("*__MLIR_BLOCK_RETFLAG_209815645192192*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str592("*__MLIR_BLOCK_RETFLAG_209815645192223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str593("BOTH-CASE-P\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str594("GRAPHIC-CHAR-P\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str595("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str596("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str597("UPPER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str598("LOWER-CASE-P\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str599("*__MLIR_BLOCK_RETFLAG_209815645192223*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str600("*__MLIR_BLOCK_RETVALUE_209815645192223*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str601("*__MLIR_BLOCK_RETMVLIST_209815645192223*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str602("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str603("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str604("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str605("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str606("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str607("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str608("TEST-CHAR-16\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str609("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str610("NAMES\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str611("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str612("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str613("NEWLINE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str614("SPACE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str615("RUBOUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str616("PAGE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str617("TAB\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str618("BACKSPACE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str619("RETURN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str620("LINEFEED\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str621("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str622("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str623("NUL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str624("BELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str625("EXCLAMATION_MARK\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str626("QUOTATION_MARK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str627("AMPERSAND\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str628("COMMA\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str629("DIGIT_ZERO\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str630("COLON\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str631("COMMERCIAL_AT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str632("LATIN_CAPITAL_LETTER_A\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str633("LATIN_SMALL_LETTER_X\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str634("LEFT_CURLY_BRACKET\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str635("TILDE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str636("DEL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str637("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str638("U80\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str639("U81\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str640("U82\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str641("U83\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str642("U84\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str643("U85\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str644("U86\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str645("U87\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str646("U88\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str647("U89\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str648("U8A\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str649("U8B\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str650("U8C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str651("U8D\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str652("U8E\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str653("U8F\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str654("U90\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str655("U91\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str656("U92\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str657("U93\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str658("U94\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str659("U95\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str660("U96\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str661("U97\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str662("U98\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str663("U99\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str664("U9A\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str665("U9B\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str666("U9C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str667("U9D\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str668("U9E\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str669("U9F\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str670("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str671("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str672("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str673("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str674("NAMES\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str675("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str676("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str677("NAME-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str678("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str679("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str680("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str681("PUSH\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str682("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str683("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str684("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str685("RESULT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str686("NEWLINE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str687("SPACE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str688("RUBOUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str689("PAGE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str690("TAB\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str691("BACKSPACE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str692("RETURN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str693("LINEFEED\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str694("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str695("NUL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str696("BELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str697("EXCLAMATION_MARK\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str698("QUOTATION_MARK\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str699("AMPERSAND\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str700("COMMA\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str701("DIGIT_ZERO\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str702("COLON\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str703("COMMERCIAL_AT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str704("LATIN_CAPITAL_LETTER_A\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str705("LATIN_SMALL_LETTER_X\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str706("LEFT_CURLY_BRACKET\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str707("TILDE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str708("DEL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str709("U80\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str710("U81\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str711("U82\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str712("U83\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str713("U84\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str714("U85\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str715("U86\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str716("U87\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str717("U88\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str718("U89\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str719("U8A\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str720("U8B\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str721("U8C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str722("U8D\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str723("U8E\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str724("U8F\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str725("U90\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str726("U91\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str727("U92\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str728("U93\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str729("U94\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str730("U95\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str731("U96\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str732("U97\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str733("U98\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str734("U99\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str735("U9A\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str736("U9B\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str737("U9C\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str738("U9D\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str739("U9E\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str740("U9F\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str741("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str742("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str743("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str744("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str745("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str746("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str747("TEST-CHAR-17\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str748("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str749("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str750("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str751("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str752("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str753("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str754("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str755("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str756("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str757("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str758("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str759("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str760("TEST-CHAR-18\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str761("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str762("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str763("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str764("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str765("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str766("CHAR/=\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str767("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str768("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str769("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str770("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str771("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str772("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str773("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str774("TEST-CHAR-19\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str775("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str776("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str777("EQL\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str778("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str779("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str780("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str781("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str782("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str783("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str784("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str785("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str786("TEST-CHAR-C0\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str787("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str788("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str789("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str790("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str791("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str792("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str793("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str794("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str795("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str796("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str797("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str798("TEST-CHAR-STANDARD-NAMES\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str799("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str800("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str801("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str802("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str803("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str804("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str805("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str806("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str807("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str808("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str809("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str810("TEST-CHAR-SEMISTANDARD-NAMES\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str811("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str812("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str813("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str814("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str815("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str816("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str817("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str818("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str819("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str820("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str821("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str822("*__MLIR_BLOCK_RETFLAG_209815645192192*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str823("*__MLIR_BLOCK_RETMVLIST_209815645192192*\00") : !llvm.array<41 x i8>
}
