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
      %58 = arith.constant 12 : i64
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
      %75 = arith.constant 3 : i64
      %76 = func.call @cc_make_string(%74, %75) : (!llvm.ptr, i64) -> i64
      %77 = func.call @cc_nil_value() : () -> i64
      %78 = func.call @cc_intern(%76, %77) : (i64, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
      %81 = func.call @cc_values_pack(%80) : (i64) -> i64
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %82 = llvm.mlir.addressof @str8 : !llvm.ptr
      %83 = arith.constant 17 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = llvm.mlir.addressof @str9 : !llvm.ptr
      %86 = arith.constant 3 : i64
      %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
      %88 = func.call @cc_intern(%84, %87) : (i64, i64) -> i64
      %89 = func.call @cc_nil_value() : () -> i64
      %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
      %91 = func.call @cc_values_pack(%90) : (i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %92 = llvm.mlir.addressof @str10 : !llvm.ptr
      %93 = arith.constant 5 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = llvm.mlir.addressof @str11 : !llvm.ptr
      %96 = arith.constant 11 : i64
      %97 = func.call @cc_make_string(%95, %96) : (!llvm.ptr, i64) -> i64
      %98 = func.call @cc_intern(%94, %97) : (i64, i64) -> i64
      %99 = func.call @cc_nil_value() : () -> i64
      %100 = func.call @cc_cons(%98, %99) : (i64, i64) -> i64
      %101 = func.call @cc_values_pack(%100) : (i64) -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
      %102 = llvm.mlir.addressof @str12 : !llvm.ptr
      %103 = arith.constant 15 : i64
      %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
      %105 = llvm.mlir.addressof @str13 : !llvm.ptr
      %106 = arith.constant 3 : i64
      %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
      %108 = func.call @cc_intern(%104, %107) : (i64, i64) -> i64
      %109 = func.call @cc_nil_value() : () -> i64
      %110 = func.call @cc_cons(%108, %109) : (i64, i64) -> i64
      %111 = func.call @cc_values_pack(%110) : (i64) -> i64
      func.call @stack_push_pointer(%108) : (i64) -> ()
      %112 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %113 = llvm.mlir.addressof @str14 : !llvm.ptr
      %114 = arith.constant 4 : i64
      %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
      %116 = llvm.mlir.addressof @str15 : !llvm.ptr
      %117 = arith.constant 11 : i64
      %118 = func.call @cc_make_string(%116, %117) : (!llvm.ptr, i64) -> i64
      %119 = func.call @cc_intern(%115, %118) : (i64, i64) -> i64
      %120 = func.call @cc_nil_value() : () -> i64
      %121 = func.call @cc_cons(%119, %120) : (i64, i64) -> i64
      %122 = func.call @cc_values_pack(%121) : (i64) -> i64
      func.call @stack_push_pointer(%119) : (i64) -> ()
      %123 = llvm.mlir.addressof @str16 : !llvm.ptr
      %124 = arith.constant 10 : i64
      %125 = func.call @cc_make_string(%123, %124) : (!llvm.ptr, i64) -> i64
      %126 = llvm.mlir.addressof @str17 : !llvm.ptr
      %127 = arith.constant 11 : i64
      %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
      %129 = func.call @cc_intern(%125, %128) : (i64, i64) -> i64
      %130 = func.call @cc_nil_value() : () -> i64
      %131 = func.call @cc_cons(%129, %130) : (i64, i64) -> i64
      %132 = func.call @cc_values_pack(%131) : (i64) -> i64
      func.call @stack_push_pointer(%129) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %133 = func.call @stack_pop_pointer() : () -> i64
      %134 = func.call @stack_pop_pointer() : () -> i64
      %135 = func.call @cc_cons(%134, %133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%135) : (i64) -> ()
      %136 = func.call @stack_pop_pointer() : () -> i64
      %137 = func.call @stack_pop_pointer() : () -> i64
      %138 = func.call @cc_cons(%137, %136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%138) : (i64) -> ()
      %139 = func.call @stack_pop_pointer() : () -> i64
      %140 = func.call @stack_pop_pointer() : () -> i64
      %141 = func.call @cc_cons(%139, %140) : (i64, i64) -> i64
      %142 = llvm.mlir.addressof @str18 : !llvm.ptr
      %143 = arith.constant 5 : i64
      %144 = func.call @cc_make_string(%142, %143) : (!llvm.ptr, i64) -> i64
      %145 = func.call @cc_nil_value() : () -> i64
      %146 = func.call @cc_intern(%144, %145) : (i64, i64) -> i64
      %147 = func.call @cc_nil_value() : () -> i64
      %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
      %149 = func.call @cc_values_pack(%148) : (i64) -> i64
      %150 = func.call @cc_cons(%146, %141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%150) : (i64) -> ()
      %151 = llvm.mlir.addressof @str19 : !llvm.ptr
      %152 = arith.constant 8 : i64
      %153 = func.call @cc_make_string(%151, %152) : (!llvm.ptr, i64) -> i64
      %154 = llvm.mlir.addressof @str20 : !llvm.ptr
      %155 = arith.constant 7 : i64
      %156 = func.call @cc_make_string(%154, %155) : (!llvm.ptr, i64) -> i64
      %157 = func.call @cc_intern(%153, %156) : (i64, i64) -> i64
      %158 = func.call @cc_nil_value() : () -> i64
      %159 = func.call @cc_cons(%157, %158) : (i64, i64) -> i64
      %160 = func.call @cc_values_pack(%159) : (i64) -> i64
      func.call @stack_push_pointer(%157) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %161 = func.call @stack_pop_pointer() : () -> i64
      %162 = func.call @stack_pop_pointer() : () -> i64
      %163 = func.call @cc_cons(%162, %161) : (i64, i64) -> i64
      func.call @stack_push_pointer(%163) : (i64) -> ()
      %164 = func.call @stack_pop_pointer() : () -> i64
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @cc_cons(%165, %164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%166) : (i64) -> ()
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @cc_cons(%168, %167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%169) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @cc_cons(%171, %170) : (i64, i64) -> i64
      func.call @stack_push_pointer(%172) : (i64) -> ()
      %173 = func.call @stack_pop_pointer() : () -> i64
      %174 = func.call @stack_pop_pointer() : () -> i64
      %175 = func.call @cc_cons(%174, %173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %176 = func.call @stack_pop_pointer() : () -> i64
      %177 = func.call @stack_pop_pointer() : () -> i64
      %178 = func.call @cc_cons(%177, %176) : (i64, i64) -> i64
      func.call @stack_push_pointer(%178) : (i64) -> ()
      %179 = func.call @stack_pop_pointer() : () -> i64
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @cc_cons(%180, %179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%181) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %194 = func.call @stack_pop_pointer() : () -> i64
      %275 = arith.constant 261322017079297 : i64
      %276 = arith.constant 0 : i64
      %277 = func.call @cc_make_closure(%275, %276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%277) : (i64) -> ()
      %278 = func.call @stack_pop_pointer() : () -> i64
      %279 = llvm.mlir.addressof @str29 : !llvm.ptr
      %280 = arith.constant 1 : i64
      %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
      %282 = func.call @cc_nil_value() : () -> i64
      %283 = func.call @cc_intern(%281, %282) : (i64, i64) -> i64
      %284 = func.call @cc_nil_value() : () -> i64
      %285 = func.call @cc_cons(%283, %284) : (i64, i64) -> i64
      %286 = func.call @cc_values_pack(%285) : (i64) -> i64
      func.call @stack_push_pointer(%283) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %287 = func.call @stack_pop_pointer() : () -> i64
      %288 = func.call @stack_pop_pointer() : () -> i64
      %289 = func.call @cc_cons(%288, %287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%289) : (i64) -> ()
      %290 = func.call @stack_pop_pointer() : () -> i64
      %291 = llvm.mlir.addressof @str30 : !llvm.ptr
      %292 = arith.constant 11 : i64
      %293 = func.call @cc_make_string(%291, %292) : (!llvm.ptr, i64) -> i64
      %294 = llvm.mlir.addressof @str31 : !llvm.ptr
      %295 = arith.constant 7 : i64
      %296 = func.call @cc_make_string(%294, %295) : (!llvm.ptr, i64) -> i64
      %297 = func.call @cc_intern(%293, %296) : (i64, i64) -> i64
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = func.call @cc_cons(%297, %298) : (i64, i64) -> i64
      %300 = func.call @cc_values_pack(%299) : (i64) -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      %301 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %302 = func.call @stack_pop_pointer() : () -> i64
      %303 = llvm.mlir.addressof @str32 : !llvm.ptr
      %304 = arith.constant 4 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      %306 = llvm.mlir.addressof @str33 : !llvm.ptr
      %307 = arith.constant 7 : i64
      %308 = func.call @cc_make_string(%306, %307) : (!llvm.ptr, i64) -> i64
      %309 = func.call @cc_intern(%305, %308) : (i64, i64) -> i64
      %310 = func.call @cc_nil_value() : () -> i64
      %311 = func.call @cc_cons(%309, %310) : (i64, i64) -> i64
      %312 = func.call @cc_values_pack(%311) : (i64) -> i64
      func.call @stack_push_pointer(%309) : (i64) -> ()
      %313 = func.call @stack_pop_pointer() : () -> i64
      %314 = llvm.mlir.addressof @str34 : !llvm.ptr
      %315 = arith.constant 6 : i64
      %316 = func.call @cc_make_string(%314, %315) : (!llvm.ptr, i64) -> i64
      %317 = func.call @cc_nil_value() : () -> i64
      %318 = func.call @cc_intern(%316, %317) : (i64, i64) -> i64
      %319 = func.call @cc_nil_value() : () -> i64
      %320 = func.call @cc_cons(%318, %319) : (i64, i64) -> i64
      %321 = func.call @cc_values_pack(%320) : (i64) -> i64
      func.call @stack_push_pointer(%318) : (i64) -> ()
      %322 = func.call @stack_pop_pointer() : () -> i64
      %323 = func.call @cc_nil_value() : () -> i64
      %324 = func.call @cc_errorp(%65) : (i64) -> i64
      %325 = arith.cmpi ne, %324, %323 : i64
      %326 = arith.cmpi eq, %323, %323 : i64
      %327 = arith.andi %325, %326 : i1
      %328 = scf.if %327 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %323 : i64
      }
      %329 = func.call @cc_errorp(%194) : (i64) -> i64
      %330 = arith.cmpi ne, %329, %323 : i64
      %331 = arith.cmpi eq, %328, %323 : i64
      %332 = arith.andi %330, %331 : i1
      %333 = scf.if %332 -> (i64) {
        scf.yield %194 : i64
      } else {
        scf.yield %328 : i64
      }
      %334 = func.call @cc_errorp(%278) : (i64) -> i64
      %335 = arith.cmpi ne, %334, %323 : i64
      %336 = arith.cmpi eq, %333, %323 : i64
      %337 = arith.andi %335, %336 : i1
      %338 = scf.if %337 -> (i64) {
        scf.yield %278 : i64
      } else {
        scf.yield %333 : i64
      }
      %339 = func.call @cc_errorp(%290) : (i64) -> i64
      %340 = arith.cmpi ne, %339, %323 : i64
      %341 = arith.cmpi eq, %338, %323 : i64
      %342 = arith.andi %340, %341 : i1
      %343 = scf.if %342 -> (i64) {
        scf.yield %290 : i64
      } else {
        scf.yield %338 : i64
      }
      %344 = func.call @cc_errorp(%301) : (i64) -> i64
      %345 = arith.cmpi ne, %344, %323 : i64
      %346 = arith.cmpi eq, %343, %323 : i64
      %347 = arith.andi %345, %346 : i1
      %348 = scf.if %347 -> (i64) {
        scf.yield %301 : i64
      } else {
        scf.yield %343 : i64
      }
      %349 = func.call @cc_errorp(%302) : (i64) -> i64
      %350 = arith.cmpi ne, %349, %323 : i64
      %351 = arith.cmpi eq, %348, %323 : i64
      %352 = arith.andi %350, %351 : i1
      %353 = scf.if %352 -> (i64) {
        scf.yield %302 : i64
      } else {
        scf.yield %348 : i64
      }
      %354 = func.call @cc_errorp(%313) : (i64) -> i64
      %355 = arith.cmpi ne, %354, %323 : i64
      %356 = arith.cmpi eq, %353, %323 : i64
      %357 = arith.andi %355, %356 : i1
      %358 = scf.if %357 -> (i64) {
        scf.yield %313 : i64
      } else {
        scf.yield %353 : i64
      }
      %359 = func.call @cc_errorp(%322) : (i64) -> i64
      %360 = arith.cmpi ne, %359, %323 : i64
      %361 = arith.cmpi eq, %358, %323 : i64
      %362 = arith.andi %360, %361 : i1
      %363 = scf.if %362 -> (i64) {
        scf.yield %322 : i64
      } else {
        scf.yield %358 : i64
      }
      %364 = arith.cmpi ne, %363, %323 : i64
      scf.if %364 {
        func.call @stack_push_pointer(%363) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%194) : (i64) -> ()
        func.call @stack_push_pointer(%278) : (i64) -> ()
        func.call @stack_push_pointer(%290) : (i64) -> ()
        func.call @stack_push_pointer(%301) : (i64) -> ()
        func.call @stack_push_pointer(%302) : (i64) -> ()
        func.call @stack_push_pointer(%313) : (i64) -> ()
        func.call @stack_push_pointer(%322) : (i64) -> ()
        %365 = llvm.mlir.addressof @str35 : !llvm.ptr
        %366 = func.call @cc_make_function_ref_const(%365) : (!llvm.ptr) -> i64
        %367 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%366, %367) : (i64, i64) -> ()
      }
      %368 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %368 : i64
    }
    %369 = func.call @cc_nil_value() : () -> i64
    %370 = func.call @cc_errorp(%56) : (i64) -> i64
    %371 = arith.cmpi ne, %370, %369 : i64
    %372 = scf.if %371 -> (i64) {
      scf.yield %56 : i64
    } else {
      %373 = llvm.mlir.addressof @str36 : !llvm.ptr
      %374 = arith.constant 24 : i64
      %375 = func.call @cc_make_string(%373, %374) : (!llvm.ptr, i64) -> i64
      %376 = func.call @cc_nil_value() : () -> i64
      %377 = func.call @cc_intern(%375, %376) : (i64, i64) -> i64
      %378 = func.call @cc_nil_value() : () -> i64
      %379 = func.call @cc_cons(%377, %378) : (i64, i64) -> i64
      %380 = func.call @cc_values_pack(%379) : (i64) -> i64
      func.call @stack_push_pointer(%377) : (i64) -> ()
      %381 = func.call @stack_pop_pointer() : () -> i64
      %382 = llvm.mlir.addressof @str37 : !llvm.ptr
      %383 = arith.constant 3 : i64
      %384 = func.call @cc_make_string(%382, %383) : (!llvm.ptr, i64) -> i64
      %385 = func.call @cc_nil_value() : () -> i64
      %386 = func.call @cc_intern(%384, %385) : (i64, i64) -> i64
      %387 = func.call @cc_nil_value() : () -> i64
      %388 = func.call @cc_cons(%386, %387) : (i64, i64) -> i64
      %389 = func.call @cc_values_pack(%388) : (i64) -> i64
      func.call @stack_push_pointer(%386) : (i64) -> ()
      %390 = llvm.mlir.addressof @str38 : !llvm.ptr
      %391 = arith.constant 3 : i64
      %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
      %393 = func.call @cc_nil_value() : () -> i64
      %394 = func.call @cc_intern(%392, %393) : (i64, i64) -> i64
      %395 = func.call @cc_nil_value() : () -> i64
      %396 = func.call @cc_cons(%394, %395) : (i64, i64) -> i64
      %397 = func.call @cc_values_pack(%396) : (i64) -> i64
      func.call @stack_push_pointer(%394) : (i64) -> ()
      %398 = llvm.mlir.addressof @str39 : !llvm.ptr
      %399 = arith.constant 17 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = llvm.mlir.addressof @str40 : !llvm.ptr
      %402 = arith.constant 3 : i64
      %403 = func.call @cc_make_string(%401, %402) : (!llvm.ptr, i64) -> i64
      %404 = func.call @cc_intern(%400, %403) : (i64, i64) -> i64
      %405 = func.call @cc_nil_value() : () -> i64
      %406 = func.call @cc_cons(%404, %405) : (i64, i64) -> i64
      %407 = func.call @cc_values_pack(%406) : (i64) -> i64
      func.call @stack_push_pointer(%404) : (i64) -> ()
      %408 = llvm.mlir.addressof @str41 : !llvm.ptr
      %409 = arith.constant 5 : i64
      %410 = func.call @cc_make_string(%408, %409) : (!llvm.ptr, i64) -> i64
      %411 = llvm.mlir.addressof @str42 : !llvm.ptr
      %412 = arith.constant 11 : i64
      %413 = func.call @cc_make_string(%411, %412) : (!llvm.ptr, i64) -> i64
      %414 = func.call @cc_intern(%410, %413) : (i64, i64) -> i64
      %415 = func.call @cc_nil_value() : () -> i64
      %416 = func.call @cc_cons(%414, %415) : (i64, i64) -> i64
      %417 = func.call @cc_values_pack(%416) : (i64) -> i64
      func.call @stack_push_pointer(%414) : (i64) -> ()
      %418 = llvm.mlir.addressof @str43 : !llvm.ptr
      %419 = arith.constant 15 : i64
      %420 = func.call @cc_make_string(%418, %419) : (!llvm.ptr, i64) -> i64
      %421 = llvm.mlir.addressof @str44 : !llvm.ptr
      %422 = arith.constant 3 : i64
      %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
      %424 = func.call @cc_intern(%420, %423) : (i64, i64) -> i64
      %425 = func.call @cc_nil_value() : () -> i64
      %426 = func.call @cc_cons(%424, %425) : (i64, i64) -> i64
      %427 = func.call @cc_values_pack(%426) : (i64) -> i64
      func.call @stack_push_pointer(%424) : (i64) -> ()
      %428 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%428) : (i64) -> ()
      %429 = llvm.mlir.addressof @str45 : !llvm.ptr
      %430 = arith.constant 10 : i64
      %431 = func.call @cc_make_string(%429, %430) : (!llvm.ptr, i64) -> i64
      %432 = llvm.mlir.addressof @str46 : !llvm.ptr
      %433 = arith.constant 11 : i64
      %434 = func.call @cc_make_string(%432, %433) : (!llvm.ptr, i64) -> i64
      %435 = func.call @cc_intern(%431, %434) : (i64, i64) -> i64
      %436 = func.call @cc_nil_value() : () -> i64
      %437 = func.call @cc_cons(%435, %436) : (i64, i64) -> i64
      %438 = func.call @cc_values_pack(%437) : (i64) -> i64
      func.call @stack_push_pointer(%435) : (i64) -> ()
      %439 = func.call @stack_pop_pointer() : () -> i64
      %440 = func.call @stack_pop_pointer() : () -> i64
      %441 = func.call @cc_cons(%439, %440) : (i64, i64) -> i64
      %442 = llvm.mlir.addressof @str47 : !llvm.ptr
      %443 = arith.constant 5 : i64
      %444 = func.call @cc_make_string(%442, %443) : (!llvm.ptr, i64) -> i64
      %445 = func.call @cc_nil_value() : () -> i64
      %446 = func.call @cc_intern(%444, %445) : (i64, i64) -> i64
      %447 = func.call @cc_nil_value() : () -> i64
      %448 = func.call @cc_cons(%446, %447) : (i64, i64) -> i64
      %449 = func.call @cc_values_pack(%448) : (i64) -> i64
      %450 = func.call @cc_cons(%446, %441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%450) : (i64) -> ()
      %451 = llvm.mlir.addressof @str48 : !llvm.ptr
      %452 = arith.constant 8 : i64
      %453 = func.call @cc_make_string(%451, %452) : (!llvm.ptr, i64) -> i64
      %454 = llvm.mlir.addressof @str49 : !llvm.ptr
      %455 = arith.constant 7 : i64
      %456 = func.call @cc_make_string(%454, %455) : (!llvm.ptr, i64) -> i64
      %457 = func.call @cc_intern(%453, %456) : (i64, i64) -> i64
      %458 = func.call @cc_nil_value() : () -> i64
      %459 = func.call @cc_cons(%457, %458) : (i64, i64) -> i64
      %460 = func.call @cc_values_pack(%459) : (i64) -> i64
      func.call @stack_push_pointer(%457) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %461 = func.call @stack_pop_pointer() : () -> i64
      %462 = func.call @stack_pop_pointer() : () -> i64
      %463 = func.call @cc_cons(%462, %461) : (i64, i64) -> i64
      func.call @stack_push_pointer(%463) : (i64) -> ()
      %464 = func.call @stack_pop_pointer() : () -> i64
      %465 = func.call @stack_pop_pointer() : () -> i64
      %466 = func.call @cc_cons(%465, %464) : (i64, i64) -> i64
      func.call @stack_push_pointer(%466) : (i64) -> ()
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = func.call @stack_pop_pointer() : () -> i64
      %469 = func.call @cc_cons(%468, %467) : (i64, i64) -> i64
      func.call @stack_push_pointer(%469) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %470 = func.call @stack_pop_pointer() : () -> i64
      %471 = func.call @stack_pop_pointer() : () -> i64
      %472 = func.call @cc_cons(%471, %470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%472) : (i64) -> ()
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @stack_pop_pointer() : () -> i64
      %475 = func.call @cc_cons(%474, %473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%475) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @cc_cons(%477, %476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @stack_pop_pointer() : () -> i64
      %481 = func.call @cc_cons(%480, %479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %559 = arith.constant 261322017079298 : i64
      %560 = arith.constant 0 : i64
      %561 = func.call @cc_make_closure(%559, %560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%561) : (i64) -> ()
      %562 = func.call @stack_pop_pointer() : () -> i64
      %563 = llvm.mlir.addressof @str56 : !llvm.ptr
      %564 = arith.constant 1 : i64
      %565 = func.call @cc_make_string(%563, %564) : (!llvm.ptr, i64) -> i64
      %566 = func.call @cc_nil_value() : () -> i64
      %567 = func.call @cc_intern(%565, %566) : (i64, i64) -> i64
      %568 = func.call @cc_nil_value() : () -> i64
      %569 = func.call @cc_cons(%567, %568) : (i64, i64) -> i64
      %570 = func.call @cc_values_pack(%569) : (i64) -> i64
      func.call @stack_push_pointer(%567) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %571 = func.call @stack_pop_pointer() : () -> i64
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @cc_cons(%572, %571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%573) : (i64) -> ()
      %574 = func.call @stack_pop_pointer() : () -> i64
      %575 = llvm.mlir.addressof @str57 : !llvm.ptr
      %576 = arith.constant 11 : i64
      %577 = func.call @cc_make_string(%575, %576) : (!llvm.ptr, i64) -> i64
      %578 = llvm.mlir.addressof @str58 : !llvm.ptr
      %579 = arith.constant 7 : i64
      %580 = func.call @cc_make_string(%578, %579) : (!llvm.ptr, i64) -> i64
      %581 = func.call @cc_intern(%577, %580) : (i64, i64) -> i64
      %582 = func.call @cc_nil_value() : () -> i64
      %583 = func.call @cc_cons(%581, %582) : (i64, i64) -> i64
      %584 = func.call @cc_values_pack(%583) : (i64) -> i64
      func.call @stack_push_pointer(%581) : (i64) -> ()
      %585 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %586 = func.call @stack_pop_pointer() : () -> i64
      %587 = llvm.mlir.addressof @str59 : !llvm.ptr
      %588 = arith.constant 4 : i64
      %589 = func.call @cc_make_string(%587, %588) : (!llvm.ptr, i64) -> i64
      %590 = llvm.mlir.addressof @str60 : !llvm.ptr
      %591 = arith.constant 7 : i64
      %592 = func.call @cc_make_string(%590, %591) : (!llvm.ptr, i64) -> i64
      %593 = func.call @cc_intern(%589, %592) : (i64, i64) -> i64
      %594 = func.call @cc_nil_value() : () -> i64
      %595 = func.call @cc_cons(%593, %594) : (i64, i64) -> i64
      %596 = func.call @cc_values_pack(%595) : (i64) -> i64
      func.call @stack_push_pointer(%593) : (i64) -> ()
      %597 = func.call @stack_pop_pointer() : () -> i64
      %598 = llvm.mlir.addressof @str61 : !llvm.ptr
      %599 = arith.constant 6 : i64
      %600 = func.call @cc_make_string(%598, %599) : (!llvm.ptr, i64) -> i64
      %601 = func.call @cc_nil_value() : () -> i64
      %602 = func.call @cc_intern(%600, %601) : (i64, i64) -> i64
      %603 = func.call @cc_nil_value() : () -> i64
      %604 = func.call @cc_cons(%602, %603) : (i64, i64) -> i64
      %605 = func.call @cc_values_pack(%604) : (i64) -> i64
      func.call @stack_push_pointer(%602) : (i64) -> ()
      %606 = func.call @stack_pop_pointer() : () -> i64
      %607 = func.call @cc_nil_value() : () -> i64
      %608 = func.call @cc_errorp(%381) : (i64) -> i64
      %609 = arith.cmpi ne, %608, %607 : i64
      %610 = arith.cmpi eq, %607, %607 : i64
      %611 = arith.andi %609, %610 : i1
      %612 = scf.if %611 -> (i64) {
        scf.yield %381 : i64
      } else {
        scf.yield %607 : i64
      }
      %613 = func.call @cc_errorp(%494) : (i64) -> i64
      %614 = arith.cmpi ne, %613, %607 : i64
      %615 = arith.cmpi eq, %612, %607 : i64
      %616 = arith.andi %614, %615 : i1
      %617 = scf.if %616 -> (i64) {
        scf.yield %494 : i64
      } else {
        scf.yield %612 : i64
      }
      %618 = func.call @cc_errorp(%562) : (i64) -> i64
      %619 = arith.cmpi ne, %618, %607 : i64
      %620 = arith.cmpi eq, %617, %607 : i64
      %621 = arith.andi %619, %620 : i1
      %622 = scf.if %621 -> (i64) {
        scf.yield %562 : i64
      } else {
        scf.yield %617 : i64
      }
      %623 = func.call @cc_errorp(%574) : (i64) -> i64
      %624 = arith.cmpi ne, %623, %607 : i64
      %625 = arith.cmpi eq, %622, %607 : i64
      %626 = arith.andi %624, %625 : i1
      %627 = scf.if %626 -> (i64) {
        scf.yield %574 : i64
      } else {
        scf.yield %622 : i64
      }
      %628 = func.call @cc_errorp(%585) : (i64) -> i64
      %629 = arith.cmpi ne, %628, %607 : i64
      %630 = arith.cmpi eq, %627, %607 : i64
      %631 = arith.andi %629, %630 : i1
      %632 = scf.if %631 -> (i64) {
        scf.yield %585 : i64
      } else {
        scf.yield %627 : i64
      }
      %633 = func.call @cc_errorp(%586) : (i64) -> i64
      %634 = arith.cmpi ne, %633, %607 : i64
      %635 = arith.cmpi eq, %632, %607 : i64
      %636 = arith.andi %634, %635 : i1
      %637 = scf.if %636 -> (i64) {
        scf.yield %586 : i64
      } else {
        scf.yield %632 : i64
      }
      %638 = func.call @cc_errorp(%597) : (i64) -> i64
      %639 = arith.cmpi ne, %638, %607 : i64
      %640 = arith.cmpi eq, %637, %607 : i64
      %641 = arith.andi %639, %640 : i1
      %642 = scf.if %641 -> (i64) {
        scf.yield %597 : i64
      } else {
        scf.yield %637 : i64
      }
      %643 = func.call @cc_errorp(%606) : (i64) -> i64
      %644 = arith.cmpi ne, %643, %607 : i64
      %645 = arith.cmpi eq, %642, %607 : i64
      %646 = arith.andi %644, %645 : i1
      %647 = scf.if %646 -> (i64) {
        scf.yield %606 : i64
      } else {
        scf.yield %642 : i64
      }
      %648 = arith.cmpi ne, %647, %607 : i64
      scf.if %648 {
        func.call @stack_push_pointer(%647) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%381) : (i64) -> ()
        func.call @stack_push_pointer(%494) : (i64) -> ()
        func.call @stack_push_pointer(%562) : (i64) -> ()
        func.call @stack_push_pointer(%574) : (i64) -> ()
        func.call @stack_push_pointer(%585) : (i64) -> ()
        func.call @stack_push_pointer(%586) : (i64) -> ()
        func.call @stack_push_pointer(%597) : (i64) -> ()
        func.call @stack_push_pointer(%606) : (i64) -> ()
        %649 = llvm.mlir.addressof @str62 : !llvm.ptr
        %650 = func.call @cc_make_function_ref_const(%649) : (!llvm.ptr) -> i64
        %651 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%650, %651) : (i64, i64) -> ()
      }
      %652 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %652 : i64
    }
    %653 = func.call @cc_nil_value() : () -> i64
    %654 = func.call @cc_errorp(%372) : (i64) -> i64
    %655 = arith.cmpi ne, %654, %653 : i64
    %656 = scf.if %655 -> (i64) {
      scf.yield %372 : i64
    } else {
      %657 = llvm.mlir.addressof @str63 : !llvm.ptr
      %658 = arith.constant 28 : i64
      %659 = func.call @cc_make_string(%657, %658) : (!llvm.ptr, i64) -> i64
      %660 = func.call @cc_nil_value() : () -> i64
      %661 = func.call @cc_intern(%659, %660) : (i64, i64) -> i64
      %662 = func.call @cc_nil_value() : () -> i64
      %663 = func.call @cc_cons(%661, %662) : (i64, i64) -> i64
      %664 = func.call @cc_values_pack(%663) : (i64) -> i64
      func.call @stack_push_pointer(%661) : (i64) -> ()
      %665 = func.call @stack_pop_pointer() : () -> i64
      %666 = llvm.mlir.addressof @str64 : !llvm.ptr
      %667 = arith.constant 3 : i64
      %668 = func.call @cc_make_string(%666, %667) : (!llvm.ptr, i64) -> i64
      %669 = func.call @cc_nil_value() : () -> i64
      %670 = func.call @cc_intern(%668, %669) : (i64, i64) -> i64
      %671 = func.call @cc_nil_value() : () -> i64
      %672 = func.call @cc_cons(%670, %671) : (i64, i64) -> i64
      %673 = func.call @cc_values_pack(%672) : (i64) -> i64
      func.call @stack_push_pointer(%670) : (i64) -> ()
      %674 = llvm.mlir.addressof @str65 : !llvm.ptr
      %675 = arith.constant 3 : i64
      %676 = func.call @cc_make_string(%674, %675) : (!llvm.ptr, i64) -> i64
      %677 = func.call @cc_nil_value() : () -> i64
      %678 = func.call @cc_intern(%676, %677) : (i64, i64) -> i64
      %679 = func.call @cc_nil_value() : () -> i64
      %680 = func.call @cc_cons(%678, %679) : (i64, i64) -> i64
      %681 = func.call @cc_values_pack(%680) : (i64) -> i64
      func.call @stack_push_pointer(%678) : (i64) -> ()
      %682 = llvm.mlir.addressof @str66 : !llvm.ptr
      %683 = arith.constant 17 : i64
      %684 = func.call @cc_make_string(%682, %683) : (!llvm.ptr, i64) -> i64
      %685 = llvm.mlir.addressof @str67 : !llvm.ptr
      %686 = arith.constant 3 : i64
      %687 = func.call @cc_make_string(%685, %686) : (!llvm.ptr, i64) -> i64
      %688 = func.call @cc_intern(%684, %687) : (i64, i64) -> i64
      %689 = func.call @cc_nil_value() : () -> i64
      %690 = func.call @cc_cons(%688, %689) : (i64, i64) -> i64
      %691 = func.call @cc_values_pack(%690) : (i64) -> i64
      func.call @stack_push_pointer(%688) : (i64) -> ()
      %692 = llvm.mlir.addressof @str68 : !llvm.ptr
      %693 = arith.constant 5 : i64
      %694 = func.call @cc_make_string(%692, %693) : (!llvm.ptr, i64) -> i64
      %695 = llvm.mlir.addressof @str69 : !llvm.ptr
      %696 = arith.constant 11 : i64
      %697 = func.call @cc_make_string(%695, %696) : (!llvm.ptr, i64) -> i64
      %698 = func.call @cc_intern(%694, %697) : (i64, i64) -> i64
      %699 = func.call @cc_nil_value() : () -> i64
      %700 = func.call @cc_cons(%698, %699) : (i64, i64) -> i64
      %701 = func.call @cc_values_pack(%700) : (i64) -> i64
      func.call @stack_push_pointer(%698) : (i64) -> ()
      %702 = llvm.mlir.addressof @str70 : !llvm.ptr
      %703 = arith.constant 15 : i64
      %704 = func.call @cc_make_string(%702, %703) : (!llvm.ptr, i64) -> i64
      %705 = llvm.mlir.addressof @str71 : !llvm.ptr
      %706 = arith.constant 3 : i64
      %707 = func.call @cc_make_string(%705, %706) : (!llvm.ptr, i64) -> i64
      %708 = func.call @cc_intern(%704, %707) : (i64, i64) -> i64
      %709 = func.call @cc_nil_value() : () -> i64
      %710 = func.call @cc_cons(%708, %709) : (i64, i64) -> i64
      %711 = func.call @cc_values_pack(%710) : (i64) -> i64
      func.call @stack_push_pointer(%708) : (i64) -> ()
      %712 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %713 = llvm.mlir.addressof @str72 : !llvm.ptr
      %714 = arith.constant 6 : i64
      %715 = func.call @cc_make_string(%713, %714) : (!llvm.ptr, i64) -> i64
      %716 = llvm.mlir.addressof @str73 : !llvm.ptr
      %717 = arith.constant 11 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = func.call @cc_intern(%715, %718) : (i64, i64) -> i64
      %720 = func.call @cc_nil_value() : () -> i64
      %721 = func.call @cc_cons(%719, %720) : (i64, i64) -> i64
      %722 = func.call @cc_values_pack(%721) : (i64) -> i64
      func.call @stack_push_pointer(%719) : (i64) -> ()
      %723 = func.call @stack_pop_pointer() : () -> i64
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @cc_cons(%723, %724) : (i64, i64) -> i64
      %726 = llvm.mlir.addressof @str74 : !llvm.ptr
      %727 = arith.constant 5 : i64
      %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
      %729 = func.call @cc_nil_value() : () -> i64
      %730 = func.call @cc_intern(%728, %729) : (i64, i64) -> i64
      %731 = func.call @cc_nil_value() : () -> i64
      %732 = func.call @cc_cons(%730, %731) : (i64, i64) -> i64
      %733 = func.call @cc_values_pack(%732) : (i64) -> i64
      %734 = func.call @cc_cons(%730, %725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%734) : (i64) -> ()
      %735 = llvm.mlir.addressof @str75 : !llvm.ptr
      %736 = arith.constant 5 : i64
      %737 = func.call @cc_make_string(%735, %736) : (!llvm.ptr, i64) -> i64
      %738 = llvm.mlir.addressof @str76 : !llvm.ptr
      %739 = arith.constant 7 : i64
      %740 = func.call @cc_make_string(%738, %739) : (!llvm.ptr, i64) -> i64
      %741 = func.call @cc_intern(%737, %740) : (i64, i64) -> i64
      %742 = func.call @cc_nil_value() : () -> i64
      %743 = func.call @cc_cons(%741, %742) : (i64, i64) -> i64
      %744 = func.call @cc_values_pack(%743) : (i64) -> i64
      func.call @stack_push_pointer(%741) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = func.call @stack_pop_pointer() : () -> i64
      %747 = func.call @cc_cons(%746, %745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%747) : (i64) -> ()
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @cc_cons(%749, %748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%750) : (i64) -> ()
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @cc_cons(%752, %751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%753) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %766 = func.call @stack_pop_pointer() : () -> i64
      %767 = func.call @stack_pop_pointer() : () -> i64
      %768 = func.call @cc_cons(%767, %766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%768) : (i64) -> ()
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = func.call @cc_cons(%770, %769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%771) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %772 = func.call @stack_pop_pointer() : () -> i64
      %773 = func.call @stack_pop_pointer() : () -> i64
      %774 = func.call @cc_cons(%773, %772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%774) : (i64) -> ()
      %775 = func.call @stack_pop_pointer() : () -> i64
      %776 = func.call @stack_pop_pointer() : () -> i64
      %777 = func.call @cc_cons(%776, %775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      %778 = func.call @stack_pop_pointer() : () -> i64
      %843 = arith.constant 261322017079299 : i64
      %844 = arith.constant 0 : i64
      %845 = func.call @cc_make_closure(%843, %844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%845) : (i64) -> ()
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = llvm.mlir.addressof @str83 : !llvm.ptr
      %848 = arith.constant 1 : i64
      %849 = func.call @cc_make_string(%847, %848) : (!llvm.ptr, i64) -> i64
      %850 = func.call @cc_nil_value() : () -> i64
      %851 = func.call @cc_intern(%849, %850) : (i64, i64) -> i64
      %852 = func.call @cc_nil_value() : () -> i64
      %853 = func.call @cc_cons(%851, %852) : (i64, i64) -> i64
      %854 = func.call @cc_values_pack(%853) : (i64) -> i64
      func.call @stack_push_pointer(%851) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %855 = func.call @stack_pop_pointer() : () -> i64
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = func.call @cc_cons(%856, %855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%857) : (i64) -> ()
      %858 = func.call @stack_pop_pointer() : () -> i64
      %859 = llvm.mlir.addressof @str84 : !llvm.ptr
      %860 = arith.constant 11 : i64
      %861 = func.call @cc_make_string(%859, %860) : (!llvm.ptr, i64) -> i64
      %862 = llvm.mlir.addressof @str85 : !llvm.ptr
      %863 = arith.constant 7 : i64
      %864 = func.call @cc_make_string(%862, %863) : (!llvm.ptr, i64) -> i64
      %865 = func.call @cc_intern(%861, %864) : (i64, i64) -> i64
      %866 = func.call @cc_nil_value() : () -> i64
      %867 = func.call @cc_cons(%865, %866) : (i64, i64) -> i64
      %868 = func.call @cc_values_pack(%867) : (i64) -> i64
      func.call @stack_push_pointer(%865) : (i64) -> ()
      %869 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %870 = func.call @stack_pop_pointer() : () -> i64
      %871 = llvm.mlir.addressof @str86 : !llvm.ptr
      %872 = arith.constant 4 : i64
      %873 = func.call @cc_make_string(%871, %872) : (!llvm.ptr, i64) -> i64
      %874 = llvm.mlir.addressof @str87 : !llvm.ptr
      %875 = arith.constant 7 : i64
      %876 = func.call @cc_make_string(%874, %875) : (!llvm.ptr, i64) -> i64
      %877 = func.call @cc_intern(%873, %876) : (i64, i64) -> i64
      %878 = func.call @cc_nil_value() : () -> i64
      %879 = func.call @cc_cons(%877, %878) : (i64, i64) -> i64
      %880 = func.call @cc_values_pack(%879) : (i64) -> i64
      func.call @stack_push_pointer(%877) : (i64) -> ()
      %881 = func.call @stack_pop_pointer() : () -> i64
      %882 = llvm.mlir.addressof @str88 : !llvm.ptr
      %883 = arith.constant 6 : i64
      %884 = func.call @cc_make_string(%882, %883) : (!llvm.ptr, i64) -> i64
      %885 = func.call @cc_nil_value() : () -> i64
      %886 = func.call @cc_intern(%884, %885) : (i64, i64) -> i64
      %887 = func.call @cc_nil_value() : () -> i64
      %888 = func.call @cc_cons(%886, %887) : (i64, i64) -> i64
      %889 = func.call @cc_values_pack(%888) : (i64) -> i64
      func.call @stack_push_pointer(%886) : (i64) -> ()
      %890 = func.call @stack_pop_pointer() : () -> i64
      %891 = func.call @cc_nil_value() : () -> i64
      %892 = func.call @cc_errorp(%665) : (i64) -> i64
      %893 = arith.cmpi ne, %892, %891 : i64
      %894 = arith.cmpi eq, %891, %891 : i64
      %895 = arith.andi %893, %894 : i1
      %896 = scf.if %895 -> (i64) {
        scf.yield %665 : i64
      } else {
        scf.yield %891 : i64
      }
      %897 = func.call @cc_errorp(%778) : (i64) -> i64
      %898 = arith.cmpi ne, %897, %891 : i64
      %899 = arith.cmpi eq, %896, %891 : i64
      %900 = arith.andi %898, %899 : i1
      %901 = scf.if %900 -> (i64) {
        scf.yield %778 : i64
      } else {
        scf.yield %896 : i64
      }
      %902 = func.call @cc_errorp(%846) : (i64) -> i64
      %903 = arith.cmpi ne, %902, %891 : i64
      %904 = arith.cmpi eq, %901, %891 : i64
      %905 = arith.andi %903, %904 : i1
      %906 = scf.if %905 -> (i64) {
        scf.yield %846 : i64
      } else {
        scf.yield %901 : i64
      }
      %907 = func.call @cc_errorp(%858) : (i64) -> i64
      %908 = arith.cmpi ne, %907, %891 : i64
      %909 = arith.cmpi eq, %906, %891 : i64
      %910 = arith.andi %908, %909 : i1
      %911 = scf.if %910 -> (i64) {
        scf.yield %858 : i64
      } else {
        scf.yield %906 : i64
      }
      %912 = func.call @cc_errorp(%869) : (i64) -> i64
      %913 = arith.cmpi ne, %912, %891 : i64
      %914 = arith.cmpi eq, %911, %891 : i64
      %915 = arith.andi %913, %914 : i1
      %916 = scf.if %915 -> (i64) {
        scf.yield %869 : i64
      } else {
        scf.yield %911 : i64
      }
      %917 = func.call @cc_errorp(%870) : (i64) -> i64
      %918 = arith.cmpi ne, %917, %891 : i64
      %919 = arith.cmpi eq, %916, %891 : i64
      %920 = arith.andi %918, %919 : i1
      %921 = scf.if %920 -> (i64) {
        scf.yield %870 : i64
      } else {
        scf.yield %916 : i64
      }
      %922 = func.call @cc_errorp(%881) : (i64) -> i64
      %923 = arith.cmpi ne, %922, %891 : i64
      %924 = arith.cmpi eq, %921, %891 : i64
      %925 = arith.andi %923, %924 : i1
      %926 = scf.if %925 -> (i64) {
        scf.yield %881 : i64
      } else {
        scf.yield %921 : i64
      }
      %927 = func.call @cc_errorp(%890) : (i64) -> i64
      %928 = arith.cmpi ne, %927, %891 : i64
      %929 = arith.cmpi eq, %926, %891 : i64
      %930 = arith.andi %928, %929 : i1
      %931 = scf.if %930 -> (i64) {
        scf.yield %890 : i64
      } else {
        scf.yield %926 : i64
      }
      %932 = arith.cmpi ne, %931, %891 : i64
      scf.if %932 {
        func.call @stack_push_pointer(%931) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%665) : (i64) -> ()
        func.call @stack_push_pointer(%778) : (i64) -> ()
        func.call @stack_push_pointer(%846) : (i64) -> ()
        func.call @stack_push_pointer(%858) : (i64) -> ()
        func.call @stack_push_pointer(%869) : (i64) -> ()
        func.call @stack_push_pointer(%870) : (i64) -> ()
        func.call @stack_push_pointer(%881) : (i64) -> ()
        func.call @stack_push_pointer(%890) : (i64) -> ()
        %933 = llvm.mlir.addressof @str89 : !llvm.ptr
        %934 = func.call @cc_make_function_ref_const(%933) : (!llvm.ptr) -> i64
        %935 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%934, %935) : (i64, i64) -> ()
      }
      %936 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %936 : i64
    }
    %937 = func.call @cc_nil_value() : () -> i64
    %938 = func.call @cc_errorp(%656) : (i64) -> i64
    %939 = arith.cmpi ne, %938, %937 : i64
    %940 = scf.if %939 -> (i64) {
      scf.yield %656 : i64
    } else {
      %941 = llvm.mlir.addressof @str90 : !llvm.ptr
      %942 = arith.constant 28 : i64
      %943 = func.call @cc_make_string(%941, %942) : (!llvm.ptr, i64) -> i64
      %944 = func.call @cc_nil_value() : () -> i64
      %945 = func.call @cc_intern(%943, %944) : (i64, i64) -> i64
      %946 = func.call @cc_nil_value() : () -> i64
      %947 = func.call @cc_cons(%945, %946) : (i64, i64) -> i64
      %948 = func.call @cc_values_pack(%947) : (i64) -> i64
      func.call @stack_push_pointer(%945) : (i64) -> ()
      %949 = func.call @stack_pop_pointer() : () -> i64
      %950 = llvm.mlir.addressof @str91 : !llvm.ptr
      %951 = arith.constant 3 : i64
      %952 = func.call @cc_make_string(%950, %951) : (!llvm.ptr, i64) -> i64
      %953 = func.call @cc_nil_value() : () -> i64
      %954 = func.call @cc_intern(%952, %953) : (i64, i64) -> i64
      %955 = func.call @cc_nil_value() : () -> i64
      %956 = func.call @cc_cons(%954, %955) : (i64, i64) -> i64
      %957 = func.call @cc_values_pack(%956) : (i64) -> i64
      func.call @stack_push_pointer(%954) : (i64) -> ()
      %958 = llvm.mlir.addressof @str92 : !llvm.ptr
      %959 = arith.constant 3 : i64
      %960 = func.call @cc_make_string(%958, %959) : (!llvm.ptr, i64) -> i64
      %961 = func.call @cc_nil_value() : () -> i64
      %962 = func.call @cc_intern(%960, %961) : (i64, i64) -> i64
      %963 = func.call @cc_nil_value() : () -> i64
      %964 = func.call @cc_cons(%962, %963) : (i64, i64) -> i64
      %965 = func.call @cc_values_pack(%964) : (i64) -> i64
      func.call @stack_push_pointer(%962) : (i64) -> ()
      %966 = llvm.mlir.addressof @str93 : !llvm.ptr
      %967 = arith.constant 17 : i64
      %968 = func.call @cc_make_string(%966, %967) : (!llvm.ptr, i64) -> i64
      %969 = llvm.mlir.addressof @str94 : !llvm.ptr
      %970 = arith.constant 3 : i64
      %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
      %972 = func.call @cc_intern(%968, %971) : (i64, i64) -> i64
      %973 = func.call @cc_nil_value() : () -> i64
      %974 = func.call @cc_cons(%972, %973) : (i64, i64) -> i64
      %975 = func.call @cc_values_pack(%974) : (i64) -> i64
      func.call @stack_push_pointer(%972) : (i64) -> ()
      %976 = llvm.mlir.addressof @str95 : !llvm.ptr
      %977 = arith.constant 5 : i64
      %978 = func.call @cc_make_string(%976, %977) : (!llvm.ptr, i64) -> i64
      %979 = llvm.mlir.addressof @str96 : !llvm.ptr
      %980 = arith.constant 11 : i64
      %981 = func.call @cc_make_string(%979, %980) : (!llvm.ptr, i64) -> i64
      %982 = func.call @cc_intern(%978, %981) : (i64, i64) -> i64
      %983 = func.call @cc_nil_value() : () -> i64
      %984 = func.call @cc_cons(%982, %983) : (i64, i64) -> i64
      %985 = func.call @cc_values_pack(%984) : (i64) -> i64
      func.call @stack_push_pointer(%982) : (i64) -> ()
      %986 = llvm.mlir.addressof @str97 : !llvm.ptr
      %987 = arith.constant 15 : i64
      %988 = func.call @cc_make_string(%986, %987) : (!llvm.ptr, i64) -> i64
      %989 = llvm.mlir.addressof @str98 : !llvm.ptr
      %990 = arith.constant 3 : i64
      %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
      %992 = func.call @cc_intern(%988, %991) : (i64, i64) -> i64
      %993 = func.call @cc_nil_value() : () -> i64
      %994 = func.call @cc_cons(%992, %993) : (i64, i64) -> i64
      %995 = func.call @cc_values_pack(%994) : (i64) -> i64
      func.call @stack_push_pointer(%992) : (i64) -> ()
      %996 = llvm.mlir.addressof @str99 : !llvm.ptr
      %997 = arith.constant 10 : i64
      %998 = func.call @cc_make_string(%996, %997) : (!llvm.ptr, i64) -> i64
      %999 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1000 = arith.constant 11 : i64
      %1001 = func.call @cc_make_string(%999, %1000) : (!llvm.ptr, i64) -> i64
      %1002 = func.call @cc_intern(%998, %1001) : (i64, i64) -> i64
      %1003 = func.call @cc_nil_value() : () -> i64
      %1004 = func.call @cc_cons(%1002, %1003) : (i64, i64) -> i64
      %1005 = func.call @cc_values_pack(%1004) : (i64) -> i64
      func.call @stack_push_pointer(%1002) : (i64) -> ()
      %1006 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1006) : (i64) -> ()
      %1007 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1008 = arith.constant 6 : i64
      %1009 = func.call @cc_make_string(%1007, %1008) : (!llvm.ptr, i64) -> i64
      %1010 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1011 = arith.constant 11 : i64
      %1012 = func.call @cc_make_string(%1010, %1011) : (!llvm.ptr, i64) -> i64
      %1013 = func.call @cc_intern(%1009, %1012) : (i64, i64) -> i64
      %1014 = func.call @cc_nil_value() : () -> i64
      %1015 = func.call @cc_cons(%1013, %1014) : (i64, i64) -> i64
      %1016 = func.call @cc_values_pack(%1015) : (i64) -> i64
      func.call @stack_push_pointer(%1013) : (i64) -> ()
      %1017 = func.call @stack_pop_pointer() : () -> i64
      %1018 = func.call @stack_pop_pointer() : () -> i64
      %1019 = func.call @cc_cons(%1017, %1018) : (i64, i64) -> i64
      %1020 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1021 = arith.constant 5 : i64
      %1022 = func.call @cc_make_string(%1020, %1021) : (!llvm.ptr, i64) -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = func.call @cc_intern(%1022, %1023) : (i64, i64) -> i64
      %1025 = func.call @cc_nil_value() : () -> i64
      %1026 = func.call @cc_cons(%1024, %1025) : (i64, i64) -> i64
      %1027 = func.call @cc_values_pack(%1026) : (i64) -> i64
      %1028 = func.call @cc_cons(%1024, %1019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1028) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1029 = func.call @stack_pop_pointer() : () -> i64
      %1030 = func.call @stack_pop_pointer() : () -> i64
      %1031 = func.call @cc_cons(%1030, %1029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1031) : (i64) -> ()
      %1032 = func.call @stack_pop_pointer() : () -> i64
      %1033 = func.call @stack_pop_pointer() : () -> i64
      %1034 = func.call @cc_cons(%1033, %1032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1034) : (i64) -> ()
      %1035 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1035) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1036 = func.call @stack_pop_pointer() : () -> i64
      %1037 = func.call @stack_pop_pointer() : () -> i64
      %1038 = func.call @cc_cons(%1037, %1036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1038) : (i64) -> ()
      %1039 = func.call @stack_pop_pointer() : () -> i64
      %1040 = func.call @stack_pop_pointer() : () -> i64
      %1041 = func.call @cc_cons(%1040, %1039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1041) : (i64) -> ()
      %1042 = func.call @stack_pop_pointer() : () -> i64
      %1043 = func.call @stack_pop_pointer() : () -> i64
      %1044 = func.call @cc_cons(%1043, %1042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1044) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1045 = func.call @stack_pop_pointer() : () -> i64
      %1046 = func.call @stack_pop_pointer() : () -> i64
      %1047 = func.call @cc_cons(%1046, %1045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1047) : (i64) -> ()
      %1048 = func.call @stack_pop_pointer() : () -> i64
      %1049 = func.call @stack_pop_pointer() : () -> i64
      %1050 = func.call @cc_cons(%1049, %1048) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1050) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = func.call @stack_pop_pointer() : () -> i64
      %1053 = func.call @cc_cons(%1052, %1051) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1053) : (i64) -> ()
      %1054 = func.call @stack_pop_pointer() : () -> i64
      %1055 = func.call @stack_pop_pointer() : () -> i64
      %1056 = func.call @cc_cons(%1055, %1054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1056) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = func.call @stack_pop_pointer() : () -> i64
      %1059 = func.call @cc_cons(%1058, %1057) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1059) : (i64) -> ()
      %1060 = func.call @stack_pop_pointer() : () -> i64
      %1061 = func.call @stack_pop_pointer() : () -> i64
      %1062 = func.call @cc_cons(%1061, %1060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1062) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = func.call @stack_pop_pointer() : () -> i64
      %1065 = func.call @cc_cons(%1064, %1063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1065) : (i64) -> ()
      %1066 = func.call @stack_pop_pointer() : () -> i64
      %1067 = func.call @stack_pop_pointer() : () -> i64
      %1068 = func.call @cc_cons(%1067, %1066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1068) : (i64) -> ()
      %1069 = func.call @stack_pop_pointer() : () -> i64
      %1136 = arith.constant 261322017079300 : i64
      %1137 = arith.constant 0 : i64
      %1138 = func.call @cc_make_closure(%1136, %1137) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1138) : (i64) -> ()
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1141 = arith.constant 1 : i64
      %1142 = func.call @cc_make_string(%1140, %1141) : (!llvm.ptr, i64) -> i64
      %1143 = func.call @cc_nil_value() : () -> i64
      %1144 = func.call @cc_intern(%1142, %1143) : (i64, i64) -> i64
      %1145 = func.call @cc_nil_value() : () -> i64
      %1146 = func.call @cc_cons(%1144, %1145) : (i64, i64) -> i64
      %1147 = func.call @cc_values_pack(%1146) : (i64) -> i64
      func.call @stack_push_pointer(%1144) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1148 = func.call @stack_pop_pointer() : () -> i64
      %1149 = func.call @stack_pop_pointer() : () -> i64
      %1150 = func.call @cc_cons(%1149, %1148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1150) : (i64) -> ()
      %1151 = func.call @stack_pop_pointer() : () -> i64
      %1152 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1153 = arith.constant 11 : i64
      %1154 = func.call @cc_make_string(%1152, %1153) : (!llvm.ptr, i64) -> i64
      %1155 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1156 = arith.constant 7 : i64
      %1157 = func.call @cc_make_string(%1155, %1156) : (!llvm.ptr, i64) -> i64
      %1158 = func.call @cc_intern(%1154, %1157) : (i64, i64) -> i64
      %1159 = func.call @cc_nil_value() : () -> i64
      %1160 = func.call @cc_cons(%1158, %1159) : (i64, i64) -> i64
      %1161 = func.call @cc_values_pack(%1160) : (i64) -> i64
      func.call @stack_push_pointer(%1158) : (i64) -> ()
      %1162 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1165 = arith.constant 4 : i64
      %1166 = func.call @cc_make_string(%1164, %1165) : (!llvm.ptr, i64) -> i64
      %1167 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1168 = arith.constant 7 : i64
      %1169 = func.call @cc_make_string(%1167, %1168) : (!llvm.ptr, i64) -> i64
      %1170 = func.call @cc_intern(%1166, %1169) : (i64, i64) -> i64
      %1171 = func.call @cc_nil_value() : () -> i64
      %1172 = func.call @cc_cons(%1170, %1171) : (i64, i64) -> i64
      %1173 = func.call @cc_values_pack(%1172) : (i64) -> i64
      func.call @stack_push_pointer(%1170) : (i64) -> ()
      %1174 = func.call @stack_pop_pointer() : () -> i64
      %1175 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1176 = arith.constant 6 : i64
      %1177 = func.call @cc_make_string(%1175, %1176) : (!llvm.ptr, i64) -> i64
      %1178 = func.call @cc_nil_value() : () -> i64
      %1179 = func.call @cc_intern(%1177, %1178) : (i64, i64) -> i64
      %1180 = func.call @cc_nil_value() : () -> i64
      %1181 = func.call @cc_cons(%1179, %1180) : (i64, i64) -> i64
      %1182 = func.call @cc_values_pack(%1181) : (i64) -> i64
      func.call @stack_push_pointer(%1179) : (i64) -> ()
      %1183 = func.call @stack_pop_pointer() : () -> i64
      %1184 = func.call @cc_nil_value() : () -> i64
      %1185 = func.call @cc_errorp(%949) : (i64) -> i64
      %1186 = arith.cmpi ne, %1185, %1184 : i64
      %1187 = arith.cmpi eq, %1184, %1184 : i64
      %1188 = arith.andi %1186, %1187 : i1
      %1189 = scf.if %1188 -> (i64) {
        scf.yield %949 : i64
      } else {
        scf.yield %1184 : i64
      }
      %1190 = func.call @cc_errorp(%1069) : (i64) -> i64
      %1191 = arith.cmpi ne, %1190, %1184 : i64
      %1192 = arith.cmpi eq, %1189, %1184 : i64
      %1193 = arith.andi %1191, %1192 : i1
      %1194 = scf.if %1193 -> (i64) {
        scf.yield %1069 : i64
      } else {
        scf.yield %1189 : i64
      }
      %1195 = func.call @cc_errorp(%1139) : (i64) -> i64
      %1196 = arith.cmpi ne, %1195, %1184 : i64
      %1197 = arith.cmpi eq, %1194, %1184 : i64
      %1198 = arith.andi %1196, %1197 : i1
      %1199 = scf.if %1198 -> (i64) {
        scf.yield %1139 : i64
      } else {
        scf.yield %1194 : i64
      }
      %1200 = func.call @cc_errorp(%1151) : (i64) -> i64
      %1201 = arith.cmpi ne, %1200, %1184 : i64
      %1202 = arith.cmpi eq, %1199, %1184 : i64
      %1203 = arith.andi %1201, %1202 : i1
      %1204 = scf.if %1203 -> (i64) {
        scf.yield %1151 : i64
      } else {
        scf.yield %1199 : i64
      }
      %1205 = func.call @cc_errorp(%1162) : (i64) -> i64
      %1206 = arith.cmpi ne, %1205, %1184 : i64
      %1207 = arith.cmpi eq, %1204, %1184 : i64
      %1208 = arith.andi %1206, %1207 : i1
      %1209 = scf.if %1208 -> (i64) {
        scf.yield %1162 : i64
      } else {
        scf.yield %1204 : i64
      }
      %1210 = func.call @cc_errorp(%1163) : (i64) -> i64
      %1211 = arith.cmpi ne, %1210, %1184 : i64
      %1212 = arith.cmpi eq, %1209, %1184 : i64
      %1213 = arith.andi %1211, %1212 : i1
      %1214 = scf.if %1213 -> (i64) {
        scf.yield %1163 : i64
      } else {
        scf.yield %1209 : i64
      }
      %1215 = func.call @cc_errorp(%1174) : (i64) -> i64
      %1216 = arith.cmpi ne, %1215, %1184 : i64
      %1217 = arith.cmpi eq, %1214, %1184 : i64
      %1218 = arith.andi %1216, %1217 : i1
      %1219 = scf.if %1218 -> (i64) {
        scf.yield %1174 : i64
      } else {
        scf.yield %1214 : i64
      }
      %1220 = func.call @cc_errorp(%1183) : (i64) -> i64
      %1221 = arith.cmpi ne, %1220, %1184 : i64
      %1222 = arith.cmpi eq, %1219, %1184 : i64
      %1223 = arith.andi %1221, %1222 : i1
      %1224 = scf.if %1223 -> (i64) {
        scf.yield %1183 : i64
      } else {
        scf.yield %1219 : i64
      }
      %1225 = arith.cmpi ne, %1224, %1184 : i64
      scf.if %1225 {
        func.call @stack_push_pointer(%1224) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%949) : (i64) -> ()
        func.call @stack_push_pointer(%1069) : (i64) -> ()
        func.call @stack_push_pointer(%1139) : (i64) -> ()
        func.call @stack_push_pointer(%1151) : (i64) -> ()
        func.call @stack_push_pointer(%1162) : (i64) -> ()
        func.call @stack_push_pointer(%1163) : (i64) -> ()
        func.call @stack_push_pointer(%1174) : (i64) -> ()
        func.call @stack_push_pointer(%1183) : (i64) -> ()
        %1226 = llvm.mlir.addressof @str115 : !llvm.ptr
        %1227 = func.call @cc_make_function_ref_const(%1226) : (!llvm.ptr) -> i64
        %1228 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1227, %1228) : (i64, i64) -> ()
      }
      %1229 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1229 : i64
    }
    %1230 = func.call @cc_nil_value() : () -> i64
    %1231 = func.call @cc_errorp(%940) : (i64) -> i64
    %1232 = arith.cmpi ne, %1231, %1230 : i64
    %1233 = scf.if %1232 -> (i64) {
      scf.yield %940 : i64
    } else {
      %1234 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1235 = arith.constant 21 : i64
      %1236 = func.call @cc_make_string(%1234, %1235) : (!llvm.ptr, i64) -> i64
      %1237 = func.call @cc_nil_value() : () -> i64
      %1238 = func.call @cc_intern(%1236, %1237) : (i64, i64) -> i64
      %1239 = func.call @cc_nil_value() : () -> i64
      %1240 = func.call @cc_cons(%1238, %1239) : (i64, i64) -> i64
      %1241 = func.call @cc_values_pack(%1240) : (i64) -> i64
      func.call @stack_push_pointer(%1238) : (i64) -> ()
      %1242 = func.call @stack_pop_pointer() : () -> i64
      %1243 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1244 = arith.constant 3 : i64
      %1245 = func.call @cc_make_string(%1243, %1244) : (!llvm.ptr, i64) -> i64
      %1246 = func.call @cc_nil_value() : () -> i64
      %1247 = func.call @cc_intern(%1245, %1246) : (i64, i64) -> i64
      %1248 = func.call @cc_nil_value() : () -> i64
      %1249 = func.call @cc_cons(%1247, %1248) : (i64, i64) -> i64
      %1250 = func.call @cc_values_pack(%1249) : (i64) -> i64
      func.call @stack_push_pointer(%1247) : (i64) -> ()
      %1251 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1252 = arith.constant 3 : i64
      %1253 = func.call @cc_make_string(%1251, %1252) : (!llvm.ptr, i64) -> i64
      %1254 = func.call @cc_nil_value() : () -> i64
      %1255 = func.call @cc_intern(%1253, %1254) : (i64, i64) -> i64
      %1256 = func.call @cc_nil_value() : () -> i64
      %1257 = func.call @cc_cons(%1255, %1256) : (i64, i64) -> i64
      %1258 = func.call @cc_values_pack(%1257) : (i64) -> i64
      func.call @stack_push_pointer(%1255) : (i64) -> ()
      %1259 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1260 = arith.constant 17 : i64
      %1261 = func.call @cc_make_string(%1259, %1260) : (!llvm.ptr, i64) -> i64
      %1262 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1263 = arith.constant 3 : i64
      %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
      %1265 = func.call @cc_intern(%1261, %1264) : (i64, i64) -> i64
      %1266 = func.call @cc_nil_value() : () -> i64
      %1267 = func.call @cc_cons(%1265, %1266) : (i64, i64) -> i64
      %1268 = func.call @cc_values_pack(%1267) : (i64) -> i64
      func.call @stack_push_pointer(%1265) : (i64) -> ()
      %1269 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1270 = arith.constant 5 : i64
      %1271 = func.call @cc_make_string(%1269, %1270) : (!llvm.ptr, i64) -> i64
      %1272 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1273 = arith.constant 11 : i64
      %1274 = func.call @cc_make_string(%1272, %1273) : (!llvm.ptr, i64) -> i64
      %1275 = func.call @cc_intern(%1271, %1274) : (i64, i64) -> i64
      %1276 = func.call @cc_nil_value() : () -> i64
      %1277 = func.call @cc_cons(%1275, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_values_pack(%1277) : (i64) -> i64
      func.call @stack_push_pointer(%1275) : (i64) -> ()
      %1279 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1280 = arith.constant 15 : i64
      %1281 = func.call @cc_make_string(%1279, %1280) : (!llvm.ptr, i64) -> i64
      %1282 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1283 = arith.constant 3 : i64
      %1284 = func.call @cc_make_string(%1282, %1283) : (!llvm.ptr, i64) -> i64
      %1285 = func.call @cc_intern(%1281, %1284) : (i64, i64) -> i64
      %1286 = func.call @cc_nil_value() : () -> i64
      %1287 = func.call @cc_cons(%1285, %1286) : (i64, i64) -> i64
      %1288 = func.call @cc_values_pack(%1287) : (i64) -> i64
      func.call @stack_push_pointer(%1285) : (i64) -> ()
      %1289 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1289) : (i64) -> ()
      %1290 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1291 = arith.constant 5 : i64
      %1292 = func.call @cc_make_string(%1290, %1291) : (!llvm.ptr, i64) -> i64
      %1293 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1294 = arith.constant 11 : i64
      %1295 = func.call @cc_make_string(%1293, %1294) : (!llvm.ptr, i64) -> i64
      %1296 = func.call @cc_intern(%1292, %1295) : (i64, i64) -> i64
      %1297 = func.call @cc_nil_value() : () -> i64
      %1298 = func.call @cc_cons(%1296, %1297) : (i64, i64) -> i64
      %1299 = func.call @cc_values_pack(%1298) : (i64) -> i64
      func.call @stack_push_pointer(%1296) : (i64) -> ()
      %1300 = func.call @stack_pop_pointer() : () -> i64
      %1301 = func.call @stack_pop_pointer() : () -> i64
      %1302 = func.call @cc_cons(%1300, %1301) : (i64, i64) -> i64
      %1303 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1304 = arith.constant 5 : i64
      %1305 = func.call @cc_make_string(%1303, %1304) : (!llvm.ptr, i64) -> i64
      %1306 = func.call @cc_nil_value() : () -> i64
      %1307 = func.call @cc_intern(%1305, %1306) : (i64, i64) -> i64
      %1308 = func.call @cc_nil_value() : () -> i64
      %1309 = func.call @cc_cons(%1307, %1308) : (i64, i64) -> i64
      %1310 = func.call @cc_values_pack(%1309) : (i64) -> i64
      %1311 = func.call @cc_cons(%1307, %1302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1311) : (i64) -> ()
      %1312 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1313 = arith.constant 8 : i64
      %1314 = func.call @cc_make_string(%1312, %1313) : (!llvm.ptr, i64) -> i64
      %1315 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1316 = arith.constant 7 : i64
      %1317 = func.call @cc_make_string(%1315, %1316) : (!llvm.ptr, i64) -> i64
      %1318 = func.call @cc_intern(%1314, %1317) : (i64, i64) -> i64
      %1319 = func.call @cc_nil_value() : () -> i64
      %1320 = func.call @cc_cons(%1318, %1319) : (i64, i64) -> i64
      %1321 = func.call @cc_values_pack(%1320) : (i64) -> i64
      func.call @stack_push_pointer(%1318) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1322 = func.call @stack_pop_pointer() : () -> i64
      %1323 = func.call @stack_pop_pointer() : () -> i64
      %1324 = func.call @cc_cons(%1323, %1322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1324) : (i64) -> ()
      %1325 = func.call @stack_pop_pointer() : () -> i64
      %1326 = func.call @stack_pop_pointer() : () -> i64
      %1327 = func.call @cc_cons(%1326, %1325) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1327) : (i64) -> ()
      %1328 = func.call @stack_pop_pointer() : () -> i64
      %1329 = func.call @stack_pop_pointer() : () -> i64
      %1330 = func.call @cc_cons(%1329, %1328) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1330) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1331 = func.call @stack_pop_pointer() : () -> i64
      %1332 = func.call @stack_pop_pointer() : () -> i64
      %1333 = func.call @cc_cons(%1332, %1331) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1333) : (i64) -> ()
      %1334 = func.call @stack_pop_pointer() : () -> i64
      %1335 = func.call @stack_pop_pointer() : () -> i64
      %1336 = func.call @cc_cons(%1335, %1334) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1336) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1337 = func.call @stack_pop_pointer() : () -> i64
      %1338 = func.call @stack_pop_pointer() : () -> i64
      %1339 = func.call @cc_cons(%1338, %1337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1339) : (i64) -> ()
      %1340 = func.call @stack_pop_pointer() : () -> i64
      %1341 = func.call @stack_pop_pointer() : () -> i64
      %1342 = func.call @cc_cons(%1341, %1340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1342) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1343 = func.call @stack_pop_pointer() : () -> i64
      %1344 = func.call @stack_pop_pointer() : () -> i64
      %1345 = func.call @cc_cons(%1344, %1343) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1345) : (i64) -> ()
      %1346 = func.call @stack_pop_pointer() : () -> i64
      %1347 = func.call @stack_pop_pointer() : () -> i64
      %1348 = func.call @cc_cons(%1347, %1346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1349 = func.call @stack_pop_pointer() : () -> i64
      %1350 = func.call @stack_pop_pointer() : () -> i64
      %1351 = func.call @cc_cons(%1350, %1349) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1351) : (i64) -> ()
      %1352 = func.call @stack_pop_pointer() : () -> i64
      %1353 = func.call @stack_pop_pointer() : () -> i64
      %1354 = func.call @cc_cons(%1353, %1352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1354) : (i64) -> ()
      %1355 = func.call @stack_pop_pointer() : () -> i64
      %1420 = arith.constant 261322017079301 : i64
      %1421 = arith.constant 0 : i64
      %1422 = func.call @cc_make_closure(%1420, %1421) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1422) : (i64) -> ()
      %1423 = func.call @stack_pop_pointer() : () -> i64
      %1424 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1425 = arith.constant 1 : i64
      %1426 = func.call @cc_make_string(%1424, %1425) : (!llvm.ptr, i64) -> i64
      %1427 = func.call @cc_nil_value() : () -> i64
      %1428 = func.call @cc_intern(%1426, %1427) : (i64, i64) -> i64
      %1429 = func.call @cc_nil_value() : () -> i64
      %1430 = func.call @cc_cons(%1428, %1429) : (i64, i64) -> i64
      %1431 = func.call @cc_values_pack(%1430) : (i64) -> i64
      func.call @stack_push_pointer(%1428) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1432 = func.call @stack_pop_pointer() : () -> i64
      %1433 = func.call @stack_pop_pointer() : () -> i64
      %1434 = func.call @cc_cons(%1433, %1432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1434) : (i64) -> ()
      %1435 = func.call @stack_pop_pointer() : () -> i64
      %1436 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1437 = arith.constant 11 : i64
      %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
      %1439 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1440 = arith.constant 7 : i64
      %1441 = func.call @cc_make_string(%1439, %1440) : (!llvm.ptr, i64) -> i64
      %1442 = func.call @cc_intern(%1438, %1441) : (i64, i64) -> i64
      %1443 = func.call @cc_nil_value() : () -> i64
      %1444 = func.call @cc_cons(%1442, %1443) : (i64, i64) -> i64
      %1445 = func.call @cc_values_pack(%1444) : (i64) -> i64
      func.call @stack_push_pointer(%1442) : (i64) -> ()
      %1446 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1447 = func.call @stack_pop_pointer() : () -> i64
      %1448 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1449 = arith.constant 4 : i64
      %1450 = func.call @cc_make_string(%1448, %1449) : (!llvm.ptr, i64) -> i64
      %1451 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1452 = arith.constant 7 : i64
      %1453 = func.call @cc_make_string(%1451, %1452) : (!llvm.ptr, i64) -> i64
      %1454 = func.call @cc_intern(%1450, %1453) : (i64, i64) -> i64
      %1455 = func.call @cc_nil_value() : () -> i64
      %1456 = func.call @cc_cons(%1454, %1455) : (i64, i64) -> i64
      %1457 = func.call @cc_values_pack(%1456) : (i64) -> i64
      func.call @stack_push_pointer(%1454) : (i64) -> ()
      %1458 = func.call @stack_pop_pointer() : () -> i64
      %1459 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1460 = arith.constant 6 : i64
      %1461 = func.call @cc_make_string(%1459, %1460) : (!llvm.ptr, i64) -> i64
      %1462 = func.call @cc_nil_value() : () -> i64
      %1463 = func.call @cc_intern(%1461, %1462) : (i64, i64) -> i64
      %1464 = func.call @cc_nil_value() : () -> i64
      %1465 = func.call @cc_cons(%1463, %1464) : (i64, i64) -> i64
      %1466 = func.call @cc_values_pack(%1465) : (i64) -> i64
      func.call @stack_push_pointer(%1463) : (i64) -> ()
      %1467 = func.call @stack_pop_pointer() : () -> i64
      %1468 = func.call @cc_nil_value() : () -> i64
      %1469 = func.call @cc_errorp(%1242) : (i64) -> i64
      %1470 = arith.cmpi ne, %1469, %1468 : i64
      %1471 = arith.cmpi eq, %1468, %1468 : i64
      %1472 = arith.andi %1470, %1471 : i1
      %1473 = scf.if %1472 -> (i64) {
        scf.yield %1242 : i64
      } else {
        scf.yield %1468 : i64
      }
      %1474 = func.call @cc_errorp(%1355) : (i64) -> i64
      %1475 = arith.cmpi ne, %1474, %1468 : i64
      %1476 = arith.cmpi eq, %1473, %1468 : i64
      %1477 = arith.andi %1475, %1476 : i1
      %1478 = scf.if %1477 -> (i64) {
        scf.yield %1355 : i64
      } else {
        scf.yield %1473 : i64
      }
      %1479 = func.call @cc_errorp(%1423) : (i64) -> i64
      %1480 = arith.cmpi ne, %1479, %1468 : i64
      %1481 = arith.cmpi eq, %1478, %1468 : i64
      %1482 = arith.andi %1480, %1481 : i1
      %1483 = scf.if %1482 -> (i64) {
        scf.yield %1423 : i64
      } else {
        scf.yield %1478 : i64
      }
      %1484 = func.call @cc_errorp(%1435) : (i64) -> i64
      %1485 = arith.cmpi ne, %1484, %1468 : i64
      %1486 = arith.cmpi eq, %1483, %1468 : i64
      %1487 = arith.andi %1485, %1486 : i1
      %1488 = scf.if %1487 -> (i64) {
        scf.yield %1435 : i64
      } else {
        scf.yield %1483 : i64
      }
      %1489 = func.call @cc_errorp(%1446) : (i64) -> i64
      %1490 = arith.cmpi ne, %1489, %1468 : i64
      %1491 = arith.cmpi eq, %1488, %1468 : i64
      %1492 = arith.andi %1490, %1491 : i1
      %1493 = scf.if %1492 -> (i64) {
        scf.yield %1446 : i64
      } else {
        scf.yield %1488 : i64
      }
      %1494 = func.call @cc_errorp(%1447) : (i64) -> i64
      %1495 = arith.cmpi ne, %1494, %1468 : i64
      %1496 = arith.cmpi eq, %1493, %1468 : i64
      %1497 = arith.andi %1495, %1496 : i1
      %1498 = scf.if %1497 -> (i64) {
        scf.yield %1447 : i64
      } else {
        scf.yield %1493 : i64
      }
      %1499 = func.call @cc_errorp(%1458) : (i64) -> i64
      %1500 = arith.cmpi ne, %1499, %1468 : i64
      %1501 = arith.cmpi eq, %1498, %1468 : i64
      %1502 = arith.andi %1500, %1501 : i1
      %1503 = scf.if %1502 -> (i64) {
        scf.yield %1458 : i64
      } else {
        scf.yield %1498 : i64
      }
      %1504 = func.call @cc_errorp(%1467) : (i64) -> i64
      %1505 = arith.cmpi ne, %1504, %1468 : i64
      %1506 = arith.cmpi eq, %1503, %1468 : i64
      %1507 = arith.andi %1505, %1506 : i1
      %1508 = scf.if %1507 -> (i64) {
        scf.yield %1467 : i64
      } else {
        scf.yield %1503 : i64
      }
      %1509 = arith.cmpi ne, %1508, %1468 : i64
      scf.if %1509 {
        func.call @stack_push_pointer(%1508) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1242) : (i64) -> ()
        func.call @stack_push_pointer(%1355) : (i64) -> ()
        func.call @stack_push_pointer(%1423) : (i64) -> ()
        func.call @stack_push_pointer(%1435) : (i64) -> ()
        func.call @stack_push_pointer(%1446) : (i64) -> ()
        func.call @stack_push_pointer(%1447) : (i64) -> ()
        func.call @stack_push_pointer(%1458) : (i64) -> ()
        func.call @stack_push_pointer(%1467) : (i64) -> ()
        %1510 = llvm.mlir.addressof @str142 : !llvm.ptr
        %1511 = func.call @cc_make_function_ref_const(%1510) : (!llvm.ptr) -> i64
        %1512 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1511, %1512) : (i64, i64) -> ()
      }
      %1513 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1513 : i64
    }
    %1514 = func.call @cc_nil_value() : () -> i64
    %1515 = func.call @cc_errorp(%1233) : (i64) -> i64
    %1516 = arith.cmpi ne, %1515, %1514 : i64
    %1517 = scf.if %1516 -> (i64) {
      scf.yield %1233 : i64
    } else {
      %1518 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1519 = arith.constant 28 : i64
      %1520 = func.call @cc_make_string(%1518, %1519) : (!llvm.ptr, i64) -> i64
      %1521 = func.call @cc_nil_value() : () -> i64
      %1522 = func.call @cc_intern(%1520, %1521) : (i64, i64) -> i64
      %1523 = func.call @cc_nil_value() : () -> i64
      %1524 = func.call @cc_cons(%1522, %1523) : (i64, i64) -> i64
      %1525 = func.call @cc_values_pack(%1524) : (i64) -> i64
      func.call @stack_push_pointer(%1522) : (i64) -> ()
      %1526 = func.call @stack_pop_pointer() : () -> i64
      %1527 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1528 = arith.constant 3 : i64
      %1529 = func.call @cc_make_string(%1527, %1528) : (!llvm.ptr, i64) -> i64
      %1530 = func.call @cc_nil_value() : () -> i64
      %1531 = func.call @cc_intern(%1529, %1530) : (i64, i64) -> i64
      %1532 = func.call @cc_nil_value() : () -> i64
      %1533 = func.call @cc_cons(%1531, %1532) : (i64, i64) -> i64
      %1534 = func.call @cc_values_pack(%1533) : (i64) -> i64
      func.call @stack_push_pointer(%1531) : (i64) -> ()
      %1535 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1536 = arith.constant 3 : i64
      %1537 = func.call @cc_make_string(%1535, %1536) : (!llvm.ptr, i64) -> i64
      %1538 = func.call @cc_nil_value() : () -> i64
      %1539 = func.call @cc_intern(%1537, %1538) : (i64, i64) -> i64
      %1540 = func.call @cc_nil_value() : () -> i64
      %1541 = func.call @cc_cons(%1539, %1540) : (i64, i64) -> i64
      %1542 = func.call @cc_values_pack(%1541) : (i64) -> i64
      func.call @stack_push_pointer(%1539) : (i64) -> ()
      %1543 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1544 = arith.constant 17 : i64
      %1545 = func.call @cc_make_string(%1543, %1544) : (!llvm.ptr, i64) -> i64
      %1546 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1547 = arith.constant 3 : i64
      %1548 = func.call @cc_make_string(%1546, %1547) : (!llvm.ptr, i64) -> i64
      %1549 = func.call @cc_intern(%1545, %1548) : (i64, i64) -> i64
      %1550 = func.call @cc_nil_value() : () -> i64
      %1551 = func.call @cc_cons(%1549, %1550) : (i64, i64) -> i64
      %1552 = func.call @cc_values_pack(%1551) : (i64) -> i64
      func.call @stack_push_pointer(%1549) : (i64) -> ()
      %1553 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1554 = arith.constant 5 : i64
      %1555 = func.call @cc_make_string(%1553, %1554) : (!llvm.ptr, i64) -> i64
      %1556 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1557 = arith.constant 11 : i64
      %1558 = func.call @cc_make_string(%1556, %1557) : (!llvm.ptr, i64) -> i64
      %1559 = func.call @cc_intern(%1555, %1558) : (i64, i64) -> i64
      %1560 = func.call @cc_nil_value() : () -> i64
      %1561 = func.call @cc_cons(%1559, %1560) : (i64, i64) -> i64
      %1562 = func.call @cc_values_pack(%1561) : (i64) -> i64
      func.call @stack_push_pointer(%1559) : (i64) -> ()
      %1563 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1564 = arith.constant 15 : i64
      %1565 = func.call @cc_make_string(%1563, %1564) : (!llvm.ptr, i64) -> i64
      %1566 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1567 = arith.constant 3 : i64
      %1568 = func.call @cc_make_string(%1566, %1567) : (!llvm.ptr, i64) -> i64
      %1569 = func.call @cc_intern(%1565, %1568) : (i64, i64) -> i64
      %1570 = func.call @cc_nil_value() : () -> i64
      %1571 = func.call @cc_cons(%1569, %1570) : (i64, i64) -> i64
      %1572 = func.call @cc_values_pack(%1571) : (i64) -> i64
      func.call @stack_push_pointer(%1569) : (i64) -> ()
      %1573 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1573) : (i64) -> ()
      %1574 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1575 = arith.constant 5 : i64
      %1576 = func.call @cc_make_string(%1574, %1575) : (!llvm.ptr, i64) -> i64
      %1577 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1578 = arith.constant 11 : i64
      %1579 = func.call @cc_make_string(%1577, %1578) : (!llvm.ptr, i64) -> i64
      %1580 = func.call @cc_intern(%1576, %1579) : (i64, i64) -> i64
      %1581 = func.call @cc_nil_value() : () -> i64
      %1582 = func.call @cc_cons(%1580, %1581) : (i64, i64) -> i64
      %1583 = func.call @cc_values_pack(%1582) : (i64) -> i64
      func.call @stack_push_pointer(%1580) : (i64) -> ()
      %1584 = func.call @stack_pop_pointer() : () -> i64
      %1585 = func.call @stack_pop_pointer() : () -> i64
      %1586 = func.call @cc_cons(%1584, %1585) : (i64, i64) -> i64
      %1587 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1588 = arith.constant 5 : i64
      %1589 = func.call @cc_make_string(%1587, %1588) : (!llvm.ptr, i64) -> i64
      %1590 = func.call @cc_nil_value() : () -> i64
      %1591 = func.call @cc_intern(%1589, %1590) : (i64, i64) -> i64
      %1592 = func.call @cc_nil_value() : () -> i64
      %1593 = func.call @cc_cons(%1591, %1592) : (i64, i64) -> i64
      %1594 = func.call @cc_values_pack(%1593) : (i64) -> i64
      %1595 = func.call @cc_cons(%1591, %1586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1595) : (i64) -> ()
      %1596 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1597 = arith.constant 8 : i64
      %1598 = func.call @cc_make_string(%1596, %1597) : (!llvm.ptr, i64) -> i64
      %1599 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1600 = arith.constant 7 : i64
      %1601 = func.call @cc_make_string(%1599, %1600) : (!llvm.ptr, i64) -> i64
      %1602 = func.call @cc_intern(%1598, %1601) : (i64, i64) -> i64
      %1603 = func.call @cc_nil_value() : () -> i64
      %1604 = func.call @cc_cons(%1602, %1603) : (i64, i64) -> i64
      %1605 = func.call @cc_values_pack(%1604) : (i64) -> i64
      func.call @stack_push_pointer(%1602) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1606 = func.call @stack_pop_pointer() : () -> i64
      %1607 = func.call @stack_pop_pointer() : () -> i64
      %1608 = func.call @cc_cons(%1607, %1606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1608) : (i64) -> ()
      %1609 = func.call @stack_pop_pointer() : () -> i64
      %1610 = func.call @stack_pop_pointer() : () -> i64
      %1611 = func.call @cc_cons(%1610, %1609) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1611) : (i64) -> ()
      %1612 = func.call @stack_pop_pointer() : () -> i64
      %1613 = func.call @stack_pop_pointer() : () -> i64
      %1614 = func.call @cc_cons(%1613, %1612) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1614) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1615 = func.call @stack_pop_pointer() : () -> i64
      %1616 = func.call @stack_pop_pointer() : () -> i64
      %1617 = func.call @cc_cons(%1616, %1615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1617) : (i64) -> ()
      %1618 = func.call @stack_pop_pointer() : () -> i64
      %1619 = func.call @stack_pop_pointer() : () -> i64
      %1620 = func.call @cc_cons(%1619, %1618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1620) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1621 = func.call @stack_pop_pointer() : () -> i64
      %1622 = func.call @stack_pop_pointer() : () -> i64
      %1623 = func.call @cc_cons(%1622, %1621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1623) : (i64) -> ()
      %1624 = func.call @stack_pop_pointer() : () -> i64
      %1625 = func.call @stack_pop_pointer() : () -> i64
      %1626 = func.call @cc_cons(%1625, %1624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1626) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %1704 = arith.constant 261322017079302 : i64
      %1705 = arith.constant 0 : i64
      %1706 = func.call @cc_make_closure(%1704, %1705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1706) : (i64) -> ()
      %1707 = func.call @stack_pop_pointer() : () -> i64
      %1708 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1709 = arith.constant 1 : i64
      %1710 = func.call @cc_make_string(%1708, %1709) : (!llvm.ptr, i64) -> i64
      %1711 = func.call @cc_nil_value() : () -> i64
      %1712 = func.call @cc_intern(%1710, %1711) : (i64, i64) -> i64
      %1713 = func.call @cc_nil_value() : () -> i64
      %1714 = func.call @cc_cons(%1712, %1713) : (i64, i64) -> i64
      %1715 = func.call @cc_values_pack(%1714) : (i64) -> i64
      func.call @stack_push_pointer(%1712) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1716 = func.call @stack_pop_pointer() : () -> i64
      %1717 = func.call @stack_pop_pointer() : () -> i64
      %1718 = func.call @cc_cons(%1717, %1716) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1718) : (i64) -> ()
      %1719 = func.call @stack_pop_pointer() : () -> i64
      %1720 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1721 = arith.constant 11 : i64
      %1722 = func.call @cc_make_string(%1720, %1721) : (!llvm.ptr, i64) -> i64
      %1723 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1724 = arith.constant 7 : i64
      %1725 = func.call @cc_make_string(%1723, %1724) : (!llvm.ptr, i64) -> i64
      %1726 = func.call @cc_intern(%1722, %1725) : (i64, i64) -> i64
      %1727 = func.call @cc_nil_value() : () -> i64
      %1728 = func.call @cc_cons(%1726, %1727) : (i64, i64) -> i64
      %1729 = func.call @cc_values_pack(%1728) : (i64) -> i64
      func.call @stack_push_pointer(%1726) : (i64) -> ()
      %1730 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1731 = func.call @stack_pop_pointer() : () -> i64
      %1732 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1733 = arith.constant 4 : i64
      %1734 = func.call @cc_make_string(%1732, %1733) : (!llvm.ptr, i64) -> i64
      %1735 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1736 = arith.constant 7 : i64
      %1737 = func.call @cc_make_string(%1735, %1736) : (!llvm.ptr, i64) -> i64
      %1738 = func.call @cc_intern(%1734, %1737) : (i64, i64) -> i64
      %1739 = func.call @cc_nil_value() : () -> i64
      %1740 = func.call @cc_cons(%1738, %1739) : (i64, i64) -> i64
      %1741 = func.call @cc_values_pack(%1740) : (i64) -> i64
      func.call @stack_push_pointer(%1738) : (i64) -> ()
      %1742 = func.call @stack_pop_pointer() : () -> i64
      %1743 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1744 = arith.constant 6 : i64
      %1745 = func.call @cc_make_string(%1743, %1744) : (!llvm.ptr, i64) -> i64
      %1746 = func.call @cc_nil_value() : () -> i64
      %1747 = func.call @cc_intern(%1745, %1746) : (i64, i64) -> i64
      %1748 = func.call @cc_nil_value() : () -> i64
      %1749 = func.call @cc_cons(%1747, %1748) : (i64, i64) -> i64
      %1750 = func.call @cc_values_pack(%1749) : (i64) -> i64
      func.call @stack_push_pointer(%1747) : (i64) -> ()
      %1751 = func.call @stack_pop_pointer() : () -> i64
      %1752 = func.call @cc_nil_value() : () -> i64
      %1753 = func.call @cc_errorp(%1526) : (i64) -> i64
      %1754 = arith.cmpi ne, %1753, %1752 : i64
      %1755 = arith.cmpi eq, %1752, %1752 : i64
      %1756 = arith.andi %1754, %1755 : i1
      %1757 = scf.if %1756 -> (i64) {
        scf.yield %1526 : i64
      } else {
        scf.yield %1752 : i64
      }
      %1758 = func.call @cc_errorp(%1639) : (i64) -> i64
      %1759 = arith.cmpi ne, %1758, %1752 : i64
      %1760 = arith.cmpi eq, %1757, %1752 : i64
      %1761 = arith.andi %1759, %1760 : i1
      %1762 = scf.if %1761 -> (i64) {
        scf.yield %1639 : i64
      } else {
        scf.yield %1757 : i64
      }
      %1763 = func.call @cc_errorp(%1707) : (i64) -> i64
      %1764 = arith.cmpi ne, %1763, %1752 : i64
      %1765 = arith.cmpi eq, %1762, %1752 : i64
      %1766 = arith.andi %1764, %1765 : i1
      %1767 = scf.if %1766 -> (i64) {
        scf.yield %1707 : i64
      } else {
        scf.yield %1762 : i64
      }
      %1768 = func.call @cc_errorp(%1719) : (i64) -> i64
      %1769 = arith.cmpi ne, %1768, %1752 : i64
      %1770 = arith.cmpi eq, %1767, %1752 : i64
      %1771 = arith.andi %1769, %1770 : i1
      %1772 = scf.if %1771 -> (i64) {
        scf.yield %1719 : i64
      } else {
        scf.yield %1767 : i64
      }
      %1773 = func.call @cc_errorp(%1730) : (i64) -> i64
      %1774 = arith.cmpi ne, %1773, %1752 : i64
      %1775 = arith.cmpi eq, %1772, %1752 : i64
      %1776 = arith.andi %1774, %1775 : i1
      %1777 = scf.if %1776 -> (i64) {
        scf.yield %1730 : i64
      } else {
        scf.yield %1772 : i64
      }
      %1778 = func.call @cc_errorp(%1731) : (i64) -> i64
      %1779 = arith.cmpi ne, %1778, %1752 : i64
      %1780 = arith.cmpi eq, %1777, %1752 : i64
      %1781 = arith.andi %1779, %1780 : i1
      %1782 = scf.if %1781 -> (i64) {
        scf.yield %1731 : i64
      } else {
        scf.yield %1777 : i64
      }
      %1783 = func.call @cc_errorp(%1742) : (i64) -> i64
      %1784 = arith.cmpi ne, %1783, %1752 : i64
      %1785 = arith.cmpi eq, %1782, %1752 : i64
      %1786 = arith.andi %1784, %1785 : i1
      %1787 = scf.if %1786 -> (i64) {
        scf.yield %1742 : i64
      } else {
        scf.yield %1782 : i64
      }
      %1788 = func.call @cc_errorp(%1751) : (i64) -> i64
      %1789 = arith.cmpi ne, %1788, %1752 : i64
      %1790 = arith.cmpi eq, %1787, %1752 : i64
      %1791 = arith.andi %1789, %1790 : i1
      %1792 = scf.if %1791 -> (i64) {
        scf.yield %1751 : i64
      } else {
        scf.yield %1787 : i64
      }
      %1793 = arith.cmpi ne, %1792, %1752 : i64
      scf.if %1793 {
        func.call @stack_push_pointer(%1792) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1526) : (i64) -> ()
        func.call @stack_push_pointer(%1639) : (i64) -> ()
        func.call @stack_push_pointer(%1707) : (i64) -> ()
        func.call @stack_push_pointer(%1719) : (i64) -> ()
        func.call @stack_push_pointer(%1730) : (i64) -> ()
        func.call @stack_push_pointer(%1731) : (i64) -> ()
        func.call @stack_push_pointer(%1742) : (i64) -> ()
        func.call @stack_push_pointer(%1751) : (i64) -> ()
        %1794 = llvm.mlir.addressof @str169 : !llvm.ptr
        %1795 = func.call @cc_make_function_ref_const(%1794) : (!llvm.ptr) -> i64
        %1796 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1795, %1796) : (i64, i64) -> ()
      }
      %1797 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1797 : i64
    }
    %1798 = func.call @cc_nil_value() : () -> i64
    %1799 = func.call @cc_errorp(%1517) : (i64) -> i64
    %1800 = arith.cmpi ne, %1799, %1798 : i64
    %1801 = scf.if %1800 -> (i64) {
      scf.yield %1517 : i64
    } else {
      %1802 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1803 = arith.constant 32 : i64
      %1804 = func.call @cc_make_string(%1802, %1803) : (!llvm.ptr, i64) -> i64
      %1805 = func.call @cc_nil_value() : () -> i64
      %1806 = func.call @cc_intern(%1804, %1805) : (i64, i64) -> i64
      %1807 = func.call @cc_nil_value() : () -> i64
      %1808 = func.call @cc_cons(%1806, %1807) : (i64, i64) -> i64
      %1809 = func.call @cc_values_pack(%1808) : (i64) -> i64
      func.call @stack_push_pointer(%1806) : (i64) -> ()
      %1810 = func.call @stack_pop_pointer() : () -> i64
      %1811 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1812 = arith.constant 3 : i64
      %1813 = func.call @cc_make_string(%1811, %1812) : (!llvm.ptr, i64) -> i64
      %1814 = func.call @cc_nil_value() : () -> i64
      %1815 = func.call @cc_intern(%1813, %1814) : (i64, i64) -> i64
      %1816 = func.call @cc_nil_value() : () -> i64
      %1817 = func.call @cc_cons(%1815, %1816) : (i64, i64) -> i64
      %1818 = func.call @cc_values_pack(%1817) : (i64) -> i64
      func.call @stack_push_pointer(%1815) : (i64) -> ()
      %1819 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1820 = arith.constant 3 : i64
      %1821 = func.call @cc_make_string(%1819, %1820) : (!llvm.ptr, i64) -> i64
      %1822 = func.call @cc_nil_value() : () -> i64
      %1823 = func.call @cc_intern(%1821, %1822) : (i64, i64) -> i64
      %1824 = func.call @cc_nil_value() : () -> i64
      %1825 = func.call @cc_cons(%1823, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_values_pack(%1825) : (i64) -> i64
      func.call @stack_push_pointer(%1823) : (i64) -> ()
      %1827 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1828 = arith.constant 17 : i64
      %1829 = func.call @cc_make_string(%1827, %1828) : (!llvm.ptr, i64) -> i64
      %1830 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1831 = arith.constant 3 : i64
      %1832 = func.call @cc_make_string(%1830, %1831) : (!llvm.ptr, i64) -> i64
      %1833 = func.call @cc_intern(%1829, %1832) : (i64, i64) -> i64
      %1834 = func.call @cc_nil_value() : () -> i64
      %1835 = func.call @cc_cons(%1833, %1834) : (i64, i64) -> i64
      %1836 = func.call @cc_values_pack(%1835) : (i64) -> i64
      func.call @stack_push_pointer(%1833) : (i64) -> ()
      %1837 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1838 = arith.constant 5 : i64
      %1839 = func.call @cc_make_string(%1837, %1838) : (!llvm.ptr, i64) -> i64
      %1840 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1841 = arith.constant 11 : i64
      %1842 = func.call @cc_make_string(%1840, %1841) : (!llvm.ptr, i64) -> i64
      %1843 = func.call @cc_intern(%1839, %1842) : (i64, i64) -> i64
      %1844 = func.call @cc_nil_value() : () -> i64
      %1845 = func.call @cc_cons(%1843, %1844) : (i64, i64) -> i64
      %1846 = func.call @cc_values_pack(%1845) : (i64) -> i64
      func.call @stack_push_pointer(%1843) : (i64) -> ()
      %1847 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1848 = arith.constant 15 : i64
      %1849 = func.call @cc_make_string(%1847, %1848) : (!llvm.ptr, i64) -> i64
      %1850 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1851 = arith.constant 3 : i64
      %1852 = func.call @cc_make_string(%1850, %1851) : (!llvm.ptr, i64) -> i64
      %1853 = func.call @cc_intern(%1849, %1852) : (i64, i64) -> i64
      %1854 = func.call @cc_nil_value() : () -> i64
      %1855 = func.call @cc_cons(%1853, %1854) : (i64, i64) -> i64
      %1856 = func.call @cc_values_pack(%1855) : (i64) -> i64
      func.call @stack_push_pointer(%1853) : (i64) -> ()
      %1857 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1858 = arith.constant 8 : i64
      %1859 = func.call @cc_make_string(%1857, %1858) : (!llvm.ptr, i64) -> i64
      %1860 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1861 = arith.constant 11 : i64
      %1862 = func.call @cc_make_string(%1860, %1861) : (!llvm.ptr, i64) -> i64
      %1863 = func.call @cc_intern(%1859, %1862) : (i64, i64) -> i64
      %1864 = func.call @cc_nil_value() : () -> i64
      %1865 = func.call @cc_cons(%1863, %1864) : (i64, i64) -> i64
      %1866 = func.call @cc_values_pack(%1865) : (i64) -> i64
      func.call @stack_push_pointer(%1863) : (i64) -> ()
      %1867 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1868 = arith.constant 19 : i64
      %1869 = func.call @cc_make_string(%1867, %1868) : (!llvm.ptr, i64) -> i64
      %1870 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1871 = arith.constant 11 : i64
      %1872 = func.call @cc_make_string(%1870, %1871) : (!llvm.ptr, i64) -> i64
      %1873 = func.call @cc_intern(%1869, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_nil_value() : () -> i64
      %1875 = func.call @cc_cons(%1873, %1874) : (i64, i64) -> i64
      %1876 = func.call @cc_values_pack(%1875) : (i64) -> i64
      func.call @stack_push_pointer(%1873) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1877 = func.call @stack_pop_pointer() : () -> i64
      %1878 = func.call @stack_pop_pointer() : () -> i64
      %1879 = func.call @cc_cons(%1878, %1877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1879) : (i64) -> ()
      %1880 = func.call @stack_pop_pointer() : () -> i64
      %1881 = func.call @stack_pop_pointer() : () -> i64
      %1882 = func.call @cc_cons(%1881, %1880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1882) : (i64) -> ()
      %1883 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1883) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1884 = func.call @stack_pop_pointer() : () -> i64
      %1885 = func.call @stack_pop_pointer() : () -> i64
      %1886 = func.call @cc_cons(%1885, %1884) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1886) : (i64) -> ()
      %1887 = func.call @stack_pop_pointer() : () -> i64
      %1888 = func.call @stack_pop_pointer() : () -> i64
      %1889 = func.call @cc_cons(%1888, %1887) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1889) : (i64) -> ()
      %1890 = func.call @stack_pop_pointer() : () -> i64
      %1891 = func.call @stack_pop_pointer() : () -> i64
      %1892 = func.call @cc_cons(%1891, %1890) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1892) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1893 = func.call @stack_pop_pointer() : () -> i64
      %1894 = func.call @stack_pop_pointer() : () -> i64
      %1895 = func.call @cc_cons(%1894, %1893) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1895) : (i64) -> ()
      %1896 = func.call @stack_pop_pointer() : () -> i64
      %1897 = func.call @stack_pop_pointer() : () -> i64
      %1898 = func.call @cc_cons(%1897, %1896) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1898) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1899 = func.call @stack_pop_pointer() : () -> i64
      %1900 = func.call @stack_pop_pointer() : () -> i64
      %1901 = func.call @cc_cons(%1900, %1899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1901) : (i64) -> ()
      %1902 = func.call @stack_pop_pointer() : () -> i64
      %1903 = func.call @stack_pop_pointer() : () -> i64
      %1904 = func.call @cc_cons(%1903, %1902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1904) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1905 = func.call @stack_pop_pointer() : () -> i64
      %1906 = func.call @stack_pop_pointer() : () -> i64
      %1907 = func.call @cc_cons(%1906, %1905) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1907) : (i64) -> ()
      %1908 = func.call @stack_pop_pointer() : () -> i64
      %1909 = func.call @stack_pop_pointer() : () -> i64
      %1910 = func.call @cc_cons(%1909, %1908) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1910) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1911 = func.call @stack_pop_pointer() : () -> i64
      %1912 = func.call @stack_pop_pointer() : () -> i64
      %1913 = func.call @cc_cons(%1912, %1911) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1913) : (i64) -> ()
      %1914 = func.call @stack_pop_pointer() : () -> i64
      %1915 = func.call @stack_pop_pointer() : () -> i64
      %1916 = func.call @cc_cons(%1915, %1914) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1916) : (i64) -> ()
      %1917 = func.call @stack_pop_pointer() : () -> i64
      %1965 = arith.constant 261322017079303 : i64
      %1966 = arith.constant 0 : i64
      %1967 = func.call @cc_make_closure(%1965, %1966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1967) : (i64) -> ()
      %1968 = func.call @stack_pop_pointer() : () -> i64
      %1969 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1970 = arith.constant 1 : i64
      %1971 = func.call @cc_make_string(%1969, %1970) : (!llvm.ptr, i64) -> i64
      %1972 = func.call @cc_nil_value() : () -> i64
      %1973 = func.call @cc_intern(%1971, %1972) : (i64, i64) -> i64
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
      %1981 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1982 = arith.constant 11 : i64
      %1983 = func.call @cc_make_string(%1981, %1982) : (!llvm.ptr, i64) -> i64
      %1984 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1985 = arith.constant 7 : i64
      %1986 = func.call @cc_make_string(%1984, %1985) : (!llvm.ptr, i64) -> i64
      %1987 = func.call @cc_intern(%1983, %1986) : (i64, i64) -> i64
      %1988 = func.call @cc_nil_value() : () -> i64
      %1989 = func.call @cc_cons(%1987, %1988) : (i64, i64) -> i64
      %1990 = func.call @cc_values_pack(%1989) : (i64) -> i64
      func.call @stack_push_pointer(%1987) : (i64) -> ()
      %1991 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1992 = func.call @stack_pop_pointer() : () -> i64
      %1993 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1994 = arith.constant 4 : i64
      %1995 = func.call @cc_make_string(%1993, %1994) : (!llvm.ptr, i64) -> i64
      %1996 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1997 = arith.constant 7 : i64
      %1998 = func.call @cc_make_string(%1996, %1997) : (!llvm.ptr, i64) -> i64
      %1999 = func.call @cc_intern(%1995, %1998) : (i64, i64) -> i64
      %2000 = func.call @cc_nil_value() : () -> i64
      %2001 = func.call @cc_cons(%1999, %2000) : (i64, i64) -> i64
      %2002 = func.call @cc_values_pack(%2001) : (i64) -> i64
      func.call @stack_push_pointer(%1999) : (i64) -> ()
      %2003 = func.call @stack_pop_pointer() : () -> i64
      %2004 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2005 = arith.constant 6 : i64
      %2006 = func.call @cc_make_string(%2004, %2005) : (!llvm.ptr, i64) -> i64
      %2007 = func.call @cc_nil_value() : () -> i64
      %2008 = func.call @cc_intern(%2006, %2007) : (i64, i64) -> i64
      %2009 = func.call @cc_nil_value() : () -> i64
      %2010 = func.call @cc_cons(%2008, %2009) : (i64, i64) -> i64
      %2011 = func.call @cc_values_pack(%2010) : (i64) -> i64
      func.call @stack_push_pointer(%2008) : (i64) -> ()
      %2012 = func.call @stack_pop_pointer() : () -> i64
      %2013 = func.call @cc_nil_value() : () -> i64
      %2014 = func.call @cc_errorp(%1810) : (i64) -> i64
      %2015 = arith.cmpi ne, %2014, %2013 : i64
      %2016 = arith.cmpi eq, %2013, %2013 : i64
      %2017 = arith.andi %2015, %2016 : i1
      %2018 = scf.if %2017 -> (i64) {
        scf.yield %1810 : i64
      } else {
        scf.yield %2013 : i64
      }
      %2019 = func.call @cc_errorp(%1917) : (i64) -> i64
      %2020 = arith.cmpi ne, %2019, %2013 : i64
      %2021 = arith.cmpi eq, %2018, %2013 : i64
      %2022 = arith.andi %2020, %2021 : i1
      %2023 = scf.if %2022 -> (i64) {
        scf.yield %1917 : i64
      } else {
        scf.yield %2018 : i64
      }
      %2024 = func.call @cc_errorp(%1968) : (i64) -> i64
      %2025 = arith.cmpi ne, %2024, %2013 : i64
      %2026 = arith.cmpi eq, %2023, %2013 : i64
      %2027 = arith.andi %2025, %2026 : i1
      %2028 = scf.if %2027 -> (i64) {
        scf.yield %1968 : i64
      } else {
        scf.yield %2023 : i64
      }
      %2029 = func.call @cc_errorp(%1980) : (i64) -> i64
      %2030 = arith.cmpi ne, %2029, %2013 : i64
      %2031 = arith.cmpi eq, %2028, %2013 : i64
      %2032 = arith.andi %2030, %2031 : i1
      %2033 = scf.if %2032 -> (i64) {
        scf.yield %1980 : i64
      } else {
        scf.yield %2028 : i64
      }
      %2034 = func.call @cc_errorp(%1991) : (i64) -> i64
      %2035 = arith.cmpi ne, %2034, %2013 : i64
      %2036 = arith.cmpi eq, %2033, %2013 : i64
      %2037 = arith.andi %2035, %2036 : i1
      %2038 = scf.if %2037 -> (i64) {
        scf.yield %1991 : i64
      } else {
        scf.yield %2033 : i64
      }
      %2039 = func.call @cc_errorp(%1992) : (i64) -> i64
      %2040 = arith.cmpi ne, %2039, %2013 : i64
      %2041 = arith.cmpi eq, %2038, %2013 : i64
      %2042 = arith.andi %2040, %2041 : i1
      %2043 = scf.if %2042 -> (i64) {
        scf.yield %1992 : i64
      } else {
        scf.yield %2038 : i64
      }
      %2044 = func.call @cc_errorp(%2003) : (i64) -> i64
      %2045 = arith.cmpi ne, %2044, %2013 : i64
      %2046 = arith.cmpi eq, %2043, %2013 : i64
      %2047 = arith.andi %2045, %2046 : i1
      %2048 = scf.if %2047 -> (i64) {
        scf.yield %2003 : i64
      } else {
        scf.yield %2043 : i64
      }
      %2049 = func.call @cc_errorp(%2012) : (i64) -> i64
      %2050 = arith.cmpi ne, %2049, %2013 : i64
      %2051 = arith.cmpi eq, %2048, %2013 : i64
      %2052 = arith.andi %2050, %2051 : i1
      %2053 = scf.if %2052 -> (i64) {
        scf.yield %2012 : i64
      } else {
        scf.yield %2048 : i64
      }
      %2054 = arith.cmpi ne, %2053, %2013 : i64
      scf.if %2054 {
        func.call @stack_push_pointer(%2053) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1810) : (i64) -> ()
        func.call @stack_push_pointer(%1917) : (i64) -> ()
        func.call @stack_push_pointer(%1968) : (i64) -> ()
        func.call @stack_push_pointer(%1980) : (i64) -> ()
        func.call @stack_push_pointer(%1991) : (i64) -> ()
        func.call @stack_push_pointer(%1992) : (i64) -> ()
        func.call @stack_push_pointer(%2003) : (i64) -> ()
        func.call @stack_push_pointer(%2012) : (i64) -> ()
        %2055 = llvm.mlir.addressof @str192 : !llvm.ptr
        %2056 = func.call @cc_make_function_ref_const(%2055) : (!llvm.ptr) -> i64
        %2057 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2056, %2057) : (i64, i64) -> ()
      }
      %2058 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2058 : i64
    }
    %2059 = func.call @cc_nil_value() : () -> i64
    %2060 = func.call @cc_errorp(%1801) : (i64) -> i64
    %2061 = arith.cmpi ne, %2060, %2059 : i64
    %2062 = scf.if %2061 -> (i64) {
      scf.yield %1801 : i64
    } else {
      %2063 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2064 = arith.constant 20 : i64
      %2065 = func.call @cc_make_string(%2063, %2064) : (!llvm.ptr, i64) -> i64
      %2066 = func.call @cc_nil_value() : () -> i64
      %2067 = func.call @cc_intern(%2065, %2066) : (i64, i64) -> i64
      %2068 = func.call @cc_nil_value() : () -> i64
      %2069 = func.call @cc_cons(%2067, %2068) : (i64, i64) -> i64
      %2070 = func.call @cc_values_pack(%2069) : (i64) -> i64
      func.call @stack_push_pointer(%2067) : (i64) -> ()
      %2071 = func.call @stack_pop_pointer() : () -> i64
      %2072 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2073 = arith.constant 3 : i64
      %2074 = func.call @cc_make_string(%2072, %2073) : (!llvm.ptr, i64) -> i64
      %2075 = func.call @cc_nil_value() : () -> i64
      %2076 = func.call @cc_intern(%2074, %2075) : (i64, i64) -> i64
      %2077 = func.call @cc_nil_value() : () -> i64
      %2078 = func.call @cc_cons(%2076, %2077) : (i64, i64) -> i64
      %2079 = func.call @cc_values_pack(%2078) : (i64) -> i64
      func.call @stack_push_pointer(%2076) : (i64) -> ()
      %2080 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2081 = arith.constant 3 : i64
      %2082 = func.call @cc_make_string(%2080, %2081) : (!llvm.ptr, i64) -> i64
      %2083 = func.call @cc_nil_value() : () -> i64
      %2084 = func.call @cc_intern(%2082, %2083) : (i64, i64) -> i64
      %2085 = func.call @cc_nil_value() : () -> i64
      %2086 = func.call @cc_cons(%2084, %2085) : (i64, i64) -> i64
      %2087 = func.call @cc_values_pack(%2086) : (i64) -> i64
      func.call @stack_push_pointer(%2084) : (i64) -> ()
      %2088 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2089 = arith.constant 17 : i64
      %2090 = func.call @cc_make_string(%2088, %2089) : (!llvm.ptr, i64) -> i64
      %2091 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2092 = arith.constant 3 : i64
      %2093 = func.call @cc_make_string(%2091, %2092) : (!llvm.ptr, i64) -> i64
      %2094 = func.call @cc_intern(%2090, %2093) : (i64, i64) -> i64
      %2095 = func.call @cc_nil_value() : () -> i64
      %2096 = func.call @cc_cons(%2094, %2095) : (i64, i64) -> i64
      %2097 = func.call @cc_values_pack(%2096) : (i64) -> i64
      func.call @stack_push_pointer(%2094) : (i64) -> ()
      %2098 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2099 = arith.constant 5 : i64
      %2100 = func.call @cc_make_string(%2098, %2099) : (!llvm.ptr, i64) -> i64
      %2101 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2102 = arith.constant 11 : i64
      %2103 = func.call @cc_make_string(%2101, %2102) : (!llvm.ptr, i64) -> i64
      %2104 = func.call @cc_intern(%2100, %2103) : (i64, i64) -> i64
      %2105 = func.call @cc_nil_value() : () -> i64
      %2106 = func.call @cc_cons(%2104, %2105) : (i64, i64) -> i64
      %2107 = func.call @cc_values_pack(%2106) : (i64) -> i64
      func.call @stack_push_pointer(%2104) : (i64) -> ()
      %2108 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2109 = arith.constant 15 : i64
      %2110 = func.call @cc_make_string(%2108, %2109) : (!llvm.ptr, i64) -> i64
      %2111 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2112 = arith.constant 3 : i64
      %2113 = func.call @cc_make_string(%2111, %2112) : (!llvm.ptr, i64) -> i64
      %2114 = func.call @cc_intern(%2110, %2113) : (i64, i64) -> i64
      %2115 = func.call @cc_nil_value() : () -> i64
      %2116 = func.call @cc_cons(%2114, %2115) : (i64, i64) -> i64
      %2117 = func.call @cc_values_pack(%2116) : (i64) -> i64
      func.call @stack_push_pointer(%2114) : (i64) -> ()
      %2118 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2118) : (i64) -> ()
      %2119 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2120 = arith.constant 6 : i64
      %2121 = func.call @cc_make_string(%2119, %2120) : (!llvm.ptr, i64) -> i64
      %2122 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2123 = arith.constant 11 : i64
      %2124 = func.call @cc_make_string(%2122, %2123) : (!llvm.ptr, i64) -> i64
      %2125 = func.call @cc_intern(%2121, %2124) : (i64, i64) -> i64
      %2126 = func.call @cc_nil_value() : () -> i64
      %2127 = func.call @cc_cons(%2125, %2126) : (i64, i64) -> i64
      %2128 = func.call @cc_values_pack(%2127) : (i64) -> i64
      func.call @stack_push_pointer(%2125) : (i64) -> ()
      %2129 = func.call @stack_pop_pointer() : () -> i64
      %2130 = func.call @stack_pop_pointer() : () -> i64
      %2131 = func.call @cc_cons(%2129, %2130) : (i64, i64) -> i64
      %2132 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2133 = arith.constant 5 : i64
      %2134 = func.call @cc_make_string(%2132, %2133) : (!llvm.ptr, i64) -> i64
      %2135 = func.call @cc_nil_value() : () -> i64
      %2136 = func.call @cc_intern(%2134, %2135) : (i64, i64) -> i64
      %2137 = func.call @cc_nil_value() : () -> i64
      %2138 = func.call @cc_cons(%2136, %2137) : (i64, i64) -> i64
      %2139 = func.call @cc_values_pack(%2138) : (i64) -> i64
      %2140 = func.call @cc_cons(%2136, %2131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2140) : (i64) -> ()
      %2141 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2142 = arith.constant 4 : i64
      %2143 = func.call @cc_make_string(%2141, %2142) : (!llvm.ptr, i64) -> i64
      %2144 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2145 = arith.constant 7 : i64
      %2146 = func.call @cc_make_string(%2144, %2145) : (!llvm.ptr, i64) -> i64
      %2147 = func.call @cc_intern(%2143, %2146) : (i64, i64) -> i64
      %2148 = func.call @cc_nil_value() : () -> i64
      %2149 = func.call @cc_cons(%2147, %2148) : (i64, i64) -> i64
      %2150 = func.call @cc_values_pack(%2149) : (i64) -> i64
      func.call @stack_push_pointer(%2147) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2151 = func.call @stack_pop_pointer() : () -> i64
      %2152 = func.call @stack_pop_pointer() : () -> i64
      %2153 = func.call @cc_cons(%2152, %2151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2153) : (i64) -> ()
      %2154 = func.call @stack_pop_pointer() : () -> i64
      %2155 = func.call @stack_pop_pointer() : () -> i64
      %2156 = func.call @cc_cons(%2155, %2154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2156) : (i64) -> ()
      %2157 = func.call @stack_pop_pointer() : () -> i64
      %2158 = func.call @stack_pop_pointer() : () -> i64
      %2159 = func.call @cc_cons(%2158, %2157) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2159) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2160 = func.call @stack_pop_pointer() : () -> i64
      %2161 = func.call @stack_pop_pointer() : () -> i64
      %2162 = func.call @cc_cons(%2161, %2160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2162) : (i64) -> ()
      %2163 = func.call @stack_pop_pointer() : () -> i64
      %2164 = func.call @stack_pop_pointer() : () -> i64
      %2165 = func.call @cc_cons(%2164, %2163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2165) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2166 = func.call @stack_pop_pointer() : () -> i64
      %2167 = func.call @stack_pop_pointer() : () -> i64
      %2168 = func.call @cc_cons(%2167, %2166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2168) : (i64) -> ()
      %2169 = func.call @stack_pop_pointer() : () -> i64
      %2170 = func.call @stack_pop_pointer() : () -> i64
      %2171 = func.call @cc_cons(%2170, %2169) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2171) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2172 = func.call @stack_pop_pointer() : () -> i64
      %2173 = func.call @stack_pop_pointer() : () -> i64
      %2174 = func.call @cc_cons(%2173, %2172) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2174) : (i64) -> ()
      %2175 = func.call @stack_pop_pointer() : () -> i64
      %2176 = func.call @stack_pop_pointer() : () -> i64
      %2177 = func.call @cc_cons(%2176, %2175) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2178 = func.call @stack_pop_pointer() : () -> i64
      %2179 = func.call @stack_pop_pointer() : () -> i64
      %2180 = func.call @cc_cons(%2179, %2178) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2180) : (i64) -> ()
      %2181 = func.call @stack_pop_pointer() : () -> i64
      %2182 = func.call @stack_pop_pointer() : () -> i64
      %2183 = func.call @cc_cons(%2182, %2181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2183) : (i64) -> ()
      %2184 = func.call @stack_pop_pointer() : () -> i64
      %2249 = arith.constant 261322017079304 : i64
      %2250 = arith.constant 0 : i64
      %2251 = func.call @cc_make_closure(%2249, %2250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2251) : (i64) -> ()
      %2252 = func.call @stack_pop_pointer() : () -> i64
      %2253 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2254 = arith.constant 1 : i64
      %2255 = func.call @cc_make_string(%2253, %2254) : (!llvm.ptr, i64) -> i64
      %2256 = func.call @cc_nil_value() : () -> i64
      %2257 = func.call @cc_intern(%2255, %2256) : (i64, i64) -> i64
      %2258 = func.call @cc_nil_value() : () -> i64
      %2259 = func.call @cc_cons(%2257, %2258) : (i64, i64) -> i64
      %2260 = func.call @cc_values_pack(%2259) : (i64) -> i64
      func.call @stack_push_pointer(%2257) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2261 = func.call @stack_pop_pointer() : () -> i64
      %2262 = func.call @stack_pop_pointer() : () -> i64
      %2263 = func.call @cc_cons(%2262, %2261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2263) : (i64) -> ()
      %2264 = func.call @stack_pop_pointer() : () -> i64
      %2265 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2266 = arith.constant 11 : i64
      %2267 = func.call @cc_make_string(%2265, %2266) : (!llvm.ptr, i64) -> i64
      %2268 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2269 = arith.constant 7 : i64
      %2270 = func.call @cc_make_string(%2268, %2269) : (!llvm.ptr, i64) -> i64
      %2271 = func.call @cc_intern(%2267, %2270) : (i64, i64) -> i64
      %2272 = func.call @cc_nil_value() : () -> i64
      %2273 = func.call @cc_cons(%2271, %2272) : (i64, i64) -> i64
      %2274 = func.call @cc_values_pack(%2273) : (i64) -> i64
      func.call @stack_push_pointer(%2271) : (i64) -> ()
      %2275 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2276 = func.call @stack_pop_pointer() : () -> i64
      %2277 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2278 = arith.constant 4 : i64
      %2279 = func.call @cc_make_string(%2277, %2278) : (!llvm.ptr, i64) -> i64
      %2280 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2281 = arith.constant 7 : i64
      %2282 = func.call @cc_make_string(%2280, %2281) : (!llvm.ptr, i64) -> i64
      %2283 = func.call @cc_intern(%2279, %2282) : (i64, i64) -> i64
      %2284 = func.call @cc_nil_value() : () -> i64
      %2285 = func.call @cc_cons(%2283, %2284) : (i64, i64) -> i64
      %2286 = func.call @cc_values_pack(%2285) : (i64) -> i64
      func.call @stack_push_pointer(%2283) : (i64) -> ()
      %2287 = func.call @stack_pop_pointer() : () -> i64
      %2288 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2289 = arith.constant 6 : i64
      %2290 = func.call @cc_make_string(%2288, %2289) : (!llvm.ptr, i64) -> i64
      %2291 = func.call @cc_nil_value() : () -> i64
      %2292 = func.call @cc_intern(%2290, %2291) : (i64, i64) -> i64
      %2293 = func.call @cc_nil_value() : () -> i64
      %2294 = func.call @cc_cons(%2292, %2293) : (i64, i64) -> i64
      %2295 = func.call @cc_values_pack(%2294) : (i64) -> i64
      func.call @stack_push_pointer(%2292) : (i64) -> ()
      %2296 = func.call @stack_pop_pointer() : () -> i64
      %2297 = func.call @cc_nil_value() : () -> i64
      %2298 = func.call @cc_errorp(%2071) : (i64) -> i64
      %2299 = arith.cmpi ne, %2298, %2297 : i64
      %2300 = arith.cmpi eq, %2297, %2297 : i64
      %2301 = arith.andi %2299, %2300 : i1
      %2302 = scf.if %2301 -> (i64) {
        scf.yield %2071 : i64
      } else {
        scf.yield %2297 : i64
      }
      %2303 = func.call @cc_errorp(%2184) : (i64) -> i64
      %2304 = arith.cmpi ne, %2303, %2297 : i64
      %2305 = arith.cmpi eq, %2302, %2297 : i64
      %2306 = arith.andi %2304, %2305 : i1
      %2307 = scf.if %2306 -> (i64) {
        scf.yield %2184 : i64
      } else {
        scf.yield %2302 : i64
      }
      %2308 = func.call @cc_errorp(%2252) : (i64) -> i64
      %2309 = arith.cmpi ne, %2308, %2297 : i64
      %2310 = arith.cmpi eq, %2307, %2297 : i64
      %2311 = arith.andi %2309, %2310 : i1
      %2312 = scf.if %2311 -> (i64) {
        scf.yield %2252 : i64
      } else {
        scf.yield %2307 : i64
      }
      %2313 = func.call @cc_errorp(%2264) : (i64) -> i64
      %2314 = arith.cmpi ne, %2313, %2297 : i64
      %2315 = arith.cmpi eq, %2312, %2297 : i64
      %2316 = arith.andi %2314, %2315 : i1
      %2317 = scf.if %2316 -> (i64) {
        scf.yield %2264 : i64
      } else {
        scf.yield %2312 : i64
      }
      %2318 = func.call @cc_errorp(%2275) : (i64) -> i64
      %2319 = arith.cmpi ne, %2318, %2297 : i64
      %2320 = arith.cmpi eq, %2317, %2297 : i64
      %2321 = arith.andi %2319, %2320 : i1
      %2322 = scf.if %2321 -> (i64) {
        scf.yield %2275 : i64
      } else {
        scf.yield %2317 : i64
      }
      %2323 = func.call @cc_errorp(%2276) : (i64) -> i64
      %2324 = arith.cmpi ne, %2323, %2297 : i64
      %2325 = arith.cmpi eq, %2322, %2297 : i64
      %2326 = arith.andi %2324, %2325 : i1
      %2327 = scf.if %2326 -> (i64) {
        scf.yield %2276 : i64
      } else {
        scf.yield %2322 : i64
      }
      %2328 = func.call @cc_errorp(%2287) : (i64) -> i64
      %2329 = arith.cmpi ne, %2328, %2297 : i64
      %2330 = arith.cmpi eq, %2327, %2297 : i64
      %2331 = arith.andi %2329, %2330 : i1
      %2332 = scf.if %2331 -> (i64) {
        scf.yield %2287 : i64
      } else {
        scf.yield %2327 : i64
      }
      %2333 = func.call @cc_errorp(%2296) : (i64) -> i64
      %2334 = arith.cmpi ne, %2333, %2297 : i64
      %2335 = arith.cmpi eq, %2332, %2297 : i64
      %2336 = arith.andi %2334, %2335 : i1
      %2337 = scf.if %2336 -> (i64) {
        scf.yield %2296 : i64
      } else {
        scf.yield %2332 : i64
      }
      %2338 = arith.cmpi ne, %2337, %2297 : i64
      scf.if %2338 {
        func.call @stack_push_pointer(%2337) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2071) : (i64) -> ()
        func.call @stack_push_pointer(%2184) : (i64) -> ()
        func.call @stack_push_pointer(%2252) : (i64) -> ()
        func.call @stack_push_pointer(%2264) : (i64) -> ()
        func.call @stack_push_pointer(%2275) : (i64) -> ()
        func.call @stack_push_pointer(%2276) : (i64) -> ()
        func.call @stack_push_pointer(%2287) : (i64) -> ()
        func.call @stack_push_pointer(%2296) : (i64) -> ()
        %2339 = llvm.mlir.addressof @str219 : !llvm.ptr
        %2340 = func.call @cc_make_function_ref_const(%2339) : (!llvm.ptr) -> i64
        %2341 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2340, %2341) : (i64, i64) -> ()
      }
      %2342 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2342 : i64
    }
    %2343 = func.call @cc_nil_value() : () -> i64
    %2344 = func.call @cc_errorp(%2062) : (i64) -> i64
    %2345 = arith.cmpi ne, %2344, %2343 : i64
    %2346 = scf.if %2345 -> (i64) {
      scf.yield %2062 : i64
    } else {
      %2347 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2348 = arith.constant 24 : i64
      %2349 = func.call @cc_make_string(%2347, %2348) : (!llvm.ptr, i64) -> i64
      %2350 = func.call @cc_nil_value() : () -> i64
      %2351 = func.call @cc_intern(%2349, %2350) : (i64, i64) -> i64
      %2352 = func.call @cc_nil_value() : () -> i64
      %2353 = func.call @cc_cons(%2351, %2352) : (i64, i64) -> i64
      %2354 = func.call @cc_values_pack(%2353) : (i64) -> i64
      func.call @stack_push_pointer(%2351) : (i64) -> ()
      %2355 = func.call @stack_pop_pointer() : () -> i64
      %2356 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2357 = arith.constant 3 : i64
      %2358 = func.call @cc_make_string(%2356, %2357) : (!llvm.ptr, i64) -> i64
      %2359 = func.call @cc_nil_value() : () -> i64
      %2360 = func.call @cc_intern(%2358, %2359) : (i64, i64) -> i64
      %2361 = func.call @cc_nil_value() : () -> i64
      %2362 = func.call @cc_cons(%2360, %2361) : (i64, i64) -> i64
      %2363 = func.call @cc_values_pack(%2362) : (i64) -> i64
      func.call @stack_push_pointer(%2360) : (i64) -> ()
      %2364 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2365 = arith.constant 3 : i64
      %2366 = func.call @cc_make_string(%2364, %2365) : (!llvm.ptr, i64) -> i64
      %2367 = func.call @cc_nil_value() : () -> i64
      %2368 = func.call @cc_intern(%2366, %2367) : (i64, i64) -> i64
      %2369 = func.call @cc_nil_value() : () -> i64
      %2370 = func.call @cc_cons(%2368, %2369) : (i64, i64) -> i64
      %2371 = func.call @cc_values_pack(%2370) : (i64) -> i64
      func.call @stack_push_pointer(%2368) : (i64) -> ()
      %2372 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2373 = arith.constant 17 : i64
      %2374 = func.call @cc_make_string(%2372, %2373) : (!llvm.ptr, i64) -> i64
      %2375 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2376 = arith.constant 3 : i64
      %2377 = func.call @cc_make_string(%2375, %2376) : (!llvm.ptr, i64) -> i64
      %2378 = func.call @cc_intern(%2374, %2377) : (i64, i64) -> i64
      %2379 = func.call @cc_nil_value() : () -> i64
      %2380 = func.call @cc_cons(%2378, %2379) : (i64, i64) -> i64
      %2381 = func.call @cc_values_pack(%2380) : (i64) -> i64
      func.call @stack_push_pointer(%2378) : (i64) -> ()
      %2382 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2383 = arith.constant 5 : i64
      %2384 = func.call @cc_make_string(%2382, %2383) : (!llvm.ptr, i64) -> i64
      %2385 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2386 = arith.constant 11 : i64
      %2387 = func.call @cc_make_string(%2385, %2386) : (!llvm.ptr, i64) -> i64
      %2388 = func.call @cc_intern(%2384, %2387) : (i64, i64) -> i64
      %2389 = func.call @cc_nil_value() : () -> i64
      %2390 = func.call @cc_cons(%2388, %2389) : (i64, i64) -> i64
      %2391 = func.call @cc_values_pack(%2390) : (i64) -> i64
      func.call @stack_push_pointer(%2388) : (i64) -> ()
      %2392 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2393 = arith.constant 15 : i64
      %2394 = func.call @cc_make_string(%2392, %2393) : (!llvm.ptr, i64) -> i64
      %2395 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2396 = arith.constant 3 : i64
      %2397 = func.call @cc_make_string(%2395, %2396) : (!llvm.ptr, i64) -> i64
      %2398 = func.call @cc_intern(%2394, %2397) : (i64, i64) -> i64
      %2399 = func.call @cc_nil_value() : () -> i64
      %2400 = func.call @cc_cons(%2398, %2399) : (i64, i64) -> i64
      %2401 = func.call @cc_values_pack(%2400) : (i64) -> i64
      func.call @stack_push_pointer(%2398) : (i64) -> ()
      %2402 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2402) : (i64) -> ()
      %2403 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2404 = arith.constant 14 : i64
      %2405 = func.call @cc_make_string(%2403, %2404) : (!llvm.ptr, i64) -> i64
      %2406 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2407 = arith.constant 11 : i64
      %2408 = func.call @cc_make_string(%2406, %2407) : (!llvm.ptr, i64) -> i64
      %2409 = func.call @cc_intern(%2405, %2408) : (i64, i64) -> i64
      %2410 = func.call @cc_nil_value() : () -> i64
      %2411 = func.call @cc_cons(%2409, %2410) : (i64, i64) -> i64
      %2412 = func.call @cc_values_pack(%2411) : (i64) -> i64
      func.call @stack_push_pointer(%2409) : (i64) -> ()
      %2413 = func.call @stack_pop_pointer() : () -> i64
      %2414 = func.call @stack_pop_pointer() : () -> i64
      %2415 = func.call @cc_cons(%2413, %2414) : (i64, i64) -> i64
      %2416 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2417 = arith.constant 5 : i64
      %2418 = func.call @cc_make_string(%2416, %2417) : (!llvm.ptr, i64) -> i64
      %2419 = func.call @cc_nil_value() : () -> i64
      %2420 = func.call @cc_intern(%2418, %2419) : (i64, i64) -> i64
      %2421 = func.call @cc_nil_value() : () -> i64
      %2422 = func.call @cc_cons(%2420, %2421) : (i64, i64) -> i64
      %2423 = func.call @cc_values_pack(%2422) : (i64) -> i64
      %2424 = func.call @cc_cons(%2420, %2415) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2424) : (i64) -> ()
      %2425 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2426 = arith.constant 8 : i64
      %2427 = func.call @cc_make_string(%2425, %2426) : (!llvm.ptr, i64) -> i64
      %2428 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2429 = arith.constant 7 : i64
      %2430 = func.call @cc_make_string(%2428, %2429) : (!llvm.ptr, i64) -> i64
      %2431 = func.call @cc_intern(%2427, %2430) : (i64, i64) -> i64
      %2432 = func.call @cc_nil_value() : () -> i64
      %2433 = func.call @cc_cons(%2431, %2432) : (i64, i64) -> i64
      %2434 = func.call @cc_values_pack(%2433) : (i64) -> i64
      func.call @stack_push_pointer(%2431) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2435 = func.call @stack_pop_pointer() : () -> i64
      %2436 = func.call @stack_pop_pointer() : () -> i64
      %2437 = func.call @cc_cons(%2436, %2435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2437) : (i64) -> ()
      %2438 = func.call @stack_pop_pointer() : () -> i64
      %2439 = func.call @stack_pop_pointer() : () -> i64
      %2440 = func.call @cc_cons(%2439, %2438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2440) : (i64) -> ()
      %2441 = func.call @stack_pop_pointer() : () -> i64
      %2442 = func.call @stack_pop_pointer() : () -> i64
      %2443 = func.call @cc_cons(%2442, %2441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2443) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2444 = func.call @stack_pop_pointer() : () -> i64
      %2445 = func.call @stack_pop_pointer() : () -> i64
      %2446 = func.call @cc_cons(%2445, %2444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2446) : (i64) -> ()
      %2447 = func.call @stack_pop_pointer() : () -> i64
      %2448 = func.call @stack_pop_pointer() : () -> i64
      %2449 = func.call @cc_cons(%2448, %2447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2449) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2450 = func.call @stack_pop_pointer() : () -> i64
      %2451 = func.call @stack_pop_pointer() : () -> i64
      %2452 = func.call @cc_cons(%2451, %2450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2452) : (i64) -> ()
      %2453 = func.call @stack_pop_pointer() : () -> i64
      %2454 = func.call @stack_pop_pointer() : () -> i64
      %2455 = func.call @cc_cons(%2454, %2453) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2455) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2456 = func.call @stack_pop_pointer() : () -> i64
      %2457 = func.call @stack_pop_pointer() : () -> i64
      %2458 = func.call @cc_cons(%2457, %2456) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2458) : (i64) -> ()
      %2459 = func.call @stack_pop_pointer() : () -> i64
      %2460 = func.call @stack_pop_pointer() : () -> i64
      %2461 = func.call @cc_cons(%2460, %2459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2461) : (i64) -> ()
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
      %2533 = arith.constant 261322017079305 : i64
      %2534 = arith.constant 0 : i64
      %2535 = func.call @cc_make_closure(%2533, %2534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2535) : (i64) -> ()
      %2536 = func.call @stack_pop_pointer() : () -> i64
      %2537 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2538 = arith.constant 1 : i64
      %2539 = func.call @cc_make_string(%2537, %2538) : (!llvm.ptr, i64) -> i64
      %2540 = func.call @cc_nil_value() : () -> i64
      %2541 = func.call @cc_intern(%2539, %2540) : (i64, i64) -> i64
      %2542 = func.call @cc_nil_value() : () -> i64
      %2543 = func.call @cc_cons(%2541, %2542) : (i64, i64) -> i64
      %2544 = func.call @cc_values_pack(%2543) : (i64) -> i64
      func.call @stack_push_pointer(%2541) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2545 = func.call @stack_pop_pointer() : () -> i64
      %2546 = func.call @stack_pop_pointer() : () -> i64
      %2547 = func.call @cc_cons(%2546, %2545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2547) : (i64) -> ()
      %2548 = func.call @stack_pop_pointer() : () -> i64
      %2549 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2550 = arith.constant 11 : i64
      %2551 = func.call @cc_make_string(%2549, %2550) : (!llvm.ptr, i64) -> i64
      %2552 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2553 = arith.constant 7 : i64
      %2554 = func.call @cc_make_string(%2552, %2553) : (!llvm.ptr, i64) -> i64
      %2555 = func.call @cc_intern(%2551, %2554) : (i64, i64) -> i64
      %2556 = func.call @cc_nil_value() : () -> i64
      %2557 = func.call @cc_cons(%2555, %2556) : (i64, i64) -> i64
      %2558 = func.call @cc_values_pack(%2557) : (i64) -> i64
      func.call @stack_push_pointer(%2555) : (i64) -> ()
      %2559 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2560 = func.call @stack_pop_pointer() : () -> i64
      %2561 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2562 = arith.constant 4 : i64
      %2563 = func.call @cc_make_string(%2561, %2562) : (!llvm.ptr, i64) -> i64
      %2564 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2565 = arith.constant 7 : i64
      %2566 = func.call @cc_make_string(%2564, %2565) : (!llvm.ptr, i64) -> i64
      %2567 = func.call @cc_intern(%2563, %2566) : (i64, i64) -> i64
      %2568 = func.call @cc_nil_value() : () -> i64
      %2569 = func.call @cc_cons(%2567, %2568) : (i64, i64) -> i64
      %2570 = func.call @cc_values_pack(%2569) : (i64) -> i64
      func.call @stack_push_pointer(%2567) : (i64) -> ()
      %2571 = func.call @stack_pop_pointer() : () -> i64
      %2572 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2573 = arith.constant 6 : i64
      %2574 = func.call @cc_make_string(%2572, %2573) : (!llvm.ptr, i64) -> i64
      %2575 = func.call @cc_nil_value() : () -> i64
      %2576 = func.call @cc_intern(%2574, %2575) : (i64, i64) -> i64
      %2577 = func.call @cc_nil_value() : () -> i64
      %2578 = func.call @cc_cons(%2576, %2577) : (i64, i64) -> i64
      %2579 = func.call @cc_values_pack(%2578) : (i64) -> i64
      func.call @stack_push_pointer(%2576) : (i64) -> ()
      %2580 = func.call @stack_pop_pointer() : () -> i64
      %2581 = func.call @cc_nil_value() : () -> i64
      %2582 = func.call @cc_errorp(%2355) : (i64) -> i64
      %2583 = arith.cmpi ne, %2582, %2581 : i64
      %2584 = arith.cmpi eq, %2581, %2581 : i64
      %2585 = arith.andi %2583, %2584 : i1
      %2586 = scf.if %2585 -> (i64) {
        scf.yield %2355 : i64
      } else {
        scf.yield %2581 : i64
      }
      %2587 = func.call @cc_errorp(%2468) : (i64) -> i64
      %2588 = arith.cmpi ne, %2587, %2581 : i64
      %2589 = arith.cmpi eq, %2586, %2581 : i64
      %2590 = arith.andi %2588, %2589 : i1
      %2591 = scf.if %2590 -> (i64) {
        scf.yield %2468 : i64
      } else {
        scf.yield %2586 : i64
      }
      %2592 = func.call @cc_errorp(%2536) : (i64) -> i64
      %2593 = arith.cmpi ne, %2592, %2581 : i64
      %2594 = arith.cmpi eq, %2591, %2581 : i64
      %2595 = arith.andi %2593, %2594 : i1
      %2596 = scf.if %2595 -> (i64) {
        scf.yield %2536 : i64
      } else {
        scf.yield %2591 : i64
      }
      %2597 = func.call @cc_errorp(%2548) : (i64) -> i64
      %2598 = arith.cmpi ne, %2597, %2581 : i64
      %2599 = arith.cmpi eq, %2596, %2581 : i64
      %2600 = arith.andi %2598, %2599 : i1
      %2601 = scf.if %2600 -> (i64) {
        scf.yield %2548 : i64
      } else {
        scf.yield %2596 : i64
      }
      %2602 = func.call @cc_errorp(%2559) : (i64) -> i64
      %2603 = arith.cmpi ne, %2602, %2581 : i64
      %2604 = arith.cmpi eq, %2601, %2581 : i64
      %2605 = arith.andi %2603, %2604 : i1
      %2606 = scf.if %2605 -> (i64) {
        scf.yield %2559 : i64
      } else {
        scf.yield %2601 : i64
      }
      %2607 = func.call @cc_errorp(%2560) : (i64) -> i64
      %2608 = arith.cmpi ne, %2607, %2581 : i64
      %2609 = arith.cmpi eq, %2606, %2581 : i64
      %2610 = arith.andi %2608, %2609 : i1
      %2611 = scf.if %2610 -> (i64) {
        scf.yield %2560 : i64
      } else {
        scf.yield %2606 : i64
      }
      %2612 = func.call @cc_errorp(%2571) : (i64) -> i64
      %2613 = arith.cmpi ne, %2612, %2581 : i64
      %2614 = arith.cmpi eq, %2611, %2581 : i64
      %2615 = arith.andi %2613, %2614 : i1
      %2616 = scf.if %2615 -> (i64) {
        scf.yield %2571 : i64
      } else {
        scf.yield %2611 : i64
      }
      %2617 = func.call @cc_errorp(%2580) : (i64) -> i64
      %2618 = arith.cmpi ne, %2617, %2581 : i64
      %2619 = arith.cmpi eq, %2616, %2581 : i64
      %2620 = arith.andi %2618, %2619 : i1
      %2621 = scf.if %2620 -> (i64) {
        scf.yield %2580 : i64
      } else {
        scf.yield %2616 : i64
      }
      %2622 = arith.cmpi ne, %2621, %2581 : i64
      scf.if %2622 {
        func.call @stack_push_pointer(%2621) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2355) : (i64) -> ()
        func.call @stack_push_pointer(%2468) : (i64) -> ()
        func.call @stack_push_pointer(%2536) : (i64) -> ()
        func.call @stack_push_pointer(%2548) : (i64) -> ()
        func.call @stack_push_pointer(%2559) : (i64) -> ()
        func.call @stack_push_pointer(%2560) : (i64) -> ()
        func.call @stack_push_pointer(%2571) : (i64) -> ()
        func.call @stack_push_pointer(%2580) : (i64) -> ()
        %2623 = llvm.mlir.addressof @str246 : !llvm.ptr
        %2624 = func.call @cc_make_function_ref_const(%2623) : (!llvm.ptr) -> i64
        %2625 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2624, %2625) : (i64, i64) -> ()
      }
      %2626 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2626 : i64
    }
    %2627 = func.call @cc_nil_value() : () -> i64
    %2628 = func.call @cc_errorp(%2346) : (i64) -> i64
    %2629 = arith.cmpi ne, %2628, %2627 : i64
    %2630 = scf.if %2629 -> (i64) {
      scf.yield %2346 : i64
    } else {
      %2631 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2632 = arith.constant 23 : i64
      %2633 = func.call @cc_make_string(%2631, %2632) : (!llvm.ptr, i64) -> i64
      %2634 = func.call @cc_nil_value() : () -> i64
      %2635 = func.call @cc_intern(%2633, %2634) : (i64, i64) -> i64
      %2636 = func.call @cc_nil_value() : () -> i64
      %2637 = func.call @cc_cons(%2635, %2636) : (i64, i64) -> i64
      %2638 = func.call @cc_values_pack(%2637) : (i64) -> i64
      func.call @stack_push_pointer(%2635) : (i64) -> ()
      %2639 = func.call @stack_pop_pointer() : () -> i64
      %2640 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2641 = arith.constant 3 : i64
      %2642 = func.call @cc_make_string(%2640, %2641) : (!llvm.ptr, i64) -> i64
      %2643 = func.call @cc_nil_value() : () -> i64
      %2644 = func.call @cc_intern(%2642, %2643) : (i64, i64) -> i64
      %2645 = func.call @cc_nil_value() : () -> i64
      %2646 = func.call @cc_cons(%2644, %2645) : (i64, i64) -> i64
      %2647 = func.call @cc_values_pack(%2646) : (i64) -> i64
      func.call @stack_push_pointer(%2644) : (i64) -> ()
      %2648 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2649 = arith.constant 3 : i64
      %2650 = func.call @cc_make_string(%2648, %2649) : (!llvm.ptr, i64) -> i64
      %2651 = func.call @cc_nil_value() : () -> i64
      %2652 = func.call @cc_intern(%2650, %2651) : (i64, i64) -> i64
      %2653 = func.call @cc_nil_value() : () -> i64
      %2654 = func.call @cc_cons(%2652, %2653) : (i64, i64) -> i64
      %2655 = func.call @cc_values_pack(%2654) : (i64) -> i64
      func.call @stack_push_pointer(%2652) : (i64) -> ()
      %2656 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2657 = arith.constant 4 : i64
      %2658 = func.call @cc_make_string(%2656, %2657) : (!llvm.ptr, i64) -> i64
      %2659 = func.call @cc_nil_value() : () -> i64
      %2660 = func.call @cc_intern(%2658, %2659) : (i64, i64) -> i64
      %2661 = func.call @cc_nil_value() : () -> i64
      %2662 = func.call @cc_cons(%2660, %2661) : (i64, i64) -> i64
      %2663 = func.call @cc_values_pack(%2662) : (i64) -> i64
      func.call @stack_push_pointer(%2660) : (i64) -> ()
      %2664 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2665 = arith.constant 6 : i64
      %2666 = func.call @cc_make_string(%2664, %2665) : (!llvm.ptr, i64) -> i64
      %2667 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2668 = arith.constant 11 : i64
      %2669 = func.call @cc_make_string(%2667, %2668) : (!llvm.ptr, i64) -> i64
      %2670 = func.call @cc_intern(%2666, %2669) : (i64, i64) -> i64
      %2671 = func.call @cc_nil_value() : () -> i64
      %2672 = func.call @cc_cons(%2670, %2671) : (i64, i64) -> i64
      %2673 = func.call @cc_values_pack(%2672) : (i64) -> i64
      func.call @stack_push_pointer(%2670) : (i64) -> ()
      %2674 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2675 = arith.constant 11 : i64
      %2676 = func.call @cc_make_string(%2674, %2675) : (!llvm.ptr, i64) -> i64
      %2677 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2678 = arith.constant 3 : i64
      %2679 = func.call @cc_make_string(%2677, %2678) : (!llvm.ptr, i64) -> i64
      %2680 = func.call @cc_intern(%2676, %2679) : (i64, i64) -> i64
      %2681 = func.call @cc_nil_value() : () -> i64
      %2682 = func.call @cc_cons(%2680, %2681) : (i64, i64) -> i64
      %2683 = func.call @cc_values_pack(%2682) : (i64) -> i64
      func.call @stack_push_pointer(%2680) : (i64) -> ()
      %2684 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2685 = arith.constant 7 : i64
      %2686 = func.call @cc_make_string(%2684, %2685) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2686) : (i64) -> ()
      %2687 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2688 = arith.constant 4 : i64
      %2689 = func.call @cc_make_string(%2687, %2688) : (!llvm.ptr, i64) -> i64
      %2690 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2691 = arith.constant 11 : i64
      %2692 = func.call @cc_make_string(%2690, %2691) : (!llvm.ptr, i64) -> i64
      %2693 = func.call @cc_intern(%2689, %2692) : (i64, i64) -> i64
      %2694 = func.call @cc_nil_value() : () -> i64
      %2695 = func.call @cc_cons(%2693, %2694) : (i64, i64) -> i64
      %2696 = func.call @cc_values_pack(%2695) : (i64) -> i64
      func.call @stack_push_pointer(%2693) : (i64) -> ()
      %2697 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2698 = arith.constant 2 : i64
      %2699 = func.call @cc_make_string(%2697, %2698) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2699) : (i64) -> ()
      %2700 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2701 = arith.constant 16 : i64
      %2702 = func.call @cc_make_string(%2700, %2701) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2702) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2703 = func.call @stack_pop_pointer() : () -> i64
      %2704 = func.call @stack_pop_pointer() : () -> i64
      %2705 = func.call @cc_cons(%2704, %2703) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2705) : (i64) -> ()
      %2706 = func.call @stack_pop_pointer() : () -> i64
      %2707 = func.call @stack_pop_pointer() : () -> i64
      %2708 = func.call @cc_cons(%2707, %2706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2708) : (i64) -> ()
      %2709 = func.call @stack_pop_pointer() : () -> i64
      %2710 = func.call @stack_pop_pointer() : () -> i64
      %2711 = func.call @cc_cons(%2710, %2709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2712 = func.call @stack_pop_pointer() : () -> i64
      %2713 = func.call @stack_pop_pointer() : () -> i64
      %2714 = func.call @cc_cons(%2713, %2712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2714) : (i64) -> ()
      %2715 = func.call @stack_pop_pointer() : () -> i64
      %2716 = func.call @stack_pop_pointer() : () -> i64
      %2717 = func.call @cc_cons(%2716, %2715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2717) : (i64) -> ()
      %2718 = func.call @stack_pop_pointer() : () -> i64
      %2719 = func.call @stack_pop_pointer() : () -> i64
      %2720 = func.call @cc_cons(%2719, %2718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2720) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2721 = func.call @stack_pop_pointer() : () -> i64
      %2722 = func.call @stack_pop_pointer() : () -> i64
      %2723 = func.call @cc_cons(%2722, %2721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2723) : (i64) -> ()
      %2724 = func.call @stack_pop_pointer() : () -> i64
      %2725 = func.call @stack_pop_pointer() : () -> i64
      %2726 = func.call @cc_cons(%2725, %2724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2726) : (i64) -> ()
      %2727 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2728 = arith.constant 6 : i64
      %2729 = func.call @cc_make_string(%2727, %2728) : (!llvm.ptr, i64) -> i64
      %2730 = func.call @cc_nil_value() : () -> i64
      %2731 = func.call @cc_intern(%2729, %2730) : (i64, i64) -> i64
      %2732 = func.call @cc_nil_value() : () -> i64
      %2733 = func.call @cc_cons(%2731, %2732) : (i64, i64) -> i64
      %2734 = func.call @cc_values_pack(%2733) : (i64) -> i64
      func.call @stack_push_pointer(%2731) : (i64) -> ()
      %2735 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2736 = arith.constant 9 : i64
      %2737 = func.call @cc_make_string(%2735, %2736) : (!llvm.ptr, i64) -> i64
      %2738 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2739 = arith.constant 11 : i64
      %2740 = func.call @cc_make_string(%2738, %2739) : (!llvm.ptr, i64) -> i64
      %2741 = func.call @cc_intern(%2737, %2740) : (i64, i64) -> i64
      %2742 = func.call @cc_nil_value() : () -> i64
      %2743 = func.call @cc_cons(%2741, %2742) : (i64, i64) -> i64
      %2744 = func.call @cc_values_pack(%2743) : (i64) -> i64
      func.call @stack_push_pointer(%2741) : (i64) -> ()
      %2745 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2746 = arith.constant 6 : i64
      %2747 = func.call @cc_make_string(%2745, %2746) : (!llvm.ptr, i64) -> i64
      %2748 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2749 = arith.constant 11 : i64
      %2750 = func.call @cc_make_string(%2748, %2749) : (!llvm.ptr, i64) -> i64
      %2751 = func.call @cc_intern(%2747, %2750) : (i64, i64) -> i64
      %2752 = func.call @cc_nil_value() : () -> i64
      %2753 = func.call @cc_cons(%2751, %2752) : (i64, i64) -> i64
      %2754 = func.call @cc_values_pack(%2753) : (i64) -> i64
      func.call @stack_push_pointer(%2751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2755 = func.call @stack_pop_pointer() : () -> i64
      %2756 = func.call @stack_pop_pointer() : () -> i64
      %2757 = func.call @cc_cons(%2756, %2755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2757) : (i64) -> ()
      %2758 = func.call @stack_pop_pointer() : () -> i64
      %2759 = func.call @stack_pop_pointer() : () -> i64
      %2760 = func.call @cc_cons(%2759, %2758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2760) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2761 = func.call @stack_pop_pointer() : () -> i64
      %2762 = func.call @stack_pop_pointer() : () -> i64
      %2763 = func.call @cc_cons(%2762, %2761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2763) : (i64) -> ()
      %2764 = func.call @stack_pop_pointer() : () -> i64
      %2765 = func.call @stack_pop_pointer() : () -> i64
      %2766 = func.call @cc_cons(%2765, %2764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2767 = func.call @stack_pop_pointer() : () -> i64
      %2768 = func.call @stack_pop_pointer() : () -> i64
      %2769 = func.call @cc_cons(%2768, %2767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2769) : (i64) -> ()
      %2770 = func.call @stack_pop_pointer() : () -> i64
      %2771 = func.call @stack_pop_pointer() : () -> i64
      %2772 = func.call @cc_cons(%2771, %2770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2772) : (i64) -> ()
      %2773 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2774 = arith.constant 5 : i64
      %2775 = func.call @cc_make_string(%2773, %2774) : (!llvm.ptr, i64) -> i64
      %2776 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2777 = arith.constant 11 : i64
      %2778 = func.call @cc_make_string(%2776, %2777) : (!llvm.ptr, i64) -> i64
      %2779 = func.call @cc_intern(%2775, %2778) : (i64, i64) -> i64
      %2780 = func.call @cc_nil_value() : () -> i64
      %2781 = func.call @cc_cons(%2779, %2780) : (i64, i64) -> i64
      %2782 = func.call @cc_values_pack(%2781) : (i64) -> i64
      func.call @stack_push_pointer(%2779) : (i64) -> ()
      %2783 = llvm.mlir.addressof @str267 : !llvm.ptr
      %2784 = arith.constant 6 : i64
      %2785 = func.call @cc_make_string(%2783, %2784) : (!llvm.ptr, i64) -> i64
      %2786 = llvm.mlir.addressof @str268 : !llvm.ptr
      %2787 = arith.constant 11 : i64
      %2788 = func.call @cc_make_string(%2786, %2787) : (!llvm.ptr, i64) -> i64
      %2789 = func.call @cc_intern(%2785, %2788) : (i64, i64) -> i64
      %2790 = func.call @cc_nil_value() : () -> i64
      %2791 = func.call @cc_cons(%2789, %2790) : (i64, i64) -> i64
      %2792 = func.call @cc_values_pack(%2791) : (i64) -> i64
      func.call @stack_push_pointer(%2789) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2793 = func.call @stack_pop_pointer() : () -> i64
      %2794 = func.call @stack_pop_pointer() : () -> i64
      %2795 = func.call @cc_cons(%2794, %2793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2795) : (i64) -> ()
      %2796 = func.call @stack_pop_pointer() : () -> i64
      %2797 = func.call @stack_pop_pointer() : () -> i64
      %2798 = func.call @cc_cons(%2797, %2796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2798) : (i64) -> ()
      %2799 = llvm.mlir.addressof @str269 : !llvm.ptr
      %2800 = arith.constant 7 : i64
      %2801 = func.call @cc_make_string(%2799, %2800) : (!llvm.ptr, i64) -> i64
      %2802 = llvm.mlir.addressof @str270 : !llvm.ptr
      %2803 = arith.constant 11 : i64
      %2804 = func.call @cc_make_string(%2802, %2803) : (!llvm.ptr, i64) -> i64
      %2805 = func.call @cc_intern(%2801, %2804) : (i64, i64) -> i64
      %2806 = func.call @cc_nil_value() : () -> i64
      %2807 = func.call @cc_cons(%2805, %2806) : (i64, i64) -> i64
      %2808 = func.call @cc_values_pack(%2807) : (i64) -> i64
      func.call @stack_push_pointer(%2805) : (i64) -> ()
      %2809 = llvm.mlir.addressof @str271 : !llvm.ptr
      %2810 = arith.constant 6 : i64
      %2811 = func.call @cc_make_string(%2809, %2810) : (!llvm.ptr, i64) -> i64
      %2812 = func.call @cc_nil_value() : () -> i64
      %2813 = func.call @cc_intern(%2811, %2812) : (i64, i64) -> i64
      %2814 = func.call @cc_nil_value() : () -> i64
      %2815 = func.call @cc_cons(%2813, %2814) : (i64, i64) -> i64
      %2816 = func.call @cc_values_pack(%2815) : (i64) -> i64
      func.call @stack_push_pointer(%2813) : (i64) -> ()
      %2817 = llvm.mlir.addressof @str272 : !llvm.ptr
      %2818 = arith.constant 11 : i64
      %2819 = func.call @cc_make_string(%2817, %2818) : (!llvm.ptr, i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %2841 = func.call @stack_pop_pointer() : () -> i64
      %2842 = func.call @stack_pop_pointer() : () -> i64
      %2843 = func.call @cc_cons(%2842, %2841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2843) : (i64) -> ()
      %2844 = func.call @stack_pop_pointer() : () -> i64
      %2845 = func.call @stack_pop_pointer() : () -> i64
      %2846 = func.call @cc_cons(%2845, %2844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2846) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2847 = func.call @stack_pop_pointer() : () -> i64
      %2848 = func.call @stack_pop_pointer() : () -> i64
      %2849 = func.call @cc_cons(%2848, %2847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2849) : (i64) -> ()
      %2850 = func.call @stack_pop_pointer() : () -> i64
      %2851 = func.call @stack_pop_pointer() : () -> i64
      %2852 = func.call @cc_cons(%2851, %2850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2852) : (i64) -> ()
      %2853 = func.call @stack_pop_pointer() : () -> i64
      %2961 = arith.constant 261322017079306 : i64
      %2962 = arith.constant 0 : i64
      %2963 = func.call @cc_make_closure(%2961, %2962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2963) : (i64) -> ()
      %2964 = func.call @stack_pop_pointer() : () -> i64
      %2965 = llvm.mlir.addressof @str280 : !llvm.ptr
      %2966 = arith.constant 1 : i64
      %2967 = func.call @cc_make_string(%2965, %2966) : (!llvm.ptr, i64) -> i64
      %2968 = func.call @cc_nil_value() : () -> i64
      %2969 = func.call @cc_intern(%2967, %2968) : (i64, i64) -> i64
      %2970 = func.call @cc_nil_value() : () -> i64
      %2971 = func.call @cc_cons(%2969, %2970) : (i64, i64) -> i64
      %2972 = func.call @cc_values_pack(%2971) : (i64) -> i64
      func.call @stack_push_pointer(%2969) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2973 = func.call @stack_pop_pointer() : () -> i64
      %2974 = func.call @stack_pop_pointer() : () -> i64
      %2975 = func.call @cc_cons(%2974, %2973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2975) : (i64) -> ()
      %2976 = func.call @stack_pop_pointer() : () -> i64
      %2977 = llvm.mlir.addressof @str281 : !llvm.ptr
      %2978 = arith.constant 11 : i64
      %2979 = func.call @cc_make_string(%2977, %2978) : (!llvm.ptr, i64) -> i64
      %2980 = llvm.mlir.addressof @str282 : !llvm.ptr
      %2981 = arith.constant 7 : i64
      %2982 = func.call @cc_make_string(%2980, %2981) : (!llvm.ptr, i64) -> i64
      %2983 = func.call @cc_intern(%2979, %2982) : (i64, i64) -> i64
      %2984 = func.call @cc_nil_value() : () -> i64
      %2985 = func.call @cc_cons(%2983, %2984) : (i64, i64) -> i64
      %2986 = func.call @cc_values_pack(%2985) : (i64) -> i64
      func.call @stack_push_pointer(%2983) : (i64) -> ()
      %2987 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2988 = func.call @stack_pop_pointer() : () -> i64
      %2989 = llvm.mlir.addressof @str283 : !llvm.ptr
      %2990 = arith.constant 4 : i64
      %2991 = func.call @cc_make_string(%2989, %2990) : (!llvm.ptr, i64) -> i64
      %2992 = llvm.mlir.addressof @str284 : !llvm.ptr
      %2993 = arith.constant 7 : i64
      %2994 = func.call @cc_make_string(%2992, %2993) : (!llvm.ptr, i64) -> i64
      %2995 = func.call @cc_intern(%2991, %2994) : (i64, i64) -> i64
      %2996 = func.call @cc_nil_value() : () -> i64
      %2997 = func.call @cc_cons(%2995, %2996) : (i64, i64) -> i64
      %2998 = func.call @cc_values_pack(%2997) : (i64) -> i64
      func.call @stack_push_pointer(%2995) : (i64) -> ()
      %2999 = func.call @stack_pop_pointer() : () -> i64
      %3000 = llvm.mlir.addressof @str285 : !llvm.ptr
      %3001 = arith.constant 6 : i64
      %3002 = func.call @cc_make_string(%3000, %3001) : (!llvm.ptr, i64) -> i64
      %3003 = func.call @cc_nil_value() : () -> i64
      %3004 = func.call @cc_intern(%3002, %3003) : (i64, i64) -> i64
      %3005 = func.call @cc_nil_value() : () -> i64
      %3006 = func.call @cc_cons(%3004, %3005) : (i64, i64) -> i64
      %3007 = func.call @cc_values_pack(%3006) : (i64) -> i64
      func.call @stack_push_pointer(%3004) : (i64) -> ()
      %3008 = func.call @stack_pop_pointer() : () -> i64
      %3009 = func.call @cc_nil_value() : () -> i64
      %3010 = func.call @cc_errorp(%2639) : (i64) -> i64
      %3011 = arith.cmpi ne, %3010, %3009 : i64
      %3012 = arith.cmpi eq, %3009, %3009 : i64
      %3013 = arith.andi %3011, %3012 : i1
      %3014 = scf.if %3013 -> (i64) {
        scf.yield %2639 : i64
      } else {
        scf.yield %3009 : i64
      }
      %3015 = func.call @cc_errorp(%2853) : (i64) -> i64
      %3016 = arith.cmpi ne, %3015, %3009 : i64
      %3017 = arith.cmpi eq, %3014, %3009 : i64
      %3018 = arith.andi %3016, %3017 : i1
      %3019 = scf.if %3018 -> (i64) {
        scf.yield %2853 : i64
      } else {
        scf.yield %3014 : i64
      }
      %3020 = func.call @cc_errorp(%2964) : (i64) -> i64
      %3021 = arith.cmpi ne, %3020, %3009 : i64
      %3022 = arith.cmpi eq, %3019, %3009 : i64
      %3023 = arith.andi %3021, %3022 : i1
      %3024 = scf.if %3023 -> (i64) {
        scf.yield %2964 : i64
      } else {
        scf.yield %3019 : i64
      }
      %3025 = func.call @cc_errorp(%2976) : (i64) -> i64
      %3026 = arith.cmpi ne, %3025, %3009 : i64
      %3027 = arith.cmpi eq, %3024, %3009 : i64
      %3028 = arith.andi %3026, %3027 : i1
      %3029 = scf.if %3028 -> (i64) {
        scf.yield %2976 : i64
      } else {
        scf.yield %3024 : i64
      }
      %3030 = func.call @cc_errorp(%2987) : (i64) -> i64
      %3031 = arith.cmpi ne, %3030, %3009 : i64
      %3032 = arith.cmpi eq, %3029, %3009 : i64
      %3033 = arith.andi %3031, %3032 : i1
      %3034 = scf.if %3033 -> (i64) {
        scf.yield %2987 : i64
      } else {
        scf.yield %3029 : i64
      }
      %3035 = func.call @cc_errorp(%2988) : (i64) -> i64
      %3036 = arith.cmpi ne, %3035, %3009 : i64
      %3037 = arith.cmpi eq, %3034, %3009 : i64
      %3038 = arith.andi %3036, %3037 : i1
      %3039 = scf.if %3038 -> (i64) {
        scf.yield %2988 : i64
      } else {
        scf.yield %3034 : i64
      }
      %3040 = func.call @cc_errorp(%2999) : (i64) -> i64
      %3041 = arith.cmpi ne, %3040, %3009 : i64
      %3042 = arith.cmpi eq, %3039, %3009 : i64
      %3043 = arith.andi %3041, %3042 : i1
      %3044 = scf.if %3043 -> (i64) {
        scf.yield %2999 : i64
      } else {
        scf.yield %3039 : i64
      }
      %3045 = func.call @cc_errorp(%3008) : (i64) -> i64
      %3046 = arith.cmpi ne, %3045, %3009 : i64
      %3047 = arith.cmpi eq, %3044, %3009 : i64
      %3048 = arith.andi %3046, %3047 : i1
      %3049 = scf.if %3048 -> (i64) {
        scf.yield %3008 : i64
      } else {
        scf.yield %3044 : i64
      }
      %3050 = arith.cmpi ne, %3049, %3009 : i64
      scf.if %3050 {
        func.call @stack_push_pointer(%3049) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2639) : (i64) -> ()
        func.call @stack_push_pointer(%2853) : (i64) -> ()
        func.call @stack_push_pointer(%2964) : (i64) -> ()
        func.call @stack_push_pointer(%2976) : (i64) -> ()
        func.call @stack_push_pointer(%2987) : (i64) -> ()
        func.call @stack_push_pointer(%2988) : (i64) -> ()
        func.call @stack_push_pointer(%2999) : (i64) -> ()
        func.call @stack_push_pointer(%3008) : (i64) -> ()
        %3051 = llvm.mlir.addressof @str286 : !llvm.ptr
        %3052 = func.call @cc_make_function_ref_const(%3051) : (!llvm.ptr) -> i64
        %3053 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3052, %3053) : (i64, i64) -> ()
      }
      %3054 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3054 : i64
    }
    func.call @stack_push_pointer(%2630) : (i64) -> ()
    %3055 = func.call @stack_pop_pointer() : () -> i64
    %3056 = func.call @cc_multiple_value_list(%3055) : (i64) -> i64
    %3057 = llvm.mlir.addressof @str287 : !llvm.ptr
    %3058 = arith.constant 38 : i64
    %3059 = func.call @cc_make_string(%3057, %3058) : (!llvm.ptr, i64) -> i64
    %3060 = func.call @cc_nil_value() : () -> i64
    %3061 = func.call @cc_intern(%3059, %3060) : (i64, i64) -> i64
    %3062 = func.call @cc_nil_value() : () -> i64
    %3063 = func.call @cc_cons(%3061, %3062) : (i64, i64) -> i64
    %3064 = func.call @cc_values_pack(%3063) : (i64) -> i64
    %3065 = func.call @cc_symbol_value(%3061) : (i64) -> i64
    %3066 = llvm.mlir.addressof @str288 : !llvm.ptr
    %3067 = arith.constant 40 : i64
    %3068 = func.call @cc_make_string(%3066, %3067) : (!llvm.ptr, i64) -> i64
    %3069 = func.call @cc_nil_value() : () -> i64
    %3070 = func.call @cc_intern(%3068, %3069) : (i64, i64) -> i64
    %3071 = func.call @cc_nil_value() : () -> i64
    %3072 = func.call @cc_cons(%3070, %3071) : (i64, i64) -> i64
    %3073 = func.call @cc_values_pack(%3072) : (i64) -> i64
    %3074 = func.call @cc_symbol_value(%3070) : (i64) -> i64
    %3075 = func.call @cc_nil_value() : () -> i64
    %3076 = arith.cmpi ne, %3065, %3075 : i64
    %3077 = scf.if %3076 -> (i64) {
      scf.yield %3074 : i64
    } else {
      scf.yield %3056 : i64
    }
    %3078 = func.call @cc_values_pack(%3077) : (i64) -> i64
    func.call @stack_push_pointer(%3078) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_261322017079297"() {
    %195 = func.call @cc_nil_value() : () -> i64
    %196 = func.call @cc_nil_value() : () -> i64
    %197 = func.call @cc_errorp(%195) : (i64) -> i64
    %198 = arith.cmpi ne, %197, %196 : i64
    %199 = scf.if %198 -> (i64) {
      scf.yield %195 : i64
    } else {
      %200 = llvm.mlir.addressof @str21 : !llvm.ptr
      %201 = arith.constant 4 : i64
      %202 = func.call @cc_make_string(%200, %201) : (!llvm.ptr, i64) -> i64
      %203 = llvm.mlir.addressof @str22 : !llvm.ptr
      %204 = arith.constant 11 : i64
      %205 = func.call @cc_make_string(%203, %204) : (!llvm.ptr, i64) -> i64
      %206 = func.call @cc_intern(%202, %205) : (i64, i64) -> i64
      %207 = func.call @cc_nil_value() : () -> i64
      %208 = func.call @cc_cons(%206, %207) : (i64, i64) -> i64
      %209 = func.call @cc_values_pack(%208) : (i64) -> i64
      func.call @stack_push_pointer(%206) : (i64) -> ()
      %210 = llvm.mlir.addressof @str23 : !llvm.ptr
      %211 = arith.constant 10 : i64
      %212 = func.call @cc_make_string(%210, %211) : (!llvm.ptr, i64) -> i64
      %213 = llvm.mlir.addressof @str24 : !llvm.ptr
      %214 = arith.constant 11 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = func.call @cc_intern(%212, %215) : (i64, i64) -> i64
      %217 = func.call @cc_nil_value() : () -> i64
      %218 = func.call @cc_cons(%216, %217) : (i64, i64) -> i64
      %219 = func.call @cc_values_pack(%218) : (i64) -> i64
      func.call @stack_push_pointer(%216) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %220 = func.call @stack_pop_pointer() : () -> i64
      %221 = func.call @stack_pop_pointer() : () -> i64
      %222 = func.call @cc_cons(%221, %220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%222) : (i64) -> ()
      %223 = func.call @stack_pop_pointer() : () -> i64
      %224 = func.call @stack_pop_pointer() : () -> i64
      %225 = func.call @cc_cons(%224, %223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%225) : (i64) -> ()
      %226 = func.call @stack_pop_pointer() : () -> i64
      %227 = llvm.mlir.addressof @str25 : !llvm.ptr
      %228 = arith.constant 8 : i64
      %229 = func.call @cc_make_string(%227, %228) : (!llvm.ptr, i64) -> i64
      %230 = llvm.mlir.addressof @str26 : !llvm.ptr
      %231 = arith.constant 7 : i64
      %232 = func.call @cc_make_string(%230, %231) : (!llvm.ptr, i64) -> i64
      %233 = func.call @cc_intern(%229, %232) : (i64, i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_cons(%233, %234) : (i64, i64) -> i64
      %236 = func.call @cc_values_pack(%235) : (i64) -> i64
      func.call @stack_push_pointer(%233) : (i64) -> ()
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @cc_nil_value() : () -> i64
      %239 = func.call @cc_errorp(%226) : (i64) -> i64
      %240 = arith.cmpi ne, %239, %238 : i64
      %241 = arith.cmpi eq, %238, %238 : i64
      %242 = arith.andi %240, %241 : i1
      %243 = scf.if %242 -> (i64) {
        scf.yield %226 : i64
      } else {
        scf.yield %238 : i64
      }
      %244 = func.call @cc_errorp(%237) : (i64) -> i64
      %245 = arith.cmpi ne, %244, %238 : i64
      %246 = arith.cmpi eq, %243, %238 : i64
      %247 = arith.andi %245, %246 : i1
      %248 = scf.if %247 -> (i64) {
        scf.yield %237 : i64
      } else {
        scf.yield %243 : i64
      }
      %249 = arith.cmpi ne, %248, %238 : i64
      scf.if %249 {
        func.call @stack_push_pointer(%248) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%226) : (i64) -> ()
        func.call @stack_push_pointer(%237) : (i64) -> ()
        %250 = llvm.mlir.addressof @str27 : !llvm.ptr
        %251 = func.call @cc_make_function_ref_const(%250) : (!llvm.ptr) -> i64
        %252 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%251, %252) : (i64, i64) -> ()
      }
      %253 = func.call @stack_pop_pointer() : () -> i64
      %254 = func.call @cc_car(%253) : (i64) -> i64
      func.call @stack_push_pointer(%254) : (i64) -> ()
      %255 = func.call @stack_pop_pointer() : () -> i64
      %256 = func.call @cc_nil_value() : () -> i64
      %257 = func.call @cc_errorp(%255) : (i64) -> i64
      %258 = arith.cmpi ne, %257, %256 : i64
      %259 = arith.cmpi eq, %256, %256 : i64
      %260 = arith.andi %258, %259 : i1
      %261 = scf.if %260 -> (i64) {
        scf.yield %255 : i64
      } else {
        scf.yield %256 : i64
      }
      %262 = arith.cmpi ne, %261, %256 : i64
      scf.if %262 {
        func.call @stack_push_pointer(%261) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%255) : (i64) -> ()
        %263 = llvm.mlir.addressof @str28 : !llvm.ptr
        %264 = func.call @cc_make_function_ref_const(%263) : (!llvm.ptr) -> i64
        %265 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%264, %265) : (i64, i64) -> ()
      }
      %266 = func.call @stack_pop_pointer() : () -> i64
      %267 = func.call @cc_nil_value() : () -> i64
      %268 = func.call @cc_cons(%266, %267) : (i64, i64) -> i64
      %269 = func.call @cc_not(%268) : (i64) -> i64
      func.call @stack_push_pointer(%269) : (i64) -> ()
      %270 = func.call @stack_pop_pointer() : () -> i64
      %271 = func.call @cc_nil_value() : () -> i64
      %272 = func.call @cc_cons(%270, %271) : (i64, i64) -> i64
      %273 = func.call @cc_not(%272) : (i64) -> i64
      func.call @stack_push_pointer(%273) : (i64) -> ()
      %274 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %274 : i64
    }
    func.call @stack_push_pointer(%199) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079298"() {
    %495 = func.call @cc_nil_value() : () -> i64
    %496 = func.call @cc_nil_value() : () -> i64
    %497 = func.call @cc_errorp(%495) : (i64) -> i64
    %498 = arith.cmpi ne, %497, %496 : i64
    %499 = scf.if %498 -> (i64) {
      scf.yield %495 : i64
    } else {
      %500 = llvm.mlir.addressof @str50 : !llvm.ptr
      %501 = arith.constant 10 : i64
      %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
      %503 = llvm.mlir.addressof @str51 : !llvm.ptr
      %504 = arith.constant 11 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = func.call @cc_intern(%502, %505) : (i64, i64) -> i64
      %507 = func.call @cc_nil_value() : () -> i64
      %508 = func.call @cc_cons(%506, %507) : (i64, i64) -> i64
      %509 = func.call @cc_values_pack(%508) : (i64) -> i64
      func.call @stack_push_pointer(%506) : (i64) -> ()
      %510 = func.call @stack_pop_pointer() : () -> i64
      %511 = llvm.mlir.addressof @str52 : !llvm.ptr
      %512 = arith.constant 8 : i64
      %513 = func.call @cc_make_string(%511, %512) : (!llvm.ptr, i64) -> i64
      %514 = llvm.mlir.addressof @str53 : !llvm.ptr
      %515 = arith.constant 7 : i64
      %516 = func.call @cc_make_string(%514, %515) : (!llvm.ptr, i64) -> i64
      %517 = func.call @cc_intern(%513, %516) : (i64, i64) -> i64
      %518 = func.call @cc_nil_value() : () -> i64
      %519 = func.call @cc_cons(%517, %518) : (i64, i64) -> i64
      %520 = func.call @cc_values_pack(%519) : (i64) -> i64
      func.call @stack_push_pointer(%517) : (i64) -> ()
      %521 = func.call @stack_pop_pointer() : () -> i64
      %522 = func.call @cc_nil_value() : () -> i64
      %523 = func.call @cc_errorp(%510) : (i64) -> i64
      %524 = arith.cmpi ne, %523, %522 : i64
      %525 = arith.cmpi eq, %522, %522 : i64
      %526 = arith.andi %524, %525 : i1
      %527 = scf.if %526 -> (i64) {
        scf.yield %510 : i64
      } else {
        scf.yield %522 : i64
      }
      %528 = func.call @cc_errorp(%521) : (i64) -> i64
      %529 = arith.cmpi ne, %528, %522 : i64
      %530 = arith.cmpi eq, %527, %522 : i64
      %531 = arith.andi %529, %530 : i1
      %532 = scf.if %531 -> (i64) {
        scf.yield %521 : i64
      } else {
        scf.yield %527 : i64
      }
      %533 = arith.cmpi ne, %532, %522 : i64
      scf.if %533 {
        func.call @stack_push_pointer(%532) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%510) : (i64) -> ()
        func.call @stack_push_pointer(%521) : (i64) -> ()
        %534 = llvm.mlir.addressof @str54 : !llvm.ptr
        %535 = func.call @cc_make_function_ref_const(%534) : (!llvm.ptr) -> i64
        %536 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%535, %536) : (i64, i64) -> ()
      }
      %537 = func.call @stack_pop_pointer() : () -> i64
      %538 = func.call @cc_car(%537) : (i64) -> i64
      func.call @stack_push_pointer(%538) : (i64) -> ()
      %539 = func.call @stack_pop_pointer() : () -> i64
      %540 = func.call @cc_nil_value() : () -> i64
      %541 = func.call @cc_errorp(%539) : (i64) -> i64
      %542 = arith.cmpi ne, %541, %540 : i64
      %543 = arith.cmpi eq, %540, %540 : i64
      %544 = arith.andi %542, %543 : i1
      %545 = scf.if %544 -> (i64) {
        scf.yield %539 : i64
      } else {
        scf.yield %540 : i64
      }
      %546 = arith.cmpi ne, %545, %540 : i64
      scf.if %546 {
        func.call @stack_push_pointer(%545) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%539) : (i64) -> ()
        %547 = llvm.mlir.addressof @str55 : !llvm.ptr
        %548 = func.call @cc_make_function_ref_const(%547) : (!llvm.ptr) -> i64
        %549 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%548, %549) : (i64, i64) -> ()
      }
      %550 = func.call @stack_pop_pointer() : () -> i64
      %551 = func.call @cc_nil_value() : () -> i64
      %552 = func.call @cc_cons(%550, %551) : (i64, i64) -> i64
      %553 = func.call @cc_not(%552) : (i64) -> i64
      func.call @stack_push_pointer(%553) : (i64) -> ()
      %554 = func.call @stack_pop_pointer() : () -> i64
      %555 = func.call @cc_nil_value() : () -> i64
      %556 = func.call @cc_cons(%554, %555) : (i64, i64) -> i64
      %557 = func.call @cc_not(%556) : (i64) -> i64
      func.call @stack_push_pointer(%557) : (i64) -> ()
      %558 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %558 : i64
    }
    func.call @stack_push_pointer(%499) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079299"() {
    %779 = func.call @cc_nil_value() : () -> i64
    %780 = func.call @cc_nil_value() : () -> i64
    %781 = func.call @cc_errorp(%779) : (i64) -> i64
    %782 = arith.cmpi ne, %781, %780 : i64
    %783 = scf.if %782 -> (i64) {
      scf.yield %779 : i64
    } else {
      %784 = llvm.mlir.addressof @str77 : !llvm.ptr
      %785 = arith.constant 6 : i64
      %786 = func.call @cc_make_string(%784, %785) : (!llvm.ptr, i64) -> i64
      %787 = llvm.mlir.addressof @str78 : !llvm.ptr
      %788 = arith.constant 11 : i64
      %789 = func.call @cc_make_string(%787, %788) : (!llvm.ptr, i64) -> i64
      %790 = func.call @cc_intern(%786, %789) : (i64, i64) -> i64
      %791 = func.call @cc_nil_value() : () -> i64
      %792 = func.call @cc_cons(%790, %791) : (i64, i64) -> i64
      %793 = func.call @cc_values_pack(%792) : (i64) -> i64
      func.call @stack_push_pointer(%790) : (i64) -> ()
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = llvm.mlir.addressof @str79 : !llvm.ptr
      %796 = arith.constant 5 : i64
      %797 = func.call @cc_make_string(%795, %796) : (!llvm.ptr, i64) -> i64
      %798 = llvm.mlir.addressof @str80 : !llvm.ptr
      %799 = arith.constant 7 : i64
      %800 = func.call @cc_make_string(%798, %799) : (!llvm.ptr, i64) -> i64
      %801 = func.call @cc_intern(%797, %800) : (i64, i64) -> i64
      %802 = func.call @cc_nil_value() : () -> i64
      %803 = func.call @cc_cons(%801, %802) : (i64, i64) -> i64
      %804 = func.call @cc_values_pack(%803) : (i64) -> i64
      func.call @stack_push_pointer(%801) : (i64) -> ()
      %805 = func.call @stack_pop_pointer() : () -> i64
      %806 = func.call @cc_nil_value() : () -> i64
      %807 = func.call @cc_errorp(%794) : (i64) -> i64
      %808 = arith.cmpi ne, %807, %806 : i64
      %809 = arith.cmpi eq, %806, %806 : i64
      %810 = arith.andi %808, %809 : i1
      %811 = scf.if %810 -> (i64) {
        scf.yield %794 : i64
      } else {
        scf.yield %806 : i64
      }
      %812 = func.call @cc_errorp(%805) : (i64) -> i64
      %813 = arith.cmpi ne, %812, %806 : i64
      %814 = arith.cmpi eq, %811, %806 : i64
      %815 = arith.andi %813, %814 : i1
      %816 = scf.if %815 -> (i64) {
        scf.yield %805 : i64
      } else {
        scf.yield %811 : i64
      }
      %817 = arith.cmpi ne, %816, %806 : i64
      scf.if %817 {
        func.call @stack_push_pointer(%816) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%794) : (i64) -> ()
        func.call @stack_push_pointer(%805) : (i64) -> ()
        %818 = llvm.mlir.addressof @str81 : !llvm.ptr
        %819 = func.call @cc_make_function_ref_const(%818) : (!llvm.ptr) -> i64
        %820 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%819, %820) : (i64, i64) -> ()
      }
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @cc_car(%821) : (i64) -> i64
      func.call @stack_push_pointer(%822) : (i64) -> ()
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @cc_nil_value() : () -> i64
      %825 = func.call @cc_errorp(%823) : (i64) -> i64
      %826 = arith.cmpi ne, %825, %824 : i64
      %827 = arith.cmpi eq, %824, %824 : i64
      %828 = arith.andi %826, %827 : i1
      %829 = scf.if %828 -> (i64) {
        scf.yield %823 : i64
      } else {
        scf.yield %824 : i64
      }
      %830 = arith.cmpi ne, %829, %824 : i64
      scf.if %830 {
        func.call @stack_push_pointer(%829) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%823) : (i64) -> ()
        %831 = llvm.mlir.addressof @str82 : !llvm.ptr
        %832 = func.call @cc_make_function_ref_const(%831) : (!llvm.ptr) -> i64
        %833 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%832, %833) : (i64, i64) -> ()
      }
      %834 = func.call @stack_pop_pointer() : () -> i64
      %835 = func.call @cc_nil_value() : () -> i64
      %836 = func.call @cc_cons(%834, %835) : (i64, i64) -> i64
      %837 = func.call @cc_not(%836) : (i64) -> i64
      func.call @stack_push_pointer(%837) : (i64) -> ()
      %838 = func.call @stack_pop_pointer() : () -> i64
      %839 = func.call @cc_nil_value() : () -> i64
      %840 = func.call @cc_cons(%838, %839) : (i64, i64) -> i64
      %841 = func.call @cc_not(%840) : (i64) -> i64
      func.call @stack_push_pointer(%841) : (i64) -> ()
      %842 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %842 : i64
    }
    func.call @stack_push_pointer(%783) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079300"() {
    %1070 = func.call @cc_nil_value() : () -> i64
    %1071 = func.call @cc_nil_value() : () -> i64
    %1072 = func.call @cc_errorp(%1070) : (i64) -> i64
    %1073 = arith.cmpi ne, %1072, %1071 : i64
    %1074 = scf.if %1073 -> (i64) {
      scf.yield %1070 : i64
    } else {
      %1075 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1076 = arith.constant 6 : i64
      %1077 = func.call @cc_make_string(%1075, %1076) : (!llvm.ptr, i64) -> i64
      %1078 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1079 = arith.constant 11 : i64
      %1080 = func.call @cc_make_string(%1078, %1079) : (!llvm.ptr, i64) -> i64
      %1081 = func.call @cc_intern(%1077, %1080) : (i64, i64) -> i64
      %1082 = func.call @cc_nil_value() : () -> i64
      %1083 = func.call @cc_cons(%1081, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_values_pack(%1083) : (i64) -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1085 = func.call @stack_pop_pointer() : () -> i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = func.call @cc_errorp(%1085) : (i64) -> i64
      %1088 = arith.cmpi ne, %1087, %1086 : i64
      %1089 = arith.cmpi eq, %1086, %1086 : i64
      %1090 = arith.andi %1088, %1089 : i1
      %1091 = scf.if %1090 -> (i64) {
        scf.yield %1085 : i64
      } else {
        scf.yield %1086 : i64
      }
      %1092 = arith.cmpi ne, %1091, %1086 : i64
      scf.if %1092 {
        func.call @stack_push_pointer(%1091) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1085) : (i64) -> ()
        %1093 = llvm.mlir.addressof @str106 : !llvm.ptr
        %1094 = func.call @cc_make_function_ref_const(%1093) : (!llvm.ptr) -> i64
        %1095 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1094, %1095) : (i64, i64) -> ()
      }
      %1096 = func.call @stack_pop_pointer() : () -> i64
      %1097 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1097) : (i64) -> ()
      %1098 = func.call @stack_pop_pointer() : () -> i64
      %1099 = func.call @cc_nil_value() : () -> i64
      %1100 = func.call @cc_errorp(%1096) : (i64) -> i64
      %1101 = arith.cmpi ne, %1100, %1099 : i64
      %1102 = arith.cmpi eq, %1099, %1099 : i64
      %1103 = arith.andi %1101, %1102 : i1
      %1104 = scf.if %1103 -> (i64) {
        scf.yield %1096 : i64
      } else {
        scf.yield %1099 : i64
      }
      %1105 = func.call @cc_errorp(%1098) : (i64) -> i64
      %1106 = arith.cmpi ne, %1105, %1099 : i64
      %1107 = arith.cmpi eq, %1104, %1099 : i64
      %1108 = arith.andi %1106, %1107 : i1
      %1109 = scf.if %1108 -> (i64) {
        scf.yield %1098 : i64
      } else {
        scf.yield %1104 : i64
      }
      %1110 = arith.cmpi ne, %1109, %1099 : i64
      scf.if %1110 {
        func.call @stack_push_pointer(%1109) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1096) : (i64) -> ()
        func.call @stack_push_pointer(%1098) : (i64) -> ()
        %1111 = llvm.mlir.addressof @str107 : !llvm.ptr
        %1112 = func.call @cc_make_function_ref_const(%1111) : (!llvm.ptr) -> i64
        %1113 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1112, %1113) : (i64, i64) -> ()
      }
      %1114 = func.call @stack_pop_pointer() : () -> i64
      %1115 = func.call @cc_car(%1114) : (i64) -> i64
      func.call @stack_push_pointer(%1115) : (i64) -> ()
      %1116 = func.call @stack_pop_pointer() : () -> i64
      %1117 = func.call @cc_nil_value() : () -> i64
      %1118 = func.call @cc_errorp(%1116) : (i64) -> i64
      %1119 = arith.cmpi ne, %1118, %1117 : i64
      %1120 = arith.cmpi eq, %1117, %1117 : i64
      %1121 = arith.andi %1119, %1120 : i1
      %1122 = scf.if %1121 -> (i64) {
        scf.yield %1116 : i64
      } else {
        scf.yield %1117 : i64
      }
      %1123 = arith.cmpi ne, %1122, %1117 : i64
      scf.if %1123 {
        func.call @stack_push_pointer(%1122) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1116) : (i64) -> ()
        %1124 = llvm.mlir.addressof @str108 : !llvm.ptr
        %1125 = func.call @cc_make_function_ref_const(%1124) : (!llvm.ptr) -> i64
        %1126 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1125, %1126) : (i64, i64) -> ()
      }
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %1128 = func.call @cc_nil_value() : () -> i64
      %1129 = func.call @cc_cons(%1127, %1128) : (i64, i64) -> i64
      %1130 = func.call @cc_not(%1129) : (i64) -> i64
      func.call @stack_push_pointer(%1130) : (i64) -> ()
      %1131 = func.call @stack_pop_pointer() : () -> i64
      %1132 = func.call @cc_nil_value() : () -> i64
      %1133 = func.call @cc_cons(%1131, %1132) : (i64, i64) -> i64
      %1134 = func.call @cc_not(%1133) : (i64) -> i64
      func.call @stack_push_pointer(%1134) : (i64) -> ()
      %1135 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1135 : i64
    }
    func.call @stack_push_pointer(%1074) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079301"() {
    %1356 = func.call @cc_nil_value() : () -> i64
    %1357 = func.call @cc_nil_value() : () -> i64
    %1358 = func.call @cc_errorp(%1356) : (i64) -> i64
    %1359 = arith.cmpi ne, %1358, %1357 : i64
    %1360 = scf.if %1359 -> (i64) {
      scf.yield %1356 : i64
    } else {
      %1361 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1362 = arith.constant 5 : i64
      %1363 = func.call @cc_make_string(%1361, %1362) : (!llvm.ptr, i64) -> i64
      %1364 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1365 = arith.constant 11 : i64
      %1366 = func.call @cc_make_string(%1364, %1365) : (!llvm.ptr, i64) -> i64
      %1367 = func.call @cc_intern(%1363, %1366) : (i64, i64) -> i64
      %1368 = func.call @cc_nil_value() : () -> i64
      %1369 = func.call @cc_cons(%1367, %1368) : (i64, i64) -> i64
      %1370 = func.call @cc_values_pack(%1369) : (i64) -> i64
      func.call @stack_push_pointer(%1367) : (i64) -> ()
      %1371 = func.call @stack_pop_pointer() : () -> i64
      %1372 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1373 = arith.constant 8 : i64
      %1374 = func.call @cc_make_string(%1372, %1373) : (!llvm.ptr, i64) -> i64
      %1375 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1376 = arith.constant 7 : i64
      %1377 = func.call @cc_make_string(%1375, %1376) : (!llvm.ptr, i64) -> i64
      %1378 = func.call @cc_intern(%1374, %1377) : (i64, i64) -> i64
      %1379 = func.call @cc_nil_value() : () -> i64
      %1380 = func.call @cc_cons(%1378, %1379) : (i64, i64) -> i64
      %1381 = func.call @cc_values_pack(%1380) : (i64) -> i64
      func.call @stack_push_pointer(%1378) : (i64) -> ()
      %1382 = func.call @stack_pop_pointer() : () -> i64
      %1383 = func.call @cc_nil_value() : () -> i64
      %1384 = func.call @cc_errorp(%1371) : (i64) -> i64
      %1385 = arith.cmpi ne, %1384, %1383 : i64
      %1386 = arith.cmpi eq, %1383, %1383 : i64
      %1387 = arith.andi %1385, %1386 : i1
      %1388 = scf.if %1387 -> (i64) {
        scf.yield %1371 : i64
      } else {
        scf.yield %1383 : i64
      }
      %1389 = func.call @cc_errorp(%1382) : (i64) -> i64
      %1390 = arith.cmpi ne, %1389, %1383 : i64
      %1391 = arith.cmpi eq, %1388, %1383 : i64
      %1392 = arith.andi %1390, %1391 : i1
      %1393 = scf.if %1392 -> (i64) {
        scf.yield %1382 : i64
      } else {
        scf.yield %1388 : i64
      }
      %1394 = arith.cmpi ne, %1393, %1383 : i64
      scf.if %1394 {
        func.call @stack_push_pointer(%1393) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1371) : (i64) -> ()
        func.call @stack_push_pointer(%1382) : (i64) -> ()
        %1395 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1396 = func.call @cc_make_function_ref_const(%1395) : (!llvm.ptr) -> i64
        %1397 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1396, %1397) : (i64, i64) -> ()
      }
      %1398 = func.call @stack_pop_pointer() : () -> i64
      %1399 = func.call @cc_car(%1398) : (i64) -> i64
      func.call @stack_push_pointer(%1399) : (i64) -> ()
      %1400 = func.call @stack_pop_pointer() : () -> i64
      %1401 = func.call @cc_nil_value() : () -> i64
      %1402 = func.call @cc_errorp(%1400) : (i64) -> i64
      %1403 = arith.cmpi ne, %1402, %1401 : i64
      %1404 = arith.cmpi eq, %1401, %1401 : i64
      %1405 = arith.andi %1403, %1404 : i1
      %1406 = scf.if %1405 -> (i64) {
        scf.yield %1400 : i64
      } else {
        scf.yield %1401 : i64
      }
      %1407 = arith.cmpi ne, %1406, %1401 : i64
      scf.if %1407 {
        func.call @stack_push_pointer(%1406) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1400) : (i64) -> ()
        %1408 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1409 = func.call @cc_make_function_ref_const(%1408) : (!llvm.ptr) -> i64
        %1410 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1409, %1410) : (i64, i64) -> ()
      }
      %1411 = func.call @stack_pop_pointer() : () -> i64
      %1412 = func.call @cc_nil_value() : () -> i64
      %1413 = func.call @cc_cons(%1411, %1412) : (i64, i64) -> i64
      %1414 = func.call @cc_not(%1413) : (i64) -> i64
      func.call @stack_push_pointer(%1414) : (i64) -> ()
      %1415 = func.call @stack_pop_pointer() : () -> i64
      %1416 = func.call @cc_nil_value() : () -> i64
      %1417 = func.call @cc_cons(%1415, %1416) : (i64, i64) -> i64
      %1418 = func.call @cc_not(%1417) : (i64) -> i64
      func.call @stack_push_pointer(%1418) : (i64) -> ()
      %1419 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1419 : i64
    }
    func.call @stack_push_pointer(%1360) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079302"() {
    %1640 = func.call @cc_nil_value() : () -> i64
    %1641 = func.call @cc_nil_value() : () -> i64
    %1642 = func.call @cc_errorp(%1640) : (i64) -> i64
    %1643 = arith.cmpi ne, %1642, %1641 : i64
    %1644 = scf.if %1643 -> (i64) {
      scf.yield %1640 : i64
    } else {
      %1645 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1646 = arith.constant 5 : i64
      %1647 = func.call @cc_make_string(%1645, %1646) : (!llvm.ptr, i64) -> i64
      %1648 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1649 = arith.constant 11 : i64
      %1650 = func.call @cc_make_string(%1648, %1649) : (!llvm.ptr, i64) -> i64
      %1651 = func.call @cc_intern(%1647, %1650) : (i64, i64) -> i64
      %1652 = func.call @cc_nil_value() : () -> i64
      %1653 = func.call @cc_cons(%1651, %1652) : (i64, i64) -> i64
      %1654 = func.call @cc_values_pack(%1653) : (i64) -> i64
      func.call @stack_push_pointer(%1651) : (i64) -> ()
      %1655 = func.call @stack_pop_pointer() : () -> i64
      %1656 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1657 = arith.constant 8 : i64
      %1658 = func.call @cc_make_string(%1656, %1657) : (!llvm.ptr, i64) -> i64
      %1659 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1660 = arith.constant 7 : i64
      %1661 = func.call @cc_make_string(%1659, %1660) : (!llvm.ptr, i64) -> i64
      %1662 = func.call @cc_intern(%1658, %1661) : (i64, i64) -> i64
      %1663 = func.call @cc_nil_value() : () -> i64
      %1664 = func.call @cc_cons(%1662, %1663) : (i64, i64) -> i64
      %1665 = func.call @cc_values_pack(%1664) : (i64) -> i64
      func.call @stack_push_pointer(%1662) : (i64) -> ()
      %1666 = func.call @stack_pop_pointer() : () -> i64
      %1667 = func.call @cc_nil_value() : () -> i64
      %1668 = func.call @cc_errorp(%1655) : (i64) -> i64
      %1669 = arith.cmpi ne, %1668, %1667 : i64
      %1670 = arith.cmpi eq, %1667, %1667 : i64
      %1671 = arith.andi %1669, %1670 : i1
      %1672 = scf.if %1671 -> (i64) {
        scf.yield %1655 : i64
      } else {
        scf.yield %1667 : i64
      }
      %1673 = func.call @cc_errorp(%1666) : (i64) -> i64
      %1674 = arith.cmpi ne, %1673, %1667 : i64
      %1675 = arith.cmpi eq, %1672, %1667 : i64
      %1676 = arith.andi %1674, %1675 : i1
      %1677 = scf.if %1676 -> (i64) {
        scf.yield %1666 : i64
      } else {
        scf.yield %1672 : i64
      }
      %1678 = arith.cmpi ne, %1677, %1667 : i64
      scf.if %1678 {
        func.call @stack_push_pointer(%1677) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1655) : (i64) -> ()
        func.call @stack_push_pointer(%1666) : (i64) -> ()
        %1679 = llvm.mlir.addressof @str161 : !llvm.ptr
        %1680 = func.call @cc_make_function_ref_const(%1679) : (!llvm.ptr) -> i64
        %1681 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1680, %1681) : (i64, i64) -> ()
      }
      %1682 = func.call @stack_pop_pointer() : () -> i64
      %1683 = func.call @cc_car(%1682) : (i64) -> i64
      func.call @stack_push_pointer(%1683) : (i64) -> ()
      %1684 = func.call @stack_pop_pointer() : () -> i64
      %1685 = func.call @cc_nil_value() : () -> i64
      %1686 = func.call @cc_errorp(%1684) : (i64) -> i64
      %1687 = arith.cmpi ne, %1686, %1685 : i64
      %1688 = arith.cmpi eq, %1685, %1685 : i64
      %1689 = arith.andi %1687, %1688 : i1
      %1690 = scf.if %1689 -> (i64) {
        scf.yield %1684 : i64
      } else {
        scf.yield %1685 : i64
      }
      %1691 = arith.cmpi ne, %1690, %1685 : i64
      scf.if %1691 {
        func.call @stack_push_pointer(%1690) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1684) : (i64) -> ()
        %1692 = llvm.mlir.addressof @str162 : !llvm.ptr
        %1693 = func.call @cc_make_function_ref_const(%1692) : (!llvm.ptr) -> i64
        %1694 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1693, %1694) : (i64, i64) -> ()
      }
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = func.call @cc_nil_value() : () -> i64
      %1697 = func.call @cc_cons(%1695, %1696) : (i64, i64) -> i64
      %1698 = func.call @cc_not(%1697) : (i64) -> i64
      func.call @stack_push_pointer(%1698) : (i64) -> ()
      %1699 = func.call @stack_pop_pointer() : () -> i64
      %1700 = func.call @cc_nil_value() : () -> i64
      %1701 = func.call @cc_cons(%1699, %1700) : (i64, i64) -> i64
      %1702 = func.call @cc_not(%1701) : (i64) -> i64
      func.call @stack_push_pointer(%1702) : (i64) -> ()
      %1703 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1703 : i64
    }
    func.call @stack_push_pointer(%1644) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079303"() {
    %1918 = func.call @cc_nil_value() : () -> i64
    %1919 = func.call @cc_nil_value() : () -> i64
    %1920 = func.call @cc_errorp(%1918) : (i64) -> i64
    %1921 = arith.cmpi ne, %1920, %1919 : i64
    %1922 = scf.if %1921 -> (i64) {
      scf.yield %1918 : i64
    } else {
      %1923 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1924 = func.call @cc_make_function_ref_const(%1923) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1924) : (i64) -> ()
      %1925 = func.call @stack_pop_pointer() : () -> i64
      %1926 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1926) : (i64) -> ()
      %1927 = func.call @stack_pop_pointer() : () -> i64
      %1928 = func.call @cc_nil_value() : () -> i64
      %1929 = func.call @cc_errorp(%1925) : (i64) -> i64
      %1930 = arith.cmpi ne, %1929, %1928 : i64
      %1931 = arith.cmpi eq, %1928, %1928 : i64
      %1932 = arith.andi %1930, %1931 : i1
      %1933 = scf.if %1932 -> (i64) {
        scf.yield %1925 : i64
      } else {
        scf.yield %1928 : i64
      }
      %1934 = func.call @cc_errorp(%1927) : (i64) -> i64
      %1935 = arith.cmpi ne, %1934, %1928 : i64
      %1936 = arith.cmpi eq, %1933, %1928 : i64
      %1937 = arith.andi %1935, %1936 : i1
      %1938 = scf.if %1937 -> (i64) {
        scf.yield %1927 : i64
      } else {
        scf.yield %1933 : i64
      }
      %1939 = arith.cmpi ne, %1938, %1928 : i64
      scf.if %1939 {
        func.call @stack_push_pointer(%1938) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1925) : (i64) -> ()
        func.call @stack_push_pointer(%1927) : (i64) -> ()
        %1940 = llvm.mlir.addressof @str184 : !llvm.ptr
        %1941 = func.call @cc_make_function_ref_const(%1940) : (!llvm.ptr) -> i64
        %1942 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1941, %1942) : (i64, i64) -> ()
      }
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_car(%1943) : (i64) -> i64
      func.call @stack_push_pointer(%1944) : (i64) -> ()
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @cc_nil_value() : () -> i64
      %1947 = func.call @cc_errorp(%1945) : (i64) -> i64
      %1948 = arith.cmpi ne, %1947, %1946 : i64
      %1949 = arith.cmpi eq, %1946, %1946 : i64
      %1950 = arith.andi %1948, %1949 : i1
      %1951 = scf.if %1950 -> (i64) {
        scf.yield %1945 : i64
      } else {
        scf.yield %1946 : i64
      }
      %1952 = arith.cmpi ne, %1951, %1946 : i64
      scf.if %1952 {
        func.call @stack_push_pointer(%1951) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1945) : (i64) -> ()
        %1953 = llvm.mlir.addressof @str185 : !llvm.ptr
        %1954 = func.call @cc_make_function_ref_const(%1953) : (!llvm.ptr) -> i64
        %1955 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1954, %1955) : (i64, i64) -> ()
      }
      %1956 = func.call @stack_pop_pointer() : () -> i64
      %1957 = func.call @cc_nil_value() : () -> i64
      %1958 = func.call @cc_cons(%1956, %1957) : (i64, i64) -> i64
      %1959 = func.call @cc_not(%1958) : (i64) -> i64
      func.call @stack_push_pointer(%1959) : (i64) -> ()
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @cc_nil_value() : () -> i64
      %1962 = func.call @cc_cons(%1960, %1961) : (i64, i64) -> i64
      %1963 = func.call @cc_not(%1962) : (i64) -> i64
      func.call @stack_push_pointer(%1963) : (i64) -> ()
      %1964 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1964 : i64
    }
    func.call @stack_push_pointer(%1922) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079304"() {
    %2185 = func.call @cc_nil_value() : () -> i64
    %2186 = func.call @cc_nil_value() : () -> i64
    %2187 = func.call @cc_errorp(%2185) : (i64) -> i64
    %2188 = arith.cmpi ne, %2187, %2186 : i64
    %2189 = scf.if %2188 -> (i64) {
      scf.yield %2185 : i64
    } else {
      %2190 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2191 = arith.constant 6 : i64
      %2192 = func.call @cc_make_string(%2190, %2191) : (!llvm.ptr, i64) -> i64
      %2193 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2194 = arith.constant 11 : i64
      %2195 = func.call @cc_make_string(%2193, %2194) : (!llvm.ptr, i64) -> i64
      %2196 = func.call @cc_intern(%2192, %2195) : (i64, i64) -> i64
      %2197 = func.call @cc_nil_value() : () -> i64
      %2198 = func.call @cc_cons(%2196, %2197) : (i64, i64) -> i64
      %2199 = func.call @cc_values_pack(%2198) : (i64) -> i64
      func.call @stack_push_pointer(%2196) : (i64) -> ()
      %2200 = func.call @stack_pop_pointer() : () -> i64
      %2201 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2202 = arith.constant 4 : i64
      %2203 = func.call @cc_make_string(%2201, %2202) : (!llvm.ptr, i64) -> i64
      %2204 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2205 = arith.constant 7 : i64
      %2206 = func.call @cc_make_string(%2204, %2205) : (!llvm.ptr, i64) -> i64
      %2207 = func.call @cc_intern(%2203, %2206) : (i64, i64) -> i64
      %2208 = func.call @cc_nil_value() : () -> i64
      %2209 = func.call @cc_cons(%2207, %2208) : (i64, i64) -> i64
      %2210 = func.call @cc_values_pack(%2209) : (i64) -> i64
      func.call @stack_push_pointer(%2207) : (i64) -> ()
      %2211 = func.call @stack_pop_pointer() : () -> i64
      %2212 = func.call @cc_nil_value() : () -> i64
      %2213 = func.call @cc_errorp(%2200) : (i64) -> i64
      %2214 = arith.cmpi ne, %2213, %2212 : i64
      %2215 = arith.cmpi eq, %2212, %2212 : i64
      %2216 = arith.andi %2214, %2215 : i1
      %2217 = scf.if %2216 -> (i64) {
        scf.yield %2200 : i64
      } else {
        scf.yield %2212 : i64
      }
      %2218 = func.call @cc_errorp(%2211) : (i64) -> i64
      %2219 = arith.cmpi ne, %2218, %2212 : i64
      %2220 = arith.cmpi eq, %2217, %2212 : i64
      %2221 = arith.andi %2219, %2220 : i1
      %2222 = scf.if %2221 -> (i64) {
        scf.yield %2211 : i64
      } else {
        scf.yield %2217 : i64
      }
      %2223 = arith.cmpi ne, %2222, %2212 : i64
      scf.if %2223 {
        func.call @stack_push_pointer(%2222) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2200) : (i64) -> ()
        func.call @stack_push_pointer(%2211) : (i64) -> ()
        %2224 = llvm.mlir.addressof @str211 : !llvm.ptr
        %2225 = func.call @cc_make_function_ref_const(%2224) : (!llvm.ptr) -> i64
        %2226 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2225, %2226) : (i64, i64) -> ()
      }
      %2227 = func.call @stack_pop_pointer() : () -> i64
      %2228 = func.call @cc_car(%2227) : (i64) -> i64
      func.call @stack_push_pointer(%2228) : (i64) -> ()
      %2229 = func.call @stack_pop_pointer() : () -> i64
      %2230 = func.call @cc_nil_value() : () -> i64
      %2231 = func.call @cc_errorp(%2229) : (i64) -> i64
      %2232 = arith.cmpi ne, %2231, %2230 : i64
      %2233 = arith.cmpi eq, %2230, %2230 : i64
      %2234 = arith.andi %2232, %2233 : i1
      %2235 = scf.if %2234 -> (i64) {
        scf.yield %2229 : i64
      } else {
        scf.yield %2230 : i64
      }
      %2236 = arith.cmpi ne, %2235, %2230 : i64
      scf.if %2236 {
        func.call @stack_push_pointer(%2235) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2229) : (i64) -> ()
        %2237 = llvm.mlir.addressof @str212 : !llvm.ptr
        %2238 = func.call @cc_make_function_ref_const(%2237) : (!llvm.ptr) -> i64
        %2239 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2238, %2239) : (i64, i64) -> ()
      }
      %2240 = func.call @stack_pop_pointer() : () -> i64
      %2241 = func.call @cc_nil_value() : () -> i64
      %2242 = func.call @cc_cons(%2240, %2241) : (i64, i64) -> i64
      %2243 = func.call @cc_not(%2242) : (i64) -> i64
      func.call @stack_push_pointer(%2243) : (i64) -> ()
      %2244 = func.call @stack_pop_pointer() : () -> i64
      %2245 = func.call @cc_nil_value() : () -> i64
      %2246 = func.call @cc_cons(%2244, %2245) : (i64, i64) -> i64
      %2247 = func.call @cc_not(%2246) : (i64) -> i64
      func.call @stack_push_pointer(%2247) : (i64) -> ()
      %2248 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2248 : i64
    }
    func.call @stack_push_pointer(%2189) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079305"() {
    %2469 = func.call @cc_nil_value() : () -> i64
    %2470 = func.call @cc_nil_value() : () -> i64
    %2471 = func.call @cc_errorp(%2469) : (i64) -> i64
    %2472 = arith.cmpi ne, %2471, %2470 : i64
    %2473 = scf.if %2472 -> (i64) {
      scf.yield %2469 : i64
    } else {
      %2474 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2475 = arith.constant 14 : i64
      %2476 = func.call @cc_make_string(%2474, %2475) : (!llvm.ptr, i64) -> i64
      %2477 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2478 = arith.constant 11 : i64
      %2479 = func.call @cc_make_string(%2477, %2478) : (!llvm.ptr, i64) -> i64
      %2480 = func.call @cc_intern(%2476, %2479) : (i64, i64) -> i64
      %2481 = func.call @cc_nil_value() : () -> i64
      %2482 = func.call @cc_cons(%2480, %2481) : (i64, i64) -> i64
      %2483 = func.call @cc_values_pack(%2482) : (i64) -> i64
      func.call @stack_push_pointer(%2480) : (i64) -> ()
      %2484 = func.call @stack_pop_pointer() : () -> i64
      %2485 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2486 = arith.constant 8 : i64
      %2487 = func.call @cc_make_string(%2485, %2486) : (!llvm.ptr, i64) -> i64
      %2488 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2489 = arith.constant 7 : i64
      %2490 = func.call @cc_make_string(%2488, %2489) : (!llvm.ptr, i64) -> i64
      %2491 = func.call @cc_intern(%2487, %2490) : (i64, i64) -> i64
      %2492 = func.call @cc_nil_value() : () -> i64
      %2493 = func.call @cc_cons(%2491, %2492) : (i64, i64) -> i64
      %2494 = func.call @cc_values_pack(%2493) : (i64) -> i64
      func.call @stack_push_pointer(%2491) : (i64) -> ()
      %2495 = func.call @stack_pop_pointer() : () -> i64
      %2496 = func.call @cc_nil_value() : () -> i64
      %2497 = func.call @cc_errorp(%2484) : (i64) -> i64
      %2498 = arith.cmpi ne, %2497, %2496 : i64
      %2499 = arith.cmpi eq, %2496, %2496 : i64
      %2500 = arith.andi %2498, %2499 : i1
      %2501 = scf.if %2500 -> (i64) {
        scf.yield %2484 : i64
      } else {
        scf.yield %2496 : i64
      }
      %2502 = func.call @cc_errorp(%2495) : (i64) -> i64
      %2503 = arith.cmpi ne, %2502, %2496 : i64
      %2504 = arith.cmpi eq, %2501, %2496 : i64
      %2505 = arith.andi %2503, %2504 : i1
      %2506 = scf.if %2505 -> (i64) {
        scf.yield %2495 : i64
      } else {
        scf.yield %2501 : i64
      }
      %2507 = arith.cmpi ne, %2506, %2496 : i64
      scf.if %2507 {
        func.call @stack_push_pointer(%2506) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2484) : (i64) -> ()
        func.call @stack_push_pointer(%2495) : (i64) -> ()
        %2508 = llvm.mlir.addressof @str238 : !llvm.ptr
        %2509 = func.call @cc_make_function_ref_const(%2508) : (!llvm.ptr) -> i64
        %2510 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2509, %2510) : (i64, i64) -> ()
      }
      %2511 = func.call @stack_pop_pointer() : () -> i64
      %2512 = func.call @cc_car(%2511) : (i64) -> i64
      func.call @stack_push_pointer(%2512) : (i64) -> ()
      %2513 = func.call @stack_pop_pointer() : () -> i64
      %2514 = func.call @cc_nil_value() : () -> i64
      %2515 = func.call @cc_errorp(%2513) : (i64) -> i64
      %2516 = arith.cmpi ne, %2515, %2514 : i64
      %2517 = arith.cmpi eq, %2514, %2514 : i64
      %2518 = arith.andi %2516, %2517 : i1
      %2519 = scf.if %2518 -> (i64) {
        scf.yield %2513 : i64
      } else {
        scf.yield %2514 : i64
      }
      %2520 = arith.cmpi ne, %2519, %2514 : i64
      scf.if %2520 {
        func.call @stack_push_pointer(%2519) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2513) : (i64) -> ()
        %2521 = llvm.mlir.addressof @str239 : !llvm.ptr
        %2522 = func.call @cc_make_function_ref_const(%2521) : (!llvm.ptr) -> i64
        %2523 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2522, %2523) : (i64, i64) -> ()
      }
      %2524 = func.call @stack_pop_pointer() : () -> i64
      %2525 = func.call @cc_nil_value() : () -> i64
      %2526 = func.call @cc_cons(%2524, %2525) : (i64, i64) -> i64
      %2527 = func.call @cc_not(%2526) : (i64) -> i64
      func.call @stack_push_pointer(%2527) : (i64) -> ()
      %2528 = func.call @stack_pop_pointer() : () -> i64
      %2529 = func.call @cc_nil_value() : () -> i64
      %2530 = func.call @cc_cons(%2528, %2529) : (i64, i64) -> i64
      %2531 = func.call @cc_not(%2530) : (i64) -> i64
      func.call @stack_push_pointer(%2531) : (i64) -> ()
      %2532 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2532 : i64
    }
    func.call @stack_push_pointer(%2473) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_261322017079306"() {
    %2854 = func.call @cc_nil_value() : () -> i64
    %2855 = func.call @cc_nil_value() : () -> i64
    %2856 = func.call @cc_errorp(%2854) : (i64) -> i64
    %2857 = arith.cmpi ne, %2856, %2855 : i64
    %2858 = scf.if %2857 -> (i64) {
      scf.yield %2854 : i64
    } else {
      %2859 = llvm.mlir.addressof @str273 : !llvm.ptr
      %2860 = arith.constant 7 : i64
      %2861 = func.call @cc_make_string(%2859, %2860) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2861) : (i64) -> ()
      %2862 = func.call @stack_pop_pointer() : () -> i64
      %2863 = llvm.mlir.addressof @str274 : !llvm.ptr
      %2864 = arith.constant 2 : i64
      %2865 = func.call @cc_make_string(%2863, %2864) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2865) : (i64) -> ()
      %2866 = func.call @stack_pop_pointer() : () -> i64
      %2867 = llvm.mlir.addressof @str275 : !llvm.ptr
      %2868 = arith.constant 16 : i64
      %2869 = func.call @cc_make_string(%2867, %2868) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2869) : (i64) -> ()
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @cc_nil_value() : () -> i64
      %2872 = func.call @cc_errorp(%2866) : (i64) -> i64
      %2873 = arith.cmpi ne, %2872, %2871 : i64
      %2874 = arith.cmpi eq, %2871, %2871 : i64
      %2875 = arith.andi %2873, %2874 : i1
      %2876 = scf.if %2875 -> (i64) {
        scf.yield %2866 : i64
      } else {
        scf.yield %2871 : i64
      }
      %2877 = func.call @cc_errorp(%2870) : (i64) -> i64
      %2878 = arith.cmpi ne, %2877, %2871 : i64
      %2879 = arith.cmpi eq, %2876, %2871 : i64
      %2880 = arith.andi %2878, %2879 : i1
      %2881 = scf.if %2880 -> (i64) {
        scf.yield %2870 : i64
      } else {
        scf.yield %2876 : i64
      }
      %2882 = arith.cmpi ne, %2881, %2871 : i64
      scf.if %2882 {
        func.call @stack_push_pointer(%2881) : (i64) -> ()
      } else {
        %2883 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2883) : (i64) -> ()
        func.call @stack_push_pointer(%2870) : (i64) -> ()
        %2884 = func.call @stack_pop_pointer() : () -> i64
        %2885 = func.call @stack_pop_pointer() : () -> i64
        %2886 = func.call @cc_cons(%2884, %2885) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2886) : (i64) -> ()
        func.call @stack_push_pointer(%2866) : (i64) -> ()
        %2887 = func.call @stack_pop_pointer() : () -> i64
        %2888 = func.call @stack_pop_pointer() : () -> i64
        %2889 = func.call @cc_cons(%2887, %2888) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2889) : (i64) -> ()
      }
      %2890 = func.call @stack_pop_pointer() : () -> i64
      %2891 = func.call @cc_nil_value() : () -> i64
      %2892 = func.call @cc_errorp(%2862) : (i64) -> i64
      %2893 = arith.cmpi ne, %2892, %2891 : i64
      %2894 = arith.cmpi eq, %2891, %2891 : i64
      %2895 = arith.andi %2893, %2894 : i1
      %2896 = scf.if %2895 -> (i64) {
        scf.yield %2862 : i64
      } else {
        scf.yield %2891 : i64
      }
      %2897 = func.call @cc_errorp(%2890) : (i64) -> i64
      %2898 = arith.cmpi ne, %2897, %2891 : i64
      %2899 = arith.cmpi eq, %2896, %2891 : i64
      %2900 = arith.andi %2898, %2899 : i1
      %2901 = scf.if %2900 -> (i64) {
        scf.yield %2890 : i64
      } else {
        scf.yield %2896 : i64
      }
      %2902 = arith.cmpi ne, %2901, %2891 : i64
      scf.if %2902 {
        func.call @stack_push_pointer(%2901) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2862) : (i64) -> ()
        func.call @stack_push_pointer(%2890) : (i64) -> ()
        %2903 = llvm.mlir.addressof @str276 : !llvm.ptr
        %2904 = func.call @cc_make_function_ref_const(%2903) : (!llvm.ptr) -> i64
        %2905 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2904, %2905) : (i64, i64) -> ()
      }
      %2906 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%2906) : (i64) -> ()
      %2907 = func.call @stack_pop_pointer() : () -> i64
      %2908 = func.call @cc_nil_value() : () -> i64
      %2909 = func.call @cc_errorp(%2907) : (i64) -> i64
      %2910 = arith.cmpi ne, %2909, %2908 : i64
      %2911 = arith.cmpi eq, %2908, %2908 : i64
      %2912 = arith.andi %2910, %2911 : i1
      %2913 = scf.if %2912 -> (i64) {
        scf.yield %2907 : i64
      } else {
        scf.yield %2908 : i64
      }
      %2914 = arith.cmpi ne, %2913, %2908 : i64
      scf.if %2914 {
        func.call @stack_push_pointer(%2913) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2907) : (i64) -> ()
        %2915 = llvm.mlir.addressof @str277 : !llvm.ptr
        %2916 = func.call @cc_make_function_ref_const(%2915) : (!llvm.ptr) -> i64
        %2917 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2916, %2917) : (i64, i64) -> ()
      }
      %2918 = func.call @stack_pop_pointer() : () -> i64
      %2919 = func.call @cc_nil_value() : () -> i64
      %2920 = func.call @cc_nil_value() : () -> i64
      %2921 = func.call @cc_errorp(%2919) : (i64) -> i64
      %2922 = arith.cmpi ne, %2921, %2920 : i64
      %2923 = scf.if %2922 -> (i64) {
        scf.yield %2919 : i64
      } else {
        func.call @stack_push_pointer(%2906) : (i64) -> ()
        %2924 = func.call @stack_pop_pointer() : () -> i64
        %2925 = func.call @cc_nil_value() : () -> i64
        %2926 = func.call @cc_errorp(%2924) : (i64) -> i64
        %2927 = arith.cmpi ne, %2926, %2925 : i64
        %2928 = arith.cmpi eq, %2925, %2925 : i64
        %2929 = arith.andi %2927, %2928 : i1
        %2930 = scf.if %2929 -> (i64) {
          scf.yield %2924 : i64
        } else {
          scf.yield %2925 : i64
        }
        %2931 = arith.cmpi ne, %2930, %2925 : i64
        scf.if %2931 {
          func.call @stack_push_pointer(%2930) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2924) : (i64) -> ()
          %2932 = llvm.mlir.addressof @str278 : !llvm.ptr
          %2933 = func.call @cc_make_function_ref_const(%2932) : (!llvm.ptr) -> i64
          %2934 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2933, %2934) : (i64, i64) -> ()
        }
        %2935 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2935 : i64
      }
      %2936 = func.call @cc_nil_value() : () -> i64
      %2937 = func.call @cc_errorp(%2923) : (i64) -> i64
      %2938 = arith.cmpi ne, %2937, %2936 : i64
      %2939 = scf.if %2938 -> (i64) {
        scf.yield %2923 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %2940 = llvm.mlir.addressof @str279 : !llvm.ptr
        %2941 = arith.constant 11 : i64
        %2942 = func.call @cc_make_string(%2940, %2941) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%2942) : (i64) -> ()
        %2943 = func.call @stack_pop_pointer() : () -> i64
        %2944 = func.call @stack_pop_pointer() : () -> i64
        %2945 = func.call @cc_cons(%2943, %2944) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2945) : (i64) -> ()
        func.call @stack_push_pointer(%2918) : (i64) -> ()
        %2946 = func.call @stack_pop_pointer() : () -> i64
        %2947 = func.call @stack_pop_pointer() : () -> i64
        %2948 = func.call @cc_cons(%2946, %2947) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2948) : (i64) -> ()
        %2949 = func.call @stack_pop_pointer() : () -> i64
        %2950 = func.call @cc_string_equal_full(%2949) : (i64) -> i64
        func.call @stack_push_pointer(%2950) : (i64) -> ()
        %2951 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2951 : i64
      }
      func.call @stack_push_pointer(%2939) : (i64) -> ()
      %2952 = func.call @stack_pop_pointer() : () -> i64
      %2953 = func.call @cc_nil_value() : () -> i64
      %2954 = func.call @cc_cons(%2952, %2953) : (i64, i64) -> i64
      %2955 = func.call @cc_not(%2954) : (i64) -> i64
      func.call @stack_push_pointer(%2955) : (i64) -> ()
      %2956 = func.call @stack_pop_pointer() : () -> i64
      %2957 = func.call @cc_nil_value() : () -> i64
      %2958 = func.call @cc_cons(%2956, %2957) : (i64, i64) -> i64
      %2959 = func.call @cc_not(%2958) : (i64) -> i64
      func.call @stack_push_pointer(%2959) : (i64) -> ()
      %2960 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2960 : i64
    }
    func.call @stack_push_pointer(%2858) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_261322017079296*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_261322017079296*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_261322017079296*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("CLIP-FAILURE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str6("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str8("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str9("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str10("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str13("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str14("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str19("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str28("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str29("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str30("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str35("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str36("SOURCE-LOCATION-FUNCTION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str37("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str38("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str39("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str40("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str41("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str44("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str45("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str55("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str56("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str57("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str59("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str62("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str63("SOURCE-LOCATION-CLASS-SYMBOL\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str64("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str65("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str66("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str67("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str68("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str71("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str72("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str73("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str75("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str78("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str79("CLASS\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str80("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str81("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str82("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str83("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str84("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str87("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str88("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str89("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str90("SOURCE-LOCATION-CLASS-OBJECT\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str91("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str92("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str93("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str94("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str95("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str96("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str97("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str98("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str99("FIND-CLASS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str100("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str102("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str104("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str105("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str106("find-class\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str107("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str108("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str109("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str110("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str112("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str113("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str114("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str115("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str116("SOURCE-LOCATION-MACRO\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str117("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str118("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str119("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str120("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str121("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str122("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str124("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str125("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str126("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str127("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str128("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str129("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str130("DEFUN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str131("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str132("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str135("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str136("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str137("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str142("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str143("SOURCE-LOCATION-SPECIAL-FROM\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str144("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str145("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str146("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str147("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str148("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str149("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str150("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str151("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str152("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str153("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str154("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str155("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str156("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str157("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str158("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str160("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str161("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str162("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str163("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str164("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str165("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str166("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str167("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str168("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str170("SOURCE-LOCATION-GENERIC-FUNCTION\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str171("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str172("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str173("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str174("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str175("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str176("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str178("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str179("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str180("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str181("INITIALIZE-INSTANCE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str182("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str183("COMMON-LISP::INITIALIZE-INSTANCE\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str184("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str185("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str186("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str187("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str188("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str189("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str190("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str192("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str193("SOURCE-LOCATION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str194("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str195("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str196("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str197("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str198("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str199("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str200("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str201("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str202("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str203("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str204("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str205("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str206("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str207("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str210("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str211("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str212("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str213("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str214("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str216("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str217("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str218("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str219("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str220("SOURCE-LOCATION-VARIABLE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str221("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str222("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str223("SOURCE-LOCATION-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str224("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str225("FIRST\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str226("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str227("SOURCE-LOCATION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str228("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str229("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str230("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str232("VARIABLE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str233("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str234("*PRINT-PRETTY*\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str235("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str236("VARIABLE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str237("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str238("ext:source-location\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str239("ext::source-location-p\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str240("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str241("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str242("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str243("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str244("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str245("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str246("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str247("RUN-PROGRAM-HELLO-WORLD\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str248("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str249("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str250("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str251("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str252("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str253("RUN-PROGRAM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str254("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str255("/bin/sh\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str256("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str257("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str258("-c\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str259("echo hello world\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str260("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str261("READ-LINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str262("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str263("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str264("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str265("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str266("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str267("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str268("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str269("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str270("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str271("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str272("hello world\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str273("/bin/sh\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str274("-c\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str275("echo hello world\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str276("ext:run-program\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str277("READ-LINE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str278("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str279("hello world\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str280("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str281("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str282("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str283("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str284("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str285("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str286("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str287("*__MLIR_BLOCK_RETFLAG_261322017079296*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str288("*__MLIR_BLOCK_RETMVLIST_261322017079296*\00") : !llvm.array<41 x i8>
}
