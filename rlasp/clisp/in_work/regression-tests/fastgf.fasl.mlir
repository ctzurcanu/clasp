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
      %53 = llvm.mlir.addressof @method_name_149526501392385 : !llvm.ptr
      %54 = func.call @cc_make_lambda_ref_str(%53) : (!llvm.ptr) -> i64
      %55 = llvm.mlir.addressof @str7 : !llvm.ptr
      %56 = arith.constant 7 : i64
      %57 = func.call @cc_make_string(%55, %56) : (!llvm.ptr, i64) -> i64
      %58 = func.call @cc_nil_value() : () -> i64
      %59 = func.call @cc_intern(%57, %58) : (i64, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_cons(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_values_pack(%61) : (i64) -> i64
      %63 = func.call @cc_nil() : () -> i64
      %64 = llvm.mlir.addressof @str8 : !llvm.ptr
      %65 = arith.constant 7 : i64
      %66 = func.call @cc_make_string(%64, %65) : (!llvm.ptr, i64) -> i64
      %67 = llvm.mlir.addressof @str9 : !llvm.ptr
      %68 = arith.constant 11 : i64
      %69 = func.call @cc_make_string(%67, %68) : (!llvm.ptr, i64) -> i64
      %70 = func.call @cc_intern(%66, %69) : (i64, i64) -> i64
      %71 = func.call @cc_nil_value() : () -> i64
      %72 = func.call @cc_cons(%70, %71) : (i64, i64) -> i64
      %73 = func.call @cc_values_pack(%72) : (i64) -> i64
      %74 = func.call @cc_cons(%70, %63) : (i64, i64) -> i64
      %75 = arith.constant 1 : i64
      %76 = func.call @cc_box_fixnum(%75) : (i64) -> i64
      %77 = arith.constant 0 : i64
      %78 = func.call @cc_defmethod_qualified(%59, %74, %54, %76, %77) : (i64, i64, i64, i64, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%79) : (i64) -> ()
      %80 = llvm.mlir.addressof @str10 : !llvm.ptr
      %81 = arith.constant 7 : i64
      %82 = func.call @cc_make_string(%80, %81) : (!llvm.ptr, i64) -> i64
      %83 = llvm.mlir.addressof @str11 : !llvm.ptr
      %84 = arith.constant 7 : i64
      %85 = func.call @cc_make_string(%83, %84) : (!llvm.ptr, i64) -> i64
      %86 = func.call @cc_intern(%82, %85) : (i64, i64) -> i64
      %87 = func.call @cc_nil_value() : () -> i64
      %88 = func.call @cc_cons(%86, %87) : (i64, i64) -> i64
      %89 = func.call @cc_values_pack(%88) : (i64) -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      %90 = func.call @stack_pop_pointer() : () -> i64
      %91 = func.call @stack_pop_pointer() : () -> i64
      %92 = func.call @cc_cons(%90, %91) : (i64, i64) -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      %93 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%93) : (i64) -> ()
      %94 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %95 = llvm.mlir.addressof @str12 : !llvm.ptr
      %96 = arith.constant 7 : i64
      %97 = func.call @cc_make_string(%95, %96) : (!llvm.ptr, i64) -> i64
      %98 = llvm.mlir.addressof @str13 : !llvm.ptr
      %99 = arith.constant 11 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      %101 = func.call @cc_intern(%97, %100) : (i64, i64) -> i64
      %102 = func.call @cc_nil_value() : () -> i64
      %103 = func.call @cc_cons(%101, %102) : (i64, i64) -> i64
      %104 = func.call @cc_values_pack(%103) : (i64) -> i64
      func.call @stack_push_pointer(%101) : (i64) -> ()
      %105 = func.call @stack_pop_pointer() : () -> i64
      %106 = func.call @stack_pop_pointer() : () -> i64
      %107 = func.call @cc_cons(%105, %106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%107) : (i64) -> ()
      %108 = llvm.mlir.addressof @str14 : !llvm.ptr
      %109 = arith.constant 1 : i64
      %110 = func.call @cc_make_string(%108, %109) : (!llvm.ptr, i64) -> i64
      %111 = func.call @cc_nil_value() : () -> i64
      %112 = func.call @cc_intern(%110, %111) : (i64, i64) -> i64
      %113 = func.call @cc_nil_value() : () -> i64
      %114 = func.call @cc_cons(%112, %113) : (i64, i64) -> i64
      %115 = func.call @cc_values_pack(%114) : (i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %116 = func.call @stack_pop_pointer() : () -> i64
      %117 = func.call @stack_pop_pointer() : () -> i64
      %118 = func.call @cc_cons(%116, %117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%118) : (i64) -> ()
      %119 = func.call @stack_pop_pointer() : () -> i64
      %120 = func.call @stack_pop_pointer() : () -> i64
      %121 = func.call @cc_cons(%119, %120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%121) : (i64) -> ()
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @stack_pop_pointer() : () -> i64
      %124 = func.call @cc_cons(%122, %123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%124) : (i64) -> ()
      %125 = llvm.mlir.addressof @str15 : !llvm.ptr
      %126 = arith.constant 7 : i64
      %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
      %128 = func.call @cc_nil_value() : () -> i64
      %129 = func.call @cc_intern(%127, %128) : (i64, i64) -> i64
      %130 = func.call @cc_nil_value() : () -> i64
      %131 = func.call @cc_cons(%129, %130) : (i64, i64) -> i64
      %132 = func.call @cc_values_pack(%131) : (i64) -> i64
      func.call @stack_push_pointer(%129) : (i64) -> ()
      %133 = func.call @stack_pop_pointer() : () -> i64
      %134 = func.call @stack_pop_pointer() : () -> i64
      %135 = func.call @cc_cons(%133, %134) : (i64, i64) -> i64
      func.call @stack_push_pointer(%135) : (i64) -> ()
      %136 = llvm.mlir.addressof @str16 : !llvm.ptr
      %137 = arith.constant 9 : i64
      %138 = func.call @cc_make_string(%136, %137) : (!llvm.ptr, i64) -> i64
      %139 = func.call @cc_nil_value() : () -> i64
      %140 = func.call @cc_intern(%138, %139) : (i64, i64) -> i64
      %141 = func.call @cc_nil_value() : () -> i64
      %142 = func.call @cc_cons(%140, %141) : (i64, i64) -> i64
      %143 = func.call @cc_values_pack(%142) : (i64) -> i64
      func.call @stack_push_pointer(%140) : (i64) -> ()
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = func.call @cc_cons(%144, %145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%146) : (i64) -> ()
      %147 = func.call @stack_pop_pointer() : () -> i64
      %148 = func.call @cc_nil_value() : () -> i64
      %149 = func.call @cc_cons(%147, %148) : (i64, i64) -> i64
      %150 = func.call @cc_eval(%149) : (i64) -> i64
      %151 = func.call @cc_multiple_value_list(%150) : (i64) -> i64
      %152 = func.call @cc_values_pack(%151) : (i64) -> i64
      func.call @stack_push_pointer(%152) : (i64) -> ()
      %153 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %153 : i64
    }
    %154 = func.call @cc_nil_value() : () -> i64
    %155 = func.call @cc_errorp(%41) : (i64) -> i64
    %156 = arith.cmpi ne, %155, %154 : i64
    %157 = scf.if %156 -> (i64) {
      scf.yield %41 : i64
    } else {
      %169 = llvm.mlir.addressof @method_name_149526501392386 : !llvm.ptr
      %170 = func.call @cc_make_lambda_ref_str(%169) : (!llvm.ptr) -> i64
      %171 = llvm.mlir.addressof @str20 : !llvm.ptr
      %172 = arith.constant 7 : i64
      %173 = func.call @cc_make_string(%171, %172) : (!llvm.ptr, i64) -> i64
      %174 = func.call @cc_nil_value() : () -> i64
      %175 = func.call @cc_intern(%173, %174) : (i64, i64) -> i64
      %176 = func.call @cc_nil_value() : () -> i64
      %177 = func.call @cc_cons(%175, %176) : (i64, i64) -> i64
      %178 = func.call @cc_values_pack(%177) : (i64) -> i64
      %179 = func.call @cc_nil() : () -> i64
      %180 = llvm.mlir.addressof @str21 : !llvm.ptr
      %181 = arith.constant 6 : i64
      %182 = func.call @cc_make_string(%180, %181) : (!llvm.ptr, i64) -> i64
      %183 = llvm.mlir.addressof @str22 : !llvm.ptr
      %184 = arith.constant 11 : i64
      %185 = func.call @cc_make_string(%183, %184) : (!llvm.ptr, i64) -> i64
      %186 = func.call @cc_intern(%182, %185) : (i64, i64) -> i64
      %187 = func.call @cc_nil_value() : () -> i64
      %188 = func.call @cc_cons(%186, %187) : (i64, i64) -> i64
      %189 = func.call @cc_values_pack(%188) : (i64) -> i64
      %190 = func.call @cc_cons(%186, %179) : (i64, i64) -> i64
      %191 = arith.constant 1 : i64
      %192 = func.call @cc_box_fixnum(%191) : (i64) -> i64
      %193 = arith.constant 0 : i64
      %194 = func.call @cc_defmethod_qualified(%175, %190, %170, %192, %193) : (i64, i64, i64, i64, i64) -> i64
      %195 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%195) : (i64) -> ()
      %196 = llvm.mlir.addressof @str23 : !llvm.ptr
      %197 = arith.constant 6 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = llvm.mlir.addressof @str24 : !llvm.ptr
      %200 = arith.constant 7 : i64
      %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
      %202 = func.call @cc_intern(%198, %201) : (i64, i64) -> i64
      %203 = func.call @cc_nil_value() : () -> i64
      %204 = func.call @cc_cons(%202, %203) : (i64, i64) -> i64
      %205 = func.call @cc_values_pack(%204) : (i64) -> i64
      func.call @stack_push_pointer(%202) : (i64) -> ()
      %206 = func.call @stack_pop_pointer() : () -> i64
      %207 = func.call @stack_pop_pointer() : () -> i64
      %208 = func.call @cc_cons(%206, %207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      %209 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      %210 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%210) : (i64) -> ()
      %211 = llvm.mlir.addressof @str25 : !llvm.ptr
      %212 = arith.constant 6 : i64
      %213 = func.call @cc_make_string(%211, %212) : (!llvm.ptr, i64) -> i64
      %214 = llvm.mlir.addressof @str26 : !llvm.ptr
      %215 = arith.constant 11 : i64
      %216 = func.call @cc_make_string(%214, %215) : (!llvm.ptr, i64) -> i64
      %217 = func.call @cc_intern(%213, %216) : (i64, i64) -> i64
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_cons(%217, %218) : (i64, i64) -> i64
      %220 = func.call @cc_values_pack(%219) : (i64) -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %221 = func.call @stack_pop_pointer() : () -> i64
      %222 = func.call @stack_pop_pointer() : () -> i64
      %223 = func.call @cc_cons(%221, %222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %224 = llvm.mlir.addressof @str27 : !llvm.ptr
      %225 = arith.constant 1 : i64
      %226 = func.call @cc_make_string(%224, %225) : (!llvm.ptr, i64) -> i64
      %227 = func.call @cc_nil_value() : () -> i64
      %228 = func.call @cc_intern(%226, %227) : (i64, i64) -> i64
      %229 = func.call @cc_nil_value() : () -> i64
      %230 = func.call @cc_cons(%228, %229) : (i64, i64) -> i64
      %231 = func.call @cc_values_pack(%230) : (i64) -> i64
      func.call @stack_push_pointer(%228) : (i64) -> ()
      %232 = func.call @stack_pop_pointer() : () -> i64
      %233 = func.call @stack_pop_pointer() : () -> i64
      %234 = func.call @cc_cons(%232, %233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%234) : (i64) -> ()
      %235 = func.call @stack_pop_pointer() : () -> i64
      %236 = func.call @stack_pop_pointer() : () -> i64
      %237 = func.call @cc_cons(%235, %236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%237) : (i64) -> ()
      %238 = func.call @stack_pop_pointer() : () -> i64
      %239 = func.call @stack_pop_pointer() : () -> i64
      %240 = func.call @cc_cons(%238, %239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%240) : (i64) -> ()
      %241 = llvm.mlir.addressof @str28 : !llvm.ptr
      %242 = arith.constant 7 : i64
      %243 = func.call @cc_make_string(%241, %242) : (!llvm.ptr, i64) -> i64
      %244 = func.call @cc_nil_value() : () -> i64
      %245 = func.call @cc_intern(%243, %244) : (i64, i64) -> i64
      %246 = func.call @cc_nil_value() : () -> i64
      %247 = func.call @cc_cons(%245, %246) : (i64, i64) -> i64
      %248 = func.call @cc_values_pack(%247) : (i64) -> i64
      func.call @stack_push_pointer(%245) : (i64) -> ()
      %249 = func.call @stack_pop_pointer() : () -> i64
      %250 = func.call @stack_pop_pointer() : () -> i64
      %251 = func.call @cc_cons(%249, %250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%251) : (i64) -> ()
      %252 = llvm.mlir.addressof @str29 : !llvm.ptr
      %253 = arith.constant 9 : i64
      %254 = func.call @cc_make_string(%252, %253) : (!llvm.ptr, i64) -> i64
      %255 = func.call @cc_nil_value() : () -> i64
      %256 = func.call @cc_intern(%254, %255) : (i64, i64) -> i64
      %257 = func.call @cc_nil_value() : () -> i64
      %258 = func.call @cc_cons(%256, %257) : (i64, i64) -> i64
      %259 = func.call @cc_values_pack(%258) : (i64) -> i64
      func.call @stack_push_pointer(%256) : (i64) -> ()
      %260 = func.call @stack_pop_pointer() : () -> i64
      %261 = func.call @stack_pop_pointer() : () -> i64
      %262 = func.call @cc_cons(%260, %261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%262) : (i64) -> ()
      %263 = func.call @stack_pop_pointer() : () -> i64
      %264 = func.call @cc_nil_value() : () -> i64
      %265 = func.call @cc_cons(%263, %264) : (i64, i64) -> i64
      %266 = func.call @cc_eval(%265) : (i64) -> i64
      %267 = func.call @cc_multiple_value_list(%266) : (i64) -> i64
      %268 = func.call @cc_values_pack(%267) : (i64) -> i64
      func.call @stack_push_pointer(%268) : (i64) -> ()
      %269 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %269 : i64
    }
    %270 = func.call @cc_nil_value() : () -> i64
    %271 = func.call @cc_errorp(%157) : (i64) -> i64
    %272 = arith.cmpi ne, %271, %270 : i64
    %273 = scf.if %272 -> (i64) {
      scf.yield %157 : i64
    } else {
      %274 = llvm.mlir.addressof @str30 : !llvm.ptr
      %275 = arith.constant 16 : i64
      %276 = func.call @cc_make_string(%274, %275) : (!llvm.ptr, i64) -> i64
      %277 = func.call @cc_nil_value() : () -> i64
      %278 = func.call @cc_intern(%276, %277) : (i64, i64) -> i64
      %279 = func.call @cc_nil_value() : () -> i64
      %280 = func.call @cc_cons(%278, %279) : (i64, i64) -> i64
      %281 = func.call @cc_values_pack(%280) : (i64) -> i64
      func.call @stack_push_pointer(%278) : (i64) -> ()
      %282 = func.call @stack_pop_pointer() : () -> i64
      %283 = llvm.mlir.addressof @str31 : !llvm.ptr
      %284 = arith.constant 7 : i64
      %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
      %286 = func.call @cc_nil_value() : () -> i64
      %287 = func.call @cc_intern(%285, %286) : (i64, i64) -> i64
      %288 = func.call @cc_nil_value() : () -> i64
      %289 = func.call @cc_cons(%287, %288) : (i64, i64) -> i64
      %290 = func.call @cc_values_pack(%289) : (i64) -> i64
      func.call @stack_push_pointer(%287) : (i64) -> ()
      %291 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%291) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %292 = func.call @stack_pop_pointer() : () -> i64
      %293 = func.call @stack_pop_pointer() : () -> i64
      %294 = func.call @cc_cons(%293, %292) : (i64, i64) -> i64
      func.call @stack_push_pointer(%294) : (i64) -> ()
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @stack_pop_pointer() : () -> i64
      %297 = func.call @cc_cons(%296, %295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      %298 = func.call @stack_pop_pointer() : () -> i64
      %317 = arith.constant 149526501392387 : i64
      %318 = arith.constant 0 : i64
      %319 = func.call @cc_make_closure(%317, %318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %320 = func.call @stack_pop_pointer() : () -> i64
      %321 = llvm.mlir.addressof @str33 : !llvm.ptr
      %322 = arith.constant 7 : i64
      %323 = func.call @cc_make_string(%321, %322) : (!llvm.ptr, i64) -> i64
      %324 = llvm.mlir.addressof @str34 : !llvm.ptr
      %325 = arith.constant 7 : i64
      %326 = func.call @cc_make_string(%324, %325) : (!llvm.ptr, i64) -> i64
      %327 = func.call @cc_intern(%323, %326) : (i64, i64) -> i64
      %328 = func.call @cc_nil_value() : () -> i64
      %329 = func.call @cc_cons(%327, %328) : (i64, i64) -> i64
      %330 = func.call @cc_values_pack(%329) : (i64) -> i64
      func.call @stack_push_pointer(%327) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %331 = func.call @stack_pop_pointer() : () -> i64
      %332 = func.call @stack_pop_pointer() : () -> i64
      %333 = func.call @cc_cons(%332, %331) : (i64, i64) -> i64
      func.call @stack_push_pointer(%333) : (i64) -> ()
      %334 = func.call @stack_pop_pointer() : () -> i64
      %335 = llvm.mlir.addressof @str35 : !llvm.ptr
      %336 = arith.constant 11 : i64
      %337 = func.call @cc_make_string(%335, %336) : (!llvm.ptr, i64) -> i64
      %338 = llvm.mlir.addressof @str36 : !llvm.ptr
      %339 = arith.constant 7 : i64
      %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
      %341 = func.call @cc_intern(%337, %340) : (i64, i64) -> i64
      %342 = func.call @cc_nil_value() : () -> i64
      %343 = func.call @cc_cons(%341, %342) : (i64, i64) -> i64
      %344 = func.call @cc_values_pack(%343) : (i64) -> i64
      func.call @stack_push_pointer(%341) : (i64) -> ()
      %345 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %346 = func.call @stack_pop_pointer() : () -> i64
      %347 = llvm.mlir.addressof @str37 : !llvm.ptr
      %348 = arith.constant 4 : i64
      %349 = func.call @cc_make_string(%347, %348) : (!llvm.ptr, i64) -> i64
      %350 = llvm.mlir.addressof @str38 : !llvm.ptr
      %351 = arith.constant 7 : i64
      %352 = func.call @cc_make_string(%350, %351) : (!llvm.ptr, i64) -> i64
      %353 = func.call @cc_intern(%349, %352) : (i64, i64) -> i64
      %354 = func.call @cc_nil_value() : () -> i64
      %355 = func.call @cc_cons(%353, %354) : (i64, i64) -> i64
      %356 = func.call @cc_values_pack(%355) : (i64) -> i64
      func.call @stack_push_pointer(%353) : (i64) -> ()
      %357 = func.call @stack_pop_pointer() : () -> i64
      %358 = llvm.mlir.addressof @str39 : !llvm.ptr
      %359 = arith.constant 6 : i64
      %360 = func.call @cc_make_string(%358, %359) : (!llvm.ptr, i64) -> i64
      %361 = func.call @cc_nil_value() : () -> i64
      %362 = func.call @cc_intern(%360, %361) : (i64, i64) -> i64
      %363 = func.call @cc_nil_value() : () -> i64
      %364 = func.call @cc_cons(%362, %363) : (i64, i64) -> i64
      %365 = func.call @cc_values_pack(%364) : (i64) -> i64
      func.call @stack_push_pointer(%362) : (i64) -> ()
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = func.call @cc_errorp(%282) : (i64) -> i64
      %369 = arith.cmpi ne, %368, %367 : i64
      %370 = arith.cmpi eq, %367, %367 : i64
      %371 = arith.andi %369, %370 : i1
      %372 = scf.if %371 -> (i64) {
        scf.yield %282 : i64
      } else {
        scf.yield %367 : i64
      }
      %373 = func.call @cc_errorp(%298) : (i64) -> i64
      %374 = arith.cmpi ne, %373, %367 : i64
      %375 = arith.cmpi eq, %372, %367 : i64
      %376 = arith.andi %374, %375 : i1
      %377 = scf.if %376 -> (i64) {
        scf.yield %298 : i64
      } else {
        scf.yield %372 : i64
      }
      %378 = func.call @cc_errorp(%320) : (i64) -> i64
      %379 = arith.cmpi ne, %378, %367 : i64
      %380 = arith.cmpi eq, %377, %367 : i64
      %381 = arith.andi %379, %380 : i1
      %382 = scf.if %381 -> (i64) {
        scf.yield %320 : i64
      } else {
        scf.yield %377 : i64
      }
      %383 = func.call @cc_errorp(%334) : (i64) -> i64
      %384 = arith.cmpi ne, %383, %367 : i64
      %385 = arith.cmpi eq, %382, %367 : i64
      %386 = arith.andi %384, %385 : i1
      %387 = scf.if %386 -> (i64) {
        scf.yield %334 : i64
      } else {
        scf.yield %382 : i64
      }
      %388 = func.call @cc_errorp(%345) : (i64) -> i64
      %389 = arith.cmpi ne, %388, %367 : i64
      %390 = arith.cmpi eq, %387, %367 : i64
      %391 = arith.andi %389, %390 : i1
      %392 = scf.if %391 -> (i64) {
        scf.yield %345 : i64
      } else {
        scf.yield %387 : i64
      }
      %393 = func.call @cc_errorp(%346) : (i64) -> i64
      %394 = arith.cmpi ne, %393, %367 : i64
      %395 = arith.cmpi eq, %392, %367 : i64
      %396 = arith.andi %394, %395 : i1
      %397 = scf.if %396 -> (i64) {
        scf.yield %346 : i64
      } else {
        scf.yield %392 : i64
      }
      %398 = func.call @cc_errorp(%357) : (i64) -> i64
      %399 = arith.cmpi ne, %398, %367 : i64
      %400 = arith.cmpi eq, %397, %367 : i64
      %401 = arith.andi %399, %400 : i1
      %402 = scf.if %401 -> (i64) {
        scf.yield %357 : i64
      } else {
        scf.yield %397 : i64
      }
      %403 = func.call @cc_errorp(%366) : (i64) -> i64
      %404 = arith.cmpi ne, %403, %367 : i64
      %405 = arith.cmpi eq, %402, %367 : i64
      %406 = arith.andi %404, %405 : i1
      %407 = scf.if %406 -> (i64) {
        scf.yield %366 : i64
      } else {
        scf.yield %402 : i64
      }
      %408 = arith.cmpi ne, %407, %367 : i64
      scf.if %408 {
        func.call @stack_push_pointer(%407) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%282) : (i64) -> ()
        func.call @stack_push_pointer(%298) : (i64) -> ()
        func.call @stack_push_pointer(%320) : (i64) -> ()
        func.call @stack_push_pointer(%334) : (i64) -> ()
        func.call @stack_push_pointer(%345) : (i64) -> ()
        func.call @stack_push_pointer(%346) : (i64) -> ()
        func.call @stack_push_pointer(%357) : (i64) -> ()
        func.call @stack_push_pointer(%366) : (i64) -> ()
        %409 = llvm.mlir.addressof @str40 : !llvm.ptr
        %410 = func.call @cc_make_function_ref_const(%409) : (!llvm.ptr) -> i64
        %411 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%410, %411) : (i64, i64) -> ()
      }
      %412 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %412 : i64
    }
    %413 = func.call @cc_nil_value() : () -> i64
    %414 = func.call @cc_errorp(%273) : (i64) -> i64
    %415 = arith.cmpi ne, %414, %413 : i64
    %416 = scf.if %415 -> (i64) {
      scf.yield %273 : i64
    } else {
      %417 = llvm.mlir.addressof @str41 : !llvm.ptr
      %418 = arith.constant 15 : i64
      %419 = func.call @cc_make_string(%417, %418) : (!llvm.ptr, i64) -> i64
      %420 = func.call @cc_nil_value() : () -> i64
      %421 = func.call @cc_intern(%419, %420) : (i64, i64) -> i64
      %422 = func.call @cc_nil_value() : () -> i64
      %423 = func.call @cc_cons(%421, %422) : (i64, i64) -> i64
      %424 = func.call @cc_values_pack(%423) : (i64) -> i64
      func.call @stack_push_pointer(%421) : (i64) -> ()
      %425 = func.call @stack_pop_pointer() : () -> i64
      %426 = llvm.mlir.addressof @str42 : !llvm.ptr
      %427 = arith.constant 7 : i64
      %428 = func.call @cc_make_string(%426, %427) : (!llvm.ptr, i64) -> i64
      %429 = func.call @cc_nil_value() : () -> i64
      %430 = func.call @cc_intern(%428, %429) : (i64, i64) -> i64
      %431 = func.call @cc_nil_value() : () -> i64
      %432 = func.call @cc_cons(%430, %431) : (i64, i64) -> i64
      %433 = func.call @cc_values_pack(%432) : (i64) -> i64
      func.call @stack_push_pointer(%430) : (i64) -> ()
      %434 = llvm.mlir.addressof @str43 : !llvm.ptr
      %435 = arith.constant 7 : i64
      %436 = func.call @cc_make_string(%434, %435) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %437 = func.call @stack_pop_pointer() : () -> i64
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @cc_cons(%438, %437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%439) : (i64) -> ()
      %440 = func.call @stack_pop_pointer() : () -> i64
      %441 = func.call @stack_pop_pointer() : () -> i64
      %442 = func.call @cc_cons(%441, %440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%442) : (i64) -> ()
      %443 = func.call @stack_pop_pointer() : () -> i64
      %464 = arith.constant 149526501392388 : i64
      %465 = arith.constant 0 : i64
      %466 = func.call @cc_make_closure(%464, %465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%466) : (i64) -> ()
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = llvm.mlir.addressof @str46 : !llvm.ptr
      %469 = arith.constant 6 : i64
      %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
      %471 = llvm.mlir.addressof @str47 : !llvm.ptr
      %472 = arith.constant 7 : i64
      %473 = func.call @cc_make_string(%471, %472) : (!llvm.ptr, i64) -> i64
      %474 = func.call @cc_intern(%470, %473) : (i64, i64) -> i64
      %475 = func.call @cc_nil_value() : () -> i64
      %476 = func.call @cc_cons(%474, %475) : (i64, i64) -> i64
      %477 = func.call @cc_values_pack(%476) : (i64) -> i64
      func.call @stack_push_pointer(%474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %478 = func.call @stack_pop_pointer() : () -> i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%480) : (i64) -> ()
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = llvm.mlir.addressof @str48 : !llvm.ptr
      %483 = arith.constant 11 : i64
      %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
      %485 = llvm.mlir.addressof @str49 : !llvm.ptr
      %486 = arith.constant 7 : i64
      %487 = func.call @cc_make_string(%485, %486) : (!llvm.ptr, i64) -> i64
      %488 = func.call @cc_intern(%484, %487) : (i64, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_values_pack(%490) : (i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      %492 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %493 = func.call @stack_pop_pointer() : () -> i64
      %494 = llvm.mlir.addressof @str50 : !llvm.ptr
      %495 = arith.constant 4 : i64
      %496 = func.call @cc_make_string(%494, %495) : (!llvm.ptr, i64) -> i64
      %497 = llvm.mlir.addressof @str51 : !llvm.ptr
      %498 = arith.constant 7 : i64
      %499 = func.call @cc_make_string(%497, %498) : (!llvm.ptr, i64) -> i64
      %500 = func.call @cc_intern(%496, %499) : (i64, i64) -> i64
      %501 = func.call @cc_nil_value() : () -> i64
      %502 = func.call @cc_cons(%500, %501) : (i64, i64) -> i64
      %503 = func.call @cc_values_pack(%502) : (i64) -> i64
      func.call @stack_push_pointer(%500) : (i64) -> ()
      %504 = func.call @stack_pop_pointer() : () -> i64
      %505 = llvm.mlir.addressof @str52 : !llvm.ptr
      %506 = arith.constant 6 : i64
      %507 = func.call @cc_make_string(%505, %506) : (!llvm.ptr, i64) -> i64
      %508 = func.call @cc_nil_value() : () -> i64
      %509 = func.call @cc_intern(%507, %508) : (i64, i64) -> i64
      %510 = func.call @cc_nil_value() : () -> i64
      %511 = func.call @cc_cons(%509, %510) : (i64, i64) -> i64
      %512 = func.call @cc_values_pack(%511) : (i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %513 = func.call @stack_pop_pointer() : () -> i64
      %514 = func.call @cc_nil_value() : () -> i64
      %515 = func.call @cc_errorp(%425) : (i64) -> i64
      %516 = arith.cmpi ne, %515, %514 : i64
      %517 = arith.cmpi eq, %514, %514 : i64
      %518 = arith.andi %516, %517 : i1
      %519 = scf.if %518 -> (i64) {
        scf.yield %425 : i64
      } else {
        scf.yield %514 : i64
      }
      %520 = func.call @cc_errorp(%443) : (i64) -> i64
      %521 = arith.cmpi ne, %520, %514 : i64
      %522 = arith.cmpi eq, %519, %514 : i64
      %523 = arith.andi %521, %522 : i1
      %524 = scf.if %523 -> (i64) {
        scf.yield %443 : i64
      } else {
        scf.yield %519 : i64
      }
      %525 = func.call @cc_errorp(%467) : (i64) -> i64
      %526 = arith.cmpi ne, %525, %514 : i64
      %527 = arith.cmpi eq, %524, %514 : i64
      %528 = arith.andi %526, %527 : i1
      %529 = scf.if %528 -> (i64) {
        scf.yield %467 : i64
      } else {
        scf.yield %524 : i64
      }
      %530 = func.call @cc_errorp(%481) : (i64) -> i64
      %531 = arith.cmpi ne, %530, %514 : i64
      %532 = arith.cmpi eq, %529, %514 : i64
      %533 = arith.andi %531, %532 : i1
      %534 = scf.if %533 -> (i64) {
        scf.yield %481 : i64
      } else {
        scf.yield %529 : i64
      }
      %535 = func.call @cc_errorp(%492) : (i64) -> i64
      %536 = arith.cmpi ne, %535, %514 : i64
      %537 = arith.cmpi eq, %534, %514 : i64
      %538 = arith.andi %536, %537 : i1
      %539 = scf.if %538 -> (i64) {
        scf.yield %492 : i64
      } else {
        scf.yield %534 : i64
      }
      %540 = func.call @cc_errorp(%493) : (i64) -> i64
      %541 = arith.cmpi ne, %540, %514 : i64
      %542 = arith.cmpi eq, %539, %514 : i64
      %543 = arith.andi %541, %542 : i1
      %544 = scf.if %543 -> (i64) {
        scf.yield %493 : i64
      } else {
        scf.yield %539 : i64
      }
      %545 = func.call @cc_errorp(%504) : (i64) -> i64
      %546 = arith.cmpi ne, %545, %514 : i64
      %547 = arith.cmpi eq, %544, %514 : i64
      %548 = arith.andi %546, %547 : i1
      %549 = scf.if %548 -> (i64) {
        scf.yield %504 : i64
      } else {
        scf.yield %544 : i64
      }
      %550 = func.call @cc_errorp(%513) : (i64) -> i64
      %551 = arith.cmpi ne, %550, %514 : i64
      %552 = arith.cmpi eq, %549, %514 : i64
      %553 = arith.andi %551, %552 : i1
      %554 = scf.if %553 -> (i64) {
        scf.yield %513 : i64
      } else {
        scf.yield %549 : i64
      }
      %555 = arith.cmpi ne, %554, %514 : i64
      scf.if %555 {
        func.call @stack_push_pointer(%554) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%425) : (i64) -> ()
        func.call @stack_push_pointer(%443) : (i64) -> ()
        func.call @stack_push_pointer(%467) : (i64) -> ()
        func.call @stack_push_pointer(%481) : (i64) -> ()
        func.call @stack_push_pointer(%492) : (i64) -> ()
        func.call @stack_push_pointer(%493) : (i64) -> ()
        func.call @stack_push_pointer(%504) : (i64) -> ()
        func.call @stack_push_pointer(%513) : (i64) -> ()
        %556 = llvm.mlir.addressof @str53 : !llvm.ptr
        %557 = func.call @cc_make_function_ref_const(%556) : (!llvm.ptr) -> i64
        %558 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%557, %558) : (i64, i64) -> ()
      }
      %559 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %559 : i64
    }
    %560 = func.call @cc_nil_value() : () -> i64
    %561 = func.call @cc_errorp(%416) : (i64) -> i64
    %562 = arith.cmpi ne, %561, %560 : i64
    %563 = scf.if %562 -> (i64) {
      scf.yield %416 : i64
    } else {
      %575 = llvm.mlir.addressof @method_name_149526501392389 : !llvm.ptr
      %576 = func.call @cc_make_lambda_ref_str(%575) : (!llvm.ptr) -> i64
      %577 = llvm.mlir.addressof @str57 : !llvm.ptr
      %578 = arith.constant 7 : i64
      %579 = func.call @cc_make_string(%577, %578) : (!llvm.ptr, i64) -> i64
      %580 = func.call @cc_nil_value() : () -> i64
      %581 = func.call @cc_intern(%579, %580) : (i64, i64) -> i64
      %582 = func.call @cc_nil_value() : () -> i64
      %583 = func.call @cc_cons(%581, %582) : (i64, i64) -> i64
      %584 = func.call @cc_values_pack(%583) : (i64) -> i64
      %585 = func.call @cc_nil() : () -> i64
      %586 = llvm.mlir.addressof @str58 : !llvm.ptr
      %587 = arith.constant 6 : i64
      %588 = func.call @cc_make_string(%586, %587) : (!llvm.ptr, i64) -> i64
      %589 = llvm.mlir.addressof @str59 : !llvm.ptr
      %590 = arith.constant 11 : i64
      %591 = func.call @cc_make_string(%589, %590) : (!llvm.ptr, i64) -> i64
      %592 = func.call @cc_intern(%588, %591) : (i64, i64) -> i64
      %593 = func.call @cc_nil_value() : () -> i64
      %594 = func.call @cc_cons(%592, %593) : (i64, i64) -> i64
      %595 = func.call @cc_values_pack(%594) : (i64) -> i64
      %596 = func.call @cc_cons(%592, %585) : (i64, i64) -> i64
      %597 = arith.constant 1 : i64
      %598 = func.call @cc_box_fixnum(%597) : (i64) -> i64
      %599 = arith.constant 0 : i64
      %600 = func.call @cc_defmethod_qualified(%581, %596, %576, %598, %599) : (i64, i64, i64, i64, i64) -> i64
      %601 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%601) : (i64) -> ()
      %602 = llvm.mlir.addressof @str60 : !llvm.ptr
      %603 = arith.constant 6 : i64
      %604 = func.call @cc_make_string(%602, %603) : (!llvm.ptr, i64) -> i64
      %605 = llvm.mlir.addressof @str61 : !llvm.ptr
      %606 = arith.constant 7 : i64
      %607 = func.call @cc_make_string(%605, %606) : (!llvm.ptr, i64) -> i64
      %608 = func.call @cc_intern(%604, %607) : (i64, i64) -> i64
      %609 = func.call @cc_nil_value() : () -> i64
      %610 = func.call @cc_cons(%608, %609) : (i64, i64) -> i64
      %611 = func.call @cc_values_pack(%610) : (i64) -> i64
      func.call @stack_push_pointer(%608) : (i64) -> ()
      %612 = func.call @stack_pop_pointer() : () -> i64
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @cc_cons(%612, %613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%614) : (i64) -> ()
      %615 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %616 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%616) : (i64) -> ()
      %617 = llvm.mlir.addressof @str62 : !llvm.ptr
      %618 = arith.constant 6 : i64
      %619 = func.call @cc_make_string(%617, %618) : (!llvm.ptr, i64) -> i64
      %620 = llvm.mlir.addressof @str63 : !llvm.ptr
      %621 = arith.constant 11 : i64
      %622 = func.call @cc_make_string(%620, %621) : (!llvm.ptr, i64) -> i64
      %623 = func.call @cc_intern(%619, %622) : (i64, i64) -> i64
      %624 = func.call @cc_nil_value() : () -> i64
      %625 = func.call @cc_cons(%623, %624) : (i64, i64) -> i64
      %626 = func.call @cc_values_pack(%625) : (i64) -> i64
      func.call @stack_push_pointer(%623) : (i64) -> ()
      %627 = func.call @stack_pop_pointer() : () -> i64
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = func.call @cc_cons(%627, %628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%629) : (i64) -> ()
      %630 = llvm.mlir.addressof @str64 : !llvm.ptr
      %631 = arith.constant 1 : i64
      %632 = func.call @cc_make_string(%630, %631) : (!llvm.ptr, i64) -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_intern(%632, %633) : (i64, i64) -> i64
      %635 = func.call @cc_nil_value() : () -> i64
      %636 = func.call @cc_cons(%634, %635) : (i64, i64) -> i64
      %637 = func.call @cc_values_pack(%636) : (i64) -> i64
      func.call @stack_push_pointer(%634) : (i64) -> ()
      %638 = func.call @stack_pop_pointer() : () -> i64
      %639 = func.call @stack_pop_pointer() : () -> i64
      %640 = func.call @cc_cons(%638, %639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%640) : (i64) -> ()
      %641 = func.call @stack_pop_pointer() : () -> i64
      %642 = func.call @stack_pop_pointer() : () -> i64
      %643 = func.call @cc_cons(%641, %642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%643) : (i64) -> ()
      %644 = func.call @stack_pop_pointer() : () -> i64
      %645 = func.call @stack_pop_pointer() : () -> i64
      %646 = func.call @cc_cons(%644, %645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%646) : (i64) -> ()
      %647 = llvm.mlir.addressof @str65 : !llvm.ptr
      %648 = arith.constant 7 : i64
      %649 = func.call @cc_make_string(%647, %648) : (!llvm.ptr, i64) -> i64
      %650 = func.call @cc_nil_value() : () -> i64
      %651 = func.call @cc_intern(%649, %650) : (i64, i64) -> i64
      %652 = func.call @cc_nil_value() : () -> i64
      %653 = func.call @cc_cons(%651, %652) : (i64, i64) -> i64
      %654 = func.call @cc_values_pack(%653) : (i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      %655 = func.call @stack_pop_pointer() : () -> i64
      %656 = func.call @stack_pop_pointer() : () -> i64
      %657 = func.call @cc_cons(%655, %656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%657) : (i64) -> ()
      %658 = llvm.mlir.addressof @str66 : !llvm.ptr
      %659 = arith.constant 9 : i64
      %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
      %661 = func.call @cc_nil_value() : () -> i64
      %662 = func.call @cc_intern(%660, %661) : (i64, i64) -> i64
      %663 = func.call @cc_nil_value() : () -> i64
      %664 = func.call @cc_cons(%662, %663) : (i64, i64) -> i64
      %665 = func.call @cc_values_pack(%664) : (i64) -> i64
      func.call @stack_push_pointer(%662) : (i64) -> ()
      %666 = func.call @stack_pop_pointer() : () -> i64
      %667 = func.call @stack_pop_pointer() : () -> i64
      %668 = func.call @cc_cons(%666, %667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%668) : (i64) -> ()
      %669 = func.call @stack_pop_pointer() : () -> i64
      %670 = func.call @cc_nil_value() : () -> i64
      %671 = func.call @cc_cons(%669, %670) : (i64, i64) -> i64
      %672 = func.call @cc_eval(%671) : (i64) -> i64
      %673 = func.call @cc_multiple_value_list(%672) : (i64) -> i64
      %674 = func.call @cc_values_pack(%673) : (i64) -> i64
      func.call @stack_push_pointer(%674) : (i64) -> ()
      %675 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %675 : i64
    }
    %676 = func.call @cc_nil_value() : () -> i64
    %677 = func.call @cc_errorp(%563) : (i64) -> i64
    %678 = arith.cmpi ne, %677, %676 : i64
    %679 = scf.if %678 -> (i64) {
      scf.yield %563 : i64
    } else {
      %680 = llvm.mlir.addressof @str67 : !llvm.ptr
      %681 = arith.constant 15 : i64
      %682 = func.call @cc_make_string(%680, %681) : (!llvm.ptr, i64) -> i64
      %683 = func.call @cc_nil_value() : () -> i64
      %684 = func.call @cc_intern(%682, %683) : (i64, i64) -> i64
      %685 = func.call @cc_nil_value() : () -> i64
      %686 = func.call @cc_cons(%684, %685) : (i64, i64) -> i64
      %687 = func.call @cc_values_pack(%686) : (i64) -> i64
      func.call @stack_push_pointer(%684) : (i64) -> ()
      %688 = func.call @stack_pop_pointer() : () -> i64
      %689 = llvm.mlir.addressof @str68 : !llvm.ptr
      %690 = arith.constant 7 : i64
      %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
      %692 = func.call @cc_nil_value() : () -> i64
      %693 = func.call @cc_intern(%691, %692) : (i64, i64) -> i64
      %694 = func.call @cc_nil_value() : () -> i64
      %695 = func.call @cc_cons(%693, %694) : (i64, i64) -> i64
      %696 = func.call @cc_values_pack(%695) : (i64) -> i64
      func.call @stack_push_pointer(%693) : (i64) -> ()
      %697 = llvm.mlir.addressof @str69 : !llvm.ptr
      %698 = arith.constant 5 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      %700 = llvm.mlir.addressof @str70 : !llvm.ptr
      %701 = arith.constant 7 : i64
      %702 = func.call @cc_make_string(%700, %701) : (!llvm.ptr, i64) -> i64
      %703 = func.call @cc_intern(%699, %702) : (i64, i64) -> i64
      %704 = func.call @cc_nil_value() : () -> i64
      %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
      %706 = func.call @cc_values_pack(%705) : (i64) -> i64
      func.call @stack_push_pointer(%703) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %707 = func.call @stack_pop_pointer() : () -> i64
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @cc_cons(%708, %707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%709) : (i64) -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @cc_cons(%711, %710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %713 = func.call @stack_pop_pointer() : () -> i64
      %741 = arith.constant 149526501392390 : i64
      %742 = arith.constant 0 : i64
      %743 = func.call @cc_make_closure(%741, %742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%743) : (i64) -> ()
      %744 = func.call @stack_pop_pointer() : () -> i64
      %745 = llvm.mlir.addressof @str74 : !llvm.ptr
      %746 = arith.constant 6 : i64
      %747 = func.call @cc_make_string(%745, %746) : (!llvm.ptr, i64) -> i64
      %748 = llvm.mlir.addressof @str75 : !llvm.ptr
      %749 = arith.constant 7 : i64
      %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
      %751 = func.call @cc_intern(%747, %750) : (i64, i64) -> i64
      %752 = func.call @cc_nil_value() : () -> i64
      %753 = func.call @cc_cons(%751, %752) : (i64, i64) -> i64
      %754 = func.call @cc_values_pack(%753) : (i64) -> i64
      func.call @stack_push_pointer(%751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @cc_cons(%756, %755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%757) : (i64) -> ()
      %758 = func.call @stack_pop_pointer() : () -> i64
      %759 = llvm.mlir.addressof @str76 : !llvm.ptr
      %760 = arith.constant 11 : i64
      %761 = func.call @cc_make_string(%759, %760) : (!llvm.ptr, i64) -> i64
      %762 = llvm.mlir.addressof @str77 : !llvm.ptr
      %763 = arith.constant 7 : i64
      %764 = func.call @cc_make_string(%762, %763) : (!llvm.ptr, i64) -> i64
      %765 = func.call @cc_intern(%761, %764) : (i64, i64) -> i64
      %766 = func.call @cc_nil_value() : () -> i64
      %767 = func.call @cc_cons(%765, %766) : (i64, i64) -> i64
      %768 = func.call @cc_values_pack(%767) : (i64) -> i64
      func.call @stack_push_pointer(%765) : (i64) -> ()
      %769 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %770 = func.call @stack_pop_pointer() : () -> i64
      %771 = llvm.mlir.addressof @str78 : !llvm.ptr
      %772 = arith.constant 4 : i64
      %773 = func.call @cc_make_string(%771, %772) : (!llvm.ptr, i64) -> i64
      %774 = llvm.mlir.addressof @str79 : !llvm.ptr
      %775 = arith.constant 7 : i64
      %776 = func.call @cc_make_string(%774, %775) : (!llvm.ptr, i64) -> i64
      %777 = func.call @cc_intern(%773, %776) : (i64, i64) -> i64
      %778 = func.call @cc_nil_value() : () -> i64
      %779 = func.call @cc_cons(%777, %778) : (i64, i64) -> i64
      %780 = func.call @cc_values_pack(%779) : (i64) -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      %781 = func.call @stack_pop_pointer() : () -> i64
      %782 = llvm.mlir.addressof @str80 : !llvm.ptr
      %783 = arith.constant 6 : i64
      %784 = func.call @cc_make_string(%782, %783) : (!llvm.ptr, i64) -> i64
      %785 = func.call @cc_nil_value() : () -> i64
      %786 = func.call @cc_intern(%784, %785) : (i64, i64) -> i64
      %787 = func.call @cc_nil_value() : () -> i64
      %788 = func.call @cc_cons(%786, %787) : (i64, i64) -> i64
      %789 = func.call @cc_values_pack(%788) : (i64) -> i64
      func.call @stack_push_pointer(%786) : (i64) -> ()
      %790 = func.call @stack_pop_pointer() : () -> i64
      %791 = func.call @cc_nil_value() : () -> i64
      %792 = func.call @cc_errorp(%688) : (i64) -> i64
      %793 = arith.cmpi ne, %792, %791 : i64
      %794 = arith.cmpi eq, %791, %791 : i64
      %795 = arith.andi %793, %794 : i1
      %796 = scf.if %795 -> (i64) {
        scf.yield %688 : i64
      } else {
        scf.yield %791 : i64
      }
      %797 = func.call @cc_errorp(%713) : (i64) -> i64
      %798 = arith.cmpi ne, %797, %791 : i64
      %799 = arith.cmpi eq, %796, %791 : i64
      %800 = arith.andi %798, %799 : i1
      %801 = scf.if %800 -> (i64) {
        scf.yield %713 : i64
      } else {
        scf.yield %796 : i64
      }
      %802 = func.call @cc_errorp(%744) : (i64) -> i64
      %803 = arith.cmpi ne, %802, %791 : i64
      %804 = arith.cmpi eq, %801, %791 : i64
      %805 = arith.andi %803, %804 : i1
      %806 = scf.if %805 -> (i64) {
        scf.yield %744 : i64
      } else {
        scf.yield %801 : i64
      }
      %807 = func.call @cc_errorp(%758) : (i64) -> i64
      %808 = arith.cmpi ne, %807, %791 : i64
      %809 = arith.cmpi eq, %806, %791 : i64
      %810 = arith.andi %808, %809 : i1
      %811 = scf.if %810 -> (i64) {
        scf.yield %758 : i64
      } else {
        scf.yield %806 : i64
      }
      %812 = func.call @cc_errorp(%769) : (i64) -> i64
      %813 = arith.cmpi ne, %812, %791 : i64
      %814 = arith.cmpi eq, %811, %791 : i64
      %815 = arith.andi %813, %814 : i1
      %816 = scf.if %815 -> (i64) {
        scf.yield %769 : i64
      } else {
        scf.yield %811 : i64
      }
      %817 = func.call @cc_errorp(%770) : (i64) -> i64
      %818 = arith.cmpi ne, %817, %791 : i64
      %819 = arith.cmpi eq, %816, %791 : i64
      %820 = arith.andi %818, %819 : i1
      %821 = scf.if %820 -> (i64) {
        scf.yield %770 : i64
      } else {
        scf.yield %816 : i64
      }
      %822 = func.call @cc_errorp(%781) : (i64) -> i64
      %823 = arith.cmpi ne, %822, %791 : i64
      %824 = arith.cmpi eq, %821, %791 : i64
      %825 = arith.andi %823, %824 : i1
      %826 = scf.if %825 -> (i64) {
        scf.yield %781 : i64
      } else {
        scf.yield %821 : i64
      }
      %827 = func.call @cc_errorp(%790) : (i64) -> i64
      %828 = arith.cmpi ne, %827, %791 : i64
      %829 = arith.cmpi eq, %826, %791 : i64
      %830 = arith.andi %828, %829 : i1
      %831 = scf.if %830 -> (i64) {
        scf.yield %790 : i64
      } else {
        scf.yield %826 : i64
      }
      %832 = arith.cmpi ne, %831, %791 : i64
      scf.if %832 {
        func.call @stack_push_pointer(%831) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%688) : (i64) -> ()
        func.call @stack_push_pointer(%713) : (i64) -> ()
        func.call @stack_push_pointer(%744) : (i64) -> ()
        func.call @stack_push_pointer(%758) : (i64) -> ()
        func.call @stack_push_pointer(%769) : (i64) -> ()
        func.call @stack_push_pointer(%770) : (i64) -> ()
        func.call @stack_push_pointer(%781) : (i64) -> ()
        func.call @stack_push_pointer(%790) : (i64) -> ()
        %833 = llvm.mlir.addressof @str81 : !llvm.ptr
        %834 = func.call @cc_make_function_ref_const(%833) : (!llvm.ptr) -> i64
        %835 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%834, %835) : (i64, i64) -> ()
      }
      %836 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %836 : i64
    }
    %837 = func.call @cc_nil_value() : () -> i64
    %838 = func.call @cc_errorp(%679) : (i64) -> i64
    %839 = arith.cmpi ne, %838, %837 : i64
    %840 = scf.if %839 -> (i64) {
      scf.yield %679 : i64
    } else {
      %841 = llvm.mlir.addressof @str82 : !llvm.ptr
      %842 = arith.constant 29 : i64
      %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
      %844 = func.call @cc_nil_value() : () -> i64
      %845 = func.call @cc_intern(%843, %844) : (i64, i64) -> i64
      %846 = func.call @cc_nil_value() : () -> i64
      %847 = func.call @cc_cons(%845, %846) : (i64, i64) -> i64
      %848 = func.call @cc_values_pack(%847) : (i64) -> i64
      func.call @stack_push_pointer(%845) : (i64) -> ()
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = llvm.mlir.addressof @str83 : !llvm.ptr
      %851 = arith.constant 13 : i64
      %852 = func.call @cc_make_string(%850, %851) : (!llvm.ptr, i64) -> i64
      %853 = llvm.mlir.addressof @str84 : !llvm.ptr
      %854 = arith.constant 11 : i64
      %855 = func.call @cc_make_string(%853, %854) : (!llvm.ptr, i64) -> i64
      %856 = func.call @cc_intern(%852, %855) : (i64, i64) -> i64
      %857 = func.call @cc_nil_value() : () -> i64
      %858 = func.call @cc_cons(%856, %857) : (i64, i64) -> i64
      %859 = func.call @cc_values_pack(%858) : (i64) -> i64
      func.call @stack_push_pointer(%856) : (i64) -> ()
      %860 = llvm.mlir.addressof @str85 : !llvm.ptr
      %861 = arith.constant 6 : i64
      %862 = func.call @cc_make_string(%860, %861) : (!llvm.ptr, i64) -> i64
      %863 = func.call @cc_nil_value() : () -> i64
      %864 = func.call @cc_intern(%862, %863) : (i64, i64) -> i64
      %865 = func.call @cc_nil_value() : () -> i64
      %866 = func.call @cc_cons(%864, %865) : (i64, i64) -> i64
      %867 = func.call @cc_values_pack(%866) : (i64) -> i64
      func.call @stack_push_pointer(%864) : (i64) -> ()
      %868 = llvm.mlir.addressof @str86 : !llvm.ptr
      %869 = arith.constant 19 : i64
      %870 = func.call @cc_make_string(%868, %869) : (!llvm.ptr, i64) -> i64
      %871 = func.call @cc_nil_value() : () -> i64
      %872 = func.call @cc_intern(%870, %871) : (i64, i64) -> i64
      %873 = func.call @cc_nil_value() : () -> i64
      %874 = func.call @cc_cons(%872, %873) : (i64, i64) -> i64
      %875 = func.call @cc_values_pack(%874) : (i64) -> i64
      func.call @stack_push_pointer(%872) : (i64) -> ()
      %876 = llvm.mlir.addressof @str87 : !llvm.ptr
      %877 = arith.constant 7 : i64
      %878 = func.call @cc_make_string(%876, %877) : (!llvm.ptr, i64) -> i64
      %879 = func.call @cc_nil_value() : () -> i64
      %880 = func.call @cc_intern(%878, %879) : (i64, i64) -> i64
      %881 = func.call @cc_nil_value() : () -> i64
      %882 = func.call @cc_cons(%880, %881) : (i64, i64) -> i64
      %883 = func.call @cc_values_pack(%882) : (i64) -> i64
      func.call @stack_push_pointer(%880) : (i64) -> ()
      %884 = arith.constant 1.2000000476837158 : f64
      %885 = func.call @cc_box_single_float(%884) : (f64) -> i64
      func.call @stack_push_pointer(%885) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %886 = func.call @stack_pop_pointer() : () -> i64
      %887 = func.call @stack_pop_pointer() : () -> i64
      %888 = func.call @cc_cons(%887, %886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%888) : (i64) -> ()
      %889 = func.call @stack_pop_pointer() : () -> i64
      %890 = func.call @stack_pop_pointer() : () -> i64
      %891 = func.call @cc_cons(%890, %889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%891) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @cc_cons(%893, %892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%894) : (i64) -> ()
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = func.call @stack_pop_pointer() : () -> i64
      %897 = func.call @cc_cons(%896, %895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%897) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %898 = func.call @stack_pop_pointer() : () -> i64
      %899 = func.call @stack_pop_pointer() : () -> i64
      %900 = func.call @cc_cons(%899, %898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%900) : (i64) -> ()
      %901 = func.call @stack_pop_pointer() : () -> i64
      %902 = func.call @stack_pop_pointer() : () -> i64
      %903 = func.call @cc_cons(%902, %901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%903) : (i64) -> ()
      %904 = func.call @stack_pop_pointer() : () -> i64
      %905 = func.call @stack_pop_pointer() : () -> i64
      %906 = func.call @cc_cons(%905, %904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%906) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %907 = func.call @stack_pop_pointer() : () -> i64
      %908 = func.call @stack_pop_pointer() : () -> i64
      %909 = func.call @cc_cons(%908, %907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%909) : (i64) -> ()
      %910 = func.call @stack_pop_pointer() : () -> i64
      %911 = func.call @stack_pop_pointer() : () -> i64
      %912 = func.call @cc_cons(%911, %910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%912) : (i64) -> ()
      %913 = func.call @stack_pop_pointer() : () -> i64
      %970 = arith.constant 149526501392391 : i64
      %971 = arith.constant 0 : i64
      %972 = func.call @cc_make_closure(%970, %971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%972) : (i64) -> ()
      %973 = func.call @stack_pop_pointer() : () -> i64
      %974 = llvm.mlir.addressof @str89 : !llvm.ptr
      %975 = arith.constant 4 : i64
      %976 = func.call @cc_make_string(%974, %975) : (!llvm.ptr, i64) -> i64
      %977 = func.call @cc_nil_value() : () -> i64
      %978 = func.call @cc_intern(%976, %977) : (i64, i64) -> i64
      %979 = func.call @cc_nil_value() : () -> i64
      %980 = func.call @cc_cons(%978, %979) : (i64, i64) -> i64
      %981 = func.call @cc_values_pack(%980) : (i64) -> i64
      func.call @stack_push_pointer(%978) : (i64) -> ()
      %982 = llvm.mlir.addressof @str90 : !llvm.ptr
      %983 = arith.constant 5 : i64
      %984 = func.call @cc_make_string(%982, %983) : (!llvm.ptr, i64) -> i64
      %985 = func.call @cc_nil_value() : () -> i64
      %986 = func.call @cc_intern(%984, %985) : (i64, i64) -> i64
      %987 = func.call @cc_nil_value() : () -> i64
      %988 = func.call @cc_cons(%986, %987) : (i64, i64) -> i64
      %989 = func.call @cc_values_pack(%988) : (i64) -> i64
      func.call @stack_push_pointer(%986) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %990 = func.call @stack_pop_pointer() : () -> i64
      %991 = func.call @stack_pop_pointer() : () -> i64
      %992 = func.call @cc_cons(%991, %990) : (i64, i64) -> i64
      func.call @stack_push_pointer(%992) : (i64) -> ()
      %993 = func.call @stack_pop_pointer() : () -> i64
      %994 = func.call @stack_pop_pointer() : () -> i64
      %995 = func.call @cc_cons(%994, %993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%995) : (i64) -> ()
      %996 = func.call @stack_pop_pointer() : () -> i64
      %997 = llvm.mlir.addressof @str91 : !llvm.ptr
      %998 = arith.constant 11 : i64
      %999 = func.call @cc_make_string(%997, %998) : (!llvm.ptr, i64) -> i64
      %1000 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1001 = arith.constant 7 : i64
      %1002 = func.call @cc_make_string(%1000, %1001) : (!llvm.ptr, i64) -> i64
      %1003 = func.call @cc_intern(%999, %1002) : (i64, i64) -> i64
      %1004 = func.call @cc_nil_value() : () -> i64
      %1005 = func.call @cc_cons(%1003, %1004) : (i64, i64) -> i64
      %1006 = func.call @cc_values_pack(%1005) : (i64) -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
      %1007 = func.call @stack_pop_pointer() : () -> i64
      %1008 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1009 = arith.constant 24 : i64
      %1010 = func.call @cc_make_string(%1008, %1009) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1010) : (i64) -> ()
      %1011 = func.call @stack_pop_pointer() : () -> i64
      %1012 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1013 = arith.constant 4 : i64
      %1014 = func.call @cc_make_string(%1012, %1013) : (!llvm.ptr, i64) -> i64
      %1015 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1016 = arith.constant 7 : i64
      %1017 = func.call @cc_make_string(%1015, %1016) : (!llvm.ptr, i64) -> i64
      %1018 = func.call @cc_intern(%1014, %1017) : (i64, i64) -> i64
      %1019 = func.call @cc_nil_value() : () -> i64
      %1020 = func.call @cc_cons(%1018, %1019) : (i64, i64) -> i64
      %1021 = func.call @cc_values_pack(%1020) : (i64) -> i64
      func.call @stack_push_pointer(%1018) : (i64) -> ()
      %1022 = func.call @stack_pop_pointer() : () -> i64
      %1023 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1024 = arith.constant 5 : i64
      %1025 = func.call @cc_make_string(%1023, %1024) : (!llvm.ptr, i64) -> i64
      %1026 = func.call @cc_nil_value() : () -> i64
      %1027 = func.call @cc_intern(%1025, %1026) : (i64, i64) -> i64
      %1028 = func.call @cc_nil_value() : () -> i64
      %1029 = func.call @cc_cons(%1027, %1028) : (i64, i64) -> i64
      %1030 = func.call @cc_values_pack(%1029) : (i64) -> i64
      func.call @stack_push_pointer(%1027) : (i64) -> ()
      %1031 = func.call @stack_pop_pointer() : () -> i64
      %1032 = func.call @cc_nil_value() : () -> i64
      %1033 = func.call @cc_errorp(%849) : (i64) -> i64
      %1034 = arith.cmpi ne, %1033, %1032 : i64
      %1035 = arith.cmpi eq, %1032, %1032 : i64
      %1036 = arith.andi %1034, %1035 : i1
      %1037 = scf.if %1036 -> (i64) {
        scf.yield %849 : i64
      } else {
        scf.yield %1032 : i64
      }
      %1038 = func.call @cc_errorp(%913) : (i64) -> i64
      %1039 = arith.cmpi ne, %1038, %1032 : i64
      %1040 = arith.cmpi eq, %1037, %1032 : i64
      %1041 = arith.andi %1039, %1040 : i1
      %1042 = scf.if %1041 -> (i64) {
        scf.yield %913 : i64
      } else {
        scf.yield %1037 : i64
      }
      %1043 = func.call @cc_errorp(%973) : (i64) -> i64
      %1044 = arith.cmpi ne, %1043, %1032 : i64
      %1045 = arith.cmpi eq, %1042, %1032 : i64
      %1046 = arith.andi %1044, %1045 : i1
      %1047 = scf.if %1046 -> (i64) {
        scf.yield %973 : i64
      } else {
        scf.yield %1042 : i64
      }
      %1048 = func.call @cc_errorp(%996) : (i64) -> i64
      %1049 = arith.cmpi ne, %1048, %1032 : i64
      %1050 = arith.cmpi eq, %1047, %1032 : i64
      %1051 = arith.andi %1049, %1050 : i1
      %1052 = scf.if %1051 -> (i64) {
        scf.yield %996 : i64
      } else {
        scf.yield %1047 : i64
      }
      %1053 = func.call @cc_errorp(%1007) : (i64) -> i64
      %1054 = arith.cmpi ne, %1053, %1032 : i64
      %1055 = arith.cmpi eq, %1052, %1032 : i64
      %1056 = arith.andi %1054, %1055 : i1
      %1057 = scf.if %1056 -> (i64) {
        scf.yield %1007 : i64
      } else {
        scf.yield %1052 : i64
      }
      %1058 = func.call @cc_errorp(%1011) : (i64) -> i64
      %1059 = arith.cmpi ne, %1058, %1032 : i64
      %1060 = arith.cmpi eq, %1057, %1032 : i64
      %1061 = arith.andi %1059, %1060 : i1
      %1062 = scf.if %1061 -> (i64) {
        scf.yield %1011 : i64
      } else {
        scf.yield %1057 : i64
      }
      %1063 = func.call @cc_errorp(%1022) : (i64) -> i64
      %1064 = arith.cmpi ne, %1063, %1032 : i64
      %1065 = arith.cmpi eq, %1062, %1032 : i64
      %1066 = arith.andi %1064, %1065 : i1
      %1067 = scf.if %1066 -> (i64) {
        scf.yield %1022 : i64
      } else {
        scf.yield %1062 : i64
      }
      %1068 = func.call @cc_errorp(%1031) : (i64) -> i64
      %1069 = arith.cmpi ne, %1068, %1032 : i64
      %1070 = arith.cmpi eq, %1067, %1032 : i64
      %1071 = arith.andi %1069, %1070 : i1
      %1072 = scf.if %1071 -> (i64) {
        scf.yield %1031 : i64
      } else {
        scf.yield %1067 : i64
      }
      %1073 = arith.cmpi ne, %1072, %1032 : i64
      scf.if %1073 {
        func.call @stack_push_pointer(%1072) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%849) : (i64) -> ()
        func.call @stack_push_pointer(%913) : (i64) -> ()
        func.call @stack_push_pointer(%973) : (i64) -> ()
        func.call @stack_push_pointer(%996) : (i64) -> ()
        func.call @stack_push_pointer(%1007) : (i64) -> ()
        func.call @stack_push_pointer(%1011) : (i64) -> ()
        func.call @stack_push_pointer(%1022) : (i64) -> ()
        func.call @stack_push_pointer(%1031) : (i64) -> ()
        %1074 = llvm.mlir.addressof @str97 : !llvm.ptr
        %1075 = func.call @cc_make_function_ref_const(%1074) : (!llvm.ptr) -> i64
        %1076 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1075, %1076) : (i64, i64) -> ()
      }
      %1077 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1077 : i64
    }
    func.call @stack_push_pointer(%840) : (i64) -> ()
    %1078 = func.call @stack_pop_pointer() : () -> i64
    %1079 = func.call @cc_multiple_value_list(%1078) : (i64) -> i64
    %1080 = llvm.mlir.addressof @str98 : !llvm.ptr
    %1081 = arith.constant 38 : i64
    %1082 = func.call @cc_make_string(%1080, %1081) : (!llvm.ptr, i64) -> i64
    %1083 = func.call @cc_nil_value() : () -> i64
    %1084 = func.call @cc_intern(%1082, %1083) : (i64, i64) -> i64
    %1085 = func.call @cc_nil_value() : () -> i64
    %1086 = func.call @cc_cons(%1084, %1085) : (i64, i64) -> i64
    %1087 = func.call @cc_values_pack(%1086) : (i64) -> i64
    %1088 = func.call @cc_symbol_value(%1084) : (i64) -> i64
    %1089 = llvm.mlir.addressof @str99 : !llvm.ptr
    %1090 = arith.constant 40 : i64
    %1091 = func.call @cc_make_string(%1089, %1090) : (!llvm.ptr, i64) -> i64
    %1092 = func.call @cc_nil_value() : () -> i64
    %1093 = func.call @cc_intern(%1091, %1092) : (i64, i64) -> i64
    %1094 = func.call @cc_nil_value() : () -> i64
    %1095 = func.call @cc_cons(%1093, %1094) : (i64, i64) -> i64
    %1096 = func.call @cc_values_pack(%1095) : (i64) -> i64
    %1097 = func.call @cc_symbol_value(%1093) : (i64) -> i64
    %1098 = func.call @cc_nil_value() : () -> i64
    %1099 = arith.cmpi ne, %1088, %1098 : i64
    %1100 = scf.if %1099 -> (i64) {
      scf.yield %1097 : i64
    } else {
      scf.yield %1079 : i64
    }
    %1101 = func.call @cc_values_pack(%1100) : (i64) -> i64
    func.call @stack_push_pointer(%1101) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"fgf-foo_149526501392385_primary"() {
    %42 = func.call @stack_pop_pointer() : () -> i64
    %43 = llvm.mlir.addressof @str4 : !llvm.ptr
    %44 = arith.constant 7 : i64
    %45 = func.call @cc_make_string(%43, %44) : (!llvm.ptr, i64) -> i64
    %46 = llvm.mlir.addressof @str5 : !llvm.ptr
    %47 = arith.constant 7 : i64
    %48 = func.call @cc_make_string(%46, %47) : (!llvm.ptr, i64) -> i64
    %49 = func.call @cc_intern(%45, %48) : (i64, i64) -> i64
    %50 = func.call @cc_nil_value() : () -> i64
    %51 = func.call @cc_cons(%49, %50) : (i64, i64) -> i64
    %52 = func.call @cc_values_pack(%51) : (i64) -> i64
    func.call @stack_push_pointer(%49) : (i64) -> ()
    func.return
  }
  func.func @"fgf-foo_149526501392386_primary"() {
    %158 = func.call @stack_pop_pointer() : () -> i64
    %159 = llvm.mlir.addressof @str17 : !llvm.ptr
    %160 = arith.constant 6 : i64
    %161 = func.call @cc_make_string(%159, %160) : (!llvm.ptr, i64) -> i64
    %162 = llvm.mlir.addressof @str18 : !llvm.ptr
    %163 = arith.constant 7 : i64
    %164 = func.call @cc_make_string(%162, %163) : (!llvm.ptr, i64) -> i64
    %165 = func.call @cc_intern(%161, %164) : (i64, i64) -> i64
    %166 = func.call @cc_nil_value() : () -> i64
    %167 = func.call @cc_cons(%165, %166) : (i64, i64) -> i64
    %168 = func.call @cc_values_pack(%167) : (i64) -> i64
    func.call @stack_push_pointer(%165) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_149526501392387"() {
    %299 = func.call @cc_nil_value() : () -> i64
    %300 = func.call @cc_nil_value() : () -> i64
    %301 = func.call @cc_errorp(%299) : (i64) -> i64
    %302 = arith.cmpi ne, %301, %300 : i64
    %303 = scf.if %302 -> (i64) {
      scf.yield %299 : i64
    } else {
      %304 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%304) : (i64) -> ()
      %305 = func.call @stack_pop_pointer() : () -> i64
      %306 = func.call @cc_nil_value() : () -> i64
      %307 = func.call @cc_errorp(%305) : (i64) -> i64
      %308 = arith.cmpi ne, %307, %306 : i64
      %309 = arith.cmpi eq, %306, %306 : i64
      %310 = arith.andi %308, %309 : i1
      %311 = scf.if %310 -> (i64) {
        scf.yield %305 : i64
      } else {
        scf.yield %306 : i64
      }
      %312 = arith.cmpi ne, %311, %306 : i64
      scf.if %312 {
        func.call @stack_push_pointer(%311) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%305) : (i64) -> ()
        %313 = llvm.mlir.addressof @str32 : !llvm.ptr
        %314 = func.call @cc_make_function_ref_const(%313) : (!llvm.ptr) -> i64
        %315 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%314, %315) : (i64, i64) -> ()
      }
      %316 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %316 : i64
    }
    func.call @stack_push_pointer(%303) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_149526501392388"() {
    %444 = func.call @cc_nil_value() : () -> i64
    %445 = func.call @cc_nil_value() : () -> i64
    %446 = func.call @cc_errorp(%444) : (i64) -> i64
    %447 = arith.cmpi ne, %446, %445 : i64
    %448 = scf.if %447 -> (i64) {
      scf.yield %444 : i64
    } else {
      %449 = llvm.mlir.addressof @str44 : !llvm.ptr
      %450 = arith.constant 7 : i64
      %451 = func.call @cc_make_string(%449, %450) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%451) : (i64) -> ()
      %452 = func.call @stack_pop_pointer() : () -> i64
      %453 = func.call @cc_nil_value() : () -> i64
      %454 = func.call @cc_errorp(%452) : (i64) -> i64
      %455 = arith.cmpi ne, %454, %453 : i64
      %456 = arith.cmpi eq, %453, %453 : i64
      %457 = arith.andi %455, %456 : i1
      %458 = scf.if %457 -> (i64) {
        scf.yield %452 : i64
      } else {
        scf.yield %453 : i64
      }
      %459 = arith.cmpi ne, %458, %453 : i64
      scf.if %459 {
        func.call @stack_push_pointer(%458) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%452) : (i64) -> ()
        %460 = llvm.mlir.addressof @str45 : !llvm.ptr
        %461 = func.call @cc_make_function_ref_const(%460) : (!llvm.ptr) -> i64
        %462 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%461, %462) : (i64, i64) -> ()
      }
      %463 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %463 : i64
    }
    func.call @stack_push_pointer(%448) : (i64) -> ()
    func.return
  }
  func.func @"fgf-foo_149526501392389_primary"() {
    %564 = func.call @stack_pop_pointer() : () -> i64
    %565 = llvm.mlir.addressof @str54 : !llvm.ptr
    %566 = arith.constant 6 : i64
    %567 = func.call @cc_make_string(%565, %566) : (!llvm.ptr, i64) -> i64
    %568 = llvm.mlir.addressof @str55 : !llvm.ptr
    %569 = arith.constant 7 : i64
    %570 = func.call @cc_make_string(%568, %569) : (!llvm.ptr, i64) -> i64
    %571 = func.call @cc_intern(%567, %570) : (i64, i64) -> i64
    %572 = func.call @cc_nil_value() : () -> i64
    %573 = func.call @cc_cons(%571, %572) : (i64, i64) -> i64
    %574 = func.call @cc_values_pack(%573) : (i64) -> i64
    func.call @stack_push_pointer(%571) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_149526501392390"() {
    %714 = func.call @cc_nil_value() : () -> i64
    %715 = func.call @cc_nil_value() : () -> i64
    %716 = func.call @cc_errorp(%714) : (i64) -> i64
    %717 = arith.cmpi ne, %716, %715 : i64
    %718 = scf.if %717 -> (i64) {
      scf.yield %714 : i64
    } else {
      %719 = llvm.mlir.addressof @str71 : !llvm.ptr
      %720 = arith.constant 5 : i64
      %721 = func.call @cc_make_string(%719, %720) : (!llvm.ptr, i64) -> i64
      %722 = llvm.mlir.addressof @str72 : !llvm.ptr
      %723 = arith.constant 7 : i64
      %724 = func.call @cc_make_string(%722, %723) : (!llvm.ptr, i64) -> i64
      %725 = func.call @cc_intern(%721, %724) : (i64, i64) -> i64
      %726 = func.call @cc_nil_value() : () -> i64
      %727 = func.call @cc_cons(%725, %726) : (i64, i64) -> i64
      %728 = func.call @cc_values_pack(%727) : (i64) -> i64
      func.call @stack_push_pointer(%725) : (i64) -> ()
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @cc_nil_value() : () -> i64
      %731 = func.call @cc_errorp(%729) : (i64) -> i64
      %732 = arith.cmpi ne, %731, %730 : i64
      %733 = arith.cmpi eq, %730, %730 : i64
      %734 = arith.andi %732, %733 : i1
      %735 = scf.if %734 -> (i64) {
        scf.yield %729 : i64
      } else {
        scf.yield %730 : i64
      }
      %736 = arith.cmpi ne, %735, %730 : i64
      scf.if %736 {
        func.call @stack_push_pointer(%735) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%729) : (i64) -> ()
        %737 = llvm.mlir.addressof @str73 : !llvm.ptr
        %738 = func.call @cc_make_function_ref_const(%737) : (!llvm.ptr) -> i64
        %739 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%738, %739) : (i64, i64) -> ()
      }
      %740 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %740 : i64
    }
    func.call @stack_push_pointer(%718) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_149526501392391"() {
    %914 = func.call @cc_nil_value() : () -> i64
    %915 = func.call @cc_nil_value() : () -> i64
    %916 = func.call @cc_errorp(%914) : (i64) -> i64
    %917 = arith.cmpi ne, %916, %915 : i64
    %918 = scf.if %917 -> (i64) {
      scf.yield %914 : i64
    } else {
      %919 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %920 = func.call @cc_nil_value() : () -> i64
      %921 = func.call @cc_nil_value() : () -> i64
      %922 = func.call @cc_errorp(%920) : (i64) -> i64
      %923 = arith.cmpi ne, %922, %921 : i64
      %924 = scf.if %923 -> (i64) {
        scf.yield %920 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %925 = arith.constant 1.2000000476837158 : f64
        %926 = func.call @cc_box_single_float(%925) : (f64) -> i64
        func.call @stack_push_pointer(%926) : (i64) -> ()
        %927 = func.call @stack_pop_pointer() : () -> i64
        %928 = func.call @cc_nil_value() : () -> i64
        %929 = func.call @cc_errorp(%927) : (i64) -> i64
        %930 = arith.cmpi ne, %929, %928 : i64
        %931 = arith.cmpi eq, %928, %928 : i64
        %932 = arith.andi %930, %931 : i1
        %933 = scf.if %932 -> (i64) {
          scf.yield %927 : i64
        } else {
          scf.yield %928 : i64
        }
        %934 = arith.cmpi ne, %933, %928 : i64
        scf.if %934 {
          func.call @stack_push_pointer(%933) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%927) : (i64) -> ()
          %935 = llvm.mlir.addressof @str88 : !llvm.ptr
          %936 = func.call @cc_make_function_ref_const(%935) : (!llvm.ptr) -> i64
          %937 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%936, %937) : (i64, i64) -> ()
        }
        %938 = func.call @stack_pop_pointer() : () -> i64
        %939 = func.call @cc_errorp(%938) : (i64) -> i64
        %940 = func.call @cc_nil_value() : () -> i64
        %941 = arith.cmpi ne, %939, %940 : i64
        scf.if %941 {
          func.call @stack_push_pointer(%938) : (i64) -> ()
        } else {
          %942 = func.call @cc_multiple_value_list(%938) : (i64) -> i64
          func.call @stack_push_pointer(%942) : (i64) -> ()
        }
        %943 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %944 = func.call @stack_pop_pointer() : () -> i64
        %945 = func.call @cc_nil_value() : () -> i64
        %946 = func.call @cc_maybe_error_from_multiple_value_list(%943) : (i64) -> i64
        %947 = func.call @cc_errorp(%946) : (i64) -> i64
        %948 = arith.cmpi ne, %947, %945 : i64
        %949 = arith.cmpi eq, %945, %945 : i64
        %950 = arith.andi %948, %949 : i1
        %951 = scf.if %950 -> (i64) {
          scf.yield %946 : i64
        } else {
          scf.yield %945 : i64
        }
        %952 = arith.cmpi ne, %951, %945 : i64
        scf.if %952 {
          func.call @stack_push_pointer(%951) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %953 = func.call @stack_pop_pointer() : () -> i64
          %954 = func.call @cc_cons(%944, %953) : (i64, i64) -> i64
          func.call @stack_push_pointer(%954) : (i64) -> ()
          %955 = func.call @stack_pop_pointer() : () -> i64
          %956 = func.call @cc_cons(%943, %955) : (i64, i64) -> i64
          func.call @stack_push_pointer(%956) : (i64) -> ()
          %957 = func.call @stack_pop_pointer() : () -> i64
          %958 = func.call @cc_values_pack(%957) : (i64) -> i64
          func.call @stack_push_pointer(%958) : (i64) -> ()
        }
        %959 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %959 : i64
      }
      func.call @stack_push_pointer(%924) : (i64) -> ()
      %960 = func.call @stack_pop_pointer() : () -> i64
      %961 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %962 = func.call @cc_errorp(%960) : (i64) -> i64
      %963 = func.call @cc_nil_value() : () -> i64
      %964 = arith.cmpi ne, %962, %963 : i64
      scf.if %964 {
        %965 = func.call @cc_condition_value(%960) : (i64) -> i64
        %966 = func.call @cc_values2(%963, %965) : (i64, i64) -> i64
        func.call @stack_push_pointer(%966) : (i64) -> ()
      } else {
        %967 = func.call @cc_multiple_value_list(%960) : (i64) -> i64
        %968 = func.call @cc_values_pack(%967) : (i64) -> i64
        func.call @stack_push_pointer(%968) : (i64) -> ()
      }
      %969 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %969 : i64
    }
    func.call @stack_push_pointer(%918) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_149526501392384*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_149526501392384*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_149526501392384*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str5("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @method_name_149526501392385("fgf-foo_149526501392385_primary\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str7("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str12("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str15("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str17("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @method_name_149526501392386("fgf-foo_149526501392386_primary\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str20("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str28("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str29("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str30("DISPATCH-INTEGER\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str31("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("fgf-foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str33("INTEGER\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str35("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str36("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str37("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str38("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str39("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str41("DISPATCH-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str42("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("testing\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str44("testing\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("fgf-foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str46("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str47("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str48("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str53("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str54("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @method_name_149526501392389("fgf-foo_149526501392389_primary\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str57("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str58("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str61("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str62("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str63("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str64("X\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str65("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str66("DEFMETHOD\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str67("DISPATCH-SYMBOL\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str68("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str69("YADDA\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("YADDA\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str72("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str73("fgf-foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str74("SYMBOL\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str75("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str76("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str77("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str78("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str79("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str81("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str82("DISPATCH-NO-APPLICABLE-METHOD\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str83("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str84("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str86("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str87("FGF-FOO\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str88("fgf-foo\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str89("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str90("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str91("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str93("This should not dispatch\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str94("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str95("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str96("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str97("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str98("*__MLIR_BLOCK_RETFLAG_149526501392384*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str99("*__MLIR_BLOCK_RETMVLIST_149526501392384*\00") : !llvm.array<41 x i8>
}
