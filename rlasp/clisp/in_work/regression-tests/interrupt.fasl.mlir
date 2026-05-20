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
      %58 = func.call @cc_make_function_ref_const(%57) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%58) : (i64) -> ()
      %59 = func.call @stack_pop_pointer() : () -> i64
      %60 = llvm.mlir.addressof @str6 : !llvm.ptr
      %61 = arith.constant 20 : i64
      %62 = func.call @cc_make_string(%60, %61) : (!llvm.ptr, i64) -> i64
      %63 = llvm.mlir.addressof @str7 : !llvm.ptr
      %64 = arith.constant 15 : i64
      %65 = func.call @cc_make_string(%63, %64) : (!llvm.ptr, i64) -> i64
      %66 = func.call @cc_intern(%62, %65) : (i64, i64) -> i64
      %67 = func.call @cc_nil_value() : () -> i64
      %68 = func.call @cc_cons(%66, %67) : (i64, i64) -> i64
      %69 = func.call @cc_values_pack(%68) : (i64) -> i64
      %70 = func.call @cc_set_symbol_value(%66, %59) : (i64, i64) -> i64
      func.call @stack_push_pointer(%59) : (i64) -> ()
      %71 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %71 : i64
    }
    %72 = func.call @cc_nil_value() : () -> i64
    %73 = func.call @cc_errorp(%56) : (i64) -> i64
    %74 = arith.cmpi ne, %73, %72 : i64
    %75 = scf.if %74 -> (i64) {
      scf.yield %56 : i64
    } else {
      %76 = llvm.mlir.addressof @str8 : !llvm.ptr
      %77 = func.call @cc_make_function_ref_const(%76) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      %78 = func.call @stack_pop_pointer() : () -> i64
      %79 = llvm.mlir.addressof @str9 : !llvm.ptr
      %80 = arith.constant 20 : i64
      %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
      %82 = llvm.mlir.addressof @str10 : !llvm.ptr
      %83 = arith.constant 15 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = func.call @cc_intern(%81, %84) : (i64, i64) -> i64
      %86 = func.call @cc_nil_value() : () -> i64
      %87 = func.call @cc_cons(%85, %86) : (i64, i64) -> i64
      %88 = func.call @cc_values_pack(%87) : (i64) -> i64
      %89 = func.call @cc_set_symbol_value(%85, %78) : (i64, i64) -> i64
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %90 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %90 : i64
    }
    %91 = func.call @cc_nil_value() : () -> i64
    %92 = func.call @cc_errorp(%75) : (i64) -> i64
    %93 = arith.cmpi ne, %92, %91 : i64
    %94 = scf.if %93 -> (i64) {
      scf.yield %75 : i64
    } else {
      %95 = llvm.mlir.addressof @str11 : !llvm.ptr
      %96 = func.call @cc_make_function_ref_const(%95) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%96) : (i64) -> ()
      %97 = func.call @stack_pop_pointer() : () -> i64
      %98 = llvm.mlir.addressof @str12 : !llvm.ptr
      %99 = arith.constant 20 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      %101 = llvm.mlir.addressof @str13 : !llvm.ptr
      %102 = arith.constant 15 : i64
      %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
      %104 = func.call @cc_intern(%100, %103) : (i64, i64) -> i64
      %105 = func.call @cc_nil_value() : () -> i64
      %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
      %107 = func.call @cc_values_pack(%106) : (i64) -> i64
      %108 = func.call @cc_set_symbol_value(%104, %97) : (i64, i64) -> i64
      func.call @stack_push_pointer(%97) : (i64) -> ()
      %109 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %109 : i64
    }
    %110 = func.call @cc_nil_value() : () -> i64
    %111 = func.call @cc_errorp(%94) : (i64) -> i64
    %112 = arith.cmpi ne, %111, %110 : i64
    %113 = scf.if %112 -> (i64) {
      scf.yield %94 : i64
    } else {
      %114 = llvm.mlir.addressof @str14 : !llvm.ptr
      %115 = func.call @cc_make_function_ref_const(%114) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%115) : (i64) -> ()
      %116 = func.call @stack_pop_pointer() : () -> i64
      %117 = llvm.mlir.addressof @str15 : !llvm.ptr
      %118 = arith.constant 20 : i64
      %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
      %120 = llvm.mlir.addressof @str16 : !llvm.ptr
      %121 = arith.constant 15 : i64
      %122 = func.call @cc_make_string(%120, %121) : (!llvm.ptr, i64) -> i64
      %123 = func.call @cc_intern(%119, %122) : (i64, i64) -> i64
      %124 = func.call @cc_nil_value() : () -> i64
      %125 = func.call @cc_cons(%123, %124) : (i64, i64) -> i64
      %126 = func.call @cc_values_pack(%125) : (i64) -> i64
      %127 = func.call @cc_set_symbol_value(%123, %116) : (i64, i64) -> i64
      func.call @stack_push_pointer(%116) : (i64) -> ()
      %128 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %128 : i64
    }
    %129 = func.call @cc_nil_value() : () -> i64
    %130 = func.call @cc_errorp(%113) : (i64) -> i64
    %131 = arith.cmpi ne, %130, %129 : i64
    %132 = scf.if %131 -> (i64) {
      scf.yield %113 : i64
    } else {
      %133 = llvm.mlir.addressof @str17 : !llvm.ptr
      %134 = arith.constant 22 : i64
      %135 = func.call @cc_make_string(%133, %134) : (!llvm.ptr, i64) -> i64
      %136 = func.call @cc_nil_value() : () -> i64
      %137 = func.call @cc_intern(%135, %136) : (i64, i64) -> i64
      %138 = func.call @cc_nil_value() : () -> i64
      %139 = func.call @cc_cons(%137, %138) : (i64, i64) -> i64
      %140 = func.call @cc_values_pack(%139) : (i64) -> i64
      func.call @stack_push_pointer(%137) : (i64) -> ()
      %141 = func.call @stack_pop_pointer() : () -> i64
      %142 = llvm.mlir.addressof @str18 : !llvm.ptr
      %143 = arith.constant 3 : i64
      %144 = func.call @cc_make_string(%142, %143) : (!llvm.ptr, i64) -> i64
      %145 = func.call @cc_nil_value() : () -> i64
      %146 = func.call @cc_intern(%144, %145) : (i64, i64) -> i64
      %147 = func.call @cc_nil_value() : () -> i64
      %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
      %149 = func.call @cc_values_pack(%148) : (i64) -> i64
      func.call @stack_push_pointer(%146) : (i64) -> ()
      %150 = llvm.mlir.addressof @str19 : !llvm.ptr
      %151 = arith.constant 4 : i64
      %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
      %153 = func.call @cc_nil_value() : () -> i64
      %154 = func.call @cc_intern(%152, %153) : (i64, i64) -> i64
      %155 = func.call @cc_nil_value() : () -> i64
      %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
      %157 = func.call @cc_values_pack(%156) : (i64) -> i64
      func.call @stack_push_pointer(%154) : (i64) -> ()
      %158 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%158) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %159 = func.call @stack_pop_pointer() : () -> i64
      %160 = func.call @stack_pop_pointer() : () -> i64
      %161 = func.call @cc_cons(%160, %159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%161) : (i64) -> ()
      %162 = func.call @stack_pop_pointer() : () -> i64
      %163 = func.call @stack_pop_pointer() : () -> i64
      %164 = func.call @cc_cons(%163, %162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%164) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @stack_pop_pointer() : () -> i64
      %167 = func.call @cc_cons(%166, %165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%167) : (i64) -> ()
      %168 = llvm.mlir.addressof @str20 : !llvm.ptr
      %169 = arith.constant 20 : i64
      %170 = func.call @cc_make_string(%168, %169) : (!llvm.ptr, i64) -> i64
      %171 = func.call @cc_nil_value() : () -> i64
      %172 = func.call @cc_intern(%170, %171) : (i64, i64) -> i64
      %173 = func.call @cc_nil_value() : () -> i64
      %174 = func.call @cc_cons(%172, %173) : (i64, i64) -> i64
      %175 = func.call @cc_values_pack(%174) : (i64) -> i64
      func.call @stack_push_pointer(%172) : (i64) -> ()
      %176 = llvm.mlir.addressof @str21 : !llvm.ptr
      %177 = arith.constant 27 : i64
      %178 = func.call @cc_make_string(%176, %177) : (!llvm.ptr, i64) -> i64
      %179 = func.call @cc_nil_value() : () -> i64
      %180 = func.call @cc_intern(%178, %179) : (i64, i64) -> i64
      %181 = func.call @cc_nil_value() : () -> i64
      %182 = func.call @cc_cons(%180, %181) : (i64, i64) -> i64
      %183 = func.call @cc_values_pack(%182) : (i64) -> i64
      func.call @stack_push_pointer(%180) : (i64) -> ()
      %184 = llvm.mlir.addressof @str22 : !llvm.ptr
      %185 = arith.constant 4 : i64
      %186 = func.call @cc_make_string(%184, %185) : (!llvm.ptr, i64) -> i64
      %187 = llvm.mlir.addressof @str23 : !llvm.ptr
      %188 = arith.constant 11 : i64
      %189 = func.call @cc_make_string(%187, %188) : (!llvm.ptr, i64) -> i64
      %190 = func.call @cc_intern(%186, %189) : (i64, i64) -> i64
      %191 = func.call @cc_nil_value() : () -> i64
      %192 = func.call @cc_cons(%190, %191) : (i64, i64) -> i64
      %193 = func.call @cc_values_pack(%192) : (i64) -> i64
      func.call @stack_push_pointer(%190) : (i64) -> ()
      %194 = llvm.mlir.addressof @str24 : !llvm.ptr
      %195 = arith.constant 4 : i64
      %196 = func.call @cc_make_string(%194, %195) : (!llvm.ptr, i64) -> i64
      %197 = func.call @cc_nil_value() : () -> i64
      %198 = func.call @cc_intern(%196, %197) : (i64, i64) -> i64
      %199 = func.call @cc_nil_value() : () -> i64
      %200 = func.call @cc_cons(%198, %199) : (i64, i64) -> i64
      %201 = func.call @cc_values_pack(%200) : (i64) -> i64
      func.call @stack_push_pointer(%198) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %202 = func.call @stack_pop_pointer() : () -> i64
      %203 = func.call @stack_pop_pointer() : () -> i64
      %204 = func.call @cc_cons(%203, %202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%204) : (i64) -> ()
      %205 = func.call @stack_pop_pointer() : () -> i64
      %206 = func.call @stack_pop_pointer() : () -> i64
      %207 = func.call @cc_cons(%206, %205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%207) : (i64) -> ()
      %208 = func.call @stack_pop_pointer() : () -> i64
      %209 = func.call @stack_pop_pointer() : () -> i64
      %210 = func.call @cc_cons(%209, %208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%210) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %211 = func.call @stack_pop_pointer() : () -> i64
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @cc_cons(%212, %211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%213) : (i64) -> ()
      %214 = func.call @stack_pop_pointer() : () -> i64
      %215 = func.call @stack_pop_pointer() : () -> i64
      %216 = func.call @cc_cons(%215, %214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%216) : (i64) -> ()
      %217 = llvm.mlir.addressof @str25 : !llvm.ptr
      %218 = arith.constant 14 : i64
      %219 = func.call @cc_make_string(%217, %218) : (!llvm.ptr, i64) -> i64
      %220 = llvm.mlir.addressof @str26 : !llvm.ptr
      %221 = arith.constant 2 : i64
      %222 = func.call @cc_make_string(%220, %221) : (!llvm.ptr, i64) -> i64
      %223 = func.call @cc_intern(%219, %222) : (i64, i64) -> i64
      %224 = func.call @cc_nil_value() : () -> i64
      %225 = func.call @cc_cons(%223, %224) : (i64, i64) -> i64
      %226 = func.call @cc_values_pack(%225) : (i64) -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %227 = llvm.mlir.addressof @str27 : !llvm.ptr
      %228 = arith.constant 27 : i64
      %229 = func.call @cc_make_string(%227, %228) : (!llvm.ptr, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_intern(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_nil_value() : () -> i64
      %233 = func.call @cc_cons(%231, %232) : (i64, i64) -> i64
      %234 = func.call @cc_values_pack(%233) : (i64) -> i64
      func.call @stack_push_pointer(%231) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %235 = func.call @stack_pop_pointer() : () -> i64
      %236 = func.call @stack_pop_pointer() : () -> i64
      %237 = func.call @cc_cons(%236, %235) : (i64, i64) -> i64
      func.call @stack_push_pointer(%237) : (i64) -> ()
      %238 = func.call @stack_pop_pointer() : () -> i64
      %239 = func.call @stack_pop_pointer() : () -> i64
      %240 = func.call @cc_cons(%239, %238) : (i64, i64) -> i64
      func.call @stack_push_pointer(%240) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %241 = func.call @stack_pop_pointer() : () -> i64
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @cc_cons(%242, %241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%243) : (i64) -> ()
      %244 = func.call @stack_pop_pointer() : () -> i64
      %245 = func.call @stack_pop_pointer() : () -> i64
      %246 = func.call @cc_cons(%245, %244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%246) : (i64) -> ()
      %247 = func.call @stack_pop_pointer() : () -> i64
      %248 = func.call @stack_pop_pointer() : () -> i64
      %249 = func.call @cc_cons(%248, %247) : (i64, i64) -> i64
      func.call @stack_push_pointer(%249) : (i64) -> ()
      %250 = llvm.mlir.addressof @str28 : !llvm.ptr
      %251 = arith.constant 4 : i64
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
      %267 = func.call @stack_pop_pointer() : () -> i64
      %268 = func.call @stack_pop_pointer() : () -> i64
      %269 = func.call @cc_cons(%268, %267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%269) : (i64) -> ()
      %270 = func.call @stack_pop_pointer() : () -> i64
      %510 = arith.constant 4634242382299137 : i64
      %511 = arith.constant 0 : i64
      %512 = func.call @cc_make_closure(%510, %511) : (i64, i64) -> i64
      func.call @stack_push_pointer(%512) : (i64) -> ()
      %513 = func.call @stack_pop_pointer() : () -> i64
      %514 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%514) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %515 = func.call @stack_pop_pointer() : () -> i64
      %516 = func.call @stack_pop_pointer() : () -> i64
      %517 = func.call @cc_cons(%516, %515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%517) : (i64) -> ()
      %518 = func.call @stack_pop_pointer() : () -> i64
      %519 = llvm.mlir.addressof @str41 : !llvm.ptr
      %520 = arith.constant 11 : i64
      %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
      %522 = llvm.mlir.addressof @str42 : !llvm.ptr
      %523 = arith.constant 7 : i64
      %524 = func.call @cc_make_string(%522, %523) : (!llvm.ptr, i64) -> i64
      %525 = func.call @cc_intern(%521, %524) : (i64, i64) -> i64
      %526 = func.call @cc_nil_value() : () -> i64
      %527 = func.call @cc_cons(%525, %526) : (i64, i64) -> i64
      %528 = func.call @cc_values_pack(%527) : (i64) -> i64
      func.call @stack_push_pointer(%525) : (i64) -> ()
      %529 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %530 = func.call @stack_pop_pointer() : () -> i64
      %531 = llvm.mlir.addressof @str43 : !llvm.ptr
      %532 = arith.constant 4 : i64
      %533 = func.call @cc_make_string(%531, %532) : (!llvm.ptr, i64) -> i64
      %534 = llvm.mlir.addressof @str44 : !llvm.ptr
      %535 = arith.constant 7 : i64
      %536 = func.call @cc_make_string(%534, %535) : (!llvm.ptr, i64) -> i64
      %537 = func.call @cc_intern(%533, %536) : (i64, i64) -> i64
      %538 = func.call @cc_nil_value() : () -> i64
      %539 = func.call @cc_cons(%537, %538) : (i64, i64) -> i64
      %540 = func.call @cc_values_pack(%539) : (i64) -> i64
      func.call @stack_push_pointer(%537) : (i64) -> ()
      %541 = func.call @stack_pop_pointer() : () -> i64
      %542 = llvm.mlir.addressof @str45 : !llvm.ptr
      %543 = arith.constant 6 : i64
      %544 = func.call @cc_make_string(%542, %543) : (!llvm.ptr, i64) -> i64
      %545 = func.call @cc_nil_value() : () -> i64
      %546 = func.call @cc_intern(%544, %545) : (i64, i64) -> i64
      %547 = func.call @cc_nil_value() : () -> i64
      %548 = func.call @cc_cons(%546, %547) : (i64, i64) -> i64
      %549 = func.call @cc_values_pack(%548) : (i64) -> i64
      func.call @stack_push_pointer(%546) : (i64) -> ()
      %550 = func.call @stack_pop_pointer() : () -> i64
      %551 = func.call @cc_nil_value() : () -> i64
      %552 = func.call @cc_errorp(%141) : (i64) -> i64
      %553 = arith.cmpi ne, %552, %551 : i64
      %554 = arith.cmpi eq, %551, %551 : i64
      %555 = arith.andi %553, %554 : i1
      %556 = scf.if %555 -> (i64) {
        scf.yield %141 : i64
      } else {
        scf.yield %551 : i64
      }
      %557 = func.call @cc_errorp(%270) : (i64) -> i64
      %558 = arith.cmpi ne, %557, %551 : i64
      %559 = arith.cmpi eq, %556, %551 : i64
      %560 = arith.andi %558, %559 : i1
      %561 = scf.if %560 -> (i64) {
        scf.yield %270 : i64
      } else {
        scf.yield %556 : i64
      }
      %562 = func.call @cc_errorp(%513) : (i64) -> i64
      %563 = arith.cmpi ne, %562, %551 : i64
      %564 = arith.cmpi eq, %561, %551 : i64
      %565 = arith.andi %563, %564 : i1
      %566 = scf.if %565 -> (i64) {
        scf.yield %513 : i64
      } else {
        scf.yield %561 : i64
      }
      %567 = func.call @cc_errorp(%518) : (i64) -> i64
      %568 = arith.cmpi ne, %567, %551 : i64
      %569 = arith.cmpi eq, %566, %551 : i64
      %570 = arith.andi %568, %569 : i1
      %571 = scf.if %570 -> (i64) {
        scf.yield %518 : i64
      } else {
        scf.yield %566 : i64
      }
      %572 = func.call @cc_errorp(%529) : (i64) -> i64
      %573 = arith.cmpi ne, %572, %551 : i64
      %574 = arith.cmpi eq, %571, %551 : i64
      %575 = arith.andi %573, %574 : i1
      %576 = scf.if %575 -> (i64) {
        scf.yield %529 : i64
      } else {
        scf.yield %571 : i64
      }
      %577 = func.call @cc_errorp(%530) : (i64) -> i64
      %578 = arith.cmpi ne, %577, %551 : i64
      %579 = arith.cmpi eq, %576, %551 : i64
      %580 = arith.andi %578, %579 : i1
      %581 = scf.if %580 -> (i64) {
        scf.yield %530 : i64
      } else {
        scf.yield %576 : i64
      }
      %582 = func.call @cc_errorp(%541) : (i64) -> i64
      %583 = arith.cmpi ne, %582, %551 : i64
      %584 = arith.cmpi eq, %581, %551 : i64
      %585 = arith.andi %583, %584 : i1
      %586 = scf.if %585 -> (i64) {
        scf.yield %541 : i64
      } else {
        scf.yield %581 : i64
      }
      %587 = func.call @cc_errorp(%550) : (i64) -> i64
      %588 = arith.cmpi ne, %587, %551 : i64
      %589 = arith.cmpi eq, %586, %551 : i64
      %590 = arith.andi %588, %589 : i1
      %591 = scf.if %590 -> (i64) {
        scf.yield %550 : i64
      } else {
        scf.yield %586 : i64
      }
      %592 = arith.cmpi ne, %591, %551 : i64
      scf.if %592 {
        func.call @stack_push_pointer(%591) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%141) : (i64) -> ()
        func.call @stack_push_pointer(%270) : (i64) -> ()
        func.call @stack_push_pointer(%513) : (i64) -> ()
        func.call @stack_push_pointer(%518) : (i64) -> ()
        func.call @stack_push_pointer(%529) : (i64) -> ()
        func.call @stack_push_pointer(%530) : (i64) -> ()
        func.call @stack_push_pointer(%541) : (i64) -> ()
        func.call @stack_push_pointer(%550) : (i64) -> ()
        %593 = llvm.mlir.addressof @str46 : !llvm.ptr
        %594 = func.call @cc_make_function_ref_const(%593) : (!llvm.ptr) -> i64
        %595 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%594, %595) : (i64, i64) -> ()
      }
      %596 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %596 : i64
    }
    %597 = func.call @cc_nil_value() : () -> i64
    %598 = func.call @cc_errorp(%132) : (i64) -> i64
    %599 = arith.cmpi ne, %598, %597 : i64
    %600 = scf.if %599 -> (i64) {
      scf.yield %132 : i64
    } else {
      %601 = llvm.mlir.addressof @str47 : !llvm.ptr
      %602 = arith.constant 16 : i64
      %603 = func.call @cc_make_string(%601, %602) : (!llvm.ptr, i64) -> i64
      %604 = func.call @cc_nil_value() : () -> i64
      %605 = func.call @cc_intern(%603, %604) : (i64, i64) -> i64
      %606 = func.call @cc_nil_value() : () -> i64
      %607 = func.call @cc_cons(%605, %606) : (i64, i64) -> i64
      %608 = func.call @cc_values_pack(%607) : (i64) -> i64
      func.call @stack_push_pointer(%605) : (i64) -> ()
      %609 = func.call @stack_pop_pointer() : () -> i64
      %610 = llvm.mlir.addressof @str48 : !llvm.ptr
      %611 = arith.constant 4 : i64
      %612 = func.call @cc_make_string(%610, %611) : (!llvm.ptr, i64) -> i64
      %613 = func.call @cc_nil_value() : () -> i64
      %614 = func.call @cc_intern(%612, %613) : (i64, i64) -> i64
      %615 = func.call @cc_nil_value() : () -> i64
      %616 = func.call @cc_cons(%614, %615) : (i64, i64) -> i64
      %617 = func.call @cc_values_pack(%616) : (i64) -> i64
      func.call @stack_push_pointer(%614) : (i64) -> ()
      %618 = llvm.mlir.addressof @str49 : !llvm.ptr
      %619 = arith.constant 4 : i64
      %620 = func.call @cc_make_string(%618, %619) : (!llvm.ptr, i64) -> i64
      %621 = func.call @cc_nil_value() : () -> i64
      %622 = func.call @cc_intern(%620, %621) : (i64, i64) -> i64
      %623 = func.call @cc_nil_value() : () -> i64
      %624 = func.call @cc_cons(%622, %623) : (i64, i64) -> i64
      %625 = func.call @cc_values_pack(%624) : (i64) -> i64
      func.call @stack_push_pointer(%622) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %626 = func.call @stack_pop_pointer() : () -> i64
      %627 = func.call @stack_pop_pointer() : () -> i64
      %628 = func.call @cc_cons(%627, %626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%628) : (i64) -> ()
      %629 = func.call @stack_pop_pointer() : () -> i64
      %630 = func.call @stack_pop_pointer() : () -> i64
      %631 = func.call @cc_cons(%630, %629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%631) : (i64) -> ()
      %632 = llvm.mlir.addressof @str50 : !llvm.ptr
      %633 = arith.constant 4 : i64
      %634 = func.call @cc_make_string(%632, %633) : (!llvm.ptr, i64) -> i64
      %635 = func.call @cc_nil_value() : () -> i64
      %636 = func.call @cc_intern(%634, %635) : (i64, i64) -> i64
      %637 = func.call @cc_nil_value() : () -> i64
      %638 = func.call @cc_cons(%636, %637) : (i64, i64) -> i64
      %639 = func.call @cc_values_pack(%638) : (i64) -> i64
      func.call @stack_push_pointer(%636) : (i64) -> ()
      %640 = llvm.mlir.addressof @str51 : !llvm.ptr
      %641 = arith.constant 20 : i64
      %642 = func.call @cc_make_string(%640, %641) : (!llvm.ptr, i64) -> i64
      %643 = llvm.mlir.addressof @str52 : !llvm.ptr
      %644 = arith.constant 2 : i64
      %645 = func.call @cc_make_string(%643, %644) : (!llvm.ptr, i64) -> i64
      %646 = func.call @cc_intern(%642, %645) : (i64, i64) -> i64
      %647 = func.call @cc_nil_value() : () -> i64
      %648 = func.call @cc_cons(%646, %647) : (i64, i64) -> i64
      %649 = func.call @cc_values_pack(%648) : (i64) -> i64
      func.call @stack_push_pointer(%646) : (i64) -> ()
      %650 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%650) : (i64) -> ()
      %651 = llvm.mlir.addressof @str53 : !llvm.ptr
      %652 = arith.constant 21 : i64
      %653 = func.call @cc_make_string(%651, %652) : (!llvm.ptr, i64) -> i64
      %654 = func.call @cc_nil_value() : () -> i64
      %655 = func.call @cc_intern(%653, %654) : (i64, i64) -> i64
      %656 = func.call @cc_nil_value() : () -> i64
      %657 = func.call @cc_cons(%655, %656) : (i64, i64) -> i64
      %658 = func.call @cc_values_pack(%657) : (i64) -> i64
      func.call @stack_push_pointer(%655) : (i64) -> ()
      %659 = func.call @stack_pop_pointer() : () -> i64
      %660 = func.call @stack_pop_pointer() : () -> i64
      %661 = func.call @cc_cons(%659, %660) : (i64, i64) -> i64
      %662 = llvm.mlir.addressof @str54 : !llvm.ptr
      %663 = arith.constant 5 : i64
      %664 = func.call @cc_make_string(%662, %663) : (!llvm.ptr, i64) -> i64
      %665 = func.call @cc_nil_value() : () -> i64
      %666 = func.call @cc_intern(%664, %665) : (i64, i64) -> i64
      %667 = func.call @cc_nil_value() : () -> i64
      %668 = func.call @cc_cons(%666, %667) : (i64, i64) -> i64
      %669 = func.call @cc_values_pack(%668) : (i64) -> i64
      %670 = func.call @cc_cons(%666, %661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%670) : (i64) -> ()
      %671 = llvm.mlir.addressof @str55 : !llvm.ptr
      %672 = arith.constant 6 : i64
      %673 = func.call @cc_make_string(%671, %672) : (!llvm.ptr, i64) -> i64
      %674 = func.call @cc_nil_value() : () -> i64
      %675 = func.call @cc_intern(%673, %674) : (i64, i64) -> i64
      %676 = func.call @cc_nil_value() : () -> i64
      %677 = func.call @cc_cons(%675, %676) : (i64, i64) -> i64
      %678 = func.call @cc_values_pack(%677) : (i64) -> i64
      func.call @stack_push_pointer(%675) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %679 = llvm.mlir.addressof @str56 : !llvm.ptr
      %680 = arith.constant 12 : i64
      %681 = func.call @cc_make_string(%679, %680) : (!llvm.ptr, i64) -> i64
      %682 = llvm.mlir.addressof @str57 : !llvm.ptr
      %683 = arith.constant 11 : i64
      %684 = func.call @cc_make_string(%682, %683) : (!llvm.ptr, i64) -> i64
      %685 = func.call @cc_intern(%681, %684) : (i64, i64) -> i64
      %686 = func.call @cc_nil_value() : () -> i64
      %687 = func.call @cc_cons(%685, %686) : (i64, i64) -> i64
      %688 = func.call @cc_values_pack(%687) : (i64) -> i64
      func.call @stack_push_pointer(%685) : (i64) -> ()
      %689 = llvm.mlir.addressof @str58 : !llvm.ptr
      %690 = arith.constant 4 : i64
      %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
      %692 = func.call @cc_nil_value() : () -> i64
      %693 = func.call @cc_intern(%691, %692) : (i64, i64) -> i64
      %694 = func.call @cc_nil_value() : () -> i64
      %695 = func.call @cc_cons(%693, %694) : (i64, i64) -> i64
      %696 = func.call @cc_values_pack(%695) : (i64) -> i64
      func.call @stack_push_pointer(%693) : (i64) -> ()
      %697 = llvm.mlir.addressof @str59 : !llvm.ptr
      %698 = arith.constant 24 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      %700 = llvm.mlir.addressof @str60 : !llvm.ptr
      %701 = arith.constant 4 : i64
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
      func.call @stack_push_nil() : () -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @cc_cons(%711, %710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %713 = func.call @stack_pop_pointer() : () -> i64
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = func.call @cc_cons(%714, %713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%715) : (i64) -> ()
      %716 = llvm.mlir.addressof @str61 : !llvm.ptr
      %717 = arith.constant 22 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = llvm.mlir.addressof @str62 : !llvm.ptr
      %720 = arith.constant 2 : i64
      %721 = func.call @cc_make_string(%719, %720) : (!llvm.ptr, i64) -> i64
      %722 = func.call @cc_intern(%718, %721) : (i64, i64) -> i64
      %723 = func.call @cc_nil_value() : () -> i64
      %724 = func.call @cc_cons(%722, %723) : (i64, i64) -> i64
      %725 = func.call @cc_values_pack(%724) : (i64) -> i64
      func.call @stack_push_pointer(%722) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %726 = llvm.mlir.addressof @str63 : !llvm.ptr
      %727 = arith.constant 4 : i64
      %728 = func.call @cc_make_string(%726, %727) : (!llvm.ptr, i64) -> i64
      %729 = llvm.mlir.addressof @str64 : !llvm.ptr
      %730 = arith.constant 11 : i64
      %731 = func.call @cc_make_string(%729, %730) : (!llvm.ptr, i64) -> i64
      %732 = func.call @cc_intern(%728, %731) : (i64, i64) -> i64
      %733 = func.call @cc_nil_value() : () -> i64
      %734 = func.call @cc_cons(%732, %733) : (i64, i64) -> i64
      %735 = func.call @cc_values_pack(%734) : (i64) -> i64
      func.call @stack_push_pointer(%732) : (i64) -> ()
      %736 = llvm.mlir.addressof @str65 : !llvm.ptr
      %737 = arith.constant 4 : i64
      %738 = func.call @cc_make_string(%736, %737) : (!llvm.ptr, i64) -> i64
      %739 = func.call @cc_nil_value() : () -> i64
      %740 = func.call @cc_intern(%738, %739) : (i64, i64) -> i64
      %741 = func.call @cc_nil_value() : () -> i64
      %742 = func.call @cc_cons(%740, %741) : (i64, i64) -> i64
      %743 = func.call @cc_values_pack(%742) : (i64) -> i64
      func.call @stack_push_pointer(%740) : (i64) -> ()
      %744 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%744) : (i64) -> ()
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
      %760 = func.call @stack_pop_pointer() : () -> i64
      %761 = func.call @stack_pop_pointer() : () -> i64
      %762 = func.call @cc_cons(%761, %760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%762) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = func.call @stack_pop_pointer() : () -> i64
      %765 = func.call @cc_cons(%764, %763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%765) : (i64) -> ()
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
      %779 = func.call @stack_pop_pointer() : () -> i64
      %780 = func.call @cc_cons(%779, %778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%780) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %781 = func.call @stack_pop_pointer() : () -> i64
      %782 = func.call @stack_pop_pointer() : () -> i64
      %783 = func.call @cc_cons(%782, %781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%783) : (i64) -> ()
      %784 = func.call @stack_pop_pointer() : () -> i64
      %785 = func.call @stack_pop_pointer() : () -> i64
      %786 = func.call @cc_cons(%785, %784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%786) : (i64) -> ()
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = func.call @cc_cons(%788, %787) : (i64, i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %796 = func.call @stack_pop_pointer() : () -> i64
      %797 = func.call @stack_pop_pointer() : () -> i64
      %798 = func.call @cc_cons(%797, %796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%798) : (i64) -> ()
      %799 = func.call @stack_pop_pointer() : () -> i64
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = func.call @cc_cons(%800, %799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%801) : (i64) -> ()
      %802 = llvm.mlir.addressof @str66 : !llvm.ptr
      %803 = arith.constant 14 : i64
      %804 = func.call @cc_make_string(%802, %803) : (!llvm.ptr, i64) -> i64
      %805 = llvm.mlir.addressof @str67 : !llvm.ptr
      %806 = arith.constant 2 : i64
      %807 = func.call @cc_make_string(%805, %806) : (!llvm.ptr, i64) -> i64
      %808 = func.call @cc_intern(%804, %807) : (i64, i64) -> i64
      %809 = func.call @cc_nil_value() : () -> i64
      %810 = func.call @cc_cons(%808, %809) : (i64, i64) -> i64
      %811 = func.call @cc_values_pack(%810) : (i64) -> i64
      func.call @stack_push_pointer(%808) : (i64) -> ()
      %812 = llvm.mlir.addressof @str68 : !llvm.ptr
      %813 = arith.constant 4 : i64
      %814 = func.call @cc_make_string(%812, %813) : (!llvm.ptr, i64) -> i64
      %815 = func.call @cc_nil_value() : () -> i64
      %816 = func.call @cc_intern(%814, %815) : (i64, i64) -> i64
      %817 = func.call @cc_nil_value() : () -> i64
      %818 = func.call @cc_cons(%816, %817) : (i64, i64) -> i64
      %819 = func.call @cc_values_pack(%818) : (i64) -> i64
      func.call @stack_push_pointer(%816) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %820 = func.call @stack_pop_pointer() : () -> i64
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @cc_cons(%821, %820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%822) : (i64) -> ()
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @stack_pop_pointer() : () -> i64
      %825 = func.call @cc_cons(%824, %823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%825) : (i64) -> ()
      %826 = llvm.mlir.addressof @str69 : !llvm.ptr
      %827 = arith.constant 13 : i64
      %828 = func.call @cc_make_string(%826, %827) : (!llvm.ptr, i64) -> i64
      %829 = llvm.mlir.addressof @str70 : !llvm.ptr
      %830 = arith.constant 11 : i64
      %831 = func.call @cc_make_string(%829, %830) : (!llvm.ptr, i64) -> i64
      %832 = func.call @cc_intern(%828, %831) : (i64, i64) -> i64
      %833 = func.call @cc_nil_value() : () -> i64
      %834 = func.call @cc_cons(%832, %833) : (i64, i64) -> i64
      %835 = func.call @cc_values_pack(%834) : (i64) -> i64
      func.call @stack_push_pointer(%832) : (i64) -> ()
      %836 = llvm.mlir.addressof @str71 : !llvm.ptr
      %837 = arith.constant 12 : i64
      %838 = func.call @cc_make_string(%836, %837) : (!llvm.ptr, i64) -> i64
      %839 = llvm.mlir.addressof @str72 : !llvm.ptr
      %840 = arith.constant 2 : i64
      %841 = func.call @cc_make_string(%839, %840) : (!llvm.ptr, i64) -> i64
      %842 = func.call @cc_intern(%838, %841) : (i64, i64) -> i64
      %843 = func.call @cc_nil_value() : () -> i64
      %844 = func.call @cc_cons(%842, %843) : (i64, i64) -> i64
      %845 = func.call @cc_values_pack(%844) : (i64) -> i64
      func.call @stack_push_pointer(%842) : (i64) -> ()
      %846 = llvm.mlir.addressof @str73 : !llvm.ptr
      %847 = arith.constant 4 : i64
      %848 = func.call @cc_make_string(%846, %847) : (!llvm.ptr, i64) -> i64
      %849 = func.call @cc_nil_value() : () -> i64
      %850 = func.call @cc_intern(%848, %849) : (i64, i64) -> i64
      %851 = func.call @cc_nil_value() : () -> i64
      %852 = func.call @cc_cons(%850, %851) : (i64, i64) -> i64
      %853 = func.call @cc_values_pack(%852) : (i64) -> i64
      func.call @stack_push_pointer(%850) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %854 = func.call @stack_pop_pointer() : () -> i64
      %855 = func.call @stack_pop_pointer() : () -> i64
      %856 = func.call @cc_cons(%855, %854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%856) : (i64) -> ()
      %857 = func.call @stack_pop_pointer() : () -> i64
      %858 = func.call @stack_pop_pointer() : () -> i64
      %859 = func.call @cc_cons(%858, %857) : (i64, i64) -> i64
      func.call @stack_push_pointer(%859) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %860 = func.call @stack_pop_pointer() : () -> i64
      %861 = func.call @stack_pop_pointer() : () -> i64
      %862 = func.call @cc_cons(%861, %860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%862) : (i64) -> ()
      %863 = func.call @stack_pop_pointer() : () -> i64
      %864 = func.call @stack_pop_pointer() : () -> i64
      %865 = func.call @cc_cons(%864, %863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%865) : (i64) -> ()
      %866 = llvm.mlir.addressof @str74 : !llvm.ptr
      %867 = arith.constant 4 : i64
      %868 = func.call @cc_make_string(%866, %867) : (!llvm.ptr, i64) -> i64
      %869 = func.call @cc_nil_value() : () -> i64
      %870 = func.call @cc_intern(%868, %869) : (i64, i64) -> i64
      %871 = func.call @cc_nil_value() : () -> i64
      %872 = func.call @cc_cons(%870, %871) : (i64, i64) -> i64
      %873 = func.call @cc_values_pack(%872) : (i64) -> i64
      func.call @stack_push_pointer(%870) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %874 = func.call @stack_pop_pointer() : () -> i64
      %875 = func.call @stack_pop_pointer() : () -> i64
      %876 = func.call @cc_cons(%875, %874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%876) : (i64) -> ()
      %877 = func.call @stack_pop_pointer() : () -> i64
      %878 = func.call @stack_pop_pointer() : () -> i64
      %879 = func.call @cc_cons(%878, %877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%879) : (i64) -> ()
      %880 = func.call @stack_pop_pointer() : () -> i64
      %881 = func.call @stack_pop_pointer() : () -> i64
      %882 = func.call @cc_cons(%881, %880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%882) : (i64) -> ()
      %883 = func.call @stack_pop_pointer() : () -> i64
      %884 = func.call @stack_pop_pointer() : () -> i64
      %885 = func.call @cc_cons(%884, %883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%885) : (i64) -> ()
      %886 = func.call @stack_pop_pointer() : () -> i64
      %887 = func.call @stack_pop_pointer() : () -> i64
      %888 = func.call @cc_cons(%887, %886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%888) : (i64) -> ()
      %889 = func.call @stack_pop_pointer() : () -> i64
      %1180 = arith.constant 4634242382299141 : i64
      %1181 = arith.constant 0 : i64
      %1182 = func.call @cc_make_closure(%1180, %1181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1182) : (i64) -> ()
      %1183 = func.call @stack_pop_pointer() : () -> i64
      %1184 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1184) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1185 = func.call @stack_pop_pointer() : () -> i64
      %1186 = func.call @stack_pop_pointer() : () -> i64
      %1187 = func.call @cc_cons(%1186, %1185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1187) : (i64) -> ()
      %1188 = func.call @stack_pop_pointer() : () -> i64
      %1189 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1190 = arith.constant 11 : i64
      %1191 = func.call @cc_make_string(%1189, %1190) : (!llvm.ptr, i64) -> i64
      %1192 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1193 = arith.constant 7 : i64
      %1194 = func.call @cc_make_string(%1192, %1193) : (!llvm.ptr, i64) -> i64
      %1195 = func.call @cc_intern(%1191, %1194) : (i64, i64) -> i64
      %1196 = func.call @cc_nil_value() : () -> i64
      %1197 = func.call @cc_cons(%1195, %1196) : (i64, i64) -> i64
      %1198 = func.call @cc_values_pack(%1197) : (i64) -> i64
      func.call @stack_push_pointer(%1195) : (i64) -> ()
      %1199 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1200 = func.call @stack_pop_pointer() : () -> i64
      %1201 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1202 = arith.constant 4 : i64
      %1203 = func.call @cc_make_string(%1201, %1202) : (!llvm.ptr, i64) -> i64
      %1204 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1205 = arith.constant 7 : i64
      %1206 = func.call @cc_make_string(%1204, %1205) : (!llvm.ptr, i64) -> i64
      %1207 = func.call @cc_intern(%1203, %1206) : (i64, i64) -> i64
      %1208 = func.call @cc_nil_value() : () -> i64
      %1209 = func.call @cc_cons(%1207, %1208) : (i64, i64) -> i64
      %1210 = func.call @cc_values_pack(%1209) : (i64) -> i64
      func.call @stack_push_pointer(%1207) : (i64) -> ()
      %1211 = func.call @stack_pop_pointer() : () -> i64
      %1212 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1213 = arith.constant 6 : i64
      %1214 = func.call @cc_make_string(%1212, %1213) : (!llvm.ptr, i64) -> i64
      %1215 = func.call @cc_nil_value() : () -> i64
      %1216 = func.call @cc_intern(%1214, %1215) : (i64, i64) -> i64
      %1217 = func.call @cc_nil_value() : () -> i64
      %1218 = func.call @cc_cons(%1216, %1217) : (i64, i64) -> i64
      %1219 = func.call @cc_values_pack(%1218) : (i64) -> i64
      func.call @stack_push_pointer(%1216) : (i64) -> ()
      %1220 = func.call @stack_pop_pointer() : () -> i64
      %1221 = func.call @cc_nil_value() : () -> i64
      %1222 = func.call @cc_errorp(%609) : (i64) -> i64
      %1223 = arith.cmpi ne, %1222, %1221 : i64
      %1224 = arith.cmpi eq, %1221, %1221 : i64
      %1225 = arith.andi %1223, %1224 : i1
      %1226 = scf.if %1225 -> (i64) {
        scf.yield %609 : i64
      } else {
        scf.yield %1221 : i64
      }
      %1227 = func.call @cc_errorp(%889) : (i64) -> i64
      %1228 = arith.cmpi ne, %1227, %1221 : i64
      %1229 = arith.cmpi eq, %1226, %1221 : i64
      %1230 = arith.andi %1228, %1229 : i1
      %1231 = scf.if %1230 -> (i64) {
        scf.yield %889 : i64
      } else {
        scf.yield %1226 : i64
      }
      %1232 = func.call @cc_errorp(%1183) : (i64) -> i64
      %1233 = arith.cmpi ne, %1232, %1221 : i64
      %1234 = arith.cmpi eq, %1231, %1221 : i64
      %1235 = arith.andi %1233, %1234 : i1
      %1236 = scf.if %1235 -> (i64) {
        scf.yield %1183 : i64
      } else {
        scf.yield %1231 : i64
      }
      %1237 = func.call @cc_errorp(%1188) : (i64) -> i64
      %1238 = arith.cmpi ne, %1237, %1221 : i64
      %1239 = arith.cmpi eq, %1236, %1221 : i64
      %1240 = arith.andi %1238, %1239 : i1
      %1241 = scf.if %1240 -> (i64) {
        scf.yield %1188 : i64
      } else {
        scf.yield %1236 : i64
      }
      %1242 = func.call @cc_errorp(%1199) : (i64) -> i64
      %1243 = arith.cmpi ne, %1242, %1221 : i64
      %1244 = arith.cmpi eq, %1241, %1221 : i64
      %1245 = arith.andi %1243, %1244 : i1
      %1246 = scf.if %1245 -> (i64) {
        scf.yield %1199 : i64
      } else {
        scf.yield %1241 : i64
      }
      %1247 = func.call @cc_errorp(%1200) : (i64) -> i64
      %1248 = arith.cmpi ne, %1247, %1221 : i64
      %1249 = arith.cmpi eq, %1246, %1221 : i64
      %1250 = arith.andi %1248, %1249 : i1
      %1251 = scf.if %1250 -> (i64) {
        scf.yield %1200 : i64
      } else {
        scf.yield %1246 : i64
      }
      %1252 = func.call @cc_errorp(%1211) : (i64) -> i64
      %1253 = arith.cmpi ne, %1252, %1221 : i64
      %1254 = arith.cmpi eq, %1251, %1221 : i64
      %1255 = arith.andi %1253, %1254 : i1
      %1256 = scf.if %1255 -> (i64) {
        scf.yield %1211 : i64
      } else {
        scf.yield %1251 : i64
      }
      %1257 = func.call @cc_errorp(%1220) : (i64) -> i64
      %1258 = arith.cmpi ne, %1257, %1221 : i64
      %1259 = arith.cmpi eq, %1256, %1221 : i64
      %1260 = arith.andi %1258, %1259 : i1
      %1261 = scf.if %1260 -> (i64) {
        scf.yield %1220 : i64
      } else {
        scf.yield %1256 : i64
      }
      %1262 = arith.cmpi ne, %1261, %1221 : i64
      scf.if %1262 {
        func.call @stack_push_pointer(%1261) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%609) : (i64) -> ()
        func.call @stack_push_pointer(%889) : (i64) -> ()
        func.call @stack_push_pointer(%1183) : (i64) -> ()
        func.call @stack_push_pointer(%1188) : (i64) -> ()
        func.call @stack_push_pointer(%1199) : (i64) -> ()
        func.call @stack_push_pointer(%1200) : (i64) -> ()
        func.call @stack_push_pointer(%1211) : (i64) -> ()
        func.call @stack_push_pointer(%1220) : (i64) -> ()
        %1263 = llvm.mlir.addressof @str96 : !llvm.ptr
        %1264 = func.call @cc_make_function_ref_const(%1263) : (!llvm.ptr) -> i64
        %1265 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1264, %1265) : (i64, i64) -> ()
      }
      %1266 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1266 : i64
    }
    %1267 = func.call @cc_nil_value() : () -> i64
    %1268 = func.call @cc_errorp(%600) : (i64) -> i64
    %1269 = arith.cmpi ne, %1268, %1267 : i64
    %1270 = scf.if %1269 -> (i64) {
      scf.yield %600 : i64
    } else {
      %1271 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1272 = arith.constant 14 : i64
      %1273 = func.call @cc_make_string(%1271, %1272) : (!llvm.ptr, i64) -> i64
      %1274 = func.call @cc_nil_value() : () -> i64
      %1275 = func.call @cc_intern(%1273, %1274) : (i64, i64) -> i64
      %1276 = func.call @cc_nil_value() : () -> i64
      %1277 = func.call @cc_cons(%1275, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_values_pack(%1277) : (i64) -> i64
      func.call @stack_push_pointer(%1275) : (i64) -> ()
      %1279 = func.call @stack_pop_pointer() : () -> i64
      %1280 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1281 = arith.constant 3 : i64
      %1282 = func.call @cc_make_string(%1280, %1281) : (!llvm.ptr, i64) -> i64
      %1283 = func.call @cc_nil_value() : () -> i64
      %1284 = func.call @cc_intern(%1282, %1283) : (i64, i64) -> i64
      %1285 = func.call @cc_nil_value() : () -> i64
      %1286 = func.call @cc_cons(%1284, %1285) : (i64, i64) -> i64
      %1287 = func.call @cc_values_pack(%1286) : (i64) -> i64
      func.call @stack_push_pointer(%1284) : (i64) -> ()
      %1288 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1289 = arith.constant 4 : i64
      %1290 = func.call @cc_make_string(%1288, %1289) : (!llvm.ptr, i64) -> i64
      %1291 = func.call @cc_nil_value() : () -> i64
      %1292 = func.call @cc_intern(%1290, %1291) : (i64, i64) -> i64
      %1293 = func.call @cc_nil_value() : () -> i64
      %1294 = func.call @cc_cons(%1292, %1293) : (i64, i64) -> i64
      %1295 = func.call @cc_values_pack(%1294) : (i64) -> i64
      func.call @stack_push_pointer(%1292) : (i64) -> ()
      %1296 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1297 = arith.constant 4 : i64
      %1298 = func.call @cc_make_string(%1296, %1297) : (!llvm.ptr, i64) -> i64
      %1299 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1300 = arith.constant 11 : i64
      %1301 = func.call @cc_make_string(%1299, %1300) : (!llvm.ptr, i64) -> i64
      %1302 = func.call @cc_intern(%1298, %1301) : (i64, i64) -> i64
      %1303 = func.call @cc_nil_value() : () -> i64
      %1304 = func.call @cc_cons(%1302, %1303) : (i64, i64) -> i64
      %1305 = func.call @cc_values_pack(%1304) : (i64) -> i64
      func.call @stack_push_pointer(%1302) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1306 = func.call @stack_pop_pointer() : () -> i64
      %1307 = func.call @stack_pop_pointer() : () -> i64
      %1308 = func.call @cc_cons(%1307, %1306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1308) : (i64) -> ()
      %1309 = func.call @stack_pop_pointer() : () -> i64
      %1310 = func.call @stack_pop_pointer() : () -> i64
      %1311 = func.call @cc_cons(%1310, %1309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1312 = func.call @stack_pop_pointer() : () -> i64
      %1313 = func.call @stack_pop_pointer() : () -> i64
      %1314 = func.call @cc_cons(%1313, %1312) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1314) : (i64) -> ()
      %1315 = func.call @stack_pop_pointer() : () -> i64
      %1316 = func.call @stack_pop_pointer() : () -> i64
      %1317 = func.call @cc_cons(%1316, %1315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1318 = func.call @stack_pop_pointer() : () -> i64
      %1319 = func.call @stack_pop_pointer() : () -> i64
      %1320 = func.call @cc_cons(%1319, %1318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1320) : (i64) -> ()
      %1321 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1322 = arith.constant 20 : i64
      %1323 = func.call @cc_make_string(%1321, %1322) : (!llvm.ptr, i64) -> i64
      %1324 = func.call @cc_nil_value() : () -> i64
      %1325 = func.call @cc_intern(%1323, %1324) : (i64, i64) -> i64
      %1326 = func.call @cc_nil_value() : () -> i64
      %1327 = func.call @cc_cons(%1325, %1326) : (i64, i64) -> i64
      %1328 = func.call @cc_values_pack(%1327) : (i64) -> i64
      func.call @stack_push_pointer(%1325) : (i64) -> ()
      %1329 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1330 = arith.constant 19 : i64
      %1331 = func.call @cc_make_string(%1329, %1330) : (!llvm.ptr, i64) -> i64
      %1332 = func.call @cc_nil_value() : () -> i64
      %1333 = func.call @cc_intern(%1331, %1332) : (i64, i64) -> i64
      %1334 = func.call @cc_nil_value() : () -> i64
      %1335 = func.call @cc_cons(%1333, %1334) : (i64, i64) -> i64
      %1336 = func.call @cc_values_pack(%1335) : (i64) -> i64
      func.call @stack_push_pointer(%1333) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1337 = func.call @stack_pop_pointer() : () -> i64
      %1338 = func.call @stack_pop_pointer() : () -> i64
      %1339 = func.call @cc_cons(%1338, %1337) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1339) : (i64) -> ()
      %1340 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1341 = arith.constant 17 : i64
      %1342 = func.call @cc_make_string(%1340, %1341) : (!llvm.ptr, i64) -> i64
      %1343 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1344 = arith.constant 2 : i64
      %1345 = func.call @cc_make_string(%1343, %1344) : (!llvm.ptr, i64) -> i64
      %1346 = func.call @cc_intern(%1342, %1345) : (i64, i64) -> i64
      %1347 = func.call @cc_nil_value() : () -> i64
      %1348 = func.call @cc_cons(%1346, %1347) : (i64, i64) -> i64
      %1349 = func.call @cc_values_pack(%1348) : (i64) -> i64
      func.call @stack_push_pointer(%1346) : (i64) -> ()
      %1350 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1351 = arith.constant 19 : i64
      %1352 = func.call @cc_make_string(%1350, %1351) : (!llvm.ptr, i64) -> i64
      %1353 = func.call @cc_nil_value() : () -> i64
      %1354 = func.call @cc_intern(%1352, %1353) : (i64, i64) -> i64
      %1355 = func.call @cc_nil_value() : () -> i64
      %1356 = func.call @cc_cons(%1354, %1355) : (i64, i64) -> i64
      %1357 = func.call @cc_values_pack(%1356) : (i64) -> i64
      func.call @stack_push_pointer(%1354) : (i64) -> ()
      %1358 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1359 = arith.constant 6 : i64
      %1360 = func.call @cc_make_string(%1358, %1359) : (!llvm.ptr, i64) -> i64
      %1361 = func.call @cc_nil_value() : () -> i64
      %1362 = func.call @cc_intern(%1360, %1361) : (i64, i64) -> i64
      %1363 = func.call @cc_nil_value() : () -> i64
      %1364 = func.call @cc_cons(%1362, %1363) : (i64, i64) -> i64
      %1365 = func.call @cc_values_pack(%1364) : (i64) -> i64
      func.call @stack_push_pointer(%1362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1366 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1367 = arith.constant 4 : i64
      %1368 = func.call @cc_make_string(%1366, %1367) : (!llvm.ptr, i64) -> i64
      %1369 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1370 = arith.constant 11 : i64
      %1371 = func.call @cc_make_string(%1369, %1370) : (!llvm.ptr, i64) -> i64
      %1372 = func.call @cc_intern(%1368, %1371) : (i64, i64) -> i64
      %1373 = func.call @cc_nil_value() : () -> i64
      %1374 = func.call @cc_cons(%1372, %1373) : (i64, i64) -> i64
      %1375 = func.call @cc_values_pack(%1374) : (i64) -> i64
      func.call @stack_push_pointer(%1372) : (i64) -> ()
      %1376 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1377 = arith.constant 6 : i64
      %1378 = func.call @cc_make_string(%1376, %1377) : (!llvm.ptr, i64) -> i64
      %1379 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1380 = arith.constant 2 : i64
      %1381 = func.call @cc_make_string(%1379, %1380) : (!llvm.ptr, i64) -> i64
      %1382 = func.call @cc_intern(%1378, %1381) : (i64, i64) -> i64
      %1383 = func.call @cc_nil_value() : () -> i64
      %1384 = func.call @cc_cons(%1382, %1383) : (i64, i64) -> i64
      %1385 = func.call @cc_values_pack(%1384) : (i64) -> i64
      func.call @stack_push_pointer(%1382) : (i64) -> ()
      %1386 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1387 = arith.constant 3 : i64
      %1388 = func.call @cc_make_string(%1386, %1387) : (!llvm.ptr, i64) -> i64
      %1389 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1390 = arith.constant 11 : i64
      %1391 = func.call @cc_make_string(%1389, %1390) : (!llvm.ptr, i64) -> i64
      %1392 = func.call @cc_intern(%1388, %1391) : (i64, i64) -> i64
      %1393 = func.call @cc_nil_value() : () -> i64
      %1394 = func.call @cc_cons(%1392, %1393) : (i64, i64) -> i64
      %1395 = func.call @cc_values_pack(%1394) : (i64) -> i64
      func.call @stack_push_pointer(%1392) : (i64) -> ()
      %1396 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1397 = arith.constant 4 : i64
      %1398 = func.call @cc_make_string(%1396, %1397) : (!llvm.ptr, i64) -> i64
      %1399 = func.call @cc_nil_value() : () -> i64
      %1400 = func.call @cc_intern(%1398, %1399) : (i64, i64) -> i64
      %1401 = func.call @cc_nil_value() : () -> i64
      %1402 = func.call @cc_cons(%1400, %1401) : (i64, i64) -> i64
      %1403 = func.call @cc_values_pack(%1402) : (i64) -> i64
      func.call @stack_push_pointer(%1400) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1404 = func.call @stack_pop_pointer() : () -> i64
      %1405 = func.call @stack_pop_pointer() : () -> i64
      %1406 = func.call @cc_cons(%1405, %1404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1406) : (i64) -> ()
      %1407 = func.call @stack_pop_pointer() : () -> i64
      %1408 = func.call @stack_pop_pointer() : () -> i64
      %1409 = func.call @cc_cons(%1408, %1407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1409) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1410 = func.call @stack_pop_pointer() : () -> i64
      %1411 = func.call @stack_pop_pointer() : () -> i64
      %1412 = func.call @cc_cons(%1411, %1410) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1412) : (i64) -> ()
      %1413 = func.call @stack_pop_pointer() : () -> i64
      %1414 = func.call @stack_pop_pointer() : () -> i64
      %1415 = func.call @cc_cons(%1414, %1413) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1415) : (i64) -> ()
      %1416 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1416) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1417 = func.call @stack_pop_pointer() : () -> i64
      %1418 = func.call @stack_pop_pointer() : () -> i64
      %1419 = func.call @cc_cons(%1418, %1417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1419) : (i64) -> ()
      %1420 = func.call @stack_pop_pointer() : () -> i64
      %1421 = func.call @stack_pop_pointer() : () -> i64
      %1422 = func.call @cc_cons(%1421, %1420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1422) : (i64) -> ()
      %1423 = func.call @stack_pop_pointer() : () -> i64
      %1424 = func.call @stack_pop_pointer() : () -> i64
      %1425 = func.call @cc_cons(%1424, %1423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1425) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1426 = func.call @stack_pop_pointer() : () -> i64
      %1427 = func.call @stack_pop_pointer() : () -> i64
      %1428 = func.call @cc_cons(%1427, %1426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1428) : (i64) -> ()
      %1429 = func.call @stack_pop_pointer() : () -> i64
      %1430 = func.call @stack_pop_pointer() : () -> i64
      %1431 = func.call @cc_cons(%1430, %1429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1431) : (i64) -> ()
      %1432 = func.call @stack_pop_pointer() : () -> i64
      %1433 = func.call @stack_pop_pointer() : () -> i64
      %1434 = func.call @cc_cons(%1433, %1432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1434) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1435 = func.call @stack_pop_pointer() : () -> i64
      %1436 = func.call @stack_pop_pointer() : () -> i64
      %1437 = func.call @cc_cons(%1436, %1435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1437) : (i64) -> ()
      %1438 = func.call @stack_pop_pointer() : () -> i64
      %1439 = func.call @stack_pop_pointer() : () -> i64
      %1440 = func.call @cc_cons(%1439, %1438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1440) : (i64) -> ()
      %1441 = func.call @stack_pop_pointer() : () -> i64
      %1442 = func.call @stack_pop_pointer() : () -> i64
      %1443 = func.call @cc_cons(%1442, %1441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1443) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1444 = func.call @stack_pop_pointer() : () -> i64
      %1445 = func.call @stack_pop_pointer() : () -> i64
      %1446 = func.call @cc_cons(%1445, %1444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1446) : (i64) -> ()
      %1447 = func.call @stack_pop_pointer() : () -> i64
      %1448 = func.call @stack_pop_pointer() : () -> i64
      %1449 = func.call @cc_cons(%1448, %1447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1449) : (i64) -> ()
      %1450 = func.call @stack_pop_pointer() : () -> i64
      %1451 = func.call @stack_pop_pointer() : () -> i64
      %1452 = func.call @cc_cons(%1451, %1450) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1452) : (i64) -> ()
      %1453 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1454 = arith.constant 4 : i64
      %1455 = func.call @cc_make_string(%1453, %1454) : (!llvm.ptr, i64) -> i64
      %1456 = func.call @cc_nil_value() : () -> i64
      %1457 = func.call @cc_intern(%1455, %1456) : (i64, i64) -> i64
      %1458 = func.call @cc_nil_value() : () -> i64
      %1459 = func.call @cc_cons(%1457, %1458) : (i64, i64) -> i64
      %1460 = func.call @cc_values_pack(%1459) : (i64) -> i64
      func.call @stack_push_pointer(%1457) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1461 = func.call @stack_pop_pointer() : () -> i64
      %1462 = func.call @stack_pop_pointer() : () -> i64
      %1463 = func.call @cc_cons(%1462, %1461) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1463) : (i64) -> ()
      %1464 = func.call @stack_pop_pointer() : () -> i64
      %1465 = func.call @stack_pop_pointer() : () -> i64
      %1466 = func.call @cc_cons(%1465, %1464) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1466) : (i64) -> ()
      %1467 = func.call @stack_pop_pointer() : () -> i64
      %1468 = func.call @stack_pop_pointer() : () -> i64
      %1469 = func.call @cc_cons(%1468, %1467) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1469) : (i64) -> ()
      %1470 = func.call @stack_pop_pointer() : () -> i64
      %1471 = func.call @stack_pop_pointer() : () -> i64
      %1472 = func.call @cc_cons(%1471, %1470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1472) : (i64) -> ()
      %1473 = func.call @stack_pop_pointer() : () -> i64
      %1737 = arith.constant 4634242382299145 : i64
      %1738 = arith.constant 0 : i64
      %1739 = func.call @cc_make_closure(%1737, %1738) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1739) : (i64) -> ()
      %1740 = func.call @stack_pop_pointer() : () -> i64
      %1741 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1741) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1742 = func.call @stack_pop_pointer() : () -> i64
      %1743 = func.call @stack_pop_pointer() : () -> i64
      %1744 = func.call @cc_cons(%1743, %1742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1744) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1745 = func.call @stack_pop_pointer() : () -> i64
      %1746 = func.call @stack_pop_pointer() : () -> i64
      %1747 = func.call @cc_cons(%1746, %1745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1747) : (i64) -> ()
      %1748 = func.call @stack_pop_pointer() : () -> i64
      %1749 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1750 = arith.constant 11 : i64
      %1751 = func.call @cc_make_string(%1749, %1750) : (!llvm.ptr, i64) -> i64
      %1752 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1753 = arith.constant 7 : i64
      %1754 = func.call @cc_make_string(%1752, %1753) : (!llvm.ptr, i64) -> i64
      %1755 = func.call @cc_intern(%1751, %1754) : (i64, i64) -> i64
      %1756 = func.call @cc_nil_value() : () -> i64
      %1757 = func.call @cc_cons(%1755, %1756) : (i64, i64) -> i64
      %1758 = func.call @cc_values_pack(%1757) : (i64) -> i64
      func.call @stack_push_pointer(%1755) : (i64) -> ()
      %1759 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1760 = func.call @stack_pop_pointer() : () -> i64
      %1761 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1762 = arith.constant 4 : i64
      %1763 = func.call @cc_make_string(%1761, %1762) : (!llvm.ptr, i64) -> i64
      %1764 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1765 = arith.constant 7 : i64
      %1766 = func.call @cc_make_string(%1764, %1765) : (!llvm.ptr, i64) -> i64
      %1767 = func.call @cc_intern(%1763, %1766) : (i64, i64) -> i64
      %1768 = func.call @cc_nil_value() : () -> i64
      %1769 = func.call @cc_cons(%1767, %1768) : (i64, i64) -> i64
      %1770 = func.call @cc_values_pack(%1769) : (i64) -> i64
      func.call @stack_push_pointer(%1767) : (i64) -> ()
      %1771 = func.call @stack_pop_pointer() : () -> i64
      %1772 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1773 = arith.constant 6 : i64
      %1774 = func.call @cc_make_string(%1772, %1773) : (!llvm.ptr, i64) -> i64
      %1775 = func.call @cc_nil_value() : () -> i64
      %1776 = func.call @cc_intern(%1774, %1775) : (i64, i64) -> i64
      %1777 = func.call @cc_nil_value() : () -> i64
      %1778 = func.call @cc_cons(%1776, %1777) : (i64, i64) -> i64
      %1779 = func.call @cc_values_pack(%1778) : (i64) -> i64
      func.call @stack_push_pointer(%1776) : (i64) -> ()
      %1780 = func.call @stack_pop_pointer() : () -> i64
      %1781 = func.call @cc_nil_value() : () -> i64
      %1782 = func.call @cc_errorp(%1279) : (i64) -> i64
      %1783 = arith.cmpi ne, %1782, %1781 : i64
      %1784 = arith.cmpi eq, %1781, %1781 : i64
      %1785 = arith.andi %1783, %1784 : i1
      %1786 = scf.if %1785 -> (i64) {
        scf.yield %1279 : i64
      } else {
        scf.yield %1781 : i64
      }
      %1787 = func.call @cc_errorp(%1473) : (i64) -> i64
      %1788 = arith.cmpi ne, %1787, %1781 : i64
      %1789 = arith.cmpi eq, %1786, %1781 : i64
      %1790 = arith.andi %1788, %1789 : i1
      %1791 = scf.if %1790 -> (i64) {
        scf.yield %1473 : i64
      } else {
        scf.yield %1786 : i64
      }
      %1792 = func.call @cc_errorp(%1740) : (i64) -> i64
      %1793 = arith.cmpi ne, %1792, %1781 : i64
      %1794 = arith.cmpi eq, %1791, %1781 : i64
      %1795 = arith.andi %1793, %1794 : i1
      %1796 = scf.if %1795 -> (i64) {
        scf.yield %1740 : i64
      } else {
        scf.yield %1791 : i64
      }
      %1797 = func.call @cc_errorp(%1748) : (i64) -> i64
      %1798 = arith.cmpi ne, %1797, %1781 : i64
      %1799 = arith.cmpi eq, %1796, %1781 : i64
      %1800 = arith.andi %1798, %1799 : i1
      %1801 = scf.if %1800 -> (i64) {
        scf.yield %1748 : i64
      } else {
        scf.yield %1796 : i64
      }
      %1802 = func.call @cc_errorp(%1759) : (i64) -> i64
      %1803 = arith.cmpi ne, %1802, %1781 : i64
      %1804 = arith.cmpi eq, %1801, %1781 : i64
      %1805 = arith.andi %1803, %1804 : i1
      %1806 = scf.if %1805 -> (i64) {
        scf.yield %1759 : i64
      } else {
        scf.yield %1801 : i64
      }
      %1807 = func.call @cc_errorp(%1760) : (i64) -> i64
      %1808 = arith.cmpi ne, %1807, %1781 : i64
      %1809 = arith.cmpi eq, %1806, %1781 : i64
      %1810 = arith.andi %1808, %1809 : i1
      %1811 = scf.if %1810 -> (i64) {
        scf.yield %1760 : i64
      } else {
        scf.yield %1806 : i64
      }
      %1812 = func.call @cc_errorp(%1771) : (i64) -> i64
      %1813 = arith.cmpi ne, %1812, %1781 : i64
      %1814 = arith.cmpi eq, %1811, %1781 : i64
      %1815 = arith.andi %1813, %1814 : i1
      %1816 = scf.if %1815 -> (i64) {
        scf.yield %1771 : i64
      } else {
        scf.yield %1811 : i64
      }
      %1817 = func.call @cc_errorp(%1780) : (i64) -> i64
      %1818 = arith.cmpi ne, %1817, %1781 : i64
      %1819 = arith.cmpi eq, %1816, %1781 : i64
      %1820 = arith.andi %1818, %1819 : i1
      %1821 = scf.if %1820 -> (i64) {
        scf.yield %1780 : i64
      } else {
        scf.yield %1816 : i64
      }
      %1822 = arith.cmpi ne, %1821, %1781 : i64
      scf.if %1822 {
        func.call @stack_push_pointer(%1821) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1279) : (i64) -> ()
        func.call @stack_push_pointer(%1473) : (i64) -> ()
        func.call @stack_push_pointer(%1740) : (i64) -> ()
        func.call @stack_push_pointer(%1748) : (i64) -> ()
        func.call @stack_push_pointer(%1759) : (i64) -> ()
        func.call @stack_push_pointer(%1760) : (i64) -> ()
        func.call @stack_push_pointer(%1771) : (i64) -> ()
        func.call @stack_push_pointer(%1780) : (i64) -> ()
        %1823 = llvm.mlir.addressof @str133 : !llvm.ptr
        %1824 = func.call @cc_make_function_ref_const(%1823) : (!llvm.ptr) -> i64
        %1825 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1824, %1825) : (i64, i64) -> ()
      }
      %1826 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1826 : i64
    }
    %1827 = func.call @cc_nil_value() : () -> i64
    %1828 = func.call @cc_errorp(%1270) : (i64) -> i64
    %1829 = arith.cmpi ne, %1828, %1827 : i64
    %1830 = scf.if %1829 -> (i64) {
      scf.yield %1270 : i64
    } else {
      %1831 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1832 = arith.constant 19 : i64
      %1833 = func.call @cc_make_string(%1831, %1832) : (!llvm.ptr, i64) -> i64
      %1834 = func.call @cc_nil_value() : () -> i64
      %1835 = func.call @cc_intern(%1833, %1834) : (i64, i64) -> i64
      %1836 = func.call @cc_nil_value() : () -> i64
      %1837 = func.call @cc_cons(%1835, %1836) : (i64, i64) -> i64
      %1838 = func.call @cc_values_pack(%1837) : (i64) -> i64
      func.call @stack_push_pointer(%1835) : (i64) -> ()
      %1839 = func.call @stack_pop_pointer() : () -> i64
      %1840 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1841 = arith.constant 3 : i64
      %1842 = func.call @cc_make_string(%1840, %1841) : (!llvm.ptr, i64) -> i64
      %1843 = func.call @cc_nil_value() : () -> i64
      %1844 = func.call @cc_intern(%1842, %1843) : (i64, i64) -> i64
      %1845 = func.call @cc_nil_value() : () -> i64
      %1846 = func.call @cc_cons(%1844, %1845) : (i64, i64) -> i64
      %1847 = func.call @cc_values_pack(%1846) : (i64) -> i64
      func.call @stack_push_pointer(%1844) : (i64) -> ()
      %1848 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1849 = arith.constant 4 : i64
      %1850 = func.call @cc_make_string(%1848, %1849) : (!llvm.ptr, i64) -> i64
      %1851 = func.call @cc_nil_value() : () -> i64
      %1852 = func.call @cc_intern(%1850, %1851) : (i64, i64) -> i64
      %1853 = func.call @cc_nil_value() : () -> i64
      %1854 = func.call @cc_cons(%1852, %1853) : (i64, i64) -> i64
      %1855 = func.call @cc_values_pack(%1854) : (i64) -> i64
      func.call @stack_push_pointer(%1852) : (i64) -> ()
      %1856 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1857 = arith.constant 4 : i64
      %1858 = func.call @cc_make_string(%1856, %1857) : (!llvm.ptr, i64) -> i64
      %1859 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1860 = arith.constant 11 : i64
      %1861 = func.call @cc_make_string(%1859, %1860) : (!llvm.ptr, i64) -> i64
      %1862 = func.call @cc_intern(%1858, %1861) : (i64, i64) -> i64
      %1863 = func.call @cc_nil_value() : () -> i64
      %1864 = func.call @cc_cons(%1862, %1863) : (i64, i64) -> i64
      %1865 = func.call @cc_values_pack(%1864) : (i64) -> i64
      func.call @stack_push_pointer(%1862) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1866 = func.call @stack_pop_pointer() : () -> i64
      %1867 = func.call @stack_pop_pointer() : () -> i64
      %1868 = func.call @cc_cons(%1867, %1866) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1868) : (i64) -> ()
      %1869 = func.call @stack_pop_pointer() : () -> i64
      %1870 = func.call @stack_pop_pointer() : () -> i64
      %1871 = func.call @cc_cons(%1870, %1869) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1871) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1872 = func.call @stack_pop_pointer() : () -> i64
      %1873 = func.call @stack_pop_pointer() : () -> i64
      %1874 = func.call @cc_cons(%1873, %1872) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1874) : (i64) -> ()
      %1875 = func.call @stack_pop_pointer() : () -> i64
      %1876 = func.call @stack_pop_pointer() : () -> i64
      %1877 = func.call @cc_cons(%1876, %1875) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1877) : (i64) -> ()
      %1878 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1879 = arith.constant 6 : i64
      %1880 = func.call @cc_make_string(%1878, %1879) : (!llvm.ptr, i64) -> i64
      %1881 = func.call @cc_nil_value() : () -> i64
      %1882 = func.call @cc_intern(%1880, %1881) : (i64, i64) -> i64
      %1883 = func.call @cc_nil_value() : () -> i64
      %1884 = func.call @cc_cons(%1882, %1883) : (i64, i64) -> i64
      %1885 = func.call @cc_values_pack(%1884) : (i64) -> i64
      func.call @stack_push_pointer(%1882) : (i64) -> ()
      %1886 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1887 = arith.constant 20 : i64
      %1888 = func.call @cc_make_string(%1886, %1887) : (!llvm.ptr, i64) -> i64
      %1889 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1890 = arith.constant 2 : i64
      %1891 = func.call @cc_make_string(%1889, %1890) : (!llvm.ptr, i64) -> i64
      %1892 = func.call @cc_intern(%1888, %1891) : (i64, i64) -> i64
      %1893 = func.call @cc_nil_value() : () -> i64
      %1894 = func.call @cc_cons(%1892, %1893) : (i64, i64) -> i64
      %1895 = func.call @cc_values_pack(%1894) : (i64) -> i64
      func.call @stack_push_pointer(%1892) : (i64) -> ()
      %1896 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1896) : (i64) -> ()
      %1897 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1898 = arith.constant 24 : i64
      %1899 = func.call @cc_make_string(%1897, %1898) : (!llvm.ptr, i64) -> i64
      %1900 = func.call @cc_nil_value() : () -> i64
      %1901 = func.call @cc_intern(%1899, %1900) : (i64, i64) -> i64
      %1902 = func.call @cc_nil_value() : () -> i64
      %1903 = func.call @cc_cons(%1901, %1902) : (i64, i64) -> i64
      %1904 = func.call @cc_values_pack(%1903) : (i64) -> i64
      func.call @stack_push_pointer(%1901) : (i64) -> ()
      %1905 = func.call @stack_pop_pointer() : () -> i64
      %1906 = func.call @stack_pop_pointer() : () -> i64
      %1907 = func.call @cc_cons(%1905, %1906) : (i64, i64) -> i64
      %1908 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1909 = arith.constant 5 : i64
      %1910 = func.call @cc_make_string(%1908, %1909) : (!llvm.ptr, i64) -> i64
      %1911 = func.call @cc_nil_value() : () -> i64
      %1912 = func.call @cc_intern(%1910, %1911) : (i64, i64) -> i64
      %1913 = func.call @cc_nil_value() : () -> i64
      %1914 = func.call @cc_cons(%1912, %1913) : (i64, i64) -> i64
      %1915 = func.call @cc_values_pack(%1914) : (i64) -> i64
      %1916 = func.call @cc_cons(%1912, %1907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1916) : (i64) -> ()
      %1917 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1918 = arith.constant 6 : i64
      %1919 = func.call @cc_make_string(%1917, %1918) : (!llvm.ptr, i64) -> i64
      %1920 = func.call @cc_nil_value() : () -> i64
      %1921 = func.call @cc_intern(%1919, %1920) : (i64, i64) -> i64
      %1922 = func.call @cc_nil_value() : () -> i64
      %1923 = func.call @cc_cons(%1921, %1922) : (i64, i64) -> i64
      %1924 = func.call @cc_values_pack(%1923) : (i64) -> i64
      func.call @stack_push_pointer(%1921) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1925 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1926 = arith.constant 5 : i64
      %1927 = func.call @cc_make_string(%1925, %1926) : (!llvm.ptr, i64) -> i64
      %1928 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1929 = arith.constant 11 : i64
      %1930 = func.call @cc_make_string(%1928, %1929) : (!llvm.ptr, i64) -> i64
      %1931 = func.call @cc_intern(%1927, %1930) : (i64, i64) -> i64
      %1932 = func.call @cc_nil_value() : () -> i64
      %1933 = func.call @cc_cons(%1931, %1932) : (i64, i64) -> i64
      %1934 = func.call @cc_values_pack(%1933) : (i64) -> i64
      func.call @stack_push_pointer(%1931) : (i64) -> ()
      %1935 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1935) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = func.call @stack_pop_pointer() : () -> i64
      %1938 = func.call @cc_cons(%1937, %1936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1938) : (i64) -> ()
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @stack_pop_pointer() : () -> i64
      %1941 = func.call @cc_cons(%1940, %1939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1941) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1943, %1942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1944) : (i64) -> ()
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @stack_pop_pointer() : () -> i64
      %1947 = func.call @cc_cons(%1946, %1945) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1947) : (i64) -> ()
      %1948 = func.call @stack_pop_pointer() : () -> i64
      %1949 = func.call @stack_pop_pointer() : () -> i64
      %1950 = func.call @cc_cons(%1949, %1948) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1950) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1951 = func.call @stack_pop_pointer() : () -> i64
      %1952 = func.call @stack_pop_pointer() : () -> i64
      %1953 = func.call @cc_cons(%1952, %1951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1953) : (i64) -> ()
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @stack_pop_pointer() : () -> i64
      %1956 = func.call @cc_cons(%1955, %1954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1956) : (i64) -> ()
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @stack_pop_pointer() : () -> i64
      %1959 = func.call @cc_cons(%1958, %1957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1959) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @stack_pop_pointer() : () -> i64
      %1962 = func.call @cc_cons(%1961, %1960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1962) : (i64) -> ()
      %1963 = func.call @stack_pop_pointer() : () -> i64
      %1964 = func.call @stack_pop_pointer() : () -> i64
      %1965 = func.call @cc_cons(%1964, %1963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1966 = func.call @stack_pop_pointer() : () -> i64
      %1967 = func.call @stack_pop_pointer() : () -> i64
      %1968 = func.call @cc_cons(%1967, %1966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1968) : (i64) -> ()
      %1969 = func.call @stack_pop_pointer() : () -> i64
      %1970 = func.call @stack_pop_pointer() : () -> i64
      %1971 = func.call @cc_cons(%1970, %1969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1971) : (i64) -> ()
      %1972 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1973 = arith.constant 17 : i64
      %1974 = func.call @cc_make_string(%1972, %1973) : (!llvm.ptr, i64) -> i64
      %1975 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1976 = arith.constant 2 : i64
      %1977 = func.call @cc_make_string(%1975, %1976) : (!llvm.ptr, i64) -> i64
      %1978 = func.call @cc_intern(%1974, %1977) : (i64, i64) -> i64
      %1979 = func.call @cc_nil_value() : () -> i64
      %1980 = func.call @cc_cons(%1978, %1979) : (i64, i64) -> i64
      %1981 = func.call @cc_values_pack(%1980) : (i64) -> i64
      func.call @stack_push_pointer(%1978) : (i64) -> ()
      %1982 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1983 = arith.constant 6 : i64
      %1984 = func.call @cc_make_string(%1982, %1983) : (!llvm.ptr, i64) -> i64
      %1985 = func.call @cc_nil_value() : () -> i64
      %1986 = func.call @cc_intern(%1984, %1985) : (i64, i64) -> i64
      %1987 = func.call @cc_nil_value() : () -> i64
      %1988 = func.call @cc_cons(%1986, %1987) : (i64, i64) -> i64
      %1989 = func.call @cc_values_pack(%1988) : (i64) -> i64
      func.call @stack_push_pointer(%1986) : (i64) -> ()
      %1990 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1991 = arith.constant 6 : i64
      %1992 = func.call @cc_make_string(%1990, %1991) : (!llvm.ptr, i64) -> i64
      %1993 = func.call @cc_nil_value() : () -> i64
      %1994 = func.call @cc_intern(%1992, %1993) : (i64, i64) -> i64
      %1995 = func.call @cc_nil_value() : () -> i64
      %1996 = func.call @cc_cons(%1994, %1995) : (i64, i64) -> i64
      %1997 = func.call @cc_values_pack(%1996) : (i64) -> i64
      func.call @stack_push_pointer(%1994) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1998 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1999 = arith.constant 4 : i64
      %2000 = func.call @cc_make_string(%1998, %1999) : (!llvm.ptr, i64) -> i64
      %2001 = llvm.mlir.addressof @str152 : !llvm.ptr
      %2002 = arith.constant 11 : i64
      %2003 = func.call @cc_make_string(%2001, %2002) : (!llvm.ptr, i64) -> i64
      %2004 = func.call @cc_intern(%2000, %2003) : (i64, i64) -> i64
      %2005 = func.call @cc_nil_value() : () -> i64
      %2006 = func.call @cc_cons(%2004, %2005) : (i64, i64) -> i64
      %2007 = func.call @cc_values_pack(%2006) : (i64) -> i64
      func.call @stack_push_pointer(%2004) : (i64) -> ()
      %2008 = llvm.mlir.addressof @str153 : !llvm.ptr
      %2009 = arith.constant 6 : i64
      %2010 = func.call @cc_make_string(%2008, %2009) : (!llvm.ptr, i64) -> i64
      %2011 = llvm.mlir.addressof @str154 : !llvm.ptr
      %2012 = arith.constant 2 : i64
      %2013 = func.call @cc_make_string(%2011, %2012) : (!llvm.ptr, i64) -> i64
      %2014 = func.call @cc_intern(%2010, %2013) : (i64, i64) -> i64
      %2015 = func.call @cc_nil_value() : () -> i64
      %2016 = func.call @cc_cons(%2014, %2015) : (i64, i64) -> i64
      %2017 = func.call @cc_values_pack(%2016) : (i64) -> i64
      func.call @stack_push_pointer(%2014) : (i64) -> ()
      %2018 = llvm.mlir.addressof @str155 : !llvm.ptr
      %2019 = arith.constant 3 : i64
      %2020 = func.call @cc_make_string(%2018, %2019) : (!llvm.ptr, i64) -> i64
      %2021 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2022 = arith.constant 11 : i64
      %2023 = func.call @cc_make_string(%2021, %2022) : (!llvm.ptr, i64) -> i64
      %2024 = func.call @cc_intern(%2020, %2023) : (i64, i64) -> i64
      %2025 = func.call @cc_nil_value() : () -> i64
      %2026 = func.call @cc_cons(%2024, %2025) : (i64, i64) -> i64
      %2027 = func.call @cc_values_pack(%2026) : (i64) -> i64
      func.call @stack_push_pointer(%2024) : (i64) -> ()
      %2028 = llvm.mlir.addressof @str157 : !llvm.ptr
      %2029 = arith.constant 4 : i64
      %2030 = func.call @cc_make_string(%2028, %2029) : (!llvm.ptr, i64) -> i64
      %2031 = func.call @cc_nil_value() : () -> i64
      %2032 = func.call @cc_intern(%2030, %2031) : (i64, i64) -> i64
      %2033 = func.call @cc_nil_value() : () -> i64
      %2034 = func.call @cc_cons(%2032, %2033) : (i64, i64) -> i64
      %2035 = func.call @cc_values_pack(%2034) : (i64) -> i64
      func.call @stack_push_pointer(%2032) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2036 = func.call @stack_pop_pointer() : () -> i64
      %2037 = func.call @stack_pop_pointer() : () -> i64
      %2038 = func.call @cc_cons(%2037, %2036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2038) : (i64) -> ()
      %2039 = func.call @stack_pop_pointer() : () -> i64
      %2040 = func.call @stack_pop_pointer() : () -> i64
      %2041 = func.call @cc_cons(%2040, %2039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2041) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2042 = func.call @stack_pop_pointer() : () -> i64
      %2043 = func.call @stack_pop_pointer() : () -> i64
      %2044 = func.call @cc_cons(%2043, %2042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2044) : (i64) -> ()
      %2045 = func.call @stack_pop_pointer() : () -> i64
      %2046 = func.call @stack_pop_pointer() : () -> i64
      %2047 = func.call @cc_cons(%2046, %2045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2047) : (i64) -> ()
      %2048 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2048) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2049 = func.call @stack_pop_pointer() : () -> i64
      %2050 = func.call @stack_pop_pointer() : () -> i64
      %2051 = func.call @cc_cons(%2050, %2049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2051) : (i64) -> ()
      %2052 = func.call @stack_pop_pointer() : () -> i64
      %2053 = func.call @stack_pop_pointer() : () -> i64
      %2054 = func.call @cc_cons(%2053, %2052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2054) : (i64) -> ()
      %2055 = func.call @stack_pop_pointer() : () -> i64
      %2056 = func.call @stack_pop_pointer() : () -> i64
      %2057 = func.call @cc_cons(%2056, %2055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2057) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2058 = func.call @stack_pop_pointer() : () -> i64
      %2059 = func.call @stack_pop_pointer() : () -> i64
      %2060 = func.call @cc_cons(%2059, %2058) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2060) : (i64) -> ()
      %2061 = func.call @stack_pop_pointer() : () -> i64
      %2062 = func.call @stack_pop_pointer() : () -> i64
      %2063 = func.call @cc_cons(%2062, %2061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2063) : (i64) -> ()
      %2064 = func.call @stack_pop_pointer() : () -> i64
      %2065 = func.call @stack_pop_pointer() : () -> i64
      %2066 = func.call @cc_cons(%2065, %2064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2066) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2067 = func.call @stack_pop_pointer() : () -> i64
      %2068 = func.call @stack_pop_pointer() : () -> i64
      %2069 = func.call @cc_cons(%2068, %2067) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2069) : (i64) -> ()
      %2070 = func.call @stack_pop_pointer() : () -> i64
      %2071 = func.call @stack_pop_pointer() : () -> i64
      %2072 = func.call @cc_cons(%2071, %2070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2072) : (i64) -> ()
      %2073 = func.call @stack_pop_pointer() : () -> i64
      %2074 = func.call @stack_pop_pointer() : () -> i64
      %2075 = func.call @cc_cons(%2074, %2073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      %2076 = llvm.mlir.addressof @str158 : !llvm.ptr
      %2077 = arith.constant 12 : i64
      %2078 = func.call @cc_make_string(%2076, %2077) : (!llvm.ptr, i64) -> i64
      %2079 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2080 = arith.constant 2 : i64
      %2081 = func.call @cc_make_string(%2079, %2080) : (!llvm.ptr, i64) -> i64
      %2082 = func.call @cc_intern(%2078, %2081) : (i64, i64) -> i64
      %2083 = func.call @cc_nil_value() : () -> i64
      %2084 = func.call @cc_cons(%2082, %2083) : (i64, i64) -> i64
      %2085 = func.call @cc_values_pack(%2084) : (i64) -> i64
      func.call @stack_push_pointer(%2082) : (i64) -> ()
      %2086 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2087 = arith.constant 6 : i64
      %2088 = func.call @cc_make_string(%2086, %2087) : (!llvm.ptr, i64) -> i64
      %2089 = func.call @cc_nil_value() : () -> i64
      %2090 = func.call @cc_intern(%2088, %2089) : (i64, i64) -> i64
      %2091 = func.call @cc_nil_value() : () -> i64
      %2092 = func.call @cc_cons(%2090, %2091) : (i64, i64) -> i64
      %2093 = func.call @cc_values_pack(%2092) : (i64) -> i64
      func.call @stack_push_pointer(%2090) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2094 = func.call @stack_pop_pointer() : () -> i64
      %2095 = func.call @stack_pop_pointer() : () -> i64
      %2096 = func.call @cc_cons(%2095, %2094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2096) : (i64) -> ()
      %2097 = func.call @stack_pop_pointer() : () -> i64
      %2098 = func.call @stack_pop_pointer() : () -> i64
      %2099 = func.call @cc_cons(%2098, %2097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2099) : (i64) -> ()
      %2100 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2101 = arith.constant 4 : i64
      %2102 = func.call @cc_make_string(%2100, %2101) : (!llvm.ptr, i64) -> i64
      %2103 = func.call @cc_nil_value() : () -> i64
      %2104 = func.call @cc_intern(%2102, %2103) : (i64, i64) -> i64
      %2105 = func.call @cc_nil_value() : () -> i64
      %2106 = func.call @cc_cons(%2104, %2105) : (i64, i64) -> i64
      %2107 = func.call @cc_values_pack(%2106) : (i64) -> i64
      func.call @stack_push_pointer(%2104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2108 = func.call @stack_pop_pointer() : () -> i64
      %2109 = func.call @stack_pop_pointer() : () -> i64
      %2110 = func.call @cc_cons(%2109, %2108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2110) : (i64) -> ()
      %2111 = func.call @stack_pop_pointer() : () -> i64
      %2112 = func.call @stack_pop_pointer() : () -> i64
      %2113 = func.call @cc_cons(%2112, %2111) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2113) : (i64) -> ()
      %2114 = func.call @stack_pop_pointer() : () -> i64
      %2115 = func.call @stack_pop_pointer() : () -> i64
      %2116 = func.call @cc_cons(%2115, %2114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2116) : (i64) -> ()
      %2117 = func.call @stack_pop_pointer() : () -> i64
      %2118 = func.call @stack_pop_pointer() : () -> i64
      %2119 = func.call @cc_cons(%2118, %2117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2119) : (i64) -> ()
      %2120 = func.call @stack_pop_pointer() : () -> i64
      %2121 = func.call @stack_pop_pointer() : () -> i64
      %2122 = func.call @cc_cons(%2121, %2120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2122) : (i64) -> ()
      %2123 = func.call @stack_pop_pointer() : () -> i64
      %2255 = arith.constant 130642754928654 : i64
      %2256 = arith.constant 0 : i64
      %2257 = func.call @cc_make_closure(%2255, %2256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2257) : (i64) -> ()
      %2258 = func.call @stack_pop_pointer() : () -> i64
      %2259 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2259) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2260 = func.call @stack_pop_pointer() : () -> i64
      %2261 = func.call @stack_pop_pointer() : () -> i64
      %2262 = func.call @cc_cons(%2261, %2260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2262) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2263 = func.call @stack_pop_pointer() : () -> i64
      %2264 = func.call @stack_pop_pointer() : () -> i64
      %2265 = func.call @cc_cons(%2264, %2263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2265) : (i64) -> ()
      %2266 = func.call @stack_pop_pointer() : () -> i64
      %2267 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2268 = arith.constant 11 : i64
      %2269 = func.call @cc_make_string(%2267, %2268) : (!llvm.ptr, i64) -> i64
      %2270 = llvm.mlir.addressof @str169 : !llvm.ptr
      %2271 = arith.constant 7 : i64
      %2272 = func.call @cc_make_string(%2270, %2271) : (!llvm.ptr, i64) -> i64
      %2273 = func.call @cc_intern(%2269, %2272) : (i64, i64) -> i64
      %2274 = func.call @cc_nil_value() : () -> i64
      %2275 = func.call @cc_cons(%2273, %2274) : (i64, i64) -> i64
      %2276 = func.call @cc_values_pack(%2275) : (i64) -> i64
      func.call @stack_push_pointer(%2273) : (i64) -> ()
      %2277 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2278 = func.call @stack_pop_pointer() : () -> i64
      %2279 = llvm.mlir.addressof @str170 : !llvm.ptr
      %2280 = arith.constant 4 : i64
      %2281 = func.call @cc_make_string(%2279, %2280) : (!llvm.ptr, i64) -> i64
      %2282 = llvm.mlir.addressof @str171 : !llvm.ptr
      %2283 = arith.constant 7 : i64
      %2284 = func.call @cc_make_string(%2282, %2283) : (!llvm.ptr, i64) -> i64
      %2285 = func.call @cc_intern(%2281, %2284) : (i64, i64) -> i64
      %2286 = func.call @cc_nil_value() : () -> i64
      %2287 = func.call @cc_cons(%2285, %2286) : (i64, i64) -> i64
      %2288 = func.call @cc_values_pack(%2287) : (i64) -> i64
      func.call @stack_push_pointer(%2285) : (i64) -> ()
      %2289 = func.call @stack_pop_pointer() : () -> i64
      %2290 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2291 = arith.constant 6 : i64
      %2292 = func.call @cc_make_string(%2290, %2291) : (!llvm.ptr, i64) -> i64
      %2293 = func.call @cc_nil_value() : () -> i64
      %2294 = func.call @cc_intern(%2292, %2293) : (i64, i64) -> i64
      %2295 = func.call @cc_nil_value() : () -> i64
      %2296 = func.call @cc_cons(%2294, %2295) : (i64, i64) -> i64
      %2297 = func.call @cc_values_pack(%2296) : (i64) -> i64
      func.call @stack_push_pointer(%2294) : (i64) -> ()
      %2298 = func.call @stack_pop_pointer() : () -> i64
      %2299 = func.call @cc_nil_value() : () -> i64
      %2300 = func.call @cc_errorp(%1839) : (i64) -> i64
      %2301 = arith.cmpi ne, %2300, %2299 : i64
      %2302 = arith.cmpi eq, %2299, %2299 : i64
      %2303 = arith.andi %2301, %2302 : i1
      %2304 = scf.if %2303 -> (i64) {
        scf.yield %1839 : i64
      } else {
        scf.yield %2299 : i64
      }
      %2305 = func.call @cc_errorp(%2123) : (i64) -> i64
      %2306 = arith.cmpi ne, %2305, %2299 : i64
      %2307 = arith.cmpi eq, %2304, %2299 : i64
      %2308 = arith.andi %2306, %2307 : i1
      %2309 = scf.if %2308 -> (i64) {
        scf.yield %2123 : i64
      } else {
        scf.yield %2304 : i64
      }
      %2310 = func.call @cc_errorp(%2258) : (i64) -> i64
      %2311 = arith.cmpi ne, %2310, %2299 : i64
      %2312 = arith.cmpi eq, %2309, %2299 : i64
      %2313 = arith.andi %2311, %2312 : i1
      %2314 = scf.if %2313 -> (i64) {
        scf.yield %2258 : i64
      } else {
        scf.yield %2309 : i64
      }
      %2315 = func.call @cc_errorp(%2266) : (i64) -> i64
      %2316 = arith.cmpi ne, %2315, %2299 : i64
      %2317 = arith.cmpi eq, %2314, %2299 : i64
      %2318 = arith.andi %2316, %2317 : i1
      %2319 = scf.if %2318 -> (i64) {
        scf.yield %2266 : i64
      } else {
        scf.yield %2314 : i64
      }
      %2320 = func.call @cc_errorp(%2277) : (i64) -> i64
      %2321 = arith.cmpi ne, %2320, %2299 : i64
      %2322 = arith.cmpi eq, %2319, %2299 : i64
      %2323 = arith.andi %2321, %2322 : i1
      %2324 = scf.if %2323 -> (i64) {
        scf.yield %2277 : i64
      } else {
        scf.yield %2319 : i64
      }
      %2325 = func.call @cc_errorp(%2278) : (i64) -> i64
      %2326 = arith.cmpi ne, %2325, %2299 : i64
      %2327 = arith.cmpi eq, %2324, %2299 : i64
      %2328 = arith.andi %2326, %2327 : i1
      %2329 = scf.if %2328 -> (i64) {
        scf.yield %2278 : i64
      } else {
        scf.yield %2324 : i64
      }
      %2330 = func.call @cc_errorp(%2289) : (i64) -> i64
      %2331 = arith.cmpi ne, %2330, %2299 : i64
      %2332 = arith.cmpi eq, %2329, %2299 : i64
      %2333 = arith.andi %2331, %2332 : i1
      %2334 = scf.if %2333 -> (i64) {
        scf.yield %2289 : i64
      } else {
        scf.yield %2329 : i64
      }
      %2335 = func.call @cc_errorp(%2298) : (i64) -> i64
      %2336 = arith.cmpi ne, %2335, %2299 : i64
      %2337 = arith.cmpi eq, %2334, %2299 : i64
      %2338 = arith.andi %2336, %2337 : i1
      %2339 = scf.if %2338 -> (i64) {
        scf.yield %2298 : i64
      } else {
        scf.yield %2334 : i64
      }
      %2340 = arith.cmpi ne, %2339, %2299 : i64
      scf.if %2340 {
        func.call @stack_push_pointer(%2339) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1839) : (i64) -> ()
        func.call @stack_push_pointer(%2123) : (i64) -> ()
        func.call @stack_push_pointer(%2258) : (i64) -> ()
        func.call @stack_push_pointer(%2266) : (i64) -> ()
        func.call @stack_push_pointer(%2277) : (i64) -> ()
        func.call @stack_push_pointer(%2278) : (i64) -> ()
        func.call @stack_push_pointer(%2289) : (i64) -> ()
        func.call @stack_push_pointer(%2298) : (i64) -> ()
        %2341 = llvm.mlir.addressof @str173 : !llvm.ptr
        %2342 = func.call @cc_make_function_ref_const(%2341) : (!llvm.ptr) -> i64
        %2343 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2342, %2343) : (i64, i64) -> ()
      }
      %2344 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2344 : i64
    }
    %2345 = func.call @cc_nil_value() : () -> i64
    %2346 = func.call @cc_errorp(%1830) : (i64) -> i64
    %2347 = arith.cmpi ne, %2346, %2345 : i64
    %2348 = scf.if %2347 -> (i64) {
      scf.yield %1830 : i64
    } else {
      %2349 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2350 = arith.constant 18 : i64
      %2351 = func.call @cc_make_string(%2349, %2350) : (!llvm.ptr, i64) -> i64
      %2352 = func.call @cc_nil_value() : () -> i64
      %2353 = func.call @cc_intern(%2351, %2352) : (i64, i64) -> i64
      %2354 = func.call @cc_nil_value() : () -> i64
      %2355 = func.call @cc_cons(%2353, %2354) : (i64, i64) -> i64
      %2356 = func.call @cc_values_pack(%2355) : (i64) -> i64
      func.call @stack_push_pointer(%2353) : (i64) -> ()
      %2357 = func.call @stack_pop_pointer() : () -> i64
      %2358 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2359 = arith.constant 3 : i64
      %2360 = func.call @cc_make_string(%2358, %2359) : (!llvm.ptr, i64) -> i64
      %2361 = func.call @cc_nil_value() : () -> i64
      %2362 = func.call @cc_intern(%2360, %2361) : (i64, i64) -> i64
      %2363 = func.call @cc_nil_value() : () -> i64
      %2364 = func.call @cc_cons(%2362, %2363) : (i64, i64) -> i64
      %2365 = func.call @cc_values_pack(%2364) : (i64) -> i64
      func.call @stack_push_pointer(%2362) : (i64) -> ()
      %2366 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2367 = arith.constant 4 : i64
      %2368 = func.call @cc_make_string(%2366, %2367) : (!llvm.ptr, i64) -> i64
      %2369 = func.call @cc_nil_value() : () -> i64
      %2370 = func.call @cc_intern(%2368, %2369) : (i64, i64) -> i64
      %2371 = func.call @cc_nil_value() : () -> i64
      %2372 = func.call @cc_cons(%2370, %2371) : (i64, i64) -> i64
      %2373 = func.call @cc_values_pack(%2372) : (i64) -> i64
      func.call @stack_push_pointer(%2370) : (i64) -> ()
      %2374 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2375 = arith.constant 9 : i64
      %2376 = func.call @cc_make_string(%2374, %2375) : (!llvm.ptr, i64) -> i64
      %2377 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2378 = arith.constant 2 : i64
      %2379 = func.call @cc_make_string(%2377, %2378) : (!llvm.ptr, i64) -> i64
      %2380 = func.call @cc_intern(%2376, %2379) : (i64, i64) -> i64
      %2381 = func.call @cc_nil_value() : () -> i64
      %2382 = func.call @cc_cons(%2380, %2381) : (i64, i64) -> i64
      %2383 = func.call @cc_values_pack(%2382) : (i64) -> i64
      func.call @stack_push_pointer(%2380) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %2393 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2394 = arith.constant 4 : i64
      %2395 = func.call @cc_make_string(%2393, %2394) : (!llvm.ptr, i64) -> i64
      %2396 = func.call @cc_nil_value() : () -> i64
      %2397 = func.call @cc_intern(%2395, %2396) : (i64, i64) -> i64
      %2398 = func.call @cc_nil_value() : () -> i64
      %2399 = func.call @cc_cons(%2397, %2398) : (i64, i64) -> i64
      %2400 = func.call @cc_values_pack(%2399) : (i64) -> i64
      func.call @stack_push_pointer(%2397) : (i64) -> ()
      %2401 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2402 = arith.constant 4 : i64
      %2403 = func.call @cc_make_string(%2401, %2402) : (!llvm.ptr, i64) -> i64
      %2404 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2405 = arith.constant 11 : i64
      %2406 = func.call @cc_make_string(%2404, %2405) : (!llvm.ptr, i64) -> i64
      %2407 = func.call @cc_intern(%2403, %2406) : (i64, i64) -> i64
      %2408 = func.call @cc_nil_value() : () -> i64
      %2409 = func.call @cc_cons(%2407, %2408) : (i64, i64) -> i64
      %2410 = func.call @cc_values_pack(%2409) : (i64) -> i64
      func.call @stack_push_pointer(%2407) : (i64) -> ()
      %2411 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2411) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2412 = func.call @stack_pop_pointer() : () -> i64
      %2413 = func.call @stack_pop_pointer() : () -> i64
      %2414 = func.call @cc_cons(%2413, %2412) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2414) : (i64) -> ()
      %2415 = func.call @stack_pop_pointer() : () -> i64
      %2416 = func.call @stack_pop_pointer() : () -> i64
      %2417 = func.call @cc_cons(%2416, %2415) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2417) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2418 = func.call @stack_pop_pointer() : () -> i64
      %2419 = func.call @stack_pop_pointer() : () -> i64
      %2420 = func.call @cc_cons(%2419, %2418) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2420) : (i64) -> ()
      %2421 = func.call @stack_pop_pointer() : () -> i64
      %2422 = func.call @stack_pop_pointer() : () -> i64
      %2423 = func.call @cc_cons(%2422, %2421) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2423) : (i64) -> ()
      %2424 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2425 = arith.constant 4 : i64
      %2426 = func.call @cc_make_string(%2424, %2425) : (!llvm.ptr, i64) -> i64
      %2427 = func.call @cc_nil_value() : () -> i64
      %2428 = func.call @cc_intern(%2426, %2427) : (i64, i64) -> i64
      %2429 = func.call @cc_nil_value() : () -> i64
      %2430 = func.call @cc_cons(%2428, %2429) : (i64, i64) -> i64
      %2431 = func.call @cc_values_pack(%2430) : (i64) -> i64
      func.call @stack_push_pointer(%2428) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2432 = func.call @stack_pop_pointer() : () -> i64
      %2433 = func.call @stack_pop_pointer() : () -> i64
      %2434 = func.call @cc_cons(%2433, %2432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2434) : (i64) -> ()
      %2435 = func.call @stack_pop_pointer() : () -> i64
      %2436 = func.call @stack_pop_pointer() : () -> i64
      %2437 = func.call @cc_cons(%2436, %2435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2437) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2438 = func.call @stack_pop_pointer() : () -> i64
      %2439 = func.call @stack_pop_pointer() : () -> i64
      %2440 = func.call @cc_cons(%2439, %2438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2440) : (i64) -> ()
      %2441 = func.call @stack_pop_pointer() : () -> i64
      %2442 = func.call @stack_pop_pointer() : () -> i64
      %2443 = func.call @cc_cons(%2442, %2441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2443) : (i64) -> ()
      %2444 = func.call @stack_pop_pointer() : () -> i64
      %2445 = func.call @stack_pop_pointer() : () -> i64
      %2446 = func.call @cc_cons(%2445, %2444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2446) : (i64) -> ()
      %2447 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2448 = arith.constant 9 : i64
      %2449 = func.call @cc_make_string(%2447, %2448) : (!llvm.ptr, i64) -> i64
      %2450 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2451 = arith.constant 2 : i64
      %2452 = func.call @cc_make_string(%2450, %2451) : (!llvm.ptr, i64) -> i64
      %2453 = func.call @cc_intern(%2449, %2452) : (i64, i64) -> i64
      %2454 = func.call @cc_nil_value() : () -> i64
      %2455 = func.call @cc_cons(%2453, %2454) : (i64, i64) -> i64
      %2456 = func.call @cc_values_pack(%2455) : (i64) -> i64
      func.call @stack_push_pointer(%2453) : (i64) -> ()
      %2457 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2458 = arith.constant 4 : i64
      %2459 = func.call @cc_make_string(%2457, %2458) : (!llvm.ptr, i64) -> i64
      %2460 = func.call @cc_nil_value() : () -> i64
      %2461 = func.call @cc_intern(%2459, %2460) : (i64, i64) -> i64
      %2462 = func.call @cc_nil_value() : () -> i64
      %2463 = func.call @cc_cons(%2461, %2462) : (i64, i64) -> i64
      %2464 = func.call @cc_values_pack(%2463) : (i64) -> i64
      func.call @stack_push_pointer(%2461) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2465 = func.call @stack_pop_pointer() : () -> i64
      %2466 = func.call @stack_pop_pointer() : () -> i64
      %2467 = func.call @cc_cons(%2466, %2465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2467) : (i64) -> ()
      %2468 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2469 = arith.constant 4 : i64
      %2470 = func.call @cc_make_string(%2468, %2469) : (!llvm.ptr, i64) -> i64
      %2471 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2472 = arith.constant 11 : i64
      %2473 = func.call @cc_make_string(%2471, %2472) : (!llvm.ptr, i64) -> i64
      %2474 = func.call @cc_intern(%2470, %2473) : (i64, i64) -> i64
      %2475 = func.call @cc_nil_value() : () -> i64
      %2476 = func.call @cc_cons(%2474, %2475) : (i64, i64) -> i64
      %2477 = func.call @cc_values_pack(%2476) : (i64) -> i64
      func.call @stack_push_pointer(%2474) : (i64) -> ()
      %2478 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2479 = arith.constant 4 : i64
      %2480 = func.call @cc_make_string(%2478, %2479) : (!llvm.ptr, i64) -> i64
      %2481 = func.call @cc_nil_value() : () -> i64
      %2482 = func.call @cc_intern(%2480, %2481) : (i64, i64) -> i64
      %2483 = func.call @cc_nil_value() : () -> i64
      %2484 = func.call @cc_cons(%2482, %2483) : (i64, i64) -> i64
      %2485 = func.call @cc_values_pack(%2484) : (i64) -> i64
      func.call @stack_push_pointer(%2482) : (i64) -> ()
      %2486 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2487 = arith.constant 20 : i64
      %2488 = func.call @cc_make_string(%2486, %2487) : (!llvm.ptr, i64) -> i64
      %2489 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2490 = arith.constant 2 : i64
      %2491 = func.call @cc_make_string(%2489, %2490) : (!llvm.ptr, i64) -> i64
      %2492 = func.call @cc_intern(%2488, %2491) : (i64, i64) -> i64
      %2493 = func.call @cc_nil_value() : () -> i64
      %2494 = func.call @cc_cons(%2492, %2493) : (i64, i64) -> i64
      %2495 = func.call @cc_values_pack(%2494) : (i64) -> i64
      func.call @stack_push_pointer(%2492) : (i64) -> ()
      %2496 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2496) : (i64) -> ()
      %2497 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2498 = arith.constant 23 : i64
      %2499 = func.call @cc_make_string(%2497, %2498) : (!llvm.ptr, i64) -> i64
      %2500 = func.call @cc_nil_value() : () -> i64
      %2501 = func.call @cc_intern(%2499, %2500) : (i64, i64) -> i64
      %2502 = func.call @cc_nil_value() : () -> i64
      %2503 = func.call @cc_cons(%2501, %2502) : (i64, i64) -> i64
      %2504 = func.call @cc_values_pack(%2503) : (i64) -> i64
      func.call @stack_push_pointer(%2501) : (i64) -> ()
      %2505 = func.call @stack_pop_pointer() : () -> i64
      %2506 = func.call @stack_pop_pointer() : () -> i64
      %2507 = func.call @cc_cons(%2505, %2506) : (i64, i64) -> i64
      %2508 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2509 = arith.constant 5 : i64
      %2510 = func.call @cc_make_string(%2508, %2509) : (!llvm.ptr, i64) -> i64
      %2511 = func.call @cc_nil_value() : () -> i64
      %2512 = func.call @cc_intern(%2510, %2511) : (i64, i64) -> i64
      %2513 = func.call @cc_nil_value() : () -> i64
      %2514 = func.call @cc_cons(%2512, %2513) : (i64, i64) -> i64
      %2515 = func.call @cc_values_pack(%2514) : (i64) -> i64
      %2516 = func.call @cc_cons(%2512, %2507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2516) : (i64) -> ()
      %2517 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2518 = arith.constant 6 : i64
      %2519 = func.call @cc_make_string(%2517, %2518) : (!llvm.ptr, i64) -> i64
      %2520 = func.call @cc_nil_value() : () -> i64
      %2521 = func.call @cc_intern(%2519, %2520) : (i64, i64) -> i64
      %2522 = func.call @cc_nil_value() : () -> i64
      %2523 = func.call @cc_cons(%2521, %2522) : (i64, i64) -> i64
      %2524 = func.call @cc_values_pack(%2523) : (i64) -> i64
      func.call @stack_push_pointer(%2521) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2525 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2526 = arith.constant 9 : i64
      %2527 = func.call @cc_make_string(%2525, %2526) : (!llvm.ptr, i64) -> i64
      %2528 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2529 = arith.constant 2 : i64
      %2530 = func.call @cc_make_string(%2528, %2529) : (!llvm.ptr, i64) -> i64
      %2531 = func.call @cc_intern(%2527, %2530) : (i64, i64) -> i64
      %2532 = func.call @cc_nil_value() : () -> i64
      %2533 = func.call @cc_cons(%2531, %2532) : (i64, i64) -> i64
      %2534 = func.call @cc_values_pack(%2533) : (i64) -> i64
      func.call @stack_push_pointer(%2531) : (i64) -> ()
      %2535 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2536 = arith.constant 4 : i64
      %2537 = func.call @cc_make_string(%2535, %2536) : (!llvm.ptr, i64) -> i64
      %2538 = func.call @cc_nil_value() : () -> i64
      %2539 = func.call @cc_intern(%2537, %2538) : (i64, i64) -> i64
      %2540 = func.call @cc_nil_value() : () -> i64
      %2541 = func.call @cc_cons(%2539, %2540) : (i64, i64) -> i64
      %2542 = func.call @cc_values_pack(%2541) : (i64) -> i64
      func.call @stack_push_pointer(%2539) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2543 = func.call @stack_pop_pointer() : () -> i64
      %2544 = func.call @stack_pop_pointer() : () -> i64
      %2545 = func.call @cc_cons(%2544, %2543) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2545) : (i64) -> ()
      %2546 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2547 = arith.constant 4 : i64
      %2548 = func.call @cc_make_string(%2546, %2547) : (!llvm.ptr, i64) -> i64
      %2549 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2550 = arith.constant 11 : i64
      %2551 = func.call @cc_make_string(%2549, %2550) : (!llvm.ptr, i64) -> i64
      %2552 = func.call @cc_intern(%2548, %2551) : (i64, i64) -> i64
      %2553 = func.call @cc_nil_value() : () -> i64
      %2554 = func.call @cc_cons(%2552, %2553) : (i64, i64) -> i64
      %2555 = func.call @cc_values_pack(%2554) : (i64) -> i64
      func.call @stack_push_pointer(%2552) : (i64) -> ()
      %2556 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2557 = arith.constant 6 : i64
      %2558 = func.call @cc_make_string(%2556, %2557) : (!llvm.ptr, i64) -> i64
      %2559 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2560 = arith.constant 2 : i64
      %2561 = func.call @cc_make_string(%2559, %2560) : (!llvm.ptr, i64) -> i64
      %2562 = func.call @cc_intern(%2558, %2561) : (i64, i64) -> i64
      %2563 = func.call @cc_nil_value() : () -> i64
      %2564 = func.call @cc_cons(%2562, %2563) : (i64, i64) -> i64
      %2565 = func.call @cc_values_pack(%2564) : (i64) -> i64
      func.call @stack_push_pointer(%2562) : (i64) -> ()
      %2566 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2567 = arith.constant 3 : i64
      %2568 = func.call @cc_make_string(%2566, %2567) : (!llvm.ptr, i64) -> i64
      %2569 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2570 = arith.constant 11 : i64
      %2571 = func.call @cc_make_string(%2569, %2570) : (!llvm.ptr, i64) -> i64
      %2572 = func.call @cc_intern(%2568, %2571) : (i64, i64) -> i64
      %2573 = func.call @cc_nil_value() : () -> i64
      %2574 = func.call @cc_cons(%2572, %2573) : (i64, i64) -> i64
      %2575 = func.call @cc_values_pack(%2574) : (i64) -> i64
      func.call @stack_push_pointer(%2572) : (i64) -> ()
      %2576 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2577 = arith.constant 4 : i64
      %2578 = func.call @cc_make_string(%2576, %2577) : (!llvm.ptr, i64) -> i64
      %2579 = func.call @cc_nil_value() : () -> i64
      %2580 = func.call @cc_intern(%2578, %2579) : (i64, i64) -> i64
      %2581 = func.call @cc_nil_value() : () -> i64
      %2582 = func.call @cc_cons(%2580, %2581) : (i64, i64) -> i64
      %2583 = func.call @cc_values_pack(%2582) : (i64) -> i64
      func.call @stack_push_pointer(%2580) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2584 = func.call @stack_pop_pointer() : () -> i64
      %2585 = func.call @stack_pop_pointer() : () -> i64
      %2586 = func.call @cc_cons(%2585, %2584) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2586) : (i64) -> ()
      %2587 = func.call @stack_pop_pointer() : () -> i64
      %2588 = func.call @stack_pop_pointer() : () -> i64
      %2589 = func.call @cc_cons(%2588, %2587) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2589) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2590 = func.call @stack_pop_pointer() : () -> i64
      %2591 = func.call @stack_pop_pointer() : () -> i64
      %2592 = func.call @cc_cons(%2591, %2590) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2592) : (i64) -> ()
      %2593 = func.call @stack_pop_pointer() : () -> i64
      %2594 = func.call @stack_pop_pointer() : () -> i64
      %2595 = func.call @cc_cons(%2594, %2593) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2595) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2596 = func.call @stack_pop_pointer() : () -> i64
      %2597 = func.call @stack_pop_pointer() : () -> i64
      %2598 = func.call @cc_cons(%2597, %2596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2598) : (i64) -> ()
      %2599 = func.call @stack_pop_pointer() : () -> i64
      %2600 = func.call @stack_pop_pointer() : () -> i64
      %2601 = func.call @cc_cons(%2600, %2599) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2601) : (i64) -> ()
      %2602 = func.call @stack_pop_pointer() : () -> i64
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @cc_cons(%2603, %2602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2604) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2605 = func.call @stack_pop_pointer() : () -> i64
      %2606 = func.call @stack_pop_pointer() : () -> i64
      %2607 = func.call @cc_cons(%2606, %2605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2607) : (i64) -> ()
      %2608 = func.call @stack_pop_pointer() : () -> i64
      %2609 = func.call @stack_pop_pointer() : () -> i64
      %2610 = func.call @cc_cons(%2609, %2608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2610) : (i64) -> ()
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = func.call @stack_pop_pointer() : () -> i64
      %2613 = func.call @cc_cons(%2612, %2611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2613) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2614 = func.call @stack_pop_pointer() : () -> i64
      %2615 = func.call @stack_pop_pointer() : () -> i64
      %2616 = func.call @cc_cons(%2615, %2614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2616) : (i64) -> ()
      %2617 = func.call @stack_pop_pointer() : () -> i64
      %2618 = func.call @stack_pop_pointer() : () -> i64
      %2619 = func.call @cc_cons(%2618, %2617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2619) : (i64) -> ()
      %2620 = func.call @stack_pop_pointer() : () -> i64
      %2621 = func.call @stack_pop_pointer() : () -> i64
      %2622 = func.call @cc_cons(%2621, %2620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2622) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2623 = func.call @stack_pop_pointer() : () -> i64
      %2624 = func.call @stack_pop_pointer() : () -> i64
      %2625 = func.call @cc_cons(%2624, %2623) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2625) : (i64) -> ()
      %2626 = func.call @stack_pop_pointer() : () -> i64
      %2627 = func.call @stack_pop_pointer() : () -> i64
      %2628 = func.call @cc_cons(%2627, %2626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2628) : (i64) -> ()
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @stack_pop_pointer() : () -> i64
      %2631 = func.call @cc_cons(%2630, %2629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2631) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2632 = func.call @stack_pop_pointer() : () -> i64
      %2633 = func.call @stack_pop_pointer() : () -> i64
      %2634 = func.call @cc_cons(%2633, %2632) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2634) : (i64) -> ()
      %2635 = func.call @stack_pop_pointer() : () -> i64
      %2636 = func.call @stack_pop_pointer() : () -> i64
      %2637 = func.call @cc_cons(%2636, %2635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2637) : (i64) -> ()
      %2638 = func.call @stack_pop_pointer() : () -> i64
      %2639 = func.call @stack_pop_pointer() : () -> i64
      %2640 = func.call @cc_cons(%2639, %2638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2640) : (i64) -> ()
      %2641 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2642 = arith.constant 14 : i64
      %2643 = func.call @cc_make_string(%2641, %2642) : (!llvm.ptr, i64) -> i64
      %2644 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2645 = arith.constant 2 : i64
      %2646 = func.call @cc_make_string(%2644, %2645) : (!llvm.ptr, i64) -> i64
      %2647 = func.call @cc_intern(%2643, %2646) : (i64, i64) -> i64
      %2648 = func.call @cc_nil_value() : () -> i64
      %2649 = func.call @cc_cons(%2647, %2648) : (i64, i64) -> i64
      %2650 = func.call @cc_values_pack(%2649) : (i64) -> i64
      func.call @stack_push_pointer(%2647) : (i64) -> ()
      %2651 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2652 = arith.constant 4 : i64
      %2653 = func.call @cc_make_string(%2651, %2652) : (!llvm.ptr, i64) -> i64
      %2654 = func.call @cc_nil_value() : () -> i64
      %2655 = func.call @cc_intern(%2653, %2654) : (i64, i64) -> i64
      %2656 = func.call @cc_nil_value() : () -> i64
      %2657 = func.call @cc_cons(%2655, %2656) : (i64, i64) -> i64
      %2658 = func.call @cc_values_pack(%2657) : (i64) -> i64
      func.call @stack_push_pointer(%2655) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2659 = func.call @stack_pop_pointer() : () -> i64
      %2660 = func.call @stack_pop_pointer() : () -> i64
      %2661 = func.call @cc_cons(%2660, %2659) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2661) : (i64) -> ()
      %2662 = func.call @stack_pop_pointer() : () -> i64
      %2663 = func.call @stack_pop_pointer() : () -> i64
      %2664 = func.call @cc_cons(%2663, %2662) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2664) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2665 = func.call @stack_pop_pointer() : () -> i64
      %2666 = func.call @stack_pop_pointer() : () -> i64
      %2667 = func.call @cc_cons(%2666, %2665) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2667) : (i64) -> ()
      %2668 = func.call @stack_pop_pointer() : () -> i64
      %2669 = func.call @stack_pop_pointer() : () -> i64
      %2670 = func.call @cc_cons(%2669, %2668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2670) : (i64) -> ()
      %2671 = func.call @stack_pop_pointer() : () -> i64
      %2672 = func.call @stack_pop_pointer() : () -> i64
      %2673 = func.call @cc_cons(%2672, %2671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2673) : (i64) -> ()
      %2674 = func.call @stack_pop_pointer() : () -> i64
      %2675 = func.call @stack_pop_pointer() : () -> i64
      %2676 = func.call @cc_cons(%2675, %2674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2676) : (i64) -> ()
      %2677 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2678 = arith.constant 13 : i64
      %2679 = func.call @cc_make_string(%2677, %2678) : (!llvm.ptr, i64) -> i64
      %2680 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2681 = arith.constant 11 : i64
      %2682 = func.call @cc_make_string(%2680, %2681) : (!llvm.ptr, i64) -> i64
      %2683 = func.call @cc_intern(%2679, %2682) : (i64, i64) -> i64
      %2684 = func.call @cc_nil_value() : () -> i64
      %2685 = func.call @cc_cons(%2683, %2684) : (i64, i64) -> i64
      %2686 = func.call @cc_values_pack(%2685) : (i64) -> i64
      func.call @stack_push_pointer(%2683) : (i64) -> ()
      %2687 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2688 = arith.constant 12 : i64
      %2689 = func.call @cc_make_string(%2687, %2688) : (!llvm.ptr, i64) -> i64
      %2690 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2691 = arith.constant 2 : i64
      %2692 = func.call @cc_make_string(%2690, %2691) : (!llvm.ptr, i64) -> i64
      %2693 = func.call @cc_intern(%2689, %2692) : (i64, i64) -> i64
      %2694 = func.call @cc_nil_value() : () -> i64
      %2695 = func.call @cc_cons(%2693, %2694) : (i64, i64) -> i64
      %2696 = func.call @cc_values_pack(%2695) : (i64) -> i64
      func.call @stack_push_pointer(%2693) : (i64) -> ()
      %2697 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2698 = arith.constant 4 : i64
      %2699 = func.call @cc_make_string(%2697, %2698) : (!llvm.ptr, i64) -> i64
      %2700 = func.call @cc_nil_value() : () -> i64
      %2701 = func.call @cc_intern(%2699, %2700) : (i64, i64) -> i64
      %2702 = func.call @cc_nil_value() : () -> i64
      %2703 = func.call @cc_cons(%2701, %2702) : (i64, i64) -> i64
      %2704 = func.call @cc_values_pack(%2703) : (i64) -> i64
      func.call @stack_push_pointer(%2701) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2705 = func.call @stack_pop_pointer() : () -> i64
      %2706 = func.call @stack_pop_pointer() : () -> i64
      %2707 = func.call @cc_cons(%2706, %2705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2707) : (i64) -> ()
      %2708 = func.call @stack_pop_pointer() : () -> i64
      %2709 = func.call @stack_pop_pointer() : () -> i64
      %2710 = func.call @cc_cons(%2709, %2708) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2710) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2711 = func.call @stack_pop_pointer() : () -> i64
      %2712 = func.call @stack_pop_pointer() : () -> i64
      %2713 = func.call @cc_cons(%2712, %2711) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2713) : (i64) -> ()
      %2714 = func.call @stack_pop_pointer() : () -> i64
      %2715 = func.call @stack_pop_pointer() : () -> i64
      %2716 = func.call @cc_cons(%2715, %2714) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2716) : (i64) -> ()
      %2717 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2718 = arith.constant 4 : i64
      %2719 = func.call @cc_make_string(%2717, %2718) : (!llvm.ptr, i64) -> i64
      %2720 = func.call @cc_nil_value() : () -> i64
      %2721 = func.call @cc_intern(%2719, %2720) : (i64, i64) -> i64
      %2722 = func.call @cc_nil_value() : () -> i64
      %2723 = func.call @cc_cons(%2721, %2722) : (i64, i64) -> i64
      %2724 = func.call @cc_values_pack(%2723) : (i64) -> i64
      func.call @stack_push_pointer(%2721) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2725 = func.call @stack_pop_pointer() : () -> i64
      %2726 = func.call @stack_pop_pointer() : () -> i64
      %2727 = func.call @cc_cons(%2726, %2725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2727) : (i64) -> ()
      %2728 = func.call @stack_pop_pointer() : () -> i64
      %2729 = func.call @stack_pop_pointer() : () -> i64
      %2730 = func.call @cc_cons(%2729, %2728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2730) : (i64) -> ()
      %2731 = func.call @stack_pop_pointer() : () -> i64
      %2732 = func.call @stack_pop_pointer() : () -> i64
      %2733 = func.call @cc_cons(%2732, %2731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2733) : (i64) -> ()
      %2734 = func.call @stack_pop_pointer() : () -> i64
      %2735 = func.call @stack_pop_pointer() : () -> i64
      %2736 = func.call @cc_cons(%2735, %2734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2736) : (i64) -> ()
      %2737 = func.call @stack_pop_pointer() : () -> i64
      %2738 = func.call @stack_pop_pointer() : () -> i64
      %2739 = func.call @cc_cons(%2738, %2737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2739) : (i64) -> ()
      %2740 = func.call @stack_pop_pointer() : () -> i64
      %2979 = arith.constant 130642754928658 : i64
      %2980 = arith.constant 0 : i64
      %2981 = func.call @cc_make_closure(%2979, %2980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2981) : (i64) -> ()
      %2982 = func.call @stack_pop_pointer() : () -> i64
      %2983 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2983) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2984 = func.call @stack_pop_pointer() : () -> i64
      %2985 = func.call @stack_pop_pointer() : () -> i64
      %2986 = func.call @cc_cons(%2985, %2984) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2986) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2987 = func.call @stack_pop_pointer() : () -> i64
      %2988 = func.call @stack_pop_pointer() : () -> i64
      %2989 = func.call @cc_cons(%2988, %2987) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2989) : (i64) -> ()
      %2990 = func.call @stack_pop_pointer() : () -> i64
      %2991 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2992 = arith.constant 11 : i64
      %2993 = func.call @cc_make_string(%2991, %2992) : (!llvm.ptr, i64) -> i64
      %2994 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2995 = arith.constant 7 : i64
      %2996 = func.call @cc_make_string(%2994, %2995) : (!llvm.ptr, i64) -> i64
      %2997 = func.call @cc_intern(%2993, %2996) : (i64, i64) -> i64
      %2998 = func.call @cc_nil_value() : () -> i64
      %2999 = func.call @cc_cons(%2997, %2998) : (i64, i64) -> i64
      %3000 = func.call @cc_values_pack(%2999) : (i64) -> i64
      func.call @stack_push_pointer(%2997) : (i64) -> ()
      %3001 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3002 = func.call @stack_pop_pointer() : () -> i64
      %3003 = llvm.mlir.addressof @str226 : !llvm.ptr
      %3004 = arith.constant 4 : i64
      %3005 = func.call @cc_make_string(%3003, %3004) : (!llvm.ptr, i64) -> i64
      %3006 = llvm.mlir.addressof @str227 : !llvm.ptr
      %3007 = arith.constant 7 : i64
      %3008 = func.call @cc_make_string(%3006, %3007) : (!llvm.ptr, i64) -> i64
      %3009 = func.call @cc_intern(%3005, %3008) : (i64, i64) -> i64
      %3010 = func.call @cc_nil_value() : () -> i64
      %3011 = func.call @cc_cons(%3009, %3010) : (i64, i64) -> i64
      %3012 = func.call @cc_values_pack(%3011) : (i64) -> i64
      func.call @stack_push_pointer(%3009) : (i64) -> ()
      %3013 = func.call @stack_pop_pointer() : () -> i64
      %3014 = llvm.mlir.addressof @str228 : !llvm.ptr
      %3015 = arith.constant 6 : i64
      %3016 = func.call @cc_make_string(%3014, %3015) : (!llvm.ptr, i64) -> i64
      %3017 = func.call @cc_nil_value() : () -> i64
      %3018 = func.call @cc_intern(%3016, %3017) : (i64, i64) -> i64
      %3019 = func.call @cc_nil_value() : () -> i64
      %3020 = func.call @cc_cons(%3018, %3019) : (i64, i64) -> i64
      %3021 = func.call @cc_values_pack(%3020) : (i64) -> i64
      func.call @stack_push_pointer(%3018) : (i64) -> ()
      %3022 = func.call @stack_pop_pointer() : () -> i64
      %3023 = func.call @cc_nil_value() : () -> i64
      %3024 = func.call @cc_errorp(%2357) : (i64) -> i64
      %3025 = arith.cmpi ne, %3024, %3023 : i64
      %3026 = arith.cmpi eq, %3023, %3023 : i64
      %3027 = arith.andi %3025, %3026 : i1
      %3028 = scf.if %3027 -> (i64) {
        scf.yield %2357 : i64
      } else {
        scf.yield %3023 : i64
      }
      %3029 = func.call @cc_errorp(%2740) : (i64) -> i64
      %3030 = arith.cmpi ne, %3029, %3023 : i64
      %3031 = arith.cmpi eq, %3028, %3023 : i64
      %3032 = arith.andi %3030, %3031 : i1
      %3033 = scf.if %3032 -> (i64) {
        scf.yield %2740 : i64
      } else {
        scf.yield %3028 : i64
      }
      %3034 = func.call @cc_errorp(%2982) : (i64) -> i64
      %3035 = arith.cmpi ne, %3034, %3023 : i64
      %3036 = arith.cmpi eq, %3033, %3023 : i64
      %3037 = arith.andi %3035, %3036 : i1
      %3038 = scf.if %3037 -> (i64) {
        scf.yield %2982 : i64
      } else {
        scf.yield %3033 : i64
      }
      %3039 = func.call @cc_errorp(%2990) : (i64) -> i64
      %3040 = arith.cmpi ne, %3039, %3023 : i64
      %3041 = arith.cmpi eq, %3038, %3023 : i64
      %3042 = arith.andi %3040, %3041 : i1
      %3043 = scf.if %3042 -> (i64) {
        scf.yield %2990 : i64
      } else {
        scf.yield %3038 : i64
      }
      %3044 = func.call @cc_errorp(%3001) : (i64) -> i64
      %3045 = arith.cmpi ne, %3044, %3023 : i64
      %3046 = arith.cmpi eq, %3043, %3023 : i64
      %3047 = arith.andi %3045, %3046 : i1
      %3048 = scf.if %3047 -> (i64) {
        scf.yield %3001 : i64
      } else {
        scf.yield %3043 : i64
      }
      %3049 = func.call @cc_errorp(%3002) : (i64) -> i64
      %3050 = arith.cmpi ne, %3049, %3023 : i64
      %3051 = arith.cmpi eq, %3048, %3023 : i64
      %3052 = arith.andi %3050, %3051 : i1
      %3053 = scf.if %3052 -> (i64) {
        scf.yield %3002 : i64
      } else {
        scf.yield %3048 : i64
      }
      %3054 = func.call @cc_errorp(%3013) : (i64) -> i64
      %3055 = arith.cmpi ne, %3054, %3023 : i64
      %3056 = arith.cmpi eq, %3053, %3023 : i64
      %3057 = arith.andi %3055, %3056 : i1
      %3058 = scf.if %3057 -> (i64) {
        scf.yield %3013 : i64
      } else {
        scf.yield %3053 : i64
      }
      %3059 = func.call @cc_errorp(%3022) : (i64) -> i64
      %3060 = arith.cmpi ne, %3059, %3023 : i64
      %3061 = arith.cmpi eq, %3058, %3023 : i64
      %3062 = arith.andi %3060, %3061 : i1
      %3063 = scf.if %3062 -> (i64) {
        scf.yield %3022 : i64
      } else {
        scf.yield %3058 : i64
      }
      %3064 = arith.cmpi ne, %3063, %3023 : i64
      scf.if %3064 {
        func.call @stack_push_pointer(%3063) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2357) : (i64) -> ()
        func.call @stack_push_pointer(%2740) : (i64) -> ()
        func.call @stack_push_pointer(%2982) : (i64) -> ()
        func.call @stack_push_pointer(%2990) : (i64) -> ()
        func.call @stack_push_pointer(%3001) : (i64) -> ()
        func.call @stack_push_pointer(%3002) : (i64) -> ()
        func.call @stack_push_pointer(%3013) : (i64) -> ()
        func.call @stack_push_pointer(%3022) : (i64) -> ()
        %3065 = llvm.mlir.addressof @str229 : !llvm.ptr
        %3066 = func.call @cc_make_function_ref_const(%3065) : (!llvm.ptr) -> i64
        %3067 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3066, %3067) : (i64, i64) -> ()
      }
      %3068 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3068 : i64
    }
    %3069 = func.call @cc_nil_value() : () -> i64
    %3070 = func.call @cc_errorp(%2348) : (i64) -> i64
    %3071 = arith.cmpi ne, %3070, %3069 : i64
    %3072 = scf.if %3071 -> (i64) {
      scf.yield %2348 : i64
    } else {
      %3073 = llvm.mlir.addressof @str230 : !llvm.ptr
      %3074 = arith.constant 19 : i64
      %3075 = func.call @cc_make_string(%3073, %3074) : (!llvm.ptr, i64) -> i64
      %3076 = func.call @cc_nil_value() : () -> i64
      %3077 = func.call @cc_intern(%3075, %3076) : (i64, i64) -> i64
      %3078 = func.call @cc_nil_value() : () -> i64
      %3079 = func.call @cc_cons(%3077, %3078) : (i64, i64) -> i64
      %3080 = func.call @cc_values_pack(%3079) : (i64) -> i64
      func.call @stack_push_pointer(%3077) : (i64) -> ()
      %3081 = func.call @stack_pop_pointer() : () -> i64
      %3082 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3083 = arith.constant 4 : i64
      %3084 = func.call @cc_make_string(%3082, %3083) : (!llvm.ptr, i64) -> i64
      %3085 = func.call @cc_nil_value() : () -> i64
      %3086 = func.call @cc_intern(%3084, %3085) : (i64, i64) -> i64
      %3087 = func.call @cc_nil_value() : () -> i64
      %3088 = func.call @cc_cons(%3086, %3087) : (i64, i64) -> i64
      %3089 = func.call @cc_values_pack(%3088) : (i64) -> i64
      func.call @stack_push_pointer(%3086) : (i64) -> ()
      %3090 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3091 = arith.constant 4 : i64
      %3092 = func.call @cc_make_string(%3090, %3091) : (!llvm.ptr, i64) -> i64
      %3093 = func.call @cc_nil_value() : () -> i64
      %3094 = func.call @cc_intern(%3092, %3093) : (i64, i64) -> i64
      %3095 = func.call @cc_nil_value() : () -> i64
      %3096 = func.call @cc_cons(%3094, %3095) : (i64, i64) -> i64
      %3097 = func.call @cc_values_pack(%3096) : (i64) -> i64
      func.call @stack_push_pointer(%3094) : (i64) -> ()
      %3098 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3098) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3099 = func.call @stack_pop_pointer() : () -> i64
      %3100 = func.call @stack_pop_pointer() : () -> i64
      %3101 = func.call @cc_cons(%3100, %3099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3101) : (i64) -> ()
      %3102 = func.call @stack_pop_pointer() : () -> i64
      %3103 = func.call @stack_pop_pointer() : () -> i64
      %3104 = func.call @cc_cons(%3103, %3102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3104) : (i64) -> ()
      %3105 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3106 = arith.constant 4 : i64
      %3107 = func.call @cc_make_string(%3105, %3106) : (!llvm.ptr, i64) -> i64
      %3108 = func.call @cc_nil_value() : () -> i64
      %3109 = func.call @cc_intern(%3107, %3108) : (i64, i64) -> i64
      %3110 = func.call @cc_nil_value() : () -> i64
      %3111 = func.call @cc_cons(%3109, %3110) : (i64, i64) -> i64
      %3112 = func.call @cc_values_pack(%3111) : (i64) -> i64
      func.call @stack_push_pointer(%3109) : (i64) -> ()
      %3113 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3114 = arith.constant 20 : i64
      %3115 = func.call @cc_make_string(%3113, %3114) : (!llvm.ptr, i64) -> i64
      %3116 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3117 = arith.constant 2 : i64
      %3118 = func.call @cc_make_string(%3116, %3117) : (!llvm.ptr, i64) -> i64
      %3119 = func.call @cc_intern(%3115, %3118) : (i64, i64) -> i64
      %3120 = func.call @cc_nil_value() : () -> i64
      %3121 = func.call @cc_cons(%3119, %3120) : (i64, i64) -> i64
      %3122 = func.call @cc_values_pack(%3121) : (i64) -> i64
      func.call @stack_push_pointer(%3119) : (i64) -> ()
      %3123 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%3123) : (i64) -> ()
      %3124 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3125 = arith.constant 24 : i64
      %3126 = func.call @cc_make_string(%3124, %3125) : (!llvm.ptr, i64) -> i64
      %3127 = func.call @cc_nil_value() : () -> i64
      %3128 = func.call @cc_intern(%3126, %3127) : (i64, i64) -> i64
      %3129 = func.call @cc_nil_value() : () -> i64
      %3130 = func.call @cc_cons(%3128, %3129) : (i64, i64) -> i64
      %3131 = func.call @cc_values_pack(%3130) : (i64) -> i64
      func.call @stack_push_pointer(%3128) : (i64) -> ()
      %3132 = func.call @stack_pop_pointer() : () -> i64
      %3133 = func.call @stack_pop_pointer() : () -> i64
      %3134 = func.call @cc_cons(%3132, %3133) : (i64, i64) -> i64
      %3135 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3136 = arith.constant 5 : i64
      %3137 = func.call @cc_make_string(%3135, %3136) : (!llvm.ptr, i64) -> i64
      %3138 = func.call @cc_nil_value() : () -> i64
      %3139 = func.call @cc_intern(%3137, %3138) : (i64, i64) -> i64
      %3140 = func.call @cc_nil_value() : () -> i64
      %3141 = func.call @cc_cons(%3139, %3140) : (i64, i64) -> i64
      %3142 = func.call @cc_values_pack(%3141) : (i64) -> i64
      %3143 = func.call @cc_cons(%3139, %3134) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3143) : (i64) -> ()
      %3144 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3145 = arith.constant 6 : i64
      %3146 = func.call @cc_make_string(%3144, %3145) : (!llvm.ptr, i64) -> i64
      %3147 = func.call @cc_nil_value() : () -> i64
      %3148 = func.call @cc_intern(%3146, %3147) : (i64, i64) -> i64
      %3149 = func.call @cc_nil_value() : () -> i64
      %3150 = func.call @cc_cons(%3148, %3149) : (i64, i64) -> i64
      %3151 = func.call @cc_values_pack(%3150) : (i64) -> i64
      func.call @stack_push_pointer(%3148) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3152 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3153 = arith.constant 4 : i64
      %3154 = func.call @cc_make_string(%3152, %3153) : (!llvm.ptr, i64) -> i64
      %3155 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3156 = arith.constant 11 : i64
      %3157 = func.call @cc_make_string(%3155, %3156) : (!llvm.ptr, i64) -> i64
      %3158 = func.call @cc_intern(%3154, %3157) : (i64, i64) -> i64
      %3159 = func.call @cc_nil_value() : () -> i64
      %3160 = func.call @cc_cons(%3158, %3159) : (i64, i64) -> i64
      %3161 = func.call @cc_values_pack(%3160) : (i64) -> i64
      func.call @stack_push_pointer(%3158) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3162 = func.call @stack_pop_pointer() : () -> i64
      %3163 = func.call @stack_pop_pointer() : () -> i64
      %3164 = func.call @cc_cons(%3163, %3162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3164) : (i64) -> ()
      %3165 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3166 = arith.constant 4 : i64
      %3167 = func.call @cc_make_string(%3165, %3166) : (!llvm.ptr, i64) -> i64
      %3168 = llvm.mlir.addressof @str242 : !llvm.ptr
      %3169 = arith.constant 11 : i64
      %3170 = func.call @cc_make_string(%3168, %3169) : (!llvm.ptr, i64) -> i64
      %3171 = func.call @cc_intern(%3167, %3170) : (i64, i64) -> i64
      %3172 = func.call @cc_nil_value() : () -> i64
      %3173 = func.call @cc_cons(%3171, %3172) : (i64, i64) -> i64
      %3174 = func.call @cc_values_pack(%3173) : (i64) -> i64
      func.call @stack_push_pointer(%3171) : (i64) -> ()
      %3175 = llvm.mlir.addressof @str243 : !llvm.ptr
      %3176 = arith.constant 4 : i64
      %3177 = func.call @cc_make_string(%3175, %3176) : (!llvm.ptr, i64) -> i64
      %3178 = func.call @cc_nil_value() : () -> i64
      %3179 = func.call @cc_intern(%3177, %3178) : (i64, i64) -> i64
      %3180 = func.call @cc_nil_value() : () -> i64
      %3181 = func.call @cc_cons(%3179, %3180) : (i64, i64) -> i64
      %3182 = func.call @cc_values_pack(%3181) : (i64) -> i64
      func.call @stack_push_pointer(%3179) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3183 = func.call @stack_pop_pointer() : () -> i64
      %3184 = func.call @stack_pop_pointer() : () -> i64
      %3185 = func.call @cc_cons(%3184, %3183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3185) : (i64) -> ()
      %3186 = func.call @stack_pop_pointer() : () -> i64
      %3187 = func.call @stack_pop_pointer() : () -> i64
      %3188 = func.call @cc_cons(%3187, %3186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3188) : (i64) -> ()
      %3189 = func.call @stack_pop_pointer() : () -> i64
      %3190 = func.call @stack_pop_pointer() : () -> i64
      %3191 = func.call @cc_cons(%3190, %3189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3191) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3192 = func.call @stack_pop_pointer() : () -> i64
      %3193 = func.call @stack_pop_pointer() : () -> i64
      %3194 = func.call @cc_cons(%3193, %3192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3194) : (i64) -> ()
      %3195 = func.call @stack_pop_pointer() : () -> i64
      %3196 = func.call @stack_pop_pointer() : () -> i64
      %3197 = func.call @cc_cons(%3196, %3195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3197) : (i64) -> ()
      %3198 = func.call @stack_pop_pointer() : () -> i64
      %3199 = func.call @stack_pop_pointer() : () -> i64
      %3200 = func.call @cc_cons(%3199, %3198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3200) : (i64) -> ()
      %3201 = func.call @stack_pop_pointer() : () -> i64
      %3202 = func.call @stack_pop_pointer() : () -> i64
      %3203 = func.call @cc_cons(%3202, %3201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3203) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3204 = func.call @stack_pop_pointer() : () -> i64
      %3205 = func.call @stack_pop_pointer() : () -> i64
      %3206 = func.call @cc_cons(%3205, %3204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3206) : (i64) -> ()
      %3207 = func.call @stack_pop_pointer() : () -> i64
      %3208 = func.call @stack_pop_pointer() : () -> i64
      %3209 = func.call @cc_cons(%3208, %3207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3209) : (i64) -> ()
      %3210 = func.call @stack_pop_pointer() : () -> i64
      %3211 = func.call @stack_pop_pointer() : () -> i64
      %3212 = func.call @cc_cons(%3211, %3210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3212) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3213 = func.call @stack_pop_pointer() : () -> i64
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @cc_cons(%3214, %3213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3215) : (i64) -> ()
      %3216 = func.call @stack_pop_pointer() : () -> i64
      %3217 = func.call @stack_pop_pointer() : () -> i64
      %3218 = func.call @cc_cons(%3217, %3216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3218) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3219 = func.call @stack_pop_pointer() : () -> i64
      %3220 = func.call @stack_pop_pointer() : () -> i64
      %3221 = func.call @cc_cons(%3220, %3219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3221) : (i64) -> ()
      %3222 = func.call @stack_pop_pointer() : () -> i64
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3224 = func.call @cc_cons(%3223, %3222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3224) : (i64) -> ()
      %3225 = llvm.mlir.addressof @str244 : !llvm.ptr
      %3226 = arith.constant 14 : i64
      %3227 = func.call @cc_make_string(%3225, %3226) : (!llvm.ptr, i64) -> i64
      %3228 = llvm.mlir.addressof @str245 : !llvm.ptr
      %3229 = arith.constant 2 : i64
      %3230 = func.call @cc_make_string(%3228, %3229) : (!llvm.ptr, i64) -> i64
      %3231 = func.call @cc_intern(%3227, %3230) : (i64, i64) -> i64
      %3232 = func.call @cc_nil_value() : () -> i64
      %3233 = func.call @cc_cons(%3231, %3232) : (i64, i64) -> i64
      %3234 = func.call @cc_values_pack(%3233) : (i64) -> i64
      func.call @stack_push_pointer(%3231) : (i64) -> ()
      %3235 = llvm.mlir.addressof @str246 : !llvm.ptr
      %3236 = arith.constant 4 : i64
      %3237 = func.call @cc_make_string(%3235, %3236) : (!llvm.ptr, i64) -> i64
      %3238 = func.call @cc_nil_value() : () -> i64
      %3239 = func.call @cc_intern(%3237, %3238) : (i64, i64) -> i64
      %3240 = func.call @cc_nil_value() : () -> i64
      %3241 = func.call @cc_cons(%3239, %3240) : (i64, i64) -> i64
      %3242 = func.call @cc_values_pack(%3241) : (i64) -> i64
      func.call @stack_push_pointer(%3239) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3243 = func.call @stack_pop_pointer() : () -> i64
      %3244 = func.call @stack_pop_pointer() : () -> i64
      %3245 = func.call @cc_cons(%3244, %3243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3245) : (i64) -> ()
      %3246 = func.call @stack_pop_pointer() : () -> i64
      %3247 = func.call @stack_pop_pointer() : () -> i64
      %3248 = func.call @cc_cons(%3247, %3246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3248) : (i64) -> ()
      %3249 = llvm.mlir.addressof @str247 : !llvm.ptr
      %3250 = arith.constant 13 : i64
      %3251 = func.call @cc_make_string(%3249, %3250) : (!llvm.ptr, i64) -> i64
      %3252 = llvm.mlir.addressof @str248 : !llvm.ptr
      %3253 = arith.constant 11 : i64
      %3254 = func.call @cc_make_string(%3252, %3253) : (!llvm.ptr, i64) -> i64
      %3255 = func.call @cc_intern(%3251, %3254) : (i64, i64) -> i64
      %3256 = func.call @cc_nil_value() : () -> i64
      %3257 = func.call @cc_cons(%3255, %3256) : (i64, i64) -> i64
      %3258 = func.call @cc_values_pack(%3257) : (i64) -> i64
      func.call @stack_push_pointer(%3255) : (i64) -> ()
      %3259 = llvm.mlir.addressof @str249 : !llvm.ptr
      %3260 = arith.constant 12 : i64
      %3261 = func.call @cc_make_string(%3259, %3260) : (!llvm.ptr, i64) -> i64
      %3262 = llvm.mlir.addressof @str250 : !llvm.ptr
      %3263 = arith.constant 2 : i64
      %3264 = func.call @cc_make_string(%3262, %3263) : (!llvm.ptr, i64) -> i64
      %3265 = func.call @cc_intern(%3261, %3264) : (i64, i64) -> i64
      %3266 = func.call @cc_nil_value() : () -> i64
      %3267 = func.call @cc_cons(%3265, %3266) : (i64, i64) -> i64
      %3268 = func.call @cc_values_pack(%3267) : (i64) -> i64
      func.call @stack_push_pointer(%3265) : (i64) -> ()
      %3269 = llvm.mlir.addressof @str251 : !llvm.ptr
      %3270 = arith.constant 4 : i64
      %3271 = func.call @cc_make_string(%3269, %3270) : (!llvm.ptr, i64) -> i64
      %3272 = func.call @cc_nil_value() : () -> i64
      %3273 = func.call @cc_intern(%3271, %3272) : (i64, i64) -> i64
      %3274 = func.call @cc_nil_value() : () -> i64
      %3275 = func.call @cc_cons(%3273, %3274) : (i64, i64) -> i64
      %3276 = func.call @cc_values_pack(%3275) : (i64) -> i64
      func.call @stack_push_pointer(%3273) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3277 = func.call @stack_pop_pointer() : () -> i64
      %3278 = func.call @stack_pop_pointer() : () -> i64
      %3279 = func.call @cc_cons(%3278, %3277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3279) : (i64) -> ()
      %3280 = func.call @stack_pop_pointer() : () -> i64
      %3281 = func.call @stack_pop_pointer() : () -> i64
      %3282 = func.call @cc_cons(%3281, %3280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3282) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3283 = func.call @stack_pop_pointer() : () -> i64
      %3284 = func.call @stack_pop_pointer() : () -> i64
      %3285 = func.call @cc_cons(%3284, %3283) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3285) : (i64) -> ()
      %3286 = func.call @stack_pop_pointer() : () -> i64
      %3287 = func.call @stack_pop_pointer() : () -> i64
      %3288 = func.call @cc_cons(%3287, %3286) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3288) : (i64) -> ()
      %3289 = llvm.mlir.addressof @str252 : !llvm.ptr
      %3290 = arith.constant 4 : i64
      %3291 = func.call @cc_make_string(%3289, %3290) : (!llvm.ptr, i64) -> i64
      %3292 = func.call @cc_nil_value() : () -> i64
      %3293 = func.call @cc_intern(%3291, %3292) : (i64, i64) -> i64
      %3294 = func.call @cc_nil_value() : () -> i64
      %3295 = func.call @cc_cons(%3293, %3294) : (i64, i64) -> i64
      %3296 = func.call @cc_values_pack(%3295) : (i64) -> i64
      func.call @stack_push_pointer(%3293) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3297 = func.call @stack_pop_pointer() : () -> i64
      %3298 = func.call @stack_pop_pointer() : () -> i64
      %3299 = func.call @cc_cons(%3298, %3297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3299) : (i64) -> ()
      %3300 = func.call @stack_pop_pointer() : () -> i64
      %3301 = func.call @stack_pop_pointer() : () -> i64
      %3302 = func.call @cc_cons(%3301, %3300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3302) : (i64) -> ()
      %3303 = func.call @stack_pop_pointer() : () -> i64
      %3304 = func.call @stack_pop_pointer() : () -> i64
      %3305 = func.call @cc_cons(%3304, %3303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3305) : (i64) -> ()
      %3306 = func.call @stack_pop_pointer() : () -> i64
      %3307 = func.call @stack_pop_pointer() : () -> i64
      %3308 = func.call @cc_cons(%3307, %3306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3308) : (i64) -> ()
      %3309 = func.call @stack_pop_pointer() : () -> i64
      %3310 = func.call @stack_pop_pointer() : () -> i64
      %3311 = func.call @cc_cons(%3310, %3309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3311) : (i64) -> ()
      %3312 = func.call @stack_pop_pointer() : () -> i64
      %3429 = arith.constant 130642754928662 : i64
      %3430 = arith.constant 0 : i64
      %3431 = func.call @cc_make_closure(%3429, %3430) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3431) : (i64) -> ()
      %3432 = func.call @stack_pop_pointer() : () -> i64
      %3433 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3433) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3434 = func.call @stack_pop_pointer() : () -> i64
      %3435 = func.call @stack_pop_pointer() : () -> i64
      %3436 = func.call @cc_cons(%3435, %3434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3436) : (i64) -> ()
      %3437 = func.call @stack_pop_pointer() : () -> i64
      %3438 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3439 = arith.constant 11 : i64
      %3440 = func.call @cc_make_string(%3438, %3439) : (!llvm.ptr, i64) -> i64
      %3441 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3442 = arith.constant 7 : i64
      %3443 = func.call @cc_make_string(%3441, %3442) : (!llvm.ptr, i64) -> i64
      %3444 = func.call @cc_intern(%3440, %3443) : (i64, i64) -> i64
      %3445 = func.call @cc_nil_value() : () -> i64
      %3446 = func.call @cc_cons(%3444, %3445) : (i64, i64) -> i64
      %3447 = func.call @cc_values_pack(%3446) : (i64) -> i64
      func.call @stack_push_pointer(%3444) : (i64) -> ()
      %3448 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3449 = func.call @stack_pop_pointer() : () -> i64
      %3450 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3451 = arith.constant 4 : i64
      %3452 = func.call @cc_make_string(%3450, %3451) : (!llvm.ptr, i64) -> i64
      %3453 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3454 = arith.constant 7 : i64
      %3455 = func.call @cc_make_string(%3453, %3454) : (!llvm.ptr, i64) -> i64
      %3456 = func.call @cc_intern(%3452, %3455) : (i64, i64) -> i64
      %3457 = func.call @cc_nil_value() : () -> i64
      %3458 = func.call @cc_cons(%3456, %3457) : (i64, i64) -> i64
      %3459 = func.call @cc_values_pack(%3458) : (i64) -> i64
      func.call @stack_push_pointer(%3456) : (i64) -> ()
      %3460 = func.call @stack_pop_pointer() : () -> i64
      %3461 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3462 = arith.constant 6 : i64
      %3463 = func.call @cc_make_string(%3461, %3462) : (!llvm.ptr, i64) -> i64
      %3464 = func.call @cc_nil_value() : () -> i64
      %3465 = func.call @cc_intern(%3463, %3464) : (i64, i64) -> i64
      %3466 = func.call @cc_nil_value() : () -> i64
      %3467 = func.call @cc_cons(%3465, %3466) : (i64, i64) -> i64
      %3468 = func.call @cc_values_pack(%3467) : (i64) -> i64
      func.call @stack_push_pointer(%3465) : (i64) -> ()
      %3469 = func.call @stack_pop_pointer() : () -> i64
      %3470 = func.call @cc_nil_value() : () -> i64
      %3471 = func.call @cc_errorp(%3081) : (i64) -> i64
      %3472 = arith.cmpi ne, %3471, %3470 : i64
      %3473 = arith.cmpi eq, %3470, %3470 : i64
      %3474 = arith.andi %3472, %3473 : i1
      %3475 = scf.if %3474 -> (i64) {
        scf.yield %3081 : i64
      } else {
        scf.yield %3470 : i64
      }
      %3476 = func.call @cc_errorp(%3312) : (i64) -> i64
      %3477 = arith.cmpi ne, %3476, %3470 : i64
      %3478 = arith.cmpi eq, %3475, %3470 : i64
      %3479 = arith.andi %3477, %3478 : i1
      %3480 = scf.if %3479 -> (i64) {
        scf.yield %3312 : i64
      } else {
        scf.yield %3475 : i64
      }
      %3481 = func.call @cc_errorp(%3432) : (i64) -> i64
      %3482 = arith.cmpi ne, %3481, %3470 : i64
      %3483 = arith.cmpi eq, %3480, %3470 : i64
      %3484 = arith.andi %3482, %3483 : i1
      %3485 = scf.if %3484 -> (i64) {
        scf.yield %3432 : i64
      } else {
        scf.yield %3480 : i64
      }
      %3486 = func.call @cc_errorp(%3437) : (i64) -> i64
      %3487 = arith.cmpi ne, %3486, %3470 : i64
      %3488 = arith.cmpi eq, %3485, %3470 : i64
      %3489 = arith.andi %3487, %3488 : i1
      %3490 = scf.if %3489 -> (i64) {
        scf.yield %3437 : i64
      } else {
        scf.yield %3485 : i64
      }
      %3491 = func.call @cc_errorp(%3448) : (i64) -> i64
      %3492 = arith.cmpi ne, %3491, %3470 : i64
      %3493 = arith.cmpi eq, %3490, %3470 : i64
      %3494 = arith.andi %3492, %3493 : i1
      %3495 = scf.if %3494 -> (i64) {
        scf.yield %3448 : i64
      } else {
        scf.yield %3490 : i64
      }
      %3496 = func.call @cc_errorp(%3449) : (i64) -> i64
      %3497 = arith.cmpi ne, %3496, %3470 : i64
      %3498 = arith.cmpi eq, %3495, %3470 : i64
      %3499 = arith.andi %3497, %3498 : i1
      %3500 = scf.if %3499 -> (i64) {
        scf.yield %3449 : i64
      } else {
        scf.yield %3495 : i64
      }
      %3501 = func.call @cc_errorp(%3460) : (i64) -> i64
      %3502 = arith.cmpi ne, %3501, %3470 : i64
      %3503 = arith.cmpi eq, %3500, %3470 : i64
      %3504 = arith.andi %3502, %3503 : i1
      %3505 = scf.if %3504 -> (i64) {
        scf.yield %3460 : i64
      } else {
        scf.yield %3500 : i64
      }
      %3506 = func.call @cc_errorp(%3469) : (i64) -> i64
      %3507 = arith.cmpi ne, %3506, %3470 : i64
      %3508 = arith.cmpi eq, %3505, %3470 : i64
      %3509 = arith.andi %3507, %3508 : i1
      %3510 = scf.if %3509 -> (i64) {
        scf.yield %3469 : i64
      } else {
        scf.yield %3505 : i64
      }
      %3511 = arith.cmpi ne, %3510, %3470 : i64
      scf.if %3511 {
        func.call @stack_push_pointer(%3510) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3081) : (i64) -> ()
        func.call @stack_push_pointer(%3312) : (i64) -> ()
        func.call @stack_push_pointer(%3432) : (i64) -> ()
        func.call @stack_push_pointer(%3437) : (i64) -> ()
        func.call @stack_push_pointer(%3448) : (i64) -> ()
        func.call @stack_push_pointer(%3449) : (i64) -> ()
        func.call @stack_push_pointer(%3460) : (i64) -> ()
        func.call @stack_push_pointer(%3469) : (i64) -> ()
        %3512 = llvm.mlir.addressof @str264 : !llvm.ptr
        %3513 = func.call @cc_make_function_ref_const(%3512) : (!llvm.ptr) -> i64
        %3514 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3513, %3514) : (i64, i64) -> ()
      }
      %3515 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3515 : i64
    }
    func.call @stack_push_pointer(%3072) : (i64) -> ()
    %3516 = func.call @stack_pop_pointer() : () -> i64
    %3517 = func.call @cc_multiple_value_list(%3516) : (i64) -> i64
    %3518 = llvm.mlir.addressof @str265 : !llvm.ptr
    %3519 = arith.constant 38 : i64
    %3520 = func.call @cc_make_string(%3518, %3519) : (!llvm.ptr, i64) -> i64
    %3521 = func.call @cc_nil_value() : () -> i64
    %3522 = func.call @cc_intern(%3520, %3521) : (i64, i64) -> i64
    %3523 = func.call @cc_nil_value() : () -> i64
    %3524 = func.call @cc_cons(%3522, %3523) : (i64, i64) -> i64
    %3525 = func.call @cc_values_pack(%3524) : (i64) -> i64
    %3526 = func.call @cc_symbol_value(%3522) : (i64) -> i64
    %3527 = llvm.mlir.addressof @str266 : !llvm.ptr
    %3528 = arith.constant 40 : i64
    %3529 = func.call @cc_make_string(%3527, %3528) : (!llvm.ptr, i64) -> i64
    %3530 = func.call @cc_nil_value() : () -> i64
    %3531 = func.call @cc_intern(%3529, %3530) : (i64, i64) -> i64
    %3532 = func.call @cc_nil_value() : () -> i64
    %3533 = func.call @cc_cons(%3531, %3532) : (i64, i64) -> i64
    %3534 = func.call @cc_values_pack(%3533) : (i64) -> i64
    %3535 = func.call @cc_symbol_value(%3531) : (i64) -> i64
    %3536 = func.call @cc_nil_value() : () -> i64
    %3537 = arith.cmpi ne, %3526, %3536 : i64
    %3538 = scf.if %3537 -> (i64) {
      scf.yield %3535 : i64
    } else {
      scf.yield %3517 : i64
    }
    %3539 = func.call @cc_values_pack(%3538) : (i64) -> i64
    func.call @stack_push_pointer(%3539) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_4634242382299139"() {
    %337 = func.call @stack_pop_pointer() : () -> i64
    %338 = func.call @stack_pop_pointer() : () -> i64
    %339 = func.call @cc_nil_value() : () -> i64
    %340 = func.call @cc_nil_value() : () -> i64
    %341 = func.call @cc_errorp(%339) : (i64) -> i64
    %342 = arith.cmpi ne, %341, %340 : i64
    %343 = scf.if %342 -> (i64) {
      scf.yield %339 : i64
    } else {
      %345 = func.call @cc_symbol_value(%338) : (i64) -> i64
      func.call @stack_push_pointer(%345) : (i64) -> ()
      %346 = func.call @stack_pop_pointer() : () -> i64
      %347 = func.call @cc_nil_value() : () -> i64
      %348 = func.call @cc_nil_value() : () -> i64
      %349 = func.call @cc_errorp(%347) : (i64) -> i64
      %350 = arith.cmpi ne, %349, %348 : i64
      %351 = scf.if %350 -> (i64) {
        scf.yield %347 : i64
      } else {
        %352 = func.call @cc_nil_value() : () -> i64
        %353 = func.call @cc_nil_value() : () -> i64
        %354 = func.call @cc_errorp(%352) : (i64) -> i64
        %355 = arith.cmpi ne, %354, %353 : i64
        %356 = scf.if %355 -> (i64) {
          scf.yield %352 : i64
        } else {
          func.call @stack_push_pointer(%346) : (i64) -> ()
          %357 = func.call @stack_pop_pointer() : () -> i64
          %358 = func.call @cc_nil_value() : () -> i64
          %359 = func.call @cc_errorp(%357) : (i64) -> i64
          %360 = arith.cmpi ne, %359, %358 : i64
          %361 = arith.cmpi eq, %358, %358 : i64
          %362 = arith.andi %360, %361 : i1
          %363 = scf.if %362 -> (i64) {
            scf.yield %357 : i64
          } else {
            scf.yield %358 : i64
          }
          %364 = arith.cmpi ne, %363, %358 : i64
          scf.if %364 {
            func.call @stack_push_pointer(%363) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%357) : (i64) -> ()
            %365 = llvm.mlir.addressof @str33 : !llvm.ptr
            %366 = func.call @cc_make_function_ref_const(%365) : (!llvm.ptr) -> i64
            %367 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%366, %367) : (i64, i64) -> ()
          }
          %368 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %368 : i64
        }
        %369 = func.call @cc_nil_value() : () -> i64
        %370 = func.call @cc_errorp(%356) : (i64) -> i64
        %371 = arith.cmpi ne, %370, %369 : i64
        %372 = scf.if %371 -> (i64) {
          scf.yield %356 : i64
        } else {
          %373 = func.call @cc_nil_value() : () -> i64
          %374 = arith.cmpi ne, %373, %373 : i64
          scf.if %374 {
            func.call @stack_push_pointer(%373) : (i64) -> ()
          } else {
            %375 = llvm.mlir.addressof @str34 : !llvm.ptr
            %376 = func.call @cc_make_function_ref_const(%375) : (!llvm.ptr) -> i64
            %377 = arith.constant 0 : i64
            func.call @cc_funcall_stack(%376, %377) : (i64, i64) -> ()
          }
          %378 = func.call @stack_pop_pointer() : () -> i64
          %379 = func.call @cc_nil_value() : () -> i64
          %380 = func.call @cc_errorp(%378) : (i64) -> i64
          %381 = arith.cmpi ne, %380, %379 : i64
          %382 = scf.if %381 -> (i64) {
            scf.yield %378 : i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %383 = func.call @stack_pop_pointer() : () -> i64
            %384 = func.call @cc_set_symbol_value(%337, %383) : (i64, i64) -> i64
            func.call @stack_push_pointer(%383) : (i64) -> ()
            %385 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %385 : i64
          }
          func.call @stack_push_pointer(%382) : (i64) -> ()
          %386 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %386 : i64
        }
        func.call @stack_push_pointer(%372) : (i64) -> ()
        %387 = func.call @stack_pop_pointer() : () -> i64
        %388 = func.call @cc_multiple_value_list(%387) : (i64) -> i64
        func.call @stack_push_pointer(%346) : (i64) -> ()
        %389 = func.call @stack_pop_pointer() : () -> i64
        %390 = func.call @cc_nil_value() : () -> i64
        %391 = func.call @cc_errorp(%389) : (i64) -> i64
        %392 = arith.cmpi ne, %391, %390 : i64
        %393 = arith.cmpi eq, %390, %390 : i64
        %394 = arith.andi %392, %393 : i1
        %395 = scf.if %394 -> (i64) {
          scf.yield %389 : i64
        } else {
          scf.yield %390 : i64
        }
        %396 = arith.cmpi ne, %395, %390 : i64
        scf.if %396 {
          func.call @stack_push_pointer(%395) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%389) : (i64) -> ()
          %397 = llvm.mlir.addressof @str35 : !llvm.ptr
          %398 = func.call @cc_make_function_ref_const(%397) : (!llvm.ptr) -> i64
          %399 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%398, %399) : (i64, i64) -> ()
        }
        %400 = func.call @stack_depth() : () -> i64
        %401 = arith.constant 0 : i64
        %402 = arith.cmpi sgt, %400, %401 : i64
        scf.if %402 {
          %403 = func.call @stack_pop_pointer() : () -> i64
        }
        %404 = func.call @cc_values_pack(%388) : (i64) -> i64
        func.call @stack_push_pointer(%404) : (i64) -> ()
        %405 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %405 : i64
      }
      func.call @stack_push_pointer(%351) : (i64) -> ()
      %406 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %406 : i64
    }
    func.call @stack_push_pointer(%343) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299137"() {
    %271 = func.call @cc_nil_value() : () -> i64
    %272 = func.call @cc_nil_value() : () -> i64
    %273 = func.call @cc_errorp(%271) : (i64) -> i64
    %274 = arith.cmpi ne, %273, %272 : i64
    %275 = scf.if %274 -> (i64) {
      scf.yield %271 : i64
    } else {
      %276 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%276) : (i64) -> ()
      %277 = func.call @stack_pop_pointer() : () -> i64
      %278 = llvm.mlir.addressof @str29 : !llvm.ptr
      %279 = arith.constant 33 : i64
      %280 = func.call @cc_make_symbol(%278, %279) : (!llvm.ptr, i64) -> i64
      %281 = func.call @cc_persistent_root_value(%280) : (i64) -> i64
      %282 = func.call @cc_set_symbol_value(%281, %277) : (i64, i64) -> i64
      %283 = func.call @cc_nil_value() : () -> i64
      %284 = func.call @cc_nil_value() : () -> i64
      %285 = func.call @cc_errorp(%283) : (i64) -> i64
      %286 = arith.cmpi ne, %285, %284 : i64
      %287 = scf.if %286 -> (i64) {
        scf.yield %283 : i64
      } else {
        %288 = func.call @cc_nil_value() : () -> i64
        %289 = arith.cmpi ne, %288, %288 : i64
        scf.if %289 {
          func.call @stack_push_pointer(%288) : (i64) -> ()
        } else {
          %290 = llvm.mlir.addressof @str30 : !llvm.ptr
          %291 = func.call @cc_make_function_ref_const(%290) : (!llvm.ptr) -> i64
          %292 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%291, %292) : (i64, i64) -> ()
        }
        %293 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %294 = func.call @stack_pop_pointer() : () -> i64
        %295 = func.call @cc_nil_value() : () -> i64
        %296 = func.call @cc_nil_value() : () -> i64
        %297 = func.call @cc_errorp(%295) : (i64) -> i64
        %298 = arith.cmpi ne, %297, %296 : i64
        %299:2 = scf.if %298 -> (i64, i64) {
          scf.yield %295, %294 : i64, i64
        } else {
          func.call @stack_push_pointer(%293) : (i64) -> ()
          %301 = func.call @stack_pop_pointer() : () -> i64
          %302 = func.call @cc_nil_value() : () -> i64
          %303 = func.call @cc_nil_value() : () -> i64
          %304 = func.call @cc_errorp(%302) : (i64) -> i64
          %305 = arith.cmpi ne, %304, %303 : i64
          %306:2 = scf.if %305 -> (i64, i64) {
            scf.yield %302, %294 : i64, i64
          } else {
            %307 = func.call @cc_nil_value() : () -> i64
            %308 = func.call @cc_nil_value() : () -> i64
            %309 = func.call @cc_errorp(%307) : (i64) -> i64
            %310 = arith.cmpi ne, %309, %308 : i64
            %311:2 = scf.if %310 -> (i64, i64) {
              scf.yield %307, %294 : i64, i64
            } else {
              func.call @stack_push_pointer(%301) : (i64) -> ()
              %312 = func.call @stack_pop_pointer() : () -> i64
              %313 = func.call @cc_nil_value() : () -> i64
              %314 = func.call @cc_errorp(%312) : (i64) -> i64
              %315 = arith.cmpi ne, %314, %313 : i64
              %316 = arith.cmpi eq, %313, %313 : i64
              %317 = arith.andi %315, %316 : i1
              %318 = scf.if %317 -> (i64) {
                scf.yield %312 : i64
              } else {
                scf.yield %313 : i64
              }
              %319 = arith.cmpi ne, %318, %313 : i64
              scf.if %319 {
                func.call @stack_push_pointer(%318) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%312) : (i64) -> ()
                %320 = llvm.mlir.addressof @str31 : !llvm.ptr
                %321 = func.call @cc_make_function_ref_const(%320) : (!llvm.ptr) -> i64
                %322 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%321, %322) : (i64, i64) -> ()
              }
              %323 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %323, %294 : i64, i64
            }
            %324 = func.call @cc_nil_value() : () -> i64
            %325 = func.call @cc_errorp(%311#0) : (i64) -> i64
            %326 = arith.cmpi ne, %325, %324 : i64
            %327:2 = scf.if %326 -> (i64, i64) {
              scf.yield %311#0, %311#1 : i64, i64
            } else {
              %328 = llvm.mlir.addressof @str32 : !llvm.ptr
              %329 = arith.constant 27 : i64
              %330 = func.call @cc_make_string(%328, %329) : (!llvm.ptr, i64) -> i64
              %331 = func.call @cc_nil_value() : () -> i64
              %332 = func.call @cc_intern(%330, %331) : (i64, i64) -> i64
              %333 = func.call @cc_nil_value() : () -> i64
              %334 = func.call @cc_cons(%332, %333) : (i64, i64) -> i64
              %335 = func.call @cc_values_pack(%334) : (i64) -> i64
              func.call @stack_push_pointer(%332) : (i64) -> ()
              %336 = func.call @stack_pop_pointer() : () -> i64
              %407 = llvm.mlir.addressof @str36 : !llvm.ptr
              %408 = arith.constant 34 : i64
              %409 = func.call @cc_make_symbol(%407, %408) : (!llvm.ptr, i64) -> i64
              %410 = func.call @cc_persistent_root_value(%409) : (i64) -> i64
              %411 = func.call @cc_set_symbol_value(%410, %293) : (i64, i64) -> i64
              func.call @stack_push_pointer(%410) : (i64) -> ()
              func.call @stack_push_pointer(%281) : (i64) -> ()
              %412 = arith.constant 4634242382299139 : i64
              %413 = arith.constant 2 : i64
              %414 = func.call @cc_make_closure(%412, %413) : (i64, i64) -> i64
              func.call @stack_push_pointer(%414) : (i64) -> ()
              %415 = func.call @stack_pop_pointer() : () -> i64
              %416 = func.call @cc_nil_value() : () -> i64
              %417 = func.call @cc_errorp(%336) : (i64) -> i64
              %418 = arith.cmpi ne, %417, %416 : i64
              %419 = arith.cmpi eq, %416, %416 : i64
              %420 = arith.andi %418, %419 : i1
              %421 = scf.if %420 -> (i64) {
                scf.yield %336 : i64
              } else {
                scf.yield %416 : i64
              }
              %422 = func.call @cc_errorp(%415) : (i64) -> i64
              %423 = arith.cmpi ne, %422, %416 : i64
              %424 = arith.cmpi eq, %421, %416 : i64
              %425 = arith.andi %423, %424 : i1
              %426 = scf.if %425 -> (i64) {
                scf.yield %415 : i64
              } else {
                scf.yield %421 : i64
              }
              %427 = arith.cmpi ne, %426, %416 : i64
              scf.if %427 {
                func.call @stack_push_pointer(%426) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%336) : (i64) -> ()
                func.call @stack_push_pointer(%415) : (i64) -> ()
                %428 = llvm.mlir.addressof @str37 : !llvm.ptr
                %429 = func.call @cc_make_function_ref_const(%428) : (!llvm.ptr) -> i64
                %430 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%429, %430) : (i64, i64) -> ()
              }
              %431 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%431) : (i64) -> ()
              %432 = func.call @stack_pop_pointer() : () -> i64
              %433 = func.call @cc_nil_value() : () -> i64
              %434 = func.call @cc_errorp(%432) : (i64) -> i64
              %435 = arith.cmpi ne, %434, %433 : i64
              %436 = scf.if %435 -> (i64) {
                scf.yield %432 : i64
              } else {
                func.call @stack_push_pointer(%431) : (i64) -> ()
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
                  %445 = llvm.mlir.addressof @str38 : !llvm.ptr
                  %446 = func.call @cc_make_function_ref_const(%445) : (!llvm.ptr) -> i64
                  %447 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%446, %447) : (i64, i64) -> ()
                }
                %448 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %448 : i64
              }
              func.call @stack_push_pointer(%436) : (i64) -> ()
              %449 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %449, %431 : i64, i64
            }
            func.call @stack_push_pointer(%327#0) : (i64) -> ()
            %450 = func.call @stack_pop_pointer() : () -> i64
            %451 = func.call @cc_multiple_value_list(%450) : (i64) -> i64
            func.call @stack_push_pointer(%301) : (i64) -> ()
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
              %460 = llvm.mlir.addressof @str39 : !llvm.ptr
              %461 = func.call @cc_make_function_ref_const(%460) : (!llvm.ptr) -> i64
              %462 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%461, %462) : (i64, i64) -> ()
            }
            %463 = func.call @stack_depth() : () -> i64
            %464 = arith.constant 0 : i64
            %465 = arith.cmpi sgt, %463, %464 : i64
            scf.if %465 {
              %466 = func.call @stack_pop_pointer() : () -> i64
            }
            %467 = func.call @cc_values_pack(%451) : (i64) -> i64
            func.call @stack_push_pointer(%467) : (i64) -> ()
            %468 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %468, %327#1 : i64, i64
          }
          func.call @stack_push_pointer(%306#0) : (i64) -> ()
          %469 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %469, %306#1 : i64, i64
        }
        %470 = func.call @cc_nil_value() : () -> i64
        %471 = func.call @cc_errorp(%299#0) : (i64) -> i64
        %472 = arith.cmpi ne, %471, %470 : i64
        %473:2 = scf.if %472 -> (i64, i64) {
          scf.yield %299#0, %299#1 : i64, i64
        } else {
          %474 = func.call @cc_push_ignore_errors_trap() : () -> i64
          func.call @cc_clear_multiple_values() : () -> ()
          %475 = func.call @cc_nil_value() : () -> i64
          %476 = func.call @cc_nil_value() : () -> i64
          %477 = func.call @cc_errorp(%475) : (i64) -> i64
          %478 = arith.cmpi ne, %477, %476 : i64
          %479 = scf.if %478 -> (i64) {
            scf.yield %475 : i64
          } else {
            func.call @stack_push_pointer(%299#1) : (i64) -> ()
            %480 = func.call @stack_pop_pointer() : () -> i64
            %481 = func.call @cc_nil_value() : () -> i64
            %482 = func.call @cc_errorp(%480) : (i64) -> i64
            %483 = arith.cmpi ne, %482, %481 : i64
            %484 = arith.cmpi eq, %481, %481 : i64
            %485 = arith.andi %483, %484 : i1
            %486 = scf.if %485 -> (i64) {
              scf.yield %480 : i64
            } else {
              scf.yield %481 : i64
            }
            %487 = arith.cmpi ne, %486, %481 : i64
            scf.if %487 {
              func.call @stack_push_pointer(%486) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%480) : (i64) -> ()
              %488 = llvm.mlir.addressof @str40 : !llvm.ptr
              %489 = func.call @cc_make_function_ref_const(%488) : (!llvm.ptr) -> i64
              %490 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%489, %490) : (i64, i64) -> ()
            }
            %491 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %491 : i64
          }
          func.call @stack_push_pointer(%479) : (i64) -> ()
          %492 = func.call @stack_pop_pointer() : () -> i64
          %493 = func.call @cc_pop_ignore_errors_trap() : () -> i64
          %494 = func.call @cc_errorp(%492) : (i64) -> i64
          %495 = func.call @cc_nil_value() : () -> i64
          %496 = arith.cmpi ne, %494, %495 : i64
          scf.if %496 {
            %497 = func.call @cc_condition_value(%492) : (i64) -> i64
            %498 = func.call @cc_values2(%495, %497) : (i64, i64) -> i64
            func.call @stack_push_pointer(%498) : (i64) -> ()
          } else {
            %499 = func.call @cc_multiple_value_list(%492) : (i64) -> i64
            %500 = func.call @cc_values_pack(%499) : (i64) -> i64
            func.call @stack_push_pointer(%500) : (i64) -> ()
          }
          %501 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %501, %299#1 : i64, i64
        }
        func.call @stack_push_pointer(%473#0) : (i64) -> ()
        %502 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %502 : i64
      }
      %503 = func.call @cc_nil_value() : () -> i64
      %504 = func.call @cc_errorp(%287) : (i64) -> i64
      %505 = arith.cmpi ne, %504, %503 : i64
      %506 = scf.if %505 -> (i64) {
        scf.yield %287 : i64
      } else {
        %507 = func.call @cc_symbol_value(%281) : (i64) -> i64
        func.call @stack_push_pointer(%507) : (i64) -> ()
        %508 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %508 : i64
      }
      func.call @stack_push_pointer(%506) : (i64) -> ()
      %509 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %509 : i64
    }
    func.call @stack_push_pointer(%275) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299142"() {
    %905 = func.call @stack_pop_pointer() : () -> i64
    %906 = func.call @cc_nil_value() : () -> i64
    %907 = func.call @cc_nil_value() : () -> i64
    %908 = func.call @cc_errorp(%906) : (i64) -> i64
    %909 = arith.cmpi ne, %908, %907 : i64
    %910 = scf.if %909 -> (i64) {
      scf.yield %906 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %911 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %912 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %913 = func.call @stack_pop_pointer() : () -> i64
      %914 = func.call @cc_nil_value() : () -> i64
      %915 = func.call @cc_nil_value() : () -> i64
      %916 = func.call @cc_errorp(%914) : (i64) -> i64
      %917 = arith.cmpi ne, %916, %915 : i64
      %918 = scf.if %917 -> (i64) {
        scf.yield %914 : i64
      } else {
        %919 = func.call @cc_nil_value() : () -> i64
        %920 = llvm.mlir.addressof @str76 : !llvm.ptr
        %921 = arith.constant 38 : i64
        %922 = func.call @cc_make_string(%920, %921) : (!llvm.ptr, i64) -> i64
        %923 = func.call @cc_nil_value() : () -> i64
        %924 = func.call @cc_intern(%922, %923) : (i64, i64) -> i64
        %925 = func.call @cc_nil_value() : () -> i64
        %926 = func.call @cc_cons(%924, %925) : (i64, i64) -> i64
        %927 = func.call @cc_values_pack(%926) : (i64) -> i64
        %928 = func.call @cc_set_symbol_value(%924, %919) : (i64, i64) -> i64
        %929 = llvm.mlir.addressof @str77 : !llvm.ptr
        %930 = arith.constant 39 : i64
        %931 = func.call @cc_make_string(%929, %930) : (!llvm.ptr, i64) -> i64
        %932 = func.call @cc_nil_value() : () -> i64
        %933 = func.call @cc_intern(%931, %932) : (i64, i64) -> i64
        %934 = func.call @cc_nil_value() : () -> i64
        %935 = func.call @cc_cons(%933, %934) : (i64, i64) -> i64
        %936 = func.call @cc_values_pack(%935) : (i64) -> i64
        %937 = func.call @cc_set_symbol_value(%933, %919) : (i64, i64) -> i64
        %938 = llvm.mlir.addressof @str78 : !llvm.ptr
        %939 = arith.constant 40 : i64
        %940 = func.call @cc_make_string(%938, %939) : (!llvm.ptr, i64) -> i64
        %941 = func.call @cc_nil_value() : () -> i64
        %942 = func.call @cc_intern(%940, %941) : (i64, i64) -> i64
        %943 = func.call @cc_nil_value() : () -> i64
        %944 = func.call @cc_cons(%942, %943) : (i64, i64) -> i64
        %945 = func.call @cc_values_pack(%944) : (i64) -> i64
        %946 = func.call @cc_set_symbol_value(%942, %919) : (i64, i64) -> i64
        %947:3 = scf.while (%arg0 = %913, %arg1 = %912, %arg2 = %911) : (i64, i64, i64) -> (i64, i64, i64) {
          %948 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %949 = func.call @stack_pop_pointer() : () -> i64
          %950 = func.call @cc_nil_value() : () -> i64
          %951 = func.call @cc_cons(%949, %950) : (i64, i64) -> i64
          %952 = func.call @cc_not(%951) : (i64) -> i64
          func.call @stack_push_pointer(%952) : (i64) -> ()
          %953 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%arg1) : (i64) -> ()
          %954 = func.call @stack_pop_pointer() : () -> i64
          %955 = func.call @cc_nil_value() : () -> i64
          %956 = func.call @cc_cons(%954, %955) : (i64, i64) -> i64
          %957 = func.call @cc_not(%956) : (i64) -> i64
          func.call @stack_push_pointer(%957) : (i64) -> ()
          %958 = func.call @stack_pop_pointer() : () -> i64
          %959 = func.call @cc_cons(%958, %948) : (i64, i64) -> i64
          %960 = func.call @cc_cons(%953, %959) : (i64, i64) -> i64
          %961 = func.call @cc_and(%960) : (i64) -> i64
          func.call @stack_push_pointer(%961) : (i64) -> ()
          %962 = func.call @stack_pop_pointer() : () -> i64
          %963 = func.call @cc_nil_value() : () -> i64
          %964 = arith.cmpi ne, %962, %963 : i64
          %965 = func.call @cc_nil_value() : () -> i64
          %966 = llvm.mlir.addressof @str79 : !llvm.ptr
          %967 = arith.constant 38 : i64
          %968 = func.call @cc_make_string(%966, %967) : (!llvm.ptr, i64) -> i64
          %969 = func.call @cc_nil_value() : () -> i64
          %970 = func.call @cc_intern(%968, %969) : (i64, i64) -> i64
          %971 = func.call @cc_nil_value() : () -> i64
          %972 = func.call @cc_cons(%970, %971) : (i64, i64) -> i64
          %973 = func.call @cc_values_pack(%972) : (i64) -> i64
          %974 = func.call @cc_symbol_value(%970) : (i64) -> i64
          %975 = arith.cmpi ne, %974, %965 : i64
          %976 = llvm.mlir.addressof @str80 : !llvm.ptr
          %977 = arith.constant 38 : i64
          %978 = func.call @cc_make_string(%976, %977) : (!llvm.ptr, i64) -> i64
          %979 = func.call @cc_nil_value() : () -> i64
          %980 = func.call @cc_intern(%978, %979) : (i64, i64) -> i64
          %981 = func.call @cc_nil_value() : () -> i64
          %982 = func.call @cc_cons(%980, %981) : (i64, i64) -> i64
          %983 = func.call @cc_values_pack(%982) : (i64) -> i64
          %984 = func.call @cc_symbol_value(%980) : (i64) -> i64
          %985 = arith.cmpi ne, %984, %965 : i64
          %986 = arith.ori %975, %985 : i1
          %987 = arith.constant 0 : i1
          %988 = arith.cmpi eq, %986, %987 : i1
          %989 = arith.andi %964, %988 : i1
          scf.condition(%989) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%990: i64, %991: i64, %992: i64):
          %993 = func.call @cc_nil_value() : () -> i64
          %994 = func.call @cc_nil_value() : () -> i64
          %995 = func.call @cc_errorp(%993) : (i64) -> i64
          %996 = arith.cmpi ne, %995, %994 : i64
          %997 = scf.if %996 -> (i64) {
            scf.yield %993 : i64
          } else {
            %998 = func.call @cc_nil_value() : () -> i64
            %999 = arith.cmpi ne, %998, %998 : i64
            scf.if %999 {
              func.call @stack_push_pointer(%998) : (i64) -> ()
            } else {
              %1000 = llvm.mlir.addressof @str81 : !llvm.ptr
              %1001 = func.call @cc_make_function_ref_const(%1000) : (!llvm.ptr) -> i64
              %1002 = arith.constant 0 : i64
              func.call @cc_funcall_stack(%1001, %1002) : (i64, i64) -> ()
            }
            %1003 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1003 : i64
          }
          func.call @stack_push_pointer(%997) : (i64) -> ()
          %1004 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1004) : (i64) -> ()
          %1005 = func.call @stack_depth() : () -> i64
          %1006 = arith.constant 0 : i64
          %1007 = arith.cmpi sgt, %1005, %1006 : i64
          scf.if %1007 {
            %1008 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%1004) : (i64) -> ()
          %1009 = func.call @stack_pop_pointer() : () -> i64
          %1010 = func.call @cc_errorp(%1009) : (i64) -> i64
          func.call @stack_push_pointer(%1010) : (i64) -> ()
          %1011 = func.call @stack_pop_pointer() : () -> i64
          %1012 = func.call @cc_nil_value() : () -> i64
          %1013 = arith.cmpi ne, %1011, %1012 : i64
          %1014:3 = scf.if %1013 -> (i64, i64, i64) {
            %1015 = func.call @cc_nil_value() : () -> i64
            %1016 = func.call @cc_nil_value() : () -> i64
            %1017 = func.call @cc_errorp(%1015) : (i64) -> i64
            %1018 = arith.cmpi ne, %1017, %1016 : i64
            %1019:3 = scf.if %1018 -> (i64, i64, i64) {
              scf.yield %1015, %992, %991 : i64, i64, i64
            } else {
              func.call @stack_push_pointer(%1004) : (i64) -> ()
              %1020 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1020) : (i64) -> ()
              %1021 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1021, %992, %1020 : i64, i64, i64
            }
            %1022 = func.call @cc_nil_value() : () -> i64
            %1023 = func.call @cc_errorp(%1019#0) : (i64) -> i64
            %1024 = arith.cmpi ne, %1023, %1022 : i64
            %1025:3 = scf.if %1024 -> (i64, i64, i64) {
              scf.yield %1019#0, %1019#1, %1019#2 : i64, i64, i64
            } else {
              %1026 = func.call @cc_t_value() : () -> i64
              func.call @stack_push_pointer(%1026) : (i64) -> ()
              %1027 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1027) : (i64) -> ()
              %1028 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1028, %1027, %1019#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%1025#0) : (i64) -> ()
            %1029 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1029, %1025#2, %1025#1 : i64, i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %1030 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1030, %991, %992 : i64, i64, i64
          }
          func.call @stack_push_pointer(%1014#0) : (i64) -> ()
          %1031 = func.call @stack_depth() : () -> i64
          %1032 = arith.constant 0 : i64
          %1033 = arith.cmpi sgt, %1031, %1032 : i64
          scf.if %1033 {
            %1034 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %1004, %1014#1, %1014#2 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %1035 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%947#1) : (i64) -> ()
        %1036 = func.call @stack_pop_pointer() : () -> i64
        %1037 = func.call @cc_nil_value() : () -> i64
        %1038 = arith.cmpi ne, %1036, %1037 : i64
        scf.if %1038 {
          func.call @stack_push_pointer(%947#1) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
        }
        %1039 = func.call @stack_pop_pointer() : () -> i64
        %1040 = func.call @cc_multiple_value_list(%1039) : (i64) -> i64
        %1041 = llvm.mlir.addressof @str82 : !llvm.ptr
        %1042 = arith.constant 38 : i64
        %1043 = func.call @cc_make_string(%1041, %1042) : (!llvm.ptr, i64) -> i64
        %1044 = func.call @cc_nil_value() : () -> i64
        %1045 = func.call @cc_intern(%1043, %1044) : (i64, i64) -> i64
        %1046 = func.call @cc_nil_value() : () -> i64
        %1047 = func.call @cc_cons(%1045, %1046) : (i64, i64) -> i64
        %1048 = func.call @cc_values_pack(%1047) : (i64) -> i64
        %1049 = func.call @cc_symbol_value(%1045) : (i64) -> i64
        %1050 = llvm.mlir.addressof @str83 : !llvm.ptr
        %1051 = arith.constant 39 : i64
        %1052 = func.call @cc_make_string(%1050, %1051) : (!llvm.ptr, i64) -> i64
        %1053 = func.call @cc_nil_value() : () -> i64
        %1054 = func.call @cc_intern(%1052, %1053) : (i64, i64) -> i64
        %1055 = func.call @cc_nil_value() : () -> i64
        %1056 = func.call @cc_cons(%1054, %1055) : (i64, i64) -> i64
        %1057 = func.call @cc_values_pack(%1056) : (i64) -> i64
        %1058 = func.call @cc_symbol_value(%1054) : (i64) -> i64
        %1059 = llvm.mlir.addressof @str84 : !llvm.ptr
        %1060 = arith.constant 40 : i64
        %1061 = func.call @cc_make_string(%1059, %1060) : (!llvm.ptr, i64) -> i64
        %1062 = func.call @cc_nil_value() : () -> i64
        %1063 = func.call @cc_intern(%1061, %1062) : (i64, i64) -> i64
        %1064 = func.call @cc_nil_value() : () -> i64
        %1065 = func.call @cc_cons(%1063, %1064) : (i64, i64) -> i64
        %1066 = func.call @cc_values_pack(%1065) : (i64) -> i64
        %1067 = func.call @cc_symbol_value(%1063) : (i64) -> i64
        %1068 = func.call @cc_nil_value() : () -> i64
        %1069 = arith.cmpi ne, %1049, %1068 : i64
        %1070 = scf.if %1069 -> (i64) {
          scf.yield %1067 : i64
        } else {
          scf.yield %1040 : i64
        }
        %1071 = func.call @cc_values_pack(%1070) : (i64) -> i64
        func.call @stack_push_pointer(%1071) : (i64) -> ()
        %1072 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1072 : i64
      }
      func.call @stack_push_pointer(%918) : (i64) -> ()
      %1073 = func.call @stack_pop_pointer() : () -> i64
      %1074 = func.call @cc_errorp(%1073) : (i64) -> i64
      %1075 = func.call @cc_nil_value() : () -> i64
      %1076 = arith.cmpi ne, %1074, %1075 : i64
      %1077 = scf.if %1076 -> (i64) {
        %1078 = func.call @cc_condition_value(%1073) : (i64) -> i64
        %1079 = llvm.mlir.addressof @str85 : !llvm.ptr
        %1080 = arith.constant 22 : i64
        %1081 = func.call @cc_make_string(%1079, %1080) : (!llvm.ptr, i64) -> i64
        %1082 = llvm.mlir.addressof @str86 : !llvm.ptr
        %1083 = arith.constant 2 : i64
        %1084 = func.call @cc_make_string(%1082, %1083) : (!llvm.ptr, i64) -> i64
        %1085 = func.call @cc_intern(%1081, %1084) : (i64, i64) -> i64
        %1086 = func.call @cc_nil_value() : () -> i64
        %1087 = func.call @cc_cons(%1085, %1086) : (i64, i64) -> i64
        %1088 = func.call @cc_values_pack(%1087) : (i64) -> i64
        func.call @stack_push_pointer(%1085) : (i64) -> ()
        %1089 = func.call @stack_pop_pointer() : () -> i64
        %1090 = func.call @cc_typep(%1078, %1089) : (i64, i64) -> i64
        %1091 = func.call @cc_nil_value() : () -> i64
        %1092 = arith.cmpi ne, %1090, %1091 : i64
        %1093 = scf.if %1092 -> (i64) {
          %1094 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%1094) : (i64) -> ()
          %1095 = func.call @stack_pop_pointer() : () -> i64
          %1096 = func.call @cc_set_symbol_value(%905, %1095) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1095) : (i64) -> ()
          %1097 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1097 : i64
        } else {
          scf.yield %1073 : i64
        }
        scf.yield %1093 : i64
      } else {
        scf.yield %1073 : i64
      }
      func.call @stack_push_pointer(%1077) : (i64) -> ()
      %1098 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1098 : i64
    }
    func.call @stack_push_pointer(%910) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299141"() {
    %890 = func.call @cc_nil_value() : () -> i64
    %891 = func.call @cc_nil_value() : () -> i64
    %892 = func.call @cc_errorp(%890) : (i64) -> i64
    %893 = arith.cmpi ne, %892, %891 : i64
    %894 = scf.if %893 -> (i64) {
      scf.yield %890 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = llvm.mlir.addressof @str75 : !llvm.ptr
      %897 = arith.constant 21 : i64
      %898 = func.call @cc_make_string(%896, %897) : (!llvm.ptr, i64) -> i64
      %899 = func.call @cc_nil_value() : () -> i64
      %900 = func.call @cc_intern(%898, %899) : (i64, i64) -> i64
      %901 = func.call @cc_nil_value() : () -> i64
      %902 = func.call @cc_cons(%900, %901) : (i64, i64) -> i64
      %903 = func.call @cc_values_pack(%902) : (i64) -> i64
      func.call @stack_push_pointer(%900) : (i64) -> ()
      %904 = func.call @stack_pop_pointer() : () -> i64
      %1099 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1100 = arith.constant 33 : i64
      %1101 = func.call @cc_make_symbol(%1099, %1100) : (!llvm.ptr, i64) -> i64
      %1102 = func.call @cc_persistent_root_value(%1101) : (i64) -> i64
      %1103 = func.call @cc_set_symbol_value(%1102, %895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1102) : (i64) -> ()
      %1104 = arith.constant 4634242382299142 : i64
      %1105 = arith.constant 1 : i64
      %1106 = func.call @cc_make_closure(%1104, %1105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1106) : (i64) -> ()
      %1107 = func.call @stack_pop_pointer() : () -> i64
      %1108 = func.call @cc_nil_value() : () -> i64
      %1109 = func.call @cc_errorp(%904) : (i64) -> i64
      %1110 = arith.cmpi ne, %1109, %1108 : i64
      %1111 = arith.cmpi eq, %1108, %1108 : i64
      %1112 = arith.andi %1110, %1111 : i1
      %1113 = scf.if %1112 -> (i64) {
        scf.yield %904 : i64
      } else {
        scf.yield %1108 : i64
      }
      %1114 = func.call @cc_errorp(%1107) : (i64) -> i64
      %1115 = arith.cmpi ne, %1114, %1108 : i64
      %1116 = arith.cmpi eq, %1113, %1108 : i64
      %1117 = arith.andi %1115, %1116 : i1
      %1118 = scf.if %1117 -> (i64) {
        scf.yield %1107 : i64
      } else {
        scf.yield %1113 : i64
      }
      %1119 = arith.cmpi ne, %1118, %1108 : i64
      scf.if %1119 {
        func.call @stack_push_pointer(%1118) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%904) : (i64) -> ()
        func.call @stack_push_pointer(%1107) : (i64) -> ()
        %1120 = llvm.mlir.addressof @str88 : !llvm.ptr
        %1121 = func.call @cc_make_function_ref_const(%1120) : (!llvm.ptr) -> i64
        %1122 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%1121, %1122) : (i64, i64) -> ()
      }
      %1123 = func.call @stack_pop_pointer() : () -> i64
      %1124 = func.call @cc_nil_value() : () -> i64
      %1125 = func.call @cc_nil_value() : () -> i64
      %1126 = func.call @cc_errorp(%1124) : (i64) -> i64
      %1127 = arith.cmpi ne, %1126, %1125 : i64
      %1128 = scf.if %1127 -> (i64) {
        scf.yield %1124 : i64
      } else {
        func.call @stack_push_pointer(%1123) : (i64) -> ()
        %1129 = func.call @stack_pop_pointer() : () -> i64
        %1130 = func.call @cc_nil_value() : () -> i64
        %1131 = func.call @cc_errorp(%1129) : (i64) -> i64
        %1132 = arith.cmpi ne, %1131, %1130 : i64
        %1133 = arith.cmpi eq, %1130, %1130 : i64
        %1134 = arith.andi %1132, %1133 : i1
        %1135 = scf.if %1134 -> (i64) {
          scf.yield %1129 : i64
        } else {
          scf.yield %1130 : i64
        }
        %1136 = arith.cmpi ne, %1135, %1130 : i64
        scf.if %1136 {
          func.call @stack_push_pointer(%1135) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1129) : (i64) -> ()
          %1137 = llvm.mlir.addressof @str89 : !llvm.ptr
          %1138 = func.call @cc_make_function_ref_const(%1137) : (!llvm.ptr) -> i64
          %1139 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1138, %1139) : (i64, i64) -> ()
        }
        %1140 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1140 : i64
      }
      %1141 = func.call @cc_nil_value() : () -> i64
      %1142 = func.call @cc_errorp(%1128) : (i64) -> i64
      %1143 = arith.cmpi ne, %1142, %1141 : i64
      %1144 = scf.if %1143 -> (i64) {
        scf.yield %1128 : i64
      } else {
        %1145 = func.call @cc_push_ignore_errors_trap() : () -> i64
        func.call @cc_clear_multiple_values() : () -> ()
        %1146 = func.call @cc_nil_value() : () -> i64
        %1147 = func.call @cc_nil_value() : () -> i64
        %1148 = func.call @cc_errorp(%1146) : (i64) -> i64
        %1149 = arith.cmpi ne, %1148, %1147 : i64
        %1150 = scf.if %1149 -> (i64) {
          scf.yield %1146 : i64
        } else {
          func.call @stack_push_pointer(%1123) : (i64) -> ()
          %1151 = func.call @stack_pop_pointer() : () -> i64
          %1152 = func.call @cc_nil_value() : () -> i64
          %1153 = func.call @cc_errorp(%1151) : (i64) -> i64
          %1154 = arith.cmpi ne, %1153, %1152 : i64
          %1155 = arith.cmpi eq, %1152, %1152 : i64
          %1156 = arith.andi %1154, %1155 : i1
          %1157 = scf.if %1156 -> (i64) {
            scf.yield %1151 : i64
          } else {
            scf.yield %1152 : i64
          }
          %1158 = arith.cmpi ne, %1157, %1152 : i64
          scf.if %1158 {
            func.call @stack_push_pointer(%1157) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1151) : (i64) -> ()
            %1159 = llvm.mlir.addressof @str90 : !llvm.ptr
            %1160 = func.call @cc_make_function_ref_const(%1159) : (!llvm.ptr) -> i64
            %1161 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1160, %1161) : (i64, i64) -> ()
          }
          %1162 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1162 : i64
        }
        func.call @stack_push_pointer(%1150) : (i64) -> ()
        %1163 = func.call @stack_pop_pointer() : () -> i64
        %1164 = func.call @cc_pop_ignore_errors_trap() : () -> i64
        %1165 = func.call @cc_errorp(%1163) : (i64) -> i64
        %1166 = func.call @cc_nil_value() : () -> i64
        %1167 = arith.cmpi ne, %1165, %1166 : i64
        scf.if %1167 {
          %1168 = func.call @cc_condition_value(%1163) : (i64) -> i64
          %1169 = func.call @cc_values2(%1166, %1168) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1169) : (i64) -> ()
        } else {
          %1170 = func.call @cc_multiple_value_list(%1163) : (i64) -> i64
          %1171 = func.call @cc_values_pack(%1170) : (i64) -> i64
          func.call @stack_push_pointer(%1171) : (i64) -> ()
        }
        %1172 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1172 : i64
      }
      %1173 = func.call @cc_nil_value() : () -> i64
      %1174 = func.call @cc_errorp(%1144) : (i64) -> i64
      %1175 = arith.cmpi ne, %1174, %1173 : i64
      %1176 = scf.if %1175 -> (i64) {
        scf.yield %1144 : i64
      } else {
        %1177 = func.call @cc_symbol_value(%1102) : (i64) -> i64
        func.call @stack_push_pointer(%1177) : (i64) -> ()
        %1178 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1178 : i64
      }
      func.call @stack_push_pointer(%1176) : (i64) -> ()
      %1179 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1179 : i64
    }
    func.call @stack_push_pointer(%894) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299147"() {
    %1551 = func.call @stack_pop_pointer() : () -> i64
    %1552 = func.call @cc_nil_value() : () -> i64
    %1553 = func.call @cc_nil_value() : () -> i64
    %1554 = func.call @cc_errorp(%1552) : (i64) -> i64
    %1555 = arith.cmpi ne, %1554, %1553 : i64
    %1556 = scf.if %1555 -> (i64) {
      scf.yield %1552 : i64
    } else {
      %1558 = func.call @cc_symbol_value(%1551) : (i64) -> i64
      func.call @stack_push_pointer(%1558) : (i64) -> ()
      %1559 = func.call @stack_pop_pointer() : () -> i64
      %1560 = func.call @cc_nil_value() : () -> i64
      %1561 = func.call @cc_nil_value() : () -> i64
      %1562 = func.call @cc_errorp(%1560) : (i64) -> i64
      %1563 = arith.cmpi ne, %1562, %1561 : i64
      %1564 = scf.if %1563 -> (i64) {
        scf.yield %1560 : i64
      } else {
        %1565 = func.call @cc_nil_value() : () -> i64
        %1566 = func.call @cc_nil_value() : () -> i64
        %1567 = func.call @cc_errorp(%1565) : (i64) -> i64
        %1568 = arith.cmpi ne, %1567, %1566 : i64
        %1569 = scf.if %1568 -> (i64) {
          scf.yield %1565 : i64
        } else {
          func.call @stack_push_pointer(%1559) : (i64) -> ()
          %1570 = func.call @stack_pop_pointer() : () -> i64
          %1571 = func.call @cc_nil_value() : () -> i64
          %1572 = func.call @cc_errorp(%1570) : (i64) -> i64
          %1573 = arith.cmpi ne, %1572, %1571 : i64
          %1574 = arith.cmpi eq, %1571, %1571 : i64
          %1575 = arith.andi %1573, %1574 : i1
          %1576 = scf.if %1575 -> (i64) {
            scf.yield %1570 : i64
          } else {
            scf.yield %1571 : i64
          }
          %1577 = arith.cmpi ne, %1576, %1571 : i64
          scf.if %1577 {
            func.call @stack_push_pointer(%1576) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1570) : (i64) -> ()
            %1578 = llvm.mlir.addressof @str120 : !llvm.ptr
            %1579 = func.call @cc_make_function_ref_const(%1578) : (!llvm.ptr) -> i64
            %1580 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1579, %1580) : (i64, i64) -> ()
          }
          %1581 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1581 : i64
        }
        %1582 = func.call @cc_nil_value() : () -> i64
        %1583 = func.call @cc_errorp(%1569) : (i64) -> i64
        %1584 = arith.cmpi ne, %1583, %1582 : i64
        %1585 = scf.if %1584 -> (i64) {
          scf.yield %1569 : i64
        } else {
          %1586 = func.call @cc_nil_value() : () -> i64
          %1587 = arith.cmpi ne, %1586, %1586 : i64
          scf.if %1587 {
            func.call @stack_push_pointer(%1586) : (i64) -> ()
          } else {
            %1588 = llvm.mlir.addressof @str121 : !llvm.ptr
            %1589 = func.call @cc_make_function_ref_const(%1588) : (!llvm.ptr) -> i64
            %1590 = arith.constant 0 : i64
            func.call @cc_funcall_stack(%1589, %1590) : (i64, i64) -> ()
          }
          %1591 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1591) : (i64) -> ()
          %1592 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1592 : i64
        }
        func.call @stack_push_pointer(%1585) : (i64) -> ()
        %1593 = func.call @stack_pop_pointer() : () -> i64
        %1594 = func.call @cc_multiple_value_list(%1593) : (i64) -> i64
        func.call @stack_push_pointer(%1559) : (i64) -> ()
        %1595 = func.call @stack_pop_pointer() : () -> i64
        %1596 = func.call @cc_nil_value() : () -> i64
        %1597 = func.call @cc_errorp(%1595) : (i64) -> i64
        %1598 = arith.cmpi ne, %1597, %1596 : i64
        %1599 = arith.cmpi eq, %1596, %1596 : i64
        %1600 = arith.andi %1598, %1599 : i1
        %1601 = scf.if %1600 -> (i64) {
          scf.yield %1595 : i64
        } else {
          scf.yield %1596 : i64
        }
        %1602 = arith.cmpi ne, %1601, %1596 : i64
        scf.if %1602 {
          func.call @stack_push_pointer(%1601) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1595) : (i64) -> ()
          %1603 = llvm.mlir.addressof @str122 : !llvm.ptr
          %1604 = func.call @cc_make_function_ref_const(%1603) : (!llvm.ptr) -> i64
          %1605 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1604, %1605) : (i64, i64) -> ()
        }
        %1606 = func.call @stack_depth() : () -> i64
        %1607 = arith.constant 0 : i64
        %1608 = arith.cmpi sgt, %1606, %1607 : i64
        scf.if %1608 {
          %1609 = func.call @stack_pop_pointer() : () -> i64
        }
        %1610 = func.call @cc_values_pack(%1594) : (i64) -> i64
        func.call @stack_push_pointer(%1610) : (i64) -> ()
        %1611 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1611 : i64
      }
      func.call @stack_push_pointer(%1564) : (i64) -> ()
      %1612 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1612 : i64
    }
    func.call @stack_push_pointer(%1556) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928653"() {
    %1644 = func.call @stack_pop_pointer() : () -> i64
    %1645 = func.call @cc_nil_value() : () -> i64
    %1646 = func.call @cc_nil_value() : () -> i64
    %1647 = func.call @cc_errorp(%1645) : (i64) -> i64
    %1648 = arith.cmpi ne, %1647, %1646 : i64
    %1649 = scf.if %1648 -> (i64) {
      scf.yield %1645 : i64
    } else {
      %1650 = func.call @cc_symbol_value(%1644) : (i64) -> i64
      func.call @stack_push_pointer(%1650) : (i64) -> ()
      %1651 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%1651) : (i64) -> ()
      %1652 = func.call @stack_pop_pointer() : () -> i64
      %1653 = func.call @stack_pop_pointer() : () -> i64
      %1654 = func.call @cc_set_car(%1653, %1652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1654) : (i64) -> ()
      %1655 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1655 : i64
    }
    func.call @stack_push_pointer(%1649) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_4634242382299145"() {
    %1474 = func.call @cc_nil_value() : () -> i64
    %1475 = func.call @cc_nil_value() : () -> i64
    %1476 = func.call @cc_errorp(%1474) : (i64) -> i64
    %1477 = arith.cmpi ne, %1476, %1475 : i64
    %1478 = scf.if %1477 -> (i64) {
      scf.yield %1474 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1479 = func.call @stack_pop_pointer() : () -> i64
      %1480 = func.call @cc_nil_value() : () -> i64
      %1481 = func.call @cc_errorp(%1479) : (i64) -> i64
      %1482 = arith.cmpi ne, %1481, %1480 : i64
      %1483 = arith.cmpi eq, %1480, %1480 : i64
      %1484 = arith.andi %1482, %1483 : i1
      %1485 = scf.if %1484 -> (i64) {
        scf.yield %1479 : i64
      } else {
        scf.yield %1480 : i64
      }
      %1486 = arith.cmpi ne, %1485, %1480 : i64
      scf.if %1486 {
        func.call @stack_push_pointer(%1485) : (i64) -> ()
      } else {
        %1487 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1487) : (i64) -> ()
        func.call @stack_push_pointer(%1479) : (i64) -> ()
        %1488 = func.call @stack_pop_pointer() : () -> i64
        %1489 = func.call @stack_pop_pointer() : () -> i64
        %1490 = func.call @cc_cons(%1488, %1489) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1490) : (i64) -> ()
      }
      %1491 = func.call @stack_pop_pointer() : () -> i64
      %1492 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1493 = arith.constant 33 : i64
      %1494 = func.call @cc_make_symbol(%1492, %1493) : (!llvm.ptr, i64) -> i64
      %1495 = func.call @cc_persistent_root_value(%1494) : (i64) -> i64
      %1496 = func.call @cc_set_symbol_value(%1495, %1491) : (i64, i64) -> i64
      %1497 = func.call @cc_nil_value() : () -> i64
      %1498 = func.call @cc_nil_value() : () -> i64
      %1499 = func.call @cc_errorp(%1497) : (i64) -> i64
      %1500 = arith.cmpi ne, %1499, %1498 : i64
      %1501 = scf.if %1500 -> (i64) {
        scf.yield %1497 : i64
      } else {
        %1502 = func.call @cc_nil_value() : () -> i64
        %1503 = arith.cmpi ne, %1502, %1502 : i64
        scf.if %1503 {
          func.call @stack_push_pointer(%1502) : (i64) -> ()
        } else {
          %1504 = llvm.mlir.addressof @str117 : !llvm.ptr
          %1505 = func.call @cc_make_function_ref_const(%1504) : (!llvm.ptr) -> i64
          %1506 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%1505, %1506) : (i64, i64) -> ()
        }
        %1507 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1508 = func.call @stack_pop_pointer() : () -> i64
        %1509 = func.call @cc_nil_value() : () -> i64
        %1510 = func.call @cc_nil_value() : () -> i64
        %1511 = func.call @cc_errorp(%1509) : (i64) -> i64
        %1512 = arith.cmpi ne, %1511, %1510 : i64
        %1513:2 = scf.if %1512 -> (i64, i64) {
          scf.yield %1509, %1508 : i64, i64
        } else {
          func.call @stack_push_pointer(%1507) : (i64) -> ()
          %1515 = func.call @stack_pop_pointer() : () -> i64
          %1516 = func.call @cc_nil_value() : () -> i64
          %1517 = func.call @cc_nil_value() : () -> i64
          %1518 = func.call @cc_errorp(%1516) : (i64) -> i64
          %1519 = arith.cmpi ne, %1518, %1517 : i64
          %1520:2 = scf.if %1519 -> (i64, i64) {
            scf.yield %1516, %1508 : i64, i64
          } else {
            %1521 = func.call @cc_nil_value() : () -> i64
            %1522 = func.call @cc_nil_value() : () -> i64
            %1523 = func.call @cc_errorp(%1521) : (i64) -> i64
            %1524 = arith.cmpi ne, %1523, %1522 : i64
            %1525:2 = scf.if %1524 -> (i64, i64) {
              scf.yield %1521, %1508 : i64, i64
            } else {
              func.call @stack_push_pointer(%1515) : (i64) -> ()
              %1526 = func.call @stack_pop_pointer() : () -> i64
              %1527 = func.call @cc_nil_value() : () -> i64
              %1528 = func.call @cc_errorp(%1526) : (i64) -> i64
              %1529 = arith.cmpi ne, %1528, %1527 : i64
              %1530 = arith.cmpi eq, %1527, %1527 : i64
              %1531 = arith.andi %1529, %1530 : i1
              %1532 = scf.if %1531 -> (i64) {
                scf.yield %1526 : i64
              } else {
                scf.yield %1527 : i64
              }
              %1533 = arith.cmpi ne, %1532, %1527 : i64
              scf.if %1533 {
                func.call @stack_push_pointer(%1532) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%1526) : (i64) -> ()
                %1534 = llvm.mlir.addressof @str118 : !llvm.ptr
                %1535 = func.call @cc_make_function_ref_const(%1534) : (!llvm.ptr) -> i64
                %1536 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%1535, %1536) : (i64, i64) -> ()
              }
              %1537 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1537, %1508 : i64, i64
            }
            %1538 = func.call @cc_nil_value() : () -> i64
            %1539 = func.call @cc_errorp(%1525#0) : (i64) -> i64
            %1540 = arith.cmpi ne, %1539, %1538 : i64
            %1541:2 = scf.if %1540 -> (i64, i64) {
              scf.yield %1525#0, %1525#1 : i64, i64
            } else {
              %1542 = llvm.mlir.addressof @str119 : !llvm.ptr
              %1543 = arith.constant 19 : i64
              %1544 = func.call @cc_make_string(%1542, %1543) : (!llvm.ptr, i64) -> i64
              %1545 = func.call @cc_nil_value() : () -> i64
              %1546 = func.call @cc_intern(%1544, %1545) : (i64, i64) -> i64
              %1547 = func.call @cc_nil_value() : () -> i64
              %1548 = func.call @cc_cons(%1546, %1547) : (i64, i64) -> i64
              %1549 = func.call @cc_values_pack(%1548) : (i64) -> i64
              func.call @stack_push_pointer(%1546) : (i64) -> ()
              %1550 = func.call @stack_pop_pointer() : () -> i64
              %1613 = llvm.mlir.addressof @str123 : !llvm.ptr
              %1614 = arith.constant 34 : i64
              %1615 = func.call @cc_make_symbol(%1613, %1614) : (!llvm.ptr, i64) -> i64
              %1616 = func.call @cc_persistent_root_value(%1615) : (i64) -> i64
              %1617 = func.call @cc_set_symbol_value(%1616, %1507) : (i64, i64) -> i64
              func.call @stack_push_pointer(%1616) : (i64) -> ()
              %1618 = arith.constant 4634242382299147 : i64
              %1619 = arith.constant 1 : i64
              %1620 = func.call @cc_make_closure(%1618, %1619) : (i64, i64) -> i64
              func.call @stack_push_pointer(%1620) : (i64) -> ()
              %1621 = func.call @stack_pop_pointer() : () -> i64
              %1622 = func.call @cc_nil_value() : () -> i64
              %1623 = func.call @cc_errorp(%1550) : (i64) -> i64
              %1624 = arith.cmpi ne, %1623, %1622 : i64
              %1625 = arith.cmpi eq, %1622, %1622 : i64
              %1626 = arith.andi %1624, %1625 : i1
              %1627 = scf.if %1626 -> (i64) {
                scf.yield %1550 : i64
              } else {
                scf.yield %1622 : i64
              }
              %1628 = func.call @cc_errorp(%1621) : (i64) -> i64
              %1629 = arith.cmpi ne, %1628, %1622 : i64
              %1630 = arith.cmpi eq, %1627, %1622 : i64
              %1631 = arith.andi %1629, %1630 : i1
              %1632 = scf.if %1631 -> (i64) {
                scf.yield %1621 : i64
              } else {
                scf.yield %1627 : i64
              }
              %1633 = arith.cmpi ne, %1632, %1622 : i64
              scf.if %1633 {
                func.call @stack_push_pointer(%1632) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%1550) : (i64) -> ()
                func.call @stack_push_pointer(%1621) : (i64) -> ()
                %1634 = llvm.mlir.addressof @str124 : !llvm.ptr
                %1635 = func.call @cc_make_function_ref_const(%1634) : (!llvm.ptr) -> i64
                %1636 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%1635, %1636) : (i64, i64) -> ()
              }
              %1637 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1637) : (i64) -> ()
              %1638 = func.call @stack_pop_pointer() : () -> i64
              %1639 = func.call @cc_nil_value() : () -> i64
              %1640 = func.call @cc_errorp(%1638) : (i64) -> i64
              %1641 = arith.cmpi ne, %1640, %1639 : i64
              %1642 = scf.if %1641 -> (i64) {
                scf.yield %1638 : i64
              } else {
                func.call @stack_push_pointer(%1637) : (i64) -> ()
                %1643 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%1495) : (i64) -> ()
                %1656 = arith.constant 130642754928653 : i64
                %1657 = arith.constant 1 : i64
                %1658 = func.call @cc_make_closure(%1656, %1657) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1658) : (i64) -> ()
                %1659 = func.call @stack_pop_pointer() : () -> i64
                %1660 = func.call @cc_nil_value() : () -> i64
                %1661 = func.call @cc_errorp(%1643) : (i64) -> i64
                %1662 = arith.cmpi ne, %1661, %1660 : i64
                %1663 = arith.cmpi eq, %1660, %1660 : i64
                %1664 = arith.andi %1662, %1663 : i1
                %1665 = scf.if %1664 -> (i64) {
                  scf.yield %1643 : i64
                } else {
                  scf.yield %1660 : i64
                }
                %1666 = func.call @cc_errorp(%1659) : (i64) -> i64
                %1667 = arith.cmpi ne, %1666, %1660 : i64
                %1668 = arith.cmpi eq, %1665, %1660 : i64
                %1669 = arith.andi %1667, %1668 : i1
                %1670 = scf.if %1669 -> (i64) {
                  scf.yield %1659 : i64
                } else {
                  scf.yield %1665 : i64
                }
                %1671 = arith.cmpi ne, %1670, %1660 : i64
                scf.if %1671 {
                  func.call @stack_push_pointer(%1670) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%1643) : (i64) -> ()
                  func.call @stack_push_pointer(%1659) : (i64) -> ()
                  %1672 = llvm.mlir.addressof @str125 : !llvm.ptr
                  %1673 = func.call @cc_make_function_ref_const(%1672) : (!llvm.ptr) -> i64
                  %1674 = arith.constant 2 : i64
                  func.call @cc_funcall_stack(%1673, %1674) : (i64, i64) -> ()
                }
                %1675 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %1675 : i64
              }
              func.call @stack_push_pointer(%1642) : (i64) -> ()
              %1676 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1676, %1637 : i64, i64
            }
            func.call @stack_push_pointer(%1541#0) : (i64) -> ()
            %1677 = func.call @stack_pop_pointer() : () -> i64
            %1678 = func.call @cc_multiple_value_list(%1677) : (i64) -> i64
            func.call @stack_push_pointer(%1515) : (i64) -> ()
            %1679 = func.call @stack_pop_pointer() : () -> i64
            %1680 = func.call @cc_nil_value() : () -> i64
            %1681 = func.call @cc_errorp(%1679) : (i64) -> i64
            %1682 = arith.cmpi ne, %1681, %1680 : i64
            %1683 = arith.cmpi eq, %1680, %1680 : i64
            %1684 = arith.andi %1682, %1683 : i1
            %1685 = scf.if %1684 -> (i64) {
              scf.yield %1679 : i64
            } else {
              scf.yield %1680 : i64
            }
            %1686 = arith.cmpi ne, %1685, %1680 : i64
            scf.if %1686 {
              func.call @stack_push_pointer(%1685) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1679) : (i64) -> ()
              %1687 = llvm.mlir.addressof @str126 : !llvm.ptr
              %1688 = func.call @cc_make_function_ref_const(%1687) : (!llvm.ptr) -> i64
              %1689 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1688, %1689) : (i64, i64) -> ()
            }
            %1690 = func.call @stack_depth() : () -> i64
            %1691 = arith.constant 0 : i64
            %1692 = arith.cmpi sgt, %1690, %1691 : i64
            scf.if %1692 {
              %1693 = func.call @stack_pop_pointer() : () -> i64
            }
            %1694 = func.call @cc_values_pack(%1678) : (i64) -> i64
            func.call @stack_push_pointer(%1694) : (i64) -> ()
            %1695 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1695, %1541#1 : i64, i64
          }
          func.call @stack_push_pointer(%1520#0) : (i64) -> ()
          %1696 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1696, %1520#1 : i64, i64
        }
        %1697 = func.call @cc_nil_value() : () -> i64
        %1698 = func.call @cc_errorp(%1513#0) : (i64) -> i64
        %1699 = arith.cmpi ne, %1698, %1697 : i64
        %1700:2 = scf.if %1699 -> (i64, i64) {
          scf.yield %1513#0, %1513#1 : i64, i64
        } else {
          %1701 = func.call @cc_push_ignore_errors_trap() : () -> i64
          func.call @cc_clear_multiple_values() : () -> ()
          %1702 = func.call @cc_nil_value() : () -> i64
          %1703 = func.call @cc_nil_value() : () -> i64
          %1704 = func.call @cc_errorp(%1702) : (i64) -> i64
          %1705 = arith.cmpi ne, %1704, %1703 : i64
          %1706 = scf.if %1705 -> (i64) {
            scf.yield %1702 : i64
          } else {
            func.call @stack_push_pointer(%1513#1) : (i64) -> ()
            %1707 = func.call @stack_pop_pointer() : () -> i64
            %1708 = func.call @cc_nil_value() : () -> i64
            %1709 = func.call @cc_errorp(%1707) : (i64) -> i64
            %1710 = arith.cmpi ne, %1709, %1708 : i64
            %1711 = arith.cmpi eq, %1708, %1708 : i64
            %1712 = arith.andi %1710, %1711 : i1
            %1713 = scf.if %1712 -> (i64) {
              scf.yield %1707 : i64
            } else {
              scf.yield %1708 : i64
            }
            %1714 = arith.cmpi ne, %1713, %1708 : i64
            scf.if %1714 {
              func.call @stack_push_pointer(%1713) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1707) : (i64) -> ()
              %1715 = llvm.mlir.addressof @str127 : !llvm.ptr
              %1716 = func.call @cc_make_function_ref_const(%1715) : (!llvm.ptr) -> i64
              %1717 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1716, %1717) : (i64, i64) -> ()
            }
            %1718 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1718 : i64
          }
          func.call @stack_push_pointer(%1706) : (i64) -> ()
          %1719 = func.call @stack_pop_pointer() : () -> i64
          %1720 = func.call @cc_pop_ignore_errors_trap() : () -> i64
          %1721 = func.call @cc_errorp(%1719) : (i64) -> i64
          %1722 = func.call @cc_nil_value() : () -> i64
          %1723 = arith.cmpi ne, %1721, %1722 : i64
          scf.if %1723 {
            %1724 = func.call @cc_condition_value(%1719) : (i64) -> i64
            %1725 = func.call @cc_values2(%1722, %1724) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1725) : (i64) -> ()
          } else {
            %1726 = func.call @cc_multiple_value_list(%1719) : (i64) -> i64
            %1727 = func.call @cc_values_pack(%1726) : (i64) -> i64
            func.call @stack_push_pointer(%1727) : (i64) -> ()
          }
          %1728 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1728, %1513#1 : i64, i64
        }
        func.call @stack_push_pointer(%1700#0) : (i64) -> ()
        %1729 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1729 : i64
      }
      %1730 = func.call @cc_nil_value() : () -> i64
      %1731 = func.call @cc_errorp(%1501) : (i64) -> i64
      %1732 = arith.cmpi ne, %1731, %1730 : i64
      %1733 = scf.if %1732 -> (i64) {
        scf.yield %1501 : i64
      } else {
        %1734 = func.call @cc_symbol_value(%1495) : (i64) -> i64
        func.call @stack_push_pointer(%1734) : (i64) -> ()
        %1735 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1735 : i64
      }
      func.call @stack_push_pointer(%1733) : (i64) -> ()
      %1736 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1736 : i64
    }
    func.call @stack_push_pointer(%1478) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928655"() {
    %2151 = func.call @cc_nil_value() : () -> i64
    %2152 = func.call @cc_nil_value() : () -> i64
    %2153 = func.call @cc_errorp(%2151) : (i64) -> i64
    %2154 = arith.cmpi ne, %2153, %2152 : i64
    %2155 = scf.if %2154 -> (i64) {
      scf.yield %2151 : i64
    } else {
      %2156 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2156) : (i64) -> ()
      %2157 = func.call @stack_pop_pointer() : () -> i64
      %2158 = func.call @cc_nil_value() : () -> i64
      %2159 = func.call @cc_errorp(%2157) : (i64) -> i64
      %2160 = arith.cmpi ne, %2159, %2158 : i64
      %2161 = arith.cmpi eq, %2158, %2158 : i64
      %2162 = arith.andi %2160, %2161 : i1
      %2163 = scf.if %2162 -> (i64) {
        scf.yield %2157 : i64
      } else {
        scf.yield %2158 : i64
      }
      %2164 = arith.cmpi ne, %2163, %2158 : i64
      scf.if %2164 {
        func.call @stack_push_pointer(%2163) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2157) : (i64) -> ()
        %2165 = llvm.mlir.addressof @str163 : !llvm.ptr
        %2166 = func.call @cc_make_function_ref_const(%2165) : (!llvm.ptr) -> i64
        %2167 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2166, %2167) : (i64, i64) -> ()
      }
      %2168 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2168 : i64
    }
    func.call @stack_push_pointer(%2155) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928657"() {
    %2200 = func.call @stack_pop_pointer() : () -> i64
    %2201 = func.call @cc_nil_value() : () -> i64
    %2202 = func.call @cc_nil_value() : () -> i64
    %2203 = func.call @cc_errorp(%2201) : (i64) -> i64
    %2204 = arith.cmpi ne, %2203, %2202 : i64
    %2205 = scf.if %2204 -> (i64) {
      scf.yield %2201 : i64
    } else {
      %2206 = func.call @cc_symbol_value(%2200) : (i64) -> i64
      func.call @stack_push_pointer(%2206) : (i64) -> ()
      %2207 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2207) : (i64) -> ()
      %2208 = func.call @stack_pop_pointer() : () -> i64
      %2209 = func.call @stack_pop_pointer() : () -> i64
      %2210 = func.call @cc_set_car(%2209, %2208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2210) : (i64) -> ()
      %2211 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2211 : i64
    }
    func.call @stack_push_pointer(%2205) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928654"() {
    %2124 = func.call @cc_nil_value() : () -> i64
    %2125 = func.call @cc_nil_value() : () -> i64
    %2126 = func.call @cc_errorp(%2124) : (i64) -> i64
    %2127 = arith.cmpi ne, %2126, %2125 : i64
    %2128 = scf.if %2127 -> (i64) {
      scf.yield %2124 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2129 = func.call @stack_pop_pointer() : () -> i64
      %2130 = func.call @cc_nil_value() : () -> i64
      %2131 = func.call @cc_errorp(%2129) : (i64) -> i64
      %2132 = arith.cmpi ne, %2131, %2130 : i64
      %2133 = arith.cmpi eq, %2130, %2130 : i64
      %2134 = arith.andi %2132, %2133 : i1
      %2135 = scf.if %2134 -> (i64) {
        scf.yield %2129 : i64
      } else {
        scf.yield %2130 : i64
      }
      %2136 = arith.cmpi ne, %2135, %2130 : i64
      scf.if %2136 {
        func.call @stack_push_pointer(%2135) : (i64) -> ()
      } else {
        %2137 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2137) : (i64) -> ()
        func.call @stack_push_pointer(%2129) : (i64) -> ()
        %2138 = func.call @stack_pop_pointer() : () -> i64
        %2139 = func.call @stack_pop_pointer() : () -> i64
        %2140 = func.call @cc_cons(%2138, %2139) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2140) : (i64) -> ()
      }
      %2141 = func.call @stack_pop_pointer() : () -> i64
      %2142 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2143 = arith.constant 24 : i64
      %2144 = func.call @cc_make_string(%2142, %2143) : (!llvm.ptr, i64) -> i64
      %2145 = func.call @cc_nil_value() : () -> i64
      %2146 = func.call @cc_intern(%2144, %2145) : (i64, i64) -> i64
      %2147 = func.call @cc_nil_value() : () -> i64
      %2148 = func.call @cc_cons(%2146, %2147) : (i64, i64) -> i64
      %2149 = func.call @cc_values_pack(%2148) : (i64) -> i64
      func.call @stack_push_pointer(%2146) : (i64) -> ()
      %2150 = func.call @stack_pop_pointer() : () -> i64
      %2169 = arith.constant 130642754928655 : i64
      %2170 = arith.constant 0 : i64
      %2171 = func.call @cc_make_closure(%2169, %2170) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2171) : (i64) -> ()
      %2172 = func.call @stack_pop_pointer() : () -> i64
      %2173 = func.call @cc_nil_value() : () -> i64
      %2174 = func.call @cc_errorp(%2150) : (i64) -> i64
      %2175 = arith.cmpi ne, %2174, %2173 : i64
      %2176 = arith.cmpi eq, %2173, %2173 : i64
      %2177 = arith.andi %2175, %2176 : i1
      %2178 = scf.if %2177 -> (i64) {
        scf.yield %2150 : i64
      } else {
        scf.yield %2173 : i64
      }
      %2179 = func.call @cc_errorp(%2172) : (i64) -> i64
      %2180 = arith.cmpi ne, %2179, %2173 : i64
      %2181 = arith.cmpi eq, %2178, %2173 : i64
      %2182 = arith.andi %2180, %2181 : i1
      %2183 = scf.if %2182 -> (i64) {
        scf.yield %2172 : i64
      } else {
        scf.yield %2178 : i64
      }
      %2184 = arith.cmpi ne, %2183, %2173 : i64
      scf.if %2184 {
        func.call @stack_push_pointer(%2183) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2150) : (i64) -> ()
        func.call @stack_push_pointer(%2172) : (i64) -> ()
        %2185 = llvm.mlir.addressof @str164 : !llvm.ptr
        %2186 = func.call @cc_make_function_ref_const(%2185) : (!llvm.ptr) -> i64
        %2187 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%2186, %2187) : (i64, i64) -> ()
      }
      %2188 = func.call @stack_pop_pointer() : () -> i64
      %2189 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2190 = arith.constant 33 : i64
      %2191 = func.call @cc_make_symbol(%2189, %2190) : (!llvm.ptr, i64) -> i64
      %2192 = func.call @cc_persistent_root_value(%2191) : (i64) -> i64
      %2193 = func.call @cc_set_symbol_value(%2192, %2141) : (i64, i64) -> i64
      %2194 = func.call @cc_nil_value() : () -> i64
      %2195 = func.call @cc_nil_value() : () -> i64
      %2196 = func.call @cc_errorp(%2194) : (i64) -> i64
      %2197 = arith.cmpi ne, %2196, %2195 : i64
      %2198 = scf.if %2197 -> (i64) {
        scf.yield %2194 : i64
      } else {
        func.call @stack_push_pointer(%2188) : (i64) -> ()
        %2199 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2192) : (i64) -> ()
        %2212 = arith.constant 130642754928657 : i64
        %2213 = arith.constant 1 : i64
        %2214 = func.call @cc_make_closure(%2212, %2213) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2214) : (i64) -> ()
        %2215 = func.call @stack_pop_pointer() : () -> i64
        %2216 = func.call @cc_nil_value() : () -> i64
        %2217 = func.call @cc_errorp(%2199) : (i64) -> i64
        %2218 = arith.cmpi ne, %2217, %2216 : i64
        %2219 = arith.cmpi eq, %2216, %2216 : i64
        %2220 = arith.andi %2218, %2219 : i1
        %2221 = scf.if %2220 -> (i64) {
          scf.yield %2199 : i64
        } else {
          scf.yield %2216 : i64
        }
        %2222 = func.call @cc_errorp(%2215) : (i64) -> i64
        %2223 = arith.cmpi ne, %2222, %2216 : i64
        %2224 = arith.cmpi eq, %2221, %2216 : i64
        %2225 = arith.andi %2223, %2224 : i1
        %2226 = scf.if %2225 -> (i64) {
          scf.yield %2215 : i64
        } else {
          scf.yield %2221 : i64
        }
        %2227 = arith.cmpi ne, %2226, %2216 : i64
        scf.if %2227 {
          func.call @stack_push_pointer(%2226) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2199) : (i64) -> ()
          func.call @stack_push_pointer(%2215) : (i64) -> ()
          %2228 = llvm.mlir.addressof @str166 : !llvm.ptr
          %2229 = func.call @cc_make_function_ref_const(%2228) : (!llvm.ptr) -> i64
          %2230 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%2229, %2230) : (i64, i64) -> ()
        }
        %2231 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2231 : i64
      }
      %2232 = func.call @cc_nil_value() : () -> i64
      %2233 = func.call @cc_errorp(%2198) : (i64) -> i64
      %2234 = arith.cmpi ne, %2233, %2232 : i64
      %2235 = scf.if %2234 -> (i64) {
        scf.yield %2198 : i64
      } else {
        func.call @stack_push_pointer(%2188) : (i64) -> ()
        %2236 = func.call @stack_pop_pointer() : () -> i64
        %2237 = func.call @cc_nil_value() : () -> i64
        %2238 = func.call @cc_errorp(%2236) : (i64) -> i64
        %2239 = arith.cmpi ne, %2238, %2237 : i64
        %2240 = arith.cmpi eq, %2237, %2237 : i64
        %2241 = arith.andi %2239, %2240 : i1
        %2242 = scf.if %2241 -> (i64) {
          scf.yield %2236 : i64
        } else {
          scf.yield %2237 : i64
        }
        %2243 = arith.cmpi ne, %2242, %2237 : i64
        scf.if %2243 {
          func.call @stack_push_pointer(%2242) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2236) : (i64) -> ()
          %2244 = llvm.mlir.addressof @str167 : !llvm.ptr
          %2245 = func.call @cc_make_function_ref_const(%2244) : (!llvm.ptr) -> i64
          %2246 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2245, %2246) : (i64, i64) -> ()
        }
        %2247 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2247 : i64
      }
      %2248 = func.call @cc_nil_value() : () -> i64
      %2249 = func.call @cc_errorp(%2235) : (i64) -> i64
      %2250 = arith.cmpi ne, %2249, %2248 : i64
      %2251 = scf.if %2250 -> (i64) {
        scf.yield %2235 : i64
      } else {
        %2252 = func.call @cc_symbol_value(%2192) : (i64) -> i64
        func.call @stack_push_pointer(%2252) : (i64) -> ()
        %2253 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2253 : i64
      }
      func.call @stack_push_pointer(%2251) : (i64) -> ()
      %2254 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2254 : i64
    }
    func.call @stack_push_pointer(%2128) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928661"() {
    %2820 = func.call @stack_pop_pointer() : () -> i64
    %2821 = func.call @stack_pop_pointer() : () -> i64
    %2822 = func.call @cc_nil_value() : () -> i64
    %2823 = func.call @cc_nil_value() : () -> i64
    %2824 = func.call @cc_errorp(%2822) : (i64) -> i64
    %2825 = arith.cmpi ne, %2824, %2823 : i64
    %2826 = scf.if %2825 -> (i64) {
      scf.yield %2822 : i64
    } else {
      %2828 = func.call @cc_symbol_value(%2820) : (i64) -> i64
      func.call @stack_push_pointer(%2828) : (i64) -> ()
      %2829 = func.call @stack_pop_pointer() : () -> i64
      %2830 = func.call @cc_nil_value() : () -> i64
      %2831 = func.call @cc_nil_value() : () -> i64
      %2832 = func.call @cc_errorp(%2830) : (i64) -> i64
      %2833 = arith.cmpi ne, %2832, %2831 : i64
      %2834 = scf.if %2833 -> (i64) {
        scf.yield %2830 : i64
      } else {
        %2835 = func.call @cc_nil_value() : () -> i64
        %2836 = func.call @cc_nil_value() : () -> i64
        %2837 = func.call @cc_errorp(%2835) : (i64) -> i64
        %2838 = arith.cmpi ne, %2837, %2836 : i64
        %2839 = scf.if %2838 -> (i64) {
          scf.yield %2835 : i64
        } else {
          func.call @stack_push_pointer(%2829) : (i64) -> ()
          %2840 = func.call @stack_pop_pointer() : () -> i64
          %2841 = func.call @cc_nil_value() : () -> i64
          %2842 = func.call @cc_errorp(%2840) : (i64) -> i64
          %2843 = arith.cmpi ne, %2842, %2841 : i64
          %2844 = arith.cmpi eq, %2841, %2841 : i64
          %2845 = arith.andi %2843, %2844 : i1
          %2846 = scf.if %2845 -> (i64) {
            scf.yield %2840 : i64
          } else {
            scf.yield %2841 : i64
          }
          %2847 = arith.cmpi ne, %2846, %2841 : i64
          scf.if %2847 {
            func.call @stack_push_pointer(%2846) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2840) : (i64) -> ()
            %2848 = llvm.mlir.addressof @str218 : !llvm.ptr
            %2849 = func.call @cc_make_function_ref_const(%2848) : (!llvm.ptr) -> i64
            %2850 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2849, %2850) : (i64, i64) -> ()
          }
          %2851 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2851 : i64
        }
        %2852 = func.call @cc_nil_value() : () -> i64
        %2853 = func.call @cc_errorp(%2839) : (i64) -> i64
        %2854 = arith.cmpi ne, %2853, %2852 : i64
        %2855 = scf.if %2854 -> (i64) {
          scf.yield %2839 : i64
        } else {
          %2856 = func.call @cc_symbol_value(%2821) : (i64) -> i64
          func.call @stack_push_pointer(%2856) : (i64) -> ()
          func.call @stack_push_nil() : () -> ()
          %2857 = func.call @stack_pop_pointer() : () -> i64
          %2858 = func.call @stack_pop_pointer() : () -> i64
          %2859 = func.call @cc_set_car(%2858, %2857) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2859) : (i64) -> ()
          %2860 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2860) : (i64) -> ()
          %2861 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2861 : i64
        }
        func.call @stack_push_pointer(%2855) : (i64) -> ()
        %2862 = func.call @stack_pop_pointer() : () -> i64
        %2863 = func.call @cc_multiple_value_list(%2862) : (i64) -> i64
        func.call @stack_push_pointer(%2829) : (i64) -> ()
        %2864 = func.call @stack_pop_pointer() : () -> i64
        %2865 = func.call @cc_nil_value() : () -> i64
        %2866 = func.call @cc_errorp(%2864) : (i64) -> i64
        %2867 = arith.cmpi ne, %2866, %2865 : i64
        %2868 = arith.cmpi eq, %2865, %2865 : i64
        %2869 = arith.andi %2867, %2868 : i1
        %2870 = scf.if %2869 -> (i64) {
          scf.yield %2864 : i64
        } else {
          scf.yield %2865 : i64
        }
        %2871 = arith.cmpi ne, %2870, %2865 : i64
        scf.if %2871 {
          func.call @stack_push_pointer(%2870) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2864) : (i64) -> ()
          %2872 = llvm.mlir.addressof @str219 : !llvm.ptr
          %2873 = func.call @cc_make_function_ref_const(%2872) : (!llvm.ptr) -> i64
          %2874 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2873, %2874) : (i64, i64) -> ()
        }
        %2875 = func.call @stack_depth() : () -> i64
        %2876 = arith.constant 0 : i64
        %2877 = arith.cmpi sgt, %2875, %2876 : i64
        scf.if %2877 {
          %2878 = func.call @stack_pop_pointer() : () -> i64
        }
        %2879 = func.call @cc_values_pack(%2863) : (i64) -> i64
        func.call @stack_push_pointer(%2879) : (i64) -> ()
        %2880 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2880 : i64
      }
      func.call @stack_push_pointer(%2834) : (i64) -> ()
      %2881 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2881 : i64
    }
    func.call @stack_push_pointer(%2826) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928658"() {
    %2741 = func.call @cc_nil_value() : () -> i64
    %2742 = func.call @cc_nil_value() : () -> i64
    %2743 = func.call @cc_errorp(%2741) : (i64) -> i64
    %2744 = arith.cmpi ne, %2743, %2742 : i64
    %2745 = scf.if %2744 -> (i64) {
      scf.yield %2741 : i64
    } else {
      %2746 = func.call @cc_nil_value() : () -> i64
      %2747 = arith.cmpi ne, %2746, %2746 : i64
      scf.if %2747 {
        func.call @stack_push_pointer(%2746) : (i64) -> ()
      } else {
        %2748 = llvm.mlir.addressof @str213 : !llvm.ptr
        %2749 = func.call @cc_make_function_ref_const(%2748) : (!llvm.ptr) -> i64
        %2750 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%2749, %2750) : (i64, i64) -> ()
      }
      %2751 = func.call @stack_pop_pointer() : () -> i64
      %2752 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%2752) : (i64) -> ()
      %2753 = func.call @stack_pop_pointer() : () -> i64
      %2754 = func.call @cc_nil_value() : () -> i64
      %2755 = func.call @cc_errorp(%2753) : (i64) -> i64
      %2756 = arith.cmpi ne, %2755, %2754 : i64
      %2757 = arith.cmpi eq, %2754, %2754 : i64
      %2758 = arith.andi %2756, %2757 : i1
      %2759 = scf.if %2758 -> (i64) {
        scf.yield %2753 : i64
      } else {
        scf.yield %2754 : i64
      }
      %2760 = arith.cmpi ne, %2759, %2754 : i64
      scf.if %2760 {
        func.call @stack_push_pointer(%2759) : (i64) -> ()
      } else {
        %2761 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%2761) : (i64) -> ()
        func.call @stack_push_pointer(%2753) : (i64) -> ()
        %2762 = func.call @stack_pop_pointer() : () -> i64
        %2763 = func.call @stack_pop_pointer() : () -> i64
        %2764 = func.call @cc_cons(%2762, %2763) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2764) : (i64) -> ()
      }
      %2765 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2766 = func.call @stack_pop_pointer() : () -> i64
      %2767 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2768 = arith.constant 33 : i64
      %2769 = func.call @cc_make_symbol(%2767, %2768) : (!llvm.ptr, i64) -> i64
      %2770 = func.call @cc_persistent_root_value(%2769) : (i64) -> i64
      %2771 = func.call @cc_set_symbol_value(%2770, %2765) : (i64, i64) -> i64
      %2772 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2773 = arith.constant 33 : i64
      %2774 = func.call @cc_make_symbol(%2772, %2773) : (!llvm.ptr, i64) -> i64
      %2775 = func.call @cc_persistent_root_value(%2774) : (i64) -> i64
      %2776 = func.call @cc_set_symbol_value(%2775, %2751) : (i64, i64) -> i64
      %2777 = func.call @cc_nil_value() : () -> i64
      %2778 = func.call @cc_nil_value() : () -> i64
      %2779 = func.call @cc_errorp(%2777) : (i64) -> i64
      %2780 = arith.cmpi ne, %2779, %2778 : i64
      %2781:2 = scf.if %2780 -> (i64, i64) {
        scf.yield %2777, %2766 : i64, i64
      } else {
        %2783 = func.call @cc_symbol_value(%2775) : (i64) -> i64
        func.call @stack_push_pointer(%2783) : (i64) -> ()
        %2784 = func.call @stack_pop_pointer() : () -> i64
        %2785 = func.call @cc_nil_value() : () -> i64
        %2786 = func.call @cc_nil_value() : () -> i64
        %2787 = func.call @cc_errorp(%2785) : (i64) -> i64
        %2788 = arith.cmpi ne, %2787, %2786 : i64
        %2789:2 = scf.if %2788 -> (i64, i64) {
          scf.yield %2785, %2766 : i64, i64
        } else {
          %2790 = func.call @cc_nil_value() : () -> i64
          %2791 = func.call @cc_nil_value() : () -> i64
          %2792 = func.call @cc_errorp(%2790) : (i64) -> i64
          %2793 = arith.cmpi ne, %2792, %2791 : i64
          %2794:2 = scf.if %2793 -> (i64, i64) {
            scf.yield %2790, %2766 : i64, i64
          } else {
            func.call @stack_push_pointer(%2784) : (i64) -> ()
            %2795 = func.call @stack_pop_pointer() : () -> i64
            %2796 = func.call @cc_nil_value() : () -> i64
            %2797 = func.call @cc_errorp(%2795) : (i64) -> i64
            %2798 = arith.cmpi ne, %2797, %2796 : i64
            %2799 = arith.cmpi eq, %2796, %2796 : i64
            %2800 = arith.andi %2798, %2799 : i1
            %2801 = scf.if %2800 -> (i64) {
              scf.yield %2795 : i64
            } else {
              scf.yield %2796 : i64
            }
            %2802 = arith.cmpi ne, %2801, %2796 : i64
            scf.if %2802 {
              func.call @stack_push_pointer(%2801) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2795) : (i64) -> ()
              %2803 = llvm.mlir.addressof @str216 : !llvm.ptr
              %2804 = func.call @cc_make_function_ref_const(%2803) : (!llvm.ptr) -> i64
              %2805 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2804, %2805) : (i64, i64) -> ()
            }
            %2806 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2806, %2766 : i64, i64
          }
          %2807 = func.call @cc_nil_value() : () -> i64
          %2808 = func.call @cc_errorp(%2794#0) : (i64) -> i64
          %2809 = arith.cmpi ne, %2808, %2807 : i64
          %2810:2 = scf.if %2809 -> (i64, i64) {
            scf.yield %2794#0, %2794#1 : i64, i64
          } else {
            %2811 = llvm.mlir.addressof @str217 : !llvm.ptr
            %2812 = arith.constant 23 : i64
            %2813 = func.call @cc_make_string(%2811, %2812) : (!llvm.ptr, i64) -> i64
            %2814 = func.call @cc_nil_value() : () -> i64
            %2815 = func.call @cc_intern(%2813, %2814) : (i64, i64) -> i64
            %2816 = func.call @cc_nil_value() : () -> i64
            %2817 = func.call @cc_cons(%2815, %2816) : (i64, i64) -> i64
            %2818 = func.call @cc_values_pack(%2817) : (i64) -> i64
            func.call @stack_push_pointer(%2815) : (i64) -> ()
            %2819 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2770) : (i64) -> ()
            func.call @stack_push_pointer(%2775) : (i64) -> ()
            %2882 = arith.constant 130642754928661 : i64
            %2883 = arith.constant 2 : i64
            %2884 = func.call @cc_make_closure(%2882, %2883) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2884) : (i64) -> ()
            %2885 = func.call @stack_pop_pointer() : () -> i64
            %2886 = func.call @cc_nil_value() : () -> i64
            %2887 = func.call @cc_errorp(%2819) : (i64) -> i64
            %2888 = arith.cmpi ne, %2887, %2886 : i64
            %2889 = arith.cmpi eq, %2886, %2886 : i64
            %2890 = arith.andi %2888, %2889 : i1
            %2891 = scf.if %2890 -> (i64) {
              scf.yield %2819 : i64
            } else {
              scf.yield %2886 : i64
            }
            %2892 = func.call @cc_errorp(%2885) : (i64) -> i64
            %2893 = arith.cmpi ne, %2892, %2886 : i64
            %2894 = arith.cmpi eq, %2891, %2886 : i64
            %2895 = arith.andi %2893, %2894 : i1
            %2896 = scf.if %2895 -> (i64) {
              scf.yield %2885 : i64
            } else {
              scf.yield %2891 : i64
            }
            %2897 = arith.cmpi ne, %2896, %2886 : i64
            scf.if %2897 {
              func.call @stack_push_pointer(%2896) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2819) : (i64) -> ()
              func.call @stack_push_pointer(%2885) : (i64) -> ()
              %2898 = llvm.mlir.addressof @str220 : !llvm.ptr
              %2899 = func.call @cc_make_function_ref_const(%2898) : (!llvm.ptr) -> i64
              %2900 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%2899, %2900) : (i64, i64) -> ()
            }
            %2901 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2901) : (i64) -> ()
            %2902 = func.call @stack_pop_pointer() : () -> i64
            %2903 = func.call @cc_nil_value() : () -> i64
            %2904 = func.call @cc_errorp(%2902) : (i64) -> i64
            %2905 = arith.cmpi ne, %2904, %2903 : i64
            %2906 = scf.if %2905 -> (i64) {
              scf.yield %2902 : i64
            } else {
              func.call @stack_push_pointer(%2901) : (i64) -> ()
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
                %2915 = llvm.mlir.addressof @str221 : !llvm.ptr
                %2916 = func.call @cc_make_function_ref_const(%2915) : (!llvm.ptr) -> i64
                %2917 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%2916, %2917) : (i64, i64) -> ()
              }
              %2918 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2918 : i64
            }
            func.call @stack_push_pointer(%2906) : (i64) -> ()
            %2919 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2919, %2901 : i64, i64
          }
          func.call @stack_push_pointer(%2810#0) : (i64) -> ()
          %2920 = func.call @stack_pop_pointer() : () -> i64
          %2921 = func.call @cc_multiple_value_list(%2920) : (i64) -> i64
          func.call @stack_push_pointer(%2784) : (i64) -> ()
          %2922 = func.call @stack_pop_pointer() : () -> i64
          %2923 = func.call @cc_nil_value() : () -> i64
          %2924 = func.call @cc_errorp(%2922) : (i64) -> i64
          %2925 = arith.cmpi ne, %2924, %2923 : i64
          %2926 = arith.cmpi eq, %2923, %2923 : i64
          %2927 = arith.andi %2925, %2926 : i1
          %2928 = scf.if %2927 -> (i64) {
            scf.yield %2922 : i64
          } else {
            scf.yield %2923 : i64
          }
          %2929 = arith.cmpi ne, %2928, %2923 : i64
          scf.if %2929 {
            func.call @stack_push_pointer(%2928) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2922) : (i64) -> ()
            %2930 = llvm.mlir.addressof @str222 : !llvm.ptr
            %2931 = func.call @cc_make_function_ref_const(%2930) : (!llvm.ptr) -> i64
            %2932 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2931, %2932) : (i64, i64) -> ()
          }
          %2933 = func.call @stack_depth() : () -> i64
          %2934 = arith.constant 0 : i64
          %2935 = arith.cmpi sgt, %2933, %2934 : i64
          scf.if %2935 {
            %2936 = func.call @stack_pop_pointer() : () -> i64
          }
          %2937 = func.call @cc_values_pack(%2921) : (i64) -> i64
          func.call @stack_push_pointer(%2937) : (i64) -> ()
          %2938 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2938, %2810#1 : i64, i64
        }
        func.call @stack_push_pointer(%2789#0) : (i64) -> ()
        %2939 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2939, %2789#1 : i64, i64
      }
      %2940 = func.call @cc_nil_value() : () -> i64
      %2941 = func.call @cc_errorp(%2781#0) : (i64) -> i64
      %2942 = arith.cmpi ne, %2941, %2940 : i64
      %2943:2 = scf.if %2942 -> (i64, i64) {
        scf.yield %2781#0, %2781#1 : i64, i64
      } else {
        %2944 = func.call @cc_push_ignore_errors_trap() : () -> i64
        func.call @cc_clear_multiple_values() : () -> ()
        %2945 = func.call @cc_nil_value() : () -> i64
        %2946 = func.call @cc_nil_value() : () -> i64
        %2947 = func.call @cc_errorp(%2945) : (i64) -> i64
        %2948 = arith.cmpi ne, %2947, %2946 : i64
        %2949 = scf.if %2948 -> (i64) {
          scf.yield %2945 : i64
        } else {
          func.call @stack_push_pointer(%2781#1) : (i64) -> ()
          %2950 = func.call @stack_pop_pointer() : () -> i64
          %2951 = func.call @cc_nil_value() : () -> i64
          %2952 = func.call @cc_errorp(%2950) : (i64) -> i64
          %2953 = arith.cmpi ne, %2952, %2951 : i64
          %2954 = arith.cmpi eq, %2951, %2951 : i64
          %2955 = arith.andi %2953, %2954 : i1
          %2956 = scf.if %2955 -> (i64) {
            scf.yield %2950 : i64
          } else {
            scf.yield %2951 : i64
          }
          %2957 = arith.cmpi ne, %2956, %2951 : i64
          scf.if %2957 {
            func.call @stack_push_pointer(%2956) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2950) : (i64) -> ()
            %2958 = llvm.mlir.addressof @str223 : !llvm.ptr
            %2959 = func.call @cc_make_function_ref_const(%2958) : (!llvm.ptr) -> i64
            %2960 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2959, %2960) : (i64, i64) -> ()
          }
          %2961 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2961 : i64
        }
        func.call @stack_push_pointer(%2949) : (i64) -> ()
        %2962 = func.call @stack_pop_pointer() : () -> i64
        %2963 = func.call @cc_pop_ignore_errors_trap() : () -> i64
        %2964 = func.call @cc_errorp(%2962) : (i64) -> i64
        %2965 = func.call @cc_nil_value() : () -> i64
        %2966 = arith.cmpi ne, %2964, %2965 : i64
        scf.if %2966 {
          %2967 = func.call @cc_condition_value(%2962) : (i64) -> i64
          %2968 = func.call @cc_values2(%2965, %2967) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2968) : (i64) -> ()
        } else {
          %2969 = func.call @cc_multiple_value_list(%2962) : (i64) -> i64
          %2970 = func.call @cc_values_pack(%2969) : (i64) -> i64
          func.call @stack_push_pointer(%2970) : (i64) -> ()
        }
        %2971 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2971, %2781#1 : i64, i64
      }
      %2972 = func.call @cc_nil_value() : () -> i64
      %2973 = func.call @cc_errorp(%2943#0) : (i64) -> i64
      %2974 = arith.cmpi ne, %2973, %2972 : i64
      %2975:2 = scf.if %2974 -> (i64, i64) {
        scf.yield %2943#0, %2943#1 : i64, i64
      } else {
        %2976 = func.call @cc_symbol_value(%2770) : (i64) -> i64
        func.call @stack_push_pointer(%2976) : (i64) -> ()
        %2977 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2977, %2943#1 : i64, i64
      }
      func.call @stack_push_pointer(%2975#0) : (i64) -> ()
      %2978 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2978 : i64
    }
    func.call @stack_push_pointer(%2745) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928663"() {
    %3329 = func.call @stack_pop_pointer() : () -> i64
    %3330 = func.call @cc_nil_value() : () -> i64
    %3331 = func.call @cc_nil_value() : () -> i64
    %3332 = func.call @cc_errorp(%3330) : (i64) -> i64
    %3333 = arith.cmpi ne, %3332, %3331 : i64
    %3334 = scf.if %3333 -> (i64) {
      scf.yield %3330 : i64
    } else {
      %3335 = func.call @cc_nil_value() : () -> i64
      %3336 = arith.cmpi ne, %3335, %3335 : i64
      scf.if %3336 {
        func.call @stack_push_pointer(%3335) : (i64) -> ()
      } else {
        %3337 = llvm.mlir.addressof @str254 : !llvm.ptr
        %3338 = func.call @cc_make_function_ref_const(%3337) : (!llvm.ptr) -> i64
        %3339 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%3338, %3339) : (i64, i64) -> ()
      }
      %3340 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3340 : i64
    }
    %3341 = func.call @cc_nil_value() : () -> i64
    %3342 = func.call @cc_errorp(%3334) : (i64) -> i64
    %3343 = arith.cmpi ne, %3342, %3341 : i64
    %3344 = scf.if %3343 -> (i64) {
      scf.yield %3334 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %3345 = func.call @stack_pop_pointer() : () -> i64
      %3346 = func.call @cc_set_symbol_value(%3329, %3345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3345) : (i64) -> ()
      %3347 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3347 : i64
    }
    func.call @stack_push_pointer(%3344) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_130642754928662"() {
    %3313 = func.call @cc_nil_value() : () -> i64
    %3314 = func.call @cc_nil_value() : () -> i64
    %3315 = func.call @cc_errorp(%3313) : (i64) -> i64
    %3316 = arith.cmpi ne, %3315, %3314 : i64
    %3317 = scf.if %3316 -> (i64) {
      scf.yield %3313 : i64
    } else {
      %3318 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3318) : (i64) -> ()
      %3319 = func.call @stack_pop_pointer() : () -> i64
      %3320 = llvm.mlir.addressof @str253 : !llvm.ptr
      %3321 = arith.constant 24 : i64
      %3322 = func.call @cc_make_string(%3320, %3321) : (!llvm.ptr, i64) -> i64
      %3323 = func.call @cc_nil_value() : () -> i64
      %3324 = func.call @cc_intern(%3322, %3323) : (i64, i64) -> i64
      %3325 = func.call @cc_nil_value() : () -> i64
      %3326 = func.call @cc_cons(%3324, %3325) : (i64, i64) -> i64
      %3327 = func.call @cc_values_pack(%3326) : (i64) -> i64
      func.call @stack_push_pointer(%3324) : (i64) -> ()
      %3328 = func.call @stack_pop_pointer() : () -> i64
      %3348 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3349 = arith.constant 33 : i64
      %3350 = func.call @cc_make_symbol(%3348, %3349) : (!llvm.ptr, i64) -> i64
      %3351 = func.call @cc_persistent_root_value(%3350) : (i64) -> i64
      %3352 = func.call @cc_set_symbol_value(%3351, %3319) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3351) : (i64) -> ()
      %3353 = arith.constant 130642754928663 : i64
      %3354 = arith.constant 1 : i64
      %3355 = func.call @cc_make_closure(%3353, %3354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3355) : (i64) -> ()
      %3356 = func.call @stack_pop_pointer() : () -> i64
      %3357 = func.call @cc_nil_value() : () -> i64
      %3358 = func.call @cc_errorp(%3328) : (i64) -> i64
      %3359 = arith.cmpi ne, %3358, %3357 : i64
      %3360 = arith.cmpi eq, %3357, %3357 : i64
      %3361 = arith.andi %3359, %3360 : i1
      %3362 = scf.if %3361 -> (i64) {
        scf.yield %3328 : i64
      } else {
        scf.yield %3357 : i64
      }
      %3363 = func.call @cc_errorp(%3356) : (i64) -> i64
      %3364 = arith.cmpi ne, %3363, %3357 : i64
      %3365 = arith.cmpi eq, %3362, %3357 : i64
      %3366 = arith.andi %3364, %3365 : i1
      %3367 = scf.if %3366 -> (i64) {
        scf.yield %3356 : i64
      } else {
        scf.yield %3362 : i64
      }
      %3368 = arith.cmpi ne, %3367, %3357 : i64
      scf.if %3368 {
        func.call @stack_push_pointer(%3367) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3328) : (i64) -> ()
        func.call @stack_push_pointer(%3356) : (i64) -> ()
        %3369 = llvm.mlir.addressof @str256 : !llvm.ptr
        %3370 = func.call @cc_make_function_ref_const(%3369) : (!llvm.ptr) -> i64
        %3371 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%3370, %3371) : (i64, i64) -> ()
      }
      %3372 = func.call @stack_pop_pointer() : () -> i64
      %3373 = func.call @cc_nil_value() : () -> i64
      %3374 = func.call @cc_nil_value() : () -> i64
      %3375 = func.call @cc_errorp(%3373) : (i64) -> i64
      %3376 = arith.cmpi ne, %3375, %3374 : i64
      %3377 = scf.if %3376 -> (i64) {
        scf.yield %3373 : i64
      } else {
        func.call @stack_push_pointer(%3372) : (i64) -> ()
        %3378 = func.call @stack_pop_pointer() : () -> i64
        %3379 = func.call @cc_nil_value() : () -> i64
        %3380 = func.call @cc_errorp(%3378) : (i64) -> i64
        %3381 = arith.cmpi ne, %3380, %3379 : i64
        %3382 = arith.cmpi eq, %3379, %3379 : i64
        %3383 = arith.andi %3381, %3382 : i1
        %3384 = scf.if %3383 -> (i64) {
          scf.yield %3378 : i64
        } else {
          scf.yield %3379 : i64
        }
        %3385 = arith.cmpi ne, %3384, %3379 : i64
        scf.if %3385 {
          func.call @stack_push_pointer(%3384) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3378) : (i64) -> ()
          %3386 = llvm.mlir.addressof @str257 : !llvm.ptr
          %3387 = func.call @cc_make_function_ref_const(%3386) : (!llvm.ptr) -> i64
          %3388 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3387, %3388) : (i64, i64) -> ()
        }
        %3389 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3389 : i64
      }
      %3390 = func.call @cc_nil_value() : () -> i64
      %3391 = func.call @cc_errorp(%3377) : (i64) -> i64
      %3392 = arith.cmpi ne, %3391, %3390 : i64
      %3393 = scf.if %3392 -> (i64) {
        scf.yield %3377 : i64
      } else {
        %3394 = func.call @cc_push_ignore_errors_trap() : () -> i64
        func.call @cc_clear_multiple_values() : () -> ()
        %3395 = func.call @cc_nil_value() : () -> i64
        %3396 = func.call @cc_nil_value() : () -> i64
        %3397 = func.call @cc_errorp(%3395) : (i64) -> i64
        %3398 = arith.cmpi ne, %3397, %3396 : i64
        %3399 = scf.if %3398 -> (i64) {
          scf.yield %3395 : i64
        } else {
          func.call @stack_push_pointer(%3372) : (i64) -> ()
          %3400 = func.call @stack_pop_pointer() : () -> i64
          %3401 = func.call @cc_nil_value() : () -> i64
          %3402 = func.call @cc_errorp(%3400) : (i64) -> i64
          %3403 = arith.cmpi ne, %3402, %3401 : i64
          %3404 = arith.cmpi eq, %3401, %3401 : i64
          %3405 = arith.andi %3403, %3404 : i1
          %3406 = scf.if %3405 -> (i64) {
            scf.yield %3400 : i64
          } else {
            scf.yield %3401 : i64
          }
          %3407 = arith.cmpi ne, %3406, %3401 : i64
          scf.if %3407 {
            func.call @stack_push_pointer(%3406) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3400) : (i64) -> ()
            %3408 = llvm.mlir.addressof @str258 : !llvm.ptr
            %3409 = func.call @cc_make_function_ref_const(%3408) : (!llvm.ptr) -> i64
            %3410 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3409, %3410) : (i64, i64) -> ()
          }
          %3411 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3411 : i64
        }
        func.call @stack_push_pointer(%3399) : (i64) -> ()
        %3412 = func.call @stack_pop_pointer() : () -> i64
        %3413 = func.call @cc_pop_ignore_errors_trap() : () -> i64
        %3414 = func.call @cc_errorp(%3412) : (i64) -> i64
        %3415 = func.call @cc_nil_value() : () -> i64
        %3416 = arith.cmpi ne, %3414, %3415 : i64
        scf.if %3416 {
          %3417 = func.call @cc_condition_value(%3412) : (i64) -> i64
          %3418 = func.call @cc_values2(%3415, %3417) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3418) : (i64) -> ()
        } else {
          %3419 = func.call @cc_multiple_value_list(%3412) : (i64) -> i64
          %3420 = func.call @cc_values_pack(%3419) : (i64) -> i64
          func.call @stack_push_pointer(%3420) : (i64) -> ()
        }
        %3421 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3421 : i64
      }
      %3422 = func.call @cc_nil_value() : () -> i64
      %3423 = func.call @cc_errorp(%3393) : (i64) -> i64
      %3424 = arith.cmpi ne, %3423, %3422 : i64
      %3425 = scf.if %3424 -> (i64) {
        scf.yield %3393 : i64
      } else {
        %3426 = func.call @cc_symbol_value(%3351) : (i64) -> i64
        func.call @stack_push_pointer(%3426) : (i64) -> ()
        %3427 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3427 : i64
      }
      func.call @stack_push_pointer(%3425) : (i64) -> ()
      %3428 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3428 : i64
    }
    func.call @stack_push_pointer(%3317) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_130642754928640*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_130642754928640*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_130642754928640*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("%FN%with-delayed-process\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str6("WITH-DELAYED-PROCESS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str7("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str8("%FN%with-delayed-process\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str9("WITH-DELAYED-PROCESS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str10("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str11("%FN%with-delayed-process\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str12("WITH-DELAYED-PROCESS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str13("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str14("%FN%with-delayed-process\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str15("WITH-DELAYED-PROCESS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str16("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str17("CANCELLATION-INTERRUPT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str18("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str19("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str20("WITH-DELAYED-PROCESS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str21("CANCELLATION-INTERRUPT-TEST\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str22("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str23("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str25("PROCESS-CANCEL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str26("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str27("CANCELLATION-INTERRUPT-TEST\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str28("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str29("#:%%DYN-CELL-130642754928642-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str30("mp:make-lock\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str31("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("CANCELLATION-INTERRUPT-TEST\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str33("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("CORE:CHECK-PENDING-INTERRUPTS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str35("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str36("#:%%DYN-CELL-130642754928644-LOCK0\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str37("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str38("mp:process-cancel\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str39("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str40("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str41("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str44("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str47("HANDLE-INTERRUPT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str48("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str49("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("PROCESS-RUN-FUNCTION\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str52("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str53("HANDLE-INTERRUPT-TEST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str54("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str56("HANDLER-CASE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str57("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str58("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str59("CHECK-PENDING-INTERRUPTS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str60("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str61("CANCELLATION-INTERRUPT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str62("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str63("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str66("PROCESS-CANCEL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str67("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str68("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str69("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("PROCESS-JOIN\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str72("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str73("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str74("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str75("HANDLE-INTERRUPT-TEST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str76("*__MLIR_BLOCK_RETFLAG_130642754928647*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str77("*__MLIR_BLOCK_RETVALUE_130642754928647*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str78("*__MLIR_BLOCK_RETMVLIST_130642754928647*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str79("*__MLIR_BLOCK_RETFLAG_130642754928640*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETFLAG_130642754928647*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str81("CORE:CHECK-PENDING-INTERRUPTS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str82("*__MLIR_BLOCK_RETFLAG_130642754928647*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str83("*__MLIR_BLOCK_RETVALUE_130642754928647*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str84("*__MLIR_BLOCK_RETMVLIST_130642754928647*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str85("CANCELLATION-INTERRUPT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str86("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str87("#:%%DYN-CELL-130642754928648-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str88("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str89("mp:process-cancel\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str90("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str91("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str93("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str94("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str96("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str97("CALL-INTERRUPT\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str98("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str99("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str100("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str101("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str102("WITH-DELAYED-PROCESS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str103("CALL-INTERRUPT-TEST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str104("INTERRUPT-PROCESS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str105("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str106("CALL-INTERRUPT-TEST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str107("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("ATOMIC\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str111("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str112("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str113("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str115("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str116("#:%%DYN-CELL-130642754928650-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str117("mp:make-lock\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str118("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str119("CALL-INTERRUPT-TEST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str120("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str121("CORE:CHECK-PENDING-INTERRUPTS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str122("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str123("#:%%DYN-CELL-130642754928652-LOCK1\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str124("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str125("mp:interrupt-process\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str126("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str127("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str128("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str130("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str131("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str132("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str133("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str134("SLEEP-INTERRUPTIBLE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str135("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str136("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str137("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str138("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str139("THREAD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str140("PROCESS-RUN-FUNCTION\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str141("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str142("SLEEP-INTERRUPTIBLE-TEST\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str143("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str144("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str145("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str146("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("INTERRUPT-PROCESS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str148("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str149("THREAD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str150("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str151("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str152("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str153("ATOMIC\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str154("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str155("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str158("PROCESS-JOIN\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str159("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str160("THREAD\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str161("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str162("SLEEP-INTERRUPTIBLE-TEST\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str163("SLEEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str164("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str165("#:%%DYN-CELL-130642754928656-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str166("mp:interrupt-process\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str167("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str168("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str170("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str171("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str172("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str173("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str174("LOCK-INTERRUPTIBLE\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str175("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str176("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("MAKE-LOCK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str178("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str179("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str180("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str181("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str182("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str183("WITH-LOCK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str184("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str185("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str186("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str188("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str189("PROCESS-RUN-FUNCTION\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str190("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str191("LOCK-INTERRUPTIBLE-TEST\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str192("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str193("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str194("WITH-LOCK\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str195("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str196("LOCK\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str197("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str198("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str199("ATOMIC\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str200("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str201("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str202("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str203("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str204("PROCESS-CANCEL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str205("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str206("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str207("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("PROCESS-JOIN\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str210("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str211("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str212("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str213("mp:make-lock\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str214("#:%%DYN-CELL-130642754928659-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str215("#:%%DYN-CELL-130642754928660-LOCK\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str216("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str217("LOCK-INTERRUPTIBLE-TEST\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str218("mp:get-lock\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str220("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str221("mp:process-cancel\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str222("mp:giveup-lock\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str223("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str224("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str225("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str226("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str227("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str228("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str229("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str230("INPUT-INTERRUPTIBLE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str231("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str232("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str233("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str234("PROCESS-RUN-FUNCTION\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str235("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str236("INPUT-INTERRUPTIBLE-TEST\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str237("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str238("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str239("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str240("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str241("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str242("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str243("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str244("PROCESS-CANCEL\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str245("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str246("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str247("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str248("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str249("PROCESS-JOIN\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str250("MP\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str251("PROC\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str252("CELL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str253("INPUT-INTERRUPTIBLE-TEST\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str254("READ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str255("#:%%DYN-CELL-130642754928664-CELL\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str256("mp:process-run-function\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str257("mp:process-cancel\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str258("mp:process-join\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str259("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str260("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str261("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str262("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str263("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str264("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str265("*__MLIR_BLOCK_RETFLAG_130642754928640*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str266("*__MLIR_BLOCK_RETMVLIST_130642754928640*\00") : !llvm.array<41 x i8>
}
