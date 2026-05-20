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
      %58 = arith.constant 19 : i64
      %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_intern(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = llvm.mlir.addressof @str6 : !llvm.ptr
      %67 = arith.constant 21 : i64
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
      %77 = arith.constant 17 : i64
      %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
      %79 = llvm.mlir.addressof @str9 : !llvm.ptr
      %80 = arith.constant 11 : i64
      %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
      %82 = func.call @cc_intern(%78, %81) : (i64, i64) -> i64
      %83 = func.call @cc_nil_value() : () -> i64
      %84 = func.call @cc_cons(%82, %83) : (i64, i64) -> i64
      %85 = func.call @cc_values_pack(%84) : (i64) -> i64
      func.call @stack_push_pointer(%82) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %86 = func.call @stack_pop_pointer() : () -> i64
      %87 = func.call @stack_pop_pointer() : () -> i64
      %88 = func.call @cc_cons(%87, %86) : (i64, i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %89 = llvm.mlir.addressof @str10 : !llvm.ptr
      %90 = arith.constant 12 : i64
      %91 = func.call @cc_make_string(%89, %90) : (!llvm.ptr, i64) -> i64
      %92 = llvm.mlir.addressof @str11 : !llvm.ptr
      %93 = arith.constant 11 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = func.call @cc_intern(%91, %94) : (i64, i64) -> i64
      %96 = func.call @cc_nil_value() : () -> i64
      %97 = func.call @cc_cons(%95, %96) : (i64, i64) -> i64
      %98 = func.call @cc_values_pack(%97) : (i64) -> i64
      func.call @stack_push_pointer(%95) : (i64) -> ()
      %99 = llvm.mlir.addressof @str12 : !llvm.ptr
      %100 = arith.constant 50 : i64
      %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%101) : (i64) -> ()
      %102 = llvm.mlir.addressof @str13 : !llvm.ptr
      %103 = arith.constant 7 : i64
      %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
      %105 = llvm.mlir.addressof @str14 : !llvm.ptr
      %106 = arith.constant 7 : i64
      %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
      %108 = func.call @cc_intern(%104, %107) : (i64, i64) -> i64
      %109 = func.call @cc_nil_value() : () -> i64
      %110 = func.call @cc_cons(%108, %109) : (i64, i64) -> i64
      %111 = func.call @cc_values_pack(%110) : (i64) -> i64
      func.call @stack_push_pointer(%108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %112 = llvm.mlir.addressof @str15 : !llvm.ptr
      %113 = arith.constant 5 : i64
      %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
      %115 = llvm.mlir.addressof @str16 : !llvm.ptr
      %116 = arith.constant 7 : i64
      %117 = func.call @cc_make_string(%115, %116) : (!llvm.ptr, i64) -> i64
      %118 = func.call @cc_intern(%114, %117) : (i64, i64) -> i64
      %119 = func.call @cc_nil_value() : () -> i64
      %120 = func.call @cc_cons(%118, %119) : (i64, i64) -> i64
      %121 = func.call @cc_values_pack(%120) : (i64) -> i64
      func.call @stack_push_pointer(%118) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @stack_pop_pointer() : () -> i64
      %124 = func.call @cc_cons(%123, %122) : (i64, i64) -> i64
      func.call @stack_push_pointer(%124) : (i64) -> ()
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = func.call @stack_pop_pointer() : () -> i64
      %127 = func.call @cc_cons(%126, %125) : (i64, i64) -> i64
      func.call @stack_push_pointer(%127) : (i64) -> ()
      %128 = func.call @stack_pop_pointer() : () -> i64
      %129 = func.call @stack_pop_pointer() : () -> i64
      %130 = func.call @cc_cons(%129, %128) : (i64, i64) -> i64
      func.call @stack_push_pointer(%130) : (i64) -> ()
      %131 = func.call @stack_pop_pointer() : () -> i64
      %132 = func.call @stack_pop_pointer() : () -> i64
      %133 = func.call @cc_cons(%132, %131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%133) : (i64) -> ()
      %134 = func.call @stack_pop_pointer() : () -> i64
      %135 = func.call @stack_pop_pointer() : () -> i64
      %136 = func.call @cc_cons(%135, %134) : (i64, i64) -> i64
      func.call @stack_push_pointer(%136) : (i64) -> ()
      %137 = func.call @stack_pop_pointer() : () -> i64
      %138 = func.call @stack_pop_pointer() : () -> i64
      %139 = func.call @cc_cons(%138, %137) : (i64, i64) -> i64
      func.call @stack_push_pointer(%139) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %140 = func.call @stack_pop_pointer() : () -> i64
      %141 = func.call @stack_pop_pointer() : () -> i64
      %142 = func.call @cc_cons(%141, %140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%142) : (i64) -> ()
      %143 = func.call @stack_pop_pointer() : () -> i64
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @cc_cons(%144, %143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%145) : (i64) -> ()
      %146 = func.call @stack_pop_pointer() : () -> i64
      %147 = func.call @stack_pop_pointer() : () -> i64
      %148 = func.call @cc_cons(%147, %146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%148) : (i64) -> ()
      %149 = func.call @stack_pop_pointer() : () -> i64
      %230 = arith.constant 275586643656705 : i64
      %231 = arith.constant 0 : i64
      %232 = func.call @cc_make_closure(%230, %231) : (i64, i64) -> i64
      func.call @stack_push_pointer(%232) : (i64) -> ()
      %233 = func.call @stack_pop_pointer() : () -> i64
      %234 = llvm.mlir.addressof @str24 : !llvm.ptr
      %235 = arith.constant 0 : i64
      %236 = func.call @cc_make_string(%234, %235) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%236) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @stack_pop_pointer() : () -> i64
      %239 = func.call @cc_cons(%238, %237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %240 = func.call @stack_pop_pointer() : () -> i64
      %241 = llvm.mlir.addressof @str25 : !llvm.ptr
      %242 = arith.constant 11 : i64
      %243 = func.call @cc_make_string(%241, %242) : (!llvm.ptr, i64) -> i64
      %244 = llvm.mlir.addressof @str26 : !llvm.ptr
      %245 = arith.constant 7 : i64
      %246 = func.call @cc_make_string(%244, %245) : (!llvm.ptr, i64) -> i64
      %247 = func.call @cc_intern(%243, %246) : (i64, i64) -> i64
      %248 = func.call @cc_nil_value() : () -> i64
      %249 = func.call @cc_cons(%247, %248) : (i64, i64) -> i64
      %250 = func.call @cc_values_pack(%249) : (i64) -> i64
      func.call @stack_push_pointer(%247) : (i64) -> ()
      %251 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %252 = func.call @stack_pop_pointer() : () -> i64
      %253 = llvm.mlir.addressof @str27 : !llvm.ptr
      %254 = arith.constant 4 : i64
      %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
      %256 = llvm.mlir.addressof @str28 : !llvm.ptr
      %257 = arith.constant 7 : i64
      %258 = func.call @cc_make_string(%256, %257) : (!llvm.ptr, i64) -> i64
      %259 = func.call @cc_intern(%255, %258) : (i64, i64) -> i64
      %260 = func.call @cc_nil_value() : () -> i64
      %261 = func.call @cc_cons(%259, %260) : (i64, i64) -> i64
      %262 = func.call @cc_values_pack(%261) : (i64) -> i64
      func.call @stack_push_pointer(%259) : (i64) -> ()
      %263 = func.call @stack_pop_pointer() : () -> i64
      %264 = llvm.mlir.addressof @str29 : !llvm.ptr
      %265 = arith.constant 6 : i64
      %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
      %267 = func.call @cc_nil_value() : () -> i64
      %268 = func.call @cc_intern(%266, %267) : (i64, i64) -> i64
      %269 = func.call @cc_nil_value() : () -> i64
      %270 = func.call @cc_cons(%268, %269) : (i64, i64) -> i64
      %271 = func.call @cc_values_pack(%270) : (i64) -> i64
      func.call @stack_push_pointer(%268) : (i64) -> ()
      %272 = func.call @stack_pop_pointer() : () -> i64
      %273 = func.call @cc_nil_value() : () -> i64
      %274 = func.call @cc_errorp(%65) : (i64) -> i64
      %275 = arith.cmpi ne, %274, %273 : i64
      %276 = arith.cmpi eq, %273, %273 : i64
      %277 = arith.andi %275, %276 : i1
      %278 = scf.if %277 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %273 : i64
      }
      %279 = func.call @cc_errorp(%149) : (i64) -> i64
      %280 = arith.cmpi ne, %279, %273 : i64
      %281 = arith.cmpi eq, %278, %273 : i64
      %282 = arith.andi %280, %281 : i1
      %283 = scf.if %282 -> (i64) {
        scf.yield %149 : i64
      } else {
        scf.yield %278 : i64
      }
      %284 = func.call @cc_errorp(%233) : (i64) -> i64
      %285 = arith.cmpi ne, %284, %273 : i64
      %286 = arith.cmpi eq, %283, %273 : i64
      %287 = arith.andi %285, %286 : i1
      %288 = scf.if %287 -> (i64) {
        scf.yield %233 : i64
      } else {
        scf.yield %283 : i64
      }
      %289 = func.call @cc_errorp(%240) : (i64) -> i64
      %290 = arith.cmpi ne, %289, %273 : i64
      %291 = arith.cmpi eq, %288, %273 : i64
      %292 = arith.andi %290, %291 : i1
      %293 = scf.if %292 -> (i64) {
        scf.yield %240 : i64
      } else {
        scf.yield %288 : i64
      }
      %294 = func.call @cc_errorp(%251) : (i64) -> i64
      %295 = arith.cmpi ne, %294, %273 : i64
      %296 = arith.cmpi eq, %293, %273 : i64
      %297 = arith.andi %295, %296 : i1
      %298 = scf.if %297 -> (i64) {
        scf.yield %251 : i64
      } else {
        scf.yield %293 : i64
      }
      %299 = func.call @cc_errorp(%252) : (i64) -> i64
      %300 = arith.cmpi ne, %299, %273 : i64
      %301 = arith.cmpi eq, %298, %273 : i64
      %302 = arith.andi %300, %301 : i1
      %303 = scf.if %302 -> (i64) {
        scf.yield %252 : i64
      } else {
        scf.yield %298 : i64
      }
      %304 = func.call @cc_errorp(%263) : (i64) -> i64
      %305 = arith.cmpi ne, %304, %273 : i64
      %306 = arith.cmpi eq, %303, %273 : i64
      %307 = arith.andi %305, %306 : i1
      %308 = scf.if %307 -> (i64) {
        scf.yield %263 : i64
      } else {
        scf.yield %303 : i64
      }
      %309 = func.call @cc_errorp(%272) : (i64) -> i64
      %310 = arith.cmpi ne, %309, %273 : i64
      %311 = arith.cmpi eq, %308, %273 : i64
      %312 = arith.andi %310, %311 : i1
      %313 = scf.if %312 -> (i64) {
        scf.yield %272 : i64
      } else {
        scf.yield %308 : i64
      }
      %314 = arith.cmpi ne, %313, %273 : i64
      scf.if %314 {
        func.call @stack_push_pointer(%313) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%149) : (i64) -> ()
        func.call @stack_push_pointer(%233) : (i64) -> ()
        func.call @stack_push_pointer(%240) : (i64) -> ()
        func.call @stack_push_pointer(%251) : (i64) -> ()
        func.call @stack_push_pointer(%252) : (i64) -> ()
        func.call @stack_push_pointer(%263) : (i64) -> ()
        func.call @stack_push_pointer(%272) : (i64) -> ()
        %315 = llvm.mlir.addressof @str30 : !llvm.ptr
        %316 = func.call @cc_make_function_ref_const(%315) : (!llvm.ptr) -> i64
        %317 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%316, %317) : (i64, i64) -> ()
      }
      %318 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %318 : i64
    }
    func.call @stack_push_pointer(%56) : (i64) -> ()
    %319 = func.call @stack_pop_pointer() : () -> i64
    %320 = func.call @cc_multiple_value_list(%319) : (i64) -> i64
    %321 = llvm.mlir.addressof @str31 : !llvm.ptr
    %322 = arith.constant 38 : i64
    %323 = func.call @cc_make_string(%321, %322) : (!llvm.ptr, i64) -> i64
    %324 = func.call @cc_nil_value() : () -> i64
    %325 = func.call @cc_intern(%323, %324) : (i64, i64) -> i64
    %326 = func.call @cc_nil_value() : () -> i64
    %327 = func.call @cc_cons(%325, %326) : (i64, i64) -> i64
    %328 = func.call @cc_values_pack(%327) : (i64) -> i64
    %329 = func.call @cc_symbol_value(%325) : (i64) -> i64
    %330 = llvm.mlir.addressof @str32 : !llvm.ptr
    %331 = arith.constant 40 : i64
    %332 = func.call @cc_make_string(%330, %331) : (!llvm.ptr, i64) -> i64
    %333 = func.call @cc_nil_value() : () -> i64
    %334 = func.call @cc_intern(%332, %333) : (i64, i64) -> i64
    %335 = func.call @cc_nil_value() : () -> i64
    %336 = func.call @cc_cons(%334, %335) : (i64, i64) -> i64
    %337 = func.call @cc_values_pack(%336) : (i64) -> i64
    %338 = func.call @cc_symbol_value(%334) : (i64) -> i64
    %339 = func.call @cc_nil_value() : () -> i64
    %340 = arith.cmpi ne, %329, %339 : i64
    %341 = scf.if %340 -> (i64) {
      scf.yield %338 : i64
    } else {
      scf.yield %320 : i64
    }
    %342 = func.call @cc_values_pack(%341) : (i64) -> i64
    func.call @stack_push_pointer(%342) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_275586643656705"() {
    %150 = func.call @cc_nil_value() : () -> i64
    %151 = func.call @cc_nil_value() : () -> i64
    %152 = func.call @cc_errorp(%150) : (i64) -> i64
    %153 = arith.cmpi ne, %152, %151 : i64
    %154 = scf.if %153 -> (i64) {
      scf.yield %150 : i64
    } else {
      %155 = func.call @cc_make_string_output_stream() : () -> i64
      %156 = llvm.mlir.addressof @str17 : !llvm.ptr
      %157 = arith.constant 17 : i64
      %158 = func.call @cc_make_string(%156, %157) : (!llvm.ptr, i64) -> i64
      %159 = func.call @cc_nil_value() : () -> i64
      %160 = func.call @cc_intern(%158, %159) : (i64, i64) -> i64
      %161 = func.call @cc_nil_value() : () -> i64
      %162 = func.call @cc_cons(%160, %161) : (i64, i64) -> i64
      %163 = func.call @cc_values_pack(%162) : (i64) -> i64
      %164 = func.call @cc_symbol_value(%160) : (i64) -> i64
      %165 = func.call @cc_set_symbol_value(%160, %155) : (i64, i64) -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%166) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @cc_cons(%167, %168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%169) : (i64) -> ()
      %170 = llvm.mlir.addressof @str18 : !llvm.ptr
      %171 = arith.constant 5 : i64
      %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
      %173 = llvm.mlir.addressof @str19 : !llvm.ptr
      %174 = arith.constant 7 : i64
      %175 = func.call @cc_make_string(%173, %174) : (!llvm.ptr, i64) -> i64
      %176 = func.call @cc_intern(%172, %175) : (i64, i64) -> i64
      %177 = func.call @cc_nil_value() : () -> i64
      %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
      %179 = func.call @cc_values_pack(%178) : (i64) -> i64
      func.call @stack_push_pointer(%176) : (i64) -> ()
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @stack_pop_pointer() : () -> i64
      %182 = func.call @cc_cons(%180, %181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%182) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %183 = func.call @stack_pop_pointer() : () -> i64
      %184 = func.call @stack_pop_pointer() : () -> i64
      %185 = func.call @cc_cons(%183, %184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%185) : (i64) -> ()
      %186 = llvm.mlir.addressof @str20 : !llvm.ptr
      %187 = arith.constant 7 : i64
      %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
      %189 = llvm.mlir.addressof @str21 : !llvm.ptr
      %190 = arith.constant 7 : i64
      %191 = func.call @cc_make_string(%189, %190) : (!llvm.ptr, i64) -> i64
      %192 = func.call @cc_intern(%188, %191) : (i64, i64) -> i64
      %193 = func.call @cc_nil_value() : () -> i64
      %194 = func.call @cc_cons(%192, %193) : (i64, i64) -> i64
      %195 = func.call @cc_values_pack(%194) : (i64) -> i64
      func.call @stack_push_pointer(%192) : (i64) -> ()
      %196 = func.call @stack_pop_pointer() : () -> i64
      %197 = func.call @stack_pop_pointer() : () -> i64
      %198 = func.call @cc_cons(%196, %197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%198) : (i64) -> ()
      %199 = llvm.mlir.addressof @str22 : !llvm.ptr
      %200 = arith.constant 50 : i64
      %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%201) : (i64) -> ()
      %202 = func.call @stack_pop_pointer() : () -> i64
      %203 = func.call @stack_pop_pointer() : () -> i64
      %204 = func.call @cc_cons(%202, %203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%204) : (i64) -> ()
      %205 = llvm.mlir.addressof @str23 : !llvm.ptr
      %206 = arith.constant 12 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = func.call @cc_nil_value() : () -> i64
      %209 = func.call @cc_intern(%207, %208) : (i64, i64) -> i64
      %210 = func.call @cc_nil_value() : () -> i64
      %211 = func.call @cc_cons(%209, %210) : (i64, i64) -> i64
      %212 = func.call @cc_values_pack(%211) : (i64) -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @stack_pop_pointer() : () -> i64
      %215 = func.call @cc_cons(%213, %214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%215) : (i64) -> ()
      %216 = func.call @stack_pop_pointer() : () -> i64
      %217 = func.call @cc_nil_value() : () -> i64
      %218 = func.call @cc_cons(%216, %217) : (i64, i64) -> i64
      %219 = func.call @cc_eval(%218) : (i64) -> i64
      %220 = func.call @cc_multiple_value_list(%219) : (i64) -> i64
      %221 = func.call @cc_values_pack(%220) : (i64) -> i64
      func.call @stack_push_pointer(%221) : (i64) -> ()
      %222 = func.call @stack_pop_pointer() : () -> i64
      %223 = func.call @cc_nil_value() : () -> i64
      %224 = func.call @cc_errorp(%222) : (i64) -> i64
      %225 = arith.cmpi ne, %224, %223 : i64
      %226 = scf.if %225 -> (i64) {
        scf.yield %222 : i64
      } else {
        %227 = func.call @cc_get_output_stream_string(%155) : (i64) -> i64
        scf.yield %227 : i64
      }
      func.call @stack_push_pointer(%226) : (i64) -> ()
      %228 = func.call @cc_set_symbol_value(%160, %164) : (i64, i64) -> i64
      %229 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %229 : i64
    }
    func.call @stack_push_pointer(%154) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_275586643656704*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_275586643656704*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_275586643656704*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("COMPILE-2-LOW-LEVEL\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str6("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("sys:src;lisp;regression-tests;lowlevel-source.lisp\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str13("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("*STANDARD-OUTPUT*\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str18("PRINT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str19("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str20("VERBOSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str22("sys:src;lisp;regression-tests;lowlevel-source.lisp\00") : !llvm.array<51 x i8>
  llvm.mlir.global private constant @str23("COMPILE-FILE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str24("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str25("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str28("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str29("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str30("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str31("*__MLIR_BLOCK_RETFLAG_275586643656704*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str32("*__MLIR_BLOCK_RETMVLIST_275586643656704*\00") : !llvm.array<41 x i8>
}
