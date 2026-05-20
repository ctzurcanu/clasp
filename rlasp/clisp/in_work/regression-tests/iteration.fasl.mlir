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
      %58 = arith.constant 23 : i64
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
      %83 = arith.constant 3 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = func.call @cc_nil_value() : () -> i64
      %86 = func.call @cc_intern(%84, %85) : (i64, i64) -> i64
      %87 = func.call @cc_nil_value() : () -> i64
      %88 = func.call @cc_cons(%86, %87) : (i64, i64) -> i64
      %89 = func.call @cc_values_pack(%88) : (i64) -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      %90 = llvm.mlir.addressof @str9 : !llvm.ptr
      %91 = arith.constant 8 : i64
      %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
      %93 = func.call @cc_nil_value() : () -> i64
      %94 = func.call @cc_intern(%92, %93) : (i64, i64) -> i64
      %95 = func.call @cc_nil_value() : () -> i64
      %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
      %97 = func.call @cc_values_pack(%96) : (i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %98 = func.call @stack_pop_pointer() : () -> i64
      %99 = func.call @stack_pop_pointer() : () -> i64
      %100 = func.call @cc_cons(%99, %98) : (i64, i64) -> i64
      func.call @stack_push_pointer(%100) : (i64) -> ()
      %101 = func.call @stack_pop_pointer() : () -> i64
      %102 = func.call @stack_pop_pointer() : () -> i64
      %103 = func.call @cc_cons(%102, %101) : (i64, i64) -> i64
      func.call @stack_push_pointer(%103) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %104 = func.call @stack_pop_pointer() : () -> i64
      %105 = func.call @stack_pop_pointer() : () -> i64
      %106 = func.call @cc_cons(%105, %104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%106) : (i64) -> ()
      %107 = llvm.mlir.addressof @str10 : !llvm.ptr
      %108 = arith.constant 4 : i64
      %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
      %110 = llvm.mlir.addressof @str11 : !llvm.ptr
      %111 = arith.constant 11 : i64
      %112 = func.call @cc_make_string(%110, %111) : (!llvm.ptr, i64) -> i64
      %113 = func.call @cc_intern(%109, %112) : (i64, i64) -> i64
      %114 = func.call @cc_nil_value() : () -> i64
      %115 = func.call @cc_cons(%113, %114) : (i64, i64) -> i64
      %116 = func.call @cc_values_pack(%115) : (i64) -> i64
      func.call @stack_push_pointer(%113) : (i64) -> ()
      %117 = llvm.mlir.addressof @str12 : !llvm.ptr
      %118 = arith.constant 14 : i64
      %119 = func.call @cc_make_string(%117, %118) : (!llvm.ptr, i64) -> i64
      %120 = func.call @cc_nil_value() : () -> i64
      %121 = func.call @cc_intern(%119, %120) : (i64, i64) -> i64
      %122 = func.call @cc_nil_value() : () -> i64
      %123 = func.call @cc_cons(%121, %122) : (i64, i64) -> i64
      %124 = func.call @cc_values_pack(%123) : (i64) -> i64
      func.call @stack_push_pointer(%121) : (i64) -> ()
      %125 = llvm.mlir.addressof @str13 : !llvm.ptr
      %126 = arith.constant 9 : i64
      %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
      %128 = llvm.mlir.addressof @str14 : !llvm.ptr
      %129 = arith.constant 11 : i64
      %130 = func.call @cc_make_string(%128, %129) : (!llvm.ptr, i64) -> i64
      %131 = func.call @cc_intern(%127, %130) : (i64, i64) -> i64
      %132 = func.call @cc_nil_value() : () -> i64
      %133 = func.call @cc_cons(%131, %132) : (i64, i64) -> i64
      %134 = func.call @cc_values_pack(%133) : (i64) -> i64
      func.call @stack_push_pointer(%131) : (i64) -> ()
      %135 = llvm.mlir.addressof @str15 : !llvm.ptr
      %136 = arith.constant 9 : i64
      %137 = func.call @cc_make_string(%135, %136) : (!llvm.ptr, i64) -> i64
      %138 = llvm.mlir.addressof @str16 : !llvm.ptr
      %139 = arith.constant 11 : i64
      %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
      %141 = func.call @cc_intern(%137, %140) : (i64, i64) -> i64
      %142 = func.call @cc_nil_value() : () -> i64
      %143 = func.call @cc_cons(%141, %142) : (i64, i64) -> i64
      %144 = func.call @cc_values_pack(%143) : (i64) -> i64
      func.call @stack_push_pointer(%141) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = func.call @stack_pop_pointer() : () -> i64
      %147 = func.call @cc_cons(%146, %145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%147) : (i64) -> ()
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = func.call @stack_pop_pointer() : () -> i64
      %150 = func.call @cc_cons(%149, %148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%150) : (i64) -> ()
      %151 = llvm.mlir.addressof @str17 : !llvm.ptr
      %152 = arith.constant 4 : i64
      %153 = func.call @cc_make_string(%151, %152) : (!llvm.ptr, i64) -> i64
      %154 = func.call @cc_nil_value() : () -> i64
      %155 = func.call @cc_intern(%153, %154) : (i64, i64) -> i64
      %156 = func.call @cc_nil_value() : () -> i64
      %157 = func.call @cc_cons(%155, %156) : (i64, i64) -> i64
      %158 = func.call @cc_values_pack(%157) : (i64) -> i64
      func.call @stack_push_pointer(%155) : (i64) -> ()
      %159 = llvm.mlir.addressof @str18 : !llvm.ptr
      %160 = arith.constant 8 : i64
      %161 = func.call @cc_make_string(%159, %160) : (!llvm.ptr, i64) -> i64
      %162 = func.call @cc_nil_value() : () -> i64
      %163 = func.call @cc_intern(%161, %162) : (i64, i64) -> i64
      %164 = func.call @cc_nil_value() : () -> i64
      %165 = func.call @cc_cons(%163, %164) : (i64, i64) -> i64
      %166 = func.call @cc_values_pack(%165) : (i64) -> i64
      func.call @stack_push_pointer(%163) : (i64) -> ()
      %167 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%167) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @stack_pop_pointer() : () -> i64
      %170 = func.call @cc_cons(%169, %168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%170) : (i64) -> ()
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @stack_pop_pointer() : () -> i64
      %173 = func.call @cc_cons(%172, %171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%173) : (i64) -> ()
      %174 = func.call @stack_pop_pointer() : () -> i64
      %175 = func.call @stack_pop_pointer() : () -> i64
      %176 = func.call @cc_cons(%175, %174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%176) : (i64) -> ()
      %177 = llvm.mlir.addressof @str19 : !llvm.ptr
      %178 = arith.constant 14 : i64
      %179 = func.call @cc_make_string(%177, %178) : (!llvm.ptr, i64) -> i64
      %180 = llvm.mlir.addressof @str20 : !llvm.ptr
      %181 = arith.constant 11 : i64
      %182 = func.call @cc_make_string(%180, %181) : (!llvm.ptr, i64) -> i64
      %183 = func.call @cc_intern(%179, %182) : (i64, i64) -> i64
      %184 = func.call @cc_nil_value() : () -> i64
      %185 = func.call @cc_cons(%183, %184) : (i64, i64) -> i64
      %186 = func.call @cc_values_pack(%185) : (i64) -> i64
      func.call @stack_push_pointer(%183) : (i64) -> ()
      %187 = llvm.mlir.addressof @str21 : !llvm.ptr
      %188 = arith.constant 9 : i64
      %189 = func.call @cc_make_string(%187, %188) : (!llvm.ptr, i64) -> i64
      %190 = llvm.mlir.addressof @str22 : !llvm.ptr
      %191 = arith.constant 11 : i64
      %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
      %193 = func.call @cc_intern(%189, %192) : (i64, i64) -> i64
      %194 = func.call @cc_nil_value() : () -> i64
      %195 = func.call @cc_cons(%193, %194) : (i64, i64) -> i64
      %196 = func.call @cc_values_pack(%195) : (i64) -> i64
      func.call @stack_push_pointer(%193) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %197 = func.call @stack_pop_pointer() : () -> i64
      %198 = func.call @stack_pop_pointer() : () -> i64
      %199 = func.call @cc_cons(%198, %197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%199) : (i64) -> ()
      %200 = func.call @stack_pop_pointer() : () -> i64
      %201 = func.call @stack_pop_pointer() : () -> i64
      %202 = func.call @cc_cons(%201, %200) : (i64, i64) -> i64
      func.call @stack_push_pointer(%202) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %203 = func.call @stack_pop_pointer() : () -> i64
      %204 = func.call @stack_pop_pointer() : () -> i64
      %205 = func.call @cc_cons(%204, %203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%205) : (i64) -> ()
      %206 = func.call @stack_pop_pointer() : () -> i64
      %207 = func.call @stack_pop_pointer() : () -> i64
      %208 = func.call @cc_cons(%207, %206) : (i64, i64) -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      %209 = func.call @stack_pop_pointer() : () -> i64
      %210 = func.call @stack_pop_pointer() : () -> i64
      %211 = func.call @cc_cons(%210, %209) : (i64, i64) -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%213, %212) : (i64, i64) -> i64
      func.call @stack_push_pointer(%214) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %215 = func.call @stack_pop_pointer() : () -> i64
      %216 = func.call @stack_pop_pointer() : () -> i64
      %217 = func.call @cc_cons(%216, %215) : (i64, i64) -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %218 = llvm.mlir.addressof @str23 : !llvm.ptr
      %219 = arith.constant 12 : i64
      %220 = func.call @cc_make_string(%218, %219) : (!llvm.ptr, i64) -> i64
      %221 = llvm.mlir.addressof @str24 : !llvm.ptr
      %222 = arith.constant 11 : i64
      %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
      %224 = func.call @cc_intern(%220, %223) : (i64, i64) -> i64
      %225 = func.call @cc_nil_value() : () -> i64
      %226 = func.call @cc_cons(%224, %225) : (i64, i64) -> i64
      %227 = func.call @cc_values_pack(%226) : (i64) -> i64
      func.call @stack_push_pointer(%224) : (i64) -> ()
      %228 = llvm.mlir.addressof @str25 : !llvm.ptr
      %229 = arith.constant 7 : i64
      %230 = func.call @cc_make_string(%228, %229) : (!llvm.ptr, i64) -> i64
      %231 = llvm.mlir.addressof @str26 : !llvm.ptr
      %232 = arith.constant 11 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = func.call @cc_intern(%230, %233) : (i64, i64) -> i64
      %235 = func.call @cc_nil_value() : () -> i64
      %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
      %237 = func.call @cc_values_pack(%236) : (i64) -> i64
      func.call @stack_push_pointer(%234) : (i64) -> ()
      %238 = llvm.mlir.addressof @str27 : !llvm.ptr
      %239 = arith.constant 8 : i64
      %240 = func.call @cc_make_string(%238, %239) : (!llvm.ptr, i64) -> i64
      %241 = llvm.mlir.addressof @str28 : !llvm.ptr
      %242 = arith.constant 11 : i64
      %243 = func.call @cc_make_string(%241, %242) : (!llvm.ptr, i64) -> i64
      %244 = func.call @cc_intern(%240, %243) : (i64, i64) -> i64
      %245 = func.call @cc_nil_value() : () -> i64
      %246 = func.call @cc_cons(%244, %245) : (i64, i64) -> i64
      %247 = func.call @cc_values_pack(%246) : (i64) -> i64
      func.call @stack_push_pointer(%244) : (i64) -> ()
      %248 = llvm.mlir.addressof @str29 : !llvm.ptr
      %249 = arith.constant 14 : i64
      %250 = func.call @cc_make_string(%248, %249) : (!llvm.ptr, i64) -> i64
      %251 = func.call @cc_nil_value() : () -> i64
      %252 = func.call @cc_intern(%250, %251) : (i64, i64) -> i64
      %253 = func.call @cc_nil_value() : () -> i64
      %254 = func.call @cc_cons(%252, %253) : (i64, i64) -> i64
      %255 = func.call @cc_values_pack(%254) : (i64) -> i64
      func.call @stack_push_pointer(%252) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @stack_pop_pointer() : () -> i64
      %258 = func.call @cc_cons(%257, %256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%258) : (i64) -> ()
      %259 = func.call @stack_pop_pointer() : () -> i64
      %260 = func.call @stack_pop_pointer() : () -> i64
      %261 = func.call @cc_cons(%260, %259) : (i64, i64) -> i64
      func.call @stack_push_pointer(%261) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %262 = func.call @stack_pop_pointer() : () -> i64
      %263 = func.call @stack_pop_pointer() : () -> i64
      %264 = func.call @cc_cons(%263, %262) : (i64, i64) -> i64
      func.call @stack_push_pointer(%264) : (i64) -> ()
      %265 = func.call @stack_pop_pointer() : () -> i64
      %266 = func.call @stack_pop_pointer() : () -> i64
      %267 = func.call @cc_cons(%266, %265) : (i64, i64) -> i64
      func.call @stack_push_pointer(%267) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %268 = func.call @stack_pop_pointer() : () -> i64
      %269 = func.call @stack_pop_pointer() : () -> i64
      %270 = func.call @cc_cons(%269, %268) : (i64, i64) -> i64
      func.call @stack_push_pointer(%270) : (i64) -> ()
      %271 = llvm.mlir.addressof @str30 : !llvm.ptr
      %272 = arith.constant 7 : i64
      %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
      %274 = llvm.mlir.addressof @str31 : !llvm.ptr
      %275 = arith.constant 11 : i64
      %276 = func.call @cc_make_string(%274, %275) : (!llvm.ptr, i64) -> i64
      %277 = func.call @cc_intern(%273, %276) : (i64, i64) -> i64
      %278 = func.call @cc_nil_value() : () -> i64
      %279 = func.call @cc_cons(%277, %278) : (i64, i64) -> i64
      %280 = func.call @cc_values_pack(%279) : (i64) -> i64
      func.call @stack_push_pointer(%277) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %281 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%281) : (i64) -> ()
      %282 = llvm.mlir.addressof @str32 : !llvm.ptr
      %283 = arith.constant 6 : i64
      %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
      %285 = llvm.mlir.addressof @str33 : !llvm.ptr
      %286 = arith.constant 11 : i64
      %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
      %288 = func.call @cc_intern(%284, %287) : (i64, i64) -> i64
      %289 = func.call @cc_nil_value() : () -> i64
      %290 = func.call @cc_cons(%288, %289) : (i64, i64) -> i64
      %291 = func.call @cc_values_pack(%290) : (i64) -> i64
      func.call @stack_push_pointer(%288) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %292 = llvm.mlir.addressof @str34 : !llvm.ptr
      %293 = arith.constant 3 : i64
      %294 = func.call @cc_make_string(%292, %293) : (!llvm.ptr, i64) -> i64
      %295 = llvm.mlir.addressof @str35 : !llvm.ptr
      %296 = arith.constant 11 : i64
      %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
      %298 = func.call @cc_intern(%294, %297) : (i64, i64) -> i64
      %299 = func.call @cc_nil_value() : () -> i64
      %300 = func.call @cc_cons(%298, %299) : (i64, i64) -> i64
      %301 = func.call @cc_values_pack(%300) : (i64) -> i64
      func.call @stack_push_pointer(%298) : (i64) -> ()
      %302 = llvm.mlir.addressof @str36 : !llvm.ptr
      %303 = arith.constant 3 : i64
      %304 = func.call @cc_make_string(%302, %303) : (!llvm.ptr, i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_intern(%304, %305) : (i64, i64) -> i64
      %307 = func.call @cc_nil_value() : () -> i64
      %308 = func.call @cc_cons(%306, %307) : (i64, i64) -> i64
      %309 = func.call @cc_values_pack(%308) : (i64) -> i64
      func.call @stack_push_pointer(%306) : (i64) -> ()
      %310 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%310) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %311 = func.call @stack_pop_pointer() : () -> i64
      %312 = func.call @stack_pop_pointer() : () -> i64
      %313 = func.call @cc_cons(%312, %311) : (i64, i64) -> i64
      func.call @stack_push_pointer(%313) : (i64) -> ()
      %314 = func.call @stack_pop_pointer() : () -> i64
      %315 = func.call @stack_pop_pointer() : () -> i64
      %316 = func.call @cc_cons(%315, %314) : (i64, i64) -> i64
      func.call @stack_push_pointer(%316) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @cc_cons(%318, %317) : (i64, i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %320 = llvm.mlir.addressof @str37 : !llvm.ptr
      %321 = arith.constant 6 : i64
      %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
      %323 = llvm.mlir.addressof @str38 : !llvm.ptr
      %324 = arith.constant 11 : i64
      %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
      %326 = func.call @cc_intern(%322, %325) : (i64, i64) -> i64
      %327 = func.call @cc_nil_value() : () -> i64
      %328 = func.call @cc_cons(%326, %327) : (i64, i64) -> i64
      %329 = func.call @cc_values_pack(%328) : (i64) -> i64
      func.call @stack_push_pointer(%326) : (i64) -> ()
      %330 = llvm.mlir.addressof @str39 : !llvm.ptr
      %331 = arith.constant 1 : i64
      %332 = func.call @cc_make_string(%330, %331) : (!llvm.ptr, i64) -> i64
      %333 = func.call @cc_nil_value() : () -> i64
      %334 = func.call @cc_intern(%332, %333) : (i64, i64) -> i64
      %335 = func.call @cc_nil_value() : () -> i64
      %336 = func.call @cc_cons(%334, %335) : (i64, i64) -> i64
      %337 = func.call @cc_values_pack(%336) : (i64) -> i64
      func.call @stack_push_pointer(%334) : (i64) -> ()
      %338 = llvm.mlir.addressof @str40 : !llvm.ptr
      %339 = arith.constant 4 : i64
      %340 = func.call @cc_make_string(%338, %339) : (!llvm.ptr, i64) -> i64
      %341 = llvm.mlir.addressof @str41 : !llvm.ptr
      %342 = arith.constant 11 : i64
      %343 = func.call @cc_make_string(%341, %342) : (!llvm.ptr, i64) -> i64
      %344 = func.call @cc_intern(%340, %343) : (i64, i64) -> i64
      %345 = func.call @cc_nil_value() : () -> i64
      %346 = func.call @cc_cons(%344, %345) : (i64, i64) -> i64
      %347 = func.call @cc_values_pack(%346) : (i64) -> i64
      func.call @stack_push_pointer(%344) : (i64) -> ()
      %348 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%348) : (i64) -> ()
      %349 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%349) : (i64) -> ()
      %350 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%350) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %351 = func.call @stack_pop_pointer() : () -> i64
      %352 = func.call @stack_pop_pointer() : () -> i64
      %353 = func.call @cc_cons(%352, %351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%353) : (i64) -> ()
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @stack_pop_pointer() : () -> i64
      %356 = func.call @cc_cons(%355, %354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%356) : (i64) -> ()
      %357 = func.call @stack_pop_pointer() : () -> i64
      %358 = func.call @stack_pop_pointer() : () -> i64
      %359 = func.call @cc_cons(%358, %357) : (i64, i64) -> i64
      func.call @stack_push_pointer(%359) : (i64) -> ()
      %360 = func.call @stack_pop_pointer() : () -> i64
      %361 = func.call @stack_pop_pointer() : () -> i64
      %362 = func.call @cc_cons(%361, %360) : (i64, i64) -> i64
      func.call @stack_push_pointer(%362) : (i64) -> ()
      %363 = llvm.mlir.addressof @str42 : !llvm.ptr
      %364 = arith.constant 3 : i64
      %365 = func.call @cc_make_string(%363, %364) : (!llvm.ptr, i64) -> i64
      %366 = func.call @cc_nil_value() : () -> i64
      %367 = func.call @cc_intern(%365, %366) : (i64, i64) -> i64
      %368 = func.call @cc_nil_value() : () -> i64
      %369 = func.call @cc_cons(%367, %368) : (i64, i64) -> i64
      %370 = func.call @cc_values_pack(%369) : (i64) -> i64
      func.call @stack_push_pointer(%367) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %371 = func.call @stack_pop_pointer() : () -> i64
      %372 = func.call @stack_pop_pointer() : () -> i64
      %373 = func.call @cc_cons(%372, %371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = func.call @stack_pop_pointer() : () -> i64
      %376 = func.call @cc_cons(%375, %374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%376) : (i64) -> ()
      %377 = func.call @stack_pop_pointer() : () -> i64
      %378 = func.call @stack_pop_pointer() : () -> i64
      %379 = func.call @cc_cons(%378, %377) : (i64, i64) -> i64
      func.call @stack_push_pointer(%379) : (i64) -> ()
      %380 = llvm.mlir.addressof @str43 : !llvm.ptr
      %381 = arith.constant 7 : i64
      %382 = func.call @cc_make_string(%380, %381) : (!llvm.ptr, i64) -> i64
      %383 = llvm.mlir.addressof @str44 : !llvm.ptr
      %384 = arith.constant 11 : i64
      %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
      %386 = func.call @cc_intern(%382, %385) : (i64, i64) -> i64
      %387 = func.call @cc_nil_value() : () -> i64
      %388 = func.call @cc_cons(%386, %387) : (i64, i64) -> i64
      %389 = func.call @cc_values_pack(%388) : (i64) -> i64
      func.call @stack_push_pointer(%386) : (i64) -> ()
      %390 = llvm.mlir.addressof @str45 : !llvm.ptr
      %391 = arith.constant 4 : i64
      %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
      %393 = llvm.mlir.addressof @str46 : !llvm.ptr
      %394 = arith.constant 11 : i64
      %395 = func.call @cc_make_string(%393, %394) : (!llvm.ptr, i64) -> i64
      %396 = func.call @cc_intern(%392, %395) : (i64, i64) -> i64
      %397 = func.call @cc_nil_value() : () -> i64
      %398 = func.call @cc_cons(%396, %397) : (i64, i64) -> i64
      %399 = func.call @cc_values_pack(%398) : (i64) -> i64
      func.call @stack_push_pointer(%396) : (i64) -> ()
      %400 = llvm.mlir.addressof @str47 : !llvm.ptr
      %401 = arith.constant 6 : i64
      %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
      %403 = llvm.mlir.addressof @str48 : !llvm.ptr
      %404 = arith.constant 11 : i64
      %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
      %406 = func.call @cc_intern(%402, %405) : (i64, i64) -> i64
      %407 = func.call @cc_nil_value() : () -> i64
      %408 = func.call @cc_cons(%406, %407) : (i64, i64) -> i64
      %409 = func.call @cc_values_pack(%408) : (i64) -> i64
      func.call @stack_push_pointer(%406) : (i64) -> ()
      %410 = llvm.mlir.addressof @str49 : !llvm.ptr
      %411 = arith.constant 1 : i64
      %412 = func.call @cc_make_string(%410, %411) : (!llvm.ptr, i64) -> i64
      %413 = func.call @cc_nil_value() : () -> i64
      %414 = func.call @cc_intern(%412, %413) : (i64, i64) -> i64
      %415 = func.call @cc_nil_value() : () -> i64
      %416 = func.call @cc_cons(%414, %415) : (i64, i64) -> i64
      %417 = func.call @cc_values_pack(%416) : (i64) -> i64
      func.call @stack_push_pointer(%414) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %418 = func.call @stack_pop_pointer() : () -> i64
      %419 = func.call @stack_pop_pointer() : () -> i64
      %420 = func.call @cc_cons(%419, %418) : (i64, i64) -> i64
      func.call @stack_push_pointer(%420) : (i64) -> ()
      %421 = func.call @stack_pop_pointer() : () -> i64
      %422 = func.call @stack_pop_pointer() : () -> i64
      %423 = func.call @cc_cons(%422, %421) : (i64, i64) -> i64
      func.call @stack_push_pointer(%423) : (i64) -> ()
      %424 = func.call @stack_pop_pointer() : () -> i64
      %425 = func.call @stack_pop_pointer() : () -> i64
      %426 = func.call @cc_cons(%425, %424) : (i64, i64) -> i64
      func.call @stack_push_pointer(%426) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @stack_pop_pointer() : () -> i64
      %429 = func.call @cc_cons(%428, %427) : (i64, i64) -> i64
      func.call @stack_push_pointer(%429) : (i64) -> ()
      %430 = func.call @stack_pop_pointer() : () -> i64
      %431 = func.call @stack_pop_pointer() : () -> i64
      %432 = func.call @cc_cons(%431, %430) : (i64, i64) -> i64
      func.call @stack_push_pointer(%432) : (i64) -> ()
      %433 = llvm.mlir.addressof @str50 : !llvm.ptr
      %434 = arith.constant 4 : i64
      %435 = func.call @cc_make_string(%433, %434) : (!llvm.ptr, i64) -> i64
      %436 = llvm.mlir.addressof @str51 : !llvm.ptr
      %437 = arith.constant 11 : i64
      %438 = func.call @cc_make_string(%436, %437) : (!llvm.ptr, i64) -> i64
      %439 = func.call @cc_intern(%435, %438) : (i64, i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = func.call @cc_cons(%439, %440) : (i64, i64) -> i64
      %442 = func.call @cc_values_pack(%441) : (i64) -> i64
      func.call @stack_push_pointer(%439) : (i64) -> ()
      %443 = llvm.mlir.addressof @str52 : !llvm.ptr
      %444 = arith.constant 3 : i64
      %445 = func.call @cc_make_string(%443, %444) : (!llvm.ptr, i64) -> i64
      %446 = func.call @cc_nil_value() : () -> i64
      %447 = func.call @cc_intern(%445, %446) : (i64, i64) -> i64
      %448 = func.call @cc_nil_value() : () -> i64
      %449 = func.call @cc_cons(%447, %448) : (i64, i64) -> i64
      %450 = func.call @cc_values_pack(%449) : (i64) -> i64
      func.call @stack_push_pointer(%447) : (i64) -> ()
      %451 = llvm.mlir.addressof @str53 : !llvm.ptr
      %452 = arith.constant 1 : i64
      %453 = func.call @cc_make_string(%451, %452) : (!llvm.ptr, i64) -> i64
      %454 = func.call @cc_nil_value() : () -> i64
      %455 = func.call @cc_intern(%453, %454) : (i64, i64) -> i64
      %456 = func.call @cc_nil_value() : () -> i64
      %457 = func.call @cc_cons(%455, %456) : (i64, i64) -> i64
      %458 = func.call @cc_values_pack(%457) : (i64) -> i64
      func.call @stack_push_pointer(%455) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %459 = func.call @stack_pop_pointer() : () -> i64
      %460 = func.call @stack_pop_pointer() : () -> i64
      %461 = func.call @cc_cons(%460, %459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%461) : (i64) -> ()
      %462 = func.call @stack_pop_pointer() : () -> i64
      %463 = func.call @stack_pop_pointer() : () -> i64
      %464 = func.call @cc_cons(%463, %462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%464) : (i64) -> ()
      %465 = func.call @stack_pop_pointer() : () -> i64
      %466 = func.call @stack_pop_pointer() : () -> i64
      %467 = func.call @cc_cons(%466, %465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%467) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %468 = func.call @stack_pop_pointer() : () -> i64
      %469 = func.call @stack_pop_pointer() : () -> i64
      %470 = func.call @cc_cons(%469, %468) : (i64, i64) -> i64
      func.call @stack_push_pointer(%470) : (i64) -> ()
      %471 = func.call @stack_pop_pointer() : () -> i64
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = func.call @cc_cons(%472, %471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%473) : (i64) -> ()
      %474 = func.call @stack_pop_pointer() : () -> i64
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @cc_cons(%475, %474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%476) : (i64) -> ()
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @stack_pop_pointer() : () -> i64
      %479 = func.call @cc_cons(%478, %477) : (i64, i64) -> i64
      func.call @stack_push_pointer(%479) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %480 = func.call @stack_pop_pointer() : () -> i64
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = func.call @cc_cons(%481, %480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%482) : (i64) -> ()
      %483 = func.call @stack_pop_pointer() : () -> i64
      %484 = func.call @stack_pop_pointer() : () -> i64
      %485 = func.call @cc_cons(%484, %483) : (i64, i64) -> i64
      func.call @stack_push_pointer(%485) : (i64) -> ()
      %486 = func.call @stack_pop_pointer() : () -> i64
      %487 = func.call @stack_pop_pointer() : () -> i64
      %488 = func.call @cc_cons(%487, %486) : (i64, i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %489 = func.call @stack_pop_pointer() : () -> i64
      %490 = func.call @stack_pop_pointer() : () -> i64
      %491 = func.call @cc_cons(%490, %489) : (i64, i64) -> i64
      func.call @stack_push_pointer(%491) : (i64) -> ()
      %492 = func.call @stack_pop_pointer() : () -> i64
      %493 = func.call @stack_pop_pointer() : () -> i64
      %494 = func.call @cc_cons(%493, %492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%494) : (i64) -> ()
      %495 = func.call @stack_pop_pointer() : () -> i64
      %496 = func.call @stack_pop_pointer() : () -> i64
      %497 = func.call @cc_cons(%496, %495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%497) : (i64) -> ()
      %498 = func.call @stack_pop_pointer() : () -> i64
      %499 = func.call @stack_pop_pointer() : () -> i64
      %500 = func.call @cc_cons(%498, %499) : (i64, i64) -> i64
      %501 = llvm.mlir.addressof @str54 : !llvm.ptr
      %502 = arith.constant 5 : i64
      %503 = func.call @cc_make_string(%501, %502) : (!llvm.ptr, i64) -> i64
      %504 = func.call @cc_nil_value() : () -> i64
      %505 = func.call @cc_intern(%503, %504) : (i64, i64) -> i64
      %506 = func.call @cc_nil_value() : () -> i64
      %507 = func.call @cc_cons(%505, %506) : (i64, i64) -> i64
      %508 = func.call @cc_values_pack(%507) : (i64) -> i64
      %509 = func.call @cc_cons(%505, %500) : (i64, i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %510 = func.call @stack_pop_pointer() : () -> i64
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = func.call @cc_cons(%511, %510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%512) : (i64) -> ()
      %513 = func.call @stack_pop_pointer() : () -> i64
      %514 = func.call @stack_pop_pointer() : () -> i64
      %515 = func.call @cc_cons(%514, %513) : (i64, i64) -> i64
      func.call @stack_push_pointer(%515) : (i64) -> ()
      %516 = func.call @stack_pop_pointer() : () -> i64
      %517 = func.call @stack_pop_pointer() : () -> i64
      %518 = func.call @cc_cons(%517, %516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%518) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %519 = func.call @stack_pop_pointer() : () -> i64
      %520 = func.call @stack_pop_pointer() : () -> i64
      %521 = func.call @cc_cons(%520, %519) : (i64, i64) -> i64
      func.call @stack_push_pointer(%521) : (i64) -> ()
      %522 = func.call @stack_pop_pointer() : () -> i64
      %523 = func.call @stack_pop_pointer() : () -> i64
      %524 = func.call @cc_cons(%523, %522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%524) : (i64) -> ()
      %525 = func.call @stack_pop_pointer() : () -> i64
      %526 = func.call @stack_pop_pointer() : () -> i64
      %527 = func.call @cc_cons(%526, %525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%527) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %528 = func.call @stack_pop_pointer() : () -> i64
      %529 = func.call @stack_pop_pointer() : () -> i64
      %530 = func.call @cc_cons(%529, %528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%530) : (i64) -> ()
      %531 = func.call @stack_pop_pointer() : () -> i64
      %532 = func.call @stack_pop_pointer() : () -> i64
      %533 = func.call @cc_cons(%532, %531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%533) : (i64) -> ()
      %534 = func.call @stack_pop_pointer() : () -> i64
      %535 = func.call @stack_pop_pointer() : () -> i64
      %536 = func.call @cc_cons(%535, %534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%536) : (i64) -> ()
      %537 = llvm.mlir.addressof @str55 : !llvm.ptr
      %538 = arith.constant 3 : i64
      %539 = func.call @cc_make_string(%537, %538) : (!llvm.ptr, i64) -> i64
      %540 = llvm.mlir.addressof @str56 : !llvm.ptr
      %541 = arith.constant 11 : i64
      %542 = func.call @cc_make_string(%540, %541) : (!llvm.ptr, i64) -> i64
      %543 = func.call @cc_intern(%539, %542) : (i64, i64) -> i64
      %544 = func.call @cc_nil_value() : () -> i64
      %545 = func.call @cc_cons(%543, %544) : (i64, i64) -> i64
      %546 = func.call @cc_values_pack(%545) : (i64) -> i64
      func.call @stack_push_pointer(%543) : (i64) -> ()
      %547 = llvm.mlir.addressof @str57 : !llvm.ptr
      %548 = arith.constant 8 : i64
      %549 = func.call @cc_make_string(%547, %548) : (!llvm.ptr, i64) -> i64
      %550 = func.call @cc_nil_value() : () -> i64
      %551 = func.call @cc_intern(%549, %550) : (i64, i64) -> i64
      %552 = func.call @cc_nil_value() : () -> i64
      %553 = func.call @cc_cons(%551, %552) : (i64, i64) -> i64
      %554 = func.call @cc_values_pack(%553) : (i64) -> i64
      func.call @stack_push_pointer(%551) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %555 = func.call @stack_pop_pointer() : () -> i64
      %556 = func.call @stack_pop_pointer() : () -> i64
      %557 = func.call @cc_cons(%556, %555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%557) : (i64) -> ()
      %558 = func.call @stack_pop_pointer() : () -> i64
      %559 = func.call @stack_pop_pointer() : () -> i64
      %560 = func.call @cc_cons(%559, %558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%560) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %561 = func.call @stack_pop_pointer() : () -> i64
      %562 = func.call @stack_pop_pointer() : () -> i64
      %563 = func.call @cc_cons(%562, %561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%563) : (i64) -> ()
      %564 = func.call @stack_pop_pointer() : () -> i64
      %565 = func.call @stack_pop_pointer() : () -> i64
      %566 = func.call @cc_cons(%565, %564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%566) : (i64) -> ()
      %567 = func.call @stack_pop_pointer() : () -> i64
      %568 = func.call @stack_pop_pointer() : () -> i64
      %569 = func.call @cc_cons(%568, %567) : (i64, i64) -> i64
      func.call @stack_push_pointer(%569) : (i64) -> ()
      %570 = func.call @stack_pop_pointer() : () -> i64
      %571 = func.call @stack_pop_pointer() : () -> i64
      %572 = func.call @cc_cons(%571, %570) : (i64, i64) -> i64
      func.call @stack_push_pointer(%572) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %573 = func.call @stack_pop_pointer() : () -> i64
      %574 = func.call @stack_pop_pointer() : () -> i64
      %575 = func.call @cc_cons(%574, %573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%575) : (i64) -> ()
      %576 = func.call @stack_pop_pointer() : () -> i64
      %577 = func.call @stack_pop_pointer() : () -> i64
      %578 = func.call @cc_cons(%577, %576) : (i64, i64) -> i64
      func.call @stack_push_pointer(%578) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %579 = func.call @stack_pop_pointer() : () -> i64
      %580 = func.call @stack_pop_pointer() : () -> i64
      %581 = func.call @cc_cons(%580, %579) : (i64, i64) -> i64
      func.call @stack_push_pointer(%581) : (i64) -> ()
      %582 = func.call @stack_pop_pointer() : () -> i64
      %583 = func.call @stack_pop_pointer() : () -> i64
      %584 = func.call @cc_cons(%583, %582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%584) : (i64) -> ()
      %585 = func.call @stack_pop_pointer() : () -> i64
      %823 = arith.constant 210468094345217 : i64
      %824 = arith.constant 0 : i64
      %825 = func.call @cc_make_closure(%823, %824) : (i64, i64) -> i64
      func.call @stack_push_pointer(%825) : (i64) -> ()
      %826 = func.call @stack_pop_pointer() : () -> i64
      %827 = llvm.mlir.addressof @str67 : !llvm.ptr
      %828 = arith.constant 1 : i64
      %829 = func.call @cc_make_string(%827, %828) : (!llvm.ptr, i64) -> i64
      %830 = func.call @cc_nil_value() : () -> i64
      %831 = func.call @cc_intern(%829, %830) : (i64, i64) -> i64
      %832 = func.call @cc_nil_value() : () -> i64
      %833 = func.call @cc_cons(%831, %832) : (i64, i64) -> i64
      %834 = func.call @cc_values_pack(%833) : (i64) -> i64
      func.call @stack_push_pointer(%831) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %835 = func.call @stack_pop_pointer() : () -> i64
      %836 = func.call @stack_pop_pointer() : () -> i64
      %837 = func.call @cc_cons(%836, %835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%837) : (i64) -> ()
      %838 = func.call @stack_pop_pointer() : () -> i64
      %839 = llvm.mlir.addressof @str68 : !llvm.ptr
      %840 = arith.constant 11 : i64
      %841 = func.call @cc_make_string(%839, %840) : (!llvm.ptr, i64) -> i64
      %842 = llvm.mlir.addressof @str69 : !llvm.ptr
      %843 = arith.constant 7 : i64
      %844 = func.call @cc_make_string(%842, %843) : (!llvm.ptr, i64) -> i64
      %845 = func.call @cc_intern(%841, %844) : (i64, i64) -> i64
      %846 = func.call @cc_nil_value() : () -> i64
      %847 = func.call @cc_cons(%845, %846) : (i64, i64) -> i64
      %848 = func.call @cc_values_pack(%847) : (i64) -> i64
      func.call @stack_push_pointer(%845) : (i64) -> ()
      %849 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = llvm.mlir.addressof @str70 : !llvm.ptr
      %852 = arith.constant 4 : i64
      %853 = func.call @cc_make_string(%851, %852) : (!llvm.ptr, i64) -> i64
      %854 = llvm.mlir.addressof @str71 : !llvm.ptr
      %855 = arith.constant 7 : i64
      %856 = func.call @cc_make_string(%854, %855) : (!llvm.ptr, i64) -> i64
      %857 = func.call @cc_intern(%853, %856) : (i64, i64) -> i64
      %858 = func.call @cc_nil_value() : () -> i64
      %859 = func.call @cc_cons(%857, %858) : (i64, i64) -> i64
      %860 = func.call @cc_values_pack(%859) : (i64) -> i64
      func.call @stack_push_pointer(%857) : (i64) -> ()
      %861 = func.call @stack_pop_pointer() : () -> i64
      %862 = llvm.mlir.addressof @str72 : !llvm.ptr
      %863 = arith.constant 6 : i64
      %864 = func.call @cc_make_string(%862, %863) : (!llvm.ptr, i64) -> i64
      %865 = func.call @cc_nil_value() : () -> i64
      %866 = func.call @cc_intern(%864, %865) : (i64, i64) -> i64
      %867 = func.call @cc_nil_value() : () -> i64
      %868 = func.call @cc_cons(%866, %867) : (i64, i64) -> i64
      %869 = func.call @cc_values_pack(%868) : (i64) -> i64
      func.call @stack_push_pointer(%866) : (i64) -> ()
      %870 = func.call @stack_pop_pointer() : () -> i64
      %871 = func.call @cc_nil_value() : () -> i64
      %872 = func.call @cc_errorp(%65) : (i64) -> i64
      %873 = arith.cmpi ne, %872, %871 : i64
      %874 = arith.cmpi eq, %871, %871 : i64
      %875 = arith.andi %873, %874 : i1
      %876 = scf.if %875 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %871 : i64
      }
      %877 = func.call @cc_errorp(%585) : (i64) -> i64
      %878 = arith.cmpi ne, %877, %871 : i64
      %879 = arith.cmpi eq, %876, %871 : i64
      %880 = arith.andi %878, %879 : i1
      %881 = scf.if %880 -> (i64) {
        scf.yield %585 : i64
      } else {
        scf.yield %876 : i64
      }
      %882 = func.call @cc_errorp(%826) : (i64) -> i64
      %883 = arith.cmpi ne, %882, %871 : i64
      %884 = arith.cmpi eq, %881, %871 : i64
      %885 = arith.andi %883, %884 : i1
      %886 = scf.if %885 -> (i64) {
        scf.yield %826 : i64
      } else {
        scf.yield %881 : i64
      }
      %887 = func.call @cc_errorp(%838) : (i64) -> i64
      %888 = arith.cmpi ne, %887, %871 : i64
      %889 = arith.cmpi eq, %886, %871 : i64
      %890 = arith.andi %888, %889 : i1
      %891 = scf.if %890 -> (i64) {
        scf.yield %838 : i64
      } else {
        scf.yield %886 : i64
      }
      %892 = func.call @cc_errorp(%849) : (i64) -> i64
      %893 = arith.cmpi ne, %892, %871 : i64
      %894 = arith.cmpi eq, %891, %871 : i64
      %895 = arith.andi %893, %894 : i1
      %896 = scf.if %895 -> (i64) {
        scf.yield %849 : i64
      } else {
        scf.yield %891 : i64
      }
      %897 = func.call @cc_errorp(%850) : (i64) -> i64
      %898 = arith.cmpi ne, %897, %871 : i64
      %899 = arith.cmpi eq, %896, %871 : i64
      %900 = arith.andi %898, %899 : i1
      %901 = scf.if %900 -> (i64) {
        scf.yield %850 : i64
      } else {
        scf.yield %896 : i64
      }
      %902 = func.call @cc_errorp(%861) : (i64) -> i64
      %903 = arith.cmpi ne, %902, %871 : i64
      %904 = arith.cmpi eq, %901, %871 : i64
      %905 = arith.andi %903, %904 : i1
      %906 = scf.if %905 -> (i64) {
        scf.yield %861 : i64
      } else {
        scf.yield %901 : i64
      }
      %907 = func.call @cc_errorp(%870) : (i64) -> i64
      %908 = arith.cmpi ne, %907, %871 : i64
      %909 = arith.cmpi eq, %906, %871 : i64
      %910 = arith.andi %908, %909 : i1
      %911 = scf.if %910 -> (i64) {
        scf.yield %870 : i64
      } else {
        scf.yield %906 : i64
      }
      %912 = arith.cmpi ne, %911, %871 : i64
      scf.if %912 {
        func.call @stack_push_pointer(%911) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%585) : (i64) -> ()
        func.call @stack_push_pointer(%826) : (i64) -> ()
        func.call @stack_push_pointer(%838) : (i64) -> ()
        func.call @stack_push_pointer(%849) : (i64) -> ()
        func.call @stack_push_pointer(%850) : (i64) -> ()
        func.call @stack_push_pointer(%861) : (i64) -> ()
        func.call @stack_push_pointer(%870) : (i64) -> ()
        %913 = llvm.mlir.addressof @str73 : !llvm.ptr
        %914 = func.call @cc_make_function_ref_const(%913) : (!llvm.ptr) -> i64
        %915 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%914, %915) : (i64, i64) -> ()
      }
      %916 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %916 : i64
    }
    %917 = func.call @cc_nil_value() : () -> i64
    %918 = func.call @cc_errorp(%56) : (i64) -> i64
    %919 = arith.cmpi ne, %918, %917 : i64
    %920 = scf.if %919 -> (i64) {
      scf.yield %56 : i64
    } else {
      %921 = llvm.mlir.addressof @str74 : !llvm.ptr
      %922 = arith.constant 24 : i64
      %923 = func.call @cc_make_string(%921, %922) : (!llvm.ptr, i64) -> i64
      %924 = func.call @cc_nil_value() : () -> i64
      %925 = func.call @cc_intern(%923, %924) : (i64, i64) -> i64
      %926 = func.call @cc_nil_value() : () -> i64
      %927 = func.call @cc_cons(%925, %926) : (i64, i64) -> i64
      %928 = func.call @cc_values_pack(%927) : (i64) -> i64
      func.call @stack_push_pointer(%925) : (i64) -> ()
      %929 = func.call @stack_pop_pointer() : () -> i64
      %930 = llvm.mlir.addressof @str75 : !llvm.ptr
      %931 = arith.constant 3 : i64
      %932 = func.call @cc_make_string(%930, %931) : (!llvm.ptr, i64) -> i64
      %933 = func.call @cc_nil_value() : () -> i64
      %934 = func.call @cc_intern(%932, %933) : (i64, i64) -> i64
      %935 = func.call @cc_nil_value() : () -> i64
      %936 = func.call @cc_cons(%934, %935) : (i64, i64) -> i64
      %937 = func.call @cc_values_pack(%936) : (i64) -> i64
      func.call @stack_push_pointer(%934) : (i64) -> ()
      %938 = llvm.mlir.addressof @str76 : !llvm.ptr
      %939 = arith.constant 3 : i64
      %940 = func.call @cc_make_string(%938, %939) : (!llvm.ptr, i64) -> i64
      %941 = func.call @cc_nil_value() : () -> i64
      %942 = func.call @cc_intern(%940, %941) : (i64, i64) -> i64
      %943 = func.call @cc_nil_value() : () -> i64
      %944 = func.call @cc_cons(%942, %943) : (i64, i64) -> i64
      %945 = func.call @cc_values_pack(%944) : (i64) -> i64
      func.call @stack_push_pointer(%942) : (i64) -> ()
      %946 = llvm.mlir.addressof @str77 : !llvm.ptr
      %947 = arith.constant 3 : i64
      %948 = func.call @cc_make_string(%946, %947) : (!llvm.ptr, i64) -> i64
      %949 = func.call @cc_nil_value() : () -> i64
      %950 = func.call @cc_intern(%948, %949) : (i64, i64) -> i64
      %951 = func.call @cc_nil_value() : () -> i64
      %952 = func.call @cc_cons(%950, %951) : (i64, i64) -> i64
      %953 = func.call @cc_values_pack(%952) : (i64) -> i64
      func.call @stack_push_pointer(%950) : (i64) -> ()
      %954 = llvm.mlir.addressof @str78 : !llvm.ptr
      %955 = arith.constant 3 : i64
      %956 = func.call @cc_make_string(%954, %955) : (!llvm.ptr, i64) -> i64
      %957 = func.call @cc_nil_value() : () -> i64
      %958 = func.call @cc_intern(%956, %957) : (i64, i64) -> i64
      %959 = func.call @cc_nil_value() : () -> i64
      %960 = func.call @cc_cons(%958, %959) : (i64, i64) -> i64
      %961 = func.call @cc_values_pack(%960) : (i64) -> i64
      func.call @stack_push_pointer(%958) : (i64) -> ()
      %962 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%962) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %963 = func.call @stack_pop_pointer() : () -> i64
      %964 = func.call @stack_pop_pointer() : () -> i64
      %965 = func.call @cc_cons(%964, %963) : (i64, i64) -> i64
      func.call @stack_push_pointer(%965) : (i64) -> ()
      %966 = func.call @stack_pop_pointer() : () -> i64
      %967 = func.call @stack_pop_pointer() : () -> i64
      %968 = func.call @cc_cons(%967, %966) : (i64, i64) -> i64
      func.call @stack_push_pointer(%968) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %969 = func.call @stack_pop_pointer() : () -> i64
      %970 = func.call @stack_pop_pointer() : () -> i64
      %971 = func.call @cc_cons(%970, %969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%971) : (i64) -> ()
      %972 = llvm.mlir.addressof @str79 : !llvm.ptr
      %973 = arith.constant 4 : i64
      %974 = func.call @cc_make_string(%972, %973) : (!llvm.ptr, i64) -> i64
      %975 = llvm.mlir.addressof @str80 : !llvm.ptr
      %976 = arith.constant 11 : i64
      %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
      %978 = func.call @cc_intern(%974, %977) : (i64, i64) -> i64
      %979 = func.call @cc_nil_value() : () -> i64
      %980 = func.call @cc_cons(%978, %979) : (i64, i64) -> i64
      %981 = func.call @cc_values_pack(%980) : (i64) -> i64
      func.call @stack_push_pointer(%978) : (i64) -> ()
      %982 = llvm.mlir.addressof @str81 : !llvm.ptr
      %983 = arith.constant 6 : i64
      %984 = func.call @cc_make_string(%982, %983) : (!llvm.ptr, i64) -> i64
      %985 = func.call @cc_nil_value() : () -> i64
      %986 = func.call @cc_intern(%984, %985) : (i64, i64) -> i64
      %987 = func.call @cc_nil_value() : () -> i64
      %988 = func.call @cc_cons(%986, %987) : (i64, i64) -> i64
      %989 = func.call @cc_values_pack(%988) : (i64) -> i64
      func.call @stack_push_pointer(%986) : (i64) -> ()
      %990 = llvm.mlir.addressof @str82 : !llvm.ptr
      %991 = arith.constant 1 : i64
      %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
      %993 = func.call @cc_nil_value() : () -> i64
      %994 = func.call @cc_intern(%992, %993) : (i64, i64) -> i64
      %995 = func.call @cc_nil_value() : () -> i64
      %996 = func.call @cc_cons(%994, %995) : (i64, i64) -> i64
      %997 = func.call @cc_values_pack(%996) : (i64) -> i64
      func.call @stack_push_pointer(%994) : (i64) -> ()
      %998 = llvm.mlir.addressof @str83 : !llvm.ptr
      %999 = arith.constant 4 : i64
      %1000 = func.call @cc_make_string(%998, %999) : (!llvm.ptr, i64) -> i64
      %1001 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1002 = arith.constant 11 : i64
      %1003 = func.call @cc_make_string(%1001, %1002) : (!llvm.ptr, i64) -> i64
      %1004 = func.call @cc_intern(%1000, %1003) : (i64, i64) -> i64
      %1005 = func.call @cc_nil_value() : () -> i64
      %1006 = func.call @cc_cons(%1004, %1005) : (i64, i64) -> i64
      %1007 = func.call @cc_values_pack(%1006) : (i64) -> i64
      func.call @stack_push_pointer(%1004) : (i64) -> ()
      %1008 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%1008) : (i64) -> ()
      %1009 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1009) : (i64) -> ()
      %1010 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1010) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1011 = func.call @stack_pop_pointer() : () -> i64
      %1012 = func.call @stack_pop_pointer() : () -> i64
      %1013 = func.call @cc_cons(%1012, %1011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1013) : (i64) -> ()
      %1014 = func.call @stack_pop_pointer() : () -> i64
      %1015 = func.call @stack_pop_pointer() : () -> i64
      %1016 = func.call @cc_cons(%1015, %1014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1016) : (i64) -> ()
      %1017 = func.call @stack_pop_pointer() : () -> i64
      %1018 = func.call @stack_pop_pointer() : () -> i64
      %1019 = func.call @cc_cons(%1018, %1017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1019) : (i64) -> ()
      %1020 = func.call @stack_pop_pointer() : () -> i64
      %1021 = func.call @stack_pop_pointer() : () -> i64
      %1022 = func.call @cc_cons(%1021, %1020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1022) : (i64) -> ()
      %1023 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1024 = arith.constant 1 : i64
      %1025 = func.call @cc_make_string(%1023, %1024) : (!llvm.ptr, i64) -> i64
      %1026 = func.call @cc_nil_value() : () -> i64
      %1027 = func.call @cc_intern(%1025, %1026) : (i64, i64) -> i64
      %1028 = func.call @cc_nil_value() : () -> i64
      %1029 = func.call @cc_cons(%1027, %1028) : (i64, i64) -> i64
      %1030 = func.call @cc_values_pack(%1029) : (i64) -> i64
      func.call @stack_push_pointer(%1027) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1031 = func.call @stack_pop_pointer() : () -> i64
      %1032 = func.call @stack_pop_pointer() : () -> i64
      %1033 = func.call @cc_cons(%1032, %1031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1033) : (i64) -> ()
      %1034 = func.call @stack_pop_pointer() : () -> i64
      %1035 = func.call @stack_pop_pointer() : () -> i64
      %1036 = func.call @cc_cons(%1035, %1034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1036) : (i64) -> ()
      %1037 = func.call @stack_pop_pointer() : () -> i64
      %1038 = func.call @stack_pop_pointer() : () -> i64
      %1039 = func.call @cc_cons(%1038, %1037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1039) : (i64) -> ()
      %1040 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1041 = arith.constant 4 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1044 = arith.constant 11 : i64
      %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
      %1046 = func.call @cc_intern(%1042, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_nil_value() : () -> i64
      %1048 = func.call @cc_cons(%1046, %1047) : (i64, i64) -> i64
      %1049 = func.call @cc_values_pack(%1048) : (i64) -> i64
      func.call @stack_push_pointer(%1046) : (i64) -> ()
      %1050 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1051 = arith.constant 3 : i64
      %1052 = func.call @cc_make_string(%1050, %1051) : (!llvm.ptr, i64) -> i64
      %1053 = func.call @cc_nil_value() : () -> i64
      %1054 = func.call @cc_intern(%1052, %1053) : (i64, i64) -> i64
      %1055 = func.call @cc_nil_value() : () -> i64
      %1056 = func.call @cc_cons(%1054, %1055) : (i64, i64) -> i64
      %1057 = func.call @cc_values_pack(%1056) : (i64) -> i64
      func.call @stack_push_pointer(%1054) : (i64) -> ()
      %1058 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1059 = arith.constant 1 : i64
      %1060 = func.call @cc_make_string(%1058, %1059) : (!llvm.ptr, i64) -> i64
      %1061 = func.call @cc_nil_value() : () -> i64
      %1062 = func.call @cc_intern(%1060, %1061) : (i64, i64) -> i64
      %1063 = func.call @cc_nil_value() : () -> i64
      %1064 = func.call @cc_cons(%1062, %1063) : (i64, i64) -> i64
      %1065 = func.call @cc_values_pack(%1064) : (i64) -> i64
      func.call @stack_push_pointer(%1062) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1066 = func.call @stack_pop_pointer() : () -> i64
      %1067 = func.call @stack_pop_pointer() : () -> i64
      %1068 = func.call @cc_cons(%1067, %1066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1068) : (i64) -> ()
      %1069 = func.call @stack_pop_pointer() : () -> i64
      %1070 = func.call @stack_pop_pointer() : () -> i64
      %1071 = func.call @cc_cons(%1070, %1069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1071) : (i64) -> ()
      %1072 = func.call @stack_pop_pointer() : () -> i64
      %1073 = func.call @stack_pop_pointer() : () -> i64
      %1074 = func.call @cc_cons(%1073, %1072) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1074) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1075 = func.call @stack_pop_pointer() : () -> i64
      %1076 = func.call @stack_pop_pointer() : () -> i64
      %1077 = func.call @cc_cons(%1076, %1075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1077) : (i64) -> ()
      %1078 = func.call @stack_pop_pointer() : () -> i64
      %1079 = func.call @stack_pop_pointer() : () -> i64
      %1080 = func.call @cc_cons(%1079, %1078) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1080) : (i64) -> ()
      %1081 = func.call @stack_pop_pointer() : () -> i64
      %1082 = func.call @stack_pop_pointer() : () -> i64
      %1083 = func.call @cc_cons(%1082, %1081) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1083) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1084 = func.call @stack_pop_pointer() : () -> i64
      %1085 = func.call @stack_pop_pointer() : () -> i64
      %1086 = func.call @cc_cons(%1085, %1084) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1086) : (i64) -> ()
      %1087 = func.call @stack_pop_pointer() : () -> i64
      %1088 = func.call @stack_pop_pointer() : () -> i64
      %1089 = func.call @cc_cons(%1088, %1087) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1089) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1090 = func.call @stack_pop_pointer() : () -> i64
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @cc_cons(%1091, %1090) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1092) : (i64) -> ()
      %1093 = func.call @stack_pop_pointer() : () -> i64
      %1094 = func.call @stack_pop_pointer() : () -> i64
      %1095 = func.call @cc_cons(%1094, %1093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1095) : (i64) -> ()
      %1096 = func.call @stack_pop_pointer() : () -> i64
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @cc_cons(%1097, %1096) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1098) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1099 = func.call @stack_pop_pointer() : () -> i64
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @cc_cons(%1100, %1099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1101) : (i64) -> ()
      %1102 = func.call @stack_pop_pointer() : () -> i64
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @cc_cons(%1103, %1102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1104) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1105 = func.call @stack_pop_pointer() : () -> i64
      %1106 = func.call @stack_pop_pointer() : () -> i64
      %1107 = func.call @cc_cons(%1106, %1105) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1107) : (i64) -> ()
      %1108 = func.call @stack_pop_pointer() : () -> i64
      %1109 = func.call @stack_pop_pointer() : () -> i64
      %1110 = func.call @cc_cons(%1109, %1108) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1110) : (i64) -> ()
      %1111 = func.call @stack_pop_pointer() : () -> i64
      %1214 = arith.constant 210468094345224 : i64
      %1215 = arith.constant 0 : i64
      %1216 = func.call @cc_make_closure(%1214, %1215) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1216) : (i64) -> ()
      %1217 = func.call @stack_pop_pointer() : () -> i64
      %1218 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1219 = arith.constant 1 : i64
      %1220 = func.call @cc_make_string(%1218, %1219) : (!llvm.ptr, i64) -> i64
      %1221 = func.call @cc_nil_value() : () -> i64
      %1222 = func.call @cc_intern(%1220, %1221) : (i64, i64) -> i64
      %1223 = func.call @cc_nil_value() : () -> i64
      %1224 = func.call @cc_cons(%1222, %1223) : (i64, i64) -> i64
      %1225 = func.call @cc_values_pack(%1224) : (i64) -> i64
      func.call @stack_push_pointer(%1222) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1226 = func.call @stack_pop_pointer() : () -> i64
      %1227 = func.call @stack_pop_pointer() : () -> i64
      %1228 = func.call @cc_cons(%1227, %1226) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1228) : (i64) -> ()
      %1229 = func.call @stack_pop_pointer() : () -> i64
      %1230 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1231 = arith.constant 11 : i64
      %1232 = func.call @cc_make_string(%1230, %1231) : (!llvm.ptr, i64) -> i64
      %1233 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1234 = arith.constant 7 : i64
      %1235 = func.call @cc_make_string(%1233, %1234) : (!llvm.ptr, i64) -> i64
      %1236 = func.call @cc_intern(%1232, %1235) : (i64, i64) -> i64
      %1237 = func.call @cc_nil_value() : () -> i64
      %1238 = func.call @cc_cons(%1236, %1237) : (i64, i64) -> i64
      %1239 = func.call @cc_values_pack(%1238) : (i64) -> i64
      func.call @stack_push_pointer(%1236) : (i64) -> ()
      %1240 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1241 = func.call @stack_pop_pointer() : () -> i64
      %1242 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1243 = arith.constant 4 : i64
      %1244 = func.call @cc_make_string(%1242, %1243) : (!llvm.ptr, i64) -> i64
      %1245 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1246 = arith.constant 7 : i64
      %1247 = func.call @cc_make_string(%1245, %1246) : (!llvm.ptr, i64) -> i64
      %1248 = func.call @cc_intern(%1244, %1247) : (i64, i64) -> i64
      %1249 = func.call @cc_nil_value() : () -> i64
      %1250 = func.call @cc_cons(%1248, %1249) : (i64, i64) -> i64
      %1251 = func.call @cc_values_pack(%1250) : (i64) -> i64
      func.call @stack_push_pointer(%1248) : (i64) -> ()
      %1252 = func.call @stack_pop_pointer() : () -> i64
      %1253 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1254 = arith.constant 6 : i64
      %1255 = func.call @cc_make_string(%1253, %1254) : (!llvm.ptr, i64) -> i64
      %1256 = func.call @cc_nil_value() : () -> i64
      %1257 = func.call @cc_intern(%1255, %1256) : (i64, i64) -> i64
      %1258 = func.call @cc_nil_value() : () -> i64
      %1259 = func.call @cc_cons(%1257, %1258) : (i64, i64) -> i64
      %1260 = func.call @cc_values_pack(%1259) : (i64) -> i64
      func.call @stack_push_pointer(%1257) : (i64) -> ()
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = func.call @cc_nil_value() : () -> i64
      %1263 = func.call @cc_errorp(%929) : (i64) -> i64
      %1264 = arith.cmpi ne, %1263, %1262 : i64
      %1265 = arith.cmpi eq, %1262, %1262 : i64
      %1266 = arith.andi %1264, %1265 : i1
      %1267 = scf.if %1266 -> (i64) {
        scf.yield %929 : i64
      } else {
        scf.yield %1262 : i64
      }
      %1268 = func.call @cc_errorp(%1111) : (i64) -> i64
      %1269 = arith.cmpi ne, %1268, %1262 : i64
      %1270 = arith.cmpi eq, %1267, %1262 : i64
      %1271 = arith.andi %1269, %1270 : i1
      %1272 = scf.if %1271 -> (i64) {
        scf.yield %1111 : i64
      } else {
        scf.yield %1267 : i64
      }
      %1273 = func.call @cc_errorp(%1217) : (i64) -> i64
      %1274 = arith.cmpi ne, %1273, %1262 : i64
      %1275 = arith.cmpi eq, %1272, %1262 : i64
      %1276 = arith.andi %1274, %1275 : i1
      %1277 = scf.if %1276 -> (i64) {
        scf.yield %1217 : i64
      } else {
        scf.yield %1272 : i64
      }
      %1278 = func.call @cc_errorp(%1229) : (i64) -> i64
      %1279 = arith.cmpi ne, %1278, %1262 : i64
      %1280 = arith.cmpi eq, %1277, %1262 : i64
      %1281 = arith.andi %1279, %1280 : i1
      %1282 = scf.if %1281 -> (i64) {
        scf.yield %1229 : i64
      } else {
        scf.yield %1277 : i64
      }
      %1283 = func.call @cc_errorp(%1240) : (i64) -> i64
      %1284 = arith.cmpi ne, %1283, %1262 : i64
      %1285 = arith.cmpi eq, %1282, %1262 : i64
      %1286 = arith.andi %1284, %1285 : i1
      %1287 = scf.if %1286 -> (i64) {
        scf.yield %1240 : i64
      } else {
        scf.yield %1282 : i64
      }
      %1288 = func.call @cc_errorp(%1241) : (i64) -> i64
      %1289 = arith.cmpi ne, %1288, %1262 : i64
      %1290 = arith.cmpi eq, %1287, %1262 : i64
      %1291 = arith.andi %1289, %1290 : i1
      %1292 = scf.if %1291 -> (i64) {
        scf.yield %1241 : i64
      } else {
        scf.yield %1287 : i64
      }
      %1293 = func.call @cc_errorp(%1252) : (i64) -> i64
      %1294 = arith.cmpi ne, %1293, %1262 : i64
      %1295 = arith.cmpi eq, %1292, %1262 : i64
      %1296 = arith.andi %1294, %1295 : i1
      %1297 = scf.if %1296 -> (i64) {
        scf.yield %1252 : i64
      } else {
        scf.yield %1292 : i64
      }
      %1298 = func.call @cc_errorp(%1261) : (i64) -> i64
      %1299 = arith.cmpi ne, %1298, %1262 : i64
      %1300 = arith.cmpi eq, %1297, %1262 : i64
      %1301 = arith.andi %1299, %1300 : i1
      %1302 = scf.if %1301 -> (i64) {
        scf.yield %1261 : i64
      } else {
        scf.yield %1297 : i64
      }
      %1303 = arith.cmpi ne, %1302, %1262 : i64
      scf.if %1303 {
        func.call @stack_push_pointer(%1302) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%929) : (i64) -> ()
        func.call @stack_push_pointer(%1111) : (i64) -> ()
        func.call @stack_push_pointer(%1217) : (i64) -> ()
        func.call @stack_push_pointer(%1229) : (i64) -> ()
        func.call @stack_push_pointer(%1240) : (i64) -> ()
        func.call @stack_push_pointer(%1241) : (i64) -> ()
        func.call @stack_push_pointer(%1252) : (i64) -> ()
        func.call @stack_push_pointer(%1261) : (i64) -> ()
        %1304 = llvm.mlir.addressof @str96 : !llvm.ptr
        %1305 = func.call @cc_make_function_ref_const(%1304) : (!llvm.ptr) -> i64
        %1306 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1305, %1306) : (i64, i64) -> ()
      }
      %1307 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1307 : i64
    }
    func.call @stack_push_pointer(%920) : (i64) -> ()
    %1308 = func.call @stack_pop_pointer() : () -> i64
    %1309 = func.call @cc_multiple_value_list(%1308) : (i64) -> i64
    %1310 = llvm.mlir.addressof @str97 : !llvm.ptr
    %1311 = arith.constant 38 : i64
    %1312 = func.call @cc_make_string(%1310, %1311) : (!llvm.ptr, i64) -> i64
    %1313 = func.call @cc_nil_value() : () -> i64
    %1314 = func.call @cc_intern(%1312, %1313) : (i64, i64) -> i64
    %1315 = func.call @cc_nil_value() : () -> i64
    %1316 = func.call @cc_cons(%1314, %1315) : (i64, i64) -> i64
    %1317 = func.call @cc_values_pack(%1316) : (i64) -> i64
    %1318 = func.call @cc_symbol_value(%1314) : (i64) -> i64
    %1319 = llvm.mlir.addressof @str98 : !llvm.ptr
    %1320 = arith.constant 40 : i64
    %1321 = func.call @cc_make_string(%1319, %1320) : (!llvm.ptr, i64) -> i64
    %1322 = func.call @cc_nil_value() : () -> i64
    %1323 = func.call @cc_intern(%1321, %1322) : (i64, i64) -> i64
    %1324 = func.call @cc_nil_value() : () -> i64
    %1325 = func.call @cc_cons(%1323, %1324) : (i64, i64) -> i64
    %1326 = func.call @cc_values_pack(%1325) : (i64) -> i64
    %1327 = func.call @cc_symbol_value(%1323) : (i64) -> i64
    %1328 = func.call @cc_nil_value() : () -> i64
    %1329 = arith.cmpi ne, %1318, %1328 : i64
    %1330 = scf.if %1329 -> (i64) {
      scf.yield %1327 : i64
    } else {
      scf.yield %1309 : i64
    }
    %1331 = func.call @cc_values_pack(%1330) : (i64) -> i64
    func.call @stack_push_pointer(%1331) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_210468094345220"() {
    %602 = func.call @stack_pop_pointer() : () -> i64
    %603 = func.call @stack_pop_pointer() : () -> i64
    %604 = func.call @stack_pop_pointer() : () -> i64
    %605 = func.call @cc_nil_value() : () -> i64
    %606 = func.call @cc_nil_value() : () -> i64
    %607 = func.call @cc_errorp(%605) : (i64) -> i64
    %608 = arith.cmpi ne, %607, %606 : i64
    %609 = scf.if %608 -> (i64) {
      scf.yield %605 : i64
    } else {
      %610 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%610) : (i64) -> ()
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = func.call @cc_set_symbol_value(%604, %611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%611) : (i64) -> ()
      %613 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %613 : i64
    }
    %614 = func.call @cc_nil_value() : () -> i64
    %615 = func.call @cc_errorp(%609) : (i64) -> i64
    %616 = arith.cmpi ne, %615, %614 : i64
    %617 = scf.if %616 -> (i64) {
      scf.yield %609 : i64
    } else {
      func.call @stack_push_pointer(%602) : (i64) -> ()
      %618 = func.call @stack_pop_pointer() : () -> i64
      %619 = func.call @cc_nil_value() : () -> i64
      %620 = func.call @cc_errorp(%618) : (i64) -> i64
      %621 = arith.cmpi ne, %620, %619 : i64
      %622 = arith.cmpi eq, %619, %619 : i64
      %623 = arith.andi %621, %622 : i1
      %624 = scf.if %623 -> (i64) {
        scf.yield %618 : i64
      } else {
        scf.yield %619 : i64
      }
      %625 = arith.cmpi ne, %624, %619 : i64
      scf.if %625 {
        func.call @stack_push_pointer(%624) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%618) : (i64) -> ()
        %626 = llvm.mlir.addressof @str59 : !llvm.ptr
        %627 = func.call @cc_make_function_ref_const(%626) : (!llvm.ptr) -> i64
        %628 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%627, %628) : (i64, i64) -> ()
      }
      %629 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %629 : i64
    }
    func.call @stack_push_pointer(%617) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_210468094345221"() {
    %661 = func.call @stack_pop_pointer() : () -> i64
    %662 = func.call @stack_pop_pointer() : () -> i64
    %663 = func.call @cc_nil_value() : () -> i64
    %664 = func.call @cc_nil_value() : () -> i64
    %665 = func.call @cc_errorp(%663) : (i64) -> i64
    %666 = arith.cmpi ne, %665, %664 : i64
    %667 = scf.if %666 -> (i64) {
      scf.yield %663 : i64
    } else {
      %668 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%668) : (i64) -> ()
      %669 = func.call @stack_pop_pointer() : () -> i64
      %670 = func.call @cc_nil_value() : () -> i64
      %671 = func.call @cc_nil_value() : () -> i64
      %672 = func.call @cc_errorp(%670) : (i64) -> i64
      %673 = arith.cmpi ne, %672, %671 : i64
      %674 = scf.if %673 -> (i64) {
        scf.yield %670 : i64
      } else {
        %675 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%675) : (i64) -> ()
        %676 = func.call @stack_pop_pointer() : () -> i64
        %677 = arith.constant 2 : i64
        func.call @stack_push_fixnum(%677) : (i64) -> ()
        %678 = func.call @stack_pop_pointer() : () -> i64
        %679 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%679) : (i64) -> ()
        %680 = func.call @stack_pop_pointer() : () -> i64
        %681 = func.call @cc_nil_value() : () -> i64
        %682 = func.call @cc_errorp(%676) : (i64) -> i64
        %683 = arith.cmpi ne, %682, %681 : i64
        %684 = arith.cmpi eq, %681, %681 : i64
        %685 = arith.andi %683, %684 : i1
        %686 = scf.if %685 -> (i64) {
          scf.yield %676 : i64
        } else {
          scf.yield %681 : i64
        }
        %687 = func.call @cc_errorp(%678) : (i64) -> i64
        %688 = arith.cmpi ne, %687, %681 : i64
        %689 = arith.cmpi eq, %686, %681 : i64
        %690 = arith.andi %688, %689 : i1
        %691 = scf.if %690 -> (i64) {
          scf.yield %678 : i64
        } else {
          scf.yield %686 : i64
        }
        %692 = func.call @cc_errorp(%680) : (i64) -> i64
        %693 = arith.cmpi ne, %692, %681 : i64
        %694 = arith.cmpi eq, %691, %681 : i64
        %695 = arith.andi %693, %694 : i1
        %696 = scf.if %695 -> (i64) {
          scf.yield %680 : i64
        } else {
          scf.yield %691 : i64
        }
        %697 = arith.cmpi ne, %696, %681 : i64
        scf.if %697 {
          func.call @stack_push_pointer(%696) : (i64) -> ()
        } else {
          %698 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%698) : (i64) -> ()
          func.call @stack_push_pointer(%680) : (i64) -> ()
          %699 = func.call @stack_pop_pointer() : () -> i64
          %700 = func.call @stack_pop_pointer() : () -> i64
          %701 = func.call @cc_cons(%699, %700) : (i64, i64) -> i64
          func.call @stack_push_pointer(%701) : (i64) -> ()
          func.call @stack_push_pointer(%678) : (i64) -> ()
          %702 = func.call @stack_pop_pointer() : () -> i64
          %703 = func.call @stack_pop_pointer() : () -> i64
          %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
          func.call @stack_push_pointer(%704) : (i64) -> ()
          func.call @stack_push_pointer(%676) : (i64) -> ()
          %705 = func.call @stack_pop_pointer() : () -> i64
          %706 = func.call @stack_pop_pointer() : () -> i64
          %707 = func.call @cc_cons(%705, %706) : (i64, i64) -> i64
          func.call @stack_push_pointer(%707) : (i64) -> ()
        }
        %708 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%669) : (i64) -> ()
        %709 = func.call @stack_pop_pointer() : () -> i64
        %710 = func.call @cc_nil_value() : () -> i64
        %711 = func.call @cc_errorp(%708) : (i64) -> i64
        %712 = arith.cmpi ne, %711, %710 : i64
        %713 = arith.cmpi eq, %710, %710 : i64
        %714 = arith.andi %712, %713 : i1
        %715 = scf.if %714 -> (i64) {
          scf.yield %708 : i64
        } else {
          scf.yield %710 : i64
        }
        %716 = func.call @cc_errorp(%709) : (i64) -> i64
        %717 = arith.cmpi ne, %716, %710 : i64
        %718 = arith.cmpi eq, %715, %710 : i64
        %719 = arith.andi %717, %718 : i1
        %720 = scf.if %719 -> (i64) {
          scf.yield %709 : i64
        } else {
          scf.yield %715 : i64
        }
        %721 = arith.cmpi ne, %720, %710 : i64
        scf.if %721 {
          func.call @stack_push_pointer(%720) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%708) : (i64) -> ()
          func.call @stack_push_pointer(%709) : (i64) -> ()
          %722 = llvm.mlir.addressof @str63 : !llvm.ptr
          %723 = func.call @cc_make_function_ref_const(%722) : (!llvm.ptr) -> i64
          %724 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%723, %724) : (i64, i64) -> ()
        }
        %725 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %726 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%669) : (i64) -> ()
        %727 = func.call @stack_pop_pointer() : () -> i64
        %728 = func.call @cc_symbol_value(%662) : (i64) -> i64
        func.call @stack_push_pointer(%728) : (i64) -> ()
        %729 = func.call @stack_pop_pointer() : () -> i64
        %731 = arith.constant 3 : i64
        %730 = arith.andi %727, %731 : i64
        %732 = arith.constant 0 : i64
        %733 = arith.cmpi eq, %730, %732 : i64
        %735 = arith.constant 3 : i64
        %734 = arith.andi %729, %735 : i64
        %736 = arith.constant 0 : i64
        %737 = arith.cmpi eq, %734, %736 : i64
        %738 = arith.andi %733, %737 : i1
        %739 = scf.if %738 -> (i64) {
          %740 = arith.constant 2 : i64
          %741 = arith.shrsi %727, %740 : i64
          %742 = arith.constant 2 : i64
          %743 = arith.shrsi %729, %742 : i64
          %744 = arith.addi %741, %743 : i64
          %745 = arith.constant -2305843009213693952 : i64
          %746 = arith.constant 2305843009213693951 : i64
          %747 = arith.cmpi sge, %744, %745 : i64
          %748 = arith.cmpi sle, %744, %746 : i64
          %749 = arith.andi %747, %748 : i1
          %750 = scf.if %749 -> (i64) {
            %751 = arith.constant 2 : i64
            %752 = arith.shli %744, %751 : i64
            scf.yield %752 : i64
          } else {
            %753 = func.call @cc_add(%727, %729) : (i64, i64) -> i64
            scf.yield %753 : i64
          }
          scf.yield %750 : i64
        } else {
          %754 = func.call @cc_add(%727, %729) : (i64, i64) -> i64
          scf.yield %754 : i64
        }
        %755 = func.call @cc_set_symbol_value(%661, %739) : (i64, i64) -> i64
        func.call @stack_push_pointer(%739) : (i64) -> ()
        %756 = func.call @stack_pop_pointer() : () -> i64
        %757 = func.call @cc_nil_value() : () -> i64
        %758 = func.call @cc_errorp(%725) : (i64) -> i64
        %759 = arith.cmpi ne, %758, %757 : i64
        %760 = arith.cmpi eq, %757, %757 : i64
        %761 = arith.andi %759, %760 : i1
        %762 = scf.if %761 -> (i64) {
          scf.yield %725 : i64
        } else {
          scf.yield %757 : i64
        }
        %763 = func.call @cc_errorp(%726) : (i64) -> i64
        %764 = arith.cmpi ne, %763, %757 : i64
        %765 = arith.cmpi eq, %762, %757 : i64
        %766 = arith.andi %764, %765 : i1
        %767 = scf.if %766 -> (i64) {
          scf.yield %726 : i64
        } else {
          scf.yield %762 : i64
        }
        %768 = func.call @cc_errorp(%756) : (i64) -> i64
        %769 = arith.cmpi ne, %768, %757 : i64
        %770 = arith.cmpi eq, %767, %757 : i64
        %771 = arith.andi %769, %770 : i1
        %772 = scf.if %771 -> (i64) {
          scf.yield %756 : i64
        } else {
          scf.yield %767 : i64
        }
        %773 = arith.cmpi ne, %772, %757 : i64
        scf.if %773 {
          func.call @stack_push_pointer(%772) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%725) : (i64) -> ()
          func.call @stack_push_pointer(%726) : (i64) -> ()
          func.call @stack_push_pointer(%756) : (i64) -> ()
          %774 = llvm.mlir.addressof @str64 : !llvm.ptr
          %775 = func.call @cc_make_function_ref_const(%774) : (!llvm.ptr) -> i64
          %776 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%775, %776) : (i64, i64) -> ()
        }
        %777 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %777 : i64
      }
      func.call @stack_push_pointer(%674) : (i64) -> ()
      %778 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %778 : i64
    }
    func.call @stack_push_pointer(%667) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_210468094345217"() {
    %586 = func.call @cc_nil_value() : () -> i64
    %587 = func.call @cc_nil_value() : () -> i64
    %588 = func.call @cc_errorp(%586) : (i64) -> i64
    %589 = arith.cmpi ne, %588, %587 : i64
    %590 = scf.if %589 -> (i64) {
      scf.yield %586 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %591 = func.call @stack_pop_pointer() : () -> i64
      %592 = llvm.mlir.addressof @str58 : !llvm.ptr
      %593 = arith.constant 37 : i64
      %594 = func.call @cc_make_symbol(%592, %593) : (!llvm.ptr, i64) -> i64
      %595 = func.call @cc_persistent_root_value(%594) : (i64) -> i64
      %596 = func.call @cc_set_symbol_value(%595, %591) : (i64, i64) -> i64
      %597 = func.call @cc_nil_value() : () -> i64
      %598 = func.call @cc_nil_value() : () -> i64
      %599 = func.call @cc_errorp(%597) : (i64) -> i64
      %600 = arith.cmpi ne, %599, %598 : i64
      %601 = scf.if %600 -> (i64) {
        scf.yield %597 : i64
      } else {
        func.call @stack_push_pointer(%595) : (i64) -> ()
        %630 = arith.constant 210468094345220 : i64
        %631 = arith.constant 1 : i64
        %632 = func.call @cc_make_closure(%630, %631) : (i64, i64) -> i64
        %633 = llvm.mlir.addressof @str60 : !llvm.ptr
        %634 = arith.constant 14 : i64
        %635 = func.call @cc_bind_function_object_const(%633, %634, %632) : (!llvm.ptr, i64, i64) -> i64
        %636 = func.call @cc_nil_value() : () -> i64
        %637 = llvm.mlir.addressof @str61 : !llvm.ptr
        %638 = arith.constant 7 : i64
        %639 = func.call @cc_make_string(%637, %638) : (!llvm.ptr, i64) -> i64
        %640 = llvm.mlir.addressof @str62 : !llvm.ptr
        %641 = arith.constant 11 : i64
        %642 = func.call @cc_make_string(%640, %641) : (!llvm.ptr, i64) -> i64
        %643 = func.call @cc_intern(%639, %642) : (i64, i64) -> i64
        %644 = func.call @cc_nil_value() : () -> i64
        %645 = func.call @cc_cons(%643, %644) : (i64, i64) -> i64
        %646 = func.call @cc_values_pack(%645) : (i64) -> i64
        func.call @stack_push_pointer(%643) : (i64) -> ()
        %647 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%632) : (i64) -> ()
        %648 = func.call @stack_pop_pointer() : () -> i64
        %649 = func.call @cc_cons(%647, %648) : (i64, i64) -> i64
        %650 = func.call @cc_cons(%649, %636) : (i64, i64) -> i64
        %651 = func.call @cc_push_handler_frame(%650) : (i64) -> i64
        %652 = func.call @cc_errorp(%651) : (i64) -> i64
        %653 = func.call @cc_nil_value() : () -> i64
        %654 = arith.cmpi ne, %652, %653 : i64
        %655 = scf.if %654 -> (i64) {
          scf.yield %651 : i64
        } else {
          %656 = func.call @cc_nil_value() : () -> i64
          %657 = func.call @cc_nil_value() : () -> i64
          %658 = func.call @cc_errorp(%656) : (i64) -> i64
          %659 = arith.cmpi ne, %658, %657 : i64
          %660 = scf.if %659 -> (i64) {
            scf.yield %656 : i64
          } else {
            %779 = llvm.mlir.addressof @str65 : !llvm.ptr
            %780 = arith.constant 30 : i64
            %781 = func.call @cc_make_symbol(%779, %780) : (!llvm.ptr, i64) -> i64
            %782 = func.call @cc_persistent_root_value(%781) : (i64) -> i64
            func.call @stack_push_pointer(%782) : (i64) -> ()
            %783 = llvm.mlir.addressof @str66 : !llvm.ptr
            %784 = arith.constant 32 : i64
            %785 = func.call @cc_make_symbol(%783, %784) : (!llvm.ptr, i64) -> i64
            %786 = func.call @cc_persistent_root_value(%785) : (i64) -> i64
            func.call @stack_push_pointer(%786) : (i64) -> ()
            %787 = arith.constant 210468094345221 : i64
            %788 = arith.constant 2 : i64
            %789 = func.call @cc_make_closure(%787, %788) : (i64, i64) -> i64
            func.call @stack_push_pointer(%789) : (i64) -> ()
            %790 = func.call @stack_pop_pointer() : () -> i64
            %791 = func.call @cc_nil_value() : () -> i64
            %792 = func.call @cc_cons(%791, %791) : (i64, i64) -> i64
            %793 = func.call @cc_cons(%791, %792) : (i64, i64) -> i64
            %794 = func.call @cc_cons(%790, %793) : (i64, i64) -> i64
            %795 = func.call @cc_values_pack(%794) : (i64) -> i64
            func.call @stack_push_pointer(%795) : (i64) -> ()
            %796 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %796 : i64
          }
          func.call @stack_push_pointer(%660) : (i64) -> ()
          %797 = func.call @stack_pop_pointer() : () -> i64
          %798 = func.call @cc_pop_handler_frame() : () -> i64
          scf.yield %797 : i64
        }
        func.call @stack_push_pointer(%655) : (i64) -> ()
        %799 = func.call @stack_pop_pointer() : () -> i64
        %800 = func.call @cc_multiple_value_list(%799) : (i64) -> i64
        %801 = func.call @cc_symbol_value(%595) : (i64) -> i64
        %802 = func.call @cc_values_pack(%800) : (i64) -> i64
        func.call @stack_push_pointer(%802) : (i64) -> ()
        %803 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %803 : i64
      }
      %804 = func.call @cc_nil_value() : () -> i64
      %805 = func.call @cc_errorp(%601) : (i64) -> i64
      %806 = arith.cmpi ne, %805, %804 : i64
      %807 = scf.if %806 -> (i64) {
        scf.yield %601 : i64
      } else {
        %808 = func.call @cc_symbol_value(%595) : (i64) -> i64
        func.call @stack_push_pointer(%808) : (i64) -> ()
        %809 = func.call @stack_pop_pointer() : () -> i64
        %810 = func.call @cc_nil_value() : () -> i64
        %811 = func.call @cc_cons(%809, %810) : (i64, i64) -> i64
        %812 = func.call @cc_not(%811) : (i64) -> i64
        func.call @stack_push_pointer(%812) : (i64) -> ()
        %813 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %813 : i64
      }
      func.call @stack_push_pointer(%807) : (i64) -> ()
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = func.call @cc_nil_value() : () -> i64
      %816 = func.call @cc_cons(%814, %815) : (i64, i64) -> i64
      %817 = func.call @cc_not(%816) : (i64) -> i64
      func.call @stack_push_pointer(%817) : (i64) -> ()
      %818 = func.call @stack_pop_pointer() : () -> i64
      %819 = func.call @cc_nil_value() : () -> i64
      %820 = func.call @cc_cons(%818, %819) : (i64, i64) -> i64
      %821 = func.call @cc_not(%820) : (i64) -> i64
      func.call @stack_push_pointer(%821) : (i64) -> ()
      %822 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %822 : i64
    }
    func.call @stack_push_pointer(%590) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_210468094345224"() {
    %1112 = func.call @cc_nil_value() : () -> i64
    %1113 = func.call @cc_nil_value() : () -> i64
    %1114 = func.call @cc_errorp(%1112) : (i64) -> i64
    %1115 = arith.cmpi ne, %1114, %1113 : i64
    %1116 = scf.if %1115 -> (i64) {
      scf.yield %1112 : i64
    } else {
      %1117 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1117) : (i64) -> ()
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @cc_nil_value() : () -> i64
      %1120 = func.call @cc_nil_value() : () -> i64
      %1121 = func.call @cc_errorp(%1119) : (i64) -> i64
      %1122 = arith.cmpi ne, %1121, %1120 : i64
      %1123:2 = scf.if %1122 -> (i64, i64) {
        scf.yield %1119, %1118 : i64, i64
      } else {
        %1124 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%1124) : (i64) -> ()
        %1125 = func.call @stack_pop_pointer() : () -> i64
        %1126 = arith.constant 2 : i64
        func.call @stack_push_fixnum(%1126) : (i64) -> ()
        %1127 = func.call @stack_pop_pointer() : () -> i64
        %1128 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%1128) : (i64) -> ()
        %1129 = func.call @stack_pop_pointer() : () -> i64
        %1130 = func.call @cc_nil_value() : () -> i64
        %1131 = func.call @cc_errorp(%1125) : (i64) -> i64
        %1132 = arith.cmpi ne, %1131, %1130 : i64
        %1133 = arith.cmpi eq, %1130, %1130 : i64
        %1134 = arith.andi %1132, %1133 : i1
        %1135 = scf.if %1134 -> (i64) {
          scf.yield %1125 : i64
        } else {
          scf.yield %1130 : i64
        }
        %1136 = func.call @cc_errorp(%1127) : (i64) -> i64
        %1137 = arith.cmpi ne, %1136, %1130 : i64
        %1138 = arith.cmpi eq, %1135, %1130 : i64
        %1139 = arith.andi %1137, %1138 : i1
        %1140 = scf.if %1139 -> (i64) {
          scf.yield %1127 : i64
        } else {
          scf.yield %1135 : i64
        }
        %1141 = func.call @cc_errorp(%1129) : (i64) -> i64
        %1142 = arith.cmpi ne, %1141, %1130 : i64
        %1143 = arith.cmpi eq, %1140, %1130 : i64
        %1144 = arith.andi %1142, %1143 : i1
        %1145 = scf.if %1144 -> (i64) {
          scf.yield %1129 : i64
        } else {
          scf.yield %1140 : i64
        }
        %1146 = arith.cmpi ne, %1145, %1130 : i64
        scf.if %1146 {
          func.call @stack_push_pointer(%1145) : (i64) -> ()
        } else {
          %1147 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%1147) : (i64) -> ()
          func.call @stack_push_pointer(%1129) : (i64) -> ()
          %1148 = func.call @stack_pop_pointer() : () -> i64
          %1149 = func.call @stack_pop_pointer() : () -> i64
          %1150 = func.call @cc_cons(%1148, %1149) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1150) : (i64) -> ()
          func.call @stack_push_pointer(%1127) : (i64) -> ()
          %1151 = func.call @stack_pop_pointer() : () -> i64
          %1152 = func.call @stack_pop_pointer() : () -> i64
          %1153 = func.call @cc_cons(%1151, %1152) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1153) : (i64) -> ()
          func.call @stack_push_pointer(%1125) : (i64) -> ()
          %1154 = func.call @stack_pop_pointer() : () -> i64
          %1155 = func.call @stack_pop_pointer() : () -> i64
          %1156 = func.call @cc_cons(%1154, %1155) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1156) : (i64) -> ()
        }
        %1157 = func.call @stack_pop_pointer() : () -> i64
        %1158:2 = scf.while (%arg0 = %1157, %arg1 = %1118) : (i64, i64) -> (i64, i64) {
          %1159 = func.call @cc_is_cons(%arg0) : (i64) -> i32
          %1160 = arith.constant 0 : i32
          %1161 = arith.cmpi ne, %1159, %1160 : i32
          scf.condition(%1161) %arg0, %arg1 : i64, i64
        } do {
          ^bb0(%1162: i64, %1163: i64):
          %1164 = func.call @cc_car(%1162) : (i64) -> i64
          func.call @stack_push_pointer(%1163) : (i64) -> ()
          %1165 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1164) : (i64) -> ()
          %1166 = func.call @stack_pop_pointer() : () -> i64
          %1168 = arith.constant 3 : i64
          %1167 = arith.andi %1165, %1168 : i64
          %1169 = arith.constant 0 : i64
          %1170 = arith.cmpi eq, %1167, %1169 : i64
          %1172 = arith.constant 3 : i64
          %1171 = arith.andi %1166, %1172 : i64
          %1173 = arith.constant 0 : i64
          %1174 = arith.cmpi eq, %1171, %1173 : i64
          %1175 = arith.andi %1170, %1174 : i1
          %1176 = scf.if %1175 -> (i64) {
            %1177 = arith.constant 2 : i64
            %1178 = arith.shrsi %1165, %1177 : i64
            %1179 = arith.constant 2 : i64
            %1180 = arith.shrsi %1166, %1179 : i64
            %1181 = arith.addi %1178, %1180 : i64
            %1182 = arith.constant -2305843009213693952 : i64
            %1183 = arith.constant 2305843009213693951 : i64
            %1184 = arith.cmpi sge, %1181, %1182 : i64
            %1185 = arith.cmpi sle, %1181, %1183 : i64
            %1186 = arith.andi %1184, %1185 : i1
            %1187 = scf.if %1186 -> (i64) {
              %1188 = arith.constant 2 : i64
              %1189 = arith.shli %1181, %1188 : i64
              scf.yield %1189 : i64
            } else {
              %1190 = func.call @cc_add(%1165, %1166) : (i64, i64) -> i64
              scf.yield %1190 : i64
            }
            scf.yield %1187 : i64
          } else {
            %1191 = func.call @cc_add(%1165, %1166) : (i64, i64) -> i64
            scf.yield %1191 : i64
          }
          func.call @stack_push_pointer(%1176) : (i64) -> ()
          %1192 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1192) : (i64) -> ()
          %1193 = func.call @stack_depth() : () -> i64
          %1194 = arith.constant 0 : i64
          %1195 = arith.cmpi sgt, %1193, %1194 : i64
          scf.if %1195 {
            %1196 = func.call @stack_pop_pointer() : () -> i64
          }
          %1197 = func.call @cc_cdr(%1162) : (i64) -> i64
          scf.yield %1197, %1192 : i64, i64
        }
        %1198 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%1198) : (i64) -> ()
        %1199 = func.call @stack_pop_pointer() : () -> i64
        %1200 = func.call @cc_nil_value() : () -> i64
        %1201 = arith.cmpi eq, %1199, %1200 : i64
        %1203 = func.call @cc_t_value() : () -> i64
        %1202 = arith.select %1201, %1203, %1200 : i64
        func.call @stack_push_pointer(%1202) : (i64) -> ()
        %1204 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1204, %1158#1 : i64, i64
      }
      func.call @stack_push_pointer(%1123#0) : (i64) -> ()
      %1205 = func.call @stack_pop_pointer() : () -> i64
      %1206 = func.call @cc_nil_value() : () -> i64
      %1207 = func.call @cc_cons(%1205, %1206) : (i64, i64) -> i64
      %1208 = func.call @cc_not(%1207) : (i64) -> i64
      func.call @stack_push_pointer(%1208) : (i64) -> ()
      %1209 = func.call @stack_pop_pointer() : () -> i64
      %1210 = func.call @cc_nil_value() : () -> i64
      %1211 = func.call @cc_cons(%1209, %1210) : (i64, i64) -> i64
      %1212 = func.call @cc_not(%1211) : (i64) -> i64
      func.call @stack_push_pointer(%1212) : (i64) -> ()
      %1213 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1213 : i64
    }
    func.call @stack_push_pointer(%1116) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_210468094345216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_210468094345216*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_210468094345216*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("DOLIST-DECLARE-ELEMENTS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str6("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str8("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str9("DID-WARN\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str10("FLET\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("CATCH-WARNINGS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str13("&OPTIONAL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str14("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str16("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str18("DID-WARN\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str19("MUFFLE-WARNING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str20("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("CONDITION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("HANDLER-BIND\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("WARNING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("FUNCTION\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("CATCH-WARNINGS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str30("COMPILE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("LAMBDA\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str35("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str36("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str37("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str40("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str43("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("TYPE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("FIXNUM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str50("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str53("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str54("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str56("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str57("DID-WARN\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str58("#:%%DYN-CELL-210468094345218-DID-WARN\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str59("MUFFLE-WARNING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str60("catch-warnings\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str61("WARNING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str64("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str65("#:%%DYN-CELL-210468094345222-A\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str66("#:%%DYN-CELL-210468094345223-SUM\00") : !llvm.array<33 x i8>
  llvm.mlir.global private constant @str67("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str68("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str70("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str71("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str72("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str73("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str74("DOLIST-VAR-NIL-AT-RETURN\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str75("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str76("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str77("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str78("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str79("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str80("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str81("DOLIST\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str82("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str83("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str86("INCF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str87("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str88("SUM\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str89("A\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str90("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str91("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str93("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str94("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str95("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str96("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str97("*__MLIR_BLOCK_RETFLAG_210468094345216*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str98("*__MLIR_BLOCK_RETMVLIST_210468094345216*\00") : !llvm.array<41 x i8>
}
