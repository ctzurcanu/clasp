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
      %83 = arith.constant 4 : i64
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
      %93 = arith.constant 42 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %95 = func.call @stack_pop_pointer() : () -> i64
      %96 = func.call @stack_pop_pointer() : () -> i64
      %97 = func.call @cc_cons(%96, %95) : (i64, i64) -> i64
      func.call @stack_push_pointer(%97) : (i64) -> ()
      %98 = func.call @stack_pop_pointer() : () -> i64
      %99 = func.call @stack_pop_pointer() : () -> i64
      %100 = func.call @cc_cons(%99, %98) : (i64, i64) -> i64
      func.call @stack_push_pointer(%100) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %101 = func.call @stack_pop_pointer() : () -> i64
      %102 = func.call @stack_pop_pointer() : () -> i64
      %103 = func.call @cc_cons(%102, %101) : (i64, i64) -> i64
      func.call @stack_push_pointer(%103) : (i64) -> ()
      %104 = func.call @stack_pop_pointer() : () -> i64
      %105 = func.call @stack_pop_pointer() : () -> i64
      %106 = func.call @cc_cons(%105, %104) : (i64, i64) -> i64
      func.call @stack_push_pointer(%106) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %107 = func.call @stack_pop_pointer() : () -> i64
      %108 = func.call @stack_pop_pointer() : () -> i64
      %109 = func.call @cc_cons(%108, %107) : (i64, i64) -> i64
      func.call @stack_push_pointer(%109) : (i64) -> ()
      %110 = func.call @stack_pop_pointer() : () -> i64
      %111 = func.call @stack_pop_pointer() : () -> i64
      %112 = func.call @cc_cons(%111, %110) : (i64, i64) -> i64
      func.call @stack_push_pointer(%112) : (i64) -> ()
      %113 = func.call @stack_pop_pointer() : () -> i64
      %142 = arith.constant 269090723725313 : i64
      %143 = arith.constant 0 : i64
      %144 = func.call @cc_make_closure(%142, %143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%144) : (i64) -> ()
      %145 = func.call @stack_pop_pointer() : () -> i64
      %146 = llvm.mlir.addressof @str13 : !llvm.ptr
      %147 = arith.constant 1 : i64
      %148 = func.call @cc_make_string(%146, %147) : (!llvm.ptr, i64) -> i64
      %149 = func.call @cc_nil_value() : () -> i64
      %150 = func.call @cc_intern(%148, %149) : (i64, i64) -> i64
      %151 = func.call @cc_nil_value() : () -> i64
      %152 = func.call @cc_cons(%150, %151) : (i64, i64) -> i64
      %153 = func.call @cc_values_pack(%152) : (i64) -> i64
      func.call @stack_push_pointer(%150) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %154 = func.call @stack_pop_pointer() : () -> i64
      %155 = func.call @stack_pop_pointer() : () -> i64
      %156 = func.call @cc_cons(%155, %154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%156) : (i64) -> ()
      %157 = func.call @stack_pop_pointer() : () -> i64
      %158 = llvm.mlir.addressof @str14 : !llvm.ptr
      %159 = arith.constant 11 : i64
      %160 = func.call @cc_make_string(%158, %159) : (!llvm.ptr, i64) -> i64
      %161 = llvm.mlir.addressof @str15 : !llvm.ptr
      %162 = arith.constant 7 : i64
      %163 = func.call @cc_make_string(%161, %162) : (!llvm.ptr, i64) -> i64
      %164 = func.call @cc_intern(%160, %163) : (i64, i64) -> i64
      %165 = func.call @cc_nil_value() : () -> i64
      %166 = func.call @cc_cons(%164, %165) : (i64, i64) -> i64
      %167 = func.call @cc_values_pack(%166) : (i64) -> i64
      func.call @stack_push_pointer(%164) : (i64) -> ()
      %168 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %169 = func.call @stack_pop_pointer() : () -> i64
      %170 = llvm.mlir.addressof @str16 : !llvm.ptr
      %171 = arith.constant 4 : i64
      %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
      %173 = llvm.mlir.addressof @str17 : !llvm.ptr
      %174 = arith.constant 7 : i64
      %175 = func.call @cc_make_string(%173, %174) : (!llvm.ptr, i64) -> i64
      %176 = func.call @cc_intern(%172, %175) : (i64, i64) -> i64
      %177 = func.call @cc_nil_value() : () -> i64
      %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
      %179 = func.call @cc_values_pack(%178) : (i64) -> i64
      func.call @stack_push_pointer(%176) : (i64) -> ()
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = llvm.mlir.addressof @str18 : !llvm.ptr
      %182 = arith.constant 6 : i64
      %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
      %184 = func.call @cc_nil_value() : () -> i64
      %185 = func.call @cc_intern(%183, %184) : (i64, i64) -> i64
      %186 = func.call @cc_nil_value() : () -> i64
      %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
      %188 = func.call @cc_values_pack(%187) : (i64) -> i64
      func.call @stack_push_pointer(%185) : (i64) -> ()
      %189 = func.call @stack_pop_pointer() : () -> i64
      %190 = func.call @cc_nil_value() : () -> i64
      %191 = func.call @cc_errorp(%65) : (i64) -> i64
      %192 = arith.cmpi ne, %191, %190 : i64
      %193 = arith.cmpi eq, %190, %190 : i64
      %194 = arith.andi %192, %193 : i1
      %195 = scf.if %194 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %190 : i64
      }
      %196 = func.call @cc_errorp(%113) : (i64) -> i64
      %197 = arith.cmpi ne, %196, %190 : i64
      %198 = arith.cmpi eq, %195, %190 : i64
      %199 = arith.andi %197, %198 : i1
      %200 = scf.if %199 -> (i64) {
        scf.yield %113 : i64
      } else {
        scf.yield %195 : i64
      }
      %201 = func.call @cc_errorp(%145) : (i64) -> i64
      %202 = arith.cmpi ne, %201, %190 : i64
      %203 = arith.cmpi eq, %200, %190 : i64
      %204 = arith.andi %202, %203 : i1
      %205 = scf.if %204 -> (i64) {
        scf.yield %145 : i64
      } else {
        scf.yield %200 : i64
      }
      %206 = func.call @cc_errorp(%157) : (i64) -> i64
      %207 = arith.cmpi ne, %206, %190 : i64
      %208 = arith.cmpi eq, %205, %190 : i64
      %209 = arith.andi %207, %208 : i1
      %210 = scf.if %209 -> (i64) {
        scf.yield %157 : i64
      } else {
        scf.yield %205 : i64
      }
      %211 = func.call @cc_errorp(%168) : (i64) -> i64
      %212 = arith.cmpi ne, %211, %190 : i64
      %213 = arith.cmpi eq, %210, %190 : i64
      %214 = arith.andi %212, %213 : i1
      %215 = scf.if %214 -> (i64) {
        scf.yield %168 : i64
      } else {
        scf.yield %210 : i64
      }
      %216 = func.call @cc_errorp(%169) : (i64) -> i64
      %217 = arith.cmpi ne, %216, %190 : i64
      %218 = arith.cmpi eq, %215, %190 : i64
      %219 = arith.andi %217, %218 : i1
      %220 = scf.if %219 -> (i64) {
        scf.yield %169 : i64
      } else {
        scf.yield %215 : i64
      }
      %221 = func.call @cc_errorp(%180) : (i64) -> i64
      %222 = arith.cmpi ne, %221, %190 : i64
      %223 = arith.cmpi eq, %220, %190 : i64
      %224 = arith.andi %222, %223 : i1
      %225 = scf.if %224 -> (i64) {
        scf.yield %180 : i64
      } else {
        scf.yield %220 : i64
      }
      %226 = func.call @cc_errorp(%189) : (i64) -> i64
      %227 = arith.cmpi ne, %226, %190 : i64
      %228 = arith.cmpi eq, %225, %190 : i64
      %229 = arith.andi %227, %228 : i1
      %230 = scf.if %229 -> (i64) {
        scf.yield %189 : i64
      } else {
        scf.yield %225 : i64
      }
      %231 = arith.cmpi ne, %230, %190 : i64
      scf.if %231 {
        func.call @stack_push_pointer(%230) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%113) : (i64) -> ()
        func.call @stack_push_pointer(%145) : (i64) -> ()
        func.call @stack_push_pointer(%157) : (i64) -> ()
        func.call @stack_push_pointer(%168) : (i64) -> ()
        func.call @stack_push_pointer(%169) : (i64) -> ()
        func.call @stack_push_pointer(%180) : (i64) -> ()
        func.call @stack_push_pointer(%189) : (i64) -> ()
        %232 = llvm.mlir.addressof @str19 : !llvm.ptr
        %233 = func.call @cc_make_function_ref_const(%232) : (!llvm.ptr) -> i64
        %234 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%233, %234) : (i64, i64) -> ()
      }
      %235 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %235 : i64
    }
    %236 = func.call @cc_nil_value() : () -> i64
    %237 = func.call @cc_errorp(%56) : (i64) -> i64
    %238 = arith.cmpi ne, %237, %236 : i64
    %239 = scf.if %238 -> (i64) {
      scf.yield %56 : i64
    } else {
      %240 = llvm.mlir.addressof @str20 : !llvm.ptr
      %241 = arith.constant 9 : i64
      %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
      %243 = func.call @cc_nil_value() : () -> i64
      %244 = func.call @cc_intern(%242, %243) : (i64, i64) -> i64
      %245 = func.call @cc_nil_value() : () -> i64
      %246 = func.call @cc_cons(%244, %245) : (i64, i64) -> i64
      %247 = func.call @cc_values_pack(%246) : (i64) -> i64
      func.call @stack_push_pointer(%244) : (i64) -> ()
      %248 = func.call @stack_pop_pointer() : () -> i64
      %249 = llvm.mlir.addressof @str21 : !llvm.ptr
      %250 = arith.constant 6 : i64
      %251 = func.call @cc_make_string(%249, %250) : (!llvm.ptr, i64) -> i64
      %252 = func.call @cc_nil_value() : () -> i64
      %253 = func.call @cc_intern(%251, %252) : (i64, i64) -> i64
      %254 = func.call @cc_nil_value() : () -> i64
      %255 = func.call @cc_cons(%253, %254) : (i64, i64) -> i64
      %256 = func.call @cc_values_pack(%255) : (i64) -> i64
      func.call @stack_push_pointer(%253) : (i64) -> ()
      %257 = llvm.mlir.addressof @str22 : !llvm.ptr
      %258 = arith.constant 3 : i64
      %259 = func.call @cc_make_string(%257, %258) : (!llvm.ptr, i64) -> i64
      %260 = func.call @cc_nil_value() : () -> i64
      %261 = func.call @cc_intern(%259, %260) : (i64, i64) -> i64
      %262 = func.call @cc_nil_value() : () -> i64
      %263 = func.call @cc_cons(%261, %262) : (i64, i64) -> i64
      %264 = func.call @cc_values_pack(%263) : (i64) -> i64
      func.call @stack_push_pointer(%261) : (i64) -> ()
      %265 = llvm.mlir.addressof @str23 : !llvm.ptr
      %266 = arith.constant 4 : i64
      %267 = func.call @cc_make_string(%265, %266) : (!llvm.ptr, i64) -> i64
      %268 = func.call @cc_nil_value() : () -> i64
      %269 = func.call @cc_intern(%267, %268) : (i64, i64) -> i64
      %270 = func.call @cc_nil_value() : () -> i64
      %271 = func.call @cc_cons(%269, %270) : (i64, i64) -> i64
      %272 = func.call @cc_values_pack(%271) : (i64) -> i64
      func.call @stack_push_pointer(%269) : (i64) -> ()
      %273 = llvm.mlir.addressof @str24 : !llvm.ptr
      %274 = arith.constant 42 : i64
      %275 = func.call @cc_make_string(%273, %274) : (!llvm.ptr, i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %282 = func.call @stack_pop_pointer() : () -> i64
      %283 = func.call @stack_pop_pointer() : () -> i64
      %284 = func.call @cc_cons(%283, %282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%284) : (i64) -> ()
      %285 = llvm.mlir.addressof @str25 : !llvm.ptr
      %286 = arith.constant 4 : i64
      %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
      %288 = llvm.mlir.addressof @str26 : !llvm.ptr
      %289 = arith.constant 3 : i64
      %290 = func.call @cc_make_string(%288, %289) : (!llvm.ptr, i64) -> i64
      %291 = func.call @cc_intern(%287, %290) : (i64, i64) -> i64
      %292 = func.call @cc_nil_value() : () -> i64
      %293 = func.call @cc_cons(%291, %292) : (i64, i64) -> i64
      %294 = func.call @cc_values_pack(%293) : (i64) -> i64
      func.call @stack_push_pointer(%291) : (i64) -> ()
      %295 = llvm.mlir.addressof @str27 : !llvm.ptr
      %296 = arith.constant 4 : i64
      %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
      %298 = func.call @cc_nil_value() : () -> i64
      %299 = func.call @cc_intern(%297, %298) : (i64, i64) -> i64
      %300 = func.call @cc_nil_value() : () -> i64
      %301 = func.call @cc_cons(%299, %300) : (i64, i64) -> i64
      %302 = func.call @cc_values_pack(%301) : (i64) -> i64
      func.call @stack_push_pointer(%299) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %303 = func.call @stack_pop_pointer() : () -> i64
      %304 = func.call @stack_pop_pointer() : () -> i64
      %305 = func.call @cc_cons(%304, %303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%305) : (i64) -> ()
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @stack_pop_pointer() : () -> i64
      %308 = func.call @cc_cons(%307, %306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %309 = func.call @stack_pop_pointer() : () -> i64
      %310 = func.call @stack_pop_pointer() : () -> i64
      %311 = func.call @cc_cons(%310, %309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%311) : (i64) -> ()
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
      %357 = arith.constant 269090723725314 : i64
      %358 = arith.constant 0 : i64
      %359 = func.call @cc_make_closure(%357, %358) : (i64, i64) -> i64
      func.call @stack_push_pointer(%359) : (i64) -> ()
      %360 = func.call @stack_pop_pointer() : () -> i64
      %361 = llvm.mlir.addressof @str30 : !llvm.ptr
      %362 = arith.constant 6 : i64
      %363 = func.call @cc_make_string(%361, %362) : (!llvm.ptr, i64) -> i64
      %364 = llvm.mlir.addressof @str31 : !llvm.ptr
      %365 = arith.constant 11 : i64
      %366 = func.call @cc_make_string(%364, %365) : (!llvm.ptr, i64) -> i64
      %367 = func.call @cc_intern(%363, %366) : (i64, i64) -> i64
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
      %375 = llvm.mlir.addressof @str32 : !llvm.ptr
      %376 = arith.constant 11 : i64
      %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
      %378 = llvm.mlir.addressof @str33 : !llvm.ptr
      %379 = arith.constant 7 : i64
      %380 = func.call @cc_make_string(%378, %379) : (!llvm.ptr, i64) -> i64
      %381 = func.call @cc_intern(%377, %380) : (i64, i64) -> i64
      %382 = func.call @cc_nil_value() : () -> i64
      %383 = func.call @cc_cons(%381, %382) : (i64, i64) -> i64
      %384 = func.call @cc_values_pack(%383) : (i64) -> i64
      func.call @stack_push_pointer(%381) : (i64) -> ()
      %385 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %386 = func.call @stack_pop_pointer() : () -> i64
      %387 = llvm.mlir.addressof @str34 : !llvm.ptr
      %388 = arith.constant 4 : i64
      %389 = func.call @cc_make_string(%387, %388) : (!llvm.ptr, i64) -> i64
      %390 = llvm.mlir.addressof @str35 : !llvm.ptr
      %391 = arith.constant 7 : i64
      %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
      %393 = func.call @cc_intern(%389, %392) : (i64, i64) -> i64
      %394 = func.call @cc_nil_value() : () -> i64
      %395 = func.call @cc_cons(%393, %394) : (i64, i64) -> i64
      %396 = func.call @cc_values_pack(%395) : (i64) -> i64
      func.call @stack_push_pointer(%393) : (i64) -> ()
      %397 = func.call @stack_pop_pointer() : () -> i64
      %398 = llvm.mlir.addressof @str36 : !llvm.ptr
      %399 = arith.constant 5 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = func.call @cc_nil_value() : () -> i64
      %402 = func.call @cc_intern(%400, %401) : (i64, i64) -> i64
      %403 = func.call @cc_nil_value() : () -> i64
      %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
      %405 = func.call @cc_values_pack(%404) : (i64) -> i64
      func.call @stack_push_pointer(%402) : (i64) -> ()
      %406 = func.call @stack_pop_pointer() : () -> i64
      %407 = func.call @cc_nil_value() : () -> i64
      %408 = func.call @cc_errorp(%248) : (i64) -> i64
      %409 = arith.cmpi ne, %408, %407 : i64
      %410 = arith.cmpi eq, %407, %407 : i64
      %411 = arith.andi %409, %410 : i1
      %412 = scf.if %411 -> (i64) {
        scf.yield %248 : i64
      } else {
        scf.yield %407 : i64
      }
      %413 = func.call @cc_errorp(%324) : (i64) -> i64
      %414 = arith.cmpi ne, %413, %407 : i64
      %415 = arith.cmpi eq, %412, %407 : i64
      %416 = arith.andi %414, %415 : i1
      %417 = scf.if %416 -> (i64) {
        scf.yield %324 : i64
      } else {
        scf.yield %412 : i64
      }
      %418 = func.call @cc_errorp(%360) : (i64) -> i64
      %419 = arith.cmpi ne, %418, %407 : i64
      %420 = arith.cmpi eq, %417, %407 : i64
      %421 = arith.andi %419, %420 : i1
      %422 = scf.if %421 -> (i64) {
        scf.yield %360 : i64
      } else {
        scf.yield %417 : i64
      }
      %423 = func.call @cc_errorp(%374) : (i64) -> i64
      %424 = arith.cmpi ne, %423, %407 : i64
      %425 = arith.cmpi eq, %422, %407 : i64
      %426 = arith.andi %424, %425 : i1
      %427 = scf.if %426 -> (i64) {
        scf.yield %374 : i64
      } else {
        scf.yield %422 : i64
      }
      %428 = func.call @cc_errorp(%385) : (i64) -> i64
      %429 = arith.cmpi ne, %428, %407 : i64
      %430 = arith.cmpi eq, %427, %407 : i64
      %431 = arith.andi %429, %430 : i1
      %432 = scf.if %431 -> (i64) {
        scf.yield %385 : i64
      } else {
        scf.yield %427 : i64
      }
      %433 = func.call @cc_errorp(%386) : (i64) -> i64
      %434 = arith.cmpi ne, %433, %407 : i64
      %435 = arith.cmpi eq, %432, %407 : i64
      %436 = arith.andi %434, %435 : i1
      %437 = scf.if %436 -> (i64) {
        scf.yield %386 : i64
      } else {
        scf.yield %432 : i64
      }
      %438 = func.call @cc_errorp(%397) : (i64) -> i64
      %439 = arith.cmpi ne, %438, %407 : i64
      %440 = arith.cmpi eq, %437, %407 : i64
      %441 = arith.andi %439, %440 : i1
      %442 = scf.if %441 -> (i64) {
        scf.yield %397 : i64
      } else {
        scf.yield %437 : i64
      }
      %443 = func.call @cc_errorp(%406) : (i64) -> i64
      %444 = arith.cmpi ne, %443, %407 : i64
      %445 = arith.cmpi eq, %442, %407 : i64
      %446 = arith.andi %444, %445 : i1
      %447 = scf.if %446 -> (i64) {
        scf.yield %406 : i64
      } else {
        scf.yield %442 : i64
      }
      %448 = arith.cmpi ne, %447, %407 : i64
      scf.if %448 {
        func.call @stack_push_pointer(%447) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%248) : (i64) -> ()
        func.call @stack_push_pointer(%324) : (i64) -> ()
        func.call @stack_push_pointer(%360) : (i64) -> ()
        func.call @stack_push_pointer(%374) : (i64) -> ()
        func.call @stack_push_pointer(%385) : (i64) -> ()
        func.call @stack_push_pointer(%386) : (i64) -> ()
        func.call @stack_push_pointer(%397) : (i64) -> ()
        func.call @stack_push_pointer(%406) : (i64) -> ()
        %449 = llvm.mlir.addressof @str37 : !llvm.ptr
        %450 = func.call @cc_make_function_ref_const(%449) : (!llvm.ptr) -> i64
        %451 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%450, %451) : (i64, i64) -> ()
      }
      %452 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %452 : i64
    }
    %453 = func.call @cc_nil_value() : () -> i64
    %454 = func.call @cc_errorp(%239) : (i64) -> i64
    %455 = arith.cmpi ne, %454, %453 : i64
    %456 = scf.if %455 -> (i64) {
      scf.yield %239 : i64
    } else {
      %457 = llvm.mlir.addressof @str38 : !llvm.ptr
      %458 = arith.constant 10 : i64
      %459 = func.call @cc_make_string(%457, %458) : (!llvm.ptr, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_intern(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_nil_value() : () -> i64
      %463 = func.call @cc_cons(%461, %462) : (i64, i64) -> i64
      %464 = func.call @cc_values_pack(%463) : (i64) -> i64
      func.call @stack_push_pointer(%461) : (i64) -> ()
      %465 = func.call @stack_pop_pointer() : () -> i64
      %466 = llvm.mlir.addressof @str39 : !llvm.ptr
      %467 = arith.constant 6 : i64
      %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
      %469 = func.call @cc_nil_value() : () -> i64
      %470 = func.call @cc_intern(%468, %469) : (i64, i64) -> i64
      %471 = func.call @cc_nil_value() : () -> i64
      %472 = func.call @cc_cons(%470, %471) : (i64, i64) -> i64
      %473 = func.call @cc_values_pack(%472) : (i64) -> i64
      func.call @stack_push_pointer(%470) : (i64) -> ()
      %474 = llvm.mlir.addressof @str40 : !llvm.ptr
      %475 = arith.constant 3 : i64
      %476 = func.call @cc_make_string(%474, %475) : (!llvm.ptr, i64) -> i64
      %477 = func.call @cc_nil_value() : () -> i64
      %478 = func.call @cc_intern(%476, %477) : (i64, i64) -> i64
      %479 = func.call @cc_nil_value() : () -> i64
      %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
      %481 = func.call @cc_values_pack(%480) : (i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      %482 = llvm.mlir.addressof @str41 : !llvm.ptr
      %483 = arith.constant 4 : i64
      %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
      %485 = func.call @cc_nil_value() : () -> i64
      %486 = func.call @cc_intern(%484, %485) : (i64, i64) -> i64
      %487 = func.call @cc_nil_value() : () -> i64
      %488 = func.call @cc_cons(%486, %487) : (i64, i64) -> i64
      %489 = func.call @cc_values_pack(%488) : (i64) -> i64
      func.call @stack_push_pointer(%486) : (i64) -> ()
      %490 = llvm.mlir.addressof @str42 : !llvm.ptr
      %491 = arith.constant 42 : i64
      %492 = func.call @cc_make_string(%490, %491) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%492) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %493 = func.call @stack_pop_pointer() : () -> i64
      %494 = func.call @stack_pop_pointer() : () -> i64
      %495 = func.call @cc_cons(%494, %493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%495) : (i64) -> ()
      %496 = func.call @stack_pop_pointer() : () -> i64
      %497 = func.call @stack_pop_pointer() : () -> i64
      %498 = func.call @cc_cons(%497, %496) : (i64, i64) -> i64
      func.call @stack_push_pointer(%498) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %499 = func.call @stack_pop_pointer() : () -> i64
      %500 = func.call @stack_pop_pointer() : () -> i64
      %501 = func.call @cc_cons(%500, %499) : (i64, i64) -> i64
      func.call @stack_push_pointer(%501) : (i64) -> ()
      %502 = llvm.mlir.addressof @str43 : !llvm.ptr
      %503 = arith.constant 9 : i64
      %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
      %505 = llvm.mlir.addressof @str44 : !llvm.ptr
      %506 = arith.constant 11 : i64
      %507 = func.call @cc_make_string(%505, %506) : (!llvm.ptr, i64) -> i64
      %508 = func.call @cc_intern(%504, %507) : (i64, i64) -> i64
      %509 = func.call @cc_nil_value() : () -> i64
      %510 = func.call @cc_cons(%508, %509) : (i64, i64) -> i64
      %511 = func.call @cc_values_pack(%510) : (i64) -> i64
      func.call @stack_push_pointer(%508) : (i64) -> ()
      %512 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%512) : (i64) -> ()
      %513 = llvm.mlir.addressof @str45 : !llvm.ptr
      %514 = arith.constant 4 : i64
      %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
      %516 = llvm.mlir.addressof @str46 : !llvm.ptr
      %517 = arith.constant 3 : i64
      %518 = func.call @cc_make_string(%516, %517) : (!llvm.ptr, i64) -> i64
      %519 = func.call @cc_intern(%515, %518) : (i64, i64) -> i64
      %520 = func.call @cc_nil_value() : () -> i64
      %521 = func.call @cc_cons(%519, %520) : (i64, i64) -> i64
      %522 = func.call @cc_values_pack(%521) : (i64) -> i64
      func.call @stack_push_pointer(%519) : (i64) -> ()
      %523 = llvm.mlir.addressof @str47 : !llvm.ptr
      %524 = arith.constant 4 : i64
      %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
      %526 = func.call @cc_nil_value() : () -> i64
      %527 = func.call @cc_intern(%525, %526) : (i64, i64) -> i64
      %528 = func.call @cc_nil_value() : () -> i64
      %529 = func.call @cc_cons(%527, %528) : (i64, i64) -> i64
      %530 = func.call @cc_values_pack(%529) : (i64) -> i64
      func.call @stack_push_pointer(%527) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %531 = func.call @stack_pop_pointer() : () -> i64
      %532 = func.call @stack_pop_pointer() : () -> i64
      %533 = func.call @cc_cons(%532, %531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%533) : (i64) -> ()
      %534 = func.call @stack_pop_pointer() : () -> i64
      %535 = func.call @stack_pop_pointer() : () -> i64
      %536 = func.call @cc_cons(%535, %534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%536) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %537 = func.call @stack_pop_pointer() : () -> i64
      %538 = func.call @stack_pop_pointer() : () -> i64
      %539 = func.call @cc_cons(%538, %537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%539) : (i64) -> ()
      %540 = func.call @stack_pop_pointer() : () -> i64
      %541 = func.call @stack_pop_pointer() : () -> i64
      %542 = func.call @cc_cons(%541, %540) : (i64, i64) -> i64
      func.call @stack_push_pointer(%542) : (i64) -> ()
      %543 = func.call @stack_pop_pointer() : () -> i64
      %544 = func.call @stack_pop_pointer() : () -> i64
      %545 = func.call @cc_cons(%544, %543) : (i64, i64) -> i64
      func.call @stack_push_pointer(%545) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %546 = func.call @stack_pop_pointer() : () -> i64
      %547 = func.call @stack_pop_pointer() : () -> i64
      %548 = func.call @cc_cons(%547, %546) : (i64, i64) -> i64
      func.call @stack_push_pointer(%548) : (i64) -> ()
      %549 = func.call @stack_pop_pointer() : () -> i64
      %550 = func.call @stack_pop_pointer() : () -> i64
      %551 = func.call @cc_cons(%550, %549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%551) : (i64) -> ()
      %552 = func.call @stack_pop_pointer() : () -> i64
      %553 = func.call @stack_pop_pointer() : () -> i64
      %554 = func.call @cc_cons(%553, %552) : (i64, i64) -> i64
      func.call @stack_push_pointer(%554) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %555 = func.call @stack_pop_pointer() : () -> i64
      %556 = func.call @stack_pop_pointer() : () -> i64
      %557 = func.call @cc_cons(%556, %555) : (i64, i64) -> i64
      func.call @stack_push_pointer(%557) : (i64) -> ()
      %558 = func.call @stack_pop_pointer() : () -> i64
      %559 = func.call @stack_pop_pointer() : () -> i64
      %560 = func.call @cc_cons(%559, %558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%560) : (i64) -> ()
      %561 = func.call @stack_pop_pointer() : () -> i64
      %599 = arith.constant 269090723725315 : i64
      %600 = arith.constant 0 : i64
      %601 = func.call @cc_make_closure(%599, %600) : (i64, i64) -> i64
      func.call @stack_push_pointer(%601) : (i64) -> ()
      %602 = func.call @stack_pop_pointer() : () -> i64
      %603 = llvm.mlir.addressof @str50 : !llvm.ptr
      %604 = arith.constant 6 : i64
      %605 = func.call @cc_make_string(%603, %604) : (!llvm.ptr, i64) -> i64
      %606 = llvm.mlir.addressof @str51 : !llvm.ptr
      %607 = arith.constant 11 : i64
      %608 = func.call @cc_make_string(%606, %607) : (!llvm.ptr, i64) -> i64
      %609 = func.call @cc_intern(%605, %608) : (i64, i64) -> i64
      %610 = func.call @cc_nil_value() : () -> i64
      %611 = func.call @cc_cons(%609, %610) : (i64, i64) -> i64
      %612 = func.call @cc_values_pack(%611) : (i64) -> i64
      func.call @stack_push_pointer(%609) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @stack_pop_pointer() : () -> i64
      %615 = func.call @cc_cons(%614, %613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %616 = func.call @stack_pop_pointer() : () -> i64
      %617 = llvm.mlir.addressof @str52 : !llvm.ptr
      %618 = arith.constant 11 : i64
      %619 = func.call @cc_make_string(%617, %618) : (!llvm.ptr, i64) -> i64
      %620 = llvm.mlir.addressof @str53 : !llvm.ptr
      %621 = arith.constant 7 : i64
      %622 = func.call @cc_make_string(%620, %621) : (!llvm.ptr, i64) -> i64
      %623 = func.call @cc_intern(%619, %622) : (i64, i64) -> i64
      %624 = func.call @cc_nil_value() : () -> i64
      %625 = func.call @cc_cons(%623, %624) : (i64, i64) -> i64
      %626 = func.call @cc_values_pack(%625) : (i64) -> i64
      func.call @stack_push_pointer(%623) : (i64) -> ()
      %627 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = llvm.mlir.addressof @str54 : !llvm.ptr
      %630 = arith.constant 4 : i64
      %631 = func.call @cc_make_string(%629, %630) : (!llvm.ptr, i64) -> i64
      %632 = llvm.mlir.addressof @str55 : !llvm.ptr
      %633 = arith.constant 7 : i64
      %634 = func.call @cc_make_string(%632, %633) : (!llvm.ptr, i64) -> i64
      %635 = func.call @cc_intern(%631, %634) : (i64, i64) -> i64
      %636 = func.call @cc_nil_value() : () -> i64
      %637 = func.call @cc_cons(%635, %636) : (i64, i64) -> i64
      %638 = func.call @cc_values_pack(%637) : (i64) -> i64
      func.call @stack_push_pointer(%635) : (i64) -> ()
      %639 = func.call @stack_pop_pointer() : () -> i64
      %640 = llvm.mlir.addressof @str56 : !llvm.ptr
      %641 = arith.constant 5 : i64
      %642 = func.call @cc_make_string(%640, %641) : (!llvm.ptr, i64) -> i64
      %643 = func.call @cc_nil_value() : () -> i64
      %644 = func.call @cc_intern(%642, %643) : (i64, i64) -> i64
      %645 = func.call @cc_nil_value() : () -> i64
      %646 = func.call @cc_cons(%644, %645) : (i64, i64) -> i64
      %647 = func.call @cc_values_pack(%646) : (i64) -> i64
      func.call @stack_push_pointer(%644) : (i64) -> ()
      %648 = func.call @stack_pop_pointer() : () -> i64
      %649 = func.call @cc_nil_value() : () -> i64
      %650 = func.call @cc_errorp(%465) : (i64) -> i64
      %651 = arith.cmpi ne, %650, %649 : i64
      %652 = arith.cmpi eq, %649, %649 : i64
      %653 = arith.andi %651, %652 : i1
      %654 = scf.if %653 -> (i64) {
        scf.yield %465 : i64
      } else {
        scf.yield %649 : i64
      }
      %655 = func.call @cc_errorp(%561) : (i64) -> i64
      %656 = arith.cmpi ne, %655, %649 : i64
      %657 = arith.cmpi eq, %654, %649 : i64
      %658 = arith.andi %656, %657 : i1
      %659 = scf.if %658 -> (i64) {
        scf.yield %561 : i64
      } else {
        scf.yield %654 : i64
      }
      %660 = func.call @cc_errorp(%602) : (i64) -> i64
      %661 = arith.cmpi ne, %660, %649 : i64
      %662 = arith.cmpi eq, %659, %649 : i64
      %663 = arith.andi %661, %662 : i1
      %664 = scf.if %663 -> (i64) {
        scf.yield %602 : i64
      } else {
        scf.yield %659 : i64
      }
      %665 = func.call @cc_errorp(%616) : (i64) -> i64
      %666 = arith.cmpi ne, %665, %649 : i64
      %667 = arith.cmpi eq, %664, %649 : i64
      %668 = arith.andi %666, %667 : i1
      %669 = scf.if %668 -> (i64) {
        scf.yield %616 : i64
      } else {
        scf.yield %664 : i64
      }
      %670 = func.call @cc_errorp(%627) : (i64) -> i64
      %671 = arith.cmpi ne, %670, %649 : i64
      %672 = arith.cmpi eq, %669, %649 : i64
      %673 = arith.andi %671, %672 : i1
      %674 = scf.if %673 -> (i64) {
        scf.yield %627 : i64
      } else {
        scf.yield %669 : i64
      }
      %675 = func.call @cc_errorp(%628) : (i64) -> i64
      %676 = arith.cmpi ne, %675, %649 : i64
      %677 = arith.cmpi eq, %674, %649 : i64
      %678 = arith.andi %676, %677 : i1
      %679 = scf.if %678 -> (i64) {
        scf.yield %628 : i64
      } else {
        scf.yield %674 : i64
      }
      %680 = func.call @cc_errorp(%639) : (i64) -> i64
      %681 = arith.cmpi ne, %680, %649 : i64
      %682 = arith.cmpi eq, %679, %649 : i64
      %683 = arith.andi %681, %682 : i1
      %684 = scf.if %683 -> (i64) {
        scf.yield %639 : i64
      } else {
        scf.yield %679 : i64
      }
      %685 = func.call @cc_errorp(%648) : (i64) -> i64
      %686 = arith.cmpi ne, %685, %649 : i64
      %687 = arith.cmpi eq, %684, %649 : i64
      %688 = arith.andi %686, %687 : i1
      %689 = scf.if %688 -> (i64) {
        scf.yield %648 : i64
      } else {
        scf.yield %684 : i64
      }
      %690 = arith.cmpi ne, %689, %649 : i64
      scf.if %690 {
        func.call @stack_push_pointer(%689) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%465) : (i64) -> ()
        func.call @stack_push_pointer(%561) : (i64) -> ()
        func.call @stack_push_pointer(%602) : (i64) -> ()
        func.call @stack_push_pointer(%616) : (i64) -> ()
        func.call @stack_push_pointer(%627) : (i64) -> ()
        func.call @stack_push_pointer(%628) : (i64) -> ()
        func.call @stack_push_pointer(%639) : (i64) -> ()
        func.call @stack_push_pointer(%648) : (i64) -> ()
        %691 = llvm.mlir.addressof @str57 : !llvm.ptr
        %692 = func.call @cc_make_function_ref_const(%691) : (!llvm.ptr) -> i64
        %693 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%692, %693) : (i64, i64) -> ()
      }
      %694 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %694 : i64
    }
    %695 = func.call @cc_nil_value() : () -> i64
    %696 = func.call @cc_errorp(%456) : (i64) -> i64
    %697 = arith.cmpi ne, %696, %695 : i64
    %698 = scf.if %697 -> (i64) {
      scf.yield %456 : i64
    } else {
      %699 = llvm.mlir.addressof @str58 : !llvm.ptr
      %700 = arith.constant 35 : i64
      %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
      %702 = func.call @cc_nil_value() : () -> i64
      %703 = func.call @cc_intern(%701, %702) : (i64, i64) -> i64
      %704 = func.call @cc_nil_value() : () -> i64
      %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
      %706 = func.call @cc_values_pack(%705) : (i64) -> i64
      func.call @stack_push_pointer(%703) : (i64) -> ()
      %707 = func.call @stack_pop_pointer() : () -> i64
      %708 = llvm.mlir.addressof @str59 : !llvm.ptr
      %709 = arith.constant 3 : i64
      %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
      %711 = func.call @cc_nil_value() : () -> i64
      %712 = func.call @cc_intern(%710, %711) : (i64, i64) -> i64
      %713 = func.call @cc_nil_value() : () -> i64
      %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
      %715 = func.call @cc_values_pack(%714) : (i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %716 = llvm.mlir.addressof @str60 : !llvm.ptr
      %717 = arith.constant 3 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = func.call @cc_nil_value() : () -> i64
      %720 = func.call @cc_intern(%718, %719) : (i64, i64) -> i64
      %721 = func.call @cc_nil_value() : () -> i64
      %722 = func.call @cc_cons(%720, %721) : (i64, i64) -> i64
      %723 = func.call @cc_values_pack(%722) : (i64) -> i64
      func.call @stack_push_pointer(%720) : (i64) -> ()
      %724 = llvm.mlir.addressof @str61 : !llvm.ptr
      %725 = arith.constant 3 : i64
      %726 = func.call @cc_make_string(%724, %725) : (!llvm.ptr, i64) -> i64
      %727 = func.call @cc_nil_value() : () -> i64
      %728 = func.call @cc_intern(%726, %727) : (i64, i64) -> i64
      %729 = func.call @cc_nil_value() : () -> i64
      %730 = func.call @cc_cons(%728, %729) : (i64, i64) -> i64
      %731 = func.call @cc_values_pack(%730) : (i64) -> i64
      func.call @stack_push_pointer(%728) : (i64) -> ()
      %732 = llvm.mlir.addressof @str62 : !llvm.ptr
      %733 = arith.constant 10 : i64
      %734 = func.call @cc_make_string(%732, %733) : (!llvm.ptr, i64) -> i64
      %735 = func.call @cc_nil_value() : () -> i64
      %736 = func.call @cc_intern(%734, %735) : (i64, i64) -> i64
      %737 = func.call @cc_nil_value() : () -> i64
      %738 = func.call @cc_cons(%736, %737) : (i64, i64) -> i64
      %739 = func.call @cc_values_pack(%738) : (i64) -> i64
      func.call @stack_push_pointer(%736) : (i64) -> ()
      %740 = llvm.mlir.addressof @str63 : !llvm.ptr
      %741 = arith.constant 26 : i64
      %742 = func.call @cc_make_string(%740, %741) : (!llvm.ptr, i64) -> i64
      %743 = llvm.mlir.addressof @str64 : !llvm.ptr
      %744 = arith.constant 11 : i64
      %745 = func.call @cc_make_string(%743, %744) : (!llvm.ptr, i64) -> i64
      %746 = func.call @cc_intern(%742, %745) : (i64, i64) -> i64
      %747 = func.call @cc_nil_value() : () -> i64
      %748 = func.call @cc_cons(%746, %747) : (i64, i64) -> i64
      %749 = func.call @cc_values_pack(%748) : (i64) -> i64
      func.call @stack_push_pointer(%746) : (i64) -> ()
      %750 = llvm.mlir.addressof @str65 : !llvm.ptr
      %751 = arith.constant 42 : i64
      %752 = func.call @cc_make_string(%750, %751) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%752) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %753 = func.call @stack_pop_pointer() : () -> i64
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @cc_cons(%754, %753) : (i64, i64) -> i64
      func.call @stack_push_pointer(%755) : (i64) -> ()
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @cc_cons(%757, %756) : (i64, i64) -> i64
      func.call @stack_push_pointer(%758) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %759 = func.call @stack_pop_pointer() : () -> i64
      %760 = func.call @stack_pop_pointer() : () -> i64
      %761 = func.call @cc_cons(%760, %759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%761) : (i64) -> ()
      %762 = func.call @stack_pop_pointer() : () -> i64
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = func.call @cc_cons(%763, %762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%764) : (i64) -> ()
      %765 = llvm.mlir.addressof @str66 : !llvm.ptr
      %766 = arith.constant 7 : i64
      %767 = func.call @cc_make_string(%765, %766) : (!llvm.ptr, i64) -> i64
      %768 = func.call @cc_nil_value() : () -> i64
      %769 = func.call @cc_intern(%767, %768) : (i64, i64) -> i64
      %770 = func.call @cc_nil_value() : () -> i64
      %771 = func.call @cc_cons(%769, %770) : (i64, i64) -> i64
      %772 = func.call @cc_values_pack(%771) : (i64) -> i64
      func.call @stack_push_pointer(%769) : (i64) -> ()
      %773 = llvm.mlir.addressof @str67 : !llvm.ptr
      %774 = arith.constant 42 : i64
      %775 = func.call @cc_make_string(%773, %774) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%775) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %776 = func.call @stack_pop_pointer() : () -> i64
      %777 = func.call @stack_pop_pointer() : () -> i64
      %778 = func.call @cc_cons(%777, %776) : (i64, i64) -> i64
      func.call @stack_push_pointer(%778) : (i64) -> ()
      %779 = func.call @stack_pop_pointer() : () -> i64
      %780 = func.call @stack_pop_pointer() : () -> i64
      %781 = func.call @cc_cons(%780, %779) : (i64, i64) -> i64
      func.call @stack_push_pointer(%781) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %782 = func.call @stack_pop_pointer() : () -> i64
      %783 = func.call @stack_pop_pointer() : () -> i64
      %784 = func.call @cc_cons(%783, %782) : (i64, i64) -> i64
      func.call @stack_push_pointer(%784) : (i64) -> ()
      %785 = func.call @stack_pop_pointer() : () -> i64
      %786 = func.call @stack_pop_pointer() : () -> i64
      %787 = func.call @cc_cons(%786, %785) : (i64, i64) -> i64
      func.call @stack_push_pointer(%787) : (i64) -> ()
      %788 = llvm.mlir.addressof @str68 : !llvm.ptr
      %789 = arith.constant 1 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      %791 = llvm.mlir.addressof @str69 : !llvm.ptr
      %792 = arith.constant 11 : i64
      %793 = func.call @cc_make_string(%791, %792) : (!llvm.ptr, i64) -> i64
      %794 = func.call @cc_intern(%790, %793) : (i64, i64) -> i64
      %795 = func.call @cc_nil_value() : () -> i64
      %796 = func.call @cc_cons(%794, %795) : (i64, i64) -> i64
      %797 = func.call @cc_values_pack(%796) : (i64) -> i64
      func.call @stack_push_pointer(%794) : (i64) -> ()
      %798 = llvm.mlir.addressof @str70 : !llvm.ptr
      %799 = arith.constant 9 : i64
      %800 = func.call @cc_make_string(%798, %799) : (!llvm.ptr, i64) -> i64
      %801 = llvm.mlir.addressof @str71 : !llvm.ptr
      %802 = arith.constant 11 : i64
      %803 = func.call @cc_make_string(%801, %802) : (!llvm.ptr, i64) -> i64
      %804 = func.call @cc_intern(%800, %803) : (i64, i64) -> i64
      %805 = func.call @cc_nil_value() : () -> i64
      %806 = func.call @cc_cons(%804, %805) : (i64, i64) -> i64
      %807 = func.call @cc_values_pack(%806) : (i64) -> i64
      func.call @stack_push_pointer(%804) : (i64) -> ()
      %808 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%808) : (i64) -> ()
      %809 = llvm.mlir.addressof @str72 : !llvm.ptr
      %810 = arith.constant 4 : i64
      %811 = func.call @cc_make_string(%809, %810) : (!llvm.ptr, i64) -> i64
      %812 = llvm.mlir.addressof @str73 : !llvm.ptr
      %813 = arith.constant 3 : i64
      %814 = func.call @cc_make_string(%812, %813) : (!llvm.ptr, i64) -> i64
      %815 = func.call @cc_intern(%811, %814) : (i64, i64) -> i64
      %816 = func.call @cc_nil_value() : () -> i64
      %817 = func.call @cc_cons(%815, %816) : (i64, i64) -> i64
      %818 = func.call @cc_values_pack(%817) : (i64) -> i64
      func.call @stack_push_pointer(%815) : (i64) -> ()
      %819 = llvm.mlir.addressof @str74 : !llvm.ptr
      %820 = arith.constant 10 : i64
      %821 = func.call @cc_make_string(%819, %820) : (!llvm.ptr, i64) -> i64
      %822 = func.call @cc_nil_value() : () -> i64
      %823 = func.call @cc_intern(%821, %822) : (i64, i64) -> i64
      %824 = func.call @cc_nil_value() : () -> i64
      %825 = func.call @cc_cons(%823, %824) : (i64, i64) -> i64
      %826 = func.call @cc_values_pack(%825) : (i64) -> i64
      func.call @stack_push_pointer(%823) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %827 = func.call @stack_pop_pointer() : () -> i64
      %828 = func.call @stack_pop_pointer() : () -> i64
      %829 = func.call @cc_cons(%828, %827) : (i64, i64) -> i64
      func.call @stack_push_pointer(%829) : (i64) -> ()
      %830 = func.call @stack_pop_pointer() : () -> i64
      %831 = func.call @stack_pop_pointer() : () -> i64
      %832 = func.call @cc_cons(%831, %830) : (i64, i64) -> i64
      func.call @stack_push_pointer(%832) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %833 = func.call @stack_pop_pointer() : () -> i64
      %834 = func.call @stack_pop_pointer() : () -> i64
      %835 = func.call @cc_cons(%834, %833) : (i64, i64) -> i64
      func.call @stack_push_pointer(%835) : (i64) -> ()
      %836 = func.call @stack_pop_pointer() : () -> i64
      %837 = func.call @stack_pop_pointer() : () -> i64
      %838 = func.call @cc_cons(%837, %836) : (i64, i64) -> i64
      func.call @stack_push_pointer(%838) : (i64) -> ()
      %839 = func.call @stack_pop_pointer() : () -> i64
      %840 = func.call @stack_pop_pointer() : () -> i64
      %841 = func.call @cc_cons(%840, %839) : (i64, i64) -> i64
      func.call @stack_push_pointer(%841) : (i64) -> ()
      %842 = llvm.mlir.addressof @str75 : !llvm.ptr
      %843 = arith.constant 9 : i64
      %844 = func.call @cc_make_string(%842, %843) : (!llvm.ptr, i64) -> i64
      %845 = llvm.mlir.addressof @str76 : !llvm.ptr
      %846 = arith.constant 11 : i64
      %847 = func.call @cc_make_string(%845, %846) : (!llvm.ptr, i64) -> i64
      %848 = func.call @cc_intern(%844, %847) : (i64, i64) -> i64
      %849 = func.call @cc_nil_value() : () -> i64
      %850 = func.call @cc_cons(%848, %849) : (i64, i64) -> i64
      %851 = func.call @cc_values_pack(%850) : (i64) -> i64
      func.call @stack_push_pointer(%848) : (i64) -> ()
      %852 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%852) : (i64) -> ()
      %853 = llvm.mlir.addressof @str77 : !llvm.ptr
      %854 = arith.constant 4 : i64
      %855 = func.call @cc_make_string(%853, %854) : (!llvm.ptr, i64) -> i64
      %856 = llvm.mlir.addressof @str78 : !llvm.ptr
      %857 = arith.constant 3 : i64
      %858 = func.call @cc_make_string(%856, %857) : (!llvm.ptr, i64) -> i64
      %859 = func.call @cc_intern(%855, %858) : (i64, i64) -> i64
      %860 = func.call @cc_nil_value() : () -> i64
      %861 = func.call @cc_cons(%859, %860) : (i64, i64) -> i64
      %862 = func.call @cc_values_pack(%861) : (i64) -> i64
      func.call @stack_push_pointer(%859) : (i64) -> ()
      %863 = llvm.mlir.addressof @str79 : !llvm.ptr
      %864 = arith.constant 7 : i64
      %865 = func.call @cc_make_string(%863, %864) : (!llvm.ptr, i64) -> i64
      %866 = func.call @cc_nil_value() : () -> i64
      %867 = func.call @cc_intern(%865, %866) : (i64, i64) -> i64
      %868 = func.call @cc_nil_value() : () -> i64
      %869 = func.call @cc_cons(%867, %868) : (i64, i64) -> i64
      %870 = func.call @cc_values_pack(%869) : (i64) -> i64
      func.call @stack_push_pointer(%867) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %871 = func.call @stack_pop_pointer() : () -> i64
      %872 = func.call @stack_pop_pointer() : () -> i64
      %873 = func.call @cc_cons(%872, %871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%873) : (i64) -> ()
      %874 = func.call @stack_pop_pointer() : () -> i64
      %875 = func.call @stack_pop_pointer() : () -> i64
      %876 = func.call @cc_cons(%875, %874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%876) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = func.call @stack_pop_pointer() : () -> i64
      %897 = func.call @cc_cons(%896, %895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%897) : (i64) -> ()
      %898 = func.call @stack_pop_pointer() : () -> i64
      %899 = func.call @stack_pop_pointer() : () -> i64
      %900 = func.call @cc_cons(%899, %898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%900) : (i64) -> ()
      %901 = func.call @stack_pop_pointer() : () -> i64
      %902 = func.call @stack_pop_pointer() : () -> i64
      %903 = func.call @cc_cons(%902, %901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%903) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %904 = func.call @stack_pop_pointer() : () -> i64
      %905 = func.call @stack_pop_pointer() : () -> i64
      %906 = func.call @cc_cons(%905, %904) : (i64, i64) -> i64
      func.call @stack_push_pointer(%906) : (i64) -> ()
      %907 = func.call @stack_pop_pointer() : () -> i64
      %908 = func.call @stack_pop_pointer() : () -> i64
      %909 = func.call @cc_cons(%908, %907) : (i64, i64) -> i64
      func.call @stack_push_pointer(%909) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %910 = func.call @stack_pop_pointer() : () -> i64
      %911 = func.call @stack_pop_pointer() : () -> i64
      %912 = func.call @cc_cons(%911, %910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%912) : (i64) -> ()
      %913 = func.call @stack_pop_pointer() : () -> i64
      %914 = func.call @stack_pop_pointer() : () -> i64
      %915 = func.call @cc_cons(%914, %913) : (i64, i64) -> i64
      func.call @stack_push_pointer(%915) : (i64) -> ()
      %916 = func.call @stack_pop_pointer() : () -> i64
      %1013 = arith.constant 269090723725316 : i64
      %1014 = arith.constant 0 : i64
      %1015 = func.call @cc_make_closure(%1013, %1014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1016 = func.call @stack_pop_pointer() : () -> i64
      %1017 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1018 = arith.constant 1 : i64
      %1019 = func.call @cc_make_string(%1017, %1018) : (!llvm.ptr, i64) -> i64
      %1020 = func.call @cc_nil_value() : () -> i64
      %1021 = func.call @cc_intern(%1019, %1020) : (i64, i64) -> i64
      %1022 = func.call @cc_nil_value() : () -> i64
      %1023 = func.call @cc_cons(%1021, %1022) : (i64, i64) -> i64
      %1024 = func.call @cc_values_pack(%1023) : (i64) -> i64
      func.call @stack_push_pointer(%1021) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1025 = func.call @stack_pop_pointer() : () -> i64
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @cc_cons(%1026, %1025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1027) : (i64) -> ()
      %1028 = func.call @stack_pop_pointer() : () -> i64
      %1029 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1030 = arith.constant 11 : i64
      %1031 = func.call @cc_make_string(%1029, %1030) : (!llvm.ptr, i64) -> i64
      %1032 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1033 = arith.constant 7 : i64
      %1034 = func.call @cc_make_string(%1032, %1033) : (!llvm.ptr, i64) -> i64
      %1035 = func.call @cc_intern(%1031, %1034) : (i64, i64) -> i64
      %1036 = func.call @cc_nil_value() : () -> i64
      %1037 = func.call @cc_cons(%1035, %1036) : (i64, i64) -> i64
      %1038 = func.call @cc_values_pack(%1037) : (i64) -> i64
      func.call @stack_push_pointer(%1035) : (i64) -> ()
      %1039 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1040 = func.call @stack_pop_pointer() : () -> i64
      %1041 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1042 = arith.constant 4 : i64
      %1043 = func.call @cc_make_string(%1041, %1042) : (!llvm.ptr, i64) -> i64
      %1044 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1045 = arith.constant 7 : i64
      %1046 = func.call @cc_make_string(%1044, %1045) : (!llvm.ptr, i64) -> i64
      %1047 = func.call @cc_intern(%1043, %1046) : (i64, i64) -> i64
      %1048 = func.call @cc_nil_value() : () -> i64
      %1049 = func.call @cc_cons(%1047, %1048) : (i64, i64) -> i64
      %1050 = func.call @cc_values_pack(%1049) : (i64) -> i64
      func.call @stack_push_pointer(%1047) : (i64) -> ()
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1052 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1053 = arith.constant 6 : i64
      %1054 = func.call @cc_make_string(%1052, %1053) : (!llvm.ptr, i64) -> i64
      %1055 = func.call @cc_nil_value() : () -> i64
      %1056 = func.call @cc_intern(%1054, %1055) : (i64, i64) -> i64
      %1057 = func.call @cc_nil_value() : () -> i64
      %1058 = func.call @cc_cons(%1056, %1057) : (i64, i64) -> i64
      %1059 = func.call @cc_values_pack(%1058) : (i64) -> i64
      func.call @stack_push_pointer(%1056) : (i64) -> ()
      %1060 = func.call @stack_pop_pointer() : () -> i64
      %1061 = func.call @cc_nil_value() : () -> i64
      %1062 = func.call @cc_errorp(%707) : (i64) -> i64
      %1063 = arith.cmpi ne, %1062, %1061 : i64
      %1064 = arith.cmpi eq, %1061, %1061 : i64
      %1065 = arith.andi %1063, %1064 : i1
      %1066 = scf.if %1065 -> (i64) {
        scf.yield %707 : i64
      } else {
        scf.yield %1061 : i64
      }
      %1067 = func.call @cc_errorp(%916) : (i64) -> i64
      %1068 = arith.cmpi ne, %1067, %1061 : i64
      %1069 = arith.cmpi eq, %1066, %1061 : i64
      %1070 = arith.andi %1068, %1069 : i1
      %1071 = scf.if %1070 -> (i64) {
        scf.yield %916 : i64
      } else {
        scf.yield %1066 : i64
      }
      %1072 = func.call @cc_errorp(%1016) : (i64) -> i64
      %1073 = arith.cmpi ne, %1072, %1061 : i64
      %1074 = arith.cmpi eq, %1071, %1061 : i64
      %1075 = arith.andi %1073, %1074 : i1
      %1076 = scf.if %1075 -> (i64) {
        scf.yield %1016 : i64
      } else {
        scf.yield %1071 : i64
      }
      %1077 = func.call @cc_errorp(%1028) : (i64) -> i64
      %1078 = arith.cmpi ne, %1077, %1061 : i64
      %1079 = arith.cmpi eq, %1076, %1061 : i64
      %1080 = arith.andi %1078, %1079 : i1
      %1081 = scf.if %1080 -> (i64) {
        scf.yield %1028 : i64
      } else {
        scf.yield %1076 : i64
      }
      %1082 = func.call @cc_errorp(%1039) : (i64) -> i64
      %1083 = arith.cmpi ne, %1082, %1061 : i64
      %1084 = arith.cmpi eq, %1081, %1061 : i64
      %1085 = arith.andi %1083, %1084 : i1
      %1086 = scf.if %1085 -> (i64) {
        scf.yield %1039 : i64
      } else {
        scf.yield %1081 : i64
      }
      %1087 = func.call @cc_errorp(%1040) : (i64) -> i64
      %1088 = arith.cmpi ne, %1087, %1061 : i64
      %1089 = arith.cmpi eq, %1086, %1061 : i64
      %1090 = arith.andi %1088, %1089 : i1
      %1091 = scf.if %1090 -> (i64) {
        scf.yield %1040 : i64
      } else {
        scf.yield %1086 : i64
      }
      %1092 = func.call @cc_errorp(%1051) : (i64) -> i64
      %1093 = arith.cmpi ne, %1092, %1061 : i64
      %1094 = arith.cmpi eq, %1091, %1061 : i64
      %1095 = arith.andi %1093, %1094 : i1
      %1096 = scf.if %1095 -> (i64) {
        scf.yield %1051 : i64
      } else {
        scf.yield %1091 : i64
      }
      %1097 = func.call @cc_errorp(%1060) : (i64) -> i64
      %1098 = arith.cmpi ne, %1097, %1061 : i64
      %1099 = arith.cmpi eq, %1096, %1061 : i64
      %1100 = arith.andi %1098, %1099 : i1
      %1101 = scf.if %1100 -> (i64) {
        scf.yield %1060 : i64
      } else {
        scf.yield %1096 : i64
      }
      %1102 = arith.cmpi ne, %1101, %1061 : i64
      scf.if %1102 {
        func.call @stack_push_pointer(%1101) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%707) : (i64) -> ()
        func.call @stack_push_pointer(%916) : (i64) -> ()
        func.call @stack_push_pointer(%1016) : (i64) -> ()
        func.call @stack_push_pointer(%1028) : (i64) -> ()
        func.call @stack_push_pointer(%1039) : (i64) -> ()
        func.call @stack_push_pointer(%1040) : (i64) -> ()
        func.call @stack_push_pointer(%1051) : (i64) -> ()
        func.call @stack_push_pointer(%1060) : (i64) -> ()
        %1103 = llvm.mlir.addressof @str91 : !llvm.ptr
        %1104 = func.call @cc_make_function_ref_const(%1103) : (!llvm.ptr) -> i64
        %1105 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1104, %1105) : (i64, i64) -> ()
      }
      %1106 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1106 : i64
    }
    %1107 = func.call @cc_nil_value() : () -> i64
    %1108 = func.call @cc_errorp(%698) : (i64) -> i64
    %1109 = arith.cmpi ne, %1108, %1107 : i64
    %1110 = scf.if %1109 -> (i64) {
      scf.yield %698 : i64
    } else {
      %1111 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1112 = arith.constant 14 : i64
      %1113 = func.call @cc_make_string(%1111, %1112) : (!llvm.ptr, i64) -> i64
      %1114 = func.call @cc_nil_value() : () -> i64
      %1115 = func.call @cc_intern(%1113, %1114) : (i64, i64) -> i64
      %1116 = func.call @cc_nil_value() : () -> i64
      %1117 = func.call @cc_cons(%1115, %1116) : (i64, i64) -> i64
      %1118 = func.call @cc_values_pack(%1117) : (i64) -> i64
      func.call @stack_push_pointer(%1115) : (i64) -> ()
      %1119 = func.call @stack_pop_pointer() : () -> i64
      %1120 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1121 = arith.constant 3 : i64
      %1122 = func.call @cc_make_string(%1120, %1121) : (!llvm.ptr, i64) -> i64
      %1123 = func.call @cc_nil_value() : () -> i64
      %1124 = func.call @cc_intern(%1122, %1123) : (i64, i64) -> i64
      %1125 = func.call @cc_nil_value() : () -> i64
      %1126 = func.call @cc_cons(%1124, %1125) : (i64, i64) -> i64
      %1127 = func.call @cc_values_pack(%1126) : (i64) -> i64
      func.call @stack_push_pointer(%1124) : (i64) -> ()
      %1128 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1129 = arith.constant 3 : i64
      %1130 = func.call @cc_make_string(%1128, %1129) : (!llvm.ptr, i64) -> i64
      %1131 = func.call @cc_nil_value() : () -> i64
      %1132 = func.call @cc_intern(%1130, %1131) : (i64, i64) -> i64
      %1133 = func.call @cc_nil_value() : () -> i64
      %1134 = func.call @cc_cons(%1132, %1133) : (i64, i64) -> i64
      %1135 = func.call @cc_values_pack(%1134) : (i64) -> i64
      func.call @stack_push_pointer(%1132) : (i64) -> ()
      %1136 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1137 = arith.constant 9 : i64
      %1138 = func.call @cc_make_string(%1136, %1137) : (!llvm.ptr, i64) -> i64
      %1139 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1140 = arith.constant 11 : i64
      %1141 = func.call @cc_make_string(%1139, %1140) : (!llvm.ptr, i64) -> i64
      %1142 = func.call @cc_intern(%1138, %1141) : (i64, i64) -> i64
      %1143 = func.call @cc_nil_value() : () -> i64
      %1144 = func.call @cc_cons(%1142, %1143) : (i64, i64) -> i64
      %1145 = func.call @cc_values_pack(%1144) : (i64) -> i64
      func.call @stack_push_pointer(%1142) : (i64) -> ()
      %1146 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1146) : (i64) -> ()
      %1147 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1148 = arith.constant 4 : i64
      %1149 = func.call @cc_make_string(%1147, %1148) : (!llvm.ptr, i64) -> i64
      %1150 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1151 = arith.constant 3 : i64
      %1152 = func.call @cc_make_string(%1150, %1151) : (!llvm.ptr, i64) -> i64
      %1153 = func.call @cc_intern(%1149, %1152) : (i64, i64) -> i64
      %1154 = func.call @cc_nil_value() : () -> i64
      %1155 = func.call @cc_cons(%1153, %1154) : (i64, i64) -> i64
      %1156 = func.call @cc_values_pack(%1155) : (i64) -> i64
      func.call @stack_push_pointer(%1153) : (i64) -> ()
      %1157 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1158 = arith.constant 42 : i64
      %1159 = func.call @cc_make_string(%1157, %1158) : (!llvm.ptr, i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %1181 = func.call @stack_pop_pointer() : () -> i64
      %1182 = func.call @stack_pop_pointer() : () -> i64
      %1183 = func.call @cc_cons(%1182, %1181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1183) : (i64) -> ()
      %1184 = func.call @stack_pop_pointer() : () -> i64
      %1185 = func.call @stack_pop_pointer() : () -> i64
      %1186 = func.call @cc_cons(%1185, %1184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1186) : (i64) -> ()
      %1187 = func.call @stack_pop_pointer() : () -> i64
      %1221 = arith.constant 269090723725317 : i64
      %1222 = arith.constant 0 : i64
      %1223 = func.call @cc_make_closure(%1221, %1222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1223) : (i64) -> ()
      %1224 = func.call @stack_pop_pointer() : () -> i64
      %1225 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1226 = arith.constant 1 : i64
      %1227 = func.call @cc_make_string(%1225, %1226) : (!llvm.ptr, i64) -> i64
      %1228 = func.call @cc_nil_value() : () -> i64
      %1229 = func.call @cc_intern(%1227, %1228) : (i64, i64) -> i64
      %1230 = func.call @cc_nil_value() : () -> i64
      %1231 = func.call @cc_cons(%1229, %1230) : (i64, i64) -> i64
      %1232 = func.call @cc_values_pack(%1231) : (i64) -> i64
      func.call @stack_push_pointer(%1229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1233 = func.call @stack_pop_pointer() : () -> i64
      %1234 = func.call @stack_pop_pointer() : () -> i64
      %1235 = func.call @cc_cons(%1234, %1233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1235) : (i64) -> ()
      %1236 = func.call @stack_pop_pointer() : () -> i64
      %1237 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1238 = arith.constant 11 : i64
      %1239 = func.call @cc_make_string(%1237, %1238) : (!llvm.ptr, i64) -> i64
      %1240 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1241 = arith.constant 7 : i64
      %1242 = func.call @cc_make_string(%1240, %1241) : (!llvm.ptr, i64) -> i64
      %1243 = func.call @cc_intern(%1239, %1242) : (i64, i64) -> i64
      %1244 = func.call @cc_nil_value() : () -> i64
      %1245 = func.call @cc_cons(%1243, %1244) : (i64, i64) -> i64
      %1246 = func.call @cc_values_pack(%1245) : (i64) -> i64
      func.call @stack_push_pointer(%1243) : (i64) -> ()
      %1247 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1248 = func.call @stack_pop_pointer() : () -> i64
      %1249 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1250 = arith.constant 4 : i64
      %1251 = func.call @cc_make_string(%1249, %1250) : (!llvm.ptr, i64) -> i64
      %1252 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1253 = arith.constant 7 : i64
      %1254 = func.call @cc_make_string(%1252, %1253) : (!llvm.ptr, i64) -> i64
      %1255 = func.call @cc_intern(%1251, %1254) : (i64, i64) -> i64
      %1256 = func.call @cc_nil_value() : () -> i64
      %1257 = func.call @cc_cons(%1255, %1256) : (i64, i64) -> i64
      %1258 = func.call @cc_values_pack(%1257) : (i64) -> i64
      func.call @stack_push_pointer(%1255) : (i64) -> ()
      %1259 = func.call @stack_pop_pointer() : () -> i64
      %1260 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1261 = arith.constant 6 : i64
      %1262 = func.call @cc_make_string(%1260, %1261) : (!llvm.ptr, i64) -> i64
      %1263 = func.call @cc_nil_value() : () -> i64
      %1264 = func.call @cc_intern(%1262, %1263) : (i64, i64) -> i64
      %1265 = func.call @cc_nil_value() : () -> i64
      %1266 = func.call @cc_cons(%1264, %1265) : (i64, i64) -> i64
      %1267 = func.call @cc_values_pack(%1266) : (i64) -> i64
      func.call @stack_push_pointer(%1264) : (i64) -> ()
      %1268 = func.call @stack_pop_pointer() : () -> i64
      %1269 = func.call @cc_nil_value() : () -> i64
      %1270 = func.call @cc_errorp(%1119) : (i64) -> i64
      %1271 = arith.cmpi ne, %1270, %1269 : i64
      %1272 = arith.cmpi eq, %1269, %1269 : i64
      %1273 = arith.andi %1271, %1272 : i1
      %1274 = scf.if %1273 -> (i64) {
        scf.yield %1119 : i64
      } else {
        scf.yield %1269 : i64
      }
      %1275 = func.call @cc_errorp(%1187) : (i64) -> i64
      %1276 = arith.cmpi ne, %1275, %1269 : i64
      %1277 = arith.cmpi eq, %1274, %1269 : i64
      %1278 = arith.andi %1276, %1277 : i1
      %1279 = scf.if %1278 -> (i64) {
        scf.yield %1187 : i64
      } else {
        scf.yield %1274 : i64
      }
      %1280 = func.call @cc_errorp(%1224) : (i64) -> i64
      %1281 = arith.cmpi ne, %1280, %1269 : i64
      %1282 = arith.cmpi eq, %1279, %1269 : i64
      %1283 = arith.andi %1281, %1282 : i1
      %1284 = scf.if %1283 -> (i64) {
        scf.yield %1224 : i64
      } else {
        scf.yield %1279 : i64
      }
      %1285 = func.call @cc_errorp(%1236) : (i64) -> i64
      %1286 = arith.cmpi ne, %1285, %1269 : i64
      %1287 = arith.cmpi eq, %1284, %1269 : i64
      %1288 = arith.andi %1286, %1287 : i1
      %1289 = scf.if %1288 -> (i64) {
        scf.yield %1236 : i64
      } else {
        scf.yield %1284 : i64
      }
      %1290 = func.call @cc_errorp(%1247) : (i64) -> i64
      %1291 = arith.cmpi ne, %1290, %1269 : i64
      %1292 = arith.cmpi eq, %1289, %1269 : i64
      %1293 = arith.andi %1291, %1292 : i1
      %1294 = scf.if %1293 -> (i64) {
        scf.yield %1247 : i64
      } else {
        scf.yield %1289 : i64
      }
      %1295 = func.call @cc_errorp(%1248) : (i64) -> i64
      %1296 = arith.cmpi ne, %1295, %1269 : i64
      %1297 = arith.cmpi eq, %1294, %1269 : i64
      %1298 = arith.andi %1296, %1297 : i1
      %1299 = scf.if %1298 -> (i64) {
        scf.yield %1248 : i64
      } else {
        scf.yield %1294 : i64
      }
      %1300 = func.call @cc_errorp(%1259) : (i64) -> i64
      %1301 = arith.cmpi ne, %1300, %1269 : i64
      %1302 = arith.cmpi eq, %1299, %1269 : i64
      %1303 = arith.andi %1301, %1302 : i1
      %1304 = scf.if %1303 -> (i64) {
        scf.yield %1259 : i64
      } else {
        scf.yield %1299 : i64
      }
      %1305 = func.call @cc_errorp(%1268) : (i64) -> i64
      %1306 = arith.cmpi ne, %1305, %1269 : i64
      %1307 = arith.cmpi eq, %1304, %1269 : i64
      %1308 = arith.andi %1306, %1307 : i1
      %1309 = scf.if %1308 -> (i64) {
        scf.yield %1268 : i64
      } else {
        scf.yield %1304 : i64
      }
      %1310 = arith.cmpi ne, %1309, %1269 : i64
      scf.if %1310 {
        func.call @stack_push_pointer(%1309) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1119) : (i64) -> ()
        func.call @stack_push_pointer(%1187) : (i64) -> ()
        func.call @stack_push_pointer(%1224) : (i64) -> ()
        func.call @stack_push_pointer(%1236) : (i64) -> ()
        func.call @stack_push_pointer(%1247) : (i64) -> ()
        func.call @stack_push_pointer(%1248) : (i64) -> ()
        func.call @stack_push_pointer(%1259) : (i64) -> ()
        func.call @stack_push_pointer(%1268) : (i64) -> ()
        %1311 = llvm.mlir.addressof @str108 : !llvm.ptr
        %1312 = func.call @cc_make_function_ref_const(%1311) : (!llvm.ptr) -> i64
        %1313 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1312, %1313) : (i64, i64) -> ()
      }
      %1314 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1314 : i64
    }
    %1315 = func.call @cc_nil_value() : () -> i64
    %1316 = func.call @cc_errorp(%1110) : (i64) -> i64
    %1317 = arith.cmpi ne, %1316, %1315 : i64
    %1318 = scf.if %1317 -> (i64) {
      scf.yield %1110 : i64
    } else {
      %1319 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1320 = arith.constant 9 : i64
      %1321 = func.call @cc_make_string(%1319, %1320) : (!llvm.ptr, i64) -> i64
      %1322 = func.call @cc_nil_value() : () -> i64
      %1323 = func.call @cc_intern(%1321, %1322) : (i64, i64) -> i64
      %1324 = func.call @cc_nil_value() : () -> i64
      %1325 = func.call @cc_cons(%1323, %1324) : (i64, i64) -> i64
      %1326 = func.call @cc_values_pack(%1325) : (i64) -> i64
      func.call @stack_push_pointer(%1323) : (i64) -> ()
      %1327 = func.call @stack_pop_pointer() : () -> i64
      %1328 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1329 = arith.constant 3 : i64
      %1330 = func.call @cc_make_string(%1328, %1329) : (!llvm.ptr, i64) -> i64
      %1331 = func.call @cc_nil_value() : () -> i64
      %1332 = func.call @cc_intern(%1330, %1331) : (i64, i64) -> i64
      %1333 = func.call @cc_nil_value() : () -> i64
      %1334 = func.call @cc_cons(%1332, %1333) : (i64, i64) -> i64
      %1335 = func.call @cc_values_pack(%1334) : (i64) -> i64
      func.call @stack_push_pointer(%1332) : (i64) -> ()
      %1336 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1337 = arith.constant 3 : i64
      %1338 = func.call @cc_make_string(%1336, %1337) : (!llvm.ptr, i64) -> i64
      %1339 = func.call @cc_nil_value() : () -> i64
      %1340 = func.call @cc_intern(%1338, %1339) : (i64, i64) -> i64
      %1341 = func.call @cc_nil_value() : () -> i64
      %1342 = func.call @cc_cons(%1340, %1341) : (i64, i64) -> i64
      %1343 = func.call @cc_values_pack(%1342) : (i64) -> i64
      func.call @stack_push_pointer(%1340) : (i64) -> ()
      %1344 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1345 = arith.constant 3 : i64
      %1346 = func.call @cc_make_string(%1344, %1345) : (!llvm.ptr, i64) -> i64
      %1347 = func.call @cc_nil_value() : () -> i64
      %1348 = func.call @cc_intern(%1346, %1347) : (i64, i64) -> i64
      %1349 = func.call @cc_nil_value() : () -> i64
      %1350 = func.call @cc_cons(%1348, %1349) : (i64, i64) -> i64
      %1351 = func.call @cc_values_pack(%1350) : (i64) -> i64
      func.call @stack_push_pointer(%1348) : (i64) -> ()
      %1352 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1353 = arith.constant 4 : i64
      %1354 = func.call @cc_make_string(%1352, %1353) : (!llvm.ptr, i64) -> i64
      %1355 = func.call @cc_nil_value() : () -> i64
      %1356 = func.call @cc_intern(%1354, %1355) : (i64, i64) -> i64
      %1357 = func.call @cc_nil_value() : () -> i64
      %1358 = func.call @cc_cons(%1356, %1357) : (i64, i64) -> i64
      %1359 = func.call @cc_values_pack(%1358) : (i64) -> i64
      func.call @stack_push_pointer(%1356) : (i64) -> ()
      %1360 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1361 = arith.constant 42 : i64
      %1362 = func.call @cc_make_string(%1360, %1361) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1362) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1363 = func.call @stack_pop_pointer() : () -> i64
      %1364 = func.call @stack_pop_pointer() : () -> i64
      %1365 = func.call @cc_cons(%1364, %1363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1365) : (i64) -> ()
      %1366 = func.call @stack_pop_pointer() : () -> i64
      %1367 = func.call @stack_pop_pointer() : () -> i64
      %1368 = func.call @cc_cons(%1367, %1366) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1368) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1369 = func.call @stack_pop_pointer() : () -> i64
      %1370 = func.call @stack_pop_pointer() : () -> i64
      %1371 = func.call @cc_cons(%1370, %1369) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1371) : (i64) -> ()
      %1372 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1373 = arith.constant 14 : i64
      %1374 = func.call @cc_make_string(%1372, %1373) : (!llvm.ptr, i64) -> i64
      %1375 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1376 = arith.constant 11 : i64
      %1377 = func.call @cc_make_string(%1375, %1376) : (!llvm.ptr, i64) -> i64
      %1378 = func.call @cc_intern(%1374, %1377) : (i64, i64) -> i64
      %1379 = func.call @cc_nil_value() : () -> i64
      %1380 = func.call @cc_cons(%1378, %1379) : (i64, i64) -> i64
      %1381 = func.call @cc_values_pack(%1380) : (i64) -> i64
      func.call @stack_push_pointer(%1378) : (i64) -> ()
      %1382 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1383 = arith.constant 6 : i64
      %1384 = func.call @cc_make_string(%1382, %1383) : (!llvm.ptr, i64) -> i64
      %1385 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1386 = arith.constant 11 : i64
      %1387 = func.call @cc_make_string(%1385, %1386) : (!llvm.ptr, i64) -> i64
      %1388 = func.call @cc_intern(%1384, %1387) : (i64, i64) -> i64
      %1389 = func.call @cc_nil_value() : () -> i64
      %1390 = func.call @cc_cons(%1388, %1389) : (i64, i64) -> i64
      %1391 = func.call @cc_values_pack(%1390) : (i64) -> i64
      func.call @stack_push_pointer(%1388) : (i64) -> ()
      %1392 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1393 = arith.constant 4 : i64
      %1394 = func.call @cc_make_string(%1392, %1393) : (!llvm.ptr, i64) -> i64
      %1395 = func.call @cc_nil_value() : () -> i64
      %1396 = func.call @cc_intern(%1394, %1395) : (i64, i64) -> i64
      %1397 = func.call @cc_nil_value() : () -> i64
      %1398 = func.call @cc_cons(%1396, %1397) : (i64, i64) -> i64
      %1399 = func.call @cc_values_pack(%1398) : (i64) -> i64
      func.call @stack_push_pointer(%1396) : (i64) -> ()
      %1400 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1401 = arith.constant 9 : i64
      %1402 = func.call @cc_make_string(%1400, %1401) : (!llvm.ptr, i64) -> i64
      %1403 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1404 = arith.constant 7 : i64
      %1405 = func.call @cc_make_string(%1403, %1404) : (!llvm.ptr, i64) -> i64
      %1406 = func.call @cc_intern(%1402, %1405) : (i64, i64) -> i64
      %1407 = func.call @cc_nil_value() : () -> i64
      %1408 = func.call @cc_cons(%1406, %1407) : (i64, i64) -> i64
      %1409 = func.call @cc_values_pack(%1408) : (i64) -> i64
      func.call @stack_push_pointer(%1406) : (i64) -> ()
      %1410 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1411 = arith.constant 5 : i64
      %1412 = func.call @cc_make_string(%1410, %1411) : (!llvm.ptr, i64) -> i64
      %1413 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1414 = arith.constant 7 : i64
      %1415 = func.call @cc_make_string(%1413, %1414) : (!llvm.ptr, i64) -> i64
      %1416 = func.call @cc_intern(%1412, %1415) : (i64, i64) -> i64
      %1417 = func.call @cc_nil_value() : () -> i64
      %1418 = func.call @cc_cons(%1416, %1417) : (i64, i64) -> i64
      %1419 = func.call @cc_values_pack(%1418) : (i64) -> i64
      func.call @stack_push_pointer(%1416) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1420 = func.call @stack_pop_pointer() : () -> i64
      %1421 = func.call @stack_pop_pointer() : () -> i64
      %1422 = func.call @cc_cons(%1421, %1420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1422) : (i64) -> ()
      %1423 = func.call @stack_pop_pointer() : () -> i64
      %1424 = func.call @stack_pop_pointer() : () -> i64
      %1425 = func.call @cc_cons(%1424, %1423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1425) : (i64) -> ()
      %1426 = func.call @stack_pop_pointer() : () -> i64
      %1427 = func.call @stack_pop_pointer() : () -> i64
      %1428 = func.call @cc_cons(%1427, %1426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1428) : (i64) -> ()
      %1429 = func.call @stack_pop_pointer() : () -> i64
      %1430 = func.call @stack_pop_pointer() : () -> i64
      %1431 = func.call @cc_cons(%1430, %1429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1431) : (i64) -> ()
      %1432 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1433 = arith.constant 3 : i64
      %1434 = func.call @cc_make_string(%1432, %1433) : (!llvm.ptr, i64) -> i64
      %1435 = func.call @cc_nil_value() : () -> i64
      %1436 = func.call @cc_intern(%1434, %1435) : (i64, i64) -> i64
      %1437 = func.call @cc_nil_value() : () -> i64
      %1438 = func.call @cc_cons(%1436, %1437) : (i64, i64) -> i64
      %1439 = func.call @cc_values_pack(%1438) : (i64) -> i64
      func.call @stack_push_pointer(%1436) : (i64) -> ()
      %1440 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1441 = arith.constant 2 : i64
      %1442 = func.call @cc_make_string(%1440, %1441) : (!llvm.ptr, i64) -> i64
      %1443 = func.call @cc_nil_value() : () -> i64
      %1444 = func.call @cc_intern(%1442, %1443) : (i64, i64) -> i64
      %1445 = func.call @cc_nil_value() : () -> i64
      %1446 = func.call @cc_cons(%1444, %1445) : (i64, i64) -> i64
      %1447 = func.call @cc_values_pack(%1446) : (i64) -> i64
      func.call @stack_push_pointer(%1444) : (i64) -> ()
      %1448 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1449 = arith.constant 27 : i64
      %1450 = func.call @cc_make_string(%1448, %1449) : (!llvm.ptr, i64) -> i64
      %1451 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1452 = arith.constant 3 : i64
      %1453 = func.call @cc_make_string(%1451, %1452) : (!llvm.ptr, i64) -> i64
      %1454 = func.call @cc_intern(%1450, %1453) : (i64, i64) -> i64
      %1455 = func.call @cc_nil_value() : () -> i64
      %1456 = func.call @cc_cons(%1454, %1455) : (i64, i64) -> i64
      %1457 = func.call @cc_values_pack(%1456) : (i64) -> i64
      func.call @stack_push_pointer(%1454) : (i64) -> ()
      %1458 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1459 = arith.constant 6 : i64
      %1460 = func.call @cc_make_string(%1458, %1459) : (!llvm.ptr, i64) -> i64
      %1461 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1462 = arith.constant 11 : i64
      %1463 = func.call @cc_make_string(%1461, %1462) : (!llvm.ptr, i64) -> i64
      %1464 = func.call @cc_intern(%1460, %1463) : (i64, i64) -> i64
      %1465 = func.call @cc_nil_value() : () -> i64
      %1466 = func.call @cc_cons(%1464, %1465) : (i64, i64) -> i64
      %1467 = func.call @cc_values_pack(%1466) : (i64) -> i64
      func.call @stack_push_pointer(%1464) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1468 = func.call @stack_pop_pointer() : () -> i64
      %1469 = func.call @stack_pop_pointer() : () -> i64
      %1470 = func.call @cc_cons(%1469, %1468) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1470) : (i64) -> ()
      %1471 = func.call @stack_pop_pointer() : () -> i64
      %1472 = func.call @stack_pop_pointer() : () -> i64
      %1473 = func.call @cc_cons(%1472, %1471) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1473) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1474 = func.call @stack_pop_pointer() : () -> i64
      %1475 = func.call @stack_pop_pointer() : () -> i64
      %1476 = func.call @cc_cons(%1475, %1474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1476) : (i64) -> ()
      %1477 = func.call @stack_pop_pointer() : () -> i64
      %1478 = func.call @stack_pop_pointer() : () -> i64
      %1479 = func.call @cc_cons(%1478, %1477) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1479) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1480 = func.call @stack_pop_pointer() : () -> i64
      %1481 = func.call @stack_pop_pointer() : () -> i64
      %1482 = func.call @cc_cons(%1481, %1480) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1482) : (i64) -> ()
      %1483 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1484 = arith.constant 5 : i64
      %1485 = func.call @cc_make_string(%1483, %1484) : (!llvm.ptr, i64) -> i64
      %1486 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1487 = arith.constant 3 : i64
      %1488 = func.call @cc_make_string(%1486, %1487) : (!llvm.ptr, i64) -> i64
      %1489 = func.call @cc_intern(%1485, %1488) : (i64, i64) -> i64
      %1490 = func.call @cc_nil_value() : () -> i64
      %1491 = func.call @cc_cons(%1489, %1490) : (i64, i64) -> i64
      %1492 = func.call @cc_values_pack(%1491) : (i64) -> i64
      func.call @stack_push_pointer(%1489) : (i64) -> ()
      %1493 = llvm.mlir.addressof @str132 : !llvm.ptr
      %1494 = arith.constant 2 : i64
      %1495 = func.call @cc_make_string(%1493, %1494) : (!llvm.ptr, i64) -> i64
      %1496 = func.call @cc_nil_value() : () -> i64
      %1497 = func.call @cc_intern(%1495, %1496) : (i64, i64) -> i64
      %1498 = func.call @cc_nil_value() : () -> i64
      %1499 = func.call @cc_cons(%1497, %1498) : (i64, i64) -> i64
      %1500 = func.call @cc_values_pack(%1499) : (i64) -> i64
      func.call @stack_push_pointer(%1497) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1501 = func.call @stack_pop_pointer() : () -> i64
      %1502 = func.call @stack_pop_pointer() : () -> i64
      %1503 = func.call @cc_cons(%1502, %1501) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1503) : (i64) -> ()
      %1504 = func.call @stack_pop_pointer() : () -> i64
      %1505 = func.call @stack_pop_pointer() : () -> i64
      %1506 = func.call @cc_cons(%1505, %1504) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1506) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1507 = func.call @stack_pop_pointer() : () -> i64
      %1508 = func.call @stack_pop_pointer() : () -> i64
      %1509 = func.call @cc_cons(%1508, %1507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1509) : (i64) -> ()
      %1510 = func.call @stack_pop_pointer() : () -> i64
      %1511 = func.call @stack_pop_pointer() : () -> i64
      %1512 = func.call @cc_cons(%1511, %1510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1512) : (i64) -> ()
      %1513 = func.call @stack_pop_pointer() : () -> i64
      %1514 = func.call @stack_pop_pointer() : () -> i64
      %1515 = func.call @cc_cons(%1514, %1513) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1515) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1516 = func.call @stack_pop_pointer() : () -> i64
      %1517 = func.call @stack_pop_pointer() : () -> i64
      %1518 = func.call @cc_cons(%1517, %1516) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1518) : (i64) -> ()
      %1519 = func.call @stack_pop_pointer() : () -> i64
      %1520 = func.call @stack_pop_pointer() : () -> i64
      %1521 = func.call @cc_cons(%1520, %1519) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1521) : (i64) -> ()
      %1522 = func.call @stack_pop_pointer() : () -> i64
      %1523 = func.call @stack_pop_pointer() : () -> i64
      %1524 = func.call @cc_cons(%1523, %1522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1524) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1525 = func.call @stack_pop_pointer() : () -> i64
      %1526 = func.call @stack_pop_pointer() : () -> i64
      %1527 = func.call @cc_cons(%1526, %1525) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1527) : (i64) -> ()
      %1528 = func.call @stack_pop_pointer() : () -> i64
      %1529 = func.call @stack_pop_pointer() : () -> i64
      %1530 = func.call @cc_cons(%1529, %1528) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1530) : (i64) -> ()
      %1531 = func.call @stack_pop_pointer() : () -> i64
      %1532 = func.call @stack_pop_pointer() : () -> i64
      %1533 = func.call @cc_cons(%1532, %1531) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1533) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1534 = func.call @stack_pop_pointer() : () -> i64
      %1535 = func.call @stack_pop_pointer() : () -> i64
      %1536 = func.call @cc_cons(%1535, %1534) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1536) : (i64) -> ()
      %1537 = func.call @stack_pop_pointer() : () -> i64
      %1538 = func.call @stack_pop_pointer() : () -> i64
      %1539 = func.call @cc_cons(%1538, %1537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1539) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1540 = func.call @stack_pop_pointer() : () -> i64
      %1541 = func.call @stack_pop_pointer() : () -> i64
      %1542 = func.call @cc_cons(%1541, %1540) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1542) : (i64) -> ()
      %1543 = func.call @stack_pop_pointer() : () -> i64
      %1544 = func.call @stack_pop_pointer() : () -> i64
      %1545 = func.call @cc_cons(%1544, %1543) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1545) : (i64) -> ()
      %1546 = func.call @stack_pop_pointer() : () -> i64
      %1668 = arith.constant 269090723725318 : i64
      %1669 = arith.constant 0 : i64
      %1670 = func.call @cc_make_closure(%1668, %1669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1670) : (i64) -> ()
      %1671 = func.call @stack_pop_pointer() : () -> i64
      %1672 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1673 = arith.constant 1 : i64
      %1674 = func.call @cc_make_string(%1672, %1673) : (!llvm.ptr, i64) -> i64
      %1675 = func.call @cc_nil_value() : () -> i64
      %1676 = func.call @cc_intern(%1674, %1675) : (i64, i64) -> i64
      %1677 = func.call @cc_nil_value() : () -> i64
      %1678 = func.call @cc_cons(%1676, %1677) : (i64, i64) -> i64
      %1679 = func.call @cc_values_pack(%1678) : (i64) -> i64
      func.call @stack_push_pointer(%1676) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1680 = func.call @stack_pop_pointer() : () -> i64
      %1681 = func.call @stack_pop_pointer() : () -> i64
      %1682 = func.call @cc_cons(%1681, %1680) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1682) : (i64) -> ()
      %1683 = func.call @stack_pop_pointer() : () -> i64
      %1684 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1685 = arith.constant 11 : i64
      %1686 = func.call @cc_make_string(%1684, %1685) : (!llvm.ptr, i64) -> i64
      %1687 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1688 = arith.constant 7 : i64
      %1689 = func.call @cc_make_string(%1687, %1688) : (!llvm.ptr, i64) -> i64
      %1690 = func.call @cc_intern(%1686, %1689) : (i64, i64) -> i64
      %1691 = func.call @cc_nil_value() : () -> i64
      %1692 = func.call @cc_cons(%1690, %1691) : (i64, i64) -> i64
      %1693 = func.call @cc_values_pack(%1692) : (i64) -> i64
      func.call @stack_push_pointer(%1690) : (i64) -> ()
      %1694 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1697 = arith.constant 4 : i64
      %1698 = func.call @cc_make_string(%1696, %1697) : (!llvm.ptr, i64) -> i64
      %1699 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1700 = arith.constant 7 : i64
      %1701 = func.call @cc_make_string(%1699, %1700) : (!llvm.ptr, i64) -> i64
      %1702 = func.call @cc_intern(%1698, %1701) : (i64, i64) -> i64
      %1703 = func.call @cc_nil_value() : () -> i64
      %1704 = func.call @cc_cons(%1702, %1703) : (i64, i64) -> i64
      %1705 = func.call @cc_values_pack(%1704) : (i64) -> i64
      func.call @stack_push_pointer(%1702) : (i64) -> ()
      %1706 = func.call @stack_pop_pointer() : () -> i64
      %1707 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1708 = arith.constant 6 : i64
      %1709 = func.call @cc_make_string(%1707, %1708) : (!llvm.ptr, i64) -> i64
      %1710 = func.call @cc_nil_value() : () -> i64
      %1711 = func.call @cc_intern(%1709, %1710) : (i64, i64) -> i64
      %1712 = func.call @cc_nil_value() : () -> i64
      %1713 = func.call @cc_cons(%1711, %1712) : (i64, i64) -> i64
      %1714 = func.call @cc_values_pack(%1713) : (i64) -> i64
      func.call @stack_push_pointer(%1711) : (i64) -> ()
      %1715 = func.call @stack_pop_pointer() : () -> i64
      %1716 = func.call @cc_nil_value() : () -> i64
      %1717 = func.call @cc_errorp(%1327) : (i64) -> i64
      %1718 = arith.cmpi ne, %1717, %1716 : i64
      %1719 = arith.cmpi eq, %1716, %1716 : i64
      %1720 = arith.andi %1718, %1719 : i1
      %1721 = scf.if %1720 -> (i64) {
        scf.yield %1327 : i64
      } else {
        scf.yield %1716 : i64
      }
      %1722 = func.call @cc_errorp(%1546) : (i64) -> i64
      %1723 = arith.cmpi ne, %1722, %1716 : i64
      %1724 = arith.cmpi eq, %1721, %1716 : i64
      %1725 = arith.andi %1723, %1724 : i1
      %1726 = scf.if %1725 -> (i64) {
        scf.yield %1546 : i64
      } else {
        scf.yield %1721 : i64
      }
      %1727 = func.call @cc_errorp(%1671) : (i64) -> i64
      %1728 = arith.cmpi ne, %1727, %1716 : i64
      %1729 = arith.cmpi eq, %1726, %1716 : i64
      %1730 = arith.andi %1728, %1729 : i1
      %1731 = scf.if %1730 -> (i64) {
        scf.yield %1671 : i64
      } else {
        scf.yield %1726 : i64
      }
      %1732 = func.call @cc_errorp(%1683) : (i64) -> i64
      %1733 = arith.cmpi ne, %1732, %1716 : i64
      %1734 = arith.cmpi eq, %1731, %1716 : i64
      %1735 = arith.andi %1733, %1734 : i1
      %1736 = scf.if %1735 -> (i64) {
        scf.yield %1683 : i64
      } else {
        scf.yield %1731 : i64
      }
      %1737 = func.call @cc_errorp(%1694) : (i64) -> i64
      %1738 = arith.cmpi ne, %1737, %1716 : i64
      %1739 = arith.cmpi eq, %1736, %1716 : i64
      %1740 = arith.andi %1738, %1739 : i1
      %1741 = scf.if %1740 -> (i64) {
        scf.yield %1694 : i64
      } else {
        scf.yield %1736 : i64
      }
      %1742 = func.call @cc_errorp(%1695) : (i64) -> i64
      %1743 = arith.cmpi ne, %1742, %1716 : i64
      %1744 = arith.cmpi eq, %1741, %1716 : i64
      %1745 = arith.andi %1743, %1744 : i1
      %1746 = scf.if %1745 -> (i64) {
        scf.yield %1695 : i64
      } else {
        scf.yield %1741 : i64
      }
      %1747 = func.call @cc_errorp(%1706) : (i64) -> i64
      %1748 = arith.cmpi ne, %1747, %1716 : i64
      %1749 = arith.cmpi eq, %1746, %1716 : i64
      %1750 = arith.andi %1748, %1749 : i1
      %1751 = scf.if %1750 -> (i64) {
        scf.yield %1706 : i64
      } else {
        scf.yield %1746 : i64
      }
      %1752 = func.call @cc_errorp(%1715) : (i64) -> i64
      %1753 = arith.cmpi ne, %1752, %1716 : i64
      %1754 = arith.cmpi eq, %1751, %1716 : i64
      %1755 = arith.andi %1753, %1754 : i1
      %1756 = scf.if %1755 -> (i64) {
        scf.yield %1715 : i64
      } else {
        scf.yield %1751 : i64
      }
      %1757 = arith.cmpi ne, %1756, %1716 : i64
      scf.if %1757 {
        func.call @stack_push_pointer(%1756) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1327) : (i64) -> ()
        func.call @stack_push_pointer(%1546) : (i64) -> ()
        func.call @stack_push_pointer(%1671) : (i64) -> ()
        func.call @stack_push_pointer(%1683) : (i64) -> ()
        func.call @stack_push_pointer(%1694) : (i64) -> ()
        func.call @stack_push_pointer(%1695) : (i64) -> ()
        func.call @stack_push_pointer(%1706) : (i64) -> ()
        func.call @stack_push_pointer(%1715) : (i64) -> ()
        %1758 = llvm.mlir.addressof @str148 : !llvm.ptr
        %1759 = func.call @cc_make_function_ref_const(%1758) : (!llvm.ptr) -> i64
        %1760 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1759, %1760) : (i64, i64) -> ()
      }
      %1761 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1761 : i64
    }
    %1762 = func.call @cc_nil_value() : () -> i64
    %1763 = func.call @cc_errorp(%1318) : (i64) -> i64
    %1764 = arith.cmpi ne, %1763, %1762 : i64
    %1765 = scf.if %1764 -> (i64) {
      scf.yield %1318 : i64
    } else {
      %1766 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1767 = arith.constant 10 : i64
      %1768 = func.call @cc_make_string(%1766, %1767) : (!llvm.ptr, i64) -> i64
      %1769 = func.call @cc_nil_value() : () -> i64
      %1770 = func.call @cc_intern(%1768, %1769) : (i64, i64) -> i64
      %1771 = func.call @cc_nil_value() : () -> i64
      %1772 = func.call @cc_cons(%1770, %1771) : (i64, i64) -> i64
      %1773 = func.call @cc_values_pack(%1772) : (i64) -> i64
      func.call @stack_push_pointer(%1770) : (i64) -> ()
      %1774 = func.call @stack_pop_pointer() : () -> i64
      %1775 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1776 = arith.constant 3 : i64
      %1777 = func.call @cc_make_string(%1775, %1776) : (!llvm.ptr, i64) -> i64
      %1778 = func.call @cc_nil_value() : () -> i64
      %1779 = func.call @cc_intern(%1777, %1778) : (i64, i64) -> i64
      %1780 = func.call @cc_nil_value() : () -> i64
      %1781 = func.call @cc_cons(%1779, %1780) : (i64, i64) -> i64
      %1782 = func.call @cc_values_pack(%1781) : (i64) -> i64
      func.call @stack_push_pointer(%1779) : (i64) -> ()
      %1783 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1784 = arith.constant 3 : i64
      %1785 = func.call @cc_make_string(%1783, %1784) : (!llvm.ptr, i64) -> i64
      %1786 = func.call @cc_nil_value() : () -> i64
      %1787 = func.call @cc_intern(%1785, %1786) : (i64, i64) -> i64
      %1788 = func.call @cc_nil_value() : () -> i64
      %1789 = func.call @cc_cons(%1787, %1788) : (i64, i64) -> i64
      %1790 = func.call @cc_values_pack(%1789) : (i64) -> i64
      func.call @stack_push_pointer(%1787) : (i64) -> ()
      %1791 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1792 = arith.constant 3 : i64
      %1793 = func.call @cc_make_string(%1791, %1792) : (!llvm.ptr, i64) -> i64
      %1794 = func.call @cc_nil_value() : () -> i64
      %1795 = func.call @cc_intern(%1793, %1794) : (i64, i64) -> i64
      %1796 = func.call @cc_nil_value() : () -> i64
      %1797 = func.call @cc_cons(%1795, %1796) : (i64, i64) -> i64
      %1798 = func.call @cc_values_pack(%1797) : (i64) -> i64
      func.call @stack_push_pointer(%1795) : (i64) -> ()
      %1799 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1800 = arith.constant 4 : i64
      %1801 = func.call @cc_make_string(%1799, %1800) : (!llvm.ptr, i64) -> i64
      %1802 = func.call @cc_nil_value() : () -> i64
      %1803 = func.call @cc_intern(%1801, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_nil_value() : () -> i64
      %1805 = func.call @cc_cons(%1803, %1804) : (i64, i64) -> i64
      %1806 = func.call @cc_values_pack(%1805) : (i64) -> i64
      func.call @stack_push_pointer(%1803) : (i64) -> ()
      %1807 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1808 = arith.constant 42 : i64
      %1809 = func.call @cc_make_string(%1807, %1808) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1809) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1810 = func.call @stack_pop_pointer() : () -> i64
      %1811 = func.call @stack_pop_pointer() : () -> i64
      %1812 = func.call @cc_cons(%1811, %1810) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1812) : (i64) -> ()
      %1813 = func.call @stack_pop_pointer() : () -> i64
      %1814 = func.call @stack_pop_pointer() : () -> i64
      %1815 = func.call @cc_cons(%1814, %1813) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1815) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1816 = func.call @stack_pop_pointer() : () -> i64
      %1817 = func.call @stack_pop_pointer() : () -> i64
      %1818 = func.call @cc_cons(%1817, %1816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1818) : (i64) -> ()
      %1819 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1820 = arith.constant 14 : i64
      %1821 = func.call @cc_make_string(%1819, %1820) : (!llvm.ptr, i64) -> i64
      %1822 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1823 = arith.constant 11 : i64
      %1824 = func.call @cc_make_string(%1822, %1823) : (!llvm.ptr, i64) -> i64
      %1825 = func.call @cc_intern(%1821, %1824) : (i64, i64) -> i64
      %1826 = func.call @cc_nil_value() : () -> i64
      %1827 = func.call @cc_cons(%1825, %1826) : (i64, i64) -> i64
      %1828 = func.call @cc_values_pack(%1827) : (i64) -> i64
      func.call @stack_push_pointer(%1825) : (i64) -> ()
      %1829 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1830 = arith.constant 6 : i64
      %1831 = func.call @cc_make_string(%1829, %1830) : (!llvm.ptr, i64) -> i64
      %1832 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1833 = arith.constant 11 : i64
      %1834 = func.call @cc_make_string(%1832, %1833) : (!llvm.ptr, i64) -> i64
      %1835 = func.call @cc_intern(%1831, %1834) : (i64, i64) -> i64
      %1836 = func.call @cc_nil_value() : () -> i64
      %1837 = func.call @cc_cons(%1835, %1836) : (i64, i64) -> i64
      %1838 = func.call @cc_values_pack(%1837) : (i64) -> i64
      func.call @stack_push_pointer(%1835) : (i64) -> ()
      %1839 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1840 = arith.constant 4 : i64
      %1841 = func.call @cc_make_string(%1839, %1840) : (!llvm.ptr, i64) -> i64
      %1842 = func.call @cc_nil_value() : () -> i64
      %1843 = func.call @cc_intern(%1841, %1842) : (i64, i64) -> i64
      %1844 = func.call @cc_nil_value() : () -> i64
      %1845 = func.call @cc_cons(%1843, %1844) : (i64, i64) -> i64
      %1846 = func.call @cc_values_pack(%1845) : (i64) -> i64
      func.call @stack_push_pointer(%1843) : (i64) -> ()
      %1847 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1848 = arith.constant 9 : i64
      %1849 = func.call @cc_make_string(%1847, %1848) : (!llvm.ptr, i64) -> i64
      %1850 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1851 = arith.constant 7 : i64
      %1852 = func.call @cc_make_string(%1850, %1851) : (!llvm.ptr, i64) -> i64
      %1853 = func.call @cc_intern(%1849, %1852) : (i64, i64) -> i64
      %1854 = func.call @cc_nil_value() : () -> i64
      %1855 = func.call @cc_cons(%1853, %1854) : (i64, i64) -> i64
      %1856 = func.call @cc_values_pack(%1855) : (i64) -> i64
      func.call @stack_push_pointer(%1853) : (i64) -> ()
      %1857 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1858 = arith.constant 5 : i64
      %1859 = func.call @cc_make_string(%1857, %1858) : (!llvm.ptr, i64) -> i64
      %1860 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1861 = arith.constant 7 : i64
      %1862 = func.call @cc_make_string(%1860, %1861) : (!llvm.ptr, i64) -> i64
      %1863 = func.call @cc_intern(%1859, %1862) : (i64, i64) -> i64
      %1864 = func.call @cc_nil_value() : () -> i64
      %1865 = func.call @cc_cons(%1863, %1864) : (i64, i64) -> i64
      %1866 = func.call @cc_values_pack(%1865) : (i64) -> i64
      func.call @stack_push_pointer(%1863) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %1879 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1880 = arith.constant 3 : i64
      %1881 = func.call @cc_make_string(%1879, %1880) : (!llvm.ptr, i64) -> i64
      %1882 = func.call @cc_nil_value() : () -> i64
      %1883 = func.call @cc_intern(%1881, %1882) : (i64, i64) -> i64
      %1884 = func.call @cc_nil_value() : () -> i64
      %1885 = func.call @cc_cons(%1883, %1884) : (i64, i64) -> i64
      %1886 = func.call @cc_values_pack(%1885) : (i64) -> i64
      func.call @stack_push_pointer(%1883) : (i64) -> ()
      %1887 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1888 = arith.constant 2 : i64
      %1889 = func.call @cc_make_string(%1887, %1888) : (!llvm.ptr, i64) -> i64
      %1890 = func.call @cc_nil_value() : () -> i64
      %1891 = func.call @cc_intern(%1889, %1890) : (i64, i64) -> i64
      %1892 = func.call @cc_nil_value() : () -> i64
      %1893 = func.call @cc_cons(%1891, %1892) : (i64, i64) -> i64
      %1894 = func.call @cc_values_pack(%1893) : (i64) -> i64
      func.call @stack_push_pointer(%1891) : (i64) -> ()
      %1895 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1896 = arith.constant 27 : i64
      %1897 = func.call @cc_make_string(%1895, %1896) : (!llvm.ptr, i64) -> i64
      %1898 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1899 = arith.constant 3 : i64
      %1900 = func.call @cc_make_string(%1898, %1899) : (!llvm.ptr, i64) -> i64
      %1901 = func.call @cc_intern(%1897, %1900) : (i64, i64) -> i64
      %1902 = func.call @cc_nil_value() : () -> i64
      %1903 = func.call @cc_cons(%1901, %1902) : (i64, i64) -> i64
      %1904 = func.call @cc_values_pack(%1903) : (i64) -> i64
      func.call @stack_push_pointer(%1901) : (i64) -> ()
      %1905 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1906 = arith.constant 6 : i64
      %1907 = func.call @cc_make_string(%1905, %1906) : (!llvm.ptr, i64) -> i64
      %1908 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1909 = arith.constant 11 : i64
      %1910 = func.call @cc_make_string(%1908, %1909) : (!llvm.ptr, i64) -> i64
      %1911 = func.call @cc_intern(%1907, %1910) : (i64, i64) -> i64
      %1912 = func.call @cc_nil_value() : () -> i64
      %1913 = func.call @cc_cons(%1911, %1912) : (i64, i64) -> i64
      %1914 = func.call @cc_values_pack(%1913) : (i64) -> i64
      func.call @stack_push_pointer(%1911) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1915 = func.call @stack_pop_pointer() : () -> i64
      %1916 = func.call @stack_pop_pointer() : () -> i64
      %1917 = func.call @cc_cons(%1916, %1915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1917) : (i64) -> ()
      %1918 = func.call @stack_pop_pointer() : () -> i64
      %1919 = func.call @stack_pop_pointer() : () -> i64
      %1920 = func.call @cc_cons(%1919, %1918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1920) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1921 = func.call @stack_pop_pointer() : () -> i64
      %1922 = func.call @stack_pop_pointer() : () -> i64
      %1923 = func.call @cc_cons(%1922, %1921) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1923) : (i64) -> ()
      %1924 = func.call @stack_pop_pointer() : () -> i64
      %1925 = func.call @stack_pop_pointer() : () -> i64
      %1926 = func.call @cc_cons(%1925, %1924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1926) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1927 = func.call @stack_pop_pointer() : () -> i64
      %1928 = func.call @stack_pop_pointer() : () -> i64
      %1929 = func.call @cc_cons(%1928, %1927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1929) : (i64) -> ()
      %1930 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1931 = arith.constant 1 : i64
      %1932 = func.call @cc_make_string(%1930, %1931) : (!llvm.ptr, i64) -> i64
      %1933 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1934 = arith.constant 11 : i64
      %1935 = func.call @cc_make_string(%1933, %1934) : (!llvm.ptr, i64) -> i64
      %1936 = func.call @cc_intern(%1932, %1935) : (i64, i64) -> i64
      %1937 = func.call @cc_nil_value() : () -> i64
      %1938 = func.call @cc_cons(%1936, %1937) : (i64, i64) -> i64
      %1939 = func.call @cc_values_pack(%1938) : (i64) -> i64
      func.call @stack_push_pointer(%1936) : (i64) -> ()
      %1940 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1941 = arith.constant 9 : i64
      %1942 = func.call @cc_make_string(%1940, %1941) : (!llvm.ptr, i64) -> i64
      %1943 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1944 = arith.constant 11 : i64
      %1945 = func.call @cc_make_string(%1943, %1944) : (!llvm.ptr, i64) -> i64
      %1946 = func.call @cc_intern(%1942, %1945) : (i64, i64) -> i64
      %1947 = func.call @cc_nil_value() : () -> i64
      %1948 = func.call @cc_cons(%1946, %1947) : (i64, i64) -> i64
      %1949 = func.call @cc_values_pack(%1948) : (i64) -> i64
      func.call @stack_push_pointer(%1946) : (i64) -> ()
      %1950 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1950) : (i64) -> ()
      %1951 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1952 = arith.constant 4 : i64
      %1953 = func.call @cc_make_string(%1951, %1952) : (!llvm.ptr, i64) -> i64
      %1954 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1955 = arith.constant 3 : i64
      %1956 = func.call @cc_make_string(%1954, %1955) : (!llvm.ptr, i64) -> i64
      %1957 = func.call @cc_intern(%1953, %1956) : (i64, i64) -> i64
      %1958 = func.call @cc_nil_value() : () -> i64
      %1959 = func.call @cc_cons(%1957, %1958) : (i64, i64) -> i64
      %1960 = func.call @cc_values_pack(%1959) : (i64) -> i64
      func.call @stack_push_pointer(%1957) : (i64) -> ()
      %1961 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1962 = arith.constant 4 : i64
      %1963 = func.call @cc_make_string(%1961, %1962) : (!llvm.ptr, i64) -> i64
      %1964 = func.call @cc_nil_value() : () -> i64
      %1965 = func.call @cc_intern(%1963, %1964) : (i64, i64) -> i64
      %1966 = func.call @cc_nil_value() : () -> i64
      %1967 = func.call @cc_cons(%1965, %1966) : (i64, i64) -> i64
      %1968 = func.call @cc_values_pack(%1967) : (i64) -> i64
      func.call @stack_push_pointer(%1965) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1969 = func.call @stack_pop_pointer() : () -> i64
      %1970 = func.call @stack_pop_pointer() : () -> i64
      %1971 = func.call @cc_cons(%1970, %1969) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1971) : (i64) -> ()
      %1972 = func.call @stack_pop_pointer() : () -> i64
      %1973 = func.call @stack_pop_pointer() : () -> i64
      %1974 = func.call @cc_cons(%1973, %1972) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1974) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1975 = func.call @stack_pop_pointer() : () -> i64
      %1976 = func.call @stack_pop_pointer() : () -> i64
      %1977 = func.call @cc_cons(%1976, %1975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1977) : (i64) -> ()
      %1978 = func.call @stack_pop_pointer() : () -> i64
      %1979 = func.call @stack_pop_pointer() : () -> i64
      %1980 = func.call @cc_cons(%1979, %1978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1980) : (i64) -> ()
      %1981 = func.call @stack_pop_pointer() : () -> i64
      %1982 = func.call @stack_pop_pointer() : () -> i64
      %1983 = func.call @cc_cons(%1982, %1981) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1983) : (i64) -> ()
      %1984 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1985 = arith.constant 9 : i64
      %1986 = func.call @cc_make_string(%1984, %1985) : (!llvm.ptr, i64) -> i64
      %1987 = llvm.mlir.addressof @str178 : !llvm.ptr
      %1988 = arith.constant 11 : i64
      %1989 = func.call @cc_make_string(%1987, %1988) : (!llvm.ptr, i64) -> i64
      %1990 = func.call @cc_intern(%1986, %1989) : (i64, i64) -> i64
      %1991 = func.call @cc_nil_value() : () -> i64
      %1992 = func.call @cc_cons(%1990, %1991) : (i64, i64) -> i64
      %1993 = func.call @cc_values_pack(%1992) : (i64) -> i64
      func.call @stack_push_pointer(%1990) : (i64) -> ()
      %1994 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%1994) : (i64) -> ()
      %1995 = llvm.mlir.addressof @str179 : !llvm.ptr
      %1996 = arith.constant 5 : i64
      %1997 = func.call @cc_make_string(%1995, %1996) : (!llvm.ptr, i64) -> i64
      %1998 = llvm.mlir.addressof @str180 : !llvm.ptr
      %1999 = arith.constant 3 : i64
      %2000 = func.call @cc_make_string(%1998, %1999) : (!llvm.ptr, i64) -> i64
      %2001 = func.call @cc_intern(%1997, %2000) : (i64, i64) -> i64
      %2002 = func.call @cc_nil_value() : () -> i64
      %2003 = func.call @cc_cons(%2001, %2002) : (i64, i64) -> i64
      %2004 = func.call @cc_values_pack(%2003) : (i64) -> i64
      func.call @stack_push_pointer(%2001) : (i64) -> ()
      %2005 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2006 = arith.constant 2 : i64
      %2007 = func.call @cc_make_string(%2005, %2006) : (!llvm.ptr, i64) -> i64
      %2008 = func.call @cc_nil_value() : () -> i64
      %2009 = func.call @cc_intern(%2007, %2008) : (i64, i64) -> i64
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
      %2025 = func.call @stack_pop_pointer() : () -> i64
      %2026 = func.call @stack_pop_pointer() : () -> i64
      %2027 = func.call @cc_cons(%2026, %2025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2027) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2028 = func.call @stack_pop_pointer() : () -> i64
      %2029 = func.call @stack_pop_pointer() : () -> i64
      %2030 = func.call @cc_cons(%2029, %2028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2030) : (i64) -> ()
      %2031 = func.call @stack_pop_pointer() : () -> i64
      %2032 = func.call @stack_pop_pointer() : () -> i64
      %2033 = func.call @cc_cons(%2032, %2031) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2033) : (i64) -> ()
      %2034 = func.call @stack_pop_pointer() : () -> i64
      %2035 = func.call @stack_pop_pointer() : () -> i64
      %2036 = func.call @cc_cons(%2035, %2034) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2036) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2037 = func.call @stack_pop_pointer() : () -> i64
      %2038 = func.call @stack_pop_pointer() : () -> i64
      %2039 = func.call @cc_cons(%2038, %2037) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2039) : (i64) -> ()
      %2040 = func.call @stack_pop_pointer() : () -> i64
      %2041 = func.call @stack_pop_pointer() : () -> i64
      %2042 = func.call @cc_cons(%2041, %2040) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2042) : (i64) -> ()
      %2043 = func.call @stack_pop_pointer() : () -> i64
      %2044 = func.call @stack_pop_pointer() : () -> i64
      %2045 = func.call @cc_cons(%2044, %2043) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2045) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2046 = func.call @stack_pop_pointer() : () -> i64
      %2047 = func.call @stack_pop_pointer() : () -> i64
      %2048 = func.call @cc_cons(%2047, %2046) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2048) : (i64) -> ()
      %2049 = func.call @stack_pop_pointer() : () -> i64
      %2050 = func.call @stack_pop_pointer() : () -> i64
      %2051 = func.call @cc_cons(%2050, %2049) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2051) : (i64) -> ()
      %2052 = func.call @stack_pop_pointer() : () -> i64
      %2053 = func.call @stack_pop_pointer() : () -> i64
      %2054 = func.call @cc_cons(%2053, %2052) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2054) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2055 = func.call @stack_pop_pointer() : () -> i64
      %2056 = func.call @stack_pop_pointer() : () -> i64
      %2057 = func.call @cc_cons(%2056, %2055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2057) : (i64) -> ()
      %2058 = func.call @stack_pop_pointer() : () -> i64
      %2059 = func.call @stack_pop_pointer() : () -> i64
      %2060 = func.call @cc_cons(%2059, %2058) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2060) : (i64) -> ()
      %2061 = func.call @stack_pop_pointer() : () -> i64
      %2062 = func.call @stack_pop_pointer() : () -> i64
      %2063 = func.call @cc_cons(%2062, %2061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2063) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2064 = func.call @stack_pop_pointer() : () -> i64
      %2065 = func.call @stack_pop_pointer() : () -> i64
      %2066 = func.call @cc_cons(%2065, %2064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2066) : (i64) -> ()
      %2067 = func.call @stack_pop_pointer() : () -> i64
      %2068 = func.call @stack_pop_pointer() : () -> i64
      %2069 = func.call @cc_cons(%2068, %2067) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2069) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2070 = func.call @stack_pop_pointer() : () -> i64
      %2071 = func.call @stack_pop_pointer() : () -> i64
      %2072 = func.call @cc_cons(%2071, %2070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2072) : (i64) -> ()
      %2073 = func.call @stack_pop_pointer() : () -> i64
      %2074 = func.call @stack_pop_pointer() : () -> i64
      %2075 = func.call @cc_cons(%2074, %2073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2075) : (i64) -> ()
      %2076 = func.call @stack_pop_pointer() : () -> i64
      %2244 = arith.constant 269090723725319 : i64
      %2245 = arith.constant 0 : i64
      %2246 = func.call @cc_make_closure(%2244, %2245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2246) : (i64) -> ()
      %2247 = func.call @stack_pop_pointer() : () -> i64
      %2248 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2249 = arith.constant 1 : i64
      %2250 = func.call @cc_make_string(%2248, %2249) : (!llvm.ptr, i64) -> i64
      %2251 = func.call @cc_nil_value() : () -> i64
      %2252 = func.call @cc_intern(%2250, %2251) : (i64, i64) -> i64
      %2253 = func.call @cc_nil_value() : () -> i64
      %2254 = func.call @cc_cons(%2252, %2253) : (i64, i64) -> i64
      %2255 = func.call @cc_values_pack(%2254) : (i64) -> i64
      func.call @stack_push_pointer(%2252) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2256 = func.call @stack_pop_pointer() : () -> i64
      %2257 = func.call @stack_pop_pointer() : () -> i64
      %2258 = func.call @cc_cons(%2257, %2256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2258) : (i64) -> ()
      %2259 = func.call @stack_pop_pointer() : () -> i64
      %2260 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2261 = arith.constant 11 : i64
      %2262 = func.call @cc_make_string(%2260, %2261) : (!llvm.ptr, i64) -> i64
      %2263 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2264 = arith.constant 7 : i64
      %2265 = func.call @cc_make_string(%2263, %2264) : (!llvm.ptr, i64) -> i64
      %2266 = func.call @cc_intern(%2262, %2265) : (i64, i64) -> i64
      %2267 = func.call @cc_nil_value() : () -> i64
      %2268 = func.call @cc_cons(%2266, %2267) : (i64, i64) -> i64
      %2269 = func.call @cc_values_pack(%2268) : (i64) -> i64
      func.call @stack_push_pointer(%2266) : (i64) -> ()
      %2270 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2271 = func.call @stack_pop_pointer() : () -> i64
      %2272 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2273 = arith.constant 4 : i64
      %2274 = func.call @cc_make_string(%2272, %2273) : (!llvm.ptr, i64) -> i64
      %2275 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2276 = arith.constant 7 : i64
      %2277 = func.call @cc_make_string(%2275, %2276) : (!llvm.ptr, i64) -> i64
      %2278 = func.call @cc_intern(%2274, %2277) : (i64, i64) -> i64
      %2279 = func.call @cc_nil_value() : () -> i64
      %2280 = func.call @cc_cons(%2278, %2279) : (i64, i64) -> i64
      %2281 = func.call @cc_values_pack(%2280) : (i64) -> i64
      func.call @stack_push_pointer(%2278) : (i64) -> ()
      %2282 = func.call @stack_pop_pointer() : () -> i64
      %2283 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2284 = arith.constant 6 : i64
      %2285 = func.call @cc_make_string(%2283, %2284) : (!llvm.ptr, i64) -> i64
      %2286 = func.call @cc_nil_value() : () -> i64
      %2287 = func.call @cc_intern(%2285, %2286) : (i64, i64) -> i64
      %2288 = func.call @cc_nil_value() : () -> i64
      %2289 = func.call @cc_cons(%2287, %2288) : (i64, i64) -> i64
      %2290 = func.call @cc_values_pack(%2289) : (i64) -> i64
      func.call @stack_push_pointer(%2287) : (i64) -> ()
      %2291 = func.call @stack_pop_pointer() : () -> i64
      %2292 = func.call @cc_nil_value() : () -> i64
      %2293 = func.call @cc_errorp(%1774) : (i64) -> i64
      %2294 = arith.cmpi ne, %2293, %2292 : i64
      %2295 = arith.cmpi eq, %2292, %2292 : i64
      %2296 = arith.andi %2294, %2295 : i1
      %2297 = scf.if %2296 -> (i64) {
        scf.yield %1774 : i64
      } else {
        scf.yield %2292 : i64
      }
      %2298 = func.call @cc_errorp(%2076) : (i64) -> i64
      %2299 = arith.cmpi ne, %2298, %2292 : i64
      %2300 = arith.cmpi eq, %2297, %2292 : i64
      %2301 = arith.andi %2299, %2300 : i1
      %2302 = scf.if %2301 -> (i64) {
        scf.yield %2076 : i64
      } else {
        scf.yield %2297 : i64
      }
      %2303 = func.call @cc_errorp(%2247) : (i64) -> i64
      %2304 = arith.cmpi ne, %2303, %2292 : i64
      %2305 = arith.cmpi eq, %2302, %2292 : i64
      %2306 = arith.andi %2304, %2305 : i1
      %2307 = scf.if %2306 -> (i64) {
        scf.yield %2247 : i64
      } else {
        scf.yield %2302 : i64
      }
      %2308 = func.call @cc_errorp(%2259) : (i64) -> i64
      %2309 = arith.cmpi ne, %2308, %2292 : i64
      %2310 = arith.cmpi eq, %2307, %2292 : i64
      %2311 = arith.andi %2309, %2310 : i1
      %2312 = scf.if %2311 -> (i64) {
        scf.yield %2259 : i64
      } else {
        scf.yield %2307 : i64
      }
      %2313 = func.call @cc_errorp(%2270) : (i64) -> i64
      %2314 = arith.cmpi ne, %2313, %2292 : i64
      %2315 = arith.cmpi eq, %2312, %2292 : i64
      %2316 = arith.andi %2314, %2315 : i1
      %2317 = scf.if %2316 -> (i64) {
        scf.yield %2270 : i64
      } else {
        scf.yield %2312 : i64
      }
      %2318 = func.call @cc_errorp(%2271) : (i64) -> i64
      %2319 = arith.cmpi ne, %2318, %2292 : i64
      %2320 = arith.cmpi eq, %2317, %2292 : i64
      %2321 = arith.andi %2319, %2320 : i1
      %2322 = scf.if %2321 -> (i64) {
        scf.yield %2271 : i64
      } else {
        scf.yield %2317 : i64
      }
      %2323 = func.call @cc_errorp(%2282) : (i64) -> i64
      %2324 = arith.cmpi ne, %2323, %2292 : i64
      %2325 = arith.cmpi eq, %2322, %2292 : i64
      %2326 = arith.andi %2324, %2325 : i1
      %2327 = scf.if %2326 -> (i64) {
        scf.yield %2282 : i64
      } else {
        scf.yield %2322 : i64
      }
      %2328 = func.call @cc_errorp(%2291) : (i64) -> i64
      %2329 = arith.cmpi ne, %2328, %2292 : i64
      %2330 = arith.cmpi eq, %2327, %2292 : i64
      %2331 = arith.andi %2329, %2330 : i1
      %2332 = scf.if %2331 -> (i64) {
        scf.yield %2291 : i64
      } else {
        scf.yield %2327 : i64
      }
      %2333 = arith.cmpi ne, %2332, %2292 : i64
      scf.if %2333 {
        func.call @stack_push_pointer(%2332) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1774) : (i64) -> ()
        func.call @stack_push_pointer(%2076) : (i64) -> ()
        func.call @stack_push_pointer(%2247) : (i64) -> ()
        func.call @stack_push_pointer(%2259) : (i64) -> ()
        func.call @stack_push_pointer(%2270) : (i64) -> ()
        func.call @stack_push_pointer(%2271) : (i64) -> ()
        func.call @stack_push_pointer(%2282) : (i64) -> ()
        func.call @stack_push_pointer(%2291) : (i64) -> ()
        %2334 = llvm.mlir.addressof @str198 : !llvm.ptr
        %2335 = func.call @cc_make_function_ref_const(%2334) : (!llvm.ptr) -> i64
        %2336 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2335, %2336) : (i64, i64) -> ()
      }
      %2337 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2337 : i64
    }
    %2338 = func.call @cc_nil_value() : () -> i64
    %2339 = func.call @cc_errorp(%1765) : (i64) -> i64
    %2340 = arith.cmpi ne, %2339, %2338 : i64
    %2341 = scf.if %2340 -> (i64) {
      scf.yield %1765 : i64
    } else {
      %2342 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2343 = arith.constant 11 : i64
      %2344 = func.call @cc_make_string(%2342, %2343) : (!llvm.ptr, i64) -> i64
      %2345 = func.call @cc_nil_value() : () -> i64
      %2346 = func.call @cc_intern(%2344, %2345) : (i64, i64) -> i64
      %2347 = func.call @cc_nil_value() : () -> i64
      %2348 = func.call @cc_cons(%2346, %2347) : (i64, i64) -> i64
      %2349 = func.call @cc_values_pack(%2348) : (i64) -> i64
      func.call @stack_push_pointer(%2346) : (i64) -> ()
      %2350 = func.call @stack_pop_pointer() : () -> i64
      %2351 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2352 = arith.constant 3 : i64
      %2353 = func.call @cc_make_string(%2351, %2352) : (!llvm.ptr, i64) -> i64
      %2354 = func.call @cc_nil_value() : () -> i64
      %2355 = func.call @cc_intern(%2353, %2354) : (i64, i64) -> i64
      %2356 = func.call @cc_nil_value() : () -> i64
      %2357 = func.call @cc_cons(%2355, %2356) : (i64, i64) -> i64
      %2358 = func.call @cc_values_pack(%2357) : (i64) -> i64
      func.call @stack_push_pointer(%2355) : (i64) -> ()
      %2359 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2360 = arith.constant 3 : i64
      %2361 = func.call @cc_make_string(%2359, %2360) : (!llvm.ptr, i64) -> i64
      %2362 = func.call @cc_nil_value() : () -> i64
      %2363 = func.call @cc_intern(%2361, %2362) : (i64, i64) -> i64
      %2364 = func.call @cc_nil_value() : () -> i64
      %2365 = func.call @cc_cons(%2363, %2364) : (i64, i64) -> i64
      %2366 = func.call @cc_values_pack(%2365) : (i64) -> i64
      func.call @stack_push_pointer(%2363) : (i64) -> ()
      %2367 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2368 = arith.constant 3 : i64
      %2369 = func.call @cc_make_string(%2367, %2368) : (!llvm.ptr, i64) -> i64
      %2370 = func.call @cc_nil_value() : () -> i64
      %2371 = func.call @cc_intern(%2369, %2370) : (i64, i64) -> i64
      %2372 = func.call @cc_nil_value() : () -> i64
      %2373 = func.call @cc_cons(%2371, %2372) : (i64, i64) -> i64
      %2374 = func.call @cc_values_pack(%2373) : (i64) -> i64
      func.call @stack_push_pointer(%2371) : (i64) -> ()
      %2375 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2376 = arith.constant 4 : i64
      %2377 = func.call @cc_make_string(%2375, %2376) : (!llvm.ptr, i64) -> i64
      %2378 = func.call @cc_nil_value() : () -> i64
      %2379 = func.call @cc_intern(%2377, %2378) : (i64, i64) -> i64
      %2380 = func.call @cc_nil_value() : () -> i64
      %2381 = func.call @cc_cons(%2379, %2380) : (i64, i64) -> i64
      %2382 = func.call @cc_values_pack(%2381) : (i64) -> i64
      func.call @stack_push_pointer(%2379) : (i64) -> ()
      %2383 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2384 = arith.constant 42 : i64
      %2385 = func.call @cc_make_string(%2383, %2384) : (!llvm.ptr, i64) -> i64
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
      %2395 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2396 = arith.constant 14 : i64
      %2397 = func.call @cc_make_string(%2395, %2396) : (!llvm.ptr, i64) -> i64
      %2398 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2399 = arith.constant 11 : i64
      %2400 = func.call @cc_make_string(%2398, %2399) : (!llvm.ptr, i64) -> i64
      %2401 = func.call @cc_intern(%2397, %2400) : (i64, i64) -> i64
      %2402 = func.call @cc_nil_value() : () -> i64
      %2403 = func.call @cc_cons(%2401, %2402) : (i64, i64) -> i64
      %2404 = func.call @cc_values_pack(%2403) : (i64) -> i64
      func.call @stack_push_pointer(%2401) : (i64) -> ()
      %2405 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2406 = arith.constant 6 : i64
      %2407 = func.call @cc_make_string(%2405, %2406) : (!llvm.ptr, i64) -> i64
      %2408 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2409 = arith.constant 11 : i64
      %2410 = func.call @cc_make_string(%2408, %2409) : (!llvm.ptr, i64) -> i64
      %2411 = func.call @cc_intern(%2407, %2410) : (i64, i64) -> i64
      %2412 = func.call @cc_nil_value() : () -> i64
      %2413 = func.call @cc_cons(%2411, %2412) : (i64, i64) -> i64
      %2414 = func.call @cc_values_pack(%2413) : (i64) -> i64
      func.call @stack_push_pointer(%2411) : (i64) -> ()
      %2415 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2416 = arith.constant 4 : i64
      %2417 = func.call @cc_make_string(%2415, %2416) : (!llvm.ptr, i64) -> i64
      %2418 = func.call @cc_nil_value() : () -> i64
      %2419 = func.call @cc_intern(%2417, %2418) : (i64, i64) -> i64
      %2420 = func.call @cc_nil_value() : () -> i64
      %2421 = func.call @cc_cons(%2419, %2420) : (i64, i64) -> i64
      %2422 = func.call @cc_values_pack(%2421) : (i64) -> i64
      func.call @stack_push_pointer(%2419) : (i64) -> ()
      %2423 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2424 = arith.constant 9 : i64
      %2425 = func.call @cc_make_string(%2423, %2424) : (!llvm.ptr, i64) -> i64
      %2426 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2427 = arith.constant 7 : i64
      %2428 = func.call @cc_make_string(%2426, %2427) : (!llvm.ptr, i64) -> i64
      %2429 = func.call @cc_intern(%2425, %2428) : (i64, i64) -> i64
      %2430 = func.call @cc_nil_value() : () -> i64
      %2431 = func.call @cc_cons(%2429, %2430) : (i64, i64) -> i64
      %2432 = func.call @cc_values_pack(%2431) : (i64) -> i64
      func.call @stack_push_pointer(%2429) : (i64) -> ()
      %2433 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2434 = arith.constant 5 : i64
      %2435 = func.call @cc_make_string(%2433, %2434) : (!llvm.ptr, i64) -> i64
      %2436 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2437 = arith.constant 7 : i64
      %2438 = func.call @cc_make_string(%2436, %2437) : (!llvm.ptr, i64) -> i64
      %2439 = func.call @cc_intern(%2435, %2438) : (i64, i64) -> i64
      %2440 = func.call @cc_nil_value() : () -> i64
      %2441 = func.call @cc_cons(%2439, %2440) : (i64, i64) -> i64
      %2442 = func.call @cc_values_pack(%2441) : (i64) -> i64
      func.call @stack_push_pointer(%2439) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2443 = func.call @stack_pop_pointer() : () -> i64
      %2444 = func.call @stack_pop_pointer() : () -> i64
      %2445 = func.call @cc_cons(%2444, %2443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2445) : (i64) -> ()
      %2446 = func.call @stack_pop_pointer() : () -> i64
      %2447 = func.call @stack_pop_pointer() : () -> i64
      %2448 = func.call @cc_cons(%2447, %2446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2448) : (i64) -> ()
      %2449 = func.call @stack_pop_pointer() : () -> i64
      %2450 = func.call @stack_pop_pointer() : () -> i64
      %2451 = func.call @cc_cons(%2450, %2449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2451) : (i64) -> ()
      %2452 = func.call @stack_pop_pointer() : () -> i64
      %2453 = func.call @stack_pop_pointer() : () -> i64
      %2454 = func.call @cc_cons(%2453, %2452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2454) : (i64) -> ()
      %2455 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2456 = arith.constant 3 : i64
      %2457 = func.call @cc_make_string(%2455, %2456) : (!llvm.ptr, i64) -> i64
      %2458 = func.call @cc_nil_value() : () -> i64
      %2459 = func.call @cc_intern(%2457, %2458) : (i64, i64) -> i64
      %2460 = func.call @cc_nil_value() : () -> i64
      %2461 = func.call @cc_cons(%2459, %2460) : (i64, i64) -> i64
      %2462 = func.call @cc_values_pack(%2461) : (i64) -> i64
      func.call @stack_push_pointer(%2459) : (i64) -> ()
      %2463 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2464 = arith.constant 2 : i64
      %2465 = func.call @cc_make_string(%2463, %2464) : (!llvm.ptr, i64) -> i64
      %2466 = func.call @cc_nil_value() : () -> i64
      %2467 = func.call @cc_intern(%2465, %2466) : (i64, i64) -> i64
      %2468 = func.call @cc_nil_value() : () -> i64
      %2469 = func.call @cc_cons(%2467, %2468) : (i64, i64) -> i64
      %2470 = func.call @cc_values_pack(%2469) : (i64) -> i64
      func.call @stack_push_pointer(%2467) : (i64) -> ()
      %2471 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2472 = arith.constant 27 : i64
      %2473 = func.call @cc_make_string(%2471, %2472) : (!llvm.ptr, i64) -> i64
      %2474 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2475 = arith.constant 3 : i64
      %2476 = func.call @cc_make_string(%2474, %2475) : (!llvm.ptr, i64) -> i64
      %2477 = func.call @cc_intern(%2473, %2476) : (i64, i64) -> i64
      %2478 = func.call @cc_nil_value() : () -> i64
      %2479 = func.call @cc_cons(%2477, %2478) : (i64, i64) -> i64
      %2480 = func.call @cc_values_pack(%2479) : (i64) -> i64
      func.call @stack_push_pointer(%2477) : (i64) -> ()
      %2481 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2482 = arith.constant 6 : i64
      %2483 = func.call @cc_make_string(%2481, %2482) : (!llvm.ptr, i64) -> i64
      %2484 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2485 = arith.constant 11 : i64
      %2486 = func.call @cc_make_string(%2484, %2485) : (!llvm.ptr, i64) -> i64
      %2487 = func.call @cc_intern(%2483, %2486) : (i64, i64) -> i64
      %2488 = func.call @cc_nil_value() : () -> i64
      %2489 = func.call @cc_cons(%2487, %2488) : (i64, i64) -> i64
      %2490 = func.call @cc_values_pack(%2489) : (i64) -> i64
      func.call @stack_push_pointer(%2487) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2491 = func.call @stack_pop_pointer() : () -> i64
      %2492 = func.call @stack_pop_pointer() : () -> i64
      %2493 = func.call @cc_cons(%2492, %2491) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2493) : (i64) -> ()
      %2494 = func.call @stack_pop_pointer() : () -> i64
      %2495 = func.call @stack_pop_pointer() : () -> i64
      %2496 = func.call @cc_cons(%2495, %2494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2496) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2497 = func.call @stack_pop_pointer() : () -> i64
      %2498 = func.call @stack_pop_pointer() : () -> i64
      %2499 = func.call @cc_cons(%2498, %2497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2499) : (i64) -> ()
      %2500 = func.call @stack_pop_pointer() : () -> i64
      %2501 = func.call @stack_pop_pointer() : () -> i64
      %2502 = func.call @cc_cons(%2501, %2500) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2502) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2503 = func.call @stack_pop_pointer() : () -> i64
      %2504 = func.call @stack_pop_pointer() : () -> i64
      %2505 = func.call @cc_cons(%2504, %2503) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2505) : (i64) -> ()
      %2506 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2507 = arith.constant 1 : i64
      %2508 = func.call @cc_make_string(%2506, %2507) : (!llvm.ptr, i64) -> i64
      %2509 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2510 = arith.constant 11 : i64
      %2511 = func.call @cc_make_string(%2509, %2510) : (!llvm.ptr, i64) -> i64
      %2512 = func.call @cc_intern(%2508, %2511) : (i64, i64) -> i64
      %2513 = func.call @cc_nil_value() : () -> i64
      %2514 = func.call @cc_cons(%2512, %2513) : (i64, i64) -> i64
      %2515 = func.call @cc_values_pack(%2514) : (i64) -> i64
      func.call @stack_push_pointer(%2512) : (i64) -> ()
      %2516 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2517 = arith.constant 9 : i64
      %2518 = func.call @cc_make_string(%2516, %2517) : (!llvm.ptr, i64) -> i64
      %2519 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2520 = arith.constant 11 : i64
      %2521 = func.call @cc_make_string(%2519, %2520) : (!llvm.ptr, i64) -> i64
      %2522 = func.call @cc_intern(%2518, %2521) : (i64, i64) -> i64
      %2523 = func.call @cc_nil_value() : () -> i64
      %2524 = func.call @cc_cons(%2522, %2523) : (i64, i64) -> i64
      %2525 = func.call @cc_values_pack(%2524) : (i64) -> i64
      func.call @stack_push_pointer(%2522) : (i64) -> ()
      %2526 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2526) : (i64) -> ()
      %2527 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2528 = arith.constant 4 : i64
      %2529 = func.call @cc_make_string(%2527, %2528) : (!llvm.ptr, i64) -> i64
      %2530 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2531 = arith.constant 3 : i64
      %2532 = func.call @cc_make_string(%2530, %2531) : (!llvm.ptr, i64) -> i64
      %2533 = func.call @cc_intern(%2529, %2532) : (i64, i64) -> i64
      %2534 = func.call @cc_nil_value() : () -> i64
      %2535 = func.call @cc_cons(%2533, %2534) : (i64, i64) -> i64
      %2536 = func.call @cc_values_pack(%2535) : (i64) -> i64
      func.call @stack_push_pointer(%2533) : (i64) -> ()
      %2537 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2538 = arith.constant 4 : i64
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
      %2549 = func.call @stack_pop_pointer() : () -> i64
      %2550 = func.call @cc_cons(%2549, %2548) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2550) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2551 = func.call @stack_pop_pointer() : () -> i64
      %2552 = func.call @stack_pop_pointer() : () -> i64
      %2553 = func.call @cc_cons(%2552, %2551) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2553) : (i64) -> ()
      %2554 = func.call @stack_pop_pointer() : () -> i64
      %2555 = func.call @stack_pop_pointer() : () -> i64
      %2556 = func.call @cc_cons(%2555, %2554) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2556) : (i64) -> ()
      %2557 = func.call @stack_pop_pointer() : () -> i64
      %2558 = func.call @stack_pop_pointer() : () -> i64
      %2559 = func.call @cc_cons(%2558, %2557) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2559) : (i64) -> ()
      %2560 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2561 = arith.constant 9 : i64
      %2562 = func.call @cc_make_string(%2560, %2561) : (!llvm.ptr, i64) -> i64
      %2563 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2564 = arith.constant 11 : i64
      %2565 = func.call @cc_make_string(%2563, %2564) : (!llvm.ptr, i64) -> i64
      %2566 = func.call @cc_intern(%2562, %2565) : (i64, i64) -> i64
      %2567 = func.call @cc_nil_value() : () -> i64
      %2568 = func.call @cc_cons(%2566, %2567) : (i64, i64) -> i64
      %2569 = func.call @cc_values_pack(%2568) : (i64) -> i64
      func.call @stack_push_pointer(%2566) : (i64) -> ()
      %2570 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%2570) : (i64) -> ()
      %2571 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2572 = arith.constant 5 : i64
      %2573 = func.call @cc_make_string(%2571, %2572) : (!llvm.ptr, i64) -> i64
      %2574 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2575 = arith.constant 3 : i64
      %2576 = func.call @cc_make_string(%2574, %2575) : (!llvm.ptr, i64) -> i64
      %2577 = func.call @cc_intern(%2573, %2576) : (i64, i64) -> i64
      %2578 = func.call @cc_nil_value() : () -> i64
      %2579 = func.call @cc_cons(%2577, %2578) : (i64, i64) -> i64
      %2580 = func.call @cc_values_pack(%2579) : (i64) -> i64
      func.call @stack_push_pointer(%2577) : (i64) -> ()
      %2581 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2582 = arith.constant 2 : i64
      %2583 = func.call @cc_make_string(%2581, %2582) : (!llvm.ptr, i64) -> i64
      %2584 = func.call @cc_nil_value() : () -> i64
      %2585 = func.call @cc_intern(%2583, %2584) : (i64, i64) -> i64
      %2586 = func.call @cc_nil_value() : () -> i64
      %2587 = func.call @cc_cons(%2585, %2586) : (i64, i64) -> i64
      %2588 = func.call @cc_values_pack(%2587) : (i64) -> i64
      func.call @stack_push_pointer(%2585) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2589 = func.call @stack_pop_pointer() : () -> i64
      %2590 = func.call @stack_pop_pointer() : () -> i64
      %2591 = func.call @cc_cons(%2590, %2589) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2591) : (i64) -> ()
      %2592 = func.call @stack_pop_pointer() : () -> i64
      %2593 = func.call @stack_pop_pointer() : () -> i64
      %2594 = func.call @cc_cons(%2593, %2592) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2594) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2595 = func.call @stack_pop_pointer() : () -> i64
      %2596 = func.call @stack_pop_pointer() : () -> i64
      %2597 = func.call @cc_cons(%2596, %2595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2597) : (i64) -> ()
      %2598 = func.call @stack_pop_pointer() : () -> i64
      %2599 = func.call @stack_pop_pointer() : () -> i64
      %2600 = func.call @cc_cons(%2599, %2598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2600) : (i64) -> ()
      %2601 = func.call @stack_pop_pointer() : () -> i64
      %2602 = func.call @stack_pop_pointer() : () -> i64
      %2603 = func.call @cc_cons(%2602, %2601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2603) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2604 = func.call @stack_pop_pointer() : () -> i64
      %2605 = func.call @stack_pop_pointer() : () -> i64
      %2606 = func.call @cc_cons(%2605, %2604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2606) : (i64) -> ()
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = func.call @stack_pop_pointer() : () -> i64
      %2609 = func.call @cc_cons(%2608, %2607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2609) : (i64) -> ()
      %2610 = func.call @stack_pop_pointer() : () -> i64
      %2611 = func.call @stack_pop_pointer() : () -> i64
      %2612 = func.call @cc_cons(%2611, %2610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2612) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2613 = func.call @stack_pop_pointer() : () -> i64
      %2614 = func.call @stack_pop_pointer() : () -> i64
      %2615 = func.call @cc_cons(%2614, %2613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2615) : (i64) -> ()
      %2616 = func.call @stack_pop_pointer() : () -> i64
      %2617 = func.call @stack_pop_pointer() : () -> i64
      %2618 = func.call @cc_cons(%2617, %2616) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2618) : (i64) -> ()
      %2619 = func.call @stack_pop_pointer() : () -> i64
      %2620 = func.call @stack_pop_pointer() : () -> i64
      %2621 = func.call @cc_cons(%2620, %2619) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2621) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2622 = func.call @stack_pop_pointer() : () -> i64
      %2623 = func.call @stack_pop_pointer() : () -> i64
      %2624 = func.call @cc_cons(%2623, %2622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2624) : (i64) -> ()
      %2625 = func.call @stack_pop_pointer() : () -> i64
      %2626 = func.call @stack_pop_pointer() : () -> i64
      %2627 = func.call @cc_cons(%2626, %2625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2627) : (i64) -> ()
      %2628 = func.call @stack_pop_pointer() : () -> i64
      %2629 = func.call @stack_pop_pointer() : () -> i64
      %2630 = func.call @cc_cons(%2629, %2628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2630) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %2640 = func.call @stack_pop_pointer() : () -> i64
      %2641 = func.call @stack_pop_pointer() : () -> i64
      %2642 = func.call @cc_cons(%2641, %2640) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2642) : (i64) -> ()
      %2643 = func.call @stack_pop_pointer() : () -> i64
      %2644 = func.call @stack_pop_pointer() : () -> i64
      %2645 = func.call @cc_cons(%2644, %2643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2645) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2646 = func.call @stack_pop_pointer() : () -> i64
      %2647 = func.call @stack_pop_pointer() : () -> i64
      %2648 = func.call @cc_cons(%2647, %2646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2648) : (i64) -> ()
      %2649 = func.call @stack_pop_pointer() : () -> i64
      %2650 = func.call @stack_pop_pointer() : () -> i64
      %2651 = func.call @cc_cons(%2650, %2649) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2651) : (i64) -> ()
      %2652 = func.call @stack_pop_pointer() : () -> i64
      %2820 = arith.constant 269090723725320 : i64
      %2821 = arith.constant 0 : i64
      %2822 = func.call @cc_make_closure(%2820, %2821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2822) : (i64) -> ()
      %2823 = func.call @stack_pop_pointer() : () -> i64
      %2824 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2825 = arith.constant 1 : i64
      %2826 = func.call @cc_make_string(%2824, %2825) : (!llvm.ptr, i64) -> i64
      %2827 = func.call @cc_nil_value() : () -> i64
      %2828 = func.call @cc_intern(%2826, %2827) : (i64, i64) -> i64
      %2829 = func.call @cc_nil_value() : () -> i64
      %2830 = func.call @cc_cons(%2828, %2829) : (i64, i64) -> i64
      %2831 = func.call @cc_values_pack(%2830) : (i64) -> i64
      func.call @stack_push_pointer(%2828) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2832 = func.call @stack_pop_pointer() : () -> i64
      %2833 = func.call @stack_pop_pointer() : () -> i64
      %2834 = func.call @cc_cons(%2833, %2832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2834) : (i64) -> ()
      %2835 = func.call @stack_pop_pointer() : () -> i64
      %2836 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2837 = arith.constant 11 : i64
      %2838 = func.call @cc_make_string(%2836, %2837) : (!llvm.ptr, i64) -> i64
      %2839 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2840 = arith.constant 7 : i64
      %2841 = func.call @cc_make_string(%2839, %2840) : (!llvm.ptr, i64) -> i64
      %2842 = func.call @cc_intern(%2838, %2841) : (i64, i64) -> i64
      %2843 = func.call @cc_nil_value() : () -> i64
      %2844 = func.call @cc_cons(%2842, %2843) : (i64, i64) -> i64
      %2845 = func.call @cc_values_pack(%2844) : (i64) -> i64
      func.call @stack_push_pointer(%2842) : (i64) -> ()
      %2846 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2847 = func.call @stack_pop_pointer() : () -> i64
      %2848 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2849 = arith.constant 4 : i64
      %2850 = func.call @cc_make_string(%2848, %2849) : (!llvm.ptr, i64) -> i64
      %2851 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2852 = arith.constant 7 : i64
      %2853 = func.call @cc_make_string(%2851, %2852) : (!llvm.ptr, i64) -> i64
      %2854 = func.call @cc_intern(%2850, %2853) : (i64, i64) -> i64
      %2855 = func.call @cc_nil_value() : () -> i64
      %2856 = func.call @cc_cons(%2854, %2855) : (i64, i64) -> i64
      %2857 = func.call @cc_values_pack(%2856) : (i64) -> i64
      func.call @stack_push_pointer(%2854) : (i64) -> ()
      %2858 = func.call @stack_pop_pointer() : () -> i64
      %2859 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2860 = arith.constant 6 : i64
      %2861 = func.call @cc_make_string(%2859, %2860) : (!llvm.ptr, i64) -> i64
      %2862 = func.call @cc_nil_value() : () -> i64
      %2863 = func.call @cc_intern(%2861, %2862) : (i64, i64) -> i64
      %2864 = func.call @cc_nil_value() : () -> i64
      %2865 = func.call @cc_cons(%2863, %2864) : (i64, i64) -> i64
      %2866 = func.call @cc_values_pack(%2865) : (i64) -> i64
      func.call @stack_push_pointer(%2863) : (i64) -> ()
      %2867 = func.call @stack_pop_pointer() : () -> i64
      %2868 = func.call @cc_nil_value() : () -> i64
      %2869 = func.call @cc_errorp(%2350) : (i64) -> i64
      %2870 = arith.cmpi ne, %2869, %2868 : i64
      %2871 = arith.cmpi eq, %2868, %2868 : i64
      %2872 = arith.andi %2870, %2871 : i1
      %2873 = scf.if %2872 -> (i64) {
        scf.yield %2350 : i64
      } else {
        scf.yield %2868 : i64
      }
      %2874 = func.call @cc_errorp(%2652) : (i64) -> i64
      %2875 = arith.cmpi ne, %2874, %2868 : i64
      %2876 = arith.cmpi eq, %2873, %2868 : i64
      %2877 = arith.andi %2875, %2876 : i1
      %2878 = scf.if %2877 -> (i64) {
        scf.yield %2652 : i64
      } else {
        scf.yield %2873 : i64
      }
      %2879 = func.call @cc_errorp(%2823) : (i64) -> i64
      %2880 = arith.cmpi ne, %2879, %2868 : i64
      %2881 = arith.cmpi eq, %2878, %2868 : i64
      %2882 = arith.andi %2880, %2881 : i1
      %2883 = scf.if %2882 -> (i64) {
        scf.yield %2823 : i64
      } else {
        scf.yield %2878 : i64
      }
      %2884 = func.call @cc_errorp(%2835) : (i64) -> i64
      %2885 = arith.cmpi ne, %2884, %2868 : i64
      %2886 = arith.cmpi eq, %2883, %2868 : i64
      %2887 = arith.andi %2885, %2886 : i1
      %2888 = scf.if %2887 -> (i64) {
        scf.yield %2835 : i64
      } else {
        scf.yield %2883 : i64
      }
      %2889 = func.call @cc_errorp(%2846) : (i64) -> i64
      %2890 = arith.cmpi ne, %2889, %2868 : i64
      %2891 = arith.cmpi eq, %2888, %2868 : i64
      %2892 = arith.andi %2890, %2891 : i1
      %2893 = scf.if %2892 -> (i64) {
        scf.yield %2846 : i64
      } else {
        scf.yield %2888 : i64
      }
      %2894 = func.call @cc_errorp(%2847) : (i64) -> i64
      %2895 = arith.cmpi ne, %2894, %2868 : i64
      %2896 = arith.cmpi eq, %2893, %2868 : i64
      %2897 = arith.andi %2895, %2896 : i1
      %2898 = scf.if %2897 -> (i64) {
        scf.yield %2847 : i64
      } else {
        scf.yield %2893 : i64
      }
      %2899 = func.call @cc_errorp(%2858) : (i64) -> i64
      %2900 = arith.cmpi ne, %2899, %2868 : i64
      %2901 = arith.cmpi eq, %2898, %2868 : i64
      %2902 = arith.andi %2900, %2901 : i1
      %2903 = scf.if %2902 -> (i64) {
        scf.yield %2858 : i64
      } else {
        scf.yield %2898 : i64
      }
      %2904 = func.call @cc_errorp(%2867) : (i64) -> i64
      %2905 = arith.cmpi ne, %2904, %2868 : i64
      %2906 = arith.cmpi eq, %2903, %2868 : i64
      %2907 = arith.andi %2905, %2906 : i1
      %2908 = scf.if %2907 -> (i64) {
        scf.yield %2867 : i64
      } else {
        scf.yield %2903 : i64
      }
      %2909 = arith.cmpi ne, %2908, %2868 : i64
      scf.if %2909 {
        func.call @stack_push_pointer(%2908) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2350) : (i64) -> ()
        func.call @stack_push_pointer(%2652) : (i64) -> ()
        func.call @stack_push_pointer(%2823) : (i64) -> ()
        func.call @stack_push_pointer(%2835) : (i64) -> ()
        func.call @stack_push_pointer(%2846) : (i64) -> ()
        func.call @stack_push_pointer(%2847) : (i64) -> ()
        func.call @stack_push_pointer(%2858) : (i64) -> ()
        func.call @stack_push_pointer(%2867) : (i64) -> ()
        %2910 = llvm.mlir.addressof @str248 : !llvm.ptr
        %2911 = func.call @cc_make_function_ref_const(%2910) : (!llvm.ptr) -> i64
        %2912 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2911, %2912) : (i64, i64) -> ()
      }
      %2913 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2913 : i64
    }
    %2914 = func.call @cc_nil_value() : () -> i64
    %2915 = func.call @cc_errorp(%2341) : (i64) -> i64
    %2916 = arith.cmpi ne, %2915, %2914 : i64
    %2917 = scf.if %2916 -> (i64) {
      scf.yield %2341 : i64
    } else {
      %2918 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2919 = arith.constant 10 : i64
      %2920 = func.call @cc_make_string(%2918, %2919) : (!llvm.ptr, i64) -> i64
      %2921 = func.call @cc_nil_value() : () -> i64
      %2922 = func.call @cc_intern(%2920, %2921) : (i64, i64) -> i64
      %2923 = func.call @cc_nil_value() : () -> i64
      %2924 = func.call @cc_cons(%2922, %2923) : (i64, i64) -> i64
      %2925 = func.call @cc_values_pack(%2924) : (i64) -> i64
      func.call @stack_push_pointer(%2922) : (i64) -> ()
      %2926 = func.call @stack_pop_pointer() : () -> i64
      %2927 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2928 = arith.constant 3 : i64
      %2929 = func.call @cc_make_string(%2927, %2928) : (!llvm.ptr, i64) -> i64
      %2930 = func.call @cc_nil_value() : () -> i64
      %2931 = func.call @cc_intern(%2929, %2930) : (i64, i64) -> i64
      %2932 = func.call @cc_nil_value() : () -> i64
      %2933 = func.call @cc_cons(%2931, %2932) : (i64, i64) -> i64
      %2934 = func.call @cc_values_pack(%2933) : (i64) -> i64
      func.call @stack_push_pointer(%2931) : (i64) -> ()
      %2935 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2936 = arith.constant 3 : i64
      %2937 = func.call @cc_make_string(%2935, %2936) : (!llvm.ptr, i64) -> i64
      %2938 = func.call @cc_nil_value() : () -> i64
      %2939 = func.call @cc_intern(%2937, %2938) : (i64, i64) -> i64
      %2940 = func.call @cc_nil_value() : () -> i64
      %2941 = func.call @cc_cons(%2939, %2940) : (i64, i64) -> i64
      %2942 = func.call @cc_values_pack(%2941) : (i64) -> i64
      func.call @stack_push_pointer(%2939) : (i64) -> ()
      %2943 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2944 = arith.constant 3 : i64
      %2945 = func.call @cc_make_string(%2943, %2944) : (!llvm.ptr, i64) -> i64
      %2946 = func.call @cc_nil_value() : () -> i64
      %2947 = func.call @cc_intern(%2945, %2946) : (i64, i64) -> i64
      %2948 = func.call @cc_nil_value() : () -> i64
      %2949 = func.call @cc_cons(%2947, %2948) : (i64, i64) -> i64
      %2950 = func.call @cc_values_pack(%2949) : (i64) -> i64
      func.call @stack_push_pointer(%2947) : (i64) -> ()
      %2951 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2952 = arith.constant 4 : i64
      %2953 = func.call @cc_make_string(%2951, %2952) : (!llvm.ptr, i64) -> i64
      %2954 = func.call @cc_nil_value() : () -> i64
      %2955 = func.call @cc_intern(%2953, %2954) : (i64, i64) -> i64
      %2956 = func.call @cc_nil_value() : () -> i64
      %2957 = func.call @cc_cons(%2955, %2956) : (i64, i64) -> i64
      %2958 = func.call @cc_values_pack(%2957) : (i64) -> i64
      func.call @stack_push_pointer(%2955) : (i64) -> ()
      %2959 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2960 = arith.constant 42 : i64
      %2961 = func.call @cc_make_string(%2959, %2960) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2961) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2962 = func.call @stack_pop_pointer() : () -> i64
      %2963 = func.call @stack_pop_pointer() : () -> i64
      %2964 = func.call @cc_cons(%2963, %2962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2964) : (i64) -> ()
      %2965 = func.call @stack_pop_pointer() : () -> i64
      %2966 = func.call @stack_pop_pointer() : () -> i64
      %2967 = func.call @cc_cons(%2966, %2965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2967) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2968 = func.call @stack_pop_pointer() : () -> i64
      %2969 = func.call @stack_pop_pointer() : () -> i64
      %2970 = func.call @cc_cons(%2969, %2968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2970) : (i64) -> ()
      %2971 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2972 = arith.constant 14 : i64
      %2973 = func.call @cc_make_string(%2971, %2972) : (!llvm.ptr, i64) -> i64
      %2974 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2975 = arith.constant 11 : i64
      %2976 = func.call @cc_make_string(%2974, %2975) : (!llvm.ptr, i64) -> i64
      %2977 = func.call @cc_intern(%2973, %2976) : (i64, i64) -> i64
      %2978 = func.call @cc_nil_value() : () -> i64
      %2979 = func.call @cc_cons(%2977, %2978) : (i64, i64) -> i64
      %2980 = func.call @cc_values_pack(%2979) : (i64) -> i64
      func.call @stack_push_pointer(%2977) : (i64) -> ()
      %2981 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2982 = arith.constant 6 : i64
      %2983 = func.call @cc_make_string(%2981, %2982) : (!llvm.ptr, i64) -> i64
      %2984 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2985 = arith.constant 11 : i64
      %2986 = func.call @cc_make_string(%2984, %2985) : (!llvm.ptr, i64) -> i64
      %2987 = func.call @cc_intern(%2983, %2986) : (i64, i64) -> i64
      %2988 = func.call @cc_nil_value() : () -> i64
      %2989 = func.call @cc_cons(%2987, %2988) : (i64, i64) -> i64
      %2990 = func.call @cc_values_pack(%2989) : (i64) -> i64
      func.call @stack_push_pointer(%2987) : (i64) -> ()
      %2991 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2992 = arith.constant 4 : i64
      %2993 = func.call @cc_make_string(%2991, %2992) : (!llvm.ptr, i64) -> i64
      %2994 = func.call @cc_nil_value() : () -> i64
      %2995 = func.call @cc_intern(%2993, %2994) : (i64, i64) -> i64
      %2996 = func.call @cc_nil_value() : () -> i64
      %2997 = func.call @cc_cons(%2995, %2996) : (i64, i64) -> i64
      %2998 = func.call @cc_values_pack(%2997) : (i64) -> i64
      func.call @stack_push_pointer(%2995) : (i64) -> ()
      %2999 = llvm.mlir.addressof @str260 : !llvm.ptr
      %3000 = arith.constant 9 : i64
      %3001 = func.call @cc_make_string(%2999, %3000) : (!llvm.ptr, i64) -> i64
      %3002 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3003 = arith.constant 7 : i64
      %3004 = func.call @cc_make_string(%3002, %3003) : (!llvm.ptr, i64) -> i64
      %3005 = func.call @cc_intern(%3001, %3004) : (i64, i64) -> i64
      %3006 = func.call @cc_nil_value() : () -> i64
      %3007 = func.call @cc_cons(%3005, %3006) : (i64, i64) -> i64
      %3008 = func.call @cc_values_pack(%3007) : (i64) -> i64
      func.call @stack_push_pointer(%3005) : (i64) -> ()
      %3009 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3010 = arith.constant 5 : i64
      %3011 = func.call @cc_make_string(%3009, %3010) : (!llvm.ptr, i64) -> i64
      %3012 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3013 = arith.constant 7 : i64
      %3014 = func.call @cc_make_string(%3012, %3013) : (!llvm.ptr, i64) -> i64
      %3015 = func.call @cc_intern(%3011, %3014) : (i64, i64) -> i64
      %3016 = func.call @cc_nil_value() : () -> i64
      %3017 = func.call @cc_cons(%3015, %3016) : (i64, i64) -> i64
      %3018 = func.call @cc_values_pack(%3017) : (i64) -> i64
      func.call @stack_push_pointer(%3015) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3019 = func.call @stack_pop_pointer() : () -> i64
      %3020 = func.call @stack_pop_pointer() : () -> i64
      %3021 = func.call @cc_cons(%3020, %3019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3021) : (i64) -> ()
      %3022 = func.call @stack_pop_pointer() : () -> i64
      %3023 = func.call @stack_pop_pointer() : () -> i64
      %3024 = func.call @cc_cons(%3023, %3022) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3024) : (i64) -> ()
      %3025 = func.call @stack_pop_pointer() : () -> i64
      %3026 = func.call @stack_pop_pointer() : () -> i64
      %3027 = func.call @cc_cons(%3026, %3025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3027) : (i64) -> ()
      %3028 = func.call @stack_pop_pointer() : () -> i64
      %3029 = func.call @stack_pop_pointer() : () -> i64
      %3030 = func.call @cc_cons(%3029, %3028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3030) : (i64) -> ()
      %3031 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3032 = arith.constant 3 : i64
      %3033 = func.call @cc_make_string(%3031, %3032) : (!llvm.ptr, i64) -> i64
      %3034 = func.call @cc_nil_value() : () -> i64
      %3035 = func.call @cc_intern(%3033, %3034) : (i64, i64) -> i64
      %3036 = func.call @cc_nil_value() : () -> i64
      %3037 = func.call @cc_cons(%3035, %3036) : (i64, i64) -> i64
      %3038 = func.call @cc_values_pack(%3037) : (i64) -> i64
      func.call @stack_push_pointer(%3035) : (i64) -> ()
      %3039 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3040 = arith.constant 2 : i64
      %3041 = func.call @cc_make_string(%3039, %3040) : (!llvm.ptr, i64) -> i64
      %3042 = func.call @cc_nil_value() : () -> i64
      %3043 = func.call @cc_intern(%3041, %3042) : (i64, i64) -> i64
      %3044 = func.call @cc_nil_value() : () -> i64
      %3045 = func.call @cc_cons(%3043, %3044) : (i64, i64) -> i64
      %3046 = func.call @cc_values_pack(%3045) : (i64) -> i64
      func.call @stack_push_pointer(%3043) : (i64) -> ()
      %3047 = llvm.mlir.addressof @str266 : !llvm.ptr
      %3048 = arith.constant 27 : i64
      %3049 = func.call @cc_make_string(%3047, %3048) : (!llvm.ptr, i64) -> i64
      %3050 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3051 = arith.constant 3 : i64
      %3052 = func.call @cc_make_string(%3050, %3051) : (!llvm.ptr, i64) -> i64
      %3053 = func.call @cc_intern(%3049, %3052) : (i64, i64) -> i64
      %3054 = func.call @cc_nil_value() : () -> i64
      %3055 = func.call @cc_cons(%3053, %3054) : (i64, i64) -> i64
      %3056 = func.call @cc_values_pack(%3055) : (i64) -> i64
      func.call @stack_push_pointer(%3053) : (i64) -> ()
      %3057 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3058 = arith.constant 6 : i64
      %3059 = func.call @cc_make_string(%3057, %3058) : (!llvm.ptr, i64) -> i64
      %3060 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3061 = arith.constant 11 : i64
      %3062 = func.call @cc_make_string(%3060, %3061) : (!llvm.ptr, i64) -> i64
      %3063 = func.call @cc_intern(%3059, %3062) : (i64, i64) -> i64
      %3064 = func.call @cc_nil_value() : () -> i64
      %3065 = func.call @cc_cons(%3063, %3064) : (i64, i64) -> i64
      %3066 = func.call @cc_values_pack(%3065) : (i64) -> i64
      func.call @stack_push_pointer(%3063) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3067 = func.call @stack_pop_pointer() : () -> i64
      %3068 = func.call @stack_pop_pointer() : () -> i64
      %3069 = func.call @cc_cons(%3068, %3067) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3069) : (i64) -> ()
      %3070 = func.call @stack_pop_pointer() : () -> i64
      %3071 = func.call @stack_pop_pointer() : () -> i64
      %3072 = func.call @cc_cons(%3071, %3070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3072) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3073 = func.call @stack_pop_pointer() : () -> i64
      %3074 = func.call @stack_pop_pointer() : () -> i64
      %3075 = func.call @cc_cons(%3074, %3073) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3075) : (i64) -> ()
      %3076 = func.call @stack_pop_pointer() : () -> i64
      %3077 = func.call @stack_pop_pointer() : () -> i64
      %3078 = func.call @cc_cons(%3077, %3076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3078) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3079 = func.call @stack_pop_pointer() : () -> i64
      %3080 = func.call @stack_pop_pointer() : () -> i64
      %3081 = func.call @cc_cons(%3080, %3079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3081) : (i64) -> ()
      %3082 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3083 = arith.constant 1 : i64
      %3084 = func.call @cc_make_string(%3082, %3083) : (!llvm.ptr, i64) -> i64
      %3085 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3086 = arith.constant 11 : i64
      %3087 = func.call @cc_make_string(%3085, %3086) : (!llvm.ptr, i64) -> i64
      %3088 = func.call @cc_intern(%3084, %3087) : (i64, i64) -> i64
      %3089 = func.call @cc_nil_value() : () -> i64
      %3090 = func.call @cc_cons(%3088, %3089) : (i64, i64) -> i64
      %3091 = func.call @cc_values_pack(%3090) : (i64) -> i64
      func.call @stack_push_pointer(%3088) : (i64) -> ()
      %3092 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3093 = arith.constant 9 : i64
      %3094 = func.call @cc_make_string(%3092, %3093) : (!llvm.ptr, i64) -> i64
      %3095 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3096 = arith.constant 11 : i64
      %3097 = func.call @cc_make_string(%3095, %3096) : (!llvm.ptr, i64) -> i64
      %3098 = func.call @cc_intern(%3094, %3097) : (i64, i64) -> i64
      %3099 = func.call @cc_nil_value() : () -> i64
      %3100 = func.call @cc_cons(%3098, %3099) : (i64, i64) -> i64
      %3101 = func.call @cc_values_pack(%3100) : (i64) -> i64
      func.call @stack_push_pointer(%3098) : (i64) -> ()
      %3102 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3102) : (i64) -> ()
      %3103 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3104 = arith.constant 4 : i64
      %3105 = func.call @cc_make_string(%3103, %3104) : (!llvm.ptr, i64) -> i64
      %3106 = llvm.mlir.addressof @str275 : !llvm.ptr
      %3107 = arith.constant 3 : i64
      %3108 = func.call @cc_make_string(%3106, %3107) : (!llvm.ptr, i64) -> i64
      %3109 = func.call @cc_intern(%3105, %3108) : (i64, i64) -> i64
      %3110 = func.call @cc_nil_value() : () -> i64
      %3111 = func.call @cc_cons(%3109, %3110) : (i64, i64) -> i64
      %3112 = func.call @cc_values_pack(%3111) : (i64) -> i64
      func.call @stack_push_pointer(%3109) : (i64) -> ()
      %3113 = llvm.mlir.addressof @str276 : !llvm.ptr
      %3114 = arith.constant 4 : i64
      %3115 = func.call @cc_make_string(%3113, %3114) : (!llvm.ptr, i64) -> i64
      %3116 = func.call @cc_nil_value() : () -> i64
      %3117 = func.call @cc_intern(%3115, %3116) : (i64, i64) -> i64
      %3118 = func.call @cc_nil_value() : () -> i64
      %3119 = func.call @cc_cons(%3117, %3118) : (i64, i64) -> i64
      %3120 = func.call @cc_values_pack(%3119) : (i64) -> i64
      func.call @stack_push_pointer(%3117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3121 = func.call @stack_pop_pointer() : () -> i64
      %3122 = func.call @stack_pop_pointer() : () -> i64
      %3123 = func.call @cc_cons(%3122, %3121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3123) : (i64) -> ()
      %3124 = func.call @stack_pop_pointer() : () -> i64
      %3125 = func.call @stack_pop_pointer() : () -> i64
      %3126 = func.call @cc_cons(%3125, %3124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3126) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3127 = func.call @stack_pop_pointer() : () -> i64
      %3128 = func.call @stack_pop_pointer() : () -> i64
      %3129 = func.call @cc_cons(%3128, %3127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3129) : (i64) -> ()
      %3130 = func.call @stack_pop_pointer() : () -> i64
      %3131 = func.call @stack_pop_pointer() : () -> i64
      %3132 = func.call @cc_cons(%3131, %3130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3132) : (i64) -> ()
      %3133 = func.call @stack_pop_pointer() : () -> i64
      %3134 = func.call @stack_pop_pointer() : () -> i64
      %3135 = func.call @cc_cons(%3134, %3133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3135) : (i64) -> ()
      %3136 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3137 = arith.constant 9 : i64
      %3138 = func.call @cc_make_string(%3136, %3137) : (!llvm.ptr, i64) -> i64
      %3139 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3140 = arith.constant 11 : i64
      %3141 = func.call @cc_make_string(%3139, %3140) : (!llvm.ptr, i64) -> i64
      %3142 = func.call @cc_intern(%3138, %3141) : (i64, i64) -> i64
      %3143 = func.call @cc_nil_value() : () -> i64
      %3144 = func.call @cc_cons(%3142, %3143) : (i64, i64) -> i64
      %3145 = func.call @cc_values_pack(%3144) : (i64) -> i64
      func.call @stack_push_pointer(%3142) : (i64) -> ()
      %3146 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%3146) : (i64) -> ()
      %3147 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3148 = arith.constant 5 : i64
      %3149 = func.call @cc_make_string(%3147, %3148) : (!llvm.ptr, i64) -> i64
      %3150 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3151 = arith.constant 3 : i64
      %3152 = func.call @cc_make_string(%3150, %3151) : (!llvm.ptr, i64) -> i64
      %3153 = func.call @cc_intern(%3149, %3152) : (i64, i64) -> i64
      %3154 = func.call @cc_nil_value() : () -> i64
      %3155 = func.call @cc_cons(%3153, %3154) : (i64, i64) -> i64
      %3156 = func.call @cc_values_pack(%3155) : (i64) -> i64
      func.call @stack_push_pointer(%3153) : (i64) -> ()
      %3157 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3158 = arith.constant 2 : i64
      %3159 = func.call @cc_make_string(%3157, %3158) : (!llvm.ptr, i64) -> i64
      %3160 = func.call @cc_nil_value() : () -> i64
      %3161 = func.call @cc_intern(%3159, %3160) : (i64, i64) -> i64
      %3162 = func.call @cc_nil_value() : () -> i64
      %3163 = func.call @cc_cons(%3161, %3162) : (i64, i64) -> i64
      %3164 = func.call @cc_values_pack(%3163) : (i64) -> i64
      func.call @stack_push_pointer(%3161) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3165 = func.call @stack_pop_pointer() : () -> i64
      %3166 = func.call @stack_pop_pointer() : () -> i64
      %3167 = func.call @cc_cons(%3166, %3165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3167) : (i64) -> ()
      %3168 = func.call @stack_pop_pointer() : () -> i64
      %3169 = func.call @stack_pop_pointer() : () -> i64
      %3170 = func.call @cc_cons(%3169, %3168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3170) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3171 = func.call @stack_pop_pointer() : () -> i64
      %3172 = func.call @stack_pop_pointer() : () -> i64
      %3173 = func.call @cc_cons(%3172, %3171) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3173) : (i64) -> ()
      %3174 = func.call @stack_pop_pointer() : () -> i64
      %3175 = func.call @stack_pop_pointer() : () -> i64
      %3176 = func.call @cc_cons(%3175, %3174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3176) : (i64) -> ()
      %3177 = func.call @stack_pop_pointer() : () -> i64
      %3178 = func.call @stack_pop_pointer() : () -> i64
      %3179 = func.call @cc_cons(%3178, %3177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3179) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3180 = func.call @stack_pop_pointer() : () -> i64
      %3181 = func.call @stack_pop_pointer() : () -> i64
      %3182 = func.call @cc_cons(%3181, %3180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3182) : (i64) -> ()
      %3183 = func.call @stack_pop_pointer() : () -> i64
      %3184 = func.call @stack_pop_pointer() : () -> i64
      %3185 = func.call @cc_cons(%3184, %3183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3185) : (i64) -> ()
      %3186 = func.call @stack_pop_pointer() : () -> i64
      %3187 = func.call @stack_pop_pointer() : () -> i64
      %3188 = func.call @cc_cons(%3187, %3186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3188) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3189 = func.call @stack_pop_pointer() : () -> i64
      %3190 = func.call @stack_pop_pointer() : () -> i64
      %3191 = func.call @cc_cons(%3190, %3189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3191) : (i64) -> ()
      %3192 = func.call @stack_pop_pointer() : () -> i64
      %3193 = func.call @stack_pop_pointer() : () -> i64
      %3194 = func.call @cc_cons(%3193, %3192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3194) : (i64) -> ()
      %3195 = func.call @stack_pop_pointer() : () -> i64
      %3196 = func.call @stack_pop_pointer() : () -> i64
      %3197 = func.call @cc_cons(%3196, %3195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3197) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3198 = func.call @stack_pop_pointer() : () -> i64
      %3199 = func.call @stack_pop_pointer() : () -> i64
      %3200 = func.call @cc_cons(%3199, %3198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3200) : (i64) -> ()
      %3201 = func.call @stack_pop_pointer() : () -> i64
      %3202 = func.call @stack_pop_pointer() : () -> i64
      %3203 = func.call @cc_cons(%3202, %3201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3203) : (i64) -> ()
      %3204 = func.call @stack_pop_pointer() : () -> i64
      %3205 = func.call @stack_pop_pointer() : () -> i64
      %3206 = func.call @cc_cons(%3205, %3204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3206) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3207 = func.call @stack_pop_pointer() : () -> i64
      %3208 = func.call @stack_pop_pointer() : () -> i64
      %3209 = func.call @cc_cons(%3208, %3207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3209) : (i64) -> ()
      %3210 = func.call @stack_pop_pointer() : () -> i64
      %3211 = func.call @stack_pop_pointer() : () -> i64
      %3212 = func.call @cc_cons(%3211, %3210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3212) : (i64) -> ()
      %3213 = func.call @stack_pop_pointer() : () -> i64
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @cc_cons(%3214, %3213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3216 = func.call @stack_pop_pointer() : () -> i64
      %3217 = func.call @stack_pop_pointer() : () -> i64
      %3218 = func.call @cc_cons(%3217, %3216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3218) : (i64) -> ()
      %3219 = func.call @stack_pop_pointer() : () -> i64
      %3220 = func.call @stack_pop_pointer() : () -> i64
      %3221 = func.call @cc_cons(%3220, %3219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3221) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3222 = func.call @stack_pop_pointer() : () -> i64
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3224 = func.call @cc_cons(%3223, %3222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3224) : (i64) -> ()
      %3225 = func.call @stack_pop_pointer() : () -> i64
      %3226 = func.call @stack_pop_pointer() : () -> i64
      %3227 = func.call @cc_cons(%3226, %3225) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3227) : (i64) -> ()
      %3228 = func.call @stack_pop_pointer() : () -> i64
      %3396 = arith.constant 269090723725321 : i64
      %3397 = arith.constant 0 : i64
      %3398 = func.call @cc_make_closure(%3396, %3397) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3398) : (i64) -> ()
      %3399 = func.call @stack_pop_pointer() : () -> i64
      %3400 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3401 = arith.constant 1 : i64
      %3402 = func.call @cc_make_string(%3400, %3401) : (!llvm.ptr, i64) -> i64
      %3403 = func.call @cc_nil_value() : () -> i64
      %3404 = func.call @cc_intern(%3402, %3403) : (i64, i64) -> i64
      %3405 = func.call @cc_nil_value() : () -> i64
      %3406 = func.call @cc_cons(%3404, %3405) : (i64, i64) -> i64
      %3407 = func.call @cc_values_pack(%3406) : (i64) -> i64
      func.call @stack_push_pointer(%3404) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3408 = func.call @stack_pop_pointer() : () -> i64
      %3409 = func.call @stack_pop_pointer() : () -> i64
      %3410 = func.call @cc_cons(%3409, %3408) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3410) : (i64) -> ()
      %3411 = func.call @stack_pop_pointer() : () -> i64
      %3412 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3413 = arith.constant 11 : i64
      %3414 = func.call @cc_make_string(%3412, %3413) : (!llvm.ptr, i64) -> i64
      %3415 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3416 = arith.constant 7 : i64
      %3417 = func.call @cc_make_string(%3415, %3416) : (!llvm.ptr, i64) -> i64
      %3418 = func.call @cc_intern(%3414, %3417) : (i64, i64) -> i64
      %3419 = func.call @cc_nil_value() : () -> i64
      %3420 = func.call @cc_cons(%3418, %3419) : (i64, i64) -> i64
      %3421 = func.call @cc_values_pack(%3420) : (i64) -> i64
      func.call @stack_push_pointer(%3418) : (i64) -> ()
      %3422 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3423 = func.call @stack_pop_pointer() : () -> i64
      %3424 = llvm.mlir.addressof @str295 : !llvm.ptr
      %3425 = arith.constant 4 : i64
      %3426 = func.call @cc_make_string(%3424, %3425) : (!llvm.ptr, i64) -> i64
      %3427 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3428 = arith.constant 7 : i64
      %3429 = func.call @cc_make_string(%3427, %3428) : (!llvm.ptr, i64) -> i64
      %3430 = func.call @cc_intern(%3426, %3429) : (i64, i64) -> i64
      %3431 = func.call @cc_nil_value() : () -> i64
      %3432 = func.call @cc_cons(%3430, %3431) : (i64, i64) -> i64
      %3433 = func.call @cc_values_pack(%3432) : (i64) -> i64
      func.call @stack_push_pointer(%3430) : (i64) -> ()
      %3434 = func.call @stack_pop_pointer() : () -> i64
      %3435 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3436 = arith.constant 6 : i64
      %3437 = func.call @cc_make_string(%3435, %3436) : (!llvm.ptr, i64) -> i64
      %3438 = func.call @cc_nil_value() : () -> i64
      %3439 = func.call @cc_intern(%3437, %3438) : (i64, i64) -> i64
      %3440 = func.call @cc_nil_value() : () -> i64
      %3441 = func.call @cc_cons(%3439, %3440) : (i64, i64) -> i64
      %3442 = func.call @cc_values_pack(%3441) : (i64) -> i64
      func.call @stack_push_pointer(%3439) : (i64) -> ()
      %3443 = func.call @stack_pop_pointer() : () -> i64
      %3444 = func.call @cc_nil_value() : () -> i64
      %3445 = func.call @cc_errorp(%2926) : (i64) -> i64
      %3446 = arith.cmpi ne, %3445, %3444 : i64
      %3447 = arith.cmpi eq, %3444, %3444 : i64
      %3448 = arith.andi %3446, %3447 : i1
      %3449 = scf.if %3448 -> (i64) {
        scf.yield %2926 : i64
      } else {
        scf.yield %3444 : i64
      }
      %3450 = func.call @cc_errorp(%3228) : (i64) -> i64
      %3451 = arith.cmpi ne, %3450, %3444 : i64
      %3452 = arith.cmpi eq, %3449, %3444 : i64
      %3453 = arith.andi %3451, %3452 : i1
      %3454 = scf.if %3453 -> (i64) {
        scf.yield %3228 : i64
      } else {
        scf.yield %3449 : i64
      }
      %3455 = func.call @cc_errorp(%3399) : (i64) -> i64
      %3456 = arith.cmpi ne, %3455, %3444 : i64
      %3457 = arith.cmpi eq, %3454, %3444 : i64
      %3458 = arith.andi %3456, %3457 : i1
      %3459 = scf.if %3458 -> (i64) {
        scf.yield %3399 : i64
      } else {
        scf.yield %3454 : i64
      }
      %3460 = func.call @cc_errorp(%3411) : (i64) -> i64
      %3461 = arith.cmpi ne, %3460, %3444 : i64
      %3462 = arith.cmpi eq, %3459, %3444 : i64
      %3463 = arith.andi %3461, %3462 : i1
      %3464 = scf.if %3463 -> (i64) {
        scf.yield %3411 : i64
      } else {
        scf.yield %3459 : i64
      }
      %3465 = func.call @cc_errorp(%3422) : (i64) -> i64
      %3466 = arith.cmpi ne, %3465, %3444 : i64
      %3467 = arith.cmpi eq, %3464, %3444 : i64
      %3468 = arith.andi %3466, %3467 : i1
      %3469 = scf.if %3468 -> (i64) {
        scf.yield %3422 : i64
      } else {
        scf.yield %3464 : i64
      }
      %3470 = func.call @cc_errorp(%3423) : (i64) -> i64
      %3471 = arith.cmpi ne, %3470, %3444 : i64
      %3472 = arith.cmpi eq, %3469, %3444 : i64
      %3473 = arith.andi %3471, %3472 : i1
      %3474 = scf.if %3473 -> (i64) {
        scf.yield %3423 : i64
      } else {
        scf.yield %3469 : i64
      }
      %3475 = func.call @cc_errorp(%3434) : (i64) -> i64
      %3476 = arith.cmpi ne, %3475, %3444 : i64
      %3477 = arith.cmpi eq, %3474, %3444 : i64
      %3478 = arith.andi %3476, %3477 : i1
      %3479 = scf.if %3478 -> (i64) {
        scf.yield %3434 : i64
      } else {
        scf.yield %3474 : i64
      }
      %3480 = func.call @cc_errorp(%3443) : (i64) -> i64
      %3481 = arith.cmpi ne, %3480, %3444 : i64
      %3482 = arith.cmpi eq, %3479, %3444 : i64
      %3483 = arith.andi %3481, %3482 : i1
      %3484 = scf.if %3483 -> (i64) {
        scf.yield %3443 : i64
      } else {
        scf.yield %3479 : i64
      }
      %3485 = arith.cmpi ne, %3484, %3444 : i64
      scf.if %3485 {
        func.call @stack_push_pointer(%3484) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2926) : (i64) -> ()
        func.call @stack_push_pointer(%3228) : (i64) -> ()
        func.call @stack_push_pointer(%3399) : (i64) -> ()
        func.call @stack_push_pointer(%3411) : (i64) -> ()
        func.call @stack_push_pointer(%3422) : (i64) -> ()
        func.call @stack_push_pointer(%3423) : (i64) -> ()
        func.call @stack_push_pointer(%3434) : (i64) -> ()
        func.call @stack_push_pointer(%3443) : (i64) -> ()
        %3486 = llvm.mlir.addressof @str298 : !llvm.ptr
        %3487 = func.call @cc_make_function_ref_const(%3486) : (!llvm.ptr) -> i64
        %3488 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3487, %3488) : (i64, i64) -> ()
      }
      %3489 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3489 : i64
    }
    %3490 = func.call @cc_nil_value() : () -> i64
    %3491 = func.call @cc_errorp(%2917) : (i64) -> i64
    %3492 = arith.cmpi ne, %3491, %3490 : i64
    %3493 = scf.if %3492 -> (i64) {
      scf.yield %2917 : i64
    } else {
      %3494 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3495 = arith.constant 38 : i64
      %3496 = func.call @cc_make_string(%3494, %3495) : (!llvm.ptr, i64) -> i64
      %3497 = func.call @cc_nil_value() : () -> i64
      %3498 = func.call @cc_intern(%3496, %3497) : (i64, i64) -> i64
      %3499 = func.call @cc_nil_value() : () -> i64
      %3500 = func.call @cc_cons(%3498, %3499) : (i64, i64) -> i64
      %3501 = func.call @cc_values_pack(%3500) : (i64) -> i64
      func.call @stack_push_pointer(%3498) : (i64) -> ()
      %3502 = func.call @stack_pop_pointer() : () -> i64
      %3503 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3504 = arith.constant 13 : i64
      %3505 = func.call @cc_make_string(%3503, %3504) : (!llvm.ptr, i64) -> i64
      %3506 = llvm.mlir.addressof @str301 : !llvm.ptr
      %3507 = arith.constant 11 : i64
      %3508 = func.call @cc_make_string(%3506, %3507) : (!llvm.ptr, i64) -> i64
      %3509 = func.call @cc_intern(%3505, %3508) : (i64, i64) -> i64
      %3510 = func.call @cc_nil_value() : () -> i64
      %3511 = func.call @cc_cons(%3509, %3510) : (i64, i64) -> i64
      %3512 = func.call @cc_values_pack(%3511) : (i64) -> i64
      func.call @stack_push_pointer(%3509) : (i64) -> ()
      %3513 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3514 = arith.constant 6 : i64
      %3515 = func.call @cc_make_string(%3513, %3514) : (!llvm.ptr, i64) -> i64
      %3516 = func.call @cc_nil_value() : () -> i64
      %3517 = func.call @cc_intern(%3515, %3516) : (i64, i64) -> i64
      %3518 = func.call @cc_nil_value() : () -> i64
      %3519 = func.call @cc_cons(%3517, %3518) : (i64, i64) -> i64
      %3520 = func.call @cc_values_pack(%3519) : (i64) -> i64
      func.call @stack_push_pointer(%3517) : (i64) -> ()
      %3521 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3522 = arith.constant 19 : i64
      %3523 = func.call @cc_make_string(%3521, %3522) : (!llvm.ptr, i64) -> i64
      %3524 = func.call @cc_nil_value() : () -> i64
      %3525 = func.call @cc_intern(%3523, %3524) : (i64, i64) -> i64
      %3526 = func.call @cc_nil_value() : () -> i64
      %3527 = func.call @cc_cons(%3525, %3526) : (i64, i64) -> i64
      %3528 = func.call @cc_values_pack(%3527) : (i64) -> i64
      func.call @stack_push_pointer(%3525) : (i64) -> ()
      %3529 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3530 = arith.constant 27 : i64
      %3531 = func.call @cc_make_string(%3529, %3530) : (!llvm.ptr, i64) -> i64
      %3532 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3533 = arith.constant 3 : i64
      %3534 = func.call @cc_make_string(%3532, %3533) : (!llvm.ptr, i64) -> i64
      %3535 = func.call @cc_intern(%3531, %3534) : (i64, i64) -> i64
      %3536 = func.call @cc_nil_value() : () -> i64
      %3537 = func.call @cc_cons(%3535, %3536) : (i64, i64) -> i64
      %3538 = func.call @cc_values_pack(%3537) : (i64) -> i64
      func.call @stack_push_pointer(%3535) : (i64) -> ()
      %3539 = arith.constant 23 : i64
      func.call @stack_push_fixnum(%3539) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3540 = func.call @stack_pop_pointer() : () -> i64
      %3541 = func.call @stack_pop_pointer() : () -> i64
      %3542 = func.call @cc_cons(%3541, %3540) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3542) : (i64) -> ()
      %3543 = func.call @stack_pop_pointer() : () -> i64
      %3544 = func.call @stack_pop_pointer() : () -> i64
      %3545 = func.call @cc_cons(%3544, %3543) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3545) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3546 = func.call @stack_pop_pointer() : () -> i64
      %3547 = func.call @stack_pop_pointer() : () -> i64
      %3548 = func.call @cc_cons(%3547, %3546) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3548) : (i64) -> ()
      %3549 = func.call @stack_pop_pointer() : () -> i64
      %3550 = func.call @stack_pop_pointer() : () -> i64
      %3551 = func.call @cc_cons(%3550, %3549) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3551) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %3561 = func.call @stack_pop_pointer() : () -> i64
      %3562 = func.call @stack_pop_pointer() : () -> i64
      %3563 = func.call @cc_cons(%3562, %3561) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3563) : (i64) -> ()
      %3564 = func.call @stack_pop_pointer() : () -> i64
      %3565 = func.call @stack_pop_pointer() : () -> i64
      %3566 = func.call @cc_cons(%3565, %3564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3566) : (i64) -> ()
      %3567 = func.call @stack_pop_pointer() : () -> i64
      %3623 = arith.constant 269090723725322 : i64
      %3624 = arith.constant 0 : i64
      %3625 = func.call @cc_make_closure(%3623, %3624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3625) : (i64) -> ()
      %3626 = func.call @stack_pop_pointer() : () -> i64
      %3627 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3628 = arith.constant 4 : i64
      %3629 = func.call @cc_make_string(%3627, %3628) : (!llvm.ptr, i64) -> i64
      %3630 = func.call @cc_nil_value() : () -> i64
      %3631 = func.call @cc_intern(%3629, %3630) : (i64, i64) -> i64
      %3632 = func.call @cc_nil_value() : () -> i64
      %3633 = func.call @cc_cons(%3631, %3632) : (i64, i64) -> i64
      %3634 = func.call @cc_values_pack(%3633) : (i64) -> i64
      func.call @stack_push_pointer(%3631) : (i64) -> ()
      %3635 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3636 = arith.constant 10 : i64
      %3637 = func.call @cc_make_string(%3635, %3636) : (!llvm.ptr, i64) -> i64
      %3638 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3639 = arith.constant 11 : i64
      %3640 = func.call @cc_make_string(%3638, %3639) : (!llvm.ptr, i64) -> i64
      %3641 = func.call @cc_intern(%3637, %3640) : (i64, i64) -> i64
      %3642 = func.call @cc_nil_value() : () -> i64
      %3643 = func.call @cc_cons(%3641, %3642) : (i64, i64) -> i64
      %3644 = func.call @cc_values_pack(%3643) : (i64) -> i64
      func.call @stack_push_pointer(%3641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3645 = func.call @stack_pop_pointer() : () -> i64
      %3646 = func.call @stack_pop_pointer() : () -> i64
      %3647 = func.call @cc_cons(%3646, %3645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3647) : (i64) -> ()
      %3648 = func.call @stack_pop_pointer() : () -> i64
      %3649 = func.call @stack_pop_pointer() : () -> i64
      %3650 = func.call @cc_cons(%3649, %3648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3650) : (i64) -> ()
      %3651 = func.call @stack_pop_pointer() : () -> i64
      %3652 = llvm.mlir.addressof @str310 : !llvm.ptr
      %3653 = arith.constant 11 : i64
      %3654 = func.call @cc_make_string(%3652, %3653) : (!llvm.ptr, i64) -> i64
      %3655 = llvm.mlir.addressof @str311 : !llvm.ptr
      %3656 = arith.constant 7 : i64
      %3657 = func.call @cc_make_string(%3655, %3656) : (!llvm.ptr, i64) -> i64
      %3658 = func.call @cc_intern(%3654, %3657) : (i64, i64) -> i64
      %3659 = func.call @cc_nil_value() : () -> i64
      %3660 = func.call @cc_cons(%3658, %3659) : (i64, i64) -> i64
      %3661 = func.call @cc_values_pack(%3660) : (i64) -> i64
      func.call @stack_push_pointer(%3658) : (i64) -> ()
      %3662 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3663 = func.call @stack_pop_pointer() : () -> i64
      %3664 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3665 = arith.constant 4 : i64
      %3666 = func.call @cc_make_string(%3664, %3665) : (!llvm.ptr, i64) -> i64
      %3667 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3668 = arith.constant 7 : i64
      %3669 = func.call @cc_make_string(%3667, %3668) : (!llvm.ptr, i64) -> i64
      %3670 = func.call @cc_intern(%3666, %3669) : (i64, i64) -> i64
      %3671 = func.call @cc_nil_value() : () -> i64
      %3672 = func.call @cc_cons(%3670, %3671) : (i64, i64) -> i64
      %3673 = func.call @cc_values_pack(%3672) : (i64) -> i64
      func.call @stack_push_pointer(%3670) : (i64) -> ()
      %3674 = func.call @stack_pop_pointer() : () -> i64
      %3675 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3676 = arith.constant 5 : i64
      %3677 = func.call @cc_make_string(%3675, %3676) : (!llvm.ptr, i64) -> i64
      %3678 = func.call @cc_nil_value() : () -> i64
      %3679 = func.call @cc_intern(%3677, %3678) : (i64, i64) -> i64
      %3680 = func.call @cc_nil_value() : () -> i64
      %3681 = func.call @cc_cons(%3679, %3680) : (i64, i64) -> i64
      %3682 = func.call @cc_values_pack(%3681) : (i64) -> i64
      func.call @stack_push_pointer(%3679) : (i64) -> ()
      %3683 = func.call @stack_pop_pointer() : () -> i64
      %3684 = func.call @cc_nil_value() : () -> i64
      %3685 = func.call @cc_errorp(%3502) : (i64) -> i64
      %3686 = arith.cmpi ne, %3685, %3684 : i64
      %3687 = arith.cmpi eq, %3684, %3684 : i64
      %3688 = arith.andi %3686, %3687 : i1
      %3689 = scf.if %3688 -> (i64) {
        scf.yield %3502 : i64
      } else {
        scf.yield %3684 : i64
      }
      %3690 = func.call @cc_errorp(%3567) : (i64) -> i64
      %3691 = arith.cmpi ne, %3690, %3684 : i64
      %3692 = arith.cmpi eq, %3689, %3684 : i64
      %3693 = arith.andi %3691, %3692 : i1
      %3694 = scf.if %3693 -> (i64) {
        scf.yield %3567 : i64
      } else {
        scf.yield %3689 : i64
      }
      %3695 = func.call @cc_errorp(%3626) : (i64) -> i64
      %3696 = arith.cmpi ne, %3695, %3684 : i64
      %3697 = arith.cmpi eq, %3694, %3684 : i64
      %3698 = arith.andi %3696, %3697 : i1
      %3699 = scf.if %3698 -> (i64) {
        scf.yield %3626 : i64
      } else {
        scf.yield %3694 : i64
      }
      %3700 = func.call @cc_errorp(%3651) : (i64) -> i64
      %3701 = arith.cmpi ne, %3700, %3684 : i64
      %3702 = arith.cmpi eq, %3699, %3684 : i64
      %3703 = arith.andi %3701, %3702 : i1
      %3704 = scf.if %3703 -> (i64) {
        scf.yield %3651 : i64
      } else {
        scf.yield %3699 : i64
      }
      %3705 = func.call @cc_errorp(%3662) : (i64) -> i64
      %3706 = arith.cmpi ne, %3705, %3684 : i64
      %3707 = arith.cmpi eq, %3704, %3684 : i64
      %3708 = arith.andi %3706, %3707 : i1
      %3709 = scf.if %3708 -> (i64) {
        scf.yield %3662 : i64
      } else {
        scf.yield %3704 : i64
      }
      %3710 = func.call @cc_errorp(%3663) : (i64) -> i64
      %3711 = arith.cmpi ne, %3710, %3684 : i64
      %3712 = arith.cmpi eq, %3709, %3684 : i64
      %3713 = arith.andi %3711, %3712 : i1
      %3714 = scf.if %3713 -> (i64) {
        scf.yield %3663 : i64
      } else {
        scf.yield %3709 : i64
      }
      %3715 = func.call @cc_errorp(%3674) : (i64) -> i64
      %3716 = arith.cmpi ne, %3715, %3684 : i64
      %3717 = arith.cmpi eq, %3714, %3684 : i64
      %3718 = arith.andi %3716, %3717 : i1
      %3719 = scf.if %3718 -> (i64) {
        scf.yield %3674 : i64
      } else {
        scf.yield %3714 : i64
      }
      %3720 = func.call @cc_errorp(%3683) : (i64) -> i64
      %3721 = arith.cmpi ne, %3720, %3684 : i64
      %3722 = arith.cmpi eq, %3719, %3684 : i64
      %3723 = arith.andi %3721, %3722 : i1
      %3724 = scf.if %3723 -> (i64) {
        scf.yield %3683 : i64
      } else {
        scf.yield %3719 : i64
      }
      %3725 = arith.cmpi ne, %3724, %3684 : i64
      scf.if %3725 {
        func.call @stack_push_pointer(%3724) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3502) : (i64) -> ()
        func.call @stack_push_pointer(%3567) : (i64) -> ()
        func.call @stack_push_pointer(%3626) : (i64) -> ()
        func.call @stack_push_pointer(%3651) : (i64) -> ()
        func.call @stack_push_pointer(%3662) : (i64) -> ()
        func.call @stack_push_pointer(%3663) : (i64) -> ()
        func.call @stack_push_pointer(%3674) : (i64) -> ()
        func.call @stack_push_pointer(%3683) : (i64) -> ()
        %3726 = llvm.mlir.addressof @str315 : !llvm.ptr
        %3727 = func.call @cc_make_function_ref_const(%3726) : (!llvm.ptr) -> i64
        %3728 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3727, %3728) : (i64, i64) -> ()
      }
      %3729 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3729 : i64
    }
    %3730 = func.call @cc_nil_value() : () -> i64
    %3731 = func.call @cc_errorp(%3493) : (i64) -> i64
    %3732 = arith.cmpi ne, %3731, %3730 : i64
    %3733 = scf.if %3732 -> (i64) {
      scf.yield %3493 : i64
    } else {
      %3734 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3735 = arith.constant 20 : i64
      %3736 = func.call @cc_make_string(%3734, %3735) : (!llvm.ptr, i64) -> i64
      %3737 = func.call @cc_nil_value() : () -> i64
      %3738 = func.call @cc_intern(%3736, %3737) : (i64, i64) -> i64
      %3739 = func.call @cc_nil_value() : () -> i64
      %3740 = func.call @cc_cons(%3738, %3739) : (i64, i64) -> i64
      %3741 = func.call @cc_values_pack(%3740) : (i64) -> i64
      func.call @stack_push_pointer(%3738) : (i64) -> ()
      %3742 = func.call @stack_pop_pointer() : () -> i64
      %3743 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3744 = arith.constant 3 : i64
      %3745 = func.call @cc_make_string(%3743, %3744) : (!llvm.ptr, i64) -> i64
      %3746 = func.call @cc_nil_value() : () -> i64
      %3747 = func.call @cc_intern(%3745, %3746) : (i64, i64) -> i64
      %3748 = func.call @cc_nil_value() : () -> i64
      %3749 = func.call @cc_cons(%3747, %3748) : (i64, i64) -> i64
      %3750 = func.call @cc_values_pack(%3749) : (i64) -> i64
      func.call @stack_push_pointer(%3747) : (i64) -> ()
      %3751 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3752 = arith.constant 3 : i64
      %3753 = func.call @cc_make_string(%3751, %3752) : (!llvm.ptr, i64) -> i64
      %3754 = func.call @cc_nil_value() : () -> i64
      %3755 = func.call @cc_intern(%3753, %3754) : (i64, i64) -> i64
      %3756 = func.call @cc_nil_value() : () -> i64
      %3757 = func.call @cc_cons(%3755, %3756) : (i64, i64) -> i64
      %3758 = func.call @cc_values_pack(%3757) : (i64) -> i64
      func.call @stack_push_pointer(%3755) : (i64) -> ()
      %3759 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3760 = arith.constant 19 : i64
      %3761 = func.call @cc_make_string(%3759, %3760) : (!llvm.ptr, i64) -> i64
      %3762 = llvm.mlir.addressof @str320 : !llvm.ptr
      %3763 = arith.constant 11 : i64
      %3764 = func.call @cc_make_string(%3762, %3763) : (!llvm.ptr, i64) -> i64
      %3765 = func.call @cc_intern(%3761, %3764) : (i64, i64) -> i64
      %3766 = func.call @cc_nil_value() : () -> i64
      %3767 = func.call @cc_cons(%3765, %3766) : (i64, i64) -> i64
      %3768 = func.call @cc_values_pack(%3767) : (i64) -> i64
      func.call @stack_push_pointer(%3765) : (i64) -> ()
      %3769 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3770 = arith.constant 5 : i64
      %3771 = func.call @cc_make_string(%3769, %3770) : (!llvm.ptr, i64) -> i64
      %3772 = func.call @cc_nil_value() : () -> i64
      %3773 = func.call @cc_intern(%3771, %3772) : (i64, i64) -> i64
      %3774 = func.call @cc_nil_value() : () -> i64
      %3775 = func.call @cc_cons(%3773, %3774) : (i64, i64) -> i64
      %3776 = func.call @cc_values_pack(%3775) : (i64) -> i64
      func.call @stack_push_pointer(%3773) : (i64) -> ()
      %3777 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3778 = arith.constant 20 : i64
      %3779 = func.call @cc_make_string(%3777, %3778) : (!llvm.ptr, i64) -> i64
      %3780 = func.call @cc_nil_value() : () -> i64
      %3781 = func.call @cc_intern(%3779, %3780) : (i64, i64) -> i64
      %3782 = func.call @cc_nil_value() : () -> i64
      %3783 = func.call @cc_cons(%3781, %3782) : (i64, i64) -> i64
      %3784 = func.call @cc_values_pack(%3783) : (i64) -> i64
      func.call @stack_push_pointer(%3781) : (i64) -> ()
      %3785 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3786 = arith.constant 6 : i64
      %3787 = func.call @cc_make_string(%3785, %3786) : (!llvm.ptr, i64) -> i64
      %3788 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3789 = arith.constant 11 : i64
      %3790 = func.call @cc_make_string(%3788, %3789) : (!llvm.ptr, i64) -> i64
      %3791 = func.call @cc_intern(%3787, %3790) : (i64, i64) -> i64
      %3792 = func.call @cc_nil_value() : () -> i64
      %3793 = func.call @cc_cons(%3791, %3792) : (i64, i64) -> i64
      %3794 = func.call @cc_values_pack(%3793) : (i64) -> i64
      func.call @stack_push_pointer(%3791) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3795 = func.call @stack_pop_pointer() : () -> i64
      %3796 = func.call @stack_pop_pointer() : () -> i64
      %3797 = func.call @cc_cons(%3796, %3795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3797) : (i64) -> ()
      %3798 = func.call @stack_pop_pointer() : () -> i64
      %3799 = func.call @stack_pop_pointer() : () -> i64
      %3800 = func.call @cc_cons(%3799, %3798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3800) : (i64) -> ()
      %3801 = func.call @stack_pop_pointer() : () -> i64
      %3802 = func.call @stack_pop_pointer() : () -> i64
      %3803 = func.call @cc_cons(%3802, %3801) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3803) : (i64) -> ()
      %3804 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3805 = arith.constant 12 : i64
      %3806 = func.call @cc_make_string(%3804, %3805) : (!llvm.ptr, i64) -> i64
      %3807 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3808 = arith.constant 3 : i64
      %3809 = func.call @cc_make_string(%3807, %3808) : (!llvm.ptr, i64) -> i64
      %3810 = func.call @cc_intern(%3806, %3809) : (i64, i64) -> i64
      %3811 = func.call @cc_nil_value() : () -> i64
      %3812 = func.call @cc_cons(%3810, %3811) : (i64, i64) -> i64
      %3813 = func.call @cc_values_pack(%3812) : (i64) -> i64
      func.call @stack_push_pointer(%3810) : (i64) -> ()
      %3814 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3815 = arith.constant 4 : i64
      %3816 = func.call @cc_make_string(%3814, %3815) : (!llvm.ptr, i64) -> i64
      %3817 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3818 = arith.constant 11 : i64
      %3819 = func.call @cc_make_string(%3817, %3818) : (!llvm.ptr, i64) -> i64
      %3820 = func.call @cc_intern(%3816, %3819) : (i64, i64) -> i64
      %3821 = func.call @cc_nil_value() : () -> i64
      %3822 = func.call @cc_cons(%3820, %3821) : (i64, i64) -> i64
      %3823 = func.call @cc_values_pack(%3822) : (i64) -> i64
      func.call @stack_push_pointer(%3820) : (i64) -> ()
      %3824 = llvm.mlir.addressof @str329 : !llvm.ptr
      %3825 = arith.constant 11 : i64
      %3826 = func.call @cc_make_string(%3824, %3825) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3826) : (i64) -> ()
      %3827 = llvm.mlir.addressof @str330 : !llvm.ptr
      %3828 = arith.constant 9 : i64
      %3829 = func.call @cc_make_string(%3827, %3828) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3829) : (i64) -> ()
      %3830 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3831 = arith.constant 8 : i64
      %3832 = func.call @cc_make_string(%3830, %3831) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3832) : (i64) -> ()
      %3833 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3834 = arith.constant 6 : i64
      %3835 = func.call @cc_make_string(%3833, %3834) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3835) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3836 = func.call @stack_pop_pointer() : () -> i64
      %3837 = func.call @stack_pop_pointer() : () -> i64
      %3838 = func.call @cc_cons(%3837, %3836) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3838) : (i64) -> ()
      %3839 = func.call @stack_pop_pointer() : () -> i64
      %3840 = func.call @stack_pop_pointer() : () -> i64
      %3841 = func.call @cc_cons(%3840, %3839) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3841) : (i64) -> ()
      %3842 = func.call @stack_pop_pointer() : () -> i64
      %3843 = func.call @stack_pop_pointer() : () -> i64
      %3844 = func.call @cc_cons(%3843, %3842) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3844) : (i64) -> ()
      %3845 = func.call @stack_pop_pointer() : () -> i64
      %3846 = func.call @stack_pop_pointer() : () -> i64
      %3847 = func.call @cc_cons(%3846, %3845) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3847) : (i64) -> ()
      %3848 = func.call @stack_pop_pointer() : () -> i64
      %3849 = func.call @stack_pop_pointer() : () -> i64
      %3850 = func.call @cc_cons(%3849, %3848) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3850) : (i64) -> ()
      %3851 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3851) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3852 = func.call @stack_pop_pointer() : () -> i64
      %3853 = func.call @stack_pop_pointer() : () -> i64
      %3854 = func.call @cc_cons(%3853, %3852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3854) : (i64) -> ()
      %3855 = func.call @stack_pop_pointer() : () -> i64
      %3856 = func.call @stack_pop_pointer() : () -> i64
      %3857 = func.call @cc_cons(%3856, %3855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3857) : (i64) -> ()
      %3858 = func.call @stack_pop_pointer() : () -> i64
      %3859 = func.call @stack_pop_pointer() : () -> i64
      %3860 = func.call @cc_cons(%3859, %3858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3860) : (i64) -> ()
      %3861 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3862 = arith.constant 7 : i64
      %3863 = func.call @cc_make_string(%3861, %3862) : (!llvm.ptr, i64) -> i64
      %3864 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3865 = arith.constant 11 : i64
      %3866 = func.call @cc_make_string(%3864, %3865) : (!llvm.ptr, i64) -> i64
      %3867 = func.call @cc_intern(%3863, %3866) : (i64, i64) -> i64
      %3868 = func.call @cc_nil_value() : () -> i64
      %3869 = func.call @cc_cons(%3867, %3868) : (i64, i64) -> i64
      %3870 = func.call @cc_values_pack(%3869) : (i64) -> i64
      func.call @stack_push_pointer(%3867) : (i64) -> ()
      %3871 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3872 = arith.constant 6 : i64
      %3873 = func.call @cc_make_string(%3871, %3872) : (!llvm.ptr, i64) -> i64
      %3874 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3875 = arith.constant 11 : i64
      %3876 = func.call @cc_make_string(%3874, %3875) : (!llvm.ptr, i64) -> i64
      %3877 = func.call @cc_intern(%3873, %3876) : (i64, i64) -> i64
      %3878 = func.call @cc_nil_value() : () -> i64
      %3879 = func.call @cc_cons(%3877, %3878) : (i64, i64) -> i64
      %3880 = func.call @cc_values_pack(%3879) : (i64) -> i64
      func.call @stack_push_pointer(%3877) : (i64) -> ()
      %3881 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3882 = arith.constant 5 : i64
      %3883 = func.call @cc_make_string(%3881, %3882) : (!llvm.ptr, i64) -> i64
      %3884 = func.call @cc_nil_value() : () -> i64
      %3885 = func.call @cc_intern(%3883, %3884) : (i64, i64) -> i64
      %3886 = func.call @cc_nil_value() : () -> i64
      %3887 = func.call @cc_cons(%3885, %3886) : (i64, i64) -> i64
      %3888 = func.call @cc_values_pack(%3887) : (i64) -> i64
      func.call @stack_push_pointer(%3885) : (i64) -> ()
      %3889 = llvm.mlir.addressof @str338 : !llvm.ptr
      %3890 = arith.constant 20 : i64
      %3891 = func.call @cc_make_string(%3889, %3890) : (!llvm.ptr, i64) -> i64
      %3892 = func.call @cc_nil_value() : () -> i64
      %3893 = func.call @cc_intern(%3891, %3892) : (i64, i64) -> i64
      %3894 = func.call @cc_nil_value() : () -> i64
      %3895 = func.call @cc_cons(%3893, %3894) : (i64, i64) -> i64
      %3896 = func.call @cc_values_pack(%3895) : (i64) -> i64
      func.call @stack_push_pointer(%3893) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3897 = func.call @stack_pop_pointer() : () -> i64
      %3898 = func.call @stack_pop_pointer() : () -> i64
      %3899 = func.call @cc_cons(%3898, %3897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3899) : (i64) -> ()
      %3900 = func.call @stack_pop_pointer() : () -> i64
      %3901 = func.call @stack_pop_pointer() : () -> i64
      %3902 = func.call @cc_cons(%3901, %3900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3902) : (i64) -> ()
      %3903 = func.call @stack_pop_pointer() : () -> i64
      %3904 = func.call @stack_pop_pointer() : () -> i64
      %3905 = func.call @cc_cons(%3904, %3903) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3905) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3906 = func.call @stack_pop_pointer() : () -> i64
      %3907 = func.call @stack_pop_pointer() : () -> i64
      %3908 = func.call @cc_cons(%3907, %3906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3908) : (i64) -> ()
      %3909 = func.call @stack_pop_pointer() : () -> i64
      %3910 = func.call @stack_pop_pointer() : () -> i64
      %3911 = func.call @cc_cons(%3910, %3909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3911) : (i64) -> ()
      %3912 = llvm.mlir.addressof @str339 : !llvm.ptr
      %3913 = arith.constant 2 : i64
      %3914 = func.call @cc_make_string(%3912, %3913) : (!llvm.ptr, i64) -> i64
      %3915 = func.call @cc_nil_value() : () -> i64
      %3916 = func.call @cc_intern(%3914, %3915) : (i64, i64) -> i64
      %3917 = func.call @cc_nil_value() : () -> i64
      %3918 = func.call @cc_cons(%3916, %3917) : (i64, i64) -> i64
      %3919 = func.call @cc_values_pack(%3918) : (i64) -> i64
      func.call @stack_push_pointer(%3916) : (i64) -> ()
      %3920 = llvm.mlir.addressof @str340 : !llvm.ptr
      %3921 = arith.constant 6 : i64
      %3922 = func.call @cc_make_string(%3920, %3921) : (!llvm.ptr, i64) -> i64
      %3923 = llvm.mlir.addressof @str341 : !llvm.ptr
      %3924 = arith.constant 11 : i64
      %3925 = func.call @cc_make_string(%3923, %3924) : (!llvm.ptr, i64) -> i64
      %3926 = func.call @cc_intern(%3922, %3925) : (i64, i64) -> i64
      %3927 = func.call @cc_nil_value() : () -> i64
      %3928 = func.call @cc_cons(%3926, %3927) : (i64, i64) -> i64
      %3929 = func.call @cc_values_pack(%3928) : (i64) -> i64
      func.call @stack_push_pointer(%3926) : (i64) -> ()
      %3930 = llvm.mlir.addressof @str342 : !llvm.ptr
      %3931 = arith.constant 5 : i64
      %3932 = func.call @cc_make_string(%3930, %3931) : (!llvm.ptr, i64) -> i64
      %3933 = llvm.mlir.addressof @str343 : !llvm.ptr
      %3934 = arith.constant 11 : i64
      %3935 = func.call @cc_make_string(%3933, %3934) : (!llvm.ptr, i64) -> i64
      %3936 = func.call @cc_intern(%3932, %3935) : (i64, i64) -> i64
      %3937 = func.call @cc_nil_value() : () -> i64
      %3938 = func.call @cc_cons(%3936, %3937) : (i64, i64) -> i64
      %3939 = func.call @cc_values_pack(%3938) : (i64) -> i64
      func.call @stack_push_pointer(%3936) : (i64) -> ()
      %3940 = llvm.mlir.addressof @str344 : !llvm.ptr
      %3941 = arith.constant 6 : i64
      %3942 = func.call @cc_make_string(%3940, %3941) : (!llvm.ptr, i64) -> i64
      %3943 = llvm.mlir.addressof @str345 : !llvm.ptr
      %3944 = arith.constant 11 : i64
      %3945 = func.call @cc_make_string(%3943, %3944) : (!llvm.ptr, i64) -> i64
      %3946 = func.call @cc_intern(%3942, %3945) : (i64, i64) -> i64
      %3947 = func.call @cc_nil_value() : () -> i64
      %3948 = func.call @cc_cons(%3946, %3947) : (i64, i64) -> i64
      %3949 = func.call @cc_values_pack(%3948) : (i64) -> i64
      func.call @stack_push_pointer(%3946) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3950 = func.call @stack_pop_pointer() : () -> i64
      %3951 = func.call @stack_pop_pointer() : () -> i64
      %3952 = func.call @cc_cons(%3951, %3950) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3952) : (i64) -> ()
      %3953 = func.call @stack_pop_pointer() : () -> i64
      %3954 = func.call @stack_pop_pointer() : () -> i64
      %3955 = func.call @cc_cons(%3954, %3953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3955) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3956 = func.call @stack_pop_pointer() : () -> i64
      %3957 = func.call @stack_pop_pointer() : () -> i64
      %3958 = func.call @cc_cons(%3957, %3956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3958) : (i64) -> ()
      %3959 = func.call @stack_pop_pointer() : () -> i64
      %3960 = func.call @stack_pop_pointer() : () -> i64
      %3961 = func.call @cc_cons(%3960, %3959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3961) : (i64) -> ()
      %3962 = func.call @stack_pop_pointer() : () -> i64
      %3963 = func.call @stack_pop_pointer() : () -> i64
      %3964 = func.call @cc_cons(%3963, %3962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3964) : (i64) -> ()
      %3965 = func.call @stack_pop_pointer() : () -> i64
      %3966 = func.call @stack_pop_pointer() : () -> i64
      %3967 = func.call @cc_cons(%3966, %3965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3967) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3968 = func.call @stack_pop_pointer() : () -> i64
      %3969 = func.call @stack_pop_pointer() : () -> i64
      %3970 = func.call @cc_cons(%3969, %3968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3970) : (i64) -> ()
      %3971 = func.call @stack_pop_pointer() : () -> i64
      %3972 = func.call @stack_pop_pointer() : () -> i64
      %3973 = func.call @cc_cons(%3972, %3971) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3973) : (i64) -> ()
      %3974 = func.call @stack_pop_pointer() : () -> i64
      %3975 = func.call @stack_pop_pointer() : () -> i64
      %3976 = func.call @cc_cons(%3975, %3974) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3976) : (i64) -> ()
      %3977 = func.call @stack_pop_pointer() : () -> i64
      %3978 = func.call @stack_pop_pointer() : () -> i64
      %3979 = func.call @cc_cons(%3978, %3977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3979) : (i64) -> ()
      %3980 = func.call @stack_pop_pointer() : () -> i64
      %3981 = func.call @stack_pop_pointer() : () -> i64
      %3982 = func.call @cc_cons(%3981, %3980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3982) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3983 = func.call @stack_pop_pointer() : () -> i64
      %3984 = func.call @stack_pop_pointer() : () -> i64
      %3985 = func.call @cc_cons(%3984, %3983) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3985) : (i64) -> ()
      %3986 = func.call @stack_pop_pointer() : () -> i64
      %3987 = func.call @stack_pop_pointer() : () -> i64
      %3988 = func.call @cc_cons(%3987, %3986) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3988) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3989 = func.call @stack_pop_pointer() : () -> i64
      %3990 = func.call @stack_pop_pointer() : () -> i64
      %3991 = func.call @cc_cons(%3990, %3989) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3991) : (i64) -> ()
      %3992 = func.call @stack_pop_pointer() : () -> i64
      %3993 = func.call @stack_pop_pointer() : () -> i64
      %3994 = func.call @cc_cons(%3993, %3992) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3994) : (i64) -> ()
      %3995 = func.call @stack_pop_pointer() : () -> i64
      %4109 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4110 = arith.constant 34 : i64
      %4111 = func.call @cc_make_symbol(%4109, %4110) : (!llvm.ptr, i64) -> i64
      %4112 = func.call @cc_persistent_root_value(%4111) : (i64) -> i64
      func.call @stack_push_pointer(%4112) : (i64) -> ()
      %4113 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4114 = arith.constant 49 : i64
      %4115 = func.call @cc_make_symbol(%4113, %4114) : (!llvm.ptr, i64) -> i64
      %4116 = func.call @cc_persistent_root_value(%4115) : (i64) -> i64
      func.call @stack_push_pointer(%4116) : (i64) -> ()
      %4117 = arith.constant 269090723725323 : i64
      %4118 = arith.constant 2 : i64
      %4119 = func.call @cc_make_closure(%4117, %4118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4119) : (i64) -> ()
      %4120 = func.call @stack_pop_pointer() : () -> i64
      %4121 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4122 = arith.constant 1 : i64
      %4123 = func.call @cc_make_string(%4121, %4122) : (!llvm.ptr, i64) -> i64
      %4124 = func.call @cc_nil_value() : () -> i64
      %4125 = func.call @cc_intern(%4123, %4124) : (i64, i64) -> i64
      %4126 = func.call @cc_nil_value() : () -> i64
      %4127 = func.call @cc_cons(%4125, %4126) : (i64, i64) -> i64
      %4128 = func.call @cc_values_pack(%4127) : (i64) -> i64
      func.call @stack_push_pointer(%4125) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4129 = func.call @stack_pop_pointer() : () -> i64
      %4130 = func.call @stack_pop_pointer() : () -> i64
      %4131 = func.call @cc_cons(%4130, %4129) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4131) : (i64) -> ()
      %4132 = func.call @stack_pop_pointer() : () -> i64
      %4133 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4134 = arith.constant 11 : i64
      %4135 = func.call @cc_make_string(%4133, %4134) : (!llvm.ptr, i64) -> i64
      %4136 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4137 = arith.constant 7 : i64
      %4138 = func.call @cc_make_string(%4136, %4137) : (!llvm.ptr, i64) -> i64
      %4139 = func.call @cc_intern(%4135, %4138) : (i64, i64) -> i64
      %4140 = func.call @cc_nil_value() : () -> i64
      %4141 = func.call @cc_cons(%4139, %4140) : (i64, i64) -> i64
      %4142 = func.call @cc_values_pack(%4141) : (i64) -> i64
      func.call @stack_push_pointer(%4139) : (i64) -> ()
      %4143 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4144 = func.call @stack_pop_pointer() : () -> i64
      %4145 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4146 = arith.constant 4 : i64
      %4147 = func.call @cc_make_string(%4145, %4146) : (!llvm.ptr, i64) -> i64
      %4148 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4149 = arith.constant 7 : i64
      %4150 = func.call @cc_make_string(%4148, %4149) : (!llvm.ptr, i64) -> i64
      %4151 = func.call @cc_intern(%4147, %4150) : (i64, i64) -> i64
      %4152 = func.call @cc_nil_value() : () -> i64
      %4153 = func.call @cc_cons(%4151, %4152) : (i64, i64) -> i64
      %4154 = func.call @cc_values_pack(%4153) : (i64) -> i64
      func.call @stack_push_pointer(%4151) : (i64) -> ()
      %4155 = func.call @stack_pop_pointer() : () -> i64
      %4156 = llvm.mlir.addressof @str358 : !llvm.ptr
      %4157 = arith.constant 6 : i64
      %4158 = func.call @cc_make_string(%4156, %4157) : (!llvm.ptr, i64) -> i64
      %4159 = func.call @cc_nil_value() : () -> i64
      %4160 = func.call @cc_intern(%4158, %4159) : (i64, i64) -> i64
      %4161 = func.call @cc_nil_value() : () -> i64
      %4162 = func.call @cc_cons(%4160, %4161) : (i64, i64) -> i64
      %4163 = func.call @cc_values_pack(%4162) : (i64) -> i64
      func.call @stack_push_pointer(%4160) : (i64) -> ()
      %4164 = func.call @stack_pop_pointer() : () -> i64
      %4165 = func.call @cc_nil_value() : () -> i64
      %4166 = func.call @cc_errorp(%3742) : (i64) -> i64
      %4167 = arith.cmpi ne, %4166, %4165 : i64
      %4168 = arith.cmpi eq, %4165, %4165 : i64
      %4169 = arith.andi %4167, %4168 : i1
      %4170 = scf.if %4169 -> (i64) {
        scf.yield %3742 : i64
      } else {
        scf.yield %4165 : i64
      }
      %4171 = func.call @cc_errorp(%3995) : (i64) -> i64
      %4172 = arith.cmpi ne, %4171, %4165 : i64
      %4173 = arith.cmpi eq, %4170, %4165 : i64
      %4174 = arith.andi %4172, %4173 : i1
      %4175 = scf.if %4174 -> (i64) {
        scf.yield %3995 : i64
      } else {
        scf.yield %4170 : i64
      }
      %4176 = func.call @cc_errorp(%4120) : (i64) -> i64
      %4177 = arith.cmpi ne, %4176, %4165 : i64
      %4178 = arith.cmpi eq, %4175, %4165 : i64
      %4179 = arith.andi %4177, %4178 : i1
      %4180 = scf.if %4179 -> (i64) {
        scf.yield %4120 : i64
      } else {
        scf.yield %4175 : i64
      }
      %4181 = func.call @cc_errorp(%4132) : (i64) -> i64
      %4182 = arith.cmpi ne, %4181, %4165 : i64
      %4183 = arith.cmpi eq, %4180, %4165 : i64
      %4184 = arith.andi %4182, %4183 : i1
      %4185 = scf.if %4184 -> (i64) {
        scf.yield %4132 : i64
      } else {
        scf.yield %4180 : i64
      }
      %4186 = func.call @cc_errorp(%4143) : (i64) -> i64
      %4187 = arith.cmpi ne, %4186, %4165 : i64
      %4188 = arith.cmpi eq, %4185, %4165 : i64
      %4189 = arith.andi %4187, %4188 : i1
      %4190 = scf.if %4189 -> (i64) {
        scf.yield %4143 : i64
      } else {
        scf.yield %4185 : i64
      }
      %4191 = func.call @cc_errorp(%4144) : (i64) -> i64
      %4192 = arith.cmpi ne, %4191, %4165 : i64
      %4193 = arith.cmpi eq, %4190, %4165 : i64
      %4194 = arith.andi %4192, %4193 : i1
      %4195 = scf.if %4194 -> (i64) {
        scf.yield %4144 : i64
      } else {
        scf.yield %4190 : i64
      }
      %4196 = func.call @cc_errorp(%4155) : (i64) -> i64
      %4197 = arith.cmpi ne, %4196, %4165 : i64
      %4198 = arith.cmpi eq, %4195, %4165 : i64
      %4199 = arith.andi %4197, %4198 : i1
      %4200 = scf.if %4199 -> (i64) {
        scf.yield %4155 : i64
      } else {
        scf.yield %4195 : i64
      }
      %4201 = func.call @cc_errorp(%4164) : (i64) -> i64
      %4202 = arith.cmpi ne, %4201, %4165 : i64
      %4203 = arith.cmpi eq, %4200, %4165 : i64
      %4204 = arith.andi %4202, %4203 : i1
      %4205 = scf.if %4204 -> (i64) {
        scf.yield %4164 : i64
      } else {
        scf.yield %4200 : i64
      }
      %4206 = arith.cmpi ne, %4205, %4165 : i64
      scf.if %4206 {
        func.call @stack_push_pointer(%4205) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3742) : (i64) -> ()
        func.call @stack_push_pointer(%3995) : (i64) -> ()
        func.call @stack_push_pointer(%4120) : (i64) -> ()
        func.call @stack_push_pointer(%4132) : (i64) -> ()
        func.call @stack_push_pointer(%4143) : (i64) -> ()
        func.call @stack_push_pointer(%4144) : (i64) -> ()
        func.call @stack_push_pointer(%4155) : (i64) -> ()
        func.call @stack_push_pointer(%4164) : (i64) -> ()
        %4207 = llvm.mlir.addressof @str359 : !llvm.ptr
        %4208 = func.call @cc_make_function_ref_const(%4207) : (!llvm.ptr) -> i64
        %4209 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4208, %4209) : (i64, i64) -> ()
      }
      %4210 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4210 : i64
    }
    func.call @stack_push_pointer(%3733) : (i64) -> ()
    %4211 = func.call @stack_pop_pointer() : () -> i64
    %4212 = func.call @cc_multiple_value_list(%4211) : (i64) -> i64
    %4213 = llvm.mlir.addressof @str360 : !llvm.ptr
    %4214 = arith.constant 38 : i64
    %4215 = func.call @cc_make_string(%4213, %4214) : (!llvm.ptr, i64) -> i64
    %4216 = func.call @cc_nil_value() : () -> i64
    %4217 = func.call @cc_intern(%4215, %4216) : (i64, i64) -> i64
    %4218 = func.call @cc_nil_value() : () -> i64
    %4219 = func.call @cc_cons(%4217, %4218) : (i64, i64) -> i64
    %4220 = func.call @cc_values_pack(%4219) : (i64) -> i64
    %4221 = func.call @cc_symbol_value(%4217) : (i64) -> i64
    %4222 = llvm.mlir.addressof @str361 : !llvm.ptr
    %4223 = arith.constant 40 : i64
    %4224 = func.call @cc_make_string(%4222, %4223) : (!llvm.ptr, i64) -> i64
    %4225 = func.call @cc_nil_value() : () -> i64
    %4226 = func.call @cc_intern(%4224, %4225) : (i64, i64) -> i64
    %4227 = func.call @cc_nil_value() : () -> i64
    %4228 = func.call @cc_cons(%4226, %4227) : (i64, i64) -> i64
    %4229 = func.call @cc_values_pack(%4228) : (i64) -> i64
    %4230 = func.call @cc_symbol_value(%4226) : (i64) -> i64
    %4231 = func.call @cc_nil_value() : () -> i64
    %4232 = arith.cmpi ne, %4221, %4231 : i64
    %4233 = scf.if %4232 -> (i64) {
      scf.yield %4230 : i64
    } else {
      scf.yield %4212 : i64
    }
    %4234 = func.call @cc_values_pack(%4233) : (i64) -> i64
    func.call @stack_push_pointer(%4234) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_269090723725313"() {
    %114 = func.call @cc_nil_value() : () -> i64
    %115 = func.call @cc_nil_value() : () -> i64
    %116 = func.call @cc_errorp(%114) : (i64) -> i64
    %117 = arith.cmpi ne, %116, %115 : i64
    %118 = scf.if %117 -> (i64) {
      scf.yield %114 : i64
    } else {
      %119 = llvm.mlir.addressof @str11 : !llvm.ptr
      %120 = arith.constant 42 : i64
      %121 = func.call @cc_make_string(%119, %120) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%121) : (i64) -> ()
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @cc_nil_value() : () -> i64
      %124 = func.call @cc_errorp(%122) : (i64) -> i64
      %125 = arith.cmpi ne, %124, %123 : i64
      %126 = arith.cmpi eq, %123, %123 : i64
      %127 = arith.andi %125, %126 : i1
      %128 = scf.if %127 -> (i64) {
        scf.yield %122 : i64
      } else {
        scf.yield %123 : i64
      }
      %129 = arith.cmpi ne, %128, %123 : i64
      scf.if %129 {
        func.call @stack_push_pointer(%128) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%122) : (i64) -> ()
        %130 = llvm.mlir.addressof @str12 : !llvm.ptr
        %131 = func.call @cc_make_function_ref_const(%130) : (!llvm.ptr) -> i64
        %132 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%131, %132) : (i64, i64) -> ()
      }
      %133 = func.call @stack_pop_pointer() : () -> i64
      %134 = func.call @cc_nil_value() : () -> i64
      %135 = func.call @cc_cons(%133, %134) : (i64, i64) -> i64
      %136 = func.call @cc_not(%135) : (i64) -> i64
      func.call @stack_push_pointer(%136) : (i64) -> ()
      %137 = func.call @stack_pop_pointer() : () -> i64
      %138 = func.call @cc_nil_value() : () -> i64
      %139 = func.call @cc_cons(%137, %138) : (i64, i64) -> i64
      %140 = func.call @cc_not(%139) : (i64) -> i64
      func.call @stack_push_pointer(%140) : (i64) -> ()
      %141 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %141 : i64
    }
    func.call @stack_push_pointer(%118) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725314"() {
    %325 = func.call @cc_nil_value() : () -> i64
    %326 = func.call @cc_nil_value() : () -> i64
    %327 = func.call @cc_errorp(%325) : (i64) -> i64
    %328 = arith.cmpi ne, %327, %326 : i64
    %329 = scf.if %328 -> (i64) {
      scf.yield %325 : i64
    } else {
      %330 = llvm.mlir.addressof @str28 : !llvm.ptr
      %331 = arith.constant 42 : i64
      %332 = func.call @cc_make_string(%330, %331) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%332) : (i64) -> ()
      %333 = func.call @stack_pop_pointer() : () -> i64
      %334 = func.call @cc_nil_value() : () -> i64
      %335 = func.call @cc_nil_value() : () -> i64
      %336 = func.call @cc_errorp(%334) : (i64) -> i64
      %337 = arith.cmpi ne, %336, %335 : i64
      %338 = scf.if %337 -> (i64) {
        scf.yield %334 : i64
      } else {
        func.call @stack_push_pointer(%333) : (i64) -> ()
        %339 = func.call @stack_pop_pointer() : () -> i64
        %340 = func.call @cc_nil_value() : () -> i64
        %341 = func.call @cc_errorp(%339) : (i64) -> i64
        %342 = arith.cmpi ne, %341, %340 : i64
        %343 = arith.cmpi eq, %340, %340 : i64
        %344 = arith.andi %342, %343 : i1
        %345 = scf.if %344 -> (i64) {
          scf.yield %339 : i64
        } else {
          scf.yield %340 : i64
        }
        %346 = arith.cmpi ne, %345, %340 : i64
        scf.if %346 {
          func.call @stack_push_pointer(%345) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%339) : (i64) -> ()
          %347 = llvm.mlir.addressof @str29 : !llvm.ptr
          %348 = func.call @cc_make_function_ref_const(%347) : (!llvm.ptr) -> i64
          %349 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%348, %349) : (i64, i64) -> ()
        }
        %350 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %350 : i64
      }
      func.call @stack_push_pointer(%338) : (i64) -> ()
      %351 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %352 = func.call @stack_pop_pointer() : () -> i64
      %353 = func.call @cc_cons(%351, %352) : (i64, i64) -> i64
      func.call @stack_push_pointer(%353) : (i64) -> ()
      %354 = func.call @stack_pop_pointer() : () -> i64
      %355 = func.call @cc_values_pack(%354) : (i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      %356 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %356 : i64
    }
    func.call @stack_push_pointer(%329) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725315"() {
    %562 = func.call @cc_nil_value() : () -> i64
    %563 = func.call @cc_nil_value() : () -> i64
    %564 = func.call @cc_errorp(%562) : (i64) -> i64
    %565 = arith.cmpi ne, %564, %563 : i64
    %566 = scf.if %565 -> (i64) {
      scf.yield %562 : i64
    } else {
      %567 = llvm.mlir.addressof @str48 : !llvm.ptr
      %568 = arith.constant 42 : i64
      %569 = func.call @cc_make_string(%567, %568) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%569) : (i64) -> ()
      %570 = func.call @stack_pop_pointer() : () -> i64
      %571 = func.call @cc_nil_value() : () -> i64
      %572 = func.call @cc_nil_value() : () -> i64
      %573 = func.call @cc_errorp(%571) : (i64) -> i64
      %574 = arith.cmpi ne, %573, %572 : i64
      %575 = scf.if %574 -> (i64) {
        scf.yield %571 : i64
      } else {
        %576 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%576) : (i64) -> ()
        %577 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%570) : (i64) -> ()
        %578 = func.call @stack_pop_pointer() : () -> i64
        %579 = func.call @cc_nil_value() : () -> i64
        %580 = func.call @cc_errorp(%578) : (i64) -> i64
        %581 = arith.cmpi ne, %580, %579 : i64
        %582 = arith.cmpi eq, %579, %579 : i64
        %583 = arith.andi %581, %582 : i1
        %584 = scf.if %583 -> (i64) {
          scf.yield %578 : i64
        } else {
          scf.yield %579 : i64
        }
        %585 = arith.cmpi ne, %584, %579 : i64
        scf.if %585 {
          func.call @stack_push_pointer(%584) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%578) : (i64) -> ()
          %586 = llvm.mlir.addressof @str49 : !llvm.ptr
          %587 = func.call @cc_make_function_ref_const(%586) : (!llvm.ptr) -> i64
          %588 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%587, %588) : (i64, i64) -> ()
        }
        %589 = func.call @stack_pop_pointer() : () -> i64
        %590 = func.call @cc_multiple_value_list(%589) : (i64) -> i64
        %591 = func.call @cc_nth(%577, %590) : (i64, i64) -> i64
        func.call @stack_push_pointer(%591) : (i64) -> ()
        %592 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %592 : i64
      }
      func.call @stack_push_pointer(%575) : (i64) -> ()
      %593 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %594 = func.call @stack_pop_pointer() : () -> i64
      %595 = func.call @cc_cons(%593, %594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%595) : (i64) -> ()
      %596 = func.call @stack_pop_pointer() : () -> i64
      %597 = func.call @cc_values_pack(%596) : (i64) -> i64
      func.call @stack_push_pointer(%597) : (i64) -> ()
      %598 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %598 : i64
    }
    func.call @stack_push_pointer(%566) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725316"() {
    %917 = func.call @cc_nil_value() : () -> i64
    %918 = func.call @cc_nil_value() : () -> i64
    %919 = func.call @cc_errorp(%917) : (i64) -> i64
    %920 = arith.cmpi ne, %919, %918 : i64
    %921 = scf.if %920 -> (i64) {
      scf.yield %917 : i64
    } else {
      %922 = llvm.mlir.addressof @str80 : !llvm.ptr
      %923 = arith.constant 42 : i64
      %924 = func.call @cc_make_string(%922, %923) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%924) : (i64) -> ()
      %925 = func.call @stack_pop_pointer() : () -> i64
      %926 = func.call @cc_nil_value() : () -> i64
      %927 = func.call @cc_errorp(%925) : (i64) -> i64
      %928 = arith.cmpi ne, %927, %926 : i64
      %929 = arith.cmpi eq, %926, %926 : i64
      %930 = arith.andi %928, %929 : i1
      %931 = scf.if %930 -> (i64) {
        scf.yield %925 : i64
      } else {
        scf.yield %926 : i64
      }
      %932 = arith.cmpi ne, %931, %926 : i64
      scf.if %932 {
        func.call @stack_push_pointer(%931) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%925) : (i64) -> ()
        %933 = llvm.mlir.addressof @str81 : !llvm.ptr
        %934 = func.call @cc_make_function_ref_const(%933) : (!llvm.ptr) -> i64
        %935 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%934, %935) : (i64, i64) -> ()
      }
      %936 = func.call @stack_pop_pointer() : () -> i64
      %937 = llvm.mlir.addressof @str82 : !llvm.ptr
      %938 = arith.constant 42 : i64
      %939 = func.call @cc_make_string(%937, %938) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%939) : (i64) -> ()
      %940 = func.call @stack_pop_pointer() : () -> i64
      %941 = func.call @cc_nil_value() : () -> i64
      %942 = func.call @cc_nil_value() : () -> i64
      %943 = func.call @cc_errorp(%941) : (i64) -> i64
      %944 = arith.cmpi ne, %943, %942 : i64
      %945 = scf.if %944 -> (i64) {
        scf.yield %941 : i64
      } else {
        %946 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%946) : (i64) -> ()
        %947 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%936) : (i64) -> ()
        %948 = func.call @stack_pop_pointer() : () -> i64
        %949 = func.call @cc_nil_value() : () -> i64
        %950 = func.call @cc_errorp(%948) : (i64) -> i64
        %951 = arith.cmpi ne, %950, %949 : i64
        %952 = arith.cmpi eq, %949, %949 : i64
        %953 = arith.andi %951, %952 : i1
        %954 = scf.if %953 -> (i64) {
          scf.yield %948 : i64
        } else {
          scf.yield %949 : i64
        }
        %955 = arith.cmpi ne, %954, %949 : i64
        scf.if %955 {
          func.call @stack_push_pointer(%954) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%948) : (i64) -> ()
          %956 = llvm.mlir.addressof @str83 : !llvm.ptr
          %957 = func.call @cc_make_function_ref_const(%956) : (!llvm.ptr) -> i64
          %958 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%957, %958) : (i64, i64) -> ()
        }
        %959 = func.call @stack_pop_pointer() : () -> i64
        %960 = func.call @cc_multiple_value_list(%959) : (i64) -> i64
        %961 = func.call @cc_nth(%947, %960) : (i64, i64) -> i64
        func.call @stack_push_pointer(%961) : (i64) -> ()
        %962 = func.call @stack_pop_pointer() : () -> i64
        %963 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%963) : (i64) -> ()
        %964 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%940) : (i64) -> ()
        %965 = func.call @stack_pop_pointer() : () -> i64
        %966 = func.call @cc_nil_value() : () -> i64
        %967 = func.call @cc_errorp(%965) : (i64) -> i64
        %968 = arith.cmpi ne, %967, %966 : i64
        %969 = arith.cmpi eq, %966, %966 : i64
        %970 = arith.andi %968, %969 : i1
        %971 = scf.if %970 -> (i64) {
          scf.yield %965 : i64
        } else {
          scf.yield %966 : i64
        }
        %972 = arith.cmpi ne, %971, %966 : i64
        scf.if %972 {
          func.call @stack_push_pointer(%971) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%965) : (i64) -> ()
          %973 = llvm.mlir.addressof @str84 : !llvm.ptr
          %974 = func.call @cc_make_function_ref_const(%973) : (!llvm.ptr) -> i64
          %975 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%974, %975) : (i64, i64) -> ()
        }
        %976 = func.call @stack_pop_pointer() : () -> i64
        %977 = func.call @cc_multiple_value_list(%976) : (i64) -> i64
        %978 = func.call @cc_nth(%964, %977) : (i64, i64) -> i64
        func.call @stack_push_pointer(%978) : (i64) -> ()
        %979 = func.call @stack_pop_pointer() : () -> i64
        %980 = arith.constant 1 : i1
        %982 = arith.constant 3 : i64
        %981 = arith.andi %962, %982 : i64
        %983 = arith.constant 0 : i64
        %984 = arith.cmpi eq, %981, %983 : i64
        %986 = arith.constant 3 : i64
        %985 = arith.andi %979, %986 : i64
        %987 = arith.constant 0 : i64
        %988 = arith.cmpi eq, %985, %987 : i64
        %989 = arith.andi %984, %988 : i1
        %990 = scf.if %989 -> (i1) {
          %991 = arith.constant 2 : i64
          %992 = arith.shrsi %962, %991 : i64
          %993 = arith.constant 2 : i64
          %994 = arith.shrsi %979, %993 : i64
          %995 = arith.cmpi eq, %992, %994 : i64
          scf.yield %995 : i1
        } else {
          %996 = func.call @cc_eq(%962, %979) : (i64, i64) -> i64
          %997 = func.call @cc_nil_value() : () -> i64
          %998 = arith.cmpi ne, %996, %997 : i64
          scf.yield %998 : i1
        }
        %999 = arith.andi %980, %990 : i1
        %1000 = func.call @cc_nil_value() : () -> i64
        %1001 = func.call @cc_t_value() : () -> i64
        %1002 = scf.if %999 -> (i64) {
          scf.yield %1001 : i64
        } else {
          scf.yield %1000 : i64
        }
        func.call @stack_push_pointer(%1002) : (i64) -> ()
        %1003 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1003 : i64
      }
      func.call @stack_push_pointer(%945) : (i64) -> ()
      %1004 = func.call @stack_pop_pointer() : () -> i64
      %1005 = func.call @cc_nil_value() : () -> i64
      %1006 = func.call @cc_cons(%1004, %1005) : (i64, i64) -> i64
      %1007 = func.call @cc_not(%1006) : (i64) -> i64
      func.call @stack_push_pointer(%1007) : (i64) -> ()
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @cc_nil_value() : () -> i64
      %1010 = func.call @cc_cons(%1008, %1009) : (i64, i64) -> i64
      %1011 = func.call @cc_not(%1010) : (i64) -> i64
      func.call @stack_push_pointer(%1011) : (i64) -> ()
      %1012 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1012 : i64
    }
    func.call @stack_push_pointer(%921) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725317"() {
    %1188 = func.call @cc_nil_value() : () -> i64
    %1189 = func.call @cc_nil_value() : () -> i64
    %1190 = func.call @cc_errorp(%1188) : (i64) -> i64
    %1191 = arith.cmpi ne, %1190, %1189 : i64
    %1192 = scf.if %1191 -> (i64) {
      scf.yield %1188 : i64
    } else {
      %1193 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%1193) : (i64) -> ()
      %1194 = func.call @stack_pop_pointer() : () -> i64
      %1195 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1196 = arith.constant 42 : i64
      %1197 = func.call @cc_make_string(%1195, %1196) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1197) : (i64) -> ()
      %1198 = func.call @stack_pop_pointer() : () -> i64
      %1199 = func.call @cc_nil_value() : () -> i64
      %1200 = func.call @cc_errorp(%1198) : (i64) -> i64
      %1201 = arith.cmpi ne, %1200, %1199 : i64
      %1202 = arith.cmpi eq, %1199, %1199 : i64
      %1203 = arith.andi %1201, %1202 : i1
      %1204 = scf.if %1203 -> (i64) {
        scf.yield %1198 : i64
      } else {
        scf.yield %1199 : i64
      }
      %1205 = arith.cmpi ne, %1204, %1199 : i64
      scf.if %1205 {
        func.call @stack_push_pointer(%1204) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1198) : (i64) -> ()
        %1206 = llvm.mlir.addressof @str101 : !llvm.ptr
        %1207 = func.call @cc_make_function_ref_const(%1206) : (!llvm.ptr) -> i64
        %1208 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1207, %1208) : (i64, i64) -> ()
      }
      %1209 = func.call @stack_pop_pointer() : () -> i64
      %1210 = func.call @cc_multiple_value_list(%1209) : (i64) -> i64
      %1211 = func.call @cc_nth(%1194, %1210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1211) : (i64) -> ()
      %1212 = func.call @stack_pop_pointer() : () -> i64
      %1213 = func.call @cc_nil_value() : () -> i64
      %1214 = func.call @cc_cons(%1212, %1213) : (i64, i64) -> i64
      %1215 = func.call @cc_not(%1214) : (i64) -> i64
      func.call @stack_push_pointer(%1215) : (i64) -> ()
      %1216 = func.call @stack_pop_pointer() : () -> i64
      %1217 = func.call @cc_nil_value() : () -> i64
      %1218 = func.call @cc_cons(%1216, %1217) : (i64, i64) -> i64
      %1219 = func.call @cc_not(%1218) : (i64) -> i64
      func.call @stack_push_pointer(%1219) : (i64) -> ()
      %1220 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1220 : i64
    }
    func.call @stack_push_pointer(%1192) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725318"() {
    %1547 = func.call @cc_nil_value() : () -> i64
    %1548 = func.call @cc_nil_value() : () -> i64
    %1549 = func.call @cc_errorp(%1547) : (i64) -> i64
    %1550 = arith.cmpi ne, %1549, %1548 : i64
    %1551 = scf.if %1550 -> (i64) {
      scf.yield %1547 : i64
    } else {
      %1552 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1553 = arith.constant 42 : i64
      %1554 = func.call @cc_make_string(%1552, %1553) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1554) : (i64) -> ()
      %1555 = func.call @stack_pop_pointer() : () -> i64
      %1556 = func.call @cc_nil_value() : () -> i64
      %1557 = func.call @cc_nil_value() : () -> i64
      %1558 = func.call @cc_errorp(%1556) : (i64) -> i64
      %1559 = arith.cmpi ne, %1558, %1557 : i64
      %1560 = scf.if %1559 -> (i64) {
        scf.yield %1556 : i64
      } else {
        func.call @stack_push_pointer(%1555) : (i64) -> ()
        %1561 = func.call @stack_pop_pointer() : () -> i64
        %1562 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1563 = arith.constant 9 : i64
        %1564 = func.call @cc_make_string(%1562, %1563) : (!llvm.ptr, i64) -> i64
        %1565 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1566 = arith.constant 7 : i64
        %1567 = func.call @cc_make_string(%1565, %1566) : (!llvm.ptr, i64) -> i64
        %1568 = func.call @cc_intern(%1564, %1567) : (i64, i64) -> i64
        %1569 = func.call @cc_nil_value() : () -> i64
        %1570 = func.call @cc_cons(%1568, %1569) : (i64, i64) -> i64
        %1571 = func.call @cc_values_pack(%1570) : (i64) -> i64
        func.call @stack_push_pointer(%1568) : (i64) -> ()
        %1572 = func.call @stack_pop_pointer() : () -> i64
        %1573 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1574 = arith.constant 5 : i64
        %1575 = func.call @cc_make_string(%1573, %1574) : (!llvm.ptr, i64) -> i64
        %1576 = llvm.mlir.addressof @str137 : !llvm.ptr
        %1577 = arith.constant 7 : i64
        %1578 = func.call @cc_make_string(%1576, %1577) : (!llvm.ptr, i64) -> i64
        %1579 = func.call @cc_intern(%1575, %1578) : (i64, i64) -> i64
        %1580 = func.call @cc_nil_value() : () -> i64
        %1581 = func.call @cc_cons(%1579, %1580) : (i64, i64) -> i64
        %1582 = func.call @cc_values_pack(%1581) : (i64) -> i64
        func.call @stack_push_pointer(%1579) : (i64) -> ()
        %1583 = func.call @stack_pop_pointer() : () -> i64
        %1584 = func.call @cc_nil_value() : () -> i64
        %1585 = func.call @cc_errorp(%1561) : (i64) -> i64
        %1586 = arith.cmpi ne, %1585, %1584 : i64
        %1587 = arith.cmpi eq, %1584, %1584 : i64
        %1588 = arith.andi %1586, %1587 : i1
        %1589 = scf.if %1588 -> (i64) {
          scf.yield %1561 : i64
        } else {
          scf.yield %1584 : i64
        }
        %1590 = func.call @cc_errorp(%1572) : (i64) -> i64
        %1591 = arith.cmpi ne, %1590, %1584 : i64
        %1592 = arith.cmpi eq, %1589, %1584 : i64
        %1593 = arith.andi %1591, %1592 : i1
        %1594 = scf.if %1593 -> (i64) {
          scf.yield %1572 : i64
        } else {
          scf.yield %1589 : i64
        }
        %1595 = func.call @cc_errorp(%1583) : (i64) -> i64
        %1596 = arith.cmpi ne, %1595, %1584 : i64
        %1597 = arith.cmpi eq, %1594, %1584 : i64
        %1598 = arith.andi %1596, %1597 : i1
        %1599 = scf.if %1598 -> (i64) {
          scf.yield %1583 : i64
        } else {
          scf.yield %1594 : i64
        }
        %1600 = arith.cmpi ne, %1599, %1584 : i64
        scf.if %1600 {
          func.call @stack_push_pointer(%1599) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1561) : (i64) -> ()
          func.call @stack_push_pointer(%1572) : (i64) -> ()
          func.call @stack_push_pointer(%1583) : (i64) -> ()
          %1601 = llvm.mlir.addressof @str138 : !llvm.ptr
          %1602 = func.call @cc_make_function_ref_const(%1601) : (!llvm.ptr) -> i64
          %1603 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1602, %1603) : (i64, i64) -> ()
        }
        %1604 = func.call @stack_pop_pointer() : () -> i64
        %1605 = func.call @cc_nil_value() : () -> i64
        %1606 = func.call @cc_nil_value() : () -> i64
        %1607 = func.call @cc_errorp(%1605) : (i64) -> i64
        %1608 = arith.cmpi ne, %1607, %1606 : i64
        %1609 = scf.if %1608 -> (i64) {
          scf.yield %1605 : i64
        } else {
          func.call @stack_push_pointer(%1604) : (i64) -> ()
          %1610 = func.call @stack_pop_pointer() : () -> i64
          %1611 = func.call @cc_nil_value() : () -> i64
          %1612 = func.call @cc_errorp(%1610) : (i64) -> i64
          %1613 = arith.cmpi ne, %1612, %1611 : i64
          %1614 = arith.cmpi eq, %1611, %1611 : i64
          %1615 = arith.andi %1613, %1614 : i1
          %1616 = scf.if %1615 -> (i64) {
            scf.yield %1610 : i64
          } else {
            scf.yield %1611 : i64
          }
          %1617 = arith.cmpi ne, %1616, %1611 : i64
          scf.if %1617 {
            func.call @stack_push_pointer(%1616) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1610) : (i64) -> ()
            %1618 = llvm.mlir.addressof @str139 : !llvm.ptr
            %1619 = func.call @cc_make_function_ref_const(%1618) : (!llvm.ptr) -> i64
            %1620 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1619, %1620) : (i64, i64) -> ()
          }
          %1621 = func.call @stack_pop_pointer() : () -> i64
          %1622 = func.call @cc_nil_value() : () -> i64
          %1623 = func.call @cc_nil_value() : () -> i64
          %1624 = func.call @cc_errorp(%1622) : (i64) -> i64
          %1625 = arith.cmpi ne, %1624, %1623 : i64
          %1626 = scf.if %1625 -> (i64) {
            scf.yield %1622 : i64
          } else {
            func.call @stack_push_pointer(%1621) : (i64) -> ()
            %1627 = func.call @stack_pop_pointer() : () -> i64
            %1628 = func.call @cc_nil_value() : () -> i64
            %1629 = func.call @cc_errorp(%1627) : (i64) -> i64
            %1630 = arith.cmpi ne, %1629, %1628 : i64
            %1631 = arith.cmpi eq, %1628, %1628 : i64
            %1632 = arith.andi %1630, %1631 : i1
            %1633 = scf.if %1632 -> (i64) {
              scf.yield %1627 : i64
            } else {
              scf.yield %1628 : i64
            }
            %1634 = arith.cmpi ne, %1633, %1628 : i64
            scf.if %1634 {
              func.call @stack_push_pointer(%1633) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%1627) : (i64) -> ()
              %1635 = llvm.mlir.addressof @str140 : !llvm.ptr
              %1636 = func.call @cc_make_function_ref_const(%1635) : (!llvm.ptr) -> i64
              %1637 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%1636, %1637) : (i64, i64) -> ()
            }
            %1638 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1638 : i64
          }
          func.call @stack_push_pointer(%1626) : (i64) -> ()
          %1639 = func.call @stack_pop_pointer() : () -> i64
          %1640 = func.call @cc_multiple_value_list(%1639) : (i64) -> i64
          func.call @stack_push_pointer(%1604) : (i64) -> ()
          %1641 = func.call @stack_pop_pointer() : () -> i64
          %1642 = func.call @cc_nil_value() : () -> i64
          %1643 = func.call @cc_errorp(%1641) : (i64) -> i64
          %1644 = arith.cmpi ne, %1643, %1642 : i64
          %1645 = arith.cmpi eq, %1642, %1642 : i64
          %1646 = arith.andi %1644, %1645 : i1
          %1647 = scf.if %1646 -> (i64) {
            scf.yield %1641 : i64
          } else {
            scf.yield %1642 : i64
          }
          %1648 = arith.cmpi ne, %1647, %1642 : i64
          scf.if %1648 {
            func.call @stack_push_pointer(%1647) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%1641) : (i64) -> ()
            %1649 = llvm.mlir.addressof @str141 : !llvm.ptr
            %1650 = func.call @cc_make_function_ref_const(%1649) : (!llvm.ptr) -> i64
            %1651 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%1650, %1651) : (i64, i64) -> ()
          }
          %1652 = func.call @stack_depth() : () -> i64
          %1653 = arith.constant 0 : i64
          %1654 = arith.cmpi sgt, %1652, %1653 : i64
          scf.if %1654 {
            %1655 = func.call @stack_pop_pointer() : () -> i64
          }
          %1656 = func.call @cc_values_pack(%1640) : (i64) -> i64
          func.call @stack_push_pointer(%1656) : (i64) -> ()
          %1657 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %1657 : i64
        }
        func.call @stack_push_pointer(%1609) : (i64) -> ()
        %1658 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1658 : i64
      }
      func.call @stack_push_pointer(%1560) : (i64) -> ()
      %1659 = func.call @stack_pop_pointer() : () -> i64
      %1660 = func.call @cc_nil_value() : () -> i64
      %1661 = func.call @cc_cons(%1659, %1660) : (i64, i64) -> i64
      %1662 = func.call @cc_not(%1661) : (i64) -> i64
      func.call @stack_push_pointer(%1662) : (i64) -> ()
      %1663 = func.call @stack_pop_pointer() : () -> i64
      %1664 = func.call @cc_nil_value() : () -> i64
      %1665 = func.call @cc_cons(%1663, %1664) : (i64, i64) -> i64
      %1666 = func.call @cc_not(%1665) : (i64) -> i64
      func.call @stack_push_pointer(%1666) : (i64) -> ()
      %1667 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1667 : i64
    }
    func.call @stack_push_pointer(%1551) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725319"() {
    %2077 = func.call @cc_nil_value() : () -> i64
    %2078 = func.call @cc_nil_value() : () -> i64
    %2079 = func.call @cc_errorp(%2077) : (i64) -> i64
    %2080 = arith.cmpi ne, %2079, %2078 : i64
    %2081 = scf.if %2080 -> (i64) {
      scf.yield %2077 : i64
    } else {
      %2082 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2083 = arith.constant 42 : i64
      %2084 = func.call @cc_make_string(%2082, %2083) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2084) : (i64) -> ()
      %2085 = func.call @stack_pop_pointer() : () -> i64
      %2086 = func.call @cc_nil_value() : () -> i64
      %2087 = func.call @cc_nil_value() : () -> i64
      %2088 = func.call @cc_errorp(%2086) : (i64) -> i64
      %2089 = arith.cmpi ne, %2088, %2087 : i64
      %2090 = scf.if %2089 -> (i64) {
        scf.yield %2086 : i64
      } else {
        func.call @stack_push_pointer(%2085) : (i64) -> ()
        %2091 = func.call @stack_pop_pointer() : () -> i64
        %2092 = llvm.mlir.addressof @str183 : !llvm.ptr
        %2093 = arith.constant 9 : i64
        %2094 = func.call @cc_make_string(%2092, %2093) : (!llvm.ptr, i64) -> i64
        %2095 = llvm.mlir.addressof @str184 : !llvm.ptr
        %2096 = arith.constant 7 : i64
        %2097 = func.call @cc_make_string(%2095, %2096) : (!llvm.ptr, i64) -> i64
        %2098 = func.call @cc_intern(%2094, %2097) : (i64, i64) -> i64
        %2099 = func.call @cc_nil_value() : () -> i64
        %2100 = func.call @cc_cons(%2098, %2099) : (i64, i64) -> i64
        %2101 = func.call @cc_values_pack(%2100) : (i64) -> i64
        func.call @stack_push_pointer(%2098) : (i64) -> ()
        %2102 = func.call @stack_pop_pointer() : () -> i64
        %2103 = llvm.mlir.addressof @str185 : !llvm.ptr
        %2104 = arith.constant 5 : i64
        %2105 = func.call @cc_make_string(%2103, %2104) : (!llvm.ptr, i64) -> i64
        %2106 = llvm.mlir.addressof @str186 : !llvm.ptr
        %2107 = arith.constant 7 : i64
        %2108 = func.call @cc_make_string(%2106, %2107) : (!llvm.ptr, i64) -> i64
        %2109 = func.call @cc_intern(%2105, %2108) : (i64, i64) -> i64
        %2110 = func.call @cc_nil_value() : () -> i64
        %2111 = func.call @cc_cons(%2109, %2110) : (i64, i64) -> i64
        %2112 = func.call @cc_values_pack(%2111) : (i64) -> i64
        func.call @stack_push_pointer(%2109) : (i64) -> ()
        %2113 = func.call @stack_pop_pointer() : () -> i64
        %2114 = func.call @cc_nil_value() : () -> i64
        %2115 = func.call @cc_errorp(%2091) : (i64) -> i64
        %2116 = arith.cmpi ne, %2115, %2114 : i64
        %2117 = arith.cmpi eq, %2114, %2114 : i64
        %2118 = arith.andi %2116, %2117 : i1
        %2119 = scf.if %2118 -> (i64) {
          scf.yield %2091 : i64
        } else {
          scf.yield %2114 : i64
        }
        %2120 = func.call @cc_errorp(%2102) : (i64) -> i64
        %2121 = arith.cmpi ne, %2120, %2114 : i64
        %2122 = arith.cmpi eq, %2119, %2114 : i64
        %2123 = arith.andi %2121, %2122 : i1
        %2124 = scf.if %2123 -> (i64) {
          scf.yield %2102 : i64
        } else {
          scf.yield %2119 : i64
        }
        %2125 = func.call @cc_errorp(%2113) : (i64) -> i64
        %2126 = arith.cmpi ne, %2125, %2114 : i64
        %2127 = arith.cmpi eq, %2124, %2114 : i64
        %2128 = arith.andi %2126, %2127 : i1
        %2129 = scf.if %2128 -> (i64) {
          scf.yield %2113 : i64
        } else {
          scf.yield %2124 : i64
        }
        %2130 = arith.cmpi ne, %2129, %2114 : i64
        scf.if %2130 {
          func.call @stack_push_pointer(%2129) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2091) : (i64) -> ()
          func.call @stack_push_pointer(%2102) : (i64) -> ()
          func.call @stack_push_pointer(%2113) : (i64) -> ()
          %2131 = llvm.mlir.addressof @str187 : !llvm.ptr
          %2132 = func.call @cc_make_function_ref_const(%2131) : (!llvm.ptr) -> i64
          %2133 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%2132, %2133) : (i64, i64) -> ()
        }
        %2134 = func.call @stack_pop_pointer() : () -> i64
        %2135 = func.call @cc_nil_value() : () -> i64
        %2136 = func.call @cc_nil_value() : () -> i64
        %2137 = func.call @cc_errorp(%2135) : (i64) -> i64
        %2138 = arith.cmpi ne, %2137, %2136 : i64
        %2139 = scf.if %2138 -> (i64) {
          scf.yield %2135 : i64
        } else {
          func.call @stack_push_pointer(%2134) : (i64) -> ()
          %2140 = func.call @stack_pop_pointer() : () -> i64
          %2141 = func.call @cc_nil_value() : () -> i64
          %2142 = func.call @cc_errorp(%2140) : (i64) -> i64
          %2143 = arith.cmpi ne, %2142, %2141 : i64
          %2144 = arith.cmpi eq, %2141, %2141 : i64
          %2145 = arith.andi %2143, %2144 : i1
          %2146 = scf.if %2145 -> (i64) {
            scf.yield %2140 : i64
          } else {
            scf.yield %2141 : i64
          }
          %2147 = arith.cmpi ne, %2146, %2141 : i64
          scf.if %2147 {
            func.call @stack_push_pointer(%2146) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2140) : (i64) -> ()
            %2148 = llvm.mlir.addressof @str188 : !llvm.ptr
            %2149 = func.call @cc_make_function_ref_const(%2148) : (!llvm.ptr) -> i64
            %2150 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2149, %2150) : (i64, i64) -> ()
          }
          %2151 = func.call @stack_pop_pointer() : () -> i64
          %2152 = func.call @cc_nil_value() : () -> i64
          %2153 = func.call @cc_nil_value() : () -> i64
          %2154 = func.call @cc_errorp(%2152) : (i64) -> i64
          %2155 = arith.cmpi ne, %2154, %2153 : i64
          %2156 = scf.if %2155 -> (i64) {
            scf.yield %2152 : i64
          } else {
            %2157 = arith.constant 0 : i64
            func.call @stack_push_fixnum(%2157) : (i64) -> ()
            %2158 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2085) : (i64) -> ()
            %2159 = func.call @stack_pop_pointer() : () -> i64
            %2160 = func.call @cc_nil_value() : () -> i64
            %2161 = func.call @cc_errorp(%2159) : (i64) -> i64
            %2162 = arith.cmpi ne, %2161, %2160 : i64
            %2163 = arith.cmpi eq, %2160, %2160 : i64
            %2164 = arith.andi %2162, %2163 : i1
            %2165 = scf.if %2164 -> (i64) {
              scf.yield %2159 : i64
            } else {
              scf.yield %2160 : i64
            }
            %2166 = arith.cmpi ne, %2165, %2160 : i64
            scf.if %2166 {
              func.call @stack_push_pointer(%2165) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2159) : (i64) -> ()
              %2167 = llvm.mlir.addressof @str189 : !llvm.ptr
              %2168 = func.call @cc_make_function_ref_const(%2167) : (!llvm.ptr) -> i64
              %2169 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2168, %2169) : (i64, i64) -> ()
            }
            %2170 = func.call @stack_pop_pointer() : () -> i64
            %2171 = func.call @cc_multiple_value_list(%2170) : (i64) -> i64
            %2172 = func.call @cc_nth(%2158, %2171) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2172) : (i64) -> ()
            %2173 = func.call @stack_pop_pointer() : () -> i64
            %2174 = arith.constant 0 : i64
            func.call @stack_push_fixnum(%2174) : (i64) -> ()
            %2175 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2151) : (i64) -> ()
            %2176 = func.call @stack_pop_pointer() : () -> i64
            %2177 = func.call @cc_nil_value() : () -> i64
            %2178 = func.call @cc_errorp(%2176) : (i64) -> i64
            %2179 = arith.cmpi ne, %2178, %2177 : i64
            %2180 = arith.cmpi eq, %2177, %2177 : i64
            %2181 = arith.andi %2179, %2180 : i1
            %2182 = scf.if %2181 -> (i64) {
              scf.yield %2176 : i64
            } else {
              scf.yield %2177 : i64
            }
            %2183 = arith.cmpi ne, %2182, %2177 : i64
            scf.if %2183 {
              func.call @stack_push_pointer(%2182) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2176) : (i64) -> ()
              %2184 = llvm.mlir.addressof @str190 : !llvm.ptr
              %2185 = func.call @cc_make_function_ref_const(%2184) : (!llvm.ptr) -> i64
              %2186 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2185, %2186) : (i64, i64) -> ()
            }
            %2187 = func.call @stack_pop_pointer() : () -> i64
            %2188 = func.call @cc_multiple_value_list(%2187) : (i64) -> i64
            %2189 = func.call @cc_nth(%2175, %2188) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2189) : (i64) -> ()
            %2190 = func.call @stack_pop_pointer() : () -> i64
            %2191 = arith.constant 1 : i1
            %2193 = arith.constant 3 : i64
            %2192 = arith.andi %2173, %2193 : i64
            %2194 = arith.constant 0 : i64
            %2195 = arith.cmpi eq, %2192, %2194 : i64
            %2197 = arith.constant 3 : i64
            %2196 = arith.andi %2190, %2197 : i64
            %2198 = arith.constant 0 : i64
            %2199 = arith.cmpi eq, %2196, %2198 : i64
            %2200 = arith.andi %2195, %2199 : i1
            %2201 = scf.if %2200 -> (i1) {
              %2202 = arith.constant 2 : i64
              %2203 = arith.shrsi %2173, %2202 : i64
              %2204 = arith.constant 2 : i64
              %2205 = arith.shrsi %2190, %2204 : i64
              %2206 = arith.cmpi eq, %2203, %2205 : i64
              scf.yield %2206 : i1
            } else {
              %2207 = func.call @cc_eq(%2173, %2190) : (i64, i64) -> i64
              %2208 = func.call @cc_nil_value() : () -> i64
              %2209 = arith.cmpi ne, %2207, %2208 : i64
              scf.yield %2209 : i1
            }
            %2210 = arith.andi %2191, %2201 : i1
            %2211 = func.call @cc_nil_value() : () -> i64
            %2212 = func.call @cc_t_value() : () -> i64
            %2213 = scf.if %2210 -> (i64) {
              scf.yield %2212 : i64
            } else {
              scf.yield %2211 : i64
            }
            func.call @stack_push_pointer(%2213) : (i64) -> ()
            %2214 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2214 : i64
          }
          func.call @stack_push_pointer(%2156) : (i64) -> ()
          %2215 = func.call @stack_pop_pointer() : () -> i64
          %2216 = func.call @cc_multiple_value_list(%2215) : (i64) -> i64
          func.call @stack_push_pointer(%2134) : (i64) -> ()
          %2217 = func.call @stack_pop_pointer() : () -> i64
          %2218 = func.call @cc_nil_value() : () -> i64
          %2219 = func.call @cc_errorp(%2217) : (i64) -> i64
          %2220 = arith.cmpi ne, %2219, %2218 : i64
          %2221 = arith.cmpi eq, %2218, %2218 : i64
          %2222 = arith.andi %2220, %2221 : i1
          %2223 = scf.if %2222 -> (i64) {
            scf.yield %2217 : i64
          } else {
            scf.yield %2218 : i64
          }
          %2224 = arith.cmpi ne, %2223, %2218 : i64
          scf.if %2224 {
            func.call @stack_push_pointer(%2223) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2217) : (i64) -> ()
            %2225 = llvm.mlir.addressof @str191 : !llvm.ptr
            %2226 = func.call @cc_make_function_ref_const(%2225) : (!llvm.ptr) -> i64
            %2227 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2226, %2227) : (i64, i64) -> ()
          }
          %2228 = func.call @stack_depth() : () -> i64
          %2229 = arith.constant 0 : i64
          %2230 = arith.cmpi sgt, %2228, %2229 : i64
          scf.if %2230 {
            %2231 = func.call @stack_pop_pointer() : () -> i64
          }
          %2232 = func.call @cc_values_pack(%2216) : (i64) -> i64
          func.call @stack_push_pointer(%2232) : (i64) -> ()
          %2233 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2233 : i64
        }
        func.call @stack_push_pointer(%2139) : (i64) -> ()
        %2234 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2234 : i64
      }
      func.call @stack_push_pointer(%2090) : (i64) -> ()
      %2235 = func.call @stack_pop_pointer() : () -> i64
      %2236 = func.call @cc_nil_value() : () -> i64
      %2237 = func.call @cc_cons(%2235, %2236) : (i64, i64) -> i64
      %2238 = func.call @cc_not(%2237) : (i64) -> i64
      func.call @stack_push_pointer(%2238) : (i64) -> ()
      %2239 = func.call @stack_pop_pointer() : () -> i64
      %2240 = func.call @cc_nil_value() : () -> i64
      %2241 = func.call @cc_cons(%2239, %2240) : (i64, i64) -> i64
      %2242 = func.call @cc_not(%2241) : (i64) -> i64
      func.call @stack_push_pointer(%2242) : (i64) -> ()
      %2243 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2243 : i64
    }
    func.call @stack_push_pointer(%2081) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725320"() {
    %2653 = func.call @cc_nil_value() : () -> i64
    %2654 = func.call @cc_nil_value() : () -> i64
    %2655 = func.call @cc_errorp(%2653) : (i64) -> i64
    %2656 = arith.cmpi ne, %2655, %2654 : i64
    %2657 = scf.if %2656 -> (i64) {
      scf.yield %2653 : i64
    } else {
      %2658 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2659 = arith.constant 42 : i64
      %2660 = func.call @cc_make_string(%2658, %2659) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2660) : (i64) -> ()
      %2661 = func.call @stack_pop_pointer() : () -> i64
      %2662 = func.call @cc_nil_value() : () -> i64
      %2663 = func.call @cc_nil_value() : () -> i64
      %2664 = func.call @cc_errorp(%2662) : (i64) -> i64
      %2665 = arith.cmpi ne, %2664, %2663 : i64
      %2666 = scf.if %2665 -> (i64) {
        scf.yield %2662 : i64
      } else {
        func.call @stack_push_pointer(%2661) : (i64) -> ()
        %2667 = func.call @stack_pop_pointer() : () -> i64
        %2668 = llvm.mlir.addressof @str233 : !llvm.ptr
        %2669 = arith.constant 9 : i64
        %2670 = func.call @cc_make_string(%2668, %2669) : (!llvm.ptr, i64) -> i64
        %2671 = llvm.mlir.addressof @str234 : !llvm.ptr
        %2672 = arith.constant 7 : i64
        %2673 = func.call @cc_make_string(%2671, %2672) : (!llvm.ptr, i64) -> i64
        %2674 = func.call @cc_intern(%2670, %2673) : (i64, i64) -> i64
        %2675 = func.call @cc_nil_value() : () -> i64
        %2676 = func.call @cc_cons(%2674, %2675) : (i64, i64) -> i64
        %2677 = func.call @cc_values_pack(%2676) : (i64) -> i64
        func.call @stack_push_pointer(%2674) : (i64) -> ()
        %2678 = func.call @stack_pop_pointer() : () -> i64
        %2679 = llvm.mlir.addressof @str235 : !llvm.ptr
        %2680 = arith.constant 5 : i64
        %2681 = func.call @cc_make_string(%2679, %2680) : (!llvm.ptr, i64) -> i64
        %2682 = llvm.mlir.addressof @str236 : !llvm.ptr
        %2683 = arith.constant 7 : i64
        %2684 = func.call @cc_make_string(%2682, %2683) : (!llvm.ptr, i64) -> i64
        %2685 = func.call @cc_intern(%2681, %2684) : (i64, i64) -> i64
        %2686 = func.call @cc_nil_value() : () -> i64
        %2687 = func.call @cc_cons(%2685, %2686) : (i64, i64) -> i64
        %2688 = func.call @cc_values_pack(%2687) : (i64) -> i64
        func.call @stack_push_pointer(%2685) : (i64) -> ()
        %2689 = func.call @stack_pop_pointer() : () -> i64
        %2690 = func.call @cc_nil_value() : () -> i64
        %2691 = func.call @cc_errorp(%2667) : (i64) -> i64
        %2692 = arith.cmpi ne, %2691, %2690 : i64
        %2693 = arith.cmpi eq, %2690, %2690 : i64
        %2694 = arith.andi %2692, %2693 : i1
        %2695 = scf.if %2694 -> (i64) {
          scf.yield %2667 : i64
        } else {
          scf.yield %2690 : i64
        }
        %2696 = func.call @cc_errorp(%2678) : (i64) -> i64
        %2697 = arith.cmpi ne, %2696, %2690 : i64
        %2698 = arith.cmpi eq, %2695, %2690 : i64
        %2699 = arith.andi %2697, %2698 : i1
        %2700 = scf.if %2699 -> (i64) {
          scf.yield %2678 : i64
        } else {
          scf.yield %2695 : i64
        }
        %2701 = func.call @cc_errorp(%2689) : (i64) -> i64
        %2702 = arith.cmpi ne, %2701, %2690 : i64
        %2703 = arith.cmpi eq, %2700, %2690 : i64
        %2704 = arith.andi %2702, %2703 : i1
        %2705 = scf.if %2704 -> (i64) {
          scf.yield %2689 : i64
        } else {
          scf.yield %2700 : i64
        }
        %2706 = arith.cmpi ne, %2705, %2690 : i64
        scf.if %2706 {
          func.call @stack_push_pointer(%2705) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2667) : (i64) -> ()
          func.call @stack_push_pointer(%2678) : (i64) -> ()
          func.call @stack_push_pointer(%2689) : (i64) -> ()
          %2707 = llvm.mlir.addressof @str237 : !llvm.ptr
          %2708 = func.call @cc_make_function_ref_const(%2707) : (!llvm.ptr) -> i64
          %2709 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%2708, %2709) : (i64, i64) -> ()
        }
        %2710 = func.call @stack_pop_pointer() : () -> i64
        %2711 = func.call @cc_nil_value() : () -> i64
        %2712 = func.call @cc_nil_value() : () -> i64
        %2713 = func.call @cc_errorp(%2711) : (i64) -> i64
        %2714 = arith.cmpi ne, %2713, %2712 : i64
        %2715 = scf.if %2714 -> (i64) {
          scf.yield %2711 : i64
        } else {
          func.call @stack_push_pointer(%2710) : (i64) -> ()
          %2716 = func.call @stack_pop_pointer() : () -> i64
          %2717 = func.call @cc_nil_value() : () -> i64
          %2718 = func.call @cc_errorp(%2716) : (i64) -> i64
          %2719 = arith.cmpi ne, %2718, %2717 : i64
          %2720 = arith.cmpi eq, %2717, %2717 : i64
          %2721 = arith.andi %2719, %2720 : i1
          %2722 = scf.if %2721 -> (i64) {
            scf.yield %2716 : i64
          } else {
            scf.yield %2717 : i64
          }
          %2723 = arith.cmpi ne, %2722, %2717 : i64
          scf.if %2723 {
            func.call @stack_push_pointer(%2722) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2716) : (i64) -> ()
            %2724 = llvm.mlir.addressof @str238 : !llvm.ptr
            %2725 = func.call @cc_make_function_ref_const(%2724) : (!llvm.ptr) -> i64
            %2726 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2725, %2726) : (i64, i64) -> ()
          }
          %2727 = func.call @stack_pop_pointer() : () -> i64
          %2728 = func.call @cc_nil_value() : () -> i64
          %2729 = func.call @cc_nil_value() : () -> i64
          %2730 = func.call @cc_errorp(%2728) : (i64) -> i64
          %2731 = arith.cmpi ne, %2730, %2729 : i64
          %2732 = scf.if %2731 -> (i64) {
            scf.yield %2728 : i64
          } else {
            %2733 = arith.constant 1 : i64
            func.call @stack_push_fixnum(%2733) : (i64) -> ()
            %2734 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2661) : (i64) -> ()
            %2735 = func.call @stack_pop_pointer() : () -> i64
            %2736 = func.call @cc_nil_value() : () -> i64
            %2737 = func.call @cc_errorp(%2735) : (i64) -> i64
            %2738 = arith.cmpi ne, %2737, %2736 : i64
            %2739 = arith.cmpi eq, %2736, %2736 : i64
            %2740 = arith.andi %2738, %2739 : i1
            %2741 = scf.if %2740 -> (i64) {
              scf.yield %2735 : i64
            } else {
              scf.yield %2736 : i64
            }
            %2742 = arith.cmpi ne, %2741, %2736 : i64
            scf.if %2742 {
              func.call @stack_push_pointer(%2741) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2735) : (i64) -> ()
              %2743 = llvm.mlir.addressof @str239 : !llvm.ptr
              %2744 = func.call @cc_make_function_ref_const(%2743) : (!llvm.ptr) -> i64
              %2745 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2744, %2745) : (i64, i64) -> ()
            }
            %2746 = func.call @stack_pop_pointer() : () -> i64
            %2747 = func.call @cc_multiple_value_list(%2746) : (i64) -> i64
            %2748 = func.call @cc_nth(%2734, %2747) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2748) : (i64) -> ()
            %2749 = func.call @stack_pop_pointer() : () -> i64
            %2750 = arith.constant 1 : i64
            func.call @stack_push_fixnum(%2750) : (i64) -> ()
            %2751 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2727) : (i64) -> ()
            %2752 = func.call @stack_pop_pointer() : () -> i64
            %2753 = func.call @cc_nil_value() : () -> i64
            %2754 = func.call @cc_errorp(%2752) : (i64) -> i64
            %2755 = arith.cmpi ne, %2754, %2753 : i64
            %2756 = arith.cmpi eq, %2753, %2753 : i64
            %2757 = arith.andi %2755, %2756 : i1
            %2758 = scf.if %2757 -> (i64) {
              scf.yield %2752 : i64
            } else {
              scf.yield %2753 : i64
            }
            %2759 = arith.cmpi ne, %2758, %2753 : i64
            scf.if %2759 {
              func.call @stack_push_pointer(%2758) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%2752) : (i64) -> ()
              %2760 = llvm.mlir.addressof @str240 : !llvm.ptr
              %2761 = func.call @cc_make_function_ref_const(%2760) : (!llvm.ptr) -> i64
              %2762 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%2761, %2762) : (i64, i64) -> ()
            }
            %2763 = func.call @stack_pop_pointer() : () -> i64
            %2764 = func.call @cc_multiple_value_list(%2763) : (i64) -> i64
            %2765 = func.call @cc_nth(%2751, %2764) : (i64, i64) -> i64
            func.call @stack_push_pointer(%2765) : (i64) -> ()
            %2766 = func.call @stack_pop_pointer() : () -> i64
            %2767 = arith.constant 1 : i1
            %2769 = arith.constant 3 : i64
            %2768 = arith.andi %2749, %2769 : i64
            %2770 = arith.constant 0 : i64
            %2771 = arith.cmpi eq, %2768, %2770 : i64
            %2773 = arith.constant 3 : i64
            %2772 = arith.andi %2766, %2773 : i64
            %2774 = arith.constant 0 : i64
            %2775 = arith.cmpi eq, %2772, %2774 : i64
            %2776 = arith.andi %2771, %2775 : i1
            %2777 = scf.if %2776 -> (i1) {
              %2778 = arith.constant 2 : i64
              %2779 = arith.shrsi %2749, %2778 : i64
              %2780 = arith.constant 2 : i64
              %2781 = arith.shrsi %2766, %2780 : i64
              %2782 = arith.cmpi eq, %2779, %2781 : i64
              scf.yield %2782 : i1
            } else {
              %2783 = func.call @cc_eq(%2749, %2766) : (i64, i64) -> i64
              %2784 = func.call @cc_nil_value() : () -> i64
              %2785 = arith.cmpi ne, %2783, %2784 : i64
              scf.yield %2785 : i1
            }
            %2786 = arith.andi %2767, %2777 : i1
            %2787 = func.call @cc_nil_value() : () -> i64
            %2788 = func.call @cc_t_value() : () -> i64
            %2789 = scf.if %2786 -> (i64) {
              scf.yield %2788 : i64
            } else {
              scf.yield %2787 : i64
            }
            func.call @stack_push_pointer(%2789) : (i64) -> ()
            %2790 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %2790 : i64
          }
          func.call @stack_push_pointer(%2732) : (i64) -> ()
          %2791 = func.call @stack_pop_pointer() : () -> i64
          %2792 = func.call @cc_multiple_value_list(%2791) : (i64) -> i64
          func.call @stack_push_pointer(%2710) : (i64) -> ()
          %2793 = func.call @stack_pop_pointer() : () -> i64
          %2794 = func.call @cc_nil_value() : () -> i64
          %2795 = func.call @cc_errorp(%2793) : (i64) -> i64
          %2796 = arith.cmpi ne, %2795, %2794 : i64
          %2797 = arith.cmpi eq, %2794, %2794 : i64
          %2798 = arith.andi %2796, %2797 : i1
          %2799 = scf.if %2798 -> (i64) {
            scf.yield %2793 : i64
          } else {
            scf.yield %2794 : i64
          }
          %2800 = arith.cmpi ne, %2799, %2794 : i64
          scf.if %2800 {
            func.call @stack_push_pointer(%2799) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%2793) : (i64) -> ()
            %2801 = llvm.mlir.addressof @str241 : !llvm.ptr
            %2802 = func.call @cc_make_function_ref_const(%2801) : (!llvm.ptr) -> i64
            %2803 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%2802, %2803) : (i64, i64) -> ()
          }
          %2804 = func.call @stack_depth() : () -> i64
          %2805 = arith.constant 0 : i64
          %2806 = arith.cmpi sgt, %2804, %2805 : i64
          scf.if %2806 {
            %2807 = func.call @stack_pop_pointer() : () -> i64
          }
          %2808 = func.call @cc_values_pack(%2792) : (i64) -> i64
          func.call @stack_push_pointer(%2808) : (i64) -> ()
          %2809 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %2809 : i64
        }
        func.call @stack_push_pointer(%2715) : (i64) -> ()
        %2810 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2810 : i64
      }
      func.call @stack_push_pointer(%2666) : (i64) -> ()
      %2811 = func.call @stack_pop_pointer() : () -> i64
      %2812 = func.call @cc_nil_value() : () -> i64
      %2813 = func.call @cc_cons(%2811, %2812) : (i64, i64) -> i64
      %2814 = func.call @cc_not(%2813) : (i64) -> i64
      func.call @stack_push_pointer(%2814) : (i64) -> ()
      %2815 = func.call @stack_pop_pointer() : () -> i64
      %2816 = func.call @cc_nil_value() : () -> i64
      %2817 = func.call @cc_cons(%2815, %2816) : (i64, i64) -> i64
      %2818 = func.call @cc_not(%2817) : (i64) -> i64
      func.call @stack_push_pointer(%2818) : (i64) -> ()
      %2819 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2819 : i64
    }
    func.call @stack_push_pointer(%2657) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725321"() {
    %3229 = func.call @cc_nil_value() : () -> i64
    %3230 = func.call @cc_nil_value() : () -> i64
    %3231 = func.call @cc_errorp(%3229) : (i64) -> i64
    %3232 = arith.cmpi ne, %3231, %3230 : i64
    %3233 = scf.if %3232 -> (i64) {
      scf.yield %3229 : i64
    } else {
      %3234 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3235 = arith.constant 42 : i64
      %3236 = func.call @cc_make_string(%3234, %3235) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3236) : (i64) -> ()
      %3237 = func.call @stack_pop_pointer() : () -> i64
      %3238 = func.call @cc_nil_value() : () -> i64
      %3239 = func.call @cc_nil_value() : () -> i64
      %3240 = func.call @cc_errorp(%3238) : (i64) -> i64
      %3241 = arith.cmpi ne, %3240, %3239 : i64
      %3242 = scf.if %3241 -> (i64) {
        scf.yield %3238 : i64
      } else {
        func.call @stack_push_pointer(%3237) : (i64) -> ()
        %3243 = func.call @stack_pop_pointer() : () -> i64
        %3244 = llvm.mlir.addressof @str283 : !llvm.ptr
        %3245 = arith.constant 9 : i64
        %3246 = func.call @cc_make_string(%3244, %3245) : (!llvm.ptr, i64) -> i64
        %3247 = llvm.mlir.addressof @str284 : !llvm.ptr
        %3248 = arith.constant 7 : i64
        %3249 = func.call @cc_make_string(%3247, %3248) : (!llvm.ptr, i64) -> i64
        %3250 = func.call @cc_intern(%3246, %3249) : (i64, i64) -> i64
        %3251 = func.call @cc_nil_value() : () -> i64
        %3252 = func.call @cc_cons(%3250, %3251) : (i64, i64) -> i64
        %3253 = func.call @cc_values_pack(%3252) : (i64) -> i64
        func.call @stack_push_pointer(%3250) : (i64) -> ()
        %3254 = func.call @stack_pop_pointer() : () -> i64
        %3255 = llvm.mlir.addressof @str285 : !llvm.ptr
        %3256 = arith.constant 5 : i64
        %3257 = func.call @cc_make_string(%3255, %3256) : (!llvm.ptr, i64) -> i64
        %3258 = llvm.mlir.addressof @str286 : !llvm.ptr
        %3259 = arith.constant 7 : i64
        %3260 = func.call @cc_make_string(%3258, %3259) : (!llvm.ptr, i64) -> i64
        %3261 = func.call @cc_intern(%3257, %3260) : (i64, i64) -> i64
        %3262 = func.call @cc_nil_value() : () -> i64
        %3263 = func.call @cc_cons(%3261, %3262) : (i64, i64) -> i64
        %3264 = func.call @cc_values_pack(%3263) : (i64) -> i64
        func.call @stack_push_pointer(%3261) : (i64) -> ()
        %3265 = func.call @stack_pop_pointer() : () -> i64
        %3266 = func.call @cc_nil_value() : () -> i64
        %3267 = func.call @cc_errorp(%3243) : (i64) -> i64
        %3268 = arith.cmpi ne, %3267, %3266 : i64
        %3269 = arith.cmpi eq, %3266, %3266 : i64
        %3270 = arith.andi %3268, %3269 : i1
        %3271 = scf.if %3270 -> (i64) {
          scf.yield %3243 : i64
        } else {
          scf.yield %3266 : i64
        }
        %3272 = func.call @cc_errorp(%3254) : (i64) -> i64
        %3273 = arith.cmpi ne, %3272, %3266 : i64
        %3274 = arith.cmpi eq, %3271, %3266 : i64
        %3275 = arith.andi %3273, %3274 : i1
        %3276 = scf.if %3275 -> (i64) {
          scf.yield %3254 : i64
        } else {
          scf.yield %3271 : i64
        }
        %3277 = func.call @cc_errorp(%3265) : (i64) -> i64
        %3278 = arith.cmpi ne, %3277, %3266 : i64
        %3279 = arith.cmpi eq, %3276, %3266 : i64
        %3280 = arith.andi %3278, %3279 : i1
        %3281 = scf.if %3280 -> (i64) {
          scf.yield %3265 : i64
        } else {
          scf.yield %3276 : i64
        }
        %3282 = arith.cmpi ne, %3281, %3266 : i64
        scf.if %3282 {
          func.call @stack_push_pointer(%3281) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3243) : (i64) -> ()
          func.call @stack_push_pointer(%3254) : (i64) -> ()
          func.call @stack_push_pointer(%3265) : (i64) -> ()
          %3283 = llvm.mlir.addressof @str287 : !llvm.ptr
          %3284 = func.call @cc_make_function_ref_const(%3283) : (!llvm.ptr) -> i64
          %3285 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%3284, %3285) : (i64, i64) -> ()
        }
        %3286 = func.call @stack_pop_pointer() : () -> i64
        %3287 = func.call @cc_nil_value() : () -> i64
        %3288 = func.call @cc_nil_value() : () -> i64
        %3289 = func.call @cc_errorp(%3287) : (i64) -> i64
        %3290 = arith.cmpi ne, %3289, %3288 : i64
        %3291 = scf.if %3290 -> (i64) {
          scf.yield %3287 : i64
        } else {
          func.call @stack_push_pointer(%3286) : (i64) -> ()
          %3292 = func.call @stack_pop_pointer() : () -> i64
          %3293 = func.call @cc_nil_value() : () -> i64
          %3294 = func.call @cc_errorp(%3292) : (i64) -> i64
          %3295 = arith.cmpi ne, %3294, %3293 : i64
          %3296 = arith.cmpi eq, %3293, %3293 : i64
          %3297 = arith.andi %3295, %3296 : i1
          %3298 = scf.if %3297 -> (i64) {
            scf.yield %3292 : i64
          } else {
            scf.yield %3293 : i64
          }
          %3299 = arith.cmpi ne, %3298, %3293 : i64
          scf.if %3299 {
            func.call @stack_push_pointer(%3298) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3292) : (i64) -> ()
            %3300 = llvm.mlir.addressof @str288 : !llvm.ptr
            %3301 = func.call @cc_make_function_ref_const(%3300) : (!llvm.ptr) -> i64
            %3302 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3301, %3302) : (i64, i64) -> ()
          }
          %3303 = func.call @stack_pop_pointer() : () -> i64
          %3304 = func.call @cc_nil_value() : () -> i64
          %3305 = func.call @cc_nil_value() : () -> i64
          %3306 = func.call @cc_errorp(%3304) : (i64) -> i64
          %3307 = arith.cmpi ne, %3306, %3305 : i64
          %3308 = scf.if %3307 -> (i64) {
            scf.yield %3304 : i64
          } else {
            %3309 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%3309) : (i64) -> ()
            %3310 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3237) : (i64) -> ()
            %3311 = func.call @stack_pop_pointer() : () -> i64
            %3312 = func.call @cc_nil_value() : () -> i64
            %3313 = func.call @cc_errorp(%3311) : (i64) -> i64
            %3314 = arith.cmpi ne, %3313, %3312 : i64
            %3315 = arith.cmpi eq, %3312, %3312 : i64
            %3316 = arith.andi %3314, %3315 : i1
            %3317 = scf.if %3316 -> (i64) {
              scf.yield %3311 : i64
            } else {
              scf.yield %3312 : i64
            }
            %3318 = arith.cmpi ne, %3317, %3312 : i64
            scf.if %3318 {
              func.call @stack_push_pointer(%3317) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3311) : (i64) -> ()
              %3319 = llvm.mlir.addressof @str289 : !llvm.ptr
              %3320 = func.call @cc_make_function_ref_const(%3319) : (!llvm.ptr) -> i64
              %3321 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3320, %3321) : (i64, i64) -> ()
            }
            %3322 = func.call @stack_pop_pointer() : () -> i64
            %3323 = func.call @cc_multiple_value_list(%3322) : (i64) -> i64
            %3324 = func.call @cc_nth(%3310, %3323) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3324) : (i64) -> ()
            %3325 = func.call @stack_pop_pointer() : () -> i64
            %3326 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%3326) : (i64) -> ()
            %3327 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3303) : (i64) -> ()
            %3328 = func.call @stack_pop_pointer() : () -> i64
            %3329 = func.call @cc_nil_value() : () -> i64
            %3330 = func.call @cc_errorp(%3328) : (i64) -> i64
            %3331 = arith.cmpi ne, %3330, %3329 : i64
            %3332 = arith.cmpi eq, %3329, %3329 : i64
            %3333 = arith.andi %3331, %3332 : i1
            %3334 = scf.if %3333 -> (i64) {
              scf.yield %3328 : i64
            } else {
              scf.yield %3329 : i64
            }
            %3335 = arith.cmpi ne, %3334, %3329 : i64
            scf.if %3335 {
              func.call @stack_push_pointer(%3334) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%3328) : (i64) -> ()
              %3336 = llvm.mlir.addressof @str290 : !llvm.ptr
              %3337 = func.call @cc_make_function_ref_const(%3336) : (!llvm.ptr) -> i64
              %3338 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%3337, %3338) : (i64, i64) -> ()
            }
            %3339 = func.call @stack_pop_pointer() : () -> i64
            %3340 = func.call @cc_multiple_value_list(%3339) : (i64) -> i64
            %3341 = func.call @cc_nth(%3327, %3340) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3341) : (i64) -> ()
            %3342 = func.call @stack_pop_pointer() : () -> i64
            %3343 = arith.constant 1 : i1
            %3345 = arith.constant 3 : i64
            %3344 = arith.andi %3325, %3345 : i64
            %3346 = arith.constant 0 : i64
            %3347 = arith.cmpi eq, %3344, %3346 : i64
            %3349 = arith.constant 3 : i64
            %3348 = arith.andi %3342, %3349 : i64
            %3350 = arith.constant 0 : i64
            %3351 = arith.cmpi eq, %3348, %3350 : i64
            %3352 = arith.andi %3347, %3351 : i1
            %3353 = scf.if %3352 -> (i1) {
              %3354 = arith.constant 2 : i64
              %3355 = arith.shrsi %3325, %3354 : i64
              %3356 = arith.constant 2 : i64
              %3357 = arith.shrsi %3342, %3356 : i64
              %3358 = arith.cmpi eq, %3355, %3357 : i64
              scf.yield %3358 : i1
            } else {
              %3359 = func.call @cc_eq(%3325, %3342) : (i64, i64) -> i64
              %3360 = func.call @cc_nil_value() : () -> i64
              %3361 = arith.cmpi ne, %3359, %3360 : i64
              scf.yield %3361 : i1
            }
            %3362 = arith.andi %3343, %3353 : i1
            %3363 = func.call @cc_nil_value() : () -> i64
            %3364 = func.call @cc_t_value() : () -> i64
            %3365 = scf.if %3362 -> (i64) {
              scf.yield %3364 : i64
            } else {
              scf.yield %3363 : i64
            }
            func.call @stack_push_pointer(%3365) : (i64) -> ()
            %3366 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3366 : i64
          }
          func.call @stack_push_pointer(%3308) : (i64) -> ()
          %3367 = func.call @stack_pop_pointer() : () -> i64
          %3368 = func.call @cc_multiple_value_list(%3367) : (i64) -> i64
          func.call @stack_push_pointer(%3286) : (i64) -> ()
          %3369 = func.call @stack_pop_pointer() : () -> i64
          %3370 = func.call @cc_nil_value() : () -> i64
          %3371 = func.call @cc_errorp(%3369) : (i64) -> i64
          %3372 = arith.cmpi ne, %3371, %3370 : i64
          %3373 = arith.cmpi eq, %3370, %3370 : i64
          %3374 = arith.andi %3372, %3373 : i1
          %3375 = scf.if %3374 -> (i64) {
            scf.yield %3369 : i64
          } else {
            scf.yield %3370 : i64
          }
          %3376 = arith.cmpi ne, %3375, %3370 : i64
          scf.if %3376 {
            func.call @stack_push_pointer(%3375) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%3369) : (i64) -> ()
            %3377 = llvm.mlir.addressof @str291 : !llvm.ptr
            %3378 = func.call @cc_make_function_ref_const(%3377) : (!llvm.ptr) -> i64
            %3379 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%3378, %3379) : (i64, i64) -> ()
          }
          %3380 = func.call @stack_depth() : () -> i64
          %3381 = arith.constant 0 : i64
          %3382 = arith.cmpi sgt, %3380, %3381 : i64
          scf.if %3382 {
            %3383 = func.call @stack_pop_pointer() : () -> i64
          }
          %3384 = func.call @cc_values_pack(%3368) : (i64) -> i64
          func.call @stack_push_pointer(%3384) : (i64) -> ()
          %3385 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %3385 : i64
        }
        func.call @stack_push_pointer(%3291) : (i64) -> ()
        %3386 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3386 : i64
      }
      func.call @stack_push_pointer(%3242) : (i64) -> ()
      %3387 = func.call @stack_pop_pointer() : () -> i64
      %3388 = func.call @cc_nil_value() : () -> i64
      %3389 = func.call @cc_cons(%3387, %3388) : (i64, i64) -> i64
      %3390 = func.call @cc_not(%3389) : (i64) -> i64
      func.call @stack_push_pointer(%3390) : (i64) -> ()
      %3391 = func.call @stack_pop_pointer() : () -> i64
      %3392 = func.call @cc_nil_value() : () -> i64
      %3393 = func.call @cc_cons(%3391, %3392) : (i64, i64) -> i64
      %3394 = func.call @cc_not(%3393) : (i64) -> i64
      func.call @stack_push_pointer(%3394) : (i64) -> ()
      %3395 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3395 : i64
    }
    func.call @stack_push_pointer(%3233) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725322"() {
    %3568 = func.call @cc_nil_value() : () -> i64
    %3569 = func.call @cc_nil_value() : () -> i64
    %3570 = func.call @cc_errorp(%3568) : (i64) -> i64
    %3571 = arith.cmpi ne, %3570, %3569 : i64
    %3572 = scf.if %3571 -> (i64) {
      scf.yield %3568 : i64
    } else {
      %3573 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3574 = func.call @cc_nil_value() : () -> i64
      %3575 = func.call @cc_nil_value() : () -> i64
      %3576 = func.call @cc_errorp(%3574) : (i64) -> i64
      %3577 = arith.cmpi ne, %3576, %3575 : i64
      %3578 = scf.if %3577 -> (i64) {
        scf.yield %3574 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3579 = arith.constant 23 : i64
        func.call @stack_push_fixnum(%3579) : (i64) -> ()
        %3580 = func.call @stack_pop_pointer() : () -> i64
        %3581 = func.call @cc_nil_value() : () -> i64
        %3582 = func.call @cc_errorp(%3580) : (i64) -> i64
        %3583 = arith.cmpi ne, %3582, %3581 : i64
        %3584 = arith.cmpi eq, %3581, %3581 : i64
        %3585 = arith.andi %3583, %3584 : i1
        %3586 = scf.if %3585 -> (i64) {
          scf.yield %3580 : i64
        } else {
          scf.yield %3581 : i64
        }
        %3587 = arith.cmpi ne, %3586, %3581 : i64
        scf.if %3587 {
          func.call @stack_push_pointer(%3586) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3580) : (i64) -> ()
          %3588 = llvm.mlir.addressof @str306 : !llvm.ptr
          %3589 = func.call @cc_make_function_ref_const(%3588) : (!llvm.ptr) -> i64
          %3590 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3589, %3590) : (i64, i64) -> ()
        }
        %3591 = func.call @stack_pop_pointer() : () -> i64
        %3592 = func.call @cc_errorp(%3591) : (i64) -> i64
        %3593 = func.call @cc_nil_value() : () -> i64
        %3594 = arith.cmpi ne, %3592, %3593 : i64
        scf.if %3594 {
          func.call @stack_push_pointer(%3591) : (i64) -> ()
        } else {
          %3595 = func.call @cc_multiple_value_list(%3591) : (i64) -> i64
          func.call @stack_push_pointer(%3595) : (i64) -> ()
        }
        %3596 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3597 = func.call @stack_pop_pointer() : () -> i64
        %3598 = func.call @cc_nil_value() : () -> i64
        %3599 = func.call @cc_maybe_error_from_multiple_value_list(%3596) : (i64) -> i64
        %3600 = func.call @cc_errorp(%3599) : (i64) -> i64
        %3601 = arith.cmpi ne, %3600, %3598 : i64
        %3602 = arith.cmpi eq, %3598, %3598 : i64
        %3603 = arith.andi %3601, %3602 : i1
        %3604 = scf.if %3603 -> (i64) {
          scf.yield %3599 : i64
        } else {
          scf.yield %3598 : i64
        }
        %3605 = arith.cmpi ne, %3604, %3598 : i64
        scf.if %3605 {
          func.call @stack_push_pointer(%3604) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3606 = func.call @stack_pop_pointer() : () -> i64
          %3607 = func.call @cc_cons(%3597, %3606) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3607) : (i64) -> ()
          %3608 = func.call @stack_pop_pointer() : () -> i64
          %3609 = func.call @cc_cons(%3596, %3608) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3609) : (i64) -> ()
          %3610 = func.call @stack_pop_pointer() : () -> i64
          %3611 = func.call @cc_values_pack(%3610) : (i64) -> i64
          func.call @stack_push_pointer(%3611) : (i64) -> ()
        }
        %3612 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3612 : i64
      }
      func.call @stack_push_pointer(%3578) : (i64) -> ()
      %3613 = func.call @stack_pop_pointer() : () -> i64
      %3614 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3615 = func.call @cc_errorp(%3613) : (i64) -> i64
      %3616 = func.call @cc_nil_value() : () -> i64
      %3617 = arith.cmpi ne, %3615, %3616 : i64
      scf.if %3617 {
        %3618 = func.call @cc_condition_value(%3613) : (i64) -> i64
        %3619 = func.call @cc_values2(%3616, %3618) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3619) : (i64) -> ()
      } else {
        %3620 = func.call @cc_multiple_value_list(%3613) : (i64) -> i64
        %3621 = func.call @cc_values_pack(%3620) : (i64) -> i64
        func.call @stack_push_pointer(%3621) : (i64) -> ()
      }
      %3622 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3622 : i64
    }
    func.call @stack_push_pointer(%3572) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_269090723725323"() {
    %3996 = func.call @stack_pop_pointer() : () -> i64
    %3997 = func.call @stack_pop_pointer() : () -> i64
    %3998 = func.call @cc_nil_value() : () -> i64
    %3999 = func.call @cc_nil_value() : () -> i64
    %4000 = func.call @cc_errorp(%3998) : (i64) -> i64
    %4001 = arith.cmpi ne, %4000, %3999 : i64
    %4002 = scf.if %4001 -> (i64) {
      scf.yield %3998 : i64
    } else {
      %4003 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4004 = arith.constant 11 : i64
      %4005 = func.call @cc_make_string(%4003, %4004) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4005) : (i64) -> ()
      %4006 = func.call @stack_pop_pointer() : () -> i64
      %4007 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4008 = arith.constant 9 : i64
      %4009 = func.call @cc_make_string(%4007, %4008) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4009) : (i64) -> ()
      %4010 = func.call @stack_pop_pointer() : () -> i64
      %4011 = llvm.mlir.addressof @str348 : !llvm.ptr
      %4012 = arith.constant 8 : i64
      %4013 = func.call @cc_make_string(%4011, %4012) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4013) : (i64) -> ()
      %4014 = func.call @stack_pop_pointer() : () -> i64
      %4015 = llvm.mlir.addressof @str349 : !llvm.ptr
      %4016 = arith.constant 6 : i64
      %4017 = func.call @cc_make_string(%4015, %4016) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4017) : (i64) -> ()
      %4018 = func.call @stack_pop_pointer() : () -> i64
      %4019 = func.call @cc_nil_value() : () -> i64
      %4020 = func.call @cc_errorp(%4006) : (i64) -> i64
      %4021 = arith.cmpi ne, %4020, %4019 : i64
      %4022 = arith.cmpi eq, %4019, %4019 : i64
      %4023 = arith.andi %4021, %4022 : i1
      %4024 = scf.if %4023 -> (i64) {
        scf.yield %4006 : i64
      } else {
        scf.yield %4019 : i64
      }
      %4025 = func.call @cc_errorp(%4010) : (i64) -> i64
      %4026 = arith.cmpi ne, %4025, %4019 : i64
      %4027 = arith.cmpi eq, %4024, %4019 : i64
      %4028 = arith.andi %4026, %4027 : i1
      %4029 = scf.if %4028 -> (i64) {
        scf.yield %4010 : i64
      } else {
        scf.yield %4024 : i64
      }
      %4030 = func.call @cc_errorp(%4014) : (i64) -> i64
      %4031 = arith.cmpi ne, %4030, %4019 : i64
      %4032 = arith.cmpi eq, %4029, %4019 : i64
      %4033 = arith.andi %4031, %4032 : i1
      %4034 = scf.if %4033 -> (i64) {
        scf.yield %4014 : i64
      } else {
        scf.yield %4029 : i64
      }
      %4035 = func.call @cc_errorp(%4018) : (i64) -> i64
      %4036 = arith.cmpi ne, %4035, %4019 : i64
      %4037 = arith.cmpi eq, %4034, %4019 : i64
      %4038 = arith.andi %4036, %4037 : i1
      %4039 = scf.if %4038 -> (i64) {
        scf.yield %4018 : i64
      } else {
        scf.yield %4034 : i64
      }
      %4040 = arith.cmpi ne, %4039, %4019 : i64
      scf.if %4040 {
        func.call @stack_push_pointer(%4039) : (i64) -> ()
      } else {
        %4041 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%4041) : (i64) -> ()
        func.call @stack_push_pointer(%4018) : (i64) -> ()
        %4042 = func.call @stack_pop_pointer() : () -> i64
        %4043 = func.call @stack_pop_pointer() : () -> i64
        %4044 = func.call @cc_cons(%4042, %4043) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4044) : (i64) -> ()
        func.call @stack_push_pointer(%4014) : (i64) -> ()
        %4045 = func.call @stack_pop_pointer() : () -> i64
        %4046 = func.call @stack_pop_pointer() : () -> i64
        %4047 = func.call @cc_cons(%4045, %4046) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4047) : (i64) -> ()
        func.call @stack_push_pointer(%4010) : (i64) -> ()
        %4048 = func.call @stack_pop_pointer() : () -> i64
        %4049 = func.call @stack_pop_pointer() : () -> i64
        %4050 = func.call @cc_cons(%4048, %4049) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4050) : (i64) -> ()
        func.call @stack_push_pointer(%4006) : (i64) -> ()
        %4051 = func.call @stack_pop_pointer() : () -> i64
        %4052 = func.call @stack_pop_pointer() : () -> i64
        %4053 = func.call @cc_cons(%4051, %4052) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4053) : (i64) -> ()
      }
      %4054 = func.call @stack_pop_pointer() : () -> i64
      %4055 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4055) : (i64) -> ()
      %4056 = func.call @stack_pop_pointer() : () -> i64
      %4057 = func.call @cc_nil_value() : () -> i64
      %4058 = func.call @cc_errorp(%4054) : (i64) -> i64
      %4059 = arith.cmpi ne, %4058, %4057 : i64
      %4060 = arith.cmpi eq, %4057, %4057 : i64
      %4061 = arith.andi %4059, %4060 : i1
      %4062 = scf.if %4061 -> (i64) {
        scf.yield %4054 : i64
      } else {
        scf.yield %4057 : i64
      }
      %4063 = func.call @cc_errorp(%4056) : (i64) -> i64
      %4064 = arith.cmpi ne, %4063, %4057 : i64
      %4065 = arith.cmpi eq, %4062, %4057 : i64
      %4066 = arith.andi %4064, %4065 : i1
      %4067 = scf.if %4066 -> (i64) {
        scf.yield %4056 : i64
      } else {
        scf.yield %4062 : i64
      }
      %4068 = arith.cmpi ne, %4067, %4057 : i64
      scf.if %4068 {
        func.call @stack_push_pointer(%4067) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4054) : (i64) -> ()
        func.call @stack_push_pointer(%4056) : (i64) -> ()
        %4069 = llvm.mlir.addressof @str350 : !llvm.ptr
        %4070 = func.call @cc_make_function_ref_const(%4069) : (!llvm.ptr) -> i64
        %4071 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%4070, %4071) : (i64, i64) -> ()
      }
      %4072 = func.call @stack_pop_pointer() : () -> i64
      %4073 = func.call @cc_multiple_value_list(%4072) : (i64) -> i64
      %4074 = arith.constant 0 : i64
      %4075 = func.call @cc_box_fixnum(%4074) : (i64) -> i64
      %4076 = func.call @cc_nth(%4075, %4073) : (i64, i64) -> i64
      %4077 = arith.constant 1 : i64
      %4078 = func.call @cc_box_fixnum(%4077) : (i64) -> i64
      %4079 = func.call @cc_nth(%4078, %4073) : (i64, i64) -> i64
      %4080 = arith.constant 2 : i64
      %4081 = func.call @cc_box_fixnum(%4080) : (i64) -> i64
      %4082 = func.call @cc_nth(%4081, %4073) : (i64, i64) -> i64
      func.call @stack_push_nil() : () -> ()
      %4083 = func.call @stack_depth() : () -> i64
      %4084 = arith.constant 0 : i64
      %4085 = arith.cmpi sgt, %4083, %4084 : i64
      scf.if %4085 {
        %4086 = func.call @stack_pop_pointer() : () -> i64
      }
      func.call @stack_push_pointer(%4082) : (i64) -> ()
      %4087 = func.call @stack_pop_pointer() : () -> i64
      %4088 = func.call @cc_nil_value() : () -> i64
      %4089 = arith.cmpi ne, %4087, %4088 : i64
      scf.if %4089 {
        func.call @stack_push_pointer(%4082) : (i64) -> ()
        %4090 = func.call @stack_pop_pointer() : () -> i64
        %4091 = func.call @cc_nil_value() : () -> i64
        %4092 = func.call @cc_errorp(%4090) : (i64) -> i64
        %4093 = arith.cmpi ne, %4092, %4091 : i64
        %4094 = arith.cmpi eq, %4091, %4091 : i64
        %4095 = arith.andi %4093, %4094 : i1
        %4096 = scf.if %4095 -> (i64) {
          scf.yield %4090 : i64
        } else {
          scf.yield %4091 : i64
        }
        %4097 = arith.cmpi ne, %4096, %4091 : i64
        scf.if %4097 {
          func.call @stack_push_pointer(%4096) : (i64) -> ()
        } else {
          %4098 = func.call @cc_nil_value() : () -> i64
          %4099 = func.call @cc_cons(%4090, %4098) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4099) : (i64) -> ()
          func.call @cc_write_stack() : () -> ()
        }
      } else {
        func.call @stack_push_nil() : () -> ()
      }
      %4100 = func.call @stack_pop_pointer() : () -> i64
      %4101 = func.call @cc_nil_value() : () -> i64
      %4102 = func.call @cc_cons(%4100, %4101) : (i64, i64) -> i64
      %4103 = func.call @cc_not(%4102) : (i64) -> i64
      func.call @stack_push_pointer(%4103) : (i64) -> ()
      %4104 = func.call @stack_pop_pointer() : () -> i64
      %4105 = func.call @cc_nil_value() : () -> i64
      %4106 = func.call @cc_cons(%4104, %4105) : (i64, i64) -> i64
      %4107 = func.call @cc_not(%4106) : (i64) -> i64
      func.call @stack_push_pointer(%4107) : (i64) -> ()
      %4108 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4108 : i64
    }
    func.call @stack_push_pointer(%4002) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_269090723725312*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_269090723725312*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_269090723725312*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("STAT-ALL\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str6("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str8("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str9("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str10("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str11("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str12("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str13("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str14("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str19("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str20("STAT-SIZE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str21("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str23("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str24("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str25("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str26("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str27("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str28("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str29("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str30("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str37("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str38("STAT-MTIME\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str39("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str41("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str43("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str47("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str49("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str50("NUMBER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str52("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str57("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str58("STAT-SIZE-MTIME-NO-LOGICAL-PATHNAME\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str59("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str60("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str61("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str62("FILE-NO-LP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str63("TRANSLATE-LOGICAL-PATHNAME\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str66("FILE-LP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str67("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str68("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str69("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str71("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str72("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str73("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str74("FILE-NO-LP\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str75("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str76("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str77("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str78("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str79("FILE-LP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str81("TRANSLATE-LOGICAL-PATHNAME\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str82("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str83("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str84("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str85("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str86("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str87("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str88("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str89("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str90("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str91("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str92("STAT-SIZE-MODE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str93("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str94("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str95("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str96("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str97("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str98("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str99("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str100("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str101("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str102("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str103("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str104("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str105("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str106("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str108("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str109("FSTAT-ALL\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str110("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str111("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str112("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str113("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str114("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str115("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str116("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str117("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str118("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str119("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str120("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str121("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str122("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str123("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str124("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str125("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str126("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str127("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str128("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str129("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str130("FSTAT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str131("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str132("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str133("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str134("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str135("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str136("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str137("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str138("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str139("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str140("ext:fstat\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str141("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str142("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str143("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str145("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str146("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str147("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str148("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str149("FSTAT-SIZE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str150("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str151("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str152("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str153("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str154("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str155("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str158("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str160("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str161("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str162("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str163("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str164("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str165("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str166("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str167("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str168("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str173("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str174("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str175("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str176("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str177("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str178("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str179("FSTAT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str180("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str181("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str182("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str183("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str184("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str185("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str186("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str187("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str188("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str189("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str190("ext:fstat\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str191("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str192("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str193("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str194("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str195("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str196("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str197("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str198("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str199("FSTAT-MTIME\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str200("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str201("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str202("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str203("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str204("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str205("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str206("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str207("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str208("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str209("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str210("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str211("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str212("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str213("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str214("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str215("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str216("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str217("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str218("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str219("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str220("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str221("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str222("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str223("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str224("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str225("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str226("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str227("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str228("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str229("FSTAT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str230("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str231("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str232("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str233("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str234("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str235("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str236("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str237("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str238("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str239("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str240("ext:fstat\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str241("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str242("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str243("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str245("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str246("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str247("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str248("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str249("FSTAT-MODE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str250("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str251("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str252("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str253("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str254("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str255("WITH-OPEN-FILE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str256("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str257("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str258("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str259("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str260("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str261("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str262("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str263("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str264("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str265("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str266("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str267("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str268("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str269("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("=\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str271("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str272("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str273("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274("STAT\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str275("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str276("FILE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str277("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str278("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("FSTAT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str280("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str281("FD\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str282("sys:src;lisp;regression-tests;run-all.lisp\00") : !llvm.array<43 x i8>
  llvm.mlir.global private constant @str283("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str284("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str285("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str286("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str287("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str288("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str289("ext:stat\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str290("ext:fstat\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str291("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str292("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str293("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str294("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str295("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str296("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str297("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str298("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str299("FILE-STREAM-FILE-DESCRIPTOR-WRONG-TYPE\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str300("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str301("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str302("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str303("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str304("FILE-STREAM-FILE-DESCRIPTOR\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str305("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str306("ext:file-stream-file-descriptor\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str307("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str308("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str309("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str310("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str311("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str312("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str313("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str314("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str315("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str316("FILESTREAM_O__REPR__\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str317("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str318("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str319("MULTIPLE-VALUE-BIND\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str320("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str321("ERRNO\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str322("PID-OR-ERROR-MESSAGE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str323("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str324("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str325("VFORK-EXECVP\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str326("EXT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str327("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str328("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str329("llvm-config\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str330("--ldflags\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str331("--libdir\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str332("--libs\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str333("DECLARE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str334("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str335("IGNORE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str336("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str337("ERRNO\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str338("PID-OR-ERROR-MESSAGE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str339("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str340("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str341("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str342("WRITE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str343("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str344("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str345("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str346("llvm-config\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("--ldflags\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str348("--libdir\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str349("--libs\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str350("ext:vfork-execvp\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str351("#:%%DYN-CELL-269090723725324-ERRNO\00") : !llvm.array<35 x i8>
  llvm.mlir.global private constant @str352("#:%%DYN-CELL-269090723725325-PID-OR-ERROR-MESSAGE\00") : !llvm.array<50 x i8>
  llvm.mlir.global private constant @str353("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str354("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str355("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str356("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str357("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str358("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str359("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str360("*__MLIR_BLOCK_RETFLAG_269090723725312*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str361("*__MLIR_BLOCK_RETMVLIST_269090723725312*\00") : !llvm.array<41 x i8>
}
