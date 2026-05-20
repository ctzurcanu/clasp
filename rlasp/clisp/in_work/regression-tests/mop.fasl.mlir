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
      %58 = arith.constant 20 : i64
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
      %75 = arith.constant 17 : i64
      %76 = func.call @cc_make_string(%74, %75) : (!llvm.ptr, i64) -> i64
      %77 = func.call @cc_nil_value() : () -> i64
      %78 = func.call @cc_intern(%76, %77) : (i64, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
      %81 = func.call @cc_values_pack(%80) : (i64) -> i64
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %82 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%82) : (i64) -> ()
      %83 = llvm.mlir.addressof @str8 : !llvm.ptr
      %84 = arith.constant 31 : i64
      %85 = func.call @cc_make_string(%83, %84) : (!llvm.ptr, i64) -> i64
      %86 = llvm.mlir.addressof @str9 : !llvm.ptr
      %87 = arith.constant 4 : i64
      %88 = func.call @cc_make_string(%86, %87) : (!llvm.ptr, i64) -> i64
      %89 = func.call @cc_intern(%85, %88) : (i64, i64) -> i64
      %90 = func.call @cc_nil_value() : () -> i64
      %91 = func.call @cc_cons(%89, %90) : (i64, i64) -> i64
      %92 = func.call @cc_values_pack(%91) : (i64) -> i64
      func.call @stack_push_pointer(%89) : (i64) -> ()
      %93 = llvm.mlir.addressof @str10 : !llvm.ptr
      %94 = arith.constant 13 : i64
      %95 = func.call @cc_make_string(%93, %94) : (!llvm.ptr, i64) -> i64
      %96 = llvm.mlir.addressof @str11 : !llvm.ptr
      %97 = arith.constant 4 : i64
      %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
      %99 = func.call @cc_intern(%95, %98) : (i64, i64) -> i64
      %100 = func.call @cc_nil_value() : () -> i64
      %101 = func.call @cc_cons(%99, %100) : (i64, i64) -> i64
      %102 = func.call @cc_values_pack(%101) : (i64) -> i64
      func.call @stack_push_pointer(%99) : (i64) -> ()
      %103 = llvm.mlir.addressof @str12 : !llvm.ptr
      %104 = arith.constant 17 : i64
      %105 = func.call @cc_make_string(%103, %104) : (!llvm.ptr, i64) -> i64
      %106 = llvm.mlir.addressof @str13 : !llvm.ptr
      %107 = arith.constant 4 : i64
      %108 = func.call @cc_make_string(%106, %107) : (!llvm.ptr, i64) -> i64
      %109 = func.call @cc_intern(%105, %108) : (i64, i64) -> i64
      %110 = func.call @cc_nil_value() : () -> i64
      %111 = func.call @cc_cons(%109, %110) : (i64, i64) -> i64
      %112 = func.call @cc_values_pack(%111) : (i64) -> i64
      func.call @stack_push_pointer(%109) : (i64) -> ()
      %113 = llvm.mlir.addressof @str14 : !llvm.ptr
      %114 = arith.constant 19 : i64
      %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
      %116 = llvm.mlir.addressof @str15 : !llvm.ptr
      %117 = arith.constant 4 : i64
      %118 = func.call @cc_make_string(%116, %117) : (!llvm.ptr, i64) -> i64
      %119 = func.call @cc_intern(%115, %118) : (i64, i64) -> i64
      %120 = func.call @cc_nil_value() : () -> i64
      %121 = func.call @cc_cons(%119, %120) : (i64, i64) -> i64
      %122 = func.call @cc_values_pack(%121) : (i64) -> i64
      func.call @stack_push_pointer(%119) : (i64) -> ()
      %123 = llvm.mlir.addressof @str16 : !llvm.ptr
      %124 = arith.constant 22 : i64
      %125 = func.call @cc_make_string(%123, %124) : (!llvm.ptr, i64) -> i64
      %126 = llvm.mlir.addressof @str17 : !llvm.ptr
      %127 = arith.constant 4 : i64
      %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
      %129 = func.call @cc_intern(%125, %128) : (i64, i64) -> i64
      %130 = func.call @cc_nil_value() : () -> i64
      %131 = func.call @cc_cons(%129, %130) : (i64, i64) -> i64
      %132 = func.call @cc_values_pack(%131) : (i64) -> i64
      func.call @stack_push_pointer(%129) : (i64) -> ()
      %133 = llvm.mlir.addressof @str18 : !llvm.ptr
      %134 = arith.constant 29 : i64
      %135 = func.call @cc_make_string(%133, %134) : (!llvm.ptr, i64) -> i64
      %136 = llvm.mlir.addressof @str19 : !llvm.ptr
      %137 = arith.constant 4 : i64
      %138 = func.call @cc_make_string(%136, %137) : (!llvm.ptr, i64) -> i64
      %139 = func.call @cc_intern(%135, %138) : (i64, i64) -> i64
      %140 = func.call @cc_nil_value() : () -> i64
      %141 = func.call @cc_cons(%139, %140) : (i64, i64) -> i64
      %142 = func.call @cc_values_pack(%141) : (i64) -> i64
      func.call @stack_push_pointer(%139) : (i64) -> ()
      %143 = llvm.mlir.addressof @str20 : !llvm.ptr
      %144 = arith.constant 18 : i64
      %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
      %146 = llvm.mlir.addressof @str21 : !llvm.ptr
      %147 = arith.constant 4 : i64
      %148 = func.call @cc_make_string(%146, %147) : (!llvm.ptr, i64) -> i64
      %149 = func.call @cc_intern(%145, %148) : (i64, i64) -> i64
      %150 = func.call @cc_nil_value() : () -> i64
      %151 = func.call @cc_cons(%149, %150) : (i64, i64) -> i64
      %152 = func.call @cc_values_pack(%151) : (i64) -> i64
      func.call @stack_push_pointer(%149) : (i64) -> ()
      %153 = llvm.mlir.addressof @str22 : !llvm.ptr
      %154 = arith.constant 23 : i64
      %155 = func.call @cc_make_string(%153, %154) : (!llvm.ptr, i64) -> i64
      %156 = llvm.mlir.addressof @str23 : !llvm.ptr
      %157 = arith.constant 4 : i64
      %158 = func.call @cc_make_string(%156, %157) : (!llvm.ptr, i64) -> i64
      %159 = func.call @cc_intern(%155, %158) : (i64, i64) -> i64
      %160 = func.call @cc_nil_value() : () -> i64
      %161 = func.call @cc_cons(%159, %160) : (i64, i64) -> i64
      %162 = func.call @cc_values_pack(%161) : (i64) -> i64
      func.call @stack_push_pointer(%159) : (i64) -> ()
      %163 = llvm.mlir.addressof @str24 : !llvm.ptr
      %164 = arith.constant 25 : i64
      %165 = func.call @cc_make_string(%163, %164) : (!llvm.ptr, i64) -> i64
      %166 = llvm.mlir.addressof @str25 : !llvm.ptr
      %167 = arith.constant 4 : i64
      %168 = func.call @cc_make_string(%166, %167) : (!llvm.ptr, i64) -> i64
      %169 = func.call @cc_intern(%165, %168) : (i64, i64) -> i64
      %170 = func.call @cc_nil_value() : () -> i64
      %171 = func.call @cc_cons(%169, %170) : (i64, i64) -> i64
      %172 = func.call @cc_values_pack(%171) : (i64) -> i64
      func.call @stack_push_pointer(%169) : (i64) -> ()
      %173 = llvm.mlir.addressof @str26 : !llvm.ptr
      %174 = arith.constant 17 : i64
      %175 = func.call @cc_make_string(%173, %174) : (!llvm.ptr, i64) -> i64
      %176 = llvm.mlir.addressof @str27 : !llvm.ptr
      %177 = arith.constant 4 : i64
      %178 = func.call @cc_make_string(%176, %177) : (!llvm.ptr, i64) -> i64
      %179 = func.call @cc_intern(%175, %178) : (i64, i64) -> i64
      %180 = func.call @cc_nil_value() : () -> i64
      %181 = func.call @cc_cons(%179, %180) : (i64, i64) -> i64
      %182 = func.call @cc_values_pack(%181) : (i64) -> i64
      func.call @stack_push_pointer(%179) : (i64) -> ()
      %183 = llvm.mlir.addressof @str28 : !llvm.ptr
      %184 = arith.constant 21 : i64
      %185 = func.call @cc_make_string(%183, %184) : (!llvm.ptr, i64) -> i64
      %186 = llvm.mlir.addressof @str29 : !llvm.ptr
      %187 = arith.constant 4 : i64
      %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
      %189 = func.call @cc_intern(%185, %188) : (i64, i64) -> i64
      %190 = func.call @cc_nil_value() : () -> i64
      %191 = func.call @cc_cons(%189, %190) : (i64, i64) -> i64
      %192 = func.call @cc_values_pack(%191) : (i64) -> i64
      func.call @stack_push_pointer(%189) : (i64) -> ()
      %193 = llvm.mlir.addressof @str30 : !llvm.ptr
      %194 = arith.constant 15 : i64
      %195 = func.call @cc_make_string(%193, %194) : (!llvm.ptr, i64) -> i64
      %196 = llvm.mlir.addressof @str31 : !llvm.ptr
      %197 = arith.constant 4 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = func.call @cc_intern(%195, %198) : (i64, i64) -> i64
      %200 = func.call @cc_nil_value() : () -> i64
      %201 = func.call @cc_cons(%199, %200) : (i64, i64) -> i64
      %202 = func.call @cc_values_pack(%201) : (i64) -> i64
      func.call @stack_push_pointer(%199) : (i64) -> ()
      %203 = llvm.mlir.addressof @str32 : !llvm.ptr
      %204 = arith.constant 11 : i64
      %205 = func.call @cc_make_string(%203, %204) : (!llvm.ptr, i64) -> i64
      %206 = llvm.mlir.addressof @str33 : !llvm.ptr
      %207 = arith.constant 4 : i64
      %208 = func.call @cc_make_string(%206, %207) : (!llvm.ptr, i64) -> i64
      %209 = func.call @cc_intern(%205, %208) : (i64, i64) -> i64
      %210 = func.call @cc_nil_value() : () -> i64
      %211 = func.call @cc_cons(%209, %210) : (i64, i64) -> i64
      %212 = func.call @cc_values_pack(%211) : (i64) -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      %213 = llvm.mlir.addressof @str34 : !llvm.ptr
      %214 = arith.constant 40 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = llvm.mlir.addressof @str35 : !llvm.ptr
      %217 = arith.constant 4 : i64
      %218 = func.call @cc_make_string(%216, %217) : (!llvm.ptr, i64) -> i64
      %219 = func.call @cc_intern(%215, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      func.call @stack_push_pointer(%219) : (i64) -> ()
      %223 = llvm.mlir.addressof @str36 : !llvm.ptr
      %224 = arith.constant 29 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = llvm.mlir.addressof @str37 : !llvm.ptr
      %227 = arith.constant 4 : i64
      %228 = func.call @cc_make_string(%226, %227) : (!llvm.ptr, i64) -> i64
      %229 = func.call @cc_intern(%225, %228) : (i64, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_values_pack(%231) : (i64) -> i64
      func.call @stack_push_pointer(%229) : (i64) -> ()
      %233 = llvm.mlir.addressof @str38 : !llvm.ptr
      %234 = arith.constant 31 : i64
      %235 = func.call @cc_make_string(%233, %234) : (!llvm.ptr, i64) -> i64
      %236 = llvm.mlir.addressof @str39 : !llvm.ptr
      %237 = arith.constant 4 : i64
      %238 = func.call @cc_make_string(%236, %237) : (!llvm.ptr, i64) -> i64
      %239 = func.call @cc_intern(%235, %238) : (i64, i64) -> i64
      %240 = func.call @cc_nil_value() : () -> i64
      %241 = func.call @cc_cons(%239, %240) : (i64, i64) -> i64
      %242 = func.call @cc_values_pack(%241) : (i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %243 = llvm.mlir.addressof @str40 : !llvm.ptr
      %244 = arith.constant 24 : i64
      %245 = func.call @cc_make_string(%243, %244) : (!llvm.ptr, i64) -> i64
      %246 = llvm.mlir.addressof @str41 : !llvm.ptr
      %247 = arith.constant 4 : i64
      %248 = func.call @cc_make_string(%246, %247) : (!llvm.ptr, i64) -> i64
      %249 = func.call @cc_intern(%245, %248) : (i64, i64) -> i64
      %250 = func.call @cc_nil_value() : () -> i64
      %251 = func.call @cc_cons(%249, %250) : (i64, i64) -> i64
      %252 = func.call @cc_values_pack(%251) : (i64) -> i64
      func.call @stack_push_pointer(%249) : (i64) -> ()
      %253 = llvm.mlir.addressof @str42 : !llvm.ptr
      %254 = arith.constant 33 : i64
      %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
      %256 = llvm.mlir.addressof @str43 : !llvm.ptr
      %257 = arith.constant 4 : i64
      %258 = func.call @cc_make_string(%256, %257) : (!llvm.ptr, i64) -> i64
      %259 = func.call @cc_intern(%255, %258) : (i64, i64) -> i64
      %260 = func.call @cc_nil_value() : () -> i64
      %261 = func.call @cc_cons(%259, %260) : (i64, i64) -> i64
      %262 = func.call @cc_values_pack(%261) : (i64) -> i64
      func.call @stack_push_pointer(%259) : (i64) -> ()
      %263 = llvm.mlir.addressof @str44 : !llvm.ptr
      %264 = arith.constant 13 : i64
      %265 = func.call @cc_make_string(%263, %264) : (!llvm.ptr, i64) -> i64
      %266 = llvm.mlir.addressof @str45 : !llvm.ptr
      %267 = arith.constant 4 : i64
      %268 = func.call @cc_make_string(%266, %267) : (!llvm.ptr, i64) -> i64
      %269 = func.call @cc_intern(%265, %268) : (i64, i64) -> i64
      %270 = func.call @cc_nil_value() : () -> i64
      %271 = func.call @cc_cons(%269, %270) : (i64, i64) -> i64
      %272 = func.call @cc_values_pack(%271) : (i64) -> i64
      func.call @stack_push_pointer(%269) : (i64) -> ()
      %273 = llvm.mlir.addressof @str46 : !llvm.ptr
      %274 = arith.constant 28 : i64
      %275 = func.call @cc_make_string(%273, %274) : (!llvm.ptr, i64) -> i64
      %276 = llvm.mlir.addressof @str47 : !llvm.ptr
      %277 = arith.constant 4 : i64
      %278 = func.call @cc_make_string(%276, %277) : (!llvm.ptr, i64) -> i64
      %279 = func.call @cc_intern(%275, %278) : (i64, i64) -> i64
      %280 = func.call @cc_nil_value() : () -> i64
      %281 = func.call @cc_cons(%279, %280) : (i64, i64) -> i64
      %282 = func.call @cc_values_pack(%281) : (i64) -> i64
      func.call @stack_push_pointer(%279) : (i64) -> ()
      %283 = llvm.mlir.addressof @str48 : !llvm.ptr
      %284 = arith.constant 31 : i64
      %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
      %286 = llvm.mlir.addressof @str49 : !llvm.ptr
      %287 = arith.constant 4 : i64
      %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
      %289 = func.call @cc_intern(%285, %288) : (i64, i64) -> i64
      %290 = func.call @cc_nil_value() : () -> i64
      %291 = func.call @cc_cons(%289, %290) : (i64, i64) -> i64
      %292 = func.call @cc_values_pack(%291) : (i64) -> i64
      func.call @stack_push_pointer(%289) : (i64) -> ()
      %293 = llvm.mlir.addressof @str50 : !llvm.ptr
      %294 = arith.constant 24 : i64
      %295 = func.call @cc_make_string(%293, %294) : (!llvm.ptr, i64) -> i64
      %296 = llvm.mlir.addressof @str51 : !llvm.ptr
      %297 = arith.constant 4 : i64
      %298 = func.call @cc_make_string(%296, %297) : (!llvm.ptr, i64) -> i64
      %299 = func.call @cc_intern(%295, %298) : (i64, i64) -> i64
      %300 = func.call @cc_nil_value() : () -> i64
      %301 = func.call @cc_cons(%299, %300) : (i64, i64) -> i64
      %302 = func.call @cc_values_pack(%301) : (i64) -> i64
      func.call @stack_push_pointer(%299) : (i64) -> ()
      %303 = llvm.mlir.addressof @str52 : !llvm.ptr
      %304 = arith.constant 35 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      %306 = llvm.mlir.addressof @str53 : !llvm.ptr
      %307 = arith.constant 4 : i64
      %308 = func.call @cc_make_string(%306, %307) : (!llvm.ptr, i64) -> i64
      %309 = func.call @cc_intern(%305, %308) : (i64, i64) -> i64
      %310 = func.call @cc_nil_value() : () -> i64
      %311 = func.call @cc_cons(%309, %310) : (i64, i64) -> i64
      %312 = func.call @cc_values_pack(%311) : (i64) -> i64
      func.call @stack_push_pointer(%309) : (i64) -> ()
      %313 = llvm.mlir.addressof @str54 : !llvm.ptr
      %314 = arith.constant 20 : i64
      %315 = func.call @cc_make_string(%313, %314) : (!llvm.ptr, i64) -> i64
      %316 = llvm.mlir.addressof @str55 : !llvm.ptr
      %317 = arith.constant 4 : i64
      %318 = func.call @cc_make_string(%316, %317) : (!llvm.ptr, i64) -> i64
      %319 = func.call @cc_intern(%315, %318) : (i64, i64) -> i64
      %320 = func.call @cc_nil_value() : () -> i64
      %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
      %322 = func.call @cc_values_pack(%321) : (i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      %323 = llvm.mlir.addressof @str56 : !llvm.ptr
      %324 = arith.constant 23 : i64
      %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
      %326 = llvm.mlir.addressof @str57 : !llvm.ptr
      %327 = arith.constant 4 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = func.call @cc_intern(%325, %328) : (i64, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_cons(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_values_pack(%331) : (i64) -> i64
      func.call @stack_push_pointer(%329) : (i64) -> ()
      %333 = llvm.mlir.addressof @str58 : !llvm.ptr
      %334 = arith.constant 42 : i64
      %335 = func.call @cc_make_string(%333, %334) : (!llvm.ptr, i64) -> i64
      %336 = llvm.mlir.addressof @str59 : !llvm.ptr
      %337 = arith.constant 4 : i64
      %338 = func.call @cc_make_string(%336, %337) : (!llvm.ptr, i64) -> i64
      %339 = func.call @cc_intern(%335, %338) : (i64, i64) -> i64
      %340 = func.call @cc_nil_value() : () -> i64
      %341 = func.call @cc_cons(%339, %340) : (i64, i64) -> i64
      %342 = func.call @cc_values_pack(%341) : (i64) -> i64
      func.call @stack_push_pointer(%339) : (i64) -> ()
      %343 = llvm.mlir.addressof @str60 : !llvm.ptr
      %344 = arith.constant 28 : i64
      %345 = func.call @cc_make_string(%343, %344) : (!llvm.ptr, i64) -> i64
      %346 = llvm.mlir.addressof @str61 : !llvm.ptr
      %347 = arith.constant 4 : i64
      %348 = func.call @cc_make_string(%346, %347) : (!llvm.ptr, i64) -> i64
      %349 = func.call @cc_intern(%345, %348) : (i64, i64) -> i64
      %350 = func.call @cc_nil_value() : () -> i64
      %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
      %352 = func.call @cc_values_pack(%351) : (i64) -> i64
      func.call @stack_push_pointer(%349) : (i64) -> ()
      %353 = llvm.mlir.addressof @str62 : !llvm.ptr
      %354 = arith.constant 29 : i64
      %355 = func.call @cc_make_string(%353, %354) : (!llvm.ptr, i64) -> i64
      %356 = llvm.mlir.addressof @str63 : !llvm.ptr
      %357 = arith.constant 4 : i64
      %358 = func.call @cc_make_string(%356, %357) : (!llvm.ptr, i64) -> i64
      %359 = func.call @cc_intern(%355, %358) : (i64, i64) -> i64
      %360 = func.call @cc_nil_value() : () -> i64
      %361 = func.call @cc_cons(%359, %360) : (i64, i64) -> i64
      %362 = func.call @cc_values_pack(%361) : (i64) -> i64
      func.call @stack_push_pointer(%359) : (i64) -> ()
      %363 = llvm.mlir.addressof @str64 : !llvm.ptr
      %364 = arith.constant 35 : i64
      %365 = func.call @cc_make_string(%363, %364) : (!llvm.ptr, i64) -> i64
      %366 = llvm.mlir.addressof @str65 : !llvm.ptr
      %367 = arith.constant 4 : i64
      %368 = func.call @cc_make_string(%366, %367) : (!llvm.ptr, i64) -> i64
      %369 = func.call @cc_intern(%365, %368) : (i64, i64) -> i64
      %370 = func.call @cc_nil_value() : () -> i64
      %371 = func.call @cc_cons(%369, %370) : (i64, i64) -> i64
      %372 = func.call @cc_values_pack(%371) : (i64) -> i64
      func.call @stack_push_pointer(%369) : (i64) -> ()
      %373 = llvm.mlir.addressof @str66 : !llvm.ptr
      %374 = arith.constant 24 : i64
      %375 = func.call @cc_make_string(%373, %374) : (!llvm.ptr, i64) -> i64
      %376 = llvm.mlir.addressof @str67 : !llvm.ptr
      %377 = arith.constant 4 : i64
      %378 = func.call @cc_make_string(%376, %377) : (!llvm.ptr, i64) -> i64
      %379 = func.call @cc_intern(%375, %378) : (i64, i64) -> i64
      %380 = func.call @cc_nil_value() : () -> i64
      %381 = func.call @cc_cons(%379, %380) : (i64, i64) -> i64
      %382 = func.call @cc_values_pack(%381) : (i64) -> i64
      func.call @stack_push_pointer(%379) : (i64) -> ()
      %383 = llvm.mlir.addressof @str68 : !llvm.ptr
      %384 = arith.constant 21 : i64
      %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
      %386 = llvm.mlir.addressof @str69 : !llvm.ptr
      %387 = arith.constant 4 : i64
      %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
      %389 = func.call @cc_intern(%385, %388) : (i64, i64) -> i64
      %390 = func.call @cc_nil_value() : () -> i64
      %391 = func.call @cc_cons(%389, %390) : (i64, i64) -> i64
      %392 = func.call @cc_values_pack(%391) : (i64) -> i64
      func.call @stack_push_pointer(%389) : (i64) -> ()
      %393 = llvm.mlir.addressof @str70 : !llvm.ptr
      %394 = arith.constant 18 : i64
      %395 = func.call @cc_make_string(%393, %394) : (!llvm.ptr, i64) -> i64
      %396 = llvm.mlir.addressof @str71 : !llvm.ptr
      %397 = arith.constant 4 : i64
      %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
      %399 = func.call @cc_intern(%395, %398) : (i64, i64) -> i64
      %400 = func.call @cc_nil_value() : () -> i64
      %401 = func.call @cc_cons(%399, %400) : (i64, i64) -> i64
      %402 = func.call @cc_values_pack(%401) : (i64) -> i64
      func.call @stack_push_pointer(%399) : (i64) -> ()
      %403 = llvm.mlir.addressof @str72 : !llvm.ptr
      %404 = arith.constant 14 : i64
      %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
      %406 = llvm.mlir.addressof @str73 : !llvm.ptr
      %407 = arith.constant 4 : i64
      %408 = func.call @cc_make_string(%406, %407) : (!llvm.ptr, i64) -> i64
      %409 = func.call @cc_intern(%405, %408) : (i64, i64) -> i64
      %410 = func.call @cc_nil_value() : () -> i64
      %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
      %412 = func.call @cc_values_pack(%411) : (i64) -> i64
      func.call @stack_push_pointer(%409) : (i64) -> ()
      %413 = llvm.mlir.addressof @str74 : !llvm.ptr
      %414 = arith.constant 15 : i64
      %415 = func.call @cc_make_string(%413, %414) : (!llvm.ptr, i64) -> i64
      %416 = llvm.mlir.addressof @str75 : !llvm.ptr
      %417 = arith.constant 4 : i64
      %418 = func.call @cc_make_string(%416, %417) : (!llvm.ptr, i64) -> i64
      %419 = func.call @cc_intern(%415, %418) : (i64, i64) -> i64
      %420 = func.call @cc_nil_value() : () -> i64
      %421 = func.call @cc_cons(%419, %420) : (i64, i64) -> i64
      %422 = func.call @cc_values_pack(%421) : (i64) -> i64
      func.call @stack_push_pointer(%419) : (i64) -> ()
      %423 = llvm.mlir.addressof @str76 : !llvm.ptr
      %424 = arith.constant 23 : i64
      %425 = func.call @cc_make_string(%423, %424) : (!llvm.ptr, i64) -> i64
      %426 = llvm.mlir.addressof @str77 : !llvm.ptr
      %427 = arith.constant 4 : i64
      %428 = func.call @cc_make_string(%426, %427) : (!llvm.ptr, i64) -> i64
      %429 = func.call @cc_intern(%425, %428) : (i64, i64) -> i64
      %430 = func.call @cc_nil_value() : () -> i64
      %431 = func.call @cc_cons(%429, %430) : (i64, i64) -> i64
      %432 = func.call @cc_values_pack(%431) : (i64) -> i64
      func.call @stack_push_pointer(%429) : (i64) -> ()
      %433 = llvm.mlir.addressof @str78 : !llvm.ptr
      %434 = arith.constant 18 : i64
      %435 = func.call @cc_make_string(%433, %434) : (!llvm.ptr, i64) -> i64
      %436 = llvm.mlir.addressof @str79 : !llvm.ptr
      %437 = arith.constant 4 : i64
      %438 = func.call @cc_make_string(%436, %437) : (!llvm.ptr, i64) -> i64
      %439 = func.call @cc_intern(%435, %438) : (i64, i64) -> i64
      %440 = func.call @cc_nil_value() : () -> i64
      %441 = func.call @cc_cons(%439, %440) : (i64, i64) -> i64
      %442 = func.call @cc_values_pack(%441) : (i64) -> i64
      func.call @stack_push_pointer(%439) : (i64) -> ()
      %443 = llvm.mlir.addressof @str80 : !llvm.ptr
      %444 = arith.constant 19 : i64
      %445 = func.call @cc_make_string(%443, %444) : (!llvm.ptr, i64) -> i64
      %446 = llvm.mlir.addressof @str81 : !llvm.ptr
      %447 = arith.constant 4 : i64
      %448 = func.call @cc_make_string(%446, %447) : (!llvm.ptr, i64) -> i64
      %449 = func.call @cc_intern(%445, %448) : (i64, i64) -> i64
      %450 = func.call @cc_nil_value() : () -> i64
      %451 = func.call @cc_cons(%449, %450) : (i64, i64) -> i64
      %452 = func.call @cc_values_pack(%451) : (i64) -> i64
      func.call @stack_push_pointer(%449) : (i64) -> ()
      %453 = llvm.mlir.addressof @str82 : !llvm.ptr
      %454 = arith.constant 17 : i64
      %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
      %456 = llvm.mlir.addressof @str83 : !llvm.ptr
      %457 = arith.constant 4 : i64
      %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
      %459 = func.call @cc_intern(%455, %458) : (i64, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_values_pack(%461) : (i64) -> i64
      func.call @stack_push_pointer(%459) : (i64) -> ()
      %463 = llvm.mlir.addressof @str84 : !llvm.ptr
      %464 = arith.constant 26 : i64
      %465 = func.call @cc_make_string(%463, %464) : (!llvm.ptr, i64) -> i64
      %466 = llvm.mlir.addressof @str85 : !llvm.ptr
      %467 = arith.constant 4 : i64
      %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
      %469 = func.call @cc_intern(%465, %468) : (i64, i64) -> i64
      %470 = func.call @cc_nil_value() : () -> i64
      %471 = func.call @cc_cons(%469, %470) : (i64, i64) -> i64
      %472 = func.call @cc_values_pack(%471) : (i64) -> i64
      func.call @stack_push_pointer(%469) : (i64) -> ()
      %473 = llvm.mlir.addressof @str86 : !llvm.ptr
      %474 = arith.constant 28 : i64
      %475 = func.call @cc_make_string(%473, %474) : (!llvm.ptr, i64) -> i64
      %476 = llvm.mlir.addressof @str87 : !llvm.ptr
      %477 = arith.constant 4 : i64
      %478 = func.call @cc_make_string(%476, %477) : (!llvm.ptr, i64) -> i64
      %479 = func.call @cc_intern(%475, %478) : (i64, i64) -> i64
      %480 = func.call @cc_nil_value() : () -> i64
      %481 = func.call @cc_cons(%479, %480) : (i64, i64) -> i64
      %482 = func.call @cc_values_pack(%481) : (i64) -> i64
      func.call @stack_push_pointer(%479) : (i64) -> ()
      %483 = llvm.mlir.addressof @str88 : !llvm.ptr
      %484 = arith.constant 24 : i64
      %485 = func.call @cc_make_string(%483, %484) : (!llvm.ptr, i64) -> i64
      %486 = llvm.mlir.addressof @str89 : !llvm.ptr
      %487 = arith.constant 4 : i64
      %488 = func.call @cc_make_string(%486, %487) : (!llvm.ptr, i64) -> i64
      %489 = func.call @cc_intern(%485, %488) : (i64, i64) -> i64
      %490 = func.call @cc_nil_value() : () -> i64
      %491 = func.call @cc_cons(%489, %490) : (i64, i64) -> i64
      %492 = func.call @cc_values_pack(%491) : (i64) -> i64
      func.call @stack_push_pointer(%489) : (i64) -> ()
      %493 = llvm.mlir.addressof @str90 : !llvm.ptr
      %494 = arith.constant 20 : i64
      %495 = func.call @cc_make_string(%493, %494) : (!llvm.ptr, i64) -> i64
      %496 = llvm.mlir.addressof @str91 : !llvm.ptr
      %497 = arith.constant 4 : i64
      %498 = func.call @cc_make_string(%496, %497) : (!llvm.ptr, i64) -> i64
      %499 = func.call @cc_intern(%495, %498) : (i64, i64) -> i64
      %500 = func.call @cc_nil_value() : () -> i64
      %501 = func.call @cc_cons(%499, %500) : (i64, i64) -> i64
      %502 = func.call @cc_values_pack(%501) : (i64) -> i64
      func.call @stack_push_pointer(%499) : (i64) -> ()
      %503 = llvm.mlir.addressof @str92 : !llvm.ptr
      %504 = arith.constant 20 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = llvm.mlir.addressof @str93 : !llvm.ptr
      %507 = arith.constant 4 : i64
      %508 = func.call @cc_make_string(%506, %507) : (!llvm.ptr, i64) -> i64
      %509 = func.call @cc_intern(%505, %508) : (i64, i64) -> i64
      %510 = func.call @cc_nil_value() : () -> i64
      %511 = func.call @cc_cons(%509, %510) : (i64, i64) -> i64
      %512 = func.call @cc_values_pack(%511) : (i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %513 = llvm.mlir.addressof @str94 : !llvm.ptr
      %514 = arith.constant 23 : i64
      %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
      %516 = llvm.mlir.addressof @str95 : !llvm.ptr
      %517 = arith.constant 4 : i64
      %518 = func.call @cc_make_string(%516, %517) : (!llvm.ptr, i64) -> i64
      %519 = func.call @cc_intern(%515, %518) : (i64, i64) -> i64
      %520 = func.call @cc_nil_value() : () -> i64
      %521 = func.call @cc_cons(%519, %520) : (i64, i64) -> i64
      %522 = func.call @cc_values_pack(%521) : (i64) -> i64
      func.call @stack_push_pointer(%519) : (i64) -> ()
      %523 = llvm.mlir.addressof @str96 : !llvm.ptr
      %524 = arith.constant 23 : i64
      %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
      %526 = llvm.mlir.addressof @str97 : !llvm.ptr
      %527 = arith.constant 4 : i64
      %528 = func.call @cc_make_string(%526, %527) : (!llvm.ptr, i64) -> i64
      %529 = func.call @cc_intern(%525, %528) : (i64, i64) -> i64
      %530 = func.call @cc_nil_value() : () -> i64
      %531 = func.call @cc_cons(%529, %530) : (i64, i64) -> i64
      %532 = func.call @cc_values_pack(%531) : (i64) -> i64
      func.call @stack_push_pointer(%529) : (i64) -> ()
      %533 = llvm.mlir.addressof @str98 : !llvm.ptr
      %534 = arith.constant 24 : i64
      %535 = func.call @cc_make_string(%533, %534) : (!llvm.ptr, i64) -> i64
      %536 = llvm.mlir.addressof @str99 : !llvm.ptr
      %537 = arith.constant 4 : i64
      %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
      %539 = func.call @cc_intern(%535, %538) : (i64, i64) -> i64
      %540 = func.call @cc_nil_value() : () -> i64
      %541 = func.call @cc_cons(%539, %540) : (i64, i64) -> i64
      %542 = func.call @cc_values_pack(%541) : (i64) -> i64
      func.call @stack_push_pointer(%539) : (i64) -> ()
      %543 = llvm.mlir.addressof @str100 : !llvm.ptr
      %544 = arith.constant 19 : i64
      %545 = func.call @cc_make_string(%543, %544) : (!llvm.ptr, i64) -> i64
      %546 = llvm.mlir.addressof @str101 : !llvm.ptr
      %547 = arith.constant 4 : i64
      %548 = func.call @cc_make_string(%546, %547) : (!llvm.ptr, i64) -> i64
      %549 = func.call @cc_intern(%545, %548) : (i64, i64) -> i64
      %550 = func.call @cc_nil_value() : () -> i64
      %551 = func.call @cc_cons(%549, %550) : (i64, i64) -> i64
      %552 = func.call @cc_values_pack(%551) : (i64) -> i64
      func.call @stack_push_pointer(%549) : (i64) -> ()
      %553 = llvm.mlir.addressof @str102 : !llvm.ptr
      %554 = arith.constant 16 : i64
      %555 = func.call @cc_make_string(%553, %554) : (!llvm.ptr, i64) -> i64
      %556 = llvm.mlir.addressof @str103 : !llvm.ptr
      %557 = arith.constant 4 : i64
      %558 = func.call @cc_make_string(%556, %557) : (!llvm.ptr, i64) -> i64
      %559 = func.call @cc_intern(%555, %558) : (i64, i64) -> i64
      %560 = func.call @cc_nil_value() : () -> i64
      %561 = func.call @cc_cons(%559, %560) : (i64, i64) -> i64
      %562 = func.call @cc_values_pack(%561) : (i64) -> i64
      func.call @stack_push_pointer(%559) : (i64) -> ()
      %563 = llvm.mlir.addressof @str104 : !llvm.ptr
      %564 = arith.constant 20 : i64
      %565 = func.call @cc_make_string(%563, %564) : (!llvm.ptr, i64) -> i64
      %566 = llvm.mlir.addressof @str105 : !llvm.ptr
      %567 = arith.constant 4 : i64
      %568 = func.call @cc_make_string(%566, %567) : (!llvm.ptr, i64) -> i64
      %569 = func.call @cc_intern(%565, %568) : (i64, i64) -> i64
      %570 = func.call @cc_nil_value() : () -> i64
      %571 = func.call @cc_cons(%569, %570) : (i64, i64) -> i64
      %572 = func.call @cc_values_pack(%571) : (i64) -> i64
      func.call @stack_push_pointer(%569) : (i64) -> ()
      %573 = llvm.mlir.addressof @str106 : !llvm.ptr
      %574 = arith.constant 22 : i64
      %575 = func.call @cc_make_string(%573, %574) : (!llvm.ptr, i64) -> i64
      %576 = llvm.mlir.addressof @str107 : !llvm.ptr
      %577 = arith.constant 4 : i64
      %578 = func.call @cc_make_string(%576, %577) : (!llvm.ptr, i64) -> i64
      %579 = func.call @cc_intern(%575, %578) : (i64, i64) -> i64
      %580 = func.call @cc_nil_value() : () -> i64
      %581 = func.call @cc_cons(%579, %580) : (i64, i64) -> i64
      %582 = func.call @cc_values_pack(%581) : (i64) -> i64
      func.call @stack_push_pointer(%579) : (i64) -> ()
      %583 = llvm.mlir.addressof @str108 : !llvm.ptr
      %584 = arith.constant 4 : i64
      %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
      %586 = llvm.mlir.addressof @str109 : !llvm.ptr
      %587 = arith.constant 11 : i64
      %588 = func.call @cc_make_string(%586, %587) : (!llvm.ptr, i64) -> i64
      %589 = func.call @cc_intern(%585, %588) : (i64, i64) -> i64
      %590 = func.call @cc_nil_value() : () -> i64
      %591 = func.call @cc_cons(%589, %590) : (i64, i64) -> i64
      %592 = func.call @cc_values_pack(%591) : (i64) -> i64
      func.call @stack_push_pointer(%589) : (i64) -> ()
      %593 = llvm.mlir.addressof @str110 : !llvm.ptr
      %594 = arith.constant 21 : i64
      %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
      %596 = llvm.mlir.addressof @str111 : !llvm.ptr
      %597 = arith.constant 4 : i64
      %598 = func.call @cc_make_string(%596, %597) : (!llvm.ptr, i64) -> i64
      %599 = func.call @cc_intern(%595, %598) : (i64, i64) -> i64
      %600 = func.call @cc_nil_value() : () -> i64
      %601 = func.call @cc_cons(%599, %600) : (i64, i64) -> i64
      %602 = func.call @cc_values_pack(%601) : (i64) -> i64
      func.call @stack_push_pointer(%599) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %603 = func.call @stack_pop_pointer() : () -> i64
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @cc_cons(%604, %603) : (i64, i64) -> i64
      func.call @stack_push_pointer(%605) : (i64) -> ()
      %606 = func.call @stack_pop_pointer() : () -> i64
      %607 = func.call @stack_pop_pointer() : () -> i64
      %608 = func.call @cc_cons(%607, %606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%608) : (i64) -> ()
      %609 = llvm.mlir.addressof @str112 : !llvm.ptr
      %610 = arith.constant 4 : i64
      %611 = func.call @cc_make_string(%609, %610) : (!llvm.ptr, i64) -> i64
      %612 = llvm.mlir.addressof @str113 : !llvm.ptr
      %613 = arith.constant 11 : i64
      %614 = func.call @cc_make_string(%612, %613) : (!llvm.ptr, i64) -> i64
      %615 = func.call @cc_intern(%611, %614) : (i64, i64) -> i64
      %616 = func.call @cc_nil_value() : () -> i64
      %617 = func.call @cc_cons(%615, %616) : (i64, i64) -> i64
      %618 = func.call @cc_values_pack(%617) : (i64) -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %619 = llvm.mlir.addressof @str114 : !llvm.ptr
      %620 = arith.constant 22 : i64
      %621 = func.call @cc_make_string(%619, %620) : (!llvm.ptr, i64) -> i64
      %622 = llvm.mlir.addressof @str115 : !llvm.ptr
      %623 = arith.constant 4 : i64
      %624 = func.call @cc_make_string(%622, %623) : (!llvm.ptr, i64) -> i64
      %625 = func.call @cc_intern(%621, %624) : (i64, i64) -> i64
      %626 = func.call @cc_nil_value() : () -> i64
      %627 = func.call @cc_cons(%625, %626) : (i64, i64) -> i64
      %628 = func.call @cc_values_pack(%627) : (i64) -> i64
      func.call @stack_push_pointer(%625) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %629 = func.call @stack_pop_pointer() : () -> i64
      %630 = func.call @stack_pop_pointer() : () -> i64
      %631 = func.call @cc_cons(%630, %629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%631) : (i64) -> ()
      %632 = func.call @stack_pop_pointer() : () -> i64
      %633 = func.call @stack_pop_pointer() : () -> i64
      %634 = func.call @cc_cons(%633, %632) : (i64, i64) -> i64
      func.call @stack_push_pointer(%634) : (i64) -> ()
      %635 = llvm.mlir.addressof @str116 : !llvm.ptr
      %636 = arith.constant 23 : i64
      %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
      %638 = llvm.mlir.addressof @str117 : !llvm.ptr
      %639 = arith.constant 4 : i64
      %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
      %641 = func.call @cc_intern(%637, %640) : (i64, i64) -> i64
      %642 = func.call @cc_nil_value() : () -> i64
      %643 = func.call @cc_cons(%641, %642) : (i64, i64) -> i64
      %644 = func.call @cc_values_pack(%643) : (i64) -> i64
      func.call @stack_push_pointer(%641) : (i64) -> ()
      %645 = llvm.mlir.addressof @str118 : !llvm.ptr
      %646 = arith.constant 27 : i64
      %647 = func.call @cc_make_string(%645, %646) : (!llvm.ptr, i64) -> i64
      %648 = llvm.mlir.addressof @str119 : !llvm.ptr
      %649 = arith.constant 4 : i64
      %650 = func.call @cc_make_string(%648, %649) : (!llvm.ptr, i64) -> i64
      %651 = func.call @cc_intern(%647, %650) : (i64, i64) -> i64
      %652 = func.call @cc_nil_value() : () -> i64
      %653 = func.call @cc_cons(%651, %652) : (i64, i64) -> i64
      %654 = func.call @cc_values_pack(%653) : (i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      %655 = llvm.mlir.addressof @str120 : !llvm.ptr
      %656 = arith.constant 22 : i64
      %657 = func.call @cc_make_string(%655, %656) : (!llvm.ptr, i64) -> i64
      %658 = llvm.mlir.addressof @str121 : !llvm.ptr
      %659 = arith.constant 4 : i64
      %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
      %661 = func.call @cc_intern(%657, %660) : (i64, i64) -> i64
      %662 = func.call @cc_nil_value() : () -> i64
      %663 = func.call @cc_cons(%661, %662) : (i64, i64) -> i64
      %664 = func.call @cc_values_pack(%663) : (i64) -> i64
      func.call @stack_push_pointer(%661) : (i64) -> ()
      %665 = llvm.mlir.addressof @str122 : !llvm.ptr
      %666 = arith.constant 36 : i64
      %667 = func.call @cc_make_string(%665, %666) : (!llvm.ptr, i64) -> i64
      %668 = llvm.mlir.addressof @str123 : !llvm.ptr
      %669 = arith.constant 4 : i64
      %670 = func.call @cc_make_string(%668, %669) : (!llvm.ptr, i64) -> i64
      %671 = func.call @cc_intern(%667, %670) : (i64, i64) -> i64
      %672 = func.call @cc_nil_value() : () -> i64
      %673 = func.call @cc_cons(%671, %672) : (i64, i64) -> i64
      %674 = func.call @cc_values_pack(%673) : (i64) -> i64
      func.call @stack_push_pointer(%671) : (i64) -> ()
      %675 = llvm.mlir.addressof @str124 : !llvm.ptr
      %676 = arith.constant 26 : i64
      %677 = func.call @cc_make_string(%675, %676) : (!llvm.ptr, i64) -> i64
      %678 = llvm.mlir.addressof @str125 : !llvm.ptr
      %679 = arith.constant 4 : i64
      %680 = func.call @cc_make_string(%678, %679) : (!llvm.ptr, i64) -> i64
      %681 = func.call @cc_intern(%677, %680) : (i64, i64) -> i64
      %682 = func.call @cc_nil_value() : () -> i64
      %683 = func.call @cc_cons(%681, %682) : (i64, i64) -> i64
      %684 = func.call @cc_values_pack(%683) : (i64) -> i64
      func.call @stack_push_pointer(%681) : (i64) -> ()
      %685 = llvm.mlir.addressof @str126 : !llvm.ptr
      %686 = arith.constant 16 : i64
      %687 = func.call @cc_make_string(%685, %686) : (!llvm.ptr, i64) -> i64
      %688 = llvm.mlir.addressof @str127 : !llvm.ptr
      %689 = arith.constant 4 : i64
      %690 = func.call @cc_make_string(%688, %689) : (!llvm.ptr, i64) -> i64
      %691 = func.call @cc_intern(%687, %690) : (i64, i64) -> i64
      %692 = func.call @cc_nil_value() : () -> i64
      %693 = func.call @cc_cons(%691, %692) : (i64, i64) -> i64
      %694 = func.call @cc_values_pack(%693) : (i64) -> i64
      func.call @stack_push_pointer(%691) : (i64) -> ()
      %695 = llvm.mlir.addressof @str128 : !llvm.ptr
      %696 = arith.constant 19 : i64
      %697 = func.call @cc_make_string(%695, %696) : (!llvm.ptr, i64) -> i64
      %698 = llvm.mlir.addressof @str129 : !llvm.ptr
      %699 = arith.constant 4 : i64
      %700 = func.call @cc_make_string(%698, %699) : (!llvm.ptr, i64) -> i64
      %701 = func.call @cc_intern(%697, %700) : (i64, i64) -> i64
      %702 = func.call @cc_nil_value() : () -> i64
      %703 = func.call @cc_cons(%701, %702) : (i64, i64) -> i64
      %704 = func.call @cc_values_pack(%703) : (i64) -> i64
      func.call @stack_push_pointer(%701) : (i64) -> ()
      %705 = llvm.mlir.addressof @str130 : !llvm.ptr
      %706 = arith.constant 19 : i64
      %707 = func.call @cc_make_string(%705, %706) : (!llvm.ptr, i64) -> i64
      %708 = llvm.mlir.addressof @str131 : !llvm.ptr
      %709 = arith.constant 4 : i64
      %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
      %711 = func.call @cc_intern(%707, %710) : (i64, i64) -> i64
      %712 = func.call @cc_nil_value() : () -> i64
      %713 = func.call @cc_cons(%711, %712) : (i64, i64) -> i64
      %714 = func.call @cc_values_pack(%713) : (i64) -> i64
      func.call @stack_push_pointer(%711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %715 = func.call @stack_pop_pointer() : () -> i64
      %716 = func.call @stack_pop_pointer() : () -> i64
      %717 = func.call @cc_cons(%716, %715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%717) : (i64) -> ()
      %718 = func.call @stack_pop_pointer() : () -> i64
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = func.call @cc_cons(%719, %718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%720) : (i64) -> ()
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @stack_pop_pointer() : () -> i64
      %723 = func.call @cc_cons(%722, %721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%723) : (i64) -> ()
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @stack_pop_pointer() : () -> i64
      %726 = func.call @cc_cons(%725, %724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%726) : (i64) -> ()
      %727 = func.call @stack_pop_pointer() : () -> i64
      %728 = func.call @stack_pop_pointer() : () -> i64
      %729 = func.call @cc_cons(%728, %727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%729) : (i64) -> ()
      %730 = func.call @stack_pop_pointer() : () -> i64
      %731 = func.call @stack_pop_pointer() : () -> i64
      %732 = func.call @cc_cons(%731, %730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%732) : (i64) -> ()
      %733 = func.call @stack_pop_pointer() : () -> i64
      %734 = func.call @stack_pop_pointer() : () -> i64
      %735 = func.call @cc_cons(%734, %733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%735) : (i64) -> ()
      %736 = func.call @stack_pop_pointer() : () -> i64
      %737 = func.call @stack_pop_pointer() : () -> i64
      %738 = func.call @cc_cons(%737, %736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%738) : (i64) -> ()
      %739 = func.call @stack_pop_pointer() : () -> i64
      %740 = func.call @stack_pop_pointer() : () -> i64
      %741 = func.call @cc_cons(%740, %739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%741) : (i64) -> ()
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
      %780 = func.call @cc_cons(%779, %778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%780) : (i64) -> ()
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
      %790 = func.call @stack_pop_pointer() : () -> i64
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_cons(%791, %790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%792) : (i64) -> ()
      %793 = func.call @stack_pop_pointer() : () -> i64
      %794 = func.call @stack_pop_pointer() : () -> i64
      %795 = func.call @cc_cons(%794, %793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%795) : (i64) -> ()
      %796 = func.call @stack_pop_pointer() : () -> i64
      %797 = func.call @stack_pop_pointer() : () -> i64
      %798 = func.call @cc_cons(%797, %796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%798) : (i64) -> ()
      %799 = func.call @stack_pop_pointer() : () -> i64
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = func.call @cc_cons(%800, %799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%801) : (i64) -> ()
      %802 = func.call @stack_pop_pointer() : () -> i64
      %803 = func.call @stack_pop_pointer() : () -> i64
      %804 = func.call @cc_cons(%803, %802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%804) : (i64) -> ()
      %805 = func.call @stack_pop_pointer() : () -> i64
      %806 = func.call @stack_pop_pointer() : () -> i64
      %807 = func.call @cc_cons(%806, %805) : (i64, i64) -> i64
      func.call @stack_push_pointer(%807) : (i64) -> ()
      %808 = func.call @stack_pop_pointer() : () -> i64
      %809 = func.call @stack_pop_pointer() : () -> i64
      %810 = func.call @cc_cons(%809, %808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%810) : (i64) -> ()
      %811 = func.call @stack_pop_pointer() : () -> i64
      %812 = func.call @stack_pop_pointer() : () -> i64
      %813 = func.call @cc_cons(%812, %811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%813) : (i64) -> ()
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = func.call @stack_pop_pointer() : () -> i64
      %816 = func.call @cc_cons(%815, %814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%816) : (i64) -> ()
      %817 = func.call @stack_pop_pointer() : () -> i64
      %818 = func.call @stack_pop_pointer() : () -> i64
      %819 = func.call @cc_cons(%818, %817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%819) : (i64) -> ()
      %820 = func.call @stack_pop_pointer() : () -> i64
      %821 = func.call @stack_pop_pointer() : () -> i64
      %822 = func.call @cc_cons(%821, %820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%822) : (i64) -> ()
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @stack_pop_pointer() : () -> i64
      %825 = func.call @cc_cons(%824, %823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%825) : (i64) -> ()
      %826 = func.call @stack_pop_pointer() : () -> i64
      %827 = func.call @stack_pop_pointer() : () -> i64
      %828 = func.call @cc_cons(%827, %826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%828) : (i64) -> ()
      %829 = func.call @stack_pop_pointer() : () -> i64
      %830 = func.call @stack_pop_pointer() : () -> i64
      %831 = func.call @cc_cons(%830, %829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%831) : (i64) -> ()
      %832 = func.call @stack_pop_pointer() : () -> i64
      %833 = func.call @stack_pop_pointer() : () -> i64
      %834 = func.call @cc_cons(%833, %832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%834) : (i64) -> ()
      %835 = func.call @stack_pop_pointer() : () -> i64
      %836 = func.call @stack_pop_pointer() : () -> i64
      %837 = func.call @cc_cons(%836, %835) : (i64, i64) -> i64
      func.call @stack_push_pointer(%837) : (i64) -> ()
      %838 = func.call @stack_pop_pointer() : () -> i64
      %839 = func.call @stack_pop_pointer() : () -> i64
      %840 = func.call @cc_cons(%839, %838) : (i64, i64) -> i64
      func.call @stack_push_pointer(%840) : (i64) -> ()
      %841 = func.call @stack_pop_pointer() : () -> i64
      %842 = func.call @stack_pop_pointer() : () -> i64
      %843 = func.call @cc_cons(%842, %841) : (i64, i64) -> i64
      func.call @stack_push_pointer(%843) : (i64) -> ()
      %844 = func.call @stack_pop_pointer() : () -> i64
      %845 = func.call @stack_pop_pointer() : () -> i64
      %846 = func.call @cc_cons(%845, %844) : (i64, i64) -> i64
      func.call @stack_push_pointer(%846) : (i64) -> ()
      %847 = func.call @stack_pop_pointer() : () -> i64
      %848 = func.call @stack_pop_pointer() : () -> i64
      %849 = func.call @cc_cons(%848, %847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%849) : (i64) -> ()
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = func.call @stack_pop_pointer() : () -> i64
      %852 = func.call @cc_cons(%851, %850) : (i64, i64) -> i64
      func.call @stack_push_pointer(%852) : (i64) -> ()
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = func.call @stack_pop_pointer() : () -> i64
      %855 = func.call @cc_cons(%854, %853) : (i64, i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      %856 = func.call @stack_pop_pointer() : () -> i64
      %857 = func.call @stack_pop_pointer() : () -> i64
      %858 = func.call @cc_cons(%857, %856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%858) : (i64) -> ()
      %859 = func.call @stack_pop_pointer() : () -> i64
      %860 = func.call @stack_pop_pointer() : () -> i64
      %861 = func.call @cc_cons(%860, %859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%861) : (i64) -> ()
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @stack_pop_pointer() : () -> i64
      %864 = func.call @cc_cons(%863, %862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%864) : (i64) -> ()
      %865 = func.call @stack_pop_pointer() : () -> i64
      %866 = func.call @stack_pop_pointer() : () -> i64
      %867 = func.call @cc_cons(%866, %865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%867) : (i64) -> ()
      %868 = func.call @stack_pop_pointer() : () -> i64
      %869 = func.call @stack_pop_pointer() : () -> i64
      %870 = func.call @cc_cons(%869, %868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%870) : (i64) -> ()
      %871 = func.call @stack_pop_pointer() : () -> i64
      %872 = func.call @stack_pop_pointer() : () -> i64
      %873 = func.call @cc_cons(%872, %871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%873) : (i64) -> ()
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
      %890 = func.call @stack_pop_pointer() : () -> i64
      %891 = func.call @cc_cons(%890, %889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%891) : (i64) -> ()
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @cc_cons(%893, %892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%894) : (i64) -> ()
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = func.call @stack_pop_pointer() : () -> i64
      %897 = func.call @cc_cons(%895, %896) : (i64, i64) -> i64
      %898 = llvm.mlir.addressof @str132 : !llvm.ptr
      %899 = arith.constant 5 : i64
      %900 = func.call @cc_make_string(%898, %899) : (!llvm.ptr, i64) -> i64
      %901 = func.call @cc_nil_value() : () -> i64
      %902 = func.call @cc_intern(%900, %901) : (i64, i64) -> i64
      %903 = func.call @cc_nil_value() : () -> i64
      %904 = func.call @cc_cons(%902, %903) : (i64, i64) -> i64
      %905 = func.call @cc_values_pack(%904) : (i64) -> i64
      %906 = func.call @cc_cons(%902, %897) : (i64, i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %913 = func.call @stack_pop_pointer() : () -> i64
      %914 = func.call @stack_pop_pointer() : () -> i64
      %915 = func.call @cc_cons(%914, %913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%915) : (i64) -> ()
      %916 = llvm.mlir.addressof @str133 : !llvm.ptr
      %917 = arith.constant 4 : i64
      %918 = func.call @cc_make_string(%916, %917) : (!llvm.ptr, i64) -> i64
      %919 = func.call @cc_nil_value() : () -> i64
      %920 = func.call @cc_intern(%918, %919) : (i64, i64) -> i64
      %921 = func.call @cc_nil_value() : () -> i64
      %922 = func.call @cc_cons(%920, %921) : (i64, i64) -> i64
      %923 = func.call @cc_values_pack(%922) : (i64) -> i64
      func.call @stack_push_pointer(%920) : (i64) -> ()
      %924 = llvm.mlir.addressof @str134 : !llvm.ptr
      %925 = arith.constant 3 : i64
      %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
      %927 = func.call @cc_nil_value() : () -> i64
      %928 = func.call @cc_intern(%926, %927) : (i64, i64) -> i64
      %929 = func.call @cc_nil_value() : () -> i64
      %930 = func.call @cc_cons(%928, %929) : (i64, i64) -> i64
      %931 = func.call @cc_values_pack(%930) : (i64) -> i64
      func.call @stack_push_pointer(%928) : (i64) -> ()
      %932 = llvm.mlir.addressof @str135 : !llvm.ptr
      %933 = arith.constant 1 : i64
      %934 = func.call @cc_make_string(%932, %933) : (!llvm.ptr, i64) -> i64
      %935 = func.call @cc_nil_value() : () -> i64
      %936 = func.call @cc_intern(%934, %935) : (i64, i64) -> i64
      %937 = func.call @cc_nil_value() : () -> i64
      %938 = func.call @cc_cons(%936, %937) : (i64, i64) -> i64
      %939 = func.call @cc_values_pack(%938) : (i64) -> i64
      func.call @stack_push_pointer(%936) : (i64) -> ()
      %940 = llvm.mlir.addressof @str136 : !llvm.ptr
      %941 = arith.constant 2 : i64
      %942 = func.call @cc_make_string(%940, %941) : (!llvm.ptr, i64) -> i64
      %943 = func.call @cc_nil_value() : () -> i64
      %944 = func.call @cc_intern(%942, %943) : (i64, i64) -> i64
      %945 = func.call @cc_nil_value() : () -> i64
      %946 = func.call @cc_cons(%944, %945) : (i64, i64) -> i64
      %947 = func.call @cc_values_pack(%946) : (i64) -> i64
      func.call @stack_push_pointer(%944) : (i64) -> ()
      %948 = llvm.mlir.addressof @str137 : !llvm.ptr
      %949 = arith.constant 17 : i64
      %950 = func.call @cc_make_string(%948, %949) : (!llvm.ptr, i64) -> i64
      %951 = func.call @cc_nil_value() : () -> i64
      %952 = func.call @cc_intern(%950, %951) : (i64, i64) -> i64
      %953 = func.call @cc_nil_value() : () -> i64
      %954 = func.call @cc_cons(%952, %953) : (i64, i64) -> i64
      %955 = func.call @cc_values_pack(%954) : (i64) -> i64
      func.call @stack_push_pointer(%952) : (i64) -> ()
      %956 = llvm.mlir.addressof @str138 : !llvm.ptr
      %957 = arith.constant 6 : i64
      %958 = func.call @cc_make_string(%956, %957) : (!llvm.ptr, i64) -> i64
      %959 = llvm.mlir.addressof @str139 : !llvm.ptr
      %960 = arith.constant 11 : i64
      %961 = func.call @cc_make_string(%959, %960) : (!llvm.ptr, i64) -> i64
      %962 = func.call @cc_intern(%958, %961) : (i64, i64) -> i64
      %963 = func.call @cc_nil_value() : () -> i64
      %964 = func.call @cc_cons(%962, %963) : (i64, i64) -> i64
      %965 = func.call @cc_values_pack(%964) : (i64) -> i64
      func.call @stack_push_pointer(%962) : (i64) -> ()
      %966 = llvm.mlir.addressof @str140 : !llvm.ptr
      %967 = arith.constant 3 : i64
      %968 = func.call @cc_make_string(%966, %967) : (!llvm.ptr, i64) -> i64
      %969 = llvm.mlir.addressof @str141 : !llvm.ptr
      %970 = arith.constant 11 : i64
      %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
      %972 = func.call @cc_intern(%968, %971) : (i64, i64) -> i64
      %973 = func.call @cc_nil_value() : () -> i64
      %974 = func.call @cc_cons(%972, %973) : (i64, i64) -> i64
      %975 = func.call @cc_values_pack(%974) : (i64) -> i64
      func.call @stack_push_pointer(%972) : (i64) -> ()
      %976 = llvm.mlir.addressof @str142 : !llvm.ptr
      %977 = arith.constant 7 : i64
      %978 = func.call @cc_make_string(%976, %977) : (!llvm.ptr, i64) -> i64
      %979 = llvm.mlir.addressof @str143 : !llvm.ptr
      %980 = arith.constant 11 : i64
      %981 = func.call @cc_make_string(%979, %980) : (!llvm.ptr, i64) -> i64
      %982 = func.call @cc_intern(%978, %981) : (i64, i64) -> i64
      %983 = func.call @cc_nil_value() : () -> i64
      %984 = func.call @cc_cons(%982, %983) : (i64, i64) -> i64
      %985 = func.call @cc_values_pack(%984) : (i64) -> i64
      func.call @stack_push_pointer(%982) : (i64) -> ()
      %986 = llvm.mlir.addressof @str144 : !llvm.ptr
      %987 = arith.constant 1 : i64
      %988 = func.call @cc_make_string(%986, %987) : (!llvm.ptr, i64) -> i64
      %989 = func.call @cc_nil_value() : () -> i64
      %990 = func.call @cc_intern(%988, %989) : (i64, i64) -> i64
      %991 = func.call @cc_nil_value() : () -> i64
      %992 = func.call @cc_cons(%990, %991) : (i64, i64) -> i64
      %993 = func.call @cc_values_pack(%992) : (i64) -> i64
      func.call @stack_push_pointer(%990) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %994 = func.call @stack_pop_pointer() : () -> i64
      %995 = func.call @stack_pop_pointer() : () -> i64
      %996 = func.call @cc_cons(%995, %994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%996) : (i64) -> ()
      %997 = func.call @stack_pop_pointer() : () -> i64
      %998 = func.call @stack_pop_pointer() : () -> i64
      %999 = func.call @cc_cons(%998, %997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%999) : (i64) -> ()
      %1000 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1001 = arith.constant 5 : i64
      %1002 = func.call @cc_make_string(%1000, %1001) : (!llvm.ptr, i64) -> i64
      %1003 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1004 = arith.constant 11 : i64
      %1005 = func.call @cc_make_string(%1003, %1004) : (!llvm.ptr, i64) -> i64
      %1006 = func.call @cc_intern(%1002, %1005) : (i64, i64) -> i64
      %1007 = func.call @cc_nil_value() : () -> i64
      %1008 = func.call @cc_cons(%1006, %1007) : (i64, i64) -> i64
      %1009 = func.call @cc_values_pack(%1008) : (i64) -> i64
      func.call @stack_push_pointer(%1006) : (i64) -> ()
      %1010 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1011 = arith.constant 11 : i64
      %1012 = func.call @cc_make_string(%1010, %1011) : (!llvm.ptr, i64) -> i64
      %1013 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1014 = arith.constant 11 : i64
      %1015 = func.call @cc_make_string(%1013, %1014) : (!llvm.ptr, i64) -> i64
      %1016 = func.call @cc_intern(%1012, %1015) : (i64, i64) -> i64
      %1017 = func.call @cc_nil_value() : () -> i64
      %1018 = func.call @cc_cons(%1016, %1017) : (i64, i64) -> i64
      %1019 = func.call @cc_values_pack(%1018) : (i64) -> i64
      func.call @stack_push_pointer(%1016) : (i64) -> ()
      %1020 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1021 = arith.constant 1 : i64
      %1022 = func.call @cc_make_string(%1020, %1021) : (!llvm.ptr, i64) -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = func.call @cc_intern(%1022, %1023) : (i64, i64) -> i64
      %1025 = func.call @cc_nil_value() : () -> i64
      %1026 = func.call @cc_cons(%1024, %1025) : (i64, i64) -> i64
      %1027 = func.call @cc_values_pack(%1026) : (i64) -> i64
      func.call @stack_push_pointer(%1024) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1028 = func.call @stack_pop_pointer() : () -> i64
      %1029 = func.call @stack_pop_pointer() : () -> i64
      %1030 = func.call @cc_cons(%1029, %1028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1030) : (i64) -> ()
      %1031 = func.call @stack_pop_pointer() : () -> i64
      %1032 = func.call @stack_pop_pointer() : () -> i64
      %1033 = func.call @cc_cons(%1032, %1031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1033) : (i64) -> ()
      %1034 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1034) : (i64) -> ()
      %1035 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1036 = arith.constant 16 : i64
      %1037 = func.call @cc_make_string(%1035, %1036) : (!llvm.ptr, i64) -> i64
      %1038 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1039 = arith.constant 11 : i64
      %1040 = func.call @cc_make_string(%1038, %1039) : (!llvm.ptr, i64) -> i64
      %1041 = func.call @cc_intern(%1037, %1040) : (i64, i64) -> i64
      %1042 = func.call @cc_nil_value() : () -> i64
      %1043 = func.call @cc_cons(%1041, %1042) : (i64, i64) -> i64
      %1044 = func.call @cc_values_pack(%1043) : (i64) -> i64
      func.call @stack_push_pointer(%1041) : (i64) -> ()
      %1045 = func.call @stack_pop_pointer() : () -> i64
      %1046 = func.call @stack_pop_pointer() : () -> i64
      %1047 = func.call @cc_cons(%1045, %1046) : (i64, i64) -> i64
      %1048 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1049 = arith.constant 5 : i64
      %1050 = func.call @cc_make_string(%1048, %1049) : (!llvm.ptr, i64) -> i64
      %1051 = func.call @cc_nil_value() : () -> i64
      %1052 = func.call @cc_intern(%1050, %1051) : (i64, i64) -> i64
      %1053 = func.call @cc_nil_value() : () -> i64
      %1054 = func.call @cc_cons(%1052, %1053) : (i64, i64) -> i64
      %1055 = func.call @cc_values_pack(%1054) : (i64) -> i64
      %1056 = func.call @cc_cons(%1052, %1047) : (i64, i64) -> i64
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
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = func.call @stack_pop_pointer() : () -> i64
      %1065 = func.call @cc_cons(%1064, %1063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1065) : (i64) -> ()
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
      %1075 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1076 = arith.constant 7 : i64
      %1077 = func.call @cc_make_string(%1075, %1076) : (!llvm.ptr, i64) -> i64
      %1078 = func.call @cc_nil_value() : () -> i64
      %1079 = func.call @cc_intern(%1077, %1078) : (i64, i64) -> i64
      %1080 = func.call @cc_nil_value() : () -> i64
      %1081 = func.call @cc_cons(%1079, %1080) : (i64, i64) -> i64
      %1082 = func.call @cc_values_pack(%1081) : (i64) -> i64
      func.call @stack_push_pointer(%1079) : (i64) -> ()
      %1083 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1084 = arith.constant 1 : i64
      %1085 = func.call @cc_make_string(%1083, %1084) : (!llvm.ptr, i64) -> i64
      %1086 = func.call @cc_nil_value() : () -> i64
      %1087 = func.call @cc_intern(%1085, %1086) : (i64, i64) -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_cons(%1087, %1088) : (i64, i64) -> i64
      %1090 = func.call @cc_values_pack(%1089) : (i64) -> i64
      func.call @stack_push_pointer(%1087) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @stack_pop_pointer() : () -> i64
      %1093 = func.call @cc_cons(%1092, %1091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1093) : (i64) -> ()
      %1094 = func.call @stack_pop_pointer() : () -> i64
      %1095 = func.call @stack_pop_pointer() : () -> i64
      %1096 = func.call @cc_cons(%1095, %1094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1096) : (i64) -> ()
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @stack_pop_pointer() : () -> i64
      %1099 = func.call @cc_cons(%1098, %1097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1099) : (i64) -> ()
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1101 = func.call @stack_pop_pointer() : () -> i64
      %1102 = func.call @cc_cons(%1101, %1100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1102) : (i64) -> ()
      %1103 = func.call @stack_pop_pointer() : () -> i64
      %1104 = func.call @stack_pop_pointer() : () -> i64
      %1105 = func.call @cc_cons(%1104, %1103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1105) : (i64) -> ()
      %1106 = func.call @stack_pop_pointer() : () -> i64
      %1107 = func.call @stack_pop_pointer() : () -> i64
      %1108 = func.call @cc_cons(%1107, %1106) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1108) : (i64) -> ()
      %1109 = func.call @stack_pop_pointer() : () -> i64
      %1110 = func.call @stack_pop_pointer() : () -> i64
      %1111 = func.call @cc_cons(%1110, %1109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1111) : (i64) -> ()
      %1112 = func.call @stack_pop_pointer() : () -> i64
      %1113 = func.call @stack_pop_pointer() : () -> i64
      %1114 = func.call @cc_cons(%1113, %1112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1114) : (i64) -> ()
      %1115 = func.call @stack_pop_pointer() : () -> i64
      %1116 = func.call @stack_pop_pointer() : () -> i64
      %1117 = func.call @cc_cons(%1116, %1115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1118 = func.call @stack_pop_pointer() : () -> i64
      %1119 = func.call @stack_pop_pointer() : () -> i64
      %1120 = func.call @cc_cons(%1119, %1118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1120) : (i64) -> ()
      %1121 = func.call @stack_pop_pointer() : () -> i64
      %1122 = func.call @stack_pop_pointer() : () -> i64
      %1123 = func.call @cc_cons(%1122, %1121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1123) : (i64) -> ()
      %1124 = func.call @stack_pop_pointer() : () -> i64
      %1125 = func.call @stack_pop_pointer() : () -> i64
      %1126 = func.call @cc_cons(%1125, %1124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1126) : (i64) -> ()
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %2219 = arith.constant 120590987952129 : i64
      %2220 = arith.constant 0 : i64
      %2221 = func.call @cc_make_closure(%2219, %2220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2221) : (i64) -> ()
      %2222 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2223 = func.call @stack_pop_pointer() : () -> i64
      %2224 = func.call @stack_pop_pointer() : () -> i64
      %2225 = func.call @cc_cons(%2224, %2223) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2225) : (i64) -> ()
      %2226 = func.call @stack_pop_pointer() : () -> i64
      %2227 = llvm.mlir.addressof @str294 : !llvm.ptr
      %2228 = arith.constant 11 : i64
      %2229 = func.call @cc_make_string(%2227, %2228) : (!llvm.ptr, i64) -> i64
      %2230 = llvm.mlir.addressof @str295 : !llvm.ptr
      %2231 = arith.constant 7 : i64
      %2232 = func.call @cc_make_string(%2230, %2231) : (!llvm.ptr, i64) -> i64
      %2233 = func.call @cc_intern(%2229, %2232) : (i64, i64) -> i64
      %2234 = func.call @cc_nil_value() : () -> i64
      %2235 = func.call @cc_cons(%2233, %2234) : (i64, i64) -> i64
      %2236 = func.call @cc_values_pack(%2235) : (i64) -> i64
      func.call @stack_push_pointer(%2233) : (i64) -> ()
      %2237 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2238 = func.call @stack_pop_pointer() : () -> i64
      %2239 = llvm.mlir.addressof @str296 : !llvm.ptr
      %2240 = arith.constant 4 : i64
      %2241 = func.call @cc_make_string(%2239, %2240) : (!llvm.ptr, i64) -> i64
      %2242 = llvm.mlir.addressof @str297 : !llvm.ptr
      %2243 = arith.constant 7 : i64
      %2244 = func.call @cc_make_string(%2242, %2243) : (!llvm.ptr, i64) -> i64
      %2245 = func.call @cc_intern(%2241, %2244) : (i64, i64) -> i64
      %2246 = func.call @cc_nil_value() : () -> i64
      %2247 = func.call @cc_cons(%2245, %2246) : (i64, i64) -> i64
      %2248 = func.call @cc_values_pack(%2247) : (i64) -> i64
      func.call @stack_push_pointer(%2245) : (i64) -> ()
      %2249 = func.call @stack_pop_pointer() : () -> i64
      %2250 = llvm.mlir.addressof @str298 : !llvm.ptr
      %2251 = arith.constant 6 : i64
      %2252 = func.call @cc_make_string(%2250, %2251) : (!llvm.ptr, i64) -> i64
      %2253 = func.call @cc_nil_value() : () -> i64
      %2254 = func.call @cc_intern(%2252, %2253) : (i64, i64) -> i64
      %2255 = func.call @cc_nil_value() : () -> i64
      %2256 = func.call @cc_cons(%2254, %2255) : (i64, i64) -> i64
      %2257 = func.call @cc_values_pack(%2256) : (i64) -> i64
      func.call @stack_push_pointer(%2254) : (i64) -> ()
      %2258 = func.call @stack_pop_pointer() : () -> i64
      %2259 = func.call @cc_nil_value() : () -> i64
      %2260 = func.call @cc_errorp(%65) : (i64) -> i64
      %2261 = arith.cmpi ne, %2260, %2259 : i64
      %2262 = arith.cmpi eq, %2259, %2259 : i64
      %2263 = arith.andi %2261, %2262 : i1
      %2264 = scf.if %2263 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %2259 : i64
      }
      %2265 = func.call @cc_errorp(%1127) : (i64) -> i64
      %2266 = arith.cmpi ne, %2265, %2259 : i64
      %2267 = arith.cmpi eq, %2264, %2259 : i64
      %2268 = arith.andi %2266, %2267 : i1
      %2269 = scf.if %2268 -> (i64) {
        scf.yield %1127 : i64
      } else {
        scf.yield %2264 : i64
      }
      %2270 = func.call @cc_errorp(%2222) : (i64) -> i64
      %2271 = arith.cmpi ne, %2270, %2259 : i64
      %2272 = arith.cmpi eq, %2269, %2259 : i64
      %2273 = arith.andi %2271, %2272 : i1
      %2274 = scf.if %2273 -> (i64) {
        scf.yield %2222 : i64
      } else {
        scf.yield %2269 : i64
      }
      %2275 = func.call @cc_errorp(%2226) : (i64) -> i64
      %2276 = arith.cmpi ne, %2275, %2259 : i64
      %2277 = arith.cmpi eq, %2274, %2259 : i64
      %2278 = arith.andi %2276, %2277 : i1
      %2279 = scf.if %2278 -> (i64) {
        scf.yield %2226 : i64
      } else {
        scf.yield %2274 : i64
      }
      %2280 = func.call @cc_errorp(%2237) : (i64) -> i64
      %2281 = arith.cmpi ne, %2280, %2259 : i64
      %2282 = arith.cmpi eq, %2279, %2259 : i64
      %2283 = arith.andi %2281, %2282 : i1
      %2284 = scf.if %2283 -> (i64) {
        scf.yield %2237 : i64
      } else {
        scf.yield %2279 : i64
      }
      %2285 = func.call @cc_errorp(%2238) : (i64) -> i64
      %2286 = arith.cmpi ne, %2285, %2259 : i64
      %2287 = arith.cmpi eq, %2284, %2259 : i64
      %2288 = arith.andi %2286, %2287 : i1
      %2289 = scf.if %2288 -> (i64) {
        scf.yield %2238 : i64
      } else {
        scf.yield %2284 : i64
      }
      %2290 = func.call @cc_errorp(%2249) : (i64) -> i64
      %2291 = arith.cmpi ne, %2290, %2259 : i64
      %2292 = arith.cmpi eq, %2289, %2259 : i64
      %2293 = arith.andi %2291, %2292 : i1
      %2294 = scf.if %2293 -> (i64) {
        scf.yield %2249 : i64
      } else {
        scf.yield %2289 : i64
      }
      %2295 = func.call @cc_errorp(%2258) : (i64) -> i64
      %2296 = arith.cmpi ne, %2295, %2259 : i64
      %2297 = arith.cmpi eq, %2294, %2259 : i64
      %2298 = arith.andi %2296, %2297 : i1
      %2299 = scf.if %2298 -> (i64) {
        scf.yield %2258 : i64
      } else {
        scf.yield %2294 : i64
      }
      %2300 = arith.cmpi ne, %2299, %2259 : i64
      scf.if %2300 {
        func.call @stack_push_pointer(%2299) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%1127) : (i64) -> ()
        func.call @stack_push_pointer(%2222) : (i64) -> ()
        func.call @stack_push_pointer(%2226) : (i64) -> ()
        func.call @stack_push_pointer(%2237) : (i64) -> ()
        func.call @stack_push_pointer(%2238) : (i64) -> ()
        func.call @stack_push_pointer(%2249) : (i64) -> ()
        func.call @stack_push_pointer(%2258) : (i64) -> ()
        %2301 = llvm.mlir.addressof @str299 : !llvm.ptr
        %2302 = func.call @cc_make_function_ref_const(%2301) : (!llvm.ptr) -> i64
        %2303 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2302, %2303) : (i64, i64) -> ()
      }
      %2304 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2304 : i64
    }
    %2305 = func.call @cc_nil_value() : () -> i64
    %2306 = func.call @cc_errorp(%56) : (i64) -> i64
    %2307 = arith.cmpi ne, %2306, %2305 : i64
    %2308 = scf.if %2307 -> (i64) {
      scf.yield %56 : i64
    } else {
      %2309 = llvm.mlir.addressof @str300 : !llvm.ptr
      %2310 = arith.constant 23 : i64
      %2311 = func.call @cc_make_string(%2309, %2310) : (!llvm.ptr, i64) -> i64
      %2312 = func.call @cc_nil_value() : () -> i64
      %2313 = func.call @cc_intern(%2311, %2312) : (i64, i64) -> i64
      %2314 = func.call @cc_nil_value() : () -> i64
      %2315 = func.call @cc_cons(%2313, %2314) : (i64, i64) -> i64
      %2316 = func.call @cc_values_pack(%2315) : (i64) -> i64
      func.call @stack_push_pointer(%2313) : (i64) -> ()
      %2317 = func.call @stack_pop_pointer() : () -> i64
      %2318 = llvm.mlir.addressof @str301 : !llvm.ptr
      %2319 = arith.constant 3 : i64
      %2320 = func.call @cc_make_string(%2318, %2319) : (!llvm.ptr, i64) -> i64
      %2321 = func.call @cc_nil_value() : () -> i64
      %2322 = func.call @cc_intern(%2320, %2321) : (i64, i64) -> i64
      %2323 = func.call @cc_nil_value() : () -> i64
      %2324 = func.call @cc_cons(%2322, %2323) : (i64, i64) -> i64
      %2325 = func.call @cc_values_pack(%2324) : (i64) -> i64
      func.call @stack_push_pointer(%2322) : (i64) -> ()
      %2326 = llvm.mlir.addressof @str302 : !llvm.ptr
      %2327 = arith.constant 16 : i64
      %2328 = func.call @cc_make_string(%2326, %2327) : (!llvm.ptr, i64) -> i64
      %2329 = func.call @cc_nil_value() : () -> i64
      %2330 = func.call @cc_intern(%2328, %2329) : (i64, i64) -> i64
      %2331 = func.call @cc_nil_value() : () -> i64
      %2332 = func.call @cc_cons(%2330, %2331) : (i64, i64) -> i64
      %2333 = func.call @cc_values_pack(%2332) : (i64) -> i64
      func.call @stack_push_pointer(%2330) : (i64) -> ()
      %2334 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2334) : (i64) -> ()
      %2335 = llvm.mlir.addressof @str303 : !llvm.ptr
      %2336 = arith.constant 22 : i64
      %2337 = func.call @cc_make_string(%2335, %2336) : (!llvm.ptr, i64) -> i64
      %2338 = llvm.mlir.addressof @str304 : !llvm.ptr
      %2339 = arith.constant 4 : i64
      %2340 = func.call @cc_make_string(%2338, %2339) : (!llvm.ptr, i64) -> i64
      %2341 = func.call @cc_intern(%2337, %2340) : (i64, i64) -> i64
      %2342 = func.call @cc_nil_value() : () -> i64
      %2343 = func.call @cc_cons(%2341, %2342) : (i64, i64) -> i64
      %2344 = func.call @cc_values_pack(%2343) : (i64) -> i64
      func.call @stack_push_pointer(%2341) : (i64) -> ()
      %2345 = llvm.mlir.addressof @str305 : !llvm.ptr
      %2346 = arith.constant 19 : i64
      %2347 = func.call @cc_make_string(%2345, %2346) : (!llvm.ptr, i64) -> i64
      %2348 = llvm.mlir.addressof @str306 : !llvm.ptr
      %2349 = arith.constant 4 : i64
      %2350 = func.call @cc_make_string(%2348, %2349) : (!llvm.ptr, i64) -> i64
      %2351 = func.call @cc_intern(%2347, %2350) : (i64, i64) -> i64
      %2352 = func.call @cc_nil_value() : () -> i64
      %2353 = func.call @cc_cons(%2351, %2352) : (i64, i64) -> i64
      %2354 = func.call @cc_values_pack(%2353) : (i64) -> i64
      func.call @stack_push_pointer(%2351) : (i64) -> ()
      %2355 = llvm.mlir.addressof @str307 : !llvm.ptr
      %2356 = arith.constant 25 : i64
      %2357 = func.call @cc_make_string(%2355, %2356) : (!llvm.ptr, i64) -> i64
      %2358 = llvm.mlir.addressof @str308 : !llvm.ptr
      %2359 = arith.constant 4 : i64
      %2360 = func.call @cc_make_string(%2358, %2359) : (!llvm.ptr, i64) -> i64
      %2361 = func.call @cc_intern(%2357, %2360) : (i64, i64) -> i64
      %2362 = func.call @cc_nil_value() : () -> i64
      %2363 = func.call @cc_cons(%2361, %2362) : (i64, i64) -> i64
      %2364 = func.call @cc_values_pack(%2363) : (i64) -> i64
      func.call @stack_push_pointer(%2361) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2365 = func.call @stack_pop_pointer() : () -> i64
      %2366 = func.call @stack_pop_pointer() : () -> i64
      %2367 = func.call @cc_cons(%2366, %2365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2367) : (i64) -> ()
      %2368 = func.call @stack_pop_pointer() : () -> i64
      %2369 = func.call @stack_pop_pointer() : () -> i64
      %2370 = func.call @cc_cons(%2369, %2368) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2370) : (i64) -> ()
      %2371 = func.call @stack_pop_pointer() : () -> i64
      %2372 = func.call @stack_pop_pointer() : () -> i64
      %2373 = func.call @cc_cons(%2372, %2371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2373) : (i64) -> ()
      %2374 = func.call @stack_pop_pointer() : () -> i64
      %2375 = func.call @stack_pop_pointer() : () -> i64
      %2376 = func.call @cc_cons(%2374, %2375) : (i64, i64) -> i64
      %2377 = llvm.mlir.addressof @str309 : !llvm.ptr
      %2378 = arith.constant 5 : i64
      %2379 = func.call @cc_make_string(%2377, %2378) : (!llvm.ptr, i64) -> i64
      %2380 = func.call @cc_nil_value() : () -> i64
      %2381 = func.call @cc_intern(%2379, %2380) : (i64, i64) -> i64
      %2382 = func.call @cc_nil_value() : () -> i64
      %2383 = func.call @cc_cons(%2381, %2382) : (i64, i64) -> i64
      %2384 = func.call @cc_values_pack(%2383) : (i64) -> i64
      %2385 = func.call @cc_cons(%2381, %2376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2385) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2386 = func.call @stack_pop_pointer() : () -> i64
      %2387 = func.call @stack_pop_pointer() : () -> i64
      %2388 = func.call @cc_cons(%2387, %2386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2388) : (i64) -> ()
      %2389 = func.call @stack_pop_pointer() : () -> i64
      %2390 = func.call @stack_pop_pointer() : () -> i64
      %2391 = func.call @cc_cons(%2390, %2389) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2391) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2392 = func.call @stack_pop_pointer() : () -> i64
      %2393 = func.call @stack_pop_pointer() : () -> i64
      %2394 = func.call @cc_cons(%2393, %2392) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2394) : (i64) -> ()
      %2395 = llvm.mlir.addressof @str310 : !llvm.ptr
      %2396 = arith.constant 4 : i64
      %2397 = func.call @cc_make_string(%2395, %2396) : (!llvm.ptr, i64) -> i64
      %2398 = func.call @cc_nil_value() : () -> i64
      %2399 = func.call @cc_intern(%2397, %2398) : (i64, i64) -> i64
      %2400 = func.call @cc_nil_value() : () -> i64
      %2401 = func.call @cc_cons(%2399, %2400) : (i64, i64) -> i64
      %2402 = func.call @cc_values_pack(%2401) : (i64) -> i64
      func.call @stack_push_pointer(%2399) : (i64) -> ()
      %2403 = llvm.mlir.addressof @str311 : !llvm.ptr
      %2404 = arith.constant 3 : i64
      %2405 = func.call @cc_make_string(%2403, %2404) : (!llvm.ptr, i64) -> i64
      %2406 = func.call @cc_nil_value() : () -> i64
      %2407 = func.call @cc_intern(%2405, %2406) : (i64, i64) -> i64
      %2408 = func.call @cc_nil_value() : () -> i64
      %2409 = func.call @cc_cons(%2407, %2408) : (i64, i64) -> i64
      %2410 = func.call @cc_values_pack(%2409) : (i64) -> i64
      func.call @stack_push_pointer(%2407) : (i64) -> ()
      %2411 = llvm.mlir.addressof @str312 : !llvm.ptr
      %2412 = arith.constant 1 : i64
      %2413 = func.call @cc_make_string(%2411, %2412) : (!llvm.ptr, i64) -> i64
      %2414 = func.call @cc_nil_value() : () -> i64
      %2415 = func.call @cc_intern(%2413, %2414) : (i64, i64) -> i64
      %2416 = func.call @cc_nil_value() : () -> i64
      %2417 = func.call @cc_cons(%2415, %2416) : (i64, i64) -> i64
      %2418 = func.call @cc_values_pack(%2417) : (i64) -> i64
      func.call @stack_push_pointer(%2415) : (i64) -> ()
      %2419 = llvm.mlir.addressof @str313 : !llvm.ptr
      %2420 = arith.constant 2 : i64
      %2421 = func.call @cc_make_string(%2419, %2420) : (!llvm.ptr, i64) -> i64
      %2422 = func.call @cc_nil_value() : () -> i64
      %2423 = func.call @cc_intern(%2421, %2422) : (i64, i64) -> i64
      %2424 = func.call @cc_nil_value() : () -> i64
      %2425 = func.call @cc_cons(%2423, %2424) : (i64, i64) -> i64
      %2426 = func.call @cc_values_pack(%2425) : (i64) -> i64
      func.call @stack_push_pointer(%2423) : (i64) -> ()
      %2427 = llvm.mlir.addressof @str314 : !llvm.ptr
      %2428 = arith.constant 16 : i64
      %2429 = func.call @cc_make_string(%2427, %2428) : (!llvm.ptr, i64) -> i64
      %2430 = func.call @cc_nil_value() : () -> i64
      %2431 = func.call @cc_intern(%2429, %2430) : (i64, i64) -> i64
      %2432 = func.call @cc_nil_value() : () -> i64
      %2433 = func.call @cc_cons(%2431, %2432) : (i64, i64) -> i64
      %2434 = func.call @cc_values_pack(%2433) : (i64) -> i64
      func.call @stack_push_pointer(%2431) : (i64) -> ()
      %2435 = llvm.mlir.addressof @str315 : !llvm.ptr
      %2436 = arith.constant 6 : i64
      %2437 = func.call @cc_make_string(%2435, %2436) : (!llvm.ptr, i64) -> i64
      %2438 = llvm.mlir.addressof @str316 : !llvm.ptr
      %2439 = arith.constant 11 : i64
      %2440 = func.call @cc_make_string(%2438, %2439) : (!llvm.ptr, i64) -> i64
      %2441 = func.call @cc_intern(%2437, %2440) : (i64, i64) -> i64
      %2442 = func.call @cc_nil_value() : () -> i64
      %2443 = func.call @cc_cons(%2441, %2442) : (i64, i64) -> i64
      %2444 = func.call @cc_values_pack(%2443) : (i64) -> i64
      func.call @stack_push_pointer(%2441) : (i64) -> ()
      %2445 = llvm.mlir.addressof @str317 : !llvm.ptr
      %2446 = arith.constant 7 : i64
      %2447 = func.call @cc_make_string(%2445, %2446) : (!llvm.ptr, i64) -> i64
      %2448 = llvm.mlir.addressof @str318 : !llvm.ptr
      %2449 = arith.constant 11 : i64
      %2450 = func.call @cc_make_string(%2448, %2449) : (!llvm.ptr, i64) -> i64
      %2451 = func.call @cc_intern(%2447, %2450) : (i64, i64) -> i64
      %2452 = func.call @cc_nil_value() : () -> i64
      %2453 = func.call @cc_cons(%2451, %2452) : (i64, i64) -> i64
      %2454 = func.call @cc_values_pack(%2453) : (i64) -> i64
      func.call @stack_push_pointer(%2451) : (i64) -> ()
      %2455 = llvm.mlir.addressof @str319 : !llvm.ptr
      %2456 = arith.constant 1 : i64
      %2457 = func.call @cc_make_string(%2455, %2456) : (!llvm.ptr, i64) -> i64
      %2458 = func.call @cc_nil_value() : () -> i64
      %2459 = func.call @cc_intern(%2457, %2458) : (i64, i64) -> i64
      %2460 = func.call @cc_nil_value() : () -> i64
      %2461 = func.call @cc_cons(%2459, %2460) : (i64, i64) -> i64
      %2462 = func.call @cc_values_pack(%2461) : (i64) -> i64
      func.call @stack_push_pointer(%2459) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2463 = func.call @stack_pop_pointer() : () -> i64
      %2464 = func.call @stack_pop_pointer() : () -> i64
      %2465 = func.call @cc_cons(%2464, %2463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2465) : (i64) -> ()
      %2466 = func.call @stack_pop_pointer() : () -> i64
      %2467 = func.call @stack_pop_pointer() : () -> i64
      %2468 = func.call @cc_cons(%2467, %2466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2468) : (i64) -> ()
      %2469 = llvm.mlir.addressof @str320 : !llvm.ptr
      %2470 = arith.constant 7 : i64
      %2471 = func.call @cc_make_string(%2469, %2470) : (!llvm.ptr, i64) -> i64
      %2472 = func.call @cc_nil_value() : () -> i64
      %2473 = func.call @cc_intern(%2471, %2472) : (i64, i64) -> i64
      %2474 = func.call @cc_nil_value() : () -> i64
      %2475 = func.call @cc_cons(%2473, %2474) : (i64, i64) -> i64
      %2476 = func.call @cc_values_pack(%2475) : (i64) -> i64
      func.call @stack_push_pointer(%2473) : (i64) -> ()
      %2477 = llvm.mlir.addressof @str321 : !llvm.ptr
      %2478 = arith.constant 1 : i64
      %2479 = func.call @cc_make_string(%2477, %2478) : (!llvm.ptr, i64) -> i64
      %2480 = func.call @cc_nil_value() : () -> i64
      %2481 = func.call @cc_intern(%2479, %2480) : (i64, i64) -> i64
      %2482 = func.call @cc_nil_value() : () -> i64
      %2483 = func.call @cc_cons(%2481, %2482) : (i64, i64) -> i64
      %2484 = func.call @cc_values_pack(%2483) : (i64) -> i64
      func.call @stack_push_pointer(%2481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2485 = func.call @stack_pop_pointer() : () -> i64
      %2486 = func.call @stack_pop_pointer() : () -> i64
      %2487 = func.call @cc_cons(%2486, %2485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2487) : (i64) -> ()
      %2488 = func.call @stack_pop_pointer() : () -> i64
      %2489 = func.call @stack_pop_pointer() : () -> i64
      %2490 = func.call @cc_cons(%2489, %2488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2490) : (i64) -> ()
      %2491 = func.call @stack_pop_pointer() : () -> i64
      %2492 = func.call @stack_pop_pointer() : () -> i64
      %2493 = func.call @cc_cons(%2492, %2491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2493) : (i64) -> ()
      %2494 = func.call @stack_pop_pointer() : () -> i64
      %2495 = func.call @stack_pop_pointer() : () -> i64
      %2496 = func.call @cc_cons(%2495, %2494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2496) : (i64) -> ()
      %2497 = func.call @stack_pop_pointer() : () -> i64
      %2498 = func.call @stack_pop_pointer() : () -> i64
      %2499 = func.call @cc_cons(%2498, %2497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2499) : (i64) -> ()
      %2500 = func.call @stack_pop_pointer() : () -> i64
      %2501 = func.call @stack_pop_pointer() : () -> i64
      %2502 = func.call @cc_cons(%2501, %2500) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2502) : (i64) -> ()
      %2503 = func.call @stack_pop_pointer() : () -> i64
      %2504 = func.call @stack_pop_pointer() : () -> i64
      %2505 = func.call @cc_cons(%2504, %2503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2505) : (i64) -> ()
      %2506 = func.call @stack_pop_pointer() : () -> i64
      %2507 = func.call @stack_pop_pointer() : () -> i64
      %2508 = func.call @cc_cons(%2507, %2506) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2508) : (i64) -> ()
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @stack_pop_pointer() : () -> i64
      %2511 = func.call @cc_cons(%2510, %2509) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2511) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2512 = func.call @stack_pop_pointer() : () -> i64
      %2513 = func.call @stack_pop_pointer() : () -> i64
      %2514 = func.call @cc_cons(%2513, %2512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2514) : (i64) -> ()
      %2515 = func.call @stack_pop_pointer() : () -> i64
      %2516 = func.call @stack_pop_pointer() : () -> i64
      %2517 = func.call @cc_cons(%2516, %2515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2517) : (i64) -> ()
      %2518 = func.call @stack_pop_pointer() : () -> i64
      %2519 = func.call @stack_pop_pointer() : () -> i64
      %2520 = func.call @cc_cons(%2519, %2518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2520) : (i64) -> ()
      %2521 = func.call @stack_pop_pointer() : () -> i64
      %2819 = arith.constant 120590987952131 : i64
      %2820 = arith.constant 0 : i64
      %2821 = func.call @cc_make_closure(%2819, %2820) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2821) : (i64) -> ()
      %2822 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2823 = func.call @stack_pop_pointer() : () -> i64
      %2824 = func.call @stack_pop_pointer() : () -> i64
      %2825 = func.call @cc_cons(%2824, %2823) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2825) : (i64) -> ()
      %2826 = func.call @stack_pop_pointer() : () -> i64
      %2827 = llvm.mlir.addressof @str341 : !llvm.ptr
      %2828 = arith.constant 11 : i64
      %2829 = func.call @cc_make_string(%2827, %2828) : (!llvm.ptr, i64) -> i64
      %2830 = llvm.mlir.addressof @str342 : !llvm.ptr
      %2831 = arith.constant 7 : i64
      %2832 = func.call @cc_make_string(%2830, %2831) : (!llvm.ptr, i64) -> i64
      %2833 = func.call @cc_intern(%2829, %2832) : (i64, i64) -> i64
      %2834 = func.call @cc_nil_value() : () -> i64
      %2835 = func.call @cc_cons(%2833, %2834) : (i64, i64) -> i64
      %2836 = func.call @cc_values_pack(%2835) : (i64) -> i64
      func.call @stack_push_pointer(%2833) : (i64) -> ()
      %2837 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2838 = func.call @stack_pop_pointer() : () -> i64
      %2839 = llvm.mlir.addressof @str343 : !llvm.ptr
      %2840 = arith.constant 4 : i64
      %2841 = func.call @cc_make_string(%2839, %2840) : (!llvm.ptr, i64) -> i64
      %2842 = llvm.mlir.addressof @str344 : !llvm.ptr
      %2843 = arith.constant 7 : i64
      %2844 = func.call @cc_make_string(%2842, %2843) : (!llvm.ptr, i64) -> i64
      %2845 = func.call @cc_intern(%2841, %2844) : (i64, i64) -> i64
      %2846 = func.call @cc_nil_value() : () -> i64
      %2847 = func.call @cc_cons(%2845, %2846) : (i64, i64) -> i64
      %2848 = func.call @cc_values_pack(%2847) : (i64) -> i64
      func.call @stack_push_pointer(%2845) : (i64) -> ()
      %2849 = func.call @stack_pop_pointer() : () -> i64
      %2850 = llvm.mlir.addressof @str345 : !llvm.ptr
      %2851 = arith.constant 6 : i64
      %2852 = func.call @cc_make_string(%2850, %2851) : (!llvm.ptr, i64) -> i64
      %2853 = func.call @cc_nil_value() : () -> i64
      %2854 = func.call @cc_intern(%2852, %2853) : (i64, i64) -> i64
      %2855 = func.call @cc_nil_value() : () -> i64
      %2856 = func.call @cc_cons(%2854, %2855) : (i64, i64) -> i64
      %2857 = func.call @cc_values_pack(%2856) : (i64) -> i64
      func.call @stack_push_pointer(%2854) : (i64) -> ()
      %2858 = func.call @stack_pop_pointer() : () -> i64
      %2859 = func.call @cc_nil_value() : () -> i64
      %2860 = func.call @cc_errorp(%2317) : (i64) -> i64
      %2861 = arith.cmpi ne, %2860, %2859 : i64
      %2862 = arith.cmpi eq, %2859, %2859 : i64
      %2863 = arith.andi %2861, %2862 : i1
      %2864 = scf.if %2863 -> (i64) {
        scf.yield %2317 : i64
      } else {
        scf.yield %2859 : i64
      }
      %2865 = func.call @cc_errorp(%2521) : (i64) -> i64
      %2866 = arith.cmpi ne, %2865, %2859 : i64
      %2867 = arith.cmpi eq, %2864, %2859 : i64
      %2868 = arith.andi %2866, %2867 : i1
      %2869 = scf.if %2868 -> (i64) {
        scf.yield %2521 : i64
      } else {
        scf.yield %2864 : i64
      }
      %2870 = func.call @cc_errorp(%2822) : (i64) -> i64
      %2871 = arith.cmpi ne, %2870, %2859 : i64
      %2872 = arith.cmpi eq, %2869, %2859 : i64
      %2873 = arith.andi %2871, %2872 : i1
      %2874 = scf.if %2873 -> (i64) {
        scf.yield %2822 : i64
      } else {
        scf.yield %2869 : i64
      }
      %2875 = func.call @cc_errorp(%2826) : (i64) -> i64
      %2876 = arith.cmpi ne, %2875, %2859 : i64
      %2877 = arith.cmpi eq, %2874, %2859 : i64
      %2878 = arith.andi %2876, %2877 : i1
      %2879 = scf.if %2878 -> (i64) {
        scf.yield %2826 : i64
      } else {
        scf.yield %2874 : i64
      }
      %2880 = func.call @cc_errorp(%2837) : (i64) -> i64
      %2881 = arith.cmpi ne, %2880, %2859 : i64
      %2882 = arith.cmpi eq, %2879, %2859 : i64
      %2883 = arith.andi %2881, %2882 : i1
      %2884 = scf.if %2883 -> (i64) {
        scf.yield %2837 : i64
      } else {
        scf.yield %2879 : i64
      }
      %2885 = func.call @cc_errorp(%2838) : (i64) -> i64
      %2886 = arith.cmpi ne, %2885, %2859 : i64
      %2887 = arith.cmpi eq, %2884, %2859 : i64
      %2888 = arith.andi %2886, %2887 : i1
      %2889 = scf.if %2888 -> (i64) {
        scf.yield %2838 : i64
      } else {
        scf.yield %2884 : i64
      }
      %2890 = func.call @cc_errorp(%2849) : (i64) -> i64
      %2891 = arith.cmpi ne, %2890, %2859 : i64
      %2892 = arith.cmpi eq, %2889, %2859 : i64
      %2893 = arith.andi %2891, %2892 : i1
      %2894 = scf.if %2893 -> (i64) {
        scf.yield %2849 : i64
      } else {
        scf.yield %2889 : i64
      }
      %2895 = func.call @cc_errorp(%2858) : (i64) -> i64
      %2896 = arith.cmpi ne, %2895, %2859 : i64
      %2897 = arith.cmpi eq, %2894, %2859 : i64
      %2898 = arith.andi %2896, %2897 : i1
      %2899 = scf.if %2898 -> (i64) {
        scf.yield %2858 : i64
      } else {
        scf.yield %2894 : i64
      }
      %2900 = arith.cmpi ne, %2899, %2859 : i64
      scf.if %2900 {
        func.call @stack_push_pointer(%2899) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2317) : (i64) -> ()
        func.call @stack_push_pointer(%2521) : (i64) -> ()
        func.call @stack_push_pointer(%2822) : (i64) -> ()
        func.call @stack_push_pointer(%2826) : (i64) -> ()
        func.call @stack_push_pointer(%2837) : (i64) -> ()
        func.call @stack_push_pointer(%2838) : (i64) -> ()
        func.call @stack_push_pointer(%2849) : (i64) -> ()
        func.call @stack_push_pointer(%2858) : (i64) -> ()
        %2901 = llvm.mlir.addressof @str346 : !llvm.ptr
        %2902 = func.call @cc_make_function_ref_const(%2901) : (!llvm.ptr) -> i64
        %2903 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2902, %2903) : (i64, i64) -> ()
      }
      %2904 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2904 : i64
    }
    %2905 = func.call @cc_nil_value() : () -> i64
    %2906 = func.call @cc_errorp(%2308) : (i64) -> i64
    %2907 = arith.cmpi ne, %2906, %2905 : i64
    %2908 = scf.if %2907 -> (i64) {
      scf.yield %2308 : i64
    } else {
      %2909 = llvm.mlir.addressof @str347 : !llvm.ptr
      %2910 = arith.constant 22 : i64
      %2911 = func.call @cc_make_string(%2909, %2910) : (!llvm.ptr, i64) -> i64
      %2912 = func.call @cc_nil_value() : () -> i64
      %2913 = func.call @cc_intern(%2911, %2912) : (i64, i64) -> i64
      %2914 = func.call @cc_nil_value() : () -> i64
      %2915 = func.call @cc_cons(%2913, %2914) : (i64, i64) -> i64
      %2916 = func.call @cc_values_pack(%2915) : (i64) -> i64
      func.call @stack_push_pointer(%2913) : (i64) -> ()
      %2917 = func.call @stack_pop_pointer() : () -> i64
      %2918 = llvm.mlir.addressof @str348 : !llvm.ptr
      %2919 = arith.constant 3 : i64
      %2920 = func.call @cc_make_string(%2918, %2919) : (!llvm.ptr, i64) -> i64
      %2921 = func.call @cc_nil_value() : () -> i64
      %2922 = func.call @cc_intern(%2920, %2921) : (i64, i64) -> i64
      %2923 = func.call @cc_nil_value() : () -> i64
      %2924 = func.call @cc_cons(%2922, %2923) : (i64, i64) -> i64
      %2925 = func.call @cc_values_pack(%2924) : (i64) -> i64
      func.call @stack_push_pointer(%2922) : (i64) -> ()
      %2926 = llvm.mlir.addressof @str349 : !llvm.ptr
      %2927 = arith.constant 10 : i64
      %2928 = func.call @cc_make_string(%2926, %2927) : (!llvm.ptr, i64) -> i64
      %2929 = func.call @cc_nil_value() : () -> i64
      %2930 = func.call @cc_intern(%2928, %2929) : (i64, i64) -> i64
      %2931 = func.call @cc_nil_value() : () -> i64
      %2932 = func.call @cc_cons(%2930, %2931) : (i64, i64) -> i64
      %2933 = func.call @cc_values_pack(%2932) : (i64) -> i64
      func.call @stack_push_pointer(%2930) : (i64) -> ()
      %2934 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2934) : (i64) -> ()
      %2935 = llvm.mlir.addressof @str350 : !llvm.ptr
      %2936 = arith.constant 31 : i64
      %2937 = func.call @cc_make_string(%2935, %2936) : (!llvm.ptr, i64) -> i64
      %2938 = llvm.mlir.addressof @str351 : !llvm.ptr
      %2939 = arith.constant 4 : i64
      %2940 = func.call @cc_make_string(%2938, %2939) : (!llvm.ptr, i64) -> i64
      %2941 = func.call @cc_intern(%2937, %2940) : (i64, i64) -> i64
      %2942 = func.call @cc_nil_value() : () -> i64
      %2943 = func.call @cc_cons(%2941, %2942) : (i64, i64) -> i64
      %2944 = func.call @cc_values_pack(%2943) : (i64) -> i64
      func.call @stack_push_pointer(%2941) : (i64) -> ()
      %2945 = llvm.mlir.addressof @str352 : !llvm.ptr
      %2946 = arith.constant 13 : i64
      %2947 = func.call @cc_make_string(%2945, %2946) : (!llvm.ptr, i64) -> i64
      %2948 = llvm.mlir.addressof @str353 : !llvm.ptr
      %2949 = arith.constant 4 : i64
      %2950 = func.call @cc_make_string(%2948, %2949) : (!llvm.ptr, i64) -> i64
      %2951 = func.call @cc_intern(%2947, %2950) : (i64, i64) -> i64
      %2952 = func.call @cc_nil_value() : () -> i64
      %2953 = func.call @cc_cons(%2951, %2952) : (i64, i64) -> i64
      %2954 = func.call @cc_values_pack(%2953) : (i64) -> i64
      func.call @stack_push_pointer(%2951) : (i64) -> ()
      %2955 = llvm.mlir.addressof @str354 : !llvm.ptr
      %2956 = arith.constant 17 : i64
      %2957 = func.call @cc_make_string(%2955, %2956) : (!llvm.ptr, i64) -> i64
      %2958 = llvm.mlir.addressof @str355 : !llvm.ptr
      %2959 = arith.constant 4 : i64
      %2960 = func.call @cc_make_string(%2958, %2959) : (!llvm.ptr, i64) -> i64
      %2961 = func.call @cc_intern(%2957, %2960) : (i64, i64) -> i64
      %2962 = func.call @cc_nil_value() : () -> i64
      %2963 = func.call @cc_cons(%2961, %2962) : (i64, i64) -> i64
      %2964 = func.call @cc_values_pack(%2963) : (i64) -> i64
      func.call @stack_push_pointer(%2961) : (i64) -> ()
      %2965 = llvm.mlir.addressof @str356 : !llvm.ptr
      %2966 = arith.constant 19 : i64
      %2967 = func.call @cc_make_string(%2965, %2966) : (!llvm.ptr, i64) -> i64
      %2968 = llvm.mlir.addressof @str357 : !llvm.ptr
      %2969 = arith.constant 4 : i64
      %2970 = func.call @cc_make_string(%2968, %2969) : (!llvm.ptr, i64) -> i64
      %2971 = func.call @cc_intern(%2967, %2970) : (i64, i64) -> i64
      %2972 = func.call @cc_nil_value() : () -> i64
      %2973 = func.call @cc_cons(%2971, %2972) : (i64, i64) -> i64
      %2974 = func.call @cc_values_pack(%2973) : (i64) -> i64
      func.call @stack_push_pointer(%2971) : (i64) -> ()
      %2975 = llvm.mlir.addressof @str358 : !llvm.ptr
      %2976 = arith.constant 22 : i64
      %2977 = func.call @cc_make_string(%2975, %2976) : (!llvm.ptr, i64) -> i64
      %2978 = llvm.mlir.addressof @str359 : !llvm.ptr
      %2979 = arith.constant 4 : i64
      %2980 = func.call @cc_make_string(%2978, %2979) : (!llvm.ptr, i64) -> i64
      %2981 = func.call @cc_intern(%2977, %2980) : (i64, i64) -> i64
      %2982 = func.call @cc_nil_value() : () -> i64
      %2983 = func.call @cc_cons(%2981, %2982) : (i64, i64) -> i64
      %2984 = func.call @cc_values_pack(%2983) : (i64) -> i64
      func.call @stack_push_pointer(%2981) : (i64) -> ()
      %2985 = llvm.mlir.addressof @str360 : !llvm.ptr
      %2986 = arith.constant 29 : i64
      %2987 = func.call @cc_make_string(%2985, %2986) : (!llvm.ptr, i64) -> i64
      %2988 = llvm.mlir.addressof @str361 : !llvm.ptr
      %2989 = arith.constant 4 : i64
      %2990 = func.call @cc_make_string(%2988, %2989) : (!llvm.ptr, i64) -> i64
      %2991 = func.call @cc_intern(%2987, %2990) : (i64, i64) -> i64
      %2992 = func.call @cc_nil_value() : () -> i64
      %2993 = func.call @cc_cons(%2991, %2992) : (i64, i64) -> i64
      %2994 = func.call @cc_values_pack(%2993) : (i64) -> i64
      func.call @stack_push_pointer(%2991) : (i64) -> ()
      %2995 = llvm.mlir.addressof @str362 : !llvm.ptr
      %2996 = arith.constant 18 : i64
      %2997 = func.call @cc_make_string(%2995, %2996) : (!llvm.ptr, i64) -> i64
      %2998 = llvm.mlir.addressof @str363 : !llvm.ptr
      %2999 = arith.constant 4 : i64
      %3000 = func.call @cc_make_string(%2998, %2999) : (!llvm.ptr, i64) -> i64
      %3001 = func.call @cc_intern(%2997, %3000) : (i64, i64) -> i64
      %3002 = func.call @cc_nil_value() : () -> i64
      %3003 = func.call @cc_cons(%3001, %3002) : (i64, i64) -> i64
      %3004 = func.call @cc_values_pack(%3003) : (i64) -> i64
      func.call @stack_push_pointer(%3001) : (i64) -> ()
      %3005 = llvm.mlir.addressof @str364 : !llvm.ptr
      %3006 = arith.constant 23 : i64
      %3007 = func.call @cc_make_string(%3005, %3006) : (!llvm.ptr, i64) -> i64
      %3008 = llvm.mlir.addressof @str365 : !llvm.ptr
      %3009 = arith.constant 4 : i64
      %3010 = func.call @cc_make_string(%3008, %3009) : (!llvm.ptr, i64) -> i64
      %3011 = func.call @cc_intern(%3007, %3010) : (i64, i64) -> i64
      %3012 = func.call @cc_nil_value() : () -> i64
      %3013 = func.call @cc_cons(%3011, %3012) : (i64, i64) -> i64
      %3014 = func.call @cc_values_pack(%3013) : (i64) -> i64
      func.call @stack_push_pointer(%3011) : (i64) -> ()
      %3015 = llvm.mlir.addressof @str366 : !llvm.ptr
      %3016 = arith.constant 25 : i64
      %3017 = func.call @cc_make_string(%3015, %3016) : (!llvm.ptr, i64) -> i64
      %3018 = llvm.mlir.addressof @str367 : !llvm.ptr
      %3019 = arith.constant 4 : i64
      %3020 = func.call @cc_make_string(%3018, %3019) : (!llvm.ptr, i64) -> i64
      %3021 = func.call @cc_intern(%3017, %3020) : (i64, i64) -> i64
      %3022 = func.call @cc_nil_value() : () -> i64
      %3023 = func.call @cc_cons(%3021, %3022) : (i64, i64) -> i64
      %3024 = func.call @cc_values_pack(%3023) : (i64) -> i64
      func.call @stack_push_pointer(%3021) : (i64) -> ()
      %3025 = llvm.mlir.addressof @str368 : !llvm.ptr
      %3026 = arith.constant 17 : i64
      %3027 = func.call @cc_make_string(%3025, %3026) : (!llvm.ptr, i64) -> i64
      %3028 = llvm.mlir.addressof @str369 : !llvm.ptr
      %3029 = arith.constant 4 : i64
      %3030 = func.call @cc_make_string(%3028, %3029) : (!llvm.ptr, i64) -> i64
      %3031 = func.call @cc_intern(%3027, %3030) : (i64, i64) -> i64
      %3032 = func.call @cc_nil_value() : () -> i64
      %3033 = func.call @cc_cons(%3031, %3032) : (i64, i64) -> i64
      %3034 = func.call @cc_values_pack(%3033) : (i64) -> i64
      func.call @stack_push_pointer(%3031) : (i64) -> ()
      %3035 = llvm.mlir.addressof @str370 : !llvm.ptr
      %3036 = arith.constant 21 : i64
      %3037 = func.call @cc_make_string(%3035, %3036) : (!llvm.ptr, i64) -> i64
      %3038 = llvm.mlir.addressof @str371 : !llvm.ptr
      %3039 = arith.constant 4 : i64
      %3040 = func.call @cc_make_string(%3038, %3039) : (!llvm.ptr, i64) -> i64
      %3041 = func.call @cc_intern(%3037, %3040) : (i64, i64) -> i64
      %3042 = func.call @cc_nil_value() : () -> i64
      %3043 = func.call @cc_cons(%3041, %3042) : (i64, i64) -> i64
      %3044 = func.call @cc_values_pack(%3043) : (i64) -> i64
      func.call @stack_push_pointer(%3041) : (i64) -> ()
      %3045 = llvm.mlir.addressof @str372 : !llvm.ptr
      %3046 = arith.constant 15 : i64
      %3047 = func.call @cc_make_string(%3045, %3046) : (!llvm.ptr, i64) -> i64
      %3048 = llvm.mlir.addressof @str373 : !llvm.ptr
      %3049 = arith.constant 4 : i64
      %3050 = func.call @cc_make_string(%3048, %3049) : (!llvm.ptr, i64) -> i64
      %3051 = func.call @cc_intern(%3047, %3050) : (i64, i64) -> i64
      %3052 = func.call @cc_nil_value() : () -> i64
      %3053 = func.call @cc_cons(%3051, %3052) : (i64, i64) -> i64
      %3054 = func.call @cc_values_pack(%3053) : (i64) -> i64
      func.call @stack_push_pointer(%3051) : (i64) -> ()
      %3055 = llvm.mlir.addressof @str374 : !llvm.ptr
      %3056 = arith.constant 11 : i64
      %3057 = func.call @cc_make_string(%3055, %3056) : (!llvm.ptr, i64) -> i64
      %3058 = llvm.mlir.addressof @str375 : !llvm.ptr
      %3059 = arith.constant 4 : i64
      %3060 = func.call @cc_make_string(%3058, %3059) : (!llvm.ptr, i64) -> i64
      %3061 = func.call @cc_intern(%3057, %3060) : (i64, i64) -> i64
      %3062 = func.call @cc_nil_value() : () -> i64
      %3063 = func.call @cc_cons(%3061, %3062) : (i64, i64) -> i64
      %3064 = func.call @cc_values_pack(%3063) : (i64) -> i64
      func.call @stack_push_pointer(%3061) : (i64) -> ()
      %3065 = llvm.mlir.addressof @str376 : !llvm.ptr
      %3066 = arith.constant 40 : i64
      %3067 = func.call @cc_make_string(%3065, %3066) : (!llvm.ptr, i64) -> i64
      %3068 = llvm.mlir.addressof @str377 : !llvm.ptr
      %3069 = arith.constant 4 : i64
      %3070 = func.call @cc_make_string(%3068, %3069) : (!llvm.ptr, i64) -> i64
      %3071 = func.call @cc_intern(%3067, %3070) : (i64, i64) -> i64
      %3072 = func.call @cc_nil_value() : () -> i64
      %3073 = func.call @cc_cons(%3071, %3072) : (i64, i64) -> i64
      %3074 = func.call @cc_values_pack(%3073) : (i64) -> i64
      func.call @stack_push_pointer(%3071) : (i64) -> ()
      %3075 = llvm.mlir.addressof @str378 : !llvm.ptr
      %3076 = arith.constant 29 : i64
      %3077 = func.call @cc_make_string(%3075, %3076) : (!llvm.ptr, i64) -> i64
      %3078 = llvm.mlir.addressof @str379 : !llvm.ptr
      %3079 = arith.constant 4 : i64
      %3080 = func.call @cc_make_string(%3078, %3079) : (!llvm.ptr, i64) -> i64
      %3081 = func.call @cc_intern(%3077, %3080) : (i64, i64) -> i64
      %3082 = func.call @cc_nil_value() : () -> i64
      %3083 = func.call @cc_cons(%3081, %3082) : (i64, i64) -> i64
      %3084 = func.call @cc_values_pack(%3083) : (i64) -> i64
      func.call @stack_push_pointer(%3081) : (i64) -> ()
      %3085 = llvm.mlir.addressof @str380 : !llvm.ptr
      %3086 = arith.constant 31 : i64
      %3087 = func.call @cc_make_string(%3085, %3086) : (!llvm.ptr, i64) -> i64
      %3088 = llvm.mlir.addressof @str381 : !llvm.ptr
      %3089 = arith.constant 4 : i64
      %3090 = func.call @cc_make_string(%3088, %3089) : (!llvm.ptr, i64) -> i64
      %3091 = func.call @cc_intern(%3087, %3090) : (i64, i64) -> i64
      %3092 = func.call @cc_nil_value() : () -> i64
      %3093 = func.call @cc_cons(%3091, %3092) : (i64, i64) -> i64
      %3094 = func.call @cc_values_pack(%3093) : (i64) -> i64
      func.call @stack_push_pointer(%3091) : (i64) -> ()
      %3095 = llvm.mlir.addressof @str382 : !llvm.ptr
      %3096 = arith.constant 24 : i64
      %3097 = func.call @cc_make_string(%3095, %3096) : (!llvm.ptr, i64) -> i64
      %3098 = llvm.mlir.addressof @str383 : !llvm.ptr
      %3099 = arith.constant 4 : i64
      %3100 = func.call @cc_make_string(%3098, %3099) : (!llvm.ptr, i64) -> i64
      %3101 = func.call @cc_intern(%3097, %3100) : (i64, i64) -> i64
      %3102 = func.call @cc_nil_value() : () -> i64
      %3103 = func.call @cc_cons(%3101, %3102) : (i64, i64) -> i64
      %3104 = func.call @cc_values_pack(%3103) : (i64) -> i64
      func.call @stack_push_pointer(%3101) : (i64) -> ()
      %3105 = llvm.mlir.addressof @str384 : !llvm.ptr
      %3106 = arith.constant 33 : i64
      %3107 = func.call @cc_make_string(%3105, %3106) : (!llvm.ptr, i64) -> i64
      %3108 = llvm.mlir.addressof @str385 : !llvm.ptr
      %3109 = arith.constant 4 : i64
      %3110 = func.call @cc_make_string(%3108, %3109) : (!llvm.ptr, i64) -> i64
      %3111 = func.call @cc_intern(%3107, %3110) : (i64, i64) -> i64
      %3112 = func.call @cc_nil_value() : () -> i64
      %3113 = func.call @cc_cons(%3111, %3112) : (i64, i64) -> i64
      %3114 = func.call @cc_values_pack(%3113) : (i64) -> i64
      func.call @stack_push_pointer(%3111) : (i64) -> ()
      %3115 = llvm.mlir.addressof @str386 : !llvm.ptr
      %3116 = arith.constant 13 : i64
      %3117 = func.call @cc_make_string(%3115, %3116) : (!llvm.ptr, i64) -> i64
      %3118 = llvm.mlir.addressof @str387 : !llvm.ptr
      %3119 = arith.constant 4 : i64
      %3120 = func.call @cc_make_string(%3118, %3119) : (!llvm.ptr, i64) -> i64
      %3121 = func.call @cc_intern(%3117, %3120) : (i64, i64) -> i64
      %3122 = func.call @cc_nil_value() : () -> i64
      %3123 = func.call @cc_cons(%3121, %3122) : (i64, i64) -> i64
      %3124 = func.call @cc_values_pack(%3123) : (i64) -> i64
      func.call @stack_push_pointer(%3121) : (i64) -> ()
      %3125 = llvm.mlir.addressof @str388 : !llvm.ptr
      %3126 = arith.constant 28 : i64
      %3127 = func.call @cc_make_string(%3125, %3126) : (!llvm.ptr, i64) -> i64
      %3128 = llvm.mlir.addressof @str389 : !llvm.ptr
      %3129 = arith.constant 4 : i64
      %3130 = func.call @cc_make_string(%3128, %3129) : (!llvm.ptr, i64) -> i64
      %3131 = func.call @cc_intern(%3127, %3130) : (i64, i64) -> i64
      %3132 = func.call @cc_nil_value() : () -> i64
      %3133 = func.call @cc_cons(%3131, %3132) : (i64, i64) -> i64
      %3134 = func.call @cc_values_pack(%3133) : (i64) -> i64
      func.call @stack_push_pointer(%3131) : (i64) -> ()
      %3135 = llvm.mlir.addressof @str390 : !llvm.ptr
      %3136 = arith.constant 31 : i64
      %3137 = func.call @cc_make_string(%3135, %3136) : (!llvm.ptr, i64) -> i64
      %3138 = llvm.mlir.addressof @str391 : !llvm.ptr
      %3139 = arith.constant 4 : i64
      %3140 = func.call @cc_make_string(%3138, %3139) : (!llvm.ptr, i64) -> i64
      %3141 = func.call @cc_intern(%3137, %3140) : (i64, i64) -> i64
      %3142 = func.call @cc_nil_value() : () -> i64
      %3143 = func.call @cc_cons(%3141, %3142) : (i64, i64) -> i64
      %3144 = func.call @cc_values_pack(%3143) : (i64) -> i64
      func.call @stack_push_pointer(%3141) : (i64) -> ()
      %3145 = llvm.mlir.addressof @str392 : !llvm.ptr
      %3146 = arith.constant 24 : i64
      %3147 = func.call @cc_make_string(%3145, %3146) : (!llvm.ptr, i64) -> i64
      %3148 = llvm.mlir.addressof @str393 : !llvm.ptr
      %3149 = arith.constant 4 : i64
      %3150 = func.call @cc_make_string(%3148, %3149) : (!llvm.ptr, i64) -> i64
      %3151 = func.call @cc_intern(%3147, %3150) : (i64, i64) -> i64
      %3152 = func.call @cc_nil_value() : () -> i64
      %3153 = func.call @cc_cons(%3151, %3152) : (i64, i64) -> i64
      %3154 = func.call @cc_values_pack(%3153) : (i64) -> i64
      func.call @stack_push_pointer(%3151) : (i64) -> ()
      %3155 = llvm.mlir.addressof @str394 : !llvm.ptr
      %3156 = arith.constant 35 : i64
      %3157 = func.call @cc_make_string(%3155, %3156) : (!llvm.ptr, i64) -> i64
      %3158 = llvm.mlir.addressof @str395 : !llvm.ptr
      %3159 = arith.constant 4 : i64
      %3160 = func.call @cc_make_string(%3158, %3159) : (!llvm.ptr, i64) -> i64
      %3161 = func.call @cc_intern(%3157, %3160) : (i64, i64) -> i64
      %3162 = func.call @cc_nil_value() : () -> i64
      %3163 = func.call @cc_cons(%3161, %3162) : (i64, i64) -> i64
      %3164 = func.call @cc_values_pack(%3163) : (i64) -> i64
      func.call @stack_push_pointer(%3161) : (i64) -> ()
      %3165 = llvm.mlir.addressof @str396 : !llvm.ptr
      %3166 = arith.constant 20 : i64
      %3167 = func.call @cc_make_string(%3165, %3166) : (!llvm.ptr, i64) -> i64
      %3168 = llvm.mlir.addressof @str397 : !llvm.ptr
      %3169 = arith.constant 4 : i64
      %3170 = func.call @cc_make_string(%3168, %3169) : (!llvm.ptr, i64) -> i64
      %3171 = func.call @cc_intern(%3167, %3170) : (i64, i64) -> i64
      %3172 = func.call @cc_nil_value() : () -> i64
      %3173 = func.call @cc_cons(%3171, %3172) : (i64, i64) -> i64
      %3174 = func.call @cc_values_pack(%3173) : (i64) -> i64
      func.call @stack_push_pointer(%3171) : (i64) -> ()
      %3175 = llvm.mlir.addressof @str398 : !llvm.ptr
      %3176 = arith.constant 23 : i64
      %3177 = func.call @cc_make_string(%3175, %3176) : (!llvm.ptr, i64) -> i64
      %3178 = llvm.mlir.addressof @str399 : !llvm.ptr
      %3179 = arith.constant 4 : i64
      %3180 = func.call @cc_make_string(%3178, %3179) : (!llvm.ptr, i64) -> i64
      %3181 = func.call @cc_intern(%3177, %3180) : (i64, i64) -> i64
      %3182 = func.call @cc_nil_value() : () -> i64
      %3183 = func.call @cc_cons(%3181, %3182) : (i64, i64) -> i64
      %3184 = func.call @cc_values_pack(%3183) : (i64) -> i64
      func.call @stack_push_pointer(%3181) : (i64) -> ()
      %3185 = llvm.mlir.addressof @str400 : !llvm.ptr
      %3186 = arith.constant 42 : i64
      %3187 = func.call @cc_make_string(%3185, %3186) : (!llvm.ptr, i64) -> i64
      %3188 = llvm.mlir.addressof @str401 : !llvm.ptr
      %3189 = arith.constant 4 : i64
      %3190 = func.call @cc_make_string(%3188, %3189) : (!llvm.ptr, i64) -> i64
      %3191 = func.call @cc_intern(%3187, %3190) : (i64, i64) -> i64
      %3192 = func.call @cc_nil_value() : () -> i64
      %3193 = func.call @cc_cons(%3191, %3192) : (i64, i64) -> i64
      %3194 = func.call @cc_values_pack(%3193) : (i64) -> i64
      func.call @stack_push_pointer(%3191) : (i64) -> ()
      %3195 = llvm.mlir.addressof @str402 : !llvm.ptr
      %3196 = arith.constant 28 : i64
      %3197 = func.call @cc_make_string(%3195, %3196) : (!llvm.ptr, i64) -> i64
      %3198 = llvm.mlir.addressof @str403 : !llvm.ptr
      %3199 = arith.constant 4 : i64
      %3200 = func.call @cc_make_string(%3198, %3199) : (!llvm.ptr, i64) -> i64
      %3201 = func.call @cc_intern(%3197, %3200) : (i64, i64) -> i64
      %3202 = func.call @cc_nil_value() : () -> i64
      %3203 = func.call @cc_cons(%3201, %3202) : (i64, i64) -> i64
      %3204 = func.call @cc_values_pack(%3203) : (i64) -> i64
      func.call @stack_push_pointer(%3201) : (i64) -> ()
      %3205 = llvm.mlir.addressof @str404 : !llvm.ptr
      %3206 = arith.constant 29 : i64
      %3207 = func.call @cc_make_string(%3205, %3206) : (!llvm.ptr, i64) -> i64
      %3208 = llvm.mlir.addressof @str405 : !llvm.ptr
      %3209 = arith.constant 4 : i64
      %3210 = func.call @cc_make_string(%3208, %3209) : (!llvm.ptr, i64) -> i64
      %3211 = func.call @cc_intern(%3207, %3210) : (i64, i64) -> i64
      %3212 = func.call @cc_nil_value() : () -> i64
      %3213 = func.call @cc_cons(%3211, %3212) : (i64, i64) -> i64
      %3214 = func.call @cc_values_pack(%3213) : (i64) -> i64
      func.call @stack_push_pointer(%3211) : (i64) -> ()
      %3215 = llvm.mlir.addressof @str406 : !llvm.ptr
      %3216 = arith.constant 35 : i64
      %3217 = func.call @cc_make_string(%3215, %3216) : (!llvm.ptr, i64) -> i64
      %3218 = llvm.mlir.addressof @str407 : !llvm.ptr
      %3219 = arith.constant 4 : i64
      %3220 = func.call @cc_make_string(%3218, %3219) : (!llvm.ptr, i64) -> i64
      %3221 = func.call @cc_intern(%3217, %3220) : (i64, i64) -> i64
      %3222 = func.call @cc_nil_value() : () -> i64
      %3223 = func.call @cc_cons(%3221, %3222) : (i64, i64) -> i64
      %3224 = func.call @cc_values_pack(%3223) : (i64) -> i64
      func.call @stack_push_pointer(%3221) : (i64) -> ()
      %3225 = llvm.mlir.addressof @str408 : !llvm.ptr
      %3226 = arith.constant 24 : i64
      %3227 = func.call @cc_make_string(%3225, %3226) : (!llvm.ptr, i64) -> i64
      %3228 = llvm.mlir.addressof @str409 : !llvm.ptr
      %3229 = arith.constant 4 : i64
      %3230 = func.call @cc_make_string(%3228, %3229) : (!llvm.ptr, i64) -> i64
      %3231 = func.call @cc_intern(%3227, %3230) : (i64, i64) -> i64
      %3232 = func.call @cc_nil_value() : () -> i64
      %3233 = func.call @cc_cons(%3231, %3232) : (i64, i64) -> i64
      %3234 = func.call @cc_values_pack(%3233) : (i64) -> i64
      func.call @stack_push_pointer(%3231) : (i64) -> ()
      %3235 = llvm.mlir.addressof @str410 : !llvm.ptr
      %3236 = arith.constant 18 : i64
      %3237 = func.call @cc_make_string(%3235, %3236) : (!llvm.ptr, i64) -> i64
      %3238 = llvm.mlir.addressof @str411 : !llvm.ptr
      %3239 = arith.constant 4 : i64
      %3240 = func.call @cc_make_string(%3238, %3239) : (!llvm.ptr, i64) -> i64
      %3241 = func.call @cc_intern(%3237, %3240) : (i64, i64) -> i64
      %3242 = func.call @cc_nil_value() : () -> i64
      %3243 = func.call @cc_cons(%3241, %3242) : (i64, i64) -> i64
      %3244 = func.call @cc_values_pack(%3243) : (i64) -> i64
      func.call @stack_push_pointer(%3241) : (i64) -> ()
      %3245 = llvm.mlir.addressof @str412 : !llvm.ptr
      %3246 = arith.constant 14 : i64
      %3247 = func.call @cc_make_string(%3245, %3246) : (!llvm.ptr, i64) -> i64
      %3248 = llvm.mlir.addressof @str413 : !llvm.ptr
      %3249 = arith.constant 4 : i64
      %3250 = func.call @cc_make_string(%3248, %3249) : (!llvm.ptr, i64) -> i64
      %3251 = func.call @cc_intern(%3247, %3250) : (i64, i64) -> i64
      %3252 = func.call @cc_nil_value() : () -> i64
      %3253 = func.call @cc_cons(%3251, %3252) : (i64, i64) -> i64
      %3254 = func.call @cc_values_pack(%3253) : (i64) -> i64
      func.call @stack_push_pointer(%3251) : (i64) -> ()
      %3255 = llvm.mlir.addressof @str414 : !llvm.ptr
      %3256 = arith.constant 15 : i64
      %3257 = func.call @cc_make_string(%3255, %3256) : (!llvm.ptr, i64) -> i64
      %3258 = llvm.mlir.addressof @str415 : !llvm.ptr
      %3259 = arith.constant 4 : i64
      %3260 = func.call @cc_make_string(%3258, %3259) : (!llvm.ptr, i64) -> i64
      %3261 = func.call @cc_intern(%3257, %3260) : (i64, i64) -> i64
      %3262 = func.call @cc_nil_value() : () -> i64
      %3263 = func.call @cc_cons(%3261, %3262) : (i64, i64) -> i64
      %3264 = func.call @cc_values_pack(%3263) : (i64) -> i64
      func.call @stack_push_pointer(%3261) : (i64) -> ()
      %3265 = llvm.mlir.addressof @str416 : !llvm.ptr
      %3266 = arith.constant 23 : i64
      %3267 = func.call @cc_make_string(%3265, %3266) : (!llvm.ptr, i64) -> i64
      %3268 = llvm.mlir.addressof @str417 : !llvm.ptr
      %3269 = arith.constant 4 : i64
      %3270 = func.call @cc_make_string(%3268, %3269) : (!llvm.ptr, i64) -> i64
      %3271 = func.call @cc_intern(%3267, %3270) : (i64, i64) -> i64
      %3272 = func.call @cc_nil_value() : () -> i64
      %3273 = func.call @cc_cons(%3271, %3272) : (i64, i64) -> i64
      %3274 = func.call @cc_values_pack(%3273) : (i64) -> i64
      func.call @stack_push_pointer(%3271) : (i64) -> ()
      %3275 = llvm.mlir.addressof @str418 : !llvm.ptr
      %3276 = arith.constant 18 : i64
      %3277 = func.call @cc_make_string(%3275, %3276) : (!llvm.ptr, i64) -> i64
      %3278 = llvm.mlir.addressof @str419 : !llvm.ptr
      %3279 = arith.constant 4 : i64
      %3280 = func.call @cc_make_string(%3278, %3279) : (!llvm.ptr, i64) -> i64
      %3281 = func.call @cc_intern(%3277, %3280) : (i64, i64) -> i64
      %3282 = func.call @cc_nil_value() : () -> i64
      %3283 = func.call @cc_cons(%3281, %3282) : (i64, i64) -> i64
      %3284 = func.call @cc_values_pack(%3283) : (i64) -> i64
      func.call @stack_push_pointer(%3281) : (i64) -> ()
      %3285 = llvm.mlir.addressof @str420 : !llvm.ptr
      %3286 = arith.constant 19 : i64
      %3287 = func.call @cc_make_string(%3285, %3286) : (!llvm.ptr, i64) -> i64
      %3288 = llvm.mlir.addressof @str421 : !llvm.ptr
      %3289 = arith.constant 4 : i64
      %3290 = func.call @cc_make_string(%3288, %3289) : (!llvm.ptr, i64) -> i64
      %3291 = func.call @cc_intern(%3287, %3290) : (i64, i64) -> i64
      %3292 = func.call @cc_nil_value() : () -> i64
      %3293 = func.call @cc_cons(%3291, %3292) : (i64, i64) -> i64
      %3294 = func.call @cc_values_pack(%3293) : (i64) -> i64
      func.call @stack_push_pointer(%3291) : (i64) -> ()
      %3295 = llvm.mlir.addressof @str422 : !llvm.ptr
      %3296 = arith.constant 17 : i64
      %3297 = func.call @cc_make_string(%3295, %3296) : (!llvm.ptr, i64) -> i64
      %3298 = llvm.mlir.addressof @str423 : !llvm.ptr
      %3299 = arith.constant 4 : i64
      %3300 = func.call @cc_make_string(%3298, %3299) : (!llvm.ptr, i64) -> i64
      %3301 = func.call @cc_intern(%3297, %3300) : (i64, i64) -> i64
      %3302 = func.call @cc_nil_value() : () -> i64
      %3303 = func.call @cc_cons(%3301, %3302) : (i64, i64) -> i64
      %3304 = func.call @cc_values_pack(%3303) : (i64) -> i64
      func.call @stack_push_pointer(%3301) : (i64) -> ()
      %3305 = llvm.mlir.addressof @str424 : !llvm.ptr
      %3306 = arith.constant 26 : i64
      %3307 = func.call @cc_make_string(%3305, %3306) : (!llvm.ptr, i64) -> i64
      %3308 = llvm.mlir.addressof @str425 : !llvm.ptr
      %3309 = arith.constant 4 : i64
      %3310 = func.call @cc_make_string(%3308, %3309) : (!llvm.ptr, i64) -> i64
      %3311 = func.call @cc_intern(%3307, %3310) : (i64, i64) -> i64
      %3312 = func.call @cc_nil_value() : () -> i64
      %3313 = func.call @cc_cons(%3311, %3312) : (i64, i64) -> i64
      %3314 = func.call @cc_values_pack(%3313) : (i64) -> i64
      func.call @stack_push_pointer(%3311) : (i64) -> ()
      %3315 = llvm.mlir.addressof @str426 : !llvm.ptr
      %3316 = arith.constant 28 : i64
      %3317 = func.call @cc_make_string(%3315, %3316) : (!llvm.ptr, i64) -> i64
      %3318 = llvm.mlir.addressof @str427 : !llvm.ptr
      %3319 = arith.constant 4 : i64
      %3320 = func.call @cc_make_string(%3318, %3319) : (!llvm.ptr, i64) -> i64
      %3321 = func.call @cc_intern(%3317, %3320) : (i64, i64) -> i64
      %3322 = func.call @cc_nil_value() : () -> i64
      %3323 = func.call @cc_cons(%3321, %3322) : (i64, i64) -> i64
      %3324 = func.call @cc_values_pack(%3323) : (i64) -> i64
      func.call @stack_push_pointer(%3321) : (i64) -> ()
      %3325 = llvm.mlir.addressof @str428 : !llvm.ptr
      %3326 = arith.constant 24 : i64
      %3327 = func.call @cc_make_string(%3325, %3326) : (!llvm.ptr, i64) -> i64
      %3328 = llvm.mlir.addressof @str429 : !llvm.ptr
      %3329 = arith.constant 4 : i64
      %3330 = func.call @cc_make_string(%3328, %3329) : (!llvm.ptr, i64) -> i64
      %3331 = func.call @cc_intern(%3327, %3330) : (i64, i64) -> i64
      %3332 = func.call @cc_nil_value() : () -> i64
      %3333 = func.call @cc_cons(%3331, %3332) : (i64, i64) -> i64
      %3334 = func.call @cc_values_pack(%3333) : (i64) -> i64
      func.call @stack_push_pointer(%3331) : (i64) -> ()
      %3335 = llvm.mlir.addressof @str430 : !llvm.ptr
      %3336 = arith.constant 20 : i64
      %3337 = func.call @cc_make_string(%3335, %3336) : (!llvm.ptr, i64) -> i64
      %3338 = llvm.mlir.addressof @str431 : !llvm.ptr
      %3339 = arith.constant 4 : i64
      %3340 = func.call @cc_make_string(%3338, %3339) : (!llvm.ptr, i64) -> i64
      %3341 = func.call @cc_intern(%3337, %3340) : (i64, i64) -> i64
      %3342 = func.call @cc_nil_value() : () -> i64
      %3343 = func.call @cc_cons(%3341, %3342) : (i64, i64) -> i64
      %3344 = func.call @cc_values_pack(%3343) : (i64) -> i64
      func.call @stack_push_pointer(%3341) : (i64) -> ()
      %3345 = llvm.mlir.addressof @str432 : !llvm.ptr
      %3346 = arith.constant 20 : i64
      %3347 = func.call @cc_make_string(%3345, %3346) : (!llvm.ptr, i64) -> i64
      %3348 = llvm.mlir.addressof @str433 : !llvm.ptr
      %3349 = arith.constant 4 : i64
      %3350 = func.call @cc_make_string(%3348, %3349) : (!llvm.ptr, i64) -> i64
      %3351 = func.call @cc_intern(%3347, %3350) : (i64, i64) -> i64
      %3352 = func.call @cc_nil_value() : () -> i64
      %3353 = func.call @cc_cons(%3351, %3352) : (i64, i64) -> i64
      %3354 = func.call @cc_values_pack(%3353) : (i64) -> i64
      func.call @stack_push_pointer(%3351) : (i64) -> ()
      %3355 = llvm.mlir.addressof @str434 : !llvm.ptr
      %3356 = arith.constant 23 : i64
      %3357 = func.call @cc_make_string(%3355, %3356) : (!llvm.ptr, i64) -> i64
      %3358 = llvm.mlir.addressof @str435 : !llvm.ptr
      %3359 = arith.constant 4 : i64
      %3360 = func.call @cc_make_string(%3358, %3359) : (!llvm.ptr, i64) -> i64
      %3361 = func.call @cc_intern(%3357, %3360) : (i64, i64) -> i64
      %3362 = func.call @cc_nil_value() : () -> i64
      %3363 = func.call @cc_cons(%3361, %3362) : (i64, i64) -> i64
      %3364 = func.call @cc_values_pack(%3363) : (i64) -> i64
      func.call @stack_push_pointer(%3361) : (i64) -> ()
      %3365 = llvm.mlir.addressof @str436 : !llvm.ptr
      %3366 = arith.constant 23 : i64
      %3367 = func.call @cc_make_string(%3365, %3366) : (!llvm.ptr, i64) -> i64
      %3368 = llvm.mlir.addressof @str437 : !llvm.ptr
      %3369 = arith.constant 4 : i64
      %3370 = func.call @cc_make_string(%3368, %3369) : (!llvm.ptr, i64) -> i64
      %3371 = func.call @cc_intern(%3367, %3370) : (i64, i64) -> i64
      %3372 = func.call @cc_nil_value() : () -> i64
      %3373 = func.call @cc_cons(%3371, %3372) : (i64, i64) -> i64
      %3374 = func.call @cc_values_pack(%3373) : (i64) -> i64
      func.call @stack_push_pointer(%3371) : (i64) -> ()
      %3375 = llvm.mlir.addressof @str438 : !llvm.ptr
      %3376 = arith.constant 24 : i64
      %3377 = func.call @cc_make_string(%3375, %3376) : (!llvm.ptr, i64) -> i64
      %3378 = llvm.mlir.addressof @str439 : !llvm.ptr
      %3379 = arith.constant 4 : i64
      %3380 = func.call @cc_make_string(%3378, %3379) : (!llvm.ptr, i64) -> i64
      %3381 = func.call @cc_intern(%3377, %3380) : (i64, i64) -> i64
      %3382 = func.call @cc_nil_value() : () -> i64
      %3383 = func.call @cc_cons(%3381, %3382) : (i64, i64) -> i64
      %3384 = func.call @cc_values_pack(%3383) : (i64) -> i64
      func.call @stack_push_pointer(%3381) : (i64) -> ()
      %3385 = llvm.mlir.addressof @str440 : !llvm.ptr
      %3386 = arith.constant 19 : i64
      %3387 = func.call @cc_make_string(%3385, %3386) : (!llvm.ptr, i64) -> i64
      %3388 = llvm.mlir.addressof @str441 : !llvm.ptr
      %3389 = arith.constant 4 : i64
      %3390 = func.call @cc_make_string(%3388, %3389) : (!llvm.ptr, i64) -> i64
      %3391 = func.call @cc_intern(%3387, %3390) : (i64, i64) -> i64
      %3392 = func.call @cc_nil_value() : () -> i64
      %3393 = func.call @cc_cons(%3391, %3392) : (i64, i64) -> i64
      %3394 = func.call @cc_values_pack(%3393) : (i64) -> i64
      func.call @stack_push_pointer(%3391) : (i64) -> ()
      %3395 = llvm.mlir.addressof @str442 : !llvm.ptr
      %3396 = arith.constant 16 : i64
      %3397 = func.call @cc_make_string(%3395, %3396) : (!llvm.ptr, i64) -> i64
      %3398 = llvm.mlir.addressof @str443 : !llvm.ptr
      %3399 = arith.constant 4 : i64
      %3400 = func.call @cc_make_string(%3398, %3399) : (!llvm.ptr, i64) -> i64
      %3401 = func.call @cc_intern(%3397, %3400) : (i64, i64) -> i64
      %3402 = func.call @cc_nil_value() : () -> i64
      %3403 = func.call @cc_cons(%3401, %3402) : (i64, i64) -> i64
      %3404 = func.call @cc_values_pack(%3403) : (i64) -> i64
      func.call @stack_push_pointer(%3401) : (i64) -> ()
      %3405 = llvm.mlir.addressof @str444 : !llvm.ptr
      %3406 = arith.constant 20 : i64
      %3407 = func.call @cc_make_string(%3405, %3406) : (!llvm.ptr, i64) -> i64
      %3408 = llvm.mlir.addressof @str445 : !llvm.ptr
      %3409 = arith.constant 4 : i64
      %3410 = func.call @cc_make_string(%3408, %3409) : (!llvm.ptr, i64) -> i64
      %3411 = func.call @cc_intern(%3407, %3410) : (i64, i64) -> i64
      %3412 = func.call @cc_nil_value() : () -> i64
      %3413 = func.call @cc_cons(%3411, %3412) : (i64, i64) -> i64
      %3414 = func.call @cc_values_pack(%3413) : (i64) -> i64
      func.call @stack_push_pointer(%3411) : (i64) -> ()
      %3415 = llvm.mlir.addressof @str446 : !llvm.ptr
      %3416 = arith.constant 22 : i64
      %3417 = func.call @cc_make_string(%3415, %3416) : (!llvm.ptr, i64) -> i64
      %3418 = llvm.mlir.addressof @str447 : !llvm.ptr
      %3419 = arith.constant 4 : i64
      %3420 = func.call @cc_make_string(%3418, %3419) : (!llvm.ptr, i64) -> i64
      %3421 = func.call @cc_intern(%3417, %3420) : (i64, i64) -> i64
      %3422 = func.call @cc_nil_value() : () -> i64
      %3423 = func.call @cc_cons(%3421, %3422) : (i64, i64) -> i64
      %3424 = func.call @cc_values_pack(%3423) : (i64) -> i64
      func.call @stack_push_pointer(%3421) : (i64) -> ()
      %3425 = llvm.mlir.addressof @str448 : !llvm.ptr
      %3426 = arith.constant 23 : i64
      %3427 = func.call @cc_make_string(%3425, %3426) : (!llvm.ptr, i64) -> i64
      %3428 = llvm.mlir.addressof @str449 : !llvm.ptr
      %3429 = arith.constant 4 : i64
      %3430 = func.call @cc_make_string(%3428, %3429) : (!llvm.ptr, i64) -> i64
      %3431 = func.call @cc_intern(%3427, %3430) : (i64, i64) -> i64
      %3432 = func.call @cc_nil_value() : () -> i64
      %3433 = func.call @cc_cons(%3431, %3432) : (i64, i64) -> i64
      %3434 = func.call @cc_values_pack(%3433) : (i64) -> i64
      func.call @stack_push_pointer(%3431) : (i64) -> ()
      %3435 = llvm.mlir.addressof @str450 : !llvm.ptr
      %3436 = arith.constant 27 : i64
      %3437 = func.call @cc_make_string(%3435, %3436) : (!llvm.ptr, i64) -> i64
      %3438 = llvm.mlir.addressof @str451 : !llvm.ptr
      %3439 = arith.constant 4 : i64
      %3440 = func.call @cc_make_string(%3438, %3439) : (!llvm.ptr, i64) -> i64
      %3441 = func.call @cc_intern(%3437, %3440) : (i64, i64) -> i64
      %3442 = func.call @cc_nil_value() : () -> i64
      %3443 = func.call @cc_cons(%3441, %3442) : (i64, i64) -> i64
      %3444 = func.call @cc_values_pack(%3443) : (i64) -> i64
      func.call @stack_push_pointer(%3441) : (i64) -> ()
      %3445 = llvm.mlir.addressof @str452 : !llvm.ptr
      %3446 = arith.constant 36 : i64
      %3447 = func.call @cc_make_string(%3445, %3446) : (!llvm.ptr, i64) -> i64
      %3448 = llvm.mlir.addressof @str453 : !llvm.ptr
      %3449 = arith.constant 4 : i64
      %3450 = func.call @cc_make_string(%3448, %3449) : (!llvm.ptr, i64) -> i64
      %3451 = func.call @cc_intern(%3447, %3450) : (i64, i64) -> i64
      %3452 = func.call @cc_nil_value() : () -> i64
      %3453 = func.call @cc_cons(%3451, %3452) : (i64, i64) -> i64
      %3454 = func.call @cc_values_pack(%3453) : (i64) -> i64
      func.call @stack_push_pointer(%3451) : (i64) -> ()
      %3455 = llvm.mlir.addressof @str454 : !llvm.ptr
      %3456 = arith.constant 26 : i64
      %3457 = func.call @cc_make_string(%3455, %3456) : (!llvm.ptr, i64) -> i64
      %3458 = llvm.mlir.addressof @str455 : !llvm.ptr
      %3459 = arith.constant 4 : i64
      %3460 = func.call @cc_make_string(%3458, %3459) : (!llvm.ptr, i64) -> i64
      %3461 = func.call @cc_intern(%3457, %3460) : (i64, i64) -> i64
      %3462 = func.call @cc_nil_value() : () -> i64
      %3463 = func.call @cc_cons(%3461, %3462) : (i64, i64) -> i64
      %3464 = func.call @cc_values_pack(%3463) : (i64) -> i64
      func.call @stack_push_pointer(%3461) : (i64) -> ()
      %3465 = llvm.mlir.addressof @str456 : !llvm.ptr
      %3466 = arith.constant 16 : i64
      %3467 = func.call @cc_make_string(%3465, %3466) : (!llvm.ptr, i64) -> i64
      %3468 = llvm.mlir.addressof @str457 : !llvm.ptr
      %3469 = arith.constant 4 : i64
      %3470 = func.call @cc_make_string(%3468, %3469) : (!llvm.ptr, i64) -> i64
      %3471 = func.call @cc_intern(%3467, %3470) : (i64, i64) -> i64
      %3472 = func.call @cc_nil_value() : () -> i64
      %3473 = func.call @cc_cons(%3471, %3472) : (i64, i64) -> i64
      %3474 = func.call @cc_values_pack(%3473) : (i64) -> i64
      func.call @stack_push_pointer(%3471) : (i64) -> ()
      %3475 = llvm.mlir.addressof @str458 : !llvm.ptr
      %3476 = arith.constant 19 : i64
      %3477 = func.call @cc_make_string(%3475, %3476) : (!llvm.ptr, i64) -> i64
      %3478 = llvm.mlir.addressof @str459 : !llvm.ptr
      %3479 = arith.constant 4 : i64
      %3480 = func.call @cc_make_string(%3478, %3479) : (!llvm.ptr, i64) -> i64
      %3481 = func.call @cc_intern(%3477, %3480) : (i64, i64) -> i64
      %3482 = func.call @cc_nil_value() : () -> i64
      %3483 = func.call @cc_cons(%3481, %3482) : (i64, i64) -> i64
      %3484 = func.call @cc_values_pack(%3483) : (i64) -> i64
      func.call @stack_push_pointer(%3481) : (i64) -> ()
      %3485 = llvm.mlir.addressof @str460 : !llvm.ptr
      %3486 = arith.constant 19 : i64
      %3487 = func.call @cc_make_string(%3485, %3486) : (!llvm.ptr, i64) -> i64
      %3488 = llvm.mlir.addressof @str461 : !llvm.ptr
      %3489 = arith.constant 4 : i64
      %3490 = func.call @cc_make_string(%3488, %3489) : (!llvm.ptr, i64) -> i64
      %3491 = func.call @cc_intern(%3487, %3490) : (i64, i64) -> i64
      %3492 = func.call @cc_nil_value() : () -> i64
      %3493 = func.call @cc_cons(%3491, %3492) : (i64, i64) -> i64
      %3494 = func.call @cc_values_pack(%3493) : (i64) -> i64
      func.call @stack_push_pointer(%3491) : (i64) -> ()
      %3495 = llvm.mlir.addressof @str462 : !llvm.ptr
      %3496 = arith.constant 22 : i64
      %3497 = func.call @cc_make_string(%3495, %3496) : (!llvm.ptr, i64) -> i64
      %3498 = llvm.mlir.addressof @str463 : !llvm.ptr
      %3499 = arith.constant 4 : i64
      %3500 = func.call @cc_make_string(%3498, %3499) : (!llvm.ptr, i64) -> i64
      %3501 = func.call @cc_intern(%3497, %3500) : (i64, i64) -> i64
      %3502 = func.call @cc_nil_value() : () -> i64
      %3503 = func.call @cc_cons(%3501, %3502) : (i64, i64) -> i64
      %3504 = func.call @cc_values_pack(%3503) : (i64) -> i64
      func.call @stack_push_pointer(%3501) : (i64) -> ()
      %3505 = llvm.mlir.addressof @str464 : !llvm.ptr
      %3506 = arith.constant 19 : i64
      %3507 = func.call @cc_make_string(%3505, %3506) : (!llvm.ptr, i64) -> i64
      %3508 = llvm.mlir.addressof @str465 : !llvm.ptr
      %3509 = arith.constant 4 : i64
      %3510 = func.call @cc_make_string(%3508, %3509) : (!llvm.ptr, i64) -> i64
      %3511 = func.call @cc_intern(%3507, %3510) : (i64, i64) -> i64
      %3512 = func.call @cc_nil_value() : () -> i64
      %3513 = func.call @cc_cons(%3511, %3512) : (i64, i64) -> i64
      %3514 = func.call @cc_values_pack(%3513) : (i64) -> i64
      func.call @stack_push_pointer(%3511) : (i64) -> ()
      %3515 = llvm.mlir.addressof @str466 : !llvm.ptr
      %3516 = arith.constant 25 : i64
      %3517 = func.call @cc_make_string(%3515, %3516) : (!llvm.ptr, i64) -> i64
      %3518 = llvm.mlir.addressof @str467 : !llvm.ptr
      %3519 = arith.constant 4 : i64
      %3520 = func.call @cc_make_string(%3518, %3519) : (!llvm.ptr, i64) -> i64
      %3521 = func.call @cc_intern(%3517, %3520) : (i64, i64) -> i64
      %3522 = func.call @cc_nil_value() : () -> i64
      %3523 = func.call @cc_cons(%3521, %3522) : (i64, i64) -> i64
      %3524 = func.call @cc_values_pack(%3523) : (i64) -> i64
      func.call @stack_push_pointer(%3521) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3525 = func.call @stack_pop_pointer() : () -> i64
      %3526 = func.call @stack_pop_pointer() : () -> i64
      %3527 = func.call @cc_cons(%3526, %3525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3527) : (i64) -> ()
      %3528 = func.call @stack_pop_pointer() : () -> i64
      %3529 = func.call @stack_pop_pointer() : () -> i64
      %3530 = func.call @cc_cons(%3529, %3528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3530) : (i64) -> ()
      %3531 = func.call @stack_pop_pointer() : () -> i64
      %3532 = func.call @stack_pop_pointer() : () -> i64
      %3533 = func.call @cc_cons(%3532, %3531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3533) : (i64) -> ()
      %3534 = func.call @stack_pop_pointer() : () -> i64
      %3535 = func.call @stack_pop_pointer() : () -> i64
      %3536 = func.call @cc_cons(%3535, %3534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3536) : (i64) -> ()
      %3537 = func.call @stack_pop_pointer() : () -> i64
      %3538 = func.call @stack_pop_pointer() : () -> i64
      %3539 = func.call @cc_cons(%3538, %3537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3539) : (i64) -> ()
      %3540 = func.call @stack_pop_pointer() : () -> i64
      %3541 = func.call @stack_pop_pointer() : () -> i64
      %3542 = func.call @cc_cons(%3541, %3540) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3542) : (i64) -> ()
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
      %3552 = func.call @stack_pop_pointer() : () -> i64
      %3553 = func.call @stack_pop_pointer() : () -> i64
      %3554 = func.call @cc_cons(%3553, %3552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3554) : (i64) -> ()
      %3555 = func.call @stack_pop_pointer() : () -> i64
      %3556 = func.call @stack_pop_pointer() : () -> i64
      %3557 = func.call @cc_cons(%3556, %3555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3557) : (i64) -> ()
      %3558 = func.call @stack_pop_pointer() : () -> i64
      %3559 = func.call @stack_pop_pointer() : () -> i64
      %3560 = func.call @cc_cons(%3559, %3558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3560) : (i64) -> ()
      %3561 = func.call @stack_pop_pointer() : () -> i64
      %3562 = func.call @stack_pop_pointer() : () -> i64
      %3563 = func.call @cc_cons(%3562, %3561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3563) : (i64) -> ()
      %3564 = func.call @stack_pop_pointer() : () -> i64
      %3565 = func.call @stack_pop_pointer() : () -> i64
      %3566 = func.call @cc_cons(%3565, %3564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3566) : (i64) -> ()
      %3567 = func.call @stack_pop_pointer() : () -> i64
      %3568 = func.call @stack_pop_pointer() : () -> i64
      %3569 = func.call @cc_cons(%3568, %3567) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3569) : (i64) -> ()
      %3570 = func.call @stack_pop_pointer() : () -> i64
      %3571 = func.call @stack_pop_pointer() : () -> i64
      %3572 = func.call @cc_cons(%3571, %3570) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3572) : (i64) -> ()
      %3573 = func.call @stack_pop_pointer() : () -> i64
      %3574 = func.call @stack_pop_pointer() : () -> i64
      %3575 = func.call @cc_cons(%3574, %3573) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3575) : (i64) -> ()
      %3576 = func.call @stack_pop_pointer() : () -> i64
      %3577 = func.call @stack_pop_pointer() : () -> i64
      %3578 = func.call @cc_cons(%3577, %3576) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3578) : (i64) -> ()
      %3579 = func.call @stack_pop_pointer() : () -> i64
      %3580 = func.call @stack_pop_pointer() : () -> i64
      %3581 = func.call @cc_cons(%3580, %3579) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3581) : (i64) -> ()
      %3582 = func.call @stack_pop_pointer() : () -> i64
      %3583 = func.call @stack_pop_pointer() : () -> i64
      %3584 = func.call @cc_cons(%3583, %3582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3584) : (i64) -> ()
      %3585 = func.call @stack_pop_pointer() : () -> i64
      %3586 = func.call @stack_pop_pointer() : () -> i64
      %3587 = func.call @cc_cons(%3586, %3585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3587) : (i64) -> ()
      %3588 = func.call @stack_pop_pointer() : () -> i64
      %3589 = func.call @stack_pop_pointer() : () -> i64
      %3590 = func.call @cc_cons(%3589, %3588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3590) : (i64) -> ()
      %3591 = func.call @stack_pop_pointer() : () -> i64
      %3592 = func.call @stack_pop_pointer() : () -> i64
      %3593 = func.call @cc_cons(%3592, %3591) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3593) : (i64) -> ()
      %3594 = func.call @stack_pop_pointer() : () -> i64
      %3595 = func.call @stack_pop_pointer() : () -> i64
      %3596 = func.call @cc_cons(%3595, %3594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3596) : (i64) -> ()
      %3597 = func.call @stack_pop_pointer() : () -> i64
      %3598 = func.call @stack_pop_pointer() : () -> i64
      %3599 = func.call @cc_cons(%3598, %3597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3599) : (i64) -> ()
      %3600 = func.call @stack_pop_pointer() : () -> i64
      %3601 = func.call @stack_pop_pointer() : () -> i64
      %3602 = func.call @cc_cons(%3601, %3600) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3602) : (i64) -> ()
      %3603 = func.call @stack_pop_pointer() : () -> i64
      %3604 = func.call @stack_pop_pointer() : () -> i64
      %3605 = func.call @cc_cons(%3604, %3603) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3605) : (i64) -> ()
      %3606 = func.call @stack_pop_pointer() : () -> i64
      %3607 = func.call @stack_pop_pointer() : () -> i64
      %3608 = func.call @cc_cons(%3607, %3606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3608) : (i64) -> ()
      %3609 = func.call @stack_pop_pointer() : () -> i64
      %3610 = func.call @stack_pop_pointer() : () -> i64
      %3611 = func.call @cc_cons(%3610, %3609) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3611) : (i64) -> ()
      %3612 = func.call @stack_pop_pointer() : () -> i64
      %3613 = func.call @stack_pop_pointer() : () -> i64
      %3614 = func.call @cc_cons(%3613, %3612) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3614) : (i64) -> ()
      %3615 = func.call @stack_pop_pointer() : () -> i64
      %3616 = func.call @stack_pop_pointer() : () -> i64
      %3617 = func.call @cc_cons(%3616, %3615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3617) : (i64) -> ()
      %3618 = func.call @stack_pop_pointer() : () -> i64
      %3619 = func.call @stack_pop_pointer() : () -> i64
      %3620 = func.call @cc_cons(%3619, %3618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3620) : (i64) -> ()
      %3621 = func.call @stack_pop_pointer() : () -> i64
      %3622 = func.call @stack_pop_pointer() : () -> i64
      %3623 = func.call @cc_cons(%3622, %3621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3623) : (i64) -> ()
      %3624 = func.call @stack_pop_pointer() : () -> i64
      %3625 = func.call @stack_pop_pointer() : () -> i64
      %3626 = func.call @cc_cons(%3625, %3624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3626) : (i64) -> ()
      %3627 = func.call @stack_pop_pointer() : () -> i64
      %3628 = func.call @stack_pop_pointer() : () -> i64
      %3629 = func.call @cc_cons(%3628, %3627) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3629) : (i64) -> ()
      %3630 = func.call @stack_pop_pointer() : () -> i64
      %3631 = func.call @stack_pop_pointer() : () -> i64
      %3632 = func.call @cc_cons(%3631, %3630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3632) : (i64) -> ()
      %3633 = func.call @stack_pop_pointer() : () -> i64
      %3634 = func.call @stack_pop_pointer() : () -> i64
      %3635 = func.call @cc_cons(%3634, %3633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3635) : (i64) -> ()
      %3636 = func.call @stack_pop_pointer() : () -> i64
      %3637 = func.call @stack_pop_pointer() : () -> i64
      %3638 = func.call @cc_cons(%3637, %3636) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3638) : (i64) -> ()
      %3639 = func.call @stack_pop_pointer() : () -> i64
      %3640 = func.call @stack_pop_pointer() : () -> i64
      %3641 = func.call @cc_cons(%3640, %3639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3641) : (i64) -> ()
      %3642 = func.call @stack_pop_pointer() : () -> i64
      %3643 = func.call @stack_pop_pointer() : () -> i64
      %3644 = func.call @cc_cons(%3643, %3642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3644) : (i64) -> ()
      %3645 = func.call @stack_pop_pointer() : () -> i64
      %3646 = func.call @stack_pop_pointer() : () -> i64
      %3647 = func.call @cc_cons(%3646, %3645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3647) : (i64) -> ()
      %3648 = func.call @stack_pop_pointer() : () -> i64
      %3649 = func.call @stack_pop_pointer() : () -> i64
      %3650 = func.call @cc_cons(%3649, %3648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3650) : (i64) -> ()
      %3651 = func.call @stack_pop_pointer() : () -> i64
      %3652 = func.call @stack_pop_pointer() : () -> i64
      %3653 = func.call @cc_cons(%3652, %3651) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3653) : (i64) -> ()
      %3654 = func.call @stack_pop_pointer() : () -> i64
      %3655 = func.call @stack_pop_pointer() : () -> i64
      %3656 = func.call @cc_cons(%3655, %3654) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3656) : (i64) -> ()
      %3657 = func.call @stack_pop_pointer() : () -> i64
      %3658 = func.call @stack_pop_pointer() : () -> i64
      %3659 = func.call @cc_cons(%3658, %3657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3659) : (i64) -> ()
      %3660 = func.call @stack_pop_pointer() : () -> i64
      %3661 = func.call @stack_pop_pointer() : () -> i64
      %3662 = func.call @cc_cons(%3661, %3660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3662) : (i64) -> ()
      %3663 = func.call @stack_pop_pointer() : () -> i64
      %3664 = func.call @stack_pop_pointer() : () -> i64
      %3665 = func.call @cc_cons(%3664, %3663) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3665) : (i64) -> ()
      %3666 = func.call @stack_pop_pointer() : () -> i64
      %3667 = func.call @stack_pop_pointer() : () -> i64
      %3668 = func.call @cc_cons(%3667, %3666) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3668) : (i64) -> ()
      %3669 = func.call @stack_pop_pointer() : () -> i64
      %3670 = func.call @stack_pop_pointer() : () -> i64
      %3671 = func.call @cc_cons(%3670, %3669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3671) : (i64) -> ()
      %3672 = func.call @stack_pop_pointer() : () -> i64
      %3673 = func.call @stack_pop_pointer() : () -> i64
      %3674 = func.call @cc_cons(%3673, %3672) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3674) : (i64) -> ()
      %3675 = func.call @stack_pop_pointer() : () -> i64
      %3676 = func.call @stack_pop_pointer() : () -> i64
      %3677 = func.call @cc_cons(%3676, %3675) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3677) : (i64) -> ()
      %3678 = func.call @stack_pop_pointer() : () -> i64
      %3679 = func.call @stack_pop_pointer() : () -> i64
      %3680 = func.call @cc_cons(%3679, %3678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3680) : (i64) -> ()
      %3681 = func.call @stack_pop_pointer() : () -> i64
      %3682 = func.call @stack_pop_pointer() : () -> i64
      %3683 = func.call @cc_cons(%3682, %3681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3683) : (i64) -> ()
      %3684 = func.call @stack_pop_pointer() : () -> i64
      %3685 = func.call @stack_pop_pointer() : () -> i64
      %3686 = func.call @cc_cons(%3685, %3684) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3686) : (i64) -> ()
      %3687 = func.call @stack_pop_pointer() : () -> i64
      %3688 = func.call @stack_pop_pointer() : () -> i64
      %3689 = func.call @cc_cons(%3688, %3687) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3689) : (i64) -> ()
      %3690 = func.call @stack_pop_pointer() : () -> i64
      %3691 = func.call @stack_pop_pointer() : () -> i64
      %3692 = func.call @cc_cons(%3691, %3690) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3692) : (i64) -> ()
      %3693 = func.call @stack_pop_pointer() : () -> i64
      %3694 = func.call @stack_pop_pointer() : () -> i64
      %3695 = func.call @cc_cons(%3694, %3693) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3695) : (i64) -> ()
      %3696 = func.call @stack_pop_pointer() : () -> i64
      %3697 = func.call @stack_pop_pointer() : () -> i64
      %3698 = func.call @cc_cons(%3697, %3696) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3698) : (i64) -> ()
      %3699 = func.call @stack_pop_pointer() : () -> i64
      %3700 = func.call @stack_pop_pointer() : () -> i64
      %3701 = func.call @cc_cons(%3700, %3699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3701) : (i64) -> ()
      %3702 = func.call @stack_pop_pointer() : () -> i64
      %3703 = func.call @stack_pop_pointer() : () -> i64
      %3704 = func.call @cc_cons(%3702, %3703) : (i64, i64) -> i64
      %3705 = llvm.mlir.addressof @str468 : !llvm.ptr
      %3706 = arith.constant 5 : i64
      %3707 = func.call @cc_make_string(%3705, %3706) : (!llvm.ptr, i64) -> i64
      %3708 = func.call @cc_nil_value() : () -> i64
      %3709 = func.call @cc_intern(%3707, %3708) : (i64, i64) -> i64
      %3710 = func.call @cc_nil_value() : () -> i64
      %3711 = func.call @cc_cons(%3709, %3710) : (i64, i64) -> i64
      %3712 = func.call @cc_values_pack(%3711) : (i64) -> i64
      %3713 = func.call @cc_cons(%3709, %3704) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3713) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3714 = func.call @stack_pop_pointer() : () -> i64
      %3715 = func.call @stack_pop_pointer() : () -> i64
      %3716 = func.call @cc_cons(%3715, %3714) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3716) : (i64) -> ()
      %3717 = func.call @stack_pop_pointer() : () -> i64
      %3718 = func.call @stack_pop_pointer() : () -> i64
      %3719 = func.call @cc_cons(%3718, %3717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3720 = func.call @stack_pop_pointer() : () -> i64
      %3721 = func.call @stack_pop_pointer() : () -> i64
      %3722 = func.call @cc_cons(%3721, %3720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3722) : (i64) -> ()
      %3723 = llvm.mlir.addressof @str469 : !llvm.ptr
      %3724 = arith.constant 4 : i64
      %3725 = func.call @cc_make_string(%3723, %3724) : (!llvm.ptr, i64) -> i64
      %3726 = func.call @cc_nil_value() : () -> i64
      %3727 = func.call @cc_intern(%3725, %3726) : (i64, i64) -> i64
      %3728 = func.call @cc_nil_value() : () -> i64
      %3729 = func.call @cc_cons(%3727, %3728) : (i64, i64) -> i64
      %3730 = func.call @cc_values_pack(%3729) : (i64) -> i64
      func.call @stack_push_pointer(%3727) : (i64) -> ()
      %3731 = llvm.mlir.addressof @str470 : !llvm.ptr
      %3732 = arith.constant 3 : i64
      %3733 = func.call @cc_make_string(%3731, %3732) : (!llvm.ptr, i64) -> i64
      %3734 = func.call @cc_nil_value() : () -> i64
      %3735 = func.call @cc_intern(%3733, %3734) : (i64, i64) -> i64
      %3736 = func.call @cc_nil_value() : () -> i64
      %3737 = func.call @cc_cons(%3735, %3736) : (i64, i64) -> i64
      %3738 = func.call @cc_values_pack(%3737) : (i64) -> i64
      func.call @stack_push_pointer(%3735) : (i64) -> ()
      %3739 = llvm.mlir.addressof @str471 : !llvm.ptr
      %3740 = arith.constant 1 : i64
      %3741 = func.call @cc_make_string(%3739, %3740) : (!llvm.ptr, i64) -> i64
      %3742 = func.call @cc_nil_value() : () -> i64
      %3743 = func.call @cc_intern(%3741, %3742) : (i64, i64) -> i64
      %3744 = func.call @cc_nil_value() : () -> i64
      %3745 = func.call @cc_cons(%3743, %3744) : (i64, i64) -> i64
      %3746 = func.call @cc_values_pack(%3745) : (i64) -> i64
      func.call @stack_push_pointer(%3743) : (i64) -> ()
      %3747 = llvm.mlir.addressof @str472 : !llvm.ptr
      %3748 = arith.constant 2 : i64
      %3749 = func.call @cc_make_string(%3747, %3748) : (!llvm.ptr, i64) -> i64
      %3750 = func.call @cc_nil_value() : () -> i64
      %3751 = func.call @cc_intern(%3749, %3750) : (i64, i64) -> i64
      %3752 = func.call @cc_nil_value() : () -> i64
      %3753 = func.call @cc_cons(%3751, %3752) : (i64, i64) -> i64
      %3754 = func.call @cc_values_pack(%3753) : (i64) -> i64
      func.call @stack_push_pointer(%3751) : (i64) -> ()
      %3755 = llvm.mlir.addressof @str473 : !llvm.ptr
      %3756 = arith.constant 10 : i64
      %3757 = func.call @cc_make_string(%3755, %3756) : (!llvm.ptr, i64) -> i64
      %3758 = func.call @cc_nil_value() : () -> i64
      %3759 = func.call @cc_intern(%3757, %3758) : (i64, i64) -> i64
      %3760 = func.call @cc_nil_value() : () -> i64
      %3761 = func.call @cc_cons(%3759, %3760) : (i64, i64) -> i64
      %3762 = func.call @cc_values_pack(%3761) : (i64) -> i64
      func.call @stack_push_pointer(%3759) : (i64) -> ()
      %3763 = llvm.mlir.addressof @str474 : !llvm.ptr
      %3764 = arith.constant 4 : i64
      %3765 = func.call @cc_make_string(%3763, %3764) : (!llvm.ptr, i64) -> i64
      %3766 = llvm.mlir.addressof @str475 : !llvm.ptr
      %3767 = arith.constant 11 : i64
      %3768 = func.call @cc_make_string(%3766, %3767) : (!llvm.ptr, i64) -> i64
      %3769 = func.call @cc_intern(%3765, %3768) : (i64, i64) -> i64
      %3770 = func.call @cc_nil_value() : () -> i64
      %3771 = func.call @cc_cons(%3769, %3770) : (i64, i64) -> i64
      %3772 = func.call @cc_values_pack(%3771) : (i64) -> i64
      func.call @stack_push_pointer(%3769) : (i64) -> ()
      %3773 = llvm.mlir.addressof @str476 : !llvm.ptr
      %3774 = arith.constant 7 : i64
      %3775 = func.call @cc_make_string(%3773, %3774) : (!llvm.ptr, i64) -> i64
      %3776 = llvm.mlir.addressof @str477 : !llvm.ptr
      %3777 = arith.constant 11 : i64
      %3778 = func.call @cc_make_string(%3776, %3777) : (!llvm.ptr, i64) -> i64
      %3779 = func.call @cc_intern(%3775, %3778) : (i64, i64) -> i64
      %3780 = func.call @cc_nil_value() : () -> i64
      %3781 = func.call @cc_cons(%3779, %3780) : (i64, i64) -> i64
      %3782 = func.call @cc_values_pack(%3781) : (i64) -> i64
      func.call @stack_push_pointer(%3779) : (i64) -> ()
      %3783 = llvm.mlir.addressof @str478 : !llvm.ptr
      %3784 = arith.constant 9 : i64
      %3785 = func.call @cc_make_string(%3783, %3784) : (!llvm.ptr, i64) -> i64
      %3786 = func.call @cc_nil_value() : () -> i64
      %3787 = func.call @cc_intern(%3785, %3786) : (i64, i64) -> i64
      %3788 = func.call @cc_nil_value() : () -> i64
      %3789 = func.call @cc_cons(%3787, %3788) : (i64, i64) -> i64
      %3790 = func.call @cc_values_pack(%3789) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3791 = llvm.mlir.addressof @str479 : !llvm.ptr
      %3792 = arith.constant 4 : i64
      %3793 = func.call @cc_make_string(%3791, %3792) : (!llvm.ptr, i64) -> i64
      %3794 = llvm.mlir.addressof @str480 : !llvm.ptr
      %3795 = arith.constant 11 : i64
      %3796 = func.call @cc_make_string(%3794, %3795) : (!llvm.ptr, i64) -> i64
      %3797 = func.call @cc_intern(%3793, %3796) : (i64, i64) -> i64
      %3798 = func.call @cc_nil_value() : () -> i64
      %3799 = func.call @cc_cons(%3797, %3798) : (i64, i64) -> i64
      %3800 = func.call @cc_values_pack(%3799) : (i64) -> i64
      func.call @stack_push_pointer(%3797) : (i64) -> ()
      %3801 = llvm.mlir.addressof @str481 : !llvm.ptr
      %3802 = arith.constant 7 : i64
      %3803 = func.call @cc_make_string(%3801, %3802) : (!llvm.ptr, i64) -> i64
      %3804 = func.call @cc_nil_value() : () -> i64
      %3805 = func.call @cc_intern(%3803, %3804) : (i64, i64) -> i64
      %3806 = func.call @cc_nil_value() : () -> i64
      %3807 = func.call @cc_cons(%3805, %3806) : (i64, i64) -> i64
      %3808 = func.call @cc_values_pack(%3807) : (i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %3809 = llvm.mlir.addressof @str482 : !llvm.ptr
      %3810 = arith.constant 1 : i64
      %3811 = func.call @cc_make_string(%3809, %3810) : (!llvm.ptr, i64) -> i64
      %3812 = func.call @cc_nil_value() : () -> i64
      %3813 = func.call @cc_intern(%3811, %3812) : (i64, i64) -> i64
      %3814 = func.call @cc_nil_value() : () -> i64
      %3815 = func.call @cc_cons(%3813, %3814) : (i64, i64) -> i64
      %3816 = func.call @cc_values_pack(%3815) : (i64) -> i64
      func.call @stack_push_pointer(%3813) : (i64) -> ()
      %3817 = func.call @stack_pop_pointer() : () -> i64
      %3818 = func.call @stack_pop_pointer() : () -> i64
      %3819 = func.call @cc_cons(%3817, %3818) : (i64, i64) -> i64
      %3820 = func.call @cc_cons(%3805, %3819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3820) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3821 = func.call @stack_pop_pointer() : () -> i64
      %3822 = func.call @stack_pop_pointer() : () -> i64
      %3823 = func.call @cc_cons(%3822, %3821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3823) : (i64) -> ()
      %3824 = func.call @stack_pop_pointer() : () -> i64
      %3825 = func.call @stack_pop_pointer() : () -> i64
      %3826 = func.call @cc_cons(%3825, %3824) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3826) : (i64) -> ()
      %3827 = func.call @stack_pop_pointer() : () -> i64
      %3828 = func.call @stack_pop_pointer() : () -> i64
      %3829 = func.call @cc_cons(%3827, %3828) : (i64, i64) -> i64
      %3830 = func.call @cc_cons(%3787, %3829) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3830) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3831 = func.call @stack_pop_pointer() : () -> i64
      %3832 = func.call @stack_pop_pointer() : () -> i64
      %3833 = func.call @cc_cons(%3832, %3831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3833) : (i64) -> ()
      %3834 = func.call @stack_pop_pointer() : () -> i64
      %3835 = func.call @stack_pop_pointer() : () -> i64
      %3836 = func.call @cc_cons(%3835, %3834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3836) : (i64) -> ()
      %3837 = llvm.mlir.addressof @str483 : !llvm.ptr
      %3838 = arith.constant 7 : i64
      %3839 = func.call @cc_make_string(%3837, %3838) : (!llvm.ptr, i64) -> i64
      %3840 = func.call @cc_nil_value() : () -> i64
      %3841 = func.call @cc_intern(%3839, %3840) : (i64, i64) -> i64
      %3842 = func.call @cc_nil_value() : () -> i64
      %3843 = func.call @cc_cons(%3841, %3842) : (i64, i64) -> i64
      %3844 = func.call @cc_values_pack(%3843) : (i64) -> i64
      func.call @stack_push_pointer(%3841) : (i64) -> ()
      %3845 = llvm.mlir.addressof @str484 : !llvm.ptr
      %3846 = arith.constant 1 : i64
      %3847 = func.call @cc_make_string(%3845, %3846) : (!llvm.ptr, i64) -> i64
      %3848 = func.call @cc_nil_value() : () -> i64
      %3849 = func.call @cc_intern(%3847, %3848) : (i64, i64) -> i64
      %3850 = func.call @cc_nil_value() : () -> i64
      %3851 = func.call @cc_cons(%3849, %3850) : (i64, i64) -> i64
      %3852 = func.call @cc_values_pack(%3851) : (i64) -> i64
      func.call @stack_push_pointer(%3849) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3853 = func.call @stack_pop_pointer() : () -> i64
      %3854 = func.call @stack_pop_pointer() : () -> i64
      %3855 = func.call @cc_cons(%3854, %3853) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3855) : (i64) -> ()
      %3856 = func.call @stack_pop_pointer() : () -> i64
      %3857 = func.call @stack_pop_pointer() : () -> i64
      %3858 = func.call @cc_cons(%3857, %3856) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3858) : (i64) -> ()
      %3859 = func.call @stack_pop_pointer() : () -> i64
      %3860 = func.call @stack_pop_pointer() : () -> i64
      %3861 = func.call @cc_cons(%3860, %3859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3861) : (i64) -> ()
      %3862 = func.call @stack_pop_pointer() : () -> i64
      %3863 = func.call @stack_pop_pointer() : () -> i64
      %3864 = func.call @cc_cons(%3863, %3862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3864) : (i64) -> ()
      %3865 = func.call @stack_pop_pointer() : () -> i64
      %3866 = func.call @stack_pop_pointer() : () -> i64
      %3867 = func.call @cc_cons(%3866, %3865) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3867) : (i64) -> ()
      %3868 = func.call @stack_pop_pointer() : () -> i64
      %3869 = func.call @stack_pop_pointer() : () -> i64
      %3870 = func.call @cc_cons(%3869, %3868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3870) : (i64) -> ()
      %3871 = func.call @stack_pop_pointer() : () -> i64
      %3872 = func.call @stack_pop_pointer() : () -> i64
      %3873 = func.call @cc_cons(%3872, %3871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3873) : (i64) -> ()
      %3874 = func.call @stack_pop_pointer() : () -> i64
      %3875 = func.call @stack_pop_pointer() : () -> i64
      %3876 = func.call @cc_cons(%3875, %3874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3876) : (i64) -> ()
      %3877 = func.call @stack_pop_pointer() : () -> i64
      %3878 = func.call @stack_pop_pointer() : () -> i64
      %3879 = func.call @cc_cons(%3878, %3877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3879) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3880 = func.call @stack_pop_pointer() : () -> i64
      %3881 = func.call @stack_pop_pointer() : () -> i64
      %3882 = func.call @cc_cons(%3881, %3880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3882) : (i64) -> ()
      %3883 = func.call @stack_pop_pointer() : () -> i64
      %3884 = func.call @stack_pop_pointer() : () -> i64
      %3885 = func.call @cc_cons(%3884, %3883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3885) : (i64) -> ()
      %3886 = func.call @stack_pop_pointer() : () -> i64
      %3887 = func.call @stack_pop_pointer() : () -> i64
      %3888 = func.call @cc_cons(%3887, %3886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3888) : (i64) -> ()
      %3889 = func.call @stack_pop_pointer() : () -> i64
      %4927 = arith.constant 120590987952133 : i64
      %4928 = arith.constant 0 : i64
      %4929 = func.call @cc_make_closure(%4927, %4928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4929) : (i64) -> ()
      %4930 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4931 = func.call @stack_pop_pointer() : () -> i64
      %4932 = func.call @stack_pop_pointer() : () -> i64
      %4933 = func.call @cc_cons(%4932, %4931) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4933) : (i64) -> ()
      %4934 = func.call @stack_pop_pointer() : () -> i64
      %4935 = llvm.mlir.addressof @str618 : !llvm.ptr
      %4936 = arith.constant 11 : i64
      %4937 = func.call @cc_make_string(%4935, %4936) : (!llvm.ptr, i64) -> i64
      %4938 = llvm.mlir.addressof @str619 : !llvm.ptr
      %4939 = arith.constant 7 : i64
      %4940 = func.call @cc_make_string(%4938, %4939) : (!llvm.ptr, i64) -> i64
      %4941 = func.call @cc_intern(%4937, %4940) : (i64, i64) -> i64
      %4942 = func.call @cc_nil_value() : () -> i64
      %4943 = func.call @cc_cons(%4941, %4942) : (i64, i64) -> i64
      %4944 = func.call @cc_values_pack(%4943) : (i64) -> i64
      func.call @stack_push_pointer(%4941) : (i64) -> ()
      %4945 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4946 = func.call @stack_pop_pointer() : () -> i64
      %4947 = llvm.mlir.addressof @str620 : !llvm.ptr
      %4948 = arith.constant 4 : i64
      %4949 = func.call @cc_make_string(%4947, %4948) : (!llvm.ptr, i64) -> i64
      %4950 = llvm.mlir.addressof @str621 : !llvm.ptr
      %4951 = arith.constant 7 : i64
      %4952 = func.call @cc_make_string(%4950, %4951) : (!llvm.ptr, i64) -> i64
      %4953 = func.call @cc_intern(%4949, %4952) : (i64, i64) -> i64
      %4954 = func.call @cc_nil_value() : () -> i64
      %4955 = func.call @cc_cons(%4953, %4954) : (i64, i64) -> i64
      %4956 = func.call @cc_values_pack(%4955) : (i64) -> i64
      func.call @stack_push_pointer(%4953) : (i64) -> ()
      %4957 = func.call @stack_pop_pointer() : () -> i64
      %4958 = llvm.mlir.addressof @str622 : !llvm.ptr
      %4959 = arith.constant 6 : i64
      %4960 = func.call @cc_make_string(%4958, %4959) : (!llvm.ptr, i64) -> i64
      %4961 = func.call @cc_nil_value() : () -> i64
      %4962 = func.call @cc_intern(%4960, %4961) : (i64, i64) -> i64
      %4963 = func.call @cc_nil_value() : () -> i64
      %4964 = func.call @cc_cons(%4962, %4963) : (i64, i64) -> i64
      %4965 = func.call @cc_values_pack(%4964) : (i64) -> i64
      func.call @stack_push_pointer(%4962) : (i64) -> ()
      %4966 = func.call @stack_pop_pointer() : () -> i64
      %4967 = func.call @cc_nil_value() : () -> i64
      %4968 = func.call @cc_errorp(%2917) : (i64) -> i64
      %4969 = arith.cmpi ne, %4968, %4967 : i64
      %4970 = arith.cmpi eq, %4967, %4967 : i64
      %4971 = arith.andi %4969, %4970 : i1
      %4972 = scf.if %4971 -> (i64) {
        scf.yield %2917 : i64
      } else {
        scf.yield %4967 : i64
      }
      %4973 = func.call @cc_errorp(%3889) : (i64) -> i64
      %4974 = arith.cmpi ne, %4973, %4967 : i64
      %4975 = arith.cmpi eq, %4972, %4967 : i64
      %4976 = arith.andi %4974, %4975 : i1
      %4977 = scf.if %4976 -> (i64) {
        scf.yield %3889 : i64
      } else {
        scf.yield %4972 : i64
      }
      %4978 = func.call @cc_errorp(%4930) : (i64) -> i64
      %4979 = arith.cmpi ne, %4978, %4967 : i64
      %4980 = arith.cmpi eq, %4977, %4967 : i64
      %4981 = arith.andi %4979, %4980 : i1
      %4982 = scf.if %4981 -> (i64) {
        scf.yield %4930 : i64
      } else {
        scf.yield %4977 : i64
      }
      %4983 = func.call @cc_errorp(%4934) : (i64) -> i64
      %4984 = arith.cmpi ne, %4983, %4967 : i64
      %4985 = arith.cmpi eq, %4982, %4967 : i64
      %4986 = arith.andi %4984, %4985 : i1
      %4987 = scf.if %4986 -> (i64) {
        scf.yield %4934 : i64
      } else {
        scf.yield %4982 : i64
      }
      %4988 = func.call @cc_errorp(%4945) : (i64) -> i64
      %4989 = arith.cmpi ne, %4988, %4967 : i64
      %4990 = arith.cmpi eq, %4987, %4967 : i64
      %4991 = arith.andi %4989, %4990 : i1
      %4992 = scf.if %4991 -> (i64) {
        scf.yield %4945 : i64
      } else {
        scf.yield %4987 : i64
      }
      %4993 = func.call @cc_errorp(%4946) : (i64) -> i64
      %4994 = arith.cmpi ne, %4993, %4967 : i64
      %4995 = arith.cmpi eq, %4992, %4967 : i64
      %4996 = arith.andi %4994, %4995 : i1
      %4997 = scf.if %4996 -> (i64) {
        scf.yield %4946 : i64
      } else {
        scf.yield %4992 : i64
      }
      %4998 = func.call @cc_errorp(%4957) : (i64) -> i64
      %4999 = arith.cmpi ne, %4998, %4967 : i64
      %5000 = arith.cmpi eq, %4997, %4967 : i64
      %5001 = arith.andi %4999, %5000 : i1
      %5002 = scf.if %5001 -> (i64) {
        scf.yield %4957 : i64
      } else {
        scf.yield %4997 : i64
      }
      %5003 = func.call @cc_errorp(%4966) : (i64) -> i64
      %5004 = arith.cmpi ne, %5003, %4967 : i64
      %5005 = arith.cmpi eq, %5002, %4967 : i64
      %5006 = arith.andi %5004, %5005 : i1
      %5007 = scf.if %5006 -> (i64) {
        scf.yield %4966 : i64
      } else {
        scf.yield %5002 : i64
      }
      %5008 = arith.cmpi ne, %5007, %4967 : i64
      scf.if %5008 {
        func.call @stack_push_pointer(%5007) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2917) : (i64) -> ()
        func.call @stack_push_pointer(%3889) : (i64) -> ()
        func.call @stack_push_pointer(%4930) : (i64) -> ()
        func.call @stack_push_pointer(%4934) : (i64) -> ()
        func.call @stack_push_pointer(%4945) : (i64) -> ()
        func.call @stack_push_pointer(%4946) : (i64) -> ()
        func.call @stack_push_pointer(%4957) : (i64) -> ()
        func.call @stack_push_pointer(%4966) : (i64) -> ()
        %5009 = llvm.mlir.addressof @str623 : !llvm.ptr
        %5010 = func.call @cc_make_function_ref_const(%5009) : (!llvm.ptr) -> i64
        %5011 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5010, %5011) : (i64, i64) -> ()
      }
      %5012 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5012 : i64
    }
    func.call @stack_push_pointer(%2908) : (i64) -> ()
    %5013 = func.call @stack_pop_pointer() : () -> i64
    %5014 = func.call @cc_multiple_value_list(%5013) : (i64) -> i64
    %5015 = llvm.mlir.addressof @str624 : !llvm.ptr
    %5016 = arith.constant 38 : i64
    %5017 = func.call @cc_make_string(%5015, %5016) : (!llvm.ptr, i64) -> i64
    %5018 = func.call @cc_nil_value() : () -> i64
    %5019 = func.call @cc_intern(%5017, %5018) : (i64, i64) -> i64
    %5020 = func.call @cc_nil_value() : () -> i64
    %5021 = func.call @cc_cons(%5019, %5020) : (i64, i64) -> i64
    %5022 = func.call @cc_values_pack(%5021) : (i64) -> i64
    %5023 = func.call @cc_symbol_value(%5019) : (i64) -> i64
    %5024 = llvm.mlir.addressof @str625 : !llvm.ptr
    %5025 = arith.constant 40 : i64
    %5026 = func.call @cc_make_string(%5024, %5025) : (!llvm.ptr, i64) -> i64
    %5027 = func.call @cc_nil_value() : () -> i64
    %5028 = func.call @cc_intern(%5026, %5027) : (i64, i64) -> i64
    %5029 = func.call @cc_nil_value() : () -> i64
    %5030 = func.call @cc_cons(%5028, %5029) : (i64, i64) -> i64
    %5031 = func.call @cc_values_pack(%5030) : (i64) -> i64
    %5032 = func.call @cc_symbol_value(%5028) : (i64) -> i64
    %5033 = func.call @cc_nil_value() : () -> i64
    %5034 = arith.cmpi ne, %5023, %5033 : i64
    %5035 = scf.if %5034 -> (i64) {
      scf.yield %5032 : i64
    } else {
      scf.yield %5014 : i64
    }
    %5036 = func.call @cc_values_pack(%5035) : (i64) -> i64
    func.call @stack_push_pointer(%5036) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_120590987952129"() {
    %1128 = func.call @cc_nil_value() : () -> i64
    %1129 = func.call @cc_nil_value() : () -> i64
    %1130 = func.call @cc_errorp(%1128) : (i64) -> i64
    %1131 = arith.cmpi ne, %1130, %1129 : i64
    %1132 = scf.if %1131 -> (i64) {
      scf.yield %1128 : i64
    } else {
      %1133 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1134 = arith.constant 31 : i64
      %1135 = func.call @cc_make_string(%1133, %1134) : (!llvm.ptr, i64) -> i64
      %1136 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1137 = arith.constant 4 : i64
      %1138 = func.call @cc_make_string(%1136, %1137) : (!llvm.ptr, i64) -> i64
      %1139 = func.call @cc_intern(%1135, %1138) : (i64, i64) -> i64
      %1140 = func.call @cc_nil_value() : () -> i64
      %1141 = func.call @cc_cons(%1139, %1140) : (i64, i64) -> i64
      %1142 = func.call @cc_values_pack(%1141) : (i64) -> i64
      func.call @stack_push_pointer(%1139) : (i64) -> ()
      %1143 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1144 = arith.constant 13 : i64
      %1145 = func.call @cc_make_string(%1143, %1144) : (!llvm.ptr, i64) -> i64
      %1146 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1147 = arith.constant 4 : i64
      %1148 = func.call @cc_make_string(%1146, %1147) : (!llvm.ptr, i64) -> i64
      %1149 = func.call @cc_intern(%1145, %1148) : (i64, i64) -> i64
      %1150 = func.call @cc_nil_value() : () -> i64
      %1151 = func.call @cc_cons(%1149, %1150) : (i64, i64) -> i64
      %1152 = func.call @cc_values_pack(%1151) : (i64) -> i64
      func.call @stack_push_pointer(%1149) : (i64) -> ()
      %1153 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1154 = arith.constant 17 : i64
      %1155 = func.call @cc_make_string(%1153, %1154) : (!llvm.ptr, i64) -> i64
      %1156 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1157 = arith.constant 4 : i64
      %1158 = func.call @cc_make_string(%1156, %1157) : (!llvm.ptr, i64) -> i64
      %1159 = func.call @cc_intern(%1155, %1158) : (i64, i64) -> i64
      %1160 = func.call @cc_nil_value() : () -> i64
      %1161 = func.call @cc_cons(%1159, %1160) : (i64, i64) -> i64
      %1162 = func.call @cc_values_pack(%1161) : (i64) -> i64
      func.call @stack_push_pointer(%1159) : (i64) -> ()
      %1163 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1164 = arith.constant 19 : i64
      %1165 = func.call @cc_make_string(%1163, %1164) : (!llvm.ptr, i64) -> i64
      %1166 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1167 = arith.constant 4 : i64
      %1168 = func.call @cc_make_string(%1166, %1167) : (!llvm.ptr, i64) -> i64
      %1169 = func.call @cc_intern(%1165, %1168) : (i64, i64) -> i64
      %1170 = func.call @cc_nil_value() : () -> i64
      %1171 = func.call @cc_cons(%1169, %1170) : (i64, i64) -> i64
      %1172 = func.call @cc_values_pack(%1171) : (i64) -> i64
      func.call @stack_push_pointer(%1169) : (i64) -> ()
      %1173 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1174 = arith.constant 22 : i64
      %1175 = func.call @cc_make_string(%1173, %1174) : (!llvm.ptr, i64) -> i64
      %1176 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1177 = arith.constant 4 : i64
      %1178 = func.call @cc_make_string(%1176, %1177) : (!llvm.ptr, i64) -> i64
      %1179 = func.call @cc_intern(%1175, %1178) : (i64, i64) -> i64
      %1180 = func.call @cc_nil_value() : () -> i64
      %1181 = func.call @cc_cons(%1179, %1180) : (i64, i64) -> i64
      %1182 = func.call @cc_values_pack(%1181) : (i64) -> i64
      func.call @stack_push_pointer(%1179) : (i64) -> ()
      %1183 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1184 = arith.constant 29 : i64
      %1185 = func.call @cc_make_string(%1183, %1184) : (!llvm.ptr, i64) -> i64
      %1186 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1187 = arith.constant 4 : i64
      %1188 = func.call @cc_make_string(%1186, %1187) : (!llvm.ptr, i64) -> i64
      %1189 = func.call @cc_intern(%1185, %1188) : (i64, i64) -> i64
      %1190 = func.call @cc_nil_value() : () -> i64
      %1191 = func.call @cc_cons(%1189, %1190) : (i64, i64) -> i64
      %1192 = func.call @cc_values_pack(%1191) : (i64) -> i64
      func.call @stack_push_pointer(%1189) : (i64) -> ()
      %1193 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1194 = arith.constant 18 : i64
      %1195 = func.call @cc_make_string(%1193, %1194) : (!llvm.ptr, i64) -> i64
      %1196 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1197 = arith.constant 4 : i64
      %1198 = func.call @cc_make_string(%1196, %1197) : (!llvm.ptr, i64) -> i64
      %1199 = func.call @cc_intern(%1195, %1198) : (i64, i64) -> i64
      %1200 = func.call @cc_nil_value() : () -> i64
      %1201 = func.call @cc_cons(%1199, %1200) : (i64, i64) -> i64
      %1202 = func.call @cc_values_pack(%1201) : (i64) -> i64
      func.call @stack_push_pointer(%1199) : (i64) -> ()
      %1203 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1204 = arith.constant 23 : i64
      %1205 = func.call @cc_make_string(%1203, %1204) : (!llvm.ptr, i64) -> i64
      %1206 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1207 = arith.constant 4 : i64
      %1208 = func.call @cc_make_string(%1206, %1207) : (!llvm.ptr, i64) -> i64
      %1209 = func.call @cc_intern(%1205, %1208) : (i64, i64) -> i64
      %1210 = func.call @cc_nil_value() : () -> i64
      %1211 = func.call @cc_cons(%1209, %1210) : (i64, i64) -> i64
      %1212 = func.call @cc_values_pack(%1211) : (i64) -> i64
      func.call @stack_push_pointer(%1209) : (i64) -> ()
      %1213 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1214 = arith.constant 25 : i64
      %1215 = func.call @cc_make_string(%1213, %1214) : (!llvm.ptr, i64) -> i64
      %1216 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1217 = arith.constant 4 : i64
      %1218 = func.call @cc_make_string(%1216, %1217) : (!llvm.ptr, i64) -> i64
      %1219 = func.call @cc_intern(%1215, %1218) : (i64, i64) -> i64
      %1220 = func.call @cc_nil_value() : () -> i64
      %1221 = func.call @cc_cons(%1219, %1220) : (i64, i64) -> i64
      %1222 = func.call @cc_values_pack(%1221) : (i64) -> i64
      func.call @stack_push_pointer(%1219) : (i64) -> ()
      %1223 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1224 = arith.constant 17 : i64
      %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
      %1226 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1227 = arith.constant 4 : i64
      %1228 = func.call @cc_make_string(%1226, %1227) : (!llvm.ptr, i64) -> i64
      %1229 = func.call @cc_intern(%1225, %1228) : (i64, i64) -> i64
      %1230 = func.call @cc_nil_value() : () -> i64
      %1231 = func.call @cc_cons(%1229, %1230) : (i64, i64) -> i64
      %1232 = func.call @cc_values_pack(%1231) : (i64) -> i64
      func.call @stack_push_pointer(%1229) : (i64) -> ()
      %1233 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1234 = arith.constant 21 : i64
      %1235 = func.call @cc_make_string(%1233, %1234) : (!llvm.ptr, i64) -> i64
      %1236 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1237 = arith.constant 4 : i64
      %1238 = func.call @cc_make_string(%1236, %1237) : (!llvm.ptr, i64) -> i64
      %1239 = func.call @cc_intern(%1235, %1238) : (i64, i64) -> i64
      %1240 = func.call @cc_nil_value() : () -> i64
      %1241 = func.call @cc_cons(%1239, %1240) : (i64, i64) -> i64
      %1242 = func.call @cc_values_pack(%1241) : (i64) -> i64
      func.call @stack_push_pointer(%1239) : (i64) -> ()
      %1243 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1244 = arith.constant 15 : i64
      %1245 = func.call @cc_make_string(%1243, %1244) : (!llvm.ptr, i64) -> i64
      %1246 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1247 = arith.constant 4 : i64
      %1248 = func.call @cc_make_string(%1246, %1247) : (!llvm.ptr, i64) -> i64
      %1249 = func.call @cc_intern(%1245, %1248) : (i64, i64) -> i64
      %1250 = func.call @cc_nil_value() : () -> i64
      %1251 = func.call @cc_cons(%1249, %1250) : (i64, i64) -> i64
      %1252 = func.call @cc_values_pack(%1251) : (i64) -> i64
      func.call @stack_push_pointer(%1249) : (i64) -> ()
      %1253 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1254 = arith.constant 11 : i64
      %1255 = func.call @cc_make_string(%1253, %1254) : (!llvm.ptr, i64) -> i64
      %1256 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1257 = arith.constant 4 : i64
      %1258 = func.call @cc_make_string(%1256, %1257) : (!llvm.ptr, i64) -> i64
      %1259 = func.call @cc_intern(%1255, %1258) : (i64, i64) -> i64
      %1260 = func.call @cc_nil_value() : () -> i64
      %1261 = func.call @cc_cons(%1259, %1260) : (i64, i64) -> i64
      %1262 = func.call @cc_values_pack(%1261) : (i64) -> i64
      func.call @stack_push_pointer(%1259) : (i64) -> ()
      %1263 = llvm.mlir.addressof @str181 : !llvm.ptr
      %1264 = arith.constant 40 : i64
      %1265 = func.call @cc_make_string(%1263, %1264) : (!llvm.ptr, i64) -> i64
      %1266 = llvm.mlir.addressof @str182 : !llvm.ptr
      %1267 = arith.constant 4 : i64
      %1268 = func.call @cc_make_string(%1266, %1267) : (!llvm.ptr, i64) -> i64
      %1269 = func.call @cc_intern(%1265, %1268) : (i64, i64) -> i64
      %1270 = func.call @cc_nil_value() : () -> i64
      %1271 = func.call @cc_cons(%1269, %1270) : (i64, i64) -> i64
      %1272 = func.call @cc_values_pack(%1271) : (i64) -> i64
      func.call @stack_push_pointer(%1269) : (i64) -> ()
      %1273 = llvm.mlir.addressof @str183 : !llvm.ptr
      %1274 = arith.constant 29 : i64
      %1275 = func.call @cc_make_string(%1273, %1274) : (!llvm.ptr, i64) -> i64
      %1276 = llvm.mlir.addressof @str184 : !llvm.ptr
      %1277 = arith.constant 4 : i64
      %1278 = func.call @cc_make_string(%1276, %1277) : (!llvm.ptr, i64) -> i64
      %1279 = func.call @cc_intern(%1275, %1278) : (i64, i64) -> i64
      %1280 = func.call @cc_nil_value() : () -> i64
      %1281 = func.call @cc_cons(%1279, %1280) : (i64, i64) -> i64
      %1282 = func.call @cc_values_pack(%1281) : (i64) -> i64
      func.call @stack_push_pointer(%1279) : (i64) -> ()
      %1283 = llvm.mlir.addressof @str185 : !llvm.ptr
      %1284 = arith.constant 31 : i64
      %1285 = func.call @cc_make_string(%1283, %1284) : (!llvm.ptr, i64) -> i64
      %1286 = llvm.mlir.addressof @str186 : !llvm.ptr
      %1287 = arith.constant 4 : i64
      %1288 = func.call @cc_make_string(%1286, %1287) : (!llvm.ptr, i64) -> i64
      %1289 = func.call @cc_intern(%1285, %1288) : (i64, i64) -> i64
      %1290 = func.call @cc_nil_value() : () -> i64
      %1291 = func.call @cc_cons(%1289, %1290) : (i64, i64) -> i64
      %1292 = func.call @cc_values_pack(%1291) : (i64) -> i64
      func.call @stack_push_pointer(%1289) : (i64) -> ()
      %1293 = llvm.mlir.addressof @str187 : !llvm.ptr
      %1294 = arith.constant 24 : i64
      %1295 = func.call @cc_make_string(%1293, %1294) : (!llvm.ptr, i64) -> i64
      %1296 = llvm.mlir.addressof @str188 : !llvm.ptr
      %1297 = arith.constant 4 : i64
      %1298 = func.call @cc_make_string(%1296, %1297) : (!llvm.ptr, i64) -> i64
      %1299 = func.call @cc_intern(%1295, %1298) : (i64, i64) -> i64
      %1300 = func.call @cc_nil_value() : () -> i64
      %1301 = func.call @cc_cons(%1299, %1300) : (i64, i64) -> i64
      %1302 = func.call @cc_values_pack(%1301) : (i64) -> i64
      func.call @stack_push_pointer(%1299) : (i64) -> ()
      %1303 = llvm.mlir.addressof @str189 : !llvm.ptr
      %1304 = arith.constant 33 : i64
      %1305 = func.call @cc_make_string(%1303, %1304) : (!llvm.ptr, i64) -> i64
      %1306 = llvm.mlir.addressof @str190 : !llvm.ptr
      %1307 = arith.constant 4 : i64
      %1308 = func.call @cc_make_string(%1306, %1307) : (!llvm.ptr, i64) -> i64
      %1309 = func.call @cc_intern(%1305, %1308) : (i64, i64) -> i64
      %1310 = func.call @cc_nil_value() : () -> i64
      %1311 = func.call @cc_cons(%1309, %1310) : (i64, i64) -> i64
      %1312 = func.call @cc_values_pack(%1311) : (i64) -> i64
      func.call @stack_push_pointer(%1309) : (i64) -> ()
      %1313 = llvm.mlir.addressof @str191 : !llvm.ptr
      %1314 = arith.constant 13 : i64
      %1315 = func.call @cc_make_string(%1313, %1314) : (!llvm.ptr, i64) -> i64
      %1316 = llvm.mlir.addressof @str192 : !llvm.ptr
      %1317 = arith.constant 4 : i64
      %1318 = func.call @cc_make_string(%1316, %1317) : (!llvm.ptr, i64) -> i64
      %1319 = func.call @cc_intern(%1315, %1318) : (i64, i64) -> i64
      %1320 = func.call @cc_nil_value() : () -> i64
      %1321 = func.call @cc_cons(%1319, %1320) : (i64, i64) -> i64
      %1322 = func.call @cc_values_pack(%1321) : (i64) -> i64
      func.call @stack_push_pointer(%1319) : (i64) -> ()
      %1323 = llvm.mlir.addressof @str193 : !llvm.ptr
      %1324 = arith.constant 28 : i64
      %1325 = func.call @cc_make_string(%1323, %1324) : (!llvm.ptr, i64) -> i64
      %1326 = llvm.mlir.addressof @str194 : !llvm.ptr
      %1327 = arith.constant 4 : i64
      %1328 = func.call @cc_make_string(%1326, %1327) : (!llvm.ptr, i64) -> i64
      %1329 = func.call @cc_intern(%1325, %1328) : (i64, i64) -> i64
      %1330 = func.call @cc_nil_value() : () -> i64
      %1331 = func.call @cc_cons(%1329, %1330) : (i64, i64) -> i64
      %1332 = func.call @cc_values_pack(%1331) : (i64) -> i64
      func.call @stack_push_pointer(%1329) : (i64) -> ()
      %1333 = llvm.mlir.addressof @str195 : !llvm.ptr
      %1334 = arith.constant 31 : i64
      %1335 = func.call @cc_make_string(%1333, %1334) : (!llvm.ptr, i64) -> i64
      %1336 = llvm.mlir.addressof @str196 : !llvm.ptr
      %1337 = arith.constant 4 : i64
      %1338 = func.call @cc_make_string(%1336, %1337) : (!llvm.ptr, i64) -> i64
      %1339 = func.call @cc_intern(%1335, %1338) : (i64, i64) -> i64
      %1340 = func.call @cc_nil_value() : () -> i64
      %1341 = func.call @cc_cons(%1339, %1340) : (i64, i64) -> i64
      %1342 = func.call @cc_values_pack(%1341) : (i64) -> i64
      func.call @stack_push_pointer(%1339) : (i64) -> ()
      %1343 = llvm.mlir.addressof @str197 : !llvm.ptr
      %1344 = arith.constant 24 : i64
      %1345 = func.call @cc_make_string(%1343, %1344) : (!llvm.ptr, i64) -> i64
      %1346 = llvm.mlir.addressof @str198 : !llvm.ptr
      %1347 = arith.constant 4 : i64
      %1348 = func.call @cc_make_string(%1346, %1347) : (!llvm.ptr, i64) -> i64
      %1349 = func.call @cc_intern(%1345, %1348) : (i64, i64) -> i64
      %1350 = func.call @cc_nil_value() : () -> i64
      %1351 = func.call @cc_cons(%1349, %1350) : (i64, i64) -> i64
      %1352 = func.call @cc_values_pack(%1351) : (i64) -> i64
      func.call @stack_push_pointer(%1349) : (i64) -> ()
      %1353 = llvm.mlir.addressof @str199 : !llvm.ptr
      %1354 = arith.constant 35 : i64
      %1355 = func.call @cc_make_string(%1353, %1354) : (!llvm.ptr, i64) -> i64
      %1356 = llvm.mlir.addressof @str200 : !llvm.ptr
      %1357 = arith.constant 4 : i64
      %1358 = func.call @cc_make_string(%1356, %1357) : (!llvm.ptr, i64) -> i64
      %1359 = func.call @cc_intern(%1355, %1358) : (i64, i64) -> i64
      %1360 = func.call @cc_nil_value() : () -> i64
      %1361 = func.call @cc_cons(%1359, %1360) : (i64, i64) -> i64
      %1362 = func.call @cc_values_pack(%1361) : (i64) -> i64
      func.call @stack_push_pointer(%1359) : (i64) -> ()
      %1363 = llvm.mlir.addressof @str201 : !llvm.ptr
      %1364 = arith.constant 20 : i64
      %1365 = func.call @cc_make_string(%1363, %1364) : (!llvm.ptr, i64) -> i64
      %1366 = llvm.mlir.addressof @str202 : !llvm.ptr
      %1367 = arith.constant 4 : i64
      %1368 = func.call @cc_make_string(%1366, %1367) : (!llvm.ptr, i64) -> i64
      %1369 = func.call @cc_intern(%1365, %1368) : (i64, i64) -> i64
      %1370 = func.call @cc_nil_value() : () -> i64
      %1371 = func.call @cc_cons(%1369, %1370) : (i64, i64) -> i64
      %1372 = func.call @cc_values_pack(%1371) : (i64) -> i64
      func.call @stack_push_pointer(%1369) : (i64) -> ()
      %1373 = llvm.mlir.addressof @str203 : !llvm.ptr
      %1374 = arith.constant 23 : i64
      %1375 = func.call @cc_make_string(%1373, %1374) : (!llvm.ptr, i64) -> i64
      %1376 = llvm.mlir.addressof @str204 : !llvm.ptr
      %1377 = arith.constant 4 : i64
      %1378 = func.call @cc_make_string(%1376, %1377) : (!llvm.ptr, i64) -> i64
      %1379 = func.call @cc_intern(%1375, %1378) : (i64, i64) -> i64
      %1380 = func.call @cc_nil_value() : () -> i64
      %1381 = func.call @cc_cons(%1379, %1380) : (i64, i64) -> i64
      %1382 = func.call @cc_values_pack(%1381) : (i64) -> i64
      func.call @stack_push_pointer(%1379) : (i64) -> ()
      %1383 = llvm.mlir.addressof @str205 : !llvm.ptr
      %1384 = arith.constant 42 : i64
      %1385 = func.call @cc_make_string(%1383, %1384) : (!llvm.ptr, i64) -> i64
      %1386 = llvm.mlir.addressof @str206 : !llvm.ptr
      %1387 = arith.constant 4 : i64
      %1388 = func.call @cc_make_string(%1386, %1387) : (!llvm.ptr, i64) -> i64
      %1389 = func.call @cc_intern(%1385, %1388) : (i64, i64) -> i64
      %1390 = func.call @cc_nil_value() : () -> i64
      %1391 = func.call @cc_cons(%1389, %1390) : (i64, i64) -> i64
      %1392 = func.call @cc_values_pack(%1391) : (i64) -> i64
      func.call @stack_push_pointer(%1389) : (i64) -> ()
      %1393 = llvm.mlir.addressof @str207 : !llvm.ptr
      %1394 = arith.constant 28 : i64
      %1395 = func.call @cc_make_string(%1393, %1394) : (!llvm.ptr, i64) -> i64
      %1396 = llvm.mlir.addressof @str208 : !llvm.ptr
      %1397 = arith.constant 4 : i64
      %1398 = func.call @cc_make_string(%1396, %1397) : (!llvm.ptr, i64) -> i64
      %1399 = func.call @cc_intern(%1395, %1398) : (i64, i64) -> i64
      %1400 = func.call @cc_nil_value() : () -> i64
      %1401 = func.call @cc_cons(%1399, %1400) : (i64, i64) -> i64
      %1402 = func.call @cc_values_pack(%1401) : (i64) -> i64
      func.call @stack_push_pointer(%1399) : (i64) -> ()
      %1403 = llvm.mlir.addressof @str209 : !llvm.ptr
      %1404 = arith.constant 29 : i64
      %1405 = func.call @cc_make_string(%1403, %1404) : (!llvm.ptr, i64) -> i64
      %1406 = llvm.mlir.addressof @str210 : !llvm.ptr
      %1407 = arith.constant 4 : i64
      %1408 = func.call @cc_make_string(%1406, %1407) : (!llvm.ptr, i64) -> i64
      %1409 = func.call @cc_intern(%1405, %1408) : (i64, i64) -> i64
      %1410 = func.call @cc_nil_value() : () -> i64
      %1411 = func.call @cc_cons(%1409, %1410) : (i64, i64) -> i64
      %1412 = func.call @cc_values_pack(%1411) : (i64) -> i64
      func.call @stack_push_pointer(%1409) : (i64) -> ()
      %1413 = llvm.mlir.addressof @str211 : !llvm.ptr
      %1414 = arith.constant 35 : i64
      %1415 = func.call @cc_make_string(%1413, %1414) : (!llvm.ptr, i64) -> i64
      %1416 = llvm.mlir.addressof @str212 : !llvm.ptr
      %1417 = arith.constant 4 : i64
      %1418 = func.call @cc_make_string(%1416, %1417) : (!llvm.ptr, i64) -> i64
      %1419 = func.call @cc_intern(%1415, %1418) : (i64, i64) -> i64
      %1420 = func.call @cc_nil_value() : () -> i64
      %1421 = func.call @cc_cons(%1419, %1420) : (i64, i64) -> i64
      %1422 = func.call @cc_values_pack(%1421) : (i64) -> i64
      func.call @stack_push_pointer(%1419) : (i64) -> ()
      %1423 = llvm.mlir.addressof @str213 : !llvm.ptr
      %1424 = arith.constant 24 : i64
      %1425 = func.call @cc_make_string(%1423, %1424) : (!llvm.ptr, i64) -> i64
      %1426 = llvm.mlir.addressof @str214 : !llvm.ptr
      %1427 = arith.constant 4 : i64
      %1428 = func.call @cc_make_string(%1426, %1427) : (!llvm.ptr, i64) -> i64
      %1429 = func.call @cc_intern(%1425, %1428) : (i64, i64) -> i64
      %1430 = func.call @cc_nil_value() : () -> i64
      %1431 = func.call @cc_cons(%1429, %1430) : (i64, i64) -> i64
      %1432 = func.call @cc_values_pack(%1431) : (i64) -> i64
      func.call @stack_push_pointer(%1429) : (i64) -> ()
      %1433 = llvm.mlir.addressof @str215 : !llvm.ptr
      %1434 = arith.constant 21 : i64
      %1435 = func.call @cc_make_string(%1433, %1434) : (!llvm.ptr, i64) -> i64
      %1436 = llvm.mlir.addressof @str216 : !llvm.ptr
      %1437 = arith.constant 4 : i64
      %1438 = func.call @cc_make_string(%1436, %1437) : (!llvm.ptr, i64) -> i64
      %1439 = func.call @cc_intern(%1435, %1438) : (i64, i64) -> i64
      %1440 = func.call @cc_nil_value() : () -> i64
      %1441 = func.call @cc_cons(%1439, %1440) : (i64, i64) -> i64
      %1442 = func.call @cc_values_pack(%1441) : (i64) -> i64
      func.call @stack_push_pointer(%1439) : (i64) -> ()
      %1443 = llvm.mlir.addressof @str217 : !llvm.ptr
      %1444 = arith.constant 18 : i64
      %1445 = func.call @cc_make_string(%1443, %1444) : (!llvm.ptr, i64) -> i64
      %1446 = llvm.mlir.addressof @str218 : !llvm.ptr
      %1447 = arith.constant 4 : i64
      %1448 = func.call @cc_make_string(%1446, %1447) : (!llvm.ptr, i64) -> i64
      %1449 = func.call @cc_intern(%1445, %1448) : (i64, i64) -> i64
      %1450 = func.call @cc_nil_value() : () -> i64
      %1451 = func.call @cc_cons(%1449, %1450) : (i64, i64) -> i64
      %1452 = func.call @cc_values_pack(%1451) : (i64) -> i64
      func.call @stack_push_pointer(%1449) : (i64) -> ()
      %1453 = llvm.mlir.addressof @str219 : !llvm.ptr
      %1454 = arith.constant 14 : i64
      %1455 = func.call @cc_make_string(%1453, %1454) : (!llvm.ptr, i64) -> i64
      %1456 = llvm.mlir.addressof @str220 : !llvm.ptr
      %1457 = arith.constant 4 : i64
      %1458 = func.call @cc_make_string(%1456, %1457) : (!llvm.ptr, i64) -> i64
      %1459 = func.call @cc_intern(%1455, %1458) : (i64, i64) -> i64
      %1460 = func.call @cc_nil_value() : () -> i64
      %1461 = func.call @cc_cons(%1459, %1460) : (i64, i64) -> i64
      %1462 = func.call @cc_values_pack(%1461) : (i64) -> i64
      func.call @stack_push_pointer(%1459) : (i64) -> ()
      %1463 = llvm.mlir.addressof @str221 : !llvm.ptr
      %1464 = arith.constant 15 : i64
      %1465 = func.call @cc_make_string(%1463, %1464) : (!llvm.ptr, i64) -> i64
      %1466 = llvm.mlir.addressof @str222 : !llvm.ptr
      %1467 = arith.constant 4 : i64
      %1468 = func.call @cc_make_string(%1466, %1467) : (!llvm.ptr, i64) -> i64
      %1469 = func.call @cc_intern(%1465, %1468) : (i64, i64) -> i64
      %1470 = func.call @cc_nil_value() : () -> i64
      %1471 = func.call @cc_cons(%1469, %1470) : (i64, i64) -> i64
      %1472 = func.call @cc_values_pack(%1471) : (i64) -> i64
      func.call @stack_push_pointer(%1469) : (i64) -> ()
      %1473 = llvm.mlir.addressof @str223 : !llvm.ptr
      %1474 = arith.constant 23 : i64
      %1475 = func.call @cc_make_string(%1473, %1474) : (!llvm.ptr, i64) -> i64
      %1476 = llvm.mlir.addressof @str224 : !llvm.ptr
      %1477 = arith.constant 4 : i64
      %1478 = func.call @cc_make_string(%1476, %1477) : (!llvm.ptr, i64) -> i64
      %1479 = func.call @cc_intern(%1475, %1478) : (i64, i64) -> i64
      %1480 = func.call @cc_nil_value() : () -> i64
      %1481 = func.call @cc_cons(%1479, %1480) : (i64, i64) -> i64
      %1482 = func.call @cc_values_pack(%1481) : (i64) -> i64
      func.call @stack_push_pointer(%1479) : (i64) -> ()
      %1483 = llvm.mlir.addressof @str225 : !llvm.ptr
      %1484 = arith.constant 18 : i64
      %1485 = func.call @cc_make_string(%1483, %1484) : (!llvm.ptr, i64) -> i64
      %1486 = llvm.mlir.addressof @str226 : !llvm.ptr
      %1487 = arith.constant 4 : i64
      %1488 = func.call @cc_make_string(%1486, %1487) : (!llvm.ptr, i64) -> i64
      %1489 = func.call @cc_intern(%1485, %1488) : (i64, i64) -> i64
      %1490 = func.call @cc_nil_value() : () -> i64
      %1491 = func.call @cc_cons(%1489, %1490) : (i64, i64) -> i64
      %1492 = func.call @cc_values_pack(%1491) : (i64) -> i64
      func.call @stack_push_pointer(%1489) : (i64) -> ()
      %1493 = llvm.mlir.addressof @str227 : !llvm.ptr
      %1494 = arith.constant 19 : i64
      %1495 = func.call @cc_make_string(%1493, %1494) : (!llvm.ptr, i64) -> i64
      %1496 = llvm.mlir.addressof @str228 : !llvm.ptr
      %1497 = arith.constant 4 : i64
      %1498 = func.call @cc_make_string(%1496, %1497) : (!llvm.ptr, i64) -> i64
      %1499 = func.call @cc_intern(%1495, %1498) : (i64, i64) -> i64
      %1500 = func.call @cc_nil_value() : () -> i64
      %1501 = func.call @cc_cons(%1499, %1500) : (i64, i64) -> i64
      %1502 = func.call @cc_values_pack(%1501) : (i64) -> i64
      func.call @stack_push_pointer(%1499) : (i64) -> ()
      %1503 = llvm.mlir.addressof @str229 : !llvm.ptr
      %1504 = arith.constant 17 : i64
      %1505 = func.call @cc_make_string(%1503, %1504) : (!llvm.ptr, i64) -> i64
      %1506 = llvm.mlir.addressof @str230 : !llvm.ptr
      %1507 = arith.constant 4 : i64
      %1508 = func.call @cc_make_string(%1506, %1507) : (!llvm.ptr, i64) -> i64
      %1509 = func.call @cc_intern(%1505, %1508) : (i64, i64) -> i64
      %1510 = func.call @cc_nil_value() : () -> i64
      %1511 = func.call @cc_cons(%1509, %1510) : (i64, i64) -> i64
      %1512 = func.call @cc_values_pack(%1511) : (i64) -> i64
      func.call @stack_push_pointer(%1509) : (i64) -> ()
      %1513 = llvm.mlir.addressof @str231 : !llvm.ptr
      %1514 = arith.constant 26 : i64
      %1515 = func.call @cc_make_string(%1513, %1514) : (!llvm.ptr, i64) -> i64
      %1516 = llvm.mlir.addressof @str232 : !llvm.ptr
      %1517 = arith.constant 4 : i64
      %1518 = func.call @cc_make_string(%1516, %1517) : (!llvm.ptr, i64) -> i64
      %1519 = func.call @cc_intern(%1515, %1518) : (i64, i64) -> i64
      %1520 = func.call @cc_nil_value() : () -> i64
      %1521 = func.call @cc_cons(%1519, %1520) : (i64, i64) -> i64
      %1522 = func.call @cc_values_pack(%1521) : (i64) -> i64
      func.call @stack_push_pointer(%1519) : (i64) -> ()
      %1523 = llvm.mlir.addressof @str233 : !llvm.ptr
      %1524 = arith.constant 28 : i64
      %1525 = func.call @cc_make_string(%1523, %1524) : (!llvm.ptr, i64) -> i64
      %1526 = llvm.mlir.addressof @str234 : !llvm.ptr
      %1527 = arith.constant 4 : i64
      %1528 = func.call @cc_make_string(%1526, %1527) : (!llvm.ptr, i64) -> i64
      %1529 = func.call @cc_intern(%1525, %1528) : (i64, i64) -> i64
      %1530 = func.call @cc_nil_value() : () -> i64
      %1531 = func.call @cc_cons(%1529, %1530) : (i64, i64) -> i64
      %1532 = func.call @cc_values_pack(%1531) : (i64) -> i64
      func.call @stack_push_pointer(%1529) : (i64) -> ()
      %1533 = llvm.mlir.addressof @str235 : !llvm.ptr
      %1534 = arith.constant 24 : i64
      %1535 = func.call @cc_make_string(%1533, %1534) : (!llvm.ptr, i64) -> i64
      %1536 = llvm.mlir.addressof @str236 : !llvm.ptr
      %1537 = arith.constant 4 : i64
      %1538 = func.call @cc_make_string(%1536, %1537) : (!llvm.ptr, i64) -> i64
      %1539 = func.call @cc_intern(%1535, %1538) : (i64, i64) -> i64
      %1540 = func.call @cc_nil_value() : () -> i64
      %1541 = func.call @cc_cons(%1539, %1540) : (i64, i64) -> i64
      %1542 = func.call @cc_values_pack(%1541) : (i64) -> i64
      func.call @stack_push_pointer(%1539) : (i64) -> ()
      %1543 = llvm.mlir.addressof @str237 : !llvm.ptr
      %1544 = arith.constant 20 : i64
      %1545 = func.call @cc_make_string(%1543, %1544) : (!llvm.ptr, i64) -> i64
      %1546 = llvm.mlir.addressof @str238 : !llvm.ptr
      %1547 = arith.constant 4 : i64
      %1548 = func.call @cc_make_string(%1546, %1547) : (!llvm.ptr, i64) -> i64
      %1549 = func.call @cc_intern(%1545, %1548) : (i64, i64) -> i64
      %1550 = func.call @cc_nil_value() : () -> i64
      %1551 = func.call @cc_cons(%1549, %1550) : (i64, i64) -> i64
      %1552 = func.call @cc_values_pack(%1551) : (i64) -> i64
      func.call @stack_push_pointer(%1549) : (i64) -> ()
      %1553 = llvm.mlir.addressof @str239 : !llvm.ptr
      %1554 = arith.constant 20 : i64
      %1555 = func.call @cc_make_string(%1553, %1554) : (!llvm.ptr, i64) -> i64
      %1556 = llvm.mlir.addressof @str240 : !llvm.ptr
      %1557 = arith.constant 4 : i64
      %1558 = func.call @cc_make_string(%1556, %1557) : (!llvm.ptr, i64) -> i64
      %1559 = func.call @cc_intern(%1555, %1558) : (i64, i64) -> i64
      %1560 = func.call @cc_nil_value() : () -> i64
      %1561 = func.call @cc_cons(%1559, %1560) : (i64, i64) -> i64
      %1562 = func.call @cc_values_pack(%1561) : (i64) -> i64
      func.call @stack_push_pointer(%1559) : (i64) -> ()
      %1563 = llvm.mlir.addressof @str241 : !llvm.ptr
      %1564 = arith.constant 23 : i64
      %1565 = func.call @cc_make_string(%1563, %1564) : (!llvm.ptr, i64) -> i64
      %1566 = llvm.mlir.addressof @str242 : !llvm.ptr
      %1567 = arith.constant 4 : i64
      %1568 = func.call @cc_make_string(%1566, %1567) : (!llvm.ptr, i64) -> i64
      %1569 = func.call @cc_intern(%1565, %1568) : (i64, i64) -> i64
      %1570 = func.call @cc_nil_value() : () -> i64
      %1571 = func.call @cc_cons(%1569, %1570) : (i64, i64) -> i64
      %1572 = func.call @cc_values_pack(%1571) : (i64) -> i64
      func.call @stack_push_pointer(%1569) : (i64) -> ()
      %1573 = llvm.mlir.addressof @str243 : !llvm.ptr
      %1574 = arith.constant 23 : i64
      %1575 = func.call @cc_make_string(%1573, %1574) : (!llvm.ptr, i64) -> i64
      %1576 = llvm.mlir.addressof @str244 : !llvm.ptr
      %1577 = arith.constant 4 : i64
      %1578 = func.call @cc_make_string(%1576, %1577) : (!llvm.ptr, i64) -> i64
      %1579 = func.call @cc_intern(%1575, %1578) : (i64, i64) -> i64
      %1580 = func.call @cc_nil_value() : () -> i64
      %1581 = func.call @cc_cons(%1579, %1580) : (i64, i64) -> i64
      %1582 = func.call @cc_values_pack(%1581) : (i64) -> i64
      func.call @stack_push_pointer(%1579) : (i64) -> ()
      %1583 = llvm.mlir.addressof @str245 : !llvm.ptr
      %1584 = arith.constant 24 : i64
      %1585 = func.call @cc_make_string(%1583, %1584) : (!llvm.ptr, i64) -> i64
      %1586 = llvm.mlir.addressof @str246 : !llvm.ptr
      %1587 = arith.constant 4 : i64
      %1588 = func.call @cc_make_string(%1586, %1587) : (!llvm.ptr, i64) -> i64
      %1589 = func.call @cc_intern(%1585, %1588) : (i64, i64) -> i64
      %1590 = func.call @cc_nil_value() : () -> i64
      %1591 = func.call @cc_cons(%1589, %1590) : (i64, i64) -> i64
      %1592 = func.call @cc_values_pack(%1591) : (i64) -> i64
      func.call @stack_push_pointer(%1589) : (i64) -> ()
      %1593 = llvm.mlir.addressof @str247 : !llvm.ptr
      %1594 = arith.constant 19 : i64
      %1595 = func.call @cc_make_string(%1593, %1594) : (!llvm.ptr, i64) -> i64
      %1596 = llvm.mlir.addressof @str248 : !llvm.ptr
      %1597 = arith.constant 4 : i64
      %1598 = func.call @cc_make_string(%1596, %1597) : (!llvm.ptr, i64) -> i64
      %1599 = func.call @cc_intern(%1595, %1598) : (i64, i64) -> i64
      %1600 = func.call @cc_nil_value() : () -> i64
      %1601 = func.call @cc_cons(%1599, %1600) : (i64, i64) -> i64
      %1602 = func.call @cc_values_pack(%1601) : (i64) -> i64
      func.call @stack_push_pointer(%1599) : (i64) -> ()
      %1603 = llvm.mlir.addressof @str249 : !llvm.ptr
      %1604 = arith.constant 16 : i64
      %1605 = func.call @cc_make_string(%1603, %1604) : (!llvm.ptr, i64) -> i64
      %1606 = llvm.mlir.addressof @str250 : !llvm.ptr
      %1607 = arith.constant 4 : i64
      %1608 = func.call @cc_make_string(%1606, %1607) : (!llvm.ptr, i64) -> i64
      %1609 = func.call @cc_intern(%1605, %1608) : (i64, i64) -> i64
      %1610 = func.call @cc_nil_value() : () -> i64
      %1611 = func.call @cc_cons(%1609, %1610) : (i64, i64) -> i64
      %1612 = func.call @cc_values_pack(%1611) : (i64) -> i64
      func.call @stack_push_pointer(%1609) : (i64) -> ()
      %1613 = llvm.mlir.addressof @str251 : !llvm.ptr
      %1614 = arith.constant 20 : i64
      %1615 = func.call @cc_make_string(%1613, %1614) : (!llvm.ptr, i64) -> i64
      %1616 = llvm.mlir.addressof @str252 : !llvm.ptr
      %1617 = arith.constant 4 : i64
      %1618 = func.call @cc_make_string(%1616, %1617) : (!llvm.ptr, i64) -> i64
      %1619 = func.call @cc_intern(%1615, %1618) : (i64, i64) -> i64
      %1620 = func.call @cc_nil_value() : () -> i64
      %1621 = func.call @cc_cons(%1619, %1620) : (i64, i64) -> i64
      %1622 = func.call @cc_values_pack(%1621) : (i64) -> i64
      func.call @stack_push_pointer(%1619) : (i64) -> ()
      %1623 = llvm.mlir.addressof @str253 : !llvm.ptr
      %1624 = arith.constant 22 : i64
      %1625 = func.call @cc_make_string(%1623, %1624) : (!llvm.ptr, i64) -> i64
      %1626 = llvm.mlir.addressof @str254 : !llvm.ptr
      %1627 = arith.constant 4 : i64
      %1628 = func.call @cc_make_string(%1626, %1627) : (!llvm.ptr, i64) -> i64
      %1629 = func.call @cc_intern(%1625, %1628) : (i64, i64) -> i64
      %1630 = func.call @cc_nil_value() : () -> i64
      %1631 = func.call @cc_cons(%1629, %1630) : (i64, i64) -> i64
      %1632 = func.call @cc_values_pack(%1631) : (i64) -> i64
      func.call @stack_push_pointer(%1629) : (i64) -> ()
      %1633 = llvm.mlir.addressof @str255 : !llvm.ptr
      %1634 = arith.constant 4 : i64
      %1635 = func.call @cc_make_string(%1633, %1634) : (!llvm.ptr, i64) -> i64
      %1636 = llvm.mlir.addressof @str256 : !llvm.ptr
      %1637 = arith.constant 11 : i64
      %1638 = func.call @cc_make_string(%1636, %1637) : (!llvm.ptr, i64) -> i64
      %1639 = func.call @cc_intern(%1635, %1638) : (i64, i64) -> i64
      %1640 = func.call @cc_nil_value() : () -> i64
      %1641 = func.call @cc_cons(%1639, %1640) : (i64, i64) -> i64
      %1642 = func.call @cc_values_pack(%1641) : (i64) -> i64
      func.call @stack_push_pointer(%1639) : (i64) -> ()
      %1643 = llvm.mlir.addressof @str257 : !llvm.ptr
      %1644 = arith.constant 21 : i64
      %1645 = func.call @cc_make_string(%1643, %1644) : (!llvm.ptr, i64) -> i64
      %1646 = llvm.mlir.addressof @str258 : !llvm.ptr
      %1647 = arith.constant 4 : i64
      %1648 = func.call @cc_make_string(%1646, %1647) : (!llvm.ptr, i64) -> i64
      %1649 = func.call @cc_intern(%1645, %1648) : (i64, i64) -> i64
      %1650 = func.call @cc_nil_value() : () -> i64
      %1651 = func.call @cc_cons(%1649, %1650) : (i64, i64) -> i64
      %1652 = func.call @cc_values_pack(%1651) : (i64) -> i64
      func.call @stack_push_pointer(%1649) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1653 = func.call @stack_pop_pointer() : () -> i64
      %1654 = func.call @stack_pop_pointer() : () -> i64
      %1655 = func.call @cc_cons(%1654, %1653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1655) : (i64) -> ()
      %1656 = func.call @stack_pop_pointer() : () -> i64
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @cc_cons(%1657, %1656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1658) : (i64) -> ()
      %1659 = llvm.mlir.addressof @str259 : !llvm.ptr
      %1660 = arith.constant 4 : i64
      %1661 = func.call @cc_make_string(%1659, %1660) : (!llvm.ptr, i64) -> i64
      %1662 = llvm.mlir.addressof @str260 : !llvm.ptr
      %1663 = arith.constant 11 : i64
      %1664 = func.call @cc_make_string(%1662, %1663) : (!llvm.ptr, i64) -> i64
      %1665 = func.call @cc_intern(%1661, %1664) : (i64, i64) -> i64
      %1666 = func.call @cc_nil_value() : () -> i64
      %1667 = func.call @cc_cons(%1665, %1666) : (i64, i64) -> i64
      %1668 = func.call @cc_values_pack(%1667) : (i64) -> i64
      func.call @stack_push_pointer(%1665) : (i64) -> ()
      %1669 = llvm.mlir.addressof @str261 : !llvm.ptr
      %1670 = arith.constant 22 : i64
      %1671 = func.call @cc_make_string(%1669, %1670) : (!llvm.ptr, i64) -> i64
      %1672 = llvm.mlir.addressof @str262 : !llvm.ptr
      %1673 = arith.constant 4 : i64
      %1674 = func.call @cc_make_string(%1672, %1673) : (!llvm.ptr, i64) -> i64
      %1675 = func.call @cc_intern(%1671, %1674) : (i64, i64) -> i64
      %1676 = func.call @cc_nil_value() : () -> i64
      %1677 = func.call @cc_cons(%1675, %1676) : (i64, i64) -> i64
      %1678 = func.call @cc_values_pack(%1677) : (i64) -> i64
      func.call @stack_push_pointer(%1675) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1679 = func.call @stack_pop_pointer() : () -> i64
      %1680 = func.call @stack_pop_pointer() : () -> i64
      %1681 = func.call @cc_cons(%1680, %1679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1681) : (i64) -> ()
      %1682 = func.call @stack_pop_pointer() : () -> i64
      %1683 = func.call @stack_pop_pointer() : () -> i64
      %1684 = func.call @cc_cons(%1683, %1682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1684) : (i64) -> ()
      %1685 = llvm.mlir.addressof @str263 : !llvm.ptr
      %1686 = arith.constant 23 : i64
      %1687 = func.call @cc_make_string(%1685, %1686) : (!llvm.ptr, i64) -> i64
      %1688 = llvm.mlir.addressof @str264 : !llvm.ptr
      %1689 = arith.constant 4 : i64
      %1690 = func.call @cc_make_string(%1688, %1689) : (!llvm.ptr, i64) -> i64
      %1691 = func.call @cc_intern(%1687, %1690) : (i64, i64) -> i64
      %1692 = func.call @cc_nil_value() : () -> i64
      %1693 = func.call @cc_cons(%1691, %1692) : (i64, i64) -> i64
      %1694 = func.call @cc_values_pack(%1693) : (i64) -> i64
      func.call @stack_push_pointer(%1691) : (i64) -> ()
      %1695 = llvm.mlir.addressof @str265 : !llvm.ptr
      %1696 = arith.constant 27 : i64
      %1697 = func.call @cc_make_string(%1695, %1696) : (!llvm.ptr, i64) -> i64
      %1698 = llvm.mlir.addressof @str266 : !llvm.ptr
      %1699 = arith.constant 4 : i64
      %1700 = func.call @cc_make_string(%1698, %1699) : (!llvm.ptr, i64) -> i64
      %1701 = func.call @cc_intern(%1697, %1700) : (i64, i64) -> i64
      %1702 = func.call @cc_nil_value() : () -> i64
      %1703 = func.call @cc_cons(%1701, %1702) : (i64, i64) -> i64
      %1704 = func.call @cc_values_pack(%1703) : (i64) -> i64
      func.call @stack_push_pointer(%1701) : (i64) -> ()
      %1705 = llvm.mlir.addressof @str267 : !llvm.ptr
      %1706 = arith.constant 22 : i64
      %1707 = func.call @cc_make_string(%1705, %1706) : (!llvm.ptr, i64) -> i64
      %1708 = llvm.mlir.addressof @str268 : !llvm.ptr
      %1709 = arith.constant 4 : i64
      %1710 = func.call @cc_make_string(%1708, %1709) : (!llvm.ptr, i64) -> i64
      %1711 = func.call @cc_intern(%1707, %1710) : (i64, i64) -> i64
      %1712 = func.call @cc_nil_value() : () -> i64
      %1713 = func.call @cc_cons(%1711, %1712) : (i64, i64) -> i64
      %1714 = func.call @cc_values_pack(%1713) : (i64) -> i64
      func.call @stack_push_pointer(%1711) : (i64) -> ()
      %1715 = llvm.mlir.addressof @str269 : !llvm.ptr
      %1716 = arith.constant 36 : i64
      %1717 = func.call @cc_make_string(%1715, %1716) : (!llvm.ptr, i64) -> i64
      %1718 = llvm.mlir.addressof @str270 : !llvm.ptr
      %1719 = arith.constant 4 : i64
      %1720 = func.call @cc_make_string(%1718, %1719) : (!llvm.ptr, i64) -> i64
      %1721 = func.call @cc_intern(%1717, %1720) : (i64, i64) -> i64
      %1722 = func.call @cc_nil_value() : () -> i64
      %1723 = func.call @cc_cons(%1721, %1722) : (i64, i64) -> i64
      %1724 = func.call @cc_values_pack(%1723) : (i64) -> i64
      func.call @stack_push_pointer(%1721) : (i64) -> ()
      %1725 = llvm.mlir.addressof @str271 : !llvm.ptr
      %1726 = arith.constant 26 : i64
      %1727 = func.call @cc_make_string(%1725, %1726) : (!llvm.ptr, i64) -> i64
      %1728 = llvm.mlir.addressof @str272 : !llvm.ptr
      %1729 = arith.constant 4 : i64
      %1730 = func.call @cc_make_string(%1728, %1729) : (!llvm.ptr, i64) -> i64
      %1731 = func.call @cc_intern(%1727, %1730) : (i64, i64) -> i64
      %1732 = func.call @cc_nil_value() : () -> i64
      %1733 = func.call @cc_cons(%1731, %1732) : (i64, i64) -> i64
      %1734 = func.call @cc_values_pack(%1733) : (i64) -> i64
      func.call @stack_push_pointer(%1731) : (i64) -> ()
      %1735 = llvm.mlir.addressof @str273 : !llvm.ptr
      %1736 = arith.constant 16 : i64
      %1737 = func.call @cc_make_string(%1735, %1736) : (!llvm.ptr, i64) -> i64
      %1738 = llvm.mlir.addressof @str274 : !llvm.ptr
      %1739 = arith.constant 4 : i64
      %1740 = func.call @cc_make_string(%1738, %1739) : (!llvm.ptr, i64) -> i64
      %1741 = func.call @cc_intern(%1737, %1740) : (i64, i64) -> i64
      %1742 = func.call @cc_nil_value() : () -> i64
      %1743 = func.call @cc_cons(%1741, %1742) : (i64, i64) -> i64
      %1744 = func.call @cc_values_pack(%1743) : (i64) -> i64
      func.call @stack_push_pointer(%1741) : (i64) -> ()
      %1745 = llvm.mlir.addressof @str275 : !llvm.ptr
      %1746 = arith.constant 19 : i64
      %1747 = func.call @cc_make_string(%1745, %1746) : (!llvm.ptr, i64) -> i64
      %1748 = llvm.mlir.addressof @str276 : !llvm.ptr
      %1749 = arith.constant 4 : i64
      %1750 = func.call @cc_make_string(%1748, %1749) : (!llvm.ptr, i64) -> i64
      %1751 = func.call @cc_intern(%1747, %1750) : (i64, i64) -> i64
      %1752 = func.call @cc_nil_value() : () -> i64
      %1753 = func.call @cc_cons(%1751, %1752) : (i64, i64) -> i64
      %1754 = func.call @cc_values_pack(%1753) : (i64) -> i64
      func.call @stack_push_pointer(%1751) : (i64) -> ()
      %1755 = llvm.mlir.addressof @str277 : !llvm.ptr
      %1756 = arith.constant 19 : i64
      %1757 = func.call @cc_make_string(%1755, %1756) : (!llvm.ptr, i64) -> i64
      %1758 = llvm.mlir.addressof @str278 : !llvm.ptr
      %1759 = arith.constant 4 : i64
      %1760 = func.call @cc_make_string(%1758, %1759) : (!llvm.ptr, i64) -> i64
      %1761 = func.call @cc_intern(%1757, %1760) : (i64, i64) -> i64
      %1762 = func.call @cc_nil_value() : () -> i64
      %1763 = func.call @cc_cons(%1761, %1762) : (i64, i64) -> i64
      %1764 = func.call @cc_values_pack(%1763) : (i64) -> i64
      func.call @stack_push_pointer(%1761) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1765 = func.call @stack_pop_pointer() : () -> i64
      %1766 = func.call @stack_pop_pointer() : () -> i64
      %1767 = func.call @cc_cons(%1766, %1765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1767) : (i64) -> ()
      %1768 = func.call @stack_pop_pointer() : () -> i64
      %1769 = func.call @stack_pop_pointer() : () -> i64
      %1770 = func.call @cc_cons(%1769, %1768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1770) : (i64) -> ()
      %1771 = func.call @stack_pop_pointer() : () -> i64
      %1772 = func.call @stack_pop_pointer() : () -> i64
      %1773 = func.call @cc_cons(%1772, %1771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1773) : (i64) -> ()
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = func.call @stack_pop_pointer() : () -> i64
      %1776 = func.call @cc_cons(%1775, %1774) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1776) : (i64) -> ()
      %1777 = func.call @stack_pop_pointer() : () -> i64
      %1778 = func.call @stack_pop_pointer() : () -> i64
      %1779 = func.call @cc_cons(%1778, %1777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1779) : (i64) -> ()
      %1780 = func.call @stack_pop_pointer() : () -> i64
      %1781 = func.call @stack_pop_pointer() : () -> i64
      %1782 = func.call @cc_cons(%1781, %1780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1782) : (i64) -> ()
      %1783 = func.call @stack_pop_pointer() : () -> i64
      %1784 = func.call @stack_pop_pointer() : () -> i64
      %1785 = func.call @cc_cons(%1784, %1783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1785) : (i64) -> ()
      %1786 = func.call @stack_pop_pointer() : () -> i64
      %1787 = func.call @stack_pop_pointer() : () -> i64
      %1788 = func.call @cc_cons(%1787, %1786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1788) : (i64) -> ()
      %1789 = func.call @stack_pop_pointer() : () -> i64
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = func.call @cc_cons(%1790, %1789) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1791) : (i64) -> ()
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
      %1801 = func.call @stack_pop_pointer() : () -> i64
      %1802 = func.call @stack_pop_pointer() : () -> i64
      %1803 = func.call @cc_cons(%1802, %1801) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1803) : (i64) -> ()
      %1804 = func.call @stack_pop_pointer() : () -> i64
      %1805 = func.call @stack_pop_pointer() : () -> i64
      %1806 = func.call @cc_cons(%1805, %1804) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1806) : (i64) -> ()
      %1807 = func.call @stack_pop_pointer() : () -> i64
      %1808 = func.call @stack_pop_pointer() : () -> i64
      %1809 = func.call @cc_cons(%1808, %1807) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1809) : (i64) -> ()
      %1810 = func.call @stack_pop_pointer() : () -> i64
      %1811 = func.call @stack_pop_pointer() : () -> i64
      %1812 = func.call @cc_cons(%1811, %1810) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1812) : (i64) -> ()
      %1813 = func.call @stack_pop_pointer() : () -> i64
      %1814 = func.call @stack_pop_pointer() : () -> i64
      %1815 = func.call @cc_cons(%1814, %1813) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1815) : (i64) -> ()
      %1816 = func.call @stack_pop_pointer() : () -> i64
      %1817 = func.call @stack_pop_pointer() : () -> i64
      %1818 = func.call @cc_cons(%1817, %1816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1818) : (i64) -> ()
      %1819 = func.call @stack_pop_pointer() : () -> i64
      %1820 = func.call @stack_pop_pointer() : () -> i64
      %1821 = func.call @cc_cons(%1820, %1819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1821) : (i64) -> ()
      %1822 = func.call @stack_pop_pointer() : () -> i64
      %1823 = func.call @stack_pop_pointer() : () -> i64
      %1824 = func.call @cc_cons(%1823, %1822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1824) : (i64) -> ()
      %1825 = func.call @stack_pop_pointer() : () -> i64
      %1826 = func.call @stack_pop_pointer() : () -> i64
      %1827 = func.call @cc_cons(%1826, %1825) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1827) : (i64) -> ()
      %1828 = func.call @stack_pop_pointer() : () -> i64
      %1829 = func.call @stack_pop_pointer() : () -> i64
      %1830 = func.call @cc_cons(%1829, %1828) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1830) : (i64) -> ()
      %1831 = func.call @stack_pop_pointer() : () -> i64
      %1832 = func.call @stack_pop_pointer() : () -> i64
      %1833 = func.call @cc_cons(%1832, %1831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1833) : (i64) -> ()
      %1834 = func.call @stack_pop_pointer() : () -> i64
      %1835 = func.call @stack_pop_pointer() : () -> i64
      %1836 = func.call @cc_cons(%1835, %1834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1836) : (i64) -> ()
      %1837 = func.call @stack_pop_pointer() : () -> i64
      %1838 = func.call @stack_pop_pointer() : () -> i64
      %1839 = func.call @cc_cons(%1838, %1837) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1839) : (i64) -> ()
      %1840 = func.call @stack_pop_pointer() : () -> i64
      %1841 = func.call @stack_pop_pointer() : () -> i64
      %1842 = func.call @cc_cons(%1841, %1840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1842) : (i64) -> ()
      %1843 = func.call @stack_pop_pointer() : () -> i64
      %1844 = func.call @stack_pop_pointer() : () -> i64
      %1845 = func.call @cc_cons(%1844, %1843) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1845) : (i64) -> ()
      %1846 = func.call @stack_pop_pointer() : () -> i64
      %1847 = func.call @stack_pop_pointer() : () -> i64
      %1848 = func.call @cc_cons(%1847, %1846) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1848) : (i64) -> ()
      %1849 = func.call @stack_pop_pointer() : () -> i64
      %1850 = func.call @stack_pop_pointer() : () -> i64
      %1851 = func.call @cc_cons(%1850, %1849) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1851) : (i64) -> ()
      %1852 = func.call @stack_pop_pointer() : () -> i64
      %1853 = func.call @stack_pop_pointer() : () -> i64
      %1854 = func.call @cc_cons(%1853, %1852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1854) : (i64) -> ()
      %1855 = func.call @stack_pop_pointer() : () -> i64
      %1856 = func.call @stack_pop_pointer() : () -> i64
      %1857 = func.call @cc_cons(%1856, %1855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1857) : (i64) -> ()
      %1858 = func.call @stack_pop_pointer() : () -> i64
      %1859 = func.call @stack_pop_pointer() : () -> i64
      %1860 = func.call @cc_cons(%1859, %1858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1860) : (i64) -> ()
      %1861 = func.call @stack_pop_pointer() : () -> i64
      %1862 = func.call @stack_pop_pointer() : () -> i64
      %1863 = func.call @cc_cons(%1862, %1861) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1863) : (i64) -> ()
      %1864 = func.call @stack_pop_pointer() : () -> i64
      %1865 = func.call @stack_pop_pointer() : () -> i64
      %1866 = func.call @cc_cons(%1865, %1864) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1866) : (i64) -> ()
      %1867 = func.call @stack_pop_pointer() : () -> i64
      %1868 = func.call @stack_pop_pointer() : () -> i64
      %1869 = func.call @cc_cons(%1868, %1867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1869) : (i64) -> ()
      %1870 = func.call @stack_pop_pointer() : () -> i64
      %1871 = func.call @stack_pop_pointer() : () -> i64
      %1872 = func.call @cc_cons(%1871, %1870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1872) : (i64) -> ()
      %1873 = func.call @stack_pop_pointer() : () -> i64
      %1874 = func.call @stack_pop_pointer() : () -> i64
      %1875 = func.call @cc_cons(%1874, %1873) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1875) : (i64) -> ()
      %1876 = func.call @stack_pop_pointer() : () -> i64
      %1877 = func.call @stack_pop_pointer() : () -> i64
      %1878 = func.call @cc_cons(%1877, %1876) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1878) : (i64) -> ()
      %1879 = func.call @stack_pop_pointer() : () -> i64
      %1880 = func.call @stack_pop_pointer() : () -> i64
      %1881 = func.call @cc_cons(%1880, %1879) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1881) : (i64) -> ()
      %1882 = func.call @stack_pop_pointer() : () -> i64
      %1883 = func.call @stack_pop_pointer() : () -> i64
      %1884 = func.call @cc_cons(%1883, %1882) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1884) : (i64) -> ()
      %1885 = func.call @stack_pop_pointer() : () -> i64
      %1886 = func.call @stack_pop_pointer() : () -> i64
      %1887 = func.call @cc_cons(%1886, %1885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1887) : (i64) -> ()
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
      %1903 = func.call @stack_pop_pointer() : () -> i64
      %1904 = func.call @stack_pop_pointer() : () -> i64
      %1905 = func.call @cc_cons(%1904, %1903) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1905) : (i64) -> ()
      %1906 = func.call @stack_pop_pointer() : () -> i64
      %1907 = func.call @stack_pop_pointer() : () -> i64
      %1908 = func.call @cc_cons(%1907, %1906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1908) : (i64) -> ()
      %1909 = func.call @stack_pop_pointer() : () -> i64
      %1910 = func.call @stack_pop_pointer() : () -> i64
      %1911 = func.call @cc_cons(%1910, %1909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1911) : (i64) -> ()
      %1912 = func.call @stack_pop_pointer() : () -> i64
      %1913 = func.call @stack_pop_pointer() : () -> i64
      %1914 = func.call @cc_cons(%1913, %1912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1914) : (i64) -> ()
      %1915 = func.call @stack_pop_pointer() : () -> i64
      %1916 = func.call @stack_pop_pointer() : () -> i64
      %1917 = func.call @cc_cons(%1916, %1915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1917) : (i64) -> ()
      %1918 = func.call @stack_pop_pointer() : () -> i64
      %1919 = func.call @stack_pop_pointer() : () -> i64
      %1920 = func.call @cc_cons(%1919, %1918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1920) : (i64) -> ()
      %1921 = func.call @stack_pop_pointer() : () -> i64
      %1922 = func.call @stack_pop_pointer() : () -> i64
      %1923 = func.call @cc_cons(%1922, %1921) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1923) : (i64) -> ()
      %1924 = func.call @stack_pop_pointer() : () -> i64
      %1925 = func.call @stack_pop_pointer() : () -> i64
      %1926 = func.call @cc_cons(%1925, %1924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1926) : (i64) -> ()
      %1927 = func.call @stack_pop_pointer() : () -> i64
      %1928 = func.call @stack_pop_pointer() : () -> i64
      %1929 = func.call @cc_cons(%1928, %1927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1929) : (i64) -> ()
      %1930 = func.call @stack_pop_pointer() : () -> i64
      %1931 = func.call @stack_pop_pointer() : () -> i64
      %1932 = func.call @cc_cons(%1931, %1930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1932) : (i64) -> ()
      %1933 = func.call @stack_pop_pointer() : () -> i64
      %1934 = func.call @stack_pop_pointer() : () -> i64
      %1935 = func.call @cc_cons(%1934, %1933) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1935) : (i64) -> ()
      %1936 = func.call @stack_pop_pointer() : () -> i64
      %1937 = func.call @stack_pop_pointer() : () -> i64
      %1938 = func.call @cc_cons(%1937, %1936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1938) : (i64) -> ()
      %1939 = func.call @stack_pop_pointer() : () -> i64
      %1940 = func.call @stack_pop_pointer() : () -> i64
      %1941 = func.call @cc_cons(%1940, %1939) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1941) : (i64) -> ()
      %1942 = func.call @stack_pop_pointer() : () -> i64
      %1943 = func.call @stack_pop_pointer() : () -> i64
      %1944 = func.call @cc_cons(%1943, %1942) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1944) : (i64) -> ()
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = func.call @cc_nil_value() : () -> i64
      %1947 = func.call @cc_nil_value() : () -> i64
      %1948 = func.call @cc_errorp(%1946) : (i64) -> i64
      %1949 = arith.cmpi ne, %1948, %1947 : i64
      %1950 = scf.if %1949 -> (i64) {
        scf.yield %1946 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %1951 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1945) : (i64) -> ()
        %1952 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1953 = func.call @stack_pop_pointer() : () -> i64
        %1954 = func.call @cc_nil_value() : () -> i64
        %1955 = func.call @cc_nil_value() : () -> i64
        %1956 = func.call @cc_errorp(%1954) : (i64) -> i64
        %1957 = arith.cmpi ne, %1956, %1955 : i64
        %1958 = scf.if %1957 -> (i64) {
          scf.yield %1954 : i64
        } else {
          %1959 = func.call @cc_nil_value() : () -> i64
          %1960 = llvm.mlir.addressof @str279 : !llvm.ptr
          %1961 = arith.constant 38 : i64
          %1962 = func.call @cc_make_string(%1960, %1961) : (!llvm.ptr, i64) -> i64
          %1963 = func.call @cc_nil_value() : () -> i64
          %1964 = func.call @cc_intern(%1962, %1963) : (i64, i64) -> i64
          %1965 = func.call @cc_nil_value() : () -> i64
          %1966 = func.call @cc_cons(%1964, %1965) : (i64, i64) -> i64
          %1967 = func.call @cc_values_pack(%1966) : (i64) -> i64
          %1968 = func.call @cc_set_symbol_value(%1964, %1959) : (i64, i64) -> i64
          %1969 = llvm.mlir.addressof @str280 : !llvm.ptr
          %1970 = arith.constant 39 : i64
          %1971 = func.call @cc_make_string(%1969, %1970) : (!llvm.ptr, i64) -> i64
          %1972 = func.call @cc_nil_value() : () -> i64
          %1973 = func.call @cc_intern(%1971, %1972) : (i64, i64) -> i64
          %1974 = func.call @cc_nil_value() : () -> i64
          %1975 = func.call @cc_cons(%1973, %1974) : (i64, i64) -> i64
          %1976 = func.call @cc_values_pack(%1975) : (i64) -> i64
          %1977 = func.call @cc_set_symbol_value(%1973, %1959) : (i64, i64) -> i64
          %1978 = llvm.mlir.addressof @str281 : !llvm.ptr
          %1979 = arith.constant 40 : i64
          %1980 = func.call @cc_make_string(%1978, %1979) : (!llvm.ptr, i64) -> i64
          %1981 = func.call @cc_nil_value() : () -> i64
          %1982 = func.call @cc_intern(%1980, %1981) : (i64, i64) -> i64
          %1983 = func.call @cc_nil_value() : () -> i64
          %1984 = func.call @cc_cons(%1982, %1983) : (i64, i64) -> i64
          %1985 = func.call @cc_values_pack(%1984) : (i64) -> i64
          %1986 = func.call @cc_set_symbol_value(%1982, %1959) : (i64, i64) -> i64
          %1987:3 = scf.while (%arg0 = %1951, %arg1 = %1953, %arg2 = %1952) : (i64, i64, i64) -> (i64, i64, i64) {
            func.call @stack_push_pointer(%arg2) : (i64) -> ()
            %1988 = func.call @stack_pop_pointer() : () -> i64
            %1989 = func.call @cc_nil_value() : () -> i64
            %1990 = arith.cmpi ne, %1988, %1989 : i64
            %1991 = func.call @cc_nil_value() : () -> i64
            %1992 = llvm.mlir.addressof @str282 : !llvm.ptr
            %1993 = arith.constant 38 : i64
            %1994 = func.call @cc_make_string(%1992, %1993) : (!llvm.ptr, i64) -> i64
            %1995 = func.call @cc_nil_value() : () -> i64
            %1996 = func.call @cc_intern(%1994, %1995) : (i64, i64) -> i64
            %1997 = func.call @cc_nil_value() : () -> i64
            %1998 = func.call @cc_cons(%1996, %1997) : (i64, i64) -> i64
            %1999 = func.call @cc_values_pack(%1998) : (i64) -> i64
            %2000 = func.call @cc_symbol_value(%1996) : (i64) -> i64
            %2001 = arith.cmpi ne, %2000, %1991 : i64
            %2002 = llvm.mlir.addressof @str283 : !llvm.ptr
            %2003 = arith.constant 38 : i64
            %2004 = func.call @cc_make_string(%2002, %2003) : (!llvm.ptr, i64) -> i64
            %2005 = func.call @cc_nil_value() : () -> i64
            %2006 = func.call @cc_intern(%2004, %2005) : (i64, i64) -> i64
            %2007 = func.call @cc_nil_value() : () -> i64
            %2008 = func.call @cc_cons(%2006, %2007) : (i64, i64) -> i64
            %2009 = func.call @cc_values_pack(%2008) : (i64) -> i64
            %2010 = func.call @cc_symbol_value(%2006) : (i64) -> i64
            %2011 = arith.cmpi ne, %2010, %1991 : i64
            %2012 = arith.ori %2001, %2011 : i1
            %2013 = arith.constant 0 : i1
            %2014 = arith.cmpi eq, %2012, %2013 : i1
            %2015 = arith.andi %1990, %2014 : i1
            scf.condition(%2015) %arg0, %arg1, %arg2 : i64, i64, i64
          } do {
            ^bb0(%2016: i64, %2017: i64, %2018: i64):
            %2019 = func.call @cc_nil_value() : () -> i64
            %2020 = func.call @cc_nil_value() : () -> i64
            %2021 = func.call @cc_errorp(%2019) : (i64) -> i64
            %2022 = arith.cmpi ne, %2021, %2020 : i64
            %2023:3 = scf.if %2022 -> (i64, i64, i64) {
              scf.yield %2019, %2017, %2016 : i64, i64, i64
            } else {
              %2024 = func.call @cc_nil_value() : () -> i64
              func.call @stack_push_pointer(%2018) : (i64) -> ()
              %2025 = func.call @stack_pop_pointer() : () -> i64
              %2026 = func.call @cc_nil_value() : () -> i64
              %2027 = arith.cmpi eq, %2025, %2026 : i64
              %2029 = func.call @cc_t_value() : () -> i64
              %2028 = arith.select %2027, %2029, %2026 : i64
              func.call @stack_push_pointer(%2028) : (i64) -> ()
              %2030 = func.call @stack_pop_pointer() : () -> i64
              %2031 = func.call @cc_nil_value() : () -> i64
              %2032 = func.call @cc_cons(%2030, %2031) : (i64, i64) -> i64
              %2033 = func.call @cc_not(%2032) : (i64) -> i64
              func.call @stack_push_pointer(%2033) : (i64) -> ()
              %2034 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2018) : (i64) -> ()
              %2035 = func.call @stack_pop_pointer() : () -> i64
              %2036 = func.call @cc_is_cons(%2035) : (i64) -> i32
              %2037 = arith.constant 0 : i32
              %2038 = arith.cmpi ne, %2036, %2037 : i32
              %2039 = func.call @cc_t_value() : () -> i64
              %2040 = func.call @cc_nil_value() : () -> i64
              %2041 = arith.select %2038, %2039, %2040 : i64
              func.call @stack_push_pointer(%2041) : (i64) -> ()
              %2042 = func.call @stack_pop_pointer() : () -> i64
              %2043 = func.call @cc_nil_value() : () -> i64
              %2044 = func.call @cc_cons(%2042, %2043) : (i64, i64) -> i64
              %2045 = func.call @cc_not(%2044) : (i64) -> i64
              func.call @stack_push_pointer(%2045) : (i64) -> ()
              %2046 = func.call @stack_pop_pointer() : () -> i64
              %2047 = func.call @cc_cons(%2046, %2024) : (i64, i64) -> i64
              %2048 = func.call @cc_cons(%2034, %2047) : (i64, i64) -> i64
              %2049 = func.call @cc_and(%2048) : (i64) -> i64
              func.call @stack_push_pointer(%2049) : (i64) -> ()
              %2050 = func.call @stack_pop_pointer() : () -> i64
              %2051 = func.call @cc_nil_value() : () -> i64
              %2052 = arith.cmpi ne, %2050, %2051 : i64
              scf.if %2052 {
                %2053 = llvm.mlir.addressof @str284 : !llvm.ptr
                %2054 = arith.constant 10 : i64
                %2055 = func.call @cc_make_string(%2053, %2054) : (!llvm.ptr, i64) -> i64
                %2056 = func.call @cc_nil_value() : () -> i64
                %2057 = func.call @cc_intern(%2055, %2056) : (i64, i64) -> i64
                %2058 = func.call @cc_nil_value() : () -> i64
                %2059 = func.call @cc_cons(%2057, %2058) : (i64, i64) -> i64
                %2060 = func.call @cc_values_pack(%2059) : (i64) -> i64
                func.call @stack_push_pointer(%2057) : (i64) -> ()
                %2061 = func.call @stack_pop_pointer() : () -> i64
                %2062 = func.call @cc_nil_value() : () -> i64
                %2063 = func.call @cc_errorp(%2061) : (i64) -> i64
                %2064 = arith.cmpi ne, %2063, %2062 : i64
                %2065 = arith.cmpi eq, %2062, %2062 : i64
                %2066 = arith.andi %2064, %2065 : i1
                %2067 = scf.if %2066 -> (i64) {
                  scf.yield %2061 : i64
                } else {
                  scf.yield %2062 : i64
                }
                %2068 = arith.cmpi ne, %2067, %2062 : i64
                scf.if %2068 {
                  func.call @stack_push_pointer(%2067) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%2061) : (i64) -> ()
                  %2069 = llvm.mlir.addressof @str285 : !llvm.ptr
                  %2070 = func.call @cc_make_function_ref_const(%2069) : (!llvm.ptr) -> i64
                  %2071 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%2070, %2071) : (i64, i64) -> ()
                }
                %2072 = func.call @stack_pop_pointer() : () -> i64
                %2073 = func.call @cc_multiple_value_list(%2072) : (i64) -> i64
                %2074 = func.call @cc_t_value() : () -> i64
                %2075 = llvm.mlir.addressof @str286 : !llvm.ptr
                %2076 = arith.constant 38 : i64
                %2077 = func.call @cc_make_string(%2075, %2076) : (!llvm.ptr, i64) -> i64
                %2078 = func.call @cc_nil_value() : () -> i64
                %2079 = func.call @cc_intern(%2077, %2078) : (i64, i64) -> i64
                %2080 = func.call @cc_nil_value() : () -> i64
                %2081 = func.call @cc_cons(%2079, %2080) : (i64, i64) -> i64
                %2082 = func.call @cc_values_pack(%2081) : (i64) -> i64
                %2083 = func.call @cc_set_symbol_value(%2079, %2074) : (i64, i64) -> i64
                %2084 = llvm.mlir.addressof @str287 : !llvm.ptr
                %2085 = arith.constant 39 : i64
                %2086 = func.call @cc_make_string(%2084, %2085) : (!llvm.ptr, i64) -> i64
                %2087 = func.call @cc_nil_value() : () -> i64
                %2088 = func.call @cc_intern(%2086, %2087) : (i64, i64) -> i64
                %2089 = func.call @cc_nil_value() : () -> i64
                %2090 = func.call @cc_cons(%2088, %2089) : (i64, i64) -> i64
                %2091 = func.call @cc_values_pack(%2090) : (i64) -> i64
                %2092 = func.call @cc_set_symbol_value(%2088, %2072) : (i64, i64) -> i64
                %2093 = llvm.mlir.addressof @str288 : !llvm.ptr
                %2094 = arith.constant 40 : i64
                %2095 = func.call @cc_make_string(%2093, %2094) : (!llvm.ptr, i64) -> i64
                %2096 = func.call @cc_nil_value() : () -> i64
                %2097 = func.call @cc_intern(%2095, %2096) : (i64, i64) -> i64
                %2098 = func.call @cc_nil_value() : () -> i64
                %2099 = func.call @cc_cons(%2097, %2098) : (i64, i64) -> i64
                %2100 = func.call @cc_values_pack(%2099) : (i64) -> i64
                %2101 = func.call @cc_set_symbol_value(%2097, %2073) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2072) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %2102 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2102, %2017, %2016 : i64, i64, i64
            }
            %2103 = func.call @cc_nil_value() : () -> i64
            %2104 = func.call @cc_errorp(%2023#0) : (i64) -> i64
            %2105 = arith.cmpi ne, %2104, %2103 : i64
            %2106:3 = scf.if %2105 -> (i64, i64, i64) {
              scf.yield %2023#0, %2023#1, %2023#2 : i64, i64, i64
            } else {
              func.call @stack_push_pointer(%2018) : (i64) -> ()
              %2107 = func.call @stack_pop_pointer() : () -> i64
              %2108 = func.call @cc_car(%2107) : (i64) -> i64
              func.call @stack_push_pointer(%2108) : (i64) -> ()
              %2109 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2109) : (i64) -> ()
              %2110 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2110, %2023#1, %2109 : i64, i64, i64
            }
            %2111 = func.call @cc_nil_value() : () -> i64
            %2112 = func.call @cc_errorp(%2106#0) : (i64) -> i64
            %2113 = arith.cmpi ne, %2112, %2111 : i64
            %2114:3 = scf.if %2113 -> (i64, i64, i64) {
              scf.yield %2106#0, %2106#1, %2106#2 : i64, i64, i64
            } else {
              %2115 = func.call @cc_nil_value() : () -> i64
              func.call @stack_push_pointer(%2106#2) : (i64) -> ()
              %2116 = func.call @stack_pop_pointer() : () -> i64
              %2117 = func.call @cc_fboundp(%2116) : (i64) -> i64
              func.call @stack_push_pointer(%2117) : (i64) -> ()
              %2118 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2106#2) : (i64) -> ()
              %2119 = func.call @stack_pop_pointer() : () -> i64
              %2120 = func.call @cc_fdefinition(%2119) : (i64) -> i64
              func.call @stack_push_pointer(%2120) : (i64) -> ()
              %2121 = llvm.mlir.addressof @str289 : !llvm.ptr
              %2122 = arith.constant 16 : i64
              %2123 = func.call @cc_make_string(%2121, %2122) : (!llvm.ptr, i64) -> i64
              %2124 = llvm.mlir.addressof @str290 : !llvm.ptr
              %2125 = arith.constant 11 : i64
              %2126 = func.call @cc_make_string(%2124, %2125) : (!llvm.ptr, i64) -> i64
              %2127 = func.call @cc_intern(%2123, %2126) : (i64, i64) -> i64
              %2128 = func.call @cc_nil_value() : () -> i64
              %2129 = func.call @cc_cons(%2127, %2128) : (i64, i64) -> i64
              %2130 = func.call @cc_values_pack(%2129) : (i64) -> i64
              func.call @stack_push_pointer(%2127) : (i64) -> ()
              %2131 = func.call @stack_pop_pointer() : () -> i64
              %2132 = func.call @stack_pop_pointer() : () -> i64
              %2133 = func.call @cc_typep(%2132, %2131) : (i64, i64) -> i64
              func.call @stack_push_pointer(%2133) : (i64) -> ()
              %2134 = func.call @stack_pop_pointer() : () -> i64
              %2135 = func.call @cc_cons(%2134, %2115) : (i64, i64) -> i64
              %2136 = func.call @cc_cons(%2118, %2135) : (i64, i64) -> i64
              %2137 = func.call @cc_and(%2136) : (i64) -> i64
              func.call @stack_push_pointer(%2137) : (i64) -> ()
              %2138 = func.call @stack_pop_pointer() : () -> i64
              %2139 = func.call @cc_nil_value() : () -> i64
              %2140 = func.call @cc_cons(%2138, %2139) : (i64, i64) -> i64
              %2141 = func.call @cc_not(%2140) : (i64) -> i64
              func.call @stack_push_pointer(%2141) : (i64) -> ()
              %2142 = func.call @stack_pop_pointer() : () -> i64
              %2143 = func.call @cc_nil_value() : () -> i64
              %2144 = arith.cmpi ne, %2142, %2143 : i64
              %2145:2 = scf.if %2144 -> (i64, i64) {
                %2146 = func.call @cc_nil_value() : () -> i64
                %2147 = func.call @cc_nil_value() : () -> i64
                %2148 = func.call @cc_errorp(%2146) : (i64) -> i64
                %2149 = arith.cmpi ne, %2148, %2147 : i64
                %2150:2 = scf.if %2149 -> (i64, i64) {
                  scf.yield %2146, %2106#1 : i64, i64
                } else {
                  func.call @stack_push_pointer(%2106#1) : (i64) -> ()
                  func.call @stack_push_pointer(%2106#2) : (i64) -> ()
                  %2151 = func.call @stack_pop_pointer() : () -> i64
                  %2152 = func.call @cc_nil_value() : () -> i64
                  %2153 = func.call @cc_errorp(%2151) : (i64) -> i64
                  %2154 = arith.cmpi ne, %2153, %2152 : i64
                  %2155 = arith.cmpi eq, %2152, %2152 : i64
                  %2156 = arith.andi %2154, %2155 : i1
                  %2157 = scf.if %2156 -> (i64) {
                    scf.yield %2151 : i64
                  } else {
                    scf.yield %2152 : i64
                  }
                  %2158 = arith.cmpi ne, %2157, %2152 : i64
                  scf.if %2158 {
                    func.call @stack_push_pointer(%2157) : (i64) -> ()
                  } else {
                    %2159 = func.call @cc_nil_value() : () -> i64
                    func.call @stack_push_pointer(%2159) : (i64) -> ()
                    func.call @stack_push_pointer(%2151) : (i64) -> ()
                    %2160 = func.call @stack_pop_pointer() : () -> i64
                    %2161 = func.call @stack_pop_pointer() : () -> i64
                    %2162 = func.call @cc_cons(%2160, %2161) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%2162) : (i64) -> ()
                  }
                  %2163 = func.call @stack_pop_pointer() : () -> i64
                  %2164 = func.call @stack_pop_pointer() : () -> i64
                  %2165 = func.call @cc_append(%2164, %2163) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%2165) : (i64) -> ()
                  %2166 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%2166) : (i64) -> ()
                  %2167 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %2167, %2166 : i64, i64
                }
                func.call @stack_push_pointer(%2150#0) : (i64) -> ()
                %2168 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2168, %2150#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %2169 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2169, %2106#1 : i64, i64
              }
              func.call @stack_push_pointer(%2145#0) : (i64) -> ()
              %2170 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2170, %2145#1, %2106#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%2114#0) : (i64) -> ()
            %2171 = func.call @stack_depth() : () -> i64
            %2172 = arith.constant 0 : i64
            %2173 = arith.cmpi sgt, %2171, %2172 : i64
            scf.if %2173 {
              %2174 = func.call @stack_pop_pointer() : () -> i64
            }
            func.call @stack_push_pointer(%2018) : (i64) -> ()
            %2175 = func.call @stack_pop_pointer() : () -> i64
            %2176 = func.call @cc_cdr(%2175) : (i64) -> i64
            func.call @stack_push_pointer(%2176) : (i64) -> ()
            %2177 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2177) : (i64) -> ()
            %2178 = func.call @stack_depth() : () -> i64
            %2179 = arith.constant 0 : i64
            %2180 = arith.cmpi sgt, %2178, %2179 : i64
            scf.if %2180 {
              %2181 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %2114#2, %2114#1, %2177 : i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %2182 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1987#1) : (i64) -> ()
          %2183 = func.call @stack_pop_pointer() : () -> i64
          %2184 = func.call @cc_multiple_value_list(%2183) : (i64) -> i64
          %2185 = llvm.mlir.addressof @str291 : !llvm.ptr
          %2186 = arith.constant 38 : i64
          %2187 = func.call @cc_make_string(%2185, %2186) : (!llvm.ptr, i64) -> i64
          %2188 = func.call @cc_nil_value() : () -> i64
          %2189 = func.call @cc_intern(%2187, %2188) : (i64, i64) -> i64
          %2190 = func.call @cc_nil_value() : () -> i64
          %2191 = func.call @cc_cons(%2189, %2190) : (i64, i64) -> i64
          %2192 = func.call @cc_values_pack(%2191) : (i64) -> i64
          %2193 = func.call @cc_symbol_value(%2189) : (i64) -> i64
          %2194 = llvm.mlir.addressof @str292 : !llvm.ptr
          %2195 = arith.constant 39 : i64
          %2196 = func.call @cc_make_string(%2194, %2195) : (!llvm.ptr, i64) -> i64
          %2197 = func.call @cc_nil_value() : () -> i64
          %2198 = func.call @cc_intern(%2196, %2197) : (i64, i64) -> i64
          %2199 = func.call @cc_nil_value() : () -> i64
          %2200 = func.call @cc_cons(%2198, %2199) : (i64, i64) -> i64
          %2201 = func.call @cc_values_pack(%2200) : (i64) -> i64
          %2202 = func.call @cc_symbol_value(%2198) : (i64) -> i64
          %2203 = llvm.mlir.addressof @str293 : !llvm.ptr
          %2204 = arith.constant 40 : i64
          %2205 = func.call @cc_make_string(%2203, %2204) : (!llvm.ptr, i64) -> i64
          %2206 = func.call @cc_nil_value() : () -> i64
          %2207 = func.call @cc_intern(%2205, %2206) : (i64, i64) -> i64
          %2208 = func.call @cc_nil_value() : () -> i64
          %2209 = func.call @cc_cons(%2207, %2208) : (i64, i64) -> i64
          %2210 = func.call @cc_values_pack(%2209) : (i64) -> i64
          %2211 = func.call @cc_symbol_value(%2207) : (i64) -> i64
          %2212 = func.call @cc_nil_value() : () -> i64
          %2213 = arith.cmpi ne, %2193, %2212 : i64
          %2214 = scf.if %2213 -> (i64) {
            scf.yield %2211 : i64
          } else {
            scf.yield %2184 : i64
          }
          %2215 = func.call @cc_values_pack(%2214) : (i64) -> i64
          func.call @stack_push_pointer(%2215) : (i64) -> ()
          %2216 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2216 : i64
        }
        func.call @stack_push_pointer(%1958) : (i64) -> ()
        %2217 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2217 : i64
      }
      func.call @stack_push_pointer(%1950) : (i64) -> ()
      %2218 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2218 : i64
    }
    func.call @stack_push_pointer(%1132) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_120590987952131"() {
    %2522 = func.call @cc_nil_value() : () -> i64
    %2523 = func.call @cc_nil_value() : () -> i64
    %2524 = func.call @cc_errorp(%2522) : (i64) -> i64
    %2525 = arith.cmpi ne, %2524, %2523 : i64
    %2526 = scf.if %2525 -> (i64) {
      scf.yield %2522 : i64
    } else {
      %2527 = llvm.mlir.addressof @str322 : !llvm.ptr
      %2528 = arith.constant 22 : i64
      %2529 = func.call @cc_make_string(%2527, %2528) : (!llvm.ptr, i64) -> i64
      %2530 = llvm.mlir.addressof @str323 : !llvm.ptr
      %2531 = arith.constant 4 : i64
      %2532 = func.call @cc_make_string(%2530, %2531) : (!llvm.ptr, i64) -> i64
      %2533 = func.call @cc_intern(%2529, %2532) : (i64, i64) -> i64
      %2534 = func.call @cc_nil_value() : () -> i64
      %2535 = func.call @cc_cons(%2533, %2534) : (i64, i64) -> i64
      %2536 = func.call @cc_values_pack(%2535) : (i64) -> i64
      func.call @stack_push_pointer(%2533) : (i64) -> ()
      %2537 = llvm.mlir.addressof @str324 : !llvm.ptr
      %2538 = arith.constant 19 : i64
      %2539 = func.call @cc_make_string(%2537, %2538) : (!llvm.ptr, i64) -> i64
      %2540 = llvm.mlir.addressof @str325 : !llvm.ptr
      %2541 = arith.constant 4 : i64
      %2542 = func.call @cc_make_string(%2540, %2541) : (!llvm.ptr, i64) -> i64
      %2543 = func.call @cc_intern(%2539, %2542) : (i64, i64) -> i64
      %2544 = func.call @cc_nil_value() : () -> i64
      %2545 = func.call @cc_cons(%2543, %2544) : (i64, i64) -> i64
      %2546 = func.call @cc_values_pack(%2545) : (i64) -> i64
      func.call @stack_push_pointer(%2543) : (i64) -> ()
      %2547 = llvm.mlir.addressof @str326 : !llvm.ptr
      %2548 = arith.constant 25 : i64
      %2549 = func.call @cc_make_string(%2547, %2548) : (!llvm.ptr, i64) -> i64
      %2550 = llvm.mlir.addressof @str327 : !llvm.ptr
      %2551 = arith.constant 4 : i64
      %2552 = func.call @cc_make_string(%2550, %2551) : (!llvm.ptr, i64) -> i64
      %2553 = func.call @cc_intern(%2549, %2552) : (i64, i64) -> i64
      %2554 = func.call @cc_nil_value() : () -> i64
      %2555 = func.call @cc_cons(%2553, %2554) : (i64, i64) -> i64
      %2556 = func.call @cc_values_pack(%2555) : (i64) -> i64
      func.call @stack_push_pointer(%2553) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2557 = func.call @stack_pop_pointer() : () -> i64
      %2558 = func.call @stack_pop_pointer() : () -> i64
      %2559 = func.call @cc_cons(%2558, %2557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2559) : (i64) -> ()
      %2560 = func.call @stack_pop_pointer() : () -> i64
      %2561 = func.call @stack_pop_pointer() : () -> i64
      %2562 = func.call @cc_cons(%2561, %2560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2562) : (i64) -> ()
      %2563 = func.call @stack_pop_pointer() : () -> i64
      %2564 = func.call @stack_pop_pointer() : () -> i64
      %2565 = func.call @cc_cons(%2564, %2563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2565) : (i64) -> ()
      %2566 = func.call @stack_pop_pointer() : () -> i64
      %2567 = func.call @cc_nil_value() : () -> i64
      %2568 = func.call @cc_nil_value() : () -> i64
      %2569 = func.call @cc_errorp(%2567) : (i64) -> i64
      %2570 = arith.cmpi ne, %2569, %2568 : i64
      %2571 = scf.if %2570 -> (i64) {
        scf.yield %2567 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %2572 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2566) : (i64) -> ()
        %2573 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2574 = func.call @stack_pop_pointer() : () -> i64
        %2575 = func.call @cc_nil_value() : () -> i64
        %2576 = func.call @cc_nil_value() : () -> i64
        %2577 = func.call @cc_errorp(%2575) : (i64) -> i64
        %2578 = arith.cmpi ne, %2577, %2576 : i64
        %2579 = scf.if %2578 -> (i64) {
          scf.yield %2575 : i64
        } else {
          %2580 = func.call @cc_nil_value() : () -> i64
          %2581 = llvm.mlir.addressof @str328 : !llvm.ptr
          %2582 = arith.constant 38 : i64
          %2583 = func.call @cc_make_string(%2581, %2582) : (!llvm.ptr, i64) -> i64
          %2584 = func.call @cc_nil_value() : () -> i64
          %2585 = func.call @cc_intern(%2583, %2584) : (i64, i64) -> i64
          %2586 = func.call @cc_nil_value() : () -> i64
          %2587 = func.call @cc_cons(%2585, %2586) : (i64, i64) -> i64
          %2588 = func.call @cc_values_pack(%2587) : (i64) -> i64
          %2589 = func.call @cc_set_symbol_value(%2585, %2580) : (i64, i64) -> i64
          %2590 = llvm.mlir.addressof @str329 : !llvm.ptr
          %2591 = arith.constant 39 : i64
          %2592 = func.call @cc_make_string(%2590, %2591) : (!llvm.ptr, i64) -> i64
          %2593 = func.call @cc_nil_value() : () -> i64
          %2594 = func.call @cc_intern(%2592, %2593) : (i64, i64) -> i64
          %2595 = func.call @cc_nil_value() : () -> i64
          %2596 = func.call @cc_cons(%2594, %2595) : (i64, i64) -> i64
          %2597 = func.call @cc_values_pack(%2596) : (i64) -> i64
          %2598 = func.call @cc_set_symbol_value(%2594, %2580) : (i64, i64) -> i64
          %2599 = llvm.mlir.addressof @str330 : !llvm.ptr
          %2600 = arith.constant 40 : i64
          %2601 = func.call @cc_make_string(%2599, %2600) : (!llvm.ptr, i64) -> i64
          %2602 = func.call @cc_nil_value() : () -> i64
          %2603 = func.call @cc_intern(%2601, %2602) : (i64, i64) -> i64
          %2604 = func.call @cc_nil_value() : () -> i64
          %2605 = func.call @cc_cons(%2603, %2604) : (i64, i64) -> i64
          %2606 = func.call @cc_values_pack(%2605) : (i64) -> i64
          %2607 = func.call @cc_set_symbol_value(%2603, %2580) : (i64, i64) -> i64
          %2608:3 = scf.while (%arg0 = %2572, %arg1 = %2574, %arg2 = %2573) : (i64, i64, i64) -> (i64, i64, i64) {
            func.call @stack_push_pointer(%arg2) : (i64) -> ()
            %2609 = func.call @stack_pop_pointer() : () -> i64
            %2610 = func.call @cc_nil_value() : () -> i64
            %2611 = arith.cmpi ne, %2609, %2610 : i64
            %2612 = func.call @cc_nil_value() : () -> i64
            %2613 = llvm.mlir.addressof @str331 : !llvm.ptr
            %2614 = arith.constant 38 : i64
            %2615 = func.call @cc_make_string(%2613, %2614) : (!llvm.ptr, i64) -> i64
            %2616 = func.call @cc_nil_value() : () -> i64
            %2617 = func.call @cc_intern(%2615, %2616) : (i64, i64) -> i64
            %2618 = func.call @cc_nil_value() : () -> i64
            %2619 = func.call @cc_cons(%2617, %2618) : (i64, i64) -> i64
            %2620 = func.call @cc_values_pack(%2619) : (i64) -> i64
            %2621 = func.call @cc_symbol_value(%2617) : (i64) -> i64
            %2622 = arith.cmpi ne, %2621, %2612 : i64
            %2623 = llvm.mlir.addressof @str332 : !llvm.ptr
            %2624 = arith.constant 38 : i64
            %2625 = func.call @cc_make_string(%2623, %2624) : (!llvm.ptr, i64) -> i64
            %2626 = func.call @cc_nil_value() : () -> i64
            %2627 = func.call @cc_intern(%2625, %2626) : (i64, i64) -> i64
            %2628 = func.call @cc_nil_value() : () -> i64
            %2629 = func.call @cc_cons(%2627, %2628) : (i64, i64) -> i64
            %2630 = func.call @cc_values_pack(%2629) : (i64) -> i64
            %2631 = func.call @cc_symbol_value(%2627) : (i64) -> i64
            %2632 = arith.cmpi ne, %2631, %2612 : i64
            %2633 = arith.ori %2622, %2632 : i1
            %2634 = arith.constant 0 : i1
            %2635 = arith.cmpi eq, %2633, %2634 : i1
            %2636 = arith.andi %2611, %2635 : i1
            scf.condition(%2636) %arg0, %arg1, %arg2 : i64, i64, i64
          } do {
            ^bb0(%2637: i64, %2638: i64, %2639: i64):
            %2640 = func.call @cc_nil_value() : () -> i64
            %2641 = func.call @cc_nil_value() : () -> i64
            %2642 = func.call @cc_errorp(%2640) : (i64) -> i64
            %2643 = arith.cmpi ne, %2642, %2641 : i64
            %2644:3 = scf.if %2643 -> (i64, i64, i64) {
              scf.yield %2640, %2638, %2637 : i64, i64, i64
            } else {
              %2645 = func.call @cc_nil_value() : () -> i64
              func.call @stack_push_pointer(%2639) : (i64) -> ()
              %2646 = func.call @stack_pop_pointer() : () -> i64
              %2647 = func.call @cc_nil_value() : () -> i64
              %2648 = arith.cmpi eq, %2646, %2647 : i64
              %2650 = func.call @cc_t_value() : () -> i64
              %2649 = arith.select %2648, %2650, %2647 : i64
              func.call @stack_push_pointer(%2649) : (i64) -> ()
              %2651 = func.call @stack_pop_pointer() : () -> i64
              %2652 = func.call @cc_nil_value() : () -> i64
              %2653 = func.call @cc_cons(%2651, %2652) : (i64, i64) -> i64
              %2654 = func.call @cc_not(%2653) : (i64) -> i64
              func.call @stack_push_pointer(%2654) : (i64) -> ()
              %2655 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2639) : (i64) -> ()
              %2656 = func.call @stack_pop_pointer() : () -> i64
              %2657 = func.call @cc_is_cons(%2656) : (i64) -> i32
              %2658 = arith.constant 0 : i32
              %2659 = arith.cmpi ne, %2657, %2658 : i32
              %2660 = func.call @cc_t_value() : () -> i64
              %2661 = func.call @cc_nil_value() : () -> i64
              %2662 = arith.select %2659, %2660, %2661 : i64
              func.call @stack_push_pointer(%2662) : (i64) -> ()
              %2663 = func.call @stack_pop_pointer() : () -> i64
              %2664 = func.call @cc_nil_value() : () -> i64
              %2665 = func.call @cc_cons(%2663, %2664) : (i64, i64) -> i64
              %2666 = func.call @cc_not(%2665) : (i64) -> i64
              func.call @stack_push_pointer(%2666) : (i64) -> ()
              %2667 = func.call @stack_pop_pointer() : () -> i64
              %2668 = func.call @cc_cons(%2667, %2645) : (i64, i64) -> i64
              %2669 = func.call @cc_cons(%2655, %2668) : (i64, i64) -> i64
              %2670 = func.call @cc_and(%2669) : (i64) -> i64
              func.call @stack_push_pointer(%2670) : (i64) -> ()
              %2671 = func.call @stack_pop_pointer() : () -> i64
              %2672 = func.call @cc_nil_value() : () -> i64
              %2673 = arith.cmpi ne, %2671, %2672 : i64
              scf.if %2673 {
                %2674 = llvm.mlir.addressof @str333 : !llvm.ptr
                %2675 = arith.constant 10 : i64
                %2676 = func.call @cc_make_string(%2674, %2675) : (!llvm.ptr, i64) -> i64
                %2677 = func.call @cc_nil_value() : () -> i64
                %2678 = func.call @cc_intern(%2676, %2677) : (i64, i64) -> i64
                %2679 = func.call @cc_nil_value() : () -> i64
                %2680 = func.call @cc_cons(%2678, %2679) : (i64, i64) -> i64
                %2681 = func.call @cc_values_pack(%2680) : (i64) -> i64
                func.call @stack_push_pointer(%2678) : (i64) -> ()
                %2682 = func.call @stack_pop_pointer() : () -> i64
                %2683 = func.call @cc_nil_value() : () -> i64
                %2684 = func.call @cc_errorp(%2682) : (i64) -> i64
                %2685 = arith.cmpi ne, %2684, %2683 : i64
                %2686 = arith.cmpi eq, %2683, %2683 : i64
                %2687 = arith.andi %2685, %2686 : i1
                %2688 = scf.if %2687 -> (i64) {
                  scf.yield %2682 : i64
                } else {
                  scf.yield %2683 : i64
                }
                %2689 = arith.cmpi ne, %2688, %2683 : i64
                scf.if %2689 {
                  func.call @stack_push_pointer(%2688) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%2682) : (i64) -> ()
                  %2690 = llvm.mlir.addressof @str334 : !llvm.ptr
                  %2691 = func.call @cc_make_function_ref_const(%2690) : (!llvm.ptr) -> i64
                  %2692 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%2691, %2692) : (i64, i64) -> ()
                }
                %2693 = func.call @stack_pop_pointer() : () -> i64
                %2694 = func.call @cc_multiple_value_list(%2693) : (i64) -> i64
                %2695 = func.call @cc_t_value() : () -> i64
                %2696 = llvm.mlir.addressof @str335 : !llvm.ptr
                %2697 = arith.constant 38 : i64
                %2698 = func.call @cc_make_string(%2696, %2697) : (!llvm.ptr, i64) -> i64
                %2699 = func.call @cc_nil_value() : () -> i64
                %2700 = func.call @cc_intern(%2698, %2699) : (i64, i64) -> i64
                %2701 = func.call @cc_nil_value() : () -> i64
                %2702 = func.call @cc_cons(%2700, %2701) : (i64, i64) -> i64
                %2703 = func.call @cc_values_pack(%2702) : (i64) -> i64
                %2704 = func.call @cc_set_symbol_value(%2700, %2695) : (i64, i64) -> i64
                %2705 = llvm.mlir.addressof @str336 : !llvm.ptr
                %2706 = arith.constant 39 : i64
                %2707 = func.call @cc_make_string(%2705, %2706) : (!llvm.ptr, i64) -> i64
                %2708 = func.call @cc_nil_value() : () -> i64
                %2709 = func.call @cc_intern(%2707, %2708) : (i64, i64) -> i64
                %2710 = func.call @cc_nil_value() : () -> i64
                %2711 = func.call @cc_cons(%2709, %2710) : (i64, i64) -> i64
                %2712 = func.call @cc_values_pack(%2711) : (i64) -> i64
                %2713 = func.call @cc_set_symbol_value(%2709, %2693) : (i64, i64) -> i64
                %2714 = llvm.mlir.addressof @str337 : !llvm.ptr
                %2715 = arith.constant 40 : i64
                %2716 = func.call @cc_make_string(%2714, %2715) : (!llvm.ptr, i64) -> i64
                %2717 = func.call @cc_nil_value() : () -> i64
                %2718 = func.call @cc_intern(%2716, %2717) : (i64, i64) -> i64
                %2719 = func.call @cc_nil_value() : () -> i64
                %2720 = func.call @cc_cons(%2718, %2719) : (i64, i64) -> i64
                %2721 = func.call @cc_values_pack(%2720) : (i64) -> i64
                %2722 = func.call @cc_set_symbol_value(%2718, %2694) : (i64, i64) -> i64
                func.call @stack_push_pointer(%2693) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %2723 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2723, %2638, %2637 : i64, i64, i64
            }
            %2724 = func.call @cc_nil_value() : () -> i64
            %2725 = func.call @cc_errorp(%2644#0) : (i64) -> i64
            %2726 = arith.cmpi ne, %2725, %2724 : i64
            %2727:3 = scf.if %2726 -> (i64, i64, i64) {
              scf.yield %2644#0, %2644#1, %2644#2 : i64, i64, i64
            } else {
              func.call @stack_push_pointer(%2639) : (i64) -> ()
              %2728 = func.call @stack_pop_pointer() : () -> i64
              %2729 = func.call @cc_car(%2728) : (i64) -> i64
              func.call @stack_push_pointer(%2729) : (i64) -> ()
              %2730 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%2730) : (i64) -> ()
              %2731 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2731, %2644#1, %2730 : i64, i64, i64
            }
            %2732 = func.call @cc_nil_value() : () -> i64
            %2733 = func.call @cc_errorp(%2727#0) : (i64) -> i64
            %2734 = arith.cmpi ne, %2733, %2732 : i64
            %2735:3 = scf.if %2734 -> (i64, i64, i64) {
              scf.yield %2727#0, %2727#1, %2727#2 : i64, i64, i64
            } else {
              func.call @stack_push_pointer(%2727#2) : (i64) -> ()
              %2736 = func.call @stack_pop_pointer() : () -> i64
              %2737 = func.call @cc_fboundp(%2736) : (i64) -> i64
              func.call @stack_push_pointer(%2737) : (i64) -> ()
              %2738 = func.call @stack_pop_pointer() : () -> i64
              %2739 = func.call @cc_nil_value() : () -> i64
              %2740 = func.call @cc_cons(%2738, %2739) : (i64, i64) -> i64
              %2741 = func.call @cc_not(%2740) : (i64) -> i64
              func.call @stack_push_pointer(%2741) : (i64) -> ()
              %2742 = func.call @stack_pop_pointer() : () -> i64
              %2743 = func.call @cc_nil_value() : () -> i64
              %2744 = arith.cmpi ne, %2742, %2743 : i64
              %2745:2 = scf.if %2744 -> (i64, i64) {
                %2746 = func.call @cc_nil_value() : () -> i64
                %2747 = func.call @cc_nil_value() : () -> i64
                %2748 = func.call @cc_errorp(%2746) : (i64) -> i64
                %2749 = arith.cmpi ne, %2748, %2747 : i64
                %2750:2 = scf.if %2749 -> (i64, i64) {
                  scf.yield %2746, %2727#1 : i64, i64
                } else {
                  func.call @stack_push_pointer(%2727#1) : (i64) -> ()
                  func.call @stack_push_pointer(%2727#2) : (i64) -> ()
                  %2751 = func.call @stack_pop_pointer() : () -> i64
                  %2752 = func.call @cc_nil_value() : () -> i64
                  %2753 = func.call @cc_errorp(%2751) : (i64) -> i64
                  %2754 = arith.cmpi ne, %2753, %2752 : i64
                  %2755 = arith.cmpi eq, %2752, %2752 : i64
                  %2756 = arith.andi %2754, %2755 : i1
                  %2757 = scf.if %2756 -> (i64) {
                    scf.yield %2751 : i64
                  } else {
                    scf.yield %2752 : i64
                  }
                  %2758 = arith.cmpi ne, %2757, %2752 : i64
                  scf.if %2758 {
                    func.call @stack_push_pointer(%2757) : (i64) -> ()
                  } else {
                    %2759 = func.call @cc_nil_value() : () -> i64
                    func.call @stack_push_pointer(%2759) : (i64) -> ()
                    func.call @stack_push_pointer(%2751) : (i64) -> ()
                    %2760 = func.call @stack_pop_pointer() : () -> i64
                    %2761 = func.call @stack_pop_pointer() : () -> i64
                    %2762 = func.call @cc_cons(%2760, %2761) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%2762) : (i64) -> ()
                  }
                  %2763 = func.call @stack_pop_pointer() : () -> i64
                  %2764 = func.call @stack_pop_pointer() : () -> i64
                  %2765 = func.call @cc_append(%2764, %2763) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%2765) : (i64) -> ()
                  %2766 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%2766) : (i64) -> ()
                  %2767 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %2767, %2766 : i64, i64
                }
                func.call @stack_push_pointer(%2750#0) : (i64) -> ()
                %2768 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2768, %2750#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %2769 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %2769, %2727#1 : i64, i64
              }
              func.call @stack_push_pointer(%2745#0) : (i64) -> ()
              %2770 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %2770, %2745#1, %2727#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%2735#0) : (i64) -> ()
            %2771 = func.call @stack_depth() : () -> i64
            %2772 = arith.constant 0 : i64
            %2773 = arith.cmpi sgt, %2771, %2772 : i64
            scf.if %2773 {
              %2774 = func.call @stack_pop_pointer() : () -> i64
            }
            func.call @stack_push_pointer(%2639) : (i64) -> ()
            %2775 = func.call @stack_pop_pointer() : () -> i64
            %2776 = func.call @cc_cdr(%2775) : (i64) -> i64
            func.call @stack_push_pointer(%2776) : (i64) -> ()
            %2777 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2777) : (i64) -> ()
            %2778 = func.call @stack_depth() : () -> i64
            %2779 = arith.constant 0 : i64
            %2780 = arith.cmpi sgt, %2778, %2779 : i64
            scf.if %2780 {
              %2781 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %2735#2, %2735#1, %2777 : i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %2782 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%2608#1) : (i64) -> ()
          %2783 = func.call @stack_pop_pointer() : () -> i64
          %2784 = func.call @cc_multiple_value_list(%2783) : (i64) -> i64
          %2785 = llvm.mlir.addressof @str338 : !llvm.ptr
          %2786 = arith.constant 38 : i64
          %2787 = func.call @cc_make_string(%2785, %2786) : (!llvm.ptr, i64) -> i64
          %2788 = func.call @cc_nil_value() : () -> i64
          %2789 = func.call @cc_intern(%2787, %2788) : (i64, i64) -> i64
          %2790 = func.call @cc_nil_value() : () -> i64
          %2791 = func.call @cc_cons(%2789, %2790) : (i64, i64) -> i64
          %2792 = func.call @cc_values_pack(%2791) : (i64) -> i64
          %2793 = func.call @cc_symbol_value(%2789) : (i64) -> i64
          %2794 = llvm.mlir.addressof @str339 : !llvm.ptr
          %2795 = arith.constant 39 : i64
          %2796 = func.call @cc_make_string(%2794, %2795) : (!llvm.ptr, i64) -> i64
          %2797 = func.call @cc_nil_value() : () -> i64
          %2798 = func.call @cc_intern(%2796, %2797) : (i64, i64) -> i64
          %2799 = func.call @cc_nil_value() : () -> i64
          %2800 = func.call @cc_cons(%2798, %2799) : (i64, i64) -> i64
          %2801 = func.call @cc_values_pack(%2800) : (i64) -> i64
          %2802 = func.call @cc_symbol_value(%2798) : (i64) -> i64
          %2803 = llvm.mlir.addressof @str340 : !llvm.ptr
          %2804 = arith.constant 40 : i64
          %2805 = func.call @cc_make_string(%2803, %2804) : (!llvm.ptr, i64) -> i64
          %2806 = func.call @cc_nil_value() : () -> i64
          %2807 = func.call @cc_intern(%2805, %2806) : (i64, i64) -> i64
          %2808 = func.call @cc_nil_value() : () -> i64
          %2809 = func.call @cc_cons(%2807, %2808) : (i64, i64) -> i64
          %2810 = func.call @cc_values_pack(%2809) : (i64) -> i64
          %2811 = func.call @cc_symbol_value(%2807) : (i64) -> i64
          %2812 = func.call @cc_nil_value() : () -> i64
          %2813 = arith.cmpi ne, %2793, %2812 : i64
          %2814 = scf.if %2813 -> (i64) {
            scf.yield %2811 : i64
          } else {
            scf.yield %2784 : i64
          }
          %2815 = func.call @cc_values_pack(%2814) : (i64) -> i64
          func.call @stack_push_pointer(%2815) : (i64) -> ()
          %2816 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2816 : i64
        }
        func.call @stack_push_pointer(%2579) : (i64) -> ()
        %2817 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2817 : i64
      }
      func.call @stack_push_pointer(%2571) : (i64) -> ()
      %2818 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2818 : i64
    }
    func.call @stack_push_pointer(%2526) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_120590987952133"() {
    %3890 = func.call @cc_nil_value() : () -> i64
    %3891 = func.call @cc_nil_value() : () -> i64
    %3892 = func.call @cc_errorp(%3890) : (i64) -> i64
    %3893 = arith.cmpi ne, %3892, %3891 : i64
    %3894 = scf.if %3893 -> (i64) {
      scf.yield %3890 : i64
    } else {
      %3895 = llvm.mlir.addressof @str485 : !llvm.ptr
      %3896 = arith.constant 31 : i64
      %3897 = func.call @cc_make_string(%3895, %3896) : (!llvm.ptr, i64) -> i64
      %3898 = llvm.mlir.addressof @str486 : !llvm.ptr
      %3899 = arith.constant 4 : i64
      %3900 = func.call @cc_make_string(%3898, %3899) : (!llvm.ptr, i64) -> i64
      %3901 = func.call @cc_intern(%3897, %3900) : (i64, i64) -> i64
      %3902 = func.call @cc_nil_value() : () -> i64
      %3903 = func.call @cc_cons(%3901, %3902) : (i64, i64) -> i64
      %3904 = func.call @cc_values_pack(%3903) : (i64) -> i64
      func.call @stack_push_pointer(%3901) : (i64) -> ()
      %3905 = llvm.mlir.addressof @str487 : !llvm.ptr
      %3906 = arith.constant 13 : i64
      %3907 = func.call @cc_make_string(%3905, %3906) : (!llvm.ptr, i64) -> i64
      %3908 = llvm.mlir.addressof @str488 : !llvm.ptr
      %3909 = arith.constant 4 : i64
      %3910 = func.call @cc_make_string(%3908, %3909) : (!llvm.ptr, i64) -> i64
      %3911 = func.call @cc_intern(%3907, %3910) : (i64, i64) -> i64
      %3912 = func.call @cc_nil_value() : () -> i64
      %3913 = func.call @cc_cons(%3911, %3912) : (i64, i64) -> i64
      %3914 = func.call @cc_values_pack(%3913) : (i64) -> i64
      func.call @stack_push_pointer(%3911) : (i64) -> ()
      %3915 = llvm.mlir.addressof @str489 : !llvm.ptr
      %3916 = arith.constant 17 : i64
      %3917 = func.call @cc_make_string(%3915, %3916) : (!llvm.ptr, i64) -> i64
      %3918 = llvm.mlir.addressof @str490 : !llvm.ptr
      %3919 = arith.constant 4 : i64
      %3920 = func.call @cc_make_string(%3918, %3919) : (!llvm.ptr, i64) -> i64
      %3921 = func.call @cc_intern(%3917, %3920) : (i64, i64) -> i64
      %3922 = func.call @cc_nil_value() : () -> i64
      %3923 = func.call @cc_cons(%3921, %3922) : (i64, i64) -> i64
      %3924 = func.call @cc_values_pack(%3923) : (i64) -> i64
      func.call @stack_push_pointer(%3921) : (i64) -> ()
      %3925 = llvm.mlir.addressof @str491 : !llvm.ptr
      %3926 = arith.constant 19 : i64
      %3927 = func.call @cc_make_string(%3925, %3926) : (!llvm.ptr, i64) -> i64
      %3928 = llvm.mlir.addressof @str492 : !llvm.ptr
      %3929 = arith.constant 4 : i64
      %3930 = func.call @cc_make_string(%3928, %3929) : (!llvm.ptr, i64) -> i64
      %3931 = func.call @cc_intern(%3927, %3930) : (i64, i64) -> i64
      %3932 = func.call @cc_nil_value() : () -> i64
      %3933 = func.call @cc_cons(%3931, %3932) : (i64, i64) -> i64
      %3934 = func.call @cc_values_pack(%3933) : (i64) -> i64
      func.call @stack_push_pointer(%3931) : (i64) -> ()
      %3935 = llvm.mlir.addressof @str493 : !llvm.ptr
      %3936 = arith.constant 22 : i64
      %3937 = func.call @cc_make_string(%3935, %3936) : (!llvm.ptr, i64) -> i64
      %3938 = llvm.mlir.addressof @str494 : !llvm.ptr
      %3939 = arith.constant 4 : i64
      %3940 = func.call @cc_make_string(%3938, %3939) : (!llvm.ptr, i64) -> i64
      %3941 = func.call @cc_intern(%3937, %3940) : (i64, i64) -> i64
      %3942 = func.call @cc_nil_value() : () -> i64
      %3943 = func.call @cc_cons(%3941, %3942) : (i64, i64) -> i64
      %3944 = func.call @cc_values_pack(%3943) : (i64) -> i64
      func.call @stack_push_pointer(%3941) : (i64) -> ()
      %3945 = llvm.mlir.addressof @str495 : !llvm.ptr
      %3946 = arith.constant 29 : i64
      %3947 = func.call @cc_make_string(%3945, %3946) : (!llvm.ptr, i64) -> i64
      %3948 = llvm.mlir.addressof @str496 : !llvm.ptr
      %3949 = arith.constant 4 : i64
      %3950 = func.call @cc_make_string(%3948, %3949) : (!llvm.ptr, i64) -> i64
      %3951 = func.call @cc_intern(%3947, %3950) : (i64, i64) -> i64
      %3952 = func.call @cc_nil_value() : () -> i64
      %3953 = func.call @cc_cons(%3951, %3952) : (i64, i64) -> i64
      %3954 = func.call @cc_values_pack(%3953) : (i64) -> i64
      func.call @stack_push_pointer(%3951) : (i64) -> ()
      %3955 = llvm.mlir.addressof @str497 : !llvm.ptr
      %3956 = arith.constant 18 : i64
      %3957 = func.call @cc_make_string(%3955, %3956) : (!llvm.ptr, i64) -> i64
      %3958 = llvm.mlir.addressof @str498 : !llvm.ptr
      %3959 = arith.constant 4 : i64
      %3960 = func.call @cc_make_string(%3958, %3959) : (!llvm.ptr, i64) -> i64
      %3961 = func.call @cc_intern(%3957, %3960) : (i64, i64) -> i64
      %3962 = func.call @cc_nil_value() : () -> i64
      %3963 = func.call @cc_cons(%3961, %3962) : (i64, i64) -> i64
      %3964 = func.call @cc_values_pack(%3963) : (i64) -> i64
      func.call @stack_push_pointer(%3961) : (i64) -> ()
      %3965 = llvm.mlir.addressof @str499 : !llvm.ptr
      %3966 = arith.constant 23 : i64
      %3967 = func.call @cc_make_string(%3965, %3966) : (!llvm.ptr, i64) -> i64
      %3968 = llvm.mlir.addressof @str500 : !llvm.ptr
      %3969 = arith.constant 4 : i64
      %3970 = func.call @cc_make_string(%3968, %3969) : (!llvm.ptr, i64) -> i64
      %3971 = func.call @cc_intern(%3967, %3970) : (i64, i64) -> i64
      %3972 = func.call @cc_nil_value() : () -> i64
      %3973 = func.call @cc_cons(%3971, %3972) : (i64, i64) -> i64
      %3974 = func.call @cc_values_pack(%3973) : (i64) -> i64
      func.call @stack_push_pointer(%3971) : (i64) -> ()
      %3975 = llvm.mlir.addressof @str501 : !llvm.ptr
      %3976 = arith.constant 25 : i64
      %3977 = func.call @cc_make_string(%3975, %3976) : (!llvm.ptr, i64) -> i64
      %3978 = llvm.mlir.addressof @str502 : !llvm.ptr
      %3979 = arith.constant 4 : i64
      %3980 = func.call @cc_make_string(%3978, %3979) : (!llvm.ptr, i64) -> i64
      %3981 = func.call @cc_intern(%3977, %3980) : (i64, i64) -> i64
      %3982 = func.call @cc_nil_value() : () -> i64
      %3983 = func.call @cc_cons(%3981, %3982) : (i64, i64) -> i64
      %3984 = func.call @cc_values_pack(%3983) : (i64) -> i64
      func.call @stack_push_pointer(%3981) : (i64) -> ()
      %3985 = llvm.mlir.addressof @str503 : !llvm.ptr
      %3986 = arith.constant 17 : i64
      %3987 = func.call @cc_make_string(%3985, %3986) : (!llvm.ptr, i64) -> i64
      %3988 = llvm.mlir.addressof @str504 : !llvm.ptr
      %3989 = arith.constant 4 : i64
      %3990 = func.call @cc_make_string(%3988, %3989) : (!llvm.ptr, i64) -> i64
      %3991 = func.call @cc_intern(%3987, %3990) : (i64, i64) -> i64
      %3992 = func.call @cc_nil_value() : () -> i64
      %3993 = func.call @cc_cons(%3991, %3992) : (i64, i64) -> i64
      %3994 = func.call @cc_values_pack(%3993) : (i64) -> i64
      func.call @stack_push_pointer(%3991) : (i64) -> ()
      %3995 = llvm.mlir.addressof @str505 : !llvm.ptr
      %3996 = arith.constant 21 : i64
      %3997 = func.call @cc_make_string(%3995, %3996) : (!llvm.ptr, i64) -> i64
      %3998 = llvm.mlir.addressof @str506 : !llvm.ptr
      %3999 = arith.constant 4 : i64
      %4000 = func.call @cc_make_string(%3998, %3999) : (!llvm.ptr, i64) -> i64
      %4001 = func.call @cc_intern(%3997, %4000) : (i64, i64) -> i64
      %4002 = func.call @cc_nil_value() : () -> i64
      %4003 = func.call @cc_cons(%4001, %4002) : (i64, i64) -> i64
      %4004 = func.call @cc_values_pack(%4003) : (i64) -> i64
      func.call @stack_push_pointer(%4001) : (i64) -> ()
      %4005 = llvm.mlir.addressof @str507 : !llvm.ptr
      %4006 = arith.constant 15 : i64
      %4007 = func.call @cc_make_string(%4005, %4006) : (!llvm.ptr, i64) -> i64
      %4008 = llvm.mlir.addressof @str508 : !llvm.ptr
      %4009 = arith.constant 4 : i64
      %4010 = func.call @cc_make_string(%4008, %4009) : (!llvm.ptr, i64) -> i64
      %4011 = func.call @cc_intern(%4007, %4010) : (i64, i64) -> i64
      %4012 = func.call @cc_nil_value() : () -> i64
      %4013 = func.call @cc_cons(%4011, %4012) : (i64, i64) -> i64
      %4014 = func.call @cc_values_pack(%4013) : (i64) -> i64
      func.call @stack_push_pointer(%4011) : (i64) -> ()
      %4015 = llvm.mlir.addressof @str509 : !llvm.ptr
      %4016 = arith.constant 11 : i64
      %4017 = func.call @cc_make_string(%4015, %4016) : (!llvm.ptr, i64) -> i64
      %4018 = llvm.mlir.addressof @str510 : !llvm.ptr
      %4019 = arith.constant 4 : i64
      %4020 = func.call @cc_make_string(%4018, %4019) : (!llvm.ptr, i64) -> i64
      %4021 = func.call @cc_intern(%4017, %4020) : (i64, i64) -> i64
      %4022 = func.call @cc_nil_value() : () -> i64
      %4023 = func.call @cc_cons(%4021, %4022) : (i64, i64) -> i64
      %4024 = func.call @cc_values_pack(%4023) : (i64) -> i64
      func.call @stack_push_pointer(%4021) : (i64) -> ()
      %4025 = llvm.mlir.addressof @str511 : !llvm.ptr
      %4026 = arith.constant 40 : i64
      %4027 = func.call @cc_make_string(%4025, %4026) : (!llvm.ptr, i64) -> i64
      %4028 = llvm.mlir.addressof @str512 : !llvm.ptr
      %4029 = arith.constant 4 : i64
      %4030 = func.call @cc_make_string(%4028, %4029) : (!llvm.ptr, i64) -> i64
      %4031 = func.call @cc_intern(%4027, %4030) : (i64, i64) -> i64
      %4032 = func.call @cc_nil_value() : () -> i64
      %4033 = func.call @cc_cons(%4031, %4032) : (i64, i64) -> i64
      %4034 = func.call @cc_values_pack(%4033) : (i64) -> i64
      func.call @stack_push_pointer(%4031) : (i64) -> ()
      %4035 = llvm.mlir.addressof @str513 : !llvm.ptr
      %4036 = arith.constant 29 : i64
      %4037 = func.call @cc_make_string(%4035, %4036) : (!llvm.ptr, i64) -> i64
      %4038 = llvm.mlir.addressof @str514 : !llvm.ptr
      %4039 = arith.constant 4 : i64
      %4040 = func.call @cc_make_string(%4038, %4039) : (!llvm.ptr, i64) -> i64
      %4041 = func.call @cc_intern(%4037, %4040) : (i64, i64) -> i64
      %4042 = func.call @cc_nil_value() : () -> i64
      %4043 = func.call @cc_cons(%4041, %4042) : (i64, i64) -> i64
      %4044 = func.call @cc_values_pack(%4043) : (i64) -> i64
      func.call @stack_push_pointer(%4041) : (i64) -> ()
      %4045 = llvm.mlir.addressof @str515 : !llvm.ptr
      %4046 = arith.constant 31 : i64
      %4047 = func.call @cc_make_string(%4045, %4046) : (!llvm.ptr, i64) -> i64
      %4048 = llvm.mlir.addressof @str516 : !llvm.ptr
      %4049 = arith.constant 4 : i64
      %4050 = func.call @cc_make_string(%4048, %4049) : (!llvm.ptr, i64) -> i64
      %4051 = func.call @cc_intern(%4047, %4050) : (i64, i64) -> i64
      %4052 = func.call @cc_nil_value() : () -> i64
      %4053 = func.call @cc_cons(%4051, %4052) : (i64, i64) -> i64
      %4054 = func.call @cc_values_pack(%4053) : (i64) -> i64
      func.call @stack_push_pointer(%4051) : (i64) -> ()
      %4055 = llvm.mlir.addressof @str517 : !llvm.ptr
      %4056 = arith.constant 24 : i64
      %4057 = func.call @cc_make_string(%4055, %4056) : (!llvm.ptr, i64) -> i64
      %4058 = llvm.mlir.addressof @str518 : !llvm.ptr
      %4059 = arith.constant 4 : i64
      %4060 = func.call @cc_make_string(%4058, %4059) : (!llvm.ptr, i64) -> i64
      %4061 = func.call @cc_intern(%4057, %4060) : (i64, i64) -> i64
      %4062 = func.call @cc_nil_value() : () -> i64
      %4063 = func.call @cc_cons(%4061, %4062) : (i64, i64) -> i64
      %4064 = func.call @cc_values_pack(%4063) : (i64) -> i64
      func.call @stack_push_pointer(%4061) : (i64) -> ()
      %4065 = llvm.mlir.addressof @str519 : !llvm.ptr
      %4066 = arith.constant 33 : i64
      %4067 = func.call @cc_make_string(%4065, %4066) : (!llvm.ptr, i64) -> i64
      %4068 = llvm.mlir.addressof @str520 : !llvm.ptr
      %4069 = arith.constant 4 : i64
      %4070 = func.call @cc_make_string(%4068, %4069) : (!llvm.ptr, i64) -> i64
      %4071 = func.call @cc_intern(%4067, %4070) : (i64, i64) -> i64
      %4072 = func.call @cc_nil_value() : () -> i64
      %4073 = func.call @cc_cons(%4071, %4072) : (i64, i64) -> i64
      %4074 = func.call @cc_values_pack(%4073) : (i64) -> i64
      func.call @stack_push_pointer(%4071) : (i64) -> ()
      %4075 = llvm.mlir.addressof @str521 : !llvm.ptr
      %4076 = arith.constant 13 : i64
      %4077 = func.call @cc_make_string(%4075, %4076) : (!llvm.ptr, i64) -> i64
      %4078 = llvm.mlir.addressof @str522 : !llvm.ptr
      %4079 = arith.constant 4 : i64
      %4080 = func.call @cc_make_string(%4078, %4079) : (!llvm.ptr, i64) -> i64
      %4081 = func.call @cc_intern(%4077, %4080) : (i64, i64) -> i64
      %4082 = func.call @cc_nil_value() : () -> i64
      %4083 = func.call @cc_cons(%4081, %4082) : (i64, i64) -> i64
      %4084 = func.call @cc_values_pack(%4083) : (i64) -> i64
      func.call @stack_push_pointer(%4081) : (i64) -> ()
      %4085 = llvm.mlir.addressof @str523 : !llvm.ptr
      %4086 = arith.constant 28 : i64
      %4087 = func.call @cc_make_string(%4085, %4086) : (!llvm.ptr, i64) -> i64
      %4088 = llvm.mlir.addressof @str524 : !llvm.ptr
      %4089 = arith.constant 4 : i64
      %4090 = func.call @cc_make_string(%4088, %4089) : (!llvm.ptr, i64) -> i64
      %4091 = func.call @cc_intern(%4087, %4090) : (i64, i64) -> i64
      %4092 = func.call @cc_nil_value() : () -> i64
      %4093 = func.call @cc_cons(%4091, %4092) : (i64, i64) -> i64
      %4094 = func.call @cc_values_pack(%4093) : (i64) -> i64
      func.call @stack_push_pointer(%4091) : (i64) -> ()
      %4095 = llvm.mlir.addressof @str525 : !llvm.ptr
      %4096 = arith.constant 31 : i64
      %4097 = func.call @cc_make_string(%4095, %4096) : (!llvm.ptr, i64) -> i64
      %4098 = llvm.mlir.addressof @str526 : !llvm.ptr
      %4099 = arith.constant 4 : i64
      %4100 = func.call @cc_make_string(%4098, %4099) : (!llvm.ptr, i64) -> i64
      %4101 = func.call @cc_intern(%4097, %4100) : (i64, i64) -> i64
      %4102 = func.call @cc_nil_value() : () -> i64
      %4103 = func.call @cc_cons(%4101, %4102) : (i64, i64) -> i64
      %4104 = func.call @cc_values_pack(%4103) : (i64) -> i64
      func.call @stack_push_pointer(%4101) : (i64) -> ()
      %4105 = llvm.mlir.addressof @str527 : !llvm.ptr
      %4106 = arith.constant 24 : i64
      %4107 = func.call @cc_make_string(%4105, %4106) : (!llvm.ptr, i64) -> i64
      %4108 = llvm.mlir.addressof @str528 : !llvm.ptr
      %4109 = arith.constant 4 : i64
      %4110 = func.call @cc_make_string(%4108, %4109) : (!llvm.ptr, i64) -> i64
      %4111 = func.call @cc_intern(%4107, %4110) : (i64, i64) -> i64
      %4112 = func.call @cc_nil_value() : () -> i64
      %4113 = func.call @cc_cons(%4111, %4112) : (i64, i64) -> i64
      %4114 = func.call @cc_values_pack(%4113) : (i64) -> i64
      func.call @stack_push_pointer(%4111) : (i64) -> ()
      %4115 = llvm.mlir.addressof @str529 : !llvm.ptr
      %4116 = arith.constant 35 : i64
      %4117 = func.call @cc_make_string(%4115, %4116) : (!llvm.ptr, i64) -> i64
      %4118 = llvm.mlir.addressof @str530 : !llvm.ptr
      %4119 = arith.constant 4 : i64
      %4120 = func.call @cc_make_string(%4118, %4119) : (!llvm.ptr, i64) -> i64
      %4121 = func.call @cc_intern(%4117, %4120) : (i64, i64) -> i64
      %4122 = func.call @cc_nil_value() : () -> i64
      %4123 = func.call @cc_cons(%4121, %4122) : (i64, i64) -> i64
      %4124 = func.call @cc_values_pack(%4123) : (i64) -> i64
      func.call @stack_push_pointer(%4121) : (i64) -> ()
      %4125 = llvm.mlir.addressof @str531 : !llvm.ptr
      %4126 = arith.constant 20 : i64
      %4127 = func.call @cc_make_string(%4125, %4126) : (!llvm.ptr, i64) -> i64
      %4128 = llvm.mlir.addressof @str532 : !llvm.ptr
      %4129 = arith.constant 4 : i64
      %4130 = func.call @cc_make_string(%4128, %4129) : (!llvm.ptr, i64) -> i64
      %4131 = func.call @cc_intern(%4127, %4130) : (i64, i64) -> i64
      %4132 = func.call @cc_nil_value() : () -> i64
      %4133 = func.call @cc_cons(%4131, %4132) : (i64, i64) -> i64
      %4134 = func.call @cc_values_pack(%4133) : (i64) -> i64
      func.call @stack_push_pointer(%4131) : (i64) -> ()
      %4135 = llvm.mlir.addressof @str533 : !llvm.ptr
      %4136 = arith.constant 23 : i64
      %4137 = func.call @cc_make_string(%4135, %4136) : (!llvm.ptr, i64) -> i64
      %4138 = llvm.mlir.addressof @str534 : !llvm.ptr
      %4139 = arith.constant 4 : i64
      %4140 = func.call @cc_make_string(%4138, %4139) : (!llvm.ptr, i64) -> i64
      %4141 = func.call @cc_intern(%4137, %4140) : (i64, i64) -> i64
      %4142 = func.call @cc_nil_value() : () -> i64
      %4143 = func.call @cc_cons(%4141, %4142) : (i64, i64) -> i64
      %4144 = func.call @cc_values_pack(%4143) : (i64) -> i64
      func.call @stack_push_pointer(%4141) : (i64) -> ()
      %4145 = llvm.mlir.addressof @str535 : !llvm.ptr
      %4146 = arith.constant 42 : i64
      %4147 = func.call @cc_make_string(%4145, %4146) : (!llvm.ptr, i64) -> i64
      %4148 = llvm.mlir.addressof @str536 : !llvm.ptr
      %4149 = arith.constant 4 : i64
      %4150 = func.call @cc_make_string(%4148, %4149) : (!llvm.ptr, i64) -> i64
      %4151 = func.call @cc_intern(%4147, %4150) : (i64, i64) -> i64
      %4152 = func.call @cc_nil_value() : () -> i64
      %4153 = func.call @cc_cons(%4151, %4152) : (i64, i64) -> i64
      %4154 = func.call @cc_values_pack(%4153) : (i64) -> i64
      func.call @stack_push_pointer(%4151) : (i64) -> ()
      %4155 = llvm.mlir.addressof @str537 : !llvm.ptr
      %4156 = arith.constant 28 : i64
      %4157 = func.call @cc_make_string(%4155, %4156) : (!llvm.ptr, i64) -> i64
      %4158 = llvm.mlir.addressof @str538 : !llvm.ptr
      %4159 = arith.constant 4 : i64
      %4160 = func.call @cc_make_string(%4158, %4159) : (!llvm.ptr, i64) -> i64
      %4161 = func.call @cc_intern(%4157, %4160) : (i64, i64) -> i64
      %4162 = func.call @cc_nil_value() : () -> i64
      %4163 = func.call @cc_cons(%4161, %4162) : (i64, i64) -> i64
      %4164 = func.call @cc_values_pack(%4163) : (i64) -> i64
      func.call @stack_push_pointer(%4161) : (i64) -> ()
      %4165 = llvm.mlir.addressof @str539 : !llvm.ptr
      %4166 = arith.constant 29 : i64
      %4167 = func.call @cc_make_string(%4165, %4166) : (!llvm.ptr, i64) -> i64
      %4168 = llvm.mlir.addressof @str540 : !llvm.ptr
      %4169 = arith.constant 4 : i64
      %4170 = func.call @cc_make_string(%4168, %4169) : (!llvm.ptr, i64) -> i64
      %4171 = func.call @cc_intern(%4167, %4170) : (i64, i64) -> i64
      %4172 = func.call @cc_nil_value() : () -> i64
      %4173 = func.call @cc_cons(%4171, %4172) : (i64, i64) -> i64
      %4174 = func.call @cc_values_pack(%4173) : (i64) -> i64
      func.call @stack_push_pointer(%4171) : (i64) -> ()
      %4175 = llvm.mlir.addressof @str541 : !llvm.ptr
      %4176 = arith.constant 35 : i64
      %4177 = func.call @cc_make_string(%4175, %4176) : (!llvm.ptr, i64) -> i64
      %4178 = llvm.mlir.addressof @str542 : !llvm.ptr
      %4179 = arith.constant 4 : i64
      %4180 = func.call @cc_make_string(%4178, %4179) : (!llvm.ptr, i64) -> i64
      %4181 = func.call @cc_intern(%4177, %4180) : (i64, i64) -> i64
      %4182 = func.call @cc_nil_value() : () -> i64
      %4183 = func.call @cc_cons(%4181, %4182) : (i64, i64) -> i64
      %4184 = func.call @cc_values_pack(%4183) : (i64) -> i64
      func.call @stack_push_pointer(%4181) : (i64) -> ()
      %4185 = llvm.mlir.addressof @str543 : !llvm.ptr
      %4186 = arith.constant 24 : i64
      %4187 = func.call @cc_make_string(%4185, %4186) : (!llvm.ptr, i64) -> i64
      %4188 = llvm.mlir.addressof @str544 : !llvm.ptr
      %4189 = arith.constant 4 : i64
      %4190 = func.call @cc_make_string(%4188, %4189) : (!llvm.ptr, i64) -> i64
      %4191 = func.call @cc_intern(%4187, %4190) : (i64, i64) -> i64
      %4192 = func.call @cc_nil_value() : () -> i64
      %4193 = func.call @cc_cons(%4191, %4192) : (i64, i64) -> i64
      %4194 = func.call @cc_values_pack(%4193) : (i64) -> i64
      func.call @stack_push_pointer(%4191) : (i64) -> ()
      %4195 = llvm.mlir.addressof @str545 : !llvm.ptr
      %4196 = arith.constant 18 : i64
      %4197 = func.call @cc_make_string(%4195, %4196) : (!llvm.ptr, i64) -> i64
      %4198 = llvm.mlir.addressof @str546 : !llvm.ptr
      %4199 = arith.constant 4 : i64
      %4200 = func.call @cc_make_string(%4198, %4199) : (!llvm.ptr, i64) -> i64
      %4201 = func.call @cc_intern(%4197, %4200) : (i64, i64) -> i64
      %4202 = func.call @cc_nil_value() : () -> i64
      %4203 = func.call @cc_cons(%4201, %4202) : (i64, i64) -> i64
      %4204 = func.call @cc_values_pack(%4203) : (i64) -> i64
      func.call @stack_push_pointer(%4201) : (i64) -> ()
      %4205 = llvm.mlir.addressof @str547 : !llvm.ptr
      %4206 = arith.constant 14 : i64
      %4207 = func.call @cc_make_string(%4205, %4206) : (!llvm.ptr, i64) -> i64
      %4208 = llvm.mlir.addressof @str548 : !llvm.ptr
      %4209 = arith.constant 4 : i64
      %4210 = func.call @cc_make_string(%4208, %4209) : (!llvm.ptr, i64) -> i64
      %4211 = func.call @cc_intern(%4207, %4210) : (i64, i64) -> i64
      %4212 = func.call @cc_nil_value() : () -> i64
      %4213 = func.call @cc_cons(%4211, %4212) : (i64, i64) -> i64
      %4214 = func.call @cc_values_pack(%4213) : (i64) -> i64
      func.call @stack_push_pointer(%4211) : (i64) -> ()
      %4215 = llvm.mlir.addressof @str549 : !llvm.ptr
      %4216 = arith.constant 15 : i64
      %4217 = func.call @cc_make_string(%4215, %4216) : (!llvm.ptr, i64) -> i64
      %4218 = llvm.mlir.addressof @str550 : !llvm.ptr
      %4219 = arith.constant 4 : i64
      %4220 = func.call @cc_make_string(%4218, %4219) : (!llvm.ptr, i64) -> i64
      %4221 = func.call @cc_intern(%4217, %4220) : (i64, i64) -> i64
      %4222 = func.call @cc_nil_value() : () -> i64
      %4223 = func.call @cc_cons(%4221, %4222) : (i64, i64) -> i64
      %4224 = func.call @cc_values_pack(%4223) : (i64) -> i64
      func.call @stack_push_pointer(%4221) : (i64) -> ()
      %4225 = llvm.mlir.addressof @str551 : !llvm.ptr
      %4226 = arith.constant 23 : i64
      %4227 = func.call @cc_make_string(%4225, %4226) : (!llvm.ptr, i64) -> i64
      %4228 = llvm.mlir.addressof @str552 : !llvm.ptr
      %4229 = arith.constant 4 : i64
      %4230 = func.call @cc_make_string(%4228, %4229) : (!llvm.ptr, i64) -> i64
      %4231 = func.call @cc_intern(%4227, %4230) : (i64, i64) -> i64
      %4232 = func.call @cc_nil_value() : () -> i64
      %4233 = func.call @cc_cons(%4231, %4232) : (i64, i64) -> i64
      %4234 = func.call @cc_values_pack(%4233) : (i64) -> i64
      func.call @stack_push_pointer(%4231) : (i64) -> ()
      %4235 = llvm.mlir.addressof @str553 : !llvm.ptr
      %4236 = arith.constant 18 : i64
      %4237 = func.call @cc_make_string(%4235, %4236) : (!llvm.ptr, i64) -> i64
      %4238 = llvm.mlir.addressof @str554 : !llvm.ptr
      %4239 = arith.constant 4 : i64
      %4240 = func.call @cc_make_string(%4238, %4239) : (!llvm.ptr, i64) -> i64
      %4241 = func.call @cc_intern(%4237, %4240) : (i64, i64) -> i64
      %4242 = func.call @cc_nil_value() : () -> i64
      %4243 = func.call @cc_cons(%4241, %4242) : (i64, i64) -> i64
      %4244 = func.call @cc_values_pack(%4243) : (i64) -> i64
      func.call @stack_push_pointer(%4241) : (i64) -> ()
      %4245 = llvm.mlir.addressof @str555 : !llvm.ptr
      %4246 = arith.constant 19 : i64
      %4247 = func.call @cc_make_string(%4245, %4246) : (!llvm.ptr, i64) -> i64
      %4248 = llvm.mlir.addressof @str556 : !llvm.ptr
      %4249 = arith.constant 4 : i64
      %4250 = func.call @cc_make_string(%4248, %4249) : (!llvm.ptr, i64) -> i64
      %4251 = func.call @cc_intern(%4247, %4250) : (i64, i64) -> i64
      %4252 = func.call @cc_nil_value() : () -> i64
      %4253 = func.call @cc_cons(%4251, %4252) : (i64, i64) -> i64
      %4254 = func.call @cc_values_pack(%4253) : (i64) -> i64
      func.call @stack_push_pointer(%4251) : (i64) -> ()
      %4255 = llvm.mlir.addressof @str557 : !llvm.ptr
      %4256 = arith.constant 17 : i64
      %4257 = func.call @cc_make_string(%4255, %4256) : (!llvm.ptr, i64) -> i64
      %4258 = llvm.mlir.addressof @str558 : !llvm.ptr
      %4259 = arith.constant 4 : i64
      %4260 = func.call @cc_make_string(%4258, %4259) : (!llvm.ptr, i64) -> i64
      %4261 = func.call @cc_intern(%4257, %4260) : (i64, i64) -> i64
      %4262 = func.call @cc_nil_value() : () -> i64
      %4263 = func.call @cc_cons(%4261, %4262) : (i64, i64) -> i64
      %4264 = func.call @cc_values_pack(%4263) : (i64) -> i64
      func.call @stack_push_pointer(%4261) : (i64) -> ()
      %4265 = llvm.mlir.addressof @str559 : !llvm.ptr
      %4266 = arith.constant 26 : i64
      %4267 = func.call @cc_make_string(%4265, %4266) : (!llvm.ptr, i64) -> i64
      %4268 = llvm.mlir.addressof @str560 : !llvm.ptr
      %4269 = arith.constant 4 : i64
      %4270 = func.call @cc_make_string(%4268, %4269) : (!llvm.ptr, i64) -> i64
      %4271 = func.call @cc_intern(%4267, %4270) : (i64, i64) -> i64
      %4272 = func.call @cc_nil_value() : () -> i64
      %4273 = func.call @cc_cons(%4271, %4272) : (i64, i64) -> i64
      %4274 = func.call @cc_values_pack(%4273) : (i64) -> i64
      func.call @stack_push_pointer(%4271) : (i64) -> ()
      %4275 = llvm.mlir.addressof @str561 : !llvm.ptr
      %4276 = arith.constant 28 : i64
      %4277 = func.call @cc_make_string(%4275, %4276) : (!llvm.ptr, i64) -> i64
      %4278 = llvm.mlir.addressof @str562 : !llvm.ptr
      %4279 = arith.constant 4 : i64
      %4280 = func.call @cc_make_string(%4278, %4279) : (!llvm.ptr, i64) -> i64
      %4281 = func.call @cc_intern(%4277, %4280) : (i64, i64) -> i64
      %4282 = func.call @cc_nil_value() : () -> i64
      %4283 = func.call @cc_cons(%4281, %4282) : (i64, i64) -> i64
      %4284 = func.call @cc_values_pack(%4283) : (i64) -> i64
      func.call @stack_push_pointer(%4281) : (i64) -> ()
      %4285 = llvm.mlir.addressof @str563 : !llvm.ptr
      %4286 = arith.constant 24 : i64
      %4287 = func.call @cc_make_string(%4285, %4286) : (!llvm.ptr, i64) -> i64
      %4288 = llvm.mlir.addressof @str564 : !llvm.ptr
      %4289 = arith.constant 4 : i64
      %4290 = func.call @cc_make_string(%4288, %4289) : (!llvm.ptr, i64) -> i64
      %4291 = func.call @cc_intern(%4287, %4290) : (i64, i64) -> i64
      %4292 = func.call @cc_nil_value() : () -> i64
      %4293 = func.call @cc_cons(%4291, %4292) : (i64, i64) -> i64
      %4294 = func.call @cc_values_pack(%4293) : (i64) -> i64
      func.call @stack_push_pointer(%4291) : (i64) -> ()
      %4295 = llvm.mlir.addressof @str565 : !llvm.ptr
      %4296 = arith.constant 20 : i64
      %4297 = func.call @cc_make_string(%4295, %4296) : (!llvm.ptr, i64) -> i64
      %4298 = llvm.mlir.addressof @str566 : !llvm.ptr
      %4299 = arith.constant 4 : i64
      %4300 = func.call @cc_make_string(%4298, %4299) : (!llvm.ptr, i64) -> i64
      %4301 = func.call @cc_intern(%4297, %4300) : (i64, i64) -> i64
      %4302 = func.call @cc_nil_value() : () -> i64
      %4303 = func.call @cc_cons(%4301, %4302) : (i64, i64) -> i64
      %4304 = func.call @cc_values_pack(%4303) : (i64) -> i64
      func.call @stack_push_pointer(%4301) : (i64) -> ()
      %4305 = llvm.mlir.addressof @str567 : !llvm.ptr
      %4306 = arith.constant 20 : i64
      %4307 = func.call @cc_make_string(%4305, %4306) : (!llvm.ptr, i64) -> i64
      %4308 = llvm.mlir.addressof @str568 : !llvm.ptr
      %4309 = arith.constant 4 : i64
      %4310 = func.call @cc_make_string(%4308, %4309) : (!llvm.ptr, i64) -> i64
      %4311 = func.call @cc_intern(%4307, %4310) : (i64, i64) -> i64
      %4312 = func.call @cc_nil_value() : () -> i64
      %4313 = func.call @cc_cons(%4311, %4312) : (i64, i64) -> i64
      %4314 = func.call @cc_values_pack(%4313) : (i64) -> i64
      func.call @stack_push_pointer(%4311) : (i64) -> ()
      %4315 = llvm.mlir.addressof @str569 : !llvm.ptr
      %4316 = arith.constant 23 : i64
      %4317 = func.call @cc_make_string(%4315, %4316) : (!llvm.ptr, i64) -> i64
      %4318 = llvm.mlir.addressof @str570 : !llvm.ptr
      %4319 = arith.constant 4 : i64
      %4320 = func.call @cc_make_string(%4318, %4319) : (!llvm.ptr, i64) -> i64
      %4321 = func.call @cc_intern(%4317, %4320) : (i64, i64) -> i64
      %4322 = func.call @cc_nil_value() : () -> i64
      %4323 = func.call @cc_cons(%4321, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_values_pack(%4323) : (i64) -> i64
      func.call @stack_push_pointer(%4321) : (i64) -> ()
      %4325 = llvm.mlir.addressof @str571 : !llvm.ptr
      %4326 = arith.constant 23 : i64
      %4327 = func.call @cc_make_string(%4325, %4326) : (!llvm.ptr, i64) -> i64
      %4328 = llvm.mlir.addressof @str572 : !llvm.ptr
      %4329 = arith.constant 4 : i64
      %4330 = func.call @cc_make_string(%4328, %4329) : (!llvm.ptr, i64) -> i64
      %4331 = func.call @cc_intern(%4327, %4330) : (i64, i64) -> i64
      %4332 = func.call @cc_nil_value() : () -> i64
      %4333 = func.call @cc_cons(%4331, %4332) : (i64, i64) -> i64
      %4334 = func.call @cc_values_pack(%4333) : (i64) -> i64
      func.call @stack_push_pointer(%4331) : (i64) -> ()
      %4335 = llvm.mlir.addressof @str573 : !llvm.ptr
      %4336 = arith.constant 24 : i64
      %4337 = func.call @cc_make_string(%4335, %4336) : (!llvm.ptr, i64) -> i64
      %4338 = llvm.mlir.addressof @str574 : !llvm.ptr
      %4339 = arith.constant 4 : i64
      %4340 = func.call @cc_make_string(%4338, %4339) : (!llvm.ptr, i64) -> i64
      %4341 = func.call @cc_intern(%4337, %4340) : (i64, i64) -> i64
      %4342 = func.call @cc_nil_value() : () -> i64
      %4343 = func.call @cc_cons(%4341, %4342) : (i64, i64) -> i64
      %4344 = func.call @cc_values_pack(%4343) : (i64) -> i64
      func.call @stack_push_pointer(%4341) : (i64) -> ()
      %4345 = llvm.mlir.addressof @str575 : !llvm.ptr
      %4346 = arith.constant 19 : i64
      %4347 = func.call @cc_make_string(%4345, %4346) : (!llvm.ptr, i64) -> i64
      %4348 = llvm.mlir.addressof @str576 : !llvm.ptr
      %4349 = arith.constant 4 : i64
      %4350 = func.call @cc_make_string(%4348, %4349) : (!llvm.ptr, i64) -> i64
      %4351 = func.call @cc_intern(%4347, %4350) : (i64, i64) -> i64
      %4352 = func.call @cc_nil_value() : () -> i64
      %4353 = func.call @cc_cons(%4351, %4352) : (i64, i64) -> i64
      %4354 = func.call @cc_values_pack(%4353) : (i64) -> i64
      func.call @stack_push_pointer(%4351) : (i64) -> ()
      %4355 = llvm.mlir.addressof @str577 : !llvm.ptr
      %4356 = arith.constant 16 : i64
      %4357 = func.call @cc_make_string(%4355, %4356) : (!llvm.ptr, i64) -> i64
      %4358 = llvm.mlir.addressof @str578 : !llvm.ptr
      %4359 = arith.constant 4 : i64
      %4360 = func.call @cc_make_string(%4358, %4359) : (!llvm.ptr, i64) -> i64
      %4361 = func.call @cc_intern(%4357, %4360) : (i64, i64) -> i64
      %4362 = func.call @cc_nil_value() : () -> i64
      %4363 = func.call @cc_cons(%4361, %4362) : (i64, i64) -> i64
      %4364 = func.call @cc_values_pack(%4363) : (i64) -> i64
      func.call @stack_push_pointer(%4361) : (i64) -> ()
      %4365 = llvm.mlir.addressof @str579 : !llvm.ptr
      %4366 = arith.constant 20 : i64
      %4367 = func.call @cc_make_string(%4365, %4366) : (!llvm.ptr, i64) -> i64
      %4368 = llvm.mlir.addressof @str580 : !llvm.ptr
      %4369 = arith.constant 4 : i64
      %4370 = func.call @cc_make_string(%4368, %4369) : (!llvm.ptr, i64) -> i64
      %4371 = func.call @cc_intern(%4367, %4370) : (i64, i64) -> i64
      %4372 = func.call @cc_nil_value() : () -> i64
      %4373 = func.call @cc_cons(%4371, %4372) : (i64, i64) -> i64
      %4374 = func.call @cc_values_pack(%4373) : (i64) -> i64
      func.call @stack_push_pointer(%4371) : (i64) -> ()
      %4375 = llvm.mlir.addressof @str581 : !llvm.ptr
      %4376 = arith.constant 22 : i64
      %4377 = func.call @cc_make_string(%4375, %4376) : (!llvm.ptr, i64) -> i64
      %4378 = llvm.mlir.addressof @str582 : !llvm.ptr
      %4379 = arith.constant 4 : i64
      %4380 = func.call @cc_make_string(%4378, %4379) : (!llvm.ptr, i64) -> i64
      %4381 = func.call @cc_intern(%4377, %4380) : (i64, i64) -> i64
      %4382 = func.call @cc_nil_value() : () -> i64
      %4383 = func.call @cc_cons(%4381, %4382) : (i64, i64) -> i64
      %4384 = func.call @cc_values_pack(%4383) : (i64) -> i64
      func.call @stack_push_pointer(%4381) : (i64) -> ()
      %4385 = llvm.mlir.addressof @str583 : !llvm.ptr
      %4386 = arith.constant 23 : i64
      %4387 = func.call @cc_make_string(%4385, %4386) : (!llvm.ptr, i64) -> i64
      %4388 = llvm.mlir.addressof @str584 : !llvm.ptr
      %4389 = arith.constant 4 : i64
      %4390 = func.call @cc_make_string(%4388, %4389) : (!llvm.ptr, i64) -> i64
      %4391 = func.call @cc_intern(%4387, %4390) : (i64, i64) -> i64
      %4392 = func.call @cc_nil_value() : () -> i64
      %4393 = func.call @cc_cons(%4391, %4392) : (i64, i64) -> i64
      %4394 = func.call @cc_values_pack(%4393) : (i64) -> i64
      func.call @stack_push_pointer(%4391) : (i64) -> ()
      %4395 = llvm.mlir.addressof @str585 : !llvm.ptr
      %4396 = arith.constant 27 : i64
      %4397 = func.call @cc_make_string(%4395, %4396) : (!llvm.ptr, i64) -> i64
      %4398 = llvm.mlir.addressof @str586 : !llvm.ptr
      %4399 = arith.constant 4 : i64
      %4400 = func.call @cc_make_string(%4398, %4399) : (!llvm.ptr, i64) -> i64
      %4401 = func.call @cc_intern(%4397, %4400) : (i64, i64) -> i64
      %4402 = func.call @cc_nil_value() : () -> i64
      %4403 = func.call @cc_cons(%4401, %4402) : (i64, i64) -> i64
      %4404 = func.call @cc_values_pack(%4403) : (i64) -> i64
      func.call @stack_push_pointer(%4401) : (i64) -> ()
      %4405 = llvm.mlir.addressof @str587 : !llvm.ptr
      %4406 = arith.constant 36 : i64
      %4407 = func.call @cc_make_string(%4405, %4406) : (!llvm.ptr, i64) -> i64
      %4408 = llvm.mlir.addressof @str588 : !llvm.ptr
      %4409 = arith.constant 4 : i64
      %4410 = func.call @cc_make_string(%4408, %4409) : (!llvm.ptr, i64) -> i64
      %4411 = func.call @cc_intern(%4407, %4410) : (i64, i64) -> i64
      %4412 = func.call @cc_nil_value() : () -> i64
      %4413 = func.call @cc_cons(%4411, %4412) : (i64, i64) -> i64
      %4414 = func.call @cc_values_pack(%4413) : (i64) -> i64
      func.call @stack_push_pointer(%4411) : (i64) -> ()
      %4415 = llvm.mlir.addressof @str589 : !llvm.ptr
      %4416 = arith.constant 26 : i64
      %4417 = func.call @cc_make_string(%4415, %4416) : (!llvm.ptr, i64) -> i64
      %4418 = llvm.mlir.addressof @str590 : !llvm.ptr
      %4419 = arith.constant 4 : i64
      %4420 = func.call @cc_make_string(%4418, %4419) : (!llvm.ptr, i64) -> i64
      %4421 = func.call @cc_intern(%4417, %4420) : (i64, i64) -> i64
      %4422 = func.call @cc_nil_value() : () -> i64
      %4423 = func.call @cc_cons(%4421, %4422) : (i64, i64) -> i64
      %4424 = func.call @cc_values_pack(%4423) : (i64) -> i64
      func.call @stack_push_pointer(%4421) : (i64) -> ()
      %4425 = llvm.mlir.addressof @str591 : !llvm.ptr
      %4426 = arith.constant 16 : i64
      %4427 = func.call @cc_make_string(%4425, %4426) : (!llvm.ptr, i64) -> i64
      %4428 = llvm.mlir.addressof @str592 : !llvm.ptr
      %4429 = arith.constant 4 : i64
      %4430 = func.call @cc_make_string(%4428, %4429) : (!llvm.ptr, i64) -> i64
      %4431 = func.call @cc_intern(%4427, %4430) : (i64, i64) -> i64
      %4432 = func.call @cc_nil_value() : () -> i64
      %4433 = func.call @cc_cons(%4431, %4432) : (i64, i64) -> i64
      %4434 = func.call @cc_values_pack(%4433) : (i64) -> i64
      func.call @stack_push_pointer(%4431) : (i64) -> ()
      %4435 = llvm.mlir.addressof @str593 : !llvm.ptr
      %4436 = arith.constant 19 : i64
      %4437 = func.call @cc_make_string(%4435, %4436) : (!llvm.ptr, i64) -> i64
      %4438 = llvm.mlir.addressof @str594 : !llvm.ptr
      %4439 = arith.constant 4 : i64
      %4440 = func.call @cc_make_string(%4438, %4439) : (!llvm.ptr, i64) -> i64
      %4441 = func.call @cc_intern(%4437, %4440) : (i64, i64) -> i64
      %4442 = func.call @cc_nil_value() : () -> i64
      %4443 = func.call @cc_cons(%4441, %4442) : (i64, i64) -> i64
      %4444 = func.call @cc_values_pack(%4443) : (i64) -> i64
      func.call @stack_push_pointer(%4441) : (i64) -> ()
      %4445 = llvm.mlir.addressof @str595 : !llvm.ptr
      %4446 = arith.constant 19 : i64
      %4447 = func.call @cc_make_string(%4445, %4446) : (!llvm.ptr, i64) -> i64
      %4448 = llvm.mlir.addressof @str596 : !llvm.ptr
      %4449 = arith.constant 4 : i64
      %4450 = func.call @cc_make_string(%4448, %4449) : (!llvm.ptr, i64) -> i64
      %4451 = func.call @cc_intern(%4447, %4450) : (i64, i64) -> i64
      %4452 = func.call @cc_nil_value() : () -> i64
      %4453 = func.call @cc_cons(%4451, %4452) : (i64, i64) -> i64
      %4454 = func.call @cc_values_pack(%4453) : (i64) -> i64
      func.call @stack_push_pointer(%4451) : (i64) -> ()
      %4455 = llvm.mlir.addressof @str597 : !llvm.ptr
      %4456 = arith.constant 22 : i64
      %4457 = func.call @cc_make_string(%4455, %4456) : (!llvm.ptr, i64) -> i64
      %4458 = llvm.mlir.addressof @str598 : !llvm.ptr
      %4459 = arith.constant 4 : i64
      %4460 = func.call @cc_make_string(%4458, %4459) : (!llvm.ptr, i64) -> i64
      %4461 = func.call @cc_intern(%4457, %4460) : (i64, i64) -> i64
      %4462 = func.call @cc_nil_value() : () -> i64
      %4463 = func.call @cc_cons(%4461, %4462) : (i64, i64) -> i64
      %4464 = func.call @cc_values_pack(%4463) : (i64) -> i64
      func.call @stack_push_pointer(%4461) : (i64) -> ()
      %4465 = llvm.mlir.addressof @str599 : !llvm.ptr
      %4466 = arith.constant 19 : i64
      %4467 = func.call @cc_make_string(%4465, %4466) : (!llvm.ptr, i64) -> i64
      %4468 = llvm.mlir.addressof @str600 : !llvm.ptr
      %4469 = arith.constant 4 : i64
      %4470 = func.call @cc_make_string(%4468, %4469) : (!llvm.ptr, i64) -> i64
      %4471 = func.call @cc_intern(%4467, %4470) : (i64, i64) -> i64
      %4472 = func.call @cc_nil_value() : () -> i64
      %4473 = func.call @cc_cons(%4471, %4472) : (i64, i64) -> i64
      %4474 = func.call @cc_values_pack(%4473) : (i64) -> i64
      func.call @stack_push_pointer(%4471) : (i64) -> ()
      %4475 = llvm.mlir.addressof @str601 : !llvm.ptr
      %4476 = arith.constant 25 : i64
      %4477 = func.call @cc_make_string(%4475, %4476) : (!llvm.ptr, i64) -> i64
      %4478 = llvm.mlir.addressof @str602 : !llvm.ptr
      %4479 = arith.constant 4 : i64
      %4480 = func.call @cc_make_string(%4478, %4479) : (!llvm.ptr, i64) -> i64
      %4481 = func.call @cc_intern(%4477, %4480) : (i64, i64) -> i64
      %4482 = func.call @cc_nil_value() : () -> i64
      %4483 = func.call @cc_cons(%4481, %4482) : (i64, i64) -> i64
      %4484 = func.call @cc_values_pack(%4483) : (i64) -> i64
      func.call @stack_push_pointer(%4481) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4485 = func.call @stack_pop_pointer() : () -> i64
      %4486 = func.call @stack_pop_pointer() : () -> i64
      %4487 = func.call @cc_cons(%4486, %4485) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4487) : (i64) -> ()
      %4488 = func.call @stack_pop_pointer() : () -> i64
      %4489 = func.call @stack_pop_pointer() : () -> i64
      %4490 = func.call @cc_cons(%4489, %4488) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4490) : (i64) -> ()
      %4491 = func.call @stack_pop_pointer() : () -> i64
      %4492 = func.call @stack_pop_pointer() : () -> i64
      %4493 = func.call @cc_cons(%4492, %4491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4493) : (i64) -> ()
      %4494 = func.call @stack_pop_pointer() : () -> i64
      %4495 = func.call @stack_pop_pointer() : () -> i64
      %4496 = func.call @cc_cons(%4495, %4494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4496) : (i64) -> ()
      %4497 = func.call @stack_pop_pointer() : () -> i64
      %4498 = func.call @stack_pop_pointer() : () -> i64
      %4499 = func.call @cc_cons(%4498, %4497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4499) : (i64) -> ()
      %4500 = func.call @stack_pop_pointer() : () -> i64
      %4501 = func.call @stack_pop_pointer() : () -> i64
      %4502 = func.call @cc_cons(%4501, %4500) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4502) : (i64) -> ()
      %4503 = func.call @stack_pop_pointer() : () -> i64
      %4504 = func.call @stack_pop_pointer() : () -> i64
      %4505 = func.call @cc_cons(%4504, %4503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4505) : (i64) -> ()
      %4506 = func.call @stack_pop_pointer() : () -> i64
      %4507 = func.call @stack_pop_pointer() : () -> i64
      %4508 = func.call @cc_cons(%4507, %4506) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4508) : (i64) -> ()
      %4509 = func.call @stack_pop_pointer() : () -> i64
      %4510 = func.call @stack_pop_pointer() : () -> i64
      %4511 = func.call @cc_cons(%4510, %4509) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4511) : (i64) -> ()
      %4512 = func.call @stack_pop_pointer() : () -> i64
      %4513 = func.call @stack_pop_pointer() : () -> i64
      %4514 = func.call @cc_cons(%4513, %4512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4514) : (i64) -> ()
      %4515 = func.call @stack_pop_pointer() : () -> i64
      %4516 = func.call @stack_pop_pointer() : () -> i64
      %4517 = func.call @cc_cons(%4516, %4515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4517) : (i64) -> ()
      %4518 = func.call @stack_pop_pointer() : () -> i64
      %4519 = func.call @stack_pop_pointer() : () -> i64
      %4520 = func.call @cc_cons(%4519, %4518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4520) : (i64) -> ()
      %4521 = func.call @stack_pop_pointer() : () -> i64
      %4522 = func.call @stack_pop_pointer() : () -> i64
      %4523 = func.call @cc_cons(%4522, %4521) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4523) : (i64) -> ()
      %4524 = func.call @stack_pop_pointer() : () -> i64
      %4525 = func.call @stack_pop_pointer() : () -> i64
      %4526 = func.call @cc_cons(%4525, %4524) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4526) : (i64) -> ()
      %4527 = func.call @stack_pop_pointer() : () -> i64
      %4528 = func.call @stack_pop_pointer() : () -> i64
      %4529 = func.call @cc_cons(%4528, %4527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4529) : (i64) -> ()
      %4530 = func.call @stack_pop_pointer() : () -> i64
      %4531 = func.call @stack_pop_pointer() : () -> i64
      %4532 = func.call @cc_cons(%4531, %4530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4532) : (i64) -> ()
      %4533 = func.call @stack_pop_pointer() : () -> i64
      %4534 = func.call @stack_pop_pointer() : () -> i64
      %4535 = func.call @cc_cons(%4534, %4533) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4535) : (i64) -> ()
      %4536 = func.call @stack_pop_pointer() : () -> i64
      %4537 = func.call @stack_pop_pointer() : () -> i64
      %4538 = func.call @cc_cons(%4537, %4536) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4538) : (i64) -> ()
      %4539 = func.call @stack_pop_pointer() : () -> i64
      %4540 = func.call @stack_pop_pointer() : () -> i64
      %4541 = func.call @cc_cons(%4540, %4539) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4541) : (i64) -> ()
      %4542 = func.call @stack_pop_pointer() : () -> i64
      %4543 = func.call @stack_pop_pointer() : () -> i64
      %4544 = func.call @cc_cons(%4543, %4542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4544) : (i64) -> ()
      %4545 = func.call @stack_pop_pointer() : () -> i64
      %4546 = func.call @stack_pop_pointer() : () -> i64
      %4547 = func.call @cc_cons(%4546, %4545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4547) : (i64) -> ()
      %4548 = func.call @stack_pop_pointer() : () -> i64
      %4549 = func.call @stack_pop_pointer() : () -> i64
      %4550 = func.call @cc_cons(%4549, %4548) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4550) : (i64) -> ()
      %4551 = func.call @stack_pop_pointer() : () -> i64
      %4552 = func.call @stack_pop_pointer() : () -> i64
      %4553 = func.call @cc_cons(%4552, %4551) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4553) : (i64) -> ()
      %4554 = func.call @stack_pop_pointer() : () -> i64
      %4555 = func.call @stack_pop_pointer() : () -> i64
      %4556 = func.call @cc_cons(%4555, %4554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4556) : (i64) -> ()
      %4557 = func.call @stack_pop_pointer() : () -> i64
      %4558 = func.call @stack_pop_pointer() : () -> i64
      %4559 = func.call @cc_cons(%4558, %4557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4559) : (i64) -> ()
      %4560 = func.call @stack_pop_pointer() : () -> i64
      %4561 = func.call @stack_pop_pointer() : () -> i64
      %4562 = func.call @cc_cons(%4561, %4560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4562) : (i64) -> ()
      %4563 = func.call @stack_pop_pointer() : () -> i64
      %4564 = func.call @stack_pop_pointer() : () -> i64
      %4565 = func.call @cc_cons(%4564, %4563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4565) : (i64) -> ()
      %4566 = func.call @stack_pop_pointer() : () -> i64
      %4567 = func.call @stack_pop_pointer() : () -> i64
      %4568 = func.call @cc_cons(%4567, %4566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4568) : (i64) -> ()
      %4569 = func.call @stack_pop_pointer() : () -> i64
      %4570 = func.call @stack_pop_pointer() : () -> i64
      %4571 = func.call @cc_cons(%4570, %4569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4571) : (i64) -> ()
      %4572 = func.call @stack_pop_pointer() : () -> i64
      %4573 = func.call @stack_pop_pointer() : () -> i64
      %4574 = func.call @cc_cons(%4573, %4572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4574) : (i64) -> ()
      %4575 = func.call @stack_pop_pointer() : () -> i64
      %4576 = func.call @stack_pop_pointer() : () -> i64
      %4577 = func.call @cc_cons(%4576, %4575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4577) : (i64) -> ()
      %4578 = func.call @stack_pop_pointer() : () -> i64
      %4579 = func.call @stack_pop_pointer() : () -> i64
      %4580 = func.call @cc_cons(%4579, %4578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4580) : (i64) -> ()
      %4581 = func.call @stack_pop_pointer() : () -> i64
      %4582 = func.call @stack_pop_pointer() : () -> i64
      %4583 = func.call @cc_cons(%4582, %4581) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4583) : (i64) -> ()
      %4584 = func.call @stack_pop_pointer() : () -> i64
      %4585 = func.call @stack_pop_pointer() : () -> i64
      %4586 = func.call @cc_cons(%4585, %4584) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4586) : (i64) -> ()
      %4587 = func.call @stack_pop_pointer() : () -> i64
      %4588 = func.call @stack_pop_pointer() : () -> i64
      %4589 = func.call @cc_cons(%4588, %4587) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4589) : (i64) -> ()
      %4590 = func.call @stack_pop_pointer() : () -> i64
      %4591 = func.call @stack_pop_pointer() : () -> i64
      %4592 = func.call @cc_cons(%4591, %4590) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4592) : (i64) -> ()
      %4593 = func.call @stack_pop_pointer() : () -> i64
      %4594 = func.call @stack_pop_pointer() : () -> i64
      %4595 = func.call @cc_cons(%4594, %4593) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4595) : (i64) -> ()
      %4596 = func.call @stack_pop_pointer() : () -> i64
      %4597 = func.call @stack_pop_pointer() : () -> i64
      %4598 = func.call @cc_cons(%4597, %4596) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4598) : (i64) -> ()
      %4599 = func.call @stack_pop_pointer() : () -> i64
      %4600 = func.call @stack_pop_pointer() : () -> i64
      %4601 = func.call @cc_cons(%4600, %4599) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4601) : (i64) -> ()
      %4602 = func.call @stack_pop_pointer() : () -> i64
      %4603 = func.call @stack_pop_pointer() : () -> i64
      %4604 = func.call @cc_cons(%4603, %4602) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4604) : (i64) -> ()
      %4605 = func.call @stack_pop_pointer() : () -> i64
      %4606 = func.call @stack_pop_pointer() : () -> i64
      %4607 = func.call @cc_cons(%4606, %4605) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4607) : (i64) -> ()
      %4608 = func.call @stack_pop_pointer() : () -> i64
      %4609 = func.call @stack_pop_pointer() : () -> i64
      %4610 = func.call @cc_cons(%4609, %4608) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4610) : (i64) -> ()
      %4611 = func.call @stack_pop_pointer() : () -> i64
      %4612 = func.call @stack_pop_pointer() : () -> i64
      %4613 = func.call @cc_cons(%4612, %4611) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4613) : (i64) -> ()
      %4614 = func.call @stack_pop_pointer() : () -> i64
      %4615 = func.call @stack_pop_pointer() : () -> i64
      %4616 = func.call @cc_cons(%4615, %4614) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4616) : (i64) -> ()
      %4617 = func.call @stack_pop_pointer() : () -> i64
      %4618 = func.call @stack_pop_pointer() : () -> i64
      %4619 = func.call @cc_cons(%4618, %4617) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4619) : (i64) -> ()
      %4620 = func.call @stack_pop_pointer() : () -> i64
      %4621 = func.call @stack_pop_pointer() : () -> i64
      %4622 = func.call @cc_cons(%4621, %4620) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4622) : (i64) -> ()
      %4623 = func.call @stack_pop_pointer() : () -> i64
      %4624 = func.call @stack_pop_pointer() : () -> i64
      %4625 = func.call @cc_cons(%4624, %4623) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4625) : (i64) -> ()
      %4626 = func.call @stack_pop_pointer() : () -> i64
      %4627 = func.call @stack_pop_pointer() : () -> i64
      %4628 = func.call @cc_cons(%4627, %4626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4628) : (i64) -> ()
      %4629 = func.call @stack_pop_pointer() : () -> i64
      %4630 = func.call @stack_pop_pointer() : () -> i64
      %4631 = func.call @cc_cons(%4630, %4629) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4631) : (i64) -> ()
      %4632 = func.call @stack_pop_pointer() : () -> i64
      %4633 = func.call @stack_pop_pointer() : () -> i64
      %4634 = func.call @cc_cons(%4633, %4632) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4634) : (i64) -> ()
      %4635 = func.call @stack_pop_pointer() : () -> i64
      %4636 = func.call @stack_pop_pointer() : () -> i64
      %4637 = func.call @cc_cons(%4636, %4635) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4637) : (i64) -> ()
      %4638 = func.call @stack_pop_pointer() : () -> i64
      %4639 = func.call @stack_pop_pointer() : () -> i64
      %4640 = func.call @cc_cons(%4639, %4638) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4640) : (i64) -> ()
      %4641 = func.call @stack_pop_pointer() : () -> i64
      %4642 = func.call @stack_pop_pointer() : () -> i64
      %4643 = func.call @cc_cons(%4642, %4641) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4643) : (i64) -> ()
      %4644 = func.call @stack_pop_pointer() : () -> i64
      %4645 = func.call @stack_pop_pointer() : () -> i64
      %4646 = func.call @cc_cons(%4645, %4644) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4646) : (i64) -> ()
      %4647 = func.call @stack_pop_pointer() : () -> i64
      %4648 = func.call @stack_pop_pointer() : () -> i64
      %4649 = func.call @cc_cons(%4648, %4647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4649) : (i64) -> ()
      %4650 = func.call @stack_pop_pointer() : () -> i64
      %4651 = func.call @stack_pop_pointer() : () -> i64
      %4652 = func.call @cc_cons(%4651, %4650) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4652) : (i64) -> ()
      %4653 = func.call @stack_pop_pointer() : () -> i64
      %4654 = func.call @stack_pop_pointer() : () -> i64
      %4655 = func.call @cc_cons(%4654, %4653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4655) : (i64) -> ()
      %4656 = func.call @stack_pop_pointer() : () -> i64
      %4657 = func.call @stack_pop_pointer() : () -> i64
      %4658 = func.call @cc_cons(%4657, %4656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4658) : (i64) -> ()
      %4659 = func.call @stack_pop_pointer() : () -> i64
      %4660 = func.call @stack_pop_pointer() : () -> i64
      %4661 = func.call @cc_cons(%4660, %4659) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4661) : (i64) -> ()
      %4662 = func.call @stack_pop_pointer() : () -> i64
      %4663 = func.call @cc_nil_value() : () -> i64
      %4664 = func.call @cc_nil_value() : () -> i64
      %4665 = func.call @cc_errorp(%4663) : (i64) -> i64
      %4666 = arith.cmpi ne, %4665, %4664 : i64
      %4667 = scf.if %4666 -> (i64) {
        scf.yield %4663 : i64
      } else {
        func.call @stack_push_nil() : () -> ()
        %4668 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%4662) : (i64) -> ()
        %4669 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4670 = func.call @stack_pop_pointer() : () -> i64
        %4671 = func.call @cc_nil_value() : () -> i64
        %4672 = func.call @cc_nil_value() : () -> i64
        %4673 = func.call @cc_errorp(%4671) : (i64) -> i64
        %4674 = arith.cmpi ne, %4673, %4672 : i64
        %4675 = scf.if %4674 -> (i64) {
          scf.yield %4671 : i64
        } else {
          %4676 = func.call @cc_nil_value() : () -> i64
          %4677 = llvm.mlir.addressof @str603 : !llvm.ptr
          %4678 = arith.constant 38 : i64
          %4679 = func.call @cc_make_string(%4677, %4678) : (!llvm.ptr, i64) -> i64
          %4680 = func.call @cc_nil_value() : () -> i64
          %4681 = func.call @cc_intern(%4679, %4680) : (i64, i64) -> i64
          %4682 = func.call @cc_nil_value() : () -> i64
          %4683 = func.call @cc_cons(%4681, %4682) : (i64, i64) -> i64
          %4684 = func.call @cc_values_pack(%4683) : (i64) -> i64
          %4685 = func.call @cc_set_symbol_value(%4681, %4676) : (i64, i64) -> i64
          %4686 = llvm.mlir.addressof @str604 : !llvm.ptr
          %4687 = arith.constant 39 : i64
          %4688 = func.call @cc_make_string(%4686, %4687) : (!llvm.ptr, i64) -> i64
          %4689 = func.call @cc_nil_value() : () -> i64
          %4690 = func.call @cc_intern(%4688, %4689) : (i64, i64) -> i64
          %4691 = func.call @cc_nil_value() : () -> i64
          %4692 = func.call @cc_cons(%4690, %4691) : (i64, i64) -> i64
          %4693 = func.call @cc_values_pack(%4692) : (i64) -> i64
          %4694 = func.call @cc_set_symbol_value(%4690, %4676) : (i64, i64) -> i64
          %4695 = llvm.mlir.addressof @str605 : !llvm.ptr
          %4696 = arith.constant 40 : i64
          %4697 = func.call @cc_make_string(%4695, %4696) : (!llvm.ptr, i64) -> i64
          %4698 = func.call @cc_nil_value() : () -> i64
          %4699 = func.call @cc_intern(%4697, %4698) : (i64, i64) -> i64
          %4700 = func.call @cc_nil_value() : () -> i64
          %4701 = func.call @cc_cons(%4699, %4700) : (i64, i64) -> i64
          %4702 = func.call @cc_values_pack(%4701) : (i64) -> i64
          %4703 = func.call @cc_set_symbol_value(%4699, %4676) : (i64, i64) -> i64
          %4704:3 = scf.while (%arg0 = %4668, %arg1 = %4670, %arg2 = %4669) : (i64, i64, i64) -> (i64, i64, i64) {
            func.call @stack_push_pointer(%arg2) : (i64) -> ()
            %4705 = func.call @stack_pop_pointer() : () -> i64
            %4706 = func.call @cc_nil_value() : () -> i64
            %4707 = arith.cmpi ne, %4705, %4706 : i64
            %4708 = func.call @cc_nil_value() : () -> i64
            %4709 = llvm.mlir.addressof @str606 : !llvm.ptr
            %4710 = arith.constant 38 : i64
            %4711 = func.call @cc_make_string(%4709, %4710) : (!llvm.ptr, i64) -> i64
            %4712 = func.call @cc_nil_value() : () -> i64
            %4713 = func.call @cc_intern(%4711, %4712) : (i64, i64) -> i64
            %4714 = func.call @cc_nil_value() : () -> i64
            %4715 = func.call @cc_cons(%4713, %4714) : (i64, i64) -> i64
            %4716 = func.call @cc_values_pack(%4715) : (i64) -> i64
            %4717 = func.call @cc_symbol_value(%4713) : (i64) -> i64
            %4718 = arith.cmpi ne, %4717, %4708 : i64
            %4719 = llvm.mlir.addressof @str607 : !llvm.ptr
            %4720 = arith.constant 38 : i64
            %4721 = func.call @cc_make_string(%4719, %4720) : (!llvm.ptr, i64) -> i64
            %4722 = func.call @cc_nil_value() : () -> i64
            %4723 = func.call @cc_intern(%4721, %4722) : (i64, i64) -> i64
            %4724 = func.call @cc_nil_value() : () -> i64
            %4725 = func.call @cc_cons(%4723, %4724) : (i64, i64) -> i64
            %4726 = func.call @cc_values_pack(%4725) : (i64) -> i64
            %4727 = func.call @cc_symbol_value(%4723) : (i64) -> i64
            %4728 = arith.cmpi ne, %4727, %4708 : i64
            %4729 = arith.ori %4718, %4728 : i1
            %4730 = arith.constant 0 : i1
            %4731 = arith.cmpi eq, %4729, %4730 : i1
            %4732 = arith.andi %4707, %4731 : i1
            scf.condition(%4732) %arg0, %arg1, %arg2 : i64, i64, i64
          } do {
            ^bb0(%4733: i64, %4734: i64, %4735: i64):
            %4736 = func.call @cc_nil_value() : () -> i64
            %4737 = func.call @cc_nil_value() : () -> i64
            %4738 = func.call @cc_errorp(%4736) : (i64) -> i64
            %4739 = arith.cmpi ne, %4738, %4737 : i64
            %4740:3 = scf.if %4739 -> (i64, i64, i64) {
              scf.yield %4736, %4734, %4733 : i64, i64, i64
            } else {
              %4741 = func.call @cc_nil_value() : () -> i64
              func.call @stack_push_pointer(%4735) : (i64) -> ()
              %4742 = func.call @stack_pop_pointer() : () -> i64
              %4743 = func.call @cc_nil_value() : () -> i64
              %4744 = arith.cmpi eq, %4742, %4743 : i64
              %4746 = func.call @cc_t_value() : () -> i64
              %4745 = arith.select %4744, %4746, %4743 : i64
              func.call @stack_push_pointer(%4745) : (i64) -> ()
              %4747 = func.call @stack_pop_pointer() : () -> i64
              %4748 = func.call @cc_nil_value() : () -> i64
              %4749 = func.call @cc_cons(%4747, %4748) : (i64, i64) -> i64
              %4750 = func.call @cc_not(%4749) : (i64) -> i64
              func.call @stack_push_pointer(%4750) : (i64) -> ()
              %4751 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%4735) : (i64) -> ()
              %4752 = func.call @stack_pop_pointer() : () -> i64
              %4753 = func.call @cc_is_cons(%4752) : (i64) -> i32
              %4754 = arith.constant 0 : i32
              %4755 = arith.cmpi ne, %4753, %4754 : i32
              %4756 = func.call @cc_t_value() : () -> i64
              %4757 = func.call @cc_nil_value() : () -> i64
              %4758 = arith.select %4755, %4756, %4757 : i64
              func.call @stack_push_pointer(%4758) : (i64) -> ()
              %4759 = func.call @stack_pop_pointer() : () -> i64
              %4760 = func.call @cc_nil_value() : () -> i64
              %4761 = func.call @cc_cons(%4759, %4760) : (i64, i64) -> i64
              %4762 = func.call @cc_not(%4761) : (i64) -> i64
              func.call @stack_push_pointer(%4762) : (i64) -> ()
              %4763 = func.call @stack_pop_pointer() : () -> i64
              %4764 = func.call @cc_cons(%4763, %4741) : (i64, i64) -> i64
              %4765 = func.call @cc_cons(%4751, %4764) : (i64, i64) -> i64
              %4766 = func.call @cc_and(%4765) : (i64) -> i64
              func.call @stack_push_pointer(%4766) : (i64) -> ()
              %4767 = func.call @stack_pop_pointer() : () -> i64
              %4768 = func.call @cc_nil_value() : () -> i64
              %4769 = arith.cmpi ne, %4767, %4768 : i64
              scf.if %4769 {
                %4770 = llvm.mlir.addressof @str608 : !llvm.ptr
                %4771 = arith.constant 10 : i64
                %4772 = func.call @cc_make_string(%4770, %4771) : (!llvm.ptr, i64) -> i64
                %4773 = func.call @cc_nil_value() : () -> i64
                %4774 = func.call @cc_intern(%4772, %4773) : (i64, i64) -> i64
                %4775 = func.call @cc_nil_value() : () -> i64
                %4776 = func.call @cc_cons(%4774, %4775) : (i64, i64) -> i64
                %4777 = func.call @cc_values_pack(%4776) : (i64) -> i64
                func.call @stack_push_pointer(%4774) : (i64) -> ()
                %4778 = func.call @stack_pop_pointer() : () -> i64
                %4779 = func.call @cc_nil_value() : () -> i64
                %4780 = func.call @cc_errorp(%4778) : (i64) -> i64
                %4781 = arith.cmpi ne, %4780, %4779 : i64
                %4782 = arith.cmpi eq, %4779, %4779 : i64
                %4783 = arith.andi %4781, %4782 : i1
                %4784 = scf.if %4783 -> (i64) {
                  scf.yield %4778 : i64
                } else {
                  scf.yield %4779 : i64
                }
                %4785 = arith.cmpi ne, %4784, %4779 : i64
                scf.if %4785 {
                  func.call @stack_push_pointer(%4784) : (i64) -> ()
                } else {
                  func.call @stack_push_pointer(%4778) : (i64) -> ()
                  %4786 = llvm.mlir.addressof @str609 : !llvm.ptr
                  %4787 = func.call @cc_make_function_ref_const(%4786) : (!llvm.ptr) -> i64
                  %4788 = arith.constant 1 : i64
                  func.call @cc_funcall_stack(%4787, %4788) : (i64, i64) -> ()
                }
                %4789 = func.call @stack_pop_pointer() : () -> i64
                %4790 = func.call @cc_multiple_value_list(%4789) : (i64) -> i64
                %4791 = func.call @cc_t_value() : () -> i64
                %4792 = llvm.mlir.addressof @str610 : !llvm.ptr
                %4793 = arith.constant 38 : i64
                %4794 = func.call @cc_make_string(%4792, %4793) : (!llvm.ptr, i64) -> i64
                %4795 = func.call @cc_nil_value() : () -> i64
                %4796 = func.call @cc_intern(%4794, %4795) : (i64, i64) -> i64
                %4797 = func.call @cc_nil_value() : () -> i64
                %4798 = func.call @cc_cons(%4796, %4797) : (i64, i64) -> i64
                %4799 = func.call @cc_values_pack(%4798) : (i64) -> i64
                %4800 = func.call @cc_set_symbol_value(%4796, %4791) : (i64, i64) -> i64
                %4801 = llvm.mlir.addressof @str611 : !llvm.ptr
                %4802 = arith.constant 39 : i64
                %4803 = func.call @cc_make_string(%4801, %4802) : (!llvm.ptr, i64) -> i64
                %4804 = func.call @cc_nil_value() : () -> i64
                %4805 = func.call @cc_intern(%4803, %4804) : (i64, i64) -> i64
                %4806 = func.call @cc_nil_value() : () -> i64
                %4807 = func.call @cc_cons(%4805, %4806) : (i64, i64) -> i64
                %4808 = func.call @cc_values_pack(%4807) : (i64) -> i64
                %4809 = func.call @cc_set_symbol_value(%4805, %4789) : (i64, i64) -> i64
                %4810 = llvm.mlir.addressof @str612 : !llvm.ptr
                %4811 = arith.constant 40 : i64
                %4812 = func.call @cc_make_string(%4810, %4811) : (!llvm.ptr, i64) -> i64
                %4813 = func.call @cc_nil_value() : () -> i64
                %4814 = func.call @cc_intern(%4812, %4813) : (i64, i64) -> i64
                %4815 = func.call @cc_nil_value() : () -> i64
                %4816 = func.call @cc_cons(%4814, %4815) : (i64, i64) -> i64
                %4817 = func.call @cc_values_pack(%4816) : (i64) -> i64
                %4818 = func.call @cc_set_symbol_value(%4814, %4790) : (i64, i64) -> i64
                func.call @stack_push_pointer(%4789) : (i64) -> ()
              } else {
                func.call @stack_push_nil() : () -> ()
              }
              %4819 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %4819, %4734, %4733 : i64, i64, i64
            }
            %4820 = func.call @cc_nil_value() : () -> i64
            %4821 = func.call @cc_errorp(%4740#0) : (i64) -> i64
            %4822 = arith.cmpi ne, %4821, %4820 : i64
            %4823:3 = scf.if %4822 -> (i64, i64, i64) {
              scf.yield %4740#0, %4740#1, %4740#2 : i64, i64, i64
            } else {
              func.call @stack_push_pointer(%4735) : (i64) -> ()
              %4824 = func.call @stack_pop_pointer() : () -> i64
              %4825 = func.call @cc_car(%4824) : (i64) -> i64
              func.call @stack_push_pointer(%4825) : (i64) -> ()
              %4826 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%4826) : (i64) -> ()
              %4827 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %4827, %4740#1, %4826 : i64, i64, i64
            }
            %4828 = func.call @cc_nil_value() : () -> i64
            %4829 = func.call @cc_errorp(%4823#0) : (i64) -> i64
            %4830 = arith.cmpi ne, %4829, %4828 : i64
            %4831:3 = scf.if %4830 -> (i64, i64, i64) {
              scf.yield %4823#0, %4823#1, %4823#2 : i64, i64, i64
            } else {
              %4832 = llvm.mlir.addressof @str613 : !llvm.ptr
              %4833 = arith.constant 4 : i64
              %4834 = func.call @cc_make_string(%4832, %4833) : (!llvm.ptr, i64) -> i64
              %4835 = llvm.mlir.addressof @str614 : !llvm.ptr
              %4836 = arith.constant 11 : i64
              %4837 = func.call @cc_make_string(%4835, %4836) : (!llvm.ptr, i64) -> i64
              %4838 = func.call @cc_intern(%4834, %4837) : (i64, i64) -> i64
              %4839 = func.call @cc_nil_value() : () -> i64
              %4840 = func.call @cc_cons(%4838, %4839) : (i64, i64) -> i64
              %4841 = func.call @cc_values_pack(%4840) : (i64) -> i64
              func.call @stack_push_pointer(%4838) : (i64) -> ()
              func.call @stack_push_pointer(%4823#2) : (i64) -> ()
              func.call @stack_push_nil() : () -> ()
              %4842 = func.call @stack_pop_pointer() : () -> i64
              %4843 = func.call @stack_pop_pointer() : () -> i64
              %4844 = func.call @cc_cons(%4843, %4842) : (i64, i64) -> i64
              func.call @stack_push_pointer(%4844) : (i64) -> ()
              %4845 = func.call @stack_pop_pointer() : () -> i64
              %4846 = func.call @stack_pop_pointer() : () -> i64
              %4847 = func.call @cc_cons(%4846, %4845) : (i64, i64) -> i64
              func.call @stack_push_pointer(%4847) : (i64) -> ()
              %4848 = func.call @stack_pop_pointer() : () -> i64
              %4849 = func.call @cc_fboundp(%4848) : (i64) -> i64
              func.call @stack_push_pointer(%4849) : (i64) -> ()
              %4850 = func.call @stack_pop_pointer() : () -> i64
              %4851 = func.call @cc_nil_value() : () -> i64
              %4852 = arith.cmpi ne, %4850, %4851 : i64
              %4853:2 = scf.if %4852 -> (i64, i64) {
                %4854 = func.call @cc_nil_value() : () -> i64
                %4855 = func.call @cc_nil_value() : () -> i64
                %4856 = func.call @cc_errorp(%4854) : (i64) -> i64
                %4857 = arith.cmpi ne, %4856, %4855 : i64
                %4858:2 = scf.if %4857 -> (i64, i64) {
                  scf.yield %4854, %4823#1 : i64, i64
                } else {
                  func.call @stack_push_pointer(%4823#1) : (i64) -> ()
                  func.call @stack_push_pointer(%4823#2) : (i64) -> ()
                  %4859 = func.call @stack_pop_pointer() : () -> i64
                  %4860 = func.call @cc_nil_value() : () -> i64
                  %4861 = func.call @cc_errorp(%4859) : (i64) -> i64
                  %4862 = arith.cmpi ne, %4861, %4860 : i64
                  %4863 = arith.cmpi eq, %4860, %4860 : i64
                  %4864 = arith.andi %4862, %4863 : i1
                  %4865 = scf.if %4864 -> (i64) {
                    scf.yield %4859 : i64
                  } else {
                    scf.yield %4860 : i64
                  }
                  %4866 = arith.cmpi ne, %4865, %4860 : i64
                  scf.if %4866 {
                    func.call @stack_push_pointer(%4865) : (i64) -> ()
                  } else {
                    %4867 = func.call @cc_nil_value() : () -> i64
                    func.call @stack_push_pointer(%4867) : (i64) -> ()
                    func.call @stack_push_pointer(%4859) : (i64) -> ()
                    %4868 = func.call @stack_pop_pointer() : () -> i64
                    %4869 = func.call @stack_pop_pointer() : () -> i64
                    %4870 = func.call @cc_cons(%4868, %4869) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%4870) : (i64) -> ()
                  }
                  %4871 = func.call @stack_pop_pointer() : () -> i64
                  %4872 = func.call @stack_pop_pointer() : () -> i64
                  %4873 = func.call @cc_append(%4872, %4871) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%4873) : (i64) -> ()
                  %4874 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%4874) : (i64) -> ()
                  %4875 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %4875, %4874 : i64, i64
                }
                func.call @stack_push_pointer(%4858#0) : (i64) -> ()
                %4876 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %4876, %4858#1 : i64, i64
              } else {
                func.call @stack_push_nil() : () -> ()
                %4877 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %4877, %4823#1 : i64, i64
              }
              func.call @stack_push_pointer(%4853#0) : (i64) -> ()
              %4878 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %4878, %4853#1, %4823#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%4831#0) : (i64) -> ()
            %4879 = func.call @stack_depth() : () -> i64
            %4880 = arith.constant 0 : i64
            %4881 = arith.cmpi sgt, %4879, %4880 : i64
            scf.if %4881 {
              %4882 = func.call @stack_pop_pointer() : () -> i64
            }
            func.call @stack_push_pointer(%4735) : (i64) -> ()
            %4883 = func.call @stack_pop_pointer() : () -> i64
            %4884 = func.call @cc_cdr(%4883) : (i64) -> i64
            func.call @stack_push_pointer(%4884) : (i64) -> ()
            %4885 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%4885) : (i64) -> ()
            %4886 = func.call @stack_depth() : () -> i64
            %4887 = arith.constant 0 : i64
            %4888 = arith.cmpi sgt, %4886, %4887 : i64
            scf.if %4888 {
              %4889 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %4831#2, %4831#1, %4885 : i64, i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %4890 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%4704#1) : (i64) -> ()
          %4891 = func.call @stack_pop_pointer() : () -> i64
          %4892 = func.call @cc_multiple_value_list(%4891) : (i64) -> i64
          %4893 = llvm.mlir.addressof @str615 : !llvm.ptr
          %4894 = arith.constant 38 : i64
          %4895 = func.call @cc_make_string(%4893, %4894) : (!llvm.ptr, i64) -> i64
          %4896 = func.call @cc_nil_value() : () -> i64
          %4897 = func.call @cc_intern(%4895, %4896) : (i64, i64) -> i64
          %4898 = func.call @cc_nil_value() : () -> i64
          %4899 = func.call @cc_cons(%4897, %4898) : (i64, i64) -> i64
          %4900 = func.call @cc_values_pack(%4899) : (i64) -> i64
          %4901 = func.call @cc_symbol_value(%4897) : (i64) -> i64
          %4902 = llvm.mlir.addressof @str616 : !llvm.ptr
          %4903 = arith.constant 39 : i64
          %4904 = func.call @cc_make_string(%4902, %4903) : (!llvm.ptr, i64) -> i64
          %4905 = func.call @cc_nil_value() : () -> i64
          %4906 = func.call @cc_intern(%4904, %4905) : (i64, i64) -> i64
          %4907 = func.call @cc_nil_value() : () -> i64
          %4908 = func.call @cc_cons(%4906, %4907) : (i64, i64) -> i64
          %4909 = func.call @cc_values_pack(%4908) : (i64) -> i64
          %4910 = func.call @cc_symbol_value(%4906) : (i64) -> i64
          %4911 = llvm.mlir.addressof @str617 : !llvm.ptr
          %4912 = arith.constant 40 : i64
          %4913 = func.call @cc_make_string(%4911, %4912) : (!llvm.ptr, i64) -> i64
          %4914 = func.call @cc_nil_value() : () -> i64
          %4915 = func.call @cc_intern(%4913, %4914) : (i64, i64) -> i64
          %4916 = func.call @cc_nil_value() : () -> i64
          %4917 = func.call @cc_cons(%4915, %4916) : (i64, i64) -> i64
          %4918 = func.call @cc_values_pack(%4917) : (i64) -> i64
          %4919 = func.call @cc_symbol_value(%4915) : (i64) -> i64
          %4920 = func.call @cc_nil_value() : () -> i64
          %4921 = arith.cmpi ne, %4901, %4920 : i64
          %4922 = scf.if %4921 -> (i64) {
            scf.yield %4919 : i64
          } else {
            scf.yield %4892 : i64
          }
          %4923 = func.call @cc_values_pack(%4922) : (i64) -> i64
          func.call @stack_push_pointer(%4923) : (i64) -> ()
          %4924 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %4924 : i64
        }
        func.call @stack_push_pointer(%4675) : (i64) -> ()
        %4925 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4925 : i64
      }
      func.call @stack_push_pointer(%4667) : (i64) -> ()
      %4926 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4926 : i64
    }
    func.call @stack_push_pointer(%3894) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_120590987952128*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_120590987952128*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("MOP.GENERICS.FBOUNDP\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str6("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("MOP-GENERIC-NAMES\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str8("ACCESSOR-METHOD-SLOT-DEFINITION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str9("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str10("ADD-DEPENDENT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str11("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str12("ADD-DIRECT-METHOD\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str13("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str14("ADD-DIRECT-SUBCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str15("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str16("CLASS-DEFAULT-INITARGS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str17("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str18("CLASS-DIRECT-DEFAULT-INITARGS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str19("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str20("CLASS-DIRECT-SLOTS\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str21("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str22("CLASS-DIRECT-SUBCLASSES\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str23("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str24("CLASS-DIRECT-SUPERCLASSES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str25("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("CLASS-FINALIZED-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str27("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str28("CLASS-PRECEDENCE-LIST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str29("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str30("CLASS-PROTOTYPE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str31("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str32("CLASS-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str34("COMPUTE-APPLICABLE-METHODS-USING-CLASSES\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str35("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str36("COMPUTE-CLASS-PRECEDENCE-LIST\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str37("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str38("COMPUTE-DISCRIMINATING-FUNCTION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str39("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str40("COMPUTE-EFFECTIVE-METHOD\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str41("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("COMPUTE-EFFECTIVE-SLOT-DEFINITION\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str43("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str44("COMPUTE-SLOTS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str45("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("DIRECT-SLOT-DEFINITION-CLASS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str47("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("EFFECTIVE-SLOT-DEFINITION-CLASS\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str49("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("ENSURE-CLASS-USING-CLASS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str51("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str52("ENSURE-GENERIC-FUNCTION-USING-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str53("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str54("FINALIZE-INHERITANCE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str55("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str56("FIND-METHOD-COMBINATION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str57("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str58("GENERIC-FUNCTION-ARGUMENT-PRECEDENCE-ORDER\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str59("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str60("GENERIC-FUNCTION-LAMBDA-LIST\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str61("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str62("GENERIC-FUNCTION-METHOD-CLASS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str63("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str64("GENERIC-FUNCTION-METHOD-COMBINATION\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str65("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str66("GENERIC-FUNCTION-METHODS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str67("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str68("GENERIC-FUNCTION-NAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str69("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str70("MAKE-METHOD-LAMBDA\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str71("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("MAP-DEPENDENTS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str73("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str74("METHOD-FUNCTION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str75("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("METHOD-GENERIC-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str77("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str78("METHOD-LAMBDA-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str79("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str80("METHOD-SPECIALIZERS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str81("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str82("METHOD-QUALIFIERS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str83("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str84("SLOT-DEFINITION-ALLOCATION\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str85("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str86("SLOT-DEFINITION-INITFUNCTION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str87("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str88("SLOT-DEFINITION-INITFORM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str89("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str90("SLOT-DEFINITION-NAME\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str91("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str92("SLOT-DEFINITION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str93("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str94("SLOT-DEFINITION-READERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str95("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str96("SLOT-DEFINITION-WRITERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str97("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str98("SLOT-DEFINITION-LOCATION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str99("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str100("READER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str101("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str102("REMOVE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str103("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str104("REMOVE-DIRECT-METHOD\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str105("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str106("REMOVE-DIRECT-SUBCLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str107("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str108("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("GENERIC-FUNCTION-NAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str111("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str112("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str113("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("SLOT-VALUE-USING-CLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str115("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str116("SLOT-BOUNDP-USING-CLASS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str117("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str118("SLOT-MAKUNBOUND-USING-CLASS\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str119("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str120("SLOT-VALUE-USING-CLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str121("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str122("SPECIALIZER-DIRECT-GENERIC-FUNCTIONS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str123("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str124("SPECIALIZER-DIRECT-METHODS\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str125("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str126("UPDATE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str127("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str128("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str129("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str130("WRITER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str131("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str132("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str133("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str134("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str135("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str136("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str137("MOP-GENERIC-NAMES\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str138("UNLESS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str139("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("FBOUNDP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str143("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str145("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str146("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("FDEFINITION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str148("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str149("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str150("GENERIC-FUNCTION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str153("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str155("ACCESSOR-METHOD-SLOT-DEFINITION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str156("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str157("ADD-DEPENDENT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str158("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str159("ADD-DIRECT-METHOD\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str160("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str161("ADD-DIRECT-SUBCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str162("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str163("CLASS-DEFAULT-INITARGS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str164("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str165("CLASS-DIRECT-DEFAULT-INITARGS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str166("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str167("CLASS-DIRECT-SLOTS\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str168("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str169("CLASS-DIRECT-SUBCLASSES\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str170("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str171("CLASS-DIRECT-SUPERCLASSES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str172("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str173("CLASS-FINALIZED-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str174("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str175("CLASS-PRECEDENCE-LIST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str176("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("CLASS-PROTOTYPE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str178("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str179("CLASS-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str180("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str181("COMPUTE-APPLICABLE-METHODS-USING-CLASSES\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str182("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str183("COMPUTE-CLASS-PRECEDENCE-LIST\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str184("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str185("COMPUTE-DISCRIMINATING-FUNCTION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str186("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("COMPUTE-EFFECTIVE-METHOD\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str188("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str189("COMPUTE-EFFECTIVE-SLOT-DEFINITION\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str190("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str191("COMPUTE-SLOTS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str192("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str193("DIRECT-SLOT-DEFINITION-CLASS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str194("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str195("EFFECTIVE-SLOT-DEFINITION-CLASS\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str196("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str197("ENSURE-CLASS-USING-CLASS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str198("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str199("ENSURE-GENERIC-FUNCTION-USING-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str200("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str201("FINALIZE-INHERITANCE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str202("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str203("FIND-METHOD-COMBINATION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str204("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str205("GENERIC-FUNCTION-ARGUMENT-PRECEDENCE-ORDER\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str206("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str207("GENERIC-FUNCTION-LAMBDA-LIST\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str208("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str209("GENERIC-FUNCTION-METHOD-CLASS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str210("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str211("GENERIC-FUNCTION-METHOD-COMBINATION\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str212("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str213("GENERIC-FUNCTION-METHODS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str214("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str215("GENERIC-FUNCTION-NAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str216("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str217("MAKE-METHOD-LAMBDA\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str218("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str219("MAP-DEPENDENTS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str220("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str221("METHOD-FUNCTION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str222("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str223("METHOD-GENERIC-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str224("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str225("METHOD-LAMBDA-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str226("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str227("METHOD-SPECIALIZERS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str228("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str229("METHOD-QUALIFIERS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str230("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str231("SLOT-DEFINITION-ALLOCATION\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str232("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str233("SLOT-DEFINITION-INITFUNCTION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str234("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str235("SLOT-DEFINITION-INITFORM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str236("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str237("SLOT-DEFINITION-NAME\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str238("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str239("SLOT-DEFINITION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str240("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str241("SLOT-DEFINITION-READERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str242("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str243("SLOT-DEFINITION-WRITERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str244("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str245("SLOT-DEFINITION-LOCATION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str246("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str247("READER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str248("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str249("REMOVE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str250("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str251("REMOVE-DIRECT-METHOD\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str252("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str253("REMOVE-DIRECT-SUBCLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str254("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str255("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str256("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str257("GENERIC-FUNCTION-NAME\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str258("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str259("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str260("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str261("SLOT-VALUE-USING-CLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str262("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str263("SLOT-BOUNDP-USING-CLASS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str264("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str265("SLOT-MAKUNBOUND-USING-CLASS\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str266("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str267("SLOT-VALUE-USING-CLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str268("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str269("SPECIALIZER-DIRECT-GENERIC-FUNCTIONS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str270("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str271("SPECIALIZER-DIRECT-METHODS\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str272("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str273("UPDATE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str274("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str275("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str276("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str277("WRITER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str278("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str279("*__MLIR_BLOCK_RETFLAG_120590987952130*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str280("*__MLIR_BLOCK_RETVALUE_120590987952130*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str281("*__MLIR_BLOCK_RETMVLIST_120590987952130*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str282("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str283("*__MLIR_BLOCK_RETFLAG_120590987952130*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str284("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str285("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str286("*__MLIR_BLOCK_RETFLAG_120590987952130*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str287("*__MLIR_BLOCK_RETVALUE_120590987952130*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str288("*__MLIR_BLOCK_RETMVLIST_120590987952130*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str289("GENERIC-FUNCTION\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str290("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("*__MLIR_BLOCK_RETFLAG_120590987952130*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str292("*__MLIR_BLOCK_RETVALUE_120590987952130*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str293("*__MLIR_BLOCK_RETMVLIST_120590987952130*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str294("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str295("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str296("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str297("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str298("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str299("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str300("MOP.NONGENERICS.FBOUNDP\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str301("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str302("NONGENERIC-NAMES\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str303("EQL-SPECIALIZER-OBJECT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str304("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str305("EXTRACT-LAMBDA-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str306("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str307("EXTRACT-SPECIALIZER-NAMES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str308("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str309("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str310("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str311("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str312("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str313("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str314("NONGENERIC-NAMES\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str315("UNLESS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str316("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str317("FBOUNDP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str318("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str319("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str320("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str321("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str322("EQL-SPECIALIZER-OBJECT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str323("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str324("EXTRACT-LAMBDA-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str325("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str326("EXTRACT-SPECIALIZER-NAMES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str327("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str328("*__MLIR_BLOCK_RETFLAG_120590987952132*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str329("*__MLIR_BLOCK_RETVALUE_120590987952132*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str330("*__MLIR_BLOCK_RETMVLIST_120590987952132*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str331("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str332("*__MLIR_BLOCK_RETFLAG_120590987952132*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str333("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str334("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str335("*__MLIR_BLOCK_RETFLAG_120590987952132*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str336("*__MLIR_BLOCK_RETVALUE_120590987952132*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str337("*__MLIR_BLOCK_RETMVLIST_120590987952132*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str338("*__MLIR_BLOCK_RETFLAG_120590987952132*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str339("*__MLIR_BLOCK_RETVALUE_120590987952132*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str340("*__MLIR_BLOCK_RETMVLIST_120590987952132*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str341("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str342("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str343("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str344("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str345("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str346("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str347("MOP.WRITERS.NONFBOUNDP\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str348("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str349("NONWRITERS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str350("ACCESSOR-METHOD-SLOT-DEFINITION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str351("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str352("ADD-DEPENDENT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str353("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str354("ADD-DIRECT-METHOD\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str355("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str356("ADD-DIRECT-SUBCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str357("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str358("CLASS-DEFAULT-INITARGS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str359("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str360("CLASS-DIRECT-DEFAULT-INITARGS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str361("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str362("CLASS-DIRECT-SLOTS\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str363("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str364("CLASS-DIRECT-SUBCLASSES\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str365("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str366("CLASS-DIRECT-SUPERCLASSES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str367("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str368("CLASS-FINALIZED-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str369("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str370("CLASS-PRECEDENCE-LIST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str371("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str372("CLASS-PROTOTYPE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str373("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str374("CLASS-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str375("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str376("COMPUTE-APPLICABLE-METHODS-USING-CLASSES\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str377("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str378("COMPUTE-CLASS-PRECEDENCE-LIST\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str379("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str380("COMPUTE-DISCRIMINATING-FUNCTION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str381("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str382("COMPUTE-EFFECTIVE-METHOD\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str383("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str384("COMPUTE-EFFECTIVE-SLOT-DEFINITION\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str385("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str386("COMPUTE-SLOTS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str387("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str388("DIRECT-SLOT-DEFINITION-CLASS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str389("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str390("EFFECTIVE-SLOT-DEFINITION-CLASS\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str391("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str392("ENSURE-CLASS-USING-CLASS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str393("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str394("ENSURE-GENERIC-FUNCTION-USING-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str395("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str396("FINALIZE-INHERITANCE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str397("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str398("FIND-METHOD-COMBINATION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str399("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str400("GENERIC-FUNCTION-ARGUMENT-PRECEDENCE-ORDER\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str401("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str402("GENERIC-FUNCTION-LAMBDA-LIST\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str403("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str404("GENERIC-FUNCTION-METHOD-CLASS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str405("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str406("GENERIC-FUNCTION-METHOD-COMBINATION\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str407("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str408("GENERIC-FUNCTION-METHODS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str409("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str410("MAKE-METHOD-LAMBDA\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str411("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str412("MAP-DEPENDENTS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str413("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str414("METHOD-FUNCTION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str415("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str416("METHOD-GENERIC-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str417("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str418("METHOD-LAMBDA-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str419("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str420("METHOD-SPECIALIZERS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str421("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str422("METHOD-QUALIFIERS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str423("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str424("SLOT-DEFINITION-ALLOCATION\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str425("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str426("SLOT-DEFINITION-INITFUNCTION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str427("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str428("SLOT-DEFINITION-INITFORM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str429("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str430("SLOT-DEFINITION-NAME\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str431("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str432("SLOT-DEFINITION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str433("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str434("SLOT-DEFINITION-READERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str435("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str436("SLOT-DEFINITION-WRITERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str437("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str438("SLOT-DEFINITION-LOCATION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str439("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str440("READER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str441("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str442("REMOVE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str443("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str444("REMOVE-DIRECT-METHOD\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str445("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str446("REMOVE-DIRECT-SUBCLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str447("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str448("SLOT-BOUNDP-USING-CLASS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str449("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str450("SLOT-MAKUNBOUND-USING-CLASS\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str451("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str452("SPECIALIZER-DIRECT-GENERIC-FUNCTIONS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str453("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str454("SPECIALIZER-DIRECT-METHODS\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str455("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str456("UPDATE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str457("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str458("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str459("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str460("WRITER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str461("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str462("EQL-SPECIALIZER-OBJECT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str463("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str464("EXTRACT-LAMBDA-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str465("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str466("EXTRACT-SPECIALIZER-NAMES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str467("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str468("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str469("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str470("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str471("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str472("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str473("NONWRITERS\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str474("WHEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str475("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str476("FBOUNDP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str477("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str478("BACKQUOTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str479("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str480("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str481("UNQUOTE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str482("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str483("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str484("N\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str485("ACCESSOR-METHOD-SLOT-DEFINITION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str486("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str487("ADD-DEPENDENT\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str488("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str489("ADD-DIRECT-METHOD\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str490("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str491("ADD-DIRECT-SUBCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str492("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str493("CLASS-DEFAULT-INITARGS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str494("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str495("CLASS-DIRECT-DEFAULT-INITARGS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str496("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str497("CLASS-DIRECT-SLOTS\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str498("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str499("CLASS-DIRECT-SUBCLASSES\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str500("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str501("CLASS-DIRECT-SUPERCLASSES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str502("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str503("CLASS-FINALIZED-P\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str504("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str505("CLASS-PRECEDENCE-LIST\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str506("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str507("CLASS-PROTOTYPE\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str508("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str509("CLASS-SLOTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str510("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str511("COMPUTE-APPLICABLE-METHODS-USING-CLASSES\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str512("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str513("COMPUTE-CLASS-PRECEDENCE-LIST\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str514("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str515("COMPUTE-DISCRIMINATING-FUNCTION\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str516("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str517("COMPUTE-EFFECTIVE-METHOD\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str518("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str519("COMPUTE-EFFECTIVE-SLOT-DEFINITION\00") : !llvm.array<34 x i8>
  llvm.mlir.global private constant @str520("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str521("COMPUTE-SLOTS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str522("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str523("DIRECT-SLOT-DEFINITION-CLASS\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str524("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str525("EFFECTIVE-SLOT-DEFINITION-CLASS\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str526("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str527("ENSURE-CLASS-USING-CLASS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str528("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str529("ENSURE-GENERIC-FUNCTION-USING-CLASS\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str530("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str531("FINALIZE-INHERITANCE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str532("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str533("FIND-METHOD-COMBINATION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str534("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str535("GENERIC-FUNCTION-ARGUMENT-PRECEDENCE-ORDER\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str536("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str537("GENERIC-FUNCTION-LAMBDA-LIST\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str538("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str539("GENERIC-FUNCTION-METHOD-CLASS\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str540("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str541("GENERIC-FUNCTION-METHOD-COMBINATION\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str542("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str543("GENERIC-FUNCTION-METHODS\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str544("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str545("MAKE-METHOD-LAMBDA\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str546("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str547("MAP-DEPENDENTS\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str548("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str549("METHOD-FUNCTION\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str550("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str551("METHOD-GENERIC-FUNCTION\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str552("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str553("METHOD-LAMBDA-LIST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str554("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str555("METHOD-SPECIALIZERS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str556("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str557("METHOD-QUALIFIERS\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str558("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str559("SLOT-DEFINITION-ALLOCATION\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str560("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str561("SLOT-DEFINITION-INITFUNCTION\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str562("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str563("SLOT-DEFINITION-INITFORM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str564("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str565("SLOT-DEFINITION-NAME\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str566("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str567("SLOT-DEFINITION-TYPE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str568("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str569("SLOT-DEFINITION-READERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str570("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str571("SLOT-DEFINITION-WRITERS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str572("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str573("SLOT-DEFINITION-LOCATION\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str574("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str575("READER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str576("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str577("REMOVE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str578("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str579("REMOVE-DIRECT-METHOD\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str580("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str581("REMOVE-DIRECT-SUBCLASS\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str582("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str583("SLOT-BOUNDP-USING-CLASS\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str584("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str585("SLOT-MAKUNBOUND-USING-CLASS\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str586("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str587("SPECIALIZER-DIRECT-GENERIC-FUNCTIONS\00") : !llvm.array<37 x i8>
  llvm.mlir.global private constant @str588("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str589("SPECIALIZER-DIRECT-METHODS\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str590("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str591("UPDATE-DEPENDENT\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str592("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str593("VALIDATE-SUPERCLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str594("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str595("WRITER-METHOD-CLASS\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str596("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str597("EQL-SPECIALIZER-OBJECT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str598("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str599("EXTRACT-LAMBDA-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str600("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str601("EXTRACT-SPECIALIZER-NAMES\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str602("CLOS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str603("*__MLIR_BLOCK_RETFLAG_120590987952134*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str604("*__MLIR_BLOCK_RETVALUE_120590987952134*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str605("*__MLIR_BLOCK_RETMVLIST_120590987952134*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str606("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str607("*__MLIR_BLOCK_RETFLAG_120590987952134*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str608("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str609("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str610("*__MLIR_BLOCK_RETFLAG_120590987952134*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str611("*__MLIR_BLOCK_RETVALUE_120590987952134*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str612("*__MLIR_BLOCK_RETMVLIST_120590987952134*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str613("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str614("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str615("*__MLIR_BLOCK_RETFLAG_120590987952134*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str616("*__MLIR_BLOCK_RETVALUE_120590987952134*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str617("*__MLIR_BLOCK_RETMVLIST_120590987952134*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str618("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str619("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str620("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str621("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str622("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str623("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str624("*__MLIR_BLOCK_RETFLAG_120590987952128*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str625("*__MLIR_BLOCK_RETMVLIST_120590987952128*\00") : !llvm.array<41 x i8>
}
