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
      %58 = arith.constant 14 : i64
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
      %75 = arith.constant 1 : i64
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
      func.call @stack_push_pointer(%84) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = func.call @stack_pop_pointer() : () -> i64
      %87 = func.call @cc_cons(%86, %85) : (i64, i64) -> i64
      func.call @stack_push_pointer(%87) : (i64) -> ()
      %88 = func.call @stack_pop_pointer() : () -> i64
      %89 = func.call @stack_pop_pointer() : () -> i64
      %90 = func.call @cc_cons(%89, %88) : (i64, i64) -> i64
      func.call @stack_push_pointer(%90) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %91 = func.call @stack_pop_pointer() : () -> i64
      %92 = func.call @stack_pop_pointer() : () -> i64
      %93 = func.call @cc_cons(%92, %91) : (i64, i64) -> i64
      func.call @stack_push_pointer(%93) : (i64) -> ()
      %94 = llvm.mlir.addressof @str9 : !llvm.ptr
      %95 = arith.constant 7 : i64
      %96 = func.call @cc_make_string(%94, %95) : (!llvm.ptr, i64) -> i64
      %97 = llvm.mlir.addressof @str10 : !llvm.ptr
      %98 = arith.constant 11 : i64
      %99 = func.call @cc_make_string(%97, %98) : (!llvm.ptr, i64) -> i64
      %100 = func.call @cc_intern(%96, %99) : (i64, i64) -> i64
      %101 = func.call @cc_nil_value() : () -> i64
      %102 = func.call @cc_cons(%100, %101) : (i64, i64) -> i64
      %103 = func.call @cc_values_pack(%102) : (i64) -> i64
      func.call @stack_push_pointer(%100) : (i64) -> ()
      %104 = llvm.mlir.addressof @str11 : !llvm.ptr
      %105 = arith.constant 1 : i64
      %106 = func.call @cc_make_string(%104, %105) : (!llvm.ptr, i64) -> i64
      %107 = func.call @cc_nil_value() : () -> i64
      %108 = func.call @cc_intern(%106, %107) : (i64, i64) -> i64
      %109 = func.call @cc_nil_value() : () -> i64
      %110 = func.call @cc_cons(%108, %109) : (i64, i64) -> i64
      %111 = func.call @cc_values_pack(%110) : (i64) -> i64
      func.call @stack_push_pointer(%108) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %112 = func.call @stack_pop_pointer() : () -> i64
      %113 = func.call @stack_pop_pointer() : () -> i64
      %114 = func.call @cc_cons(%113, %112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%114) : (i64) -> ()
      %115 = func.call @stack_pop_pointer() : () -> i64
      %116 = func.call @stack_pop_pointer() : () -> i64
      %117 = func.call @cc_cons(%116, %115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %118 = func.call @stack_pop_pointer() : () -> i64
      %119 = func.call @stack_pop_pointer() : () -> i64
      %120 = func.call @cc_cons(%119, %118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%120) : (i64) -> ()
      %121 = func.call @stack_pop_pointer() : () -> i64
      %122 = func.call @stack_pop_pointer() : () -> i64
      %123 = func.call @cc_cons(%122, %121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%123) : (i64) -> ()
      %124 = func.call @stack_pop_pointer() : () -> i64
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = func.call @cc_cons(%125, %124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%126) : (i64) -> ()
      %127 = func.call @stack_pop_pointer() : () -> i64
      %146 = arith.constant 122791386939393 : i64
      %147 = arith.constant 0 : i64
      %148 = func.call @cc_make_closure(%146, %147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%148) : (i64) -> ()
      %149 = func.call @stack_pop_pointer() : () -> i64
      %150 = llvm.mlir.addressof @str13 : !llvm.ptr
      %151 = arith.constant 3 : i64
      %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%152) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %153 = func.call @stack_pop_pointer() : () -> i64
      %154 = func.call @stack_pop_pointer() : () -> i64
      %155 = func.call @cc_cons(%154, %153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%155) : (i64) -> ()
      %156 = func.call @stack_pop_pointer() : () -> i64
      %157 = llvm.mlir.addressof @str14 : !llvm.ptr
      %158 = arith.constant 11 : i64
      %159 = func.call @cc_make_string(%157, %158) : (!llvm.ptr, i64) -> i64
      %160 = llvm.mlir.addressof @str15 : !llvm.ptr
      %161 = arith.constant 7 : i64
      %162 = func.call @cc_make_string(%160, %161) : (!llvm.ptr, i64) -> i64
      %163 = func.call @cc_intern(%159, %162) : (i64, i64) -> i64
      %164 = func.call @cc_nil_value() : () -> i64
      %165 = func.call @cc_cons(%163, %164) : (i64, i64) -> i64
      %166 = func.call @cc_values_pack(%165) : (i64) -> i64
      func.call @stack_push_pointer(%163) : (i64) -> ()
      %167 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = llvm.mlir.addressof @str16 : !llvm.ptr
      %170 = arith.constant 4 : i64
      %171 = func.call @cc_make_string(%169, %170) : (!llvm.ptr, i64) -> i64
      %172 = llvm.mlir.addressof @str17 : !llvm.ptr
      %173 = arith.constant 7 : i64
      %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
      %175 = func.call @cc_intern(%171, %174) : (i64, i64) -> i64
      %176 = func.call @cc_nil_value() : () -> i64
      %177 = func.call @cc_cons(%175, %176) : (i64, i64) -> i64
      %178 = func.call @cc_values_pack(%177) : (i64) -> i64
      func.call @stack_push_pointer(%175) : (i64) -> ()
      %179 = func.call @stack_pop_pointer() : () -> i64
      %180 = llvm.mlir.addressof @str18 : !llvm.ptr
      %181 = arith.constant 7 : i64
      %182 = func.call @cc_make_string(%180, %181) : (!llvm.ptr, i64) -> i64
      %183 = llvm.mlir.addressof @str19 : !llvm.ptr
      %184 = arith.constant 11 : i64
      %185 = func.call @cc_make_string(%183, %184) : (!llvm.ptr, i64) -> i64
      %186 = func.call @cc_intern(%182, %185) : (i64, i64) -> i64
      %187 = func.call @cc_nil_value() : () -> i64
      %188 = func.call @cc_cons(%186, %187) : (i64, i64) -> i64
      %189 = func.call @cc_values_pack(%188) : (i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      %190 = func.call @stack_pop_pointer() : () -> i64
      %191 = func.call @cc_nil_value() : () -> i64
      %192 = func.call @cc_errorp(%65) : (i64) -> i64
      %193 = arith.cmpi ne, %192, %191 : i64
      %194 = arith.cmpi eq, %191, %191 : i64
      %195 = arith.andi %193, %194 : i1
      %196 = scf.if %195 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %191 : i64
      }
      %197 = func.call @cc_errorp(%127) : (i64) -> i64
      %198 = arith.cmpi ne, %197, %191 : i64
      %199 = arith.cmpi eq, %196, %191 : i64
      %200 = arith.andi %198, %199 : i1
      %201 = scf.if %200 -> (i64) {
        scf.yield %127 : i64
      } else {
        scf.yield %196 : i64
      }
      %202 = func.call @cc_errorp(%149) : (i64) -> i64
      %203 = arith.cmpi ne, %202, %191 : i64
      %204 = arith.cmpi eq, %201, %191 : i64
      %205 = arith.andi %203, %204 : i1
      %206 = scf.if %205 -> (i64) {
        scf.yield %149 : i64
      } else {
        scf.yield %201 : i64
      }
      %207 = func.call @cc_errorp(%156) : (i64) -> i64
      %208 = arith.cmpi ne, %207, %191 : i64
      %209 = arith.cmpi eq, %206, %191 : i64
      %210 = arith.andi %208, %209 : i1
      %211 = scf.if %210 -> (i64) {
        scf.yield %156 : i64
      } else {
        scf.yield %206 : i64
      }
      %212 = func.call @cc_errorp(%167) : (i64) -> i64
      %213 = arith.cmpi ne, %212, %191 : i64
      %214 = arith.cmpi eq, %211, %191 : i64
      %215 = arith.andi %213, %214 : i1
      %216 = scf.if %215 -> (i64) {
        scf.yield %167 : i64
      } else {
        scf.yield %211 : i64
      }
      %217 = func.call @cc_errorp(%168) : (i64) -> i64
      %218 = arith.cmpi ne, %217, %191 : i64
      %219 = arith.cmpi eq, %216, %191 : i64
      %220 = arith.andi %218, %219 : i1
      %221 = scf.if %220 -> (i64) {
        scf.yield %168 : i64
      } else {
        scf.yield %216 : i64
      }
      %222 = func.call @cc_errorp(%179) : (i64) -> i64
      %223 = arith.cmpi ne, %222, %191 : i64
      %224 = arith.cmpi eq, %221, %191 : i64
      %225 = arith.andi %223, %224 : i1
      %226 = scf.if %225 -> (i64) {
        scf.yield %179 : i64
      } else {
        scf.yield %221 : i64
      }
      %227 = func.call @cc_errorp(%190) : (i64) -> i64
      %228 = arith.cmpi ne, %227, %191 : i64
      %229 = arith.cmpi eq, %226, %191 : i64
      %230 = arith.andi %228, %229 : i1
      %231 = scf.if %230 -> (i64) {
        scf.yield %190 : i64
      } else {
        scf.yield %226 : i64
      }
      %232 = arith.cmpi ne, %231, %191 : i64
      scf.if %232 {
        func.call @stack_push_pointer(%231) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%127) : (i64) -> ()
        func.call @stack_push_pointer(%149) : (i64) -> ()
        func.call @stack_push_pointer(%156) : (i64) -> ()
        func.call @stack_push_pointer(%167) : (i64) -> ()
        func.call @stack_push_pointer(%168) : (i64) -> ()
        func.call @stack_push_pointer(%179) : (i64) -> ()
        func.call @stack_push_pointer(%190) : (i64) -> ()
        %233 = llvm.mlir.addressof @str20 : !llvm.ptr
        %234 = func.call @cc_make_function_ref_const(%233) : (!llvm.ptr) -> i64
        %235 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%234, %235) : (i64, i64) -> ()
      }
      %236 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %236 : i64
    }
    %237 = func.call @cc_nil_value() : () -> i64
    %238 = func.call @cc_errorp(%56) : (i64) -> i64
    %239 = arith.cmpi ne, %238, %237 : i64
    %240 = scf.if %239 -> (i64) {
      scf.yield %56 : i64
    } else {
      %241 = llvm.mlir.addressof @str21 : !llvm.ptr
      %242 = arith.constant 10 : i64
      %243 = func.call @cc_make_string(%241, %242) : (!llvm.ptr, i64) -> i64
      %244 = func.call @cc_nil_value() : () -> i64
      %245 = func.call @cc_intern(%243, %244) : (i64, i64) -> i64
      %246 = func.call @cc_nil_value() : () -> i64
      %247 = func.call @cc_cons(%245, %246) : (i64, i64) -> i64
      %248 = func.call @cc_values_pack(%247) : (i64) -> i64
      func.call @stack_push_pointer(%245) : (i64) -> ()
      %249 = func.call @stack_pop_pointer() : () -> i64
      %250 = llvm.mlir.addressof @str22 : !llvm.ptr
      %251 = arith.constant 13 : i64
      %252 = func.call @cc_make_string(%250, %251) : (!llvm.ptr, i64) -> i64
      %253 = llvm.mlir.addressof @str23 : !llvm.ptr
      %254 = arith.constant 11 : i64
      %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
      %256 = func.call @cc_intern(%252, %255) : (i64, i64) -> i64
      %257 = func.call @cc_nil_value() : () -> i64
      %258 = func.call @cc_cons(%256, %257) : (i64, i64) -> i64
      %259 = func.call @cc_values_pack(%258) : (i64) -> i64
      func.call @stack_push_pointer(%256) : (i64) -> ()
      %260 = llvm.mlir.addressof @str24 : !llvm.ptr
      %261 = arith.constant 6 : i64
      %262 = func.call @cc_make_string(%260, %261) : (!llvm.ptr, i64) -> i64
      %263 = func.call @cc_nil_value() : () -> i64
      %264 = func.call @cc_intern(%262, %263) : (i64, i64) -> i64
      %265 = func.call @cc_nil_value() : () -> i64
      %266 = func.call @cc_cons(%264, %265) : (i64, i64) -> i64
      %267 = func.call @cc_values_pack(%266) : (i64) -> i64
      func.call @stack_push_pointer(%264) : (i64) -> ()
      %268 = llvm.mlir.addressof @str25 : !llvm.ptr
      %269 = arith.constant 19 : i64
      %270 = func.call @cc_make_string(%268, %269) : (!llvm.ptr, i64) -> i64
      %271 = func.call @cc_nil_value() : () -> i64
      %272 = func.call @cc_intern(%270, %271) : (i64, i64) -> i64
      %273 = func.call @cc_nil_value() : () -> i64
      %274 = func.call @cc_cons(%272, %273) : (i64, i64) -> i64
      %275 = func.call @cc_values_pack(%274) : (i64) -> i64
      func.call @stack_push_pointer(%272) : (i64) -> ()
      %276 = llvm.mlir.addressof @str26 : !llvm.ptr
      %277 = arith.constant 6 : i64
      %278 = func.call @cc_make_string(%276, %277) : (!llvm.ptr, i64) -> i64
      %279 = llvm.mlir.addressof @str27 : !llvm.ptr
      %280 = arith.constant 11 : i64
      %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
      %282 = func.call @cc_intern(%278, %281) : (i64, i64) -> i64
      %283 = func.call @cc_nil_value() : () -> i64
      %284 = func.call @cc_cons(%282, %283) : (i64, i64) -> i64
      %285 = func.call @cc_values_pack(%284) : (i64) -> i64
      func.call @stack_push_pointer(%282) : (i64) -> ()
      %286 = llvm.mlir.addressof @str28 : !llvm.ptr
      %287 = arith.constant 3 : i64
      %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%288) : (i64) -> ()
      %289 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%289) : (i64) -> ()
      %290 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%290) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %291 = func.call @stack_pop_pointer() : () -> i64
      %292 = func.call @stack_pop_pointer() : () -> i64
      %293 = func.call @cc_cons(%292, %291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%293) : (i64) -> ()
      %294 = func.call @stack_pop_pointer() : () -> i64
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @cc_cons(%295, %294) : (i64, i64) -> i64
      func.call @stack_push_pointer(%296) : (i64) -> ()
      %297 = func.call @stack_pop_pointer() : () -> i64
      %298 = func.call @stack_pop_pointer() : () -> i64
      %299 = func.call @cc_cons(%298, %297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%299) : (i64) -> ()
      %300 = func.call @stack_pop_pointer() : () -> i64
      %301 = func.call @stack_pop_pointer() : () -> i64
      %302 = func.call @cc_cons(%301, %300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%302) : (i64) -> ()
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
      %377 = arith.constant 122791386939394 : i64
      %378 = arith.constant 0 : i64
      %379 = func.call @cc_make_closure(%377, %378) : (i64, i64) -> i64
      func.call @stack_push_pointer(%379) : (i64) -> ()
      %380 = func.call @stack_pop_pointer() : () -> i64
      %381 = llvm.mlir.addressof @str30 : !llvm.ptr
      %382 = arith.constant 4 : i64
      %383 = func.call @cc_make_string(%381, %382) : (!llvm.ptr, i64) -> i64
      %384 = func.call @cc_nil_value() : () -> i64
      %385 = func.call @cc_intern(%383, %384) : (i64, i64) -> i64
      %386 = func.call @cc_nil_value() : () -> i64
      %387 = func.call @cc_cons(%385, %386) : (i64, i64) -> i64
      %388 = func.call @cc_values_pack(%387) : (i64) -> i64
      func.call @stack_push_pointer(%385) : (i64) -> ()
      %389 = llvm.mlir.addressof @str31 : !llvm.ptr
      %390 = arith.constant 5 : i64
      %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
      %392 = func.call @cc_nil_value() : () -> i64
      %393 = func.call @cc_intern(%391, %392) : (i64, i64) -> i64
      %394 = func.call @cc_nil_value() : () -> i64
      %395 = func.call @cc_cons(%393, %394) : (i64, i64) -> i64
      %396 = func.call @cc_values_pack(%395) : (i64) -> i64
      func.call @stack_push_pointer(%393) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %397 = func.call @stack_pop_pointer() : () -> i64
      %398 = func.call @stack_pop_pointer() : () -> i64
      %399 = func.call @cc_cons(%398, %397) : (i64, i64) -> i64
      func.call @stack_push_pointer(%399) : (i64) -> ()
      %400 = func.call @stack_pop_pointer() : () -> i64
      %401 = func.call @stack_pop_pointer() : () -> i64
      %402 = func.call @cc_cons(%401, %400) : (i64, i64) -> i64
      func.call @stack_push_pointer(%402) : (i64) -> ()
      %403 = func.call @stack_pop_pointer() : () -> i64
      %404 = llvm.mlir.addressof @str32 : !llvm.ptr
      %405 = arith.constant 11 : i64
      %406 = func.call @cc_make_string(%404, %405) : (!llvm.ptr, i64) -> i64
      %407 = llvm.mlir.addressof @str33 : !llvm.ptr
      %408 = arith.constant 7 : i64
      %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
      %410 = func.call @cc_intern(%406, %409) : (i64, i64) -> i64
      %411 = func.call @cc_nil_value() : () -> i64
      %412 = func.call @cc_cons(%410, %411) : (i64, i64) -> i64
      %413 = func.call @cc_values_pack(%412) : (i64) -> i64
      func.call @stack_push_pointer(%410) : (i64) -> ()
      %414 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %415 = func.call @stack_pop_pointer() : () -> i64
      %416 = llvm.mlir.addressof @str34 : !llvm.ptr
      %417 = arith.constant 4 : i64
      %418 = func.call @cc_make_string(%416, %417) : (!llvm.ptr, i64) -> i64
      %419 = llvm.mlir.addressof @str35 : !llvm.ptr
      %420 = arith.constant 7 : i64
      %421 = func.call @cc_make_string(%419, %420) : (!llvm.ptr, i64) -> i64
      %422 = func.call @cc_intern(%418, %421) : (i64, i64) -> i64
      %423 = func.call @cc_nil_value() : () -> i64
      %424 = func.call @cc_cons(%422, %423) : (i64, i64) -> i64
      %425 = func.call @cc_values_pack(%424) : (i64) -> i64
      func.call @stack_push_pointer(%422) : (i64) -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = llvm.mlir.addressof @str36 : !llvm.ptr
      %428 = arith.constant 5 : i64
      %429 = func.call @cc_make_string(%427, %428) : (!llvm.ptr, i64) -> i64
      %430 = func.call @cc_nil_value() : () -> i64
      %431 = func.call @cc_intern(%429, %430) : (i64, i64) -> i64
      %432 = func.call @cc_nil_value() : () -> i64
      %433 = func.call @cc_cons(%431, %432) : (i64, i64) -> i64
      %434 = func.call @cc_values_pack(%433) : (i64) -> i64
      func.call @stack_push_pointer(%431) : (i64) -> ()
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @cc_nil_value() : () -> i64
      %437 = func.call @cc_errorp(%249) : (i64) -> i64
      %438 = arith.cmpi ne, %437, %436 : i64
      %439 = arith.cmpi eq, %436, %436 : i64
      %440 = arith.andi %438, %439 : i1
      %441 = scf.if %440 -> (i64) {
        scf.yield %249 : i64
      } else {
        scf.yield %436 : i64
      }
      %442 = func.call @cc_errorp(%324) : (i64) -> i64
      %443 = arith.cmpi ne, %442, %436 : i64
      %444 = arith.cmpi eq, %441, %436 : i64
      %445 = arith.andi %443, %444 : i1
      %446 = scf.if %445 -> (i64) {
        scf.yield %324 : i64
      } else {
        scf.yield %441 : i64
      }
      %447 = func.call @cc_errorp(%380) : (i64) -> i64
      %448 = arith.cmpi ne, %447, %436 : i64
      %449 = arith.cmpi eq, %446, %436 : i64
      %450 = arith.andi %448, %449 : i1
      %451 = scf.if %450 -> (i64) {
        scf.yield %380 : i64
      } else {
        scf.yield %446 : i64
      }
      %452 = func.call @cc_errorp(%403) : (i64) -> i64
      %453 = arith.cmpi ne, %452, %436 : i64
      %454 = arith.cmpi eq, %451, %436 : i64
      %455 = arith.andi %453, %454 : i1
      %456 = scf.if %455 -> (i64) {
        scf.yield %403 : i64
      } else {
        scf.yield %451 : i64
      }
      %457 = func.call @cc_errorp(%414) : (i64) -> i64
      %458 = arith.cmpi ne, %457, %436 : i64
      %459 = arith.cmpi eq, %456, %436 : i64
      %460 = arith.andi %458, %459 : i1
      %461 = scf.if %460 -> (i64) {
        scf.yield %414 : i64
      } else {
        scf.yield %456 : i64
      }
      %462 = func.call @cc_errorp(%415) : (i64) -> i64
      %463 = arith.cmpi ne, %462, %436 : i64
      %464 = arith.cmpi eq, %461, %436 : i64
      %465 = arith.andi %463, %464 : i1
      %466 = scf.if %465 -> (i64) {
        scf.yield %415 : i64
      } else {
        scf.yield %461 : i64
      }
      %467 = func.call @cc_errorp(%426) : (i64) -> i64
      %468 = arith.cmpi ne, %467, %436 : i64
      %469 = arith.cmpi eq, %466, %436 : i64
      %470 = arith.andi %468, %469 : i1
      %471 = scf.if %470 -> (i64) {
        scf.yield %426 : i64
      } else {
        scf.yield %466 : i64
      }
      %472 = func.call @cc_errorp(%435) : (i64) -> i64
      %473 = arith.cmpi ne, %472, %436 : i64
      %474 = arith.cmpi eq, %471, %436 : i64
      %475 = arith.andi %473, %474 : i1
      %476 = scf.if %475 -> (i64) {
        scf.yield %435 : i64
      } else {
        scf.yield %471 : i64
      }
      %477 = arith.cmpi ne, %476, %436 : i64
      scf.if %477 {
        func.call @stack_push_pointer(%476) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%249) : (i64) -> ()
        func.call @stack_push_pointer(%324) : (i64) -> ()
        func.call @stack_push_pointer(%380) : (i64) -> ()
        func.call @stack_push_pointer(%403) : (i64) -> ()
        func.call @stack_push_pointer(%414) : (i64) -> ()
        func.call @stack_push_pointer(%415) : (i64) -> ()
        func.call @stack_push_pointer(%426) : (i64) -> ()
        func.call @stack_push_pointer(%435) : (i64) -> ()
        %478 = llvm.mlir.addressof @str37 : !llvm.ptr
        %479 = func.call @cc_make_function_ref_const(%478) : (!llvm.ptr) -> i64
        %480 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%479, %480) : (i64, i64) -> ()
      }
      %481 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %481 : i64
    }
    %482 = func.call @cc_nil_value() : () -> i64
    %483 = func.call @cc_errorp(%240) : (i64) -> i64
    %484 = arith.cmpi ne, %483, %482 : i64
    %485 = scf.if %484 -> (i64) {
      scf.yield %240 : i64
    } else {
      %486 = llvm.mlir.addressof @str38 : !llvm.ptr
      %487 = arith.constant 17 : i64
      %488 = func.call @cc_make_string(%486, %487) : (!llvm.ptr, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_intern(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_nil_value() : () -> i64
      %492 = func.call @cc_cons(%490, %491) : (i64, i64) -> i64
      %493 = func.call @cc_values_pack(%492) : (i64) -> i64
      func.call @stack_push_pointer(%490) : (i64) -> ()
      %494 = func.call @stack_pop_pointer() : () -> i64
      %495 = llvm.mlir.addressof @str39 : !llvm.ptr
      %496 = arith.constant 10 : i64
      %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
      %498 = llvm.mlir.addressof @str40 : !llvm.ptr
      %499 = arith.constant 11 : i64
      %500 = func.call @cc_make_string(%498, %499) : (!llvm.ptr, i64) -> i64
      %501 = func.call @cc_intern(%497, %500) : (i64, i64) -> i64
      %502 = func.call @cc_nil_value() : () -> i64
      %503 = func.call @cc_cons(%501, %502) : (i64, i64) -> i64
      %504 = func.call @cc_values_pack(%503) : (i64) -> i64
      func.call @stack_push_pointer(%501) : (i64) -> ()
      %505 = arith.constant 97 : i64
      %506 = func.call @cc_box_character(%505) : (i64) -> i64
      func.call @stack_push_pointer(%506) : (i64) -> ()
      %507 = arith.constant 0 : i64
      %508 = func.call @cc_box_character(%507) : (i64) -> i64
      func.call @stack_push_pointer(%508) : (i64) -> ()
      %509 = llvm.mlir.addressof @str41 : !llvm.ptr
      %510 = arith.constant 15 : i64
      %511 = func.call @cc_make_string(%509, %510) : (!llvm.ptr, i64) -> i64
      %512 = llvm.mlir.addressof @str42 : !llvm.ptr
      %513 = arith.constant 11 : i64
      %514 = func.call @cc_make_string(%512, %513) : (!llvm.ptr, i64) -> i64
      %515 = func.call @cc_intern(%511, %514) : (i64, i64) -> i64
      %516 = func.call @cc_nil_value() : () -> i64
      %517 = func.call @cc_cons(%515, %516) : (i64, i64) -> i64
      %518 = func.call @cc_values_pack(%517) : (i64) -> i64
      func.call @stack_push_pointer(%515) : (i64) -> ()
      %519 = llvm.mlir.addressof @str43 : !llvm.ptr
      %520 = arith.constant 11 : i64
      %521 = func.call @cc_make_string(%519, %520) : (!llvm.ptr, i64) -> i64
      %522 = llvm.mlir.addressof @str44 : !llvm.ptr
      %523 = arith.constant 11 : i64
      %524 = func.call @cc_make_string(%522, %523) : (!llvm.ptr, i64) -> i64
      %525 = func.call @cc_intern(%521, %524) : (i64, i64) -> i64
      %526 = func.call @cc_nil_value() : () -> i64
      %527 = func.call @cc_cons(%525, %526) : (i64, i64) -> i64
      %528 = func.call @cc_values_pack(%527) : (i64) -> i64
      func.call @stack_push_pointer(%525) : (i64) -> ()
      %529 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%529) : (i64) -> ()
      %530 = llvm.mlir.addressof @str45 : !llvm.ptr
      %531 = arith.constant 15 : i64
      %532 = func.call @cc_make_string(%530, %531) : (!llvm.ptr, i64) -> i64
      %533 = llvm.mlir.addressof @str46 : !llvm.ptr
      %534 = arith.constant 7 : i64
      %535 = func.call @cc_make_string(%533, %534) : (!llvm.ptr, i64) -> i64
      %536 = func.call @cc_intern(%532, %535) : (i64, i64) -> i64
      %537 = func.call @cc_nil_value() : () -> i64
      %538 = func.call @cc_cons(%536, %537) : (i64, i64) -> i64
      %539 = func.call @cc_values_pack(%538) : (i64) -> i64
      func.call @stack_push_pointer(%536) : (i64) -> ()
      %540 = arith.constant 0 : i64
      %541 = func.call @cc_box_character(%540) : (i64) -> i64
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
      func.call @stack_push_nil() : () -> ()
      %560 = func.call @stack_pop_pointer() : () -> i64
      %561 = func.call @stack_pop_pointer() : () -> i64
      %562 = func.call @cc_cons(%561, %560) : (i64, i64) -> i64
      func.call @stack_push_pointer(%562) : (i64) -> ()
      %563 = func.call @stack_pop_pointer() : () -> i64
      %564 = func.call @stack_pop_pointer() : () -> i64
      %565 = func.call @cc_cons(%564, %563) : (i64, i64) -> i64
      func.call @stack_push_pointer(%565) : (i64) -> ()
      %566 = func.call @stack_pop_pointer() : () -> i64
      %567 = func.call @stack_pop_pointer() : () -> i64
      %568 = func.call @cc_cons(%567, %566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%568) : (i64) -> ()
      %569 = func.call @stack_pop_pointer() : () -> i64
      %570 = func.call @stack_pop_pointer() : () -> i64
      %571 = func.call @cc_cons(%570, %569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%571) : (i64) -> ()
      %572 = func.call @stack_pop_pointer() : () -> i64
      %597 = arith.constant 122791386939395 : i64
      %598 = arith.constant 0 : i64
      %599 = func.call @cc_make_closure(%597, %598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%599) : (i64) -> ()
      %600 = func.call @stack_pop_pointer() : () -> i64
      %601 = llvm.mlir.addressof @str48 : !llvm.ptr
      %602 = arith.constant 5 : i64
      %603 = func.call @cc_make_string(%601, %602) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%603) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @stack_pop_pointer() : () -> i64
      %606 = func.call @cc_cons(%605, %604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%606) : (i64) -> ()
      %607 = func.call @stack_pop_pointer() : () -> i64
      %608 = llvm.mlir.addressof @str49 : !llvm.ptr
      %609 = arith.constant 11 : i64
      %610 = func.call @cc_make_string(%608, %609) : (!llvm.ptr, i64) -> i64
      %611 = llvm.mlir.addressof @str50 : !llvm.ptr
      %612 = arith.constant 7 : i64
      %613 = func.call @cc_make_string(%611, %612) : (!llvm.ptr, i64) -> i64
      %614 = func.call @cc_intern(%610, %613) : (i64, i64) -> i64
      %615 = func.call @cc_nil_value() : () -> i64
      %616 = func.call @cc_cons(%614, %615) : (i64, i64) -> i64
      %617 = func.call @cc_values_pack(%616) : (i64) -> i64
      func.call @stack_push_pointer(%614) : (i64) -> ()
      %618 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %619 = func.call @stack_pop_pointer() : () -> i64
      %620 = llvm.mlir.addressof @str51 : !llvm.ptr
      %621 = arith.constant 4 : i64
      %622 = func.call @cc_make_string(%620, %621) : (!llvm.ptr, i64) -> i64
      %623 = llvm.mlir.addressof @str52 : !llvm.ptr
      %624 = arith.constant 7 : i64
      %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
      %626 = func.call @cc_intern(%622, %625) : (i64, i64) -> i64
      %627 = func.call @cc_nil_value() : () -> i64
      %628 = func.call @cc_cons(%626, %627) : (i64, i64) -> i64
      %629 = func.call @cc_values_pack(%628) : (i64) -> i64
      func.call @stack_push_pointer(%626) : (i64) -> ()
      %630 = func.call @stack_pop_pointer() : () -> i64
      %631 = llvm.mlir.addressof @str53 : !llvm.ptr
      %632 = arith.constant 7 : i64
      %633 = func.call @cc_make_string(%631, %632) : (!llvm.ptr, i64) -> i64
      %634 = llvm.mlir.addressof @str54 : !llvm.ptr
      %635 = arith.constant 11 : i64
      %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
      %637 = func.call @cc_intern(%633, %636) : (i64, i64) -> i64
      %638 = func.call @cc_nil_value() : () -> i64
      %639 = func.call @cc_cons(%637, %638) : (i64, i64) -> i64
      %640 = func.call @cc_values_pack(%639) : (i64) -> i64
      func.call @stack_push_pointer(%637) : (i64) -> ()
      %641 = func.call @stack_pop_pointer() : () -> i64
      %642 = func.call @cc_nil_value() : () -> i64
      %643 = func.call @cc_errorp(%494) : (i64) -> i64
      %644 = arith.cmpi ne, %643, %642 : i64
      %645 = arith.cmpi eq, %642, %642 : i64
      %646 = arith.andi %644, %645 : i1
      %647 = scf.if %646 -> (i64) {
        scf.yield %494 : i64
      } else {
        scf.yield %642 : i64
      }
      %648 = func.call @cc_errorp(%572) : (i64) -> i64
      %649 = arith.cmpi ne, %648, %642 : i64
      %650 = arith.cmpi eq, %647, %642 : i64
      %651 = arith.andi %649, %650 : i1
      %652 = scf.if %651 -> (i64) {
        scf.yield %572 : i64
      } else {
        scf.yield %647 : i64
      }
      %653 = func.call @cc_errorp(%600) : (i64) -> i64
      %654 = arith.cmpi ne, %653, %642 : i64
      %655 = arith.cmpi eq, %652, %642 : i64
      %656 = arith.andi %654, %655 : i1
      %657 = scf.if %656 -> (i64) {
        scf.yield %600 : i64
      } else {
        scf.yield %652 : i64
      }
      %658 = func.call @cc_errorp(%607) : (i64) -> i64
      %659 = arith.cmpi ne, %658, %642 : i64
      %660 = arith.cmpi eq, %657, %642 : i64
      %661 = arith.andi %659, %660 : i1
      %662 = scf.if %661 -> (i64) {
        scf.yield %607 : i64
      } else {
        scf.yield %657 : i64
      }
      %663 = func.call @cc_errorp(%618) : (i64) -> i64
      %664 = arith.cmpi ne, %663, %642 : i64
      %665 = arith.cmpi eq, %662, %642 : i64
      %666 = arith.andi %664, %665 : i1
      %667 = scf.if %666 -> (i64) {
        scf.yield %618 : i64
      } else {
        scf.yield %662 : i64
      }
      %668 = func.call @cc_errorp(%619) : (i64) -> i64
      %669 = arith.cmpi ne, %668, %642 : i64
      %670 = arith.cmpi eq, %667, %642 : i64
      %671 = arith.andi %669, %670 : i1
      %672 = scf.if %671 -> (i64) {
        scf.yield %619 : i64
      } else {
        scf.yield %667 : i64
      }
      %673 = func.call @cc_errorp(%630) : (i64) -> i64
      %674 = arith.cmpi ne, %673, %642 : i64
      %675 = arith.cmpi eq, %672, %642 : i64
      %676 = arith.andi %674, %675 : i1
      %677 = scf.if %676 -> (i64) {
        scf.yield %630 : i64
      } else {
        scf.yield %672 : i64
      }
      %678 = func.call @cc_errorp(%641) : (i64) -> i64
      %679 = arith.cmpi ne, %678, %642 : i64
      %680 = arith.cmpi eq, %677, %642 : i64
      %681 = arith.andi %679, %680 : i1
      %682 = scf.if %681 -> (i64) {
        scf.yield %641 : i64
      } else {
        scf.yield %677 : i64
      }
      %683 = arith.cmpi ne, %682, %642 : i64
      scf.if %683 {
        func.call @stack_push_pointer(%682) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%494) : (i64) -> ()
        func.call @stack_push_pointer(%572) : (i64) -> ()
        func.call @stack_push_pointer(%600) : (i64) -> ()
        func.call @stack_push_pointer(%607) : (i64) -> ()
        func.call @stack_push_pointer(%618) : (i64) -> ()
        func.call @stack_push_pointer(%619) : (i64) -> ()
        func.call @stack_push_pointer(%630) : (i64) -> ()
        func.call @stack_push_pointer(%641) : (i64) -> ()
        %684 = llvm.mlir.addressof @str55 : !llvm.ptr
        %685 = func.call @cc_make_function_ref_const(%684) : (!llvm.ptr) -> i64
        %686 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%685, %686) : (i64, i64) -> ()
      }
      %687 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %687 : i64
    }
    %688 = func.call @cc_nil_value() : () -> i64
    %689 = func.call @cc_errorp(%485) : (i64) -> i64
    %690 = arith.cmpi ne, %689, %688 : i64
    %691 = scf.if %690 -> (i64) {
      scf.yield %485 : i64
    } else {
      %692 = llvm.mlir.addressof @str56 : !llvm.ptr
      %693 = arith.constant 17 : i64
      %694 = func.call @cc_make_string(%692, %693) : (!llvm.ptr, i64) -> i64
      %695 = func.call @cc_nil_value() : () -> i64
      %696 = func.call @cc_intern(%694, %695) : (i64, i64) -> i64
      %697 = func.call @cc_nil_value() : () -> i64
      %698 = func.call @cc_cons(%696, %697) : (i64, i64) -> i64
      %699 = func.call @cc_values_pack(%698) : (i64) -> i64
      func.call @stack_push_pointer(%696) : (i64) -> ()
      %700 = func.call @stack_pop_pointer() : () -> i64
      %701 = llvm.mlir.addressof @str57 : !llvm.ptr
      %702 = arith.constant 10 : i64
      %703 = func.call @cc_make_string(%701, %702) : (!llvm.ptr, i64) -> i64
      %704 = llvm.mlir.addressof @str58 : !llvm.ptr
      %705 = arith.constant 11 : i64
      %706 = func.call @cc_make_string(%704, %705) : (!llvm.ptr, i64) -> i64
      %707 = func.call @cc_intern(%703, %706) : (i64, i64) -> i64
      %708 = func.call @cc_nil_value() : () -> i64
      %709 = func.call @cc_cons(%707, %708) : (i64, i64) -> i64
      %710 = func.call @cc_values_pack(%709) : (i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %711 = arith.constant 88 : i64
      %712 = func.call @cc_box_character(%711) : (i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %713 = arith.constant 0 : i64
      %714 = func.call @cc_box_character(%713) : (i64) -> i64
      func.call @stack_push_pointer(%714) : (i64) -> ()
      %715 = llvm.mlir.addressof @str59 : !llvm.ptr
      %716 = arith.constant 21 : i64
      %717 = func.call @cc_make_string(%715, %716) : (!llvm.ptr, i64) -> i64
      %718 = llvm.mlir.addressof @str60 : !llvm.ptr
      %719 = arith.constant 11 : i64
      %720 = func.call @cc_make_string(%718, %719) : (!llvm.ptr, i64) -> i64
      %721 = func.call @cc_intern(%717, %720) : (i64, i64) -> i64
      %722 = func.call @cc_nil_value() : () -> i64
      %723 = func.call @cc_cons(%721, %722) : (i64, i64) -> i64
      %724 = func.call @cc_values_pack(%723) : (i64) -> i64
      func.call @stack_push_pointer(%721) : (i64) -> ()
      %725 = llvm.mlir.addressof @str61 : !llvm.ptr
      %726 = arith.constant 3 : i64
      %727 = func.call @cc_make_string(%725, %726) : (!llvm.ptr, i64) -> i64
      %728 = func.call @cc_nil_value() : () -> i64
      %729 = func.call @cc_intern(%727, %728) : (i64, i64) -> i64
      %730 = func.call @cc_nil_value() : () -> i64
      %731 = func.call @cc_cons(%729, %730) : (i64, i64) -> i64
      %732 = func.call @cc_values_pack(%731) : (i64) -> i64
      func.call @stack_push_pointer(%729) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %733 = func.call @stack_pop_pointer() : () -> i64
      %734 = func.call @stack_pop_pointer() : () -> i64
      %735 = func.call @cc_cons(%734, %733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%735) : (i64) -> ()
      %736 = llvm.mlir.addressof @str62 : !llvm.ptr
      %737 = arith.constant 10 : i64
      %738 = func.call @cc_make_string(%736, %737) : (!llvm.ptr, i64) -> i64
      %739 = llvm.mlir.addressof @str63 : !llvm.ptr
      %740 = arith.constant 11 : i64
      %741 = func.call @cc_make_string(%739, %740) : (!llvm.ptr, i64) -> i64
      %742 = func.call @cc_intern(%738, %741) : (i64, i64) -> i64
      %743 = func.call @cc_nil_value() : () -> i64
      %744 = func.call @cc_cons(%742, %743) : (i64, i64) -> i64
      %745 = func.call @cc_values_pack(%744) : (i64) -> i64
      func.call @stack_push_pointer(%742) : (i64) -> ()
      %746 = arith.constant 0 : i64
      %747 = func.call @cc_box_character(%746) : (i64) -> i64
      func.call @stack_push_pointer(%747) : (i64) -> ()
      %748 = llvm.mlir.addressof @str64 : !llvm.ptr
      %749 = arith.constant 3 : i64
      %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
      %751 = func.call @cc_nil_value() : () -> i64
      %752 = func.call @cc_intern(%750, %751) : (i64, i64) -> i64
      %753 = func.call @cc_nil_value() : () -> i64
      %754 = func.call @cc_cons(%752, %753) : (i64, i64) -> i64
      %755 = func.call @cc_values_pack(%754) : (i64) -> i64
      func.call @stack_push_pointer(%752) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %756 = func.call @stack_pop_pointer() : () -> i64
      %757 = func.call @stack_pop_pointer() : () -> i64
      %758 = func.call @cc_cons(%757, %756) : (i64, i64) -> i64
      func.call @stack_push_pointer(%758) : (i64) -> ()
      %759 = func.call @stack_pop_pointer() : () -> i64
      %760 = func.call @stack_pop_pointer() : () -> i64
      %761 = func.call @cc_cons(%760, %759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%761) : (i64) -> ()
      %762 = func.call @stack_pop_pointer() : () -> i64
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = func.call @cc_cons(%763, %762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%764) : (i64) -> ()
      %765 = llvm.mlir.addressof @str65 : !llvm.ptr
      %766 = arith.constant 5 : i64
      %767 = func.call @cc_make_string(%765, %766) : (!llvm.ptr, i64) -> i64
      %768 = llvm.mlir.addressof @str66 : !llvm.ptr
      %769 = arith.constant 11 : i64
      %770 = func.call @cc_make_string(%768, %769) : (!llvm.ptr, i64) -> i64
      %771 = func.call @cc_intern(%767, %770) : (i64, i64) -> i64
      %772 = func.call @cc_nil_value() : () -> i64
      %773 = func.call @cc_cons(%771, %772) : (i64, i64) -> i64
      %774 = func.call @cc_values_pack(%773) : (i64) -> i64
      func.call @stack_push_pointer(%771) : (i64) -> ()
      %775 = llvm.mlir.addressof @str67 : !llvm.ptr
      %776 = arith.constant 3 : i64
      %777 = func.call @cc_make_string(%775, %776) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      %778 = llvm.mlir.addressof @str68 : !llvm.ptr
      %779 = arith.constant 3 : i64
      %780 = func.call @cc_make_string(%778, %779) : (!llvm.ptr, i64) -> i64
      %781 = func.call @cc_nil_value() : () -> i64
      %782 = func.call @cc_intern(%780, %781) : (i64, i64) -> i64
      %783 = func.call @cc_nil_value() : () -> i64
      %784 = func.call @cc_cons(%782, %783) : (i64, i64) -> i64
      %785 = func.call @cc_values_pack(%784) : (i64) -> i64
      func.call @stack_push_pointer(%782) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %786 = func.call @stack_pop_pointer() : () -> i64
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = func.call @cc_cons(%787, %786) : (i64, i64) -> i64
      func.call @stack_push_pointer(%788) : (i64) -> ()
      %789 = func.call @stack_pop_pointer() : () -> i64
      %790 = func.call @stack_pop_pointer() : () -> i64
      %791 = func.call @cc_cons(%790, %789) : (i64, i64) -> i64
      func.call @stack_push_pointer(%791) : (i64) -> ()
      %792 = func.call @stack_pop_pointer() : () -> i64
      %793 = func.call @stack_pop_pointer() : () -> i64
      %794 = func.call @cc_cons(%793, %792) : (i64, i64) -> i64
      func.call @stack_push_pointer(%794) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %795 = func.call @stack_pop_pointer() : () -> i64
      %796 = func.call @stack_pop_pointer() : () -> i64
      %797 = func.call @cc_cons(%796, %795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%797) : (i64) -> ()
      %798 = func.call @stack_pop_pointer() : () -> i64
      %799 = func.call @stack_pop_pointer() : () -> i64
      %800 = func.call @cc_cons(%799, %798) : (i64, i64) -> i64
      func.call @stack_push_pointer(%800) : (i64) -> ()
      %801 = func.call @stack_pop_pointer() : () -> i64
      %802 = func.call @stack_pop_pointer() : () -> i64
      %803 = func.call @cc_cons(%802, %801) : (i64, i64) -> i64
      func.call @stack_push_pointer(%803) : (i64) -> ()
      %804 = func.call @stack_pop_pointer() : () -> i64
      %805 = func.call @stack_pop_pointer() : () -> i64
      %806 = func.call @cc_cons(%805, %804) : (i64, i64) -> i64
      func.call @stack_push_pointer(%806) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %807 = func.call @stack_pop_pointer() : () -> i64
      %808 = func.call @stack_pop_pointer() : () -> i64
      %809 = func.call @cc_cons(%808, %807) : (i64, i64) -> i64
      func.call @stack_push_pointer(%809) : (i64) -> ()
      %810 = func.call @stack_pop_pointer() : () -> i64
      %811 = func.call @stack_pop_pointer() : () -> i64
      %812 = func.call @cc_cons(%811, %810) : (i64, i64) -> i64
      func.call @stack_push_pointer(%812) : (i64) -> ()
      %813 = func.call @stack_pop_pointer() : () -> i64
      %814 = func.call @stack_pop_pointer() : () -> i64
      %815 = func.call @cc_cons(%814, %813) : (i64, i64) -> i64
      func.call @stack_push_pointer(%815) : (i64) -> ()
      %816 = func.call @stack_pop_pointer() : () -> i64
      %817 = func.call @stack_pop_pointer() : () -> i64
      %818 = func.call @cc_cons(%817, %816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%818) : (i64) -> ()
      %819 = func.call @stack_pop_pointer() : () -> i64
      %885 = arith.constant 122791386939396 : i64
      %886 = arith.constant 0 : i64
      %887 = func.call @cc_make_closure(%885, %886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%887) : (i64) -> ()
      %888 = func.call @stack_pop_pointer() : () -> i64
      %889 = llvm.mlir.addressof @str72 : !llvm.ptr
      %890 = arith.constant 4 : i64
      %891 = func.call @cc_make_string(%889, %890) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%891) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @cc_cons(%893, %892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%894) : (i64) -> ()
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = llvm.mlir.addressof @str73 : !llvm.ptr
      %897 = arith.constant 11 : i64
      %898 = func.call @cc_make_string(%896, %897) : (!llvm.ptr, i64) -> i64
      %899 = llvm.mlir.addressof @str74 : !llvm.ptr
      %900 = arith.constant 7 : i64
      %901 = func.call @cc_make_string(%899, %900) : (!llvm.ptr, i64) -> i64
      %902 = func.call @cc_intern(%898, %901) : (i64, i64) -> i64
      %903 = func.call @cc_nil_value() : () -> i64
      %904 = func.call @cc_cons(%902, %903) : (i64, i64) -> i64
      %905 = func.call @cc_values_pack(%904) : (i64) -> i64
      func.call @stack_push_pointer(%902) : (i64) -> ()
      %906 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %907 = func.call @stack_pop_pointer() : () -> i64
      %908 = llvm.mlir.addressof @str75 : !llvm.ptr
      %909 = arith.constant 4 : i64
      %910 = func.call @cc_make_string(%908, %909) : (!llvm.ptr, i64) -> i64
      %911 = llvm.mlir.addressof @str76 : !llvm.ptr
      %912 = arith.constant 7 : i64
      %913 = func.call @cc_make_string(%911, %912) : (!llvm.ptr, i64) -> i64
      %914 = func.call @cc_intern(%910, %913) : (i64, i64) -> i64
      %915 = func.call @cc_nil_value() : () -> i64
      %916 = func.call @cc_cons(%914, %915) : (i64, i64) -> i64
      %917 = func.call @cc_values_pack(%916) : (i64) -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
      %918 = func.call @stack_pop_pointer() : () -> i64
      %919 = llvm.mlir.addressof @str77 : !llvm.ptr
      %920 = arith.constant 7 : i64
      %921 = func.call @cc_make_string(%919, %920) : (!llvm.ptr, i64) -> i64
      %922 = llvm.mlir.addressof @str78 : !llvm.ptr
      %923 = arith.constant 11 : i64
      %924 = func.call @cc_make_string(%922, %923) : (!llvm.ptr, i64) -> i64
      %925 = func.call @cc_intern(%921, %924) : (i64, i64) -> i64
      %926 = func.call @cc_nil_value() : () -> i64
      %927 = func.call @cc_cons(%925, %926) : (i64, i64) -> i64
      %928 = func.call @cc_values_pack(%927) : (i64) -> i64
      func.call @stack_push_pointer(%925) : (i64) -> ()
      %929 = func.call @stack_pop_pointer() : () -> i64
      %930 = func.call @cc_nil_value() : () -> i64
      %931 = func.call @cc_errorp(%700) : (i64) -> i64
      %932 = arith.cmpi ne, %931, %930 : i64
      %933 = arith.cmpi eq, %930, %930 : i64
      %934 = arith.andi %932, %933 : i1
      %935 = scf.if %934 -> (i64) {
        scf.yield %700 : i64
      } else {
        scf.yield %930 : i64
      }
      %936 = func.call @cc_errorp(%819) : (i64) -> i64
      %937 = arith.cmpi ne, %936, %930 : i64
      %938 = arith.cmpi eq, %935, %930 : i64
      %939 = arith.andi %937, %938 : i1
      %940 = scf.if %939 -> (i64) {
        scf.yield %819 : i64
      } else {
        scf.yield %935 : i64
      }
      %941 = func.call @cc_errorp(%888) : (i64) -> i64
      %942 = arith.cmpi ne, %941, %930 : i64
      %943 = arith.cmpi eq, %940, %930 : i64
      %944 = arith.andi %942, %943 : i1
      %945 = scf.if %944 -> (i64) {
        scf.yield %888 : i64
      } else {
        scf.yield %940 : i64
      }
      %946 = func.call @cc_errorp(%895) : (i64) -> i64
      %947 = arith.cmpi ne, %946, %930 : i64
      %948 = arith.cmpi eq, %945, %930 : i64
      %949 = arith.andi %947, %948 : i1
      %950 = scf.if %949 -> (i64) {
        scf.yield %895 : i64
      } else {
        scf.yield %945 : i64
      }
      %951 = func.call @cc_errorp(%906) : (i64) -> i64
      %952 = arith.cmpi ne, %951, %930 : i64
      %953 = arith.cmpi eq, %950, %930 : i64
      %954 = arith.andi %952, %953 : i1
      %955 = scf.if %954 -> (i64) {
        scf.yield %906 : i64
      } else {
        scf.yield %950 : i64
      }
      %956 = func.call @cc_errorp(%907) : (i64) -> i64
      %957 = arith.cmpi ne, %956, %930 : i64
      %958 = arith.cmpi eq, %955, %930 : i64
      %959 = arith.andi %957, %958 : i1
      %960 = scf.if %959 -> (i64) {
        scf.yield %907 : i64
      } else {
        scf.yield %955 : i64
      }
      %961 = func.call @cc_errorp(%918) : (i64) -> i64
      %962 = arith.cmpi ne, %961, %930 : i64
      %963 = arith.cmpi eq, %960, %930 : i64
      %964 = arith.andi %962, %963 : i1
      %965 = scf.if %964 -> (i64) {
        scf.yield %918 : i64
      } else {
        scf.yield %960 : i64
      }
      %966 = func.call @cc_errorp(%929) : (i64) -> i64
      %967 = arith.cmpi ne, %966, %930 : i64
      %968 = arith.cmpi eq, %965, %930 : i64
      %969 = arith.andi %967, %968 : i1
      %970 = scf.if %969 -> (i64) {
        scf.yield %929 : i64
      } else {
        scf.yield %965 : i64
      }
      %971 = arith.cmpi ne, %970, %930 : i64
      scf.if %971 {
        func.call @stack_push_pointer(%970) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%700) : (i64) -> ()
        func.call @stack_push_pointer(%819) : (i64) -> ()
        func.call @stack_push_pointer(%888) : (i64) -> ()
        func.call @stack_push_pointer(%895) : (i64) -> ()
        func.call @stack_push_pointer(%906) : (i64) -> ()
        func.call @stack_push_pointer(%907) : (i64) -> ()
        func.call @stack_push_pointer(%918) : (i64) -> ()
        func.call @stack_push_pointer(%929) : (i64) -> ()
        %972 = llvm.mlir.addressof @str79 : !llvm.ptr
        %973 = func.call @cc_make_function_ref_const(%972) : (!llvm.ptr) -> i64
        %974 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%973, %974) : (i64, i64) -> ()
      }
      %975 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %975 : i64
    }
    %976 = func.call @cc_nil_value() : () -> i64
    %977 = func.call @cc_errorp(%691) : (i64) -> i64
    %978 = arith.cmpi ne, %977, %976 : i64
    %979 = scf.if %978 -> (i64) {
      scf.yield %691 : i64
    } else {
      %980 = llvm.mlir.addressof @str80 : !llvm.ptr
      %981 = arith.constant 21 : i64
      %982 = func.call @cc_make_string(%980, %981) : (!llvm.ptr, i64) -> i64
      %983 = func.call @cc_nil_value() : () -> i64
      %984 = func.call @cc_intern(%982, %983) : (i64, i64) -> i64
      %985 = func.call @cc_nil_value() : () -> i64
      %986 = func.call @cc_cons(%984, %985) : (i64, i64) -> i64
      %987 = func.call @cc_values_pack(%986) : (i64) -> i64
      func.call @stack_push_pointer(%984) : (i64) -> ()
      %988 = func.call @stack_pop_pointer() : () -> i64
      %989 = llvm.mlir.addressof @str81 : !llvm.ptr
      %990 = arith.constant 3 : i64
      %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
      %992 = func.call @cc_nil_value() : () -> i64
      %993 = func.call @cc_intern(%991, %992) : (i64, i64) -> i64
      %994 = func.call @cc_nil_value() : () -> i64
      %995 = func.call @cc_cons(%993, %994) : (i64, i64) -> i64
      %996 = func.call @cc_values_pack(%995) : (i64) -> i64
      func.call @stack_push_pointer(%993) : (i64) -> ()
      %997 = llvm.mlir.addressof @str82 : !llvm.ptr
      %998 = arith.constant 3 : i64
      %999 = func.call @cc_make_string(%997, %998) : (!llvm.ptr, i64) -> i64
      %1000 = func.call @cc_nil_value() : () -> i64
      %1001 = func.call @cc_intern(%999, %1000) : (i64, i64) -> i64
      %1002 = func.call @cc_nil_value() : () -> i64
      %1003 = func.call @cc_cons(%1001, %1002) : (i64, i64) -> i64
      %1004 = func.call @cc_values_pack(%1003) : (i64) -> i64
      func.call @stack_push_pointer(%1001) : (i64) -> ()
      %1005 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1006 = arith.constant 11 : i64
      %1007 = func.call @cc_make_string(%1005, %1006) : (!llvm.ptr, i64) -> i64
      %1008 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1009 = arith.constant 11 : i64
      %1010 = func.call @cc_make_string(%1008, %1009) : (!llvm.ptr, i64) -> i64
      %1011 = func.call @cc_intern(%1007, %1010) : (i64, i64) -> i64
      %1012 = func.call @cc_nil_value() : () -> i64
      %1013 = func.call @cc_cons(%1011, %1012) : (i64, i64) -> i64
      %1014 = func.call @cc_values_pack(%1013) : (i64) -> i64
      func.call @stack_push_pointer(%1011) : (i64) -> ()
      %1015 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1015) : (i64) -> ()
      %1016 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1017 = arith.constant 6 : i64
      %1018 = func.call @cc_make_string(%1016, %1017) : (!llvm.ptr, i64) -> i64
      %1019 = llvm.mlir.addressof @str86 : !llvm.ptr
      %1020 = arith.constant 11 : i64
      %1021 = func.call @cc_make_string(%1019, %1020) : (!llvm.ptr, i64) -> i64
      %1022 = func.call @cc_intern(%1018, %1021) : (i64, i64) -> i64
      %1023 = func.call @cc_nil_value() : () -> i64
      %1024 = func.call @cc_cons(%1022, %1023) : (i64, i64) -> i64
      %1025 = func.call @cc_values_pack(%1024) : (i64) -> i64
      func.call @stack_push_pointer(%1022) : (i64) -> ()
      %1026 = func.call @stack_pop_pointer() : () -> i64
      %1027 = func.call @stack_pop_pointer() : () -> i64
      %1028 = func.call @cc_cons(%1026, %1027) : (i64, i64) -> i64
      %1029 = llvm.mlir.addressof @str87 : !llvm.ptr
      %1030 = arith.constant 5 : i64
      %1031 = func.call @cc_make_string(%1029, %1030) : (!llvm.ptr, i64) -> i64
      %1032 = func.call @cc_nil_value() : () -> i64
      %1033 = func.call @cc_intern(%1031, %1032) : (i64, i64) -> i64
      %1034 = func.call @cc_nil_value() : () -> i64
      %1035 = func.call @cc_cons(%1033, %1034) : (i64, i64) -> i64
      %1036 = func.call @cc_values_pack(%1035) : (i64) -> i64
      %1037 = func.call @cc_cons(%1033, %1028) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1037) : (i64) -> ()
      %1038 = llvm.mlir.addressof @str88 : !llvm.ptr
      %1039 = arith.constant 11 : i64
      %1040 = func.call @cc_make_string(%1038, %1039) : (!llvm.ptr, i64) -> i64
      %1041 = llvm.mlir.addressof @str89 : !llvm.ptr
      %1042 = arith.constant 11 : i64
      %1043 = func.call @cc_make_string(%1041, %1042) : (!llvm.ptr, i64) -> i64
      %1044 = func.call @cc_intern(%1040, %1043) : (i64, i64) -> i64
      %1045 = func.call @cc_nil_value() : () -> i64
      %1046 = func.call @cc_cons(%1044, %1045) : (i64, i64) -> i64
      %1047 = func.call @cc_values_pack(%1046) : (i64) -> i64
      func.call @stack_push_pointer(%1044) : (i64) -> ()
      %1048 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1048) : (i64) -> ()
      %1049 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1050 = arith.constant 15 : i64
      %1051 = func.call @cc_make_string(%1049, %1050) : (!llvm.ptr, i64) -> i64
      %1052 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1053 = arith.constant 7 : i64
      %1054 = func.call @cc_make_string(%1052, %1053) : (!llvm.ptr, i64) -> i64
      %1055 = func.call @cc_intern(%1051, %1054) : (i64, i64) -> i64
      %1056 = func.call @cc_nil_value() : () -> i64
      %1057 = func.call @cc_cons(%1055, %1056) : (i64, i64) -> i64
      %1058 = func.call @cc_values_pack(%1057) : (i64) -> i64
      func.call @stack_push_pointer(%1055) : (i64) -> ()
      %1059 = arith.constant 0 : i64
      %1060 = func.call @cc_box_character(%1059) : (i64) -> i64
      func.call @stack_push_pointer(%1060) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1061 = func.call @stack_pop_pointer() : () -> i64
      %1062 = func.call @stack_pop_pointer() : () -> i64
      %1063 = func.call @cc_cons(%1062, %1061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1063) : (i64) -> ()
      %1064 = func.call @stack_pop_pointer() : () -> i64
      %1065 = func.call @stack_pop_pointer() : () -> i64
      %1066 = func.call @cc_cons(%1065, %1064) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1066) : (i64) -> ()
      %1067 = func.call @stack_pop_pointer() : () -> i64
      %1068 = func.call @stack_pop_pointer() : () -> i64
      %1069 = func.call @cc_cons(%1068, %1067) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1069) : (i64) -> ()
      %1070 = func.call @stack_pop_pointer() : () -> i64
      %1071 = func.call @stack_pop_pointer() : () -> i64
      %1072 = func.call @cc_cons(%1071, %1070) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1072) : (i64) -> ()
      %1073 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1074 = arith.constant 3 : i64
      %1075 = func.call @cc_make_string(%1073, %1074) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1075) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1076 = func.call @stack_pop_pointer() : () -> i64
      %1077 = func.call @stack_pop_pointer() : () -> i64
      %1078 = func.call @cc_cons(%1077, %1076) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1078) : (i64) -> ()
      %1079 = func.call @stack_pop_pointer() : () -> i64
      %1080 = func.call @stack_pop_pointer() : () -> i64
      %1081 = func.call @cc_cons(%1080, %1079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1082 = func.call @stack_pop_pointer() : () -> i64
      %1083 = func.call @stack_pop_pointer() : () -> i64
      %1084 = func.call @cc_cons(%1083, %1082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1084) : (i64) -> ()
      %1085 = func.call @stack_pop_pointer() : () -> i64
      %1086 = func.call @stack_pop_pointer() : () -> i64
      %1087 = func.call @cc_cons(%1086, %1085) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1087) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1088 = func.call @stack_pop_pointer() : () -> i64
      %1089 = func.call @stack_pop_pointer() : () -> i64
      %1090 = func.call @cc_cons(%1089, %1088) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1090) : (i64) -> ()
      %1091 = func.call @stack_pop_pointer() : () -> i64
      %1092 = func.call @stack_pop_pointer() : () -> i64
      %1093 = func.call @cc_cons(%1092, %1091) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1093) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1094 = func.call @stack_pop_pointer() : () -> i64
      %1095 = func.call @stack_pop_pointer() : () -> i64
      %1096 = func.call @cc_cons(%1095, %1094) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1096) : (i64) -> ()
      %1097 = func.call @stack_pop_pointer() : () -> i64
      %1098 = func.call @stack_pop_pointer() : () -> i64
      %1099 = func.call @cc_cons(%1098, %1097) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1099) : (i64) -> ()
      %1100 = func.call @stack_pop_pointer() : () -> i64
      %1141 = arith.constant 122791386939397 : i64
      %1142 = arith.constant 0 : i64
      %1143 = func.call @cc_make_closure(%1141, %1142) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1143) : (i64) -> ()
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1146 = arith.constant 1 : i64
      %1147 = func.call @cc_make_string(%1145, %1146) : (!llvm.ptr, i64) -> i64
      %1148 = func.call @cc_nil_value() : () -> i64
      %1149 = func.call @cc_intern(%1147, %1148) : (i64, i64) -> i64
      %1150 = func.call @cc_nil_value() : () -> i64
      %1151 = func.call @cc_cons(%1149, %1150) : (i64, i64) -> i64
      %1152 = func.call @cc_values_pack(%1151) : (i64) -> i64
      func.call @stack_push_pointer(%1149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @cc_cons(%1154, %1153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1155) : (i64) -> ()
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1158 = arith.constant 11 : i64
      %1159 = func.call @cc_make_string(%1157, %1158) : (!llvm.ptr, i64) -> i64
      %1160 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1161 = arith.constant 7 : i64
      %1162 = func.call @cc_make_string(%1160, %1161) : (!llvm.ptr, i64) -> i64
      %1163 = func.call @cc_intern(%1159, %1162) : (i64, i64) -> i64
      %1164 = func.call @cc_nil_value() : () -> i64
      %1165 = func.call @cc_cons(%1163, %1164) : (i64, i64) -> i64
      %1166 = func.call @cc_values_pack(%1165) : (i64) -> i64
      func.call @stack_push_pointer(%1163) : (i64) -> ()
      %1167 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1168 = func.call @stack_pop_pointer() : () -> i64
      %1169 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1170 = arith.constant 4 : i64
      %1171 = func.call @cc_make_string(%1169, %1170) : (!llvm.ptr, i64) -> i64
      %1172 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1173 = arith.constant 7 : i64
      %1174 = func.call @cc_make_string(%1172, %1173) : (!llvm.ptr, i64) -> i64
      %1175 = func.call @cc_intern(%1171, %1174) : (i64, i64) -> i64
      %1176 = func.call @cc_nil_value() : () -> i64
      %1177 = func.call @cc_cons(%1175, %1176) : (i64, i64) -> i64
      %1178 = func.call @cc_values_pack(%1177) : (i64) -> i64
      func.call @stack_push_pointer(%1175) : (i64) -> ()
      %1179 = func.call @stack_pop_pointer() : () -> i64
      %1180 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1181 = arith.constant 6 : i64
      %1182 = func.call @cc_make_string(%1180, %1181) : (!llvm.ptr, i64) -> i64
      %1183 = func.call @cc_nil_value() : () -> i64
      %1184 = func.call @cc_intern(%1182, %1183) : (i64, i64) -> i64
      %1185 = func.call @cc_nil_value() : () -> i64
      %1186 = func.call @cc_cons(%1184, %1185) : (i64, i64) -> i64
      %1187 = func.call @cc_values_pack(%1186) : (i64) -> i64
      func.call @stack_push_pointer(%1184) : (i64) -> ()
      %1188 = func.call @stack_pop_pointer() : () -> i64
      %1189 = func.call @cc_nil_value() : () -> i64
      %1190 = func.call @cc_errorp(%988) : (i64) -> i64
      %1191 = arith.cmpi ne, %1190, %1189 : i64
      %1192 = arith.cmpi eq, %1189, %1189 : i64
      %1193 = arith.andi %1191, %1192 : i1
      %1194 = scf.if %1193 -> (i64) {
        scf.yield %988 : i64
      } else {
        scf.yield %1189 : i64
      }
      %1195 = func.call @cc_errorp(%1100) : (i64) -> i64
      %1196 = arith.cmpi ne, %1195, %1189 : i64
      %1197 = arith.cmpi eq, %1194, %1189 : i64
      %1198 = arith.andi %1196, %1197 : i1
      %1199 = scf.if %1198 -> (i64) {
        scf.yield %1100 : i64
      } else {
        scf.yield %1194 : i64
      }
      %1200 = func.call @cc_errorp(%1144) : (i64) -> i64
      %1201 = arith.cmpi ne, %1200, %1189 : i64
      %1202 = arith.cmpi eq, %1199, %1189 : i64
      %1203 = arith.andi %1201, %1202 : i1
      %1204 = scf.if %1203 -> (i64) {
        scf.yield %1144 : i64
      } else {
        scf.yield %1199 : i64
      }
      %1205 = func.call @cc_errorp(%1156) : (i64) -> i64
      %1206 = arith.cmpi ne, %1205, %1189 : i64
      %1207 = arith.cmpi eq, %1204, %1189 : i64
      %1208 = arith.andi %1206, %1207 : i1
      %1209 = scf.if %1208 -> (i64) {
        scf.yield %1156 : i64
      } else {
        scf.yield %1204 : i64
      }
      %1210 = func.call @cc_errorp(%1167) : (i64) -> i64
      %1211 = arith.cmpi ne, %1210, %1189 : i64
      %1212 = arith.cmpi eq, %1209, %1189 : i64
      %1213 = arith.andi %1211, %1212 : i1
      %1214 = scf.if %1213 -> (i64) {
        scf.yield %1167 : i64
      } else {
        scf.yield %1209 : i64
      }
      %1215 = func.call @cc_errorp(%1168) : (i64) -> i64
      %1216 = arith.cmpi ne, %1215, %1189 : i64
      %1217 = arith.cmpi eq, %1214, %1189 : i64
      %1218 = arith.andi %1216, %1217 : i1
      %1219 = scf.if %1218 -> (i64) {
        scf.yield %1168 : i64
      } else {
        scf.yield %1214 : i64
      }
      %1220 = func.call @cc_errorp(%1179) : (i64) -> i64
      %1221 = arith.cmpi ne, %1220, %1189 : i64
      %1222 = arith.cmpi eq, %1219, %1189 : i64
      %1223 = arith.andi %1221, %1222 : i1
      %1224 = scf.if %1223 -> (i64) {
        scf.yield %1179 : i64
      } else {
        scf.yield %1219 : i64
      }
      %1225 = func.call @cc_errorp(%1188) : (i64) -> i64
      %1226 = arith.cmpi ne, %1225, %1189 : i64
      %1227 = arith.cmpi eq, %1224, %1189 : i64
      %1228 = arith.andi %1226, %1227 : i1
      %1229 = scf.if %1228 -> (i64) {
        scf.yield %1188 : i64
      } else {
        scf.yield %1224 : i64
      }
      %1230 = arith.cmpi ne, %1229, %1189 : i64
      scf.if %1230 {
        func.call @stack_push_pointer(%1229) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%988) : (i64) -> ()
        func.call @stack_push_pointer(%1100) : (i64) -> ()
        func.call @stack_push_pointer(%1144) : (i64) -> ()
        func.call @stack_push_pointer(%1156) : (i64) -> ()
        func.call @stack_push_pointer(%1167) : (i64) -> ()
        func.call @stack_push_pointer(%1168) : (i64) -> ()
        func.call @stack_push_pointer(%1179) : (i64) -> ()
        func.call @stack_push_pointer(%1188) : (i64) -> ()
        %1231 = llvm.mlir.addressof @str102 : !llvm.ptr
        %1232 = func.call @cc_make_function_ref_const(%1231) : (!llvm.ptr) -> i64
        %1233 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1232, %1233) : (i64, i64) -> ()
      }
      %1234 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1234 : i64
    }
    %1235 = func.call @cc_nil_value() : () -> i64
    %1236 = func.call @cc_errorp(%979) : (i64) -> i64
    %1237 = arith.cmpi ne, %1236, %1235 : i64
    %1238 = scf.if %1237 -> (i64) {
      scf.yield %979 : i64
    } else {
      %1239 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1240 = arith.constant 21 : i64
      %1241 = func.call @cc_make_string(%1239, %1240) : (!llvm.ptr, i64) -> i64
      %1242 = func.call @cc_nil_value() : () -> i64
      %1243 = func.call @cc_intern(%1241, %1242) : (i64, i64) -> i64
      %1244 = func.call @cc_nil_value() : () -> i64
      %1245 = func.call @cc_cons(%1243, %1244) : (i64, i64) -> i64
      %1246 = func.call @cc_values_pack(%1245) : (i64) -> i64
      func.call @stack_push_pointer(%1243) : (i64) -> ()
      %1247 = func.call @stack_pop_pointer() : () -> i64
      %1248 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1249 = arith.constant 3 : i64
      %1250 = func.call @cc_make_string(%1248, %1249) : (!llvm.ptr, i64) -> i64
      %1251 = func.call @cc_nil_value() : () -> i64
      %1252 = func.call @cc_intern(%1250, %1251) : (i64, i64) -> i64
      %1253 = func.call @cc_nil_value() : () -> i64
      %1254 = func.call @cc_cons(%1252, %1253) : (i64, i64) -> i64
      %1255 = func.call @cc_values_pack(%1254) : (i64) -> i64
      func.call @stack_push_pointer(%1252) : (i64) -> ()
      %1256 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1257 = arith.constant 3 : i64
      %1258 = func.call @cc_make_string(%1256, %1257) : (!llvm.ptr, i64) -> i64
      %1259 = func.call @cc_nil_value() : () -> i64
      %1260 = func.call @cc_intern(%1258, %1259) : (i64, i64) -> i64
      %1261 = func.call @cc_nil_value() : () -> i64
      %1262 = func.call @cc_cons(%1260, %1261) : (i64, i64) -> i64
      %1263 = func.call @cc_values_pack(%1262) : (i64) -> i64
      func.call @stack_push_pointer(%1260) : (i64) -> ()
      %1264 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1265 = arith.constant 7 : i64
      %1266 = func.call @cc_make_string(%1264, %1265) : (!llvm.ptr, i64) -> i64
      %1267 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1268 = arith.constant 11 : i64
      %1269 = func.call @cc_make_string(%1267, %1268) : (!llvm.ptr, i64) -> i64
      %1270 = func.call @cc_intern(%1266, %1269) : (i64, i64) -> i64
      %1271 = func.call @cc_nil_value() : () -> i64
      %1272 = func.call @cc_cons(%1270, %1271) : (i64, i64) -> i64
      %1273 = func.call @cc_values_pack(%1272) : (i64) -> i64
      func.call @stack_push_pointer(%1270) : (i64) -> ()
      %1274 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1275 = arith.constant 11 : i64
      %1276 = func.call @cc_make_string(%1274, %1275) : (!llvm.ptr, i64) -> i64
      %1277 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1278 = arith.constant 11 : i64
      %1279 = func.call @cc_make_string(%1277, %1278) : (!llvm.ptr, i64) -> i64
      %1280 = func.call @cc_intern(%1276, %1279) : (i64, i64) -> i64
      %1281 = func.call @cc_nil_value() : () -> i64
      %1282 = func.call @cc_cons(%1280, %1281) : (i64, i64) -> i64
      %1283 = func.call @cc_values_pack(%1282) : (i64) -> i64
      func.call @stack_push_pointer(%1280) : (i64) -> ()
      %1284 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1284) : (i64) -> ()
      %1285 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1286 = arith.constant 6 : i64
      %1287 = func.call @cc_make_string(%1285, %1286) : (!llvm.ptr, i64) -> i64
      %1288 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1289 = arith.constant 11 : i64
      %1290 = func.call @cc_make_string(%1288, %1289) : (!llvm.ptr, i64) -> i64
      %1291 = func.call @cc_intern(%1287, %1290) : (i64, i64) -> i64
      %1292 = func.call @cc_nil_value() : () -> i64
      %1293 = func.call @cc_cons(%1291, %1292) : (i64, i64) -> i64
      %1294 = func.call @cc_values_pack(%1293) : (i64) -> i64
      func.call @stack_push_pointer(%1291) : (i64) -> ()
      %1295 = func.call @stack_pop_pointer() : () -> i64
      %1296 = func.call @stack_pop_pointer() : () -> i64
      %1297 = func.call @cc_cons(%1295, %1296) : (i64, i64) -> i64
      %1298 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1299 = arith.constant 5 : i64
      %1300 = func.call @cc_make_string(%1298, %1299) : (!llvm.ptr, i64) -> i64
      %1301 = func.call @cc_nil_value() : () -> i64
      %1302 = func.call @cc_intern(%1300, %1301) : (i64, i64) -> i64
      %1303 = func.call @cc_nil_value() : () -> i64
      %1304 = func.call @cc_cons(%1302, %1303) : (i64, i64) -> i64
      %1305 = func.call @cc_values_pack(%1304) : (i64) -> i64
      %1306 = func.call @cc_cons(%1302, %1297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1306) : (i64) -> ()
      %1307 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1308 = arith.constant 11 : i64
      %1309 = func.call @cc_make_string(%1307, %1308) : (!llvm.ptr, i64) -> i64
      %1310 = llvm.mlir.addressof @str114 : !llvm.ptr
      %1311 = arith.constant 11 : i64
      %1312 = func.call @cc_make_string(%1310, %1311) : (!llvm.ptr, i64) -> i64
      %1313 = func.call @cc_intern(%1309, %1312) : (i64, i64) -> i64
      %1314 = func.call @cc_nil_value() : () -> i64
      %1315 = func.call @cc_cons(%1313, %1314) : (i64, i64) -> i64
      %1316 = func.call @cc_values_pack(%1315) : (i64) -> i64
      func.call @stack_push_pointer(%1313) : (i64) -> ()
      %1317 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1317) : (i64) -> ()
      %1318 = llvm.mlir.addressof @str115 : !llvm.ptr
      %1319 = arith.constant 15 : i64
      %1320 = func.call @cc_make_string(%1318, %1319) : (!llvm.ptr, i64) -> i64
      %1321 = llvm.mlir.addressof @str116 : !llvm.ptr
      %1322 = arith.constant 7 : i64
      %1323 = func.call @cc_make_string(%1321, %1322) : (!llvm.ptr, i64) -> i64
      %1324 = func.call @cc_intern(%1320, %1323) : (i64, i64) -> i64
      %1325 = func.call @cc_nil_value() : () -> i64
      %1326 = func.call @cc_cons(%1324, %1325) : (i64, i64) -> i64
      %1327 = func.call @cc_values_pack(%1326) : (i64) -> i64
      func.call @stack_push_pointer(%1324) : (i64) -> ()
      %1328 = arith.constant 0 : i64
      %1329 = func.call @cc_box_character(%1328) : (i64) -> i64
      func.call @stack_push_pointer(%1329) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1330 = func.call @stack_pop_pointer() : () -> i64
      %1331 = func.call @stack_pop_pointer() : () -> i64
      %1332 = func.call @cc_cons(%1331, %1330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1332) : (i64) -> ()
      %1333 = func.call @stack_pop_pointer() : () -> i64
      %1334 = func.call @stack_pop_pointer() : () -> i64
      %1335 = func.call @cc_cons(%1334, %1333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1335) : (i64) -> ()
      %1336 = func.call @stack_pop_pointer() : () -> i64
      %1337 = func.call @stack_pop_pointer() : () -> i64
      %1338 = func.call @cc_cons(%1337, %1336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1338) : (i64) -> ()
      %1339 = func.call @stack_pop_pointer() : () -> i64
      %1340 = func.call @stack_pop_pointer() : () -> i64
      %1341 = func.call @cc_cons(%1340, %1339) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1341) : (i64) -> ()
      %1342 = llvm.mlir.addressof @str117 : !llvm.ptr
      %1343 = arith.constant 3 : i64
      %1344 = func.call @cc_make_string(%1342, %1343) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1344) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1345 = func.call @stack_pop_pointer() : () -> i64
      %1346 = func.call @stack_pop_pointer() : () -> i64
      %1347 = func.call @cc_cons(%1346, %1345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1347) : (i64) -> ()
      %1348 = func.call @stack_pop_pointer() : () -> i64
      %1349 = func.call @stack_pop_pointer() : () -> i64
      %1350 = func.call @cc_cons(%1349, %1348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1350) : (i64) -> ()
      %1351 = func.call @stack_pop_pointer() : () -> i64
      %1352 = func.call @stack_pop_pointer() : () -> i64
      %1353 = func.call @cc_cons(%1352, %1351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1353) : (i64) -> ()
      %1354 = func.call @stack_pop_pointer() : () -> i64
      %1355 = func.call @stack_pop_pointer() : () -> i64
      %1356 = func.call @cc_cons(%1355, %1354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1356) : (i64) -> ()
      %1357 = llvm.mlir.addressof @str118 : !llvm.ptr
      %1358 = arith.constant 6 : i64
      %1359 = func.call @cc_make_string(%1357, %1358) : (!llvm.ptr, i64) -> i64
      %1360 = llvm.mlir.addressof @str119 : !llvm.ptr
      %1361 = arith.constant 11 : i64
      %1362 = func.call @cc_make_string(%1360, %1361) : (!llvm.ptr, i64) -> i64
      %1363 = func.call @cc_intern(%1359, %1362) : (i64, i64) -> i64
      %1364 = func.call @cc_nil_value() : () -> i64
      %1365 = func.call @cc_cons(%1363, %1364) : (i64, i64) -> i64
      %1366 = func.call @cc_values_pack(%1365) : (i64) -> i64
      func.call @stack_push_pointer(%1363) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1367 = llvm.mlir.addressof @str120 : !llvm.ptr
      %1368 = arith.constant 9 : i64
      %1369 = func.call @cc_make_string(%1367, %1368) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1369) : (i64) -> ()
      %1370 = arith.constant 0 : i64
      %1371 = func.call @cc_box_character(%1370) : (i64) -> i64
      func.call @stack_push_pointer(%1371) : (i64) -> ()
      %1372 = arith.constant 0 : i64
      %1373 = func.call @cc_box_character(%1372) : (i64) -> i64
      func.call @stack_push_pointer(%1373) : (i64) -> ()
      %1374 = arith.constant 0 : i64
      %1375 = func.call @cc_box_character(%1374) : (i64) -> i64
      func.call @stack_push_pointer(%1375) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1376 = func.call @stack_pop_pointer() : () -> i64
      %1377 = func.call @stack_pop_pointer() : () -> i64
      %1378 = func.call @cc_cons(%1377, %1376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1378) : (i64) -> ()
      %1379 = func.call @stack_pop_pointer() : () -> i64
      %1380 = func.call @stack_pop_pointer() : () -> i64
      %1381 = func.call @cc_cons(%1380, %1379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1381) : (i64) -> ()
      %1382 = func.call @stack_pop_pointer() : () -> i64
      %1383 = func.call @stack_pop_pointer() : () -> i64
      %1384 = func.call @cc_cons(%1383, %1382) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1384) : (i64) -> ()
      %1385 = func.call @stack_pop_pointer() : () -> i64
      %1386 = func.call @stack_pop_pointer() : () -> i64
      %1387 = func.call @cc_cons(%1386, %1385) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1387) : (i64) -> ()
      %1388 = func.call @stack_pop_pointer() : () -> i64
      %1389 = func.call @stack_pop_pointer() : () -> i64
      %1390 = func.call @cc_cons(%1389, %1388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1390) : (i64) -> ()
      %1391 = func.call @stack_pop_pointer() : () -> i64
      %1392 = func.call @stack_pop_pointer() : () -> i64
      %1393 = func.call @cc_cons(%1392, %1391) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1393) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1394 = func.call @stack_pop_pointer() : () -> i64
      %1395 = func.call @stack_pop_pointer() : () -> i64
      %1396 = func.call @cc_cons(%1395, %1394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1396) : (i64) -> ()
      %1397 = func.call @stack_pop_pointer() : () -> i64
      %1398 = func.call @stack_pop_pointer() : () -> i64
      %1399 = func.call @cc_cons(%1398, %1397) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1399) : (i64) -> ()
      %1400 = func.call @stack_pop_pointer() : () -> i64
      %1401 = func.call @stack_pop_pointer() : () -> i64
      %1402 = func.call @cc_cons(%1401, %1400) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1402) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1403 = func.call @stack_pop_pointer() : () -> i64
      %1404 = func.call @stack_pop_pointer() : () -> i64
      %1405 = func.call @cc_cons(%1404, %1403) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1405) : (i64) -> ()
      %1406 = func.call @stack_pop_pointer() : () -> i64
      %1407 = func.call @stack_pop_pointer() : () -> i64
      %1408 = func.call @cc_cons(%1407, %1406) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1408) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1409 = func.call @stack_pop_pointer() : () -> i64
      %1410 = func.call @stack_pop_pointer() : () -> i64
      %1411 = func.call @cc_cons(%1410, %1409) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1411) : (i64) -> ()
      %1412 = func.call @stack_pop_pointer() : () -> i64
      %1413 = func.call @stack_pop_pointer() : () -> i64
      %1414 = func.call @cc_cons(%1413, %1412) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1414) : (i64) -> ()
      %1415 = func.call @stack_pop_pointer() : () -> i64
      %1481 = arith.constant 122791386939398 : i64
      %1482 = arith.constant 0 : i64
      %1483 = func.call @cc_make_closure(%1481, %1482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1483) : (i64) -> ()
      %1484 = func.call @stack_pop_pointer() : () -> i64
      %1485 = llvm.mlir.addressof @str126 : !llvm.ptr
      %1486 = arith.constant 1 : i64
      %1487 = func.call @cc_make_string(%1485, %1486) : (!llvm.ptr, i64) -> i64
      %1488 = func.call @cc_nil_value() : () -> i64
      %1489 = func.call @cc_intern(%1487, %1488) : (i64, i64) -> i64
      %1490 = func.call @cc_nil_value() : () -> i64
      %1491 = func.call @cc_cons(%1489, %1490) : (i64, i64) -> i64
      %1492 = func.call @cc_values_pack(%1491) : (i64) -> i64
      func.call @stack_push_pointer(%1489) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1493 = func.call @stack_pop_pointer() : () -> i64
      %1494 = func.call @stack_pop_pointer() : () -> i64
      %1495 = func.call @cc_cons(%1494, %1493) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1495) : (i64) -> ()
      %1496 = func.call @stack_pop_pointer() : () -> i64
      %1497 = llvm.mlir.addressof @str127 : !llvm.ptr
      %1498 = arith.constant 11 : i64
      %1499 = func.call @cc_make_string(%1497, %1498) : (!llvm.ptr, i64) -> i64
      %1500 = llvm.mlir.addressof @str128 : !llvm.ptr
      %1501 = arith.constant 7 : i64
      %1502 = func.call @cc_make_string(%1500, %1501) : (!llvm.ptr, i64) -> i64
      %1503 = func.call @cc_intern(%1499, %1502) : (i64, i64) -> i64
      %1504 = func.call @cc_nil_value() : () -> i64
      %1505 = func.call @cc_cons(%1503, %1504) : (i64, i64) -> i64
      %1506 = func.call @cc_values_pack(%1505) : (i64) -> i64
      func.call @stack_push_pointer(%1503) : (i64) -> ()
      %1507 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1508 = func.call @stack_pop_pointer() : () -> i64
      %1509 = llvm.mlir.addressof @str129 : !llvm.ptr
      %1510 = arith.constant 4 : i64
      %1511 = func.call @cc_make_string(%1509, %1510) : (!llvm.ptr, i64) -> i64
      %1512 = llvm.mlir.addressof @str130 : !llvm.ptr
      %1513 = arith.constant 7 : i64
      %1514 = func.call @cc_make_string(%1512, %1513) : (!llvm.ptr, i64) -> i64
      %1515 = func.call @cc_intern(%1511, %1514) : (i64, i64) -> i64
      %1516 = func.call @cc_nil_value() : () -> i64
      %1517 = func.call @cc_cons(%1515, %1516) : (i64, i64) -> i64
      %1518 = func.call @cc_values_pack(%1517) : (i64) -> i64
      func.call @stack_push_pointer(%1515) : (i64) -> ()
      %1519 = func.call @stack_pop_pointer() : () -> i64
      %1520 = llvm.mlir.addressof @str131 : !llvm.ptr
      %1521 = arith.constant 6 : i64
      %1522 = func.call @cc_make_string(%1520, %1521) : (!llvm.ptr, i64) -> i64
      %1523 = func.call @cc_nil_value() : () -> i64
      %1524 = func.call @cc_intern(%1522, %1523) : (i64, i64) -> i64
      %1525 = func.call @cc_nil_value() : () -> i64
      %1526 = func.call @cc_cons(%1524, %1525) : (i64, i64) -> i64
      %1527 = func.call @cc_values_pack(%1526) : (i64) -> i64
      func.call @stack_push_pointer(%1524) : (i64) -> ()
      %1528 = func.call @stack_pop_pointer() : () -> i64
      %1529 = func.call @cc_nil_value() : () -> i64
      %1530 = func.call @cc_errorp(%1247) : (i64) -> i64
      %1531 = arith.cmpi ne, %1530, %1529 : i64
      %1532 = arith.cmpi eq, %1529, %1529 : i64
      %1533 = arith.andi %1531, %1532 : i1
      %1534 = scf.if %1533 -> (i64) {
        scf.yield %1247 : i64
      } else {
        scf.yield %1529 : i64
      }
      %1535 = func.call @cc_errorp(%1415) : (i64) -> i64
      %1536 = arith.cmpi ne, %1535, %1529 : i64
      %1537 = arith.cmpi eq, %1534, %1529 : i64
      %1538 = arith.andi %1536, %1537 : i1
      %1539 = scf.if %1538 -> (i64) {
        scf.yield %1415 : i64
      } else {
        scf.yield %1534 : i64
      }
      %1540 = func.call @cc_errorp(%1484) : (i64) -> i64
      %1541 = arith.cmpi ne, %1540, %1529 : i64
      %1542 = arith.cmpi eq, %1539, %1529 : i64
      %1543 = arith.andi %1541, %1542 : i1
      %1544 = scf.if %1543 -> (i64) {
        scf.yield %1484 : i64
      } else {
        scf.yield %1539 : i64
      }
      %1545 = func.call @cc_errorp(%1496) : (i64) -> i64
      %1546 = arith.cmpi ne, %1545, %1529 : i64
      %1547 = arith.cmpi eq, %1544, %1529 : i64
      %1548 = arith.andi %1546, %1547 : i1
      %1549 = scf.if %1548 -> (i64) {
        scf.yield %1496 : i64
      } else {
        scf.yield %1544 : i64
      }
      %1550 = func.call @cc_errorp(%1507) : (i64) -> i64
      %1551 = arith.cmpi ne, %1550, %1529 : i64
      %1552 = arith.cmpi eq, %1549, %1529 : i64
      %1553 = arith.andi %1551, %1552 : i1
      %1554 = scf.if %1553 -> (i64) {
        scf.yield %1507 : i64
      } else {
        scf.yield %1549 : i64
      }
      %1555 = func.call @cc_errorp(%1508) : (i64) -> i64
      %1556 = arith.cmpi ne, %1555, %1529 : i64
      %1557 = arith.cmpi eq, %1554, %1529 : i64
      %1558 = arith.andi %1556, %1557 : i1
      %1559 = scf.if %1558 -> (i64) {
        scf.yield %1508 : i64
      } else {
        scf.yield %1554 : i64
      }
      %1560 = func.call @cc_errorp(%1519) : (i64) -> i64
      %1561 = arith.cmpi ne, %1560, %1529 : i64
      %1562 = arith.cmpi eq, %1559, %1529 : i64
      %1563 = arith.andi %1561, %1562 : i1
      %1564 = scf.if %1563 -> (i64) {
        scf.yield %1519 : i64
      } else {
        scf.yield %1559 : i64
      }
      %1565 = func.call @cc_errorp(%1528) : (i64) -> i64
      %1566 = arith.cmpi ne, %1565, %1529 : i64
      %1567 = arith.cmpi eq, %1564, %1529 : i64
      %1568 = arith.andi %1566, %1567 : i1
      %1569 = scf.if %1568 -> (i64) {
        scf.yield %1528 : i64
      } else {
        scf.yield %1564 : i64
      }
      %1570 = arith.cmpi ne, %1569, %1529 : i64
      scf.if %1570 {
        func.call @stack_push_pointer(%1569) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1247) : (i64) -> ()
        func.call @stack_push_pointer(%1415) : (i64) -> ()
        func.call @stack_push_pointer(%1484) : (i64) -> ()
        func.call @stack_push_pointer(%1496) : (i64) -> ()
        func.call @stack_push_pointer(%1507) : (i64) -> ()
        func.call @stack_push_pointer(%1508) : (i64) -> ()
        func.call @stack_push_pointer(%1519) : (i64) -> ()
        func.call @stack_push_pointer(%1528) : (i64) -> ()
        %1571 = llvm.mlir.addressof @str132 : !llvm.ptr
        %1572 = func.call @cc_make_function_ref_const(%1571) : (!llvm.ptr) -> i64
        %1573 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1572, %1573) : (i64, i64) -> ()
      }
      %1574 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1574 : i64
    }
    %1575 = func.call @cc_nil_value() : () -> i64
    %1576 = func.call @cc_errorp(%1238) : (i64) -> i64
    %1577 = arith.cmpi ne, %1576, %1575 : i64
    %1578 = scf.if %1577 -> (i64) {
      scf.yield %1238 : i64
    } else {
      %1579 = llvm.mlir.addressof @str133 : !llvm.ptr
      %1580 = arith.constant 18 : i64
      %1581 = func.call @cc_make_string(%1579, %1580) : (!llvm.ptr, i64) -> i64
      %1582 = func.call @cc_nil_value() : () -> i64
      %1583 = func.call @cc_intern(%1581, %1582) : (i64, i64) -> i64
      %1584 = func.call @cc_nil_value() : () -> i64
      %1585 = func.call @cc_cons(%1583, %1584) : (i64, i64) -> i64
      %1586 = func.call @cc_values_pack(%1585) : (i64) -> i64
      func.call @stack_push_pointer(%1583) : (i64) -> ()
      %1587 = func.call @stack_pop_pointer() : () -> i64
      %1588 = llvm.mlir.addressof @str134 : !llvm.ptr
      %1589 = arith.constant 3 : i64
      %1590 = func.call @cc_make_string(%1588, %1589) : (!llvm.ptr, i64) -> i64
      %1591 = func.call @cc_nil_value() : () -> i64
      %1592 = func.call @cc_intern(%1590, %1591) : (i64, i64) -> i64
      %1593 = func.call @cc_nil_value() : () -> i64
      %1594 = func.call @cc_cons(%1592, %1593) : (i64, i64) -> i64
      %1595 = func.call @cc_values_pack(%1594) : (i64) -> i64
      func.call @stack_push_pointer(%1592) : (i64) -> ()
      %1596 = llvm.mlir.addressof @str135 : !llvm.ptr
      %1597 = arith.constant 3 : i64
      %1598 = func.call @cc_make_string(%1596, %1597) : (!llvm.ptr, i64) -> i64
      %1599 = func.call @cc_nil_value() : () -> i64
      %1600 = func.call @cc_intern(%1598, %1599) : (i64, i64) -> i64
      %1601 = func.call @cc_nil_value() : () -> i64
      %1602 = func.call @cc_cons(%1600, %1601) : (i64, i64) -> i64
      %1603 = func.call @cc_values_pack(%1602) : (i64) -> i64
      func.call @stack_push_pointer(%1600) : (i64) -> ()
      %1604 = llvm.mlir.addressof @str136 : !llvm.ptr
      %1605 = arith.constant 7 : i64
      %1606 = func.call @cc_make_string(%1604, %1605) : (!llvm.ptr, i64) -> i64
      %1607 = llvm.mlir.addressof @str137 : !llvm.ptr
      %1608 = arith.constant 11 : i64
      %1609 = func.call @cc_make_string(%1607, %1608) : (!llvm.ptr, i64) -> i64
      %1610 = func.call @cc_intern(%1606, %1609) : (i64, i64) -> i64
      %1611 = func.call @cc_nil_value() : () -> i64
      %1612 = func.call @cc_cons(%1610, %1611) : (i64, i64) -> i64
      %1613 = func.call @cc_values_pack(%1612) : (i64) -> i64
      func.call @stack_push_pointer(%1610) : (i64) -> ()
      %1614 = llvm.mlir.addressof @str138 : !llvm.ptr
      %1615 = arith.constant 8 : i64
      %1616 = func.call @cc_make_string(%1614, %1615) : (!llvm.ptr, i64) -> i64
      %1617 = llvm.mlir.addressof @str139 : !llvm.ptr
      %1618 = arith.constant 11 : i64
      %1619 = func.call @cc_make_string(%1617, %1618) : (!llvm.ptr, i64) -> i64
      %1620 = func.call @cc_intern(%1616, %1619) : (i64, i64) -> i64
      %1621 = func.call @cc_nil_value() : () -> i64
      %1622 = func.call @cc_cons(%1620, %1621) : (i64, i64) -> i64
      %1623 = func.call @cc_values_pack(%1622) : (i64) -> i64
      func.call @stack_push_pointer(%1620) : (i64) -> ()
      %1624 = llvm.mlir.addressof @str140 : !llvm.ptr
      %1625 = arith.constant 11 : i64
      %1626 = func.call @cc_make_string(%1624, %1625) : (!llvm.ptr, i64) -> i64
      %1627 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1628 = arith.constant 11 : i64
      %1629 = func.call @cc_make_string(%1627, %1628) : (!llvm.ptr, i64) -> i64
      %1630 = func.call @cc_intern(%1626, %1629) : (i64, i64) -> i64
      %1631 = func.call @cc_nil_value() : () -> i64
      %1632 = func.call @cc_cons(%1630, %1631) : (i64, i64) -> i64
      %1633 = func.call @cc_values_pack(%1632) : (i64) -> i64
      func.call @stack_push_pointer(%1630) : (i64) -> ()
      %1634 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1634) : (i64) -> ()
      %1635 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1636 = arith.constant 6 : i64
      %1637 = func.call @cc_make_string(%1635, %1636) : (!llvm.ptr, i64) -> i64
      %1638 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1639 = arith.constant 11 : i64
      %1640 = func.call @cc_make_string(%1638, %1639) : (!llvm.ptr, i64) -> i64
      %1641 = func.call @cc_intern(%1637, %1640) : (i64, i64) -> i64
      %1642 = func.call @cc_nil_value() : () -> i64
      %1643 = func.call @cc_cons(%1641, %1642) : (i64, i64) -> i64
      %1644 = func.call @cc_values_pack(%1643) : (i64) -> i64
      func.call @stack_push_pointer(%1641) : (i64) -> ()
      %1645 = func.call @stack_pop_pointer() : () -> i64
      %1646 = func.call @stack_pop_pointer() : () -> i64
      %1647 = func.call @cc_cons(%1645, %1646) : (i64, i64) -> i64
      %1648 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1649 = arith.constant 5 : i64
      %1650 = func.call @cc_make_string(%1648, %1649) : (!llvm.ptr, i64) -> i64
      %1651 = func.call @cc_nil_value() : () -> i64
      %1652 = func.call @cc_intern(%1650, %1651) : (i64, i64) -> i64
      %1653 = func.call @cc_nil_value() : () -> i64
      %1654 = func.call @cc_cons(%1652, %1653) : (i64, i64) -> i64
      %1655 = func.call @cc_values_pack(%1654) : (i64) -> i64
      %1656 = func.call @cc_cons(%1652, %1647) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1656) : (i64) -> ()
      %1657 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1658 = arith.constant 11 : i64
      %1659 = func.call @cc_make_string(%1657, %1658) : (!llvm.ptr, i64) -> i64
      %1660 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1661 = arith.constant 11 : i64
      %1662 = func.call @cc_make_string(%1660, %1661) : (!llvm.ptr, i64) -> i64
      %1663 = func.call @cc_intern(%1659, %1662) : (i64, i64) -> i64
      %1664 = func.call @cc_nil_value() : () -> i64
      %1665 = func.call @cc_cons(%1663, %1664) : (i64, i64) -> i64
      %1666 = func.call @cc_values_pack(%1665) : (i64) -> i64
      func.call @stack_push_pointer(%1663) : (i64) -> ()
      %1667 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1667) : (i64) -> ()
      %1668 = llvm.mlir.addressof @str147 : !llvm.ptr
      %1669 = arith.constant 15 : i64
      %1670 = func.call @cc_make_string(%1668, %1669) : (!llvm.ptr, i64) -> i64
      %1671 = llvm.mlir.addressof @str148 : !llvm.ptr
      %1672 = arith.constant 7 : i64
      %1673 = func.call @cc_make_string(%1671, %1672) : (!llvm.ptr, i64) -> i64
      %1674 = func.call @cc_intern(%1670, %1673) : (i64, i64) -> i64
      %1675 = func.call @cc_nil_value() : () -> i64
      %1676 = func.call @cc_cons(%1674, %1675) : (i64, i64) -> i64
      %1677 = func.call @cc_values_pack(%1676) : (i64) -> i64
      func.call @stack_push_pointer(%1674) : (i64) -> ()
      %1678 = arith.constant 0 : i64
      %1679 = func.call @cc_box_character(%1678) : (i64) -> i64
      func.call @stack_push_pointer(%1679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1680 = func.call @stack_pop_pointer() : () -> i64
      %1681 = func.call @stack_pop_pointer() : () -> i64
      %1682 = func.call @cc_cons(%1681, %1680) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1682) : (i64) -> ()
      %1683 = func.call @stack_pop_pointer() : () -> i64
      %1684 = func.call @stack_pop_pointer() : () -> i64
      %1685 = func.call @cc_cons(%1684, %1683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1685) : (i64) -> ()
      %1686 = func.call @stack_pop_pointer() : () -> i64
      %1687 = func.call @stack_pop_pointer() : () -> i64
      %1688 = func.call @cc_cons(%1687, %1686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1688) : (i64) -> ()
      %1689 = func.call @stack_pop_pointer() : () -> i64
      %1690 = func.call @stack_pop_pointer() : () -> i64
      %1691 = func.call @cc_cons(%1690, %1689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1691) : (i64) -> ()
      %1692 = llvm.mlir.addressof @str149 : !llvm.ptr
      %1693 = arith.constant 3 : i64
      %1694 = func.call @cc_make_string(%1692, %1693) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1694) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1695 = func.call @stack_pop_pointer() : () -> i64
      %1696 = func.call @stack_pop_pointer() : () -> i64
      %1697 = func.call @cc_cons(%1696, %1695) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1697) : (i64) -> ()
      %1698 = func.call @stack_pop_pointer() : () -> i64
      %1699 = func.call @stack_pop_pointer() : () -> i64
      %1700 = func.call @cc_cons(%1699, %1698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1700) : (i64) -> ()
      %1701 = func.call @stack_pop_pointer() : () -> i64
      %1702 = func.call @stack_pop_pointer() : () -> i64
      %1703 = func.call @cc_cons(%1702, %1701) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1703) : (i64) -> ()
      %1704 = func.call @stack_pop_pointer() : () -> i64
      %1705 = func.call @stack_pop_pointer() : () -> i64
      %1706 = func.call @cc_cons(%1705, %1704) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1707 = func.call @stack_pop_pointer() : () -> i64
      %1708 = func.call @stack_pop_pointer() : () -> i64
      %1709 = func.call @cc_cons(%1708, %1707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1709) : (i64) -> ()
      %1710 = func.call @stack_pop_pointer() : () -> i64
      %1711 = func.call @stack_pop_pointer() : () -> i64
      %1712 = func.call @cc_cons(%1711, %1710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1712) : (i64) -> ()
      %1713 = llvm.mlir.addressof @str150 : !llvm.ptr
      %1714 = arith.constant 6 : i64
      %1715 = func.call @cc_make_string(%1713, %1714) : (!llvm.ptr, i64) -> i64
      %1716 = llvm.mlir.addressof @str151 : !llvm.ptr
      %1717 = arith.constant 11 : i64
      %1718 = func.call @cc_make_string(%1716, %1717) : (!llvm.ptr, i64) -> i64
      %1719 = func.call @cc_intern(%1715, %1718) : (i64, i64) -> i64
      %1720 = func.call @cc_nil_value() : () -> i64
      %1721 = func.call @cc_cons(%1719, %1720) : (i64, i64) -> i64
      %1722 = func.call @cc_values_pack(%1721) : (i64) -> i64
      func.call @stack_push_pointer(%1719) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1723 = llvm.mlir.addressof @str152 : !llvm.ptr
      %1724 = arith.constant 9 : i64
      %1725 = func.call @cc_make_string(%1723, %1724) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1725) : (i64) -> ()
      %1726 = arith.constant 0 : i64
      %1727 = func.call @cc_box_character(%1726) : (i64) -> i64
      func.call @stack_push_pointer(%1727) : (i64) -> ()
      %1728 = arith.constant 0 : i64
      %1729 = func.call @cc_box_character(%1728) : (i64) -> i64
      func.call @stack_push_pointer(%1729) : (i64) -> ()
      %1730 = arith.constant 0 : i64
      %1731 = func.call @cc_box_character(%1730) : (i64) -> i64
      func.call @stack_push_pointer(%1731) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1732 = func.call @stack_pop_pointer() : () -> i64
      %1733 = func.call @stack_pop_pointer() : () -> i64
      %1734 = func.call @cc_cons(%1733, %1732) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1734) : (i64) -> ()
      %1735 = func.call @stack_pop_pointer() : () -> i64
      %1736 = func.call @stack_pop_pointer() : () -> i64
      %1737 = func.call @cc_cons(%1736, %1735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1737) : (i64) -> ()
      %1738 = func.call @stack_pop_pointer() : () -> i64
      %1739 = func.call @stack_pop_pointer() : () -> i64
      %1740 = func.call @cc_cons(%1739, %1738) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1740) : (i64) -> ()
      %1741 = func.call @stack_pop_pointer() : () -> i64
      %1742 = func.call @stack_pop_pointer() : () -> i64
      %1743 = func.call @cc_cons(%1742, %1741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1743) : (i64) -> ()
      %1744 = func.call @stack_pop_pointer() : () -> i64
      %1745 = func.call @stack_pop_pointer() : () -> i64
      %1746 = func.call @cc_cons(%1745, %1744) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1746) : (i64) -> ()
      %1747 = func.call @stack_pop_pointer() : () -> i64
      %1748 = func.call @stack_pop_pointer() : () -> i64
      %1749 = func.call @cc_cons(%1748, %1747) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1749) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1750 = func.call @stack_pop_pointer() : () -> i64
      %1751 = func.call @stack_pop_pointer() : () -> i64
      %1752 = func.call @cc_cons(%1751, %1750) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1752) : (i64) -> ()
      %1753 = func.call @stack_pop_pointer() : () -> i64
      %1754 = func.call @stack_pop_pointer() : () -> i64
      %1755 = func.call @cc_cons(%1754, %1753) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1755) : (i64) -> ()
      %1756 = func.call @stack_pop_pointer() : () -> i64
      %1757 = func.call @stack_pop_pointer() : () -> i64
      %1758 = func.call @cc_cons(%1757, %1756) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1758) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1759 = func.call @stack_pop_pointer() : () -> i64
      %1760 = func.call @stack_pop_pointer() : () -> i64
      %1761 = func.call @cc_cons(%1760, %1759) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1761) : (i64) -> ()
      %1762 = func.call @stack_pop_pointer() : () -> i64
      %1763 = func.call @stack_pop_pointer() : () -> i64
      %1764 = func.call @cc_cons(%1763, %1762) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1764) : (i64) -> ()
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
      %1839 = arith.constant 122791386939399 : i64
      %1840 = arith.constant 0 : i64
      %1841 = func.call @cc_make_closure(%1839, %1840) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1841) : (i64) -> ()
      %1842 = func.call @stack_pop_pointer() : () -> i64
      %1843 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1844 = arith.constant 1 : i64
      %1845 = func.call @cc_make_string(%1843, %1844) : (!llvm.ptr, i64) -> i64
      %1846 = func.call @cc_nil_value() : () -> i64
      %1847 = func.call @cc_intern(%1845, %1846) : (i64, i64) -> i64
      %1848 = func.call @cc_nil_value() : () -> i64
      %1849 = func.call @cc_cons(%1847, %1848) : (i64, i64) -> i64
      %1850 = func.call @cc_values_pack(%1849) : (i64) -> i64
      func.call @stack_push_pointer(%1847) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1851 = func.call @stack_pop_pointer() : () -> i64
      %1852 = func.call @stack_pop_pointer() : () -> i64
      %1853 = func.call @cc_cons(%1852, %1851) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1853) : (i64) -> ()
      %1854 = func.call @stack_pop_pointer() : () -> i64
      %1855 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1856 = arith.constant 11 : i64
      %1857 = func.call @cc_make_string(%1855, %1856) : (!llvm.ptr, i64) -> i64
      %1858 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1859 = arith.constant 7 : i64
      %1860 = func.call @cc_make_string(%1858, %1859) : (!llvm.ptr, i64) -> i64
      %1861 = func.call @cc_intern(%1857, %1860) : (i64, i64) -> i64
      %1862 = func.call @cc_nil_value() : () -> i64
      %1863 = func.call @cc_cons(%1861, %1862) : (i64, i64) -> i64
      %1864 = func.call @cc_values_pack(%1863) : (i64) -> i64
      func.call @stack_push_pointer(%1861) : (i64) -> ()
      %1865 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1866 = func.call @stack_pop_pointer() : () -> i64
      %1867 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1868 = arith.constant 4 : i64
      %1869 = func.call @cc_make_string(%1867, %1868) : (!llvm.ptr, i64) -> i64
      %1870 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1871 = arith.constant 7 : i64
      %1872 = func.call @cc_make_string(%1870, %1871) : (!llvm.ptr, i64) -> i64
      %1873 = func.call @cc_intern(%1869, %1872) : (i64, i64) -> i64
      %1874 = func.call @cc_nil_value() : () -> i64
      %1875 = func.call @cc_cons(%1873, %1874) : (i64, i64) -> i64
      %1876 = func.call @cc_values_pack(%1875) : (i64) -> i64
      func.call @stack_push_pointer(%1873) : (i64) -> ()
      %1877 = func.call @stack_pop_pointer() : () -> i64
      %1878 = llvm.mlir.addressof @str163 : !llvm.ptr
      %1879 = arith.constant 6 : i64
      %1880 = func.call @cc_make_string(%1878, %1879) : (!llvm.ptr, i64) -> i64
      %1881 = func.call @cc_nil_value() : () -> i64
      %1882 = func.call @cc_intern(%1880, %1881) : (i64, i64) -> i64
      %1883 = func.call @cc_nil_value() : () -> i64
      %1884 = func.call @cc_cons(%1882, %1883) : (i64, i64) -> i64
      %1885 = func.call @cc_values_pack(%1884) : (i64) -> i64
      func.call @stack_push_pointer(%1882) : (i64) -> ()
      %1886 = func.call @stack_pop_pointer() : () -> i64
      %1887 = func.call @cc_nil_value() : () -> i64
      %1888 = func.call @cc_errorp(%1587) : (i64) -> i64
      %1889 = arith.cmpi ne, %1888, %1887 : i64
      %1890 = arith.cmpi eq, %1887, %1887 : i64
      %1891 = arith.andi %1889, %1890 : i1
      %1892 = scf.if %1891 -> (i64) {
        scf.yield %1587 : i64
      } else {
        scf.yield %1887 : i64
      }
      %1893 = func.call @cc_errorp(%1771) : (i64) -> i64
      %1894 = arith.cmpi ne, %1893, %1887 : i64
      %1895 = arith.cmpi eq, %1892, %1887 : i64
      %1896 = arith.andi %1894, %1895 : i1
      %1897 = scf.if %1896 -> (i64) {
        scf.yield %1771 : i64
      } else {
        scf.yield %1892 : i64
      }
      %1898 = func.call @cc_errorp(%1842) : (i64) -> i64
      %1899 = arith.cmpi ne, %1898, %1887 : i64
      %1900 = arith.cmpi eq, %1897, %1887 : i64
      %1901 = arith.andi %1899, %1900 : i1
      %1902 = scf.if %1901 -> (i64) {
        scf.yield %1842 : i64
      } else {
        scf.yield %1897 : i64
      }
      %1903 = func.call @cc_errorp(%1854) : (i64) -> i64
      %1904 = arith.cmpi ne, %1903, %1887 : i64
      %1905 = arith.cmpi eq, %1902, %1887 : i64
      %1906 = arith.andi %1904, %1905 : i1
      %1907 = scf.if %1906 -> (i64) {
        scf.yield %1854 : i64
      } else {
        scf.yield %1902 : i64
      }
      %1908 = func.call @cc_errorp(%1865) : (i64) -> i64
      %1909 = arith.cmpi ne, %1908, %1887 : i64
      %1910 = arith.cmpi eq, %1907, %1887 : i64
      %1911 = arith.andi %1909, %1910 : i1
      %1912 = scf.if %1911 -> (i64) {
        scf.yield %1865 : i64
      } else {
        scf.yield %1907 : i64
      }
      %1913 = func.call @cc_errorp(%1866) : (i64) -> i64
      %1914 = arith.cmpi ne, %1913, %1887 : i64
      %1915 = arith.cmpi eq, %1912, %1887 : i64
      %1916 = arith.andi %1914, %1915 : i1
      %1917 = scf.if %1916 -> (i64) {
        scf.yield %1866 : i64
      } else {
        scf.yield %1912 : i64
      }
      %1918 = func.call @cc_errorp(%1877) : (i64) -> i64
      %1919 = arith.cmpi ne, %1918, %1887 : i64
      %1920 = arith.cmpi eq, %1917, %1887 : i64
      %1921 = arith.andi %1919, %1920 : i1
      %1922 = scf.if %1921 -> (i64) {
        scf.yield %1877 : i64
      } else {
        scf.yield %1917 : i64
      }
      %1923 = func.call @cc_errorp(%1886) : (i64) -> i64
      %1924 = arith.cmpi ne, %1923, %1887 : i64
      %1925 = arith.cmpi eq, %1922, %1887 : i64
      %1926 = arith.andi %1924, %1925 : i1
      %1927 = scf.if %1926 -> (i64) {
        scf.yield %1886 : i64
      } else {
        scf.yield %1922 : i64
      }
      %1928 = arith.cmpi ne, %1927, %1887 : i64
      scf.if %1928 {
        func.call @stack_push_pointer(%1927) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1587) : (i64) -> ()
        func.call @stack_push_pointer(%1771) : (i64) -> ()
        func.call @stack_push_pointer(%1842) : (i64) -> ()
        func.call @stack_push_pointer(%1854) : (i64) -> ()
        func.call @stack_push_pointer(%1865) : (i64) -> ()
        func.call @stack_push_pointer(%1866) : (i64) -> ()
        func.call @stack_push_pointer(%1877) : (i64) -> ()
        func.call @stack_push_pointer(%1886) : (i64) -> ()
        %1929 = llvm.mlir.addressof @str164 : !llvm.ptr
        %1930 = func.call @cc_make_function_ref_const(%1929) : (!llvm.ptr) -> i64
        %1931 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1930, %1931) : (i64, i64) -> ()
      }
      %1932 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1932 : i64
    }
    %1933 = func.call @cc_nil_value() : () -> i64
    %1934 = func.call @cc_errorp(%1578) : (i64) -> i64
    %1935 = arith.cmpi ne, %1934, %1933 : i64
    %1936 = scf.if %1935 -> (i64) {
      scf.yield %1578 : i64
    } else {
      %1937 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1938 = arith.constant 17 : i64
      %1939 = func.call @cc_make_string(%1937, %1938) : (!llvm.ptr, i64) -> i64
      %1940 = func.call @cc_nil_value() : () -> i64
      %1941 = func.call @cc_intern(%1939, %1940) : (i64, i64) -> i64
      %1942 = func.call @cc_nil_value() : () -> i64
      %1943 = func.call @cc_cons(%1941, %1942) : (i64, i64) -> i64
      %1944 = func.call @cc_values_pack(%1943) : (i64) -> i64
      func.call @stack_push_pointer(%1941) : (i64) -> ()
      %1945 = func.call @stack_pop_pointer() : () -> i64
      %1946 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1947 = arith.constant 10 : i64
      %1948 = func.call @cc_make_string(%1946, %1947) : (!llvm.ptr, i64) -> i64
      %1949 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1950 = arith.constant 11 : i64
      %1951 = func.call @cc_make_string(%1949, %1950) : (!llvm.ptr, i64) -> i64
      %1952 = func.call @cc_intern(%1948, %1951) : (i64, i64) -> i64
      %1953 = func.call @cc_nil_value() : () -> i64
      %1954 = func.call @cc_cons(%1952, %1953) : (i64, i64) -> i64
      %1955 = func.call @cc_values_pack(%1954) : (i64) -> i64
      func.call @stack_push_pointer(%1952) : (i64) -> ()
      %1956 = arith.constant 88 : i64
      %1957 = func.call @cc_box_character(%1956) : (i64) -> i64
      func.call @stack_push_pointer(%1957) : (i64) -> ()
      %1958 = arith.constant 0 : i64
      %1959 = func.call @cc_box_character(%1958) : (i64) -> i64
      func.call @stack_push_pointer(%1959) : (i64) -> ()
      %1960 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1961 = arith.constant 6 : i64
      %1962 = func.call @cc_make_string(%1960, %1961) : (!llvm.ptr, i64) -> i64
      %1963 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1964 = arith.constant 11 : i64
      %1965 = func.call @cc_make_string(%1963, %1964) : (!llvm.ptr, i64) -> i64
      %1966 = func.call @cc_intern(%1962, %1965) : (i64, i64) -> i64
      %1967 = func.call @cc_nil_value() : () -> i64
      %1968 = func.call @cc_cons(%1966, %1967) : (i64, i64) -> i64
      %1969 = func.call @cc_values_pack(%1968) : (i64) -> i64
      func.call @stack_push_pointer(%1966) : (i64) -> ()
      %1970 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1971 = arith.constant 11 : i64
      %1972 = func.call @cc_make_string(%1970, %1971) : (!llvm.ptr, i64) -> i64
      %1973 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1974 = arith.constant 11 : i64
      %1975 = func.call @cc_make_string(%1973, %1974) : (!llvm.ptr, i64) -> i64
      %1976 = func.call @cc_intern(%1972, %1975) : (i64, i64) -> i64
      %1977 = func.call @cc_nil_value() : () -> i64
      %1978 = func.call @cc_cons(%1976, %1977) : (i64, i64) -> i64
      %1979 = func.call @cc_values_pack(%1978) : (i64) -> i64
      func.call @stack_push_pointer(%1976) : (i64) -> ()
      %1980 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1980) : (i64) -> ()
      %1981 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1982 = arith.constant 6 : i64
      %1983 = func.call @cc_make_string(%1981, %1982) : (!llvm.ptr, i64) -> i64
      %1984 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1985 = arith.constant 11 : i64
      %1986 = func.call @cc_make_string(%1984, %1985) : (!llvm.ptr, i64) -> i64
      %1987 = func.call @cc_intern(%1983, %1986) : (i64, i64) -> i64
      %1988 = func.call @cc_nil_value() : () -> i64
      %1989 = func.call @cc_cons(%1987, %1988) : (i64, i64) -> i64
      %1990 = func.call @cc_values_pack(%1989) : (i64) -> i64
      func.call @stack_push_pointer(%1987) : (i64) -> ()
      %1991 = func.call @stack_pop_pointer() : () -> i64
      %1992 = func.call @stack_pop_pointer() : () -> i64
      %1993 = func.call @cc_cons(%1991, %1992) : (i64, i64) -> i64
      %1994 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1995 = arith.constant 5 : i64
      %1996 = func.call @cc_make_string(%1994, %1995) : (!llvm.ptr, i64) -> i64
      %1997 = func.call @cc_nil_value() : () -> i64
      %1998 = func.call @cc_intern(%1996, %1997) : (i64, i64) -> i64
      %1999 = func.call @cc_nil_value() : () -> i64
      %2000 = func.call @cc_cons(%1998, %1999) : (i64, i64) -> i64
      %2001 = func.call @cc_values_pack(%2000) : (i64) -> i64
      %2002 = func.call @cc_cons(%1998, %1993) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2002) : (i64) -> ()
      %2003 = llvm.mlir.addressof @str175 : !llvm.ptr
      %2004 = arith.constant 1 : i64
      %2005 = func.call @cc_make_string(%2003, %2004) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2005) : (i64) -> ()
      %2006 = llvm.mlir.addressof @str176 : !llvm.ptr
      %2007 = arith.constant 11 : i64
      %2008 = func.call @cc_make_string(%2006, %2007) : (!llvm.ptr, i64) -> i64
      %2009 = llvm.mlir.addressof @str177 : !llvm.ptr
      %2010 = arith.constant 11 : i64
      %2011 = func.call @cc_make_string(%2009, %2010) : (!llvm.ptr, i64) -> i64
      %2012 = func.call @cc_intern(%2008, %2011) : (i64, i64) -> i64
      %2013 = func.call @cc_nil_value() : () -> i64
      %2014 = func.call @cc_cons(%2012, %2013) : (i64, i64) -> i64
      %2015 = func.call @cc_values_pack(%2014) : (i64) -> i64
      func.call @stack_push_pointer(%2012) : (i64) -> ()
      %2016 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2016) : (i64) -> ()
      %2017 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2018 = arith.constant 15 : i64
      %2019 = func.call @cc_make_string(%2017, %2018) : (!llvm.ptr, i64) -> i64
      %2020 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2021 = arith.constant 7 : i64
      %2022 = func.call @cc_make_string(%2020, %2021) : (!llvm.ptr, i64) -> i64
      %2023 = func.call @cc_intern(%2019, %2022) : (i64, i64) -> i64
      %2024 = func.call @cc_nil_value() : () -> i64
      %2025 = func.call @cc_cons(%2023, %2024) : (i64, i64) -> i64
      %2026 = func.call @cc_values_pack(%2025) : (i64) -> i64
      func.call @stack_push_pointer(%2023) : (i64) -> ()
      %2027 = arith.constant 0 : i64
      %2028 = func.call @cc_box_character(%2027) : (i64) -> i64
      func.call @stack_push_pointer(%2028) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2029 = func.call @stack_pop_pointer() : () -> i64
      %2030 = func.call @stack_pop_pointer() : () -> i64
      %2031 = func.call @cc_cons(%2030, %2029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2031) : (i64) -> ()
      %2032 = func.call @stack_pop_pointer() : () -> i64
      %2033 = func.call @stack_pop_pointer() : () -> i64
      %2034 = func.call @cc_cons(%2033, %2032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2034) : (i64) -> ()
      %2035 = func.call @stack_pop_pointer() : () -> i64
      %2036 = func.call @stack_pop_pointer() : () -> i64
      %2037 = func.call @cc_cons(%2036, %2035) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2037) : (i64) -> ()
      %2038 = func.call @stack_pop_pointer() : () -> i64
      %2039 = func.call @stack_pop_pointer() : () -> i64
      %2040 = func.call @cc_cons(%2039, %2038) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2040) : (i64) -> ()
      %2041 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2042 = arith.constant 3 : i64
      %2043 = func.call @cc_make_string(%2041, %2042) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2043) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2044 = func.call @stack_pop_pointer() : () -> i64
      %2045 = func.call @stack_pop_pointer() : () -> i64
      %2046 = func.call @cc_cons(%2045, %2044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2046) : (i64) -> ()
      %2047 = func.call @stack_pop_pointer() : () -> i64
      %2048 = func.call @stack_pop_pointer() : () -> i64
      %2049 = func.call @cc_cons(%2048, %2047) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2049) : (i64) -> ()
      %2050 = func.call @stack_pop_pointer() : () -> i64
      %2051 = func.call @stack_pop_pointer() : () -> i64
      %2052 = func.call @cc_cons(%2051, %2050) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2052) : (i64) -> ()
      %2053 = func.call @stack_pop_pointer() : () -> i64
      %2054 = func.call @stack_pop_pointer() : () -> i64
      %2055 = func.call @cc_cons(%2054, %2053) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2055) : (i64) -> ()
      %2056 = func.call @stack_pop_pointer() : () -> i64
      %2057 = func.call @stack_pop_pointer() : () -> i64
      %2058 = func.call @cc_cons(%2057, %2056) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2058) : (i64) -> ()
      %2059 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2059) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2060 = func.call @stack_pop_pointer() : () -> i64
      %2061 = func.call @stack_pop_pointer() : () -> i64
      %2062 = func.call @cc_cons(%2061, %2060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2062) : (i64) -> ()
      %2063 = func.call @stack_pop_pointer() : () -> i64
      %2064 = func.call @stack_pop_pointer() : () -> i64
      %2065 = func.call @cc_cons(%2064, %2063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2065) : (i64) -> ()
      %2066 = func.call @stack_pop_pointer() : () -> i64
      %2067 = func.call @stack_pop_pointer() : () -> i64
      %2068 = func.call @cc_cons(%2067, %2066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2068) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2069 = func.call @stack_pop_pointer() : () -> i64
      %2070 = func.call @stack_pop_pointer() : () -> i64
      %2071 = func.call @cc_cons(%2070, %2069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2071) : (i64) -> ()
      %2072 = func.call @stack_pop_pointer() : () -> i64
      %2073 = func.call @stack_pop_pointer() : () -> i64
      %2074 = func.call @cc_cons(%2073, %2072) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2074) : (i64) -> ()
      %2075 = func.call @stack_pop_pointer() : () -> i64
      %2076 = func.call @stack_pop_pointer() : () -> i64
      %2077 = func.call @cc_cons(%2076, %2075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2077) : (i64) -> ()
      %2078 = func.call @stack_pop_pointer() : () -> i64
      %2079 = func.call @stack_pop_pointer() : () -> i64
      %2080 = func.call @cc_cons(%2079, %2078) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2080) : (i64) -> ()
      %2081 = func.call @stack_pop_pointer() : () -> i64
      %2133 = arith.constant 122791386939400 : i64
      %2134 = arith.constant 0 : i64
      %2135 = func.call @cc_make_closure(%2133, %2134) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2135) : (i64) -> ()
      %2136 = func.call @stack_pop_pointer() : () -> i64
      %2137 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2138 = arith.constant 7 : i64
      %2139 = func.call @cc_make_string(%2137, %2138) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2139) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2140 = func.call @stack_pop_pointer() : () -> i64
      %2141 = func.call @stack_pop_pointer() : () -> i64
      %2142 = func.call @cc_cons(%2141, %2140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2142) : (i64) -> ()
      %2143 = func.call @stack_pop_pointer() : () -> i64
      %2144 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2145 = arith.constant 11 : i64
      %2146 = func.call @cc_make_string(%2144, %2145) : (!llvm.ptr, i64) -> i64
      %2147 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2148 = arith.constant 7 : i64
      %2149 = func.call @cc_make_string(%2147, %2148) : (!llvm.ptr, i64) -> i64
      %2150 = func.call @cc_intern(%2146, %2149) : (i64, i64) -> i64
      %2151 = func.call @cc_nil_value() : () -> i64
      %2152 = func.call @cc_cons(%2150, %2151) : (i64, i64) -> i64
      %2153 = func.call @cc_values_pack(%2152) : (i64) -> i64
      func.call @stack_push_pointer(%2150) : (i64) -> ()
      %2154 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2155 = func.call @stack_pop_pointer() : () -> i64
      %2156 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2157 = arith.constant 4 : i64
      %2158 = func.call @cc_make_string(%2156, %2157) : (!llvm.ptr, i64) -> i64
      %2159 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2160 = arith.constant 7 : i64
      %2161 = func.call @cc_make_string(%2159, %2160) : (!llvm.ptr, i64) -> i64
      %2162 = func.call @cc_intern(%2158, %2161) : (i64, i64) -> i64
      %2163 = func.call @cc_nil_value() : () -> i64
      %2164 = func.call @cc_cons(%2162, %2163) : (i64, i64) -> i64
      %2165 = func.call @cc_values_pack(%2164) : (i64) -> i64
      func.call @stack_push_pointer(%2162) : (i64) -> ()
      %2166 = func.call @stack_pop_pointer() : () -> i64
      %2167 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2168 = arith.constant 7 : i64
      %2169 = func.call @cc_make_string(%2167, %2168) : (!llvm.ptr, i64) -> i64
      %2170 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2171 = arith.constant 11 : i64
      %2172 = func.call @cc_make_string(%2170, %2171) : (!llvm.ptr, i64) -> i64
      %2173 = func.call @cc_intern(%2169, %2172) : (i64, i64) -> i64
      %2174 = func.call @cc_nil_value() : () -> i64
      %2175 = func.call @cc_cons(%2173, %2174) : (i64, i64) -> i64
      %2176 = func.call @cc_values_pack(%2175) : (i64) -> i64
      func.call @stack_push_pointer(%2173) : (i64) -> ()
      %2177 = func.call @stack_pop_pointer() : () -> i64
      %2178 = func.call @cc_nil_value() : () -> i64
      %2179 = func.call @cc_errorp(%1945) : (i64) -> i64
      %2180 = arith.cmpi ne, %2179, %2178 : i64
      %2181 = arith.cmpi eq, %2178, %2178 : i64
      %2182 = arith.andi %2180, %2181 : i1
      %2183 = scf.if %2182 -> (i64) {
        scf.yield %1945 : i64
      } else {
        scf.yield %2178 : i64
      }
      %2184 = func.call @cc_errorp(%2081) : (i64) -> i64
      %2185 = arith.cmpi ne, %2184, %2178 : i64
      %2186 = arith.cmpi eq, %2183, %2178 : i64
      %2187 = arith.andi %2185, %2186 : i1
      %2188 = scf.if %2187 -> (i64) {
        scf.yield %2081 : i64
      } else {
        scf.yield %2183 : i64
      }
      %2189 = func.call @cc_errorp(%2136) : (i64) -> i64
      %2190 = arith.cmpi ne, %2189, %2178 : i64
      %2191 = arith.cmpi eq, %2188, %2178 : i64
      %2192 = arith.andi %2190, %2191 : i1
      %2193 = scf.if %2192 -> (i64) {
        scf.yield %2136 : i64
      } else {
        scf.yield %2188 : i64
      }
      %2194 = func.call @cc_errorp(%2143) : (i64) -> i64
      %2195 = arith.cmpi ne, %2194, %2178 : i64
      %2196 = arith.cmpi eq, %2193, %2178 : i64
      %2197 = arith.andi %2195, %2196 : i1
      %2198 = scf.if %2197 -> (i64) {
        scf.yield %2143 : i64
      } else {
        scf.yield %2193 : i64
      }
      %2199 = func.call @cc_errorp(%2154) : (i64) -> i64
      %2200 = arith.cmpi ne, %2199, %2178 : i64
      %2201 = arith.cmpi eq, %2198, %2178 : i64
      %2202 = arith.andi %2200, %2201 : i1
      %2203 = scf.if %2202 -> (i64) {
        scf.yield %2154 : i64
      } else {
        scf.yield %2198 : i64
      }
      %2204 = func.call @cc_errorp(%2155) : (i64) -> i64
      %2205 = arith.cmpi ne, %2204, %2178 : i64
      %2206 = arith.cmpi eq, %2203, %2178 : i64
      %2207 = arith.andi %2205, %2206 : i1
      %2208 = scf.if %2207 -> (i64) {
        scf.yield %2155 : i64
      } else {
        scf.yield %2203 : i64
      }
      %2209 = func.call @cc_errorp(%2166) : (i64) -> i64
      %2210 = arith.cmpi ne, %2209, %2178 : i64
      %2211 = arith.cmpi eq, %2208, %2178 : i64
      %2212 = arith.andi %2210, %2211 : i1
      %2213 = scf.if %2212 -> (i64) {
        scf.yield %2166 : i64
      } else {
        scf.yield %2208 : i64
      }
      %2214 = func.call @cc_errorp(%2177) : (i64) -> i64
      %2215 = arith.cmpi ne, %2214, %2178 : i64
      %2216 = arith.cmpi eq, %2213, %2178 : i64
      %2217 = arith.andi %2215, %2216 : i1
      %2218 = scf.if %2217 -> (i64) {
        scf.yield %2177 : i64
      } else {
        scf.yield %2213 : i64
      }
      %2219 = arith.cmpi ne, %2218, %2178 : i64
      scf.if %2219 {
        func.call @stack_push_pointer(%2218) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1945) : (i64) -> ()
        func.call @stack_push_pointer(%2081) : (i64) -> ()
        func.call @stack_push_pointer(%2136) : (i64) -> ()
        func.call @stack_push_pointer(%2143) : (i64) -> ()
        func.call @stack_push_pointer(%2154) : (i64) -> ()
        func.call @stack_push_pointer(%2155) : (i64) -> ()
        func.call @stack_push_pointer(%2166) : (i64) -> ()
        func.call @stack_push_pointer(%2177) : (i64) -> ()
        %2220 = llvm.mlir.addressof @str192 : !llvm.ptr
        %2221 = func.call @cc_make_function_ref_const(%2220) : (!llvm.ptr) -> i64
        %2222 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2221, %2222) : (i64, i64) -> ()
      }
      %2223 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2223 : i64
    }
    %2224 = func.call @cc_nil_value() : () -> i64
    %2225 = func.call @cc_errorp(%1936) : (i64) -> i64
    %2226 = arith.cmpi ne, %2225, %2224 : i64
    %2227 = scf.if %2226 -> (i64) {
      scf.yield %1936 : i64
    } else {
      %2228 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2229 = arith.constant 14 : i64
      %2230 = func.call @cc_make_string(%2228, %2229) : (!llvm.ptr, i64) -> i64
      %2231 = func.call @cc_nil_value() : () -> i64
      %2232 = func.call @cc_intern(%2230, %2231) : (i64, i64) -> i64
      %2233 = func.call @cc_nil_value() : () -> i64
      %2234 = func.call @cc_cons(%2232, %2233) : (i64, i64) -> i64
      %2235 = func.call @cc_values_pack(%2234) : (i64) -> i64
      func.call @stack_push_pointer(%2232) : (i64) -> ()
      %2236 = func.call @stack_pop_pointer() : () -> i64
      %2237 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2238 = arith.constant 13 : i64
      %2239 = func.call @cc_make_string(%2237, %2238) : (!llvm.ptr, i64) -> i64
      %2240 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2241 = arith.constant 11 : i64
      %2242 = func.call @cc_make_string(%2240, %2241) : (!llvm.ptr, i64) -> i64
      %2243 = func.call @cc_intern(%2239, %2242) : (i64, i64) -> i64
      %2244 = func.call @cc_nil_value() : () -> i64
      %2245 = func.call @cc_cons(%2243, %2244) : (i64, i64) -> i64
      %2246 = func.call @cc_values_pack(%2245) : (i64) -> i64
      func.call @stack_push_pointer(%2243) : (i64) -> ()
      %2247 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2248 = arith.constant 6 : i64
      %2249 = func.call @cc_make_string(%2247, %2248) : (!llvm.ptr, i64) -> i64
      %2250 = func.call @cc_nil_value() : () -> i64
      %2251 = func.call @cc_intern(%2249, %2250) : (i64, i64) -> i64
      %2252 = func.call @cc_nil_value() : () -> i64
      %2253 = func.call @cc_cons(%2251, %2252) : (i64, i64) -> i64
      %2254 = func.call @cc_values_pack(%2253) : (i64) -> i64
      func.call @stack_push_pointer(%2251) : (i64) -> ()
      %2255 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2256 = arith.constant 19 : i64
      %2257 = func.call @cc_make_string(%2255, %2256) : (!llvm.ptr, i64) -> i64
      %2258 = func.call @cc_nil_value() : () -> i64
      %2259 = func.call @cc_intern(%2257, %2258) : (i64, i64) -> i64
      %2260 = func.call @cc_nil_value() : () -> i64
      %2261 = func.call @cc_cons(%2259, %2260) : (i64, i64) -> i64
      %2262 = func.call @cc_values_pack(%2261) : (i64) -> i64
      func.call @stack_push_pointer(%2259) : (i64) -> ()
      %2263 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2264 = arith.constant 13 : i64
      %2265 = func.call @cc_make_string(%2263, %2264) : (!llvm.ptr, i64) -> i64
      %2266 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2267 = arith.constant 11 : i64
      %2268 = func.call @cc_make_string(%2266, %2267) : (!llvm.ptr, i64) -> i64
      %2269 = func.call @cc_intern(%2265, %2268) : (i64, i64) -> i64
      %2270 = func.call @cc_nil_value() : () -> i64
      %2271 = func.call @cc_cons(%2269, %2270) : (i64, i64) -> i64
      %2272 = func.call @cc_values_pack(%2271) : (i64) -> i64
      func.call @stack_push_pointer(%2269) : (i64) -> ()
      %2273 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2274 = arith.constant 7 : i64
      %2275 = func.call @cc_make_string(%2273, %2274) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2275) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2276 = func.call @stack_pop_pointer() : () -> i64
      %2277 = func.call @stack_pop_pointer() : () -> i64
      %2278 = func.call @cc_cons(%2277, %2276) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2278) : (i64) -> ()
      %2279 = func.call @stack_pop_pointer() : () -> i64
      %2280 = func.call @stack_pop_pointer() : () -> i64
      %2281 = func.call @cc_cons(%2280, %2279) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2281) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2282 = func.call @stack_pop_pointer() : () -> i64
      %2283 = func.call @stack_pop_pointer() : () -> i64
      %2284 = func.call @cc_cons(%2283, %2282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2284) : (i64) -> ()
      %2285 = func.call @stack_pop_pointer() : () -> i64
      %2286 = func.call @stack_pop_pointer() : () -> i64
      %2287 = func.call @cc_cons(%2286, %2285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2287) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2288 = func.call @stack_pop_pointer() : () -> i64
      %2289 = func.call @stack_pop_pointer() : () -> i64
      %2290 = func.call @cc_cons(%2289, %2288) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2290) : (i64) -> ()
      %2291 = func.call @stack_pop_pointer() : () -> i64
      %2292 = func.call @stack_pop_pointer() : () -> i64
      %2293 = func.call @cc_cons(%2292, %2291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2293) : (i64) -> ()
      %2294 = func.call @stack_pop_pointer() : () -> i64
      %2295 = func.call @stack_pop_pointer() : () -> i64
      %2296 = func.call @cc_cons(%2295, %2294) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2296) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2297 = func.call @stack_pop_pointer() : () -> i64
      %2298 = func.call @stack_pop_pointer() : () -> i64
      %2299 = func.call @cc_cons(%2298, %2297) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2299) : (i64) -> ()
      %2300 = func.call @stack_pop_pointer() : () -> i64
      %2301 = func.call @stack_pop_pointer() : () -> i64
      %2302 = func.call @cc_cons(%2301, %2300) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2302) : (i64) -> ()
      %2303 = func.call @stack_pop_pointer() : () -> i64
      %2361 = arith.constant 122791386939401 : i64
      %2362 = arith.constant 0 : i64
      %2363 = func.call @cc_make_closure(%2361, %2362) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2363) : (i64) -> ()
      %2364 = func.call @stack_pop_pointer() : () -> i64
      %2365 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2366 = arith.constant 4 : i64
      %2367 = func.call @cc_make_string(%2365, %2366) : (!llvm.ptr, i64) -> i64
      %2368 = func.call @cc_nil_value() : () -> i64
      %2369 = func.call @cc_intern(%2367, %2368) : (i64, i64) -> i64
      %2370 = func.call @cc_nil_value() : () -> i64
      %2371 = func.call @cc_cons(%2369, %2370) : (i64, i64) -> i64
      %2372 = func.call @cc_values_pack(%2371) : (i64) -> i64
      func.call @stack_push_pointer(%2369) : (i64) -> ()
      %2373 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2374 = arith.constant 11 : i64
      %2375 = func.call @cc_make_string(%2373, %2374) : (!llvm.ptr, i64) -> i64
      %2376 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2377 = arith.constant 11 : i64
      %2378 = func.call @cc_make_string(%2376, %2377) : (!llvm.ptr, i64) -> i64
      %2379 = func.call @cc_intern(%2375, %2378) : (i64, i64) -> i64
      %2380 = func.call @cc_nil_value() : () -> i64
      %2381 = func.call @cc_cons(%2379, %2380) : (i64, i64) -> i64
      %2382 = func.call @cc_values_pack(%2381) : (i64) -> i64
      func.call @stack_push_pointer(%2379) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2383 = func.call @stack_pop_pointer() : () -> i64
      %2384 = func.call @stack_pop_pointer() : () -> i64
      %2385 = func.call @cc_cons(%2384, %2383) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2385) : (i64) -> ()
      %2386 = func.call @stack_pop_pointer() : () -> i64
      %2387 = func.call @stack_pop_pointer() : () -> i64
      %2388 = func.call @cc_cons(%2387, %2386) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2388) : (i64) -> ()
      %2389 = func.call @stack_pop_pointer() : () -> i64
      %2390 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2391 = arith.constant 11 : i64
      %2392 = func.call @cc_make_string(%2390, %2391) : (!llvm.ptr, i64) -> i64
      %2393 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2394 = arith.constant 7 : i64
      %2395 = func.call @cc_make_string(%2393, %2394) : (!llvm.ptr, i64) -> i64
      %2396 = func.call @cc_intern(%2392, %2395) : (i64, i64) -> i64
      %2397 = func.call @cc_nil_value() : () -> i64
      %2398 = func.call @cc_cons(%2396, %2397) : (i64, i64) -> i64
      %2399 = func.call @cc_values_pack(%2398) : (i64) -> i64
      func.call @stack_push_pointer(%2396) : (i64) -> ()
      %2400 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2401 = func.call @stack_pop_pointer() : () -> i64
      %2402 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2403 = arith.constant 4 : i64
      %2404 = func.call @cc_make_string(%2402, %2403) : (!llvm.ptr, i64) -> i64
      %2405 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2406 = arith.constant 7 : i64
      %2407 = func.call @cc_make_string(%2405, %2406) : (!llvm.ptr, i64) -> i64
      %2408 = func.call @cc_intern(%2404, %2407) : (i64, i64) -> i64
      %2409 = func.call @cc_nil_value() : () -> i64
      %2410 = func.call @cc_cons(%2408, %2409) : (i64, i64) -> i64
      %2411 = func.call @cc_values_pack(%2410) : (i64) -> i64
      func.call @stack_push_pointer(%2408) : (i64) -> ()
      %2412 = func.call @stack_pop_pointer() : () -> i64
      %2413 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2414 = arith.constant 5 : i64
      %2415 = func.call @cc_make_string(%2413, %2414) : (!llvm.ptr, i64) -> i64
      %2416 = func.call @cc_nil_value() : () -> i64
      %2417 = func.call @cc_intern(%2415, %2416) : (i64, i64) -> i64
      %2418 = func.call @cc_nil_value() : () -> i64
      %2419 = func.call @cc_cons(%2417, %2418) : (i64, i64) -> i64
      %2420 = func.call @cc_values_pack(%2419) : (i64) -> i64
      func.call @stack_push_pointer(%2417) : (i64) -> ()
      %2421 = func.call @stack_pop_pointer() : () -> i64
      %2422 = func.call @cc_nil_value() : () -> i64
      %2423 = func.call @cc_errorp(%2236) : (i64) -> i64
      %2424 = arith.cmpi ne, %2423, %2422 : i64
      %2425 = arith.cmpi eq, %2422, %2422 : i64
      %2426 = arith.andi %2424, %2425 : i1
      %2427 = scf.if %2426 -> (i64) {
        scf.yield %2236 : i64
      } else {
        scf.yield %2422 : i64
      }
      %2428 = func.call @cc_errorp(%2303) : (i64) -> i64
      %2429 = arith.cmpi ne, %2428, %2422 : i64
      %2430 = arith.cmpi eq, %2427, %2422 : i64
      %2431 = arith.andi %2429, %2430 : i1
      %2432 = scf.if %2431 -> (i64) {
        scf.yield %2303 : i64
      } else {
        scf.yield %2427 : i64
      }
      %2433 = func.call @cc_errorp(%2364) : (i64) -> i64
      %2434 = arith.cmpi ne, %2433, %2422 : i64
      %2435 = arith.cmpi eq, %2432, %2422 : i64
      %2436 = arith.andi %2434, %2435 : i1
      %2437 = scf.if %2436 -> (i64) {
        scf.yield %2364 : i64
      } else {
        scf.yield %2432 : i64
      }
      %2438 = func.call @cc_errorp(%2389) : (i64) -> i64
      %2439 = arith.cmpi ne, %2438, %2422 : i64
      %2440 = arith.cmpi eq, %2437, %2422 : i64
      %2441 = arith.andi %2439, %2440 : i1
      %2442 = scf.if %2441 -> (i64) {
        scf.yield %2389 : i64
      } else {
        scf.yield %2437 : i64
      }
      %2443 = func.call @cc_errorp(%2400) : (i64) -> i64
      %2444 = arith.cmpi ne, %2443, %2422 : i64
      %2445 = arith.cmpi eq, %2442, %2422 : i64
      %2446 = arith.andi %2444, %2445 : i1
      %2447 = scf.if %2446 -> (i64) {
        scf.yield %2400 : i64
      } else {
        scf.yield %2442 : i64
      }
      %2448 = func.call @cc_errorp(%2401) : (i64) -> i64
      %2449 = arith.cmpi ne, %2448, %2422 : i64
      %2450 = arith.cmpi eq, %2447, %2422 : i64
      %2451 = arith.andi %2449, %2450 : i1
      %2452 = scf.if %2451 -> (i64) {
        scf.yield %2401 : i64
      } else {
        scf.yield %2447 : i64
      }
      %2453 = func.call @cc_errorp(%2412) : (i64) -> i64
      %2454 = arith.cmpi ne, %2453, %2422 : i64
      %2455 = arith.cmpi eq, %2452, %2422 : i64
      %2456 = arith.andi %2454, %2455 : i1
      %2457 = scf.if %2456 -> (i64) {
        scf.yield %2412 : i64
      } else {
        scf.yield %2452 : i64
      }
      %2458 = func.call @cc_errorp(%2421) : (i64) -> i64
      %2459 = arith.cmpi ne, %2458, %2422 : i64
      %2460 = arith.cmpi eq, %2457, %2422 : i64
      %2461 = arith.andi %2459, %2460 : i1
      %2462 = scf.if %2461 -> (i64) {
        scf.yield %2421 : i64
      } else {
        scf.yield %2457 : i64
      }
      %2463 = arith.cmpi ne, %2462, %2422 : i64
      scf.if %2463 {
        func.call @stack_push_pointer(%2462) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2236) : (i64) -> ()
        func.call @stack_push_pointer(%2303) : (i64) -> ()
        func.call @stack_push_pointer(%2364) : (i64) -> ()
        func.call @stack_push_pointer(%2389) : (i64) -> ()
        func.call @stack_push_pointer(%2400) : (i64) -> ()
        func.call @stack_push_pointer(%2401) : (i64) -> ()
        func.call @stack_push_pointer(%2412) : (i64) -> ()
        func.call @stack_push_pointer(%2421) : (i64) -> ()
        %2464 = llvm.mlir.addressof @str211 : !llvm.ptr
        %2465 = func.call @cc_make_function_ref_const(%2464) : (!llvm.ptr) -> i64
        %2466 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2465, %2466) : (i64, i64) -> ()
      }
      %2467 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2467 : i64
    }
    %2468 = func.call @cc_nil_value() : () -> i64
    %2469 = func.call @cc_errorp(%2227) : (i64) -> i64
    %2470 = arith.cmpi ne, %2469, %2468 : i64
    %2471 = scf.if %2470 -> (i64) {
      scf.yield %2227 : i64
    } else {
      %2472 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2473 = arith.constant 14 : i64
      %2474 = func.call @cc_make_string(%2472, %2473) : (!llvm.ptr, i64) -> i64
      %2475 = func.call @cc_nil_value() : () -> i64
      %2476 = func.call @cc_intern(%2474, %2475) : (i64, i64) -> i64
      %2477 = func.call @cc_nil_value() : () -> i64
      %2478 = func.call @cc_cons(%2476, %2477) : (i64, i64) -> i64
      %2479 = func.call @cc_values_pack(%2478) : (i64) -> i64
      func.call @stack_push_pointer(%2476) : (i64) -> ()
      %2480 = func.call @stack_pop_pointer() : () -> i64
      %2481 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2482 = arith.constant 13 : i64
      %2483 = func.call @cc_make_string(%2481, %2482) : (!llvm.ptr, i64) -> i64
      %2484 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2485 = arith.constant 11 : i64
      %2486 = func.call @cc_make_string(%2484, %2485) : (!llvm.ptr, i64) -> i64
      %2487 = func.call @cc_intern(%2483, %2486) : (i64, i64) -> i64
      %2488 = func.call @cc_nil_value() : () -> i64
      %2489 = func.call @cc_cons(%2487, %2488) : (i64, i64) -> i64
      %2490 = func.call @cc_values_pack(%2489) : (i64) -> i64
      func.call @stack_push_pointer(%2487) : (i64) -> ()
      %2491 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2492 = arith.constant 5 : i64
      %2493 = func.call @cc_make_string(%2491, %2492) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2493) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2494 = func.call @stack_pop_pointer() : () -> i64
      %2495 = func.call @stack_pop_pointer() : () -> i64
      %2496 = func.call @cc_cons(%2495, %2494) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2496) : (i64) -> ()
      %2497 = func.call @stack_pop_pointer() : () -> i64
      %2498 = func.call @stack_pop_pointer() : () -> i64
      %2499 = func.call @cc_cons(%2498, %2497) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2499) : (i64) -> ()
      %2500 = func.call @stack_pop_pointer() : () -> i64
      %2521 = arith.constant 122791386939402 : i64
      %2522 = arith.constant 0 : i64
      %2523 = func.call @cc_make_closure(%2521, %2522) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2523) : (i64) -> ()
      %2524 = func.call @stack_pop_pointer() : () -> i64
      %2525 = arith.constant 123 : i64
      func.call @stack_push_fixnum(%2525) : (i64) -> ()
      %2526 = arith.constant 5 : i64
      func.call @stack_push_fixnum(%2526) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2527 = func.call @stack_pop_pointer() : () -> i64
      %2528 = func.call @stack_pop_pointer() : () -> i64
      %2529 = func.call @cc_cons(%2528, %2527) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2529) : (i64) -> ()
      %2530 = func.call @stack_pop_pointer() : () -> i64
      %2531 = func.call @stack_pop_pointer() : () -> i64
      %2532 = func.call @cc_cons(%2531, %2530) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2532) : (i64) -> ()
      %2533 = func.call @stack_pop_pointer() : () -> i64
      %2534 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2535 = arith.constant 11 : i64
      %2536 = func.call @cc_make_string(%2534, %2535) : (!llvm.ptr, i64) -> i64
      %2537 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2538 = arith.constant 7 : i64
      %2539 = func.call @cc_make_string(%2537, %2538) : (!llvm.ptr, i64) -> i64
      %2540 = func.call @cc_intern(%2536, %2539) : (i64, i64) -> i64
      %2541 = func.call @cc_nil_value() : () -> i64
      %2542 = func.call @cc_cons(%2540, %2541) : (i64, i64) -> i64
      %2543 = func.call @cc_values_pack(%2542) : (i64) -> i64
      func.call @stack_push_pointer(%2540) : (i64) -> ()
      %2544 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2545 = func.call @stack_pop_pointer() : () -> i64
      %2546 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2547 = arith.constant 4 : i64
      %2548 = func.call @cc_make_string(%2546, %2547) : (!llvm.ptr, i64) -> i64
      %2549 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2550 = arith.constant 7 : i64
      %2551 = func.call @cc_make_string(%2549, %2550) : (!llvm.ptr, i64) -> i64
      %2552 = func.call @cc_intern(%2548, %2551) : (i64, i64) -> i64
      %2553 = func.call @cc_nil_value() : () -> i64
      %2554 = func.call @cc_cons(%2552, %2553) : (i64, i64) -> i64
      %2555 = func.call @cc_values_pack(%2554) : (i64) -> i64
      func.call @stack_push_pointer(%2552) : (i64) -> ()
      %2556 = func.call @stack_pop_pointer() : () -> i64
      %2557 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2558 = arith.constant 6 : i64
      %2559 = func.call @cc_make_string(%2557, %2558) : (!llvm.ptr, i64) -> i64
      %2560 = func.call @cc_nil_value() : () -> i64
      %2561 = func.call @cc_intern(%2559, %2560) : (i64, i64) -> i64
      %2562 = func.call @cc_nil_value() : () -> i64
      %2563 = func.call @cc_cons(%2561, %2562) : (i64, i64) -> i64
      %2564 = func.call @cc_values_pack(%2563) : (i64) -> i64
      func.call @stack_push_pointer(%2561) : (i64) -> ()
      %2565 = func.call @stack_pop_pointer() : () -> i64
      %2566 = func.call @cc_nil_value() : () -> i64
      %2567 = func.call @cc_errorp(%2480) : (i64) -> i64
      %2568 = arith.cmpi ne, %2567, %2566 : i64
      %2569 = arith.cmpi eq, %2566, %2566 : i64
      %2570 = arith.andi %2568, %2569 : i1
      %2571 = scf.if %2570 -> (i64) {
        scf.yield %2480 : i64
      } else {
        scf.yield %2566 : i64
      }
      %2572 = func.call @cc_errorp(%2500) : (i64) -> i64
      %2573 = arith.cmpi ne, %2572, %2566 : i64
      %2574 = arith.cmpi eq, %2571, %2566 : i64
      %2575 = arith.andi %2573, %2574 : i1
      %2576 = scf.if %2575 -> (i64) {
        scf.yield %2500 : i64
      } else {
        scf.yield %2571 : i64
      }
      %2577 = func.call @cc_errorp(%2524) : (i64) -> i64
      %2578 = arith.cmpi ne, %2577, %2566 : i64
      %2579 = arith.cmpi eq, %2576, %2566 : i64
      %2580 = arith.andi %2578, %2579 : i1
      %2581 = scf.if %2580 -> (i64) {
        scf.yield %2524 : i64
      } else {
        scf.yield %2576 : i64
      }
      %2582 = func.call @cc_errorp(%2533) : (i64) -> i64
      %2583 = arith.cmpi ne, %2582, %2566 : i64
      %2584 = arith.cmpi eq, %2581, %2566 : i64
      %2585 = arith.andi %2583, %2584 : i1
      %2586 = scf.if %2585 -> (i64) {
        scf.yield %2533 : i64
      } else {
        scf.yield %2581 : i64
      }
      %2587 = func.call @cc_errorp(%2544) : (i64) -> i64
      %2588 = arith.cmpi ne, %2587, %2566 : i64
      %2589 = arith.cmpi eq, %2586, %2566 : i64
      %2590 = arith.andi %2588, %2589 : i1
      %2591 = scf.if %2590 -> (i64) {
        scf.yield %2544 : i64
      } else {
        scf.yield %2586 : i64
      }
      %2592 = func.call @cc_errorp(%2545) : (i64) -> i64
      %2593 = arith.cmpi ne, %2592, %2566 : i64
      %2594 = arith.cmpi eq, %2591, %2566 : i64
      %2595 = arith.andi %2593, %2594 : i1
      %2596 = scf.if %2595 -> (i64) {
        scf.yield %2545 : i64
      } else {
        scf.yield %2591 : i64
      }
      %2597 = func.call @cc_errorp(%2556) : (i64) -> i64
      %2598 = arith.cmpi ne, %2597, %2566 : i64
      %2599 = arith.cmpi eq, %2596, %2566 : i64
      %2600 = arith.andi %2598, %2599 : i1
      %2601 = scf.if %2600 -> (i64) {
        scf.yield %2556 : i64
      } else {
        scf.yield %2596 : i64
      }
      %2602 = func.call @cc_errorp(%2565) : (i64) -> i64
      %2603 = arith.cmpi ne, %2602, %2566 : i64
      %2604 = arith.cmpi eq, %2601, %2566 : i64
      %2605 = arith.andi %2603, %2604 : i1
      %2606 = scf.if %2605 -> (i64) {
        scf.yield %2565 : i64
      } else {
        scf.yield %2601 : i64
      }
      %2607 = arith.cmpi ne, %2606, %2566 : i64
      scf.if %2607 {
        func.call @stack_push_pointer(%2606) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2480) : (i64) -> ()
        func.call @stack_push_pointer(%2500) : (i64) -> ()
        func.call @stack_push_pointer(%2524) : (i64) -> ()
        func.call @stack_push_pointer(%2533) : (i64) -> ()
        func.call @stack_push_pointer(%2544) : (i64) -> ()
        func.call @stack_push_pointer(%2545) : (i64) -> ()
        func.call @stack_push_pointer(%2556) : (i64) -> ()
        func.call @stack_push_pointer(%2565) : (i64) -> ()
        %2608 = llvm.mlir.addressof @str223 : !llvm.ptr
        %2609 = func.call @cc_make_function_ref_const(%2608) : (!llvm.ptr) -> i64
        %2610 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2609, %2610) : (i64, i64) -> ()
      }
      %2611 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2611 : i64
    }
    %2612 = func.call @cc_nil_value() : () -> i64
    %2613 = func.call @cc_errorp(%2471) : (i64) -> i64
    %2614 = arith.cmpi ne, %2613, %2612 : i64
    %2615 = scf.if %2614 -> (i64) {
      scf.yield %2471 : i64
    } else {
      %2616 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2617 = arith.constant 14 : i64
      %2618 = func.call @cc_make_string(%2616, %2617) : (!llvm.ptr, i64) -> i64
      %2619 = func.call @cc_nil_value() : () -> i64
      %2620 = func.call @cc_intern(%2618, %2619) : (i64, i64) -> i64
      %2621 = func.call @cc_nil_value() : () -> i64
      %2622 = func.call @cc_cons(%2620, %2621) : (i64, i64) -> i64
      %2623 = func.call @cc_values_pack(%2622) : (i64) -> i64
      func.call @stack_push_pointer(%2620) : (i64) -> ()
      %2624 = func.call @stack_pop_pointer() : () -> i64
      %2625 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2626 = arith.constant 13 : i64
      %2627 = func.call @cc_make_string(%2625, %2626) : (!llvm.ptr, i64) -> i64
      %2628 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2629 = arith.constant 11 : i64
      %2630 = func.call @cc_make_string(%2628, %2629) : (!llvm.ptr, i64) -> i64
      %2631 = func.call @cc_intern(%2627, %2630) : (i64, i64) -> i64
      %2632 = func.call @cc_nil_value() : () -> i64
      %2633 = func.call @cc_cons(%2631, %2632) : (i64, i64) -> i64
      %2634 = func.call @cc_values_pack(%2633) : (i64) -> i64
      func.call @stack_push_pointer(%2631) : (i64) -> ()
      %2635 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2636 = arith.constant 6 : i64
      %2637 = func.call @cc_make_string(%2635, %2636) : (!llvm.ptr, i64) -> i64
      %2638 = func.call @cc_nil_value() : () -> i64
      %2639 = func.call @cc_intern(%2637, %2638) : (i64, i64) -> i64
      %2640 = func.call @cc_nil_value() : () -> i64
      %2641 = func.call @cc_cons(%2639, %2640) : (i64, i64) -> i64
      %2642 = func.call @cc_values_pack(%2641) : (i64) -> i64
      func.call @stack_push_pointer(%2639) : (i64) -> ()
      %2643 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2644 = arith.constant 19 : i64
      %2645 = func.call @cc_make_string(%2643, %2644) : (!llvm.ptr, i64) -> i64
      %2646 = func.call @cc_nil_value() : () -> i64
      %2647 = func.call @cc_intern(%2645, %2646) : (i64, i64) -> i64
      %2648 = func.call @cc_nil_value() : () -> i64
      %2649 = func.call @cc_cons(%2647, %2648) : (i64, i64) -> i64
      %2650 = func.call @cc_values_pack(%2649) : (i64) -> i64
      func.call @stack_push_pointer(%2647) : (i64) -> ()
      %2651 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2652 = arith.constant 13 : i64
      %2653 = func.call @cc_make_string(%2651, %2652) : (!llvm.ptr, i64) -> i64
      %2654 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2655 = arith.constant 11 : i64
      %2656 = func.call @cc_make_string(%2654, %2655) : (!llvm.ptr, i64) -> i64
      %2657 = func.call @cc_intern(%2653, %2656) : (i64, i64) -> i64
      %2658 = func.call @cc_nil_value() : () -> i64
      %2659 = func.call @cc_cons(%2657, %2658) : (i64, i64) -> i64
      %2660 = func.call @cc_values_pack(%2659) : (i64) -> i64
      func.call @stack_push_pointer(%2657) : (i64) -> ()
      %2661 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2662 = arith.constant 7 : i64
      %2663 = func.call @cc_make_string(%2661, %2662) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2663) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2664 = func.call @stack_pop_pointer() : () -> i64
      %2665 = func.call @stack_pop_pointer() : () -> i64
      %2666 = func.call @cc_cons(%2665, %2664) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2666) : (i64) -> ()
      %2667 = func.call @stack_pop_pointer() : () -> i64
      %2668 = func.call @stack_pop_pointer() : () -> i64
      %2669 = func.call @cc_cons(%2668, %2667) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2669) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2670 = func.call @stack_pop_pointer() : () -> i64
      %2671 = func.call @stack_pop_pointer() : () -> i64
      %2672 = func.call @cc_cons(%2671, %2670) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2672) : (i64) -> ()
      %2673 = func.call @stack_pop_pointer() : () -> i64
      %2674 = func.call @stack_pop_pointer() : () -> i64
      %2675 = func.call @cc_cons(%2674, %2673) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2675) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2676 = func.call @stack_pop_pointer() : () -> i64
      %2677 = func.call @stack_pop_pointer() : () -> i64
      %2678 = func.call @cc_cons(%2677, %2676) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2678) : (i64) -> ()
      %2679 = func.call @stack_pop_pointer() : () -> i64
      %2680 = func.call @stack_pop_pointer() : () -> i64
      %2681 = func.call @cc_cons(%2680, %2679) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2681) : (i64) -> ()
      %2682 = func.call @stack_pop_pointer() : () -> i64
      %2683 = func.call @stack_pop_pointer() : () -> i64
      %2684 = func.call @cc_cons(%2683, %2682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2684) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2685 = func.call @stack_pop_pointer() : () -> i64
      %2686 = func.call @stack_pop_pointer() : () -> i64
      %2687 = func.call @cc_cons(%2686, %2685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2687) : (i64) -> ()
      %2688 = func.call @stack_pop_pointer() : () -> i64
      %2689 = func.call @stack_pop_pointer() : () -> i64
      %2690 = func.call @cc_cons(%2689, %2688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2690) : (i64) -> ()
      %2691 = func.call @stack_pop_pointer() : () -> i64
      %2749 = arith.constant 122791386939403 : i64
      %2750 = arith.constant 0 : i64
      %2751 = func.call @cc_make_closure(%2749, %2750) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2751) : (i64) -> ()
      %2752 = func.call @stack_pop_pointer() : () -> i64
      %2753 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2754 = arith.constant 4 : i64
      %2755 = func.call @cc_make_string(%2753, %2754) : (!llvm.ptr, i64) -> i64
      %2756 = func.call @cc_nil_value() : () -> i64
      %2757 = func.call @cc_intern(%2755, %2756) : (i64, i64) -> i64
      %2758 = func.call @cc_nil_value() : () -> i64
      %2759 = func.call @cc_cons(%2757, %2758) : (i64, i64) -> i64
      %2760 = func.call @cc_values_pack(%2759) : (i64) -> i64
      func.call @stack_push_pointer(%2757) : (i64) -> ()
      %2761 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2762 = arith.constant 11 : i64
      %2763 = func.call @cc_make_string(%2761, %2762) : (!llvm.ptr, i64) -> i64
      %2764 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2765 = arith.constant 11 : i64
      %2766 = func.call @cc_make_string(%2764, %2765) : (!llvm.ptr, i64) -> i64
      %2767 = func.call @cc_intern(%2763, %2766) : (i64, i64) -> i64
      %2768 = func.call @cc_nil_value() : () -> i64
      %2769 = func.call @cc_cons(%2767, %2768) : (i64, i64) -> i64
      %2770 = func.call @cc_values_pack(%2769) : (i64) -> i64
      func.call @stack_push_pointer(%2767) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2771 = func.call @stack_pop_pointer() : () -> i64
      %2772 = func.call @stack_pop_pointer() : () -> i64
      %2773 = func.call @cc_cons(%2772, %2771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2773) : (i64) -> ()
      %2774 = func.call @stack_pop_pointer() : () -> i64
      %2775 = func.call @stack_pop_pointer() : () -> i64
      %2776 = func.call @cc_cons(%2775, %2774) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2776) : (i64) -> ()
      %2777 = func.call @stack_pop_pointer() : () -> i64
      %2778 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2779 = arith.constant 11 : i64
      %2780 = func.call @cc_make_string(%2778, %2779) : (!llvm.ptr, i64) -> i64
      %2781 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2782 = arith.constant 7 : i64
      %2783 = func.call @cc_make_string(%2781, %2782) : (!llvm.ptr, i64) -> i64
      %2784 = func.call @cc_intern(%2780, %2783) : (i64, i64) -> i64
      %2785 = func.call @cc_nil_value() : () -> i64
      %2786 = func.call @cc_cons(%2784, %2785) : (i64, i64) -> i64
      %2787 = func.call @cc_values_pack(%2786) : (i64) -> i64
      func.call @stack_push_pointer(%2784) : (i64) -> ()
      %2788 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2789 = func.call @stack_pop_pointer() : () -> i64
      %2790 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2791 = arith.constant 4 : i64
      %2792 = func.call @cc_make_string(%2790, %2791) : (!llvm.ptr, i64) -> i64
      %2793 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2794 = arith.constant 7 : i64
      %2795 = func.call @cc_make_string(%2793, %2794) : (!llvm.ptr, i64) -> i64
      %2796 = func.call @cc_intern(%2792, %2795) : (i64, i64) -> i64
      %2797 = func.call @cc_nil_value() : () -> i64
      %2798 = func.call @cc_cons(%2796, %2797) : (i64, i64) -> i64
      %2799 = func.call @cc_values_pack(%2798) : (i64) -> i64
      func.call @stack_push_pointer(%2796) : (i64) -> ()
      %2800 = func.call @stack_pop_pointer() : () -> i64
      %2801 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2802 = arith.constant 5 : i64
      %2803 = func.call @cc_make_string(%2801, %2802) : (!llvm.ptr, i64) -> i64
      %2804 = func.call @cc_nil_value() : () -> i64
      %2805 = func.call @cc_intern(%2803, %2804) : (i64, i64) -> i64
      %2806 = func.call @cc_nil_value() : () -> i64
      %2807 = func.call @cc_cons(%2805, %2806) : (i64, i64) -> i64
      %2808 = func.call @cc_values_pack(%2807) : (i64) -> i64
      func.call @stack_push_pointer(%2805) : (i64) -> ()
      %2809 = func.call @stack_pop_pointer() : () -> i64
      %2810 = func.call @cc_nil_value() : () -> i64
      %2811 = func.call @cc_errorp(%2624) : (i64) -> i64
      %2812 = arith.cmpi ne, %2811, %2810 : i64
      %2813 = arith.cmpi eq, %2810, %2810 : i64
      %2814 = arith.andi %2812, %2813 : i1
      %2815 = scf.if %2814 -> (i64) {
        scf.yield %2624 : i64
      } else {
        scf.yield %2810 : i64
      }
      %2816 = func.call @cc_errorp(%2691) : (i64) -> i64
      %2817 = arith.cmpi ne, %2816, %2810 : i64
      %2818 = arith.cmpi eq, %2815, %2810 : i64
      %2819 = arith.andi %2817, %2818 : i1
      %2820 = scf.if %2819 -> (i64) {
        scf.yield %2691 : i64
      } else {
        scf.yield %2815 : i64
      }
      %2821 = func.call @cc_errorp(%2752) : (i64) -> i64
      %2822 = arith.cmpi ne, %2821, %2810 : i64
      %2823 = arith.cmpi eq, %2820, %2810 : i64
      %2824 = arith.andi %2822, %2823 : i1
      %2825 = scf.if %2824 -> (i64) {
        scf.yield %2752 : i64
      } else {
        scf.yield %2820 : i64
      }
      %2826 = func.call @cc_errorp(%2777) : (i64) -> i64
      %2827 = arith.cmpi ne, %2826, %2810 : i64
      %2828 = arith.cmpi eq, %2825, %2810 : i64
      %2829 = arith.andi %2827, %2828 : i1
      %2830 = scf.if %2829 -> (i64) {
        scf.yield %2777 : i64
      } else {
        scf.yield %2825 : i64
      }
      %2831 = func.call @cc_errorp(%2788) : (i64) -> i64
      %2832 = arith.cmpi ne, %2831, %2810 : i64
      %2833 = arith.cmpi eq, %2830, %2810 : i64
      %2834 = arith.andi %2832, %2833 : i1
      %2835 = scf.if %2834 -> (i64) {
        scf.yield %2788 : i64
      } else {
        scf.yield %2830 : i64
      }
      %2836 = func.call @cc_errorp(%2789) : (i64) -> i64
      %2837 = arith.cmpi ne, %2836, %2810 : i64
      %2838 = arith.cmpi eq, %2835, %2810 : i64
      %2839 = arith.andi %2837, %2838 : i1
      %2840 = scf.if %2839 -> (i64) {
        scf.yield %2789 : i64
      } else {
        scf.yield %2835 : i64
      }
      %2841 = func.call @cc_errorp(%2800) : (i64) -> i64
      %2842 = arith.cmpi ne, %2841, %2810 : i64
      %2843 = arith.cmpi eq, %2840, %2810 : i64
      %2844 = arith.andi %2842, %2843 : i1
      %2845 = scf.if %2844 -> (i64) {
        scf.yield %2800 : i64
      } else {
        scf.yield %2840 : i64
      }
      %2846 = func.call @cc_errorp(%2809) : (i64) -> i64
      %2847 = arith.cmpi ne, %2846, %2810 : i64
      %2848 = arith.cmpi eq, %2845, %2810 : i64
      %2849 = arith.andi %2847, %2848 : i1
      %2850 = scf.if %2849 -> (i64) {
        scf.yield %2809 : i64
      } else {
        scf.yield %2845 : i64
      }
      %2851 = arith.cmpi ne, %2850, %2810 : i64
      scf.if %2851 {
        func.call @stack_push_pointer(%2850) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2624) : (i64) -> ()
        func.call @stack_push_pointer(%2691) : (i64) -> ()
        func.call @stack_push_pointer(%2752) : (i64) -> ()
        func.call @stack_push_pointer(%2777) : (i64) -> ()
        func.call @stack_push_pointer(%2788) : (i64) -> ()
        func.call @stack_push_pointer(%2789) : (i64) -> ()
        func.call @stack_push_pointer(%2800) : (i64) -> ()
        func.call @stack_push_pointer(%2809) : (i64) -> ()
        %2852 = llvm.mlir.addressof @str242 : !llvm.ptr
        %2853 = func.call @cc_make_function_ref_const(%2852) : (!llvm.ptr) -> i64
        %2854 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2853, %2854) : (i64, i64) -> ()
      }
      %2855 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2855 : i64
    }
    %2856 = func.call @cc_nil_value() : () -> i64
    %2857 = func.call @cc_errorp(%2615) : (i64) -> i64
    %2858 = arith.cmpi ne, %2857, %2856 : i64
    %2859 = scf.if %2858 -> (i64) {
      scf.yield %2615 : i64
    } else {
      %2860 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2861 = arith.constant 14 : i64
      %2862 = func.call @cc_make_string(%2860, %2861) : (!llvm.ptr, i64) -> i64
      %2863 = func.call @cc_nil_value() : () -> i64
      %2864 = func.call @cc_intern(%2862, %2863) : (i64, i64) -> i64
      %2865 = func.call @cc_nil_value() : () -> i64
      %2866 = func.call @cc_cons(%2864, %2865) : (i64, i64) -> i64
      %2867 = func.call @cc_values_pack(%2866) : (i64) -> i64
      func.call @stack_push_pointer(%2864) : (i64) -> ()
      %2868 = func.call @stack_pop_pointer() : () -> i64
      %2869 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2870 = arith.constant 13 : i64
      %2871 = func.call @cc_make_string(%2869, %2870) : (!llvm.ptr, i64) -> i64
      %2872 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2873 = arith.constant 11 : i64
      %2874 = func.call @cc_make_string(%2872, %2873) : (!llvm.ptr, i64) -> i64
      %2875 = func.call @cc_intern(%2871, %2874) : (i64, i64) -> i64
      %2876 = func.call @cc_nil_value() : () -> i64
      %2877 = func.call @cc_cons(%2875, %2876) : (i64, i64) -> i64
      %2878 = func.call @cc_values_pack(%2877) : (i64) -> i64
      func.call @stack_push_pointer(%2875) : (i64) -> ()
      %2879 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2880 = arith.constant 6 : i64
      %2881 = func.call @cc_make_string(%2879, %2880) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2881) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2882 = func.call @stack_pop_pointer() : () -> i64
      %2883 = func.call @stack_pop_pointer() : () -> i64
      %2884 = func.call @cc_cons(%2883, %2882) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2884) : (i64) -> ()
      %2885 = func.call @stack_pop_pointer() : () -> i64
      %2886 = func.call @stack_pop_pointer() : () -> i64
      %2887 = func.call @cc_cons(%2886, %2885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2887) : (i64) -> ()
      %2888 = func.call @stack_pop_pointer() : () -> i64
      %2909 = arith.constant 122791386939404 : i64
      %2910 = arith.constant 0 : i64
      %2911 = func.call @cc_make_closure(%2909, %2910) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2911) : (i64) -> ()
      %2912 = func.call @stack_pop_pointer() : () -> i64
      %2913 = arith.constant 123 : i64
      func.call @stack_push_fixnum(%2913) : (i64) -> ()
      %2914 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%2914) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2915 = func.call @stack_pop_pointer() : () -> i64
      %2916 = func.call @stack_pop_pointer() : () -> i64
      %2917 = func.call @cc_cons(%2916, %2915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2917) : (i64) -> ()
      %2918 = func.call @stack_pop_pointer() : () -> i64
      %2919 = func.call @stack_pop_pointer() : () -> i64
      %2920 = func.call @cc_cons(%2919, %2918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2920) : (i64) -> ()
      %2921 = func.call @stack_pop_pointer() : () -> i64
      %2922 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2923 = arith.constant 11 : i64
      %2924 = func.call @cc_make_string(%2922, %2923) : (!llvm.ptr, i64) -> i64
      %2925 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2926 = arith.constant 7 : i64
      %2927 = func.call @cc_make_string(%2925, %2926) : (!llvm.ptr, i64) -> i64
      %2928 = func.call @cc_intern(%2924, %2927) : (i64, i64) -> i64
      %2929 = func.call @cc_nil_value() : () -> i64
      %2930 = func.call @cc_cons(%2928, %2929) : (i64, i64) -> i64
      %2931 = func.call @cc_values_pack(%2930) : (i64) -> i64
      func.call @stack_push_pointer(%2928) : (i64) -> ()
      %2932 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2933 = func.call @stack_pop_pointer() : () -> i64
      %2934 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2935 = arith.constant 4 : i64
      %2936 = func.call @cc_make_string(%2934, %2935) : (!llvm.ptr, i64) -> i64
      %2937 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2938 = arith.constant 7 : i64
      %2939 = func.call @cc_make_string(%2937, %2938) : (!llvm.ptr, i64) -> i64
      %2940 = func.call @cc_intern(%2936, %2939) : (i64, i64) -> i64
      %2941 = func.call @cc_nil_value() : () -> i64
      %2942 = func.call @cc_cons(%2940, %2941) : (i64, i64) -> i64
      %2943 = func.call @cc_values_pack(%2942) : (i64) -> i64
      func.call @stack_push_pointer(%2940) : (i64) -> ()
      %2944 = func.call @stack_pop_pointer() : () -> i64
      %2945 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2946 = arith.constant 6 : i64
      %2947 = func.call @cc_make_string(%2945, %2946) : (!llvm.ptr, i64) -> i64
      %2948 = func.call @cc_nil_value() : () -> i64
      %2949 = func.call @cc_intern(%2947, %2948) : (i64, i64) -> i64
      %2950 = func.call @cc_nil_value() : () -> i64
      %2951 = func.call @cc_cons(%2949, %2950) : (i64, i64) -> i64
      %2952 = func.call @cc_values_pack(%2951) : (i64) -> i64
      func.call @stack_push_pointer(%2949) : (i64) -> ()
      %2953 = func.call @stack_pop_pointer() : () -> i64
      %2954 = func.call @cc_nil_value() : () -> i64
      %2955 = func.call @cc_errorp(%2868) : (i64) -> i64
      %2956 = arith.cmpi ne, %2955, %2954 : i64
      %2957 = arith.cmpi eq, %2954, %2954 : i64
      %2958 = arith.andi %2956, %2957 : i1
      %2959 = scf.if %2958 -> (i64) {
        scf.yield %2868 : i64
      } else {
        scf.yield %2954 : i64
      }
      %2960 = func.call @cc_errorp(%2888) : (i64) -> i64
      %2961 = arith.cmpi ne, %2960, %2954 : i64
      %2962 = arith.cmpi eq, %2959, %2954 : i64
      %2963 = arith.andi %2961, %2962 : i1
      %2964 = scf.if %2963 -> (i64) {
        scf.yield %2888 : i64
      } else {
        scf.yield %2959 : i64
      }
      %2965 = func.call @cc_errorp(%2912) : (i64) -> i64
      %2966 = arith.cmpi ne, %2965, %2954 : i64
      %2967 = arith.cmpi eq, %2964, %2954 : i64
      %2968 = arith.andi %2966, %2967 : i1
      %2969 = scf.if %2968 -> (i64) {
        scf.yield %2912 : i64
      } else {
        scf.yield %2964 : i64
      }
      %2970 = func.call @cc_errorp(%2921) : (i64) -> i64
      %2971 = arith.cmpi ne, %2970, %2954 : i64
      %2972 = arith.cmpi eq, %2969, %2954 : i64
      %2973 = arith.andi %2971, %2972 : i1
      %2974 = scf.if %2973 -> (i64) {
        scf.yield %2921 : i64
      } else {
        scf.yield %2969 : i64
      }
      %2975 = func.call @cc_errorp(%2932) : (i64) -> i64
      %2976 = arith.cmpi ne, %2975, %2954 : i64
      %2977 = arith.cmpi eq, %2974, %2954 : i64
      %2978 = arith.andi %2976, %2977 : i1
      %2979 = scf.if %2978 -> (i64) {
        scf.yield %2932 : i64
      } else {
        scf.yield %2974 : i64
      }
      %2980 = func.call @cc_errorp(%2933) : (i64) -> i64
      %2981 = arith.cmpi ne, %2980, %2954 : i64
      %2982 = arith.cmpi eq, %2979, %2954 : i64
      %2983 = arith.andi %2981, %2982 : i1
      %2984 = scf.if %2983 -> (i64) {
        scf.yield %2933 : i64
      } else {
        scf.yield %2979 : i64
      }
      %2985 = func.call @cc_errorp(%2944) : (i64) -> i64
      %2986 = arith.cmpi ne, %2985, %2954 : i64
      %2987 = arith.cmpi eq, %2984, %2954 : i64
      %2988 = arith.andi %2986, %2987 : i1
      %2989 = scf.if %2988 -> (i64) {
        scf.yield %2944 : i64
      } else {
        scf.yield %2984 : i64
      }
      %2990 = func.call @cc_errorp(%2953) : (i64) -> i64
      %2991 = arith.cmpi ne, %2990, %2954 : i64
      %2992 = arith.cmpi eq, %2989, %2954 : i64
      %2993 = arith.andi %2991, %2992 : i1
      %2994 = scf.if %2993 -> (i64) {
        scf.yield %2953 : i64
      } else {
        scf.yield %2989 : i64
      }
      %2995 = arith.cmpi ne, %2994, %2954 : i64
      scf.if %2995 {
        func.call @stack_push_pointer(%2994) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2868) : (i64) -> ()
        func.call @stack_push_pointer(%2888) : (i64) -> ()
        func.call @stack_push_pointer(%2912) : (i64) -> ()
        func.call @stack_push_pointer(%2921) : (i64) -> ()
        func.call @stack_push_pointer(%2932) : (i64) -> ()
        func.call @stack_push_pointer(%2933) : (i64) -> ()
        func.call @stack_push_pointer(%2944) : (i64) -> ()
        func.call @stack_push_pointer(%2953) : (i64) -> ()
        %2996 = llvm.mlir.addressof @str254 : !llvm.ptr
        %2997 = func.call @cc_make_function_ref_const(%2996) : (!llvm.ptr) -> i64
        %2998 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%2997, %2998) : (i64, i64) -> ()
      }
      %2999 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2999 : i64
    }
    %3000 = func.call @cc_nil_value() : () -> i64
    %3001 = func.call @cc_errorp(%2859) : (i64) -> i64
    %3002 = arith.cmpi ne, %3001, %3000 : i64
    %3003 = scf.if %3002 -> (i64) {
      scf.yield %2859 : i64
    } else {
      %3004 = llvm.mlir.addressof @str255 : !llvm.ptr
      %3005 = arith.constant 15 : i64
      %3006 = func.call @cc_make_string(%3004, %3005) : (!llvm.ptr, i64) -> i64
      %3007 = func.call @cc_nil_value() : () -> i64
      %3008 = func.call @cc_intern(%3006, %3007) : (i64, i64) -> i64
      %3009 = func.call @cc_nil_value() : () -> i64
      %3010 = func.call @cc_cons(%3008, %3009) : (i64, i64) -> i64
      %3011 = func.call @cc_values_pack(%3010) : (i64) -> i64
      func.call @stack_push_pointer(%3008) : (i64) -> ()
      %3012 = func.call @stack_pop_pointer() : () -> i64
      %3013 = llvm.mlir.addressof @str256 : !llvm.ptr
      %3014 = arith.constant 13 : i64
      %3015 = func.call @cc_make_string(%3013, %3014) : (!llvm.ptr, i64) -> i64
      %3016 = llvm.mlir.addressof @str257 : !llvm.ptr
      %3017 = arith.constant 11 : i64
      %3018 = func.call @cc_make_string(%3016, %3017) : (!llvm.ptr, i64) -> i64
      %3019 = func.call @cc_intern(%3015, %3018) : (i64, i64) -> i64
      %3020 = func.call @cc_nil_value() : () -> i64
      %3021 = func.call @cc_cons(%3019, %3020) : (i64, i64) -> i64
      %3022 = func.call @cc_values_pack(%3021) : (i64) -> i64
      func.call @stack_push_pointer(%3019) : (i64) -> ()
      %3023 = llvm.mlir.addressof @str258 : !llvm.ptr
      %3024 = arith.constant 6 : i64
      %3025 = func.call @cc_make_string(%3023, %3024) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3025) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3026 = func.call @stack_pop_pointer() : () -> i64
      %3027 = func.call @stack_pop_pointer() : () -> i64
      %3028 = func.call @cc_cons(%3027, %3026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3028) : (i64) -> ()
      %3029 = func.call @stack_pop_pointer() : () -> i64
      %3030 = func.call @stack_pop_pointer() : () -> i64
      %3031 = func.call @cc_cons(%3030, %3029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3031) : (i64) -> ()
      %3032 = func.call @stack_pop_pointer() : () -> i64
      %3053 = arith.constant 122791386939405 : i64
      %3054 = arith.constant 0 : i64
      %3055 = func.call @cc_make_closure(%3053, %3054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3055) : (i64) -> ()
      %3056 = func.call @stack_pop_pointer() : () -> i64
      %3057 = arith.constant -123 : i64
      func.call @stack_push_fixnum(%3057) : (i64) -> ()
      %3058 = arith.constant 6 : i64
      func.call @stack_push_fixnum(%3058) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3059 = func.call @stack_pop_pointer() : () -> i64
      %3060 = func.call @stack_pop_pointer() : () -> i64
      %3061 = func.call @cc_cons(%3060, %3059) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3061) : (i64) -> ()
      %3062 = func.call @stack_pop_pointer() : () -> i64
      %3063 = func.call @stack_pop_pointer() : () -> i64
      %3064 = func.call @cc_cons(%3063, %3062) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3064) : (i64) -> ()
      %3065 = func.call @stack_pop_pointer() : () -> i64
      %3066 = llvm.mlir.addressof @str261 : !llvm.ptr
      %3067 = arith.constant 11 : i64
      %3068 = func.call @cc_make_string(%3066, %3067) : (!llvm.ptr, i64) -> i64
      %3069 = llvm.mlir.addressof @str262 : !llvm.ptr
      %3070 = arith.constant 7 : i64
      %3071 = func.call @cc_make_string(%3069, %3070) : (!llvm.ptr, i64) -> i64
      %3072 = func.call @cc_intern(%3068, %3071) : (i64, i64) -> i64
      %3073 = func.call @cc_nil_value() : () -> i64
      %3074 = func.call @cc_cons(%3072, %3073) : (i64, i64) -> i64
      %3075 = func.call @cc_values_pack(%3074) : (i64) -> i64
      func.call @stack_push_pointer(%3072) : (i64) -> ()
      %3076 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3077 = func.call @stack_pop_pointer() : () -> i64
      %3078 = llvm.mlir.addressof @str263 : !llvm.ptr
      %3079 = arith.constant 4 : i64
      %3080 = func.call @cc_make_string(%3078, %3079) : (!llvm.ptr, i64) -> i64
      %3081 = llvm.mlir.addressof @str264 : !llvm.ptr
      %3082 = arith.constant 7 : i64
      %3083 = func.call @cc_make_string(%3081, %3082) : (!llvm.ptr, i64) -> i64
      %3084 = func.call @cc_intern(%3080, %3083) : (i64, i64) -> i64
      %3085 = func.call @cc_nil_value() : () -> i64
      %3086 = func.call @cc_cons(%3084, %3085) : (i64, i64) -> i64
      %3087 = func.call @cc_values_pack(%3086) : (i64) -> i64
      func.call @stack_push_pointer(%3084) : (i64) -> ()
      %3088 = func.call @stack_pop_pointer() : () -> i64
      %3089 = llvm.mlir.addressof @str265 : !llvm.ptr
      %3090 = arith.constant 6 : i64
      %3091 = func.call @cc_make_string(%3089, %3090) : (!llvm.ptr, i64) -> i64
      %3092 = func.call @cc_nil_value() : () -> i64
      %3093 = func.call @cc_intern(%3091, %3092) : (i64, i64) -> i64
      %3094 = func.call @cc_nil_value() : () -> i64
      %3095 = func.call @cc_cons(%3093, %3094) : (i64, i64) -> i64
      %3096 = func.call @cc_values_pack(%3095) : (i64) -> i64
      func.call @stack_push_pointer(%3093) : (i64) -> ()
      %3097 = func.call @stack_pop_pointer() : () -> i64
      %3098 = func.call @cc_nil_value() : () -> i64
      %3099 = func.call @cc_errorp(%3012) : (i64) -> i64
      %3100 = arith.cmpi ne, %3099, %3098 : i64
      %3101 = arith.cmpi eq, %3098, %3098 : i64
      %3102 = arith.andi %3100, %3101 : i1
      %3103 = scf.if %3102 -> (i64) {
        scf.yield %3012 : i64
      } else {
        scf.yield %3098 : i64
      }
      %3104 = func.call @cc_errorp(%3032) : (i64) -> i64
      %3105 = arith.cmpi ne, %3104, %3098 : i64
      %3106 = arith.cmpi eq, %3103, %3098 : i64
      %3107 = arith.andi %3105, %3106 : i1
      %3108 = scf.if %3107 -> (i64) {
        scf.yield %3032 : i64
      } else {
        scf.yield %3103 : i64
      }
      %3109 = func.call @cc_errorp(%3056) : (i64) -> i64
      %3110 = arith.cmpi ne, %3109, %3098 : i64
      %3111 = arith.cmpi eq, %3108, %3098 : i64
      %3112 = arith.andi %3110, %3111 : i1
      %3113 = scf.if %3112 -> (i64) {
        scf.yield %3056 : i64
      } else {
        scf.yield %3108 : i64
      }
      %3114 = func.call @cc_errorp(%3065) : (i64) -> i64
      %3115 = arith.cmpi ne, %3114, %3098 : i64
      %3116 = arith.cmpi eq, %3113, %3098 : i64
      %3117 = arith.andi %3115, %3116 : i1
      %3118 = scf.if %3117 -> (i64) {
        scf.yield %3065 : i64
      } else {
        scf.yield %3113 : i64
      }
      %3119 = func.call @cc_errorp(%3076) : (i64) -> i64
      %3120 = arith.cmpi ne, %3119, %3098 : i64
      %3121 = arith.cmpi eq, %3118, %3098 : i64
      %3122 = arith.andi %3120, %3121 : i1
      %3123 = scf.if %3122 -> (i64) {
        scf.yield %3076 : i64
      } else {
        scf.yield %3118 : i64
      }
      %3124 = func.call @cc_errorp(%3077) : (i64) -> i64
      %3125 = arith.cmpi ne, %3124, %3098 : i64
      %3126 = arith.cmpi eq, %3123, %3098 : i64
      %3127 = arith.andi %3125, %3126 : i1
      %3128 = scf.if %3127 -> (i64) {
        scf.yield %3077 : i64
      } else {
        scf.yield %3123 : i64
      }
      %3129 = func.call @cc_errorp(%3088) : (i64) -> i64
      %3130 = arith.cmpi ne, %3129, %3098 : i64
      %3131 = arith.cmpi eq, %3128, %3098 : i64
      %3132 = arith.andi %3130, %3131 : i1
      %3133 = scf.if %3132 -> (i64) {
        scf.yield %3088 : i64
      } else {
        scf.yield %3128 : i64
      }
      %3134 = func.call @cc_errorp(%3097) : (i64) -> i64
      %3135 = arith.cmpi ne, %3134, %3098 : i64
      %3136 = arith.cmpi eq, %3133, %3098 : i64
      %3137 = arith.andi %3135, %3136 : i1
      %3138 = scf.if %3137 -> (i64) {
        scf.yield %3097 : i64
      } else {
        scf.yield %3133 : i64
      }
      %3139 = arith.cmpi ne, %3138, %3098 : i64
      scf.if %3139 {
        func.call @stack_push_pointer(%3138) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3012) : (i64) -> ()
        func.call @stack_push_pointer(%3032) : (i64) -> ()
        func.call @stack_push_pointer(%3056) : (i64) -> ()
        func.call @stack_push_pointer(%3065) : (i64) -> ()
        func.call @stack_push_pointer(%3076) : (i64) -> ()
        func.call @stack_push_pointer(%3077) : (i64) -> ()
        func.call @stack_push_pointer(%3088) : (i64) -> ()
        func.call @stack_push_pointer(%3097) : (i64) -> ()
        %3140 = llvm.mlir.addressof @str266 : !llvm.ptr
        %3141 = func.call @cc_make_function_ref_const(%3140) : (!llvm.ptr) -> i64
        %3142 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3141, %3142) : (i64, i64) -> ()
      }
      %3143 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3143 : i64
    }
    %3144 = func.call @cc_nil_value() : () -> i64
    %3145 = func.call @cc_errorp(%3003) : (i64) -> i64
    %3146 = arith.cmpi ne, %3145, %3144 : i64
    %3147 = scf.if %3146 -> (i64) {
      scf.yield %3003 : i64
    } else {
      %3148 = llvm.mlir.addressof @str267 : !llvm.ptr
      %3149 = arith.constant 14 : i64
      %3150 = func.call @cc_make_string(%3148, %3149) : (!llvm.ptr, i64) -> i64
      %3151 = func.call @cc_nil_value() : () -> i64
      %3152 = func.call @cc_intern(%3150, %3151) : (i64, i64) -> i64
      %3153 = func.call @cc_nil_value() : () -> i64
      %3154 = func.call @cc_cons(%3152, %3153) : (i64, i64) -> i64
      %3155 = func.call @cc_values_pack(%3154) : (i64) -> i64
      func.call @stack_push_pointer(%3152) : (i64) -> ()
      %3156 = func.call @stack_pop_pointer() : () -> i64
      %3157 = llvm.mlir.addressof @str268 : !llvm.ptr
      %3158 = arith.constant 13 : i64
      %3159 = func.call @cc_make_string(%3157, %3158) : (!llvm.ptr, i64) -> i64
      %3160 = llvm.mlir.addressof @str269 : !llvm.ptr
      %3161 = arith.constant 11 : i64
      %3162 = func.call @cc_make_string(%3160, %3161) : (!llvm.ptr, i64) -> i64
      %3163 = func.call @cc_intern(%3159, %3162) : (i64, i64) -> i64
      %3164 = func.call @cc_nil_value() : () -> i64
      %3165 = func.call @cc_cons(%3163, %3164) : (i64, i64) -> i64
      %3166 = func.call @cc_values_pack(%3165) : (i64) -> i64
      func.call @stack_push_pointer(%3163) : (i64) -> ()
      %3167 = llvm.mlir.addressof @str270 : !llvm.ptr
      %3168 = arith.constant 6 : i64
      %3169 = func.call @cc_make_string(%3167, %3168) : (!llvm.ptr, i64) -> i64
      %3170 = func.call @cc_nil_value() : () -> i64
      %3171 = func.call @cc_intern(%3169, %3170) : (i64, i64) -> i64
      %3172 = func.call @cc_nil_value() : () -> i64
      %3173 = func.call @cc_cons(%3171, %3172) : (i64, i64) -> i64
      %3174 = func.call @cc_values_pack(%3173) : (i64) -> i64
      func.call @stack_push_pointer(%3171) : (i64) -> ()
      %3175 = llvm.mlir.addressof @str271 : !llvm.ptr
      %3176 = arith.constant 19 : i64
      %3177 = func.call @cc_make_string(%3175, %3176) : (!llvm.ptr, i64) -> i64
      %3178 = func.call @cc_nil_value() : () -> i64
      %3179 = func.call @cc_intern(%3177, %3178) : (i64, i64) -> i64
      %3180 = func.call @cc_nil_value() : () -> i64
      %3181 = func.call @cc_cons(%3179, %3180) : (i64, i64) -> i64
      %3182 = func.call @cc_values_pack(%3181) : (i64) -> i64
      func.call @stack_push_pointer(%3179) : (i64) -> ()
      %3183 = llvm.mlir.addressof @str272 : !llvm.ptr
      %3184 = arith.constant 13 : i64
      %3185 = func.call @cc_make_string(%3183, %3184) : (!llvm.ptr, i64) -> i64
      %3186 = llvm.mlir.addressof @str273 : !llvm.ptr
      %3187 = arith.constant 11 : i64
      %3188 = func.call @cc_make_string(%3186, %3187) : (!llvm.ptr, i64) -> i64
      %3189 = func.call @cc_intern(%3185, %3188) : (i64, i64) -> i64
      %3190 = func.call @cc_nil_value() : () -> i64
      %3191 = func.call @cc_cons(%3189, %3190) : (i64, i64) -> i64
      %3192 = func.call @cc_values_pack(%3191) : (i64) -> i64
      func.call @stack_push_pointer(%3189) : (i64) -> ()
      %3193 = llvm.mlir.addressof @str274 : !llvm.ptr
      %3194 = arith.constant 7 : i64
      %3195 = func.call @cc_make_string(%3193, %3194) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3195) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3196 = func.call @stack_pop_pointer() : () -> i64
      %3197 = func.call @stack_pop_pointer() : () -> i64
      %3198 = func.call @cc_cons(%3197, %3196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3198) : (i64) -> ()
      %3199 = func.call @stack_pop_pointer() : () -> i64
      %3200 = func.call @stack_pop_pointer() : () -> i64
      %3201 = func.call @cc_cons(%3200, %3199) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3201) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3202 = func.call @stack_pop_pointer() : () -> i64
      %3203 = func.call @stack_pop_pointer() : () -> i64
      %3204 = func.call @cc_cons(%3203, %3202) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3204) : (i64) -> ()
      %3205 = func.call @stack_pop_pointer() : () -> i64
      %3206 = func.call @stack_pop_pointer() : () -> i64
      %3207 = func.call @cc_cons(%3206, %3205) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3207) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3208 = func.call @stack_pop_pointer() : () -> i64
      %3209 = func.call @stack_pop_pointer() : () -> i64
      %3210 = func.call @cc_cons(%3209, %3208) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3210) : (i64) -> ()
      %3211 = func.call @stack_pop_pointer() : () -> i64
      %3212 = func.call @stack_pop_pointer() : () -> i64
      %3213 = func.call @cc_cons(%3212, %3211) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3213) : (i64) -> ()
      %3214 = func.call @stack_pop_pointer() : () -> i64
      %3215 = func.call @stack_pop_pointer() : () -> i64
      %3216 = func.call @cc_cons(%3215, %3214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3216) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3217 = func.call @stack_pop_pointer() : () -> i64
      %3218 = func.call @stack_pop_pointer() : () -> i64
      %3219 = func.call @cc_cons(%3218, %3217) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3219) : (i64) -> ()
      %3220 = func.call @stack_pop_pointer() : () -> i64
      %3221 = func.call @stack_pop_pointer() : () -> i64
      %3222 = func.call @cc_cons(%3221, %3220) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3222) : (i64) -> ()
      %3223 = func.call @stack_pop_pointer() : () -> i64
      %3281 = arith.constant 122791386939406 : i64
      %3282 = arith.constant 0 : i64
      %3283 = func.call @cc_make_closure(%3281, %3282) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3283) : (i64) -> ()
      %3284 = func.call @stack_pop_pointer() : () -> i64
      %3285 = llvm.mlir.addressof @str277 : !llvm.ptr
      %3286 = arith.constant 4 : i64
      %3287 = func.call @cc_make_string(%3285, %3286) : (!llvm.ptr, i64) -> i64
      %3288 = func.call @cc_nil_value() : () -> i64
      %3289 = func.call @cc_intern(%3287, %3288) : (i64, i64) -> i64
      %3290 = func.call @cc_nil_value() : () -> i64
      %3291 = func.call @cc_cons(%3289, %3290) : (i64, i64) -> i64
      %3292 = func.call @cc_values_pack(%3291) : (i64) -> i64
      func.call @stack_push_pointer(%3289) : (i64) -> ()
      %3293 = llvm.mlir.addressof @str278 : !llvm.ptr
      %3294 = arith.constant 11 : i64
      %3295 = func.call @cc_make_string(%3293, %3294) : (!llvm.ptr, i64) -> i64
      %3296 = llvm.mlir.addressof @str279 : !llvm.ptr
      %3297 = arith.constant 11 : i64
      %3298 = func.call @cc_make_string(%3296, %3297) : (!llvm.ptr, i64) -> i64
      %3299 = func.call @cc_intern(%3295, %3298) : (i64, i64) -> i64
      %3300 = func.call @cc_nil_value() : () -> i64
      %3301 = func.call @cc_cons(%3299, %3300) : (i64, i64) -> i64
      %3302 = func.call @cc_values_pack(%3301) : (i64) -> i64
      func.call @stack_push_pointer(%3299) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3303 = func.call @stack_pop_pointer() : () -> i64
      %3304 = func.call @stack_pop_pointer() : () -> i64
      %3305 = func.call @cc_cons(%3304, %3303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3305) : (i64) -> ()
      %3306 = func.call @stack_pop_pointer() : () -> i64
      %3307 = func.call @stack_pop_pointer() : () -> i64
      %3308 = func.call @cc_cons(%3307, %3306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3308) : (i64) -> ()
      %3309 = func.call @stack_pop_pointer() : () -> i64
      %3310 = llvm.mlir.addressof @str280 : !llvm.ptr
      %3311 = arith.constant 11 : i64
      %3312 = func.call @cc_make_string(%3310, %3311) : (!llvm.ptr, i64) -> i64
      %3313 = llvm.mlir.addressof @str281 : !llvm.ptr
      %3314 = arith.constant 7 : i64
      %3315 = func.call @cc_make_string(%3313, %3314) : (!llvm.ptr, i64) -> i64
      %3316 = func.call @cc_intern(%3312, %3315) : (i64, i64) -> i64
      %3317 = func.call @cc_nil_value() : () -> i64
      %3318 = func.call @cc_cons(%3316, %3317) : (i64, i64) -> i64
      %3319 = func.call @cc_values_pack(%3318) : (i64) -> i64
      func.call @stack_push_pointer(%3316) : (i64) -> ()
      %3320 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3321 = func.call @stack_pop_pointer() : () -> i64
      %3322 = llvm.mlir.addressof @str282 : !llvm.ptr
      %3323 = arith.constant 4 : i64
      %3324 = func.call @cc_make_string(%3322, %3323) : (!llvm.ptr, i64) -> i64
      %3325 = llvm.mlir.addressof @str283 : !llvm.ptr
      %3326 = arith.constant 7 : i64
      %3327 = func.call @cc_make_string(%3325, %3326) : (!llvm.ptr, i64) -> i64
      %3328 = func.call @cc_intern(%3324, %3327) : (i64, i64) -> i64
      %3329 = func.call @cc_nil_value() : () -> i64
      %3330 = func.call @cc_cons(%3328, %3329) : (i64, i64) -> i64
      %3331 = func.call @cc_values_pack(%3330) : (i64) -> i64
      func.call @stack_push_pointer(%3328) : (i64) -> ()
      %3332 = func.call @stack_pop_pointer() : () -> i64
      %3333 = llvm.mlir.addressof @str284 : !llvm.ptr
      %3334 = arith.constant 5 : i64
      %3335 = func.call @cc_make_string(%3333, %3334) : (!llvm.ptr, i64) -> i64
      %3336 = func.call @cc_nil_value() : () -> i64
      %3337 = func.call @cc_intern(%3335, %3336) : (i64, i64) -> i64
      %3338 = func.call @cc_nil_value() : () -> i64
      %3339 = func.call @cc_cons(%3337, %3338) : (i64, i64) -> i64
      %3340 = func.call @cc_values_pack(%3339) : (i64) -> i64
      func.call @stack_push_pointer(%3337) : (i64) -> ()
      %3341 = func.call @stack_pop_pointer() : () -> i64
      %3342 = func.call @cc_nil_value() : () -> i64
      %3343 = func.call @cc_errorp(%3156) : (i64) -> i64
      %3344 = arith.cmpi ne, %3343, %3342 : i64
      %3345 = arith.cmpi eq, %3342, %3342 : i64
      %3346 = arith.andi %3344, %3345 : i1
      %3347 = scf.if %3346 -> (i64) {
        scf.yield %3156 : i64
      } else {
        scf.yield %3342 : i64
      }
      %3348 = func.call @cc_errorp(%3223) : (i64) -> i64
      %3349 = arith.cmpi ne, %3348, %3342 : i64
      %3350 = arith.cmpi eq, %3347, %3342 : i64
      %3351 = arith.andi %3349, %3350 : i1
      %3352 = scf.if %3351 -> (i64) {
        scf.yield %3223 : i64
      } else {
        scf.yield %3347 : i64
      }
      %3353 = func.call @cc_errorp(%3284) : (i64) -> i64
      %3354 = arith.cmpi ne, %3353, %3342 : i64
      %3355 = arith.cmpi eq, %3352, %3342 : i64
      %3356 = arith.andi %3354, %3355 : i1
      %3357 = scf.if %3356 -> (i64) {
        scf.yield %3284 : i64
      } else {
        scf.yield %3352 : i64
      }
      %3358 = func.call @cc_errorp(%3309) : (i64) -> i64
      %3359 = arith.cmpi ne, %3358, %3342 : i64
      %3360 = arith.cmpi eq, %3357, %3342 : i64
      %3361 = arith.andi %3359, %3360 : i1
      %3362 = scf.if %3361 -> (i64) {
        scf.yield %3309 : i64
      } else {
        scf.yield %3357 : i64
      }
      %3363 = func.call @cc_errorp(%3320) : (i64) -> i64
      %3364 = arith.cmpi ne, %3363, %3342 : i64
      %3365 = arith.cmpi eq, %3362, %3342 : i64
      %3366 = arith.andi %3364, %3365 : i1
      %3367 = scf.if %3366 -> (i64) {
        scf.yield %3320 : i64
      } else {
        scf.yield %3362 : i64
      }
      %3368 = func.call @cc_errorp(%3321) : (i64) -> i64
      %3369 = arith.cmpi ne, %3368, %3342 : i64
      %3370 = arith.cmpi eq, %3367, %3342 : i64
      %3371 = arith.andi %3369, %3370 : i1
      %3372 = scf.if %3371 -> (i64) {
        scf.yield %3321 : i64
      } else {
        scf.yield %3367 : i64
      }
      %3373 = func.call @cc_errorp(%3332) : (i64) -> i64
      %3374 = arith.cmpi ne, %3373, %3342 : i64
      %3375 = arith.cmpi eq, %3372, %3342 : i64
      %3376 = arith.andi %3374, %3375 : i1
      %3377 = scf.if %3376 -> (i64) {
        scf.yield %3332 : i64
      } else {
        scf.yield %3372 : i64
      }
      %3378 = func.call @cc_errorp(%3341) : (i64) -> i64
      %3379 = arith.cmpi ne, %3378, %3342 : i64
      %3380 = arith.cmpi eq, %3377, %3342 : i64
      %3381 = arith.andi %3379, %3380 : i1
      %3382 = scf.if %3381 -> (i64) {
        scf.yield %3341 : i64
      } else {
        scf.yield %3377 : i64
      }
      %3383 = arith.cmpi ne, %3382, %3342 : i64
      scf.if %3383 {
        func.call @stack_push_pointer(%3382) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3156) : (i64) -> ()
        func.call @stack_push_pointer(%3223) : (i64) -> ()
        func.call @stack_push_pointer(%3284) : (i64) -> ()
        func.call @stack_push_pointer(%3309) : (i64) -> ()
        func.call @stack_push_pointer(%3320) : (i64) -> ()
        func.call @stack_push_pointer(%3321) : (i64) -> ()
        func.call @stack_push_pointer(%3332) : (i64) -> ()
        func.call @stack_push_pointer(%3341) : (i64) -> ()
        %3384 = llvm.mlir.addressof @str285 : !llvm.ptr
        %3385 = func.call @cc_make_function_ref_const(%3384) : (!llvm.ptr) -> i64
        %3386 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3385, %3386) : (i64, i64) -> ()
      }
      %3387 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3387 : i64
    }
    %3388 = func.call @cc_nil_value() : () -> i64
    %3389 = func.call @cc_errorp(%3147) : (i64) -> i64
    %3390 = arith.cmpi ne, %3389, %3388 : i64
    %3391 = scf.if %3390 -> (i64) {
      scf.yield %3147 : i64
    } else {
      %3392 = llvm.mlir.addressof @str286 : !llvm.ptr
      %3393 = arith.constant 14 : i64
      %3394 = func.call @cc_make_string(%3392, %3393) : (!llvm.ptr, i64) -> i64
      %3395 = func.call @cc_nil_value() : () -> i64
      %3396 = func.call @cc_intern(%3394, %3395) : (i64, i64) -> i64
      %3397 = func.call @cc_nil_value() : () -> i64
      %3398 = func.call @cc_cons(%3396, %3397) : (i64, i64) -> i64
      %3399 = func.call @cc_values_pack(%3398) : (i64) -> i64
      func.call @stack_push_pointer(%3396) : (i64) -> ()
      %3400 = func.call @stack_pop_pointer() : () -> i64
      %3401 = llvm.mlir.addressof @str287 : !llvm.ptr
      %3402 = arith.constant 13 : i64
      %3403 = func.call @cc_make_string(%3401, %3402) : (!llvm.ptr, i64) -> i64
      %3404 = llvm.mlir.addressof @str288 : !llvm.ptr
      %3405 = arith.constant 11 : i64
      %3406 = func.call @cc_make_string(%3404, %3405) : (!llvm.ptr, i64) -> i64
      %3407 = func.call @cc_intern(%3403, %3406) : (i64, i64) -> i64
      %3408 = func.call @cc_nil_value() : () -> i64
      %3409 = func.call @cc_cons(%3407, %3408) : (i64, i64) -> i64
      %3410 = func.call @cc_values_pack(%3409) : (i64) -> i64
      func.call @stack_push_pointer(%3407) : (i64) -> ()
      %3411 = llvm.mlir.addressof @str289 : !llvm.ptr
      %3412 = arith.constant 5 : i64
      %3413 = func.call @cc_make_string(%3411, %3412) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3413) : (i64) -> ()
      %3414 = llvm.mlir.addressof @str290 : !llvm.ptr
      %3415 = arith.constant 12 : i64
      %3416 = func.call @cc_make_string(%3414, %3415) : (!llvm.ptr, i64) -> i64
      %3417 = llvm.mlir.addressof @str291 : !llvm.ptr
      %3418 = arith.constant 7 : i64
      %3419 = func.call @cc_make_string(%3417, %3418) : (!llvm.ptr, i64) -> i64
      %3420 = func.call @cc_intern(%3416, %3419) : (i64, i64) -> i64
      %3421 = func.call @cc_nil_value() : () -> i64
      %3422 = func.call @cc_cons(%3420, %3421) : (i64, i64) -> i64
      %3423 = func.call @cc_values_pack(%3422) : (i64) -> i64
      func.call @stack_push_pointer(%3420) : (i64) -> ()
      %3424 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3424) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3425 = func.call @stack_pop_pointer() : () -> i64
      %3426 = func.call @stack_pop_pointer() : () -> i64
      %3427 = func.call @cc_cons(%3426, %3425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3427) : (i64) -> ()
      %3428 = func.call @stack_pop_pointer() : () -> i64
      %3429 = func.call @stack_pop_pointer() : () -> i64
      %3430 = func.call @cc_cons(%3429, %3428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3430) : (i64) -> ()
      %3431 = func.call @stack_pop_pointer() : () -> i64
      %3432 = func.call @stack_pop_pointer() : () -> i64
      %3433 = func.call @cc_cons(%3432, %3431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3433) : (i64) -> ()
      %3434 = func.call @stack_pop_pointer() : () -> i64
      %3435 = func.call @stack_pop_pointer() : () -> i64
      %3436 = func.call @cc_cons(%3435, %3434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3436) : (i64) -> ()
      %3437 = func.call @stack_pop_pointer() : () -> i64
      %3481 = arith.constant 122791386939407 : i64
      %3482 = arith.constant 0 : i64
      %3483 = func.call @cc_make_closure(%3481, %3482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3483) : (i64) -> ()
      %3484 = func.call @stack_pop_pointer() : () -> i64
      %3485 = arith.constant 123 : i64
      func.call @stack_push_fixnum(%3485) : (i64) -> ()
      %3486 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%3486) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3487 = func.call @stack_pop_pointer() : () -> i64
      %3488 = func.call @stack_pop_pointer() : () -> i64
      %3489 = func.call @cc_cons(%3488, %3487) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3489) : (i64) -> ()
      %3490 = func.call @stack_pop_pointer() : () -> i64
      %3491 = func.call @stack_pop_pointer() : () -> i64
      %3492 = func.call @cc_cons(%3491, %3490) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3492) : (i64) -> ()
      %3493 = func.call @stack_pop_pointer() : () -> i64
      %3494 = llvm.mlir.addressof @str296 : !llvm.ptr
      %3495 = arith.constant 11 : i64
      %3496 = func.call @cc_make_string(%3494, %3495) : (!llvm.ptr, i64) -> i64
      %3497 = llvm.mlir.addressof @str297 : !llvm.ptr
      %3498 = arith.constant 7 : i64
      %3499 = func.call @cc_make_string(%3497, %3498) : (!llvm.ptr, i64) -> i64
      %3500 = func.call @cc_intern(%3496, %3499) : (i64, i64) -> i64
      %3501 = func.call @cc_nil_value() : () -> i64
      %3502 = func.call @cc_cons(%3500, %3501) : (i64, i64) -> i64
      %3503 = func.call @cc_values_pack(%3502) : (i64) -> i64
      func.call @stack_push_pointer(%3500) : (i64) -> ()
      %3504 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3505 = func.call @stack_pop_pointer() : () -> i64
      %3506 = llvm.mlir.addressof @str298 : !llvm.ptr
      %3507 = arith.constant 4 : i64
      %3508 = func.call @cc_make_string(%3506, %3507) : (!llvm.ptr, i64) -> i64
      %3509 = llvm.mlir.addressof @str299 : !llvm.ptr
      %3510 = arith.constant 7 : i64
      %3511 = func.call @cc_make_string(%3509, %3510) : (!llvm.ptr, i64) -> i64
      %3512 = func.call @cc_intern(%3508, %3511) : (i64, i64) -> i64
      %3513 = func.call @cc_nil_value() : () -> i64
      %3514 = func.call @cc_cons(%3512, %3513) : (i64, i64) -> i64
      %3515 = func.call @cc_values_pack(%3514) : (i64) -> i64
      func.call @stack_push_pointer(%3512) : (i64) -> ()
      %3516 = func.call @stack_pop_pointer() : () -> i64
      %3517 = llvm.mlir.addressof @str300 : !llvm.ptr
      %3518 = arith.constant 6 : i64
      %3519 = func.call @cc_make_string(%3517, %3518) : (!llvm.ptr, i64) -> i64
      %3520 = func.call @cc_nil_value() : () -> i64
      %3521 = func.call @cc_intern(%3519, %3520) : (i64, i64) -> i64
      %3522 = func.call @cc_nil_value() : () -> i64
      %3523 = func.call @cc_cons(%3521, %3522) : (i64, i64) -> i64
      %3524 = func.call @cc_values_pack(%3523) : (i64) -> i64
      func.call @stack_push_pointer(%3521) : (i64) -> ()
      %3525 = func.call @stack_pop_pointer() : () -> i64
      %3526 = func.call @cc_nil_value() : () -> i64
      %3527 = func.call @cc_errorp(%3400) : (i64) -> i64
      %3528 = arith.cmpi ne, %3527, %3526 : i64
      %3529 = arith.cmpi eq, %3526, %3526 : i64
      %3530 = arith.andi %3528, %3529 : i1
      %3531 = scf.if %3530 -> (i64) {
        scf.yield %3400 : i64
      } else {
        scf.yield %3526 : i64
      }
      %3532 = func.call @cc_errorp(%3437) : (i64) -> i64
      %3533 = arith.cmpi ne, %3532, %3526 : i64
      %3534 = arith.cmpi eq, %3531, %3526 : i64
      %3535 = arith.andi %3533, %3534 : i1
      %3536 = scf.if %3535 -> (i64) {
        scf.yield %3437 : i64
      } else {
        scf.yield %3531 : i64
      }
      %3537 = func.call @cc_errorp(%3484) : (i64) -> i64
      %3538 = arith.cmpi ne, %3537, %3526 : i64
      %3539 = arith.cmpi eq, %3536, %3526 : i64
      %3540 = arith.andi %3538, %3539 : i1
      %3541 = scf.if %3540 -> (i64) {
        scf.yield %3484 : i64
      } else {
        scf.yield %3536 : i64
      }
      %3542 = func.call @cc_errorp(%3493) : (i64) -> i64
      %3543 = arith.cmpi ne, %3542, %3526 : i64
      %3544 = arith.cmpi eq, %3541, %3526 : i64
      %3545 = arith.andi %3543, %3544 : i1
      %3546 = scf.if %3545 -> (i64) {
        scf.yield %3493 : i64
      } else {
        scf.yield %3541 : i64
      }
      %3547 = func.call @cc_errorp(%3504) : (i64) -> i64
      %3548 = arith.cmpi ne, %3547, %3526 : i64
      %3549 = arith.cmpi eq, %3546, %3526 : i64
      %3550 = arith.andi %3548, %3549 : i1
      %3551 = scf.if %3550 -> (i64) {
        scf.yield %3504 : i64
      } else {
        scf.yield %3546 : i64
      }
      %3552 = func.call @cc_errorp(%3505) : (i64) -> i64
      %3553 = arith.cmpi ne, %3552, %3526 : i64
      %3554 = arith.cmpi eq, %3551, %3526 : i64
      %3555 = arith.andi %3553, %3554 : i1
      %3556 = scf.if %3555 -> (i64) {
        scf.yield %3505 : i64
      } else {
        scf.yield %3551 : i64
      }
      %3557 = func.call @cc_errorp(%3516) : (i64) -> i64
      %3558 = arith.cmpi ne, %3557, %3526 : i64
      %3559 = arith.cmpi eq, %3556, %3526 : i64
      %3560 = arith.andi %3558, %3559 : i1
      %3561 = scf.if %3560 -> (i64) {
        scf.yield %3516 : i64
      } else {
        scf.yield %3556 : i64
      }
      %3562 = func.call @cc_errorp(%3525) : (i64) -> i64
      %3563 = arith.cmpi ne, %3562, %3526 : i64
      %3564 = arith.cmpi eq, %3561, %3526 : i64
      %3565 = arith.andi %3563, %3564 : i1
      %3566 = scf.if %3565 -> (i64) {
        scf.yield %3525 : i64
      } else {
        scf.yield %3561 : i64
      }
      %3567 = arith.cmpi ne, %3566, %3526 : i64
      scf.if %3567 {
        func.call @stack_push_pointer(%3566) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3400) : (i64) -> ()
        func.call @stack_push_pointer(%3437) : (i64) -> ()
        func.call @stack_push_pointer(%3484) : (i64) -> ()
        func.call @stack_push_pointer(%3493) : (i64) -> ()
        func.call @stack_push_pointer(%3504) : (i64) -> ()
        func.call @stack_push_pointer(%3505) : (i64) -> ()
        func.call @stack_push_pointer(%3516) : (i64) -> ()
        func.call @stack_push_pointer(%3525) : (i64) -> ()
        %3568 = llvm.mlir.addressof @str301 : !llvm.ptr
        %3569 = func.call @cc_make_function_ref_const(%3568) : (!llvm.ptr) -> i64
        %3570 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3569, %3570) : (i64, i64) -> ()
      }
      %3571 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3571 : i64
    }
    %3572 = func.call @cc_nil_value() : () -> i64
    %3573 = func.call @cc_errorp(%3391) : (i64) -> i64
    %3574 = arith.cmpi ne, %3573, %3572 : i64
    %3575 = scf.if %3574 -> (i64) {
      scf.yield %3391 : i64
    } else {
      %3576 = llvm.mlir.addressof @str302 : !llvm.ptr
      %3577 = arith.constant 14 : i64
      %3578 = func.call @cc_make_string(%3576, %3577) : (!llvm.ptr, i64) -> i64
      %3579 = func.call @cc_nil_value() : () -> i64
      %3580 = func.call @cc_intern(%3578, %3579) : (i64, i64) -> i64
      %3581 = func.call @cc_nil_value() : () -> i64
      %3582 = func.call @cc_cons(%3580, %3581) : (i64, i64) -> i64
      %3583 = func.call @cc_values_pack(%3582) : (i64) -> i64
      func.call @stack_push_pointer(%3580) : (i64) -> ()
      %3584 = func.call @stack_pop_pointer() : () -> i64
      %3585 = llvm.mlir.addressof @str303 : !llvm.ptr
      %3586 = arith.constant 13 : i64
      %3587 = func.call @cc_make_string(%3585, %3586) : (!llvm.ptr, i64) -> i64
      %3588 = llvm.mlir.addressof @str304 : !llvm.ptr
      %3589 = arith.constant 11 : i64
      %3590 = func.call @cc_make_string(%3588, %3589) : (!llvm.ptr, i64) -> i64
      %3591 = func.call @cc_intern(%3587, %3590) : (i64, i64) -> i64
      %3592 = func.call @cc_nil_value() : () -> i64
      %3593 = func.call @cc_cons(%3591, %3592) : (i64, i64) -> i64
      %3594 = func.call @cc_values_pack(%3593) : (i64) -> i64
      func.call @stack_push_pointer(%3591) : (i64) -> ()
      %3595 = llvm.mlir.addressof @str305 : !llvm.ptr
      %3596 = arith.constant 6 : i64
      %3597 = func.call @cc_make_string(%3595, %3596) : (!llvm.ptr, i64) -> i64
      %3598 = func.call @cc_nil_value() : () -> i64
      %3599 = func.call @cc_intern(%3597, %3598) : (i64, i64) -> i64
      %3600 = func.call @cc_nil_value() : () -> i64
      %3601 = func.call @cc_cons(%3599, %3600) : (i64, i64) -> i64
      %3602 = func.call @cc_values_pack(%3601) : (i64) -> i64
      func.call @stack_push_pointer(%3599) : (i64) -> ()
      %3603 = llvm.mlir.addressof @str306 : !llvm.ptr
      %3604 = arith.constant 19 : i64
      %3605 = func.call @cc_make_string(%3603, %3604) : (!llvm.ptr, i64) -> i64
      %3606 = func.call @cc_nil_value() : () -> i64
      %3607 = func.call @cc_intern(%3605, %3606) : (i64, i64) -> i64
      %3608 = func.call @cc_nil_value() : () -> i64
      %3609 = func.call @cc_cons(%3607, %3608) : (i64, i64) -> i64
      %3610 = func.call @cc_values_pack(%3609) : (i64) -> i64
      func.call @stack_push_pointer(%3607) : (i64) -> ()
      %3611 = llvm.mlir.addressof @str307 : !llvm.ptr
      %3612 = arith.constant 13 : i64
      %3613 = func.call @cc_make_string(%3611, %3612) : (!llvm.ptr, i64) -> i64
      %3614 = llvm.mlir.addressof @str308 : !llvm.ptr
      %3615 = arith.constant 11 : i64
      %3616 = func.call @cc_make_string(%3614, %3615) : (!llvm.ptr, i64) -> i64
      %3617 = func.call @cc_intern(%3613, %3616) : (i64, i64) -> i64
      %3618 = func.call @cc_nil_value() : () -> i64
      %3619 = func.call @cc_cons(%3617, %3618) : (i64, i64) -> i64
      %3620 = func.call @cc_values_pack(%3619) : (i64) -> i64
      func.call @stack_push_pointer(%3617) : (i64) -> ()
      %3621 = llvm.mlir.addressof @str309 : !llvm.ptr
      %3622 = arith.constant 1 : i64
      %3623 = func.call @cc_make_string(%3621, %3622) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3623) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3624 = func.call @stack_pop_pointer() : () -> i64
      %3625 = func.call @stack_pop_pointer() : () -> i64
      %3626 = func.call @cc_cons(%3625, %3624) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3626) : (i64) -> ()
      %3627 = func.call @stack_pop_pointer() : () -> i64
      %3628 = func.call @stack_pop_pointer() : () -> i64
      %3629 = func.call @cc_cons(%3628, %3627) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3629) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3630 = func.call @stack_pop_pointer() : () -> i64
      %3631 = func.call @stack_pop_pointer() : () -> i64
      %3632 = func.call @cc_cons(%3631, %3630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3632) : (i64) -> ()
      %3633 = func.call @stack_pop_pointer() : () -> i64
      %3634 = func.call @stack_pop_pointer() : () -> i64
      %3635 = func.call @cc_cons(%3634, %3633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3635) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
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
      %3709 = arith.constant 122791386939408 : i64
      %3710 = arith.constant 0 : i64
      %3711 = func.call @cc_make_closure(%3709, %3710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3711) : (i64) -> ()
      %3712 = func.call @stack_pop_pointer() : () -> i64
      %3713 = llvm.mlir.addressof @str312 : !llvm.ptr
      %3714 = arith.constant 4 : i64
      %3715 = func.call @cc_make_string(%3713, %3714) : (!llvm.ptr, i64) -> i64
      %3716 = func.call @cc_nil_value() : () -> i64
      %3717 = func.call @cc_intern(%3715, %3716) : (i64, i64) -> i64
      %3718 = func.call @cc_nil_value() : () -> i64
      %3719 = func.call @cc_cons(%3717, %3718) : (i64, i64) -> i64
      %3720 = func.call @cc_values_pack(%3719) : (i64) -> i64
      func.call @stack_push_pointer(%3717) : (i64) -> ()
      %3721 = llvm.mlir.addressof @str313 : !llvm.ptr
      %3722 = arith.constant 11 : i64
      %3723 = func.call @cc_make_string(%3721, %3722) : (!llvm.ptr, i64) -> i64
      %3724 = llvm.mlir.addressof @str314 : !llvm.ptr
      %3725 = arith.constant 11 : i64
      %3726 = func.call @cc_make_string(%3724, %3725) : (!llvm.ptr, i64) -> i64
      %3727 = func.call @cc_intern(%3723, %3726) : (i64, i64) -> i64
      %3728 = func.call @cc_nil_value() : () -> i64
      %3729 = func.call @cc_cons(%3727, %3728) : (i64, i64) -> i64
      %3730 = func.call @cc_values_pack(%3729) : (i64) -> i64
      func.call @stack_push_pointer(%3727) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3731 = func.call @stack_pop_pointer() : () -> i64
      %3732 = func.call @stack_pop_pointer() : () -> i64
      %3733 = func.call @cc_cons(%3732, %3731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3733) : (i64) -> ()
      %3734 = func.call @stack_pop_pointer() : () -> i64
      %3735 = func.call @stack_pop_pointer() : () -> i64
      %3736 = func.call @cc_cons(%3735, %3734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3736) : (i64) -> ()
      %3737 = func.call @stack_pop_pointer() : () -> i64
      %3738 = llvm.mlir.addressof @str315 : !llvm.ptr
      %3739 = arith.constant 11 : i64
      %3740 = func.call @cc_make_string(%3738, %3739) : (!llvm.ptr, i64) -> i64
      %3741 = llvm.mlir.addressof @str316 : !llvm.ptr
      %3742 = arith.constant 7 : i64
      %3743 = func.call @cc_make_string(%3741, %3742) : (!llvm.ptr, i64) -> i64
      %3744 = func.call @cc_intern(%3740, %3743) : (i64, i64) -> i64
      %3745 = func.call @cc_nil_value() : () -> i64
      %3746 = func.call @cc_cons(%3744, %3745) : (i64, i64) -> i64
      %3747 = func.call @cc_values_pack(%3746) : (i64) -> i64
      func.call @stack_push_pointer(%3744) : (i64) -> ()
      %3748 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3749 = func.call @stack_pop_pointer() : () -> i64
      %3750 = llvm.mlir.addressof @str317 : !llvm.ptr
      %3751 = arith.constant 4 : i64
      %3752 = func.call @cc_make_string(%3750, %3751) : (!llvm.ptr, i64) -> i64
      %3753 = llvm.mlir.addressof @str318 : !llvm.ptr
      %3754 = arith.constant 7 : i64
      %3755 = func.call @cc_make_string(%3753, %3754) : (!llvm.ptr, i64) -> i64
      %3756 = func.call @cc_intern(%3752, %3755) : (i64, i64) -> i64
      %3757 = func.call @cc_nil_value() : () -> i64
      %3758 = func.call @cc_cons(%3756, %3757) : (i64, i64) -> i64
      %3759 = func.call @cc_values_pack(%3758) : (i64) -> i64
      func.call @stack_push_pointer(%3756) : (i64) -> ()
      %3760 = func.call @stack_pop_pointer() : () -> i64
      %3761 = llvm.mlir.addressof @str319 : !llvm.ptr
      %3762 = arith.constant 5 : i64
      %3763 = func.call @cc_make_string(%3761, %3762) : (!llvm.ptr, i64) -> i64
      %3764 = func.call @cc_nil_value() : () -> i64
      %3765 = func.call @cc_intern(%3763, %3764) : (i64, i64) -> i64
      %3766 = func.call @cc_nil_value() : () -> i64
      %3767 = func.call @cc_cons(%3765, %3766) : (i64, i64) -> i64
      %3768 = func.call @cc_values_pack(%3767) : (i64) -> i64
      func.call @stack_push_pointer(%3765) : (i64) -> ()
      %3769 = func.call @stack_pop_pointer() : () -> i64
      %3770 = func.call @cc_nil_value() : () -> i64
      %3771 = func.call @cc_errorp(%3584) : (i64) -> i64
      %3772 = arith.cmpi ne, %3771, %3770 : i64
      %3773 = arith.cmpi eq, %3770, %3770 : i64
      %3774 = arith.andi %3772, %3773 : i1
      %3775 = scf.if %3774 -> (i64) {
        scf.yield %3584 : i64
      } else {
        scf.yield %3770 : i64
      }
      %3776 = func.call @cc_errorp(%3651) : (i64) -> i64
      %3777 = arith.cmpi ne, %3776, %3770 : i64
      %3778 = arith.cmpi eq, %3775, %3770 : i64
      %3779 = arith.andi %3777, %3778 : i1
      %3780 = scf.if %3779 -> (i64) {
        scf.yield %3651 : i64
      } else {
        scf.yield %3775 : i64
      }
      %3781 = func.call @cc_errorp(%3712) : (i64) -> i64
      %3782 = arith.cmpi ne, %3781, %3770 : i64
      %3783 = arith.cmpi eq, %3780, %3770 : i64
      %3784 = arith.andi %3782, %3783 : i1
      %3785 = scf.if %3784 -> (i64) {
        scf.yield %3712 : i64
      } else {
        scf.yield %3780 : i64
      }
      %3786 = func.call @cc_errorp(%3737) : (i64) -> i64
      %3787 = arith.cmpi ne, %3786, %3770 : i64
      %3788 = arith.cmpi eq, %3785, %3770 : i64
      %3789 = arith.andi %3787, %3788 : i1
      %3790 = scf.if %3789 -> (i64) {
        scf.yield %3737 : i64
      } else {
        scf.yield %3785 : i64
      }
      %3791 = func.call @cc_errorp(%3748) : (i64) -> i64
      %3792 = arith.cmpi ne, %3791, %3770 : i64
      %3793 = arith.cmpi eq, %3790, %3770 : i64
      %3794 = arith.andi %3792, %3793 : i1
      %3795 = scf.if %3794 -> (i64) {
        scf.yield %3748 : i64
      } else {
        scf.yield %3790 : i64
      }
      %3796 = func.call @cc_errorp(%3749) : (i64) -> i64
      %3797 = arith.cmpi ne, %3796, %3770 : i64
      %3798 = arith.cmpi eq, %3795, %3770 : i64
      %3799 = arith.andi %3797, %3798 : i1
      %3800 = scf.if %3799 -> (i64) {
        scf.yield %3749 : i64
      } else {
        scf.yield %3795 : i64
      }
      %3801 = func.call @cc_errorp(%3760) : (i64) -> i64
      %3802 = arith.cmpi ne, %3801, %3770 : i64
      %3803 = arith.cmpi eq, %3800, %3770 : i64
      %3804 = arith.andi %3802, %3803 : i1
      %3805 = scf.if %3804 -> (i64) {
        scf.yield %3760 : i64
      } else {
        scf.yield %3800 : i64
      }
      %3806 = func.call @cc_errorp(%3769) : (i64) -> i64
      %3807 = arith.cmpi ne, %3806, %3770 : i64
      %3808 = arith.cmpi eq, %3805, %3770 : i64
      %3809 = arith.andi %3807, %3808 : i1
      %3810 = scf.if %3809 -> (i64) {
        scf.yield %3769 : i64
      } else {
        scf.yield %3805 : i64
      }
      %3811 = arith.cmpi ne, %3810, %3770 : i64
      scf.if %3811 {
        func.call @stack_push_pointer(%3810) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3584) : (i64) -> ()
        func.call @stack_push_pointer(%3651) : (i64) -> ()
        func.call @stack_push_pointer(%3712) : (i64) -> ()
        func.call @stack_push_pointer(%3737) : (i64) -> ()
        func.call @stack_push_pointer(%3748) : (i64) -> ()
        func.call @stack_push_pointer(%3749) : (i64) -> ()
        func.call @stack_push_pointer(%3760) : (i64) -> ()
        func.call @stack_push_pointer(%3769) : (i64) -> ()
        %3812 = llvm.mlir.addressof @str320 : !llvm.ptr
        %3813 = func.call @cc_make_function_ref_const(%3812) : (!llvm.ptr) -> i64
        %3814 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3813, %3814) : (i64, i64) -> ()
      }
      %3815 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3815 : i64
    }
    %3816 = func.call @cc_nil_value() : () -> i64
    %3817 = func.call @cc_errorp(%3575) : (i64) -> i64
    %3818 = arith.cmpi ne, %3817, %3816 : i64
    %3819 = scf.if %3818 -> (i64) {
      scf.yield %3575 : i64
    } else {
      %3820 = llvm.mlir.addressof @str321 : !llvm.ptr
      %3821 = arith.constant 14 : i64
      %3822 = func.call @cc_make_string(%3820, %3821) : (!llvm.ptr, i64) -> i64
      %3823 = func.call @cc_nil_value() : () -> i64
      %3824 = func.call @cc_intern(%3822, %3823) : (i64, i64) -> i64
      %3825 = func.call @cc_nil_value() : () -> i64
      %3826 = func.call @cc_cons(%3824, %3825) : (i64, i64) -> i64
      %3827 = func.call @cc_values_pack(%3826) : (i64) -> i64
      func.call @stack_push_pointer(%3824) : (i64) -> ()
      %3828 = func.call @stack_pop_pointer() : () -> i64
      %3829 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3830 = arith.constant 13 : i64
      %3831 = func.call @cc_make_string(%3829, %3830) : (!llvm.ptr, i64) -> i64
      %3832 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3833 = arith.constant 11 : i64
      %3834 = func.call @cc_make_string(%3832, %3833) : (!llvm.ptr, i64) -> i64
      %3835 = func.call @cc_intern(%3831, %3834) : (i64, i64) -> i64
      %3836 = func.call @cc_nil_value() : () -> i64
      %3837 = func.call @cc_cons(%3835, %3836) : (i64, i64) -> i64
      %3838 = func.call @cc_values_pack(%3837) : (i64) -> i64
      func.call @stack_push_pointer(%3835) : (i64) -> ()
      %3839 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3840 = arith.constant 6 : i64
      %3841 = func.call @cc_make_string(%3839, %3840) : (!llvm.ptr, i64) -> i64
      %3842 = func.call @cc_nil_value() : () -> i64
      %3843 = func.call @cc_intern(%3841, %3842) : (i64, i64) -> i64
      %3844 = func.call @cc_nil_value() : () -> i64
      %3845 = func.call @cc_cons(%3843, %3844) : (i64, i64) -> i64
      %3846 = func.call @cc_values_pack(%3845) : (i64) -> i64
      func.call @stack_push_pointer(%3843) : (i64) -> ()
      %3847 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3848 = arith.constant 19 : i64
      %3849 = func.call @cc_make_string(%3847, %3848) : (!llvm.ptr, i64) -> i64
      %3850 = func.call @cc_nil_value() : () -> i64
      %3851 = func.call @cc_intern(%3849, %3850) : (i64, i64) -> i64
      %3852 = func.call @cc_nil_value() : () -> i64
      %3853 = func.call @cc_cons(%3851, %3852) : (i64, i64) -> i64
      %3854 = func.call @cc_values_pack(%3853) : (i64) -> i64
      func.call @stack_push_pointer(%3851) : (i64) -> ()
      %3855 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3856 = arith.constant 13 : i64
      %3857 = func.call @cc_make_string(%3855, %3856) : (!llvm.ptr, i64) -> i64
      %3858 = llvm.mlir.addressof @str327 : !llvm.ptr
      %3859 = arith.constant 11 : i64
      %3860 = func.call @cc_make_string(%3858, %3859) : (!llvm.ptr, i64) -> i64
      %3861 = func.call @cc_intern(%3857, %3860) : (i64, i64) -> i64
      %3862 = func.call @cc_nil_value() : () -> i64
      %3863 = func.call @cc_cons(%3861, %3862) : (i64, i64) -> i64
      %3864 = func.call @cc_values_pack(%3863) : (i64) -> i64
      func.call @stack_push_pointer(%3861) : (i64) -> ()
      %3865 = llvm.mlir.addressof @str328 : !llvm.ptr
      %3866 = arith.constant 1 : i64
      %3867 = func.call @cc_make_string(%3865, %3866) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3867) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3868 = func.call @stack_pop_pointer() : () -> i64
      %3869 = func.call @stack_pop_pointer() : () -> i64
      %3870 = func.call @cc_cons(%3869, %3868) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3870) : (i64) -> ()
      %3871 = func.call @stack_pop_pointer() : () -> i64
      %3872 = func.call @stack_pop_pointer() : () -> i64
      %3873 = func.call @cc_cons(%3872, %3871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3873) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3874 = func.call @stack_pop_pointer() : () -> i64
      %3875 = func.call @stack_pop_pointer() : () -> i64
      %3876 = func.call @cc_cons(%3875, %3874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3876) : (i64) -> ()
      %3877 = func.call @stack_pop_pointer() : () -> i64
      %3878 = func.call @stack_pop_pointer() : () -> i64
      %3879 = func.call @cc_cons(%3878, %3877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3879) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %3889 = func.call @stack_pop_pointer() : () -> i64
      %3890 = func.call @stack_pop_pointer() : () -> i64
      %3891 = func.call @cc_cons(%3890, %3889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3891) : (i64) -> ()
      %3892 = func.call @stack_pop_pointer() : () -> i64
      %3893 = func.call @stack_pop_pointer() : () -> i64
      %3894 = func.call @cc_cons(%3893, %3892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3894) : (i64) -> ()
      %3895 = func.call @stack_pop_pointer() : () -> i64
      %3953 = arith.constant 122791386939409 : i64
      %3954 = arith.constant 0 : i64
      %3955 = func.call @cc_make_closure(%3953, %3954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3955) : (i64) -> ()
      %3956 = func.call @stack_pop_pointer() : () -> i64
      %3957 = llvm.mlir.addressof @str331 : !llvm.ptr
      %3958 = arith.constant 4 : i64
      %3959 = func.call @cc_make_string(%3957, %3958) : (!llvm.ptr, i64) -> i64
      %3960 = func.call @cc_nil_value() : () -> i64
      %3961 = func.call @cc_intern(%3959, %3960) : (i64, i64) -> i64
      %3962 = func.call @cc_nil_value() : () -> i64
      %3963 = func.call @cc_cons(%3961, %3962) : (i64, i64) -> i64
      %3964 = func.call @cc_values_pack(%3963) : (i64) -> i64
      func.call @stack_push_pointer(%3961) : (i64) -> ()
      %3965 = llvm.mlir.addressof @str332 : !llvm.ptr
      %3966 = arith.constant 11 : i64
      %3967 = func.call @cc_make_string(%3965, %3966) : (!llvm.ptr, i64) -> i64
      %3968 = llvm.mlir.addressof @str333 : !llvm.ptr
      %3969 = arith.constant 11 : i64
      %3970 = func.call @cc_make_string(%3968, %3969) : (!llvm.ptr, i64) -> i64
      %3971 = func.call @cc_intern(%3967, %3970) : (i64, i64) -> i64
      %3972 = func.call @cc_nil_value() : () -> i64
      %3973 = func.call @cc_cons(%3971, %3972) : (i64, i64) -> i64
      %3974 = func.call @cc_values_pack(%3973) : (i64) -> i64
      func.call @stack_push_pointer(%3971) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %3975 = func.call @stack_pop_pointer() : () -> i64
      %3976 = func.call @stack_pop_pointer() : () -> i64
      %3977 = func.call @cc_cons(%3976, %3975) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3977) : (i64) -> ()
      %3978 = func.call @stack_pop_pointer() : () -> i64
      %3979 = func.call @stack_pop_pointer() : () -> i64
      %3980 = func.call @cc_cons(%3979, %3978) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3980) : (i64) -> ()
      %3981 = func.call @stack_pop_pointer() : () -> i64
      %3982 = llvm.mlir.addressof @str334 : !llvm.ptr
      %3983 = arith.constant 11 : i64
      %3984 = func.call @cc_make_string(%3982, %3983) : (!llvm.ptr, i64) -> i64
      %3985 = llvm.mlir.addressof @str335 : !llvm.ptr
      %3986 = arith.constant 7 : i64
      %3987 = func.call @cc_make_string(%3985, %3986) : (!llvm.ptr, i64) -> i64
      %3988 = func.call @cc_intern(%3984, %3987) : (i64, i64) -> i64
      %3989 = func.call @cc_nil_value() : () -> i64
      %3990 = func.call @cc_cons(%3988, %3989) : (i64, i64) -> i64
      %3991 = func.call @cc_values_pack(%3990) : (i64) -> i64
      func.call @stack_push_pointer(%3988) : (i64) -> ()
      %3992 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3993 = func.call @stack_pop_pointer() : () -> i64
      %3994 = llvm.mlir.addressof @str336 : !llvm.ptr
      %3995 = arith.constant 4 : i64
      %3996 = func.call @cc_make_string(%3994, %3995) : (!llvm.ptr, i64) -> i64
      %3997 = llvm.mlir.addressof @str337 : !llvm.ptr
      %3998 = arith.constant 7 : i64
      %3999 = func.call @cc_make_string(%3997, %3998) : (!llvm.ptr, i64) -> i64
      %4000 = func.call @cc_intern(%3996, %3999) : (i64, i64) -> i64
      %4001 = func.call @cc_nil_value() : () -> i64
      %4002 = func.call @cc_cons(%4000, %4001) : (i64, i64) -> i64
      %4003 = func.call @cc_values_pack(%4002) : (i64) -> i64
      func.call @stack_push_pointer(%4000) : (i64) -> ()
      %4004 = func.call @stack_pop_pointer() : () -> i64
      %4005 = llvm.mlir.addressof @str338 : !llvm.ptr
      %4006 = arith.constant 5 : i64
      %4007 = func.call @cc_make_string(%4005, %4006) : (!llvm.ptr, i64) -> i64
      %4008 = func.call @cc_nil_value() : () -> i64
      %4009 = func.call @cc_intern(%4007, %4008) : (i64, i64) -> i64
      %4010 = func.call @cc_nil_value() : () -> i64
      %4011 = func.call @cc_cons(%4009, %4010) : (i64, i64) -> i64
      %4012 = func.call @cc_values_pack(%4011) : (i64) -> i64
      func.call @stack_push_pointer(%4009) : (i64) -> ()
      %4013 = func.call @stack_pop_pointer() : () -> i64
      %4014 = func.call @cc_nil_value() : () -> i64
      %4015 = func.call @cc_errorp(%3828) : (i64) -> i64
      %4016 = arith.cmpi ne, %4015, %4014 : i64
      %4017 = arith.cmpi eq, %4014, %4014 : i64
      %4018 = arith.andi %4016, %4017 : i1
      %4019 = scf.if %4018 -> (i64) {
        scf.yield %3828 : i64
      } else {
        scf.yield %4014 : i64
      }
      %4020 = func.call @cc_errorp(%3895) : (i64) -> i64
      %4021 = arith.cmpi ne, %4020, %4014 : i64
      %4022 = arith.cmpi eq, %4019, %4014 : i64
      %4023 = arith.andi %4021, %4022 : i1
      %4024 = scf.if %4023 -> (i64) {
        scf.yield %3895 : i64
      } else {
        scf.yield %4019 : i64
      }
      %4025 = func.call @cc_errorp(%3956) : (i64) -> i64
      %4026 = arith.cmpi ne, %4025, %4014 : i64
      %4027 = arith.cmpi eq, %4024, %4014 : i64
      %4028 = arith.andi %4026, %4027 : i1
      %4029 = scf.if %4028 -> (i64) {
        scf.yield %3956 : i64
      } else {
        scf.yield %4024 : i64
      }
      %4030 = func.call @cc_errorp(%3981) : (i64) -> i64
      %4031 = arith.cmpi ne, %4030, %4014 : i64
      %4032 = arith.cmpi eq, %4029, %4014 : i64
      %4033 = arith.andi %4031, %4032 : i1
      %4034 = scf.if %4033 -> (i64) {
        scf.yield %3981 : i64
      } else {
        scf.yield %4029 : i64
      }
      %4035 = func.call @cc_errorp(%3992) : (i64) -> i64
      %4036 = arith.cmpi ne, %4035, %4014 : i64
      %4037 = arith.cmpi eq, %4034, %4014 : i64
      %4038 = arith.andi %4036, %4037 : i1
      %4039 = scf.if %4038 -> (i64) {
        scf.yield %3992 : i64
      } else {
        scf.yield %4034 : i64
      }
      %4040 = func.call @cc_errorp(%3993) : (i64) -> i64
      %4041 = arith.cmpi ne, %4040, %4014 : i64
      %4042 = arith.cmpi eq, %4039, %4014 : i64
      %4043 = arith.andi %4041, %4042 : i1
      %4044 = scf.if %4043 -> (i64) {
        scf.yield %3993 : i64
      } else {
        scf.yield %4039 : i64
      }
      %4045 = func.call @cc_errorp(%4004) : (i64) -> i64
      %4046 = arith.cmpi ne, %4045, %4014 : i64
      %4047 = arith.cmpi eq, %4044, %4014 : i64
      %4048 = arith.andi %4046, %4047 : i1
      %4049 = scf.if %4048 -> (i64) {
        scf.yield %4004 : i64
      } else {
        scf.yield %4044 : i64
      }
      %4050 = func.call @cc_errorp(%4013) : (i64) -> i64
      %4051 = arith.cmpi ne, %4050, %4014 : i64
      %4052 = arith.cmpi eq, %4049, %4014 : i64
      %4053 = arith.andi %4051, %4052 : i1
      %4054 = scf.if %4053 -> (i64) {
        scf.yield %4013 : i64
      } else {
        scf.yield %4049 : i64
      }
      %4055 = arith.cmpi ne, %4054, %4014 : i64
      scf.if %4055 {
        func.call @stack_push_pointer(%4054) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3828) : (i64) -> ()
        func.call @stack_push_pointer(%3895) : (i64) -> ()
        func.call @stack_push_pointer(%3956) : (i64) -> ()
        func.call @stack_push_pointer(%3981) : (i64) -> ()
        func.call @stack_push_pointer(%3992) : (i64) -> ()
        func.call @stack_push_pointer(%3993) : (i64) -> ()
        func.call @stack_push_pointer(%4004) : (i64) -> ()
        func.call @stack_push_pointer(%4013) : (i64) -> ()
        %4056 = llvm.mlir.addressof @str339 : !llvm.ptr
        %4057 = func.call @cc_make_function_ref_const(%4056) : (!llvm.ptr) -> i64
        %4058 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4057, %4058) : (i64, i64) -> ()
      }
      %4059 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4059 : i64
    }
    %4060 = func.call @cc_nil_value() : () -> i64
    %4061 = func.call @cc_errorp(%3819) : (i64) -> i64
    %4062 = arith.cmpi ne, %4061, %4060 : i64
    %4063 = scf.if %4062 -> (i64) {
      scf.yield %3819 : i64
    } else {
      %4064 = llvm.mlir.addressof @str340 : !llvm.ptr
      %4065 = arith.constant 14 : i64
      %4066 = func.call @cc_make_string(%4064, %4065) : (!llvm.ptr, i64) -> i64
      %4067 = func.call @cc_nil_value() : () -> i64
      %4068 = func.call @cc_intern(%4066, %4067) : (i64, i64) -> i64
      %4069 = func.call @cc_nil_value() : () -> i64
      %4070 = func.call @cc_cons(%4068, %4069) : (i64, i64) -> i64
      %4071 = func.call @cc_values_pack(%4070) : (i64) -> i64
      func.call @stack_push_pointer(%4068) : (i64) -> ()
      %4072 = func.call @stack_pop_pointer() : () -> i64
      %4073 = llvm.mlir.addressof @str341 : !llvm.ptr
      %4074 = arith.constant 13 : i64
      %4075 = func.call @cc_make_string(%4073, %4074) : (!llvm.ptr, i64) -> i64
      %4076 = llvm.mlir.addressof @str342 : !llvm.ptr
      %4077 = arith.constant 11 : i64
      %4078 = func.call @cc_make_string(%4076, %4077) : (!llvm.ptr, i64) -> i64
      %4079 = func.call @cc_intern(%4075, %4078) : (i64, i64) -> i64
      %4080 = func.call @cc_nil_value() : () -> i64
      %4081 = func.call @cc_cons(%4079, %4080) : (i64, i64) -> i64
      %4082 = func.call @cc_values_pack(%4081) : (i64) -> i64
      func.call @stack_push_pointer(%4079) : (i64) -> ()
      %4083 = llvm.mlir.addressof @str343 : !llvm.ptr
      %4084 = arith.constant 6 : i64
      %4085 = func.call @cc_make_string(%4083, %4084) : (!llvm.ptr, i64) -> i64
      %4086 = func.call @cc_nil_value() : () -> i64
      %4087 = func.call @cc_intern(%4085, %4086) : (i64, i64) -> i64
      %4088 = func.call @cc_nil_value() : () -> i64
      %4089 = func.call @cc_cons(%4087, %4088) : (i64, i64) -> i64
      %4090 = func.call @cc_values_pack(%4089) : (i64) -> i64
      func.call @stack_push_pointer(%4087) : (i64) -> ()
      %4091 = llvm.mlir.addressof @str344 : !llvm.ptr
      %4092 = arith.constant 19 : i64
      %4093 = func.call @cc_make_string(%4091, %4092) : (!llvm.ptr, i64) -> i64
      %4094 = func.call @cc_nil_value() : () -> i64
      %4095 = func.call @cc_intern(%4093, %4094) : (i64, i64) -> i64
      %4096 = func.call @cc_nil_value() : () -> i64
      %4097 = func.call @cc_cons(%4095, %4096) : (i64, i64) -> i64
      %4098 = func.call @cc_values_pack(%4097) : (i64) -> i64
      func.call @stack_push_pointer(%4095) : (i64) -> ()
      %4099 = llvm.mlir.addressof @str345 : !llvm.ptr
      %4100 = arith.constant 13 : i64
      %4101 = func.call @cc_make_string(%4099, %4100) : (!llvm.ptr, i64) -> i64
      %4102 = llvm.mlir.addressof @str346 : !llvm.ptr
      %4103 = arith.constant 11 : i64
      %4104 = func.call @cc_make_string(%4102, %4103) : (!llvm.ptr, i64) -> i64
      %4105 = func.call @cc_intern(%4101, %4104) : (i64, i64) -> i64
      %4106 = func.call @cc_nil_value() : () -> i64
      %4107 = func.call @cc_cons(%4105, %4106) : (i64, i64) -> i64
      %4108 = func.call @cc_values_pack(%4107) : (i64) -> i64
      func.call @stack_push_pointer(%4105) : (i64) -> ()
      %4109 = llvm.mlir.addressof @str347 : !llvm.ptr
      %4110 = arith.constant 0 : i64
      %4111 = func.call @cc_make_string(%4109, %4110) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4111) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4112 = func.call @stack_pop_pointer() : () -> i64
      %4113 = func.call @stack_pop_pointer() : () -> i64
      %4114 = func.call @cc_cons(%4113, %4112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4114) : (i64) -> ()
      %4115 = func.call @stack_pop_pointer() : () -> i64
      %4116 = func.call @stack_pop_pointer() : () -> i64
      %4117 = func.call @cc_cons(%4116, %4115) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4117) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4118 = func.call @stack_pop_pointer() : () -> i64
      %4119 = func.call @stack_pop_pointer() : () -> i64
      %4120 = func.call @cc_cons(%4119, %4118) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4120) : (i64) -> ()
      %4121 = func.call @stack_pop_pointer() : () -> i64
      %4122 = func.call @stack_pop_pointer() : () -> i64
      %4123 = func.call @cc_cons(%4122, %4121) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4123) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %4124 = func.call @stack_pop_pointer() : () -> i64
      %4125 = func.call @stack_pop_pointer() : () -> i64
      %4126 = func.call @cc_cons(%4125, %4124) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4126) : (i64) -> ()
      %4127 = func.call @stack_pop_pointer() : () -> i64
      %4128 = func.call @stack_pop_pointer() : () -> i64
      %4129 = func.call @cc_cons(%4128, %4127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4129) : (i64) -> ()
      %4130 = func.call @stack_pop_pointer() : () -> i64
      %4131 = func.call @stack_pop_pointer() : () -> i64
      %4132 = func.call @cc_cons(%4131, %4130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4132) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4133 = func.call @stack_pop_pointer() : () -> i64
      %4134 = func.call @stack_pop_pointer() : () -> i64
      %4135 = func.call @cc_cons(%4134, %4133) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4135) : (i64) -> ()
      %4136 = func.call @stack_pop_pointer() : () -> i64
      %4137 = func.call @stack_pop_pointer() : () -> i64
      %4138 = func.call @cc_cons(%4137, %4136) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4138) : (i64) -> ()
      %4139 = func.call @stack_pop_pointer() : () -> i64
      %4197 = arith.constant 122791386939410 : i64
      %4198 = arith.constant 0 : i64
      %4199 = func.call @cc_make_closure(%4197, %4198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4199) : (i64) -> ()
      %4200 = func.call @stack_pop_pointer() : () -> i64
      %4201 = llvm.mlir.addressof @str350 : !llvm.ptr
      %4202 = arith.constant 4 : i64
      %4203 = func.call @cc_make_string(%4201, %4202) : (!llvm.ptr, i64) -> i64
      %4204 = func.call @cc_nil_value() : () -> i64
      %4205 = func.call @cc_intern(%4203, %4204) : (i64, i64) -> i64
      %4206 = func.call @cc_nil_value() : () -> i64
      %4207 = func.call @cc_cons(%4205, %4206) : (i64, i64) -> i64
      %4208 = func.call @cc_values_pack(%4207) : (i64) -> i64
      func.call @stack_push_pointer(%4205) : (i64) -> ()
      %4209 = llvm.mlir.addressof @str351 : !llvm.ptr
      %4210 = arith.constant 11 : i64
      %4211 = func.call @cc_make_string(%4209, %4210) : (!llvm.ptr, i64) -> i64
      %4212 = llvm.mlir.addressof @str352 : !llvm.ptr
      %4213 = arith.constant 11 : i64
      %4214 = func.call @cc_make_string(%4212, %4213) : (!llvm.ptr, i64) -> i64
      %4215 = func.call @cc_intern(%4211, %4214) : (i64, i64) -> i64
      %4216 = func.call @cc_nil_value() : () -> i64
      %4217 = func.call @cc_cons(%4215, %4216) : (i64, i64) -> i64
      %4218 = func.call @cc_values_pack(%4217) : (i64) -> i64
      func.call @stack_push_pointer(%4215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4219 = func.call @stack_pop_pointer() : () -> i64
      %4220 = func.call @stack_pop_pointer() : () -> i64
      %4221 = func.call @cc_cons(%4220, %4219) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4221) : (i64) -> ()
      %4222 = func.call @stack_pop_pointer() : () -> i64
      %4223 = func.call @stack_pop_pointer() : () -> i64
      %4224 = func.call @cc_cons(%4223, %4222) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4224) : (i64) -> ()
      %4225 = func.call @stack_pop_pointer() : () -> i64
      %4226 = llvm.mlir.addressof @str353 : !llvm.ptr
      %4227 = arith.constant 11 : i64
      %4228 = func.call @cc_make_string(%4226, %4227) : (!llvm.ptr, i64) -> i64
      %4229 = llvm.mlir.addressof @str354 : !llvm.ptr
      %4230 = arith.constant 7 : i64
      %4231 = func.call @cc_make_string(%4229, %4230) : (!llvm.ptr, i64) -> i64
      %4232 = func.call @cc_intern(%4228, %4231) : (i64, i64) -> i64
      %4233 = func.call @cc_nil_value() : () -> i64
      %4234 = func.call @cc_cons(%4232, %4233) : (i64, i64) -> i64
      %4235 = func.call @cc_values_pack(%4234) : (i64) -> i64
      func.call @stack_push_pointer(%4232) : (i64) -> ()
      %4236 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4237 = func.call @stack_pop_pointer() : () -> i64
      %4238 = llvm.mlir.addressof @str355 : !llvm.ptr
      %4239 = arith.constant 4 : i64
      %4240 = func.call @cc_make_string(%4238, %4239) : (!llvm.ptr, i64) -> i64
      %4241 = llvm.mlir.addressof @str356 : !llvm.ptr
      %4242 = arith.constant 7 : i64
      %4243 = func.call @cc_make_string(%4241, %4242) : (!llvm.ptr, i64) -> i64
      %4244 = func.call @cc_intern(%4240, %4243) : (i64, i64) -> i64
      %4245 = func.call @cc_nil_value() : () -> i64
      %4246 = func.call @cc_cons(%4244, %4245) : (i64, i64) -> i64
      %4247 = func.call @cc_values_pack(%4246) : (i64) -> i64
      func.call @stack_push_pointer(%4244) : (i64) -> ()
      %4248 = func.call @stack_pop_pointer() : () -> i64
      %4249 = llvm.mlir.addressof @str357 : !llvm.ptr
      %4250 = arith.constant 5 : i64
      %4251 = func.call @cc_make_string(%4249, %4250) : (!llvm.ptr, i64) -> i64
      %4252 = func.call @cc_nil_value() : () -> i64
      %4253 = func.call @cc_intern(%4251, %4252) : (i64, i64) -> i64
      %4254 = func.call @cc_nil_value() : () -> i64
      %4255 = func.call @cc_cons(%4253, %4254) : (i64, i64) -> i64
      %4256 = func.call @cc_values_pack(%4255) : (i64) -> i64
      func.call @stack_push_pointer(%4253) : (i64) -> ()
      %4257 = func.call @stack_pop_pointer() : () -> i64
      %4258 = func.call @cc_nil_value() : () -> i64
      %4259 = func.call @cc_errorp(%4072) : (i64) -> i64
      %4260 = arith.cmpi ne, %4259, %4258 : i64
      %4261 = arith.cmpi eq, %4258, %4258 : i64
      %4262 = arith.andi %4260, %4261 : i1
      %4263 = scf.if %4262 -> (i64) {
        scf.yield %4072 : i64
      } else {
        scf.yield %4258 : i64
      }
      %4264 = func.call @cc_errorp(%4139) : (i64) -> i64
      %4265 = arith.cmpi ne, %4264, %4258 : i64
      %4266 = arith.cmpi eq, %4263, %4258 : i64
      %4267 = arith.andi %4265, %4266 : i1
      %4268 = scf.if %4267 -> (i64) {
        scf.yield %4139 : i64
      } else {
        scf.yield %4263 : i64
      }
      %4269 = func.call @cc_errorp(%4200) : (i64) -> i64
      %4270 = arith.cmpi ne, %4269, %4258 : i64
      %4271 = arith.cmpi eq, %4268, %4258 : i64
      %4272 = arith.andi %4270, %4271 : i1
      %4273 = scf.if %4272 -> (i64) {
        scf.yield %4200 : i64
      } else {
        scf.yield %4268 : i64
      }
      %4274 = func.call @cc_errorp(%4225) : (i64) -> i64
      %4275 = arith.cmpi ne, %4274, %4258 : i64
      %4276 = arith.cmpi eq, %4273, %4258 : i64
      %4277 = arith.andi %4275, %4276 : i1
      %4278 = scf.if %4277 -> (i64) {
        scf.yield %4225 : i64
      } else {
        scf.yield %4273 : i64
      }
      %4279 = func.call @cc_errorp(%4236) : (i64) -> i64
      %4280 = arith.cmpi ne, %4279, %4258 : i64
      %4281 = arith.cmpi eq, %4278, %4258 : i64
      %4282 = arith.andi %4280, %4281 : i1
      %4283 = scf.if %4282 -> (i64) {
        scf.yield %4236 : i64
      } else {
        scf.yield %4278 : i64
      }
      %4284 = func.call @cc_errorp(%4237) : (i64) -> i64
      %4285 = arith.cmpi ne, %4284, %4258 : i64
      %4286 = arith.cmpi eq, %4283, %4258 : i64
      %4287 = arith.andi %4285, %4286 : i1
      %4288 = scf.if %4287 -> (i64) {
        scf.yield %4237 : i64
      } else {
        scf.yield %4283 : i64
      }
      %4289 = func.call @cc_errorp(%4248) : (i64) -> i64
      %4290 = arith.cmpi ne, %4289, %4258 : i64
      %4291 = arith.cmpi eq, %4288, %4258 : i64
      %4292 = arith.andi %4290, %4291 : i1
      %4293 = scf.if %4292 -> (i64) {
        scf.yield %4248 : i64
      } else {
        scf.yield %4288 : i64
      }
      %4294 = func.call @cc_errorp(%4257) : (i64) -> i64
      %4295 = arith.cmpi ne, %4294, %4258 : i64
      %4296 = arith.cmpi eq, %4293, %4258 : i64
      %4297 = arith.andi %4295, %4296 : i1
      %4298 = scf.if %4297 -> (i64) {
        scf.yield %4257 : i64
      } else {
        scf.yield %4293 : i64
      }
      %4299 = arith.cmpi ne, %4298, %4258 : i64
      scf.if %4299 {
        func.call @stack_push_pointer(%4298) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4072) : (i64) -> ()
        func.call @stack_push_pointer(%4139) : (i64) -> ()
        func.call @stack_push_pointer(%4200) : (i64) -> ()
        func.call @stack_push_pointer(%4225) : (i64) -> ()
        func.call @stack_push_pointer(%4236) : (i64) -> ()
        func.call @stack_push_pointer(%4237) : (i64) -> ()
        func.call @stack_push_pointer(%4248) : (i64) -> ()
        func.call @stack_push_pointer(%4257) : (i64) -> ()
        %4300 = llvm.mlir.addressof @str358 : !llvm.ptr
        %4301 = func.call @cc_make_function_ref_const(%4300) : (!llvm.ptr) -> i64
        %4302 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4301, %4302) : (i64, i64) -> ()
      }
      %4303 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4303 : i64
    }
    %4304 = func.call @cc_nil_value() : () -> i64
    %4305 = func.call @cc_errorp(%4063) : (i64) -> i64
    %4306 = arith.cmpi ne, %4305, %4304 : i64
    %4307 = scf.if %4306 -> (i64) {
      scf.yield %4063 : i64
    } else {
      %4308 = llvm.mlir.addressof @str359 : !llvm.ptr
      %4309 = arith.constant 14 : i64
      %4310 = func.call @cc_make_string(%4308, %4309) : (!llvm.ptr, i64) -> i64
      %4311 = func.call @cc_nil_value() : () -> i64
      %4312 = func.call @cc_intern(%4310, %4311) : (i64, i64) -> i64
      %4313 = func.call @cc_nil_value() : () -> i64
      %4314 = func.call @cc_cons(%4312, %4313) : (i64, i64) -> i64
      %4315 = func.call @cc_values_pack(%4314) : (i64) -> i64
      func.call @stack_push_pointer(%4312) : (i64) -> ()
      %4316 = func.call @stack_pop_pointer() : () -> i64
      %4317 = llvm.mlir.addressof @str360 : !llvm.ptr
      %4318 = arith.constant 13 : i64
      %4319 = func.call @cc_make_string(%4317, %4318) : (!llvm.ptr, i64) -> i64
      %4320 = llvm.mlir.addressof @str361 : !llvm.ptr
      %4321 = arith.constant 11 : i64
      %4322 = func.call @cc_make_string(%4320, %4321) : (!llvm.ptr, i64) -> i64
      %4323 = func.call @cc_intern(%4319, %4322) : (i64, i64) -> i64
      %4324 = func.call @cc_nil_value() : () -> i64
      %4325 = func.call @cc_cons(%4323, %4324) : (i64, i64) -> i64
      %4326 = func.call @cc_values_pack(%4325) : (i64) -> i64
      func.call @stack_push_pointer(%4323) : (i64) -> ()
      %4327 = llvm.mlir.addressof @str362 : !llvm.ptr
      %4328 = arith.constant 1 : i64
      %4329 = func.call @cc_make_string(%4327, %4328) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4329) : (i64) -> ()
      %4330 = llvm.mlir.addressof @str363 : !llvm.ptr
      %4331 = arith.constant 12 : i64
      %4332 = func.call @cc_make_string(%4330, %4331) : (!llvm.ptr, i64) -> i64
      %4333 = llvm.mlir.addressof @str364 : !llvm.ptr
      %4334 = arith.constant 7 : i64
      %4335 = func.call @cc_make_string(%4333, %4334) : (!llvm.ptr, i64) -> i64
      %4336 = func.call @cc_intern(%4332, %4335) : (i64, i64) -> i64
      %4337 = func.call @cc_nil_value() : () -> i64
      %4338 = func.call @cc_cons(%4336, %4337) : (i64, i64) -> i64
      %4339 = func.call @cc_values_pack(%4338) : (i64) -> i64
      func.call @stack_push_pointer(%4336) : (i64) -> ()
      %4340 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4340) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4341 = func.call @stack_pop_pointer() : () -> i64
      %4342 = func.call @stack_pop_pointer() : () -> i64
      %4343 = func.call @cc_cons(%4342, %4341) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4343) : (i64) -> ()
      %4344 = func.call @stack_pop_pointer() : () -> i64
      %4345 = func.call @stack_pop_pointer() : () -> i64
      %4346 = func.call @cc_cons(%4345, %4344) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4346) : (i64) -> ()
      %4347 = func.call @stack_pop_pointer() : () -> i64
      %4348 = func.call @stack_pop_pointer() : () -> i64
      %4349 = func.call @cc_cons(%4348, %4347) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4349) : (i64) -> ()
      %4350 = func.call @stack_pop_pointer() : () -> i64
      %4351 = func.call @stack_pop_pointer() : () -> i64
      %4352 = func.call @cc_cons(%4351, %4350) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4352) : (i64) -> ()
      %4353 = func.call @stack_pop_pointer() : () -> i64
      %4397 = arith.constant 122791386939411 : i64
      %4398 = arith.constant 0 : i64
      %4399 = func.call @cc_make_closure(%4397, %4398) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4399) : (i64) -> ()
      %4400 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4401 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4401) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4402 = func.call @stack_pop_pointer() : () -> i64
      %4403 = func.call @stack_pop_pointer() : () -> i64
      %4404 = func.call @cc_cons(%4403, %4402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4404) : (i64) -> ()
      %4405 = func.call @stack_pop_pointer() : () -> i64
      %4406 = func.call @stack_pop_pointer() : () -> i64
      %4407 = func.call @cc_cons(%4406, %4405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4407) : (i64) -> ()
      %4408 = func.call @stack_pop_pointer() : () -> i64
      %4409 = llvm.mlir.addressof @str369 : !llvm.ptr
      %4410 = arith.constant 11 : i64
      %4411 = func.call @cc_make_string(%4409, %4410) : (!llvm.ptr, i64) -> i64
      %4412 = llvm.mlir.addressof @str370 : !llvm.ptr
      %4413 = arith.constant 7 : i64
      %4414 = func.call @cc_make_string(%4412, %4413) : (!llvm.ptr, i64) -> i64
      %4415 = func.call @cc_intern(%4411, %4414) : (i64, i64) -> i64
      %4416 = func.call @cc_nil_value() : () -> i64
      %4417 = func.call @cc_cons(%4415, %4416) : (i64, i64) -> i64
      %4418 = func.call @cc_values_pack(%4417) : (i64) -> i64
      func.call @stack_push_pointer(%4415) : (i64) -> ()
      %4419 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4420 = func.call @stack_pop_pointer() : () -> i64
      %4421 = llvm.mlir.addressof @str371 : !llvm.ptr
      %4422 = arith.constant 4 : i64
      %4423 = func.call @cc_make_string(%4421, %4422) : (!llvm.ptr, i64) -> i64
      %4424 = llvm.mlir.addressof @str372 : !llvm.ptr
      %4425 = arith.constant 7 : i64
      %4426 = func.call @cc_make_string(%4424, %4425) : (!llvm.ptr, i64) -> i64
      %4427 = func.call @cc_intern(%4423, %4426) : (i64, i64) -> i64
      %4428 = func.call @cc_nil_value() : () -> i64
      %4429 = func.call @cc_cons(%4427, %4428) : (i64, i64) -> i64
      %4430 = func.call @cc_values_pack(%4429) : (i64) -> i64
      func.call @stack_push_pointer(%4427) : (i64) -> ()
      %4431 = func.call @stack_pop_pointer() : () -> i64
      %4432 = llvm.mlir.addressof @str373 : !llvm.ptr
      %4433 = arith.constant 6 : i64
      %4434 = func.call @cc_make_string(%4432, %4433) : (!llvm.ptr, i64) -> i64
      %4435 = func.call @cc_nil_value() : () -> i64
      %4436 = func.call @cc_intern(%4434, %4435) : (i64, i64) -> i64
      %4437 = func.call @cc_nil_value() : () -> i64
      %4438 = func.call @cc_cons(%4436, %4437) : (i64, i64) -> i64
      %4439 = func.call @cc_values_pack(%4438) : (i64) -> i64
      func.call @stack_push_pointer(%4436) : (i64) -> ()
      %4440 = func.call @stack_pop_pointer() : () -> i64
      %4441 = func.call @cc_nil_value() : () -> i64
      %4442 = func.call @cc_errorp(%4316) : (i64) -> i64
      %4443 = arith.cmpi ne, %4442, %4441 : i64
      %4444 = arith.cmpi eq, %4441, %4441 : i64
      %4445 = arith.andi %4443, %4444 : i1
      %4446 = scf.if %4445 -> (i64) {
        scf.yield %4316 : i64
      } else {
        scf.yield %4441 : i64
      }
      %4447 = func.call @cc_errorp(%4353) : (i64) -> i64
      %4448 = arith.cmpi ne, %4447, %4441 : i64
      %4449 = arith.cmpi eq, %4446, %4441 : i64
      %4450 = arith.andi %4448, %4449 : i1
      %4451 = scf.if %4450 -> (i64) {
        scf.yield %4353 : i64
      } else {
        scf.yield %4446 : i64
      }
      %4452 = func.call @cc_errorp(%4400) : (i64) -> i64
      %4453 = arith.cmpi ne, %4452, %4441 : i64
      %4454 = arith.cmpi eq, %4451, %4441 : i64
      %4455 = arith.andi %4453, %4454 : i1
      %4456 = scf.if %4455 -> (i64) {
        scf.yield %4400 : i64
      } else {
        scf.yield %4451 : i64
      }
      %4457 = func.call @cc_errorp(%4408) : (i64) -> i64
      %4458 = arith.cmpi ne, %4457, %4441 : i64
      %4459 = arith.cmpi eq, %4456, %4441 : i64
      %4460 = arith.andi %4458, %4459 : i1
      %4461 = scf.if %4460 -> (i64) {
        scf.yield %4408 : i64
      } else {
        scf.yield %4456 : i64
      }
      %4462 = func.call @cc_errorp(%4419) : (i64) -> i64
      %4463 = arith.cmpi ne, %4462, %4441 : i64
      %4464 = arith.cmpi eq, %4461, %4441 : i64
      %4465 = arith.andi %4463, %4464 : i1
      %4466 = scf.if %4465 -> (i64) {
        scf.yield %4419 : i64
      } else {
        scf.yield %4461 : i64
      }
      %4467 = func.call @cc_errorp(%4420) : (i64) -> i64
      %4468 = arith.cmpi ne, %4467, %4441 : i64
      %4469 = arith.cmpi eq, %4466, %4441 : i64
      %4470 = arith.andi %4468, %4469 : i1
      %4471 = scf.if %4470 -> (i64) {
        scf.yield %4420 : i64
      } else {
        scf.yield %4466 : i64
      }
      %4472 = func.call @cc_errorp(%4431) : (i64) -> i64
      %4473 = arith.cmpi ne, %4472, %4441 : i64
      %4474 = arith.cmpi eq, %4471, %4441 : i64
      %4475 = arith.andi %4473, %4474 : i1
      %4476 = scf.if %4475 -> (i64) {
        scf.yield %4431 : i64
      } else {
        scf.yield %4471 : i64
      }
      %4477 = func.call @cc_errorp(%4440) : (i64) -> i64
      %4478 = arith.cmpi ne, %4477, %4441 : i64
      %4479 = arith.cmpi eq, %4476, %4441 : i64
      %4480 = arith.andi %4478, %4479 : i1
      %4481 = scf.if %4480 -> (i64) {
        scf.yield %4440 : i64
      } else {
        scf.yield %4476 : i64
      }
      %4482 = arith.cmpi ne, %4481, %4441 : i64
      scf.if %4482 {
        func.call @stack_push_pointer(%4481) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4316) : (i64) -> ()
        func.call @stack_push_pointer(%4353) : (i64) -> ()
        func.call @stack_push_pointer(%4400) : (i64) -> ()
        func.call @stack_push_pointer(%4408) : (i64) -> ()
        func.call @stack_push_pointer(%4419) : (i64) -> ()
        func.call @stack_push_pointer(%4420) : (i64) -> ()
        func.call @stack_push_pointer(%4431) : (i64) -> ()
        func.call @stack_push_pointer(%4440) : (i64) -> ()
        %4483 = llvm.mlir.addressof @str374 : !llvm.ptr
        %4484 = func.call @cc_make_function_ref_const(%4483) : (!llvm.ptr) -> i64
        %4485 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4484, %4485) : (i64, i64) -> ()
      }
      %4486 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4486 : i64
    }
    %4487 = func.call @cc_nil_value() : () -> i64
    %4488 = func.call @cc_errorp(%4307) : (i64) -> i64
    %4489 = arith.cmpi ne, %4488, %4487 : i64
    %4490 = scf.if %4489 -> (i64) {
      scf.yield %4307 : i64
    } else {
      %4491 = llvm.mlir.addressof @str375 : !llvm.ptr
      %4492 = arith.constant 15 : i64
      %4493 = func.call @cc_make_string(%4491, %4492) : (!llvm.ptr, i64) -> i64
      %4494 = func.call @cc_nil_value() : () -> i64
      %4495 = func.call @cc_intern(%4493, %4494) : (i64, i64) -> i64
      %4496 = func.call @cc_nil_value() : () -> i64
      %4497 = func.call @cc_cons(%4495, %4496) : (i64, i64) -> i64
      %4498 = func.call @cc_values_pack(%4497) : (i64) -> i64
      func.call @stack_push_pointer(%4495) : (i64) -> ()
      %4499 = func.call @stack_pop_pointer() : () -> i64
      %4500 = llvm.mlir.addressof @str376 : !llvm.ptr
      %4501 = arith.constant 13 : i64
      %4502 = func.call @cc_make_string(%4500, %4501) : (!llvm.ptr, i64) -> i64
      %4503 = llvm.mlir.addressof @str377 : !llvm.ptr
      %4504 = arith.constant 11 : i64
      %4505 = func.call @cc_make_string(%4503, %4504) : (!llvm.ptr, i64) -> i64
      %4506 = func.call @cc_intern(%4502, %4505) : (i64, i64) -> i64
      %4507 = func.call @cc_nil_value() : () -> i64
      %4508 = func.call @cc_cons(%4506, %4507) : (i64, i64) -> i64
      %4509 = func.call @cc_values_pack(%4508) : (i64) -> i64
      func.call @stack_push_pointer(%4506) : (i64) -> ()
      %4510 = llvm.mlir.addressof @str378 : !llvm.ptr
      %4511 = arith.constant 1 : i64
      %4512 = func.call @cc_make_string(%4510, %4511) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4512) : (i64) -> ()
      %4513 = llvm.mlir.addressof @str379 : !llvm.ptr
      %4514 = arith.constant 12 : i64
      %4515 = func.call @cc_make_string(%4513, %4514) : (!llvm.ptr, i64) -> i64
      %4516 = llvm.mlir.addressof @str380 : !llvm.ptr
      %4517 = arith.constant 7 : i64
      %4518 = func.call @cc_make_string(%4516, %4517) : (!llvm.ptr, i64) -> i64
      %4519 = func.call @cc_intern(%4515, %4518) : (i64, i64) -> i64
      %4520 = func.call @cc_nil_value() : () -> i64
      %4521 = func.call @cc_cons(%4519, %4520) : (i64, i64) -> i64
      %4522 = func.call @cc_values_pack(%4521) : (i64) -> i64
      func.call @stack_push_pointer(%4519) : (i64) -> ()
      %4523 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4523) : (i64) -> ()
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
      %4533 = func.call @stack_pop_pointer() : () -> i64
      %4534 = func.call @stack_pop_pointer() : () -> i64
      %4535 = func.call @cc_cons(%4534, %4533) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4535) : (i64) -> ()
      %4536 = func.call @stack_pop_pointer() : () -> i64
      %4580 = arith.constant 122791386939412 : i64
      %4581 = arith.constant 0 : i64
      %4582 = func.call @cc_make_closure(%4580, %4581) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4582) : (i64) -> ()
      %4583 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4584 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%4584) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4585 = func.call @stack_pop_pointer() : () -> i64
      %4586 = func.call @stack_pop_pointer() : () -> i64
      %4587 = func.call @cc_cons(%4586, %4585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4587) : (i64) -> ()
      %4588 = func.call @stack_pop_pointer() : () -> i64
      %4589 = func.call @stack_pop_pointer() : () -> i64
      %4590 = func.call @cc_cons(%4589, %4588) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4590) : (i64) -> ()
      %4591 = func.call @stack_pop_pointer() : () -> i64
      %4592 = llvm.mlir.addressof @str385 : !llvm.ptr
      %4593 = arith.constant 11 : i64
      %4594 = func.call @cc_make_string(%4592, %4593) : (!llvm.ptr, i64) -> i64
      %4595 = llvm.mlir.addressof @str386 : !llvm.ptr
      %4596 = arith.constant 7 : i64
      %4597 = func.call @cc_make_string(%4595, %4596) : (!llvm.ptr, i64) -> i64
      %4598 = func.call @cc_intern(%4594, %4597) : (i64, i64) -> i64
      %4599 = func.call @cc_nil_value() : () -> i64
      %4600 = func.call @cc_cons(%4598, %4599) : (i64, i64) -> i64
      %4601 = func.call @cc_values_pack(%4600) : (i64) -> i64
      func.call @stack_push_pointer(%4598) : (i64) -> ()
      %4602 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4603 = func.call @stack_pop_pointer() : () -> i64
      %4604 = llvm.mlir.addressof @str387 : !llvm.ptr
      %4605 = arith.constant 4 : i64
      %4606 = func.call @cc_make_string(%4604, %4605) : (!llvm.ptr, i64) -> i64
      %4607 = llvm.mlir.addressof @str388 : !llvm.ptr
      %4608 = arith.constant 7 : i64
      %4609 = func.call @cc_make_string(%4607, %4608) : (!llvm.ptr, i64) -> i64
      %4610 = func.call @cc_intern(%4606, %4609) : (i64, i64) -> i64
      %4611 = func.call @cc_nil_value() : () -> i64
      %4612 = func.call @cc_cons(%4610, %4611) : (i64, i64) -> i64
      %4613 = func.call @cc_values_pack(%4612) : (i64) -> i64
      func.call @stack_push_pointer(%4610) : (i64) -> ()
      %4614 = func.call @stack_pop_pointer() : () -> i64
      %4615 = llvm.mlir.addressof @str389 : !llvm.ptr
      %4616 = arith.constant 6 : i64
      %4617 = func.call @cc_make_string(%4615, %4616) : (!llvm.ptr, i64) -> i64
      %4618 = func.call @cc_nil_value() : () -> i64
      %4619 = func.call @cc_intern(%4617, %4618) : (i64, i64) -> i64
      %4620 = func.call @cc_nil_value() : () -> i64
      %4621 = func.call @cc_cons(%4619, %4620) : (i64, i64) -> i64
      %4622 = func.call @cc_values_pack(%4621) : (i64) -> i64
      func.call @stack_push_pointer(%4619) : (i64) -> ()
      %4623 = func.call @stack_pop_pointer() : () -> i64
      %4624 = func.call @cc_nil_value() : () -> i64
      %4625 = func.call @cc_errorp(%4499) : (i64) -> i64
      %4626 = arith.cmpi ne, %4625, %4624 : i64
      %4627 = arith.cmpi eq, %4624, %4624 : i64
      %4628 = arith.andi %4626, %4627 : i1
      %4629 = scf.if %4628 -> (i64) {
        scf.yield %4499 : i64
      } else {
        scf.yield %4624 : i64
      }
      %4630 = func.call @cc_errorp(%4536) : (i64) -> i64
      %4631 = arith.cmpi ne, %4630, %4624 : i64
      %4632 = arith.cmpi eq, %4629, %4624 : i64
      %4633 = arith.andi %4631, %4632 : i1
      %4634 = scf.if %4633 -> (i64) {
        scf.yield %4536 : i64
      } else {
        scf.yield %4629 : i64
      }
      %4635 = func.call @cc_errorp(%4583) : (i64) -> i64
      %4636 = arith.cmpi ne, %4635, %4624 : i64
      %4637 = arith.cmpi eq, %4634, %4624 : i64
      %4638 = arith.andi %4636, %4637 : i1
      %4639 = scf.if %4638 -> (i64) {
        scf.yield %4583 : i64
      } else {
        scf.yield %4634 : i64
      }
      %4640 = func.call @cc_errorp(%4591) : (i64) -> i64
      %4641 = arith.cmpi ne, %4640, %4624 : i64
      %4642 = arith.cmpi eq, %4639, %4624 : i64
      %4643 = arith.andi %4641, %4642 : i1
      %4644 = scf.if %4643 -> (i64) {
        scf.yield %4591 : i64
      } else {
        scf.yield %4639 : i64
      }
      %4645 = func.call @cc_errorp(%4602) : (i64) -> i64
      %4646 = arith.cmpi ne, %4645, %4624 : i64
      %4647 = arith.cmpi eq, %4644, %4624 : i64
      %4648 = arith.andi %4646, %4647 : i1
      %4649 = scf.if %4648 -> (i64) {
        scf.yield %4602 : i64
      } else {
        scf.yield %4644 : i64
      }
      %4650 = func.call @cc_errorp(%4603) : (i64) -> i64
      %4651 = arith.cmpi ne, %4650, %4624 : i64
      %4652 = arith.cmpi eq, %4649, %4624 : i64
      %4653 = arith.andi %4651, %4652 : i1
      %4654 = scf.if %4653 -> (i64) {
        scf.yield %4603 : i64
      } else {
        scf.yield %4649 : i64
      }
      %4655 = func.call @cc_errorp(%4614) : (i64) -> i64
      %4656 = arith.cmpi ne, %4655, %4624 : i64
      %4657 = arith.cmpi eq, %4654, %4624 : i64
      %4658 = arith.andi %4656, %4657 : i1
      %4659 = scf.if %4658 -> (i64) {
        scf.yield %4614 : i64
      } else {
        scf.yield %4654 : i64
      }
      %4660 = func.call @cc_errorp(%4623) : (i64) -> i64
      %4661 = arith.cmpi ne, %4660, %4624 : i64
      %4662 = arith.cmpi eq, %4659, %4624 : i64
      %4663 = arith.andi %4661, %4662 : i1
      %4664 = scf.if %4663 -> (i64) {
        scf.yield %4623 : i64
      } else {
        scf.yield %4659 : i64
      }
      %4665 = arith.cmpi ne, %4664, %4624 : i64
      scf.if %4665 {
        func.call @stack_push_pointer(%4664) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4499) : (i64) -> ()
        func.call @stack_push_pointer(%4536) : (i64) -> ()
        func.call @stack_push_pointer(%4583) : (i64) -> ()
        func.call @stack_push_pointer(%4591) : (i64) -> ()
        func.call @stack_push_pointer(%4602) : (i64) -> ()
        func.call @stack_push_pointer(%4603) : (i64) -> ()
        func.call @stack_push_pointer(%4614) : (i64) -> ()
        func.call @stack_push_pointer(%4623) : (i64) -> ()
        %4666 = llvm.mlir.addressof @str390 : !llvm.ptr
        %4667 = func.call @cc_make_function_ref_const(%4666) : (!llvm.ptr) -> i64
        %4668 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4667, %4668) : (i64, i64) -> ()
      }
      %4669 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4669 : i64
    }
    %4670 = func.call @cc_nil_value() : () -> i64
    %4671 = func.call @cc_errorp(%4490) : (i64) -> i64
    %4672 = arith.cmpi ne, %4671, %4670 : i64
    %4673 = scf.if %4672 -> (i64) {
      scf.yield %4490 : i64
    } else {
      %4674 = llvm.mlir.addressof @str391 : !llvm.ptr
      %4675 = arith.constant 15 : i64
      %4676 = func.call @cc_make_string(%4674, %4675) : (!llvm.ptr, i64) -> i64
      %4677 = func.call @cc_nil_value() : () -> i64
      %4678 = func.call @cc_intern(%4676, %4677) : (i64, i64) -> i64
      %4679 = func.call @cc_nil_value() : () -> i64
      %4680 = func.call @cc_cons(%4678, %4679) : (i64, i64) -> i64
      %4681 = func.call @cc_values_pack(%4680) : (i64) -> i64
      func.call @stack_push_pointer(%4678) : (i64) -> ()
      %4682 = func.call @stack_pop_pointer() : () -> i64
      %4683 = llvm.mlir.addressof @str392 : !llvm.ptr
      %4684 = arith.constant 13 : i64
      %4685 = func.call @cc_make_string(%4683, %4684) : (!llvm.ptr, i64) -> i64
      %4686 = llvm.mlir.addressof @str393 : !llvm.ptr
      %4687 = arith.constant 11 : i64
      %4688 = func.call @cc_make_string(%4686, %4687) : (!llvm.ptr, i64) -> i64
      %4689 = func.call @cc_intern(%4685, %4688) : (i64, i64) -> i64
      %4690 = func.call @cc_nil_value() : () -> i64
      %4691 = func.call @cc_cons(%4689, %4690) : (i64, i64) -> i64
      %4692 = func.call @cc_values_pack(%4691) : (i64) -> i64
      func.call @stack_push_pointer(%4689) : (i64) -> ()
      %4693 = llvm.mlir.addressof @str394 : !llvm.ptr
      %4694 = arith.constant 0 : i64
      %4695 = func.call @cc_make_string(%4693, %4694) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4695) : (i64) -> ()
      %4696 = llvm.mlir.addressof @str395 : !llvm.ptr
      %4697 = arith.constant 12 : i64
      %4698 = func.call @cc_make_string(%4696, %4697) : (!llvm.ptr, i64) -> i64
      %4699 = llvm.mlir.addressof @str396 : !llvm.ptr
      %4700 = arith.constant 7 : i64
      %4701 = func.call @cc_make_string(%4699, %4700) : (!llvm.ptr, i64) -> i64
      %4702 = func.call @cc_intern(%4698, %4701) : (i64, i64) -> i64
      %4703 = func.call @cc_nil_value() : () -> i64
      %4704 = func.call @cc_cons(%4702, %4703) : (i64, i64) -> i64
      %4705 = func.call @cc_values_pack(%4704) : (i64) -> i64
      func.call @stack_push_pointer(%4702) : (i64) -> ()
      %4706 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4706) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4707 = func.call @stack_pop_pointer() : () -> i64
      %4708 = func.call @stack_pop_pointer() : () -> i64
      %4709 = func.call @cc_cons(%4708, %4707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4709) : (i64) -> ()
      %4710 = func.call @stack_pop_pointer() : () -> i64
      %4711 = func.call @stack_pop_pointer() : () -> i64
      %4712 = func.call @cc_cons(%4711, %4710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4712) : (i64) -> ()
      %4713 = func.call @stack_pop_pointer() : () -> i64
      %4714 = func.call @stack_pop_pointer() : () -> i64
      %4715 = func.call @cc_cons(%4714, %4713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4715) : (i64) -> ()
      %4716 = func.call @stack_pop_pointer() : () -> i64
      %4717 = func.call @stack_pop_pointer() : () -> i64
      %4718 = func.call @cc_cons(%4717, %4716) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4718) : (i64) -> ()
      %4719 = func.call @stack_pop_pointer() : () -> i64
      %4763 = arith.constant 122791386939413 : i64
      %4764 = arith.constant 0 : i64
      %4765 = func.call @cc_make_closure(%4763, %4764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4765) : (i64) -> ()
      %4766 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4767 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%4767) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4768 = func.call @stack_pop_pointer() : () -> i64
      %4769 = func.call @stack_pop_pointer() : () -> i64
      %4770 = func.call @cc_cons(%4769, %4768) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4770) : (i64) -> ()
      %4771 = func.call @stack_pop_pointer() : () -> i64
      %4772 = func.call @stack_pop_pointer() : () -> i64
      %4773 = func.call @cc_cons(%4772, %4771) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4773) : (i64) -> ()
      %4774 = func.call @stack_pop_pointer() : () -> i64
      %4775 = llvm.mlir.addressof @str401 : !llvm.ptr
      %4776 = arith.constant 11 : i64
      %4777 = func.call @cc_make_string(%4775, %4776) : (!llvm.ptr, i64) -> i64
      %4778 = llvm.mlir.addressof @str402 : !llvm.ptr
      %4779 = arith.constant 7 : i64
      %4780 = func.call @cc_make_string(%4778, %4779) : (!llvm.ptr, i64) -> i64
      %4781 = func.call @cc_intern(%4777, %4780) : (i64, i64) -> i64
      %4782 = func.call @cc_nil_value() : () -> i64
      %4783 = func.call @cc_cons(%4781, %4782) : (i64, i64) -> i64
      %4784 = func.call @cc_values_pack(%4783) : (i64) -> i64
      func.call @stack_push_pointer(%4781) : (i64) -> ()
      %4785 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %4786 = func.call @stack_pop_pointer() : () -> i64
      %4787 = llvm.mlir.addressof @str403 : !llvm.ptr
      %4788 = arith.constant 4 : i64
      %4789 = func.call @cc_make_string(%4787, %4788) : (!llvm.ptr, i64) -> i64
      %4790 = llvm.mlir.addressof @str404 : !llvm.ptr
      %4791 = arith.constant 7 : i64
      %4792 = func.call @cc_make_string(%4790, %4791) : (!llvm.ptr, i64) -> i64
      %4793 = func.call @cc_intern(%4789, %4792) : (i64, i64) -> i64
      %4794 = func.call @cc_nil_value() : () -> i64
      %4795 = func.call @cc_cons(%4793, %4794) : (i64, i64) -> i64
      %4796 = func.call @cc_values_pack(%4795) : (i64) -> i64
      func.call @stack_push_pointer(%4793) : (i64) -> ()
      %4797 = func.call @stack_pop_pointer() : () -> i64
      %4798 = llvm.mlir.addressof @str405 : !llvm.ptr
      %4799 = arith.constant 6 : i64
      %4800 = func.call @cc_make_string(%4798, %4799) : (!llvm.ptr, i64) -> i64
      %4801 = func.call @cc_nil_value() : () -> i64
      %4802 = func.call @cc_intern(%4800, %4801) : (i64, i64) -> i64
      %4803 = func.call @cc_nil_value() : () -> i64
      %4804 = func.call @cc_cons(%4802, %4803) : (i64, i64) -> i64
      %4805 = func.call @cc_values_pack(%4804) : (i64) -> i64
      func.call @stack_push_pointer(%4802) : (i64) -> ()
      %4806 = func.call @stack_pop_pointer() : () -> i64
      %4807 = func.call @cc_nil_value() : () -> i64
      %4808 = func.call @cc_errorp(%4682) : (i64) -> i64
      %4809 = arith.cmpi ne, %4808, %4807 : i64
      %4810 = arith.cmpi eq, %4807, %4807 : i64
      %4811 = arith.andi %4809, %4810 : i1
      %4812 = scf.if %4811 -> (i64) {
        scf.yield %4682 : i64
      } else {
        scf.yield %4807 : i64
      }
      %4813 = func.call @cc_errorp(%4719) : (i64) -> i64
      %4814 = arith.cmpi ne, %4813, %4807 : i64
      %4815 = arith.cmpi eq, %4812, %4807 : i64
      %4816 = arith.andi %4814, %4815 : i1
      %4817 = scf.if %4816 -> (i64) {
        scf.yield %4719 : i64
      } else {
        scf.yield %4812 : i64
      }
      %4818 = func.call @cc_errorp(%4766) : (i64) -> i64
      %4819 = arith.cmpi ne, %4818, %4807 : i64
      %4820 = arith.cmpi eq, %4817, %4807 : i64
      %4821 = arith.andi %4819, %4820 : i1
      %4822 = scf.if %4821 -> (i64) {
        scf.yield %4766 : i64
      } else {
        scf.yield %4817 : i64
      }
      %4823 = func.call @cc_errorp(%4774) : (i64) -> i64
      %4824 = arith.cmpi ne, %4823, %4807 : i64
      %4825 = arith.cmpi eq, %4822, %4807 : i64
      %4826 = arith.andi %4824, %4825 : i1
      %4827 = scf.if %4826 -> (i64) {
        scf.yield %4774 : i64
      } else {
        scf.yield %4822 : i64
      }
      %4828 = func.call @cc_errorp(%4785) : (i64) -> i64
      %4829 = arith.cmpi ne, %4828, %4807 : i64
      %4830 = arith.cmpi eq, %4827, %4807 : i64
      %4831 = arith.andi %4829, %4830 : i1
      %4832 = scf.if %4831 -> (i64) {
        scf.yield %4785 : i64
      } else {
        scf.yield %4827 : i64
      }
      %4833 = func.call @cc_errorp(%4786) : (i64) -> i64
      %4834 = arith.cmpi ne, %4833, %4807 : i64
      %4835 = arith.cmpi eq, %4832, %4807 : i64
      %4836 = arith.andi %4834, %4835 : i1
      %4837 = scf.if %4836 -> (i64) {
        scf.yield %4786 : i64
      } else {
        scf.yield %4832 : i64
      }
      %4838 = func.call @cc_errorp(%4797) : (i64) -> i64
      %4839 = arith.cmpi ne, %4838, %4807 : i64
      %4840 = arith.cmpi eq, %4837, %4807 : i64
      %4841 = arith.andi %4839, %4840 : i1
      %4842 = scf.if %4841 -> (i64) {
        scf.yield %4797 : i64
      } else {
        scf.yield %4837 : i64
      }
      %4843 = func.call @cc_errorp(%4806) : (i64) -> i64
      %4844 = arith.cmpi ne, %4843, %4807 : i64
      %4845 = arith.cmpi eq, %4842, %4807 : i64
      %4846 = arith.andi %4844, %4845 : i1
      %4847 = scf.if %4846 -> (i64) {
        scf.yield %4806 : i64
      } else {
        scf.yield %4842 : i64
      }
      %4848 = arith.cmpi ne, %4847, %4807 : i64
      scf.if %4848 {
        func.call @stack_push_pointer(%4847) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4682) : (i64) -> ()
        func.call @stack_push_pointer(%4719) : (i64) -> ()
        func.call @stack_push_pointer(%4766) : (i64) -> ()
        func.call @stack_push_pointer(%4774) : (i64) -> ()
        func.call @stack_push_pointer(%4785) : (i64) -> ()
        func.call @stack_push_pointer(%4786) : (i64) -> ()
        func.call @stack_push_pointer(%4797) : (i64) -> ()
        func.call @stack_push_pointer(%4806) : (i64) -> ()
        %4849 = llvm.mlir.addressof @str406 : !llvm.ptr
        %4850 = func.call @cc_make_function_ref_const(%4849) : (!llvm.ptr) -> i64
        %4851 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%4850, %4851) : (i64, i64) -> ()
      }
      %4852 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4852 : i64
    }
    %4853 = func.call @cc_nil_value() : () -> i64
    %4854 = func.call @cc_errorp(%4673) : (i64) -> i64
    %4855 = arith.cmpi ne, %4854, %4853 : i64
    %4856 = scf.if %4855 -> (i64) {
      scf.yield %4673 : i64
    } else {
      %4857 = llvm.mlir.addressof @str407 : !llvm.ptr
      %4858 = arith.constant 14 : i64
      %4859 = func.call @cc_make_string(%4857, %4858) : (!llvm.ptr, i64) -> i64
      %4860 = func.call @cc_nil_value() : () -> i64
      %4861 = func.call @cc_intern(%4859, %4860) : (i64, i64) -> i64
      %4862 = func.call @cc_nil_value() : () -> i64
      %4863 = func.call @cc_cons(%4861, %4862) : (i64, i64) -> i64
      %4864 = func.call @cc_values_pack(%4863) : (i64) -> i64
      func.call @stack_push_pointer(%4861) : (i64) -> ()
      %4865 = func.call @stack_pop_pointer() : () -> i64
      %4866 = llvm.mlir.addressof @str408 : !llvm.ptr
      %4867 = arith.constant 3 : i64
      %4868 = func.call @cc_make_string(%4866, %4867) : (!llvm.ptr, i64) -> i64
      %4869 = func.call @cc_nil_value() : () -> i64
      %4870 = func.call @cc_intern(%4868, %4869) : (i64, i64) -> i64
      %4871 = func.call @cc_nil_value() : () -> i64
      %4872 = func.call @cc_cons(%4870, %4871) : (i64, i64) -> i64
      %4873 = func.call @cc_values_pack(%4872) : (i64) -> i64
      func.call @stack_push_pointer(%4870) : (i64) -> ()
      %4874 = llvm.mlir.addressof @str409 : !llvm.ptr
      %4875 = arith.constant 3 : i64
      %4876 = func.call @cc_make_string(%4874, %4875) : (!llvm.ptr, i64) -> i64
      %4877 = func.call @cc_nil_value() : () -> i64
      %4878 = func.call @cc_intern(%4876, %4877) : (i64, i64) -> i64
      %4879 = func.call @cc_nil_value() : () -> i64
      %4880 = func.call @cc_cons(%4878, %4879) : (i64, i64) -> i64
      %4881 = func.call @cc_values_pack(%4880) : (i64) -> i64
      func.call @stack_push_pointer(%4878) : (i64) -> ()
      %4882 = llvm.mlir.addressof @str410 : !llvm.ptr
      %4883 = arith.constant 2 : i64
      %4884 = func.call @cc_make_string(%4882, %4883) : (!llvm.ptr, i64) -> i64
      %4885 = llvm.mlir.addressof @str411 : !llvm.ptr
      %4886 = arith.constant 11 : i64
      %4887 = func.call @cc_make_string(%4885, %4886) : (!llvm.ptr, i64) -> i64
      %4888 = func.call @cc_intern(%4884, %4887) : (i64, i64) -> i64
      %4889 = func.call @cc_nil_value() : () -> i64
      %4890 = func.call @cc_cons(%4888, %4889) : (i64, i64) -> i64
      %4891 = func.call @cc_values_pack(%4890) : (i64) -> i64
      func.call @stack_push_pointer(%4888) : (i64) -> ()
      %4892 = llvm.mlir.addressof @str412 : !llvm.ptr
      %4893 = arith.constant 8 : i64
      %4894 = func.call @cc_make_string(%4892, %4893) : (!llvm.ptr, i64) -> i64
      %4895 = llvm.mlir.addressof @str413 : !llvm.ptr
      %4896 = arith.constant 11 : i64
      %4897 = func.call @cc_make_string(%4895, %4896) : (!llvm.ptr, i64) -> i64
      %4898 = func.call @cc_intern(%4894, %4897) : (i64, i64) -> i64
      %4899 = func.call @cc_nil_value() : () -> i64
      %4900 = func.call @cc_cons(%4898, %4899) : (i64, i64) -> i64
      %4901 = func.call @cc_values_pack(%4900) : (i64) -> i64
      func.call @stack_push_pointer(%4898) : (i64) -> ()
      %4902 = llvm.mlir.addressof @str414 : !llvm.ptr
      %4903 = arith.constant 7 : i64
      %4904 = func.call @cc_make_string(%4902, %4903) : (!llvm.ptr, i64) -> i64
      %4905 = llvm.mlir.addressof @str415 : !llvm.ptr
      %4906 = arith.constant 11 : i64
      %4907 = func.call @cc_make_string(%4905, %4906) : (!llvm.ptr, i64) -> i64
      %4908 = func.call @cc_intern(%4904, %4907) : (i64, i64) -> i64
      %4909 = func.call @cc_nil_value() : () -> i64
      %4910 = func.call @cc_cons(%4908, %4909) : (i64, i64) -> i64
      %4911 = func.call @cc_values_pack(%4910) : (i64) -> i64
      func.call @stack_push_pointer(%4908) : (i64) -> ()
      %4912 = llvm.mlir.addressof @str416 : !llvm.ptr
      %4913 = arith.constant 3 : i64
      %4914 = func.call @cc_make_string(%4912, %4913) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4914) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4915 = func.call @stack_pop_pointer() : () -> i64
      %4916 = func.call @stack_pop_pointer() : () -> i64
      %4917 = func.call @cc_cons(%4916, %4915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4917) : (i64) -> ()
      %4918 = func.call @stack_pop_pointer() : () -> i64
      %4919 = func.call @stack_pop_pointer() : () -> i64
      %4920 = func.call @cc_cons(%4919, %4918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4920) : (i64) -> ()
      %4921 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%4921) : (i64) -> ()
      %4922 = llvm.mlir.addressof @str417 : !llvm.ptr
      %4923 = arith.constant 12 : i64
      %4924 = func.call @cc_make_string(%4922, %4923) : (!llvm.ptr, i64) -> i64
      %4925 = llvm.mlir.addressof @str418 : !llvm.ptr
      %4926 = arith.constant 11 : i64
      %4927 = func.call @cc_make_string(%4925, %4926) : (!llvm.ptr, i64) -> i64
      %4928 = func.call @cc_intern(%4924, %4927) : (i64, i64) -> i64
      %4929 = func.call @cc_nil_value() : () -> i64
      %4930 = func.call @cc_cons(%4928, %4929) : (i64, i64) -> i64
      %4931 = func.call @cc_values_pack(%4930) : (i64) -> i64
      func.call @stack_push_pointer(%4928) : (i64) -> ()
      %4932 = llvm.mlir.addressof @str419 : !llvm.ptr
      %4933 = arith.constant 9 : i64
      %4934 = func.call @cc_make_string(%4932, %4933) : (!llvm.ptr, i64) -> i64
      %4935 = llvm.mlir.addressof @str420 : !llvm.ptr
      %4936 = arith.constant 11 : i64
      %4937 = func.call @cc_make_string(%4935, %4936) : (!llvm.ptr, i64) -> i64
      %4938 = func.call @cc_intern(%4934, %4937) : (i64, i64) -> i64
      %4939 = func.call @cc_nil_value() : () -> i64
      %4940 = func.call @cc_cons(%4938, %4939) : (i64, i64) -> i64
      %4941 = func.call @cc_values_pack(%4940) : (i64) -> i64
      func.call @stack_push_pointer(%4938) : (i64) -> ()
      %4942 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%4942) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4943 = func.call @stack_pop_pointer() : () -> i64
      %4944 = func.call @stack_pop_pointer() : () -> i64
      %4945 = func.call @cc_cons(%4944, %4943) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4945) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4946 = func.call @stack_pop_pointer() : () -> i64
      %4947 = func.call @stack_pop_pointer() : () -> i64
      %4948 = func.call @cc_cons(%4947, %4946) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4948) : (i64) -> ()
      %4949 = func.call @stack_pop_pointer() : () -> i64
      %4950 = func.call @stack_pop_pointer() : () -> i64
      %4951 = func.call @cc_cons(%4950, %4949) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4951) : (i64) -> ()
      %4952 = func.call @stack_pop_pointer() : () -> i64
      %4953 = func.call @stack_pop_pointer() : () -> i64
      %4954 = func.call @cc_cons(%4953, %4952) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4954) : (i64) -> ()
      %4955 = func.call @stack_pop_pointer() : () -> i64
      %4956 = func.call @stack_pop_pointer() : () -> i64
      %4957 = func.call @cc_cons(%4955, %4956) : (i64, i64) -> i64
      %4958 = llvm.mlir.addressof @str421 : !llvm.ptr
      %4959 = arith.constant 5 : i64
      %4960 = func.call @cc_make_string(%4958, %4959) : (!llvm.ptr, i64) -> i64
      %4961 = func.call @cc_nil_value() : () -> i64
      %4962 = func.call @cc_intern(%4960, %4961) : (i64, i64) -> i64
      %4963 = func.call @cc_nil_value() : () -> i64
      %4964 = func.call @cc_cons(%4962, %4963) : (i64, i64) -> i64
      %4965 = func.call @cc_values_pack(%4964) : (i64) -> i64
      %4966 = func.call @cc_cons(%4962, %4957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4966) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4967 = func.call @stack_pop_pointer() : () -> i64
      %4968 = func.call @stack_pop_pointer() : () -> i64
      %4969 = func.call @cc_cons(%4968, %4967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4969) : (i64) -> ()
      %4970 = func.call @stack_pop_pointer() : () -> i64
      %4971 = func.call @stack_pop_pointer() : () -> i64
      %4972 = func.call @cc_cons(%4971, %4970) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4972) : (i64) -> ()
      %4973 = func.call @stack_pop_pointer() : () -> i64
      %4974 = func.call @stack_pop_pointer() : () -> i64
      %4975 = func.call @cc_cons(%4974, %4973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%4975) : (i64) -> ()
      %4976 = llvm.mlir.addressof @str422 : !llvm.ptr
      %4977 = arith.constant 8 : i64
      %4978 = func.call @cc_make_string(%4976, %4977) : (!llvm.ptr, i64) -> i64
      %4979 = llvm.mlir.addressof @str423 : !llvm.ptr
      %4980 = arith.constant 11 : i64
      %4981 = func.call @cc_make_string(%4979, %4980) : (!llvm.ptr, i64) -> i64
      %4982 = func.call @cc_intern(%4978, %4981) : (i64, i64) -> i64
      %4983 = func.call @cc_nil_value() : () -> i64
      %4984 = func.call @cc_cons(%4982, %4983) : (i64, i64) -> i64
      %4985 = func.call @cc_values_pack(%4984) : (i64) -> i64
      func.call @stack_push_pointer(%4982) : (i64) -> ()
      %4986 = llvm.mlir.addressof @str424 : !llvm.ptr
      %4987 = arith.constant 7 : i64
      %4988 = func.call @cc_make_string(%4986, %4987) : (!llvm.ptr, i64) -> i64
      %4989 = llvm.mlir.addressof @str425 : !llvm.ptr
      %4990 = arith.constant 11 : i64
      %4991 = func.call @cc_make_string(%4989, %4990) : (!llvm.ptr, i64) -> i64
      %4992 = func.call @cc_intern(%4988, %4991) : (i64, i64) -> i64
      %4993 = func.call @cc_nil_value() : () -> i64
      %4994 = func.call @cc_cons(%4992, %4993) : (i64, i64) -> i64
      %4995 = func.call @cc_values_pack(%4994) : (i64) -> i64
      func.call @stack_push_pointer(%4992) : (i64) -> ()
      %4996 = llvm.mlir.addressof @str426 : !llvm.ptr
      %4997 = arith.constant 3 : i64
      %4998 = func.call @cc_make_string(%4996, %4997) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4998) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %4999 = func.call @stack_pop_pointer() : () -> i64
      %5000 = func.call @stack_pop_pointer() : () -> i64
      %5001 = func.call @cc_cons(%5000, %4999) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5001) : (i64) -> ()
      %5002 = func.call @stack_pop_pointer() : () -> i64
      %5003 = func.call @stack_pop_pointer() : () -> i64
      %5004 = func.call @cc_cons(%5003, %5002) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5004) : (i64) -> ()
      %5005 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5005) : (i64) -> ()
      %5006 = llvm.mlir.addressof @str427 : !llvm.ptr
      %5007 = arith.constant 12 : i64
      %5008 = func.call @cc_make_string(%5006, %5007) : (!llvm.ptr, i64) -> i64
      %5009 = llvm.mlir.addressof @str428 : !llvm.ptr
      %5010 = arith.constant 11 : i64
      %5011 = func.call @cc_make_string(%5009, %5010) : (!llvm.ptr, i64) -> i64
      %5012 = func.call @cc_intern(%5008, %5011) : (i64, i64) -> i64
      %5013 = func.call @cc_nil_value() : () -> i64
      %5014 = func.call @cc_cons(%5012, %5013) : (i64, i64) -> i64
      %5015 = func.call @cc_values_pack(%5014) : (i64) -> i64
      func.call @stack_push_pointer(%5012) : (i64) -> ()
      %5016 = llvm.mlir.addressof @str429 : !llvm.ptr
      %5017 = arith.constant 9 : i64
      %5018 = func.call @cc_make_string(%5016, %5017) : (!llvm.ptr, i64) -> i64
      %5019 = llvm.mlir.addressof @str430 : !llvm.ptr
      %5020 = arith.constant 11 : i64
      %5021 = func.call @cc_make_string(%5019, %5020) : (!llvm.ptr, i64) -> i64
      %5022 = func.call @cc_intern(%5018, %5021) : (i64, i64) -> i64
      %5023 = func.call @cc_nil_value() : () -> i64
      %5024 = func.call @cc_cons(%5022, %5023) : (i64, i64) -> i64
      %5025 = func.call @cc_values_pack(%5024) : (i64) -> i64
      func.call @stack_push_pointer(%5022) : (i64) -> ()
      %5026 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5026) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5027 = func.call @stack_pop_pointer() : () -> i64
      %5028 = func.call @stack_pop_pointer() : () -> i64
      %5029 = func.call @cc_cons(%5028, %5027) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5029) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5030 = func.call @stack_pop_pointer() : () -> i64
      %5031 = func.call @stack_pop_pointer() : () -> i64
      %5032 = func.call @cc_cons(%5031, %5030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5032) : (i64) -> ()
      %5033 = func.call @stack_pop_pointer() : () -> i64
      %5034 = func.call @stack_pop_pointer() : () -> i64
      %5035 = func.call @cc_cons(%5034, %5033) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5035) : (i64) -> ()
      %5036 = func.call @stack_pop_pointer() : () -> i64
      %5037 = func.call @stack_pop_pointer() : () -> i64
      %5038 = func.call @cc_cons(%5037, %5036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5038) : (i64) -> ()
      %5039 = func.call @stack_pop_pointer() : () -> i64
      %5040 = func.call @stack_pop_pointer() : () -> i64
      %5041 = func.call @cc_cons(%5039, %5040) : (i64, i64) -> i64
      %5042 = llvm.mlir.addressof @str431 : !llvm.ptr
      %5043 = arith.constant 5 : i64
      %5044 = func.call @cc_make_string(%5042, %5043) : (!llvm.ptr, i64) -> i64
      %5045 = func.call @cc_nil_value() : () -> i64
      %5046 = func.call @cc_intern(%5044, %5045) : (i64, i64) -> i64
      %5047 = func.call @cc_nil_value() : () -> i64
      %5048 = func.call @cc_cons(%5046, %5047) : (i64, i64) -> i64
      %5049 = func.call @cc_values_pack(%5048) : (i64) -> i64
      %5050 = func.call @cc_cons(%5046, %5041) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5050) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5051 = func.call @stack_pop_pointer() : () -> i64
      %5052 = func.call @stack_pop_pointer() : () -> i64
      %5053 = func.call @cc_cons(%5052, %5051) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5053) : (i64) -> ()
      %5054 = func.call @stack_pop_pointer() : () -> i64
      %5055 = func.call @stack_pop_pointer() : () -> i64
      %5056 = func.call @cc_cons(%5055, %5054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5056) : (i64) -> ()
      %5057 = func.call @stack_pop_pointer() : () -> i64
      %5058 = func.call @stack_pop_pointer() : () -> i64
      %5059 = func.call @cc_cons(%5058, %5057) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5059) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5060 = func.call @stack_pop_pointer() : () -> i64
      %5061 = func.call @stack_pop_pointer() : () -> i64
      %5062 = func.call @cc_cons(%5061, %5060) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5062) : (i64) -> ()
      %5063 = func.call @stack_pop_pointer() : () -> i64
      %5064 = func.call @stack_pop_pointer() : () -> i64
      %5065 = func.call @cc_cons(%5064, %5063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5065) : (i64) -> ()
      %5066 = func.call @stack_pop_pointer() : () -> i64
      %5067 = func.call @stack_pop_pointer() : () -> i64
      %5068 = func.call @cc_cons(%5067, %5066) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5068) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5069 = func.call @stack_pop_pointer() : () -> i64
      %5070 = func.call @stack_pop_pointer() : () -> i64
      %5071 = func.call @cc_cons(%5070, %5069) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5071) : (i64) -> ()
      %5072 = func.call @stack_pop_pointer() : () -> i64
      %5073 = func.call @stack_pop_pointer() : () -> i64
      %5074 = func.call @cc_cons(%5073, %5072) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5074) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5075 = func.call @stack_pop_pointer() : () -> i64
      %5076 = func.call @stack_pop_pointer() : () -> i64
      %5077 = func.call @cc_cons(%5076, %5075) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5077) : (i64) -> ()
      %5078 = func.call @stack_pop_pointer() : () -> i64
      %5079 = func.call @stack_pop_pointer() : () -> i64
      %5080 = func.call @cc_cons(%5079, %5078) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5080) : (i64) -> ()
      %5081 = func.call @stack_pop_pointer() : () -> i64
      %5184 = arith.constant 122791386939414 : i64
      %5185 = arith.constant 0 : i64
      %5186 = func.call @cc_make_closure(%5184, %5185) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5186) : (i64) -> ()
      %5187 = func.call @stack_pop_pointer() : () -> i64
      %5188 = llvm.mlir.addressof @str442 : !llvm.ptr
      %5189 = arith.constant 1 : i64
      %5190 = func.call @cc_make_string(%5188, %5189) : (!llvm.ptr, i64) -> i64
      %5191 = func.call @cc_nil_value() : () -> i64
      %5192 = func.call @cc_intern(%5190, %5191) : (i64, i64) -> i64
      %5193 = func.call @cc_nil_value() : () -> i64
      %5194 = func.call @cc_cons(%5192, %5193) : (i64, i64) -> i64
      %5195 = func.call @cc_values_pack(%5194) : (i64) -> i64
      func.call @stack_push_pointer(%5192) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5196 = func.call @stack_pop_pointer() : () -> i64
      %5197 = func.call @stack_pop_pointer() : () -> i64
      %5198 = func.call @cc_cons(%5197, %5196) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5198) : (i64) -> ()
      %5199 = func.call @stack_pop_pointer() : () -> i64
      %5200 = llvm.mlir.addressof @str443 : !llvm.ptr
      %5201 = arith.constant 11 : i64
      %5202 = func.call @cc_make_string(%5200, %5201) : (!llvm.ptr, i64) -> i64
      %5203 = llvm.mlir.addressof @str444 : !llvm.ptr
      %5204 = arith.constant 7 : i64
      %5205 = func.call @cc_make_string(%5203, %5204) : (!llvm.ptr, i64) -> i64
      %5206 = func.call @cc_intern(%5202, %5205) : (i64, i64) -> i64
      %5207 = func.call @cc_nil_value() : () -> i64
      %5208 = func.call @cc_cons(%5206, %5207) : (i64, i64) -> i64
      %5209 = func.call @cc_values_pack(%5208) : (i64) -> i64
      func.call @stack_push_pointer(%5206) : (i64) -> ()
      %5210 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5211 = func.call @stack_pop_pointer() : () -> i64
      %5212 = llvm.mlir.addressof @str445 : !llvm.ptr
      %5213 = arith.constant 4 : i64
      %5214 = func.call @cc_make_string(%5212, %5213) : (!llvm.ptr, i64) -> i64
      %5215 = llvm.mlir.addressof @str446 : !llvm.ptr
      %5216 = arith.constant 7 : i64
      %5217 = func.call @cc_make_string(%5215, %5216) : (!llvm.ptr, i64) -> i64
      %5218 = func.call @cc_intern(%5214, %5217) : (i64, i64) -> i64
      %5219 = func.call @cc_nil_value() : () -> i64
      %5220 = func.call @cc_cons(%5218, %5219) : (i64, i64) -> i64
      %5221 = func.call @cc_values_pack(%5220) : (i64) -> i64
      func.call @stack_push_pointer(%5218) : (i64) -> ()
      %5222 = func.call @stack_pop_pointer() : () -> i64
      %5223 = llvm.mlir.addressof @str447 : !llvm.ptr
      %5224 = arith.constant 6 : i64
      %5225 = func.call @cc_make_string(%5223, %5224) : (!llvm.ptr, i64) -> i64
      %5226 = func.call @cc_nil_value() : () -> i64
      %5227 = func.call @cc_intern(%5225, %5226) : (i64, i64) -> i64
      %5228 = func.call @cc_nil_value() : () -> i64
      %5229 = func.call @cc_cons(%5227, %5228) : (i64, i64) -> i64
      %5230 = func.call @cc_values_pack(%5229) : (i64) -> i64
      func.call @stack_push_pointer(%5227) : (i64) -> ()
      %5231 = func.call @stack_pop_pointer() : () -> i64
      %5232 = func.call @cc_nil_value() : () -> i64
      %5233 = func.call @cc_errorp(%4865) : (i64) -> i64
      %5234 = arith.cmpi ne, %5233, %5232 : i64
      %5235 = arith.cmpi eq, %5232, %5232 : i64
      %5236 = arith.andi %5234, %5235 : i1
      %5237 = scf.if %5236 -> (i64) {
        scf.yield %4865 : i64
      } else {
        scf.yield %5232 : i64
      }
      %5238 = func.call @cc_errorp(%5081) : (i64) -> i64
      %5239 = arith.cmpi ne, %5238, %5232 : i64
      %5240 = arith.cmpi eq, %5237, %5232 : i64
      %5241 = arith.andi %5239, %5240 : i1
      %5242 = scf.if %5241 -> (i64) {
        scf.yield %5081 : i64
      } else {
        scf.yield %5237 : i64
      }
      %5243 = func.call @cc_errorp(%5187) : (i64) -> i64
      %5244 = arith.cmpi ne, %5243, %5232 : i64
      %5245 = arith.cmpi eq, %5242, %5232 : i64
      %5246 = arith.andi %5244, %5245 : i1
      %5247 = scf.if %5246 -> (i64) {
        scf.yield %5187 : i64
      } else {
        scf.yield %5242 : i64
      }
      %5248 = func.call @cc_errorp(%5199) : (i64) -> i64
      %5249 = arith.cmpi ne, %5248, %5232 : i64
      %5250 = arith.cmpi eq, %5247, %5232 : i64
      %5251 = arith.andi %5249, %5250 : i1
      %5252 = scf.if %5251 -> (i64) {
        scf.yield %5199 : i64
      } else {
        scf.yield %5247 : i64
      }
      %5253 = func.call @cc_errorp(%5210) : (i64) -> i64
      %5254 = arith.cmpi ne, %5253, %5232 : i64
      %5255 = arith.cmpi eq, %5252, %5232 : i64
      %5256 = arith.andi %5254, %5255 : i1
      %5257 = scf.if %5256 -> (i64) {
        scf.yield %5210 : i64
      } else {
        scf.yield %5252 : i64
      }
      %5258 = func.call @cc_errorp(%5211) : (i64) -> i64
      %5259 = arith.cmpi ne, %5258, %5232 : i64
      %5260 = arith.cmpi eq, %5257, %5232 : i64
      %5261 = arith.andi %5259, %5260 : i1
      %5262 = scf.if %5261 -> (i64) {
        scf.yield %5211 : i64
      } else {
        scf.yield %5257 : i64
      }
      %5263 = func.call @cc_errorp(%5222) : (i64) -> i64
      %5264 = arith.cmpi ne, %5263, %5232 : i64
      %5265 = arith.cmpi eq, %5262, %5232 : i64
      %5266 = arith.andi %5264, %5265 : i1
      %5267 = scf.if %5266 -> (i64) {
        scf.yield %5222 : i64
      } else {
        scf.yield %5262 : i64
      }
      %5268 = func.call @cc_errorp(%5231) : (i64) -> i64
      %5269 = arith.cmpi ne, %5268, %5232 : i64
      %5270 = arith.cmpi eq, %5267, %5232 : i64
      %5271 = arith.andi %5269, %5270 : i1
      %5272 = scf.if %5271 -> (i64) {
        scf.yield %5231 : i64
      } else {
        scf.yield %5267 : i64
      }
      %5273 = arith.cmpi ne, %5272, %5232 : i64
      scf.if %5273 {
        func.call @stack_push_pointer(%5272) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4865) : (i64) -> ()
        func.call @stack_push_pointer(%5081) : (i64) -> ()
        func.call @stack_push_pointer(%5187) : (i64) -> ()
        func.call @stack_push_pointer(%5199) : (i64) -> ()
        func.call @stack_push_pointer(%5210) : (i64) -> ()
        func.call @stack_push_pointer(%5211) : (i64) -> ()
        func.call @stack_push_pointer(%5222) : (i64) -> ()
        func.call @stack_push_pointer(%5231) : (i64) -> ()
        %5274 = llvm.mlir.addressof @str448 : !llvm.ptr
        %5275 = func.call @cc_make_function_ref_const(%5274) : (!llvm.ptr) -> i64
        %5276 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5275, %5276) : (i64, i64) -> ()
      }
      %5277 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5277 : i64
    }
    %5278 = func.call @cc_nil_value() : () -> i64
    %5279 = func.call @cc_errorp(%4856) : (i64) -> i64
    %5280 = arith.cmpi ne, %5279, %5278 : i64
    %5281 = scf.if %5280 -> (i64) {
      scf.yield %4856 : i64
    } else {
      %5282 = llvm.mlir.addressof @str449 : !llvm.ptr
      %5283 = arith.constant 27 : i64
      %5284 = func.call @cc_make_string(%5282, %5283) : (!llvm.ptr, i64) -> i64
      %5285 = func.call @cc_nil_value() : () -> i64
      %5286 = func.call @cc_intern(%5284, %5285) : (i64, i64) -> i64
      %5287 = func.call @cc_nil_value() : () -> i64
      %5288 = func.call @cc_cons(%5286, %5287) : (i64, i64) -> i64
      %5289 = func.call @cc_values_pack(%5288) : (i64) -> i64
      func.call @stack_push_pointer(%5286) : (i64) -> ()
      %5290 = func.call @stack_pop_pointer() : () -> i64
      %5291 = llvm.mlir.addressof @str450 : !llvm.ptr
      %5292 = arith.constant 26 : i64
      %5293 = func.call @cc_make_string(%5291, %5292) : (!llvm.ptr, i64) -> i64
      %5294 = llvm.mlir.addressof @str451 : !llvm.ptr
      %5295 = arith.constant 4 : i64
      %5296 = func.call @cc_make_string(%5294, %5295) : (!llvm.ptr, i64) -> i64
      %5297 = func.call @cc_intern(%5293, %5296) : (i64, i64) -> i64
      %5298 = func.call @cc_nil_value() : () -> i64
      %5299 = func.call @cc_cons(%5297, %5298) : (i64, i64) -> i64
      %5300 = func.call @cc_values_pack(%5299) : (i64) -> i64
      func.call @stack_push_pointer(%5297) : (i64) -> ()
      %5301 = llvm.mlir.addressof @str452 : !llvm.ptr
      %5302 = arith.constant 10 : i64
      %5303 = func.call @cc_make_string(%5301, %5302) : (!llvm.ptr, i64) -> i64
      %5304 = llvm.mlir.addressof @str453 : !llvm.ptr
      %5305 = arith.constant 11 : i64
      %5306 = func.call @cc_make_string(%5304, %5305) : (!llvm.ptr, i64) -> i64
      %5307 = func.call @cc_intern(%5303, %5306) : (i64, i64) -> i64
      %5308 = func.call @cc_nil_value() : () -> i64
      %5309 = func.call @cc_cons(%5307, %5308) : (i64, i64) -> i64
      %5310 = func.call @cc_values_pack(%5309) : (i64) -> i64
      func.call @stack_push_pointer(%5307) : (i64) -> ()
      %5311 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5311) : (i64) -> ()
      %5312 = llvm.mlir.addressof @str454 : !llvm.ptr
      %5313 = arith.constant 12 : i64
      %5314 = func.call @cc_make_string(%5312, %5313) : (!llvm.ptr, i64) -> i64
      %5315 = llvm.mlir.addressof @str455 : !llvm.ptr
      %5316 = arith.constant 7 : i64
      %5317 = func.call @cc_make_string(%5315, %5316) : (!llvm.ptr, i64) -> i64
      %5318 = func.call @cc_intern(%5314, %5317) : (i64, i64) -> i64
      %5319 = func.call @cc_nil_value() : () -> i64
      %5320 = func.call @cc_cons(%5318, %5319) : (i64, i64) -> i64
      %5321 = func.call @cc_values_pack(%5320) : (i64) -> i64
      func.call @stack_push_pointer(%5318) : (i64) -> ()
      %5322 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5322) : (i64) -> ()
      %5323 = llvm.mlir.addressof @str456 : !llvm.ptr
      %5324 = arith.constant 9 : i64
      %5325 = func.call @cc_make_string(%5323, %5324) : (!llvm.ptr, i64) -> i64
      %5326 = llvm.mlir.addressof @str457 : !llvm.ptr
      %5327 = arith.constant 11 : i64
      %5328 = func.call @cc_make_string(%5326, %5327) : (!llvm.ptr, i64) -> i64
      %5329 = func.call @cc_intern(%5325, %5328) : (i64, i64) -> i64
      %5330 = func.call @cc_nil_value() : () -> i64
      %5331 = func.call @cc_cons(%5329, %5330) : (i64, i64) -> i64
      %5332 = func.call @cc_values_pack(%5331) : (i64) -> i64
      func.call @stack_push_pointer(%5329) : (i64) -> ()
      %5333 = func.call @stack_pop_pointer() : () -> i64
      %5334 = func.call @stack_pop_pointer() : () -> i64
      %5335 = func.call @cc_cons(%5333, %5334) : (i64, i64) -> i64
      %5336 = llvm.mlir.addressof @str458 : !llvm.ptr
      %5337 = arith.constant 5 : i64
      %5338 = func.call @cc_make_string(%5336, %5337) : (!llvm.ptr, i64) -> i64
      %5339 = func.call @cc_nil_value() : () -> i64
      %5340 = func.call @cc_intern(%5338, %5339) : (i64, i64) -> i64
      %5341 = func.call @cc_nil_value() : () -> i64
      %5342 = func.call @cc_cons(%5340, %5341) : (i64, i64) -> i64
      %5343 = func.call @cc_values_pack(%5342) : (i64) -> i64
      %5344 = func.call @cc_cons(%5340, %5335) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5344) : (i64) -> ()
      %5345 = llvm.mlir.addressof @str459 : !llvm.ptr
      %5346 = arith.constant 10 : i64
      %5347 = func.call @cc_make_string(%5345, %5346) : (!llvm.ptr, i64) -> i64
      %5348 = llvm.mlir.addressof @str460 : !llvm.ptr
      %5349 = arith.constant 7 : i64
      %5350 = func.call @cc_make_string(%5348, %5349) : (!llvm.ptr, i64) -> i64
      %5351 = func.call @cc_intern(%5347, %5350) : (i64, i64) -> i64
      %5352 = func.call @cc_nil_value() : () -> i64
      %5353 = func.call @cc_cons(%5351, %5352) : (i64, i64) -> i64
      %5354 = func.call @cc_values_pack(%5353) : (i64) -> i64
      func.call @stack_push_pointer(%5351) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5355 = llvm.mlir.addressof @str461 : !llvm.ptr
      %5356 = arith.constant 15 : i64
      %5357 = func.call @cc_make_string(%5355, %5356) : (!llvm.ptr, i64) -> i64
      %5358 = llvm.mlir.addressof @str462 : !llvm.ptr
      %5359 = arith.constant 7 : i64
      %5360 = func.call @cc_make_string(%5358, %5359) : (!llvm.ptr, i64) -> i64
      %5361 = func.call @cc_intern(%5357, %5360) : (i64, i64) -> i64
      %5362 = func.call @cc_nil_value() : () -> i64
      %5363 = func.call @cc_cons(%5361, %5362) : (i64, i64) -> i64
      %5364 = func.call @cc_values_pack(%5363) : (i64) -> i64
      func.call @stack_push_pointer(%5361) : (i64) -> ()
      %5365 = arith.constant 67 : i64
      %5366 = func.call @cc_box_character(%5365) : (i64) -> i64
      func.call @stack_push_pointer(%5366) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5367 = func.call @stack_pop_pointer() : () -> i64
      %5368 = func.call @stack_pop_pointer() : () -> i64
      %5369 = func.call @cc_cons(%5368, %5367) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5369) : (i64) -> ()
      %5370 = func.call @stack_pop_pointer() : () -> i64
      %5371 = func.call @stack_pop_pointer() : () -> i64
      %5372 = func.call @cc_cons(%5371, %5370) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5372) : (i64) -> ()
      %5373 = func.call @stack_pop_pointer() : () -> i64
      %5374 = func.call @stack_pop_pointer() : () -> i64
      %5375 = func.call @cc_cons(%5374, %5373) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5375) : (i64) -> ()
      %5376 = func.call @stack_pop_pointer() : () -> i64
      %5377 = func.call @stack_pop_pointer() : () -> i64
      %5378 = func.call @cc_cons(%5377, %5376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5378) : (i64) -> ()
      %5379 = func.call @stack_pop_pointer() : () -> i64
      %5380 = func.call @stack_pop_pointer() : () -> i64
      %5381 = func.call @cc_cons(%5380, %5379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5381) : (i64) -> ()
      %5382 = func.call @stack_pop_pointer() : () -> i64
      %5383 = func.call @stack_pop_pointer() : () -> i64
      %5384 = func.call @cc_cons(%5383, %5382) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5384) : (i64) -> ()
      %5385 = func.call @stack_pop_pointer() : () -> i64
      %5386 = func.call @stack_pop_pointer() : () -> i64
      %5387 = func.call @cc_cons(%5386, %5385) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5387) : (i64) -> ()
      %5388 = func.call @stack_pop_pointer() : () -> i64
      %5389 = func.call @stack_pop_pointer() : () -> i64
      %5390 = func.call @cc_cons(%5389, %5388) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5390) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5391 = func.call @stack_pop_pointer() : () -> i64
      %5392 = func.call @stack_pop_pointer() : () -> i64
      %5393 = func.call @cc_cons(%5392, %5391) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5393) : (i64) -> ()
      %5394 = func.call @stack_pop_pointer() : () -> i64
      %5395 = func.call @stack_pop_pointer() : () -> i64
      %5396 = func.call @cc_cons(%5395, %5394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5396) : (i64) -> ()
      %5397 = func.call @stack_pop_pointer() : () -> i64
      %5505 = arith.constant 122791386939415 : i64
      %5506 = arith.constant 0 : i64
      %5507 = func.call @cc_make_closure(%5505, %5506) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5507) : (i64) -> ()
      %5508 = func.call @stack_pop_pointer() : () -> i64
      %5509 = llvm.mlir.addressof @str473 : !llvm.ptr
      %5510 = arith.constant 3 : i64
      %5511 = func.call @cc_make_string(%5509, %5510) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5511) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5512 = func.call @stack_pop_pointer() : () -> i64
      %5513 = func.call @stack_pop_pointer() : () -> i64
      %5514 = func.call @cc_cons(%5513, %5512) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5514) : (i64) -> ()
      %5515 = func.call @stack_pop_pointer() : () -> i64
      %5516 = llvm.mlir.addressof @str474 : !llvm.ptr
      %5517 = arith.constant 11 : i64
      %5518 = func.call @cc_make_string(%5516, %5517) : (!llvm.ptr, i64) -> i64
      %5519 = llvm.mlir.addressof @str475 : !llvm.ptr
      %5520 = arith.constant 7 : i64
      %5521 = func.call @cc_make_string(%5519, %5520) : (!llvm.ptr, i64) -> i64
      %5522 = func.call @cc_intern(%5518, %5521) : (i64, i64) -> i64
      %5523 = func.call @cc_nil_value() : () -> i64
      %5524 = func.call @cc_cons(%5522, %5523) : (i64, i64) -> i64
      %5525 = func.call @cc_values_pack(%5524) : (i64) -> i64
      func.call @stack_push_pointer(%5522) : (i64) -> ()
      %5526 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5527 = func.call @stack_pop_pointer() : () -> i64
      %5528 = llvm.mlir.addressof @str476 : !llvm.ptr
      %5529 = arith.constant 4 : i64
      %5530 = func.call @cc_make_string(%5528, %5529) : (!llvm.ptr, i64) -> i64
      %5531 = llvm.mlir.addressof @str477 : !llvm.ptr
      %5532 = arith.constant 7 : i64
      %5533 = func.call @cc_make_string(%5531, %5532) : (!llvm.ptr, i64) -> i64
      %5534 = func.call @cc_intern(%5530, %5533) : (i64, i64) -> i64
      %5535 = func.call @cc_nil_value() : () -> i64
      %5536 = func.call @cc_cons(%5534, %5535) : (i64, i64) -> i64
      %5537 = func.call @cc_values_pack(%5536) : (i64) -> i64
      func.call @stack_push_pointer(%5534) : (i64) -> ()
      %5538 = func.call @stack_pop_pointer() : () -> i64
      %5539 = llvm.mlir.addressof @str478 : !llvm.ptr
      %5540 = arith.constant 7 : i64
      %5541 = func.call @cc_make_string(%5539, %5540) : (!llvm.ptr, i64) -> i64
      %5542 = llvm.mlir.addressof @str479 : !llvm.ptr
      %5543 = arith.constant 11 : i64
      %5544 = func.call @cc_make_string(%5542, %5543) : (!llvm.ptr, i64) -> i64
      %5545 = func.call @cc_intern(%5541, %5544) : (i64, i64) -> i64
      %5546 = func.call @cc_nil_value() : () -> i64
      %5547 = func.call @cc_cons(%5545, %5546) : (i64, i64) -> i64
      %5548 = func.call @cc_values_pack(%5547) : (i64) -> i64
      func.call @stack_push_pointer(%5545) : (i64) -> ()
      %5549 = func.call @stack_pop_pointer() : () -> i64
      %5550 = func.call @cc_nil_value() : () -> i64
      %5551 = func.call @cc_errorp(%5290) : (i64) -> i64
      %5552 = arith.cmpi ne, %5551, %5550 : i64
      %5553 = arith.cmpi eq, %5550, %5550 : i64
      %5554 = arith.andi %5552, %5553 : i1
      %5555 = scf.if %5554 -> (i64) {
        scf.yield %5290 : i64
      } else {
        scf.yield %5550 : i64
      }
      %5556 = func.call @cc_errorp(%5397) : (i64) -> i64
      %5557 = arith.cmpi ne, %5556, %5550 : i64
      %5558 = arith.cmpi eq, %5555, %5550 : i64
      %5559 = arith.andi %5557, %5558 : i1
      %5560 = scf.if %5559 -> (i64) {
        scf.yield %5397 : i64
      } else {
        scf.yield %5555 : i64
      }
      %5561 = func.call @cc_errorp(%5508) : (i64) -> i64
      %5562 = arith.cmpi ne, %5561, %5550 : i64
      %5563 = arith.cmpi eq, %5560, %5550 : i64
      %5564 = arith.andi %5562, %5563 : i1
      %5565 = scf.if %5564 -> (i64) {
        scf.yield %5508 : i64
      } else {
        scf.yield %5560 : i64
      }
      %5566 = func.call @cc_errorp(%5515) : (i64) -> i64
      %5567 = arith.cmpi ne, %5566, %5550 : i64
      %5568 = arith.cmpi eq, %5565, %5550 : i64
      %5569 = arith.andi %5567, %5568 : i1
      %5570 = scf.if %5569 -> (i64) {
        scf.yield %5515 : i64
      } else {
        scf.yield %5565 : i64
      }
      %5571 = func.call @cc_errorp(%5526) : (i64) -> i64
      %5572 = arith.cmpi ne, %5571, %5550 : i64
      %5573 = arith.cmpi eq, %5570, %5550 : i64
      %5574 = arith.andi %5572, %5573 : i1
      %5575 = scf.if %5574 -> (i64) {
        scf.yield %5526 : i64
      } else {
        scf.yield %5570 : i64
      }
      %5576 = func.call @cc_errorp(%5527) : (i64) -> i64
      %5577 = arith.cmpi ne, %5576, %5550 : i64
      %5578 = arith.cmpi eq, %5575, %5550 : i64
      %5579 = arith.andi %5577, %5578 : i1
      %5580 = scf.if %5579 -> (i64) {
        scf.yield %5527 : i64
      } else {
        scf.yield %5575 : i64
      }
      %5581 = func.call @cc_errorp(%5538) : (i64) -> i64
      %5582 = arith.cmpi ne, %5581, %5550 : i64
      %5583 = arith.cmpi eq, %5580, %5550 : i64
      %5584 = arith.andi %5582, %5583 : i1
      %5585 = scf.if %5584 -> (i64) {
        scf.yield %5538 : i64
      } else {
        scf.yield %5580 : i64
      }
      %5586 = func.call @cc_errorp(%5549) : (i64) -> i64
      %5587 = arith.cmpi ne, %5586, %5550 : i64
      %5588 = arith.cmpi eq, %5585, %5550 : i64
      %5589 = arith.andi %5587, %5588 : i1
      %5590 = scf.if %5589 -> (i64) {
        scf.yield %5549 : i64
      } else {
        scf.yield %5585 : i64
      }
      %5591 = arith.cmpi ne, %5590, %5550 : i64
      scf.if %5591 {
        func.call @stack_push_pointer(%5590) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5290) : (i64) -> ()
        func.call @stack_push_pointer(%5397) : (i64) -> ()
        func.call @stack_push_pointer(%5508) : (i64) -> ()
        func.call @stack_push_pointer(%5515) : (i64) -> ()
        func.call @stack_push_pointer(%5526) : (i64) -> ()
        func.call @stack_push_pointer(%5527) : (i64) -> ()
        func.call @stack_push_pointer(%5538) : (i64) -> ()
        func.call @stack_push_pointer(%5549) : (i64) -> ()
        %5592 = llvm.mlir.addressof @str480 : !llvm.ptr
        %5593 = func.call @cc_make_function_ref_const(%5592) : (!llvm.ptr) -> i64
        %5594 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5593, %5594) : (i64, i64) -> ()
      }
      %5595 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5595 : i64
    }
    %5596 = func.call @cc_nil_value() : () -> i64
    %5597 = func.call @cc_errorp(%5281) : (i64) -> i64
    %5598 = arith.cmpi ne, %5597, %5596 : i64
    %5599 = scf.if %5598 -> (i64) {
      scf.yield %5281 : i64
    } else {
      %5600 = llvm.mlir.addressof @str481 : !llvm.ptr
      %5601 = arith.constant 27 : i64
      %5602 = func.call @cc_make_string(%5600, %5601) : (!llvm.ptr, i64) -> i64
      %5603 = func.call @cc_nil_value() : () -> i64
      %5604 = func.call @cc_intern(%5602, %5603) : (i64, i64) -> i64
      %5605 = func.call @cc_nil_value() : () -> i64
      %5606 = func.call @cc_cons(%5604, %5605) : (i64, i64) -> i64
      %5607 = func.call @cc_values_pack(%5606) : (i64) -> i64
      func.call @stack_push_pointer(%5604) : (i64) -> ()
      %5608 = func.call @stack_pop_pointer() : () -> i64
      %5609 = llvm.mlir.addressof @str482 : !llvm.ptr
      %5610 = arith.constant 26 : i64
      %5611 = func.call @cc_make_string(%5609, %5610) : (!llvm.ptr, i64) -> i64
      %5612 = llvm.mlir.addressof @str483 : !llvm.ptr
      %5613 = arith.constant 4 : i64
      %5614 = func.call @cc_make_string(%5612, %5613) : (!llvm.ptr, i64) -> i64
      %5615 = func.call @cc_intern(%5611, %5614) : (i64, i64) -> i64
      %5616 = func.call @cc_nil_value() : () -> i64
      %5617 = func.call @cc_cons(%5615, %5616) : (i64, i64) -> i64
      %5618 = func.call @cc_values_pack(%5617) : (i64) -> i64
      func.call @stack_push_pointer(%5615) : (i64) -> ()
      %5619 = llvm.mlir.addressof @str484 : !llvm.ptr
      %5620 = arith.constant 10 : i64
      %5621 = func.call @cc_make_string(%5619, %5620) : (!llvm.ptr, i64) -> i64
      %5622 = llvm.mlir.addressof @str485 : !llvm.ptr
      %5623 = arith.constant 11 : i64
      %5624 = func.call @cc_make_string(%5622, %5623) : (!llvm.ptr, i64) -> i64
      %5625 = func.call @cc_intern(%5621, %5624) : (i64, i64) -> i64
      %5626 = func.call @cc_nil_value() : () -> i64
      %5627 = func.call @cc_cons(%5625, %5626) : (i64, i64) -> i64
      %5628 = func.call @cc_values_pack(%5627) : (i64) -> i64
      func.call @stack_push_pointer(%5625) : (i64) -> ()
      %5629 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5629) : (i64) -> ()
      %5630 = llvm.mlir.addressof @str486 : !llvm.ptr
      %5631 = arith.constant 12 : i64
      %5632 = func.call @cc_make_string(%5630, %5631) : (!llvm.ptr, i64) -> i64
      %5633 = llvm.mlir.addressof @str487 : !llvm.ptr
      %5634 = arith.constant 7 : i64
      %5635 = func.call @cc_make_string(%5633, %5634) : (!llvm.ptr, i64) -> i64
      %5636 = func.call @cc_intern(%5632, %5635) : (i64, i64) -> i64
      %5637 = func.call @cc_nil_value() : () -> i64
      %5638 = func.call @cc_cons(%5636, %5637) : (i64, i64) -> i64
      %5639 = func.call @cc_values_pack(%5638) : (i64) -> i64
      func.call @stack_push_pointer(%5636) : (i64) -> ()
      %5640 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5640) : (i64) -> ()
      %5641 = llvm.mlir.addressof @str488 : !llvm.ptr
      %5642 = arith.constant 9 : i64
      %5643 = func.call @cc_make_string(%5641, %5642) : (!llvm.ptr, i64) -> i64
      %5644 = llvm.mlir.addressof @str489 : !llvm.ptr
      %5645 = arith.constant 11 : i64
      %5646 = func.call @cc_make_string(%5644, %5645) : (!llvm.ptr, i64) -> i64
      %5647 = func.call @cc_intern(%5643, %5646) : (i64, i64) -> i64
      %5648 = func.call @cc_nil_value() : () -> i64
      %5649 = func.call @cc_cons(%5647, %5648) : (i64, i64) -> i64
      %5650 = func.call @cc_values_pack(%5649) : (i64) -> i64
      func.call @stack_push_pointer(%5647) : (i64) -> ()
      %5651 = func.call @stack_pop_pointer() : () -> i64
      %5652 = func.call @stack_pop_pointer() : () -> i64
      %5653 = func.call @cc_cons(%5651, %5652) : (i64, i64) -> i64
      %5654 = llvm.mlir.addressof @str490 : !llvm.ptr
      %5655 = arith.constant 5 : i64
      %5656 = func.call @cc_make_string(%5654, %5655) : (!llvm.ptr, i64) -> i64
      %5657 = func.call @cc_nil_value() : () -> i64
      %5658 = func.call @cc_intern(%5656, %5657) : (i64, i64) -> i64
      %5659 = func.call @cc_nil_value() : () -> i64
      %5660 = func.call @cc_cons(%5658, %5659) : (i64, i64) -> i64
      %5661 = func.call @cc_values_pack(%5660) : (i64) -> i64
      %5662 = func.call @cc_cons(%5658, %5653) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5662) : (i64) -> ()
      %5663 = llvm.mlir.addressof @str491 : !llvm.ptr
      %5664 = arith.constant 10 : i64
      %5665 = func.call @cc_make_string(%5663, %5664) : (!llvm.ptr, i64) -> i64
      %5666 = llvm.mlir.addressof @str492 : !llvm.ptr
      %5667 = arith.constant 7 : i64
      %5668 = func.call @cc_make_string(%5666, %5667) : (!llvm.ptr, i64) -> i64
      %5669 = func.call @cc_intern(%5665, %5668) : (i64, i64) -> i64
      %5670 = func.call @cc_nil_value() : () -> i64
      %5671 = func.call @cc_cons(%5669, %5670) : (i64, i64) -> i64
      %5672 = func.call @cc_values_pack(%5671) : (i64) -> i64
      func.call @stack_push_pointer(%5669) : (i64) -> ()
      %5673 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%5673) : (i64) -> ()
      %5674 = llvm.mlir.addressof @str493 : !llvm.ptr
      %5675 = arith.constant 15 : i64
      %5676 = func.call @cc_make_string(%5674, %5675) : (!llvm.ptr, i64) -> i64
      %5677 = llvm.mlir.addressof @str494 : !llvm.ptr
      %5678 = arith.constant 7 : i64
      %5679 = func.call @cc_make_string(%5677, %5678) : (!llvm.ptr, i64) -> i64
      %5680 = func.call @cc_intern(%5676, %5679) : (i64, i64) -> i64
      %5681 = func.call @cc_nil_value() : () -> i64
      %5682 = func.call @cc_cons(%5680, %5681) : (i64, i64) -> i64
      %5683 = func.call @cc_values_pack(%5682) : (i64) -> i64
      func.call @stack_push_pointer(%5680) : (i64) -> ()
      %5684 = arith.constant 67 : i64
      %5685 = func.call @cc_box_character(%5684) : (i64) -> i64
      func.call @stack_push_pointer(%5685) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5686 = func.call @stack_pop_pointer() : () -> i64
      %5687 = func.call @stack_pop_pointer() : () -> i64
      %5688 = func.call @cc_cons(%5687, %5686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5688) : (i64) -> ()
      %5689 = func.call @stack_pop_pointer() : () -> i64
      %5690 = func.call @stack_pop_pointer() : () -> i64
      %5691 = func.call @cc_cons(%5690, %5689) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5691) : (i64) -> ()
      %5692 = func.call @stack_pop_pointer() : () -> i64
      %5693 = func.call @stack_pop_pointer() : () -> i64
      %5694 = func.call @cc_cons(%5693, %5692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5694) : (i64) -> ()
      %5695 = func.call @stack_pop_pointer() : () -> i64
      %5696 = func.call @stack_pop_pointer() : () -> i64
      %5697 = func.call @cc_cons(%5696, %5695) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5697) : (i64) -> ()
      %5698 = func.call @stack_pop_pointer() : () -> i64
      %5699 = func.call @stack_pop_pointer() : () -> i64
      %5700 = func.call @cc_cons(%5699, %5698) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5700) : (i64) -> ()
      %5701 = func.call @stack_pop_pointer() : () -> i64
      %5702 = func.call @stack_pop_pointer() : () -> i64
      %5703 = func.call @cc_cons(%5702, %5701) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5703) : (i64) -> ()
      %5704 = func.call @stack_pop_pointer() : () -> i64
      %5705 = func.call @stack_pop_pointer() : () -> i64
      %5706 = func.call @cc_cons(%5705, %5704) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5706) : (i64) -> ()
      %5707 = func.call @stack_pop_pointer() : () -> i64
      %5708 = func.call @stack_pop_pointer() : () -> i64
      %5709 = func.call @cc_cons(%5708, %5707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5709) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5710 = func.call @stack_pop_pointer() : () -> i64
      %5711 = func.call @stack_pop_pointer() : () -> i64
      %5712 = func.call @cc_cons(%5711, %5710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5712) : (i64) -> ()
      %5713 = func.call @stack_pop_pointer() : () -> i64
      %5714 = func.call @stack_pop_pointer() : () -> i64
      %5715 = func.call @cc_cons(%5714, %5713) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5715) : (i64) -> ()
      %5716 = func.call @stack_pop_pointer() : () -> i64
      %5825 = arith.constant 122791386939416 : i64
      %5826 = arith.constant 0 : i64
      %5827 = func.call @cc_make_closure(%5825, %5826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5827) : (i64) -> ()
      %5828 = func.call @stack_pop_pointer() : () -> i64
      %5829 = llvm.mlir.addressof @str505 : !llvm.ptr
      %5830 = arith.constant 3 : i64
      %5831 = func.call @cc_make_string(%5829, %5830) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5831) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5832 = func.call @stack_pop_pointer() : () -> i64
      %5833 = func.call @stack_pop_pointer() : () -> i64
      %5834 = func.call @cc_cons(%5833, %5832) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5834) : (i64) -> ()
      %5835 = func.call @stack_pop_pointer() : () -> i64
      %5836 = llvm.mlir.addressof @str506 : !llvm.ptr
      %5837 = arith.constant 11 : i64
      %5838 = func.call @cc_make_string(%5836, %5837) : (!llvm.ptr, i64) -> i64
      %5839 = llvm.mlir.addressof @str507 : !llvm.ptr
      %5840 = arith.constant 7 : i64
      %5841 = func.call @cc_make_string(%5839, %5840) : (!llvm.ptr, i64) -> i64
      %5842 = func.call @cc_intern(%5838, %5841) : (i64, i64) -> i64
      %5843 = func.call @cc_nil_value() : () -> i64
      %5844 = func.call @cc_cons(%5842, %5843) : (i64, i64) -> i64
      %5845 = func.call @cc_values_pack(%5844) : (i64) -> i64
      func.call @stack_push_pointer(%5842) : (i64) -> ()
      %5846 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5847 = func.call @stack_pop_pointer() : () -> i64
      %5848 = llvm.mlir.addressof @str508 : !llvm.ptr
      %5849 = arith.constant 4 : i64
      %5850 = func.call @cc_make_string(%5848, %5849) : (!llvm.ptr, i64) -> i64
      %5851 = llvm.mlir.addressof @str509 : !llvm.ptr
      %5852 = arith.constant 7 : i64
      %5853 = func.call @cc_make_string(%5851, %5852) : (!llvm.ptr, i64) -> i64
      %5854 = func.call @cc_intern(%5850, %5853) : (i64, i64) -> i64
      %5855 = func.call @cc_nil_value() : () -> i64
      %5856 = func.call @cc_cons(%5854, %5855) : (i64, i64) -> i64
      %5857 = func.call @cc_values_pack(%5856) : (i64) -> i64
      func.call @stack_push_pointer(%5854) : (i64) -> ()
      %5858 = func.call @stack_pop_pointer() : () -> i64
      %5859 = llvm.mlir.addressof @str510 : !llvm.ptr
      %5860 = arith.constant 7 : i64
      %5861 = func.call @cc_make_string(%5859, %5860) : (!llvm.ptr, i64) -> i64
      %5862 = llvm.mlir.addressof @str511 : !llvm.ptr
      %5863 = arith.constant 11 : i64
      %5864 = func.call @cc_make_string(%5862, %5863) : (!llvm.ptr, i64) -> i64
      %5865 = func.call @cc_intern(%5861, %5864) : (i64, i64) -> i64
      %5866 = func.call @cc_nil_value() : () -> i64
      %5867 = func.call @cc_cons(%5865, %5866) : (i64, i64) -> i64
      %5868 = func.call @cc_values_pack(%5867) : (i64) -> i64
      func.call @stack_push_pointer(%5865) : (i64) -> ()
      %5869 = func.call @stack_pop_pointer() : () -> i64
      %5870 = func.call @cc_nil_value() : () -> i64
      %5871 = func.call @cc_errorp(%5608) : (i64) -> i64
      %5872 = arith.cmpi ne, %5871, %5870 : i64
      %5873 = arith.cmpi eq, %5870, %5870 : i64
      %5874 = arith.andi %5872, %5873 : i1
      %5875 = scf.if %5874 -> (i64) {
        scf.yield %5608 : i64
      } else {
        scf.yield %5870 : i64
      }
      %5876 = func.call @cc_errorp(%5716) : (i64) -> i64
      %5877 = arith.cmpi ne, %5876, %5870 : i64
      %5878 = arith.cmpi eq, %5875, %5870 : i64
      %5879 = arith.andi %5877, %5878 : i1
      %5880 = scf.if %5879 -> (i64) {
        scf.yield %5716 : i64
      } else {
        scf.yield %5875 : i64
      }
      %5881 = func.call @cc_errorp(%5828) : (i64) -> i64
      %5882 = arith.cmpi ne, %5881, %5870 : i64
      %5883 = arith.cmpi eq, %5880, %5870 : i64
      %5884 = arith.andi %5882, %5883 : i1
      %5885 = scf.if %5884 -> (i64) {
        scf.yield %5828 : i64
      } else {
        scf.yield %5880 : i64
      }
      %5886 = func.call @cc_errorp(%5835) : (i64) -> i64
      %5887 = arith.cmpi ne, %5886, %5870 : i64
      %5888 = arith.cmpi eq, %5885, %5870 : i64
      %5889 = arith.andi %5887, %5888 : i1
      %5890 = scf.if %5889 -> (i64) {
        scf.yield %5835 : i64
      } else {
        scf.yield %5885 : i64
      }
      %5891 = func.call @cc_errorp(%5846) : (i64) -> i64
      %5892 = arith.cmpi ne, %5891, %5870 : i64
      %5893 = arith.cmpi eq, %5890, %5870 : i64
      %5894 = arith.andi %5892, %5893 : i1
      %5895 = scf.if %5894 -> (i64) {
        scf.yield %5846 : i64
      } else {
        scf.yield %5890 : i64
      }
      %5896 = func.call @cc_errorp(%5847) : (i64) -> i64
      %5897 = arith.cmpi ne, %5896, %5870 : i64
      %5898 = arith.cmpi eq, %5895, %5870 : i64
      %5899 = arith.andi %5897, %5898 : i1
      %5900 = scf.if %5899 -> (i64) {
        scf.yield %5847 : i64
      } else {
        scf.yield %5895 : i64
      }
      %5901 = func.call @cc_errorp(%5858) : (i64) -> i64
      %5902 = arith.cmpi ne, %5901, %5870 : i64
      %5903 = arith.cmpi eq, %5900, %5870 : i64
      %5904 = arith.andi %5902, %5903 : i1
      %5905 = scf.if %5904 -> (i64) {
        scf.yield %5858 : i64
      } else {
        scf.yield %5900 : i64
      }
      %5906 = func.call @cc_errorp(%5869) : (i64) -> i64
      %5907 = arith.cmpi ne, %5906, %5870 : i64
      %5908 = arith.cmpi eq, %5905, %5870 : i64
      %5909 = arith.andi %5907, %5908 : i1
      %5910 = scf.if %5909 -> (i64) {
        scf.yield %5869 : i64
      } else {
        scf.yield %5905 : i64
      }
      %5911 = arith.cmpi ne, %5910, %5870 : i64
      scf.if %5911 {
        func.call @stack_push_pointer(%5910) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5608) : (i64) -> ()
        func.call @stack_push_pointer(%5716) : (i64) -> ()
        func.call @stack_push_pointer(%5828) : (i64) -> ()
        func.call @stack_push_pointer(%5835) : (i64) -> ()
        func.call @stack_push_pointer(%5846) : (i64) -> ()
        func.call @stack_push_pointer(%5847) : (i64) -> ()
        func.call @stack_push_pointer(%5858) : (i64) -> ()
        func.call @stack_push_pointer(%5869) : (i64) -> ()
        %5912 = llvm.mlir.addressof @str512 : !llvm.ptr
        %5913 = func.call @cc_make_function_ref_const(%5912) : (!llvm.ptr) -> i64
        %5914 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%5913, %5914) : (i64, i64) -> ()
      }
      %5915 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5915 : i64
    }
    %5916 = func.call @cc_nil_value() : () -> i64
    %5917 = func.call @cc_errorp(%5599) : (i64) -> i64
    %5918 = arith.cmpi ne, %5917, %5916 : i64
    %5919 = scf.if %5918 -> (i64) {
      scf.yield %5599 : i64
    } else {
      %5920 = llvm.mlir.addressof @str513 : !llvm.ptr
      %5921 = arith.constant 27 : i64
      %5922 = func.call @cc_make_string(%5920, %5921) : (!llvm.ptr, i64) -> i64
      %5923 = func.call @cc_nil_value() : () -> i64
      %5924 = func.call @cc_intern(%5922, %5923) : (i64, i64) -> i64
      %5925 = func.call @cc_nil_value() : () -> i64
      %5926 = func.call @cc_cons(%5924, %5925) : (i64, i64) -> i64
      %5927 = func.call @cc_values_pack(%5926) : (i64) -> i64
      func.call @stack_push_pointer(%5924) : (i64) -> ()
      %5928 = func.call @stack_pop_pointer() : () -> i64
      %5929 = llvm.mlir.addressof @str514 : !llvm.ptr
      %5930 = arith.constant 26 : i64
      %5931 = func.call @cc_make_string(%5929, %5930) : (!llvm.ptr, i64) -> i64
      %5932 = llvm.mlir.addressof @str515 : !llvm.ptr
      %5933 = arith.constant 4 : i64
      %5934 = func.call @cc_make_string(%5932, %5933) : (!llvm.ptr, i64) -> i64
      %5935 = func.call @cc_intern(%5931, %5934) : (i64, i64) -> i64
      %5936 = func.call @cc_nil_value() : () -> i64
      %5937 = func.call @cc_cons(%5935, %5936) : (i64, i64) -> i64
      %5938 = func.call @cc_values_pack(%5937) : (i64) -> i64
      func.call @stack_push_pointer(%5935) : (i64) -> ()
      %5939 = llvm.mlir.addressof @str516 : !llvm.ptr
      %5940 = arith.constant 10 : i64
      %5941 = func.call @cc_make_string(%5939, %5940) : (!llvm.ptr, i64) -> i64
      %5942 = llvm.mlir.addressof @str517 : !llvm.ptr
      %5943 = arith.constant 11 : i64
      %5944 = func.call @cc_make_string(%5942, %5943) : (!llvm.ptr, i64) -> i64
      %5945 = func.call @cc_intern(%5941, %5944) : (i64, i64) -> i64
      %5946 = func.call @cc_nil_value() : () -> i64
      %5947 = func.call @cc_cons(%5945, %5946) : (i64, i64) -> i64
      %5948 = func.call @cc_values_pack(%5947) : (i64) -> i64
      func.call @stack_push_pointer(%5945) : (i64) -> ()
      %5949 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5949) : (i64) -> ()
      %5950 = llvm.mlir.addressof @str518 : !llvm.ptr
      %5951 = arith.constant 12 : i64
      %5952 = func.call @cc_make_string(%5950, %5951) : (!llvm.ptr, i64) -> i64
      %5953 = llvm.mlir.addressof @str519 : !llvm.ptr
      %5954 = arith.constant 7 : i64
      %5955 = func.call @cc_make_string(%5953, %5954) : (!llvm.ptr, i64) -> i64
      %5956 = func.call @cc_intern(%5952, %5955) : (i64, i64) -> i64
      %5957 = func.call @cc_nil_value() : () -> i64
      %5958 = func.call @cc_cons(%5956, %5957) : (i64, i64) -> i64
      %5959 = func.call @cc_values_pack(%5958) : (i64) -> i64
      func.call @stack_push_pointer(%5956) : (i64) -> ()
      %5960 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%5960) : (i64) -> ()
      %5961 = llvm.mlir.addressof @str520 : !llvm.ptr
      %5962 = arith.constant 9 : i64
      %5963 = func.call @cc_make_string(%5961, %5962) : (!llvm.ptr, i64) -> i64
      %5964 = llvm.mlir.addressof @str521 : !llvm.ptr
      %5965 = arith.constant 11 : i64
      %5966 = func.call @cc_make_string(%5964, %5965) : (!llvm.ptr, i64) -> i64
      %5967 = func.call @cc_intern(%5963, %5966) : (i64, i64) -> i64
      %5968 = func.call @cc_nil_value() : () -> i64
      %5969 = func.call @cc_cons(%5967, %5968) : (i64, i64) -> i64
      %5970 = func.call @cc_values_pack(%5969) : (i64) -> i64
      func.call @stack_push_pointer(%5967) : (i64) -> ()
      %5971 = func.call @stack_pop_pointer() : () -> i64
      %5972 = func.call @stack_pop_pointer() : () -> i64
      %5973 = func.call @cc_cons(%5971, %5972) : (i64, i64) -> i64
      %5974 = llvm.mlir.addressof @str522 : !llvm.ptr
      %5975 = arith.constant 5 : i64
      %5976 = func.call @cc_make_string(%5974, %5975) : (!llvm.ptr, i64) -> i64
      %5977 = func.call @cc_nil_value() : () -> i64
      %5978 = func.call @cc_intern(%5976, %5977) : (i64, i64) -> i64
      %5979 = func.call @cc_nil_value() : () -> i64
      %5980 = func.call @cc_cons(%5978, %5979) : (i64, i64) -> i64
      %5981 = func.call @cc_values_pack(%5980) : (i64) -> i64
      %5982 = func.call @cc_cons(%5978, %5973) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5982) : (i64) -> ()
      %5983 = llvm.mlir.addressof @str523 : !llvm.ptr
      %5984 = arith.constant 10 : i64
      %5985 = func.call @cc_make_string(%5983, %5984) : (!llvm.ptr, i64) -> i64
      %5986 = llvm.mlir.addressof @str524 : !llvm.ptr
      %5987 = arith.constant 7 : i64
      %5988 = func.call @cc_make_string(%5986, %5987) : (!llvm.ptr, i64) -> i64
      %5989 = func.call @cc_intern(%5985, %5988) : (i64, i64) -> i64
      %5990 = func.call @cc_nil_value() : () -> i64
      %5991 = func.call @cc_cons(%5989, %5990) : (i64, i64) -> i64
      %5992 = func.call @cc_values_pack(%5991) : (i64) -> i64
      func.call @stack_push_pointer(%5989) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5993 = llvm.mlir.addressof @str525 : !llvm.ptr
      %5994 = arith.constant 15 : i64
      %5995 = func.call @cc_make_string(%5993, %5994) : (!llvm.ptr, i64) -> i64
      %5996 = llvm.mlir.addressof @str526 : !llvm.ptr
      %5997 = arith.constant 7 : i64
      %5998 = func.call @cc_make_string(%5996, %5997) : (!llvm.ptr, i64) -> i64
      %5999 = func.call @cc_intern(%5995, %5998) : (i64, i64) -> i64
      %6000 = func.call @cc_nil_value() : () -> i64
      %6001 = func.call @cc_cons(%5999, %6000) : (i64, i64) -> i64
      %6002 = func.call @cc_values_pack(%6001) : (i64) -> i64
      func.call @stack_push_pointer(%5999) : (i64) -> ()
      %6003 = arith.constant 67 : i64
      %6004 = func.call @cc_box_character(%6003) : (i64) -> i64
      func.call @stack_push_pointer(%6004) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6005 = func.call @stack_pop_pointer() : () -> i64
      %6006 = func.call @stack_pop_pointer() : () -> i64
      %6007 = func.call @cc_cons(%6006, %6005) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6007) : (i64) -> ()
      %6008 = func.call @stack_pop_pointer() : () -> i64
      %6009 = func.call @stack_pop_pointer() : () -> i64
      %6010 = func.call @cc_cons(%6009, %6008) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6010) : (i64) -> ()
      %6011 = func.call @stack_pop_pointer() : () -> i64
      %6012 = func.call @stack_pop_pointer() : () -> i64
      %6013 = func.call @cc_cons(%6012, %6011) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6013) : (i64) -> ()
      %6014 = func.call @stack_pop_pointer() : () -> i64
      %6015 = func.call @stack_pop_pointer() : () -> i64
      %6016 = func.call @cc_cons(%6015, %6014) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6016) : (i64) -> ()
      %6017 = func.call @stack_pop_pointer() : () -> i64
      %6018 = func.call @stack_pop_pointer() : () -> i64
      %6019 = func.call @cc_cons(%6018, %6017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6019) : (i64) -> ()
      %6020 = func.call @stack_pop_pointer() : () -> i64
      %6021 = func.call @stack_pop_pointer() : () -> i64
      %6022 = func.call @cc_cons(%6021, %6020) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6022) : (i64) -> ()
      %6023 = func.call @stack_pop_pointer() : () -> i64
      %6024 = func.call @stack_pop_pointer() : () -> i64
      %6025 = func.call @cc_cons(%6024, %6023) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6025) : (i64) -> ()
      %6026 = func.call @stack_pop_pointer() : () -> i64
      %6027 = func.call @stack_pop_pointer() : () -> i64
      %6028 = func.call @cc_cons(%6027, %6026) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6028) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6029 = func.call @stack_pop_pointer() : () -> i64
      %6030 = func.call @stack_pop_pointer() : () -> i64
      %6031 = func.call @cc_cons(%6030, %6029) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6031) : (i64) -> ()
      %6032 = func.call @stack_pop_pointer() : () -> i64
      %6033 = func.call @stack_pop_pointer() : () -> i64
      %6034 = func.call @cc_cons(%6033, %6032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6034) : (i64) -> ()
      %6035 = func.call @stack_pop_pointer() : () -> i64
      %6143 = arith.constant 122791386939417 : i64
      %6144 = arith.constant 0 : i64
      %6145 = func.call @cc_make_closure(%6143, %6144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6145) : (i64) -> ()
      %6146 = func.call @stack_pop_pointer() : () -> i64
      %6147 = llvm.mlir.addressof @str537 : !llvm.ptr
      %6148 = arith.constant 3 : i64
      %6149 = func.call @cc_make_string(%6147, %6148) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6149) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6150 = func.call @stack_pop_pointer() : () -> i64
      %6151 = func.call @stack_pop_pointer() : () -> i64
      %6152 = func.call @cc_cons(%6151, %6150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6152) : (i64) -> ()
      %6153 = func.call @stack_pop_pointer() : () -> i64
      %6154 = llvm.mlir.addressof @str538 : !llvm.ptr
      %6155 = arith.constant 11 : i64
      %6156 = func.call @cc_make_string(%6154, %6155) : (!llvm.ptr, i64) -> i64
      %6157 = llvm.mlir.addressof @str539 : !llvm.ptr
      %6158 = arith.constant 7 : i64
      %6159 = func.call @cc_make_string(%6157, %6158) : (!llvm.ptr, i64) -> i64
      %6160 = func.call @cc_intern(%6156, %6159) : (i64, i64) -> i64
      %6161 = func.call @cc_nil_value() : () -> i64
      %6162 = func.call @cc_cons(%6160, %6161) : (i64, i64) -> i64
      %6163 = func.call @cc_values_pack(%6162) : (i64) -> i64
      func.call @stack_push_pointer(%6160) : (i64) -> ()
      %6164 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6165 = func.call @stack_pop_pointer() : () -> i64
      %6166 = llvm.mlir.addressof @str540 : !llvm.ptr
      %6167 = arith.constant 4 : i64
      %6168 = func.call @cc_make_string(%6166, %6167) : (!llvm.ptr, i64) -> i64
      %6169 = llvm.mlir.addressof @str541 : !llvm.ptr
      %6170 = arith.constant 7 : i64
      %6171 = func.call @cc_make_string(%6169, %6170) : (!llvm.ptr, i64) -> i64
      %6172 = func.call @cc_intern(%6168, %6171) : (i64, i64) -> i64
      %6173 = func.call @cc_nil_value() : () -> i64
      %6174 = func.call @cc_cons(%6172, %6173) : (i64, i64) -> i64
      %6175 = func.call @cc_values_pack(%6174) : (i64) -> i64
      func.call @stack_push_pointer(%6172) : (i64) -> ()
      %6176 = func.call @stack_pop_pointer() : () -> i64
      %6177 = llvm.mlir.addressof @str542 : !llvm.ptr
      %6178 = arith.constant 7 : i64
      %6179 = func.call @cc_make_string(%6177, %6178) : (!llvm.ptr, i64) -> i64
      %6180 = llvm.mlir.addressof @str543 : !llvm.ptr
      %6181 = arith.constant 11 : i64
      %6182 = func.call @cc_make_string(%6180, %6181) : (!llvm.ptr, i64) -> i64
      %6183 = func.call @cc_intern(%6179, %6182) : (i64, i64) -> i64
      %6184 = func.call @cc_nil_value() : () -> i64
      %6185 = func.call @cc_cons(%6183, %6184) : (i64, i64) -> i64
      %6186 = func.call @cc_values_pack(%6185) : (i64) -> i64
      func.call @stack_push_pointer(%6183) : (i64) -> ()
      %6187 = func.call @stack_pop_pointer() : () -> i64
      %6188 = func.call @cc_nil_value() : () -> i64
      %6189 = func.call @cc_errorp(%5928) : (i64) -> i64
      %6190 = arith.cmpi ne, %6189, %6188 : i64
      %6191 = arith.cmpi eq, %6188, %6188 : i64
      %6192 = arith.andi %6190, %6191 : i1
      %6193 = scf.if %6192 -> (i64) {
        scf.yield %5928 : i64
      } else {
        scf.yield %6188 : i64
      }
      %6194 = func.call @cc_errorp(%6035) : (i64) -> i64
      %6195 = arith.cmpi ne, %6194, %6188 : i64
      %6196 = arith.cmpi eq, %6193, %6188 : i64
      %6197 = arith.andi %6195, %6196 : i1
      %6198 = scf.if %6197 -> (i64) {
        scf.yield %6035 : i64
      } else {
        scf.yield %6193 : i64
      }
      %6199 = func.call @cc_errorp(%6146) : (i64) -> i64
      %6200 = arith.cmpi ne, %6199, %6188 : i64
      %6201 = arith.cmpi eq, %6198, %6188 : i64
      %6202 = arith.andi %6200, %6201 : i1
      %6203 = scf.if %6202 -> (i64) {
        scf.yield %6146 : i64
      } else {
        scf.yield %6198 : i64
      }
      %6204 = func.call @cc_errorp(%6153) : (i64) -> i64
      %6205 = arith.cmpi ne, %6204, %6188 : i64
      %6206 = arith.cmpi eq, %6203, %6188 : i64
      %6207 = arith.andi %6205, %6206 : i1
      %6208 = scf.if %6207 -> (i64) {
        scf.yield %6153 : i64
      } else {
        scf.yield %6203 : i64
      }
      %6209 = func.call @cc_errorp(%6164) : (i64) -> i64
      %6210 = arith.cmpi ne, %6209, %6188 : i64
      %6211 = arith.cmpi eq, %6208, %6188 : i64
      %6212 = arith.andi %6210, %6211 : i1
      %6213 = scf.if %6212 -> (i64) {
        scf.yield %6164 : i64
      } else {
        scf.yield %6208 : i64
      }
      %6214 = func.call @cc_errorp(%6165) : (i64) -> i64
      %6215 = arith.cmpi ne, %6214, %6188 : i64
      %6216 = arith.cmpi eq, %6213, %6188 : i64
      %6217 = arith.andi %6215, %6216 : i1
      %6218 = scf.if %6217 -> (i64) {
        scf.yield %6165 : i64
      } else {
        scf.yield %6213 : i64
      }
      %6219 = func.call @cc_errorp(%6176) : (i64) -> i64
      %6220 = arith.cmpi ne, %6219, %6188 : i64
      %6221 = arith.cmpi eq, %6218, %6188 : i64
      %6222 = arith.andi %6220, %6221 : i1
      %6223 = scf.if %6222 -> (i64) {
        scf.yield %6176 : i64
      } else {
        scf.yield %6218 : i64
      }
      %6224 = func.call @cc_errorp(%6187) : (i64) -> i64
      %6225 = arith.cmpi ne, %6224, %6188 : i64
      %6226 = arith.cmpi eq, %6223, %6188 : i64
      %6227 = arith.andi %6225, %6226 : i1
      %6228 = scf.if %6227 -> (i64) {
        scf.yield %6187 : i64
      } else {
        scf.yield %6223 : i64
      }
      %6229 = arith.cmpi ne, %6228, %6188 : i64
      scf.if %6229 {
        func.call @stack_push_pointer(%6228) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5928) : (i64) -> ()
        func.call @stack_push_pointer(%6035) : (i64) -> ()
        func.call @stack_push_pointer(%6146) : (i64) -> ()
        func.call @stack_push_pointer(%6153) : (i64) -> ()
        func.call @stack_push_pointer(%6164) : (i64) -> ()
        func.call @stack_push_pointer(%6165) : (i64) -> ()
        func.call @stack_push_pointer(%6176) : (i64) -> ()
        func.call @stack_push_pointer(%6187) : (i64) -> ()
        %6230 = llvm.mlir.addressof @str544 : !llvm.ptr
        %6231 = func.call @cc_make_function_ref_const(%6230) : (!llvm.ptr) -> i64
        %6232 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6231, %6232) : (i64, i64) -> ()
      }
      %6233 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6233 : i64
    }
    %6234 = func.call @cc_nil_value() : () -> i64
    %6235 = func.call @cc_errorp(%5919) : (i64) -> i64
    %6236 = arith.cmpi ne, %6235, %6234 : i64
    %6237 = scf.if %6236 -> (i64) {
      scf.yield %5919 : i64
    } else {
      %6238 = llvm.mlir.addressof @str545 : !llvm.ptr
      %6239 = arith.constant 27 : i64
      %6240 = func.call @cc_make_string(%6238, %6239) : (!llvm.ptr, i64) -> i64
      %6241 = func.call @cc_nil_value() : () -> i64
      %6242 = func.call @cc_intern(%6240, %6241) : (i64, i64) -> i64
      %6243 = func.call @cc_nil_value() : () -> i64
      %6244 = func.call @cc_cons(%6242, %6243) : (i64, i64) -> i64
      %6245 = func.call @cc_values_pack(%6244) : (i64) -> i64
      func.call @stack_push_pointer(%6242) : (i64) -> ()
      %6246 = func.call @stack_pop_pointer() : () -> i64
      %6247 = llvm.mlir.addressof @str546 : !llvm.ptr
      %6248 = arith.constant 26 : i64
      %6249 = func.call @cc_make_string(%6247, %6248) : (!llvm.ptr, i64) -> i64
      %6250 = llvm.mlir.addressof @str547 : !llvm.ptr
      %6251 = arith.constant 4 : i64
      %6252 = func.call @cc_make_string(%6250, %6251) : (!llvm.ptr, i64) -> i64
      %6253 = func.call @cc_intern(%6249, %6252) : (i64, i64) -> i64
      %6254 = func.call @cc_nil_value() : () -> i64
      %6255 = func.call @cc_cons(%6253, %6254) : (i64, i64) -> i64
      %6256 = func.call @cc_values_pack(%6255) : (i64) -> i64
      func.call @stack_push_pointer(%6253) : (i64) -> ()
      %6257 = llvm.mlir.addressof @str548 : !llvm.ptr
      %6258 = arith.constant 10 : i64
      %6259 = func.call @cc_make_string(%6257, %6258) : (!llvm.ptr, i64) -> i64
      %6260 = llvm.mlir.addressof @str549 : !llvm.ptr
      %6261 = arith.constant 11 : i64
      %6262 = func.call @cc_make_string(%6260, %6261) : (!llvm.ptr, i64) -> i64
      %6263 = func.call @cc_intern(%6259, %6262) : (i64, i64) -> i64
      %6264 = func.call @cc_nil_value() : () -> i64
      %6265 = func.call @cc_cons(%6263, %6264) : (i64, i64) -> i64
      %6266 = func.call @cc_values_pack(%6265) : (i64) -> i64
      func.call @stack_push_pointer(%6263) : (i64) -> ()
      %6267 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6267) : (i64) -> ()
      %6268 = llvm.mlir.addressof @str550 : !llvm.ptr
      %6269 = arith.constant 12 : i64
      %6270 = func.call @cc_make_string(%6268, %6269) : (!llvm.ptr, i64) -> i64
      %6271 = llvm.mlir.addressof @str551 : !llvm.ptr
      %6272 = arith.constant 7 : i64
      %6273 = func.call @cc_make_string(%6271, %6272) : (!llvm.ptr, i64) -> i64
      %6274 = func.call @cc_intern(%6270, %6273) : (i64, i64) -> i64
      %6275 = func.call @cc_nil_value() : () -> i64
      %6276 = func.call @cc_cons(%6274, %6275) : (i64, i64) -> i64
      %6277 = func.call @cc_values_pack(%6276) : (i64) -> i64
      func.call @stack_push_pointer(%6274) : (i64) -> ()
      %6278 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6278) : (i64) -> ()
      %6279 = llvm.mlir.addressof @str552 : !llvm.ptr
      %6280 = arith.constant 9 : i64
      %6281 = func.call @cc_make_string(%6279, %6280) : (!llvm.ptr, i64) -> i64
      %6282 = llvm.mlir.addressof @str553 : !llvm.ptr
      %6283 = arith.constant 11 : i64
      %6284 = func.call @cc_make_string(%6282, %6283) : (!llvm.ptr, i64) -> i64
      %6285 = func.call @cc_intern(%6281, %6284) : (i64, i64) -> i64
      %6286 = func.call @cc_nil_value() : () -> i64
      %6287 = func.call @cc_cons(%6285, %6286) : (i64, i64) -> i64
      %6288 = func.call @cc_values_pack(%6287) : (i64) -> i64
      func.call @stack_push_pointer(%6285) : (i64) -> ()
      %6289 = func.call @stack_pop_pointer() : () -> i64
      %6290 = func.call @stack_pop_pointer() : () -> i64
      %6291 = func.call @cc_cons(%6289, %6290) : (i64, i64) -> i64
      %6292 = llvm.mlir.addressof @str554 : !llvm.ptr
      %6293 = arith.constant 5 : i64
      %6294 = func.call @cc_make_string(%6292, %6293) : (!llvm.ptr, i64) -> i64
      %6295 = func.call @cc_nil_value() : () -> i64
      %6296 = func.call @cc_intern(%6294, %6295) : (i64, i64) -> i64
      %6297 = func.call @cc_nil_value() : () -> i64
      %6298 = func.call @cc_cons(%6296, %6297) : (i64, i64) -> i64
      %6299 = func.call @cc_values_pack(%6298) : (i64) -> i64
      %6300 = func.call @cc_cons(%6296, %6291) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6300) : (i64) -> ()
      %6301 = llvm.mlir.addressof @str555 : !llvm.ptr
      %6302 = arith.constant 10 : i64
      %6303 = func.call @cc_make_string(%6301, %6302) : (!llvm.ptr, i64) -> i64
      %6304 = llvm.mlir.addressof @str556 : !llvm.ptr
      %6305 = arith.constant 7 : i64
      %6306 = func.call @cc_make_string(%6304, %6305) : (!llvm.ptr, i64) -> i64
      %6307 = func.call @cc_intern(%6303, %6306) : (i64, i64) -> i64
      %6308 = func.call @cc_nil_value() : () -> i64
      %6309 = func.call @cc_cons(%6307, %6308) : (i64, i64) -> i64
      %6310 = func.call @cc_values_pack(%6309) : (i64) -> i64
      func.call @stack_push_pointer(%6307) : (i64) -> ()
      %6311 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%6311) : (i64) -> ()
      %6312 = llvm.mlir.addressof @str557 : !llvm.ptr
      %6313 = arith.constant 15 : i64
      %6314 = func.call @cc_make_string(%6312, %6313) : (!llvm.ptr, i64) -> i64
      %6315 = llvm.mlir.addressof @str558 : !llvm.ptr
      %6316 = arith.constant 7 : i64
      %6317 = func.call @cc_make_string(%6315, %6316) : (!llvm.ptr, i64) -> i64
      %6318 = func.call @cc_intern(%6314, %6317) : (i64, i64) -> i64
      %6319 = func.call @cc_nil_value() : () -> i64
      %6320 = func.call @cc_cons(%6318, %6319) : (i64, i64) -> i64
      %6321 = func.call @cc_values_pack(%6320) : (i64) -> i64
      func.call @stack_push_pointer(%6318) : (i64) -> ()
      %6322 = arith.constant 67 : i64
      %6323 = func.call @cc_box_character(%6322) : (i64) -> i64
      func.call @stack_push_pointer(%6323) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6324 = func.call @stack_pop_pointer() : () -> i64
      %6325 = func.call @stack_pop_pointer() : () -> i64
      %6326 = func.call @cc_cons(%6325, %6324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6326) : (i64) -> ()
      %6327 = func.call @stack_pop_pointer() : () -> i64
      %6328 = func.call @stack_pop_pointer() : () -> i64
      %6329 = func.call @cc_cons(%6328, %6327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6329) : (i64) -> ()
      %6330 = func.call @stack_pop_pointer() : () -> i64
      %6331 = func.call @stack_pop_pointer() : () -> i64
      %6332 = func.call @cc_cons(%6331, %6330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6332) : (i64) -> ()
      %6333 = func.call @stack_pop_pointer() : () -> i64
      %6334 = func.call @stack_pop_pointer() : () -> i64
      %6335 = func.call @cc_cons(%6334, %6333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6335) : (i64) -> ()
      %6336 = func.call @stack_pop_pointer() : () -> i64
      %6337 = func.call @stack_pop_pointer() : () -> i64
      %6338 = func.call @cc_cons(%6337, %6336) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6338) : (i64) -> ()
      %6339 = func.call @stack_pop_pointer() : () -> i64
      %6340 = func.call @stack_pop_pointer() : () -> i64
      %6341 = func.call @cc_cons(%6340, %6339) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6341) : (i64) -> ()
      %6342 = func.call @stack_pop_pointer() : () -> i64
      %6343 = func.call @stack_pop_pointer() : () -> i64
      %6344 = func.call @cc_cons(%6343, %6342) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6344) : (i64) -> ()
      %6345 = func.call @stack_pop_pointer() : () -> i64
      %6346 = func.call @stack_pop_pointer() : () -> i64
      %6347 = func.call @cc_cons(%6346, %6345) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6347) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6348 = func.call @stack_pop_pointer() : () -> i64
      %6349 = func.call @stack_pop_pointer() : () -> i64
      %6350 = func.call @cc_cons(%6349, %6348) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6350) : (i64) -> ()
      %6351 = func.call @stack_pop_pointer() : () -> i64
      %6352 = func.call @stack_pop_pointer() : () -> i64
      %6353 = func.call @cc_cons(%6352, %6351) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6353) : (i64) -> ()
      %6354 = func.call @stack_pop_pointer() : () -> i64
      %6463 = arith.constant 122791386939418 : i64
      %6464 = arith.constant 0 : i64
      %6465 = func.call @cc_make_closure(%6463, %6464) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6465) : (i64) -> ()
      %6466 = func.call @stack_pop_pointer() : () -> i64
      %6467 = llvm.mlir.addressof @str569 : !llvm.ptr
      %6468 = arith.constant 3 : i64
      %6469 = func.call @cc_make_string(%6467, %6468) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6469) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6470 = func.call @stack_pop_pointer() : () -> i64
      %6471 = func.call @stack_pop_pointer() : () -> i64
      %6472 = func.call @cc_cons(%6471, %6470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6472) : (i64) -> ()
      %6473 = func.call @stack_pop_pointer() : () -> i64
      %6474 = llvm.mlir.addressof @str570 : !llvm.ptr
      %6475 = arith.constant 11 : i64
      %6476 = func.call @cc_make_string(%6474, %6475) : (!llvm.ptr, i64) -> i64
      %6477 = llvm.mlir.addressof @str571 : !llvm.ptr
      %6478 = arith.constant 7 : i64
      %6479 = func.call @cc_make_string(%6477, %6478) : (!llvm.ptr, i64) -> i64
      %6480 = func.call @cc_intern(%6476, %6479) : (i64, i64) -> i64
      %6481 = func.call @cc_nil_value() : () -> i64
      %6482 = func.call @cc_cons(%6480, %6481) : (i64, i64) -> i64
      %6483 = func.call @cc_values_pack(%6482) : (i64) -> i64
      func.call @stack_push_pointer(%6480) : (i64) -> ()
      %6484 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6485 = func.call @stack_pop_pointer() : () -> i64
      %6486 = llvm.mlir.addressof @str572 : !llvm.ptr
      %6487 = arith.constant 4 : i64
      %6488 = func.call @cc_make_string(%6486, %6487) : (!llvm.ptr, i64) -> i64
      %6489 = llvm.mlir.addressof @str573 : !llvm.ptr
      %6490 = arith.constant 7 : i64
      %6491 = func.call @cc_make_string(%6489, %6490) : (!llvm.ptr, i64) -> i64
      %6492 = func.call @cc_intern(%6488, %6491) : (i64, i64) -> i64
      %6493 = func.call @cc_nil_value() : () -> i64
      %6494 = func.call @cc_cons(%6492, %6493) : (i64, i64) -> i64
      %6495 = func.call @cc_values_pack(%6494) : (i64) -> i64
      func.call @stack_push_pointer(%6492) : (i64) -> ()
      %6496 = func.call @stack_pop_pointer() : () -> i64
      %6497 = llvm.mlir.addressof @str574 : !llvm.ptr
      %6498 = arith.constant 7 : i64
      %6499 = func.call @cc_make_string(%6497, %6498) : (!llvm.ptr, i64) -> i64
      %6500 = llvm.mlir.addressof @str575 : !llvm.ptr
      %6501 = arith.constant 11 : i64
      %6502 = func.call @cc_make_string(%6500, %6501) : (!llvm.ptr, i64) -> i64
      %6503 = func.call @cc_intern(%6499, %6502) : (i64, i64) -> i64
      %6504 = func.call @cc_nil_value() : () -> i64
      %6505 = func.call @cc_cons(%6503, %6504) : (i64, i64) -> i64
      %6506 = func.call @cc_values_pack(%6505) : (i64) -> i64
      func.call @stack_push_pointer(%6503) : (i64) -> ()
      %6507 = func.call @stack_pop_pointer() : () -> i64
      %6508 = func.call @cc_nil_value() : () -> i64
      %6509 = func.call @cc_errorp(%6246) : (i64) -> i64
      %6510 = arith.cmpi ne, %6509, %6508 : i64
      %6511 = arith.cmpi eq, %6508, %6508 : i64
      %6512 = arith.andi %6510, %6511 : i1
      %6513 = scf.if %6512 -> (i64) {
        scf.yield %6246 : i64
      } else {
        scf.yield %6508 : i64
      }
      %6514 = func.call @cc_errorp(%6354) : (i64) -> i64
      %6515 = arith.cmpi ne, %6514, %6508 : i64
      %6516 = arith.cmpi eq, %6513, %6508 : i64
      %6517 = arith.andi %6515, %6516 : i1
      %6518 = scf.if %6517 -> (i64) {
        scf.yield %6354 : i64
      } else {
        scf.yield %6513 : i64
      }
      %6519 = func.call @cc_errorp(%6466) : (i64) -> i64
      %6520 = arith.cmpi ne, %6519, %6508 : i64
      %6521 = arith.cmpi eq, %6518, %6508 : i64
      %6522 = arith.andi %6520, %6521 : i1
      %6523 = scf.if %6522 -> (i64) {
        scf.yield %6466 : i64
      } else {
        scf.yield %6518 : i64
      }
      %6524 = func.call @cc_errorp(%6473) : (i64) -> i64
      %6525 = arith.cmpi ne, %6524, %6508 : i64
      %6526 = arith.cmpi eq, %6523, %6508 : i64
      %6527 = arith.andi %6525, %6526 : i1
      %6528 = scf.if %6527 -> (i64) {
        scf.yield %6473 : i64
      } else {
        scf.yield %6523 : i64
      }
      %6529 = func.call @cc_errorp(%6484) : (i64) -> i64
      %6530 = arith.cmpi ne, %6529, %6508 : i64
      %6531 = arith.cmpi eq, %6528, %6508 : i64
      %6532 = arith.andi %6530, %6531 : i1
      %6533 = scf.if %6532 -> (i64) {
        scf.yield %6484 : i64
      } else {
        scf.yield %6528 : i64
      }
      %6534 = func.call @cc_errorp(%6485) : (i64) -> i64
      %6535 = arith.cmpi ne, %6534, %6508 : i64
      %6536 = arith.cmpi eq, %6533, %6508 : i64
      %6537 = arith.andi %6535, %6536 : i1
      %6538 = scf.if %6537 -> (i64) {
        scf.yield %6485 : i64
      } else {
        scf.yield %6533 : i64
      }
      %6539 = func.call @cc_errorp(%6496) : (i64) -> i64
      %6540 = arith.cmpi ne, %6539, %6508 : i64
      %6541 = arith.cmpi eq, %6538, %6508 : i64
      %6542 = arith.andi %6540, %6541 : i1
      %6543 = scf.if %6542 -> (i64) {
        scf.yield %6496 : i64
      } else {
        scf.yield %6538 : i64
      }
      %6544 = func.call @cc_errorp(%6507) : (i64) -> i64
      %6545 = arith.cmpi ne, %6544, %6508 : i64
      %6546 = arith.cmpi eq, %6543, %6508 : i64
      %6547 = arith.andi %6545, %6546 : i1
      %6548 = scf.if %6547 -> (i64) {
        scf.yield %6507 : i64
      } else {
        scf.yield %6543 : i64
      }
      %6549 = arith.cmpi ne, %6548, %6508 : i64
      scf.if %6549 {
        func.call @stack_push_pointer(%6548) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6246) : (i64) -> ()
        func.call @stack_push_pointer(%6354) : (i64) -> ()
        func.call @stack_push_pointer(%6466) : (i64) -> ()
        func.call @stack_push_pointer(%6473) : (i64) -> ()
        func.call @stack_push_pointer(%6484) : (i64) -> ()
        func.call @stack_push_pointer(%6485) : (i64) -> ()
        func.call @stack_push_pointer(%6496) : (i64) -> ()
        func.call @stack_push_pointer(%6507) : (i64) -> ()
        %6550 = llvm.mlir.addressof @str576 : !llvm.ptr
        %6551 = func.call @cc_make_function_ref_const(%6550) : (!llvm.ptr) -> i64
        %6552 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6551, %6552) : (i64, i64) -> ()
      }
      %6553 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6553 : i64
    }
    %6554 = func.call @cc_nil_value() : () -> i64
    %6555 = func.call @cc_errorp(%6237) : (i64) -> i64
    %6556 = arith.cmpi ne, %6555, %6554 : i64
    %6557 = scf.if %6556 -> (i64) {
      scf.yield %6237 : i64
    } else {
      %6558 = llvm.mlir.addressof @str577 : !llvm.ptr
      %6559 = arith.constant 27 : i64
      %6560 = func.call @cc_make_string(%6558, %6559) : (!llvm.ptr, i64) -> i64
      %6561 = func.call @cc_nil_value() : () -> i64
      %6562 = func.call @cc_intern(%6560, %6561) : (i64, i64) -> i64
      %6563 = func.call @cc_nil_value() : () -> i64
      %6564 = func.call @cc_cons(%6562, %6563) : (i64, i64) -> i64
      %6565 = func.call @cc_values_pack(%6564) : (i64) -> i64
      func.call @stack_push_pointer(%6562) : (i64) -> ()
      %6566 = func.call @stack_pop_pointer() : () -> i64
      %6567 = llvm.mlir.addressof @str578 : !llvm.ptr
      %6568 = arith.constant 26 : i64
      %6569 = func.call @cc_make_string(%6567, %6568) : (!llvm.ptr, i64) -> i64
      %6570 = llvm.mlir.addressof @str579 : !llvm.ptr
      %6571 = arith.constant 4 : i64
      %6572 = func.call @cc_make_string(%6570, %6571) : (!llvm.ptr, i64) -> i64
      %6573 = func.call @cc_intern(%6569, %6572) : (i64, i64) -> i64
      %6574 = func.call @cc_nil_value() : () -> i64
      %6575 = func.call @cc_cons(%6573, %6574) : (i64, i64) -> i64
      %6576 = func.call @cc_values_pack(%6575) : (i64) -> i64
      func.call @stack_push_pointer(%6573) : (i64) -> ()
      %6577 = llvm.mlir.addressof @str580 : !llvm.ptr
      %6578 = arith.constant 3 : i64
      %6579 = func.call @cc_make_string(%6577, %6578) : (!llvm.ptr, i64) -> i64
      %6580 = llvm.mlir.addressof @str581 : !llvm.ptr
      %6581 = arith.constant 7 : i64
      %6582 = func.call @cc_make_string(%6580, %6581) : (!llvm.ptr, i64) -> i64
      %6583 = func.call @cc_intern(%6579, %6582) : (i64, i64) -> i64
      %6584 = func.call @cc_nil_value() : () -> i64
      %6585 = func.call @cc_cons(%6583, %6584) : (i64, i64) -> i64
      %6586 = func.call @cc_values_pack(%6585) : (i64) -> i64
      func.call @stack_push_pointer(%6583) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6587 = func.call @stack_pop_pointer() : () -> i64
      %6588 = func.call @stack_pop_pointer() : () -> i64
      %6589 = func.call @cc_cons(%6588, %6587) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6589) : (i64) -> ()
      %6590 = func.call @stack_pop_pointer() : () -> i64
      %6591 = func.call @stack_pop_pointer() : () -> i64
      %6592 = func.call @cc_cons(%6591, %6590) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6592) : (i64) -> ()
      %6593 = func.call @stack_pop_pointer() : () -> i64
      %6621 = arith.constant 122791386939419 : i64
      %6622 = arith.constant 0 : i64
      %6623 = func.call @cc_make_closure(%6621, %6622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6623) : (i64) -> ()
      %6624 = func.call @stack_pop_pointer() : () -> i64
      %6625 = llvm.mlir.addressof @str585 : !llvm.ptr
      %6626 = arith.constant 3 : i64
      %6627 = func.call @cc_make_string(%6625, %6626) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6627) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6628 = func.call @stack_pop_pointer() : () -> i64
      %6629 = func.call @stack_pop_pointer() : () -> i64
      %6630 = func.call @cc_cons(%6629, %6628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6630) : (i64) -> ()
      %6631 = func.call @stack_pop_pointer() : () -> i64
      %6632 = llvm.mlir.addressof @str586 : !llvm.ptr
      %6633 = arith.constant 11 : i64
      %6634 = func.call @cc_make_string(%6632, %6633) : (!llvm.ptr, i64) -> i64
      %6635 = llvm.mlir.addressof @str587 : !llvm.ptr
      %6636 = arith.constant 7 : i64
      %6637 = func.call @cc_make_string(%6635, %6636) : (!llvm.ptr, i64) -> i64
      %6638 = func.call @cc_intern(%6634, %6637) : (i64, i64) -> i64
      %6639 = func.call @cc_nil_value() : () -> i64
      %6640 = func.call @cc_cons(%6638, %6639) : (i64, i64) -> i64
      %6641 = func.call @cc_values_pack(%6640) : (i64) -> i64
      func.call @stack_push_pointer(%6638) : (i64) -> ()
      %6642 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6643 = func.call @stack_pop_pointer() : () -> i64
      %6644 = llvm.mlir.addressof @str588 : !llvm.ptr
      %6645 = arith.constant 4 : i64
      %6646 = func.call @cc_make_string(%6644, %6645) : (!llvm.ptr, i64) -> i64
      %6647 = llvm.mlir.addressof @str589 : !llvm.ptr
      %6648 = arith.constant 7 : i64
      %6649 = func.call @cc_make_string(%6647, %6648) : (!llvm.ptr, i64) -> i64
      %6650 = func.call @cc_intern(%6646, %6649) : (i64, i64) -> i64
      %6651 = func.call @cc_nil_value() : () -> i64
      %6652 = func.call @cc_cons(%6650, %6651) : (i64, i64) -> i64
      %6653 = func.call @cc_values_pack(%6652) : (i64) -> i64
      func.call @stack_push_pointer(%6650) : (i64) -> ()
      %6654 = func.call @stack_pop_pointer() : () -> i64
      %6655 = llvm.mlir.addressof @str590 : !llvm.ptr
      %6656 = arith.constant 7 : i64
      %6657 = func.call @cc_make_string(%6655, %6656) : (!llvm.ptr, i64) -> i64
      %6658 = llvm.mlir.addressof @str591 : !llvm.ptr
      %6659 = arith.constant 11 : i64
      %6660 = func.call @cc_make_string(%6658, %6659) : (!llvm.ptr, i64) -> i64
      %6661 = func.call @cc_intern(%6657, %6660) : (i64, i64) -> i64
      %6662 = func.call @cc_nil_value() : () -> i64
      %6663 = func.call @cc_cons(%6661, %6662) : (i64, i64) -> i64
      %6664 = func.call @cc_values_pack(%6663) : (i64) -> i64
      func.call @stack_push_pointer(%6661) : (i64) -> ()
      %6665 = func.call @stack_pop_pointer() : () -> i64
      %6666 = func.call @cc_nil_value() : () -> i64
      %6667 = func.call @cc_errorp(%6566) : (i64) -> i64
      %6668 = arith.cmpi ne, %6667, %6666 : i64
      %6669 = arith.cmpi eq, %6666, %6666 : i64
      %6670 = arith.andi %6668, %6669 : i1
      %6671 = scf.if %6670 -> (i64) {
        scf.yield %6566 : i64
      } else {
        scf.yield %6666 : i64
      }
      %6672 = func.call @cc_errorp(%6593) : (i64) -> i64
      %6673 = arith.cmpi ne, %6672, %6666 : i64
      %6674 = arith.cmpi eq, %6671, %6666 : i64
      %6675 = arith.andi %6673, %6674 : i1
      %6676 = scf.if %6675 -> (i64) {
        scf.yield %6593 : i64
      } else {
        scf.yield %6671 : i64
      }
      %6677 = func.call @cc_errorp(%6624) : (i64) -> i64
      %6678 = arith.cmpi ne, %6677, %6666 : i64
      %6679 = arith.cmpi eq, %6676, %6666 : i64
      %6680 = arith.andi %6678, %6679 : i1
      %6681 = scf.if %6680 -> (i64) {
        scf.yield %6624 : i64
      } else {
        scf.yield %6676 : i64
      }
      %6682 = func.call @cc_errorp(%6631) : (i64) -> i64
      %6683 = arith.cmpi ne, %6682, %6666 : i64
      %6684 = arith.cmpi eq, %6681, %6666 : i64
      %6685 = arith.andi %6683, %6684 : i1
      %6686 = scf.if %6685 -> (i64) {
        scf.yield %6631 : i64
      } else {
        scf.yield %6681 : i64
      }
      %6687 = func.call @cc_errorp(%6642) : (i64) -> i64
      %6688 = arith.cmpi ne, %6687, %6666 : i64
      %6689 = arith.cmpi eq, %6686, %6666 : i64
      %6690 = arith.andi %6688, %6689 : i1
      %6691 = scf.if %6690 -> (i64) {
        scf.yield %6642 : i64
      } else {
        scf.yield %6686 : i64
      }
      %6692 = func.call @cc_errorp(%6643) : (i64) -> i64
      %6693 = arith.cmpi ne, %6692, %6666 : i64
      %6694 = arith.cmpi eq, %6691, %6666 : i64
      %6695 = arith.andi %6693, %6694 : i1
      %6696 = scf.if %6695 -> (i64) {
        scf.yield %6643 : i64
      } else {
        scf.yield %6691 : i64
      }
      %6697 = func.call @cc_errorp(%6654) : (i64) -> i64
      %6698 = arith.cmpi ne, %6697, %6666 : i64
      %6699 = arith.cmpi eq, %6696, %6666 : i64
      %6700 = arith.andi %6698, %6699 : i1
      %6701 = scf.if %6700 -> (i64) {
        scf.yield %6654 : i64
      } else {
        scf.yield %6696 : i64
      }
      %6702 = func.call @cc_errorp(%6665) : (i64) -> i64
      %6703 = arith.cmpi ne, %6702, %6666 : i64
      %6704 = arith.cmpi eq, %6701, %6666 : i64
      %6705 = arith.andi %6703, %6704 : i1
      %6706 = scf.if %6705 -> (i64) {
        scf.yield %6665 : i64
      } else {
        scf.yield %6701 : i64
      }
      %6707 = arith.cmpi ne, %6706, %6666 : i64
      scf.if %6707 {
        func.call @stack_push_pointer(%6706) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6566) : (i64) -> ()
        func.call @stack_push_pointer(%6593) : (i64) -> ()
        func.call @stack_push_pointer(%6624) : (i64) -> ()
        func.call @stack_push_pointer(%6631) : (i64) -> ()
        func.call @stack_push_pointer(%6642) : (i64) -> ()
        func.call @stack_push_pointer(%6643) : (i64) -> ()
        func.call @stack_push_pointer(%6654) : (i64) -> ()
        func.call @stack_push_pointer(%6665) : (i64) -> ()
        %6708 = llvm.mlir.addressof @str592 : !llvm.ptr
        %6709 = func.call @cc_make_function_ref_const(%6708) : (!llvm.ptr) -> i64
        %6710 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6709, %6710) : (i64, i64) -> ()
      }
      %6711 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6711 : i64
    }
    %6712 = func.call @cc_nil_value() : () -> i64
    %6713 = func.call @cc_errorp(%6557) : (i64) -> i64
    %6714 = arith.cmpi ne, %6713, %6712 : i64
    %6715 = scf.if %6714 -> (i64) {
      scf.yield %6557 : i64
    } else {
      %6716 = llvm.mlir.addressof @str593 : !llvm.ptr
      %6717 = arith.constant 27 : i64
      %6718 = func.call @cc_make_string(%6716, %6717) : (!llvm.ptr, i64) -> i64
      %6719 = func.call @cc_nil_value() : () -> i64
      %6720 = func.call @cc_intern(%6718, %6719) : (i64, i64) -> i64
      %6721 = func.call @cc_nil_value() : () -> i64
      %6722 = func.call @cc_cons(%6720, %6721) : (i64, i64) -> i64
      %6723 = func.call @cc_values_pack(%6722) : (i64) -> i64
      func.call @stack_push_pointer(%6720) : (i64) -> ()
      %6724 = func.call @stack_pop_pointer() : () -> i64
      %6725 = llvm.mlir.addressof @str594 : !llvm.ptr
      %6726 = arith.constant 26 : i64
      %6727 = func.call @cc_make_string(%6725, %6726) : (!llvm.ptr, i64) -> i64
      %6728 = llvm.mlir.addressof @str595 : !llvm.ptr
      %6729 = arith.constant 4 : i64
      %6730 = func.call @cc_make_string(%6728, %6729) : (!llvm.ptr, i64) -> i64
      %6731 = func.call @cc_intern(%6727, %6730) : (i64, i64) -> i64
      %6732 = func.call @cc_nil_value() : () -> i64
      %6733 = func.call @cc_cons(%6731, %6732) : (i64, i64) -> i64
      %6734 = func.call @cc_values_pack(%6733) : (i64) -> i64
      func.call @stack_push_pointer(%6731) : (i64) -> ()
      %6735 = arith.constant 67 : i64
      %6736 = func.call @cc_box_character(%6735) : (i64) -> i64
      func.call @stack_push_pointer(%6736) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6737 = func.call @stack_pop_pointer() : () -> i64
      %6738 = func.call @stack_pop_pointer() : () -> i64
      %6739 = func.call @cc_cons(%6738, %6737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6739) : (i64) -> ()
      %6740 = func.call @stack_pop_pointer() : () -> i64
      %6741 = func.call @stack_pop_pointer() : () -> i64
      %6742 = func.call @cc_cons(%6741, %6740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6742) : (i64) -> ()
      %6743 = func.call @stack_pop_pointer() : () -> i64
      %6763 = arith.constant 122791386939420 : i64
      %6764 = arith.constant 0 : i64
      %6765 = func.call @cc_make_closure(%6763, %6764) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6765) : (i64) -> ()
      %6766 = func.call @stack_pop_pointer() : () -> i64
      %6767 = llvm.mlir.addressof @str597 : !llvm.ptr
      %6768 = arith.constant 1 : i64
      %6769 = func.call @cc_make_string(%6767, %6768) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%6769) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6770 = func.call @stack_pop_pointer() : () -> i64
      %6771 = func.call @stack_pop_pointer() : () -> i64
      %6772 = func.call @cc_cons(%6771, %6770) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6772) : (i64) -> ()
      %6773 = func.call @stack_pop_pointer() : () -> i64
      %6774 = llvm.mlir.addressof @str598 : !llvm.ptr
      %6775 = arith.constant 11 : i64
      %6776 = func.call @cc_make_string(%6774, %6775) : (!llvm.ptr, i64) -> i64
      %6777 = llvm.mlir.addressof @str599 : !llvm.ptr
      %6778 = arith.constant 7 : i64
      %6779 = func.call @cc_make_string(%6777, %6778) : (!llvm.ptr, i64) -> i64
      %6780 = func.call @cc_intern(%6776, %6779) : (i64, i64) -> i64
      %6781 = func.call @cc_nil_value() : () -> i64
      %6782 = func.call @cc_cons(%6780, %6781) : (i64, i64) -> i64
      %6783 = func.call @cc_values_pack(%6782) : (i64) -> i64
      func.call @stack_push_pointer(%6780) : (i64) -> ()
      %6784 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6785 = func.call @stack_pop_pointer() : () -> i64
      %6786 = llvm.mlir.addressof @str600 : !llvm.ptr
      %6787 = arith.constant 4 : i64
      %6788 = func.call @cc_make_string(%6786, %6787) : (!llvm.ptr, i64) -> i64
      %6789 = llvm.mlir.addressof @str601 : !llvm.ptr
      %6790 = arith.constant 7 : i64
      %6791 = func.call @cc_make_string(%6789, %6790) : (!llvm.ptr, i64) -> i64
      %6792 = func.call @cc_intern(%6788, %6791) : (i64, i64) -> i64
      %6793 = func.call @cc_nil_value() : () -> i64
      %6794 = func.call @cc_cons(%6792, %6793) : (i64, i64) -> i64
      %6795 = func.call @cc_values_pack(%6794) : (i64) -> i64
      func.call @stack_push_pointer(%6792) : (i64) -> ()
      %6796 = func.call @stack_pop_pointer() : () -> i64
      %6797 = llvm.mlir.addressof @str602 : !llvm.ptr
      %6798 = arith.constant 7 : i64
      %6799 = func.call @cc_make_string(%6797, %6798) : (!llvm.ptr, i64) -> i64
      %6800 = llvm.mlir.addressof @str603 : !llvm.ptr
      %6801 = arith.constant 11 : i64
      %6802 = func.call @cc_make_string(%6800, %6801) : (!llvm.ptr, i64) -> i64
      %6803 = func.call @cc_intern(%6799, %6802) : (i64, i64) -> i64
      %6804 = func.call @cc_nil_value() : () -> i64
      %6805 = func.call @cc_cons(%6803, %6804) : (i64, i64) -> i64
      %6806 = func.call @cc_values_pack(%6805) : (i64) -> i64
      func.call @stack_push_pointer(%6803) : (i64) -> ()
      %6807 = func.call @stack_pop_pointer() : () -> i64
      %6808 = func.call @cc_nil_value() : () -> i64
      %6809 = func.call @cc_errorp(%6724) : (i64) -> i64
      %6810 = arith.cmpi ne, %6809, %6808 : i64
      %6811 = arith.cmpi eq, %6808, %6808 : i64
      %6812 = arith.andi %6810, %6811 : i1
      %6813 = scf.if %6812 -> (i64) {
        scf.yield %6724 : i64
      } else {
        scf.yield %6808 : i64
      }
      %6814 = func.call @cc_errorp(%6743) : (i64) -> i64
      %6815 = arith.cmpi ne, %6814, %6808 : i64
      %6816 = arith.cmpi eq, %6813, %6808 : i64
      %6817 = arith.andi %6815, %6816 : i1
      %6818 = scf.if %6817 -> (i64) {
        scf.yield %6743 : i64
      } else {
        scf.yield %6813 : i64
      }
      %6819 = func.call @cc_errorp(%6766) : (i64) -> i64
      %6820 = arith.cmpi ne, %6819, %6808 : i64
      %6821 = arith.cmpi eq, %6818, %6808 : i64
      %6822 = arith.andi %6820, %6821 : i1
      %6823 = scf.if %6822 -> (i64) {
        scf.yield %6766 : i64
      } else {
        scf.yield %6818 : i64
      }
      %6824 = func.call @cc_errorp(%6773) : (i64) -> i64
      %6825 = arith.cmpi ne, %6824, %6808 : i64
      %6826 = arith.cmpi eq, %6823, %6808 : i64
      %6827 = arith.andi %6825, %6826 : i1
      %6828 = scf.if %6827 -> (i64) {
        scf.yield %6773 : i64
      } else {
        scf.yield %6823 : i64
      }
      %6829 = func.call @cc_errorp(%6784) : (i64) -> i64
      %6830 = arith.cmpi ne, %6829, %6808 : i64
      %6831 = arith.cmpi eq, %6828, %6808 : i64
      %6832 = arith.andi %6830, %6831 : i1
      %6833 = scf.if %6832 -> (i64) {
        scf.yield %6784 : i64
      } else {
        scf.yield %6828 : i64
      }
      %6834 = func.call @cc_errorp(%6785) : (i64) -> i64
      %6835 = arith.cmpi ne, %6834, %6808 : i64
      %6836 = arith.cmpi eq, %6833, %6808 : i64
      %6837 = arith.andi %6835, %6836 : i1
      %6838 = scf.if %6837 -> (i64) {
        scf.yield %6785 : i64
      } else {
        scf.yield %6833 : i64
      }
      %6839 = func.call @cc_errorp(%6796) : (i64) -> i64
      %6840 = arith.cmpi ne, %6839, %6808 : i64
      %6841 = arith.cmpi eq, %6838, %6808 : i64
      %6842 = arith.andi %6840, %6841 : i1
      %6843 = scf.if %6842 -> (i64) {
        scf.yield %6796 : i64
      } else {
        scf.yield %6838 : i64
      }
      %6844 = func.call @cc_errorp(%6807) : (i64) -> i64
      %6845 = arith.cmpi ne, %6844, %6808 : i64
      %6846 = arith.cmpi eq, %6843, %6808 : i64
      %6847 = arith.andi %6845, %6846 : i1
      %6848 = scf.if %6847 -> (i64) {
        scf.yield %6807 : i64
      } else {
        scf.yield %6843 : i64
      }
      %6849 = arith.cmpi ne, %6848, %6808 : i64
      scf.if %6849 {
        func.call @stack_push_pointer(%6848) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6724) : (i64) -> ()
        func.call @stack_push_pointer(%6743) : (i64) -> ()
        func.call @stack_push_pointer(%6766) : (i64) -> ()
        func.call @stack_push_pointer(%6773) : (i64) -> ()
        func.call @stack_push_pointer(%6784) : (i64) -> ()
        func.call @stack_push_pointer(%6785) : (i64) -> ()
        func.call @stack_push_pointer(%6796) : (i64) -> ()
        func.call @stack_push_pointer(%6807) : (i64) -> ()
        %6850 = llvm.mlir.addressof @str604 : !llvm.ptr
        %6851 = func.call @cc_make_function_ref_const(%6850) : (!llvm.ptr) -> i64
        %6852 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%6851, %6852) : (i64, i64) -> ()
      }
      %6853 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6853 : i64
    }
    %6854 = func.call @cc_nil_value() : () -> i64
    %6855 = func.call @cc_errorp(%6715) : (i64) -> i64
    %6856 = arith.cmpi ne, %6855, %6854 : i64
    %6857 = scf.if %6856 -> (i64) {
      scf.yield %6715 : i64
    } else {
      %6858 = llvm.mlir.addressof @str605 : !llvm.ptr
      %6859 = arith.constant 22 : i64
      %6860 = func.call @cc_make_string(%6858, %6859) : (!llvm.ptr, i64) -> i64
      %6861 = func.call @cc_nil_value() : () -> i64
      %6862 = func.call @cc_intern(%6860, %6861) : (i64, i64) -> i64
      %6863 = func.call @cc_nil_value() : () -> i64
      %6864 = func.call @cc_cons(%6862, %6863) : (i64, i64) -> i64
      %6865 = func.call @cc_values_pack(%6864) : (i64) -> i64
      func.call @stack_push_pointer(%6862) : (i64) -> ()
      %6866 = func.call @stack_pop_pointer() : () -> i64
      %6867 = llvm.mlir.addressof @str606 : !llvm.ptr
      %6868 = arith.constant 6 : i64
      %6869 = func.call @cc_make_string(%6867, %6868) : (!llvm.ptr, i64) -> i64
      %6870 = func.call @cc_nil_value() : () -> i64
      %6871 = func.call @cc_intern(%6869, %6870) : (i64, i64) -> i64
      %6872 = func.call @cc_nil_value() : () -> i64
      %6873 = func.call @cc_cons(%6871, %6872) : (i64, i64) -> i64
      %6874 = func.call @cc_values_pack(%6873) : (i64) -> i64
      func.call @stack_push_pointer(%6871) : (i64) -> ()
      %6875 = llvm.mlir.addressof @str607 : !llvm.ptr
      %6876 = arith.constant 13 : i64
      %6877 = func.call @cc_make_string(%6875, %6876) : (!llvm.ptr, i64) -> i64
      %6878 = llvm.mlir.addressof @str608 : !llvm.ptr
      %6879 = arith.constant 11 : i64
      %6880 = func.call @cc_make_string(%6878, %6879) : (!llvm.ptr, i64) -> i64
      %6881 = func.call @cc_intern(%6877, %6880) : (i64, i64) -> i64
      %6882 = func.call @cc_nil_value() : () -> i64
      %6883 = func.call @cc_cons(%6881, %6882) : (i64, i64) -> i64
      %6884 = func.call @cc_values_pack(%6883) : (i64) -> i64
      func.call @stack_push_pointer(%6881) : (i64) -> ()
      %6885 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%6885) : (i64) -> ()
      %6886 = llvm.mlir.addressof @str609 : !llvm.ptr
      %6887 = arith.constant 18 : i64
      %6888 = func.call @cc_make_string(%6886, %6887) : (!llvm.ptr, i64) -> i64
      %6889 = llvm.mlir.addressof @str610 : !llvm.ptr
      %6890 = arith.constant 11 : i64
      %6891 = func.call @cc_make_string(%6889, %6890) : (!llvm.ptr, i64) -> i64
      %6892 = func.call @cc_intern(%6888, %6891) : (i64, i64) -> i64
      %6893 = func.call @cc_nil_value() : () -> i64
      %6894 = func.call @cc_cons(%6892, %6893) : (i64, i64) -> i64
      %6895 = func.call @cc_values_pack(%6894) : (i64) -> i64
      func.call @stack_push_pointer(%6892) : (i64) -> ()
      %6896 = func.call @stack_pop_pointer() : () -> i64
      %6897 = func.call @stack_pop_pointer() : () -> i64
      %6898 = func.call @cc_cons(%6896, %6897) : (i64, i64) -> i64
      %6899 = llvm.mlir.addressof @str611 : !llvm.ptr
      %6900 = arith.constant 5 : i64
      %6901 = func.call @cc_make_string(%6899, %6900) : (!llvm.ptr, i64) -> i64
      %6902 = func.call @cc_nil_value() : () -> i64
      %6903 = func.call @cc_intern(%6901, %6902) : (i64, i64) -> i64
      %6904 = func.call @cc_nil_value() : () -> i64
      %6905 = func.call @cc_cons(%6903, %6904) : (i64, i64) -> i64
      %6906 = func.call @cc_values_pack(%6905) : (i64) -> i64
      %6907 = func.call @cc_cons(%6903, %6898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6907) : (i64) -> ()
      %6908 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%6908) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6909 = func.call @stack_pop_pointer() : () -> i64
      %6910 = func.call @stack_pop_pointer() : () -> i64
      %6911 = func.call @cc_cons(%6910, %6909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6911) : (i64) -> ()
      %6912 = func.call @stack_pop_pointer() : () -> i64
      %6913 = func.call @stack_pop_pointer() : () -> i64
      %6914 = func.call @cc_cons(%6913, %6912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6914) : (i64) -> ()
      %6915 = func.call @stack_pop_pointer() : () -> i64
      %6916 = func.call @stack_pop_pointer() : () -> i64
      %6917 = func.call @cc_cons(%6916, %6915) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6917) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6918 = func.call @stack_pop_pointer() : () -> i64
      %6919 = func.call @stack_pop_pointer() : () -> i64
      %6920 = func.call @cc_cons(%6919, %6918) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6920) : (i64) -> ()
      %6921 = func.call @stack_pop_pointer() : () -> i64
      %6922 = func.call @stack_pop_pointer() : () -> i64
      %6923 = func.call @cc_cons(%6922, %6921) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6923) : (i64) -> ()
      %6924 = func.call @stack_pop_pointer() : () -> i64
      %6964 = arith.constant 122791386939421 : i64
      %6965 = arith.constant 0 : i64
      %6966 = func.call @cc_make_closure(%6964, %6965) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6966) : (i64) -> ()
      %6967 = func.call @stack_pop_pointer() : () -> i64
      %6968 = llvm.mlir.addressof @str615 : !llvm.ptr
      %6969 = arith.constant 6 : i64
      %6970 = func.call @cc_make_string(%6968, %6969) : (!llvm.ptr, i64) -> i64
      %6971 = llvm.mlir.addressof @str616 : !llvm.ptr
      %6972 = arith.constant 11 : i64
      %6973 = func.call @cc_make_string(%6971, %6972) : (!llvm.ptr, i64) -> i64
      %6974 = func.call @cc_intern(%6970, %6973) : (i64, i64) -> i64
      %6975 = func.call @cc_nil_value() : () -> i64
      %6976 = func.call @cc_cons(%6974, %6975) : (i64, i64) -> i64
      %6977 = func.call @cc_values_pack(%6976) : (i64) -> i64
      func.call @stack_push_pointer(%6974) : (i64) -> ()
      %6978 = llvm.mlir.addressof @str617 : !llvm.ptr
      %6979 = arith.constant 9 : i64
      %6980 = func.call @cc_make_string(%6978, %6979) : (!llvm.ptr, i64) -> i64
      %6981 = llvm.mlir.addressof @str618 : !llvm.ptr
      %6982 = arith.constant 11 : i64
      %6983 = func.call @cc_make_string(%6981, %6982) : (!llvm.ptr, i64) -> i64
      %6984 = func.call @cc_intern(%6980, %6983) : (i64, i64) -> i64
      %6985 = func.call @cc_nil_value() : () -> i64
      %6986 = func.call @cc_cons(%6984, %6985) : (i64, i64) -> i64
      %6987 = func.call @cc_values_pack(%6986) : (i64) -> i64
      func.call @stack_push_pointer(%6984) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6988 = func.call @stack_pop_pointer() : () -> i64
      %6989 = func.call @stack_pop_pointer() : () -> i64
      %6990 = func.call @cc_cons(%6989, %6988) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6990) : (i64) -> ()
      %6991 = func.call @stack_pop_pointer() : () -> i64
      %6992 = func.call @stack_pop_pointer() : () -> i64
      %6993 = func.call @cc_cons(%6992, %6991) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6993) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %6994 = func.call @stack_pop_pointer() : () -> i64
      %6995 = func.call @stack_pop_pointer() : () -> i64
      %6996 = func.call @cc_cons(%6995, %6994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6996) : (i64) -> ()
      %6997 = func.call @stack_pop_pointer() : () -> i64
      %6998 = llvm.mlir.addressof @str619 : !llvm.ptr
      %6999 = arith.constant 11 : i64
      %7000 = func.call @cc_make_string(%6998, %6999) : (!llvm.ptr, i64) -> i64
      %7001 = llvm.mlir.addressof @str620 : !llvm.ptr
      %7002 = arith.constant 7 : i64
      %7003 = func.call @cc_make_string(%7001, %7002) : (!llvm.ptr, i64) -> i64
      %7004 = func.call @cc_intern(%7000, %7003) : (i64, i64) -> i64
      %7005 = func.call @cc_nil_value() : () -> i64
      %7006 = func.call @cc_cons(%7004, %7005) : (i64, i64) -> i64
      %7007 = func.call @cc_values_pack(%7006) : (i64) -> i64
      func.call @stack_push_pointer(%7004) : (i64) -> ()
      %7008 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7009 = func.call @stack_pop_pointer() : () -> i64
      %7010 = llvm.mlir.addressof @str621 : !llvm.ptr
      %7011 = arith.constant 4 : i64
      %7012 = func.call @cc_make_string(%7010, %7011) : (!llvm.ptr, i64) -> i64
      %7013 = llvm.mlir.addressof @str622 : !llvm.ptr
      %7014 = arith.constant 7 : i64
      %7015 = func.call @cc_make_string(%7013, %7014) : (!llvm.ptr, i64) -> i64
      %7016 = func.call @cc_intern(%7012, %7015) : (i64, i64) -> i64
      %7017 = func.call @cc_nil_value() : () -> i64
      %7018 = func.call @cc_cons(%7016, %7017) : (i64, i64) -> i64
      %7019 = func.call @cc_values_pack(%7018) : (i64) -> i64
      func.call @stack_push_pointer(%7016) : (i64) -> ()
      %7020 = func.call @stack_pop_pointer() : () -> i64
      %7021 = llvm.mlir.addressof @str623 : !llvm.ptr
      %7022 = arith.constant 5 : i64
      %7023 = func.call @cc_make_string(%7021, %7022) : (!llvm.ptr, i64) -> i64
      %7024 = func.call @cc_nil_value() : () -> i64
      %7025 = func.call @cc_intern(%7023, %7024) : (i64, i64) -> i64
      %7026 = func.call @cc_nil_value() : () -> i64
      %7027 = func.call @cc_cons(%7025, %7026) : (i64, i64) -> i64
      %7028 = func.call @cc_values_pack(%7027) : (i64) -> i64
      func.call @stack_push_pointer(%7025) : (i64) -> ()
      %7029 = func.call @stack_pop_pointer() : () -> i64
      %7030 = func.call @cc_nil_value() : () -> i64
      %7031 = func.call @cc_errorp(%6866) : (i64) -> i64
      %7032 = arith.cmpi ne, %7031, %7030 : i64
      %7033 = arith.cmpi eq, %7030, %7030 : i64
      %7034 = arith.andi %7032, %7033 : i1
      %7035 = scf.if %7034 -> (i64) {
        scf.yield %6866 : i64
      } else {
        scf.yield %7030 : i64
      }
      %7036 = func.call @cc_errorp(%6924) : (i64) -> i64
      %7037 = arith.cmpi ne, %7036, %7030 : i64
      %7038 = arith.cmpi eq, %7035, %7030 : i64
      %7039 = arith.andi %7037, %7038 : i1
      %7040 = scf.if %7039 -> (i64) {
        scf.yield %6924 : i64
      } else {
        scf.yield %7035 : i64
      }
      %7041 = func.call @cc_errorp(%6967) : (i64) -> i64
      %7042 = arith.cmpi ne, %7041, %7030 : i64
      %7043 = arith.cmpi eq, %7040, %7030 : i64
      %7044 = arith.andi %7042, %7043 : i1
      %7045 = scf.if %7044 -> (i64) {
        scf.yield %6967 : i64
      } else {
        scf.yield %7040 : i64
      }
      %7046 = func.call @cc_errorp(%6997) : (i64) -> i64
      %7047 = arith.cmpi ne, %7046, %7030 : i64
      %7048 = arith.cmpi eq, %7045, %7030 : i64
      %7049 = arith.andi %7047, %7048 : i1
      %7050 = scf.if %7049 -> (i64) {
        scf.yield %6997 : i64
      } else {
        scf.yield %7045 : i64
      }
      %7051 = func.call @cc_errorp(%7008) : (i64) -> i64
      %7052 = arith.cmpi ne, %7051, %7030 : i64
      %7053 = arith.cmpi eq, %7050, %7030 : i64
      %7054 = arith.andi %7052, %7053 : i1
      %7055 = scf.if %7054 -> (i64) {
        scf.yield %7008 : i64
      } else {
        scf.yield %7050 : i64
      }
      %7056 = func.call @cc_errorp(%7009) : (i64) -> i64
      %7057 = arith.cmpi ne, %7056, %7030 : i64
      %7058 = arith.cmpi eq, %7055, %7030 : i64
      %7059 = arith.andi %7057, %7058 : i1
      %7060 = scf.if %7059 -> (i64) {
        scf.yield %7009 : i64
      } else {
        scf.yield %7055 : i64
      }
      %7061 = func.call @cc_errorp(%7020) : (i64) -> i64
      %7062 = arith.cmpi ne, %7061, %7030 : i64
      %7063 = arith.cmpi eq, %7060, %7030 : i64
      %7064 = arith.andi %7062, %7063 : i1
      %7065 = scf.if %7064 -> (i64) {
        scf.yield %7020 : i64
      } else {
        scf.yield %7060 : i64
      }
      %7066 = func.call @cc_errorp(%7029) : (i64) -> i64
      %7067 = arith.cmpi ne, %7066, %7030 : i64
      %7068 = arith.cmpi eq, %7065, %7030 : i64
      %7069 = arith.andi %7067, %7068 : i1
      %7070 = scf.if %7069 -> (i64) {
        scf.yield %7029 : i64
      } else {
        scf.yield %7065 : i64
      }
      %7071 = arith.cmpi ne, %7070, %7030 : i64
      scf.if %7071 {
        func.call @stack_push_pointer(%7070) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6866) : (i64) -> ()
        func.call @stack_push_pointer(%6924) : (i64) -> ()
        func.call @stack_push_pointer(%6967) : (i64) -> ()
        func.call @stack_push_pointer(%6997) : (i64) -> ()
        func.call @stack_push_pointer(%7008) : (i64) -> ()
        func.call @stack_push_pointer(%7009) : (i64) -> ()
        func.call @stack_push_pointer(%7020) : (i64) -> ()
        func.call @stack_push_pointer(%7029) : (i64) -> ()
        %7072 = llvm.mlir.addressof @str624 : !llvm.ptr
        %7073 = func.call @cc_make_function_ref_const(%7072) : (!llvm.ptr) -> i64
        %7074 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7073, %7074) : (i64, i64) -> ()
      }
      %7075 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7075 : i64
    }
    %7076 = func.call @cc_nil_value() : () -> i64
    %7077 = func.call @cc_errorp(%6857) : (i64) -> i64
    %7078 = arith.cmpi ne, %7077, %7076 : i64
    %7079 = scf.if %7078 -> (i64) {
      scf.yield %6857 : i64
    } else {
      %7080 = llvm.mlir.addressof @str625 : !llvm.ptr
      %7081 = arith.constant 22 : i64
      %7082 = func.call @cc_make_string(%7080, %7081) : (!llvm.ptr, i64) -> i64
      %7083 = func.call @cc_nil_value() : () -> i64
      %7084 = func.call @cc_intern(%7082, %7083) : (i64, i64) -> i64
      %7085 = func.call @cc_nil_value() : () -> i64
      %7086 = func.call @cc_cons(%7084, %7085) : (i64, i64) -> i64
      %7087 = func.call @cc_values_pack(%7086) : (i64) -> i64
      func.call @stack_push_pointer(%7084) : (i64) -> ()
      %7088 = func.call @stack_pop_pointer() : () -> i64
      %7089 = llvm.mlir.addressof @str626 : !llvm.ptr
      %7090 = arith.constant 6 : i64
      %7091 = func.call @cc_make_string(%7089, %7090) : (!llvm.ptr, i64) -> i64
      %7092 = func.call @cc_nil_value() : () -> i64
      %7093 = func.call @cc_intern(%7091, %7092) : (i64, i64) -> i64
      %7094 = func.call @cc_nil_value() : () -> i64
      %7095 = func.call @cc_cons(%7093, %7094) : (i64, i64) -> i64
      %7096 = func.call @cc_values_pack(%7095) : (i64) -> i64
      func.call @stack_push_pointer(%7093) : (i64) -> ()
      %7097 = llvm.mlir.addressof @str627 : !llvm.ptr
      %7098 = arith.constant 13 : i64
      %7099 = func.call @cc_make_string(%7097, %7098) : (!llvm.ptr, i64) -> i64
      %7100 = llvm.mlir.addressof @str628 : !llvm.ptr
      %7101 = arith.constant 11 : i64
      %7102 = func.call @cc_make_string(%7100, %7101) : (!llvm.ptr, i64) -> i64
      %7103 = func.call @cc_intern(%7099, %7102) : (i64, i64) -> i64
      %7104 = func.call @cc_nil_value() : () -> i64
      %7105 = func.call @cc_cons(%7103, %7104) : (i64, i64) -> i64
      %7106 = func.call @cc_values_pack(%7105) : (i64) -> i64
      func.call @stack_push_pointer(%7103) : (i64) -> ()
      %7107 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7107) : (i64) -> ()
      %7108 = llvm.mlir.addressof @str629 : !llvm.ptr
      %7109 = arith.constant 13 : i64
      %7110 = func.call @cc_make_string(%7108, %7109) : (!llvm.ptr, i64) -> i64
      %7111 = llvm.mlir.addressof @str630 : !llvm.ptr
      %7112 = arith.constant 11 : i64
      %7113 = func.call @cc_make_string(%7111, %7112) : (!llvm.ptr, i64) -> i64
      %7114 = func.call @cc_intern(%7110, %7113) : (i64, i64) -> i64
      %7115 = func.call @cc_nil_value() : () -> i64
      %7116 = func.call @cc_cons(%7114, %7115) : (i64, i64) -> i64
      %7117 = func.call @cc_values_pack(%7116) : (i64) -> i64
      func.call @stack_push_pointer(%7114) : (i64) -> ()
      %7118 = func.call @stack_pop_pointer() : () -> i64
      %7119 = func.call @stack_pop_pointer() : () -> i64
      %7120 = func.call @cc_cons(%7118, %7119) : (i64, i64) -> i64
      %7121 = llvm.mlir.addressof @str631 : !llvm.ptr
      %7122 = arith.constant 5 : i64
      %7123 = func.call @cc_make_string(%7121, %7122) : (!llvm.ptr, i64) -> i64
      %7124 = func.call @cc_nil_value() : () -> i64
      %7125 = func.call @cc_intern(%7123, %7124) : (i64, i64) -> i64
      %7126 = func.call @cc_nil_value() : () -> i64
      %7127 = func.call @cc_cons(%7125, %7126) : (i64, i64) -> i64
      %7128 = func.call @cc_values_pack(%7127) : (i64) -> i64
      %7129 = func.call @cc_cons(%7125, %7120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7129) : (i64) -> ()
      %7130 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%7130) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7131 = func.call @stack_pop_pointer() : () -> i64
      %7132 = func.call @stack_pop_pointer() : () -> i64
      %7133 = func.call @cc_cons(%7132, %7131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7133) : (i64) -> ()
      %7134 = func.call @stack_pop_pointer() : () -> i64
      %7135 = func.call @stack_pop_pointer() : () -> i64
      %7136 = func.call @cc_cons(%7135, %7134) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7136) : (i64) -> ()
      %7137 = func.call @stack_pop_pointer() : () -> i64
      %7138 = func.call @stack_pop_pointer() : () -> i64
      %7139 = func.call @cc_cons(%7138, %7137) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7139) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7140 = func.call @stack_pop_pointer() : () -> i64
      %7141 = func.call @stack_pop_pointer() : () -> i64
      %7142 = func.call @cc_cons(%7141, %7140) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7142) : (i64) -> ()
      %7143 = func.call @stack_pop_pointer() : () -> i64
      %7144 = func.call @stack_pop_pointer() : () -> i64
      %7145 = func.call @cc_cons(%7144, %7143) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7145) : (i64) -> ()
      %7146 = func.call @stack_pop_pointer() : () -> i64
      %7186 = arith.constant 122791386939422 : i64
      %7187 = arith.constant 0 : i64
      %7188 = func.call @cc_make_closure(%7186, %7187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7188) : (i64) -> ()
      %7189 = func.call @stack_pop_pointer() : () -> i64
      %7190 = llvm.mlir.addressof @str635 : !llvm.ptr
      %7191 = arith.constant 6 : i64
      %7192 = func.call @cc_make_string(%7190, %7191) : (!llvm.ptr, i64) -> i64
      %7193 = llvm.mlir.addressof @str636 : !llvm.ptr
      %7194 = arith.constant 11 : i64
      %7195 = func.call @cc_make_string(%7193, %7194) : (!llvm.ptr, i64) -> i64
      %7196 = func.call @cc_intern(%7192, %7195) : (i64, i64) -> i64
      %7197 = func.call @cc_nil_value() : () -> i64
      %7198 = func.call @cc_cons(%7196, %7197) : (i64, i64) -> i64
      %7199 = func.call @cc_values_pack(%7198) : (i64) -> i64
      func.call @stack_push_pointer(%7196) : (i64) -> ()
      %7200 = llvm.mlir.addressof @str637 : !llvm.ptr
      %7201 = arith.constant 9 : i64
      %7202 = func.call @cc_make_string(%7200, %7201) : (!llvm.ptr, i64) -> i64
      %7203 = llvm.mlir.addressof @str638 : !llvm.ptr
      %7204 = arith.constant 11 : i64
      %7205 = func.call @cc_make_string(%7203, %7204) : (!llvm.ptr, i64) -> i64
      %7206 = func.call @cc_intern(%7202, %7205) : (i64, i64) -> i64
      %7207 = func.call @cc_nil_value() : () -> i64
      %7208 = func.call @cc_cons(%7206, %7207) : (i64, i64) -> i64
      %7209 = func.call @cc_values_pack(%7208) : (i64) -> i64
      func.call @stack_push_pointer(%7206) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7210 = func.call @stack_pop_pointer() : () -> i64
      %7211 = func.call @stack_pop_pointer() : () -> i64
      %7212 = func.call @cc_cons(%7211, %7210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7212) : (i64) -> ()
      %7213 = func.call @stack_pop_pointer() : () -> i64
      %7214 = func.call @stack_pop_pointer() : () -> i64
      %7215 = func.call @cc_cons(%7214, %7213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7215) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7216 = func.call @stack_pop_pointer() : () -> i64
      %7217 = func.call @stack_pop_pointer() : () -> i64
      %7218 = func.call @cc_cons(%7217, %7216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7218) : (i64) -> ()
      %7219 = func.call @stack_pop_pointer() : () -> i64
      %7220 = llvm.mlir.addressof @str639 : !llvm.ptr
      %7221 = arith.constant 11 : i64
      %7222 = func.call @cc_make_string(%7220, %7221) : (!llvm.ptr, i64) -> i64
      %7223 = llvm.mlir.addressof @str640 : !llvm.ptr
      %7224 = arith.constant 7 : i64
      %7225 = func.call @cc_make_string(%7223, %7224) : (!llvm.ptr, i64) -> i64
      %7226 = func.call @cc_intern(%7222, %7225) : (i64, i64) -> i64
      %7227 = func.call @cc_nil_value() : () -> i64
      %7228 = func.call @cc_cons(%7226, %7227) : (i64, i64) -> i64
      %7229 = func.call @cc_values_pack(%7228) : (i64) -> i64
      func.call @stack_push_pointer(%7226) : (i64) -> ()
      %7230 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7231 = func.call @stack_pop_pointer() : () -> i64
      %7232 = llvm.mlir.addressof @str641 : !llvm.ptr
      %7233 = arith.constant 4 : i64
      %7234 = func.call @cc_make_string(%7232, %7233) : (!llvm.ptr, i64) -> i64
      %7235 = llvm.mlir.addressof @str642 : !llvm.ptr
      %7236 = arith.constant 7 : i64
      %7237 = func.call @cc_make_string(%7235, %7236) : (!llvm.ptr, i64) -> i64
      %7238 = func.call @cc_intern(%7234, %7237) : (i64, i64) -> i64
      %7239 = func.call @cc_nil_value() : () -> i64
      %7240 = func.call @cc_cons(%7238, %7239) : (i64, i64) -> i64
      %7241 = func.call @cc_values_pack(%7240) : (i64) -> i64
      func.call @stack_push_pointer(%7238) : (i64) -> ()
      %7242 = func.call @stack_pop_pointer() : () -> i64
      %7243 = llvm.mlir.addressof @str643 : !llvm.ptr
      %7244 = arith.constant 5 : i64
      %7245 = func.call @cc_make_string(%7243, %7244) : (!llvm.ptr, i64) -> i64
      %7246 = func.call @cc_nil_value() : () -> i64
      %7247 = func.call @cc_intern(%7245, %7246) : (i64, i64) -> i64
      %7248 = func.call @cc_nil_value() : () -> i64
      %7249 = func.call @cc_cons(%7247, %7248) : (i64, i64) -> i64
      %7250 = func.call @cc_values_pack(%7249) : (i64) -> i64
      func.call @stack_push_pointer(%7247) : (i64) -> ()
      %7251 = func.call @stack_pop_pointer() : () -> i64
      %7252 = func.call @cc_nil_value() : () -> i64
      %7253 = func.call @cc_errorp(%7088) : (i64) -> i64
      %7254 = arith.cmpi ne, %7253, %7252 : i64
      %7255 = arith.cmpi eq, %7252, %7252 : i64
      %7256 = arith.andi %7254, %7255 : i1
      %7257 = scf.if %7256 -> (i64) {
        scf.yield %7088 : i64
      } else {
        scf.yield %7252 : i64
      }
      %7258 = func.call @cc_errorp(%7146) : (i64) -> i64
      %7259 = arith.cmpi ne, %7258, %7252 : i64
      %7260 = arith.cmpi eq, %7257, %7252 : i64
      %7261 = arith.andi %7259, %7260 : i1
      %7262 = scf.if %7261 -> (i64) {
        scf.yield %7146 : i64
      } else {
        scf.yield %7257 : i64
      }
      %7263 = func.call @cc_errorp(%7189) : (i64) -> i64
      %7264 = arith.cmpi ne, %7263, %7252 : i64
      %7265 = arith.cmpi eq, %7262, %7252 : i64
      %7266 = arith.andi %7264, %7265 : i1
      %7267 = scf.if %7266 -> (i64) {
        scf.yield %7189 : i64
      } else {
        scf.yield %7262 : i64
      }
      %7268 = func.call @cc_errorp(%7219) : (i64) -> i64
      %7269 = arith.cmpi ne, %7268, %7252 : i64
      %7270 = arith.cmpi eq, %7267, %7252 : i64
      %7271 = arith.andi %7269, %7270 : i1
      %7272 = scf.if %7271 -> (i64) {
        scf.yield %7219 : i64
      } else {
        scf.yield %7267 : i64
      }
      %7273 = func.call @cc_errorp(%7230) : (i64) -> i64
      %7274 = arith.cmpi ne, %7273, %7252 : i64
      %7275 = arith.cmpi eq, %7272, %7252 : i64
      %7276 = arith.andi %7274, %7275 : i1
      %7277 = scf.if %7276 -> (i64) {
        scf.yield %7230 : i64
      } else {
        scf.yield %7272 : i64
      }
      %7278 = func.call @cc_errorp(%7231) : (i64) -> i64
      %7279 = arith.cmpi ne, %7278, %7252 : i64
      %7280 = arith.cmpi eq, %7277, %7252 : i64
      %7281 = arith.andi %7279, %7280 : i1
      %7282 = scf.if %7281 -> (i64) {
        scf.yield %7231 : i64
      } else {
        scf.yield %7277 : i64
      }
      %7283 = func.call @cc_errorp(%7242) : (i64) -> i64
      %7284 = arith.cmpi ne, %7283, %7252 : i64
      %7285 = arith.cmpi eq, %7282, %7252 : i64
      %7286 = arith.andi %7284, %7285 : i1
      %7287 = scf.if %7286 -> (i64) {
        scf.yield %7242 : i64
      } else {
        scf.yield %7282 : i64
      }
      %7288 = func.call @cc_errorp(%7251) : (i64) -> i64
      %7289 = arith.cmpi ne, %7288, %7252 : i64
      %7290 = arith.cmpi eq, %7287, %7252 : i64
      %7291 = arith.andi %7289, %7290 : i1
      %7292 = scf.if %7291 -> (i64) {
        scf.yield %7251 : i64
      } else {
        scf.yield %7287 : i64
      }
      %7293 = arith.cmpi ne, %7292, %7252 : i64
      scf.if %7293 {
        func.call @stack_push_pointer(%7292) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7088) : (i64) -> ()
        func.call @stack_push_pointer(%7146) : (i64) -> ()
        func.call @stack_push_pointer(%7189) : (i64) -> ()
        func.call @stack_push_pointer(%7219) : (i64) -> ()
        func.call @stack_push_pointer(%7230) : (i64) -> ()
        func.call @stack_push_pointer(%7231) : (i64) -> ()
        func.call @stack_push_pointer(%7242) : (i64) -> ()
        func.call @stack_push_pointer(%7251) : (i64) -> ()
        %7294 = llvm.mlir.addressof @str644 : !llvm.ptr
        %7295 = func.call @cc_make_function_ref_const(%7294) : (!llvm.ptr) -> i64
        %7296 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7295, %7296) : (i64, i64) -> ()
      }
      %7297 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7297 : i64
    }
    %7298 = func.call @cc_nil_value() : () -> i64
    %7299 = func.call @cc_errorp(%7079) : (i64) -> i64
    %7300 = arith.cmpi ne, %7299, %7298 : i64
    %7301 = scf.if %7300 -> (i64) {
      scf.yield %7079 : i64
    } else {
      %7302 = llvm.mlir.addressof @str645 : !llvm.ptr
      %7303 = arith.constant 5 : i64
      %7304 = func.call @cc_make_string(%7302, %7303) : (!llvm.ptr, i64) -> i64
      %7305 = func.call @cc_nil_value() : () -> i64
      %7306 = func.call @cc_intern(%7304, %7305) : (i64, i64) -> i64
      %7307 = func.call @cc_nil_value() : () -> i64
      %7308 = func.call @cc_cons(%7306, %7307) : (i64, i64) -> i64
      %7309 = func.call @cc_values_pack(%7308) : (i64) -> i64
      func.call @stack_push_pointer(%7306) : (i64) -> ()
      %7310 = func.call @stack_pop_pointer() : () -> i64
      %7311 = llvm.mlir.addressof @str646 : !llvm.ptr
      %7312 = arith.constant 8 : i64
      %7313 = func.call @cc_make_string(%7311, %7312) : (!llvm.ptr, i64) -> i64
      %7314 = llvm.mlir.addressof @str647 : !llvm.ptr
      %7315 = arith.constant 11 : i64
      %7316 = func.call @cc_make_string(%7314, %7315) : (!llvm.ptr, i64) -> i64
      %7317 = func.call @cc_intern(%7313, %7316) : (i64, i64) -> i64
      %7318 = func.call @cc_nil_value() : () -> i64
      %7319 = func.call @cc_cons(%7317, %7318) : (i64, i64) -> i64
      %7320 = func.call @cc_values_pack(%7319) : (i64) -> i64
      func.call @stack_push_pointer(%7317) : (i64) -> ()
      %7321 = llvm.mlir.addressof @str648 : !llvm.ptr
      %7322 = arith.constant 1 : i64
      %7323 = func.call @cc_make_string(%7321, %7322) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7323) : (i64) -> ()
      %7324 = llvm.mlir.addressof @str649 : !llvm.ptr
      %7325 = arith.constant 1 : i64
      %7326 = func.call @cc_make_string(%7324, %7325) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7326) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7327 = func.call @stack_pop_pointer() : () -> i64
      %7328 = func.call @stack_pop_pointer() : () -> i64
      %7329 = func.call @cc_cons(%7328, %7327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7329) : (i64) -> ()
      %7330 = func.call @stack_pop_pointer() : () -> i64
      %7331 = func.call @stack_pop_pointer() : () -> i64
      %7332 = func.call @cc_cons(%7331, %7330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7332) : (i64) -> ()
      %7333 = func.call @stack_pop_pointer() : () -> i64
      %7334 = func.call @stack_pop_pointer() : () -> i64
      %7335 = func.call @cc_cons(%7334, %7333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7335) : (i64) -> ()
      %7336 = func.call @stack_pop_pointer() : () -> i64
      %7360 = arith.constant 122791386939423 : i64
      %7361 = arith.constant 0 : i64
      %7362 = func.call @cc_make_closure(%7360, %7361) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7362) : (i64) -> ()
      %7363 = func.call @stack_pop_pointer() : () -> i64
      %7364 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%7364) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7365 = func.call @stack_pop_pointer() : () -> i64
      %7366 = func.call @stack_pop_pointer() : () -> i64
      %7367 = func.call @cc_cons(%7366, %7365) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7367) : (i64) -> ()
      %7368 = func.call @stack_pop_pointer() : () -> i64
      %7369 = llvm.mlir.addressof @str654 : !llvm.ptr
      %7370 = arith.constant 11 : i64
      %7371 = func.call @cc_make_string(%7369, %7370) : (!llvm.ptr, i64) -> i64
      %7372 = llvm.mlir.addressof @str655 : !llvm.ptr
      %7373 = arith.constant 7 : i64
      %7374 = func.call @cc_make_string(%7372, %7373) : (!llvm.ptr, i64) -> i64
      %7375 = func.call @cc_intern(%7371, %7374) : (i64, i64) -> i64
      %7376 = func.call @cc_nil_value() : () -> i64
      %7377 = func.call @cc_cons(%7375, %7376) : (i64, i64) -> i64
      %7378 = func.call @cc_values_pack(%7377) : (i64) -> i64
      func.call @stack_push_pointer(%7375) : (i64) -> ()
      %7379 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7380 = func.call @stack_pop_pointer() : () -> i64
      %7381 = llvm.mlir.addressof @str656 : !llvm.ptr
      %7382 = arith.constant 4 : i64
      %7383 = func.call @cc_make_string(%7381, %7382) : (!llvm.ptr, i64) -> i64
      %7384 = llvm.mlir.addressof @str657 : !llvm.ptr
      %7385 = arith.constant 7 : i64
      %7386 = func.call @cc_make_string(%7384, %7385) : (!llvm.ptr, i64) -> i64
      %7387 = func.call @cc_intern(%7383, %7386) : (i64, i64) -> i64
      %7388 = func.call @cc_nil_value() : () -> i64
      %7389 = func.call @cc_cons(%7387, %7388) : (i64, i64) -> i64
      %7390 = func.call @cc_values_pack(%7389) : (i64) -> i64
      func.call @stack_push_pointer(%7387) : (i64) -> ()
      %7391 = func.call @stack_pop_pointer() : () -> i64
      %7392 = llvm.mlir.addressof @str658 : !llvm.ptr
      %7393 = arith.constant 6 : i64
      %7394 = func.call @cc_make_string(%7392, %7393) : (!llvm.ptr, i64) -> i64
      %7395 = func.call @cc_nil_value() : () -> i64
      %7396 = func.call @cc_intern(%7394, %7395) : (i64, i64) -> i64
      %7397 = func.call @cc_nil_value() : () -> i64
      %7398 = func.call @cc_cons(%7396, %7397) : (i64, i64) -> i64
      %7399 = func.call @cc_values_pack(%7398) : (i64) -> i64
      func.call @stack_push_pointer(%7396) : (i64) -> ()
      %7400 = func.call @stack_pop_pointer() : () -> i64
      %7401 = func.call @cc_nil_value() : () -> i64
      %7402 = func.call @cc_errorp(%7310) : (i64) -> i64
      %7403 = arith.cmpi ne, %7402, %7401 : i64
      %7404 = arith.cmpi eq, %7401, %7401 : i64
      %7405 = arith.andi %7403, %7404 : i1
      %7406 = scf.if %7405 -> (i64) {
        scf.yield %7310 : i64
      } else {
        scf.yield %7401 : i64
      }
      %7407 = func.call @cc_errorp(%7336) : (i64) -> i64
      %7408 = arith.cmpi ne, %7407, %7401 : i64
      %7409 = arith.cmpi eq, %7406, %7401 : i64
      %7410 = arith.andi %7408, %7409 : i1
      %7411 = scf.if %7410 -> (i64) {
        scf.yield %7336 : i64
      } else {
        scf.yield %7406 : i64
      }
      %7412 = func.call @cc_errorp(%7363) : (i64) -> i64
      %7413 = arith.cmpi ne, %7412, %7401 : i64
      %7414 = arith.cmpi eq, %7411, %7401 : i64
      %7415 = arith.andi %7413, %7414 : i1
      %7416 = scf.if %7415 -> (i64) {
        scf.yield %7363 : i64
      } else {
        scf.yield %7411 : i64
      }
      %7417 = func.call @cc_errorp(%7368) : (i64) -> i64
      %7418 = arith.cmpi ne, %7417, %7401 : i64
      %7419 = arith.cmpi eq, %7416, %7401 : i64
      %7420 = arith.andi %7418, %7419 : i1
      %7421 = scf.if %7420 -> (i64) {
        scf.yield %7368 : i64
      } else {
        scf.yield %7416 : i64
      }
      %7422 = func.call @cc_errorp(%7379) : (i64) -> i64
      %7423 = arith.cmpi ne, %7422, %7401 : i64
      %7424 = arith.cmpi eq, %7421, %7401 : i64
      %7425 = arith.andi %7423, %7424 : i1
      %7426 = scf.if %7425 -> (i64) {
        scf.yield %7379 : i64
      } else {
        scf.yield %7421 : i64
      }
      %7427 = func.call @cc_errorp(%7380) : (i64) -> i64
      %7428 = arith.cmpi ne, %7427, %7401 : i64
      %7429 = arith.cmpi eq, %7426, %7401 : i64
      %7430 = arith.andi %7428, %7429 : i1
      %7431 = scf.if %7430 -> (i64) {
        scf.yield %7380 : i64
      } else {
        scf.yield %7426 : i64
      }
      %7432 = func.call @cc_errorp(%7391) : (i64) -> i64
      %7433 = arith.cmpi ne, %7432, %7401 : i64
      %7434 = arith.cmpi eq, %7431, %7401 : i64
      %7435 = arith.andi %7433, %7434 : i1
      %7436 = scf.if %7435 -> (i64) {
        scf.yield %7391 : i64
      } else {
        scf.yield %7431 : i64
      }
      %7437 = func.call @cc_errorp(%7400) : (i64) -> i64
      %7438 = arith.cmpi ne, %7437, %7401 : i64
      %7439 = arith.cmpi eq, %7436, %7401 : i64
      %7440 = arith.andi %7438, %7439 : i1
      %7441 = scf.if %7440 -> (i64) {
        scf.yield %7400 : i64
      } else {
        scf.yield %7436 : i64
      }
      %7442 = arith.cmpi ne, %7441, %7401 : i64
      scf.if %7442 {
        func.call @stack_push_pointer(%7441) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7310) : (i64) -> ()
        func.call @stack_push_pointer(%7336) : (i64) -> ()
        func.call @stack_push_pointer(%7363) : (i64) -> ()
        func.call @stack_push_pointer(%7368) : (i64) -> ()
        func.call @stack_push_pointer(%7379) : (i64) -> ()
        func.call @stack_push_pointer(%7380) : (i64) -> ()
        func.call @stack_push_pointer(%7391) : (i64) -> ()
        func.call @stack_push_pointer(%7400) : (i64) -> ()
        %7443 = llvm.mlir.addressof @str659 : !llvm.ptr
        %7444 = func.call @cc_make_function_ref_const(%7443) : (!llvm.ptr) -> i64
        %7445 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7444, %7445) : (i64, i64) -> ()
      }
      %7446 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7446 : i64
    }
    %7447 = func.call @cc_nil_value() : () -> i64
    %7448 = func.call @cc_errorp(%7301) : (i64) -> i64
    %7449 = arith.cmpi ne, %7448, %7447 : i64
    %7450 = scf.if %7449 -> (i64) {
      scf.yield %7301 : i64
    } else {
      %7451 = llvm.mlir.addressof @str660 : !llvm.ptr
      %7452 = arith.constant 5 : i64
      %7453 = func.call @cc_make_string(%7451, %7452) : (!llvm.ptr, i64) -> i64
      %7454 = func.call @cc_nil_value() : () -> i64
      %7455 = func.call @cc_intern(%7453, %7454) : (i64, i64) -> i64
      %7456 = func.call @cc_nil_value() : () -> i64
      %7457 = func.call @cc_cons(%7455, %7456) : (i64, i64) -> i64
      %7458 = func.call @cc_values_pack(%7457) : (i64) -> i64
      func.call @stack_push_pointer(%7455) : (i64) -> ()
      %7459 = func.call @stack_pop_pointer() : () -> i64
      %7460 = llvm.mlir.addressof @str661 : !llvm.ptr
      %7461 = arith.constant 16 : i64
      %7462 = func.call @cc_make_string(%7460, %7461) : (!llvm.ptr, i64) -> i64
      %7463 = llvm.mlir.addressof @str662 : !llvm.ptr
      %7464 = arith.constant 11 : i64
      %7465 = func.call @cc_make_string(%7463, %7464) : (!llvm.ptr, i64) -> i64
      %7466 = func.call @cc_intern(%7462, %7465) : (i64, i64) -> i64
      %7467 = func.call @cc_nil_value() : () -> i64
      %7468 = func.call @cc_cons(%7466, %7467) : (i64, i64) -> i64
      %7469 = func.call @cc_values_pack(%7468) : (i64) -> i64
      func.call @stack_push_pointer(%7466) : (i64) -> ()
      %7470 = llvm.mlir.addressof @str663 : !llvm.ptr
      %7471 = arith.constant 1 : i64
      %7472 = func.call @cc_make_string(%7470, %7471) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7472) : (i64) -> ()
      %7473 = llvm.mlir.addressof @str664 : !llvm.ptr
      %7474 = arith.constant 1 : i64
      %7475 = func.call @cc_make_string(%7473, %7474) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7475) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7476 = func.call @stack_pop_pointer() : () -> i64
      %7477 = func.call @stack_pop_pointer() : () -> i64
      %7478 = func.call @cc_cons(%7477, %7476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7478) : (i64) -> ()
      %7479 = func.call @stack_pop_pointer() : () -> i64
      %7480 = func.call @stack_pop_pointer() : () -> i64
      %7481 = func.call @cc_cons(%7480, %7479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7481) : (i64) -> ()
      %7482 = func.call @stack_pop_pointer() : () -> i64
      %7483 = func.call @stack_pop_pointer() : () -> i64
      %7484 = func.call @cc_cons(%7483, %7482) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7484) : (i64) -> ()
      %7485 = func.call @stack_pop_pointer() : () -> i64
      %7509 = arith.constant 122791386939424 : i64
      %7510 = arith.constant 0 : i64
      %7511 = func.call @cc_make_closure(%7509, %7510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7511) : (i64) -> ()
      %7512 = func.call @stack_pop_pointer() : () -> i64
      %7513 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%7513) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7514 = func.call @stack_pop_pointer() : () -> i64
      %7515 = func.call @stack_pop_pointer() : () -> i64
      %7516 = func.call @cc_cons(%7515, %7514) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7516) : (i64) -> ()
      %7517 = func.call @stack_pop_pointer() : () -> i64
      %7518 = llvm.mlir.addressof @str669 : !llvm.ptr
      %7519 = arith.constant 11 : i64
      %7520 = func.call @cc_make_string(%7518, %7519) : (!llvm.ptr, i64) -> i64
      %7521 = llvm.mlir.addressof @str670 : !llvm.ptr
      %7522 = arith.constant 7 : i64
      %7523 = func.call @cc_make_string(%7521, %7522) : (!llvm.ptr, i64) -> i64
      %7524 = func.call @cc_intern(%7520, %7523) : (i64, i64) -> i64
      %7525 = func.call @cc_nil_value() : () -> i64
      %7526 = func.call @cc_cons(%7524, %7525) : (i64, i64) -> i64
      %7527 = func.call @cc_values_pack(%7526) : (i64) -> i64
      func.call @stack_push_pointer(%7524) : (i64) -> ()
      %7528 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7529 = func.call @stack_pop_pointer() : () -> i64
      %7530 = llvm.mlir.addressof @str671 : !llvm.ptr
      %7531 = arith.constant 4 : i64
      %7532 = func.call @cc_make_string(%7530, %7531) : (!llvm.ptr, i64) -> i64
      %7533 = llvm.mlir.addressof @str672 : !llvm.ptr
      %7534 = arith.constant 7 : i64
      %7535 = func.call @cc_make_string(%7533, %7534) : (!llvm.ptr, i64) -> i64
      %7536 = func.call @cc_intern(%7532, %7535) : (i64, i64) -> i64
      %7537 = func.call @cc_nil_value() : () -> i64
      %7538 = func.call @cc_cons(%7536, %7537) : (i64, i64) -> i64
      %7539 = func.call @cc_values_pack(%7538) : (i64) -> i64
      func.call @stack_push_pointer(%7536) : (i64) -> ()
      %7540 = func.call @stack_pop_pointer() : () -> i64
      %7541 = llvm.mlir.addressof @str673 : !llvm.ptr
      %7542 = arith.constant 6 : i64
      %7543 = func.call @cc_make_string(%7541, %7542) : (!llvm.ptr, i64) -> i64
      %7544 = func.call @cc_nil_value() : () -> i64
      %7545 = func.call @cc_intern(%7543, %7544) : (i64, i64) -> i64
      %7546 = func.call @cc_nil_value() : () -> i64
      %7547 = func.call @cc_cons(%7545, %7546) : (i64, i64) -> i64
      %7548 = func.call @cc_values_pack(%7547) : (i64) -> i64
      func.call @stack_push_pointer(%7545) : (i64) -> ()
      %7549 = func.call @stack_pop_pointer() : () -> i64
      %7550 = func.call @cc_nil_value() : () -> i64
      %7551 = func.call @cc_errorp(%7459) : (i64) -> i64
      %7552 = arith.cmpi ne, %7551, %7550 : i64
      %7553 = arith.cmpi eq, %7550, %7550 : i64
      %7554 = arith.andi %7552, %7553 : i1
      %7555 = scf.if %7554 -> (i64) {
        scf.yield %7459 : i64
      } else {
        scf.yield %7550 : i64
      }
      %7556 = func.call @cc_errorp(%7485) : (i64) -> i64
      %7557 = arith.cmpi ne, %7556, %7550 : i64
      %7558 = arith.cmpi eq, %7555, %7550 : i64
      %7559 = arith.andi %7557, %7558 : i1
      %7560 = scf.if %7559 -> (i64) {
        scf.yield %7485 : i64
      } else {
        scf.yield %7555 : i64
      }
      %7561 = func.call @cc_errorp(%7512) : (i64) -> i64
      %7562 = arith.cmpi ne, %7561, %7550 : i64
      %7563 = arith.cmpi eq, %7560, %7550 : i64
      %7564 = arith.andi %7562, %7563 : i1
      %7565 = scf.if %7564 -> (i64) {
        scf.yield %7512 : i64
      } else {
        scf.yield %7560 : i64
      }
      %7566 = func.call @cc_errorp(%7517) : (i64) -> i64
      %7567 = arith.cmpi ne, %7566, %7550 : i64
      %7568 = arith.cmpi eq, %7565, %7550 : i64
      %7569 = arith.andi %7567, %7568 : i1
      %7570 = scf.if %7569 -> (i64) {
        scf.yield %7517 : i64
      } else {
        scf.yield %7565 : i64
      }
      %7571 = func.call @cc_errorp(%7528) : (i64) -> i64
      %7572 = arith.cmpi ne, %7571, %7550 : i64
      %7573 = arith.cmpi eq, %7570, %7550 : i64
      %7574 = arith.andi %7572, %7573 : i1
      %7575 = scf.if %7574 -> (i64) {
        scf.yield %7528 : i64
      } else {
        scf.yield %7570 : i64
      }
      %7576 = func.call @cc_errorp(%7529) : (i64) -> i64
      %7577 = arith.cmpi ne, %7576, %7550 : i64
      %7578 = arith.cmpi eq, %7575, %7550 : i64
      %7579 = arith.andi %7577, %7578 : i1
      %7580 = scf.if %7579 -> (i64) {
        scf.yield %7529 : i64
      } else {
        scf.yield %7575 : i64
      }
      %7581 = func.call @cc_errorp(%7540) : (i64) -> i64
      %7582 = arith.cmpi ne, %7581, %7550 : i64
      %7583 = arith.cmpi eq, %7580, %7550 : i64
      %7584 = arith.andi %7582, %7583 : i1
      %7585 = scf.if %7584 -> (i64) {
        scf.yield %7540 : i64
      } else {
        scf.yield %7580 : i64
      }
      %7586 = func.call @cc_errorp(%7549) : (i64) -> i64
      %7587 = arith.cmpi ne, %7586, %7550 : i64
      %7588 = arith.cmpi eq, %7585, %7550 : i64
      %7589 = arith.andi %7587, %7588 : i1
      %7590 = scf.if %7589 -> (i64) {
        scf.yield %7549 : i64
      } else {
        scf.yield %7585 : i64
      }
      %7591 = arith.cmpi ne, %7590, %7550 : i64
      scf.if %7591 {
        func.call @stack_push_pointer(%7590) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7459) : (i64) -> ()
        func.call @stack_push_pointer(%7485) : (i64) -> ()
        func.call @stack_push_pointer(%7512) : (i64) -> ()
        func.call @stack_push_pointer(%7517) : (i64) -> ()
        func.call @stack_push_pointer(%7528) : (i64) -> ()
        func.call @stack_push_pointer(%7529) : (i64) -> ()
        func.call @stack_push_pointer(%7540) : (i64) -> ()
        func.call @stack_push_pointer(%7549) : (i64) -> ()
        %7592 = llvm.mlir.addressof @str674 : !llvm.ptr
        %7593 = func.call @cc_make_function_ref_const(%7592) : (!llvm.ptr) -> i64
        %7594 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%7593, %7594) : (i64, i64) -> ()
      }
      %7595 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7595 : i64
    }
    %7596 = func.call @cc_nil_value() : () -> i64
    %7597 = func.call @cc_errorp(%7450) : (i64) -> i64
    %7598 = arith.cmpi ne, %7597, %7596 : i64
    %7599 = scf.if %7598 -> (i64) {
      scf.yield %7450 : i64
    } else {
      %7600 = llvm.mlir.addressof @str675 : !llvm.ptr
      %7601 = arith.constant 22 : i64
      %7602 = func.call @cc_make_string(%7600, %7601) : (!llvm.ptr, i64) -> i64
      %7603 = func.call @cc_nil_value() : () -> i64
      %7604 = func.call @cc_intern(%7602, %7603) : (i64, i64) -> i64
      %7605 = func.call @cc_nil_value() : () -> i64
      %7606 = func.call @cc_cons(%7604, %7605) : (i64, i64) -> i64
      %7607 = func.call @cc_values_pack(%7606) : (i64) -> i64
      func.call @stack_push_pointer(%7604) : (i64) -> ()
      %7608 = func.call @stack_pop_pointer() : () -> i64
      %7609 = llvm.mlir.addressof @str676 : !llvm.ptr
      %7610 = arith.constant 3 : i64
      %7611 = func.call @cc_make_string(%7609, %7610) : (!llvm.ptr, i64) -> i64
      %7612 = func.call @cc_nil_value() : () -> i64
      %7613 = func.call @cc_intern(%7611, %7612) : (i64, i64) -> i64
      %7614 = func.call @cc_nil_value() : () -> i64
      %7615 = func.call @cc_cons(%7613, %7614) : (i64, i64) -> i64
      %7616 = func.call @cc_values_pack(%7615) : (i64) -> i64
      func.call @stack_push_pointer(%7613) : (i64) -> ()
      %7617 = llvm.mlir.addressof @str677 : !llvm.ptr
      %7618 = arith.constant 3 : i64
      %7619 = func.call @cc_make_string(%7617, %7618) : (!llvm.ptr, i64) -> i64
      %7620 = func.call @cc_nil_value() : () -> i64
      %7621 = func.call @cc_intern(%7619, %7620) : (i64, i64) -> i64
      %7622 = func.call @cc_nil_value() : () -> i64
      %7623 = func.call @cc_cons(%7621, %7622) : (i64, i64) -> i64
      %7624 = func.call @cc_values_pack(%7623) : (i64) -> i64
      func.call @stack_push_pointer(%7621) : (i64) -> ()
      %7625 = llvm.mlir.addressof @str678 : !llvm.ptr
      %7626 = arith.constant 12 : i64
      %7627 = func.call @cc_make_string(%7625, %7626) : (!llvm.ptr, i64) -> i64
      %7628 = llvm.mlir.addressof @str679 : !llvm.ptr
      %7629 = arith.constant 11 : i64
      %7630 = func.call @cc_make_string(%7628, %7629) : (!llvm.ptr, i64) -> i64
      %7631 = func.call @cc_intern(%7627, %7630) : (i64, i64) -> i64
      %7632 = func.call @cc_nil_value() : () -> i64
      %7633 = func.call @cc_cons(%7631, %7632) : (i64, i64) -> i64
      %7634 = func.call @cc_values_pack(%7633) : (i64) -> i64
      func.call @stack_push_pointer(%7631) : (i64) -> ()
      %7635 = llvm.mlir.addressof @str680 : !llvm.ptr
      %7636 = arith.constant 10 : i64
      %7637 = func.call @cc_make_string(%7635, %7636) : (!llvm.ptr, i64) -> i64
      %7638 = llvm.mlir.addressof @str681 : !llvm.ptr
      %7639 = arith.constant 11 : i64
      %7640 = func.call @cc_make_string(%7638, %7639) : (!llvm.ptr, i64) -> i64
      %7641 = func.call @cc_intern(%7637, %7640) : (i64, i64) -> i64
      %7642 = func.call @cc_nil_value() : () -> i64
      %7643 = func.call @cc_cons(%7641, %7642) : (i64, i64) -> i64
      %7644 = func.call @cc_values_pack(%7643) : (i64) -> i64
      func.call @stack_push_pointer(%7641) : (i64) -> ()
      %7645 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%7645) : (i64) -> ()
      %7646 = llvm.mlir.addressof @str682 : !llvm.ptr
      %7647 = arith.constant 12 : i64
      %7648 = func.call @cc_make_string(%7646, %7647) : (!llvm.ptr, i64) -> i64
      %7649 = llvm.mlir.addressof @str683 : !llvm.ptr
      %7650 = arith.constant 7 : i64
      %7651 = func.call @cc_make_string(%7649, %7650) : (!llvm.ptr, i64) -> i64
      %7652 = func.call @cc_intern(%7648, %7651) : (i64, i64) -> i64
      %7653 = func.call @cc_nil_value() : () -> i64
      %7654 = func.call @cc_cons(%7652, %7653) : (i64, i64) -> i64
      %7655 = func.call @cc_values_pack(%7654) : (i64) -> i64
      func.call @stack_push_pointer(%7652) : (i64) -> ()
      %7656 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%7656) : (i64) -> ()
      %7657 = llvm.mlir.addressof @str684 : !llvm.ptr
      %7658 = arith.constant 9 : i64
      %7659 = func.call @cc_make_string(%7657, %7658) : (!llvm.ptr, i64) -> i64
      %7660 = llvm.mlir.addressof @str685 : !llvm.ptr
      %7661 = arith.constant 11 : i64
      %7662 = func.call @cc_make_string(%7660, %7661) : (!llvm.ptr, i64) -> i64
      %7663 = func.call @cc_intern(%7659, %7662) : (i64, i64) -> i64
      %7664 = func.call @cc_nil_value() : () -> i64
      %7665 = func.call @cc_cons(%7663, %7664) : (i64, i64) -> i64
      %7666 = func.call @cc_values_pack(%7665) : (i64) -> i64
      func.call @stack_push_pointer(%7663) : (i64) -> ()
      %7667 = func.call @stack_pop_pointer() : () -> i64
      %7668 = func.call @stack_pop_pointer() : () -> i64
      %7669 = func.call @cc_cons(%7667, %7668) : (i64, i64) -> i64
      %7670 = llvm.mlir.addressof @str686 : !llvm.ptr
      %7671 = arith.constant 5 : i64
      %7672 = func.call @cc_make_string(%7670, %7671) : (!llvm.ptr, i64) -> i64
      %7673 = func.call @cc_nil_value() : () -> i64
      %7674 = func.call @cc_intern(%7672, %7673) : (i64, i64) -> i64
      %7675 = func.call @cc_nil_value() : () -> i64
      %7676 = func.call @cc_cons(%7674, %7675) : (i64, i64) -> i64
      %7677 = func.call @cc_values_pack(%7676) : (i64) -> i64
      %7678 = func.call @cc_cons(%7674, %7669) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7678) : (i64) -> ()
      %7679 = llvm.mlir.addressof @str687 : !llvm.ptr
      %7680 = arith.constant 16 : i64
      %7681 = func.call @cc_make_string(%7679, %7680) : (!llvm.ptr, i64) -> i64
      %7682 = llvm.mlir.addressof @str688 : !llvm.ptr
      %7683 = arith.constant 7 : i64
      %7684 = func.call @cc_make_string(%7682, %7683) : (!llvm.ptr, i64) -> i64
      %7685 = func.call @cc_intern(%7681, %7684) : (i64, i64) -> i64
      %7686 = func.call @cc_nil_value() : () -> i64
      %7687 = func.call @cc_cons(%7685, %7686) : (i64, i64) -> i64
      %7688 = func.call @cc_values_pack(%7687) : (i64) -> i64
      func.call @stack_push_pointer(%7685) : (i64) -> ()
      %7689 = llvm.mlir.addressof @str689 : !llvm.ptr
      %7690 = arith.constant 4 : i64
      %7691 = func.call @cc_make_string(%7689, %7690) : (!llvm.ptr, i64) -> i64
      %7692 = llvm.mlir.addressof @str690 : !llvm.ptr
      %7693 = arith.constant 11 : i64
      %7694 = func.call @cc_make_string(%7692, %7693) : (!llvm.ptr, i64) -> i64
      %7695 = func.call @cc_intern(%7691, %7694) : (i64, i64) -> i64
      %7696 = func.call @cc_nil_value() : () -> i64
      %7697 = func.call @cc_cons(%7695, %7696) : (i64, i64) -> i64
      %7698 = func.call @cc_values_pack(%7697) : (i64) -> i64
      func.call @stack_push_pointer(%7695) : (i64) -> ()
      %7699 = arith.constant 63 : i64
      %7700 = func.call @cc_box_character(%7699) : (i64) -> i64
      func.call @stack_push_pointer(%7700) : (i64) -> ()
      %7701 = llvm.mlir.addressof @str691 : !llvm.ptr
      %7702 = arith.constant 9 : i64
      %7703 = func.call @cc_make_string(%7701, %7702) : (!llvm.ptr, i64) -> i64
      %7704 = llvm.mlir.addressof @str692 : !llvm.ptr
      %7705 = arith.constant 11 : i64
      %7706 = func.call @cc_make_string(%7704, %7705) : (!llvm.ptr, i64) -> i64
      %7707 = func.call @cc_intern(%7703, %7706) : (i64, i64) -> i64
      %7708 = func.call @cc_nil_value() : () -> i64
      %7709 = func.call @cc_cons(%7707, %7708) : (i64, i64) -> i64
      %7710 = func.call @cc_values_pack(%7709) : (i64) -> i64
      func.call @stack_push_pointer(%7707) : (i64) -> ()
      %7711 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%7711) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7712 = func.call @stack_pop_pointer() : () -> i64
      %7713 = func.call @stack_pop_pointer() : () -> i64
      %7714 = func.call @cc_cons(%7713, %7712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7714) : (i64) -> ()
      %7715 = func.call @stack_pop_pointer() : () -> i64
      %7716 = func.call @stack_pop_pointer() : () -> i64
      %7717 = func.call @cc_cons(%7716, %7715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7717) : (i64) -> ()
      %7718 = arith.constant 63 : i64
      %7719 = func.call @cc_box_character(%7718) : (i64) -> i64
      func.call @stack_push_pointer(%7719) : (i64) -> ()
      %7720 = arith.constant 63 : i64
      %7721 = func.call @cc_box_character(%7720) : (i64) -> i64
      func.call @stack_push_pointer(%7721) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7722 = func.call @stack_pop_pointer() : () -> i64
      %7723 = func.call @stack_pop_pointer() : () -> i64
      %7724 = func.call @cc_cons(%7723, %7722) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7724) : (i64) -> ()
      %7725 = func.call @stack_pop_pointer() : () -> i64
      %7726 = func.call @stack_pop_pointer() : () -> i64
      %7727 = func.call @cc_cons(%7726, %7725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7727) : (i64) -> ()
      %7728 = func.call @stack_pop_pointer() : () -> i64
      %7729 = func.call @stack_pop_pointer() : () -> i64
      %7730 = func.call @cc_cons(%7729, %7728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7730) : (i64) -> ()
      %7731 = func.call @stack_pop_pointer() : () -> i64
      %7732 = func.call @stack_pop_pointer() : () -> i64
      %7733 = func.call @cc_cons(%7732, %7731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7733) : (i64) -> ()
      %7734 = func.call @stack_pop_pointer() : () -> i64
      %7735 = func.call @stack_pop_pointer() : () -> i64
      %7736 = func.call @cc_cons(%7735, %7734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7736) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7737 = func.call @stack_pop_pointer() : () -> i64
      %7738 = func.call @stack_pop_pointer() : () -> i64
      %7739 = func.call @cc_cons(%7738, %7737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7739) : (i64) -> ()
      %7740 = func.call @stack_pop_pointer() : () -> i64
      %7741 = func.call @stack_pop_pointer() : () -> i64
      %7742 = func.call @cc_cons(%7741, %7740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7742) : (i64) -> ()
      %7743 = func.call @stack_pop_pointer() : () -> i64
      %7744 = func.call @stack_pop_pointer() : () -> i64
      %7745 = func.call @cc_cons(%7744, %7743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7745) : (i64) -> ()
      %7746 = func.call @stack_pop_pointer() : () -> i64
      %7747 = func.call @stack_pop_pointer() : () -> i64
      %7748 = func.call @cc_cons(%7747, %7746) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7748) : (i64) -> ()
      %7749 = func.call @stack_pop_pointer() : () -> i64
      %7750 = func.call @stack_pop_pointer() : () -> i64
      %7751 = func.call @cc_cons(%7750, %7749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7751) : (i64) -> ()
      %7752 = func.call @stack_pop_pointer() : () -> i64
      %7753 = func.call @stack_pop_pointer() : () -> i64
      %7754 = func.call @cc_cons(%7753, %7752) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7754) : (i64) -> ()
      %7755 = llvm.mlir.addressof @str693 : !llvm.ptr
      %7756 = arith.constant 3 : i64
      %7757 = func.call @cc_make_string(%7755, %7756) : (!llvm.ptr, i64) -> i64
      %7758 = func.call @cc_nil_value() : () -> i64
      %7759 = func.call @cc_intern(%7757, %7758) : (i64, i64) -> i64
      %7760 = func.call @cc_nil_value() : () -> i64
      %7761 = func.call @cc_cons(%7759, %7760) : (i64, i64) -> i64
      %7762 = func.call @cc_values_pack(%7761) : (i64) -> i64
      func.call @stack_push_pointer(%7759) : (i64) -> ()
      %7763 = llvm.mlir.addressof @str694 : !llvm.ptr
      %7764 = arith.constant 3 : i64
      %7765 = func.call @cc_make_string(%7763, %7764) : (!llvm.ptr, i64) -> i64
      %7766 = func.call @cc_nil_value() : () -> i64
      %7767 = func.call @cc_intern(%7765, %7766) : (i64, i64) -> i64
      %7768 = func.call @cc_nil_value() : () -> i64
      %7769 = func.call @cc_cons(%7767, %7768) : (i64, i64) -> i64
      %7770 = func.call @cc_values_pack(%7769) : (i64) -> i64
      func.call @stack_push_pointer(%7767) : (i64) -> ()
      %7771 = llvm.mlir.addressof @str695 : !llvm.ptr
      %7772 = arith.constant 8 : i64
      %7773 = func.call @cc_make_string(%7771, %7772) : (!llvm.ptr, i64) -> i64
      %7774 = llvm.mlir.addressof @str696 : !llvm.ptr
      %7775 = arith.constant 11 : i64
      %7776 = func.call @cc_make_string(%7774, %7775) : (!llvm.ptr, i64) -> i64
      %7777 = func.call @cc_intern(%7773, %7776) : (i64, i64) -> i64
      %7778 = func.call @cc_nil_value() : () -> i64
      %7779 = func.call @cc_cons(%7777, %7778) : (i64, i64) -> i64
      %7780 = func.call @cc_values_pack(%7779) : (i64) -> i64
      func.call @stack_push_pointer(%7777) : (i64) -> ()
      %7781 = llvm.mlir.addressof @str697 : !llvm.ptr
      %7782 = arith.constant 4 : i64
      %7783 = func.call @cc_make_string(%7781, %7782) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7783) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7784 = func.call @stack_pop_pointer() : () -> i64
      %7785 = func.call @stack_pop_pointer() : () -> i64
      %7786 = func.call @cc_cons(%7785, %7784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7786) : (i64) -> ()
      %7787 = func.call @stack_pop_pointer() : () -> i64
      %7788 = func.call @stack_pop_pointer() : () -> i64
      %7789 = func.call @cc_cons(%7788, %7787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7789) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7790 = func.call @stack_pop_pointer() : () -> i64
      %7791 = func.call @stack_pop_pointer() : () -> i64
      %7792 = func.call @cc_cons(%7791, %7790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7792) : (i64) -> ()
      %7793 = func.call @stack_pop_pointer() : () -> i64
      %7794 = func.call @stack_pop_pointer() : () -> i64
      %7795 = func.call @cc_cons(%7794, %7793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7795) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7796 = func.call @stack_pop_pointer() : () -> i64
      %7797 = func.call @stack_pop_pointer() : () -> i64
      %7798 = func.call @cc_cons(%7797, %7796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7798) : (i64) -> ()
      %7799 = llvm.mlir.addressof @str698 : !llvm.ptr
      %7800 = arith.constant 4 : i64
      %7801 = func.call @cc_make_string(%7799, %7800) : (!llvm.ptr, i64) -> i64
      %7802 = llvm.mlir.addressof @str699 : !llvm.ptr
      %7803 = arith.constant 11 : i64
      %7804 = func.call @cc_make_string(%7802, %7803) : (!llvm.ptr, i64) -> i64
      %7805 = func.call @cc_intern(%7801, %7804) : (i64, i64) -> i64
      %7806 = func.call @cc_nil_value() : () -> i64
      %7807 = func.call @cc_cons(%7805, %7806) : (i64, i64) -> i64
      %7808 = func.call @cc_values_pack(%7807) : (i64) -> i64
      func.call @stack_push_pointer(%7805) : (i64) -> ()
      %7809 = llvm.mlir.addressof @str700 : !llvm.ptr
      %7810 = arith.constant 4 : i64
      %7811 = func.call @cc_make_string(%7809, %7810) : (!llvm.ptr, i64) -> i64
      %7812 = llvm.mlir.addressof @str701 : !llvm.ptr
      %7813 = arith.constant 11 : i64
      %7814 = func.call @cc_make_string(%7812, %7813) : (!llvm.ptr, i64) -> i64
      %7815 = func.call @cc_intern(%7811, %7814) : (i64, i64) -> i64
      %7816 = func.call @cc_nil_value() : () -> i64
      %7817 = func.call @cc_cons(%7815, %7816) : (i64, i64) -> i64
      %7818 = func.call @cc_values_pack(%7817) : (i64) -> i64
      func.call @stack_push_pointer(%7815) : (i64) -> ()
      %7819 = llvm.mlir.addressof @str702 : !llvm.ptr
      %7820 = arith.constant 3 : i64
      %7821 = func.call @cc_make_string(%7819, %7820) : (!llvm.ptr, i64) -> i64
      %7822 = func.call @cc_nil_value() : () -> i64
      %7823 = func.call @cc_intern(%7821, %7822) : (i64, i64) -> i64
      %7824 = func.call @cc_nil_value() : () -> i64
      %7825 = func.call @cc_cons(%7823, %7824) : (i64, i64) -> i64
      %7826 = func.call @cc_values_pack(%7825) : (i64) -> i64
      func.call @stack_push_pointer(%7823) : (i64) -> ()
      %7827 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%7827) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7828 = func.call @stack_pop_pointer() : () -> i64
      %7829 = func.call @stack_pop_pointer() : () -> i64
      %7830 = func.call @cc_cons(%7829, %7828) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7830) : (i64) -> ()
      %7831 = func.call @stack_pop_pointer() : () -> i64
      %7832 = func.call @stack_pop_pointer() : () -> i64
      %7833 = func.call @cc_cons(%7832, %7831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7833) : (i64) -> ()
      %7834 = func.call @stack_pop_pointer() : () -> i64
      %7835 = func.call @stack_pop_pointer() : () -> i64
      %7836 = func.call @cc_cons(%7835, %7834) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7836) : (i64) -> ()
      %7837 = llvm.mlir.addressof @str703 : !llvm.ptr
      %7838 = arith.constant 9 : i64
      %7839 = func.call @cc_make_string(%7837, %7838) : (!llvm.ptr, i64) -> i64
      %7840 = llvm.mlir.addressof @str704 : !llvm.ptr
      %7841 = arith.constant 11 : i64
      %7842 = func.call @cc_make_string(%7840, %7841) : (!llvm.ptr, i64) -> i64
      %7843 = func.call @cc_intern(%7839, %7842) : (i64, i64) -> i64
      %7844 = func.call @cc_nil_value() : () -> i64
      %7845 = func.call @cc_cons(%7843, %7844) : (i64, i64) -> i64
      %7846 = func.call @cc_values_pack(%7845) : (i64) -> i64
      func.call @stack_push_pointer(%7843) : (i64) -> ()
      %7847 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%7847) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7848 = func.call @stack_pop_pointer() : () -> i64
      %7849 = func.call @stack_pop_pointer() : () -> i64
      %7850 = func.call @cc_cons(%7849, %7848) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7850) : (i64) -> ()
      %7851 = func.call @stack_pop_pointer() : () -> i64
      %7852 = func.call @stack_pop_pointer() : () -> i64
      %7853 = func.call @cc_cons(%7852, %7851) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7853) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7854 = func.call @stack_pop_pointer() : () -> i64
      %7855 = func.call @stack_pop_pointer() : () -> i64
      %7856 = func.call @cc_cons(%7855, %7854) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7856) : (i64) -> ()
      %7857 = func.call @stack_pop_pointer() : () -> i64
      %7858 = func.call @stack_pop_pointer() : () -> i64
      %7859 = func.call @cc_cons(%7858, %7857) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7859) : (i64) -> ()
      %7860 = func.call @stack_pop_pointer() : () -> i64
      %7861 = func.call @stack_pop_pointer() : () -> i64
      %7862 = func.call @cc_cons(%7861, %7860) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7862) : (i64) -> ()
      %7863 = llvm.mlir.addressof @str705 : !llvm.ptr
      %7864 = arith.constant 3 : i64
      %7865 = func.call @cc_make_string(%7863, %7864) : (!llvm.ptr, i64) -> i64
      %7866 = func.call @cc_nil_value() : () -> i64
      %7867 = func.call @cc_intern(%7865, %7866) : (i64, i64) -> i64
      %7868 = func.call @cc_nil_value() : () -> i64
      %7869 = func.call @cc_cons(%7867, %7868) : (i64, i64) -> i64
      %7870 = func.call @cc_values_pack(%7869) : (i64) -> i64
      func.call @stack_push_pointer(%7867) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7871 = func.call @stack_pop_pointer() : () -> i64
      %7872 = func.call @stack_pop_pointer() : () -> i64
      %7873 = func.call @cc_cons(%7872, %7871) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7873) : (i64) -> ()
      %7874 = func.call @stack_pop_pointer() : () -> i64
      %7875 = func.call @stack_pop_pointer() : () -> i64
      %7876 = func.call @cc_cons(%7875, %7874) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7876) : (i64) -> ()
      %7877 = func.call @stack_pop_pointer() : () -> i64
      %7878 = func.call @stack_pop_pointer() : () -> i64
      %7879 = func.call @cc_cons(%7878, %7877) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7879) : (i64) -> ()
      %7880 = func.call @stack_pop_pointer() : () -> i64
      %7881 = func.call @stack_pop_pointer() : () -> i64
      %7882 = func.call @cc_cons(%7881, %7880) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7882) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7883 = func.call @stack_pop_pointer() : () -> i64
      %7884 = func.call @stack_pop_pointer() : () -> i64
      %7885 = func.call @cc_cons(%7884, %7883) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7885) : (i64) -> ()
      %7886 = func.call @stack_pop_pointer() : () -> i64
      %7887 = func.call @stack_pop_pointer() : () -> i64
      %7888 = func.call @cc_cons(%7887, %7886) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7888) : (i64) -> ()
      %7889 = func.call @stack_pop_pointer() : () -> i64
      %7890 = func.call @stack_pop_pointer() : () -> i64
      %7891 = func.call @cc_cons(%7890, %7889) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7891) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7892 = func.call @stack_pop_pointer() : () -> i64
      %7893 = func.call @stack_pop_pointer() : () -> i64
      %7894 = func.call @cc_cons(%7893, %7892) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7894) : (i64) -> ()
      %7895 = func.call @stack_pop_pointer() : () -> i64
      %7896 = func.call @stack_pop_pointer() : () -> i64
      %7897 = func.call @cc_cons(%7896, %7895) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7897) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %7898 = func.call @stack_pop_pointer() : () -> i64
      %7899 = func.call @stack_pop_pointer() : () -> i64
      %7900 = func.call @cc_cons(%7899, %7898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7900) : (i64) -> ()
      %7901 = func.call @stack_pop_pointer() : () -> i64
      %7902 = func.call @stack_pop_pointer() : () -> i64
      %7903 = func.call @cc_cons(%7902, %7901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7903) : (i64) -> ()
      %7904 = func.call @stack_pop_pointer() : () -> i64
      %8067 = arith.constant 122791386939425 : i64
      %8068 = arith.constant 0 : i64
      %8069 = func.call @cc_make_closure(%8067, %8068) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8069) : (i64) -> ()
      %8070 = func.call @stack_pop_pointer() : () -> i64
      %8071 = llvm.mlir.addressof @str714 : !llvm.ptr
      %8072 = arith.constant 1 : i64
      %8073 = func.call @cc_make_string(%8071, %8072) : (!llvm.ptr, i64) -> i64
      %8074 = func.call @cc_nil_value() : () -> i64
      %8075 = func.call @cc_intern(%8073, %8074) : (i64, i64) -> i64
      %8076 = func.call @cc_nil_value() : () -> i64
      %8077 = func.call @cc_cons(%8075, %8076) : (i64, i64) -> i64
      %8078 = func.call @cc_values_pack(%8077) : (i64) -> i64
      func.call @stack_push_pointer(%8075) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8079 = func.call @stack_pop_pointer() : () -> i64
      %8080 = func.call @stack_pop_pointer() : () -> i64
      %8081 = func.call @cc_cons(%8080, %8079) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8081) : (i64) -> ()
      %8082 = func.call @stack_pop_pointer() : () -> i64
      %8083 = llvm.mlir.addressof @str715 : !llvm.ptr
      %8084 = arith.constant 11 : i64
      %8085 = func.call @cc_make_string(%8083, %8084) : (!llvm.ptr, i64) -> i64
      %8086 = llvm.mlir.addressof @str716 : !llvm.ptr
      %8087 = arith.constant 7 : i64
      %8088 = func.call @cc_make_string(%8086, %8087) : (!llvm.ptr, i64) -> i64
      %8089 = func.call @cc_intern(%8085, %8088) : (i64, i64) -> i64
      %8090 = func.call @cc_nil_value() : () -> i64
      %8091 = func.call @cc_cons(%8089, %8090) : (i64, i64) -> i64
      %8092 = func.call @cc_values_pack(%8091) : (i64) -> i64
      func.call @stack_push_pointer(%8089) : (i64) -> ()
      %8093 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %8094 = func.call @stack_pop_pointer() : () -> i64
      %8095 = llvm.mlir.addressof @str717 : !llvm.ptr
      %8096 = arith.constant 4 : i64
      %8097 = func.call @cc_make_string(%8095, %8096) : (!llvm.ptr, i64) -> i64
      %8098 = llvm.mlir.addressof @str718 : !llvm.ptr
      %8099 = arith.constant 7 : i64
      %8100 = func.call @cc_make_string(%8098, %8099) : (!llvm.ptr, i64) -> i64
      %8101 = func.call @cc_intern(%8097, %8100) : (i64, i64) -> i64
      %8102 = func.call @cc_nil_value() : () -> i64
      %8103 = func.call @cc_cons(%8101, %8102) : (i64, i64) -> i64
      %8104 = func.call @cc_values_pack(%8103) : (i64) -> i64
      func.call @stack_push_pointer(%8101) : (i64) -> ()
      %8105 = func.call @stack_pop_pointer() : () -> i64
      %8106 = llvm.mlir.addressof @str719 : !llvm.ptr
      %8107 = arith.constant 6 : i64
      %8108 = func.call @cc_make_string(%8106, %8107) : (!llvm.ptr, i64) -> i64
      %8109 = func.call @cc_nil_value() : () -> i64
      %8110 = func.call @cc_intern(%8108, %8109) : (i64, i64) -> i64
      %8111 = func.call @cc_nil_value() : () -> i64
      %8112 = func.call @cc_cons(%8110, %8111) : (i64, i64) -> i64
      %8113 = func.call @cc_values_pack(%8112) : (i64) -> i64
      func.call @stack_push_pointer(%8110) : (i64) -> ()
      %8114 = func.call @stack_pop_pointer() : () -> i64
      %8115 = func.call @cc_nil_value() : () -> i64
      %8116 = func.call @cc_errorp(%7608) : (i64) -> i64
      %8117 = arith.cmpi ne, %8116, %8115 : i64
      %8118 = arith.cmpi eq, %8115, %8115 : i64
      %8119 = arith.andi %8117, %8118 : i1
      %8120 = scf.if %8119 -> (i64) {
        scf.yield %7608 : i64
      } else {
        scf.yield %8115 : i64
      }
      %8121 = func.call @cc_errorp(%7904) : (i64) -> i64
      %8122 = arith.cmpi ne, %8121, %8115 : i64
      %8123 = arith.cmpi eq, %8120, %8115 : i64
      %8124 = arith.andi %8122, %8123 : i1
      %8125 = scf.if %8124 -> (i64) {
        scf.yield %7904 : i64
      } else {
        scf.yield %8120 : i64
      }
      %8126 = func.call @cc_errorp(%8070) : (i64) -> i64
      %8127 = arith.cmpi ne, %8126, %8115 : i64
      %8128 = arith.cmpi eq, %8125, %8115 : i64
      %8129 = arith.andi %8127, %8128 : i1
      %8130 = scf.if %8129 -> (i64) {
        scf.yield %8070 : i64
      } else {
        scf.yield %8125 : i64
      }
      %8131 = func.call @cc_errorp(%8082) : (i64) -> i64
      %8132 = arith.cmpi ne, %8131, %8115 : i64
      %8133 = arith.cmpi eq, %8130, %8115 : i64
      %8134 = arith.andi %8132, %8133 : i1
      %8135 = scf.if %8134 -> (i64) {
        scf.yield %8082 : i64
      } else {
        scf.yield %8130 : i64
      }
      %8136 = func.call @cc_errorp(%8093) : (i64) -> i64
      %8137 = arith.cmpi ne, %8136, %8115 : i64
      %8138 = arith.cmpi eq, %8135, %8115 : i64
      %8139 = arith.andi %8137, %8138 : i1
      %8140 = scf.if %8139 -> (i64) {
        scf.yield %8093 : i64
      } else {
        scf.yield %8135 : i64
      }
      %8141 = func.call @cc_errorp(%8094) : (i64) -> i64
      %8142 = arith.cmpi ne, %8141, %8115 : i64
      %8143 = arith.cmpi eq, %8140, %8115 : i64
      %8144 = arith.andi %8142, %8143 : i1
      %8145 = scf.if %8144 -> (i64) {
        scf.yield %8094 : i64
      } else {
        scf.yield %8140 : i64
      }
      %8146 = func.call @cc_errorp(%8105) : (i64) -> i64
      %8147 = arith.cmpi ne, %8146, %8115 : i64
      %8148 = arith.cmpi eq, %8145, %8115 : i64
      %8149 = arith.andi %8147, %8148 : i1
      %8150 = scf.if %8149 -> (i64) {
        scf.yield %8105 : i64
      } else {
        scf.yield %8145 : i64
      }
      %8151 = func.call @cc_errorp(%8114) : (i64) -> i64
      %8152 = arith.cmpi ne, %8151, %8115 : i64
      %8153 = arith.cmpi eq, %8150, %8115 : i64
      %8154 = arith.andi %8152, %8153 : i1
      %8155 = scf.if %8154 -> (i64) {
        scf.yield %8114 : i64
      } else {
        scf.yield %8150 : i64
      }
      %8156 = arith.cmpi ne, %8155, %8115 : i64
      scf.if %8156 {
        func.call @stack_push_pointer(%8155) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7608) : (i64) -> ()
        func.call @stack_push_pointer(%7904) : (i64) -> ()
        func.call @stack_push_pointer(%8070) : (i64) -> ()
        func.call @stack_push_pointer(%8082) : (i64) -> ()
        func.call @stack_push_pointer(%8093) : (i64) -> ()
        func.call @stack_push_pointer(%8094) : (i64) -> ()
        func.call @stack_push_pointer(%8105) : (i64) -> ()
        func.call @stack_push_pointer(%8114) : (i64) -> ()
        %8157 = llvm.mlir.addressof @str720 : !llvm.ptr
        %8158 = func.call @cc_make_function_ref_const(%8157) : (!llvm.ptr) -> i64
        %8159 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8158, %8159) : (i64, i64) -> ()
      }
      %8160 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8160 : i64
    }
    %8161 = func.call @cc_nil_value() : () -> i64
    %8162 = func.call @cc_errorp(%7599) : (i64) -> i64
    %8163 = arith.cmpi ne, %8162, %8161 : i64
    %8164 = scf.if %8163 -> (i64) {
      scf.yield %7599 : i64
    } else {
      %8165 = llvm.mlir.addressof @str721 : !llvm.ptr
      %8166 = arith.constant 22 : i64
      %8167 = func.call @cc_make_string(%8165, %8166) : (!llvm.ptr, i64) -> i64
      %8168 = func.call @cc_nil_value() : () -> i64
      %8169 = func.call @cc_intern(%8167, %8168) : (i64, i64) -> i64
      %8170 = func.call @cc_nil_value() : () -> i64
      %8171 = func.call @cc_cons(%8169, %8170) : (i64, i64) -> i64
      %8172 = func.call @cc_values_pack(%8171) : (i64) -> i64
      func.call @stack_push_pointer(%8169) : (i64) -> ()
      %8173 = func.call @stack_pop_pointer() : () -> i64
      %8174 = llvm.mlir.addressof @str722 : !llvm.ptr
      %8175 = arith.constant 3 : i64
      %8176 = func.call @cc_make_string(%8174, %8175) : (!llvm.ptr, i64) -> i64
      %8177 = func.call @cc_nil_value() : () -> i64
      %8178 = func.call @cc_intern(%8176, %8177) : (i64, i64) -> i64
      %8179 = func.call @cc_nil_value() : () -> i64
      %8180 = func.call @cc_cons(%8178, %8179) : (i64, i64) -> i64
      %8181 = func.call @cc_values_pack(%8180) : (i64) -> i64
      func.call @stack_push_pointer(%8178) : (i64) -> ()
      %8182 = llvm.mlir.addressof @str723 : !llvm.ptr
      %8183 = arith.constant 3 : i64
      %8184 = func.call @cc_make_string(%8182, %8183) : (!llvm.ptr, i64) -> i64
      %8185 = func.call @cc_nil_value() : () -> i64
      %8186 = func.call @cc_intern(%8184, %8185) : (i64, i64) -> i64
      %8187 = func.call @cc_nil_value() : () -> i64
      %8188 = func.call @cc_cons(%8186, %8187) : (i64, i64) -> i64
      %8189 = func.call @cc_values_pack(%8188) : (i64) -> i64
      func.call @stack_push_pointer(%8186) : (i64) -> ()
      %8190 = llvm.mlir.addressof @str724 : !llvm.ptr
      %8191 = arith.constant 5 : i64
      %8192 = func.call @cc_make_string(%8190, %8191) : (!llvm.ptr, i64) -> i64
      %8193 = llvm.mlir.addressof @str725 : !llvm.ptr
      %8194 = arith.constant 11 : i64
      %8195 = func.call @cc_make_string(%8193, %8194) : (!llvm.ptr, i64) -> i64
      %8196 = func.call @cc_intern(%8192, %8195) : (i64, i64) -> i64
      %8197 = func.call @cc_nil_value() : () -> i64
      %8198 = func.call @cc_cons(%8196, %8197) : (i64, i64) -> i64
      %8199 = func.call @cc_values_pack(%8198) : (i64) -> i64
      func.call @stack_push_pointer(%8196) : (i64) -> ()
      %8200 = llvm.mlir.addressof @str726 : !llvm.ptr
      %8201 = arith.constant 7 : i64
      %8202 = func.call @cc_make_string(%8200, %8201) : (!llvm.ptr, i64) -> i64
      %8203 = llvm.mlir.addressof @str727 : !llvm.ptr
      %8204 = arith.constant 11 : i64
      %8205 = func.call @cc_make_string(%8203, %8204) : (!llvm.ptr, i64) -> i64
      %8206 = func.call @cc_intern(%8202, %8205) : (i64, i64) -> i64
      %8207 = func.call @cc_nil_value() : () -> i64
      %8208 = func.call @cc_cons(%8206, %8207) : (i64, i64) -> i64
      %8209 = func.call @cc_values_pack(%8208) : (i64) -> i64
      func.call @stack_push_pointer(%8206) : (i64) -> ()
      %8210 = llvm.mlir.addressof @str728 : !llvm.ptr
      %8211 = arith.constant 26 : i64
      %8212 = func.call @cc_make_string(%8210, %8211) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8212) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8213 = func.call @stack_pop_pointer() : () -> i64
      %8214 = func.call @stack_pop_pointer() : () -> i64
      %8215 = func.call @cc_cons(%8214, %8213) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8215) : (i64) -> ()
      %8216 = func.call @stack_pop_pointer() : () -> i64
      %8217 = func.call @stack_pop_pointer() : () -> i64
      %8218 = func.call @cc_cons(%8217, %8216) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8218) : (i64) -> ()
      %8219 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%8219) : (i64) -> ()
      %8220 = llvm.mlir.addressof @str729 : !llvm.ptr
      %8221 = arith.constant 12 : i64
      %8222 = func.call @cc_make_string(%8220, %8221) : (!llvm.ptr, i64) -> i64
      %8223 = llvm.mlir.addressof @str730 : !llvm.ptr
      %8224 = arith.constant 11 : i64
      %8225 = func.call @cc_make_string(%8223, %8224) : (!llvm.ptr, i64) -> i64
      %8226 = func.call @cc_intern(%8222, %8225) : (i64, i64) -> i64
      %8227 = func.call @cc_nil_value() : () -> i64
      %8228 = func.call @cc_cons(%8226, %8227) : (i64, i64) -> i64
      %8229 = func.call @cc_values_pack(%8228) : (i64) -> i64
      func.call @stack_push_pointer(%8226) : (i64) -> ()
      %8230 = llvm.mlir.addressof @str731 : !llvm.ptr
      %8231 = arith.constant 9 : i64
      %8232 = func.call @cc_make_string(%8230, %8231) : (!llvm.ptr, i64) -> i64
      %8233 = llvm.mlir.addressof @str732 : !llvm.ptr
      %8234 = arith.constant 11 : i64
      %8235 = func.call @cc_make_string(%8233, %8234) : (!llvm.ptr, i64) -> i64
      %8236 = func.call @cc_intern(%8232, %8235) : (i64, i64) -> i64
      %8237 = func.call @cc_nil_value() : () -> i64
      %8238 = func.call @cc_cons(%8236, %8237) : (i64, i64) -> i64
      %8239 = func.call @cc_values_pack(%8238) : (i64) -> i64
      func.call @stack_push_pointer(%8236) : (i64) -> ()
      %8240 = arith.constant 17 : i64
      func.call @stack_push_fixnum(%8240) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8241 = func.call @stack_pop_pointer() : () -> i64
      %8242 = func.call @stack_pop_pointer() : () -> i64
      %8243 = func.call @cc_cons(%8242, %8241) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8243) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8244 = func.call @stack_pop_pointer() : () -> i64
      %8245 = func.call @stack_pop_pointer() : () -> i64
      %8246 = func.call @cc_cons(%8245, %8244) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8246) : (i64) -> ()
      %8247 = func.call @stack_pop_pointer() : () -> i64
      %8248 = func.call @stack_pop_pointer() : () -> i64
      %8249 = func.call @cc_cons(%8248, %8247) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8249) : (i64) -> ()
      %8250 = func.call @stack_pop_pointer() : () -> i64
      %8251 = func.call @stack_pop_pointer() : () -> i64
      %8252 = func.call @cc_cons(%8251, %8250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8252) : (i64) -> ()
      %8253 = func.call @stack_pop_pointer() : () -> i64
      %8254 = func.call @stack_pop_pointer() : () -> i64
      %8255 = func.call @cc_cons(%8253, %8254) : (i64, i64) -> i64
      %8256 = llvm.mlir.addressof @str733 : !llvm.ptr
      %8257 = arith.constant 5 : i64
      %8258 = func.call @cc_make_string(%8256, %8257) : (!llvm.ptr, i64) -> i64
      %8259 = func.call @cc_nil_value() : () -> i64
      %8260 = func.call @cc_intern(%8258, %8259) : (i64, i64) -> i64
      %8261 = func.call @cc_nil_value() : () -> i64
      %8262 = func.call @cc_cons(%8260, %8261) : (i64, i64) -> i64
      %8263 = func.call @cc_values_pack(%8262) : (i64) -> i64
      %8264 = func.call @cc_cons(%8260, %8255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8264) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8265 = func.call @stack_pop_pointer() : () -> i64
      %8266 = func.call @stack_pop_pointer() : () -> i64
      %8267 = func.call @cc_cons(%8266, %8265) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8267) : (i64) -> ()
      %8268 = func.call @stack_pop_pointer() : () -> i64
      %8269 = func.call @stack_pop_pointer() : () -> i64
      %8270 = func.call @cc_cons(%8269, %8268) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8270) : (i64) -> ()
      %8271 = func.call @stack_pop_pointer() : () -> i64
      %8272 = func.call @stack_pop_pointer() : () -> i64
      %8273 = func.call @cc_cons(%8272, %8271) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8273) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8274 = func.call @stack_pop_pointer() : () -> i64
      %8275 = func.call @stack_pop_pointer() : () -> i64
      %8276 = func.call @cc_cons(%8275, %8274) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8276) : (i64) -> ()
      %8277 = func.call @stack_pop_pointer() : () -> i64
      %8278 = func.call @stack_pop_pointer() : () -> i64
      %8279 = func.call @cc_cons(%8278, %8277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8279) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8280 = func.call @stack_pop_pointer() : () -> i64
      %8281 = func.call @stack_pop_pointer() : () -> i64
      %8282 = func.call @cc_cons(%8281, %8280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8282) : (i64) -> ()
      %8283 = func.call @stack_pop_pointer() : () -> i64
      %8284 = func.call @stack_pop_pointer() : () -> i64
      %8285 = func.call @cc_cons(%8284, %8283) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8285) : (i64) -> ()
      %8286 = func.call @stack_pop_pointer() : () -> i64
      %8342 = arith.constant 122791386939426 : i64
      %8343 = arith.constant 0 : i64
      %8344 = func.call @cc_make_closure(%8342, %8343) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8344) : (i64) -> ()
      %8345 = func.call @stack_pop_pointer() : () -> i64
      %8346 = llvm.mlir.addressof @str739 : !llvm.ptr
      %8347 = arith.constant 1 : i64
      %8348 = func.call @cc_make_string(%8346, %8347) : (!llvm.ptr, i64) -> i64
      %8349 = func.call @cc_nil_value() : () -> i64
      %8350 = func.call @cc_intern(%8348, %8349) : (i64, i64) -> i64
      %8351 = func.call @cc_nil_value() : () -> i64
      %8352 = func.call @cc_cons(%8350, %8351) : (i64, i64) -> i64
      %8353 = func.call @cc_values_pack(%8352) : (i64) -> i64
      func.call @stack_push_pointer(%8350) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8354 = func.call @stack_pop_pointer() : () -> i64
      %8355 = func.call @stack_pop_pointer() : () -> i64
      %8356 = func.call @cc_cons(%8355, %8354) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8356) : (i64) -> ()
      %8357 = func.call @stack_pop_pointer() : () -> i64
      %8358 = llvm.mlir.addressof @str740 : !llvm.ptr
      %8359 = arith.constant 11 : i64
      %8360 = func.call @cc_make_string(%8358, %8359) : (!llvm.ptr, i64) -> i64
      %8361 = llvm.mlir.addressof @str741 : !llvm.ptr
      %8362 = arith.constant 7 : i64
      %8363 = func.call @cc_make_string(%8361, %8362) : (!llvm.ptr, i64) -> i64
      %8364 = func.call @cc_intern(%8360, %8363) : (i64, i64) -> i64
      %8365 = func.call @cc_nil_value() : () -> i64
      %8366 = func.call @cc_cons(%8364, %8365) : (i64, i64) -> i64
      %8367 = func.call @cc_values_pack(%8366) : (i64) -> i64
      func.call @stack_push_pointer(%8364) : (i64) -> ()
      %8368 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %8369 = func.call @stack_pop_pointer() : () -> i64
      %8370 = llvm.mlir.addressof @str742 : !llvm.ptr
      %8371 = arith.constant 4 : i64
      %8372 = func.call @cc_make_string(%8370, %8371) : (!llvm.ptr, i64) -> i64
      %8373 = llvm.mlir.addressof @str743 : !llvm.ptr
      %8374 = arith.constant 7 : i64
      %8375 = func.call @cc_make_string(%8373, %8374) : (!llvm.ptr, i64) -> i64
      %8376 = func.call @cc_intern(%8372, %8375) : (i64, i64) -> i64
      %8377 = func.call @cc_nil_value() : () -> i64
      %8378 = func.call @cc_cons(%8376, %8377) : (i64, i64) -> i64
      %8379 = func.call @cc_values_pack(%8378) : (i64) -> i64
      func.call @stack_push_pointer(%8376) : (i64) -> ()
      %8380 = func.call @stack_pop_pointer() : () -> i64
      %8381 = llvm.mlir.addressof @str744 : !llvm.ptr
      %8382 = arith.constant 6 : i64
      %8383 = func.call @cc_make_string(%8381, %8382) : (!llvm.ptr, i64) -> i64
      %8384 = func.call @cc_nil_value() : () -> i64
      %8385 = func.call @cc_intern(%8383, %8384) : (i64, i64) -> i64
      %8386 = func.call @cc_nil_value() : () -> i64
      %8387 = func.call @cc_cons(%8385, %8386) : (i64, i64) -> i64
      %8388 = func.call @cc_values_pack(%8387) : (i64) -> i64
      func.call @stack_push_pointer(%8385) : (i64) -> ()
      %8389 = func.call @stack_pop_pointer() : () -> i64
      %8390 = func.call @cc_nil_value() : () -> i64
      %8391 = func.call @cc_errorp(%8173) : (i64) -> i64
      %8392 = arith.cmpi ne, %8391, %8390 : i64
      %8393 = arith.cmpi eq, %8390, %8390 : i64
      %8394 = arith.andi %8392, %8393 : i1
      %8395 = scf.if %8394 -> (i64) {
        scf.yield %8173 : i64
      } else {
        scf.yield %8390 : i64
      }
      %8396 = func.call @cc_errorp(%8286) : (i64) -> i64
      %8397 = arith.cmpi ne, %8396, %8390 : i64
      %8398 = arith.cmpi eq, %8395, %8390 : i64
      %8399 = arith.andi %8397, %8398 : i1
      %8400 = scf.if %8399 -> (i64) {
        scf.yield %8286 : i64
      } else {
        scf.yield %8395 : i64
      }
      %8401 = func.call @cc_errorp(%8345) : (i64) -> i64
      %8402 = arith.cmpi ne, %8401, %8390 : i64
      %8403 = arith.cmpi eq, %8400, %8390 : i64
      %8404 = arith.andi %8402, %8403 : i1
      %8405 = scf.if %8404 -> (i64) {
        scf.yield %8345 : i64
      } else {
        scf.yield %8400 : i64
      }
      %8406 = func.call @cc_errorp(%8357) : (i64) -> i64
      %8407 = arith.cmpi ne, %8406, %8390 : i64
      %8408 = arith.cmpi eq, %8405, %8390 : i64
      %8409 = arith.andi %8407, %8408 : i1
      %8410 = scf.if %8409 -> (i64) {
        scf.yield %8357 : i64
      } else {
        scf.yield %8405 : i64
      }
      %8411 = func.call @cc_errorp(%8368) : (i64) -> i64
      %8412 = arith.cmpi ne, %8411, %8390 : i64
      %8413 = arith.cmpi eq, %8410, %8390 : i64
      %8414 = arith.andi %8412, %8413 : i1
      %8415 = scf.if %8414 -> (i64) {
        scf.yield %8368 : i64
      } else {
        scf.yield %8410 : i64
      }
      %8416 = func.call @cc_errorp(%8369) : (i64) -> i64
      %8417 = arith.cmpi ne, %8416, %8390 : i64
      %8418 = arith.cmpi eq, %8415, %8390 : i64
      %8419 = arith.andi %8417, %8418 : i1
      %8420 = scf.if %8419 -> (i64) {
        scf.yield %8369 : i64
      } else {
        scf.yield %8415 : i64
      }
      %8421 = func.call @cc_errorp(%8380) : (i64) -> i64
      %8422 = arith.cmpi ne, %8421, %8390 : i64
      %8423 = arith.cmpi eq, %8420, %8390 : i64
      %8424 = arith.andi %8422, %8423 : i1
      %8425 = scf.if %8424 -> (i64) {
        scf.yield %8380 : i64
      } else {
        scf.yield %8420 : i64
      }
      %8426 = func.call @cc_errorp(%8389) : (i64) -> i64
      %8427 = arith.cmpi ne, %8426, %8390 : i64
      %8428 = arith.cmpi eq, %8425, %8390 : i64
      %8429 = arith.andi %8427, %8428 : i1
      %8430 = scf.if %8429 -> (i64) {
        scf.yield %8389 : i64
      } else {
        scf.yield %8425 : i64
      }
      %8431 = arith.cmpi ne, %8430, %8390 : i64
      scf.if %8431 {
        func.call @stack_push_pointer(%8430) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%8173) : (i64) -> ()
        func.call @stack_push_pointer(%8286) : (i64) -> ()
        func.call @stack_push_pointer(%8345) : (i64) -> ()
        func.call @stack_push_pointer(%8357) : (i64) -> ()
        func.call @stack_push_pointer(%8368) : (i64) -> ()
        func.call @stack_push_pointer(%8369) : (i64) -> ()
        func.call @stack_push_pointer(%8380) : (i64) -> ()
        func.call @stack_push_pointer(%8389) : (i64) -> ()
        %8432 = llvm.mlir.addressof @str745 : !llvm.ptr
        %8433 = func.call @cc_make_function_ref_const(%8432) : (!llvm.ptr) -> i64
        %8434 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%8433, %8434) : (i64, i64) -> ()
      }
      %8435 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8435 : i64
    }
    func.call @stack_push_pointer(%8164) : (i64) -> ()
    %8436 = func.call @stack_pop_pointer() : () -> i64
    %8437 = func.call @cc_multiple_value_list(%8436) : (i64) -> i64
    %8438 = llvm.mlir.addressof @str746 : !llvm.ptr
    %8439 = arith.constant 38 : i64
    %8440 = func.call @cc_make_string(%8438, %8439) : (!llvm.ptr, i64) -> i64
    %8441 = func.call @cc_nil_value() : () -> i64
    %8442 = func.call @cc_intern(%8440, %8441) : (i64, i64) -> i64
    %8443 = func.call @cc_nil_value() : () -> i64
    %8444 = func.call @cc_cons(%8442, %8443) : (i64, i64) -> i64
    %8445 = func.call @cc_values_pack(%8444) : (i64) -> i64
    %8446 = func.call @cc_symbol_value(%8442) : (i64) -> i64
    %8447 = llvm.mlir.addressof @str747 : !llvm.ptr
    %8448 = arith.constant 40 : i64
    %8449 = func.call @cc_make_string(%8447, %8448) : (!llvm.ptr, i64) -> i64
    %8450 = func.call @cc_nil_value() : () -> i64
    %8451 = func.call @cc_intern(%8449, %8450) : (i64, i64) -> i64
    %8452 = func.call @cc_nil_value() : () -> i64
    %8453 = func.call @cc_cons(%8451, %8452) : (i64, i64) -> i64
    %8454 = func.call @cc_values_pack(%8453) : (i64) -> i64
    %8455 = func.call @cc_symbol_value(%8451) : (i64) -> i64
    %8456 = func.call @cc_nil_value() : () -> i64
    %8457 = arith.cmpi ne, %8446, %8456 : i64
    %8458 = scf.if %8457 -> (i64) {
      scf.yield %8455 : i64
    } else {
      scf.yield %8437 : i64
    }
    %8459 = func.call @cc_values_pack(%8458) : (i64) -> i64
    func.call @stack_push_pointer(%8459) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_122791386939393"() {
    %128 = func.call @cc_nil_value() : () -> i64
    %129 = func.call @cc_nil_value() : () -> i64
    %130 = func.call @cc_errorp(%128) : (i64) -> i64
    %131 = arith.cmpi ne, %130, %129 : i64
    %132 = scf.if %131 -> (i64) {
      scf.yield %128 : i64
    } else {
      %133 = llvm.mlir.addressof @str12 : !llvm.ptr
      %134 = arith.constant 3 : i64
      %135 = func.call @cc_make_string(%133, %134) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%135) : (i64) -> ()
      %136 = func.call @stack_pop_pointer() : () -> i64
      %137 = func.call @cc_nil_value() : () -> i64
      %138 = func.call @cc_nil_value() : () -> i64
      %139 = func.call @cc_errorp(%137) : (i64) -> i64
      %140 = arith.cmpi ne, %139, %138 : i64
      %141 = scf.if %140 -> (i64) {
        scf.yield %137 : i64
      } else {
        func.call @stack_push_pointer(%136) : (i64) -> ()
        %142 = func.call @stack_pop_pointer() : () -> i64
        %143 = func.call @cc_reverse(%142) : (i64) -> i64
        func.call @stack_push_pointer(%143) : (i64) -> ()
        %144 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %144 : i64
      }
      func.call @stack_push_pointer(%141) : (i64) -> ()
      %145 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %145 : i64
    }
    func.call @stack_push_pointer(%132) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939394"() {
    %325 = func.call @cc_nil_value() : () -> i64
    %326 = func.call @cc_nil_value() : () -> i64
    %327 = func.call @cc_errorp(%325) : (i64) -> i64
    %328 = arith.cmpi ne, %327, %326 : i64
    %329 = scf.if %328 -> (i64) {
      scf.yield %325 : i64
    } else {
      %330 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %331 = func.call @cc_nil_value() : () -> i64
      %332 = func.call @cc_nil_value() : () -> i64
      %333 = func.call @cc_errorp(%331) : (i64) -> i64
      %334 = arith.cmpi ne, %333, %332 : i64
      %335 = scf.if %334 -> (i64) {
        scf.yield %331 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %336 = llvm.mlir.addressof @str29 : !llvm.ptr
        %337 = arith.constant 3 : i64
        %338 = func.call @cc_make_string(%336, %337) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%338) : (i64) -> ()
        %339 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%339) : (i64) -> ()
        %340 = arith.constant 5 : i64
        func.call @stack_push_fixnum(%340) : (i64) -> ()
        %341 = func.call @stack_pop_pointer() : () -> i64
        %342 = func.call @stack_pop_pointer() : () -> i64
        %343 = func.call @stack_pop_pointer() : () -> i64
        %344 = func.call @cc_subseq(%343, %342, %341) : (i64, i64, i64) -> i64
        func.call @stack_push_pointer(%344) : (i64) -> ()
        %345 = func.call @stack_pop_pointer() : () -> i64
        %346 = func.call @cc_errorp(%345) : (i64) -> i64
        %347 = func.call @cc_nil_value() : () -> i64
        %348 = arith.cmpi ne, %346, %347 : i64
        scf.if %348 {
          func.call @stack_push_pointer(%345) : (i64) -> ()
        } else {
          %349 = func.call @cc_multiple_value_list(%345) : (i64) -> i64
          func.call @stack_push_pointer(%349) : (i64) -> ()
        }
        %350 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %351 = func.call @stack_pop_pointer() : () -> i64
        %352 = func.call @cc_nil_value() : () -> i64
        %353 = func.call @cc_maybe_error_from_multiple_value_list(%350) : (i64) -> i64
        %354 = func.call @cc_errorp(%353) : (i64) -> i64
        %355 = arith.cmpi ne, %354, %352 : i64
        %356 = arith.cmpi eq, %352, %352 : i64
        %357 = arith.andi %355, %356 : i1
        %358 = scf.if %357 -> (i64) {
          scf.yield %353 : i64
        } else {
          scf.yield %352 : i64
        }
        %359 = arith.cmpi ne, %358, %352 : i64
        scf.if %359 {
          func.call @stack_push_pointer(%358) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %360 = func.call @stack_pop_pointer() : () -> i64
          %361 = func.call @cc_cons(%351, %360) : (i64, i64) -> i64
          func.call @stack_push_pointer(%361) : (i64) -> ()
          %362 = func.call @stack_pop_pointer() : () -> i64
          %363 = func.call @cc_cons(%350, %362) : (i64, i64) -> i64
          func.call @stack_push_pointer(%363) : (i64) -> ()
          %364 = func.call @stack_pop_pointer() : () -> i64
          %365 = func.call @cc_values_pack(%364) : (i64) -> i64
          func.call @stack_push_pointer(%365) : (i64) -> ()
        }
        %366 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %366 : i64
      }
      func.call @stack_push_pointer(%335) : (i64) -> ()
      %367 = func.call @stack_pop_pointer() : () -> i64
      %368 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %369 = func.call @cc_errorp(%367) : (i64) -> i64
      %370 = func.call @cc_nil_value() : () -> i64
      %371 = arith.cmpi ne, %369, %370 : i64
      scf.if %371 {
        %372 = func.call @cc_condition_value(%367) : (i64) -> i64
        %373 = func.call @cc_values2(%370, %372) : (i64, i64) -> i64
        func.call @stack_push_pointer(%373) : (i64) -> ()
      } else {
        %374 = func.call @cc_multiple_value_list(%367) : (i64) -> i64
        %375 = func.call @cc_values_pack(%374) : (i64) -> i64
        func.call @stack_push_pointer(%375) : (i64) -> ()
      }
      %376 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %376 : i64
    }
    func.call @stack_push_pointer(%329) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939395"() {
    %573 = func.call @cc_nil_value() : () -> i64
    %574 = func.call @cc_nil_value() : () -> i64
    %575 = func.call @cc_errorp(%573) : (i64) -> i64
    %576 = arith.cmpi ne, %575, %574 : i64
    %577 = scf.if %576 -> (i64) {
      scf.yield %573 : i64
    } else {
      %578 = arith.constant 97 : i64
      %579 = func.call @cc_box_character(%578) : (i64) -> i64
      func.call @stack_push_pointer(%579) : (i64) -> ()
      %580 = arith.constant 0 : i64
      %581 = func.call @cc_box_character(%580) : (i64) -> i64
      func.call @stack_push_pointer(%581) : (i64) -> ()
      %582 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%582) : (i64) -> ()
      %583 = func.call @stack_pop_pointer() : () -> i64
      %584 = arith.constant 0 : i64
      %585 = func.call @cc_box_character(%584) : (i64) -> i64
      func.call @stack_push_pointer(%585) : (i64) -> ()
      %586 = func.call @stack_pop_pointer() : () -> i64
      %587 = func.call @cc_make_string_repeat(%583, %586) : (i64, i64) -> i64
      func.call @stack_push_pointer(%587) : (i64) -> ()
      %588 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%588) : (i64) -> ()
      %589 = llvm.mlir.addressof @str47 : !llvm.ptr
      %590 = func.call @cc_make_function_ref_const(%589) : (!llvm.ptr) -> i64
      %591 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%590, %591) : (i64, i64) -> ()
      %592 = func.call @stack_pop_pointer() : () -> i64
      %593 = func.call @stack_pop_pointer() : () -> i64
      %594 = func.call @stack_pop_pointer() : () -> i64
      %595 = func.call @cc_substitute(%594, %593, %592) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%595) : (i64) -> ()
      %596 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %596 : i64
    }
    func.call @stack_push_pointer(%577) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939396"() {
    %820 = func.call @cc_nil_value() : () -> i64
    %821 = func.call @cc_nil_value() : () -> i64
    %822 = func.call @cc_errorp(%820) : (i64) -> i64
    %823 = arith.cmpi ne, %822, %821 : i64
    %824 = scf.if %823 -> (i64) {
      scf.yield %820 : i64
    } else {
      %825 = arith.constant 88 : i64
      %826 = func.call @cc_box_character(%825) : (i64) -> i64
      func.call @stack_push_pointer(%826) : (i64) -> ()
      %827 = arith.constant 0 : i64
      %828 = func.call @cc_box_character(%827) : (i64) -> i64
      func.call @stack_push_pointer(%828) : (i64) -> ()
      %829 = func.call @cc_make_string_output_stream() : () -> i64
      %830 = arith.constant 0 : i64
      %831 = func.call @cc_box_character(%830) : (i64) -> i64
      func.call @stack_push_pointer(%831) : (i64) -> ()
      %832 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%829) : (i64) -> ()
      %833 = func.call @stack_pop_pointer() : () -> i64
      %834 = func.call @cc_nil_value() : () -> i64
      %835 = func.call @cc_errorp(%832) : (i64) -> i64
      %836 = arith.cmpi ne, %835, %834 : i64
      %837 = arith.cmpi eq, %834, %834 : i64
      %838 = arith.andi %836, %837 : i1
      %839 = scf.if %838 -> (i64) {
        scf.yield %832 : i64
      } else {
        scf.yield %834 : i64
      }
      %840 = func.call @cc_errorp(%833) : (i64) -> i64
      %841 = arith.cmpi ne, %840, %834 : i64
      %842 = arith.cmpi eq, %839, %834 : i64
      %843 = arith.andi %841, %842 : i1
      %844 = scf.if %843 -> (i64) {
        scf.yield %833 : i64
      } else {
        scf.yield %839 : i64
      }
      %845 = arith.cmpi ne, %844, %834 : i64
      scf.if %845 {
        func.call @stack_push_pointer(%844) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%832) : (i64) -> ()
        func.call @stack_push_pointer(%833) : (i64) -> ()
        %846 = llvm.mlir.addressof @str69 : !llvm.ptr
        %847 = func.call @cc_make_function_ref_const(%846) : (!llvm.ptr) -> i64
        %848 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%847, %848) : (i64, i64) -> ()
      }
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @cc_nil_value() : () -> i64
      %851 = func.call @cc_errorp(%849) : (i64) -> i64
      %852 = arith.cmpi ne, %851, %850 : i64
      %853 = scf.if %852 -> (i64) {
        scf.yield %849 : i64
      } else {
        %854 = llvm.mlir.addressof @str70 : !llvm.ptr
        %855 = arith.constant 3 : i64
        %856 = func.call @cc_make_string(%854, %855) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%856) : (i64) -> ()
        %857 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%829) : (i64) -> ()
        %858 = func.call @stack_pop_pointer() : () -> i64
        %859 = func.call @cc_nil_value() : () -> i64
        %860 = func.call @cc_errorp(%857) : (i64) -> i64
        %861 = arith.cmpi ne, %860, %859 : i64
        %862 = arith.cmpi eq, %859, %859 : i64
        %863 = arith.andi %861, %862 : i1
        %864 = scf.if %863 -> (i64) {
          scf.yield %857 : i64
        } else {
          scf.yield %859 : i64
        }
        %865 = func.call @cc_errorp(%858) : (i64) -> i64
        %866 = arith.cmpi ne, %865, %859 : i64
        %867 = arith.cmpi eq, %864, %859 : i64
        %868 = arith.andi %866, %867 : i1
        %869 = scf.if %868 -> (i64) {
          scf.yield %858 : i64
        } else {
          scf.yield %864 : i64
        }
        %870 = arith.cmpi ne, %869, %859 : i64
        scf.if %870 {
          func.call @stack_push_pointer(%869) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%857) : (i64) -> ()
          func.call @stack_push_pointer(%858) : (i64) -> ()
          %871 = llvm.mlir.addressof @str71 : !llvm.ptr
          %872 = func.call @cc_make_function_ref_const(%871) : (!llvm.ptr) -> i64
          %873 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%872, %873) : (i64, i64) -> ()
        }
        %874 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %874 : i64
      }
      %875 = func.call @cc_nil_value() : () -> i64
      %876 = func.call @cc_errorp(%853) : (i64) -> i64
      %877 = arith.cmpi ne, %876, %875 : i64
      %878 = scf.if %877 -> (i64) {
        scf.yield %853 : i64
      } else {
        %879 = func.call @cc_get_output_stream_string(%829) : (i64) -> i64
        scf.yield %879 : i64
      }
      func.call @stack_push_pointer(%878) : (i64) -> ()
      %880 = func.call @stack_pop_pointer() : () -> i64
      %881 = func.call @stack_pop_pointer() : () -> i64
      %882 = func.call @stack_pop_pointer() : () -> i64
      %883 = func.call @cc_substitute(%882, %881, %880) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%883) : (i64) -> ()
      %884 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %884 : i64
    }
    func.call @stack_push_pointer(%824) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939397"() {
    %1101 = func.call @cc_nil_value() : () -> i64
    %1102 = func.call @cc_nil_value() : () -> i64
    %1103 = func.call @cc_errorp(%1101) : (i64) -> i64
    %1104 = arith.cmpi ne, %1103, %1102 : i64
    %1105 = scf.if %1104 -> (i64) {
      scf.yield %1101 : i64
    } else {
      %1106 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1107 = arith.constant 6 : i64
      %1108 = func.call @cc_make_string(%1106, %1107) : (!llvm.ptr, i64) -> i64
      %1109 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1110 = arith.constant 11 : i64
      %1111 = func.call @cc_make_string(%1109, %1110) : (!llvm.ptr, i64) -> i64
      %1112 = func.call @cc_intern(%1108, %1111) : (i64, i64) -> i64
      %1113 = func.call @cc_nil_value() : () -> i64
      %1114 = func.call @cc_cons(%1112, %1113) : (i64, i64) -> i64
      %1115 = func.call @cc_values_pack(%1114) : (i64) -> i64
      func.call @stack_push_pointer(%1112) : (i64) -> ()
      %1116 = func.call @stack_pop_pointer() : () -> i64
      %1117 = func.call @cc_nil_value() : () -> i64
      %1118 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1119 = arith.constant 3 : i64
      %1120 = func.call @cc_make_string(%1118, %1119) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1120) : (i64) -> ()
      %1121 = func.call @stack_pop_pointer() : () -> i64
      %1122 = func.call @cc_cons(%1121, %1117) : (i64, i64) -> i64
      %1123 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1123) : (i64) -> ()
      %1124 = func.call @stack_pop_pointer() : () -> i64
      %1125 = arith.constant 0 : i64
      %1126 = func.call @cc_box_character(%1125) : (i64) -> i64
      func.call @stack_push_pointer(%1126) : (i64) -> ()
      %1127 = func.call @stack_pop_pointer() : () -> i64
      %1128 = func.call @cc_make_string_repeat(%1124, %1127) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1128) : (i64) -> ()
      %1129 = func.call @stack_pop_pointer() : () -> i64
      %1130 = func.call @cc_cons(%1129, %1122) : (i64, i64) -> i64
      %1131 = func.call @cc_concatenate(%1116, %1130) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1131) : (i64) -> ()
      %1132 = func.call @stack_pop_pointer() : () -> i64
      %1133 = func.call @cc_nil_value() : () -> i64
      %1134 = func.call @cc_cons(%1132, %1133) : (i64, i64) -> i64
      %1135 = func.call @cc_not(%1134) : (i64) -> i64
      func.call @stack_push_pointer(%1135) : (i64) -> ()
      %1136 = func.call @stack_pop_pointer() : () -> i64
      %1137 = func.call @cc_nil_value() : () -> i64
      %1138 = func.call @cc_cons(%1136, %1137) : (i64, i64) -> i64
      %1139 = func.call @cc_not(%1138) : (i64) -> i64
      func.call @stack_push_pointer(%1139) : (i64) -> ()
      %1140 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1140 : i64
    }
    func.call @stack_push_pointer(%1105) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939398"() {
    %1416 = func.call @cc_nil_value() : () -> i64
    %1417 = func.call @cc_nil_value() : () -> i64
    %1418 = func.call @cc_errorp(%1416) : (i64) -> i64
    %1419 = arith.cmpi ne, %1418, %1417 : i64
    %1420 = scf.if %1419 -> (i64) {
      scf.yield %1416 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1421 = func.call @stack_pop_pointer() : () -> i64
      %1422 = llvm.mlir.addressof @str121 : !llvm.ptr
      %1423 = arith.constant 9 : i64
      %1424 = func.call @cc_make_string(%1422, %1423) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1424) : (i64) -> ()
      %1425 = func.call @stack_pop_pointer() : () -> i64
      %1426 = arith.constant 0 : i64
      %1427 = func.call @cc_box_character(%1426) : (i64) -> i64
      func.call @stack_push_pointer(%1427) : (i64) -> ()
      %1428 = func.call @stack_pop_pointer() : () -> i64
      %1429 = arith.constant 0 : i64
      %1430 = func.call @cc_box_character(%1429) : (i64) -> i64
      func.call @stack_push_pointer(%1430) : (i64) -> ()
      %1431 = func.call @stack_pop_pointer() : () -> i64
      %1432 = arith.constant 0 : i64
      %1433 = func.call @cc_box_character(%1432) : (i64) -> i64
      func.call @stack_push_pointer(%1433) : (i64) -> ()
      %1434 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1421) : (i64) -> ()
      func.call @stack_push_pointer(%1425) : (i64) -> ()
      func.call @stack_push_pointer(%1428) : (i64) -> ()
      func.call @stack_push_pointer(%1431) : (i64) -> ()
      func.call @stack_push_pointer(%1434) : (i64) -> ()
      %1435 = llvm.mlir.addressof @str122 : !llvm.ptr
      %1436 = func.call @cc_make_function_ref_const(%1435) : (!llvm.ptr) -> i64
      %1437 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%1436, %1437) : (i64, i64) -> ()
      %1438 = func.call @stack_pop_pointer() : () -> i64
      %1439 = func.call @stack_pop_pointer() : () -> i64
      %1440 = func.call @cc_cons(%1438, %1439) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1440) : (i64) -> ()
      %1441 = llvm.mlir.addressof @str123 : !llvm.ptr
      %1442 = arith.constant 6 : i64
      %1443 = func.call @cc_make_string(%1441, %1442) : (!llvm.ptr, i64) -> i64
      %1444 = llvm.mlir.addressof @str124 : !llvm.ptr
      %1445 = arith.constant 11 : i64
      %1446 = func.call @cc_make_string(%1444, %1445) : (!llvm.ptr, i64) -> i64
      %1447 = func.call @cc_intern(%1443, %1446) : (i64, i64) -> i64
      %1448 = func.call @cc_nil_value() : () -> i64
      %1449 = func.call @cc_cons(%1447, %1448) : (i64, i64) -> i64
      %1450 = func.call @cc_values_pack(%1449) : (i64) -> i64
      func.call @stack_push_pointer(%1447) : (i64) -> ()
      %1451 = func.call @stack_pop_pointer() : () -> i64
      %1452 = func.call @cc_nil_value() : () -> i64
      %1453 = llvm.mlir.addressof @str125 : !llvm.ptr
      %1454 = arith.constant 3 : i64
      %1455 = func.call @cc_make_string(%1453, %1454) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1455) : (i64) -> ()
      %1456 = func.call @stack_pop_pointer() : () -> i64
      %1457 = func.call @cc_cons(%1456, %1452) : (i64, i64) -> i64
      %1458 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1458) : (i64) -> ()
      %1459 = func.call @stack_pop_pointer() : () -> i64
      %1460 = arith.constant 0 : i64
      %1461 = func.call @cc_box_character(%1460) : (i64) -> i64
      func.call @stack_push_pointer(%1461) : (i64) -> ()
      %1462 = func.call @stack_pop_pointer() : () -> i64
      %1463 = func.call @cc_make_string_repeat(%1459, %1462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1463) : (i64) -> ()
      %1464 = func.call @stack_pop_pointer() : () -> i64
      %1465 = func.call @cc_cons(%1464, %1457) : (i64, i64) -> i64
      %1466 = func.call @cc_concatenate(%1451, %1465) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1466) : (i64) -> ()
      %1467 = func.call @stack_pop_pointer() : () -> i64
      %1468 = func.call @stack_pop_pointer() : () -> i64
      %1469 = func.call @cc_cons(%1467, %1468) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1469) : (i64) -> ()
      %1470 = func.call @stack_pop_pointer() : () -> i64
      %1471 = func.call @cc_string_equal_full(%1470) : (i64) -> i64
      func.call @stack_push_pointer(%1471) : (i64) -> ()
      %1472 = func.call @stack_pop_pointer() : () -> i64
      %1473 = func.call @cc_nil_value() : () -> i64
      %1474 = func.call @cc_cons(%1472, %1473) : (i64, i64) -> i64
      %1475 = func.call @cc_not(%1474) : (i64) -> i64
      func.call @stack_push_pointer(%1475) : (i64) -> ()
      %1476 = func.call @stack_pop_pointer() : () -> i64
      %1477 = func.call @cc_nil_value() : () -> i64
      %1478 = func.call @cc_cons(%1476, %1477) : (i64, i64) -> i64
      %1479 = func.call @cc_not(%1478) : (i64) -> i64
      func.call @stack_push_pointer(%1479) : (i64) -> ()
      %1480 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1480 : i64
    }
    func.call @stack_push_pointer(%1420) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939399"() {
    %1772 = func.call @cc_nil_value() : () -> i64
    %1773 = func.call @cc_nil_value() : () -> i64
    %1774 = func.call @cc_errorp(%1772) : (i64) -> i64
    %1775 = arith.cmpi ne, %1774, %1773 : i64
    %1776 = scf.if %1775 -> (i64) {
      scf.yield %1772 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1777 = func.call @stack_pop_pointer() : () -> i64
      %1778 = llvm.mlir.addressof @str153 : !llvm.ptr
      %1779 = arith.constant 9 : i64
      %1780 = func.call @cc_make_string(%1778, %1779) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1780) : (i64) -> ()
      %1781 = func.call @stack_pop_pointer() : () -> i64
      %1782 = arith.constant 0 : i64
      %1783 = func.call @cc_box_character(%1782) : (i64) -> i64
      func.call @stack_push_pointer(%1783) : (i64) -> ()
      %1784 = func.call @stack_pop_pointer() : () -> i64
      %1785 = arith.constant 0 : i64
      %1786 = func.call @cc_box_character(%1785) : (i64) -> i64
      func.call @stack_push_pointer(%1786) : (i64) -> ()
      %1787 = func.call @stack_pop_pointer() : () -> i64
      %1788 = arith.constant 0 : i64
      %1789 = func.call @cc_box_character(%1788) : (i64) -> i64
      func.call @stack_push_pointer(%1789) : (i64) -> ()
      %1790 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%1777) : (i64) -> ()
      func.call @stack_push_pointer(%1781) : (i64) -> ()
      func.call @stack_push_pointer(%1784) : (i64) -> ()
      func.call @stack_push_pointer(%1787) : (i64) -> ()
      func.call @stack_push_pointer(%1790) : (i64) -> ()
      %1791 = llvm.mlir.addressof @str154 : !llvm.ptr
      %1792 = func.call @cc_make_function_ref_const(%1791) : (!llvm.ptr) -> i64
      %1793 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%1792, %1793) : (i64, i64) -> ()
      %1794 = func.call @stack_pop_pointer() : () -> i64
      %1795 = func.call @stack_pop_pointer() : () -> i64
      %1796 = func.call @cc_cons(%1794, %1795) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1796) : (i64) -> ()
      %1797 = llvm.mlir.addressof @str155 : !llvm.ptr
      %1798 = arith.constant 6 : i64
      %1799 = func.call @cc_make_string(%1797, %1798) : (!llvm.ptr, i64) -> i64
      %1800 = llvm.mlir.addressof @str156 : !llvm.ptr
      %1801 = arith.constant 11 : i64
      %1802 = func.call @cc_make_string(%1800, %1801) : (!llvm.ptr, i64) -> i64
      %1803 = func.call @cc_intern(%1799, %1802) : (i64, i64) -> i64
      %1804 = func.call @cc_nil_value() : () -> i64
      %1805 = func.call @cc_cons(%1803, %1804) : (i64, i64) -> i64
      %1806 = func.call @cc_values_pack(%1805) : (i64) -> i64
      func.call @stack_push_pointer(%1803) : (i64) -> ()
      %1807 = func.call @stack_pop_pointer() : () -> i64
      %1808 = func.call @cc_nil_value() : () -> i64
      %1809 = llvm.mlir.addressof @str157 : !llvm.ptr
      %1810 = arith.constant 3 : i64
      %1811 = func.call @cc_make_string(%1809, %1810) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1811) : (i64) -> ()
      %1812 = func.call @stack_pop_pointer() : () -> i64
      %1813 = func.call @cc_cons(%1812, %1808) : (i64, i64) -> i64
      %1814 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%1814) : (i64) -> ()
      %1815 = func.call @stack_pop_pointer() : () -> i64
      %1816 = arith.constant 0 : i64
      %1817 = func.call @cc_box_character(%1816) : (i64) -> i64
      func.call @stack_push_pointer(%1817) : (i64) -> ()
      %1818 = func.call @stack_pop_pointer() : () -> i64
      %1819 = func.call @cc_make_string_repeat(%1815, %1818) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1819) : (i64) -> ()
      %1820 = func.call @stack_pop_pointer() : () -> i64
      %1821 = func.call @cc_cons(%1820, %1813) : (i64, i64) -> i64
      %1822 = func.call @cc_concatenate(%1807, %1821) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1822) : (i64) -> ()
      %1823 = func.call @stack_pop_pointer() : () -> i64
      %1824 = func.call @cc_copy_seq(%1823) : (i64) -> i64
      func.call @stack_push_pointer(%1824) : (i64) -> ()
      %1825 = func.call @stack_pop_pointer() : () -> i64
      %1826 = func.call @stack_pop_pointer() : () -> i64
      %1827 = func.call @cc_cons(%1825, %1826) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1827) : (i64) -> ()
      %1828 = func.call @stack_pop_pointer() : () -> i64
      %1829 = func.call @cc_string_equal_full(%1828) : (i64) -> i64
      func.call @stack_push_pointer(%1829) : (i64) -> ()
      %1830 = func.call @stack_pop_pointer() : () -> i64
      %1831 = func.call @cc_nil_value() : () -> i64
      %1832 = func.call @cc_cons(%1830, %1831) : (i64, i64) -> i64
      %1833 = func.call @cc_not(%1832) : (i64) -> i64
      func.call @stack_push_pointer(%1833) : (i64) -> ()
      %1834 = func.call @stack_pop_pointer() : () -> i64
      %1835 = func.call @cc_nil_value() : () -> i64
      %1836 = func.call @cc_cons(%1834, %1835) : (i64, i64) -> i64
      %1837 = func.call @cc_not(%1836) : (i64) -> i64
      func.call @stack_push_pointer(%1837) : (i64) -> ()
      %1838 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1838 : i64
    }
    func.call @stack_push_pointer(%1776) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939400"() {
    %2082 = func.call @cc_nil_value() : () -> i64
    %2083 = func.call @cc_nil_value() : () -> i64
    %2084 = func.call @cc_errorp(%2082) : (i64) -> i64
    %2085 = arith.cmpi ne, %2084, %2083 : i64
    %2086 = scf.if %2085 -> (i64) {
      scf.yield %2082 : i64
    } else {
      %2087 = arith.constant 88 : i64
      %2088 = func.call @cc_box_character(%2087) : (i64) -> i64
      func.call @stack_push_pointer(%2088) : (i64) -> ()
      %2089 = arith.constant 0 : i64
      %2090 = func.call @cc_box_character(%2089) : (i64) -> i64
      func.call @stack_push_pointer(%2090) : (i64) -> ()
      %2091 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2092 = arith.constant 6 : i64
      %2093 = func.call @cc_make_string(%2091, %2092) : (!llvm.ptr, i64) -> i64
      %2094 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2095 = arith.constant 11 : i64
      %2096 = func.call @cc_make_string(%2094, %2095) : (!llvm.ptr, i64) -> i64
      %2097 = func.call @cc_intern(%2093, %2096) : (i64, i64) -> i64
      %2098 = func.call @cc_nil_value() : () -> i64
      %2099 = func.call @cc_cons(%2097, %2098) : (i64, i64) -> i64
      %2100 = func.call @cc_values_pack(%2099) : (i64) -> i64
      func.call @stack_push_pointer(%2097) : (i64) -> ()
      %2101 = func.call @stack_pop_pointer() : () -> i64
      %2102 = func.call @cc_nil_value() : () -> i64
      %2103 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2104 = arith.constant 3 : i64
      %2105 = func.call @cc_make_string(%2103, %2104) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2105) : (i64) -> ()
      %2106 = func.call @stack_pop_pointer() : () -> i64
      %2107 = func.call @cc_cons(%2106, %2102) : (i64, i64) -> i64
      %2108 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2108) : (i64) -> ()
      %2109 = func.call @stack_pop_pointer() : () -> i64
      %2110 = arith.constant 0 : i64
      %2111 = func.call @cc_box_character(%2110) : (i64) -> i64
      func.call @stack_push_pointer(%2111) : (i64) -> ()
      %2112 = func.call @stack_pop_pointer() : () -> i64
      %2113 = func.call @cc_make_string_repeat(%2109, %2112) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2113) : (i64) -> ()
      %2114 = func.call @stack_pop_pointer() : () -> i64
      %2115 = func.call @cc_cons(%2114, %2107) : (i64, i64) -> i64
      %2116 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2117 = arith.constant 1 : i64
      %2118 = func.call @cc_make_string(%2116, %2117) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2118) : (i64) -> ()
      %2119 = func.call @stack_pop_pointer() : () -> i64
      %2120 = func.call @cc_cons(%2119, %2115) : (i64, i64) -> i64
      %2121 = func.call @cc_concatenate(%2101, %2120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2121) : (i64) -> ()
      %2122 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%2122) : (i64) -> ()
      %2123 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2123) : (i64) -> ()
      %2124 = func.call @stack_pop_pointer() : () -> i64
      %2125 = func.call @stack_pop_pointer() : () -> i64
      %2126 = func.call @stack_pop_pointer() : () -> i64
      %2127 = func.call @cc_subseq(%2126, %2125, %2124) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%2127) : (i64) -> ()
      %2128 = func.call @stack_pop_pointer() : () -> i64
      %2129 = func.call @stack_pop_pointer() : () -> i64
      %2130 = func.call @stack_pop_pointer() : () -> i64
      %2131 = func.call @cc_substitute(%2130, %2129, %2128) : (i64, i64, i64) -> i64
      func.call @stack_push_pointer(%2131) : (i64) -> ()
      %2132 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2132 : i64
    }
    func.call @stack_push_pointer(%2086) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939401"() {
    %2304 = func.call @cc_nil_value() : () -> i64
    %2305 = func.call @cc_nil_value() : () -> i64
    %2306 = func.call @cc_errorp(%2304) : (i64) -> i64
    %2307 = arith.cmpi ne, %2306, %2305 : i64
    %2308 = scf.if %2307 -> (i64) {
      scf.yield %2304 : i64
    } else {
      %2309 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2310 = func.call @cc_nil_value() : () -> i64
      %2311 = func.call @cc_nil_value() : () -> i64
      %2312 = func.call @cc_errorp(%2310) : (i64) -> i64
      %2313 = arith.cmpi ne, %2312, %2311 : i64
      %2314 = scf.if %2313 -> (i64) {
        scf.yield %2310 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2315 = llvm.mlir.addressof @str201 : !llvm.ptr
        %2316 = arith.constant 7 : i64
        %2317 = func.call @cc_make_string(%2315, %2316) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%2317) : (i64) -> ()
        %2318 = func.call @stack_pop_pointer() : () -> i64
        %2319 = func.call @cc_nil_value() : () -> i64
        %2320 = func.call @cc_errorp(%2318) : (i64) -> i64
        %2321 = arith.cmpi ne, %2320, %2319 : i64
        %2322 = arith.cmpi eq, %2319, %2319 : i64
        %2323 = arith.andi %2321, %2322 : i1
        %2324 = scf.if %2323 -> (i64) {
          scf.yield %2318 : i64
        } else {
          scf.yield %2319 : i64
        }
        %2325 = arith.cmpi ne, %2324, %2319 : i64
        scf.if %2325 {
          func.call @stack_push_pointer(%2324) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2318) : (i64) -> ()
          %2326 = llvm.mlir.addressof @str202 : !llvm.ptr
          %2327 = func.call @cc_make_function_ref_const(%2326) : (!llvm.ptr) -> i64
          %2328 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2327, %2328) : (i64, i64) -> ()
        }
        %2329 = func.call @stack_pop_pointer() : () -> i64
        %2330 = func.call @cc_errorp(%2329) : (i64) -> i64
        %2331 = func.call @cc_nil_value() : () -> i64
        %2332 = arith.cmpi ne, %2330, %2331 : i64
        scf.if %2332 {
          func.call @stack_push_pointer(%2329) : (i64) -> ()
        } else {
          %2333 = func.call @cc_multiple_value_list(%2329) : (i64) -> i64
          func.call @stack_push_pointer(%2333) : (i64) -> ()
        }
        %2334 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2335 = func.call @stack_pop_pointer() : () -> i64
        %2336 = func.call @cc_nil_value() : () -> i64
        %2337 = func.call @cc_maybe_error_from_multiple_value_list(%2334) : (i64) -> i64
        %2338 = func.call @cc_errorp(%2337) : (i64) -> i64
        %2339 = arith.cmpi ne, %2338, %2336 : i64
        %2340 = arith.cmpi eq, %2336, %2336 : i64
        %2341 = arith.andi %2339, %2340 : i1
        %2342 = scf.if %2341 -> (i64) {
          scf.yield %2337 : i64
        } else {
          scf.yield %2336 : i64
        }
        %2343 = arith.cmpi ne, %2342, %2336 : i64
        scf.if %2343 {
          func.call @stack_push_pointer(%2342) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2344 = func.call @stack_pop_pointer() : () -> i64
          %2345 = func.call @cc_cons(%2335, %2344) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2345) : (i64) -> ()
          %2346 = func.call @stack_pop_pointer() : () -> i64
          %2347 = func.call @cc_cons(%2334, %2346) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2347) : (i64) -> ()
          %2348 = func.call @stack_pop_pointer() : () -> i64
          %2349 = func.call @cc_values_pack(%2348) : (i64) -> i64
          func.call @stack_push_pointer(%2349) : (i64) -> ()
        }
        %2350 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2350 : i64
      }
      func.call @stack_push_pointer(%2314) : (i64) -> ()
      %2351 = func.call @stack_pop_pointer() : () -> i64
      %2352 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2353 = func.call @cc_errorp(%2351) : (i64) -> i64
      %2354 = func.call @cc_nil_value() : () -> i64
      %2355 = arith.cmpi ne, %2353, %2354 : i64
      scf.if %2355 {
        %2356 = func.call @cc_condition_value(%2351) : (i64) -> i64
        %2357 = func.call @cc_values2(%2354, %2356) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2357) : (i64) -> ()
      } else {
        %2358 = func.call @cc_multiple_value_list(%2351) : (i64) -> i64
        %2359 = func.call @cc_values_pack(%2358) : (i64) -> i64
        func.call @stack_push_pointer(%2359) : (i64) -> ()
      }
      %2360 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2360 : i64
    }
    func.call @stack_push_pointer(%2308) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939402"() {
    %2501 = func.call @cc_nil_value() : () -> i64
    %2502 = func.call @cc_nil_value() : () -> i64
    %2503 = func.call @cc_errorp(%2501) : (i64) -> i64
    %2504 = arith.cmpi ne, %2503, %2502 : i64
    %2505 = scf.if %2504 -> (i64) {
      scf.yield %2501 : i64
    } else {
      %2506 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2507 = arith.constant 5 : i64
      %2508 = func.call @cc_make_string(%2506, %2507) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2508) : (i64) -> ()
      %2509 = func.call @stack_pop_pointer() : () -> i64
      %2510 = func.call @cc_nil_value() : () -> i64
      %2511 = func.call @cc_errorp(%2509) : (i64) -> i64
      %2512 = arith.cmpi ne, %2511, %2510 : i64
      %2513 = arith.cmpi eq, %2510, %2510 : i64
      %2514 = arith.andi %2512, %2513 : i1
      %2515 = scf.if %2514 -> (i64) {
        scf.yield %2509 : i64
      } else {
        scf.yield %2510 : i64
      }
      %2516 = arith.cmpi ne, %2515, %2510 : i64
      scf.if %2516 {
        func.call @stack_push_pointer(%2515) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2509) : (i64) -> ()
        %2517 = llvm.mlir.addressof @str217 : !llvm.ptr
        %2518 = func.call @cc_make_function_ref_const(%2517) : (!llvm.ptr) -> i64
        %2519 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2518, %2519) : (i64, i64) -> ()
      }
      %2520 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2520 : i64
    }
    func.call @stack_push_pointer(%2505) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939403"() {
    %2692 = func.call @cc_nil_value() : () -> i64
    %2693 = func.call @cc_nil_value() : () -> i64
    %2694 = func.call @cc_errorp(%2692) : (i64) -> i64
    %2695 = arith.cmpi ne, %2694, %2693 : i64
    %2696 = scf.if %2695 -> (i64) {
      scf.yield %2692 : i64
    } else {
      %2697 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %2698 = func.call @cc_nil_value() : () -> i64
      %2699 = func.call @cc_nil_value() : () -> i64
      %2700 = func.call @cc_errorp(%2698) : (i64) -> i64
      %2701 = arith.cmpi ne, %2700, %2699 : i64
      %2702 = scf.if %2701 -> (i64) {
        scf.yield %2698 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %2703 = llvm.mlir.addressof @str232 : !llvm.ptr
        %2704 = arith.constant 7 : i64
        %2705 = func.call @cc_make_string(%2703, %2704) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%2705) : (i64) -> ()
        %2706 = func.call @stack_pop_pointer() : () -> i64
        %2707 = func.call @cc_nil_value() : () -> i64
        %2708 = func.call @cc_errorp(%2706) : (i64) -> i64
        %2709 = arith.cmpi ne, %2708, %2707 : i64
        %2710 = arith.cmpi eq, %2707, %2707 : i64
        %2711 = arith.andi %2709, %2710 : i1
        %2712 = scf.if %2711 -> (i64) {
          scf.yield %2706 : i64
        } else {
          scf.yield %2707 : i64
        }
        %2713 = arith.cmpi ne, %2712, %2707 : i64
        scf.if %2713 {
          func.call @stack_push_pointer(%2712) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%2706) : (i64) -> ()
          %2714 = llvm.mlir.addressof @str233 : !llvm.ptr
          %2715 = func.call @cc_make_function_ref_const(%2714) : (!llvm.ptr) -> i64
          %2716 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%2715, %2716) : (i64, i64) -> ()
        }
        %2717 = func.call @stack_pop_pointer() : () -> i64
        %2718 = func.call @cc_errorp(%2717) : (i64) -> i64
        %2719 = func.call @cc_nil_value() : () -> i64
        %2720 = arith.cmpi ne, %2718, %2719 : i64
        scf.if %2720 {
          func.call @stack_push_pointer(%2717) : (i64) -> ()
        } else {
          %2721 = func.call @cc_multiple_value_list(%2717) : (i64) -> i64
          func.call @stack_push_pointer(%2721) : (i64) -> ()
        }
        %2722 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %2723 = func.call @stack_pop_pointer() : () -> i64
        %2724 = func.call @cc_nil_value() : () -> i64
        %2725 = func.call @cc_maybe_error_from_multiple_value_list(%2722) : (i64) -> i64
        %2726 = func.call @cc_errorp(%2725) : (i64) -> i64
        %2727 = arith.cmpi ne, %2726, %2724 : i64
        %2728 = arith.cmpi eq, %2724, %2724 : i64
        %2729 = arith.andi %2727, %2728 : i1
        %2730 = scf.if %2729 -> (i64) {
          scf.yield %2725 : i64
        } else {
          scf.yield %2724 : i64
        }
        %2731 = arith.cmpi ne, %2730, %2724 : i64
        scf.if %2731 {
          func.call @stack_push_pointer(%2730) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %2732 = func.call @stack_pop_pointer() : () -> i64
          %2733 = func.call @cc_cons(%2723, %2732) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2733) : (i64) -> ()
          %2734 = func.call @stack_pop_pointer() : () -> i64
          %2735 = func.call @cc_cons(%2722, %2734) : (i64, i64) -> i64
          func.call @stack_push_pointer(%2735) : (i64) -> ()
          %2736 = func.call @stack_pop_pointer() : () -> i64
          %2737 = func.call @cc_values_pack(%2736) : (i64) -> i64
          func.call @stack_push_pointer(%2737) : (i64) -> ()
        }
        %2738 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %2738 : i64
      }
      func.call @stack_push_pointer(%2702) : (i64) -> ()
      %2739 = func.call @stack_pop_pointer() : () -> i64
      %2740 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %2741 = func.call @cc_errorp(%2739) : (i64) -> i64
      %2742 = func.call @cc_nil_value() : () -> i64
      %2743 = arith.cmpi ne, %2741, %2742 : i64
      scf.if %2743 {
        %2744 = func.call @cc_condition_value(%2739) : (i64) -> i64
        %2745 = func.call @cc_values2(%2742, %2744) : (i64, i64) -> i64
        func.call @stack_push_pointer(%2745) : (i64) -> ()
      } else {
        %2746 = func.call @cc_multiple_value_list(%2739) : (i64) -> i64
        %2747 = func.call @cc_values_pack(%2746) : (i64) -> i64
        func.call @stack_push_pointer(%2747) : (i64) -> ()
      }
      %2748 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2748 : i64
    }
    func.call @stack_push_pointer(%2696) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939404"() {
    %2889 = func.call @cc_nil_value() : () -> i64
    %2890 = func.call @cc_nil_value() : () -> i64
    %2891 = func.call @cc_errorp(%2889) : (i64) -> i64
    %2892 = arith.cmpi ne, %2891, %2890 : i64
    %2893 = scf.if %2892 -> (i64) {
      scf.yield %2889 : i64
    } else {
      %2894 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2895 = arith.constant 6 : i64
      %2896 = func.call @cc_make_string(%2894, %2895) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%2896) : (i64) -> ()
      %2897 = func.call @stack_pop_pointer() : () -> i64
      %2898 = func.call @cc_nil_value() : () -> i64
      %2899 = func.call @cc_errorp(%2897) : (i64) -> i64
      %2900 = arith.cmpi ne, %2899, %2898 : i64
      %2901 = arith.cmpi eq, %2898, %2898 : i64
      %2902 = arith.andi %2900, %2901 : i1
      %2903 = scf.if %2902 -> (i64) {
        scf.yield %2897 : i64
      } else {
        scf.yield %2898 : i64
      }
      %2904 = arith.cmpi ne, %2903, %2898 : i64
      scf.if %2904 {
        func.call @stack_push_pointer(%2903) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%2897) : (i64) -> ()
        %2905 = llvm.mlir.addressof @str248 : !llvm.ptr
        %2906 = func.call @cc_make_function_ref_const(%2905) : (!llvm.ptr) -> i64
        %2907 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%2906, %2907) : (i64, i64) -> ()
      }
      %2908 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %2908 : i64
    }
    func.call @stack_push_pointer(%2893) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939405"() {
    %3033 = func.call @cc_nil_value() : () -> i64
    %3034 = func.call @cc_nil_value() : () -> i64
    %3035 = func.call @cc_errorp(%3033) : (i64) -> i64
    %3036 = arith.cmpi ne, %3035, %3034 : i64
    %3037 = scf.if %3036 -> (i64) {
      scf.yield %3033 : i64
    } else {
      %3038 = llvm.mlir.addressof @str259 : !llvm.ptr
      %3039 = arith.constant 6 : i64
      %3040 = func.call @cc_make_string(%3038, %3039) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3040) : (i64) -> ()
      %3041 = func.call @stack_pop_pointer() : () -> i64
      %3042 = func.call @cc_nil_value() : () -> i64
      %3043 = func.call @cc_errorp(%3041) : (i64) -> i64
      %3044 = arith.cmpi ne, %3043, %3042 : i64
      %3045 = arith.cmpi eq, %3042, %3042 : i64
      %3046 = arith.andi %3044, %3045 : i1
      %3047 = scf.if %3046 -> (i64) {
        scf.yield %3041 : i64
      } else {
        scf.yield %3042 : i64
      }
      %3048 = arith.cmpi ne, %3047, %3042 : i64
      scf.if %3048 {
        func.call @stack_push_pointer(%3047) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3041) : (i64) -> ()
        %3049 = llvm.mlir.addressof @str260 : !llvm.ptr
        %3050 = func.call @cc_make_function_ref_const(%3049) : (!llvm.ptr) -> i64
        %3051 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%3050, %3051) : (i64, i64) -> ()
      }
      %3052 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3052 : i64
    }
    func.call @stack_push_pointer(%3037) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939406"() {
    %3224 = func.call @cc_nil_value() : () -> i64
    %3225 = func.call @cc_nil_value() : () -> i64
    %3226 = func.call @cc_errorp(%3224) : (i64) -> i64
    %3227 = arith.cmpi ne, %3226, %3225 : i64
    %3228 = scf.if %3227 -> (i64) {
      scf.yield %3224 : i64
    } else {
      %3229 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3230 = func.call @cc_nil_value() : () -> i64
      %3231 = func.call @cc_nil_value() : () -> i64
      %3232 = func.call @cc_errorp(%3230) : (i64) -> i64
      %3233 = arith.cmpi ne, %3232, %3231 : i64
      %3234 = scf.if %3233 -> (i64) {
        scf.yield %3230 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3235 = llvm.mlir.addressof @str275 : !llvm.ptr
        %3236 = arith.constant 7 : i64
        %3237 = func.call @cc_make_string(%3235, %3236) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%3237) : (i64) -> ()
        %3238 = func.call @stack_pop_pointer() : () -> i64
        %3239 = func.call @cc_nil_value() : () -> i64
        %3240 = func.call @cc_errorp(%3238) : (i64) -> i64
        %3241 = arith.cmpi ne, %3240, %3239 : i64
        %3242 = arith.cmpi eq, %3239, %3239 : i64
        %3243 = arith.andi %3241, %3242 : i1
        %3244 = scf.if %3243 -> (i64) {
          scf.yield %3238 : i64
        } else {
          scf.yield %3239 : i64
        }
        %3245 = arith.cmpi ne, %3244, %3239 : i64
        scf.if %3245 {
          func.call @stack_push_pointer(%3244) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3238) : (i64) -> ()
          %3246 = llvm.mlir.addressof @str276 : !llvm.ptr
          %3247 = func.call @cc_make_function_ref_const(%3246) : (!llvm.ptr) -> i64
          %3248 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3247, %3248) : (i64, i64) -> ()
        }
        %3249 = func.call @stack_pop_pointer() : () -> i64
        %3250 = func.call @cc_errorp(%3249) : (i64) -> i64
        %3251 = func.call @cc_nil_value() : () -> i64
        %3252 = arith.cmpi ne, %3250, %3251 : i64
        scf.if %3252 {
          func.call @stack_push_pointer(%3249) : (i64) -> ()
        } else {
          %3253 = func.call @cc_multiple_value_list(%3249) : (i64) -> i64
          func.call @stack_push_pointer(%3253) : (i64) -> ()
        }
        %3254 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3255 = func.call @stack_pop_pointer() : () -> i64
        %3256 = func.call @cc_nil_value() : () -> i64
        %3257 = func.call @cc_maybe_error_from_multiple_value_list(%3254) : (i64) -> i64
        %3258 = func.call @cc_errorp(%3257) : (i64) -> i64
        %3259 = arith.cmpi ne, %3258, %3256 : i64
        %3260 = arith.cmpi eq, %3256, %3256 : i64
        %3261 = arith.andi %3259, %3260 : i1
        %3262 = scf.if %3261 -> (i64) {
          scf.yield %3257 : i64
        } else {
          scf.yield %3256 : i64
        }
        %3263 = arith.cmpi ne, %3262, %3256 : i64
        scf.if %3263 {
          func.call @stack_push_pointer(%3262) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3264 = func.call @stack_pop_pointer() : () -> i64
          %3265 = func.call @cc_cons(%3255, %3264) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3265) : (i64) -> ()
          %3266 = func.call @stack_pop_pointer() : () -> i64
          %3267 = func.call @cc_cons(%3254, %3266) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3267) : (i64) -> ()
          %3268 = func.call @stack_pop_pointer() : () -> i64
          %3269 = func.call @cc_values_pack(%3268) : (i64) -> i64
          func.call @stack_push_pointer(%3269) : (i64) -> ()
        }
        %3270 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3270 : i64
      }
      func.call @stack_push_pointer(%3234) : (i64) -> ()
      %3271 = func.call @stack_pop_pointer() : () -> i64
      %3272 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3273 = func.call @cc_errorp(%3271) : (i64) -> i64
      %3274 = func.call @cc_nil_value() : () -> i64
      %3275 = arith.cmpi ne, %3273, %3274 : i64
      scf.if %3275 {
        %3276 = func.call @cc_condition_value(%3271) : (i64) -> i64
        %3277 = func.call @cc_values2(%3274, %3276) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3277) : (i64) -> ()
      } else {
        %3278 = func.call @cc_multiple_value_list(%3271) : (i64) -> i64
        %3279 = func.call @cc_values_pack(%3278) : (i64) -> i64
        func.call @stack_push_pointer(%3279) : (i64) -> ()
      }
      %3280 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3280 : i64
    }
    func.call @stack_push_pointer(%3228) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939407"() {
    %3438 = func.call @cc_nil_value() : () -> i64
    %3439 = func.call @cc_nil_value() : () -> i64
    %3440 = func.call @cc_errorp(%3438) : (i64) -> i64
    %3441 = arith.cmpi ne, %3440, %3439 : i64
    %3442 = scf.if %3441 -> (i64) {
      scf.yield %3438 : i64
    } else {
      %3443 = llvm.mlir.addressof @str292 : !llvm.ptr
      %3444 = arith.constant 5 : i64
      %3445 = func.call @cc_make_string(%3443, %3444) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%3445) : (i64) -> ()
      %3446 = func.call @stack_pop_pointer() : () -> i64
      %3447 = llvm.mlir.addressof @str293 : !llvm.ptr
      %3448 = arith.constant 12 : i64
      %3449 = func.call @cc_make_string(%3447, %3448) : (!llvm.ptr, i64) -> i64
      %3450 = llvm.mlir.addressof @str294 : !llvm.ptr
      %3451 = arith.constant 7 : i64
      %3452 = func.call @cc_make_string(%3450, %3451) : (!llvm.ptr, i64) -> i64
      %3453 = func.call @cc_intern(%3449, %3452) : (i64, i64) -> i64
      %3454 = func.call @cc_nil_value() : () -> i64
      %3455 = func.call @cc_cons(%3453, %3454) : (i64, i64) -> i64
      %3456 = func.call @cc_values_pack(%3455) : (i64) -> i64
      func.call @stack_push_pointer(%3453) : (i64) -> ()
      %3457 = func.call @stack_pop_pointer() : () -> i64
      %3458 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%3458) : (i64) -> ()
      %3459 = func.call @stack_pop_pointer() : () -> i64
      %3460 = func.call @cc_nil_value() : () -> i64
      %3461 = func.call @cc_errorp(%3446) : (i64) -> i64
      %3462 = arith.cmpi ne, %3461, %3460 : i64
      %3463 = arith.cmpi eq, %3460, %3460 : i64
      %3464 = arith.andi %3462, %3463 : i1
      %3465 = scf.if %3464 -> (i64) {
        scf.yield %3446 : i64
      } else {
        scf.yield %3460 : i64
      }
      %3466 = func.call @cc_errorp(%3457) : (i64) -> i64
      %3467 = arith.cmpi ne, %3466, %3460 : i64
      %3468 = arith.cmpi eq, %3465, %3460 : i64
      %3469 = arith.andi %3467, %3468 : i1
      %3470 = scf.if %3469 -> (i64) {
        scf.yield %3457 : i64
      } else {
        scf.yield %3465 : i64
      }
      %3471 = func.call @cc_errorp(%3459) : (i64) -> i64
      %3472 = arith.cmpi ne, %3471, %3460 : i64
      %3473 = arith.cmpi eq, %3470, %3460 : i64
      %3474 = arith.andi %3472, %3473 : i1
      %3475 = scf.if %3474 -> (i64) {
        scf.yield %3459 : i64
      } else {
        scf.yield %3470 : i64
      }
      %3476 = arith.cmpi ne, %3475, %3460 : i64
      scf.if %3476 {
        func.call @stack_push_pointer(%3475) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%3446) : (i64) -> ()
        func.call @stack_push_pointer(%3457) : (i64) -> ()
        func.call @stack_push_pointer(%3459) : (i64) -> ()
        %3477 = llvm.mlir.addressof @str295 : !llvm.ptr
        %3478 = func.call @cc_make_function_ref_const(%3477) : (!llvm.ptr) -> i64
        %3479 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%3478, %3479) : (i64, i64) -> ()
      }
      %3480 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3480 : i64
    }
    func.call @stack_push_pointer(%3442) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939408"() {
    %3652 = func.call @cc_nil_value() : () -> i64
    %3653 = func.call @cc_nil_value() : () -> i64
    %3654 = func.call @cc_errorp(%3652) : (i64) -> i64
    %3655 = arith.cmpi ne, %3654, %3653 : i64
    %3656 = scf.if %3655 -> (i64) {
      scf.yield %3652 : i64
    } else {
      %3657 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3658 = func.call @cc_nil_value() : () -> i64
      %3659 = func.call @cc_nil_value() : () -> i64
      %3660 = func.call @cc_errorp(%3658) : (i64) -> i64
      %3661 = arith.cmpi ne, %3660, %3659 : i64
      %3662 = scf.if %3661 -> (i64) {
        scf.yield %3658 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3663 = llvm.mlir.addressof @str310 : !llvm.ptr
        %3664 = arith.constant 1 : i64
        %3665 = func.call @cc_make_string(%3663, %3664) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%3665) : (i64) -> ()
        %3666 = func.call @stack_pop_pointer() : () -> i64
        %3667 = func.call @cc_nil_value() : () -> i64
        %3668 = func.call @cc_errorp(%3666) : (i64) -> i64
        %3669 = arith.cmpi ne, %3668, %3667 : i64
        %3670 = arith.cmpi eq, %3667, %3667 : i64
        %3671 = arith.andi %3669, %3670 : i1
        %3672 = scf.if %3671 -> (i64) {
          scf.yield %3666 : i64
        } else {
          scf.yield %3667 : i64
        }
        %3673 = arith.cmpi ne, %3672, %3667 : i64
        scf.if %3673 {
          func.call @stack_push_pointer(%3672) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3666) : (i64) -> ()
          %3674 = llvm.mlir.addressof @str311 : !llvm.ptr
          %3675 = func.call @cc_make_function_ref_const(%3674) : (!llvm.ptr) -> i64
          %3676 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3675, %3676) : (i64, i64) -> ()
        }
        %3677 = func.call @stack_pop_pointer() : () -> i64
        %3678 = func.call @cc_errorp(%3677) : (i64) -> i64
        %3679 = func.call @cc_nil_value() : () -> i64
        %3680 = arith.cmpi ne, %3678, %3679 : i64
        scf.if %3680 {
          func.call @stack_push_pointer(%3677) : (i64) -> ()
        } else {
          %3681 = func.call @cc_multiple_value_list(%3677) : (i64) -> i64
          func.call @stack_push_pointer(%3681) : (i64) -> ()
        }
        %3682 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3683 = func.call @stack_pop_pointer() : () -> i64
        %3684 = func.call @cc_nil_value() : () -> i64
        %3685 = func.call @cc_maybe_error_from_multiple_value_list(%3682) : (i64) -> i64
        %3686 = func.call @cc_errorp(%3685) : (i64) -> i64
        %3687 = arith.cmpi ne, %3686, %3684 : i64
        %3688 = arith.cmpi eq, %3684, %3684 : i64
        %3689 = arith.andi %3687, %3688 : i1
        %3690 = scf.if %3689 -> (i64) {
          scf.yield %3685 : i64
        } else {
          scf.yield %3684 : i64
        }
        %3691 = arith.cmpi ne, %3690, %3684 : i64
        scf.if %3691 {
          func.call @stack_push_pointer(%3690) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3692 = func.call @stack_pop_pointer() : () -> i64
          %3693 = func.call @cc_cons(%3683, %3692) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3693) : (i64) -> ()
          %3694 = func.call @stack_pop_pointer() : () -> i64
          %3695 = func.call @cc_cons(%3682, %3694) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3695) : (i64) -> ()
          %3696 = func.call @stack_pop_pointer() : () -> i64
          %3697 = func.call @cc_values_pack(%3696) : (i64) -> i64
          func.call @stack_push_pointer(%3697) : (i64) -> ()
        }
        %3698 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3698 : i64
      }
      func.call @stack_push_pointer(%3662) : (i64) -> ()
      %3699 = func.call @stack_pop_pointer() : () -> i64
      %3700 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3701 = func.call @cc_errorp(%3699) : (i64) -> i64
      %3702 = func.call @cc_nil_value() : () -> i64
      %3703 = arith.cmpi ne, %3701, %3702 : i64
      scf.if %3703 {
        %3704 = func.call @cc_condition_value(%3699) : (i64) -> i64
        %3705 = func.call @cc_values2(%3702, %3704) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3705) : (i64) -> ()
      } else {
        %3706 = func.call @cc_multiple_value_list(%3699) : (i64) -> i64
        %3707 = func.call @cc_values_pack(%3706) : (i64) -> i64
        func.call @stack_push_pointer(%3707) : (i64) -> ()
      }
      %3708 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3708 : i64
    }
    func.call @stack_push_pointer(%3656) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939409"() {
    %3896 = func.call @cc_nil_value() : () -> i64
    %3897 = func.call @cc_nil_value() : () -> i64
    %3898 = func.call @cc_errorp(%3896) : (i64) -> i64
    %3899 = arith.cmpi ne, %3898, %3897 : i64
    %3900 = scf.if %3899 -> (i64) {
      scf.yield %3896 : i64
    } else {
      %3901 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %3902 = func.call @cc_nil_value() : () -> i64
      %3903 = func.call @cc_nil_value() : () -> i64
      %3904 = func.call @cc_errorp(%3902) : (i64) -> i64
      %3905 = arith.cmpi ne, %3904, %3903 : i64
      %3906 = scf.if %3905 -> (i64) {
        scf.yield %3902 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %3907 = llvm.mlir.addressof @str329 : !llvm.ptr
        %3908 = arith.constant 1 : i64
        %3909 = func.call @cc_make_string(%3907, %3908) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%3909) : (i64) -> ()
        %3910 = func.call @stack_pop_pointer() : () -> i64
        %3911 = func.call @cc_nil_value() : () -> i64
        %3912 = func.call @cc_errorp(%3910) : (i64) -> i64
        %3913 = arith.cmpi ne, %3912, %3911 : i64
        %3914 = arith.cmpi eq, %3911, %3911 : i64
        %3915 = arith.andi %3913, %3914 : i1
        %3916 = scf.if %3915 -> (i64) {
          scf.yield %3910 : i64
        } else {
          scf.yield %3911 : i64
        }
        %3917 = arith.cmpi ne, %3916, %3911 : i64
        scf.if %3917 {
          func.call @stack_push_pointer(%3916) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%3910) : (i64) -> ()
          %3918 = llvm.mlir.addressof @str330 : !llvm.ptr
          %3919 = func.call @cc_make_function_ref_const(%3918) : (!llvm.ptr) -> i64
          %3920 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%3919, %3920) : (i64, i64) -> ()
        }
        %3921 = func.call @stack_pop_pointer() : () -> i64
        %3922 = func.call @cc_errorp(%3921) : (i64) -> i64
        %3923 = func.call @cc_nil_value() : () -> i64
        %3924 = arith.cmpi ne, %3922, %3923 : i64
        scf.if %3924 {
          func.call @stack_push_pointer(%3921) : (i64) -> ()
        } else {
          %3925 = func.call @cc_multiple_value_list(%3921) : (i64) -> i64
          func.call @stack_push_pointer(%3925) : (i64) -> ()
        }
        %3926 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %3927 = func.call @stack_pop_pointer() : () -> i64
        %3928 = func.call @cc_nil_value() : () -> i64
        %3929 = func.call @cc_maybe_error_from_multiple_value_list(%3926) : (i64) -> i64
        %3930 = func.call @cc_errorp(%3929) : (i64) -> i64
        %3931 = arith.cmpi ne, %3930, %3928 : i64
        %3932 = arith.cmpi eq, %3928, %3928 : i64
        %3933 = arith.andi %3931, %3932 : i1
        %3934 = scf.if %3933 -> (i64) {
          scf.yield %3929 : i64
        } else {
          scf.yield %3928 : i64
        }
        %3935 = arith.cmpi ne, %3934, %3928 : i64
        scf.if %3935 {
          func.call @stack_push_pointer(%3934) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %3936 = func.call @stack_pop_pointer() : () -> i64
          %3937 = func.call @cc_cons(%3927, %3936) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3937) : (i64) -> ()
          %3938 = func.call @stack_pop_pointer() : () -> i64
          %3939 = func.call @cc_cons(%3926, %3938) : (i64, i64) -> i64
          func.call @stack_push_pointer(%3939) : (i64) -> ()
          %3940 = func.call @stack_pop_pointer() : () -> i64
          %3941 = func.call @cc_values_pack(%3940) : (i64) -> i64
          func.call @stack_push_pointer(%3941) : (i64) -> ()
        }
        %3942 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3942 : i64
      }
      func.call @stack_push_pointer(%3906) : (i64) -> ()
      %3943 = func.call @stack_pop_pointer() : () -> i64
      %3944 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %3945 = func.call @cc_errorp(%3943) : (i64) -> i64
      %3946 = func.call @cc_nil_value() : () -> i64
      %3947 = arith.cmpi ne, %3945, %3946 : i64
      scf.if %3947 {
        %3948 = func.call @cc_condition_value(%3943) : (i64) -> i64
        %3949 = func.call @cc_values2(%3946, %3948) : (i64, i64) -> i64
        func.call @stack_push_pointer(%3949) : (i64) -> ()
      } else {
        %3950 = func.call @cc_multiple_value_list(%3943) : (i64) -> i64
        %3951 = func.call @cc_values_pack(%3950) : (i64) -> i64
        func.call @stack_push_pointer(%3951) : (i64) -> ()
      }
      %3952 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3952 : i64
    }
    func.call @stack_push_pointer(%3900) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939410"() {
    %4140 = func.call @cc_nil_value() : () -> i64
    %4141 = func.call @cc_nil_value() : () -> i64
    %4142 = func.call @cc_errorp(%4140) : (i64) -> i64
    %4143 = arith.cmpi ne, %4142, %4141 : i64
    %4144 = scf.if %4143 -> (i64) {
      scf.yield %4140 : i64
    } else {
      %4145 = func.call @cc_push_ignore_errors_trap() : () -> i64
      func.call @cc_clear_multiple_values() : () -> ()
      %4146 = func.call @cc_nil_value() : () -> i64
      %4147 = func.call @cc_nil_value() : () -> i64
      %4148 = func.call @cc_errorp(%4146) : (i64) -> i64
      %4149 = arith.cmpi ne, %4148, %4147 : i64
      %4150 = scf.if %4149 -> (i64) {
        scf.yield %4146 : i64
      } else {
        func.call @cc_clear_multiple_values() : () -> ()
        %4151 = llvm.mlir.addressof @str348 : !llvm.ptr
        %4152 = arith.constant 0 : i64
        %4153 = func.call @cc_make_string(%4151, %4152) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%4153) : (i64) -> ()
        %4154 = func.call @stack_pop_pointer() : () -> i64
        %4155 = func.call @cc_nil_value() : () -> i64
        %4156 = func.call @cc_errorp(%4154) : (i64) -> i64
        %4157 = arith.cmpi ne, %4156, %4155 : i64
        %4158 = arith.cmpi eq, %4155, %4155 : i64
        %4159 = arith.andi %4157, %4158 : i1
        %4160 = scf.if %4159 -> (i64) {
          scf.yield %4154 : i64
        } else {
          scf.yield %4155 : i64
        }
        %4161 = arith.cmpi ne, %4160, %4155 : i64
        scf.if %4161 {
          func.call @stack_push_pointer(%4160) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%4154) : (i64) -> ()
          %4162 = llvm.mlir.addressof @str349 : !llvm.ptr
          %4163 = func.call @cc_make_function_ref_const(%4162) : (!llvm.ptr) -> i64
          %4164 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%4163, %4164) : (i64, i64) -> ()
        }
        %4165 = func.call @stack_pop_pointer() : () -> i64
        %4166 = func.call @cc_errorp(%4165) : (i64) -> i64
        %4167 = func.call @cc_nil_value() : () -> i64
        %4168 = arith.cmpi ne, %4166, %4167 : i64
        scf.if %4168 {
          func.call @stack_push_pointer(%4165) : (i64) -> ()
        } else {
          %4169 = func.call @cc_multiple_value_list(%4165) : (i64) -> i64
          func.call @stack_push_pointer(%4169) : (i64) -> ()
        }
        %4170 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %4171 = func.call @stack_pop_pointer() : () -> i64
        %4172 = func.call @cc_nil_value() : () -> i64
        %4173 = func.call @cc_maybe_error_from_multiple_value_list(%4170) : (i64) -> i64
        %4174 = func.call @cc_errorp(%4173) : (i64) -> i64
        %4175 = arith.cmpi ne, %4174, %4172 : i64
        %4176 = arith.cmpi eq, %4172, %4172 : i64
        %4177 = arith.andi %4175, %4176 : i1
        %4178 = scf.if %4177 -> (i64) {
          scf.yield %4173 : i64
        } else {
          scf.yield %4172 : i64
        }
        %4179 = arith.cmpi ne, %4178, %4172 : i64
        scf.if %4179 {
          func.call @stack_push_pointer(%4178) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
          %4180 = func.call @stack_pop_pointer() : () -> i64
          %4181 = func.call @cc_cons(%4171, %4180) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4181) : (i64) -> ()
          %4182 = func.call @stack_pop_pointer() : () -> i64
          %4183 = func.call @cc_cons(%4170, %4182) : (i64, i64) -> i64
          func.call @stack_push_pointer(%4183) : (i64) -> ()
          %4184 = func.call @stack_pop_pointer() : () -> i64
          %4185 = func.call @cc_values_pack(%4184) : (i64) -> i64
          func.call @stack_push_pointer(%4185) : (i64) -> ()
        }
        %4186 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %4186 : i64
      }
      func.call @stack_push_pointer(%4150) : (i64) -> ()
      %4187 = func.call @stack_pop_pointer() : () -> i64
      %4188 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %4189 = func.call @cc_errorp(%4187) : (i64) -> i64
      %4190 = func.call @cc_nil_value() : () -> i64
      %4191 = arith.cmpi ne, %4189, %4190 : i64
      scf.if %4191 {
        %4192 = func.call @cc_condition_value(%4187) : (i64) -> i64
        %4193 = func.call @cc_values2(%4190, %4192) : (i64, i64) -> i64
        func.call @stack_push_pointer(%4193) : (i64) -> ()
      } else {
        %4194 = func.call @cc_multiple_value_list(%4187) : (i64) -> i64
        %4195 = func.call @cc_values_pack(%4194) : (i64) -> i64
        func.call @stack_push_pointer(%4195) : (i64) -> ()
      }
      %4196 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4196 : i64
    }
    func.call @stack_push_pointer(%4144) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939411"() {
    %4354 = func.call @cc_nil_value() : () -> i64
    %4355 = func.call @cc_nil_value() : () -> i64
    %4356 = func.call @cc_errorp(%4354) : (i64) -> i64
    %4357 = arith.cmpi ne, %4356, %4355 : i64
    %4358 = scf.if %4357 -> (i64) {
      scf.yield %4354 : i64
    } else {
      %4359 = llvm.mlir.addressof @str365 : !llvm.ptr
      %4360 = arith.constant 1 : i64
      %4361 = func.call @cc_make_string(%4359, %4360) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4361) : (i64) -> ()
      %4362 = func.call @stack_pop_pointer() : () -> i64
      %4363 = llvm.mlir.addressof @str366 : !llvm.ptr
      %4364 = arith.constant 12 : i64
      %4365 = func.call @cc_make_string(%4363, %4364) : (!llvm.ptr, i64) -> i64
      %4366 = llvm.mlir.addressof @str367 : !llvm.ptr
      %4367 = arith.constant 7 : i64
      %4368 = func.call @cc_make_string(%4366, %4367) : (!llvm.ptr, i64) -> i64
      %4369 = func.call @cc_intern(%4365, %4368) : (i64, i64) -> i64
      %4370 = func.call @cc_nil_value() : () -> i64
      %4371 = func.call @cc_cons(%4369, %4370) : (i64, i64) -> i64
      %4372 = func.call @cc_values_pack(%4371) : (i64) -> i64
      func.call @stack_push_pointer(%4369) : (i64) -> ()
      %4373 = func.call @stack_pop_pointer() : () -> i64
      %4374 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4374) : (i64) -> ()
      %4375 = func.call @stack_pop_pointer() : () -> i64
      %4376 = func.call @cc_nil_value() : () -> i64
      %4377 = func.call @cc_errorp(%4362) : (i64) -> i64
      %4378 = arith.cmpi ne, %4377, %4376 : i64
      %4379 = arith.cmpi eq, %4376, %4376 : i64
      %4380 = arith.andi %4378, %4379 : i1
      %4381 = scf.if %4380 -> (i64) {
        scf.yield %4362 : i64
      } else {
        scf.yield %4376 : i64
      }
      %4382 = func.call @cc_errorp(%4373) : (i64) -> i64
      %4383 = arith.cmpi ne, %4382, %4376 : i64
      %4384 = arith.cmpi eq, %4381, %4376 : i64
      %4385 = arith.andi %4383, %4384 : i1
      %4386 = scf.if %4385 -> (i64) {
        scf.yield %4373 : i64
      } else {
        scf.yield %4381 : i64
      }
      %4387 = func.call @cc_errorp(%4375) : (i64) -> i64
      %4388 = arith.cmpi ne, %4387, %4376 : i64
      %4389 = arith.cmpi eq, %4386, %4376 : i64
      %4390 = arith.andi %4388, %4389 : i1
      %4391 = scf.if %4390 -> (i64) {
        scf.yield %4375 : i64
      } else {
        scf.yield %4386 : i64
      }
      %4392 = arith.cmpi ne, %4391, %4376 : i64
      scf.if %4392 {
        func.call @stack_push_pointer(%4391) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4362) : (i64) -> ()
        func.call @stack_push_pointer(%4373) : (i64) -> ()
        func.call @stack_push_pointer(%4375) : (i64) -> ()
        %4393 = llvm.mlir.addressof @str368 : !llvm.ptr
        %4394 = func.call @cc_make_function_ref_const(%4393) : (!llvm.ptr) -> i64
        %4395 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%4394, %4395) : (i64, i64) -> ()
      }
      %4396 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4396 : i64
    }
    func.call @stack_push_pointer(%4358) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939412"() {
    %4537 = func.call @cc_nil_value() : () -> i64
    %4538 = func.call @cc_nil_value() : () -> i64
    %4539 = func.call @cc_errorp(%4537) : (i64) -> i64
    %4540 = arith.cmpi ne, %4539, %4538 : i64
    %4541 = scf.if %4540 -> (i64) {
      scf.yield %4537 : i64
    } else {
      %4542 = llvm.mlir.addressof @str381 : !llvm.ptr
      %4543 = arith.constant 1 : i64
      %4544 = func.call @cc_make_string(%4542, %4543) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4544) : (i64) -> ()
      %4545 = func.call @stack_pop_pointer() : () -> i64
      %4546 = llvm.mlir.addressof @str382 : !llvm.ptr
      %4547 = arith.constant 12 : i64
      %4548 = func.call @cc_make_string(%4546, %4547) : (!llvm.ptr, i64) -> i64
      %4549 = llvm.mlir.addressof @str383 : !llvm.ptr
      %4550 = arith.constant 7 : i64
      %4551 = func.call @cc_make_string(%4549, %4550) : (!llvm.ptr, i64) -> i64
      %4552 = func.call @cc_intern(%4548, %4551) : (i64, i64) -> i64
      %4553 = func.call @cc_nil_value() : () -> i64
      %4554 = func.call @cc_cons(%4552, %4553) : (i64, i64) -> i64
      %4555 = func.call @cc_values_pack(%4554) : (i64) -> i64
      func.call @stack_push_pointer(%4552) : (i64) -> ()
      %4556 = func.call @stack_pop_pointer() : () -> i64
      %4557 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4557) : (i64) -> ()
      %4558 = func.call @stack_pop_pointer() : () -> i64
      %4559 = func.call @cc_nil_value() : () -> i64
      %4560 = func.call @cc_errorp(%4545) : (i64) -> i64
      %4561 = arith.cmpi ne, %4560, %4559 : i64
      %4562 = arith.cmpi eq, %4559, %4559 : i64
      %4563 = arith.andi %4561, %4562 : i1
      %4564 = scf.if %4563 -> (i64) {
        scf.yield %4545 : i64
      } else {
        scf.yield %4559 : i64
      }
      %4565 = func.call @cc_errorp(%4556) : (i64) -> i64
      %4566 = arith.cmpi ne, %4565, %4559 : i64
      %4567 = arith.cmpi eq, %4564, %4559 : i64
      %4568 = arith.andi %4566, %4567 : i1
      %4569 = scf.if %4568 -> (i64) {
        scf.yield %4556 : i64
      } else {
        scf.yield %4564 : i64
      }
      %4570 = func.call @cc_errorp(%4558) : (i64) -> i64
      %4571 = arith.cmpi ne, %4570, %4559 : i64
      %4572 = arith.cmpi eq, %4569, %4559 : i64
      %4573 = arith.andi %4571, %4572 : i1
      %4574 = scf.if %4573 -> (i64) {
        scf.yield %4558 : i64
      } else {
        scf.yield %4569 : i64
      }
      %4575 = arith.cmpi ne, %4574, %4559 : i64
      scf.if %4575 {
        func.call @stack_push_pointer(%4574) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4545) : (i64) -> ()
        func.call @stack_push_pointer(%4556) : (i64) -> ()
        func.call @stack_push_pointer(%4558) : (i64) -> ()
        %4576 = llvm.mlir.addressof @str384 : !llvm.ptr
        %4577 = func.call @cc_make_function_ref_const(%4576) : (!llvm.ptr) -> i64
        %4578 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%4577, %4578) : (i64, i64) -> ()
      }
      %4579 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4579 : i64
    }
    func.call @stack_push_pointer(%4541) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939413"() {
    %4720 = func.call @cc_nil_value() : () -> i64
    %4721 = func.call @cc_nil_value() : () -> i64
    %4722 = func.call @cc_errorp(%4720) : (i64) -> i64
    %4723 = arith.cmpi ne, %4722, %4721 : i64
    %4724 = scf.if %4723 -> (i64) {
      scf.yield %4720 : i64
    } else {
      %4725 = llvm.mlir.addressof @str397 : !llvm.ptr
      %4726 = arith.constant 0 : i64
      %4727 = func.call @cc_make_string(%4725, %4726) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%4727) : (i64) -> ()
      %4728 = func.call @stack_pop_pointer() : () -> i64
      %4729 = llvm.mlir.addressof @str398 : !llvm.ptr
      %4730 = arith.constant 12 : i64
      %4731 = func.call @cc_make_string(%4729, %4730) : (!llvm.ptr, i64) -> i64
      %4732 = llvm.mlir.addressof @str399 : !llvm.ptr
      %4733 = arith.constant 7 : i64
      %4734 = func.call @cc_make_string(%4732, %4733) : (!llvm.ptr, i64) -> i64
      %4735 = func.call @cc_intern(%4731, %4734) : (i64, i64) -> i64
      %4736 = func.call @cc_nil_value() : () -> i64
      %4737 = func.call @cc_cons(%4735, %4736) : (i64, i64) -> i64
      %4738 = func.call @cc_values_pack(%4737) : (i64) -> i64
      func.call @stack_push_pointer(%4735) : (i64) -> ()
      %4739 = func.call @stack_pop_pointer() : () -> i64
      %4740 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%4740) : (i64) -> ()
      %4741 = func.call @stack_pop_pointer() : () -> i64
      %4742 = func.call @cc_nil_value() : () -> i64
      %4743 = func.call @cc_errorp(%4728) : (i64) -> i64
      %4744 = arith.cmpi ne, %4743, %4742 : i64
      %4745 = arith.cmpi eq, %4742, %4742 : i64
      %4746 = arith.andi %4744, %4745 : i1
      %4747 = scf.if %4746 -> (i64) {
        scf.yield %4728 : i64
      } else {
        scf.yield %4742 : i64
      }
      %4748 = func.call @cc_errorp(%4739) : (i64) -> i64
      %4749 = arith.cmpi ne, %4748, %4742 : i64
      %4750 = arith.cmpi eq, %4747, %4742 : i64
      %4751 = arith.andi %4749, %4750 : i1
      %4752 = scf.if %4751 -> (i64) {
        scf.yield %4739 : i64
      } else {
        scf.yield %4747 : i64
      }
      %4753 = func.call @cc_errorp(%4741) : (i64) -> i64
      %4754 = arith.cmpi ne, %4753, %4742 : i64
      %4755 = arith.cmpi eq, %4752, %4742 : i64
      %4756 = arith.andi %4754, %4755 : i1
      %4757 = scf.if %4756 -> (i64) {
        scf.yield %4741 : i64
      } else {
        scf.yield %4752 : i64
      }
      %4758 = arith.cmpi ne, %4757, %4742 : i64
      scf.if %4758 {
        func.call @stack_push_pointer(%4757) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%4728) : (i64) -> ()
        func.call @stack_push_pointer(%4739) : (i64) -> ()
        func.call @stack_push_pointer(%4741) : (i64) -> ()
        %4759 = llvm.mlir.addressof @str400 : !llvm.ptr
        %4760 = func.call @cc_make_function_ref_const(%4759) : (!llvm.ptr) -> i64
        %4761 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%4760, %4761) : (i64, i64) -> ()
      }
      %4762 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %4762 : i64
    }
    func.call @stack_push_pointer(%4724) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939414"() {
    %5082 = func.call @cc_nil_value() : () -> i64
    %5083 = func.call @cc_nil_value() : () -> i64
    %5084 = func.call @cc_errorp(%5082) : (i64) -> i64
    %5085 = arith.cmpi ne, %5084, %5083 : i64
    %5086 = scf.if %5085 -> (i64) {
      scf.yield %5082 : i64
    } else {
      %5087 = func.call @cc_nil_value() : () -> i64
      %5088 = llvm.mlir.addressof @str432 : !llvm.ptr
      %5089 = arith.constant 3 : i64
      %5090 = func.call @cc_make_string(%5088, %5089) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5090) : (i64) -> ()
      %5091 = func.call @stack_pop_pointer() : () -> i64
      %5092 = func.call @cc_type_of(%5091) : (i64) -> i64
      func.call @stack_push_pointer(%5092) : (i64) -> ()
      %5093 = llvm.mlir.addressof @str433 : !llvm.ptr
      %5094 = arith.constant 12 : i64
      %5095 = func.call @cc_make_string(%5093, %5094) : (!llvm.ptr, i64) -> i64
      %5096 = llvm.mlir.addressof @str434 : !llvm.ptr
      %5097 = arith.constant 11 : i64
      %5098 = func.call @cc_make_string(%5096, %5097) : (!llvm.ptr, i64) -> i64
      %5099 = func.call @cc_intern(%5095, %5098) : (i64, i64) -> i64
      %5100 = func.call @cc_nil_value() : () -> i64
      %5101 = func.call @cc_cons(%5099, %5100) : (i64, i64) -> i64
      %5102 = func.call @cc_values_pack(%5101) : (i64) -> i64
      func.call @stack_push_pointer(%5099) : (i64) -> ()
      %5103 = llvm.mlir.addressof @str435 : !llvm.ptr
      %5104 = arith.constant 9 : i64
      %5105 = func.call @cc_make_string(%5103, %5104) : (!llvm.ptr, i64) -> i64
      %5106 = llvm.mlir.addressof @str436 : !llvm.ptr
      %5107 = arith.constant 11 : i64
      %5108 = func.call @cc_make_string(%5106, %5107) : (!llvm.ptr, i64) -> i64
      %5109 = func.call @cc_intern(%5105, %5108) : (i64, i64) -> i64
      %5110 = func.call @cc_nil_value() : () -> i64
      %5111 = func.call @cc_cons(%5109, %5110) : (i64, i64) -> i64
      %5112 = func.call @cc_values_pack(%5111) : (i64) -> i64
      func.call @stack_push_pointer(%5109) : (i64) -> ()
      %5113 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5113) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5114 = func.call @stack_pop_pointer() : () -> i64
      %5115 = func.call @stack_pop_pointer() : () -> i64
      %5116 = func.call @cc_cons(%5115, %5114) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5116) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5117 = func.call @stack_pop_pointer() : () -> i64
      %5118 = func.call @stack_pop_pointer() : () -> i64
      %5119 = func.call @cc_cons(%5118, %5117) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5119) : (i64) -> ()
      %5120 = func.call @stack_pop_pointer() : () -> i64
      %5121 = func.call @stack_pop_pointer() : () -> i64
      %5122 = func.call @cc_cons(%5121, %5120) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5122) : (i64) -> ()
      %5123 = func.call @stack_pop_pointer() : () -> i64
      %5124 = func.call @stack_pop_pointer() : () -> i64
      %5125 = func.call @cc_cons(%5124, %5123) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5125) : (i64) -> ()
      %5126 = func.call @stack_pop_pointer() : () -> i64
      %5127 = func.call @stack_pop_pointer() : () -> i64
      %5128 = func.call @cc_subtypep(%5127, %5126) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5128) : (i64) -> ()
      %5129 = func.call @stack_pop_pointer() : () -> i64
      %5130 = llvm.mlir.addressof @str437 : !llvm.ptr
      %5131 = arith.constant 3 : i64
      %5132 = func.call @cc_make_string(%5130, %5131) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%5132) : (i64) -> ()
      %5133 = func.call @stack_pop_pointer() : () -> i64
      %5134 = func.call @cc_type_of(%5133) : (i64) -> i64
      func.call @stack_push_pointer(%5134) : (i64) -> ()
      %5135 = llvm.mlir.addressof @str438 : !llvm.ptr
      %5136 = arith.constant 12 : i64
      %5137 = func.call @cc_make_string(%5135, %5136) : (!llvm.ptr, i64) -> i64
      %5138 = llvm.mlir.addressof @str439 : !llvm.ptr
      %5139 = arith.constant 11 : i64
      %5140 = func.call @cc_make_string(%5138, %5139) : (!llvm.ptr, i64) -> i64
      %5141 = func.call @cc_intern(%5137, %5140) : (i64, i64) -> i64
      %5142 = func.call @cc_nil_value() : () -> i64
      %5143 = func.call @cc_cons(%5141, %5142) : (i64, i64) -> i64
      %5144 = func.call @cc_values_pack(%5143) : (i64) -> i64
      func.call @stack_push_pointer(%5141) : (i64) -> ()
      %5145 = llvm.mlir.addressof @str440 : !llvm.ptr
      %5146 = arith.constant 9 : i64
      %5147 = func.call @cc_make_string(%5145, %5146) : (!llvm.ptr, i64) -> i64
      %5148 = llvm.mlir.addressof @str441 : !llvm.ptr
      %5149 = arith.constant 11 : i64
      %5150 = func.call @cc_make_string(%5148, %5149) : (!llvm.ptr, i64) -> i64
      %5151 = func.call @cc_intern(%5147, %5150) : (i64, i64) -> i64
      %5152 = func.call @cc_nil_value() : () -> i64
      %5153 = func.call @cc_cons(%5151, %5152) : (i64, i64) -> i64
      %5154 = func.call @cc_values_pack(%5153) : (i64) -> i64
      func.call @stack_push_pointer(%5151) : (i64) -> ()
      %5155 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5155) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5156 = func.call @stack_pop_pointer() : () -> i64
      %5157 = func.call @stack_pop_pointer() : () -> i64
      %5158 = func.call @cc_cons(%5157, %5156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5158) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %5159 = func.call @stack_pop_pointer() : () -> i64
      %5160 = func.call @stack_pop_pointer() : () -> i64
      %5161 = func.call @cc_cons(%5160, %5159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5161) : (i64) -> ()
      %5162 = func.call @stack_pop_pointer() : () -> i64
      %5163 = func.call @stack_pop_pointer() : () -> i64
      %5164 = func.call @cc_cons(%5163, %5162) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5164) : (i64) -> ()
      %5165 = func.call @stack_pop_pointer() : () -> i64
      %5166 = func.call @stack_pop_pointer() : () -> i64
      %5167 = func.call @cc_cons(%5166, %5165) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5167) : (i64) -> ()
      %5168 = func.call @stack_pop_pointer() : () -> i64
      %5169 = func.call @stack_pop_pointer() : () -> i64
      %5170 = func.call @cc_subtypep(%5169, %5168) : (i64, i64) -> i64
      func.call @stack_push_pointer(%5170) : (i64) -> ()
      %5171 = func.call @stack_pop_pointer() : () -> i64
      %5172 = func.call @cc_cons(%5171, %5087) : (i64, i64) -> i64
      %5173 = func.call @cc_cons(%5129, %5172) : (i64, i64) -> i64
      %5174 = func.call @cc_or(%5173) : (i64) -> i64
      func.call @stack_push_pointer(%5174) : (i64) -> ()
      %5175 = func.call @stack_pop_pointer() : () -> i64
      %5176 = func.call @cc_nil_value() : () -> i64
      %5177 = func.call @cc_cons(%5175, %5176) : (i64, i64) -> i64
      %5178 = func.call @cc_not(%5177) : (i64) -> i64
      func.call @stack_push_pointer(%5178) : (i64) -> ()
      %5179 = func.call @stack_pop_pointer() : () -> i64
      %5180 = func.call @cc_nil_value() : () -> i64
      %5181 = func.call @cc_cons(%5179, %5180) : (i64, i64) -> i64
      %5182 = func.call @cc_not(%5181) : (i64) -> i64
      func.call @stack_push_pointer(%5182) : (i64) -> ()
      %5183 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5183 : i64
    }
    func.call @stack_push_pointer(%5086) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939415"() {
    %5398 = func.call @cc_nil_value() : () -> i64
    %5399 = func.call @cc_nil_value() : () -> i64
    %5400 = func.call @cc_errorp(%5398) : (i64) -> i64
    %5401 = arith.cmpi ne, %5400, %5399 : i64
    %5402 = scf.if %5401 -> (i64) {
      scf.yield %5398 : i64
    } else {
      %5403 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5403) : (i64) -> ()
      %5404 = func.call @stack_pop_pointer() : () -> i64
      %5405 = llvm.mlir.addressof @str463 : !llvm.ptr
      %5406 = arith.constant 12 : i64
      %5407 = func.call @cc_make_string(%5405, %5406) : (!llvm.ptr, i64) -> i64
      %5408 = llvm.mlir.addressof @str464 : !llvm.ptr
      %5409 = arith.constant 7 : i64
      %5410 = func.call @cc_make_string(%5408, %5409) : (!llvm.ptr, i64) -> i64
      %5411 = func.call @cc_intern(%5407, %5410) : (i64, i64) -> i64
      %5412 = func.call @cc_nil_value() : () -> i64
      %5413 = func.call @cc_cons(%5411, %5412) : (i64, i64) -> i64
      %5414 = func.call @cc_values_pack(%5413) : (i64) -> i64
      func.call @stack_push_pointer(%5411) : (i64) -> ()
      %5415 = func.call @stack_pop_pointer() : () -> i64
      %5416 = llvm.mlir.addressof @str465 : !llvm.ptr
      %5417 = arith.constant 9 : i64
      %5418 = func.call @cc_make_string(%5416, %5417) : (!llvm.ptr, i64) -> i64
      %5419 = llvm.mlir.addressof @str466 : !llvm.ptr
      %5420 = arith.constant 11 : i64
      %5421 = func.call @cc_make_string(%5419, %5420) : (!llvm.ptr, i64) -> i64
      %5422 = func.call @cc_intern(%5418, %5421) : (i64, i64) -> i64
      %5423 = func.call @cc_nil_value() : () -> i64
      %5424 = func.call @cc_cons(%5422, %5423) : (i64, i64) -> i64
      %5425 = func.call @cc_values_pack(%5424) : (i64) -> i64
      func.call @stack_push_pointer(%5422) : (i64) -> ()
      %5426 = func.call @stack_pop_pointer() : () -> i64
      %5427 = llvm.mlir.addressof @str467 : !llvm.ptr
      %5428 = arith.constant 10 : i64
      %5429 = func.call @cc_make_string(%5427, %5428) : (!llvm.ptr, i64) -> i64
      %5430 = llvm.mlir.addressof @str468 : !llvm.ptr
      %5431 = arith.constant 7 : i64
      %5432 = func.call @cc_make_string(%5430, %5431) : (!llvm.ptr, i64) -> i64
      %5433 = func.call @cc_intern(%5429, %5432) : (i64, i64) -> i64
      %5434 = func.call @cc_nil_value() : () -> i64
      %5435 = func.call @cc_cons(%5433, %5434) : (i64, i64) -> i64
      %5436 = func.call @cc_values_pack(%5435) : (i64) -> i64
      func.call @stack_push_pointer(%5433) : (i64) -> ()
      %5437 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %5438 = func.call @stack_pop_pointer() : () -> i64
      %5439 = llvm.mlir.addressof @str469 : !llvm.ptr
      %5440 = arith.constant 15 : i64
      %5441 = func.call @cc_make_string(%5439, %5440) : (!llvm.ptr, i64) -> i64
      %5442 = llvm.mlir.addressof @str470 : !llvm.ptr
      %5443 = arith.constant 7 : i64
      %5444 = func.call @cc_make_string(%5442, %5443) : (!llvm.ptr, i64) -> i64
      %5445 = func.call @cc_intern(%5441, %5444) : (i64, i64) -> i64
      %5446 = func.call @cc_nil_value() : () -> i64
      %5447 = func.call @cc_cons(%5445, %5446) : (i64, i64) -> i64
      %5448 = func.call @cc_values_pack(%5447) : (i64) -> i64
      func.call @stack_push_pointer(%5445) : (i64) -> ()
      %5449 = func.call @stack_pop_pointer() : () -> i64
      %5450 = arith.constant 67 : i64
      %5451 = func.call @cc_box_character(%5450) : (i64) -> i64
      func.call @stack_push_pointer(%5451) : (i64) -> ()
      %5452 = func.call @stack_pop_pointer() : () -> i64
      %5453 = func.call @cc_nil_value() : () -> i64
      %5454 = func.call @cc_errorp(%5404) : (i64) -> i64
      %5455 = arith.cmpi ne, %5454, %5453 : i64
      %5456 = arith.cmpi eq, %5453, %5453 : i64
      %5457 = arith.andi %5455, %5456 : i1
      %5458 = scf.if %5457 -> (i64) {
        scf.yield %5404 : i64
      } else {
        scf.yield %5453 : i64
      }
      %5459 = func.call @cc_errorp(%5415) : (i64) -> i64
      %5460 = arith.cmpi ne, %5459, %5453 : i64
      %5461 = arith.cmpi eq, %5458, %5453 : i64
      %5462 = arith.andi %5460, %5461 : i1
      %5463 = scf.if %5462 -> (i64) {
        scf.yield %5415 : i64
      } else {
        scf.yield %5458 : i64
      }
      %5464 = func.call @cc_errorp(%5426) : (i64) -> i64
      %5465 = arith.cmpi ne, %5464, %5453 : i64
      %5466 = arith.cmpi eq, %5463, %5453 : i64
      %5467 = arith.andi %5465, %5466 : i1
      %5468 = scf.if %5467 -> (i64) {
        scf.yield %5426 : i64
      } else {
        scf.yield %5463 : i64
      }
      %5469 = func.call @cc_errorp(%5437) : (i64) -> i64
      %5470 = arith.cmpi ne, %5469, %5453 : i64
      %5471 = arith.cmpi eq, %5468, %5453 : i64
      %5472 = arith.andi %5470, %5471 : i1
      %5473 = scf.if %5472 -> (i64) {
        scf.yield %5437 : i64
      } else {
        scf.yield %5468 : i64
      }
      %5474 = func.call @cc_errorp(%5438) : (i64) -> i64
      %5475 = arith.cmpi ne, %5474, %5453 : i64
      %5476 = arith.cmpi eq, %5473, %5453 : i64
      %5477 = arith.andi %5475, %5476 : i1
      %5478 = scf.if %5477 -> (i64) {
        scf.yield %5438 : i64
      } else {
        scf.yield %5473 : i64
      }
      %5479 = func.call @cc_errorp(%5449) : (i64) -> i64
      %5480 = arith.cmpi ne, %5479, %5453 : i64
      %5481 = arith.cmpi eq, %5478, %5453 : i64
      %5482 = arith.andi %5480, %5481 : i1
      %5483 = scf.if %5482 -> (i64) {
        scf.yield %5449 : i64
      } else {
        scf.yield %5478 : i64
      }
      %5484 = func.call @cc_errorp(%5452) : (i64) -> i64
      %5485 = arith.cmpi ne, %5484, %5453 : i64
      %5486 = arith.cmpi eq, %5483, %5453 : i64
      %5487 = arith.andi %5485, %5486 : i1
      %5488 = scf.if %5487 -> (i64) {
        scf.yield %5452 : i64
      } else {
        scf.yield %5483 : i64
      }
      %5489 = arith.cmpi ne, %5488, %5453 : i64
      scf.if %5489 {
        func.call @stack_push_pointer(%5488) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5404) : (i64) -> ()
        func.call @stack_push_pointer(%5415) : (i64) -> ()
        func.call @stack_push_pointer(%5426) : (i64) -> ()
        func.call @stack_push_pointer(%5437) : (i64) -> ()
        func.call @stack_push_pointer(%5438) : (i64) -> ()
        func.call @stack_push_pointer(%5449) : (i64) -> ()
        func.call @stack_push_pointer(%5452) : (i64) -> ()
        %5490 = llvm.mlir.addressof @str471 : !llvm.ptr
        %5491 = func.call @cc_make_function_ref_const(%5490) : (!llvm.ptr) -> i64
        %5492 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%5491, %5492) : (i64, i64) -> ()
      }
      %5493 = func.call @stack_pop_pointer() : () -> i64
      %5494 = func.call @cc_nil_value() : () -> i64
      %5495 = func.call @cc_errorp(%5493) : (i64) -> i64
      %5496 = arith.cmpi ne, %5495, %5494 : i64
      %5497 = arith.cmpi eq, %5494, %5494 : i64
      %5498 = arith.andi %5496, %5497 : i1
      %5499 = scf.if %5498 -> (i64) {
        scf.yield %5493 : i64
      } else {
        scf.yield %5494 : i64
      }
      %5500 = arith.cmpi ne, %5499, %5494 : i64
      scf.if %5500 {
        func.call @stack_push_pointer(%5499) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5493) : (i64) -> ()
        %5501 = llvm.mlir.addressof @str472 : !llvm.ptr
        %5502 = func.call @cc_make_function_ref_const(%5501) : (!llvm.ptr) -> i64
        %5503 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5502, %5503) : (i64, i64) -> ()
      }
      %5504 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5504 : i64
    }
    func.call @stack_push_pointer(%5402) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939416"() {
    %5717 = func.call @cc_nil_value() : () -> i64
    %5718 = func.call @cc_nil_value() : () -> i64
    %5719 = func.call @cc_errorp(%5717) : (i64) -> i64
    %5720 = arith.cmpi ne, %5719, %5718 : i64
    %5721 = scf.if %5720 -> (i64) {
      scf.yield %5717 : i64
    } else {
      %5722 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%5722) : (i64) -> ()
      %5723 = func.call @stack_pop_pointer() : () -> i64
      %5724 = llvm.mlir.addressof @str495 : !llvm.ptr
      %5725 = arith.constant 12 : i64
      %5726 = func.call @cc_make_string(%5724, %5725) : (!llvm.ptr, i64) -> i64
      %5727 = llvm.mlir.addressof @str496 : !llvm.ptr
      %5728 = arith.constant 7 : i64
      %5729 = func.call @cc_make_string(%5727, %5728) : (!llvm.ptr, i64) -> i64
      %5730 = func.call @cc_intern(%5726, %5729) : (i64, i64) -> i64
      %5731 = func.call @cc_nil_value() : () -> i64
      %5732 = func.call @cc_cons(%5730, %5731) : (i64, i64) -> i64
      %5733 = func.call @cc_values_pack(%5732) : (i64) -> i64
      func.call @stack_push_pointer(%5730) : (i64) -> ()
      %5734 = func.call @stack_pop_pointer() : () -> i64
      %5735 = llvm.mlir.addressof @str497 : !llvm.ptr
      %5736 = arith.constant 9 : i64
      %5737 = func.call @cc_make_string(%5735, %5736) : (!llvm.ptr, i64) -> i64
      %5738 = llvm.mlir.addressof @str498 : !llvm.ptr
      %5739 = arith.constant 11 : i64
      %5740 = func.call @cc_make_string(%5738, %5739) : (!llvm.ptr, i64) -> i64
      %5741 = func.call @cc_intern(%5737, %5740) : (i64, i64) -> i64
      %5742 = func.call @cc_nil_value() : () -> i64
      %5743 = func.call @cc_cons(%5741, %5742) : (i64, i64) -> i64
      %5744 = func.call @cc_values_pack(%5743) : (i64) -> i64
      func.call @stack_push_pointer(%5741) : (i64) -> ()
      %5745 = func.call @stack_pop_pointer() : () -> i64
      %5746 = llvm.mlir.addressof @str499 : !llvm.ptr
      %5747 = arith.constant 10 : i64
      %5748 = func.call @cc_make_string(%5746, %5747) : (!llvm.ptr, i64) -> i64
      %5749 = llvm.mlir.addressof @str500 : !llvm.ptr
      %5750 = arith.constant 7 : i64
      %5751 = func.call @cc_make_string(%5749, %5750) : (!llvm.ptr, i64) -> i64
      %5752 = func.call @cc_intern(%5748, %5751) : (i64, i64) -> i64
      %5753 = func.call @cc_nil_value() : () -> i64
      %5754 = func.call @cc_cons(%5752, %5753) : (i64, i64) -> i64
      %5755 = func.call @cc_values_pack(%5754) : (i64) -> i64
      func.call @stack_push_pointer(%5752) : (i64) -> ()
      %5756 = func.call @stack_pop_pointer() : () -> i64
      %5757 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%5757) : (i64) -> ()
      %5758 = func.call @stack_pop_pointer() : () -> i64
      %5759 = llvm.mlir.addressof @str501 : !llvm.ptr
      %5760 = arith.constant 15 : i64
      %5761 = func.call @cc_make_string(%5759, %5760) : (!llvm.ptr, i64) -> i64
      %5762 = llvm.mlir.addressof @str502 : !llvm.ptr
      %5763 = arith.constant 7 : i64
      %5764 = func.call @cc_make_string(%5762, %5763) : (!llvm.ptr, i64) -> i64
      %5765 = func.call @cc_intern(%5761, %5764) : (i64, i64) -> i64
      %5766 = func.call @cc_nil_value() : () -> i64
      %5767 = func.call @cc_cons(%5765, %5766) : (i64, i64) -> i64
      %5768 = func.call @cc_values_pack(%5767) : (i64) -> i64
      func.call @stack_push_pointer(%5765) : (i64) -> ()
      %5769 = func.call @stack_pop_pointer() : () -> i64
      %5770 = arith.constant 67 : i64
      %5771 = func.call @cc_box_character(%5770) : (i64) -> i64
      func.call @stack_push_pointer(%5771) : (i64) -> ()
      %5772 = func.call @stack_pop_pointer() : () -> i64
      %5773 = func.call @cc_nil_value() : () -> i64
      %5774 = func.call @cc_errorp(%5723) : (i64) -> i64
      %5775 = arith.cmpi ne, %5774, %5773 : i64
      %5776 = arith.cmpi eq, %5773, %5773 : i64
      %5777 = arith.andi %5775, %5776 : i1
      %5778 = scf.if %5777 -> (i64) {
        scf.yield %5723 : i64
      } else {
        scf.yield %5773 : i64
      }
      %5779 = func.call @cc_errorp(%5734) : (i64) -> i64
      %5780 = arith.cmpi ne, %5779, %5773 : i64
      %5781 = arith.cmpi eq, %5778, %5773 : i64
      %5782 = arith.andi %5780, %5781 : i1
      %5783 = scf.if %5782 -> (i64) {
        scf.yield %5734 : i64
      } else {
        scf.yield %5778 : i64
      }
      %5784 = func.call @cc_errorp(%5745) : (i64) -> i64
      %5785 = arith.cmpi ne, %5784, %5773 : i64
      %5786 = arith.cmpi eq, %5783, %5773 : i64
      %5787 = arith.andi %5785, %5786 : i1
      %5788 = scf.if %5787 -> (i64) {
        scf.yield %5745 : i64
      } else {
        scf.yield %5783 : i64
      }
      %5789 = func.call @cc_errorp(%5756) : (i64) -> i64
      %5790 = arith.cmpi ne, %5789, %5773 : i64
      %5791 = arith.cmpi eq, %5788, %5773 : i64
      %5792 = arith.andi %5790, %5791 : i1
      %5793 = scf.if %5792 -> (i64) {
        scf.yield %5756 : i64
      } else {
        scf.yield %5788 : i64
      }
      %5794 = func.call @cc_errorp(%5758) : (i64) -> i64
      %5795 = arith.cmpi ne, %5794, %5773 : i64
      %5796 = arith.cmpi eq, %5793, %5773 : i64
      %5797 = arith.andi %5795, %5796 : i1
      %5798 = scf.if %5797 -> (i64) {
        scf.yield %5758 : i64
      } else {
        scf.yield %5793 : i64
      }
      %5799 = func.call @cc_errorp(%5769) : (i64) -> i64
      %5800 = arith.cmpi ne, %5799, %5773 : i64
      %5801 = arith.cmpi eq, %5798, %5773 : i64
      %5802 = arith.andi %5800, %5801 : i1
      %5803 = scf.if %5802 -> (i64) {
        scf.yield %5769 : i64
      } else {
        scf.yield %5798 : i64
      }
      %5804 = func.call @cc_errorp(%5772) : (i64) -> i64
      %5805 = arith.cmpi ne, %5804, %5773 : i64
      %5806 = arith.cmpi eq, %5803, %5773 : i64
      %5807 = arith.andi %5805, %5806 : i1
      %5808 = scf.if %5807 -> (i64) {
        scf.yield %5772 : i64
      } else {
        scf.yield %5803 : i64
      }
      %5809 = arith.cmpi ne, %5808, %5773 : i64
      scf.if %5809 {
        func.call @stack_push_pointer(%5808) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5723) : (i64) -> ()
        func.call @stack_push_pointer(%5734) : (i64) -> ()
        func.call @stack_push_pointer(%5745) : (i64) -> ()
        func.call @stack_push_pointer(%5756) : (i64) -> ()
        func.call @stack_push_pointer(%5758) : (i64) -> ()
        func.call @stack_push_pointer(%5769) : (i64) -> ()
        func.call @stack_push_pointer(%5772) : (i64) -> ()
        %5810 = llvm.mlir.addressof @str503 : !llvm.ptr
        %5811 = func.call @cc_make_function_ref_const(%5810) : (!llvm.ptr) -> i64
        %5812 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%5811, %5812) : (i64, i64) -> ()
      }
      %5813 = func.call @stack_pop_pointer() : () -> i64
      %5814 = func.call @cc_nil_value() : () -> i64
      %5815 = func.call @cc_errorp(%5813) : (i64) -> i64
      %5816 = arith.cmpi ne, %5815, %5814 : i64
      %5817 = arith.cmpi eq, %5814, %5814 : i64
      %5818 = arith.andi %5816, %5817 : i1
      %5819 = scf.if %5818 -> (i64) {
        scf.yield %5813 : i64
      } else {
        scf.yield %5814 : i64
      }
      %5820 = arith.cmpi ne, %5819, %5814 : i64
      scf.if %5820 {
        func.call @stack_push_pointer(%5819) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%5813) : (i64) -> ()
        %5821 = llvm.mlir.addressof @str504 : !llvm.ptr
        %5822 = func.call @cc_make_function_ref_const(%5821) : (!llvm.ptr) -> i64
        %5823 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%5822, %5823) : (i64, i64) -> ()
      }
      %5824 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %5824 : i64
    }
    func.call @stack_push_pointer(%5721) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939417"() {
    %6036 = func.call @cc_nil_value() : () -> i64
    %6037 = func.call @cc_nil_value() : () -> i64
    %6038 = func.call @cc_errorp(%6036) : (i64) -> i64
    %6039 = arith.cmpi ne, %6038, %6037 : i64
    %6040 = scf.if %6039 -> (i64) {
      scf.yield %6036 : i64
    } else {
      %6041 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6041) : (i64) -> ()
      %6042 = func.call @stack_pop_pointer() : () -> i64
      %6043 = llvm.mlir.addressof @str527 : !llvm.ptr
      %6044 = arith.constant 12 : i64
      %6045 = func.call @cc_make_string(%6043, %6044) : (!llvm.ptr, i64) -> i64
      %6046 = llvm.mlir.addressof @str528 : !llvm.ptr
      %6047 = arith.constant 7 : i64
      %6048 = func.call @cc_make_string(%6046, %6047) : (!llvm.ptr, i64) -> i64
      %6049 = func.call @cc_intern(%6045, %6048) : (i64, i64) -> i64
      %6050 = func.call @cc_nil_value() : () -> i64
      %6051 = func.call @cc_cons(%6049, %6050) : (i64, i64) -> i64
      %6052 = func.call @cc_values_pack(%6051) : (i64) -> i64
      func.call @stack_push_pointer(%6049) : (i64) -> ()
      %6053 = func.call @stack_pop_pointer() : () -> i64
      %6054 = llvm.mlir.addressof @str529 : !llvm.ptr
      %6055 = arith.constant 9 : i64
      %6056 = func.call @cc_make_string(%6054, %6055) : (!llvm.ptr, i64) -> i64
      %6057 = llvm.mlir.addressof @str530 : !llvm.ptr
      %6058 = arith.constant 11 : i64
      %6059 = func.call @cc_make_string(%6057, %6058) : (!llvm.ptr, i64) -> i64
      %6060 = func.call @cc_intern(%6056, %6059) : (i64, i64) -> i64
      %6061 = func.call @cc_nil_value() : () -> i64
      %6062 = func.call @cc_cons(%6060, %6061) : (i64, i64) -> i64
      %6063 = func.call @cc_values_pack(%6062) : (i64) -> i64
      func.call @stack_push_pointer(%6060) : (i64) -> ()
      %6064 = func.call @stack_pop_pointer() : () -> i64
      %6065 = llvm.mlir.addressof @str531 : !llvm.ptr
      %6066 = arith.constant 10 : i64
      %6067 = func.call @cc_make_string(%6065, %6066) : (!llvm.ptr, i64) -> i64
      %6068 = llvm.mlir.addressof @str532 : !llvm.ptr
      %6069 = arith.constant 7 : i64
      %6070 = func.call @cc_make_string(%6068, %6069) : (!llvm.ptr, i64) -> i64
      %6071 = func.call @cc_intern(%6067, %6070) : (i64, i64) -> i64
      %6072 = func.call @cc_nil_value() : () -> i64
      %6073 = func.call @cc_cons(%6071, %6072) : (i64, i64) -> i64
      %6074 = func.call @cc_values_pack(%6073) : (i64) -> i64
      func.call @stack_push_pointer(%6071) : (i64) -> ()
      %6075 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6076 = func.call @stack_pop_pointer() : () -> i64
      %6077 = llvm.mlir.addressof @str533 : !llvm.ptr
      %6078 = arith.constant 15 : i64
      %6079 = func.call @cc_make_string(%6077, %6078) : (!llvm.ptr, i64) -> i64
      %6080 = llvm.mlir.addressof @str534 : !llvm.ptr
      %6081 = arith.constant 7 : i64
      %6082 = func.call @cc_make_string(%6080, %6081) : (!llvm.ptr, i64) -> i64
      %6083 = func.call @cc_intern(%6079, %6082) : (i64, i64) -> i64
      %6084 = func.call @cc_nil_value() : () -> i64
      %6085 = func.call @cc_cons(%6083, %6084) : (i64, i64) -> i64
      %6086 = func.call @cc_values_pack(%6085) : (i64) -> i64
      func.call @stack_push_pointer(%6083) : (i64) -> ()
      %6087 = func.call @stack_pop_pointer() : () -> i64
      %6088 = arith.constant 67 : i64
      %6089 = func.call @cc_box_character(%6088) : (i64) -> i64
      func.call @stack_push_pointer(%6089) : (i64) -> ()
      %6090 = func.call @stack_pop_pointer() : () -> i64
      %6091 = func.call @cc_nil_value() : () -> i64
      %6092 = func.call @cc_errorp(%6042) : (i64) -> i64
      %6093 = arith.cmpi ne, %6092, %6091 : i64
      %6094 = arith.cmpi eq, %6091, %6091 : i64
      %6095 = arith.andi %6093, %6094 : i1
      %6096 = scf.if %6095 -> (i64) {
        scf.yield %6042 : i64
      } else {
        scf.yield %6091 : i64
      }
      %6097 = func.call @cc_errorp(%6053) : (i64) -> i64
      %6098 = arith.cmpi ne, %6097, %6091 : i64
      %6099 = arith.cmpi eq, %6096, %6091 : i64
      %6100 = arith.andi %6098, %6099 : i1
      %6101 = scf.if %6100 -> (i64) {
        scf.yield %6053 : i64
      } else {
        scf.yield %6096 : i64
      }
      %6102 = func.call @cc_errorp(%6064) : (i64) -> i64
      %6103 = arith.cmpi ne, %6102, %6091 : i64
      %6104 = arith.cmpi eq, %6101, %6091 : i64
      %6105 = arith.andi %6103, %6104 : i1
      %6106 = scf.if %6105 -> (i64) {
        scf.yield %6064 : i64
      } else {
        scf.yield %6101 : i64
      }
      %6107 = func.call @cc_errorp(%6075) : (i64) -> i64
      %6108 = arith.cmpi ne, %6107, %6091 : i64
      %6109 = arith.cmpi eq, %6106, %6091 : i64
      %6110 = arith.andi %6108, %6109 : i1
      %6111 = scf.if %6110 -> (i64) {
        scf.yield %6075 : i64
      } else {
        scf.yield %6106 : i64
      }
      %6112 = func.call @cc_errorp(%6076) : (i64) -> i64
      %6113 = arith.cmpi ne, %6112, %6091 : i64
      %6114 = arith.cmpi eq, %6111, %6091 : i64
      %6115 = arith.andi %6113, %6114 : i1
      %6116 = scf.if %6115 -> (i64) {
        scf.yield %6076 : i64
      } else {
        scf.yield %6111 : i64
      }
      %6117 = func.call @cc_errorp(%6087) : (i64) -> i64
      %6118 = arith.cmpi ne, %6117, %6091 : i64
      %6119 = arith.cmpi eq, %6116, %6091 : i64
      %6120 = arith.andi %6118, %6119 : i1
      %6121 = scf.if %6120 -> (i64) {
        scf.yield %6087 : i64
      } else {
        scf.yield %6116 : i64
      }
      %6122 = func.call @cc_errorp(%6090) : (i64) -> i64
      %6123 = arith.cmpi ne, %6122, %6091 : i64
      %6124 = arith.cmpi eq, %6121, %6091 : i64
      %6125 = arith.andi %6123, %6124 : i1
      %6126 = scf.if %6125 -> (i64) {
        scf.yield %6090 : i64
      } else {
        scf.yield %6121 : i64
      }
      %6127 = arith.cmpi ne, %6126, %6091 : i64
      scf.if %6127 {
        func.call @stack_push_pointer(%6126) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6042) : (i64) -> ()
        func.call @stack_push_pointer(%6053) : (i64) -> ()
        func.call @stack_push_pointer(%6064) : (i64) -> ()
        func.call @stack_push_pointer(%6075) : (i64) -> ()
        func.call @stack_push_pointer(%6076) : (i64) -> ()
        func.call @stack_push_pointer(%6087) : (i64) -> ()
        func.call @stack_push_pointer(%6090) : (i64) -> ()
        %6128 = llvm.mlir.addressof @str535 : !llvm.ptr
        %6129 = func.call @cc_make_function_ref_const(%6128) : (!llvm.ptr) -> i64
        %6130 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%6129, %6130) : (i64, i64) -> ()
      }
      %6131 = func.call @stack_pop_pointer() : () -> i64
      %6132 = func.call @cc_nil_value() : () -> i64
      %6133 = func.call @cc_errorp(%6131) : (i64) -> i64
      %6134 = arith.cmpi ne, %6133, %6132 : i64
      %6135 = arith.cmpi eq, %6132, %6132 : i64
      %6136 = arith.andi %6134, %6135 : i1
      %6137 = scf.if %6136 -> (i64) {
        scf.yield %6131 : i64
      } else {
        scf.yield %6132 : i64
      }
      %6138 = arith.cmpi ne, %6137, %6132 : i64
      scf.if %6138 {
        func.call @stack_push_pointer(%6137) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6131) : (i64) -> ()
        %6139 = llvm.mlir.addressof @str536 : !llvm.ptr
        %6140 = func.call @cc_make_function_ref_const(%6139) : (!llvm.ptr) -> i64
        %6141 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6140, %6141) : (i64, i64) -> ()
      }
      %6142 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6142 : i64
    }
    func.call @stack_push_pointer(%6040) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939418"() {
    %6355 = func.call @cc_nil_value() : () -> i64
    %6356 = func.call @cc_nil_value() : () -> i64
    %6357 = func.call @cc_errorp(%6355) : (i64) -> i64
    %6358 = arith.cmpi ne, %6357, %6356 : i64
    %6359 = scf.if %6358 -> (i64) {
      scf.yield %6355 : i64
    } else {
      %6360 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%6360) : (i64) -> ()
      %6361 = func.call @stack_pop_pointer() : () -> i64
      %6362 = llvm.mlir.addressof @str559 : !llvm.ptr
      %6363 = arith.constant 12 : i64
      %6364 = func.call @cc_make_string(%6362, %6363) : (!llvm.ptr, i64) -> i64
      %6365 = llvm.mlir.addressof @str560 : !llvm.ptr
      %6366 = arith.constant 7 : i64
      %6367 = func.call @cc_make_string(%6365, %6366) : (!llvm.ptr, i64) -> i64
      %6368 = func.call @cc_intern(%6364, %6367) : (i64, i64) -> i64
      %6369 = func.call @cc_nil_value() : () -> i64
      %6370 = func.call @cc_cons(%6368, %6369) : (i64, i64) -> i64
      %6371 = func.call @cc_values_pack(%6370) : (i64) -> i64
      func.call @stack_push_pointer(%6368) : (i64) -> ()
      %6372 = func.call @stack_pop_pointer() : () -> i64
      %6373 = llvm.mlir.addressof @str561 : !llvm.ptr
      %6374 = arith.constant 9 : i64
      %6375 = func.call @cc_make_string(%6373, %6374) : (!llvm.ptr, i64) -> i64
      %6376 = llvm.mlir.addressof @str562 : !llvm.ptr
      %6377 = arith.constant 11 : i64
      %6378 = func.call @cc_make_string(%6376, %6377) : (!llvm.ptr, i64) -> i64
      %6379 = func.call @cc_intern(%6375, %6378) : (i64, i64) -> i64
      %6380 = func.call @cc_nil_value() : () -> i64
      %6381 = func.call @cc_cons(%6379, %6380) : (i64, i64) -> i64
      %6382 = func.call @cc_values_pack(%6381) : (i64) -> i64
      func.call @stack_push_pointer(%6379) : (i64) -> ()
      %6383 = func.call @stack_pop_pointer() : () -> i64
      %6384 = llvm.mlir.addressof @str563 : !llvm.ptr
      %6385 = arith.constant 10 : i64
      %6386 = func.call @cc_make_string(%6384, %6385) : (!llvm.ptr, i64) -> i64
      %6387 = llvm.mlir.addressof @str564 : !llvm.ptr
      %6388 = arith.constant 7 : i64
      %6389 = func.call @cc_make_string(%6387, %6388) : (!llvm.ptr, i64) -> i64
      %6390 = func.call @cc_intern(%6386, %6389) : (i64, i64) -> i64
      %6391 = func.call @cc_nil_value() : () -> i64
      %6392 = func.call @cc_cons(%6390, %6391) : (i64, i64) -> i64
      %6393 = func.call @cc_values_pack(%6392) : (i64) -> i64
      func.call @stack_push_pointer(%6390) : (i64) -> ()
      %6394 = func.call @stack_pop_pointer() : () -> i64
      %6395 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%6395) : (i64) -> ()
      %6396 = func.call @stack_pop_pointer() : () -> i64
      %6397 = llvm.mlir.addressof @str565 : !llvm.ptr
      %6398 = arith.constant 15 : i64
      %6399 = func.call @cc_make_string(%6397, %6398) : (!llvm.ptr, i64) -> i64
      %6400 = llvm.mlir.addressof @str566 : !llvm.ptr
      %6401 = arith.constant 7 : i64
      %6402 = func.call @cc_make_string(%6400, %6401) : (!llvm.ptr, i64) -> i64
      %6403 = func.call @cc_intern(%6399, %6402) : (i64, i64) -> i64
      %6404 = func.call @cc_nil_value() : () -> i64
      %6405 = func.call @cc_cons(%6403, %6404) : (i64, i64) -> i64
      %6406 = func.call @cc_values_pack(%6405) : (i64) -> i64
      func.call @stack_push_pointer(%6403) : (i64) -> ()
      %6407 = func.call @stack_pop_pointer() : () -> i64
      %6408 = arith.constant 67 : i64
      %6409 = func.call @cc_box_character(%6408) : (i64) -> i64
      func.call @stack_push_pointer(%6409) : (i64) -> ()
      %6410 = func.call @stack_pop_pointer() : () -> i64
      %6411 = func.call @cc_nil_value() : () -> i64
      %6412 = func.call @cc_errorp(%6361) : (i64) -> i64
      %6413 = arith.cmpi ne, %6412, %6411 : i64
      %6414 = arith.cmpi eq, %6411, %6411 : i64
      %6415 = arith.andi %6413, %6414 : i1
      %6416 = scf.if %6415 -> (i64) {
        scf.yield %6361 : i64
      } else {
        scf.yield %6411 : i64
      }
      %6417 = func.call @cc_errorp(%6372) : (i64) -> i64
      %6418 = arith.cmpi ne, %6417, %6411 : i64
      %6419 = arith.cmpi eq, %6416, %6411 : i64
      %6420 = arith.andi %6418, %6419 : i1
      %6421 = scf.if %6420 -> (i64) {
        scf.yield %6372 : i64
      } else {
        scf.yield %6416 : i64
      }
      %6422 = func.call @cc_errorp(%6383) : (i64) -> i64
      %6423 = arith.cmpi ne, %6422, %6411 : i64
      %6424 = arith.cmpi eq, %6421, %6411 : i64
      %6425 = arith.andi %6423, %6424 : i1
      %6426 = scf.if %6425 -> (i64) {
        scf.yield %6383 : i64
      } else {
        scf.yield %6421 : i64
      }
      %6427 = func.call @cc_errorp(%6394) : (i64) -> i64
      %6428 = arith.cmpi ne, %6427, %6411 : i64
      %6429 = arith.cmpi eq, %6426, %6411 : i64
      %6430 = arith.andi %6428, %6429 : i1
      %6431 = scf.if %6430 -> (i64) {
        scf.yield %6394 : i64
      } else {
        scf.yield %6426 : i64
      }
      %6432 = func.call @cc_errorp(%6396) : (i64) -> i64
      %6433 = arith.cmpi ne, %6432, %6411 : i64
      %6434 = arith.cmpi eq, %6431, %6411 : i64
      %6435 = arith.andi %6433, %6434 : i1
      %6436 = scf.if %6435 -> (i64) {
        scf.yield %6396 : i64
      } else {
        scf.yield %6431 : i64
      }
      %6437 = func.call @cc_errorp(%6407) : (i64) -> i64
      %6438 = arith.cmpi ne, %6437, %6411 : i64
      %6439 = arith.cmpi eq, %6436, %6411 : i64
      %6440 = arith.andi %6438, %6439 : i1
      %6441 = scf.if %6440 -> (i64) {
        scf.yield %6407 : i64
      } else {
        scf.yield %6436 : i64
      }
      %6442 = func.call @cc_errorp(%6410) : (i64) -> i64
      %6443 = arith.cmpi ne, %6442, %6411 : i64
      %6444 = arith.cmpi eq, %6441, %6411 : i64
      %6445 = arith.andi %6443, %6444 : i1
      %6446 = scf.if %6445 -> (i64) {
        scf.yield %6410 : i64
      } else {
        scf.yield %6441 : i64
      }
      %6447 = arith.cmpi ne, %6446, %6411 : i64
      scf.if %6447 {
        func.call @stack_push_pointer(%6446) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6361) : (i64) -> ()
        func.call @stack_push_pointer(%6372) : (i64) -> ()
        func.call @stack_push_pointer(%6383) : (i64) -> ()
        func.call @stack_push_pointer(%6394) : (i64) -> ()
        func.call @stack_push_pointer(%6396) : (i64) -> ()
        func.call @stack_push_pointer(%6407) : (i64) -> ()
        func.call @stack_push_pointer(%6410) : (i64) -> ()
        %6448 = llvm.mlir.addressof @str567 : !llvm.ptr
        %6449 = func.call @cc_make_function_ref_const(%6448) : (!llvm.ptr) -> i64
        %6450 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%6449, %6450) : (i64, i64) -> ()
      }
      %6451 = func.call @stack_pop_pointer() : () -> i64
      %6452 = func.call @cc_nil_value() : () -> i64
      %6453 = func.call @cc_errorp(%6451) : (i64) -> i64
      %6454 = arith.cmpi ne, %6453, %6452 : i64
      %6455 = arith.cmpi eq, %6452, %6452 : i64
      %6456 = arith.andi %6454, %6455 : i1
      %6457 = scf.if %6456 -> (i64) {
        scf.yield %6451 : i64
      } else {
        scf.yield %6452 : i64
      }
      %6458 = arith.cmpi ne, %6457, %6452 : i64
      scf.if %6458 {
        func.call @stack_push_pointer(%6457) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6451) : (i64) -> ()
        %6459 = llvm.mlir.addressof @str568 : !llvm.ptr
        %6460 = func.call @cc_make_function_ref_const(%6459) : (!llvm.ptr) -> i64
        %6461 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6460, %6461) : (i64, i64) -> ()
      }
      %6462 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6462 : i64
    }
    func.call @stack_push_pointer(%6359) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939419"() {
    %6594 = func.call @cc_nil_value() : () -> i64
    %6595 = func.call @cc_nil_value() : () -> i64
    %6596 = func.call @cc_errorp(%6594) : (i64) -> i64
    %6597 = arith.cmpi ne, %6596, %6595 : i64
    %6598 = scf.if %6597 -> (i64) {
      scf.yield %6594 : i64
    } else {
      %6599 = llvm.mlir.addressof @str582 : !llvm.ptr
      %6600 = arith.constant 3 : i64
      %6601 = func.call @cc_make_string(%6599, %6600) : (!llvm.ptr, i64) -> i64
      %6602 = llvm.mlir.addressof @str583 : !llvm.ptr
      %6603 = arith.constant 7 : i64
      %6604 = func.call @cc_make_string(%6602, %6603) : (!llvm.ptr, i64) -> i64
      %6605 = func.call @cc_intern(%6601, %6604) : (i64, i64) -> i64
      %6606 = func.call @cc_nil_value() : () -> i64
      %6607 = func.call @cc_cons(%6605, %6606) : (i64, i64) -> i64
      %6608 = func.call @cc_values_pack(%6607) : (i64) -> i64
      func.call @stack_push_pointer(%6605) : (i64) -> ()
      %6609 = func.call @stack_pop_pointer() : () -> i64
      %6610 = func.call @cc_nil_value() : () -> i64
      %6611 = func.call @cc_errorp(%6609) : (i64) -> i64
      %6612 = arith.cmpi ne, %6611, %6610 : i64
      %6613 = arith.cmpi eq, %6610, %6610 : i64
      %6614 = arith.andi %6612, %6613 : i1
      %6615 = scf.if %6614 -> (i64) {
        scf.yield %6609 : i64
      } else {
        scf.yield %6610 : i64
      }
      %6616 = arith.cmpi ne, %6615, %6610 : i64
      scf.if %6616 {
        func.call @stack_push_pointer(%6615) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6609) : (i64) -> ()
        %6617 = llvm.mlir.addressof @str584 : !llvm.ptr
        %6618 = func.call @cc_make_function_ref_const(%6617) : (!llvm.ptr) -> i64
        %6619 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6618, %6619) : (i64, i64) -> ()
      }
      %6620 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6620 : i64
    }
    func.call @stack_push_pointer(%6598) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939420"() {
    %6744 = func.call @cc_nil_value() : () -> i64
    %6745 = func.call @cc_nil_value() : () -> i64
    %6746 = func.call @cc_errorp(%6744) : (i64) -> i64
    %6747 = arith.cmpi ne, %6746, %6745 : i64
    %6748 = scf.if %6747 -> (i64) {
      scf.yield %6744 : i64
    } else {
      %6749 = arith.constant 67 : i64
      %6750 = func.call @cc_box_character(%6749) : (i64) -> i64
      func.call @stack_push_pointer(%6750) : (i64) -> ()
      %6751 = func.call @stack_pop_pointer() : () -> i64
      %6752 = func.call @cc_nil_value() : () -> i64
      %6753 = func.call @cc_errorp(%6751) : (i64) -> i64
      %6754 = arith.cmpi ne, %6753, %6752 : i64
      %6755 = arith.cmpi eq, %6752, %6752 : i64
      %6756 = arith.andi %6754, %6755 : i1
      %6757 = scf.if %6756 -> (i64) {
        scf.yield %6751 : i64
      } else {
        scf.yield %6752 : i64
      }
      %6758 = arith.cmpi ne, %6757, %6752 : i64
      scf.if %6758 {
        func.call @stack_push_pointer(%6757) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6751) : (i64) -> ()
        %6759 = llvm.mlir.addressof @str596 : !llvm.ptr
        %6760 = func.call @cc_make_function_ref_const(%6759) : (!llvm.ptr) -> i64
        %6761 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%6760, %6761) : (i64, i64) -> ()
      }
      %6762 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6762 : i64
    }
    func.call @stack_push_pointer(%6748) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939421"() {
    %6925 = func.call @cc_nil_value() : () -> i64
    %6926 = func.call @cc_nil_value() : () -> i64
    %6927 = func.call @cc_errorp(%6925) : (i64) -> i64
    %6928 = arith.cmpi ne, %6927, %6926 : i64
    %6929 = scf.if %6928 -> (i64) {
      scf.yield %6925 : i64
    } else {
      %6930 = llvm.mlir.addressof @str612 : !llvm.ptr
      %6931 = arith.constant 18 : i64
      %6932 = func.call @cc_make_string(%6930, %6931) : (!llvm.ptr, i64) -> i64
      %6933 = llvm.mlir.addressof @str613 : !llvm.ptr
      %6934 = arith.constant 11 : i64
      %6935 = func.call @cc_make_string(%6933, %6934) : (!llvm.ptr, i64) -> i64
      %6936 = func.call @cc_intern(%6932, %6935) : (i64, i64) -> i64
      %6937 = func.call @cc_nil_value() : () -> i64
      %6938 = func.call @cc_cons(%6936, %6937) : (i64, i64) -> i64
      %6939 = func.call @cc_values_pack(%6938) : (i64) -> i64
      func.call @stack_push_pointer(%6936) : (i64) -> ()
      %6940 = func.call @stack_pop_pointer() : () -> i64
      %6941 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%6941) : (i64) -> ()
      %6942 = func.call @stack_pop_pointer() : () -> i64
      %6943 = func.call @cc_nil_value() : () -> i64
      %6944 = func.call @cc_errorp(%6940) : (i64) -> i64
      %6945 = arith.cmpi ne, %6944, %6943 : i64
      %6946 = arith.cmpi eq, %6943, %6943 : i64
      %6947 = arith.andi %6945, %6946 : i1
      %6948 = scf.if %6947 -> (i64) {
        scf.yield %6940 : i64
      } else {
        scf.yield %6943 : i64
      }
      %6949 = func.call @cc_errorp(%6942) : (i64) -> i64
      %6950 = arith.cmpi ne, %6949, %6943 : i64
      %6951 = arith.cmpi eq, %6948, %6943 : i64
      %6952 = arith.andi %6950, %6951 : i1
      %6953 = scf.if %6952 -> (i64) {
        scf.yield %6942 : i64
      } else {
        scf.yield %6948 : i64
      }
      %6954 = arith.cmpi ne, %6953, %6943 : i64
      scf.if %6954 {
        func.call @stack_push_pointer(%6953) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%6940) : (i64) -> ()
        func.call @stack_push_pointer(%6942) : (i64) -> ()
        %6955 = llvm.mlir.addressof @str614 : !llvm.ptr
        %6956 = func.call @cc_make_function_ref_const(%6955) : (!llvm.ptr) -> i64
        %6957 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%6956, %6957) : (i64, i64) -> ()
      }
      %6958 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %6959 = func.call @stack_pop_pointer() : () -> i64
      %6960 = func.call @cc_cons(%6958, %6959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%6960) : (i64) -> ()
      %6961 = func.call @stack_pop_pointer() : () -> i64
      %6962 = func.call @cc_values_pack(%6961) : (i64) -> i64
      func.call @stack_push_pointer(%6962) : (i64) -> ()
      %6963 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %6963 : i64
    }
    func.call @stack_push_pointer(%6929) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939422"() {
    %7147 = func.call @cc_nil_value() : () -> i64
    %7148 = func.call @cc_nil_value() : () -> i64
    %7149 = func.call @cc_errorp(%7147) : (i64) -> i64
    %7150 = arith.cmpi ne, %7149, %7148 : i64
    %7151 = scf.if %7150 -> (i64) {
      scf.yield %7147 : i64
    } else {
      %7152 = llvm.mlir.addressof @str632 : !llvm.ptr
      %7153 = arith.constant 13 : i64
      %7154 = func.call @cc_make_string(%7152, %7153) : (!llvm.ptr, i64) -> i64
      %7155 = llvm.mlir.addressof @str633 : !llvm.ptr
      %7156 = arith.constant 11 : i64
      %7157 = func.call @cc_make_string(%7155, %7156) : (!llvm.ptr, i64) -> i64
      %7158 = func.call @cc_intern(%7154, %7157) : (i64, i64) -> i64
      %7159 = func.call @cc_nil_value() : () -> i64
      %7160 = func.call @cc_cons(%7158, %7159) : (i64, i64) -> i64
      %7161 = func.call @cc_values_pack(%7160) : (i64) -> i64
      func.call @stack_push_pointer(%7158) : (i64) -> ()
      %7162 = func.call @stack_pop_pointer() : () -> i64
      %7163 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%7163) : (i64) -> ()
      %7164 = func.call @stack_pop_pointer() : () -> i64
      %7165 = func.call @cc_nil_value() : () -> i64
      %7166 = func.call @cc_errorp(%7162) : (i64) -> i64
      %7167 = arith.cmpi ne, %7166, %7165 : i64
      %7168 = arith.cmpi eq, %7165, %7165 : i64
      %7169 = arith.andi %7167, %7168 : i1
      %7170 = scf.if %7169 -> (i64) {
        scf.yield %7162 : i64
      } else {
        scf.yield %7165 : i64
      }
      %7171 = func.call @cc_errorp(%7164) : (i64) -> i64
      %7172 = arith.cmpi ne, %7171, %7165 : i64
      %7173 = arith.cmpi eq, %7170, %7165 : i64
      %7174 = arith.andi %7172, %7173 : i1
      %7175 = scf.if %7174 -> (i64) {
        scf.yield %7164 : i64
      } else {
        scf.yield %7170 : i64
      }
      %7176 = arith.cmpi ne, %7175, %7165 : i64
      scf.if %7176 {
        func.call @stack_push_pointer(%7175) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7162) : (i64) -> ()
        func.call @stack_push_pointer(%7164) : (i64) -> ()
        %7177 = llvm.mlir.addressof @str634 : !llvm.ptr
        %7178 = func.call @cc_make_function_ref_const(%7177) : (!llvm.ptr) -> i64
        %7179 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%7178, %7179) : (i64, i64) -> ()
      }
      %7180 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %7181 = func.call @stack_pop_pointer() : () -> i64
      %7182 = func.call @cc_cons(%7180, %7181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7182) : (i64) -> ()
      %7183 = func.call @stack_pop_pointer() : () -> i64
      %7184 = func.call @cc_values_pack(%7183) : (i64) -> i64
      func.call @stack_push_pointer(%7184) : (i64) -> ()
      %7185 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7185 : i64
    }
    func.call @stack_push_pointer(%7151) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939423"() {
    %7337 = func.call @cc_nil_value() : () -> i64
    %7338 = func.call @cc_nil_value() : () -> i64
    %7339 = func.call @cc_errorp(%7337) : (i64) -> i64
    %7340 = arith.cmpi ne, %7339, %7338 : i64
    %7341 = scf.if %7340 -> (i64) {
      scf.yield %7337 : i64
    } else {
      %7342 = llvm.mlir.addressof @str650 : !llvm.ptr
      %7343 = arith.constant 1 : i64
      %7344 = func.call @cc_make_string(%7342, %7343) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7344) : (i64) -> ()
      %7345 = llvm.mlir.addressof @str651 : !llvm.ptr
      %7346 = arith.constant 1 : i64
      %7347 = func.call @cc_make_string(%7345, %7346) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7347) : (i64) -> ()
      %7348 = llvm.mlir.addressof @str652 : !llvm.ptr
      %7349 = arith.constant 8 : i64
      %7350 = func.call @cc_make_string(%7348, %7349) : (!llvm.ptr, i64) -> i64
      %7351 = llvm.mlir.addressof @str653 : !llvm.ptr
      %7352 = arith.constant 11 : i64
      %7353 = func.call @cc_make_string(%7351, %7352) : (!llvm.ptr, i64) -> i64
      %7354 = func.call @cc_intern(%7350, %7353) : (i64, i64) -> i64
      %7355 = func.call @cc_nil_value() : () -> i64
      %7356 = func.call @cc_cons(%7354, %7355) : (i64, i64) -> i64
      %7357 = func.call @cc_values_pack(%7356) : (i64) -> i64
      %7358 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%7354, %7358) : (i64, i64) -> ()
      %7359 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7359 : i64
    }
    func.call @stack_push_pointer(%7341) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939424"() {
    %7486 = func.call @cc_nil_value() : () -> i64
    %7487 = func.call @cc_nil_value() : () -> i64
    %7488 = func.call @cc_errorp(%7486) : (i64) -> i64
    %7489 = arith.cmpi ne, %7488, %7487 : i64
    %7490 = scf.if %7489 -> (i64) {
      scf.yield %7486 : i64
    } else {
      %7491 = llvm.mlir.addressof @str665 : !llvm.ptr
      %7492 = arith.constant 1 : i64
      %7493 = func.call @cc_make_string(%7491, %7492) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7493) : (i64) -> ()
      %7494 = llvm.mlir.addressof @str666 : !llvm.ptr
      %7495 = arith.constant 1 : i64
      %7496 = func.call @cc_make_string(%7494, %7495) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7496) : (i64) -> ()
      %7497 = llvm.mlir.addressof @str667 : !llvm.ptr
      %7498 = arith.constant 16 : i64
      %7499 = func.call @cc_make_string(%7497, %7498) : (!llvm.ptr, i64) -> i64
      %7500 = llvm.mlir.addressof @str668 : !llvm.ptr
      %7501 = arith.constant 11 : i64
      %7502 = func.call @cc_make_string(%7500, %7501) : (!llvm.ptr, i64) -> i64
      %7503 = func.call @cc_intern(%7499, %7502) : (i64, i64) -> i64
      %7504 = func.call @cc_nil_value() : () -> i64
      %7505 = func.call @cc_cons(%7503, %7504) : (i64, i64) -> i64
      %7506 = func.call @cc_values_pack(%7505) : (i64) -> i64
      %7507 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%7503, %7507) : (i64, i64) -> ()
      %7508 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %7508 : i64
    }
    func.call @stack_push_pointer(%7490) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939425"() {
    %7905 = func.call @cc_nil_value() : () -> i64
    %7906 = func.call @cc_nil_value() : () -> i64
    %7907 = func.call @cc_errorp(%7905) : (i64) -> i64
    %7908 = arith.cmpi ne, %7907, %7906 : i64
    %7909 = scf.if %7908 -> (i64) {
      scf.yield %7905 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %7910 = llvm.mlir.addressof @str706 : !llvm.ptr
      %7911 = arith.constant 4 : i64
      %7912 = func.call @cc_make_string(%7910, %7911) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%7912) : (i64) -> ()
      %7913 = func.call @stack_pop_pointer() : () -> i64
      %7914 = func.call @cc_copy_seq(%7913) : (i64) -> i64
      func.call @stack_push_pointer(%7914) : (i64) -> ()
      %7915 = func.call @stack_pop_pointer() : () -> i64
      %7916 = func.call @cc_nil_value() : () -> i64
      %7917 = func.call @cc_nil_value() : () -> i64
      %7918 = func.call @cc_errorp(%7916) : (i64) -> i64
      %7919 = arith.cmpi ne, %7918, %7917 : i64
      %7920 = scf.if %7919 -> (i64) {
        scf.yield %7916 : i64
      } else {
        func.call @stack_push_pointer(%7915) : (i64) -> ()
        %7921 = arith.constant 1 : i64
        func.call @stack_push_fixnum(%7921) : (i64) -> ()
        %7922 = func.call @stack_pop_pointer() : () -> i64
        %7923 = func.call @stack_pop_pointer() : () -> i64
        %7925 = arith.constant 256 : i64
        func.call @stack_push_fixnum(%7925) : (i64) -> ()
        %7926 = func.call @stack_pop_pointer() : () -> i64
        %7927 = func.call @cc_unbox_fixnum(%7926) : (i64) -> i64
        %7924 = func.call @cc_box_character(%7927) : (i64) -> i64
        %7928 = func.call @cc_set_char(%7923, %7922, %7924) : (i64, i64, i64) -> i64
        func.call @stack_push_pointer(%7928) : (i64) -> ()
        %7929 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7929 : i64
      }
      %7930 = func.call @cc_nil_value() : () -> i64
      %7931 = func.call @cc_errorp(%7920) : (i64) -> i64
      %7932 = arith.cmpi ne, %7931, %7930 : i64
      %7933 = scf.if %7932 -> (i64) {
        scf.yield %7920 : i64
      } else {
        func.call @stack_push_pointer(%7915) : (i64) -> ()
        %7934 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %7934 : i64
      }
      func.call @stack_push_pointer(%7933) : (i64) -> ()
      %7935 = func.call @stack_pop_pointer() : () -> i64
      %7936 = func.call @stack_pop_pointer() : () -> i64
      %7937 = func.call @cc_cons(%7935, %7936) : (i64, i64) -> i64
      func.call @stack_push_pointer(%7937) : (i64) -> ()
      %7938 = arith.constant 4 : i64
      func.call @stack_push_fixnum(%7938) : (i64) -> ()
      %7939 = func.call @stack_pop_pointer() : () -> i64
      %7940 = llvm.mlir.addressof @str707 : !llvm.ptr
      %7941 = arith.constant 12 : i64
      %7942 = func.call @cc_make_string(%7940, %7941) : (!llvm.ptr, i64) -> i64
      %7943 = llvm.mlir.addressof @str708 : !llvm.ptr
      %7944 = arith.constant 7 : i64
      %7945 = func.call @cc_make_string(%7943, %7944) : (!llvm.ptr, i64) -> i64
      %7946 = func.call @cc_intern(%7942, %7945) : (i64, i64) -> i64
      %7947 = func.call @cc_nil_value() : () -> i64
      %7948 = func.call @cc_cons(%7946, %7947) : (i64, i64) -> i64
      %7949 = func.call @cc_values_pack(%7948) : (i64) -> i64
      func.call @stack_push_pointer(%7946) : (i64) -> ()
      %7950 = func.call @stack_pop_pointer() : () -> i64
      %7951 = llvm.mlir.addressof @str709 : !llvm.ptr
      %7952 = arith.constant 9 : i64
      %7953 = func.call @cc_make_string(%7951, %7952) : (!llvm.ptr, i64) -> i64
      %7954 = llvm.mlir.addressof @str710 : !llvm.ptr
      %7955 = arith.constant 11 : i64
      %7956 = func.call @cc_make_string(%7954, %7955) : (!llvm.ptr, i64) -> i64
      %7957 = func.call @cc_intern(%7953, %7956) : (i64, i64) -> i64
      %7958 = func.call @cc_nil_value() : () -> i64
      %7959 = func.call @cc_cons(%7957, %7958) : (i64, i64) -> i64
      %7960 = func.call @cc_values_pack(%7959) : (i64) -> i64
      func.call @stack_push_pointer(%7957) : (i64) -> ()
      %7961 = func.call @stack_pop_pointer() : () -> i64
      %7962 = llvm.mlir.addressof @str711 : !llvm.ptr
      %7963 = arith.constant 16 : i64
      %7964 = func.call @cc_make_string(%7962, %7963) : (!llvm.ptr, i64) -> i64
      %7965 = llvm.mlir.addressof @str712 : !llvm.ptr
      %7966 = arith.constant 7 : i64
      %7967 = func.call @cc_make_string(%7965, %7966) : (!llvm.ptr, i64) -> i64
      %7968 = func.call @cc_intern(%7964, %7967) : (i64, i64) -> i64
      %7969 = func.call @cc_nil_value() : () -> i64
      %7970 = func.call @cc_cons(%7968, %7969) : (i64, i64) -> i64
      %7971 = func.call @cc_values_pack(%7970) : (i64) -> i64
      func.call @stack_push_pointer(%7968) : (i64) -> ()
      %7972 = func.call @stack_pop_pointer() : () -> i64
      %7973 = arith.constant 63 : i64
      %7974 = func.call @cc_box_character(%7973) : (i64) -> i64
      func.call @stack_push_pointer(%7974) : (i64) -> ()
      %7975 = func.call @stack_pop_pointer() : () -> i64
      %7976 = arith.constant 256 : i64
      func.call @stack_push_fixnum(%7976) : (i64) -> ()
      %7977 = func.call @stack_pop_pointer() : () -> i64
      %7978 = func.call @cc_unbox_fixnum(%7977) : (i64) -> i64
      %7979 = func.call @cc_box_character(%7978) : (i64) -> i64
      func.call @stack_push_pointer(%7979) : (i64) -> ()
      %7980 = func.call @stack_pop_pointer() : () -> i64
      %7981 = arith.constant 63 : i64
      %7982 = func.call @cc_box_character(%7981) : (i64) -> i64
      func.call @stack_push_pointer(%7982) : (i64) -> ()
      %7983 = func.call @stack_pop_pointer() : () -> i64
      %7984 = arith.constant 63 : i64
      %7985 = func.call @cc_box_character(%7984) : (i64) -> i64
      func.call @stack_push_pointer(%7985) : (i64) -> ()
      %7986 = func.call @stack_pop_pointer() : () -> i64
      %7987 = func.call @cc_nil_value() : () -> i64
      %7988 = func.call @cc_errorp(%7975) : (i64) -> i64
      %7989 = arith.cmpi ne, %7988, %7987 : i64
      %7990 = arith.cmpi eq, %7987, %7987 : i64
      %7991 = arith.andi %7989, %7990 : i1
      %7992 = scf.if %7991 -> (i64) {
        scf.yield %7975 : i64
      } else {
        scf.yield %7987 : i64
      }
      %7993 = func.call @cc_errorp(%7980) : (i64) -> i64
      %7994 = arith.cmpi ne, %7993, %7987 : i64
      %7995 = arith.cmpi eq, %7992, %7987 : i64
      %7996 = arith.andi %7994, %7995 : i1
      %7997 = scf.if %7996 -> (i64) {
        scf.yield %7980 : i64
      } else {
        scf.yield %7992 : i64
      }
      %7998 = func.call @cc_errorp(%7983) : (i64) -> i64
      %7999 = arith.cmpi ne, %7998, %7987 : i64
      %8000 = arith.cmpi eq, %7997, %7987 : i64
      %8001 = arith.andi %7999, %8000 : i1
      %8002 = scf.if %8001 -> (i64) {
        scf.yield %7983 : i64
      } else {
        scf.yield %7997 : i64
      }
      %8003 = func.call @cc_errorp(%7986) : (i64) -> i64
      %8004 = arith.cmpi ne, %8003, %7987 : i64
      %8005 = arith.cmpi eq, %8002, %7987 : i64
      %8006 = arith.andi %8004, %8005 : i1
      %8007 = scf.if %8006 -> (i64) {
        scf.yield %7986 : i64
      } else {
        scf.yield %8002 : i64
      }
      %8008 = arith.cmpi ne, %8007, %7987 : i64
      scf.if %8008 {
        func.call @stack_push_pointer(%8007) : (i64) -> ()
      } else {
        %8009 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%8009) : (i64) -> ()
        func.call @stack_push_pointer(%7986) : (i64) -> ()
        %8010 = func.call @stack_pop_pointer() : () -> i64
        %8011 = func.call @stack_pop_pointer() : () -> i64
        %8012 = func.call @cc_cons(%8010, %8011) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8012) : (i64) -> ()
        func.call @stack_push_pointer(%7983) : (i64) -> ()
        %8013 = func.call @stack_pop_pointer() : () -> i64
        %8014 = func.call @stack_pop_pointer() : () -> i64
        %8015 = func.call @cc_cons(%8013, %8014) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8015) : (i64) -> ()
        func.call @stack_push_pointer(%7980) : (i64) -> ()
        %8016 = func.call @stack_pop_pointer() : () -> i64
        %8017 = func.call @stack_pop_pointer() : () -> i64
        %8018 = func.call @cc_cons(%8016, %8017) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8018) : (i64) -> ()
        func.call @stack_push_pointer(%7975) : (i64) -> ()
        %8019 = func.call @stack_pop_pointer() : () -> i64
        %8020 = func.call @stack_pop_pointer() : () -> i64
        %8021 = func.call @cc_cons(%8019, %8020) : (i64, i64) -> i64
        func.call @stack_push_pointer(%8021) : (i64) -> ()
      }
      %8022 = func.call @stack_pop_pointer() : () -> i64
      %8023 = func.call @cc_nil_value() : () -> i64
      %8024 = func.call @cc_errorp(%7939) : (i64) -> i64
      %8025 = arith.cmpi ne, %8024, %8023 : i64
      %8026 = arith.cmpi eq, %8023, %8023 : i64
      %8027 = arith.andi %8025, %8026 : i1
      %8028 = scf.if %8027 -> (i64) {
        scf.yield %7939 : i64
      } else {
        scf.yield %8023 : i64
      }
      %8029 = func.call @cc_errorp(%7950) : (i64) -> i64
      %8030 = arith.cmpi ne, %8029, %8023 : i64
      %8031 = arith.cmpi eq, %8028, %8023 : i64
      %8032 = arith.andi %8030, %8031 : i1
      %8033 = scf.if %8032 -> (i64) {
        scf.yield %7950 : i64
      } else {
        scf.yield %8028 : i64
      }
      %8034 = func.call @cc_errorp(%7961) : (i64) -> i64
      %8035 = arith.cmpi ne, %8034, %8023 : i64
      %8036 = arith.cmpi eq, %8033, %8023 : i64
      %8037 = arith.andi %8035, %8036 : i1
      %8038 = scf.if %8037 -> (i64) {
        scf.yield %7961 : i64
      } else {
        scf.yield %8033 : i64
      }
      %8039 = func.call @cc_errorp(%7972) : (i64) -> i64
      %8040 = arith.cmpi ne, %8039, %8023 : i64
      %8041 = arith.cmpi eq, %8038, %8023 : i64
      %8042 = arith.andi %8040, %8041 : i1
      %8043 = scf.if %8042 -> (i64) {
        scf.yield %7972 : i64
      } else {
        scf.yield %8038 : i64
      }
      %8044 = func.call @cc_errorp(%8022) : (i64) -> i64
      %8045 = arith.cmpi ne, %8044, %8023 : i64
      %8046 = arith.cmpi eq, %8043, %8023 : i64
      %8047 = arith.andi %8045, %8046 : i1
      %8048 = scf.if %8047 -> (i64) {
        scf.yield %8022 : i64
      } else {
        scf.yield %8043 : i64
      }
      %8049 = arith.cmpi ne, %8048, %8023 : i64
      scf.if %8049 {
        func.call @stack_push_pointer(%8048) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%7939) : (i64) -> ()
        func.call @stack_push_pointer(%7950) : (i64) -> ()
        func.call @stack_push_pointer(%7961) : (i64) -> ()
        func.call @stack_push_pointer(%7972) : (i64) -> ()
        func.call @stack_push_pointer(%8022) : (i64) -> ()
        %8050 = llvm.mlir.addressof @str713 : !llvm.ptr
        %8051 = func.call @cc_make_function_ref_const(%8050) : (!llvm.ptr) -> i64
        %8052 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%8051, %8052) : (i64, i64) -> ()
      }
      %8053 = func.call @stack_pop_pointer() : () -> i64
      %8054 = func.call @stack_pop_pointer() : () -> i64
      %8055 = func.call @cc_cons(%8053, %8054) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8055) : (i64) -> ()
      %8056 = func.call @stack_pop_pointer() : () -> i64
      %8057 = func.call @cc_string_equal_full(%8056) : (i64) -> i64
      func.call @stack_push_pointer(%8057) : (i64) -> ()
      %8058 = func.call @stack_pop_pointer() : () -> i64
      %8059 = func.call @cc_nil_value() : () -> i64
      %8060 = func.call @cc_cons(%8058, %8059) : (i64, i64) -> i64
      %8061 = func.call @cc_not(%8060) : (i64) -> i64
      func.call @stack_push_pointer(%8061) : (i64) -> ()
      %8062 = func.call @stack_pop_pointer() : () -> i64
      %8063 = func.call @cc_nil_value() : () -> i64
      %8064 = func.call @cc_cons(%8062, %8063) : (i64, i64) -> i64
      %8065 = func.call @cc_not(%8064) : (i64) -> i64
      func.call @stack_push_pointer(%8065) : (i64) -> ()
      %8066 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8066 : i64
    }
    func.call @stack_push_pointer(%7909) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_122791386939426"() {
    %8287 = func.call @cc_nil_value() : () -> i64
    %8288 = func.call @cc_nil_value() : () -> i64
    %8289 = func.call @cc_errorp(%8287) : (i64) -> i64
    %8290 = arith.cmpi ne, %8289, %8288 : i64
    %8291 = scf.if %8290 -> (i64) {
      scf.yield %8287 : i64
    } else {
      %8292 = llvm.mlir.addressof @str734 : !llvm.ptr
      %8293 = arith.constant 26 : i64
      %8294 = func.call @cc_make_string(%8292, %8293) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%8294) : (i64) -> ()
      %8295 = func.call @stack_pop_pointer() : () -> i64
      %8296 = func.call @cc_type_of(%8295) : (i64) -> i64
      func.call @stack_push_pointer(%8296) : (i64) -> ()
      %8297 = llvm.mlir.addressof @str735 : !llvm.ptr
      %8298 = arith.constant 12 : i64
      %8299 = func.call @cc_make_string(%8297, %8298) : (!llvm.ptr, i64) -> i64
      %8300 = llvm.mlir.addressof @str736 : !llvm.ptr
      %8301 = arith.constant 11 : i64
      %8302 = func.call @cc_make_string(%8300, %8301) : (!llvm.ptr, i64) -> i64
      %8303 = func.call @cc_intern(%8299, %8302) : (i64, i64) -> i64
      %8304 = func.call @cc_nil_value() : () -> i64
      %8305 = func.call @cc_cons(%8303, %8304) : (i64, i64) -> i64
      %8306 = func.call @cc_values_pack(%8305) : (i64) -> i64
      func.call @stack_push_pointer(%8303) : (i64) -> ()
      %8307 = llvm.mlir.addressof @str737 : !llvm.ptr
      %8308 = arith.constant 9 : i64
      %8309 = func.call @cc_make_string(%8307, %8308) : (!llvm.ptr, i64) -> i64
      %8310 = llvm.mlir.addressof @str738 : !llvm.ptr
      %8311 = arith.constant 11 : i64
      %8312 = func.call @cc_make_string(%8310, %8311) : (!llvm.ptr, i64) -> i64
      %8313 = func.call @cc_intern(%8309, %8312) : (i64, i64) -> i64
      %8314 = func.call @cc_nil_value() : () -> i64
      %8315 = func.call @cc_cons(%8313, %8314) : (i64, i64) -> i64
      %8316 = func.call @cc_values_pack(%8315) : (i64) -> i64
      func.call @stack_push_pointer(%8313) : (i64) -> ()
      %8317 = arith.constant 17 : i64
      func.call @stack_push_fixnum(%8317) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8318 = func.call @stack_pop_pointer() : () -> i64
      %8319 = func.call @stack_pop_pointer() : () -> i64
      %8320 = func.call @cc_cons(%8319, %8318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8320) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %8321 = func.call @stack_pop_pointer() : () -> i64
      %8322 = func.call @stack_pop_pointer() : () -> i64
      %8323 = func.call @cc_cons(%8322, %8321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8323) : (i64) -> ()
      %8324 = func.call @stack_pop_pointer() : () -> i64
      %8325 = func.call @stack_pop_pointer() : () -> i64
      %8326 = func.call @cc_cons(%8325, %8324) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8326) : (i64) -> ()
      %8327 = func.call @stack_pop_pointer() : () -> i64
      %8328 = func.call @stack_pop_pointer() : () -> i64
      %8329 = func.call @cc_cons(%8328, %8327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8329) : (i64) -> ()
      %8330 = func.call @stack_pop_pointer() : () -> i64
      %8331 = func.call @stack_pop_pointer() : () -> i64
      %8332 = func.call @cc_equal(%8331, %8330) : (i64, i64) -> i64
      func.call @stack_push_pointer(%8332) : (i64) -> ()
      %8333 = func.call @stack_pop_pointer() : () -> i64
      %8334 = func.call @cc_nil_value() : () -> i64
      %8335 = func.call @cc_cons(%8333, %8334) : (i64, i64) -> i64
      %8336 = func.call @cc_not(%8335) : (i64) -> i64
      func.call @stack_push_pointer(%8336) : (i64) -> ()
      %8337 = func.call @stack_pop_pointer() : () -> i64
      %8338 = func.call @cc_nil_value() : () -> i64
      %8339 = func.call @cc_cons(%8337, %8338) : (i64, i64) -> i64
      %8340 = func.call @cc_not(%8339) : (i64) -> i64
      func.call @stack_push_pointer(%8340) : (i64) -> ()
      %8341 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %8341 : i64
    }
    func.call @stack_push_pointer(%8291) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_122791386939392*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_122791386939392*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_122791386939392*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("REVERSE-STRING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str6("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str7("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str8("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str9("REVERSE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("S\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str12("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str13("cba\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str14("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str21("SUBSEQ-OOB\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str22("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str23("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str26("SUBSEQ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str27("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str29("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str30("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str31("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str32("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str37("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str38("STRINGS-WITH-NUL0\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str39("SUBSTITUTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("PRIN1-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("PRIN1-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str48("\22aaa\22\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str49("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str51("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str52("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str53("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str55("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str56("STRINGS-WITH-NUL1\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str57("SUBSTITUTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("WITH-OUTPUT-TO-STRING\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str60("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str61("STR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str62("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str63("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str64("STR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str65("PRINC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("123\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str68("STR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str69("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str70("123\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str71("PRINC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str72("X123\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str73("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str75("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str78("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str79("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str80("CONCATENATE-WITH-NUL0\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str81("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str82("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str83("CONCATENATE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str86("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str87("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str88("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str91("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str92("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str93("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str94("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str96("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str97("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str100("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str101("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str102("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str103("CONCATENATE-WITH-NUL1\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str104("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str105("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str106("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str108("CONCATENATE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str113("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str114("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str115("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str116("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str117("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str118("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str119("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str120("~c~c~cabc\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str121("~c~c~cabc\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str122("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str123("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str124("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str125("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str126("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str127("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str128("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str129("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str130("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str131("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str132("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str133("COPY-SEQ-WITH-NUL0\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str134("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str135("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str136("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str138("COPY-SEQ\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str139("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str140("CONCATENATE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str142("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str143("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str144("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str145("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str146("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str147("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str148("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str149("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str150("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str151("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str152("~c~c~cabc\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str153("~c~c~cabc\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str154("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str155("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str156("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str157("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str158("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str159("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str160("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str161("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str162("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str163("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str164("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str165("STRING=-WITH-NUL0\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str166("SUBSTITUTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str167("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str168("SUBSEQ\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("CONCATENATE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str173("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str174("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str175("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str176("MAKE-STRING\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str177("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str178("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str179("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str180("bcd\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str181("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str182("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str183("bcd\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str184("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str185("aXXXbcd\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str186("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str187("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str188("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str189("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str190("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str191("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str192("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str193("PARSE-INTEGER0\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str194("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str195("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str196("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str197("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str198("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str199("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str200("123 456\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str201("123 456\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str202("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str203("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str204("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str205("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str206("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str207("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str208("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str209("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str210("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str211("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str212("PARSE-INTEGER1\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str213("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str214("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str215(" 123 \00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str216(" 123 \00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str217("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str218("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str219("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str220("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str221("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str222("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str223("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str224("PARSE-INTEGER2\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str225("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str226("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str227("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str228("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str229("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str230("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("   123a\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str232("   123a\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str233("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str234("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str235("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str237("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str238("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str239("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str240("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str241("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str242("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str243("PARSE-INTEGER3\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str244("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246(" +123 \00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str247(" +123 \00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str248("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str249("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str250("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str251("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str252("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str253("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str254("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str255("PARSE-INTEGER3A\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str256("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str257("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str258(" -123 \00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str259(" -123 \00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str260("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str261("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str262("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str263("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str264("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str265("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str266("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str267("PARSE-INTEGER4\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str268("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str269("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str270("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str271("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str272("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str273("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str274(" +-123 \00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str275(" +-123 \00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str276("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str277("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str278("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str279("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str280("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str281("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str282("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str283("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str284("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str285("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str286("PARSE-INTEGER5\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str287("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str288("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289(" 123a\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str290("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str291("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str292(" 123a\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str293("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str294("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str295("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str296("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str297("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str298("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str299("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str300("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str301("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str302("PARSE-INTEGER6\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str303("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str304("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str305("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str306("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str307("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str308("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str309("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str310("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str311("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str312("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str313("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str314("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str315("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str316("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str317("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str318("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str319("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str320("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str321("PARSE-INTEGER7\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str322("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str323("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str324("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str325("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str326("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str327("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str328("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str329("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str330("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str331("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str332("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str333("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str334("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str335("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str336("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str337("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str338("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str339("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str340("PARSE-INTEGER8\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str341("IGNORE-ERRORS\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str342("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str343("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str344("MULTIPLE-VALUE-LIST\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str345("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str346("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str347("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str348("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str349("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str350("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str351("PARSE-ERROR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str352("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str353("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str354("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str355("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str356("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str357("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str358("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str359("PARSE-INTEGER9\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str360("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str361("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str362("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str363("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str364("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str365("+\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str366("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str367("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str368("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str369("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str370("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str371("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str372("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str373("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str374("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str375("PARSE-INTEGER10\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str376("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str377("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str378("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str379("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str380("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str381("-\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str382("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str383("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str384("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str385("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str386("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str387("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str388("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str389("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str390("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str391("PARSE-INTEGER11\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str392("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str393("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str394("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str395("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str396("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str397("\00") : !llvm.array<1 x i8>
  llvm.mlir.global private constant @str398("JUNK-ALLOWED\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str399("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str400("PARSE-INTEGER\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str401("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str402("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str403("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str404("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str405("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str406("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str407("TYPE-OF-STRING\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str408("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str409("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str410("OR\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str411("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str412("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str413("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str414("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str415("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str416("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str417("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str418("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str419("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str420("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str421("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str422("SUBTYPEP\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str423("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str424("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str425("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str426("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str427("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str428("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str429("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str430("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str431("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str432("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str433("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str434("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str435("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str436("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str437("abc\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str438("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str439("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str440("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str441("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str442("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str443("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str444("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str445("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str446("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str447("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str448("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str449("COPY-TO-SIMPLE-BASE-STRING0\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str450("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str451("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str452("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str453("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str454("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str455("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str456("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str457("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str458("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str459("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str460("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str461("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str462("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str463("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str464("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str465("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str466("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str467("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str468("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str469("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str470("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str471("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str472("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str473("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str474("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str475("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str476("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str477("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str478("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str479("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str480("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str481("COPY-TO-SIMPLE-BASE-STRING1\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str482("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str483("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str484("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str485("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str486("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str487("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str488("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str489("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str490("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str491("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str492("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str493("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str494("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str495("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str496("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str497("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str498("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str499("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str500("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str501("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str502("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str503("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str504("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str505("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str506("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str507("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str508("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str509("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str510("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str511("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str512("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str513("COPY-TO-SIMPLE-BASE-STRING2\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str514("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str515("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str516("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str517("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str518("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str519("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str520("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str521("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str522("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str523("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str524("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str525("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str526("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str527("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str528("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str529("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str530("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str531("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str532("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str533("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str534("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str535("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str536("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str537("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str538("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str539("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str540("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str541("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str542("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str543("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str544("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str545("COPY-TO-SIMPLE-BASE-STRING3\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str546("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str547("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str548("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str549("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str550("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str551("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str552("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str553("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str554("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str555("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str556("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str557("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str558("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str559("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str560("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str561("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str562("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str563("ADJUSTABLE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str564("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str565("INITIAL-ELEMENT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str566("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str567("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str568("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str569("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str570("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str571("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str572("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str573("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str574("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str575("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str576("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str577("COPY-TO-SIMPLE-BASE-STRING4\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str578("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str579("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str580("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str581("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str582("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str583("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str584("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str585("CCC\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str586("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str587("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str588("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str589("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str590("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str591("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str592("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str593("COPY-TO-SIMPLE-BASE-STRING5\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str594("COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str595("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str596("CORE:COPY-TO-SIMPLE-BASE-STRING\00") : !llvm.array<32 x i8>
  llvm.mlir.global private constant @str597("C\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str598("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str599("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str600("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str601("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str602("STRING=\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str603("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str604("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str605("CLOSEST-SEQUENCE-TYPE0\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str606("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str607("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str608("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str609("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str610("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str611("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str612("SIMPLE-BASE-STRING\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str613("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str614("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str615("VECTOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str616("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str617("BASE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str618("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str619("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str620("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str621("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str622("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str623("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str624("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str625("CLOSEST-SEQUENCE-TYPE1\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str626("VALUES\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str627("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str628("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str629("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str630("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str631("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str632("SIMPLE-STRING\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str633("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str634("MAKE-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str635("VECTOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str636("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str637("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str638("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str639("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str640("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str641("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str642("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str643("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str644("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str645("EQL-1\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str646("STRING/=\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str647("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str648("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str649("b\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str650("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str651("b\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str652("STRING/=\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str653("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str654("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str655("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str656("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str657("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str658("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str659("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str660("EQL-2\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str661("STRING-NOT-EQUAL\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str662("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str663("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str664("b\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str665("a\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str666("b\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str667("STRING-NOT-EQUAL\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str668("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str669("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str670("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str671("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str672("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str673("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str674("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str675("BABEL-SIMPLE-STRINGS-1\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str676("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str677("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str678("STRING-EQUAL\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str679("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str680("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str681("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str682("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str683("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str684("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str685("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str686("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str687("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str688("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str689("LIST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str690("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str691("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str692("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str693("LET\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str694("VAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str695("COPY-SEQ\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str696("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str697("????\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str698("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str699("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str700("CHAR\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str701("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str702("VAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str703("CODE-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str704("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str705("VAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str706("????\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str707("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str708("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str709("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str710("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str711("INITIAL-CONTENTS\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str712("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str713("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str714("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str715("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str716("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str717("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str718("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str719("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str720("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str721("BABEL-SIMPLE-STRINGS-2\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str722("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str723("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str724("EQUAL\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str725("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str726("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str727("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str728("za\C5\BC\C3\B3\C5\82\C4\87 g\C4\99\C5\9Bl\C4\85 ja\C5\BA\C5\84\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str729("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str730("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str731("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str732("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str733("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str734("za\C5\BC\C3\B3\C5\82\C4\87 g\C4\99\C5\9Bl\C4\85 ja\C5\BA\C5\84\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str735("SIMPLE-ARRAY\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str736("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str737("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str738("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str739("T\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str740("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str741("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str742("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str743("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str744("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str745("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str746("*__MLIR_BLOCK_RETFLAG_122791386939392*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str747("*__MLIR_BLOCK_RETMVLIST_122791386939392*\00") : !llvm.array<41 x i8>
}
