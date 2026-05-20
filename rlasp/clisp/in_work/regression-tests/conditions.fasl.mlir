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
      %58 = arith.constant 8 : i64
      %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_intern(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = llvm.mlir.addressof @str6 : !llvm.ptr
      %67 = arith.constant 7 : i64
      %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
      %69 = llvm.mlir.addressof @str7 : !llvm.ptr
      %70 = arith.constant 11 : i64
      %71 = func.call @cc_make_string(%69, %70) : (!llvm.ptr, i64) -> i64
      %72 = func.call @cc_intern(%68, %71) : (i64, i64) -> i64
      %73 = func.call @cc_nil_value() : () -> i64
      %74 = func.call @cc_cons(%72, %73) : (i64, i64) -> i64
      %75 = func.call @cc_values_pack(%74) : (i64) -> i64
      func.call @stack_push_pointer(%72) : (i64) -> ()
      %76 = llvm.mlir.addressof @str8 : !llvm.ptr
      %77 = arith.constant 7 : i64
      %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
      %79 = llvm.mlir.addressof @str9 : !llvm.ptr
      %80 = arith.constant 11 : i64
      %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
      %82 = func.call @cc_intern(%78, %81) : (i64, i64) -> i64
      %83 = func.call @cc_nil_value() : () -> i64
      %84 = func.call @cc_cons(%82, %83) : (i64, i64) -> i64
      %85 = func.call @cc_values_pack(%84) : (i64) -> i64
      func.call @stack_push_pointer(%82) : (i64) -> ()
      %86 = llvm.mlir.addressof @str10 : !llvm.ptr
      %87 = arith.constant 8 : i64
      %88 = func.call @cc_make_string(%86, %87) : (!llvm.ptr, i64) -> i64
      %89 = llvm.mlir.addressof @str11 : !llvm.ptr
      %90 = arith.constant 11 : i64
      %91 = func.call @cc_make_string(%89, %90) : (!llvm.ptr, i64) -> i64
      %92 = func.call @cc_intern(%88, %91) : (i64, i64) -> i64
      %93 = func.call @cc_nil_value() : () -> i64
      %94 = func.call @cc_cons(%92, %93) : (i64, i64) -> i64
      %95 = func.call @cc_values_pack(%94) : (i64) -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      %96 = llvm.mlir.addressof @str12 : !llvm.ptr
      %97 = arith.constant 6 : i64
      %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
      %99 = llvm.mlir.addressof @str13 : !llvm.ptr
      %100 = arith.constant 11 : i64
      %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
      %102 = func.call @cc_intern(%98, %101) : (i64, i64) -> i64
      %103 = func.call @cc_nil_value() : () -> i64
      %104 = func.call @cc_cons(%102, %103) : (i64, i64) -> i64
      %105 = func.call @cc_values_pack(%104) : (i64) -> i64
      func.call @stack_push_pointer(%102) : (i64) -> ()
      %106 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%106) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %107 = func.call @stack_pop_pointer() : () -> i64
      %108 = func.call @stack_pop_pointer() : () -> i64
      %109 = func.call @cc_cons(%108, %107) : (i64, i64) -> i64
      func.call @stack_push_pointer(%109) : (i64) -> ()
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @stack_pop_pointer() : () -> i64
      %112 = func.call @cc_cons(%111, %110) : (i64, i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %113 = func.call @stack_pop_pointer() : () -> i64
      %114 = func.call @stack_pop_pointer() : () -> i64
      %115 = func.call @cc_cons(%114, %113) : (i64, i64) -> i64
      func.call @stack_push_pointer(%115) : (i64) -> ()
      %116 = func.call @stack_pop_pointer() : () -> i64
      %117 = func.call @stack_pop_pointer() : () -> i64
      %118 = func.call @cc_cons(%117, %116) : (i64, i64) -> i64
      func.call @stack_push_pointer(%118) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %119 = func.call @stack_pop_pointer() : () -> i64
      %120 = func.call @stack_pop_pointer() : () -> i64
      %121 = func.call @cc_cons(%120, %119) : (i64, i64) -> i64
      func.call @stack_push_pointer(%121) : (i64) -> ()
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @stack_pop_pointer() : () -> i64
      %124 = func.call @cc_cons(%123, %122) : (i64, i64) -> i64
      func.call @stack_push_pointer(%124) : (i64) -> ()
      %125 = llvm.mlir.addressof @str14 : !llvm.ptr
      %126 = arith.constant 12 : i64
      %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
      %128 = llvm.mlir.addressof @str15 : !llvm.ptr
      %129 = arith.constant 11 : i64
      %130 = func.call @cc_make_string(%128, %129) : (!llvm.ptr, i64) -> i64
      %131 = func.call @cc_intern(%127, %130) : (i64, i64) -> i64
      %132 = func.call @cc_nil_value() : () -> i64
      %133 = func.call @cc_cons(%131, %132) : (i64, i64) -> i64
      %134 = func.call @cc_values_pack(%133) : (i64) -> i64
      func.call @stack_push_pointer(%131) : (i64) -> ()
      %135 = llvm.mlir.addressof @str16 : !llvm.ptr
      %136 = arith.constant 12 : i64
      %137 = func.call @cc_make_string(%135, %136) : (!llvm.ptr, i64) -> i64
      %138 = llvm.mlir.addressof @str17 : !llvm.ptr
      %139 = arith.constant 11 : i64
      %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
      %141 = func.call @cc_intern(%137, %140) : (i64, i64) -> i64
      %142 = func.call @cc_nil_value() : () -> i64
      %143 = func.call @cc_cons(%141, %142) : (i64, i64) -> i64
      %144 = func.call @cc_values_pack(%143) : (i64) -> i64
      func.call @stack_push_pointer(%141) : (i64) -> ()
      %145 = llvm.mlir.addressof @str18 : !llvm.ptr
      %146 = arith.constant 8 : i64
      %147 = func.call @cc_make_string(%145, %146) : (!llvm.ptr, i64) -> i64
      %148 = llvm.mlir.addressof @str19 : !llvm.ptr
      %149 = arith.constant 11 : i64
      %150 = func.call @cc_make_string(%148, %149) : (!llvm.ptr, i64) -> i64
      %151 = func.call @cc_intern(%147, %150) : (i64, i64) -> i64
      %152 = func.call @cc_nil_value() : () -> i64
      %153 = func.call @cc_cons(%151, %152) : (i64, i64) -> i64
      %154 = func.call @cc_values_pack(%153) : (i64) -> i64
      func.call @stack_push_pointer(%151) : (i64) -> ()
      %155 = llvm.mlir.addressof @str20 : !llvm.ptr
      %156 = arith.constant 8 : i64
      %157 = func.call @cc_make_string(%155, %156) : (!llvm.ptr, i64) -> i64
      %158 = llvm.mlir.addressof @str21 : !llvm.ptr
      %159 = arith.constant 11 : i64
      %160 = func.call @cc_make_string(%158, %159) : (!llvm.ptr, i64) -> i64
      %161 = func.call @cc_intern(%157, %160) : (i64, i64) -> i64
      %162 = func.call @cc_nil_value() : () -> i64
      %163 = func.call @cc_cons(%161, %162) : (i64, i64) -> i64
      %164 = func.call @cc_values_pack(%163) : (i64) -> i64
      func.call @stack_push_pointer(%161) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @stack_pop_pointer() : () -> i64
      %167 = func.call @cc_cons(%166, %165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%167) : (i64) -> ()
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @stack_pop_pointer() : () -> i64
      %170 = func.call @cc_cons(%169, %168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%170) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @stack_pop_pointer() : () -> i64
      %173 = func.call @cc_cons(%172, %171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%173) : (i64) -> ()
      %174 = func.call @stack_pop_pointer() : () -> i64
      %175 = func.call @stack_pop_pointer() : () -> i64
      %176 = func.call @cc_cons(%175, %174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%176) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %177 = func.call @stack_pop_pointer() : () -> i64
      %178 = func.call @stack_pop_pointer() : () -> i64
      %179 = func.call @cc_cons(%178, %177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%179) : (i64) -> ()
      %180 = llvm.mlir.addressof @str22 : !llvm.ptr
      %181 = arith.constant 5 : i64
      %182 = func.call @cc_make_string(%180, %181) : (!llvm.ptr, i64) -> i64
      %183 = func.call @cc_nil_value() : () -> i64
      %184 = func.call @cc_intern(%182, %183) : (i64, i64) -> i64
      %185 = func.call @cc_nil_value() : () -> i64
      %186 = func.call @cc_cons(%184, %185) : (i64, i64) -> i64
      %187 = func.call @cc_values_pack(%186) : (i64) -> i64
      func.call @stack_push_pointer(%184) : (i64) -> ()
      %188 = llvm.mlir.addressof @str23 : !llvm.ptr
      %189 = arith.constant 6 : i64
      %190 = func.call @cc_make_string(%188, %189) : (!llvm.ptr, i64) -> i64
      %191 = llvm.mlir.addressof @str24 : !llvm.ptr
      %192 = arith.constant 11 : i64
      %193 = func.call @cc_make_string(%191, %192) : (!llvm.ptr, i64) -> i64
      %194 = func.call @cc_intern(%190, %193) : (i64, i64) -> i64
      %195 = func.call @cc_nil_value() : () -> i64
      %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
      %197 = func.call @cc_values_pack(%196) : (i64) -> i64
      func.call @stack_push_pointer(%194) : (i64) -> ()
      %198 = llvm.mlir.addressof @str25 : !llvm.ptr
      %199 = arith.constant 4 : i64
      %200 = func.call @cc_make_string(%198, %199) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%200) : (i64) -> ()
      %201 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%201) : (i64) -> ()
      %202 = llvm.mlir.addressof @str26 : !llvm.ptr
      %203 = arith.constant 12 : i64
      %204 = func.call @cc_make_string(%202, %203) : (!llvm.ptr, i64) -> i64
      %205 = llvm.mlir.addressof @str27 : !llvm.ptr
      %206 = arith.constant 11 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = func.call @cc_intern(%204, %207) : (i64, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_values_pack(%210) : (i64) -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%212, %213) : (i64, i64) -> i64
      %215 = llvm.mlir.addressof @str28 : !llvm.ptr
      %216 = arith.constant 5 : i64
      %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_intern(%217, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      %223 = func.call @cc_cons(%219, %214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %224 = func.call @stack_pop_pointer() : () -> i64
      %225 = func.call @stack_pop_pointer() : () -> i64
      %226 = func.call @cc_cons(%225, %224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%226) : (i64) -> ()
      %227 = func.call @stack_pop_pointer() : () -> i64
      %228 = func.call @stack_pop_pointer() : () -> i64
      %229 = func.call @cc_cons(%228, %227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%229) : (i64) -> ()
      %230 = func.call @stack_pop_pointer() : () -> i64
      %231 = func.call @stack_pop_pointer() : () -> i64
      %232 = func.call @cc_cons(%231, %230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%232) : (i64) -> ()
      %233 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%233) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %234 = func.call @stack_pop_pointer() : () -> i64
      %235 = func.call @stack_pop_pointer() : () -> i64
      %236 = func.call @cc_cons(%235, %234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%236) : (i64) -> ()
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @stack_pop_pointer() : () -> i64
      %239 = func.call @cc_cons(%238, %237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %240 = func.call @stack_pop_pointer() : () -> i64
      %241 = func.call @stack_pop_pointer() : () -> i64
      %242 = func.call @cc_cons(%241, %240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%242) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %243 = func.call @stack_pop_pointer() : () -> i64
      %244 = func.call @stack_pop_pointer() : () -> i64
      %245 = func.call @cc_cons(%244, %243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%245) : (i64) -> ()
      %246 = func.call @stack_pop_pointer() : () -> i64
      %247 = func.call @stack_pop_pointer() : () -> i64
      %248 = func.call @cc_cons(%247, %246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%248) : (i64) -> ()
      %249 = func.call @stack_pop_pointer() : () -> i64
      %250 = func.call @stack_pop_pointer() : () -> i64
      %251 = func.call @cc_cons(%250, %249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%251) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %252 = func.call @stack_pop_pointer() : () -> i64
      %253 = func.call @stack_pop_pointer() : () -> i64
      %254 = func.call @cc_cons(%253, %252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%254) : (i64) -> ()
      %255 = func.call @stack_pop_pointer() : () -> i64
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @cc_cons(%256, %255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%257) : (i64) -> ()
      %258 = func.call @stack_pop_pointer() : () -> i64
      %259 = func.call @stack_pop_pointer() : () -> i64
      %260 = func.call @cc_cons(%259, %258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%260) : (i64) -> ()
      %261 = func.call @stack_pop_pointer() : () -> i64
      %346 = arith.constant 105993685958657 : i64
      %347 = arith.constant 0 : i64
      %348 = func.call @cc_make_closure(%346, %347) : (i64, i64) -> i64
      func.call @stack_push_pointer(%348) : (i64) -> ()
      %349 = func.call @stack_pop_pointer() : () -> i64
      %350 = arith.constant 10 : i64
      func.call @stack_push_fixnum(%350) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %351 = func.call @stack_pop_pointer() : () -> i64
      %352 = func.call @stack_pop_pointer() : () -> i64
      %353 = func.call @cc_cons(%352, %351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%353) : (i64) -> ()
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = llvm.mlir.addressof @str36 : !llvm.ptr
      %356 = arith.constant 11 : i64
      %357 = func.call @cc_make_string(%355, %356) : (!llvm.ptr, i64) -> i64
      %358 = llvm.mlir.addressof @str37 : !llvm.ptr
      %359 = arith.constant 7 : i64
      %360 = func.call @cc_make_string(%358, %359) : (!llvm.ptr, i64) -> i64
      %361 = func.call @cc_intern(%357, %360) : (i64, i64) -> i64
      %362 = func.call @cc_nil_value() : () -> i64
      %363 = func.call @cc_cons(%361, %362) : (i64, i64) -> i64
      %364 = func.call @cc_values_pack(%363) : (i64) -> i64
      func.call @stack_push_pointer(%361) : (i64) -> ()
      %365 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = llvm.mlir.addressof @str38 : !llvm.ptr
      %368 = arith.constant 4 : i64
      %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
      %370 = llvm.mlir.addressof @str39 : !llvm.ptr
      %371 = arith.constant 7 : i64
      %372 = func.call @cc_make_string(%370, %371) : (!llvm.ptr, i64) -> i64
      %373 = func.call @cc_intern(%369, %372) : (i64, i64) -> i64
      %374 = func.call @cc_nil_value() : () -> i64
      %375 = func.call @cc_cons(%373, %374) : (i64, i64) -> i64
      %376 = func.call @cc_values_pack(%375) : (i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %377 = func.call @stack_pop_pointer() : () -> i64
      %378 = llvm.mlir.addressof @str40 : !llvm.ptr
      %379 = arith.constant 6 : i64
      %380 = func.call @cc_make_string(%378, %379) : (!llvm.ptr, i64) -> i64
      %381 = func.call @cc_nil_value() : () -> i64
      %382 = func.call @cc_intern(%380, %381) : (i64, i64) -> i64
      %383 = func.call @cc_nil_value() : () -> i64
      %384 = func.call @cc_cons(%382, %383) : (i64, i64) -> i64
      %385 = func.call @cc_values_pack(%384) : (i64) -> i64
      func.call @stack_push_pointer(%382) : (i64) -> ()
      %386 = func.call @stack_pop_pointer() : () -> i64
      %387 = func.call @cc_nil_value() : () -> i64
      %388 = func.call @cc_errorp(%65) : (i64) -> i64
      %389 = arith.cmpi ne, %388, %387 : i64
      %390 = arith.cmpi eq, %387, %387 : i64
      %391 = arith.andi %389, %390 : i1
      %392 = scf.if %391 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %387 : i64
      }
      %393 = func.call @cc_errorp(%261) : (i64) -> i64
      %394 = arith.cmpi ne, %393, %387 : i64
      %395 = arith.cmpi eq, %392, %387 : i64
      %396 = arith.andi %394, %395 : i1
      %397 = scf.if %396 -> (i64) {
        scf.yield %261 : i64
      } else {
        scf.yield %392 : i64
      }
      %398 = func.call @cc_errorp(%349) : (i64) -> i64
      %399 = arith.cmpi ne, %398, %387 : i64
      %400 = arith.cmpi eq, %397, %387 : i64
      %401 = arith.andi %399, %400 : i1
      %402 = scf.if %401 -> (i64) {
        scf.yield %349 : i64
      } else {
        scf.yield %397 : i64
      }
      %403 = func.call @cc_errorp(%354) : (i64) -> i64
      %404 = arith.cmpi ne, %403, %387 : i64
      %405 = arith.cmpi eq, %402, %387 : i64
      %406 = arith.andi %404, %405 : i1
      %407 = scf.if %406 -> (i64) {
        scf.yield %354 : i64
      } else {
        scf.yield %402 : i64
      }
      %408 = func.call @cc_errorp(%365) : (i64) -> i64
      %409 = arith.cmpi ne, %408, %387 : i64
      %410 = arith.cmpi eq, %407, %387 : i64
      %411 = arith.andi %409, %410 : i1
      %412 = scf.if %411 -> (i64) {
        scf.yield %365 : i64
      } else {
        scf.yield %407 : i64
      }
      %413 = func.call @cc_errorp(%366) : (i64) -> i64
      %414 = arith.cmpi ne, %413, %387 : i64
      %415 = arith.cmpi eq, %412, %387 : i64
      %416 = arith.andi %414, %415 : i1
      %417 = scf.if %416 -> (i64) {
        scf.yield %366 : i64
      } else {
        scf.yield %412 : i64
      }
      %418 = func.call @cc_errorp(%377) : (i64) -> i64
      %419 = arith.cmpi ne, %418, %387 : i64
      %420 = arith.cmpi eq, %417, %387 : i64
      %421 = arith.andi %419, %420 : i1
      %422 = scf.if %421 -> (i64) {
        scf.yield %377 : i64
      } else {
        scf.yield %417 : i64
      }
      %423 = func.call @cc_errorp(%386) : (i64) -> i64
      %424 = arith.cmpi ne, %423, %387 : i64
      %425 = arith.cmpi eq, %422, %387 : i64
      %426 = arith.andi %424, %425 : i1
      %427 = scf.if %426 -> (i64) {
        scf.yield %386 : i64
      } else {
        scf.yield %422 : i64
      }
      %428 = arith.cmpi ne, %427, %387 : i64
      scf.if %428 {
        func.call @stack_push_pointer(%427) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%261) : (i64) -> ()
        func.call @stack_push_pointer(%349) : (i64) -> ()
        func.call @stack_push_pointer(%354) : (i64) -> ()
        func.call @stack_push_pointer(%365) : (i64) -> ()
        func.call @stack_push_pointer(%366) : (i64) -> ()
        func.call @stack_push_pointer(%377) : (i64) -> ()
        func.call @stack_push_pointer(%386) : (i64) -> ()
        %429 = llvm.mlir.addressof @str41 : !llvm.ptr
        %430 = func.call @cc_make_function_ref_const(%429) : (!llvm.ptr) -> i64
        %431 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%430, %431) : (i64, i64) -> ()
      }
      %432 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %432 : i64
    }
    %433 = func.call @cc_nil_value() : () -> i64
    %434 = func.call @cc_errorp(%56) : (i64) -> i64
    %435 = arith.cmpi ne, %434, %433 : i64
    %436 = scf.if %435 -> (i64) {
      scf.yield %56 : i64
    } else {
      %437 = llvm.mlir.addressof @str42 : !llvm.ptr
      %438 = arith.constant 22 : i64
      %439 = func.call @cc_make_string(%437, %438) : (!llvm.ptr, i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = func.call @cc_intern(%439, %440) : (i64, i64) -> i64
      %442 = func.call @cc_nil_value() : () -> i64
      %443 = func.call @cc_cons(%441, %442) : (i64, i64) -> i64
      %444 = func.call @cc_values_pack(%443) : (i64) -> i64
      func.call @stack_push_pointer(%441) : (i64) -> ()
      %445 = func.call @stack_pop_pointer() : () -> i64
      %446 = llvm.mlir.addressof @str43 : !llvm.ptr
      %447 = arith.constant 13 : i64
      %448 = func.call @cc_make_string(%446, %447) : (!llvm.ptr, i64) -> i64
      %449 = llvm.mlir.addressof @str44 : !llvm.ptr
      %450 = arith.constant 11 : i64
      %451 = func.call @cc_make_string(%449, %450) : (!llvm.ptr, i64) -> i64
      %452 = func.call @cc_intern(%448, %451) : (i64, i64) -> i64
      %453 = func.call @cc_nil_value() : () -> i64
      %454 = func.call @cc_cons(%452, %453) : (i64, i64) -> i64
      %455 = func.call @cc_values_pack(%454) : (i64) -> i64
      func.call @stack_push_pointer(%452) : (i64) -> ()
      %456 = llvm.mlir.addressof @str45 : !llvm.ptr
      %457 = arith.constant 6 : i64
      %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
      %459 = func.call @cc_nil_value() : () -> i64
      %460 = func.call @cc_intern(%458, %459) : (i64, i64) -> i64
      %461 = func.call @cc_nil_value() : () -> i64
      %462 = func.call @cc_cons(%460, %461) : (i64, i64) -> i64
      %463 = func.call @cc_values_pack(%462) : (i64) -> i64
      func.call @stack_push_pointer(%460) : (i64) -> ()
      %464 = llvm.mlir.addressof @str46 : !llvm.ptr
      %465 = arith.constant 19 : i64
      %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
      %467 = func.call @cc_nil_value() : () -> i64
      %468 = func.call @cc_intern(%466, %467) : (i64, i64) -> i64
      %469 = func.call @cc_nil_value() : () -> i64
      %470 = func.call @cc_cons(%468, %469) : (i64, i64) -> i64
      %471 = func.call @cc_values_pack(%470) : (i64) -> i64
      func.call @stack_push_pointer(%468) : (i64) -> ()
      %472 = llvm.mlir.addressof @str47 : !llvm.ptr
      %473 = arith.constant 19 : i64
      %474 = func.call @cc_make_string(%472, %473) : (!llvm.ptr, i64) -> i64
      %475 = llvm.mlir.addressof @str48 : !llvm.ptr
      %476 = arith.constant 11 : i64
      %477 = func.call @cc_make_string(%475, %476) : (!llvm.ptr, i64) -> i64
      %478 = func.call @cc_intern(%474, %477) : (i64, i64) -> i64
      %479 = func.call @cc_nil_value() : () -> i64
      %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
      %481 = func.call @cc_values_pack(%480) : (i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      %482 = llvm.mlir.addressof @str49 : !llvm.ptr
      %483 = arith.constant 14 : i64
      %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
      %485 = llvm.mlir.addressof @str50 : !llvm.ptr
      %486 = arith.constant 11 : i64
      %487 = func.call @cc_make_string(%485, %486) : (!llvm.ptr, i64) -> i64
      %488 = func.call @cc_intern(%484, %487) : (i64, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_values_pack(%490) : (i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      %492 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%492) : (i64) -> ()
      %493 = llvm.mlir.addressof @str51 : !llvm.ptr
      %494 = arith.constant 10 : i64
      %495 = func.call @cc_make_string(%493, %494) : (!llvm.ptr, i64) -> i64
      %496 = llvm.mlir.addressof @str52 : !llvm.ptr
      %497 = arith.constant 11 : i64
      %498 = func.call @cc_make_string(%496, %497) : (!llvm.ptr, i64) -> i64
      %499 = func.call @cc_intern(%495, %498) : (i64, i64) -> i64
      %500 = func.call @cc_nil_value() : () -> i64
      %501 = func.call @cc_cons(%499, %500) : (i64, i64) -> i64
      %502 = func.call @cc_values_pack(%501) : (i64) -> i64
      func.call @stack_push_pointer(%499) : (i64) -> ()
      %503 = func.call @stack_pop_pointer() : () -> i64
      %504 = func.call @stack_pop_pointer() : () -> i64
      %505 = func.call @cc_cons(%503, %504) : (i64, i64) -> i64
      %506 = llvm.mlir.addressof @str53 : !llvm.ptr
      %507 = arith.constant 5 : i64
      %508 = func.call @cc_make_string(%506, %507) : (!llvm.ptr, i64) -> i64
      %509 = func.call @cc_nil_value() : () -> i64
      %510 = func.call @cc_intern(%508, %509) : (i64, i64) -> i64
      %511 = func.call @cc_nil_value() : () -> i64
      %512 = func.call @cc_cons(%510, %511) : (i64, i64) -> i64
      %513 = func.call @cc_values_pack(%512) : (i64) -> i64
      %514 = func.call @cc_cons(%510, %505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %515 = func.call @stack_pop_pointer() : () -> i64
      %516 = func.call @stack_pop_pointer() : () -> i64
      %517 = func.call @cc_cons(%516, %515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%517) : (i64) -> ()
      %518 = func.call @stack_pop_pointer() : () -> i64
      %519 = func.call @stack_pop_pointer() : () -> i64
      %520 = func.call @cc_cons(%519, %518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%520) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %521 = func.call @stack_pop_pointer() : () -> i64
      %522 = func.call @stack_pop_pointer() : () -> i64
      %523 = func.call @cc_cons(%522, %521) : (i64, i64) -> i64
      func.call @stack_push_pointer(%523) : (i64) -> ()
      %524 = func.call @stack_pop_pointer() : () -> i64
      %525 = func.call @stack_pop_pointer() : () -> i64
      %526 = func.call @cc_cons(%525, %524) : (i64, i64) -> i64
      func.call @stack_push_pointer(%526) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %527 = func.call @stack_pop_pointer() : () -> i64
      %528 = func.call @stack_pop_pointer() : () -> i64
      %529 = func.call @cc_cons(%528, %527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%529) : (i64) -> ()
      %530 = func.call @stack_pop_pointer() : () -> i64
      %531 = func.call @stack_pop_pointer() : () -> i64
      %532 = func.call @cc_cons(%531, %530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%532) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %533 = func.call @stack_pop_pointer() : () -> i64
      %534 = func.call @stack_pop_pointer() : () -> i64
      %535 = func.call @cc_cons(%534, %533) : (i64, i64) -> i64
      func.call @stack_push_pointer(%535) : (i64) -> ()
      %536 = func.call @stack_pop_pointer() : () -> i64
      %537 = func.call @stack_pop_pointer() : () -> i64
      %538 = func.call @cc_cons(%537, %536) : (i64, i64) -> i64
      func.call @stack_push_pointer(%538) : (i64) -> ()
      %539 = func.call @stack_pop_pointer() : () -> i64
      %540 = func.call @stack_pop_pointer() : () -> i64
      %541 = func.call @cc_cons(%540, %539) : (i64, i64) -> i64
      func.call @stack_push_pointer(%541) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %542 = func.call @stack_pop_pointer() : () -> i64
      %543 = func.call @stack_pop_pointer() : () -> i64
      %544 = func.call @cc_cons(%543, %542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%544) : (i64) -> ()
      %545 = func.call @stack_pop_pointer() : () -> i64
      %546 = func.call @stack_pop_pointer() : () -> i64
      %547 = func.call @cc_cons(%546, %545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%547) : (i64) -> ()
      %548 = func.call @stack_pop_pointer() : () -> i64
      %623 = arith.constant 105993685958658 : i64
      %624 = arith.constant 0 : i64
      %625 = func.call @cc_make_closure(%623, %624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%625) : (i64) -> ()
      %626 = func.call @stack_pop_pointer() : () -> i64
      %627 = llvm.mlir.addressof @str58 : !llvm.ptr
      %628 = arith.constant 4 : i64
      %629 = func.call @cc_make_string(%627, %628) : (!llvm.ptr, i64) -> i64
      %630 = func.call @cc_nil_value() : () -> i64
      %631 = func.call @cc_intern(%629, %630) : (i64, i64) -> i64
      %632 = func.call @cc_nil_value() : () -> i64
      %633 = func.call @cc_cons(%631, %632) : (i64, i64) -> i64
      %634 = func.call @cc_values_pack(%633) : (i64) -> i64
      func.call @stack_push_pointer(%631) : (i64) -> ()
      %635 = llvm.mlir.addressof @str59 : !llvm.ptr
      %636 = arith.constant 12 : i64
      %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
      %638 = llvm.mlir.addressof @str60 : !llvm.ptr
      %639 = arith.constant 11 : i64
      %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
      %641 = func.call @cc_intern(%637, %640) : (i64, i64) -> i64
      %642 = func.call @cc_nil_value() : () -> i64
      %643 = func.call @cc_cons(%641, %642) : (i64, i64) -> i64
      %644 = func.call @cc_values_pack(%643) : (i64) -> i64
      func.call @stack_push_pointer(%641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %645 = func.call @stack_pop_pointer() : () -> i64
      %646 = func.call @stack_pop_pointer() : () -> i64
      %647 = func.call @cc_cons(%646, %645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%647) : (i64) -> ()
      %648 = func.call @stack_pop_pointer() : () -> i64
      %649 = func.call @stack_pop_pointer() : () -> i64
      %650 = func.call @cc_cons(%649, %648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%650) : (i64) -> ()
      %651 = func.call @stack_pop_pointer() : () -> i64
      %652 = llvm.mlir.addressof @str61 : !llvm.ptr
      %653 = arith.constant 11 : i64
      %654 = func.call @cc_make_string(%652, %653) : (!llvm.ptr, i64) -> i64
      %655 = llvm.mlir.addressof @str62 : !llvm.ptr
      %656 = arith.constant 7 : i64
      %657 = func.call @cc_make_string(%655, %656) : (!llvm.ptr, i64) -> i64
      %658 = func.call @cc_intern(%654, %657) : (i64, i64) -> i64
      %659 = func.call @cc_nil_value() : () -> i64
      %660 = func.call @cc_cons(%658, %659) : (i64, i64) -> i64
      %661 = func.call @cc_values_pack(%660) : (i64) -> i64
      func.call @stack_push_pointer(%658) : (i64) -> ()
      %662 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %663 = func.call @stack_pop_pointer() : () -> i64
      %664 = llvm.mlir.addressof @str63 : !llvm.ptr
      %665 = arith.constant 4 : i64
      %666 = func.call @cc_make_string(%664, %665) : (!llvm.ptr, i64) -> i64
      %667 = llvm.mlir.addressof @str64 : !llvm.ptr
      %668 = arith.constant 7 : i64
      %669 = func.call @cc_make_string(%667, %668) : (!llvm.ptr, i64) -> i64
      %670 = func.call @cc_intern(%666, %669) : (i64, i64) -> i64
      %671 = func.call @cc_nil_value() : () -> i64
      %672 = func.call @cc_cons(%670, %671) : (i64, i64) -> i64
      %673 = func.call @cc_values_pack(%672) : (i64) -> i64
      func.call @stack_push_pointer(%670) : (i64) -> ()
      %674 = func.call @stack_pop_pointer() : () -> i64
      %675 = llvm.mlir.addressof @str65 : !llvm.ptr
      %676 = arith.constant 5 : i64
      %677 = func.call @cc_make_string(%675, %676) : (!llvm.ptr, i64) -> i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = func.call @cc_intern(%677, %678) : (i64, i64) -> i64
      %680 = func.call @cc_nil_value() : () -> i64
      %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
      %682 = func.call @cc_values_pack(%681) : (i64) -> i64
      func.call @stack_push_pointer(%679) : (i64) -> ()
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @cc_nil_value() : () -> i64
      %685 = func.call @cc_errorp(%445) : (i64) -> i64
      %686 = arith.cmpi ne, %685, %684 : i64
      %687 = arith.cmpi eq, %684, %684 : i64
      %688 = arith.andi %686, %687 : i1
      %689 = scf.if %688 -> (i64) {
        scf.yield %445 : i64
      } else {
        scf.yield %684 : i64
      }
      %690 = func.call @cc_errorp(%548) : (i64) -> i64
      %691 = arith.cmpi ne, %690, %684 : i64
      %692 = arith.cmpi eq, %689, %684 : i64
      %693 = arith.andi %691, %692 : i1
      %694 = scf.if %693 -> (i64) {
        scf.yield %548 : i64
      } else {
        scf.yield %689 : i64
      }
      %695 = func.call @cc_errorp(%626) : (i64) -> i64
      %696 = arith.cmpi ne, %695, %684 : i64
      %697 = arith.cmpi eq, %694, %684 : i64
      %698 = arith.andi %696, %697 : i1
      %699 = scf.if %698 -> (i64) {
        scf.yield %626 : i64
      } else {
        scf.yield %694 : i64
      }
      %700 = func.call @cc_errorp(%651) : (i64) -> i64
      %701 = arith.cmpi ne, %700, %684 : i64
      %702 = arith.cmpi eq, %699, %684 : i64
      %703 = arith.andi %701, %702 : i1
      %704 = scf.if %703 -> (i64) {
        scf.yield %651 : i64
      } else {
        scf.yield %699 : i64
      }
      %705 = func.call @cc_errorp(%662) : (i64) -> i64
      %706 = arith.cmpi ne, %705, %684 : i64
      %707 = arith.cmpi eq, %704, %684 : i64
      %708 = arith.andi %706, %707 : i1
      %709 = scf.if %708 -> (i64) {
        scf.yield %662 : i64
      } else {
        scf.yield %704 : i64
      }
      %710 = func.call @cc_errorp(%663) : (i64) -> i64
      %711 = arith.cmpi ne, %710, %684 : i64
      %712 = arith.cmpi eq, %709, %684 : i64
      %713 = arith.andi %711, %712 : i1
      %714 = scf.if %713 -> (i64) {
        scf.yield %663 : i64
      } else {
        scf.yield %709 : i64
      }
      %715 = func.call @cc_errorp(%674) : (i64) -> i64
      %716 = arith.cmpi ne, %715, %684 : i64
      %717 = arith.cmpi eq, %714, %684 : i64
      %718 = arith.andi %716, %717 : i1
      %719 = scf.if %718 -> (i64) {
        scf.yield %674 : i64
      } else {
        scf.yield %714 : i64
      }
      %720 = func.call @cc_errorp(%683) : (i64) -> i64
      %721 = arith.cmpi ne, %720, %684 : i64
      %722 = arith.cmpi eq, %719, %684 : i64
      %723 = arith.andi %721, %722 : i1
      %724 = scf.if %723 -> (i64) {
        scf.yield %683 : i64
      } else {
        scf.yield %719 : i64
      }
      %725 = arith.cmpi ne, %724, %684 : i64
      scf.if %725 {
        func.call @stack_push_pointer(%724) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%445) : (i64) -> ()
        func.call @stack_push_pointer(%548) : (i64) -> ()
        func.call @stack_push_pointer(%626) : (i64) -> ()
        func.call @stack_push_pointer(%651) : (i64) -> ()
        func.call @stack_push_pointer(%662) : (i64) -> ()
        func.call @stack_push_pointer(%663) : (i64) -> ()
        func.call @stack_push_pointer(%674) : (i64) -> ()
        func.call @stack_push_pointer(%683) : (i64) -> ()
        %726 = llvm.mlir.addressof @str66 : !llvm.ptr
        %727 = func.call @cc_make_function_ref_const(%726) : (!llvm.ptr) -> i64
        %728 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%727, %728) : (i64, i64) -> ()
      }
      %729 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %729 : i64
    }
    func.call @stack_push_pointer(%436) : (i64) -> ()
    %730 = func.call @stack_pop_pointer() : () -> i64
    %731 = func.call @cc_multiple_value_list(%730) : (i64) -> i64
    %732 = llvm.mlir.addressof @str67 : !llvm.ptr
    %733 = arith.constant 38 : i64
    %734 = func.call @cc_make_string(%732, %733) : (!llvm.ptr, i64) -> i64
    %735 = func.call @cc_nil_value() : () -> i64
    %736 = func.call @cc_intern(%734, %735) : (i64, i64) -> i64
    %737 = func.call @cc_nil_value() : () -> i64
    %738 = func.call @cc_cons(%736, %737) : (i64, i64) -> i64
    %739 = func.call @cc_values_pack(%738) : (i64) -> i64
    %740 = func.call @cc_symbol_value(%736) : (i64) -> i64
    %741 = llvm.mlir.addressof @str68 : !llvm.ptr
    %742 = arith.constant 40 : i64
    %743 = func.call @cc_make_string(%741, %742) : (!llvm.ptr, i64) -> i64
    %744 = func.call @cc_nil_value() : () -> i64
    %745 = func.call @cc_intern(%743, %744) : (i64, i64) -> i64
    %746 = func.call @cc_nil_value() : () -> i64
    %747 = func.call @cc_cons(%745, %746) : (i64, i64) -> i64
    %748 = func.call @cc_values_pack(%747) : (i64) -> i64
    %749 = func.call @cc_symbol_value(%745) : (i64) -> i64
    %750 = func.call @cc_nil_value() : () -> i64
    %751 = arith.cmpi ne, %740, %750 : i64
    %752 = scf.if %751 -> (i64) {
      scf.yield %749 : i64
    } else {
      scf.yield %731 : i64
    }
    %753 = func.call @cc_values_pack(%752) : (i64) -> i64
    func.call @stack_push_pointer(%753) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_105993685958657"() {
    %262 = func.call @cc_nil_value() : () -> i64
    %263 = func.call @cc_nil_value() : () -> i64
    %264 = func.call @cc_errorp(%262) : (i64) -> i64
    %265 = arith.cmpi ne, %264, %263 : i64
    %266 = scf.if %265 -> (i64) {
      scf.yield %262 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %267 = func.call @stack_pop_pointer() : () -> i64
      %268 = func.call @cc_nil_value() : () -> i64
      %269 = func.call @cc_errorp(%267) : (i64) -> i64
      %270 = arith.cmpi ne, %269, %268 : i64
      %271 = scf.if %270 -> (i64) {
        scf.yield %267 : i64
      } else {
        %272 = func.call @cc_nil_value() : () -> i64
        %273 = llvm.mlir.addressof @str29 : !llvm.ptr
        %274 = arith.constant 12 : i64
        %275 = func.call @cc_make_string(%273, %274) : (!llvm.ptr, i64) -> i64
        %276 = llvm.mlir.addressof @str30 : !llvm.ptr
        %277 = arith.constant 11 : i64
        %278 = func.call @cc_make_string(%276, %277) : (!llvm.ptr, i64) -> i64
        %279 = func.call @cc_intern(%275, %278) : (i64, i64) -> i64
        %280 = func.call @cc_nil_value() : () -> i64
        %281 = func.call @cc_cons(%279, %280) : (i64, i64) -> i64
        %282 = func.call @cc_values_pack(%281) : (i64) -> i64
        func.call @stack_push_pointer(%279) : (i64) -> ()
        %283 = func.call @stack_pop_pointer() : () -> i64
        %284 = llvm.mlir.addressof @str31 : !llvm.ptr
        %285 = func.call @cc_make_function_ref_const(%284) : (!llvm.ptr) -> i64
        func.call @stack_push_pointer(%285) : (i64) -> ()
        %286 = func.call @stack_pop_pointer() : () -> i64
        %287 = func.call @cc_cons(%283, %286) : (i64, i64) -> i64
        %288 = func.call @cc_cons(%287, %272) : (i64, i64) -> i64
        %289 = func.call @cc_push_handler_frame(%288) : (i64) -> i64
        %290 = func.call @cc_errorp(%289) : (i64) -> i64
        %291 = func.call @cc_nil_value() : () -> i64
        %292 = arith.cmpi ne, %290, %291 : i64
        %293 = scf.if %292 -> (i64) {
          scf.yield %289 : i64
        } else {
          %294 = func.call @cc_nil_value() : () -> i64
          %295 = func.call @cc_nil_value() : () -> i64
          %296 = func.call @cc_errorp(%294) : (i64) -> i64
          %297 = arith.cmpi ne, %296, %295 : i64
          %298 = scf.if %297 -> (i64) {
            scf.yield %294 : i64
          } else {
            %299 = func.call @cc_nil_value() : () -> i64
            %300 = func.call @cc_nil_value() : () -> i64
            %301 = func.call @cc_errorp(%299) : (i64) -> i64
            %302 = arith.cmpi ne, %301, %300 : i64
            %303 = scf.if %302 -> (i64) {
              scf.yield %299 : i64
            } else {
              %304 = llvm.mlir.addressof @str32 : !llvm.ptr
              %305 = arith.constant 4 : i64
              %306 = func.call @cc_make_string(%304, %305) : (!llvm.ptr, i64) -> i64
              func.call @stack_push_pointer(%306) : (i64) -> ()
              %307 = func.call @stack_pop_pointer() : () -> i64
              %308 = llvm.mlir.addressof @str33 : !llvm.ptr
              %309 = arith.constant 12 : i64
              %310 = func.call @cc_make_string(%308, %309) : (!llvm.ptr, i64) -> i64
              %311 = llvm.mlir.addressof @str34 : !llvm.ptr
              %312 = arith.constant 11 : i64
              %313 = func.call @cc_make_string(%311, %312) : (!llvm.ptr, i64) -> i64
              %314 = func.call @cc_intern(%310, %313) : (i64, i64) -> i64
              %315 = func.call @cc_nil_value() : () -> i64
              %316 = func.call @cc_cons(%314, %315) : (i64, i64) -> i64
              %317 = func.call @cc_values_pack(%316) : (i64) -> i64
              func.call @stack_push_pointer(%314) : (i64) -> ()
              %318 = func.call @stack_pop_pointer() : () -> i64
              %319 = func.call @cc_nil_value() : () -> i64
              %320 = func.call @cc_errorp(%307) : (i64) -> i64
              %321 = arith.cmpi ne, %320, %319 : i64
              %322 = arith.cmpi eq, %319, %319 : i64
              %323 = arith.andi %321, %322 : i1
              %324 = scf.if %323 -> (i64) {
                scf.yield %307 : i64
              } else {
                scf.yield %319 : i64
              }
              %325 = func.call @cc_errorp(%318) : (i64) -> i64
              %326 = arith.cmpi ne, %325, %319 : i64
              %327 = arith.cmpi eq, %324, %319 : i64
              %328 = arith.andi %326, %327 : i1
              %329 = scf.if %328 -> (i64) {
                scf.yield %318 : i64
              } else {
                scf.yield %324 : i64
              }
              %330 = arith.cmpi ne, %329, %319 : i64
              scf.if %330 {
                func.call @stack_push_pointer(%329) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%307) : (i64) -> ()
                func.call @stack_push_pointer(%318) : (i64) -> ()
                %331 = llvm.mlir.addressof @str35 : !llvm.ptr
                %332 = func.call @cc_make_function_ref_const(%331) : (!llvm.ptr) -> i64
                %333 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%332, %333) : (i64, i64) -> ()
              }
              %334 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %334 : i64
            }
            %335 = func.call @cc_nil_value() : () -> i64
            %336 = func.call @cc_errorp(%303) : (i64) -> i64
            %337 = arith.cmpi ne, %336, %335 : i64
            %338 = scf.if %337 -> (i64) {
              scf.yield %303 : i64
            } else {
              %339 = arith.constant 10 : i64
              func.call @stack_push_fixnum(%339) : (i64) -> ()
              %340 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %340 : i64
            }
            func.call @stack_push_pointer(%338) : (i64) -> ()
            %341 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %341 : i64
          }
          func.call @stack_push_pointer(%298) : (i64) -> ()
          %342 = func.call @stack_pop_pointer() : () -> i64
          %343 = func.call @cc_pop_handler_frame() : () -> i64
          scf.yield %342 : i64
        }
        func.call @stack_push_pointer(%293) : (i64) -> ()
        %344 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %344 : i64
      }
      func.call @stack_push_pointer(%271) : (i64) -> ()
      %345 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %345 : i64
    }
    func.call @stack_push_pointer(%266) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_105993685958658"() {
    %549 = func.call @cc_nil_value() : () -> i64
    %550 = func.call @cc_nil_value() : () -> i64
    %551 = func.call @cc_errorp(%549) : (i64) -> i64
    %552 = arith.cmpi ne, %551, %550 : i64
    %553 = scf.if %552 -> (i64) {
      scf.yield %549 : i64
    } else {
      %554 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %555 = func.call @cc_nil_value() : () -> i64
      %556 = func.call @cc_nil_value() : () -> i64
      %557 = func.call @cc_errorp(%555) : (i64) -> i64
      %558 = arith.cmpi ne, %557, %556 : i64
      %559 = scf.if %558 -> (i64) {
        scf.yield %555 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %560 = llvm.mlir.addressof @str54 : !llvm.ptr
        %561 = arith.constant 10 : i64
        %562 = func.call @cc_make_string(%560, %561) : (!llvm.ptr, i64) -> i64
        %563 = llvm.mlir.addressof @str55 : !llvm.ptr
        %564 = arith.constant 11 : i64
        %565 = func.call @cc_make_string(%563, %564) : (!llvm.ptr, i64) -> i64
        %566 = func.call @cc_intern(%562, %565) : (i64, i64) -> i64
        %567 = func.call @cc_nil_value() : () -> i64
        %568 = func.call @cc_cons(%566, %567) : (i64, i64) -> i64
        %569 = func.call @cc_values_pack(%568) : (i64) -> i64
        func.call @stack_push_pointer(%566) : (i64) -> ()
        %570 = func.call @stack_pop_pointer() : () -> i64
        %571 = func.call @cc_nil_value() : () -> i64
        %572 = func.call @cc_errorp(%570) : (i64) -> i64
        %573 = arith.cmpi ne, %572, %571 : i64
        %574 = arith.cmpi eq, %571, %571 : i64
        %575 = arith.andi %573, %574 : i1
        %576 = scf.if %575 -> (i64) {
          scf.yield %570 : i64
        } else {
          scf.yield %571 : i64
        }
        %577 = arith.cmpi ne, %576, %571 : i64
        scf.if %577 {
          func.call @stack_push_pointer(%576) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%570) : (i64) -> ()
          %578 = llvm.mlir.addressof @str56 : !llvm.ptr
          %579 = func.call @cc_make_function_ref_const(%578) : (!llvm.ptr) -> i64
          %580 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%579, %580) : (i64, i64) -> ()
        }
        %581 = func.call @stack_pop_pointer() : () -> i64
        %582 = llvm.mlir.addressof @str57 : !llvm.ptr
        %583 = arith.constant 8 : i64
        %584 = func.call @cc_make_string(%582, %583) : (!llvm.ptr, i64) -> i64
        %585 = func.call @cc_nil_value() : () -> i64
        %586 = func.call @cc_intern(%584, %585) : (i64, i64) -> i64
        %587 = func.call @cc_nil_value() : () -> i64
        %588 = func.call @cc_cons(%586, %587) : (i64, i64) -> i64
        %589 = func.call @cc_values_pack(%588) : (i64) -> i64
        %590 = func.call @cc_slot_value(%581, %586) : (i64, i64) -> i64
        func.call @stack_push_pointer(%590) : (i64) -> ()
        %591 = func.call @stack_pop_pointer() : () -> i64
        %592 = func.call @cc_errorp(%591) : (i64) -> i64
        %593 = func.call @cc_nil_value() : () -> i64
        %594 = arith.cmpi ne, %592, %593 : i64
        scf.if %594 {
          func.call @stack_push_pointer(%591) : (i64) -> ()
        } else {
          %595 = func.call @cc_multiple_value_list(%591) : (i64) -> i64
          func.call @stack_push_pointer(%595) : (i64) -> ()
        }
        %596 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %597 = func.call @stack_pop_pointer() : () -> i64
        %598 = func.call @cc_nil_value() : () -> i64
        %599 = func.call @cc_maybe_error_from_multiple_value_list(%596) : (i64) -> i64
        %600 = func.call @cc_errorp(%599) : (i64) -> i64
        %601 = arith.cmpi ne, %600, %598 : i64
        %602 = arith.cmpi eq, %598, %598 : i64
        %603 = arith.andi %601, %602 : i1
        %604 = scf.if %603 -> (i64) {
          scf.yield %599 : i64
        } else {
          scf.yield %598 : i64
        }
        %605 = arith.cmpi ne, %604, %598 : i64
        scf.if %605 {
          func.call @stack_push_pointer(%604) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %606 = func.call @stack_pop_pointer() : () -> i64
          %607 = func.call @cc_cons(%597, %606) : (i64, i64) -> i64
          func.call @stack_push_pointer(%607) : (i64) -> ()
          %608 = func.call @stack_pop_pointer() : () -> i64
          %609 = func.call @cc_cons(%596, %608) : (i64, i64) -> i64
          func.call @stack_push_pointer(%609) : (i64) -> ()
          %610 = func.call @stack_pop_pointer() : () -> i64
          %611 = func.call @cc_values_pack(%610) : (i64) -> i64
          func.call @stack_push_pointer(%611) : (i64) -> ()
        }
        %612 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %612 : i64
      }
      func.call @stack_push_pointer(%559) : (i64) -> ()
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %615 = func.call @cc_errorp(%613) : (i64) -> i64
      %616 = func.call @cc_nil_value() : () -> i64
      %617 = arith.cmpi ne, %615, %616 : i64
      scf.if %617 {
        %618 = func.call @cc_condition_value(%613) : (i64) -> i64
        %619 = func.call @cc_values2(%616, %618) : (i64, i64) -> i64
        func.call @stack_push_pointer(%619) : (i64) -> ()
      } else {
        %620 = func.call @cc_multiple_value_list(%613) : (i64) -> i64
        %621 = func.call @cc_values_pack(%620) : (i64) -> i64
        func.call @stack_push_pointer(%621) : (i64) -> ()
      }
      %622 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %622 : i64
    }
    func.call @stack_push_pointer(%553) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_105993685958656*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_105993685958656*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_105993685958656*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("CERROR.6\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str6("LOCALLY\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("OPTIMIZE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("SAFETY\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("HANDLER-BIND\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("CONTINUE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str23("CERROR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("Wooo\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str30("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP::CONTINUE\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str32("Wooo\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("SIMPLE-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str34("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("CERROR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str36("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str41("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str42("CONDITION-SLOT-UNBOUND\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str43("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str44("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str47("FILE-ERROR-PATHNAME\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("MAKE-CONDITION\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str50("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("FILE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str54("FILE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str55("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str56("MAKE-CONDITION\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str57("PATHNAME\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str58("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str59("UNBOUND-SLOT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str63("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str64("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str65("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str66("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETFLAG_105993685958656*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str68("*__MLIR_BLOCK_RETMVLIST_105993685958656*\00") : !llvm.array<41 x i8>
}
