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
      %58 = arith.constant 31 : i64
      %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_intern(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = llvm.mlir.addressof @str6 : !llvm.ptr
      %67 = arith.constant 4 : i64
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
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %82 = func.call @stack_pop_pointer() : () -> i64
      %83 = func.call @stack_pop_pointer() : () -> i64
      %84 = func.call @cc_cons(%83, %82) : (i64, i64) -> i64
      func.call @stack_push_pointer(%84) : (i64) -> ()
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = func.call @stack_pop_pointer() : () -> i64
      %87 = func.call @cc_cons(%86, %85) : (i64, i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      %88 = llvm.mlir.addressof @str8 : !llvm.ptr
      %89 = arith.constant 15 : i64
      %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
      %91 = func.call @cc_nil_value() : () -> i64
      %92 = func.call @cc_intern(%90, %91) : (i64, i64) -> i64
      %93 = func.call @cc_nil_value() : () -> i64
      %94 = func.call @cc_cons(%92, %93) : (i64, i64) -> i64
      %95 = func.call @cc_values_pack(%94) : (i64) -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      %96 = llvm.mlir.addressof @str9 : !llvm.ptr
      %97 = arith.constant 4 : i64
      %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
      %99 = llvm.mlir.addressof @str10 : !llvm.ptr
      %100 = arith.constant 11 : i64
      %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
      %102 = func.call @cc_intern(%98, %101) : (i64, i64) -> i64
      %103 = func.call @cc_nil_value() : () -> i64
      %104 = func.call @cc_cons(%102, %103) : (i64, i64) -> i64
      %105 = func.call @cc_values_pack(%104) : (i64) -> i64
      func.call @stack_push_pointer(%102) : (i64) -> ()
      %106 = llvm.mlir.addressof @str11 : !llvm.ptr
      %107 = arith.constant 26 : i64
      %108 = func.call @cc_make_string(%106, %107) : (!llvm.ptr, i64) -> i64
      %109 = llvm.mlir.addressof @str12 : !llvm.ptr
      %110 = arith.constant 11 : i64
      %111 = func.call @cc_make_string(%109, %110) : (!llvm.ptr, i64) -> i64
      %112 = func.call @cc_intern(%108, %111) : (i64, i64) -> i64
      %113 = func.call @cc_nil_value() : () -> i64
      %114 = func.call @cc_cons(%112, %113) : (i64, i64) -> i64
      %115 = func.call @cc_values_pack(%114) : (i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %116 = arith.constant -3.0 : f64
      %117 = func.call @cc_box_single_float(%116) : (f64) -> i64
      func.call @stack_push_pointer(%117) : (i64) -> ()
      %118 = arith.constant 0.0 : f64
      %119 = func.call @cc_box_single_float(%118) : (f64) -> i64
      func.call @stack_push_pointer(%119) : (i64) -> ()
      %120 = arith.constant 3.0 : f64
      %121 = func.call @cc_box_single_float(%120) : (f64) -> i64
      func.call @stack_push_pointer(%121) : (i64) -> ()
      %122 = llvm.mlir.addressof @str13 : !llvm.ptr
      %123 = arith.constant 26 : i64
      %124 = func.call @cc_make_string(%122, %123) : (!llvm.ptr, i64) -> i64
      %125 = llvm.mlir.addressof @str14 : !llvm.ptr
      %126 = arith.constant 11 : i64
      %127 = func.call @cc_make_string(%125, %126) : (!llvm.ptr, i64) -> i64
      %128 = func.call @cc_intern(%124, %127) : (i64, i64) -> i64
      %129 = func.call @cc_nil_value() : () -> i64
      %130 = func.call @cc_cons(%128, %129) : (i64, i64) -> i64
      %131 = func.call @cc_values_pack(%130) : (i64) -> i64
      func.call @stack_push_pointer(%128) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %132 = func.call @stack_pop_pointer() : () -> i64
      %133 = func.call @stack_pop_pointer() : () -> i64
      %134 = func.call @cc_cons(%133, %132) : (i64, i64) -> i64
      func.call @stack_push_pointer(%134) : (i64) -> ()
      %135 = func.call @stack_pop_pointer() : () -> i64
      %136 = func.call @stack_pop_pointer() : () -> i64
      %137 = func.call @cc_cons(%136, %135) : (i64, i64) -> i64
      func.call @stack_push_pointer(%137) : (i64) -> ()
      %138 = func.call @stack_pop_pointer() : () -> i64
      %139 = func.call @stack_pop_pointer() : () -> i64
      %140 = func.call @cc_cons(%139, %138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%140) : (i64) -> ()
      %141 = func.call @stack_pop_pointer() : () -> i64
      %142 = func.call @stack_pop_pointer() : () -> i64
      %143 = func.call @cc_cons(%142, %141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%143) : (i64) -> ()
      %144 = func.call @stack_pop_pointer() : () -> i64
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = func.call @cc_cons(%145, %144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%146) : (i64) -> ()
      %147 = func.call @stack_pop_pointer() : () -> i64
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = func.call @cc_cons(%148, %147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %150 = func.call @stack_pop_pointer() : () -> i64
      %151 = func.call @stack_pop_pointer() : () -> i64
      %152 = func.call @cc_cons(%151, %150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%152) : (i64) -> ()
      %153 = func.call @stack_pop_pointer() : () -> i64
      %154 = func.call @stack_pop_pointer() : () -> i64
      %155 = func.call @cc_cons(%154, %153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%155) : (i64) -> ()
      %156 = llvm.mlir.addressof @str15 : !llvm.ptr
      %157 = arith.constant 4 : i64
      %158 = func.call @cc_make_string(%156, %157) : (!llvm.ptr, i64) -> i64
      %159 = func.call @cc_nil_value() : () -> i64
      %160 = func.call @cc_intern(%158, %159) : (i64, i64) -> i64
      %161 = func.call @cc_nil_value() : () -> i64
      %162 = func.call @cc_cons(%160, %161) : (i64, i64) -> i64
      %163 = func.call @cc_values_pack(%162) : (i64) -> i64
      func.call @stack_push_pointer(%160) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %164 = func.call @stack_pop_pointer() : () -> i64
      %165 = func.call @stack_pop_pointer() : () -> i64
      %166 = func.call @cc_cons(%165, %164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%166) : (i64) -> ()
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @cc_cons(%168, %167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%169) : (i64) -> ()
      %170 = llvm.mlir.addressof @str16 : !llvm.ptr
      %171 = arith.constant 15 : i64
      %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
      %173 = func.call @cc_nil_value() : () -> i64
      %174 = func.call @cc_intern(%172, %173) : (i64, i64) -> i64
      %175 = func.call @cc_nil_value() : () -> i64
      %176 = func.call @cc_cons(%174, %175) : (i64, i64) -> i64
      %177 = func.call @cc_values_pack(%176) : (i64) -> i64
      func.call @stack_push_pointer(%174) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %178 = func.call @stack_pop_pointer() : () -> i64
      %179 = func.call @stack_pop_pointer() : () -> i64
      %180 = func.call @cc_cons(%179, %178) : (i64, i64) -> i64
      func.call @stack_push_pointer(%180) : (i64) -> ()
      %181 = func.call @stack_pop_pointer() : () -> i64
      %182 = func.call @stack_pop_pointer() : () -> i64
      %183 = func.call @cc_cons(%182, %181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%183) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %184 = func.call @stack_pop_pointer() : () -> i64
      %185 = func.call @stack_pop_pointer() : () -> i64
      %186 = func.call @cc_cons(%185, %184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      %187 = func.call @stack_pop_pointer() : () -> i64
      %188 = func.call @stack_pop_pointer() : () -> i64
      %189 = func.call @cc_cons(%188, %187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%189) : (i64) -> ()
      %190 = func.call @stack_pop_pointer() : () -> i64
      %191 = func.call @stack_pop_pointer() : () -> i64
      %192 = func.call @cc_cons(%191, %190) : (i64, i64) -> i64
      func.call @stack_push_pointer(%192) : (i64) -> ()
      %193 = func.call @stack_pop_pointer() : () -> i64
      %194 = func.call @stack_pop_pointer() : () -> i64
      %195 = func.call @cc_cons(%194, %193) : (i64, i64) -> i64
      func.call @stack_push_pointer(%195) : (i64) -> ()
      %196 = llvm.mlir.addressof @str17 : !llvm.ptr
      %197 = arith.constant 5 : i64
      %198 = func.call @cc_make_string(%196, %197) : (!llvm.ptr, i64) -> i64
      %199 = func.call @cc_nil_value() : () -> i64
      %200 = func.call @cc_intern(%198, %199) : (i64, i64) -> i64
      %201 = func.call @cc_nil_value() : () -> i64
      %202 = func.call @cc_cons(%200, %201) : (i64, i64) -> i64
      %203 = func.call @cc_values_pack(%202) : (i64) -> i64
      func.call @stack_push_pointer(%200) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %204 = llvm.mlir.addressof @str18 : !llvm.ptr
      %205 = arith.constant 5 : i64
      %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
      %207 = llvm.mlir.addressof @str19 : !llvm.ptr
      %208 = arith.constant 3 : i64
      %209 = func.call @cc_make_string(%207, %208) : (!llvm.ptr, i64) -> i64
      %210 = func.call @cc_intern(%206, %209) : (i64, i64) -> i64
      %211 = func.call @cc_nil_value() : () -> i64
      %212 = func.call @cc_cons(%210, %211) : (i64, i64) -> i64
      %213 = func.call @cc_values_pack(%212) : (i64) -> i64
      func.call @stack_push_pointer(%210) : (i64) -> ()
      %214 = llvm.mlir.addressof @str20 : !llvm.ptr
      %215 = arith.constant 15 : i64
      %216 = func.call @cc_make_string(%214, %215) : (!llvm.ptr, i64) -> i64
      %217 = func.call @cc_nil_value() : () -> i64
      %218 = func.call @cc_intern(%216, %217) : (i64, i64) -> i64
      %219 = func.call @cc_nil_value() : () -> i64
      %220 = func.call @cc_cons(%218, %219) : (i64, i64) -> i64
      %221 = func.call @cc_values_pack(%220) : (i64) -> i64
      func.call @stack_push_pointer(%218) : (i64) -> ()
      %222 = llvm.mlir.addressof @str21 : !llvm.ptr
      %223 = arith.constant 5 : i64
      %224 = func.call @cc_make_string(%222, %223) : (!llvm.ptr, i64) -> i64
      %225 = func.call @cc_nil_value() : () -> i64
      %226 = func.call @cc_intern(%224, %225) : (i64, i64) -> i64
      %227 = func.call @cc_nil_value() : () -> i64
      %228 = func.call @cc_cons(%226, %227) : (i64, i64) -> i64
      %229 = func.call @cc_values_pack(%228) : (i64) -> i64
      func.call @stack_push_pointer(%226) : (i64) -> ()
      %230 = llvm.mlir.addressof @str22 : !llvm.ptr
      %231 = arith.constant 2 : i64
      %232 = func.call @cc_make_string(%230, %231) : (!llvm.ptr, i64) -> i64
      %233 = func.call @cc_nil_value() : () -> i64
      %234 = func.call @cc_intern(%232, %233) : (i64, i64) -> i64
      %235 = func.call @cc_nil_value() : () -> i64
      %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
      %237 = func.call @cc_values_pack(%236) : (i64) -> i64
      func.call @stack_push_pointer(%234) : (i64) -> ()
      %238 = llvm.mlir.addressof @str23 : !llvm.ptr
      %239 = arith.constant 3 : i64
      %240 = func.call @cc_make_string(%238, %239) : (!llvm.ptr, i64) -> i64
      %241 = func.call @cc_nil_value() : () -> i64
      %242 = func.call @cc_intern(%240, %241) : (i64, i64) -> i64
      %243 = func.call @cc_nil_value() : () -> i64
      %244 = func.call @cc_cons(%242, %243) : (i64, i64) -> i64
      %245 = func.call @cc_values_pack(%244) : (i64) -> i64
      func.call @stack_push_pointer(%242) : (i64) -> ()
      %246 = llvm.mlir.addressof @str24 : !llvm.ptr
      %247 = arith.constant 3 : i64
      %248 = func.call @cc_make_string(%246, %247) : (!llvm.ptr, i64) -> i64
      %249 = func.call @cc_nil_value() : () -> i64
      %250 = func.call @cc_intern(%248, %249) : (i64, i64) -> i64
      %251 = func.call @cc_nil_value() : () -> i64
      %252 = func.call @cc_cons(%250, %251) : (i64, i64) -> i64
      %253 = func.call @cc_values_pack(%252) : (i64) -> i64
      func.call @stack_push_pointer(%250) : (i64) -> ()
      %254 = llvm.mlir.addressof @str25 : !llvm.ptr
      %255 = arith.constant 4 : i64
      %256 = func.call @cc_make_string(%254, %255) : (!llvm.ptr, i64) -> i64
      %257 = func.call @cc_nil_value() : () -> i64
      %258 = func.call @cc_intern(%256, %257) : (i64, i64) -> i64
      %259 = func.call @cc_nil_value() : () -> i64
      %260 = func.call @cc_cons(%258, %259) : (i64, i64) -> i64
      %261 = func.call @cc_values_pack(%260) : (i64) -> i64
      func.call @stack_push_pointer(%258) : (i64) -> ()
      %262 = llvm.mlir.addressof @str26 : !llvm.ptr
      %263 = arith.constant 15 : i64
      %264 = func.call @cc_make_string(%262, %263) : (!llvm.ptr, i64) -> i64
      %265 = func.call @cc_nil_value() : () -> i64
      %266 = func.call @cc_intern(%264, %265) : (i64, i64) -> i64
      %267 = func.call @cc_nil_value() : () -> i64
      %268 = func.call @cc_cons(%266, %267) : (i64, i64) -> i64
      %269 = func.call @cc_values_pack(%268) : (i64) -> i64
      func.call @stack_push_pointer(%266) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %270 = func.call @stack_pop_pointer() : () -> i64
      %271 = func.call @stack_pop_pointer() : () -> i64
      %272 = func.call @cc_cons(%271, %270) : (i64, i64) -> i64
      func.call @stack_push_pointer(%272) : (i64) -> ()
      %273 = func.call @stack_pop_pointer() : () -> i64
      %274 = func.call @stack_pop_pointer() : () -> i64
      %275 = func.call @cc_cons(%274, %273) : (i64, i64) -> i64
      func.call @stack_push_pointer(%275) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %276 = func.call @stack_pop_pointer() : () -> i64
      %277 = func.call @stack_pop_pointer() : () -> i64
      %278 = func.call @cc_cons(%277, %276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%278) : (i64) -> ()
      %279 = func.call @stack_pop_pointer() : () -> i64
      %280 = func.call @stack_pop_pointer() : () -> i64
      %281 = func.call @cc_cons(%280, %279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%281) : (i64) -> ()
      %282 = llvm.mlir.addressof @str27 : !llvm.ptr
      %283 = arith.constant 3 : i64
      %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
      %285 = func.call @cc_nil_value() : () -> i64
      %286 = func.call @cc_intern(%284, %285) : (i64, i64) -> i64
      %287 = func.call @cc_nil_value() : () -> i64
      %288 = func.call @cc_cons(%286, %287) : (i64, i64) -> i64
      %289 = func.call @cc_values_pack(%288) : (i64) -> i64
      func.call @stack_push_pointer(%286) : (i64) -> ()
      %290 = llvm.mlir.addressof @str28 : !llvm.ptr
      %291 = arith.constant 5 : i64
      %292 = func.call @cc_make_string(%290, %291) : (!llvm.ptr, i64) -> i64
      %293 = func.call @cc_nil_value() : () -> i64
      %294 = func.call @cc_intern(%292, %293) : (i64, i64) -> i64
      %295 = func.call @cc_nil_value() : () -> i64
      %296 = func.call @cc_cons(%294, %295) : (i64, i64) -> i64
      %297 = func.call @cc_values_pack(%296) : (i64) -> i64
      func.call @stack_push_pointer(%294) : (i64) -> ()
      %298 = llvm.mlir.addressof @str29 : !llvm.ptr
      %299 = arith.constant 15 : i64
      %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
      %301 = func.call @cc_nil_value() : () -> i64
      %302 = func.call @cc_intern(%300, %301) : (i64, i64) -> i64
      %303 = func.call @cc_nil_value() : () -> i64
      %304 = func.call @cc_cons(%302, %303) : (i64, i64) -> i64
      %305 = func.call @cc_values_pack(%304) : (i64) -> i64
      func.call @stack_push_pointer(%302) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @stack_pop_pointer() : () -> i64
      %308 = func.call @cc_cons(%307, %306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      %309 = func.call @stack_pop_pointer() : () -> i64
      %310 = func.call @stack_pop_pointer() : () -> i64
      %311 = func.call @cc_cons(%310, %309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%311) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %312 = func.call @stack_pop_pointer() : () -> i64
      %313 = func.call @stack_pop_pointer() : () -> i64
      %314 = func.call @cc_cons(%313, %312) : (i64, i64) -> i64
      func.call @stack_push_pointer(%314) : (i64) -> ()
      %315 = func.call @stack_pop_pointer() : () -> i64
      %316 = func.call @stack_pop_pointer() : () -> i64
      %317 = func.call @cc_cons(%316, %315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @stack_pop_pointer() : () -> i64
      %320 = func.call @cc_cons(%319, %318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%320) : (i64) -> ()
      %321 = func.call @stack_pop_pointer() : () -> i64
      %322 = func.call @stack_pop_pointer() : () -> i64
      %323 = func.call @cc_cons(%322, %321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%323) : (i64) -> ()
      %324 = func.call @stack_pop_pointer() : () -> i64
      %325 = func.call @stack_pop_pointer() : () -> i64
      %326 = func.call @cc_cons(%325, %324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%326) : (i64) -> ()
      %327 = llvm.mlir.addressof @str30 : !llvm.ptr
      %328 = arith.constant 11 : i64
      %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_intern(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_nil_value() : () -> i64
      %333 = func.call @cc_cons(%331, %332) : (i64, i64) -> i64
      %334 = func.call @cc_values_pack(%333) : (i64) -> i64
      func.call @stack_push_pointer(%331) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %335 = llvm.mlir.addressof @str31 : !llvm.ptr
      %336 = arith.constant 5 : i64
      %337 = func.call @cc_make_string(%335, %336) : (!llvm.ptr, i64) -> i64
      %338 = func.call @cc_nil_value() : () -> i64
      %339 = func.call @cc_intern(%337, %338) : (i64, i64) -> i64
      %340 = func.call @cc_nil_value() : () -> i64
      %341 = func.call @cc_cons(%339, %340) : (i64, i64) -> i64
      %342 = func.call @cc_values_pack(%341) : (i64) -> i64
      func.call @stack_push_pointer(%339) : (i64) -> ()
      %343 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%343) : (i64) -> ()
      %344 = llvm.mlir.addressof @str32 : !llvm.ptr
      %345 = arith.constant 10 : i64
      %346 = func.call @cc_make_string(%344, %345) : (!llvm.ptr, i64) -> i64
      %347 = func.call @cc_nil_value() : () -> i64
      %348 = func.call @cc_intern(%346, %347) : (i64, i64) -> i64
      %349 = func.call @cc_nil_value() : () -> i64
      %350 = func.call @cc_cons(%348, %349) : (i64, i64) -> i64
      %351 = func.call @cc_values_pack(%350) : (i64) -> i64
      func.call @stack_push_pointer(%348) : (i64) -> ()
      %352 = func.call @stack_pop_pointer() : () -> i64
      %353 = func.call @stack_pop_pointer() : () -> i64
      %354 = func.call @cc_cons(%352, %353) : (i64, i64) -> i64
      %355 = llvm.mlir.addressof @str33 : !llvm.ptr
      %356 = arith.constant 5 : i64
      %357 = func.call @cc_make_string(%355, %356) : (!llvm.ptr, i64) -> i64
      %358 = func.call @cc_nil_value() : () -> i64
      %359 = func.call @cc_intern(%357, %358) : (i64, i64) -> i64
      %360 = func.call @cc_nil_value() : () -> i64
      %361 = func.call @cc_cons(%359, %360) : (i64, i64) -> i64
      %362 = func.call @cc_values_pack(%361) : (i64) -> i64
      %363 = func.call @cc_cons(%359, %354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%363) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %364 = func.call @stack_pop_pointer() : () -> i64
      %365 = func.call @stack_pop_pointer() : () -> i64
      %366 = func.call @cc_cons(%365, %364) : (i64, i64) -> i64
      func.call @stack_push_pointer(%366) : (i64) -> ()
      %367 = func.call @stack_pop_pointer() : () -> i64
      %368 = func.call @stack_pop_pointer() : () -> i64
      %369 = func.call @cc_cons(%368, %367) : (i64, i64) -> i64
      func.call @stack_push_pointer(%369) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %370 = func.call @stack_pop_pointer() : () -> i64
      %371 = func.call @stack_pop_pointer() : () -> i64
      %372 = func.call @cc_cons(%371, %370) : (i64, i64) -> i64
      func.call @stack_push_pointer(%372) : (i64) -> ()
      %373 = func.call @stack_pop_pointer() : () -> i64
      %374 = func.call @stack_pop_pointer() : () -> i64
      %375 = func.call @cc_cons(%374, %373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%375) : (i64) -> ()
      %376 = func.call @stack_pop_pointer() : () -> i64
      %377 = func.call @stack_pop_pointer() : () -> i64
      %378 = func.call @cc_cons(%377, %376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%378) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %379 = func.call @stack_pop_pointer() : () -> i64
      %380 = func.call @stack_pop_pointer() : () -> i64
      %381 = func.call @cc_cons(%380, %379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%381) : (i64) -> ()
      %382 = func.call @stack_pop_pointer() : () -> i64
      %383 = func.call @stack_pop_pointer() : () -> i64
      %384 = func.call @cc_cons(%383, %382) : (i64, i64) -> i64
      func.call @stack_push_pointer(%384) : (i64) -> ()
      %385 = func.call @stack_pop_pointer() : () -> i64
      %386 = func.call @stack_pop_pointer() : () -> i64
      %387 = func.call @cc_cons(%386, %385) : (i64, i64) -> i64
      func.call @stack_push_pointer(%387) : (i64) -> ()
      %388 = func.call @stack_pop_pointer() : () -> i64
      %389 = func.call @stack_pop_pointer() : () -> i64
      %390 = func.call @cc_cons(%389, %388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%390) : (i64) -> ()
      %391 = llvm.mlir.addressof @str34 : !llvm.ptr
      %392 = arith.constant 4 : i64
      %393 = func.call @cc_make_string(%391, %392) : (!llvm.ptr, i64) -> i64
      %394 = func.call @cc_nil_value() : () -> i64
      %395 = func.call @cc_intern(%393, %394) : (i64, i64) -> i64
      %396 = func.call @cc_nil_value() : () -> i64
      %397 = func.call @cc_cons(%395, %396) : (i64, i64) -> i64
      %398 = func.call @cc_values_pack(%397) : (i64) -> i64
      func.call @stack_push_pointer(%395) : (i64) -> ()
      %399 = llvm.mlir.addressof @str35 : !llvm.ptr
      %400 = arith.constant 3 : i64
      %401 = func.call @cc_make_string(%399, %400) : (!llvm.ptr, i64) -> i64
      %402 = func.call @cc_nil_value() : () -> i64
      %403 = func.call @cc_intern(%401, %402) : (i64, i64) -> i64
      %404 = func.call @cc_nil_value() : () -> i64
      %405 = func.call @cc_cons(%403, %404) : (i64, i64) -> i64
      %406 = func.call @cc_values_pack(%405) : (i64) -> i64
      func.call @stack_push_pointer(%403) : (i64) -> ()
      %407 = llvm.mlir.addressof @str36 : !llvm.ptr
      %408 = arith.constant 3 : i64
      %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
      %410 = func.call @cc_nil_value() : () -> i64
      %411 = func.call @cc_intern(%409, %410) : (i64, i64) -> i64
      %412 = func.call @cc_nil_value() : () -> i64
      %413 = func.call @cc_cons(%411, %412) : (i64, i64) -> i64
      %414 = func.call @cc_values_pack(%413) : (i64) -> i64
      func.call @stack_push_pointer(%411) : (i64) -> ()
      %415 = llvm.mlir.addressof @str37 : !llvm.ptr
      %416 = arith.constant 15 : i64
      %417 = func.call @cc_make_string(%415, %416) : (!llvm.ptr, i64) -> i64
      %418 = func.call @cc_nil_value() : () -> i64
      %419 = func.call @cc_intern(%417, %418) : (i64, i64) -> i64
      %420 = func.call @cc_nil_value() : () -> i64
      %421 = func.call @cc_cons(%419, %420) : (i64, i64) -> i64
      %422 = func.call @cc_values_pack(%421) : (i64) -> i64
      func.call @stack_push_pointer(%419) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %423 = func.call @stack_pop_pointer() : () -> i64
      %424 = func.call @stack_pop_pointer() : () -> i64
      %425 = func.call @cc_cons(%424, %423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%425) : (i64) -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @cc_cons(%427, %426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%428) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @stack_pop_pointer() : () -> i64
      %431 = func.call @cc_cons(%430, %429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%431) : (i64) -> ()
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = func.call @cc_cons(%433, %432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%434) : (i64) -> ()
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @stack_pop_pointer() : () -> i64
      %437 = func.call @cc_cons(%436, %435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%437) : (i64) -> ()
      %438 = llvm.mlir.addressof @str38 : !llvm.ptr
      %439 = arith.constant 4 : i64
      %440 = func.call @cc_make_string(%438, %439) : (!llvm.ptr, i64) -> i64
      %441 = func.call @cc_nil_value() : () -> i64
      %442 = func.call @cc_intern(%440, %441) : (i64, i64) -> i64
      %443 = func.call @cc_nil_value() : () -> i64
      %444 = func.call @cc_cons(%442, %443) : (i64, i64) -> i64
      %445 = func.call @cc_values_pack(%444) : (i64) -> i64
      func.call @stack_push_pointer(%442) : (i64) -> ()
      %446 = llvm.mlir.addressof @str39 : !llvm.ptr
      %447 = arith.constant 4 : i64
      %448 = func.call @cc_make_string(%446, %447) : (!llvm.ptr, i64) -> i64
      %449 = func.call @cc_nil_value() : () -> i64
      %450 = func.call @cc_intern(%448, %449) : (i64, i64) -> i64
      %451 = func.call @cc_nil_value() : () -> i64
      %452 = func.call @cc_cons(%450, %451) : (i64, i64) -> i64
      %453 = func.call @cc_values_pack(%452) : (i64) -> i64
      func.call @stack_push_pointer(%450) : (i64) -> ()
      %454 = llvm.mlir.addressof @str40 : !llvm.ptr
      %455 = arith.constant 20 : i64
      %456 = func.call @cc_make_string(%454, %455) : (!llvm.ptr, i64) -> i64
      %457 = llvm.mlir.addressof @str41 : !llvm.ptr
      %458 = arith.constant 3 : i64
      %459 = func.call @cc_make_string(%457, %458) : (!llvm.ptr, i64) -> i64
      %460 = func.call @cc_intern(%456, %459) : (i64, i64) -> i64
      %461 = func.call @cc_nil_value() : () -> i64
      %462 = func.call @cc_cons(%460, %461) : (i64, i64) -> i64
      %463 = func.call @cc_values_pack(%462) : (i64) -> i64
      func.call @stack_push_pointer(%460) : (i64) -> ()
      %464 = llvm.mlir.addressof @str42 : !llvm.ptr
      %465 = arith.constant 3 : i64
      %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
      %467 = func.call @cc_nil_value() : () -> i64
      %468 = func.call @cc_intern(%466, %467) : (i64, i64) -> i64
      %469 = func.call @cc_nil_value() : () -> i64
      %470 = func.call @cc_cons(%468, %469) : (i64, i64) -> i64
      %471 = func.call @cc_values_pack(%470) : (i64) -> i64
      func.call @stack_push_pointer(%468) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @cc_cons(%473, %472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%474) : (i64) -> ()
      %475 = func.call @stack_pop_pointer() : () -> i64
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_cons(%476, %475) : (i64, i64) -> i64
      func.call @stack_push_pointer(%477) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %478 = func.call @stack_pop_pointer() : () -> i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%480) : (i64) -> ()
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_cons(%482, %481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%483) : (i64) -> ()
      %484 = func.call @stack_pop_pointer() : () -> i64
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @cc_cons(%485, %484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%486) : (i64) -> ()
      %487 = llvm.mlir.addressof @str43 : !llvm.ptr
      %488 = arith.constant 2 : i64
      %489 = func.call @cc_make_string(%487, %488) : (!llvm.ptr, i64) -> i64
      %490 = func.call @cc_nil_value() : () -> i64
      %491 = func.call @cc_intern(%489, %490) : (i64, i64) -> i64
      %492 = func.call @cc_nil_value() : () -> i64
      %493 = func.call @cc_cons(%491, %492) : (i64, i64) -> i64
      %494 = func.call @cc_values_pack(%493) : (i64) -> i64
      func.call @stack_push_pointer(%491) : (i64) -> ()
      %495 = llvm.mlir.addressof @str44 : !llvm.ptr
      %496 = arith.constant 3 : i64
      %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
      %498 = func.call @cc_nil_value() : () -> i64
      %499 = func.call @cc_intern(%497, %498) : (i64, i64) -> i64
      %500 = func.call @cc_nil_value() : () -> i64
      %501 = func.call @cc_cons(%499, %500) : (i64, i64) -> i64
      %502 = func.call @cc_values_pack(%501) : (i64) -> i64
      func.call @stack_push_pointer(%499) : (i64) -> ()
      %503 = llvm.mlir.addressof @str45 : !llvm.ptr
      %504 = arith.constant 1 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = llvm.mlir.addressof @str46 : !llvm.ptr
      %507 = arith.constant 11 : i64
      %508 = func.call @cc_make_string(%506, %507) : (!llvm.ptr, i64) -> i64
      %509 = func.call @cc_intern(%505, %508) : (i64, i64) -> i64
      %510 = func.call @cc_nil_value() : () -> i64
      %511 = func.call @cc_cons(%509, %510) : (i64, i64) -> i64
      %512 = func.call @cc_values_pack(%511) : (i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %513 = llvm.mlir.addressof @str47 : !llvm.ptr
      %514 = arith.constant 3 : i64
      %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
      %516 = func.call @cc_nil_value() : () -> i64
      %517 = func.call @cc_intern(%515, %516) : (i64, i64) -> i64
      %518 = func.call @cc_nil_value() : () -> i64
      %519 = func.call @cc_cons(%517, %518) : (i64, i64) -> i64
      %520 = func.call @cc_values_pack(%519) : (i64) -> i64
      func.call @stack_push_pointer(%517) : (i64) -> ()
      %521 = llvm.mlir.addressof @str48 : !llvm.ptr
      %522 = arith.constant 20 : i64
      %523 = func.call @cc_make_string(%521, %522) : (!llvm.ptr, i64) -> i64
      %524 = llvm.mlir.addressof @str49 : !llvm.ptr
      %525 = arith.constant 3 : i64
      %526 = func.call @cc_make_string(%524, %525) : (!llvm.ptr, i64) -> i64
      %527 = func.call @cc_intern(%523, %526) : (i64, i64) -> i64
      %528 = func.call @cc_nil_value() : () -> i64
      %529 = func.call @cc_cons(%527, %528) : (i64, i64) -> i64
      %530 = func.call @cc_values_pack(%529) : (i64) -> i64
      func.call @stack_push_pointer(%527) : (i64) -> ()
      %531 = llvm.mlir.addressof @str50 : !llvm.ptr
      %532 = arith.constant 4 : i64
      %533 = func.call @cc_make_string(%531, %532) : (!llvm.ptr, i64) -> i64
      %534 = func.call @cc_nil_value() : () -> i64
      %535 = func.call @cc_intern(%533, %534) : (i64, i64) -> i64
      %536 = func.call @cc_nil_value() : () -> i64
      %537 = func.call @cc_cons(%535, %536) : (i64, i64) -> i64
      %538 = func.call @cc_values_pack(%537) : (i64) -> i64
      func.call @stack_push_pointer(%535) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %539 = func.call @stack_pop_pointer() : () -> i64
      %540 = func.call @stack_pop_pointer() : () -> i64
      %541 = func.call @cc_cons(%540, %539) : (i64, i64) -> i64
      func.call @stack_push_pointer(%541) : (i64) -> ()
      %542 = func.call @stack_pop_pointer() : () -> i64
      %543 = func.call @stack_pop_pointer() : () -> i64
      %544 = func.call @cc_cons(%543, %542) : (i64, i64) -> i64
      func.call @stack_push_pointer(%544) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %545 = func.call @stack_pop_pointer() : () -> i64
      %546 = func.call @stack_pop_pointer() : () -> i64
      %547 = func.call @cc_cons(%546, %545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%547) : (i64) -> ()
      %548 = func.call @stack_pop_pointer() : () -> i64
      %549 = func.call @stack_pop_pointer() : () -> i64
      %550 = func.call @cc_cons(%549, %548) : (i64, i64) -> i64
      func.call @stack_push_pointer(%550) : (i64) -> ()
      %551 = func.call @stack_pop_pointer() : () -> i64
      %552 = func.call @stack_pop_pointer() : () -> i64
      %553 = func.call @cc_cons(%552, %551) : (i64, i64) -> i64
      func.call @stack_push_pointer(%553) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %554 = func.call @stack_pop_pointer() : () -> i64
      %555 = func.call @stack_pop_pointer() : () -> i64
      %556 = func.call @cc_cons(%555, %554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%556) : (i64) -> ()
      %557 = func.call @stack_pop_pointer() : () -> i64
      %558 = func.call @stack_pop_pointer() : () -> i64
      %559 = func.call @cc_cons(%558, %557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%559) : (i64) -> ()
      %560 = llvm.mlir.addressof @str51 : !llvm.ptr
      %561 = arith.constant 5 : i64
      %562 = func.call @cc_make_string(%560, %561) : (!llvm.ptr, i64) -> i64
      %563 = func.call @cc_nil_value() : () -> i64
      %564 = func.call @cc_intern(%562, %563) : (i64, i64) -> i64
      %565 = func.call @cc_nil_value() : () -> i64
      %566 = func.call @cc_cons(%564, %565) : (i64, i64) -> i64
      %567 = func.call @cc_values_pack(%566) : (i64) -> i64
      func.call @stack_push_pointer(%564) : (i64) -> ()
      %568 = llvm.mlir.addressof @str52 : !llvm.ptr
      %569 = arith.constant 4 : i64
      %570 = func.call @cc_make_string(%568, %569) : (!llvm.ptr, i64) -> i64
      %571 = func.call @cc_nil_value() : () -> i64
      %572 = func.call @cc_intern(%570, %571) : (i64, i64) -> i64
      %573 = func.call @cc_nil_value() : () -> i64
      %574 = func.call @cc_cons(%572, %573) : (i64, i64) -> i64
      %575 = func.call @cc_values_pack(%574) : (i64) -> i64
      func.call @stack_push_pointer(%572) : (i64) -> ()
      %576 = llvm.mlir.addressof @str53 : !llvm.ptr
      %577 = arith.constant 15 : i64
      %578 = func.call @cc_make_string(%576, %577) : (!llvm.ptr, i64) -> i64
      %579 = func.call @cc_nil_value() : () -> i64
      %580 = func.call @cc_intern(%578, %579) : (i64, i64) -> i64
      %581 = func.call @cc_nil_value() : () -> i64
      %582 = func.call @cc_cons(%580, %581) : (i64, i64) -> i64
      %583 = func.call @cc_values_pack(%582) : (i64) -> i64
      func.call @stack_push_pointer(%580) : (i64) -> ()
      %584 = llvm.mlir.addressof @str54 : !llvm.ptr
      %585 = arith.constant 6 : i64
      %586 = func.call @cc_make_string(%584, %585) : (!llvm.ptr, i64) -> i64
      %587 = func.call @cc_nil_value() : () -> i64
      %588 = func.call @cc_intern(%586, %587) : (i64, i64) -> i64
      %589 = func.call @cc_nil_value() : () -> i64
      %590 = func.call @cc_cons(%588, %589) : (i64, i64) -> i64
      %591 = func.call @cc_values_pack(%590) : (i64) -> i64
      func.call @stack_push_pointer(%588) : (i64) -> ()
      %592 = llvm.mlir.addressof @str55 : !llvm.ptr
      %593 = arith.constant 15 : i64
      %594 = func.call @cc_make_string(%592, %593) : (!llvm.ptr, i64) -> i64
      %595 = func.call @cc_nil_value() : () -> i64
      %596 = func.call @cc_intern(%594, %595) : (i64, i64) -> i64
      %597 = func.call @cc_nil_value() : () -> i64
      %598 = func.call @cc_cons(%596, %597) : (i64, i64) -> i64
      %599 = func.call @cc_values_pack(%598) : (i64) -> i64
      func.call @stack_push_pointer(%596) : (i64) -> ()
      %600 = llvm.mlir.addressof @str56 : !llvm.ptr
      %601 = arith.constant 4 : i64
      %602 = func.call @cc_make_string(%600, %601) : (!llvm.ptr, i64) -> i64
      %603 = func.call @cc_nil_value() : () -> i64
      %604 = func.call @cc_intern(%602, %603) : (i64, i64) -> i64
      %605 = func.call @cc_nil_value() : () -> i64
      %606 = func.call @cc_cons(%604, %605) : (i64, i64) -> i64
      %607 = func.call @cc_values_pack(%606) : (i64) -> i64
      func.call @stack_push_pointer(%604) : (i64) -> ()
      %608 = llvm.mlir.addressof @str57 : !llvm.ptr
      %609 = arith.constant 3 : i64
      %610 = func.call @cc_make_string(%608, %609) : (!llvm.ptr, i64) -> i64
      %611 = func.call @cc_nil_value() : () -> i64
      %612 = func.call @cc_intern(%610, %611) : (i64, i64) -> i64
      %613 = func.call @cc_nil_value() : () -> i64
      %614 = func.call @cc_cons(%612, %613) : (i64, i64) -> i64
      %615 = func.call @cc_values_pack(%614) : (i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %616 = func.call @stack_pop_pointer() : () -> i64
      %617 = func.call @stack_pop_pointer() : () -> i64
      %618 = func.call @cc_cons(%617, %616) : (i64, i64) -> i64
      func.call @stack_push_pointer(%618) : (i64) -> ()
      %619 = func.call @stack_pop_pointer() : () -> i64
      %620 = func.call @stack_pop_pointer() : () -> i64
      %621 = func.call @cc_cons(%620, %619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%621) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = func.call @stack_pop_pointer() : () -> i64
      %624 = func.call @cc_cons(%623, %622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%624) : (i64) -> ()
      %625 = func.call @stack_pop_pointer() : () -> i64
      %626 = func.call @stack_pop_pointer() : () -> i64
      %627 = func.call @cc_cons(%626, %625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%627) : (i64) -> ()
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = func.call @stack_pop_pointer() : () -> i64
      %630 = func.call @cc_cons(%629, %628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%630) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %631 = func.call @stack_pop_pointer() : () -> i64
      %632 = func.call @stack_pop_pointer() : () -> i64
      %633 = func.call @cc_cons(%632, %631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%633) : (i64) -> ()
      %634 = func.call @stack_pop_pointer() : () -> i64
      %635 = func.call @stack_pop_pointer() : () -> i64
      %636 = func.call @cc_cons(%635, %634) : (i64, i64) -> i64
      func.call @stack_push_pointer(%636) : (i64) -> ()
      %637 = func.call @stack_pop_pointer() : () -> i64
      %638 = func.call @stack_pop_pointer() : () -> i64
      %639 = func.call @cc_cons(%638, %637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%639) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %640 = func.call @stack_pop_pointer() : () -> i64
      %641 = func.call @stack_pop_pointer() : () -> i64
      %642 = func.call @cc_cons(%641, %640) : (i64, i64) -> i64
      func.call @stack_push_pointer(%642) : (i64) -> ()
      %643 = func.call @stack_pop_pointer() : () -> i64
      %644 = func.call @stack_pop_pointer() : () -> i64
      %645 = func.call @cc_cons(%644, %643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%645) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %646 = func.call @stack_pop_pointer() : () -> i64
      %647 = func.call @stack_pop_pointer() : () -> i64
      %648 = func.call @cc_cons(%647, %646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%648) : (i64) -> ()
      %649 = func.call @stack_pop_pointer() : () -> i64
      %650 = func.call @stack_pop_pointer() : () -> i64
      %651 = func.call @cc_cons(%650, %649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      %652 = func.call @stack_pop_pointer() : () -> i64
      %653 = func.call @stack_pop_pointer() : () -> i64
      %654 = func.call @cc_cons(%653, %652) : (i64, i64) -> i64
      func.call @stack_push_pointer(%654) : (i64) -> ()
      %655 = func.call @stack_pop_pointer() : () -> i64
      %656 = func.call @stack_pop_pointer() : () -> i64
      %657 = func.call @cc_cons(%656, %655) : (i64, i64) -> i64
      func.call @stack_push_pointer(%657) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %658 = func.call @stack_pop_pointer() : () -> i64
      %659 = func.call @stack_pop_pointer() : () -> i64
      %660 = func.call @cc_cons(%659, %658) : (i64, i64) -> i64
      func.call @stack_push_pointer(%660) : (i64) -> ()
      %661 = func.call @stack_pop_pointer() : () -> i64
      %662 = func.call @stack_pop_pointer() : () -> i64
      %663 = func.call @cc_cons(%662, %661) : (i64, i64) -> i64
      func.call @stack_push_pointer(%663) : (i64) -> ()
      %664 = func.call @stack_pop_pointer() : () -> i64
      %665 = func.call @stack_pop_pointer() : () -> i64
      %666 = func.call @cc_cons(%665, %664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%666) : (i64) -> ()
      %667 = func.call @stack_pop_pointer() : () -> i64
      %668 = func.call @stack_pop_pointer() : () -> i64
      %669 = func.call @cc_cons(%668, %667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%669) : (i64) -> ()
      %670 = func.call @stack_pop_pointer() : () -> i64
      %671 = func.call @stack_pop_pointer() : () -> i64
      %672 = func.call @cc_cons(%671, %670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%672) : (i64) -> ()
      %673 = llvm.mlir.addressof @str58 : !llvm.ptr
      %674 = arith.constant 4 : i64
      %675 = func.call @cc_make_string(%673, %674) : (!llvm.ptr, i64) -> i64
      %676 = func.call @cc_nil_value() : () -> i64
      %677 = func.call @cc_intern(%675, %676) : (i64, i64) -> i64
      %678 = func.call @cc_nil_value() : () -> i64
      %679 = func.call @cc_cons(%677, %678) : (i64, i64) -> i64
      %680 = func.call @cc_values_pack(%679) : (i64) -> i64
      func.call @stack_push_pointer(%677) : (i64) -> ()
      %681 = llvm.mlir.addressof @str59 : !llvm.ptr
      %682 = arith.constant 15 : i64
      %683 = func.call @cc_make_string(%681, %682) : (!llvm.ptr, i64) -> i64
      %684 = func.call @cc_nil_value() : () -> i64
      %685 = func.call @cc_intern(%683, %684) : (i64, i64) -> i64
      %686 = func.call @cc_nil_value() : () -> i64
      %687 = func.call @cc_cons(%685, %686) : (i64, i64) -> i64
      %688 = func.call @cc_values_pack(%687) : (i64) -> i64
      func.call @stack_push_pointer(%685) : (i64) -> ()
      %689 = llvm.mlir.addressof @str60 : !llvm.ptr
      %690 = arith.constant 3 : i64
      %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
      %692 = func.call @cc_nil_value() : () -> i64
      %693 = func.call @cc_intern(%691, %692) : (i64, i64) -> i64
      %694 = func.call @cc_nil_value() : () -> i64
      %695 = func.call @cc_cons(%693, %694) : (i64, i64) -> i64
      %696 = func.call @cc_values_pack(%695) : (i64) -> i64
      func.call @stack_push_pointer(%693) : (i64) -> ()
      %697 = llvm.mlir.addressof @str61 : !llvm.ptr
      %698 = arith.constant 15 : i64
      %699 = func.call @cc_make_string(%697, %698) : (!llvm.ptr, i64) -> i64
      %700 = func.call @cc_nil_value() : () -> i64
      %701 = func.call @cc_intern(%699, %700) : (i64, i64) -> i64
      %702 = func.call @cc_nil_value() : () -> i64
      %703 = func.call @cc_cons(%701, %702) : (i64, i64) -> i64
      %704 = func.call @cc_values_pack(%703) : (i64) -> i64
      func.call @stack_push_pointer(%701) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %705 = func.call @stack_pop_pointer() : () -> i64
      %706 = func.call @stack_pop_pointer() : () -> i64
      %707 = func.call @cc_cons(%706, %705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @stack_pop_pointer() : () -> i64
      %710 = func.call @cc_cons(%709, %708) : (i64, i64) -> i64
      func.call @stack_push_pointer(%710) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @stack_pop_pointer() : () -> i64
      %713 = func.call @cc_cons(%712, %711) : (i64, i64) -> i64
      func.call @stack_push_pointer(%713) : (i64) -> ()
      %714 = func.call @stack_pop_pointer() : () -> i64
      %715 = func.call @stack_pop_pointer() : () -> i64
      %716 = func.call @cc_cons(%715, %714) : (i64, i64) -> i64
      func.call @stack_push_pointer(%716) : (i64) -> ()
      %717 = func.call @stack_pop_pointer() : () -> i64
      %718 = func.call @stack_pop_pointer() : () -> i64
      %719 = func.call @cc_cons(%718, %717) : (i64, i64) -> i64
      func.call @stack_push_pointer(%719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %720 = func.call @stack_pop_pointer() : () -> i64
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @cc_cons(%721, %720) : (i64, i64) -> i64
      func.call @stack_push_pointer(%722) : (i64) -> ()
      %723 = func.call @stack_pop_pointer() : () -> i64
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @cc_cons(%724, %723) : (i64, i64) -> i64
      func.call @stack_push_pointer(%725) : (i64) -> ()
      %726 = func.call @stack_pop_pointer() : () -> i64
      %727 = func.call @stack_pop_pointer() : () -> i64
      %728 = func.call @cc_cons(%727, %726) : (i64, i64) -> i64
      func.call @stack_push_pointer(%728) : (i64) -> ()
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @stack_pop_pointer() : () -> i64
      %731 = func.call @cc_cons(%730, %729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%731) : (i64) -> ()
      %732 = llvm.mlir.addressof @str62 : !llvm.ptr
      %733 = arith.constant 15 : i64
      %734 = func.call @cc_make_string(%732, %733) : (!llvm.ptr, i64) -> i64
      %735 = func.call @cc_nil_value() : () -> i64
      %736 = func.call @cc_intern(%734, %735) : (i64, i64) -> i64
      %737 = func.call @cc_nil_value() : () -> i64
      %738 = func.call @cc_cons(%736, %737) : (i64, i64) -> i64
      %739 = func.call @cc_values_pack(%738) : (i64) -> i64
      func.call @stack_push_pointer(%736) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %740 = func.call @stack_pop_pointer() : () -> i64
      %741 = func.call @stack_pop_pointer() : () -> i64
      %742 = func.call @cc_cons(%741, %740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%742) : (i64) -> ()
      %743 = func.call @stack_pop_pointer() : () -> i64
      %744 = func.call @stack_pop_pointer() : () -> i64
      %745 = func.call @cc_cons(%744, %743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%745) : (i64) -> ()
      %746 = func.call @stack_pop_pointer() : () -> i64
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = func.call @cc_cons(%747, %746) : (i64, i64) -> i64
      func.call @stack_push_pointer(%748) : (i64) -> ()
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @stack_pop_pointer() : () -> i64
      %751 = func.call @cc_cons(%750, %749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%751) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @cc_cons(%753, %752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%754) : (i64) -> ()
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @cc_cons(%756, %755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%757) : (i64) -> ()
      %758 = func.call @stack_pop_pointer() : () -> i64
      %759 = func.call @stack_pop_pointer() : () -> i64
      %760 = func.call @cc_cons(%759, %758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%760) : (i64) -> ()
      %761 = func.call @stack_pop_pointer() : () -> i64
      %1142 = arith.constant 162741310455809 : i64
      %1143 = arith.constant 0 : i64
      %1144 = func.call @cc_make_closure(%1142, %1143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1144) : (i64) -> ()
      %1145 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1146 = func.call @stack_pop_pointer() : () -> i64
      %1147 = func.call @stack_pop_pointer() : () -> i64
      %1148 = func.call @cc_cons(%1147, %1146) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1148) : (i64) -> ()
      %1149 = func.call @stack_pop_pointer() : () -> i64
      %1150 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1151 = arith.constant 11 : i64
      %1152 = func.call @cc_make_string(%1150, %1151) : (!llvm.ptr, i64) -> i64
      %1153 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1154 = arith.constant 7 : i64
      %1155 = func.call @cc_make_string(%1153, %1154) : (!llvm.ptr, i64) -> i64
      %1156 = func.call @cc_intern(%1152, %1155) : (i64, i64) -> i64
      %1157 = func.call @cc_nil_value() : () -> i64
      %1158 = func.call @cc_cons(%1156, %1157) : (i64, i64) -> i64
      %1159 = func.call @cc_values_pack(%1158) : (i64) -> i64
      func.call @stack_push_pointer(%1156) : (i64) -> ()
      %1160 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1161 = func.call @stack_pop_pointer() : () -> i64
      %1162 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1163 = arith.constant 4 : i64
      %1164 = func.call @cc_make_string(%1162, %1163) : (!llvm.ptr, i64) -> i64
      %1165 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1166 = arith.constant 7 : i64
      %1167 = func.call @cc_make_string(%1165, %1166) : (!llvm.ptr, i64) -> i64
      %1168 = func.call @cc_intern(%1164, %1167) : (i64, i64) -> i64
      %1169 = func.call @cc_nil_value() : () -> i64
      %1170 = func.call @cc_cons(%1168, %1169) : (i64, i64) -> i64
      %1171 = func.call @cc_values_pack(%1170) : (i64) -> i64
      func.call @stack_push_pointer(%1168) : (i64) -> ()
      %1172 = func.call @stack_pop_pointer() : () -> i64
      %1173 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1174 = arith.constant 6 : i64
      %1175 = func.call @cc_make_string(%1173, %1174) : (!llvm.ptr, i64) -> i64
      %1176 = func.call @cc_nil_value() : () -> i64
      %1177 = func.call @cc_intern(%1175, %1176) : (i64, i64) -> i64
      %1178 = func.call @cc_nil_value() : () -> i64
      %1179 = func.call @cc_cons(%1177, %1178) : (i64, i64) -> i64
      %1180 = func.call @cc_values_pack(%1179) : (i64) -> i64
      func.call @stack_push_pointer(%1177) : (i64) -> ()
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = func.call @cc_nil_value() : () -> i64
      %1183 = func.call @cc_errorp(%65) : (i64) -> i64
      %1184 = arith.cmpi ne, %1183, %1182 : i64
      %1185 = arith.cmpi eq, %1182, %1182 : i64
      %1186 = arith.andi %1184, %1185 : i1
      %1187 = scf.if %1186 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %1182 : i64
      }
      %1188 = func.call @cc_errorp(%761) : (i64) -> i64
      %1189 = arith.cmpi ne, %1188, %1182 : i64
      %1190 = arith.cmpi eq, %1187, %1182 : i64
      %1191 = arith.andi %1189, %1190 : i1
      %1192 = scf.if %1191 -> (i64) {
        scf.yield %761 : i64
      } else {
        scf.yield %1187 : i64
      }
      %1193 = func.call @cc_errorp(%1145) : (i64) -> i64
      %1194 = arith.cmpi ne, %1193, %1182 : i64
      %1195 = arith.cmpi eq, %1192, %1182 : i64
      %1196 = arith.andi %1194, %1195 : i1
      %1197 = scf.if %1196 -> (i64) {
        scf.yield %1145 : i64
      } else {
        scf.yield %1192 : i64
      }
      %1198 = func.call @cc_errorp(%1149) : (i64) -> i64
      %1199 = arith.cmpi ne, %1198, %1182 : i64
      %1200 = arith.cmpi eq, %1197, %1182 : i64
      %1201 = arith.andi %1199, %1200 : i1
      %1202 = scf.if %1201 -> (i64) {
        scf.yield %1149 : i64
      } else {
        scf.yield %1197 : i64
      }
      %1203 = func.call @cc_errorp(%1160) : (i64) -> i64
      %1204 = arith.cmpi ne, %1203, %1182 : i64
      %1205 = arith.cmpi eq, %1202, %1182 : i64
      %1206 = arith.andi %1204, %1205 : i1
      %1207 = scf.if %1206 -> (i64) {
        scf.yield %1160 : i64
      } else {
        scf.yield %1202 : i64
      }
      %1208 = func.call @cc_errorp(%1161) : (i64) -> i64
      %1209 = arith.cmpi ne, %1208, %1182 : i64
      %1210 = arith.cmpi eq, %1207, %1182 : i64
      %1211 = arith.andi %1209, %1210 : i1
      %1212 = scf.if %1211 -> (i64) {
        scf.yield %1161 : i64
      } else {
        scf.yield %1207 : i64
      }
      %1213 = func.call @cc_errorp(%1172) : (i64) -> i64
      %1214 = arith.cmpi ne, %1213, %1182 : i64
      %1215 = arith.cmpi eq, %1212, %1182 : i64
      %1216 = arith.andi %1214, %1215 : i1
      %1217 = scf.if %1216 -> (i64) {
        scf.yield %1172 : i64
      } else {
        scf.yield %1212 : i64
      }
      %1218 = func.call @cc_errorp(%1181) : (i64) -> i64
      %1219 = arith.cmpi ne, %1218, %1182 : i64
      %1220 = arith.cmpi eq, %1217, %1182 : i64
      %1221 = arith.andi %1219, %1220 : i1
      %1222 = scf.if %1221 -> (i64) {
        scf.yield %1181 : i64
      } else {
        scf.yield %1217 : i64
      }
      %1223 = arith.cmpi ne, %1222, %1182 : i64
      scf.if %1223 {
        func.call @stack_push_pointer(%1222) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%761) : (i64) -> ()
        func.call @stack_push_pointer(%1145) : (i64) -> ()
        func.call @stack_push_pointer(%1149) : (i64) -> ()
        func.call @stack_push_pointer(%1160) : (i64) -> ()
        func.call @stack_push_pointer(%1161) : (i64) -> ()
        func.call @stack_push_pointer(%1172) : (i64) -> ()
        func.call @stack_push_pointer(%1181) : (i64) -> ()
        %1224 = llvm.mlir.addressof @str87 : !llvm.ptr
        %1225 = func.call @cc_make_function_ref_const(%1224) : (!llvm.ptr) -> i64
        %1226 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1225, %1226) : (i64, i64) -> ()
      }
      %1227 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1227 : i64
    }
    %1228 = func.call @cc_nil_value() : () -> i64
    %1229 = func.call @cc_errorp(%56) : (i64) -> i64
    %1230 = arith.cmpi ne, %1229, %1228 : i64
    %1231 = scf.if %1230 -> (i64) {
      scf.yield %56 : i64
    } else {
      %1232 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1233 = arith.constant 27 : i64
      %1234 = func.call @cc_make_string(%1232, %1233) : (!llvm.ptr, i64) -> i64
      %1235 = func.call @cc_nil_value() : () -> i64
      %1236 = func.call @cc_intern(%1234, %1235) : (i64, i64) -> i64
      %1237 = func.call @cc_nil_value() : () -> i64
      %1238 = func.call @cc_cons(%1236, %1237) : (i64, i64) -> i64
      %1239 = func.call @cc_values_pack(%1238) : (i64) -> i64
      func.call @stack_push_pointer(%1236) : (i64) -> ()
      %1240 = func.call @stack_pop_pointer() : () -> i64
      %1241 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1242 = arith.constant 13 : i64
      %1243 = func.call @cc_make_string(%1241, %1242) : (!llvm.ptr, i64) -> i64
      %1244 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1245 = arith.constant 11 : i64
      %1246 = func.call @cc_make_string(%1244, %1245) : (!llvm.ptr, i64) -> i64
      %1247 = func.call @cc_intern(%1243, %1246) : (i64, i64) -> i64
      %1248 = func.call @cc_nil_value() : () -> i64
      %1249 = func.call @cc_cons(%1247, %1248) : (i64, i64) -> i64
      %1250 = func.call @cc_values_pack(%1249) : (i64) -> i64
      func.call @stack_push_pointer(%1247) : (i64) -> ()
      %1251 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1252 = arith.constant 6 : i64
      %1253 = func.call @cc_make_string(%1251, %1252) : (!llvm.ptr, i64) -> i64
      %1254 = func.call @cc_nil_value() : () -> i64
      %1255 = func.call @cc_intern(%1253, %1254) : (i64, i64) -> i64
      %1256 = func.call @cc_nil_value() : () -> i64
      %1257 = func.call @cc_cons(%1255, %1256) : (i64, i64) -> i64
      %1258 = func.call @cc_values_pack(%1257) : (i64) -> i64
      func.call @stack_push_pointer(%1255) : (i64) -> ()
      %1259 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1260 = arith.constant 19 : i64
      %1261 = func.call @cc_make_string(%1259, %1260) : (!llvm.ptr, i64) -> i64
      %1262 = func.call @cc_nil_value() : () -> i64
      %1263 = func.call @cc_intern(%1261, %1262) : (i64, i64) -> i64
      %1264 = func.call @cc_nil_value() : () -> i64
      %1265 = func.call @cc_cons(%1263, %1264) : (i64, i64) -> i64
      %1266 = func.call @cc_values_pack(%1265) : (i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      %1267 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1268 = arith.constant 20 : i64
      %1269 = func.call @cc_make_string(%1267, %1268) : (!llvm.ptr, i64) -> i64
      %1270 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1271 = arith.constant 3 : i64
      %1272 = func.call @cc_make_string(%1270, %1271) : (!llvm.ptr, i64) -> i64
      %1273 = func.call @cc_intern(%1269, %1272) : (i64, i64) -> i64
      %1274 = func.call @cc_nil_value() : () -> i64
      %1275 = func.call @cc_cons(%1273, %1274) : (i64, i64) -> i64
      %1276 = func.call @cc_values_pack(%1275) : (i64) -> i64
      func.call @stack_push_pointer(%1273) : (i64) -> ()
      %1277 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1277) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1278 = func.call @stack_pop_pointer() : () -> i64
      %1279 = func.call @stack_pop_pointer() : () -> i64
      %1280 = func.call @cc_cons(%1279, %1278) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1280) : (i64) -> ()
      %1281 = func.call @stack_pop_pointer() : () -> i64
      %1282 = func.call @stack_pop_pointer() : () -> i64
      %1283 = func.call @cc_cons(%1282, %1281) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1283) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1284 = func.call @stack_pop_pointer() : () -> i64
      %1285 = func.call @stack_pop_pointer() : () -> i64
      %1286 = func.call @cc_cons(%1285, %1284) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1286) : (i64) -> ()
      %1287 = func.call @stack_pop_pointer() : () -> i64
      %1288 = func.call @stack_pop_pointer() : () -> i64
      %1289 = func.call @cc_cons(%1288, %1287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1289) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1290 = func.call @stack_pop_pointer() : () -> i64
      %1291 = func.call @stack_pop_pointer() : () -> i64
      %1292 = func.call @cc_cons(%1291, %1290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1292) : (i64) -> ()
      %1293 = func.call @stack_pop_pointer() : () -> i64
      %1294 = func.call @stack_pop_pointer() : () -> i64
      %1295 = func.call @cc_cons(%1294, %1293) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1295) : (i64) -> ()
      %1296 = func.call @stack_pop_pointer() : () -> i64
      %1297 = func.call @stack_pop_pointer() : () -> i64
      %1298 = func.call @cc_cons(%1297, %1296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1298) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1299 = func.call @stack_pop_pointer() : () -> i64
      %1300 = func.call @stack_pop_pointer() : () -> i64
      %1301 = func.call @cc_cons(%1300, %1299) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1301) : (i64) -> ()
      %1302 = func.call @stack_pop_pointer() : () -> i64
      %1303 = func.call @stack_pop_pointer() : () -> i64
      %1304 = func.call @cc_cons(%1303, %1302) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1304) : (i64) -> ()
      %1305 = func.call @stack_pop_pointer() : () -> i64
      %1361 = arith.constant 162741310455811 : i64
      %1362 = arith.constant 0 : i64
      %1363 = func.call @cc_make_closure(%1361, %1362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1363) : (i64) -> ()
      %1364 = func.call @stack_pop_pointer() : () -> i64
      %1365 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1366 = arith.constant 4 : i64
      %1367 = func.call @cc_make_string(%1365, %1366) : (!llvm.ptr, i64) -> i64
      %1368 = func.call @cc_nil_value() : () -> i64
      %1369 = func.call @cc_intern(%1367, %1368) : (i64, i64) -> i64
      %1370 = func.call @cc_nil_value() : () -> i64
      %1371 = func.call @cc_cons(%1369, %1370) : (i64, i64) -> i64
      %1372 = func.call @cc_values_pack(%1371) : (i64) -> i64
      func.call @stack_push_pointer(%1369) : (i64) -> ()
      %1373 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1374 = arith.constant 5 : i64
      %1375 = func.call @cc_make_string(%1373, %1374) : (!llvm.ptr, i64) -> i64
      %1376 = func.call @cc_nil_value() : () -> i64
      %1377 = func.call @cc_intern(%1375, %1376) : (i64, i64) -> i64
      %1378 = func.call @cc_nil_value() : () -> i64
      %1379 = func.call @cc_cons(%1377, %1378) : (i64, i64) -> i64
      %1380 = func.call @cc_values_pack(%1379) : (i64) -> i64
      func.call @stack_push_pointer(%1377) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1381 = func.call @stack_pop_pointer() : () -> i64
      %1382 = func.call @stack_pop_pointer() : () -> i64
      %1383 = func.call @cc_cons(%1382, %1381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1383) : (i64) -> ()
      %1384 = func.call @stack_pop_pointer() : () -> i64
      %1385 = func.call @stack_pop_pointer() : () -> i64
      %1386 = func.call @cc_cons(%1385, %1384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1386) : (i64) -> ()
      %1387 = func.call @stack_pop_pointer() : () -> i64
      %1388 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1389 = arith.constant 11 : i64
      %1390 = func.call @cc_make_string(%1388, %1389) : (!llvm.ptr, i64) -> i64
      %1391 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1392 = arith.constant 7 : i64
      %1393 = func.call @cc_make_string(%1391, %1392) : (!llvm.ptr, i64) -> i64
      %1394 = func.call @cc_intern(%1390, %1393) : (i64, i64) -> i64
      %1395 = func.call @cc_nil_value() : () -> i64
      %1396 = func.call @cc_cons(%1394, %1395) : (i64, i64) -> i64
      %1397 = func.call @cc_values_pack(%1396) : (i64) -> i64
      func.call @stack_push_pointer(%1394) : (i64) -> ()
      %1398 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1399 = func.call @stack_pop_pointer() : () -> i64
      %1400 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1401 = arith.constant 4 : i64
      %1402 = func.call @cc_make_string(%1400, %1401) : (!llvm.ptr, i64) -> i64
      %1403 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1404 = arith.constant 7 : i64
      %1405 = func.call @cc_make_string(%1403, %1404) : (!llvm.ptr, i64) -> i64
      %1406 = func.call @cc_intern(%1402, %1405) : (i64, i64) -> i64
      %1407 = func.call @cc_nil_value() : () -> i64
      %1408 = func.call @cc_cons(%1406, %1407) : (i64, i64) -> i64
      %1409 = func.call @cc_values_pack(%1408) : (i64) -> i64
      func.call @stack_push_pointer(%1406) : (i64) -> ()
      %1410 = func.call @stack_pop_pointer() : () -> i64
      %1411 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1412 = arith.constant 5 : i64
      %1413 = func.call @cc_make_string(%1411, %1412) : (!llvm.ptr, i64) -> i64
      %1414 = func.call @cc_nil_value() : () -> i64
      %1415 = func.call @cc_intern(%1413, %1414) : (i64, i64) -> i64
      %1416 = func.call @cc_nil_value() : () -> i64
      %1417 = func.call @cc_cons(%1415, %1416) : (i64, i64) -> i64
      %1418 = func.call @cc_values_pack(%1417) : (i64) -> i64
      func.call @stack_push_pointer(%1415) : (i64) -> ()
      %1419 = func.call @stack_pop_pointer() : () -> i64
      %1420 = func.call @cc_nil_value() : () -> i64
      %1421 = func.call @cc_errorp(%1240) : (i64) -> i64
      %1422 = arith.cmpi ne, %1421, %1420 : i64
      %1423 = arith.cmpi eq, %1420, %1420 : i64
      %1424 = arith.andi %1422, %1423 : i1
      %1425 = scf.if %1424 -> (i64) {
        scf.yield %1240 : i64
      } else {
        scf.yield %1420 : i64
      }
      %1426 = func.call @cc_errorp(%1305) : (i64) -> i64
      %1427 = arith.cmpi ne, %1426, %1420 : i64
      %1428 = arith.cmpi eq, %1425, %1420 : i64
      %1429 = arith.andi %1427, %1428 : i1
      %1430 = scf.if %1429 -> (i64) {
        scf.yield %1305 : i64
      } else {
        scf.yield %1425 : i64
      }
      %1431 = func.call @cc_errorp(%1364) : (i64) -> i64
      %1432 = arith.cmpi ne, %1431, %1420 : i64
      %1433 = arith.cmpi eq, %1430, %1420 : i64
      %1434 = arith.andi %1432, %1433 : i1
      %1435 = scf.if %1434 -> (i64) {
        scf.yield %1364 : i64
      } else {
        scf.yield %1430 : i64
      }
      %1436 = func.call @cc_errorp(%1387) : (i64) -> i64
      %1437 = arith.cmpi ne, %1436, %1420 : i64
      %1438 = arith.cmpi eq, %1435, %1420 : i64
      %1439 = arith.andi %1437, %1438 : i1
      %1440 = scf.if %1439 -> (i64) {
        scf.yield %1387 : i64
      } else {
        scf.yield %1435 : i64
      }
      %1441 = func.call @cc_errorp(%1398) : (i64) -> i64
      %1442 = arith.cmpi ne, %1441, %1420 : i64
      %1443 = arith.cmpi eq, %1440, %1420 : i64
      %1444 = arith.andi %1442, %1443 : i1
      %1445 = scf.if %1444 -> (i64) {
        scf.yield %1398 : i64
      } else {
        scf.yield %1440 : i64
      }
      %1446 = func.call @cc_errorp(%1399) : (i64) -> i64
      %1447 = arith.cmpi ne, %1446, %1420 : i64
      %1448 = arith.cmpi eq, %1445, %1420 : i64
      %1449 = arith.andi %1447, %1448 : i1
      %1450 = scf.if %1449 -> (i64) {
        scf.yield %1399 : i64
      } else {
        scf.yield %1445 : i64
      }
      %1451 = func.call @cc_errorp(%1410) : (i64) -> i64
      %1452 = arith.cmpi ne, %1451, %1420 : i64
      %1453 = arith.cmpi eq, %1450, %1420 : i64
      %1454 = arith.andi %1452, %1453 : i1
      %1455 = scf.if %1454 -> (i64) {
        scf.yield %1410 : i64
      } else {
        scf.yield %1450 : i64
      }
      %1456 = func.call @cc_errorp(%1419) : (i64) -> i64
      %1457 = arith.cmpi ne, %1456, %1420 : i64
      %1458 = arith.cmpi eq, %1455, %1420 : i64
      %1459 = arith.andi %1457, %1458 : i1
      %1460 = scf.if %1459 -> (i64) {
        scf.yield %1419 : i64
      } else {
        scf.yield %1455 : i64
      }
      %1461 = arith.cmpi ne, %1460, %1420 : i64
      scf.if %1461 {
        func.call @stack_push_pointer(%1460) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1240) : (i64) -> ()
        func.call @stack_push_pointer(%1305) : (i64) -> ()
        func.call @stack_push_pointer(%1364) : (i64) -> ()
        func.call @stack_push_pointer(%1387) : (i64) -> ()
        func.call @stack_push_pointer(%1398) : (i64) -> ()
        func.call @stack_push_pointer(%1399) : (i64) -> ()
        func.call @stack_push_pointer(%1410) : (i64) -> ()
        func.call @stack_push_pointer(%1419) : (i64) -> ()
        %1462 = llvm.mlir.addressof @str103 : !llvm.ptr
        %1463 = func.call @cc_make_function_ref_const(%1462) : (!llvm.ptr) -> i64
        %1464 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1463, %1464) : (i64, i64) -> ()
      }
      %1465 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1465 : i64
    }
    %1466 = func.call @cc_nil_value() : () -> i64
    %1467 = func.call @cc_errorp(%1231) : (i64) -> i64
    %1468 = arith.cmpi ne, %1467, %1466 : i64
    %1469 = scf.if %1468 -> (i64) {
      scf.yield %1231 : i64
    } else {
      %1470 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1471 = arith.constant 27 : i64
      %1472 = func.call @cc_make_string(%1470, %1471) : (!llvm.ptr, i64) -> i64
      %1473 = func.call @cc_nil_value() : () -> i64
      %1474 = func.call @cc_intern(%1472, %1473) : (i64, i64) -> i64
      %1475 = func.call @cc_nil_value() : () -> i64
      %1476 = func.call @cc_cons(%1474, %1475) : (i64, i64) -> i64
      %1477 = func.call @cc_values_pack(%1476) : (i64) -> i64
      func.call @stack_push_pointer(%1474) : (i64) -> ()
      %1478 = func.call @stack_pop_pointer() : () -> i64
      %1479 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1480 = arith.constant 13 : i64
      %1481 = func.call @cc_make_string(%1479, %1480) : (!llvm.ptr, i64) -> i64
      %1482 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1483 = arith.constant 11 : i64
      %1484 = func.call @cc_make_string(%1482, %1483) : (!llvm.ptr, i64) -> i64
      %1485 = func.call @cc_intern(%1481, %1484) : (i64, i64) -> i64
      %1486 = func.call @cc_nil_value() : () -> i64
      %1487 = func.call @cc_cons(%1485, %1486) : (i64, i64) -> i64
      %1488 = func.call @cc_values_pack(%1487) : (i64) -> i64
      func.call @stack_push_pointer(%1485) : (i64) -> ()
      %1489 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1490 = arith.constant 6 : i64
      %1491 = func.call @cc_make_string(%1489, %1490) : (!llvm.ptr, i64) -> i64
      %1492 = func.call @cc_nil_value() : () -> i64
      %1493 = func.call @cc_intern(%1491, %1492) : (i64, i64) -> i64
      %1494 = func.call @cc_nil_value() : () -> i64
      %1495 = func.call @cc_cons(%1493, %1494) : (i64, i64) -> i64
      %1496 = func.call @cc_values_pack(%1495) : (i64) -> i64
      func.call @stack_push_pointer(%1493) : (i64) -> ()
      %1497 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1498 = arith.constant 19 : i64
      %1499 = func.call @cc_make_string(%1497, %1498) : (!llvm.ptr, i64) -> i64
      %1500 = func.call @cc_nil_value() : () -> i64
      %1501 = func.call @cc_intern(%1499, %1500) : (i64, i64) -> i64
      %1502 = func.call @cc_nil_value() : () -> i64
      %1503 = func.call @cc_cons(%1501, %1502) : (i64, i64) -> i64
      %1504 = func.call @cc_values_pack(%1503) : (i64) -> i64
      func.call @stack_push_pointer(%1501) : (i64) -> ()
      %1505 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1506 = arith.constant 20 : i64
      %1507 = func.call @cc_make_string(%1505, %1506) : (!llvm.ptr, i64) -> i64
      %1508 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1509 = arith.constant 3 : i64
      %1510 = func.call @cc_make_string(%1508, %1509) : (!llvm.ptr, i64) -> i64
      %1511 = func.call @cc_intern(%1507, %1510) : (i64, i64) -> i64
      %1512 = func.call @cc_nil_value() : () -> i64
      %1513 = func.call @cc_cons(%1511, %1512) : (i64, i64) -> i64
      %1514 = func.call @cc_values_pack(%1513) : (i64) -> i64
      func.call @stack_push_pointer(%1511) : (i64) -> ()
      %1515 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1516 = func.call @stack_pop_pointer() : () -> i64
      %1517 = func.call @stack_pop_pointer() : () -> i64
      %1518 = func.call @cc_cons(%1517, %1516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1518) : (i64) -> ()
      %1519 = func.call @stack_pop_pointer() : () -> i64
      %1520 = func.call @stack_pop_pointer() : () -> i64
      %1521 = func.call @cc_cons(%1520, %1519) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1521) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1522 = func.call @stack_pop_pointer() : () -> i64
      %1523 = func.call @stack_pop_pointer() : () -> i64
      %1524 = func.call @cc_cons(%1523, %1522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1524) : (i64) -> ()
      %1525 = func.call @stack_pop_pointer() : () -> i64
      %1526 = func.call @stack_pop_pointer() : () -> i64
      %1527 = func.call @cc_cons(%1526, %1525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1527) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1528 = func.call @stack_pop_pointer() : () -> i64
      %1529 = func.call @stack_pop_pointer() : () -> i64
      %1530 = func.call @cc_cons(%1529, %1528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1530) : (i64) -> ()
      %1531 = func.call @stack_pop_pointer() : () -> i64
      %1532 = func.call @stack_pop_pointer() : () -> i64
      %1533 = func.call @cc_cons(%1532, %1531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1533) : (i64) -> ()
      %1534 = func.call @stack_pop_pointer() : () -> i64
      %1535 = func.call @stack_pop_pointer() : () -> i64
      %1536 = func.call @cc_cons(%1535, %1534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1536) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1537 = func.call @stack_pop_pointer() : () -> i64
      %1538 = func.call @stack_pop_pointer() : () -> i64
      %1539 = func.call @cc_cons(%1538, %1537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1539) : (i64) -> ()
      %1540 = func.call @stack_pop_pointer() : () -> i64
      %1541 = func.call @stack_pop_pointer() : () -> i64
      %1542 = func.call @cc_cons(%1541, %1540) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1542) : (i64) -> ()
      %1543 = func.call @stack_pop_pointer() : () -> i64
      %1599 = arith.constant 162741310455812 : i64
      %1600 = arith.constant 0 : i64
      %1601 = func.call @cc_make_closure(%1599, %1600) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1601) : (i64) -> ()
      %1602 = func.call @stack_pop_pointer() : () -> i64
      %1603 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1604 = arith.constant 4 : i64
      %1605 = func.call @cc_make_string(%1603, %1604) : (!llvm.ptr, i64) -> i64
      %1606 = func.call @cc_nil_value() : () -> i64
      %1607 = func.call @cc_intern(%1605, %1606) : (i64, i64) -> i64
      %1608 = func.call @cc_nil_value() : () -> i64
      %1609 = func.call @cc_cons(%1607, %1608) : (i64, i64) -> i64
      %1610 = func.call @cc_values_pack(%1609) : (i64) -> i64
      func.call @stack_push_pointer(%1607) : (i64) -> ()
      %1611 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1612 = arith.constant 5 : i64
      %1613 = func.call @cc_make_string(%1611, %1612) : (!llvm.ptr, i64) -> i64
      %1614 = func.call @cc_nil_value() : () -> i64
      %1615 = func.call @cc_intern(%1613, %1614) : (i64, i64) -> i64
      %1616 = func.call @cc_nil_value() : () -> i64
      %1617 = func.call @cc_cons(%1615, %1616) : (i64, i64) -> i64
      %1618 = func.call @cc_values_pack(%1617) : (i64) -> i64
      func.call @stack_push_pointer(%1615) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1619 = func.call @stack_pop_pointer() : () -> i64
      %1620 = func.call @stack_pop_pointer() : () -> i64
      %1621 = func.call @cc_cons(%1620, %1619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1621) : (i64) -> ()
      %1622 = func.call @stack_pop_pointer() : () -> i64
      %1623 = func.call @stack_pop_pointer() : () -> i64
      %1624 = func.call @cc_cons(%1623, %1622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1624) : (i64) -> ()
      %1625 = func.call @stack_pop_pointer() : () -> i64
      %1626 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1627 = arith.constant 11 : i64
      %1628 = func.call @cc_make_string(%1626, %1627) : (!llvm.ptr, i64) -> i64
      %1629 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1630 = arith.constant 7 : i64
      %1631 = func.call @cc_make_string(%1629, %1630) : (!llvm.ptr, i64) -> i64
      %1632 = func.call @cc_intern(%1628, %1631) : (i64, i64) -> i64
      %1633 = func.call @cc_nil_value() : () -> i64
      %1634 = func.call @cc_cons(%1632, %1633) : (i64, i64) -> i64
      %1635 = func.call @cc_values_pack(%1634) : (i64) -> i64
      func.call @stack_push_pointer(%1632) : (i64) -> ()
      %1636 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1637 = func.call @stack_pop_pointer() : () -> i64
      %1638 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1639 = arith.constant 4 : i64
      %1640 = func.call @cc_make_string(%1638, %1639) : (!llvm.ptr, i64) -> i64
      %1641 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1642 = arith.constant 7 : i64
      %1643 = func.call @cc_make_string(%1641, %1642) : (!llvm.ptr, i64) -> i64
      %1644 = func.call @cc_intern(%1640, %1643) : (i64, i64) -> i64
      %1645 = func.call @cc_nil_value() : () -> i64
      %1646 = func.call @cc_cons(%1644, %1645) : (i64, i64) -> i64
      %1647 = func.call @cc_values_pack(%1646) : (i64) -> i64
      func.call @stack_push_pointer(%1644) : (i64) -> ()
      %1648 = func.call @stack_pop_pointer() : () -> i64
      %1649 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1650 = arith.constant 5 : i64
      %1651 = func.call @cc_make_string(%1649, %1650) : (!llvm.ptr, i64) -> i64
      %1652 = func.call @cc_nil_value() : () -> i64
      %1653 = func.call @cc_intern(%1651, %1652) : (i64, i64) -> i64
      %1654 = func.call @cc_nil_value() : () -> i64
      %1655 = func.call @cc_cons(%1653, %1654) : (i64, i64) -> i64
      %1656 = func.call @cc_values_pack(%1655) : (i64) -> i64
      func.call @stack_push_pointer(%1653) : (i64) -> ()
      %1657 = func.call @stack_pop_pointer() : () -> i64
      %1658 = func.call @cc_nil_value() : () -> i64
      %1659 = func.call @cc_errorp(%1478) : (i64) -> i64
      %1660 = arith.cmpi ne, %1659, %1658 : i64
      %1661 = arith.cmpi eq, %1658, %1658 : i64
      %1662 = arith.andi %1660, %1661 : i1
      %1663 = scf.if %1662 -> (i64) {
        scf.yield %1478 : i64
      } else {
        scf.yield %1658 : i64
      }
      %1664 = func.call @cc_errorp(%1543) : (i64) -> i64
      %1665 = arith.cmpi ne, %1664, %1658 : i64
      %1666 = arith.cmpi eq, %1663, %1658 : i64
      %1667 = arith.andi %1665, %1666 : i1
      %1668 = scf.if %1667 -> (i64) {
        scf.yield %1543 : i64
      } else {
        scf.yield %1663 : i64
      }
      %1669 = func.call @cc_errorp(%1602) : (i64) -> i64
      %1670 = arith.cmpi ne, %1669, %1658 : i64
      %1671 = arith.cmpi eq, %1668, %1658 : i64
      %1672 = arith.andi %1670, %1671 : i1
      %1673 = scf.if %1672 -> (i64) {
        scf.yield %1602 : i64
      } else {
        scf.yield %1668 : i64
      }
      %1674 = func.call @cc_errorp(%1625) : (i64) -> i64
      %1675 = arith.cmpi ne, %1674, %1658 : i64
      %1676 = arith.cmpi eq, %1673, %1658 : i64
      %1677 = arith.andi %1675, %1676 : i1
      %1678 = scf.if %1677 -> (i64) {
        scf.yield %1625 : i64
      } else {
        scf.yield %1673 : i64
      }
      %1679 = func.call @cc_errorp(%1636) : (i64) -> i64
      %1680 = arith.cmpi ne, %1679, %1658 : i64
      %1681 = arith.cmpi eq, %1678, %1658 : i64
      %1682 = arith.andi %1680, %1681 : i1
      %1683 = scf.if %1682 -> (i64) {
        scf.yield %1636 : i64
      } else {
        scf.yield %1678 : i64
      }
      %1684 = func.call @cc_errorp(%1637) : (i64) -> i64
      %1685 = arith.cmpi ne, %1684, %1658 : i64
      %1686 = arith.cmpi eq, %1683, %1658 : i64
      %1687 = arith.andi %1685, %1686 : i1
      %1688 = scf.if %1687 -> (i64) {
        scf.yield %1637 : i64
      } else {
        scf.yield %1683 : i64
      }
      %1689 = func.call @cc_errorp(%1648) : (i64) -> i64
      %1690 = arith.cmpi ne, %1689, %1658 : i64
      %1691 = arith.cmpi eq, %1688, %1658 : i64
      %1692 = arith.andi %1690, %1691 : i1
      %1693 = scf.if %1692 -> (i64) {
        scf.yield %1648 : i64
      } else {
        scf.yield %1688 : i64
      }
      %1694 = func.call @cc_errorp(%1657) : (i64) -> i64
      %1695 = arith.cmpi ne, %1694, %1658 : i64
      %1696 = arith.cmpi eq, %1693, %1658 : i64
      %1697 = arith.andi %1695, %1696 : i1
      %1698 = scf.if %1697 -> (i64) {
        scf.yield %1657 : i64
      } else {
        scf.yield %1693 : i64
      }
      %1699 = arith.cmpi ne, %1698, %1658 : i64
      scf.if %1699 {
        func.call @stack_push_pointer(%1698) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1478) : (i64) -> ()
        func.call @stack_push_pointer(%1543) : (i64) -> ()
        func.call @stack_push_pointer(%1602) : (i64) -> ()
        func.call @stack_push_pointer(%1625) : (i64) -> ()
        func.call @stack_push_pointer(%1636) : (i64) -> ()
        func.call @stack_push_pointer(%1637) : (i64) -> ()
        func.call @stack_push_pointer(%1648) : (i64) -> ()
        func.call @stack_push_pointer(%1657) : (i64) -> ()
        %1700 = llvm.mlir.addressof @str119 : !llvm.ptr
        %1701 = func.call @cc_make_function_ref_const(%1700) : (!llvm.ptr) -> i64
        %1702 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1701, %1702) : (i64, i64) -> ()
      }
      %1703 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1703 : i64
    }
    %1704 = func.call @cc_nil_value() : () -> i64
    %1705 = func.call @cc_errorp(%1469) : (i64) -> i64
    %1706 = arith.cmpi ne, %1705, %1704 : i64
    %1707 = scf.if %1706 -> (i64) {
      scf.yield %1469 : i64
    } else {
      %1708 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1709 = arith.constant 27 : i64
      %1710 = func.call @cc_make_string(%1708, %1709) : (!llvm.ptr, i64) -> i64
      %1711 = func.call @cc_nil_value() : () -> i64
      %1712 = func.call @cc_intern(%1710, %1711) : (i64, i64) -> i64
      %1713 = func.call @cc_nil_value() : () -> i64
      %1714 = func.call @cc_cons(%1712, %1713) : (i64, i64) -> i64
      %1715 = func.call @cc_values_pack(%1714) : (i64) -> i64
      func.call @stack_push_pointer(%1712) : (i64) -> ()
      %1716 = func.call @stack_pop_pointer() : () -> i64
      %1717 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1718 = arith.constant 13 : i64
      %1719 = func.call @cc_make_string(%1717, %1718) : (!llvm.ptr, i64) -> i64
      %1720 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1721 = arith.constant 11 : i64
      %1722 = func.call @cc_make_string(%1720, %1721) : (!llvm.ptr, i64) -> i64
      %1723 = func.call @cc_intern(%1719, %1722) : (i64, i64) -> i64
      %1724 = func.call @cc_nil_value() : () -> i64
      %1725 = func.call @cc_cons(%1723, %1724) : (i64, i64) -> i64
      %1726 = func.call @cc_values_pack(%1725) : (i64) -> i64
      func.call @stack_push_pointer(%1723) : (i64) -> ()
      %1727 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1728 = arith.constant 6 : i64
      %1729 = func.call @cc_make_string(%1727, %1728) : (!llvm.ptr, i64) -> i64
      %1730 = func.call @cc_nil_value() : () -> i64
      %1731 = func.call @cc_intern(%1729, %1730) : (i64, i64) -> i64
      %1732 = func.call @cc_nil_value() : () -> i64
      %1733 = func.call @cc_cons(%1731, %1732) : (i64, i64) -> i64
      %1734 = func.call @cc_values_pack(%1733) : (i64) -> i64
      func.call @stack_push_pointer(%1731) : (i64) -> ()
      %1735 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1736 = arith.constant 19 : i64
      %1737 = func.call @cc_make_string(%1735, %1736) : (!llvm.ptr, i64) -> i64
      %1738 = func.call @cc_nil_value() : () -> i64
      %1739 = func.call @cc_intern(%1737, %1738) : (i64, i64) -> i64
      %1740 = func.call @cc_nil_value() : () -> i64
      %1741 = func.call @cc_cons(%1739, %1740) : (i64, i64) -> i64
      %1742 = func.call @cc_values_pack(%1741) : (i64) -> i64
      func.call @stack_push_pointer(%1739) : (i64) -> ()
      %1743 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1744 = arith.constant 20 : i64
      %1745 = func.call @cc_make_string(%1743, %1744) : (!llvm.ptr, i64) -> i64
      %1746 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1747 = arith.constant 3 : i64
      %1748 = func.call @cc_make_string(%1746, %1747) : (!llvm.ptr, i64) -> i64
      %1749 = func.call @cc_intern(%1745, %1748) : (i64, i64) -> i64
      %1750 = func.call @cc_nil_value() : () -> i64
      %1751 = func.call @cc_cons(%1749, %1750) : (i64, i64) -> i64
      %1752 = func.call @cc_values_pack(%1751) : (i64) -> i64
      func.call @stack_push_pointer(%1749) : (i64) -> ()
      %1753 = arith.constant 3.0 : f64
      %1754 = func.call @cc_box_float(%1753) : (f64) -> i64
      func.call @stack_push_pointer(%1754) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1755 = func.call @stack_pop_pointer() : () -> i64
      %1756 = func.call @stack_pop_pointer() : () -> i64
      %1757 = func.call @cc_cons(%1756, %1755) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1757) : (i64) -> ()
      %1758 = func.call @stack_pop_pointer() : () -> i64
      %1759 = func.call @stack_pop_pointer() : () -> i64
      %1760 = func.call @cc_cons(%1759, %1758) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1760) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1761 = func.call @stack_pop_pointer() : () -> i64
      %1762 = func.call @stack_pop_pointer() : () -> i64
      %1763 = func.call @cc_cons(%1762, %1761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1763) : (i64) -> ()
      %1764 = func.call @stack_pop_pointer() : () -> i64
      %1765 = func.call @stack_pop_pointer() : () -> i64
      %1766 = func.call @cc_cons(%1765, %1764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1766) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1767 = func.call @stack_pop_pointer() : () -> i64
      %1768 = func.call @stack_pop_pointer() : () -> i64
      %1769 = func.call @cc_cons(%1768, %1767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1769) : (i64) -> ()
      %1770 = func.call @stack_pop_pointer() : () -> i64
      %1771 = func.call @stack_pop_pointer() : () -> i64
      %1772 = func.call @cc_cons(%1771, %1770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1772) : (i64) -> ()
      %1773 = func.call @stack_pop_pointer() : () -> i64
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = func.call @cc_cons(%1774, %1773) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1775) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1776 = func.call @stack_pop_pointer() : () -> i64
      %1777 = func.call @stack_pop_pointer() : () -> i64
      %1778 = func.call @cc_cons(%1777, %1776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1778) : (i64) -> ()
      %1779 = func.call @stack_pop_pointer() : () -> i64
      %1780 = func.call @stack_pop_pointer() : () -> i64
      %1781 = func.call @cc_cons(%1780, %1779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1781) : (i64) -> ()
      %1782 = func.call @stack_pop_pointer() : () -> i64
      %1839 = arith.constant 162741310455813 : i64
      %1840 = arith.constant 0 : i64
      %1841 = func.call @cc_make_closure(%1839, %1840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1841) : (i64) -> ()
      %1842 = func.call @stack_pop_pointer() : () -> i64
      %1843 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1844 = arith.constant 4 : i64
      %1845 = func.call @cc_make_string(%1843, %1844) : (!llvm.ptr, i64) -> i64
      %1846 = func.call @cc_nil_value() : () -> i64
      %1847 = func.call @cc_intern(%1845, %1846) : (i64, i64) -> i64
      %1848 = func.call @cc_nil_value() : () -> i64
      %1849 = func.call @cc_cons(%1847, %1848) : (i64, i64) -> i64
      %1850 = func.call @cc_values_pack(%1849) : (i64) -> i64
      func.call @stack_push_pointer(%1847) : (i64) -> ()
      %1851 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1852 = arith.constant 5 : i64
      %1853 = func.call @cc_make_string(%1851, %1852) : (!llvm.ptr, i64) -> i64
      %1854 = func.call @cc_nil_value() : () -> i64
      %1855 = func.call @cc_intern(%1853, %1854) : (i64, i64) -> i64
      %1856 = func.call @cc_nil_value() : () -> i64
      %1857 = func.call @cc_cons(%1855, %1856) : (i64, i64) -> i64
      %1858 = func.call @cc_values_pack(%1857) : (i64) -> i64
      func.call @stack_push_pointer(%1855) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1859 = func.call @stack_pop_pointer() : () -> i64
      %1860 = func.call @stack_pop_pointer() : () -> i64
      %1861 = func.call @cc_cons(%1860, %1859) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1861) : (i64) -> ()
      %1862 = func.call @stack_pop_pointer() : () -> i64
      %1863 = func.call @stack_pop_pointer() : () -> i64
      %1864 = func.call @cc_cons(%1863, %1862) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1864) : (i64) -> ()
      %1865 = func.call @stack_pop_pointer() : () -> i64
      %1866 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1867 = arith.constant 11 : i64
      %1868 = func.call @cc_make_string(%1866, %1867) : (!llvm.ptr, i64) -> i64
      %1869 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1870 = arith.constant 7 : i64
      %1871 = func.call @cc_make_string(%1869, %1870) : (!llvm.ptr, i64) -> i64
      %1872 = func.call @cc_intern(%1868, %1871) : (i64, i64) -> i64
      %1873 = func.call @cc_nil_value() : () -> i64
      %1874 = func.call @cc_cons(%1872, %1873) : (i64, i64) -> i64
      %1875 = func.call @cc_values_pack(%1874) : (i64) -> i64
      func.call @stack_push_pointer(%1872) : (i64) -> ()
      %1876 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1877 = func.call @stack_pop_pointer() : () -> i64
      %1878 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1879 = arith.constant 4 : i64
      %1880 = func.call @cc_make_string(%1878, %1879) : (!llvm.ptr, i64) -> i64
      %1881 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1882 = arith.constant 7 : i64
      %1883 = func.call @cc_make_string(%1881, %1882) : (!llvm.ptr, i64) -> i64
      %1884 = func.call @cc_intern(%1880, %1883) : (i64, i64) -> i64
      %1885 = func.call @cc_nil_value() : () -> i64
      %1886 = func.call @cc_cons(%1884, %1885) : (i64, i64) -> i64
      %1887 = func.call @cc_values_pack(%1886) : (i64) -> i64
      func.call @stack_push_pointer(%1884) : (i64) -> ()
      %1888 = func.call @stack_pop_pointer() : () -> i64
      %1889 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1890 = arith.constant 5 : i64
      %1891 = func.call @cc_make_string(%1889, %1890) : (!llvm.ptr, i64) -> i64
      %1892 = func.call @cc_nil_value() : () -> i64
      %1893 = func.call @cc_intern(%1891, %1892) : (i64, i64) -> i64
      %1894 = func.call @cc_nil_value() : () -> i64
      %1895 = func.call @cc_cons(%1893, %1894) : (i64, i64) -> i64
      %1896 = func.call @cc_values_pack(%1895) : (i64) -> i64
      func.call @stack_push_pointer(%1893) : (i64) -> ()
      %1897 = func.call @stack_pop_pointer() : () -> i64
      %1898 = func.call @cc_nil_value() : () -> i64
      %1899 = func.call @cc_errorp(%1716) : (i64) -> i64
      %1900 = arith.cmpi ne, %1899, %1898 : i64
      %1901 = arith.cmpi eq, %1898, %1898 : i64
      %1902 = arith.andi %1900, %1901 : i1
      %1903 = scf.if %1902 -> (i64) {
        scf.yield %1716 : i64
      } else {
        scf.yield %1898 : i64
      }
      %1904 = func.call @cc_errorp(%1782) : (i64) -> i64
      %1905 = arith.cmpi ne, %1904, %1898 : i64
      %1906 = arith.cmpi eq, %1903, %1898 : i64
      %1907 = arith.andi %1905, %1906 : i1
      %1908 = scf.if %1907 -> (i64) {
        scf.yield %1782 : i64
      } else {
        scf.yield %1903 : i64
      }
      %1909 = func.call @cc_errorp(%1842) : (i64) -> i64
      %1910 = arith.cmpi ne, %1909, %1898 : i64
      %1911 = arith.cmpi eq, %1908, %1898 : i64
      %1912 = arith.andi %1910, %1911 : i1
      %1913 = scf.if %1912 -> (i64) {
        scf.yield %1842 : i64
      } else {
        scf.yield %1908 : i64
      }
      %1914 = func.call @cc_errorp(%1865) : (i64) -> i64
      %1915 = arith.cmpi ne, %1914, %1898 : i64
      %1916 = arith.cmpi eq, %1913, %1898 : i64
      %1917 = arith.andi %1915, %1916 : i1
      %1918 = scf.if %1917 -> (i64) {
        scf.yield %1865 : i64
      } else {
        scf.yield %1913 : i64
      }
      %1919 = func.call @cc_errorp(%1876) : (i64) -> i64
      %1920 = arith.cmpi ne, %1919, %1898 : i64
      %1921 = arith.cmpi eq, %1918, %1898 : i64
      %1922 = arith.andi %1920, %1921 : i1
      %1923 = scf.if %1922 -> (i64) {
        scf.yield %1876 : i64
      } else {
        scf.yield %1918 : i64
      }
      %1924 = func.call @cc_errorp(%1877) : (i64) -> i64
      %1925 = arith.cmpi ne, %1924, %1898 : i64
      %1926 = arith.cmpi eq, %1923, %1898 : i64
      %1927 = arith.andi %1925, %1926 : i1
      %1928 = scf.if %1927 -> (i64) {
        scf.yield %1877 : i64
      } else {
        scf.yield %1923 : i64
      }
      %1929 = func.call @cc_errorp(%1888) : (i64) -> i64
      %1930 = arith.cmpi ne, %1929, %1898 : i64
      %1931 = arith.cmpi eq, %1928, %1898 : i64
      %1932 = arith.andi %1930, %1931 : i1
      %1933 = scf.if %1932 -> (i64) {
        scf.yield %1888 : i64
      } else {
        scf.yield %1928 : i64
      }
      %1934 = func.call @cc_errorp(%1897) : (i64) -> i64
      %1935 = arith.cmpi ne, %1934, %1898 : i64
      %1936 = arith.cmpi eq, %1933, %1898 : i64
      %1937 = arith.andi %1935, %1936 : i1
      %1938 = scf.if %1937 -> (i64) {
        scf.yield %1897 : i64
      } else {
        scf.yield %1933 : i64
      }
      %1939 = arith.cmpi ne, %1938, %1898 : i64
      scf.if %1939 {
        func.call @stack_push_pointer(%1938) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1716) : (i64) -> ()
        func.call @stack_push_pointer(%1782) : (i64) -> ()
        func.call @stack_push_pointer(%1842) : (i64) -> ()
        func.call @stack_push_pointer(%1865) : (i64) -> ()
        func.call @stack_push_pointer(%1876) : (i64) -> ()
        func.call @stack_push_pointer(%1877) : (i64) -> ()
        func.call @stack_push_pointer(%1888) : (i64) -> ()
        func.call @stack_push_pointer(%1897) : (i64) -> ()
        %1940 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1941 = func.call @cc_make_function_ref_const(%1940) : (!llvm.ptr) -> i64
        %1942 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1941, %1942) : (i64, i64) -> ()
      }
      %1943 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1943 : i64
    }
    %1944 = func.call @cc_nil_value() : () -> i64
    %1945 = func.call @cc_errorp(%1707) : (i64) -> i64
    %1946 = arith.cmpi ne, %1945, %1944 : i64
    %1947 = scf.if %1946 -> (i64) {
      scf.yield %1707 : i64
    } else {
      %1948 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1949 = arith.constant 27 : i64
      %1950 = func.call @cc_make_string(%1948, %1949) : (!llvm.ptr, i64) -> i64
      %1951 = func.call @cc_nil_value() : () -> i64
      %1952 = func.call @cc_intern(%1950, %1951) : (i64, i64) -> i64
      %1953 = func.call @cc_nil_value() : () -> i64
      %1954 = func.call @cc_cons(%1952, %1953) : (i64, i64) -> i64
      %1955 = func.call @cc_values_pack(%1954) : (i64) -> i64
      func.call @stack_push_pointer(%1952) : (i64) -> ()
      %1956 = func.call @stack_pop_pointer() : () -> i64
      %1957 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1958 = arith.constant 13 : i64
      %1959 = func.call @cc_make_string(%1957, %1958) : (!llvm.ptr, i64) -> i64
      %1960 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1961 = arith.constant 11 : i64
      %1962 = func.call @cc_make_string(%1960, %1961) : (!llvm.ptr, i64) -> i64
      %1963 = func.call @cc_intern(%1959, %1962) : (i64, i64) -> i64
      %1964 = func.call @cc_nil_value() : () -> i64
      %1965 = func.call @cc_cons(%1963, %1964) : (i64, i64) -> i64
      %1966 = func.call @cc_values_pack(%1965) : (i64) -> i64
      func.call @stack_push_pointer(%1963) : (i64) -> ()
      %1967 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1968 = arith.constant 6 : i64
      %1969 = func.call @cc_make_string(%1967, %1968) : (!llvm.ptr, i64) -> i64
      %1970 = func.call @cc_nil_value() : () -> i64
      %1971 = func.call @cc_intern(%1969, %1970) : (i64, i64) -> i64
      %1972 = func.call @cc_nil_value() : () -> i64
      %1973 = func.call @cc_cons(%1971, %1972) : (i64, i64) -> i64
      %1974 = func.call @cc_values_pack(%1973) : (i64) -> i64
      func.call @stack_push_pointer(%1971) : (i64) -> ()
      %1975 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1976 = arith.constant 19 : i64
      %1977 = func.call @cc_make_string(%1975, %1976) : (!llvm.ptr, i64) -> i64
      %1978 = func.call @cc_nil_value() : () -> i64
      %1979 = func.call @cc_intern(%1977, %1978) : (i64, i64) -> i64
      %1980 = func.call @cc_nil_value() : () -> i64
      %1981 = func.call @cc_cons(%1979, %1980) : (i64, i64) -> i64
      %1982 = func.call @cc_values_pack(%1981) : (i64) -> i64
      func.call @stack_push_pointer(%1979) : (i64) -> ()
      %1983 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1984 = arith.constant 20 : i64
      %1985 = func.call @cc_make_string(%1983, %1984) : (!llvm.ptr, i64) -> i64
      %1986 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1987 = arith.constant 3 : i64
      %1988 = func.call @cc_make_string(%1986, %1987) : (!llvm.ptr, i64) -> i64
      %1989 = func.call @cc_intern(%1985, %1988) : (i64, i64) -> i64
      %1990 = func.call @cc_nil_value() : () -> i64
      %1991 = func.call @cc_cons(%1989, %1990) : (i64, i64) -> i64
      %1992 = func.call @cc_values_pack(%1991) : (i64) -> i64
      func.call @stack_push_pointer(%1989) : (i64) -> ()
      %1993 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1994 = arith.constant 2 : i64
      %1995 = func.call @cc_make_string(%1993, %1994) : (!llvm.ptr, i64) -> i64
      %1996 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1997 = arith.constant 11 : i64
      %1998 = func.call @cc_make_string(%1996, %1997) : (!llvm.ptr, i64) -> i64
      %1999 = func.call @cc_intern(%1995, %1998) : (i64, i64) -> i64
      %2000 = func.call @cc_nil_value() : () -> i64
      %2001 = func.call @cc_cons(%1999, %2000) : (i64, i64) -> i64
      %2002 = func.call @cc_values_pack(%2001) : (i64) -> i64
      func.call @stack_push_pointer(%1999) : (i64) -> ()
      %2003 = llvm.mlir.addressof @str145 : !llvm.ptr
      %2004 = arith.constant 20 : i64
      %2005 = func.call @cc_make_string(%2003, %2004) : (!llvm.ptr, i64) -> i64
      %2006 = llvm.mlir.addressof @str146 : !llvm.ptr
      %2007 = arith.constant 11 : i64
      %2008 = func.call @cc_make_string(%2006, %2007) : (!llvm.ptr, i64) -> i64
      %2009 = func.call @cc_intern(%2005, %2008) : (i64, i64) -> i64
      %2010 = func.call @cc_nil_value() : () -> i64
      %2011 = func.call @cc_cons(%2009, %2010) : (i64, i64) -> i64
      %2012 = func.call @cc_values_pack(%2011) : (i64) -> i64
      func.call @stack_push_pointer(%2009) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2013 = func.call @stack_pop_pointer() : () -> i64
      %2014 = func.call @stack_pop_pointer() : () -> i64
      %2015 = func.call @cc_cons(%2014, %2013) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2015) : (i64) -> ()
      %2016 = func.call @stack_pop_pointer() : () -> i64
      %2017 = func.call @stack_pop_pointer() : () -> i64
      %2018 = func.call @cc_cons(%2017, %2016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2018) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2019 = func.call @stack_pop_pointer() : () -> i64
      %2020 = func.call @stack_pop_pointer() : () -> i64
      %2021 = func.call @cc_cons(%2020, %2019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2021) : (i64) -> ()
      %2022 = func.call @stack_pop_pointer() : () -> i64
      %2023 = func.call @stack_pop_pointer() : () -> i64
      %2024 = func.call @cc_cons(%2023, %2022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2024) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2025 = func.call @stack_pop_pointer() : () -> i64
      %2026 = func.call @stack_pop_pointer() : () -> i64
      %2027 = func.call @cc_cons(%2026, %2025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2027) : (i64) -> ()
      %2028 = func.call @stack_pop_pointer() : () -> i64
      %2029 = func.call @stack_pop_pointer() : () -> i64
      %2030 = func.call @cc_cons(%2029, %2028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2030) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2031 = func.call @stack_pop_pointer() : () -> i64
      %2032 = func.call @stack_pop_pointer() : () -> i64
      %2033 = func.call @cc_cons(%2032, %2031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2033) : (i64) -> ()
      %2034 = func.call @stack_pop_pointer() : () -> i64
      %2035 = func.call @stack_pop_pointer() : () -> i64
      %2036 = func.call @cc_cons(%2035, %2034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2036) : (i64) -> ()
      %2037 = func.call @stack_pop_pointer() : () -> i64
      %2038 = func.call @stack_pop_pointer() : () -> i64
      %2039 = func.call @cc_cons(%2038, %2037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2039) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2040 = func.call @stack_pop_pointer() : () -> i64
      %2041 = func.call @stack_pop_pointer() : () -> i64
      %2042 = func.call @cc_cons(%2041, %2040) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2042) : (i64) -> ()
      %2043 = func.call @stack_pop_pointer() : () -> i64
      %2044 = func.call @stack_pop_pointer() : () -> i64
      %2045 = func.call @cc_cons(%2044, %2043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2045) : (i64) -> ()
      %2046 = func.call @stack_pop_pointer() : () -> i64
      %2140 = arith.constant 162741310455814 : i64
      %2141 = arith.constant 0 : i64
      %2142 = func.call @cc_make_closure(%2140, %2141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2142) : (i64) -> ()
      %2143 = func.call @stack_pop_pointer() : () -> i64
      %2144 = llvm.mlir.addressof @str150 : !llvm.ptr
      %2145 = arith.constant 4 : i64
      %2146 = func.call @cc_make_string(%2144, %2145) : (!llvm.ptr, i64) -> i64
      %2147 = func.call @cc_nil_value() : () -> i64
      %2148 = func.call @cc_intern(%2146, %2147) : (i64, i64) -> i64
      %2149 = func.call @cc_nil_value() : () -> i64
      %2150 = func.call @cc_cons(%2148, %2149) : (i64, i64) -> i64
      %2151 = func.call @cc_values_pack(%2150) : (i64) -> i64
      func.call @stack_push_pointer(%2148) : (i64) -> ()
      %2152 = llvm.mlir.addressof @str151 : !llvm.ptr
      %2153 = arith.constant 5 : i64
      %2154 = func.call @cc_make_string(%2152, %2153) : (!llvm.ptr, i64) -> i64
      %2155 = func.call @cc_nil_value() : () -> i64
      %2156 = func.call @cc_intern(%2154, %2155) : (i64, i64) -> i64
      %2157 = func.call @cc_nil_value() : () -> i64
      %2158 = func.call @cc_cons(%2156, %2157) : (i64, i64) -> i64
      %2159 = func.call @cc_values_pack(%2158) : (i64) -> i64
      func.call @stack_push_pointer(%2156) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2160 = func.call @stack_pop_pointer() : () -> i64
      %2161 = func.call @stack_pop_pointer() : () -> i64
      %2162 = func.call @cc_cons(%2161, %2160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2162) : (i64) -> ()
      %2163 = func.call @stack_pop_pointer() : () -> i64
      %2164 = func.call @stack_pop_pointer() : () -> i64
      %2165 = func.call @cc_cons(%2164, %2163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2165) : (i64) -> ()
      %2166 = func.call @stack_pop_pointer() : () -> i64
      %2167 = llvm.mlir.addressof @str152 : !llvm.ptr
      %2168 = arith.constant 11 : i64
      %2169 = func.call @cc_make_string(%2167, %2168) : (!llvm.ptr, i64) -> i64
      %2170 = llvm.mlir.addressof @str153 : !llvm.ptr
      %2171 = arith.constant 7 : i64
      %2172 = func.call @cc_make_string(%2170, %2171) : (!llvm.ptr, i64) -> i64
      %2173 = func.call @cc_intern(%2169, %2172) : (i64, i64) -> i64
      %2174 = func.call @cc_nil_value() : () -> i64
      %2175 = func.call @cc_cons(%2173, %2174) : (i64, i64) -> i64
      %2176 = func.call @cc_values_pack(%2175) : (i64) -> i64
      func.call @stack_push_pointer(%2173) : (i64) -> ()
      %2177 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2178 = func.call @stack_pop_pointer() : () -> i64
      %2179 = llvm.mlir.addressof @str154 : !llvm.ptr
      %2180 = arith.constant 4 : i64
      %2181 = func.call @cc_make_string(%2179, %2180) : (!llvm.ptr, i64) -> i64
      %2182 = llvm.mlir.addressof @str155 : !llvm.ptr
      %2183 = arith.constant 7 : i64
      %2184 = func.call @cc_make_string(%2182, %2183) : (!llvm.ptr, i64) -> i64
      %2185 = func.call @cc_intern(%2181, %2184) : (i64, i64) -> i64
      %2186 = func.call @cc_nil_value() : () -> i64
      %2187 = func.call @cc_cons(%2185, %2186) : (i64, i64) -> i64
      %2188 = func.call @cc_values_pack(%2187) : (i64) -> i64
      func.call @stack_push_pointer(%2185) : (i64) -> ()
      %2189 = func.call @stack_pop_pointer() : () -> i64
      %2190 = llvm.mlir.addressof @str156 : !llvm.ptr
      %2191 = arith.constant 5 : i64
      %2192 = func.call @cc_make_string(%2190, %2191) : (!llvm.ptr, i64) -> i64
      %2193 = func.call @cc_nil_value() : () -> i64
      %2194 = func.call @cc_intern(%2192, %2193) : (i64, i64) -> i64
      %2195 = func.call @cc_nil_value() : () -> i64
      %2196 = func.call @cc_cons(%2194, %2195) : (i64, i64) -> i64
      %2197 = func.call @cc_values_pack(%2196) : (i64) -> i64
      func.call @stack_push_pointer(%2194) : (i64) -> ()
      %2198 = func.call @stack_pop_pointer() : () -> i64
      %2199 = func.call @cc_nil_value() : () -> i64
      %2200 = func.call @cc_errorp(%1956) : (i64) -> i64
      %2201 = arith.cmpi ne, %2200, %2199 : i64
      %2202 = arith.cmpi eq, %2199, %2199 : i64
      %2203 = arith.andi %2201, %2202 : i1
      %2204 = scf.if %2203 -> (i64) {
        scf.yield %1956 : i64
      } else {
        scf.yield %2199 : i64
      }
      %2205 = func.call @cc_errorp(%2046) : (i64) -> i64
      %2206 = arith.cmpi ne, %2205, %2199 : i64
      %2207 = arith.cmpi eq, %2204, %2199 : i64
      %2208 = arith.andi %2206, %2207 : i1
      %2209 = scf.if %2208 -> (i64) {
        scf.yield %2046 : i64
      } else {
        scf.yield %2204 : i64
      }
      %2210 = func.call @cc_errorp(%2143) : (i64) -> i64
      %2211 = arith.cmpi ne, %2210, %2199 : i64
      %2212 = arith.cmpi eq, %2209, %2199 : i64
      %2213 = arith.andi %2211, %2212 : i1
      %2214 = scf.if %2213 -> (i64) {
        scf.yield %2143 : i64
      } else {
        scf.yield %2209 : i64
      }
      %2215 = func.call @cc_errorp(%2166) : (i64) -> i64
      %2216 = arith.cmpi ne, %2215, %2199 : i64
      %2217 = arith.cmpi eq, %2214, %2199 : i64
      %2218 = arith.andi %2216, %2217 : i1
      %2219 = scf.if %2218 -> (i64) {
        scf.yield %2166 : i64
      } else {
        scf.yield %2214 : i64
      }
      %2220 = func.call @cc_errorp(%2177) : (i64) -> i64
      %2221 = arith.cmpi ne, %2220, %2199 : i64
      %2222 = arith.cmpi eq, %2219, %2199 : i64
      %2223 = arith.andi %2221, %2222 : i1
      %2224 = scf.if %2223 -> (i64) {
        scf.yield %2177 : i64
      } else {
        scf.yield %2219 : i64
      }
      %2225 = func.call @cc_errorp(%2178) : (i64) -> i64
      %2226 = arith.cmpi ne, %2225, %2199 : i64
      %2227 = arith.cmpi eq, %2224, %2199 : i64
      %2228 = arith.andi %2226, %2227 : i1
      %2229 = scf.if %2228 -> (i64) {
        scf.yield %2178 : i64
      } else {
        scf.yield %2224 : i64
      }
      %2230 = func.call @cc_errorp(%2189) : (i64) -> i64
      %2231 = arith.cmpi ne, %2230, %2199 : i64
      %2232 = arith.cmpi eq, %2229, %2199 : i64
      %2233 = arith.andi %2231, %2232 : i1
      %2234 = scf.if %2233 -> (i64) {
        scf.yield %2189 : i64
      } else {
        scf.yield %2229 : i64
      }
      %2235 = func.call @cc_errorp(%2198) : (i64) -> i64
      %2236 = arith.cmpi ne, %2235, %2199 : i64
      %2237 = arith.cmpi eq, %2234, %2199 : i64
      %2238 = arith.andi %2236, %2237 : i1
      %2239 = scf.if %2238 -> (i64) {
        scf.yield %2198 : i64
      } else {
        scf.yield %2234 : i64
      }
      %2240 = arith.cmpi ne, %2239, %2199 : i64
      scf.if %2240 {
        func.call @stack_push_pointer(%2239) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1956) : (i64) -> ()
        func.call @stack_push_pointer(%2046) : (i64) -> ()
        func.call @stack_push_pointer(%2143) : (i64) -> ()
        func.call @stack_push_pointer(%2166) : (i64) -> ()
        func.call @stack_push_pointer(%2177) : (i64) -> ()
        func.call @stack_push_pointer(%2178) : (i64) -> ()
        func.call @stack_push_pointer(%2189) : (i64) -> ()
        func.call @stack_push_pointer(%2198) : (i64) -> ()
        %2241 = llvm.mlir.addressof @str157 : !llvm.ptr
        %2242 = func.call @cc_make_function_ref_const(%2241) : (!llvm.ptr) -> i64
        %2243 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2242, %2243) : (i64, i64) -> ()
      }
      %2244 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2244 : i64
    }
    %2245 = func.call @cc_nil_value() : () -> i64
    %2246 = func.call @cc_errorp(%1947) : (i64) -> i64
    %2247 = arith.cmpi ne, %2246, %2245 : i64
    %2248 = scf.if %2247 -> (i64) {
      scf.yield %1947 : i64
    } else {
      %2249 = llvm.mlir.addressof @str158 : !llvm.ptr
      %2250 = arith.constant 27 : i64
      %2251 = func.call @cc_make_string(%2249, %2250) : (!llvm.ptr, i64) -> i64
      %2252 = func.call @cc_nil_value() : () -> i64
      %2253 = func.call @cc_intern(%2251, %2252) : (i64, i64) -> i64
      %2254 = func.call @cc_nil_value() : () -> i64
      %2255 = func.call @cc_cons(%2253, %2254) : (i64, i64) -> i64
      %2256 = func.call @cc_values_pack(%2255) : (i64) -> i64
      func.call @stack_push_pointer(%2253) : (i64) -> ()
      %2257 = func.call @stack_pop_pointer() : () -> i64
      %2258 = llvm.mlir.addressof @str159 : !llvm.ptr
      %2259 = arith.constant 13 : i64
      %2260 = func.call @cc_make_string(%2258, %2259) : (!llvm.ptr, i64) -> i64
      %2261 = llvm.mlir.addressof @str160 : !llvm.ptr
      %2262 = arith.constant 11 : i64
      %2263 = func.call @cc_make_string(%2261, %2262) : (!llvm.ptr, i64) -> i64
      %2264 = func.call @cc_intern(%2260, %2263) : (i64, i64) -> i64
      %2265 = func.call @cc_nil_value() : () -> i64
      %2266 = func.call @cc_cons(%2264, %2265) : (i64, i64) -> i64
      %2267 = func.call @cc_values_pack(%2266) : (i64) -> i64
      func.call @stack_push_pointer(%2264) : (i64) -> ()
      %2268 = llvm.mlir.addressof @str161 : !llvm.ptr
      %2269 = arith.constant 6 : i64
      %2270 = func.call @cc_make_string(%2268, %2269) : (!llvm.ptr, i64) -> i64
      %2271 = func.call @cc_nil_value() : () -> i64
      %2272 = func.call @cc_intern(%2270, %2271) : (i64, i64) -> i64
      %2273 = func.call @cc_nil_value() : () -> i64
      %2274 = func.call @cc_cons(%2272, %2273) : (i64, i64) -> i64
      %2275 = func.call @cc_values_pack(%2274) : (i64) -> i64
      func.call @stack_push_pointer(%2272) : (i64) -> ()
      %2276 = llvm.mlir.addressof @str162 : !llvm.ptr
      %2277 = arith.constant 19 : i64
      %2278 = func.call @cc_make_string(%2276, %2277) : (!llvm.ptr, i64) -> i64
      %2279 = func.call @cc_nil_value() : () -> i64
      %2280 = func.call @cc_intern(%2278, %2279) : (i64, i64) -> i64
      %2281 = func.call @cc_nil_value() : () -> i64
      %2282 = func.call @cc_cons(%2280, %2281) : (i64, i64) -> i64
      %2283 = func.call @cc_values_pack(%2282) : (i64) -> i64
      func.call @stack_push_pointer(%2280) : (i64) -> ()
      %2284 = llvm.mlir.addressof @str163 : !llvm.ptr
      %2285 = arith.constant 20 : i64
      %2286 = func.call @cc_make_string(%2284, %2285) : (!llvm.ptr, i64) -> i64
      %2287 = llvm.mlir.addressof @str164 : !llvm.ptr
      %2288 = arith.constant 3 : i64
      %2289 = func.call @cc_make_string(%2287, %2288) : (!llvm.ptr, i64) -> i64
      %2290 = func.call @cc_intern(%2286, %2289) : (i64, i64) -> i64
      %2291 = func.call @cc_nil_value() : () -> i64
      %2292 = func.call @cc_cons(%2290, %2291) : (i64, i64) -> i64
      %2293 = func.call @cc_values_pack(%2292) : (i64) -> i64
      func.call @stack_push_pointer(%2290) : (i64) -> ()
      %2294 = llvm.mlir.addressof @str165 : !llvm.ptr
      %2295 = arith.constant 2 : i64
      %2296 = func.call @cc_make_string(%2294, %2295) : (!llvm.ptr, i64) -> i64
      %2297 = llvm.mlir.addressof @str166 : !llvm.ptr
      %2298 = arith.constant 11 : i64
      %2299 = func.call @cc_make_string(%2297, %2298) : (!llvm.ptr, i64) -> i64
      %2300 = func.call @cc_intern(%2296, %2299) : (i64, i64) -> i64
      %2301 = func.call @cc_nil_value() : () -> i64
      %2302 = func.call @cc_cons(%2300, %2301) : (i64, i64) -> i64
      %2303 = func.call @cc_values_pack(%2302) : (i64) -> i64
      func.call @stack_push_pointer(%2300) : (i64) -> ()
      %2304 = llvm.mlir.addressof @str167 : !llvm.ptr
      %2305 = arith.constant 20 : i64
      %2306 = func.call @cc_make_string(%2304, %2305) : (!llvm.ptr, i64) -> i64
      %2307 = llvm.mlir.addressof @str168 : !llvm.ptr
      %2308 = arith.constant 11 : i64
      %2309 = func.call @cc_make_string(%2307, %2308) : (!llvm.ptr, i64) -> i64
      %2310 = func.call @cc_intern(%2306, %2309) : (i64, i64) -> i64
      %2311 = func.call @cc_nil_value() : () -> i64
      %2312 = func.call @cc_cons(%2310, %2311) : (i64, i64) -> i64
      %2313 = func.call @cc_values_pack(%2312) : (i64) -> i64
      func.call @stack_push_pointer(%2310) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %2326 = func.call @stack_pop_pointer() : () -> i64
      %2327 = func.call @stack_pop_pointer() : () -> i64
      %2328 = func.call @cc_cons(%2327, %2326) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2328) : (i64) -> ()
      %2329 = func.call @stack_pop_pointer() : () -> i64
      %2330 = func.call @stack_pop_pointer() : () -> i64
      %2331 = func.call @cc_cons(%2330, %2329) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2331) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2332 = func.call @stack_pop_pointer() : () -> i64
      %2333 = func.call @stack_pop_pointer() : () -> i64
      %2334 = func.call @cc_cons(%2333, %2332) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2334) : (i64) -> ()
      %2335 = func.call @stack_pop_pointer() : () -> i64
      %2336 = func.call @stack_pop_pointer() : () -> i64
      %2337 = func.call @cc_cons(%2336, %2335) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2337) : (i64) -> ()
      %2338 = func.call @stack_pop_pointer() : () -> i64
      %2339 = func.call @stack_pop_pointer() : () -> i64
      %2340 = func.call @cc_cons(%2339, %2338) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2340) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2341 = func.call @stack_pop_pointer() : () -> i64
      %2342 = func.call @stack_pop_pointer() : () -> i64
      %2343 = func.call @cc_cons(%2342, %2341) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2343) : (i64) -> ()
      %2344 = func.call @stack_pop_pointer() : () -> i64
      %2345 = func.call @stack_pop_pointer() : () -> i64
      %2346 = func.call @cc_cons(%2345, %2344) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2346) : (i64) -> ()
      %2347 = func.call @stack_pop_pointer() : () -> i64
      %2441 = arith.constant 162741310455815 : i64
      %2442 = arith.constant 0 : i64
      %2443 = func.call @cc_make_closure(%2441, %2442) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2443) : (i64) -> ()
      %2444 = func.call @stack_pop_pointer() : () -> i64
      %2445 = llvm.mlir.addressof @str172 : !llvm.ptr
      %2446 = arith.constant 4 : i64
      %2447 = func.call @cc_make_string(%2445, %2446) : (!llvm.ptr, i64) -> i64
      %2448 = func.call @cc_nil_value() : () -> i64
      %2449 = func.call @cc_intern(%2447, %2448) : (i64, i64) -> i64
      %2450 = func.call @cc_nil_value() : () -> i64
      %2451 = func.call @cc_cons(%2449, %2450) : (i64, i64) -> i64
      %2452 = func.call @cc_values_pack(%2451) : (i64) -> i64
      func.call @stack_push_pointer(%2449) : (i64) -> ()
      %2453 = llvm.mlir.addressof @str173 : !llvm.ptr
      %2454 = arith.constant 5 : i64
      %2455 = func.call @cc_make_string(%2453, %2454) : (!llvm.ptr, i64) -> i64
      %2456 = func.call @cc_nil_value() : () -> i64
      %2457 = func.call @cc_intern(%2455, %2456) : (i64, i64) -> i64
      %2458 = func.call @cc_nil_value() : () -> i64
      %2459 = func.call @cc_cons(%2457, %2458) : (i64, i64) -> i64
      %2460 = func.call @cc_values_pack(%2459) : (i64) -> i64
      func.call @stack_push_pointer(%2457) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2461 = func.call @stack_pop_pointer() : () -> i64
      %2462 = func.call @stack_pop_pointer() : () -> i64
      %2463 = func.call @cc_cons(%2462, %2461) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2463) : (i64) -> ()
      %2464 = func.call @stack_pop_pointer() : () -> i64
      %2465 = func.call @stack_pop_pointer() : () -> i64
      %2466 = func.call @cc_cons(%2465, %2464) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2466) : (i64) -> ()
      %2467 = func.call @stack_pop_pointer() : () -> i64
      %2468 = llvm.mlir.addressof @str174 : !llvm.ptr
      %2469 = arith.constant 11 : i64
      %2470 = func.call @cc_make_string(%2468, %2469) : (!llvm.ptr, i64) -> i64
      %2471 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2472 = arith.constant 7 : i64
      %2473 = func.call @cc_make_string(%2471, %2472) : (!llvm.ptr, i64) -> i64
      %2474 = func.call @cc_intern(%2470, %2473) : (i64, i64) -> i64
      %2475 = func.call @cc_nil_value() : () -> i64
      %2476 = func.call @cc_cons(%2474, %2475) : (i64, i64) -> i64
      %2477 = func.call @cc_values_pack(%2476) : (i64) -> i64
      func.call @stack_push_pointer(%2474) : (i64) -> ()
      %2478 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2479 = func.call @stack_pop_pointer() : () -> i64
      %2480 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2481 = arith.constant 4 : i64
      %2482 = func.call @cc_make_string(%2480, %2481) : (!llvm.ptr, i64) -> i64
      %2483 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2484 = arith.constant 7 : i64
      %2485 = func.call @cc_make_string(%2483, %2484) : (!llvm.ptr, i64) -> i64
      %2486 = func.call @cc_intern(%2482, %2485) : (i64, i64) -> i64
      %2487 = func.call @cc_nil_value() : () -> i64
      %2488 = func.call @cc_cons(%2486, %2487) : (i64, i64) -> i64
      %2489 = func.call @cc_values_pack(%2488) : (i64) -> i64
      func.call @stack_push_pointer(%2486) : (i64) -> ()
      %2490 = func.call @stack_pop_pointer() : () -> i64
      %2491 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2492 = arith.constant 5 : i64
      %2493 = func.call @cc_make_string(%2491, %2492) : (!llvm.ptr, i64) -> i64
      %2494 = func.call @cc_nil_value() : () -> i64
      %2495 = func.call @cc_intern(%2493, %2494) : (i64, i64) -> i64
      %2496 = func.call @cc_nil_value() : () -> i64
      %2497 = func.call @cc_cons(%2495, %2496) : (i64, i64) -> i64
      %2498 = func.call @cc_values_pack(%2497) : (i64) -> i64
      func.call @stack_push_pointer(%2495) : (i64) -> ()
      %2499 = func.call @stack_pop_pointer() : () -> i64
      %2500 = func.call @cc_nil_value() : () -> i64
      %2501 = func.call @cc_errorp(%2257) : (i64) -> i64
      %2502 = arith.cmpi ne, %2501, %2500 : i64
      %2503 = arith.cmpi eq, %2500, %2500 : i64
      %2504 = arith.andi %2502, %2503 : i1
      %2505 = scf.if %2504 -> (i64) {
        scf.yield %2257 : i64
      } else {
        scf.yield %2500 : i64
      }
      %2506 = func.call @cc_errorp(%2347) : (i64) -> i64
      %2507 = arith.cmpi ne, %2506, %2500 : i64
      %2508 = arith.cmpi eq, %2505, %2500 : i64
      %2509 = arith.andi %2507, %2508 : i1
      %2510 = scf.if %2509 -> (i64) {
        scf.yield %2347 : i64
      } else {
        scf.yield %2505 : i64
      }
      %2511 = func.call @cc_errorp(%2444) : (i64) -> i64
      %2512 = arith.cmpi ne, %2511, %2500 : i64
      %2513 = arith.cmpi eq, %2510, %2500 : i64
      %2514 = arith.andi %2512, %2513 : i1
      %2515 = scf.if %2514 -> (i64) {
        scf.yield %2444 : i64
      } else {
        scf.yield %2510 : i64
      }
      %2516 = func.call @cc_errorp(%2467) : (i64) -> i64
      %2517 = arith.cmpi ne, %2516, %2500 : i64
      %2518 = arith.cmpi eq, %2515, %2500 : i64
      %2519 = arith.andi %2517, %2518 : i1
      %2520 = scf.if %2519 -> (i64) {
        scf.yield %2467 : i64
      } else {
        scf.yield %2515 : i64
      }
      %2521 = func.call @cc_errorp(%2478) : (i64) -> i64
      %2522 = arith.cmpi ne, %2521, %2500 : i64
      %2523 = arith.cmpi eq, %2520, %2500 : i64
      %2524 = arith.andi %2522, %2523 : i1
      %2525 = scf.if %2524 -> (i64) {
        scf.yield %2478 : i64
      } else {
        scf.yield %2520 : i64
      }
      %2526 = func.call @cc_errorp(%2479) : (i64) -> i64
      %2527 = arith.cmpi ne, %2526, %2500 : i64
      %2528 = arith.cmpi eq, %2525, %2500 : i64
      %2529 = arith.andi %2527, %2528 : i1
      %2530 = scf.if %2529 -> (i64) {
        scf.yield %2479 : i64
      } else {
        scf.yield %2525 : i64
      }
      %2531 = func.call @cc_errorp(%2490) : (i64) -> i64
      %2532 = arith.cmpi ne, %2531, %2500 : i64
      %2533 = arith.cmpi eq, %2530, %2500 : i64
      %2534 = arith.andi %2532, %2533 : i1
      %2535 = scf.if %2534 -> (i64) {
        scf.yield %2490 : i64
      } else {
        scf.yield %2530 : i64
      }
      %2536 = func.call @cc_errorp(%2499) : (i64) -> i64
      %2537 = arith.cmpi ne, %2536, %2500 : i64
      %2538 = arith.cmpi eq, %2535, %2500 : i64
      %2539 = arith.andi %2537, %2538 : i1
      %2540 = scf.if %2539 -> (i64) {
        scf.yield %2499 : i64
      } else {
        scf.yield %2535 : i64
      }
      %2541 = arith.cmpi ne, %2540, %2500 : i64
      scf.if %2541 {
        func.call @stack_push_pointer(%2540) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2257) : (i64) -> ()
        func.call @stack_push_pointer(%2347) : (i64) -> ()
        func.call @stack_push_pointer(%2444) : (i64) -> ()
        func.call @stack_push_pointer(%2467) : (i64) -> ()
        func.call @stack_push_pointer(%2478) : (i64) -> ()
        func.call @stack_push_pointer(%2479) : (i64) -> ()
        func.call @stack_push_pointer(%2490) : (i64) -> ()
        func.call @stack_push_pointer(%2499) : (i64) -> ()
        %2542 = llvm.mlir.addressof @str179 : !llvm.ptr
        %2543 = func.call @cc_make_function_ref_const(%2542) : (!llvm.ptr) -> i64
        %2544 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2543, %2544) : (i64, i64) -> ()
      }
      %2545 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2545 : i64
    }
    %2546 = func.call @cc_nil_value() : () -> i64
    %2547 = func.call @cc_errorp(%2248) : (i64) -> i64
    %2548 = arith.cmpi ne, %2547, %2546 : i64
    %2549 = scf.if %2548 -> (i64) {
      scf.yield %2248 : i64
    } else {
      %2550 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2551 = arith.constant 31 : i64
      %2552 = func.call @cc_make_string(%2550, %2551) : (!llvm.ptr, i64) -> i64
      %2553 = func.call @cc_nil_value() : () -> i64
      %2554 = func.call @cc_intern(%2552, %2553) : (i64, i64) -> i64
      %2555 = func.call @cc_nil_value() : () -> i64
      %2556 = func.call @cc_cons(%2554, %2555) : (i64, i64) -> i64
      %2557 = func.call @cc_values_pack(%2556) : (i64) -> i64
      func.call @stack_push_pointer(%2554) : (i64) -> ()
      %2558 = func.call @stack_pop_pointer() : () -> i64
      %2559 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2560 = arith.constant 4 : i64
      %2561 = func.call @cc_make_string(%2559, %2560) : (!llvm.ptr, i64) -> i64
      %2562 = func.call @cc_nil_value() : () -> i64
      %2563 = func.call @cc_intern(%2561, %2562) : (i64, i64) -> i64
      %2564 = func.call @cc_nil_value() : () -> i64
      %2565 = func.call @cc_cons(%2563, %2564) : (i64, i64) -> i64
      %2566 = func.call @cc_values_pack(%2565) : (i64) -> i64
      func.call @stack_push_pointer(%2563) : (i64) -> ()
      %2567 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2568 = arith.constant 3 : i64
      %2569 = func.call @cc_make_string(%2567, %2568) : (!llvm.ptr, i64) -> i64
      %2570 = func.call @cc_nil_value() : () -> i64
      %2571 = func.call @cc_intern(%2569, %2570) : (i64, i64) -> i64
      %2572 = func.call @cc_nil_value() : () -> i64
      %2573 = func.call @cc_cons(%2571, %2572) : (i64, i64) -> i64
      %2574 = func.call @cc_values_pack(%2573) : (i64) -> i64
      func.call @stack_push_pointer(%2571) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2575 = func.call @stack_pop_pointer() : () -> i64
      %2576 = func.call @stack_pop_pointer() : () -> i64
      %2577 = func.call @cc_cons(%2576, %2575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2577) : (i64) -> ()
      %2578 = func.call @stack_pop_pointer() : () -> i64
      %2579 = func.call @stack_pop_pointer() : () -> i64
      %2580 = func.call @cc_cons(%2579, %2578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2580) : (i64) -> ()
      %2581 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2582 = arith.constant 15 : i64
      %2583 = func.call @cc_make_string(%2581, %2582) : (!llvm.ptr, i64) -> i64
      %2584 = func.call @cc_nil_value() : () -> i64
      %2585 = func.call @cc_intern(%2583, %2584) : (i64, i64) -> i64
      %2586 = func.call @cc_nil_value() : () -> i64
      %2587 = func.call @cc_cons(%2585, %2586) : (i64, i64) -> i64
      %2588 = func.call @cc_values_pack(%2587) : (i64) -> i64
      func.call @stack_push_pointer(%2585) : (i64) -> ()
      %2589 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2590 = arith.constant 4 : i64
      %2591 = func.call @cc_make_string(%2589, %2590) : (!llvm.ptr, i64) -> i64
      %2592 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2593 = arith.constant 11 : i64
      %2594 = func.call @cc_make_string(%2592, %2593) : (!llvm.ptr, i64) -> i64
      %2595 = func.call @cc_intern(%2591, %2594) : (i64, i64) -> i64
      %2596 = func.call @cc_nil_value() : () -> i64
      %2597 = func.call @cc_cons(%2595, %2596) : (i64, i64) -> i64
      %2598 = func.call @cc_values_pack(%2597) : (i64) -> i64
      func.call @stack_push_pointer(%2595) : (i64) -> ()
      %2599 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2600 = arith.constant 26 : i64
      %2601 = func.call @cc_make_string(%2599, %2600) : (!llvm.ptr, i64) -> i64
      %2602 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2603 = arith.constant 11 : i64
      %2604 = func.call @cc_make_string(%2602, %2603) : (!llvm.ptr, i64) -> i64
      %2605 = func.call @cc_intern(%2601, %2604) : (i64, i64) -> i64
      %2606 = func.call @cc_nil_value() : () -> i64
      %2607 = func.call @cc_cons(%2605, %2606) : (i64, i64) -> i64
      %2608 = func.call @cc_values_pack(%2607) : (i64) -> i64
      func.call @stack_push_pointer(%2605) : (i64) -> ()
      %2609 = arith.constant -3.0 : f64
      %2610 = func.call @cc_box_float(%2609) : (f64) -> i64
      func.call @stack_push_pointer(%2610) : (i64) -> ()
      %2611 = arith.constant 0.0 : f64
      %2612 = func.call @cc_box_float(%2611) : (f64) -> i64
      func.call @stack_push_pointer(%2612) : (i64) -> ()
      %2613 = arith.constant 3.0 : f64
      %2614 = func.call @cc_box_float(%2613) : (f64) -> i64
      func.call @stack_push_pointer(%2614) : (i64) -> ()
      %2615 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2616 = arith.constant 26 : i64
      %2617 = func.call @cc_make_string(%2615, %2616) : (!llvm.ptr, i64) -> i64
      %2618 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2619 = arith.constant 11 : i64
      %2620 = func.call @cc_make_string(%2618, %2619) : (!llvm.ptr, i64) -> i64
      %2621 = func.call @cc_intern(%2617, %2620) : (i64, i64) -> i64
      %2622 = func.call @cc_nil_value() : () -> i64
      %2623 = func.call @cc_cons(%2621, %2622) : (i64, i64) -> i64
      %2624 = func.call @cc_values_pack(%2623) : (i64) -> i64
      func.call @stack_push_pointer(%2621) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2625 = func.call @stack_pop_pointer() : () -> i64
      %2626 = func.call @stack_pop_pointer() : () -> i64
      %2627 = func.call @cc_cons(%2626, %2625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2627) : (i64) -> ()
      %2628 = func.call @stack_pop_pointer() : () -> i64
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @cc_cons(%2629, %2628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2630) : (i64) -> ()
      %2631 = func.call @stack_pop_pointer() : () -> i64
      %2632 = func.call @stack_pop_pointer() : () -> i64
      %2633 = func.call @cc_cons(%2632, %2631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2633) : (i64) -> ()
      %2634 = func.call @stack_pop_pointer() : () -> i64
      %2635 = func.call @stack_pop_pointer() : () -> i64
      %2636 = func.call @cc_cons(%2635, %2634) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2636) : (i64) -> ()
      %2637 = func.call @stack_pop_pointer() : () -> i64
      %2638 = func.call @stack_pop_pointer() : () -> i64
      %2639 = func.call @cc_cons(%2638, %2637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2639) : (i64) -> ()
      %2640 = func.call @stack_pop_pointer() : () -> i64
      %2641 = func.call @stack_pop_pointer() : () -> i64
      %2642 = func.call @cc_cons(%2641, %2640) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2642) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2643 = func.call @stack_pop_pointer() : () -> i64
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @cc_cons(%2644, %2643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2645) : (i64) -> ()
      %2646 = func.call @stack_pop_pointer() : () -> i64
      %2647 = func.call @stack_pop_pointer() : () -> i64
      %2648 = func.call @cc_cons(%2647, %2646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2648) : (i64) -> ()
      %2649 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2650 = arith.constant 4 : i64
      %2651 = func.call @cc_make_string(%2649, %2650) : (!llvm.ptr, i64) -> i64
      %2652 = func.call @cc_nil_value() : () -> i64
      %2653 = func.call @cc_intern(%2651, %2652) : (i64, i64) -> i64
      %2654 = func.call @cc_nil_value() : () -> i64
      %2655 = func.call @cc_cons(%2653, %2654) : (i64, i64) -> i64
      %2656 = func.call @cc_values_pack(%2655) : (i64) -> i64
      func.call @stack_push_pointer(%2653) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2657 = func.call @stack_pop_pointer() : () -> i64
      %2658 = func.call @stack_pop_pointer() : () -> i64
      %2659 = func.call @cc_cons(%2658, %2657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2659) : (i64) -> ()
      %2660 = func.call @stack_pop_pointer() : () -> i64
      %2661 = func.call @stack_pop_pointer() : () -> i64
      %2662 = func.call @cc_cons(%2661, %2660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2662) : (i64) -> ()
      %2663 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2664 = arith.constant 15 : i64
      %2665 = func.call @cc_make_string(%2663, %2664) : (!llvm.ptr, i64) -> i64
      %2666 = func.call @cc_nil_value() : () -> i64
      %2667 = func.call @cc_intern(%2665, %2666) : (i64, i64) -> i64
      %2668 = func.call @cc_nil_value() : () -> i64
      %2669 = func.call @cc_cons(%2667, %2668) : (i64, i64) -> i64
      %2670 = func.call @cc_values_pack(%2669) : (i64) -> i64
      func.call @stack_push_pointer(%2667) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2671 = func.call @stack_pop_pointer() : () -> i64
      %2672 = func.call @stack_pop_pointer() : () -> i64
      %2673 = func.call @cc_cons(%2672, %2671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2673) : (i64) -> ()
      %2674 = func.call @stack_pop_pointer() : () -> i64
      %2675 = func.call @stack_pop_pointer() : () -> i64
      %2676 = func.call @cc_cons(%2675, %2674) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2676) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2677 = func.call @stack_pop_pointer() : () -> i64
      %2678 = func.call @stack_pop_pointer() : () -> i64
      %2679 = func.call @cc_cons(%2678, %2677) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2679) : (i64) -> ()
      %2680 = func.call @stack_pop_pointer() : () -> i64
      %2681 = func.call @stack_pop_pointer() : () -> i64
      %2682 = func.call @cc_cons(%2681, %2680) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2682) : (i64) -> ()
      %2683 = func.call @stack_pop_pointer() : () -> i64
      %2684 = func.call @stack_pop_pointer() : () -> i64
      %2685 = func.call @cc_cons(%2684, %2683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2685) : (i64) -> ()
      %2686 = func.call @stack_pop_pointer() : () -> i64
      %2687 = func.call @stack_pop_pointer() : () -> i64
      %2688 = func.call @cc_cons(%2687, %2686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2688) : (i64) -> ()
      %2689 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2690 = arith.constant 5 : i64
      %2691 = func.call @cc_make_string(%2689, %2690) : (!llvm.ptr, i64) -> i64
      %2692 = func.call @cc_nil_value() : () -> i64
      %2693 = func.call @cc_intern(%2691, %2692) : (i64, i64) -> i64
      %2694 = func.call @cc_nil_value() : () -> i64
      %2695 = func.call @cc_cons(%2693, %2694) : (i64, i64) -> i64
      %2696 = func.call @cc_values_pack(%2695) : (i64) -> i64
      func.call @stack_push_pointer(%2693) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2697 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2698 = arith.constant 5 : i64
      %2699 = func.call @cc_make_string(%2697, %2698) : (!llvm.ptr, i64) -> i64
      %2700 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2701 = arith.constant 3 : i64
      %2702 = func.call @cc_make_string(%2700, %2701) : (!llvm.ptr, i64) -> i64
      %2703 = func.call @cc_intern(%2699, %2702) : (i64, i64) -> i64
      %2704 = func.call @cc_nil_value() : () -> i64
      %2705 = func.call @cc_cons(%2703, %2704) : (i64, i64) -> i64
      %2706 = func.call @cc_values_pack(%2705) : (i64) -> i64
      func.call @stack_push_pointer(%2703) : (i64) -> ()
      %2707 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2708 = arith.constant 15 : i64
      %2709 = func.call @cc_make_string(%2707, %2708) : (!llvm.ptr, i64) -> i64
      %2710 = func.call @cc_nil_value() : () -> i64
      %2711 = func.call @cc_intern(%2709, %2710) : (i64, i64) -> i64
      %2712 = func.call @cc_nil_value() : () -> i64
      %2713 = func.call @cc_cons(%2711, %2712) : (i64, i64) -> i64
      %2714 = func.call @cc_values_pack(%2713) : (i64) -> i64
      func.call @stack_push_pointer(%2711) : (i64) -> ()
      %2715 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2716 = arith.constant 5 : i64
      %2717 = func.call @cc_make_string(%2715, %2716) : (!llvm.ptr, i64) -> i64
      %2718 = func.call @cc_nil_value() : () -> i64
      %2719 = func.call @cc_intern(%2717, %2718) : (i64, i64) -> i64
      %2720 = func.call @cc_nil_value() : () -> i64
      %2721 = func.call @cc_cons(%2719, %2720) : (i64, i64) -> i64
      %2722 = func.call @cc_values_pack(%2721) : (i64) -> i64
      func.call @stack_push_pointer(%2719) : (i64) -> ()
      %2723 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2724 = arith.constant 2 : i64
      %2725 = func.call @cc_make_string(%2723, %2724) : (!llvm.ptr, i64) -> i64
      %2726 = func.call @cc_nil_value() : () -> i64
      %2727 = func.call @cc_intern(%2725, %2726) : (i64, i64) -> i64
      %2728 = func.call @cc_nil_value() : () -> i64
      %2729 = func.call @cc_cons(%2727, %2728) : (i64, i64) -> i64
      %2730 = func.call @cc_values_pack(%2729) : (i64) -> i64
      func.call @stack_push_pointer(%2727) : (i64) -> ()
      %2731 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2732 = arith.constant 3 : i64
      %2733 = func.call @cc_make_string(%2731, %2732) : (!llvm.ptr, i64) -> i64
      %2734 = func.call @cc_nil_value() : () -> i64
      %2735 = func.call @cc_intern(%2733, %2734) : (i64, i64) -> i64
      %2736 = func.call @cc_nil_value() : () -> i64
      %2737 = func.call @cc_cons(%2735, %2736) : (i64, i64) -> i64
      %2738 = func.call @cc_values_pack(%2737) : (i64) -> i64
      func.call @stack_push_pointer(%2735) : (i64) -> ()
      %2739 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2740 = arith.constant 3 : i64
      %2741 = func.call @cc_make_string(%2739, %2740) : (!llvm.ptr, i64) -> i64
      %2742 = func.call @cc_nil_value() : () -> i64
      %2743 = func.call @cc_intern(%2741, %2742) : (i64, i64) -> i64
      %2744 = func.call @cc_nil_value() : () -> i64
      %2745 = func.call @cc_cons(%2743, %2744) : (i64, i64) -> i64
      %2746 = func.call @cc_values_pack(%2745) : (i64) -> i64
      func.call @stack_push_pointer(%2743) : (i64) -> ()
      %2747 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2748 = arith.constant 4 : i64
      %2749 = func.call @cc_make_string(%2747, %2748) : (!llvm.ptr, i64) -> i64
      %2750 = func.call @cc_nil_value() : () -> i64
      %2751 = func.call @cc_intern(%2749, %2750) : (i64, i64) -> i64
      %2752 = func.call @cc_nil_value() : () -> i64
      %2753 = func.call @cc_cons(%2751, %2752) : (i64, i64) -> i64
      %2754 = func.call @cc_values_pack(%2753) : (i64) -> i64
      func.call @stack_push_pointer(%2751) : (i64) -> ()
      %2755 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2756 = arith.constant 15 : i64
      %2757 = func.call @cc_make_string(%2755, %2756) : (!llvm.ptr, i64) -> i64
      %2758 = func.call @cc_nil_value() : () -> i64
      %2759 = func.call @cc_intern(%2757, %2758) : (i64, i64) -> i64
      %2760 = func.call @cc_nil_value() : () -> i64
      %2761 = func.call @cc_cons(%2759, %2760) : (i64, i64) -> i64
      %2762 = func.call @cc_values_pack(%2761) : (i64) -> i64
      func.call @stack_push_pointer(%2759) : (i64) -> ()
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
      %2769 = func.call @stack_pop_pointer() : () -> i64
      %2770 = func.call @stack_pop_pointer() : () -> i64
      %2771 = func.call @cc_cons(%2770, %2769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2771) : (i64) -> ()
      %2772 = func.call @stack_pop_pointer() : () -> i64
      %2773 = func.call @stack_pop_pointer() : () -> i64
      %2774 = func.call @cc_cons(%2773, %2772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2774) : (i64) -> ()
      %2775 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2776 = arith.constant 3 : i64
      %2777 = func.call @cc_make_string(%2775, %2776) : (!llvm.ptr, i64) -> i64
      %2778 = func.call @cc_nil_value() : () -> i64
      %2779 = func.call @cc_intern(%2777, %2778) : (i64, i64) -> i64
      %2780 = func.call @cc_nil_value() : () -> i64
      %2781 = func.call @cc_cons(%2779, %2780) : (i64, i64) -> i64
      %2782 = func.call @cc_values_pack(%2781) : (i64) -> i64
      func.call @stack_push_pointer(%2779) : (i64) -> ()
      %2783 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2784 = arith.constant 5 : i64
      %2785 = func.call @cc_make_string(%2783, %2784) : (!llvm.ptr, i64) -> i64
      %2786 = func.call @cc_nil_value() : () -> i64
      %2787 = func.call @cc_intern(%2785, %2786) : (i64, i64) -> i64
      %2788 = func.call @cc_nil_value() : () -> i64
      %2789 = func.call @cc_cons(%2787, %2788) : (i64, i64) -> i64
      %2790 = func.call @cc_values_pack(%2789) : (i64) -> i64
      func.call @stack_push_pointer(%2787) : (i64) -> ()
      %2791 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2792 = arith.constant 15 : i64
      %2793 = func.call @cc_make_string(%2791, %2792) : (!llvm.ptr, i64) -> i64
      %2794 = func.call @cc_nil_value() : () -> i64
      %2795 = func.call @cc_intern(%2793, %2794) : (i64, i64) -> i64
      %2796 = func.call @cc_nil_value() : () -> i64
      %2797 = func.call @cc_cons(%2795, %2796) : (i64, i64) -> i64
      %2798 = func.call @cc_values_pack(%2797) : (i64) -> i64
      func.call @stack_push_pointer(%2795) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2799 = func.call @stack_pop_pointer() : () -> i64
      %2800 = func.call @stack_pop_pointer() : () -> i64
      %2801 = func.call @cc_cons(%2800, %2799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2801) : (i64) -> ()
      %2802 = func.call @stack_pop_pointer() : () -> i64
      %2803 = func.call @stack_pop_pointer() : () -> i64
      %2804 = func.call @cc_cons(%2803, %2802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2804) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2805 = func.call @stack_pop_pointer() : () -> i64
      %2806 = func.call @stack_pop_pointer() : () -> i64
      %2807 = func.call @cc_cons(%2806, %2805) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2807) : (i64) -> ()
      %2808 = func.call @stack_pop_pointer() : () -> i64
      %2809 = func.call @stack_pop_pointer() : () -> i64
      %2810 = func.call @cc_cons(%2809, %2808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2810) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2811 = func.call @stack_pop_pointer() : () -> i64
      %2812 = func.call @stack_pop_pointer() : () -> i64
      %2813 = func.call @cc_cons(%2812, %2811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2813) : (i64) -> ()
      %2814 = func.call @stack_pop_pointer() : () -> i64
      %2815 = func.call @stack_pop_pointer() : () -> i64
      %2816 = func.call @cc_cons(%2815, %2814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2816) : (i64) -> ()
      %2817 = func.call @stack_pop_pointer() : () -> i64
      %2818 = func.call @stack_pop_pointer() : () -> i64
      %2819 = func.call @cc_cons(%2818, %2817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2819) : (i64) -> ()
      %2820 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2821 = arith.constant 11 : i64
      %2822 = func.call @cc_make_string(%2820, %2821) : (!llvm.ptr, i64) -> i64
      %2823 = func.call @cc_nil_value() : () -> i64
      %2824 = func.call @cc_intern(%2822, %2823) : (i64, i64) -> i64
      %2825 = func.call @cc_nil_value() : () -> i64
      %2826 = func.call @cc_cons(%2824, %2825) : (i64, i64) -> i64
      %2827 = func.call @cc_values_pack(%2826) : (i64) -> i64
      func.call @stack_push_pointer(%2824) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2828 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2829 = arith.constant 5 : i64
      %2830 = func.call @cc_make_string(%2828, %2829) : (!llvm.ptr, i64) -> i64
      %2831 = func.call @cc_nil_value() : () -> i64
      %2832 = func.call @cc_intern(%2830, %2831) : (i64, i64) -> i64
      %2833 = func.call @cc_nil_value() : () -> i64
      %2834 = func.call @cc_cons(%2832, %2833) : (i64, i64) -> i64
      %2835 = func.call @cc_values_pack(%2834) : (i64) -> i64
      func.call @stack_push_pointer(%2832) : (i64) -> ()
      %2836 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2836) : (i64) -> ()
      %2837 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2838 = arith.constant 10 : i64
      %2839 = func.call @cc_make_string(%2837, %2838) : (!llvm.ptr, i64) -> i64
      %2840 = func.call @cc_nil_value() : () -> i64
      %2841 = func.call @cc_intern(%2839, %2840) : (i64, i64) -> i64
      %2842 = func.call @cc_nil_value() : () -> i64
      %2843 = func.call @cc_cons(%2841, %2842) : (i64, i64) -> i64
      %2844 = func.call @cc_values_pack(%2843) : (i64) -> i64
      func.call @stack_push_pointer(%2841) : (i64) -> ()
      %2845 = func.call @stack_pop_pointer() : () -> i64
      %2846 = func.call @stack_pop_pointer() : () -> i64
      %2847 = func.call @cc_cons(%2845, %2846) : (i64, i64) -> i64
      %2848 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2849 = arith.constant 5 : i64
      %2850 = func.call @cc_make_string(%2848, %2849) : (!llvm.ptr, i64) -> i64
      %2851 = func.call @cc_nil_value() : () -> i64
      %2852 = func.call @cc_intern(%2850, %2851) : (i64, i64) -> i64
      %2853 = func.call @cc_nil_value() : () -> i64
      %2854 = func.call @cc_cons(%2852, %2853) : (i64, i64) -> i64
      %2855 = func.call @cc_values_pack(%2854) : (i64) -> i64
      %2856 = func.call @cc_cons(%2852, %2847) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2856) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2857 = func.call @stack_pop_pointer() : () -> i64
      %2858 = func.call @stack_pop_pointer() : () -> i64
      %2859 = func.call @cc_cons(%2858, %2857) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2859) : (i64) -> ()
      %2860 = func.call @stack_pop_pointer() : () -> i64
      %2861 = func.call @stack_pop_pointer() : () -> i64
      %2862 = func.call @cc_cons(%2861, %2860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2862) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2863 = func.call @stack_pop_pointer() : () -> i64
      %2864 = func.call @stack_pop_pointer() : () -> i64
      %2865 = func.call @cc_cons(%2864, %2863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2865) : (i64) -> ()
      %2866 = func.call @stack_pop_pointer() : () -> i64
      %2867 = func.call @stack_pop_pointer() : () -> i64
      %2868 = func.call @cc_cons(%2867, %2866) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2868) : (i64) -> ()
      %2869 = func.call @stack_pop_pointer() : () -> i64
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @cc_cons(%2870, %2869) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2871) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
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
      %2881 = func.call @stack_pop_pointer() : () -> i64
      %2882 = func.call @stack_pop_pointer() : () -> i64
      %2883 = func.call @cc_cons(%2882, %2881) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2883) : (i64) -> ()
      %2884 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2885 = arith.constant 4 : i64
      %2886 = func.call @cc_make_string(%2884, %2885) : (!llvm.ptr, i64) -> i64
      %2887 = func.call @cc_nil_value() : () -> i64
      %2888 = func.call @cc_intern(%2886, %2887) : (i64, i64) -> i64
      %2889 = func.call @cc_nil_value() : () -> i64
      %2890 = func.call @cc_cons(%2888, %2889) : (i64, i64) -> i64
      %2891 = func.call @cc_values_pack(%2890) : (i64) -> i64
      func.call @stack_push_pointer(%2888) : (i64) -> ()
      %2892 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2893 = arith.constant 3 : i64
      %2894 = func.call @cc_make_string(%2892, %2893) : (!llvm.ptr, i64) -> i64
      %2895 = func.call @cc_nil_value() : () -> i64
      %2896 = func.call @cc_intern(%2894, %2895) : (i64, i64) -> i64
      %2897 = func.call @cc_nil_value() : () -> i64
      %2898 = func.call @cc_cons(%2896, %2897) : (i64, i64) -> i64
      %2899 = func.call @cc_values_pack(%2898) : (i64) -> i64
      func.call @stack_push_pointer(%2896) : (i64) -> ()
      %2900 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2901 = arith.constant 3 : i64
      %2902 = func.call @cc_make_string(%2900, %2901) : (!llvm.ptr, i64) -> i64
      %2903 = func.call @cc_nil_value() : () -> i64
      %2904 = func.call @cc_intern(%2902, %2903) : (i64, i64) -> i64
      %2905 = func.call @cc_nil_value() : () -> i64
      %2906 = func.call @cc_cons(%2904, %2905) : (i64, i64) -> i64
      %2907 = func.call @cc_values_pack(%2906) : (i64) -> i64
      func.call @stack_push_pointer(%2904) : (i64) -> ()
      %2908 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2909 = arith.constant 15 : i64
      %2910 = func.call @cc_make_string(%2908, %2909) : (!llvm.ptr, i64) -> i64
      %2911 = func.call @cc_nil_value() : () -> i64
      %2912 = func.call @cc_intern(%2910, %2911) : (i64, i64) -> i64
      %2913 = func.call @cc_nil_value() : () -> i64
      %2914 = func.call @cc_cons(%2912, %2913) : (i64, i64) -> i64
      %2915 = func.call @cc_values_pack(%2914) : (i64) -> i64
      func.call @stack_push_pointer(%2912) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2916 = func.call @stack_pop_pointer() : () -> i64
      %2917 = func.call @stack_pop_pointer() : () -> i64
      %2918 = func.call @cc_cons(%2917, %2916) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2918) : (i64) -> ()
      %2919 = func.call @stack_pop_pointer() : () -> i64
      %2920 = func.call @stack_pop_pointer() : () -> i64
      %2921 = func.call @cc_cons(%2920, %2919) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2921) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2922 = func.call @stack_pop_pointer() : () -> i64
      %2923 = func.call @stack_pop_pointer() : () -> i64
      %2924 = func.call @cc_cons(%2923, %2922) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2924) : (i64) -> ()
      %2925 = func.call @stack_pop_pointer() : () -> i64
      %2926 = func.call @stack_pop_pointer() : () -> i64
      %2927 = func.call @cc_cons(%2926, %2925) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2927) : (i64) -> ()
      %2928 = func.call @stack_pop_pointer() : () -> i64
      %2929 = func.call @stack_pop_pointer() : () -> i64
      %2930 = func.call @cc_cons(%2929, %2928) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2930) : (i64) -> ()
      %2931 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2932 = arith.constant 4 : i64
      %2933 = func.call @cc_make_string(%2931, %2932) : (!llvm.ptr, i64) -> i64
      %2934 = func.call @cc_nil_value() : () -> i64
      %2935 = func.call @cc_intern(%2933, %2934) : (i64, i64) -> i64
      %2936 = func.call @cc_nil_value() : () -> i64
      %2937 = func.call @cc_cons(%2935, %2936) : (i64, i64) -> i64
      %2938 = func.call @cc_values_pack(%2937) : (i64) -> i64
      func.call @stack_push_pointer(%2935) : (i64) -> ()
      %2939 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2940 = arith.constant 4 : i64
      %2941 = func.call @cc_make_string(%2939, %2940) : (!llvm.ptr, i64) -> i64
      %2942 = func.call @cc_nil_value() : () -> i64
      %2943 = func.call @cc_intern(%2941, %2942) : (i64, i64) -> i64
      %2944 = func.call @cc_nil_value() : () -> i64
      %2945 = func.call @cc_cons(%2943, %2944) : (i64, i64) -> i64
      %2946 = func.call @cc_values_pack(%2945) : (i64) -> i64
      func.call @stack_push_pointer(%2943) : (i64) -> ()
      %2947 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2948 = arith.constant 20 : i64
      %2949 = func.call @cc_make_string(%2947, %2948) : (!llvm.ptr, i64) -> i64
      %2950 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2951 = arith.constant 3 : i64
      %2952 = func.call @cc_make_string(%2950, %2951) : (!llvm.ptr, i64) -> i64
      %2953 = func.call @cc_intern(%2949, %2952) : (i64, i64) -> i64
      %2954 = func.call @cc_nil_value() : () -> i64
      %2955 = func.call @cc_cons(%2953, %2954) : (i64, i64) -> i64
      %2956 = func.call @cc_values_pack(%2955) : (i64) -> i64
      func.call @stack_push_pointer(%2953) : (i64) -> ()
      %2957 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2958 = arith.constant 3 : i64
      %2959 = func.call @cc_make_string(%2957, %2958) : (!llvm.ptr, i64) -> i64
      %2960 = func.call @cc_nil_value() : () -> i64
      %2961 = func.call @cc_intern(%2959, %2960) : (i64, i64) -> i64
      %2962 = func.call @cc_nil_value() : () -> i64
      %2963 = func.call @cc_cons(%2961, %2962) : (i64, i64) -> i64
      %2964 = func.call @cc_values_pack(%2963) : (i64) -> i64
      func.call @stack_push_pointer(%2961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2965 = func.call @stack_pop_pointer() : () -> i64
      %2966 = func.call @stack_pop_pointer() : () -> i64
      %2967 = func.call @cc_cons(%2966, %2965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2967) : (i64) -> ()
      %2968 = func.call @stack_pop_pointer() : () -> i64
      %2969 = func.call @stack_pop_pointer() : () -> i64
      %2970 = func.call @cc_cons(%2969, %2968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2970) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2971 = func.call @stack_pop_pointer() : () -> i64
      %2972 = func.call @stack_pop_pointer() : () -> i64
      %2973 = func.call @cc_cons(%2972, %2971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2973) : (i64) -> ()
      %2974 = func.call @stack_pop_pointer() : () -> i64
      %2975 = func.call @stack_pop_pointer() : () -> i64
      %2976 = func.call @cc_cons(%2975, %2974) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2976) : (i64) -> ()
      %2977 = func.call @stack_pop_pointer() : () -> i64
      %2978 = func.call @stack_pop_pointer() : () -> i64
      %2979 = func.call @cc_cons(%2978, %2977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2979) : (i64) -> ()
      %2980 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2981 = arith.constant 2 : i64
      %2982 = func.call @cc_make_string(%2980, %2981) : (!llvm.ptr, i64) -> i64
      %2983 = func.call @cc_nil_value() : () -> i64
      %2984 = func.call @cc_intern(%2982, %2983) : (i64, i64) -> i64
      %2985 = func.call @cc_nil_value() : () -> i64
      %2986 = func.call @cc_cons(%2984, %2985) : (i64, i64) -> i64
      %2987 = func.call @cc_values_pack(%2986) : (i64) -> i64
      func.call @stack_push_pointer(%2984) : (i64) -> ()
      %2988 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2989 = arith.constant 3 : i64
      %2990 = func.call @cc_make_string(%2988, %2989) : (!llvm.ptr, i64) -> i64
      %2991 = func.call @cc_nil_value() : () -> i64
      %2992 = func.call @cc_intern(%2990, %2991) : (i64, i64) -> i64
      %2993 = func.call @cc_nil_value() : () -> i64
      %2994 = func.call @cc_cons(%2992, %2993) : (i64, i64) -> i64
      %2995 = func.call @cc_values_pack(%2994) : (i64) -> i64
      func.call @stack_push_pointer(%2992) : (i64) -> ()
      %2996 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2997 = arith.constant 1 : i64
      %2998 = func.call @cc_make_string(%2996, %2997) : (!llvm.ptr, i64) -> i64
      %2999 = llvm.mlir.addressof @str221 : !llvm.ptr
      %3000 = arith.constant 11 : i64
      %3001 = func.call @cc_make_string(%2999, %3000) : (!llvm.ptr, i64) -> i64
      %3002 = func.call @cc_intern(%2998, %3001) : (i64, i64) -> i64
      %3003 = func.call @cc_nil_value() : () -> i64
      %3004 = func.call @cc_cons(%3002, %3003) : (i64, i64) -> i64
      %3005 = func.call @cc_values_pack(%3004) : (i64) -> i64
      func.call @stack_push_pointer(%3002) : (i64) -> ()
      %3006 = llvm.mlir.addressof @str222 : !llvm.ptr
      %3007 = arith.constant 3 : i64
      %3008 = func.call @cc_make_string(%3006, %3007) : (!llvm.ptr, i64) -> i64
      %3009 = func.call @cc_nil_value() : () -> i64
      %3010 = func.call @cc_intern(%3008, %3009) : (i64, i64) -> i64
      %3011 = func.call @cc_nil_value() : () -> i64
      %3012 = func.call @cc_cons(%3010, %3011) : (i64, i64) -> i64
      %3013 = func.call @cc_values_pack(%3012) : (i64) -> i64
      func.call @stack_push_pointer(%3010) : (i64) -> ()
      %3014 = llvm.mlir.addressof @str223 : !llvm.ptr
      %3015 = arith.constant 20 : i64
      %3016 = func.call @cc_make_string(%3014, %3015) : (!llvm.ptr, i64) -> i64
      %3017 = llvm.mlir.addressof @str224 : !llvm.ptr
      %3018 = arith.constant 3 : i64
      %3019 = func.call @cc_make_string(%3017, %3018) : (!llvm.ptr, i64) -> i64
      %3020 = func.call @cc_intern(%3016, %3019) : (i64, i64) -> i64
      %3021 = func.call @cc_nil_value() : () -> i64
      %3022 = func.call @cc_cons(%3020, %3021) : (i64, i64) -> i64
      %3023 = func.call @cc_values_pack(%3022) : (i64) -> i64
      func.call @stack_push_pointer(%3020) : (i64) -> ()
      %3024 = llvm.mlir.addressof @str225 : !llvm.ptr
      %3025 = arith.constant 4 : i64
      %3026 = func.call @cc_make_string(%3024, %3025) : (!llvm.ptr, i64) -> i64
      %3027 = func.call @cc_nil_value() : () -> i64
      %3028 = func.call @cc_intern(%3026, %3027) : (i64, i64) -> i64
      %3029 = func.call @cc_nil_value() : () -> i64
      %3030 = func.call @cc_cons(%3028, %3029) : (i64, i64) -> i64
      %3031 = func.call @cc_values_pack(%3030) : (i64) -> i64
      func.call @stack_push_pointer(%3028) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3032 = func.call @stack_pop_pointer() : () -> i64
      %3033 = func.call @stack_pop_pointer() : () -> i64
      %3034 = func.call @cc_cons(%3033, %3032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3034) : (i64) -> ()
      %3035 = func.call @stack_pop_pointer() : () -> i64
      %3036 = func.call @stack_pop_pointer() : () -> i64
      %3037 = func.call @cc_cons(%3036, %3035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3037) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3038 = func.call @stack_pop_pointer() : () -> i64
      %3039 = func.call @stack_pop_pointer() : () -> i64
      %3040 = func.call @cc_cons(%3039, %3038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3040) : (i64) -> ()
      %3041 = func.call @stack_pop_pointer() : () -> i64
      %3042 = func.call @stack_pop_pointer() : () -> i64
      %3043 = func.call @cc_cons(%3042, %3041) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3043) : (i64) -> ()
      %3044 = func.call @stack_pop_pointer() : () -> i64
      %3045 = func.call @stack_pop_pointer() : () -> i64
      %3046 = func.call @cc_cons(%3045, %3044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3046) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3047 = func.call @stack_pop_pointer() : () -> i64
      %3048 = func.call @stack_pop_pointer() : () -> i64
      %3049 = func.call @cc_cons(%3048, %3047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3049) : (i64) -> ()
      %3050 = func.call @stack_pop_pointer() : () -> i64
      %3051 = func.call @stack_pop_pointer() : () -> i64
      %3052 = func.call @cc_cons(%3051, %3050) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3052) : (i64) -> ()
      %3053 = llvm.mlir.addressof @str226 : !llvm.ptr
      %3054 = arith.constant 5 : i64
      %3055 = func.call @cc_make_string(%3053, %3054) : (!llvm.ptr, i64) -> i64
      %3056 = func.call @cc_nil_value() : () -> i64
      %3057 = func.call @cc_intern(%3055, %3056) : (i64, i64) -> i64
      %3058 = func.call @cc_nil_value() : () -> i64
      %3059 = func.call @cc_cons(%3057, %3058) : (i64, i64) -> i64
      %3060 = func.call @cc_values_pack(%3059) : (i64) -> i64
      func.call @stack_push_pointer(%3057) : (i64) -> ()
      %3061 = llvm.mlir.addressof @str227 : !llvm.ptr
      %3062 = arith.constant 4 : i64
      %3063 = func.call @cc_make_string(%3061, %3062) : (!llvm.ptr, i64) -> i64
      %3064 = func.call @cc_nil_value() : () -> i64
      %3065 = func.call @cc_intern(%3063, %3064) : (i64, i64) -> i64
      %3066 = func.call @cc_nil_value() : () -> i64
      %3067 = func.call @cc_cons(%3065, %3066) : (i64, i64) -> i64
      %3068 = func.call @cc_values_pack(%3067) : (i64) -> i64
      func.call @stack_push_pointer(%3065) : (i64) -> ()
      %3069 = llvm.mlir.addressof @str228 : !llvm.ptr
      %3070 = arith.constant 15 : i64
      %3071 = func.call @cc_make_string(%3069, %3070) : (!llvm.ptr, i64) -> i64
      %3072 = func.call @cc_nil_value() : () -> i64
      %3073 = func.call @cc_intern(%3071, %3072) : (i64, i64) -> i64
      %3074 = func.call @cc_nil_value() : () -> i64
      %3075 = func.call @cc_cons(%3073, %3074) : (i64, i64) -> i64
      %3076 = func.call @cc_values_pack(%3075) : (i64) -> i64
      func.call @stack_push_pointer(%3073) : (i64) -> ()
      %3077 = llvm.mlir.addressof @str229 : !llvm.ptr
      %3078 = arith.constant 6 : i64
      %3079 = func.call @cc_make_string(%3077, %3078) : (!llvm.ptr, i64) -> i64
      %3080 = func.call @cc_nil_value() : () -> i64
      %3081 = func.call @cc_intern(%3079, %3080) : (i64, i64) -> i64
      %3082 = func.call @cc_nil_value() : () -> i64
      %3083 = func.call @cc_cons(%3081, %3082) : (i64, i64) -> i64
      %3084 = func.call @cc_values_pack(%3083) : (i64) -> i64
      func.call @stack_push_pointer(%3081) : (i64) -> ()
      %3085 = llvm.mlir.addressof @str230 : !llvm.ptr
      %3086 = arith.constant 15 : i64
      %3087 = func.call @cc_make_string(%3085, %3086) : (!llvm.ptr, i64) -> i64
      %3088 = func.call @cc_nil_value() : () -> i64
      %3089 = func.call @cc_intern(%3087, %3088) : (i64, i64) -> i64
      %3090 = func.call @cc_nil_value() : () -> i64
      %3091 = func.call @cc_cons(%3089, %3090) : (i64, i64) -> i64
      %3092 = func.call @cc_values_pack(%3091) : (i64) -> i64
      func.call @stack_push_pointer(%3089) : (i64) -> ()
      %3093 = llvm.mlir.addressof @str231 : !llvm.ptr
      %3094 = arith.constant 4 : i64
      %3095 = func.call @cc_make_string(%3093, %3094) : (!llvm.ptr, i64) -> i64
      %3096 = func.call @cc_nil_value() : () -> i64
      %3097 = func.call @cc_intern(%3095, %3096) : (i64, i64) -> i64
      %3098 = func.call @cc_nil_value() : () -> i64
      %3099 = func.call @cc_cons(%3097, %3098) : (i64, i64) -> i64
      %3100 = func.call @cc_values_pack(%3099) : (i64) -> i64
      func.call @stack_push_pointer(%3097) : (i64) -> ()
      %3101 = llvm.mlir.addressof @str232 : !llvm.ptr
      %3102 = arith.constant 3 : i64
      %3103 = func.call @cc_make_string(%3101, %3102) : (!llvm.ptr, i64) -> i64
      %3104 = func.call @cc_nil_value() : () -> i64
      %3105 = func.call @cc_intern(%3103, %3104) : (i64, i64) -> i64
      %3106 = func.call @cc_nil_value() : () -> i64
      %3107 = func.call @cc_cons(%3105, %3106) : (i64, i64) -> i64
      %3108 = func.call @cc_values_pack(%3107) : (i64) -> i64
      func.call @stack_push_pointer(%3105) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3109 = func.call @stack_pop_pointer() : () -> i64
      %3110 = func.call @stack_pop_pointer() : () -> i64
      %3111 = func.call @cc_cons(%3110, %3109) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3111) : (i64) -> ()
      %3112 = func.call @stack_pop_pointer() : () -> i64
      %3113 = func.call @stack_pop_pointer() : () -> i64
      %3114 = func.call @cc_cons(%3113, %3112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3114) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3115 = func.call @stack_pop_pointer() : () -> i64
      %3116 = func.call @stack_pop_pointer() : () -> i64
      %3117 = func.call @cc_cons(%3116, %3115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3117) : (i64) -> ()
      %3118 = func.call @stack_pop_pointer() : () -> i64
      %3119 = func.call @stack_pop_pointer() : () -> i64
      %3120 = func.call @cc_cons(%3119, %3118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3120) : (i64) -> ()
      %3121 = func.call @stack_pop_pointer() : () -> i64
      %3122 = func.call @stack_pop_pointer() : () -> i64
      %3123 = func.call @cc_cons(%3122, %3121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3123) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3124 = func.call @stack_pop_pointer() : () -> i64
      %3125 = func.call @stack_pop_pointer() : () -> i64
      %3126 = func.call @cc_cons(%3125, %3124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3126) : (i64) -> ()
      %3127 = func.call @stack_pop_pointer() : () -> i64
      %3128 = func.call @stack_pop_pointer() : () -> i64
      %3129 = func.call @cc_cons(%3128, %3127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3129) : (i64) -> ()
      %3130 = func.call @stack_pop_pointer() : () -> i64
      %3131 = func.call @stack_pop_pointer() : () -> i64
      %3132 = func.call @cc_cons(%3131, %3130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3132) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3133 = func.call @stack_pop_pointer() : () -> i64
      %3134 = func.call @stack_pop_pointer() : () -> i64
      %3135 = func.call @cc_cons(%3134, %3133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3135) : (i64) -> ()
      %3136 = func.call @stack_pop_pointer() : () -> i64
      %3137 = func.call @stack_pop_pointer() : () -> i64
      %3138 = func.call @cc_cons(%3137, %3136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3138) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3139 = func.call @stack_pop_pointer() : () -> i64
      %3140 = func.call @stack_pop_pointer() : () -> i64
      %3141 = func.call @cc_cons(%3140, %3139) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3141) : (i64) -> ()
      %3142 = func.call @stack_pop_pointer() : () -> i64
      %3143 = func.call @stack_pop_pointer() : () -> i64
      %3144 = func.call @cc_cons(%3143, %3142) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3144) : (i64) -> ()
      %3145 = func.call @stack_pop_pointer() : () -> i64
      %3146 = func.call @stack_pop_pointer() : () -> i64
      %3147 = func.call @cc_cons(%3146, %3145) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3147) : (i64) -> ()
      %3148 = func.call @stack_pop_pointer() : () -> i64
      %3149 = func.call @stack_pop_pointer() : () -> i64
      %3150 = func.call @cc_cons(%3149, %3148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3151 = func.call @stack_pop_pointer() : () -> i64
      %3152 = func.call @stack_pop_pointer() : () -> i64
      %3153 = func.call @cc_cons(%3152, %3151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3153) : (i64) -> ()
      %3154 = func.call @stack_pop_pointer() : () -> i64
      %3155 = func.call @stack_pop_pointer() : () -> i64
      %3156 = func.call @cc_cons(%3155, %3154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3156) : (i64) -> ()
      %3157 = func.call @stack_pop_pointer() : () -> i64
      %3158 = func.call @stack_pop_pointer() : () -> i64
      %3159 = func.call @cc_cons(%3158, %3157) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3159) : (i64) -> ()
      %3160 = func.call @stack_pop_pointer() : () -> i64
      %3161 = func.call @stack_pop_pointer() : () -> i64
      %3162 = func.call @cc_cons(%3161, %3160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3162) : (i64) -> ()
      %3163 = func.call @stack_pop_pointer() : () -> i64
      %3164 = func.call @stack_pop_pointer() : () -> i64
      %3165 = func.call @cc_cons(%3164, %3163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3165) : (i64) -> ()
      %3166 = llvm.mlir.addressof @str233 : !llvm.ptr
      %3167 = arith.constant 4 : i64
      %3168 = func.call @cc_make_string(%3166, %3167) : (!llvm.ptr, i64) -> i64
      %3169 = func.call @cc_nil_value() : () -> i64
      %3170 = func.call @cc_intern(%3168, %3169) : (i64, i64) -> i64
      %3171 = func.call @cc_nil_value() : () -> i64
      %3172 = func.call @cc_cons(%3170, %3171) : (i64, i64) -> i64
      %3173 = func.call @cc_values_pack(%3172) : (i64) -> i64
      func.call @stack_push_pointer(%3170) : (i64) -> ()
      %3174 = llvm.mlir.addressof @str234 : !llvm.ptr
      %3175 = arith.constant 15 : i64
      %3176 = func.call @cc_make_string(%3174, %3175) : (!llvm.ptr, i64) -> i64
      %3177 = func.call @cc_nil_value() : () -> i64
      %3178 = func.call @cc_intern(%3176, %3177) : (i64, i64) -> i64
      %3179 = func.call @cc_nil_value() : () -> i64
      %3180 = func.call @cc_cons(%3178, %3179) : (i64, i64) -> i64
      %3181 = func.call @cc_values_pack(%3180) : (i64) -> i64
      func.call @stack_push_pointer(%3178) : (i64) -> ()
      %3182 = llvm.mlir.addressof @str235 : !llvm.ptr
      %3183 = arith.constant 3 : i64
      %3184 = func.call @cc_make_string(%3182, %3183) : (!llvm.ptr, i64) -> i64
      %3185 = func.call @cc_nil_value() : () -> i64
      %3186 = func.call @cc_intern(%3184, %3185) : (i64, i64) -> i64
      %3187 = func.call @cc_nil_value() : () -> i64
      %3188 = func.call @cc_cons(%3186, %3187) : (i64, i64) -> i64
      %3189 = func.call @cc_values_pack(%3188) : (i64) -> i64
      func.call @stack_push_pointer(%3186) : (i64) -> ()
      %3190 = llvm.mlir.addressof @str236 : !llvm.ptr
      %3191 = arith.constant 15 : i64
      %3192 = func.call @cc_make_string(%3190, %3191) : (!llvm.ptr, i64) -> i64
      %3193 = func.call @cc_nil_value() : () -> i64
      %3194 = func.call @cc_intern(%3192, %3193) : (i64, i64) -> i64
      %3195 = func.call @cc_nil_value() : () -> i64
      %3196 = func.call @cc_cons(%3194, %3195) : (i64, i64) -> i64
      %3197 = func.call @cc_values_pack(%3196) : (i64) -> i64
      func.call @stack_push_pointer(%3194) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %3219 = func.call @stack_pop_pointer() : () -> i64
      %3220 = func.call @stack_pop_pointer() : () -> i64
      %3221 = func.call @cc_cons(%3220, %3219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3221) : (i64) -> ()
      %3222 = func.call @stack_pop_pointer() : () -> i64
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3224 = func.call @cc_cons(%3223, %3222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3224) : (i64) -> ()
      %3225 = llvm.mlir.addressof @str237 : !llvm.ptr
      %3226 = arith.constant 15 : i64
      %3227 = func.call @cc_make_string(%3225, %3226) : (!llvm.ptr, i64) -> i64
      %3228 = func.call @cc_nil_value() : () -> i64
      %3229 = func.call @cc_intern(%3227, %3228) : (i64, i64) -> i64
      %3230 = func.call @cc_nil_value() : () -> i64
      %3231 = func.call @cc_cons(%3229, %3230) : (i64, i64) -> i64
      %3232 = func.call @cc_values_pack(%3231) : (i64) -> i64
      func.call @stack_push_pointer(%3229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3233 = func.call @stack_pop_pointer() : () -> i64
      %3234 = func.call @stack_pop_pointer() : () -> i64
      %3235 = func.call @cc_cons(%3234, %3233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3235) : (i64) -> ()
      %3236 = func.call @stack_pop_pointer() : () -> i64
      %3237 = func.call @stack_pop_pointer() : () -> i64
      %3238 = func.call @cc_cons(%3237, %3236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3238) : (i64) -> ()
      %3239 = func.call @stack_pop_pointer() : () -> i64
      %3240 = func.call @stack_pop_pointer() : () -> i64
      %3241 = func.call @cc_cons(%3240, %3239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3241) : (i64) -> ()
      %3242 = func.call @stack_pop_pointer() : () -> i64
      %3243 = func.call @stack_pop_pointer() : () -> i64
      %3244 = func.call @cc_cons(%3243, %3242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3244) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3245 = func.call @stack_pop_pointer() : () -> i64
      %3246 = func.call @stack_pop_pointer() : () -> i64
      %3247 = func.call @cc_cons(%3246, %3245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3247) : (i64) -> ()
      %3248 = func.call @stack_pop_pointer() : () -> i64
      %3249 = func.call @stack_pop_pointer() : () -> i64
      %3250 = func.call @cc_cons(%3249, %3248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3250) : (i64) -> ()
      %3251 = func.call @stack_pop_pointer() : () -> i64
      %3252 = func.call @stack_pop_pointer() : () -> i64
      %3253 = func.call @cc_cons(%3252, %3251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3253) : (i64) -> ()
      %3254 = func.call @stack_pop_pointer() : () -> i64
      %3635 = arith.constant 162741310455816 : i64
      %3636 = arith.constant 0 : i64
      %3637 = func.call @cc_make_closure(%3635, %3636) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3637) : (i64) -> ()
      %3638 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3639 = func.call @stack_pop_pointer() : () -> i64
      %3640 = func.call @stack_pop_pointer() : () -> i64
      %3641 = func.call @cc_cons(%3640, %3639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3641) : (i64) -> ()
      %3642 = func.call @stack_pop_pointer() : () -> i64
      %3643 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3644 = arith.constant 11 : i64
      %3645 = func.call @cc_make_string(%3643, %3644) : (!llvm.ptr, i64) -> i64
      %3646 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3647 = arith.constant 7 : i64
      %3648 = func.call @cc_make_string(%3646, %3647) : (!llvm.ptr, i64) -> i64
      %3649 = func.call @cc_intern(%3645, %3648) : (i64, i64) -> i64
      %3650 = func.call @cc_nil_value() : () -> i64
      %3651 = func.call @cc_cons(%3649, %3650) : (i64, i64) -> i64
      %3652 = func.call @cc_values_pack(%3651) : (i64) -> i64
      func.call @stack_push_pointer(%3649) : (i64) -> ()
      %3653 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3654 = func.call @stack_pop_pointer() : () -> i64
      %3655 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3656 = arith.constant 4 : i64
      %3657 = func.call @cc_make_string(%3655, %3656) : (!llvm.ptr, i64) -> i64
      %3658 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3659 = arith.constant 7 : i64
      %3660 = func.call @cc_make_string(%3658, %3659) : (!llvm.ptr, i64) -> i64
      %3661 = func.call @cc_intern(%3657, %3660) : (i64, i64) -> i64
      %3662 = func.call @cc_nil_value() : () -> i64
      %3663 = func.call @cc_cons(%3661, %3662) : (i64, i64) -> i64
      %3664 = func.call @cc_values_pack(%3663) : (i64) -> i64
      func.call @stack_push_pointer(%3661) : (i64) -> ()
      %3665 = func.call @stack_pop_pointer() : () -> i64
      %3666 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3667 = arith.constant 6 : i64
      %3668 = func.call @cc_make_string(%3666, %3667) : (!llvm.ptr, i64) -> i64
      %3669 = func.call @cc_nil_value() : () -> i64
      %3670 = func.call @cc_intern(%3668, %3669) : (i64, i64) -> i64
      %3671 = func.call @cc_nil_value() : () -> i64
      %3672 = func.call @cc_cons(%3670, %3671) : (i64, i64) -> i64
      %3673 = func.call @cc_values_pack(%3672) : (i64) -> i64
      func.call @stack_push_pointer(%3670) : (i64) -> ()
      %3674 = func.call @stack_pop_pointer() : () -> i64
      %3675 = func.call @cc_nil_value() : () -> i64
      %3676 = func.call @cc_errorp(%2558) : (i64) -> i64
      %3677 = arith.cmpi ne, %3676, %3675 : i64
      %3678 = arith.cmpi eq, %3675, %3675 : i64
      %3679 = arith.andi %3677, %3678 : i1
      %3680 = scf.if %3679 -> (i64) {
        scf.yield %2558 : i64
      } else {
        scf.yield %3675 : i64
      }
      %3681 = func.call @cc_errorp(%3254) : (i64) -> i64
      %3682 = arith.cmpi ne, %3681, %3675 : i64
      %3683 = arith.cmpi eq, %3680, %3675 : i64
      %3684 = arith.andi %3682, %3683 : i1
      %3685 = scf.if %3684 -> (i64) {
        scf.yield %3254 : i64
      } else {
        scf.yield %3680 : i64
      }
      %3686 = func.call @cc_errorp(%3638) : (i64) -> i64
      %3687 = arith.cmpi ne, %3686, %3675 : i64
      %3688 = arith.cmpi eq, %3685, %3675 : i64
      %3689 = arith.andi %3687, %3688 : i1
      %3690 = scf.if %3689 -> (i64) {
        scf.yield %3638 : i64
      } else {
        scf.yield %3685 : i64
      }
      %3691 = func.call @cc_errorp(%3642) : (i64) -> i64
      %3692 = arith.cmpi ne, %3691, %3675 : i64
      %3693 = arith.cmpi eq, %3690, %3675 : i64
      %3694 = arith.andi %3692, %3693 : i1
      %3695 = scf.if %3694 -> (i64) {
        scf.yield %3642 : i64
      } else {
        scf.yield %3690 : i64
      }
      %3696 = func.call @cc_errorp(%3653) : (i64) -> i64
      %3697 = arith.cmpi ne, %3696, %3675 : i64
      %3698 = arith.cmpi eq, %3695, %3675 : i64
      %3699 = arith.andi %3697, %3698 : i1
      %3700 = scf.if %3699 -> (i64) {
        scf.yield %3653 : i64
      } else {
        scf.yield %3695 : i64
      }
      %3701 = func.call @cc_errorp(%3654) : (i64) -> i64
      %3702 = arith.cmpi ne, %3701, %3675 : i64
      %3703 = arith.cmpi eq, %3700, %3675 : i64
      %3704 = arith.andi %3702, %3703 : i1
      %3705 = scf.if %3704 -> (i64) {
        scf.yield %3654 : i64
      } else {
        scf.yield %3700 : i64
      }
      %3706 = func.call @cc_errorp(%3665) : (i64) -> i64
      %3707 = arith.cmpi ne, %3706, %3675 : i64
      %3708 = arith.cmpi eq, %3705, %3675 : i64
      %3709 = arith.andi %3707, %3708 : i1
      %3710 = scf.if %3709 -> (i64) {
        scf.yield %3665 : i64
      } else {
        scf.yield %3705 : i64
      }
      %3711 = func.call @cc_errorp(%3674) : (i64) -> i64
      %3712 = arith.cmpi ne, %3711, %3675 : i64
      %3713 = arith.cmpi eq, %3710, %3675 : i64
      %3714 = arith.andi %3712, %3713 : i1
      %3715 = scf.if %3714 -> (i64) {
        scf.yield %3674 : i64
      } else {
        scf.yield %3710 : i64
      }
      %3716 = arith.cmpi ne, %3715, %3675 : i64
      scf.if %3716 {
        func.call @stack_push_pointer(%3715) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2558) : (i64) -> ()
        func.call @stack_push_pointer(%3254) : (i64) -> ()
        func.call @stack_push_pointer(%3638) : (i64) -> ()
        func.call @stack_push_pointer(%3642) : (i64) -> ()
        func.call @stack_push_pointer(%3653) : (i64) -> ()
        func.call @stack_push_pointer(%3654) : (i64) -> ()
        func.call @stack_push_pointer(%3665) : (i64) -> ()
        func.call @stack_push_pointer(%3674) : (i64) -> ()
        %3717 = llvm.mlir.addressof @str262 : !llvm.ptr
        %3718 = func.call @cc_make_function_ref_const(%3717) : (!llvm.ptr) -> i64
        %3719 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3718, %3719) : (i64, i64) -> ()
      }
      %3720 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3720 : i64
    }
    %3721 = func.call @cc_nil_value() : () -> i64
    %3722 = func.call @cc_errorp(%2549) : (i64) -> i64
    %3723 = arith.cmpi ne, %3722, %3721 : i64
    %3724 = scf.if %3723 -> (i64) {
      scf.yield %2549 : i64
    } else {
      %3725 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3726 = arith.constant 27 : i64
      %3727 = func.call @cc_make_string(%3725, %3726) : (!llvm.ptr, i64) -> i64
      %3728 = func.call @cc_nil_value() : () -> i64
      %3729 = func.call @cc_intern(%3727, %3728) : (i64, i64) -> i64
      %3730 = func.call @cc_nil_value() : () -> i64
      %3731 = func.call @cc_cons(%3729, %3730) : (i64, i64) -> i64
      %3732 = func.call @cc_values_pack(%3731) : (i64) -> i64
      func.call @stack_push_pointer(%3729) : (i64) -> ()
      %3733 = func.call @stack_pop_pointer() : () -> i64
      %3734 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3735 = arith.constant 13 : i64
      %3736 = func.call @cc_make_string(%3734, %3735) : (!llvm.ptr, i64) -> i64
      %3737 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3738 = arith.constant 11 : i64
      %3739 = func.call @cc_make_string(%3737, %3738) : (!llvm.ptr, i64) -> i64
      %3740 = func.call @cc_intern(%3736, %3739) : (i64, i64) -> i64
      %3741 = func.call @cc_nil_value() : () -> i64
      %3742 = func.call @cc_cons(%3740, %3741) : (i64, i64) -> i64
      %3743 = func.call @cc_values_pack(%3742) : (i64) -> i64
      func.call @stack_push_pointer(%3740) : (i64) -> ()
      %3744 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3745 = arith.constant 6 : i64
      %3746 = func.call @cc_make_string(%3744, %3745) : (!llvm.ptr, i64) -> i64
      %3747 = func.call @cc_nil_value() : () -> i64
      %3748 = func.call @cc_intern(%3746, %3747) : (i64, i64) -> i64
      %3749 = func.call @cc_nil_value() : () -> i64
      %3750 = func.call @cc_cons(%3748, %3749) : (i64, i64) -> i64
      %3751 = func.call @cc_values_pack(%3750) : (i64) -> i64
      func.call @stack_push_pointer(%3748) : (i64) -> ()
      %3752 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3753 = arith.constant 19 : i64
      %3754 = func.call @cc_make_string(%3752, %3753) : (!llvm.ptr, i64) -> i64
      %3755 = func.call @cc_nil_value() : () -> i64
      %3756 = func.call @cc_intern(%3754, %3755) : (i64, i64) -> i64
      %3757 = func.call @cc_nil_value() : () -> i64
      %3758 = func.call @cc_cons(%3756, %3757) : (i64, i64) -> i64
      %3759 = func.call @cc_values_pack(%3758) : (i64) -> i64
      func.call @stack_push_pointer(%3756) : (i64) -> ()
      %3760 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3761 = arith.constant 20 : i64
      %3762 = func.call @cc_make_string(%3760, %3761) : (!llvm.ptr, i64) -> i64
      %3763 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3764 = arith.constant 3 : i64
      %3765 = func.call @cc_make_string(%3763, %3764) : (!llvm.ptr, i64) -> i64
      %3766 = func.call @cc_intern(%3762, %3765) : (i64, i64) -> i64
      %3767 = func.call @cc_nil_value() : () -> i64
      %3768 = func.call @cc_cons(%3766, %3767) : (i64, i64) -> i64
      %3769 = func.call @cc_values_pack(%3768) : (i64) -> i64
      func.call @stack_push_pointer(%3766) : (i64) -> ()
      %3770 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%3770) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3771 = func.call @stack_pop_pointer() : () -> i64
      %3772 = func.call @stack_pop_pointer() : () -> i64
      %3773 = func.call @cc_cons(%3772, %3771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3773) : (i64) -> ()
      %3774 = func.call @stack_pop_pointer() : () -> i64
      %3775 = func.call @stack_pop_pointer() : () -> i64
      %3776 = func.call @cc_cons(%3775, %3774) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3776) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3777 = func.call @stack_pop_pointer() : () -> i64
      %3778 = func.call @stack_pop_pointer() : () -> i64
      %3779 = func.call @cc_cons(%3778, %3777) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3779) : (i64) -> ()
      %3780 = func.call @stack_pop_pointer() : () -> i64
      %3781 = func.call @stack_pop_pointer() : () -> i64
      %3782 = func.call @cc_cons(%3781, %3780) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3782) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3783 = func.call @stack_pop_pointer() : () -> i64
      %3784 = func.call @stack_pop_pointer() : () -> i64
      %3785 = func.call @cc_cons(%3784, %3783) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3785) : (i64) -> ()
      %3786 = func.call @stack_pop_pointer() : () -> i64
      %3787 = func.call @stack_pop_pointer() : () -> i64
      %3788 = func.call @cc_cons(%3787, %3786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3788) : (i64) -> ()
      %3789 = func.call @stack_pop_pointer() : () -> i64
      %3790 = func.call @stack_pop_pointer() : () -> i64
      %3791 = func.call @cc_cons(%3790, %3789) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3791) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3792 = func.call @stack_pop_pointer() : () -> i64
      %3793 = func.call @stack_pop_pointer() : () -> i64
      %3794 = func.call @cc_cons(%3793, %3792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3794) : (i64) -> ()
      %3795 = func.call @stack_pop_pointer() : () -> i64
      %3796 = func.call @stack_pop_pointer() : () -> i64
      %3797 = func.call @cc_cons(%3796, %3795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3797) : (i64) -> ()
      %3798 = func.call @stack_pop_pointer() : () -> i64
      %3854 = arith.constant 162741310455818 : i64
      %3855 = arith.constant 0 : i64
      %3856 = func.call @cc_make_closure(%3854, %3855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3856) : (i64) -> ()
      %3857 = func.call @stack_pop_pointer() : () -> i64
      %3858 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3859 = arith.constant 4 : i64
      %3860 = func.call @cc_make_string(%3858, %3859) : (!llvm.ptr, i64) -> i64
      %3861 = func.call @cc_nil_value() : () -> i64
      %3862 = func.call @cc_intern(%3860, %3861) : (i64, i64) -> i64
      %3863 = func.call @cc_nil_value() : () -> i64
      %3864 = func.call @cc_cons(%3862, %3863) : (i64, i64) -> i64
      %3865 = func.call @cc_values_pack(%3864) : (i64) -> i64
      func.call @stack_push_pointer(%3862) : (i64) -> ()
      %3866 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3867 = arith.constant 5 : i64
      %3868 = func.call @cc_make_string(%3866, %3867) : (!llvm.ptr, i64) -> i64
      %3869 = func.call @cc_nil_value() : () -> i64
      %3870 = func.call @cc_intern(%3868, %3869) : (i64, i64) -> i64
      %3871 = func.call @cc_nil_value() : () -> i64
      %3872 = func.call @cc_cons(%3870, %3871) : (i64, i64) -> i64
      %3873 = func.call @cc_values_pack(%3872) : (i64) -> i64
      func.call @stack_push_pointer(%3870) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3874 = func.call @stack_pop_pointer() : () -> i64
      %3875 = func.call @stack_pop_pointer() : () -> i64
      %3876 = func.call @cc_cons(%3875, %3874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3876) : (i64) -> ()
      %3877 = func.call @stack_pop_pointer() : () -> i64
      %3878 = func.call @stack_pop_pointer() : () -> i64
      %3879 = func.call @cc_cons(%3878, %3877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3879) : (i64) -> ()
      %3880 = func.call @stack_pop_pointer() : () -> i64
      %3881 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3882 = arith.constant 11 : i64
      %3883 = func.call @cc_make_string(%3881, %3882) : (!llvm.ptr, i64) -> i64
      %3884 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3885 = arith.constant 7 : i64
      %3886 = func.call @cc_make_string(%3884, %3885) : (!llvm.ptr, i64) -> i64
      %3887 = func.call @cc_intern(%3883, %3886) : (i64, i64) -> i64
      %3888 = func.call @cc_nil_value() : () -> i64
      %3889 = func.call @cc_cons(%3887, %3888) : (i64, i64) -> i64
      %3890 = func.call @cc_values_pack(%3889) : (i64) -> i64
      func.call @stack_push_pointer(%3887) : (i64) -> ()
      %3891 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3892 = func.call @stack_pop_pointer() : () -> i64
      %3893 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3894 = arith.constant 4 : i64
      %3895 = func.call @cc_make_string(%3893, %3894) : (!llvm.ptr, i64) -> i64
      %3896 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3897 = arith.constant 7 : i64
      %3898 = func.call @cc_make_string(%3896, %3897) : (!llvm.ptr, i64) -> i64
      %3899 = func.call @cc_intern(%3895, %3898) : (i64, i64) -> i64
      %3900 = func.call @cc_nil_value() : () -> i64
      %3901 = func.call @cc_cons(%3899, %3900) : (i64, i64) -> i64
      %3902 = func.call @cc_values_pack(%3901) : (i64) -> i64
      func.call @stack_push_pointer(%3899) : (i64) -> ()
      %3903 = func.call @stack_pop_pointer() : () -> i64
      %3904 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3905 = arith.constant 5 : i64
      %3906 = func.call @cc_make_string(%3904, %3905) : (!llvm.ptr, i64) -> i64
      %3907 = func.call @cc_nil_value() : () -> i64
      %3908 = func.call @cc_intern(%3906, %3907) : (i64, i64) -> i64
      %3909 = func.call @cc_nil_value() : () -> i64
      %3910 = func.call @cc_cons(%3908, %3909) : (i64, i64) -> i64
      %3911 = func.call @cc_values_pack(%3910) : (i64) -> i64
      func.call @stack_push_pointer(%3908) : (i64) -> ()
      %3912 = func.call @stack_pop_pointer() : () -> i64
      %3913 = func.call @cc_nil_value() : () -> i64
      %3914 = func.call @cc_errorp(%3733) : (i64) -> i64
      %3915 = arith.cmpi ne, %3914, %3913 : i64
      %3916 = arith.cmpi eq, %3913, %3913 : i64
      %3917 = arith.andi %3915, %3916 : i1
      %3918 = scf.if %3917 -> (i64) {
        scf.yield %3733 : i64
      } else {
        scf.yield %3913 : i64
      }
      %3919 = func.call @cc_errorp(%3798) : (i64) -> i64
      %3920 = arith.cmpi ne, %3919, %3913 : i64
      %3921 = arith.cmpi eq, %3918, %3913 : i64
      %3922 = arith.andi %3920, %3921 : i1
      %3923 = scf.if %3922 -> (i64) {
        scf.yield %3798 : i64
      } else {
        scf.yield %3918 : i64
      }
      %3924 = func.call @cc_errorp(%3857) : (i64) -> i64
      %3925 = arith.cmpi ne, %3924, %3913 : i64
      %3926 = arith.cmpi eq, %3923, %3913 : i64
      %3927 = arith.andi %3925, %3926 : i1
      %3928 = scf.if %3927 -> (i64) {
        scf.yield %3857 : i64
      } else {
        scf.yield %3923 : i64
      }
      %3929 = func.call @cc_errorp(%3880) : (i64) -> i64
      %3930 = arith.cmpi ne, %3929, %3913 : i64
      %3931 = arith.cmpi eq, %3928, %3913 : i64
      %3932 = arith.andi %3930, %3931 : i1
      %3933 = scf.if %3932 -> (i64) {
        scf.yield %3880 : i64
      } else {
        scf.yield %3928 : i64
      }
      %3934 = func.call @cc_errorp(%3891) : (i64) -> i64
      %3935 = arith.cmpi ne, %3934, %3913 : i64
      %3936 = arith.cmpi eq, %3933, %3913 : i64
      %3937 = arith.andi %3935, %3936 : i1
      %3938 = scf.if %3937 -> (i64) {
        scf.yield %3891 : i64
      } else {
        scf.yield %3933 : i64
      }
      %3939 = func.call @cc_errorp(%3892) : (i64) -> i64
      %3940 = arith.cmpi ne, %3939, %3913 : i64
      %3941 = arith.cmpi eq, %3938, %3913 : i64
      %3942 = arith.andi %3940, %3941 : i1
      %3943 = scf.if %3942 -> (i64) {
        scf.yield %3892 : i64
      } else {
        scf.yield %3938 : i64
      }
      %3944 = func.call @cc_errorp(%3903) : (i64) -> i64
      %3945 = arith.cmpi ne, %3944, %3913 : i64
      %3946 = arith.cmpi eq, %3943, %3913 : i64
      %3947 = arith.andi %3945, %3946 : i1
      %3948 = scf.if %3947 -> (i64) {
        scf.yield %3903 : i64
      } else {
        scf.yield %3943 : i64
      }
      %3949 = func.call @cc_errorp(%3912) : (i64) -> i64
      %3950 = arith.cmpi ne, %3949, %3913 : i64
      %3951 = arith.cmpi eq, %3948, %3913 : i64
      %3952 = arith.andi %3950, %3951 : i1
      %3953 = scf.if %3952 -> (i64) {
        scf.yield %3912 : i64
      } else {
        scf.yield %3948 : i64
      }
      %3954 = arith.cmpi ne, %3953, %3913 : i64
      scf.if %3954 {
        func.call @stack_push_pointer(%3953) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3733) : (i64) -> ()
        func.call @stack_push_pointer(%3798) : (i64) -> ()
        func.call @stack_push_pointer(%3857) : (i64) -> ()
        func.call @stack_push_pointer(%3880) : (i64) -> ()
        func.call @stack_push_pointer(%3891) : (i64) -> ()
        func.call @stack_push_pointer(%3892) : (i64) -> ()
        func.call @stack_push_pointer(%3903) : (i64) -> ()
        func.call @stack_push_pointer(%3912) : (i64) -> ()
        %3955 = llvm.mlir.addressof @str278 : !llvm.ptr
        %3956 = func.call @cc_make_function_ref_const(%3955) : (!llvm.ptr) -> i64
        %3957 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3956, %3957) : (i64, i64) -> ()
      }
      %3958 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3958 : i64
    }
    %3959 = func.call @cc_nil_value() : () -> i64
    %3960 = func.call @cc_errorp(%3724) : (i64) -> i64
    %3961 = arith.cmpi ne, %3960, %3959 : i64
    %3962 = scf.if %3961 -> (i64) {
      scf.yield %3724 : i64
    } else {
      %3963 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3964 = arith.constant 27 : i64
      %3965 = func.call @cc_make_string(%3963, %3964) : (!llvm.ptr, i64) -> i64
      %3966 = func.call @cc_nil_value() : () -> i64
      %3967 = func.call @cc_intern(%3965, %3966) : (i64, i64) -> i64
      %3968 = func.call @cc_nil_value() : () -> i64
      %3969 = func.call @cc_cons(%3967, %3968) : (i64, i64) -> i64
      %3970 = func.call @cc_values_pack(%3969) : (i64) -> i64
      func.call @stack_push_pointer(%3967) : (i64) -> ()
      %3971 = func.call @stack_pop_pointer() : () -> i64
      %3972 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3973 = arith.constant 13 : i64
      %3974 = func.call @cc_make_string(%3972, %3973) : (!llvm.ptr, i64) -> i64
      %3975 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3976 = arith.constant 11 : i64
      %3977 = func.call @cc_make_string(%3975, %3976) : (!llvm.ptr, i64) -> i64
      %3978 = func.call @cc_intern(%3974, %3977) : (i64, i64) -> i64
      %3979 = func.call @cc_nil_value() : () -> i64
      %3980 = func.call @cc_cons(%3978, %3979) : (i64, i64) -> i64
      %3981 = func.call @cc_values_pack(%3980) : (i64) -> i64
      func.call @stack_push_pointer(%3978) : (i64) -> ()
      %3982 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3983 = arith.constant 6 : i64
      %3984 = func.call @cc_make_string(%3982, %3983) : (!llvm.ptr, i64) -> i64
      %3985 = func.call @cc_nil_value() : () -> i64
      %3986 = func.call @cc_intern(%3984, %3985) : (i64, i64) -> i64
      %3987 = func.call @cc_nil_value() : () -> i64
      %3988 = func.call @cc_cons(%3986, %3987) : (i64, i64) -> i64
      %3989 = func.call @cc_values_pack(%3988) : (i64) -> i64
      func.call @stack_push_pointer(%3986) : (i64) -> ()
      %3990 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3991 = arith.constant 19 : i64
      %3992 = func.call @cc_make_string(%3990, %3991) : (!llvm.ptr, i64) -> i64
      %3993 = func.call @cc_nil_value() : () -> i64
      %3994 = func.call @cc_intern(%3992, %3993) : (i64, i64) -> i64
      %3995 = func.call @cc_nil_value() : () -> i64
      %3996 = func.call @cc_cons(%3994, %3995) : (i64, i64) -> i64
      %3997 = func.call @cc_values_pack(%3996) : (i64) -> i64
      func.call @stack_push_pointer(%3994) : (i64) -> ()
      %3998 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3999 = arith.constant 20 : i64
      %4000 = func.call @cc_make_string(%3998, %3999) : (!llvm.ptr, i64) -> i64
      %4001 = llvm.mlir.addressof @str285 : !llvm.ptr
      %4002 = arith.constant 3 : i64
      %4003 = func.call @cc_make_string(%4001, %4002) : (!llvm.ptr, i64) -> i64
      %4004 = func.call @cc_intern(%4000, %4003) : (i64, i64) -> i64
      %4005 = func.call @cc_nil_value() : () -> i64
      %4006 = func.call @cc_cons(%4004, %4005) : (i64, i64) -> i64
      %4007 = func.call @cc_values_pack(%4006) : (i64) -> i64
      func.call @stack_push_pointer(%4004) : (i64) -> ()
      %4008 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4008) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4009 = func.call @stack_pop_pointer() : () -> i64
      %4010 = func.call @stack_pop_pointer() : () -> i64
      %4011 = func.call @cc_cons(%4010, %4009) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4011) : (i64) -> ()
      %4012 = func.call @stack_pop_pointer() : () -> i64
      %4013 = func.call @stack_pop_pointer() : () -> i64
      %4014 = func.call @cc_cons(%4013, %4012) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4014) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4015 = func.call @stack_pop_pointer() : () -> i64
      %4016 = func.call @stack_pop_pointer() : () -> i64
      %4017 = func.call @cc_cons(%4016, %4015) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4017) : (i64) -> ()
      %4018 = func.call @stack_pop_pointer() : () -> i64
      %4019 = func.call @stack_pop_pointer() : () -> i64
      %4020 = func.call @cc_cons(%4019, %4018) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4020) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4021 = func.call @stack_pop_pointer() : () -> i64
      %4022 = func.call @stack_pop_pointer() : () -> i64
      %4023 = func.call @cc_cons(%4022, %4021) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4023) : (i64) -> ()
      %4024 = func.call @stack_pop_pointer() : () -> i64
      %4025 = func.call @stack_pop_pointer() : () -> i64
      %4026 = func.call @cc_cons(%4025, %4024) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4026) : (i64) -> ()
      %4027 = func.call @stack_pop_pointer() : () -> i64
      %4028 = func.call @stack_pop_pointer() : () -> i64
      %4029 = func.call @cc_cons(%4028, %4027) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4029) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4030 = func.call @stack_pop_pointer() : () -> i64
      %4031 = func.call @stack_pop_pointer() : () -> i64
      %4032 = func.call @cc_cons(%4031, %4030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4032) : (i64) -> ()
      %4033 = func.call @stack_pop_pointer() : () -> i64
      %4034 = func.call @stack_pop_pointer() : () -> i64
      %4035 = func.call @cc_cons(%4034, %4033) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4035) : (i64) -> ()
      %4036 = func.call @stack_pop_pointer() : () -> i64
      %4092 = arith.constant 162741310455819 : i64
      %4093 = arith.constant 0 : i64
      %4094 = func.call @cc_make_closure(%4092, %4093) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4094) : (i64) -> ()
      %4095 = func.call @stack_pop_pointer() : () -> i64
      %4096 = llvm.mlir.addressof @str287 : !llvm.ptr
      %4097 = arith.constant 4 : i64
      %4098 = func.call @cc_make_string(%4096, %4097) : (!llvm.ptr, i64) -> i64
      %4099 = func.call @cc_nil_value() : () -> i64
      %4100 = func.call @cc_intern(%4098, %4099) : (i64, i64) -> i64
      %4101 = func.call @cc_nil_value() : () -> i64
      %4102 = func.call @cc_cons(%4100, %4101) : (i64, i64) -> i64
      %4103 = func.call @cc_values_pack(%4102) : (i64) -> i64
      func.call @stack_push_pointer(%4100) : (i64) -> ()
      %4104 = llvm.mlir.addressof @str288 : !llvm.ptr
      %4105 = arith.constant 5 : i64
      %4106 = func.call @cc_make_string(%4104, %4105) : (!llvm.ptr, i64) -> i64
      %4107 = func.call @cc_nil_value() : () -> i64
      %4108 = func.call @cc_intern(%4106, %4107) : (i64, i64) -> i64
      %4109 = func.call @cc_nil_value() : () -> i64
      %4110 = func.call @cc_cons(%4108, %4109) : (i64, i64) -> i64
      %4111 = func.call @cc_values_pack(%4110) : (i64) -> i64
      func.call @stack_push_pointer(%4108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4112 = func.call @stack_pop_pointer() : () -> i64
      %4113 = func.call @stack_pop_pointer() : () -> i64
      %4114 = func.call @cc_cons(%4113, %4112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4114) : (i64) -> ()
      %4115 = func.call @stack_pop_pointer() : () -> i64
      %4116 = func.call @stack_pop_pointer() : () -> i64
      %4117 = func.call @cc_cons(%4116, %4115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4117) : (i64) -> ()
      %4118 = func.call @stack_pop_pointer() : () -> i64
      %4119 = llvm.mlir.addressof @str289 : !llvm.ptr
      %4120 = arith.constant 11 : i64
      %4121 = func.call @cc_make_string(%4119, %4120) : (!llvm.ptr, i64) -> i64
      %4122 = llvm.mlir.addressof @str290 : !llvm.ptr
      %4123 = arith.constant 7 : i64
      %4124 = func.call @cc_make_string(%4122, %4123) : (!llvm.ptr, i64) -> i64
      %4125 = func.call @cc_intern(%4121, %4124) : (i64, i64) -> i64
      %4126 = func.call @cc_nil_value() : () -> i64
      %4127 = func.call @cc_cons(%4125, %4126) : (i64, i64) -> i64
      %4128 = func.call @cc_values_pack(%4127) : (i64) -> i64
      func.call @stack_push_pointer(%4125) : (i64) -> ()
      %4129 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4130 = func.call @stack_pop_pointer() : () -> i64
      %4131 = llvm.mlir.addressof @str291 : !llvm.ptr
      %4132 = arith.constant 4 : i64
      %4133 = func.call @cc_make_string(%4131, %4132) : (!llvm.ptr, i64) -> i64
      %4134 = llvm.mlir.addressof @str292 : !llvm.ptr
      %4135 = arith.constant 7 : i64
      %4136 = func.call @cc_make_string(%4134, %4135) : (!llvm.ptr, i64) -> i64
      %4137 = func.call @cc_intern(%4133, %4136) : (i64, i64) -> i64
      %4138 = func.call @cc_nil_value() : () -> i64
      %4139 = func.call @cc_cons(%4137, %4138) : (i64, i64) -> i64
      %4140 = func.call @cc_values_pack(%4139) : (i64) -> i64
      func.call @stack_push_pointer(%4137) : (i64) -> ()
      %4141 = func.call @stack_pop_pointer() : () -> i64
      %4142 = llvm.mlir.addressof @str293 : !llvm.ptr
      %4143 = arith.constant 5 : i64
      %4144 = func.call @cc_make_string(%4142, %4143) : (!llvm.ptr, i64) -> i64
      %4145 = func.call @cc_nil_value() : () -> i64
      %4146 = func.call @cc_intern(%4144, %4145) : (i64, i64) -> i64
      %4147 = func.call @cc_nil_value() : () -> i64
      %4148 = func.call @cc_cons(%4146, %4147) : (i64, i64) -> i64
      %4149 = func.call @cc_values_pack(%4148) : (i64) -> i64
      func.call @stack_push_pointer(%4146) : (i64) -> ()
      %4150 = func.call @stack_pop_pointer() : () -> i64
      %4151 = func.call @cc_nil_value() : () -> i64
      %4152 = func.call @cc_errorp(%3971) : (i64) -> i64
      %4153 = arith.cmpi ne, %4152, %4151 : i64
      %4154 = arith.cmpi eq, %4151, %4151 : i64
      %4155 = arith.andi %4153, %4154 : i1
      %4156 = scf.if %4155 -> (i64) {
        scf.yield %3971 : i64
      } else {
        scf.yield %4151 : i64
      }
      %4157 = func.call @cc_errorp(%4036) : (i64) -> i64
      %4158 = arith.cmpi ne, %4157, %4151 : i64
      %4159 = arith.cmpi eq, %4156, %4151 : i64
      %4160 = arith.andi %4158, %4159 : i1
      %4161 = scf.if %4160 -> (i64) {
        scf.yield %4036 : i64
      } else {
        scf.yield %4156 : i64
      }
      %4162 = func.call @cc_errorp(%4095) : (i64) -> i64
      %4163 = arith.cmpi ne, %4162, %4151 : i64
      %4164 = arith.cmpi eq, %4161, %4151 : i64
      %4165 = arith.andi %4163, %4164 : i1
      %4166 = scf.if %4165 -> (i64) {
        scf.yield %4095 : i64
      } else {
        scf.yield %4161 : i64
      }
      %4167 = func.call @cc_errorp(%4118) : (i64) -> i64
      %4168 = arith.cmpi ne, %4167, %4151 : i64
      %4169 = arith.cmpi eq, %4166, %4151 : i64
      %4170 = arith.andi %4168, %4169 : i1
      %4171 = scf.if %4170 -> (i64) {
        scf.yield %4118 : i64
      } else {
        scf.yield %4166 : i64
      }
      %4172 = func.call @cc_errorp(%4129) : (i64) -> i64
      %4173 = arith.cmpi ne, %4172, %4151 : i64
      %4174 = arith.cmpi eq, %4171, %4151 : i64
      %4175 = arith.andi %4173, %4174 : i1
      %4176 = scf.if %4175 -> (i64) {
        scf.yield %4129 : i64
      } else {
        scf.yield %4171 : i64
      }
      %4177 = func.call @cc_errorp(%4130) : (i64) -> i64
      %4178 = arith.cmpi ne, %4177, %4151 : i64
      %4179 = arith.cmpi eq, %4176, %4151 : i64
      %4180 = arith.andi %4178, %4179 : i1
      %4181 = scf.if %4180 -> (i64) {
        scf.yield %4130 : i64
      } else {
        scf.yield %4176 : i64
      }
      %4182 = func.call @cc_errorp(%4141) : (i64) -> i64
      %4183 = arith.cmpi ne, %4182, %4151 : i64
      %4184 = arith.cmpi eq, %4181, %4151 : i64
      %4185 = arith.andi %4183, %4184 : i1
      %4186 = scf.if %4185 -> (i64) {
        scf.yield %4141 : i64
      } else {
        scf.yield %4181 : i64
      }
      %4187 = func.call @cc_errorp(%4150) : (i64) -> i64
      %4188 = arith.cmpi ne, %4187, %4151 : i64
      %4189 = arith.cmpi eq, %4186, %4151 : i64
      %4190 = arith.andi %4188, %4189 : i1
      %4191 = scf.if %4190 -> (i64) {
        scf.yield %4150 : i64
      } else {
        scf.yield %4186 : i64
      }
      %4192 = arith.cmpi ne, %4191, %4151 : i64
      scf.if %4192 {
        func.call @stack_push_pointer(%4191) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3971) : (i64) -> ()
        func.call @stack_push_pointer(%4036) : (i64) -> ()
        func.call @stack_push_pointer(%4095) : (i64) -> ()
        func.call @stack_push_pointer(%4118) : (i64) -> ()
        func.call @stack_push_pointer(%4129) : (i64) -> ()
        func.call @stack_push_pointer(%4130) : (i64) -> ()
        func.call @stack_push_pointer(%4141) : (i64) -> ()
        func.call @stack_push_pointer(%4150) : (i64) -> ()
        %4193 = llvm.mlir.addressof @str294 : !llvm.ptr
        %4194 = func.call @cc_make_function_ref_const(%4193) : (!llvm.ptr) -> i64
        %4195 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4194, %4195) : (i64, i64) -> ()
      }
      %4196 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4196 : i64
    }
    %4197 = func.call @cc_nil_value() : () -> i64
    %4198 = func.call @cc_errorp(%3962) : (i64) -> i64
    %4199 = arith.cmpi ne, %4198, %4197 : i64
    %4200 = scf.if %4199 -> (i64) {
      scf.yield %3962 : i64
    } else {
      %4201 = llvm.mlir.addressof @str295 : !llvm.ptr
      %4202 = arith.constant 27 : i64
      %4203 = func.call @cc_make_string(%4201, %4202) : (!llvm.ptr, i64) -> i64
      %4204 = func.call @cc_nil_value() : () -> i64
      %4205 = func.call @cc_intern(%4203, %4204) : (i64, i64) -> i64
      %4206 = func.call @cc_nil_value() : () -> i64
      %4207 = func.call @cc_cons(%4205, %4206) : (i64, i64) -> i64
      %4208 = func.call @cc_values_pack(%4207) : (i64) -> i64
      func.call @stack_push_pointer(%4205) : (i64) -> ()
      %4209 = func.call @stack_pop_pointer() : () -> i64
      %4210 = llvm.mlir.addressof @str296 : !llvm.ptr
      %4211 = arith.constant 13 : i64
      %4212 = func.call @cc_make_string(%4210, %4211) : (!llvm.ptr, i64) -> i64
      %4213 = llvm.mlir.addressof @str297 : !llvm.ptr
      %4214 = arith.constant 11 : i64
      %4215 = func.call @cc_make_string(%4213, %4214) : (!llvm.ptr, i64) -> i64
      %4216 = func.call @cc_intern(%4212, %4215) : (i64, i64) -> i64
      %4217 = func.call @cc_nil_value() : () -> i64
      %4218 = func.call @cc_cons(%4216, %4217) : (i64, i64) -> i64
      %4219 = func.call @cc_values_pack(%4218) : (i64) -> i64
      func.call @stack_push_pointer(%4216) : (i64) -> ()
      %4220 = llvm.mlir.addressof @str298 : !llvm.ptr
      %4221 = arith.constant 6 : i64
      %4222 = func.call @cc_make_string(%4220, %4221) : (!llvm.ptr, i64) -> i64
      %4223 = func.call @cc_nil_value() : () -> i64
      %4224 = func.call @cc_intern(%4222, %4223) : (i64, i64) -> i64
      %4225 = func.call @cc_nil_value() : () -> i64
      %4226 = func.call @cc_cons(%4224, %4225) : (i64, i64) -> i64
      %4227 = func.call @cc_values_pack(%4226) : (i64) -> i64
      func.call @stack_push_pointer(%4224) : (i64) -> ()
      %4228 = llvm.mlir.addressof @str299 : !llvm.ptr
      %4229 = arith.constant 19 : i64
      %4230 = func.call @cc_make_string(%4228, %4229) : (!llvm.ptr, i64) -> i64
      %4231 = func.call @cc_nil_value() : () -> i64
      %4232 = func.call @cc_intern(%4230, %4231) : (i64, i64) -> i64
      %4233 = func.call @cc_nil_value() : () -> i64
      %4234 = func.call @cc_cons(%4232, %4233) : (i64, i64) -> i64
      %4235 = func.call @cc_values_pack(%4234) : (i64) -> i64
      func.call @stack_push_pointer(%4232) : (i64) -> ()
      %4236 = llvm.mlir.addressof @str300 : !llvm.ptr
      %4237 = arith.constant 20 : i64
      %4238 = func.call @cc_make_string(%4236, %4237) : (!llvm.ptr, i64) -> i64
      %4239 = llvm.mlir.addressof @str301 : !llvm.ptr
      %4240 = arith.constant 3 : i64
      %4241 = func.call @cc_make_string(%4239, %4240) : (!llvm.ptr, i64) -> i64
      %4242 = func.call @cc_intern(%4238, %4241) : (i64, i64) -> i64
      %4243 = func.call @cc_nil_value() : () -> i64
      %4244 = func.call @cc_cons(%4242, %4243) : (i64, i64) -> i64
      %4245 = func.call @cc_values_pack(%4244) : (i64) -> i64
      func.call @stack_push_pointer(%4242) : (i64) -> ()
      %4246 = arith.constant 3.0 : f64
      %4247 = func.call @cc_box_single_float(%4246) : (f64) -> i64
      func.call @stack_push_pointer(%4247) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4248 = func.call @stack_pop_pointer() : () -> i64
      %4249 = func.call @stack_pop_pointer() : () -> i64
      %4250 = func.call @cc_cons(%4249, %4248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4250) : (i64) -> ()
      %4251 = func.call @stack_pop_pointer() : () -> i64
      %4252 = func.call @stack_pop_pointer() : () -> i64
      %4253 = func.call @cc_cons(%4252, %4251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4253) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4254 = func.call @stack_pop_pointer() : () -> i64
      %4255 = func.call @stack_pop_pointer() : () -> i64
      %4256 = func.call @cc_cons(%4255, %4254) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4256) : (i64) -> ()
      %4257 = func.call @stack_pop_pointer() : () -> i64
      %4258 = func.call @stack_pop_pointer() : () -> i64
      %4259 = func.call @cc_cons(%4258, %4257) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4259) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4260 = func.call @stack_pop_pointer() : () -> i64
      %4261 = func.call @stack_pop_pointer() : () -> i64
      %4262 = func.call @cc_cons(%4261, %4260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4262) : (i64) -> ()
      %4263 = func.call @stack_pop_pointer() : () -> i64
      %4264 = func.call @stack_pop_pointer() : () -> i64
      %4265 = func.call @cc_cons(%4264, %4263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4265) : (i64) -> ()
      %4266 = func.call @stack_pop_pointer() : () -> i64
      %4267 = func.call @stack_pop_pointer() : () -> i64
      %4268 = func.call @cc_cons(%4267, %4266) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4268) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4269 = func.call @stack_pop_pointer() : () -> i64
      %4270 = func.call @stack_pop_pointer() : () -> i64
      %4271 = func.call @cc_cons(%4270, %4269) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4271) : (i64) -> ()
      %4272 = func.call @stack_pop_pointer() : () -> i64
      %4273 = func.call @stack_pop_pointer() : () -> i64
      %4274 = func.call @cc_cons(%4273, %4272) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4274) : (i64) -> ()
      %4275 = func.call @stack_pop_pointer() : () -> i64
      %4332 = arith.constant 162741310455820 : i64
      %4333 = arith.constant 0 : i64
      %4334 = func.call @cc_make_closure(%4332, %4333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4334) : (i64) -> ()
      %4335 = func.call @stack_pop_pointer() : () -> i64
      %4336 = llvm.mlir.addressof @str303 : !llvm.ptr
      %4337 = arith.constant 4 : i64
      %4338 = func.call @cc_make_string(%4336, %4337) : (!llvm.ptr, i64) -> i64
      %4339 = func.call @cc_nil_value() : () -> i64
      %4340 = func.call @cc_intern(%4338, %4339) : (i64, i64) -> i64
      %4341 = func.call @cc_nil_value() : () -> i64
      %4342 = func.call @cc_cons(%4340, %4341) : (i64, i64) -> i64
      %4343 = func.call @cc_values_pack(%4342) : (i64) -> i64
      func.call @stack_push_pointer(%4340) : (i64) -> ()
      %4344 = llvm.mlir.addressof @str304 : !llvm.ptr
      %4345 = arith.constant 5 : i64
      %4346 = func.call @cc_make_string(%4344, %4345) : (!llvm.ptr, i64) -> i64
      %4347 = func.call @cc_nil_value() : () -> i64
      %4348 = func.call @cc_intern(%4346, %4347) : (i64, i64) -> i64
      %4349 = func.call @cc_nil_value() : () -> i64
      %4350 = func.call @cc_cons(%4348, %4349) : (i64, i64) -> i64
      %4351 = func.call @cc_values_pack(%4350) : (i64) -> i64
      func.call @stack_push_pointer(%4348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4352 = func.call @stack_pop_pointer() : () -> i64
      %4353 = func.call @stack_pop_pointer() : () -> i64
      %4354 = func.call @cc_cons(%4353, %4352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4354) : (i64) -> ()
      %4355 = func.call @stack_pop_pointer() : () -> i64
      %4356 = func.call @stack_pop_pointer() : () -> i64
      %4357 = func.call @cc_cons(%4356, %4355) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4357) : (i64) -> ()
      %4358 = func.call @stack_pop_pointer() : () -> i64
      %4359 = llvm.mlir.addressof @str305 : !llvm.ptr
      %4360 = arith.constant 11 : i64
      %4361 = func.call @cc_make_string(%4359, %4360) : (!llvm.ptr, i64) -> i64
      %4362 = llvm.mlir.addressof @str306 : !llvm.ptr
      %4363 = arith.constant 7 : i64
      %4364 = func.call @cc_make_string(%4362, %4363) : (!llvm.ptr, i64) -> i64
      %4365 = func.call @cc_intern(%4361, %4364) : (i64, i64) -> i64
      %4366 = func.call @cc_nil_value() : () -> i64
      %4367 = func.call @cc_cons(%4365, %4366) : (i64, i64) -> i64
      %4368 = func.call @cc_values_pack(%4367) : (i64) -> i64
      func.call @stack_push_pointer(%4365) : (i64) -> ()
      %4369 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4370 = func.call @stack_pop_pointer() : () -> i64
      %4371 = llvm.mlir.addressof @str307 : !llvm.ptr
      %4372 = arith.constant 4 : i64
      %4373 = func.call @cc_make_string(%4371, %4372) : (!llvm.ptr, i64) -> i64
      %4374 = llvm.mlir.addressof @str308 : !llvm.ptr
      %4375 = arith.constant 7 : i64
      %4376 = func.call @cc_make_string(%4374, %4375) : (!llvm.ptr, i64) -> i64
      %4377 = func.call @cc_intern(%4373, %4376) : (i64, i64) -> i64
      %4378 = func.call @cc_nil_value() : () -> i64
      %4379 = func.call @cc_cons(%4377, %4378) : (i64, i64) -> i64
      %4380 = func.call @cc_values_pack(%4379) : (i64) -> i64
      func.call @stack_push_pointer(%4377) : (i64) -> ()
      %4381 = func.call @stack_pop_pointer() : () -> i64
      %4382 = llvm.mlir.addressof @str309 : !llvm.ptr
      %4383 = arith.constant 5 : i64
      %4384 = func.call @cc_make_string(%4382, %4383) : (!llvm.ptr, i64) -> i64
      %4385 = func.call @cc_nil_value() : () -> i64
      %4386 = func.call @cc_intern(%4384, %4385) : (i64, i64) -> i64
      %4387 = func.call @cc_nil_value() : () -> i64
      %4388 = func.call @cc_cons(%4386, %4387) : (i64, i64) -> i64
      %4389 = func.call @cc_values_pack(%4388) : (i64) -> i64
      func.call @stack_push_pointer(%4386) : (i64) -> ()
      %4390 = func.call @stack_pop_pointer() : () -> i64
      %4391 = func.call @cc_nil_value() : () -> i64
      %4392 = func.call @cc_errorp(%4209) : (i64) -> i64
      %4393 = arith.cmpi ne, %4392, %4391 : i64
      %4394 = arith.cmpi eq, %4391, %4391 : i64
      %4395 = arith.andi %4393, %4394 : i1
      %4396 = scf.if %4395 -> (i64) {
        scf.yield %4209 : i64
      } else {
        scf.yield %4391 : i64
      }
      %4397 = func.call @cc_errorp(%4275) : (i64) -> i64
      %4398 = arith.cmpi ne, %4397, %4391 : i64
      %4399 = arith.cmpi eq, %4396, %4391 : i64
      %4400 = arith.andi %4398, %4399 : i1
      %4401 = scf.if %4400 -> (i64) {
        scf.yield %4275 : i64
      } else {
        scf.yield %4396 : i64
      }
      %4402 = func.call @cc_errorp(%4335) : (i64) -> i64
      %4403 = arith.cmpi ne, %4402, %4391 : i64
      %4404 = arith.cmpi eq, %4401, %4391 : i64
      %4405 = arith.andi %4403, %4404 : i1
      %4406 = scf.if %4405 -> (i64) {
        scf.yield %4335 : i64
      } else {
        scf.yield %4401 : i64
      }
      %4407 = func.call @cc_errorp(%4358) : (i64) -> i64
      %4408 = arith.cmpi ne, %4407, %4391 : i64
      %4409 = arith.cmpi eq, %4406, %4391 : i64
      %4410 = arith.andi %4408, %4409 : i1
      %4411 = scf.if %4410 -> (i64) {
        scf.yield %4358 : i64
      } else {
        scf.yield %4406 : i64
      }
      %4412 = func.call @cc_errorp(%4369) : (i64) -> i64
      %4413 = arith.cmpi ne, %4412, %4391 : i64
      %4414 = arith.cmpi eq, %4411, %4391 : i64
      %4415 = arith.andi %4413, %4414 : i1
      %4416 = scf.if %4415 -> (i64) {
        scf.yield %4369 : i64
      } else {
        scf.yield %4411 : i64
      }
      %4417 = func.call @cc_errorp(%4370) : (i64) -> i64
      %4418 = arith.cmpi ne, %4417, %4391 : i64
      %4419 = arith.cmpi eq, %4416, %4391 : i64
      %4420 = arith.andi %4418, %4419 : i1
      %4421 = scf.if %4420 -> (i64) {
        scf.yield %4370 : i64
      } else {
        scf.yield %4416 : i64
      }
      %4422 = func.call @cc_errorp(%4381) : (i64) -> i64
      %4423 = arith.cmpi ne, %4422, %4391 : i64
      %4424 = arith.cmpi eq, %4421, %4391 : i64
      %4425 = arith.andi %4423, %4424 : i1
      %4426 = scf.if %4425 -> (i64) {
        scf.yield %4381 : i64
      } else {
        scf.yield %4421 : i64
      }
      %4427 = func.call @cc_errorp(%4390) : (i64) -> i64
      %4428 = arith.cmpi ne, %4427, %4391 : i64
      %4429 = arith.cmpi eq, %4426, %4391 : i64
      %4430 = arith.andi %4428, %4429 : i1
      %4431 = scf.if %4430 -> (i64) {
        scf.yield %4390 : i64
      } else {
        scf.yield %4426 : i64
      }
      %4432 = arith.cmpi ne, %4431, %4391 : i64
      scf.if %4432 {
        func.call @stack_push_pointer(%4431) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4209) : (i64) -> ()
        func.call @stack_push_pointer(%4275) : (i64) -> ()
        func.call @stack_push_pointer(%4335) : (i64) -> ()
        func.call @stack_push_pointer(%4358) : (i64) -> ()
        func.call @stack_push_pointer(%4369) : (i64) -> ()
        func.call @stack_push_pointer(%4370) : (i64) -> ()
        func.call @stack_push_pointer(%4381) : (i64) -> ()
        func.call @stack_push_pointer(%4390) : (i64) -> ()
        %4433 = llvm.mlir.addressof @str310 : !llvm.ptr
        %4434 = func.call @cc_make_function_ref_const(%4433) : (!llvm.ptr) -> i64
        %4435 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4434, %4435) : (i64, i64) -> ()
      }
      %4436 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4436 : i64
    }
    %4437 = func.call @cc_nil_value() : () -> i64
    %4438 = func.call @cc_errorp(%4200) : (i64) -> i64
    %4439 = arith.cmpi ne, %4438, %4437 : i64
    %4440 = scf.if %4439 -> (i64) {
      scf.yield %4200 : i64
    } else {
      %4441 = llvm.mlir.addressof @str311 : !llvm.ptr
      %4442 = arith.constant 27 : i64
      %4443 = func.call @cc_make_string(%4441, %4442) : (!llvm.ptr, i64) -> i64
      %4444 = func.call @cc_nil_value() : () -> i64
      %4445 = func.call @cc_intern(%4443, %4444) : (i64, i64) -> i64
      %4446 = func.call @cc_nil_value() : () -> i64
      %4447 = func.call @cc_cons(%4445, %4446) : (i64, i64) -> i64
      %4448 = func.call @cc_values_pack(%4447) : (i64) -> i64
      func.call @stack_push_pointer(%4445) : (i64) -> ()
      %4449 = func.call @stack_pop_pointer() : () -> i64
      %4450 = llvm.mlir.addressof @str312 : !llvm.ptr
      %4451 = arith.constant 13 : i64
      %4452 = func.call @cc_make_string(%4450, %4451) : (!llvm.ptr, i64) -> i64
      %4453 = llvm.mlir.addressof @str313 : !llvm.ptr
      %4454 = arith.constant 11 : i64
      %4455 = func.call @cc_make_string(%4453, %4454) : (!llvm.ptr, i64) -> i64
      %4456 = func.call @cc_intern(%4452, %4455) : (i64, i64) -> i64
      %4457 = func.call @cc_nil_value() : () -> i64
      %4458 = func.call @cc_cons(%4456, %4457) : (i64, i64) -> i64
      %4459 = func.call @cc_values_pack(%4458) : (i64) -> i64
      func.call @stack_push_pointer(%4456) : (i64) -> ()
      %4460 = llvm.mlir.addressof @str314 : !llvm.ptr
      %4461 = arith.constant 6 : i64
      %4462 = func.call @cc_make_string(%4460, %4461) : (!llvm.ptr, i64) -> i64
      %4463 = func.call @cc_nil_value() : () -> i64
      %4464 = func.call @cc_intern(%4462, %4463) : (i64, i64) -> i64
      %4465 = func.call @cc_nil_value() : () -> i64
      %4466 = func.call @cc_cons(%4464, %4465) : (i64, i64) -> i64
      %4467 = func.call @cc_values_pack(%4466) : (i64) -> i64
      func.call @stack_push_pointer(%4464) : (i64) -> ()
      %4468 = llvm.mlir.addressof @str315 : !llvm.ptr
      %4469 = arith.constant 19 : i64
      %4470 = func.call @cc_make_string(%4468, %4469) : (!llvm.ptr, i64) -> i64
      %4471 = func.call @cc_nil_value() : () -> i64
      %4472 = func.call @cc_intern(%4470, %4471) : (i64, i64) -> i64
      %4473 = func.call @cc_nil_value() : () -> i64
      %4474 = func.call @cc_cons(%4472, %4473) : (i64, i64) -> i64
      %4475 = func.call @cc_values_pack(%4474) : (i64) -> i64
      func.call @stack_push_pointer(%4472) : (i64) -> ()
      %4476 = llvm.mlir.addressof @str316 : !llvm.ptr
      %4477 = arith.constant 20 : i64
      %4478 = func.call @cc_make_string(%4476, %4477) : (!llvm.ptr, i64) -> i64
      %4479 = llvm.mlir.addressof @str317 : !llvm.ptr
      %4480 = arith.constant 3 : i64
      %4481 = func.call @cc_make_string(%4479, %4480) : (!llvm.ptr, i64) -> i64
      %4482 = func.call @cc_intern(%4478, %4481) : (i64, i64) -> i64
      %4483 = func.call @cc_nil_value() : () -> i64
      %4484 = func.call @cc_cons(%4482, %4483) : (i64, i64) -> i64
      %4485 = func.call @cc_values_pack(%4484) : (i64) -> i64
      func.call @stack_push_pointer(%4482) : (i64) -> ()
      %4486 = llvm.mlir.addressof @str318 : !llvm.ptr
      %4487 = arith.constant 2 : i64
      %4488 = func.call @cc_make_string(%4486, %4487) : (!llvm.ptr, i64) -> i64
      %4489 = llvm.mlir.addressof @str319 : !llvm.ptr
      %4490 = arith.constant 11 : i64
      %4491 = func.call @cc_make_string(%4489, %4490) : (!llvm.ptr, i64) -> i64
      %4492 = func.call @cc_intern(%4488, %4491) : (i64, i64) -> i64
      %4493 = func.call @cc_nil_value() : () -> i64
      %4494 = func.call @cc_cons(%4492, %4493) : (i64, i64) -> i64
      %4495 = func.call @cc_values_pack(%4494) : (i64) -> i64
      func.call @stack_push_pointer(%4492) : (i64) -> ()
      %4496 = llvm.mlir.addressof @str320 : !llvm.ptr
      %4497 = arith.constant 20 : i64
      %4498 = func.call @cc_make_string(%4496, %4497) : (!llvm.ptr, i64) -> i64
      %4499 = llvm.mlir.addressof @str321 : !llvm.ptr
      %4500 = arith.constant 11 : i64
      %4501 = func.call @cc_make_string(%4499, %4500) : (!llvm.ptr, i64) -> i64
      %4502 = func.call @cc_intern(%4498, %4501) : (i64, i64) -> i64
      %4503 = func.call @cc_nil_value() : () -> i64
      %4504 = func.call @cc_cons(%4502, %4503) : (i64, i64) -> i64
      %4505 = func.call @cc_values_pack(%4504) : (i64) -> i64
      func.call @stack_push_pointer(%4502) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4506 = func.call @stack_pop_pointer() : () -> i64
      %4507 = func.call @stack_pop_pointer() : () -> i64
      %4508 = func.call @cc_cons(%4507, %4506) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4508) : (i64) -> ()
      %4509 = func.call @stack_pop_pointer() : () -> i64
      %4510 = func.call @stack_pop_pointer() : () -> i64
      %4511 = func.call @cc_cons(%4510, %4509) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4511) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4512 = func.call @stack_pop_pointer() : () -> i64
      %4513 = func.call @stack_pop_pointer() : () -> i64
      %4514 = func.call @cc_cons(%4513, %4512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4514) : (i64) -> ()
      %4515 = func.call @stack_pop_pointer() : () -> i64
      %4516 = func.call @stack_pop_pointer() : () -> i64
      %4517 = func.call @cc_cons(%4516, %4515) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4517) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4518 = func.call @stack_pop_pointer() : () -> i64
      %4519 = func.call @stack_pop_pointer() : () -> i64
      %4520 = func.call @cc_cons(%4519, %4518) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4520) : (i64) -> ()
      %4521 = func.call @stack_pop_pointer() : () -> i64
      %4522 = func.call @stack_pop_pointer() : () -> i64
      %4523 = func.call @cc_cons(%4522, %4521) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4523) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %4533 = func.call @stack_pop_pointer() : () -> i64
      %4534 = func.call @stack_pop_pointer() : () -> i64
      %4535 = func.call @cc_cons(%4534, %4533) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4535) : (i64) -> ()
      %4536 = func.call @stack_pop_pointer() : () -> i64
      %4537 = func.call @stack_pop_pointer() : () -> i64
      %4538 = func.call @cc_cons(%4537, %4536) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4538) : (i64) -> ()
      %4539 = func.call @stack_pop_pointer() : () -> i64
      %4633 = arith.constant 162741310455821 : i64
      %4634 = arith.constant 0 : i64
      %4635 = func.call @cc_make_closure(%4633, %4634) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4635) : (i64) -> ()
      %4636 = func.call @stack_pop_pointer() : () -> i64
      %4637 = llvm.mlir.addressof @str325 : !llvm.ptr
      %4638 = arith.constant 4 : i64
      %4639 = func.call @cc_make_string(%4637, %4638) : (!llvm.ptr, i64) -> i64
      %4640 = func.call @cc_nil_value() : () -> i64
      %4641 = func.call @cc_intern(%4639, %4640) : (i64, i64) -> i64
      %4642 = func.call @cc_nil_value() : () -> i64
      %4643 = func.call @cc_cons(%4641, %4642) : (i64, i64) -> i64
      %4644 = func.call @cc_values_pack(%4643) : (i64) -> i64
      func.call @stack_push_pointer(%4641) : (i64) -> ()
      %4645 = llvm.mlir.addressof @str326 : !llvm.ptr
      %4646 = arith.constant 5 : i64
      %4647 = func.call @cc_make_string(%4645, %4646) : (!llvm.ptr, i64) -> i64
      %4648 = func.call @cc_nil_value() : () -> i64
      %4649 = func.call @cc_intern(%4647, %4648) : (i64, i64) -> i64
      %4650 = func.call @cc_nil_value() : () -> i64
      %4651 = func.call @cc_cons(%4649, %4650) : (i64, i64) -> i64
      %4652 = func.call @cc_values_pack(%4651) : (i64) -> i64
      func.call @stack_push_pointer(%4649) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4653 = func.call @stack_pop_pointer() : () -> i64
      %4654 = func.call @stack_pop_pointer() : () -> i64
      %4655 = func.call @cc_cons(%4654, %4653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4655) : (i64) -> ()
      %4656 = func.call @stack_pop_pointer() : () -> i64
      %4657 = func.call @stack_pop_pointer() : () -> i64
      %4658 = func.call @cc_cons(%4657, %4656) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4658) : (i64) -> ()
      %4659 = func.call @stack_pop_pointer() : () -> i64
      %4660 = llvm.mlir.addressof @str327 : !llvm.ptr
      %4661 = arith.constant 11 : i64
      %4662 = func.call @cc_make_string(%4660, %4661) : (!llvm.ptr, i64) -> i64
      %4663 = llvm.mlir.addressof @str328 : !llvm.ptr
      %4664 = arith.constant 7 : i64
      %4665 = func.call @cc_make_string(%4663, %4664) : (!llvm.ptr, i64) -> i64
      %4666 = func.call @cc_intern(%4662, %4665) : (i64, i64) -> i64
      %4667 = func.call @cc_nil_value() : () -> i64
      %4668 = func.call @cc_cons(%4666, %4667) : (i64, i64) -> i64
      %4669 = func.call @cc_values_pack(%4668) : (i64) -> i64
      func.call @stack_push_pointer(%4666) : (i64) -> ()
      %4670 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4671 = func.call @stack_pop_pointer() : () -> i64
      %4672 = llvm.mlir.addressof @str329 : !llvm.ptr
      %4673 = arith.constant 4 : i64
      %4674 = func.call @cc_make_string(%4672, %4673) : (!llvm.ptr, i64) -> i64
      %4675 = llvm.mlir.addressof @str330 : !llvm.ptr
      %4676 = arith.constant 7 : i64
      %4677 = func.call @cc_make_string(%4675, %4676) : (!llvm.ptr, i64) -> i64
      %4678 = func.call @cc_intern(%4674, %4677) : (i64, i64) -> i64
      %4679 = func.call @cc_nil_value() : () -> i64
      %4680 = func.call @cc_cons(%4678, %4679) : (i64, i64) -> i64
      %4681 = func.call @cc_values_pack(%4680) : (i64) -> i64
      func.call @stack_push_pointer(%4678) : (i64) -> ()
      %4682 = func.call @stack_pop_pointer() : () -> i64
      %4683 = llvm.mlir.addressof @str331 : !llvm.ptr
      %4684 = arith.constant 5 : i64
      %4685 = func.call @cc_make_string(%4683, %4684) : (!llvm.ptr, i64) -> i64
      %4686 = func.call @cc_nil_value() : () -> i64
      %4687 = func.call @cc_intern(%4685, %4686) : (i64, i64) -> i64
      %4688 = func.call @cc_nil_value() : () -> i64
      %4689 = func.call @cc_cons(%4687, %4688) : (i64, i64) -> i64
      %4690 = func.call @cc_values_pack(%4689) : (i64) -> i64
      func.call @stack_push_pointer(%4687) : (i64) -> ()
      %4691 = func.call @stack_pop_pointer() : () -> i64
      %4692 = func.call @cc_nil_value() : () -> i64
      %4693 = func.call @cc_errorp(%4449) : (i64) -> i64
      %4694 = arith.cmpi ne, %4693, %4692 : i64
      %4695 = arith.cmpi eq, %4692, %4692 : i64
      %4696 = arith.andi %4694, %4695 : i1
      %4697 = scf.if %4696 -> (i64) {
        scf.yield %4449 : i64
      } else {
        scf.yield %4692 : i64
      }
      %4698 = func.call @cc_errorp(%4539) : (i64) -> i64
      %4699 = arith.cmpi ne, %4698, %4692 : i64
      %4700 = arith.cmpi eq, %4697, %4692 : i64
      %4701 = arith.andi %4699, %4700 : i1
      %4702 = scf.if %4701 -> (i64) {
        scf.yield %4539 : i64
      } else {
        scf.yield %4697 : i64
      }
      %4703 = func.call @cc_errorp(%4636) : (i64) -> i64
      %4704 = arith.cmpi ne, %4703, %4692 : i64
      %4705 = arith.cmpi eq, %4702, %4692 : i64
      %4706 = arith.andi %4704, %4705 : i1
      %4707 = scf.if %4706 -> (i64) {
        scf.yield %4636 : i64
      } else {
        scf.yield %4702 : i64
      }
      %4708 = func.call @cc_errorp(%4659) : (i64) -> i64
      %4709 = arith.cmpi ne, %4708, %4692 : i64
      %4710 = arith.cmpi eq, %4707, %4692 : i64
      %4711 = arith.andi %4709, %4710 : i1
      %4712 = scf.if %4711 -> (i64) {
        scf.yield %4659 : i64
      } else {
        scf.yield %4707 : i64
      }
      %4713 = func.call @cc_errorp(%4670) : (i64) -> i64
      %4714 = arith.cmpi ne, %4713, %4692 : i64
      %4715 = arith.cmpi eq, %4712, %4692 : i64
      %4716 = arith.andi %4714, %4715 : i1
      %4717 = scf.if %4716 -> (i64) {
        scf.yield %4670 : i64
      } else {
        scf.yield %4712 : i64
      }
      %4718 = func.call @cc_errorp(%4671) : (i64) -> i64
      %4719 = arith.cmpi ne, %4718, %4692 : i64
      %4720 = arith.cmpi eq, %4717, %4692 : i64
      %4721 = arith.andi %4719, %4720 : i1
      %4722 = scf.if %4721 -> (i64) {
        scf.yield %4671 : i64
      } else {
        scf.yield %4717 : i64
      }
      %4723 = func.call @cc_errorp(%4682) : (i64) -> i64
      %4724 = arith.cmpi ne, %4723, %4692 : i64
      %4725 = arith.cmpi eq, %4722, %4692 : i64
      %4726 = arith.andi %4724, %4725 : i1
      %4727 = scf.if %4726 -> (i64) {
        scf.yield %4682 : i64
      } else {
        scf.yield %4722 : i64
      }
      %4728 = func.call @cc_errorp(%4691) : (i64) -> i64
      %4729 = arith.cmpi ne, %4728, %4692 : i64
      %4730 = arith.cmpi eq, %4727, %4692 : i64
      %4731 = arith.andi %4729, %4730 : i1
      %4732 = scf.if %4731 -> (i64) {
        scf.yield %4691 : i64
      } else {
        scf.yield %4727 : i64
      }
      %4733 = arith.cmpi ne, %4732, %4692 : i64
      scf.if %4733 {
        func.call @stack_push_pointer(%4732) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4449) : (i64) -> ()
        func.call @stack_push_pointer(%4539) : (i64) -> ()
        func.call @stack_push_pointer(%4636) : (i64) -> ()
        func.call @stack_push_pointer(%4659) : (i64) -> ()
        func.call @stack_push_pointer(%4670) : (i64) -> ()
        func.call @stack_push_pointer(%4671) : (i64) -> ()
        func.call @stack_push_pointer(%4682) : (i64) -> ()
        func.call @stack_push_pointer(%4691) : (i64) -> ()
        %4734 = llvm.mlir.addressof @str332 : !llvm.ptr
        %4735 = func.call @cc_make_function_ref_const(%4734) : (!llvm.ptr) -> i64
        %4736 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4735, %4736) : (i64, i64) -> ()
      }
      %4737 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4737 : i64
    }
    %4738 = func.call @cc_nil_value() : () -> i64
    %4739 = func.call @cc_errorp(%4440) : (i64) -> i64
    %4740 = arith.cmpi ne, %4739, %4738 : i64
    %4741 = scf.if %4740 -> (i64) {
      scf.yield %4440 : i64
    } else {
      %4742 = llvm.mlir.addressof @str333 : !llvm.ptr
      %4743 = arith.constant 27 : i64
      %4744 = func.call @cc_make_string(%4742, %4743) : (!llvm.ptr, i64) -> i64
      %4745 = func.call @cc_nil_value() : () -> i64
      %4746 = func.call @cc_intern(%4744, %4745) : (i64, i64) -> i64
      %4747 = func.call @cc_nil_value() : () -> i64
      %4748 = func.call @cc_cons(%4746, %4747) : (i64, i64) -> i64
      %4749 = func.call @cc_values_pack(%4748) : (i64) -> i64
      func.call @stack_push_pointer(%4746) : (i64) -> ()
      %4750 = func.call @stack_pop_pointer() : () -> i64
      %4751 = llvm.mlir.addressof @str334 : !llvm.ptr
      %4752 = arith.constant 13 : i64
      %4753 = func.call @cc_make_string(%4751, %4752) : (!llvm.ptr, i64) -> i64
      %4754 = llvm.mlir.addressof @str335 : !llvm.ptr
      %4755 = arith.constant 11 : i64
      %4756 = func.call @cc_make_string(%4754, %4755) : (!llvm.ptr, i64) -> i64
      %4757 = func.call @cc_intern(%4753, %4756) : (i64, i64) -> i64
      %4758 = func.call @cc_nil_value() : () -> i64
      %4759 = func.call @cc_cons(%4757, %4758) : (i64, i64) -> i64
      %4760 = func.call @cc_values_pack(%4759) : (i64) -> i64
      func.call @stack_push_pointer(%4757) : (i64) -> ()
      %4761 = llvm.mlir.addressof @str336 : !llvm.ptr
      %4762 = arith.constant 6 : i64
      %4763 = func.call @cc_make_string(%4761, %4762) : (!llvm.ptr, i64) -> i64
      %4764 = func.call @cc_nil_value() : () -> i64
      %4765 = func.call @cc_intern(%4763, %4764) : (i64, i64) -> i64
      %4766 = func.call @cc_nil_value() : () -> i64
      %4767 = func.call @cc_cons(%4765, %4766) : (i64, i64) -> i64
      %4768 = func.call @cc_values_pack(%4767) : (i64) -> i64
      func.call @stack_push_pointer(%4765) : (i64) -> ()
      %4769 = llvm.mlir.addressof @str337 : !llvm.ptr
      %4770 = arith.constant 19 : i64
      %4771 = func.call @cc_make_string(%4769, %4770) : (!llvm.ptr, i64) -> i64
      %4772 = func.call @cc_nil_value() : () -> i64
      %4773 = func.call @cc_intern(%4771, %4772) : (i64, i64) -> i64
      %4774 = func.call @cc_nil_value() : () -> i64
      %4775 = func.call @cc_cons(%4773, %4774) : (i64, i64) -> i64
      %4776 = func.call @cc_values_pack(%4775) : (i64) -> i64
      func.call @stack_push_pointer(%4773) : (i64) -> ()
      %4777 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4778 = arith.constant 20 : i64
      %4779 = func.call @cc_make_string(%4777, %4778) : (!llvm.ptr, i64) -> i64
      %4780 = llvm.mlir.addressof @str339 : !llvm.ptr
      %4781 = arith.constant 3 : i64
      %4782 = func.call @cc_make_string(%4780, %4781) : (!llvm.ptr, i64) -> i64
      %4783 = func.call @cc_intern(%4779, %4782) : (i64, i64) -> i64
      %4784 = func.call @cc_nil_value() : () -> i64
      %4785 = func.call @cc_cons(%4783, %4784) : (i64, i64) -> i64
      %4786 = func.call @cc_values_pack(%4785) : (i64) -> i64
      func.call @stack_push_pointer(%4783) : (i64) -> ()
      %4787 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4788 = arith.constant 2 : i64
      %4789 = func.call @cc_make_string(%4787, %4788) : (!llvm.ptr, i64) -> i64
      %4790 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4791 = arith.constant 11 : i64
      %4792 = func.call @cc_make_string(%4790, %4791) : (!llvm.ptr, i64) -> i64
      %4793 = func.call @cc_intern(%4789, %4792) : (i64, i64) -> i64
      %4794 = func.call @cc_nil_value() : () -> i64
      %4795 = func.call @cc_cons(%4793, %4794) : (i64, i64) -> i64
      %4796 = func.call @cc_values_pack(%4795) : (i64) -> i64
      func.call @stack_push_pointer(%4793) : (i64) -> ()
      %4797 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4798 = arith.constant 20 : i64
      %4799 = func.call @cc_make_string(%4797, %4798) : (!llvm.ptr, i64) -> i64
      %4800 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4801 = arith.constant 11 : i64
      %4802 = func.call @cc_make_string(%4800, %4801) : (!llvm.ptr, i64) -> i64
      %4803 = func.call @cc_intern(%4799, %4802) : (i64, i64) -> i64
      %4804 = func.call @cc_nil_value() : () -> i64
      %4805 = func.call @cc_cons(%4803, %4804) : (i64, i64) -> i64
      %4806 = func.call @cc_values_pack(%4805) : (i64) -> i64
      func.call @stack_push_pointer(%4803) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4807 = func.call @stack_pop_pointer() : () -> i64
      %4808 = func.call @stack_pop_pointer() : () -> i64
      %4809 = func.call @cc_cons(%4808, %4807) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4809) : (i64) -> ()
      %4810 = func.call @stack_pop_pointer() : () -> i64
      %4811 = func.call @stack_pop_pointer() : () -> i64
      %4812 = func.call @cc_cons(%4811, %4810) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4812) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4813 = func.call @stack_pop_pointer() : () -> i64
      %4814 = func.call @stack_pop_pointer() : () -> i64
      %4815 = func.call @cc_cons(%4814, %4813) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4815) : (i64) -> ()
      %4816 = func.call @stack_pop_pointer() : () -> i64
      %4817 = func.call @stack_pop_pointer() : () -> i64
      %4818 = func.call @cc_cons(%4817, %4816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4818) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4819 = func.call @stack_pop_pointer() : () -> i64
      %4820 = func.call @stack_pop_pointer() : () -> i64
      %4821 = func.call @cc_cons(%4820, %4819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4821) : (i64) -> ()
      %4822 = func.call @stack_pop_pointer() : () -> i64
      %4823 = func.call @stack_pop_pointer() : () -> i64
      %4824 = func.call @cc_cons(%4823, %4822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4824) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4825 = func.call @stack_pop_pointer() : () -> i64
      %4826 = func.call @stack_pop_pointer() : () -> i64
      %4827 = func.call @cc_cons(%4826, %4825) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4827) : (i64) -> ()
      %4828 = func.call @stack_pop_pointer() : () -> i64
      %4829 = func.call @stack_pop_pointer() : () -> i64
      %4830 = func.call @cc_cons(%4829, %4828) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4830) : (i64) -> ()
      %4831 = func.call @stack_pop_pointer() : () -> i64
      %4832 = func.call @stack_pop_pointer() : () -> i64
      %4833 = func.call @cc_cons(%4832, %4831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4833) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4834 = func.call @stack_pop_pointer() : () -> i64
      %4835 = func.call @stack_pop_pointer() : () -> i64
      %4836 = func.call @cc_cons(%4835, %4834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4836) : (i64) -> ()
      %4837 = func.call @stack_pop_pointer() : () -> i64
      %4838 = func.call @stack_pop_pointer() : () -> i64
      %4839 = func.call @cc_cons(%4838, %4837) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4839) : (i64) -> ()
      %4840 = func.call @stack_pop_pointer() : () -> i64
      %4934 = arith.constant 162741310455822 : i64
      %4935 = arith.constant 0 : i64
      %4936 = func.call @cc_make_closure(%4934, %4935) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4936) : (i64) -> ()
      %4937 = func.call @stack_pop_pointer() : () -> i64
      %4938 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4939 = arith.constant 4 : i64
      %4940 = func.call @cc_make_string(%4938, %4939) : (!llvm.ptr, i64) -> i64
      %4941 = func.call @cc_nil_value() : () -> i64
      %4942 = func.call @cc_intern(%4940, %4941) : (i64, i64) -> i64
      %4943 = func.call @cc_nil_value() : () -> i64
      %4944 = func.call @cc_cons(%4942, %4943) : (i64, i64) -> i64
      %4945 = func.call @cc_values_pack(%4944) : (i64) -> i64
      func.call @stack_push_pointer(%4942) : (i64) -> ()
      %4946 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4947 = arith.constant 5 : i64
      %4948 = func.call @cc_make_string(%4946, %4947) : (!llvm.ptr, i64) -> i64
      %4949 = func.call @cc_nil_value() : () -> i64
      %4950 = func.call @cc_intern(%4948, %4949) : (i64, i64) -> i64
      %4951 = func.call @cc_nil_value() : () -> i64
      %4952 = func.call @cc_cons(%4950, %4951) : (i64, i64) -> i64
      %4953 = func.call @cc_values_pack(%4952) : (i64) -> i64
      func.call @stack_push_pointer(%4950) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4954 = func.call @stack_pop_pointer() : () -> i64
      %4955 = func.call @stack_pop_pointer() : () -> i64
      %4956 = func.call @cc_cons(%4955, %4954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4956) : (i64) -> ()
      %4957 = func.call @stack_pop_pointer() : () -> i64
      %4958 = func.call @stack_pop_pointer() : () -> i64
      %4959 = func.call @cc_cons(%4958, %4957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4959) : (i64) -> ()
      %4960 = func.call @stack_pop_pointer() : () -> i64
      %4961 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4962 = arith.constant 11 : i64
      %4963 = func.call @cc_make_string(%4961, %4962) : (!llvm.ptr, i64) -> i64
      %4964 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4965 = arith.constant 7 : i64
      %4966 = func.call @cc_make_string(%4964, %4965) : (!llvm.ptr, i64) -> i64
      %4967 = func.call @cc_intern(%4963, %4966) : (i64, i64) -> i64
      %4968 = func.call @cc_nil_value() : () -> i64
      %4969 = func.call @cc_cons(%4967, %4968) : (i64, i64) -> i64
      %4970 = func.call @cc_values_pack(%4969) : (i64) -> i64
      func.call @stack_push_pointer(%4967) : (i64) -> ()
      %4971 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4972 = func.call @stack_pop_pointer() : () -> i64
      %4973 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4974 = arith.constant 4 : i64
      %4975 = func.call @cc_make_string(%4973, %4974) : (!llvm.ptr, i64) -> i64
      %4976 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4977 = arith.constant 7 : i64
      %4978 = func.call @cc_make_string(%4976, %4977) : (!llvm.ptr, i64) -> i64
      %4979 = func.call @cc_intern(%4975, %4978) : (i64, i64) -> i64
      %4980 = func.call @cc_nil_value() : () -> i64
      %4981 = func.call @cc_cons(%4979, %4980) : (i64, i64) -> i64
      %4982 = func.call @cc_values_pack(%4981) : (i64) -> i64
      func.call @stack_push_pointer(%4979) : (i64) -> ()
      %4983 = func.call @stack_pop_pointer() : () -> i64
      %4984 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4985 = arith.constant 5 : i64
      %4986 = func.call @cc_make_string(%4984, %4985) : (!llvm.ptr, i64) -> i64
      %4987 = func.call @cc_nil_value() : () -> i64
      %4988 = func.call @cc_intern(%4986, %4987) : (i64, i64) -> i64
      %4989 = func.call @cc_nil_value() : () -> i64
      %4990 = func.call @cc_cons(%4988, %4989) : (i64, i64) -> i64
      %4991 = func.call @cc_values_pack(%4990) : (i64) -> i64
      func.call @stack_push_pointer(%4988) : (i64) -> ()
      %4992 = func.call @stack_pop_pointer() : () -> i64
      %4993 = func.call @cc_nil_value() : () -> i64
      %4994 = func.call @cc_errorp(%4750) : (i64) -> i64
      %4995 = arith.cmpi ne, %4994, %4993 : i64
      %4996 = arith.cmpi eq, %4993, %4993 : i64
      %4997 = arith.andi %4995, %4996 : i1
      %4998 = scf.if %4997 -> (i64) {
        scf.yield %4750 : i64
      } else {
        scf.yield %4993 : i64
      }
      %4999 = func.call @cc_errorp(%4840) : (i64) -> i64
      %5000 = arith.cmpi ne, %4999, %4993 : i64
      %5001 = arith.cmpi eq, %4998, %4993 : i64
      %5002 = arith.andi %5000, %5001 : i1
      %5003 = scf.if %5002 -> (i64) {
        scf.yield %4840 : i64
      } else {
        scf.yield %4998 : i64
      }
      %5004 = func.call @cc_errorp(%4937) : (i64) -> i64
      %5005 = arith.cmpi ne, %5004, %4993 : i64
      %5006 = arith.cmpi eq, %5003, %4993 : i64
      %5007 = arith.andi %5005, %5006 : i1
      %5008 = scf.if %5007 -> (i64) {
        scf.yield %4937 : i64
      } else {
        scf.yield %5003 : i64
      }
      %5009 = func.call @cc_errorp(%4960) : (i64) -> i64
      %5010 = arith.cmpi ne, %5009, %4993 : i64
      %5011 = arith.cmpi eq, %5008, %4993 : i64
      %5012 = arith.andi %5010, %5011 : i1
      %5013 = scf.if %5012 -> (i64) {
        scf.yield %4960 : i64
      } else {
        scf.yield %5008 : i64
      }
      %5014 = func.call @cc_errorp(%4971) : (i64) -> i64
      %5015 = arith.cmpi ne, %5014, %4993 : i64
      %5016 = arith.cmpi eq, %5013, %4993 : i64
      %5017 = arith.andi %5015, %5016 : i1
      %5018 = scf.if %5017 -> (i64) {
        scf.yield %4971 : i64
      } else {
        scf.yield %5013 : i64
      }
      %5019 = func.call @cc_errorp(%4972) : (i64) -> i64
      %5020 = arith.cmpi ne, %5019, %4993 : i64
      %5021 = arith.cmpi eq, %5018, %4993 : i64
      %5022 = arith.andi %5020, %5021 : i1
      %5023 = scf.if %5022 -> (i64) {
        scf.yield %4972 : i64
      } else {
        scf.yield %5018 : i64
      }
      %5024 = func.call @cc_errorp(%4983) : (i64) -> i64
      %5025 = arith.cmpi ne, %5024, %4993 : i64
      %5026 = arith.cmpi eq, %5023, %4993 : i64
      %5027 = arith.andi %5025, %5026 : i1
      %5028 = scf.if %5027 -> (i64) {
        scf.yield %4983 : i64
      } else {
        scf.yield %5023 : i64
      }
      %5029 = func.call @cc_errorp(%4992) : (i64) -> i64
      %5030 = arith.cmpi ne, %5029, %4993 : i64
      %5031 = arith.cmpi eq, %5028, %4993 : i64
      %5032 = arith.andi %5030, %5031 : i1
      %5033 = scf.if %5032 -> (i64) {
        scf.yield %4992 : i64
      } else {
        scf.yield %5028 : i64
      }
      %5034 = arith.cmpi ne, %5033, %4993 : i64
      scf.if %5034 {
        func.call @stack_push_pointer(%5033) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4750) : (i64) -> ()
        func.call @stack_push_pointer(%4840) : (i64) -> ()
        func.call @stack_push_pointer(%4937) : (i64) -> ()
        func.call @stack_push_pointer(%4960) : (i64) -> ()
        func.call @stack_push_pointer(%4971) : (i64) -> ()
        func.call @stack_push_pointer(%4972) : (i64) -> ()
        func.call @stack_push_pointer(%4983) : (i64) -> ()
        func.call @stack_push_pointer(%4992) : (i64) -> ()
        %5035 = llvm.mlir.addressof @str354 : !llvm.ptr
        %5036 = func.call @cc_make_function_ref_const(%5035) : (!llvm.ptr) -> i64
        %5037 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5036, %5037) : (i64, i64) -> ()
      }
      %5038 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5038 : i64
    }
    func.call @stack_push_pointer(%4741) : (i64) -> ()
    %5039 = func.call @stack_pop_pointer() : () -> i64
    %5040 = func.call @cc_multiple_value_list(%5039) : (i64) -> i64
    %5041 = llvm.mlir.addressof @str355 : !llvm.ptr
    %5042 = arith.constant 38 : i64
    %5043 = func.call @cc_make_string(%5041, %5042) : (!llvm.ptr, i64) -> i64
    %5044 = func.call @cc_nil_value() : () -> i64
    %5045 = func.call @cc_intern(%5043, %5044) : (i64, i64) -> i64
    %5046 = func.call @cc_nil_value() : () -> i64
    %5047 = func.call @cc_cons(%5045, %5046) : (i64, i64) -> i64
    %5048 = func.call @cc_values_pack(%5047) : (i64) -> i64
    %5049 = func.call @cc_symbol_value(%5045) : (i64) -> i64
    %5050 = llvm.mlir.addressof @str356 : !llvm.ptr
    %5051 = arith.constant 40 : i64
    %5052 = func.call @cc_make_string(%5050, %5051) : (!llvm.ptr, i64) -> i64
    %5053 = func.call @cc_nil_value() : () -> i64
    %5054 = func.call @cc_intern(%5052, %5053) : (i64, i64) -> i64
    %5055 = func.call @cc_nil_value() : () -> i64
    %5056 = func.call @cc_cons(%5054, %5055) : (i64, i64) -> i64
    %5057 = func.call @cc_values_pack(%5056) : (i64) -> i64
    %5058 = func.call @cc_symbol_value(%5054) : (i64) -> i64
    %5059 = func.call @cc_nil_value() : () -> i64
    %5060 = arith.cmpi ne, %5049, %5059 : i64
    %5061 = scf.if %5060 -> (i64) {
      scf.yield %5058 : i64
    } else {
      scf.yield %5040 : i64
    }
    %5062 = func.call @cc_values_pack(%5061) : (i64) -> i64
    func.call @stack_push_pointer(%5062) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_162741310455809"() {
    %762 = func.call @cc_nil_value() : () -> i64
    %763 = func.call @cc_nil_value() : () -> i64
    %764 = func.call @cc_errorp(%762) : (i64) -> i64
    %765 = arith.cmpi ne, %764, %763 : i64
    %766 = scf.if %765 -> (i64) {
      scf.yield %762 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %767 = func.call @stack_pop_pointer() : () -> i64
      %768 = llvm.mlir.addressof @str63 : !llvm.ptr
      %769 = arith.constant 26 : i64
      %770 = func.call @cc_make_string(%768, %769) : (!llvm.ptr, i64) -> i64
      %771 = llvm.mlir.addressof @str64 : !llvm.ptr
      %772 = arith.constant 11 : i64
      %773 = func.call @cc_make_string(%771, %772) : (!llvm.ptr, i64) -> i64
      %774 = func.call @cc_intern(%770, %773) : (i64, i64) -> i64
      %775 = func.call @cc_nil_value() : () -> i64
      %776 = func.call @cc_cons(%774, %775) : (i64, i64) -> i64
      %777 = func.call @cc_values_pack(%776) : (i64) -> i64
      %778 = func.call @cc_symbol_value(%774) : (i64) -> i64
      func.call @stack_push_pointer(%778) : (i64) -> ()
      %779 = func.call @stack_pop_pointer() : () -> i64
      %780 = arith.constant -3.0 : f64
      %781 = func.call @cc_box_single_float(%780) : (f64) -> i64
      func.call @stack_push_pointer(%781) : (i64) -> ()
      %782 = func.call @stack_pop_pointer() : () -> i64
      %783 = arith.constant 0.0 : f64
      %784 = func.call @cc_box_single_float(%783) : (f64) -> i64
      func.call @stack_push_pointer(%784) : (i64) -> ()
      %785 = func.call @stack_pop_pointer() : () -> i64
      %786 = arith.constant 3.0 : f64
      %787 = func.call @cc_box_single_float(%786) : (f64) -> i64
      func.call @stack_push_pointer(%787) : (i64) -> ()
      %788 = func.call @stack_pop_pointer() : () -> i64
      %789 = llvm.mlir.addressof @str65 : !llvm.ptr
      %790 = arith.constant 26 : i64
      %791 = func.call @cc_make_string(%789, %790) : (!llvm.ptr, i64) -> i64
      %792 = llvm.mlir.addressof @str66 : !llvm.ptr
      %793 = arith.constant 11 : i64
      %794 = func.call @cc_make_string(%792, %793) : (!llvm.ptr, i64) -> i64
      %795 = func.call @cc_intern(%791, %794) : (i64, i64) -> i64
      %796 = func.call @cc_nil_value() : () -> i64
      %797 = func.call @cc_cons(%795, %796) : (i64, i64) -> i64
      %798 = func.call @cc_values_pack(%797) : (i64) -> i64
      %799 = func.call @cc_symbol_value(%795) : (i64) -> i64
      func.call @stack_push_pointer(%799) : (i64) -> ()
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = func.call @cc_nil_value() : () -> i64
      %802 = func.call @cc_errorp(%779) : (i64) -> i64
      %803 = arith.cmpi ne, %802, %801 : i64
      %804 = arith.cmpi eq, %801, %801 : i64
      %805 = arith.andi %803, %804 : i1
      %806 = scf.if %805 -> (i64) {
        scf.yield %779 : i64
      } else {
        scf.yield %801 : i64
      }
      %807 = func.call @cc_errorp(%782) : (i64) -> i64
      %808 = arith.cmpi ne, %807, %801 : i64
      %809 = arith.cmpi eq, %806, %801 : i64
      %810 = arith.andi %808, %809 : i1
      %811 = scf.if %810 -> (i64) {
        scf.yield %782 : i64
      } else {
        scf.yield %806 : i64
      }
      %812 = func.call @cc_errorp(%785) : (i64) -> i64
      %813 = arith.cmpi ne, %812, %801 : i64
      %814 = arith.cmpi eq, %811, %801 : i64
      %815 = arith.andi %813, %814 : i1
      %816 = scf.if %815 -> (i64) {
        scf.yield %785 : i64
      } else {
        scf.yield %811 : i64
      }
      %817 = func.call @cc_errorp(%788) : (i64) -> i64
      %818 = arith.cmpi ne, %817, %801 : i64
      %819 = arith.cmpi eq, %816, %801 : i64
      %820 = arith.andi %818, %819 : i1
      %821 = scf.if %820 -> (i64) {
        scf.yield %788 : i64
      } else {
        scf.yield %816 : i64
      }
      %822 = func.call @cc_errorp(%800) : (i64) -> i64
      %823 = arith.cmpi ne, %822, %801 : i64
      %824 = arith.cmpi eq, %821, %801 : i64
      %825 = arith.andi %823, %824 : i1
      %826 = scf.if %825 -> (i64) {
        scf.yield %800 : i64
      } else {
        scf.yield %821 : i64
      }
      %827 = arith.cmpi ne, %826, %801 : i64
      scf.if %827 {
        func.call @stack_push_pointer(%826) : (i64) -> ()
      } else {
        %828 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%828) : (i64) -> ()
        func.call @stack_push_pointer(%800) : (i64) -> ()
        %829 = func.call @stack_pop_pointer() : () -> i64
        %830 = func.call @stack_pop_pointer() : () -> i64
        %831 = func.call @cc_cons(%829, %830) : (i64, i64) -> i64
        func.call @stack_push_pointer(%831) : (i64) -> ()
        func.call @stack_push_pointer(%788) : (i64) -> ()
        %832 = func.call @stack_pop_pointer() : () -> i64
        %833 = func.call @stack_pop_pointer() : () -> i64
        %834 = func.call @cc_cons(%832, %833) : (i64, i64) -> i64
        func.call @stack_push_pointer(%834) : (i64) -> ()
        func.call @stack_push_pointer(%785) : (i64) -> ()
        %835 = func.call @stack_pop_pointer() : () -> i64
        %836 = func.call @stack_pop_pointer() : () -> i64
        %837 = func.call @cc_cons(%835, %836) : (i64, i64) -> i64
        func.call @stack_push_pointer(%837) : (i64) -> ()
        func.call @stack_push_pointer(%782) : (i64) -> ()
        %838 = func.call @stack_pop_pointer() : () -> i64
        %839 = func.call @stack_pop_pointer() : () -> i64
        %840 = func.call @cc_cons(%838, %839) : (i64, i64) -> i64
        func.call @stack_push_pointer(%840) : (i64) -> ()
        func.call @stack_push_pointer(%779) : (i64) -> ()
        %841 = func.call @stack_pop_pointer() : () -> i64
        %842 = func.call @stack_pop_pointer() : () -> i64
        %843 = func.call @cc_cons(%841, %842) : (i64, i64) -> i64
        func.call @stack_push_pointer(%843) : (i64) -> ()
      }
      %844 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %845 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = func.call @cc_nil_value() : () -> i64
      %848 = func.call @cc_nil_value() : () -> i64
      %849 = func.call @cc_errorp(%847) : (i64) -> i64
      %850 = arith.cmpi ne, %849, %848 : i64
      %851:5 = scf.if %850 -> (i64, i64, i64, i64, i64) {
        scf.yield %847, %844, %846, %767, %845 : i64, i64, i64, i64, i64
      } else {
        %852 = func.call @cc_nil_value() : () -> i64
        %853 = llvm.mlir.addressof @str67 : !llvm.ptr
        %854 = arith.constant 38 : i64
        %855 = func.call @cc_make_string(%853, %854) : (!llvm.ptr, i64) -> i64
        %856 = func.call @cc_nil_value() : () -> i64
        %857 = func.call @cc_intern(%855, %856) : (i64, i64) -> i64
        %858 = func.call @cc_nil_value() : () -> i64
        %859 = func.call @cc_cons(%857, %858) : (i64, i64) -> i64
        %860 = func.call @cc_values_pack(%859) : (i64) -> i64
        %861 = func.call @cc_set_symbol_value(%857, %852) : (i64, i64) -> i64
        %862 = llvm.mlir.addressof @str68 : !llvm.ptr
        %863 = arith.constant 39 : i64
        %864 = func.call @cc_make_string(%862, %863) : (!llvm.ptr, i64) -> i64
        %865 = func.call @cc_nil_value() : () -> i64
        %866 = func.call @cc_intern(%864, %865) : (i64, i64) -> i64
        %867 = func.call @cc_nil_value() : () -> i64
        %868 = func.call @cc_cons(%866, %867) : (i64, i64) -> i64
        %869 = func.call @cc_values_pack(%868) : (i64) -> i64
        %870 = func.call @cc_set_symbol_value(%866, %852) : (i64, i64) -> i64
        %871 = llvm.mlir.addressof @str69 : !llvm.ptr
        %872 = arith.constant 40 : i64
        %873 = func.call @cc_make_string(%871, %872) : (!llvm.ptr, i64) -> i64
        %874 = func.call @cc_nil_value() : () -> i64
        %875 = func.call @cc_intern(%873, %874) : (i64, i64) -> i64
        %876 = func.call @cc_nil_value() : () -> i64
        %877 = func.call @cc_cons(%875, %876) : (i64, i64) -> i64
        %878 = func.call @cc_values_pack(%877) : (i64) -> i64
        %879 = func.call @cc_set_symbol_value(%875, %852) : (i64, i64) -> i64
        %880:4 = scf.while (%arg0 = %767, %arg1 = %845, %arg2 = %846, %arg3 = %844) : (i64, i64, i64, i64) -> (i64, i64, i64, i64) {
          func.call @stack_push_pointer(%arg3) : (i64) -> ()
          %881 = func.call @stack_pop_pointer() : () -> i64
          %882 = func.call @cc_nil_value() : () -> i64
          %883 = arith.cmpi ne, %881, %882 : i64
          %884 = func.call @cc_nil_value() : () -> i64
          %885 = llvm.mlir.addressof @str70 : !llvm.ptr
          %886 = arith.constant 38 : i64
          %887 = func.call @cc_make_string(%885, %886) : (!llvm.ptr, i64) -> i64
          %888 = func.call @cc_nil_value() : () -> i64
          %889 = func.call @cc_intern(%887, %888) : (i64, i64) -> i64
          %890 = func.call @cc_nil_value() : () -> i64
          %891 = func.call @cc_cons(%889, %890) : (i64, i64) -> i64
          %892 = func.call @cc_values_pack(%891) : (i64) -> i64
          %893 = func.call @cc_symbol_value(%889) : (i64) -> i64
          %894 = arith.cmpi ne, %893, %884 : i64
          %895 = llvm.mlir.addressof @str71 : !llvm.ptr
          %896 = arith.constant 38 : i64
          %897 = func.call @cc_make_string(%895, %896) : (!llvm.ptr, i64) -> i64
          %898 = func.call @cc_nil_value() : () -> i64
          %899 = func.call @cc_intern(%897, %898) : (i64, i64) -> i64
          %900 = func.call @cc_nil_value() : () -> i64
          %901 = func.call @cc_cons(%899, %900) : (i64, i64) -> i64
          %902 = func.call @cc_values_pack(%901) : (i64) -> i64
          %903 = func.call @cc_symbol_value(%899) : (i64) -> i64
          %904 = arith.cmpi ne, %903, %884 : i64
          %905 = arith.ori %894, %904 : i1
          %906 = arith.constant 0 : i1
          %907 = arith.cmpi eq, %905, %906 : i1
          %908 = arith.andi %883, %907 : i1
          scf.condition(%908) %arg0, %arg1, %arg2, %arg3 : i64, i64, i64, i64
        } do {
          ^bb0(%909: i64, %910: i64, %911: i64, %912: i64):
          %913 = func.call @cc_nil_value() : () -> i64
          %914 = func.call @cc_nil_value() : () -> i64
          %915 = func.call @cc_errorp(%913) : (i64) -> i64
          %916 = arith.cmpi ne, %915, %914 : i64
          %917:4 = scf.if %916 -> (i64, i64, i64, i64) {
            scf.yield %913, %911, %909, %910 : i64, i64, i64, i64
          } else {
            %918 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%912) : (i64) -> ()
            %919 = func.call @stack_pop_pointer() : () -> i64
            %920 = func.call @cc_nil_value() : () -> i64
            %921 = arith.cmpi eq, %919, %920 : i64
            %923 = func.call @cc_t_value() : () -> i64
            %922 = arith.select %921, %923, %920 : i64
            func.call @stack_push_pointer(%922) : (i64) -> ()
            %924 = func.call @stack_pop_pointer() : () -> i64
            %925 = func.call @cc_nil_value() : () -> i64
            %926 = func.call @cc_cons(%924, %925) : (i64, i64) -> i64
            %927 = func.call @cc_not(%926) : (i64) -> i64
            func.call @stack_push_pointer(%927) : (i64) -> ()
            %928 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%912) : (i64) -> ()
            %929 = func.call @stack_pop_pointer() : () -> i64
            %930 = func.call @cc_is_cons(%929) : (i64) -> i32
            %931 = arith.constant 0 : i32
            %932 = arith.cmpi ne, %930, %931 : i32
            %933 = func.call @cc_t_value() : () -> i64
            %934 = func.call @cc_nil_value() : () -> i64
            %935 = arith.select %932, %933, %934 : i64
            func.call @stack_push_pointer(%935) : (i64) -> ()
            %936 = func.call @stack_pop_pointer() : () -> i64
            %937 = func.call @cc_nil_value() : () -> i64
            %938 = func.call @cc_cons(%936, %937) : (i64, i64) -> i64
            %939 = func.call @cc_not(%938) : (i64) -> i64
            func.call @stack_push_pointer(%939) : (i64) -> ()
            %940 = func.call @stack_pop_pointer() : () -> i64
            %941 = func.call @cc_cons(%940, %918) : (i64, i64) -> i64
            %942 = func.call @cc_cons(%928, %941) : (i64, i64) -> i64
            %943 = func.call @cc_and(%942) : (i64) -> i64
            func.call @stack_push_pointer(%943) : (i64) -> ()
            %944 = func.call @stack_pop_pointer() : () -> i64
            %945 = func.call @cc_nil_value() : () -> i64
            %946 = arith.cmpi ne, %944, %945 : i64
            scf.if %946 {
              %947 = llvm.mlir.addressof @str72 : !llvm.ptr
              %948 = arith.constant 10 : i64
              %949 = func.call @cc_make_string(%947, %948) : (!llvm.ptr, i64) -> i64
              %950 = func.call @cc_nil_value() : () -> i64
              %951 = func.call @cc_intern(%949, %950) : (i64, i64) -> i64
              %952 = func.call @cc_nil_value() : () -> i64
              %953 = func.call @cc_cons(%951, %952) : (i64, i64) -> i64
              %954 = func.call @cc_values_pack(%953) : (i64) -> i64
              func.call @stack_push_pointer(%951) : (i64) -> ()
              %955 = func.call @stack_pop_pointer() : () -> i64
              %956 = func.call @cc_nil_value() : () -> i64
              %957 = func.call @cc_errorp(%955) : (i64) -> i64
              %958 = arith.cmpi ne, %957, %956 : i64
              %959 = arith.cmpi eq, %956, %956 : i64
              %960 = arith.andi %958, %959 : i1
              %961 = scf.if %960 -> (i64) {
                scf.yield %955 : i64
              } else {
                scf.yield %956 : i64
              }
              %962 = arith.cmpi ne, %961, %956 : i64
              scf.if %962 {
                func.call @stack_push_pointer(%961) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%955) : (i64) -> ()
                %963 = llvm.mlir.addressof @str73 : !llvm.ptr
                %964 = func.call @cc_make_function_ref_const(%963) : (!llvm.ptr) -> i64
                %965 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%964, %965) : (i64, i64) -> ()
              }
              %966 = func.call @stack_pop_pointer() : () -> i64
              %967 = func.call @cc_multiple_value_list(%966) : (i64) -> i64
              %968 = func.call @cc_t_value() : () -> i64
              %969 = llvm.mlir.addressof @str74 : !llvm.ptr
              %970 = arith.constant 38 : i64
              %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
              %972 = func.call @cc_nil_value() : () -> i64
              %973 = func.call @cc_intern(%971, %972) : (i64, i64) -> i64
              %974 = func.call @cc_nil_value() : () -> i64
              %975 = func.call @cc_cons(%973, %974) : (i64, i64) -> i64
              %976 = func.call @cc_values_pack(%975) : (i64) -> i64
              %977 = func.call @cc_set_symbol_value(%973, %968) : (i64, i64) -> i64
              %978 = llvm.mlir.addressof @str75 : !llvm.ptr
              %979 = arith.constant 39 : i64
              %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
              %981 = func.call @cc_nil_value() : () -> i64
              %982 = func.call @cc_intern(%980, %981) : (i64, i64) -> i64
              %983 = func.call @cc_nil_value() : () -> i64
              %984 = func.call @cc_cons(%982, %983) : (i64, i64) -> i64
              %985 = func.call @cc_values_pack(%984) : (i64) -> i64
              %986 = func.call @cc_set_symbol_value(%982, %966) : (i64, i64) -> i64
              %987 = llvm.mlir.addressof @str76 : !llvm.ptr
              %988 = arith.constant 40 : i64
              %989 = func.call @cc_make_string(%987, %988) : (!llvm.ptr, i64) -> i64
              %990 = func.call @cc_nil_value() : () -> i64
              %991 = func.call @cc_intern(%989, %990) : (i64, i64) -> i64
              %992 = func.call @cc_nil_value() : () -> i64
              %993 = func.call @cc_cons(%991, %992) : (i64, i64) -> i64
              %994 = func.call @cc_values_pack(%993) : (i64) -> i64
              %995 = func.call @cc_set_symbol_value(%991, %967) : (i64, i64) -> i64
              func.call @stack_push_pointer(%966) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %996 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %996, %911, %909, %910 : i64, i64, i64, i64
          }
          %997 = func.call @cc_nil_value() : () -> i64
          %998 = func.call @cc_errorp(%917#0) : (i64) -> i64
          %999 = arith.cmpi ne, %998, %997 : i64
          %1000:4 = scf.if %999 -> (i64, i64, i64, i64) {
            scf.yield %917#0, %917#1, %917#2, %917#3 : i64, i64, i64, i64
          } else {
            func.call @stack_push_pointer(%912) : (i64) -> ()
            %1001 = func.call @stack_pop_pointer() : () -> i64
            %1002 = func.call @cc_car(%1001) : (i64) -> i64
            func.call @stack_push_pointer(%1002) : (i64) -> ()
            %1003 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1003) : (i64) -> ()
            %1004 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1004, %917#1, %1003, %917#3 : i64, i64, i64, i64
          }
          %1005 = func.call @cc_nil_value() : () -> i64
          %1006 = func.call @cc_errorp(%1000#0) : (i64) -> i64
          %1007 = arith.cmpi ne, %1006, %1005 : i64
          %1008:4 = scf.if %1007 -> (i64, i64, i64, i64) {
            scf.yield %1000#0, %1000#1, %1000#2, %1000#3 : i64, i64, i64, i64
          } else {
            func.call @stack_push_pointer(%1000#2) : (i64) -> ()
            %1009 = func.call @stack_pop_pointer() : () -> i64
            %1010 = func.call @cc_nil_value() : () -> i64
            %1011 = func.call @cc_errorp(%1009) : (i64) -> i64
            %1012 = arith.cmpi ne, %1011, %1010 : i64
            %1013 = arith.cmpi eq, %1010, %1010 : i64
            %1014 = arith.andi %1012, %1013 : i1
            %1015 = scf.if %1014 -> (i64) {
              scf.yield %1009 : i64
            } else {
              scf.yield %1010 : i64
            }
            %1016 = arith.cmpi ne, %1015, %1010 : i64
            scf.if %1016 {
              func.call @stack_push_pointer(%1015) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1009) : (i64) -> ()
              %1017 = llvm.mlir.addressof @str77 : !llvm.ptr
              %1018 = func.call @cc_make_function_ref_const(%1017) : (!llvm.ptr) -> i64
              %1019 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1018, %1019) : (i64, i64) -> ()
            }
            %1020 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1020) : (i64) -> ()
            %1021 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1021, %1000#1, %1000#2, %1020 : i64, i64, i64, i64
          }
          %1022 = func.call @cc_nil_value() : () -> i64
          %1023 = func.call @cc_errorp(%1008#0) : (i64) -> i64
          %1024 = arith.cmpi ne, %1023, %1022 : i64
          %1025:4 = scf.if %1024 -> (i64, i64, i64, i64) {
            scf.yield %1008#0, %1008#1, %1008#2, %1008#3 : i64, i64, i64, i64
          } else {
            func.call @stack_push_pointer(%1008#2) : (i64) -> ()
            %1026 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1008#3) : (i64) -> ()
            %1027 = func.call @stack_pop_pointer() : () -> i64
            %1028 = func.call @cc_nil_value() : () -> i64
            %1029 = func.call @cc_errorp(%1027) : (i64) -> i64
            %1030 = arith.cmpi ne, %1029, %1028 : i64
            %1031 = arith.cmpi eq, %1028, %1028 : i64
            %1032 = arith.andi %1030, %1031 : i1
            %1033 = scf.if %1032 -> (i64) {
              scf.yield %1027 : i64
            } else {
              scf.yield %1028 : i64
            }
            %1034 = arith.cmpi ne, %1033, %1028 : i64
            scf.if %1034 {
              func.call @stack_push_pointer(%1033) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1027) : (i64) -> ()
              %1035 = llvm.mlir.addressof @str78 : !llvm.ptr
              %1036 = func.call @cc_make_function_ref_const(%1035) : (!llvm.ptr) -> i64
              %1037 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1036, %1037) : (i64, i64) -> ()
            }
            %1038 = func.call @stack_pop_pointer() : () -> i64
            %1039 = arith.constant 1 : i1
            %1041 = arith.constant 3 : i64
            %1040 = arith.andi %1026, %1041 : i64
            %1042 = arith.constant 0 : i64
            %1043 = arith.cmpi eq, %1040, %1042 : i64
            %1045 = arith.constant 3 : i64
            %1044 = arith.andi %1038, %1045 : i64
            %1046 = arith.constant 0 : i64
            %1047 = arith.cmpi eq, %1044, %1046 : i64
            %1048 = arith.andi %1043, %1047 : i1
            %1049 = scf.if %1048 -> (i1) {
              %1050 = arith.constant 2 : i64
              %1051 = arith.shrsi %1026, %1050 : i64
              %1052 = arith.constant 2 : i64
              %1053 = arith.shrsi %1038, %1052 : i64
              %1054 = arith.cmpi eq, %1051, %1053 : i64
              scf.yield %1054 : i1
            } else {
              %1055 = func.call @cc_eq(%1026, %1038) : (i64, i64) -> i64
              %1056 = func.call @cc_nil_value() : () -> i64
              %1057 = arith.cmpi ne, %1055, %1056 : i64
              scf.yield %1057 : i1
            }
            %1058 = arith.andi %1039, %1049 : i1
            %1059 = func.call @cc_nil_value() : () -> i64
            %1060 = func.call @cc_t_value() : () -> i64
            %1061 = scf.if %1058 -> (i64) {
              scf.yield %1060 : i64
            } else {
              scf.yield %1059 : i64
            }
            func.call @stack_push_pointer(%1061) : (i64) -> ()
            %1062 = func.call @stack_pop_pointer() : () -> i64
            %1063 = func.call @cc_nil_value() : () -> i64
            %1064 = func.call @cc_cons(%1062, %1063) : (i64, i64) -> i64
            %1065 = func.call @cc_not(%1064) : (i64) -> i64
            func.call @stack_push_pointer(%1065) : (i64) -> ()
            %1066 = func.call @stack_pop_pointer() : () -> i64
            %1067 = func.call @cc_nil_value() : () -> i64
            %1068 = arith.cmpi ne, %1066, %1067 : i64
            %1069:2 = scf.if %1068 -> (i64, i64) {
              %1070 = func.call @cc_nil_value() : () -> i64
              %1071 = func.call @cc_nil_value() : () -> i64
              %1072 = func.call @cc_errorp(%1070) : (i64) -> i64
              %1073 = arith.cmpi ne, %1072, %1071 : i64
              %1074:2 = scf.if %1073 -> (i64, i64) {
                scf.yield %1070, %1008#1 : i64, i64
              } else {
                func.call @stack_push_pointer(%1008#1) : (i64) -> ()
                func.call @stack_push_pointer(%1008#2) : (i64) -> ()
                %1075 = func.call @stack_pop_pointer() : () -> i64
                %1076 = func.call @cc_nil_value() : () -> i64
                %1077 = func.call @cc_errorp(%1075) : (i64) -> i64
                %1078 = arith.cmpi ne, %1077, %1076 : i64
                %1079 = arith.cmpi eq, %1076, %1076 : i64
                %1080 = arith.andi %1078, %1079 : i1
                %1081 = scf.if %1080 -> (i64) {
                  scf.yield %1075 : i64
                } else {
                  scf.yield %1076 : i64
                }
                %1082 = arith.cmpi ne, %1081, %1076 : i64
                scf.if %1082 {
                  func.call @stack_push_pointer(%1081) : (i64) -> ()
                } else {
                  %1083 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%1083) : (i64) -> ()
                  func.call @stack_push_pointer(%1075) : (i64) -> ()
                  %1084 = func.call @stack_pop_pointer() : () -> i64
                  %1085 = func.call @stack_pop_pointer() : () -> i64
                  %1086 = func.call @cc_cons(%1084, %1085) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%1086) : (i64) -> ()
                }
                %1087 = func.call @stack_pop_pointer() : () -> i64
                %1088 = func.call @stack_pop_pointer() : () -> i64
                %1089 = func.call @cc_append(%1088, %1087) : (i64, i64) -> i64
                func.call @stack_push_pointer(%1089) : (i64) -> ()
                %1090 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%1090) : (i64) -> ()
                %1091 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %1091, %1090 : i64, i64
              }
              func.call @stack_push_pointer(%1074#0) : (i64) -> ()
              %1092 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1092, %1074#1 : i64, i64
            } else {
              func.call @stack_push_nil() : () -> ()
              %1093 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1093, %1008#1 : i64, i64
            }
            func.call @stack_push_pointer(%1069#0) : (i64) -> ()
            %1094 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1094, %1069#1, %1008#2, %1008#3 : i64, i64, i64, i64
          }
          func.call @stack_push_pointer(%1025#0) : (i64) -> ()
          %1095 = func.call @stack_depth() : () -> i64
          %1096 = arith.constant 0 : i64
          %1097 = arith.cmpi sgt, %1095, %1096 : i64
          scf.if %1097 {
            %1098 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%912) : (i64) -> ()
          %1099 = func.call @stack_pop_pointer() : () -> i64
          %1100 = func.call @cc_cdr(%1099) : (i64) -> i64
          func.call @stack_push_pointer(%1100) : (i64) -> ()
          %1101 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1101) : (i64) -> ()
          %1102 = func.call @stack_depth() : () -> i64
          %1103 = arith.constant 0 : i64
          %1104 = arith.cmpi sgt, %1102, %1103 : i64
          scf.if %1104 {
            %1105 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %1025#2, %1025#3, %1025#1, %1101 : i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %1106 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%880#2) : (i64) -> ()
        %1107 = func.call @stack_pop_pointer() : () -> i64
        %1108 = func.call @cc_multiple_value_list(%1107) : (i64) -> i64
        %1109 = llvm.mlir.addressof @str79 : !llvm.ptr
        %1110 = arith.constant 38 : i64
        %1111 = func.call @cc_make_string(%1109, %1110) : (!llvm.ptr, i64) -> i64
        %1112 = func.call @cc_nil_value() : () -> i64
        %1113 = func.call @cc_intern(%1111, %1112) : (i64, i64) -> i64
        %1114 = func.call @cc_nil_value() : () -> i64
        %1115 = func.call @cc_cons(%1113, %1114) : (i64, i64) -> i64
        %1116 = func.call @cc_values_pack(%1115) : (i64) -> i64
        %1117 = func.call @cc_symbol_value(%1113) : (i64) -> i64
        %1118 = llvm.mlir.addressof @str80 : !llvm.ptr
        %1119 = arith.constant 39 : i64
        %1120 = func.call @cc_make_string(%1118, %1119) : (!llvm.ptr, i64) -> i64
        %1121 = func.call @cc_nil_value() : () -> i64
        %1122 = func.call @cc_intern(%1120, %1121) : (i64, i64) -> i64
        %1123 = func.call @cc_nil_value() : () -> i64
        %1124 = func.call @cc_cons(%1122, %1123) : (i64, i64) -> i64
        %1125 = func.call @cc_values_pack(%1124) : (i64) -> i64
        %1126 = func.call @cc_symbol_value(%1122) : (i64) -> i64
        %1127 = llvm.mlir.addressof @str81 : !llvm.ptr
        %1128 = arith.constant 40 : i64
        %1129 = func.call @cc_make_string(%1127, %1128) : (!llvm.ptr, i64) -> i64
        %1130 = func.call @cc_nil_value() : () -> i64
        %1131 = func.call @cc_intern(%1129, %1130) : (i64, i64) -> i64
        %1132 = func.call @cc_nil_value() : () -> i64
        %1133 = func.call @cc_cons(%1131, %1132) : (i64, i64) -> i64
        %1134 = func.call @cc_values_pack(%1133) : (i64) -> i64
        %1135 = func.call @cc_symbol_value(%1131) : (i64) -> i64
        %1136 = func.call @cc_nil_value() : () -> i64
        %1137 = arith.cmpi ne, %1117, %1136 : i64
        %1138 = scf.if %1137 -> (i64) {
          scf.yield %1135 : i64
        } else {
          scf.yield %1108 : i64
        }
        %1139 = func.call @cc_values_pack(%1138) : (i64) -> i64
        func.call @stack_push_pointer(%1139) : (i64) -> ()
        %1140 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1140, %880#3, %880#2, %880#0, %880#1 : i64, i64, i64, i64, i64
      }
      func.call @stack_push_pointer(%851#0) : (i64) -> ()
      %1141 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1141 : i64
    }
    func.call @stack_push_pointer(%766) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455811"() {
    %1306 = func.call @cc_nil_value() : () -> i64
    %1307 = func.call @cc_nil_value() : () -> i64
    %1308 = func.call @cc_errorp(%1306) : (i64) -> i64
    %1309 = arith.cmpi ne, %1308, %1307 : i64
    %1310 = scf.if %1309 -> (i64) {
      scf.yield %1306 : i64
    } else {
      %1311 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1312 = func.call @cc_nil_value() : () -> i64
      %1313 = func.call @cc_nil_value() : () -> i64
      %1314 = func.call @cc_errorp(%1312) : (i64) -> i64
      %1315 = arith.cmpi ne, %1314, %1313 : i64
      %1316 = scf.if %1315 -> (i64) {
        scf.yield %1312 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1317 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%1317) : (i64) -> ()
        %1318 = func.call @stack_pop_pointer() : () -> i64
        %1319 = func.call @cc_nil_value() : () -> i64
        %1320 = func.call @cc_errorp(%1318) : (i64) -> i64
        %1321 = arith.cmpi ne, %1320, %1319 : i64
        %1322 = arith.cmpi eq, %1319, %1319 : i64
        %1323 = arith.andi %1321, %1322 : i1
        %1324 = scf.if %1323 -> (i64) {
          scf.yield %1318 : i64
        } else {
          scf.yield %1319 : i64
        }
        %1325 = arith.cmpi ne, %1324, %1319 : i64
        scf.if %1325 {
          func.call @stack_push_pointer(%1324) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1318) : (i64) -> ()
          %1326 = llvm.mlir.addressof @str95 : !llvm.ptr
          %1327 = func.call @cc_make_function_ref_const(%1326) : (!llvm.ptr) -> i64
          %1328 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1327, %1328) : (i64, i64) -> ()
        }
        %1329 = func.call @stack_pop_pointer() : () -> i64
        %1330 = func.call @cc_errorp(%1329) : (i64) -> i64
        %1331 = func.call @cc_nil_value() : () -> i64
        %1332 = arith.cmpi ne, %1330, %1331 : i64
        scf.if %1332 {
          func.call @stack_push_pointer(%1329) : (i64) -> ()
        } else {
          %1333 = func.call @cc_multiple_value_list(%1329) : (i64) -> i64
          func.call @stack_push_pointer(%1333) : (i64) -> ()
        }
        %1334 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1335 = func.call @stack_pop_pointer() : () -> i64
        %1336 = func.call @cc_nil_value() : () -> i64
        %1337 = func.call @cc_maybe_error_from_multiple_value_list(%1334) : (i64) -> i64
        %1338 = func.call @cc_errorp(%1337) : (i64) -> i64
        %1339 = arith.cmpi ne, %1338, %1336 : i64
        %1340 = arith.cmpi eq, %1336, %1336 : i64
        %1341 = arith.andi %1339, %1340 : i1
        %1342 = scf.if %1341 -> (i64) {
          scf.yield %1337 : i64
        } else {
          scf.yield %1336 : i64
        }
        %1343 = arith.cmpi ne, %1342, %1336 : i64
        scf.if %1343 {
          func.call @stack_push_pointer(%1342) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1344 = func.call @stack_pop_pointer() : () -> i64
          %1345 = func.call @cc_cons(%1335, %1344) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1345) : (i64) -> ()
          %1346 = func.call @stack_pop_pointer() : () -> i64
          %1347 = func.call @cc_cons(%1334, %1346) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1347) : (i64) -> ()
          %1348 = func.call @stack_pop_pointer() : () -> i64
          %1349 = func.call @cc_values_pack(%1348) : (i64) -> i64
          func.call @stack_push_pointer(%1349) : (i64) -> ()
        }
        %1350 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1350 : i64
      }
      func.call @stack_push_pointer(%1316) : (i64) -> ()
      %1351 = func.call @stack_pop_pointer() : () -> i64
      %1352 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1353 = func.call @cc_errorp(%1351) : (i64) -> i64
      %1354 = func.call @cc_nil_value() : () -> i64
      %1355 = arith.cmpi ne, %1353, %1354 : i64
      scf.if %1355 {
        %1356 = func.call @cc_condition_value(%1351) : (i64) -> i64
        %1357 = func.call @cc_values2(%1354, %1356) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1357) : (i64) -> ()
      } else {
        %1358 = func.call @cc_multiple_value_list(%1351) : (i64) -> i64
        %1359 = func.call @cc_values_pack(%1358) : (i64) -> i64
        func.call @stack_push_pointer(%1359) : (i64) -> ()
      }
      %1360 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1360 : i64
    }
    func.call @stack_push_pointer(%1310) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455812"() {
    %1544 = func.call @cc_nil_value() : () -> i64
    %1545 = func.call @cc_nil_value() : () -> i64
    %1546 = func.call @cc_errorp(%1544) : (i64) -> i64
    %1547 = arith.cmpi ne, %1546, %1545 : i64
    %1548 = scf.if %1547 -> (i64) {
      scf.yield %1544 : i64
    } else {
      %1549 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1550 = func.call @cc_nil_value() : () -> i64
      %1551 = func.call @cc_nil_value() : () -> i64
      %1552 = func.call @cc_errorp(%1550) : (i64) -> i64
      %1553 = arith.cmpi ne, %1552, %1551 : i64
      %1554 = scf.if %1553 -> (i64) {
        scf.yield %1550 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1555 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%1555) : (i64) -> ()
        %1556 = func.call @stack_pop_pointer() : () -> i64
        %1557 = func.call @cc_nil_value() : () -> i64
        %1558 = func.call @cc_errorp(%1556) : (i64) -> i64
        %1559 = arith.cmpi ne, %1558, %1557 : i64
        %1560 = arith.cmpi eq, %1557, %1557 : i64
        %1561 = arith.andi %1559, %1560 : i1
        %1562 = scf.if %1561 -> (i64) {
          scf.yield %1556 : i64
        } else {
          scf.yield %1557 : i64
        }
        %1563 = arith.cmpi ne, %1562, %1557 : i64
        scf.if %1563 {
          func.call @stack_push_pointer(%1562) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1556) : (i64) -> ()
          %1564 = llvm.mlir.addressof @str111 : !llvm.ptr
          %1565 = func.call @cc_make_function_ref_const(%1564) : (!llvm.ptr) -> i64
          %1566 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1565, %1566) : (i64, i64) -> ()
        }
        %1567 = func.call @stack_pop_pointer() : () -> i64
        %1568 = func.call @cc_errorp(%1567) : (i64) -> i64
        %1569 = func.call @cc_nil_value() : () -> i64
        %1570 = arith.cmpi ne, %1568, %1569 : i64
        scf.if %1570 {
          func.call @stack_push_pointer(%1567) : (i64) -> ()
        } else {
          %1571 = func.call @cc_multiple_value_list(%1567) : (i64) -> i64
          func.call @stack_push_pointer(%1571) : (i64) -> ()
        }
        %1572 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1573 = func.call @stack_pop_pointer() : () -> i64
        %1574 = func.call @cc_nil_value() : () -> i64
        %1575 = func.call @cc_maybe_error_from_multiple_value_list(%1572) : (i64) -> i64
        %1576 = func.call @cc_errorp(%1575) : (i64) -> i64
        %1577 = arith.cmpi ne, %1576, %1574 : i64
        %1578 = arith.cmpi eq, %1574, %1574 : i64
        %1579 = arith.andi %1577, %1578 : i1
        %1580 = scf.if %1579 -> (i64) {
          scf.yield %1575 : i64
        } else {
          scf.yield %1574 : i64
        }
        %1581 = arith.cmpi ne, %1580, %1574 : i64
        scf.if %1581 {
          func.call @stack_push_pointer(%1580) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1582 = func.call @stack_pop_pointer() : () -> i64
          %1583 = func.call @cc_cons(%1573, %1582) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1583) : (i64) -> ()
          %1584 = func.call @stack_pop_pointer() : () -> i64
          %1585 = func.call @cc_cons(%1572, %1584) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1585) : (i64) -> ()
          %1586 = func.call @stack_pop_pointer() : () -> i64
          %1587 = func.call @cc_values_pack(%1586) : (i64) -> i64
          func.call @stack_push_pointer(%1587) : (i64) -> ()
        }
        %1588 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1588 : i64
      }
      func.call @stack_push_pointer(%1554) : (i64) -> ()
      %1589 = func.call @stack_pop_pointer() : () -> i64
      %1590 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1591 = func.call @cc_errorp(%1589) : (i64) -> i64
      %1592 = func.call @cc_nil_value() : () -> i64
      %1593 = arith.cmpi ne, %1591, %1592 : i64
      scf.if %1593 {
        %1594 = func.call @cc_condition_value(%1589) : (i64) -> i64
        %1595 = func.call @cc_values2(%1592, %1594) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1595) : (i64) -> ()
      } else {
        %1596 = func.call @cc_multiple_value_list(%1589) : (i64) -> i64
        %1597 = func.call @cc_values_pack(%1596) : (i64) -> i64
        func.call @stack_push_pointer(%1597) : (i64) -> ()
      }
      %1598 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1598 : i64
    }
    func.call @stack_push_pointer(%1548) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455813"() {
    %1783 = func.call @cc_nil_value() : () -> i64
    %1784 = func.call @cc_nil_value() : () -> i64
    %1785 = func.call @cc_errorp(%1783) : (i64) -> i64
    %1786 = arith.cmpi ne, %1785, %1784 : i64
    %1787 = scf.if %1786 -> (i64) {
      scf.yield %1783 : i64
    } else {
      %1788 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %1789 = func.call @cc_nil_value() : () -> i64
      %1790 = func.call @cc_nil_value() : () -> i64
      %1791 = func.call @cc_errorp(%1789) : (i64) -> i64
      %1792 = arith.cmpi ne, %1791, %1790 : i64
      %1793 = scf.if %1792 -> (i64) {
        scf.yield %1789 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %1794 = arith.constant 3.0 : f64
        %1795 = func.call @cc_box_float(%1794) : (f64) -> i64
        func.call @stack_push_pointer(%1795) : (i64) -> ()
        %1796 = func.call @stack_pop_pointer() : () -> i64
        %1797 = func.call @cc_nil_value() : () -> i64
        %1798 = func.call @cc_errorp(%1796) : (i64) -> i64
        %1799 = arith.cmpi ne, %1798, %1797 : i64
        %1800 = arith.cmpi eq, %1797, %1797 : i64
        %1801 = arith.andi %1799, %1800 : i1
        %1802 = scf.if %1801 -> (i64) {
          scf.yield %1796 : i64
        } else {
          scf.yield %1797 : i64
        }
        %1803 = arith.cmpi ne, %1802, %1797 : i64
        scf.if %1803 {
          func.call @stack_push_pointer(%1802) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1796) : (i64) -> ()
          %1804 = llvm.mlir.addressof @str127 : !llvm.ptr
          %1805 = func.call @cc_make_function_ref_const(%1804) : (!llvm.ptr) -> i64
          %1806 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1805, %1806) : (i64, i64) -> ()
        }
        %1807 = func.call @stack_pop_pointer() : () -> i64
        %1808 = func.call @cc_errorp(%1807) : (i64) -> i64
        %1809 = func.call @cc_nil_value() : () -> i64
        %1810 = arith.cmpi ne, %1808, %1809 : i64
        scf.if %1810 {
          func.call @stack_push_pointer(%1807) : (i64) -> ()
        } else {
          %1811 = func.call @cc_multiple_value_list(%1807) : (i64) -> i64
          func.call @stack_push_pointer(%1811) : (i64) -> ()
        }
        %1812 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %1813 = func.call @stack_pop_pointer() : () -> i64
        %1814 = func.call @cc_nil_value() : () -> i64
        %1815 = func.call @cc_maybe_error_from_multiple_value_list(%1812) : (i64) -> i64
        %1816 = func.call @cc_errorp(%1815) : (i64) -> i64
        %1817 = arith.cmpi ne, %1816, %1814 : i64
        %1818 = arith.cmpi eq, %1814, %1814 : i64
        %1819 = arith.andi %1817, %1818 : i1
        %1820 = scf.if %1819 -> (i64) {
          scf.yield %1815 : i64
        } else {
          scf.yield %1814 : i64
        }
        %1821 = arith.cmpi ne, %1820, %1814 : i64
        scf.if %1821 {
          func.call @stack_push_pointer(%1820) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %1822 = func.call @stack_pop_pointer() : () -> i64
          %1823 = func.call @cc_cons(%1813, %1822) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1823) : (i64) -> ()
          %1824 = func.call @stack_pop_pointer() : () -> i64
          %1825 = func.call @cc_cons(%1812, %1824) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1825) : (i64) -> ()
          %1826 = func.call @stack_pop_pointer() : () -> i64
          %1827 = func.call @cc_values_pack(%1826) : (i64) -> i64
          func.call @stack_push_pointer(%1827) : (i64) -> ()
        }
        %1828 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1828 : i64
      }
      func.call @stack_push_pointer(%1793) : (i64) -> ()
      %1829 = func.call @stack_pop_pointer() : () -> i64
      %1830 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %1831 = func.call @cc_errorp(%1829) : (i64) -> i64
      %1832 = func.call @cc_nil_value() : () -> i64
      %1833 = arith.cmpi ne, %1831, %1832 : i64
      scf.if %1833 {
        %1834 = func.call @cc_condition_value(%1829) : (i64) -> i64
        %1835 = func.call @cc_values2(%1832, %1834) : (i64, i64) -> i64
        func.call @stack_push_pointer(%1835) : (i64) -> ()
      } else {
        %1836 = func.call @cc_multiple_value_list(%1829) : (i64) -> i64
        %1837 = func.call @cc_values_pack(%1836) : (i64) -> i64
        func.call @stack_push_pointer(%1837) : (i64) -> ()
      }
      %1838 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1838 : i64
    }
    func.call @stack_push_pointer(%1787) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455814"() {
    %2047 = func.call @cc_nil_value() : () -> i64
    %2048 = func.call @cc_nil_value() : () -> i64
    %2049 = func.call @cc_errorp(%2047) : (i64) -> i64
    %2050 = arith.cmpi ne, %2049, %2048 : i64
    %2051 = scf.if %2050 -> (i64) {
      scf.yield %2047 : i64
    } else {
      %2052 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2053 = func.call @cc_nil_value() : () -> i64
      %2054 = func.call @cc_nil_value() : () -> i64
      %2055 = func.call @cc_errorp(%2053) : (i64) -> i64
      %2056 = arith.cmpi ne, %2055, %2054 : i64
      %2057 = scf.if %2056 -> (i64) {
        scf.yield %2053 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2058 = llvm.mlir.addressof @str147 : !llvm.ptr
        %2059 = arith.constant 20 : i64
        %2060 = func.call @cc_make_string(%2058, %2059) : (!llvm.ptr, i64) -> i64
        %2061 = llvm.mlir.addressof @str148 : !llvm.ptr
        %2062 = arith.constant 11 : i64
        %2063 = func.call @cc_make_string(%2061, %2062) : (!llvm.ptr, i64) -> i64
        %2064 = func.call @cc_intern(%2060, %2063) : (i64, i64) -> i64
        %2065 = func.call @cc_nil_value() : () -> i64
        %2066 = func.call @cc_cons(%2064, %2065) : (i64, i64) -> i64
        %2067 = func.call @cc_values_pack(%2066) : (i64) -> i64
        %2068 = func.call @cc_symbol_value(%2064) : (i64) -> i64
        func.call @stack_push_pointer(%2068) : (i64) -> ()
        %2069 = func.call @stack_pop_pointer() : () -> i64
        %2070 = arith.constant 1 : i64
        %2071 = func.call @cc_box_fixnum(%2070) : (i64) -> i64
        %2073 = arith.constant 3 : i64
        %2072 = arith.andi %2069, %2073 : i64
        %2074 = arith.constant 0 : i64
        %2075 = arith.cmpi eq, %2072, %2074 : i64
        %2077 = arith.constant 3 : i64
        %2076 = arith.andi %2071, %2077 : i64
        %2078 = arith.constant 0 : i64
        %2079 = arith.cmpi eq, %2076, %2078 : i64
        %2080 = arith.andi %2075, %2079 : i1
        %2081 = scf.if %2080 -> (i64) {
          %2082 = arith.constant 2 : i64
          %2083 = arith.shrsi %2069, %2082 : i64
          %2084 = arith.constant 2 : i64
          %2085 = arith.shrsi %2071, %2084 : i64
          %2086 = arith.addi %2083, %2085 : i64
          %2087 = arith.constant -2305843009213693952 : i64
          %2088 = arith.constant 2305843009213693951 : i64
          %2089 = arith.cmpi sge, %2086, %2087 : i64
          %2090 = arith.cmpi sle, %2086, %2088 : i64
          %2091 = arith.andi %2089, %2090 : i1
          %2092 = scf.if %2091 -> (i64) {
            %2093 = arith.constant 2 : i64
            %2094 = arith.shli %2086, %2093 : i64
            scf.yield %2094 : i64
          } else {
            %2095 = func.call @cc_add(%2069, %2071) : (i64, i64) -> i64
            scf.yield %2095 : i64
          }
          scf.yield %2092 : i64
        } else {
          %2096 = func.call @cc_add(%2069, %2071) : (i64, i64) -> i64
          scf.yield %2096 : i64
        }
        func.call @stack_push_pointer(%2081) : (i64) -> ()
        %2097 = func.call @stack_pop_pointer() : () -> i64
        %2098 = func.call @cc_nil_value() : () -> i64
        %2099 = func.call @cc_errorp(%2097) : (i64) -> i64
        %2100 = arith.cmpi ne, %2099, %2098 : i64
        %2101 = arith.cmpi eq, %2098, %2098 : i64
        %2102 = arith.andi %2100, %2101 : i1
        %2103 = scf.if %2102 -> (i64) {
          scf.yield %2097 : i64
        } else {
          scf.yield %2098 : i64
        }
        %2104 = arith.cmpi ne, %2103, %2098 : i64
        scf.if %2104 {
          func.call @stack_push_pointer(%2103) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2097) : (i64) -> ()
          %2105 = llvm.mlir.addressof @str149 : !llvm.ptr
          %2106 = func.call @cc_make_function_ref_const(%2105) : (!llvm.ptr) -> i64
          %2107 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2106, %2107) : (i64, i64) -> ()
        }
        %2108 = func.call @stack_pop_pointer() : () -> i64
        %2109 = func.call @cc_errorp(%2108) : (i64) -> i64
        %2110 = func.call @cc_nil_value() : () -> i64
        %2111 = arith.cmpi ne, %2109, %2110 : i64
        scf.if %2111 {
          func.call @stack_push_pointer(%2108) : (i64) -> ()
        } else {
          %2112 = func.call @cc_multiple_value_list(%2108) : (i64) -> i64
          func.call @stack_push_pointer(%2112) : (i64) -> ()
        }
        %2113 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2114 = func.call @stack_pop_pointer() : () -> i64
        %2115 = func.call @cc_nil_value() : () -> i64
        %2116 = func.call @cc_maybe_error_from_multiple_value_list(%2113) : (i64) -> i64
        %2117 = func.call @cc_errorp(%2116) : (i64) -> i64
        %2118 = arith.cmpi ne, %2117, %2115 : i64
        %2119 = arith.cmpi eq, %2115, %2115 : i64
        %2120 = arith.andi %2118, %2119 : i1
        %2121 = scf.if %2120 -> (i64) {
          scf.yield %2116 : i64
        } else {
          scf.yield %2115 : i64
        }
        %2122 = arith.cmpi ne, %2121, %2115 : i64
        scf.if %2122 {
          func.call @stack_push_pointer(%2121) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2123 = func.call @stack_pop_pointer() : () -> i64
          %2124 = func.call @cc_cons(%2114, %2123) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2124) : (i64) -> ()
          %2125 = func.call @stack_pop_pointer() : () -> i64
          %2126 = func.call @cc_cons(%2113, %2125) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2126) : (i64) -> ()
          %2127 = func.call @stack_pop_pointer() : () -> i64
          %2128 = func.call @cc_values_pack(%2127) : (i64) -> i64
          func.call @stack_push_pointer(%2128) : (i64) -> ()
        }
        %2129 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2129 : i64
      }
      func.call @stack_push_pointer(%2057) : (i64) -> ()
      %2130 = func.call @stack_pop_pointer() : () -> i64
      %2131 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2132 = func.call @cc_errorp(%2130) : (i64) -> i64
      %2133 = func.call @cc_nil_value() : () -> i64
      %2134 = arith.cmpi ne, %2132, %2133 : i64
      scf.if %2134 {
        %2135 = func.call @cc_condition_value(%2130) : (i64) -> i64
        %2136 = func.call @cc_values2(%2133, %2135) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2136) : (i64) -> ()
      } else {
        %2137 = func.call @cc_multiple_value_list(%2130) : (i64) -> i64
        %2138 = func.call @cc_values_pack(%2137) : (i64) -> i64
        func.call @stack_push_pointer(%2138) : (i64) -> ()
      }
      %2139 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2139 : i64
    }
    func.call @stack_push_pointer(%2051) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455815"() {
    %2348 = func.call @cc_nil_value() : () -> i64
    %2349 = func.call @cc_nil_value() : () -> i64
    %2350 = func.call @cc_errorp(%2348) : (i64) -> i64
    %2351 = arith.cmpi ne, %2350, %2349 : i64
    %2352 = scf.if %2351 -> (i64) {
      scf.yield %2348 : i64
    } else {
      %2353 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2354 = func.call @cc_nil_value() : () -> i64
      %2355 = func.call @cc_nil_value() : () -> i64
      %2356 = func.call @cc_errorp(%2354) : (i64) -> i64
      %2357 = arith.cmpi ne, %2356, %2355 : i64
      %2358 = scf.if %2357 -> (i64) {
        scf.yield %2354 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2359 = llvm.mlir.addressof @str169 : !llvm.ptr
        %2360 = arith.constant 20 : i64
        %2361 = func.call @cc_make_string(%2359, %2360) : (!llvm.ptr, i64) -> i64
        %2362 = llvm.mlir.addressof @str170 : !llvm.ptr
        %2363 = arith.constant 11 : i64
        %2364 = func.call @cc_make_string(%2362, %2363) : (!llvm.ptr, i64) -> i64
        %2365 = func.call @cc_intern(%2361, %2364) : (i64, i64) -> i64
        %2366 = func.call @cc_nil_value() : () -> i64
        %2367 = func.call @cc_cons(%2365, %2366) : (i64, i64) -> i64
        %2368 = func.call @cc_values_pack(%2367) : (i64) -> i64
        %2369 = func.call @cc_symbol_value(%2365) : (i64) -> i64
        func.call @stack_push_pointer(%2369) : (i64) -> ()
        %2370 = func.call @stack_pop_pointer() : () -> i64
        %2371 = arith.constant 1 : i64
        %2372 = func.call @cc_box_fixnum(%2371) : (i64) -> i64
        %2374 = arith.constant 3 : i64
        %2373 = arith.andi %2370, %2374 : i64
        %2375 = arith.constant 0 : i64
        %2376 = arith.cmpi eq, %2373, %2375 : i64
        %2378 = arith.constant 3 : i64
        %2377 = arith.andi %2372, %2378 : i64
        %2379 = arith.constant 0 : i64
        %2380 = arith.cmpi eq, %2377, %2379 : i64
        %2381 = arith.andi %2376, %2380 : i1
        %2382 = scf.if %2381 -> (i64) {
          %2383 = arith.constant 2 : i64
          %2384 = arith.shrsi %2370, %2383 : i64
          %2385 = arith.constant 2 : i64
          %2386 = arith.shrsi %2372, %2385 : i64
          %2387 = arith.subi %2384, %2386 : i64
          %2388 = arith.constant -2305843009213693952 : i64
          %2389 = arith.constant 2305843009213693951 : i64
          %2390 = arith.cmpi sge, %2387, %2388 : i64
          %2391 = arith.cmpi sle, %2387, %2389 : i64
          %2392 = arith.andi %2390, %2391 : i1
          %2393 = scf.if %2392 -> (i64) {
            %2394 = arith.constant 2 : i64
            %2395 = arith.shli %2387, %2394 : i64
            scf.yield %2395 : i64
          } else {
            %2396 = func.call @cc_sub(%2370, %2372) : (i64, i64) -> i64
            scf.yield %2396 : i64
          }
          scf.yield %2393 : i64
        } else {
          %2397 = func.call @cc_sub(%2370, %2372) : (i64, i64) -> i64
          scf.yield %2397 : i64
        }
        func.call @stack_push_pointer(%2382) : (i64) -> ()
        %2398 = func.call @stack_pop_pointer() : () -> i64
        %2399 = func.call @cc_nil_value() : () -> i64
        %2400 = func.call @cc_errorp(%2398) : (i64) -> i64
        %2401 = arith.cmpi ne, %2400, %2399 : i64
        %2402 = arith.cmpi eq, %2399, %2399 : i64
        %2403 = arith.andi %2401, %2402 : i1
        %2404 = scf.if %2403 -> (i64) {
          scf.yield %2398 : i64
        } else {
          scf.yield %2399 : i64
        }
        %2405 = arith.cmpi ne, %2404, %2399 : i64
        scf.if %2405 {
          func.call @stack_push_pointer(%2404) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2398) : (i64) -> ()
          %2406 = llvm.mlir.addressof @str171 : !llvm.ptr
          %2407 = func.call @cc_make_function_ref_const(%2406) : (!llvm.ptr) -> i64
          %2408 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2407, %2408) : (i64, i64) -> ()
        }
        %2409 = func.call @stack_pop_pointer() : () -> i64
        %2410 = func.call @cc_errorp(%2409) : (i64) -> i64
        %2411 = func.call @cc_nil_value() : () -> i64
        %2412 = arith.cmpi ne, %2410, %2411 : i64
        scf.if %2412 {
          func.call @stack_push_pointer(%2409) : (i64) -> ()
        } else {
          %2413 = func.call @cc_multiple_value_list(%2409) : (i64) -> i64
          func.call @stack_push_pointer(%2413) : (i64) -> ()
        }
        %2414 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2415 = func.call @stack_pop_pointer() : () -> i64
        %2416 = func.call @cc_nil_value() : () -> i64
        %2417 = func.call @cc_maybe_error_from_multiple_value_list(%2414) : (i64) -> i64
        %2418 = func.call @cc_errorp(%2417) : (i64) -> i64
        %2419 = arith.cmpi ne, %2418, %2416 : i64
        %2420 = arith.cmpi eq, %2416, %2416 : i64
        %2421 = arith.andi %2419, %2420 : i1
        %2422 = scf.if %2421 -> (i64) {
          scf.yield %2417 : i64
        } else {
          scf.yield %2416 : i64
        }
        %2423 = arith.cmpi ne, %2422, %2416 : i64
        scf.if %2423 {
          func.call @stack_push_pointer(%2422) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2424 = func.call @stack_pop_pointer() : () -> i64
          %2425 = func.call @cc_cons(%2415, %2424) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2425) : (i64) -> ()
          %2426 = func.call @stack_pop_pointer() : () -> i64
          %2427 = func.call @cc_cons(%2414, %2426) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2427) : (i64) -> ()
          %2428 = func.call @stack_pop_pointer() : () -> i64
          %2429 = func.call @cc_values_pack(%2428) : (i64) -> i64
          func.call @stack_push_pointer(%2429) : (i64) -> ()
        }
        %2430 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2430 : i64
      }
      func.call @stack_push_pointer(%2358) : (i64) -> ()
      %2431 = func.call @stack_pop_pointer() : () -> i64
      %2432 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2433 = func.call @cc_errorp(%2431) : (i64) -> i64
      %2434 = func.call @cc_nil_value() : () -> i64
      %2435 = arith.cmpi ne, %2433, %2434 : i64
      scf.if %2435 {
        %2436 = func.call @cc_condition_value(%2431) : (i64) -> i64
        %2437 = func.call @cc_values2(%2434, %2436) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2437) : (i64) -> ()
      } else {
        %2438 = func.call @cc_multiple_value_list(%2431) : (i64) -> i64
        %2439 = func.call @cc_values_pack(%2438) : (i64) -> i64
        func.call @stack_push_pointer(%2439) : (i64) -> ()
      }
      %2440 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2440 : i64
    }
    func.call @stack_push_pointer(%2352) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455816"() {
    %3255 = func.call @cc_nil_value() : () -> i64
    %3256 = func.call @cc_nil_value() : () -> i64
    %3257 = func.call @cc_errorp(%3255) : (i64) -> i64
    %3258 = arith.cmpi ne, %3257, %3256 : i64
    %3259 = scf.if %3258 -> (i64) {
      scf.yield %3255 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %3260 = func.call @stack_pop_pointer() : () -> i64
      %3261 = llvm.mlir.addressof @str238 : !llvm.ptr
      %3262 = arith.constant 26 : i64
      %3263 = func.call @cc_make_string(%3261, %3262) : (!llvm.ptr, i64) -> i64
      %3264 = llvm.mlir.addressof @str239 : !llvm.ptr
      %3265 = arith.constant 11 : i64
      %3266 = func.call @cc_make_string(%3264, %3265) : (!llvm.ptr, i64) -> i64
      %3267 = func.call @cc_intern(%3263, %3266) : (i64, i64) -> i64
      %3268 = func.call @cc_nil_value() : () -> i64
      %3269 = func.call @cc_cons(%3267, %3268) : (i64, i64) -> i64
      %3270 = func.call @cc_values_pack(%3269) : (i64) -> i64
      %3271 = func.call @cc_symbol_value(%3267) : (i64) -> i64
      func.call @stack_push_pointer(%3271) : (i64) -> ()
      %3272 = func.call @stack_pop_pointer() : () -> i64
      %3273 = arith.constant -3.0 : f64
      %3274 = func.call @cc_box_float(%3273) : (f64) -> i64
      func.call @stack_push_pointer(%3274) : (i64) -> ()
      %3275 = func.call @stack_pop_pointer() : () -> i64
      %3276 = arith.constant 0.0 : f64
      %3277 = func.call @cc_box_float(%3276) : (f64) -> i64
      func.call @stack_push_pointer(%3277) : (i64) -> ()
      %3278 = func.call @stack_pop_pointer() : () -> i64
      %3279 = arith.constant 3.0 : f64
      %3280 = func.call @cc_box_float(%3279) : (f64) -> i64
      func.call @stack_push_pointer(%3280) : (i64) -> ()
      %3281 = func.call @stack_pop_pointer() : () -> i64
      %3282 = llvm.mlir.addressof @str240 : !llvm.ptr
      %3283 = arith.constant 26 : i64
      %3284 = func.call @cc_make_string(%3282, %3283) : (!llvm.ptr, i64) -> i64
      %3285 = llvm.mlir.addressof @str241 : !llvm.ptr
      %3286 = arith.constant 11 : i64
      %3287 = func.call @cc_make_string(%3285, %3286) : (!llvm.ptr, i64) -> i64
      %3288 = func.call @cc_intern(%3284, %3287) : (i64, i64) -> i64
      %3289 = func.call @cc_nil_value() : () -> i64
      %3290 = func.call @cc_cons(%3288, %3289) : (i64, i64) -> i64
      %3291 = func.call @cc_values_pack(%3290) : (i64) -> i64
      %3292 = func.call @cc_symbol_value(%3288) : (i64) -> i64
      func.call @stack_push_pointer(%3292) : (i64) -> ()
      %3293 = func.call @stack_pop_pointer() : () -> i64
      %3294 = func.call @cc_nil_value() : () -> i64
      %3295 = func.call @cc_errorp(%3272) : (i64) -> i64
      %3296 = arith.cmpi ne, %3295, %3294 : i64
      %3297 = arith.cmpi eq, %3294, %3294 : i64
      %3298 = arith.andi %3296, %3297 : i1
      %3299 = scf.if %3298 -> (i64) {
        scf.yield %3272 : i64
      } else {
        scf.yield %3294 : i64
      }
      %3300 = func.call @cc_errorp(%3275) : (i64) -> i64
      %3301 = arith.cmpi ne, %3300, %3294 : i64
      %3302 = arith.cmpi eq, %3299, %3294 : i64
      %3303 = arith.andi %3301, %3302 : i1
      %3304 = scf.if %3303 -> (i64) {
        scf.yield %3275 : i64
      } else {
        scf.yield %3299 : i64
      }
      %3305 = func.call @cc_errorp(%3278) : (i64) -> i64
      %3306 = arith.cmpi ne, %3305, %3294 : i64
      %3307 = arith.cmpi eq, %3304, %3294 : i64
      %3308 = arith.andi %3306, %3307 : i1
      %3309 = scf.if %3308 -> (i64) {
        scf.yield %3278 : i64
      } else {
        scf.yield %3304 : i64
      }
      %3310 = func.call @cc_errorp(%3281) : (i64) -> i64
      %3311 = arith.cmpi ne, %3310, %3294 : i64
      %3312 = arith.cmpi eq, %3309, %3294 : i64
      %3313 = arith.andi %3311, %3312 : i1
      %3314 = scf.if %3313 -> (i64) {
        scf.yield %3281 : i64
      } else {
        scf.yield %3309 : i64
      }
      %3315 = func.call @cc_errorp(%3293) : (i64) -> i64
      %3316 = arith.cmpi ne, %3315, %3294 : i64
      %3317 = arith.cmpi eq, %3314, %3294 : i64
      %3318 = arith.andi %3316, %3317 : i1
      %3319 = scf.if %3318 -> (i64) {
        scf.yield %3293 : i64
      } else {
        scf.yield %3314 : i64
      }
      %3320 = arith.cmpi ne, %3319, %3294 : i64
      scf.if %3320 {
        func.call @stack_push_pointer(%3319) : (i64) -> ()
      } else {
        %3321 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%3321) : (i64) -> ()
        func.call @stack_push_pointer(%3293) : (i64) -> ()
        %3322 = func.call @stack_pop_pointer() : () -> i64
        %3323 = func.call @stack_pop_pointer() : () -> i64
        %3324 = func.call @cc_cons(%3322, %3323) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3324) : (i64) -> ()
        func.call @stack_push_pointer(%3281) : (i64) -> ()
        %3325 = func.call @stack_pop_pointer() : () -> i64
        %3326 = func.call @stack_pop_pointer() : () -> i64
        %3327 = func.call @cc_cons(%3325, %3326) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3327) : (i64) -> ()
        func.call @stack_push_pointer(%3278) : (i64) -> ()
        %3328 = func.call @stack_pop_pointer() : () -> i64
        %3329 = func.call @stack_pop_pointer() : () -> i64
        %3330 = func.call @cc_cons(%3328, %3329) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3330) : (i64) -> ()
        func.call @stack_push_pointer(%3275) : (i64) -> ()
        %3331 = func.call @stack_pop_pointer() : () -> i64
        %3332 = func.call @stack_pop_pointer() : () -> i64
        %3333 = func.call @cc_cons(%3331, %3332) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3333) : (i64) -> ()
        func.call @stack_push_pointer(%3272) : (i64) -> ()
        %3334 = func.call @stack_pop_pointer() : () -> i64
        %3335 = func.call @stack_pop_pointer() : () -> i64
        %3336 = func.call @cc_cons(%3334, %3335) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3336) : (i64) -> ()
      }
      %3337 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3338 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3339 = func.call @stack_pop_pointer() : () -> i64
      %3340 = func.call @cc_nil_value() : () -> i64
      %3341 = func.call @cc_nil_value() : () -> i64
      %3342 = func.call @cc_errorp(%3340) : (i64) -> i64
      %3343 = arith.cmpi ne, %3342, %3341 : i64
      %3344:5 = scf.if %3343 -> (i64, i64, i64, i64, i64) {
        scf.yield %3340, %3337, %3339, %3260, %3338 : i64, i64, i64, i64, i64
      } else {
        %3345 = func.call @cc_nil_value() : () -> i64
        %3346 = llvm.mlir.addressof @str242 : !llvm.ptr
        %3347 = arith.constant 38 : i64
        %3348 = func.call @cc_make_string(%3346, %3347) : (!llvm.ptr, i64) -> i64
        %3349 = func.call @cc_nil_value() : () -> i64
        %3350 = func.call @cc_intern(%3348, %3349) : (i64, i64) -> i64
        %3351 = func.call @cc_nil_value() : () -> i64
        %3352 = func.call @cc_cons(%3350, %3351) : (i64, i64) -> i64
        %3353 = func.call @cc_values_pack(%3352) : (i64) -> i64
        %3354 = func.call @cc_set_symbol_value(%3350, %3345) : (i64, i64) -> i64
        %3355 = llvm.mlir.addressof @str243 : !llvm.ptr
        %3356 = arith.constant 39 : i64
        %3357 = func.call @cc_make_string(%3355, %3356) : (!llvm.ptr, i64) -> i64
        %3358 = func.call @cc_nil_value() : () -> i64
        %3359 = func.call @cc_intern(%3357, %3358) : (i64, i64) -> i64
        %3360 = func.call @cc_nil_value() : () -> i64
        %3361 = func.call @cc_cons(%3359, %3360) : (i64, i64) -> i64
        %3362 = func.call @cc_values_pack(%3361) : (i64) -> i64
        %3363 = func.call @cc_set_symbol_value(%3359, %3345) : (i64, i64) -> i64
        %3364 = llvm.mlir.addressof @str244 : !llvm.ptr
        %3365 = arith.constant 40 : i64
        %3366 = func.call @cc_make_string(%3364, %3365) : (!llvm.ptr, i64) -> i64
        %3367 = func.call @cc_nil_value() : () -> i64
        %3368 = func.call @cc_intern(%3366, %3367) : (i64, i64) -> i64
        %3369 = func.call @cc_nil_value() : () -> i64
        %3370 = func.call @cc_cons(%3368, %3369) : (i64, i64) -> i64
        %3371 = func.call @cc_values_pack(%3370) : (i64) -> i64
        %3372 = func.call @cc_set_symbol_value(%3368, %3345) : (i64, i64) -> i64
        %3373:4 = scf.while (%arg0 = %3260, %arg1 = %3338, %arg2 = %3339, %arg3 = %3337) : (i64, i64, i64, i64) -> (i64, i64, i64, i64) {
          func.call @stack_push_pointer(%arg3) : (i64) -> ()
          %3374 = func.call @stack_pop_pointer() : () -> i64
          %3375 = func.call @cc_nil_value() : () -> i64
          %3376 = arith.cmpi ne, %3374, %3375 : i64
          %3377 = func.call @cc_nil_value() : () -> i64
          %3378 = llvm.mlir.addressof @str245 : !llvm.ptr
          %3379 = arith.constant 38 : i64
          %3380 = func.call @cc_make_string(%3378, %3379) : (!llvm.ptr, i64) -> i64
          %3381 = func.call @cc_nil_value() : () -> i64
          %3382 = func.call @cc_intern(%3380, %3381) : (i64, i64) -> i64
          %3383 = func.call @cc_nil_value() : () -> i64
          %3384 = func.call @cc_cons(%3382, %3383) : (i64, i64) -> i64
          %3385 = func.call @cc_values_pack(%3384) : (i64) -> i64
          %3386 = func.call @cc_symbol_value(%3382) : (i64) -> i64
          %3387 = arith.cmpi ne, %3386, %3377 : i64
          %3388 = llvm.mlir.addressof @str246 : !llvm.ptr
          %3389 = arith.constant 38 : i64
          %3390 = func.call @cc_make_string(%3388, %3389) : (!llvm.ptr, i64) -> i64
          %3391 = func.call @cc_nil_value() : () -> i64
          %3392 = func.call @cc_intern(%3390, %3391) : (i64, i64) -> i64
          %3393 = func.call @cc_nil_value() : () -> i64
          %3394 = func.call @cc_cons(%3392, %3393) : (i64, i64) -> i64
          %3395 = func.call @cc_values_pack(%3394) : (i64) -> i64
          %3396 = func.call @cc_symbol_value(%3392) : (i64) -> i64
          %3397 = arith.cmpi ne, %3396, %3377 : i64
          %3398 = arith.ori %3387, %3397 : i1
          %3399 = arith.constant 0 : i1
          %3400 = arith.cmpi eq, %3398, %3399 : i1
          %3401 = arith.andi %3376, %3400 : i1
          scf.condition(%3401) %arg0, %arg1, %arg2, %arg3 : i64, i64, i64, i64
        } do {
          ^bb0(%3402: i64, %3403: i64, %3404: i64, %3405: i64):
          %3406 = func.call @cc_nil_value() : () -> i64
          %3407 = func.call @cc_nil_value() : () -> i64
          %3408 = func.call @cc_errorp(%3406) : (i64) -> i64
          %3409 = arith.cmpi ne, %3408, %3407 : i64
          %3410:4 = scf.if %3409 -> (i64, i64, i64, i64) {
            scf.yield %3406, %3404, %3402, %3403 : i64, i64, i64, i64
          } else {
            %3411 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%3405) : (i64) -> ()
            %3412 = func.call @stack_pop_pointer() : () -> i64
            %3413 = func.call @cc_nil_value() : () -> i64
            %3414 = arith.cmpi eq, %3412, %3413 : i64
            %3416 = func.call @cc_t_value() : () -> i64
            %3415 = arith.select %3414, %3416, %3413 : i64
            func.call @stack_push_pointer(%3415) : (i64) -> ()
            %3417 = func.call @stack_pop_pointer() : () -> i64
            %3418 = func.call @cc_nil_value() : () -> i64
            %3419 = func.call @cc_cons(%3417, %3418) : (i64, i64) -> i64
            %3420 = func.call @cc_not(%3419) : (i64) -> i64
            func.call @stack_push_pointer(%3420) : (i64) -> ()
            %3421 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3405) : (i64) -> ()
            %3422 = func.call @stack_pop_pointer() : () -> i64
            %3423 = func.call @cc_is_cons(%3422) : (i64) -> i32
            %3424 = arith.constant 0 : i32
            %3425 = arith.cmpi ne, %3423, %3424 : i32
            %3426 = func.call @cc_t_value() : () -> i64
            %3427 = func.call @cc_nil_value() : () -> i64
            %3428 = arith.select %3425, %3426, %3427 : i64
            func.call @stack_push_pointer(%3428) : (i64) -> ()
            %3429 = func.call @stack_pop_pointer() : () -> i64
            %3430 = func.call @cc_nil_value() : () -> i64
            %3431 = func.call @cc_cons(%3429, %3430) : (i64, i64) -> i64
            %3432 = func.call @cc_not(%3431) : (i64) -> i64
            func.call @stack_push_pointer(%3432) : (i64) -> ()
            %3433 = func.call @stack_pop_pointer() : () -> i64
            %3434 = func.call @cc_cons(%3433, %3411) : (i64, i64) -> i64
            %3435 = func.call @cc_cons(%3421, %3434) : (i64, i64) -> i64
            %3436 = func.call @cc_and(%3435) : (i64) -> i64
            func.call @stack_push_pointer(%3436) : (i64) -> ()
            %3437 = func.call @stack_pop_pointer() : () -> i64
            %3438 = func.call @cc_nil_value() : () -> i64
            %3439 = arith.cmpi ne, %3437, %3438 : i64
            scf.if %3439 {
              %3440 = llvm.mlir.addressof @str247 : !llvm.ptr
              %3441 = arith.constant 10 : i64
              %3442 = func.call @cc_make_string(%3440, %3441) : (!llvm.ptr, i64) -> i64
              %3443 = func.call @cc_nil_value() : () -> i64
              %3444 = func.call @cc_intern(%3442, %3443) : (i64, i64) -> i64
              %3445 = func.call @cc_nil_value() : () -> i64
              %3446 = func.call @cc_cons(%3444, %3445) : (i64, i64) -> i64
              %3447 = func.call @cc_values_pack(%3446) : (i64) -> i64
              func.call @stack_push_pointer(%3444) : (i64) -> ()
              %3448 = func.call @stack_pop_pointer() : () -> i64
              %3449 = func.call @cc_nil_value() : () -> i64
              %3450 = func.call @cc_errorp(%3448) : (i64) -> i64
              %3451 = arith.cmpi ne, %3450, %3449 : i64
              %3452 = arith.cmpi eq, %3449, %3449 : i64
              %3453 = arith.andi %3451, %3452 : i1
              %3454 = scf.if %3453 -> (i64) {
                scf.yield %3448 : i64
              } else {
                scf.yield %3449 : i64
              }
              %3455 = arith.cmpi ne, %3454, %3449 : i64
              scf.if %3455 {
                func.call @stack_push_pointer(%3454) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%3448) : (i64) -> ()
                %3456 = llvm.mlir.addressof @str248 : !llvm.ptr
                %3457 = func.call @cc_make_function_ref_const(%3456) : (!llvm.ptr) -> i64
                %3458 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%3457, %3458) : (i64, i64) -> ()
              }
              %3459 = func.call @stack_pop_pointer() : () -> i64
              %3460 = func.call @cc_multiple_value_list(%3459) : (i64) -> i64
              %3461 = func.call @cc_t_value() : () -> i64
              %3462 = llvm.mlir.addressof @str249 : !llvm.ptr
              %3463 = arith.constant 38 : i64
              %3464 = func.call @cc_make_string(%3462, %3463) : (!llvm.ptr, i64) -> i64
              %3465 = func.call @cc_nil_value() : () -> i64
              %3466 = func.call @cc_intern(%3464, %3465) : (i64, i64) -> i64
              %3467 = func.call @cc_nil_value() : () -> i64
              %3468 = func.call @cc_cons(%3466, %3467) : (i64, i64) -> i64
              %3469 = func.call @cc_values_pack(%3468) : (i64) -> i64
              %3470 = func.call @cc_set_symbol_value(%3466, %3461) : (i64, i64) -> i64
              %3471 = llvm.mlir.addressof @str250 : !llvm.ptr
              %3472 = arith.constant 39 : i64
              %3473 = func.call @cc_make_string(%3471, %3472) : (!llvm.ptr, i64) -> i64
              %3474 = func.call @cc_nil_value() : () -> i64
              %3475 = func.call @cc_intern(%3473, %3474) : (i64, i64) -> i64
              %3476 = func.call @cc_nil_value() : () -> i64
              %3477 = func.call @cc_cons(%3475, %3476) : (i64, i64) -> i64
              %3478 = func.call @cc_values_pack(%3477) : (i64) -> i64
              %3479 = func.call @cc_set_symbol_value(%3475, %3459) : (i64, i64) -> i64
              %3480 = llvm.mlir.addressof @str251 : !llvm.ptr
              %3481 = arith.constant 40 : i64
              %3482 = func.call @cc_make_string(%3480, %3481) : (!llvm.ptr, i64) -> i64
              %3483 = func.call @cc_nil_value() : () -> i64
              %3484 = func.call @cc_intern(%3482, %3483) : (i64, i64) -> i64
              %3485 = func.call @cc_nil_value() : () -> i64
              %3486 = func.call @cc_cons(%3484, %3485) : (i64, i64) -> i64
              %3487 = func.call @cc_values_pack(%3486) : (i64) -> i64
              %3488 = func.call @cc_set_symbol_value(%3484, %3460) : (i64, i64) -> i64
              func.call @stack_push_pointer(%3459) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %3489 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3489, %3404, %3402, %3403 : i64, i64, i64, i64
          }
          %3490 = func.call @cc_nil_value() : () -> i64
          %3491 = func.call @cc_errorp(%3410#0) : (i64) -> i64
          %3492 = arith.cmpi ne, %3491, %3490 : i64
          %3493:4 = scf.if %3492 -> (i64, i64, i64, i64) {
            scf.yield %3410#0, %3410#1, %3410#2, %3410#3 : i64, i64, i64, i64
          } else {
            func.call @stack_push_pointer(%3405) : (i64) -> ()
            %3494 = func.call @stack_pop_pointer() : () -> i64
            %3495 = func.call @cc_car(%3494) : (i64) -> i64
            func.call @stack_push_pointer(%3495) : (i64) -> ()
            %3496 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3496) : (i64) -> ()
            %3497 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3497, %3410#1, %3496, %3410#3 : i64, i64, i64, i64
          }
          %3498 = func.call @cc_nil_value() : () -> i64
          %3499 = func.call @cc_errorp(%3493#0) : (i64) -> i64
          %3500 = arith.cmpi ne, %3499, %3498 : i64
          %3501:4 = scf.if %3500 -> (i64, i64, i64, i64) {
            scf.yield %3493#0, %3493#1, %3493#2, %3493#3 : i64, i64, i64, i64
          } else {
            func.call @stack_push_pointer(%3493#2) : (i64) -> ()
            %3502 = func.call @stack_pop_pointer() : () -> i64
            %3503 = func.call @cc_nil_value() : () -> i64
            %3504 = func.call @cc_errorp(%3502) : (i64) -> i64
            %3505 = arith.cmpi ne, %3504, %3503 : i64
            %3506 = arith.cmpi eq, %3503, %3503 : i64
            %3507 = arith.andi %3505, %3506 : i1
            %3508 = scf.if %3507 -> (i64) {
              scf.yield %3502 : i64
            } else {
              scf.yield %3503 : i64
            }
            %3509 = arith.cmpi ne, %3508, %3503 : i64
            scf.if %3509 {
              func.call @stack_push_pointer(%3508) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3502) : (i64) -> ()
              %3510 = llvm.mlir.addressof @str252 : !llvm.ptr
              %3511 = func.call @cc_make_function_ref_const(%3510) : (!llvm.ptr) -> i64
              %3512 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3511, %3512) : (i64, i64) -> ()
            }
            %3513 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3513) : (i64) -> ()
            %3514 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3514, %3493#1, %3493#2, %3513 : i64, i64, i64, i64
          }
          %3515 = func.call @cc_nil_value() : () -> i64
          %3516 = func.call @cc_errorp(%3501#0) : (i64) -> i64
          %3517 = arith.cmpi ne, %3516, %3515 : i64
          %3518:4 = scf.if %3517 -> (i64, i64, i64, i64) {
            scf.yield %3501#0, %3501#1, %3501#2, %3501#3 : i64, i64, i64, i64
          } else {
            func.call @stack_push_pointer(%3501#2) : (i64) -> ()
            %3519 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3501#3) : (i64) -> ()
            %3520 = func.call @stack_pop_pointer() : () -> i64
            %3521 = func.call @cc_nil_value() : () -> i64
            %3522 = func.call @cc_errorp(%3520) : (i64) -> i64
            %3523 = arith.cmpi ne, %3522, %3521 : i64
            %3524 = arith.cmpi eq, %3521, %3521 : i64
            %3525 = arith.andi %3523, %3524 : i1
            %3526 = scf.if %3525 -> (i64) {
              scf.yield %3520 : i64
            } else {
              scf.yield %3521 : i64
            }
            %3527 = arith.cmpi ne, %3526, %3521 : i64
            scf.if %3527 {
              func.call @stack_push_pointer(%3526) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3520) : (i64) -> ()
              %3528 = llvm.mlir.addressof @str253 : !llvm.ptr
              %3529 = func.call @cc_make_function_ref_const(%3528) : (!llvm.ptr) -> i64
              %3530 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3529, %3530) : (i64, i64) -> ()
            }
            %3531 = func.call @stack_pop_pointer() : () -> i64
            %3532 = arith.constant 1 : i1
            %3534 = arith.constant 3 : i64
            %3533 = arith.andi %3519, %3534 : i64
            %3535 = arith.constant 0 : i64
            %3536 = arith.cmpi eq, %3533, %3535 : i64
            %3538 = arith.constant 3 : i64
            %3537 = arith.andi %3531, %3538 : i64
            %3539 = arith.constant 0 : i64
            %3540 = arith.cmpi eq, %3537, %3539 : i64
            %3541 = arith.andi %3536, %3540 : i1
            %3542 = scf.if %3541 -> (i1) {
              %3543 = arith.constant 2 : i64
              %3544 = arith.shrsi %3519, %3543 : i64
              %3545 = arith.constant 2 : i64
              %3546 = arith.shrsi %3531, %3545 : i64
              %3547 = arith.cmpi eq, %3544, %3546 : i64
              scf.yield %3547 : i1
            } else {
              %3548 = func.call @cc_eq(%3519, %3531) : (i64, i64) -> i64
              %3549 = func.call @cc_nil_value() : () -> i64
              %3550 = arith.cmpi ne, %3548, %3549 : i64
              scf.yield %3550 : i1
            }
            %3551 = arith.andi %3532, %3542 : i1
            %3552 = func.call @cc_nil_value() : () -> i64
            %3553 = func.call @cc_t_value() : () -> i64
            %3554 = scf.if %3551 -> (i64) {
              scf.yield %3553 : i64
            } else {
              scf.yield %3552 : i64
            }
            func.call @stack_push_pointer(%3554) : (i64) -> ()
            %3555 = func.call @stack_pop_pointer() : () -> i64
            %3556 = func.call @cc_nil_value() : () -> i64
            %3557 = func.call @cc_cons(%3555, %3556) : (i64, i64) -> i64
            %3558 = func.call @cc_not(%3557) : (i64) -> i64
            func.call @stack_push_pointer(%3558) : (i64) -> ()
            %3559 = func.call @stack_pop_pointer() : () -> i64
            %3560 = func.call @cc_nil_value() : () -> i64
            %3561 = arith.cmpi ne, %3559, %3560 : i64
            %3562:2 = scf.if %3561 -> (i64, i64) {
              %3563 = func.call @cc_nil_value() : () -> i64
              %3564 = func.call @cc_nil_value() : () -> i64
              %3565 = func.call @cc_errorp(%3563) : (i64) -> i64
              %3566 = arith.cmpi ne, %3565, %3564 : i64
              %3567:2 = scf.if %3566 -> (i64, i64) {
                scf.yield %3563, %3501#1 : i64, i64
              } else {
                func.call @stack_push_pointer(%3501#1) : (i64) -> ()
                func.call @stack_push_pointer(%3501#2) : (i64) -> ()
                %3568 = func.call @stack_pop_pointer() : () -> i64
                %3569 = func.call @cc_nil_value() : () -> i64
                %3570 = func.call @cc_errorp(%3568) : (i64) -> i64
                %3571 = arith.cmpi ne, %3570, %3569 : i64
                %3572 = arith.cmpi eq, %3569, %3569 : i64
                %3573 = arith.andi %3571, %3572 : i1
                %3574 = scf.if %3573 -> (i64) {
                  scf.yield %3568 : i64
                } else {
                  scf.yield %3569 : i64
                }
                %3575 = arith.cmpi ne, %3574, %3569 : i64
                scf.if %3575 {
                  func.call @stack_push_pointer(%3574) : (i64) -> ()
                } else {
                  %3576 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%3576) : (i64) -> ()
                  func.call @stack_push_pointer(%3568) : (i64) -> ()
                  %3577 = func.call @stack_pop_pointer() : () -> i64
                  %3578 = func.call @stack_pop_pointer() : () -> i64
                  %3579 = func.call @cc_cons(%3577, %3578) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%3579) : (i64) -> ()
                }
                %3580 = func.call @stack_pop_pointer() : () -> i64
                %3581 = func.call @stack_pop_pointer() : () -> i64
                %3582 = func.call @cc_append(%3581, %3580) : (i64, i64) -> i64
                func.call @stack_push_pointer(%3582) : (i64) -> ()
                %3583 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%3583) : (i64) -> ()
                %3584 = func.call @stack_pop_pointer() : () -> i64
                scf.yield %3584, %3583 : i64, i64
              }
              func.call @stack_push_pointer(%3567#0) : (i64) -> ()
              %3585 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %3585, %3567#1 : i64, i64
            } else {
              func.call @stack_push_nil() : () -> ()
              %3586 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %3586, %3501#1 : i64, i64
            }
            func.call @stack_push_pointer(%3562#0) : (i64) -> ()
            %3587 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3587, %3562#1, %3501#2, %3501#3 : i64, i64, i64, i64
          }
          func.call @stack_push_pointer(%3518#0) : (i64) -> ()
          %3588 = func.call @stack_depth() : () -> i64
          %3589 = arith.constant 0 : i64
          %3590 = arith.cmpi sgt, %3588, %3589 : i64
          scf.if %3590 {
            %3591 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%3405) : (i64) -> ()
          %3592 = func.call @stack_pop_pointer() : () -> i64
          %3593 = func.call @cc_cdr(%3592) : (i64) -> i64
          func.call @stack_push_pointer(%3593) : (i64) -> ()
          %3594 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%3594) : (i64) -> ()
          %3595 = func.call @stack_depth() : () -> i64
          %3596 = arith.constant 0 : i64
          %3597 = arith.cmpi sgt, %3595, %3596 : i64
          scf.if %3597 {
            %3598 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %3518#2, %3518#3, %3518#1, %3594 : i64, i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %3599 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%3373#2) : (i64) -> ()
        %3600 = func.call @stack_pop_pointer() : () -> i64
        %3601 = func.call @cc_multiple_value_list(%3600) : (i64) -> i64
        %3602 = llvm.mlir.addressof @str254 : !llvm.ptr
        %3603 = arith.constant 38 : i64
        %3604 = func.call @cc_make_string(%3602, %3603) : (!llvm.ptr, i64) -> i64
        %3605 = func.call @cc_nil_value() : () -> i64
        %3606 = func.call @cc_intern(%3604, %3605) : (i64, i64) -> i64
        %3607 = func.call @cc_nil_value() : () -> i64
        %3608 = func.call @cc_cons(%3606, %3607) : (i64, i64) -> i64
        %3609 = func.call @cc_values_pack(%3608) : (i64) -> i64
        %3610 = func.call @cc_symbol_value(%3606) : (i64) -> i64
        %3611 = llvm.mlir.addressof @str255 : !llvm.ptr
        %3612 = arith.constant 39 : i64
        %3613 = func.call @cc_make_string(%3611, %3612) : (!llvm.ptr, i64) -> i64
        %3614 = func.call @cc_nil_value() : () -> i64
        %3615 = func.call @cc_intern(%3613, %3614) : (i64, i64) -> i64
        %3616 = func.call @cc_nil_value() : () -> i64
        %3617 = func.call @cc_cons(%3615, %3616) : (i64, i64) -> i64
        %3618 = func.call @cc_values_pack(%3617) : (i64) -> i64
        %3619 = func.call @cc_symbol_value(%3615) : (i64) -> i64
        %3620 = llvm.mlir.addressof @str256 : !llvm.ptr
        %3621 = arith.constant 40 : i64
        %3622 = func.call @cc_make_string(%3620, %3621) : (!llvm.ptr, i64) -> i64
        %3623 = func.call @cc_nil_value() : () -> i64
        %3624 = func.call @cc_intern(%3622, %3623) : (i64, i64) -> i64
        %3625 = func.call @cc_nil_value() : () -> i64
        %3626 = func.call @cc_cons(%3624, %3625) : (i64, i64) -> i64
        %3627 = func.call @cc_values_pack(%3626) : (i64) -> i64
        %3628 = func.call @cc_symbol_value(%3624) : (i64) -> i64
        %3629 = func.call @cc_nil_value() : () -> i64
        %3630 = arith.cmpi ne, %3610, %3629 : i64
        %3631 = scf.if %3630 -> (i64) {
          scf.yield %3628 : i64
        } else {
          scf.yield %3601 : i64
        }
        %3632 = func.call @cc_values_pack(%3631) : (i64) -> i64
        func.call @stack_push_pointer(%3632) : (i64) -> ()
        %3633 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3633, %3373#3, %3373#2, %3373#0, %3373#1 : i64, i64, i64, i64, i64
      }
      func.call @stack_push_pointer(%3344#0) : (i64) -> ()
      %3634 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3634 : i64
    }
    func.call @stack_push_pointer(%3259) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455818"() {
    %3799 = func.call @cc_nil_value() : () -> i64
    %3800 = func.call @cc_nil_value() : () -> i64
    %3801 = func.call @cc_errorp(%3799) : (i64) -> i64
    %3802 = arith.cmpi ne, %3801, %3800 : i64
    %3803 = scf.if %3802 -> (i64) {
      scf.yield %3799 : i64
    } else {
      %3804 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3805 = func.call @cc_nil_value() : () -> i64
      %3806 = func.call @cc_nil_value() : () -> i64
      %3807 = func.call @cc_errorp(%3805) : (i64) -> i64
      %3808 = arith.cmpi ne, %3807, %3806 : i64
      %3809 = scf.if %3808 -> (i64) {
        scf.yield %3805 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3810 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%3810) : (i64) -> ()
        %3811 = func.call @stack_pop_pointer() : () -> i64
        %3812 = func.call @cc_nil_value() : () -> i64
        %3813 = func.call @cc_errorp(%3811) : (i64) -> i64
        %3814 = arith.cmpi ne, %3813, %3812 : i64
        %3815 = arith.cmpi eq, %3812, %3812 : i64
        %3816 = arith.andi %3814, %3815 : i1
        %3817 = scf.if %3816 -> (i64) {
          scf.yield %3811 : i64
        } else {
          scf.yield %3812 : i64
        }
        %3818 = arith.cmpi ne, %3817, %3812 : i64
        scf.if %3818 {
          func.call @stack_push_pointer(%3817) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3811) : (i64) -> ()
          %3819 = llvm.mlir.addressof @str270 : !llvm.ptr
          %3820 = func.call @cc_make_function_ref_const(%3819) : (!llvm.ptr) -> i64
          %3821 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3820, %3821) : (i64, i64) -> ()
        }
        %3822 = func.call @stack_pop_pointer() : () -> i64
        %3823 = func.call @cc_errorp(%3822) : (i64) -> i64
        %3824 = func.call @cc_nil_value() : () -> i64
        %3825 = arith.cmpi ne, %3823, %3824 : i64
        scf.if %3825 {
          func.call @stack_push_pointer(%3822) : (i64) -> ()
        } else {
          %3826 = func.call @cc_multiple_value_list(%3822) : (i64) -> i64
          func.call @stack_push_pointer(%3826) : (i64) -> ()
        }
        %3827 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3828 = func.call @stack_pop_pointer() : () -> i64
        %3829 = func.call @cc_nil_value() : () -> i64
        %3830 = func.call @cc_maybe_error_from_multiple_value_list(%3827) : (i64) -> i64
        %3831 = func.call @cc_errorp(%3830) : (i64) -> i64
        %3832 = arith.cmpi ne, %3831, %3829 : i64
        %3833 = arith.cmpi eq, %3829, %3829 : i64
        %3834 = arith.andi %3832, %3833 : i1
        %3835 = scf.if %3834 -> (i64) {
          scf.yield %3830 : i64
        } else {
          scf.yield %3829 : i64
        }
        %3836 = arith.cmpi ne, %3835, %3829 : i64
        scf.if %3836 {
          func.call @stack_push_pointer(%3835) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3837 = func.call @stack_pop_pointer() : () -> i64
          %3838 = func.call @cc_cons(%3828, %3837) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3838) : (i64) -> ()
          %3839 = func.call @stack_pop_pointer() : () -> i64
          %3840 = func.call @cc_cons(%3827, %3839) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3840) : (i64) -> ()
          %3841 = func.call @stack_pop_pointer() : () -> i64
          %3842 = func.call @cc_values_pack(%3841) : (i64) -> i64
          func.call @stack_push_pointer(%3842) : (i64) -> ()
        }
        %3843 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3843 : i64
      }
      func.call @stack_push_pointer(%3809) : (i64) -> ()
      %3844 = func.call @stack_pop_pointer() : () -> i64
      %3845 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3846 = func.call @cc_errorp(%3844) : (i64) -> i64
      %3847 = func.call @cc_nil_value() : () -> i64
      %3848 = arith.cmpi ne, %3846, %3847 : i64
      scf.if %3848 {
        %3849 = func.call @cc_condition_value(%3844) : (i64) -> i64
        %3850 = func.call @cc_values2(%3847, %3849) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3850) : (i64) -> ()
      } else {
        %3851 = func.call @cc_multiple_value_list(%3844) : (i64) -> i64
        %3852 = func.call @cc_values_pack(%3851) : (i64) -> i64
        func.call @stack_push_pointer(%3852) : (i64) -> ()
      }
      %3853 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3853 : i64
    }
    func.call @stack_push_pointer(%3803) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455819"() {
    %4037 = func.call @cc_nil_value() : () -> i64
    %4038 = func.call @cc_nil_value() : () -> i64
    %4039 = func.call @cc_errorp(%4037) : (i64) -> i64
    %4040 = arith.cmpi ne, %4039, %4038 : i64
    %4041 = scf.if %4040 -> (i64) {
      scf.yield %4037 : i64
    } else {
      %4042 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4043 = func.call @cc_nil_value() : () -> i64
      %4044 = func.call @cc_nil_value() : () -> i64
      %4045 = func.call @cc_errorp(%4043) : (i64) -> i64
      %4046 = arith.cmpi ne, %4045, %4044 : i64
      %4047 = scf.if %4046 -> (i64) {
        scf.yield %4043 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4048 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%4048) : (i64) -> ()
        %4049 = func.call @stack_pop_pointer() : () -> i64
        %4050 = func.call @cc_nil_value() : () -> i64
        %4051 = func.call @cc_errorp(%4049) : (i64) -> i64
        %4052 = arith.cmpi ne, %4051, %4050 : i64
        %4053 = arith.cmpi eq, %4050, %4050 : i64
        %4054 = arith.andi %4052, %4053 : i1
        %4055 = scf.if %4054 -> (i64) {
          scf.yield %4049 : i64
        } else {
          scf.yield %4050 : i64
        }
        %4056 = arith.cmpi ne, %4055, %4050 : i64
        scf.if %4056 {
          func.call @stack_push_pointer(%4055) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4049) : (i64) -> ()
          %4057 = llvm.mlir.addressof @str286 : !llvm.ptr
          %4058 = func.call @cc_make_function_ref_const(%4057) : (!llvm.ptr) -> i64
          %4059 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4058, %4059) : (i64, i64) -> ()
        }
        %4060 = func.call @stack_pop_pointer() : () -> i64
        %4061 = func.call @cc_errorp(%4060) : (i64) -> i64
        %4062 = func.call @cc_nil_value() : () -> i64
        %4063 = arith.cmpi ne, %4061, %4062 : i64
        scf.if %4063 {
          func.call @stack_push_pointer(%4060) : (i64) -> ()
        } else {
          %4064 = func.call @cc_multiple_value_list(%4060) : (i64) -> i64
          func.call @stack_push_pointer(%4064) : (i64) -> ()
        }
        %4065 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4066 = func.call @stack_pop_pointer() : () -> i64
        %4067 = func.call @cc_nil_value() : () -> i64
        %4068 = func.call @cc_maybe_error_from_multiple_value_list(%4065) : (i64) -> i64
        %4069 = func.call @cc_errorp(%4068) : (i64) -> i64
        %4070 = arith.cmpi ne, %4069, %4067 : i64
        %4071 = arith.cmpi eq, %4067, %4067 : i64
        %4072 = arith.andi %4070, %4071 : i1
        %4073 = scf.if %4072 -> (i64) {
          scf.yield %4068 : i64
        } else {
          scf.yield %4067 : i64
        }
        %4074 = arith.cmpi ne, %4073, %4067 : i64
        scf.if %4074 {
          func.call @stack_push_pointer(%4073) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4075 = func.call @stack_pop_pointer() : () -> i64
          %4076 = func.call @cc_cons(%4066, %4075) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4076) : (i64) -> ()
          %4077 = func.call @stack_pop_pointer() : () -> i64
          %4078 = func.call @cc_cons(%4065, %4077) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4078) : (i64) -> ()
          %4079 = func.call @stack_pop_pointer() : () -> i64
          %4080 = func.call @cc_values_pack(%4079) : (i64) -> i64
          func.call @stack_push_pointer(%4080) : (i64) -> ()
        }
        %4081 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4081 : i64
      }
      func.call @stack_push_pointer(%4047) : (i64) -> ()
      %4082 = func.call @stack_pop_pointer() : () -> i64
      %4083 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4084 = func.call @cc_errorp(%4082) : (i64) -> i64
      %4085 = func.call @cc_nil_value() : () -> i64
      %4086 = arith.cmpi ne, %4084, %4085 : i64
      scf.if %4086 {
        %4087 = func.call @cc_condition_value(%4082) : (i64) -> i64
        %4088 = func.call @cc_values2(%4085, %4087) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4088) : (i64) -> ()
      } else {
        %4089 = func.call @cc_multiple_value_list(%4082) : (i64) -> i64
        %4090 = func.call @cc_values_pack(%4089) : (i64) -> i64
        func.call @stack_push_pointer(%4090) : (i64) -> ()
      }
      %4091 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4091 : i64
    }
    func.call @stack_push_pointer(%4041) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455820"() {
    %4276 = func.call @cc_nil_value() : () -> i64
    %4277 = func.call @cc_nil_value() : () -> i64
    %4278 = func.call @cc_errorp(%4276) : (i64) -> i64
    %4279 = arith.cmpi ne, %4278, %4277 : i64
    %4280 = scf.if %4279 -> (i64) {
      scf.yield %4276 : i64
    } else {
      %4281 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4282 = func.call @cc_nil_value() : () -> i64
      %4283 = func.call @cc_nil_value() : () -> i64
      %4284 = func.call @cc_errorp(%4282) : (i64) -> i64
      %4285 = arith.cmpi ne, %4284, %4283 : i64
      %4286 = scf.if %4285 -> (i64) {
        scf.yield %4282 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4287 = arith.constant 3.0 : f64
        %4288 = func.call @cc_box_single_float(%4287) : (f64) -> i64
        func.call @stack_push_pointer(%4288) : (i64) -> ()
        %4289 = func.call @stack_pop_pointer() : () -> i64
        %4290 = func.call @cc_nil_value() : () -> i64
        %4291 = func.call @cc_errorp(%4289) : (i64) -> i64
        %4292 = arith.cmpi ne, %4291, %4290 : i64
        %4293 = arith.cmpi eq, %4290, %4290 : i64
        %4294 = arith.andi %4292, %4293 : i1
        %4295 = scf.if %4294 -> (i64) {
          scf.yield %4289 : i64
        } else {
          scf.yield %4290 : i64
        }
        %4296 = arith.cmpi ne, %4295, %4290 : i64
        scf.if %4296 {
          func.call @stack_push_pointer(%4295) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4289) : (i64) -> ()
          %4297 = llvm.mlir.addressof @str302 : !llvm.ptr
          %4298 = func.call @cc_make_function_ref_const(%4297) : (!llvm.ptr) -> i64
          %4299 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4298, %4299) : (i64, i64) -> ()
        }
        %4300 = func.call @stack_pop_pointer() : () -> i64
        %4301 = func.call @cc_errorp(%4300) : (i64) -> i64
        %4302 = func.call @cc_nil_value() : () -> i64
        %4303 = arith.cmpi ne, %4301, %4302 : i64
        scf.if %4303 {
          func.call @stack_push_pointer(%4300) : (i64) -> ()
        } else {
          %4304 = func.call @cc_multiple_value_list(%4300) : (i64) -> i64
          func.call @stack_push_pointer(%4304) : (i64) -> ()
        }
        %4305 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4306 = func.call @stack_pop_pointer() : () -> i64
        %4307 = func.call @cc_nil_value() : () -> i64
        %4308 = func.call @cc_maybe_error_from_multiple_value_list(%4305) : (i64) -> i64
        %4309 = func.call @cc_errorp(%4308) : (i64) -> i64
        %4310 = arith.cmpi ne, %4309, %4307 : i64
        %4311 = arith.cmpi eq, %4307, %4307 : i64
        %4312 = arith.andi %4310, %4311 : i1
        %4313 = scf.if %4312 -> (i64) {
          scf.yield %4308 : i64
        } else {
          scf.yield %4307 : i64
        }
        %4314 = arith.cmpi ne, %4313, %4307 : i64
        scf.if %4314 {
          func.call @stack_push_pointer(%4313) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4315 = func.call @stack_pop_pointer() : () -> i64
          %4316 = func.call @cc_cons(%4306, %4315) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4316) : (i64) -> ()
          %4317 = func.call @stack_pop_pointer() : () -> i64
          %4318 = func.call @cc_cons(%4305, %4317) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4318) : (i64) -> ()
          %4319 = func.call @stack_pop_pointer() : () -> i64
          %4320 = func.call @cc_values_pack(%4319) : (i64) -> i64
          func.call @stack_push_pointer(%4320) : (i64) -> ()
        }
        %4321 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4321 : i64
      }
      func.call @stack_push_pointer(%4286) : (i64) -> ()
      %4322 = func.call @stack_pop_pointer() : () -> i64
      %4323 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4324 = func.call @cc_errorp(%4322) : (i64) -> i64
      %4325 = func.call @cc_nil_value() : () -> i64
      %4326 = arith.cmpi ne, %4324, %4325 : i64
      scf.if %4326 {
        %4327 = func.call @cc_condition_value(%4322) : (i64) -> i64
        %4328 = func.call @cc_values2(%4325, %4327) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4328) : (i64) -> ()
      } else {
        %4329 = func.call @cc_multiple_value_list(%4322) : (i64) -> i64
        %4330 = func.call @cc_values_pack(%4329) : (i64) -> i64
        func.call @stack_push_pointer(%4330) : (i64) -> ()
      }
      %4331 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4331 : i64
    }
    func.call @stack_push_pointer(%4280) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455821"() {
    %4540 = func.call @cc_nil_value() : () -> i64
    %4541 = func.call @cc_nil_value() : () -> i64
    %4542 = func.call @cc_errorp(%4540) : (i64) -> i64
    %4543 = arith.cmpi ne, %4542, %4541 : i64
    %4544 = scf.if %4543 -> (i64) {
      scf.yield %4540 : i64
    } else {
      %4545 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4546 = func.call @cc_nil_value() : () -> i64
      %4547 = func.call @cc_nil_value() : () -> i64
      %4548 = func.call @cc_errorp(%4546) : (i64) -> i64
      %4549 = arith.cmpi ne, %4548, %4547 : i64
      %4550 = scf.if %4549 -> (i64) {
        scf.yield %4546 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4551 = llvm.mlir.addressof @str322 : !llvm.ptr
        %4552 = arith.constant 20 : i64
        %4553 = func.call @cc_make_string(%4551, %4552) : (!llvm.ptr, i64) -> i64
        %4554 = llvm.mlir.addressof @str323 : !llvm.ptr
        %4555 = arith.constant 11 : i64
        %4556 = func.call @cc_make_string(%4554, %4555) : (!llvm.ptr, i64) -> i64
        %4557 = func.call @cc_intern(%4553, %4556) : (i64, i64) -> i64
        %4558 = func.call @cc_nil_value() : () -> i64
        %4559 = func.call @cc_cons(%4557, %4558) : (i64, i64) -> i64
        %4560 = func.call @cc_values_pack(%4559) : (i64) -> i64
        %4561 = func.call @cc_symbol_value(%4557) : (i64) -> i64
        func.call @stack_push_pointer(%4561) : (i64) -> ()
        %4562 = func.call @stack_pop_pointer() : () -> i64
        %4563 = arith.constant 1 : i64
        %4564 = func.call @cc_box_fixnum(%4563) : (i64) -> i64
        %4566 = arith.constant 3 : i64
        %4565 = arith.andi %4562, %4566 : i64
        %4567 = arith.constant 0 : i64
        %4568 = arith.cmpi eq, %4565, %4567 : i64
        %4570 = arith.constant 3 : i64
        %4569 = arith.andi %4564, %4570 : i64
        %4571 = arith.constant 0 : i64
        %4572 = arith.cmpi eq, %4569, %4571 : i64
        %4573 = arith.andi %4568, %4572 : i1
        %4574 = scf.if %4573 -> (i64) {
          %4575 = arith.constant 2 : i64
          %4576 = arith.shrsi %4562, %4575 : i64
          %4577 = arith.constant 2 : i64
          %4578 = arith.shrsi %4564, %4577 : i64
          %4579 = arith.addi %4576, %4578 : i64
          %4580 = arith.constant -2305843009213693952 : i64
          %4581 = arith.constant 2305843009213693951 : i64
          %4582 = arith.cmpi sge, %4579, %4580 : i64
          %4583 = arith.cmpi sle, %4579, %4581 : i64
          %4584 = arith.andi %4582, %4583 : i1
          %4585 = scf.if %4584 -> (i64) {
            %4586 = arith.constant 2 : i64
            %4587 = arith.shli %4579, %4586 : i64
            scf.yield %4587 : i64
          } else {
            %4588 = func.call @cc_add(%4562, %4564) : (i64, i64) -> i64
            scf.yield %4588 : i64
          }
          scf.yield %4585 : i64
        } else {
          %4589 = func.call @cc_add(%4562, %4564) : (i64, i64) -> i64
          scf.yield %4589 : i64
        }
        func.call @stack_push_pointer(%4574) : (i64) -> ()
        %4590 = func.call @stack_pop_pointer() : () -> i64
        %4591 = func.call @cc_nil_value() : () -> i64
        %4592 = func.call @cc_errorp(%4590) : (i64) -> i64
        %4593 = arith.cmpi ne, %4592, %4591 : i64
        %4594 = arith.cmpi eq, %4591, %4591 : i64
        %4595 = arith.andi %4593, %4594 : i1
        %4596 = scf.if %4595 -> (i64) {
          scf.yield %4590 : i64
        } else {
          scf.yield %4591 : i64
        }
        %4597 = arith.cmpi ne, %4596, %4591 : i64
        scf.if %4597 {
          func.call @stack_push_pointer(%4596) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4590) : (i64) -> ()
          %4598 = llvm.mlir.addressof @str324 : !llvm.ptr
          %4599 = func.call @cc_make_function_ref_const(%4598) : (!llvm.ptr) -> i64
          %4600 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4599, %4600) : (i64, i64) -> ()
        }
        %4601 = func.call @stack_pop_pointer() : () -> i64
        %4602 = func.call @cc_errorp(%4601) : (i64) -> i64
        %4603 = func.call @cc_nil_value() : () -> i64
        %4604 = arith.cmpi ne, %4602, %4603 : i64
        scf.if %4604 {
          func.call @stack_push_pointer(%4601) : (i64) -> ()
        } else {
          %4605 = func.call @cc_multiple_value_list(%4601) : (i64) -> i64
          func.call @stack_push_pointer(%4605) : (i64) -> ()
        }
        %4606 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4607 = func.call @stack_pop_pointer() : () -> i64
        %4608 = func.call @cc_nil_value() : () -> i64
        %4609 = func.call @cc_maybe_error_from_multiple_value_list(%4606) : (i64) -> i64
        %4610 = func.call @cc_errorp(%4609) : (i64) -> i64
        %4611 = arith.cmpi ne, %4610, %4608 : i64
        %4612 = arith.cmpi eq, %4608, %4608 : i64
        %4613 = arith.andi %4611, %4612 : i1
        %4614 = scf.if %4613 -> (i64) {
          scf.yield %4609 : i64
        } else {
          scf.yield %4608 : i64
        }
        %4615 = arith.cmpi ne, %4614, %4608 : i64
        scf.if %4615 {
          func.call @stack_push_pointer(%4614) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4616 = func.call @stack_pop_pointer() : () -> i64
          %4617 = func.call @cc_cons(%4607, %4616) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4617) : (i64) -> ()
          %4618 = func.call @stack_pop_pointer() : () -> i64
          %4619 = func.call @cc_cons(%4606, %4618) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4619) : (i64) -> ()
          %4620 = func.call @stack_pop_pointer() : () -> i64
          %4621 = func.call @cc_values_pack(%4620) : (i64) -> i64
          func.call @stack_push_pointer(%4621) : (i64) -> ()
        }
        %4622 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4622 : i64
      }
      func.call @stack_push_pointer(%4550) : (i64) -> ()
      %4623 = func.call @stack_pop_pointer() : () -> i64
      %4624 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4625 = func.call @cc_errorp(%4623) : (i64) -> i64
      %4626 = func.call @cc_nil_value() : () -> i64
      %4627 = arith.cmpi ne, %4625, %4626 : i64
      scf.if %4627 {
        %4628 = func.call @cc_condition_value(%4623) : (i64) -> i64
        %4629 = func.call @cc_values2(%4626, %4628) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4629) : (i64) -> ()
      } else {
        %4630 = func.call @cc_multiple_value_list(%4623) : (i64) -> i64
        %4631 = func.call @cc_values_pack(%4630) : (i64) -> i64
        func.call @stack_push_pointer(%4631) : (i64) -> ()
      }
      %4632 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4632 : i64
    }
    func.call @stack_push_pointer(%4544) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_162741310455822"() {
    %4841 = func.call @cc_nil_value() : () -> i64
    %4842 = func.call @cc_nil_value() : () -> i64
    %4843 = func.call @cc_errorp(%4841) : (i64) -> i64
    %4844 = arith.cmpi ne, %4843, %4842 : i64
    %4845 = scf.if %4844 -> (i64) {
      scf.yield %4841 : i64
    } else {
      %4846 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4847 = func.call @cc_nil_value() : () -> i64
      %4848 = func.call @cc_nil_value() : () -> i64
      %4849 = func.call @cc_errorp(%4847) : (i64) -> i64
      %4850 = arith.cmpi ne, %4849, %4848 : i64
      %4851 = scf.if %4850 -> (i64) {
        scf.yield %4847 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4852 = llvm.mlir.addressof @str344 : !llvm.ptr
        %4853 = arith.constant 20 : i64
        %4854 = func.call @cc_make_string(%4852, %4853) : (!llvm.ptr, i64) -> i64
        %4855 = llvm.mlir.addressof @str345 : !llvm.ptr
        %4856 = arith.constant 11 : i64
        %4857 = func.call @cc_make_string(%4855, %4856) : (!llvm.ptr, i64) -> i64
        %4858 = func.call @cc_intern(%4854, %4857) : (i64, i64) -> i64
        %4859 = func.call @cc_nil_value() : () -> i64
        %4860 = func.call @cc_cons(%4858, %4859) : (i64, i64) -> i64
        %4861 = func.call @cc_values_pack(%4860) : (i64) -> i64
        %4862 = func.call @cc_symbol_value(%4858) : (i64) -> i64
        func.call @stack_push_pointer(%4862) : (i64) -> ()
        %4863 = func.call @stack_pop_pointer() : () -> i64
        %4864 = arith.constant 1 : i64
        %4865 = func.call @cc_box_fixnum(%4864) : (i64) -> i64
        %4867 = arith.constant 3 : i64
        %4866 = arith.andi %4863, %4867 : i64
        %4868 = arith.constant 0 : i64
        %4869 = arith.cmpi eq, %4866, %4868 : i64
        %4871 = arith.constant 3 : i64
        %4870 = arith.andi %4865, %4871 : i64
        %4872 = arith.constant 0 : i64
        %4873 = arith.cmpi eq, %4870, %4872 : i64
        %4874 = arith.andi %4869, %4873 : i1
        %4875 = scf.if %4874 -> (i64) {
          %4876 = arith.constant 2 : i64
          %4877 = arith.shrsi %4863, %4876 : i64
          %4878 = arith.constant 2 : i64
          %4879 = arith.shrsi %4865, %4878 : i64
          %4880 = arith.subi %4877, %4879 : i64
          %4881 = arith.constant -2305843009213693952 : i64
          %4882 = arith.constant 2305843009213693951 : i64
          %4883 = arith.cmpi sge, %4880, %4881 : i64
          %4884 = arith.cmpi sle, %4880, %4882 : i64
          %4885 = arith.andi %4883, %4884 : i1
          %4886 = scf.if %4885 -> (i64) {
            %4887 = arith.constant 2 : i64
            %4888 = arith.shli %4880, %4887 : i64
            scf.yield %4888 : i64
          } else {
            %4889 = func.call @cc_sub(%4863, %4865) : (i64, i64) -> i64
            scf.yield %4889 : i64
          }
          scf.yield %4886 : i64
        } else {
          %4890 = func.call @cc_sub(%4863, %4865) : (i64, i64) -> i64
          scf.yield %4890 : i64
        }
        func.call @stack_push_pointer(%4875) : (i64) -> ()
        %4891 = func.call @stack_pop_pointer() : () -> i64
        %4892 = func.call @cc_nil_value() : () -> i64
        %4893 = func.call @cc_errorp(%4891) : (i64) -> i64
        %4894 = arith.cmpi ne, %4893, %4892 : i64
        %4895 = arith.cmpi eq, %4892, %4892 : i64
        %4896 = arith.andi %4894, %4895 : i1
        %4897 = scf.if %4896 -> (i64) {
          scf.yield %4891 : i64
        } else {
          scf.yield %4892 : i64
        }
        %4898 = arith.cmpi ne, %4897, %4892 : i64
        scf.if %4898 {
          func.call @stack_push_pointer(%4897) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4891) : (i64) -> ()
          %4899 = llvm.mlir.addressof @str346 : !llvm.ptr
          %4900 = func.call @cc_make_function_ref_const(%4899) : (!llvm.ptr) -> i64
          %4901 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4900, %4901) : (i64, i64) -> ()
        }
        %4902 = func.call @stack_pop_pointer() : () -> i64
        %4903 = func.call @cc_errorp(%4902) : (i64) -> i64
        %4904 = func.call @cc_nil_value() : () -> i64
        %4905 = arith.cmpi ne, %4903, %4904 : i64
        scf.if %4905 {
          func.call @stack_push_pointer(%4902) : (i64) -> ()
        } else {
          %4906 = func.call @cc_multiple_value_list(%4902) : (i64) -> i64
          func.call @stack_push_pointer(%4906) : (i64) -> ()
        }
        %4907 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4908 = func.call @stack_pop_pointer() : () -> i64
        %4909 = func.call @cc_nil_value() : () -> i64
        %4910 = func.call @cc_maybe_error_from_multiple_value_list(%4907) : (i64) -> i64
        %4911 = func.call @cc_errorp(%4910) : (i64) -> i64
        %4912 = arith.cmpi ne, %4911, %4909 : i64
        %4913 = arith.cmpi eq, %4909, %4909 : i64
        %4914 = arith.andi %4912, %4913 : i1
        %4915 = scf.if %4914 -> (i64) {
          scf.yield %4910 : i64
        } else {
          scf.yield %4909 : i64
        }
        %4916 = arith.cmpi ne, %4915, %4909 : i64
        scf.if %4916 {
          func.call @stack_push_pointer(%4915) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4917 = func.call @stack_pop_pointer() : () -> i64
          %4918 = func.call @cc_cons(%4908, %4917) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4918) : (i64) -> ()
          %4919 = func.call @stack_pop_pointer() : () -> i64
          %4920 = func.call @cc_cons(%4907, %4919) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4920) : (i64) -> ()
          %4921 = func.call @stack_pop_pointer() : () -> i64
          %4922 = func.call @cc_values_pack(%4921) : (i64) -> i64
          func.call @stack_push_pointer(%4922) : (i64) -> ()
        }
        %4923 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4923 : i64
      }
      func.call @stack_push_pointer(%4851) : (i64) -> ()
      %4924 = func.call @stack_pop_pointer() : () -> i64
      %4925 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4926 = func.call @cc_errorp(%4924) : (i64) -> i64
      %4927 = func.call @cc_nil_value() : () -> i64
      %4928 = arith.cmpi ne, %4926, %4927 : i64
      scf.if %4928 {
        %4929 = func.call @cc_condition_value(%4924) : (i64) -> i64
        %4930 = func.call @cc_values2(%4927, %4929) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4930) : (i64) -> ()
      } else {
        %4931 = func.call @cc_multiple_value_list(%4924) : (i64) -> i64
        %4932 = func.call @cc_values_pack(%4931) : (i64) -> i64
        func.call @stack_push_pointer(%4932) : (i64) -> ()
      }
      %4933 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4933 : i64
    }
    func.call @stack_push_pointer(%4845) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_162741310455808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_162741310455808*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_162741310455808*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("SINGLE-FLOAT-BIT-POSITIVE-CASES\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str6("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str7("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str8("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str9("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str10("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("MOST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str12("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str13("MOST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str14("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str16("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str17("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str18("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str19("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str20("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str21("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str22("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str23("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str24("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str25("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str27("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str28("CONSP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str30("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str32("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str33("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str34("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str35("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str36("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str37("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str38("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str39("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str40("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str41("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str42("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str43("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str44("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str45("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str48("BITS-TO-SINGLE-FLOAT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str49("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str50("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str51("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str52("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str53("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str54("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str55("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str56("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str57("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str58("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str59("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str60("CDR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str61("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str62("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str63("MOST-NEGATIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("MOST-POSITIVE-SINGLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("*__MLIR_BLOCK_RETFLAG_162741310455810*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str68("*__MLIR_BLOCK_RETVALUE_162741310455810*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str69("*__MLIR_BLOCK_RETMVLIST_162741310455810*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str70("*__MLIR_BLOCK_RETFLAG_162741310455808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETFLAG_162741310455810*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str72("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str73("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str74("*__MLIR_BLOCK_RETFLAG_162741310455810*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str75("*__MLIR_BLOCK_RETVALUE_162741310455810*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str76("*__MLIR_BLOCK_RETMVLIST_162741310455810*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str77("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str78("ext:bits-to-single-float\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str79("*__MLIR_BLOCK_RETFLAG_162741310455810*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str80("*__MLIR_BLOCK_RETVALUE_162741310455810*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str81("*__MLIR_BLOCK_RETMVLIST_162741310455810*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str82("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str83("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str84("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str85("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str86("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str87("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str88("SINGLE-FLOAT-BIT-NEGATIVE-1\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str89("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str90("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str91("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str92("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str93("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str94("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str95("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str96("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str97("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str98("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str100("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str101("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str102("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str103("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str104("SINGLE-FLOAT-BIT-NEGATIVE-2\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str105("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str106("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str109("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str110("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str111("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str112("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str113("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str114("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str117("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str118("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str119("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str120("SINGLE-FLOAT-BIT-NEGATIVE-3\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str121("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str122("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str123("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str124("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str125("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str126("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str127("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str128("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str129("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str130("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str132("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str135("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str136("SINGLE-FLOAT-BIT-NEGATIVE-4\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str137("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str138("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str139("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str140("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str141("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str142("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str143("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str144("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str145("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str146("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str148("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str149("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str150("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str151("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str152("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str153("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str154("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str155("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str156("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str157("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str158("SINGLE-FLOAT-BIT-NEGATIVE-5\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str159("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str160("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str161("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str162("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str163("SINGLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str164("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str165("1-\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str166("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str167("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str168("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str169("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str170("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("ext:single-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str172("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str173("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str174("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str175("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str176("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str178("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str179("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str180("DOUBLE-FLOAT-BIT-POSITIVE-CASES\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str181("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str182("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str183("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str184("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str185("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str186("MOST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str187("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str188("MOST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str189("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str190("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str191("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str192("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str193("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str194("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str195("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str196("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str197("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str198("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str199("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str200("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str201("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str202("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str203("CONSP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str204("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str205("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str206("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str207("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str208("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str209("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str210("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str211("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str212("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str213("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str214("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str215("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str216("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str217("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str218("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str219("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str220("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str223("BITS-TO-DOUBLE-FLOAT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str224("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str225("BITS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str226("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str227("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str228("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str229("APPEND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str230("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str231("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str232("ARG\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str233("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str234("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str235("CDR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str236("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str237("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str238("MOST-NEGATIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str239("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str240("MOST-POSITIVE-DOUBLE-FLOAT\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str241("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str242("*__MLIR_BLOCK_RETFLAG_162741310455817*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str243("*__MLIR_BLOCK_RETVALUE_162741310455817*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str244("*__MLIR_BLOCK_RETMVLIST_162741310455817*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str245("*__MLIR_BLOCK_RETFLAG_162741310455808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str246("*__MLIR_BLOCK_RETFLAG_162741310455817*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str247("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str248("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str249("*__MLIR_BLOCK_RETFLAG_162741310455817*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str250("*__MLIR_BLOCK_RETVALUE_162741310455817*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str251("*__MLIR_BLOCK_RETMVLIST_162741310455817*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str252("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str253("ext:bits-to-double-float\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str254("*__MLIR_BLOCK_RETFLAG_162741310455817*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str255("*__MLIR_BLOCK_RETVALUE_162741310455817*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str256("*__MLIR_BLOCK_RETMVLIST_162741310455817*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str257("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str258("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str259("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str260("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str261("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str262("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str263("DOUBLE-FLOAT-BIT-NEGATIVE-1\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str264("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str265("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str266("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str267("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str268("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str269("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str270("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str271("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str272("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str273("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str275("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str276("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str277("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str278("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str279("DOUBLE-FLOAT-BIT-NEGATIVE-2\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str280("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str281("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str282("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str283("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str284("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str285("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str286("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str287("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str288("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str289("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str290("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str291("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str292("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str293("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str294("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str295("DOUBLE-FLOAT-BIT-NEGATIVE-3\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str296("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str297("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str298("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str299("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str300("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str301("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str302("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str303("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str304("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str305("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str306("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str307("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str308("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str309("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str310("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str311("DOUBLE-FLOAT-BIT-NEGATIVE-4\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str312("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str313("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str314("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str315("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str316("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str317("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str318("1+\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str319("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str320("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str321("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str322("MOST-POSITIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str323("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str324("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str325("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str326("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str327("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str329("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str330("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str331("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str332("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str333("DOUBLE-FLOAT-BIT-NEGATIVE-5\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str334("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str335("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str336("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str337("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str338("DOUBLE-FLOAT-TO-BITS\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str339("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str340("1-\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str341("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str342("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str343("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str344("MOST-NEGATIVE-FIXNUM\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str345("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str346("ext:double-float-to-bits\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str347("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str348("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str349("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str350("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str351("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str352("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str353("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str354("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str355("*__MLIR_BLOCK_RETFLAG_162741310455808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str356("*__MLIR_BLOCK_RETMVLIST_162741310455808*\00") : !llvm.array<41 x i8>
}
